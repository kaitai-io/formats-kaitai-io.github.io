import kaitai_struct_nim_runtime
import options

type
  Utf8String* = ref object of KaitaiStruct
    `codepoints`*: seq[Utf8String_Utf8Codepoint]
    `parent`*: KaitaiStruct
  Utf8String_Utf8Codepoint* = ref object of KaitaiStruct
    `byte1`*: uint8
    `byte2`*: uint8
    `byte3`*: uint8
    `byte4`*: uint8
    `parent`*: Utf8String
    `raw1Inst`*: int
    `raw4Inst`*: int
    `raw3Inst`*: int
    `valueAsIntInst`*: int
    `raw2Inst`*: int
    `lenInst`*: int

proc read*(_: typedesc[Utf8String], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Utf8String
proc read*(_: typedesc[Utf8String_Utf8Codepoint], io: KaitaiStream, root: KaitaiStruct, parent: Utf8String): Utf8String_Utf8Codepoint

proc raw1*(this: Utf8String_Utf8Codepoint): int
proc raw4*(this: Utf8String_Utf8Codepoint): int
proc raw3*(this: Utf8String_Utf8Codepoint): int
proc valueAsInt*(this: Utf8String_Utf8Codepoint): int
proc raw2*(this: Utf8String_Utf8Codepoint): int
proc len*(this: Utf8String_Utf8Codepoint): int


##[
UTF-8 is a popular character encoding scheme that allows to
represent strings as sequence of code points defined in Unicode
standard. Its features are:

* variable width (i.e. one code point might be represented by 1 to 4
  bytes)
* backward compatiblity with ASCII
* basic validity checking (and thus distinguishing from other legacy
  8-bit encodings)
* maintaining sort order of codepoints if sorted as a byte array

WARNING: For the vast majority of practical purposes of format
definitions in Kaitai Struct, you'd likely NOT want to use this and
rather just use `type: str` with `encoding: utf-8`. That will use
native string implementations, which are most likely more efficient
and will give you native language strings, rather than an array of
individual codepoints.  This format definition is provided mostly
for educational / research purposes.

]##
proc read*(_: typedesc[Utf8String], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Utf8String =
  template this: untyped = result
  this = new(Utf8String)
  let root = if root == nil: cast[Utf8String](this) else: cast[Utf8String](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Utf8String_Utf8Codepoint.read(this.io, this.root, this)
      this.codepoints.add(it)
      inc i

proc fromFile*(_: typedesc[Utf8String], filename: string): Utf8String =
  Utf8String.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Utf8String_Utf8Codepoint], io: KaitaiStream, root: KaitaiStruct, parent: Utf8String): Utf8String_Utf8Codepoint =
  template this: untyped = result
  this = new(Utf8String_Utf8Codepoint)
  let root = if root == nil: cast[Utf8String](this) else: cast[Utf8String](root)
  this.io = io
  this.root = root
  this.parent = parent

  let byte1Expr = this.io.readU1()
  this.byte1 = byte1Expr
  if this.len >= 2:
    let byte2Expr = this.io.readU1()
    this.byte2 = byte2Expr
  if this.len >= 3:
    let byte3Expr = this.io.readU1()
    this.byte3 = byte3Expr
  if this.len >= 4:
    let byte4Expr = this.io.readU1()
    this.byte4 = byte4Expr

proc raw1(this: Utf8String_Utf8Codepoint): int = 
  if this.raw1Inst != nil:
    return this.raw1Inst
  let raw1InstExpr = int((this.byte1 and (if this.len == 1: 127 else: (if this.len == 2: 31 else: (if this.len == 3: 15 else: (if this.len == 4: 7 else: 0))))))
  this.raw1Inst = raw1InstExpr
  if this.raw1Inst != nil:
    return this.raw1Inst

proc raw4(this: Utf8String_Utf8Codepoint): int = 
  if this.raw4Inst != nil:
    return this.raw4Inst
  if this.len >= 4:
    let raw4InstExpr = int((this.byte4 and 63))
    this.raw4Inst = raw4InstExpr
  if this.raw4Inst != nil:
    return this.raw4Inst

proc raw3(this: Utf8String_Utf8Codepoint): int = 
  if this.raw3Inst != nil:
    return this.raw3Inst
  if this.len >= 3:
    let raw3InstExpr = int((this.byte3 and 63))
    this.raw3Inst = raw3InstExpr
  if this.raw3Inst != nil:
    return this.raw3Inst

proc valueAsInt(this: Utf8String_Utf8Codepoint): int = 
  if this.valueAsIntInst != nil:
    return this.valueAsIntInst
  let valueAsIntInstExpr = int((if this.len == 1: this.raw1 else: (if this.len == 2: ((this.raw1 shl 6) or this.raw2) else: (if this.len == 3: (((this.raw1 shl 12) or (this.raw2 shl 6)) or this.raw3) else: (if this.len == 4: ((((this.raw1 shl 18) or (this.raw2 shl 12)) or (this.raw3 shl 6)) or this.raw4) else: -1)))))
  this.valueAsIntInst = valueAsIntInstExpr
  if this.valueAsIntInst != nil:
    return this.valueAsIntInst

proc raw2(this: Utf8String_Utf8Codepoint): int = 
  if this.raw2Inst != nil:
    return this.raw2Inst
  if this.len >= 2:
    let raw2InstExpr = int((this.byte2 and 63))
    this.raw2Inst = raw2InstExpr
  if this.raw2Inst != nil:
    return this.raw2Inst

proc len(this: Utf8String_Utf8Codepoint): int = 
  if this.lenInst != nil:
    return this.lenInst
  let lenInstExpr = int((if (this.byte1 and 128) == 0: 1 else: (if (this.byte1 and 224) == 192: 2 else: (if (this.byte1 and 240) == 224: 3 else: (if (this.byte1 and 248) == 240: 4 else: -1)))))
  this.lenInst = lenInstExpr
  if this.lenInst != nil:
    return this.lenInst

proc fromFile*(_: typedesc[Utf8String_Utf8Codepoint], filename: string): Utf8String_Utf8Codepoint =
  Utf8String_Utf8Codepoint.read(newKaitaiFileStream(filename), nil, nil)


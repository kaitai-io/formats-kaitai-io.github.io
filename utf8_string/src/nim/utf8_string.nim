import kaitai_struct_nim_runtime
import options

type
  Utf8String* = ref object of KaitaiStruct
    `codepoints`*: seq[Utf8String_Utf8Codepoint]
    `parent`*: KaitaiStruct
  Utf8String_Utf8Codepoint* = ref object of KaitaiStruct
    `bytes`*: seq[byte]
    `ofs`*: uint64
    `parent`*: Utf8String
    `raw1Inst`: int
    `raw1InstFlag`: bool
    `lenBytesInst`: int
    `lenBytesInstFlag`: bool
    `raw3Inst`: int
    `raw3InstFlag`: bool
    `valueAsIntInst`: int
    `valueAsIntInstFlag`: bool
    `raw0Inst`: int
    `raw0InstFlag`: bool
    `byte0Inst`: uint8
    `byte0InstFlag`: bool
    `raw2Inst`: int
    `raw2InstFlag`: bool

proc read*(_: typedesc[Utf8String], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Utf8String
proc read*(_: typedesc[Utf8String_Utf8Codepoint], io: KaitaiStream, root: KaitaiStruct, parent: Utf8String, ofs: any): Utf8String_Utf8Codepoint

proc raw1*(this: Utf8String_Utf8Codepoint): int
proc lenBytes*(this: Utf8String_Utf8Codepoint): int
proc raw3*(this: Utf8String_Utf8Codepoint): int
proc valueAsInt*(this: Utf8String_Utf8Codepoint): int
proc raw0*(this: Utf8String_Utf8Codepoint): int
proc byte0*(this: Utf8String_Utf8Codepoint): uint8
proc raw2*(this: Utf8String_Utf8Codepoint): int


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
      let it = Utf8String_Utf8Codepoint.read(this.io, this.root, this, this.io.pos)
      this.codepoints.add(it)
      inc i

proc fromFile*(_: typedesc[Utf8String], filename: string): Utf8String =
  Utf8String.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Utf8String_Utf8Codepoint], io: KaitaiStream, root: KaitaiStruct, parent: Utf8String, ofs: any): Utf8String_Utf8Codepoint =
  template this: untyped = result
  this = new(Utf8String_Utf8Codepoint)
  let root = if root == nil: cast[Utf8String](this) else: cast[Utf8String](root)
  this.io = io
  this.root = root
  this.parent = parent
  let ofsExpr = uint64(ofs)
  this.ofs = ofsExpr

  let bytesExpr = this.io.readBytes(int(this.lenBytes))
  this.bytes = bytesExpr

proc raw1(this: Utf8String_Utf8Codepoint): int = 
  if this.raw1InstFlag:
    return this.raw1Inst
  if this.lenBytes >= 2:
    let raw1InstExpr = int((this.bytes[1] and 63))
    this.raw1Inst = raw1InstExpr
  this.raw1InstFlag = true
  return this.raw1Inst

proc lenBytes(this: Utf8String_Utf8Codepoint): int = 
  if this.lenBytesInstFlag:
    return this.lenBytesInst
  let lenBytesInstExpr = int((if (this.byte0 and 128) == 0: 1 else: (if (this.byte0 and 224) == 192: 2 else: (if (this.byte0 and 240) == 224: 3 else: (if (this.byte0 and 248) == 240: 4 else: -1)))))
  this.lenBytesInst = lenBytesInstExpr
  this.lenBytesInstFlag = true
  return this.lenBytesInst

proc raw3(this: Utf8String_Utf8Codepoint): int = 
  if this.raw3InstFlag:
    return this.raw3Inst
  if this.lenBytes >= 4:
    let raw3InstExpr = int((this.bytes[3] and 63))
    this.raw3Inst = raw3InstExpr
  this.raw3InstFlag = true
  return this.raw3Inst

proc valueAsInt(this: Utf8String_Utf8Codepoint): int = 
  if this.valueAsIntInstFlag:
    return this.valueAsIntInst
  let valueAsIntInstExpr = int((if this.lenBytes == 1: this.raw0 else: (if this.lenBytes == 2: ((this.raw0 shl 6) or this.raw1) else: (if this.lenBytes == 3: (((this.raw0 shl 12) or (this.raw1 shl 6)) or this.raw2) else: (if this.lenBytes == 4: ((((this.raw0 shl 18) or (this.raw1 shl 12)) or (this.raw2 shl 6)) or this.raw3) else: -1)))))
  this.valueAsIntInst = valueAsIntInstExpr
  this.valueAsIntInstFlag = true
  return this.valueAsIntInst

proc raw0(this: Utf8String_Utf8Codepoint): int = 
  if this.raw0InstFlag:
    return this.raw0Inst
  let raw0InstExpr = int((this.bytes[0] and (if this.lenBytes == 1: 127 else: (if this.lenBytes == 2: 31 else: (if this.lenBytes == 3: 15 else: (if this.lenBytes == 4: 7 else: 0))))))
  this.raw0Inst = raw0InstExpr
  this.raw0InstFlag = true
  return this.raw0Inst

proc byte0(this: Utf8String_Utf8Codepoint): uint8 = 
  if this.byte0InstFlag:
    return this.byte0Inst
  let pos = this.io.pos()
  this.io.seek(int(this.ofs))
  let byte0InstExpr = this.io.readU1()
  this.byte0Inst = byte0InstExpr
  this.io.seek(pos)
  this.byte0InstFlag = true
  return this.byte0Inst

proc raw2(this: Utf8String_Utf8Codepoint): int = 
  if this.raw2InstFlag:
    return this.raw2Inst
  if this.lenBytes >= 3:
    let raw2InstExpr = int((this.bytes[2] and 63))
    this.raw2Inst = raw2InstExpr
  this.raw2InstFlag = true
  return this.raw2Inst

proc fromFile*(_: typedesc[Utf8String_Utf8Codepoint], filename: string): Utf8String_Utf8Codepoint =
  Utf8String_Utf8Codepoint.read(newKaitaiFileStream(filename), nil, nil)


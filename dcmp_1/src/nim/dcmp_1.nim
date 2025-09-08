import kaitai_struct_nim_runtime
import options
import dcmp_variable_length_integer

type
  Dcmp1* = ref object of KaitaiStruct
    `chunks`*: seq[Dcmp1_Chunk]
    `parent`*: KaitaiStruct
  Dcmp1_Chunk* = ref object of KaitaiStruct
    `tag`*: uint8
    `body`*: KaitaiStruct
    `parent`*: Dcmp1
  Dcmp1_Chunk_TagKind* = enum
    invalid = -1
    literal = 0
    backreference = 1
    table_lookup = 2
    extended = 3
    end = 4
  Dcmp1_Chunk_BackreferenceBody* = ref object of KaitaiStruct
    `indexSeparateMinus`*: uint8
    `tag`*: uint8
    `parent`*: Dcmp1_Chunk
    `indexInst`: int
    `indexInstFlag`: bool
    `indexInTagInst`: int
    `indexInTagInstFlag`: bool
    `indexSeparateInst`: int
    `indexSeparateInstFlag`: bool
    `isIndexSeparateInst`: bool
    `isIndexSeparateInstFlag`: bool
  Dcmp1_Chunk_EndBody* = ref object of KaitaiStruct
    `parent`*: Dcmp1_Chunk
  Dcmp1_Chunk_ExtendedBody* = ref object of KaitaiStruct
    `tag`*: uint8
    `body`*: Dcmp1_Chunk_ExtendedBody_RepeatBody
    `parent`*: Dcmp1_Chunk
  Dcmp1_Chunk_ExtendedBody_RepeatBody* = ref object of KaitaiStruct
    `toRepeatRaw`*: DcmpVariableLengthInteger
    `repeatCountM1Raw`*: DcmpVariableLengthInteger
    `parent`*: Dcmp1_Chunk_ExtendedBody
    `repeatCountInst`: int
    `repeatCountInstFlag`: bool
    `repeatCountM1Inst`: int
    `repeatCountM1InstFlag`: bool
    `toRepeatInst`: int
    `toRepeatInstFlag`: bool
  Dcmp1_Chunk_LiteralBody* = ref object of KaitaiStruct
    `lenLiteralSeparate`*: uint8
    `literal`*: seq[byte]
    `tag`*: uint8
    `parent`*: Dcmp1_Chunk
    `doStoreInst`: bool
    `doStoreInstFlag`: bool
    `isLenLiteralSeparateInst`: bool
    `isLenLiteralSeparateInstFlag`: bool
    `lenLiteralInst`: int
    `lenLiteralInstFlag`: bool
    `lenLiteralM1InTagInst`: int
    `lenLiteralM1InTagInstFlag`: bool
  Dcmp1_Chunk_TableLookupBody* = ref object of KaitaiStruct
    `tag`*: uint8
    `parent`*: Dcmp1_Chunk
    `lookupTableInst`: seq[seq[byte]]
    `lookupTableInstFlag`: bool
    `valueInst`: seq[byte]
    `valueInstFlag`: bool

proc read*(_: typedesc[Dcmp1], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Dcmp1
proc read*(_: typedesc[Dcmp1_Chunk], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp1): Dcmp1_Chunk
proc read*(_: typedesc[Dcmp1_Chunk_BackreferenceBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp1_Chunk, tag: any): Dcmp1_Chunk_BackreferenceBody
proc read*(_: typedesc[Dcmp1_Chunk_EndBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp1_Chunk): Dcmp1_Chunk_EndBody
proc read*(_: typedesc[Dcmp1_Chunk_ExtendedBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp1_Chunk): Dcmp1_Chunk_ExtendedBody
proc read*(_: typedesc[Dcmp1_Chunk_ExtendedBody_RepeatBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp1_Chunk_ExtendedBody): Dcmp1_Chunk_ExtendedBody_RepeatBody
proc read*(_: typedesc[Dcmp1_Chunk_LiteralBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp1_Chunk, tag: any): Dcmp1_Chunk_LiteralBody
proc read*(_: typedesc[Dcmp1_Chunk_TableLookupBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp1_Chunk, tag: any): Dcmp1_Chunk_TableLookupBody

proc index*(this: Dcmp1_Chunk_BackreferenceBody): int
proc indexInTag*(this: Dcmp1_Chunk_BackreferenceBody): int
proc indexSeparate*(this: Dcmp1_Chunk_BackreferenceBody): int
proc isIndexSeparate*(this: Dcmp1_Chunk_BackreferenceBody): bool
proc repeatCount*(this: Dcmp1_Chunk_ExtendedBody_RepeatBody): int
proc repeatCountM1*(this: Dcmp1_Chunk_ExtendedBody_RepeatBody): int
proc toRepeat*(this: Dcmp1_Chunk_ExtendedBody_RepeatBody): int
proc doStore*(this: Dcmp1_Chunk_LiteralBody): bool
proc isLenLiteralSeparate*(this: Dcmp1_Chunk_LiteralBody): bool
proc lenLiteral*(this: Dcmp1_Chunk_LiteralBody): int
proc lenLiteralM1InTag*(this: Dcmp1_Chunk_LiteralBody): int
proc lookupTable*(this: Dcmp1_Chunk_TableLookupBody): seq[seq[byte]]
proc value*(this: Dcmp1_Chunk_TableLookupBody): seq[byte]


##[
Compressed resource data in `'dcmp' (1)` format,
as stored in compressed resources with header type `8` and decompressor ID `1`.

The `'dcmp' (1)` decompressor resource is included in the System file of System 7.0 and later.
This compression format is used for a few compressed resources in System 7.0's files
(such as the Finder Help file).
This decompressor is also included with and used by some other Apple applications,
such as ResEdit.
(Note: ResEdit includes the `'dcmp' (1)` resource,
but none of its resources actually use this decompressor.)

This compression format supports some basic general-purpose compression schemes,
including backreferences to previous data and run-length encoding.
It also includes some types of compression tailored specifically to Mac OS resources,
including a set of single-byte codes that correspond to entries in a hard-coded lookup table.

The `'dcmp' (0)` compression format (see dcmp_0.ksy) is very similar to this format,
with the main difference that it operates mostly on units of 2 or 4 bytes.
This makes the ``dcmp' (0)` format more suitable for word-aligned data,
such as executable code, bitmaps, sounds, etc.
The `'dcmp' (0)` format also appears to be generally preferred over `'dcmp' (1)`,
with the latter only being used in resource files that contain mostly unaligned data,
such as text.

@see <a href="https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/dcmp1.py">Source</a>
]##
proc read*(_: typedesc[Dcmp1], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Dcmp1 =
  template this: untyped = result
  this = new(Dcmp1)
  let root = if root == nil: cast[Dcmp1](this) else: cast[Dcmp1](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The sequence of chunks that make up the compressed data.

  ]##
  block:
    var i: int
    while true:
      let it = Dcmp1_Chunk.read(this.io, this.root, this)
      this.chunks.add(it)
      if it.tag == 255:
        break
      inc i

proc fromFile*(_: typedesc[Dcmp1], filename: string): Dcmp1 =
  Dcmp1.read(newKaitaiFileStream(filename), nil, nil)


##[
A single chunk of compressed data.
Each chunk in the compressed data expands to a sequence of bytes in the uncompressed data,
except when `tag == 0xff`,
which marks the end of the data and does not correspond to any bytes in the uncompressed data.

Most chunks are stateless and always expand to the same data,
regardless of where the chunk appears in the sequence.
However,
some chunks affect the behavior of future chunks,
or expand to different data depending on which chunks came before them.

]##
proc read*(_: typedesc[Dcmp1_Chunk], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp1): Dcmp1_Chunk =
  template this: untyped = result
  this = new(Dcmp1_Chunk)
  let root = if root == nil: cast[Dcmp1](this) else: cast[Dcmp1](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The chunk's tag byte.
This controls the structure of the body and the meaning of the chunk.

  ]##
  let tagExpr = this.io.readU1()
  this.tag = tagExpr

  ##[
  The chunk's body.

Certain chunks do not have any data following the tag byte.
In this case,
the body is a zero-length structure.

  ]##
  block:
    let on = (if  ((this.tag >= 0) and (this.tag <= 31)) : dcmp_1.literal else: (if  ((this.tag >= 32) and (this.tag <= 207)) : dcmp_1.backreference else: (if  ((this.tag >= 208) and (this.tag <= 209)) : dcmp_1.literal else: (if this.tag == 210: dcmp_1.backreference else: (if  ((this.tag >= 213) and (this.tag <= 253)) : dcmp_1.table_lookup else: (if this.tag == 254: dcmp_1.extended else: (if this.tag == 255: dcmp_1.end else: dcmp_1.invalid)))))))
    if on == dcmp_1.backreference:
      let bodyExpr = Dcmp1_Chunk_BackreferenceBody.read(this.io, this.root, this, this.tag)
      this.body = bodyExpr
    elif on == dcmp_1.end:
      let bodyExpr = Dcmp1_Chunk_EndBody.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == dcmp_1.extended:
      let bodyExpr = Dcmp1_Chunk_ExtendedBody.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == dcmp_1.literal:
      let bodyExpr = Dcmp1_Chunk_LiteralBody.read(this.io, this.root, this, this.tag)
      this.body = bodyExpr
    elif on == dcmp_1.table_lookup:
      let bodyExpr = Dcmp1_Chunk_TableLookupBody.read(this.io, this.root, this, this.tag)
      this.body = bodyExpr

proc fromFile*(_: typedesc[Dcmp1_Chunk], filename: string): Dcmp1_Chunk =
  Dcmp1_Chunk.read(newKaitaiFileStream(filename), nil, nil)


##[
The body of a backreference chunk.

This chunk expands to the data stored in a preceding literal chunk,
indicated by an index number (`index`).

]##
proc read*(_: typedesc[Dcmp1_Chunk_BackreferenceBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp1_Chunk, tag: any): Dcmp1_Chunk_BackreferenceBody =
  template this: untyped = result
  this = new(Dcmp1_Chunk_BackreferenceBody)
  let root = if root == nil: cast[Dcmp1](this) else: cast[Dcmp1](root)
  this.io = io
  this.root = root
  this.parent = parent
  let tagExpr = uint8(tag)
  this.tag = tagExpr


  ##[
  The index of the referenced literal chunk,
stored separately from the tag.
The value in this field is stored minus 0xb0.

This field is only present if the tag byte is 0xd2.
For other tag bytes,
the index is encoded in the tag byte.
Values smaller than 0xb0 cannot be stored in this field,
they must always be encoded in the tag byte.

  ]##
  if this.isIndexSeparate:
    let indexSeparateMinusExpr = this.io.readU1()
    this.indexSeparateMinus = indexSeparateMinusExpr

proc index(this: Dcmp1_Chunk_BackreferenceBody): int = 

  ##[
  The index of the referenced literal chunk.

Stored literals are assigned index numbers in the order in which they appear in the compressed data,
starting at 0.
Non-stored literals are not counted in the numbering and cannot be referenced using backreferences.
Once an index is assigned to a stored literal,
it is never changed or unassigned for the entire length of the compressed data.

As the name indicates,
a backreference can only reference stored literal chunks found *before* the backreference,
not ones that come after it.

  ]##
  if this.indexInstFlag:
    return this.indexInst
  let indexInstExpr = int((if this.isIndexSeparate: this.indexSeparate else: this.indexInTag))
  this.indexInst = indexInstExpr
  this.indexInstFlag = true
  return this.indexInst

proc indexInTag(this: Dcmp1_Chunk_BackreferenceBody): int = 

  ##[
  The index of the referenced literal chunk,
as stored in the tag byte.

  ]##
  if this.indexInTagInstFlag:
    return this.indexInTagInst
  let indexInTagInstExpr = int(this.tag - 32)
  this.indexInTagInst = indexInTagInstExpr
  this.indexInTagInstFlag = true
  return this.indexInTagInst

proc indexSeparate(this: Dcmp1_Chunk_BackreferenceBody): int = 

  ##[
  The index of the referenced literal chunk,
as stored separately from the tag byte,
with the implicit offset corrected for.

  ]##
  if this.indexSeparateInstFlag:
    return this.indexSeparateInst
  if this.isIndexSeparate:
    let indexSeparateInstExpr = int(this.indexSeparateMinus + 176)
    this.indexSeparateInst = indexSeparateInstExpr
  this.indexSeparateInstFlag = true
  return this.indexSeparateInst

proc isIndexSeparate(this: Dcmp1_Chunk_BackreferenceBody): bool = 

  ##[
  Whether the index is stored separately from the tag.

  ]##
  if this.isIndexSeparateInstFlag:
    return this.isIndexSeparateInst
  let isIndexSeparateInstExpr = bool(this.tag == 210)
  this.isIndexSeparateInst = isIndexSeparateInstExpr
  this.isIndexSeparateInstFlag = true
  return this.isIndexSeparateInst

proc fromFile*(_: typedesc[Dcmp1_Chunk_BackreferenceBody], filename: string): Dcmp1_Chunk_BackreferenceBody =
  Dcmp1_Chunk_BackreferenceBody.read(newKaitaiFileStream(filename), nil, nil)


##[
The body of an end chunk.
This body is always empty.

The last chunk in the compressed data must always be an end chunk.
An end chunk cannot appear elsewhere in the compressed data.

]##
proc read*(_: typedesc[Dcmp1_Chunk_EndBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp1_Chunk): Dcmp1_Chunk_EndBody =
  template this: untyped = result
  this = new(Dcmp1_Chunk_EndBody)
  let root = if root == nil: cast[Dcmp1](this) else: cast[Dcmp1](root)
  this.io = io
  this.root = root
  this.parent = parent


proc fromFile*(_: typedesc[Dcmp1_Chunk_EndBody], filename: string): Dcmp1_Chunk_EndBody =
  Dcmp1_Chunk_EndBody.read(newKaitaiFileStream(filename), nil, nil)


##[
The body of an extended chunk.
The meaning of this chunk depends on the extended tag byte stored in the chunk data.

]##
proc read*(_: typedesc[Dcmp1_Chunk_ExtendedBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp1_Chunk): Dcmp1_Chunk_ExtendedBody =
  template this: untyped = result
  this = new(Dcmp1_Chunk_ExtendedBody)
  let root = if root == nil: cast[Dcmp1](this) else: cast[Dcmp1](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The chunk's extended tag byte.
This controls the structure of the body and the meaning of the chunk.

  ]##
  let tagExpr = this.io.readU1()
  this.tag = tagExpr

  ##[
  The chunk's body.

  ]##
  block:
    let on = this.tag
    if on == 2:
      let bodyExpr = Dcmp1_Chunk_ExtendedBody_RepeatBody.read(this.io, this.root, this)
      this.body = bodyExpr

proc fromFile*(_: typedesc[Dcmp1_Chunk_ExtendedBody], filename: string): Dcmp1_Chunk_ExtendedBody =
  Dcmp1_Chunk_ExtendedBody.read(newKaitaiFileStream(filename), nil, nil)


##[
The body of a repeat chunk.

This chunk expands to the same byte repeated a number of times,
i. e. it implements a form of run-length encoding.

]##
proc read*(_: typedesc[Dcmp1_Chunk_ExtendedBody_RepeatBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp1_Chunk_ExtendedBody): Dcmp1_Chunk_ExtendedBody_RepeatBody =
  template this: untyped = result
  this = new(Dcmp1_Chunk_ExtendedBody_RepeatBody)
  let root = if root == nil: cast[Dcmp1](this) else: cast[Dcmp1](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Raw variable-length integer representation of `to_repeat`.

  ]##
  let toRepeatRawExpr = DcmpVariableLengthInteger.read(this.io, nil, nil)
  this.toRepeatRaw = toRepeatRawExpr

  ##[
  Raw variable-length integer representation of `repeat_count_m1`.

  ]##
  let repeatCountM1RawExpr = DcmpVariableLengthInteger.read(this.io, nil, nil)
  this.repeatCountM1Raw = repeatCountM1RawExpr

proc repeatCount(this: Dcmp1_Chunk_ExtendedBody_RepeatBody): int = 

  ##[
  The number of times to repeat the value.

This value must be positive.

  ]##
  if this.repeatCountInstFlag:
    return this.repeatCountInst
  let repeatCountInstExpr = int(this.repeatCountM1 + 1)
  this.repeatCountInst = repeatCountInstExpr
  this.repeatCountInstFlag = true
  return this.repeatCountInst

proc repeatCountM1(this: Dcmp1_Chunk_ExtendedBody_RepeatBody): int = 

  ##[
  The number of times to repeat the value,
minus one.

This value must not be negative.

  ]##
  if this.repeatCountM1InstFlag:
    return this.repeatCountM1Inst
  let repeatCountM1InstExpr = int(this.repeatCountM1Raw.value)
  this.repeatCountM1Inst = repeatCountM1InstExpr
  this.repeatCountM1InstFlag = true
  return this.repeatCountM1Inst

proc toRepeat(this: Dcmp1_Chunk_ExtendedBody_RepeatBody): int = 

  ##[
  The value to repeat.

Although it is stored as a variable-length integer,
this value must fit into an unsigned 8-bit integer.

  ]##
  if this.toRepeatInstFlag:
    return this.toRepeatInst
  let toRepeatInstExpr = int(this.toRepeatRaw.value)
  this.toRepeatInst = toRepeatInstExpr
  this.toRepeatInstFlag = true
  return this.toRepeatInst

proc fromFile*(_: typedesc[Dcmp1_Chunk_ExtendedBody_RepeatBody], filename: string): Dcmp1_Chunk_ExtendedBody_RepeatBody =
  Dcmp1_Chunk_ExtendedBody_RepeatBody.read(newKaitaiFileStream(filename), nil, nil)


##[
The body of a literal data chunk.

The data that this chunk expands to is stored literally in the body (`literal`).
Optionally,
the literal data may also be stored for use by future backreference chunks (`do_store`).

]##
proc read*(_: typedesc[Dcmp1_Chunk_LiteralBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp1_Chunk, tag: any): Dcmp1_Chunk_LiteralBody =
  template this: untyped = result
  this = new(Dcmp1_Chunk_LiteralBody)
  let root = if root == nil: cast[Dcmp1](this) else: cast[Dcmp1](root)
  this.io = io
  this.root = root
  this.parent = parent
  let tagExpr = uint8(tag)
  this.tag = tagExpr


  ##[
  The length of the literal data,
in bytes.

This field is only present if the tag byte is 0xd0 or 0xd1.
In practice,
this only happens if the length is 0x11 or greater,
because smaller lengths can be encoded into the tag byte.

  ]##
  if this.isLenLiteralSeparate:
    let lenLiteralSeparateExpr = this.io.readU1()
    this.lenLiteralSeparate = lenLiteralSeparateExpr

  ##[
  The literal data.

  ]##
  let literalExpr = this.io.readBytes(int(this.lenLiteral))
  this.literal = literalExpr

proc doStore(this: Dcmp1_Chunk_LiteralBody): bool = 

  ##[
  Whether this literal should be stored for use by future backreference chunks.

See the documentation of the `backreference_body` type for details about backreference chunks.

  ]##
  if this.doStoreInstFlag:
    return this.doStoreInst
  let doStoreInstExpr = bool((if this.isLenLiteralSeparate: this.tag == 209 else: (this.tag and 16) != 0))
  this.doStoreInst = doStoreInstExpr
  this.doStoreInstFlag = true
  return this.doStoreInst

proc isLenLiteralSeparate(this: Dcmp1_Chunk_LiteralBody): bool = 

  ##[
  Whether the length of the literal is stored separately from the tag.

  ]##
  if this.isLenLiteralSeparateInstFlag:
    return this.isLenLiteralSeparateInst
  let isLenLiteralSeparateInstExpr = bool(this.tag >= 208)
  this.isLenLiteralSeparateInst = isLenLiteralSeparateInstExpr
  this.isLenLiteralSeparateInstFlag = true
  return this.isLenLiteralSeparateInst

proc lenLiteral(this: Dcmp1_Chunk_LiteralBody): int = 

  ##[
  The length of the literal data,
in bytes.

In practice,
this value is always greater than zero,
as there is no use in storing a zero-length literal.

  ]##
  if this.lenLiteralInstFlag:
    return this.lenLiteralInst
  let lenLiteralInstExpr = int((if this.isLenLiteralSeparate: this.lenLiteralSeparate else: this.lenLiteralM1InTag + 1))
  this.lenLiteralInst = lenLiteralInstExpr
  this.lenLiteralInstFlag = true
  return this.lenLiteralInst

proc lenLiteralM1InTag(this: Dcmp1_Chunk_LiteralBody): int = 

  ##[
  The part of the tag byte that indicates the length of the literal data,
in bytes,
minus one.

If the tag byte is 0xd0 or 0xd1,
the length is stored in a separate byte after the tag byte and before the literal data.

  ]##
  if this.lenLiteralM1InTagInstFlag:
    return this.lenLiteralM1InTagInst
  if not(this.isLenLiteralSeparate):
    let lenLiteralM1InTagInstExpr = int(this.tag and 15)
    this.lenLiteralM1InTagInst = lenLiteralM1InTagInstExpr
  this.lenLiteralM1InTagInstFlag = true
  return this.lenLiteralM1InTagInst

proc fromFile*(_: typedesc[Dcmp1_Chunk_LiteralBody], filename: string): Dcmp1_Chunk_LiteralBody =
  Dcmp1_Chunk_LiteralBody.read(newKaitaiFileStream(filename), nil, nil)


##[
The body of a table lookup chunk.
This body is always empty.

This chunk always expands to two bytes (`value`),
determined from the tag byte using a fixed lookup table (`lookup_table`).
This lookup table is hardcoded in the decompressor and always the same for all compressed data.

]##
proc read*(_: typedesc[Dcmp1_Chunk_TableLookupBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp1_Chunk, tag: any): Dcmp1_Chunk_TableLookupBody =
  template this: untyped = result
  this = new(Dcmp1_Chunk_TableLookupBody)
  let root = if root == nil: cast[Dcmp1](this) else: cast[Dcmp1](root)
  this.io = io
  this.root = root
  this.parent = parent
  let tagExpr = uint8(tag)
  this.tag = tagExpr


proc lookupTable(this: Dcmp1_Chunk_TableLookupBody): seq[seq[byte]] = 

  ##[
  Fixed lookup table that maps tag byte numbers to two bytes each.

The entries in the lookup table are offset -
index 0 stands for tag 0xd5, 1 for 0xd6, etc.

  ]##
  if this.lookupTableInstFlag:
    return this.lookupTableInst
  let lookupTableInstExpr = seq[seq[byte]](@[seq[byte](@[0'u8, 0'u8]), seq[byte](@[0'u8, 1'u8]), seq[byte](@[0'u8, 2'u8]), seq[byte](@[0'u8, 3'u8]), seq[byte](@[46'u8, 1'u8]), seq[byte](@[62'u8, 1'u8]), seq[byte](@[1'u8, 1'u8]), seq[byte](@[30'u8, 1'u8]), seq[byte](@[255'u8, 255'u8]), seq[byte](@[14'u8, 1'u8]), seq[byte](@[49'u8, 0'u8]), seq[byte](@[17'u8, 18'u8]), seq[byte](@[1'u8, 7'u8]), seq[byte](@[51'u8, 50'u8]), seq[byte](@[18'u8, 57'u8]), seq[byte](@[237'u8, 16'u8]), seq[byte](@[1'u8, 39'u8]), seq[byte](@[35'u8, 34'u8]), seq[byte](@[1'u8, 55'u8]), seq[byte](@[7'u8, 6'u8]), seq[byte](@[1'u8, 23'u8]), seq[byte](@[1'u8, 35'u8]), seq[byte](@[0'u8, 255'u8]), seq[byte](@[0'u8, 47'u8]), seq[byte](@[7'u8, 14'u8]), seq[byte](@[253'u8, 60'u8]), seq[byte](@[1'u8, 53'u8]), seq[byte](@[1'u8, 21'u8]), seq[byte](@[1'u8, 2'u8]), seq[byte](@[0'u8, 7'u8]), seq[byte](@[0'u8, 62'u8]), seq[byte](@[5'u8, 213'u8]), seq[byte](@[2'u8, 1'u8]), seq[byte](@[6'u8, 7'u8]), seq[byte](@[7'u8, 8'u8]), seq[byte](@[48'u8, 1'u8]), seq[byte](@[1'u8, 51'u8]), seq[byte](@[0'u8, 16'u8]), seq[byte](@[23'u8, 22'u8]), seq[byte](@[55'u8, 62'u8]), seq[byte](@[54'u8, 55'u8])])
  this.lookupTableInst = lookupTableInstExpr
  this.lookupTableInstFlag = true
  return this.lookupTableInst

proc value(this: Dcmp1_Chunk_TableLookupBody): seq[byte] = 

  ##[
  The two bytes that the tag byte expands to,
based on the fixed lookup table.

  ]##
  if this.valueInstFlag:
    return this.valueInst
  let valueInstExpr = seq[byte](this.lookupTable[this.tag - 213])
  this.valueInst = valueInstExpr
  this.valueInstFlag = true
  return this.valueInst

proc fromFile*(_: typedesc[Dcmp1_Chunk_TableLookupBody], filename: string): Dcmp1_Chunk_TableLookupBody =
  Dcmp1_Chunk_TableLookupBody.read(newKaitaiFileStream(filename), nil, nil)


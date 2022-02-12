import kaitai_struct_nim_runtime
import options
import dcmp_variable_length_integer

import "dcmp_variable_length_integer"
type
  Dcmp0* = ref object of KaitaiStruct
    `chunks`*: seq[Dcmp0_Chunk]
    `parent`*: KaitaiStruct
  Dcmp0_Chunk* = ref object of KaitaiStruct
    `tag`*: uint8
    `body`*: KaitaiStruct
    `parent`*: Dcmp0
  Dcmp0_Chunk_TagKind* = enum
    invalid = -1
    literal = 0
    backreference = 1
    table_lookup = 2
    extended = 3
    end = 4
  Dcmp0_Chunk_LiteralBody* = ref object of KaitaiStruct
    `lenLiteralDiv2Separate`*: uint8
    `literal`*: seq[byte]
    `tag`*: uint8
    `parent`*: Dcmp0_Chunk
    `doStoreInst`*: bool
    `lenLiteralDiv2Inst`*: int
    `lenLiteralInst`*: int
    `lenLiteralDiv2InTagInst`*: int
    `isLenLiteralDiv2SeparateInst`*: bool
  Dcmp0_Chunk_BackreferenceBody* = ref object of KaitaiStruct
    `indexSeparateMinus`*: uint16
    `tag`*: uint8
    `parent`*: Dcmp0_Chunk
    `isIndexSeparateInst`*: bool
    `indexInTagInst`*: int
    `indexSeparateInst`*: int
    `indexInst`*: int
  Dcmp0_Chunk_TableLookupBody* = ref object of KaitaiStruct
    `tag`*: uint8
    `parent`*: Dcmp0_Chunk
    `lookupTableInst`*: seq[seq[byte]]
    `valueInst`*: seq[byte]
  Dcmp0_Chunk_EndBody* = ref object of KaitaiStruct
    `parent`*: Dcmp0_Chunk
  Dcmp0_Chunk_ExtendedBody* = ref object of KaitaiStruct
    `tag`*: uint8
    `body`*: KaitaiStruct
    `parent`*: Dcmp0_Chunk
  Dcmp0_Chunk_ExtendedBody_JumpTableBody* = ref object of KaitaiStruct
    `segmentNumberRaw`*: DcmpVariableLengthInteger
    `numAddressesRaw`*: DcmpVariableLengthInteger
    `addressesRaw`*: seq[DcmpVariableLengthInteger]
    `parent`*: Dcmp0_Chunk_ExtendedBody
    `segmentNumberInst`*: int
    `numAddressesInst`*: int
  Dcmp0_Chunk_ExtendedBody_RepeatBody* = ref object of KaitaiStruct
    `toRepeatRaw`*: DcmpVariableLengthInteger
    `repeatCountM1Raw`*: DcmpVariableLengthInteger
    `tag`*: uint8
    `parent`*: Dcmp0_Chunk_ExtendedBody
    `byteCountInst`*: int
    `toRepeatInst`*: int
    `repeatCountM1Inst`*: int
    `repeatCountInst`*: int
  Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody* = ref object of KaitaiStruct
    `firstValueRaw`*: DcmpVariableLengthInteger
    `numDeltasRaw`*: DcmpVariableLengthInteger
    `deltas`*: seq[int8]
    `parent`*: Dcmp0_Chunk_ExtendedBody
    `firstValueInst`*: int
    `numDeltasInst`*: int
  Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody* = ref object of KaitaiStruct
    `firstValueRaw`*: DcmpVariableLengthInteger
    `numDeltasRaw`*: DcmpVariableLengthInteger
    `deltasRaw`*: seq[DcmpVariableLengthInteger]
    `parent`*: Dcmp0_Chunk_ExtendedBody
    `firstValueInst`*: int
    `numDeltasInst`*: int

proc read*(_: typedesc[Dcmp0], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Dcmp0
proc read*(_: typedesc[Dcmp0_Chunk], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp0): Dcmp0_Chunk
proc read*(_: typedesc[Dcmp0_Chunk_LiteralBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp0_Chunk, tag: any): Dcmp0_Chunk_LiteralBody
proc read*(_: typedesc[Dcmp0_Chunk_BackreferenceBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp0_Chunk, tag: any): Dcmp0_Chunk_BackreferenceBody
proc read*(_: typedesc[Dcmp0_Chunk_TableLookupBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp0_Chunk, tag: any): Dcmp0_Chunk_TableLookupBody
proc read*(_: typedesc[Dcmp0_Chunk_EndBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp0_Chunk): Dcmp0_Chunk_EndBody
proc read*(_: typedesc[Dcmp0_Chunk_ExtendedBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp0_Chunk): Dcmp0_Chunk_ExtendedBody
proc read*(_: typedesc[Dcmp0_Chunk_ExtendedBody_JumpTableBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp0_Chunk_ExtendedBody): Dcmp0_Chunk_ExtendedBody_JumpTableBody
proc read*(_: typedesc[Dcmp0_Chunk_ExtendedBody_RepeatBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp0_Chunk_ExtendedBody, tag: any): Dcmp0_Chunk_ExtendedBody_RepeatBody
proc read*(_: typedesc[Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp0_Chunk_ExtendedBody): Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody
proc read*(_: typedesc[Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp0_Chunk_ExtendedBody): Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody

proc doStore*(this: Dcmp0_Chunk_LiteralBody): bool
proc lenLiteralDiv2*(this: Dcmp0_Chunk_LiteralBody): int
proc lenLiteral*(this: Dcmp0_Chunk_LiteralBody): int
proc lenLiteralDiv2InTag*(this: Dcmp0_Chunk_LiteralBody): int
proc isLenLiteralDiv2Separate*(this: Dcmp0_Chunk_LiteralBody): bool
proc isIndexSeparate*(this: Dcmp0_Chunk_BackreferenceBody): bool
proc indexInTag*(this: Dcmp0_Chunk_BackreferenceBody): int
proc indexSeparate*(this: Dcmp0_Chunk_BackreferenceBody): int
proc index*(this: Dcmp0_Chunk_BackreferenceBody): int
proc lookupTable*(this: Dcmp0_Chunk_TableLookupBody): seq[seq[byte]]
proc value*(this: Dcmp0_Chunk_TableLookupBody): seq[byte]
proc segmentNumber*(this: Dcmp0_Chunk_ExtendedBody_JumpTableBody): int
proc numAddresses*(this: Dcmp0_Chunk_ExtendedBody_JumpTableBody): int
proc byteCount*(this: Dcmp0_Chunk_ExtendedBody_RepeatBody): int
proc toRepeat*(this: Dcmp0_Chunk_ExtendedBody_RepeatBody): int
proc repeatCountM1*(this: Dcmp0_Chunk_ExtendedBody_RepeatBody): int
proc repeatCount*(this: Dcmp0_Chunk_ExtendedBody_RepeatBody): int
proc firstValue*(this: Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody): int
proc numDeltas*(this: Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody): int
proc firstValue*(this: Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody): int
proc numDeltas*(this: Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody): int


##[
Compressed resource data in `'dcmp' (0)` format,
as stored in compressed resources with header type `8` and decompressor ID `0`.

The `'dcmp' (0)` decompressor resource is included in the System file of System 7.0 and later.
This compression format is used for most compressed resources in System 7.0's files.
This decompressor is also included with and used by some other Apple applications,
such as ResEdit.

This compression format supports some basic general-purpose compression schemes,
including backreferences to previous data,
run-length encoding,
and delta encoding.
It also includes some types of compression tailored specifically to Mac OS resources,
including a set of single-byte codes that correspond to entries in a hard-coded lookup table,
and a specialized kind of delta encoding for segment loader jump tables.

Almost all parts of this compression format operate on units of 2 or 4 bytes.
As a result,
it is nearly impossible to store data with an odd length in this format.
To work around this limitation,
odd-length resources are padded with an extra byte before compressing them with this format.
This extra byte is ignored after decompression,
as the real (odd) length of the resource is stored in the compressed resource header.

The `'dcmp' (1)` compression format (see dcmp_1.ksy) is very similar to this format,
with the main difference that it operates mostly on single bytes rather than two-byte units.

@see <a href="https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/dcmp0.py">Source</a>
]##
proc read*(_: typedesc[Dcmp0], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Dcmp0 =
  template this: untyped = result
  this = new(Dcmp0)
  let root = if root == nil: cast[Dcmp0](this) else: cast[Dcmp0](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The sequence of chunks that make up the compressed data.

  ]##
  block:
    var i: int
    while true:
      let it = Dcmp0_Chunk.read(this.io, this.root, this)
      this.chunks.add(it)
      if it.tag == 255:
        break
      inc i

proc fromFile*(_: typedesc[Dcmp0], filename: string): Dcmp0 =
  Dcmp0.read(newKaitaiFileStream(filename), nil, nil)


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
proc read*(_: typedesc[Dcmp0_Chunk], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp0): Dcmp0_Chunk =
  template this: untyped = result
  this = new(Dcmp0_Chunk)
  let root = if root == nil: cast[Dcmp0](this) else: cast[Dcmp0](root)
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
    let on = (if  ((this.tag >= 0) and (this.tag <= 31)) : dcmp_0.literal else: (if  ((this.tag >= 32) and (this.tag <= 74)) : dcmp_0.backreference else: (if  ((this.tag >= 75) and (this.tag <= 253)) : dcmp_0.table_lookup else: (if this.tag == 254: dcmp_0.extended else: (if this.tag == 255: dcmp_0.end else: dcmp_0.invalid)))))
    if on == dcmp_0.extended:
      let bodyExpr = Dcmp0_Chunk_ExtendedBody.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == dcmp_0.literal:
      let bodyExpr = Dcmp0_Chunk_LiteralBody.read(this.io, this.root, this, this.tag)
      this.body = bodyExpr
    elif on == dcmp_0.end:
      let bodyExpr = Dcmp0_Chunk_EndBody.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == dcmp_0.table_lookup:
      let bodyExpr = Dcmp0_Chunk_TableLookupBody.read(this.io, this.root, this, this.tag)
      this.body = bodyExpr
    elif on == dcmp_0.backreference:
      let bodyExpr = Dcmp0_Chunk_BackreferenceBody.read(this.io, this.root, this, this.tag)
      this.body = bodyExpr

proc fromFile*(_: typedesc[Dcmp0_Chunk], filename: string): Dcmp0_Chunk =
  Dcmp0_Chunk.read(newKaitaiFileStream(filename), nil, nil)


##[
The body of a literal data chunk.

The data that this chunk expands to is stored literally in the body (`literal`).
Optionally,
the literal data may also be stored for use by future backreference chunks (`do_store`).

The length of the literal data is stored as a number of two-byte units.
This means that the literal data always has an even length in bytes.

]##
proc read*(_: typedesc[Dcmp0_Chunk_LiteralBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp0_Chunk, tag: any): Dcmp0_Chunk_LiteralBody =
  template this: untyped = result
  this = new(Dcmp0_Chunk_LiteralBody)
  let root = if root == nil: cast[Dcmp0](this) else: cast[Dcmp0](root)
  this.io = io
  this.root = root
  this.parent = parent
  let tagExpr = uint8(tag)
  this.tag = tagExpr


  ##[
  The length of the literal data,
in two-byte units.

This field is only present if the tag byte's low nibble is zero.
In practice,
this only happens if the length is 0x10 or greater,
because smaller lengths can be encoded into the tag byte.

  ]##
  if this.isLenLiteralDiv2Separate:
    let lenLiteralDiv2SeparateExpr = this.io.readU1()
    this.lenLiteralDiv2Separate = lenLiteralDiv2SeparateExpr

  ##[
  The literal data.

  ]##
  let literalExpr = this.io.readBytes(int(this.lenLiteral))
  this.literal = literalExpr

proc doStore(this: Dcmp0_Chunk_LiteralBody): bool = 

  ##[
  Whether this literal should be stored for use by future backreference chunks.

See the documentation of the `backreference_body` type for details about backreference chunks.

  ]##
  if this.doStoreInst != nil:
    return this.doStoreInst
  let doStoreInstExpr = bool((this.tag and 16) != 0)
  this.doStoreInst = doStoreInstExpr
  if this.doStoreInst != nil:
    return this.doStoreInst

proc lenLiteralDiv2(this: Dcmp0_Chunk_LiteralBody): int = 

  ##[
  The length of the literal data,
in two-byte units.

In practice,
this value is always greater than zero,
as there is no use in storing a zero-length literal.

  ]##
  if this.lenLiteralDiv2Inst != nil:
    return this.lenLiteralDiv2Inst
  let lenLiteralDiv2InstExpr = int((if this.isLenLiteralDiv2Separate: this.lenLiteralDiv2Separate else: this.lenLiteralDiv2InTag))
  this.lenLiteralDiv2Inst = lenLiteralDiv2InstExpr
  if this.lenLiteralDiv2Inst != nil:
    return this.lenLiteralDiv2Inst

proc lenLiteral(this: Dcmp0_Chunk_LiteralBody): int = 

  ##[
  The length of the literal data,
in bytes.

  ]##
  if this.lenLiteralInst != nil:
    return this.lenLiteralInst
  let lenLiteralInstExpr = int((this.lenLiteralDiv2 * 2))
  this.lenLiteralInst = lenLiteralInstExpr
  if this.lenLiteralInst != nil:
    return this.lenLiteralInst

proc lenLiteralDiv2InTag(this: Dcmp0_Chunk_LiteralBody): int = 

  ##[
  The part of the tag byte that indicates the length of the literal data,
in two-byte units.
If this value is 0,
the length is stored in a separate byte after the tag byte and before the literal data.

  ]##
  if this.lenLiteralDiv2InTagInst != nil:
    return this.lenLiteralDiv2InTagInst
  let lenLiteralDiv2InTagInstExpr = int((this.tag and 15))
  this.lenLiteralDiv2InTagInst = lenLiteralDiv2InTagInstExpr
  if this.lenLiteralDiv2InTagInst != nil:
    return this.lenLiteralDiv2InTagInst

proc isLenLiteralDiv2Separate(this: Dcmp0_Chunk_LiteralBody): bool = 

  ##[
  Whether the length of the literal is stored separately from the tag.

  ]##
  if this.isLenLiteralDiv2SeparateInst != nil:
    return this.isLenLiteralDiv2SeparateInst
  let isLenLiteralDiv2SeparateInstExpr = bool(this.lenLiteralDiv2InTag == 0)
  this.isLenLiteralDiv2SeparateInst = isLenLiteralDiv2SeparateInstExpr
  if this.isLenLiteralDiv2SeparateInst != nil:
    return this.isLenLiteralDiv2SeparateInst

proc fromFile*(_: typedesc[Dcmp0_Chunk_LiteralBody], filename: string): Dcmp0_Chunk_LiteralBody =
  Dcmp0_Chunk_LiteralBody.read(newKaitaiFileStream(filename), nil, nil)


##[
The body of a backreference chunk.

This chunk expands to the data stored in a preceding literal chunk,
indicated by an index number (`index`).

]##
proc read*(_: typedesc[Dcmp0_Chunk_BackreferenceBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp0_Chunk, tag: any): Dcmp0_Chunk_BackreferenceBody =
  template this: untyped = result
  this = new(Dcmp0_Chunk_BackreferenceBody)
  let root = if root == nil: cast[Dcmp0](this) else: cast[Dcmp0](root)
  this.io = io
  this.root = root
  this.parent = parent
  let tagExpr = uint8(tag)
  this.tag = tagExpr


  ##[
  The index of the referenced literal chunk,
stored separately from the tag.
The value in this field is stored minus 0x28.
If the tag byte is 0x21,
the value is also stored minus 0x100,
*on top of* the regular offset
(i. e. minus 0x128 in total).

In other words,
for tag bytes 0x20 and 0x21,
the index is actually 9 bits large,
with the low 8 bits stored separately and the highest bit stored in the lowest bit of the tag byte.

This field is only present if the tag byte is 0x20 through 0x22.
For higher tag bytes,
the index is encoded in the tag byte.
Values smaller than 0x28 cannot be stored in this field,
they must always be encoded in the tag byte.

  ]##
  if this.isIndexSeparate:
    block:
      let on = this.tag
      if on == 32:
        let indexSeparateMinusExpr = uint16(this.io.readU1())
        this.indexSeparateMinus = indexSeparateMinusExpr
      elif on == 33:
        let indexSeparateMinusExpr = uint16(this.io.readU1())
        this.indexSeparateMinus = indexSeparateMinusExpr
      elif on == 34:
        let indexSeparateMinusExpr = this.io.readU2be()
        this.indexSeparateMinus = indexSeparateMinusExpr

proc isIndexSeparate(this: Dcmp0_Chunk_BackreferenceBody): bool = 

  ##[
  Whether the index is stored separately from the tag.

  ]##
  if this.isIndexSeparateInst != nil:
    return this.isIndexSeparateInst
  let isIndexSeparateInstExpr = bool( ((this.tag >= 32) and (this.tag <= 34)) )
  this.isIndexSeparateInst = isIndexSeparateInstExpr
  if this.isIndexSeparateInst != nil:
    return this.isIndexSeparateInst

proc indexInTag(this: Dcmp0_Chunk_BackreferenceBody): int = 

  ##[
  The index of the referenced literal chunk,
as stored in the tag byte.

  ]##
  if this.indexInTagInst != nil:
    return this.indexInTagInst
  let indexInTagInstExpr = int((this.tag - 35))
  this.indexInTagInst = indexInTagInstExpr
  if this.indexInTagInst != nil:
    return this.indexInTagInst

proc indexSeparate(this: Dcmp0_Chunk_BackreferenceBody): int = 

  ##[
  The index of the referenced literal chunk,
as stored separately from the tag byte,
with the implicit offset corrected for.

  ]##
  if this.indexSeparateInst != nil:
    return this.indexSeparateInst
  if this.isIndexSeparate:
    let indexSeparateInstExpr = int(((this.indexSeparateMinus + 40) + (if this.tag == 33: 256 else: 0)))
    this.indexSeparateInst = indexSeparateInstExpr
  if this.indexSeparateInst != nil:
    return this.indexSeparateInst

proc index(this: Dcmp0_Chunk_BackreferenceBody): int = 

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
  if this.indexInst != nil:
    return this.indexInst
  let indexInstExpr = int((if this.isIndexSeparate: this.indexSeparate else: this.indexInTag))
  this.indexInst = indexInstExpr
  if this.indexInst != nil:
    return this.indexInst

proc fromFile*(_: typedesc[Dcmp0_Chunk_BackreferenceBody], filename: string): Dcmp0_Chunk_BackreferenceBody =
  Dcmp0_Chunk_BackreferenceBody.read(newKaitaiFileStream(filename), nil, nil)


##[
The body of a table lookup chunk.
This body is always empty.

This chunk always expands to two bytes (`value`),
determined from the tag byte using a fixed lookup table (`lookup_table`).
This lookup table is hardcoded in the decompressor and always the same for all compressed data.

]##
proc read*(_: typedesc[Dcmp0_Chunk_TableLookupBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp0_Chunk, tag: any): Dcmp0_Chunk_TableLookupBody =
  template this: untyped = result
  this = new(Dcmp0_Chunk_TableLookupBody)
  let root = if root == nil: cast[Dcmp0](this) else: cast[Dcmp0](root)
  this.io = io
  this.root = root
  this.parent = parent
  let tagExpr = uint8(tag)
  this.tag = tagExpr


proc lookupTable(this: Dcmp0_Chunk_TableLookupBody): seq[seq[byte]] = 

  ##[
  Fixed lookup table that maps tag byte numbers to two bytes each.

The entries in the lookup table are offset -
index 0 stands for tag 0x4b, 1 for 0x4c, etc.

  ]##
  if this.lookupTableInst.len != 0:
    return this.lookupTableInst
  let lookupTableInstExpr = seq[seq[byte]](@[seq[byte](@[0'u8, 0'u8]), seq[byte](@[78'u8, -70'u8]), seq[byte](@[0'u8, 8'u8]), seq[byte](@[78'u8, 117'u8]), seq[byte](@[0'u8, 12'u8]), seq[byte](@[78'u8, -83'u8]), seq[byte](@[32'u8, 83'u8]), seq[byte](@[47'u8, 11'u8]), seq[byte](@[97'u8, 0'u8]), seq[byte](@[0'u8, 16'u8]), seq[byte](@[112'u8, 0'u8]), seq[byte](@[47'u8, 0'u8]), seq[byte](@[72'u8, 110'u8]), seq[byte](@[32'u8, 80'u8]), seq[byte](@[32'u8, 110'u8]), seq[byte](@[47'u8, 46'u8]), seq[byte](@[-1'u8, -4'u8]), seq[byte](@[72'u8, -25'u8]), seq[byte](@[63'u8, 60'u8]), seq[byte](@[0'u8, 4'u8]), seq[byte](@[-1'u8, -8'u8]), seq[byte](@[47'u8, 12'u8]), seq[byte](@[32'u8, 6'u8]), seq[byte](@[78'u8, -19'u8]), seq[byte](@[78'u8, 86'u8]), seq[byte](@[32'u8, 104'u8]), seq[byte](@[78'u8, 94'u8]), seq[byte](@[0'u8, 1'u8]), seq[byte](@[88'u8, -113'u8]), seq[byte](@[79'u8, -17'u8]), seq[byte](@[0'u8, 2'u8]), seq[byte](@[0'u8, 24'u8]), seq[byte](@[96'u8, 0'u8]), seq[byte](@[-1'u8, -1'u8]), seq[byte](@[80'u8, -113'u8]), seq[byte](@[78'u8, -112'u8]), seq[byte](@[0'u8, 6'u8]), seq[byte](@[38'u8, 110'u8]), seq[byte](@[0'u8, 20'u8]), seq[byte](@[-1'u8, -12'u8]), seq[byte](@[76'u8, -18'u8]), seq[byte](@[0'u8, 10'u8]), seq[byte](@[0'u8, 14'u8]), seq[byte](@[65'u8, -18'u8]), seq[byte](@[76'u8, -33'u8]), seq[byte](@[72'u8, -64'u8]), seq[byte](@[-1'u8, -16'u8]), seq[byte](@[45'u8, 64'u8]), seq[byte](@[0'u8, 18'u8]), seq[byte](@[48'u8, 46'u8]), seq[byte](@[112'u8, 1'u8]), seq[byte](@[47'u8, 40'u8]), seq[byte](@[32'u8, 84'u8]), seq[byte](@[103'u8, 0'u8]), seq[byte](@[0'u8, 32'u8]), seq[byte](@[0'u8, 28'u8]), seq[byte](@[32'u8, 95'u8]), seq[byte](@[24'u8, 0'u8]), seq[byte](@[38'u8, 111'u8]), seq[byte](@[72'u8, 120'u8]), seq[byte](@[0'u8, 22'u8]), seq[byte](@[65'u8, -6'u8]), seq[byte](@[48'u8, 60'u8]), seq[byte](@[40'u8, 64'u8]), seq[byte](@[114'u8, 0'u8]), seq[byte](@[40'u8, 110'u8]), seq[byte](@[32'u8, 12'u8]), seq[byte](@[102'u8, 0'u8]), seq[byte](@[32'u8, 107'u8]), seq[byte](@[47'u8, 7'u8]), seq[byte](@[85'u8, -113'u8]), seq[byte](@[0'u8, 40'u8]), seq[byte](@[-1'u8, -2'u8]), seq[byte](@[-1'u8, -20'u8]), seq[byte](@[34'u8, -40'u8]), seq[byte](@[32'u8, 11'u8]), seq[byte](@[0'u8, 15'u8]), seq[byte](@[89'u8, -113'u8]), seq[byte](@[47'u8, 60'u8]), seq[byte](@[-1'u8, 0'u8]), seq[byte](@[1'u8, 24'u8]), seq[byte](@[-127'u8, -31'u8]), seq[byte](@[74'u8, 0'u8]), seq[byte](@[78'u8, -80'u8]), seq[byte](@[-1'u8, -24'u8]), seq[byte](@[72'u8, -57'u8]), seq[byte](@[0'u8, 3'u8]), seq[byte](@[0'u8, 34'u8]), seq[byte](@[0'u8, 7'u8]), seq[byte](@[0'u8, 26'u8]), seq[byte](@[103'u8, 6'u8]), seq[byte](@[103'u8, 8'u8]), seq[byte](@[78'u8, -7'u8]), seq[byte](@[0'u8, 36'u8]), seq[byte](@[32'u8, 120'u8]), seq[byte](@[8'u8, 0'u8]), seq[byte](@[102'u8, 4'u8]), seq[byte](@[0'u8, 42'u8]), seq[byte](@[78'u8, -48'u8]), seq[byte](@[48'u8, 40'u8]), seq[byte](@[38'u8, 95'u8]), seq[byte](@[103'u8, 4'u8]), seq[byte](@[0'u8, 48'u8]), seq[byte](@[67'u8, -18'u8]), seq[byte](@[63'u8, 0'u8]), seq[byte](@[32'u8, 31'u8]), seq[byte](@[0'u8, 30'u8]), seq[byte](@[-1'u8, -10'u8]), seq[byte](@[32'u8, 46'u8]), seq[byte](@[66'u8, -89'u8]), seq[byte](@[32'u8, 7'u8]), seq[byte](@[-1'u8, -6'u8]), seq[byte](@[96'u8, 2'u8]), seq[byte](@[61'u8, 64'u8]), seq[byte](@[12'u8, 64'u8]), seq[byte](@[102'u8, 6'u8]), seq[byte](@[0'u8, 38'u8]), seq[byte](@[45'u8, 72'u8]), seq[byte](@[47'u8, 1'u8]), seq[byte](@[112'u8, -1'u8]), seq[byte](@[96'u8, 4'u8]), seq[byte](@[24'u8, -128'u8]), seq[byte](@[74'u8, 64'u8]), seq[byte](@[0'u8, 64'u8]), seq[byte](@[0'u8, 44'u8]), seq[byte](@[47'u8, 8'u8]), seq[byte](@[0'u8, 17'u8]), seq[byte](@[-1'u8, -28'u8]), seq[byte](@[33'u8, 64'u8]), seq[byte](@[38'u8, 64'u8]), seq[byte](@[-1'u8, -14'u8]), seq[byte](@[66'u8, 110'u8]), seq[byte](@[78'u8, -71'u8]), seq[byte](@[61'u8, 124'u8]), seq[byte](@[0'u8, 56'u8]), seq[byte](@[0'u8, 13'u8]), seq[byte](@[96'u8, 6'u8]), seq[byte](@[66'u8, 46'u8]), seq[byte](@[32'u8, 60'u8]), seq[byte](@[103'u8, 12'u8]), seq[byte](@[45'u8, 104'u8]), seq[byte](@[102'u8, 8'u8]), seq[byte](@[74'u8, 46'u8]), seq[byte](@[74'u8, -82'u8]), seq[byte](@[0'u8, 46'u8]), seq[byte](@[72'u8, 64'u8]), seq[byte](@[34'u8, 95'u8]), seq[byte](@[34'u8, 0'u8]), seq[byte](@[103'u8, 10'u8]), seq[byte](@[48'u8, 7'u8]), seq[byte](@[66'u8, 103'u8]), seq[byte](@[0'u8, 50'u8]), seq[byte](@[32'u8, 40'u8]), seq[byte](@[0'u8, 9'u8]), seq[byte](@[72'u8, 122'u8]), seq[byte](@[2'u8, 0'u8]), seq[byte](@[47'u8, 43'u8]), seq[byte](@[0'u8, 5'u8]), seq[byte](@[34'u8, 110'u8]), seq[byte](@[102'u8, 2'u8]), seq[byte](@[-27'u8, -128'u8]), seq[byte](@[103'u8, 14'u8]), seq[byte](@[102'u8, 10'u8]), seq[byte](@[0'u8, 80'u8]), seq[byte](@[62'u8, 0'u8]), seq[byte](@[102'u8, 12'u8]), seq[byte](@[46'u8, 0'u8]), seq[byte](@[-1'u8, -18'u8]), seq[byte](@[32'u8, 109'u8]), seq[byte](@[32'u8, 64'u8]), seq[byte](@[-1'u8, -32'u8]), seq[byte](@[83'u8, 64'u8]), seq[byte](@[96'u8, 8'u8]), seq[byte](@[4'u8, -128'u8]), seq[byte](@[0'u8, 104'u8]), seq[byte](@[11'u8, 124'u8]), seq[byte](@[68'u8, 0'u8]), seq[byte](@[65'u8, -24'u8]), seq[byte](@[72'u8, 65'u8])])
  this.lookupTableInst = lookupTableInstExpr
  if this.lookupTableInst.len != 0:
    return this.lookupTableInst

proc value(this: Dcmp0_Chunk_TableLookupBody): seq[byte] = 

  ##[
  The two bytes that the tag byte expands to,
based on the fixed lookup table.

  ]##
  if this.valueInst.len != 0:
    return this.valueInst
  let valueInstExpr = seq[byte](this.lookupTable[(this.tag - 75)])
  this.valueInst = valueInstExpr
  if this.valueInst.len != 0:
    return this.valueInst

proc fromFile*(_: typedesc[Dcmp0_Chunk_TableLookupBody], filename: string): Dcmp0_Chunk_TableLookupBody =
  Dcmp0_Chunk_TableLookupBody.read(newKaitaiFileStream(filename), nil, nil)


##[
The body of an end chunk.
This body is always empty.

The last chunk in the compressed data must always be an end chunk.
An end chunk cannot appear elsewhere in the compressed data.

]##
proc read*(_: typedesc[Dcmp0_Chunk_EndBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp0_Chunk): Dcmp0_Chunk_EndBody =
  template this: untyped = result
  this = new(Dcmp0_Chunk_EndBody)
  let root = if root == nil: cast[Dcmp0](this) else: cast[Dcmp0](root)
  this.io = io
  this.root = root
  this.parent = parent


proc fromFile*(_: typedesc[Dcmp0_Chunk_EndBody], filename: string): Dcmp0_Chunk_EndBody =
  Dcmp0_Chunk_EndBody.read(newKaitaiFileStream(filename), nil, nil)


##[
The body of an extended chunk.
The meaning of this chunk depends on the extended tag byte stored in the chunk data.

]##
proc read*(_: typedesc[Dcmp0_Chunk_ExtendedBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp0_Chunk): Dcmp0_Chunk_ExtendedBody =
  template this: untyped = result
  this = new(Dcmp0_Chunk_ExtendedBody)
  let root = if root == nil: cast[Dcmp0](this) else: cast[Dcmp0](root)
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
    if on == 0:
      let bodyExpr = Dcmp0_Chunk_ExtendedBody_JumpTableBody.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == 4:
      let bodyExpr = Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == 6:
      let bodyExpr = Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == 3:
      let bodyExpr = Dcmp0_Chunk_ExtendedBody_RepeatBody.read(this.io, this.root, this, this.tag)
      this.body = bodyExpr
    elif on == 2:
      let bodyExpr = Dcmp0_Chunk_ExtendedBody_RepeatBody.read(this.io, this.root, this, this.tag)
      this.body = bodyExpr

proc fromFile*(_: typedesc[Dcmp0_Chunk_ExtendedBody], filename: string): Dcmp0_Chunk_ExtendedBody =
  Dcmp0_Chunk_ExtendedBody.read(newKaitaiFileStream(filename), nil, nil)


##[
The body of a jump table chunk.

This chunk generates parts of a segment loader jump table,
in the format found in `'CODE' (0)` resources.
It expands to the following data,
with all non-constant numbers encoded as unsigned 16-bit big-endian integers:

* `0x3f 0x3c` (push following segment number onto stack)
* The segment number
* `0xa9 0xf0` (`_LoadSeg` trap)
* For each address:
  * The address
  * `0x3f 0x3c` (push following segment number onto stack)
  * The segment number
  * `0xa9 0xf0` (`_LoadSeg` trap)

Note that this generates one jump table entry without an address before it,
meaning that this address needs to be generated by the preceding chunk.
All following jump table entries are generated with the addresses encoded in this chunk.

]##
proc read*(_: typedesc[Dcmp0_Chunk_ExtendedBody_JumpTableBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp0_Chunk_ExtendedBody): Dcmp0_Chunk_ExtendedBody_JumpTableBody =
  template this: untyped = result
  this = new(Dcmp0_Chunk_ExtendedBody_JumpTableBody)
  let root = if root == nil: cast[Dcmp0](this) else: cast[Dcmp0](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Raw variable-length integer representation of `segment_number`.

  ]##
  let segmentNumberRawExpr = DcmpVariableLengthInteger.read(this.io, this.root, this)
  this.segmentNumberRaw = segmentNumberRawExpr

  ##[
  Raw variable-length integer representation of `num_addresses`.

  ]##
  let numAddressesRawExpr = DcmpVariableLengthInteger.read(this.io, this.root, this)
  this.numAddressesRaw = numAddressesRawExpr

  ##[
  The addresses for each generated jump table entry,
stored as variable-length integers.

The first address is stored literally and must be in the range `0x0 <= x <= 0xffff`,
i. e. an unsigned 16-bit integer.

All following addresses are stored as deltas relative to the previous address.
Each of these deltas is stored plus 6;
this value needs to be subtracted before (or after) adding it to the previous address.

Each delta (after subtracting 6) should be positive,
and adding it to the previous address should not result in a value larger than `0xffff`,
i. e. there should be no 16-bit unsigned integer wraparound.
These conditions are always met in all known jump table chunks,
so it is not known how the original decompressor behaves otherwise.

  ]##
  for i in 0 ..< int(this.numAddresses):
    let it = DcmpVariableLengthInteger.read(this.io, this.root, this)
    this.addressesRaw.add(it)

proc segmentNumber(this: Dcmp0_Chunk_ExtendedBody_JumpTableBody): int = 

  ##[
  The segment number for all of the generated jump table entries.

Although it is stored as a variable-length integer,
the segment number must be in the range `0x0 <= x <= 0xffff`,
i. e. an unsigned 16-bit integer.

  ]##
  if this.segmentNumberInst != nil:
    return this.segmentNumberInst
  let segmentNumberInstExpr = int(this.segmentNumberRaw.value)
  this.segmentNumberInst = segmentNumberInstExpr
  if this.segmentNumberInst != nil:
    return this.segmentNumberInst

proc numAddresses(this: Dcmp0_Chunk_ExtendedBody_JumpTableBody): int = 

  ##[
  The number of addresses stored in this chunk.

This number must be greater than 0.

  ]##
  if this.numAddressesInst != nil:
    return this.numAddressesInst
  let numAddressesInstExpr = int(this.numAddressesRaw.value)
  this.numAddressesInst = numAddressesInstExpr
  if this.numAddressesInst != nil:
    return this.numAddressesInst

proc fromFile*(_: typedesc[Dcmp0_Chunk_ExtendedBody_JumpTableBody], filename: string): Dcmp0_Chunk_ExtendedBody_JumpTableBody =
  Dcmp0_Chunk_ExtendedBody_JumpTableBody.read(newKaitaiFileStream(filename), nil, nil)


##[
The body of a repeat chunk.

This chunk expands to a 1-byte or 2-byte value repeated a number of times,
i. e. it implements a form of run-length encoding.

]##
proc read*(_: typedesc[Dcmp0_Chunk_ExtendedBody_RepeatBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp0_Chunk_ExtendedBody, tag: any): Dcmp0_Chunk_ExtendedBody_RepeatBody =
  template this: untyped = result
  this = new(Dcmp0_Chunk_ExtendedBody_RepeatBody)
  let root = if root == nil: cast[Dcmp0](this) else: cast[Dcmp0](root)
  this.io = io
  this.root = root
  this.parent = parent
  let tagExpr = uint8(tag)
  this.tag = tagExpr


  ##[
  Raw variable-length integer representation of `to_repeat`.

  ]##
  let toRepeatRawExpr = DcmpVariableLengthInteger.read(this.io, this.root, this)
  this.toRepeatRaw = toRepeatRawExpr

  ##[
  Raw variable-length integer representation of `repeat_count_m1`.

  ]##
  let repeatCountM1RawExpr = DcmpVariableLengthInteger.read(this.io, this.root, this)
  this.repeatCountM1Raw = repeatCountM1RawExpr

proc byteCount(this: Dcmp0_Chunk_ExtendedBody_RepeatBody): int = 

  ##[
  The length in bytes of the value to be repeated.
Regardless of the byte count,
the value to be repeated is stored as a variable-length integer.

  ]##
  if this.byteCountInst != nil:
    return this.byteCountInst
  let byteCountInstExpr = int((if this.tag == 2: 1 else: (if this.tag == 3: 2 else: -1)))
  this.byteCountInst = byteCountInstExpr
  if this.byteCountInst != nil:
    return this.byteCountInst

proc toRepeat(this: Dcmp0_Chunk_ExtendedBody_RepeatBody): int = 

  ##[
  The value to repeat.

Although it is stored as a variable-length integer,
this value must fit into an unsigned big-endian integer that is as long as `byte_count`,
i. e. either 8 or 16 bits.

  ]##
  if this.toRepeatInst != nil:
    return this.toRepeatInst
  let toRepeatInstExpr = int(this.toRepeatRaw.value)
  this.toRepeatInst = toRepeatInstExpr
  if this.toRepeatInst != nil:
    return this.toRepeatInst

proc repeatCountM1(this: Dcmp0_Chunk_ExtendedBody_RepeatBody): int = 

  ##[
  The number of times to repeat the value,
minus one.

This value must not be negative.

  ]##
  if this.repeatCountM1Inst != nil:
    return this.repeatCountM1Inst
  let repeatCountM1InstExpr = int(this.repeatCountM1Raw.value)
  this.repeatCountM1Inst = repeatCountM1InstExpr
  if this.repeatCountM1Inst != nil:
    return this.repeatCountM1Inst

proc repeatCount(this: Dcmp0_Chunk_ExtendedBody_RepeatBody): int = 

  ##[
  The number of times to repeat the value.

This value must be positive.

  ]##
  if this.repeatCountInst != nil:
    return this.repeatCountInst
  let repeatCountInstExpr = int((this.repeatCountM1 + 1))
  this.repeatCountInst = repeatCountInstExpr
  if this.repeatCountInst != nil:
    return this.repeatCountInst

proc fromFile*(_: typedesc[Dcmp0_Chunk_ExtendedBody_RepeatBody], filename: string): Dcmp0_Chunk_ExtendedBody_RepeatBody =
  Dcmp0_Chunk_ExtendedBody_RepeatBody.read(newKaitaiFileStream(filename), nil, nil)


##[
The body of a 16-bit delta encoding chunk.

This chunk expands to a sequence of 16-bit big-endian integer values.
The first value is stored literally.
All following values are stored as deltas relative to the previous value.

]##
proc read*(_: typedesc[Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp0_Chunk_ExtendedBody): Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody =
  template this: untyped = result
  this = new(Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody)
  let root = if root == nil: cast[Dcmp0](this) else: cast[Dcmp0](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Raw variable-length integer representation of `first_value`.

  ]##
  let firstValueRawExpr = DcmpVariableLengthInteger.read(this.io, this.root, this)
  this.firstValueRaw = firstValueRawExpr

  ##[
  Raw variable-length integer representation of `num_deltas`.

  ]##
  let numDeltasRawExpr = DcmpVariableLengthInteger.read(this.io, this.root, this)
  this.numDeltasRaw = numDeltasRawExpr

  ##[
  The deltas for each value relative to the previous value.

Each of these deltas is a signed 8-bit value.
When adding the delta to the previous value,
16-bit integer wraparound is performed if necessary,
so that the resulting value always fits into a 16-bit signed integer.

  ]##
  for i in 0 ..< int(this.numDeltas):
    let it = this.io.readS1()
    this.deltas.add(it)

proc firstValue(this: Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody): int = 

  ##[
  The first value in the sequence.

Although it is stored as a variable-length integer,
this value must be in the range `-0x8000 <= x <= 0x7fff`,
i. e. a signed 16-bit integer.

  ]##
  if this.firstValueInst != nil:
    return this.firstValueInst
  let firstValueInstExpr = int(this.firstValueRaw.value)
  this.firstValueInst = firstValueInstExpr
  if this.firstValueInst != nil:
    return this.firstValueInst

proc numDeltas(this: Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody): int = 

  ##[
  The number of deltas stored in this chunk.

This number must not be negative.

  ]##
  if this.numDeltasInst != nil:
    return this.numDeltasInst
  let numDeltasInstExpr = int(this.numDeltasRaw.value)
  this.numDeltasInst = numDeltasInstExpr
  if this.numDeltasInst != nil:
    return this.numDeltasInst

proc fromFile*(_: typedesc[Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody], filename: string): Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody =
  Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody.read(newKaitaiFileStream(filename), nil, nil)


##[
The body of a 32-bit delta encoding chunk.

This chunk expands to a sequence of 32-bit big-endian integer values.
The first value is stored literally.
All following values are stored as deltas relative to the previous value.

]##
proc read*(_: typedesc[Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp0_Chunk_ExtendedBody): Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody =
  template this: untyped = result
  this = new(Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody)
  let root = if root == nil: cast[Dcmp0](this) else: cast[Dcmp0](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Raw variable-length integer representation of `first_value`.

  ]##
  let firstValueRawExpr = DcmpVariableLengthInteger.read(this.io, this.root, this)
  this.firstValueRaw = firstValueRawExpr

  ##[
  Raw variable-length integer representation of `num_deltas`.

  ]##
  let numDeltasRawExpr = DcmpVariableLengthInteger.read(this.io, this.root, this)
  this.numDeltasRaw = numDeltasRawExpr

  ##[
  The deltas for each value relative to the previous value,
stored as variable-length integers.

Each of these deltas is a signed value.
When adding the delta to the previous value,
32-bit integer wraparound is performed if necessary,
so that the resulting value always fits into a 32-bit signed integer.

  ]##
  for i in 0 ..< int(this.numDeltas):
    let it = DcmpVariableLengthInteger.read(this.io, this.root, this)
    this.deltasRaw.add(it)

proc firstValue(this: Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody): int = 

  ##[
  The first value in the sequence.

  ]##
  if this.firstValueInst != nil:
    return this.firstValueInst
  let firstValueInstExpr = int(this.firstValueRaw.value)
  this.firstValueInst = firstValueInstExpr
  if this.firstValueInst != nil:
    return this.firstValueInst

proc numDeltas(this: Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody): int = 

  ##[
  The number of deltas stored in this chunk.

This number must not be negative.

  ]##
  if this.numDeltasInst != nil:
    return this.numDeltasInst
  let numDeltasInstExpr = int(this.numDeltasRaw.value)
  this.numDeltasInst = numDeltasInstExpr
  if this.numDeltasInst != nil:
    return this.numDeltasInst

proc fromFile*(_: typedesc[Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody], filename: string): Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody =
  Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody.read(newKaitaiFileStream(filename), nil, nil)


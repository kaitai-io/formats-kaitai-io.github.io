import kaitai_struct_nim_runtime
import options
import /common/bytes_with_io

import "bytes_with_io"
type
  CompressedResource* = ref object of KaitaiStruct
    `header`*: CompressedResource_Header
    `compressedData`*: seq[byte]
    `parent`*: KaitaiStruct
  CompressedResource_Header* = ref object of KaitaiStruct
    `commonPart`*: CompressedResource_Header_CommonPart
    `typeSpecificPartRawWithIo`*: BytesWithIo
    `parent`*: CompressedResource
    `rawTypeSpecificPartRawWithIo`*: seq[byte]
    `typeSpecificPartRawInst`*: seq[byte]
    `typeSpecificPartInst`*: KaitaiStruct
  CompressedResource_Header_CommonPart* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `lenHeader`*: uint16
    `headerType`*: uint8
    `unknown`*: uint8
    `lenDecompressed`*: uint32
    `parent`*: CompressedResource_Header
  CompressedResource_Header_TypeSpecificPartType8* = ref object of KaitaiStruct
    `workingBufferFractionalSize`*: uint8
    `expansionBufferSize`*: uint8
    `decompressorId`*: int16
    `reserved`*: uint16
    `parent`*: CompressedResource_Header
  CompressedResource_Header_TypeSpecificPartType9* = ref object of KaitaiStruct
    `decompressorId`*: int16
    `decompressorSpecificParametersWithIo`*: BytesWithIo
    `parent`*: CompressedResource_Header
    `rawDecompressorSpecificParametersWithIo`*: seq[byte]
    `decompressorSpecificParametersInst`*: seq[byte]

proc read*(_: typedesc[CompressedResource], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): CompressedResource
proc read*(_: typedesc[CompressedResource_Header], io: KaitaiStream, root: KaitaiStruct, parent: CompressedResource): CompressedResource_Header
proc read*(_: typedesc[CompressedResource_Header_CommonPart], io: KaitaiStream, root: KaitaiStruct, parent: CompressedResource_Header): CompressedResource_Header_CommonPart
proc read*(_: typedesc[CompressedResource_Header_TypeSpecificPartType8], io: KaitaiStream, root: KaitaiStruct, parent: CompressedResource_Header): CompressedResource_Header_TypeSpecificPartType8
proc read*(_: typedesc[CompressedResource_Header_TypeSpecificPartType9], io: KaitaiStream, root: KaitaiStruct, parent: CompressedResource_Header): CompressedResource_Header_TypeSpecificPartType9

proc typeSpecificPartRaw*(this: CompressedResource_Header): seq[byte]
proc typeSpecificPart*(this: CompressedResource_Header): KaitaiStruct
proc decompressorSpecificParameters*(this: CompressedResource_Header_TypeSpecificPartType9): seq[byte]


##[
Compressed Macintosh resource data,
as stored in resources with the "compressed" attribute.

Resource decompression is not documented by Apple.
It is mostly used internally in System 7,
some of Apple's own applications (such as ResEdit),
and also by some third-party applications.
Later versions of Classic Mac OS make less use of resource compression,
but still support it fully for backwards compatibility.
Carbon in Mac OS X no longer supports resource compression in any way.

The data of all compressed resources starts with a common header,
followed by the compressed data.
The data is decompressed using code in a `'dcmp'` resource.
Some decompressors used by Apple are included in the System file,
but applications can also include custom decompressors.
The header of the compressed data indicates the ID of the `'dcmp'` resource used to decompress the data,
along with some parameters for the decompressor.

@see <a href="http://www.alysis.us/arctechnology.htm">Source</a>
@see <a href="http://preserve.mactech.com/articles/mactech/Vol.09/09.01/ResCompression/index.html">Source</a>
@see <a href="https://github.com/dgelessus/python-rsrcfork/tree/master/rsrcfork/compress">Source</a>
]##
proc read*(_: typedesc[CompressedResource], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): CompressedResource =
  template this: untyped = result
  this = new(CompressedResource)
  let root = if root == nil: cast[CompressedResource](this) else: cast[CompressedResource](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The header of the compressed data.

  ]##
  let headerExpr = CompressedResource_Header.read(this.io, this.root, this)
  this.header = headerExpr

  ##[
  The compressed resource data.

The format of this data is completely dependent on the decompressor and its parameters,
as specified in the header.
For details about the compressed data formats implemented by Apple's decompressors,
see the specs in the resource_compression subdirectory.

  ]##
  let compressedDataExpr = this.io.readBytesFull()
  this.compressedData = compressedDataExpr

proc fromFile*(_: typedesc[CompressedResource], filename: string): CompressedResource =
  CompressedResource.read(newKaitaiFileStream(filename), nil, nil)


##[
Compressed resource data header,
as stored at the start of all compressed resources.

]##
proc read*(_: typedesc[CompressedResource_Header], io: KaitaiStream, root: KaitaiStruct, parent: CompressedResource): CompressedResource_Header =
  template this: untyped = result
  this = new(CompressedResource_Header)
  let root = if root == nil: cast[CompressedResource](this) else: cast[CompressedResource](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The common part of the header.
Among other things,
this part contains the header type,
which determines the format of the data in the type-specific part of the header.

  ]##
  let commonPartExpr = CompressedResource_Header_CommonPart.read(this.io, this.root, this)
  this.commonPart = commonPartExpr

  ##[
  Use `type_specific_part_raw` instead,
unless you need access to this field's `_io`.

  ]##
  let rawTypeSpecificPartRawWithIoExpr = this.io.readBytes(int((this.commonPart.lenHeader - 12)))
  this.rawTypeSpecificPartRawWithIo = rawTypeSpecificPartRawWithIoExpr
  let rawTypeSpecificPartRawWithIoIo = newKaitaiStream(rawTypeSpecificPartRawWithIoExpr)
  let typeSpecificPartRawWithIoExpr = BytesWithIo.read(rawTypeSpecificPartRawWithIoIo, this.root, this)
  this.typeSpecificPartRawWithIo = typeSpecificPartRawWithIoExpr

proc typeSpecificPartRaw(this: CompressedResource_Header): seq[byte] = 

  ##[
  The type-specific part of the header,
as a raw byte array.

  ]##
  if this.typeSpecificPartRawInst.len != 0:
    return this.typeSpecificPartRawInst
  let typeSpecificPartRawInstExpr = seq[byte](this.typeSpecificPartRawWithIo.data)
  this.typeSpecificPartRawInst = typeSpecificPartRawInstExpr
  if this.typeSpecificPartRawInst.len != 0:
    return this.typeSpecificPartRawInst

proc typeSpecificPart(this: CompressedResource_Header): KaitaiStruct = 

  ##[
  The type-specific part of the header,
parsed according to the type from the common part.

  ]##
  if this.typeSpecificPartInst != nil:
    return this.typeSpecificPartInst
  let io = this.typeSpecificPartRawWithIo.io
  let pos = io.pos()
  io.seek(int(0))
  block:
    let on = this.commonPart.headerType
    if on == 8:
      let typeSpecificPartInstExpr = CompressedResource_Header_TypeSpecificPartType8.read(io, this.root, this)
      this.typeSpecificPartInst = typeSpecificPartInstExpr
    elif on == 9:
      let typeSpecificPartInstExpr = CompressedResource_Header_TypeSpecificPartType9.read(io, this.root, this)
      this.typeSpecificPartInst = typeSpecificPartInstExpr
  io.seek(pos)
  if this.typeSpecificPartInst != nil:
    return this.typeSpecificPartInst

proc fromFile*(_: typedesc[CompressedResource_Header], filename: string): CompressedResource_Header =
  CompressedResource_Header.read(newKaitaiFileStream(filename), nil, nil)


##[
The common part of a compressed resource data header.
The format of this part is the same for all compressed resources.

]##
proc read*(_: typedesc[CompressedResource_Header_CommonPart], io: KaitaiStream, root: KaitaiStruct, parent: CompressedResource_Header): CompressedResource_Header_CommonPart =
  template this: untyped = result
  this = new(CompressedResource_Header_CommonPart)
  let root = if root == nil: cast[CompressedResource](this) else: cast[CompressedResource](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The signature of all compressed resource data.

When interpreted as MacRoman, this byte sequence decodes to `®üer`.

  ]##
  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr

  ##[
  The byte length of the entire header (common and type-specific parts).

The meaning of this field is mostly a guess,
as all known header types result in a total length of `0x12`.

  ]##
  let lenHeaderExpr = this.io.readU2be()
  this.lenHeader = lenHeaderExpr

  ##[
  Type of the header.
This determines the format of the data in the type-specific part of the header.

The only known header type values are `8` and `9`.

Every known decompressor is only compatible with one of the header types
(but every header type is used by more than one decompressor).
Apple's decompressors with IDs 0 and 1 use header type 8,
and those with IDs 2 and 3 use header type 9.

  ]##
  let headerTypeExpr = this.io.readU1()
  this.headerType = headerTypeExpr

  ##[
  The meaning of this field is not known.
It has the value `0x01` in all known compressed resources.

  ]##
  let unknownExpr = this.io.readU1()
  this.unknown = unknownExpr

  ##[
  The byte length of the data after decompression.

  ]##
  let lenDecompressedExpr = this.io.readU4be()
  this.lenDecompressed = lenDecompressedExpr

proc fromFile*(_: typedesc[CompressedResource_Header_CommonPart], filename: string): CompressedResource_Header_CommonPart =
  CompressedResource_Header_CommonPart.read(newKaitaiFileStream(filename), nil, nil)


##[
The type-specific part of a compressed resource header with header type `8`.

]##
proc read*(_: typedesc[CompressedResource_Header_TypeSpecificPartType8], io: KaitaiStream, root: KaitaiStruct, parent: CompressedResource_Header): CompressedResource_Header_TypeSpecificPartType8 =
  template this: untyped = result
  this = new(CompressedResource_Header_TypeSpecificPartType8)
  let root = if root == nil: cast[CompressedResource](this) else: cast[CompressedResource](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The ratio of the compressed data size to the uncompressed data size,
times 256.

This parameter affects the amount of memory allocated by the Resource Manager during decompression,
but does not have a direct effect on the decompressor
(except that it will misbehave if insufficient memory is provided).
Alternative decompressors that decompress resources into a separate buffer rather than in-place can generally ignore this parameter.

  ]##
  let workingBufferFractionalSizeExpr = this.io.readU1()
  this.workingBufferFractionalSize = workingBufferFractionalSizeExpr

  ##[
  The maximum number of bytes that the compressed data might "grow" during decompression.

This parameter affects the amount of memory allocated by the Resource Manager during decompression,
but does not have a direct effect on the decompressor
(except that it will misbehave if insufficient memory is provided).
Alternative decompressors that decompress resources into a separate buffer rather than in-place can generally ignore this parameter.

  ]##
  let expansionBufferSizeExpr = this.io.readU1()
  this.expansionBufferSize = expansionBufferSizeExpr

  ##[
  The ID of the `'dcmp'` resource that should be used to decompress this resource.

  ]##
  let decompressorIdExpr = this.io.readS2be()
  this.decompressorId = decompressorIdExpr

  ##[
  The meaning of this field is not known.
It has the value `0` in all known compressed resources,
so it is most likely reserved.

  ]##
  let reservedExpr = this.io.readU2be()
  this.reserved = reservedExpr

proc fromFile*(_: typedesc[CompressedResource_Header_TypeSpecificPartType8], filename: string): CompressedResource_Header_TypeSpecificPartType8 =
  CompressedResource_Header_TypeSpecificPartType8.read(newKaitaiFileStream(filename), nil, nil)


##[
The type-specific part of a compressed resource header with header type `9`.

]##
proc read*(_: typedesc[CompressedResource_Header_TypeSpecificPartType9], io: KaitaiStream, root: KaitaiStruct, parent: CompressedResource_Header): CompressedResource_Header_TypeSpecificPartType9 =
  template this: untyped = result
  this = new(CompressedResource_Header_TypeSpecificPartType9)
  let root = if root == nil: cast[CompressedResource](this) else: cast[CompressedResource](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The ID of the `'dcmp'` resource that should be used to decompress this resource.

  ]##
  let decompressorIdExpr = this.io.readS2be()
  this.decompressorId = decompressorIdExpr

  ##[
  Use `decompressor_specific_parameters` instead,
unless you need access to this field's `_io`.

  ]##
  let rawDecompressorSpecificParametersWithIoExpr = this.io.readBytes(int(4))
  this.rawDecompressorSpecificParametersWithIo = rawDecompressorSpecificParametersWithIoExpr
  let rawDecompressorSpecificParametersWithIoIo = newKaitaiStream(rawDecompressorSpecificParametersWithIoExpr)
  let decompressorSpecificParametersWithIoExpr = BytesWithIo.read(rawDecompressorSpecificParametersWithIoIo, this.root, this)
  this.decompressorSpecificParametersWithIo = decompressorSpecificParametersWithIoExpr

proc decompressorSpecificParameters(this: CompressedResource_Header_TypeSpecificPartType9): seq[byte] = 

  ##[
  Decompressor-specific parameters.
The exact structure and meaning of this field is different for each decompressor.

This field always has the same length,
but decompressors don't always use the entirety of the field,
so depending on the decompressor some parts of this field may be meaningless.

  ]##
  if this.decompressorSpecificParametersInst.len != 0:
    return this.decompressorSpecificParametersInst
  let decompressorSpecificParametersInstExpr = seq[byte](this.decompressorSpecificParametersWithIo.data)
  this.decompressorSpecificParametersInst = decompressorSpecificParametersInstExpr
  if this.decompressorSpecificParametersInst.len != 0:
    return this.decompressorSpecificParametersInst

proc fromFile*(_: typedesc[CompressedResource_Header_TypeSpecificPartType9], filename: string): CompressedResource_Header_TypeSpecificPartType9 =
  CompressedResource_Header_TypeSpecificPartType9.read(newKaitaiFileStream(filename), nil, nil)


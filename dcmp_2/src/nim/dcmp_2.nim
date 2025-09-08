import kaitai_struct_nim_runtime
import options
import bytes_with_io

type
  Dcmp2* = ref object of KaitaiStruct
    `customLookupTable`*: seq[seq[byte]]
    `data`*: KaitaiStruct
    `lastByte`*: seq[byte]
    `lenDecompressed`*: uint32
    `headerParametersWithIo`*: BytesWithIo
    `parent`*: KaitaiStruct
    `rawData`*: seq[byte]
    `defaultLookupTableInst`: seq[seq[byte]]
    `defaultLookupTableInstFlag`: bool
    `headerParametersInst`: Dcmp2_HeaderParameters
    `headerParametersInstFlag`: bool
    `isLenDecompressedOddInst`: bool
    `isLenDecompressedOddInstFlag`: bool
    `lookupTableInst`: seq[seq[byte]]
    `lookupTableInstFlag`: bool
  Dcmp2_HeaderParameters* = ref object of KaitaiStruct
    `unknown`*: uint16
    `numCustomLookupTableEntriesM1`*: uint8
    `flags`*: Dcmp2_HeaderParameters_Flags
    `parent`*: Dcmp2
    `numCustomLookupTableEntriesInst`: int
    `numCustomLookupTableEntriesInstFlag`: bool
  Dcmp2_HeaderParameters_Flags* = ref object of KaitaiStruct
    `reserved`*: uint64
    `tagged`*: bool
    `hasCustomLookupTable`*: bool
    `parent`*: Dcmp2_HeaderParameters
    `asIntInst`: uint8
    `asIntInstFlag`: bool
  Dcmp2_TaggedData* = ref object of KaitaiStruct
    `chunks`*: seq[Dcmp2_TaggedData_Chunk]
    `parent`*: Dcmp2
  Dcmp2_TaggedData_Chunk* = ref object of KaitaiStruct
    `tag`*: seq[bool]
    `units`*: seq[KaitaiStruct]
    `parent`*: Dcmp2_TaggedData
  Dcmp2_UntaggedData* = ref object of KaitaiStruct
    `tableReferences`*: seq[uint8]
    `parent`*: Dcmp2

proc read*(_: typedesc[Dcmp2], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct, lenDecompressed: any, headerParametersWithIo: any): Dcmp2
proc read*(_: typedesc[Dcmp2_HeaderParameters], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp2): Dcmp2_HeaderParameters
proc read*(_: typedesc[Dcmp2_HeaderParameters_Flags], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp2_HeaderParameters): Dcmp2_HeaderParameters_Flags
proc read*(_: typedesc[Dcmp2_TaggedData], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp2): Dcmp2_TaggedData
proc read*(_: typedesc[Dcmp2_TaggedData_Chunk], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp2_TaggedData): Dcmp2_TaggedData_Chunk
proc read*(_: typedesc[Dcmp2_UntaggedData], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp2): Dcmp2_UntaggedData

proc defaultLookupTable*(this: Dcmp2): seq[seq[byte]]
proc headerParameters*(this: Dcmp2): Dcmp2_HeaderParameters
proc isLenDecompressedOdd*(this: Dcmp2): bool
proc lookupTable*(this: Dcmp2): seq[seq[byte]]
proc numCustomLookupTableEntries*(this: Dcmp2_HeaderParameters): int
proc asInt*(this: Dcmp2_HeaderParameters_Flags): uint8


##[
Compressed resource data in `'dcmp' (2)` format,
as stored in compressed resources with header type `9` and decompressor ID `2`.

The `'dcmp' (2)` decompressor resource is included in the System file of System 7.0 and later.
This compression format is used for a few compressed resources in System 7.0's files
(such as the System file).
This decompressor is also included with and used by some other Apple applications,
such as ResEdit.
(Note: ResEdit includes the `'dcmp' (2)` resource,
but none of its resources actually use this decompressor.)

This compression format is based on simple dictionary coding,
where each byte in the compressed data expands to two bytes,
based on a lookup table
(either included in the compressed data or provided by the decompressor).
An alternative "tagged" compression format is also supported,
which allows using two-byte literals in addition to single-byte table references,
at the cost of requiring an extra "tag" byte every 16 output bytes,
to differentiate literals and table references.

@see <a href="https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/dcmp2.py">Source</a>
]##
proc read*(_: typedesc[Dcmp2], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct, lenDecompressed: any, headerParametersWithIo: any): Dcmp2 =
  template this: untyped = result
  this = new(Dcmp2)
  let root = if root == nil: cast[Dcmp2](this) else: cast[Dcmp2](root)
  this.io = io
  this.root = root
  this.parent = parent
  let lenDecompressedExpr = uint32(lenDecompressed)
  this.lenDecompressed = lenDecompressedExpr
  let headerParametersWithIoExpr = BytesWithIo(headerParametersWithIo)
  this.headerParametersWithIo = headerParametersWithIoExpr


  ##[
  The custom lookup table to be used instead of the default lookup table.

  ]##
  if this.headerParameters.flags.hasCustomLookupTable:
    for i in 0 ..< int(this.headerParameters.numCustomLookupTableEntries):
      let it = this.io.readBytes(int(2))
      this.customLookupTable.add(it)

  ##[
  The compressed data.
The structure of the data varies depending on whether the "tagged" or "untagged" variant of the compression format is used.

  ]##
  block:
    let on = this.headerParameters.flags.tagged
    if on == true:
      let rawDataExpr = this.io.readBytes(int((this.io.size - this.io.pos) - (if this.isLenDecompressedOdd: 1 else: 0)))
      this.rawData = rawDataExpr
      let rawDataIo = newKaitaiStream(rawDataExpr)
      let dataExpr = Dcmp2_TaggedData.read(rawDataIo, this.root, this)
      this.data = dataExpr
    else:
      let rawDataExpr = this.io.readBytes(int((this.io.size - this.io.pos) - (if this.isLenDecompressedOdd: 1 else: 0)))
      this.rawData = rawDataExpr
      let rawDataIo = newKaitaiStream(rawDataExpr)
      let dataExpr = Dcmp2_UntaggedData.read(rawDataIo, this.root, this)
      this.data = dataExpr

  ##[
  The last byte of the decompressed data,
stored literally.
Only present if the decompressed data has an odd length.

This special case is necessary because the compressed data is otherwise always stored in two-byte groups,
either literally or as table references,
so otherwise there would be no way to compress odd-length resources using this format.

  ]##
  if this.isLenDecompressedOdd:
    let lastByteExpr = this.io.readBytes(int(1))
    this.lastByte = lastByteExpr

proc defaultLookupTable(this: Dcmp2): seq[seq[byte]] = 

  ##[
  The default lookup table,
which is used if no custom lookup table is included with the compressed data.

  ]##
  if this.defaultLookupTableInstFlag:
    return this.defaultLookupTableInst
  let defaultLookupTableInstExpr = seq[seq[byte]](@[seq[byte](@[0'u8, 0'u8]), seq[byte](@[0'u8, 8'u8]), seq[byte](@[78'u8, 186'u8]), seq[byte](@[32'u8, 110'u8]), seq[byte](@[78'u8, 117'u8]), seq[byte](@[0'u8, 12'u8]), seq[byte](@[0'u8, 4'u8]), seq[byte](@[112'u8, 0'u8]), seq[byte](@[0'u8, 16'u8]), seq[byte](@[0'u8, 2'u8]), seq[byte](@[72'u8, 110'u8]), seq[byte](@[255'u8, 252'u8]), seq[byte](@[96'u8, 0'u8]), seq[byte](@[0'u8, 1'u8]), seq[byte](@[72'u8, 231'u8]), seq[byte](@[47'u8, 46'u8]), seq[byte](@[78'u8, 86'u8]), seq[byte](@[0'u8, 6'u8]), seq[byte](@[78'u8, 94'u8]), seq[byte](@[47'u8, 0'u8]), seq[byte](@[97'u8, 0'u8]), seq[byte](@[255'u8, 248'u8]), seq[byte](@[47'u8, 11'u8]), seq[byte](@[255'u8, 255'u8]), seq[byte](@[0'u8, 20'u8]), seq[byte](@[0'u8, 10'u8]), seq[byte](@[0'u8, 24'u8]), seq[byte](@[32'u8, 95'u8]), seq[byte](@[0'u8, 14'u8]), seq[byte](@[32'u8, 80'u8]), seq[byte](@[63'u8, 60'u8]), seq[byte](@[255'u8, 244'u8]), seq[byte](@[76'u8, 238'u8]), seq[byte](@[48'u8, 46'u8]), seq[byte](@[103'u8, 0'u8]), seq[byte](@[76'u8, 223'u8]), seq[byte](@[38'u8, 110'u8]), seq[byte](@[0'u8, 18'u8]), seq[byte](@[0'u8, 28'u8]), seq[byte](@[66'u8, 103'u8]), seq[byte](@[255'u8, 240'u8]), seq[byte](@[48'u8, 60'u8]), seq[byte](@[47'u8, 12'u8]), seq[byte](@[0'u8, 3'u8]), seq[byte](@[78'u8, 208'u8]), seq[byte](@[0'u8, 32'u8]), seq[byte](@[112'u8, 1'u8]), seq[byte](@[0'u8, 22'u8]), seq[byte](@[45'u8, 64'u8]), seq[byte](@[72'u8, 192'u8]), seq[byte](@[32'u8, 120'u8]), seq[byte](@[114'u8, 0'u8]), seq[byte](@[88'u8, 143'u8]), seq[byte](@[102'u8, 0'u8]), seq[byte](@[79'u8, 239'u8]), seq[byte](@[66'u8, 167'u8]), seq[byte](@[103'u8, 6'u8]), seq[byte](@[255'u8, 250'u8]), seq[byte](@[85'u8, 143'u8]), seq[byte](@[40'u8, 110'u8]), seq[byte](@[63'u8, 0'u8]), seq[byte](@[255'u8, 254'u8]), seq[byte](@[47'u8, 60'u8]), seq[byte](@[103'u8, 4'u8]), seq[byte](@[89'u8, 143'u8]), seq[byte](@[32'u8, 107'u8]), seq[byte](@[0'u8, 36'u8]), seq[byte](@[32'u8, 31'u8]), seq[byte](@[65'u8, 250'u8]), seq[byte](@[129'u8, 225'u8]), seq[byte](@[102'u8, 4'u8]), seq[byte](@[103'u8, 8'u8]), seq[byte](@[0'u8, 26'u8]), seq[byte](@[78'u8, 185'u8]), seq[byte](@[80'u8, 143'u8]), seq[byte](@[32'u8, 46'u8]), seq[byte](@[0'u8, 7'u8]), seq[byte](@[78'u8, 176'u8]), seq[byte](@[255'u8, 242'u8]), seq[byte](@[61'u8, 64'u8]), seq[byte](@[0'u8, 30'u8]), seq[byte](@[32'u8, 104'u8]), seq[byte](@[102'u8, 6'u8]), seq[byte](@[255'u8, 246'u8]), seq[byte](@[78'u8, 249'u8]), seq[byte](@[8'u8, 0'u8]), seq[byte](@[12'u8, 64'u8]), seq[byte](@[61'u8, 124'u8]), seq[byte](@[255'u8, 236'u8]), seq[byte](@[0'u8, 5'u8]), seq[byte](@[32'u8, 60'u8]), seq[byte](@[255'u8, 232'u8]), seq[byte](@[222'u8, 252'u8]), seq[byte](@[74'u8, 46'u8]), seq[byte](@[0'u8, 48'u8]), seq[byte](@[0'u8, 40'u8]), seq[byte](@[47'u8, 8'u8]), seq[byte](@[32'u8, 11'u8]), seq[byte](@[96'u8, 2'u8]), seq[byte](@[66'u8, 110'u8]), seq[byte](@[45'u8, 72'u8]), seq[byte](@[32'u8, 83'u8]), seq[byte](@[32'u8, 64'u8]), seq[byte](@[24'u8, 0'u8]), seq[byte](@[96'u8, 4'u8]), seq[byte](@[65'u8, 238'u8]), seq[byte](@[47'u8, 40'u8]), seq[byte](@[47'u8, 1'u8]), seq[byte](@[103'u8, 10'u8]), seq[byte](@[72'u8, 64'u8]), seq[byte](@[32'u8, 7'u8]), seq[byte](@[102'u8, 8'u8]), seq[byte](@[1'u8, 24'u8]), seq[byte](@[47'u8, 7'u8]), seq[byte](@[48'u8, 40'u8]), seq[byte](@[63'u8, 46'u8]), seq[byte](@[48'u8, 43'u8]), seq[byte](@[34'u8, 110'u8]), seq[byte](@[47'u8, 43'u8]), seq[byte](@[0'u8, 44'u8]), seq[byte](@[103'u8, 12'u8]), seq[byte](@[34'u8, 95'u8]), seq[byte](@[96'u8, 6'u8]), seq[byte](@[0'u8, 255'u8]), seq[byte](@[48'u8, 7'u8]), seq[byte](@[255'u8, 238'u8]), seq[byte](@[83'u8, 64'u8]), seq[byte](@[0'u8, 64'u8]), seq[byte](@[255'u8, 228'u8]), seq[byte](@[74'u8, 64'u8]), seq[byte](@[102'u8, 10'u8]), seq[byte](@[0'u8, 15'u8]), seq[byte](@[78'u8, 173'u8]), seq[byte](@[112'u8, 255'u8]), seq[byte](@[34'u8, 216'u8]), seq[byte](@[72'u8, 107'u8]), seq[byte](@[0'u8, 34'u8]), seq[byte](@[32'u8, 75'u8]), seq[byte](@[103'u8, 14'u8]), seq[byte](@[74'u8, 174'u8]), seq[byte](@[78'u8, 144'u8]), seq[byte](@[255'u8, 224'u8]), seq[byte](@[255'u8, 192'u8]), seq[byte](@[0'u8, 42'u8]), seq[byte](@[39'u8, 64'u8]), seq[byte](@[103'u8, 2'u8]), seq[byte](@[81'u8, 200'u8]), seq[byte](@[2'u8, 182'u8]), seq[byte](@[72'u8, 122'u8]), seq[byte](@[34'u8, 120'u8]), seq[byte](@[176'u8, 110'u8]), seq[byte](@[255'u8, 230'u8]), seq[byte](@[0'u8, 9'u8]), seq[byte](@[50'u8, 46'u8]), seq[byte](@[62'u8, 0'u8]), seq[byte](@[72'u8, 65'u8]), seq[byte](@[255'u8, 234'u8]), seq[byte](@[67'u8, 238'u8]), seq[byte](@[78'u8, 113'u8]), seq[byte](@[116'u8, 0'u8]), seq[byte](@[47'u8, 44'u8]), seq[byte](@[32'u8, 108'u8]), seq[byte](@[0'u8, 60'u8]), seq[byte](@[0'u8, 38'u8]), seq[byte](@[0'u8, 80'u8]), seq[byte](@[24'u8, 128'u8]), seq[byte](@[48'u8, 31'u8]), seq[byte](@[34'u8, 0'u8]), seq[byte](@[102'u8, 12'u8]), seq[byte](@[255'u8, 218'u8]), seq[byte](@[0'u8, 56'u8]), seq[byte](@[102'u8, 2'u8]), seq[byte](@[48'u8, 44'u8]), seq[byte](@[32'u8, 12'u8]), seq[byte](@[45'u8, 110'u8]), seq[byte](@[66'u8, 64'u8]), seq[byte](@[255'u8, 226'u8]), seq[byte](@[169'u8, 240'u8]), seq[byte](@[255'u8, 0'u8]), seq[byte](@[55'u8, 124'u8]), seq[byte](@[229'u8, 128'u8]), seq[byte](@[255'u8, 220'u8]), seq[byte](@[72'u8, 104'u8]), seq[byte](@[89'u8, 79'u8]), seq[byte](@[0'u8, 52'u8]), seq[byte](@[62'u8, 31'u8]), seq[byte](@[96'u8, 8'u8]), seq[byte](@[47'u8, 6'u8]), seq[byte](@[255'u8, 222'u8]), seq[byte](@[96'u8, 10'u8]), seq[byte](@[112'u8, 2'u8]), seq[byte](@[0'u8, 50'u8]), seq[byte](@[255'u8, 204'u8]), seq[byte](@[0'u8, 128'u8]), seq[byte](@[34'u8, 81'u8]), seq[byte](@[16'u8, 31'u8]), seq[byte](@[49'u8, 124'u8]), seq[byte](@[160'u8, 41'u8]), seq[byte](@[255'u8, 216'u8]), seq[byte](@[82'u8, 64'u8]), seq[byte](@[1'u8, 0'u8]), seq[byte](@[103'u8, 16'u8]), seq[byte](@[160'u8, 35'u8]), seq[byte](@[255'u8, 206'u8]), seq[byte](@[255'u8, 212'u8]), seq[byte](@[32'u8, 6'u8]), seq[byte](@[72'u8, 120'u8]), seq[byte](@[0'u8, 46'u8]), seq[byte](@[80'u8, 79'u8]), seq[byte](@[67'u8, 250'u8]), seq[byte](@[103'u8, 18'u8]), seq[byte](@[118'u8, 0'u8]), seq[byte](@[65'u8, 232'u8]), seq[byte](@[74'u8, 110'u8]), seq[byte](@[32'u8, 217'u8]), seq[byte](@[0'u8, 90'u8]), seq[byte](@[127'u8, 255'u8]), seq[byte](@[81'u8, 202'u8]), seq[byte](@[0'u8, 92'u8]), seq[byte](@[46'u8, 0'u8]), seq[byte](@[2'u8, 64'u8]), seq[byte](@[72'u8, 199'u8]), seq[byte](@[103'u8, 20'u8]), seq[byte](@[12'u8, 128'u8]), seq[byte](@[46'u8, 159'u8]), seq[byte](@[255'u8, 214'u8]), seq[byte](@[128'u8, 0'u8]), seq[byte](@[16'u8, 0'u8]), seq[byte](@[72'u8, 66'u8]), seq[byte](@[74'u8, 107'u8]), seq[byte](@[255'u8, 210'u8]), seq[byte](@[0'u8, 72'u8]), seq[byte](@[74'u8, 71'u8]), seq[byte](@[78'u8, 209'u8]), seq[byte](@[32'u8, 111'u8]), seq[byte](@[0'u8, 65'u8]), seq[byte](@[96'u8, 12'u8]), seq[byte](@[42'u8, 120'u8]), seq[byte](@[66'u8, 46'u8]), seq[byte](@[50'u8, 0'u8]), seq[byte](@[101'u8, 116'u8]), seq[byte](@[103'u8, 22'u8]), seq[byte](@[0'u8, 68'u8]), seq[byte](@[72'u8, 109'u8]), seq[byte](@[32'u8, 8'u8]), seq[byte](@[72'u8, 108'u8]), seq[byte](@[11'u8, 124'u8]), seq[byte](@[38'u8, 64'u8]), seq[byte](@[4'u8, 0'u8]), seq[byte](@[0'u8, 104'u8]), seq[byte](@[32'u8, 109'u8]), seq[byte](@[0'u8, 13'u8]), seq[byte](@[42'u8, 64'u8]), seq[byte](@[0'u8, 11'u8]), seq[byte](@[0'u8, 62'u8]), seq[byte](@[2'u8, 32'u8])])
  this.defaultLookupTableInst = defaultLookupTableInstExpr
  this.defaultLookupTableInstFlag = true
  return this.defaultLookupTableInst

proc headerParameters(this: Dcmp2): Dcmp2_HeaderParameters = 

  ##[
  The parsed decompressor-specific parameters from the compressed resource header.

  ]##
  if this.headerParametersInstFlag:
    return this.headerParametersInst
  let io = this.headerParametersWithIo.io
  let pos = io.pos()
  io.seek(int(0))
  let headerParametersInstExpr = Dcmp2_HeaderParameters.read(io, this.root, this)
  this.headerParametersInst = headerParametersInstExpr
  io.seek(pos)
  this.headerParametersInstFlag = true
  return this.headerParametersInst

proc isLenDecompressedOdd(this: Dcmp2): bool = 

  ##[
  Whether the length of the decompressed data is odd.
This affects the meaning of the last byte of the compressed data.

  ]##
  if this.isLenDecompressedOddInstFlag:
    return this.isLenDecompressedOddInst
  let isLenDecompressedOddInstExpr = bool(this.lenDecompressed %%% 2 != 0)
  this.isLenDecompressedOddInst = isLenDecompressedOddInstExpr
  this.isLenDecompressedOddInstFlag = true
  return this.isLenDecompressedOddInst

proc lookupTable(this: Dcmp2): seq[seq[byte]] = 

  ##[
  The lookup table to be used for this compressed data.

  ]##
  if this.lookupTableInstFlag:
    return this.lookupTableInst
  let lookupTableInstExpr = seq[seq[byte]]((if this.headerParameters.flags.hasCustomLookupTable: this.customLookupTable else: this.defaultLookupTable))
  this.lookupTableInst = lookupTableInstExpr
  this.lookupTableInstFlag = true
  return this.lookupTableInst

proc fromFile*(_: typedesc[Dcmp2], filename: string): Dcmp2 =
  Dcmp2.read(newKaitaiFileStream(filename), nil, nil)


##[
Decompressor-specific parameters for this compression format,
as stored in the compressed resource header.

]##
proc read*(_: typedesc[Dcmp2_HeaderParameters], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp2): Dcmp2_HeaderParameters =
  template this: untyped = result
  this = new(Dcmp2_HeaderParameters)
  let root = if root == nil: cast[Dcmp2](this) else: cast[Dcmp2](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The meaning of this field is unknown.
It does not appear to have any effect on the format of the compressed data or the decompression process.

The value of this field is usually zero and otherwise a small integer (< 10).
For `'lpch'` resources,
the value is always nonzero,
and sometimes larger than usual.

  ]##
  let unknownExpr = this.io.readU2be()
  this.unknown = unknownExpr

  ##[
  The number of entries in the custom lookup table,
minus one.

If the default lookup table is used rather than a custom one,
this value is zero.

  ]##
  let numCustomLookupTableEntriesM1Expr = this.io.readU1()
  this.numCustomLookupTableEntriesM1 = numCustomLookupTableEntriesM1Expr

  ##[
  Various flags that affect the format of the compressed data and the decompression process.

  ]##
  let flagsExpr = Dcmp2_HeaderParameters_Flags.read(this.io, this.root, this)
  this.flags = flagsExpr

proc numCustomLookupTableEntries(this: Dcmp2_HeaderParameters): int = 

  ##[
  The number of entries in the custom lookup table.
Only used if a custom lookup table is present.

  ]##
  if this.numCustomLookupTableEntriesInstFlag:
    return this.numCustomLookupTableEntriesInst
  if this.flags.hasCustomLookupTable:
    let numCustomLookupTableEntriesInstExpr = int(this.numCustomLookupTableEntriesM1 + 1)
    this.numCustomLookupTableEntriesInst = numCustomLookupTableEntriesInstExpr
  this.numCustomLookupTableEntriesInstFlag = true
  return this.numCustomLookupTableEntriesInst

proc fromFile*(_: typedesc[Dcmp2_HeaderParameters], filename: string): Dcmp2_HeaderParameters =
  Dcmp2_HeaderParameters.read(newKaitaiFileStream(filename), nil, nil)


##[
Flags for the decompressor,
as stored in the decompressor-specific parameters.

]##
proc read*(_: typedesc[Dcmp2_HeaderParameters_Flags], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp2_HeaderParameters): Dcmp2_HeaderParameters_Flags =
  template this: untyped = result
  this = new(Dcmp2_HeaderParameters_Flags)
  let root = if root == nil: cast[Dcmp2](this) else: cast[Dcmp2](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  These flags have no known usage or meaning and should always be zero.

  ]##
  let reservedExpr = this.io.readBitsIntBe(6)
  this.reserved = reservedExpr

  ##[
  Whether the "tagged" variant of this compression format should be used,
rather than the default "untagged" variant.

  ]##
  let taggedExpr = this.io.readBitsIntBe(1) != 0
  this.tagged = taggedExpr

  ##[
  Whether a custom lookup table is included before the compressed data,
which should be used instead of the default hardcoded lookup table.

  ]##
  let hasCustomLookupTableExpr = this.io.readBitsIntBe(1) != 0
  this.hasCustomLookupTable = hasCustomLookupTableExpr

proc asInt(this: Dcmp2_HeaderParameters_Flags): uint8 = 

  ##[
  The flags as a packed integer,
as they are stored in the data.

  ]##
  if this.asIntInstFlag:
    return this.asIntInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  let asIntInstExpr = this.io.readU1()
  this.asIntInst = asIntInstExpr
  this.io.seek(pos)
  this.asIntInstFlag = true
  return this.asIntInst

proc fromFile*(_: typedesc[Dcmp2_HeaderParameters_Flags], filename: string): Dcmp2_HeaderParameters_Flags =
  Dcmp2_HeaderParameters_Flags.read(newKaitaiFileStream(filename), nil, nil)


##[
Compressed data in the "tagged" variant of the format.

]##
proc read*(_: typedesc[Dcmp2_TaggedData], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp2): Dcmp2_TaggedData =
  template this: untyped = result
  this = new(Dcmp2_TaggedData)
  let root = if root == nil: cast[Dcmp2](this) else: cast[Dcmp2](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The tagged chunks that make up the compressed data.

  ]##
  block:
    var i: int
    while not this.io.isEof:
      let it = Dcmp2_TaggedData_Chunk.read(this.io, this.root, this)
      this.chunks.add(it)
      inc i

proc fromFile*(_: typedesc[Dcmp2_TaggedData], filename: string): Dcmp2_TaggedData =
  Dcmp2_TaggedData.read(newKaitaiFileStream(filename), nil, nil)


##[
A single tagged chunk of compressed data.

Each chunk expands to 16 bytes of decompressed data.
In compressed form,
the chunks have a variable length
(between 9 and 17 bytes)
depending on the value of the tag byte.

]##
proc read*(_: typedesc[Dcmp2_TaggedData_Chunk], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp2_TaggedData): Dcmp2_TaggedData_Chunk =
  template this: untyped = result
  this = new(Dcmp2_TaggedData_Chunk)
  let root = if root == nil: cast[Dcmp2](this) else: cast[Dcmp2](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The bits of the tag byte control the format and meaning of the 8 compressed data units that follow the tag byte.

  ]##
  for i in 0 ..< int(8):
    let it = this.io.readBitsIntBe(1) != 0
    this.tag.add(it)
  alignToByte(this.io)

  ##[
  The compressed data units in this chunk.

The format and meaning of each unit is controlled by the bit in the tag byte with the same index.
If the bit is 0 (false),
the unit is a pair of bytes,
which are literally copied to the decompressed data.
If the bit is 1 (true),
the unit is a reference into the lookup table,
an integer which is expanded to two bytes by looking it up in the table.

  ]##
  block:
    var i: int
    while true:
      block:
        let on = this.tag[i]
        if on == true:
          let it = KaitaiStruct(this.io.readU1())
          this.units.add(it)
        else:
          let it = this.io.readBytes(int((if this.tag[i]: 1 else: 2)))
          this.units.add(it)
      if  ((i >= 7) or (this.io.isEof)) :
        break
      inc i

proc fromFile*(_: typedesc[Dcmp2_TaggedData_Chunk], filename: string): Dcmp2_TaggedData_Chunk =
  Dcmp2_TaggedData_Chunk.read(newKaitaiFileStream(filename), nil, nil)


##[
Compressed data in the "untagged" variant of the format.

]##
proc read*(_: typedesc[Dcmp2_UntaggedData], io: KaitaiStream, root: KaitaiStruct, parent: Dcmp2): Dcmp2_UntaggedData =
  template this: untyped = result
  this = new(Dcmp2_UntaggedData)
  let root = if root == nil: cast[Dcmp2](this) else: cast[Dcmp2](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  References into the lookup table.
Each reference is an integer that is expanded to two bytes by looking it up in the table.

  ]##
  block:
    var i: int
    while not this.io.isEof:
      let it = this.io.readU1()
      this.tableReferences.add(it)
      inc i

proc fromFile*(_: typedesc[Dcmp2_UntaggedData], filename: string): Dcmp2_UntaggedData =
  Dcmp2_UntaggedData.read(newKaitaiFileStream(filename), nil, nil)


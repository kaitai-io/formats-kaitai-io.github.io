import kaitai_struct_nim_runtime
import options

type
  ZxSpectrumTap* = ref object of KaitaiStruct
    `blocks`*: seq[ZxSpectrumTap_Block]
    `parent`*: KaitaiStruct
  ZxSpectrumTap_FlagEnum* = enum
    header = 0
    data = 255
  ZxSpectrumTap_HeaderTypeEnum* = enum
    program = 0
    num_array = 1
    char_array = 2
    bytes = 3
  ZxSpectrumTap_ArrayParams* = ref object of KaitaiStruct
    `reserved`*: uint8
    `varName`*: uint8
    `reserved1`*: seq[byte]
    `parent`*: ZxSpectrumTap_Header
  ZxSpectrumTap_Block* = ref object of KaitaiStruct
    `lenBlock`*: uint16
    `flag`*: ZxSpectrumTap_FlagEnum
    `header`*: ZxSpectrumTap_Header
    `data`*: seq[byte]
    `headerlessData`*: seq[byte]
    `parent`*: ZxSpectrumTap
  ZxSpectrumTap_BytesParams* = ref object of KaitaiStruct
    `startAddress`*: uint16
    `reserved`*: seq[byte]
    `parent`*: ZxSpectrumTap_Header
  ZxSpectrumTap_Header* = ref object of KaitaiStruct
    `headerType`*: ZxSpectrumTap_HeaderTypeEnum
    `filename`*: seq[byte]
    `lenData`*: uint16
    `params`*: KaitaiStruct
    `checksum`*: uint8
    `parent`*: ZxSpectrumTap_Block
  ZxSpectrumTap_ProgramParams* = ref object of KaitaiStruct
    `autostartLine`*: uint16
    `lenProgram`*: uint16
    `parent`*: ZxSpectrumTap_Header

proc read*(_: typedesc[ZxSpectrumTap], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): ZxSpectrumTap
proc read*(_: typedesc[ZxSpectrumTap_ArrayParams], io: KaitaiStream, root: KaitaiStruct, parent: ZxSpectrumTap_Header): ZxSpectrumTap_ArrayParams
proc read*(_: typedesc[ZxSpectrumTap_Block], io: KaitaiStream, root: KaitaiStruct, parent: ZxSpectrumTap): ZxSpectrumTap_Block
proc read*(_: typedesc[ZxSpectrumTap_BytesParams], io: KaitaiStream, root: KaitaiStruct, parent: ZxSpectrumTap_Header): ZxSpectrumTap_BytesParams
proc read*(_: typedesc[ZxSpectrumTap_Header], io: KaitaiStream, root: KaitaiStruct, parent: ZxSpectrumTap_Block): ZxSpectrumTap_Header
proc read*(_: typedesc[ZxSpectrumTap_ProgramParams], io: KaitaiStream, root: KaitaiStruct, parent: ZxSpectrumTap_Header): ZxSpectrumTap_ProgramParams



##[
TAP files are used by emulators of ZX Spectrum computer (released in
1982 by Sinclair Research). TAP file stores blocks of data as if
they are written to magnetic tape, which was used as primary media
for ZX Spectrum. Contents of this file can be viewed as a very
simple linear filesystem, storing named files with some basic
metainformation prepended as a header.

@see <a href="https://sinclair.wiki.zxnet.co.uk/wiki/TAP_format">Source</a>
]##
proc read*(_: typedesc[ZxSpectrumTap], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): ZxSpectrumTap =
  template this: untyped = result
  this = new(ZxSpectrumTap)
  let root = if root == nil: cast[ZxSpectrumTap](this) else: cast[ZxSpectrumTap](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = ZxSpectrumTap_Block.read(this.io, this.root, this)
      this.blocks.add(it)
      inc i

proc fromFile*(_: typedesc[ZxSpectrumTap], filename: string): ZxSpectrumTap =
  ZxSpectrumTap.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ZxSpectrumTap_ArrayParams], io: KaitaiStream, root: KaitaiStruct, parent: ZxSpectrumTap_Header): ZxSpectrumTap_ArrayParams =
  template this: untyped = result
  this = new(ZxSpectrumTap_ArrayParams)
  let root = if root == nil: cast[ZxSpectrumTap](this) else: cast[ZxSpectrumTap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readU1()
  this.reserved = reservedExpr

  ##[
  Variable name (1..26 meaning A$..Z$ +192)
  ]##
  let varNameExpr = this.io.readU1()
  this.varName = varNameExpr
  let reserved1Expr = this.io.readBytes(int(2))
  this.reserved1 = reserved1Expr

proc fromFile*(_: typedesc[ZxSpectrumTap_ArrayParams], filename: string): ZxSpectrumTap_ArrayParams =
  ZxSpectrumTap_ArrayParams.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ZxSpectrumTap_Block], io: KaitaiStream, root: KaitaiStruct, parent: ZxSpectrumTap): ZxSpectrumTap_Block =
  template this: untyped = result
  this = new(ZxSpectrumTap_Block)
  let root = if root == nil: cast[ZxSpectrumTap](this) else: cast[ZxSpectrumTap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenBlockExpr = this.io.readU2le()
  this.lenBlock = lenBlockExpr
  let flagExpr = ZxSpectrumTap_FlagEnum(this.io.readU1())
  this.flag = flagExpr
  if  ((this.lenBlock == 19) and (this.flag == zx_spectrum_tap.header)) :
    let headerExpr = ZxSpectrumTap_Header.read(this.io, this.root, this)
    this.header = headerExpr
  if this.lenBlock == 19:
    let dataExpr = this.io.readBytes(int(this.header.lenData + 4))
    this.data = dataExpr
  if this.flag == zx_spectrum_tap.data:
    let headerlessDataExpr = this.io.readBytes(int(this.lenBlock - 1))
    this.headerlessData = headerlessDataExpr

proc fromFile*(_: typedesc[ZxSpectrumTap_Block], filename: string): ZxSpectrumTap_Block =
  ZxSpectrumTap_Block.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ZxSpectrumTap_BytesParams], io: KaitaiStream, root: KaitaiStruct, parent: ZxSpectrumTap_Header): ZxSpectrumTap_BytesParams =
  template this: untyped = result
  this = new(ZxSpectrumTap_BytesParams)
  let root = if root == nil: cast[ZxSpectrumTap](this) else: cast[ZxSpectrumTap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let startAddressExpr = this.io.readU2le()
  this.startAddress = startAddressExpr
  let reservedExpr = this.io.readBytes(int(2))
  this.reserved = reservedExpr

proc fromFile*(_: typedesc[ZxSpectrumTap_BytesParams], filename: string): ZxSpectrumTap_BytesParams =
  ZxSpectrumTap_BytesParams.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ZxSpectrumTap_Header], io: KaitaiStream, root: KaitaiStruct, parent: ZxSpectrumTap_Block): ZxSpectrumTap_Header =
  template this: untyped = result
  this = new(ZxSpectrumTap_Header)
  let root = if root == nil: cast[ZxSpectrumTap](this) else: cast[ZxSpectrumTap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerTypeExpr = ZxSpectrumTap_HeaderTypeEnum(this.io.readU1())
  this.headerType = headerTypeExpr
  let filenameExpr = this.io.readBytes(int(10)).bytesStripRight(32)
  this.filename = filenameExpr
  let lenDataExpr = this.io.readU2le()
  this.lenData = lenDataExpr
  block:
    let on = this.headerType
    if on == zx_spectrum_tap.bytes:
      let paramsExpr = ZxSpectrumTap_BytesParams.read(this.io, this.root, this)
      this.params = paramsExpr
    elif on == zx_spectrum_tap.char_array:
      let paramsExpr = ZxSpectrumTap_ArrayParams.read(this.io, this.root, this)
      this.params = paramsExpr
    elif on == zx_spectrum_tap.num_array:
      let paramsExpr = ZxSpectrumTap_ArrayParams.read(this.io, this.root, this)
      this.params = paramsExpr
    elif on == zx_spectrum_tap.program:
      let paramsExpr = ZxSpectrumTap_ProgramParams.read(this.io, this.root, this)
      this.params = paramsExpr

  ##[
  Bitwise XOR of all bytes including the flag byte
  ]##
  let checksumExpr = this.io.readU1()
  this.checksum = checksumExpr

proc fromFile*(_: typedesc[ZxSpectrumTap_Header], filename: string): ZxSpectrumTap_Header =
  ZxSpectrumTap_Header.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ZxSpectrumTap_ProgramParams], io: KaitaiStream, root: KaitaiStruct, parent: ZxSpectrumTap_Header): ZxSpectrumTap_ProgramParams =
  template this: untyped = result
  this = new(ZxSpectrumTap_ProgramParams)
  let root = if root == nil: cast[ZxSpectrumTap](this) else: cast[ZxSpectrumTap](root)
  this.io = io
  this.root = root
  this.parent = parent

  let autostartLineExpr = this.io.readU2le()
  this.autostartLine = autostartLineExpr
  let lenProgramExpr = this.io.readU2le()
  this.lenProgram = lenProgramExpr

proc fromFile*(_: typedesc[ZxSpectrumTap_ProgramParams], filename: string): ZxSpectrumTap_ProgramParams =
  ZxSpectrumTap_ProgramParams.read(newKaitaiFileStream(filename), nil, nil)


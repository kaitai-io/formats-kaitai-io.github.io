import kaitai_struct_nim_runtime
import options

type
  CpioOldLe* = ref object of KaitaiStruct
    `files`*: seq[CpioOldLe_File]
    `parent`*: KaitaiStruct
  CpioOldLe_File* = ref object of KaitaiStruct
    `header`*: CpioOldLe_FileHeader
    `pathName`*: seq[byte]
    `stringTerminator`*: seq[byte]
    `pathNamePadding`*: seq[byte]
    `fileData`*: seq[byte]
    `fileDataPadding`*: seq[byte]
    `endOfFilePadding`*: seq[byte]
    `parent`*: CpioOldLe
  CpioOldLe_FileHeader* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `deviceNumber`*: uint16
    `inodeNumber`*: uint16
    `mode`*: uint16
    `userId`*: uint16
    `groupId`*: uint16
    `numberOfLinks`*: uint16
    `rDeviceNumber`*: uint16
    `modificationTime`*: CpioOldLe_FourByteUnsignedInteger
    `pathNameSize`*: uint16
    `fileSize`*: CpioOldLe_FourByteUnsignedInteger
    `parent`*: CpioOldLe_File
  CpioOldLe_FourByteUnsignedInteger* = ref object of KaitaiStruct
    `mostSignificantBits`*: uint16
    `leastSignificantBits`*: uint16
    `parent`*: CpioOldLe_FileHeader
    `valueInst`: int
    `valueInstFlag`: bool

proc read*(_: typedesc[CpioOldLe], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): CpioOldLe
proc read*(_: typedesc[CpioOldLe_File], io: KaitaiStream, root: KaitaiStruct, parent: CpioOldLe): CpioOldLe_File
proc read*(_: typedesc[CpioOldLe_FileHeader], io: KaitaiStream, root: KaitaiStruct, parent: CpioOldLe_File): CpioOldLe_FileHeader
proc read*(_: typedesc[CpioOldLe_FourByteUnsignedInteger], io: KaitaiStream, root: KaitaiStruct, parent: CpioOldLe_FileHeader): CpioOldLe_FourByteUnsignedInteger

proc value*(this: CpioOldLe_FourByteUnsignedInteger): int

proc read*(_: typedesc[CpioOldLe], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): CpioOldLe =
  template this: untyped = result
  this = new(CpioOldLe)
  let root = if root == nil: cast[CpioOldLe](this) else: cast[CpioOldLe](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = CpioOldLe_File.read(this.io, this.root, this)
      this.files.add(it)
      inc i

proc fromFile*(_: typedesc[CpioOldLe], filename: string): CpioOldLe =
  CpioOldLe.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[CpioOldLe_File], io: KaitaiStream, root: KaitaiStruct, parent: CpioOldLe): CpioOldLe_File =
  template this: untyped = result
  this = new(CpioOldLe_File)
  let root = if root == nil: cast[CpioOldLe](this) else: cast[CpioOldLe](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = CpioOldLe_FileHeader.read(this.io, this.root, this)
  this.header = headerExpr
  let pathNameExpr = this.io.readBytes(int(this.header.pathNameSize - 1))
  this.pathName = pathNameExpr
  let stringTerminatorExpr = this.io.readBytes(int(1))
  this.stringTerminator = stringTerminatorExpr
  if this.header.pathNameSize %%% 2 == 1:
    let pathNamePaddingExpr = this.io.readBytes(int(1))
    this.pathNamePadding = pathNamePaddingExpr
  let fileDataExpr = this.io.readBytes(int(this.header.fileSize.value))
  this.fileData = fileDataExpr
  if this.header.fileSize.value %%% 2 == 1:
    let fileDataPaddingExpr = this.io.readBytes(int(1))
    this.fileDataPadding = fileDataPaddingExpr
  if  ((this.pathName == @[84'u8, 82'u8, 65'u8, 73'u8, 76'u8, 69'u8, 82'u8, 33'u8, 33'u8, 33'u8]) and (this.header.fileSize.value == 0)) :
    let endOfFilePaddingExpr = this.io.readBytesFull()
    this.endOfFilePadding = endOfFilePaddingExpr

proc fromFile*(_: typedesc[CpioOldLe_File], filename: string): CpioOldLe_File =
  CpioOldLe_File.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[CpioOldLe_FileHeader], io: KaitaiStream, root: KaitaiStruct, parent: CpioOldLe_File): CpioOldLe_FileHeader =
  template this: untyped = result
  this = new(CpioOldLe_FileHeader)
  let root = if root == nil: cast[CpioOldLe](this) else: cast[CpioOldLe](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(2))
  this.magic = magicExpr
  let deviceNumberExpr = this.io.readU2le()
  this.deviceNumber = deviceNumberExpr
  let inodeNumberExpr = this.io.readU2le()
  this.inodeNumber = inodeNumberExpr
  let modeExpr = this.io.readU2le()
  this.mode = modeExpr
  let userIdExpr = this.io.readU2le()
  this.userId = userIdExpr
  let groupIdExpr = this.io.readU2le()
  this.groupId = groupIdExpr
  let numberOfLinksExpr = this.io.readU2le()
  this.numberOfLinks = numberOfLinksExpr
  let rDeviceNumberExpr = this.io.readU2le()
  this.rDeviceNumber = rDeviceNumberExpr
  let modificationTimeExpr = CpioOldLe_FourByteUnsignedInteger.read(this.io, this.root, this)
  this.modificationTime = modificationTimeExpr
  let pathNameSizeExpr = this.io.readU2le()
  this.pathNameSize = pathNameSizeExpr
  let fileSizeExpr = CpioOldLe_FourByteUnsignedInteger.read(this.io, this.root, this)
  this.fileSize = fileSizeExpr

proc fromFile*(_: typedesc[CpioOldLe_FileHeader], filename: string): CpioOldLe_FileHeader =
  CpioOldLe_FileHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[CpioOldLe_FourByteUnsignedInteger], io: KaitaiStream, root: KaitaiStruct, parent: CpioOldLe_FileHeader): CpioOldLe_FourByteUnsignedInteger =
  template this: untyped = result
  this = new(CpioOldLe_FourByteUnsignedInteger)
  let root = if root == nil: cast[CpioOldLe](this) else: cast[CpioOldLe](root)
  this.io = io
  this.root = root
  this.parent = parent

  let mostSignificantBitsExpr = this.io.readU2le()
  this.mostSignificantBits = mostSignificantBitsExpr
  let leastSignificantBitsExpr = this.io.readU2le()
  this.leastSignificantBits = leastSignificantBitsExpr

proc value(this: CpioOldLe_FourByteUnsignedInteger): int = 
  if this.valueInstFlag:
    return this.valueInst
  let valueInstExpr = int(this.leastSignificantBits + this.mostSignificantBits shl 16)
  this.valueInst = valueInstExpr
  this.valueInstFlag = true
  return this.valueInst

proc fromFile*(_: typedesc[CpioOldLe_FourByteUnsignedInteger], filename: string): CpioOldLe_FourByteUnsignedInteger =
  CpioOldLe_FourByteUnsignedInteger.read(newKaitaiFileStream(filename), nil, nil)


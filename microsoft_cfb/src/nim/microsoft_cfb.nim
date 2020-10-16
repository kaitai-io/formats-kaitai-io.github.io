import kaitai_struct_nim_runtime
import options

type
  MicrosoftCfb* = ref object of KaitaiStruct
    `header`*: MicrosoftCfb_CfbHeader
    `parent`*: KaitaiStruct
    `rawFatInst`*: seq[byte]
    `sectorSizeInst`*: int
    `fatInst`*: MicrosoftCfb_FatEntries
    `dirInst`*: MicrosoftCfb_DirEntry
  MicrosoftCfb_CfbHeader* = ref object of KaitaiStruct
    `signature`*: seq[byte]
    `clsid`*: seq[byte]
    `versionMinor`*: uint16
    `versionMajor`*: uint16
    `byteOrder`*: seq[byte]
    `sectorShift`*: uint16
    `miniSectorShift`*: uint16
    `reserved1`*: seq[byte]
    `sizeDir`*: int32
    `sizeFat`*: int32
    `ofsDir`*: int32
    `transactionSeq`*: int32
    `miniStreamCutoffSize`*: int32
    `ofsMiniFat`*: int32
    `sizeMiniFat`*: int32
    `ofsDifat`*: int32
    `sizeDifat`*: int32
    `difat`*: seq[int32]
    `parent`*: MicrosoftCfb
  MicrosoftCfb_FatEntries* = ref object of KaitaiStruct
    `entries`*: seq[int32]
    `parent`*: MicrosoftCfb
  MicrosoftCfb_DirEntry* = ref object of KaitaiStruct
    `name`*: string
    `nameLen`*: uint16
    `objectType`*: MicrosoftCfb_DirEntry_ObjType
    `colorFlag`*: MicrosoftCfb_DirEntry_RbColor
    `leftSiblingId`*: int32
    `rightSiblingId`*: int32
    `childId`*: int32
    `clsid`*: seq[byte]
    `state`*: uint32
    `timeCreate`*: uint64
    `timeMod`*: uint64
    `ofs`*: int32
    `size`*: uint64
    `parent`*: KaitaiStruct
    `miniStreamInst`*: seq[byte]
    `childInst`*: MicrosoftCfb_DirEntry
    `leftSiblingInst`*: MicrosoftCfb_DirEntry
    `rightSiblingInst`*: MicrosoftCfb_DirEntry
  MicrosoftCfb_DirEntry_ObjType* = enum
    unknown = 0
    storage = 1
    stream = 2
    root_storage = 5
  MicrosoftCfb_DirEntry_RbColor* = enum
    red = 0
    black = 1

proc read*(_: typedesc[MicrosoftCfb], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MicrosoftCfb
proc read*(_: typedesc[MicrosoftCfb_CfbHeader], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftCfb): MicrosoftCfb_CfbHeader
proc read*(_: typedesc[MicrosoftCfb_FatEntries], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftCfb): MicrosoftCfb_FatEntries
proc read*(_: typedesc[MicrosoftCfb_DirEntry], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MicrosoftCfb_DirEntry

proc sectorSize*(this: MicrosoftCfb): int
proc fat*(this: MicrosoftCfb): MicrosoftCfb_FatEntries
proc dir*(this: MicrosoftCfb): MicrosoftCfb_DirEntry
proc miniStream*(this: MicrosoftCfb_DirEntry): seq[byte]
proc child*(this: MicrosoftCfb_DirEntry): MicrosoftCfb_DirEntry
proc leftSibling*(this: MicrosoftCfb_DirEntry): MicrosoftCfb_DirEntry
proc rightSibling*(this: MicrosoftCfb_DirEntry): MicrosoftCfb_DirEntry

proc read*(_: typedesc[MicrosoftCfb], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MicrosoftCfb =
  template this: untyped = result
  this = new(MicrosoftCfb)
  let root = if root == nil: cast[MicrosoftCfb](this) else: cast[MicrosoftCfb](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = MicrosoftCfb_CfbHeader.read(this.io, this.root, this)
  this.header = headerExpr

proc sectorSize(this: MicrosoftCfb): int = 
  if this.sectorSizeInst != nil:
    return this.sectorSizeInst
  let sectorSizeInstExpr = int((1 shl this.header.sectorShift))
  this.sectorSizeInst = sectorSizeInstExpr
  if this.sectorSizeInst != nil:
    return this.sectorSizeInst

proc fat(this: MicrosoftCfb): MicrosoftCfb_FatEntries = 
  if this.fatInst != nil:
    return this.fatInst
  let pos = this.io.pos()
  this.io.seek(int(this.sectorSize))
  let rawFatInstExpr = this.io.readBytes(int((this.header.sizeFat * this.sectorSize)))
  this.rawFatInst = rawFatInstExpr
  let rawFatInstIo = newKaitaiStream(rawFatInstExpr)
  let fatInstExpr = MicrosoftCfb_FatEntries.read(rawFatInstIo, this.root, this)
  this.fatInst = fatInstExpr
  this.io.seek(pos)
  if this.fatInst != nil:
    return this.fatInst

proc dir(this: MicrosoftCfb): MicrosoftCfb_DirEntry = 
  if this.dirInst != nil:
    return this.dirInst
  let pos = this.io.pos()
  this.io.seek(int(((this.header.ofsDir + 1) * this.sectorSize)))
  let dirInstExpr = MicrosoftCfb_DirEntry.read(this.io, this.root, this)
  this.dirInst = dirInstExpr
  this.io.seek(pos)
  if this.dirInst != nil:
    return this.dirInst

proc fromFile*(_: typedesc[MicrosoftCfb], filename: string): MicrosoftCfb =
  MicrosoftCfb.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MicrosoftCfb_CfbHeader], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftCfb): MicrosoftCfb_CfbHeader =
  template this: untyped = result
  this = new(MicrosoftCfb_CfbHeader)
  let root = if root == nil: cast[MicrosoftCfb](this) else: cast[MicrosoftCfb](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Magic bytes that confirm that this is a CFB file
  ]##
  let signatureExpr = this.io.readBytes(int(8))
  this.signature = signatureExpr

  ##[
  Reserved class ID field, must be all 0
  ]##
  let clsidExpr = this.io.readBytes(int(16))
  this.clsid = clsidExpr
  let versionMinorExpr = this.io.readU2le()
  this.versionMinor = versionMinorExpr
  let versionMajorExpr = this.io.readU2le()
  this.versionMajor = versionMajorExpr

  ##[
  In theory, specifies a byte order. In practice, no other values besides FE FF (which imply little endian order) are used.
  ]##
  let byteOrderExpr = this.io.readBytes(int(2))
  this.byteOrder = byteOrderExpr

  ##[
  For major version 3, must be 0x9 (sector size = 512 bytes). For major version 4, must be 0xc (sector size = 4096 bytes).
  ]##
  let sectorShiftExpr = this.io.readU2le()
  this.sectorShift = sectorShiftExpr
  let miniSectorShiftExpr = this.io.readU2le()
  this.miniSectorShift = miniSectorShiftExpr
  let reserved1Expr = this.io.readBytes(int(6))
  this.reserved1 = reserved1Expr

  ##[
  Number of directory sectors in this file. For major version 3, must be 0.
  ]##
  let sizeDirExpr = this.io.readS4le()
  this.sizeDir = sizeDirExpr

  ##[
  Number of FAT sectors in this file.
  ]##
  let sizeFatExpr = this.io.readS4le()
  this.sizeFat = sizeFatExpr

  ##[
  Starting sector number for directory stream.
  ]##
  let ofsDirExpr = this.io.readS4le()
  this.ofsDir = ofsDirExpr

  ##[
  A transaction sequence number, which is incremented each time the file is saved if transactions are implemented, 0 otherwise.
  ]##
  let transactionSeqExpr = this.io.readS4le()
  this.transactionSeq = transactionSeqExpr
  let miniStreamCutoffSizeExpr = this.io.readS4le()
  this.miniStreamCutoffSize = miniStreamCutoffSizeExpr

  ##[
  Starting sector number for mini FAT.
  ]##
  let ofsMiniFatExpr = this.io.readS4le()
  this.ofsMiniFat = ofsMiniFatExpr

  ##[
  Number of mini FAT sectors in this file.
  ]##
  let sizeMiniFatExpr = this.io.readS4le()
  this.sizeMiniFat = sizeMiniFatExpr

  ##[
  Starting sector number for DIFAT.
  ]##
  let ofsDifatExpr = this.io.readS4le()
  this.ofsDifat = ofsDifatExpr

  ##[
  Number of DIFAT sectors in this file.
  ]##
  let sizeDifatExpr = this.io.readS4le()
  this.sizeDifat = sizeDifatExpr
  for i in 0 ..< int(109):
    let it = this.io.readS4le()
    this.difat.add(it)

proc fromFile*(_: typedesc[MicrosoftCfb_CfbHeader], filename: string): MicrosoftCfb_CfbHeader =
  MicrosoftCfb_CfbHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MicrosoftCfb_FatEntries], io: KaitaiStream, root: KaitaiStruct, parent: MicrosoftCfb): MicrosoftCfb_FatEntries =
  template this: untyped = result
  this = new(MicrosoftCfb_FatEntries)
  let root = if root == nil: cast[MicrosoftCfb](this) else: cast[MicrosoftCfb](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = this.io.readS4le()
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[MicrosoftCfb_FatEntries], filename: string): MicrosoftCfb_FatEntries =
  MicrosoftCfb_FatEntries.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MicrosoftCfb_DirEntry], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MicrosoftCfb_DirEntry =
  template this: untyped = result
  this = new(MicrosoftCfb_DirEntry)
  let root = if root == nil: cast[MicrosoftCfb](this) else: cast[MicrosoftCfb](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameExpr = encode(this.io.readBytes(int(64)), "UTF-16LE")
  this.name = nameExpr
  let nameLenExpr = this.io.readU2le()
  this.nameLen = nameLenExpr
  let objectTypeExpr = MicrosoftCfb_DirEntry_ObjType(this.io.readU1())
  this.objectType = objectTypeExpr
  let colorFlagExpr = MicrosoftCfb_DirEntry_RbColor(this.io.readU1())
  this.colorFlag = colorFlagExpr
  let leftSiblingIdExpr = this.io.readS4le()
  this.leftSiblingId = leftSiblingIdExpr
  let rightSiblingIdExpr = this.io.readS4le()
  this.rightSiblingId = rightSiblingIdExpr
  let childIdExpr = this.io.readS4le()
  this.childId = childIdExpr
  let clsidExpr = this.io.readBytes(int(16))
  this.clsid = clsidExpr

  ##[
  User-defined flags for storage or root storage objects
  ]##
  let stateExpr = this.io.readU4le()
  this.state = stateExpr

  ##[
  Creation time, in Windows FILETIME format (number of 100-nanosecond intervals since January 1, 1601, UTC)
  ]##
  let timeCreateExpr = this.io.readU8le()
  this.timeCreate = timeCreateExpr

  ##[
  Modification time, in Windows FILETIME format (number of 100-nanosecond intervals since January 1, 1601, UTC).
  ]##
  let timeModExpr = this.io.readU8le()
  this.timeMod = timeModExpr

  ##[
  For stream object, number of starting sector. For a root storage object, first sector of the mini stream, if the mini stream exists.
  ]##
  let ofsExpr = this.io.readS4le()
  this.ofs = ofsExpr

  ##[
  For stream object, size of user-defined data in bytes. For a root storage object, size of the mini stream.
  ]##
  let sizeExpr = this.io.readU8le()
  this.size = sizeExpr

proc miniStream(this: MicrosoftCfb_DirEntry): seq[byte] = 
  if this.miniStreamInst.len != 0:
    return this.miniStreamInst
  if this.objectType == microsoft_cfb.root_storage:
    let io = MicrosoftCfb(this.root).io
    let pos = io.pos()
    io.seek(int(((this.ofs + 1) * MicrosoftCfb(this.root).sectorSize)))
    let miniStreamInstExpr = io.readBytes(int(this.size))
    this.miniStreamInst = miniStreamInstExpr
    io.seek(pos)
  if this.miniStreamInst.len != 0:
    return this.miniStreamInst

proc child(this: MicrosoftCfb_DirEntry): MicrosoftCfb_DirEntry = 
  if this.childInst != nil:
    return this.childInst
  if this.childId != -1:
    let io = MicrosoftCfb(this.root).io
    let pos = io.pos()
    io.seek(int((((MicrosoftCfb(this.root).header.ofsDir + 1) * MicrosoftCfb(this.root).sectorSize) + (this.childId * 128))))
    let childInstExpr = MicrosoftCfb_DirEntry.read(io, this.root, this)
    this.childInst = childInstExpr
    io.seek(pos)
  if this.childInst != nil:
    return this.childInst

proc leftSibling(this: MicrosoftCfb_DirEntry): MicrosoftCfb_DirEntry = 
  if this.leftSiblingInst != nil:
    return this.leftSiblingInst
  if this.leftSiblingId != -1:
    let io = MicrosoftCfb(this.root).io
    let pos = io.pos()
    io.seek(int((((MicrosoftCfb(this.root).header.ofsDir + 1) * MicrosoftCfb(this.root).sectorSize) + (this.leftSiblingId * 128))))
    let leftSiblingInstExpr = MicrosoftCfb_DirEntry.read(io, this.root, this)
    this.leftSiblingInst = leftSiblingInstExpr
    io.seek(pos)
  if this.leftSiblingInst != nil:
    return this.leftSiblingInst

proc rightSibling(this: MicrosoftCfb_DirEntry): MicrosoftCfb_DirEntry = 
  if this.rightSiblingInst != nil:
    return this.rightSiblingInst
  if this.rightSiblingId != -1:
    let io = MicrosoftCfb(this.root).io
    let pos = io.pos()
    io.seek(int((((MicrosoftCfb(this.root).header.ofsDir + 1) * MicrosoftCfb(this.root).sectorSize) + (this.rightSiblingId * 128))))
    let rightSiblingInstExpr = MicrosoftCfb_DirEntry.read(io, this.root, this)
    this.rightSiblingInst = rightSiblingInstExpr
    io.seek(pos)
  if this.rightSiblingInst != nil:
    return this.rightSiblingInst

proc fromFile*(_: typedesc[MicrosoftCfb_DirEntry], filename: string): MicrosoftCfb_DirEntry =
  MicrosoftCfb_DirEntry.read(newKaitaiFileStream(filename), nil, nil)


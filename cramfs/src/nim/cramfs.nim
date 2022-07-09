import kaitai_struct_nim_runtime
import options

type
  Cramfs* = ref object of KaitaiStruct
    `superBlock`*: Cramfs_SuperBlockStruct
    `parent`*: KaitaiStruct
    `pageSizeInst`: int
    `pageSizeInstFlag`: bool
  Cramfs_SuperBlockStruct* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `size`*: uint32
    `flags`*: uint32
    `future`*: uint32
    `signature`*: seq[byte]
    `fsid`*: Cramfs_Info
    `name`*: string
    `root`*: Cramfs_Inode
    `parent`*: Cramfs
    `flagFsidV2Inst`: int
    `flagFsidV2InstFlag`: bool
    `flagHolesInst`: int
    `flagHolesInstFlag`: bool
    `flagWrongSignatureInst`: int
    `flagWrongSignatureInstFlag`: bool
    `flagSortedDirsInst`: int
    `flagSortedDirsInstFlag`: bool
    `flagShiftedRootOffsetInst`: int
    `flagShiftedRootOffsetInstFlag`: bool
  Cramfs_ChunkedDataInode* = ref object of KaitaiStruct
    `blockEndIndex`*: seq[uint32]
    `rawBlocks`*: seq[byte]
    `parent`*: Cramfs_Inode
  Cramfs_Inode* = ref object of KaitaiStruct
    `mode`*: uint16
    `uid`*: uint16
    `sizeGid`*: uint32
    `namelenOffset`*: uint32
    `name`*: string
    `parent`*: KaitaiStruct
    `rawAsDirInst`*: seq[byte]
    `attrInst`: int
    `attrInstFlag`: bool
    `asRegFileInst`: Cramfs_ChunkedDataInode
    `asRegFileInstFlag`: bool
    `permUInst`: int
    `permUInstFlag`: bool
    `asSymlinkInst`: Cramfs_ChunkedDataInode
    `asSymlinkInstFlag`: bool
    `permOInst`: int
    `permOInstFlag`: bool
    `sizeInst`: int
    `sizeInstFlag`: bool
    `gidInst`: int
    `gidInstFlag`: bool
    `permGInst`: int
    `permGInstFlag`: bool
    `namelenInst`: int
    `namelenInstFlag`: bool
    `asDirInst`: Cramfs_DirInode
    `asDirInstFlag`: bool
    `typeInst`: Cramfs_Inode_FileType
    `typeInstFlag`: bool
    `offsetInst`: int
    `offsetInstFlag`: bool
  Cramfs_Inode_FileType* = enum
    fifo = 1
    chrdev = 2
    dir = 4
    blkdev = 6
    reg_file = 8
    symlink = 10
    socket = 12
  Cramfs_DirInode* = ref object of KaitaiStruct
    `children`*: seq[Cramfs_Inode]
    `parent`*: Cramfs_Inode
  Cramfs_Info* = ref object of KaitaiStruct
    `crc`*: uint32
    `edition`*: uint32
    `blocks`*: uint32
    `files`*: uint32
    `parent`*: Cramfs_SuperBlockStruct

proc read*(_: typedesc[Cramfs], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Cramfs
proc read*(_: typedesc[Cramfs_SuperBlockStruct], io: KaitaiStream, root: KaitaiStruct, parent: Cramfs): Cramfs_SuperBlockStruct
proc read*(_: typedesc[Cramfs_ChunkedDataInode], io: KaitaiStream, root: KaitaiStruct, parent: Cramfs_Inode): Cramfs_ChunkedDataInode
proc read*(_: typedesc[Cramfs_Inode], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Cramfs_Inode
proc read*(_: typedesc[Cramfs_DirInode], io: KaitaiStream, root: KaitaiStruct, parent: Cramfs_Inode): Cramfs_DirInode
proc read*(_: typedesc[Cramfs_Info], io: KaitaiStream, root: KaitaiStruct, parent: Cramfs_SuperBlockStruct): Cramfs_Info

proc pageSize*(this: Cramfs): int
proc flagFsidV2*(this: Cramfs_SuperBlockStruct): int
proc flagHoles*(this: Cramfs_SuperBlockStruct): int
proc flagWrongSignature*(this: Cramfs_SuperBlockStruct): int
proc flagSortedDirs*(this: Cramfs_SuperBlockStruct): int
proc flagShiftedRootOffset*(this: Cramfs_SuperBlockStruct): int
proc attr*(this: Cramfs_Inode): int
proc asRegFile*(this: Cramfs_Inode): Cramfs_ChunkedDataInode
proc permU*(this: Cramfs_Inode): int
proc asSymlink*(this: Cramfs_Inode): Cramfs_ChunkedDataInode
proc permO*(this: Cramfs_Inode): int
proc size*(this: Cramfs_Inode): int
proc gid*(this: Cramfs_Inode): int
proc permG*(this: Cramfs_Inode): int
proc namelen*(this: Cramfs_Inode): int
proc asDir*(this: Cramfs_Inode): Cramfs_DirInode
proc type*(this: Cramfs_Inode): Cramfs_Inode_FileType
proc offset*(this: Cramfs_Inode): int

proc read*(_: typedesc[Cramfs], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Cramfs =
  template this: untyped = result
  this = new(Cramfs)
  let root = if root == nil: cast[Cramfs](this) else: cast[Cramfs](root)
  this.io = io
  this.root = root
  this.parent = parent

  let superBlockExpr = Cramfs_SuperBlockStruct.read(this.io, this.root, this)
  this.superBlock = superBlockExpr

proc pageSize(this: Cramfs): int = 
  if this.pageSizeInstFlag:
    return this.pageSizeInst
  let pageSizeInstExpr = int(4096)
  this.pageSizeInst = pageSizeInstExpr
  this.pageSizeInstFlag = true
  return this.pageSizeInst

proc fromFile*(_: typedesc[Cramfs], filename: string): Cramfs =
  Cramfs.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Cramfs_SuperBlockStruct], io: KaitaiStream, root: KaitaiStruct, parent: Cramfs): Cramfs_SuperBlockStruct =
  template this: untyped = result
  this = new(Cramfs_SuperBlockStruct)
  let root = if root == nil: cast[Cramfs](this) else: cast[Cramfs](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr
  let flagsExpr = this.io.readU4le()
  this.flags = flagsExpr
  let futureExpr = this.io.readU4le()
  this.future = futureExpr
  let signatureExpr = this.io.readBytes(int(16))
  this.signature = signatureExpr
  let fsidExpr = Cramfs_Info.read(this.io, this.root, this)
  this.fsid = fsidExpr
  let nameExpr = encode(this.io.readBytes(int(16)), "ASCII")
  this.name = nameExpr
  let rootExpr = Cramfs_Inode.read(this.io, this.root, this)
  this.root = rootExpr

proc flagFsidV2(this: Cramfs_SuperBlockStruct): int = 
  if this.flagFsidV2InstFlag:
    return this.flagFsidV2Inst
  let flagFsidV2InstExpr = int(((this.flags shr 0) and 1))
  this.flagFsidV2Inst = flagFsidV2InstExpr
  this.flagFsidV2InstFlag = true
  return this.flagFsidV2Inst

proc flagHoles(this: Cramfs_SuperBlockStruct): int = 
  if this.flagHolesInstFlag:
    return this.flagHolesInst
  let flagHolesInstExpr = int(((this.flags shr 8) and 1))
  this.flagHolesInst = flagHolesInstExpr
  this.flagHolesInstFlag = true
  return this.flagHolesInst

proc flagWrongSignature(this: Cramfs_SuperBlockStruct): int = 
  if this.flagWrongSignatureInstFlag:
    return this.flagWrongSignatureInst
  let flagWrongSignatureInstExpr = int(((this.flags shr 9) and 1))
  this.flagWrongSignatureInst = flagWrongSignatureInstExpr
  this.flagWrongSignatureInstFlag = true
  return this.flagWrongSignatureInst

proc flagSortedDirs(this: Cramfs_SuperBlockStruct): int = 
  if this.flagSortedDirsInstFlag:
    return this.flagSortedDirsInst
  let flagSortedDirsInstExpr = int(((this.flags shr 1) and 1))
  this.flagSortedDirsInst = flagSortedDirsInstExpr
  this.flagSortedDirsInstFlag = true
  return this.flagSortedDirsInst

proc flagShiftedRootOffset(this: Cramfs_SuperBlockStruct): int = 
  if this.flagShiftedRootOffsetInstFlag:
    return this.flagShiftedRootOffsetInst
  let flagShiftedRootOffsetInstExpr = int(((this.flags shr 10) and 1))
  this.flagShiftedRootOffsetInst = flagShiftedRootOffsetInstExpr
  this.flagShiftedRootOffsetInstFlag = true
  return this.flagShiftedRootOffsetInst

proc fromFile*(_: typedesc[Cramfs_SuperBlockStruct], filename: string): Cramfs_SuperBlockStruct =
  Cramfs_SuperBlockStruct.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Cramfs_ChunkedDataInode], io: KaitaiStream, root: KaitaiStruct, parent: Cramfs_Inode): Cramfs_ChunkedDataInode =
  template this: untyped = result
  this = new(Cramfs_ChunkedDataInode)
  let root = if root == nil: cast[Cramfs](this) else: cast[Cramfs](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int((((this.parent.size + Cramfs(this.root).pageSize) - 1) div Cramfs(this.root).pageSize)):
    let it = this.io.readU4le()
    this.blockEndIndex.add(it)
  let rawBlocksExpr = this.io.readBytesFull()
  this.rawBlocks = rawBlocksExpr

proc fromFile*(_: typedesc[Cramfs_ChunkedDataInode], filename: string): Cramfs_ChunkedDataInode =
  Cramfs_ChunkedDataInode.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Cramfs_Inode], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Cramfs_Inode =
  template this: untyped = result
  this = new(Cramfs_Inode)
  let root = if root == nil: cast[Cramfs](this) else: cast[Cramfs](root)
  this.io = io
  this.root = root
  this.parent = parent

  let modeExpr = this.io.readU2le()
  this.mode = modeExpr
  let uidExpr = this.io.readU2le()
  this.uid = uidExpr
  let sizeGidExpr = this.io.readU4le()
  this.sizeGid = sizeGidExpr
  let namelenOffsetExpr = this.io.readU4le()
  this.namelenOffset = namelenOffsetExpr
  let nameExpr = encode(this.io.readBytes(int(this.namelen)), "utf-8")
  this.name = nameExpr

proc attr(this: Cramfs_Inode): int = 
  if this.attrInstFlag:
    return this.attrInst
  let attrInstExpr = int(((this.mode shr 9) and 7))
  this.attrInst = attrInstExpr
  this.attrInstFlag = true
  return this.attrInst

proc asRegFile(this: Cramfs_Inode): Cramfs_ChunkedDataInode = 
  if this.asRegFileInstFlag:
    return this.asRegFileInst
  let io = Cramfs(this.root).io
  let pos = io.pos()
  io.seek(int(this.offset))
  let asRegFileInstExpr = Cramfs_ChunkedDataInode.read(io, this.root, this)
  this.asRegFileInst = asRegFileInstExpr
  io.seek(pos)
  this.asRegFileInstFlag = true
  return this.asRegFileInst

proc permU(this: Cramfs_Inode): int = 
  if this.permUInstFlag:
    return this.permUInst
  let permUInstExpr = int(((this.mode shr 6) and 7))
  this.permUInst = permUInstExpr
  this.permUInstFlag = true
  return this.permUInst

proc asSymlink(this: Cramfs_Inode): Cramfs_ChunkedDataInode = 
  if this.asSymlinkInstFlag:
    return this.asSymlinkInst
  let io = Cramfs(this.root).io
  let pos = io.pos()
  io.seek(int(this.offset))
  let asSymlinkInstExpr = Cramfs_ChunkedDataInode.read(io, this.root, this)
  this.asSymlinkInst = asSymlinkInstExpr
  io.seek(pos)
  this.asSymlinkInstFlag = true
  return this.asSymlinkInst

proc permO(this: Cramfs_Inode): int = 
  if this.permOInstFlag:
    return this.permOInst
  let permOInstExpr = int((this.mode and 7))
  this.permOInst = permOInstExpr
  this.permOInstFlag = true
  return this.permOInst

proc size(this: Cramfs_Inode): int = 
  if this.sizeInstFlag:
    return this.sizeInst
  let sizeInstExpr = int((this.sizeGid and 16777215))
  this.sizeInst = sizeInstExpr
  this.sizeInstFlag = true
  return this.sizeInst

proc gid(this: Cramfs_Inode): int = 
  if this.gidInstFlag:
    return this.gidInst
  let gidInstExpr = int((this.sizeGid shr 24))
  this.gidInst = gidInstExpr
  this.gidInstFlag = true
  return this.gidInst

proc permG(this: Cramfs_Inode): int = 
  if this.permGInstFlag:
    return this.permGInst
  let permGInstExpr = int(((this.mode shr 3) and 7))
  this.permGInst = permGInstExpr
  this.permGInstFlag = true
  return this.permGInst

proc namelen(this: Cramfs_Inode): int = 
  if this.namelenInstFlag:
    return this.namelenInst
  let namelenInstExpr = int(((this.namelenOffset and 63) shl 2))
  this.namelenInst = namelenInstExpr
  this.namelenInstFlag = true
  return this.namelenInst

proc asDir(this: Cramfs_Inode): Cramfs_DirInode = 
  if this.asDirInstFlag:
    return this.asDirInst
  let io = Cramfs(this.root).io
  let pos = io.pos()
  io.seek(int(this.offset))
  let rawAsDirInstExpr = io.readBytes(int(this.size))
  this.rawAsDirInst = rawAsDirInstExpr
  let rawAsDirInstIo = newKaitaiStream(rawAsDirInstExpr)
  let asDirInstExpr = Cramfs_DirInode.read(rawAsDirInstIo, this.root, this)
  this.asDirInst = asDirInstExpr
  io.seek(pos)
  this.asDirInstFlag = true
  return this.asDirInst

proc type(this: Cramfs_Inode): Cramfs_Inode_FileType = 
  if this.typeInstFlag:
    return this.typeInst
  let typeInstExpr = Cramfs_Inode_FileType(Cramfs_Inode_FileType(((this.mode shr 12) and 15)))
  this.typeInst = typeInstExpr
  this.typeInstFlag = true
  return this.typeInst

proc offset(this: Cramfs_Inode): int = 
  if this.offsetInstFlag:
    return this.offsetInst
  let offsetInstExpr = int((((this.namelenOffset shr 6) and 67108863) shl 2))
  this.offsetInst = offsetInstExpr
  this.offsetInstFlag = true
  return this.offsetInst

proc fromFile*(_: typedesc[Cramfs_Inode], filename: string): Cramfs_Inode =
  Cramfs_Inode.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Cramfs_DirInode], io: KaitaiStream, root: KaitaiStruct, parent: Cramfs_Inode): Cramfs_DirInode =
  template this: untyped = result
  this = new(Cramfs_DirInode)
  let root = if root == nil: cast[Cramfs](this) else: cast[Cramfs](root)
  this.io = io
  this.root = root
  this.parent = parent

  if this.io.size > 0:
    block:
      var i: int
      while not this.io.isEof:
        let it = Cramfs_Inode.read(this.io, this.root, this)
        this.children.add(it)
        inc i

proc fromFile*(_: typedesc[Cramfs_DirInode], filename: string): Cramfs_DirInode =
  Cramfs_DirInode.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Cramfs_Info], io: KaitaiStream, root: KaitaiStruct, parent: Cramfs_SuperBlockStruct): Cramfs_Info =
  template this: untyped = result
  this = new(Cramfs_Info)
  let root = if root == nil: cast[Cramfs](this) else: cast[Cramfs](root)
  this.io = io
  this.root = root
  this.parent = parent

  let crcExpr = this.io.readU4le()
  this.crc = crcExpr
  let editionExpr = this.io.readU4le()
  this.edition = editionExpr
  let blocksExpr = this.io.readU4le()
  this.blocks = blocksExpr
  let filesExpr = this.io.readU4le()
  this.files = filesExpr

proc fromFile*(_: typedesc[Cramfs_Info], filename: string): Cramfs_Info =
  Cramfs_Info.read(newKaitaiFileStream(filename), nil, nil)


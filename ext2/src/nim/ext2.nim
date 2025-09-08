import kaitai_struct_nim_runtime
import options

type
  Ext2* = ref object of KaitaiStruct
    `parent`*: KaitaiStruct
    `bg1Inst`: Ext2_BlockGroup
    `bg1InstFlag`: bool
    `rootDirInst`: Ext2_Dir
    `rootDirInstFlag`: bool
  Ext2_Bgd* = ref object of KaitaiStruct
    `blockBitmapBlock`*: uint32
    `inodeBitmapBlock`*: uint32
    `inodeTableBlock`*: uint32
    `freeBlocksCount`*: uint16
    `freeInodesCount`*: uint16
    `usedDirsCount`*: uint16
    `padReserved`*: seq[byte]
    `parent`*: Ext2_BlockGroup
    `blockBitmapInst`: seq[byte]
    `blockBitmapInstFlag`: bool
    `inodeBitmapInst`: seq[byte]
    `inodeBitmapInstFlag`: bool
    `inodesInst`: seq[Ext2_Inode]
    `inodesInstFlag`: bool
  Ext2_BlockGroup* = ref object of KaitaiStruct
    `superBlock`*: Ext2_SuperBlockStruct
    `blockGroups`*: seq[Ext2_Bgd]
    `parent`*: Ext2
    `rawSuperBlock`*: seq[byte]
  Ext2_BlockPtr* = ref object of KaitaiStruct
    `ptr`*: uint32
    `parent`*: Ext2_Inode
    `rawBodyInst`*: seq[byte]
    `bodyInst`: Ext2_RawBlock
    `bodyInstFlag`: bool
  Ext2_Dir* = ref object of KaitaiStruct
    `entries`*: seq[Ext2_DirEntry]
    `parent`*: Ext2_Inode
  Ext2_DirEntry* = ref object of KaitaiStruct
    `inodePtr`*: uint32
    `recLen`*: uint16
    `nameLen`*: uint8
    `fileType`*: Ext2_DirEntry_FileTypeEnum
    `name`*: string
    `padding`*: seq[byte]
    `parent`*: Ext2_Dir
    `inodeInst`: Ext2_Inode
    `inodeInstFlag`: bool
  Ext2_DirEntry_FileTypeEnum* = enum
    unknown = 0
    reg_file = 1
    dir = 2
    chrdev = 3
    blkdev = 4
    fifo = 5
    sock = 6
    symlink = 7
  Ext2_Inode* = ref object of KaitaiStruct
    `mode`*: uint16
    `uid`*: uint16
    `size`*: uint32
    `atime`*: uint32
    `ctime`*: uint32
    `mtime`*: uint32
    `dtime`*: uint32
    `gid`*: uint16
    `linksCount`*: uint16
    `blocks`*: uint32
    `flags`*: uint32
    `osd1`*: uint32
    `block`*: seq[Ext2_BlockPtr]
    `generation`*: uint32
    `fileAcl`*: uint32
    `dirAcl`*: uint32
    `faddr`*: uint32
    `osd2`*: seq[byte]
    `parent`*: Ext2_Bgd
    `asDirInst`: Ext2_Dir
    `asDirInstFlag`: bool
  Ext2_RawBlock* = ref object of KaitaiStruct
    `body`*: seq[byte]
    `parent`*: Ext2_BlockPtr
  Ext2_SuperBlockStruct* = ref object of KaitaiStruct
    `inodesCount`*: uint32
    `blocksCount`*: uint32
    `rBlocksCount`*: uint32
    `freeBlocksCount`*: uint32
    `freeInodesCount`*: uint32
    `firstDataBlock`*: uint32
    `logBlockSize`*: uint32
    `logFragSize`*: uint32
    `blocksPerGroup`*: uint32
    `fragsPerGroup`*: uint32
    `inodesPerGroup`*: uint32
    `mtime`*: uint32
    `wtime`*: uint32
    `mntCount`*: uint16
    `maxMntCount`*: uint16
    `magic`*: seq[byte]
    `state`*: Ext2_SuperBlockStruct_StateEnum
    `errors`*: Ext2_SuperBlockStruct_ErrorsEnum
    `minorRevLevel`*: uint16
    `lastcheck`*: uint32
    `checkinterval`*: uint32
    `creatorOs`*: uint32
    `revLevel`*: uint32
    `defResuid`*: uint16
    `defResgid`*: uint16
    `firstIno`*: uint32
    `inodeSize`*: uint16
    `blockGroupNr`*: uint16
    `featureCompat`*: uint32
    `featureIncompat`*: uint32
    `featureRoCompat`*: uint32
    `uuid`*: seq[byte]
    `volumeName`*: seq[byte]
    `lastMounted`*: seq[byte]
    `algoBitmap`*: uint32
    `preallocBlocks`*: uint8
    `preallocDirBlocks`*: uint8
    `padding1`*: seq[byte]
    `journalUuid`*: seq[byte]
    `journalInum`*: uint32
    `journalDev`*: uint32
    `lastOrphan`*: uint32
    `hashSeed`*: seq[uint32]
    `defHashVersion`*: uint8
    `parent`*: Ext2_BlockGroup
    `blockGroupCountInst`: int
    `blockGroupCountInstFlag`: bool
    `blockSizeInst`: int
    `blockSizeInstFlag`: bool
  Ext2_SuperBlockStruct_ErrorsEnum* = enum
    act_continue = 1
    act_ro = 2
    act_panic = 3
  Ext2_SuperBlockStruct_StateEnum* = enum
    valid_fs = 1
    error_fs = 2

proc read*(_: typedesc[Ext2], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ext2
proc read*(_: typedesc[Ext2_Bgd], io: KaitaiStream, root: KaitaiStruct, parent: Ext2_BlockGroup): Ext2_Bgd
proc read*(_: typedesc[Ext2_BlockGroup], io: KaitaiStream, root: KaitaiStruct, parent: Ext2): Ext2_BlockGroup
proc read*(_: typedesc[Ext2_BlockPtr], io: KaitaiStream, root: KaitaiStruct, parent: Ext2_Inode): Ext2_BlockPtr
proc read*(_: typedesc[Ext2_Dir], io: KaitaiStream, root: KaitaiStruct, parent: Ext2_Inode): Ext2_Dir
proc read*(_: typedesc[Ext2_DirEntry], io: KaitaiStream, root: KaitaiStruct, parent: Ext2_Dir): Ext2_DirEntry
proc read*(_: typedesc[Ext2_Inode], io: KaitaiStream, root: KaitaiStruct, parent: Ext2_Bgd): Ext2_Inode
proc read*(_: typedesc[Ext2_RawBlock], io: KaitaiStream, root: KaitaiStruct, parent: Ext2_BlockPtr): Ext2_RawBlock
proc read*(_: typedesc[Ext2_SuperBlockStruct], io: KaitaiStream, root: KaitaiStruct, parent: Ext2_BlockGroup): Ext2_SuperBlockStruct

proc bg1*(this: Ext2): Ext2_BlockGroup
proc rootDir*(this: Ext2): Ext2_Dir
proc blockBitmap*(this: Ext2_Bgd): seq[byte]
proc inodeBitmap*(this: Ext2_Bgd): seq[byte]
proc inodes*(this: Ext2_Bgd): seq[Ext2_Inode]
proc body*(this: Ext2_BlockPtr): Ext2_RawBlock
proc inode*(this: Ext2_DirEntry): Ext2_Inode
proc asDir*(this: Ext2_Inode): Ext2_Dir
proc blockGroupCount*(this: Ext2_SuperBlockStruct): int
proc blockSize*(this: Ext2_SuperBlockStruct): int

proc read*(_: typedesc[Ext2], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ext2 =
  template this: untyped = result
  this = new(Ext2)
  let root = if root == nil: cast[Ext2](this) else: cast[Ext2](root)
  this.io = io
  this.root = root
  this.parent = parent


proc bg1(this: Ext2): Ext2_BlockGroup = 
  if this.bg1InstFlag:
    return this.bg1Inst
  let pos = this.io.pos()
  this.io.seek(int(1024))
  let bg1InstExpr = Ext2_BlockGroup.read(this.io, this.root, this)
  this.bg1Inst = bg1InstExpr
  this.io.seek(pos)
  this.bg1InstFlag = true
  return this.bg1Inst

proc rootDir(this: Ext2): Ext2_Dir = 
  if this.rootDirInstFlag:
    return this.rootDirInst
  let rootDirInstExpr = Ext2_Dir(this.bg1.blockGroups[0].inodes[1].asDir)
  this.rootDirInst = rootDirInstExpr
  this.rootDirInstFlag = true
  return this.rootDirInst

proc fromFile*(_: typedesc[Ext2], filename: string): Ext2 =
  Ext2.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ext2_Bgd], io: KaitaiStream, root: KaitaiStruct, parent: Ext2_BlockGroup): Ext2_Bgd =
  template this: untyped = result
  this = new(Ext2_Bgd)
  let root = if root == nil: cast[Ext2](this) else: cast[Ext2](root)
  this.io = io
  this.root = root
  this.parent = parent

  let blockBitmapBlockExpr = this.io.readU4le()
  this.blockBitmapBlock = blockBitmapBlockExpr
  let inodeBitmapBlockExpr = this.io.readU4le()
  this.inodeBitmapBlock = inodeBitmapBlockExpr
  let inodeTableBlockExpr = this.io.readU4le()
  this.inodeTableBlock = inodeTableBlockExpr
  let freeBlocksCountExpr = this.io.readU2le()
  this.freeBlocksCount = freeBlocksCountExpr
  let freeInodesCountExpr = this.io.readU2le()
  this.freeInodesCount = freeInodesCountExpr
  let usedDirsCountExpr = this.io.readU2le()
  this.usedDirsCount = usedDirsCountExpr
  let padReservedExpr = this.io.readBytes(int(2 + 12))
  this.padReserved = padReservedExpr

proc blockBitmap(this: Ext2_Bgd): seq[byte] = 
  if this.blockBitmapInstFlag:
    return this.blockBitmapInst
  let pos = this.io.pos()
  this.io.seek(int(this.blockBitmapBlock * Ext2(this.root).bg1.superBlock.blockSize))
  let blockBitmapInstExpr = this.io.readBytes(int(1024))
  this.blockBitmapInst = blockBitmapInstExpr
  this.io.seek(pos)
  this.blockBitmapInstFlag = true
  return this.blockBitmapInst

proc inodeBitmap(this: Ext2_Bgd): seq[byte] = 
  if this.inodeBitmapInstFlag:
    return this.inodeBitmapInst
  let pos = this.io.pos()
  this.io.seek(int(this.inodeBitmapBlock * Ext2(this.root).bg1.superBlock.blockSize))
  let inodeBitmapInstExpr = this.io.readBytes(int(1024))
  this.inodeBitmapInst = inodeBitmapInstExpr
  this.io.seek(pos)
  this.inodeBitmapInstFlag = true
  return this.inodeBitmapInst

proc inodes(this: Ext2_Bgd): seq[Ext2_Inode] = 
  if this.inodesInstFlag:
    return this.inodesInst
  let pos = this.io.pos()
  this.io.seek(int(this.inodeTableBlock * Ext2(this.root).bg1.superBlock.blockSize))
  for i in 0 ..< int(Ext2(this.root).bg1.superBlock.inodesPerGroup):
    let it = Ext2_Inode.read(this.io, this.root, this)
    this.inodesInst.add(it)
  this.io.seek(pos)
  this.inodesInstFlag = true
  return this.inodesInst

proc fromFile*(_: typedesc[Ext2_Bgd], filename: string): Ext2_Bgd =
  Ext2_Bgd.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ext2_BlockGroup], io: KaitaiStream, root: KaitaiStruct, parent: Ext2): Ext2_BlockGroup =
  template this: untyped = result
  this = new(Ext2_BlockGroup)
  let root = if root == nil: cast[Ext2](this) else: cast[Ext2](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rawSuperBlockExpr = this.io.readBytes(int(1024))
  this.rawSuperBlock = rawSuperBlockExpr
  let rawSuperBlockIo = newKaitaiStream(rawSuperBlockExpr)
  let superBlockExpr = Ext2_SuperBlockStruct.read(rawSuperBlockIo, this.root, this)
  this.superBlock = superBlockExpr
  for i in 0 ..< int(this.superBlock.blockGroupCount):
    let it = Ext2_Bgd.read(this.io, this.root, this)
    this.blockGroups.add(it)

proc fromFile*(_: typedesc[Ext2_BlockGroup], filename: string): Ext2_BlockGroup =
  Ext2_BlockGroup.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ext2_BlockPtr], io: KaitaiStream, root: KaitaiStruct, parent: Ext2_Inode): Ext2_BlockPtr =
  template this: untyped = result
  this = new(Ext2_BlockPtr)
  let root = if root == nil: cast[Ext2](this) else: cast[Ext2](root)
  this.io = io
  this.root = root
  this.parent = parent

  let ptrExpr = this.io.readU4le()
  this.ptr = ptrExpr

proc body(this: Ext2_BlockPtr): Ext2_RawBlock = 
  if this.bodyInstFlag:
    return this.bodyInst
  let pos = this.io.pos()
  this.io.seek(int(this.ptr * Ext2(this.root).bg1.superBlock.blockSize))
  let rawBodyInstExpr = this.io.readBytes(int(Ext2(this.root).bg1.superBlock.blockSize))
  this.rawBodyInst = rawBodyInstExpr
  let rawBodyInstIo = newKaitaiStream(rawBodyInstExpr)
  let bodyInstExpr = Ext2_RawBlock.read(rawBodyInstIo, this.root, this)
  this.bodyInst = bodyInstExpr
  this.io.seek(pos)
  this.bodyInstFlag = true
  return this.bodyInst

proc fromFile*(_: typedesc[Ext2_BlockPtr], filename: string): Ext2_BlockPtr =
  Ext2_BlockPtr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ext2_Dir], io: KaitaiStream, root: KaitaiStruct, parent: Ext2_Inode): Ext2_Dir =
  template this: untyped = result
  this = new(Ext2_Dir)
  let root = if root == nil: cast[Ext2](this) else: cast[Ext2](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Ext2_DirEntry.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[Ext2_Dir], filename: string): Ext2_Dir =
  Ext2_Dir.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ext2_DirEntry], io: KaitaiStream, root: KaitaiStruct, parent: Ext2_Dir): Ext2_DirEntry =
  template this: untyped = result
  this = new(Ext2_DirEntry)
  let root = if root == nil: cast[Ext2](this) else: cast[Ext2](root)
  this.io = io
  this.root = root
  this.parent = parent

  let inodePtrExpr = this.io.readU4le()
  this.inodePtr = inodePtrExpr
  let recLenExpr = this.io.readU2le()
  this.recLen = recLenExpr
  let nameLenExpr = this.io.readU1()
  this.nameLen = nameLenExpr
  let fileTypeExpr = Ext2_DirEntry_FileTypeEnum(this.io.readU1())
  this.fileType = fileTypeExpr
  let nameExpr = encode(this.io.readBytes(int(this.nameLen)), "UTF-8")
  this.name = nameExpr
  let paddingExpr = this.io.readBytes(int((this.recLen - this.nameLen) - 8))
  this.padding = paddingExpr

proc inode(this: Ext2_DirEntry): Ext2_Inode = 
  if this.inodeInstFlag:
    return this.inodeInst
  let inodeInstExpr = Ext2_Inode(Ext2(this.root).bg1.blockGroups[(this.inodePtr - 1) div Ext2(this.root).bg1.superBlock.inodesPerGroup].inodes[(this.inodePtr - 1) %%% Ext2(this.root).bg1.superBlock.inodesPerGroup])
  this.inodeInst = inodeInstExpr
  this.inodeInstFlag = true
  return this.inodeInst

proc fromFile*(_: typedesc[Ext2_DirEntry], filename: string): Ext2_DirEntry =
  Ext2_DirEntry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ext2_Inode], io: KaitaiStream, root: KaitaiStruct, parent: Ext2_Bgd): Ext2_Inode =
  template this: untyped = result
  this = new(Ext2_Inode)
  let root = if root == nil: cast[Ext2](this) else: cast[Ext2](root)
  this.io = io
  this.root = root
  this.parent = parent

  let modeExpr = this.io.readU2le()
  this.mode = modeExpr
  let uidExpr = this.io.readU2le()
  this.uid = uidExpr
  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr
  let atimeExpr = this.io.readU4le()
  this.atime = atimeExpr
  let ctimeExpr = this.io.readU4le()
  this.ctime = ctimeExpr
  let mtimeExpr = this.io.readU4le()
  this.mtime = mtimeExpr
  let dtimeExpr = this.io.readU4le()
  this.dtime = dtimeExpr
  let gidExpr = this.io.readU2le()
  this.gid = gidExpr
  let linksCountExpr = this.io.readU2le()
  this.linksCount = linksCountExpr
  let blocksExpr = this.io.readU4le()
  this.blocks = blocksExpr
  let flagsExpr = this.io.readU4le()
  this.flags = flagsExpr
  let osd1Expr = this.io.readU4le()
  this.osd1 = osd1Expr
  for i in 0 ..< int(15):
    let it = Ext2_BlockPtr.read(this.io, this.root, this)
    this.block.add(it)
  let generationExpr = this.io.readU4le()
  this.generation = generationExpr
  let fileAclExpr = this.io.readU4le()
  this.fileAcl = fileAclExpr
  let dirAclExpr = this.io.readU4le()
  this.dirAcl = dirAclExpr
  let faddrExpr = this.io.readU4le()
  this.faddr = faddrExpr
  let osd2Expr = this.io.readBytes(int(12))
  this.osd2 = osd2Expr

proc asDir(this: Ext2_Inode): Ext2_Dir = 
  if this.asDirInstFlag:
    return this.asDirInst
  let io = this.block[0].body.io
  let pos = io.pos()
  io.seek(int(0))
  let asDirInstExpr = Ext2_Dir.read(io, this.root, this)
  this.asDirInst = asDirInstExpr
  io.seek(pos)
  this.asDirInstFlag = true
  return this.asDirInst

proc fromFile*(_: typedesc[Ext2_Inode], filename: string): Ext2_Inode =
  Ext2_Inode.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ext2_RawBlock], io: KaitaiStream, root: KaitaiStruct, parent: Ext2_BlockPtr): Ext2_RawBlock =
  template this: untyped = result
  this = new(Ext2_RawBlock)
  let root = if root == nil: cast[Ext2](this) else: cast[Ext2](root)
  this.io = io
  this.root = root
  this.parent = parent

  let bodyExpr = this.io.readBytes(int(Ext2(this.root).bg1.superBlock.blockSize))
  this.body = bodyExpr

proc fromFile*(_: typedesc[Ext2_RawBlock], filename: string): Ext2_RawBlock =
  Ext2_RawBlock.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ext2_SuperBlockStruct], io: KaitaiStream, root: KaitaiStruct, parent: Ext2_BlockGroup): Ext2_SuperBlockStruct =
  template this: untyped = result
  this = new(Ext2_SuperBlockStruct)
  let root = if root == nil: cast[Ext2](this) else: cast[Ext2](root)
  this.io = io
  this.root = root
  this.parent = parent

  let inodesCountExpr = this.io.readU4le()
  this.inodesCount = inodesCountExpr
  let blocksCountExpr = this.io.readU4le()
  this.blocksCount = blocksCountExpr
  let rBlocksCountExpr = this.io.readU4le()
  this.rBlocksCount = rBlocksCountExpr
  let freeBlocksCountExpr = this.io.readU4le()
  this.freeBlocksCount = freeBlocksCountExpr
  let freeInodesCountExpr = this.io.readU4le()
  this.freeInodesCount = freeInodesCountExpr
  let firstDataBlockExpr = this.io.readU4le()
  this.firstDataBlock = firstDataBlockExpr
  let logBlockSizeExpr = this.io.readU4le()
  this.logBlockSize = logBlockSizeExpr
  let logFragSizeExpr = this.io.readU4le()
  this.logFragSize = logFragSizeExpr
  let blocksPerGroupExpr = this.io.readU4le()
  this.blocksPerGroup = blocksPerGroupExpr
  let fragsPerGroupExpr = this.io.readU4le()
  this.fragsPerGroup = fragsPerGroupExpr
  let inodesPerGroupExpr = this.io.readU4le()
  this.inodesPerGroup = inodesPerGroupExpr
  let mtimeExpr = this.io.readU4le()
  this.mtime = mtimeExpr
  let wtimeExpr = this.io.readU4le()
  this.wtime = wtimeExpr
  let mntCountExpr = this.io.readU2le()
  this.mntCount = mntCountExpr
  let maxMntCountExpr = this.io.readU2le()
  this.maxMntCount = maxMntCountExpr
  let magicExpr = this.io.readBytes(int(2))
  this.magic = magicExpr
  let stateExpr = Ext2_SuperBlockStruct_StateEnum(this.io.readU2le())
  this.state = stateExpr
  let errorsExpr = Ext2_SuperBlockStruct_ErrorsEnum(this.io.readU2le())
  this.errors = errorsExpr
  let minorRevLevelExpr = this.io.readU2le()
  this.minorRevLevel = minorRevLevelExpr
  let lastcheckExpr = this.io.readU4le()
  this.lastcheck = lastcheckExpr
  let checkintervalExpr = this.io.readU4le()
  this.checkinterval = checkintervalExpr
  let creatorOsExpr = this.io.readU4le()
  this.creatorOs = creatorOsExpr
  let revLevelExpr = this.io.readU4le()
  this.revLevel = revLevelExpr
  let defResuidExpr = this.io.readU2le()
  this.defResuid = defResuidExpr
  let defResgidExpr = this.io.readU2le()
  this.defResgid = defResgidExpr
  let firstInoExpr = this.io.readU4le()
  this.firstIno = firstInoExpr
  let inodeSizeExpr = this.io.readU2le()
  this.inodeSize = inodeSizeExpr
  let blockGroupNrExpr = this.io.readU2le()
  this.blockGroupNr = blockGroupNrExpr
  let featureCompatExpr = this.io.readU4le()
  this.featureCompat = featureCompatExpr
  let featureIncompatExpr = this.io.readU4le()
  this.featureIncompat = featureIncompatExpr
  let featureRoCompatExpr = this.io.readU4le()
  this.featureRoCompat = featureRoCompatExpr
  let uuidExpr = this.io.readBytes(int(16))
  this.uuid = uuidExpr
  let volumeNameExpr = this.io.readBytes(int(16))
  this.volumeName = volumeNameExpr
  let lastMountedExpr = this.io.readBytes(int(64))
  this.lastMounted = lastMountedExpr
  let algoBitmapExpr = this.io.readU4le()
  this.algoBitmap = algoBitmapExpr
  let preallocBlocksExpr = this.io.readU1()
  this.preallocBlocks = preallocBlocksExpr
  let preallocDirBlocksExpr = this.io.readU1()
  this.preallocDirBlocks = preallocDirBlocksExpr
  let padding1Expr = this.io.readBytes(int(2))
  this.padding1 = padding1Expr
  let journalUuidExpr = this.io.readBytes(int(16))
  this.journalUuid = journalUuidExpr
  let journalInumExpr = this.io.readU4le()
  this.journalInum = journalInumExpr
  let journalDevExpr = this.io.readU4le()
  this.journalDev = journalDevExpr
  let lastOrphanExpr = this.io.readU4le()
  this.lastOrphan = lastOrphanExpr
  for i in 0 ..< int(4):
    let it = this.io.readU4le()
    this.hashSeed.add(it)
  let defHashVersionExpr = this.io.readU1()
  this.defHashVersion = defHashVersionExpr

proc blockGroupCount(this: Ext2_SuperBlockStruct): int = 
  if this.blockGroupCountInstFlag:
    return this.blockGroupCountInst
  let blockGroupCountInstExpr = int(this.blocksCount div this.blocksPerGroup)
  this.blockGroupCountInst = blockGroupCountInstExpr
  this.blockGroupCountInstFlag = true
  return this.blockGroupCountInst

proc blockSize(this: Ext2_SuperBlockStruct): int = 
  if this.blockSizeInstFlag:
    return this.blockSizeInst
  let blockSizeInstExpr = int(1024 shl this.logBlockSize)
  this.blockSizeInst = blockSizeInstExpr
  this.blockSizeInstFlag = true
  return this.blockSizeInst

proc fromFile*(_: typedesc[Ext2_SuperBlockStruct], filename: string): Ext2_SuperBlockStruct =
  Ext2_SuperBlockStruct.read(newKaitaiFileStream(filename), nil, nil)


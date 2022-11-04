import kaitai_struct_nim_runtime
import options

type
  DsStore* = ref object of KaitaiStruct
    `alignmentHeader`*: seq[byte]
    `buddyAllocatorHeader`*: DsStore_BuddyAllocatorHeader
    `parent`*: KaitaiStruct
    `rawBuddyAllocatorBodyInst`*: seq[byte]
    `buddyAllocatorBodyInst`: DsStore_BuddyAllocatorBody
    `buddyAllocatorBodyInstFlag`: bool
    `blockAddressMaskInst`: int8
    `blockAddressMaskInstFlag`: bool
  DsStore_BuddyAllocatorHeader* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `ofsBookkeepingInfoBlock`*: uint32
    `lenBookkeepingInfoBlock`*: uint32
    `copyOfsBookkeepingInfoBlock`*: uint32
    `unnamed4`*: seq[byte]
    `parent`*: DsStore
  DsStore_BuddyAllocatorBody* = ref object of KaitaiStruct
    `numBlocks`*: uint32
    `unnamed1`*: seq[byte]
    `blockAddresses`*: seq[DsStore_BuddyAllocatorBody_BlockDescriptor]
    `numDirectories`*: uint32
    `directoryEntries`*: seq[DsStore_BuddyAllocatorBody_DirectoryEntry]
    `freeLists`*: seq[DsStore_BuddyAllocatorBody_FreeList]
    `parent`*: DsStore
    `numBlockAddressesInst`: int
    `numBlockAddressesInstFlag`: bool
    `numFreeListsInst`: int8
    `numFreeListsInstFlag`: bool
    `directoriesInst`: seq[DsStore_MasterBlockRef]
    `directoriesInstFlag`: bool
  DsStore_BuddyAllocatorBody_BlockDescriptor* = ref object of KaitaiStruct
    `addressRaw`*: uint32
    `parent`*: DsStore_BuddyAllocatorBody
    `offsetInst`: int
    `offsetInstFlag`: bool
    `sizeInst`: int
    `sizeInstFlag`: bool
  DsStore_BuddyAllocatorBody_DirectoryEntry* = ref object of KaitaiStruct
    `lenName`*: uint8
    `name`*: string
    `blockId`*: uint32
    `parent`*: DsStore_BuddyAllocatorBody
  DsStore_BuddyAllocatorBody_FreeList* = ref object of KaitaiStruct
    `counter`*: uint32
    `offsets`*: seq[uint32]
    `parent`*: DsStore_BuddyAllocatorBody
  DsStore_MasterBlockRef* = ref object of KaitaiStruct
    `idx`*: uint64
    `parent`*: DsStore_BuddyAllocatorBody
    `rawMasterBlockInst`*: seq[byte]
    `masterBlockInst`: DsStore_MasterBlockRef_MasterBlock
    `masterBlockInstFlag`: bool
  DsStore_MasterBlockRef_MasterBlock* = ref object of KaitaiStruct
    `blockId`*: uint32
    `numInternalNodes`*: uint32
    `numRecords`*: uint32
    `numNodes`*: uint32
    `unnamed4`*: uint32
    `parent`*: DsStore_MasterBlockRef
    `rootBlockInst`: DsStore_Block
    `rootBlockInstFlag`: bool
  DsStore_Block* = ref object of KaitaiStruct
    `mode`*: uint32
    `counter`*: uint32
    `data`*: seq[DsStore_Block_BlockData]
    `parent`*: KaitaiStruct
    `rightmostBlockInst`: DsStore_Block
    `rightmostBlockInstFlag`: bool
  DsStore_Block_BlockData* = ref object of KaitaiStruct
    `blockId`*: uint32
    `record`*: DsStore_Block_BlockData_Record
    `mode`*: uint32
    `parent`*: DsStore_Block
    `blockInst`: DsStore_Block
    `blockInstFlag`: bool
  DsStore_Block_BlockData_Record* = ref object of KaitaiStruct
    `filename`*: DsStore_Block_BlockData_Record_Ustr
    `structureType`*: DsStore_Block_BlockData_Record_FourCharCode
    `dataType`*: string
    `value`*: KaitaiStruct
    `parent`*: DsStore_Block_BlockData
  DsStore_Block_BlockData_Record_RecordBlob* = ref object of KaitaiStruct
    `length`*: uint32
    `value`*: seq[byte]
    `parent`*: DsStore_Block_BlockData_Record
  DsStore_Block_BlockData_Record_Ustr* = ref object of KaitaiStruct
    `length`*: uint32
    `value`*: string
    `parent`*: DsStore_Block_BlockData_Record
  DsStore_Block_BlockData_Record_FourCharCode* = ref object of KaitaiStruct
    `value`*: string
    `parent`*: DsStore_Block_BlockData_Record

proc read*(_: typedesc[DsStore], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): DsStore
proc read*(_: typedesc[DsStore_BuddyAllocatorHeader], io: KaitaiStream, root: KaitaiStruct, parent: DsStore): DsStore_BuddyAllocatorHeader
proc read*(_: typedesc[DsStore_BuddyAllocatorBody], io: KaitaiStream, root: KaitaiStruct, parent: DsStore): DsStore_BuddyAllocatorBody
proc read*(_: typedesc[DsStore_BuddyAllocatorBody_BlockDescriptor], io: KaitaiStream, root: KaitaiStruct, parent: DsStore_BuddyAllocatorBody): DsStore_BuddyAllocatorBody_BlockDescriptor
proc read*(_: typedesc[DsStore_BuddyAllocatorBody_DirectoryEntry], io: KaitaiStream, root: KaitaiStruct, parent: DsStore_BuddyAllocatorBody): DsStore_BuddyAllocatorBody_DirectoryEntry
proc read*(_: typedesc[DsStore_BuddyAllocatorBody_FreeList], io: KaitaiStream, root: KaitaiStruct, parent: DsStore_BuddyAllocatorBody): DsStore_BuddyAllocatorBody_FreeList
proc read*(_: typedesc[DsStore_MasterBlockRef], io: KaitaiStream, root: KaitaiStruct, parent: DsStore_BuddyAllocatorBody, idx: any): DsStore_MasterBlockRef
proc read*(_: typedesc[DsStore_MasterBlockRef_MasterBlock], io: KaitaiStream, root: KaitaiStruct, parent: DsStore_MasterBlockRef): DsStore_MasterBlockRef_MasterBlock
proc read*(_: typedesc[DsStore_Block], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): DsStore_Block
proc read*(_: typedesc[DsStore_Block_BlockData], io: KaitaiStream, root: KaitaiStruct, parent: DsStore_Block, mode: any): DsStore_Block_BlockData
proc read*(_: typedesc[DsStore_Block_BlockData_Record], io: KaitaiStream, root: KaitaiStruct, parent: DsStore_Block_BlockData): DsStore_Block_BlockData_Record
proc read*(_: typedesc[DsStore_Block_BlockData_Record_RecordBlob], io: KaitaiStream, root: KaitaiStruct, parent: DsStore_Block_BlockData_Record): DsStore_Block_BlockData_Record_RecordBlob
proc read*(_: typedesc[DsStore_Block_BlockData_Record_Ustr], io: KaitaiStream, root: KaitaiStruct, parent: DsStore_Block_BlockData_Record): DsStore_Block_BlockData_Record_Ustr
proc read*(_: typedesc[DsStore_Block_BlockData_Record_FourCharCode], io: KaitaiStream, root: KaitaiStruct, parent: DsStore_Block_BlockData_Record): DsStore_Block_BlockData_Record_FourCharCode

proc buddyAllocatorBody*(this: DsStore): DsStore_BuddyAllocatorBody
proc blockAddressMask*(this: DsStore): int8
proc numBlockAddresses*(this: DsStore_BuddyAllocatorBody): int
proc numFreeLists*(this: DsStore_BuddyAllocatorBody): int8
proc directories*(this: DsStore_BuddyAllocatorBody): seq[DsStore_MasterBlockRef]
proc offset*(this: DsStore_BuddyAllocatorBody_BlockDescriptor): int
proc size*(this: DsStore_BuddyAllocatorBody_BlockDescriptor): int
proc masterBlock*(this: DsStore_MasterBlockRef): DsStore_MasterBlockRef_MasterBlock
proc rootBlock*(this: DsStore_MasterBlockRef_MasterBlock): DsStore_Block
proc rightmostBlock*(this: DsStore_Block): DsStore_Block
proc block*(this: DsStore_Block_BlockData): DsStore_Block


##[
Apple macOS '.DS_Store' file format.

@see <a href="https://en.wikipedia.org/wiki/.DS_Store
https://metacpan.org/pod/distribution/Mac-Finder-DSStore/DSStoreFormat.pod
https://0day.work/parsing-the-ds_store-file-format
">Source</a>
]##
proc read*(_: typedesc[DsStore], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): DsStore =
  template this: untyped = result
  this = new(DsStore)
  let root = if root == nil: cast[DsStore](this) else: cast[DsStore](root)
  this.io = io
  this.root = root
  this.parent = parent

  let alignmentHeaderExpr = this.io.readBytes(int(4))
  this.alignmentHeader = alignmentHeaderExpr
  let buddyAllocatorHeaderExpr = DsStore_BuddyAllocatorHeader.read(this.io, this.root, this)
  this.buddyAllocatorHeader = buddyAllocatorHeaderExpr

proc buddyAllocatorBody(this: DsStore): DsStore_BuddyAllocatorBody = 
  if this.buddyAllocatorBodyInstFlag:
    return this.buddyAllocatorBodyInst
  let pos = this.io.pos()
  this.io.seek(int((this.buddyAllocatorHeader.ofsBookkeepingInfoBlock + 4)))
  let rawBuddyAllocatorBodyInstExpr = this.io.readBytes(int(this.buddyAllocatorHeader.lenBookkeepingInfoBlock))
  this.rawBuddyAllocatorBodyInst = rawBuddyAllocatorBodyInstExpr
  let rawBuddyAllocatorBodyInstIo = newKaitaiStream(rawBuddyAllocatorBodyInstExpr)
  let buddyAllocatorBodyInstExpr = DsStore_BuddyAllocatorBody.read(rawBuddyAllocatorBodyInstIo, this.root, this)
  this.buddyAllocatorBodyInst = buddyAllocatorBodyInstExpr
  this.io.seek(pos)
  this.buddyAllocatorBodyInstFlag = true
  return this.buddyAllocatorBodyInst

proc blockAddressMask(this: DsStore): int8 = 

  ##[
  Bitmask used to calculate the position and the size of each block
of the B-tree from the block addresses.

  ]##
  if this.blockAddressMaskInstFlag:
    return this.blockAddressMaskInst
  let blockAddressMaskInstExpr = int8(31)
  this.blockAddressMaskInst = blockAddressMaskInstExpr
  this.blockAddressMaskInstFlag = true
  return this.blockAddressMaskInst

proc fromFile*(_: typedesc[DsStore], filename: string): DsStore =
  DsStore.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DsStore_BuddyAllocatorHeader], io: KaitaiStream, root: KaitaiStruct, parent: DsStore): DsStore_BuddyAllocatorHeader =
  template this: untyped = result
  this = new(DsStore_BuddyAllocatorHeader)
  let root = if root == nil: cast[DsStore](this) else: cast[DsStore](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Magic number 'Bud1'.
  ]##
  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let ofsBookkeepingInfoBlockExpr = this.io.readU4be()
  this.ofsBookkeepingInfoBlock = ofsBookkeepingInfoBlockExpr
  let lenBookkeepingInfoBlockExpr = this.io.readU4be()
  this.lenBookkeepingInfoBlock = lenBookkeepingInfoBlockExpr

  ##[
  Needs to match 'offset_bookkeeping_info_block'.
  ]##
  let copyOfsBookkeepingInfoBlockExpr = this.io.readU4be()
  this.copyOfsBookkeepingInfoBlock = copyOfsBookkeepingInfoBlockExpr

  ##[
  Unused field which might simply be the unused space at the end of the block,
since the minimum allocation size is 32 bytes.

  ]##
  let unnamed4Expr = this.io.readBytes(int(16))
  this.unnamed4 = unnamed4Expr

proc fromFile*(_: typedesc[DsStore_BuddyAllocatorHeader], filename: string): DsStore_BuddyAllocatorHeader =
  DsStore_BuddyAllocatorHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DsStore_BuddyAllocatorBody], io: KaitaiStream, root: KaitaiStruct, parent: DsStore): DsStore_BuddyAllocatorBody =
  template this: untyped = result
  this = new(DsStore_BuddyAllocatorBody)
  let root = if root == nil: cast[DsStore](this) else: cast[DsStore](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Number of blocks in the allocated-blocks list.
  ]##
  let numBlocksExpr = this.io.readU4be()
  this.numBlocks = numBlocksExpr

  ##[
  Unknown field which appears to always be 0.
  ]##
  let unnamed1Expr = this.io.readBytes(int(4))
  this.unnamed1 = unnamed1Expr

  ##[
  Addresses of the different blocks.
  ]##
  for i in 0 ..< int(this.numBlockAddresses):
    let it = DsStore_BuddyAllocatorBody_BlockDescriptor.read(this.io, this.root, this)
    this.blockAddresses.add(it)

  ##[
  Indicates the number of directory entries.
  ]##
  let numDirectoriesExpr = this.io.readU4be()
  this.numDirectories = numDirectoriesExpr

  ##[
  Each directory is an independent B-tree.
  ]##
  for i in 0 ..< int(this.numDirectories):
    let it = DsStore_BuddyAllocatorBody_DirectoryEntry.read(this.io, this.root, this)
    this.directoryEntries.add(it)
  for i in 0 ..< int(this.numFreeLists):
    let it = DsStore_BuddyAllocatorBody_FreeList.read(this.io, this.root, this)
    this.freeLists.add(it)

proc numBlockAddresses(this: DsStore_BuddyAllocatorBody): int = 
  if this.numBlockAddressesInstFlag:
    return this.numBlockAddressesInst
  let numBlockAddressesInstExpr = int(256)
  this.numBlockAddressesInst = numBlockAddressesInstExpr
  this.numBlockAddressesInstFlag = true
  return this.numBlockAddressesInst

proc numFreeLists(this: DsStore_BuddyAllocatorBody): int8 = 
  if this.numFreeListsInstFlag:
    return this.numFreeListsInst
  let numFreeListsInstExpr = int8(32)
  this.numFreeListsInst = numFreeListsInstExpr
  this.numFreeListsInstFlag = true
  return this.numFreeListsInst

proc directories(this: DsStore_BuddyAllocatorBody): seq[DsStore_MasterBlockRef] = 

  ##[
  Master blocks of the different B-trees.
  ]##
  if this.directoriesInstFlag:
    return this.directoriesInst
  let io = DsStore(this.root).io
  for i in 0 ..< int(this.numDirectories):
    let it = DsStore_MasterBlockRef.read(io, this.root, this, i)
    this.directoriesInst.add(it)
  this.directoriesInstFlag = true
  return this.directoriesInst

proc fromFile*(_: typedesc[DsStore_BuddyAllocatorBody], filename: string): DsStore_BuddyAllocatorBody =
  DsStore_BuddyAllocatorBody.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DsStore_BuddyAllocatorBody_BlockDescriptor], io: KaitaiStream, root: KaitaiStruct, parent: DsStore_BuddyAllocatorBody): DsStore_BuddyAllocatorBody_BlockDescriptor =
  template this: untyped = result
  this = new(DsStore_BuddyAllocatorBody_BlockDescriptor)
  let root = if root == nil: cast[DsStore](this) else: cast[DsStore](root)
  this.io = io
  this.root = root
  this.parent = parent

  let addressRawExpr = this.io.readU4be()
  this.addressRaw = addressRawExpr

proc offset(this: DsStore_BuddyAllocatorBody_BlockDescriptor): int = 
  if this.offsetInstFlag:
    return this.offsetInst
  let offsetInstExpr = int(((this.addressRaw and not(DsStore(this.root).blockAddressMask)) + 4))
  this.offsetInst = offsetInstExpr
  this.offsetInstFlag = true
  return this.offsetInst

proc size(this: DsStore_BuddyAllocatorBody_BlockDescriptor): int = 
  if this.sizeInstFlag:
    return this.sizeInst
  let sizeInstExpr = int(((1 shl this.addressRaw) and DsStore(this.root).blockAddressMask))
  this.sizeInst = sizeInstExpr
  this.sizeInstFlag = true
  return this.sizeInst

proc fromFile*(_: typedesc[DsStore_BuddyAllocatorBody_BlockDescriptor], filename: string): DsStore_BuddyAllocatorBody_BlockDescriptor =
  DsStore_BuddyAllocatorBody_BlockDescriptor.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DsStore_BuddyAllocatorBody_DirectoryEntry], io: KaitaiStream, root: KaitaiStruct, parent: DsStore_BuddyAllocatorBody): DsStore_BuddyAllocatorBody_DirectoryEntry =
  template this: untyped = result
  this = new(DsStore_BuddyAllocatorBody_DirectoryEntry)
  let root = if root == nil: cast[DsStore](this) else: cast[DsStore](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenNameExpr = this.io.readU1()
  this.lenName = lenNameExpr
  let nameExpr = encode(this.io.readBytes(int(this.lenName)), "UTF-8")
  this.name = nameExpr
  let blockIdExpr = this.io.readU4be()
  this.blockId = blockIdExpr

proc fromFile*(_: typedesc[DsStore_BuddyAllocatorBody_DirectoryEntry], filename: string): DsStore_BuddyAllocatorBody_DirectoryEntry =
  DsStore_BuddyAllocatorBody_DirectoryEntry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DsStore_BuddyAllocatorBody_FreeList], io: KaitaiStream, root: KaitaiStruct, parent: DsStore_BuddyAllocatorBody): DsStore_BuddyAllocatorBody_FreeList =
  template this: untyped = result
  this = new(DsStore_BuddyAllocatorBody_FreeList)
  let root = if root == nil: cast[DsStore](this) else: cast[DsStore](root)
  this.io = io
  this.root = root
  this.parent = parent

  let counterExpr = this.io.readU4be()
  this.counter = counterExpr
  for i in 0 ..< int(this.counter):
    let it = this.io.readU4be()
    this.offsets.add(it)

proc fromFile*(_: typedesc[DsStore_BuddyAllocatorBody_FreeList], filename: string): DsStore_BuddyAllocatorBody_FreeList =
  DsStore_BuddyAllocatorBody_FreeList.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DsStore_MasterBlockRef], io: KaitaiStream, root: KaitaiStruct, parent: DsStore_BuddyAllocatorBody, idx: any): DsStore_MasterBlockRef =
  template this: untyped = result
  this = new(DsStore_MasterBlockRef)
  let root = if root == nil: cast[DsStore](this) else: cast[DsStore](root)
  this.io = io
  this.root = root
  this.parent = parent
  let idxExpr = uint64(idx)
  this.idx = idxExpr


proc masterBlock(this: DsStore_MasterBlockRef): DsStore_MasterBlockRef_MasterBlock = 
  if this.masterBlockInstFlag:
    return this.masterBlockInst
  let pos = this.io.pos()
  this.io.seek(int(this.parent.blockAddresses[this.parent.directoryEntries[this.idx].blockId].offset))
  let rawMasterBlockInstExpr = this.io.readBytes(int(this.parent.blockAddresses[this.parent.directoryEntries[this.idx].blockId].size))
  this.rawMasterBlockInst = rawMasterBlockInstExpr
  let rawMasterBlockInstIo = newKaitaiStream(rawMasterBlockInstExpr)
  let masterBlockInstExpr = DsStore_MasterBlockRef_MasterBlock.read(rawMasterBlockInstIo, this.root, this)
  this.masterBlockInst = masterBlockInstExpr
  this.io.seek(pos)
  this.masterBlockInstFlag = true
  return this.masterBlockInst

proc fromFile*(_: typedesc[DsStore_MasterBlockRef], filename: string): DsStore_MasterBlockRef =
  DsStore_MasterBlockRef.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DsStore_MasterBlockRef_MasterBlock], io: KaitaiStream, root: KaitaiStruct, parent: DsStore_MasterBlockRef): DsStore_MasterBlockRef_MasterBlock =
  template this: untyped = result
  this = new(DsStore_MasterBlockRef_MasterBlock)
  let root = if root == nil: cast[DsStore](this) else: cast[DsStore](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Block number of the B-tree's root node.
  ]##
  let blockIdExpr = this.io.readU4be()
  this.blockId = blockIdExpr

  ##[
  Number of internal node levels.
  ]##
  let numInternalNodesExpr = this.io.readU4be()
  this.numInternalNodes = numInternalNodesExpr

  ##[
  Number of records in the tree.
  ]##
  let numRecordsExpr = this.io.readU4be()
  this.numRecords = numRecordsExpr

  ##[
  Number of nodes in the tree.
  ]##
  let numNodesExpr = this.io.readU4be()
  this.numNodes = numNodesExpr

  ##[
  Always 0x1000, probably the B-tree node page size.
  ]##
  let unnamed4Expr = this.io.readU4be()
  this.unnamed4 = unnamed4Expr

proc rootBlock(this: DsStore_MasterBlockRef_MasterBlock): DsStore_Block = 
  if this.rootBlockInstFlag:
    return this.rootBlockInst
  let io = DsStore(this.root).io
  let pos = io.pos()
  io.seek(int(DsStore(this.root).buddyAllocatorBody.blockAddresses[this.blockId].offset))
  let rootBlockInstExpr = DsStore_Block.read(io, this.root, this)
  this.rootBlockInst = rootBlockInstExpr
  io.seek(pos)
  this.rootBlockInstFlag = true
  return this.rootBlockInst

proc fromFile*(_: typedesc[DsStore_MasterBlockRef_MasterBlock], filename: string): DsStore_MasterBlockRef_MasterBlock =
  DsStore_MasterBlockRef_MasterBlock.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DsStore_Block], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): DsStore_Block =
  template this: untyped = result
  this = new(DsStore_Block)
  let root = if root == nil: cast[DsStore](this) else: cast[DsStore](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  If mode is 0, this is a leaf node, otherwise it is an internal node.
  ]##
  let modeExpr = this.io.readU4be()
  this.mode = modeExpr

  ##[
  Number of records or number of block id + record pairs.
  ]##
  let counterExpr = this.io.readU4be()
  this.counter = counterExpr
  for i in 0 ..< int(this.counter):
    let it = DsStore_Block_BlockData.read(this.io, this.root, this, this.mode)
    this.data.add(it)

proc rightmostBlock(this: DsStore_Block): DsStore_Block = 

  ##[
  Rightmost child block pointer.
  ]##
  if this.rightmostBlockInstFlag:
    return this.rightmostBlockInst
  if this.mode > 0:
    let io = DsStore(this.root).io
    let pos = io.pos()
    io.seek(int(DsStore(this.root).buddyAllocatorBody.blockAddresses[this.mode].offset))
    let rightmostBlockInstExpr = DsStore_Block.read(io, this.root, this)
    this.rightmostBlockInst = rightmostBlockInstExpr
    io.seek(pos)
  this.rightmostBlockInstFlag = true
  return this.rightmostBlockInst

proc fromFile*(_: typedesc[DsStore_Block], filename: string): DsStore_Block =
  DsStore_Block.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DsStore_Block_BlockData], io: KaitaiStream, root: KaitaiStruct, parent: DsStore_Block, mode: any): DsStore_Block_BlockData =
  template this: untyped = result
  this = new(DsStore_Block_BlockData)
  let root = if root == nil: cast[DsStore](this) else: cast[DsStore](root)
  this.io = io
  this.root = root
  this.parent = parent
  let modeExpr = uint32(mode)
  this.mode = modeExpr

  if this.mode > 0:
    let blockIdExpr = this.io.readU4be()
    this.blockId = blockIdExpr
  let recordExpr = DsStore_Block_BlockData_Record.read(this.io, this.root, this)
  this.record = recordExpr

proc block(this: DsStore_Block_BlockData): DsStore_Block = 
  if this.blockInstFlag:
    return this.blockInst
  if this.mode > 0:
    let io = DsStore(this.root).io
    let pos = io.pos()
    io.seek(int(DsStore(this.root).buddyAllocatorBody.blockAddresses[(uint32(this.blockId))].offset))
    let blockInstExpr = DsStore_Block.read(io, this.root, this)
    this.blockInst = blockInstExpr
    io.seek(pos)
  this.blockInstFlag = true
  return this.blockInst

proc fromFile*(_: typedesc[DsStore_Block_BlockData], filename: string): DsStore_Block_BlockData =
  DsStore_Block_BlockData.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DsStore_Block_BlockData_Record], io: KaitaiStream, root: KaitaiStruct, parent: DsStore_Block_BlockData): DsStore_Block_BlockData_Record =
  template this: untyped = result
  this = new(DsStore_Block_BlockData_Record)
  let root = if root == nil: cast[DsStore](this) else: cast[DsStore](root)
  this.io = io
  this.root = root
  this.parent = parent

  let filenameExpr = DsStore_Block_BlockData_Record_Ustr.read(this.io, this.root, this)
  this.filename = filenameExpr

  ##[
  Description of the entry's property.
  ]##
  let structureTypeExpr = DsStore_Block_BlockData_Record_FourCharCode.read(this.io, this.root, this)
  this.structureType = structureTypeExpr

  ##[
  Data type of the value.
  ]##
  let dataTypeExpr = encode(this.io.readBytes(int(4)), "UTF-8")
  this.dataType = dataTypeExpr
  block:
    let on = this.dataType
    if on == "long":
      let valueExpr = KaitaiStruct(this.io.readU4be())
      this.value = valueExpr
    elif on == "shor":
      let valueExpr = KaitaiStruct(this.io.readU4be())
      this.value = valueExpr
    elif on == "comp":
      let valueExpr = KaitaiStruct(this.io.readU8be())
      this.value = valueExpr
    elif on == "bool":
      let valueExpr = KaitaiStruct(this.io.readU1())
      this.value = valueExpr
    elif on == "ustr":
      let valueExpr = DsStore_Block_BlockData_Record_Ustr.read(this.io, this.root, this)
      this.value = valueExpr
    elif on == "dutc":
      let valueExpr = KaitaiStruct(this.io.readU8be())
      this.value = valueExpr
    elif on == "type":
      let valueExpr = DsStore_Block_BlockData_Record_FourCharCode.read(this.io, this.root, this)
      this.value = valueExpr
    elif on == "blob":
      let valueExpr = DsStore_Block_BlockData_Record_RecordBlob.read(this.io, this.root, this)
      this.value = valueExpr

proc fromFile*(_: typedesc[DsStore_Block_BlockData_Record], filename: string): DsStore_Block_BlockData_Record =
  DsStore_Block_BlockData_Record.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DsStore_Block_BlockData_Record_RecordBlob], io: KaitaiStream, root: KaitaiStruct, parent: DsStore_Block_BlockData_Record): DsStore_Block_BlockData_Record_RecordBlob =
  template this: untyped = result
  this = new(DsStore_Block_BlockData_Record_RecordBlob)
  let root = if root == nil: cast[DsStore](this) else: cast[DsStore](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lengthExpr = this.io.readU4be()
  this.length = lengthExpr
  let valueExpr = this.io.readBytes(int(this.length))
  this.value = valueExpr

proc fromFile*(_: typedesc[DsStore_Block_BlockData_Record_RecordBlob], filename: string): DsStore_Block_BlockData_Record_RecordBlob =
  DsStore_Block_BlockData_Record_RecordBlob.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DsStore_Block_BlockData_Record_Ustr], io: KaitaiStream, root: KaitaiStruct, parent: DsStore_Block_BlockData_Record): DsStore_Block_BlockData_Record_Ustr =
  template this: untyped = result
  this = new(DsStore_Block_BlockData_Record_Ustr)
  let root = if root == nil: cast[DsStore](this) else: cast[DsStore](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lengthExpr = this.io.readU4be()
  this.length = lengthExpr
  let valueExpr = encode(this.io.readBytes(int((2 * this.length))), "UTF-16BE")
  this.value = valueExpr

proc fromFile*(_: typedesc[DsStore_Block_BlockData_Record_Ustr], filename: string): DsStore_Block_BlockData_Record_Ustr =
  DsStore_Block_BlockData_Record_Ustr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[DsStore_Block_BlockData_Record_FourCharCode], io: KaitaiStream, root: KaitaiStruct, parent: DsStore_Block_BlockData_Record): DsStore_Block_BlockData_Record_FourCharCode =
  template this: untyped = result
  this = new(DsStore_Block_BlockData_Record_FourCharCode)
  let root = if root == nil: cast[DsStore](this) else: cast[DsStore](root)
  this.io = io
  this.root = root
  this.parent = parent

  let valueExpr = encode(this.io.readBytes(int(4)), "UTF-8")
  this.value = valueExpr

proc fromFile*(_: typedesc[DsStore_Block_BlockData_Record_FourCharCode], filename: string): DsStore_Block_BlockData_Record_FourCharCode =
  DsStore_Block_BlockData_Record_FourCharCode.read(newKaitaiFileStream(filename), nil, nil)


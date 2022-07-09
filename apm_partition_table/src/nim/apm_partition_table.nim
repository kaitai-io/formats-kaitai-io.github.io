import kaitai_struct_nim_runtime
import options

type
  ApmPartitionTable* = ref object of KaitaiStruct
    `parent`*: KaitaiStruct
    `rawPartitionLookupInst`*: seq[byte]
    `rawPartitionEntriesInst`*: seq[seq[byte]]
    `sectorSizeInst`: int
    `sectorSizeInstFlag`: bool
    `partitionLookupInst`: ApmPartitionTable_PartitionEntry
    `partitionLookupInstFlag`: bool
    `partitionEntriesInst`: seq[ApmPartitionTable_PartitionEntry]
    `partitionEntriesInstFlag`: bool
  ApmPartitionTable_PartitionEntry* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `reserved1`*: seq[byte]
    `numberOfPartitions`*: uint32
    `partitionStart`*: uint32
    `partitionSize`*: uint32
    `partitionName`*: string
    `partitionType`*: string
    `dataStart`*: uint32
    `dataSize`*: uint32
    `partitionStatus`*: uint32
    `bootCodeStart`*: uint32
    `bootCodeSize`*: uint32
    `bootLoaderAddress`*: uint32
    `reserved2`*: seq[byte]
    `bootCodeEntry`*: uint32
    `reserved3`*: seq[byte]
    `bootCodeCksum`*: uint32
    `processorType`*: string
    `parent`*: ApmPartitionTable
    `partitionInst`: seq[byte]
    `partitionInstFlag`: bool
    `dataInst`: seq[byte]
    `dataInstFlag`: bool
    `bootCodeInst`: seq[byte]
    `bootCodeInstFlag`: bool

proc read*(_: typedesc[ApmPartitionTable], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): ApmPartitionTable
proc read*(_: typedesc[ApmPartitionTable_PartitionEntry], io: KaitaiStream, root: KaitaiStruct, parent: ApmPartitionTable): ApmPartitionTable_PartitionEntry

proc sectorSize*(this: ApmPartitionTable): int
proc partitionLookup*(this: ApmPartitionTable): ApmPartitionTable_PartitionEntry
proc partitionEntries*(this: ApmPartitionTable): seq[ApmPartitionTable_PartitionEntry]
proc partition*(this: ApmPartitionTable_PartitionEntry): seq[byte]
proc data*(this: ApmPartitionTable_PartitionEntry): seq[byte]
proc bootCode*(this: ApmPartitionTable_PartitionEntry): seq[byte]


##[
@see <a href="https://en.wikipedia.org/wiki/Apple_Partition_Map">Source</a>
]##
proc read*(_: typedesc[ApmPartitionTable], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): ApmPartitionTable =
  template this: untyped = result
  this = new(ApmPartitionTable)
  let root = if root == nil: cast[ApmPartitionTable](this) else: cast[ApmPartitionTable](root)
  this.io = io
  this.root = root
  this.parent = parent


proc sectorSize(this: ApmPartitionTable): int = 

  ##[
  0x200 (512) bytes for disks, 0x1000 (4096) bytes is not supported by APM
0x800 (2048) bytes for CDROM

  ]##
  if this.sectorSizeInstFlag:
    return this.sectorSizeInst
  let sectorSizeInstExpr = int(512)
  this.sectorSizeInst = sectorSizeInstExpr
  this.sectorSizeInstFlag = true
  return this.sectorSizeInst

proc partitionLookup(this: ApmPartitionTable): ApmPartitionTable_PartitionEntry = 

  ##[
  Every partition entry contains the number of partition entries.
We parse the first entry, to know how many to parse, including the first one.
No logic is given what to do if other entries have a different number.

  ]##
  if this.partitionLookupInstFlag:
    return this.partitionLookupInst
  let io = ApmPartitionTable(this.root).io
  let pos = io.pos()
  io.seek(int(ApmPartitionTable(this.root).sectorSize))
  let rawPartitionLookupInstExpr = io.readBytes(int(this.sectorSize))
  this.rawPartitionLookupInst = rawPartitionLookupInstExpr
  let rawPartitionLookupInstIo = newKaitaiStream(rawPartitionLookupInstExpr)
  let partitionLookupInstExpr = ApmPartitionTable_PartitionEntry.read(rawPartitionLookupInstIo, this.root, this)
  this.partitionLookupInst = partitionLookupInstExpr
  io.seek(pos)
  this.partitionLookupInstFlag = true
  return this.partitionLookupInst

proc partitionEntries(this: ApmPartitionTable): seq[ApmPartitionTable_PartitionEntry] = 
  if this.partitionEntriesInstFlag:
    return this.partitionEntriesInst
  let io = ApmPartitionTable(this.root).io
  let pos = io.pos()
  io.seek(int(ApmPartitionTable(this.root).sectorSize))
  for i in 0 ..< int(ApmPartitionTable(this.root).partitionLookup.numberOfPartitions):
    let buf = io.readBytes(int(this.sectorSize))
    this.rawPartitionEntriesInst.add(buf)
    let rawPartitionEntriesInstIo = newKaitaiStream(buf)
    let it = ApmPartitionTable_PartitionEntry.read(rawPartitionEntriesInstIo, this.root, this)
    this.partitionEntriesInst.add(it)
  io.seek(pos)
  this.partitionEntriesInstFlag = true
  return this.partitionEntriesInst

proc fromFile*(_: typedesc[ApmPartitionTable], filename: string): ApmPartitionTable =
  ApmPartitionTable.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[ApmPartitionTable_PartitionEntry], io: KaitaiStream, root: KaitaiStruct, parent: ApmPartitionTable): ApmPartitionTable_PartitionEntry =
  template this: untyped = result
  this = new(ApmPartitionTable_PartitionEntry)
  let root = if root == nil: cast[ApmPartitionTable](this) else: cast[ApmPartitionTable](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(2))
  this.magic = magicExpr
  let reserved1Expr = this.io.readBytes(int(2))
  this.reserved1 = reserved1Expr
  let numberOfPartitionsExpr = this.io.readU4be()
  this.numberOfPartitions = numberOfPartitionsExpr

  ##[
  First sector
  ]##
  let partitionStartExpr = this.io.readU4be()
  this.partitionStart = partitionStartExpr

  ##[
  Number of sectors
  ]##
  let partitionSizeExpr = this.io.readU4be()
  this.partitionSize = partitionSizeExpr
  let partitionNameExpr = encode(this.io.readBytes(int(32)).bytesTerminate(0, false), "ascii")
  this.partitionName = partitionNameExpr
  let partitionTypeExpr = encode(this.io.readBytes(int(32)).bytesTerminate(0, false), "ascii")
  this.partitionType = partitionTypeExpr

  ##[
  First sector
  ]##
  let dataStartExpr = this.io.readU4be()
  this.dataStart = dataStartExpr

  ##[
  Number of sectors
  ]##
  let dataSizeExpr = this.io.readU4be()
  this.dataSize = dataSizeExpr
  let partitionStatusExpr = this.io.readU4be()
  this.partitionStatus = partitionStatusExpr

  ##[
  First sector
  ]##
  let bootCodeStartExpr = this.io.readU4be()
  this.bootCodeStart = bootCodeStartExpr

  ##[
  Number of bytes
  ]##
  let bootCodeSizeExpr = this.io.readU4be()
  this.bootCodeSize = bootCodeSizeExpr

  ##[
  Address of bootloader code
  ]##
  let bootLoaderAddressExpr = this.io.readU4be()
  this.bootLoaderAddress = bootLoaderAddressExpr
  let reserved2Expr = this.io.readBytes(int(4))
  this.reserved2 = reserved2Expr

  ##[
  Boot code entry point
  ]##
  let bootCodeEntryExpr = this.io.readU4be()
  this.bootCodeEntry = bootCodeEntryExpr
  let reserved3Expr = this.io.readBytes(int(4))
  this.reserved3 = reserved3Expr

  ##[
  Boot code checksum
  ]##
  let bootCodeCksumExpr = this.io.readU4be()
  this.bootCodeCksum = bootCodeCksumExpr
  let processorTypeExpr = encode(this.io.readBytes(int(16)).bytesTerminate(0, false), "ascii")
  this.processorType = processorTypeExpr

proc partition(this: ApmPartitionTable_PartitionEntry): seq[byte] = 
  if this.partitionInstFlag:
    return this.partitionInst
  if (this.partitionStatus and 1) != 0:
    let io = ApmPartitionTable(this.root).io
    let pos = io.pos()
    io.seek(int((this.partitionStart * ApmPartitionTable(this.root).sectorSize)))
    let partitionInstExpr = io.readBytes(int((this.partitionSize * ApmPartitionTable(this.root).sectorSize)))
    this.partitionInst = partitionInstExpr
    io.seek(pos)
  this.partitionInstFlag = true
  return this.partitionInst

proc data(this: ApmPartitionTable_PartitionEntry): seq[byte] = 
  if this.dataInstFlag:
    return this.dataInst
  let io = ApmPartitionTable(this.root).io
  let pos = io.pos()
  io.seek(int((this.dataStart * ApmPartitionTable(this.root).sectorSize)))
  let dataInstExpr = io.readBytes(int((this.dataSize * ApmPartitionTable(this.root).sectorSize)))
  this.dataInst = dataInstExpr
  io.seek(pos)
  this.dataInstFlag = true
  return this.dataInst

proc bootCode(this: ApmPartitionTable_PartitionEntry): seq[byte] = 
  if this.bootCodeInstFlag:
    return this.bootCodeInst
  let io = ApmPartitionTable(this.root).io
  let pos = io.pos()
  io.seek(int((this.bootCodeStart * ApmPartitionTable(this.root).sectorSize)))
  let bootCodeInstExpr = io.readBytes(int(this.bootCodeSize))
  this.bootCodeInst = bootCodeInstExpr
  io.seek(pos)
  this.bootCodeInstFlag = true
  return this.bootCodeInst

proc fromFile*(_: typedesc[ApmPartitionTable_PartitionEntry], filename: string): ApmPartitionTable_PartitionEntry =
  ApmPartitionTable_PartitionEntry.read(newKaitaiFileStream(filename), nil, nil)


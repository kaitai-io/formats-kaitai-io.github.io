import kaitai_struct_nim_runtime
import options

type
  GptPartitionTable* = ref object of KaitaiStruct
    `parent`*: KaitaiStruct
    `sectorSizeInst`: int
    `sectorSizeInstFlag`: bool
    `primaryInst`: GptPartitionTable_PartitionHeader
    `primaryInstFlag`: bool
    `backupInst`: GptPartitionTable_PartitionHeader
    `backupInstFlag`: bool
  GptPartitionTable_PartitionEntry* = ref object of KaitaiStruct
    `typeGuid`*: seq[byte]
    `guid`*: seq[byte]
    `firstLba`*: uint64
    `lastLba`*: uint64
    `attributes`*: uint64
    `name`*: string
    `parent`*: GptPartitionTable_PartitionHeader
  GptPartitionTable_PartitionHeader* = ref object of KaitaiStruct
    `signature`*: seq[byte]
    `revision`*: uint32
    `headerSize`*: uint32
    `crc32Header`*: uint32
    `reserved`*: uint32
    `currentLba`*: uint64
    `backupLba`*: uint64
    `firstUsableLba`*: uint64
    `lastUsableLba`*: uint64
    `diskGuid`*: seq[byte]
    `entriesStart`*: uint64
    `entriesCount`*: uint32
    `entriesSize`*: uint32
    `crc32Array`*: uint32
    `parent`*: GptPartitionTable
    `rawEntriesInst`*: seq[seq[byte]]
    `entriesInst`: seq[GptPartitionTable_PartitionEntry]
    `entriesInstFlag`: bool

proc read*(_: typedesc[GptPartitionTable], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GptPartitionTable
proc read*(_: typedesc[GptPartitionTable_PartitionEntry], io: KaitaiStream, root: KaitaiStruct, parent: GptPartitionTable_PartitionHeader): GptPartitionTable_PartitionEntry
proc read*(_: typedesc[GptPartitionTable_PartitionHeader], io: KaitaiStream, root: KaitaiStruct, parent: GptPartitionTable): GptPartitionTable_PartitionHeader

proc sectorSize*(this: GptPartitionTable): int
proc primary*(this: GptPartitionTable): GptPartitionTable_PartitionHeader
proc backup*(this: GptPartitionTable): GptPartitionTable_PartitionHeader
proc entries*(this: GptPartitionTable_PartitionHeader): seq[GptPartitionTable_PartitionEntry]


##[
@see <a href="https://en.wikipedia.org/wiki/GUID_Partition_Table">Source</a>
]##
proc read*(_: typedesc[GptPartitionTable], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GptPartitionTable =
  template this: untyped = result
  this = new(GptPartitionTable)
  let root = if root == nil: cast[GptPartitionTable](this) else: cast[GptPartitionTable](root)
  this.io = io
  this.root = root
  this.parent = parent


proc sectorSize(this: GptPartitionTable): int = 
  if this.sectorSizeInstFlag:
    return this.sectorSizeInst
  let sectorSizeInstExpr = int(512)
  this.sectorSizeInst = sectorSizeInstExpr
  this.sectorSizeInstFlag = true
  return this.sectorSizeInst

proc primary(this: GptPartitionTable): GptPartitionTable_PartitionHeader = 
  if this.primaryInstFlag:
    return this.primaryInst
  let io = GptPartitionTable(this.root).io
  let pos = io.pos()
  io.seek(int(GptPartitionTable(this.root).sectorSize))
  let primaryInstExpr = GptPartitionTable_PartitionHeader.read(io, this.root, this)
  this.primaryInst = primaryInstExpr
  io.seek(pos)
  this.primaryInstFlag = true
  return this.primaryInst

proc backup(this: GptPartitionTable): GptPartitionTable_PartitionHeader = 
  if this.backupInstFlag:
    return this.backupInst
  let io = GptPartitionTable(this.root).io
  let pos = io.pos()
  io.seek(int((this.io.size - GptPartitionTable(this.root).sectorSize)))
  let backupInstExpr = GptPartitionTable_PartitionHeader.read(io, this.root, this)
  this.backupInst = backupInstExpr
  io.seek(pos)
  this.backupInstFlag = true
  return this.backupInst

proc fromFile*(_: typedesc[GptPartitionTable], filename: string): GptPartitionTable =
  GptPartitionTable.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[GptPartitionTable_PartitionEntry], io: KaitaiStream, root: KaitaiStruct, parent: GptPartitionTable_PartitionHeader): GptPartitionTable_PartitionEntry =
  template this: untyped = result
  this = new(GptPartitionTable_PartitionEntry)
  let root = if root == nil: cast[GptPartitionTable](this) else: cast[GptPartitionTable](root)
  this.io = io
  this.root = root
  this.parent = parent

  let typeGuidExpr = this.io.readBytes(int(16))
  this.typeGuid = typeGuidExpr
  let guidExpr = this.io.readBytes(int(16))
  this.guid = guidExpr
  let firstLbaExpr = this.io.readU8le()
  this.firstLba = firstLbaExpr
  let lastLbaExpr = this.io.readU8le()
  this.lastLba = lastLbaExpr
  let attributesExpr = this.io.readU8le()
  this.attributes = attributesExpr
  let nameExpr = encode(this.io.readBytes(int(72)), "UTF-16LE")
  this.name = nameExpr

proc fromFile*(_: typedesc[GptPartitionTable_PartitionEntry], filename: string): GptPartitionTable_PartitionEntry =
  GptPartitionTable_PartitionEntry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[GptPartitionTable_PartitionHeader], io: KaitaiStream, root: KaitaiStruct, parent: GptPartitionTable): GptPartitionTable_PartitionHeader =
  template this: untyped = result
  this = new(GptPartitionTable_PartitionHeader)
  let root = if root == nil: cast[GptPartitionTable](this) else: cast[GptPartitionTable](root)
  this.io = io
  this.root = root
  this.parent = parent

  let signatureExpr = this.io.readBytes(int(8))
  this.signature = signatureExpr
  let revisionExpr = this.io.readU4le()
  this.revision = revisionExpr
  let headerSizeExpr = this.io.readU4le()
  this.headerSize = headerSizeExpr
  let crc32HeaderExpr = this.io.readU4le()
  this.crc32Header = crc32HeaderExpr
  let reservedExpr = this.io.readU4le()
  this.reserved = reservedExpr
  let currentLbaExpr = this.io.readU8le()
  this.currentLba = currentLbaExpr
  let backupLbaExpr = this.io.readU8le()
  this.backupLba = backupLbaExpr
  let firstUsableLbaExpr = this.io.readU8le()
  this.firstUsableLba = firstUsableLbaExpr
  let lastUsableLbaExpr = this.io.readU8le()
  this.lastUsableLba = lastUsableLbaExpr
  let diskGuidExpr = this.io.readBytes(int(16))
  this.diskGuid = diskGuidExpr
  let entriesStartExpr = this.io.readU8le()
  this.entriesStart = entriesStartExpr
  let entriesCountExpr = this.io.readU4le()
  this.entriesCount = entriesCountExpr
  let entriesSizeExpr = this.io.readU4le()
  this.entriesSize = entriesSizeExpr
  let crc32ArrayExpr = this.io.readU4le()
  this.crc32Array = crc32ArrayExpr

proc entries(this: GptPartitionTable_PartitionHeader): seq[GptPartitionTable_PartitionEntry] = 
  if this.entriesInstFlag:
    return this.entriesInst
  let io = GptPartitionTable(this.root).io
  let pos = io.pos()
  io.seek(int((this.entriesStart * GptPartitionTable(this.root).sectorSize)))
  for i in 0 ..< int(this.entriesCount):
    let buf = io.readBytes(int(this.entriesSize))
    this.rawEntriesInst.add(buf)
    let rawEntriesInstIo = newKaitaiStream(buf)
    let it = GptPartitionTable_PartitionEntry.read(rawEntriesInstIo, this.root, this)
    this.entriesInst.add(it)
  io.seek(pos)
  this.entriesInstFlag = true
  return this.entriesInst

proc fromFile*(_: typedesc[GptPartitionTable_PartitionHeader], filename: string): GptPartitionTable_PartitionHeader =
  GptPartitionTable_PartitionHeader.read(newKaitaiFileStream(filename), nil, nil)


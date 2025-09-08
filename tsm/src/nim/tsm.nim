import kaitai_struct_nim_runtime
import options

type
  Tsm* = ref object of KaitaiStruct
    `header`*: Tsm_Header
    `parent`*: KaitaiStruct
    `indexInst`: Tsm_Index
    `indexInstFlag`: bool
  Tsm_Header* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `version`*: uint8
    `parent`*: Tsm
  Tsm_Index* = ref object of KaitaiStruct
    `offset`*: uint64
    `parent`*: Tsm
    `entriesInst`: seq[Tsm_Index_IndexHeader]
    `entriesInstFlag`: bool
  Tsm_Index_IndexHeader* = ref object of KaitaiStruct
    `keyLen`*: uint16
    `key`*: string
    `type`*: uint8
    `entryCount`*: uint16
    `indexEntries`*: seq[Tsm_Index_IndexHeader_IndexEntry]
    `parent`*: Tsm_Index
  Tsm_Index_IndexHeader_IndexEntry* = ref object of KaitaiStruct
    `minTime`*: uint64
    `maxTime`*: uint64
    `blockOffset`*: uint64
    `blockSize`*: uint32
    `parent`*: Tsm_Index_IndexHeader
    `blockInst`: Tsm_Index_IndexHeader_IndexEntry_BlockEntry
    `blockInstFlag`: bool
  Tsm_Index_IndexHeader_IndexEntry_BlockEntry* = ref object of KaitaiStruct
    `crc32`*: uint32
    `data`*: seq[byte]
    `parent`*: Tsm_Index_IndexHeader_IndexEntry

proc read*(_: typedesc[Tsm], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Tsm
proc read*(_: typedesc[Tsm_Header], io: KaitaiStream, root: KaitaiStruct, parent: Tsm): Tsm_Header
proc read*(_: typedesc[Tsm_Index], io: KaitaiStream, root: KaitaiStruct, parent: Tsm): Tsm_Index
proc read*(_: typedesc[Tsm_Index_IndexHeader], io: KaitaiStream, root: KaitaiStruct, parent: Tsm_Index): Tsm_Index_IndexHeader
proc read*(_: typedesc[Tsm_Index_IndexHeader_IndexEntry], io: KaitaiStream, root: KaitaiStruct, parent: Tsm_Index_IndexHeader): Tsm_Index_IndexHeader_IndexEntry
proc read*(_: typedesc[Tsm_Index_IndexHeader_IndexEntry_BlockEntry], io: KaitaiStream, root: KaitaiStruct, parent: Tsm_Index_IndexHeader_IndexEntry): Tsm_Index_IndexHeader_IndexEntry_BlockEntry

proc index*(this: Tsm): Tsm_Index
proc entries*(this: Tsm_Index): seq[Tsm_Index_IndexHeader]
proc block*(this: Tsm_Index_IndexHeader_IndexEntry): Tsm_Index_IndexHeader_IndexEntry_BlockEntry


##[
InfluxDB is a scalable database optimized for storage of time
series, real-time application metrics, operations monitoring events,
etc, written in Go.

Data is stored in .tsm files, which are kept pretty simple
conceptually. Each .tsm file contains a header and footer, which
stores offset to an index. Index is used to find a data block for a
requested time boundary.

]##
proc read*(_: typedesc[Tsm], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Tsm =
  template this: untyped = result
  this = new(Tsm)
  let root = if root == nil: cast[Tsm](this) else: cast[Tsm](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = Tsm_Header.read(this.io, this.root, this)
  this.header = headerExpr

proc index(this: Tsm): Tsm_Index = 
  if this.indexInstFlag:
    return this.indexInst
  let pos = this.io.pos()
  this.io.seek(int(this.io.size - 8))
  let indexInstExpr = Tsm_Index.read(this.io, this.root, this)
  this.indexInst = indexInstExpr
  this.io.seek(pos)
  this.indexInstFlag = true
  return this.indexInst

proc fromFile*(_: typedesc[Tsm], filename: string): Tsm =
  Tsm.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Tsm_Header], io: KaitaiStream, root: KaitaiStruct, parent: Tsm): Tsm_Header =
  template this: untyped = result
  this = new(Tsm_Header)
  let root = if root == nil: cast[Tsm](this) else: cast[Tsm](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let versionExpr = this.io.readU1()
  this.version = versionExpr

proc fromFile*(_: typedesc[Tsm_Header], filename: string): Tsm_Header =
  Tsm_Header.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Tsm_Index], io: KaitaiStream, root: KaitaiStruct, parent: Tsm): Tsm_Index =
  template this: untyped = result
  this = new(Tsm_Index)
  let root = if root == nil: cast[Tsm](this) else: cast[Tsm](root)
  this.io = io
  this.root = root
  this.parent = parent

  let offsetExpr = this.io.readU8be()
  this.offset = offsetExpr

proc entries(this: Tsm_Index): seq[Tsm_Index_IndexHeader] = 
  if this.entriesInstFlag:
    return this.entriesInst
  let pos = this.io.pos()
  this.io.seek(int(this.offset))
  block:
    var i: int
    while true:
      let it = Tsm_Index_IndexHeader.read(this.io, this.root, this)
      this.entriesInst.add(it)
      if this.io.pos == this.io.size - 8:
        break
      inc i
  this.io.seek(pos)
  this.entriesInstFlag = true
  return this.entriesInst

proc fromFile*(_: typedesc[Tsm_Index], filename: string): Tsm_Index =
  Tsm_Index.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Tsm_Index_IndexHeader], io: KaitaiStream, root: KaitaiStruct, parent: Tsm_Index): Tsm_Index_IndexHeader =
  template this: untyped = result
  this = new(Tsm_Index_IndexHeader)
  let root = if root == nil: cast[Tsm](this) else: cast[Tsm](root)
  this.io = io
  this.root = root
  this.parent = parent

  let keyLenExpr = this.io.readU2be()
  this.keyLen = keyLenExpr
  let keyExpr = encode(this.io.readBytes(int(this.keyLen)), "UTF-8")
  this.key = keyExpr
  let typeExpr = this.io.readU1()
  this.type = typeExpr
  let entryCountExpr = this.io.readU2be()
  this.entryCount = entryCountExpr
  for i in 0 ..< int(this.entryCount):
    let it = Tsm_Index_IndexHeader_IndexEntry.read(this.io, this.root, this)
    this.indexEntries.add(it)

proc fromFile*(_: typedesc[Tsm_Index_IndexHeader], filename: string): Tsm_Index_IndexHeader =
  Tsm_Index_IndexHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Tsm_Index_IndexHeader_IndexEntry], io: KaitaiStream, root: KaitaiStruct, parent: Tsm_Index_IndexHeader): Tsm_Index_IndexHeader_IndexEntry =
  template this: untyped = result
  this = new(Tsm_Index_IndexHeader_IndexEntry)
  let root = if root == nil: cast[Tsm](this) else: cast[Tsm](root)
  this.io = io
  this.root = root
  this.parent = parent

  let minTimeExpr = this.io.readU8be()
  this.minTime = minTimeExpr
  let maxTimeExpr = this.io.readU8be()
  this.maxTime = maxTimeExpr
  let blockOffsetExpr = this.io.readU8be()
  this.blockOffset = blockOffsetExpr
  let blockSizeExpr = this.io.readU4be()
  this.blockSize = blockSizeExpr

proc block(this: Tsm_Index_IndexHeader_IndexEntry): Tsm_Index_IndexHeader_IndexEntry_BlockEntry = 
  if this.blockInstFlag:
    return this.blockInst
  let io = Tsm(this.root).io
  let pos = io.pos()
  io.seek(int(this.blockOffset))
  let blockInstExpr = Tsm_Index_IndexHeader_IndexEntry_BlockEntry.read(io, this.root, this)
  this.blockInst = blockInstExpr
  io.seek(pos)
  this.blockInstFlag = true
  return this.blockInst

proc fromFile*(_: typedesc[Tsm_Index_IndexHeader_IndexEntry], filename: string): Tsm_Index_IndexHeader_IndexEntry =
  Tsm_Index_IndexHeader_IndexEntry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Tsm_Index_IndexHeader_IndexEntry_BlockEntry], io: KaitaiStream, root: KaitaiStruct, parent: Tsm_Index_IndexHeader_IndexEntry): Tsm_Index_IndexHeader_IndexEntry_BlockEntry =
  template this: untyped = result
  this = new(Tsm_Index_IndexHeader_IndexEntry_BlockEntry)
  let root = if root == nil: cast[Tsm](this) else: cast[Tsm](root)
  this.io = io
  this.root = root
  this.parent = parent

  let crc32Expr = this.io.readU4be()
  this.crc32 = crc32Expr
  let dataExpr = this.io.readBytes(int(this.parent.blockSize - 4))
  this.data = dataExpr

proc fromFile*(_: typedesc[Tsm_Index_IndexHeader_IndexEntry_BlockEntry], filename: string): Tsm_Index_IndexHeader_IndexEntry_BlockEntry =
  Tsm_Index_IndexHeader_IndexEntry_BlockEntry.read(newKaitaiFileStream(filename), nil, nil)


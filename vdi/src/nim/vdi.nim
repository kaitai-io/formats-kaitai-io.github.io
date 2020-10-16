import kaitai_struct_nim_runtime
import options

type
  Vdi* = ref object of KaitaiStruct
    `header`*: Vdi_Header
    `parent`*: KaitaiStruct
    `rawBlocksMapInst`*: seq[byte]
    `blockDiscardedInst`*: int
    `blockUnallocatedInst`*: int
    `blocksMapInst`*: Vdi_BlocksMap
    `diskInst`*: Vdi_Disk
  Vdi_ImageType* = enum
    dynamic = 1
    static = 2
    undo = 3
    diff = 4
  Vdi_Header* = ref object of KaitaiStruct
    `text`*: string
    `signature`*: seq[byte]
    `version`*: Vdi_Header_Version
    `headerSizeOptional`*: uint32
    `headerMain`*: Vdi_Header_HeaderMain
    `parent`*: Vdi
    `rawHeaderMain`*: seq[byte]
    `headerSizeInst`*: int
    `blocksMapOffsetInst`*: uint32
    `subheaderSizeIsDynamicInst`*: bool
    `blocksOffsetInst`*: uint32
    `blockSizeInst`*: int
    `blocksMapSizeInst`*: int
  Vdi_Header_Uuid* = ref object of KaitaiStruct
    `uuid`*: seq[byte]
    `parent`*: Vdi_Header_HeaderMain
  Vdi_Header_Version* = ref object of KaitaiStruct
    `major`*: uint16
    `minor`*: uint16
    `parent`*: Vdi_Header
  Vdi_Header_HeaderMain* = ref object of KaitaiStruct
    `imageType`*: Vdi_ImageType
    `imageFlags`*: Vdi_Header_HeaderMain_Flags
    `description`*: string
    `blocksMapOffset`*: uint32
    `offsetData`*: uint32
    `geometry`*: Vdi_Header_HeaderMain_Geometry
    `reserved1`*: uint32
    `diskSize`*: uint64
    `blockDataSize`*: uint32
    `blockMetadataSize`*: uint32
    `blocksInImage`*: uint32
    `blocksAllocated`*: uint32
    `uuidImage`*: Vdi_Header_Uuid
    `uuidLastSnap`*: Vdi_Header_Uuid
    `uuidLink`*: Vdi_Header_Uuid
    `uuidParent`*: Vdi_Header_Uuid
    `lchcGeometry`*: Vdi_Header_HeaderMain_Geometry
    `parent`*: Vdi_Header
  Vdi_Header_HeaderMain_Geometry* = ref object of KaitaiStruct
    `cylinders`*: uint32
    `heads`*: uint32
    `sectors`*: uint32
    `sectorSize`*: uint32
    `parent`*: Vdi_Header_HeaderMain
  Vdi_Header_HeaderMain_Flags* = ref object of KaitaiStruct
    `reserved0`*: uint64
    `zeroExpand`*: bool
    `reserved1`*: uint64
    `diff`*: bool
    `fixed`*: bool
    `reserved2`*: uint64
    `parent`*: Vdi_Header_HeaderMain
  Vdi_BlocksMap* = ref object of KaitaiStruct
    `index`*: seq[Vdi_BlocksMap_BlockIndex]
    `parent`*: Vdi
  Vdi_BlocksMap_BlockIndex* = ref object of KaitaiStruct
    `index`*: uint32
    `parent`*: Vdi_BlocksMap
    `isAllocatedInst`*: bool
    `blockInst`*: Vdi_Disk_Block
  Vdi_Disk* = ref object of KaitaiStruct
    `blocks`*: seq[Vdi_Disk_Block]
    `parent`*: Vdi
  Vdi_Disk_Block* = ref object of KaitaiStruct
    `metadata`*: seq[byte]
    `data`*: seq[Vdi_Disk_Block_Sector]
    `parent`*: Vdi_Disk
    `rawData`*: seq[seq[byte]]
  Vdi_Disk_Block_Sector* = ref object of KaitaiStruct
    `data`*: seq[byte]
    `parent`*: Vdi_Disk_Block

proc read*(_: typedesc[Vdi], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Vdi
proc read*(_: typedesc[Vdi_Header], io: KaitaiStream, root: KaitaiStruct, parent: Vdi): Vdi_Header
proc read*(_: typedesc[Vdi_Header_Uuid], io: KaitaiStream, root: KaitaiStruct, parent: Vdi_Header_HeaderMain): Vdi_Header_Uuid
proc read*(_: typedesc[Vdi_Header_Version], io: KaitaiStream, root: KaitaiStruct, parent: Vdi_Header): Vdi_Header_Version
proc read*(_: typedesc[Vdi_Header_HeaderMain], io: KaitaiStream, root: KaitaiStruct, parent: Vdi_Header): Vdi_Header_HeaderMain
proc read*(_: typedesc[Vdi_Header_HeaderMain_Geometry], io: KaitaiStream, root: KaitaiStruct, parent: Vdi_Header_HeaderMain): Vdi_Header_HeaderMain_Geometry
proc read*(_: typedesc[Vdi_Header_HeaderMain_Flags], io: KaitaiStream, root: KaitaiStruct, parent: Vdi_Header_HeaderMain): Vdi_Header_HeaderMain_Flags
proc read*(_: typedesc[Vdi_BlocksMap], io: KaitaiStream, root: KaitaiStruct, parent: Vdi): Vdi_BlocksMap
proc read*(_: typedesc[Vdi_BlocksMap_BlockIndex], io: KaitaiStream, root: KaitaiStruct, parent: Vdi_BlocksMap): Vdi_BlocksMap_BlockIndex
proc read*(_: typedesc[Vdi_Disk], io: KaitaiStream, root: KaitaiStruct, parent: Vdi): Vdi_Disk
proc read*(_: typedesc[Vdi_Disk_Block], io: KaitaiStream, root: KaitaiStruct, parent: Vdi_Disk): Vdi_Disk_Block
proc read*(_: typedesc[Vdi_Disk_Block_Sector], io: KaitaiStream, root: KaitaiStruct, parent: Vdi_Disk_Block): Vdi_Disk_Block_Sector

proc blockDiscarded*(this: Vdi): int
proc blockUnallocated*(this: Vdi): int
proc blocksMap*(this: Vdi): Vdi_BlocksMap
proc disk*(this: Vdi): Vdi_Disk
proc headerSize*(this: Vdi_Header): int
proc blocksMapOffset*(this: Vdi_Header): uint32
proc subheaderSizeIsDynamic*(this: Vdi_Header): bool
proc blocksOffset*(this: Vdi_Header): uint32
proc blockSize*(this: Vdi_Header): int
proc blocksMapSize*(this: Vdi_Header): int
proc isAllocated*(this: Vdi_BlocksMap_BlockIndex): bool
proc block*(this: Vdi_BlocksMap_BlockIndex): Vdi_Disk_Block


##[
A native VirtualBox file format
Images for testing can be downloaded from
 * https://www.osboxes.org/virtualbox-images/
 * https://virtualboxes.org/images/
 * https://virtualboximages.com/
or you can convert images of other formats.

@see <a href="https://github.com/qemu/qemu/blob/master/block/vdi.c">Source</a>
]##
proc read*(_: typedesc[Vdi], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Vdi =
  template this: untyped = result
  this = new(Vdi)
  let root = if root == nil: cast[Vdi](this) else: cast[Vdi](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = Vdi_Header.read(this.io, this.root, this)
  this.header = headerExpr

proc blockDiscarded(this: Vdi): int = 
  if this.blockDiscardedInst != nil:
    return this.blockDiscardedInst
  let blockDiscardedInstExpr = int(4294967294'i64)
  this.blockDiscardedInst = blockDiscardedInstExpr
  if this.blockDiscardedInst != nil:
    return this.blockDiscardedInst

proc blockUnallocated(this: Vdi): int = 
  if this.blockUnallocatedInst != nil:
    return this.blockUnallocatedInst
  let blockUnallocatedInstExpr = int(4294967295'i64)
  this.blockUnallocatedInst = blockUnallocatedInstExpr
  if this.blockUnallocatedInst != nil:
    return this.blockUnallocatedInst

proc blocksMap(this: Vdi): Vdi_BlocksMap = 

  ##[
  block_index = offset_in_virtual_disk / block_size actual_data_offset = blocks_map[block_index]*block_size+metadata_size+offset_in_block
The blocks_map will take up blocks_in_image_max * sizeof(uint32_t) bytes; since the blocks_map is read and written in a single operation, its size needs to be limited to INT_MAX; furthermore, when opening an image, the blocks_map size is rounded up to be aligned on BDRV_SECTOR_SIZE. Therefore this should satisfy the following: blocks_in_image_max * sizeof(uint32_t) + BDRV_SECTOR_SIZE == INT_MAX + 1 (INT_MAX + 1 is the first value not representable as an int) This guarantees that any value below or equal to the constant will, when multiplied by sizeof(uint32_t) and rounded up to a BDRV_SECTOR_SIZE boundary, still be below or equal to INT_MAX.

  ]##
  if this.blocksMapInst != nil:
    return this.blocksMapInst
  let pos = this.io.pos()
  this.io.seek(int(this.header.blocksMapOffset))
  let rawBlocksMapInstExpr = this.io.readBytes(int(this.header.blocksMapSize))
  this.rawBlocksMapInst = rawBlocksMapInstExpr
  let rawBlocksMapInstIo = newKaitaiStream(rawBlocksMapInstExpr)
  let blocksMapInstExpr = Vdi_BlocksMap.read(rawBlocksMapInstIo, this.root, this)
  this.blocksMapInst = blocksMapInstExpr
  this.io.seek(pos)
  if this.blocksMapInst != nil:
    return this.blocksMapInst

proc disk(this: Vdi): Vdi_Disk = 
  if this.diskInst != nil:
    return this.diskInst
  let pos = this.io.pos()
  this.io.seek(int(this.header.blocksOffset))
  let diskInstExpr = Vdi_Disk.read(this.io, this.root, this)
  this.diskInst = diskInstExpr
  this.io.seek(pos)
  if this.diskInst != nil:
    return this.diskInst

proc fromFile*(_: typedesc[Vdi], filename: string): Vdi =
  Vdi.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Vdi_Header], io: KaitaiStream, root: KaitaiStruct, parent: Vdi): Vdi_Header =
  template this: untyped = result
  this = new(Vdi_Header)
  let root = if root == nil: cast[Vdi](this) else: cast[Vdi](root)
  this.io = io
  this.root = root
  this.parent = parent

  let textExpr = encode(this.io.readBytes(int(64)), "utf-8")
  this.text = textExpr
  let signatureExpr = this.io.readBytes(int(4))
  this.signature = signatureExpr
  let versionExpr = Vdi_Header_Version.read(this.io, this.root, this)
  this.version = versionExpr
  if this.subheaderSizeIsDynamic:
    let headerSizeOptionalExpr = this.io.readU4le()
    this.headerSizeOptional = headerSizeOptionalExpr
  let rawHeaderMainExpr = this.io.readBytes(int(this.headerSize))
  this.rawHeaderMain = rawHeaderMainExpr
  let rawHeaderMainIo = newKaitaiStream(rawHeaderMainExpr)
  let headerMainExpr = Vdi_Header_HeaderMain.read(rawHeaderMainIo, this.root, this)
  this.headerMain = headerMainExpr

proc headerSize(this: Vdi_Header): int = 
  if this.headerSizeInst != nil:
    return this.headerSizeInst
  let headerSizeInstExpr = int((if this.subheaderSizeIsDynamic: this.headerSizeOptional else: 336))
  this.headerSizeInst = headerSizeInstExpr
  if this.headerSizeInst != nil:
    return this.headerSizeInst

proc blocksMapOffset(this: Vdi_Header): uint32 = 
  if this.blocksMapOffsetInst != nil:
    return this.blocksMapOffsetInst
  let blocksMapOffsetInstExpr = uint32(this.headerMain.blocksMapOffset)
  this.blocksMapOffsetInst = blocksMapOffsetInstExpr
  if this.blocksMapOffsetInst != nil:
    return this.blocksMapOffsetInst

proc subheaderSizeIsDynamic(this: Vdi_Header): bool = 
  if this.subheaderSizeIsDynamicInst != nil:
    return this.subheaderSizeIsDynamicInst
  let subheaderSizeIsDynamicInstExpr = bool(this.version.major >= 1)
  this.subheaderSizeIsDynamicInst = subheaderSizeIsDynamicInstExpr
  if this.subheaderSizeIsDynamicInst != nil:
    return this.subheaderSizeIsDynamicInst

proc blocksOffset(this: Vdi_Header): uint32 = 
  if this.blocksOffsetInst != nil:
    return this.blocksOffsetInst
  let blocksOffsetInstExpr = uint32(this.headerMain.offsetData)
  this.blocksOffsetInst = blocksOffsetInstExpr
  if this.blocksOffsetInst != nil:
    return this.blocksOffsetInst

proc blockSize(this: Vdi_Header): int = 
  if this.blockSizeInst != nil:
    return this.blockSizeInst
  let blockSizeInstExpr = int((this.headerMain.blockMetadataSize + this.headerMain.blockDataSize))
  this.blockSizeInst = blockSizeInstExpr
  if this.blockSizeInst != nil:
    return this.blockSizeInst

proc blocksMapSize(this: Vdi_Header): int = 
  if this.blocksMapSizeInst != nil:
    return this.blocksMapSizeInst
  let blocksMapSizeInstExpr = int((((((this.headerMain.blocksInImage * 4) + this.headerMain.geometry.sectorSize) - 1) div this.headerMain.geometry.sectorSize) * this.headerMain.geometry.sectorSize))
  this.blocksMapSizeInst = blocksMapSizeInstExpr
  if this.blocksMapSizeInst != nil:
    return this.blocksMapSizeInst

proc fromFile*(_: typedesc[Vdi_Header], filename: string): Vdi_Header =
  Vdi_Header.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Vdi_Header_Uuid], io: KaitaiStream, root: KaitaiStruct, parent: Vdi_Header_HeaderMain): Vdi_Header_Uuid =
  template this: untyped = result
  this = new(Vdi_Header_Uuid)
  let root = if root == nil: cast[Vdi](this) else: cast[Vdi](root)
  this.io = io
  this.root = root
  this.parent = parent

  let uuidExpr = this.io.readBytes(int(16))
  this.uuid = uuidExpr

proc fromFile*(_: typedesc[Vdi_Header_Uuid], filename: string): Vdi_Header_Uuid =
  Vdi_Header_Uuid.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Vdi_Header_Version], io: KaitaiStream, root: KaitaiStruct, parent: Vdi_Header): Vdi_Header_Version =
  template this: untyped = result
  this = new(Vdi_Header_Version)
  let root = if root == nil: cast[Vdi](this) else: cast[Vdi](root)
  this.io = io
  this.root = root
  this.parent = parent

  let majorExpr = this.io.readU2le()
  this.major = majorExpr
  let minorExpr = this.io.readU2le()
  this.minor = minorExpr

proc fromFile*(_: typedesc[Vdi_Header_Version], filename: string): Vdi_Header_Version =
  Vdi_Header_Version.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Vdi_Header_HeaderMain], io: KaitaiStream, root: KaitaiStruct, parent: Vdi_Header): Vdi_Header_HeaderMain =
  template this: untyped = result
  this = new(Vdi_Header_HeaderMain)
  let root = if root == nil: cast[Vdi](this) else: cast[Vdi](root)
  this.io = io
  this.root = root
  this.parent = parent

  let imageTypeExpr = Vdi_ImageType(this.io.readU4le())
  this.imageType = imageTypeExpr
  let imageFlagsExpr = Vdi_Header_HeaderMain_Flags.read(this.io, this.root, this)
  this.imageFlags = imageFlagsExpr
  let descriptionExpr = encode(this.io.readBytes(int(256)), "utf-8")
  this.description = descriptionExpr
  if this.parent.version.major >= 1:
    let blocksMapOffsetExpr = this.io.readU4le()
    this.blocksMapOffset = blocksMapOffsetExpr
  if this.parent.version.major >= 1:
    let offsetDataExpr = this.io.readU4le()
    this.offsetData = offsetDataExpr
  let geometryExpr = Vdi_Header_HeaderMain_Geometry.read(this.io, this.root, this)
  this.geometry = geometryExpr
  if this.parent.version.major >= 1:
    let reserved1Expr = this.io.readU4le()
    this.reserved1 = reserved1Expr
  let diskSizeExpr = this.io.readU8le()
  this.diskSize = diskSizeExpr

  ##[
  Size of block (bytes).
  ]##
  let blockDataSizeExpr = this.io.readU4le()
  this.blockDataSize = blockDataSizeExpr
  if this.parent.version.major >= 1:
    let blockMetadataSizeExpr = this.io.readU4le()
    this.blockMetadataSize = blockMetadataSizeExpr
  let blocksInImageExpr = this.io.readU4le()
  this.blocksInImage = blocksInImageExpr
  let blocksAllocatedExpr = this.io.readU4le()
  this.blocksAllocated = blocksAllocatedExpr
  let uuidImageExpr = Vdi_Header_Uuid.read(this.io, this.root, this)
  this.uuidImage = uuidImageExpr
  let uuidLastSnapExpr = Vdi_Header_Uuid.read(this.io, this.root, this)
  this.uuidLastSnap = uuidLastSnapExpr
  let uuidLinkExpr = Vdi_Header_Uuid.read(this.io, this.root, this)
  this.uuidLink = uuidLinkExpr
  if this.parent.version.major >= 1:
    let uuidParentExpr = Vdi_Header_Uuid.read(this.io, this.root, this)
    this.uuidParent = uuidParentExpr
  if  ((this.parent.version.major >= 1) and ((this.io.pos + 16) <= this.io.size)) :
    let lchcGeometryExpr = Vdi_Header_HeaderMain_Geometry.read(this.io, this.root, this)
    this.lchcGeometry = lchcGeometryExpr

proc fromFile*(_: typedesc[Vdi_Header_HeaderMain], filename: string): Vdi_Header_HeaderMain =
  Vdi_Header_HeaderMain.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Vdi_Header_HeaderMain_Geometry], io: KaitaiStream, root: KaitaiStruct, parent: Vdi_Header_HeaderMain): Vdi_Header_HeaderMain_Geometry =
  template this: untyped = result
  this = new(Vdi_Header_HeaderMain_Geometry)
  let root = if root == nil: cast[Vdi](this) else: cast[Vdi](root)
  this.io = io
  this.root = root
  this.parent = parent

  let cylindersExpr = this.io.readU4le()
  this.cylinders = cylindersExpr
  let headsExpr = this.io.readU4le()
  this.heads = headsExpr
  let sectorsExpr = this.io.readU4le()
  this.sectors = sectorsExpr
  let sectorSizeExpr = this.io.readU4le()
  this.sectorSize = sectorSizeExpr

proc fromFile*(_: typedesc[Vdi_Header_HeaderMain_Geometry], filename: string): Vdi_Header_HeaderMain_Geometry =
  Vdi_Header_HeaderMain_Geometry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Vdi_Header_HeaderMain_Flags], io: KaitaiStream, root: KaitaiStruct, parent: Vdi_Header_HeaderMain): Vdi_Header_HeaderMain_Flags =
  template this: untyped = result
  this = new(Vdi_Header_HeaderMain_Flags)
  let root = if root == nil: cast[Vdi](this) else: cast[Vdi](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reserved0Expr = this.io.readBitsIntBe(15)
  this.reserved0 = reserved0Expr
  let zeroExpandExpr = this.io.readBitsIntBe(1) != 0
  this.zeroExpand = zeroExpandExpr
  let reserved1Expr = this.io.readBitsIntBe(6)
  this.reserved1 = reserved1Expr
  let diffExpr = this.io.readBitsIntBe(1) != 0
  this.diff = diffExpr
  let fixedExpr = this.io.readBitsIntBe(1) != 0
  this.fixed = fixedExpr
  let reserved2Expr = this.io.readBitsIntBe(8)
  this.reserved2 = reserved2Expr

proc fromFile*(_: typedesc[Vdi_Header_HeaderMain_Flags], filename: string): Vdi_Header_HeaderMain_Flags =
  Vdi_Header_HeaderMain_Flags.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Vdi_BlocksMap], io: KaitaiStream, root: KaitaiStruct, parent: Vdi): Vdi_BlocksMap =
  template this: untyped = result
  this = new(Vdi_BlocksMap)
  let root = if root == nil: cast[Vdi](this) else: cast[Vdi](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int(Vdi(this.root).header.headerMain.blocksInImage):
    let it = Vdi_BlocksMap_BlockIndex.read(this.io, this.root, this)
    this.index.add(it)

proc fromFile*(_: typedesc[Vdi_BlocksMap], filename: string): Vdi_BlocksMap =
  Vdi_BlocksMap.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Vdi_BlocksMap_BlockIndex], io: KaitaiStream, root: KaitaiStruct, parent: Vdi_BlocksMap): Vdi_BlocksMap_BlockIndex =
  template this: untyped = result
  this = new(Vdi_BlocksMap_BlockIndex)
  let root = if root == nil: cast[Vdi](this) else: cast[Vdi](root)
  this.io = io
  this.root = root
  this.parent = parent

  let indexExpr = this.io.readU4le()
  this.index = indexExpr

proc isAllocated(this: Vdi_BlocksMap_BlockIndex): bool = 
  if this.isAllocatedInst != nil:
    return this.isAllocatedInst
  let isAllocatedInstExpr = bool(this.index < Vdi(this.root).blockDiscarded)
  this.isAllocatedInst = isAllocatedInstExpr
  if this.isAllocatedInst != nil:
    return this.isAllocatedInst

proc block(this: Vdi_BlocksMap_BlockIndex): Vdi_Disk_Block = 
  if this.blockInst != nil:
    return this.blockInst
  if this.isAllocated:
    let blockInstExpr = Vdi_Disk_Block(Vdi(this.root).disk.blocks[this.index])
    this.blockInst = blockInstExpr
  if this.blockInst != nil:
    return this.blockInst

proc fromFile*(_: typedesc[Vdi_BlocksMap_BlockIndex], filename: string): Vdi_BlocksMap_BlockIndex =
  Vdi_BlocksMap_BlockIndex.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Vdi_Disk], io: KaitaiStream, root: KaitaiStruct, parent: Vdi): Vdi_Disk =
  template this: untyped = result
  this = new(Vdi_Disk)
  let root = if root == nil: cast[Vdi](this) else: cast[Vdi](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int(Vdi(this.root).header.headerMain.blocksInImage):
    let it = Vdi_Disk_Block.read(this.io, this.root, this)
    this.blocks.add(it)

proc fromFile*(_: typedesc[Vdi_Disk], filename: string): Vdi_Disk =
  Vdi_Disk.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Vdi_Disk_Block], io: KaitaiStream, root: KaitaiStruct, parent: Vdi_Disk): Vdi_Disk_Block =
  template this: untyped = result
  this = new(Vdi_Disk_Block)
  let root = if root == nil: cast[Vdi](this) else: cast[Vdi](root)
  this.io = io
  this.root = root
  this.parent = parent

  let metadataExpr = this.io.readBytes(int(Vdi(this.root).header.headerMain.blockMetadataSize))
  this.metadata = metadataExpr
  block:
    var i: int
    while not this.io.isEof:
      let buf = this.io.readBytes(int(Vdi(this.root).header.headerMain.blockDataSize))
      this.rawData.add(buf)
      let rawDataIo = newKaitaiStream(buf)
      let it = Vdi_Disk_Block_Sector.read(rawDataIo, this.root, this)
      this.data.add(it)
      inc i

proc fromFile*(_: typedesc[Vdi_Disk_Block], filename: string): Vdi_Disk_Block =
  Vdi_Disk_Block.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Vdi_Disk_Block_Sector], io: KaitaiStream, root: KaitaiStruct, parent: Vdi_Disk_Block): Vdi_Disk_Block_Sector =
  template this: untyped = result
  this = new(Vdi_Disk_Block_Sector)
  let root = if root == nil: cast[Vdi](this) else: cast[Vdi](root)
  this.io = io
  this.root = root
  this.parent = parent

  let dataExpr = this.io.readBytes(int(Vdi(this.root).header.headerMain.geometry.sectorSize))
  this.data = dataExpr

proc fromFile*(_: typedesc[Vdi_Disk_Block_Sector], filename: string): Vdi_Disk_Block_Sector =
  Vdi_Disk_Block_Sector.read(newKaitaiFileStream(filename), nil, nil)


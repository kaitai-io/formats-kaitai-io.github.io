import kaitai_struct_nim_runtime
import options

type
  AndroidSuper* = ref object of KaitaiStruct
    `parent`*: KaitaiStruct
    `rootInst`: AndroidSuper_Root
    `rootInstFlag`: bool
  AndroidSuper_Root* = ref object of KaitaiStruct
    `primaryGeometry`*: AndroidSuper_Geometry
    `backupGeometry`*: AndroidSuper_Geometry
    `primaryMetadata`*: seq[AndroidSuper_Metadata]
    `backupMetadata`*: seq[AndroidSuper_Metadata]
    `parent`*: AndroidSuper
    `rawPrimaryGeometry`*: seq[byte]
    `rawBackupGeometry`*: seq[byte]
    `rawPrimaryMetadata`*: seq[seq[byte]]
    `rawBackupMetadata`*: seq[seq[byte]]
  AndroidSuper_Geometry* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `structSize`*: uint32
    `checksum`*: seq[byte]
    `metadataMaxSize`*: uint32
    `metadataSlotCount`*: uint32
    `logicalBlockSize`*: uint32
    `parent`*: AndroidSuper_Root
  AndroidSuper_Metadata* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `majorVersion`*: uint16
    `minorVersion`*: uint16
    `headerSize`*: uint32
    `headerChecksum`*: seq[byte]
    `tablesSize`*: uint32
    `tablesChecksum`*: seq[byte]
    `partitions`*: AndroidSuper_Metadata_TableDescriptor
    `extents`*: AndroidSuper_Metadata_TableDescriptor
    `groups`*: AndroidSuper_Metadata_TableDescriptor
    `blockDevices`*: AndroidSuper_Metadata_TableDescriptor
    `parent`*: AndroidSuper_Root
  AndroidSuper_Metadata_TableKind* = enum
    partitions = 0
    extents = 1
    groups = 2
    block_devices = 3
  AndroidSuper_Metadata_BlockDevice* = ref object of KaitaiStruct
    `firstLogicalSector`*: uint64
    `alignment`*: uint32
    `alignmentOffset`*: uint32
    `size`*: uint64
    `partitionName`*: string
    `flagSlotSuffixed`*: bool
    `flagsReserved`*: uint64
    `parent`*: AndroidSuper_Metadata_TableDescriptor
  AndroidSuper_Metadata_Extent* = ref object of KaitaiStruct
    `numSectors`*: uint64
    `targetType`*: AndroidSuper_Metadata_Extent_TargetType
    `targetData`*: uint64
    `targetSource`*: uint32
    `parent`*: AndroidSuper_Metadata_TableDescriptor
  AndroidSuper_Metadata_Extent_TargetType* = enum
    linear = 0
    zero = 1
  AndroidSuper_Metadata_TableDescriptor* = ref object of KaitaiStruct
    `offset`*: uint32
    `numEntries`*: uint32
    `entrySize`*: uint32
    `kind`*: AndroidSuper_Metadata_TableKind
    `parent`*: AndroidSuper_Metadata
    `rawTableInst`*: seq[seq[byte]]
    `tableInst`: seq[KaitaiStruct]
    `tableInstFlag`: bool
  AndroidSuper_Metadata_Partition* = ref object of KaitaiStruct
    `name`*: string
    `attrReadonly`*: bool
    `attrSlotSuffixed`*: bool
    `attrUpdated`*: bool
    `attrDisabled`*: bool
    `attrsReserved`*: uint64
    `firstExtentIndex`*: uint32
    `numExtents`*: uint32
    `groupIndex`*: uint32
    `parent`*: AndroidSuper_Metadata_TableDescriptor
  AndroidSuper_Metadata_Group* = ref object of KaitaiStruct
    `name`*: string
    `flagSlotSuffixed`*: bool
    `flagsReserved`*: uint64
    `maximumSize`*: uint64
    `parent`*: AndroidSuper_Metadata_TableDescriptor

proc read*(_: typedesc[AndroidSuper], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AndroidSuper
proc read*(_: typedesc[AndroidSuper_Root], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSuper): AndroidSuper_Root
proc read*(_: typedesc[AndroidSuper_Geometry], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSuper_Root): AndroidSuper_Geometry
proc read*(_: typedesc[AndroidSuper_Metadata], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSuper_Root): AndroidSuper_Metadata
proc read*(_: typedesc[AndroidSuper_Metadata_BlockDevice], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSuper_Metadata_TableDescriptor): AndroidSuper_Metadata_BlockDevice
proc read*(_: typedesc[AndroidSuper_Metadata_Extent], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSuper_Metadata_TableDescriptor): AndroidSuper_Metadata_Extent
proc read*(_: typedesc[AndroidSuper_Metadata_TableDescriptor], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSuper_Metadata, kind: any): AndroidSuper_Metadata_TableDescriptor
proc read*(_: typedesc[AndroidSuper_Metadata_Partition], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSuper_Metadata_TableDescriptor): AndroidSuper_Metadata_Partition
proc read*(_: typedesc[AndroidSuper_Metadata_Group], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSuper_Metadata_TableDescriptor): AndroidSuper_Metadata_Group

proc root*(this: AndroidSuper): AndroidSuper_Root
proc table*(this: AndroidSuper_Metadata_TableDescriptor): seq[KaitaiStruct]


##[
The metadata stored by Android at the beginning of a "super" partition, which
is what it calls a disk partition that holds one or more Dynamic Partitions.
Dynamic Partitions do more or less the same thing that LVM does on Linux,
allowing Android to map ranges of non-contiguous extents to a single logical
device. This metadata holds that mapping.

@see <a href="https://source.android.com/devices/tech/ota/dynamic_partitions">Source</a>
@see <a href="https://android.googlesource.com/platform/system/core/+/refs/tags/android-11.0.0_r8/fs_mgr/liblp/include/liblp/metadata_format.h">Source</a>
]##
proc read*(_: typedesc[AndroidSuper], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AndroidSuper =
  template this: untyped = result
  this = new(AndroidSuper)
  let root = if root == nil: cast[AndroidSuper](this) else: cast[AndroidSuper](root)
  this.io = io
  this.root = root
  this.parent = parent


proc root(this: AndroidSuper): AndroidSuper_Root = 
  if this.rootInstFlag:
    return this.rootInst
  let pos = this.io.pos()
  this.io.seek(int(4096))
  let rootInstExpr = AndroidSuper_Root.read(this.io, this.root, this)
  this.rootInst = rootInstExpr
  this.io.seek(pos)
  this.rootInstFlag = true
  return this.rootInst

proc fromFile*(_: typedesc[AndroidSuper], filename: string): AndroidSuper =
  AndroidSuper.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidSuper_Root], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSuper): AndroidSuper_Root =
  template this: untyped = result
  this = new(AndroidSuper_Root)
  let root = if root == nil: cast[AndroidSuper](this) else: cast[AndroidSuper](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rawPrimaryGeometryExpr = this.io.readBytes(int(4096))
  this.rawPrimaryGeometry = rawPrimaryGeometryExpr
  let rawPrimaryGeometryIo = newKaitaiStream(rawPrimaryGeometryExpr)
  let primaryGeometryExpr = AndroidSuper_Geometry.read(rawPrimaryGeometryIo, this.root, this)
  this.primaryGeometry = primaryGeometryExpr
  let rawBackupGeometryExpr = this.io.readBytes(int(4096))
  this.rawBackupGeometry = rawBackupGeometryExpr
  let rawBackupGeometryIo = newKaitaiStream(rawBackupGeometryExpr)
  let backupGeometryExpr = AndroidSuper_Geometry.read(rawBackupGeometryIo, this.root, this)
  this.backupGeometry = backupGeometryExpr
  for i in 0 ..< int(this.primaryGeometry.metadataSlotCount):
    let buf = this.io.readBytes(int(this.primaryGeometry.metadataMaxSize))
    this.rawPrimaryMetadata.add(buf)
    let rawPrimaryMetadataIo = newKaitaiStream(buf)
    let it = AndroidSuper_Metadata.read(rawPrimaryMetadataIo, this.root, this)
    this.primaryMetadata.add(it)
  for i in 0 ..< int(this.primaryGeometry.metadataSlotCount):
    let buf = this.io.readBytes(int(this.primaryGeometry.metadataMaxSize))
    this.rawBackupMetadata.add(buf)
    let rawBackupMetadataIo = newKaitaiStream(buf)
    let it = AndroidSuper_Metadata.read(rawBackupMetadataIo, this.root, this)
    this.backupMetadata.add(it)

proc fromFile*(_: typedesc[AndroidSuper_Root], filename: string): AndroidSuper_Root =
  AndroidSuper_Root.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidSuper_Geometry], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSuper_Root): AndroidSuper_Geometry =
  template this: untyped = result
  this = new(AndroidSuper_Geometry)
  let root = if root == nil: cast[AndroidSuper](this) else: cast[AndroidSuper](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let structSizeExpr = this.io.readU4le()
  this.structSize = structSizeExpr

  ##[
  SHA-256 hash of struct_size bytes from beginning of geometry,
calculated as if checksum were zeroed out

  ]##
  let checksumExpr = this.io.readBytes(int(32))
  this.checksum = checksumExpr
  let metadataMaxSizeExpr = this.io.readU4le()
  this.metadataMaxSize = metadataMaxSizeExpr
  let metadataSlotCountExpr = this.io.readU4le()
  this.metadataSlotCount = metadataSlotCountExpr
  let logicalBlockSizeExpr = this.io.readU4le()
  this.logicalBlockSize = logicalBlockSizeExpr

proc fromFile*(_: typedesc[AndroidSuper_Geometry], filename: string): AndroidSuper_Geometry =
  AndroidSuper_Geometry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidSuper_Metadata], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSuper_Root): AndroidSuper_Metadata =
  template this: untyped = result
  this = new(AndroidSuper_Metadata)
  let root = if root == nil: cast[AndroidSuper](this) else: cast[AndroidSuper](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let majorVersionExpr = this.io.readU2le()
  this.majorVersion = majorVersionExpr
  let minorVersionExpr = this.io.readU2le()
  this.minorVersion = minorVersionExpr
  let headerSizeExpr = this.io.readU4le()
  this.headerSize = headerSizeExpr

  ##[
  SHA-256 hash of header_size bytes from beginning of metadata,
calculated as if header_checksum were zeroed out

  ]##
  let headerChecksumExpr = this.io.readBytes(int(32))
  this.headerChecksum = headerChecksumExpr
  let tablesSizeExpr = this.io.readU4le()
  this.tablesSize = tablesSizeExpr

  ##[
  SHA-256 hash of tables_size bytes from end of header
  ]##
  let tablesChecksumExpr = this.io.readBytes(int(32))
  this.tablesChecksum = tablesChecksumExpr
  let partitionsExpr = AndroidSuper_Metadata_TableDescriptor.read(this.io, this.root, this, android_super.partitions)
  this.partitions = partitionsExpr
  let extentsExpr = AndroidSuper_Metadata_TableDescriptor.read(this.io, this.root, this, android_super.extents)
  this.extents = extentsExpr
  let groupsExpr = AndroidSuper_Metadata_TableDescriptor.read(this.io, this.root, this, android_super.groups)
  this.groups = groupsExpr
  let blockDevicesExpr = AndroidSuper_Metadata_TableDescriptor.read(this.io, this.root, this, android_super.block_devices)
  this.blockDevices = blockDevicesExpr

proc fromFile*(_: typedesc[AndroidSuper_Metadata], filename: string): AndroidSuper_Metadata =
  AndroidSuper_Metadata.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidSuper_Metadata_BlockDevice], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSuper_Metadata_TableDescriptor): AndroidSuper_Metadata_BlockDevice =
  template this: untyped = result
  this = new(AndroidSuper_Metadata_BlockDevice)
  let root = if root == nil: cast[AndroidSuper](this) else: cast[AndroidSuper](root)
  this.io = io
  this.root = root
  this.parent = parent

  let firstLogicalSectorExpr = this.io.readU8le()
  this.firstLogicalSector = firstLogicalSectorExpr
  let alignmentExpr = this.io.readU4le()
  this.alignment = alignmentExpr
  let alignmentOffsetExpr = this.io.readU4le()
  this.alignmentOffset = alignmentOffsetExpr
  let sizeExpr = this.io.readU8le()
  this.size = sizeExpr
  let partitionNameExpr = encode(this.io.readBytes(int(36)).bytesTerminate(0, false), "UTF-8")
  this.partitionName = partitionNameExpr
  let flagSlotSuffixedExpr = this.io.readBitsIntLe(1) != 0
  this.flagSlotSuffixed = flagSlotSuffixedExpr
  let flagsReservedExpr = this.io.readBitsIntLe(31)
  this.flagsReserved = flagsReservedExpr

proc fromFile*(_: typedesc[AndroidSuper_Metadata_BlockDevice], filename: string): AndroidSuper_Metadata_BlockDevice =
  AndroidSuper_Metadata_BlockDevice.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidSuper_Metadata_Extent], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSuper_Metadata_TableDescriptor): AndroidSuper_Metadata_Extent =
  template this: untyped = result
  this = new(AndroidSuper_Metadata_Extent)
  let root = if root == nil: cast[AndroidSuper](this) else: cast[AndroidSuper](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numSectorsExpr = this.io.readU8le()
  this.numSectors = numSectorsExpr
  let targetTypeExpr = AndroidSuper_Metadata_Extent_TargetType(this.io.readU4le())
  this.targetType = targetTypeExpr
  let targetDataExpr = this.io.readU8le()
  this.targetData = targetDataExpr
  let targetSourceExpr = this.io.readU4le()
  this.targetSource = targetSourceExpr

proc fromFile*(_: typedesc[AndroidSuper_Metadata_Extent], filename: string): AndroidSuper_Metadata_Extent =
  AndroidSuper_Metadata_Extent.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidSuper_Metadata_TableDescriptor], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSuper_Metadata, kind: any): AndroidSuper_Metadata_TableDescriptor =
  template this: untyped = result
  this = new(AndroidSuper_Metadata_TableDescriptor)
  let root = if root == nil: cast[AndroidSuper](this) else: cast[AndroidSuper](root)
  this.io = io
  this.root = root
  this.parent = parent
  let kindExpr = AndroidSuper_Metadata_TableKind(kind)
  this.kind = kindExpr

  let offsetExpr = this.io.readU4le()
  this.offset = offsetExpr
  let numEntriesExpr = this.io.readU4le()
  this.numEntries = numEntriesExpr
  let entrySizeExpr = this.io.readU4le()
  this.entrySize = entrySizeExpr

proc table(this: AndroidSuper_Metadata_TableDescriptor): seq[KaitaiStruct] = 
  if this.tableInstFlag:
    return this.tableInst
  let pos = this.io.pos()
  this.io.seek(int((this.parent.headerSize + this.offset)))
  for i in 0 ..< int(this.numEntries):
    block:
      let on = this.kind
      if on == android_super.partitions:
        let buf = this.io.readBytes(int(this.entrySize))
        this.rawTableInst.add(buf)
        let rawTableInstIo = newKaitaiStream(buf)
        let it = AndroidSuper_Metadata_Partition.read(rawTableInstIo, this.root, this)
        this.tableInst.add(it)
      elif on == android_super.extents:
        let buf = this.io.readBytes(int(this.entrySize))
        this.rawTableInst.add(buf)
        let rawTableInstIo = newKaitaiStream(buf)
        let it = AndroidSuper_Metadata_Extent.read(rawTableInstIo, this.root, this)
        this.tableInst.add(it)
      elif on == android_super.groups:
        let buf = this.io.readBytes(int(this.entrySize))
        this.rawTableInst.add(buf)
        let rawTableInstIo = newKaitaiStream(buf)
        let it = AndroidSuper_Metadata_Group.read(rawTableInstIo, this.root, this)
        this.tableInst.add(it)
      elif on == android_super.block_devices:
        let buf = this.io.readBytes(int(this.entrySize))
        this.rawTableInst.add(buf)
        let rawTableInstIo = newKaitaiStream(buf)
        let it = AndroidSuper_Metadata_BlockDevice.read(rawTableInstIo, this.root, this)
        this.tableInst.add(it)
      else:
        let it = this.io.readBytes(int(this.entrySize))
        this.tableInst.add(it)
  this.io.seek(pos)
  this.tableInstFlag = true
  return this.tableInst

proc fromFile*(_: typedesc[AndroidSuper_Metadata_TableDescriptor], filename: string): AndroidSuper_Metadata_TableDescriptor =
  AndroidSuper_Metadata_TableDescriptor.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidSuper_Metadata_Partition], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSuper_Metadata_TableDescriptor): AndroidSuper_Metadata_Partition =
  template this: untyped = result
  this = new(AndroidSuper_Metadata_Partition)
  let root = if root == nil: cast[AndroidSuper](this) else: cast[AndroidSuper](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameExpr = encode(this.io.readBytes(int(36)).bytesTerminate(0, false), "UTF-8")
  this.name = nameExpr
  let attrReadonlyExpr = this.io.readBitsIntLe(1) != 0
  this.attrReadonly = attrReadonlyExpr
  let attrSlotSuffixedExpr = this.io.readBitsIntLe(1) != 0
  this.attrSlotSuffixed = attrSlotSuffixedExpr
  let attrUpdatedExpr = this.io.readBitsIntLe(1) != 0
  this.attrUpdated = attrUpdatedExpr
  let attrDisabledExpr = this.io.readBitsIntLe(1) != 0
  this.attrDisabled = attrDisabledExpr
  let attrsReservedExpr = this.io.readBitsIntLe(28)
  this.attrsReserved = attrsReservedExpr
  alignToByte(this.io)
  let firstExtentIndexExpr = this.io.readU4le()
  this.firstExtentIndex = firstExtentIndexExpr
  let numExtentsExpr = this.io.readU4le()
  this.numExtents = numExtentsExpr
  let groupIndexExpr = this.io.readU4le()
  this.groupIndex = groupIndexExpr

proc fromFile*(_: typedesc[AndroidSuper_Metadata_Partition], filename: string): AndroidSuper_Metadata_Partition =
  AndroidSuper_Metadata_Partition.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidSuper_Metadata_Group], io: KaitaiStream, root: KaitaiStruct, parent: AndroidSuper_Metadata_TableDescriptor): AndroidSuper_Metadata_Group =
  template this: untyped = result
  this = new(AndroidSuper_Metadata_Group)
  let root = if root == nil: cast[AndroidSuper](this) else: cast[AndroidSuper](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameExpr = encode(this.io.readBytes(int(36)).bytesTerminate(0, false), "UTF-8")
  this.name = nameExpr
  let flagSlotSuffixedExpr = this.io.readBitsIntLe(1) != 0
  this.flagSlotSuffixed = flagSlotSuffixedExpr
  let flagsReservedExpr = this.io.readBitsIntLe(31)
  this.flagsReserved = flagsReservedExpr
  alignToByte(this.io)
  let maximumSizeExpr = this.io.readU8le()
  this.maximumSize = maximumSizeExpr

proc fromFile*(_: typedesc[AndroidSuper_Metadata_Group], filename: string): AndroidSuper_Metadata_Group =
  AndroidSuper_Metadata_Group.read(newKaitaiFileStream(filename), nil, nil)


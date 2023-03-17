import kaitai_struct_nim_runtime
import options

type
  Lvm2* = ref object of KaitaiStruct
    `pv`*: Lvm2_PhysicalVolume
    `parent`*: KaitaiStruct
    `sectorSizeInst`: int
    `sectorSizeInstFlag`: bool
  Lvm2_PhysicalVolume* = ref object of KaitaiStruct
    `emptySector`*: seq[byte]
    `label`*: Lvm2_PhysicalVolume_Label
    `parent`*: Lvm2
  Lvm2_PhysicalVolume_Label* = ref object of KaitaiStruct
    `labelHeader`*: Lvm2_PhysicalVolume_Label_LabelHeader
    `volumeHeader`*: Lvm2_PhysicalVolume_Label_VolumeHeader
    `parent`*: Lvm2_PhysicalVolume
  Lvm2_PhysicalVolume_Label_LabelHeader* = ref object of KaitaiStruct
    `signature`*: seq[byte]
    `sectorNumber`*: uint64
    `checksum`*: uint32
    `labelHeader`*: Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader
    `parent`*: Lvm2_PhysicalVolume_Label
  Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader* = ref object of KaitaiStruct
    `dataOffset`*: uint32
    `typeIndicator`*: seq[byte]
    `parent`*: Lvm2_PhysicalVolume_Label_LabelHeader
  Lvm2_PhysicalVolume_Label_VolumeHeader* = ref object of KaitaiStruct
    `id`*: string
    `size`*: uint64
    `dataAreaDescriptors`*: seq[Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor]
    `metadataAreaDescriptors`*: seq[Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor]
    `parent`*: Lvm2_PhysicalVolume_Label
  Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor* = ref object of KaitaiStruct
    `offset`*: uint64
    `size`*: uint64
    `parent`*: Lvm2_PhysicalVolume_Label_VolumeHeader
    `dataInst`: string
    `dataInstFlag`: bool
  Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor* = ref object of KaitaiStruct
    `offset`*: uint64
    `size`*: uint64
    `parent`*: Lvm2_PhysicalVolume_Label_VolumeHeader
    `rawDataInst`*: seq[byte]
    `dataInst`: Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea
    `dataInstFlag`: bool
  Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea* = ref object of KaitaiStruct
    `header`*: Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader
    `parent`*: Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor
  Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader* = ref object of KaitaiStruct
    `checksum`*: Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader
    `signature`*: seq[byte]
    `version`*: uint32
    `metadataAreaOffset`*: uint64
    `metadataAreaSize`*: uint64
    `rawLocationDescriptors`*: seq[Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor]
    `parent`*: KaitaiStruct
    `metadataInst`: seq[byte]
    `metadataInstFlag`: bool
  Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor* = ref object of KaitaiStruct
    `offset`*: uint64
    `size`*: uint64
    `checksum`*: uint32
    `flags`*: Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor_RawLocationDescriptorFlags
    `parent`*: Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader
  Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor_RawLocationDescriptorFlags* = enum
    raw_location_ignored = 1

proc read*(_: typedesc[Lvm2], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Lvm2
proc read*(_: typedesc[Lvm2_PhysicalVolume], io: KaitaiStream, root: KaitaiStruct, parent: Lvm2): Lvm2_PhysicalVolume
proc read*(_: typedesc[Lvm2_PhysicalVolume_Label], io: KaitaiStream, root: KaitaiStruct, parent: Lvm2_PhysicalVolume): Lvm2_PhysicalVolume_Label
proc read*(_: typedesc[Lvm2_PhysicalVolume_Label_LabelHeader], io: KaitaiStream, root: KaitaiStruct, parent: Lvm2_PhysicalVolume_Label): Lvm2_PhysicalVolume_Label_LabelHeader
proc read*(_: typedesc[Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader], io: KaitaiStream, root: KaitaiStruct, parent: Lvm2_PhysicalVolume_Label_LabelHeader): Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader
proc read*(_: typedesc[Lvm2_PhysicalVolume_Label_VolumeHeader], io: KaitaiStream, root: KaitaiStruct, parent: Lvm2_PhysicalVolume_Label): Lvm2_PhysicalVolume_Label_VolumeHeader
proc read*(_: typedesc[Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor], io: KaitaiStream, root: KaitaiStruct, parent: Lvm2_PhysicalVolume_Label_VolumeHeader): Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor
proc read*(_: typedesc[Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor], io: KaitaiStream, root: KaitaiStruct, parent: Lvm2_PhysicalVolume_Label_VolumeHeader): Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor
proc read*(_: typedesc[Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea], io: KaitaiStream, root: KaitaiStruct, parent: Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor): Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea
proc read*(_: typedesc[Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader
proc read*(_: typedesc[Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor], io: KaitaiStream, root: KaitaiStruct, parent: Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader): Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor

proc sectorSize*(this: Lvm2): int
proc data*(this: Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor): string
proc data*(this: Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor): Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea
proc metadata*(this: Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader): seq[byte]


##[
### Building a test file

```
dd if=/dev/zero of=image.img bs=512 count=$(( 4 * 1024 * 2 ))
sudo losetup /dev/loop1 image.img
sudo pvcreate /dev/loop1
sudo vgcreate vg_test /dev/loop1
sudo lvcreate --name lv_test1 vg_test
sudo losetup -d /dev/loop1
```

@see <a href="https://github.com/libyal/libvslvm/blob/main/documentation/Logical%20Volume%20Manager%20(LVM)%20format.asciidoc">Source</a>
]##
proc read*(_: typedesc[Lvm2], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Lvm2 =
  template this: untyped = result
  this = new(Lvm2)
  let root = if root == nil: cast[Lvm2](this) else: cast[Lvm2](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Physical volume
  ]##
  let pvExpr = Lvm2_PhysicalVolume.read(this.io, this.root, this)
  this.pv = pvExpr

proc sectorSize(this: Lvm2): int = 
  if this.sectorSizeInstFlag:
    return this.sectorSizeInst
  let sectorSizeInstExpr = int(512)
  this.sectorSizeInst = sectorSizeInstExpr
  this.sectorSizeInstFlag = true
  return this.sectorSizeInst

proc fromFile*(_: typedesc[Lvm2], filename: string): Lvm2 =
  Lvm2.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Lvm2_PhysicalVolume], io: KaitaiStream, root: KaitaiStruct, parent: Lvm2): Lvm2_PhysicalVolume =
  template this: untyped = result
  this = new(Lvm2_PhysicalVolume)
  let root = if root == nil: cast[Lvm2](this) else: cast[Lvm2](root)
  this.io = io
  this.root = root
  this.parent = parent

  let emptySectorExpr = this.io.readBytes(int(Lvm2(this.root).sectorSize))
  this.emptySector = emptySectorExpr
  let labelExpr = Lvm2_PhysicalVolume_Label.read(this.io, this.root, this)
  this.label = labelExpr

proc fromFile*(_: typedesc[Lvm2_PhysicalVolume], filename: string): Lvm2_PhysicalVolume =
  Lvm2_PhysicalVolume.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Lvm2_PhysicalVolume_Label], io: KaitaiStream, root: KaitaiStruct, parent: Lvm2_PhysicalVolume): Lvm2_PhysicalVolume_Label =
  template this: untyped = result
  this = new(Lvm2_PhysicalVolume_Label)
  let root = if root == nil: cast[Lvm2](this) else: cast[Lvm2](root)
  this.io = io
  this.root = root
  this.parent = parent

  let labelHeaderExpr = Lvm2_PhysicalVolume_Label_LabelHeader.read(this.io, this.root, this)
  this.labelHeader = labelHeaderExpr
  let volumeHeaderExpr = Lvm2_PhysicalVolume_Label_VolumeHeader.read(this.io, this.root, this)
  this.volumeHeader = volumeHeaderExpr

proc fromFile*(_: typedesc[Lvm2_PhysicalVolume_Label], filename: string): Lvm2_PhysicalVolume_Label =
  Lvm2_PhysicalVolume_Label.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Lvm2_PhysicalVolume_Label_LabelHeader], io: KaitaiStream, root: KaitaiStruct, parent: Lvm2_PhysicalVolume_Label): Lvm2_PhysicalVolume_Label_LabelHeader =
  template this: untyped = result
  this = new(Lvm2_PhysicalVolume_Label_LabelHeader)
  let root = if root == nil: cast[Lvm2](this) else: cast[Lvm2](root)
  this.io = io
  this.root = root
  this.parent = parent

  let signatureExpr = this.io.readBytes(int(8))
  this.signature = signatureExpr

  ##[
  The sector number of the physical volume label header
  ]##
  let sectorNumberExpr = this.io.readU8le()
  this.sectorNumber = sectorNumberExpr

  ##[
  CRC-32 for offset 20 to end of the physical volume label sector
  ]##
  let checksumExpr = this.io.readU4le()
  this.checksum = checksumExpr
  let labelHeaderExpr = Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader.read(this.io, this.root, this)
  this.labelHeader = labelHeaderExpr

proc fromFile*(_: typedesc[Lvm2_PhysicalVolume_Label_LabelHeader], filename: string): Lvm2_PhysicalVolume_Label_LabelHeader =
  Lvm2_PhysicalVolume_Label_LabelHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader], io: KaitaiStream, root: KaitaiStruct, parent: Lvm2_PhysicalVolume_Label_LabelHeader): Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader =
  template this: untyped = result
  this = new(Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader)
  let root = if root == nil: cast[Lvm2](this) else: cast[Lvm2](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The offset, in bytes, relative from the start of the physical volume label header where data is stored
  ]##
  let dataOffsetExpr = this.io.readU4le()
  this.dataOffset = dataOffsetExpr
  let typeIndicatorExpr = this.io.readBytes(int(8))
  this.typeIndicator = typeIndicatorExpr

proc fromFile*(_: typedesc[Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader], filename: string): Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader =
  Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Lvm2_PhysicalVolume_Label_VolumeHeader], io: KaitaiStream, root: KaitaiStruct, parent: Lvm2_PhysicalVolume_Label): Lvm2_PhysicalVolume_Label_VolumeHeader =
  template this: untyped = result
  this = new(Lvm2_PhysicalVolume_Label_VolumeHeader)
  let root = if root == nil: cast[Lvm2](this) else: cast[Lvm2](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Contains a UUID stored as an ASCII string. The physical volume identifier can be used to uniquely identify a physical volume. The physical volume identifier is stored as: 9LBcEB7PQTGIlLI0KxrtzrynjuSL983W but is equivalent to its formatted variant: 9LBcEB-7PQT-GIlL-I0Kx-rtzr-ynju-SL983W, which is used in the metadata.

  ]##
  let idExpr = encode(this.io.readBytes(int(32)), "ascii")
  this.id = idExpr

  ##[
  Physical Volume size. Value in bytes
  ]##
  let sizeExpr = this.io.readU8le()
  this.size = sizeExpr

  ##[
  The last descriptor in the list is terminator and consists of 0-byte values.
  ]##
  block:
    var i: int
    while true:
      let it = Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor.read(this.io, this.root, this)
      this.dataAreaDescriptors.add(it)
      if  ((it.size != 0) and (it.offset != 0)) :
        break
      inc i
  block:
    var i: int
    while true:
      let it = Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor.read(this.io, this.root, this)
      this.metadataAreaDescriptors.add(it)
      if  ((it.size != 0) and (it.offset != 0)) :
        break
      inc i

proc fromFile*(_: typedesc[Lvm2_PhysicalVolume_Label_VolumeHeader], filename: string): Lvm2_PhysicalVolume_Label_VolumeHeader =
  Lvm2_PhysicalVolume_Label_VolumeHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor], io: KaitaiStream, root: KaitaiStruct, parent: Lvm2_PhysicalVolume_Label_VolumeHeader): Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor =
  template this: untyped = result
  this = new(Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor)
  let root = if root == nil: cast[Lvm2](this) else: cast[Lvm2](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The offset, in bytes, relative from the start of the physical volume
  ]##
  let offsetExpr = this.io.readU8le()
  this.offset = offsetExpr

  ##[
  Value in bytes. Can be 0. [yellow-background]*Does this represent all remaining available space?*

  ]##
  let sizeExpr = this.io.readU8le()
  this.size = sizeExpr

proc data(this: Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor): string = 
  if this.dataInstFlag:
    return this.dataInst
  if this.size != 0:
    let pos = this.io.pos()
    this.io.seek(int(this.offset))
    let dataInstExpr = encode(this.io.readBytes(int(this.size)), "ascii")
    this.dataInst = dataInstExpr
    this.io.seek(pos)
  this.dataInstFlag = true
  return this.dataInst

proc fromFile*(_: typedesc[Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor], filename: string): Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor =
  Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor], io: KaitaiStream, root: KaitaiStruct, parent: Lvm2_PhysicalVolume_Label_VolumeHeader): Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor =
  template this: untyped = result
  this = new(Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor)
  let root = if root == nil: cast[Lvm2](this) else: cast[Lvm2](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The offset, in bytes, relative from the start of the physical volume
  ]##
  let offsetExpr = this.io.readU8le()
  this.offset = offsetExpr

  ##[
  Value in bytes
  ]##
  let sizeExpr = this.io.readU8le()
  this.size = sizeExpr

proc data(this: Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor): Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea = 
  if this.dataInstFlag:
    return this.dataInst
  if this.size != 0:
    let pos = this.io.pos()
    this.io.seek(int(this.offset))
    let rawDataInstExpr = this.io.readBytes(int(this.size))
    this.rawDataInst = rawDataInstExpr
    let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
    let dataInstExpr = Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea.read(rawDataInstIo, this.root, this)
    this.dataInst = dataInstExpr
    this.io.seek(pos)
  this.dataInstFlag = true
  return this.dataInst

proc fromFile*(_: typedesc[Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor], filename: string): Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor =
  Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor.read(newKaitaiFileStream(filename), nil, nil)


##[
According to `[REDHAT]` the metadata area is a circular buffer. New metadata is appended to the old metadata and then the pointer to the start of it is updated. The metadata area, therefore, can contain copies of older versions of the metadata.
]##
proc read*(_: typedesc[Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea], io: KaitaiStream, root: KaitaiStruct, parent: Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor): Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea =
  template this: untyped = result
  this = new(Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea)
  let root = if root == nil: cast[Lvm2](this) else: cast[Lvm2](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader.read(this.io, this.root, this)
  this.header = headerExpr

proc fromFile*(_: typedesc[Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea], filename: string): Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea =
  Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader =
  template this: untyped = result
  this = new(Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader)
  let root = if root == nil: cast[Lvm2](this) else: cast[Lvm2](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  CRC-32 for offset 4 to end of the metadata area header
  ]##
  let checksumExpr = Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader.read(this.io, this.root, this)
  this.checksum = checksumExpr
  let signatureExpr = this.io.readBytes(int(16))
  this.signature = signatureExpr
  let versionExpr = this.io.readU4le()
  this.version = versionExpr

  ##[
  The offset, in bytes, of the metadata area relative from the start of the physical volume
  ]##
  let metadataAreaOffsetExpr = this.io.readU8le()
  this.metadataAreaOffset = metadataAreaOffsetExpr
  let metadataAreaSizeExpr = this.io.readU8le()
  this.metadataAreaSize = metadataAreaSizeExpr

  ##[
  The last descriptor in the list is terminator and consists of 0-byte values.
  ]##
  block:
    var i: int
    while true:
      let it = Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor.read(this.io, this.root, this)
      this.rawLocationDescriptors.add(it)
      if  ((it.offset != 0) and (it.size != 0) and (it.checksum != 0)) :
        break
      inc i

proc metadata(this: Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader): seq[byte] = 
  if this.metadataInstFlag:
    return this.metadataInst
  let pos = this.io.pos()
  this.io.seek(int(this.metadataAreaOffset))
  let metadataInstExpr = this.io.readBytes(int(this.metadataAreaSize))
  this.metadataInst = metadataInstExpr
  this.io.seek(pos)
  this.metadataInstFlag = true
  return this.metadataInst

proc fromFile*(_: typedesc[Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader], filename: string): Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader =
  Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader.read(newKaitaiFileStream(filename), nil, nil)


##[
The data area size can be 0. It is assumed it represents the remaining  available data.
]##
proc read*(_: typedesc[Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor], io: KaitaiStream, root: KaitaiStruct, parent: Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader): Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor =
  template this: untyped = result
  this = new(Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor)
  let root = if root == nil: cast[Lvm2](this) else: cast[Lvm2](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The data area offset, in bytes, relative from the start of the metadata area
  ]##
  let offsetExpr = this.io.readU8le()
  this.offset = offsetExpr

  ##[
  data area size in bytes
  ]##
  let sizeExpr = this.io.readU8le()
  this.size = sizeExpr

  ##[
  CRC-32 of *TODO (metadata?)*
  ]##
  let checksumExpr = this.io.readU4le()
  this.checksum = checksumExpr
  let flagsExpr = Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor_RawLocationDescriptorFlags(this.io.readU4le())
  this.flags = flagsExpr

proc fromFile*(_: typedesc[Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor], filename: string): Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor =
  Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor.read(newKaitaiFileStream(filename), nil, nil)


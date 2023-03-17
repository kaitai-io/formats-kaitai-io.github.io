import kaitai_struct_nim_runtime
import options

type
  VmwareVmdk* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `version`*: int32
    `flags`*: VmwareVmdk_HeaderFlags
    `sizeMax`*: int64
    `sizeGrain`*: int64
    `startDescriptor`*: int64
    `sizeDescriptor`*: int64
    `numGrainTableEntries`*: int32
    `startSecondaryGrain`*: int64
    `startPrimaryGrain`*: int64
    `sizeMetadata`*: int64
    `isDirty`*: uint8
    `stuff`*: seq[byte]
    `compressionMethod`*: VmwareVmdk_CompressionMethods
    `parent`*: KaitaiStruct
    `lenSectorInst`: int
    `lenSectorInstFlag`: bool
    `descriptorInst`: seq[byte]
    `descriptorInstFlag`: bool
    `grainPrimaryInst`: seq[byte]
    `grainPrimaryInstFlag`: bool
    `grainSecondaryInst`: seq[byte]
    `grainSecondaryInstFlag`: bool
  VmwareVmdk_CompressionMethods* = enum
    none = 0
    deflate = 1
  VmwareVmdk_HeaderFlags* = ref object of KaitaiStruct
    `reserved1`*: uint64
    `zeroedGrainTableEntry`*: bool
    `useSecondaryGrainDir`*: bool
    `validNewLineDetectionTest`*: bool
    `reserved2`*: uint8
    `reserved3`*: uint64
    `hasMetadata`*: bool
    `hasCompressedGrain`*: bool
    `reserved4`*: uint8
    `parent`*: VmwareVmdk

proc read*(_: typedesc[VmwareVmdk], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): VmwareVmdk
proc read*(_: typedesc[VmwareVmdk_HeaderFlags], io: KaitaiStream, root: KaitaiStruct, parent: VmwareVmdk): VmwareVmdk_HeaderFlags

proc lenSector*(this: VmwareVmdk): int
proc descriptor*(this: VmwareVmdk): seq[byte]
proc grainPrimary*(this: VmwareVmdk): seq[byte]
proc grainSecondary*(this: VmwareVmdk): seq[byte]


##[
@see <a href="https://github.com/libyal/libvmdk/blob/main/documentation/VMWare%20Virtual%20Disk%20Format%20(VMDK).asciidoc#41-file-header">Source</a>
]##
proc read*(_: typedesc[VmwareVmdk], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): VmwareVmdk =
  template this: untyped = result
  this = new(VmwareVmdk)
  let root = if root == nil: cast[VmwareVmdk](this) else: cast[VmwareVmdk](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let versionExpr = this.io.readS4le()
  this.version = versionExpr
  let flagsExpr = VmwareVmdk_HeaderFlags.read(this.io, this.root, this)
  this.flags = flagsExpr

  ##[
  Maximum number of sectors in a given image file (capacity)
  ]##
  let sizeMaxExpr = this.io.readS8le()
  this.sizeMax = sizeMaxExpr
  let sizeGrainExpr = this.io.readS8le()
  this.sizeGrain = sizeGrainExpr

  ##[
  Embedded descriptor file start sector number (0 if not available)
  ]##
  let startDescriptorExpr = this.io.readS8le()
  this.startDescriptor = startDescriptorExpr

  ##[
  Number of sectors that embedded descriptor file occupies
  ]##
  let sizeDescriptorExpr = this.io.readS8le()
  this.sizeDescriptor = sizeDescriptorExpr

  ##[
  Number of grains table entries
  ]##
  let numGrainTableEntriesExpr = this.io.readS4le()
  this.numGrainTableEntries = numGrainTableEntriesExpr

  ##[
  Secondary (backup) grain directory start sector number
  ]##
  let startSecondaryGrainExpr = this.io.readS8le()
  this.startSecondaryGrain = startSecondaryGrainExpr

  ##[
  Primary grain directory start sector number
  ]##
  let startPrimaryGrainExpr = this.io.readS8le()
  this.startPrimaryGrain = startPrimaryGrainExpr
  let sizeMetadataExpr = this.io.readS8le()
  this.sizeMetadata = sizeMetadataExpr
  let isDirtyExpr = this.io.readU1()
  this.isDirty = isDirtyExpr
  let stuffExpr = this.io.readBytes(int(4))
  this.stuff = stuffExpr
  let compressionMethodExpr = VmwareVmdk_CompressionMethods(this.io.readU2le())
  this.compressionMethod = compressionMethodExpr

proc lenSector(this: VmwareVmdk): int = 
  if this.lenSectorInstFlag:
    return this.lenSectorInst
  let lenSectorInstExpr = int(512)
  this.lenSectorInst = lenSectorInstExpr
  this.lenSectorInstFlag = true
  return this.lenSectorInst

proc descriptor(this: VmwareVmdk): seq[byte] = 
  if this.descriptorInstFlag:
    return this.descriptorInst
  let pos = this.io.pos()
  this.io.seek(int((this.startDescriptor * VmwareVmdk(this.root).lenSector)))
  let descriptorInstExpr = this.io.readBytes(int((this.sizeDescriptor * VmwareVmdk(this.root).lenSector)))
  this.descriptorInst = descriptorInstExpr
  this.io.seek(pos)
  this.descriptorInstFlag = true
  return this.descriptorInst

proc grainPrimary(this: VmwareVmdk): seq[byte] = 
  if this.grainPrimaryInstFlag:
    return this.grainPrimaryInst
  let pos = this.io.pos()
  this.io.seek(int((this.startPrimaryGrain * VmwareVmdk(this.root).lenSector)))
  let grainPrimaryInstExpr = this.io.readBytes(int((this.sizeGrain * VmwareVmdk(this.root).lenSector)))
  this.grainPrimaryInst = grainPrimaryInstExpr
  this.io.seek(pos)
  this.grainPrimaryInstFlag = true
  return this.grainPrimaryInst

proc grainSecondary(this: VmwareVmdk): seq[byte] = 
  if this.grainSecondaryInstFlag:
    return this.grainSecondaryInst
  let pos = this.io.pos()
  this.io.seek(int((this.startSecondaryGrain * VmwareVmdk(this.root).lenSector)))
  let grainSecondaryInstExpr = this.io.readBytes(int((this.sizeGrain * VmwareVmdk(this.root).lenSector)))
  this.grainSecondaryInst = grainSecondaryInstExpr
  this.io.seek(pos)
  this.grainSecondaryInstFlag = true
  return this.grainSecondaryInst

proc fromFile*(_: typedesc[VmwareVmdk], filename: string): VmwareVmdk =
  VmwareVmdk.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://github.com/libyal/libvmdk/blob/main/documentation/VMWare%20Virtual%20Disk%20Format%20(VMDK).asciidoc#411-flags">Source</a>
]##
proc read*(_: typedesc[VmwareVmdk_HeaderFlags], io: KaitaiStream, root: KaitaiStruct, parent: VmwareVmdk): VmwareVmdk_HeaderFlags =
  template this: untyped = result
  this = new(VmwareVmdk_HeaderFlags)
  let root = if root == nil: cast[VmwareVmdk](this) else: cast[VmwareVmdk](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reserved1Expr = this.io.readBitsIntBe(5)
  this.reserved1 = reserved1Expr
  let zeroedGrainTableEntryExpr = this.io.readBitsIntBe(1) != 0
  this.zeroedGrainTableEntry = zeroedGrainTableEntryExpr
  let useSecondaryGrainDirExpr = this.io.readBitsIntBe(1) != 0
  this.useSecondaryGrainDir = useSecondaryGrainDirExpr
  let validNewLineDetectionTestExpr = this.io.readBitsIntBe(1) != 0
  this.validNewLineDetectionTest = validNewLineDetectionTestExpr
  alignToByte(this.io)
  let reserved2Expr = this.io.readU1()
  this.reserved2 = reserved2Expr
  let reserved3Expr = this.io.readBitsIntBe(6)
  this.reserved3 = reserved3Expr
  let hasMetadataExpr = this.io.readBitsIntBe(1) != 0
  this.hasMetadata = hasMetadataExpr
  let hasCompressedGrainExpr = this.io.readBitsIntBe(1) != 0
  this.hasCompressedGrain = hasCompressedGrainExpr
  alignToByte(this.io)
  let reserved4Expr = this.io.readU1()
  this.reserved4 = reserved4Expr

proc fromFile*(_: typedesc[VmwareVmdk_HeaderFlags], filename: string): VmwareVmdk_HeaderFlags =
  VmwareVmdk_HeaderFlags.read(newKaitaiFileStream(filename), nil, nil)


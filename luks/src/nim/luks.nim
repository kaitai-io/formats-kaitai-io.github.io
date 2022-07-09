import kaitai_struct_nim_runtime
import options

type
  Luks* = ref object of KaitaiStruct
    `partitionHeader`*: Luks_PartitionHeader
    `parent`*: KaitaiStruct
    `payloadInst`: seq[byte]
    `payloadInstFlag`: bool
  Luks_PartitionHeader* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `version`*: seq[byte]
    `cipherNameSpecification`*: string
    `cipherModeSpecification`*: string
    `hashSpecification`*: string
    `payloadOffset`*: uint32
    `numberOfKeyBytes`*: uint32
    `masterKeyChecksum`*: seq[byte]
    `masterKeySaltParameter`*: seq[byte]
    `masterKeyIterationsParameter`*: uint32
    `uuid`*: string
    `keySlots`*: seq[Luks_PartitionHeader_KeySlot]
    `parent`*: Luks
  Luks_PartitionHeader_KeySlot* = ref object of KaitaiStruct
    `stateOfKeySlot`*: Luks_PartitionHeader_KeySlot_KeySlotStates
    `iterationParameter`*: uint32
    `saltParameter`*: seq[byte]
    `startSectorOfKeyMaterial`*: uint32
    `numberOfAntiForensicStripes`*: uint32
    `parent`*: Luks_PartitionHeader
    `keyMaterialInst`: seq[byte]
    `keyMaterialInstFlag`: bool
  Luks_PartitionHeader_KeySlot_KeySlotStates* = enum
    disabled_key_slot = 57005
    enabled_key_slot = 11301363

proc read*(_: typedesc[Luks], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Luks
proc read*(_: typedesc[Luks_PartitionHeader], io: KaitaiStream, root: KaitaiStruct, parent: Luks): Luks_PartitionHeader
proc read*(_: typedesc[Luks_PartitionHeader_KeySlot], io: KaitaiStream, root: KaitaiStruct, parent: Luks_PartitionHeader): Luks_PartitionHeader_KeySlot

proc payload*(this: Luks): seq[byte]
proc keyMaterial*(this: Luks_PartitionHeader_KeySlot): seq[byte]


##[
Linux Unified Key Setup (LUKS) is a format specification for storing disk
encryption parameters and up to 8 user keys (which can unlock the master key).

@see <a href="https://gitlab.com/cryptsetup/cryptsetup/wikis/LUKS-standard/on-disk-format.pdf">Source</a>
]##
proc read*(_: typedesc[Luks], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Luks =
  template this: untyped = result
  this = new(Luks)
  let root = if root == nil: cast[Luks](this) else: cast[Luks](root)
  this.io = io
  this.root = root
  this.parent = parent

  let partitionHeaderExpr = Luks_PartitionHeader.read(this.io, this.root, this)
  this.partitionHeader = partitionHeaderExpr

proc payload(this: Luks): seq[byte] = 
  if this.payloadInstFlag:
    return this.payloadInst
  let pos = this.io.pos()
  this.io.seek(int((this.partitionHeader.payloadOffset * 512)))
  let payloadInstExpr = this.io.readBytesFull()
  this.payloadInst = payloadInstExpr
  this.io.seek(pos)
  this.payloadInstFlag = true
  return this.payloadInst

proc fromFile*(_: typedesc[Luks], filename: string): Luks =
  Luks.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Luks_PartitionHeader], io: KaitaiStream, root: KaitaiStruct, parent: Luks): Luks_PartitionHeader =
  template this: untyped = result
  this = new(Luks_PartitionHeader)
  let root = if root == nil: cast[Luks](this) else: cast[Luks](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(6))
  this.magic = magicExpr
  let versionExpr = this.io.readBytes(int(2))
  this.version = versionExpr
  let cipherNameSpecificationExpr = encode(this.io.readBytes(int(32)), "ASCII")
  this.cipherNameSpecification = cipherNameSpecificationExpr
  let cipherModeSpecificationExpr = encode(this.io.readBytes(int(32)), "ASCII")
  this.cipherModeSpecification = cipherModeSpecificationExpr
  let hashSpecificationExpr = encode(this.io.readBytes(int(32)), "ASCII")
  this.hashSpecification = hashSpecificationExpr
  let payloadOffsetExpr = this.io.readU4be()
  this.payloadOffset = payloadOffsetExpr
  let numberOfKeyBytesExpr = this.io.readU4be()
  this.numberOfKeyBytes = numberOfKeyBytesExpr
  let masterKeyChecksumExpr = this.io.readBytes(int(20))
  this.masterKeyChecksum = masterKeyChecksumExpr
  let masterKeySaltParameterExpr = this.io.readBytes(int(32))
  this.masterKeySaltParameter = masterKeySaltParameterExpr
  let masterKeyIterationsParameterExpr = this.io.readU4be()
  this.masterKeyIterationsParameter = masterKeyIterationsParameterExpr
  let uuidExpr = encode(this.io.readBytes(int(40)), "ASCII")
  this.uuid = uuidExpr
  for i in 0 ..< int(8):
    let it = Luks_PartitionHeader_KeySlot.read(this.io, this.root, this)
    this.keySlots.add(it)

proc fromFile*(_: typedesc[Luks_PartitionHeader], filename: string): Luks_PartitionHeader =
  Luks_PartitionHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Luks_PartitionHeader_KeySlot], io: KaitaiStream, root: KaitaiStruct, parent: Luks_PartitionHeader): Luks_PartitionHeader_KeySlot =
  template this: untyped = result
  this = new(Luks_PartitionHeader_KeySlot)
  let root = if root == nil: cast[Luks](this) else: cast[Luks](root)
  this.io = io
  this.root = root
  this.parent = parent

  let stateOfKeySlotExpr = Luks_PartitionHeader_KeySlot_KeySlotStates(this.io.readU4be())
  this.stateOfKeySlot = stateOfKeySlotExpr
  let iterationParameterExpr = this.io.readU4be()
  this.iterationParameter = iterationParameterExpr
  let saltParameterExpr = this.io.readBytes(int(32))
  this.saltParameter = saltParameterExpr
  let startSectorOfKeyMaterialExpr = this.io.readU4be()
  this.startSectorOfKeyMaterial = startSectorOfKeyMaterialExpr
  let numberOfAntiForensicStripesExpr = this.io.readU4be()
  this.numberOfAntiForensicStripes = numberOfAntiForensicStripesExpr

proc keyMaterial(this: Luks_PartitionHeader_KeySlot): seq[byte] = 
  if this.keyMaterialInstFlag:
    return this.keyMaterialInst
  let pos = this.io.pos()
  this.io.seek(int((this.startSectorOfKeyMaterial * 512)))
  let keyMaterialInstExpr = this.io.readBytes(int((this.parent.numberOfKeyBytes * this.numberOfAntiForensicStripes)))
  this.keyMaterialInst = keyMaterialInstExpr
  this.io.seek(pos)
  this.keyMaterialInstFlag = true
  return this.keyMaterialInst

proc fromFile*(_: typedesc[Luks_PartitionHeader_KeySlot], filename: string): Luks_PartitionHeader_KeySlot =
  Luks_PartitionHeader_KeySlot.read(newKaitaiFileStream(filename), nil, nil)


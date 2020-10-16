import kaitai_struct_nim_runtime
import options

type
  MbrPartitionTable* = ref object of KaitaiStruct
    `bootstrapCode`*: seq[byte]
    `partitions`*: seq[MbrPartitionTable_PartitionEntry]
    `bootSignature`*: seq[byte]
    `parent`*: KaitaiStruct
  MbrPartitionTable_PartitionEntry* = ref object of KaitaiStruct
    `status`*: uint8
    `chsStart`*: MbrPartitionTable_Chs
    `partitionType`*: uint8
    `chsEnd`*: MbrPartitionTable_Chs
    `lbaStart`*: uint32
    `numSectors`*: uint32
    `parent`*: MbrPartitionTable
  MbrPartitionTable_Chs* = ref object of KaitaiStruct
    `head`*: uint8
    `b2`*: uint8
    `b3`*: uint8
    `parent`*: MbrPartitionTable_PartitionEntry
    `sectorInst`*: int
    `cylinderInst`*: int

proc read*(_: typedesc[MbrPartitionTable], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MbrPartitionTable
proc read*(_: typedesc[MbrPartitionTable_PartitionEntry], io: KaitaiStream, root: KaitaiStruct, parent: MbrPartitionTable): MbrPartitionTable_PartitionEntry
proc read*(_: typedesc[MbrPartitionTable_Chs], io: KaitaiStream, root: KaitaiStruct, parent: MbrPartitionTable_PartitionEntry): MbrPartitionTable_Chs

proc sector*(this: MbrPartitionTable_Chs): int
proc cylinder*(this: MbrPartitionTable_Chs): int


##[
MBR (Master Boot Record) partition table is a traditional way of
MS-DOS to partition larger hard disc drives into distinct
partitions.

This table is stored in the end of the boot sector (first sector) of
the drive, after the bootstrap code. Original DOS 2.0 specification
allowed only 4 partitions per disc, but DOS 3.2 introduced concept
of "extended partitions", which work as nested extra "boot records"
which are pointed to by original ("primary") partitions in MBR.

]##
proc read*(_: typedesc[MbrPartitionTable], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MbrPartitionTable =
  template this: untyped = result
  this = new(MbrPartitionTable)
  let root = if root == nil: cast[MbrPartitionTable](this) else: cast[MbrPartitionTable](root)
  this.io = io
  this.root = root
  this.parent = parent

  let bootstrapCodeExpr = this.io.readBytes(int(446))
  this.bootstrapCode = bootstrapCodeExpr
  for i in 0 ..< int(4):
    let it = MbrPartitionTable_PartitionEntry.read(this.io, this.root, this)
    this.partitions.add(it)
  let bootSignatureExpr = this.io.readBytes(int(2))
  this.bootSignature = bootSignatureExpr

proc fromFile*(_: typedesc[MbrPartitionTable], filename: string): MbrPartitionTable =
  MbrPartitionTable.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MbrPartitionTable_PartitionEntry], io: KaitaiStream, root: KaitaiStruct, parent: MbrPartitionTable): MbrPartitionTable_PartitionEntry =
  template this: untyped = result
  this = new(MbrPartitionTable_PartitionEntry)
  let root = if root == nil: cast[MbrPartitionTable](this) else: cast[MbrPartitionTable](root)
  this.io = io
  this.root = root
  this.parent = parent

  let statusExpr = this.io.readU1()
  this.status = statusExpr
  let chsStartExpr = MbrPartitionTable_Chs.read(this.io, this.root, this)
  this.chsStart = chsStartExpr
  let partitionTypeExpr = this.io.readU1()
  this.partitionType = partitionTypeExpr
  let chsEndExpr = MbrPartitionTable_Chs.read(this.io, this.root, this)
  this.chsEnd = chsEndExpr
  let lbaStartExpr = this.io.readU4le()
  this.lbaStart = lbaStartExpr
  let numSectorsExpr = this.io.readU4le()
  this.numSectors = numSectorsExpr

proc fromFile*(_: typedesc[MbrPartitionTable_PartitionEntry], filename: string): MbrPartitionTable_PartitionEntry =
  MbrPartitionTable_PartitionEntry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MbrPartitionTable_Chs], io: KaitaiStream, root: KaitaiStruct, parent: MbrPartitionTable_PartitionEntry): MbrPartitionTable_Chs =
  template this: untyped = result
  this = new(MbrPartitionTable_Chs)
  let root = if root == nil: cast[MbrPartitionTable](this) else: cast[MbrPartitionTable](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headExpr = this.io.readU1()
  this.head = headExpr
  let b2Expr = this.io.readU1()
  this.b2 = b2Expr
  let b3Expr = this.io.readU1()
  this.b3 = b3Expr

proc sector(this: MbrPartitionTable_Chs): int = 
  if this.sectorInst != nil:
    return this.sectorInst
  let sectorInstExpr = int((this.b2 and 63))
  this.sectorInst = sectorInstExpr
  if this.sectorInst != nil:
    return this.sectorInst

proc cylinder(this: MbrPartitionTable_Chs): int = 
  if this.cylinderInst != nil:
    return this.cylinderInst
  let cylinderInstExpr = int((this.b3 + ((this.b2 and 192) shl 2)))
  this.cylinderInst = cylinderInstExpr
  if this.cylinderInst != nil:
    return this.cylinderInst

proc fromFile*(_: typedesc[MbrPartitionTable_Chs], filename: string): MbrPartitionTable_Chs =
  MbrPartitionTable_Chs.read(newKaitaiFileStream(filename), nil, nil)


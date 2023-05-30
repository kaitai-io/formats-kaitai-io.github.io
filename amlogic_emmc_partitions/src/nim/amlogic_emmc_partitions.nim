import kaitai_struct_nim_runtime
import options

type
  AmlogicEmmcPartitions* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `version`*: string
    `numPartitions`*: int32
    `checksum`*: uint32
    `partitions`*: seq[AmlogicEmmcPartitions_Partition]
    `parent`*: KaitaiStruct
  AmlogicEmmcPartitions_Partition* = ref object of KaitaiStruct
    `name`*: string
    `size`*: uint64
    `offset`*: uint64
    `flags`*: AmlogicEmmcPartitions_Partition_PartFlags
    `padding`*: seq[byte]
    `parent`*: AmlogicEmmcPartitions
    `rawFlags`*: seq[byte]
  AmlogicEmmcPartitions_Partition_PartFlags* = ref object of KaitaiStruct
    `isCode`*: bool
    `isCache`*: bool
    `isData`*: bool
    `parent`*: AmlogicEmmcPartitions_Partition

proc read*(_: typedesc[AmlogicEmmcPartitions], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AmlogicEmmcPartitions
proc read*(_: typedesc[AmlogicEmmcPartitions_Partition], io: KaitaiStream, root: KaitaiStruct, parent: AmlogicEmmcPartitions): AmlogicEmmcPartitions_Partition
proc read*(_: typedesc[AmlogicEmmcPartitions_Partition_PartFlags], io: KaitaiStream, root: KaitaiStruct, parent: AmlogicEmmcPartitions_Partition): AmlogicEmmcPartitions_Partition_PartFlags



##[
This is an unnamed and undocumented partition table format implemented by
the bootloader and kernel that Amlogic provides for their Linux SoCs (Meson
series at least, and probably others). They appear to use this rather than GPT,
the industry standard, because their BootROM loads and executes the next stage
loader from offset 512 (0x200) on the eMMC, which is exactly where the GPT
header would have to start. So instead of changing their BootROM, Amlogic
devised this partition table, which lives at an offset of 36MiB (0x240_0000)
on the eMMC and so doesn't conflict. This parser expects as input just the
partition table from that offset. The maximum number of partitions in a table
is 32, which corresponds to a maximum table size of 1304 bytes (0x518).

@see <a href="http://aml-code.amlogic.com/kernel/common.git/tree/include/linux/mmc/emmc_partitions.h?id=18a4a87072ababf76ea08c8539e939b5b8a440ef">Source</a>
@see <a href="http://aml-code.amlogic.com/kernel/common.git/tree/drivers/amlogic/mmc/emmc_partitions.c?id=18a4a87072ababf76ea08c8539e939b5b8a440ef">Source</a>
]##
proc read*(_: typedesc[AmlogicEmmcPartitions], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AmlogicEmmcPartitions =
  template this: untyped = result
  this = new(AmlogicEmmcPartitions)
  let root = if root == nil: cast[AmlogicEmmcPartitions](this) else: cast[AmlogicEmmcPartitions](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let versionExpr = encode(this.io.readBytes(int(12)).bytesTerminate(0, false), "UTF-8")
  this.version = versionExpr
  let numPartitionsExpr = this.io.readS4le()
  this.numPartitions = numPartitionsExpr

  ##[
  To calculate this, treat the first (and only the first) partition
descriptor in the table below as an array of unsigned little-endian
32-bit integers. Sum all those integers mod 2^32, then multiply the
result by the total number of partitions, also mod 2^32. Amlogic
likely meant to include all the partition descriptors in the sum,
but their code as written instead repeatedly loops over the first
one, once for each partition in the table.

  ]##
  let checksumExpr = this.io.readU4le()
  this.checksum = checksumExpr
  for i in 0 ..< int(this.numPartitions):
    let it = AmlogicEmmcPartitions_Partition.read(this.io, this.root, this)
    this.partitions.add(it)

proc fromFile*(_: typedesc[AmlogicEmmcPartitions], filename: string): AmlogicEmmcPartitions =
  AmlogicEmmcPartitions.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AmlogicEmmcPartitions_Partition], io: KaitaiStream, root: KaitaiStruct, parent: AmlogicEmmcPartitions): AmlogicEmmcPartitions_Partition =
  template this: untyped = result
  this = new(AmlogicEmmcPartitions_Partition)
  let root = if root == nil: cast[AmlogicEmmcPartitions](this) else: cast[AmlogicEmmcPartitions](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameExpr = encode(this.io.readBytes(int(16)).bytesTerminate(0, false), "UTF-8")
  this.name = nameExpr
  let sizeExpr = this.io.readU8le()
  this.size = sizeExpr

  ##[
  The start of the partition relative to the start of the eMMC, in bytes

  ]##
  let offsetExpr = this.io.readU8le()
  this.offset = offsetExpr
  let rawFlagsExpr = this.io.readBytes(int(4))
  this.rawFlags = rawFlagsExpr
  let rawFlagsIo = newKaitaiStream(rawFlagsExpr)
  let flagsExpr = AmlogicEmmcPartitions_Partition_PartFlags.read(rawFlagsIo, this.root, this)
  this.flags = flagsExpr
  let paddingExpr = this.io.readBytes(int(4))
  this.padding = paddingExpr

proc fromFile*(_: typedesc[AmlogicEmmcPartitions_Partition], filename: string): AmlogicEmmcPartitions_Partition =
  AmlogicEmmcPartitions_Partition.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AmlogicEmmcPartitions_Partition_PartFlags], io: KaitaiStream, root: KaitaiStruct, parent: AmlogicEmmcPartitions_Partition): AmlogicEmmcPartitions_Partition_PartFlags =
  template this: untyped = result
  this = new(AmlogicEmmcPartitions_Partition_PartFlags)
  let root = if root == nil: cast[AmlogicEmmcPartitions](this) else: cast[AmlogicEmmcPartitions](root)
  this.io = io
  this.root = root
  this.parent = parent

  let isCodeExpr = this.io.readBitsIntLe(1) != 0
  this.isCode = isCodeExpr
  let isCacheExpr = this.io.readBitsIntLe(1) != 0
  this.isCache = isCacheExpr
  let isDataExpr = this.io.readBitsIntLe(1) != 0
  this.isData = isDataExpr

proc fromFile*(_: typedesc[AmlogicEmmcPartitions_Partition_PartFlags], filename: string): AmlogicEmmcPartitions_Partition_PartFlags =
  AmlogicEmmcPartitions_Partition_PartFlags.read(newKaitaiFileStream(filename), nil, nil)


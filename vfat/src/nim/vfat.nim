import kaitai_struct_nim_runtime
import options
import dos_datetime

type
  Vfat* = ref object of KaitaiStruct
    `bootSector`*: Vfat_BootSector
    `parent`*: KaitaiStruct
    `rawRootDirInst`*: seq[byte]
    `fatsInst`: seq[seq[byte]]
    `fatsInstFlag`: bool
    `rootDirInst`: Vfat_RootDirectory
    `rootDirInstFlag`: bool
  Vfat_BiosParamBlock* = ref object of KaitaiStruct
    `bytesPerLs`*: uint16
    `lsPerClus`*: uint8
    `numReservedLs`*: uint16
    `numFats`*: uint8
    `maxRootDirRec`*: uint16
    `totalLs2`*: uint16
    `mediaCode`*: uint8
    `lsPerFat`*: uint16
    `psPerTrack`*: uint16
    `numHeads`*: uint16
    `numHiddenSectors`*: uint32
    `totalLs4`*: uint32
    `parent`*: Vfat_BootSector
  Vfat_BootSector* = ref object of KaitaiStruct
    `jmpInstruction`*: seq[byte]
    `oemName`*: string
    `bpb`*: Vfat_BiosParamBlock
    `ebpbFat16`*: Vfat_ExtBiosParamBlockFat16
    `ebpbFat32`*: Vfat_ExtBiosParamBlockFat32
    `parent`*: Vfat
    `isFat32Inst`: bool
    `isFat32InstFlag`: bool
    `lsPerFatInst`: uint32
    `lsPerFatInstFlag`: bool
    `lsPerRootDirInst`: int
    `lsPerRootDirInstFlag`: bool
    `posFatsInst`: int
    `posFatsInstFlag`: bool
    `posRootDirInst`: int
    `posRootDirInstFlag`: bool
    `sizeFatInst`: int
    `sizeFatInstFlag`: bool
    `sizeRootDirInst`: int
    `sizeRootDirInstFlag`: bool
  Vfat_ExtBiosParamBlockFat16* = ref object of KaitaiStruct
    `physDriveNum`*: uint8
    `reserved1`*: uint8
    `extBootSign`*: uint8
    `volumeId`*: seq[byte]
    `partitionVolumeLabel`*: string
    `fsTypeStr`*: string
    `parent`*: Vfat_BootSector
  Vfat_ExtBiosParamBlockFat32* = ref object of KaitaiStruct
    `lsPerFat`*: uint32
    `hasActiveFat`*: bool
    `reserved1`*: uint64
    `activeFatId`*: uint64
    `reserved2`*: seq[byte]
    `fatVersion`*: uint16
    `rootDirStartClus`*: uint32
    `lsFsInfo`*: uint16
    `bootSectorsCopyStartLs`*: uint16
    `reserved3`*: seq[byte]
    `physDriveNum`*: uint8
    `reserved4`*: uint8
    `extBootSign`*: uint8
    `volumeId`*: seq[byte]
    `partitionVolumeLabel`*: string
    `fsTypeStr`*: string
    `parent`*: Vfat_BootSector
  Vfat_RootDirectory* = ref object of KaitaiStruct
    `records`*: seq[Vfat_RootDirectoryRec]
    `parent`*: Vfat
  Vfat_RootDirectoryRec* = ref object of KaitaiStruct
    `fileName`*: seq[byte]
    `attrs`*: Vfat_RootDirectoryRec_AttrFlags
    `reserved`*: seq[byte]
    `lastWriteTime`*: DosDatetime
    `startClus`*: uint16
    `fileSize`*: uint32
    `parent`*: Vfat_RootDirectory
    `rawAttrs`*: seq[byte]
    `rawLastWriteTime`*: seq[byte]
  Vfat_RootDirectoryRec_AttrFlags* = ref object of KaitaiStruct
    `readOnly`*: bool
    `hidden`*: bool
    `system`*: bool
    `volumeId`*: bool
    `isDirectory`*: bool
    `archive`*: bool
    `reserved`*: uint64
    `parent`*: Vfat_RootDirectoryRec
    `longNameInst`: bool
    `longNameInstFlag`: bool

proc read*(_: typedesc[Vfat], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Vfat
proc read*(_: typedesc[Vfat_BiosParamBlock], io: KaitaiStream, root: KaitaiStruct, parent: Vfat_BootSector): Vfat_BiosParamBlock
proc read*(_: typedesc[Vfat_BootSector], io: KaitaiStream, root: KaitaiStruct, parent: Vfat): Vfat_BootSector
proc read*(_: typedesc[Vfat_ExtBiosParamBlockFat16], io: KaitaiStream, root: KaitaiStruct, parent: Vfat_BootSector): Vfat_ExtBiosParamBlockFat16
proc read*(_: typedesc[Vfat_ExtBiosParamBlockFat32], io: KaitaiStream, root: KaitaiStruct, parent: Vfat_BootSector): Vfat_ExtBiosParamBlockFat32
proc read*(_: typedesc[Vfat_RootDirectory], io: KaitaiStream, root: KaitaiStruct, parent: Vfat): Vfat_RootDirectory
proc read*(_: typedesc[Vfat_RootDirectoryRec], io: KaitaiStream, root: KaitaiStruct, parent: Vfat_RootDirectory): Vfat_RootDirectoryRec
proc read*(_: typedesc[Vfat_RootDirectoryRec_AttrFlags], io: KaitaiStream, root: KaitaiStruct, parent: Vfat_RootDirectoryRec): Vfat_RootDirectoryRec_AttrFlags

proc fats*(this: Vfat): seq[seq[byte]]
proc rootDir*(this: Vfat): Vfat_RootDirectory
proc isFat32*(this: Vfat_BootSector): bool
proc lsPerFat*(this: Vfat_BootSector): uint32
proc lsPerRootDir*(this: Vfat_BootSector): int
proc posFats*(this: Vfat_BootSector): int
proc posRootDir*(this: Vfat_BootSector): int
proc sizeFat*(this: Vfat_BootSector): int
proc sizeRootDir*(this: Vfat_BootSector): int
proc longName*(this: Vfat_RootDirectoryRec_AttrFlags): bool


##[
@see <a href="https://download.microsoft.com/download/0/8/4/084c452b-b772-4fe5-89bb-a0cbf082286a/fatgen103.doc">Source</a>
]##
proc read*(_: typedesc[Vfat], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Vfat =
  template this: untyped = result
  this = new(Vfat)
  let root = if root == nil: cast[Vfat](this) else: cast[Vfat](root)
  this.io = io
  this.root = root
  this.parent = parent

  let bootSectorExpr = Vfat_BootSector.read(this.io, this.root, this)
  this.bootSector = bootSectorExpr

proc fats(this: Vfat): seq[seq[byte]] = 
  if this.fatsInstFlag:
    return this.fatsInst
  let pos = this.io.pos()
  this.io.seek(int(this.bootSector.posFats))
  for i in 0 ..< int(this.bootSector.bpb.numFats):
    let it = this.io.readBytes(int(this.bootSector.sizeFat))
    this.fatsInst.add(it)
  this.io.seek(pos)
  this.fatsInstFlag = true
  return this.fatsInst

proc rootDir(this: Vfat): Vfat_RootDirectory = 
  if this.rootDirInstFlag:
    return this.rootDirInst
  let pos = this.io.pos()
  this.io.seek(int(this.bootSector.posRootDir))
  let rawRootDirInstExpr = this.io.readBytes(int(this.bootSector.sizeRootDir))
  this.rawRootDirInst = rawRootDirInstExpr
  let rawRootDirInstIo = newKaitaiStream(rawRootDirInstExpr)
  let rootDirInstExpr = Vfat_RootDirectory.read(rawRootDirInstIo, this.root, this)
  this.rootDirInst = rootDirInstExpr
  this.io.seek(pos)
  this.rootDirInstFlag = true
  return this.rootDirInst

proc fromFile*(_: typedesc[Vfat], filename: string): Vfat =
  Vfat.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Vfat_BiosParamBlock], io: KaitaiStream, root: KaitaiStruct, parent: Vfat_BootSector): Vfat_BiosParamBlock =
  template this: untyped = result
  this = new(Vfat_BiosParamBlock)
  let root = if root == nil: cast[Vfat](this) else: cast[Vfat](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Bytes per logical sector
  ]##
  let bytesPerLsExpr = this.io.readU2le()
  this.bytesPerLs = bytesPerLsExpr

  ##[
  Logical sectors per cluster
  ]##
  let lsPerClusExpr = this.io.readU1()
  this.lsPerClus = lsPerClusExpr

  ##[
  Count of reserved logical sectors. The number of logical
sectors before the first FAT in the file system image.

  ]##
  let numReservedLsExpr = this.io.readU2le()
  this.numReservedLs = numReservedLsExpr

  ##[
  Number of File Allocation Tables
  ]##
  let numFatsExpr = this.io.readU1()
  this.numFats = numFatsExpr

  ##[
  Maximum number of FAT12 or FAT16 root directory entries. 0
for FAT32, where the root directory is stored in ordinary
data clusters.

  ]##
  let maxRootDirRecExpr = this.io.readU2le()
  this.maxRootDirRec = maxRootDirRecExpr

  ##[
  Total logical sectors (if zero, use total_ls_4)
  ]##
  let totalLs2Expr = this.io.readU2le()
  this.totalLs2 = totalLs2Expr

  ##[
  Media descriptor
  ]##
  let mediaCodeExpr = this.io.readU1()
  this.mediaCode = mediaCodeExpr

  ##[
  Logical sectors per File Allocation Table for
FAT12/FAT16. FAT32 sets this to 0 and uses the 32-bit value
at offset 0x024 instead.

  ]##
  let lsPerFatExpr = this.io.readU2le()
  this.lsPerFat = lsPerFatExpr

  ##[
  Physical sectors per track for disks with INT 13h CHS
geometry, e.g., 15 for a "1.20 MB" (1200 KB) floppy. A zero
entry indicates that this entry is reserved, but not used.

  ]##
  let psPerTrackExpr = this.io.readU2le()
  this.psPerTrack = psPerTrackExpr

  ##[
  Number of heads for disks with INT 13h CHS geometry,[9]
e.g., 2 for a double sided floppy.

  ]##
  let numHeadsExpr = this.io.readU2le()
  this.numHeads = numHeadsExpr

  ##[
  Number of hidden sectors preceding the partition that
contains this FAT volume. This field should always be zero
on media that are not partitioned. This DOS 3.0 entry is
incompatible with a similar entry at offset 0x01C in BPBs
since DOS 3.31.  It must not be used if the logical sectors
entry at offset 0x013 is zero.

  ]##
  let numHiddenSectorsExpr = this.io.readU4le()
  this.numHiddenSectors = numHiddenSectorsExpr

  ##[
  Total logical sectors including hidden sectors. This DOS 3.2
entry is incompatible with a similar entry at offset 0x020
in BPBs since DOS 3.31. It must not be used if the logical
sectors entry at offset 0x013 is zero.

  ]##
  let totalLs4Expr = this.io.readU4le()
  this.totalLs4 = totalLs4Expr

proc fromFile*(_: typedesc[Vfat_BiosParamBlock], filename: string): Vfat_BiosParamBlock =
  Vfat_BiosParamBlock.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Vfat_BootSector], io: KaitaiStream, root: KaitaiStruct, parent: Vfat): Vfat_BootSector =
  template this: untyped = result
  this = new(Vfat_BootSector)
  let root = if root == nil: cast[Vfat](this) else: cast[Vfat](root)
  this.io = io
  this.root = root
  this.parent = parent

  let jmpInstructionExpr = this.io.readBytes(int(3))
  this.jmpInstruction = jmpInstructionExpr
  let oemNameExpr = encode(this.io.readBytes(int(8)).bytesStripRight(32), "ASCII")
  this.oemName = oemNameExpr

  ##[
  Basic BIOS parameter block, present in all versions of FAT
  ]##
  let bpbExpr = Vfat_BiosParamBlock.read(this.io, this.root, this)
  this.bpb = bpbExpr

  ##[
  FAT12/16-specific extended BIOS parameter block
  ]##
  if not(this.isFat32):
    let ebpbFat16Expr = Vfat_ExtBiosParamBlockFat16.read(this.io, this.root, this)
    this.ebpbFat16 = ebpbFat16Expr

  ##[
  FAT32-specific extended BIOS parameter block
  ]##
  if this.isFat32:
    let ebpbFat32Expr = Vfat_ExtBiosParamBlockFat32.read(this.io, this.root, this)
    this.ebpbFat32 = ebpbFat32Expr

proc isFat32(this: Vfat_BootSector): bool = 

  ##[
  Determines if filesystem is FAT32 (true) or FAT12/16 (false)
by analyzing some preliminary conditions in BPB. Used to
determine whether we should parse post-BPB data as
`ext_bios_param_block_fat16` or `ext_bios_param_block_fat32`.

  ]##
  if this.isFat32InstFlag:
    return this.isFat32Inst
  let isFat32InstExpr = bool(this.bpb.maxRootDirRec == 0)
  this.isFat32Inst = isFat32InstExpr
  this.isFat32InstFlag = true
  return this.isFat32Inst

proc lsPerFat(this: Vfat_BootSector): uint32 = 
  if this.lsPerFatInstFlag:
    return this.lsPerFatInst
  let lsPerFatInstExpr = uint32((if this.isFat32: this.ebpbFat32.lsPerFat else: this.bpb.lsPerFat))
  this.lsPerFatInst = lsPerFatInstExpr
  this.lsPerFatInstFlag = true
  return this.lsPerFatInst

proc lsPerRootDir(this: Vfat_BootSector): int = 

  ##[
  Size of root directory in logical sectors
  @see "FAT: General Overview of On-Disk Format, section "FAT Data Structure""
  ]##
  if this.lsPerRootDirInstFlag:
    return this.lsPerRootDirInst
  let lsPerRootDirInstExpr = int(((this.bpb.maxRootDirRec * 32 + this.bpb.bytesPerLs) - 1) div this.bpb.bytesPerLs)
  this.lsPerRootDirInst = lsPerRootDirInstExpr
  this.lsPerRootDirInstFlag = true
  return this.lsPerRootDirInst

proc posFats(this: Vfat_BootSector): int = 

  ##[
  Offset of FATs in bytes from start of filesystem
  ]##
  if this.posFatsInstFlag:
    return this.posFatsInst
  let posFatsInstExpr = int(this.bpb.bytesPerLs * this.bpb.numReservedLs)
  this.posFatsInst = posFatsInstExpr
  this.posFatsInstFlag = true
  return this.posFatsInst

proc posRootDir(this: Vfat_BootSector): int = 

  ##[
  Offset of root directory in bytes from start of filesystem
  ]##
  if this.posRootDirInstFlag:
    return this.posRootDirInst
  let posRootDirInstExpr = int(this.bpb.bytesPerLs * (this.bpb.numReservedLs + this.lsPerFat * this.bpb.numFats))
  this.posRootDirInst = posRootDirInstExpr
  this.posRootDirInstFlag = true
  return this.posRootDirInst

proc sizeFat(this: Vfat_BootSector): int = 

  ##[
  Size of one FAT in bytes
  ]##
  if this.sizeFatInstFlag:
    return this.sizeFatInst
  let sizeFatInstExpr = int(this.bpb.bytesPerLs * this.lsPerFat)
  this.sizeFatInst = sizeFatInstExpr
  this.sizeFatInstFlag = true
  return this.sizeFatInst

proc sizeRootDir(this: Vfat_BootSector): int = 

  ##[
  Size of root directory in bytes
  ]##
  if this.sizeRootDirInstFlag:
    return this.sizeRootDirInst
  let sizeRootDirInstExpr = int(this.lsPerRootDir * this.bpb.bytesPerLs)
  this.sizeRootDirInst = sizeRootDirInstExpr
  this.sizeRootDirInstFlag = true
  return this.sizeRootDirInst

proc fromFile*(_: typedesc[Vfat_BootSector], filename: string): Vfat_BootSector =
  Vfat_BootSector.read(newKaitaiFileStream(filename), nil, nil)


##[
Extended BIOS Parameter Block (DOS 4.0+, OS/2 1.0+). Used only
for FAT12 and FAT16.

]##
proc read*(_: typedesc[Vfat_ExtBiosParamBlockFat16], io: KaitaiStream, root: KaitaiStruct, parent: Vfat_BootSector): Vfat_ExtBiosParamBlockFat16 =
  template this: untyped = result
  this = new(Vfat_ExtBiosParamBlockFat16)
  let root = if root == nil: cast[Vfat](this) else: cast[Vfat](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Physical drive number (0x00 for (first) removable media,
0x80 for (first) fixed disk as per INT 13h).

  ]##
  let physDriveNumExpr = this.io.readU1()
  this.physDriveNum = physDriveNumExpr
  let reserved1Expr = this.io.readU1()
  this.reserved1 = reserved1Expr

  ##[
  Should be 0x29 to indicate that an EBPB with the following 3
entries exists.

  ]##
  let extBootSignExpr = this.io.readU1()
  this.extBootSign = extBootSignExpr

  ##[
  Volume ID (serial number).

Typically the serial number "xxxx-xxxx" is created by a
16-bit addition of both DX values returned by INT 21h/AH=2Ah
(get system date) and INT 21h/AH=2Ch (get system time) for
the high word and another 16-bit addition of both CX values
for the low word of the serial number. Alternatively, some
DR-DOS disk utilities provide a /# option to generate a
human-readable time stamp "mmdd-hhmm" build from BCD-encoded
8-bit values for the month, day, hour and minute instead of
a serial number.

  ]##
  let volumeIdExpr = this.io.readBytes(int(4))
  this.volumeId = volumeIdExpr
  let partitionVolumeLabelExpr = encode(this.io.readBytes(int(11)).bytesStripRight(32), "ASCII")
  this.partitionVolumeLabel = partitionVolumeLabelExpr
  let fsTypeStrExpr = encode(this.io.readBytes(int(8)).bytesStripRight(32), "ASCII")
  this.fsTypeStr = fsTypeStrExpr

proc fromFile*(_: typedesc[Vfat_ExtBiosParamBlockFat16], filename: string): Vfat_ExtBiosParamBlockFat16 =
  Vfat_ExtBiosParamBlockFat16.read(newKaitaiFileStream(filename), nil, nil)


##[
Extended BIOS Parameter Block for FAT32
]##
proc read*(_: typedesc[Vfat_ExtBiosParamBlockFat32], io: KaitaiStream, root: KaitaiStruct, parent: Vfat_BootSector): Vfat_ExtBiosParamBlockFat32 =
  template this: untyped = result
  this = new(Vfat_ExtBiosParamBlockFat32)
  let root = if root == nil: cast[Vfat](this) else: cast[Vfat](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Logical sectors per file allocation table (corresponds with
the old entry `ls_per_fat` in the DOS 2.0 BPB).

  ]##
  let lsPerFatExpr = this.io.readU4le()
  this.lsPerFat = lsPerFatExpr

  ##[
  If true, then there is "active" FAT, which is designated in
`active_fat` attribute. If false, all FATs are mirrored as
usual.

  ]##
  let hasActiveFatExpr = this.io.readBitsIntLe(1) != 0
  this.hasActiveFat = hasActiveFatExpr
  let reserved1Expr = this.io.readBitsIntLe(3)
  this.reserved1 = reserved1Expr

  ##[
  Zero-based number of active FAT, if `has_active_fat`
attribute is true.

  ]##
  let activeFatIdExpr = this.io.readBitsIntLe(4)
  this.activeFatId = activeFatIdExpr
  alignToByte(this.io)
  let reserved2Expr = this.io.readBytes(int(1))
  this.reserved2 = reserved2Expr
  let fatVersionExpr = this.io.readU2le()
  this.fatVersion = fatVersionExpr

  ##[
  Cluster number of root directory start, typically 2 if it
contains no bad sector. (Microsoft's FAT32 implementation
imposes an artificial limit of 65,535 entries per directory,
whilst many third-party implementations do not.)

  ]##
  let rootDirStartClusExpr = this.io.readU4le()
  this.rootDirStartClus = rootDirStartClusExpr

  ##[
  Logical sector number of FS Information Sector, typically 1,
i.e., the second of the three FAT32 boot sectors. Values
like 0 and 0xFFFF are used by some FAT32 implementations to
designate abscence of FS Information Sector.

  ]##
  let lsFsInfoExpr = this.io.readU2le()
  this.lsFsInfo = lsFsInfoExpr

  ##[
  First logical sector number of a copy of the three FAT32
boot sectors, typically 6.

  ]##
  let bootSectorsCopyStartLsExpr = this.io.readU2le()
  this.bootSectorsCopyStartLs = bootSectorsCopyStartLsExpr
  let reserved3Expr = this.io.readBytes(int(12))
  this.reserved3 = reserved3Expr

  ##[
  Physical drive number (0x00 for (first) removable media,
0x80 for (first) fixed disk as per INT 13h).

  ]##
  let physDriveNumExpr = this.io.readU1()
  this.physDriveNum = physDriveNumExpr
  let reserved4Expr = this.io.readU1()
  this.reserved4 = reserved4Expr

  ##[
  Should be 0x29 to indicate that an EBPB with the following 3
entries exists.

  ]##
  let extBootSignExpr = this.io.readU1()
  this.extBootSign = extBootSignExpr

  ##[
  Volume ID (serial number).

Typically the serial number "xxxx-xxxx" is created by a
16-bit addition of both DX values returned by INT 21h/AH=2Ah
(get system date) and INT 21h/AH=2Ch (get system time) for
the high word and another 16-bit addition of both CX values
for the low word of the serial number. Alternatively, some
DR-DOS disk utilities provide a /# option to generate a
human-readable time stamp "mmdd-hhmm" build from BCD-encoded
8-bit values for the month, day, hour and minute instead of
a serial number.

  ]##
  let volumeIdExpr = this.io.readBytes(int(4))
  this.volumeId = volumeIdExpr
  let partitionVolumeLabelExpr = encode(this.io.readBytes(int(11)).bytesStripRight(32), "ASCII")
  this.partitionVolumeLabel = partitionVolumeLabelExpr
  let fsTypeStrExpr = encode(this.io.readBytes(int(8)).bytesStripRight(32), "ASCII")
  this.fsTypeStr = fsTypeStrExpr

proc fromFile*(_: typedesc[Vfat_ExtBiosParamBlockFat32], filename: string): Vfat_ExtBiosParamBlockFat32 =
  Vfat_ExtBiosParamBlockFat32.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Vfat_RootDirectory], io: KaitaiStream, root: KaitaiStruct, parent: Vfat): Vfat_RootDirectory =
  template this: untyped = result
  this = new(Vfat_RootDirectory)
  let root = if root == nil: cast[Vfat](this) else: cast[Vfat](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int(Vfat(this.root).bootSector.bpb.maxRootDirRec):
    let it = Vfat_RootDirectoryRec.read(this.io, this.root, this)
    this.records.add(it)

proc fromFile*(_: typedesc[Vfat_RootDirectory], filename: string): Vfat_RootDirectory =
  Vfat_RootDirectory.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Vfat_RootDirectoryRec], io: KaitaiStream, root: KaitaiStruct, parent: Vfat_RootDirectory): Vfat_RootDirectoryRec =
  template this: untyped = result
  this = new(Vfat_RootDirectoryRec)
  let root = if root == nil: cast[Vfat](this) else: cast[Vfat](root)
  this.io = io
  this.root = root
  this.parent = parent

  let fileNameExpr = this.io.readBytes(int(11))
  this.fileName = fileNameExpr
  let rawAttrsExpr = this.io.readBytes(int(1))
  this.rawAttrs = rawAttrsExpr
  let rawAttrsIo = newKaitaiStream(rawAttrsExpr)
  let attrsExpr = Vfat_RootDirectoryRec_AttrFlags.read(rawAttrsIo, this.root, this)
  this.attrs = attrsExpr
  let reservedExpr = this.io.readBytes(int(10))
  this.reserved = reservedExpr
  let rawLastWriteTimeExpr = this.io.readBytes(int(4))
  this.rawLastWriteTime = rawLastWriteTimeExpr
  let rawLastWriteTimeIo = newKaitaiStream(rawLastWriteTimeExpr)
  let lastWriteTimeExpr = DosDatetime.read(rawLastWriteTimeIo, nil, nil)
  this.lastWriteTime = lastWriteTimeExpr
  let startClusExpr = this.io.readU2le()
  this.startClus = startClusExpr
  let fileSizeExpr = this.io.readU4le()
  this.fileSize = fileSizeExpr

proc fromFile*(_: typedesc[Vfat_RootDirectoryRec], filename: string): Vfat_RootDirectoryRec =
  Vfat_RootDirectoryRec.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Vfat_RootDirectoryRec_AttrFlags], io: KaitaiStream, root: KaitaiStruct, parent: Vfat_RootDirectoryRec): Vfat_RootDirectoryRec_AttrFlags =
  template this: untyped = result
  this = new(Vfat_RootDirectoryRec_AttrFlags)
  let root = if root == nil: cast[Vfat](this) else: cast[Vfat](root)
  this.io = io
  this.root = root
  this.parent = parent

  let readOnlyExpr = this.io.readBitsIntLe(1) != 0
  this.readOnly = readOnlyExpr
  let hiddenExpr = this.io.readBitsIntLe(1) != 0
  this.hidden = hiddenExpr
  let systemExpr = this.io.readBitsIntLe(1) != 0
  this.system = systemExpr
  let volumeIdExpr = this.io.readBitsIntLe(1) != 0
  this.volumeId = volumeIdExpr
  let isDirectoryExpr = this.io.readBitsIntLe(1) != 0
  this.isDirectory = isDirectoryExpr
  let archiveExpr = this.io.readBitsIntLe(1) != 0
  this.archive = archiveExpr
  let reservedExpr = this.io.readBitsIntLe(2)
  this.reserved = reservedExpr

proc longName(this: Vfat_RootDirectoryRec_AttrFlags): bool = 
  if this.longNameInstFlag:
    return this.longNameInst
  let longNameInstExpr = bool( ((this.readOnly) and (this.hidden) and (this.system) and (this.volumeId)) )
  this.longNameInst = longNameInstExpr
  this.longNameInstFlag = true
  return this.longNameInst

proc fromFile*(_: typedesc[Vfat_RootDirectoryRec_AttrFlags], filename: string): Vfat_RootDirectoryRec_AttrFlags =
  Vfat_RootDirectoryRec_AttrFlags.read(newKaitaiFileStream(filename), nil, nil)


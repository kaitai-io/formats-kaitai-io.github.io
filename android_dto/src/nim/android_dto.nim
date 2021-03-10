import kaitai_struct_nim_runtime
import options

type
  AndroidDto* = ref object of KaitaiStruct
    `header`*: AndroidDto_DtTableHeader
    `entries`*: seq[AndroidDto_DtTableEntry]
    `parent`*: KaitaiStruct
  AndroidDto_DtTableHeader* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `totalSize`*: uint32
    `headerSize`*: uint32
    `dtEntrySize`*: uint32
    `dtEntryCount`*: uint32
    `dtEntriesOffset`*: uint32
    `pageSize`*: uint32
    `version`*: uint32
    `parent`*: AndroidDto
  AndroidDto_DtTableEntry* = ref object of KaitaiStruct
    `dtSize`*: uint32
    `dtOffset`*: uint32
    `id`*: uint32
    `rev`*: uint32
    `custom`*: seq[uint32]
    `parent`*: AndroidDto
    `bodyInst`*: seq[byte]

proc read*(_: typedesc[AndroidDto], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AndroidDto
proc read*(_: typedesc[AndroidDto_DtTableHeader], io: KaitaiStream, root: KaitaiStruct, parent: AndroidDto): AndroidDto_DtTableHeader
proc read*(_: typedesc[AndroidDto_DtTableEntry], io: KaitaiStream, root: KaitaiStruct, parent: AndroidDto): AndroidDto_DtTableEntry

proc body*(this: AndroidDto_DtTableEntry): seq[byte]


##[
Format for Android DTB/DTBO partitions. It's kind of archive with
dtb/dtbo files. Used only when there is a separate unique partition
(dtb, dtbo) on an android device to organize device tree files.
The format consists of a header with info about size and number
of device tree entries and the entries themselves. This format
description could be used to extract device tree entries from a
partition images and decompile them with dtc (device tree compiler).

@see <a href="https://source.android.com/devices/architecture/dto/partitions">Source</a>
@see <a href="https://android.googlesource.com/platform/system/libufdt/+/refs/tags/android-10.0.0_r47">Source</a>
]##
proc read*(_: typedesc[AndroidDto], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AndroidDto =
  template this: untyped = result
  this = new(AndroidDto)
  let root = if root == nil: cast[AndroidDto](this) else: cast[AndroidDto](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = AndroidDto_DtTableHeader.read(this.io, this.root, this)
  this.header = headerExpr
  for i in 0 ..< int(this.header.dtEntryCount):
    let it = AndroidDto_DtTableEntry.read(this.io, this.root, this)
    this.entries.add(it)

proc fromFile*(_: typedesc[AndroidDto], filename: string): AndroidDto =
  AndroidDto.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidDto_DtTableHeader], io: KaitaiStream, root: KaitaiStruct, parent: AndroidDto): AndroidDto_DtTableHeader =
  template this: untyped = result
  this = new(AndroidDto_DtTableHeader)
  let root = if root == nil: cast[AndroidDto](this) else: cast[AndroidDto](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr

  ##[
  includes dt_table_header + all dt_table_entry and all dtb/dtbo
  ]##
  let totalSizeExpr = this.io.readU4be()
  this.totalSize = totalSizeExpr

  ##[
  sizeof(dt_table_header)
  ]##
  let headerSizeExpr = this.io.readU4be()
  this.headerSize = headerSizeExpr

  ##[
  sizeof(dt_table_entry)
  ]##
  let dtEntrySizeExpr = this.io.readU4be()
  this.dtEntrySize = dtEntrySizeExpr

  ##[
  number of dt_table_entry
  ]##
  let dtEntryCountExpr = this.io.readU4be()
  this.dtEntryCount = dtEntryCountExpr

  ##[
  offset to the first dt_table_entry from head of dt_table_header
  ]##
  let dtEntriesOffsetExpr = this.io.readU4be()
  this.dtEntriesOffset = dtEntriesOffsetExpr

  ##[
  flash page size
  ]##
  let pageSizeExpr = this.io.readU4be()
  this.pageSize = pageSizeExpr

  ##[
  DTBO image version
  ]##
  let versionExpr = this.io.readU4be()
  this.version = versionExpr

proc fromFile*(_: typedesc[AndroidDto_DtTableHeader], filename: string): AndroidDto_DtTableHeader =
  AndroidDto_DtTableHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AndroidDto_DtTableEntry], io: KaitaiStream, root: KaitaiStruct, parent: AndroidDto): AndroidDto_DtTableEntry =
  template this: untyped = result
  this = new(AndroidDto_DtTableEntry)
  let root = if root == nil: cast[AndroidDto](this) else: cast[AndroidDto](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  size of this entry
  ]##
  let dtSizeExpr = this.io.readU4be()
  this.dtSize = dtSizeExpr

  ##[
  offset from head of dt_table_header
  ]##
  let dtOffsetExpr = this.io.readU4be()
  this.dtOffset = dtOffsetExpr

  ##[
  optional, must be zero if unused
  ]##
  let idExpr = this.io.readU4be()
  this.id = idExpr

  ##[
  optional, must be zero if unused
  ]##
  let revExpr = this.io.readU4be()
  this.rev = revExpr

  ##[
  optional, must be zero if unused
  ]##
  for i in 0 ..< int(4):
    let it = this.io.readU4be()
    this.custom.add(it)

proc body(this: AndroidDto_DtTableEntry): seq[byte] = 

  ##[
  DTB/DTBO file
  ]##
  if this.bodyInst.len != 0:
    return this.bodyInst
  let io = AndroidDto(this.root).io
  let pos = io.pos()
  io.seek(int(this.dtOffset))
  let bodyInstExpr = io.readBytes(int(this.dtSize))
  this.bodyInst = bodyInstExpr
  io.seek(pos)
  if this.bodyInst.len != 0:
    return this.bodyInst

proc fromFile*(_: typedesc[AndroidDto_DtTableEntry], filename: string): AndroidDto_DtTableEntry =
  AndroidDto_DtTableEntry.read(newKaitaiFileStream(filename), nil, nil)


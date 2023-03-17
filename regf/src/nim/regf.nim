import kaitai_struct_nim_runtime
import options

type
  Regf* = ref object of KaitaiStruct
    `header`*: Regf_FileHeader
    `hiveBins`*: seq[Regf_HiveBin]
    `parent`*: KaitaiStruct
    `rawHiveBins`*: seq[seq[byte]]
  Regf_Filetime* = ref object of KaitaiStruct
    `value`*: uint64
    `parent`*: KaitaiStruct
  Regf_HiveBin* = ref object of KaitaiStruct
    `header`*: Regf_HiveBinHeader
    `cells`*: seq[Regf_HiveBinCell]
    `parent`*: Regf
  Regf_HiveBinHeader* = ref object of KaitaiStruct
    `signature`*: seq[byte]
    `offset`*: uint32
    `size`*: uint32
    `unknown1`*: uint32
    `unknown2`*: uint32
    `timestamp`*: Regf_Filetime
    `unknown4`*: uint32
    `parent`*: Regf_HiveBin
  Regf_HiveBinCell* = ref object of KaitaiStruct
    `cellSizeRaw`*: int32
    `identifier`*: string
    `data`*: KaitaiStruct
    `parent`*: Regf_HiveBin
    `rawData`*: seq[byte]
    `cellSizeInst`: int
    `cellSizeInstFlag`: bool
    `isAllocatedInst`: bool
    `isAllocatedInstFlag`: bool
  Regf_HiveBinCell_SubKeyListVk* = ref object of KaitaiStruct
    `valueNameSize`*: uint16
    `dataSize`*: uint32
    `dataOffset`*: uint32
    `dataType`*: Regf_HiveBinCell_SubKeyListVk_DataTypeEnum
    `flags`*: Regf_HiveBinCell_SubKeyListVk_VkFlags
    `padding`*: uint16
    `valueName`*: string
    `parent`*: Regf_HiveBinCell
  Regf_HiveBinCell_SubKeyListVk_DataTypeEnum* = enum
    reg_none = 0
    reg_sz = 1
    reg_expand_sz = 2
    reg_binary = 3
    reg_dword = 4
    reg_dword_big_endian = 5
    reg_link = 6
    reg_multi_sz = 7
    reg_resource_list = 8
    reg_full_resource_descriptor = 9
    reg_resource_requirements_list = 10
    reg_qword = 11
  Regf_HiveBinCell_SubKeyListVk_VkFlags* = enum
    value_comp_name = 1
  Regf_HiveBinCell_SubKeyListLhLf* = ref object of KaitaiStruct
    `count`*: uint16
    `items`*: seq[Regf_HiveBinCell_SubKeyListLhLf_Item]
    `parent`*: Regf_HiveBinCell
  Regf_HiveBinCell_SubKeyListLhLf_Item* = ref object of KaitaiStruct
    `namedKeyOffset`*: uint32
    `hashValue`*: uint32
    `parent`*: Regf_HiveBinCell_SubKeyListLhLf
  Regf_HiveBinCell_SubKeyListSk* = ref object of KaitaiStruct
    `unknown1`*: uint16
    `previousSecurityKeyOffset`*: uint32
    `nextSecurityKeyOffset`*: uint32
    `referenceCount`*: uint32
    `parent`*: Regf_HiveBinCell
  Regf_HiveBinCell_SubKeyListLi* = ref object of KaitaiStruct
    `count`*: uint16
    `items`*: seq[Regf_HiveBinCell_SubKeyListLi_Item]
    `parent`*: Regf_HiveBinCell
  Regf_HiveBinCell_SubKeyListLi_Item* = ref object of KaitaiStruct
    `namedKeyOffset`*: uint32
    `parent`*: Regf_HiveBinCell_SubKeyListLi
  Regf_HiveBinCell_NamedKey* = ref object of KaitaiStruct
    `flags`*: Regf_HiveBinCell_NamedKey_NkFlags
    `lastKeyWrittenDateAndTime`*: Regf_Filetime
    `unknown1`*: uint32
    `parentKeyOffset`*: uint32
    `numberOfSubKeys`*: uint32
    `numberOfVolatileSubKeys`*: uint32
    `subKeysListOffset`*: uint32
    `numberOfValues`*: uint32
    `valuesListOffset`*: uint32
    `securityKeyOffset`*: uint32
    `classNameOffset`*: uint32
    `largestSubKeyNameSize`*: uint32
    `largestSubKeyClassNameSize`*: uint32
    `largestValueNameSize`*: uint32
    `largestValueDataSize`*: uint32
    `unknown2`*: uint32
    `keyNameSize`*: uint16
    `classNameSize`*: uint16
    `unknownStringSize`*: uint32
    `unknownString`*: string
    `parent`*: Regf_HiveBinCell
  Regf_HiveBinCell_NamedKey_NkFlags* = enum
    key_is_volatile = 1
    key_hive_exit = 2
    key_hive_entry = 4
    key_no_delete = 8
    key_sym_link = 16
    key_comp_name = 32
    key_prefef_handle = 64
    key_virt_mirrored = 128
    key_virt_target = 256
    key_virtual_store = 512
    unknown1 = 4096
    unknown2 = 16384
  Regf_HiveBinCell_SubKeyListRi* = ref object of KaitaiStruct
    `count`*: uint16
    `items`*: seq[Regf_HiveBinCell_SubKeyListRi_Item]
    `parent`*: Regf_HiveBinCell
  Regf_HiveBinCell_SubKeyListRi_Item* = ref object of KaitaiStruct
    `subKeyListOffset`*: uint32
    `parent`*: Regf_HiveBinCell_SubKeyListRi
  Regf_FileHeader* = ref object of KaitaiStruct
    `signature`*: seq[byte]
    `primarySequenceNumber`*: uint32
    `secondarySequenceNumber`*: uint32
    `lastModificationDateAndTime`*: Regf_Filetime
    `majorVersion`*: uint32
    `minorVersion`*: uint32
    `type`*: Regf_FileHeader_FileType
    `format`*: Regf_FileHeader_FileFormat
    `rootKeyOffset`*: uint32
    `hiveBinsDataSize`*: uint32
    `clusteringFactor`*: uint32
    `unknown1`*: seq[byte]
    `unknown2`*: seq[byte]
    `checksum`*: uint32
    `reserved`*: seq[byte]
    `bootType`*: uint32
    `bootRecover`*: uint32
    `parent`*: Regf
  Regf_FileHeader_FileType* = enum
    normal = 0
    transaction_log = 1
  Regf_FileHeader_FileFormat* = enum
    direct_memory_load = 1

proc read*(_: typedesc[Regf], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Regf
proc read*(_: typedesc[Regf_Filetime], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Regf_Filetime
proc read*(_: typedesc[Regf_HiveBin], io: KaitaiStream, root: KaitaiStruct, parent: Regf): Regf_HiveBin
proc read*(_: typedesc[Regf_HiveBinHeader], io: KaitaiStream, root: KaitaiStruct, parent: Regf_HiveBin): Regf_HiveBinHeader
proc read*(_: typedesc[Regf_HiveBinCell], io: KaitaiStream, root: KaitaiStruct, parent: Regf_HiveBin): Regf_HiveBinCell
proc read*(_: typedesc[Regf_HiveBinCell_SubKeyListVk], io: KaitaiStream, root: KaitaiStruct, parent: Regf_HiveBinCell): Regf_HiveBinCell_SubKeyListVk
proc read*(_: typedesc[Regf_HiveBinCell_SubKeyListLhLf], io: KaitaiStream, root: KaitaiStruct, parent: Regf_HiveBinCell): Regf_HiveBinCell_SubKeyListLhLf
proc read*(_: typedesc[Regf_HiveBinCell_SubKeyListLhLf_Item], io: KaitaiStream, root: KaitaiStruct, parent: Regf_HiveBinCell_SubKeyListLhLf): Regf_HiveBinCell_SubKeyListLhLf_Item
proc read*(_: typedesc[Regf_HiveBinCell_SubKeyListSk], io: KaitaiStream, root: KaitaiStruct, parent: Regf_HiveBinCell): Regf_HiveBinCell_SubKeyListSk
proc read*(_: typedesc[Regf_HiveBinCell_SubKeyListLi], io: KaitaiStream, root: KaitaiStruct, parent: Regf_HiveBinCell): Regf_HiveBinCell_SubKeyListLi
proc read*(_: typedesc[Regf_HiveBinCell_SubKeyListLi_Item], io: KaitaiStream, root: KaitaiStruct, parent: Regf_HiveBinCell_SubKeyListLi): Regf_HiveBinCell_SubKeyListLi_Item
proc read*(_: typedesc[Regf_HiveBinCell_NamedKey], io: KaitaiStream, root: KaitaiStruct, parent: Regf_HiveBinCell): Regf_HiveBinCell_NamedKey
proc read*(_: typedesc[Regf_HiveBinCell_SubKeyListRi], io: KaitaiStream, root: KaitaiStruct, parent: Regf_HiveBinCell): Regf_HiveBinCell_SubKeyListRi
proc read*(_: typedesc[Regf_HiveBinCell_SubKeyListRi_Item], io: KaitaiStream, root: KaitaiStruct, parent: Regf_HiveBinCell_SubKeyListRi): Regf_HiveBinCell_SubKeyListRi_Item
proc read*(_: typedesc[Regf_FileHeader], io: KaitaiStream, root: KaitaiStruct, parent: Regf): Regf_FileHeader

proc cellSize*(this: Regf_HiveBinCell): int
proc isAllocated*(this: Regf_HiveBinCell): bool


##[
This spec allows to parse files used by Microsoft Windows family of
operating systems to store parts of its "registry". "Registry" is a
hierarchical database that is used to store system settings (global
configuration, per-user, per-application configuration, etc).

Typically, registry files are stored in:

* System-wide: several files in `%SystemRoot%\System32\Config\`
* User-wide:
  * `%USERPROFILE%\Ntuser.dat`
  * `%USERPROFILE%\Local Settings\Application Data\Microsoft\Windows\Usrclass.dat` (localized, Windows 2000, Server 2003 and Windows XP)
  * `%USERPROFILE%\AppData\Local\Microsoft\Windows\Usrclass.dat` (non-localized, Windows Vista and later)

Note that one typically can't access files directly on a mounted
filesystem with a running Windows OS.

@see <a href="https://github.com/libyal/libregf/blob/main/documentation/Windows%20NT%20Registry%20File%20(REGF)%20format.asciidoc">Source</a>
]##
proc read*(_: typedesc[Regf], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Regf =
  template this: untyped = result
  this = new(Regf)
  let root = if root == nil: cast[Regf](this) else: cast[Regf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = Regf_FileHeader.read(this.io, this.root, this)
  this.header = headerExpr
  block:
    var i: int
    while not this.io.isEof:
      let buf = this.io.readBytes(int(4096))
      this.rawHiveBins.add(buf)
      let rawHiveBinsIo = newKaitaiStream(buf)
      let it = Regf_HiveBin.read(rawHiveBinsIo, this.root, this)
      this.hiveBins.add(it)
      inc i

proc fromFile*(_: typedesc[Regf], filename: string): Regf =
  Regf.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Regf_Filetime], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Regf_Filetime =
  template this: untyped = result
  this = new(Regf_Filetime)
  let root = if root == nil: cast[Regf](this) else: cast[Regf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let valueExpr = this.io.readU8le()
  this.value = valueExpr

proc fromFile*(_: typedesc[Regf_Filetime], filename: string): Regf_Filetime =
  Regf_Filetime.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Regf_HiveBin], io: KaitaiStream, root: KaitaiStruct, parent: Regf): Regf_HiveBin =
  template this: untyped = result
  this = new(Regf_HiveBin)
  let root = if root == nil: cast[Regf](this) else: cast[Regf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = Regf_HiveBinHeader.read(this.io, this.root, this)
  this.header = headerExpr
  block:
    var i: int
    while not this.io.isEof:
      let it = Regf_HiveBinCell.read(this.io, this.root, this)
      this.cells.add(it)
      inc i

proc fromFile*(_: typedesc[Regf_HiveBin], filename: string): Regf_HiveBin =
  Regf_HiveBin.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Regf_HiveBinHeader], io: KaitaiStream, root: KaitaiStruct, parent: Regf_HiveBin): Regf_HiveBinHeader =
  template this: untyped = result
  this = new(Regf_HiveBinHeader)
  let root = if root == nil: cast[Regf](this) else: cast[Regf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let signatureExpr = this.io.readBytes(int(4))
  this.signature = signatureExpr

  ##[
  The offset of the hive bin, Value in bytes and relative from
the start of the hive bin data

  ]##
  let offsetExpr = this.io.readU4le()
  this.offset = offsetExpr

  ##[
  Size of the hive bin
  ]##
  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr

  ##[
  0 most of the time, can contain remnant data
  ]##
  let unknown1Expr = this.io.readU4le()
  this.unknown1 = unknown1Expr

  ##[
  0 most of the time, can contain remnant data
  ]##
  let unknown2Expr = this.io.readU4le()
  this.unknown2 = unknown2Expr

  ##[
  Only the root (first) hive bin seems to contain a valid FILETIME
  ]##
  let timestampExpr = Regf_Filetime.read(this.io, this.root, this)
  this.timestamp = timestampExpr

  ##[
  Contains number of bytes
  ]##
  let unknown4Expr = this.io.readU4le()
  this.unknown4 = unknown4Expr

proc fromFile*(_: typedesc[Regf_HiveBinHeader], filename: string): Regf_HiveBinHeader =
  Regf_HiveBinHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Regf_HiveBinCell], io: KaitaiStream, root: KaitaiStruct, parent: Regf_HiveBin): Regf_HiveBinCell =
  template this: untyped = result
  this = new(Regf_HiveBinCell)
  let root = if root == nil: cast[Regf](this) else: cast[Regf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let cellSizeRawExpr = this.io.readS4le()
  this.cellSizeRaw = cellSizeRawExpr
  let identifierExpr = encode(this.io.readBytes(int(2)), "ascii")
  this.identifier = identifierExpr
  block:
    let on = this.identifier
    if on == "li":
      let rawDataExpr = this.io.readBytes(int(((this.cellSize - 2) - 4)))
      this.rawData = rawDataExpr
      let rawDataIo = newKaitaiStream(rawDataExpr)
      let dataExpr = Regf_HiveBinCell_SubKeyListLi.read(rawDataIo, this.root, this)
      this.data = dataExpr
    elif on == "vk":
      let rawDataExpr = this.io.readBytes(int(((this.cellSize - 2) - 4)))
      this.rawData = rawDataExpr
      let rawDataIo = newKaitaiStream(rawDataExpr)
      let dataExpr = Regf_HiveBinCell_SubKeyListVk.read(rawDataIo, this.root, this)
      this.data = dataExpr
    elif on == "lf":
      let rawDataExpr = this.io.readBytes(int(((this.cellSize - 2) - 4)))
      this.rawData = rawDataExpr
      let rawDataIo = newKaitaiStream(rawDataExpr)
      let dataExpr = Regf_HiveBinCell_SubKeyListLhLf.read(rawDataIo, this.root, this)
      this.data = dataExpr
    elif on == "ri":
      let rawDataExpr = this.io.readBytes(int(((this.cellSize - 2) - 4)))
      this.rawData = rawDataExpr
      let rawDataIo = newKaitaiStream(rawDataExpr)
      let dataExpr = Regf_HiveBinCell_SubKeyListRi.read(rawDataIo, this.root, this)
      this.data = dataExpr
    elif on == "lh":
      let rawDataExpr = this.io.readBytes(int(((this.cellSize - 2) - 4)))
      this.rawData = rawDataExpr
      let rawDataIo = newKaitaiStream(rawDataExpr)
      let dataExpr = Regf_HiveBinCell_SubKeyListLhLf.read(rawDataIo, this.root, this)
      this.data = dataExpr
    elif on == "nk":
      let rawDataExpr = this.io.readBytes(int(((this.cellSize - 2) - 4)))
      this.rawData = rawDataExpr
      let rawDataIo = newKaitaiStream(rawDataExpr)
      let dataExpr = Regf_HiveBinCell_NamedKey.read(rawDataIo, this.root, this)
      this.data = dataExpr
    elif on == "sk":
      let rawDataExpr = this.io.readBytes(int(((this.cellSize - 2) - 4)))
      this.rawData = rawDataExpr
      let rawDataIo = newKaitaiStream(rawDataExpr)
      let dataExpr = Regf_HiveBinCell_SubKeyListSk.read(rawDataIo, this.root, this)
      this.data = dataExpr
    else:
      let dataExpr = this.io.readBytes(int(((this.cellSize - 2) - 4)))
      this.data = dataExpr

proc cellSize(this: Regf_HiveBinCell): int = 
  if this.cellSizeInstFlag:
    return this.cellSizeInst
  let cellSizeInstExpr = int(((if this.cellSizeRaw < 0: -1 else: 1) * this.cellSizeRaw))
  this.cellSizeInst = cellSizeInstExpr
  this.cellSizeInstFlag = true
  return this.cellSizeInst

proc isAllocated(this: Regf_HiveBinCell): bool = 
  if this.isAllocatedInstFlag:
    return this.isAllocatedInst
  let isAllocatedInstExpr = bool(this.cellSizeRaw < 0)
  this.isAllocatedInst = isAllocatedInstExpr
  this.isAllocatedInstFlag = true
  return this.isAllocatedInst

proc fromFile*(_: typedesc[Regf_HiveBinCell], filename: string): Regf_HiveBinCell =
  Regf_HiveBinCell.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Regf_HiveBinCell_SubKeyListVk], io: KaitaiStream, root: KaitaiStruct, parent: Regf_HiveBinCell): Regf_HiveBinCell_SubKeyListVk =
  template this: untyped = result
  this = new(Regf_HiveBinCell_SubKeyListVk)
  let root = if root == nil: cast[Regf](this) else: cast[Regf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let valueNameSizeExpr = this.io.readU2le()
  this.valueNameSize = valueNameSizeExpr
  let dataSizeExpr = this.io.readU4le()
  this.dataSize = dataSizeExpr
  let dataOffsetExpr = this.io.readU4le()
  this.dataOffset = dataOffsetExpr
  let dataTypeExpr = Regf_HiveBinCell_SubKeyListVk_DataTypeEnum(this.io.readU4le())
  this.dataType = dataTypeExpr
  let flagsExpr = Regf_HiveBinCell_SubKeyListVk_VkFlags(this.io.readU2le())
  this.flags = flagsExpr
  let paddingExpr = this.io.readU2le()
  this.padding = paddingExpr
  if this.flags == regf.value_comp_name:
    let valueNameExpr = encode(this.io.readBytes(int(this.valueNameSize)), "ascii")
    this.valueName = valueNameExpr

proc fromFile*(_: typedesc[Regf_HiveBinCell_SubKeyListVk], filename: string): Regf_HiveBinCell_SubKeyListVk =
  Regf_HiveBinCell_SubKeyListVk.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Regf_HiveBinCell_SubKeyListLhLf], io: KaitaiStream, root: KaitaiStruct, parent: Regf_HiveBinCell): Regf_HiveBinCell_SubKeyListLhLf =
  template this: untyped = result
  this = new(Regf_HiveBinCell_SubKeyListLhLf)
  let root = if root == nil: cast[Regf](this) else: cast[Regf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let countExpr = this.io.readU2le()
  this.count = countExpr
  for i in 0 ..< int(this.count):
    let it = Regf_HiveBinCell_SubKeyListLhLf_Item.read(this.io, this.root, this)
    this.items.add(it)

proc fromFile*(_: typedesc[Regf_HiveBinCell_SubKeyListLhLf], filename: string): Regf_HiveBinCell_SubKeyListLhLf =
  Regf_HiveBinCell_SubKeyListLhLf.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Regf_HiveBinCell_SubKeyListLhLf_Item], io: KaitaiStream, root: KaitaiStruct, parent: Regf_HiveBinCell_SubKeyListLhLf): Regf_HiveBinCell_SubKeyListLhLf_Item =
  template this: untyped = result
  this = new(Regf_HiveBinCell_SubKeyListLhLf_Item)
  let root = if root == nil: cast[Regf](this) else: cast[Regf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let namedKeyOffsetExpr = this.io.readU4le()
  this.namedKeyOffset = namedKeyOffsetExpr
  let hashValueExpr = this.io.readU4le()
  this.hashValue = hashValueExpr

proc fromFile*(_: typedesc[Regf_HiveBinCell_SubKeyListLhLf_Item], filename: string): Regf_HiveBinCell_SubKeyListLhLf_Item =
  Regf_HiveBinCell_SubKeyListLhLf_Item.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Regf_HiveBinCell_SubKeyListSk], io: KaitaiStream, root: KaitaiStruct, parent: Regf_HiveBinCell): Regf_HiveBinCell_SubKeyListSk =
  template this: untyped = result
  this = new(Regf_HiveBinCell_SubKeyListSk)
  let root = if root == nil: cast[Regf](this) else: cast[Regf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let unknown1Expr = this.io.readU2le()
  this.unknown1 = unknown1Expr
  let previousSecurityKeyOffsetExpr = this.io.readU4le()
  this.previousSecurityKeyOffset = previousSecurityKeyOffsetExpr
  let nextSecurityKeyOffsetExpr = this.io.readU4le()
  this.nextSecurityKeyOffset = nextSecurityKeyOffsetExpr
  let referenceCountExpr = this.io.readU4le()
  this.referenceCount = referenceCountExpr

proc fromFile*(_: typedesc[Regf_HiveBinCell_SubKeyListSk], filename: string): Regf_HiveBinCell_SubKeyListSk =
  Regf_HiveBinCell_SubKeyListSk.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Regf_HiveBinCell_SubKeyListLi], io: KaitaiStream, root: KaitaiStruct, parent: Regf_HiveBinCell): Regf_HiveBinCell_SubKeyListLi =
  template this: untyped = result
  this = new(Regf_HiveBinCell_SubKeyListLi)
  let root = if root == nil: cast[Regf](this) else: cast[Regf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let countExpr = this.io.readU2le()
  this.count = countExpr
  for i in 0 ..< int(this.count):
    let it = Regf_HiveBinCell_SubKeyListLi_Item.read(this.io, this.root, this)
    this.items.add(it)

proc fromFile*(_: typedesc[Regf_HiveBinCell_SubKeyListLi], filename: string): Regf_HiveBinCell_SubKeyListLi =
  Regf_HiveBinCell_SubKeyListLi.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Regf_HiveBinCell_SubKeyListLi_Item], io: KaitaiStream, root: KaitaiStruct, parent: Regf_HiveBinCell_SubKeyListLi): Regf_HiveBinCell_SubKeyListLi_Item =
  template this: untyped = result
  this = new(Regf_HiveBinCell_SubKeyListLi_Item)
  let root = if root == nil: cast[Regf](this) else: cast[Regf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let namedKeyOffsetExpr = this.io.readU4le()
  this.namedKeyOffset = namedKeyOffsetExpr

proc fromFile*(_: typedesc[Regf_HiveBinCell_SubKeyListLi_Item], filename: string): Regf_HiveBinCell_SubKeyListLi_Item =
  Regf_HiveBinCell_SubKeyListLi_Item.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Regf_HiveBinCell_NamedKey], io: KaitaiStream, root: KaitaiStruct, parent: Regf_HiveBinCell): Regf_HiveBinCell_NamedKey =
  template this: untyped = result
  this = new(Regf_HiveBinCell_NamedKey)
  let root = if root == nil: cast[Regf](this) else: cast[Regf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let flagsExpr = Regf_HiveBinCell_NamedKey_NkFlags(this.io.readU2le())
  this.flags = flagsExpr
  let lastKeyWrittenDateAndTimeExpr = Regf_Filetime.read(this.io, this.root, this)
  this.lastKeyWrittenDateAndTime = lastKeyWrittenDateAndTimeExpr
  let unknown1Expr = this.io.readU4le()
  this.unknown1 = unknown1Expr
  let parentKeyOffsetExpr = this.io.readU4le()
  this.parentKeyOffset = parentKeyOffsetExpr
  let numberOfSubKeysExpr = this.io.readU4le()
  this.numberOfSubKeys = numberOfSubKeysExpr
  let numberOfVolatileSubKeysExpr = this.io.readU4le()
  this.numberOfVolatileSubKeys = numberOfVolatileSubKeysExpr
  let subKeysListOffsetExpr = this.io.readU4le()
  this.subKeysListOffset = subKeysListOffsetExpr
  let numberOfValuesExpr = this.io.readU4le()
  this.numberOfValues = numberOfValuesExpr
  let valuesListOffsetExpr = this.io.readU4le()
  this.valuesListOffset = valuesListOffsetExpr
  let securityKeyOffsetExpr = this.io.readU4le()
  this.securityKeyOffset = securityKeyOffsetExpr
  let classNameOffsetExpr = this.io.readU4le()
  this.classNameOffset = classNameOffsetExpr
  let largestSubKeyNameSizeExpr = this.io.readU4le()
  this.largestSubKeyNameSize = largestSubKeyNameSizeExpr
  let largestSubKeyClassNameSizeExpr = this.io.readU4le()
  this.largestSubKeyClassNameSize = largestSubKeyClassNameSizeExpr
  let largestValueNameSizeExpr = this.io.readU4le()
  this.largestValueNameSize = largestValueNameSizeExpr
  let largestValueDataSizeExpr = this.io.readU4le()
  this.largestValueDataSize = largestValueDataSizeExpr
  let unknown2Expr = this.io.readU4le()
  this.unknown2 = unknown2Expr
  let keyNameSizeExpr = this.io.readU2le()
  this.keyNameSize = keyNameSizeExpr
  let classNameSizeExpr = this.io.readU2le()
  this.classNameSize = classNameSizeExpr
  let unknownStringSizeExpr = this.io.readU4le()
  this.unknownStringSize = unknownStringSizeExpr
  let unknownStringExpr = encode(this.io.readBytes(int(this.unknownStringSize)), "ascii")
  this.unknownString = unknownStringExpr

proc fromFile*(_: typedesc[Regf_HiveBinCell_NamedKey], filename: string): Regf_HiveBinCell_NamedKey =
  Regf_HiveBinCell_NamedKey.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Regf_HiveBinCell_SubKeyListRi], io: KaitaiStream, root: KaitaiStruct, parent: Regf_HiveBinCell): Regf_HiveBinCell_SubKeyListRi =
  template this: untyped = result
  this = new(Regf_HiveBinCell_SubKeyListRi)
  let root = if root == nil: cast[Regf](this) else: cast[Regf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let countExpr = this.io.readU2le()
  this.count = countExpr
  for i in 0 ..< int(this.count):
    let it = Regf_HiveBinCell_SubKeyListRi_Item.read(this.io, this.root, this)
    this.items.add(it)

proc fromFile*(_: typedesc[Regf_HiveBinCell_SubKeyListRi], filename: string): Regf_HiveBinCell_SubKeyListRi =
  Regf_HiveBinCell_SubKeyListRi.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Regf_HiveBinCell_SubKeyListRi_Item], io: KaitaiStream, root: KaitaiStruct, parent: Regf_HiveBinCell_SubKeyListRi): Regf_HiveBinCell_SubKeyListRi_Item =
  template this: untyped = result
  this = new(Regf_HiveBinCell_SubKeyListRi_Item)
  let root = if root == nil: cast[Regf](this) else: cast[Regf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let subKeyListOffsetExpr = this.io.readU4le()
  this.subKeyListOffset = subKeyListOffsetExpr

proc fromFile*(_: typedesc[Regf_HiveBinCell_SubKeyListRi_Item], filename: string): Regf_HiveBinCell_SubKeyListRi_Item =
  Regf_HiveBinCell_SubKeyListRi_Item.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Regf_FileHeader], io: KaitaiStream, root: KaitaiStruct, parent: Regf): Regf_FileHeader =
  template this: untyped = result
  this = new(Regf_FileHeader)
  let root = if root == nil: cast[Regf](this) else: cast[Regf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let signatureExpr = this.io.readBytes(int(4))
  this.signature = signatureExpr
  let primarySequenceNumberExpr = this.io.readU4le()
  this.primarySequenceNumber = primarySequenceNumberExpr
  let secondarySequenceNumberExpr = this.io.readU4le()
  this.secondarySequenceNumber = secondarySequenceNumberExpr
  let lastModificationDateAndTimeExpr = Regf_Filetime.read(this.io, this.root, this)
  this.lastModificationDateAndTime = lastModificationDateAndTimeExpr
  let majorVersionExpr = this.io.readU4le()
  this.majorVersion = majorVersionExpr
  let minorVersionExpr = this.io.readU4le()
  this.minorVersion = minorVersionExpr
  let typeExpr = Regf_FileHeader_FileType(this.io.readU4le())
  this.type = typeExpr
  let formatExpr = Regf_FileHeader_FileFormat(this.io.readU4le())
  this.format = formatExpr
  let rootKeyOffsetExpr = this.io.readU4le()
  this.rootKeyOffset = rootKeyOffsetExpr
  let hiveBinsDataSizeExpr = this.io.readU4le()
  this.hiveBinsDataSize = hiveBinsDataSizeExpr
  let clusteringFactorExpr = this.io.readU4le()
  this.clusteringFactor = clusteringFactorExpr
  let unknown1Expr = this.io.readBytes(int(64))
  this.unknown1 = unknown1Expr
  let unknown2Expr = this.io.readBytes(int(396))
  this.unknown2 = unknown2Expr
  let checksumExpr = this.io.readU4le()
  this.checksum = checksumExpr
  let reservedExpr = this.io.readBytes(int(3576))
  this.reserved = reservedExpr
  let bootTypeExpr = this.io.readU4le()
  this.bootType = bootTypeExpr
  let bootRecoverExpr = this.io.readU4le()
  this.bootRecover = bootRecoverExpr

proc fromFile*(_: typedesc[Regf_FileHeader], filename: string): Regf_FileHeader =
  Regf_FileHeader.read(newKaitaiFileStream(filename), nil, nil)


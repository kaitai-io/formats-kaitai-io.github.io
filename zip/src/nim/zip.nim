import kaitai_struct_nim_runtime
import options
import dos_datetime

type
  Zip* = ref object of KaitaiStruct
    `sections`*: seq[Zip_PkSection]
    `parent`*: KaitaiStruct
  Zip_Compression* = enum
    none = 0
    shrunk = 1
    reduced_1 = 2
    reduced_2 = 3
    reduced_3 = 4
    reduced_4 = 5
    imploded = 6
    deflated = 8
    enhanced_deflated = 9
    pkware_dcl_imploded = 10
    bzip2 = 12
    lzma = 14
    ibm_terse = 18
    ibm_lz77_z = 19
    zstandard = 93
    mp3 = 94
    xz = 95
    jpeg = 96
    wavpack = 97
    ppmd = 98
    aex_encryption_marker = 99
  Zip_ExtraCodes* = enum
    zip64 = 1
    av_info = 7
    os2 = 9
    ntfs = 10
    openvms = 12
    pkware_unix = 13
    file_stream_and_fork_descriptors = 14
    patch_descriptor = 15
    pkcs7 = 20
    x509_cert_id_and_signature_for_file = 21
    x509_cert_id_for_central_dir = 22
    strong_encryption_header = 23
    record_management_controls = 24
    pkcs7_enc_recip_cert_list = 25
    ibm_s390_uncomp = 101
    ibm_s390_comp = 102
    poszip_4690 = 18064
    extended_timestamp = 21589
    beos = 25922
    asi_unix = 30062
    infozip_unix = 30805
    infozip_unix_var_size = 30837
    aex_encryption = 39169
    apache_commons_compress = 41246
    microsoft_open_packaging_growth_hint = 41504
    sms_qdos = 64842
  Zip_CentralDirEntry* = ref object of KaitaiStruct
    `versionMadeBy`*: uint16
    `versionNeededToExtract`*: uint16
    `flags`*: uint16
    `compressionMethod`*: Zip_Compression
    `fileModTime`*: DosDatetime
    `crc32`*: uint32
    `lenBodyCompressed`*: uint32
    `lenBodyUncompressed`*: uint32
    `lenFileName`*: uint16
    `lenExtra`*: uint16
    `lenComment`*: uint16
    `diskNumberStart`*: uint16
    `intFileAttr`*: uint16
    `extFileAttr`*: uint32
    `ofsLocalHeader`*: int32
    `fileName`*: string
    `extra`*: Zip_Extras
    `comment`*: string
    `parent`*: Zip_PkSection
    `rawFileModTime`*: seq[byte]
    `rawExtra`*: seq[byte]
    `localHeaderInst`: Zip_PkSection
    `localHeaderInstFlag`: bool
  Zip_DataDescriptor* = ref object of KaitaiStruct
    `crc32`*: uint32
    `lenBodyCompressed`*: uint32
    `lenBodyUncompressed`*: uint32
    `parent`*: Zip_PkSection
  Zip_EndOfCentralDir* = ref object of KaitaiStruct
    `diskOfEndOfCentralDir`*: uint16
    `diskOfCentralDir`*: uint16
    `numCentralDirEntriesOnDisk`*: uint16
    `numCentralDirEntriesTotal`*: uint16
    `lenCentralDir`*: uint32
    `ofsCentralDir`*: uint32
    `lenComment`*: uint16
    `comment`*: string
    `parent`*: Zip_PkSection
  Zip_ExtraField* = ref object of KaitaiStruct
    `code`*: Zip_ExtraCodes
    `lenBody`*: uint16
    `body`*: KaitaiStruct
    `parent`*: Zip_Extras
    `rawBody`*: seq[byte]
  Zip_ExtraField_ExtendedTimestamp* = ref object of KaitaiStruct
    `flags`*: Zip_ExtraField_ExtendedTimestamp_InfoFlags
    `modTime`*: uint32
    `accessTime`*: uint32
    `createTime`*: uint32
    `parent`*: Zip_ExtraField
    `rawFlags`*: seq[byte]
  Zip_ExtraField_ExtendedTimestamp_InfoFlags* = ref object of KaitaiStruct
    `hasModTime`*: bool
    `hasAccessTime`*: bool
    `hasCreateTime`*: bool
    `reserved`*: uint64
    `parent`*: Zip_ExtraField_ExtendedTimestamp
  Zip_ExtraField_InfozipUnixVarSize* = ref object of KaitaiStruct
    `version`*: uint8
    `lenUid`*: uint8
    `uid`*: seq[byte]
    `lenGid`*: uint8
    `gid`*: seq[byte]
    `parent`*: Zip_ExtraField
  Zip_ExtraField_Ntfs* = ref object of KaitaiStruct
    `reserved`*: uint32
    `attributes`*: seq[Zip_ExtraField_Ntfs_Attribute]
    `parent`*: Zip_ExtraField
  Zip_ExtraField_Ntfs_Attribute* = ref object of KaitaiStruct
    `tag`*: uint16
    `lenBody`*: uint16
    `body`*: KaitaiStruct
    `parent`*: Zip_ExtraField_Ntfs
    `rawBody`*: seq[byte]
  Zip_ExtraField_Ntfs_Attribute1* = ref object of KaitaiStruct
    `lastModTime`*: uint64
    `lastAccessTime`*: uint64
    `creationTime`*: uint64
    `parent`*: Zip_ExtraField_Ntfs_Attribute
  Zip_Extras* = ref object of KaitaiStruct
    `entries`*: seq[Zip_ExtraField]
    `parent`*: KaitaiStruct
  Zip_LocalFile* = ref object of KaitaiStruct
    `header`*: Zip_LocalFileHeader
    `body`*: seq[byte]
    `parent`*: Zip_PkSection
  Zip_LocalFileHeader* = ref object of KaitaiStruct
    `version`*: uint16
    `flags`*: Zip_LocalFileHeader_GpFlags
    `compressionMethod`*: Zip_Compression
    `fileModTime`*: DosDatetime
    `crc32`*: uint32
    `lenBodyCompressed`*: uint32
    `lenBodyUncompressed`*: uint32
    `lenFileName`*: uint16
    `lenExtra`*: uint16
    `fileName`*: string
    `extra`*: Zip_Extras
    `parent`*: Zip_LocalFile
    `rawFlags`*: seq[byte]
    `rawFileModTime`*: seq[byte]
    `rawExtra`*: seq[byte]
  Zip_LocalFileHeader_GpFlags* = ref object of KaitaiStruct
    `fileEncrypted`*: bool
    `compOptionsRaw`*: uint64
    `hasDataDescriptor`*: bool
    `reserved1`*: bool
    `compPatchedData`*: bool
    `strongEncrypt`*: bool
    `reserved2`*: uint64
    `langEncoding`*: bool
    `reserved3`*: bool
    `maskHeaderValues`*: bool
    `reserved4`*: uint64
    `parent`*: Zip_LocalFileHeader
    `deflatedModeInst`: Zip_LocalFileHeader_GpFlags_DeflateMode
    `deflatedModeInstFlag`: bool
    `implodedDictByteSizeInst`: int
    `implodedDictByteSizeInstFlag`: bool
    `implodedNumSfTreesInst`: int8
    `implodedNumSfTreesInstFlag`: bool
    `lzmaHasEosMarkerInst`: bool
    `lzmaHasEosMarkerInstFlag`: bool
  Zip_LocalFileHeader_GpFlags_DeflateMode* = enum
    normal = 0
    maximum = 1
    fast = 2
    super_fast = 3
  Zip_PkSection* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `sectionType`*: uint16
    `body`*: KaitaiStruct
    `parent`*: KaitaiStruct

proc read*(_: typedesc[Zip], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Zip
proc read*(_: typedesc[Zip_CentralDirEntry], io: KaitaiStream, root: KaitaiStruct, parent: Zip_PkSection): Zip_CentralDirEntry
proc read*(_: typedesc[Zip_DataDescriptor], io: KaitaiStream, root: KaitaiStruct, parent: Zip_PkSection): Zip_DataDescriptor
proc read*(_: typedesc[Zip_EndOfCentralDir], io: KaitaiStream, root: KaitaiStruct, parent: Zip_PkSection): Zip_EndOfCentralDir
proc read*(_: typedesc[Zip_ExtraField], io: KaitaiStream, root: KaitaiStruct, parent: Zip_Extras): Zip_ExtraField
proc read*(_: typedesc[Zip_ExtraField_ExtendedTimestamp], io: KaitaiStream, root: KaitaiStruct, parent: Zip_ExtraField): Zip_ExtraField_ExtendedTimestamp
proc read*(_: typedesc[Zip_ExtraField_ExtendedTimestamp_InfoFlags], io: KaitaiStream, root: KaitaiStruct, parent: Zip_ExtraField_ExtendedTimestamp): Zip_ExtraField_ExtendedTimestamp_InfoFlags
proc read*(_: typedesc[Zip_ExtraField_InfozipUnixVarSize], io: KaitaiStream, root: KaitaiStruct, parent: Zip_ExtraField): Zip_ExtraField_InfozipUnixVarSize
proc read*(_: typedesc[Zip_ExtraField_Ntfs], io: KaitaiStream, root: KaitaiStruct, parent: Zip_ExtraField): Zip_ExtraField_Ntfs
proc read*(_: typedesc[Zip_ExtraField_Ntfs_Attribute], io: KaitaiStream, root: KaitaiStruct, parent: Zip_ExtraField_Ntfs): Zip_ExtraField_Ntfs_Attribute
proc read*(_: typedesc[Zip_ExtraField_Ntfs_Attribute1], io: KaitaiStream, root: KaitaiStruct, parent: Zip_ExtraField_Ntfs_Attribute): Zip_ExtraField_Ntfs_Attribute1
proc read*(_: typedesc[Zip_Extras], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Zip_Extras
proc read*(_: typedesc[Zip_LocalFile], io: KaitaiStream, root: KaitaiStruct, parent: Zip_PkSection): Zip_LocalFile
proc read*(_: typedesc[Zip_LocalFileHeader], io: KaitaiStream, root: KaitaiStruct, parent: Zip_LocalFile): Zip_LocalFileHeader
proc read*(_: typedesc[Zip_LocalFileHeader_GpFlags], io: KaitaiStream, root: KaitaiStruct, parent: Zip_LocalFileHeader): Zip_LocalFileHeader_GpFlags
proc read*(_: typedesc[Zip_PkSection], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Zip_PkSection

proc localHeader*(this: Zip_CentralDirEntry): Zip_PkSection
proc deflatedMode*(this: Zip_LocalFileHeader_GpFlags): Zip_LocalFileHeader_GpFlags_DeflateMode
proc implodedDictByteSize*(this: Zip_LocalFileHeader_GpFlags): int
proc implodedNumSfTrees*(this: Zip_LocalFileHeader_GpFlags): int8
proc lzmaHasEosMarker*(this: Zip_LocalFileHeader_GpFlags): bool


##[
ZIP is a popular archive file format, introduced in 1989 by Phil Katz
and originally implemented in PKZIP utility by PKWARE.

Thanks to solid support of it in most desktop environments and
operating systems, and algorithms / specs availability in public
domain, it quickly became tool of choice for implementing file
containers.

For example, Java .jar files, OpenDocument, Office Open XML, EPUB files
are actually ZIP archives.

@see <a href="https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT">Source</a>
@see <a href="https://users.cs.jmu.edu/buchhofp/forensics/formats/pkzip.html">Source</a>
]##
proc read*(_: typedesc[Zip], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Zip =
  template this: untyped = result
  this = new(Zip)
  let root = if root == nil: cast[Zip](this) else: cast[Zip](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Zip_PkSection.read(this.io, this.root, this)
      this.sections.add(it)
      inc i

proc fromFile*(_: typedesc[Zip], filename: string): Zip =
  Zip.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT">- 4.3.12</a>
]##
proc read*(_: typedesc[Zip_CentralDirEntry], io: KaitaiStream, root: KaitaiStruct, parent: Zip_PkSection): Zip_CentralDirEntry =
  template this: untyped = result
  this = new(Zip_CentralDirEntry)
  let root = if root == nil: cast[Zip](this) else: cast[Zip](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionMadeByExpr = this.io.readU2le()
  this.versionMadeBy = versionMadeByExpr
  let versionNeededToExtractExpr = this.io.readU2le()
  this.versionNeededToExtract = versionNeededToExtractExpr
  let flagsExpr = this.io.readU2le()
  this.flags = flagsExpr
  let compressionMethodExpr = Zip_Compression(this.io.readU2le())
  this.compressionMethod = compressionMethodExpr
  let rawFileModTimeExpr = this.io.readBytes(int(4))
  this.rawFileModTime = rawFileModTimeExpr
  let rawFileModTimeIo = newKaitaiStream(rawFileModTimeExpr)
  let fileModTimeExpr = DosDatetime.read(rawFileModTimeIo, nil, nil)
  this.fileModTime = fileModTimeExpr
  let crc32Expr = this.io.readU4le()
  this.crc32 = crc32Expr
  let lenBodyCompressedExpr = this.io.readU4le()
  this.lenBodyCompressed = lenBodyCompressedExpr
  let lenBodyUncompressedExpr = this.io.readU4le()
  this.lenBodyUncompressed = lenBodyUncompressedExpr
  let lenFileNameExpr = this.io.readU2le()
  this.lenFileName = lenFileNameExpr
  let lenExtraExpr = this.io.readU2le()
  this.lenExtra = lenExtraExpr
  let lenCommentExpr = this.io.readU2le()
  this.lenComment = lenCommentExpr
  let diskNumberStartExpr = this.io.readU2le()
  this.diskNumberStart = diskNumberStartExpr
  let intFileAttrExpr = this.io.readU2le()
  this.intFileAttr = intFileAttrExpr
  let extFileAttrExpr = this.io.readU4le()
  this.extFileAttr = extFileAttrExpr
  let ofsLocalHeaderExpr = this.io.readS4le()
  this.ofsLocalHeader = ofsLocalHeaderExpr
  let fileNameExpr = encode(this.io.readBytes(int(this.lenFileName)), "UTF-8")
  this.fileName = fileNameExpr
  let rawExtraExpr = this.io.readBytes(int(this.lenExtra))
  this.rawExtra = rawExtraExpr
  let rawExtraIo = newKaitaiStream(rawExtraExpr)
  let extraExpr = Zip_Extras.read(rawExtraIo, this.root, this)
  this.extra = extraExpr
  let commentExpr = encode(this.io.readBytes(int(this.lenComment)), "UTF-8")
  this.comment = commentExpr

proc localHeader(this: Zip_CentralDirEntry): Zip_PkSection = 
  if this.localHeaderInstFlag:
    return this.localHeaderInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsLocalHeader))
  let localHeaderInstExpr = Zip_PkSection.read(this.io, this.root, this)
  this.localHeaderInst = localHeaderInstExpr
  this.io.seek(pos)
  this.localHeaderInstFlag = true
  return this.localHeaderInst

proc fromFile*(_: typedesc[Zip_CentralDirEntry], filename: string): Zip_CentralDirEntry =
  Zip_CentralDirEntry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Zip_DataDescriptor], io: KaitaiStream, root: KaitaiStruct, parent: Zip_PkSection): Zip_DataDescriptor =
  template this: untyped = result
  this = new(Zip_DataDescriptor)
  let root = if root == nil: cast[Zip](this) else: cast[Zip](root)
  this.io = io
  this.root = root
  this.parent = parent

  let crc32Expr = this.io.readU4le()
  this.crc32 = crc32Expr
  let lenBodyCompressedExpr = this.io.readU4le()
  this.lenBodyCompressed = lenBodyCompressedExpr
  let lenBodyUncompressedExpr = this.io.readU4le()
  this.lenBodyUncompressed = lenBodyUncompressedExpr

proc fromFile*(_: typedesc[Zip_DataDescriptor], filename: string): Zip_DataDescriptor =
  Zip_DataDescriptor.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Zip_EndOfCentralDir], io: KaitaiStream, root: KaitaiStruct, parent: Zip_PkSection): Zip_EndOfCentralDir =
  template this: untyped = result
  this = new(Zip_EndOfCentralDir)
  let root = if root == nil: cast[Zip](this) else: cast[Zip](root)
  this.io = io
  this.root = root
  this.parent = parent

  let diskOfEndOfCentralDirExpr = this.io.readU2le()
  this.diskOfEndOfCentralDir = diskOfEndOfCentralDirExpr
  let diskOfCentralDirExpr = this.io.readU2le()
  this.diskOfCentralDir = diskOfCentralDirExpr
  let numCentralDirEntriesOnDiskExpr = this.io.readU2le()
  this.numCentralDirEntriesOnDisk = numCentralDirEntriesOnDiskExpr
  let numCentralDirEntriesTotalExpr = this.io.readU2le()
  this.numCentralDirEntriesTotal = numCentralDirEntriesTotalExpr
  let lenCentralDirExpr = this.io.readU4le()
  this.lenCentralDir = lenCentralDirExpr
  let ofsCentralDirExpr = this.io.readU4le()
  this.ofsCentralDir = ofsCentralDirExpr
  let lenCommentExpr = this.io.readU2le()
  this.lenComment = lenCommentExpr
  let commentExpr = encode(this.io.readBytes(int(this.lenComment)), "UTF-8")
  this.comment = commentExpr

proc fromFile*(_: typedesc[Zip_EndOfCentralDir], filename: string): Zip_EndOfCentralDir =
  Zip_EndOfCentralDir.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Zip_ExtraField], io: KaitaiStream, root: KaitaiStruct, parent: Zip_Extras): Zip_ExtraField =
  template this: untyped = result
  this = new(Zip_ExtraField)
  let root = if root == nil: cast[Zip](this) else: cast[Zip](root)
  this.io = io
  this.root = root
  this.parent = parent

  let codeExpr = Zip_ExtraCodes(this.io.readU2le())
  this.code = codeExpr
  let lenBodyExpr = this.io.readU2le()
  this.lenBody = lenBodyExpr
  block:
    let on = this.code
    if on == zip.extended_timestamp:
      let rawBodyExpr = this.io.readBytes(int(this.lenBody))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Zip_ExtraField_ExtendedTimestamp.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == zip.infozip_unix_var_size:
      let rawBodyExpr = this.io.readBytes(int(this.lenBody))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Zip_ExtraField_InfozipUnixVarSize.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == zip.ntfs:
      let rawBodyExpr = this.io.readBytes(int(this.lenBody))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Zip_ExtraField_Ntfs.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    else:
      let bodyExpr = this.io.readBytes(int(this.lenBody))
      this.body = bodyExpr

proc fromFile*(_: typedesc[Zip_ExtraField], filename: string): Zip_ExtraField =
  Zip_ExtraField.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://github.com/LuaDist/zip/blob/b710806/proginfo/extrafld.txt#L817">Source</a>
]##
proc read*(_: typedesc[Zip_ExtraField_ExtendedTimestamp], io: KaitaiStream, root: KaitaiStruct, parent: Zip_ExtraField): Zip_ExtraField_ExtendedTimestamp =
  template this: untyped = result
  this = new(Zip_ExtraField_ExtendedTimestamp)
  let root = if root == nil: cast[Zip](this) else: cast[Zip](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rawFlagsExpr = this.io.readBytes(int(1))
  this.rawFlags = rawFlagsExpr
  let rawFlagsIo = newKaitaiStream(rawFlagsExpr)
  let flagsExpr = Zip_ExtraField_ExtendedTimestamp_InfoFlags.read(rawFlagsIo, this.root, this)
  this.flags = flagsExpr

  ##[
  Unix timestamp
  ]##
  if this.flags.hasModTime:
    let modTimeExpr = this.io.readU4le()
    this.modTime = modTimeExpr

  ##[
  Unix timestamp
  ]##
  if this.flags.hasAccessTime:
    let accessTimeExpr = this.io.readU4le()
    this.accessTime = accessTimeExpr

  ##[
  Unix timestamp
  ]##
  if this.flags.hasCreateTime:
    let createTimeExpr = this.io.readU4le()
    this.createTime = createTimeExpr

proc fromFile*(_: typedesc[Zip_ExtraField_ExtendedTimestamp], filename: string): Zip_ExtraField_ExtendedTimestamp =
  Zip_ExtraField_ExtendedTimestamp.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Zip_ExtraField_ExtendedTimestamp_InfoFlags], io: KaitaiStream, root: KaitaiStruct, parent: Zip_ExtraField_ExtendedTimestamp): Zip_ExtraField_ExtendedTimestamp_InfoFlags =
  template this: untyped = result
  this = new(Zip_ExtraField_ExtendedTimestamp_InfoFlags)
  let root = if root == nil: cast[Zip](this) else: cast[Zip](root)
  this.io = io
  this.root = root
  this.parent = parent

  let hasModTimeExpr = this.io.readBitsIntLe(1) != 0
  this.hasModTime = hasModTimeExpr
  let hasAccessTimeExpr = this.io.readBitsIntLe(1) != 0
  this.hasAccessTime = hasAccessTimeExpr
  let hasCreateTimeExpr = this.io.readBitsIntLe(1) != 0
  this.hasCreateTime = hasCreateTimeExpr
  let reservedExpr = this.io.readBitsIntLe(5)
  this.reserved = reservedExpr

proc fromFile*(_: typedesc[Zip_ExtraField_ExtendedTimestamp_InfoFlags], filename: string): Zip_ExtraField_ExtendedTimestamp_InfoFlags =
  Zip_ExtraField_ExtendedTimestamp_InfoFlags.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://github.com/LuaDist/zip/blob/b710806/proginfo/extrafld.txt#L1339">Source</a>
]##
proc read*(_: typedesc[Zip_ExtraField_InfozipUnixVarSize], io: KaitaiStream, root: KaitaiStruct, parent: Zip_ExtraField): Zip_ExtraField_InfozipUnixVarSize =
  template this: untyped = result
  this = new(Zip_ExtraField_InfozipUnixVarSize)
  let root = if root == nil: cast[Zip](this) else: cast[Zip](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Version of this extra field, currently 1
  ]##
  let versionExpr = this.io.readU1()
  this.version = versionExpr

  ##[
  Size of UID field
  ]##
  let lenUidExpr = this.io.readU1()
  this.lenUid = lenUidExpr

  ##[
  UID (User ID) for a file
  ]##
  let uidExpr = this.io.readBytes(int(this.lenUid))
  this.uid = uidExpr

  ##[
  Size of GID field
  ]##
  let lenGidExpr = this.io.readU1()
  this.lenGid = lenGidExpr

  ##[
  GID (Group ID) for a file
  ]##
  let gidExpr = this.io.readBytes(int(this.lenGid))
  this.gid = gidExpr

proc fromFile*(_: typedesc[Zip_ExtraField_InfozipUnixVarSize], filename: string): Zip_ExtraField_InfozipUnixVarSize =
  Zip_ExtraField_InfozipUnixVarSize.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://github.com/LuaDist/zip/blob/b710806/proginfo/extrafld.txt#L191">Source</a>
]##
proc read*(_: typedesc[Zip_ExtraField_Ntfs], io: KaitaiStream, root: KaitaiStruct, parent: Zip_ExtraField): Zip_ExtraField_Ntfs =
  template this: untyped = result
  this = new(Zip_ExtraField_Ntfs)
  let root = if root == nil: cast[Zip](this) else: cast[Zip](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readU4le()
  this.reserved = reservedExpr
  block:
    var i: int
    while not this.io.isEof:
      let it = Zip_ExtraField_Ntfs_Attribute.read(this.io, this.root, this)
      this.attributes.add(it)
      inc i

proc fromFile*(_: typedesc[Zip_ExtraField_Ntfs], filename: string): Zip_ExtraField_Ntfs =
  Zip_ExtraField_Ntfs.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Zip_ExtraField_Ntfs_Attribute], io: KaitaiStream, root: KaitaiStruct, parent: Zip_ExtraField_Ntfs): Zip_ExtraField_Ntfs_Attribute =
  template this: untyped = result
  this = new(Zip_ExtraField_Ntfs_Attribute)
  let root = if root == nil: cast[Zip](this) else: cast[Zip](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagExpr = this.io.readU2le()
  this.tag = tagExpr
  let lenBodyExpr = this.io.readU2le()
  this.lenBody = lenBodyExpr
  block:
    let on = this.tag
    if on == 1:
      let rawBodyExpr = this.io.readBytes(int(this.lenBody))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Zip_ExtraField_Ntfs_Attribute1.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    else:
      let bodyExpr = this.io.readBytes(int(this.lenBody))
      this.body = bodyExpr

proc fromFile*(_: typedesc[Zip_ExtraField_Ntfs_Attribute], filename: string): Zip_ExtraField_Ntfs_Attribute =
  Zip_ExtraField_Ntfs_Attribute.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Zip_ExtraField_Ntfs_Attribute1], io: KaitaiStream, root: KaitaiStruct, parent: Zip_ExtraField_Ntfs_Attribute): Zip_ExtraField_Ntfs_Attribute1 =
  template this: untyped = result
  this = new(Zip_ExtraField_Ntfs_Attribute1)
  let root = if root == nil: cast[Zip](this) else: cast[Zip](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lastModTimeExpr = this.io.readU8le()
  this.lastModTime = lastModTimeExpr
  let lastAccessTimeExpr = this.io.readU8le()
  this.lastAccessTime = lastAccessTimeExpr
  let creationTimeExpr = this.io.readU8le()
  this.creationTime = creationTimeExpr

proc fromFile*(_: typedesc[Zip_ExtraField_Ntfs_Attribute1], filename: string): Zip_ExtraField_Ntfs_Attribute1 =
  Zip_ExtraField_Ntfs_Attribute1.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Zip_Extras], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Zip_Extras =
  template this: untyped = result
  this = new(Zip_Extras)
  let root = if root == nil: cast[Zip](this) else: cast[Zip](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Zip_ExtraField.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[Zip_Extras], filename: string): Zip_Extras =
  Zip_Extras.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Zip_LocalFile], io: KaitaiStream, root: KaitaiStruct, parent: Zip_PkSection): Zip_LocalFile =
  template this: untyped = result
  this = new(Zip_LocalFile)
  let root = if root == nil: cast[Zip](this) else: cast[Zip](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = Zip_LocalFileHeader.read(this.io, this.root, this)
  this.header = headerExpr
  let bodyExpr = this.io.readBytes(int(this.header.lenBodyCompressed))
  this.body = bodyExpr

proc fromFile*(_: typedesc[Zip_LocalFile], filename: string): Zip_LocalFile =
  Zip_LocalFile.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Zip_LocalFileHeader], io: KaitaiStream, root: KaitaiStruct, parent: Zip_LocalFile): Zip_LocalFileHeader =
  template this: untyped = result
  this = new(Zip_LocalFileHeader)
  let root = if root == nil: cast[Zip](this) else: cast[Zip](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionExpr = this.io.readU2le()
  this.version = versionExpr
  let rawFlagsExpr = this.io.readBytes(int(2))
  this.rawFlags = rawFlagsExpr
  let rawFlagsIo = newKaitaiStream(rawFlagsExpr)
  let flagsExpr = Zip_LocalFileHeader_GpFlags.read(rawFlagsIo, this.root, this)
  this.flags = flagsExpr
  let compressionMethodExpr = Zip_Compression(this.io.readU2le())
  this.compressionMethod = compressionMethodExpr
  let rawFileModTimeExpr = this.io.readBytes(int(4))
  this.rawFileModTime = rawFileModTimeExpr
  let rawFileModTimeIo = newKaitaiStream(rawFileModTimeExpr)
  let fileModTimeExpr = DosDatetime.read(rawFileModTimeIo, nil, nil)
  this.fileModTime = fileModTimeExpr
  let crc32Expr = this.io.readU4le()
  this.crc32 = crc32Expr
  let lenBodyCompressedExpr = this.io.readU4le()
  this.lenBodyCompressed = lenBodyCompressedExpr
  let lenBodyUncompressedExpr = this.io.readU4le()
  this.lenBodyUncompressed = lenBodyUncompressedExpr
  let lenFileNameExpr = this.io.readU2le()
  this.lenFileName = lenFileNameExpr
  let lenExtraExpr = this.io.readU2le()
  this.lenExtra = lenExtraExpr
  let fileNameExpr = encode(this.io.readBytes(int(this.lenFileName)), "UTF-8")
  this.fileName = fileNameExpr
  let rawExtraExpr = this.io.readBytes(int(this.lenExtra))
  this.rawExtra = rawExtraExpr
  let rawExtraIo = newKaitaiStream(rawExtraExpr)
  let extraExpr = Zip_Extras.read(rawExtraIo, this.root, this)
  this.extra = extraExpr

proc fromFile*(_: typedesc[Zip_LocalFileHeader], filename: string): Zip_LocalFileHeader =
  Zip_LocalFileHeader.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT">- 4.4.4</a>
@see <a href="https://users.cs.jmu.edu/buchhofp/forensics/formats/pkzip.html">Local file headers</a>
]##
proc read*(_: typedesc[Zip_LocalFileHeader_GpFlags], io: KaitaiStream, root: KaitaiStruct, parent: Zip_LocalFileHeader): Zip_LocalFileHeader_GpFlags =
  template this: untyped = result
  this = new(Zip_LocalFileHeader_GpFlags)
  let root = if root == nil: cast[Zip](this) else: cast[Zip](root)
  this.io = io
  this.root = root
  this.parent = parent

  let fileEncryptedExpr = this.io.readBitsIntLe(1) != 0
  this.fileEncrypted = fileEncryptedExpr

  ##[
  internal; access derived value instances instead
  ]##
  let compOptionsRawExpr = this.io.readBitsIntLe(2)
  this.compOptionsRaw = compOptionsRawExpr
  let hasDataDescriptorExpr = this.io.readBitsIntLe(1) != 0
  this.hasDataDescriptor = hasDataDescriptorExpr
  let reserved1Expr = this.io.readBitsIntLe(1) != 0
  this.reserved1 = reserved1Expr
  let compPatchedDataExpr = this.io.readBitsIntLe(1) != 0
  this.compPatchedData = compPatchedDataExpr
  let strongEncryptExpr = this.io.readBitsIntLe(1) != 0
  this.strongEncrypt = strongEncryptExpr
  let reserved2Expr = this.io.readBitsIntLe(4)
  this.reserved2 = reserved2Expr
  let langEncodingExpr = this.io.readBitsIntLe(1) != 0
  this.langEncoding = langEncodingExpr
  let reserved3Expr = this.io.readBitsIntLe(1) != 0
  this.reserved3 = reserved3Expr
  let maskHeaderValuesExpr = this.io.readBitsIntLe(1) != 0
  this.maskHeaderValues = maskHeaderValuesExpr
  let reserved4Expr = this.io.readBitsIntLe(2)
  this.reserved4 = reserved4Expr

proc deflatedMode(this: Zip_LocalFileHeader_GpFlags): Zip_LocalFileHeader_GpFlags_DeflateMode = 
  if this.deflatedModeInstFlag:
    return this.deflatedModeInst
  if  ((this.parent.compressionMethod == zip.deflated) or (this.parent.compressionMethod == zip.enhanced_deflated)) :
    let deflatedModeInstExpr = Zip_LocalFileHeader_GpFlags_DeflateMode(Zip_LocalFileHeader_GpFlags_DeflateMode(this.compOptionsRaw))
    this.deflatedModeInst = deflatedModeInstExpr
  this.deflatedModeInstFlag = true
  return this.deflatedModeInst

proc implodedDictByteSize(this: Zip_LocalFileHeader_GpFlags): int = 

  ##[
  8KiB or 4KiB in bytes
  ]##
  if this.implodedDictByteSizeInstFlag:
    return this.implodedDictByteSizeInst
  if this.parent.compressionMethod == zip.imploded:
    let implodedDictByteSizeInstExpr = int((if (this.compOptionsRaw and 1) != 0: 8 else: 4) * 1024)
    this.implodedDictByteSizeInst = implodedDictByteSizeInstExpr
  this.implodedDictByteSizeInstFlag = true
  return this.implodedDictByteSizeInst

proc implodedNumSfTrees(this: Zip_LocalFileHeader_GpFlags): int8 = 
  if this.implodedNumSfTreesInstFlag:
    return this.implodedNumSfTreesInst
  if this.parent.compressionMethod == zip.imploded:
    let implodedNumSfTreesInstExpr = int8((if (this.compOptionsRaw and 2) != 0: 3 else: 2))
    this.implodedNumSfTreesInst = implodedNumSfTreesInstExpr
  this.implodedNumSfTreesInstFlag = true
  return this.implodedNumSfTreesInst

proc lzmaHasEosMarker(this: Zip_LocalFileHeader_GpFlags): bool = 
  if this.lzmaHasEosMarkerInstFlag:
    return this.lzmaHasEosMarkerInst
  if this.parent.compressionMethod == zip.lzma:
    let lzmaHasEosMarkerInstExpr = bool((this.compOptionsRaw and 1) != 0)
    this.lzmaHasEosMarkerInst = lzmaHasEosMarkerInstExpr
  this.lzmaHasEosMarkerInstFlag = true
  return this.lzmaHasEosMarkerInst

proc fromFile*(_: typedesc[Zip_LocalFileHeader_GpFlags], filename: string): Zip_LocalFileHeader_GpFlags =
  Zip_LocalFileHeader_GpFlags.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Zip_PkSection], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Zip_PkSection =
  template this: untyped = result
  this = new(Zip_PkSection)
  let root = if root == nil: cast[Zip](this) else: cast[Zip](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(2))
  this.magic = magicExpr
  let sectionTypeExpr = this.io.readU2le()
  this.sectionType = sectionTypeExpr
  block:
    let on = this.sectionType
    if on == 1027:
      let bodyExpr = Zip_LocalFile.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == 1541:
      let bodyExpr = Zip_EndOfCentralDir.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == 2055:
      let bodyExpr = Zip_DataDescriptor.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == 513:
      let bodyExpr = Zip_CentralDirEntry.read(this.io, this.root, this)
      this.body = bodyExpr

proc fromFile*(_: typedesc[Zip_PkSection], filename: string): Zip_PkSection =
  Zip_PkSection.read(newKaitaiFileStream(filename), nil, nil)


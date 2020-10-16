import kaitai_struct_nim_runtime
import options

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
    ppmd = 98
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
    infozip_unix = 30805
    infozip_unix_var_size = 30837
  Zip_LocalFile* = ref object of KaitaiStruct
    `header`*: Zip_LocalFileHeader
    `body`*: seq[byte]
    `parent`*: Zip_PkSection
  Zip_DataDescriptor* = ref object of KaitaiStruct
    `crc32`*: uint32
    `lenBodyCompressed`*: uint32
    `lenBodyUncompressed`*: uint32
    `parent`*: Zip_PkSection
  Zip_ExtraField* = ref object of KaitaiStruct
    `code`*: Zip_ExtraCodes
    `lenBody`*: uint16
    `body`*: KaitaiStruct
    `parent`*: Zip_Extras
    `rawBody`*: seq[byte]
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
  Zip_ExtraField_ExtendedTimestamp* = ref object of KaitaiStruct
    `flags`*: uint8
    `modTime`*: uint32
    `accessTime`*: uint32
    `createTime`*: uint32
    `parent`*: Zip_ExtraField
  Zip_ExtraField_InfozipUnixVarSize* = ref object of KaitaiStruct
    `version`*: uint8
    `lenUid`*: uint8
    `uid`*: seq[byte]
    `lenGid`*: uint8
    `gid`*: seq[byte]
    `parent`*: Zip_ExtraField
  Zip_CentralDirEntry* = ref object of KaitaiStruct
    `versionMadeBy`*: uint16
    `versionNeededToExtract`*: uint16
    `flags`*: uint16
    `compressionMethod`*: Zip_Compression
    `lastModFileTime`*: uint16
    `lastModFileDate`*: uint16
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
    `rawExtra`*: seq[byte]
    `localHeaderInst`*: Zip_PkSection
  Zip_PkSection* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `sectionType`*: uint16
    `body`*: KaitaiStruct
    `parent`*: KaitaiStruct
  Zip_Extras* = ref object of KaitaiStruct
    `entries`*: seq[Zip_ExtraField]
    `parent`*: KaitaiStruct
  Zip_LocalFileHeader* = ref object of KaitaiStruct
    `version`*: uint16
    `flags`*: uint16
    `compressionMethod`*: Zip_Compression
    `fileModTime`*: uint16
    `fileModDate`*: uint16
    `crc32`*: uint32
    `lenBodyCompressed`*: uint32
    `lenBodyUncompressed`*: uint32
    `lenFileName`*: uint16
    `lenExtra`*: uint16
    `fileName`*: string
    `extra`*: Zip_Extras
    `parent`*: Zip_LocalFile
    `rawExtra`*: seq[byte]
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

proc read*(_: typedesc[Zip], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Zip
proc read*(_: typedesc[Zip_LocalFile], io: KaitaiStream, root: KaitaiStruct, parent: Zip_PkSection): Zip_LocalFile
proc read*(_: typedesc[Zip_DataDescriptor], io: KaitaiStream, root: KaitaiStruct, parent: Zip_PkSection): Zip_DataDescriptor
proc read*(_: typedesc[Zip_ExtraField], io: KaitaiStream, root: KaitaiStruct, parent: Zip_Extras): Zip_ExtraField
proc read*(_: typedesc[Zip_ExtraField_Ntfs], io: KaitaiStream, root: KaitaiStruct, parent: Zip_ExtraField): Zip_ExtraField_Ntfs
proc read*(_: typedesc[Zip_ExtraField_Ntfs_Attribute], io: KaitaiStream, root: KaitaiStruct, parent: Zip_ExtraField_Ntfs): Zip_ExtraField_Ntfs_Attribute
proc read*(_: typedesc[Zip_ExtraField_Ntfs_Attribute1], io: KaitaiStream, root: KaitaiStruct, parent: Zip_ExtraField_Ntfs_Attribute): Zip_ExtraField_Ntfs_Attribute1
proc read*(_: typedesc[Zip_ExtraField_ExtendedTimestamp], io: KaitaiStream, root: KaitaiStruct, parent: Zip_ExtraField): Zip_ExtraField_ExtendedTimestamp
proc read*(_: typedesc[Zip_ExtraField_InfozipUnixVarSize], io: KaitaiStream, root: KaitaiStruct, parent: Zip_ExtraField): Zip_ExtraField_InfozipUnixVarSize
proc read*(_: typedesc[Zip_CentralDirEntry], io: KaitaiStream, root: KaitaiStruct, parent: Zip_PkSection): Zip_CentralDirEntry
proc read*(_: typedesc[Zip_PkSection], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Zip_PkSection
proc read*(_: typedesc[Zip_Extras], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Zip_Extras
proc read*(_: typedesc[Zip_LocalFileHeader], io: KaitaiStream, root: KaitaiStruct, parent: Zip_LocalFile): Zip_LocalFileHeader
proc read*(_: typedesc[Zip_EndOfCentralDir], io: KaitaiStream, root: KaitaiStruct, parent: Zip_PkSection): Zip_EndOfCentralDir

proc localHeader*(this: Zip_CentralDirEntry): Zip_PkSection


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
    if on == zip.ntfs:
      let rawBodyExpr = this.io.readBytes(int(this.lenBody))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Zip_ExtraField_Ntfs.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == zip.extended_timestamp:
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
    else:
      let bodyExpr = this.io.readBytes(int(this.lenBody))
      this.body = bodyExpr

proc fromFile*(_: typedesc[Zip_ExtraField], filename: string): Zip_ExtraField =
  Zip_ExtraField.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://github.com/LuaDist/zip/blob/master/proginfo/extrafld.txt#L191">Source</a>
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


##[
@see <a href="https://github.com/LuaDist/zip/blob/master/proginfo/extrafld.txt#L817">Source</a>
]##
proc read*(_: typedesc[Zip_ExtraField_ExtendedTimestamp], io: KaitaiStream, root: KaitaiStruct, parent: Zip_ExtraField): Zip_ExtraField_ExtendedTimestamp =
  template this: untyped = result
  this = new(Zip_ExtraField_ExtendedTimestamp)
  let root = if root == nil: cast[Zip](this) else: cast[Zip](root)
  this.io = io
  this.root = root
  this.parent = parent

  let flagsExpr = this.io.readU1()
  this.flags = flagsExpr
  let modTimeExpr = this.io.readU4le()
  this.modTime = modTimeExpr
  if not(this.io.isEof):
    let accessTimeExpr = this.io.readU4le()
    this.accessTime = accessTimeExpr
  if not(this.io.isEof):
    let createTimeExpr = this.io.readU4le()
    this.createTime = createTimeExpr

proc fromFile*(_: typedesc[Zip_ExtraField_ExtendedTimestamp], filename: string): Zip_ExtraField_ExtendedTimestamp =
  Zip_ExtraField_ExtendedTimestamp.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://github.com/LuaDist/zip/blob/master/proginfo/extrafld.txt#L1339">Source</a>
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
  let lastModFileTimeExpr = this.io.readU2le()
  this.lastModFileTime = lastModFileTimeExpr
  let lastModFileDateExpr = this.io.readU2le()
  this.lastModFileDate = lastModFileDateExpr
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
  if this.localHeaderInst != nil:
    return this.localHeaderInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsLocalHeader))
  let localHeaderInstExpr = Zip_PkSection.read(this.io, this.root, this)
  this.localHeaderInst = localHeaderInstExpr
  this.io.seek(pos)
  if this.localHeaderInst != nil:
    return this.localHeaderInst

proc fromFile*(_: typedesc[Zip_CentralDirEntry], filename: string): Zip_CentralDirEntry =
  Zip_CentralDirEntry.read(newKaitaiFileStream(filename), nil, nil)

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
    if on == 513:
      let bodyExpr = Zip_CentralDirEntry.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == 1027:
      let bodyExpr = Zip_LocalFile.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == 1541:
      let bodyExpr = Zip_EndOfCentralDir.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == 2055:
      let bodyExpr = Zip_DataDescriptor.read(this.io, this.root, this)
      this.body = bodyExpr

proc fromFile*(_: typedesc[Zip_PkSection], filename: string): Zip_PkSection =
  Zip_PkSection.read(newKaitaiFileStream(filename), nil, nil)

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

proc read*(_: typedesc[Zip_LocalFileHeader], io: KaitaiStream, root: KaitaiStruct, parent: Zip_LocalFile): Zip_LocalFileHeader =
  template this: untyped = result
  this = new(Zip_LocalFileHeader)
  let root = if root == nil: cast[Zip](this) else: cast[Zip](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionExpr = this.io.readU2le()
  this.version = versionExpr
  let flagsExpr = this.io.readU2le()
  this.flags = flagsExpr
  let compressionMethodExpr = Zip_Compression(this.io.readU2le())
  this.compressionMethod = compressionMethodExpr
  let fileModTimeExpr = this.io.readU2le()
  this.fileModTime = fileModTimeExpr
  let fileModDateExpr = this.io.readU2le()
  this.fileModDate = fileModDateExpr
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


import kaitai_struct_nim_runtime
import options
import php_serialized_value

type
  PharWithoutStub* = ref object of KaitaiStruct
    `manifest`*: PharWithoutStub_Manifest
    `files`*: seq[seq[byte]]
    `signature`*: PharWithoutStub_Signature
    `parent`*: KaitaiStruct
    `rawSignature`*: seq[byte]
  PharWithoutStub_SignatureType* = enum
    md5 = 1
    sha1 = 2
    sha256 = 4
    sha512 = 8
    openssl = 16
  PharWithoutStub_ApiVersion* = ref object of KaitaiStruct
    `release`*: uint64
    `major`*: uint64
    `minor`*: uint64
    `unused`*: uint64
    `parent`*: PharWithoutStub_Manifest
  PharWithoutStub_FileEntry* = ref object of KaitaiStruct
    `lenFilename`*: uint32
    `filename`*: seq[byte]
    `lenDataUncompressed`*: uint32
    `timestamp`*: uint32
    `lenDataCompressed`*: uint32
    `crc32`*: uint32
    `flags`*: PharWithoutStub_FileFlags
    `lenMetadata`*: uint32
    `metadata`*: PharWithoutStub_SerializedValue
    `parent`*: PharWithoutStub_Manifest
    `rawMetadata`*: seq[byte]
  PharWithoutStub_FileFlags* = ref object of KaitaiStruct
    `value`*: uint32
    `parent`*: PharWithoutStub_FileEntry
    `bzip2CompressedInst`: bool
    `bzip2CompressedInstFlag`: bool
    `permissionsInst`: int
    `permissionsInstFlag`: bool
    `zlibCompressedInst`: bool
    `zlibCompressedInstFlag`: bool
  PharWithoutStub_GlobalFlags* = ref object of KaitaiStruct
    `value`*: uint32
    `parent`*: PharWithoutStub_Manifest
    `anyBzip2CompressedInst`: bool
    `anyBzip2CompressedInstFlag`: bool
    `anyZlibCompressedInst`: bool
    `anyZlibCompressedInstFlag`: bool
    `hasSignatureInst`: bool
    `hasSignatureInstFlag`: bool
  PharWithoutStub_Manifest* = ref object of KaitaiStruct
    `lenManifest`*: uint32
    `numFiles`*: uint32
    `apiVersion`*: PharWithoutStub_ApiVersion
    `flags`*: PharWithoutStub_GlobalFlags
    `lenAlias`*: uint32
    `alias`*: seq[byte]
    `lenMetadata`*: uint32
    `metadata`*: PharWithoutStub_SerializedValue
    `fileEntries`*: seq[PharWithoutStub_FileEntry]
    `parent`*: PharWithoutStub
    `rawMetadata`*: seq[byte]
  PharWithoutStub_SerializedValue* = ref object of KaitaiStruct
    `raw`*: seq[byte]
    `parent`*: KaitaiStruct
    `parsedInst`: PhpSerializedValue
    `parsedInstFlag`: bool
  PharWithoutStub_Signature* = ref object of KaitaiStruct
    `data`*: seq[byte]
    `type`*: PharWithoutStub_SignatureType
    `magic`*: seq[byte]
    `parent`*: PharWithoutStub

proc read*(_: typedesc[PharWithoutStub], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PharWithoutStub
proc read*(_: typedesc[PharWithoutStub_ApiVersion], io: KaitaiStream, root: KaitaiStruct, parent: PharWithoutStub_Manifest): PharWithoutStub_ApiVersion
proc read*(_: typedesc[PharWithoutStub_FileEntry], io: KaitaiStream, root: KaitaiStruct, parent: PharWithoutStub_Manifest): PharWithoutStub_FileEntry
proc read*(_: typedesc[PharWithoutStub_FileFlags], io: KaitaiStream, root: KaitaiStruct, parent: PharWithoutStub_FileEntry): PharWithoutStub_FileFlags
proc read*(_: typedesc[PharWithoutStub_GlobalFlags], io: KaitaiStream, root: KaitaiStruct, parent: PharWithoutStub_Manifest): PharWithoutStub_GlobalFlags
proc read*(_: typedesc[PharWithoutStub_Manifest], io: KaitaiStream, root: KaitaiStruct, parent: PharWithoutStub): PharWithoutStub_Manifest
proc read*(_: typedesc[PharWithoutStub_SerializedValue], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PharWithoutStub_SerializedValue
proc read*(_: typedesc[PharWithoutStub_Signature], io: KaitaiStream, root: KaitaiStruct, parent: PharWithoutStub): PharWithoutStub_Signature

proc bzip2Compressed*(this: PharWithoutStub_FileFlags): bool
proc permissions*(this: PharWithoutStub_FileFlags): int
proc zlibCompressed*(this: PharWithoutStub_FileFlags): bool
proc anyBzip2Compressed*(this: PharWithoutStub_GlobalFlags): bool
proc anyZlibCompressed*(this: PharWithoutStub_GlobalFlags): bool
proc hasSignature*(this: PharWithoutStub_GlobalFlags): bool
proc parsed*(this: PharWithoutStub_SerializedValue): PhpSerializedValue


##[
A phar (PHP archive) file. The phar format is a custom archive format
from the PHP ecosystem that is used to package a complete PHP library
or application into a single self-contained archive.
All phar archives start with an executable PHP stub, which can be used to
allow executing or including phar files as if they were regular PHP scripts.
PHP 5.3 and later include the phar extension, which adds native support for
reading and manipulating phar files.

The phar format was originally developed as part of the PEAR library
PHP_Archive, first released in 2005. Later, a native PHP extension
named "phar" was developed, which was first released on PECL in 2007,
and is included with PHP 5.3 and later. The phar extension has effectively
superseded the PHP_Archive library, which has not been updated since 2010.
The phar extension is also no longer released independently on PECL;
it is now developed and released as part of PHP itself.

Because of current limitations in Kaitai Struct
(seekaitai-io/kaitai_struct#158 and kaitai-io/kaitai_struct#538),
the executable PHP stub that precedes the rest of the archive is not handled
by this spec. Before parsing a phar using this spec, the stub must be
removed manually.

A phar's stub is terminated by the special token `__HALT_COMPILER();`
(which may be followed by at most one space, the PHP tag end `?>`,
and an optional line terminator). The stub termination sequence is
immediately followed by the remaining parts of the phar format,
as described in this spec.

The phar stub usually contains code that loads the phar and runs
a contained PHP file, but this is not required. A minimal valid phar stub
is `<?php __HALT_COMPILER();` - such a stub makes it impossible to execute
the phar directly, but still allows loading or manipulating it using the
phar extension.

Note: The phar format does not specify any encoding for text fields
(stub, alias name, and all file names), so these fields may contain arbitrary
binary data. The actual text encoding used in a specific phar file usually
depends on the application that created the phar, and on the
standard encoding of the system on which the phar was created.

@see <a href="https://www.php.net/manual/en/phar.fileformat.php">Source</a>
@see <a href="https://github.com/php/php-src/tree/master/ext/phar">Source</a>
@see <a href="https://svn.php.net/viewvc/pecl/phar/">Source</a>
@see <a href="https://svn.php.net/viewvc/pear/packages/PHP_Archive/">Source</a>
]##
proc read*(_: typedesc[PharWithoutStub], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PharWithoutStub =
  template this: untyped = result
  this = new(PharWithoutStub)
  let root = if root == nil: cast[PharWithoutStub](this) else: cast[PharWithoutStub](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The archive's manifest, containing general metadata about the archive
and its files.

  ]##
  let manifestExpr = PharWithoutStub_Manifest.read(this.io, this.root, this)
  this.manifest = manifestExpr

  ##[
  The contents of each file in the archive (possibly compressed,
as indicated by the file's flags in the manifest). The files are stored
in the same order as they appear in the manifest.

  ]##
  for i in 0 ..< int(this.manifest.numFiles):
    let it = this.io.readBytes(int(this.manifest.fileEntries[i].lenDataCompressed))
    this.files.add(it)

  ##[
  The archive's signature - a digest of all archive data before
the signature itself.

Note: Almost all of the available "signature" types are actually hashes,
not signatures, and cannot be used to verify that the archive has not
been tampered with. Only the OpenSSL signature type is a true
cryptographic signature.

  ]##
  if this.manifest.flags.hasSignature:
    let rawSignatureExpr = this.io.readBytesFull()
    this.rawSignature = rawSignatureExpr
    let rawSignatureIo = newKaitaiStream(rawSignatureExpr)
    let signatureExpr = PharWithoutStub_Signature.read(rawSignatureIo, this.root, this)
    this.signature = signatureExpr

proc fromFile*(_: typedesc[PharWithoutStub], filename: string): PharWithoutStub =
  PharWithoutStub.read(newKaitaiFileStream(filename), nil, nil)


##[
A phar API version number. This version number is meant to indicate
which features are used in a specific phar, so that tools reading
the phar can easily check that they support all necessary features.

The following API versions exist so far:

* 0.5, 0.6, 0.7, 0.7.1: The first official API versions. At this point,
  the phar format was only used by the PHP_Archive library, and the
  API version numbers were identical to the PHP_Archive versions that
  supported them. Development of the native phar extension started around
  API version 0.7. These API versions could only be queried using the
  `PHP_Archive::APIversion()` method, but were not stored physically
  in archives. These API versions are not supported by this spec.
* 0.8.0: Used by PHP_Archive 0.8.0 (released 2006-07-18) and
  later development versions of the phar extension. This is the first
  version number to be physically stored in archives. This API version
  is not supported by this spec.
* 0.9.0: Used by later development/early beta versions of the
  phar extension. Also temporarily used by PHP_Archive 0.9.0
  (released 2006-12-15), but reverted back to API version 0.8.0 in
  PHP_Archive 0.9.1 (released 2007-01-05).
* 1.0.0: Supported since PHP_Archive 0.10.0 (released 2007-05-29)
  and phar extension 1.0.0 (released 2007-03-28). This is the first
  stable, forwards-compatible and documented version of the format.
* 1.1.0: Supported since PHP_Archive 0.12.0 (released 2015-07-06)
  and phar extension 1.1.0 (released 2007-04-12). Adds SHA-256 and
  SHA-512 signature types.
* 1.1.1: Supported since phar extension 2.0.0 (released 2009-07-29 and
  included with PHP 5.3 and later). (PHP_Archive 0.12.0 also supports
  all features from API verison 1.1.1, but it reports API version 1.1.0.)
  Adds the OpenSSL signature type and support for storing
  empty directories.

]##
proc read*(_: typedesc[PharWithoutStub_ApiVersion], io: KaitaiStream, root: KaitaiStruct, parent: PharWithoutStub_Manifest): PharWithoutStub_ApiVersion =
  template this: untyped = result
  this = new(PharWithoutStub_ApiVersion)
  let root = if root == nil: cast[PharWithoutStub](this) else: cast[PharWithoutStub](root)
  this.io = io
  this.root = root
  this.parent = parent

  let releaseExpr = this.io.readBitsIntBe(4)
  this.release = releaseExpr
  let majorExpr = this.io.readBitsIntBe(4)
  this.major = majorExpr
  let minorExpr = this.io.readBitsIntBe(4)
  this.minor = minorExpr
  let unusedExpr = this.io.readBitsIntBe(4)
  this.unused = unusedExpr

proc fromFile*(_: typedesc[PharWithoutStub_ApiVersion], filename: string): PharWithoutStub_ApiVersion =
  PharWithoutStub_ApiVersion.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PharWithoutStub_FileEntry], io: KaitaiStream, root: KaitaiStruct, parent: PharWithoutStub_Manifest): PharWithoutStub_FileEntry =
  template this: untyped = result
  this = new(PharWithoutStub_FileEntry)
  let root = if root == nil: cast[PharWithoutStub](this) else: cast[PharWithoutStub](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The length of the file name, in bytes.
  ]##
  let lenFilenameExpr = this.io.readU4le()
  this.lenFilename = lenFilenameExpr

  ##[
  The name of this file. If the name ends with a slash, this entry
represents a directory, otherwise a regular file. Directory entries
are supported since phar API version 1.1.1.
(Explicit directory entries are only needed for empty directories.
Non-empty directories are implied by the files located inside them.)

  ]##
  let filenameExpr = this.io.readBytes(int(this.lenFilename))
  this.filename = filenameExpr

  ##[
  The length of the file's data when uncompressed, in bytes.
  ]##
  let lenDataUncompressedExpr = this.io.readU4le()
  this.lenDataUncompressed = lenDataUncompressedExpr

  ##[
  The time at which the file was added or last updated, as a
Unix timestamp.

  ]##
  let timestampExpr = this.io.readU4le()
  this.timestamp = timestampExpr

  ##[
  The length of the file's data when compressed, in bytes.
  ]##
  let lenDataCompressedExpr = this.io.readU4le()
  this.lenDataCompressed = lenDataCompressedExpr

  ##[
  The CRC32 checksum of the file's uncompressed data.
  ]##
  let crc32Expr = this.io.readU4le()
  this.crc32 = crc32Expr

  ##[
  Flags for this file.
  ]##
  let flagsExpr = PharWithoutStub_FileFlags.read(this.io, this.root, this)
  this.flags = flagsExpr

  ##[
  The length of the metadata, in bytes, or 0 if there is none.
  ]##
  let lenMetadataExpr = this.io.readU4le()
  this.lenMetadata = lenMetadataExpr

  ##[
  Metadata for this file, in the format used by PHP's
`serialize` function. The meaning of the serialized data is not
specified further, it may be used to store arbitrary custom data
about the file.

  ]##
  if this.lenMetadata != 0:
    let rawMetadataExpr = this.io.readBytes(int(this.lenMetadata))
    this.rawMetadata = rawMetadataExpr
    let rawMetadataIo = newKaitaiStream(rawMetadataExpr)
    let metadataExpr = PharWithoutStub_SerializedValue.read(rawMetadataIo, this.root, this)
    this.metadata = metadataExpr

proc fromFile*(_: typedesc[PharWithoutStub_FileEntry], filename: string): PharWithoutStub_FileEntry =
  PharWithoutStub_FileEntry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PharWithoutStub_FileFlags], io: KaitaiStream, root: KaitaiStruct, parent: PharWithoutStub_FileEntry): PharWithoutStub_FileFlags =
  template this: untyped = result
  this = new(PharWithoutStub_FileFlags)
  let root = if root == nil: cast[PharWithoutStub](this) else: cast[PharWithoutStub](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The unparsed flag bits.
  ]##
  let valueExpr = this.io.readU4le()
  this.value = valueExpr

proc bzip2Compressed(this: PharWithoutStub_FileFlags): bool = 

  ##[
  Whether this file's data is stored using bzip2 compression.
  ]##
  if this.bzip2CompressedInstFlag:
    return this.bzip2CompressedInst
  let bzip2CompressedInstExpr = bool((this.value and 8192) != 0)
  this.bzip2CompressedInst = bzip2CompressedInstExpr
  this.bzip2CompressedInstFlag = true
  return this.bzip2CompressedInst

proc permissions(this: PharWithoutStub_FileFlags): int = 

  ##[
  The file's permission bits.
  ]##
  if this.permissionsInstFlag:
    return this.permissionsInst
  let permissionsInstExpr = int(this.value and 511)
  this.permissionsInst = permissionsInstExpr
  this.permissionsInstFlag = true
  return this.permissionsInst

proc zlibCompressed(this: PharWithoutStub_FileFlags): bool = 

  ##[
  Whether this file's data is stored using zlib compression.
  ]##
  if this.zlibCompressedInstFlag:
    return this.zlibCompressedInst
  let zlibCompressedInstExpr = bool((this.value and 4096) != 0)
  this.zlibCompressedInst = zlibCompressedInstExpr
  this.zlibCompressedInstFlag = true
  return this.zlibCompressedInst

proc fromFile*(_: typedesc[PharWithoutStub_FileFlags], filename: string): PharWithoutStub_FileFlags =
  PharWithoutStub_FileFlags.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PharWithoutStub_GlobalFlags], io: KaitaiStream, root: KaitaiStruct, parent: PharWithoutStub_Manifest): PharWithoutStub_GlobalFlags =
  template this: untyped = result
  this = new(PharWithoutStub_GlobalFlags)
  let root = if root == nil: cast[PharWithoutStub](this) else: cast[PharWithoutStub](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The unparsed flag bits.
  ]##
  let valueExpr = this.io.readU4le()
  this.value = valueExpr

proc anyBzip2Compressed(this: PharWithoutStub_GlobalFlags): bool = 

  ##[
  Whether any of the files in this phar are stored using
bzip2 compression.

  ]##
  if this.anyBzip2CompressedInstFlag:
    return this.anyBzip2CompressedInst
  let anyBzip2CompressedInstExpr = bool((this.value and 8192) != 0)
  this.anyBzip2CompressedInst = anyBzip2CompressedInstExpr
  this.anyBzip2CompressedInstFlag = true
  return this.anyBzip2CompressedInst

proc anyZlibCompressed(this: PharWithoutStub_GlobalFlags): bool = 

  ##[
  Whether any of the files in this phar are stored using
zlib compression.

  ]##
  if this.anyZlibCompressedInstFlag:
    return this.anyZlibCompressedInst
  let anyZlibCompressedInstExpr = bool((this.value and 4096) != 0)
  this.anyZlibCompressedInst = anyZlibCompressedInstExpr
  this.anyZlibCompressedInstFlag = true
  return this.anyZlibCompressedInst

proc hasSignature(this: PharWithoutStub_GlobalFlags): bool = 

  ##[
  Whether this phar contains a signature.
  ]##
  if this.hasSignatureInstFlag:
    return this.hasSignatureInst
  let hasSignatureInstExpr = bool((this.value and 65536) != 0)
  this.hasSignatureInst = hasSignatureInstExpr
  this.hasSignatureInstFlag = true
  return this.hasSignatureInst

proc fromFile*(_: typedesc[PharWithoutStub_GlobalFlags], filename: string): PharWithoutStub_GlobalFlags =
  PharWithoutStub_GlobalFlags.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PharWithoutStub_Manifest], io: KaitaiStream, root: KaitaiStruct, parent: PharWithoutStub): PharWithoutStub_Manifest =
  template this: untyped = result
  this = new(PharWithoutStub_Manifest)
  let root = if root == nil: cast[PharWithoutStub](this) else: cast[PharWithoutStub](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The length of the manifest, in bytes.

Note: The phar extension does not allow reading manifests
larger than 100 MiB.

  ]##
  let lenManifestExpr = this.io.readU4le()
  this.lenManifest = lenManifestExpr

  ##[
  The number of files in this phar.
  ]##
  let numFilesExpr = this.io.readU4le()
  this.numFiles = numFilesExpr

  ##[
  The API version used by this phar manifest.
  ]##
  let apiVersionExpr = PharWithoutStub_ApiVersion.read(this.io, this.root, this)
  this.apiVersion = apiVersionExpr

  ##[
  Global flags for this phar.
  ]##
  let flagsExpr = PharWithoutStub_GlobalFlags.read(this.io, this.root, this)
  this.flags = flagsExpr

  ##[
  The length of the alias, in bytes.
  ]##
  let lenAliasExpr = this.io.readU4le()
  this.lenAlias = lenAliasExpr

  ##[
  The phar's alias, i. e. the name under which it is loaded into PHP.

  ]##
  let aliasExpr = this.io.readBytes(int(this.lenAlias))
  this.alias = aliasExpr

  ##[
  The size of the metadata, in bytes, or 0 if there is none.
  ]##
  let lenMetadataExpr = this.io.readU4le()
  this.lenMetadata = lenMetadataExpr

  ##[
  Metadata for this phar, in the format used by PHP's
`serialize` function. The meaning of the serialized data is not
specified further, it may be used to store arbitrary custom data
about the archive.

  ]##
  if this.lenMetadata != 0:
    let rawMetadataExpr = this.io.readBytes(int(this.lenMetadata))
    this.rawMetadata = rawMetadataExpr
    let rawMetadataIo = newKaitaiStream(rawMetadataExpr)
    let metadataExpr = PharWithoutStub_SerializedValue.read(rawMetadataIo, this.root, this)
    this.metadata = metadataExpr

  ##[
  Manifest entries for the files contained in this phar.
  ]##
  for i in 0 ..< int(this.numFiles):
    let it = PharWithoutStub_FileEntry.read(this.io, this.root, this)
    this.fileEntries.add(it)

proc fromFile*(_: typedesc[PharWithoutStub_Manifest], filename: string): PharWithoutStub_Manifest =
  PharWithoutStub_Manifest.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PharWithoutStub_SerializedValue], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PharWithoutStub_SerializedValue =
  template this: untyped = result
  this = new(PharWithoutStub_SerializedValue)
  let root = if root == nil: cast[PharWithoutStub](this) else: cast[PharWithoutStub](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The serialized value, as a raw byte array.
  ]##
  let rawExpr = this.io.readBytesFull()
  this.raw = rawExpr

proc parsed(this: PharWithoutStub_SerializedValue): PhpSerializedValue = 

  ##[
  The serialized value, parsed as a structure.
  ]##
  if this.parsedInstFlag:
    return this.parsedInst
  let pos = this.io.pos()
  this.io.seek(int(0))
  let parsedInstExpr = PhpSerializedValue.read(this.io, nil, nil)
  this.parsedInst = parsedInstExpr
  this.io.seek(pos)
  this.parsedInstFlag = true
  return this.parsedInst

proc fromFile*(_: typedesc[PharWithoutStub_SerializedValue], filename: string): PharWithoutStub_SerializedValue =
  PharWithoutStub_SerializedValue.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PharWithoutStub_Signature], io: KaitaiStream, root: KaitaiStruct, parent: PharWithoutStub): PharWithoutStub_Signature =
  template this: untyped = result
  this = new(PharWithoutStub_Signature)
  let root = if root == nil: cast[PharWithoutStub](this) else: cast[PharWithoutStub](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The signature data. The size and contents depend on the
signature type.

  ]##
  let dataExpr = this.io.readBytes(int((this.io.size - this.io.pos) - 8))
  this.data = dataExpr

  ##[
  The signature type.
  ]##
  let typeExpr = PharWithoutStub_SignatureType(this.io.readU4le())
  this.type = typeExpr
  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr

proc fromFile*(_: typedesc[PharWithoutStub_Signature], filename: string): PharWithoutStub_Signature =
  PharWithoutStub_Signature.read(newKaitaiFileStream(filename), nil, nil)


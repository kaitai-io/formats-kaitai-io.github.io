import kaitai_struct_nim_runtime
import options

type
  Xar* = ref object of KaitaiStruct
    `headerPrefix`*: Xar_FileHeaderPrefix
    `header`*: Xar_FileHeader
    `toc`*: Xar_TocType
    `parent`*: KaitaiStruct
    `rawHeader`*: seq[byte]
    `rawToc`*: seq[byte]
    `rawRawToc`*: seq[byte]
    `checksumAlgorithmOtherInst`*: int8
  Xar_ChecksumAlgorithmsApple* = enum
    none = 0
    sha1 = 1
    md5 = 2
    sha256 = 3
    sha512 = 4
  Xar_FileHeaderPrefix* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `lenHeader`*: uint16
    `parent`*: Xar
  Xar_FileHeader* = ref object of KaitaiStruct
    `version`*: uint16
    `lenTocCompressed`*: uint64
    `tocLengthUncompressed`*: uint64
    `checksumAlgorithmInt`*: uint32
    `checksumAlgName`*: string
    `parent`*: Xar
    `checksumAlgorithmNameInst`*: string
    `hasChecksumAlgNameInst`*: bool
    `lenHeaderInst`*: uint16
  Xar_TocType* = ref object of KaitaiStruct
    `xmlString`*: string
    `parent`*: Xar

proc read*(_: typedesc[Xar], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Xar
proc read*(_: typedesc[Xar_FileHeaderPrefix], io: KaitaiStream, root: KaitaiStruct, parent: Xar): Xar_FileHeaderPrefix
proc read*(_: typedesc[Xar_FileHeader], io: KaitaiStream, root: KaitaiStruct, parent: Xar): Xar_FileHeader
proc read*(_: typedesc[Xar_TocType], io: KaitaiStream, root: KaitaiStruct, parent: Xar): Xar_TocType

proc checksumAlgorithmOther*(this: Xar): int8
proc checksumAlgorithmName*(this: Xar_FileHeader): string
proc hasChecksumAlgName*(this: Xar_FileHeader): bool
proc lenHeader*(this: Xar_FileHeader): uint16


##[
From [Wikipedia](https://en.wikipedia.org/wiki/Xar_(archiver)):

"XAR (short for eXtensible ARchive format) is an open source file archiver
and the archiver's file format. It was created within the OpenDarwin project
and is used in macOS X 10.5 and up for software installation routines, as
well as browser extensions in Safari 5.0 and up."

@see <a href="https://github.com/mackyle/xar/wiki/xarformat">Source</a>
]##
proc read*(_: typedesc[Xar], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Xar =
  template this: untyped = result
  this = new(Xar)
  let root = if root == nil: cast[Xar](this) else: cast[Xar](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  internal; access `_root.header` instead
  ]##
  let headerPrefixExpr = Xar_FileHeaderPrefix.read(this.io, this.root, this)
  this.headerPrefix = headerPrefixExpr
  let rawHeaderExpr = this.io.readBytes(int((this.headerPrefix.lenHeader - 6)))
  this.rawHeader = rawHeaderExpr
  let rawHeaderIo = newKaitaiStream(rawHeaderExpr)
  let headerExpr = Xar_FileHeader.read(rawHeaderIo, this.root, this)
  this.header = headerExpr

  ##[
  zlib compressed XML further describing the content of the archive
  ]##
  let rawRawTocExpr = this.io.readBytes(int(this.header.lenTocCompressed))
  this.rawRawToc = rawRawTocExpr
  let rawTocExpr = this.rawRawToc.processZlib()
  this.rawToc = rawTocExpr
  let rawTocIo = newKaitaiStream(rawTocExpr)
  let tocExpr = Xar_TocType.read(rawTocIo, this.root, this)
  this.toc = tocExpr

proc checksumAlgorithmOther(this: Xar): int8 = 

  ##[
  @see <a href="https://github.com/mackyle/xar/blob/66d451d/xar/include/xar.h.in#L85">Source</a>
  ]##
  if this.checksumAlgorithmOtherInst != nil:
    return this.checksumAlgorithmOtherInst
  let checksumAlgorithmOtherInstExpr = int8(3)
  this.checksumAlgorithmOtherInst = checksumAlgorithmOtherInstExpr
  if this.checksumAlgorithmOtherInst != nil:
    return this.checksumAlgorithmOtherInst

proc fromFile*(_: typedesc[Xar], filename: string): Xar =
  Xar.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Xar_FileHeaderPrefix], io: KaitaiStream, root: KaitaiStruct, parent: Xar): Xar_FileHeaderPrefix =
  template this: untyped = result
  this = new(Xar_FileHeaderPrefix)
  let root = if root == nil: cast[Xar](this) else: cast[Xar](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr

  ##[
  internal; access `_root.header.len_header` instead
  ]##
  let lenHeaderExpr = this.io.readU2be()
  this.lenHeader = lenHeaderExpr

proc fromFile*(_: typedesc[Xar_FileHeaderPrefix], filename: string): Xar_FileHeaderPrefix =
  Xar_FileHeaderPrefix.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Xar_FileHeader], io: KaitaiStream, root: KaitaiStruct, parent: Xar): Xar_FileHeader =
  template this: untyped = result
  this = new(Xar_FileHeader)
  let root = if root == nil: cast[Xar](this) else: cast[Xar](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionExpr = this.io.readU2be()
  this.version = versionExpr
  let lenTocCompressedExpr = this.io.readU8be()
  this.lenTocCompressed = lenTocCompressedExpr
  let tocLengthUncompressedExpr = this.io.readU8be()
  this.tocLengthUncompressed = tocLengthUncompressedExpr

  ##[
  internal; access `checksum_algorithm_name` instead
  ]##
  let checksumAlgorithmIntExpr = this.io.readU4be()
  this.checksumAlgorithmInt = checksumAlgorithmIntExpr

  ##[
  internal; access `checksum_algorithm_name` instead
  ]##
  if this.hasChecksumAlgName:
    let checksumAlgNameExpr = encode(this.io.readBytesFull().bytesTerminate(0, false), "UTF-8")
    this.checksumAlgName = checksumAlgNameExpr

proc checksumAlgorithmName(this: Xar_FileHeader): string = 

  ##[
  If it is not

* `""` (empty string), indicating an unknown integer value (access
  `checksum_algorithm_int` for debugging purposes to find out
  what that value is), or
* `"none"`, indicating that the TOC checksum is not provided (in that
  case, the `<checksum>` property or its `style` attribute should be
  missing, or the `style` attribute must be set to `"none"`),

it must exactly match the `style` attribute value of the
`<checksum>` property in the root node `<toc>`. See
<https://github.com/mackyle/xar/blob/66d451d/xar/lib/archive.c#L345-L371>
for reference.

The `xar` (eXtensible ARchiver) program [uses OpenSSL's function
`EVP_get_digestbyname`](
  https://github.com/mackyle/xar/blob/66d451d/xar/lib/archive.c#L328
) to verify this value (if it's not `""` or `"none"`, of course).
So it's reasonable to assume that this can only have one of the values
that OpenSSL recognizes.

  ]##
  if this.checksumAlgorithmNameInst.len != 0:
    return this.checksumAlgorithmNameInst
  let checksumAlgorithmNameInstExpr = string((if this.hasChecksumAlgName: this.checksumAlgName else: (if this.checksumAlgorithmInt == ord(xar.none): "none" else: (if this.checksumAlgorithmInt == ord(xar.sha1): "sha1" else: (if this.checksumAlgorithmInt == ord(xar.md5): "md5" else: (if this.checksumAlgorithmInt == ord(xar.sha256): "sha256" else: (if this.checksumAlgorithmInt == ord(xar.sha512): "sha512" else: "")))))))
  this.checksumAlgorithmNameInst = checksumAlgorithmNameInstExpr
  if this.checksumAlgorithmNameInst.len != 0:
    return this.checksumAlgorithmNameInst

proc hasChecksumAlgName(this: Xar_FileHeader): bool = 
  if this.hasChecksumAlgNameInst != nil:
    return this.hasChecksumAlgNameInst
  let hasChecksumAlgNameInstExpr = bool( ((this.checksumAlgorithmInt == Xar(this.root).checksumAlgorithmOther) and (this.lenHeader >= 32) and ((this.lenHeader %%% 4) == 0)) )
  this.hasChecksumAlgNameInst = hasChecksumAlgNameInstExpr
  if this.hasChecksumAlgNameInst != nil:
    return this.hasChecksumAlgNameInst

proc lenHeader(this: Xar_FileHeader): uint16 = 
  if this.lenHeaderInst != nil:
    return this.lenHeaderInst
  let lenHeaderInstExpr = uint16(Xar(this.root).headerPrefix.lenHeader)
  this.lenHeaderInst = lenHeaderInstExpr
  if this.lenHeaderInst != nil:
    return this.lenHeaderInst

proc fromFile*(_: typedesc[Xar_FileHeader], filename: string): Xar_FileHeader =
  Xar_FileHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Xar_TocType], io: KaitaiStream, root: KaitaiStruct, parent: Xar): Xar_TocType =
  template this: untyped = result
  this = new(Xar_TocType)
  let root = if root == nil: cast[Xar](this) else: cast[Xar](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xmlStringExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.xmlString = xmlStringExpr

proc fromFile*(_: typedesc[Xar_TocType], filename: string): Xar_TocType =
  Xar_TocType.read(newKaitaiFileStream(filename), nil, nil)


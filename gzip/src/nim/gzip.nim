import kaitai_struct_nim_runtime
import options

type
  Gzip* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `compressionMethod`*: Gzip_CompressionMethods
    `flags`*: Gzip_Flags
    `modTime`*: uint32
    `extraFlags`*: Gzip_ExtraFlagsDeflate
    `os`*: Gzip_Oses
    `extras`*: Gzip_Extras
    `name`*: seq[byte]
    `comment`*: seq[byte]
    `headerCrc16`*: uint16
    `body`*: seq[byte]
    `bodyCrc32`*: uint32
    `lenUncompressed`*: uint32
    `parent`*: KaitaiStruct
  Gzip_CompressionMethods* = enum
    deflate = 8
  Gzip_Oses* = enum
    fat = 0
    amiga = 1
    vms = 2
    unix = 3
    vm_cms = 4
    atari_tos = 5
    hpfs = 6
    macintosh = 7
    z_system = 8
    cp_m = 9
    tops_20 = 10
    ntfs = 11
    qdos = 12
    acorn_riscos = 13
    unknown = 255
  Gzip_Flags* = ref object of KaitaiStruct
    `reserved1`*: uint64
    `hasComment`*: bool
    `hasName`*: bool
    `hasExtra`*: bool
    `hasHeaderCrc`*: bool
    `isText`*: bool
    `parent`*: Gzip
  Gzip_ExtraFlagsDeflate* = ref object of KaitaiStruct
    `compressionStrength`*: Gzip_ExtraFlagsDeflate_CompressionStrengths
    `parent`*: Gzip
  Gzip_ExtraFlagsDeflate_CompressionStrengths* = enum
    best = 2
    fast = 4
  Gzip_Subfields* = ref object of KaitaiStruct
    `entries`*: seq[Gzip_Subfield]
    `parent`*: Gzip_Extras
  Gzip_Subfield* = ref object of KaitaiStruct
    `id`*: uint16
    `lenData`*: uint16
    `data`*: seq[byte]
    `parent`*: Gzip_Subfields
  Gzip_Extras* = ref object of KaitaiStruct
    `lenSubfields`*: uint16
    `subfields`*: Gzip_Subfields
    `parent`*: Gzip
    `rawSubfields`*: seq[byte]

proc read*(_: typedesc[Gzip], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Gzip
proc read*(_: typedesc[Gzip_Flags], io: KaitaiStream, root: KaitaiStruct, parent: Gzip): Gzip_Flags
proc read*(_: typedesc[Gzip_ExtraFlagsDeflate], io: KaitaiStream, root: KaitaiStruct, parent: Gzip): Gzip_ExtraFlagsDeflate
proc read*(_: typedesc[Gzip_Subfields], io: KaitaiStream, root: KaitaiStruct, parent: Gzip_Extras): Gzip_Subfields
proc read*(_: typedesc[Gzip_Subfield], io: KaitaiStream, root: KaitaiStruct, parent: Gzip_Subfields): Gzip_Subfield
proc read*(_: typedesc[Gzip_Extras], io: KaitaiStream, root: KaitaiStruct, parent: Gzip): Gzip_Extras



##[
Gzip is a popular and standard single-file archiving format. It
essentially provides a container that stores original file name,
timestamp and a few other things (like optional comment), basic
CRCs, etc, and a file compressed by a chosen compression algorithm.

As of 2019, there is actually only one working solution for
compression algorithms, so it's typically raw DEFLATE stream
(without zlib header) in all gzipped files.

@see <a href="https://www.rfc-editor.org/rfc/rfc1952">Source</a>
]##
proc read*(_: typedesc[Gzip], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Gzip =
  template this: untyped = result
  this = new(Gzip)
  let root = if root == nil: cast[Gzip](this) else: cast[Gzip](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(2))
  this.magic = magicExpr

  ##[
  Compression method used to compress file body. In practice, only
one method is widely used: 8 = deflate.

  ]##
  let compressionMethodExpr = Gzip_CompressionMethods(this.io.readU1())
  this.compressionMethod = compressionMethodExpr
  let flagsExpr = Gzip_Flags.read(this.io, this.root, this)
  this.flags = flagsExpr

  ##[
  Last modification time of a file archived in UNIX timestamp format.
  ]##
  let modTimeExpr = this.io.readU4le()
  this.modTime = modTimeExpr

  ##[
  Extra flags, specific to compression method chosen.
  ]##
  block:
    let on = this.compressionMethod
    if on == gzip.deflate:
      let extraFlagsExpr = Gzip_ExtraFlagsDeflate.read(this.io, this.root, this)
      this.extraFlags = extraFlagsExpr

  ##[
  OS used to compress this file.
  ]##
  let osExpr = Gzip_Oses(this.io.readU1())
  this.os = osExpr
  if this.flags.hasExtra:
    let extrasExpr = Gzip_Extras.read(this.io, this.root, this)
    this.extras = extrasExpr
  if this.flags.hasName:
    let nameExpr = this.io.readBytesTerm(0, false, true, true)
    this.name = nameExpr
  if this.flags.hasComment:
    let commentExpr = this.io.readBytesTerm(0, false, true, true)
    this.comment = commentExpr
  if this.flags.hasHeaderCrc:
    let headerCrc16Expr = this.io.readU2le()
    this.headerCrc16 = headerCrc16Expr

  ##[
  Compressed body of a file archived. Note that we don't make an
attempt to decompress it here.

  ]##
  let bodyExpr = this.io.readBytes(int(((this.io.size - this.io.pos) - 8)))
  this.body = bodyExpr

  ##[
  CRC32 checksum of an uncompressed file body

  ]##
  let bodyCrc32Expr = this.io.readU4le()
  this.bodyCrc32 = bodyCrc32Expr

  ##[
  Size of original uncompressed data in bytes (truncated to 32
bits).

  ]##
  let lenUncompressedExpr = this.io.readU4le()
  this.lenUncompressed = lenUncompressedExpr

proc fromFile*(_: typedesc[Gzip], filename: string): Gzip =
  Gzip.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Gzip_Flags], io: KaitaiStream, root: KaitaiStruct, parent: Gzip): Gzip_Flags =
  template this: untyped = result
  this = new(Gzip_Flags)
  let root = if root == nil: cast[Gzip](this) else: cast[Gzip](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reserved1Expr = this.io.readBitsIntBe(3)
  this.reserved1 = reserved1Expr
  let hasCommentExpr = this.io.readBitsIntBe(1) != 0
  this.hasComment = hasCommentExpr
  let hasNameExpr = this.io.readBitsIntBe(1) != 0
  this.hasName = hasNameExpr

  ##[
  If true, optional extra fields are present in the archive.
  ]##
  let hasExtraExpr = this.io.readBitsIntBe(1) != 0
  this.hasExtra = hasExtraExpr

  ##[
  If true, this archive includes a CRC16 checksum for the header.

  ]##
  let hasHeaderCrcExpr = this.io.readBitsIntBe(1) != 0
  this.hasHeaderCrc = hasHeaderCrcExpr

  ##[
  If true, file inside this archive is a text file from
compressor's point of view.

  ]##
  let isTextExpr = this.io.readBitsIntBe(1) != 0
  this.isText = isTextExpr

proc fromFile*(_: typedesc[Gzip_Flags], filename: string): Gzip_Flags =
  Gzip_Flags.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Gzip_ExtraFlagsDeflate], io: KaitaiStream, root: KaitaiStruct, parent: Gzip): Gzip_ExtraFlagsDeflate =
  template this: untyped = result
  this = new(Gzip_ExtraFlagsDeflate)
  let root = if root == nil: cast[Gzip](this) else: cast[Gzip](root)
  this.io = io
  this.root = root
  this.parent = parent

  let compressionStrengthExpr = Gzip_ExtraFlagsDeflate_CompressionStrengths(this.io.readU1())
  this.compressionStrength = compressionStrengthExpr

proc fromFile*(_: typedesc[Gzip_ExtraFlagsDeflate], filename: string): Gzip_ExtraFlagsDeflate =
  Gzip_ExtraFlagsDeflate.read(newKaitaiFileStream(filename), nil, nil)


##[
Container for many subfields, constrained by size of stream.

]##
proc read*(_: typedesc[Gzip_Subfields], io: KaitaiStream, root: KaitaiStruct, parent: Gzip_Extras): Gzip_Subfields =
  template this: untyped = result
  this = new(Gzip_Subfields)
  let root = if root == nil: cast[Gzip](this) else: cast[Gzip](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Gzip_Subfield.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[Gzip_Subfields], filename: string): Gzip_Subfields =
  Gzip_Subfields.read(newKaitaiFileStream(filename), nil, nil)


##[
Every subfield follows typical [TLV scheme](https://en.wikipedia.org/wiki/Type-length-value):

* `id` serves role of "T"ype
* `len_data` serves role of "L"ength
* `data` serves role of "V"alue

This way it's possible to for arbitrary parser to skip over
subfields it does not support.

]##
proc read*(_: typedesc[Gzip_Subfield], io: KaitaiStream, root: KaitaiStruct, parent: Gzip_Subfields): Gzip_Subfield =
  template this: untyped = result
  this = new(Gzip_Subfield)
  let root = if root == nil: cast[Gzip](this) else: cast[Gzip](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Subfield ID, typically two ASCII letters.
  ]##
  let idExpr = this.io.readU2le()
  this.id = idExpr
  let lenDataExpr = this.io.readU2le()
  this.lenData = lenDataExpr
  let dataExpr = this.io.readBytes(int(this.lenData))
  this.data = dataExpr

proc fromFile*(_: typedesc[Gzip_Subfield], filename: string): Gzip_Subfield =
  Gzip_Subfield.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Gzip_Extras], io: KaitaiStream, root: KaitaiStruct, parent: Gzip): Gzip_Extras =
  template this: untyped = result
  this = new(Gzip_Extras)
  let root = if root == nil: cast[Gzip](this) else: cast[Gzip](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenSubfieldsExpr = this.io.readU2le()
  this.lenSubfields = lenSubfieldsExpr
  let rawSubfieldsExpr = this.io.readBytes(int(this.lenSubfields))
  this.rawSubfields = rawSubfieldsExpr
  let rawSubfieldsIo = newKaitaiStream(rawSubfieldsExpr)
  let subfieldsExpr = Gzip_Subfields.read(rawSubfieldsIo, this.root, this)
  this.subfields = subfieldsExpr

proc fromFile*(_: typedesc[Gzip_Extras], filename: string): Gzip_Extras =
  Gzip_Extras.read(newKaitaiFileStream(filename), nil, nil)


import kaitai_struct_nim_runtime
import options

type
  AllegroDat* = ref object of KaitaiStruct
    `packMagic`*: AllegroDat_PackEnum
    `datMagic`*: seq[byte]
    `numObjects`*: uint32
    `objects`*: seq[AllegroDat_DatObject]
    `parent`*: KaitaiStruct
  AllegroDat_PackEnum* = enum
    unpacked = 1936484398
  AllegroDat_DatFont16* = ref object of KaitaiStruct
    `chars`*: seq[seq[byte]]
    `parent`*: AllegroDat_DatFont
  AllegroDat_DatBitmap* = ref object of KaitaiStruct
    `bitsPerPixel`*: int16
    `width`*: uint16
    `height`*: uint16
    `image`*: seq[byte]
    `parent`*: AllegroDat_DatObject
  AllegroDat_DatFont* = ref object of KaitaiStruct
    `fontSize`*: int16
    `body`*: KaitaiStruct
    `parent`*: AllegroDat_DatObject
  AllegroDat_DatFont8* = ref object of KaitaiStruct
    `chars`*: seq[seq[byte]]
    `parent`*: AllegroDat_DatFont
  AllegroDat_DatObject* = ref object of KaitaiStruct
    `properties`*: seq[AllegroDat_Property]
    `lenCompressed`*: int32
    `lenUncompressed`*: int32
    `body`*: KaitaiStruct
    `parent`*: AllegroDat
    `rawBody`*: seq[byte]
    `typeInst`: string
    `typeInstFlag`: bool
  AllegroDat_DatFont39* = ref object of KaitaiStruct
    `numRanges`*: int16
    `ranges`*: seq[AllegroDat_DatFont39_Range]
    `parent`*: AllegroDat_DatFont
  AllegroDat_DatFont39_Range* = ref object of KaitaiStruct
    `mono`*: uint8
    `startChar`*: uint32
    `endChar`*: uint32
    `chars`*: seq[AllegroDat_DatFont39_FontChar]
    `parent`*: AllegroDat_DatFont39
  AllegroDat_DatFont39_FontChar* = ref object of KaitaiStruct
    `width`*: uint16
    `height`*: uint16
    `body`*: seq[byte]
    `parent`*: AllegroDat_DatFont39_Range
  AllegroDat_Property* = ref object of KaitaiStruct
    `magic`*: string
    `type`*: string
    `lenBody`*: uint32
    `body`*: string
    `parent`*: AllegroDat_DatObject
    `isValidInst`: bool
    `isValidInstFlag`: bool
  AllegroDat_DatRleSprite* = ref object of KaitaiStruct
    `bitsPerPixel`*: int16
    `width`*: uint16
    `height`*: uint16
    `lenImage`*: uint32
    `image`*: seq[byte]
    `parent`*: AllegroDat_DatObject

proc read*(_: typedesc[AllegroDat], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AllegroDat
proc read*(_: typedesc[AllegroDat_DatFont16], io: KaitaiStream, root: KaitaiStruct, parent: AllegroDat_DatFont): AllegroDat_DatFont16
proc read*(_: typedesc[AllegroDat_DatBitmap], io: KaitaiStream, root: KaitaiStruct, parent: AllegroDat_DatObject): AllegroDat_DatBitmap
proc read*(_: typedesc[AllegroDat_DatFont], io: KaitaiStream, root: KaitaiStruct, parent: AllegroDat_DatObject): AllegroDat_DatFont
proc read*(_: typedesc[AllegroDat_DatFont8], io: KaitaiStream, root: KaitaiStruct, parent: AllegroDat_DatFont): AllegroDat_DatFont8
proc read*(_: typedesc[AllegroDat_DatObject], io: KaitaiStream, root: KaitaiStruct, parent: AllegroDat): AllegroDat_DatObject
proc read*(_: typedesc[AllegroDat_DatFont39], io: KaitaiStream, root: KaitaiStruct, parent: AllegroDat_DatFont): AllegroDat_DatFont39
proc read*(_: typedesc[AllegroDat_DatFont39_Range], io: KaitaiStream, root: KaitaiStruct, parent: AllegroDat_DatFont39): AllegroDat_DatFont39_Range
proc read*(_: typedesc[AllegroDat_DatFont39_FontChar], io: KaitaiStream, root: KaitaiStruct, parent: AllegroDat_DatFont39_Range): AllegroDat_DatFont39_FontChar
proc read*(_: typedesc[AllegroDat_Property], io: KaitaiStream, root: KaitaiStruct, parent: AllegroDat_DatObject): AllegroDat_Property
proc read*(_: typedesc[AllegroDat_DatRleSprite], io: KaitaiStream, root: KaitaiStruct, parent: AllegroDat_DatObject): AllegroDat_DatRleSprite

proc type*(this: AllegroDat_DatObject): string
proc isValid*(this: AllegroDat_Property): bool


##[
Allegro library for C (mostly used for game and multimedia apps
programming) used its own container file format.

In general, it allows storage of arbitrary binary data blocks
bundled together with some simple key-value style metadata
("properties") for every block. Allegro also pre-defines some simple
formats for bitmaps, fonts, MIDI music, sound samples and
palettes. Allegro library v4.0+ also support LZSS compression.

This spec applies to Allegro data files for library versions 2.2 up
to 4.4.

@see <a href="https://liballeg.org/stabledocs/en/datafile.html">Source</a>
]##
proc read*(_: typedesc[AllegroDat], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): AllegroDat =
  template this: untyped = result
  this = new(AllegroDat)
  let root = if root == nil: cast[AllegroDat](this) else: cast[AllegroDat](root)
  this.io = io
  this.root = root
  this.parent = parent

  let packMagicExpr = AllegroDat_PackEnum(this.io.readU4be())
  this.packMagic = packMagicExpr
  let datMagicExpr = this.io.readBytes(int(4))
  this.datMagic = datMagicExpr
  let numObjectsExpr = this.io.readU4be()
  this.numObjects = numObjectsExpr
  for i in 0 ..< int(this.numObjects):
    let it = AllegroDat_DatObject.read(this.io, this.root, this)
    this.objects.add(it)

proc fromFile*(_: typedesc[AllegroDat], filename: string): AllegroDat =
  AllegroDat.read(newKaitaiFileStream(filename), nil, nil)


##[
Simple monochrome monospaced font, 95 characters, 8x16 px
characters.

]##
proc read*(_: typedesc[AllegroDat_DatFont16], io: KaitaiStream, root: KaitaiStruct, parent: AllegroDat_DatFont): AllegroDat_DatFont16 =
  template this: untyped = result
  this = new(AllegroDat_DatFont16)
  let root = if root == nil: cast[AllegroDat](this) else: cast[AllegroDat](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int(95):
    let it = this.io.readBytes(int(16))
    this.chars.add(it)

proc fromFile*(_: typedesc[AllegroDat_DatFont16], filename: string): AllegroDat_DatFont16 =
  AllegroDat_DatFont16.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AllegroDat_DatBitmap], io: KaitaiStream, root: KaitaiStruct, parent: AllegroDat_DatObject): AllegroDat_DatBitmap =
  template this: untyped = result
  this = new(AllegroDat_DatBitmap)
  let root = if root == nil: cast[AllegroDat](this) else: cast[AllegroDat](root)
  this.io = io
  this.root = root
  this.parent = parent

  let bitsPerPixelExpr = this.io.readS2be()
  this.bitsPerPixel = bitsPerPixelExpr
  let widthExpr = this.io.readU2be()
  this.width = widthExpr
  let heightExpr = this.io.readU2be()
  this.height = heightExpr
  let imageExpr = this.io.readBytesFull()
  this.image = imageExpr

proc fromFile*(_: typedesc[AllegroDat_DatBitmap], filename: string): AllegroDat_DatBitmap =
  AllegroDat_DatBitmap.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AllegroDat_DatFont], io: KaitaiStream, root: KaitaiStruct, parent: AllegroDat_DatObject): AllegroDat_DatFont =
  template this: untyped = result
  this = new(AllegroDat_DatFont)
  let root = if root == nil: cast[AllegroDat](this) else: cast[AllegroDat](root)
  this.io = io
  this.root = root
  this.parent = parent

  let fontSizeExpr = this.io.readS2be()
  this.fontSize = fontSizeExpr
  block:
    let on = this.fontSize
    if on == 8:
      let bodyExpr = AllegroDat_DatFont8.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == 16:
      let bodyExpr = AllegroDat_DatFont16.read(this.io, this.root, this)
      this.body = bodyExpr
    elif on == 0:
      let bodyExpr = AllegroDat_DatFont39.read(this.io, this.root, this)
      this.body = bodyExpr

proc fromFile*(_: typedesc[AllegroDat_DatFont], filename: string): AllegroDat_DatFont =
  AllegroDat_DatFont.read(newKaitaiFileStream(filename), nil, nil)


##[
Simple monochrome monospaced font, 95 characters, 8x8 px
characters.

]##
proc read*(_: typedesc[AllegroDat_DatFont8], io: KaitaiStream, root: KaitaiStruct, parent: AllegroDat_DatFont): AllegroDat_DatFont8 =
  template this: untyped = result
  this = new(AllegroDat_DatFont8)
  let root = if root == nil: cast[AllegroDat](this) else: cast[AllegroDat](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int(95):
    let it = this.io.readBytes(int(8))
    this.chars.add(it)

proc fromFile*(_: typedesc[AllegroDat_DatFont8], filename: string): AllegroDat_DatFont8 =
  AllegroDat_DatFont8.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AllegroDat_DatObject], io: KaitaiStream, root: KaitaiStruct, parent: AllegroDat): AllegroDat_DatObject =
  template this: untyped = result
  this = new(AllegroDat_DatObject)
  let root = if root == nil: cast[AllegroDat](this) else: cast[AllegroDat](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while true:
      let it = AllegroDat_Property.read(this.io, this.root, this)
      this.properties.add(it)
      if not(it.isValid):
        break
      inc i
  let lenCompressedExpr = this.io.readS4be()
  this.lenCompressed = lenCompressedExpr
  let lenUncompressedExpr = this.io.readS4be()
  this.lenUncompressed = lenUncompressedExpr
  block:
    let on = this.type
    if on == "BMP ":
      let rawBodyExpr = this.io.readBytes(int(this.lenCompressed))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = AllegroDat_DatBitmap.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == "RLE ":
      let rawBodyExpr = this.io.readBytes(int(this.lenCompressed))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = AllegroDat_DatRleSprite.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == "FONT":
      let rawBodyExpr = this.io.readBytes(int(this.lenCompressed))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = AllegroDat_DatFont.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    else:
      let bodyExpr = this.io.readBytes(int(this.lenCompressed))
      this.body = bodyExpr

proc type(this: AllegroDat_DatObject): string = 
  if this.typeInstFlag:
    return this.typeInst
  let typeInstExpr = string(this.properties[^1].magic)
  this.typeInst = typeInstExpr
  this.typeInstFlag = true
  return this.typeInst

proc fromFile*(_: typedesc[AllegroDat_DatObject], filename: string): AllegroDat_DatObject =
  AllegroDat_DatObject.read(newKaitaiFileStream(filename), nil, nil)


##[
New bitmap font format introduced since Allegro 3.9: allows
flexible designation of character ranges, 8-bit colored
characters, etc.

]##
proc read*(_: typedesc[AllegroDat_DatFont39], io: KaitaiStream, root: KaitaiStruct, parent: AllegroDat_DatFont): AllegroDat_DatFont39 =
  template this: untyped = result
  this = new(AllegroDat_DatFont39)
  let root = if root == nil: cast[AllegroDat](this) else: cast[AllegroDat](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numRangesExpr = this.io.readS2be()
  this.numRanges = numRangesExpr
  for i in 0 ..< int(this.numRanges):
    let it = AllegroDat_DatFont39_Range.read(this.io, this.root, this)
    this.ranges.add(it)

proc fromFile*(_: typedesc[AllegroDat_DatFont39], filename: string): AllegroDat_DatFont39 =
  AllegroDat_DatFont39.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AllegroDat_DatFont39_Range], io: KaitaiStream, root: KaitaiStruct, parent: AllegroDat_DatFont39): AllegroDat_DatFont39_Range =
  template this: untyped = result
  this = new(AllegroDat_DatFont39_Range)
  let root = if root == nil: cast[AllegroDat](this) else: cast[AllegroDat](root)
  this.io = io
  this.root = root
  this.parent = parent

  let monoExpr = this.io.readU1()
  this.mono = monoExpr

  ##[
  First character in range
  ]##
  let startCharExpr = this.io.readU4be()
  this.startChar = startCharExpr

  ##[
  Last character in range (inclusive)
  ]##
  let endCharExpr = this.io.readU4be()
  this.endChar = endCharExpr
  for i in 0 ..< int(((this.endChar - this.startChar) + 1)):
    let it = AllegroDat_DatFont39_FontChar.read(this.io, this.root, this)
    this.chars.add(it)

proc fromFile*(_: typedesc[AllegroDat_DatFont39_Range], filename: string): AllegroDat_DatFont39_Range =
  AllegroDat_DatFont39_Range.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AllegroDat_DatFont39_FontChar], io: KaitaiStream, root: KaitaiStruct, parent: AllegroDat_DatFont39_Range): AllegroDat_DatFont39_FontChar =
  template this: untyped = result
  this = new(AllegroDat_DatFont39_FontChar)
  let root = if root == nil: cast[AllegroDat](this) else: cast[AllegroDat](root)
  this.io = io
  this.root = root
  this.parent = parent

  let widthExpr = this.io.readU2be()
  this.width = widthExpr
  let heightExpr = this.io.readU2be()
  this.height = heightExpr
  let bodyExpr = this.io.readBytes(int((this.width * this.height)))
  this.body = bodyExpr

proc fromFile*(_: typedesc[AllegroDat_DatFont39_FontChar], filename: string): AllegroDat_DatFont39_FontChar =
  AllegroDat_DatFont39_FontChar.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AllegroDat_Property], io: KaitaiStream, root: KaitaiStruct, parent: AllegroDat_DatObject): AllegroDat_Property =
  template this: untyped = result
  this = new(AllegroDat_Property)
  let root = if root == nil: cast[AllegroDat](this) else: cast[AllegroDat](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = encode(this.io.readBytes(int(4)), "UTF-8")
  this.magic = magicExpr
  if this.isValid:
    let typeExpr = encode(this.io.readBytes(int(4)), "UTF-8")
    this.type = typeExpr
  if this.isValid:
    let lenBodyExpr = this.io.readU4be()
    this.lenBody = lenBodyExpr
  if this.isValid:
    let bodyExpr = encode(this.io.readBytes(int(this.lenBody)), "UTF-8")
    this.body = bodyExpr

proc isValid(this: AllegroDat_Property): bool = 
  if this.isValidInstFlag:
    return this.isValidInst
  let isValidInstExpr = bool(this.magic == "prop")
  this.isValidInst = isValidInstExpr
  this.isValidInstFlag = true
  return this.isValidInst

proc fromFile*(_: typedesc[AllegroDat_Property], filename: string): AllegroDat_Property =
  AllegroDat_Property.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[AllegroDat_DatRleSprite], io: KaitaiStream, root: KaitaiStruct, parent: AllegroDat_DatObject): AllegroDat_DatRleSprite =
  template this: untyped = result
  this = new(AllegroDat_DatRleSprite)
  let root = if root == nil: cast[AllegroDat](this) else: cast[AllegroDat](root)
  this.io = io
  this.root = root
  this.parent = parent

  let bitsPerPixelExpr = this.io.readS2be()
  this.bitsPerPixel = bitsPerPixelExpr
  let widthExpr = this.io.readU2be()
  this.width = widthExpr
  let heightExpr = this.io.readU2be()
  this.height = heightExpr
  let lenImageExpr = this.io.readU4be()
  this.lenImage = lenImageExpr
  let imageExpr = this.io.readBytesFull()
  this.image = imageExpr

proc fromFile*(_: typedesc[AllegroDat_DatRleSprite], filename: string): AllegroDat_DatRleSprite =
  AllegroDat_DatRleSprite.read(newKaitaiFileStream(filename), nil, nil)


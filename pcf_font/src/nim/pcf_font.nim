import kaitai_struct_nim_runtime
import options
import /common/bytes_with_io

import "bytes_with_io"
type
  PcfFont* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `numTables`*: uint32
    `tables`*: seq[PcfFont_Table]
    `parent`*: KaitaiStruct
  PcfFont_Types* = enum
    properties = 1
    accelerators = 2
    metrics = 4
    bitmaps = 8
    ink_metrics = 16
    bdf_encodings = 32
    swidths = 64
    glyph_names = 128
    bdf_accelerators = 256
  PcfFont_Table* = ref object of KaitaiStruct
    `type`*: PcfFont_Types
    `format`*: PcfFont_Format
    `lenBody`*: uint32
    `ofsBody`*: uint32
    `parent`*: PcfFont
    `rawBodyInst`*: seq[byte]
    `bodyInst`: KaitaiStruct
    `bodyInstFlag`: bool
  PcfFont_Table_Swidths* = ref object of KaitaiStruct
    `format`*: PcfFont_Format
    `numGlyphs`*: uint32
    `swidths`*: seq[uint32]
    `parent`*: PcfFont_Table
  PcfFont_Table_Properties* = ref object of KaitaiStruct
    `format`*: PcfFont_Format
    `numProps`*: uint32
    `props`*: seq[PcfFont_Table_Properties_Prop]
    `padding`*: seq[byte]
    `lenStrings`*: uint32
    `strings`*: BytesWithIo
    `parent`*: PcfFont_Table
    `rawStrings`*: seq[byte]
  PcfFont_Table_Properties_Prop* = ref object of KaitaiStruct
    `ofsName`*: uint32
    `isString`*: uint8
    `valueOrOfsValue`*: uint32
    `parent`*: PcfFont_Table_Properties
    `nameInst`: string
    `nameInstFlag`: bool
    `strValueInst`: string
    `strValueInstFlag`: bool
    `intValueInst`: uint32
    `intValueInstFlag`: bool
  PcfFont_Table_BdfEncodings* = ref object of KaitaiStruct
    `format`*: PcfFont_Format
    `minCharOrByte2`*: uint16
    `maxCharOrByte2`*: uint16
    `minByte1`*: uint16
    `maxByte1`*: uint16
    `defaultChar`*: uint16
    `glyphIndexes`*: seq[uint16]
    `parent`*: PcfFont_Table
  PcfFont_Table_GlyphNames* = ref object of KaitaiStruct
    `format`*: PcfFont_Format
    `numGlyphs`*: uint32
    `names`*: seq[PcfFont_Table_GlyphNames_StringRef]
    `lenStrings`*: uint32
    `strings`*: BytesWithIo
    `parent`*: PcfFont_Table
    `rawStrings`*: seq[byte]
  PcfFont_Table_GlyphNames_StringRef* = ref object of KaitaiStruct
    `ofsString`*: uint32
    `parent`*: PcfFont_Table_GlyphNames
    `valueInst`: string
    `valueInstFlag`: bool
  PcfFont_Table_Bitmaps* = ref object of KaitaiStruct
    `format`*: PcfFont_Format
    `numGlyphs`*: uint32
    `offsets`*: seq[uint32]
    `bitmapSizes`*: seq[uint32]
    `parent`*: PcfFont_Table
  PcfFont_Format* = ref object of KaitaiStruct
    `padding1`*: uint64
    `scanUnitMask`*: uint64
    `isMostSignificantBitFirst`*: bool
    `isBigEndian`*: bool
    `glyphPadMask`*: uint64
    `format`*: uint8
    `padding`*: uint16
    `parent`*: KaitaiStruct

proc read*(_: typedesc[PcfFont], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PcfFont
proc read*(_: typedesc[PcfFont_Table], io: KaitaiStream, root: KaitaiStruct, parent: PcfFont): PcfFont_Table
proc read*(_: typedesc[PcfFont_Table_Swidths], io: KaitaiStream, root: KaitaiStruct, parent: PcfFont_Table): PcfFont_Table_Swidths
proc read*(_: typedesc[PcfFont_Table_Properties], io: KaitaiStream, root: KaitaiStruct, parent: PcfFont_Table): PcfFont_Table_Properties
proc read*(_: typedesc[PcfFont_Table_Properties_Prop], io: KaitaiStream, root: KaitaiStruct, parent: PcfFont_Table_Properties): PcfFont_Table_Properties_Prop
proc read*(_: typedesc[PcfFont_Table_BdfEncodings], io: KaitaiStream, root: KaitaiStruct, parent: PcfFont_Table): PcfFont_Table_BdfEncodings
proc read*(_: typedesc[PcfFont_Table_GlyphNames], io: KaitaiStream, root: KaitaiStruct, parent: PcfFont_Table): PcfFont_Table_GlyphNames
proc read*(_: typedesc[PcfFont_Table_GlyphNames_StringRef], io: KaitaiStream, root: KaitaiStruct, parent: PcfFont_Table_GlyphNames): PcfFont_Table_GlyphNames_StringRef
proc read*(_: typedesc[PcfFont_Table_Bitmaps], io: KaitaiStream, root: KaitaiStruct, parent: PcfFont_Table): PcfFont_Table_Bitmaps
proc read*(_: typedesc[PcfFont_Format], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PcfFont_Format

proc body*(this: PcfFont_Table): KaitaiStruct
proc name*(this: PcfFont_Table_Properties_Prop): string
proc strValue*(this: PcfFont_Table_Properties_Prop): string
proc intValue*(this: PcfFont_Table_Properties_Prop): uint32
proc value*(this: PcfFont_Table_GlyphNames_StringRef): string


##[
Portable Compiled Format (PCF) font is a bitmap font format
originating from X11 Window System. It matches BDF format (which is
text-based) closely, but instead being binary and
platform-independent (as opposed to previously used SNF binary
format) due to introduced features to handle different endianness
and bit order.

The overall composition of the format is straightforward: it's more
or less classic directory of type-offset-size pointers, pointing to
what PCF format calls "tables". Each table carries a certain
piece of information related to the font (metadata properties,
metrics, bitmaps, mapping of glyphs to characters, etc).

@see <a href="https://fontforge.org/docs/techref/pcf-format.html">Source</a>
]##
proc read*(_: typedesc[PcfFont], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PcfFont =
  template this: untyped = result
  this = new(PcfFont)
  let root = if root == nil: cast[PcfFont](this) else: cast[PcfFont](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let numTablesExpr = this.io.readU4le()
  this.numTables = numTablesExpr
  for i in 0 ..< int(this.numTables):
    let it = PcfFont_Table.read(this.io, this.root, this)
    this.tables.add(it)

proc fromFile*(_: typedesc[PcfFont], filename: string): PcfFont =
  PcfFont.read(newKaitaiFileStream(filename), nil, nil)


##[
Table offers a offset + length pointer to a particular
table. "Type" of table references certain enum. Applications can
ignore enum values which they don't support.

]##
proc read*(_: typedesc[PcfFont_Table], io: KaitaiStream, root: KaitaiStruct, parent: PcfFont): PcfFont_Table =
  template this: untyped = result
  this = new(PcfFont_Table)
  let root = if root == nil: cast[PcfFont](this) else: cast[PcfFont](root)
  this.io = io
  this.root = root
  this.parent = parent

  let typeExpr = PcfFont_Types(this.io.readU4le())
  this.type = typeExpr
  let formatExpr = PcfFont_Format.read(this.io, this.root, this)
  this.format = formatExpr
  let lenBodyExpr = this.io.readU4le()
  this.lenBody = lenBodyExpr
  let ofsBodyExpr = this.io.readU4le()
  this.ofsBody = ofsBodyExpr

proc body(this: PcfFont_Table): KaitaiStruct = 
  if this.bodyInstFlag:
    return this.bodyInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsBody))
  block:
    let on = this.type
    if on == pcf_font.properties:
      let rawBodyInstExpr = this.io.readBytes(int(this.lenBody))
      this.rawBodyInst = rawBodyInstExpr
      let rawBodyInstIo = newKaitaiStream(rawBodyInstExpr)
      let bodyInstExpr = PcfFont_Table_Properties.read(rawBodyInstIo, this.root, this)
      this.bodyInst = bodyInstExpr
    elif on == pcf_font.bdf_encodings:
      let rawBodyInstExpr = this.io.readBytes(int(this.lenBody))
      this.rawBodyInst = rawBodyInstExpr
      let rawBodyInstIo = newKaitaiStream(rawBodyInstExpr)
      let bodyInstExpr = PcfFont_Table_BdfEncodings.read(rawBodyInstIo, this.root, this)
      this.bodyInst = bodyInstExpr
    elif on == pcf_font.swidths:
      let rawBodyInstExpr = this.io.readBytes(int(this.lenBody))
      this.rawBodyInst = rawBodyInstExpr
      let rawBodyInstIo = newKaitaiStream(rawBodyInstExpr)
      let bodyInstExpr = PcfFont_Table_Swidths.read(rawBodyInstIo, this.root, this)
      this.bodyInst = bodyInstExpr
    elif on == pcf_font.glyph_names:
      let rawBodyInstExpr = this.io.readBytes(int(this.lenBody))
      this.rawBodyInst = rawBodyInstExpr
      let rawBodyInstIo = newKaitaiStream(rawBodyInstExpr)
      let bodyInstExpr = PcfFont_Table_GlyphNames.read(rawBodyInstIo, this.root, this)
      this.bodyInst = bodyInstExpr
    elif on == pcf_font.bitmaps:
      let rawBodyInstExpr = this.io.readBytes(int(this.lenBody))
      this.rawBodyInst = rawBodyInstExpr
      let rawBodyInstIo = newKaitaiStream(rawBodyInstExpr)
      let bodyInstExpr = PcfFont_Table_Bitmaps.read(rawBodyInstIo, this.root, this)
      this.bodyInst = bodyInstExpr
    else:
      let bodyInstExpr = this.io.readBytes(int(this.lenBody))
      this.bodyInst = bodyInstExpr
  this.io.seek(pos)
  this.bodyInstFlag = true
  return this.bodyInst

proc fromFile*(_: typedesc[PcfFont_Table], filename: string): PcfFont_Table =
  PcfFont_Table.read(newKaitaiFileStream(filename), nil, nil)


##[
Table containing scalable widths of characters.

@see <a href="https://fontforge.org/docs/techref/pcf-format.html#the-scalable-widths-table">Source</a>
]##
proc read*(_: typedesc[PcfFont_Table_Swidths], io: KaitaiStream, root: KaitaiStruct, parent: PcfFont_Table): PcfFont_Table_Swidths =
  template this: untyped = result
  this = new(PcfFont_Table_Swidths)
  let root = if root == nil: cast[PcfFont](this) else: cast[PcfFont](root)
  this.io = io
  this.root = root
  this.parent = parent

  let formatExpr = PcfFont_Format.read(this.io, this.root, this)
  this.format = formatExpr
  let numGlyphsExpr = this.io.readU4le()
  this.numGlyphs = numGlyphsExpr

  ##[
  The scalable width of a character is the width of the corresponding
PostScript character in em-units (1/1000ths of an em).

  ]##
  for i in 0 ..< int(this.numGlyphs):
    let it = this.io.readU4le()
    this.swidths.add(it)

proc fromFile*(_: typedesc[PcfFont_Table_Swidths], filename: string): PcfFont_Table_Swidths =
  PcfFont_Table_Swidths.read(newKaitaiFileStream(filename), nil, nil)


##[
Array of properties (key-value pairs), used to convey different X11
settings of a font. Key is always an X font atom.

@see <a href="https://fontforge.org/docs/techref/pcf-format.html#properties-table">Source</a>
]##
proc read*(_: typedesc[PcfFont_Table_Properties], io: KaitaiStream, root: KaitaiStruct, parent: PcfFont_Table): PcfFont_Table_Properties =
  template this: untyped = result
  this = new(PcfFont_Table_Properties)
  let root = if root == nil: cast[PcfFont](this) else: cast[PcfFont](root)
  this.io = io
  this.root = root
  this.parent = parent

  let formatExpr = PcfFont_Format.read(this.io, this.root, this)
  this.format = formatExpr
  let numPropsExpr = this.io.readU4le()
  this.numProps = numPropsExpr
  for i in 0 ..< int(this.numProps):
    let it = PcfFont_Table_Properties_Prop.read(this.io, this.root, this)
    this.props.add(it)
  let paddingExpr = this.io.readBytes(int((if (this.numProps and 3) == 0: 0 else: (4 - (this.numProps and 3)))))
  this.padding = paddingExpr
  let lenStringsExpr = this.io.readU4le()
  this.lenStrings = lenStringsExpr

  ##[
  Strings buffer. Never used directly, but instead is
addressed by offsets from the properties.

  ]##
  let rawStringsExpr = this.io.readBytes(int(this.lenStrings))
  this.rawStrings = rawStringsExpr
  let rawStringsIo = newKaitaiStream(rawStringsExpr)
  let stringsExpr = BytesWithIo.read(rawStringsIo, this.root, this)
  this.strings = stringsExpr

proc fromFile*(_: typedesc[PcfFont_Table_Properties], filename: string): PcfFont_Table_Properties =
  PcfFont_Table_Properties.read(newKaitaiFileStream(filename), nil, nil)


##[
Property is a key-value pair, "key" being always a
string and "value" being either a string or a 32-bit
integer based on an additinal flag (`is_string`).

Simple offset-based mechanism is employed to keep this
type's sequence fixed-sized and thus have simple access
to property key/value by index.

]##
proc read*(_: typedesc[PcfFont_Table_Properties_Prop], io: KaitaiStream, root: KaitaiStruct, parent: PcfFont_Table_Properties): PcfFont_Table_Properties_Prop =
  template this: untyped = result
  this = new(PcfFont_Table_Properties_Prop)
  let root = if root == nil: cast[PcfFont](this) else: cast[PcfFont](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Offset to name in the strings buffer.
  ]##
  let ofsNameExpr = this.io.readU4le()
  this.ofsName = ofsNameExpr

  ##[
  Designates if value is an integer (zero) or a string (non-zero).

  ]##
  let isStringExpr = this.io.readU1()
  this.isString = isStringExpr

  ##[
  If the value is an integer (`is_string` is false),
then it's stored here. If the value is a string
(`is_string` is true), then it stores offset to the
value in the strings buffer.

  ]##
  let valueOrOfsValueExpr = this.io.readU4le()
  this.valueOrOfsValue = valueOrOfsValueExpr

proc name(this: PcfFont_Table_Properties_Prop): string = 

  ##[
  Name of the property addressed in the strings buffer.

  ]##
  if this.nameInstFlag:
    return this.nameInst
  let io = this.parent.strings.io
  let pos = io.pos()
  io.seek(int(this.ofsName))
  let nameInstExpr = encode(io.readBytesTerm(0, false, true, true), "UTF-8")
  this.nameInst = nameInstExpr
  io.seek(pos)
  this.nameInstFlag = true
  return this.nameInst

proc strValue(this: PcfFont_Table_Properties_Prop): string = 

  ##[
  Value of the property addressed in the strings
buffer, if this is a string value.

  ]##
  if this.strValueInstFlag:
    return this.strValueInst
  if this.isString != 0:
    let io = this.parent.strings.io
    let pos = io.pos()
    io.seek(int(this.valueOrOfsValue))
    let strValueInstExpr = encode(io.readBytesTerm(0, false, true, true), "UTF-8")
    this.strValueInst = strValueInstExpr
    io.seek(pos)
  this.strValueInstFlag = true
  return this.strValueInst

proc intValue(this: PcfFont_Table_Properties_Prop): uint32 = 

  ##[
  Value of the property, if this is an integer value.

  ]##
  if this.intValueInstFlag:
    return this.intValueInst
  if this.isString == 0:
    let intValueInstExpr = uint32(this.valueOrOfsValue)
    this.intValueInst = intValueInstExpr
  this.intValueInstFlag = true
  return this.intValueInst

proc fromFile*(_: typedesc[PcfFont_Table_Properties_Prop], filename: string): PcfFont_Table_Properties_Prop =
  PcfFont_Table_Properties_Prop.read(newKaitaiFileStream(filename), nil, nil)


##[
Table that allows mapping of character codes to glyphs present in the
font. Supports 1-byte and 2-byte character codes.

Note that this mapping is agnostic to character encoding itself - it
can represent ASCII, Unicode (ISO/IEC 10646), various single-byte
national encodings, etc. If application cares about it, normally
encoding will be specified in `properties` table, in the properties named
`CHARSET_REGISTRY` / `CHARSET_ENCODING`.

@see <a href="https://fontforge.org/docs/techref/pcf-format.html#the-encoding-table">Source</a>
]##
proc read*(_: typedesc[PcfFont_Table_BdfEncodings], io: KaitaiStream, root: KaitaiStruct, parent: PcfFont_Table): PcfFont_Table_BdfEncodings =
  template this: untyped = result
  this = new(PcfFont_Table_BdfEncodings)
  let root = if root == nil: cast[PcfFont](this) else: cast[PcfFont](root)
  this.io = io
  this.root = root
  this.parent = parent

  let formatExpr = PcfFont_Format.read(this.io, this.root, this)
  this.format = formatExpr
  let minCharOrByte2Expr = this.io.readU2le()
  this.minCharOrByte2 = minCharOrByte2Expr
  let maxCharOrByte2Expr = this.io.readU2le()
  this.maxCharOrByte2 = maxCharOrByte2Expr
  let minByte1Expr = this.io.readU2le()
  this.minByte1 = minByte1Expr
  let maxByte1Expr = this.io.readU2le()
  this.maxByte1 = maxByte1Expr
  let defaultCharExpr = this.io.readU2le()
  this.defaultChar = defaultCharExpr
  for i in 0 ..< int((((this.maxCharOrByte2 - this.minCharOrByte2) + 1) * ((this.maxByte1 - this.minByte1) + 1))):
    let it = this.io.readU2le()
    this.glyphIndexes.add(it)

proc fromFile*(_: typedesc[PcfFont_Table_BdfEncodings], filename: string): PcfFont_Table_BdfEncodings =
  PcfFont_Table_BdfEncodings.read(newKaitaiFileStream(filename), nil, nil)


##[
Table containing character names for every glyph.

@see <a href="https://fontforge.org/docs/techref/pcf-format.html#the-glyph-names-table">Source</a>
]##
proc read*(_: typedesc[PcfFont_Table_GlyphNames], io: KaitaiStream, root: KaitaiStruct, parent: PcfFont_Table): PcfFont_Table_GlyphNames =
  template this: untyped = result
  this = new(PcfFont_Table_GlyphNames)
  let root = if root == nil: cast[PcfFont](this) else: cast[PcfFont](root)
  this.io = io
  this.root = root
  this.parent = parent

  let formatExpr = PcfFont_Format.read(this.io, this.root, this)
  this.format = formatExpr
  let numGlyphsExpr = this.io.readU4le()
  this.numGlyphs = numGlyphsExpr

  ##[
  Glyph names are represented as string references in strings buffer.

  ]##
  for i in 0 ..< int(this.numGlyphs):
    let it = PcfFont_Table_GlyphNames_StringRef.read(this.io, this.root, this)
    this.names.add(it)
  let lenStringsExpr = this.io.readU4le()
  this.lenStrings = lenStringsExpr

  ##[
  Strings buffer which contains all glyph names.

  ]##
  let rawStringsExpr = this.io.readBytes(int(this.lenStrings))
  this.rawStrings = rawStringsExpr
  let rawStringsIo = newKaitaiStream(rawStringsExpr)
  let stringsExpr = BytesWithIo.read(rawStringsIo, this.root, this)
  this.strings = stringsExpr

proc fromFile*(_: typedesc[PcfFont_Table_GlyphNames], filename: string): PcfFont_Table_GlyphNames =
  PcfFont_Table_GlyphNames.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PcfFont_Table_GlyphNames_StringRef], io: KaitaiStream, root: KaitaiStruct, parent: PcfFont_Table_GlyphNames): PcfFont_Table_GlyphNames_StringRef =
  template this: untyped = result
  this = new(PcfFont_Table_GlyphNames_StringRef)
  let root = if root == nil: cast[PcfFont](this) else: cast[PcfFont](root)
  this.io = io
  this.root = root
  this.parent = parent

  let ofsStringExpr = this.io.readU4le()
  this.ofsString = ofsStringExpr

proc value(this: PcfFont_Table_GlyphNames_StringRef): string = 
  if this.valueInstFlag:
    return this.valueInst
  let io = this.parent.strings.io
  let pos = io.pos()
  io.seek(int(this.ofsString))
  let valueInstExpr = encode(io.readBytesTerm(0, false, true, true), "UTF-8")
  this.valueInst = valueInstExpr
  io.seek(pos)
  this.valueInstFlag = true
  return this.valueInst

proc fromFile*(_: typedesc[PcfFont_Table_GlyphNames_StringRef], filename: string): PcfFont_Table_GlyphNames_StringRef =
  PcfFont_Table_GlyphNames_StringRef.read(newKaitaiFileStream(filename), nil, nil)


##[
Table containing uncompressed glyph bitmaps.

@see <a href="https://fontforge.org/docs/techref/pcf-format.html#the-bitmap-table">Source</a>
]##
proc read*(_: typedesc[PcfFont_Table_Bitmaps], io: KaitaiStream, root: KaitaiStruct, parent: PcfFont_Table): PcfFont_Table_Bitmaps =
  template this: untyped = result
  this = new(PcfFont_Table_Bitmaps)
  let root = if root == nil: cast[PcfFont](this) else: cast[PcfFont](root)
  this.io = io
  this.root = root
  this.parent = parent

  let formatExpr = PcfFont_Format.read(this.io, this.root, this)
  this.format = formatExpr
  let numGlyphsExpr = this.io.readU4le()
  this.numGlyphs = numGlyphsExpr
  for i in 0 ..< int(this.numGlyphs):
    let it = this.io.readU4le()
    this.offsets.add(it)
  for i in 0 ..< int(4):
    let it = this.io.readU4le()
    this.bitmapSizes.add(it)

proc fromFile*(_: typedesc[PcfFont_Table_Bitmaps], filename: string): PcfFont_Table_Bitmaps =
  PcfFont_Table_Bitmaps.read(newKaitaiFileStream(filename), nil, nil)


##[
Table format specifier, always 4 bytes. Original implementation treats
it as always little-endian and makes liberal use of bitmasking to parse
various parts of it.

TODO: this format specification recognizes endianness and bit
order format bits, but it does not really takes any parsing
decisions based on them.

@see <a href="https://fontforge.org/docs/techref/pcf-format.html#file-header">Source</a>
]##
proc read*(_: typedesc[PcfFont_Format], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PcfFont_Format =
  template this: untyped = result
  this = new(PcfFont_Format)
  let root = if root == nil: cast[PcfFont](this) else: cast[PcfFont](root)
  this.io = io
  this.root = root
  this.parent = parent

  let padding1Expr = this.io.readBitsIntBe(2)
  this.padding1 = padding1Expr
  let scanUnitMaskExpr = this.io.readBitsIntBe(2)
  this.scanUnitMask = scanUnitMaskExpr
  let isMostSignificantBitFirstExpr = this.io.readBitsIntBe(1) != 0
  this.isMostSignificantBitFirst = isMostSignificantBitFirstExpr

  ##[
  If set, then all integers in the table are treated as big-endian
  ]##
  let isBigEndianExpr = this.io.readBitsIntBe(1) != 0
  this.isBigEndian = isBigEndianExpr
  let glyphPadMaskExpr = this.io.readBitsIntBe(2)
  this.glyphPadMask = glyphPadMaskExpr
  alignToByte(this.io)
  let formatExpr = this.io.readU1()
  this.format = formatExpr
  let paddingExpr = this.io.readU2le()
  this.padding = paddingExpr

proc fromFile*(_: typedesc[PcfFont_Format], filename: string): PcfFont_Format =
  PcfFont_Format.read(newKaitaiFileStream(filename), nil, nil)


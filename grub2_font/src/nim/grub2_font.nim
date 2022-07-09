import kaitai_struct_nim_runtime
import options

type
  Grub2Font* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `sections`*: seq[Grub2Font_Section]
    `parent`*: KaitaiStruct
  Grub2Font_PtszSection* = ref object of KaitaiStruct
    `fontPointSize`*: uint16
    `parent`*: Grub2Font_Section
  Grub2Font_FamiSection* = ref object of KaitaiStruct
    `fontFamilyName`*: string
    `parent`*: Grub2Font_Section
  Grub2Font_WeigSection* = ref object of KaitaiStruct
    `fontWeight`*: string
    `parent`*: Grub2Font_Section
  Grub2Font_MaxwSection* = ref object of KaitaiStruct
    `maximumCharacterWidth`*: uint16
    `parent`*: Grub2Font_Section
  Grub2Font_DescSection* = ref object of KaitaiStruct
    `descentInPixels`*: uint16
    `parent`*: Grub2Font_Section
  Grub2Font_Section* = ref object of KaitaiStruct
    `sectionType`*: string
    `lenBody`*: uint32
    `body`*: KaitaiStruct
    `parent`*: Grub2Font
    `rawBody`*: seq[byte]
  Grub2Font_AsceSection* = ref object of KaitaiStruct
    `ascentInPixels`*: uint16
    `parent`*: Grub2Font_Section
  Grub2Font_ChixSection* = ref object of KaitaiStruct
    `characters`*: seq[Grub2Font_ChixSection_Character]
    `parent`*: Grub2Font_Section
  Grub2Font_ChixSection_Character* = ref object of KaitaiStruct
    `codePoint`*: uint32
    `flags`*: uint8
    `ofsDefinition`*: uint32
    `parent`*: Grub2Font_ChixSection
    `definitionInst`: Grub2Font_ChixSection_CharacterDefinition
    `definitionInstFlag`: bool
  Grub2Font_ChixSection_CharacterDefinition* = ref object of KaitaiStruct
    `width`*: uint16
    `height`*: uint16
    `xOffset`*: int16
    `yOffset`*: int16
    `deviceWidth`*: int16
    `bitmapData`*: seq[byte]
    `parent`*: Grub2Font_ChixSection_Character
  Grub2Font_MaxhSection* = ref object of KaitaiStruct
    `maximumCharacterHeight`*: uint16
    `parent`*: Grub2Font_Section
  Grub2Font_NameSection* = ref object of KaitaiStruct
    `fontName`*: string
    `parent`*: Grub2Font_Section
  Grub2Font_SlanSection* = ref object of KaitaiStruct
    `fontSlant`*: string
    `parent`*: Grub2Font_Section

proc read*(_: typedesc[Grub2Font], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Grub2Font
proc read*(_: typedesc[Grub2Font_PtszSection], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font_Section): Grub2Font_PtszSection
proc read*(_: typedesc[Grub2Font_FamiSection], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font_Section): Grub2Font_FamiSection
proc read*(_: typedesc[Grub2Font_WeigSection], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font_Section): Grub2Font_WeigSection
proc read*(_: typedesc[Grub2Font_MaxwSection], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font_Section): Grub2Font_MaxwSection
proc read*(_: typedesc[Grub2Font_DescSection], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font_Section): Grub2Font_DescSection
proc read*(_: typedesc[Grub2Font_Section], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font): Grub2Font_Section
proc read*(_: typedesc[Grub2Font_AsceSection], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font_Section): Grub2Font_AsceSection
proc read*(_: typedesc[Grub2Font_ChixSection], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font_Section): Grub2Font_ChixSection
proc read*(_: typedesc[Grub2Font_ChixSection_Character], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font_ChixSection): Grub2Font_ChixSection_Character
proc read*(_: typedesc[Grub2Font_ChixSection_CharacterDefinition], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font_ChixSection_Character): Grub2Font_ChixSection_CharacterDefinition
proc read*(_: typedesc[Grub2Font_MaxhSection], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font_Section): Grub2Font_MaxhSection
proc read*(_: typedesc[Grub2Font_NameSection], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font_Section): Grub2Font_NameSection
proc read*(_: typedesc[Grub2Font_SlanSection], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font_Section): Grub2Font_SlanSection

proc definition*(this: Grub2Font_ChixSection_Character): Grub2Font_ChixSection_CharacterDefinition


##[
Bitmap font format for the GRUB 2 bootloader.

@see <a href="https://grub.gibibit.com/New_font_format">Source</a>
]##
proc read*(_: typedesc[Grub2Font], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Grub2Font =
  template this: untyped = result
  this = new(Grub2Font)
  let root = if root == nil: cast[Grub2Font](this) else: cast[Grub2Font](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(12))
  this.magic = magicExpr

  ##[
  The "DATA" section acts as a terminator. The documentation says:
"A marker that indicates the remainder of the file is data accessed
via the character index (CHIX) section. When reading this font file,
the rest of the file can be ignored when scanning the sections."

  ]##
  block:
    var i: int
    while true:
      let it = Grub2Font_Section.read(this.io, this.root, this)
      this.sections.add(it)
      if it.sectionType == "DATA":
        break
      inc i

proc fromFile*(_: typedesc[Grub2Font], filename: string): Grub2Font =
  Grub2Font.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Grub2Font_PtszSection], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font_Section): Grub2Font_PtszSection =
  template this: untyped = result
  this = new(Grub2Font_PtszSection)
  let root = if root == nil: cast[Grub2Font](this) else: cast[Grub2Font](root)
  this.io = io
  this.root = root
  this.parent = parent

  let fontPointSizeExpr = this.io.readU2be()
  this.fontPointSize = fontPointSizeExpr

proc fromFile*(_: typedesc[Grub2Font_PtszSection], filename: string): Grub2Font_PtszSection =
  Grub2Font_PtszSection.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Grub2Font_FamiSection], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font_Section): Grub2Font_FamiSection =
  template this: untyped = result
  this = new(Grub2Font_FamiSection)
  let root = if root == nil: cast[Grub2Font](this) else: cast[Grub2Font](root)
  this.io = io
  this.root = root
  this.parent = parent

  let fontFamilyNameExpr = encode(this.io.readBytesTerm(0, false, true, true), "ASCII")
  this.fontFamilyName = fontFamilyNameExpr

proc fromFile*(_: typedesc[Grub2Font_FamiSection], filename: string): Grub2Font_FamiSection =
  Grub2Font_FamiSection.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Grub2Font_WeigSection], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font_Section): Grub2Font_WeigSection =
  template this: untyped = result
  this = new(Grub2Font_WeigSection)
  let root = if root == nil: cast[Grub2Font](this) else: cast[Grub2Font](root)
  this.io = io
  this.root = root
  this.parent = parent

  let fontWeightExpr = encode(this.io.readBytesTerm(0, false, true, true), "ASCII")
  this.fontWeight = fontWeightExpr

proc fromFile*(_: typedesc[Grub2Font_WeigSection], filename: string): Grub2Font_WeigSection =
  Grub2Font_WeigSection.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Grub2Font_MaxwSection], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font_Section): Grub2Font_MaxwSection =
  template this: untyped = result
  this = new(Grub2Font_MaxwSection)
  let root = if root == nil: cast[Grub2Font](this) else: cast[Grub2Font](root)
  this.io = io
  this.root = root
  this.parent = parent

  let maximumCharacterWidthExpr = this.io.readU2be()
  this.maximumCharacterWidth = maximumCharacterWidthExpr

proc fromFile*(_: typedesc[Grub2Font_MaxwSection], filename: string): Grub2Font_MaxwSection =
  Grub2Font_MaxwSection.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Grub2Font_DescSection], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font_Section): Grub2Font_DescSection =
  template this: untyped = result
  this = new(Grub2Font_DescSection)
  let root = if root == nil: cast[Grub2Font](this) else: cast[Grub2Font](root)
  this.io = io
  this.root = root
  this.parent = parent

  let descentInPixelsExpr = this.io.readU2be()
  this.descentInPixels = descentInPixelsExpr

proc fromFile*(_: typedesc[Grub2Font_DescSection], filename: string): Grub2Font_DescSection =
  Grub2Font_DescSection.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Grub2Font_Section], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font): Grub2Font_Section =
  template this: untyped = result
  this = new(Grub2Font_Section)
  let root = if root == nil: cast[Grub2Font](this) else: cast[Grub2Font](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sectionTypeExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.sectionType = sectionTypeExpr

  ##[
  Should be set to `0xFFFF_FFFF` for `section_type != "DATA"`
  ]##
  let lenBodyExpr = this.io.readU4be()
  this.lenBody = lenBodyExpr
  if this.sectionType != "DATA":
    block:
      let on = this.sectionType
      if on == "MAXH":
        let rawBodyExpr = this.io.readBytes(int(this.lenBody))
        this.rawBody = rawBodyExpr
        let rawBodyIo = newKaitaiStream(rawBodyExpr)
        let bodyExpr = Grub2Font_MaxhSection.read(rawBodyIo, this.root, this)
        this.body = bodyExpr
      elif on == "FAMI":
        let rawBodyExpr = this.io.readBytes(int(this.lenBody))
        this.rawBody = rawBodyExpr
        let rawBodyIo = newKaitaiStream(rawBodyExpr)
        let bodyExpr = Grub2Font_FamiSection.read(rawBodyIo, this.root, this)
        this.body = bodyExpr
      elif on == "PTSZ":
        let rawBodyExpr = this.io.readBytes(int(this.lenBody))
        this.rawBody = rawBodyExpr
        let rawBodyIo = newKaitaiStream(rawBodyExpr)
        let bodyExpr = Grub2Font_PtszSection.read(rawBodyIo, this.root, this)
        this.body = bodyExpr
      elif on == "MAXW":
        let rawBodyExpr = this.io.readBytes(int(this.lenBody))
        this.rawBody = rawBodyExpr
        let rawBodyIo = newKaitaiStream(rawBodyExpr)
        let bodyExpr = Grub2Font_MaxwSection.read(rawBodyIo, this.root, this)
        this.body = bodyExpr
      elif on == "SLAN":
        let rawBodyExpr = this.io.readBytes(int(this.lenBody))
        this.rawBody = rawBodyExpr
        let rawBodyIo = newKaitaiStream(rawBodyExpr)
        let bodyExpr = Grub2Font_SlanSection.read(rawBodyIo, this.root, this)
        this.body = bodyExpr
      elif on == "WEIG":
        let rawBodyExpr = this.io.readBytes(int(this.lenBody))
        this.rawBody = rawBodyExpr
        let rawBodyIo = newKaitaiStream(rawBodyExpr)
        let bodyExpr = Grub2Font_WeigSection.read(rawBodyIo, this.root, this)
        this.body = bodyExpr
      elif on == "CHIX":
        let rawBodyExpr = this.io.readBytes(int(this.lenBody))
        this.rawBody = rawBodyExpr
        let rawBodyIo = newKaitaiStream(rawBodyExpr)
        let bodyExpr = Grub2Font_ChixSection.read(rawBodyIo, this.root, this)
        this.body = bodyExpr
      elif on == "DESC":
        let rawBodyExpr = this.io.readBytes(int(this.lenBody))
        this.rawBody = rawBodyExpr
        let rawBodyIo = newKaitaiStream(rawBodyExpr)
        let bodyExpr = Grub2Font_DescSection.read(rawBodyIo, this.root, this)
        this.body = bodyExpr
      elif on == "NAME":
        let rawBodyExpr = this.io.readBytes(int(this.lenBody))
        this.rawBody = rawBodyExpr
        let rawBodyIo = newKaitaiStream(rawBodyExpr)
        let bodyExpr = Grub2Font_NameSection.read(rawBodyIo, this.root, this)
        this.body = bodyExpr
      elif on == "ASCE":
        let rawBodyExpr = this.io.readBytes(int(this.lenBody))
        this.rawBody = rawBodyExpr
        let rawBodyIo = newKaitaiStream(rawBodyExpr)
        let bodyExpr = Grub2Font_AsceSection.read(rawBodyIo, this.root, this)
        this.body = bodyExpr
      else:
        let bodyExpr = this.io.readBytes(int(this.lenBody))
        this.body = bodyExpr

proc fromFile*(_: typedesc[Grub2Font_Section], filename: string): Grub2Font_Section =
  Grub2Font_Section.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Grub2Font_AsceSection], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font_Section): Grub2Font_AsceSection =
  template this: untyped = result
  this = new(Grub2Font_AsceSection)
  let root = if root == nil: cast[Grub2Font](this) else: cast[Grub2Font](root)
  this.io = io
  this.root = root
  this.parent = parent

  let ascentInPixelsExpr = this.io.readU2be()
  this.ascentInPixels = ascentInPixelsExpr

proc fromFile*(_: typedesc[Grub2Font_AsceSection], filename: string): Grub2Font_AsceSection =
  Grub2Font_AsceSection.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Grub2Font_ChixSection], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font_Section): Grub2Font_ChixSection =
  template this: untyped = result
  this = new(Grub2Font_ChixSection)
  let root = if root == nil: cast[Grub2Font](this) else: cast[Grub2Font](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Grub2Font_ChixSection_Character.read(this.io, this.root, this)
      this.characters.add(it)
      inc i

proc fromFile*(_: typedesc[Grub2Font_ChixSection], filename: string): Grub2Font_ChixSection =
  Grub2Font_ChixSection.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Grub2Font_ChixSection_Character], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font_ChixSection): Grub2Font_ChixSection_Character =
  template this: untyped = result
  this = new(Grub2Font_ChixSection_Character)
  let root = if root == nil: cast[Grub2Font](this) else: cast[Grub2Font](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Unicode code point
  ]##
  let codePointExpr = this.io.readU4be()
  this.codePoint = codePointExpr
  let flagsExpr = this.io.readU1()
  this.flags = flagsExpr
  let ofsDefinitionExpr = this.io.readU4be()
  this.ofsDefinition = ofsDefinitionExpr

proc definition(this: Grub2Font_ChixSection_Character): Grub2Font_ChixSection_CharacterDefinition = 
  if this.definitionInstFlag:
    return this.definitionInst
  let io = Grub2Font(this.root).io
  let pos = io.pos()
  io.seek(int(this.ofsDefinition))
  let definitionInstExpr = Grub2Font_ChixSection_CharacterDefinition.read(io, this.root, this)
  this.definitionInst = definitionInstExpr
  io.seek(pos)
  this.definitionInstFlag = true
  return this.definitionInst

proc fromFile*(_: typedesc[Grub2Font_ChixSection_Character], filename: string): Grub2Font_ChixSection_Character =
  Grub2Font_ChixSection_Character.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Grub2Font_ChixSection_CharacterDefinition], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font_ChixSection_Character): Grub2Font_ChixSection_CharacterDefinition =
  template this: untyped = result
  this = new(Grub2Font_ChixSection_CharacterDefinition)
  let root = if root == nil: cast[Grub2Font](this) else: cast[Grub2Font](root)
  this.io = io
  this.root = root
  this.parent = parent

  let widthExpr = this.io.readU2be()
  this.width = widthExpr
  let heightExpr = this.io.readU2be()
  this.height = heightExpr
  let xOffsetExpr = this.io.readS2be()
  this.xOffset = xOffsetExpr
  let yOffsetExpr = this.io.readS2be()
  this.yOffset = yOffsetExpr
  let deviceWidthExpr = this.io.readS2be()
  this.deviceWidth = deviceWidthExpr

  ##[
  A two-dimensional bitmap, one bit per pixel. It is organized as
row-major, top-down, left-to-right. The most significant bit of
each byte corresponds to the leftmost or uppermost pixel from all
bits of the byte. If a bit is set (1, `true`), the pixel is set to
the font color, if a bit is clear (0, `false`), the pixel is
transparent.

Rows are **not** padded to byte boundaries (i.e., a
single byte may contain bits belonging to multiple rows). The last
byte of the bitmap _is_ padded with zero bits at all unused least
significant bit positions so that the bitmap ends on a byte
boundary.

  ]##
  let bitmapDataExpr = this.io.readBytes(int((((this.width * this.height) + 7) div 8)))
  this.bitmapData = bitmapDataExpr

proc fromFile*(_: typedesc[Grub2Font_ChixSection_CharacterDefinition], filename: string): Grub2Font_ChixSection_CharacterDefinition =
  Grub2Font_ChixSection_CharacterDefinition.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Grub2Font_MaxhSection], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font_Section): Grub2Font_MaxhSection =
  template this: untyped = result
  this = new(Grub2Font_MaxhSection)
  let root = if root == nil: cast[Grub2Font](this) else: cast[Grub2Font](root)
  this.io = io
  this.root = root
  this.parent = parent

  let maximumCharacterHeightExpr = this.io.readU2be()
  this.maximumCharacterHeight = maximumCharacterHeightExpr

proc fromFile*(_: typedesc[Grub2Font_MaxhSection], filename: string): Grub2Font_MaxhSection =
  Grub2Font_MaxhSection.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Grub2Font_NameSection], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font_Section): Grub2Font_NameSection =
  template this: untyped = result
  this = new(Grub2Font_NameSection)
  let root = if root == nil: cast[Grub2Font](this) else: cast[Grub2Font](root)
  this.io = io
  this.root = root
  this.parent = parent

  let fontNameExpr = encode(this.io.readBytesTerm(0, false, true, true), "ASCII")
  this.fontName = fontNameExpr

proc fromFile*(_: typedesc[Grub2Font_NameSection], filename: string): Grub2Font_NameSection =
  Grub2Font_NameSection.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Grub2Font_SlanSection], io: KaitaiStream, root: KaitaiStruct, parent: Grub2Font_Section): Grub2Font_SlanSection =
  template this: untyped = result
  this = new(Grub2Font_SlanSection)
  let root = if root == nil: cast[Grub2Font](this) else: cast[Grub2Font](root)
  this.io = io
  this.root = root
  this.parent = parent

  let fontSlantExpr = encode(this.io.readBytesTerm(0, false, true, true), "ASCII")
  this.fontSlant = fontSlantExpr

proc fromFile*(_: typedesc[Grub2Font_SlanSection], filename: string): Grub2Font_SlanSection =
  Grub2Font_SlanSection.read(newKaitaiFileStream(filename), nil, nil)


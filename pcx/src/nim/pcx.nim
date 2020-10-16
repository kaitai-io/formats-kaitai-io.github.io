import kaitai_struct_nim_runtime
import options

type
  Pcx* = ref object of KaitaiStruct
    `hdr`*: Pcx_Header
    `parent`*: KaitaiStruct
    `rawHdr`*: seq[byte]
    `palette256Inst`*: Pcx_TPalette256
  Pcx_Versions* = enum
    v2_5 = 0
    v2_8_with_palette = 2
    v2_8_without_palette = 3
    paintbrush_for_windows = 4
    v3_0 = 5
  Pcx_Encodings* = enum
    rle = 1
  Pcx_Header* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `version`*: Pcx_Versions
    `encoding`*: Pcx_Encodings
    `bitsPerPixel`*: uint8
    `imgXMin`*: uint16
    `imgYMin`*: uint16
    `imgXMax`*: uint16
    `imgYMax`*: uint16
    `hdpi`*: uint16
    `vdpi`*: uint16
    `palette16`*: seq[byte]
    `reserved`*: seq[byte]
    `numPlanes`*: uint8
    `bytesPerLine`*: uint16
    `paletteInfo`*: uint16
    `hScreenSize`*: uint16
    `vScreenSize`*: uint16
    `parent`*: Pcx
  Pcx_TPalette256* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `colors`*: seq[Pcx_Rgb]
    `parent`*: Pcx
  Pcx_Rgb* = ref object of KaitaiStruct
    `r`*: uint8
    `g`*: uint8
    `b`*: uint8
    `parent`*: Pcx_TPalette256

proc read*(_: typedesc[Pcx], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Pcx
proc read*(_: typedesc[Pcx_Header], io: KaitaiStream, root: KaitaiStruct, parent: Pcx): Pcx_Header
proc read*(_: typedesc[Pcx_TPalette256], io: KaitaiStream, root: KaitaiStruct, parent: Pcx): Pcx_TPalette256
proc read*(_: typedesc[Pcx_Rgb], io: KaitaiStream, root: KaitaiStruct, parent: Pcx_TPalette256): Pcx_Rgb

proc palette256*(this: Pcx): Pcx_TPalette256

proc read*(_: typedesc[Pcx], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Pcx =
  template this: untyped = result
  this = new(Pcx)
  let root = if root == nil: cast[Pcx](this) else: cast[Pcx](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rawHdrExpr = this.io.readBytes(int(128))
  this.rawHdr = rawHdrExpr
  let rawHdrIo = newKaitaiStream(rawHdrExpr)
  let hdrExpr = Pcx_Header.read(rawHdrIo, this.root, this)
  this.hdr = hdrExpr

proc palette256(this: Pcx): Pcx_TPalette256 = 

  ##[
  @see <a href="http://web.archive.org/web/20100206055706/http://www.qzx.com/pc-gpe/pcx.txt">- "VGA 256 Color Palette Information"</a>
  ]##
  if this.palette256Inst != nil:
    return this.palette256Inst
  if  ((this.hdr.version == pcx.v3_0) and (this.hdr.bitsPerPixel == 8) and (this.hdr.numPlanes == 1)) :
    let pos = this.io.pos()
    this.io.seek(int((this.io.size - 769)))
    let palette256InstExpr = Pcx_TPalette256.read(this.io, this.root, this)
    this.palette256Inst = palette256InstExpr
    this.io.seek(pos)
  if this.palette256Inst != nil:
    return this.palette256Inst

proc fromFile*(_: typedesc[Pcx], filename: string): Pcx =
  Pcx.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="http://web.archive.org/web/20100206055706/http://www.qzx.com/pc-gpe/pcx.txt">- "ZSoft .PCX FILE HEADER FORMAT"</a>
]##
proc read*(_: typedesc[Pcx_Header], io: KaitaiStream, root: KaitaiStruct, parent: Pcx): Pcx_Header =
  template this: untyped = result
  this = new(Pcx_Header)
  let root = if root == nil: cast[Pcx](this) else: cast[Pcx](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Technically, this field was supposed to be "manufacturer"
mark to distinguish between various software vendors, and
0x0a was supposed to mean "ZSoft", but everyone else ended
up writing a 0x0a into this field, so that's what majority
of modern software expects to have in this attribute.

  ]##
  let magicExpr = this.io.readBytes(int(1))
  this.magic = magicExpr
  let versionExpr = Pcx_Versions(this.io.readU1())
  this.version = versionExpr
  let encodingExpr = Pcx_Encodings(this.io.readU1())
  this.encoding = encodingExpr
  let bitsPerPixelExpr = this.io.readU1()
  this.bitsPerPixel = bitsPerPixelExpr
  let imgXMinExpr = this.io.readU2le()
  this.imgXMin = imgXMinExpr
  let imgYMinExpr = this.io.readU2le()
  this.imgYMin = imgYMinExpr
  let imgXMaxExpr = this.io.readU2le()
  this.imgXMax = imgXMaxExpr
  let imgYMaxExpr = this.io.readU2le()
  this.imgYMax = imgYMaxExpr
  let hdpiExpr = this.io.readU2le()
  this.hdpi = hdpiExpr
  let vdpiExpr = this.io.readU2le()
  this.vdpi = vdpiExpr
  let palette16Expr = this.io.readBytes(int(48))
  this.palette16 = palette16Expr
  let reservedExpr = this.io.readBytes(int(1))
  this.reserved = reservedExpr
  let numPlanesExpr = this.io.readU1()
  this.numPlanes = numPlanesExpr
  let bytesPerLineExpr = this.io.readU2le()
  this.bytesPerLine = bytesPerLineExpr
  let paletteInfoExpr = this.io.readU2le()
  this.paletteInfo = paletteInfoExpr
  let hScreenSizeExpr = this.io.readU2le()
  this.hScreenSize = hScreenSizeExpr
  let vScreenSizeExpr = this.io.readU2le()
  this.vScreenSize = vScreenSizeExpr

proc fromFile*(_: typedesc[Pcx_Header], filename: string): Pcx_Header =
  Pcx_Header.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Pcx_TPalette256], io: KaitaiStream, root: KaitaiStruct, parent: Pcx): Pcx_TPalette256 =
  template this: untyped = result
  this = new(Pcx_TPalette256)
  let root = if root == nil: cast[Pcx](this) else: cast[Pcx](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(1))
  this.magic = magicExpr
  for i in 0 ..< int(256):
    let it = Pcx_Rgb.read(this.io, this.root, this)
    this.colors.add(it)

proc fromFile*(_: typedesc[Pcx_TPalette256], filename: string): Pcx_TPalette256 =
  Pcx_TPalette256.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Pcx_Rgb], io: KaitaiStream, root: KaitaiStruct, parent: Pcx_TPalette256): Pcx_Rgb =
  template this: untyped = result
  this = new(Pcx_Rgb)
  let root = if root == nil: cast[Pcx](this) else: cast[Pcx](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rExpr = this.io.readU1()
  this.r = rExpr
  let gExpr = this.io.readU1()
  this.g = gExpr
  let bExpr = this.io.readU1()
  this.b = bExpr

proc fromFile*(_: typedesc[Pcx_Rgb], filename: string): Pcx_Rgb =
  Pcx_Rgb.read(newKaitaiFileStream(filename), nil, nil)


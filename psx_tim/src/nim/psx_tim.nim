import kaitai_struct_nim_runtime
import options

type
  PsxTim* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `flags`*: uint32
    `clut`*: PsxTim_Bitmap
    `img`*: PsxTim_Bitmap
    `parent`*: KaitaiStruct
    `hasClutInst`: bool
    `hasClutInstFlag`: bool
    `bppInst`: int
    `bppInstFlag`: bool
  PsxTim_BppType* = enum
    bpp_4 = 0
    bpp_8 = 1
    bpp_16 = 2
    bpp_24 = 3
  PsxTim_Bitmap* = ref object of KaitaiStruct
    `len`*: uint32
    `originX`*: uint16
    `originY`*: uint16
    `width`*: uint16
    `height`*: uint16
    `body`*: seq[byte]
    `parent`*: PsxTim

proc read*(_: typedesc[PsxTim], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PsxTim
proc read*(_: typedesc[PsxTim_Bitmap], io: KaitaiStream, root: KaitaiStruct, parent: PsxTim): PsxTim_Bitmap

proc hasClut*(this: PsxTim): bool
proc bpp*(this: PsxTim): int


##[
@see <a href="http://fileformats.archiveteam.org/wiki/TIM_(PlayStation_graphics)">Source</a>
@see <a href="https://mrclick.zophar.net/TilEd/download/timgfx.txt">Source</a>
@see <a href="https://www.romhacking.net/documents/31/">Source</a>
]##
proc read*(_: typedesc[PsxTim], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): PsxTim =
  template this: untyped = result
  this = new(PsxTim)
  let root = if root == nil: cast[PsxTim](this) else: cast[PsxTim](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr

  ##[
  Encodes bits-per-pixel and whether CLUT is present in a file or not
  ]##
  let flagsExpr = this.io.readU4le()
  this.flags = flagsExpr

  ##[
  CLUT (Color LookUp Table), one or several palettes for indexed color image, represented as a
  ]##
  if this.hasClut:
    let clutExpr = PsxTim_Bitmap.read(this.io, this.root, this)
    this.clut = clutExpr
  let imgExpr = PsxTim_Bitmap.read(this.io, this.root, this)
  this.img = imgExpr

proc hasClut(this: PsxTim): bool = 
  if this.hasClutInstFlag:
    return this.hasClutInst
  let hasClutInstExpr = bool((this.flags and 8) != 0)
  this.hasClutInst = hasClutInstExpr
  this.hasClutInstFlag = true
  return this.hasClutInst

proc bpp(this: PsxTim): int = 
  if this.bppInstFlag:
    return this.bppInst
  let bppInstExpr = int((this.flags and 3))
  this.bppInst = bppInstExpr
  this.bppInstFlag = true
  return this.bppInst

proc fromFile*(_: typedesc[PsxTim], filename: string): PsxTim =
  PsxTim.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[PsxTim_Bitmap], io: KaitaiStream, root: KaitaiStruct, parent: PsxTim): PsxTim_Bitmap =
  template this: untyped = result
  this = new(PsxTim_Bitmap)
  let root = if root == nil: cast[PsxTim](this) else: cast[PsxTim](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = this.io.readU4le()
  this.len = lenExpr
  let originXExpr = this.io.readU2le()
  this.originX = originXExpr
  let originYExpr = this.io.readU2le()
  this.originY = originYExpr
  let widthExpr = this.io.readU2le()
  this.width = widthExpr
  let heightExpr = this.io.readU2le()
  this.height = heightExpr
  let bodyExpr = this.io.readBytes(int((this.len - 12)))
  this.body = bodyExpr

proc fromFile*(_: typedesc[PsxTim_Bitmap], filename: string): PsxTim_Bitmap =
  PsxTim_Bitmap.read(newKaitaiFileStream(filename), nil, nil)


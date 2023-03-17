import kaitai_struct_nim_runtime
import options

type
  Ico* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `numImages`*: uint16
    `images`*: seq[Ico_IconDirEntry]
    `parent`*: KaitaiStruct
  Ico_IconDirEntry* = ref object of KaitaiStruct
    `width`*: uint8
    `height`*: uint8
    `numColors`*: uint8
    `reserved`*: seq[byte]
    `numPlanes`*: uint16
    `bpp`*: uint16
    `lenImg`*: uint32
    `ofsImg`*: uint32
    `parent`*: Ico
    `imgInst`: seq[byte]
    `imgInstFlag`: bool
    `pngHeaderInst`: seq[byte]
    `pngHeaderInstFlag`: bool
    `isPngInst`: bool
    `isPngInstFlag`: bool

proc read*(_: typedesc[Ico], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ico
proc read*(_: typedesc[Ico_IconDirEntry], io: KaitaiStream, root: KaitaiStruct, parent: Ico): Ico_IconDirEntry

proc img*(this: Ico_IconDirEntry): seq[byte]
proc pngHeader*(this: Ico_IconDirEntry): seq[byte]
proc isPng*(this: Ico_IconDirEntry): bool


##[
Microsoft Windows uses specific file format to store applications
icons - ICO. This is a container that contains one or more image
files (effectively, DIB parts of BMP files or full PNG files are
contained inside).

@see <a href="https://learn.microsoft.com/en-us/previous-versions/ms997538(v=msdn.10)">Source</a>
]##
proc read*(_: typedesc[Ico], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Ico =
  template this: untyped = result
  this = new(Ico)
  let root = if root == nil: cast[Ico](this) else: cast[Ico](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr

  ##[
  Number of images contained in this file
  ]##
  let numImagesExpr = this.io.readU2le()
  this.numImages = numImagesExpr
  for i in 0 ..< int(this.numImages):
    let it = Ico_IconDirEntry.read(this.io, this.root, this)
    this.images.add(it)

proc fromFile*(_: typedesc[Ico], filename: string): Ico =
  Ico.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Ico_IconDirEntry], io: KaitaiStream, root: KaitaiStruct, parent: Ico): Ico_IconDirEntry =
  template this: untyped = result
  this = new(Ico_IconDirEntry)
  let root = if root == nil: cast[Ico](this) else: cast[Ico](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Width of image, px
  ]##
  let widthExpr = this.io.readU1()
  this.width = widthExpr

  ##[
  Height of image, px
  ]##
  let heightExpr = this.io.readU1()
  this.height = heightExpr

  ##[
  Number of colors in palette of the image or 0 if image has
no palette (i.e. RGB, RGBA, etc)

  ]##
  let numColorsExpr = this.io.readU1()
  this.numColors = numColorsExpr
  let reservedExpr = this.io.readBytes(int(1))
  this.reserved = reservedExpr

  ##[
  Number of color planes
  ]##
  let numPlanesExpr = this.io.readU2le()
  this.numPlanes = numPlanesExpr

  ##[
  Bits per pixel in the image
  ]##
  let bppExpr = this.io.readU2le()
  this.bpp = bppExpr

  ##[
  Size of the image data
  ]##
  let lenImgExpr = this.io.readU4le()
  this.lenImg = lenImgExpr

  ##[
  Absolute offset of the image data start in the file
  ]##
  let ofsImgExpr = this.io.readU4le()
  this.ofsImg = ofsImgExpr

proc img(this: Ico_IconDirEntry): seq[byte] = 

  ##[
  Raw image data. Use `is_png` to determine whether this is an
embedded PNG file (true) or a DIB bitmap (false) and call a
relevant parser, if needed to parse image data further.

  ]##
  if this.imgInstFlag:
    return this.imgInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsImg))
  let imgInstExpr = this.io.readBytes(int(this.lenImg))
  this.imgInst = imgInstExpr
  this.io.seek(pos)
  this.imgInstFlag = true
  return this.imgInst

proc pngHeader(this: Ico_IconDirEntry): seq[byte] = 

  ##[
  Pre-reads first 8 bytes of the image to determine if it's an
embedded PNG file.

  ]##
  if this.pngHeaderInstFlag:
    return this.pngHeaderInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsImg))
  let pngHeaderInstExpr = this.io.readBytes(int(8))
  this.pngHeaderInst = pngHeaderInstExpr
  this.io.seek(pos)
  this.pngHeaderInstFlag = true
  return this.pngHeaderInst

proc isPng(this: Ico_IconDirEntry): bool = 

  ##[
  True if this image is in PNG format.
  ]##
  if this.isPngInstFlag:
    return this.isPngInst
  let isPngInstExpr = bool(this.pngHeader == @[137'u8, 80'u8, 78'u8, 71'u8, 13'u8, 10'u8, 26'u8, 10'u8])
  this.isPngInst = isPngInstExpr
  this.isPngInstFlag = true
  return this.isPngInst

proc fromFile*(_: typedesc[Ico_IconDirEntry], filename: string): Ico_IconDirEntry =
  Ico_IconDirEntry.read(newKaitaiFileStream(filename), nil, nil)


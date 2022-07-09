import kaitai_struct_nim_runtime
import options

type
  Tga* = ref object of KaitaiStruct
    `imageIdLen`*: uint8
    `colorMapType`*: Tga_ColorMapEnum
    `imageType`*: Tga_ImageTypeEnum
    `colorMapOfs`*: uint16
    `numColorMap`*: uint16
    `colorMapDepth`*: uint8
    `xOffset`*: uint16
    `yOffset`*: uint16
    `width`*: uint16
    `height`*: uint16
    `imageDepth`*: uint8
    `imgDescriptor`*: uint8
    `imageId`*: seq[byte]
    `colorMap`*: seq[seq[byte]]
    `parent`*: KaitaiStruct
    `footerInst`: Tga_TgaFooter
    `footerInstFlag`: bool
  Tga_ColorMapEnum* = enum
    no_color_map = 0
    has_color_map = 1
  Tga_ImageTypeEnum* = enum
    no_image_data = 0
    uncomp_color_mapped = 1
    uncomp_true_color = 2
    uncomp_bw = 3
    rle_color_mapped = 9
    rle_true_color = 10
    rle_bw = 11
  Tga_TgaFooter* = ref object of KaitaiStruct
    `extAreaOfs`*: uint32
    `devDirOfs`*: uint32
    `versionMagic`*: seq[byte]
    `parent`*: Tga
    `isValidInst`: bool
    `isValidInstFlag`: bool
    `extAreaInst`: Tga_TgaExtArea
    `extAreaInstFlag`: bool
  Tga_TgaExtArea* = ref object of KaitaiStruct
    `extAreaSize`*: uint16
    `authorName`*: string
    `comments`*: seq[string]
    `timestamp`*: seq[byte]
    `jobId`*: string
    `jobTime`*: string
    `softwareId`*: string
    `softwareVersion`*: seq[byte]
    `keyColor`*: uint32
    `pixelAspectRatio`*: uint32
    `gammaValue`*: uint32
    `colorCorrOfs`*: uint32
    `postageStampOfs`*: uint32
    `scanLineOfs`*: uint32
    `attributes`*: uint8
    `parent`*: Tga_TgaFooter

proc read*(_: typedesc[Tga], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Tga
proc read*(_: typedesc[Tga_TgaFooter], io: KaitaiStream, root: KaitaiStruct, parent: Tga): Tga_TgaFooter
proc read*(_: typedesc[Tga_TgaExtArea], io: KaitaiStream, root: KaitaiStruct, parent: Tga_TgaFooter): Tga_TgaExtArea

proc footer*(this: Tga): Tga_TgaFooter
proc isValid*(this: Tga_TgaFooter): bool
proc extArea*(this: Tga_TgaFooter): Tga_TgaExtArea


##[
TGA (AKA Truevision TGA, AKA TARGA), is a raster image file format created by Truevision. It supports up to 32 bits per pixel (three 8-bit RGB channels + 8-bit alpha channel), color mapping and optional lossless RLE compression.
@see <a href="https://www.dca.fee.unicamp.br/~martino/disciplinas/ea978/tgaffs.pdf">Source</a>
]##
proc read*(_: typedesc[Tga], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Tga =
  template this: untyped = result
  this = new(Tga)
  let root = if root == nil: cast[Tga](this) else: cast[Tga](root)
  this.io = io
  this.root = root
  this.parent = parent

  let imageIdLenExpr = this.io.readU1()
  this.imageIdLen = imageIdLenExpr
  let colorMapTypeExpr = Tga_ColorMapEnum(this.io.readU1())
  this.colorMapType = colorMapTypeExpr
  let imageTypeExpr = Tga_ImageTypeEnum(this.io.readU1())
  this.imageType = imageTypeExpr
  let colorMapOfsExpr = this.io.readU2le()
  this.colorMapOfs = colorMapOfsExpr

  ##[
  Number of entries in a color map
  ]##
  let numColorMapExpr = this.io.readU2le()
  this.numColorMap = numColorMapExpr

  ##[
  Number of bits in a each color maps entry
  ]##
  let colorMapDepthExpr = this.io.readU1()
  this.colorMapDepth = colorMapDepthExpr
  let xOffsetExpr = this.io.readU2le()
  this.xOffset = xOffsetExpr
  let yOffsetExpr = this.io.readU2le()
  this.yOffset = yOffsetExpr

  ##[
  Width of the image, in pixels
  ]##
  let widthExpr = this.io.readU2le()
  this.width = widthExpr

  ##[
  Height of the image, in pixels
  ]##
  let heightExpr = this.io.readU2le()
  this.height = heightExpr
  let imageDepthExpr = this.io.readU1()
  this.imageDepth = imageDepthExpr
  let imgDescriptorExpr = this.io.readU1()
  this.imgDescriptor = imgDescriptorExpr

  ##[
  Arbitrary application-specific information that is used to
identify image. May contain text or some binary data.

  ]##
  let imageIdExpr = this.io.readBytes(int(this.imageIdLen))
  this.imageId = imageIdExpr

  ##[
  Color map
  ]##
  if this.colorMapType == tga.has_color_map:
    for i in 0 ..< int(this.numColorMap):
      let it = this.io.readBytes(int(((this.colorMapDepth + 7) div 8)))
      this.colorMap.add(it)

proc footer(this: Tga): Tga_TgaFooter = 
  if this.footerInstFlag:
    return this.footerInst
  let pos = this.io.pos()
  this.io.seek(int((this.io.size - 26)))
  let footerInstExpr = Tga_TgaFooter.read(this.io, this.root, this)
  this.footerInst = footerInstExpr
  this.io.seek(pos)
  this.footerInstFlag = true
  return this.footerInst

proc fromFile*(_: typedesc[Tga], filename: string): Tga =
  Tga.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Tga_TgaFooter], io: KaitaiStream, root: KaitaiStruct, parent: Tga): Tga_TgaFooter =
  template this: untyped = result
  this = new(Tga_TgaFooter)
  let root = if root == nil: cast[Tga](this) else: cast[Tga](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Offset to extension area
  ]##
  let extAreaOfsExpr = this.io.readU4le()
  this.extAreaOfs = extAreaOfsExpr

  ##[
  Offset to developer directory
  ]##
  let devDirOfsExpr = this.io.readU4le()
  this.devDirOfs = devDirOfsExpr
  let versionMagicExpr = this.io.readBytes(int(18))
  this.versionMagic = versionMagicExpr

proc isValid(this: Tga_TgaFooter): bool = 
  if this.isValidInstFlag:
    return this.isValidInst
  let isValidInstExpr = bool(this.versionMagic == @[84'u8, 82'u8, 85'u8, 69'u8, 86'u8, 73'u8, 83'u8, 73'u8, 79'u8, 78'u8, 45'u8, 88'u8, 70'u8, 73'u8, 76'u8, 69'u8, 46'u8, 0'u8])
  this.isValidInst = isValidInstExpr
  this.isValidInstFlag = true
  return this.isValidInst

proc extArea(this: Tga_TgaFooter): Tga_TgaExtArea = 
  if this.extAreaInstFlag:
    return this.extAreaInst
  if this.isValid:
    let pos = this.io.pos()
    this.io.seek(int(this.extAreaOfs))
    let extAreaInstExpr = Tga_TgaExtArea.read(this.io, this.root, this)
    this.extAreaInst = extAreaInstExpr
    this.io.seek(pos)
  this.extAreaInstFlag = true
  return this.extAreaInst

proc fromFile*(_: typedesc[Tga_TgaFooter], filename: string): Tga_TgaFooter =
  Tga_TgaFooter.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Tga_TgaExtArea], io: KaitaiStream, root: KaitaiStruct, parent: Tga_TgaFooter): Tga_TgaExtArea =
  template this: untyped = result
  this = new(Tga_TgaExtArea)
  let root = if root == nil: cast[Tga](this) else: cast[Tga](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Extension area size in bytes (always 495)
  ]##
  let extAreaSizeExpr = this.io.readU2le()
  this.extAreaSize = extAreaSizeExpr
  let authorNameExpr = encode(this.io.readBytes(int(41)), "ASCII")
  this.authorName = authorNameExpr

  ##[
  Comments, organized as four lines, each consisting of 80 characters plus a NULL
  ]##
  for i in 0 ..< int(4):
    let it = encode(this.io.readBytes(int(81)), "ASCII")
    this.comments.add(it)

  ##[
  Image creation date / time
  ]##
  let timestampExpr = this.io.readBytes(int(12))
  this.timestamp = timestampExpr

  ##[
  Internal job ID, to be used in image workflow systems
  ]##
  let jobIdExpr = encode(this.io.readBytes(int(41)), "ASCII")
  this.jobId = jobIdExpr

  ##[
  Hours, minutes and seconds spent creating the file (for billing, etc.)
  ]##
  let jobTimeExpr = encode(this.io.readBytes(int(6)), "ASCII")
  this.jobTime = jobTimeExpr

  ##[
  The application that created the file.
  ]##
  let softwareIdExpr = encode(this.io.readBytes(int(41)), "ASCII")
  this.softwareId = softwareIdExpr
  let softwareVersionExpr = this.io.readBytes(int(3))
  this.softwareVersion = softwareVersionExpr
  let keyColorExpr = this.io.readU4le()
  this.keyColor = keyColorExpr
  let pixelAspectRatioExpr = this.io.readU4le()
  this.pixelAspectRatio = pixelAspectRatioExpr
  let gammaValueExpr = this.io.readU4le()
  this.gammaValue = gammaValueExpr

  ##[
  Number of bytes from the beginning of the file to the color correction table if present
  ]##
  let colorCorrOfsExpr = this.io.readU4le()
  this.colorCorrOfs = colorCorrOfsExpr

  ##[
  Number of bytes from the beginning of the file to the postage stamp image if present
  ]##
  let postageStampOfsExpr = this.io.readU4le()
  this.postageStampOfs = postageStampOfsExpr

  ##[
  Number of bytes from the beginning of the file to the scan lines table if present
  ]##
  let scanLineOfsExpr = this.io.readU4le()
  this.scanLineOfs = scanLineOfsExpr

  ##[
  Specifies the alpha channel
  ]##
  let attributesExpr = this.io.readU1()
  this.attributes = attributesExpr

proc fromFile*(_: typedesc[Tga_TgaExtArea], filename: string): Tga_TgaExtArea =
  Tga_TgaExtArea.read(newKaitaiFileStream(filename), nil, nil)


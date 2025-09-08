import kaitai_struct_nim_runtime
import options

type
  Xwd* = ref object of KaitaiStruct
    `lenHeader`*: uint32
    `hdr`*: Xwd_Header
    `colorMap`*: seq[Xwd_ColorMapEntry]
    `parent`*: KaitaiStruct
    `rawHdr`*: seq[byte]
    `rawColorMap`*: seq[seq[byte]]
  Xwd_ByteOrder* = enum
    le = 0
    be = 1
  Xwd_PixmapFormat* = enum
    x_y_bitmap = 0
    x_y_pixmap = 1
    z_pixmap = 2
  Xwd_VisualClass* = enum
    static_gray = 0
    gray_scale = 1
    static_color = 2
    pseudo_color = 3
    true_color = 4
    direct_color = 5
  Xwd_ColorMapEntry* = ref object of KaitaiStruct
    `entryNumber`*: uint32
    `red`*: uint16
    `green`*: uint16
    `blue`*: uint16
    `flags`*: uint8
    `padding`*: uint8
    `parent`*: Xwd
  Xwd_Header* = ref object of KaitaiStruct
    `fileVersion`*: uint32
    `pixmapFormat`*: Xwd_PixmapFormat
    `pixmapDepth`*: uint32
    `pixmapWidth`*: uint32
    `pixmapHeight`*: uint32
    `xOffset`*: uint32
    `byteOrder`*: Xwd_ByteOrder
    `bitmapUnit`*: uint32
    `bitmapBitOrder`*: uint32
    `bitmapPad`*: uint32
    `bitsPerPixel`*: uint32
    `bytesPerLine`*: uint32
    `visualClass`*: Xwd_VisualClass
    `redMask`*: uint32
    `greenMask`*: uint32
    `blueMask`*: uint32
    `bitsPerRgb`*: uint32
    `numberOfColors`*: uint32
    `colorMapEntries`*: uint32
    `windowWidth`*: uint32
    `windowHeight`*: uint32
    `windowX`*: int32
    `windowY`*: int32
    `windowBorderWidth`*: uint32
    `creator`*: string
    `parent`*: Xwd

proc read*(_: typedesc[Xwd], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Xwd
proc read*(_: typedesc[Xwd_ColorMapEntry], io: KaitaiStream, root: KaitaiStruct, parent: Xwd): Xwd_ColorMapEntry
proc read*(_: typedesc[Xwd_Header], io: KaitaiStream, root: KaitaiStruct, parent: Xwd): Xwd_Header



##[
xwd is a file format written by eponymous X11 screen capture
application (xwd stands for "X Window Dump"). Typically, an average
user transforms xwd format into something more widespread by any of
`xwdtopnm` and `pnmto...` utilities right away.

xwd format itself provides a raw uncompressed bitmap with some
metainformation, like pixel format, width, height, bit depth,
etc. Note that technically format includes machine-dependent fields
and thus is probably a poor choice for true cross-platform usage.

]##
proc read*(_: typedesc[Xwd], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Xwd =
  template this: untyped = result
  this = new(Xwd)
  let root = if root == nil: cast[Xwd](this) else: cast[Xwd](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Size of the header in bytes
  ]##
  let lenHeaderExpr = this.io.readU4be()
  this.lenHeader = lenHeaderExpr
  let rawHdrExpr = this.io.readBytes(int(this.lenHeader - 4))
  this.rawHdr = rawHdrExpr
  let rawHdrIo = newKaitaiStream(rawHdrExpr)
  let hdrExpr = Xwd_Header.read(rawHdrIo, this.root, this)
  this.hdr = hdrExpr
  for i in 0 ..< int(this.hdr.colorMapEntries):
    let buf = this.io.readBytes(int(12))
    this.rawColorMap.add(buf)
    let rawColorMapIo = newKaitaiStream(buf)
    let it = Xwd_ColorMapEntry.read(rawColorMapIo, this.root, this)
    this.colorMap.add(it)

proc fromFile*(_: typedesc[Xwd], filename: string): Xwd =
  Xwd.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Xwd_ColorMapEntry], io: KaitaiStream, root: KaitaiStruct, parent: Xwd): Xwd_ColorMapEntry =
  template this: untyped = result
  this = new(Xwd_ColorMapEntry)
  let root = if root == nil: cast[Xwd](this) else: cast[Xwd](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Number of the color map entry
  ]##
  let entryNumberExpr = this.io.readU4be()
  this.entryNumber = entryNumberExpr
  let redExpr = this.io.readU2be()
  this.red = redExpr
  let greenExpr = this.io.readU2be()
  this.green = greenExpr
  let blueExpr = this.io.readU2be()
  this.blue = blueExpr
  let flagsExpr = this.io.readU1()
  this.flags = flagsExpr
  let paddingExpr = this.io.readU1()
  this.padding = paddingExpr

proc fromFile*(_: typedesc[Xwd_ColorMapEntry], filename: string): Xwd_ColorMapEntry =
  Xwd_ColorMapEntry.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Xwd_Header], io: KaitaiStream, root: KaitaiStruct, parent: Xwd): Xwd_Header =
  template this: untyped = result
  this = new(Xwd_Header)
  let root = if root == nil: cast[Xwd](this) else: cast[Xwd](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  X11WD file version (always 07h)
  ]##
  let fileVersionExpr = this.io.readU4be()
  this.fileVersion = fileVersionExpr

  ##[
  Format of the image data
  ]##
  let pixmapFormatExpr = Xwd_PixmapFormat(this.io.readU4be())
  this.pixmapFormat = pixmapFormatExpr

  ##[
  Pixmap depth in pixels - in practice, bits per pixel
  ]##
  let pixmapDepthExpr = this.io.readU4be()
  this.pixmapDepth = pixmapDepthExpr

  ##[
  Pixmap width in pixels
  ]##
  let pixmapWidthExpr = this.io.readU4be()
  this.pixmapWidth = pixmapWidthExpr

  ##[
  Pixmap height in pixels
  ]##
  let pixmapHeightExpr = this.io.readU4be()
  this.pixmapHeight = pixmapHeightExpr

  ##[
  Bitmap X offset (number of pixels to ignore at the beginning of each scan-line)
  ]##
  let xOffsetExpr = this.io.readU4be()
  this.xOffset = xOffsetExpr

  ##[
  Byte order of image data
  ]##
  let byteOrderExpr = Xwd_ByteOrder(this.io.readU4be())
  this.byteOrder = byteOrderExpr

  ##[
  Bitmap base data size
  ]##
  let bitmapUnitExpr = this.io.readU4be()
  this.bitmapUnit = bitmapUnitExpr

  ##[
  Bit-order of image data
  ]##
  let bitmapBitOrderExpr = this.io.readU4be()
  this.bitmapBitOrder = bitmapBitOrderExpr

  ##[
  Bitmap scan-line pad
  ]##
  let bitmapPadExpr = this.io.readU4be()
  this.bitmapPad = bitmapPadExpr

  ##[
  Bits per pixel
  ]##
  let bitsPerPixelExpr = this.io.readU4be()
  this.bitsPerPixel = bitsPerPixelExpr

  ##[
  Bytes per scan-line
  ]##
  let bytesPerLineExpr = this.io.readU4be()
  this.bytesPerLine = bytesPerLineExpr

  ##[
  Class of the image
  ]##
  let visualClassExpr = Xwd_VisualClass(this.io.readU4be())
  this.visualClass = visualClassExpr

  ##[
  Red mask
  ]##
  let redMaskExpr = this.io.readU4be()
  this.redMask = redMaskExpr

  ##[
  Green mask
  ]##
  let greenMaskExpr = this.io.readU4be()
  this.greenMask = greenMaskExpr

  ##[
  Blue mask
  ]##
  let blueMaskExpr = this.io.readU4be()
  this.blueMask = blueMaskExpr

  ##[
  Size of each color mask in bits
  ]##
  let bitsPerRgbExpr = this.io.readU4be()
  this.bitsPerRgb = bitsPerRgbExpr

  ##[
  Number of colors in image
  ]##
  let numberOfColorsExpr = this.io.readU4be()
  this.numberOfColors = numberOfColorsExpr

  ##[
  Number of entries in color map
  ]##
  let colorMapEntriesExpr = this.io.readU4be()
  this.colorMapEntries = colorMapEntriesExpr

  ##[
  Window width
  ]##
  let windowWidthExpr = this.io.readU4be()
  this.windowWidth = windowWidthExpr

  ##[
  Window height
  ]##
  let windowHeightExpr = this.io.readU4be()
  this.windowHeight = windowHeightExpr

  ##[
  Window upper left X coordinate
  ]##
  let windowXExpr = this.io.readS4be()
  this.windowX = windowXExpr

  ##[
  Window upper left Y coordinate
  ]##
  let windowYExpr = this.io.readS4be()
  this.windowY = windowYExpr

  ##[
  Window border width
  ]##
  let windowBorderWidthExpr = this.io.readU4be()
  this.windowBorderWidth = windowBorderWidthExpr

  ##[
  Program that created this xwd file
  ]##
  let creatorExpr = encode(this.io.readBytesTerm(0, false, true, true), "UTF-8")
  this.creator = creatorExpr

proc fromFile*(_: typedesc[Xwd_Header], filename: string): Xwd_Header =
  Xwd_Header.read(newKaitaiFileStream(filename), nil, nil)


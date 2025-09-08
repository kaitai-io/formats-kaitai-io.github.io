import kaitai_struct_nim_runtime
import options

type
  GimpBrush* = ref object of KaitaiStruct
    `lenHeader`*: uint32
    `header`*: GimpBrush_Header
    `parent`*: KaitaiStruct
    `rawHeader`*: seq[byte]
    `bodyInst`: seq[byte]
    `bodyInstFlag`: bool
    `lenBodyInst`: int
    `lenBodyInstFlag`: bool
  GimpBrush_ColorDepth* = enum
    grayscale = 1
    rgba = 4
  GimpBrush_Bitmap* = ref object of KaitaiStruct
    `rows`*: seq[GimpBrush_Row]
    `parent`*: KaitaiStruct
  GimpBrush_Header* = ref object of KaitaiStruct
    `version`*: uint32
    `width`*: uint32
    `height`*: uint32
    `bytesPerPixel`*: GimpBrush_ColorDepth
    `magic`*: seq[byte]
    `spacing`*: uint32
    `brushName`*: string
    `parent`*: GimpBrush
  GimpBrush_Row* = ref object of KaitaiStruct
    `pixels`*: seq[KaitaiStruct]
    `parent`*: GimpBrush_Bitmap
  GimpBrush_Row_PixelGray* = ref object of KaitaiStruct
    `gray`*: uint8
    `parent`*: GimpBrush_Row
    `alphaInst`: uint8
    `alphaInstFlag`: bool
    `blueInst`: int8
    `blueInstFlag`: bool
    `greenInst`: int8
    `greenInstFlag`: bool
    `redInst`: int8
    `redInstFlag`: bool
  GimpBrush_Row_PixelRgba* = ref object of KaitaiStruct
    `red`*: uint8
    `green`*: uint8
    `blue`*: uint8
    `alpha`*: uint8
    `parent`*: GimpBrush_Row

proc read*(_: typedesc[GimpBrush], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GimpBrush
proc read*(_: typedesc[GimpBrush_Bitmap], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GimpBrush_Bitmap
proc read*(_: typedesc[GimpBrush_Header], io: KaitaiStream, root: KaitaiStruct, parent: GimpBrush): GimpBrush_Header
proc read*(_: typedesc[GimpBrush_Row], io: KaitaiStream, root: KaitaiStruct, parent: GimpBrush_Bitmap): GimpBrush_Row
proc read*(_: typedesc[GimpBrush_Row_PixelGray], io: KaitaiStream, root: KaitaiStruct, parent: GimpBrush_Row): GimpBrush_Row_PixelGray
proc read*(_: typedesc[GimpBrush_Row_PixelRgba], io: KaitaiStream, root: KaitaiStruct, parent: GimpBrush_Row): GimpBrush_Row_PixelRgba

proc body*(this: GimpBrush): seq[byte]
proc lenBody*(this: GimpBrush): int
proc alpha*(this: GimpBrush_Row_PixelGray): uint8
proc blue*(this: GimpBrush_Row_PixelGray): int8
proc green*(this: GimpBrush_Row_PixelGray): int8
proc red*(this: GimpBrush_Row_PixelGray): int8


##[
GIMP brush format is native to the GIMP image editor for storing a brush or a texture.
It can be used in all [Paint Tools](https://docs.gimp.org/2.10/en/gimp-tools-paint.html),
for example Pencil and Paintbrush. It works by repeating the brush bitmap as you move
the tool. The Spacing parameter sets the distance between the brush marks as a percentage
of brush width. Its default value can be set in the brush file.

You can also use GIMP to create new brushes in this format. Custom brushes can be loaded
into GIMP for use in the paint tools by copying them into one of the Brush Folders -
select **Edit** > **Preferences** in the menu bar, expand the **Folders** section
and choose **Brushes** to see the recognized Brush Folders or to add new ones.

@see <a href="https://github.com/GNOME/gimp/blob/441631322b/devel-docs/gbr.txt">Source</a>
]##
proc read*(_: typedesc[GimpBrush], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GimpBrush =
  template this: untyped = result
  this = new(GimpBrush)
  let root = if root == nil: cast[GimpBrush](this) else: cast[GimpBrush](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenHeaderExpr = this.io.readU4be()
  this.lenHeader = lenHeaderExpr
  let rawHeaderExpr = this.io.readBytes(int(this.lenHeader - 4))
  this.rawHeader = rawHeaderExpr
  let rawHeaderIo = newKaitaiStream(rawHeaderExpr)
  let headerExpr = GimpBrush_Header.read(rawHeaderIo, this.root, this)
  this.header = headerExpr

proc body(this: GimpBrush): seq[byte] = 
  if this.bodyInstFlag:
    return this.bodyInst
  let pos = this.io.pos()
  this.io.seek(int(this.lenHeader))
  let bodyInstExpr = this.io.readBytes(int(this.lenBody))
  this.bodyInst = bodyInstExpr
  this.io.seek(pos)
  this.bodyInstFlag = true
  return this.bodyInst

proc lenBody(this: GimpBrush): int = 
  if this.lenBodyInstFlag:
    return this.lenBodyInst
  let lenBodyInstExpr = int((this.header.width * this.header.height) * ord(this.header.bytesPerPixel))
  this.lenBodyInst = lenBodyInstExpr
  this.lenBodyInstFlag = true
  return this.lenBodyInst

proc fromFile*(_: typedesc[GimpBrush], filename: string): GimpBrush =
  GimpBrush.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[GimpBrush_Bitmap], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): GimpBrush_Bitmap =
  template this: untyped = result
  this = new(GimpBrush_Bitmap)
  let root = if root == nil: cast[GimpBrush](this) else: cast[GimpBrush](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int(GimpBrush(this.root).header.height):
    let it = GimpBrush_Row.read(this.io, this.root, this)
    this.rows.add(it)

proc fromFile*(_: typedesc[GimpBrush_Bitmap], filename: string): GimpBrush_Bitmap =
  GimpBrush_Bitmap.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[GimpBrush_Header], io: KaitaiStream, root: KaitaiStruct, parent: GimpBrush): GimpBrush_Header =
  template this: untyped = result
  this = new(GimpBrush_Header)
  let root = if root == nil: cast[GimpBrush](this) else: cast[GimpBrush](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionExpr = this.io.readU4be()
  this.version = versionExpr

  ##[
  @see <a href="https://github.com/GNOME/gimp/blob/441631322b/app/core/gimpbrush-load.c#L170">Source</a>
  @see <a href="https://github.com/GNOME/gimp/blob/441631322b/app/core/gimpbrush-header.h#L24">Source</a>
  ]##
  let widthExpr = this.io.readU4be()
  this.width = widthExpr

  ##[
  @see <a href="https://github.com/GNOME/gimp/blob/441631322b/app/core/gimpbrush-load.c#L177">Source</a>
  @see <a href="https://github.com/GNOME/gimp/blob/441631322b/app/core/gimpbrush-header.h#L24">Source</a>
  ]##
  let heightExpr = this.io.readU4be()
  this.height = heightExpr
  let bytesPerPixelExpr = GimpBrush_ColorDepth(this.io.readU4be())
  this.bytesPerPixel = bytesPerPixelExpr
  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr

  ##[
  Default spacing to be used for brush. Percentage of brush width.
  ]##
  let spacingExpr = this.io.readU4be()
  this.spacing = spacingExpr
  let brushNameExpr = encode(this.io.readBytesFull().bytesTerminate(0, false), "UTF-8")
  this.brushName = brushNameExpr

proc fromFile*(_: typedesc[GimpBrush_Header], filename: string): GimpBrush_Header =
  GimpBrush_Header.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[GimpBrush_Row], io: KaitaiStream, root: KaitaiStruct, parent: GimpBrush_Bitmap): GimpBrush_Row =
  template this: untyped = result
  this = new(GimpBrush_Row)
  let root = if root == nil: cast[GimpBrush](this) else: cast[GimpBrush](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int(GimpBrush(this.root).header.width):
    block:
      let on = GimpBrush(this.root).header.bytesPerPixel
      if on == gimp_brush.grayscale:
        let it = GimpBrush_Row_PixelGray.read(this.io, this.root, this)
        this.pixels.add(it)
      elif on == gimp_brush.rgba:
        let it = GimpBrush_Row_PixelRgba.read(this.io, this.root, this)
        this.pixels.add(it)

proc fromFile*(_: typedesc[GimpBrush_Row], filename: string): GimpBrush_Row =
  GimpBrush_Row.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[GimpBrush_Row_PixelGray], io: KaitaiStream, root: KaitaiStruct, parent: GimpBrush_Row): GimpBrush_Row_PixelGray =
  template this: untyped = result
  this = new(GimpBrush_Row_PixelGray)
  let root = if root == nil: cast[GimpBrush](this) else: cast[GimpBrush](root)
  this.io = io
  this.root = root
  this.parent = parent

  let grayExpr = this.io.readU1()
  this.gray = grayExpr

proc alpha(this: GimpBrush_Row_PixelGray): uint8 = 
  if this.alphaInstFlag:
    return this.alphaInst
  let alphaInstExpr = uint8(this.gray)
  this.alphaInst = alphaInstExpr
  this.alphaInstFlag = true
  return this.alphaInst

proc blue(this: GimpBrush_Row_PixelGray): int8 = 
  if this.blueInstFlag:
    return this.blueInst
  let blueInstExpr = int8(0)
  this.blueInst = blueInstExpr
  this.blueInstFlag = true
  return this.blueInst

proc green(this: GimpBrush_Row_PixelGray): int8 = 
  if this.greenInstFlag:
    return this.greenInst
  let greenInstExpr = int8(0)
  this.greenInst = greenInstExpr
  this.greenInstFlag = true
  return this.greenInst

proc red(this: GimpBrush_Row_PixelGray): int8 = 
  if this.redInstFlag:
    return this.redInst
  let redInstExpr = int8(0)
  this.redInst = redInstExpr
  this.redInstFlag = true
  return this.redInst

proc fromFile*(_: typedesc[GimpBrush_Row_PixelGray], filename: string): GimpBrush_Row_PixelGray =
  GimpBrush_Row_PixelGray.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[GimpBrush_Row_PixelRgba], io: KaitaiStream, root: KaitaiStruct, parent: GimpBrush_Row): GimpBrush_Row_PixelRgba =
  template this: untyped = result
  this = new(GimpBrush_Row_PixelRgba)
  let root = if root == nil: cast[GimpBrush](this) else: cast[GimpBrush](root)
  this.io = io
  this.root = root
  this.parent = parent

  let redExpr = this.io.readU1()
  this.red = redExpr
  let greenExpr = this.io.readU1()
  this.green = greenExpr
  let blueExpr = this.io.readU1()
  this.blue = blueExpr
  let alphaExpr = this.io.readU1()
  this.alpha = alphaExpr

proc fromFile*(_: typedesc[GimpBrush_Row_PixelRgba], filename: string): GimpBrush_Row_PixelRgba =
  GimpBrush_Row_PixelRgba.read(newKaitaiFileStream(filename), nil, nil)


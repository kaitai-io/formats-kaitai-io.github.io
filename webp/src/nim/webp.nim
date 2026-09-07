import kaitai_struct_nim_runtime
import options

type
  Webp* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `lenData`*: uint32
    `webp`*: seq[byte]
    `payload`*: Webp_Chunks
    `parent`*: KaitaiStruct
    `rawPayload`*: seq[byte]
  Webp_ChunkNames* = enum
    xmp_var = 5262680
    vp8 = 540561494
    xmp = 542133592
    exif = 1179211845
    anmf = 1179471425
    alph = 1213221953
    vp8l = 1278758998
    frgm = 1296519750
    anim = 1296649793
    iccp = 1346585417
    vp8x = 1480085590
  Webp_CompressionMethod* = enum
    none = 0
    webp_lossless = 1
  Webp_FilteringMethod* = enum
    none = 0
    horizontal = 1
    vertical = 2
    gradient = 3
  Webp_Preprocessing* = enum
    none = 0
    level_reduction = 1
  Webp_Alph* = ref object of KaitaiStruct
    `reserved`*: uint64
    `preprocessing`*: Webp_Preprocessing
    `filtering`*: Webp_FilteringMethod
    `compression`*: Webp_CompressionMethod
    `data`*: seq[byte]
    `parent`*: Webp_Chunk
  Webp_Anim* = ref object of KaitaiStruct
    `backgroundColor`*: Webp_Anim_BgColor
    `loopCount`*: uint16
    `parent`*: Webp_Chunk
  Webp_Anim_BgColor* = ref object of KaitaiStruct
    `blue`*: uint8
    `green`*: uint8
    `red`*: uint8
    `alpha`*: uint8
    `parent`*: Webp_Anim
  Webp_Anmf* = ref object of KaitaiStruct
    `frameXDiv2`*: uint64
    `frameYDiv2`*: uint64
    `frameWidthMinus1`*: uint64
    `frameHeightMinus1`*: uint64
    `duration`*: uint64
    `reserved`*: uint64
    `blendingMethod`*: bool
    `disposalMethod`*: bool
    `data`*: seq[byte]
    `parent`*: Webp_Chunk
    `frameHeightInst`: int
    `frameHeightInstFlag`: bool
    `frameWidthInst`: int
    `frameWidthInstFlag`: bool
    `frameXInst`: int
    `frameXInstFlag`: bool
    `frameYInst`: int
    `frameYInstFlag`: bool
  Webp_Chunk* = ref object of KaitaiStruct
    `name`*: Webp_ChunkNames
    `lenData`*: uint32
    `data`*: KaitaiStruct
    `padding`*: seq[byte]
    `parent`*: Webp_Chunks
    `rawData`*: seq[byte]
  Webp_Chunks* = ref object of KaitaiStruct
    `chunks`*: seq[Webp_Chunk]
    `parent`*: Webp
  Webp_Vp8* = ref object of KaitaiStruct
    `frameType`*: bool
    `version`*: uint64
    `showFrame`*: bool
    `lenFirstPartition`*: uint64
    `startCode`*: seq[byte]
    `width`*: uint64
    `horizontalScale`*: uint64
    `height`*: uint64
    `verticalScale`*: uint64
    `data`*: seq[byte]
    `parent`*: Webp_Chunk
  Webp_Vp8l* = ref object of KaitaiStruct
    `signature`*: uint8
    `imageWidthMinus1`*: uint64
    `imageHeightMinus1`*: uint64
    `alphaIsUsed`*: bool
    `versionNumber`*: uint64
    `data`*: seq[byte]
    `parent`*: Webp_Chunk
    `imageHeightInst`: int
    `imageHeightInstFlag`: bool
    `imageWidthInst`: int
    `imageWidthInstFlag`: bool
  Webp_Vp8x* = ref object of KaitaiStruct
    `reserved1`*: uint64
    `iccProfile`*: bool
    `alpha`*: bool
    `exif`*: bool
    `xmp`*: bool
    `animation`*: bool
    `reserved2`*: bool
    `reserved3`*: uint64
    `canvasWidthMinus1`*: uint64
    `canvasHeightMinus1`*: uint64
    `parent`*: Webp_Chunk
    `canvasHeightInst`: int
    `canvasHeightInstFlag`: bool
    `canvasWidthInst`: int
    `canvasWidthInstFlag`: bool
  Webp_Xmp* = ref object of KaitaiStruct
    `data`*: string
    `parent`*: Webp_Chunk

proc read*(_: typedesc[Webp], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Webp
proc read*(_: typedesc[Webp_Alph], io: KaitaiStream, root: KaitaiStruct, parent: Webp_Chunk): Webp_Alph
proc read*(_: typedesc[Webp_Anim], io: KaitaiStream, root: KaitaiStruct, parent: Webp_Chunk): Webp_Anim
proc read*(_: typedesc[Webp_Anim_BgColor], io: KaitaiStream, root: KaitaiStruct, parent: Webp_Anim): Webp_Anim_BgColor
proc read*(_: typedesc[Webp_Anmf], io: KaitaiStream, root: KaitaiStruct, parent: Webp_Chunk): Webp_Anmf
proc read*(_: typedesc[Webp_Chunk], io: KaitaiStream, root: KaitaiStruct, parent: Webp_Chunks): Webp_Chunk
proc read*(_: typedesc[Webp_Chunks], io: KaitaiStream, root: KaitaiStruct, parent: Webp): Webp_Chunks
proc read*(_: typedesc[Webp_Vp8], io: KaitaiStream, root: KaitaiStruct, parent: Webp_Chunk): Webp_Vp8
proc read*(_: typedesc[Webp_Vp8l], io: KaitaiStream, root: KaitaiStruct, parent: Webp_Chunk): Webp_Vp8l
proc read*(_: typedesc[Webp_Vp8x], io: KaitaiStream, root: KaitaiStruct, parent: Webp_Chunk): Webp_Vp8x
proc read*(_: typedesc[Webp_Xmp], io: KaitaiStream, root: KaitaiStruct, parent: Webp_Chunk): Webp_Xmp

proc frameHeight*(this: Webp_Anmf): int
proc frameWidth*(this: Webp_Anmf): int
proc frameX*(this: Webp_Anmf): int
proc frameY*(this: Webp_Anmf): int
proc imageHeight*(this: Webp_Vp8l): int
proc imageWidth*(this: Webp_Vp8l): int
proc canvasHeight*(this: Webp_Vp8x): int
proc canvasWidth*(this: Webp_Vp8x): int


##[
@see <a href="https://developers.google.com/speed/webp/docs/riff_container">Source</a>
]##
proc read*(_: typedesc[Webp], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Webp =
  template this: untyped = result
  this = new(Webp)
  let root = if root == nil: cast[Webp](this) else: cast[Webp](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let lenDataExpr = this.io.readU4le()
  this.lenData = lenDataExpr
  let webpExpr = this.io.readBytes(int(4))
  this.webp = webpExpr
  let rawPayloadExpr = this.io.readBytes(int(this.lenData - 4))
  this.rawPayload = rawPayloadExpr
  let rawPayloadIo = newKaitaiStream(rawPayloadExpr)
  let payloadExpr = Webp_Chunks.read(rawPayloadIo, this.root, this)
  this.payload = payloadExpr

proc fromFile*(_: typedesc[Webp], filename: string): Webp =
  Webp.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Webp_Alph], io: KaitaiStream, root: KaitaiStruct, parent: Webp_Chunk): Webp_Alph =
  template this: untyped = result
  this = new(Webp_Alph)
  let root = if root == nil: cast[Webp](this) else: cast[Webp](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBitsIntBe(2)
  this.reserved = reservedExpr
  let preprocessingExpr = Webp_Preprocessing(this.io.readBitsIntBe(2))
  this.preprocessing = preprocessingExpr
  let filteringExpr = Webp_FilteringMethod(this.io.readBitsIntBe(2))
  this.filtering = filteringExpr
  let compressionExpr = Webp_CompressionMethod(this.io.readBitsIntBe(2))
  this.compression = compressionExpr
  alignToByte(this.io)
  let dataExpr = this.io.readBytesFull()
  this.data = dataExpr

proc fromFile*(_: typedesc[Webp_Alph], filename: string): Webp_Alph =
  Webp_Alph.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://developers.google.com/speed/webp/docs/riff_container#animation">Source</a>
]##
proc read*(_: typedesc[Webp_Anim], io: KaitaiStream, root: KaitaiStruct, parent: Webp_Chunk): Webp_Anim =
  template this: untyped = result
  this = new(Webp_Anim)
  let root = if root == nil: cast[Webp](this) else: cast[Webp](root)
  this.io = io
  this.root = root
  this.parent = parent

  let backgroundColorExpr = Webp_Anim_BgColor.read(this.io, this.root, this)
  this.backgroundColor = backgroundColorExpr
  let loopCountExpr = this.io.readU2le()
  this.loopCount = loopCountExpr

proc fromFile*(_: typedesc[Webp_Anim], filename: string): Webp_Anim =
  Webp_Anim.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Webp_Anim_BgColor], io: KaitaiStream, root: KaitaiStruct, parent: Webp_Anim): Webp_Anim_BgColor =
  template this: untyped = result
  this = new(Webp_Anim_BgColor)
  let root = if root == nil: cast[Webp](this) else: cast[Webp](root)
  this.io = io
  this.root = root
  this.parent = parent

  let blueExpr = this.io.readU1()
  this.blue = blueExpr
  let greenExpr = this.io.readU1()
  this.green = greenExpr
  let redExpr = this.io.readU1()
  this.red = redExpr
  let alphaExpr = this.io.readU1()
  this.alpha = alphaExpr

proc fromFile*(_: typedesc[Webp_Anim_BgColor], filename: string): Webp_Anim_BgColor =
  Webp_Anim_BgColor.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Webp_Anmf], io: KaitaiStream, root: KaitaiStruct, parent: Webp_Chunk): Webp_Anmf =
  template this: untyped = result
  this = new(Webp_Anmf)
  let root = if root == nil: cast[Webp](this) else: cast[Webp](root)
  this.io = io
  this.root = root
  this.parent = parent

  let frameXDiv2Expr = this.io.readBitsIntLe(24)
  this.frameXDiv2 = frameXDiv2Expr
  let frameYDiv2Expr = this.io.readBitsIntLe(24)
  this.frameYDiv2 = frameYDiv2Expr
  let frameWidthMinus1Expr = this.io.readBitsIntLe(24)
  this.frameWidthMinus1 = frameWidthMinus1Expr
  let frameHeightMinus1Expr = this.io.readBitsIntLe(24)
  this.frameHeightMinus1 = frameHeightMinus1Expr
  let durationExpr = this.io.readBitsIntLe(24)
  this.duration = durationExpr
  let reservedExpr = this.io.readBitsIntBe(6)
  this.reserved = reservedExpr
  let blendingMethodExpr = this.io.readBitsIntBe(1) != 0
  this.blendingMethod = blendingMethodExpr
  let disposalMethodExpr = this.io.readBitsIntBe(1) != 0
  this.disposalMethod = disposalMethodExpr
  alignToByte(this.io)
  let dataExpr = this.io.readBytesFull()
  this.data = dataExpr

proc frameHeight(this: Webp_Anmf): int = 
  if this.frameHeightInstFlag:
    return this.frameHeightInst
  let frameHeightInstExpr = int(this.frameHeightMinus1 + 1)
  this.frameHeightInst = frameHeightInstExpr
  this.frameHeightInstFlag = true
  return this.frameHeightInst

proc frameWidth(this: Webp_Anmf): int = 
  if this.frameWidthInstFlag:
    return this.frameWidthInst
  let frameWidthInstExpr = int(this.frameWidthMinus1 + 1)
  this.frameWidthInst = frameWidthInstExpr
  this.frameWidthInstFlag = true
  return this.frameWidthInst

proc frameX(this: Webp_Anmf): int = 
  if this.frameXInstFlag:
    return this.frameXInst
  let frameXInstExpr = int(this.frameXDiv2 * 2)
  this.frameXInst = frameXInstExpr
  this.frameXInstFlag = true
  return this.frameXInst

proc frameY(this: Webp_Anmf): int = 
  if this.frameYInstFlag:
    return this.frameYInst
  let frameYInstExpr = int(this.frameYDiv2 * 2)
  this.frameYInst = frameYInstExpr
  this.frameYInstFlag = true
  return this.frameYInst

proc fromFile*(_: typedesc[Webp_Anmf], filename: string): Webp_Anmf =
  Webp_Anmf.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Webp_Chunk], io: KaitaiStream, root: KaitaiStruct, parent: Webp_Chunks): Webp_Chunk =
  template this: untyped = result
  this = new(Webp_Chunk)
  let root = if root == nil: cast[Webp](this) else: cast[Webp](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameExpr = Webp_ChunkNames(this.io.readU4le())
  this.name = nameExpr
  let lenDataExpr = this.io.readU4le()
  this.lenData = lenDataExpr
  block:
    let on = this.name
    if on == webp.alph:
      let rawDataExpr = this.io.readBytes(int(this.lenData))
      this.rawData = rawDataExpr
      let rawDataIo = newKaitaiStream(rawDataExpr)
      let dataExpr = Webp_Alph.read(rawDataIo, this.root, this)
      this.data = dataExpr
    elif on == webp.anim:
      let rawDataExpr = this.io.readBytes(int(this.lenData))
      this.rawData = rawDataExpr
      let rawDataIo = newKaitaiStream(rawDataExpr)
      let dataExpr = Webp_Anim.read(rawDataIo, this.root, this)
      this.data = dataExpr
    elif on == webp.anmf:
      let rawDataExpr = this.io.readBytes(int(this.lenData))
      this.rawData = rawDataExpr
      let rawDataIo = newKaitaiStream(rawDataExpr)
      let dataExpr = Webp_Anmf.read(rawDataIo, this.root, this)
      this.data = dataExpr
    elif on == webp.vp8:
      let rawDataExpr = this.io.readBytes(int(this.lenData))
      this.rawData = rawDataExpr
      let rawDataIo = newKaitaiStream(rawDataExpr)
      let dataExpr = Webp_Vp8.read(rawDataIo, this.root, this)
      this.data = dataExpr
    elif on == webp.vp8l:
      let rawDataExpr = this.io.readBytes(int(this.lenData))
      this.rawData = rawDataExpr
      let rawDataIo = newKaitaiStream(rawDataExpr)
      let dataExpr = Webp_Vp8l.read(rawDataIo, this.root, this)
      this.data = dataExpr
    elif on == webp.vp8x:
      let rawDataExpr = this.io.readBytes(int(this.lenData))
      this.rawData = rawDataExpr
      let rawDataIo = newKaitaiStream(rawDataExpr)
      let dataExpr = Webp_Vp8x.read(rawDataIo, this.root, this)
      this.data = dataExpr
    elif on == webp.xmp:
      let rawDataExpr = this.io.readBytes(int(this.lenData))
      this.rawData = rawDataExpr
      let rawDataIo = newKaitaiStream(rawDataExpr)
      let dataExpr = Webp_Xmp.read(rawDataIo, this.root, this)
      this.data = dataExpr
    elif on == webp.xmp_var:
      let rawDataExpr = this.io.readBytes(int(this.lenData))
      this.rawData = rawDataExpr
      let rawDataIo = newKaitaiStream(rawDataExpr)
      let dataExpr = Webp_Xmp.read(rawDataIo, this.root, this)
      this.data = dataExpr
    else:
      let dataExpr = this.io.readBytes(int(this.lenData))
      this.data = dataExpr
  if this.lenData %%% 2 != 0:
    let paddingExpr = this.io.readBytes(int(1))
    this.padding = paddingExpr

proc fromFile*(_: typedesc[Webp_Chunk], filename: string): Webp_Chunk =
  Webp_Chunk.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Webp_Chunks], io: KaitaiStream, root: KaitaiStruct, parent: Webp): Webp_Chunks =
  template this: untyped = result
  this = new(Webp_Chunks)
  let root = if root == nil: cast[Webp](this) else: cast[Webp](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Webp_Chunk.read(this.io, this.root, this)
      this.chunks.add(it)
      inc i

proc fromFile*(_: typedesc[Webp_Chunks], filename: string): Webp_Chunks =
  Webp_Chunks.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://www.rfc-editor.org/rfc/rfc6386#section-9.1">Source</a>
]##
proc read*(_: typedesc[Webp_Vp8], io: KaitaiStream, root: KaitaiStruct, parent: Webp_Chunk): Webp_Vp8 =
  template this: untyped = result
  this = new(Webp_Vp8)
  let root = if root == nil: cast[Webp](this) else: cast[Webp](root)
  this.io = io
  this.root = root
  this.parent = parent

  let frameTypeExpr = this.io.readBitsIntLe(1) != 0
  this.frameType = frameTypeExpr
  let versionExpr = this.io.readBitsIntLe(3)
  this.version = versionExpr
  let showFrameExpr = this.io.readBitsIntLe(1) != 0
  this.showFrame = showFrameExpr
  let lenFirstPartitionExpr = this.io.readBitsIntLe(19)
  this.lenFirstPartition = lenFirstPartitionExpr
  alignToByte(this.io)
  let startCodeExpr = this.io.readBytes(int(3))
  this.startCode = startCodeExpr
  let widthExpr = this.io.readBitsIntLe(14)
  this.width = widthExpr
  let horizontalScaleExpr = this.io.readBitsIntLe(2)
  this.horizontalScale = horizontalScaleExpr
  let heightExpr = this.io.readBitsIntLe(14)
  this.height = heightExpr
  let verticalScaleExpr = this.io.readBitsIntLe(2)
  this.verticalScale = verticalScaleExpr
  alignToByte(this.io)
  let dataExpr = this.io.readBytesFull()
  this.data = dataExpr

proc fromFile*(_: typedesc[Webp_Vp8], filename: string): Webp_Vp8 =
  Webp_Vp8.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://developers.google.com/speed/webp/docs/webp_lossless_bitstream_specification">Source</a>
]##
proc read*(_: typedesc[Webp_Vp8l], io: KaitaiStream, root: KaitaiStruct, parent: Webp_Chunk): Webp_Vp8l =
  template this: untyped = result
  this = new(Webp_Vp8l)
  let root = if root == nil: cast[Webp](this) else: cast[Webp](root)
  this.io = io
  this.root = root
  this.parent = parent

  let signatureExpr = this.io.readU1()
  this.signature = signatureExpr
  let imageWidthMinus1Expr = this.io.readBitsIntLe(14)
  this.imageWidthMinus1 = imageWidthMinus1Expr
  let imageHeightMinus1Expr = this.io.readBitsIntLe(14)
  this.imageHeightMinus1 = imageHeightMinus1Expr

  ##[
  A hint only - it should not impact decoding. It should be `false` when
all alpha values are 255 in the picture, and `true` otherwise.

  ]##
  let alphaIsUsedExpr = this.io.readBitsIntLe(1) != 0
  this.alphaIsUsed = alphaIsUsedExpr
  let versionNumberExpr = this.io.readBitsIntLe(3)
  this.versionNumber = versionNumberExpr
  alignToByte(this.io)
  let dataExpr = this.io.readBytesFull()
  this.data = dataExpr

proc imageHeight(this: Webp_Vp8l): int = 
  if this.imageHeightInstFlag:
    return this.imageHeightInst
  let imageHeightInstExpr = int(this.imageHeightMinus1 + 1)
  this.imageHeightInst = imageHeightInstExpr
  this.imageHeightInstFlag = true
  return this.imageHeightInst

proc imageWidth(this: Webp_Vp8l): int = 
  if this.imageWidthInstFlag:
    return this.imageWidthInst
  let imageWidthInstExpr = int(this.imageWidthMinus1 + 1)
  this.imageWidthInst = imageWidthInstExpr
  this.imageWidthInstFlag = true
  return this.imageWidthInst

proc fromFile*(_: typedesc[Webp_Vp8l], filename: string): Webp_Vp8l =
  Webp_Vp8l.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Webp_Vp8x], io: KaitaiStream, root: KaitaiStruct, parent: Webp_Chunk): Webp_Vp8x =
  template this: untyped = result
  this = new(Webp_Vp8x)
  let root = if root == nil: cast[Webp](this) else: cast[Webp](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reserved1Expr = this.io.readBitsIntBe(2)
  this.reserved1 = reserved1Expr
  let iccProfileExpr = this.io.readBitsIntBe(1) != 0
  this.iccProfile = iccProfileExpr
  let alphaExpr = this.io.readBitsIntBe(1) != 0
  this.alpha = alphaExpr
  let exifExpr = this.io.readBitsIntBe(1) != 0
  this.exif = exifExpr
  let xmpExpr = this.io.readBitsIntBe(1) != 0
  this.xmp = xmpExpr
  let animationExpr = this.io.readBitsIntBe(1) != 0
  this.animation = animationExpr
  let reserved2Expr = this.io.readBitsIntBe(1) != 0
  this.reserved2 = reserved2Expr
  let reserved3Expr = this.io.readBitsIntBe(24)
  this.reserved3 = reserved3Expr
  let canvasWidthMinus1Expr = this.io.readBitsIntLe(24)
  this.canvasWidthMinus1 = canvasWidthMinus1Expr
  let canvasHeightMinus1Expr = this.io.readBitsIntLe(24)
  this.canvasHeightMinus1 = canvasHeightMinus1Expr

proc canvasHeight(this: Webp_Vp8x): int = 
  if this.canvasHeightInstFlag:
    return this.canvasHeightInst
  let canvasHeightInstExpr = int(this.canvasHeightMinus1 + 1)
  this.canvasHeightInst = canvasHeightInstExpr
  this.canvasHeightInstFlag = true
  return this.canvasHeightInst

proc canvasWidth(this: Webp_Vp8x): int = 
  if this.canvasWidthInstFlag:
    return this.canvasWidthInst
  let canvasWidthInstExpr = int(this.canvasWidthMinus1 + 1)
  this.canvasWidthInst = canvasWidthInstExpr
  this.canvasWidthInstFlag = true
  return this.canvasWidthInst

proc fromFile*(_: typedesc[Webp_Vp8x], filename: string): Webp_Vp8x =
  Webp_Vp8x.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Webp_Xmp], io: KaitaiStream, root: KaitaiStruct, parent: Webp_Chunk): Webp_Xmp =
  template this: untyped = result
  this = new(Webp_Xmp)
  let root = if root == nil: cast[Webp](this) else: cast[Webp](root)
  this.io = io
  this.root = root
  this.parent = parent

  let dataExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.data = dataExpr

proc fromFile*(_: typedesc[Webp_Xmp], filename: string): Webp_Xmp =
  Webp_Xmp.read(newKaitaiFileStream(filename), nil, nil)


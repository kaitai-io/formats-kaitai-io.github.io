import kaitai_struct_nim_runtime
import options

type
  Png* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `ihdrLen`*: uint32
    `ihdrType`*: seq[byte]
    `ihdr`*: Png_IhdrChunk
    `ihdrCrc`*: seq[byte]
    `chunks`*: seq[Png_Chunk]
    `parent`*: KaitaiStruct
  Png_BlendOpValues* = enum
    source = 0
    over = 1
  Png_ColorType* = enum
    greyscale = 0
    truecolor = 2
    indexed = 3
    greyscale_alpha = 4
    truecolor_alpha = 6
  Png_CompressionMethods* = enum
    zlib = 0
  Png_DisposeOpValues* = enum
    none = 0
    background = 1
    previous = 2
  Png_PhysUnit* = enum
    unknown = 0
    meter = 1
  Png_AnimationControlChunk* = ref object of KaitaiStruct
    `numFrames`*: uint32
    `numPlays`*: uint32
    `parent`*: Png_Chunk
  Png_BkgdChunk* = ref object of KaitaiStruct
    `bkgd`*: KaitaiStruct
    `parent`*: Png_Chunk
  Png_BkgdGreyscale* = ref object of KaitaiStruct
    `value`*: uint16
    `parent`*: Png_BkgdChunk
  Png_BkgdIndexed* = ref object of KaitaiStruct
    `paletteIndex`*: uint8
    `parent`*: Png_BkgdChunk
  Png_BkgdTruecolor* = ref object of KaitaiStruct
    `red`*: uint16
    `green`*: uint16
    `blue`*: uint16
    `parent`*: Png_BkgdChunk
  Png_ChrmChunk* = ref object of KaitaiStruct
    `whitePoint`*: Png_Point
    `red`*: Png_Point
    `green`*: Png_Point
    `blue`*: Png_Point
    `parent`*: Png_Chunk
  Png_Chunk* = ref object of KaitaiStruct
    `len`*: uint32
    `type`*: string
    `body`*: KaitaiStruct
    `crc`*: seq[byte]
    `parent`*: Png
    `rawBody`*: seq[byte]
  Png_CompressedTextChunk* = ref object of KaitaiStruct
    `keyword`*: string
    `compressionMethod`*: Png_CompressionMethods
    `textDatastream`*: seq[byte]
    `parent`*: Png_Chunk
    `rawTextDatastream`*: seq[byte]
  Png_FrameControlChunk* = ref object of KaitaiStruct
    `sequenceNumber`*: uint32
    `width`*: uint32
    `height`*: uint32
    `xOffset`*: uint32
    `yOffset`*: uint32
    `delayNum`*: uint16
    `delayDen`*: uint16
    `disposeOp`*: Png_DisposeOpValues
    `blendOp`*: Png_BlendOpValues
    `parent`*: Png_Chunk
    `delayInst`: float64
    `delayInstFlag`: bool
  Png_FrameDataChunk* = ref object of KaitaiStruct
    `sequenceNumber`*: uint32
    `frameData`*: seq[byte]
    `parent`*: Png_Chunk
  Png_GamaChunk* = ref object of KaitaiStruct
    `gammaInt`*: uint32
    `parent`*: Png_Chunk
    `gammaRatioInst`: float64
    `gammaRatioInstFlag`: bool
  Png_IhdrChunk* = ref object of KaitaiStruct
    `width`*: uint32
    `height`*: uint32
    `bitDepth`*: uint8
    `colorType`*: Png_ColorType
    `compressionMethod`*: uint8
    `filterMethod`*: uint8
    `interlaceMethod`*: uint8
    `parent`*: Png
  Png_InternationalTextChunk* = ref object of KaitaiStruct
    `keyword`*: string
    `compressionFlag`*: uint8
    `compressionMethod`*: Png_CompressionMethods
    `languageTag`*: string
    `translatedKeyword`*: string
    `text`*: string
    `parent`*: Png_Chunk
  Png_PhysChunk* = ref object of KaitaiStruct
    `pixelsPerUnitX`*: uint32
    `pixelsPerUnitY`*: uint32
    `unit`*: Png_PhysUnit
    `parent`*: Png_Chunk
  Png_PlteChunk* = ref object of KaitaiStruct
    `entries`*: seq[Png_Rgb]
    `parent`*: Png_Chunk
  Png_Point* = ref object of KaitaiStruct
    `xInt`*: uint32
    `yInt`*: uint32
    `parent`*: Png_ChrmChunk
    `xInst`: float64
    `xInstFlag`: bool
    `yInst`: float64
    `yInstFlag`: bool
  Png_Rgb* = ref object of KaitaiStruct
    `r`*: uint8
    `g`*: uint8
    `b`*: uint8
    `parent`*: Png_PlteChunk
  Png_SrgbChunk* = ref object of KaitaiStruct
    `renderIntent`*: Png_SrgbChunk_Intent
    `parent`*: Png_Chunk
  Png_SrgbChunk_Intent* = enum
    perceptual = 0
    relative_colorimetric = 1
    saturation = 2
    absolute_colorimetric = 3
  Png_TextChunk* = ref object of KaitaiStruct
    `keyword`*: string
    `text`*: string
    `parent`*: Png_Chunk
  Png_TimeChunk* = ref object of KaitaiStruct
    `year`*: uint16
    `month`*: uint8
    `day`*: uint8
    `hour`*: uint8
    `minute`*: uint8
    `second`*: uint8
    `parent`*: Png_Chunk

proc read*(_: typedesc[Png], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Png
proc read*(_: typedesc[Png_AnimationControlChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_AnimationControlChunk
proc read*(_: typedesc[Png_BkgdChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_BkgdChunk
proc read*(_: typedesc[Png_BkgdGreyscale], io: KaitaiStream, root: KaitaiStruct, parent: Png_BkgdChunk): Png_BkgdGreyscale
proc read*(_: typedesc[Png_BkgdIndexed], io: KaitaiStream, root: KaitaiStruct, parent: Png_BkgdChunk): Png_BkgdIndexed
proc read*(_: typedesc[Png_BkgdTruecolor], io: KaitaiStream, root: KaitaiStruct, parent: Png_BkgdChunk): Png_BkgdTruecolor
proc read*(_: typedesc[Png_ChrmChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_ChrmChunk
proc read*(_: typedesc[Png_Chunk], io: KaitaiStream, root: KaitaiStruct, parent: Png): Png_Chunk
proc read*(_: typedesc[Png_CompressedTextChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_CompressedTextChunk
proc read*(_: typedesc[Png_FrameControlChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_FrameControlChunk
proc read*(_: typedesc[Png_FrameDataChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_FrameDataChunk
proc read*(_: typedesc[Png_GamaChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_GamaChunk
proc read*(_: typedesc[Png_IhdrChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png): Png_IhdrChunk
proc read*(_: typedesc[Png_InternationalTextChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_InternationalTextChunk
proc read*(_: typedesc[Png_PhysChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_PhysChunk
proc read*(_: typedesc[Png_PlteChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_PlteChunk
proc read*(_: typedesc[Png_Point], io: KaitaiStream, root: KaitaiStruct, parent: Png_ChrmChunk): Png_Point
proc read*(_: typedesc[Png_Rgb], io: KaitaiStream, root: KaitaiStruct, parent: Png_PlteChunk): Png_Rgb
proc read*(_: typedesc[Png_SrgbChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_SrgbChunk
proc read*(_: typedesc[Png_TextChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_TextChunk
proc read*(_: typedesc[Png_TimeChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_TimeChunk

proc delay*(this: Png_FrameControlChunk): float64
proc gammaRatio*(this: Png_GamaChunk): float64
proc x*(this: Png_Point): float64
proc y*(this: Png_Point): float64


##[
Test files for APNG can be found at the following locations:

  * <https://philip.html5.org/tests/apng/tests.html>
  * <http://littlesvr.ca/apng/>

]##
proc read*(_: typedesc[Png], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Png =
  template this: untyped = result
  this = new(Png)
  let root = if root == nil: cast[Png](this) else: cast[Png](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(8))
  this.magic = magicExpr
  let ihdrLenExpr = this.io.readU4be()
  this.ihdrLen = ihdrLenExpr
  let ihdrTypeExpr = this.io.readBytes(int(4))
  this.ihdrType = ihdrTypeExpr
  let ihdrExpr = Png_IhdrChunk.read(this.io, this.root, this)
  this.ihdr = ihdrExpr
  let ihdrCrcExpr = this.io.readBytes(int(4))
  this.ihdrCrc = ihdrCrcExpr
  block:
    var i: int
    while true:
      let it = Png_Chunk.read(this.io, this.root, this)
      this.chunks.add(it)
      if  ((it.type == "IEND") or (this.io.isEof)) :
        break
      inc i

proc fromFile*(_: typedesc[Png], filename: string): Png =
  Png.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://wiki.mozilla.org/APNG_Specification#.60acTL.60:_The_Animation_Control_Chunk">Source</a>
]##
proc read*(_: typedesc[Png_AnimationControlChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_AnimationControlChunk =
  template this: untyped = result
  this = new(Png_AnimationControlChunk)
  let root = if root == nil: cast[Png](this) else: cast[Png](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Number of frames, must be equal to the number of `frame_control_chunk`s
  ]##
  let numFramesExpr = this.io.readU4be()
  this.numFrames = numFramesExpr

  ##[
  Number of times to loop, 0 indicates infinite looping.
  ]##
  let numPlaysExpr = this.io.readU4be()
  this.numPlays = numPlaysExpr

proc fromFile*(_: typedesc[Png_AnimationControlChunk], filename: string): Png_AnimationControlChunk =
  Png_AnimationControlChunk.read(newKaitaiFileStream(filename), nil, nil)


##[
Background chunk stores default background color to display this
image against. Contents depend on `color_type` of the image.

@see <a href="https://www.w3.org/TR/png/#11bKGD">Source</a>
]##
proc read*(_: typedesc[Png_BkgdChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_BkgdChunk =
  template this: untyped = result
  this = new(Png_BkgdChunk)
  let root = if root == nil: cast[Png](this) else: cast[Png](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    let on = Png(this.root).ihdr.colorType
    if on == png.greyscale:
      let bkgdExpr = Png_BkgdGreyscale.read(this.io, this.root, this)
      this.bkgd = bkgdExpr
    elif on == png.greyscale_alpha:
      let bkgdExpr = Png_BkgdGreyscale.read(this.io, this.root, this)
      this.bkgd = bkgdExpr
    elif on == png.indexed:
      let bkgdExpr = Png_BkgdIndexed.read(this.io, this.root, this)
      this.bkgd = bkgdExpr
    elif on == png.truecolor:
      let bkgdExpr = Png_BkgdTruecolor.read(this.io, this.root, this)
      this.bkgd = bkgdExpr
    elif on == png.truecolor_alpha:
      let bkgdExpr = Png_BkgdTruecolor.read(this.io, this.root, this)
      this.bkgd = bkgdExpr

proc fromFile*(_: typedesc[Png_BkgdChunk], filename: string): Png_BkgdChunk =
  Png_BkgdChunk.read(newKaitaiFileStream(filename), nil, nil)


##[
Background chunk for greyscale images.
]##
proc read*(_: typedesc[Png_BkgdGreyscale], io: KaitaiStream, root: KaitaiStruct, parent: Png_BkgdChunk): Png_BkgdGreyscale =
  template this: untyped = result
  this = new(Png_BkgdGreyscale)
  let root = if root == nil: cast[Png](this) else: cast[Png](root)
  this.io = io
  this.root = root
  this.parent = parent

  let valueExpr = this.io.readU2be()
  this.value = valueExpr

proc fromFile*(_: typedesc[Png_BkgdGreyscale], filename: string): Png_BkgdGreyscale =
  Png_BkgdGreyscale.read(newKaitaiFileStream(filename), nil, nil)


##[
Background chunk for images with indexed palette.
]##
proc read*(_: typedesc[Png_BkgdIndexed], io: KaitaiStream, root: KaitaiStruct, parent: Png_BkgdChunk): Png_BkgdIndexed =
  template this: untyped = result
  this = new(Png_BkgdIndexed)
  let root = if root == nil: cast[Png](this) else: cast[Png](root)
  this.io = io
  this.root = root
  this.parent = parent

  let paletteIndexExpr = this.io.readU1()
  this.paletteIndex = paletteIndexExpr

proc fromFile*(_: typedesc[Png_BkgdIndexed], filename: string): Png_BkgdIndexed =
  Png_BkgdIndexed.read(newKaitaiFileStream(filename), nil, nil)


##[
Background chunk for truecolor images.
]##
proc read*(_: typedesc[Png_BkgdTruecolor], io: KaitaiStream, root: KaitaiStruct, parent: Png_BkgdChunk): Png_BkgdTruecolor =
  template this: untyped = result
  this = new(Png_BkgdTruecolor)
  let root = if root == nil: cast[Png](this) else: cast[Png](root)
  this.io = io
  this.root = root
  this.parent = parent

  let redExpr = this.io.readU2be()
  this.red = redExpr
  let greenExpr = this.io.readU2be()
  this.green = greenExpr
  let blueExpr = this.io.readU2be()
  this.blue = blueExpr

proc fromFile*(_: typedesc[Png_BkgdTruecolor], filename: string): Png_BkgdTruecolor =
  Png_BkgdTruecolor.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://www.w3.org/TR/png/#11cHRM">Source</a>
]##
proc read*(_: typedesc[Png_ChrmChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_ChrmChunk =
  template this: untyped = result
  this = new(Png_ChrmChunk)
  let root = if root == nil: cast[Png](this) else: cast[Png](root)
  this.io = io
  this.root = root
  this.parent = parent

  let whitePointExpr = Png_Point.read(this.io, this.root, this)
  this.whitePoint = whitePointExpr
  let redExpr = Png_Point.read(this.io, this.root, this)
  this.red = redExpr
  let greenExpr = Png_Point.read(this.io, this.root, this)
  this.green = greenExpr
  let blueExpr = Png_Point.read(this.io, this.root, this)
  this.blue = blueExpr

proc fromFile*(_: typedesc[Png_ChrmChunk], filename: string): Png_ChrmChunk =
  Png_ChrmChunk.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Png_Chunk], io: KaitaiStream, root: KaitaiStruct, parent: Png): Png_Chunk =
  template this: untyped = result
  this = new(Png_Chunk)
  let root = if root == nil: cast[Png](this) else: cast[Png](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenExpr = this.io.readU4be()
  this.len = lenExpr
  let typeExpr = encode(this.io.readBytes(int(4)), "UTF-8")
  this.type = typeExpr
  block:
    let on = this.type
    if on == "PLTE":
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Png_PlteChunk.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == "acTL":
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Png_AnimationControlChunk.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == "bKGD":
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Png_BkgdChunk.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == "cHRM":
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Png_ChrmChunk.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == "fcTL":
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Png_FrameControlChunk.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == "fdAT":
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Png_FrameDataChunk.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == "gAMA":
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Png_GamaChunk.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == "iTXt":
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Png_InternationalTextChunk.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == "pHYs":
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Png_PhysChunk.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == "sRGB":
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Png_SrgbChunk.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == "tEXt":
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Png_TextChunk.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == "tIME":
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Png_TimeChunk.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == "zTXt":
      let rawBodyExpr = this.io.readBytes(int(this.len))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Png_CompressedTextChunk.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    else:
      let bodyExpr = this.io.readBytes(int(this.len))
      this.body = bodyExpr
  let crcExpr = this.io.readBytes(int(4))
  this.crc = crcExpr

proc fromFile*(_: typedesc[Png_Chunk], filename: string): Png_Chunk =
  Png_Chunk.read(newKaitaiFileStream(filename), nil, nil)


##[
Compressed text chunk effectively allows to store key-value
string pairs in PNG container, compressing "value" part (which
can be quite lengthy) with zlib compression.

@see <a href="https://www.w3.org/TR/png/#11zTXt">Source</a>
]##
proc read*(_: typedesc[Png_CompressedTextChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_CompressedTextChunk =
  template this: untyped = result
  this = new(Png_CompressedTextChunk)
  let root = if root == nil: cast[Png](this) else: cast[Png](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Indicates purpose of the following text data.
  ]##
  let keywordExpr = encode(this.io.readBytesTerm(0, false, true, true), "UTF-8")
  this.keyword = keywordExpr
  let compressionMethodExpr = Png_CompressionMethods(this.io.readU1())
  this.compressionMethod = compressionMethodExpr
  let rawTextDatastreamExpr = this.io.readBytesFull()
  this.rawTextDatastream = rawTextDatastreamExpr
  let textDatastreamExpr = this.rawTextDatastream.processZlib()
  this.textDatastream = textDatastreamExpr

proc fromFile*(_: typedesc[Png_CompressedTextChunk], filename: string): Png_CompressedTextChunk =
  Png_CompressedTextChunk.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://wiki.mozilla.org/APNG_Specification#.60fcTL.60:_The_Frame_Control_Chunk">Source</a>
]##
proc read*(_: typedesc[Png_FrameControlChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_FrameControlChunk =
  template this: untyped = result
  this = new(Png_FrameControlChunk)
  let root = if root == nil: cast[Png](this) else: cast[Png](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Sequence number of the animation chunk
  ]##
  let sequenceNumberExpr = this.io.readU4be()
  this.sequenceNumber = sequenceNumberExpr

  ##[
  Width of the following frame
  ]##
  let widthExpr = this.io.readU4be()
  this.width = widthExpr

  ##[
  Height of the following frame
  ]##
  let heightExpr = this.io.readU4be()
  this.height = heightExpr

  ##[
  X position at which to render the following frame
  ]##
  let xOffsetExpr = this.io.readU4be()
  this.xOffset = xOffsetExpr

  ##[
  Y position at which to render the following frame
  ]##
  let yOffsetExpr = this.io.readU4be()
  this.yOffset = yOffsetExpr

  ##[
  Frame delay fraction numerator
  ]##
  let delayNumExpr = this.io.readU2be()
  this.delayNum = delayNumExpr

  ##[
  Frame delay fraction denominator
  ]##
  let delayDenExpr = this.io.readU2be()
  this.delayDen = delayDenExpr

  ##[
  Type of frame area disposal to be done after rendering this frame
  ]##
  let disposeOpExpr = Png_DisposeOpValues(this.io.readU1())
  this.disposeOp = disposeOpExpr

  ##[
  Type of frame area rendering for this frame
  ]##
  let blendOpExpr = Png_BlendOpValues(this.io.readU1())
  this.blendOp = blendOpExpr

proc delay(this: Png_FrameControlChunk): float64 = 

  ##[
  Time to display this frame, in seconds
  ]##
  if this.delayInstFlag:
    return this.delayInst
  let delayInstExpr = float64(this.delayNum div (if this.delayDen == 0: 100.0 else: this.delayDen))
  this.delayInst = delayInstExpr
  this.delayInstFlag = true
  return this.delayInst

proc fromFile*(_: typedesc[Png_FrameControlChunk], filename: string): Png_FrameControlChunk =
  Png_FrameControlChunk.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://wiki.mozilla.org/APNG_Specification#.60fdAT.60:_The_Frame_Data_Chunk">Source</a>
]##
proc read*(_: typedesc[Png_FrameDataChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_FrameDataChunk =
  template this: untyped = result
  this = new(Png_FrameDataChunk)
  let root = if root == nil: cast[Png](this) else: cast[Png](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Sequence number of the animation chunk. The fcTL and fdAT chunks
have a 4 byte sequence number. Both chunk types share the sequence.
The first fcTL chunk must contain sequence number 0, and the sequence
numbers in the remaining fcTL and fdAT chunks must be in order, with
no gaps or duplicates.

  ]##
  let sequenceNumberExpr = this.io.readU4be()
  this.sequenceNumber = sequenceNumberExpr

  ##[
  Frame data for the frame. At least one fdAT chunk is required for
each frame. The compressed datastream is the concatenation of the
contents of the data fields of all the fdAT chunks within a frame.

  ]##
  let frameDataExpr = this.io.readBytesFull()
  this.frameData = frameDataExpr

proc fromFile*(_: typedesc[Png_FrameDataChunk], filename: string): Png_FrameDataChunk =
  Png_FrameDataChunk.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://www.w3.org/TR/png/#11gAMA">Source</a>
]##
proc read*(_: typedesc[Png_GamaChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_GamaChunk =
  template this: untyped = result
  this = new(Png_GamaChunk)
  let root = if root == nil: cast[Png](this) else: cast[Png](root)
  this.io = io
  this.root = root
  this.parent = parent

  let gammaIntExpr = this.io.readU4be()
  this.gammaInt = gammaIntExpr

proc gammaRatio(this: Png_GamaChunk): float64 = 
  if this.gammaRatioInstFlag:
    return this.gammaRatioInst
  let gammaRatioInstExpr = float64(100000.0 div this.gammaInt)
  this.gammaRatioInst = gammaRatioInstExpr
  this.gammaRatioInstFlag = true
  return this.gammaRatioInst

proc fromFile*(_: typedesc[Png_GamaChunk], filename: string): Png_GamaChunk =
  Png_GamaChunk.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://www.w3.org/TR/png/#11IHDR">Source</a>
]##
proc read*(_: typedesc[Png_IhdrChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png): Png_IhdrChunk =
  template this: untyped = result
  this = new(Png_IhdrChunk)
  let root = if root == nil: cast[Png](this) else: cast[Png](root)
  this.io = io
  this.root = root
  this.parent = parent

  let widthExpr = this.io.readU4be()
  this.width = widthExpr
  let heightExpr = this.io.readU4be()
  this.height = heightExpr
  let bitDepthExpr = this.io.readU1()
  this.bitDepth = bitDepthExpr
  let colorTypeExpr = Png_ColorType(this.io.readU1())
  this.colorType = colorTypeExpr
  let compressionMethodExpr = this.io.readU1()
  this.compressionMethod = compressionMethodExpr
  let filterMethodExpr = this.io.readU1()
  this.filterMethod = filterMethodExpr
  let interlaceMethodExpr = this.io.readU1()
  this.interlaceMethod = interlaceMethodExpr

proc fromFile*(_: typedesc[Png_IhdrChunk], filename: string): Png_IhdrChunk =
  Png_IhdrChunk.read(newKaitaiFileStream(filename), nil, nil)


##[
International text chunk effectively allows to store key-value string pairs in
PNG container. Both "key" (keyword) and "value" (text) parts are
given in pre-defined subset of iso8859-1 without control
characters.

@see <a href="https://www.w3.org/TR/png/#11iTXt">Source</a>
]##
proc read*(_: typedesc[Png_InternationalTextChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_InternationalTextChunk =
  template this: untyped = result
  this = new(Png_InternationalTextChunk)
  let root = if root == nil: cast[Png](this) else: cast[Png](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Indicates purpose of the following text data.
  ]##
  let keywordExpr = encode(this.io.readBytesTerm(0, false, true, true), "UTF-8")
  this.keyword = keywordExpr

  ##[
  0 = text is uncompressed, 1 = text is compressed with a
method specified in `compression_method`.

  ]##
  let compressionFlagExpr = this.io.readU1()
  this.compressionFlag = compressionFlagExpr
  let compressionMethodExpr = Png_CompressionMethods(this.io.readU1())
  this.compressionMethod = compressionMethodExpr

  ##[
  Human language used in `translated_keyword` and `text`
attributes - should be a language code conforming to ISO
646.IRV:1991.

  ]##
  let languageTagExpr = encode(this.io.readBytesTerm(0, false, true, true), "ASCII")
  this.languageTag = languageTagExpr

  ##[
  Keyword translated into language specified in
`language_tag`. Line breaks are not allowed.

  ]##
  let translatedKeywordExpr = encode(this.io.readBytesTerm(0, false, true, true), "UTF-8")
  this.translatedKeyword = translatedKeywordExpr

  ##[
  Text contents ("value" of this key-value pair), written in
language specified in `language_tag`. Line breaks are
allowed.

  ]##
  let textExpr = encode(this.io.readBytesFull(), "UTF-8")
  this.text = textExpr

proc fromFile*(_: typedesc[Png_InternationalTextChunk], filename: string): Png_InternationalTextChunk =
  Png_InternationalTextChunk.read(newKaitaiFileStream(filename), nil, nil)


##[
"Physical size" chunk stores data that allows to translate
logical pixels into physical units (meters, etc) and vice-versa.

@see <a href="https://www.w3.org/TR/png/#11pHYs">Source</a>
]##
proc read*(_: typedesc[Png_PhysChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_PhysChunk =
  template this: untyped = result
  this = new(Png_PhysChunk)
  let root = if root == nil: cast[Png](this) else: cast[Png](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Number of pixels per physical unit (typically, 1 meter) by X
axis.

  ]##
  let pixelsPerUnitXExpr = this.io.readU4be()
  this.pixelsPerUnitX = pixelsPerUnitXExpr

  ##[
  Number of pixels per physical unit (typically, 1 meter) by Y
axis.

  ]##
  let pixelsPerUnitYExpr = this.io.readU4be()
  this.pixelsPerUnitY = pixelsPerUnitYExpr
  let unitExpr = Png_PhysUnit(this.io.readU1())
  this.unit = unitExpr

proc fromFile*(_: typedesc[Png_PhysChunk], filename: string): Png_PhysChunk =
  Png_PhysChunk.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://www.w3.org/TR/png/#11PLTE">Source</a>
]##
proc read*(_: typedesc[Png_PlteChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_PlteChunk =
  template this: untyped = result
  this = new(Png_PlteChunk)
  let root = if root == nil: cast[Png](this) else: cast[Png](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Png_Rgb.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[Png_PlteChunk], filename: string): Png_PlteChunk =
  Png_PlteChunk.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Png_Point], io: KaitaiStream, root: KaitaiStruct, parent: Png_ChrmChunk): Png_Point =
  template this: untyped = result
  this = new(Png_Point)
  let root = if root == nil: cast[Png](this) else: cast[Png](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xIntExpr = this.io.readU4be()
  this.xInt = xIntExpr
  let yIntExpr = this.io.readU4be()
  this.yInt = yIntExpr

proc x(this: Png_Point): float64 = 
  if this.xInstFlag:
    return this.xInst
  let xInstExpr = float64(this.xInt div 100000.0)
  this.xInst = xInstExpr
  this.xInstFlag = true
  return this.xInst

proc y(this: Png_Point): float64 = 
  if this.yInstFlag:
    return this.yInst
  let yInstExpr = float64(this.yInt div 100000.0)
  this.yInst = yInstExpr
  this.yInstFlag = true
  return this.yInst

proc fromFile*(_: typedesc[Png_Point], filename: string): Png_Point =
  Png_Point.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Png_Rgb], io: KaitaiStream, root: KaitaiStruct, parent: Png_PlteChunk): Png_Rgb =
  template this: untyped = result
  this = new(Png_Rgb)
  let root = if root == nil: cast[Png](this) else: cast[Png](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rExpr = this.io.readU1()
  this.r = rExpr
  let gExpr = this.io.readU1()
  this.g = gExpr
  let bExpr = this.io.readU1()
  this.b = bExpr

proc fromFile*(_: typedesc[Png_Rgb], filename: string): Png_Rgb =
  Png_Rgb.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://www.w3.org/TR/png/#11sRGB">Source</a>
]##
proc read*(_: typedesc[Png_SrgbChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_SrgbChunk =
  template this: untyped = result
  this = new(Png_SrgbChunk)
  let root = if root == nil: cast[Png](this) else: cast[Png](root)
  this.io = io
  this.root = root
  this.parent = parent

  let renderIntentExpr = Png_SrgbChunk_Intent(this.io.readU1())
  this.renderIntent = renderIntentExpr

proc fromFile*(_: typedesc[Png_SrgbChunk], filename: string): Png_SrgbChunk =
  Png_SrgbChunk.read(newKaitaiFileStream(filename), nil, nil)


##[
Text chunk effectively allows to store key-value string pairs in
PNG container. Both "key" (keyword) and "value" (text) parts are
given in pre-defined subset of iso8859-1 without control
characters.

@see <a href="https://www.w3.org/TR/png/#11tEXt">Source</a>
]##
proc read*(_: typedesc[Png_TextChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_TextChunk =
  template this: untyped = result
  this = new(Png_TextChunk)
  let root = if root == nil: cast[Png](this) else: cast[Png](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Indicates purpose of the following text data.
  ]##
  let keywordExpr = encode(this.io.readBytesTerm(0, false, true, true), "ISO-8859-1")
  this.keyword = keywordExpr
  let textExpr = encode(this.io.readBytesFull(), "ISO-8859-1")
  this.text = textExpr

proc fromFile*(_: typedesc[Png_TextChunk], filename: string): Png_TextChunk =
  Png_TextChunk.read(newKaitaiFileStream(filename), nil, nil)


##[
Time chunk stores time stamp of last modification of this image,
up to 1 second precision in UTC timezone.

@see <a href="https://www.w3.org/TR/png/#11tIME">Source</a>
]##
proc read*(_: typedesc[Png_TimeChunk], io: KaitaiStream, root: KaitaiStruct, parent: Png_Chunk): Png_TimeChunk =
  template this: untyped = result
  this = new(Png_TimeChunk)
  let root = if root == nil: cast[Png](this) else: cast[Png](root)
  this.io = io
  this.root = root
  this.parent = parent

  let yearExpr = this.io.readU2be()
  this.year = yearExpr
  let monthExpr = this.io.readU1()
  this.month = monthExpr
  let dayExpr = this.io.readU1()
  this.day = dayExpr
  let hourExpr = this.io.readU1()
  this.hour = hourExpr
  let minuteExpr = this.io.readU1()
  this.minute = minuteExpr
  let secondExpr = this.io.readU1()
  this.second = secondExpr

proc fromFile*(_: typedesc[Png_TimeChunk], filename: string): Png_TimeChunk =
  Png_TimeChunk.read(newKaitaiFileStream(filename), nil, nil)


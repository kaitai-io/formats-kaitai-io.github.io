import kaitai_struct_nim_runtime
import options
import exif

import "exif"
type
  Jpeg* = ref object of KaitaiStruct
    `segments`*: seq[Jpeg_Segment]
    `parent`*: KaitaiStruct
  Jpeg_ComponentId* = enum
    y = 1
    cb = 2
    cr = 3
    i = 4
    q = 5
  Jpeg_Segment* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `marker`*: Jpeg_Segment_MarkerEnum
    `length`*: uint16
    `data`*: KaitaiStruct
    `imageData`*: seq[byte]
    `parent`*: Jpeg
    `rawData`*: seq[byte]
  Jpeg_Segment_MarkerEnum* = enum
    tem = 1
    sof0 = 192
    sof1 = 193
    sof2 = 194
    sof3 = 195
    dht = 196
    sof5 = 197
    sof6 = 198
    sof7 = 199
    soi = 216
    eoi = 217
    sos = 218
    dqt = 219
    dnl = 220
    dri = 221
    dhp = 222
    app0 = 224
    app1 = 225
    app2 = 226
    app3 = 227
    app4 = 228
    app5 = 229
    app6 = 230
    app7 = 231
    app8 = 232
    app9 = 233
    app10 = 234
    app11 = 235
    app12 = 236
    app13 = 237
    app14 = 238
    app15 = 239
    com = 254
  Jpeg_SegmentSos* = ref object of KaitaiStruct
    `numComponents`*: uint8
    `components`*: seq[Jpeg_SegmentSos_Component]
    `startSpectralSelection`*: uint8
    `endSpectral`*: uint8
    `apprBitPos`*: uint8
    `parent`*: Jpeg_Segment
  Jpeg_SegmentSos_Component* = ref object of KaitaiStruct
    `id`*: Jpeg_ComponentId
    `huffmanTable`*: uint8
    `parent`*: Jpeg_SegmentSos
  Jpeg_SegmentApp1* = ref object of KaitaiStruct
    `magic`*: string
    `body`*: Jpeg_ExifInJpeg
    `parent`*: Jpeg_Segment
  Jpeg_SegmentSof0* = ref object of KaitaiStruct
    `bitsPerSample`*: uint8
    `imageHeight`*: uint16
    `imageWidth`*: uint16
    `numComponents`*: uint8
    `components`*: seq[Jpeg_SegmentSof0_Component]
    `parent`*: Jpeg_Segment
  Jpeg_SegmentSof0_Component* = ref object of KaitaiStruct
    `id`*: Jpeg_ComponentId
    `samplingFactors`*: uint8
    `quantizationTableId`*: uint8
    `parent`*: Jpeg_SegmentSof0
    `samplingXInst`: int
    `samplingXInstFlag`: bool
    `samplingYInst`: int
    `samplingYInstFlag`: bool
  Jpeg_ExifInJpeg* = ref object of KaitaiStruct
    `extraZero`*: seq[byte]
    `data`*: Exif
    `parent`*: Jpeg_SegmentApp1
    `rawData`*: seq[byte]
  Jpeg_SegmentApp0* = ref object of KaitaiStruct
    `magic`*: string
    `versionMajor`*: uint8
    `versionMinor`*: uint8
    `densityUnits`*: Jpeg_SegmentApp0_DensityUnit
    `densityX`*: uint16
    `densityY`*: uint16
    `thumbnailX`*: uint8
    `thumbnailY`*: uint8
    `thumbnail`*: seq[byte]
    `parent`*: Jpeg_Segment
  Jpeg_SegmentApp0_DensityUnit* = enum
    no_units = 0
    pixels_per_inch = 1
    pixels_per_cm = 2

proc read*(_: typedesc[Jpeg], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Jpeg
proc read*(_: typedesc[Jpeg_Segment], io: KaitaiStream, root: KaitaiStruct, parent: Jpeg): Jpeg_Segment
proc read*(_: typedesc[Jpeg_SegmentSos], io: KaitaiStream, root: KaitaiStruct, parent: Jpeg_Segment): Jpeg_SegmentSos
proc read*(_: typedesc[Jpeg_SegmentSos_Component], io: KaitaiStream, root: KaitaiStruct, parent: Jpeg_SegmentSos): Jpeg_SegmentSos_Component
proc read*(_: typedesc[Jpeg_SegmentApp1], io: KaitaiStream, root: KaitaiStruct, parent: Jpeg_Segment): Jpeg_SegmentApp1
proc read*(_: typedesc[Jpeg_SegmentSof0], io: KaitaiStream, root: KaitaiStruct, parent: Jpeg_Segment): Jpeg_SegmentSof0
proc read*(_: typedesc[Jpeg_SegmentSof0_Component], io: KaitaiStream, root: KaitaiStruct, parent: Jpeg_SegmentSof0): Jpeg_SegmentSof0_Component
proc read*(_: typedesc[Jpeg_ExifInJpeg], io: KaitaiStream, root: KaitaiStruct, parent: Jpeg_SegmentApp1): Jpeg_ExifInJpeg
proc read*(_: typedesc[Jpeg_SegmentApp0], io: KaitaiStream, root: KaitaiStruct, parent: Jpeg_Segment): Jpeg_SegmentApp0

proc samplingX*(this: Jpeg_SegmentSof0_Component): int
proc samplingY*(this: Jpeg_SegmentSof0_Component): int


##[
JPEG File Interchange Format, or JFIF, or, more colloquially known
as just "JPEG" or "JPG", is a popular 2D bitmap image file format,
offering lossy compression which works reasonably well with
photographic images.

Format is organized as a container format, serving multiple
"segments", each starting with a magic and a marker. JFIF standard
dictates order and mandatory apperance of segments:

* SOI
* APP0 (with JFIF magic)
* APP0 (with JFXX magic, optional)
* everything else
* SOS
* JPEG-compressed stream
* EOI

]##
proc read*(_: typedesc[Jpeg], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Jpeg =
  template this: untyped = result
  this = new(Jpeg)
  let root = if root == nil: cast[Jpeg](this) else: cast[Jpeg](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Jpeg_Segment.read(this.io, this.root, this)
      this.segments.add(it)
      inc i

proc fromFile*(_: typedesc[Jpeg], filename: string): Jpeg =
  Jpeg.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Jpeg_Segment], io: KaitaiStream, root: KaitaiStruct, parent: Jpeg): Jpeg_Segment =
  template this: untyped = result
  this = new(Jpeg_Segment)
  let root = if root == nil: cast[Jpeg](this) else: cast[Jpeg](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(1))
  this.magic = magicExpr
  let markerExpr = Jpeg_Segment_MarkerEnum(this.io.readU1())
  this.marker = markerExpr
  if  ((this.marker != jpeg.soi) and (this.marker != jpeg.eoi)) :
    let lengthExpr = this.io.readU2be()
    this.length = lengthExpr
  if  ((this.marker != jpeg.soi) and (this.marker != jpeg.eoi)) :
    block:
      let on = this.marker
      if on == jpeg.app1:
        let rawDataExpr = this.io.readBytes(int((this.length - 2)))
        this.rawData = rawDataExpr
        let rawDataIo = newKaitaiStream(rawDataExpr)
        let dataExpr = Jpeg_SegmentApp1.read(rawDataIo, this.root, this)
        this.data = dataExpr
      elif on == jpeg.app0:
        let rawDataExpr = this.io.readBytes(int((this.length - 2)))
        this.rawData = rawDataExpr
        let rawDataIo = newKaitaiStream(rawDataExpr)
        let dataExpr = Jpeg_SegmentApp0.read(rawDataIo, this.root, this)
        this.data = dataExpr
      elif on == jpeg.sof0:
        let rawDataExpr = this.io.readBytes(int((this.length - 2)))
        this.rawData = rawDataExpr
        let rawDataIo = newKaitaiStream(rawDataExpr)
        let dataExpr = Jpeg_SegmentSof0.read(rawDataIo, this.root, this)
        this.data = dataExpr
      elif on == jpeg.sos:
        let rawDataExpr = this.io.readBytes(int((this.length - 2)))
        this.rawData = rawDataExpr
        let rawDataIo = newKaitaiStream(rawDataExpr)
        let dataExpr = Jpeg_SegmentSos.read(rawDataIo, this.root, this)
        this.data = dataExpr
      else:
        let dataExpr = this.io.readBytes(int((this.length - 2)))
        this.data = dataExpr
  if this.marker == jpeg.sos:
    let imageDataExpr = this.io.readBytesFull()
    this.imageData = imageDataExpr

proc fromFile*(_: typedesc[Jpeg_Segment], filename: string): Jpeg_Segment =
  Jpeg_Segment.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Jpeg_SegmentSos], io: KaitaiStream, root: KaitaiStruct, parent: Jpeg_Segment): Jpeg_SegmentSos =
  template this: untyped = result
  this = new(Jpeg_SegmentSos)
  let root = if root == nil: cast[Jpeg](this) else: cast[Jpeg](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Number of components in scan
  ]##
  let numComponentsExpr = this.io.readU1()
  this.numComponents = numComponentsExpr

  ##[
  Scan components specification
  ]##
  for i in 0 ..< int(this.numComponents):
    let it = Jpeg_SegmentSos_Component.read(this.io, this.root, this)
    this.components.add(it)

  ##[
  Start of spectral selection or predictor selection
  ]##
  let startSpectralSelectionExpr = this.io.readU1()
  this.startSpectralSelection = startSpectralSelectionExpr

  ##[
  End of spectral selection
  ]##
  let endSpectralExpr = this.io.readU1()
  this.endSpectral = endSpectralExpr

  ##[
  Successive approximation bit position high + Successive approximation bit position low or point transform
  ]##
  let apprBitPosExpr = this.io.readU1()
  this.apprBitPos = apprBitPosExpr

proc fromFile*(_: typedesc[Jpeg_SegmentSos], filename: string): Jpeg_SegmentSos =
  Jpeg_SegmentSos.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Jpeg_SegmentSos_Component], io: KaitaiStream, root: KaitaiStruct, parent: Jpeg_SegmentSos): Jpeg_SegmentSos_Component =
  template this: untyped = result
  this = new(Jpeg_SegmentSos_Component)
  let root = if root == nil: cast[Jpeg](this) else: cast[Jpeg](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Scan component selector
  ]##
  let idExpr = Jpeg_ComponentId(this.io.readU1())
  this.id = idExpr
  let huffmanTableExpr = this.io.readU1()
  this.huffmanTable = huffmanTableExpr

proc fromFile*(_: typedesc[Jpeg_SegmentSos_Component], filename: string): Jpeg_SegmentSos_Component =
  Jpeg_SegmentSos_Component.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Jpeg_SegmentApp1], io: KaitaiStream, root: KaitaiStruct, parent: Jpeg_Segment): Jpeg_SegmentApp1 =
  template this: untyped = result
  this = new(Jpeg_SegmentApp1)
  let root = if root == nil: cast[Jpeg](this) else: cast[Jpeg](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = encode(this.io.readBytesTerm(0, false, true, true), "ASCII")
  this.magic = magicExpr
  block:
    let on = this.magic
    if on == "Exif":
      let bodyExpr = Jpeg_ExifInJpeg.read(this.io, this.root, this)
      this.body = bodyExpr

proc fromFile*(_: typedesc[Jpeg_SegmentApp1], filename: string): Jpeg_SegmentApp1 =
  Jpeg_SegmentApp1.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Jpeg_SegmentSof0], io: KaitaiStream, root: KaitaiStruct, parent: Jpeg_Segment): Jpeg_SegmentSof0 =
  template this: untyped = result
  this = new(Jpeg_SegmentSof0)
  let root = if root == nil: cast[Jpeg](this) else: cast[Jpeg](root)
  this.io = io
  this.root = root
  this.parent = parent

  let bitsPerSampleExpr = this.io.readU1()
  this.bitsPerSample = bitsPerSampleExpr
  let imageHeightExpr = this.io.readU2be()
  this.imageHeight = imageHeightExpr
  let imageWidthExpr = this.io.readU2be()
  this.imageWidth = imageWidthExpr
  let numComponentsExpr = this.io.readU1()
  this.numComponents = numComponentsExpr
  for i in 0 ..< int(this.numComponents):
    let it = Jpeg_SegmentSof0_Component.read(this.io, this.root, this)
    this.components.add(it)

proc fromFile*(_: typedesc[Jpeg_SegmentSof0], filename: string): Jpeg_SegmentSof0 =
  Jpeg_SegmentSof0.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Jpeg_SegmentSof0_Component], io: KaitaiStream, root: KaitaiStruct, parent: Jpeg_SegmentSof0): Jpeg_SegmentSof0_Component =
  template this: untyped = result
  this = new(Jpeg_SegmentSof0_Component)
  let root = if root == nil: cast[Jpeg](this) else: cast[Jpeg](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Component selector
  ]##
  let idExpr = Jpeg_ComponentId(this.io.readU1())
  this.id = idExpr
  let samplingFactorsExpr = this.io.readU1()
  this.samplingFactors = samplingFactorsExpr
  let quantizationTableIdExpr = this.io.readU1()
  this.quantizationTableId = quantizationTableIdExpr

proc samplingX(this: Jpeg_SegmentSof0_Component): int = 
  if this.samplingXInstFlag:
    return this.samplingXInst
  let samplingXInstExpr = int(((this.samplingFactors and 240) shr 4))
  this.samplingXInst = samplingXInstExpr
  this.samplingXInstFlag = true
  return this.samplingXInst

proc samplingY(this: Jpeg_SegmentSof0_Component): int = 
  if this.samplingYInstFlag:
    return this.samplingYInst
  let samplingYInstExpr = int((this.samplingFactors and 15))
  this.samplingYInst = samplingYInstExpr
  this.samplingYInstFlag = true
  return this.samplingYInst

proc fromFile*(_: typedesc[Jpeg_SegmentSof0_Component], filename: string): Jpeg_SegmentSof0_Component =
  Jpeg_SegmentSof0_Component.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Jpeg_ExifInJpeg], io: KaitaiStream, root: KaitaiStruct, parent: Jpeg_SegmentApp1): Jpeg_ExifInJpeg =
  template this: untyped = result
  this = new(Jpeg_ExifInJpeg)
  let root = if root == nil: cast[Jpeg](this) else: cast[Jpeg](root)
  this.io = io
  this.root = root
  this.parent = parent

  let extraZeroExpr = this.io.readBytes(int(1))
  this.extraZero = extraZeroExpr
  let rawDataExpr = this.io.readBytesFull()
  this.rawData = rawDataExpr
  let rawDataIo = newKaitaiStream(rawDataExpr)
  let dataExpr = Exif.read(rawDataIo, this.root, this)
  this.data = dataExpr

proc fromFile*(_: typedesc[Jpeg_ExifInJpeg], filename: string): Jpeg_ExifInJpeg =
  Jpeg_ExifInJpeg.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Jpeg_SegmentApp0], io: KaitaiStream, root: KaitaiStruct, parent: Jpeg_Segment): Jpeg_SegmentApp0 =
  template this: untyped = result
  this = new(Jpeg_SegmentApp0)
  let root = if root == nil: cast[Jpeg](this) else: cast[Jpeg](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = encode(this.io.readBytes(int(5)), "ASCII")
  this.magic = magicExpr
  let versionMajorExpr = this.io.readU1()
  this.versionMajor = versionMajorExpr
  let versionMinorExpr = this.io.readU1()
  this.versionMinor = versionMinorExpr
  let densityUnitsExpr = Jpeg_SegmentApp0_DensityUnit(this.io.readU1())
  this.densityUnits = densityUnitsExpr

  ##[
  Horizontal pixel density. Must not be zero.
  ]##
  let densityXExpr = this.io.readU2be()
  this.densityX = densityXExpr

  ##[
  Vertical pixel density. Must not be zero.
  ]##
  let densityYExpr = this.io.readU2be()
  this.densityY = densityYExpr

  ##[
  Horizontal pixel count of the following embedded RGB thumbnail. May be zero.
  ]##
  let thumbnailXExpr = this.io.readU1()
  this.thumbnailX = thumbnailXExpr

  ##[
  Vertical pixel count of the following embedded RGB thumbnail. May be zero.
  ]##
  let thumbnailYExpr = this.io.readU1()
  this.thumbnailY = thumbnailYExpr

  ##[
  Uncompressed 24 bit RGB (8 bits per color channel) raster thumbnail data in the order R0, G0, B0, ... Rn, Gn, Bn
  ]##
  let thumbnailExpr = this.io.readBytes(int(((this.thumbnailX * this.thumbnailY) * 3)))
  this.thumbnail = thumbnailExpr

proc fromFile*(_: typedesc[Jpeg_SegmentApp0], filename: string): Jpeg_SegmentApp0 =
  Jpeg_SegmentApp0.read(newKaitaiFileStream(filename), nil, nil)


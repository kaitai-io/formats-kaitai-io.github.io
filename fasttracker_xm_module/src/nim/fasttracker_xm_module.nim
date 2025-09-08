import kaitai_struct_nim_runtime
import options

type
  FasttrackerXmModule* = ref object of KaitaiStruct
    `preheader`*: FasttrackerXmModule_Preheader
    `header`*: FasttrackerXmModule_Header
    `patterns`*: seq[FasttrackerXmModule_Pattern]
    `instruments`*: seq[FasttrackerXmModule_Instrument]
    `parent`*: KaitaiStruct
    `rawHeader`*: seq[byte]
  FasttrackerXmModule_Flags* = ref object of KaitaiStruct
    `reserved`*: uint64
    `freqTableType`*: bool
    `parent`*: FasttrackerXmModule_Header
  FasttrackerXmModule_Header* = ref object of KaitaiStruct
    `songLength`*: uint16
    `restartPosition`*: uint16
    `numChannels`*: uint16
    `numPatterns`*: uint16
    `numInstruments`*: uint16
    `flags`*: FasttrackerXmModule_Flags
    `defaultTempo`*: uint16
    `defaultBpm`*: uint16
    `patternOrderTable`*: seq[uint8]
    `parent`*: FasttrackerXmModule
  FasttrackerXmModule_Instrument* = ref object of KaitaiStruct
    `headerSize`*: uint32
    `header`*: FasttrackerXmModule_Instrument_Header
    `samplesHeaders`*: seq[FasttrackerXmModule_Instrument_SampleHeader]
    `samples`*: seq[FasttrackerXmModule_Instrument_SamplesData]
    `parent`*: FasttrackerXmModule
    `rawHeader`*: seq[byte]
  FasttrackerXmModule_Instrument_ExtraHeader* = ref object of KaitaiStruct
    `lenSampleHeader`*: uint32
    `idxSamplePerNote`*: seq[uint8]
    `volumePoints`*: seq[FasttrackerXmModule_Instrument_ExtraHeader_EnvelopePoint]
    `panningPoints`*: seq[FasttrackerXmModule_Instrument_ExtraHeader_EnvelopePoint]
    `numVolumePoints`*: uint8
    `numPanningPoints`*: uint8
    `volumeSustainPoint`*: uint8
    `volumeLoopStartPoint`*: uint8
    `volumeLoopEndPoint`*: uint8
    `panningSustainPoint`*: uint8
    `panningLoopStartPoint`*: uint8
    `panningLoopEndPoint`*: uint8
    `volumeType`*: FasttrackerXmModule_Instrument_ExtraHeader_Type
    `panningType`*: FasttrackerXmModule_Instrument_ExtraHeader_Type
    `vibratoType`*: uint8
    `vibratoSweep`*: uint8
    `vibratoDepth`*: uint8
    `vibratoRate`*: uint8
    `volumeFadeout`*: uint16
    `reserved`*: uint16
    `parent`*: FasttrackerXmModule_Instrument_Header
  FasttrackerXmModule_Instrument_ExtraHeader_Type* = enum
    true = 0
    sustain = 1
    loop = 2
  FasttrackerXmModule_Instrument_ExtraHeader_EnvelopePoint* = ref object of KaitaiStruct
    `x`*: uint16
    `y`*: uint16
    `parent`*: FasttrackerXmModule_Instrument_ExtraHeader
  FasttrackerXmModule_Instrument_Header* = ref object of KaitaiStruct
    `name`*: string
    `type`*: uint8
    `numSamples`*: uint16
    `extraHeader`*: FasttrackerXmModule_Instrument_ExtraHeader
    `parent`*: FasttrackerXmModule_Instrument
  FasttrackerXmModule_Instrument_SampleHeader* = ref object of KaitaiStruct
    `sampleLength`*: uint32
    `sampleLoopStart`*: uint32
    `sampleLoopLength`*: uint32
    `volume`*: uint8
    `fineTune`*: int8
    `type`*: FasttrackerXmModule_Instrument_SampleHeader_LoopType
    `panning`*: uint8
    `relativeNoteNumber`*: int8
    `reserved`*: uint8
    `name`*: string
    `parent`*: FasttrackerXmModule_Instrument
  FasttrackerXmModule_Instrument_SampleHeader_LoopType* = ref object of KaitaiStruct
    `reserved0`*: uint64
    `isSampleData16Bit`*: bool
    `reserved1`*: uint64
    `loopType`*: FasttrackerXmModule_Instrument_SampleHeader_LoopType_LoopType
    `parent`*: FasttrackerXmModule_Instrument_SampleHeader
  FasttrackerXmModule_Instrument_SampleHeader_LoopType_LoopType* = enum
    none = 0
    forward = 1
    ping_pong = 2
  FasttrackerXmModule_Instrument_SamplesData* = ref object of KaitaiStruct
    `data`*: seq[byte]
    `header`*: FasttrackerXmModule_Instrument_SampleHeader
    `parent`*: FasttrackerXmModule_Instrument
  FasttrackerXmModule_Pattern* = ref object of KaitaiStruct
    `header`*: FasttrackerXmModule_Pattern_Header
    `packedData`*: seq[byte]
    `parent`*: FasttrackerXmModule
  FasttrackerXmModule_Pattern_Header* = ref object of KaitaiStruct
    `headerLength`*: uint32
    `main`*: FasttrackerXmModule_Pattern_Header_HeaderMain
    `parent`*: FasttrackerXmModule_Pattern
    `rawMain`*: seq[byte]
  FasttrackerXmModule_Pattern_Header_HeaderMain* = ref object of KaitaiStruct
    `packingType`*: uint8
    `numRowsRaw`*: uint16
    `lenPackedPattern`*: uint16
    `parent`*: FasttrackerXmModule_Pattern_Header
    `numRowsInst`: int
    `numRowsInstFlag`: bool
  FasttrackerXmModule_Preheader* = ref object of KaitaiStruct
    `signature0`*: seq[byte]
    `moduleName`*: string
    `signature1`*: seq[byte]
    `trackerName`*: string
    `versionNumber`*: FasttrackerXmModule_Preheader_Version
    `headerSize`*: uint32
    `parent`*: FasttrackerXmModule
  FasttrackerXmModule_Preheader_Version* = ref object of KaitaiStruct
    `minor`*: uint8
    `major`*: uint8
    `parent`*: FasttrackerXmModule_Preheader
    `valueInst`: int
    `valueInstFlag`: bool

proc read*(_: typedesc[FasttrackerXmModule], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): FasttrackerXmModule
proc read*(_: typedesc[FasttrackerXmModule_Flags], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule_Header): FasttrackerXmModule_Flags
proc read*(_: typedesc[FasttrackerXmModule_Header], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule): FasttrackerXmModule_Header
proc read*(_: typedesc[FasttrackerXmModule_Instrument], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule): FasttrackerXmModule_Instrument
proc read*(_: typedesc[FasttrackerXmModule_Instrument_ExtraHeader], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule_Instrument_Header): FasttrackerXmModule_Instrument_ExtraHeader
proc read*(_: typedesc[FasttrackerXmModule_Instrument_ExtraHeader_EnvelopePoint], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule_Instrument_ExtraHeader): FasttrackerXmModule_Instrument_ExtraHeader_EnvelopePoint
proc read*(_: typedesc[FasttrackerXmModule_Instrument_Header], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule_Instrument): FasttrackerXmModule_Instrument_Header
proc read*(_: typedesc[FasttrackerXmModule_Instrument_SampleHeader], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule_Instrument): FasttrackerXmModule_Instrument_SampleHeader
proc read*(_: typedesc[FasttrackerXmModule_Instrument_SampleHeader_LoopType], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule_Instrument_SampleHeader): FasttrackerXmModule_Instrument_SampleHeader_LoopType
proc read*(_: typedesc[FasttrackerXmModule_Instrument_SamplesData], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule_Instrument, header: any): FasttrackerXmModule_Instrument_SamplesData
proc read*(_: typedesc[FasttrackerXmModule_Pattern], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule): FasttrackerXmModule_Pattern
proc read*(_: typedesc[FasttrackerXmModule_Pattern_Header], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule_Pattern): FasttrackerXmModule_Pattern_Header
proc read*(_: typedesc[FasttrackerXmModule_Pattern_Header_HeaderMain], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule_Pattern_Header): FasttrackerXmModule_Pattern_Header_HeaderMain
proc read*(_: typedesc[FasttrackerXmModule_Preheader], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule): FasttrackerXmModule_Preheader
proc read*(_: typedesc[FasttrackerXmModule_Preheader_Version], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule_Preheader): FasttrackerXmModule_Preheader_Version

proc numRows*(this: FasttrackerXmModule_Pattern_Header_HeaderMain): int
proc value*(this: FasttrackerXmModule_Preheader_Version): int


##[
XM (standing for eXtended Module) is a popular module music file
format, that was introduced in 1994 in FastTracker2 by Triton demo
group. Akin to MOD files, it bundles both digital samples
(instruments) and instructions on which note to play at what time
(patterns), which provides good audio quality with relatively small
file size. Audio is reproducible without relying on the sound of
particular hardware samplers or synths.

@see <a href="http://sid.ethz.ch/debian/milkytracker/milkytracker-0.90.85%2Bdfsg/resources/reference/xm-form.txt
ftp://ftp.modland.com/pub/documents/format_documentation/FastTracker%202%20v2.04%20(.xm).html
">Source</a>
]##
proc read*(_: typedesc[FasttrackerXmModule], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): FasttrackerXmModule =
  template this: untyped = result
  this = new(FasttrackerXmModule)
  let root = if root == nil: cast[FasttrackerXmModule](this) else: cast[FasttrackerXmModule](root)
  this.io = io
  this.root = root
  this.parent = parent

  let preheaderExpr = FasttrackerXmModule_Preheader.read(this.io, this.root, this)
  this.preheader = preheaderExpr
  let rawHeaderExpr = this.io.readBytes(int(this.preheader.headerSize - 4))
  this.rawHeader = rawHeaderExpr
  let rawHeaderIo = newKaitaiStream(rawHeaderExpr)
  let headerExpr = FasttrackerXmModule_Header.read(rawHeaderIo, this.root, this)
  this.header = headerExpr
  for i in 0 ..< int(this.header.numPatterns):
    let it = FasttrackerXmModule_Pattern.read(this.io, this.root, this)
    this.patterns.add(it)
  for i in 0 ..< int(this.header.numInstruments):
    let it = FasttrackerXmModule_Instrument.read(this.io, this.root, this)
    this.instruments.add(it)

proc fromFile*(_: typedesc[FasttrackerXmModule], filename: string): FasttrackerXmModule =
  FasttrackerXmModule.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[FasttrackerXmModule_Flags], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule_Header): FasttrackerXmModule_Flags =
  template this: untyped = result
  this = new(FasttrackerXmModule_Flags)
  let root = if root == nil: cast[FasttrackerXmModule](this) else: cast[FasttrackerXmModule](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBitsIntBe(15)
  this.reserved = reservedExpr

  ##[
  0 = Amiga frequency table (see below); 1 = Linear frequency table
  ]##
  let freqTableTypeExpr = this.io.readBitsIntBe(1) != 0
  this.freqTableType = freqTableTypeExpr

proc fromFile*(_: typedesc[FasttrackerXmModule_Flags], filename: string): FasttrackerXmModule_Flags =
  FasttrackerXmModule_Flags.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[FasttrackerXmModule_Header], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule): FasttrackerXmModule_Header =
  template this: untyped = result
  this = new(FasttrackerXmModule_Header)
  let root = if root == nil: cast[FasttrackerXmModule](this) else: cast[FasttrackerXmModule](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Song length (in pattern order table)
  ]##
  let songLengthExpr = this.io.readU2le()
  this.songLength = songLengthExpr
  let restartPositionExpr = this.io.readU2le()
  this.restartPosition = restartPositionExpr

  ##[
  (2,4,6,8,10,...,32)
  ]##
  let numChannelsExpr = this.io.readU2le()
  this.numChannels = numChannelsExpr

  ##[
  (max 256)
  ]##
  let numPatternsExpr = this.io.readU2le()
  this.numPatterns = numPatternsExpr

  ##[
  (max 128)
  ]##
  let numInstrumentsExpr = this.io.readU2le()
  this.numInstruments = numInstrumentsExpr
  let flagsExpr = FasttrackerXmModule_Flags.read(this.io, this.root, this)
  this.flags = flagsExpr
  let defaultTempoExpr = this.io.readU2le()
  this.defaultTempo = defaultTempoExpr
  let defaultBpmExpr = this.io.readU2le()
  this.defaultBpm = defaultBpmExpr

  ##[
  max 256
  ]##
  for i in 0 ..< int(256):
    let it = this.io.readU1()
    this.patternOrderTable.add(it)

proc fromFile*(_: typedesc[FasttrackerXmModule_Header], filename: string): FasttrackerXmModule_Header =
  FasttrackerXmModule_Header.read(newKaitaiFileStream(filename), nil, nil)


##[
XM's notion of "instrument" typically constitutes of a
instrument metadata and one or several samples. Metadata
includes:

* instrument's name
* instruction of which sample to use for which note
* volume and panning envelopes and looping instructions
* vibrato settings

]##
proc read*(_: typedesc[FasttrackerXmModule_Instrument], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule): FasttrackerXmModule_Instrument =
  template this: untyped = result
  this = new(FasttrackerXmModule_Instrument)
  let root = if root == nil: cast[FasttrackerXmModule](this) else: cast[FasttrackerXmModule](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Instrument size << header that is >>
<< "Instrument Size" field tends to be more than the actual size of the structure documented here (it includes also the extended instrument sample header above). So remember to check it and skip the additional bytes before the first sample header >>

  ]##
  let headerSizeExpr = this.io.readU4le()
  this.headerSize = headerSizeExpr
  let rawHeaderExpr = this.io.readBytes(int(this.headerSize - 4))
  this.rawHeader = rawHeaderExpr
  let rawHeaderIo = newKaitaiStream(rawHeaderExpr)
  let headerExpr = FasttrackerXmModule_Instrument_Header.read(rawHeaderIo, this.root, this)
  this.header = headerExpr
  for i in 0 ..< int(this.header.numSamples):
    let it = FasttrackerXmModule_Instrument_SampleHeader.read(this.io, this.root, this)
    this.samplesHeaders.add(it)
  for i in 0 ..< int(this.header.numSamples):
    let it = FasttrackerXmModule_Instrument_SamplesData.read(this.io, this.root, this, this.samplesHeaders[i])
    this.samples.add(it)

proc fromFile*(_: typedesc[FasttrackerXmModule_Instrument], filename: string): FasttrackerXmModule_Instrument =
  FasttrackerXmModule_Instrument.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[FasttrackerXmModule_Instrument_ExtraHeader], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule_Instrument_Header): FasttrackerXmModule_Instrument_ExtraHeader =
  template this: untyped = result
  this = new(FasttrackerXmModule_Instrument_ExtraHeader)
  let root = if root == nil: cast[FasttrackerXmModule](this) else: cast[FasttrackerXmModule](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lenSampleHeaderExpr = this.io.readU4le()
  this.lenSampleHeader = lenSampleHeaderExpr

  ##[
  Index of sample that should be used for any particular
note. In the simplest case, where it's only one sample
is available, it's an array of full of zeroes.

  ]##
  for i in 0 ..< int(96):
    let it = this.io.readU1()
    this.idxSamplePerNote.add(it)

  ##[
  Points for volume envelope. Only `num_volume_points` will be actually used.
  ]##
  for i in 0 ..< int(12):
    let it = FasttrackerXmModule_Instrument_ExtraHeader_EnvelopePoint.read(this.io, this.root, this)
    this.volumePoints.add(it)

  ##[
  Points for panning envelope. Only `num_panning_points` will be actually used.
  ]##
  for i in 0 ..< int(12):
    let it = FasttrackerXmModule_Instrument_ExtraHeader_EnvelopePoint.read(this.io, this.root, this)
    this.panningPoints.add(it)
  let numVolumePointsExpr = this.io.readU1()
  this.numVolumePoints = numVolumePointsExpr
  let numPanningPointsExpr = this.io.readU1()
  this.numPanningPoints = numPanningPointsExpr
  let volumeSustainPointExpr = this.io.readU1()
  this.volumeSustainPoint = volumeSustainPointExpr
  let volumeLoopStartPointExpr = this.io.readU1()
  this.volumeLoopStartPoint = volumeLoopStartPointExpr
  let volumeLoopEndPointExpr = this.io.readU1()
  this.volumeLoopEndPoint = volumeLoopEndPointExpr
  let panningSustainPointExpr = this.io.readU1()
  this.panningSustainPoint = panningSustainPointExpr
  let panningLoopStartPointExpr = this.io.readU1()
  this.panningLoopStartPoint = panningLoopStartPointExpr
  let panningLoopEndPointExpr = this.io.readU1()
  this.panningLoopEndPoint = panningLoopEndPointExpr
  let volumeTypeExpr = FasttrackerXmModule_Instrument_ExtraHeader_Type(this.io.readU1())
  this.volumeType = volumeTypeExpr
  let panningTypeExpr = FasttrackerXmModule_Instrument_ExtraHeader_Type(this.io.readU1())
  this.panningType = panningTypeExpr
  let vibratoTypeExpr = this.io.readU1()
  this.vibratoType = vibratoTypeExpr
  let vibratoSweepExpr = this.io.readU1()
  this.vibratoSweep = vibratoSweepExpr
  let vibratoDepthExpr = this.io.readU1()
  this.vibratoDepth = vibratoDepthExpr
  let vibratoRateExpr = this.io.readU1()
  this.vibratoRate = vibratoRateExpr
  let volumeFadeoutExpr = this.io.readU2le()
  this.volumeFadeout = volumeFadeoutExpr
  let reservedExpr = this.io.readU2le()
  this.reserved = reservedExpr

proc fromFile*(_: typedesc[FasttrackerXmModule_Instrument_ExtraHeader], filename: string): FasttrackerXmModule_Instrument_ExtraHeader =
  FasttrackerXmModule_Instrument_ExtraHeader.read(newKaitaiFileStream(filename), nil, nil)


##[
Envelope frame-counters work in range 0..FFFFh (0..65535 dec).
BUT! FT2 only itself supports only range 0..FFh (0..255 dec).
Some other trackers (like SoundTracker for Unix), however, can use the full range 0..FFFF, so it should be supported.
!!TIP: This is also a good way to detect if the module has been made with FT2 or not. (In case the tracker name is brain- deadly left unchanged!)
Of course it does not help if all instruments have the values inside FT2 supported range.
The value-field of the envelope point is ranged between 00..3Fh (0..64 dec).

]##
proc read*(_: typedesc[FasttrackerXmModule_Instrument_ExtraHeader_EnvelopePoint], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule_Instrument_ExtraHeader): FasttrackerXmModule_Instrument_ExtraHeader_EnvelopePoint =
  template this: untyped = result
  this = new(FasttrackerXmModule_Instrument_ExtraHeader_EnvelopePoint)
  let root = if root == nil: cast[FasttrackerXmModule](this) else: cast[FasttrackerXmModule](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Frame number of the point
  ]##
  let xExpr = this.io.readU2le()
  this.x = xExpr

  ##[
  Value of the point
  ]##
  let yExpr = this.io.readU2le()
  this.y = yExpr

proc fromFile*(_: typedesc[FasttrackerXmModule_Instrument_ExtraHeader_EnvelopePoint], filename: string): FasttrackerXmModule_Instrument_ExtraHeader_EnvelopePoint =
  FasttrackerXmModule_Instrument_ExtraHeader_EnvelopePoint.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[FasttrackerXmModule_Instrument_Header], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule_Instrument): FasttrackerXmModule_Instrument_Header =
  template this: untyped = result
  this = new(FasttrackerXmModule_Instrument_Header)
  let root = if root == nil: cast[FasttrackerXmModule](this) else: cast[FasttrackerXmModule](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameExpr = encode(this.io.readBytes(int(22)).bytesTerminate(0, false), "UTF-8")
  this.name = nameExpr

  ##[
  Usually zero, but this seems pretty random, don't assume it's zero
  ]##
  let typeExpr = this.io.readU1()
  this.type = typeExpr
  let numSamplesExpr = this.io.readU2le()
  this.numSamples = numSamplesExpr
  if this.numSamples > 0:
    let extraHeaderExpr = FasttrackerXmModule_Instrument_ExtraHeader.read(this.io, this.root, this)
    this.extraHeader = extraHeaderExpr

proc fromFile*(_: typedesc[FasttrackerXmModule_Instrument_Header], filename: string): FasttrackerXmModule_Instrument_Header =
  FasttrackerXmModule_Instrument_Header.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[FasttrackerXmModule_Instrument_SampleHeader], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule_Instrument): FasttrackerXmModule_Instrument_SampleHeader =
  template this: untyped = result
  this = new(FasttrackerXmModule_Instrument_SampleHeader)
  let root = if root == nil: cast[FasttrackerXmModule](this) else: cast[FasttrackerXmModule](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sampleLengthExpr = this.io.readU4le()
  this.sampleLength = sampleLengthExpr
  let sampleLoopStartExpr = this.io.readU4le()
  this.sampleLoopStart = sampleLoopStartExpr
  let sampleLoopLengthExpr = this.io.readU4le()
  this.sampleLoopLength = sampleLoopLengthExpr
  let volumeExpr = this.io.readU1()
  this.volume = volumeExpr

  ##[
  -16..+15
  ]##
  let fineTuneExpr = this.io.readS1()
  this.fineTune = fineTuneExpr
  let typeExpr = FasttrackerXmModule_Instrument_SampleHeader_LoopType.read(this.io, this.root, this)
  this.type = typeExpr

  ##[
  (0-255)
  ]##
  let panningExpr = this.io.readU1()
  this.panning = panningExpr
  let relativeNoteNumberExpr = this.io.readS1()
  this.relativeNoteNumber = relativeNoteNumberExpr
  let reservedExpr = this.io.readU1()
  this.reserved = reservedExpr
  let nameExpr = encode(this.io.readBytes(int(22)).bytesTerminate(0, false), "UTF-8")
  this.name = nameExpr

proc fromFile*(_: typedesc[FasttrackerXmModule_Instrument_SampleHeader], filename: string): FasttrackerXmModule_Instrument_SampleHeader =
  FasttrackerXmModule_Instrument_SampleHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[FasttrackerXmModule_Instrument_SampleHeader_LoopType], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule_Instrument_SampleHeader): FasttrackerXmModule_Instrument_SampleHeader_LoopType =
  template this: untyped = result
  this = new(FasttrackerXmModule_Instrument_SampleHeader_LoopType)
  let root = if root == nil: cast[FasttrackerXmModule](this) else: cast[FasttrackerXmModule](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reserved0Expr = this.io.readBitsIntBe(3)
  this.reserved0 = reserved0Expr
  let isSampleData16BitExpr = this.io.readBitsIntBe(1) != 0
  this.isSampleData16Bit = isSampleData16BitExpr
  let reserved1Expr = this.io.readBitsIntBe(2)
  this.reserved1 = reserved1Expr
  let loopTypeExpr = FasttrackerXmModule_Instrument_SampleHeader_LoopType_LoopType(this.io.readBitsIntBe(2))
  this.loopType = loopTypeExpr

proc fromFile*(_: typedesc[FasttrackerXmModule_Instrument_SampleHeader_LoopType], filename: string): FasttrackerXmModule_Instrument_SampleHeader_LoopType =
  FasttrackerXmModule_Instrument_SampleHeader_LoopType.read(newKaitaiFileStream(filename), nil, nil)


##[
The saved data uses simple delta-encoding to achieve better compression ratios (when compressed with pkzip, etc.)
Pseudocode for converting the delta-coded data to normal data,
old = 0;
for i in range(data_len):
  new = sample[i] + old;
  sample[i] = new;
  old = new;

]##
proc read*(_: typedesc[FasttrackerXmModule_Instrument_SamplesData], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule_Instrument, header: any): FasttrackerXmModule_Instrument_SamplesData =
  template this: untyped = result
  this = new(FasttrackerXmModule_Instrument_SamplesData)
  let root = if root == nil: cast[FasttrackerXmModule](this) else: cast[FasttrackerXmModule](root)
  this.io = io
  this.root = root
  this.parent = parent
  let headerExpr = FasttrackerXmModule_Instrument_SampleHeader(header)
  this.header = headerExpr

  let dataExpr = this.io.readBytes(int(this.header.sampleLength * (if this.header.type.isSampleData16Bit: 2 else: 1)))
  this.data = dataExpr

proc fromFile*(_: typedesc[FasttrackerXmModule_Instrument_SamplesData], filename: string): FasttrackerXmModule_Instrument_SamplesData =
  FasttrackerXmModule_Instrument_SamplesData.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[FasttrackerXmModule_Pattern], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule): FasttrackerXmModule_Pattern =
  template this: untyped = result
  this = new(FasttrackerXmModule_Pattern)
  let root = if root == nil: cast[FasttrackerXmModule](this) else: cast[FasttrackerXmModule](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = FasttrackerXmModule_Pattern_Header.read(this.io, this.root, this)
  this.header = headerExpr
  let packedDataExpr = this.io.readBytes(int(this.header.main.lenPackedPattern))
  this.packedData = packedDataExpr

proc fromFile*(_: typedesc[FasttrackerXmModule_Pattern], filename: string): FasttrackerXmModule_Pattern =
  FasttrackerXmModule_Pattern.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[FasttrackerXmModule_Pattern_Header], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule_Pattern): FasttrackerXmModule_Pattern_Header =
  template this: untyped = result
  this = new(FasttrackerXmModule_Pattern_Header)
  let root = if root == nil: cast[FasttrackerXmModule](this) else: cast[FasttrackerXmModule](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Pattern header length
  ]##
  let headerLengthExpr = this.io.readU4le()
  this.headerLength = headerLengthExpr
  let rawMainExpr = this.io.readBytes(int(this.headerLength - 4))
  this.rawMain = rawMainExpr
  let rawMainIo = newKaitaiStream(rawMainExpr)
  let mainExpr = FasttrackerXmModule_Pattern_Header_HeaderMain.read(rawMainIo, this.root, this)
  this.main = mainExpr

proc fromFile*(_: typedesc[FasttrackerXmModule_Pattern_Header], filename: string): FasttrackerXmModule_Pattern_Header =
  FasttrackerXmModule_Pattern_Header.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[FasttrackerXmModule_Pattern_Header_HeaderMain], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule_Pattern_Header): FasttrackerXmModule_Pattern_Header_HeaderMain =
  template this: untyped = result
  this = new(FasttrackerXmModule_Pattern_Header_HeaderMain)
  let root = if root == nil: cast[FasttrackerXmModule](this) else: cast[FasttrackerXmModule](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Packing type (always 0)
  ]##
  let packingTypeExpr = this.io.readU1()
  this.packingType = packingTypeExpr

  ##[
  Number of rows in pattern (1..256)
  ]##
  block:
    let on = FasttrackerXmModule(this.root).preheader.versionNumber.value
    if on == 258:
      let numRowsRawExpr = uint16(this.io.readU1())
      this.numRowsRaw = numRowsRawExpr
    else:
      let numRowsRawExpr = this.io.readU2le()
      this.numRowsRaw = numRowsRawExpr

  ##[
  Packed pattern data size
  ]##
  let lenPackedPatternExpr = this.io.readU2le()
  this.lenPackedPattern = lenPackedPatternExpr

proc numRows(this: FasttrackerXmModule_Pattern_Header_HeaderMain): int = 
  if this.numRowsInstFlag:
    return this.numRowsInst
  let numRowsInstExpr = int(this.numRowsRaw + (if FasttrackerXmModule(this.root).preheader.versionNumber.value == 258: 1 else: 0))
  this.numRowsInst = numRowsInstExpr
  this.numRowsInstFlag = true
  return this.numRowsInst

proc fromFile*(_: typedesc[FasttrackerXmModule_Pattern_Header_HeaderMain], filename: string): FasttrackerXmModule_Pattern_Header_HeaderMain =
  FasttrackerXmModule_Pattern_Header_HeaderMain.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[FasttrackerXmModule_Preheader], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule): FasttrackerXmModule_Preheader =
  template this: untyped = result
  this = new(FasttrackerXmModule_Preheader)
  let root = if root == nil: cast[FasttrackerXmModule](this) else: cast[FasttrackerXmModule](root)
  this.io = io
  this.root = root
  this.parent = parent

  let signature0Expr = this.io.readBytes(int(17))
  this.signature0 = signature0Expr

  ##[
  Module name, padded with zeroes
  ]##
  let moduleNameExpr = encode(this.io.readBytes(int(20)).bytesTerminate(0, false), "UTF-8")
  this.moduleName = moduleNameExpr
  let signature1Expr = this.io.readBytes(int(1))
  this.signature1 = signature1Expr

  ##[
  Tracker name
  ]##
  let trackerNameExpr = encode(this.io.readBytes(int(20)).bytesTerminate(0, false), "UTF-8")
  this.trackerName = trackerNameExpr

  ##[
  Format versions below [0x01, 0x04] have a LOT of differences. Check this field!
  ]##
  let versionNumberExpr = FasttrackerXmModule_Preheader_Version.read(this.io, this.root, this)
  this.versionNumber = versionNumberExpr

  ##[
  Header size << Calculated FROM THIS OFFSET, not from the beginning of the file! >>
  ]##
  let headerSizeExpr = this.io.readU4le()
  this.headerSize = headerSizeExpr

proc fromFile*(_: typedesc[FasttrackerXmModule_Preheader], filename: string): FasttrackerXmModule_Preheader =
  FasttrackerXmModule_Preheader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[FasttrackerXmModule_Preheader_Version], io: KaitaiStream, root: KaitaiStruct, parent: FasttrackerXmModule_Preheader): FasttrackerXmModule_Preheader_Version =
  template this: untyped = result
  this = new(FasttrackerXmModule_Preheader_Version)
  let root = if root == nil: cast[FasttrackerXmModule](this) else: cast[FasttrackerXmModule](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  currently 0x04
  ]##
  let minorExpr = this.io.readU1()
  this.minor = minorExpr

  ##[
  currently 0x01
  ]##
  let majorExpr = this.io.readU1()
  this.major = majorExpr

proc value(this: FasttrackerXmModule_Preheader_Version): int = 
  if this.valueInstFlag:
    return this.valueInst
  let valueInstExpr = int(this.major shl 8 or this.minor)
  this.valueInst = valueInstExpr
  this.valueInstFlag = true
  return this.valueInst

proc fromFile*(_: typedesc[FasttrackerXmModule_Preheader_Version], filename: string): FasttrackerXmModule_Preheader_Version =
  FasttrackerXmModule_Preheader_Version.read(newKaitaiFileStream(filename), nil, nil)


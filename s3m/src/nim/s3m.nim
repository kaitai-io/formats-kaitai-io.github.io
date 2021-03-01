import kaitai_struct_nim_runtime
import options

type
  S3m* = ref object of KaitaiStruct
    `songName`*: seq[byte]
    `magic1`*: seq[byte]
    `fileType`*: uint8
    `reserved1`*: seq[byte]
    `numOrders`*: uint16
    `numInstruments`*: uint16
    `numPatterns`*: uint16
    `flags`*: uint16
    `version`*: uint16
    `samplesFormat`*: uint16
    `magic2`*: seq[byte]
    `globalVolume`*: uint8
    `initialSpeed`*: uint8
    `initialTempo`*: uint8
    `isStereo`*: bool
    `masterVolume`*: uint64
    `ultraClickRemoval`*: uint8
    `hasCustomPan`*: uint8
    `reserved2`*: seq[byte]
    `ofsSpecial`*: uint16
    `channels`*: seq[S3m_Channel]
    `orders`*: seq[byte]
    `instruments`*: seq[S3m_InstrumentPtr]
    `patterns`*: seq[S3m_PatternPtr]
    `channelPans`*: seq[S3m_ChannelPan]
    `parent`*: KaitaiStruct
  S3m_ChannelPan* = ref object of KaitaiStruct
    `reserved1`*: uint64
    `hasCustomPan`*: bool
    `reserved2`*: bool
    `pan`*: uint64
    `parent`*: S3m
  S3m_PatternCell* = ref object of KaitaiStruct
    `hasFx`*: bool
    `hasVolume`*: bool
    `hasNoteAndInstrument`*: bool
    `channelNum`*: uint64
    `note`*: uint8
    `instrument`*: uint8
    `volume`*: uint8
    `fxType`*: uint8
    `fxValue`*: uint8
    `parent`*: S3m_PatternCells
  S3m_PatternCells* = ref object of KaitaiStruct
    `cells`*: seq[S3m_PatternCell]
    `parent`*: S3m_Pattern
  S3m_Channel* = ref object of KaitaiStruct
    `isDisabled`*: bool
    `chType`*: uint64
    `parent`*: S3m
  S3m_SwappedU3* = ref object of KaitaiStruct
    `hi`*: uint8
    `lo`*: uint16
    `parent`*: S3m_Instrument_Sampled
    `valueInst`*: int
  S3m_Pattern* = ref object of KaitaiStruct
    `size`*: uint16
    `body`*: S3m_PatternCells
    `parent`*: S3m_PatternPtr
    `rawBody`*: seq[byte]
  S3m_PatternPtr* = ref object of KaitaiStruct
    `paraptr`*: uint16
    `parent`*: S3m
    `bodyInst`*: S3m_Pattern
  S3m_InstrumentPtr* = ref object of KaitaiStruct
    `paraptr`*: uint16
    `parent`*: S3m
    `bodyInst`*: S3m_Instrument
  S3m_Instrument* = ref object of KaitaiStruct
    `type`*: S3m_Instrument_InstTypes
    `filename`*: seq[byte]
    `body`*: KaitaiStruct
    `tuningHz`*: uint32
    `reserved2`*: seq[byte]
    `sampleName`*: seq[byte]
    `magic`*: seq[byte]
    `parent`*: S3m_InstrumentPtr
  S3m_Instrument_InstTypes* = enum
    sample = 1
    melodic = 2
    bass_drum = 3
    snare_drum = 4
    tom = 5
    cymbal = 6
    hihat = 7
  S3m_Instrument_Sampled* = ref object of KaitaiStruct
    `paraptrSample`*: S3m_SwappedU3
    `lenSample`*: uint32
    `loopBegin`*: uint32
    `loopEnd`*: uint32
    `defaultVolume`*: uint8
    `reserved1`*: uint8
    `isPacked`*: uint8
    `flags`*: uint8
    `parent`*: S3m_Instrument
    `sampleInst`*: seq[byte]
  S3m_Instrument_Adlib* = ref object of KaitaiStruct
    `reserved1`*: seq[byte]
    `unnamed1`*: seq[byte]
    `parent`*: S3m_Instrument

proc read*(_: typedesc[S3m], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): S3m
proc read*(_: typedesc[S3m_ChannelPan], io: KaitaiStream, root: KaitaiStruct, parent: S3m): S3m_ChannelPan
proc read*(_: typedesc[S3m_PatternCell], io: KaitaiStream, root: KaitaiStruct, parent: S3m_PatternCells): S3m_PatternCell
proc read*(_: typedesc[S3m_PatternCells], io: KaitaiStream, root: KaitaiStruct, parent: S3m_Pattern): S3m_PatternCells
proc read*(_: typedesc[S3m_Channel], io: KaitaiStream, root: KaitaiStruct, parent: S3m): S3m_Channel
proc read*(_: typedesc[S3m_SwappedU3], io: KaitaiStream, root: KaitaiStruct, parent: S3m_Instrument_Sampled): S3m_SwappedU3
proc read*(_: typedesc[S3m_Pattern], io: KaitaiStream, root: KaitaiStruct, parent: S3m_PatternPtr): S3m_Pattern
proc read*(_: typedesc[S3m_PatternPtr], io: KaitaiStream, root: KaitaiStruct, parent: S3m): S3m_PatternPtr
proc read*(_: typedesc[S3m_InstrumentPtr], io: KaitaiStream, root: KaitaiStruct, parent: S3m): S3m_InstrumentPtr
proc read*(_: typedesc[S3m_Instrument], io: KaitaiStream, root: KaitaiStruct, parent: S3m_InstrumentPtr): S3m_Instrument
proc read*(_: typedesc[S3m_Instrument_Sampled], io: KaitaiStream, root: KaitaiStruct, parent: S3m_Instrument): S3m_Instrument_Sampled
proc read*(_: typedesc[S3m_Instrument_Adlib], io: KaitaiStream, root: KaitaiStruct, parent: S3m_Instrument): S3m_Instrument_Adlib

proc value*(this: S3m_SwappedU3): int
proc body*(this: S3m_PatternPtr): S3m_Pattern
proc body*(this: S3m_InstrumentPtr): S3m_Instrument
proc sample*(this: S3m_Instrument_Sampled): seq[byte]


##[
Scream Tracker 3 module is a tracker music file format that, as all
tracker music, bundles both sound samples and instructions on which
notes to play. It originates from a Scream Tracker 3 music editor
(1994) by Future Crew, derived from original Scream Tracker 2 (.stm)
module format.

Instrument descriptions in S3M format allow to use either digital
samples or setup and control AdLib (OPL2) synth.

Music is organized in so called `patterns`. "Pattern" is a generally
a 64-row long table, which instructs which notes to play on which
time measure. "Patterns" are played one-by-one in a sequence
determined by `orders`, which is essentially an array of pattern IDs
- this way it's possible to reuse certain patterns more than once
for repetitive musical phrases.

@see <a href="http://hackipedia.org/browse.cgi/File%20formats/Music%20tracker/S3M%2c%20ScreamTracker%203/Scream%20Tracker%203.20%20by%20Future%20Crew.txt">Source</a>
]##
proc read*(_: typedesc[S3m], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): S3m =
  template this: untyped = result
  this = new(S3m)
  let root = if root == nil: cast[S3m](this) else: cast[S3m](root)
  this.io = io
  this.root = root
  this.parent = parent

  let songNameExpr = this.io.readBytes(int(28)).bytesTerminate(0, false)
  this.songName = songNameExpr
  let magic1Expr = this.io.readBytes(int(1))
  this.magic1 = magic1Expr
  let fileTypeExpr = this.io.readU1()
  this.fileType = fileTypeExpr
  let reserved1Expr = this.io.readBytes(int(2))
  this.reserved1 = reserved1Expr

  ##[
  Number of orders in a song
  ]##
  let numOrdersExpr = this.io.readU2le()
  this.numOrders = numOrdersExpr

  ##[
  Number of instruments in a song
  ]##
  let numInstrumentsExpr = this.io.readU2le()
  this.numInstruments = numInstrumentsExpr

  ##[
  Number of patterns in a song
  ]##
  let numPatternsExpr = this.io.readU2le()
  this.numPatterns = numPatternsExpr
  let flagsExpr = this.io.readU2le()
  this.flags = flagsExpr

  ##[
  Scream Tracker version that was used to save this file
  ]##
  let versionExpr = this.io.readU2le()
  this.version = versionExpr

  ##[
  1 = signed samples, 2 = unsigned samples
  ]##
  let samplesFormatExpr = this.io.readU2le()
  this.samplesFormat = samplesFormatExpr
  let magic2Expr = this.io.readBytes(int(4))
  this.magic2 = magic2Expr
  let globalVolumeExpr = this.io.readU1()
  this.globalVolume = globalVolumeExpr
  let initialSpeedExpr = this.io.readU1()
  this.initialSpeed = initialSpeedExpr
  let initialTempoExpr = this.io.readU1()
  this.initialTempo = initialTempoExpr
  let isStereoExpr = this.io.readBitsIntBe(1) != 0
  this.isStereo = isStereoExpr
  let masterVolumeExpr = this.io.readBitsIntBe(7)
  this.masterVolume = masterVolumeExpr
  alignToByte(this.io)
  let ultraClickRemovalExpr = this.io.readU1()
  this.ultraClickRemoval = ultraClickRemovalExpr
  let hasCustomPanExpr = this.io.readU1()
  this.hasCustomPan = hasCustomPanExpr
  let reserved2Expr = this.io.readBytes(int(8))
  this.reserved2 = reserved2Expr

  ##[
  Offset of special data, not used by Scream Tracker directly.
  ]##
  let ofsSpecialExpr = this.io.readU2le()
  this.ofsSpecial = ofsSpecialExpr
  for i in 0 ..< int(32):
    let it = S3m_Channel.read(this.io, this.root, this)
    this.channels.add(it)
  let ordersExpr = this.io.readBytes(int(this.numOrders))
  this.orders = ordersExpr
  for i in 0 ..< int(this.numInstruments):
    let it = S3m_InstrumentPtr.read(this.io, this.root, this)
    this.instruments.add(it)
  for i in 0 ..< int(this.numPatterns):
    let it = S3m_PatternPtr.read(this.io, this.root, this)
    this.patterns.add(it)
  if this.hasCustomPan == 252:
    for i in 0 ..< int(32):
      let it = S3m_ChannelPan.read(this.io, this.root, this)
      this.channelPans.add(it)

proc fromFile*(_: typedesc[S3m], filename: string): S3m =
  S3m.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[S3m_ChannelPan], io: KaitaiStream, root: KaitaiStruct, parent: S3m): S3m_ChannelPan =
  template this: untyped = result
  this = new(S3m_ChannelPan)
  let root = if root == nil: cast[S3m](this) else: cast[S3m](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reserved1Expr = this.io.readBitsIntBe(2)
  this.reserved1 = reserved1Expr

  ##[
  If true, then use a custom pan setting provided in the `pan`
field. If false, the channel would use the default setting
(0x7 for mono, 0x3 or 0xc for stereo).

  ]##
  let hasCustomPanExpr = this.io.readBitsIntBe(1) != 0
  this.hasCustomPan = hasCustomPanExpr
  let reserved2Expr = this.io.readBitsIntBe(1) != 0
  this.reserved2 = reserved2Expr
  let panExpr = this.io.readBitsIntBe(4)
  this.pan = panExpr

proc fromFile*(_: typedesc[S3m_ChannelPan], filename: string): S3m_ChannelPan =
  S3m_ChannelPan.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[S3m_PatternCell], io: KaitaiStream, root: KaitaiStruct, parent: S3m_PatternCells): S3m_PatternCell =
  template this: untyped = result
  this = new(S3m_PatternCell)
  let root = if root == nil: cast[S3m](this) else: cast[S3m](root)
  this.io = io
  this.root = root
  this.parent = parent

  let hasFxExpr = this.io.readBitsIntBe(1) != 0
  this.hasFx = hasFxExpr
  let hasVolumeExpr = this.io.readBitsIntBe(1) != 0
  this.hasVolume = hasVolumeExpr
  let hasNoteAndInstrumentExpr = this.io.readBitsIntBe(1) != 0
  this.hasNoteAndInstrument = hasNoteAndInstrumentExpr
  let channelNumExpr = this.io.readBitsIntBe(5)
  this.channelNum = channelNumExpr
  alignToByte(this.io)
  if this.hasNoteAndInstrument:
    let noteExpr = this.io.readU1()
    this.note = noteExpr
  if this.hasNoteAndInstrument:
    let instrumentExpr = this.io.readU1()
    this.instrument = instrumentExpr
  if this.hasVolume:
    let volumeExpr = this.io.readU1()
    this.volume = volumeExpr
  if this.hasFx:
    let fxTypeExpr = this.io.readU1()
    this.fxType = fxTypeExpr
  if this.hasFx:
    let fxValueExpr = this.io.readU1()
    this.fxValue = fxValueExpr

proc fromFile*(_: typedesc[S3m_PatternCell], filename: string): S3m_PatternCell =
  S3m_PatternCell.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[S3m_PatternCells], io: KaitaiStream, root: KaitaiStruct, parent: S3m_Pattern): S3m_PatternCells =
  template this: untyped = result
  this = new(S3m_PatternCells)
  let root = if root == nil: cast[S3m](this) else: cast[S3m](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = S3m_PatternCell.read(this.io, this.root, this)
      this.cells.add(it)
      inc i

proc fromFile*(_: typedesc[S3m_PatternCells], filename: string): S3m_PatternCells =
  S3m_PatternCells.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[S3m_Channel], io: KaitaiStream, root: KaitaiStruct, parent: S3m): S3m_Channel =
  template this: untyped = result
  this = new(S3m_Channel)
  let root = if root == nil: cast[S3m](this) else: cast[S3m](root)
  this.io = io
  this.root = root
  this.parent = parent

  let isDisabledExpr = this.io.readBitsIntBe(1) != 0
  this.isDisabled = isDisabledExpr

  ##[
  Channel type (0..7 = left sample channels, 8..15 = right sample channels, 16..31 = AdLib synth channels)
  ]##
  let chTypeExpr = this.io.readBitsIntBe(7)
  this.chType = chTypeExpr

proc fromFile*(_: typedesc[S3m_Channel], filename: string): S3m_Channel =
  S3m_Channel.read(newKaitaiFileStream(filename), nil, nil)


##[
Custom 3-byte integer, stored in mixed endian manner.
]##
proc read*(_: typedesc[S3m_SwappedU3], io: KaitaiStream, root: KaitaiStruct, parent: S3m_Instrument_Sampled): S3m_SwappedU3 =
  template this: untyped = result
  this = new(S3m_SwappedU3)
  let root = if root == nil: cast[S3m](this) else: cast[S3m](root)
  this.io = io
  this.root = root
  this.parent = parent

  let hiExpr = this.io.readU1()
  this.hi = hiExpr
  let loExpr = this.io.readU2le()
  this.lo = loExpr

proc value(this: S3m_SwappedU3): int = 
  if this.valueInst != nil:
    return this.valueInst
  let valueInstExpr = int((this.lo or (this.hi shl 16)))
  this.valueInst = valueInstExpr
  if this.valueInst != nil:
    return this.valueInst

proc fromFile*(_: typedesc[S3m_SwappedU3], filename: string): S3m_SwappedU3 =
  S3m_SwappedU3.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[S3m_Pattern], io: KaitaiStream, root: KaitaiStruct, parent: S3m_PatternPtr): S3m_Pattern =
  template this: untyped = result
  this = new(S3m_Pattern)
  let root = if root == nil: cast[S3m](this) else: cast[S3m](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sizeExpr = this.io.readU2le()
  this.size = sizeExpr
  let rawBodyExpr = this.io.readBytes(int((this.size - 2)))
  this.rawBody = rawBodyExpr
  let rawBodyIo = newKaitaiStream(rawBodyExpr)
  let bodyExpr = S3m_PatternCells.read(rawBodyIo, this.root, this)
  this.body = bodyExpr

proc fromFile*(_: typedesc[S3m_Pattern], filename: string): S3m_Pattern =
  S3m_Pattern.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[S3m_PatternPtr], io: KaitaiStream, root: KaitaiStruct, parent: S3m): S3m_PatternPtr =
  template this: untyped = result
  this = new(S3m_PatternPtr)
  let root = if root == nil: cast[S3m](this) else: cast[S3m](root)
  this.io = io
  this.root = root
  this.parent = parent

  let paraptrExpr = this.io.readU2le()
  this.paraptr = paraptrExpr

proc body(this: S3m_PatternPtr): S3m_Pattern = 
  if this.bodyInst != nil:
    return this.bodyInst
  let pos = this.io.pos()
  this.io.seek(int((this.paraptr * 16)))
  let bodyInstExpr = S3m_Pattern.read(this.io, this.root, this)
  this.bodyInst = bodyInstExpr
  this.io.seek(pos)
  if this.bodyInst != nil:
    return this.bodyInst

proc fromFile*(_: typedesc[S3m_PatternPtr], filename: string): S3m_PatternPtr =
  S3m_PatternPtr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[S3m_InstrumentPtr], io: KaitaiStream, root: KaitaiStruct, parent: S3m): S3m_InstrumentPtr =
  template this: untyped = result
  this = new(S3m_InstrumentPtr)
  let root = if root == nil: cast[S3m](this) else: cast[S3m](root)
  this.io = io
  this.root = root
  this.parent = parent

  let paraptrExpr = this.io.readU2le()
  this.paraptr = paraptrExpr

proc body(this: S3m_InstrumentPtr): S3m_Instrument = 
  if this.bodyInst != nil:
    return this.bodyInst
  let pos = this.io.pos()
  this.io.seek(int((this.paraptr * 16)))
  let bodyInstExpr = S3m_Instrument.read(this.io, this.root, this)
  this.bodyInst = bodyInstExpr
  this.io.seek(pos)
  if this.bodyInst != nil:
    return this.bodyInst

proc fromFile*(_: typedesc[S3m_InstrumentPtr], filename: string): S3m_InstrumentPtr =
  S3m_InstrumentPtr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[S3m_Instrument], io: KaitaiStream, root: KaitaiStruct, parent: S3m_InstrumentPtr): S3m_Instrument =
  template this: untyped = result
  this = new(S3m_Instrument)
  let root = if root == nil: cast[S3m](this) else: cast[S3m](root)
  this.io = io
  this.root = root
  this.parent = parent

  let typeExpr = S3m_Instrument_InstTypes(this.io.readU1())
  this.type = typeExpr
  let filenameExpr = this.io.readBytes(int(12)).bytesTerminate(0, false)
  this.filename = filenameExpr
  block:
    let on = this.type
    if on == s3m.sample:
      let bodyExpr = S3m_Instrument_Sampled.read(this.io, this.root, this)
      this.body = bodyExpr
    else:
      let bodyExpr = S3m_Instrument_Adlib.read(this.io, this.root, this)
      this.body = bodyExpr
  let tuningHzExpr = this.io.readU4le()
  this.tuningHz = tuningHzExpr
  let reserved2Expr = this.io.readBytes(int(12))
  this.reserved2 = reserved2Expr
  let sampleNameExpr = this.io.readBytes(int(28)).bytesTerminate(0, false)
  this.sampleName = sampleNameExpr
  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr

proc fromFile*(_: typedesc[S3m_Instrument], filename: string): S3m_Instrument =
  S3m_Instrument.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[S3m_Instrument_Sampled], io: KaitaiStream, root: KaitaiStruct, parent: S3m_Instrument): S3m_Instrument_Sampled =
  template this: untyped = result
  this = new(S3m_Instrument_Sampled)
  let root = if root == nil: cast[S3m](this) else: cast[S3m](root)
  this.io = io
  this.root = root
  this.parent = parent

  let paraptrSampleExpr = S3m_SwappedU3.read(this.io, this.root, this)
  this.paraptrSample = paraptrSampleExpr
  let lenSampleExpr = this.io.readU4le()
  this.lenSample = lenSampleExpr
  let loopBeginExpr = this.io.readU4le()
  this.loopBegin = loopBeginExpr
  let loopEndExpr = this.io.readU4le()
  this.loopEnd = loopEndExpr

  ##[
  Default volume
  ]##
  let defaultVolumeExpr = this.io.readU1()
  this.defaultVolume = defaultVolumeExpr
  let reserved1Expr = this.io.readU1()
  this.reserved1 = reserved1Expr

  ##[
  0 = unpacked, 1 = DP30ADPCM packing
  ]##
  let isPackedExpr = this.io.readU1()
  this.isPacked = isPackedExpr
  let flagsExpr = this.io.readU1()
  this.flags = flagsExpr

proc sample(this: S3m_Instrument_Sampled): seq[byte] = 
  if this.sampleInst.len != 0:
    return this.sampleInst
  let pos = this.io.pos()
  this.io.seek(int((this.paraptrSample.value * 16)))
  let sampleInstExpr = this.io.readBytes(int(this.lenSample))
  this.sampleInst = sampleInstExpr
  this.io.seek(pos)
  if this.sampleInst.len != 0:
    return this.sampleInst

proc fromFile*(_: typedesc[S3m_Instrument_Sampled], filename: string): S3m_Instrument_Sampled =
  S3m_Instrument_Sampled.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[S3m_Instrument_Adlib], io: KaitaiStream, root: KaitaiStruct, parent: S3m_Instrument): S3m_Instrument_Adlib =
  template this: untyped = result
  this = new(S3m_Instrument_Adlib)
  let root = if root == nil: cast[S3m](this) else: cast[S3m](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reserved1Expr = this.io.readBytes(int(3))
  this.reserved1 = reserved1Expr
  let unnamed1Expr = this.io.readBytes(int(16))
  this.unnamed1 = unnamed1Expr

proc fromFile*(_: typedesc[S3m_Instrument_Adlib], filename: string): S3m_Instrument_Adlib =
  S3m_Instrument_Adlib.read(newKaitaiFileStream(filename), nil, nil)


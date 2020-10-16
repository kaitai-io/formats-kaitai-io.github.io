import kaitai_struct_nim_runtime
import options

type
  CreativeVoiceFile* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `headerSize`*: uint16
    `version`*: uint16
    `checksum`*: uint16
    `blocks`*: seq[CreativeVoiceFile_Block]
    `parent`*: KaitaiStruct
  CreativeVoiceFile_BlockTypes* = enum
    terminator = 0
    sound_data = 1
    sound_data_cont = 2
    silence = 3
    marker = 4
    text = 5
    repeat_start = 6
    repeat_end = 7
    extra_info = 8
    sound_data_new = 9
  CreativeVoiceFile_Codecs* = enum
    pcm_8bit_unsigned = 0
    adpcm_4bit = 1
    adpcm_2_6bit = 2
    adpcm_2_bit = 3
    pcm_16bit_signed = 4
    alaw = 6
    ulaw = 7
    adpcm_4_to_16bit = 512
  CreativeVoiceFile_BlockMarker* = ref object of KaitaiStruct
    `markerId`*: uint16
    `parent`*: CreativeVoiceFile_Block
  CreativeVoiceFile_BlockSilence* = ref object of KaitaiStruct
    `durationSamples`*: uint16
    `freqDiv`*: uint8
    `parent`*: CreativeVoiceFile_Block
    `sampleRateInst`*: float64
    `durationSecInst`*: float64
  CreativeVoiceFile_BlockSoundDataNew* = ref object of KaitaiStruct
    `sampleRate`*: uint32
    `bitsPerSample`*: uint8
    `numChannels`*: uint8
    `codec`*: CreativeVoiceFile_Codecs
    `reserved`*: seq[byte]
    `wave`*: seq[byte]
    `parent`*: CreativeVoiceFile_Block
  CreativeVoiceFile_Block* = ref object of KaitaiStruct
    `blockType`*: CreativeVoiceFile_BlockTypes
    `bodySize1`*: uint16
    `bodySize2`*: uint8
    `body`*: KaitaiStruct
    `parent`*: CreativeVoiceFile
    `rawBody`*: seq[byte]
    `bodySizeInst`*: int
  CreativeVoiceFile_BlockRepeatStart* = ref object of KaitaiStruct
    `repeatCount1`*: uint16
    `parent`*: CreativeVoiceFile_Block
  CreativeVoiceFile_BlockSoundData* = ref object of KaitaiStruct
    `freqDiv`*: uint8
    `codec`*: CreativeVoiceFile_Codecs
    `wave`*: seq[byte]
    `parent`*: CreativeVoiceFile_Block
    `sampleRateInst`*: float64
  CreativeVoiceFile_BlockExtraInfo* = ref object of KaitaiStruct
    `freqDiv`*: uint16
    `codec`*: CreativeVoiceFile_Codecs
    `numChannels1`*: uint8
    `parent`*: CreativeVoiceFile_Block
    `numChannelsInst`*: int
    `sampleRateInst`*: float64

proc read*(_: typedesc[CreativeVoiceFile], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): CreativeVoiceFile
proc read*(_: typedesc[CreativeVoiceFile_BlockMarker], io: KaitaiStream, root: KaitaiStruct, parent: CreativeVoiceFile_Block): CreativeVoiceFile_BlockMarker
proc read*(_: typedesc[CreativeVoiceFile_BlockSilence], io: KaitaiStream, root: KaitaiStruct, parent: CreativeVoiceFile_Block): CreativeVoiceFile_BlockSilence
proc read*(_: typedesc[CreativeVoiceFile_BlockSoundDataNew], io: KaitaiStream, root: KaitaiStruct, parent: CreativeVoiceFile_Block): CreativeVoiceFile_BlockSoundDataNew
proc read*(_: typedesc[CreativeVoiceFile_Block], io: KaitaiStream, root: KaitaiStruct, parent: CreativeVoiceFile): CreativeVoiceFile_Block
proc read*(_: typedesc[CreativeVoiceFile_BlockRepeatStart], io: KaitaiStream, root: KaitaiStruct, parent: CreativeVoiceFile_Block): CreativeVoiceFile_BlockRepeatStart
proc read*(_: typedesc[CreativeVoiceFile_BlockSoundData], io: KaitaiStream, root: KaitaiStruct, parent: CreativeVoiceFile_Block): CreativeVoiceFile_BlockSoundData
proc read*(_: typedesc[CreativeVoiceFile_BlockExtraInfo], io: KaitaiStream, root: KaitaiStruct, parent: CreativeVoiceFile_Block): CreativeVoiceFile_BlockExtraInfo

proc sampleRate*(this: CreativeVoiceFile_BlockSilence): float64
proc durationSec*(this: CreativeVoiceFile_BlockSilence): float64
proc bodySize*(this: CreativeVoiceFile_Block): int
proc sampleRate*(this: CreativeVoiceFile_BlockSoundData): float64
proc numChannels*(this: CreativeVoiceFile_BlockExtraInfo): int
proc sampleRate*(this: CreativeVoiceFile_BlockExtraInfo): float64


##[
Creative Voice File is a container file format for digital audio
wave data. Initial revisions were able to support only unsigned
8-bit PCM and ADPCM data, later versions were revised to add support
for 16-bit PCM and a-law / u-law formats.

This format was actively used in 1990s, around the advent of
Creative's sound cards (Sound Blaster family). It was a popular
choice for a digital sound container in lots of games and multimedia
software due to simplicity and availability of Creative's recording
/ editing tools.

@see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice">Source</a>
]##
proc read*(_: typedesc[CreativeVoiceFile], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): CreativeVoiceFile =
  template this: untyped = result
  this = new(CreativeVoiceFile)
  let root = if root == nil: cast[CreativeVoiceFile](this) else: cast[CreativeVoiceFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(20))
  this.magic = magicExpr

  ##[
  Total size of this main header (usually 0x001A)
  ]##
  let headerSizeExpr = this.io.readU2le()
  this.headerSize = headerSizeExpr
  let versionExpr = this.io.readU2le()
  this.version = versionExpr

  ##[
  Checksum: this must be equal to ~version + 0x1234
  ]##
  let checksumExpr = this.io.readU2le()
  this.checksum = checksumExpr

  ##[
  Series of blocks that contain the actual audio data
  ]##
  block:
    var i: int
    while not this.io.isEof:
      let it = CreativeVoiceFile_Block.read(this.io, this.root, this)
      this.blocks.add(it)
      inc i

proc fromFile*(_: typedesc[CreativeVoiceFile], filename: string): CreativeVoiceFile =
  CreativeVoiceFile.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x04:_Marker">Source</a>
]##
proc read*(_: typedesc[CreativeVoiceFile_BlockMarker], io: KaitaiStream, root: KaitaiStruct, parent: CreativeVoiceFile_Block): CreativeVoiceFile_BlockMarker =
  template this: untyped = result
  this = new(CreativeVoiceFile_BlockMarker)
  let root = if root == nil: cast[CreativeVoiceFile](this) else: cast[CreativeVoiceFile](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Marker ID
  ]##
  let markerIdExpr = this.io.readU2le()
  this.markerId = markerIdExpr

proc fromFile*(_: typedesc[CreativeVoiceFile_BlockMarker], filename: string): CreativeVoiceFile_BlockMarker =
  CreativeVoiceFile_BlockMarker.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x03:_Silence">Source</a>
]##
proc read*(_: typedesc[CreativeVoiceFile_BlockSilence], io: KaitaiStream, root: KaitaiStruct, parent: CreativeVoiceFile_Block): CreativeVoiceFile_BlockSilence =
  template this: untyped = result
  this = new(CreativeVoiceFile_BlockSilence)
  let root = if root == nil: cast[CreativeVoiceFile](this) else: cast[CreativeVoiceFile](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Duration of silence, in samples
  ]##
  let durationSamplesExpr = this.io.readU2le()
  this.durationSamples = durationSamplesExpr

  ##[
  Frequency divisor, used to determine sample rate
  ]##
  let freqDivExpr = this.io.readU1()
  this.freqDiv = freqDivExpr

proc sampleRate(this: CreativeVoiceFile_BlockSilence): float64 = 
  if this.sampleRateInst != nil:
    return this.sampleRateInst
  let sampleRateInstExpr = float64((1000000.0 div (256 - this.freqDiv)))
  this.sampleRateInst = sampleRateInstExpr
  if this.sampleRateInst != nil:
    return this.sampleRateInst

proc durationSec(this: CreativeVoiceFile_BlockSilence): float64 = 

  ##[
  Duration of silence, in seconds
  ]##
  if this.durationSecInst != nil:
    return this.durationSecInst
  let durationSecInstExpr = float64((this.durationSamples div this.sampleRate))
  this.durationSecInst = durationSecInstExpr
  if this.durationSecInst != nil:
    return this.durationSecInst

proc fromFile*(_: typedesc[CreativeVoiceFile_BlockSilence], filename: string): CreativeVoiceFile_BlockSilence =
  CreativeVoiceFile_BlockSilence.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x09:_Sound_data_.28New_format.29">Source</a>
]##
proc read*(_: typedesc[CreativeVoiceFile_BlockSoundDataNew], io: KaitaiStream, root: KaitaiStruct, parent: CreativeVoiceFile_Block): CreativeVoiceFile_BlockSoundDataNew =
  template this: untyped = result
  this = new(CreativeVoiceFile_BlockSoundDataNew)
  let root = if root == nil: cast[CreativeVoiceFile](this) else: cast[CreativeVoiceFile](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sampleRateExpr = this.io.readU4le()
  this.sampleRate = sampleRateExpr
  let bitsPerSampleExpr = this.io.readU1()
  this.bitsPerSample = bitsPerSampleExpr
  let numChannelsExpr = this.io.readU1()
  this.numChannels = numChannelsExpr
  let codecExpr = CreativeVoiceFile_Codecs(this.io.readU2le())
  this.codec = codecExpr
  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  let waveExpr = this.io.readBytesFull()
  this.wave = waveExpr

proc fromFile*(_: typedesc[CreativeVoiceFile_BlockSoundDataNew], filename: string): CreativeVoiceFile_BlockSoundDataNew =
  CreativeVoiceFile_BlockSoundDataNew.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[CreativeVoiceFile_Block], io: KaitaiStream, root: KaitaiStruct, parent: CreativeVoiceFile): CreativeVoiceFile_Block =
  template this: untyped = result
  this = new(CreativeVoiceFile_Block)
  let root = if root == nil: cast[CreativeVoiceFile](this) else: cast[CreativeVoiceFile](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Byte that determines type of block content
  ]##
  let blockTypeExpr = CreativeVoiceFile_BlockTypes(this.io.readU1())
  this.blockType = blockTypeExpr
  if this.blockType != creative_voice_file.terminator:
    let bodySize1Expr = this.io.readU2le()
    this.bodySize1 = bodySize1Expr
  if this.blockType != creative_voice_file.terminator:
    let bodySize2Expr = this.io.readU1()
    this.bodySize2 = bodySize2Expr

  ##[
  Block body, type depends on block type byte
  ]##
  if this.blockType != creative_voice_file.terminator:
    block:
      let on = this.blockType
      if on == creative_voice_file.sound_data_new:
        let rawBodyExpr = this.io.readBytes(int(this.bodySize))
        this.rawBody = rawBodyExpr
        let rawBodyIo = newKaitaiStream(rawBodyExpr)
        let bodyExpr = CreativeVoiceFile_BlockSoundDataNew.read(rawBodyIo, this.root, this)
        this.body = bodyExpr
      elif on == creative_voice_file.repeat_start:
        let rawBodyExpr = this.io.readBytes(int(this.bodySize))
        this.rawBody = rawBodyExpr
        let rawBodyIo = newKaitaiStream(rawBodyExpr)
        let bodyExpr = CreativeVoiceFile_BlockRepeatStart.read(rawBodyIo, this.root, this)
        this.body = bodyExpr
      elif on == creative_voice_file.marker:
        let rawBodyExpr = this.io.readBytes(int(this.bodySize))
        this.rawBody = rawBodyExpr
        let rawBodyIo = newKaitaiStream(rawBodyExpr)
        let bodyExpr = CreativeVoiceFile_BlockMarker.read(rawBodyIo, this.root, this)
        this.body = bodyExpr
      elif on == creative_voice_file.sound_data:
        let rawBodyExpr = this.io.readBytes(int(this.bodySize))
        this.rawBody = rawBodyExpr
        let rawBodyIo = newKaitaiStream(rawBodyExpr)
        let bodyExpr = CreativeVoiceFile_BlockSoundData.read(rawBodyIo, this.root, this)
        this.body = bodyExpr
      elif on == creative_voice_file.extra_info:
        let rawBodyExpr = this.io.readBytes(int(this.bodySize))
        this.rawBody = rawBodyExpr
        let rawBodyIo = newKaitaiStream(rawBodyExpr)
        let bodyExpr = CreativeVoiceFile_BlockExtraInfo.read(rawBodyIo, this.root, this)
        this.body = bodyExpr
      elif on == creative_voice_file.silence:
        let rawBodyExpr = this.io.readBytes(int(this.bodySize))
        this.rawBody = rawBodyExpr
        let rawBodyIo = newKaitaiStream(rawBodyExpr)
        let bodyExpr = CreativeVoiceFile_BlockSilence.read(rawBodyIo, this.root, this)
        this.body = bodyExpr
      else:
        let bodyExpr = this.io.readBytes(int(this.bodySize))
        this.body = bodyExpr

proc bodySize(this: CreativeVoiceFile_Block): int = 

  ##[
  body_size is a 24-bit little-endian integer, so we're
emulating that by adding two standard-sized integers
(body_size1 and body_size2).

  ]##
  if this.bodySizeInst != nil:
    return this.bodySizeInst
  if this.blockType != creative_voice_file.terminator:
    let bodySizeInstExpr = int((this.bodySize1 + (this.bodySize2 shl 16)))
    this.bodySizeInst = bodySizeInstExpr
  if this.bodySizeInst != nil:
    return this.bodySizeInst

proc fromFile*(_: typedesc[CreativeVoiceFile_Block], filename: string): CreativeVoiceFile_Block =
  CreativeVoiceFile_Block.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x06:_Repeat_start">Source</a>
]##
proc read*(_: typedesc[CreativeVoiceFile_BlockRepeatStart], io: KaitaiStream, root: KaitaiStruct, parent: CreativeVoiceFile_Block): CreativeVoiceFile_BlockRepeatStart =
  template this: untyped = result
  this = new(CreativeVoiceFile_BlockRepeatStart)
  let root = if root == nil: cast[CreativeVoiceFile](this) else: cast[CreativeVoiceFile](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Number of repetitions minus 1; 0xffff means infinite repetitions
  ]##
  let repeatCount1Expr = this.io.readU2le()
  this.repeatCount1 = repeatCount1Expr

proc fromFile*(_: typedesc[CreativeVoiceFile_BlockRepeatStart], filename: string): CreativeVoiceFile_BlockRepeatStart =
  CreativeVoiceFile_BlockRepeatStart.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x01:_Sound_data">Source</a>
]##
proc read*(_: typedesc[CreativeVoiceFile_BlockSoundData], io: KaitaiStream, root: KaitaiStruct, parent: CreativeVoiceFile_Block): CreativeVoiceFile_BlockSoundData =
  template this: untyped = result
  this = new(CreativeVoiceFile_BlockSoundData)
  let root = if root == nil: cast[CreativeVoiceFile](this) else: cast[CreativeVoiceFile](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Frequency divisor, used to determine sample rate
  ]##
  let freqDivExpr = this.io.readU1()
  this.freqDiv = freqDivExpr
  let codecExpr = CreativeVoiceFile_Codecs(this.io.readU1())
  this.codec = codecExpr
  let waveExpr = this.io.readBytesFull()
  this.wave = waveExpr

proc sampleRate(this: CreativeVoiceFile_BlockSoundData): float64 = 
  if this.sampleRateInst != nil:
    return this.sampleRateInst
  let sampleRateInstExpr = float64((1000000.0 div (256 - this.freqDiv)))
  this.sampleRateInst = sampleRateInstExpr
  if this.sampleRateInst != nil:
    return this.sampleRateInst

proc fromFile*(_: typedesc[CreativeVoiceFile_BlockSoundData], filename: string): CreativeVoiceFile_BlockSoundData =
  CreativeVoiceFile_BlockSoundData.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x08:_Extra_info">Source</a>
]##
proc read*(_: typedesc[CreativeVoiceFile_BlockExtraInfo], io: KaitaiStream, root: KaitaiStruct, parent: CreativeVoiceFile_Block): CreativeVoiceFile_BlockExtraInfo =
  template this: untyped = result
  this = new(CreativeVoiceFile_BlockExtraInfo)
  let root = if root == nil: cast[CreativeVoiceFile](this) else: cast[CreativeVoiceFile](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Frequency divisor
  ]##
  let freqDivExpr = this.io.readU2le()
  this.freqDiv = freqDivExpr
  let codecExpr = CreativeVoiceFile_Codecs(this.io.readU1())
  this.codec = codecExpr

  ##[
  Number of channels minus 1 (0 = mono, 1 = stereo)
  ]##
  let numChannels1Expr = this.io.readU1()
  this.numChannels1 = numChannels1Expr

proc numChannels(this: CreativeVoiceFile_BlockExtraInfo): int = 

  ##[
  Number of channels (1 = mono, 2 = stereo)
  ]##
  if this.numChannelsInst != nil:
    return this.numChannelsInst
  let numChannelsInstExpr = int((this.numChannels1 + 1))
  this.numChannelsInst = numChannelsInstExpr
  if this.numChannelsInst != nil:
    return this.numChannelsInst

proc sampleRate(this: CreativeVoiceFile_BlockExtraInfo): float64 = 
  if this.sampleRateInst != nil:
    return this.sampleRateInst
  let sampleRateInstExpr = float64((256000000.0 div (this.numChannels * (65536 - this.freqDiv))))
  this.sampleRateInst = sampleRateInstExpr
  if this.sampleRateInst != nil:
    return this.sampleRateInst

proc fromFile*(_: typedesc[CreativeVoiceFile_BlockExtraInfo], filename: string): CreativeVoiceFile_BlockExtraInfo =
  CreativeVoiceFile_BlockExtraInfo.read(newKaitaiFileStream(filename), nil, nil)


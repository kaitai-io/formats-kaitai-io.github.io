import kaitai_struct_nim_runtime
import options

type
  MacOsResourceSnd* = ref object of KaitaiStruct
    `format`*: uint16
    `numDataFormats`*: uint16
    `dataFormats`*: seq[MacOsResourceSnd_DataFormat]
    `referenceCount`*: uint16
    `numSoundCommands`*: uint16
    `soundCommands`*: seq[MacOsResourceSnd_SoundCommand]
    `parent`*: KaitaiStruct
    `midiNoteToFrequencyInst`: seq[float64]
    `midiNoteToFrequencyInstFlag`: bool
  MacOsResourceSnd_CmdType* = enum
    null_cmd = 0
    quiet_cmd = 3
    flush_cmd = 4
    re_init_cmd = 5
    wait_cmd = 10
    pause_cmd = 11
    resume_cmd = 12
    call_back_cmd = 13
    sync_cmd = 14
    empty_cmd = 15
    available_cmd = 24
    version_cmd = 25
    total_load_cmd = 26
    load_cmd = 27
    freq_duration_cmd = 40
    rest_cmd = 41
    freq_cmd = 42
    amp_cmd = 43
    timbre_cmd = 44
    get_amp_cmd = 45
    volume_cmd = 46
    get_volume_cmd = 47
    wave_table_cmd = 60
    phase_cmd = 61
    sound_cmd = 80
    buffer_cmd = 81
    rate_cmd = 82
    get_rate_cmd = 85
  MacOsResourceSnd_CompressionTypeEnum* = enum
    variable_compression = -2
    fixed_compression = -1
    not_compressed = 0
    two_to_one = 1
    eight_to_three = 2
    three_to_one = 3
    six_to_one = 4
  MacOsResourceSnd_DataType* = enum
    square_wave_synth = 1
    wave_table_synth = 3
    sampled_synth = 5
  MacOsResourceSnd_InitOption* = enum
    chan_left = 2
    chan_right = 3
    no_interp = 4
    no_drop = 8
    mono = 128
    stereo = 192
    mace3 = 768
    mace6 = 1024
  MacOsResourceSnd_SoundHeaderType* = enum
    standard = 0
    compressed = 254
    extended = 255
  MacOsResourceSnd_WaveInitOption* = enum
    channel0 = 4
    channel1 = 5
    channel2 = 6
    channel3 = 7
  MacOsResourceSnd_Compressed* = ref object of KaitaiStruct
    `format`*: string
    `reserved`*: seq[byte]
    `stateVarsPtr`*: uint32
    `leftOverSamplesPtr`*: uint32
    `compressionId`*: int16
    `packetSize`*: uint16
    `synthesizerId`*: uint16
    `parent`*: MacOsResourceSnd_ExtendedOrCompressed
    `compressionTypeInst`: MacOsResourceSnd_CompressionTypeEnum
    `compressionTypeInstFlag`: bool
  MacOsResourceSnd_DataFormat* = ref object of KaitaiStruct
    `id`*: MacOsResourceSnd_DataType
    `options`*: uint32
    `parent`*: MacOsResourceSnd
    `compInitInst`: MacOsResourceSnd_InitOption
    `compInitInstFlag`: bool
    `initCompMaskInst`: int
    `initCompMaskInstFlag`: bool
    `initPanMaskInst`: int8
    `initPanMaskInstFlag`: bool
    `initStereoMaskInst`: uint8
    `initStereoMaskInstFlag`: bool
    `panInitInst`: MacOsResourceSnd_InitOption
    `panInitInstFlag`: bool
    `stereoInitInst`: MacOsResourceSnd_InitOption
    `stereoInitInstFlag`: bool
    `waveInitInst`: MacOsResourceSnd_WaveInitOption
    `waveInitInstFlag`: bool
    `waveInitChannelMaskInst`: int8
    `waveInitChannelMaskInstFlag`: bool
  MacOsResourceSnd_Extended* = ref object of KaitaiStruct
    `instrumentChunkPtr`*: uint32
    `aesRecordingPtr`*: uint32
    `parent`*: MacOsResourceSnd_ExtendedOrCompressed
  MacOsResourceSnd_ExtendedOrCompressed* = ref object of KaitaiStruct
    `numFrames`*: uint32
    `aiffSampleRate`*: seq[byte]
    `markerChunk`*: uint32
    `extended`*: MacOsResourceSnd_Extended
    `compressed`*: MacOsResourceSnd_Compressed
    `bitsPerSample`*: uint16
    `reserved`*: seq[byte]
    `parent`*: MacOsResourceSnd_SoundHeader
  MacOsResourceSnd_SoundCommand* = ref object of KaitaiStruct
    `isDataOffset`*: bool
    `cmd`*: MacOsResourceSnd_CmdType
    `param1`*: uint16
    `param2`*: uint32
    `parent`*: MacOsResourceSnd
    `soundHeaderInst`: MacOsResourceSnd_SoundHeader
    `soundHeaderInstFlag`: bool
  MacOsResourceSnd_SoundHeader* = ref object of KaitaiStruct
    `unnamed0`*: seq[byte]
    `samplePtr`*: uint32
    `numSamples`*: uint32
    `numChannels`*: uint32
    `sampleRate`*: MacOsResourceSnd_UnsignedFixedPoint
    `loopStart`*: uint32
    `loopEnd`*: uint32
    `encode`*: MacOsResourceSnd_SoundHeaderType
    `midiNote`*: uint8
    `extendedOrCompressed`*: MacOsResourceSnd_ExtendedOrCompressed
    `sampleArea`*: seq[byte]
    `parent`*: MacOsResourceSnd_SoundCommand
    `baseFreqeuncyInst`: float64
    `baseFreqeuncyInstFlag`: bool
    `soundHeaderTypeInst`: MacOsResourceSnd_SoundHeaderType
    `soundHeaderTypeInstFlag`: bool
    `startOfsInst`: int
    `startOfsInstFlag`: bool
  MacOsResourceSnd_UnsignedFixedPoint* = ref object of KaitaiStruct
    `integerPart`*: uint16
    `fractionPart`*: uint16
    `parent`*: MacOsResourceSnd_SoundHeader
    `valueInst`: float64
    `valueInstFlag`: bool

proc read*(_: typedesc[MacOsResourceSnd], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MacOsResourceSnd
proc read*(_: typedesc[MacOsResourceSnd_Compressed], io: KaitaiStream, root: KaitaiStruct, parent: MacOsResourceSnd_ExtendedOrCompressed): MacOsResourceSnd_Compressed
proc read*(_: typedesc[MacOsResourceSnd_DataFormat], io: KaitaiStream, root: KaitaiStruct, parent: MacOsResourceSnd): MacOsResourceSnd_DataFormat
proc read*(_: typedesc[MacOsResourceSnd_Extended], io: KaitaiStream, root: KaitaiStruct, parent: MacOsResourceSnd_ExtendedOrCompressed): MacOsResourceSnd_Extended
proc read*(_: typedesc[MacOsResourceSnd_ExtendedOrCompressed], io: KaitaiStream, root: KaitaiStruct, parent: MacOsResourceSnd_SoundHeader): MacOsResourceSnd_ExtendedOrCompressed
proc read*(_: typedesc[MacOsResourceSnd_SoundCommand], io: KaitaiStream, root: KaitaiStruct, parent: MacOsResourceSnd): MacOsResourceSnd_SoundCommand
proc read*(_: typedesc[MacOsResourceSnd_SoundHeader], io: KaitaiStream, root: KaitaiStruct, parent: MacOsResourceSnd_SoundCommand): MacOsResourceSnd_SoundHeader
proc read*(_: typedesc[MacOsResourceSnd_UnsignedFixedPoint], io: KaitaiStream, root: KaitaiStruct, parent: MacOsResourceSnd_SoundHeader): MacOsResourceSnd_UnsignedFixedPoint

proc midiNoteToFrequency*(this: MacOsResourceSnd): seq[float64]
proc compressionType*(this: MacOsResourceSnd_Compressed): MacOsResourceSnd_CompressionTypeEnum
proc compInit*(this: MacOsResourceSnd_DataFormat): MacOsResourceSnd_InitOption
proc initCompMask*(this: MacOsResourceSnd_DataFormat): int
proc initPanMask*(this: MacOsResourceSnd_DataFormat): int8
proc initStereoMask*(this: MacOsResourceSnd_DataFormat): uint8
proc panInit*(this: MacOsResourceSnd_DataFormat): MacOsResourceSnd_InitOption
proc stereoInit*(this: MacOsResourceSnd_DataFormat): MacOsResourceSnd_InitOption
proc waveInit*(this: MacOsResourceSnd_DataFormat): MacOsResourceSnd_WaveInitOption
proc waveInitChannelMask*(this: MacOsResourceSnd_DataFormat): int8
proc soundHeader*(this: MacOsResourceSnd_SoundCommand): MacOsResourceSnd_SoundHeader
proc baseFreqeuncy*(this: MacOsResourceSnd_SoundHeader): float64
proc soundHeaderType*(this: MacOsResourceSnd_SoundHeader): MacOsResourceSnd_SoundHeaderType
proc startOfs*(this: MacOsResourceSnd_SoundHeader): int
proc value*(this: MacOsResourceSnd_UnsignedFixedPoint): float64


##[
Sound resources were introduced in Classic MacOS with the Sound Manager program.
They can contain sound commands to generate sounds with given frequencies as well as sampled sound data.
They are mostly found in resource forks, but can occasionally appear standalone or embedded in other files.

@see <a href="https://developer.apple.com/library/archive/documentation/mac/pdf/Sound/Sound_Manager.pdf">Source</a>
]##
proc read*(_: typedesc[MacOsResourceSnd], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): MacOsResourceSnd =
  template this: untyped = result
  this = new(MacOsResourceSnd)
  let root = if root == nil: cast[MacOsResourceSnd](this) else: cast[MacOsResourceSnd](root)
  this.io = io
  this.root = root
  this.parent = parent

  let formatExpr = this.io.readU2be()
  this.format = formatExpr
  if this.format == 1:
    let numDataFormatsExpr = this.io.readU2be()
    this.numDataFormats = numDataFormatsExpr
  if this.format == 1:
    for i in 0 ..< int(this.numDataFormats):
      let it = MacOsResourceSnd_DataFormat.read(this.io, this.root, this)
      this.dataFormats.add(it)
  if this.format == 2:
    let referenceCountExpr = this.io.readU2be()
    this.referenceCount = referenceCountExpr
  let numSoundCommandsExpr = this.io.readU2be()
  this.numSoundCommands = numSoundCommandsExpr
  for i in 0 ..< int(this.numSoundCommands):
    let it = MacOsResourceSnd_SoundCommand.read(this.io, this.root, this)
    this.soundCommands.add(it)

proc midiNoteToFrequency(this: MacOsResourceSnd): seq[float64] = 

  ##[
  Lookup table to convert a MIDI note into a frequency in Hz
The lookup table represents the formula (2 ** ((midi_note - 69) / 12)) * 440

  @see <a href="https://en.wikipedia.org/wiki/MIDI_tuning_standard">Source</a>
  ]##
  if this.midiNoteToFrequencyInstFlag:
    return this.midiNoteToFrequencyInst
  let midiNoteToFrequencyInstExpr = seq[float64](@[float64(8.18), float64(8.66), float64(9.18), float64(9.72), float64(10.30), float64(10.91), float64(11.56), float64(12.25), float64(12.98), float64(13.75), float64(14.57), float64(15.43), float64(16.35), float64(17.32), float64(18.35), float64(19.45), float64(20.60), float64(21.83), float64(23.12), float64(24.50), float64(25.96), float64(27.50), float64(29.14), float64(30.87), float64(32.70), float64(34.65), float64(36.71), float64(38.89), float64(41.20), float64(43.65), float64(46.25), float64(49.00), float64(51.91), float64(55.00), float64(58.27), float64(61.74), float64(65.41), float64(69.30), float64(73.42), float64(77.78), float64(82.41), float64(87.31), float64(92.50), float64(98.00), float64(103.83), float64(110.00), float64(116.54), float64(123.47), float64(130.81), float64(138.59), float64(146.83), float64(155.56), float64(164.81), float64(174.61), float64(185.00), float64(196.00), float64(207.65), float64(220.00), float64(233.08), float64(246.94), float64(261.63), float64(277.18), float64(293.66), float64(311.13), float64(329.63), float64(349.23), float64(369.99), float64(392.00), float64(415.30), float64(440.00), float64(466.16), float64(493.88), float64(523.25), float64(554.37), float64(587.33), float64(622.25), float64(659.26), float64(698.46), float64(739.99), float64(783.99), float64(830.61), float64(880.00), float64(932.33), float64(987.77), float64(1046.50), float64(1108.73), float64(1174.66), float64(1244.51), float64(1318.51), float64(1396.91), float64(1479.98), float64(1567.98), float64(1661.22), float64(1760.00), float64(1864.66), float64(1975.53), float64(2093.00), float64(2217.46), float64(2349.32), float64(2489.02), float64(2637.02), float64(2793.83), float64(2959.96), float64(3135.96), float64(3322.44), float64(3520.00), float64(3729.31), float64(3951.07), float64(4186.01), float64(4434.92), float64(4698.64), float64(4978.03), float64(5274.04), float64(5587.65), float64(5919.91), float64(6271.93), float64(6644.88), float64(7040.00), float64(7458.62), float64(7902.13), float64(8372.02), float64(8869.84), float64(9397.27), float64(9956.06), float64(10548.08), float64(11175.30), float64(11839.82), float64(12543.85)])
  this.midiNoteToFrequencyInst = midiNoteToFrequencyInstExpr
  this.midiNoteToFrequencyInstFlag = true
  return this.midiNoteToFrequencyInst

proc fromFile*(_: typedesc[MacOsResourceSnd], filename: string): MacOsResourceSnd =
  MacOsResourceSnd.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MacOsResourceSnd_Compressed], io: KaitaiStream, root: KaitaiStruct, parent: MacOsResourceSnd_ExtendedOrCompressed): MacOsResourceSnd_Compressed =
  template this: untyped = result
  this = new(MacOsResourceSnd_Compressed)
  let root = if root == nil: cast[MacOsResourceSnd](this) else: cast[MacOsResourceSnd](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  data format type
  ]##
  let formatExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.format = formatExpr
  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr

  ##[
  pointer to StateBlock
  ]##
  let stateVarsPtrExpr = this.io.readU4be()
  this.stateVarsPtr = stateVarsPtrExpr

  ##[
  pointer to LeftOverBlock
  ]##
  let leftOverSamplesPtrExpr = this.io.readU4be()
  this.leftOverSamplesPtr = leftOverSamplesPtrExpr

  ##[
  ID of compression algorithm
  ]##
  let compressionIdExpr = this.io.readS2be()
  this.compressionId = compressionIdExpr

  ##[
  number of bits per packet
  ]##
  let packetSizeExpr = this.io.readU2be()
  this.packetSize = packetSizeExpr

  ##[
  Latest Sound Manager documentation specifies this field as:
This field is unused. You should set it to 0.
Inside Macintosh (Volume VI, 1991) specifies it as:
Indicates the resource ID number of the 'snth' resource that was used to compress the packets contained in the compressed sound header.

  @see <a href="https://vintageapple.org/inside_o/pdf/Inside_Macintosh_Volume_VI_1991.pdf">Page 22-49, absolute page number 1169 in the PDF</a>
  ]##
  let synthesizerIdExpr = this.io.readU2be()
  this.synthesizerId = synthesizerIdExpr

proc compressionType(this: MacOsResourceSnd_Compressed): MacOsResourceSnd_CompressionTypeEnum = 
  if this.compressionTypeInstFlag:
    return this.compressionTypeInst
  let compressionTypeInstExpr = MacOsResourceSnd_CompressionTypeEnum(MacOsResourceSnd_CompressionTypeEnum(this.compressionId))
  this.compressionTypeInst = compressionTypeInstExpr
  this.compressionTypeInstFlag = true
  return this.compressionTypeInst

proc fromFile*(_: typedesc[MacOsResourceSnd_Compressed], filename: string): MacOsResourceSnd_Compressed =
  MacOsResourceSnd_Compressed.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MacOsResourceSnd_DataFormat], io: KaitaiStream, root: KaitaiStruct, parent: MacOsResourceSnd): MacOsResourceSnd_DataFormat =
  template this: untyped = result
  this = new(MacOsResourceSnd_DataFormat)
  let root = if root == nil: cast[MacOsResourceSnd](this) else: cast[MacOsResourceSnd](root)
  this.io = io
  this.root = root
  this.parent = parent

  let idExpr = MacOsResourceSnd_DataType(this.io.readU2be())
  this.id = idExpr

  ##[
  contains initialisation options for the SndNewChannel function
  ]##
  let optionsExpr = this.io.readU4be()
  this.options = optionsExpr

proc compInit(this: MacOsResourceSnd_DataFormat): MacOsResourceSnd_InitOption = 
  if this.compInitInstFlag:
    return this.compInitInst
  let compInitInstExpr = MacOsResourceSnd_InitOption(MacOsResourceSnd_InitOption(this.options and this.initCompMask))
  this.compInitInst = compInitInstExpr
  this.compInitInstFlag = true
  return this.compInitInst

proc initCompMask(this: MacOsResourceSnd_DataFormat): int = 

  ##[
  mask for compression IDs
  ]##
  if this.initCompMaskInstFlag:
    return this.initCompMaskInst
  let initCompMaskInstExpr = int(65280)
  this.initCompMaskInst = initCompMaskInstExpr
  this.initCompMaskInstFlag = true
  return this.initCompMaskInst

proc initPanMask(this: MacOsResourceSnd_DataFormat): int8 = 

  ##[
  mask for right/left pan values
  ]##
  if this.initPanMaskInstFlag:
    return this.initPanMaskInst
  let initPanMaskInstExpr = int8(3)
  this.initPanMaskInst = initPanMaskInstExpr
  this.initPanMaskInstFlag = true
  return this.initPanMaskInst

proc initStereoMask(this: MacOsResourceSnd_DataFormat): uint8 = 

  ##[
  mask for mono/stereo values
  ]##
  if this.initStereoMaskInstFlag:
    return this.initStereoMaskInst
  let initStereoMaskInstExpr = uint8(192)
  this.initStereoMaskInst = initStereoMaskInstExpr
  this.initStereoMaskInstFlag = true
  return this.initStereoMaskInst

proc panInit(this: MacOsResourceSnd_DataFormat): MacOsResourceSnd_InitOption = 
  if this.panInitInstFlag:
    return this.panInitInst
  let panInitInstExpr = MacOsResourceSnd_InitOption(MacOsResourceSnd_InitOption(this.options and this.initPanMask))
  this.panInitInst = panInitInstExpr
  this.panInitInstFlag = true
  return this.panInitInst

proc stereoInit(this: MacOsResourceSnd_DataFormat): MacOsResourceSnd_InitOption = 
  if this.stereoInitInstFlag:
    return this.stereoInitInst
  let stereoInitInstExpr = MacOsResourceSnd_InitOption(MacOsResourceSnd_InitOption(this.options and this.initStereoMask))
  this.stereoInitInst = stereoInitInstExpr
  this.stereoInitInstFlag = true
  return this.stereoInitInst

proc waveInit(this: MacOsResourceSnd_DataFormat): MacOsResourceSnd_WaveInitOption = 
  if this.waveInitInstFlag:
    return this.waveInitInst
  if this.id == mac_os_resource_snd.wave_table_synth:
    let waveInitInstExpr = MacOsResourceSnd_WaveInitOption(MacOsResourceSnd_WaveInitOption(this.options and this.waveInitChannelMask))
    this.waveInitInst = waveInitInstExpr
  this.waveInitInstFlag = true
  return this.waveInitInst

proc waveInitChannelMask(this: MacOsResourceSnd_DataFormat): int8 = 

  ##[
  wave table only, Sound Manager 2.0 and earlier
  ]##
  if this.waveInitChannelMaskInstFlag:
    return this.waveInitChannelMaskInst
  let waveInitChannelMaskInstExpr = int8(7)
  this.waveInitChannelMaskInst = waveInitChannelMaskInstExpr
  this.waveInitChannelMaskInstFlag = true
  return this.waveInitChannelMaskInst

proc fromFile*(_: typedesc[MacOsResourceSnd_DataFormat], filename: string): MacOsResourceSnd_DataFormat =
  MacOsResourceSnd_DataFormat.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MacOsResourceSnd_Extended], io: KaitaiStream, root: KaitaiStruct, parent: MacOsResourceSnd_ExtendedOrCompressed): MacOsResourceSnd_Extended =
  template this: untyped = result
  this = new(MacOsResourceSnd_Extended)
  let root = if root == nil: cast[MacOsResourceSnd](this) else: cast[MacOsResourceSnd](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  pointer to instrument info
  ]##
  let instrumentChunkPtrExpr = this.io.readU4be()
  this.instrumentChunkPtr = instrumentChunkPtrExpr

  ##[
  pointer to audio info
  ]##
  let aesRecordingPtrExpr = this.io.readU4be()
  this.aesRecordingPtr = aesRecordingPtrExpr

proc fromFile*(_: typedesc[MacOsResourceSnd_Extended], filename: string): MacOsResourceSnd_Extended =
  MacOsResourceSnd_Extended.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MacOsResourceSnd_ExtendedOrCompressed], io: KaitaiStream, root: KaitaiStruct, parent: MacOsResourceSnd_SoundHeader): MacOsResourceSnd_ExtendedOrCompressed =
  template this: untyped = result
  this = new(MacOsResourceSnd_ExtendedOrCompressed)
  let root = if root == nil: cast[MacOsResourceSnd](this) else: cast[MacOsResourceSnd](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numFramesExpr = this.io.readU4be()
  this.numFrames = numFramesExpr

  ##[
  rate of original sample (Extended80)
  ]##
  let aiffSampleRateExpr = this.io.readBytes(int(10))
  this.aiffSampleRate = aiffSampleRateExpr

  ##[
  reserved
  ]##
  let markerChunkExpr = this.io.readU4be()
  this.markerChunk = markerChunkExpr
  if this.parent.soundHeaderType == mac_os_resource_snd.extended:
    let extendedExpr = MacOsResourceSnd_Extended.read(this.io, this.root, this)
    this.extended = extendedExpr
  if this.parent.soundHeaderType == mac_os_resource_snd.compressed:
    let compressedExpr = MacOsResourceSnd_Compressed.read(this.io, this.root, this)
    this.compressed = compressedExpr

  ##[
  number of bits per sample
  ]##
  let bitsPerSampleExpr = this.io.readU2be()
  this.bitsPerSample = bitsPerSampleExpr

  ##[
  reserved
  ]##
  if this.parent.soundHeaderType == mac_os_resource_snd.extended:
    let reservedExpr = this.io.readBytes(int(14))
    this.reserved = reservedExpr

proc fromFile*(_: typedesc[MacOsResourceSnd_ExtendedOrCompressed], filename: string): MacOsResourceSnd_ExtendedOrCompressed =
  MacOsResourceSnd_ExtendedOrCompressed.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MacOsResourceSnd_SoundCommand], io: KaitaiStream, root: KaitaiStruct, parent: MacOsResourceSnd): MacOsResourceSnd_SoundCommand =
  template this: untyped = result
  this = new(MacOsResourceSnd_SoundCommand)
  let root = if root == nil: cast[MacOsResourceSnd](this) else: cast[MacOsResourceSnd](root)
  this.io = io
  this.root = root
  this.parent = parent

  let isDataOffsetExpr = this.io.readBitsIntBe(1) != 0
  this.isDataOffset = isDataOffsetExpr
  let cmdExpr = MacOsResourceSnd_CmdType(this.io.readBitsIntBe(15))
  this.cmd = cmdExpr
  alignToByte(this.io)
  let param1Expr = this.io.readU2be()
  this.param1 = param1Expr
  let param2Expr = this.io.readU4be()
  this.param2 = param2Expr

proc soundHeader(this: MacOsResourceSnd_SoundCommand): MacOsResourceSnd_SoundHeader = 
  if this.soundHeaderInstFlag:
    return this.soundHeaderInst
  if  ((this.isDataOffset) and (this.cmd == mac_os_resource_snd.buffer_cmd)) :
    let pos = this.io.pos()
    this.io.seek(int(this.param2))
    let soundHeaderInstExpr = MacOsResourceSnd_SoundHeader.read(this.io, this.root, this)
    this.soundHeaderInst = soundHeaderInstExpr
    this.io.seek(pos)
  this.soundHeaderInstFlag = true
  return this.soundHeaderInst

proc fromFile*(_: typedesc[MacOsResourceSnd_SoundCommand], filename: string): MacOsResourceSnd_SoundCommand =
  MacOsResourceSnd_SoundCommand.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MacOsResourceSnd_SoundHeader], io: KaitaiStream, root: KaitaiStruct, parent: MacOsResourceSnd_SoundCommand): MacOsResourceSnd_SoundHeader =
  template this: untyped = result
  this = new(MacOsResourceSnd_SoundHeader)
  let root = if root == nil: cast[MacOsResourceSnd](this) else: cast[MacOsResourceSnd](root)
  this.io = io
  this.root = root
  this.parent = parent

  if this.startOfs < 0:
    let unnamed0Expr = this.io.readBytes(int(0))
    this.unnamed0 = unnamed0Expr

  ##[
  pointer to samples (or 0 if samples follow data structure)
  ]##
  let samplePtrExpr = this.io.readU4be()
  this.samplePtr = samplePtrExpr

  ##[
  number of samples
  ]##
  if this.soundHeaderType == mac_os_resource_snd.standard:
    let numSamplesExpr = this.io.readU4be()
    this.numSamples = numSamplesExpr

  ##[
  number of channels in sample
  ]##
  if  ((this.soundHeaderType == mac_os_resource_snd.extended) or (this.soundHeaderType == mac_os_resource_snd.compressed)) :
    let numChannelsExpr = this.io.readU4be()
    this.numChannels = numChannelsExpr

  ##[
  The rate at which the sample was originally recorded.
  ]##
  let sampleRateExpr = MacOsResourceSnd_UnsignedFixedPoint.read(this.io, this.root, this)
  this.sampleRate = sampleRateExpr

  ##[
  loop point beginning
  ]##
  let loopStartExpr = this.io.readU4be()
  this.loopStart = loopStartExpr

  ##[
  loop point ending
  ]##
  let loopEndExpr = this.io.readU4be()
  this.loopEnd = loopEndExpr

  ##[
  sample's encoding option
  ]##
  let encodeExpr = MacOsResourceSnd_SoundHeaderType(this.io.readU1())
  this.encode = encodeExpr

  ##[
  base frequency of sample, expressed as MIDI note values, 60 is middle C
  ]##
  let midiNoteExpr = this.io.readU1()
  this.midiNote = midiNoteExpr
  if  ((this.soundHeaderType == mac_os_resource_snd.extended) or (this.soundHeaderType == mac_os_resource_snd.compressed)) :
    let extendedOrCompressedExpr = MacOsResourceSnd_ExtendedOrCompressed.read(this.io, this.root, this)
    this.extendedOrCompressed = extendedOrCompressedExpr

  ##[
  sampled-sound data
  ]##
  if this.samplePtr == 0:
    let sampleAreaExpr = this.io.readBytes(int((if this.soundHeaderType == mac_os_resource_snd.standard: this.numSamples else: (if this.soundHeaderType == mac_os_resource_snd.extended: ((this.extendedOrCompressed.numFrames * this.numChannels) * this.extendedOrCompressed.bitsPerSample) div 8 else: this.io.size - this.io.pos))))
    this.sampleArea = sampleAreaExpr

proc baseFreqeuncy(this: MacOsResourceSnd_SoundHeader): float64 = 

  ##[
  base frequency of sample in Hz
Calculated with the formula (2 ** ((midi_note - 69) / 12)) * 440

  @see <a href="https://en.wikipedia.org/wiki/MIDI_tuning_standard">Source</a>
  ]##
  if this.baseFreqeuncyInstFlag:
    return this.baseFreqeuncyInst
  if  ((this.midiNote >= 0) and (this.midiNote < 128)) :
    let baseFreqeuncyInstExpr = float64(MacOsResourceSnd(this.root).midiNoteToFrequency[this.midiNote])
    this.baseFreqeuncyInst = baseFreqeuncyInstExpr
  this.baseFreqeuncyInstFlag = true
  return this.baseFreqeuncyInst

proc soundHeaderType(this: MacOsResourceSnd_SoundHeader): MacOsResourceSnd_SoundHeaderType = 
  if this.soundHeaderTypeInstFlag:
    return this.soundHeaderTypeInst
  let pos = this.io.pos()
  this.io.seek(int(this.startOfs + 20))
  let soundHeaderTypeInstExpr = MacOsResourceSnd_SoundHeaderType(this.io.readU1())
  this.soundHeaderTypeInst = soundHeaderTypeInstExpr
  this.io.seek(pos)
  this.soundHeaderTypeInstFlag = true
  return this.soundHeaderTypeInst

proc startOfs(this: MacOsResourceSnd_SoundHeader): int = 
  if this.startOfsInstFlag:
    return this.startOfsInst
  let startOfsInstExpr = int(this.io.pos)
  this.startOfsInst = startOfsInstExpr
  this.startOfsInstFlag = true
  return this.startOfsInst

proc fromFile*(_: typedesc[MacOsResourceSnd_SoundHeader], filename: string): MacOsResourceSnd_SoundHeader =
  MacOsResourceSnd_SoundHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[MacOsResourceSnd_UnsignedFixedPoint], io: KaitaiStream, root: KaitaiStruct, parent: MacOsResourceSnd_SoundHeader): MacOsResourceSnd_UnsignedFixedPoint =
  template this: untyped = result
  this = new(MacOsResourceSnd_UnsignedFixedPoint)
  let root = if root == nil: cast[MacOsResourceSnd](this) else: cast[MacOsResourceSnd](root)
  this.io = io
  this.root = root
  this.parent = parent

  let integerPartExpr = this.io.readU2be()
  this.integerPart = integerPartExpr
  let fractionPartExpr = this.io.readU2be()
  this.fractionPart = fractionPartExpr

proc value(this: MacOsResourceSnd_UnsignedFixedPoint): float64 = 
  if this.valueInstFlag:
    return this.valueInst
  let valueInstExpr = float64(this.integerPart + this.fractionPart div 65535.0)
  this.valueInst = valueInstExpr
  this.valueInstFlag = true
  return this.valueInst

proc fromFile*(_: typedesc[MacOsResourceSnd_UnsignedFixedPoint], filename: string): MacOsResourceSnd_UnsignedFixedPoint =
  MacOsResourceSnd_UnsignedFixedPoint.read(newKaitaiFileStream(filename), nil, nil)


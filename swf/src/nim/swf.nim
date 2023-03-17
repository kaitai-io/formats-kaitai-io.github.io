import kaitai_struct_nim_runtime
import options

type
  Swf* = ref object of KaitaiStruct
    `compression`*: Swf_Compressions
    `signature`*: seq[byte]
    `version`*: uint8
    `lenFile`*: uint32
    `plainBody`*: Swf_SwfBody
    `zlibBody`*: Swf_SwfBody
    `parent`*: KaitaiStruct
    `rawPlainBody`*: seq[byte]
    `rawZlibBody`*: seq[byte]
    `rawRawZlibBody`*: seq[byte]
  Swf_Compressions* = enum
    zlib = 67
    none = 70
    lzma = 90
  Swf_TagType* = enum
    end_of_file = 0
    place_object = 4
    remove_object = 5
    set_background_color = 9
    define_sound = 14
    place_object2 = 26
    remove_object2 = 28
    frame_label = 43
    export_assets = 56
    script_limits = 65
    file_attributes = 69
    place_object3 = 70
    symbol_class = 76
    metadata = 77
    define_scaling_grid = 78
    do_abc = 82
    define_scene_and_frame_label_data = 86
  Swf_Rgb* = ref object of KaitaiStruct
    `r`*: uint8
    `g`*: uint8
    `b`*: uint8
    `parent`*: Swf_Tag
  Swf_DoAbcBody* = ref object of KaitaiStruct
    `flags`*: uint32
    `name`*: string
    `abcdata`*: seq[byte]
    `parent`*: Swf_Tag
  Swf_SwfBody* = ref object of KaitaiStruct
    `rect`*: Swf_Rect
    `frameRate`*: uint16
    `frameCount`*: uint16
    `fileAttributesTag`*: Swf_Tag
    `tags`*: seq[Swf_Tag]
    `parent`*: Swf
  Swf_Rect* = ref object of KaitaiStruct
    `b1`*: uint8
    `skip`*: seq[byte]
    `parent`*: Swf_SwfBody
    `numBitsInst`: int
    `numBitsInstFlag`: bool
    `numBytesInst`: int
    `numBytesInstFlag`: bool
  Swf_Tag* = ref object of KaitaiStruct
    `recordHeader`*: Swf_RecordHeader
    `tagBody`*: KaitaiStruct
    `parent`*: Swf_SwfBody
    `rawTagBody`*: seq[byte]
  Swf_SymbolClassBody* = ref object of KaitaiStruct
    `numSymbols`*: uint16
    `symbols`*: seq[Swf_SymbolClassBody_Symbol]
    `parent`*: Swf_Tag
  Swf_SymbolClassBody_Symbol* = ref object of KaitaiStruct
    `tag`*: uint16
    `name`*: string
    `parent`*: Swf_SymbolClassBody
  Swf_DefineSoundBody* = ref object of KaitaiStruct
    `id`*: uint16
    `format`*: uint64
    `samplingRate`*: Swf_DefineSoundBody_SamplingRates
    `bitsPerSample`*: Swf_DefineSoundBody_Bps
    `numChannels`*: Swf_DefineSoundBody_Channels
    `numSamples`*: uint32
    `parent`*: Swf_Tag
  Swf_DefineSoundBody_SamplingRates* = enum
    rate_5_5_khz = 0
    rate_11_khz = 1
    rate_22_khz = 2
    rate_44_khz = 3
  Swf_DefineSoundBody_Bps* = enum
    sound_8_bit = 0
    sound_16_bit = 1
  Swf_DefineSoundBody_Channels* = enum
    mono = 0
    stereo = 1
  Swf_RecordHeader* = ref object of KaitaiStruct
    `tagCodeAndLength`*: uint16
    `bigLen`*: int32
    `parent`*: Swf_Tag
    `tagTypeInst`: Swf_TagType
    `tagTypeInstFlag`: bool
    `smallLenInst`: int
    `smallLenInstFlag`: bool
    `lenInst`: int
    `lenInstFlag`: bool
  Swf_ScriptLimitsBody* = ref object of KaitaiStruct
    `maxRecursionDepth`*: uint16
    `scriptTimeoutSeconds`*: uint16
    `parent`*: Swf_Tag

proc read*(_: typedesc[Swf], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Swf
proc read*(_: typedesc[Swf_Rgb], io: KaitaiStream, root: KaitaiStruct, parent: Swf_Tag): Swf_Rgb
proc read*(_: typedesc[Swf_DoAbcBody], io: KaitaiStream, root: KaitaiStruct, parent: Swf_Tag): Swf_DoAbcBody
proc read*(_: typedesc[Swf_SwfBody], io: KaitaiStream, root: KaitaiStruct, parent: Swf): Swf_SwfBody
proc read*(_: typedesc[Swf_Rect], io: KaitaiStream, root: KaitaiStruct, parent: Swf_SwfBody): Swf_Rect
proc read*(_: typedesc[Swf_Tag], io: KaitaiStream, root: KaitaiStruct, parent: Swf_SwfBody): Swf_Tag
proc read*(_: typedesc[Swf_SymbolClassBody], io: KaitaiStream, root: KaitaiStruct, parent: Swf_Tag): Swf_SymbolClassBody
proc read*(_: typedesc[Swf_SymbolClassBody_Symbol], io: KaitaiStream, root: KaitaiStruct, parent: Swf_SymbolClassBody): Swf_SymbolClassBody_Symbol
proc read*(_: typedesc[Swf_DefineSoundBody], io: KaitaiStream, root: KaitaiStruct, parent: Swf_Tag): Swf_DefineSoundBody
proc read*(_: typedesc[Swf_RecordHeader], io: KaitaiStream, root: KaitaiStruct, parent: Swf_Tag): Swf_RecordHeader
proc read*(_: typedesc[Swf_ScriptLimitsBody], io: KaitaiStream, root: KaitaiStruct, parent: Swf_Tag): Swf_ScriptLimitsBody

proc numBits*(this: Swf_Rect): int
proc numBytes*(this: Swf_Rect): int
proc tagType*(this: Swf_RecordHeader): Swf_TagType
proc smallLen*(this: Swf_RecordHeader): int
proc len*(this: Swf_RecordHeader): int


##[
SWF files are used by Adobe Flash (AKA Shockwave Flash, Macromedia
Flash) to encode rich interactive multimedia content and are,
essentially, a container for special bytecode instructions to play
back that content. In early 2000s, it was dominant rich multimedia
web format (.swf files were integrated into web pages and played
back with a browser plugin), but its usage largely declined in
2010s, as HTML5 and performant browser-native solutions
(i.e. JavaScript engines and graphical approaches, such as WebGL)
emerged.

There are a lot of versions of SWF (~36), format is somewhat
documented by Adobe.

@see <a href="https://open-flash.github.io/mirrors/swf-spec-19.pdf">Source</a>
]##
proc read*(_: typedesc[Swf], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Swf =
  template this: untyped = result
  this = new(Swf)
  let root = if root == nil: cast[Swf](this) else: cast[Swf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let compressionExpr = Swf_Compressions(this.io.readU1())
  this.compression = compressionExpr
  let signatureExpr = this.io.readBytes(int(2))
  this.signature = signatureExpr
  let versionExpr = this.io.readU1()
  this.version = versionExpr
  let lenFileExpr = this.io.readU4le()
  this.lenFile = lenFileExpr
  if this.compression == swf.none:
    let rawPlainBodyExpr = this.io.readBytesFull()
    this.rawPlainBody = rawPlainBodyExpr
    let rawPlainBodyIo = newKaitaiStream(rawPlainBodyExpr)
    let plainBodyExpr = Swf_SwfBody.read(rawPlainBodyIo, this.root, this)
    this.plainBody = plainBodyExpr
  if this.compression == swf.zlib:
    let rawRawZlibBodyExpr = this.io.readBytesFull()
    this.rawRawZlibBody = rawRawZlibBodyExpr
    let rawZlibBodyExpr = this.rawRawZlibBody.processZlib()
    this.rawZlibBody = rawZlibBodyExpr
    let rawZlibBodyIo = newKaitaiStream(rawZlibBodyExpr)
    let zlibBodyExpr = Swf_SwfBody.read(rawZlibBodyIo, this.root, this)
    this.zlibBody = zlibBodyExpr

proc fromFile*(_: typedesc[Swf], filename: string): Swf =
  Swf.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Swf_Rgb], io: KaitaiStream, root: KaitaiStruct, parent: Swf_Tag): Swf_Rgb =
  template this: untyped = result
  this = new(Swf_Rgb)
  let root = if root == nil: cast[Swf](this) else: cast[Swf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rExpr = this.io.readU1()
  this.r = rExpr
  let gExpr = this.io.readU1()
  this.g = gExpr
  let bExpr = this.io.readU1()
  this.b = bExpr

proc fromFile*(_: typedesc[Swf_Rgb], filename: string): Swf_Rgb =
  Swf_Rgb.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Swf_DoAbcBody], io: KaitaiStream, root: KaitaiStruct, parent: Swf_Tag): Swf_DoAbcBody =
  template this: untyped = result
  this = new(Swf_DoAbcBody)
  let root = if root == nil: cast[Swf](this) else: cast[Swf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let flagsExpr = this.io.readU4le()
  this.flags = flagsExpr
  let nameExpr = encode(this.io.readBytesTerm(0, false, true, true), "ASCII")
  this.name = nameExpr
  let abcdataExpr = this.io.readBytesFull()
  this.abcdata = abcdataExpr

proc fromFile*(_: typedesc[Swf_DoAbcBody], filename: string): Swf_DoAbcBody =
  Swf_DoAbcBody.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Swf_SwfBody], io: KaitaiStream, root: KaitaiStruct, parent: Swf): Swf_SwfBody =
  template this: untyped = result
  this = new(Swf_SwfBody)
  let root = if root == nil: cast[Swf](this) else: cast[Swf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rectExpr = Swf_Rect.read(this.io, this.root, this)
  this.rect = rectExpr
  let frameRateExpr = this.io.readU2le()
  this.frameRate = frameRateExpr
  let frameCountExpr = this.io.readU2le()
  this.frameCount = frameCountExpr
  if Swf(this.root).version >= 8:
    let fileAttributesTagExpr = Swf_Tag.read(this.io, this.root, this)
    this.fileAttributesTag = fileAttributesTagExpr
  block:
    var i: int
    while not this.io.isEof:
      let it = Swf_Tag.read(this.io, this.root, this)
      this.tags.add(it)
      inc i

proc fromFile*(_: typedesc[Swf_SwfBody], filename: string): Swf_SwfBody =
  Swf_SwfBody.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Swf_Rect], io: KaitaiStream, root: KaitaiStruct, parent: Swf_SwfBody): Swf_Rect =
  template this: untyped = result
  this = new(Swf_Rect)
  let root = if root == nil: cast[Swf](this) else: cast[Swf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let b1Expr = this.io.readU1()
  this.b1 = b1Expr
  let skipExpr = this.io.readBytes(int(this.numBytes))
  this.skip = skipExpr

proc numBits(this: Swf_Rect): int = 
  if this.numBitsInstFlag:
    return this.numBitsInst
  let numBitsInstExpr = int((this.b1 shr 3))
  this.numBitsInst = numBitsInstExpr
  this.numBitsInstFlag = true
  return this.numBitsInst

proc numBytes(this: Swf_Rect): int = 
  if this.numBytesInstFlag:
    return this.numBytesInst
  let numBytesInstExpr = int(((((this.numBits * 4) - 3) + 7) div 8))
  this.numBytesInst = numBytesInstExpr
  this.numBytesInstFlag = true
  return this.numBytesInst

proc fromFile*(_: typedesc[Swf_Rect], filename: string): Swf_Rect =
  Swf_Rect.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Swf_Tag], io: KaitaiStream, root: KaitaiStruct, parent: Swf_SwfBody): Swf_Tag =
  template this: untyped = result
  this = new(Swf_Tag)
  let root = if root == nil: cast[Swf](this) else: cast[Swf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let recordHeaderExpr = Swf_RecordHeader.read(this.io, this.root, this)
  this.recordHeader = recordHeaderExpr
  block:
    let on = this.recordHeader.tagType
    if on == swf.define_sound:
      let rawTagBodyExpr = this.io.readBytes(int(this.recordHeader.len))
      this.rawTagBody = rawTagBodyExpr
      let rawTagBodyIo = newKaitaiStream(rawTagBodyExpr)
      let tagBodyExpr = Swf_DefineSoundBody.read(rawTagBodyIo, this.root, this)
      this.tagBody = tagBodyExpr
    elif on == swf.set_background_color:
      let rawTagBodyExpr = this.io.readBytes(int(this.recordHeader.len))
      this.rawTagBody = rawTagBodyExpr
      let rawTagBodyIo = newKaitaiStream(rawTagBodyExpr)
      let tagBodyExpr = Swf_Rgb.read(rawTagBodyIo, this.root, this)
      this.tagBody = tagBodyExpr
    elif on == swf.script_limits:
      let rawTagBodyExpr = this.io.readBytes(int(this.recordHeader.len))
      this.rawTagBody = rawTagBodyExpr
      let rawTagBodyIo = newKaitaiStream(rawTagBodyExpr)
      let tagBodyExpr = Swf_ScriptLimitsBody.read(rawTagBodyIo, this.root, this)
      this.tagBody = tagBodyExpr
    elif on == swf.do_abc:
      let rawTagBodyExpr = this.io.readBytes(int(this.recordHeader.len))
      this.rawTagBody = rawTagBodyExpr
      let rawTagBodyIo = newKaitaiStream(rawTagBodyExpr)
      let tagBodyExpr = Swf_DoAbcBody.read(rawTagBodyIo, this.root, this)
      this.tagBody = tagBodyExpr
    elif on == swf.export_assets:
      let rawTagBodyExpr = this.io.readBytes(int(this.recordHeader.len))
      this.rawTagBody = rawTagBodyExpr
      let rawTagBodyIo = newKaitaiStream(rawTagBodyExpr)
      let tagBodyExpr = Swf_SymbolClassBody.read(rawTagBodyIo, this.root, this)
      this.tagBody = tagBodyExpr
    elif on == swf.symbol_class:
      let rawTagBodyExpr = this.io.readBytes(int(this.recordHeader.len))
      this.rawTagBody = rawTagBodyExpr
      let rawTagBodyIo = newKaitaiStream(rawTagBodyExpr)
      let tagBodyExpr = Swf_SymbolClassBody.read(rawTagBodyIo, this.root, this)
      this.tagBody = tagBodyExpr
    else:
      let tagBodyExpr = this.io.readBytes(int(this.recordHeader.len))
      this.tagBody = tagBodyExpr

proc fromFile*(_: typedesc[Swf_Tag], filename: string): Swf_Tag =
  Swf_Tag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Swf_SymbolClassBody], io: KaitaiStream, root: KaitaiStruct, parent: Swf_Tag): Swf_SymbolClassBody =
  template this: untyped = result
  this = new(Swf_SymbolClassBody)
  let root = if root == nil: cast[Swf](this) else: cast[Swf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numSymbolsExpr = this.io.readU2le()
  this.numSymbols = numSymbolsExpr
  for i in 0 ..< int(this.numSymbols):
    let it = Swf_SymbolClassBody_Symbol.read(this.io, this.root, this)
    this.symbols.add(it)

proc fromFile*(_: typedesc[Swf_SymbolClassBody], filename: string): Swf_SymbolClassBody =
  Swf_SymbolClassBody.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Swf_SymbolClassBody_Symbol], io: KaitaiStream, root: KaitaiStruct, parent: Swf_SymbolClassBody): Swf_SymbolClassBody_Symbol =
  template this: untyped = result
  this = new(Swf_SymbolClassBody_Symbol)
  let root = if root == nil: cast[Swf](this) else: cast[Swf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagExpr = this.io.readU2le()
  this.tag = tagExpr
  let nameExpr = encode(this.io.readBytesTerm(0, false, true, true), "ASCII")
  this.name = nameExpr

proc fromFile*(_: typedesc[Swf_SymbolClassBody_Symbol], filename: string): Swf_SymbolClassBody_Symbol =
  Swf_SymbolClassBody_Symbol.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Swf_DefineSoundBody], io: KaitaiStream, root: KaitaiStruct, parent: Swf_Tag): Swf_DefineSoundBody =
  template this: untyped = result
  this = new(Swf_DefineSoundBody)
  let root = if root == nil: cast[Swf](this) else: cast[Swf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let idExpr = this.io.readU2le()
  this.id = idExpr
  let formatExpr = this.io.readBitsIntBe(4)
  this.format = formatExpr

  ##[
  Sound sampling rate, as per enum. Ignored for Nellymoser and Speex codecs.
  ]##
  let samplingRateExpr = Swf_DefineSoundBody_SamplingRates(this.io.readBitsIntBe(2))
  this.samplingRate = samplingRateExpr
  let bitsPerSampleExpr = Swf_DefineSoundBody_Bps(this.io.readBitsIntBe(1))
  this.bitsPerSample = bitsPerSampleExpr
  let numChannelsExpr = Swf_DefineSoundBody_Channels(this.io.readBitsIntBe(1))
  this.numChannels = numChannelsExpr
  alignToByte(this.io)
  let numSamplesExpr = this.io.readU4le()
  this.numSamples = numSamplesExpr

proc fromFile*(_: typedesc[Swf_DefineSoundBody], filename: string): Swf_DefineSoundBody =
  Swf_DefineSoundBody.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Swf_RecordHeader], io: KaitaiStream, root: KaitaiStruct, parent: Swf_Tag): Swf_RecordHeader =
  template this: untyped = result
  this = new(Swf_RecordHeader)
  let root = if root == nil: cast[Swf](this) else: cast[Swf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagCodeAndLengthExpr = this.io.readU2le()
  this.tagCodeAndLength = tagCodeAndLengthExpr
  if this.smallLen == 63:
    let bigLenExpr = this.io.readS4le()
    this.bigLen = bigLenExpr

proc tagType(this: Swf_RecordHeader): Swf_TagType = 
  if this.tagTypeInstFlag:
    return this.tagTypeInst
  let tagTypeInstExpr = Swf_TagType(Swf_TagType((this.tagCodeAndLength shr 6)))
  this.tagTypeInst = tagTypeInstExpr
  this.tagTypeInstFlag = true
  return this.tagTypeInst

proc smallLen(this: Swf_RecordHeader): int = 
  if this.smallLenInstFlag:
    return this.smallLenInst
  let smallLenInstExpr = int((this.tagCodeAndLength and 63))
  this.smallLenInst = smallLenInstExpr
  this.smallLenInstFlag = true
  return this.smallLenInst

proc len(this: Swf_RecordHeader): int = 
  if this.lenInstFlag:
    return this.lenInst
  let lenInstExpr = int((if this.smallLen == 63: this.bigLen else: this.smallLen))
  this.lenInst = lenInstExpr
  this.lenInstFlag = true
  return this.lenInst

proc fromFile*(_: typedesc[Swf_RecordHeader], filename: string): Swf_RecordHeader =
  Swf_RecordHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Swf_ScriptLimitsBody], io: KaitaiStream, root: KaitaiStruct, parent: Swf_Tag): Swf_ScriptLimitsBody =
  template this: untyped = result
  this = new(Swf_ScriptLimitsBody)
  let root = if root == nil: cast[Swf](this) else: cast[Swf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let maxRecursionDepthExpr = this.io.readU2le()
  this.maxRecursionDepth = maxRecursionDepthExpr
  let scriptTimeoutSecondsExpr = this.io.readU2le()
  this.scriptTimeoutSeconds = scriptTimeoutSecondsExpr

proc fromFile*(_: typedesc[Swf_ScriptLimitsBody], filename: string): Swf_ScriptLimitsBody =
  Swf_ScriptLimitsBody.read(newKaitaiFileStream(filename), nil, nil)


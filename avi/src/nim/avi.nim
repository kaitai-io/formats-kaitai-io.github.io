import kaitai_struct_nim_runtime
import options

type
  Avi* = ref object of KaitaiStruct
    `magic1`*: seq[byte]
    `fileSize`*: uint32
    `magic2`*: seq[byte]
    `data`*: Avi_Blocks
    `parent`*: KaitaiStruct
    `rawData`*: seq[byte]
  Avi_ChunkType* = enum
    idx1 = 829973609
    junk = 1263424842
    info = 1330007625
    isft = 1413894985
    list = 1414744396
    strf = 1718776947
    avih = 1751742049
    strh = 1752331379
    movi = 1769369453
    hdrl = 1819436136
    strl = 1819440243
  Avi_StreamType* = enum
    mids = 1935960429
    vids = 1935960438
    auds = 1935963489
    txts = 1937012852
  Avi_HandlerType* = enum
    mp3 = 85
    ac3 = 8192
    dts = 8193
    cvid = 1684633187
    xvid = 1684633208
  Avi_ListBody* = ref object of KaitaiStruct
    `listType`*: Avi_ChunkType
    `data`*: Avi_Blocks
    `parent`*: Avi_Block
  Avi_Rect* = ref object of KaitaiStruct
    `left`*: int16
    `top`*: int16
    `right`*: int16
    `bottom`*: int16
    `parent`*: Avi_StrhBody
  Avi_Blocks* = ref object of KaitaiStruct
    `entries`*: seq[Avi_Block]
    `parent`*: KaitaiStruct
  Avi_AvihBody* = ref object of KaitaiStruct
    `microSecPerFrame`*: uint32
    `maxBytesPerSec`*: uint32
    `paddingGranularity`*: uint32
    `flags`*: uint32
    `totalFrames`*: uint32
    `initialFrames`*: uint32
    `streams`*: uint32
    `suggestedBufferSize`*: uint32
    `width`*: uint32
    `height`*: uint32
    `reserved`*: seq[byte]
    `parent`*: Avi_Block
  Avi_Block* = ref object of KaitaiStruct
    `fourCc`*: Avi_ChunkType
    `blockSize`*: uint32
    `data`*: KaitaiStruct
    `parent`*: Avi_Blocks
    `rawData`*: seq[byte]
  Avi_StrhBody* = ref object of KaitaiStruct
    `fccType`*: Avi_StreamType
    `fccHandler`*: Avi_HandlerType
    `flags`*: uint32
    `priority`*: uint16
    `language`*: uint16
    `initialFrames`*: uint32
    `scale`*: uint32
    `rate`*: uint32
    `start`*: uint32
    `length`*: uint32
    `suggestedBufferSize`*: uint32
    `quality`*: uint32
    `sampleSize`*: uint32
    `frame`*: Avi_Rect
    `parent`*: Avi_Block
  Avi_StrfBody* = ref object of KaitaiStruct
    `parent`*: KaitaiStruct

proc read*(_: typedesc[Avi], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Avi
proc read*(_: typedesc[Avi_ListBody], io: KaitaiStream, root: KaitaiStruct, parent: Avi_Block): Avi_ListBody
proc read*(_: typedesc[Avi_Rect], io: KaitaiStream, root: KaitaiStruct, parent: Avi_StrhBody): Avi_Rect
proc read*(_: typedesc[Avi_Blocks], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Avi_Blocks
proc read*(_: typedesc[Avi_AvihBody], io: KaitaiStream, root: KaitaiStruct, parent: Avi_Block): Avi_AvihBody
proc read*(_: typedesc[Avi_Block], io: KaitaiStream, root: KaitaiStruct, parent: Avi_Blocks): Avi_Block
proc read*(_: typedesc[Avi_StrhBody], io: KaitaiStream, root: KaitaiStruct, parent: Avi_Block): Avi_StrhBody
proc read*(_: typedesc[Avi_StrfBody], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Avi_StrfBody



##[
@see <a href="https://docs.microsoft.com/en-us/previous-versions/ms779636(v=vs.85)">Source</a>
]##
proc read*(_: typedesc[Avi], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Avi =
  template this: untyped = result
  this = new(Avi)
  let root = if root == nil: cast[Avi](this) else: cast[Avi](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magic1Expr = this.io.readBytes(int(4))
  this.magic1 = magic1Expr
  let fileSizeExpr = this.io.readU4le()
  this.fileSize = fileSizeExpr
  let magic2Expr = this.io.readBytes(int(4))
  this.magic2 = magic2Expr
  let rawDataExpr = this.io.readBytes(int((this.fileSize - 4)))
  this.rawData = rawDataExpr
  let rawDataIo = newKaitaiStream(rawDataExpr)
  let dataExpr = Avi_Blocks.read(rawDataIo, this.root, this)
  this.data = dataExpr

proc fromFile*(_: typedesc[Avi], filename: string): Avi =
  Avi.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Avi_ListBody], io: KaitaiStream, root: KaitaiStruct, parent: Avi_Block): Avi_ListBody =
  template this: untyped = result
  this = new(Avi_ListBody)
  let root = if root == nil: cast[Avi](this) else: cast[Avi](root)
  this.io = io
  this.root = root
  this.parent = parent

  let listTypeExpr = Avi_ChunkType(this.io.readU4le())
  this.listType = listTypeExpr
  let dataExpr = Avi_Blocks.read(this.io, this.root, this)
  this.data = dataExpr

proc fromFile*(_: typedesc[Avi_ListBody], filename: string): Avi_ListBody =
  Avi_ListBody.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Avi_Rect], io: KaitaiStream, root: KaitaiStruct, parent: Avi_StrhBody): Avi_Rect =
  template this: untyped = result
  this = new(Avi_Rect)
  let root = if root == nil: cast[Avi](this) else: cast[Avi](root)
  this.io = io
  this.root = root
  this.parent = parent

  let leftExpr = this.io.readS2le()
  this.left = leftExpr
  let topExpr = this.io.readS2le()
  this.top = topExpr
  let rightExpr = this.io.readS2le()
  this.right = rightExpr
  let bottomExpr = this.io.readS2le()
  this.bottom = bottomExpr

proc fromFile*(_: typedesc[Avi_Rect], filename: string): Avi_Rect =
  Avi_Rect.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Avi_Blocks], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Avi_Blocks =
  template this: untyped = result
  this = new(Avi_Blocks)
  let root = if root == nil: cast[Avi](this) else: cast[Avi](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Avi_Block.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[Avi_Blocks], filename: string): Avi_Blocks =
  Avi_Blocks.read(newKaitaiFileStream(filename), nil, nil)


##[
Main header of an AVI file, defined as AVIMAINHEADER structure
@see <a href="https://docs.microsoft.com/en-us/previous-versions/ms779632(v=vs.85)">Source</a>
]##
proc read*(_: typedesc[Avi_AvihBody], io: KaitaiStream, root: KaitaiStruct, parent: Avi_Block): Avi_AvihBody =
  template this: untyped = result
  this = new(Avi_AvihBody)
  let root = if root == nil: cast[Avi](this) else: cast[Avi](root)
  this.io = io
  this.root = root
  this.parent = parent

  let microSecPerFrameExpr = this.io.readU4le()
  this.microSecPerFrame = microSecPerFrameExpr
  let maxBytesPerSecExpr = this.io.readU4le()
  this.maxBytesPerSec = maxBytesPerSecExpr
  let paddingGranularityExpr = this.io.readU4le()
  this.paddingGranularity = paddingGranularityExpr
  let flagsExpr = this.io.readU4le()
  this.flags = flagsExpr
  let totalFramesExpr = this.io.readU4le()
  this.totalFrames = totalFramesExpr
  let initialFramesExpr = this.io.readU4le()
  this.initialFrames = initialFramesExpr
  let streamsExpr = this.io.readU4le()
  this.streams = streamsExpr
  let suggestedBufferSizeExpr = this.io.readU4le()
  this.suggestedBufferSize = suggestedBufferSizeExpr
  let widthExpr = this.io.readU4le()
  this.width = widthExpr
  let heightExpr = this.io.readU4le()
  this.height = heightExpr
  let reservedExpr = this.io.readBytes(int(16))
  this.reserved = reservedExpr

proc fromFile*(_: typedesc[Avi_AvihBody], filename: string): Avi_AvihBody =
  Avi_AvihBody.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Avi_Block], io: KaitaiStream, root: KaitaiStruct, parent: Avi_Blocks): Avi_Block =
  template this: untyped = result
  this = new(Avi_Block)
  let root = if root == nil: cast[Avi](this) else: cast[Avi](root)
  this.io = io
  this.root = root
  this.parent = parent

  let fourCcExpr = Avi_ChunkType(this.io.readU4le())
  this.fourCc = fourCcExpr
  let blockSizeExpr = this.io.readU4le()
  this.blockSize = blockSizeExpr
  block:
    let on = this.fourCc
    if on == avi.list:
      let rawDataExpr = this.io.readBytes(int(this.blockSize))
      this.rawData = rawDataExpr
      let rawDataIo = newKaitaiStream(rawDataExpr)
      let dataExpr = Avi_ListBody.read(rawDataIo, this.root, this)
      this.data = dataExpr
    elif on == avi.avih:
      let rawDataExpr = this.io.readBytes(int(this.blockSize))
      this.rawData = rawDataExpr
      let rawDataIo = newKaitaiStream(rawDataExpr)
      let dataExpr = Avi_AvihBody.read(rawDataIo, this.root, this)
      this.data = dataExpr
    elif on == avi.strh:
      let rawDataExpr = this.io.readBytes(int(this.blockSize))
      this.rawData = rawDataExpr
      let rawDataIo = newKaitaiStream(rawDataExpr)
      let dataExpr = Avi_StrhBody.read(rawDataIo, this.root, this)
      this.data = dataExpr
    else:
      let dataExpr = this.io.readBytes(int(this.blockSize))
      this.data = dataExpr

proc fromFile*(_: typedesc[Avi_Block], filename: string): Avi_Block =
  Avi_Block.read(newKaitaiFileStream(filename), nil, nil)


##[
Stream header (one header per stream), defined as AVISTREAMHEADER structure
@see <a href="https://docs.microsoft.com/en-us/previous-versions/ms779638(v=vs.85)">Source</a>
]##
proc read*(_: typedesc[Avi_StrhBody], io: KaitaiStream, root: KaitaiStruct, parent: Avi_Block): Avi_StrhBody =
  template this: untyped = result
  this = new(Avi_StrhBody)
  let root = if root == nil: cast[Avi](this) else: cast[Avi](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Type of the data contained in the stream
  ]##
  let fccTypeExpr = Avi_StreamType(this.io.readU4le())
  this.fccType = fccTypeExpr

  ##[
  Type of preferred data handler for the stream (specifies codec for audio / video streams)
  ]##
  let fccHandlerExpr = Avi_HandlerType(this.io.readU4le())
  this.fccHandler = fccHandlerExpr
  let flagsExpr = this.io.readU4le()
  this.flags = flagsExpr
  let priorityExpr = this.io.readU2le()
  this.priority = priorityExpr
  let languageExpr = this.io.readU2le()
  this.language = languageExpr
  let initialFramesExpr = this.io.readU4le()
  this.initialFrames = initialFramesExpr
  let scaleExpr = this.io.readU4le()
  this.scale = scaleExpr
  let rateExpr = this.io.readU4le()
  this.rate = rateExpr
  let startExpr = this.io.readU4le()
  this.start = startExpr
  let lengthExpr = this.io.readU4le()
  this.length = lengthExpr
  let suggestedBufferSizeExpr = this.io.readU4le()
  this.suggestedBufferSize = suggestedBufferSizeExpr
  let qualityExpr = this.io.readU4le()
  this.quality = qualityExpr
  let sampleSizeExpr = this.io.readU4le()
  this.sampleSize = sampleSizeExpr
  let frameExpr = Avi_Rect.read(this.io, this.root, this)
  this.frame = frameExpr

proc fromFile*(_: typedesc[Avi_StrhBody], filename: string): Avi_StrhBody =
  Avi_StrhBody.read(newKaitaiFileStream(filename), nil, nil)


##[
Stream format description
]##
proc read*(_: typedesc[Avi_StrfBody], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Avi_StrfBody =
  template this: untyped = result
  this = new(Avi_StrfBody)
  let root = if root == nil: cast[Avi](this) else: cast[Avi](root)
  this.io = io
  this.root = root
  this.parent = parent


proc fromFile*(_: typedesc[Avi_StrfBody], filename: string): Avi_StrfBody =
  Avi_StrfBody.read(newKaitaiFileStream(filename), nil, nil)


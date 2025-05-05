import kaitai_struct_nim_runtime
import options

type
  Vp8DuckIvf* = ref object of KaitaiStruct
    `magic1`*: seq[byte]
    `version`*: uint16
    `lenHeader`*: uint16
    `codec`*: seq[byte]
    `width`*: uint16
    `height`*: uint16
    `framerate`*: uint32
    `timescale`*: uint32
    `numFrames`*: uint32
    `unused`*: uint32
    `imageData`*: seq[Vp8DuckIvf_Blocks]
    `parent`*: KaitaiStruct
  Vp8DuckIvf_Blocks* = ref object of KaitaiStruct
    `entries`*: Vp8DuckIvf_Block
    `parent`*: Vp8DuckIvf
  Vp8DuckIvf_Block* = ref object of KaitaiStruct
    `lenFrame`*: uint32
    `timestamp`*: uint64
    `framedata`*: seq[byte]
    `parent`*: Vp8DuckIvf_Blocks

proc read*(_: typedesc[Vp8DuckIvf], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Vp8DuckIvf
proc read*(_: typedesc[Vp8DuckIvf_Blocks], io: KaitaiStream, root: KaitaiStruct, parent: Vp8DuckIvf): Vp8DuckIvf_Blocks
proc read*(_: typedesc[Vp8DuckIvf_Block], io: KaitaiStream, root: KaitaiStruct, parent: Vp8DuckIvf_Blocks): Vp8DuckIvf_Block



##[
Duck IVF is a simple container format for raw VP8 data, which is an open and
royalty-free video compression format, currently developed by Google.

Test .ivf files are available at
<https://chromium.googlesource.com/webm/vp8-test-vectors>

@see <a href="https://wiki.multimedia.cx/index.php/Duck_IVF">Source</a>
]##
proc read*(_: typedesc[Vp8DuckIvf], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Vp8DuckIvf =
  template this: untyped = result
  this = new(Vp8DuckIvf)
  let root = if root == nil: cast[Vp8DuckIvf](this) else: cast[Vp8DuckIvf](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Magic Number of IVF Files
  ]##
  let magic1Expr = this.io.readBytes(int(4))
  this.magic1 = magic1Expr

  ##[
  This should be 0
  ]##
  let versionExpr = this.io.readU2le()
  this.version = versionExpr

  ##[
  Normally the header length is 32 byte
  ]##
  let lenHeaderExpr = this.io.readU2le()
  this.lenHeader = lenHeaderExpr

  ##[
  Name of the codec e.g. 'VP80' for VP8
  ]##
  let codecExpr = this.io.readBytes(int(4))
  this.codec = codecExpr

  ##[
  The (initial) width of the video, every keyframe may change the resolution
  ]##
  let widthExpr = this.io.readU2le()
  this.width = widthExpr

  ##[
  The (initial) height of the video, every keyframe may change the resolution
  ]##
  let heightExpr = this.io.readU2le()
  this.height = heightExpr

  ##[
  the (framerate * timescale) e.g. for 30 fps -> 30000
  ]##
  let framerateExpr = this.io.readU4le()
  this.framerate = framerateExpr

  ##[
  the timescale is a divider of the seconds (VPX is integer math only) mostly 1000
  ]##
  let timescaleExpr = this.io.readU4le()
  this.timescale = timescaleExpr

  ##[
  the number of frames (if not a camera stream)
  ]##
  let numFramesExpr = this.io.readU4le()
  this.numFrames = numFramesExpr
  let unusedExpr = this.io.readU4le()
  this.unused = unusedExpr
  for i in 0 ..< int(this.numFrames):
    let it = Vp8DuckIvf_Blocks.read(this.io, this.root, this)
    this.imageData.add(it)

proc fromFile*(_: typedesc[Vp8DuckIvf], filename: string): Vp8DuckIvf =
  Vp8DuckIvf.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Vp8DuckIvf_Blocks], io: KaitaiStream, root: KaitaiStruct, parent: Vp8DuckIvf): Vp8DuckIvf_Blocks =
  template this: untyped = result
  this = new(Vp8DuckIvf_Blocks)
  let root = if root == nil: cast[Vp8DuckIvf](this) else: cast[Vp8DuckIvf](root)
  this.io = io
  this.root = root
  this.parent = parent

  let entriesExpr = Vp8DuckIvf_Block.read(this.io, this.root, this)
  this.entries = entriesExpr

proc fromFile*(_: typedesc[Vp8DuckIvf_Blocks], filename: string): Vp8DuckIvf_Blocks =
  Vp8DuckIvf_Blocks.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Vp8DuckIvf_Block], io: KaitaiStream, root: KaitaiStruct, parent: Vp8DuckIvf_Blocks): Vp8DuckIvf_Block =
  template this: untyped = result
  this = new(Vp8DuckIvf_Block)
  let root = if root == nil: cast[Vp8DuckIvf](this) else: cast[Vp8DuckIvf](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  size of the frame data
  ]##
  let lenFrameExpr = this.io.readU4le()
  this.lenFrame = lenFrameExpr
  let timestampExpr = this.io.readU8le()
  this.timestamp = timestampExpr
  let framedataExpr = this.io.readBytes(int(this.lenFrame))
  this.framedata = framedataExpr

proc fromFile*(_: typedesc[Vp8DuckIvf_Block], filename: string): Vp8DuckIvf_Block =
  Vp8DuckIvf_Block.read(newKaitaiFileStream(filename), nil, nil)


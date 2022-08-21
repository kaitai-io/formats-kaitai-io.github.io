import kaitai_struct_nim_runtime
import options

type
  QuakeMdl* = ref object of KaitaiStruct
    `header`*: QuakeMdl_MdlHeader
    `skins`*: seq[QuakeMdl_MdlSkin]
    `textureCoordinates`*: seq[QuakeMdl_MdlTexcoord]
    `triangles`*: seq[QuakeMdl_MdlTriangle]
    `frames`*: seq[QuakeMdl_MdlFrame]
    `parent`*: KaitaiStruct
  QuakeMdl_MdlVertex* = ref object of KaitaiStruct
    `values`*: seq[uint8]
    `normalIndex`*: uint8
    `parent`*: KaitaiStruct
  QuakeMdl_MdlTexcoord* = ref object of KaitaiStruct
    `onSeam`*: int32
    `s`*: int32
    `t`*: int32
    `parent`*: QuakeMdl
  QuakeMdl_MdlHeader* = ref object of KaitaiStruct
    `ident`*: seq[byte]
    `version`*: int32
    `scale`*: QuakeMdl_Vec3
    `origin`*: QuakeMdl_Vec3
    `radius`*: float32
    `eyePosition`*: QuakeMdl_Vec3
    `numSkins`*: int32
    `skinWidth`*: int32
    `skinHeight`*: int32
    `numVerts`*: int32
    `numTris`*: int32
    `numFrames`*: int32
    `synctype`*: int32
    `flags`*: int32
    `size`*: float32
    `parent`*: QuakeMdl
    `skinSizeInst`: int
    `skinSizeInstFlag`: bool
  QuakeMdl_MdlSkin* = ref object of KaitaiStruct
    `group`*: int32
    `singleTextureData`*: seq[byte]
    `numFrames`*: uint32
    `frameTimes`*: seq[float32]
    `groupTextureData`*: seq[seq[byte]]
    `parent`*: QuakeMdl
  QuakeMdl_MdlFrame* = ref object of KaitaiStruct
    `type`*: int32
    `min`*: QuakeMdl_MdlVertex
    `max`*: QuakeMdl_MdlVertex
    `time`*: seq[float32]
    `frames`*: seq[QuakeMdl_MdlSimpleFrame]
    `parent`*: QuakeMdl
    `numSimpleFramesInst`: int32
    `numSimpleFramesInstFlag`: bool
  QuakeMdl_MdlSimpleFrame* = ref object of KaitaiStruct
    `bboxMin`*: QuakeMdl_MdlVertex
    `bboxMax`*: QuakeMdl_MdlVertex
    `name`*: string
    `vertices`*: seq[QuakeMdl_MdlVertex]
    `parent`*: QuakeMdl_MdlFrame
  QuakeMdl_MdlTriangle* = ref object of KaitaiStruct
    `facesFront`*: int32
    `vertices`*: seq[int32]
    `parent`*: QuakeMdl
  QuakeMdl_Vec3* = ref object of KaitaiStruct
    `x`*: float32
    `y`*: float32
    `z`*: float32
    `parent`*: QuakeMdl_MdlHeader

proc read*(_: typedesc[QuakeMdl], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): QuakeMdl
proc read*(_: typedesc[QuakeMdl_MdlVertex], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): QuakeMdl_MdlVertex
proc read*(_: typedesc[QuakeMdl_MdlTexcoord], io: KaitaiStream, root: KaitaiStruct, parent: QuakeMdl): QuakeMdl_MdlTexcoord
proc read*(_: typedesc[QuakeMdl_MdlHeader], io: KaitaiStream, root: KaitaiStruct, parent: QuakeMdl): QuakeMdl_MdlHeader
proc read*(_: typedesc[QuakeMdl_MdlSkin], io: KaitaiStream, root: KaitaiStruct, parent: QuakeMdl): QuakeMdl_MdlSkin
proc read*(_: typedesc[QuakeMdl_MdlFrame], io: KaitaiStream, root: KaitaiStruct, parent: QuakeMdl): QuakeMdl_MdlFrame
proc read*(_: typedesc[QuakeMdl_MdlSimpleFrame], io: KaitaiStream, root: KaitaiStruct, parent: QuakeMdl_MdlFrame): QuakeMdl_MdlSimpleFrame
proc read*(_: typedesc[QuakeMdl_MdlTriangle], io: KaitaiStream, root: KaitaiStruct, parent: QuakeMdl): QuakeMdl_MdlTriangle
proc read*(_: typedesc[QuakeMdl_Vec3], io: KaitaiStream, root: KaitaiStruct, parent: QuakeMdl_MdlHeader): QuakeMdl_Vec3

proc skinSize*(this: QuakeMdl_MdlHeader): int
proc numSimpleFrames*(this: QuakeMdl_MdlFrame): int32


##[
Quake 1 model format is used to store 3D models completely with
textures and animations used in the game. Quake 1 engine
(retroactively named "idtech2") is a popular 3D engine first used
for Quake game by id Software in 1996.

Model is constructed traditionally from vertices in 3D space, faces
which connect vertices, textures ("skins", i.e. 2D bitmaps) and
texture UV mapping information. As opposed to more modern,
bones-based animation formats, Quake model was animated by changing
locations of all vertices it included in 3D space, frame by frame.

File format stores:

* "Skins" — effectively 2D bitmaps which will be used as a
  texture. Every model can have multiple skins — e.g. these can be
  switched to depict various levels of damage to the
  monsters. Bitmaps are 8-bit-per-pixel, indexed in global Quake
  palette, subject to lighting and gamma adjustment when rendering
  in the game using colormap technique.
* "Texture coordinates" — UV coordinates, mapping 3D vertices to
  skin coordinates.
* "Triangles" — triangular faces connecting 3D vertices.
* "Frames" — locations of vertices in 3D space; can include more
  than one frame, thus allowing representation of different frames
  for animation purposes.

Originally, 3D geometry for models for Quake was designed in [Alias
PowerAnimator](https://en.wikipedia.org/wiki/PowerAnimator),
precursor of modern day Autodesk Maya and Autodesk Alias. Therefore,
3D-related part of Quake model format followed closely Alias TRI
format, and Quake development utilities included a converter from Alias
TRI (`modelgen`).

Skins (textures) where prepared as LBM bitmaps with the help from
`texmap` utility in the same development utilities toolkit.

]##
proc read*(_: typedesc[QuakeMdl], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): QuakeMdl =
  template this: untyped = result
  this = new(QuakeMdl)
  let root = if root == nil: cast[QuakeMdl](this) else: cast[QuakeMdl](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = QuakeMdl_MdlHeader.read(this.io, this.root, this)
  this.header = headerExpr
  for i in 0 ..< int(this.header.numSkins):
    let it = QuakeMdl_MdlSkin.read(this.io, this.root, this)
    this.skins.add(it)
  for i in 0 ..< int(this.header.numVerts):
    let it = QuakeMdl_MdlTexcoord.read(this.io, this.root, this)
    this.textureCoordinates.add(it)
  for i in 0 ..< int(this.header.numTris):
    let it = QuakeMdl_MdlTriangle.read(this.io, this.root, this)
    this.triangles.add(it)
  for i in 0 ..< int(this.header.numFrames):
    let it = QuakeMdl_MdlFrame.read(this.io, this.root, this)
    this.frames.add(it)

proc fromFile*(_: typedesc[QuakeMdl], filename: string): QuakeMdl =
  QuakeMdl.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[QuakeMdl_MdlVertex], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): QuakeMdl_MdlVertex =
  template this: untyped = result
  this = new(QuakeMdl_MdlVertex)
  let root = if root == nil: cast[QuakeMdl](this) else: cast[QuakeMdl](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int(3):
    let it = this.io.readU1()
    this.values.add(it)
  let normalIndexExpr = this.io.readU1()
  this.normalIndex = normalIndexExpr

proc fromFile*(_: typedesc[QuakeMdl_MdlVertex], filename: string): QuakeMdl_MdlVertex =
  QuakeMdl_MdlVertex.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L79-L83">Source</a>
@see <a href="https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD2">Source</a>
]##
proc read*(_: typedesc[QuakeMdl_MdlTexcoord], io: KaitaiStream, root: KaitaiStruct, parent: QuakeMdl): QuakeMdl_MdlTexcoord =
  template this: untyped = result
  this = new(QuakeMdl_MdlTexcoord)
  let root = if root == nil: cast[QuakeMdl](this) else: cast[QuakeMdl](root)
  this.io = io
  this.root = root
  this.parent = parent

  let onSeamExpr = this.io.readS4le()
  this.onSeam = onSeamExpr
  let sExpr = this.io.readS4le()
  this.s = sExpr
  let tExpr = this.io.readS4le()
  this.t = tExpr

proc fromFile*(_: typedesc[QuakeMdl_MdlTexcoord], filename: string): QuakeMdl_MdlTexcoord =
  QuakeMdl_MdlTexcoord.read(newKaitaiFileStream(filename), nil, nil)


##[
@see <a href="https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L59-L75">Source</a>
@see <a href="https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD0">Source</a>
]##
proc read*(_: typedesc[QuakeMdl_MdlHeader], io: KaitaiStream, root: KaitaiStruct, parent: QuakeMdl): QuakeMdl_MdlHeader =
  template this: untyped = result
  this = new(QuakeMdl_MdlHeader)
  let root = if root == nil: cast[QuakeMdl](this) else: cast[QuakeMdl](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Magic signature bytes that every Quake model must
have. "IDPO" is short for "IDPOLYHEADER".

  @see <a href="https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L132-L133">Source</a>
  ]##
  let identExpr = this.io.readBytes(int(4))
  this.ident = identExpr
  let versionExpr = this.io.readS4le()
  this.version = versionExpr

  ##[
  Global scaling factors in 3 dimensions for whole model. When
represented in 3D world, this model local coordinates will
be multiplied by these factors.

  ]##
  let scaleExpr = QuakeMdl_Vec3.read(this.io, this.root, this)
  this.scale = scaleExpr
  let originExpr = QuakeMdl_Vec3.read(this.io, this.root, this)
  this.origin = originExpr
  let radiusExpr = this.io.readF4le()
  this.radius = radiusExpr
  let eyePositionExpr = QuakeMdl_Vec3.read(this.io, this.root, this)
  this.eyePosition = eyePositionExpr

  ##[
  Number of skins (=texture bitmaps) included in this model.

  ]##
  let numSkinsExpr = this.io.readS4le()
  this.numSkins = numSkinsExpr

  ##[
  Width (U coordinate max) of every skin (=texture) in pixels.

  ]##
  let skinWidthExpr = this.io.readS4le()
  this.skinWidth = skinWidthExpr

  ##[
  Height (V coordinate max) of every skin (=texture) in
pixels.

  ]##
  let skinHeightExpr = this.io.readS4le()
  this.skinHeight = skinHeightExpr

  ##[
  Number of vertices in this model. Note that this is constant
for all the animation frames and all textures.

  ]##
  let numVertsExpr = this.io.readS4le()
  this.numVerts = numVertsExpr

  ##[
  Number of triangles (=triangular faces) in this model.

  ]##
  let numTrisExpr = this.io.readS4le()
  this.numTris = numTrisExpr

  ##[
  Number of animation frames included in this model.

  ]##
  let numFramesExpr = this.io.readS4le()
  this.numFrames = numFramesExpr
  let synctypeExpr = this.io.readS4le()
  this.synctype = synctypeExpr
  let flagsExpr = this.io.readS4le()
  this.flags = flagsExpr
  let sizeExpr = this.io.readF4le()
  this.size = sizeExpr

proc skinSize(this: QuakeMdl_MdlHeader): int = 

  ##[
  Skin size in pixels.

  ]##
  if this.skinSizeInstFlag:
    return this.skinSizeInst
  let skinSizeInstExpr = int((this.skinWidth * this.skinHeight))
  this.skinSizeInst = skinSizeInstExpr
  this.skinSizeInstFlag = true
  return this.skinSizeInst

proc fromFile*(_: typedesc[QuakeMdl_MdlHeader], filename: string): QuakeMdl_MdlHeader =
  QuakeMdl_MdlHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[QuakeMdl_MdlSkin], io: KaitaiStream, root: KaitaiStruct, parent: QuakeMdl): QuakeMdl_MdlSkin =
  template this: untyped = result
  this = new(QuakeMdl_MdlSkin)
  let root = if root == nil: cast[QuakeMdl](this) else: cast[QuakeMdl](root)
  this.io = io
  this.root = root
  this.parent = parent

  let groupExpr = this.io.readS4le()
  this.group = groupExpr
  if this.group == 0:
    let singleTextureDataExpr = this.io.readBytes(int(QuakeMdl(this.root).header.skinSize))
    this.singleTextureData = singleTextureDataExpr
  if this.group != 0:
    let numFramesExpr = this.io.readU4le()
    this.numFrames = numFramesExpr
  if this.group != 0:
    for i in 0 ..< int(this.numFrames):
      let it = this.io.readF4le()
      this.frameTimes.add(it)
  if this.group != 0:
    for i in 0 ..< int(this.numFrames):
      let it = this.io.readBytes(int(QuakeMdl(this.root).header.skinSize))
      this.groupTextureData.add(it)

proc fromFile*(_: typedesc[QuakeMdl_MdlSkin], filename: string): QuakeMdl_MdlSkin =
  QuakeMdl_MdlSkin.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[QuakeMdl_MdlFrame], io: KaitaiStream, root: KaitaiStruct, parent: QuakeMdl): QuakeMdl_MdlFrame =
  template this: untyped = result
  this = new(QuakeMdl_MdlFrame)
  let root = if root == nil: cast[QuakeMdl](this) else: cast[QuakeMdl](root)
  this.io = io
  this.root = root
  this.parent = parent

  let typeExpr = this.io.readS4le()
  this.type = typeExpr
  if this.type != 0:
    let minExpr = QuakeMdl_MdlVertex.read(this.io, this.root, this)
    this.min = minExpr
  if this.type != 0:
    let maxExpr = QuakeMdl_MdlVertex.read(this.io, this.root, this)
    this.max = maxExpr
  if this.type != 0:
    for i in 0 ..< int(this.type):
      let it = this.io.readF4le()
      this.time.add(it)
  for i in 0 ..< int(this.numSimpleFrames):
    let it = QuakeMdl_MdlSimpleFrame.read(this.io, this.root, this)
    this.frames.add(it)

proc numSimpleFrames(this: QuakeMdl_MdlFrame): int32 = 
  if this.numSimpleFramesInstFlag:
    return this.numSimpleFramesInst
  let numSimpleFramesInstExpr = int32((if this.type == 0: 1 else: this.type))
  this.numSimpleFramesInst = numSimpleFramesInstExpr
  this.numSimpleFramesInstFlag = true
  return this.numSimpleFramesInst

proc fromFile*(_: typedesc[QuakeMdl_MdlFrame], filename: string): QuakeMdl_MdlFrame =
  QuakeMdl_MdlFrame.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[QuakeMdl_MdlSimpleFrame], io: KaitaiStream, root: KaitaiStruct, parent: QuakeMdl_MdlFrame): QuakeMdl_MdlSimpleFrame =
  template this: untyped = result
  this = new(QuakeMdl_MdlSimpleFrame)
  let root = if root == nil: cast[QuakeMdl](this) else: cast[QuakeMdl](root)
  this.io = io
  this.root = root
  this.parent = parent

  let bboxMinExpr = QuakeMdl_MdlVertex.read(this.io, this.root, this)
  this.bboxMin = bboxMinExpr
  let bboxMaxExpr = QuakeMdl_MdlVertex.read(this.io, this.root, this)
  this.bboxMax = bboxMaxExpr
  let nameExpr = encode(this.io.readBytes(int(16)).bytesStripRight(0).bytesTerminate(0, false), "ASCII")
  this.name = nameExpr
  for i in 0 ..< int(QuakeMdl(this.root).header.numVerts):
    let it = QuakeMdl_MdlVertex.read(this.io, this.root, this)
    this.vertices.add(it)

proc fromFile*(_: typedesc[QuakeMdl_MdlSimpleFrame], filename: string): QuakeMdl_MdlSimpleFrame =
  QuakeMdl_MdlSimpleFrame.read(newKaitaiFileStream(filename), nil, nil)


##[
Represents a triangular face, connecting 3 vertices, referenced
by their indexes.

@see <a href="https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L85-L88">Source</a>
@see <a href="https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD3">Source</a>
]##
proc read*(_: typedesc[QuakeMdl_MdlTriangle], io: KaitaiStream, root: KaitaiStruct, parent: QuakeMdl): QuakeMdl_MdlTriangle =
  template this: untyped = result
  this = new(QuakeMdl_MdlTriangle)
  let root = if root == nil: cast[QuakeMdl](this) else: cast[QuakeMdl](root)
  this.io = io
  this.root = root
  this.parent = parent

  let facesFrontExpr = this.io.readS4le()
  this.facesFront = facesFrontExpr
  for i in 0 ..< int(3):
    let it = this.io.readS4le()
    this.vertices.add(it)

proc fromFile*(_: typedesc[QuakeMdl_MdlTriangle], filename: string): QuakeMdl_MdlTriangle =
  QuakeMdl_MdlTriangle.read(newKaitaiFileStream(filename), nil, nil)


##[
Basic 3D vector (x, y, z) using single-precision floating point
coordnates. Can be used to specify a point in 3D space,
direction, scaling factor, etc.

]##
proc read*(_: typedesc[QuakeMdl_Vec3], io: KaitaiStream, root: KaitaiStruct, parent: QuakeMdl_MdlHeader): QuakeMdl_Vec3 =
  template this: untyped = result
  this = new(QuakeMdl_Vec3)
  let root = if root == nil: cast[QuakeMdl](this) else: cast[QuakeMdl](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xExpr = this.io.readF4le()
  this.x = xExpr
  let yExpr = this.io.readF4le()
  this.y = yExpr
  let zExpr = this.io.readF4le()
  this.z = zExpr

proc fromFile*(_: typedesc[QuakeMdl_Vec3], filename: string): QuakeMdl_Vec3 =
  QuakeMdl_Vec3.read(newKaitaiFileStream(filename), nil, nil)


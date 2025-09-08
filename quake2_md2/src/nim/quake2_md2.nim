import kaitai_struct_nim_runtime
import options

type
  Quake2Md2* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `version`*: uint32
    `skinWidthPx`*: uint32
    `skinHeightPx`*: uint32
    `bytesPerFrame`*: uint32
    `numSkins`*: uint32
    `verticesPerFrame`*: uint32
    `numTexCoords`*: uint32
    `numTriangles`*: uint32
    `numGlCmds`*: uint32
    `numFrames`*: uint32
    `ofsSkins`*: uint32
    `ofsTexCoords`*: uint32
    `ofsTriangles`*: uint32
    `ofsFrames`*: uint32
    `ofsGlCmds`*: uint32
    `ofsEof`*: uint32
    `parent`*: KaitaiStruct
    `rawFramesInst`*: seq[seq[byte]]
    `rawGlCmdsInst`*: seq[byte]
    `animNamesInst`: seq[string]
    `animNamesInstFlag`: bool
    `animNumFramesInst`: seq[byte]
    `animNumFramesInstFlag`: bool
    `animStartIndicesInst`: seq[byte]
    `animStartIndicesInstFlag`: bool
    `anormsTableInst`: seq[seq[float64]]
    `anormsTableInstFlag`: bool
    `framesInst`: seq[Quake2Md2_Frame]
    `framesInstFlag`: bool
    `glCmdsInst`: Quake2Md2_GlCmdsList
    `glCmdsInstFlag`: bool
    `skinsInst`: seq[string]
    `skinsInstFlag`: bool
    `texCoordsInst`: seq[Quake2Md2_TexPoint]
    `texCoordsInstFlag`: bool
    `trianglesInst`: seq[Quake2Md2_Triangle]
    `trianglesInstFlag`: bool
  Quake2Md2_GlPrimitive* = enum
    triangle_strip = 0
    triangle_fan = 1
  Quake2Md2_CompressedVec* = ref object of KaitaiStruct
    `xCompressed`*: uint8
    `yCompressed`*: uint8
    `zCompressed`*: uint8
    `parent`*: Quake2Md2_Vertex
    `xInst`: float64
    `xInstFlag`: bool
    `yInst`: float64
    `yInstFlag`: bool
    `zInst`: float64
    `zInstFlag`: bool
  Quake2Md2_Frame* = ref object of KaitaiStruct
    `scale`*: Quake2Md2_Vec3f
    `translate`*: Quake2Md2_Vec3f
    `name`*: string
    `vertices`*: seq[Quake2Md2_Vertex]
    `parent`*: Quake2Md2
  Quake2Md2_GlCmd* = ref object of KaitaiStruct
    `cmdNumVertices`*: int32
    `vertices`*: seq[Quake2Md2_GlVertex]
    `parent`*: Quake2Md2_GlCmdsList
    `numVerticesInst`: int
    `numVerticesInstFlag`: bool
    `primitiveInst`: Quake2Md2_GlPrimitive
    `primitiveInstFlag`: bool
  Quake2Md2_GlCmdsList* = ref object of KaitaiStruct
    `items`*: seq[Quake2Md2_GlCmd]
    `parent`*: Quake2Md2
  Quake2Md2_GlVertex* = ref object of KaitaiStruct
    `texCoordsNormalized`*: seq[float32]
    `vertexIndex`*: uint32
    `parent`*: Quake2Md2_GlCmd
  Quake2Md2_TexPoint* = ref object of KaitaiStruct
    `sPx`*: uint16
    `tPx`*: uint16
    `parent`*: Quake2Md2
    `sNormalizedInst`: float64
    `sNormalizedInstFlag`: bool
    `tNormalizedInst`: float64
    `tNormalizedInstFlag`: bool
  Quake2Md2_Triangle* = ref object of KaitaiStruct
    `vertexIndices`*: seq[uint16]
    `texPointIndices`*: seq[uint16]
    `parent`*: Quake2Md2
  Quake2Md2_Vec3f* = ref object of KaitaiStruct
    `x`*: float32
    `y`*: float32
    `z`*: float32
    `parent`*: Quake2Md2_Frame
  Quake2Md2_Vertex* = ref object of KaitaiStruct
    `position`*: Quake2Md2_CompressedVec
    `normalIndex`*: uint8
    `parent`*: Quake2Md2_Frame
    `normalInst`: seq[float64]
    `normalInstFlag`: bool

proc read*(_: typedesc[Quake2Md2], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Quake2Md2
proc read*(_: typedesc[Quake2Md2_CompressedVec], io: KaitaiStream, root: KaitaiStruct, parent: Quake2Md2_Vertex): Quake2Md2_CompressedVec
proc read*(_: typedesc[Quake2Md2_Frame], io: KaitaiStream, root: KaitaiStruct, parent: Quake2Md2): Quake2Md2_Frame
proc read*(_: typedesc[Quake2Md2_GlCmd], io: KaitaiStream, root: KaitaiStruct, parent: Quake2Md2_GlCmdsList): Quake2Md2_GlCmd
proc read*(_: typedesc[Quake2Md2_GlCmdsList], io: KaitaiStream, root: KaitaiStruct, parent: Quake2Md2): Quake2Md2_GlCmdsList
proc read*(_: typedesc[Quake2Md2_GlVertex], io: KaitaiStream, root: KaitaiStruct, parent: Quake2Md2_GlCmd): Quake2Md2_GlVertex
proc read*(_: typedesc[Quake2Md2_TexPoint], io: KaitaiStream, root: KaitaiStruct, parent: Quake2Md2): Quake2Md2_TexPoint
proc read*(_: typedesc[Quake2Md2_Triangle], io: KaitaiStream, root: KaitaiStruct, parent: Quake2Md2): Quake2Md2_Triangle
proc read*(_: typedesc[Quake2Md2_Vec3f], io: KaitaiStream, root: KaitaiStruct, parent: Quake2Md2_Frame): Quake2Md2_Vec3f
proc read*(_: typedesc[Quake2Md2_Vertex], io: KaitaiStream, root: KaitaiStruct, parent: Quake2Md2_Frame): Quake2Md2_Vertex

proc animNames*(this: Quake2Md2): seq[string]
proc animNumFrames*(this: Quake2Md2): seq[byte]
proc animStartIndices*(this: Quake2Md2): seq[byte]
proc anormsTable*(this: Quake2Md2): seq[seq[float64]]
proc frames*(this: Quake2Md2): seq[Quake2Md2_Frame]
proc glCmds*(this: Quake2Md2): Quake2Md2_GlCmdsList
proc skins*(this: Quake2Md2): seq[string]
proc texCoords*(this: Quake2Md2): seq[Quake2Md2_TexPoint]
proc triangles*(this: Quake2Md2): seq[Quake2Md2_Triangle]
proc x*(this: Quake2Md2_CompressedVec): float64
proc y*(this: Quake2Md2_CompressedVec): float64
proc z*(this: Quake2Md2_CompressedVec): float64
proc numVertices*(this: Quake2Md2_GlCmd): int
proc primitive*(this: Quake2Md2_GlCmd): Quake2Md2_GlPrimitive
proc sNormalized*(this: Quake2Md2_TexPoint): float64
proc tNormalized*(this: Quake2Md2_TexPoint): float64
proc normal*(this: Quake2Md2_Vertex): seq[float64]


##[
The MD2 format is used for 3D animated models in id Sofware's Quake II.

A model consists of named `frames`, each with the same number of `vertices`
(`vertices_per_frame`). Each such vertex has a `position` and `normal` in
model space. Each vertex has the same topological "meaning" across frames, in
terms of triangle and texture info; it just varies in position and normal for
animation purposes.

How the vertices form triangles is defined via disjoint `triangles` or via
`gl_cmds` (which allows strip and fan topology). Each triangle contains three
`vertex_indices` into frame vertices, and three `tex_point_indices` into
global `tex_coords`. Each texture point has pixel coords `s_px` and `t_px`
ranging from 0 to `skin_{width,height}_px` respectively, along with
`{s,t}_normalized` ranging from 0 to 1 for your convenience.

A GL command has a `primitive` type (`TRIANGLE_FAN` or `TRIANGLE_STRIP`) along
with some `vertices`. Each GL vertex contains `tex_coords_normalized` from 0
to 1, and a `vertex_index` into frame vertices.

A model may also contain `skins`, which are just file paths to PCX images.
However, this is empty for many models, in which case it is up to the client
(e.g. Q2PRO) to offer skins some other way (e.g. by similar filename in the
current directory).

There are 198 `frames` in total, partitioned into a fixed set of ranges used
for different animations. Each frame has a standard `name` for humans, but the
client just uses their index and the name can be arbitrary. The name, start
frame index and frame count of each animation can be looked up in the arrays
`anim_names`, `anim_start_indices`, and `anim_num_frames` respectively. This
information is summarized in the following table:

```
|   INDEX  |    NAME | SUFFIX | NOTES                                                  |
|:--------:|--------:|:-------|:-------------------------------------------------------|
|    0-39  |   stand | 01-40  | Idle animation                                         |
|   40-45  |     run | 1-6    | Full run cycle                                         |
|   46-53  |  attack | 1-8    | Shoot, reload; some weapons just repeat 1st few frames |
|   54-57  |   pain1 | 01-04  | Q2Pro also uses this for switching weapons             |
|   58-61  |   pain2 | 01-04  |                                                        |
|   62-65  |   pain3 | 01-04  |                                                        |
|   66-71  |    jump | 1-6    | Starts at height and lands on feet                     |
|   72-83  |    flip | 01-12  | Flipoff, i.e. middle finger                            |
|   84-94  |  salute | 01-11  |                                                        |
|   95-111 |   taunt | 01-17  |                                                        |
|  112-122 |    wave | 01-11  | Q2Pro plays this backwards for a handgrenade toss      |
|  123-134 |   point | 01-12  |                                                        |
|  135-153 |  crstnd | 01-19  | Idle while crouching                                   |
|  154-159 |  crwalk | 1-6    |                                                        |
|  160-168 | crattak | 1-9    |                                                        |
|  169-172 |  crpain | 1-4    |                                                        |
|  173-177 | crdeath | 1-5    |                                                        |
|  178-183 |  death1 | 01-06  |                                                        |
|  184-189 |  death2 | 01-06  |                                                        |
|  190-197 |  death3 | 01-08  |                                                        |
```

The above are filled in for player models; for the separate weapon models,
the final frame is 173 "g_view" (unknown purpose) since weapons aren't shown
during death animations. `a_grenades.md2`, the handgrenade weapon model, is
the same except that the `wave` frames are blank (according to the default
female model files). This is likely due to its dual use as a grenade throw
animation where this model must leave the player's model.

@see <a href="https://icculus.org/~phaethon/q3a/formats/md2-schoenblum.html">Source</a>
@see <a href="http://tfc.duke.free.fr/coding/md2-specs-en.html">Source</a>
@see <a href="http://tastyspleen.net/~panjoo/downloads/quake2_model_frames.html">Source</a>
@see <a href="http://wiki.polycount.com/wiki/OldSiteResourcesQuake2FramesList">Source</a>
]##
proc read*(_: typedesc[Quake2Md2], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Quake2Md2 =
  template this: untyped = result
  this = new(Quake2Md2)
  let root = if root == nil: cast[Quake2Md2](this) else: cast[Quake2Md2](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(4))
  this.magic = magicExpr
  let versionExpr = this.io.readU4le()
  this.version = versionExpr
  let skinWidthPxExpr = this.io.readU4le()
  this.skinWidthPx = skinWidthPxExpr
  let skinHeightPxExpr = this.io.readU4le()
  this.skinHeightPx = skinHeightPxExpr
  let bytesPerFrameExpr = this.io.readU4le()
  this.bytesPerFrame = bytesPerFrameExpr
  let numSkinsExpr = this.io.readU4le()
  this.numSkins = numSkinsExpr
  let verticesPerFrameExpr = this.io.readU4le()
  this.verticesPerFrame = verticesPerFrameExpr
  let numTexCoordsExpr = this.io.readU4le()
  this.numTexCoords = numTexCoordsExpr
  let numTrianglesExpr = this.io.readU4le()
  this.numTriangles = numTrianglesExpr
  let numGlCmdsExpr = this.io.readU4le()
  this.numGlCmds = numGlCmdsExpr
  let numFramesExpr = this.io.readU4le()
  this.numFrames = numFramesExpr
  let ofsSkinsExpr = this.io.readU4le()
  this.ofsSkins = ofsSkinsExpr
  let ofsTexCoordsExpr = this.io.readU4le()
  this.ofsTexCoords = ofsTexCoordsExpr
  let ofsTrianglesExpr = this.io.readU4le()
  this.ofsTriangles = ofsTrianglesExpr
  let ofsFramesExpr = this.io.readU4le()
  this.ofsFrames = ofsFramesExpr
  let ofsGlCmdsExpr = this.io.readU4le()
  this.ofsGlCmds = ofsGlCmdsExpr
  let ofsEofExpr = this.io.readU4le()
  this.ofsEof = ofsEofExpr

proc animNames(this: Quake2Md2): seq[string] = 
  if this.animNamesInstFlag:
    return this.animNamesInst
  let animNamesInstExpr = seq[string](@[string("stand"), string("run"), string("attack"), string("pain1"), string("pain2"), string("pain3"), string("jump"), string("flip"), string("salute"), string("taunt"), string("wave"), string("point"), string("crstnd"), string("crwalk"), string("crattak"), string("crpain"), string("crdeath"), string("death1"), string("death2"), string("death3")])
  this.animNamesInst = animNamesInstExpr
  this.animNamesInstFlag = true
  return this.animNamesInst

proc animNumFrames(this: Quake2Md2): seq[byte] = 
  if this.animNumFramesInstFlag:
    return this.animNumFramesInst
  let animNumFramesInstExpr = seq[byte](@[40'u8, 6'u8, 8'u8, 4'u8, 4'u8, 4'u8, 6'u8, 12'u8, 11'u8, 17'u8, 11'u8, 12'u8, 19'u8, 6'u8, 9'u8, 4'u8, 5'u8, 6'u8, 6'u8, 8'u8])
  this.animNumFramesInst = animNumFramesInstExpr
  this.animNumFramesInstFlag = true
  return this.animNumFramesInst

proc animStartIndices(this: Quake2Md2): seq[byte] = 
  if this.animStartIndicesInstFlag:
    return this.animStartIndicesInst
  let animStartIndicesInstExpr = seq[byte](@[0'u8, 40'u8, 46'u8, 54'u8, 58'u8, 62'u8, 66'u8, 72'u8, 84'u8, 95'u8, 112'u8, 123'u8, 135'u8, 154'u8, 160'u8, 169'u8, 173'u8, 178'u8, 184'u8, 190'u8])
  this.animStartIndicesInst = animStartIndicesInstExpr
  this.animStartIndicesInstFlag = true
  return this.animStartIndicesInst

proc anormsTable(this: Quake2Md2): seq[seq[float64]] = 

  ##[
  @see <a href="https://github.com/skullernet/q2pro/blob/f4faabd/src/common/math.c#L80
from">Quake anorms.h</a>
  ]##
  if this.anormsTableInstFlag:
    return this.anormsTableInst
  let anormsTableInstExpr = seq[seq[float64]](@[seq[float64](@[float64(-0.525731), float64(0.000000), float64(0.850651)]), seq[float64](@[float64(-0.442863), float64(0.238856), float64(0.864188)]), seq[float64](@[float64(-0.295242), float64(0.000000), float64(0.955423)]), seq[float64](@[float64(-0.309017), float64(0.500000), float64(0.809017)]), seq[float64](@[float64(-0.162460), float64(0.262866), float64(0.951056)]), seq[float64](@[float64(0.000000), float64(0.000000), float64(1.000000)]), seq[float64](@[float64(0.000000), float64(0.850651), float64(0.525731)]), seq[float64](@[float64(-0.147621), float64(0.716567), float64(0.681718)]), seq[float64](@[float64(0.147621), float64(0.716567), float64(0.681718)]), seq[float64](@[float64(0.000000), float64(0.525731), float64(0.850651)]), seq[float64](@[float64(0.309017), float64(0.500000), float64(0.809017)]), seq[float64](@[float64(0.525731), float64(0.000000), float64(0.850651)]), seq[float64](@[float64(0.295242), float64(0.000000), float64(0.955423)]), seq[float64](@[float64(0.442863), float64(0.238856), float64(0.864188)]), seq[float64](@[float64(0.162460), float64(0.262866), float64(0.951056)]), seq[float64](@[float64(-0.681718), float64(0.147621), float64(0.716567)]), seq[float64](@[float64(-0.809017), float64(0.309017), float64(0.500000)]), seq[float64](@[float64(-0.587785), float64(0.425325), float64(0.688191)]), seq[float64](@[float64(-0.850651), float64(0.525731), float64(0.000000)]), seq[float64](@[float64(-0.864188), float64(0.442863), float64(0.238856)]), seq[float64](@[float64(-0.716567), float64(0.681718), float64(0.147621)]), seq[float64](@[float64(-0.688191), float64(0.587785), float64(0.425325)]), seq[float64](@[float64(-0.500000), float64(0.809017), float64(0.309017)]), seq[float64](@[float64(-0.238856), float64(0.864188), float64(0.442863)]), seq[float64](@[float64(-0.425325), float64(0.688191), float64(0.587785)]), seq[float64](@[float64(-0.716567), float64(0.681718), float64(-0.147621)]), seq[float64](@[float64(-0.500000), float64(0.809017), float64(-0.309017)]), seq[float64](@[float64(-0.525731), float64(0.850651), float64(0.000000)]), seq[float64](@[float64(0.000000), float64(0.850651), float64(-0.525731)]), seq[float64](@[float64(-0.238856), float64(0.864188), float64(-0.442863)]), seq[float64](@[float64(0.000000), float64(0.955423), float64(-0.295242)]), seq[float64](@[float64(-0.262866), float64(0.951056), float64(-0.162460)]), seq[float64](@[float64(0.000000), float64(1.000000), float64(0.000000)]), seq[float64](@[float64(0.000000), float64(0.955423), float64(0.295242)]), seq[float64](@[float64(-0.262866), float64(0.951056), float64(0.162460)]), seq[float64](@[float64(0.238856), float64(0.864188), float64(0.442863)]), seq[float64](@[float64(0.262866), float64(0.951056), float64(0.162460)]), seq[float64](@[float64(0.500000), float64(0.809017), float64(0.309017)]), seq[float64](@[float64(0.238856), float64(0.864188), float64(-0.442863)]), seq[float64](@[float64(0.262866), float64(0.951056), float64(-0.162460)]), seq[float64](@[float64(0.500000), float64(0.809017), float64(-0.309017)]), seq[float64](@[float64(0.850651), float64(0.525731), float64(0.000000)]), seq[float64](@[float64(0.716567), float64(0.681718), float64(0.147621)]), seq[float64](@[float64(0.716567), float64(0.681718), float64(-0.147621)]), seq[float64](@[float64(0.525731), float64(0.850651), float64(0.000000)]), seq[float64](@[float64(0.425325), float64(0.688191), float64(0.587785)]), seq[float64](@[float64(0.864188), float64(0.442863), float64(0.238856)]), seq[float64](@[float64(0.688191), float64(0.587785), float64(0.425325)]), seq[float64](@[float64(0.809017), float64(0.309017), float64(0.500000)]), seq[float64](@[float64(0.681718), float64(0.147621), float64(0.716567)]), seq[float64](@[float64(0.587785), float64(0.425325), float64(0.688191)]), seq[float64](@[float64(0.955423), float64(0.295242), float64(0.000000)]), seq[float64](@[float64(1.000000), float64(0.000000), float64(0.000000)]), seq[float64](@[float64(0.951056), float64(0.162460), float64(0.262866)]), seq[float64](@[float64(0.850651), float64(-0.525731), float64(0.000000)]), seq[float64](@[float64(0.955423), float64(-0.295242), float64(0.000000)]), seq[float64](@[float64(0.864188), float64(-0.442863), float64(0.238856)]), seq[float64](@[float64(0.951056), float64(-0.162460), float64(0.262866)]), seq[float64](@[float64(0.809017), float64(-0.309017), float64(0.500000)]), seq[float64](@[float64(0.681718), float64(-0.147621), float64(0.716567)]), seq[float64](@[float64(0.850651), float64(0.000000), float64(0.525731)]), seq[float64](@[float64(0.864188), float64(0.442863), float64(-0.238856)]), seq[float64](@[float64(0.809017), float64(0.309017), float64(-0.500000)]), seq[float64](@[float64(0.951056), float64(0.162460), float64(-0.262866)]), seq[float64](@[float64(0.525731), float64(0.000000), float64(-0.850651)]), seq[float64](@[float64(0.681718), float64(0.147621), float64(-0.716567)]), seq[float64](@[float64(0.681718), float64(-0.147621), float64(-0.716567)]), seq[float64](@[float64(0.850651), float64(0.000000), float64(-0.525731)]), seq[float64](@[float64(0.809017), float64(-0.309017), float64(-0.500000)]), seq[float64](@[float64(0.864188), float64(-0.442863), float64(-0.238856)]), seq[float64](@[float64(0.951056), float64(-0.162460), float64(-0.262866)]), seq[float64](@[float64(0.147621), float64(0.716567), float64(-0.681718)]), seq[float64](@[float64(0.309017), float64(0.500000), float64(-0.809017)]), seq[float64](@[float64(0.425325), float64(0.688191), float64(-0.587785)]), seq[float64](@[float64(0.442863), float64(0.238856), float64(-0.864188)]), seq[float64](@[float64(0.587785), float64(0.425325), float64(-0.688191)]), seq[float64](@[float64(0.688191), float64(0.587785), float64(-0.425325)]), seq[float64](@[float64(-0.147621), float64(0.716567), float64(-0.681718)]), seq[float64](@[float64(-0.309017), float64(0.500000), float64(-0.809017)]), seq[float64](@[float64(0.000000), float64(0.525731), float64(-0.850651)]), seq[float64](@[float64(-0.525731), float64(0.000000), float64(-0.850651)]), seq[float64](@[float64(-0.442863), float64(0.238856), float64(-0.864188)]), seq[float64](@[float64(-0.295242), float64(0.000000), float64(-0.955423)]), seq[float64](@[float64(-0.162460), float64(0.262866), float64(-0.951056)]), seq[float64](@[float64(0.000000), float64(0.000000), float64(-1.000000)]), seq[float64](@[float64(0.295242), float64(0.000000), float64(-0.955423)]), seq[float64](@[float64(0.162460), float64(0.262866), float64(-0.951056)]), seq[float64](@[float64(-0.442863), float64(-0.238856), float64(-0.864188)]), seq[float64](@[float64(-0.309017), float64(-0.500000), float64(-0.809017)]), seq[float64](@[float64(-0.162460), float64(-0.262866), float64(-0.951056)]), seq[float64](@[float64(0.000000), float64(-0.850651), float64(-0.525731)]), seq[float64](@[float64(-0.147621), float64(-0.716567), float64(-0.681718)]), seq[float64](@[float64(0.147621), float64(-0.716567), float64(-0.681718)]), seq[float64](@[float64(0.000000), float64(-0.525731), float64(-0.850651)]), seq[float64](@[float64(0.309017), float64(-0.500000), float64(-0.809017)]), seq[float64](@[float64(0.442863), float64(-0.238856), float64(-0.864188)]), seq[float64](@[float64(0.162460), float64(-0.262866), float64(-0.951056)]), seq[float64](@[float64(0.238856), float64(-0.864188), float64(-0.442863)]), seq[float64](@[float64(0.500000), float64(-0.809017), float64(-0.309017)]), seq[float64](@[float64(0.425325), float64(-0.688191), float64(-0.587785)]), seq[float64](@[float64(0.716567), float64(-0.681718), float64(-0.147621)]), seq[float64](@[float64(0.688191), float64(-0.587785), float64(-0.425325)]), seq[float64](@[float64(0.587785), float64(-0.425325), float64(-0.688191)]), seq[float64](@[float64(0.000000), float64(-0.955423), float64(-0.295242)]), seq[float64](@[float64(0.000000), float64(-1.000000), float64(0.000000)]), seq[float64](@[float64(0.262866), float64(-0.951056), float64(-0.162460)]), seq[float64](@[float64(0.000000), float64(-0.850651), float64(0.525731)]), seq[float64](@[float64(0.000000), float64(-0.955423), float64(0.295242)]), seq[float64](@[float64(0.238856), float64(-0.864188), float64(0.442863)]), seq[float64](@[float64(0.262866), float64(-0.951056), float64(0.162460)]), seq[float64](@[float64(0.500000), float64(-0.809017), float64(0.309017)]), seq[float64](@[float64(0.716567), float64(-0.681718), float64(0.147621)]), seq[float64](@[float64(0.525731), float64(-0.850651), float64(0.000000)]), seq[float64](@[float64(-0.238856), float64(-0.864188), float64(-0.442863)]), seq[float64](@[float64(-0.500000), float64(-0.809017), float64(-0.309017)]), seq[float64](@[float64(-0.262866), float64(-0.951056), float64(-0.162460)]), seq[float64](@[float64(-0.850651), float64(-0.525731), float64(0.000000)]), seq[float64](@[float64(-0.716567), float64(-0.681718), float64(-0.147621)]), seq[float64](@[float64(-0.716567), float64(-0.681718), float64(0.147621)]), seq[float64](@[float64(-0.525731), float64(-0.850651), float64(0.000000)]), seq[float64](@[float64(-0.500000), float64(-0.809017), float64(0.309017)]), seq[float64](@[float64(-0.238856), float64(-0.864188), float64(0.442863)]), seq[float64](@[float64(-0.262866), float64(-0.951056), float64(0.162460)]), seq[float64](@[float64(-0.864188), float64(-0.442863), float64(0.238856)]), seq[float64](@[float64(-0.809017), float64(-0.309017), float64(0.500000)]), seq[float64](@[float64(-0.688191), float64(-0.587785), float64(0.425325)]), seq[float64](@[float64(-0.681718), float64(-0.147621), float64(0.716567)]), seq[float64](@[float64(-0.442863), float64(-0.238856), float64(0.864188)]), seq[float64](@[float64(-0.587785), float64(-0.425325), float64(0.688191)]), seq[float64](@[float64(-0.309017), float64(-0.500000), float64(0.809017)]), seq[float64](@[float64(-0.147621), float64(-0.716567), float64(0.681718)]), seq[float64](@[float64(-0.425325), float64(-0.688191), float64(0.587785)]), seq[float64](@[float64(-0.162460), float64(-0.262866), float64(0.951056)]), seq[float64](@[float64(0.442863), float64(-0.238856), float64(0.864188)]), seq[float64](@[float64(0.162460), float64(-0.262866), float64(0.951056)]), seq[float64](@[float64(0.309017), float64(-0.500000), float64(0.809017)]), seq[float64](@[float64(0.147621), float64(-0.716567), float64(0.681718)]), seq[float64](@[float64(0.000000), float64(-0.525731), float64(0.850651)]), seq[float64](@[float64(0.425325), float64(-0.688191), float64(0.587785)]), seq[float64](@[float64(0.587785), float64(-0.425325), float64(0.688191)]), seq[float64](@[float64(0.688191), float64(-0.587785), float64(0.425325)]), seq[float64](@[float64(-0.955423), float64(0.295242), float64(0.000000)]), seq[float64](@[float64(-0.951056), float64(0.162460), float64(0.262866)]), seq[float64](@[float64(-1.000000), float64(0.000000), float64(0.000000)]), seq[float64](@[float64(-0.850651), float64(0.000000), float64(0.525731)]), seq[float64](@[float64(-0.955423), float64(-0.295242), float64(0.000000)]), seq[float64](@[float64(-0.951056), float64(-0.162460), float64(0.262866)]), seq[float64](@[float64(-0.864188), float64(0.442863), float64(-0.238856)]), seq[float64](@[float64(-0.951056), float64(0.162460), float64(-0.262866)]), seq[float64](@[float64(-0.809017), float64(0.309017), float64(-0.500000)]), seq[float64](@[float64(-0.864188), float64(-0.442863), float64(-0.238856)]), seq[float64](@[float64(-0.951056), float64(-0.162460), float64(-0.262866)]), seq[float64](@[float64(-0.809017), float64(-0.309017), float64(-0.500000)]), seq[float64](@[float64(-0.681718), float64(0.147621), float64(-0.716567)]), seq[float64](@[float64(-0.681718), float64(-0.147621), float64(-0.716567)]), seq[float64](@[float64(-0.850651), float64(0.000000), float64(-0.525731)]), seq[float64](@[float64(-0.688191), float64(0.587785), float64(-0.425325)]), seq[float64](@[float64(-0.587785), float64(0.425325), float64(-0.688191)]), seq[float64](@[float64(-0.425325), float64(0.688191), float64(-0.587785)]), seq[float64](@[float64(-0.425325), float64(-0.688191), float64(-0.587785)]), seq[float64](@[float64(-0.587785), float64(-0.425325), float64(-0.688191)]), seq[float64](@[float64(-0.688191), float64(-0.587785), float64(-0.425325)])])
  this.anormsTableInst = anormsTableInstExpr
  this.anormsTableInstFlag = true
  return this.anormsTableInst

proc frames(this: Quake2Md2): seq[Quake2Md2_Frame] = 
  if this.framesInstFlag:
    return this.framesInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsFrames))
  for i in 0 ..< int(this.numFrames):
    let buf = this.io.readBytes(int(this.bytesPerFrame))
    this.rawFramesInst.add(buf)
    let rawFramesInstIo = newKaitaiStream(buf)
    let it = Quake2Md2_Frame.read(rawFramesInstIo, this.root, this)
    this.framesInst.add(it)
  this.io.seek(pos)
  this.framesInstFlag = true
  return this.framesInst

proc glCmds(this: Quake2Md2): Quake2Md2_GlCmdsList = 
  if this.glCmdsInstFlag:
    return this.glCmdsInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsGlCmds))
  let rawGlCmdsInstExpr = this.io.readBytes(int(4 * this.numGlCmds))
  this.rawGlCmdsInst = rawGlCmdsInstExpr
  let rawGlCmdsInstIo = newKaitaiStream(rawGlCmdsInstExpr)
  let glCmdsInstExpr = Quake2Md2_GlCmdsList.read(rawGlCmdsInstIo, this.root, this)
  this.glCmdsInst = glCmdsInstExpr
  this.io.seek(pos)
  this.glCmdsInstFlag = true
  return this.glCmdsInst

proc skins(this: Quake2Md2): seq[string] = 
  if this.skinsInstFlag:
    return this.skinsInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsSkins))
  for i in 0 ..< int(this.numSkins):
    let it = encode(this.io.readBytes(int(64)).bytesTerminate(0, false), "ASCII")
    this.skinsInst.add(it)
  this.io.seek(pos)
  this.skinsInstFlag = true
  return this.skinsInst

proc texCoords(this: Quake2Md2): seq[Quake2Md2_TexPoint] = 
  if this.texCoordsInstFlag:
    return this.texCoordsInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsTexCoords))
  for i in 0 ..< int(this.numTexCoords):
    let it = Quake2Md2_TexPoint.read(this.io, this.root, this)
    this.texCoordsInst.add(it)
  this.io.seek(pos)
  this.texCoordsInstFlag = true
  return this.texCoordsInst

proc triangles(this: Quake2Md2): seq[Quake2Md2_Triangle] = 
  if this.trianglesInstFlag:
    return this.trianglesInst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsTriangles))
  for i in 0 ..< int(this.numTriangles):
    let it = Quake2Md2_Triangle.read(this.io, this.root, this)
    this.trianglesInst.add(it)
  this.io.seek(pos)
  this.trianglesInstFlag = true
  return this.trianglesInst

proc fromFile*(_: typedesc[Quake2Md2], filename: string): Quake2Md2 =
  Quake2Md2.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Quake2Md2_CompressedVec], io: KaitaiStream, root: KaitaiStruct, parent: Quake2Md2_Vertex): Quake2Md2_CompressedVec =
  template this: untyped = result
  this = new(Quake2Md2_CompressedVec)
  let root = if root == nil: cast[Quake2Md2](this) else: cast[Quake2Md2](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xCompressedExpr = this.io.readU1()
  this.xCompressed = xCompressedExpr
  let yCompressedExpr = this.io.readU1()
  this.yCompressed = yCompressedExpr
  let zCompressedExpr = this.io.readU1()
  this.zCompressed = zCompressedExpr

proc x(this: Quake2Md2_CompressedVec): float64 = 
  if this.xInstFlag:
    return this.xInst
  let xInstExpr = float64(this.xCompressed * this.parent.parent.scale.x + this.parent.parent.translate.x)
  this.xInst = xInstExpr
  this.xInstFlag = true
  return this.xInst

proc y(this: Quake2Md2_CompressedVec): float64 = 
  if this.yInstFlag:
    return this.yInst
  let yInstExpr = float64(this.yCompressed * this.parent.parent.scale.y + this.parent.parent.translate.y)
  this.yInst = yInstExpr
  this.yInstFlag = true
  return this.yInst

proc z(this: Quake2Md2_CompressedVec): float64 = 
  if this.zInstFlag:
    return this.zInst
  let zInstExpr = float64(this.zCompressed * this.parent.parent.scale.z + this.parent.parent.translate.z)
  this.zInst = zInstExpr
  this.zInstFlag = true
  return this.zInst

proc fromFile*(_: typedesc[Quake2Md2_CompressedVec], filename: string): Quake2Md2_CompressedVec =
  Quake2Md2_CompressedVec.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Quake2Md2_Frame], io: KaitaiStream, root: KaitaiStruct, parent: Quake2Md2): Quake2Md2_Frame =
  template this: untyped = result
  this = new(Quake2Md2_Frame)
  let root = if root == nil: cast[Quake2Md2](this) else: cast[Quake2Md2](root)
  this.io = io
  this.root = root
  this.parent = parent

  let scaleExpr = Quake2Md2_Vec3f.read(this.io, this.root, this)
  this.scale = scaleExpr
  let translateExpr = Quake2Md2_Vec3f.read(this.io, this.root, this)
  this.translate = translateExpr
  let nameExpr = encode(this.io.readBytes(int(16)).bytesTerminate(0, false), "ASCII")
  this.name = nameExpr
  for i in 0 ..< int(Quake2Md2(this.root).verticesPerFrame):
    let it = Quake2Md2_Vertex.read(this.io, this.root, this)
    this.vertices.add(it)

proc fromFile*(_: typedesc[Quake2Md2_Frame], filename: string): Quake2Md2_Frame =
  Quake2Md2_Frame.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Quake2Md2_GlCmd], io: KaitaiStream, root: KaitaiStruct, parent: Quake2Md2_GlCmdsList): Quake2Md2_GlCmd =
  template this: untyped = result
  this = new(Quake2Md2_GlCmd)
  let root = if root == nil: cast[Quake2Md2](this) else: cast[Quake2Md2](root)
  this.io = io
  this.root = root
  this.parent = parent

  let cmdNumVerticesExpr = this.io.readS4le()
  this.cmdNumVertices = cmdNumVerticesExpr
  for i in 0 ..< int(this.numVertices):
    let it = Quake2Md2_GlVertex.read(this.io, this.root, this)
    this.vertices.add(it)

proc numVertices(this: Quake2Md2_GlCmd): int = 
  if this.numVerticesInstFlag:
    return this.numVerticesInst
  let numVerticesInstExpr = int((if this.cmdNumVertices < 0: -(this.cmdNumVertices) else: this.cmdNumVertices))
  this.numVerticesInst = numVerticesInstExpr
  this.numVerticesInstFlag = true
  return this.numVerticesInst

proc primitive(this: Quake2Md2_GlCmd): Quake2Md2_GlPrimitive = 
  if this.primitiveInstFlag:
    return this.primitiveInst
  let primitiveInstExpr = Quake2Md2_GlPrimitive((if this.cmdNumVertices < 0: quake2_md2.triangle_fan else: quake2_md2.triangle_strip))
  this.primitiveInst = primitiveInstExpr
  this.primitiveInstFlag = true
  return this.primitiveInst

proc fromFile*(_: typedesc[Quake2Md2_GlCmd], filename: string): Quake2Md2_GlCmd =
  Quake2Md2_GlCmd.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Quake2Md2_GlCmdsList], io: KaitaiStream, root: KaitaiStruct, parent: Quake2Md2): Quake2Md2_GlCmdsList =
  template this: untyped = result
  this = new(Quake2Md2_GlCmdsList)
  let root = if root == nil: cast[Quake2Md2](this) else: cast[Quake2Md2](root)
  this.io = io
  this.root = root
  this.parent = parent

  if not(this.io.isEof):
    block:
      var i: int
      while true:
        let it = Quake2Md2_GlCmd.read(this.io, this.root, this)
        this.items.add(it)
        if it.cmdNumVertices == 0:
          break
        inc i

proc fromFile*(_: typedesc[Quake2Md2_GlCmdsList], filename: string): Quake2Md2_GlCmdsList =
  Quake2Md2_GlCmdsList.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Quake2Md2_GlVertex], io: KaitaiStream, root: KaitaiStruct, parent: Quake2Md2_GlCmd): Quake2Md2_GlVertex =
  template this: untyped = result
  this = new(Quake2Md2_GlVertex)
  let root = if root == nil: cast[Quake2Md2](this) else: cast[Quake2Md2](root)
  this.io = io
  this.root = root
  this.parent = parent

  for i in 0 ..< int(2):
    let it = this.io.readF4le()
    this.texCoordsNormalized.add(it)

  ##[
  index to `_root.frames[i].vertices` (for each frame with index `i`)
  ]##
  let vertexIndexExpr = this.io.readU4le()
  this.vertexIndex = vertexIndexExpr

proc fromFile*(_: typedesc[Quake2Md2_GlVertex], filename: string): Quake2Md2_GlVertex =
  Quake2Md2_GlVertex.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Quake2Md2_TexPoint], io: KaitaiStream, root: KaitaiStruct, parent: Quake2Md2): Quake2Md2_TexPoint =
  template this: untyped = result
  this = new(Quake2Md2_TexPoint)
  let root = if root == nil: cast[Quake2Md2](this) else: cast[Quake2Md2](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sPxExpr = this.io.readU2le()
  this.sPx = sPxExpr
  let tPxExpr = this.io.readU2le()
  this.tPx = tPxExpr

proc sNormalized(this: Quake2Md2_TexPoint): float64 = 
  if this.sNormalizedInstFlag:
    return this.sNormalizedInst
  let sNormalizedInstExpr = float64((this.sPx + 0.0) div Quake2Md2(this.root).skinWidthPx)
  this.sNormalizedInst = sNormalizedInstExpr
  this.sNormalizedInstFlag = true
  return this.sNormalizedInst

proc tNormalized(this: Quake2Md2_TexPoint): float64 = 
  if this.tNormalizedInstFlag:
    return this.tNormalizedInst
  let tNormalizedInstExpr = float64((this.tPx + 0.0) div Quake2Md2(this.root).skinHeightPx)
  this.tNormalizedInst = tNormalizedInstExpr
  this.tNormalizedInstFlag = true
  return this.tNormalizedInst

proc fromFile*(_: typedesc[Quake2Md2_TexPoint], filename: string): Quake2Md2_TexPoint =
  Quake2Md2_TexPoint.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Quake2Md2_Triangle], io: KaitaiStream, root: KaitaiStruct, parent: Quake2Md2): Quake2Md2_Triangle =
  template this: untyped = result
  this = new(Quake2Md2_Triangle)
  let root = if root == nil: cast[Quake2Md2](this) else: cast[Quake2Md2](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  indices to `_root.frames[i].vertices` (for each frame with index `i`)
  ]##
  for i in 0 ..< int(3):
    let it = this.io.readU2le()
    this.vertexIndices.add(it)

  ##[
  indices to `_root.tex_coords`
  ]##
  for i in 0 ..< int(3):
    let it = this.io.readU2le()
    this.texPointIndices.add(it)

proc fromFile*(_: typedesc[Quake2Md2_Triangle], filename: string): Quake2Md2_Triangle =
  Quake2Md2_Triangle.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Quake2Md2_Vec3f], io: KaitaiStream, root: KaitaiStruct, parent: Quake2Md2_Frame): Quake2Md2_Vec3f =
  template this: untyped = result
  this = new(Quake2Md2_Vec3f)
  let root = if root == nil: cast[Quake2Md2](this) else: cast[Quake2Md2](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xExpr = this.io.readF4le()
  this.x = xExpr
  let yExpr = this.io.readF4le()
  this.y = yExpr
  let zExpr = this.io.readF4le()
  this.z = zExpr

proc fromFile*(_: typedesc[Quake2Md2_Vec3f], filename: string): Quake2Md2_Vec3f =
  Quake2Md2_Vec3f.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Quake2Md2_Vertex], io: KaitaiStream, root: KaitaiStruct, parent: Quake2Md2_Frame): Quake2Md2_Vertex =
  template this: untyped = result
  this = new(Quake2Md2_Vertex)
  let root = if root == nil: cast[Quake2Md2](this) else: cast[Quake2Md2](root)
  this.io = io
  this.root = root
  this.parent = parent

  let positionExpr = Quake2Md2_CompressedVec.read(this.io, this.root, this)
  this.position = positionExpr
  let normalIndexExpr = this.io.readU1()
  this.normalIndex = normalIndexExpr

proc normal(this: Quake2Md2_Vertex): seq[float64] = 
  if this.normalInstFlag:
    return this.normalInst
  let normalInstExpr = seq[float64](Quake2Md2(this.root).anormsTable[this.normalIndex])
  this.normalInst = normalInstExpr
  this.normalInstFlag = true
  return this.normalInst

proc fromFile*(_: typedesc[Quake2Md2_Vertex], filename: string): Quake2Md2_Vertex =
  Quake2Md2_Vertex.read(newKaitaiFileStream(filename), nil, nil)


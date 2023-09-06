-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local str_decode = require("string_decode")
local utils = require("utils")

-- 
-- The MD2 format is used for 3D animated models in id Sofware's Quake II.
-- 
-- A model consists of named `frames`, each with the same number of `vertices`
-- (`vertices_per_frame`). Each such vertex has a `position` and `normal` in
-- model space. Each vertex has the same topological "meaning" across frames, in
-- terms of triangle and texture info; it just varies in position and normal for
-- animation purposes.
-- 
-- How the vertices form triangles is defined via disjoint `triangles` or via
-- `gl_cmds` (which allows strip and fan topology). Each triangle contains three
-- `vertex_indices` into frame vertices, and three `tex_point_indices` into
-- global `tex_coords`. Each texture point has pixel coords `s_px` and `t_px`
-- ranging from 0 to `skin_{width,height}_px` respectively, along with
-- `{s,t}_normalized` ranging from 0 to 1 for your convenience.
-- 
-- A GL command has a `primitive` type (`TRIANGLE_FAN` or `TRIANGLE_STRIP`) along
-- with some `vertices`. Each GL vertex contains `tex_coords_normalized` from 0
-- to 1, and a `vertex_index` into frame vertices.
-- 
-- A model may also contain `skins`, which are just file paths to PCX images.
-- However, this is empty for many models, in which case it is up to the client
-- (e.g. Q2PRO) to offer skins some other way (e.g. by similar filename in the
-- current directory).
-- 
-- There are 198 `frames` in total, partitioned into a fixed set of ranges used
-- for different animations. Each frame has a standard `name` for humans, but the
-- client just uses their index and the name can be arbitrary. The name, start
-- frame index and frame count of each animation can be looked up in the arrays
-- `anim_names`, `anim_start_indices`, and `anim_num_frames` respectively. This
-- information is summarized in the following table:
-- 
-- ```
-- |   INDEX  |    NAME | SUFFIX | NOTES                                                  |
-- |:--------:|--------:|:-------|:-------------------------------------------------------|
-- |    0-39  |   stand | 01-40  | Idle animation                                         |
-- |   40-45  |     run | 1-6    | Full run cycle                                         |
-- |   46-53  |  attack | 1-8    | Shoot, reload; some weapons just repeat 1st few frames |
-- |   54-57  |   pain1 | 01-04  | Q2Pro also uses this for switching weapons             |
-- |   58-61  |   pain2 | 01-04  |                                                        |
-- |   62-65  |   pain3 | 01-04  |                                                        |
-- |   66-71  |    jump | 1-6    | Starts at height and lands on feet                     |
-- |   72-83  |    flip | 01-12  | Flipoff, i.e. middle finger                            |
-- |   84-94  |  salute | 01-11  |                                                        |
-- |   95-111 |   taunt | 01-17  |                                                        |
-- |  112-122 |    wave | 01-11  | Q2Pro plays this backwards for a handgrenade toss      |
-- |  123-134 |   point | 01-12  |                                                        |
-- |  135-153 |  crstnd | 01-19  | Idle while crouching                                   |
-- |  154-159 |  crwalk | 1-6    |                                                        |
-- |  160-168 | crattak | 1-9    |                                                        |
-- |  169-172 |  crpain | 1-4    |                                                        |
-- |  173-177 | crdeath | 1-5    |                                                        |
-- |  178-183 |  death1 | 01-06  |                                                        |
-- |  184-189 |  death2 | 01-06  |                                                        |
-- |  190-197 |  death3 | 01-08  |                                                        |
-- ```
-- 
-- The above are filled in for player models; for the separate weapon models,
-- the final frame is 173 "g_view" (unknown purpose) since weapons aren't shown
-- during death animations. `a_grenades.md2`, the handgrenade weapon model, is
-- the same except that the `wave` frames are blank (according to the default
-- female model files). This is likely due to its dual use as a grenade throw
-- animation where this model must leave the player's model.
-- See also: Source (https://icculus.org/~phaethon/q3a/formats/md2-schoenblum.html)
-- See also: Source (http://tfc.duke.free.fr/coding/md2-specs-en.html)
-- See also: Source (http://tastyspleen.net/~panjoo/downloads/quake2_model_frames.html)
-- See also: Source (http://wiki.polycount.com/wiki/OldSiteResourcesQuake2FramesList)
Quake2Md2 = class.class(KaitaiStruct)

Quake2Md2.GlPrimitive = enum.Enum {
  triangle_strip = 0,
  triangle_fan = 1,
}

function Quake2Md2:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Quake2Md2:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\073\068\080\050") then
    error("not equal, expected " ..  "\073\068\080\050" .. ", but got " .. self.magic)
  end
  self.version = self._io:read_u4le()
  if not(self.version == 8) then
    error("not equal, expected " ..  8 .. ", but got " .. self.version)
  end
  self.skin_width_px = self._io:read_u4le()
  self.skin_height_px = self._io:read_u4le()
  self.bytes_per_frame = self._io:read_u4le()
  self.num_skins = self._io:read_u4le()
  self.vertices_per_frame = self._io:read_u4le()
  self.num_tex_coords = self._io:read_u4le()
  self.num_triangles = self._io:read_u4le()
  self.num_gl_cmds = self._io:read_u4le()
  self.num_frames = self._io:read_u4le()
  self.ofs_skins = self._io:read_u4le()
  self.ofs_tex_coords = self._io:read_u4le()
  self.ofs_triangles = self._io:read_u4le()
  self.ofs_frames = self._io:read_u4le()
  self.ofs_gl_cmds = self._io:read_u4le()
  self.ofs_eof = self._io:read_u4le()
end

Quake2Md2.property.anim_num_frames = {}
function Quake2Md2.property.anim_num_frames:get()
  if self._m_anim_num_frames ~= nil then
    return self._m_anim_num_frames
  end

  self._m_anim_num_frames = "\040\006\008\004\004\004\006\012\011\017\011\012\019\006\009\004\005\006\006\008"
  return self._m_anim_num_frames
end

-- 
-- See also: Quake anorms.h (https://github.com/skullernet/q2pro/blob/f4faabd/src/common/math.c#L80
-- from)
Quake2Md2.property.anorms_table = {}
function Quake2Md2.property.anorms_table:get()
  if self._m_anorms_table ~= nil then
    return self._m_anorms_table
  end

  self._m_anorms_table = {{-0.525731, 0.000000, 0.850651}, {-0.442863, 0.238856, 0.864188}, {-0.295242, 0.000000, 0.955423}, {-0.309017, 0.500000, 0.809017}, {-0.162460, 0.262866, 0.951056}, {0.000000, 0.000000, 1.000000}, {0.000000, 0.850651, 0.525731}, {-0.147621, 0.716567, 0.681718}, {0.147621, 0.716567, 0.681718}, {0.000000, 0.525731, 0.850651}, {0.309017, 0.500000, 0.809017}, {0.525731, 0.000000, 0.850651}, {0.295242, 0.000000, 0.955423}, {0.442863, 0.238856, 0.864188}, {0.162460, 0.262866, 0.951056}, {-0.681718, 0.147621, 0.716567}, {-0.809017, 0.309017, 0.500000}, {-0.587785, 0.425325, 0.688191}, {-0.850651, 0.525731, 0.000000}, {-0.864188, 0.442863, 0.238856}, {-0.716567, 0.681718, 0.147621}, {-0.688191, 0.587785, 0.425325}, {-0.500000, 0.809017, 0.309017}, {-0.238856, 0.864188, 0.442863}, {-0.425325, 0.688191, 0.587785}, {-0.716567, 0.681718, -0.147621}, {-0.500000, 0.809017, -0.309017}, {-0.525731, 0.850651, 0.000000}, {0.000000, 0.850651, -0.525731}, {-0.238856, 0.864188, -0.442863}, {0.000000, 0.955423, -0.295242}, {-0.262866, 0.951056, -0.162460}, {0.000000, 1.000000, 0.000000}, {0.000000, 0.955423, 0.295242}, {-0.262866, 0.951056, 0.162460}, {0.238856, 0.864188, 0.442863}, {0.262866, 0.951056, 0.162460}, {0.500000, 0.809017, 0.309017}, {0.238856, 0.864188, -0.442863}, {0.262866, 0.951056, -0.162460}, {0.500000, 0.809017, -0.309017}, {0.850651, 0.525731, 0.000000}, {0.716567, 0.681718, 0.147621}, {0.716567, 0.681718, -0.147621}, {0.525731, 0.850651, 0.000000}, {0.425325, 0.688191, 0.587785}, {0.864188, 0.442863, 0.238856}, {0.688191, 0.587785, 0.425325}, {0.809017, 0.309017, 0.500000}, {0.681718, 0.147621, 0.716567}, {0.587785, 0.425325, 0.688191}, {0.955423, 0.295242, 0.000000}, {1.000000, 0.000000, 0.000000}, {0.951056, 0.162460, 0.262866}, {0.850651, -0.525731, 0.000000}, {0.955423, -0.295242, 0.000000}, {0.864188, -0.442863, 0.238856}, {0.951056, -0.162460, 0.262866}, {0.809017, -0.309017, 0.500000}, {0.681718, -0.147621, 0.716567}, {0.850651, 0.000000, 0.525731}, {0.864188, 0.442863, -0.238856}, {0.809017, 0.309017, -0.500000}, {0.951056, 0.162460, -0.262866}, {0.525731, 0.000000, -0.850651}, {0.681718, 0.147621, -0.716567}, {0.681718, -0.147621, -0.716567}, {0.850651, 0.000000, -0.525731}, {0.809017, -0.309017, -0.500000}, {0.864188, -0.442863, -0.238856}, {0.951056, -0.162460, -0.262866}, {0.147621, 0.716567, -0.681718}, {0.309017, 0.500000, -0.809017}, {0.425325, 0.688191, -0.587785}, {0.442863, 0.238856, -0.864188}, {0.587785, 0.425325, -0.688191}, {0.688191, 0.587785, -0.425325}, {-0.147621, 0.716567, -0.681718}, {-0.309017, 0.500000, -0.809017}, {0.000000, 0.525731, -0.850651}, {-0.525731, 0.000000, -0.850651}, {-0.442863, 0.238856, -0.864188}, {-0.295242, 0.000000, -0.955423}, {-0.162460, 0.262866, -0.951056}, {0.000000, 0.000000, -1.000000}, {0.295242, 0.000000, -0.955423}, {0.162460, 0.262866, -0.951056}, {-0.442863, -0.238856, -0.864188}, {-0.309017, -0.500000, -0.809017}, {-0.162460, -0.262866, -0.951056}, {0.000000, -0.850651, -0.525731}, {-0.147621, -0.716567, -0.681718}, {0.147621, -0.716567, -0.681718}, {0.000000, -0.525731, -0.850651}, {0.309017, -0.500000, -0.809017}, {0.442863, -0.238856, -0.864188}, {0.162460, -0.262866, -0.951056}, {0.238856, -0.864188, -0.442863}, {0.500000, -0.809017, -0.309017}, {0.425325, -0.688191, -0.587785}, {0.716567, -0.681718, -0.147621}, {0.688191, -0.587785, -0.425325}, {0.587785, -0.425325, -0.688191}, {0.000000, -0.955423, -0.295242}, {0.000000, -1.000000, 0.000000}, {0.262866, -0.951056, -0.162460}, {0.000000, -0.850651, 0.525731}, {0.000000, -0.955423, 0.295242}, {0.238856, -0.864188, 0.442863}, {0.262866, -0.951056, 0.162460}, {0.500000, -0.809017, 0.309017}, {0.716567, -0.681718, 0.147621}, {0.525731, -0.850651, 0.000000}, {-0.238856, -0.864188, -0.442863}, {-0.500000, -0.809017, -0.309017}, {-0.262866, -0.951056, -0.162460}, {-0.850651, -0.525731, 0.000000}, {-0.716567, -0.681718, -0.147621}, {-0.716567, -0.681718, 0.147621}, {-0.525731, -0.850651, 0.000000}, {-0.500000, -0.809017, 0.309017}, {-0.238856, -0.864188, 0.442863}, {-0.262866, -0.951056, 0.162460}, {-0.864188, -0.442863, 0.238856}, {-0.809017, -0.309017, 0.500000}, {-0.688191, -0.587785, 0.425325}, {-0.681718, -0.147621, 0.716567}, {-0.442863, -0.238856, 0.864188}, {-0.587785, -0.425325, 0.688191}, {-0.309017, -0.500000, 0.809017}, {-0.147621, -0.716567, 0.681718}, {-0.425325, -0.688191, 0.587785}, {-0.162460, -0.262866, 0.951056}, {0.442863, -0.238856, 0.864188}, {0.162460, -0.262866, 0.951056}, {0.309017, -0.500000, 0.809017}, {0.147621, -0.716567, 0.681718}, {0.000000, -0.525731, 0.850651}, {0.425325, -0.688191, 0.587785}, {0.587785, -0.425325, 0.688191}, {0.688191, -0.587785, 0.425325}, {-0.955423, 0.295242, 0.000000}, {-0.951056, 0.162460, 0.262866}, {-1.000000, 0.000000, 0.000000}, {-0.850651, 0.000000, 0.525731}, {-0.955423, -0.295242, 0.000000}, {-0.951056, -0.162460, 0.262866}, {-0.864188, 0.442863, -0.238856}, {-0.951056, 0.162460, -0.262866}, {-0.809017, 0.309017, -0.500000}, {-0.864188, -0.442863, -0.238856}, {-0.951056, -0.162460, -0.262866}, {-0.809017, -0.309017, -0.500000}, {-0.681718, 0.147621, -0.716567}, {-0.681718, -0.147621, -0.716567}, {-0.850651, 0.000000, -0.525731}, {-0.688191, 0.587785, -0.425325}, {-0.587785, 0.425325, -0.688191}, {-0.425325, 0.688191, -0.587785}, {-0.425325, -0.688191, -0.587785}, {-0.587785, -0.425325, -0.688191}, {-0.688191, -0.587785, -0.425325}}
  return self._m_anorms_table
end

Quake2Md2.property.tex_coords = {}
function Quake2Md2.property.tex_coords:get()
  if self._m_tex_coords ~= nil then
    return self._m_tex_coords
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_tex_coords)
  self._m_tex_coords = {}
  for i = 0, self.num_tex_coords - 1 do
    self._m_tex_coords[i + 1] = Quake2Md2.TexPoint(self._io, self, self._root)
  end
  self._io:seek(_pos)
  return self._m_tex_coords
end

Quake2Md2.property.triangles = {}
function Quake2Md2.property.triangles:get()
  if self._m_triangles ~= nil then
    return self._m_triangles
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_triangles)
  self._m_triangles = {}
  for i = 0, self.num_triangles - 1 do
    self._m_triangles[i + 1] = Quake2Md2.Triangle(self._io, self, self._root)
  end
  self._io:seek(_pos)
  return self._m_triangles
end

Quake2Md2.property.frames = {}
function Quake2Md2.property.frames:get()
  if self._m_frames ~= nil then
    return self._m_frames
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_frames)
  self._raw__m_frames = {}
  self._m_frames = {}
  for i = 0, self.num_frames - 1 do
    self._raw__m_frames[i + 1] = self._io:read_bytes(self.bytes_per_frame)
    local _io = KaitaiStream(stringstream(self._raw__m_frames[i + 1]))
    self._m_frames[i + 1] = Quake2Md2.Frame(_io, self, self._root)
  end
  self._io:seek(_pos)
  return self._m_frames
end

Quake2Md2.property.anim_names = {}
function Quake2Md2.property.anim_names:get()
  if self._m_anim_names ~= nil then
    return self._m_anim_names
  end

  self._m_anim_names = {"stand", "run", "attack", "pain1", "pain2", "pain3", "jump", "flip", "salute", "taunt", "wave", "point", "crstnd", "crwalk", "crattak", "crpain", "crdeath", "death1", "death2", "death3"}
  return self._m_anim_names
end

Quake2Md2.property.gl_cmds = {}
function Quake2Md2.property.gl_cmds:get()
  if self._m_gl_cmds ~= nil then
    return self._m_gl_cmds
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_gl_cmds)
  self._raw__m_gl_cmds = self._io:read_bytes((4 * self.num_gl_cmds))
  local _io = KaitaiStream(stringstream(self._raw__m_gl_cmds))
  self._m_gl_cmds = Quake2Md2.GlCmdsList(_io, self, self._root)
  self._io:seek(_pos)
  return self._m_gl_cmds
end

Quake2Md2.property.skins = {}
function Quake2Md2.property.skins:get()
  if self._m_skins ~= nil then
    return self._m_skins
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_skins)
  self._m_skins = {}
  for i = 0, self.num_skins - 1 do
    self._m_skins[i + 1] = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(64), 0, false), "ascii")
  end
  self._io:seek(_pos)
  return self._m_skins
end

Quake2Md2.property.anim_start_indices = {}
function Quake2Md2.property.anim_start_indices:get()
  if self._m_anim_start_indices ~= nil then
    return self._m_anim_start_indices
  end

  self._m_anim_start_indices = "\000\040\046\054\058\062\066\072\084\095\112\123\135\154\160\169\173\178\184\190"
  return self._m_anim_start_indices
end


Quake2Md2.Vertex = class.class(KaitaiStruct)

function Quake2Md2.Vertex:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Quake2Md2.Vertex:_read()
  self.position = Quake2Md2.CompressedVec(self._io, self, self._root)
  self.normal_index = self._io:read_u1()
end

Quake2Md2.Vertex.property.normal = {}
function Quake2Md2.Vertex.property.normal:get()
  if self._m_normal ~= nil then
    return self._m_normal
  end

  self._m_normal = self._root.anorms_table[self.normal_index + 1]
  return self._m_normal
end


Quake2Md2.CompressedVec = class.class(KaitaiStruct)

function Quake2Md2.CompressedVec:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Quake2Md2.CompressedVec:_read()
  self.x_compressed = self._io:read_u1()
  self.y_compressed = self._io:read_u1()
  self.z_compressed = self._io:read_u1()
end

Quake2Md2.CompressedVec.property.x = {}
function Quake2Md2.CompressedVec.property.x:get()
  if self._m_x ~= nil then
    return self._m_x
  end

  self._m_x = ((self.x_compressed * self._parent._parent.scale.x) + self._parent._parent.translate.x)
  return self._m_x
end

Quake2Md2.CompressedVec.property.y = {}
function Quake2Md2.CompressedVec.property.y:get()
  if self._m_y ~= nil then
    return self._m_y
  end

  self._m_y = ((self.y_compressed * self._parent._parent.scale.y) + self._parent._parent.translate.y)
  return self._m_y
end

Quake2Md2.CompressedVec.property.z = {}
function Quake2Md2.CompressedVec.property.z:get()
  if self._m_z ~= nil then
    return self._m_z
  end

  self._m_z = ((self.z_compressed * self._parent._parent.scale.z) + self._parent._parent.translate.z)
  return self._m_z
end


Quake2Md2.Triangle = class.class(KaitaiStruct)

function Quake2Md2.Triangle:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Quake2Md2.Triangle:_read()
  self.vertex_indices = {}
  for i = 0, 3 - 1 do
    self.vertex_indices[i + 1] = self._io:read_u2le()
  end
  self.tex_point_indices = {}
  for i = 0, 3 - 1 do
    self.tex_point_indices[i + 1] = self._io:read_u2le()
  end
end

-- 
-- indices to `_root.frames[i].vertices` (for each frame with index `i`).
-- 
-- indices to `_root.tex_coords`.

Quake2Md2.Frame = class.class(KaitaiStruct)

function Quake2Md2.Frame:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Quake2Md2.Frame:_read()
  self.scale = Quake2Md2.Vec3f(self._io, self, self._root)
  self.translate = Quake2Md2.Vec3f(self._io, self, self._root)
  self.name = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(16), 0, false), "ascii")
  self.vertices = {}
  for i = 0, self._root.vertices_per_frame - 1 do
    self.vertices[i + 1] = Quake2Md2.Vertex(self._io, self, self._root)
  end
end


Quake2Md2.GlCmdsList = class.class(KaitaiStruct)

function Quake2Md2.GlCmdsList:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Quake2Md2.GlCmdsList:_read()
  if not(self._io:is_eof()) then
    self.items = {}
    local i = 0
    while true do
      local _ = Quake2Md2.GlCmd(self._io, self, self._root)
      self.items[i + 1] = _
      if _.cmd_num_vertices == 0 then
        break
      end
      i = i + 1
    end
  end
end


Quake2Md2.TexPoint = class.class(KaitaiStruct)

function Quake2Md2.TexPoint:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Quake2Md2.TexPoint:_read()
  self.s_px = self._io:read_u2le()
  self.t_px = self._io:read_u2le()
end

Quake2Md2.TexPoint.property.s_normalized = {}
function Quake2Md2.TexPoint.property.s_normalized:get()
  if self._m_s_normalized ~= nil then
    return self._m_s_normalized
  end

  self._m_s_normalized = ((self.s_px + 0.0) / self._root.skin_width_px)
  return self._m_s_normalized
end

Quake2Md2.TexPoint.property.t_normalized = {}
function Quake2Md2.TexPoint.property.t_normalized:get()
  if self._m_t_normalized ~= nil then
    return self._m_t_normalized
  end

  self._m_t_normalized = ((self.t_px + 0.0) / self._root.skin_height_px)
  return self._m_t_normalized
end


Quake2Md2.Vec3f = class.class(KaitaiStruct)

function Quake2Md2.Vec3f:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Quake2Md2.Vec3f:_read()
  self.x = self._io:read_f4le()
  self.y = self._io:read_f4le()
  self.z = self._io:read_f4le()
end


Quake2Md2.GlVertex = class.class(KaitaiStruct)

function Quake2Md2.GlVertex:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Quake2Md2.GlVertex:_read()
  self.tex_coords_normalized = {}
  for i = 0, 2 - 1 do
    self.tex_coords_normalized[i + 1] = self._io:read_f4le()
  end
  self.vertex_index = self._io:read_u4le()
end

-- 
-- index to `_root.frames[i].vertices` (for each frame with index `i`).

Quake2Md2.GlCmd = class.class(KaitaiStruct)

function Quake2Md2.GlCmd:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Quake2Md2.GlCmd:_read()
  self.cmd_num_vertices = self._io:read_s4le()
  self.vertices = {}
  for i = 0, self.num_vertices - 1 do
    self.vertices[i + 1] = Quake2Md2.GlVertex(self._io, self, self._root)
  end
end

Quake2Md2.GlCmd.property.num_vertices = {}
function Quake2Md2.GlCmd.property.num_vertices:get()
  if self._m_num_vertices ~= nil then
    return self._m_num_vertices
  end

  self._m_num_vertices = utils.box_unwrap((self.cmd_num_vertices < 0) and utils.box_wrap(-(self.cmd_num_vertices)) or (self.cmd_num_vertices))
  return self._m_num_vertices
end

Quake2Md2.GlCmd.property.primitive = {}
function Quake2Md2.GlCmd.property.primitive:get()
  if self._m_primitive ~= nil then
    return self._m_primitive
  end

  self._m_primitive = utils.box_unwrap((self.cmd_num_vertices < 0) and utils.box_wrap(Quake2Md2.GlPrimitive.triangle_fan) or (Quake2Md2.GlPrimitive.triangle_strip))
  return self._m_primitive
end



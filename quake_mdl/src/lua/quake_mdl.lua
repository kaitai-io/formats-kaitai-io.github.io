-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local utils = require("utils")
local str_decode = require("string_decode")

-- 
-- Quake 1 model format is used to store 3D models completely with
-- textures and animations used in the game. Quake 1 engine
-- (retroactively named "idtech2") is a popular 3D engine first used
-- for Quake game by id Software in 1996.
-- 
-- Model is constructed traditionally from vertices in 3D space, faces
-- which connect vertices, textures ("skins", i.e. 2D bitmaps) and
-- texture UV mapping information. As opposed to more modern,
-- bones-based animation formats, Quake model was animated by changing
-- locations of all vertices it included in 3D space, frame by frame.
-- 
-- File format stores:
-- 
-- * "Skins" — effectively 2D bitmaps which will be used as a
--   texture. Every model can have multiple skins — e.g. these can be
--   switched to depict various levels of damage to the
--   monsters. Bitmaps are 8-bit-per-pixel, indexed in global Quake
--   palette, subject to lighting and gamma adjustment when rendering
--   in the game using colormap technique.
-- * "Texture coordinates" — UV coordinates, mapping 3D vertices to
--   skin coordinates.
-- * "Triangles" — triangular faces connecting 3D vertices.
-- * "Frames" — locations of vertices in 3D space; can include more
--   than one frame, thus allowing representation of different frames
--   for animation purposes.
-- 
-- Originally, 3D geometry for models for Quake was designed in [Alias
-- PowerAnimator](https://en.wikipedia.org/wiki/PowerAnimator),
-- precursor of modern day Autodesk Maya and Autodesk Alias. Therefore,
-- 3D-related part of Quake model format followed closely Alias TRI
-- format, and Quake development utilities included a converter from Alias
-- TRI (`modelgen`).
-- 
-- Skins (textures) where prepared as LBM bitmaps with the help from
-- `texmap` utility in the same development utilities toolkit.
QuakeMdl = class.class(KaitaiStruct)

function QuakeMdl:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function QuakeMdl:_read()
  self.header = QuakeMdl.MdlHeader(self._io, self, self._root)
  self.skins = {}
  for i = 0, self.header.num_skins - 1 do
    self.skins[i + 1] = QuakeMdl.MdlSkin(self._io, self, self._root)
  end
  self.texture_coordinates = {}
  for i = 0, self.header.num_verts - 1 do
    self.texture_coordinates[i + 1] = QuakeMdl.MdlTexcoord(self._io, self, self._root)
  end
  self.triangles = {}
  for i = 0, self.header.num_tris - 1 do
    self.triangles[i + 1] = QuakeMdl.MdlTriangle(self._io, self, self._root)
  end
  self.frames = {}
  for i = 0, self.header.num_frames - 1 do
    self.frames[i + 1] = QuakeMdl.MdlFrame(self._io, self, self._root)
  end
end


QuakeMdl.MdlVertex = class.class(KaitaiStruct)

function QuakeMdl.MdlVertex:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function QuakeMdl.MdlVertex:_read()
  self.values = {}
  for i = 0, 3 - 1 do
    self.values[i + 1] = self._io:read_u1()
  end
  self.normal_index = self._io:read_u1()
end


-- 
-- See also: Source (https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L79-L83)
-- See also: Source (https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD2)
QuakeMdl.MdlTexcoord = class.class(KaitaiStruct)

function QuakeMdl.MdlTexcoord:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function QuakeMdl.MdlTexcoord:_read()
  self.on_seam = self._io:read_s4le()
  self.s = self._io:read_s4le()
  self.t = self._io:read_s4le()
end


-- 
-- See also: Source (https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L59-L75)
-- See also: Source (https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD0)
QuakeMdl.MdlHeader = class.class(KaitaiStruct)

function QuakeMdl.MdlHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function QuakeMdl.MdlHeader:_read()
  self.ident = self._io:read_bytes(4)
  if not(self.ident == "\073\068\080\079") then
    error("not equal, expected " ..  "\073\068\080\079" .. ", but got " .. self.ident)
  end
  self.version = self._io:read_s4le()
  if not(self.version == 6) then
    error("not equal, expected " ..  6 .. ", but got " .. self.version)
  end
  self.scale = QuakeMdl.Vec3(self._io, self, self._root)
  self.origin = QuakeMdl.Vec3(self._io, self, self._root)
  self.radius = self._io:read_f4le()
  self.eye_position = QuakeMdl.Vec3(self._io, self, self._root)
  self.num_skins = self._io:read_s4le()
  self.skin_width = self._io:read_s4le()
  self.skin_height = self._io:read_s4le()
  self.num_verts = self._io:read_s4le()
  self.num_tris = self._io:read_s4le()
  self.num_frames = self._io:read_s4le()
  self.synctype = self._io:read_s4le()
  self.flags = self._io:read_s4le()
  self.size = self._io:read_f4le()
end

-- 
-- Skin size in pixels.
QuakeMdl.MdlHeader.property.skin_size = {}
function QuakeMdl.MdlHeader.property.skin_size:get()
  if self._m_skin_size ~= nil then
    return self._m_skin_size
  end

  self._m_skin_size = (self.skin_width * self.skin_height)
  return self._m_skin_size
end

-- 
-- Magic signature bytes that every Quake model must
-- have. "IDPO" is short for "IDPOLYHEADER".
-- See also: Source (https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L132-L133)
-- 
-- Global scaling factors in 3 dimensions for whole model. When
-- represented in 3D world, this model local coordinates will
-- be multiplied by these factors.
-- 
-- Number of skins (=texture bitmaps) included in this model.
-- 
-- Width (U coordinate max) of every skin (=texture) in pixels.
-- 
-- Height (V coordinate max) of every skin (=texture) in
-- pixels.
-- 
-- Number of vertices in this model. Note that this is constant
-- for all the animation frames and all textures.
-- 
-- Number of triangles (=triangular faces) in this model.
-- 
-- Number of animation frames included in this model.

QuakeMdl.MdlSkin = class.class(KaitaiStruct)

function QuakeMdl.MdlSkin:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function QuakeMdl.MdlSkin:_read()
  self.group = self._io:read_s4le()
  if self.group == 0 then
    self.single_texture_data = self._io:read_bytes(self._root.header.skin_size)
  end
  if self.group ~= 0 then
    self.num_frames = self._io:read_u4le()
  end
  if self.group ~= 0 then
    self.frame_times = {}
    for i = 0, self.num_frames - 1 do
      self.frame_times[i + 1] = self._io:read_f4le()
    end
  end
  if self.group ~= 0 then
    self.group_texture_data = {}
    for i = 0, self.num_frames - 1 do
      self.group_texture_data[i + 1] = self._io:read_bytes(self._root.header.skin_size)
    end
  end
end


QuakeMdl.MdlFrame = class.class(KaitaiStruct)

function QuakeMdl.MdlFrame:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function QuakeMdl.MdlFrame:_read()
  self.type = self._io:read_s4le()
  if self.type ~= 0 then
    self.min = QuakeMdl.MdlVertex(self._io, self, self._root)
  end
  if self.type ~= 0 then
    self.max = QuakeMdl.MdlVertex(self._io, self, self._root)
  end
  if self.type ~= 0 then
    self.time = {}
    for i = 0, self.type - 1 do
      self.time[i + 1] = self._io:read_f4le()
    end
  end
  self.frames = {}
  for i = 0, self.num_simple_frames - 1 do
    self.frames[i + 1] = QuakeMdl.MdlSimpleFrame(self._io, self, self._root)
  end
end

QuakeMdl.MdlFrame.property.num_simple_frames = {}
function QuakeMdl.MdlFrame.property.num_simple_frames:get()
  if self._m_num_simple_frames ~= nil then
    return self._m_num_simple_frames
  end

  self._m_num_simple_frames = utils.box_unwrap((self.type == 0) and utils.box_wrap(1) or (self.type))
  return self._m_num_simple_frames
end


QuakeMdl.MdlSimpleFrame = class.class(KaitaiStruct)

function QuakeMdl.MdlSimpleFrame:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function QuakeMdl.MdlSimpleFrame:_read()
  self.bbox_min = QuakeMdl.MdlVertex(self._io, self, self._root)
  self.bbox_max = QuakeMdl.MdlVertex(self._io, self, self._root)
  self.name = str_decode.decode(KaitaiStream.bytes_terminate(KaitaiStream.bytes_strip_right(self._io:read_bytes(16), 0), 0, false), "ASCII")
  self.vertices = {}
  for i = 0, self._root.header.num_verts - 1 do
    self.vertices[i + 1] = QuakeMdl.MdlVertex(self._io, self, self._root)
  end
end


-- 
-- Represents a triangular face, connecting 3 vertices, referenced
-- by their indexes.
-- See also: Source (https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L85-L88)
-- See also: Source (https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD3)
QuakeMdl.MdlTriangle = class.class(KaitaiStruct)

function QuakeMdl.MdlTriangle:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function QuakeMdl.MdlTriangle:_read()
  self.faces_front = self._io:read_s4le()
  self.vertices = {}
  for i = 0, 3 - 1 do
    self.vertices[i + 1] = self._io:read_s4le()
  end
end


-- 
-- Basic 3D vector (x, y, z) using single-precision floating point
-- coordnates. Can be used to specify a point in 3D space,
-- direction, scaling factor, etc.
QuakeMdl.Vec3 = class.class(KaitaiStruct)

function QuakeMdl.Vec3:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function QuakeMdl.Vec3:_read()
  self.x = self._io:read_f4le()
  self.y = self._io:read_f4le()
  self.z = self._io:read_f4le()
end



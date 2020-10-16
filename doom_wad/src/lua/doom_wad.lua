-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")
local enum = require("enum")
local stringstream = require("string_stream")

DoomWad = class.class(KaitaiStruct)

function DoomWad:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DoomWad:_read()
  self.magic = str_decode.decode(self._io:read_bytes(4), "ASCII")
  self.num_index_entries = self._io:read_s4le()
  self.index_offset = self._io:read_s4le()
end

DoomWad.property.index = {}
function DoomWad.property.index:get()
  if self._m_index ~= nil then
    return self._m_index
  end

  local _pos = self._io:pos()
  self._io:seek(self.index_offset)
  self._m_index = {}
  for i = 0, self.num_index_entries - 1 do
    self._m_index[i + 1] = DoomWad.IndexEntry(self._io, self, self._root)
  end
  self._io:seek(_pos)
  return self._m_index
end

-- 
-- Number of entries in the lump index.
-- 
-- Offset to the start of the index.

DoomWad.Sectors = class.class(KaitaiStruct)

function DoomWad.Sectors:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DoomWad.Sectors:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = DoomWad.Sector(self._io, self, self._root)
    i = i + 1
  end
end


DoomWad.Vertex = class.class(KaitaiStruct)

function DoomWad.Vertex:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DoomWad.Vertex:_read()
  self.x = self._io:read_s2le()
  self.y = self._io:read_s2le()
end


-- 
-- Used for TEXTURE1 and TEXTURE2 lumps, which designate how to
-- combine wall patches to make wall textures. This essentially
-- provides a very simple form of image compression, allowing
-- certain elements ("patches") to be reused / recombined on
-- different textures for more variety in the game.
-- See also: Source (http://doom.wikia.com/wiki/TEXTURE1)
DoomWad.Texture12 = class.class(KaitaiStruct)

function DoomWad.Texture12:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DoomWad.Texture12:_read()
  self.num_textures = self._io:read_s4le()
  self.textures = {}
  for i = 0, self.num_textures - 1 do
    self.textures[i + 1] = DoomWad.Texture12.TextureIndex(self._io, self, self._root)
  end
end

-- 
-- Number of wall textures.

DoomWad.Texture12.TextureIndex = class.class(KaitaiStruct)

function DoomWad.Texture12.TextureIndex:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DoomWad.Texture12.TextureIndex:_read()
  self.offset = self._io:read_s4le()
end

DoomWad.Texture12.TextureIndex.property.body = {}
function DoomWad.Texture12.TextureIndex.property.body:get()
  if self._m_body ~= nil then
    return self._m_body
  end

  local _pos = self._io:pos()
  self._io:seek(self.offset)
  self._m_body = DoomWad.Texture12.TextureBody(self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_body
end


DoomWad.Texture12.TextureBody = class.class(KaitaiStruct)

function DoomWad.Texture12.TextureBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DoomWad.Texture12.TextureBody:_read()
  self.name = str_decode.decode(KaitaiStream.bytes_strip_right(self._io:read_bytes(8), 0), "ASCII")
  self.masked = self._io:read_u4le()
  self.width = self._io:read_u2le()
  self.height = self._io:read_u2le()
  self.column_directory = self._io:read_u4le()
  self.num_patches = self._io:read_u2le()
  self.patches = {}
  for i = 0, self.num_patches - 1 do
    self.patches[i + 1] = DoomWad.Texture12.Patch(self._io, self, self._root)
  end
end

-- 
-- Name of a texture, only `A-Z`, `0-9`, `[]_-` are valid.
-- 
-- Obsolete, ignored by all DOOM versions.
-- 
-- Number of patches that are used in a texture.

DoomWad.Texture12.Patch = class.class(KaitaiStruct)

function DoomWad.Texture12.Patch:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DoomWad.Texture12.Patch:_read()
  self.origin_x = self._io:read_s2le()
  self.origin_y = self._io:read_s2le()
  self.patch_id = self._io:read_u2le()
  self.step_dir = self._io:read_u2le()
  self.colormap = self._io:read_u2le()
end

-- 
-- X offset to draw a patch at (pixels from left boundary of a texture).
-- 
-- Y offset to draw a patch at (pixels from upper boundary of a texture).
-- 
-- Identifier of a patch (as listed in PNAMES lump) to draw.

DoomWad.Linedef = class.class(KaitaiStruct)

function DoomWad.Linedef:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DoomWad.Linedef:_read()
  self.vertex_start_idx = self._io:read_u2le()
  self.vertex_end_idx = self._io:read_u2le()
  self.flags = self._io:read_u2le()
  self.line_type = self._io:read_u2le()
  self.sector_tag = self._io:read_u2le()
  self.sidedef_right_idx = self._io:read_u2le()
  self.sidedef_left_idx = self._io:read_u2le()
end


-- 
-- See also: Source (http://doom.wikia.com/wiki/PNAMES)
DoomWad.Pnames = class.class(KaitaiStruct)

function DoomWad.Pnames:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DoomWad.Pnames:_read()
  self.num_patches = self._io:read_u4le()
  self.names = {}
  for i = 0, self.num_patches - 1 do
    self.names[i + 1] = str_decode.decode(KaitaiStream.bytes_strip_right(self._io:read_bytes(8), 0), "ASCII")
  end
end

-- 
-- Number of patches registered in this global game directory.

DoomWad.Thing = class.class(KaitaiStruct)

function DoomWad.Thing:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DoomWad.Thing:_read()
  self.x = self._io:read_s2le()
  self.y = self._io:read_s2le()
  self.angle = self._io:read_u2le()
  self.type = self._io:read_u2le()
  self.flags = self._io:read_u2le()
end


DoomWad.Sector = class.class(KaitaiStruct)

DoomWad.Sector.SpecialSector = enum.Enum {
  normal = 0,
  d_light_flicker = 1,
  d_light_strobe_fast = 2,
  d_light_strobe_slow = 3,
  d_light_strobe_hurt = 4,
  d_damage_hellslime = 5,
  d_damage_nukage = 7,
  d_light_glow = 8,
  secret = 9,
  d_sector_door_close_in_30 = 10,
  d_damage_end = 11,
  d_light_strobe_slow_sync = 12,
  d_light_strobe_fast_sync = 13,
  d_sector_door_raise_in_5_mins = 14,
  d_friction_low = 15,
  d_damage_super_hellslime = 16,
  d_light_fire_flicker = 17,
  d_damage_lava_wimpy = 18,
  d_damage_lava_hefty = 19,
  d_scroll_east_lava_damage = 20,
  light_phased = 21,
  light_sequence_start = 22,
  light_sequence_special1 = 23,
  light_sequence_special2 = 24,
}

function DoomWad.Sector:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DoomWad.Sector:_read()
  self.floor_z = self._io:read_s2le()
  self.ceil_z = self._io:read_s2le()
  self.floor_flat = str_decode.decode(self._io:read_bytes(8), "ASCII")
  self.ceil_flat = str_decode.decode(self._io:read_bytes(8), "ASCII")
  self.light = self._io:read_s2le()
  self.special_type = DoomWad.Sector.SpecialSector(self._io:read_u2le())
  self.tag = self._io:read_u2le()
end

-- 
-- Light level of the sector [0..255]. Original engine uses
-- COLORMAP to render lighting, so only 32 actual levels are
-- available (i.e. 0..7, 8..15, etc).
-- 
-- Tag number. When the linedef with the same tag number is
-- activated, some effect will be triggered in this sector.

DoomWad.Vertexes = class.class(KaitaiStruct)

function DoomWad.Vertexes:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DoomWad.Vertexes:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = DoomWad.Vertex(self._io, self, self._root)
    i = i + 1
  end
end


DoomWad.Sidedef = class.class(KaitaiStruct)

function DoomWad.Sidedef:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DoomWad.Sidedef:_read()
  self.offset_x = self._io:read_s2le()
  self.offset_y = self._io:read_s2le()
  self.upper_texture_name = str_decode.decode(self._io:read_bytes(8), "ASCII")
  self.lower_texture_name = str_decode.decode(self._io:read_bytes(8), "ASCII")
  self.normal_texture_name = str_decode.decode(self._io:read_bytes(8), "ASCII")
  self.sector_id = self._io:read_s2le()
end


DoomWad.Things = class.class(KaitaiStruct)

function DoomWad.Things:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DoomWad.Things:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = DoomWad.Thing(self._io, self, self._root)
    i = i + 1
  end
end


DoomWad.Linedefs = class.class(KaitaiStruct)

function DoomWad.Linedefs:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DoomWad.Linedefs:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = DoomWad.Linedef(self._io, self, self._root)
    i = i + 1
  end
end


DoomWad.IndexEntry = class.class(KaitaiStruct)

function DoomWad.IndexEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DoomWad.IndexEntry:_read()
  self.offset = self._io:read_s4le()
  self.size = self._io:read_s4le()
  self.name = str_decode.decode(KaitaiStream.bytes_strip_right(self._io:read_bytes(8), 0), "ASCII")
end

DoomWad.IndexEntry.property.contents = {}
function DoomWad.IndexEntry.property.contents:get()
  if self._m_contents ~= nil then
    return self._m_contents
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.offset)
  local _on = self.name
  if _on == "SECTORS" then
    self._raw__m_contents = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_contents))
    self._m_contents = DoomWad.Sectors(_io, self, self._root)
  elseif _on == "TEXTURE1" then
    self._raw__m_contents = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_contents))
    self._m_contents = DoomWad.Texture12(_io, self, self._root)
  elseif _on == "VERTEXES" then
    self._raw__m_contents = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_contents))
    self._m_contents = DoomWad.Vertexes(_io, self, self._root)
  elseif _on == "BLOCKMAP" then
    self._raw__m_contents = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_contents))
    self._m_contents = DoomWad.Blockmap(_io, self, self._root)
  elseif _on == "PNAMES" then
    self._raw__m_contents = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_contents))
    self._m_contents = DoomWad.Pnames(_io, self, self._root)
  elseif _on == "TEXTURE2" then
    self._raw__m_contents = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_contents))
    self._m_contents = DoomWad.Texture12(_io, self, self._root)
  elseif _on == "THINGS" then
    self._raw__m_contents = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_contents))
    self._m_contents = DoomWad.Things(_io, self, self._root)
  elseif _on == "LINEDEFS" then
    self._raw__m_contents = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_contents))
    self._m_contents = DoomWad.Linedefs(_io, self, self._root)
  elseif _on == "SIDEDEFS" then
    self._raw__m_contents = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_contents))
    self._m_contents = DoomWad.Sidedefs(_io, self, self._root)
  else
    self._m_contents = _io:read_bytes(self.size)
  end
  _io:seek(_pos)
  return self._m_contents
end


DoomWad.Sidedefs = class.class(KaitaiStruct)

function DoomWad.Sidedefs:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DoomWad.Sidedefs:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = DoomWad.Sidedef(self._io, self, self._root)
    i = i + 1
  end
end


DoomWad.Blockmap = class.class(KaitaiStruct)

function DoomWad.Blockmap:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DoomWad.Blockmap:_read()
  self.origin_x = self._io:read_s2le()
  self.origin_y = self._io:read_s2le()
  self.num_cols = self._io:read_s2le()
  self.num_rows = self._io:read_s2le()
  self.linedefs_in_block = {}
  for i = 0, (self.num_cols * self.num_rows) - 1 do
    self.linedefs_in_block[i + 1] = DoomWad.Blockmap.Blocklist(self._io, self, self._root)
  end
end

-- 
-- Grid origin, X coord.
-- 
-- Grid origin, Y coord.
-- 
-- Number of columns.
-- 
-- Number of rows.
-- 
-- Lists of linedefs for every block.

DoomWad.Blockmap.Blocklist = class.class(KaitaiStruct)

function DoomWad.Blockmap.Blocklist:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DoomWad.Blockmap.Blocklist:_read()
  self.offset = self._io:read_u2le()
end

-- 
-- List of linedefs found in this block.
DoomWad.Blockmap.Blocklist.property.linedefs = {}
function DoomWad.Blockmap.Blocklist.property.linedefs:get()
  if self._m_linedefs ~= nil then
    return self._m_linedefs
  end

  local _pos = self._io:pos()
  self._io:seek((self.offset * 2))
  self._m_linedefs = {}
  local i = 0
  while true do
    _ = self._io:read_s2le()
    self._m_linedefs[i + 1] = _
    if _ == -1 then
      break
    end
    i = i + 1
  end
self._io:seek(_pos)
return self._m_linedefs
end

-- 
-- Offset to the list of linedefs.


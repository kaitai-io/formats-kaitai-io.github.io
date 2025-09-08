-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")

-- 
-- See also: MagicaVoxel Homepage (https://ephtracy.github.io/)
-- See also: Format Description (https://github.com/ephtracy/voxel-model/blob/master/MagicaVoxel-file-format-vox.txt)
MagicavoxelVox = class.class(KaitaiStruct)

MagicavoxelVox.ChunkType = enum.Enum {
  main = 1296124238,
  matt = 1296127060,
  pack = 1346454347,
  rgba = 1380401729,
  size = 1397316165,
  xyzi = 1482250825,
}

MagicavoxelVox.MaterialType = enum.Enum {
  diffuse = 0,
  metal = 1,
  glass = 2,
  emissive = 3,
}

MagicavoxelVox.PropertyBitsType = enum.Enum {
  plastic = 1,
  roughness = 2,
  specular = 4,
  ior = 8,
  attenuation = 16,
  power = 32,
  glow = 64,
  is_total_power = 128,
}

function MagicavoxelVox:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MagicavoxelVox:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\086\079\088\032") then
    error("not equal, expected " .. "\086\079\088\032" .. ", but got " .. self.magic)
  end
  self.version = self._io:read_u4le()
  self.main = MagicavoxelVox.Chunk(self._io, self, self._root)
end

-- 
-- 150 expected.

MagicavoxelVox.Chunk = class.class(KaitaiStruct)

function MagicavoxelVox.Chunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function MagicavoxelVox.Chunk:_read()
  self.chunk_id = MagicavoxelVox.ChunkType(self._io:read_u4be())
  self.num_bytes_of_chunk_content = self._io:read_u4le()
  self.num_bytes_of_children_chunks = self._io:read_u4le()
  if self.num_bytes_of_chunk_content ~= 0 then
    local _on = self.chunk_id
    if _on == MagicavoxelVox.ChunkType.matt then
      self._raw_chunk_content = self._io:read_bytes(self.num_bytes_of_chunk_content)
      local _io = KaitaiStream(stringstream(self._raw_chunk_content))
      self.chunk_content = MagicavoxelVox.Matt(_io, self, self._root)
    elseif _on == MagicavoxelVox.ChunkType.pack then
      self._raw_chunk_content = self._io:read_bytes(self.num_bytes_of_chunk_content)
      local _io = KaitaiStream(stringstream(self._raw_chunk_content))
      self.chunk_content = MagicavoxelVox.Pack(_io, self, self._root)
    elseif _on == MagicavoxelVox.ChunkType.rgba then
      self._raw_chunk_content = self._io:read_bytes(self.num_bytes_of_chunk_content)
      local _io = KaitaiStream(stringstream(self._raw_chunk_content))
      self.chunk_content = MagicavoxelVox.Rgba(_io, self, self._root)
    elseif _on == MagicavoxelVox.ChunkType.size then
      self._raw_chunk_content = self._io:read_bytes(self.num_bytes_of_chunk_content)
      local _io = KaitaiStream(stringstream(self._raw_chunk_content))
      self.chunk_content = MagicavoxelVox.Size(_io, self, self._root)
    elseif _on == MagicavoxelVox.ChunkType.xyzi then
      self._raw_chunk_content = self._io:read_bytes(self.num_bytes_of_chunk_content)
      local _io = KaitaiStream(stringstream(self._raw_chunk_content))
      self.chunk_content = MagicavoxelVox.Xyzi(_io, self, self._root)
    else
      self.chunk_content = self._io:read_bytes(self.num_bytes_of_chunk_content)
    end
  end
  if self.num_bytes_of_children_chunks ~= 0 then
    self.children_chunks = {}
    local i = 0
    while not self._io:is_eof() do
      self.children_chunks[i + 1] = MagicavoxelVox.Chunk(self._io, self, self._root)
      i = i + 1
    end
  end
end


MagicavoxelVox.Color = class.class(KaitaiStruct)

function MagicavoxelVox.Color:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function MagicavoxelVox.Color:_read()
  self.r = self._io:read_u1()
  self.g = self._io:read_u1()
  self.b = self._io:read_u1()
  self.a = self._io:read_u1()
end


MagicavoxelVox.Matt = class.class(KaitaiStruct)

function MagicavoxelVox.Matt:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function MagicavoxelVox.Matt:_read()
  self.id = self._io:read_u4le()
  self.material_type = MagicavoxelVox.MaterialType(self._io:read_u4le())
  self.material_weight = self._io:read_f4le()
  self.property_bits = self._io:read_u4le()
  if self.has_plastic then
    self.plastic = self._io:read_f4le()
  end
  if self.has_roughness then
    self.roughness = self._io:read_f4le()
  end
  if self.has_specular then
    self.specular = self._io:read_f4le()
  end
  if self.has_ior then
    self.ior = self._io:read_f4le()
  end
  if self.has_attenuation then
    self.attenuation = self._io:read_f4le()
  end
  if self.has_power then
    self.power = self._io:read_f4le()
  end
  if self.has_glow then
    self.glow = self._io:read_f4le()
  end
  if self.has_is_total_power then
    self.is_total_power = self._io:read_f4le()
  end
end

MagicavoxelVox.Matt.property.has_attenuation = {}
function MagicavoxelVox.Matt.property.has_attenuation:get()
  if self._m_has_attenuation ~= nil then
    return self._m_has_attenuation
  end

  self._m_has_attenuation = self.property_bits & 16 ~= 0
  return self._m_has_attenuation
end

MagicavoxelVox.Matt.property.has_glow = {}
function MagicavoxelVox.Matt.property.has_glow:get()
  if self._m_has_glow ~= nil then
    return self._m_has_glow
  end

  self._m_has_glow = self.property_bits & 64 ~= 0
  return self._m_has_glow
end

MagicavoxelVox.Matt.property.has_ior = {}
function MagicavoxelVox.Matt.property.has_ior:get()
  if self._m_has_ior ~= nil then
    return self._m_has_ior
  end

  self._m_has_ior = self.property_bits & 8 ~= 0
  return self._m_has_ior
end

MagicavoxelVox.Matt.property.has_is_total_power = {}
function MagicavoxelVox.Matt.property.has_is_total_power:get()
  if self._m_has_is_total_power ~= nil then
    return self._m_has_is_total_power
  end

  self._m_has_is_total_power = self.property_bits & 128 ~= 0
  return self._m_has_is_total_power
end

MagicavoxelVox.Matt.property.has_plastic = {}
function MagicavoxelVox.Matt.property.has_plastic:get()
  if self._m_has_plastic ~= nil then
    return self._m_has_plastic
  end

  self._m_has_plastic = self.property_bits & 1 ~= 0
  return self._m_has_plastic
end

MagicavoxelVox.Matt.property.has_power = {}
function MagicavoxelVox.Matt.property.has_power:get()
  if self._m_has_power ~= nil then
    return self._m_has_power
  end

  self._m_has_power = self.property_bits & 32 ~= 0
  return self._m_has_power
end

MagicavoxelVox.Matt.property.has_roughness = {}
function MagicavoxelVox.Matt.property.has_roughness:get()
  if self._m_has_roughness ~= nil then
    return self._m_has_roughness
  end

  self._m_has_roughness = self.property_bits & 2 ~= 0
  return self._m_has_roughness
end

MagicavoxelVox.Matt.property.has_specular = {}
function MagicavoxelVox.Matt.property.has_specular:get()
  if self._m_has_specular ~= nil then
    return self._m_has_specular
  end

  self._m_has_specular = self.property_bits & 4 ~= 0
  return self._m_has_specular
end


MagicavoxelVox.Pack = class.class(KaitaiStruct)

function MagicavoxelVox.Pack:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function MagicavoxelVox.Pack:_read()
  self.num_models = self._io:read_u4le()
end


MagicavoxelVox.Rgba = class.class(KaitaiStruct)

function MagicavoxelVox.Rgba:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function MagicavoxelVox.Rgba:_read()
  self.colors = {}
  for i = 0, 256 - 1 do
    self.colors[i + 1] = MagicavoxelVox.Color(self._io, self, self._root)
  end
end


MagicavoxelVox.Size = class.class(KaitaiStruct)

function MagicavoxelVox.Size:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function MagicavoxelVox.Size:_read()
  self.size_x = self._io:read_u4le()
  self.size_y = self._io:read_u4le()
  self.size_z = self._io:read_u4le()
end


MagicavoxelVox.Voxel = class.class(KaitaiStruct)

function MagicavoxelVox.Voxel:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function MagicavoxelVox.Voxel:_read()
  self.x = self._io:read_u1()
  self.y = self._io:read_u1()
  self.z = self._io:read_u1()
  self.color_index = self._io:read_u1()
end


MagicavoxelVox.Xyzi = class.class(KaitaiStruct)

function MagicavoxelVox.Xyzi:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function MagicavoxelVox.Xyzi:_read()
  self.num_voxels = self._io:read_u4le()
  self.voxels = {}
  for i = 0, self.num_voxels - 1 do
    self.voxels[i + 1] = MagicavoxelVox.Voxel(self._io, self, self._root)
  end
end



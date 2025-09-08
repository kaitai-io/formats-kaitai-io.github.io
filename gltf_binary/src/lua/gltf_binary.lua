-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- glTF is a format for distribution of 3D models optimized for being used in software
-- See also: Source (https://github.com/KhronosGroup/glTF/tree/2354846/specification/2.0#binary-gltf-layout)
GltfBinary = class.class(KaitaiStruct)

GltfBinary.ChunkType = enum.Enum {
  bin = 5130562,
  json = 1313821514,
}

function GltfBinary:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function GltfBinary:_read()
  self.header = GltfBinary.Header(self._io, self, self._root)
  self.chunks = {}
  local i = 0
  while not self._io:is_eof() do
    self.chunks[i + 1] = GltfBinary.Chunk(self._io, self, self._root)
    i = i + 1
  end
end


GltfBinary.Bin = class.class(KaitaiStruct)

function GltfBinary.Bin:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function GltfBinary.Bin:_read()
  self.data = self._io:read_bytes_full()
end


GltfBinary.Chunk = class.class(KaitaiStruct)

function GltfBinary.Chunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function GltfBinary.Chunk:_read()
  self.len_data = self._io:read_u4le()
  self.type = GltfBinary.ChunkType(self._io:read_u4le())
  local _on = self.type
  if _on == GltfBinary.ChunkType.bin then
    self._raw_data = self._io:read_bytes(self.len_data)
    local _io = KaitaiStream(stringstream(self._raw_data))
    self.data = GltfBinary.Bin(_io, self, self._root)
  elseif _on == GltfBinary.ChunkType.json then
    self._raw_data = self._io:read_bytes(self.len_data)
    local _io = KaitaiStream(stringstream(self._raw_data))
    self.data = GltfBinary.Json(_io, self, self._root)
  else
    self.data = self._io:read_bytes(self.len_data)
  end
end


GltfBinary.Header = class.class(KaitaiStruct)

function GltfBinary.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function GltfBinary.Header:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\103\108\084\070") then
    error("not equal, expected " .. "\103\108\084\070" .. ", but got " .. self.magic)
  end
  self.version = self._io:read_u4le()
  self.length = self._io:read_u4le()
end

-- 
-- Indicates the version of the Binary glTF container format.
-- For this specification, should be set to 2.
-- 
-- Total length of the Binary glTF, including Header and all Chunks, in bytes.

GltfBinary.Json = class.class(KaitaiStruct)

function GltfBinary.Json:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function GltfBinary.Json:_read()
  self.data = str_decode.decode(self._io:read_bytes_full(), "UTF-8")
end

-- 
-- This is where GLB deviates from being an elegant format.
-- To parse the rest of the file, you have to parse the JSON first.


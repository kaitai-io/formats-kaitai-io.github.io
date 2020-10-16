-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

GranTurismoVol = class.class(KaitaiStruct)

function GranTurismoVol:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function GranTurismoVol:_read()
  self.magic = self._io:read_bytes(8)
  if not(self.magic == "\071\084\070\083\000\000\000\000") then
    error("not equal, expected " ..  "\071\084\070\083\000\000\000\000" .. ", but got " .. self.magic)
  end
  self.num_files = self._io:read_u2le()
  self.num_entries = self._io:read_u2le()
  self.reserved = self._io:read_bytes(4)
  if not(self.reserved == "\000\000\000\000") then
    error("not equal, expected " ..  "\000\000\000\000" .. ", but got " .. self.reserved)
  end
  self.offsets = {}
  for i = 0, self.num_files - 1 do
    self.offsets[i + 1] = self._io:read_u4le()
  end
end

GranTurismoVol.property.ofs_dir = {}
function GranTurismoVol.property.ofs_dir:get()
  if self._m_ofs_dir ~= nil then
    return self._m_ofs_dir
  end

  self._m_ofs_dir = self.offsets[1 + 1]
  return self._m_ofs_dir
end

GranTurismoVol.property.files = {}
function GranTurismoVol.property.files:get()
  if self._m_files ~= nil then
    return self._m_files
  end

  local _pos = self._io:pos()
  self._io:seek((self.ofs_dir & 4294965248))
  self._m_files = {}
  for i = 0, self._root.num_entries - 1 do
    self._m_files[i + 1] = GranTurismoVol.FileInfo(self._io, self, self._root)
  end
  self._io:seek(_pos)
  return self._m_files
end


GranTurismoVol.FileInfo = class.class(KaitaiStruct)

function GranTurismoVol.FileInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function GranTurismoVol.FileInfo:_read()
  self.timestamp = self._io:read_u4le()
  self.offset_idx = self._io:read_u2le()
  self.flags = self._io:read_u1()
  self.name = str_decode.decode(KaitaiStream.bytes_terminate(KaitaiStream.bytes_strip_right(self._io:read_bytes(25), 0), 0, false), "ASCII")
end

GranTurismoVol.FileInfo.property.size = {}
function GranTurismoVol.FileInfo.property.size:get()
  if self._m_size ~= nil then
    return self._m_size
  end

  self._m_size = ((self._root.offsets[(self.offset_idx + 1) + 1] & 4294965248) - self._root.offsets[self.offset_idx + 1])
  return self._m_size
end

GranTurismoVol.FileInfo.property.body = {}
function GranTurismoVol.FileInfo.property.body:get()
  if self._m_body ~= nil then
    return self._m_body
  end

  if not(self.is_dir) then
    local _pos = self._io:pos()
    self._io:seek((self._root.offsets[self.offset_idx + 1] & 4294965248))
    self._m_body = self._io:read_bytes(self.size)
    self._io:seek(_pos)
  end
  return self._m_body
end

GranTurismoVol.FileInfo.property.is_dir = {}
function GranTurismoVol.FileInfo.property.is_dir:get()
  if self._m_is_dir ~= nil then
    return self._m_is_dir
  end

  self._m_is_dir = (self.flags & 1) ~= 0
  return self._m_is_dir
end

GranTurismoVol.FileInfo.property.is_last_entry = {}
function GranTurismoVol.FileInfo.property.is_last_entry:get()
  if self._m_is_last_entry ~= nil then
    return self._m_is_last_entry
  end

  self._m_is_last_entry = (self.flags & 128) ~= 0
  return self._m_is_last_entry
end



-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local str_decode = require("string_decode")
local utils = require("utils")

FalloutDat = class.class(KaitaiStruct)

FalloutDat.Compression = enum.Enum {
  none = 32,
  lzss = 64,
}

function FalloutDat:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function FalloutDat:_read()
  self.folder_count = self._io:read_u4be()
  self.unknown1 = self._io:read_u4be()
  self.unknown2 = self._io:read_u4be()
  self.timestamp = self._io:read_u4be()
  self.folder_names = {}
  for i = 0, self.folder_count - 1 do
    self.folder_names[i + 1] = FalloutDat.Pstr(self._io, self, self._root)
  end
  self.folders = {}
  for i = 0, self.folder_count - 1 do
    self.folders[i + 1] = FalloutDat.Folder(self._io, self, self._root)
  end
end


FalloutDat.Pstr = class.class(KaitaiStruct)

function FalloutDat.Pstr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function FalloutDat.Pstr:_read()
  self.size = self._io:read_u1()
  self.str = str_decode.decode(self._io:read_bytes(self.size), "ASCII")
end


FalloutDat.Folder = class.class(KaitaiStruct)

function FalloutDat.Folder:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function FalloutDat.Folder:_read()
  self.file_count = self._io:read_u4be()
  self.unknown = self._io:read_u4be()
  self.flags = self._io:read_u4be()
  self.timestamp = self._io:read_u4be()
  self.files = {}
  for i = 0, self.file_count - 1 do
    self.files[i + 1] = FalloutDat.File(self._io, self, self._root)
  end
end


FalloutDat.File = class.class(KaitaiStruct)

function FalloutDat.File:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function FalloutDat.File:_read()
  self.name = FalloutDat.Pstr(self._io, self, self._root)
  self.flags = FalloutDat.Compression(self._io:read_u4be())
  self.offset = self._io:read_u4be()
  self.size_unpacked = self._io:read_u4be()
  self.size_packed = self._io:read_u4be()
end

FalloutDat.File.property.contents = {}
function FalloutDat.File.property.contents:get()
  if self._m_contents ~= nil then
    return self._m_contents
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.offset)
  self._m_contents = _io:read_bytes(utils.box_unwrap((self.flags == FalloutDat.Compression.none) and utils.box_wrap(self.size_unpacked) or (self.size_packed)))
  _io:seek(_pos)
  return self._m_contents
end



-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

FtlDat = class.class(KaitaiStruct)

function FtlDat:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function FtlDat:_read()
  self.num_files = self._io:read_u4le()
  self.files = {}
  for i = 0, self.num_files - 1 do
    self.files[i + 1] = FtlDat.File(self._io, self, self._root)
  end
end

-- 
-- Number of files in the archive.

FtlDat.File = class.class(KaitaiStruct)

function FtlDat.File:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function FtlDat.File:_read()
  self.ofs_meta = self._io:read_u4le()
end

FtlDat.File.property.meta = {}
function FtlDat.File.property.meta:get()
  if self._m_meta ~= nil then
    return self._m_meta
  end

  if self.ofs_meta ~= 0 then
    local _pos = self._io:pos()
    self._io:seek(self.ofs_meta)
    self._m_meta = FtlDat.Meta(self._io, self, self._root)
    self._io:seek(_pos)
  end
  return self._m_meta
end


FtlDat.Meta = class.class(KaitaiStruct)

function FtlDat.Meta:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function FtlDat.Meta:_read()
  self.len_file = self._io:read_u4le()
  self.len_filename = self._io:read_u4le()
  self.filename = str_decode.decode(self._io:read_bytes(self.len_filename), "UTF-8")
  self.body = self._io:read_bytes(self.len_file)
end



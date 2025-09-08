-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- See also: Source (https://quakewiki.org/wiki/.pak#Format_specification)
QuakePak = class.class(KaitaiStruct)

function QuakePak:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function QuakePak:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\080\065\067\075") then
    error("not equal, expected " .. "\080\065\067\075" .. ", but got " .. self.magic)
  end
  self.ofs_index = self._io:read_u4le()
  self.len_index = self._io:read_u4le()
end

QuakePak.property.index = {}
function QuakePak.property.index:get()
  if self._m_index ~= nil then
    return self._m_index
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_index)
  self._raw__m_index = self._io:read_bytes(self.len_index)
  local _io = KaitaiStream(stringstream(self._raw__m_index))
  self._m_index = QuakePak.IndexStruct(_io, self, self._root)
  self._io:seek(_pos)
  return self._m_index
end


QuakePak.IndexEntry = class.class(KaitaiStruct)

function QuakePak.IndexEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function QuakePak.IndexEntry:_read()
  self.name = str_decode.decode(KaitaiStream.bytes_terminate(KaitaiStream.bytes_strip_right(self._io:read_bytes(56), 0), 0, false), "UTF-8")
  self.ofs = self._io:read_u4le()
  self.size = self._io:read_u4le()
end

QuakePak.IndexEntry.property.body = {}
function QuakePak.IndexEntry.property.body:get()
  if self._m_body ~= nil then
    return self._m_body
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.ofs)
  self._m_body = _io:read_bytes(self.size)
  _io:seek(_pos)
  return self._m_body
end


QuakePak.IndexStruct = class.class(KaitaiStruct)

function QuakePak.IndexStruct:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function QuakePak.IndexStruct:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = QuakePak.IndexEntry(self._io, self, self._root)
    i = i + 1
  end
end



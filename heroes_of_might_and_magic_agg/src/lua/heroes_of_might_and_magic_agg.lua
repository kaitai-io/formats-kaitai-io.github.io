-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- See also: Source (https://web.archive.org/web/20170215190034/http://rewiki.regengedanken.de/wiki/.AGG_(Heroes_of_Might_and_Magic))
HeroesOfMightAndMagicAgg = class.class(KaitaiStruct)

function HeroesOfMightAndMagicAgg:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function HeroesOfMightAndMagicAgg:_read()
  self.num_files = self._io:read_u2le()
  self.entries = {}
  for i = 0, self.num_files - 1 do
    self.entries[i + 1] = HeroesOfMightAndMagicAgg.Entry(self._io, self, self._root)
  end
end

HeroesOfMightAndMagicAgg.property.filenames = {}
function HeroesOfMightAndMagicAgg.property.filenames:get()
  if self._m_filenames ~= nil then
    return self._m_filenames
  end

  local _pos = self._io:pos()
  self._io:seek(self.entries[#self.entries].offset + self.entries[#self.entries].size)
  self._raw__m_filenames = {}
  self._m_filenames = {}
  for i = 0, self.num_files - 1 do
    self._raw__m_filenames[i + 1] = self._io:read_bytes(15)
    local _io = KaitaiStream(stringstream(self._raw__m_filenames[i + 1]))
    self._m_filenames[i + 1] = HeroesOfMightAndMagicAgg.Filename(_io, self, self._root)
  end
  self._io:seek(_pos)
  return self._m_filenames
end


HeroesOfMightAndMagicAgg.Entry = class.class(KaitaiStruct)

function HeroesOfMightAndMagicAgg.Entry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function HeroesOfMightAndMagicAgg.Entry:_read()
  self.hash = self._io:read_u2le()
  self.offset = self._io:read_u4le()
  self.size = self._io:read_u4le()
  self.size2 = self._io:read_u4le()
end

HeroesOfMightAndMagicAgg.Entry.property.body = {}
function HeroesOfMightAndMagicAgg.Entry.property.body:get()
  if self._m_body ~= nil then
    return self._m_body
  end

  local _pos = self._io:pos()
  self._io:seek(self.offset)
  self._m_body = self._io:read_bytes(self.size)
  self._io:seek(_pos)
  return self._m_body
end


HeroesOfMightAndMagicAgg.Filename = class.class(KaitaiStruct)

function HeroesOfMightAndMagicAgg.Filename:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function HeroesOfMightAndMagicAgg.Filename:_read()
  self.str = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ASCII")
end



-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

-- 
-- InfluxDB is a scalable database optimized for storage of time
-- series, real-time application metrics, operations monitoring events,
-- etc, written in Go.
-- 
-- Data is stored in .tsm files, which are kept pretty simple
-- conceptually. Each .tsm file contains a header and footer, which
-- stores offset to an index. Index is used to find a data block for a
-- requested time boundary.
Tsm = class.class(KaitaiStruct)

function Tsm:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Tsm:_read()
  self.header = Tsm.Header(self._io, self, self._root)
end

Tsm.property.index = {}
function Tsm.property.index:get()
  if self._m_index ~= nil then
    return self._m_index
  end

  local _pos = self._io:pos()
  self._io:seek(self._io:size() - 8)
  self._m_index = Tsm.Index(self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_index
end


Tsm.Header = class.class(KaitaiStruct)

function Tsm.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Tsm.Header:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\022\209\022\209") then
    error("not equal, expected " .. "\022\209\022\209" .. ", but got " .. self.magic)
  end
  self.version = self._io:read_u1()
end


Tsm.Index = class.class(KaitaiStruct)

function Tsm.Index:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Tsm.Index:_read()
  self.offset = self._io:read_u8be()
end

Tsm.Index.property.entries = {}
function Tsm.Index.property.entries:get()
  if self._m_entries ~= nil then
    return self._m_entries
  end

  local _pos = self._io:pos()
  self._io:seek(self.offset)
  self._m_entries = {}
  local i = 0
  while true do
    local _ = Tsm.Index.IndexHeader(self._io, self, self._root)
    self._m_entries[i + 1] = _
    if self._io:pos() == self._io:size() - 8 then
      break
    end
    i = i + 1
  end
  self._io:seek(_pos)
  return self._m_entries
end


Tsm.Index.IndexHeader = class.class(KaitaiStruct)

function Tsm.Index.IndexHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Tsm.Index.IndexHeader:_read()
  self.key_len = self._io:read_u2be()
  self.key = str_decode.decode(self._io:read_bytes(self.key_len), "UTF-8")
  self.type = self._io:read_u1()
  self.entry_count = self._io:read_u2be()
  self.index_entries = {}
  for i = 0, self.entry_count - 1 do
    self.index_entries[i + 1] = Tsm.Index.IndexHeader.IndexEntry(self._io, self, self._root)
  end
end


Tsm.Index.IndexHeader.IndexEntry = class.class(KaitaiStruct)

function Tsm.Index.IndexHeader.IndexEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Tsm.Index.IndexHeader.IndexEntry:_read()
  self.min_time = self._io:read_u8be()
  self.max_time = self._io:read_u8be()
  self.block_offset = self._io:read_u8be()
  self.block_size = self._io:read_u4be()
end

Tsm.Index.IndexHeader.IndexEntry.property.block = {}
function Tsm.Index.IndexHeader.IndexEntry.property.block:get()
  if self._m_block ~= nil then
    return self._m_block
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.block_offset)
  self._m_block = Tsm.Index.IndexHeader.IndexEntry.BlockEntry(_io, self, self._root)
  _io:seek(_pos)
  return self._m_block
end


Tsm.Index.IndexHeader.IndexEntry.BlockEntry = class.class(KaitaiStruct)

function Tsm.Index.IndexHeader.IndexEntry.BlockEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Tsm.Index.IndexHeader.IndexEntry.BlockEntry:_read()
  self.crc32 = self._io:read_u4be()
  self.data = self._io:read_bytes(self._parent.block_size - 4)
end



-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- See also: Source (https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Reader.hx)
HeapsPak = class.class(KaitaiStruct)

function HeapsPak:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function HeapsPak:_read()
  self.header = HeapsPak.Header(self._io, self, self._root)
end


HeapsPak.Header = class.class(KaitaiStruct)

function HeapsPak.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function HeapsPak.Header:_read()
  self.magic1 = self._io:read_bytes(3)
  if not(self.magic1 == "\080\065\075") then
    error("not equal, expected " ..  "\080\065\075" .. ", but got " .. self.magic1)
  end
  self.version = self._io:read_u1()
  self.len_header = self._io:read_u4le()
  self.len_data = self._io:read_u4le()
  self._raw_root_entry = self._io:read_bytes((self.len_header - 16))
  local _io = KaitaiStream(stringstream(self._raw_root_entry))
  self.root_entry = HeapsPak.Header.Entry(_io, self, self._root)
  self.magic2 = self._io:read_bytes(4)
  if not(self.magic2 == "\068\065\084\065") then
    error("not equal, expected " ..  "\068\065\084\065" .. ", but got " .. self.magic2)
  end
end


-- 
-- See also: Source (https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Data.hx)
HeapsPak.Header.Entry = class.class(KaitaiStruct)

function HeapsPak.Header.Entry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function HeapsPak.Header.Entry:_read()
  self.len_name = self._io:read_u1()
  self.name = str_decode.decode(self._io:read_bytes(self.len_name), "UTF-8")
  self.flags = HeapsPak.Header.Entry.Flags(self._io, self, self._root)
  local _on = self.flags.is_dir
  if _on == true then
    self.body = HeapsPak.Header.Dir(self._io, self, self._root)
  elseif _on == false then
    self.body = HeapsPak.Header.File(self._io, self, self._root)
  end
end


HeapsPak.Header.Entry.Flags = class.class(KaitaiStruct)

function HeapsPak.Header.Entry.Flags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function HeapsPak.Header.Entry.Flags:_read()
  self.unused = self._io:read_bits_int_be(7)
  self.is_dir = self._io:read_bits_int_be(1)
end


HeapsPak.Header.File = class.class(KaitaiStruct)

function HeapsPak.Header.File:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function HeapsPak.Header.File:_read()
  self.ofs_data = self._io:read_u4le()
  self.len_data = self._io:read_u4le()
  self.checksum = self._io:read_bytes(4)
end

HeapsPak.Header.File.property.data = {}
function HeapsPak.Header.File.property.data:get()
  if self._m_data ~= nil then
    return self._m_data
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek((self._root.header.len_header + self.ofs_data))
  self._m_data = _io:read_bytes(self.len_data)
  _io:seek(_pos)
  return self._m_data
end


HeapsPak.Header.Dir = class.class(KaitaiStruct)

function HeapsPak.Header.Dir:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function HeapsPak.Header.Dir:_read()
  self.num_entries = self._io:read_u4le()
  self.entries = {}
  for i = 0, self.num_entries - 1 do
    self.entries[i + 1] = HeapsPak.Header.Entry(self._io, self, self._root)
  end
end



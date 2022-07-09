-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local str_decode = require("string_decode")
local utils = require("utils")

Fallout2Dat = class.class(KaitaiStruct)

Fallout2Dat.Compression = enum.Enum {
  none = 0,
  zlib = 1,
}

function Fallout2Dat:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Fallout2Dat:_read()
end

Fallout2Dat.property.footer = {}
function Fallout2Dat.property.footer:get()
  if self._m_footer ~= nil then
    return self._m_footer
  end

  local _pos = self._io:pos()
  self._io:seek((self._io:size() - 8))
  self._m_footer = Fallout2Dat.Footer(self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_footer
end

Fallout2Dat.property.index = {}
function Fallout2Dat.property.index:get()
  if self._m_index ~= nil then
    return self._m_index
  end

  local _pos = self._io:pos()
  self._io:seek(((self._io:size() - 8) - self.footer.index_size))
  self._m_index = Fallout2Dat.Index(self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_index
end


Fallout2Dat.Pstr = class.class(KaitaiStruct)

function Fallout2Dat.Pstr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Fallout2Dat.Pstr:_read()
  self.size = self._io:read_u4le()
  self.str = str_decode.decode(self._io:read_bytes(self.size), "ASCII")
end


Fallout2Dat.Footer = class.class(KaitaiStruct)

function Fallout2Dat.Footer:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Fallout2Dat.Footer:_read()
  self.index_size = self._io:read_u4le()
  self.file_size = self._io:read_u4le()
end


Fallout2Dat.Index = class.class(KaitaiStruct)

function Fallout2Dat.Index:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Fallout2Dat.Index:_read()
  self.file_count = self._io:read_u4le()
  self.files = {}
  for i = 0, self.file_count - 1 do
    self.files[i + 1] = Fallout2Dat.File(self._io, self, self._root)
  end
end


Fallout2Dat.File = class.class(KaitaiStruct)

function Fallout2Dat.File:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Fallout2Dat.File:_read()
  self.name = Fallout2Dat.Pstr(self._io, self, self._root)
  self.flags = Fallout2Dat.Compression(self._io:read_u1())
  self.size_unpacked = self._io:read_u4le()
  self.size_packed = self._io:read_u4le()
  self.offset = self._io:read_u4le()
end

Fallout2Dat.File.property.contents_raw = {}
function Fallout2Dat.File.property.contents_raw:get()
  if self._m_contents_raw ~= nil then
    return self._m_contents_raw
  end

  if self.flags == Fallout2Dat.Compression.none then
    local _io = self._root._io
    local _pos = _io:pos()
    _io:seek(self.offset)
    self._m_contents_raw = _io:read_bytes(self.size_unpacked)
    _io:seek(_pos)
  end
  return self._m_contents_raw
end

Fallout2Dat.File.property.contents_zlib = {}
function Fallout2Dat.File.property.contents_zlib:get()
  if self._m_contents_zlib ~= nil then
    return self._m_contents_zlib
  end

  if self.flags == Fallout2Dat.Compression.zlib then
    local _io = self._root._io
    local _pos = _io:pos()
    _io:seek(self.offset)
    self._raw__m_contents_zlib = _io:read_bytes(self.size_packed)
    self._m_contents_zlib = KaitaiStream.process_zlib(self._raw__m_contents_zlib)
    _io:seek(_pos)
  end
  return self._m_contents_zlib
end

Fallout2Dat.File.property.contents = {}
function Fallout2Dat.File.property.contents:get()
  if self._m_contents ~= nil then
    return self._m_contents
  end

  if  ((self.flags == Fallout2Dat.Compression.zlib) or (self.flags == Fallout2Dat.Compression.none))  then
    self._m_contents = utils.box_unwrap((self.flags == Fallout2Dat.Compression.zlib) and utils.box_wrap(self.contents_zlib) or (self.contents_raw))
  end
  return self._m_contents
end



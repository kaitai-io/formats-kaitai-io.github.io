-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local str_decode = require("string_decode")
local utils = require("utils")

-- 
-- See also: Source (http://www.shikadi.net/moddingwiki/PAK_Format_(Westwood))
Dune2Pak = class.class(KaitaiStruct)

function Dune2Pak:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dune2Pak:_read()
  self._raw_dir = self._io:read_bytes(self.dir_size)
  local _io = KaitaiStream(stringstream(self._raw_dir))
  self.dir = Dune2Pak.Files(_io, self, self._root)
end

Dune2Pak.property.dir_size = {}
function Dune2Pak.property.dir_size:get()
  if self._m_dir_size ~= nil then
    return self._m_dir_size
  end

  local _pos = self._io:pos()
  self._io:seek(0)
  self._m_dir_size = self._io:read_u4le()
  self._io:seek(_pos)
  return self._m_dir_size
end


Dune2Pak.Files = class.class(KaitaiStruct)

function Dune2Pak.Files:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Dune2Pak.Files:_read()
  self.files = {}
  local i = 0
  while not self._io:is_eof() do
    self.files[i + 1] = Dune2Pak.File(i, self._io, self, self._root)
    i = i + 1
  end
end


Dune2Pak.File = class.class(KaitaiStruct)

function Dune2Pak.File:_init(idx, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.idx = idx
  self:_read()
end

function Dune2Pak.File:_read()
  self.ofs = self._io:read_u4le()
  if self.ofs ~= 0 then
    self.file_name = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ASCII")
  end
end

Dune2Pak.File.property.next_ofs0 = {}
function Dune2Pak.File.property.next_ofs0:get()
  if self._m_next_ofs0 ~= nil then
    return self._m_next_ofs0
  end

  if self.ofs ~= 0 then
    self._m_next_ofs0 = self._root.dir.files[(self.idx + 1) + 1].ofs
  end
  return self._m_next_ofs0
end

Dune2Pak.File.property.next_ofs = {}
function Dune2Pak.File.property.next_ofs:get()
  if self._m_next_ofs ~= nil then
    return self._m_next_ofs
  end

  if self.ofs ~= 0 then
    self._m_next_ofs = utils.box_unwrap((self.next_ofs0 == 0) and utils.box_wrap(self._root._io:size()) or (self.next_ofs0))
  end
  return self._m_next_ofs
end

Dune2Pak.File.property.body = {}
function Dune2Pak.File.property.body:get()
  if self._m_body ~= nil then
    return self._m_body
  end

  if self.ofs ~= 0 then
    local _io = self._root._io
    local _pos = _io:pos()
    _io:seek(self.ofs)
    self._m_body = _io:read_bytes((self.next_ofs - self.ofs))
    _io:seek(_pos)
  end
  return self._m_body
end



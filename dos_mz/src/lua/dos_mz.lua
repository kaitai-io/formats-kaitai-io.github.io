-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local utils = require("utils")
local str_decode = require("string_decode")

-- 
-- DOS MZ file format is a traditional format for executables in MS-DOS
-- environment. Many modern formats (i.e. Windows PE) still maintain
-- compatibility stub with this format.
-- 
-- As opposed to .com file format (which basically sports one 64K code
-- segment of raw CPU instructions), DOS MZ .exe file format allowed
-- more flexible memory management, loading of larger programs and
-- added support for relocations.
-- See also: Source (http://www.delorie.com/djgpp/doc/exe/)
DosMz = class.class(KaitaiStruct)

function DosMz:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DosMz:_read()
  self.header = DosMz.ExeHeader(self._io, self, self._root)
  self.body = self._io:read_bytes(self.header.len_body)
end

DosMz.property.relocations = {}
function DosMz.property.relocations:get()
  if self._m_relocations ~= nil then
    return self._m_relocations
  end

  if self.header.mz.ofs_relocations ~= 0 then
    local _io = self.header._io
    local _pos = _io:pos()
    _io:seek(self.header.mz.ofs_relocations)
    self._m_relocations = {}
    for i = 0, self.header.mz.num_relocations - 1 do
      self._m_relocations[i + 1] = DosMz.Relocation(_io, self, self._root)
    end
    _io:seek(_pos)
  end
  return self._m_relocations
end


DosMz.ExeHeader = class.class(KaitaiStruct)

function DosMz.ExeHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function DosMz.ExeHeader:_read()
  self.mz = DosMz.MzHeader(self._io, self, self._root)
  self.rest_of_header = self._io:read_bytes(self.mz.len_header - 28)
end

DosMz.ExeHeader.property.len_body = {}
function DosMz.ExeHeader.property.len_body:get()
  if self._m_len_body ~= nil then
    return self._m_len_body
  end

  self._m_len_body = utils.box_unwrap((self.mz.last_page_extra_bytes == 0) and utils.box_wrap(self.mz.num_pages * 512) or ((self.mz.num_pages - 1) * 512 + self.mz.last_page_extra_bytes)) - self.mz.len_header
  return self._m_len_body
end


DosMz.MzHeader = class.class(KaitaiStruct)

function DosMz.MzHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function DosMz.MzHeader:_read()
  self.magic = str_decode.decode(self._io:read_bytes(2), "ASCII")
  if not( ((self.magic == "MZ") or (self.magic == "ZM")) ) then
    error("ValidationNotAnyOfError")
  end
  self.last_page_extra_bytes = self._io:read_u2le()
  self.num_pages = self._io:read_u2le()
  self.num_relocations = self._io:read_u2le()
  self.header_size = self._io:read_u2le()
  self.min_allocation = self._io:read_u2le()
  self.max_allocation = self._io:read_u2le()
  self.initial_ss = self._io:read_u2le()
  self.initial_sp = self._io:read_u2le()
  self.checksum = self._io:read_u2le()
  self.initial_ip = self._io:read_u2le()
  self.initial_cs = self._io:read_u2le()
  self.ofs_relocations = self._io:read_u2le()
  self.overlay_id = self._io:read_u2le()
end

DosMz.MzHeader.property.len_header = {}
function DosMz.MzHeader.property.len_header:get()
  if self._m_len_header ~= nil then
    return self._m_len_header
  end

  self._m_len_header = self.header_size * 16
  return self._m_len_header
end


DosMz.Relocation = class.class(KaitaiStruct)

function DosMz.Relocation:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function DosMz.Relocation:_read()
  self.ofs = self._io:read_u2le()
  self.seg = self._io:read_u2le()
end



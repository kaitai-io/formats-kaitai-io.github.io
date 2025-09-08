-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

SaintsRow2VppPc = class.class(KaitaiStruct)

function SaintsRow2VppPc:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SaintsRow2VppPc:_read()
  self.magic = self._io:read_bytes(5)
  if not(self.magic == "\206\010\137\081\004") then
    error("not equal, expected " .. "\206\010\137\081\004" .. ", but got " .. self.magic)
  end
  self.pad1 = self._io:read_bytes(335)
  self.num_files = self._io:read_s4le()
  self.container_size = self._io:read_s4le()
  self.len_offsets = self._io:read_s4le()
  self.len_filenames = self._io:read_s4le()
  self.len_extensions = self._io:read_s4le()
  self.smth5 = self._io:read_s4le()
  self.smth6 = self._io:read_s4le()
  self.smth7 = self._io:read_s4le()
  self.smth8 = self._io:read_s4le()
  self.smth9 = self._io:read_s4le()
end

SaintsRow2VppPc.property.data_start = {}
function SaintsRow2VppPc.property.data_start:get()
  if self._m_data_start ~= nil then
    return self._m_data_start
  end

  self._m_data_start = (self.ofs_extensions + self.len_extensions & 4294965248) + 2048
  return self._m_data_start
end

SaintsRow2VppPc.property.extensions = {}
function SaintsRow2VppPc.property.extensions:get()
  if self._m_extensions ~= nil then
    return self._m_extensions
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_extensions)
  self._raw__m_extensions = self._io:read_bytes(self.len_extensions)
  local _io = KaitaiStream(stringstream(self._raw__m_extensions))
  self._m_extensions = SaintsRow2VppPc.Strings(_io, self, self._root)
  self._io:seek(_pos)
  return self._m_extensions
end

SaintsRow2VppPc.property.filenames = {}
function SaintsRow2VppPc.property.filenames:get()
  if self._m_filenames ~= nil then
    return self._m_filenames
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_filenames)
  self._raw__m_filenames = self._io:read_bytes(self.len_filenames)
  local _io = KaitaiStream(stringstream(self._raw__m_filenames))
  self._m_filenames = SaintsRow2VppPc.Strings(_io, self, self._root)
  self._io:seek(_pos)
  return self._m_filenames
end

SaintsRow2VppPc.property.files = {}
function SaintsRow2VppPc.property.files:get()
  if self._m_files ~= nil then
    return self._m_files
  end

  local _pos = self._io:pos()
  self._io:seek(2048)
  self._raw__m_files = self._io:read_bytes(self.len_offsets)
  local _io = KaitaiStream(stringstream(self._raw__m_files))
  self._m_files = SaintsRow2VppPc.Offsets(_io, self, self._root)
  self._io:seek(_pos)
  return self._m_files
end

SaintsRow2VppPc.property.ofs_extensions = {}
function SaintsRow2VppPc.property.ofs_extensions:get()
  if self._m_ofs_extensions ~= nil then
    return self._m_ofs_extensions
  end

  self._m_ofs_extensions = (self.ofs_filenames + self.len_filenames & 4294965248) + 2048
  return self._m_ofs_extensions
end

SaintsRow2VppPc.property.ofs_filenames = {}
function SaintsRow2VppPc.property.ofs_filenames:get()
  if self._m_ofs_filenames ~= nil then
    return self._m_ofs_filenames
  end

  self._m_ofs_filenames = (2048 + self.len_offsets & 4294965248) + 2048
  return self._m_ofs_filenames
end


SaintsRow2VppPc.Offsets = class.class(KaitaiStruct)

function SaintsRow2VppPc.Offsets:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function SaintsRow2VppPc.Offsets:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = SaintsRow2VppPc.Offsets.Offset(self._io, self, self._root)
    i = i + 1
  end
end


SaintsRow2VppPc.Offsets.Offset = class.class(KaitaiStruct)

function SaintsRow2VppPc.Offsets.Offset:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function SaintsRow2VppPc.Offsets.Offset:_read()
  self.name_ofs = self._io:read_u4le()
  self.ext_ofs = self._io:read_u4le()
  self.smth2 = self._io:read_s4le()
  self.ofs_body = self._io:read_s4le()
  self.len_body = self._io:read_s4le()
  self.always_minus_1 = self._io:read_s4le()
  self.always_zero = self._io:read_s4le()
end

SaintsRow2VppPc.Offsets.Offset.property.body = {}
function SaintsRow2VppPc.Offsets.Offset.property.body:get()
  if self._m_body ~= nil then
    return self._m_body
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self._root.data_start + self.ofs_body)
  self._m_body = _io:read_bytes(self.len_body)
  _io:seek(_pos)
  return self._m_body
end

SaintsRow2VppPc.Offsets.Offset.property.ext = {}
function SaintsRow2VppPc.Offsets.Offset.property.ext:get()
  if self._m_ext ~= nil then
    return self._m_ext
  end

  local _io = self._root.extensions._io
  local _pos = _io:pos()
  _io:seek(self.ext_ofs)
  self._m_ext = str_decode.decode(_io:read_bytes_term(0, false, true, true), "UTF-8")
  _io:seek(_pos)
  return self._m_ext
end

SaintsRow2VppPc.Offsets.Offset.property.filename = {}
function SaintsRow2VppPc.Offsets.Offset.property.filename:get()
  if self._m_filename ~= nil then
    return self._m_filename
  end

  local _io = self._root.filenames._io
  local _pos = _io:pos()
  _io:seek(self.name_ofs)
  self._m_filename = str_decode.decode(_io:read_bytes_term(0, false, true, true), "UTF-8")
  _io:seek(_pos)
  return self._m_filename
end


SaintsRow2VppPc.Strings = class.class(KaitaiStruct)

function SaintsRow2VppPc.Strings:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function SaintsRow2VppPc.Strings:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "UTF-8")
    i = i + 1
  end
end



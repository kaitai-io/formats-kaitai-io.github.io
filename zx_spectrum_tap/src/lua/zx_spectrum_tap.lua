-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")

-- 
-- TAP files are used by emulators of ZX Spectrum computer (released in
-- 1982 by Sinclair Research). TAP file stores blocks of data as if
-- they are written to magnetic tape, which was used as primary media
-- for ZX Spectrum. Contents of this file can be viewed as a very
-- simple linear filesystem, storing named files with some basic
-- metainformation prepended as a header.
-- See also: Source (https://faqwiki.zxnet.co.uk/wiki/TAP_format)
ZxSpectrumTap = class.class(KaitaiStruct)

ZxSpectrumTap.FlagEnum = enum.Enum {
  header = 0,
  data = 255,
}

ZxSpectrumTap.HeaderTypeEnum = enum.Enum {
  program = 0,
  num_array = 1,
  char_array = 2,
  bytes = 3,
}

function ZxSpectrumTap:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ZxSpectrumTap:_read()
  self.blocks = {}
  local i = 0
  while not self._io:is_eof() do
    self.blocks[i + 1] = ZxSpectrumTap.Block(self._io, self, self._root)
    i = i + 1
  end
end


ZxSpectrumTap.Block = class.class(KaitaiStruct)

function ZxSpectrumTap.Block:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ZxSpectrumTap.Block:_read()
  self.len_block = self._io:read_u2le()
  self.flag = ZxSpectrumTap.FlagEnum(self._io:read_u1())
  if  ((self.len_block == 19) and (self.flag == ZxSpectrumTap.FlagEnum.header))  then
    self.header = ZxSpectrumTap.Header(self._io, self, self._root)
  end
  if self.len_block == 19 then
    self.data = self._io:read_bytes((self.header.len_data + 4))
  end
  if self.flag == ZxSpectrumTap.FlagEnum.data then
    self.headerless_data = self._io:read_bytes((self.len_block - 1))
  end
end


ZxSpectrumTap.ProgramParams = class.class(KaitaiStruct)

function ZxSpectrumTap.ProgramParams:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ZxSpectrumTap.ProgramParams:_read()
  self.autostart_line = self._io:read_u2le()
  self.len_program = self._io:read_u2le()
end


ZxSpectrumTap.BytesParams = class.class(KaitaiStruct)

function ZxSpectrumTap.BytesParams:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ZxSpectrumTap.BytesParams:_read()
  self.start_address = self._io:read_u2le()
  self.reserved = self._io:read_bytes(2)
end


ZxSpectrumTap.Header = class.class(KaitaiStruct)

function ZxSpectrumTap.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ZxSpectrumTap.Header:_read()
  self.header_type = ZxSpectrumTap.HeaderTypeEnum(self._io:read_u1())
  self.filename = KaitaiStream.bytes_strip_right(self._io:read_bytes(10), 32)
  self.len_data = self._io:read_u2le()
  local _on = self.header_type
  if _on == ZxSpectrumTap.HeaderTypeEnum.program then
    self.params = ZxSpectrumTap.ProgramParams(self._io, self, self._root)
  elseif _on == ZxSpectrumTap.HeaderTypeEnum.num_array then
    self.params = ZxSpectrumTap.ArrayParams(self._io, self, self._root)
  elseif _on == ZxSpectrumTap.HeaderTypeEnum.char_array then
    self.params = ZxSpectrumTap.ArrayParams(self._io, self, self._root)
  elseif _on == ZxSpectrumTap.HeaderTypeEnum.bytes then
    self.params = ZxSpectrumTap.BytesParams(self._io, self, self._root)
  end
  self.checksum = self._io:read_u1()
end

-- 
-- Bitwise XOR of all bytes including the flag byte.

ZxSpectrumTap.ArrayParams = class.class(KaitaiStruct)

function ZxSpectrumTap.ArrayParams:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ZxSpectrumTap.ArrayParams:_read()
  self.reserved = self._io:read_u1()
  self.var_name = self._io:read_u1()
  self.reserved1 = self._io:read_bytes(2)
  if not(self.reserved1 == "\000\128") then
    error("not equal, expected " ..  "\000\128" .. ", but got " .. self.reserved1)
  end
end

-- 
-- Variable name (1..26 meaning A$..Z$ +192).


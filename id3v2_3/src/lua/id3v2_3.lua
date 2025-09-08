-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

-- 
-- See also: Source (https://id3.org/id3v2.3.0)
Id3v23 = class.class(KaitaiStruct)

function Id3v23:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Id3v23:_read()
  self.tag = Id3v23.Tag(self._io, self, self._root)
end


-- 
-- See also: Section 3.3. ID3v2 frame overview
Id3v23.Frame = class.class(KaitaiStruct)

function Id3v23.Frame:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Id3v23.Frame:_read()
  self.id = str_decode.decode(self._io:read_bytes(4), "ASCII")
  self.size = self._io:read_u4be()
  self.flags = Id3v23.Frame.Flags(self._io, self, self._root)
  self.data = self._io:read_bytes(self.size)
end

Id3v23.Frame.property.is_invalid = {}
function Id3v23.Frame.property.is_invalid:get()
  if self._m_is_invalid ~= nil then
    return self._m_is_invalid
  end

  self._m_is_invalid = self.id == "\000\000\000\000"
  return self._m_is_invalid
end


Id3v23.Frame.Flags = class.class(KaitaiStruct)

function Id3v23.Frame.Flags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Id3v23.Frame.Flags:_read()
  self.flag_discard_alter_tag = self._io:read_bits_int_be(1) ~= 0
  self.flag_discard_alter_file = self._io:read_bits_int_be(1) ~= 0
  self.flag_read_only = self._io:read_bits_int_be(1) ~= 0
  self.reserved1 = self._io:read_bits_int_be(5)
  self.flag_compressed = self._io:read_bits_int_be(1) ~= 0
  self.flag_encrypted = self._io:read_bits_int_be(1) ~= 0
  self.flag_grouping = self._io:read_bits_int_be(1) ~= 0
  self.reserved2 = self._io:read_bits_int_be(5)
end


-- 
-- ID3v2 fixed header.
-- See also: Section 3.1. ID3v2 header
Id3v23.Header = class.class(KaitaiStruct)

function Id3v23.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Id3v23.Header:_read()
  self.magic = self._io:read_bytes(3)
  if not(self.magic == "\073\068\051") then
    error("not equal, expected " .. "\073\068\051" .. ", but got " .. self.magic)
  end
  self.version_major = self._io:read_u1()
  self.version_revision = self._io:read_u1()
  self.flags = Id3v23.Header.Flags(self._io, self, self._root)
  self.size = Id3v23.U4beSynchsafe(self._io, self, self._root)
end


Id3v23.Header.Flags = class.class(KaitaiStruct)

function Id3v23.Header.Flags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Id3v23.Header.Flags:_read()
  self.flag_unsynchronization = self._io:read_bits_int_be(1) ~= 0
  self.flag_headerex = self._io:read_bits_int_be(1) ~= 0
  self.flag_experimental = self._io:read_bits_int_be(1) ~= 0
  self.reserved = self._io:read_bits_int_be(5)
end


-- 
-- ID3v2 extended header.
-- See also: Section 3.2. ID3v2 extended header
Id3v23.HeaderEx = class.class(KaitaiStruct)

function Id3v23.HeaderEx:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Id3v23.HeaderEx:_read()
  self.size = self._io:read_u4be()
  self.flags_ex = Id3v23.HeaderEx.FlagsEx(self._io, self, self._root)
  self.padding_size = self._io:read_u4be()
  if self.flags_ex.flag_crc then
    self.crc = self._io:read_u4be()
  end
end


Id3v23.HeaderEx.FlagsEx = class.class(KaitaiStruct)

function Id3v23.HeaderEx.FlagsEx:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Id3v23.HeaderEx.FlagsEx:_read()
  self.flag_crc = self._io:read_bits_int_be(1) ~= 0
  self.reserved = self._io:read_bits_int_be(15)
end


-- 
-- See also: Section 3. ID3v2 overview
Id3v23.Tag = class.class(KaitaiStruct)

function Id3v23.Tag:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Id3v23.Tag:_read()
  self.header = Id3v23.Header(self._io, self, self._root)
  if self.header.flags.flag_headerex then
    self.header_ex = Id3v23.HeaderEx(self._io, self, self._root)
  end
  self.frames = {}
  local i = 0
  while true do
    local _ = Id3v23.Frame(self._io, self, self._root)
    self.frames[i + 1] = _
    if  ((self._io:pos() + _.size > self.header.size.value) or (_.is_invalid))  then
      break
    end
    i = i + 1
  end
  if self.header.flags.flag_headerex then
    self.padding = self._io:read_bytes(self.header_ex.padding_size - self._io:pos())
  end
end


Id3v23.U1beSynchsafe = class.class(KaitaiStruct)

function Id3v23.U1beSynchsafe:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Id3v23.U1beSynchsafe:_read()
  self.padding = self._io:read_bits_int_be(1) ~= 0
  self.value = self._io:read_bits_int_be(7)
end


Id3v23.U2beSynchsafe = class.class(KaitaiStruct)

function Id3v23.U2beSynchsafe:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Id3v23.U2beSynchsafe:_read()
  self.byte0 = Id3v23.U1beSynchsafe(self._io, self, self._root)
  self.byte1 = Id3v23.U1beSynchsafe(self._io, self, self._root)
end

Id3v23.U2beSynchsafe.property.value = {}
function Id3v23.U2beSynchsafe.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = self.byte0.value << 7 | self.byte1.value
  return self._m_value
end


Id3v23.U4beSynchsafe = class.class(KaitaiStruct)

function Id3v23.U4beSynchsafe:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Id3v23.U4beSynchsafe:_read()
  self.short0 = Id3v23.U2beSynchsafe(self._io, self, self._root)
  self.short1 = Id3v23.U2beSynchsafe(self._io, self, self._root)
end

Id3v23.U4beSynchsafe.property.value = {}
function Id3v23.U4beSynchsafe.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = self.short0.value << 14 | self.short1.value
  return self._m_value
end



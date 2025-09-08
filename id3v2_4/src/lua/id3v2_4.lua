-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

-- 
-- See also: Source (http://id3.org/id3v2.4.0-structure)
-- See also: Source (http://id3.org/id3v2.4.0-frames)
Id3v24 = class.class(KaitaiStruct)

function Id3v24:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Id3v24:_read()
  self.tag = Id3v24.Tag(self._io, self, self._root)
end


Id3v24.Footer = class.class(KaitaiStruct)

function Id3v24.Footer:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Id3v24.Footer:_read()
  self.magic = self._io:read_bytes(3)
  if not(self.magic == "\051\068\073") then
    error("not equal, expected " .. "\051\068\073" .. ", but got " .. self.magic)
  end
  self.version_major = self._io:read_u1()
  self.version_revision = self._io:read_u1()
  self.flags = Id3v24.Footer.Flags(self._io, self, self._root)
  self.size = Id3v24.U4beSynchsafe(self._io, self, self._root)
end


Id3v24.Footer.Flags = class.class(KaitaiStruct)

function Id3v24.Footer.Flags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Id3v24.Footer.Flags:_read()
  self.flag_unsynchronization = self._io:read_bits_int_be(1) ~= 0
  self.flag_headerex = self._io:read_bits_int_be(1) ~= 0
  self.flag_experimental = self._io:read_bits_int_be(1) ~= 0
  self.flag_footer = self._io:read_bits_int_be(1) ~= 0
  self.reserved = self._io:read_bits_int_be(4)
end


Id3v24.Frame = class.class(KaitaiStruct)

function Id3v24.Frame:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Id3v24.Frame:_read()
  self.id = str_decode.decode(self._io:read_bytes(4), "ASCII")
  self.size = Id3v24.U4beSynchsafe(self._io, self, self._root)
  self.flags_status = Id3v24.Frame.FlagsStatus(self._io, self, self._root)
  self.flags_format = Id3v24.Frame.FlagsFormat(self._io, self, self._root)
  self.data = self._io:read_bytes(self.size.value)
end

Id3v24.Frame.property.is_invalid = {}
function Id3v24.Frame.property.is_invalid:get()
  if self._m_is_invalid ~= nil then
    return self._m_is_invalid
  end

  self._m_is_invalid = self.id == "\000\000\000\000"
  return self._m_is_invalid
end


Id3v24.Frame.FlagsFormat = class.class(KaitaiStruct)

function Id3v24.Frame.FlagsFormat:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Id3v24.Frame.FlagsFormat:_read()
  self.reserved1 = self._io:read_bits_int_be(1) ~= 0
  self.flag_grouping = self._io:read_bits_int_be(1) ~= 0
  self.reserved2 = self._io:read_bits_int_be(2)
  self.flag_compressed = self._io:read_bits_int_be(1) ~= 0
  self.flag_encrypted = self._io:read_bits_int_be(1) ~= 0
  self.flag_unsynchronisated = self._io:read_bits_int_be(1) ~= 0
  self.flag_indicator = self._io:read_bits_int_be(1) ~= 0
end


Id3v24.Frame.FlagsStatus = class.class(KaitaiStruct)

function Id3v24.Frame.FlagsStatus:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Id3v24.Frame.FlagsStatus:_read()
  self.reserved1 = self._io:read_bits_int_be(1) ~= 0
  self.flag_discard_alter_tag = self._io:read_bits_int_be(1) ~= 0
  self.flag_discard_alter_file = self._io:read_bits_int_be(1) ~= 0
  self.flag_read_only = self._io:read_bits_int_be(1) ~= 0
  self.reserved2 = self._io:read_bits_int_be(4)
end


Id3v24.Header = class.class(KaitaiStruct)

function Id3v24.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Id3v24.Header:_read()
  self.magic = self._io:read_bytes(3)
  if not(self.magic == "\073\068\051") then
    error("not equal, expected " .. "\073\068\051" .. ", but got " .. self.magic)
  end
  self.version_major = self._io:read_u1()
  self.version_revision = self._io:read_u1()
  self.flags = Id3v24.Header.Flags(self._io, self, self._root)
  self.size = Id3v24.U4beSynchsafe(self._io, self, self._root)
end


Id3v24.Header.Flags = class.class(KaitaiStruct)

function Id3v24.Header.Flags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Id3v24.Header.Flags:_read()
  self.flag_unsynchronization = self._io:read_bits_int_be(1) ~= 0
  self.flag_headerex = self._io:read_bits_int_be(1) ~= 0
  self.flag_experimental = self._io:read_bits_int_be(1) ~= 0
  self.flag_footer = self._io:read_bits_int_be(1) ~= 0
  self.reserved = self._io:read_bits_int_be(4)
end


Id3v24.HeaderEx = class.class(KaitaiStruct)

function Id3v24.HeaderEx:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Id3v24.HeaderEx:_read()
  self.size = Id3v24.U4beSynchsafe(self._io, self, self._root)
  self.flags_ex = Id3v24.HeaderEx.FlagsEx(self._io, self, self._root)
  self.data = self._io:read_bytes(self.size.value - 5)
end


Id3v24.HeaderEx.FlagsEx = class.class(KaitaiStruct)

function Id3v24.HeaderEx.FlagsEx:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Id3v24.HeaderEx.FlagsEx:_read()
  self.reserved1 = self._io:read_bits_int_be(1) ~= 0
  self.flag_update = self._io:read_bits_int_be(1) ~= 0
  self.flag_crc = self._io:read_bits_int_be(1) ~= 0
  self.flag_restrictions = self._io:read_bits_int_be(1) ~= 0
  self.reserved2 = self._io:read_bits_int_be(4)
end


Id3v24.Padding = class.class(KaitaiStruct)

function Id3v24.Padding:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Id3v24.Padding:_read()
  self.padding = self._io:read_bytes(self._root.tag.header.size.value - self._io:pos())
end


Id3v24.Tag = class.class(KaitaiStruct)

function Id3v24.Tag:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Id3v24.Tag:_read()
  self.header = Id3v24.Header(self._io, self, self._root)
  if self.header.flags.flag_headerex then
    self.header_ex = Id3v24.HeaderEx(self._io, self, self._root)
  end
  self.frames = {}
  local i = 0
  while true do
    local _ = Id3v24.Frame(self._io, self, self._root)
    self.frames[i + 1] = _
    if  ((self._io:pos() + _.size.value > self.header.size.value) or (_.is_invalid))  then
      break
    end
    i = i + 1
  end
  if not(self.header.flags.flag_footer) then
    self.padding = Id3v24.Padding(self._io, self, self._root)
  end
  if self.header.flags.flag_footer then
    self.footer = Id3v24.Footer(self._io, self, self._root)
  end
end


Id3v24.U1beSynchsafe = class.class(KaitaiStruct)

function Id3v24.U1beSynchsafe:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Id3v24.U1beSynchsafe:_read()
  self.padding = self._io:read_bits_int_be(1) ~= 0
  self.value = self._io:read_bits_int_be(7)
end


Id3v24.U2beSynchsafe = class.class(KaitaiStruct)

function Id3v24.U2beSynchsafe:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Id3v24.U2beSynchsafe:_read()
  self.byte0 = Id3v24.U1beSynchsafe(self._io, self, self._root)
  self.byte1 = Id3v24.U1beSynchsafe(self._io, self, self._root)
end

Id3v24.U2beSynchsafe.property.value = {}
function Id3v24.U2beSynchsafe.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = self.byte0.value << 7 | self.byte1.value
  return self._m_value
end


Id3v24.U4beSynchsafe = class.class(KaitaiStruct)

function Id3v24.U4beSynchsafe:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Id3v24.U4beSynchsafe:_read()
  self.short0 = Id3v24.U2beSynchsafe(self._io, self, self._root)
  self.short1 = Id3v24.U2beSynchsafe(self._io, self, self._root)
end

Id3v24.U4beSynchsafe.property.value = {}
function Id3v24.U4beSynchsafe.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = self.short0.value << 14 | self.short1.value
  return self._m_value
end



-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

CpioOldLe = class.class(KaitaiStruct)

function CpioOldLe:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CpioOldLe:_read()
  self.files = {}
  local i = 0
  while not self._io:is_eof() do
    self.files[i + 1] = CpioOldLe.File(self._io, self, self._root)
    i = i + 1
  end
end


CpioOldLe.File = class.class(KaitaiStruct)

function CpioOldLe.File:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CpioOldLe.File:_read()
  self.header = CpioOldLe.FileHeader(self._io, self, self._root)
  self.path_name = self._io:read_bytes((self.header.path_name_size - 1))
  self.string_terminator = self._io:read_bytes(1)
  if not(self.string_terminator == "\000") then
    error("not equal, expected " ..  "\000" .. ", but got " .. self.string_terminator)
  end
  if (self.header.path_name_size % 2) == 1 then
    self.path_name_padding = self._io:read_bytes(1)
    if not(self.path_name_padding == "\000") then
      error("not equal, expected " ..  "\000" .. ", but got " .. self.path_name_padding)
    end
  end
  self.file_data = self._io:read_bytes(self.header.file_size.value)
  if (self.header.file_size.value % 2) == 1 then
    self.file_data_padding = self._io:read_bytes(1)
    if not(self.file_data_padding == "\000") then
      error("not equal, expected " ..  "\000" .. ", but got " .. self.file_data_padding)
    end
  end
  if  ((self.path_name == "\084\082\065\073\076\069\082\033\033\033") and (self.header.file_size.value == 0))  then
    self.end_of_file_padding = self._io:read_bytes_full()
  end
end


CpioOldLe.FileHeader = class.class(KaitaiStruct)

function CpioOldLe.FileHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CpioOldLe.FileHeader:_read()
  self.magic = self._io:read_bytes(2)
  if not(self.magic == "\199\113") then
    error("not equal, expected " ..  "\199\113" .. ", but got " .. self.magic)
  end
  self.device_number = self._io:read_u2le()
  self.inode_number = self._io:read_u2le()
  self.mode = self._io:read_u2le()
  self.user_id = self._io:read_u2le()
  self.group_id = self._io:read_u2le()
  self.number_of_links = self._io:read_u2le()
  self.r_device_number = self._io:read_u2le()
  self.modification_time = CpioOldLe.FourByteUnsignedInteger(self._io, self, self._root)
  self.path_name_size = self._io:read_u2le()
  self.file_size = CpioOldLe.FourByteUnsignedInteger(self._io, self, self._root)
end


CpioOldLe.FourByteUnsignedInteger = class.class(KaitaiStruct)

function CpioOldLe.FourByteUnsignedInteger:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CpioOldLe.FourByteUnsignedInteger:_read()
  self.most_significant_bits = self._io:read_u2le()
  self.least_significant_bits = self._io:read_u2le()
end

CpioOldLe.FourByteUnsignedInteger.property.value = {}
function CpioOldLe.FourByteUnsignedInteger.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = (self.least_significant_bits + (self.most_significant_bits << 16))
  return self._m_value
end



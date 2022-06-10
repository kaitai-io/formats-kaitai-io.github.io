-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

-- 
-- See also: Source (https://android.googlesource.com/platform/system/chre/+/a7ff61b9/build/build_template.mk#130)
AndroidNanoappHeader = class.class(KaitaiStruct)

function AndroidNanoappHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidNanoappHeader:_read()
  self.header_version = self._io:read_u4le()
  if not(self.header_version == 1) then
    error("not equal, expected " ..  1 .. ", but got " .. self.header_version)
  end
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\078\065\078\079") then
    error("not equal, expected " ..  "\078\065\078\079" .. ", but got " .. self.magic)
  end
  self.app_id = self._io:read_u8le()
  self.app_version = self._io:read_u4le()
  self.flags = self._io:read_u4le()
  self.hub_type = self._io:read_u8le()
  self.chre_api_major_version = self._io:read_u1()
  self.chre_api_minor_version = self._io:read_u1()
  self.reserved = self._io:read_bytes(6)
  if not(self.reserved == "\000\000\000\000\000\000") then
    error("not equal, expected " ..  "\000\000\000\000\000\000" .. ", but got " .. self.reserved)
  end
end

AndroidNanoappHeader.property.is_signed = {}
function AndroidNanoappHeader.property.is_signed:get()
  if self._m_is_signed ~= nil then
    return self._m_is_signed
  end

  self._m_is_signed = (self.flags & 1) ~= 0
  return self._m_is_signed
end

AndroidNanoappHeader.property.is_encrypted = {}
function AndroidNanoappHeader.property.is_encrypted:get()
  if self._m_is_encrypted ~= nil then
    return self._m_is_encrypted
  end

  self._m_is_encrypted = (self.flags & 2) ~= 0
  return self._m_is_encrypted
end

AndroidNanoappHeader.property.is_tcm_capable = {}
function AndroidNanoappHeader.property.is_tcm_capable:get()
  if self._m_is_tcm_capable ~= nil then
    return self._m_is_tcm_capable
  end

  self._m_is_tcm_capable = (self.flags & 4) ~= 0
  return self._m_is_tcm_capable
end



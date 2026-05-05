-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")
local utils = require("utils")

-- 
-- A simple wrapper which allows to read a UTF-16 encoded string that starts
-- with a byte order mark (BOM). The BOM indicates the endianness of the UTF-16
-- encoding, which can be either big-endian (BE) or little-endian (LE).
-- 
-- Use:
-- 
-- * `value` to get the string value with BOM stripped, regardless of endianness.
-- * `is_be` and `is_le` to check the endianness indicated by the BOM.
-- * `bom` to check the raw byte order mark.
-- See also: - https://en.wikipedia.org/wiki/Byte_order_mark
Utf16WithBom = class.class(KaitaiStruct)

function Utf16WithBom:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Utf16WithBom:_read()
  self.bom = self._io:read_bytes(2)
  if not( ((self.bom == "\254\255") or (self.bom == "\255\254")) ) then
    error("ValidationNotAnyOfError")
  end
  if self.is_be then
    self.str_be = str_decode.decode(self._io:read_bytes_full(), "UTF-16BE")
  end
  if self.is_le then
    self.str_le = str_decode.decode(self._io:read_bytes_full(), "UTF-16LE")
  end
end

-- 
-- True if the byte order mark indicates big-endian UTF-16 encoding.
Utf16WithBom.property.is_be = {}
function Utf16WithBom.property.is_be:get()
  if self._m_is_be ~= nil then
    return self._m_is_be
  end

  self._m_is_be = self.bom == "\254\255"
  return self._m_is_be
end

-- 
-- True if the byte order mark indicates little-endian UTF-16 encoding.
Utf16WithBom.property.is_le = {}
function Utf16WithBom.property.is_le:get()
  if self._m_is_le ~= nil then
    return self._m_is_le
  end

  self._m_is_le = self.bom == "\255\254"
  return self._m_is_le
end

-- 
-- The string value with BOM stripped, regardless of endianness.
Utf16WithBom.property.value = {}
function Utf16WithBom.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = utils.box_unwrap((self.is_be) and utils.box_wrap(self.str_be) or (self.str_le))
  return self._m_value
end

-- 
-- The byte order mark (BOM) is a special marker at the beginning of the
-- string that indicates the endianness of the UTF-16 encoding. The
-- character U+FEFF is used as the BOM, and its byte representation differs
-- based on endianness:
-- 
-- * For big-endian (BE) UTF-16, it's `[0xFE, 0xFF]`
-- * For little-endian (LE) UTF-16, it's `[0xFF, 0xFE]`
-- 
-- This implementation checks for the presence of a valid BOM and strips it
-- from the resulting string value.


-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local utils = require("utils")

-- 
-- A variable-length integer,
-- in the format used by the 0xfe chunks in the `'dcmp' (0)` and `'dcmp' (1)` resource compression formats.
-- See the dcmp_0 and dcmp_1 specs for more information about these compression formats.
-- 
-- This variable-length integer format can store an integer `x` in any of the following ways:
-- 
-- * In a single byte,
--   if `0 <= x <= 0x7f`
--   (7-bit unsigned integer)
-- * In 2 bytes,
--   if `-0x4000 <= x <= 0x3eff`
--   (15-bit signed integer with the highest `0x100` values unavailable)
-- * In 5 bytes, if `-0x80000000 <= x <= 0x7fffffff`
--   (32-bit signed integer)
-- 
-- In practice,
-- values are always stored in the smallest possible format,
-- but technically any of the larger formats could be used as well.
-- See also: Source (https://github.com/dgelessus/python-rsrcfork/tree/master/rsrcfork/compress/common.py)
DcmpVariableLengthInteger = class.class(KaitaiStruct)

function DcmpVariableLengthInteger:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DcmpVariableLengthInteger:_read()
  self.first = self._io:read_u1()
  if self.first >= 128 then
    local _on = self.first
    if _on == 255 then
      self.more = self._io:read_s4be()
    else
      self.more = self._io:read_u1()
    end
  end
end

-- 
-- The decoded value of the variable-length integer.
DcmpVariableLengthInteger.property.value = {}
function DcmpVariableLengthInteger.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = utils.box_unwrap((self.first == 255) and utils.box_wrap(self.more) or (utils.box_unwrap((self.first >= 128) and utils.box_wrap((((self.first << 8) | self.more) - 49152)) or (self.first))))
  return self._m_value
end

-- 
-- The first byte of the variable-length integer.
-- This determines which storage format is used.
-- 
-- * For the 1-byte format,
--   this encodes the entire value of the value.
-- * For the 2-byte format,
--   this encodes the high 7 bits of the value,
--   minus `0xc0`.
--   The highest bit of the value,
--   i. e. the second-highest bit of this field,
--   is the sign bit.
-- * For the 5-byte format,
--   this is always `0xff`.
-- 
-- The remaining bytes of the variable-length integer.
-- 
-- * For the 1-byte format,
--   this is not present.
-- * For the 2-byte format,
--   this encodes the low 8 bits of the value.
-- * For the 5-byte format,
--   this encodes the entire value.


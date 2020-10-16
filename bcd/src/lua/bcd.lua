-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local utils = require("utils")

-- 
-- BCD (Binary Coded Decimals) is a common way to encode integer
-- numbers in a way that makes human-readable output somewhat
-- simpler. In this encoding scheme, every decimal digit is encoded as
-- either a single byte (8 bits), or a nibble (half of a byte, 4
-- bits). This obviously wastes a lot of bits, but it makes translation
-- into human-readable string much easier than traditional
-- binary-to-decimal conversion process, which includes lots of
-- divisions by 10.
-- 
-- For example, encoding integer 31337 in 8-digit, 8 bits per digit,
-- big endian order of digits BCD format yields
-- 
-- ```
-- 00 00 00 03 01 03 03 07
-- ```
-- 
-- Encoding the same integer as 8-digit, 4 bits per digit, little
-- endian order BCD format would yield:
-- 
-- ```
-- 73 31 30 00
-- ```
-- 
-- Using this type of encoding in Kaitai Struct is pretty
-- straightforward: one calls for this type, specifying desired
-- encoding parameters, and gets result using either `as_int` or
-- `as_str` attributes.
Bcd = class.class(KaitaiStruct)

function Bcd:_init(num_digits, bits_per_digit, is_le, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.num_digits = num_digits
  self.bits_per_digit = bits_per_digit
  self.is_le = is_le
  self:_read()
end

function Bcd:_read()
  self.digits = {}
  for i = 0, self.num_digits - 1 do
    local _on = self.bits_per_digit
    if _on == 4 then
      self.digits[i + 1] = self._io:read_bits_int_be(4)
    elseif _on == 8 then
      self.digits[i + 1] = self._io:read_u1()
    end
  end
end

-- 
-- Value of this BCD number as integer. Endianness would be selected based on `is_le` parameter given.
Bcd.property.as_int = {}
function Bcd.property.as_int:get()
  if self._m_as_int ~= nil then
    return self._m_as_int
  end

  self._m_as_int = utils.box_unwrap((self.is_le) and utils.box_wrap(self.as_int_le) or (self.as_int_be))
  return self._m_as_int
end

-- 
-- Value of this BCD number as integer (treating digit order as little-endian).
Bcd.property.as_int_le = {}
function Bcd.property.as_int_le:get()
  if self._m_as_int_le ~= nil then
    return self._m_as_int_le
  end

  self._m_as_int_le = (self.digits[0 + 1] + utils.box_unwrap((self.num_digits < 2) and utils.box_wrap(0) or (((self.digits[1 + 1] * 10) + utils.box_unwrap((self.num_digits < 3) and utils.box_wrap(0) or (((self.digits[2 + 1] * 100) + utils.box_unwrap((self.num_digits < 4) and utils.box_wrap(0) or (((self.digits[3 + 1] * 1000) + utils.box_unwrap((self.num_digits < 5) and utils.box_wrap(0) or (((self.digits[4 + 1] * 10000) + utils.box_unwrap((self.num_digits < 6) and utils.box_wrap(0) or (((self.digits[5 + 1] * 100000) + utils.box_unwrap((self.num_digits < 7) and utils.box_wrap(0) or (((self.digits[6 + 1] * 1000000) + utils.box_unwrap((self.num_digits < 8) and utils.box_wrap(0) or ((self.digits[7 + 1] * 10000000))))))))))))))))))))))
  return self._m_as_int_le
end

-- 
-- Index of last digit (0-based).
Bcd.property.last_idx = {}
function Bcd.property.last_idx:get()
  if self._m_last_idx ~= nil then
    return self._m_last_idx
  end

  self._m_last_idx = (self.num_digits - 1)
  return self._m_last_idx
end

-- 
-- Value of this BCD number as integer (treating digit order as big-endian).
Bcd.property.as_int_be = {}
function Bcd.property.as_int_be:get()
  if self._m_as_int_be ~= nil then
    return self._m_as_int_be
  end

  self._m_as_int_be = (self.digits[self.last_idx + 1] + utils.box_unwrap((self.num_digits < 2) and utils.box_wrap(0) or (((self.digits[(self.last_idx - 1) + 1] * 10) + utils.box_unwrap((self.num_digits < 3) and utils.box_wrap(0) or (((self.digits[(self.last_idx - 2) + 1] * 100) + utils.box_unwrap((self.num_digits < 4) and utils.box_wrap(0) or (((self.digits[(self.last_idx - 3) + 1] * 1000) + utils.box_unwrap((self.num_digits < 5) and utils.box_wrap(0) or (((self.digits[(self.last_idx - 4) + 1] * 10000) + utils.box_unwrap((self.num_digits < 6) and utils.box_wrap(0) or (((self.digits[(self.last_idx - 5) + 1] * 100000) + utils.box_unwrap((self.num_digits < 7) and utils.box_wrap(0) or (((self.digits[(self.last_idx - 6) + 1] * 1000000) + utils.box_unwrap((self.num_digits < 8) and utils.box_wrap(0) or ((self.digits[(self.last_idx - 7) + 1] * 10000000))))))))))))))))))))))
  return self._m_as_int_be
end

-- 
-- Number of digits in this BCD representation. Only values from 1 to 8 inclusive are supported.
-- 
-- Number of bits per digit. Only values of 4 and 8 are supported.
-- 
-- Endianness used by this BCD representation. True means little-endian, false is for big-endian.


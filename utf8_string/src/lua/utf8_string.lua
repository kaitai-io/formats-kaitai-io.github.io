-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local utils = require("utils")

-- 
-- UTF-8 is a popular character encoding scheme that allows to
-- represent strings as sequence of code points defined in Unicode
-- standard. Its features are:
-- 
-- * variable width (i.e. one code point might be represented by 1 to 4
--   bytes)
-- * backward compatiblity with ASCII
-- * basic validity checking (and thus distinguishing from other legacy
--   8-bit encodings)
-- * maintaining sort order of codepoints if sorted as a byte array
-- 
-- WARNING: For the vast majority of practical purposes of format
-- definitions in Kaitai Struct, you'd likely NOT want to use this and
-- rather just use `type: str` with `encoding: utf-8`. That will use
-- native string implementations, which are most likely more efficient
-- and will give you native language strings, rather than an array of
-- individual codepoints.  This format definition is provided mostly
-- for educational / research purposes.
Utf8String = class.class(KaitaiStruct)

function Utf8String:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Utf8String:_read()
  self.codepoints = {}
  local i = 0
  while not self._io:is_eof() do
    self.codepoints[i + 1] = Utf8String.Utf8Codepoint(self._io:pos(), self._io, self, self._root)
    i = i + 1
  end
end


Utf8String.Utf8Codepoint = class.class(KaitaiStruct)

function Utf8String.Utf8Codepoint:_init(ofs, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self.ofs = ofs
  self:_read()
end

function Utf8String.Utf8Codepoint:_read()
  self.bytes = self._io:read_bytes(self.len_bytes)
end

Utf8String.Utf8Codepoint.property.byte0 = {}
function Utf8String.Utf8Codepoint.property.byte0:get()
  if self._m_byte0 ~= nil then
    return self._m_byte0
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs)
  self._m_byte0 = self._io:read_u1()
  self._io:seek(_pos)
  return self._m_byte0
end

Utf8String.Utf8Codepoint.property.len_bytes = {}
function Utf8String.Utf8Codepoint.property.len_bytes:get()
  if self._m_len_bytes ~= nil then
    return self._m_len_bytes
  end

  self._m_len_bytes = utils.box_unwrap((self.byte0 & 128 == 0) and utils.box_wrap(1) or (utils.box_unwrap((self.byte0 & 224 == 192) and utils.box_wrap(2) or (utils.box_unwrap((self.byte0 & 240 == 224) and utils.box_wrap(3) or (utils.box_unwrap((self.byte0 & 248 == 240) and utils.box_wrap(4) or (-1))))))))
  return self._m_len_bytes
end

Utf8String.Utf8Codepoint.property.raw0 = {}
function Utf8String.Utf8Codepoint.property.raw0:get()
  if self._m_raw0 ~= nil then
    return self._m_raw0
  end

  self._m_raw0 = string.byte(self.bytes, 0 + 1) & utils.box_unwrap((self.len_bytes == 1) and utils.box_wrap(127) or (utils.box_unwrap((self.len_bytes == 2) and utils.box_wrap(31) or (utils.box_unwrap((self.len_bytes == 3) and utils.box_wrap(15) or (utils.box_unwrap((self.len_bytes == 4) and utils.box_wrap(7) or (0))))))))
  return self._m_raw0
end

Utf8String.Utf8Codepoint.property.raw1 = {}
function Utf8String.Utf8Codepoint.property.raw1:get()
  if self._m_raw1 ~= nil then
    return self._m_raw1
  end

  if self.len_bytes >= 2 then
    self._m_raw1 = string.byte(self.bytes, 1 + 1) & 63
  end
  return self._m_raw1
end

Utf8String.Utf8Codepoint.property.raw2 = {}
function Utf8String.Utf8Codepoint.property.raw2:get()
  if self._m_raw2 ~= nil then
    return self._m_raw2
  end

  if self.len_bytes >= 3 then
    self._m_raw2 = string.byte(self.bytes, 2 + 1) & 63
  end
  return self._m_raw2
end

Utf8String.Utf8Codepoint.property.raw3 = {}
function Utf8String.Utf8Codepoint.property.raw3:get()
  if self._m_raw3 ~= nil then
    return self._m_raw3
  end

  if self.len_bytes >= 4 then
    self._m_raw3 = string.byte(self.bytes, 3 + 1) & 63
  end
  return self._m_raw3
end

Utf8String.Utf8Codepoint.property.value_as_int = {}
function Utf8String.Utf8Codepoint.property.value_as_int:get()
  if self._m_value_as_int ~= nil then
    return self._m_value_as_int
  end

  self._m_value_as_int = utils.box_unwrap((self.len_bytes == 1) and utils.box_wrap(self.raw0) or (utils.box_unwrap((self.len_bytes == 2) and utils.box_wrap(self.raw0 << 6 | self.raw1) or (utils.box_unwrap((self.len_bytes == 3) and utils.box_wrap((self.raw0 << 12 | self.raw1 << 6) | self.raw2) or (utils.box_unwrap((self.len_bytes == 4) and utils.box_wrap(((self.raw0 << 18 | self.raw1 << 12) | self.raw2 << 6) | self.raw3) or (-1))))))))
  return self._m_value_as_int
end



-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local utils = require("utils")

-- 
-- A variable-length unsigned/signed integer using base128 encoding. 1-byte groups
-- consist of 1-bit flag of continuation and 7-bit value chunk, and are ordered
-- "least significant group first", i.e. in "little-endian" manner.
-- 
-- This particular encoding is specified and used in:
-- 
-- * DWARF debug file format, where it's dubbed "unsigned LEB128" or "ULEB128".
--   http://dwarfstd.org/doc/dwarf-2.0.0.pdf - page 139
-- * Google Protocol Buffers, where it's called "Base 128 Varints".
--   https://developers.google.com/protocol-buffers/docs/encoding?csw=1#varints
-- * Apache Lucene, where it's called "VInt"
--   https://lucene.apache.org/core/3_5_0/fileformats.html#VInt
-- * Apache Avro uses this as a basis for integer encoding, adding ZigZag on
--   top of it for signed ints
--   https://avro.apache.org/docs/current/spec.html#binary_encode_primitive
-- 
-- More information on this encoding is available at https://en.wikipedia.org/wiki/LEB128
-- 
-- This particular implementation supports serialized values to up 8 bytes long.
VlqBase128Le = class.class(KaitaiStruct)

function VlqBase128Le:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function VlqBase128Le:_read()
  self.groups = {}
  local i = 0
  while true do
    local _ = VlqBase128Le.Group(self._io, self, self._root)
    self.groups[i + 1] = _
    if not(_.has_next) then
      break
    end
    i = i + 1
  end
end

VlqBase128Le.property.len = {}
function VlqBase128Le.property.len:get()
  if self._m_len ~= nil then
    return self._m_len
  end

  self._m_len = #self.groups
  return self._m_len
end

-- 
-- Resulting unsigned value as normal integer.
VlqBase128Le.property.value = {}
function VlqBase128Le.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = (((((((self.groups[0 + 1].value + utils.box_unwrap((self.len >= 2) and utils.box_wrap((self.groups[1 + 1].value << 7)) or (0))) + utils.box_unwrap((self.len >= 3) and utils.box_wrap((self.groups[2 + 1].value << 14)) or (0))) + utils.box_unwrap((self.len >= 4) and utils.box_wrap((self.groups[3 + 1].value << 21)) or (0))) + utils.box_unwrap((self.len >= 5) and utils.box_wrap((self.groups[4 + 1].value << 28)) or (0))) + utils.box_unwrap((self.len >= 6) and utils.box_wrap((self.groups[5 + 1].value << 35)) or (0))) + utils.box_unwrap((self.len >= 7) and utils.box_wrap((self.groups[6 + 1].value << 42)) or (0))) + utils.box_unwrap((self.len >= 8) and utils.box_wrap((self.groups[7 + 1].value << 49)) or (0)))
  return self._m_value
end

VlqBase128Le.property.sign_bit = {}
function VlqBase128Le.property.sign_bit:get()
  if self._m_sign_bit ~= nil then
    return self._m_sign_bit
  end

  self._m_sign_bit = (1 << ((7 * self.len) - 1))
  return self._m_sign_bit
end

-- 
-- See also: Source (https://graphics.stanford.edu/~seander/bithacks.html#VariableSignExtend)
VlqBase128Le.property.value_signed = {}
function VlqBase128Le.property.value_signed:get()
  if self._m_value_signed ~= nil then
    return self._m_value_signed
  end

  self._m_value_signed = ((self.value ~ self.sign_bit) - self.sign_bit)
  return self._m_value_signed
end


-- 
-- One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.
VlqBase128Le.Group = class.class(KaitaiStruct)

function VlqBase128Le.Group:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function VlqBase128Le.Group:_read()
  self.b = self._io:read_u1()
end

-- 
-- If true, then we have more bytes to read.
VlqBase128Le.Group.property.has_next = {}
function VlqBase128Le.Group.property.has_next:get()
  if self._m_has_next ~= nil then
    return self._m_has_next
  end

  self._m_has_next = (self.b & 128) ~= 0
  return self._m_has_next
end

-- 
-- The 7-bit (base128) numeric value chunk of this group.
VlqBase128Le.Group.property.value = {}
function VlqBase128Le.Group.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = (self.b & 127)
  return self._m_value
end



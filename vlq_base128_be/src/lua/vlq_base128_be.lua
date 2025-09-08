-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local utils = require("utils")

-- 
-- A variable-length unsigned integer using base128 encoding. 1-byte groups
-- consist of 1-bit flag of continuation and 7-bit value chunk, and are ordered
-- "most significant group first", i.e. in "big-endian" manner.
-- 
-- This particular encoding is specified and used in:
-- 
-- * Standard MIDI file format
-- * ASN.1 BER encoding
-- * RAR 5.0 file format
-- 
-- More information on this encoding is available at
-- <https://en.wikipedia.org/wiki/Variable-length_quantity>
-- 
-- This particular implementation supports serialized values to up 8 bytes long.
VlqBase128Be = class.class(KaitaiStruct)

function VlqBase128Be:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function VlqBase128Be:_read()
  self.groups = {}
  local i = 0
  while true do
    local _ = VlqBase128Be.Group(self._io, self, self._root)
    self.groups[i + 1] = _
    if not(_.has_next) then
      break
    end
    i = i + 1
  end
end

VlqBase128Be.property.last = {}
function VlqBase128Be.property.last:get()
  if self._m_last ~= nil then
    return self._m_last
  end

  self._m_last = #self.groups - 1
  return self._m_last
end

-- 
-- Resulting value as normal integer.
VlqBase128Be.property.value = {}
function VlqBase128Be.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = (((((((self.groups[self.last + 1].value + utils.box_unwrap((self.last >= 1) and utils.box_wrap(self.groups[(self.last - 1) + 1].value << 7) or (0))) + utils.box_unwrap((self.last >= 2) and utils.box_wrap(self.groups[(self.last - 2) + 1].value << 14) or (0))) + utils.box_unwrap((self.last >= 3) and utils.box_wrap(self.groups[(self.last - 3) + 1].value << 21) or (0))) + utils.box_unwrap((self.last >= 4) and utils.box_wrap(self.groups[(self.last - 4) + 1].value << 28) or (0))) + utils.box_unwrap((self.last >= 5) and utils.box_wrap(self.groups[(self.last - 5) + 1].value << 35) or (0))) + utils.box_unwrap((self.last >= 6) and utils.box_wrap(self.groups[(self.last - 6) + 1].value << 42) or (0))) + utils.box_unwrap((self.last >= 7) and utils.box_wrap(self.groups[(self.last - 7) + 1].value << 49) or (0)))
  return self._m_value
end


-- 
-- One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.
VlqBase128Be.Group = class.class(KaitaiStruct)

function VlqBase128Be.Group:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function VlqBase128Be.Group:_read()
  self.has_next = self._io:read_bits_int_be(1) ~= 0
  self.value = self._io:read_bits_int_be(7)
end

-- 
-- If true, then we have more bytes to read.
-- 
-- The 7-bit (base128) numeric value chunk of this group.


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
--   <https://dwarfstd.org/doc/dwarf-2.0.0.pdf> - page 139
-- * Google Protocol Buffers, where it's called "Base 128 Varints".
--   <https://protobuf.dev/programming-guides/encoding/#varints>
-- * Apache Lucene, where it's called "VInt"
--   <https://lucene.apache.org/core/3_5_0/fileformats.html#VInt>
-- * Apache Avro uses this as a basis for integer encoding, adding ZigZag on
--   top of it for signed ints
--   <https://avro.apache.org/docs/1.12.0/specification/#primitive-types-1>
-- 
-- More information on this encoding is available at <https://en.wikipedia.org/wiki/LEB128>
-- 
-- This particular implementation supports integer values up to 64 bits (i.e. the
-- maximum unsigned value supported is `2**64 - 1`), which implies that serialized
-- values can be up to 10 bytes in length.
-- 
-- If the most significant 10th byte (`groups[9]`) is present, its `has_next`
-- must be `false` (otherwise we would have 11 or more bytes, which is not
-- supported) and its `value` can be only `0` or `1` (because a 9-byte VLQ can
-- represent `9 * 7 = 63` bits already, so the 10th byte can only add 1 bit,
-- since only integers up to 64 bits are supported). These restrictions are
-- enforced by this implementation. They were inspired by the Protoscope tool,
-- see <https://github.com/protocolbuffers/protoscope/blob/8e7a6aafa2c9958527b1e0747e66e1bfff045819/writer.go#L644-L648>.
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
    local _ = VlqBase128Le.Group(i, utils.box_unwrap((i ~= 0) and utils.box_wrap(self.groups[(i - 1) + 1].interm_value) or (0)), utils.box_unwrap((i ~= 0) and utils.box_wrap(utils.box_unwrap((i == 9) and utils.box_wrap(0x8000000000000000) or (self.groups[(i - 1) + 1].multiplier * 128))) or (1)), self._io, self, self._root)
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

VlqBase128Le.property.sign_bit = {}
function VlqBase128Le.property.sign_bit:get()
  if self._m_sign_bit ~= nil then
    return self._m_sign_bit
  end

  self._m_sign_bit = utils.box_unwrap((self.len == 10) and utils.box_wrap(0x8000000000000000) or (self.groups[#self.groups].multiplier * 64))
  return self._m_sign_bit
end

-- 
-- Resulting unsigned value as normal integer.
VlqBase128Le.property.value = {}
function VlqBase128Le.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = self.groups[#self.groups].interm_value
  return self._m_value
end

VlqBase128Le.property.value_signed = {}
function VlqBase128Le.property.value_signed:get()
  if self._m_value_signed ~= nil then
    return self._m_value_signed
  end

  self._m_value_signed = utils.box_unwrap(( ((self.sign_bit > 0) and (self.value >= self.sign_bit)) ) and utils.box_wrap(-((self.sign_bit - (self.value - self.sign_bit)))) or (self.value))
  return self._m_value_signed
end


-- 
-- One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.
VlqBase128Le.Group = class.class(KaitaiStruct)

function VlqBase128Le.Group:_init(idx, prev_interm_value, multiplier, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self.idx = idx
  self.prev_interm_value = prev_interm_value
  self.multiplier = multiplier
  self:_read()
end

function VlqBase128Le.Group:_read()
  self.has_next = self._io:read_bits_int_be(1) ~= 0
  if not(self.has_next == utils.box_unwrap((self.idx == 9) and utils.box_wrap(false) or (self.has_next))) then
    error("not equal, expected " .. utils.box_unwrap((self.idx == 9) and utils.box_wrap(false) or (self.has_next)) .. ", but got " .. self.has_next)
  end
  self.value = self._io:read_bits_int_be(7)
  if not(self.value <= utils.box_unwrap((self.idx == 9) and utils.box_wrap(1) or (127))) then
    error("ValidationGreaterThanError")
  end
end

VlqBase128Le.Group.property.interm_value = {}
function VlqBase128Le.Group.property.interm_value:get()
  if self._m_interm_value ~= nil then
    return self._m_interm_value
  end

  self._m_interm_value = (self.prev_interm_value + self.value * self.multiplier)
  return self._m_interm_value
end

-- 
-- If `true`, then we have more bytes to read.
-- 
-- Since this implementation only supports serialized values up to 10
-- bytes, this must be `false` in the 10th group (`groups[9]`).
-- 
-- The 7-bit (base128) numeric value chunk of this group
-- 
-- Since this implementation only supports integer values up to 64 bits,
-- the `value` in the 10th group (`groups[9]`) can only be `0` or `1`
-- (otherwise the width of the represented value would be 65 bits or
-- more, which is not supported).


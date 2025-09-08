-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("vlq_base128_le")
local enum = require("enum")

-- 
-- Google Protocol Buffers (AKA protobuf) is a popular data
-- serialization scheme used for communication protocols, data storage,
-- etc. There are implementations are available for almost every
-- popular language. The focus points of this scheme are brevity (data
-- is encoded in a very size-efficient manner) and extensibility (one
-- can add keys to the structure, while keeping it readable in previous
-- version of software).
-- 
-- Protobuf uses semi-self-describing encoding scheme for its
-- messages. It means that it is possible to parse overall structure of
-- the message (skipping over fields one can't understand), but to
-- fully understand the message, one needs a protocol definition file
-- (`.proto`). To be specific:
-- 
-- * "Keys" in key-value pairs provided in the message are identified
--   only with an integer "field tag". `.proto` file provides info on
--   which symbolic field names these field tags map to.
-- * "Keys" also provide something called "wire type". It's not a data
--   type in its common sense (i.e. you can't, for example, distinguish
--   `sint32` vs `uint32` vs some enum, or `string` from `bytes`), but
--   it's enough information to determine how many bytes to
--   parse. Interpretation of the value should be done according to the
--   type specified in `.proto` file.
-- * There's no direct information on which fields are optional /
--   required, which fields may be repeated or constitute a map, what
--   restrictions are placed on fields usage in a single message, what
--   are the fields' default values, etc, etc.
-- See also: Source (https://protobuf.dev/programming-guides/encoding/)
GoogleProtobuf = class.class(KaitaiStruct)

function GoogleProtobuf:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function GoogleProtobuf:_read()
  self.pairs = {}
  local i = 0
  while not self._io:is_eof() do
    self.pairs[i + 1] = GoogleProtobuf.Pair(self._io, self, self._root)
    i = i + 1
  end
end

-- 
-- Key-value pairs which constitute a message.

GoogleProtobuf.DelimitedBytes = class.class(KaitaiStruct)

function GoogleProtobuf.DelimitedBytes:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function GoogleProtobuf.DelimitedBytes:_read()
  self.len = VlqBase128Le(self._io)
  self.body = self._io:read_bytes(self.len.value)
end


-- 
-- Key-value pair.
GoogleProtobuf.Pair = class.class(KaitaiStruct)

GoogleProtobuf.Pair.WireTypes = enum.Enum {
  varint = 0,
  bit_64 = 1,
  len_delimited = 2,
  group_start = 3,
  group_end = 4,
  bit_32 = 5,
}

function GoogleProtobuf.Pair:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function GoogleProtobuf.Pair:_read()
  self.key = VlqBase128Le(self._io)
  local _on = self.wire_type
  if _on == GoogleProtobuf.Pair.WireTypes.bit_32 then
    self.value = self._io:read_u4le()
  elseif _on == GoogleProtobuf.Pair.WireTypes.bit_64 then
    self.value = self._io:read_u8le()
  elseif _on == GoogleProtobuf.Pair.WireTypes.len_delimited then
    self.value = GoogleProtobuf.DelimitedBytes(self._io, self, self._root)
  elseif _on == GoogleProtobuf.Pair.WireTypes.varint then
    self.value = VlqBase128Le(self._io)
  end
end

-- 
-- Identifies a field of protocol. One can look up symbolic
-- field name in a `.proto` file by this field tag.
GoogleProtobuf.Pair.property.field_tag = {}
function GoogleProtobuf.Pair.property.field_tag:get()
  if self._m_field_tag ~= nil then
    return self._m_field_tag
  end

  self._m_field_tag = self.key.value >> 3
  return self._m_field_tag
end

-- 
-- "Wire type" is a part of the "key" that carries enough
-- information to parse value from the wire, i.e. read correct
-- amount of bytes, but there's not enough informaton to
-- interprete in unambiguously. For example, one can't clearly
-- distinguish 64-bit fixed-sized integers from 64-bit floats,
-- signed zigzag-encoded varints from regular unsigned varints,
-- arbitrary bytes from UTF-8 encoded strings, etc.
GoogleProtobuf.Pair.property.wire_type = {}
function GoogleProtobuf.Pair.property.wire_type:get()
  if self._m_wire_type ~= nil then
    return self._m_wire_type
  end

  self._m_wire_type = GoogleProtobuf.Pair.WireTypes(self.key.value & 7)
  return self._m_wire_type
end

-- 
-- Key is a bit-mapped variable-length integer: lower 3 bits
-- are used for "wire type", and everything higher designates
-- an integer "field tag".
-- 
-- Value that corresponds to field identified by
-- `field_tag`. Type is determined approximately: there is
-- enough information to parse it unambiguously from a stream,
-- but further infromation from `.proto` file is required to
-- interprete it properly.


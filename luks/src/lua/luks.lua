-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")
local enum = require("enum")

-- 
-- Linux Unified Key Setup (LUKS) is a format specification for storing disk
-- encryption parameters and up to 8 user keys (which can unlock the master key).
-- See also: Source (https://gitlab.com/cryptsetup/cryptsetup/-/wikis/LUKS-standard/on-disk-format.pdf)
Luks = class.class(KaitaiStruct)

function Luks:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Luks:_read()
  self.partition_header = Luks.PartitionHeader(self._io, self, self._root)
end

Luks.property.payload = {}
function Luks.property.payload:get()
  if self._m_payload ~= nil then
    return self._m_payload
  end

  local _pos = self._io:pos()
  self._io:seek((self.partition_header.payload_offset * 512))
  self._m_payload = self._io:read_bytes_full()
  self._io:seek(_pos)
  return self._m_payload
end


Luks.PartitionHeader = class.class(KaitaiStruct)

function Luks.PartitionHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Luks.PartitionHeader:_read()
  self.magic = self._io:read_bytes(6)
  if not(self.magic == "\076\085\075\083\186\190") then
    error("not equal, expected " ..  "\076\085\075\083\186\190" .. ", but got " .. self.magic)
  end
  self.version = self._io:read_bytes(2)
  if not(self.version == "\000\001") then
    error("not equal, expected " ..  "\000\001" .. ", but got " .. self.version)
  end
  self.cipher_name_specification = str_decode.decode(self._io:read_bytes(32), "ASCII")
  self.cipher_mode_specification = str_decode.decode(self._io:read_bytes(32), "ASCII")
  self.hash_specification = str_decode.decode(self._io:read_bytes(32), "ASCII")
  self.payload_offset = self._io:read_u4be()
  self.number_of_key_bytes = self._io:read_u4be()
  self.master_key_checksum = self._io:read_bytes(20)
  self.master_key_salt_parameter = self._io:read_bytes(32)
  self.master_key_iterations_parameter = self._io:read_u4be()
  self.uuid = str_decode.decode(self._io:read_bytes(40), "ASCII")
  self.key_slots = {}
  for i = 0, 8 - 1 do
    self.key_slots[i + 1] = Luks.PartitionHeader.KeySlot(self._io, self, self._root)
  end
end


Luks.PartitionHeader.KeySlot = class.class(KaitaiStruct)

Luks.PartitionHeader.KeySlot.KeySlotStates = enum.Enum {
  disabled_key_slot = 57005,
  enabled_key_slot = 11301363,
}

function Luks.PartitionHeader.KeySlot:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Luks.PartitionHeader.KeySlot:_read()
  self.state_of_key_slot = Luks.PartitionHeader.KeySlot.KeySlotStates(self._io:read_u4be())
  self.iteration_parameter = self._io:read_u4be()
  self.salt_parameter = self._io:read_bytes(32)
  self.start_sector_of_key_material = self._io:read_u4be()
  self.number_of_anti_forensic_stripes = self._io:read_u4be()
end

Luks.PartitionHeader.KeySlot.property.key_material = {}
function Luks.PartitionHeader.KeySlot.property.key_material:get()
  if self._m_key_material ~= nil then
    return self._m_key_material
  end

  local _pos = self._io:pos()
  self._io:seek((self.start_sector_of_key_material * 512))
  self._m_key_material = self._io:read_bytes((self._parent.number_of_key_bytes * self.number_of_anti_forensic_stripes))
  self._io:seek(_pos)
  return self._m_key_material
end



-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- See also: Specification taken from https://en.wikipedia.org/wiki/Apple_Partition_Map
ApmPartitionTable = class.class(KaitaiStruct)

function ApmPartitionTable:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ApmPartitionTable:_read()
end

-- 
-- 0x200 (512) bytes for disks, 0x1000 (4096) bytes is not supported by APM
-- 0x800 (2048) bytes for CDROM
ApmPartitionTable.property.sector_size = {}
function ApmPartitionTable.property.sector_size:get()
  if self._m_sector_size ~= nil then
    return self._m_sector_size
  end

  self._m_sector_size = 512
  return self._m_sector_size
end

-- 
-- Every partition entry contains the number of partition entries.
-- We parse the first entry, to know how many to parse, including the first one.
-- No logic is given what to do if other entries have a different number.
ApmPartitionTable.property.partition_lookup = {}
function ApmPartitionTable.property.partition_lookup:get()
  if self._m_partition_lookup ~= nil then
    return self._m_partition_lookup
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self._root.sector_size)
  self._raw__m_partition_lookup = _io:read_bytes(self.sector_size)
  local _io = KaitaiStream(stringstream(self._raw__m_partition_lookup))
  self._m_partition_lookup = ApmPartitionTable.PartitionEntry(_io, self, self._root)
  _io:seek(_pos)
  return self._m_partition_lookup
end

ApmPartitionTable.property.partition_entries = {}
function ApmPartitionTable.property.partition_entries:get()
  if self._m_partition_entries ~= nil then
    return self._m_partition_entries
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self._root.sector_size)
  self._raw__m_partition_entries = {}
  self._m_partition_entries = {}
  for i = 0, self._root.partition_lookup.number_of_partitions - 1 do
    self._raw__m_partition_entries[i + 1] = _io:read_bytes(self.sector_size)
    local _io = KaitaiStream(stringstream(self._raw__m_partition_entries[i + 1]))
    self._m_partition_entries[i + 1] = ApmPartitionTable.PartitionEntry(_io, self, self._root)
  end
  _io:seek(_pos)
  return self._m_partition_entries
end


ApmPartitionTable.PartitionEntry = class.class(KaitaiStruct)

function ApmPartitionTable.PartitionEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function ApmPartitionTable.PartitionEntry:_read()
  self.magic = self._io:read_bytes(2)
  if not(self.magic == "\080\077") then
    error("not equal, expected " ..  "\080\077" .. ", but got " .. self.magic)
  end
  self.reserved_1 = self._io:read_bytes(2)
  self.number_of_partitions = self._io:read_u4be()
  self.partition_start = self._io:read_u4be()
  self.partition_size = self._io:read_u4be()
  self.partition_name = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(32), 0, false), "ascii")
  self.partition_type = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(32), 0, false), "ascii")
  self.data_start = self._io:read_u4be()
  self.data_size = self._io:read_u4be()
  self.partition_status = self._io:read_u4be()
  self.boot_code_start = self._io:read_u4be()
  self.boot_code_size = self._io:read_u4be()
  self.boot_loader_address = self._io:read_u4be()
  self.reserved_2 = self._io:read_bytes(4)
  self.boot_code_entry = self._io:read_u4be()
  self.reserved_3 = self._io:read_bytes(4)
  self.boot_code_cksum = self._io:read_u4be()
  self.processor_type = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(16), 0, false), "ascii")
end

ApmPartitionTable.PartitionEntry.property.partition = {}
function ApmPartitionTable.PartitionEntry.property.partition:get()
  if self._m_partition ~= nil then
    return self._m_partition
  end

  if (self.partition_status & 1) ~= 0 then
    local _io = self._root._io
    local _pos = _io:pos()
    _io:seek((self.partition_start * self._root.sector_size))
    self._m_partition = _io:read_bytes((self.partition_size * self._root.sector_size))
    _io:seek(_pos)
  end
  return self._m_partition
end

ApmPartitionTable.PartitionEntry.property.data = {}
function ApmPartitionTable.PartitionEntry.property.data:get()
  if self._m_data ~= nil then
    return self._m_data
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek((self.data_start * self._root.sector_size))
  self._m_data = _io:read_bytes((self.data_size * self._root.sector_size))
  _io:seek(_pos)
  return self._m_data
end

ApmPartitionTable.PartitionEntry.property.boot_code = {}
function ApmPartitionTable.PartitionEntry.property.boot_code:get()
  if self._m_boot_code ~= nil then
    return self._m_boot_code
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek((self.boot_code_start * self._root.sector_size))
  self._m_boot_code = _io:read_bytes(self.boot_code_size)
  _io:seek(_pos)
  return self._m_boot_code
end

-- 
-- First sector.
-- 
-- Number of sectors.
-- 
-- First sector.
-- 
-- Number of sectors.
-- 
-- First sector.
-- 
-- Number of bytes.
-- 
-- Address of bootloader code.
-- 
-- Boot code entry point.
-- 
-- Boot code checksum.


-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")
local stringstream = require("string_stream")

-- 
-- This is an unnamed and undocumented partition table format implemented by
-- the bootloader and kernel that Amlogic provides for their Linux SoCs (Meson
-- series at least, and probably others). They appear to use this rather than GPT,
-- the industry standard, because their BootROM loads and executes the next stage
-- loader from offset 512 (0x200) on the eMMC, which is exactly where the GPT
-- header would have to start. So instead of changing their BootROM, Amlogic
-- devised this partition table, which lives at an offset of 36MiB (0x240_0000)
-- on the eMMC and so doesn't conflict. This parser expects as input just the
-- partition table from that offset. The maximum number of partitions in a table
-- is 32, which corresponds to a maximum table size of 1304 bytes (0x518).
-- See also: Source (http://aml-code.amlogic.com/kernel/common.git/tree/include/linux/mmc/emmc_partitions.h?id=18a4a87072ababf76ea08c8539e939b5b8a440ef)
-- See also: Source (http://aml-code.amlogic.com/kernel/common.git/tree/drivers/amlogic/mmc/emmc_partitions.c?id=18a4a87072ababf76ea08c8539e939b5b8a440ef)
AmlogicEmmcPartitions = class.class(KaitaiStruct)

function AmlogicEmmcPartitions:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AmlogicEmmcPartitions:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\077\080\084\000") then
    error("not equal, expected " .. "\077\080\084\000" .. ", but got " .. self.magic)
  end
  self.version = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(12), 0, false), "UTF-8")
  self.num_partitions = self._io:read_s4le()
  if not(self.num_partitions >= 1) then
    error("ValidationLessThanError")
  end
  if not(self.num_partitions <= 32) then
    error("ValidationGreaterThanError")
  end
  self.checksum = self._io:read_u4le()
  self.partitions = {}
  for i = 0, self.num_partitions - 1 do
    self.partitions[i + 1] = AmlogicEmmcPartitions.Partition(self._io, self, self._root)
  end
end

-- 
-- To calculate this, treat the first (and only the first) partition
-- descriptor in the table below as an array of unsigned little-endian
-- 32-bit integers. Sum all those integers mod 2^32, then multiply the
-- result by the total number of partitions, also mod 2^32. Amlogic
-- likely meant to include all the partition descriptors in the sum,
-- but their code as written instead repeatedly loops over the first
-- one, once for each partition in the table.

AmlogicEmmcPartitions.Partition = class.class(KaitaiStruct)

function AmlogicEmmcPartitions.Partition:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function AmlogicEmmcPartitions.Partition:_read()
  self.name = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(16), 0, false), "UTF-8")
  self.size = self._io:read_u8le()
  self.offset = self._io:read_u8le()
  self._raw_flags = self._io:read_bytes(4)
  local _io = KaitaiStream(stringstream(self._raw_flags))
  self.flags = AmlogicEmmcPartitions.Partition.PartFlags(_io, self, self._root)
  self.padding = self._io:read_bytes(4)
end

-- 
-- The start of the partition relative to the start of the eMMC, in bytes

AmlogicEmmcPartitions.Partition.PartFlags = class.class(KaitaiStruct)

function AmlogicEmmcPartitions.Partition.PartFlags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function AmlogicEmmcPartitions.Partition.PartFlags:_read()
  self.is_code = self._io:read_bits_int_le(1) ~= 0
  self.is_cache = self._io:read_bits_int_le(1) ~= 0
  self.is_data = self._io:read_bits_int_le(1) ~= 0
end



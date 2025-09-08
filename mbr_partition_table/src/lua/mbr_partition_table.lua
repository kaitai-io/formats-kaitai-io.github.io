-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

-- 
-- MBR (Master Boot Record) partition table is a traditional way of
-- MS-DOS to partition larger hard disc drives into distinct
-- partitions.
-- 
-- This table is stored in the end of the boot sector (first sector) of
-- the drive, after the bootstrap code. Original DOS 2.0 specification
-- allowed only 4 partitions per disc, but DOS 3.2 introduced concept
-- of "extended partitions", which work as nested extra "boot records"
-- which are pointed to by original ("primary") partitions in MBR.
MbrPartitionTable = class.class(KaitaiStruct)

function MbrPartitionTable:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MbrPartitionTable:_read()
  self.bootstrap_code = self._io:read_bytes(446)
  self.partitions = {}
  for i = 0, 4 - 1 do
    self.partitions[i + 1] = MbrPartitionTable.PartitionEntry(self._io, self, self._root)
  end
  self.boot_signature = self._io:read_bytes(2)
  if not(self.boot_signature == "\085\170") then
    error("not equal, expected " .. "\085\170" .. ", but got " .. self.boot_signature)
  end
end


MbrPartitionTable.Chs = class.class(KaitaiStruct)

function MbrPartitionTable.Chs:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function MbrPartitionTable.Chs:_read()
  self.head = self._io:read_u1()
  self.b2 = self._io:read_u1()
  self.b3 = self._io:read_u1()
end

MbrPartitionTable.Chs.property.cylinder = {}
function MbrPartitionTable.Chs.property.cylinder:get()
  if self._m_cylinder ~= nil then
    return self._m_cylinder
  end

  self._m_cylinder = self.b3 + ((self.b2 & 192) << 2)
  return self._m_cylinder
end

MbrPartitionTable.Chs.property.sector = {}
function MbrPartitionTable.Chs.property.sector:get()
  if self._m_sector ~= nil then
    return self._m_sector
  end

  self._m_sector = self.b2 & 63
  return self._m_sector
end


MbrPartitionTable.PartitionEntry = class.class(KaitaiStruct)

function MbrPartitionTable.PartitionEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function MbrPartitionTable.PartitionEntry:_read()
  self.status = self._io:read_u1()
  self.chs_start = MbrPartitionTable.Chs(self._io, self, self._root)
  self.partition_type = self._io:read_u1()
  self.chs_end = MbrPartitionTable.Chs(self._io, self, self._root)
  self.lba_start = self._io:read_u4le()
  self.num_sectors = self._io:read_u4le()
end



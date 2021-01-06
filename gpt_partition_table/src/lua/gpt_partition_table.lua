-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")
local stringstream = require("string_stream")

-- 
-- See also: Source (https://en.wikipedia.org/wiki/GUID_Partition_Table)
GptPartitionTable = class.class(KaitaiStruct)

function GptPartitionTable:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function GptPartitionTable:_read()
end

GptPartitionTable.property.sector_size = {}
function GptPartitionTable.property.sector_size:get()
  if self._m_sector_size ~= nil then
    return self._m_sector_size
  end

  self._m_sector_size = 512
  return self._m_sector_size
end

GptPartitionTable.property.primary = {}
function GptPartitionTable.property.primary:get()
  if self._m_primary ~= nil then
    return self._m_primary
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self._root.sector_size)
  self._m_primary = GptPartitionTable.PartitionHeader(_io, self, self._root)
  _io:seek(_pos)
  return self._m_primary
end

GptPartitionTable.property.backup = {}
function GptPartitionTable.property.backup:get()
  if self._m_backup ~= nil then
    return self._m_backup
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek((self._io:size() - self._root.sector_size))
  self._m_backup = GptPartitionTable.PartitionHeader(_io, self, self._root)
  _io:seek(_pos)
  return self._m_backup
end


GptPartitionTable.PartitionEntry = class.class(KaitaiStruct)

function GptPartitionTable.PartitionEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function GptPartitionTable.PartitionEntry:_read()
  self.type_guid = self._io:read_bytes(16)
  self.guid = self._io:read_bytes(16)
  self.first_lba = self._io:read_u8le()
  self.last_lba = self._io:read_u8le()
  self.attributes = self._io:read_u8le()
  self.name = str_decode.decode(self._io:read_bytes(72), "UTF-16LE")
end


GptPartitionTable.PartitionHeader = class.class(KaitaiStruct)

function GptPartitionTable.PartitionHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function GptPartitionTable.PartitionHeader:_read()
  self.signature = self._io:read_bytes(8)
  if not(self.signature == "\069\070\073\032\080\065\082\084") then
    error("not equal, expected " ..  "\069\070\073\032\080\065\082\084" .. ", but got " .. self.signature)
  end
  self.revision = self._io:read_u4le()
  self.header_size = self._io:read_u4le()
  self.crc32_header = self._io:read_u4le()
  self.reserved = self._io:read_u4le()
  self.current_lba = self._io:read_u8le()
  self.backup_lba = self._io:read_u8le()
  self.first_usable_lba = self._io:read_u8le()
  self.last_usable_lba = self._io:read_u8le()
  self.disk_guid = self._io:read_bytes(16)
  self.entries_start = self._io:read_u8le()
  self.entries_count = self._io:read_u4le()
  self.entries_size = self._io:read_u4le()
  self.crc32_array = self._io:read_u4le()
end

GptPartitionTable.PartitionHeader.property.entries = {}
function GptPartitionTable.PartitionHeader.property.entries:get()
  if self._m_entries ~= nil then
    return self._m_entries
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek((self.entries_start * self._root.sector_size))
  self._raw__m_entries = {}
  self._m_entries = {}
  for i = 0, self.entries_count - 1 do
    self._raw__m_entries[i + 1] = _io:read_bytes(self.entries_size)
    local _io = KaitaiStream(stringstream(self._raw__m_entries[i + 1]))
    self._m_entries[i + 1] = GptPartitionTable.PartitionEntry(_io, self, self._root)
  end
  _io:seek(_pos)
  return self._m_entries
end



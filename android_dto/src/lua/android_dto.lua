-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

-- 
-- Format for Android DTB/DTBO partitions. It's kind of archive with
-- dtb/dtbo files. Used only when there is a separate unique partition
-- (dtb, dtbo) on an android device to organize device tree files.
-- The format consists of a header with info about size and number
-- of device tree entries and the entries themselves. This format
-- description could be used to extract device tree entries from a
-- partition images and decompile them with dtc (device tree compiler).
-- See also: Source (https://source.android.com/docs/core/architecture/dto/partitions)
-- See also: Source (https://android.googlesource.com/platform/system/libufdt/+/refs/tags/android-10.0.0_r47)
AndroidDto = class.class(KaitaiStruct)

function AndroidDto:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidDto:_read()
  self.header = AndroidDto.DtTableHeader(self._io, self, self._root)
  self.entries = {}
  for i = 0, self.header.dt_entry_count - 1 do
    self.entries[i + 1] = AndroidDto.DtTableEntry(self._io, self, self._root)
  end
end


AndroidDto.DtTableHeader = class.class(KaitaiStruct)

function AndroidDto.DtTableHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidDto.DtTableHeader:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\215\183\171\030") then
    error("not equal, expected " ..  "\215\183\171\030" .. ", but got " .. self.magic)
  end
  self.total_size = self._io:read_u4be()
  self.header_size = self._io:read_u4be()
  self.dt_entry_size = self._io:read_u4be()
  self.dt_entry_count = self._io:read_u4be()
  self.dt_entries_offset = self._io:read_u4be()
  self.page_size = self._io:read_u4be()
  self.version = self._io:read_u4be()
end

-- 
-- includes dt_table_header + all dt_table_entry and all dtb/dtbo.
-- 
-- sizeof(dt_table_header).
-- 
-- sizeof(dt_table_entry).
-- 
-- number of dt_table_entry.
-- 
-- offset to the first dt_table_entry from head of dt_table_header.
-- 
-- flash page size.
-- 
-- DTBO image version.

AndroidDto.DtTableEntry = class.class(KaitaiStruct)

function AndroidDto.DtTableEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidDto.DtTableEntry:_read()
  self.dt_size = self._io:read_u4be()
  self.dt_offset = self._io:read_u4be()
  self.id = self._io:read_u4be()
  self.rev = self._io:read_u4be()
  self.custom = {}
  for i = 0, 4 - 1 do
    self.custom[i + 1] = self._io:read_u4be()
  end
end

-- 
-- DTB/DTBO file.
AndroidDto.DtTableEntry.property.body = {}
function AndroidDto.DtTableEntry.property.body:get()
  if self._m_body ~= nil then
    return self._m_body
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.dt_offset)
  self._m_body = _io:read_bytes(self.dt_size)
  _io:seek(_pos)
  return self._m_body
end

-- 
-- size of this entry.
-- 
-- offset from head of dt_table_header.
-- 
-- optional, must be zero if unused.
-- 
-- optional, must be zero if unused.
-- 
-- optional, must be zero if unused.


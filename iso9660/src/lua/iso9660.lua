-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")
local stringstream = require("string_stream")

-- 
-- ISO9660 is standard filesystem used on read-only optical discs
-- (mostly CD-ROM). The standard was based on earlier High Sierra
-- Format (HSF), proposed for CD-ROMs in 1985, and, after several
-- revisions, it was accepted as ISO9960:1998.
-- 
-- The format emphasizes portability (thus having pretty minimal
-- features and very conservative file names standards) and sequential
-- access (which favors disc devices with relatively slow rotation
-- speed).
Iso9660 = class.class(KaitaiStruct)

function Iso9660:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Iso9660:_read()
end

Iso9660.property.primary_vol_desc = {}
function Iso9660.property.primary_vol_desc:get()
  if self._m_primary_vol_desc ~= nil then
    return self._m_primary_vol_desc
  end

  local _pos = self._io:pos()
  self._io:seek(16 * self.sector_size)
  self._m_primary_vol_desc = Iso9660.VolDesc(self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_primary_vol_desc
end

Iso9660.property.sector_size = {}
function Iso9660.property.sector_size:get()
  if self._m_sector_size ~= nil then
    return self._m_sector_size
  end

  self._m_sector_size = 2048
  return self._m_sector_size
end


Iso9660.Datetime = class.class(KaitaiStruct)

function Iso9660.Datetime:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Iso9660.Datetime:_read()
  self.year = self._io:read_u1()
  self.month = self._io:read_u1()
  self.day = self._io:read_u1()
  self.hour = self._io:read_u1()
  self.minute = self._io:read_u1()
  self.sec = self._io:read_u1()
  self.timezone = self._io:read_u1()
end


-- 
-- See also: Source (https://wiki.osdev.org/ISO_9660#Date.2Ftime_format)
Iso9660.DecDatetime = class.class(KaitaiStruct)

function Iso9660.DecDatetime:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Iso9660.DecDatetime:_read()
  self.year = str_decode.decode(self._io:read_bytes(4), "ASCII")
  self.month = str_decode.decode(self._io:read_bytes(2), "ASCII")
  self.day = str_decode.decode(self._io:read_bytes(2), "ASCII")
  self.hour = str_decode.decode(self._io:read_bytes(2), "ASCII")
  self.minute = str_decode.decode(self._io:read_bytes(2), "ASCII")
  self.sec = str_decode.decode(self._io:read_bytes(2), "ASCII")
  self.sec_hundreds = str_decode.decode(self._io:read_bytes(2), "ASCII")
  self.timezone = self._io:read_u1()
end


Iso9660.DirEntries = class.class(KaitaiStruct)

function Iso9660.DirEntries:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Iso9660.DirEntries:_read()
  self.entries = {}
  local i = 0
  while true do
    local _ = Iso9660.DirEntry(self._io, self, self._root)
    self.entries[i + 1] = _
    if _.len == 0 then
      break
    end
    i = i + 1
  end
end


Iso9660.DirEntry = class.class(KaitaiStruct)

function Iso9660.DirEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Iso9660.DirEntry:_read()
  self.len = self._io:read_u1()
  if self.len > 0 then
    self._raw_body = self._io:read_bytes(self.len - 1)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Iso9660.DirEntryBody(_io, self, self._root)
  end
end


Iso9660.DirEntryBody = class.class(KaitaiStruct)

function Iso9660.DirEntryBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Iso9660.DirEntryBody:_read()
  self.len_ext_attr_rec = self._io:read_u1()
  self.lba_extent = Iso9660.U4bi(self._io, self, self._root)
  self.size_extent = Iso9660.U4bi(self._io, self, self._root)
  self.datetime = Iso9660.Datetime(self._io, self, self._root)
  self.file_flags = self._io:read_u1()
  self.file_unit_size = self._io:read_u1()
  self.interleave_gap_size = self._io:read_u1()
  self.vol_seq_num = Iso9660.U2bi(self._io, self, self._root)
  self.len_file_name = self._io:read_u1()
  self.file_name = str_decode.decode(self._io:read_bytes(self.len_file_name), "UTF-8")
  if self.len_file_name % 2 == 0 then
    self.padding = self._io:read_u1()
  end
  self.rest = self._io:read_bytes_full()
end

Iso9660.DirEntryBody.property.extent_as_dir = {}
function Iso9660.DirEntryBody.property.extent_as_dir:get()
  if self._m_extent_as_dir ~= nil then
    return self._m_extent_as_dir
  end

  if self.file_flags & 2 ~= 0 then
    local _io = self._root._io
    local _pos = _io:pos()
    _io:seek(self.lba_extent.le * self._root.sector_size)
    self._raw__m_extent_as_dir = _io:read_bytes(self.size_extent.le)
    local _io = KaitaiStream(stringstream(self._raw__m_extent_as_dir))
    self._m_extent_as_dir = Iso9660.DirEntries(_io, self, self._root)
    _io:seek(_pos)
  end
  return self._m_extent_as_dir
end

Iso9660.DirEntryBody.property.extent_as_file = {}
function Iso9660.DirEntryBody.property.extent_as_file:get()
  if self._m_extent_as_file ~= nil then
    return self._m_extent_as_file
  end

  if self.file_flags & 2 == 0 then
    local _io = self._root._io
    local _pos = _io:pos()
    _io:seek(self.lba_extent.le * self._root.sector_size)
    self._m_extent_as_file = _io:read_bytes(self.size_extent.le)
    _io:seek(_pos)
  end
  return self._m_extent_as_file
end


Iso9660.PathTableEntryLe = class.class(KaitaiStruct)

function Iso9660.PathTableEntryLe:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Iso9660.PathTableEntryLe:_read()
  self.len_dir_name = self._io:read_u1()
  self.len_ext_attr_rec = self._io:read_u1()
  self.lba_extent = self._io:read_u4le()
  self.parent_dir_idx = self._io:read_u2le()
  self.dir_name = str_decode.decode(self._io:read_bytes(self.len_dir_name), "UTF-8")
  if self.len_dir_name % 2 == 1 then
    self.padding = self._io:read_u1()
  end
end


-- 
-- See also: Source (https://wiki.osdev.org/ISO_9660#The_Path_Table)
Iso9660.PathTableLe = class.class(KaitaiStruct)

function Iso9660.PathTableLe:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Iso9660.PathTableLe:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = Iso9660.PathTableEntryLe(self._io, self, self._root)
    i = i + 1
  end
end


Iso9660.U2bi = class.class(KaitaiStruct)

function Iso9660.U2bi:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Iso9660.U2bi:_read()
  self.le = self._io:read_u2le()
  self.be = self._io:read_u2be()
end


Iso9660.U4bi = class.class(KaitaiStruct)

function Iso9660.U4bi:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Iso9660.U4bi:_read()
  self.le = self._io:read_u4le()
  self.be = self._io:read_u4be()
end


Iso9660.VolDesc = class.class(KaitaiStruct)

function Iso9660.VolDesc:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Iso9660.VolDesc:_read()
  self.type = self._io:read_u1()
  self.magic = self._io:read_bytes(5)
  if not(self.magic == "\067\068\048\048\049") then
    error("not equal, expected " .. "\067\068\048\048\049" .. ", but got " .. self.magic)
  end
  self.version = self._io:read_u1()
  if self.type == 0 then
    self.vol_desc_boot_record = Iso9660.VolDescBootRecord(self._io, self, self._root)
  end
  if self.type == 1 then
    self.vol_desc_primary = Iso9660.VolDescPrimary(self._io, self, self._root)
  end
end


Iso9660.VolDescBootRecord = class.class(KaitaiStruct)

function Iso9660.VolDescBootRecord:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Iso9660.VolDescBootRecord:_read()
  self.boot_system_id = str_decode.decode(self._io:read_bytes(32), "UTF-8")
  self.boot_id = str_decode.decode(self._io:read_bytes(32), "UTF-8")
end


-- 
-- See also: Source (https://wiki.osdev.org/ISO_9660#The_Primary_Volume_Descriptor)
Iso9660.VolDescPrimary = class.class(KaitaiStruct)

function Iso9660.VolDescPrimary:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Iso9660.VolDescPrimary:_read()
  self.unused1 = self._io:read_bytes(1)
  if not(self.unused1 == "\000") then
    error("not equal, expected " .. "\000" .. ", but got " .. self.unused1)
  end
  self.system_id = str_decode.decode(self._io:read_bytes(32), "UTF-8")
  self.volume_id = str_decode.decode(self._io:read_bytes(32), "UTF-8")
  self.unused2 = self._io:read_bytes(8)
  if not(self.unused2 == "\000\000\000\000\000\000\000\000") then
    error("not equal, expected " .. "\000\000\000\000\000\000\000\000" .. ", but got " .. self.unused2)
  end
  self.vol_space_size = Iso9660.U4bi(self._io, self, self._root)
  self.unused3 = self._io:read_bytes(32)
  if not(self.unused3 == "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000") then
    error("not equal, expected " .. "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000" .. ", but got " .. self.unused3)
  end
  self.vol_set_size = Iso9660.U2bi(self._io, self, self._root)
  self.vol_seq_num = Iso9660.U2bi(self._io, self, self._root)
  self.logical_block_size = Iso9660.U2bi(self._io, self, self._root)
  self.path_table_size = Iso9660.U4bi(self._io, self, self._root)
  self.lba_path_table_le = self._io:read_u4le()
  self.lba_opt_path_table_le = self._io:read_u4le()
  self.lba_path_table_be = self._io:read_u4be()
  self.lba_opt_path_table_be = self._io:read_u4be()
  self._raw_root_dir = self._io:read_bytes(34)
  local _io = KaitaiStream(stringstream(self._raw_root_dir))
  self.root_dir = Iso9660.DirEntry(_io, self, self._root)
  self.vol_set_id = str_decode.decode(self._io:read_bytes(128), "UTF-8")
  self.publisher_id = str_decode.decode(self._io:read_bytes(128), "UTF-8")
  self.data_preparer_id = str_decode.decode(self._io:read_bytes(128), "UTF-8")
  self.application_id = str_decode.decode(self._io:read_bytes(128), "UTF-8")
  self.copyright_file_id = str_decode.decode(self._io:read_bytes(38), "UTF-8")
  self.abstract_file_id = str_decode.decode(self._io:read_bytes(36), "UTF-8")
  self.bibliographic_file_id = str_decode.decode(self._io:read_bytes(37), "UTF-8")
  self.vol_create_datetime = Iso9660.DecDatetime(self._io, self, self._root)
  self.vol_mod_datetime = Iso9660.DecDatetime(self._io, self, self._root)
  self.vol_expire_datetime = Iso9660.DecDatetime(self._io, self, self._root)
  self.vol_effective_datetime = Iso9660.DecDatetime(self._io, self, self._root)
  self.file_structure_version = self._io:read_u1()
  self.unused4 = self._io:read_u1()
  self.application_area = self._io:read_bytes(512)
end

Iso9660.VolDescPrimary.property.path_table = {}
function Iso9660.VolDescPrimary.property.path_table:get()
  if self._m_path_table ~= nil then
    return self._m_path_table
  end

  local _pos = self._io:pos()
  self._io:seek(self.lba_path_table_le * self._root.sector_size)
  self._raw__m_path_table = self._io:read_bytes(self.path_table_size.le)
  local _io = KaitaiStream(stringstream(self._raw__m_path_table))
  self._m_path_table = Iso9660.PathTableLe(_io, self, self._root)
  self._io:seek(_pos)
  return self._m_path_table
end



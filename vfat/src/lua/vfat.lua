-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("dos_datetime")
local stringstream = require("string_stream")
local str_decode = require("string_decode")
local utils = require("utils")

-- 
-- See also: Source (https://download.microsoft.com/download/0/8/4/084c452b-b772-4fe5-89bb-a0cbf082286a/fatgen103.doc)
Vfat = class.class(KaitaiStruct)

function Vfat:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Vfat:_read()
  self.boot_sector = Vfat.BootSector(self._io, self, self._root)
end

Vfat.property.fats = {}
function Vfat.property.fats:get()
  if self._m_fats ~= nil then
    return self._m_fats
  end

  local _pos = self._io:pos()
  self._io:seek(self.boot_sector.pos_fats)
  self._m_fats = {}
  for i = 0, self.boot_sector.bpb.num_fats - 1 do
    self._m_fats[i + 1] = self._io:read_bytes(self.boot_sector.size_fat)
  end
  self._io:seek(_pos)
  return self._m_fats
end

Vfat.property.root_dir = {}
function Vfat.property.root_dir:get()
  if self._m_root_dir ~= nil then
    return self._m_root_dir
  end

  local _pos = self._io:pos()
  self._io:seek(self.boot_sector.pos_root_dir)
  self._raw__m_root_dir = self._io:read_bytes(self.boot_sector.size_root_dir)
  local _io = KaitaiStream(stringstream(self._raw__m_root_dir))
  self._m_root_dir = Vfat.RootDirectory(_io, self, self._root)
  self._io:seek(_pos)
  return self._m_root_dir
end


Vfat.BiosParamBlock = class.class(KaitaiStruct)

function Vfat.BiosParamBlock:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Vfat.BiosParamBlock:_read()
  self.bytes_per_ls = self._io:read_u2le()
  self.ls_per_clus = self._io:read_u1()
  self.num_reserved_ls = self._io:read_u2le()
  self.num_fats = self._io:read_u1()
  self.max_root_dir_rec = self._io:read_u2le()
  self.total_ls_2 = self._io:read_u2le()
  self.media_code = self._io:read_u1()
  self.ls_per_fat = self._io:read_u2le()
  self.ps_per_track = self._io:read_u2le()
  self.num_heads = self._io:read_u2le()
  self.num_hidden_sectors = self._io:read_u4le()
  self.total_ls_4 = self._io:read_u4le()
end

-- 
-- Bytes per logical sector.
-- 
-- Logical sectors per cluster.
-- 
-- Count of reserved logical sectors. The number of logical
-- sectors before the first FAT in the file system image.
-- 
-- Number of File Allocation Tables.
-- 
-- Maximum number of FAT12 or FAT16 root directory entries. 0
-- for FAT32, where the root directory is stored in ordinary
-- data clusters.
-- 
-- Total logical sectors (if zero, use total_ls_4).
-- 
-- Media descriptor.
-- 
-- Logical sectors per File Allocation Table for
-- FAT12/FAT16. FAT32 sets this to 0 and uses the 32-bit value
-- at offset 0x024 instead.
-- 
-- Physical sectors per track for disks with INT 13h CHS
-- geometry, e.g., 15 for a "1.20 MB" (1200 KB) floppy. A zero
-- entry indicates that this entry is reserved, but not used.
-- 
-- Number of heads for disks with INT 13h CHS geometry,[9]
-- e.g., 2 for a double sided floppy.
-- 
-- Number of hidden sectors preceding the partition that
-- contains this FAT volume. This field should always be zero
-- on media that are not partitioned. This DOS 3.0 entry is
-- incompatible with a similar entry at offset 0x01C in BPBs
-- since DOS 3.31.  It must not be used if the logical sectors
-- entry at offset 0x013 is zero.
-- 
-- Total logical sectors including hidden sectors. This DOS 3.2
-- entry is incompatible with a similar entry at offset 0x020
-- in BPBs since DOS 3.31. It must not be used if the logical
-- sectors entry at offset 0x013 is zero.

Vfat.BootSector = class.class(KaitaiStruct)

function Vfat.BootSector:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Vfat.BootSector:_read()
  self.jmp_instruction = self._io:read_bytes(3)
  self.oem_name = str_decode.decode(KaitaiStream.bytes_strip_right(self._io:read_bytes(8), 32), "ASCII")
  self.bpb = Vfat.BiosParamBlock(self._io, self, self._root)
  if not(self.is_fat32) then
    self.ebpb_fat16 = Vfat.ExtBiosParamBlockFat16(self._io, self, self._root)
  end
  if self.is_fat32 then
    self.ebpb_fat32 = Vfat.ExtBiosParamBlockFat32(self._io, self, self._root)
  end
end

-- 
-- Determines if filesystem is FAT32 (true) or FAT12/16 (false)
-- by analyzing some preliminary conditions in BPB. Used to
-- determine whether we should parse post-BPB data as
-- `ext_bios_param_block_fat16` or `ext_bios_param_block_fat32`.
Vfat.BootSector.property.is_fat32 = {}
function Vfat.BootSector.property.is_fat32:get()
  if self._m_is_fat32 ~= nil then
    return self._m_is_fat32
  end

  self._m_is_fat32 = self.bpb.max_root_dir_rec == 0
  return self._m_is_fat32
end

Vfat.BootSector.property.ls_per_fat = {}
function Vfat.BootSector.property.ls_per_fat:get()
  if self._m_ls_per_fat ~= nil then
    return self._m_ls_per_fat
  end

  self._m_ls_per_fat = utils.box_unwrap((self.is_fat32) and utils.box_wrap(self.ebpb_fat32.ls_per_fat) or (self.bpb.ls_per_fat))
  return self._m_ls_per_fat
end

-- 
-- Size of root directory in logical sectors.
-- See also: FAT: General Overview of On-Disk Format, section "FAT Data Structure"
Vfat.BootSector.property.ls_per_root_dir = {}
function Vfat.BootSector.property.ls_per_root_dir:get()
  if self._m_ls_per_root_dir ~= nil then
    return self._m_ls_per_root_dir
  end

  self._m_ls_per_root_dir = math.floor(((self.bpb.max_root_dir_rec * 32 + self.bpb.bytes_per_ls) - 1) / self.bpb.bytes_per_ls)
  return self._m_ls_per_root_dir
end

-- 
-- Offset of FATs in bytes from start of filesystem.
Vfat.BootSector.property.pos_fats = {}
function Vfat.BootSector.property.pos_fats:get()
  if self._m_pos_fats ~= nil then
    return self._m_pos_fats
  end

  self._m_pos_fats = self.bpb.bytes_per_ls * self.bpb.num_reserved_ls
  return self._m_pos_fats
end

-- 
-- Offset of root directory in bytes from start of filesystem.
Vfat.BootSector.property.pos_root_dir = {}
function Vfat.BootSector.property.pos_root_dir:get()
  if self._m_pos_root_dir ~= nil then
    return self._m_pos_root_dir
  end

  self._m_pos_root_dir = self.bpb.bytes_per_ls * (self.bpb.num_reserved_ls + self.ls_per_fat * self.bpb.num_fats)
  return self._m_pos_root_dir
end

-- 
-- Size of one FAT in bytes.
Vfat.BootSector.property.size_fat = {}
function Vfat.BootSector.property.size_fat:get()
  if self._m_size_fat ~= nil then
    return self._m_size_fat
  end

  self._m_size_fat = self.bpb.bytes_per_ls * self.ls_per_fat
  return self._m_size_fat
end

-- 
-- Size of root directory in bytes.
Vfat.BootSector.property.size_root_dir = {}
function Vfat.BootSector.property.size_root_dir:get()
  if self._m_size_root_dir ~= nil then
    return self._m_size_root_dir
  end

  self._m_size_root_dir = self.ls_per_root_dir * self.bpb.bytes_per_ls
  return self._m_size_root_dir
end

-- 
-- Basic BIOS parameter block, present in all versions of FAT.
-- 
-- FAT12/16-specific extended BIOS parameter block.
-- 
-- FAT32-specific extended BIOS parameter block.

-- 
-- Extended BIOS Parameter Block (DOS 4.0+, OS/2 1.0+). Used only
-- for FAT12 and FAT16.
Vfat.ExtBiosParamBlockFat16 = class.class(KaitaiStruct)

function Vfat.ExtBiosParamBlockFat16:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Vfat.ExtBiosParamBlockFat16:_read()
  self.phys_drive_num = self._io:read_u1()
  self.reserved1 = self._io:read_u1()
  self.ext_boot_sign = self._io:read_u1()
  self.volume_id = self._io:read_bytes(4)
  self.partition_volume_label = str_decode.decode(KaitaiStream.bytes_strip_right(self._io:read_bytes(11), 32), "ASCII")
  self.fs_type_str = str_decode.decode(KaitaiStream.bytes_strip_right(self._io:read_bytes(8), 32), "ASCII")
end

-- 
-- Physical drive number (0x00 for (first) removable media,
-- 0x80 for (first) fixed disk as per INT 13h).
-- 
-- Should be 0x29 to indicate that an EBPB with the following 3
-- entries exists.
-- 
-- Volume ID (serial number).
-- 
-- Typically the serial number "xxxx-xxxx" is created by a
-- 16-bit addition of both DX values returned by INT 21h/AH=2Ah
-- (get system date) and INT 21h/AH=2Ch (get system time) for
-- the high word and another 16-bit addition of both CX values
-- for the low word of the serial number. Alternatively, some
-- DR-DOS disk utilities provide a /# option to generate a
-- human-readable time stamp "mmdd-hhmm" build from BCD-encoded
-- 8-bit values for the month, day, hour and minute instead of
-- a serial number.

-- 
-- Extended BIOS Parameter Block for FAT32.
Vfat.ExtBiosParamBlockFat32 = class.class(KaitaiStruct)

function Vfat.ExtBiosParamBlockFat32:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Vfat.ExtBiosParamBlockFat32:_read()
  self.ls_per_fat = self._io:read_u4le()
  self.has_active_fat = self._io:read_bits_int_le(1) ~= 0
  self.reserved1 = self._io:read_bits_int_le(3)
  self.active_fat_id = self._io:read_bits_int_le(4)
  self._io:align_to_byte()
  self.reserved2 = self._io:read_bytes(1)
  if not(self.reserved2 == "\000") then
    error("not equal, expected " .. "\000" .. ", but got " .. self.reserved2)
  end
  self.fat_version = self._io:read_u2le()
  self.root_dir_start_clus = self._io:read_u4le()
  self.ls_fs_info = self._io:read_u2le()
  self.boot_sectors_copy_start_ls = self._io:read_u2le()
  self.reserved3 = self._io:read_bytes(12)
  self.phys_drive_num = self._io:read_u1()
  self.reserved4 = self._io:read_u1()
  self.ext_boot_sign = self._io:read_u1()
  self.volume_id = self._io:read_bytes(4)
  self.partition_volume_label = str_decode.decode(KaitaiStream.bytes_strip_right(self._io:read_bytes(11), 32), "ASCII")
  self.fs_type_str = str_decode.decode(KaitaiStream.bytes_strip_right(self._io:read_bytes(8), 32), "ASCII")
end

-- 
-- Logical sectors per file allocation table (corresponds with
-- the old entry `ls_per_fat` in the DOS 2.0 BPB).
-- 
-- If true, then there is "active" FAT, which is designated in
-- `active_fat` attribute. If false, all FATs are mirrored as
-- usual.
-- 
-- Zero-based number of active FAT, if `has_active_fat`
-- attribute is true.
-- 
-- Cluster number of root directory start, typically 2 if it
-- contains no bad sector. (Microsoft's FAT32 implementation
-- imposes an artificial limit of 65,535 entries per directory,
-- whilst many third-party implementations do not.)
-- 
-- Logical sector number of FS Information Sector, typically 1,
-- i.e., the second of the three FAT32 boot sectors. Values
-- like 0 and 0xFFFF are used by some FAT32 implementations to
-- designate abscence of FS Information Sector.
-- 
-- First logical sector number of a copy of the three FAT32
-- boot sectors, typically 6.
-- 
-- Physical drive number (0x00 for (first) removable media,
-- 0x80 for (first) fixed disk as per INT 13h).
-- 
-- Should be 0x29 to indicate that an EBPB with the following 3
-- entries exists.
-- 
-- Volume ID (serial number).
-- 
-- Typically the serial number "xxxx-xxxx" is created by a
-- 16-bit addition of both DX values returned by INT 21h/AH=2Ah
-- (get system date) and INT 21h/AH=2Ch (get system time) for
-- the high word and another 16-bit addition of both CX values
-- for the low word of the serial number. Alternatively, some
-- DR-DOS disk utilities provide a /# option to generate a
-- human-readable time stamp "mmdd-hhmm" build from BCD-encoded
-- 8-bit values for the month, day, hour and minute instead of
-- a serial number.

Vfat.RootDirectory = class.class(KaitaiStruct)

function Vfat.RootDirectory:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Vfat.RootDirectory:_read()
  self.records = {}
  for i = 0, self._root.boot_sector.bpb.max_root_dir_rec - 1 do
    self.records[i + 1] = Vfat.RootDirectoryRec(self._io, self, self._root)
  end
end


Vfat.RootDirectoryRec = class.class(KaitaiStruct)

function Vfat.RootDirectoryRec:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Vfat.RootDirectoryRec:_read()
  self.file_name = self._io:read_bytes(11)
  self._raw_attrs = self._io:read_bytes(1)
  local _io = KaitaiStream(stringstream(self._raw_attrs))
  self.attrs = Vfat.RootDirectoryRec.AttrFlags(_io, self, self._root)
  self.reserved = self._io:read_bytes(10)
  self._raw_last_write_time = self._io:read_bytes(4)
  local _io = KaitaiStream(stringstream(self._raw_last_write_time))
  self.last_write_time = DosDatetime(_io)
  self.start_clus = self._io:read_u2le()
  self.file_size = self._io:read_u4le()
end


Vfat.RootDirectoryRec.AttrFlags = class.class(KaitaiStruct)

function Vfat.RootDirectoryRec.AttrFlags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Vfat.RootDirectoryRec.AttrFlags:_read()
  self.read_only = self._io:read_bits_int_le(1) ~= 0
  self.hidden = self._io:read_bits_int_le(1) ~= 0
  self.system = self._io:read_bits_int_le(1) ~= 0
  self.volume_id = self._io:read_bits_int_le(1) ~= 0
  self.is_directory = self._io:read_bits_int_le(1) ~= 0
  self.archive = self._io:read_bits_int_le(1) ~= 0
  self.reserved = self._io:read_bits_int_le(2)
end

Vfat.RootDirectoryRec.AttrFlags.property.long_name = {}
function Vfat.RootDirectoryRec.AttrFlags.property.long_name:get()
  if self._m_long_name ~= nil then
    return self._m_long_name
  end

  self._m_long_name =  ((self.read_only) and (self.hidden) and (self.system) and (self.volume_id)) 
  return self._m_long_name
end



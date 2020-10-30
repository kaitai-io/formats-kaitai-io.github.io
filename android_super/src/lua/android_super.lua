-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local enum = require("enum")
local str_decode = require("string_decode")

-- 
-- The metadata stored by Android at the beginning of a "super" partition, which
-- is what it calls a disk partition that holds one or more Dynamic Partitions.
-- Dynamic Partitions do more or less the same thing that LVM does on Linux,
-- allowing Android to map ranges of non-contiguous extents to a single logical
-- device. This metadata holds that mapping.
-- See also: Source (https://source.android.com/devices/tech/ota/dynamic_partitions)
-- See also: Source (https://android.googlesource.com/platform/system/core/+/refs/tags/android-11.0.0_r8/fs_mgr/liblp/include/liblp/metadata_format.h)
AndroidSuper = class.class(KaitaiStruct)

function AndroidSuper:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidSuper:_read()
end

AndroidSuper.property.root = {}
function AndroidSuper.property.root:get()
  if self._m_root ~= nil then
    return self._m_root
  end

  local _pos = self._io:pos()
  self._io:seek(4096)
  self._m_root = AndroidSuper.Root(self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_root
end


AndroidSuper.Root = class.class(KaitaiStruct)

function AndroidSuper.Root:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidSuper.Root:_read()
  self._raw_primary_geometry = self._io:read_bytes(4096)
  local _io = KaitaiStream(stringstream(self._raw_primary_geometry))
  self.primary_geometry = AndroidSuper.Geometry(_io, self, self._root)
  self._raw_backup_geometry = self._io:read_bytes(4096)
  local _io = KaitaiStream(stringstream(self._raw_backup_geometry))
  self.backup_geometry = AndroidSuper.Geometry(_io, self, self._root)
  self._raw_primary_metadata = {}
  self.primary_metadata = {}
  for i = 0, self.primary_geometry.metadata_slot_count - 1 do
    self._raw_primary_metadata[i + 1] = self._io:read_bytes(self.primary_geometry.metadata_max_size)
    local _io = KaitaiStream(stringstream(self._raw_primary_metadata[i + 1]))
    self.primary_metadata[i + 1] = AndroidSuper.Metadata(_io, self, self._root)
  end
  self._raw_backup_metadata = {}
  self.backup_metadata = {}
  for i = 0, self.primary_geometry.metadata_slot_count - 1 do
    self._raw_backup_metadata[i + 1] = self._io:read_bytes(self.primary_geometry.metadata_max_size)
    local _io = KaitaiStream(stringstream(self._raw_backup_metadata[i + 1]))
    self.backup_metadata[i + 1] = AndroidSuper.Metadata(_io, self, self._root)
  end
end


AndroidSuper.Geometry = class.class(KaitaiStruct)

function AndroidSuper.Geometry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidSuper.Geometry:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\103\068\108\097") then
    error("not equal, expected " ..  "\103\068\108\097" .. ", but got " .. self.magic)
  end
  self.struct_size = self._io:read_u4le()
  self.checksum = self._io:read_bytes(32)
  self.metadata_max_size = self._io:read_u4le()
  self.metadata_slot_count = self._io:read_u4le()
  self.logical_block_size = self._io:read_u4le()
end

-- 
-- SHA-256 hash of struct_size bytes from beginning of geometry,
-- calculated as if checksum were zeroed out

AndroidSuper.Metadata = class.class(KaitaiStruct)

AndroidSuper.Metadata.TableKind = enum.Enum {
  partitions = 0,
  extents = 1,
  groups = 2,
  block_devices = 3,
}

function AndroidSuper.Metadata:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidSuper.Metadata:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\048\080\076\065") then
    error("not equal, expected " ..  "\048\080\076\065" .. ", but got " .. self.magic)
  end
  self.major_version = self._io:read_u2le()
  self.minor_version = self._io:read_u2le()
  self.header_size = self._io:read_u4le()
  self.header_checksum = self._io:read_bytes(32)
  self.tables_size = self._io:read_u4le()
  self.tables_checksum = self._io:read_bytes(32)
  self.partitions = AndroidSuper.Metadata.TableDescriptor(AndroidSuper.Metadata.TableKind.partitions, self._io, self, self._root)
  self.extents = AndroidSuper.Metadata.TableDescriptor(AndroidSuper.Metadata.TableKind.extents, self._io, self, self._root)
  self.groups = AndroidSuper.Metadata.TableDescriptor(AndroidSuper.Metadata.TableKind.groups, self._io, self, self._root)
  self.block_devices = AndroidSuper.Metadata.TableDescriptor(AndroidSuper.Metadata.TableKind.block_devices, self._io, self, self._root)
end

-- 
-- SHA-256 hash of header_size bytes from beginning of metadata,
-- calculated as if header_checksum were zeroed out
-- 
-- SHA-256 hash of tables_size bytes from end of header.

AndroidSuper.Metadata.BlockDevice = class.class(KaitaiStruct)

function AndroidSuper.Metadata.BlockDevice:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidSuper.Metadata.BlockDevice:_read()
  self.first_logical_sector = self._io:read_u8le()
  self.alignment = self._io:read_u4le()
  self.alignment_offset = self._io:read_u4le()
  self.size = self._io:read_u8le()
  self.partition_name = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(36), 0, false), "UTF-8")
  self.flag_slot_suffixed = self._io:read_bits_int_le(1)
  self.flags_reserved = self._io:read_bits_int_le(31)
end


AndroidSuper.Metadata.Extent = class.class(KaitaiStruct)

AndroidSuper.Metadata.Extent.TargetType = enum.Enum {
  linear = 0,
  zero = 1,
}

function AndroidSuper.Metadata.Extent:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidSuper.Metadata.Extent:_read()
  self.num_sectors = self._io:read_u8le()
  self.target_type = AndroidSuper.Metadata.Extent.TargetType(self._io:read_u4le())
  self.target_data = self._io:read_u8le()
  self.target_source = self._io:read_u4le()
end


AndroidSuper.Metadata.TableDescriptor = class.class(KaitaiStruct)

function AndroidSuper.Metadata.TableDescriptor:_init(kind, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.kind = kind
  self:_read()
end

function AndroidSuper.Metadata.TableDescriptor:_read()
  self.offset = self._io:read_u4le()
  self.num_entries = self._io:read_u4le()
  self.entry_size = self._io:read_u4le()
end

AndroidSuper.Metadata.TableDescriptor.property.table = {}
function AndroidSuper.Metadata.TableDescriptor.property.table:get()
  if self._m_table ~= nil then
    return self._m_table
  end

  local _pos = self._io:pos()
  self._io:seek((self._parent.header_size + self.offset))
  self._raw__m_table = {}
  self._m_table = {}
  for i = 0, self.num_entries - 1 do
    local _on = self.kind
    if _on == AndroidSuper.Metadata.TableKind.partitions then
      self._raw__m_table[i + 1] = self._io:read_bytes(self.entry_size)
      local _io = KaitaiStream(stringstream(self._raw__m_table[i + 1]))
      self._m_table[i + 1] = AndroidSuper.Metadata.Partition(_io, self, self._root)
    elseif _on == AndroidSuper.Metadata.TableKind.extents then
      self._raw__m_table[i + 1] = self._io:read_bytes(self.entry_size)
      local _io = KaitaiStream(stringstream(self._raw__m_table[i + 1]))
      self._m_table[i + 1] = AndroidSuper.Metadata.Extent(_io, self, self._root)
    elseif _on == AndroidSuper.Metadata.TableKind.groups then
      self._raw__m_table[i + 1] = self._io:read_bytes(self.entry_size)
      local _io = KaitaiStream(stringstream(self._raw__m_table[i + 1]))
      self._m_table[i + 1] = AndroidSuper.Metadata.Group(_io, self, self._root)
    elseif _on == AndroidSuper.Metadata.TableKind.block_devices then
      self._raw__m_table[i + 1] = self._io:read_bytes(self.entry_size)
      local _io = KaitaiStream(stringstream(self._raw__m_table[i + 1]))
      self._m_table[i + 1] = AndroidSuper.Metadata.BlockDevice(_io, self, self._root)
    else
      self._m_table[i + 1] = self._io:read_bytes(self.entry_size)
    end
  end
  self._io:seek(_pos)
  return self._m_table
end


AndroidSuper.Metadata.Partition = class.class(KaitaiStruct)

function AndroidSuper.Metadata.Partition:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidSuper.Metadata.Partition:_read()
  self.name = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(36), 0, false), "UTF-8")
  self.attr_readonly = self._io:read_bits_int_le(1)
  self.attr_slot_suffixed = self._io:read_bits_int_le(1)
  self.attr_updated = self._io:read_bits_int_le(1)
  self.attr_disabled = self._io:read_bits_int_le(1)
  self.attrs_reserved = self._io:read_bits_int_le(28)
  self._io:align_to_byte()
  self.first_extent_index = self._io:read_u4le()
  self.num_extents = self._io:read_u4le()
  self.group_index = self._io:read_u4le()
end


AndroidSuper.Metadata.Group = class.class(KaitaiStruct)

function AndroidSuper.Metadata.Group:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidSuper.Metadata.Group:_read()
  self.name = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(36), 0, false), "UTF-8")
  self.flag_slot_suffixed = self._io:read_bits_int_le(1)
  self.flags_reserved = self._io:read_bits_int_le(31)
  self._io:align_to_byte()
  self.maximum_size = self._io:read_u8le()
end



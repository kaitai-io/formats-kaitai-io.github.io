-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")

-- 
-- See also: Source (https://github.com/libyal/libvmdk/blob/master/documentation/VMWare%20Virtual%20Disk%20Format%20(VMDK).asciidoc#41-file-header)
VmwareVmdk = class.class(KaitaiStruct)

VmwareVmdk.CompressionMethods = enum.Enum {
  none = 0,
  deflate = 1,
}

function VmwareVmdk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function VmwareVmdk:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\075\068\077\086") then
    error("not equal, expected " ..  "\075\068\077\086" .. ", but got " .. self.magic)
  end
  self.version = self._io:read_s4le()
  self.flags = VmwareVmdk.HeaderFlags(self._io, self, self._root)
  self.size_max = self._io:read_s8le()
  self.size_grain = self._io:read_s8le()
  self.start_descriptor = self._io:read_s8le()
  self.size_descriptor = self._io:read_s8le()
  self.num_grain_table_entries = self._io:read_s4le()
  self.start_secondary_grain = self._io:read_s8le()
  self.start_primary_grain = self._io:read_s8le()
  self.size_metadata = self._io:read_s8le()
  self.is_dirty = self._io:read_u1()
  self.stuff = self._io:read_bytes(4)
  self.compression_method = VmwareVmdk.CompressionMethods(self._io:read_u2le())
end

VmwareVmdk.property.len_sector = {}
function VmwareVmdk.property.len_sector:get()
  if self._m_len_sector ~= nil then
    return self._m_len_sector
  end

  self._m_len_sector = 512
  return self._m_len_sector
end

VmwareVmdk.property.descriptor = {}
function VmwareVmdk.property.descriptor:get()
  if self._m_descriptor ~= nil then
    return self._m_descriptor
  end

  local _pos = self._io:pos()
  self._io:seek((self.start_descriptor * self._root.len_sector))
  self._m_descriptor = self._io:read_bytes((self.size_descriptor * self._root.len_sector))
  self._io:seek(_pos)
  return self._m_descriptor
end

VmwareVmdk.property.grain_primary = {}
function VmwareVmdk.property.grain_primary:get()
  if self._m_grain_primary ~= nil then
    return self._m_grain_primary
  end

  local _pos = self._io:pos()
  self._io:seek((self.start_primary_grain * self._root.len_sector))
  self._m_grain_primary = self._io:read_bytes((self.size_grain * self._root.len_sector))
  self._io:seek(_pos)
  return self._m_grain_primary
end

VmwareVmdk.property.grain_secondary = {}
function VmwareVmdk.property.grain_secondary:get()
  if self._m_grain_secondary ~= nil then
    return self._m_grain_secondary
  end

  local _pos = self._io:pos()
  self._io:seek((self.start_secondary_grain * self._root.len_sector))
  self._m_grain_secondary = self._io:read_bytes((self.size_grain * self._root.len_sector))
  self._io:seek(_pos)
  return self._m_grain_secondary
end

-- 
-- Maximum number of sectors in a given image file (capacity).
-- 
-- Embedded descriptor file start sector number (0 if not available).
-- 
-- Number of sectors that embedded descriptor file occupies.
-- 
-- Number of grains table entries.
-- 
-- Secondary (backup) grain directory start sector number.
-- 
-- Primary grain directory start sector number.

-- 
-- See also: Source (https://github.com/libyal/libvmdk/blob/master/documentation/VMWare%20Virtual%20Disk%20Format%20(VMDK).asciidoc#411-flags)
VmwareVmdk.HeaderFlags = class.class(KaitaiStruct)

function VmwareVmdk.HeaderFlags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function VmwareVmdk.HeaderFlags:_read()
  self.reserved1 = self._io:read_bits_int_be(5)
  self.zeroed_grain_table_entry = self._io:read_bits_int_be(1) ~= 0
  self.use_secondary_grain_dir = self._io:read_bits_int_be(1) ~= 0
  self.valid_new_line_detection_test = self._io:read_bits_int_be(1) ~= 0
  self._io:align_to_byte()
  self.reserved2 = self._io:read_u1()
  self.reserved3 = self._io:read_bits_int_be(6)
  self.has_metadata = self._io:read_bits_int_be(1) ~= 0
  self.has_compressed_grain = self._io:read_bits_int_be(1) ~= 0
  self._io:align_to_byte()
  self.reserved4 = self._io:read_u1()
end



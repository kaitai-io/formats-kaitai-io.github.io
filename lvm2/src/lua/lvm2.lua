-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")
local stringstream = require("string_stream")
local enum = require("enum")

-- 
-- ### Building a test file
-- 
-- ```
-- dd if=/dev/zero of=image.img bs=512 count=$(( 4 * 1024 * 2 ))
-- sudo losetup /dev/loop1 image.img
-- sudo pvcreate /dev/loop1
-- sudo vgcreate vg_test /dev/loop1
-- sudo lvcreate --name lv_test1 vg_test
-- sudo losetup -d /dev/loop1
-- ```
-- See also: Source (https://github.com/libyal/libvslvm/blob/main/documentation/Logical%20Volume%20Manager%20(LVM)%20format.asciidoc)
Lvm2 = class.class(KaitaiStruct)

function Lvm2:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Lvm2:_read()
  self.pv = Lvm2.PhysicalVolume(self._io, self, self._root)
end

Lvm2.property.sector_size = {}
function Lvm2.property.sector_size:get()
  if self._m_sector_size ~= nil then
    return self._m_sector_size
  end

  self._m_sector_size = 512
  return self._m_sector_size
end

-- 
-- Physical volume.

Lvm2.PhysicalVolume = class.class(KaitaiStruct)

function Lvm2.PhysicalVolume:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Lvm2.PhysicalVolume:_read()
  self.empty_sector = self._io:read_bytes(self._root.sector_size)
  self.label = Lvm2.PhysicalVolume.Label(self._io, self, self._root)
end


Lvm2.PhysicalVolume.Label = class.class(KaitaiStruct)

function Lvm2.PhysicalVolume.Label:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Lvm2.PhysicalVolume.Label:_read()
  self.label_header = Lvm2.PhysicalVolume.Label.LabelHeader(self._io, self, self._root)
  self.volume_header = Lvm2.PhysicalVolume.Label.VolumeHeader(self._io, self, self._root)
end


Lvm2.PhysicalVolume.Label.LabelHeader = class.class(KaitaiStruct)

function Lvm2.PhysicalVolume.Label.LabelHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Lvm2.PhysicalVolume.Label.LabelHeader:_read()
  self.signature = self._io:read_bytes(8)
  if not(self.signature == "\076\065\066\069\076\079\078\069") then
    error("not equal, expected " ..  "\076\065\066\069\076\079\078\069" .. ", but got " .. self.signature)
  end
  self.sector_number = self._io:read_u8le()
  self.checksum = self._io:read_u4le()
  self.label_header_ = Lvm2.PhysicalVolume.Label.LabelHeader.LabelHeader(self._io, self, self._root)
end

-- 
-- The sector number of the physical volume label header.
-- 
-- CRC-32 for offset 20 to end of the physical volume label sector.

Lvm2.PhysicalVolume.Label.LabelHeader.LabelHeader = class.class(KaitaiStruct)

function Lvm2.PhysicalVolume.Label.LabelHeader.LabelHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Lvm2.PhysicalVolume.Label.LabelHeader.LabelHeader:_read()
  self.data_offset = self._io:read_u4le()
  self.type_indicator = self._io:read_bytes(8)
  if not(self.type_indicator == "\076\086\077\050\032\048\048\049") then
    error("not equal, expected " ..  "\076\086\077\050\032\048\048\049" .. ", but got " .. self.type_indicator)
  end
end

-- 
-- The offset, in bytes, relative from the start of the physical volume label header where data is stored.

Lvm2.PhysicalVolume.Label.VolumeHeader = class.class(KaitaiStruct)

function Lvm2.PhysicalVolume.Label.VolumeHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Lvm2.PhysicalVolume.Label.VolumeHeader:_read()
  self.id = str_decode.decode(self._io:read_bytes(32), "ascii")
  self.size = self._io:read_u8le()
  self.data_area_descriptors = {}
  local i = 0
  while true do
    local _ = Lvm2.PhysicalVolume.Label.VolumeHeader.DataAreaDescriptor(self._io, self, self._root)
    self.data_area_descriptors[i + 1] = _
    if  ((_.size ~= 0) and (_.offset ~= 0))  then
      break
    end
    i = i + 1
  end
  self.metadata_area_descriptors = {}
  local i = 0
  while true do
    local _ = Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataAreaDescriptor(self._io, self, self._root)
    self.metadata_area_descriptors[i + 1] = _
    if  ((_.size ~= 0) and (_.offset ~= 0))  then
      break
    end
    i = i + 1
  end
end

-- 
-- Contains a UUID stored as an ASCII string. The physical volume identifier can be used to uniquely identify a physical volume. The physical volume identifier is stored as: 9LBcEB7PQTGIlLI0KxrtzrynjuSL983W but is equivalent to its formatted variant: 9LBcEB-7PQT-GIlL-I0Kx-rtzr-ynju-SL983W, which is used in the metadata.
-- 
-- Physical Volume size. Value in bytes.
-- 
-- The last descriptor in the list is terminator and consists of 0-byte values.

Lvm2.PhysicalVolume.Label.VolumeHeader.DataAreaDescriptor = class.class(KaitaiStruct)

function Lvm2.PhysicalVolume.Label.VolumeHeader.DataAreaDescriptor:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Lvm2.PhysicalVolume.Label.VolumeHeader.DataAreaDescriptor:_read()
  self.offset = self._io:read_u8le()
  self.size = self._io:read_u8le()
end

Lvm2.PhysicalVolume.Label.VolumeHeader.DataAreaDescriptor.property.data = {}
function Lvm2.PhysicalVolume.Label.VolumeHeader.DataAreaDescriptor.property.data:get()
  if self._m_data ~= nil then
    return self._m_data
  end

  if self.size ~= 0 then
    local _pos = self._io:pos()
    self._io:seek(self.offset)
    self._m_data = str_decode.decode(self._io:read_bytes(self.size), "ascii")
    self._io:seek(_pos)
  end
  return self._m_data
end

-- 
-- The offset, in bytes, relative from the start of the physical volume.
-- 
-- Value in bytes. Can be 0. [yellow-background]*Does this represent all remaining available space?*

Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataAreaDescriptor = class.class(KaitaiStruct)

function Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataAreaDescriptor:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataAreaDescriptor:_read()
  self.offset = self._io:read_u8le()
  self.size = self._io:read_u8le()
end

Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataAreaDescriptor.property.data = {}
function Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataAreaDescriptor.property.data:get()
  if self._m_data ~= nil then
    return self._m_data
  end

  if self.size ~= 0 then
    local _pos = self._io:pos()
    self._io:seek(self.offset)
    self._raw__m_data = self._io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_data))
    self._m_data = Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea(_io, self, self._root)
    self._io:seek(_pos)
  end
  return self._m_data
end

-- 
-- The offset, in bytes, relative from the start of the physical volume.
-- 
-- Value in bytes.

-- 
-- According to `[REDHAT]` the metadata area is a circular buffer. New metadata is appended to the old metadata and then the pointer to the start of it is updated. The metadata area, therefore, can contain copies of older versions of the metadata.
Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea = class.class(KaitaiStruct)

function Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea:_read()
  self.header = Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader(self._io, self, self._root)
end


Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader = class.class(KaitaiStruct)

function Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader:_read()
  self.checksum = Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader(self._io, self, self._root)
  self.signature = self._io:read_bytes(16)
  if not(self.signature == "\032\076\086\077\050\032\120\091\053\065\037\114\048\078\042\062") then
    error("not equal, expected " ..  "\032\076\086\077\050\032\120\091\053\065\037\114\048\078\042\062" .. ", but got " .. self.signature)
  end
  self.version = self._io:read_u4le()
  self.metadata_area_offset = self._io:read_u8le()
  self.metadata_area_size = self._io:read_u8le()
  self.raw_location_descriptors = {}
  local i = 0
  while true do
    local _ = Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader.RawLocationDescriptor(self._io, self, self._root)
    self.raw_location_descriptors[i + 1] = _
    if  ((_.offset ~= 0) and (_.size ~= 0) and (_.checksum ~= 0))  then
      break
    end
    i = i + 1
  end
end

Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader.property.metadata = {}
function Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader.property.metadata:get()
  if self._m_metadata ~= nil then
    return self._m_metadata
  end

  local _pos = self._io:pos()
  self._io:seek(self.metadata_area_offset)
  self._m_metadata = self._io:read_bytes(self.metadata_area_size)
  self._io:seek(_pos)
  return self._m_metadata
end

-- 
-- CRC-32 for offset 4 to end of the metadata area header.
-- 
-- The offset, in bytes, of the metadata area relative from the start of the physical volume.
-- 
-- The last descriptor in the list is terminator and consists of 0-byte values.

-- 
-- The data area size can be 0. It is assumed it represents the remaining  available data.
Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader.RawLocationDescriptor = class.class(KaitaiStruct)

Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader.RawLocationDescriptor.RawLocationDescriptorFlags = enum.Enum {
  raw_location_ignored = 1,
}

function Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader.RawLocationDescriptor:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader.RawLocationDescriptor:_read()
  self.offset = self._io:read_u8le()
  self.size = self._io:read_u8le()
  self.checksum = self._io:read_u4le()
  self.flags = Lvm2.PhysicalVolume.Label.VolumeHeader.MetadataArea.MetadataAreaHeader.RawLocationDescriptor.RawLocationDescriptorFlags(self._io:read_u4le())
end

-- 
-- The data area offset, in bytes, relative from the start of the metadata area.
-- 
-- data area size in bytes.
-- 
-- CRC-32 of *TODO (metadata?)*.


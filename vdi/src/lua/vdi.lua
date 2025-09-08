-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local str_decode = require("string_decode")
local utils = require("utils")

-- 
-- A native VirtualBox file format
-- 
-- Images for testing can be downloaded from
-- 
--  * <https://www.osboxes.org/virtualbox-images/>
--  * <https://virtualboxes.org/images/>
-- 
-- or you can convert images of other formats.
-- See also: Source (https://github.com/qemu/qemu/blob/master/block/vdi.c)
Vdi = class.class(KaitaiStruct)

Vdi.ImageType = enum.Enum {
  dynamic = 1,
  static = 2,
  undo = 3,
  diff = 4,
}

function Vdi:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Vdi:_read()
  self.header = Vdi.Header(self._io, self, self._root)
end

Vdi.property.block_discarded = {}
function Vdi.property.block_discarded:get()
  if self._m_block_discarded ~= nil then
    return self._m_block_discarded
  end

  self._m_block_discarded = 4294967294
  return self._m_block_discarded
end

Vdi.property.block_unallocated = {}
function Vdi.property.block_unallocated:get()
  if self._m_block_unallocated ~= nil then
    return self._m_block_unallocated
  end

  self._m_block_unallocated = 4294967295
  return self._m_block_unallocated
end

-- 
-- block_index = offset_in_virtual_disk / block_size actual_data_offset = blocks_map[block_index]*block_size+metadata_size+offset_in_block
-- The blocks_map will take up blocks_in_image_max * sizeof(uint32_t) bytes; since the blocks_map is read and written in a single operation, its size needs to be limited to INT_MAX; furthermore, when opening an image, the blocks_map size is rounded up to be aligned on BDRV_SECTOR_SIZE. Therefore this should satisfy the following: blocks_in_image_max * sizeof(uint32_t) + BDRV_SECTOR_SIZE == INT_MAX + 1 (INT_MAX + 1 is the first value not representable as an int) This guarantees that any value below or equal to the constant will, when multiplied by sizeof(uint32_t) and rounded up to a BDRV_SECTOR_SIZE boundary, still be below or equal to INT_MAX.
Vdi.property.blocks_map = {}
function Vdi.property.blocks_map:get()
  if self._m_blocks_map ~= nil then
    return self._m_blocks_map
  end

  local _pos = self._io:pos()
  self._io:seek(self.header.blocks_map_offset)
  self._raw__m_blocks_map = self._io:read_bytes(self.header.blocks_map_size)
  local _io = KaitaiStream(stringstream(self._raw__m_blocks_map))
  self._m_blocks_map = Vdi.BlocksMap(_io, self, self._root)
  self._io:seek(_pos)
  return self._m_blocks_map
end

Vdi.property.disk = {}
function Vdi.property.disk:get()
  if self._m_disk ~= nil then
    return self._m_disk
  end

  local _pos = self._io:pos()
  self._io:seek(self.header.blocks_offset)
  self._m_disk = Vdi.Disk(self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_disk
end


Vdi.BlocksMap = class.class(KaitaiStruct)

function Vdi.BlocksMap:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Vdi.BlocksMap:_read()
  self.index = {}
  for i = 0, self._root.header.header_main.blocks_in_image - 1 do
    self.index[i + 1] = Vdi.BlocksMap.BlockIndex(self._io, self, self._root)
  end
end


Vdi.BlocksMap.BlockIndex = class.class(KaitaiStruct)

function Vdi.BlocksMap.BlockIndex:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Vdi.BlocksMap.BlockIndex:_read()
  self.index = self._io:read_u4le()
end

Vdi.BlocksMap.BlockIndex.property.block = {}
function Vdi.BlocksMap.BlockIndex.property.block:get()
  if self._m_block ~= nil then
    return self._m_block
  end

  if self.is_allocated then
    self._m_block = self._root.disk.blocks[self.index + 1]
  end
  return self._m_block
end

Vdi.BlocksMap.BlockIndex.property.is_allocated = {}
function Vdi.BlocksMap.BlockIndex.property.is_allocated:get()
  if self._m_is_allocated ~= nil then
    return self._m_is_allocated
  end

  self._m_is_allocated = self.index < self._root.block_discarded
  return self._m_is_allocated
end


Vdi.Disk = class.class(KaitaiStruct)

function Vdi.Disk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Vdi.Disk:_read()
  self.blocks = {}
  for i = 0, self._root.header.header_main.blocks_in_image - 1 do
    self.blocks[i + 1] = Vdi.Disk.Block(self._io, self, self._root)
  end
end


Vdi.Disk.Block = class.class(KaitaiStruct)

function Vdi.Disk.Block:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Vdi.Disk.Block:_read()
  self.metadata = self._io:read_bytes(self._root.header.header_main.block_metadata_size)
  self._raw_data = {}
  self.data = {}
  local i = 0
  while not self._io:is_eof() do
    self._raw_data[i + 1] = self._io:read_bytes(self._root.header.header_main.block_data_size)
    local _io = KaitaiStream(stringstream(self._raw_data[#self._raw_data]))
    self.data[i + 1] = Vdi.Disk.Block.Sector(_io, self, self._root)
    i = i + 1
  end
end


Vdi.Disk.Block.Sector = class.class(KaitaiStruct)

function Vdi.Disk.Block.Sector:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Vdi.Disk.Block.Sector:_read()
  self.data = self._io:read_bytes(self._root.header.header_main.geometry.sector_size)
end


Vdi.Header = class.class(KaitaiStruct)

function Vdi.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Vdi.Header:_read()
  self.text = str_decode.decode(self._io:read_bytes(64), "UTF-8")
  self.signature = self._io:read_bytes(4)
  if not(self.signature == "\127\016\218\190") then
    error("not equal, expected " .. "\127\016\218\190" .. ", but got " .. self.signature)
  end
  self.version = Vdi.Header.Version(self._io, self, self._root)
  if self.subheader_size_is_dynamic then
    self.header_size_optional = self._io:read_u4le()
  end
  self._raw_header_main = self._io:read_bytes(self.header_size)
  local _io = KaitaiStream(stringstream(self._raw_header_main))
  self.header_main = Vdi.Header.HeaderMain(_io, self, self._root)
end

Vdi.Header.property.block_size = {}
function Vdi.Header.property.block_size:get()
  if self._m_block_size ~= nil then
    return self._m_block_size
  end

  self._m_block_size = self.header_main.block_metadata_size + self.header_main.block_data_size
  return self._m_block_size
end

Vdi.Header.property.blocks_map_offset = {}
function Vdi.Header.property.blocks_map_offset:get()
  if self._m_blocks_map_offset ~= nil then
    return self._m_blocks_map_offset
  end

  self._m_blocks_map_offset = self.header_main.blocks_map_offset
  return self._m_blocks_map_offset
end

Vdi.Header.property.blocks_map_size = {}
function Vdi.Header.property.blocks_map_size:get()
  if self._m_blocks_map_size ~= nil then
    return self._m_blocks_map_size
  end

  self._m_blocks_map_size = math.floor(((self.header_main.blocks_in_image * 4 + self.header_main.geometry.sector_size) - 1) / self.header_main.geometry.sector_size) * self.header_main.geometry.sector_size
  return self._m_blocks_map_size
end

Vdi.Header.property.blocks_offset = {}
function Vdi.Header.property.blocks_offset:get()
  if self._m_blocks_offset ~= nil then
    return self._m_blocks_offset
  end

  self._m_blocks_offset = self.header_main.offset_data
  return self._m_blocks_offset
end

Vdi.Header.property.header_size = {}
function Vdi.Header.property.header_size:get()
  if self._m_header_size ~= nil then
    return self._m_header_size
  end

  self._m_header_size = utils.box_unwrap((self.subheader_size_is_dynamic) and utils.box_wrap(self.header_size_optional) or (336))
  return self._m_header_size
end

Vdi.Header.property.subheader_size_is_dynamic = {}
function Vdi.Header.property.subheader_size_is_dynamic:get()
  if self._m_subheader_size_is_dynamic ~= nil then
    return self._m_subheader_size_is_dynamic
  end

  self._m_subheader_size_is_dynamic = self.version.major >= 1
  return self._m_subheader_size_is_dynamic
end


Vdi.Header.HeaderMain = class.class(KaitaiStruct)

function Vdi.Header.HeaderMain:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Vdi.Header.HeaderMain:_read()
  self.image_type = Vdi.ImageType(self._io:read_u4le())
  self.image_flags = Vdi.Header.HeaderMain.Flags(self._io, self, self._root)
  self.description = str_decode.decode(self._io:read_bytes(256), "UTF-8")
  if self._parent.version.major >= 1 then
    self.blocks_map_offset = self._io:read_u4le()
  end
  if self._parent.version.major >= 1 then
    self.offset_data = self._io:read_u4le()
  end
  self.geometry = Vdi.Header.HeaderMain.Geometry(self._io, self, self._root)
  if self._parent.version.major >= 1 then
    self.reserved1 = self._io:read_u4le()
  end
  self.disk_size = self._io:read_u8le()
  self.block_data_size = self._io:read_u4le()
  if self._parent.version.major >= 1 then
    self.block_metadata_size = self._io:read_u4le()
  end
  self.blocks_in_image = self._io:read_u4le()
  self.blocks_allocated = self._io:read_u4le()
  self.uuid_image = Vdi.Header.Uuid(self._io, self, self._root)
  self.uuid_last_snap = Vdi.Header.Uuid(self._io, self, self._root)
  self.uuid_link = Vdi.Header.Uuid(self._io, self, self._root)
  if self._parent.version.major >= 1 then
    self.uuid_parent = Vdi.Header.Uuid(self._io, self, self._root)
  end
  if  ((self._parent.version.major >= 1) and (self._io:pos() + 16 <= self._io:size()))  then
    self.lchc_geometry = Vdi.Header.HeaderMain.Geometry(self._io, self, self._root)
  end
end

-- 
-- Size of block (bytes).

Vdi.Header.HeaderMain.Flags = class.class(KaitaiStruct)

function Vdi.Header.HeaderMain.Flags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Vdi.Header.HeaderMain.Flags:_read()
  self.reserved0 = self._io:read_bits_int_be(15)
  self.zero_expand = self._io:read_bits_int_be(1) ~= 0
  self.reserved1 = self._io:read_bits_int_be(6)
  self.diff = self._io:read_bits_int_be(1) ~= 0
  self.fixed = self._io:read_bits_int_be(1) ~= 0
  self.reserved2 = self._io:read_bits_int_be(8)
end


Vdi.Header.HeaderMain.Geometry = class.class(KaitaiStruct)

function Vdi.Header.HeaderMain.Geometry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Vdi.Header.HeaderMain.Geometry:_read()
  self.cylinders = self._io:read_u4le()
  self.heads = self._io:read_u4le()
  self.sectors = self._io:read_u4le()
  self.sector_size = self._io:read_u4le()
end


Vdi.Header.Uuid = class.class(KaitaiStruct)

function Vdi.Header.Uuid:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Vdi.Header.Uuid:_read()
  self.uuid = self._io:read_bytes(16)
end


Vdi.Header.Version = class.class(KaitaiStruct)

function Vdi.Header.Version:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Vdi.Header.Version:_read()
  self.major = self._io:read_u2le()
  self.minor = self._io:read_u2le()
end



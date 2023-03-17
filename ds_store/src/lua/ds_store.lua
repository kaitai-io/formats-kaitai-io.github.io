-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- Apple macOS '.DS_Store' file format.
-- See also: Source (https://en.wikipedia.org/wiki/.DS_Store)
-- See also: Source (https://metacpan.org/dist/Mac-Finder-DSStore/view/DSStoreFormat.pod)
-- See also: Source (https://0day.work/parsing-the-ds_store-file-format/)
DsStore = class.class(KaitaiStruct)

function DsStore:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DsStore:_read()
  self.alignment_header = self._io:read_bytes(4)
  if not(self.alignment_header == "\000\000\000\001") then
    error("not equal, expected " ..  "\000\000\000\001" .. ", but got " .. self.alignment_header)
  end
  self.buddy_allocator_header = DsStore.BuddyAllocatorHeader(self._io, self, self._root)
end

DsStore.property.buddy_allocator_body = {}
function DsStore.property.buddy_allocator_body:get()
  if self._m_buddy_allocator_body ~= nil then
    return self._m_buddy_allocator_body
  end

  local _pos = self._io:pos()
  self._io:seek((self.buddy_allocator_header.ofs_bookkeeping_info_block + 4))
  self._raw__m_buddy_allocator_body = self._io:read_bytes(self.buddy_allocator_header.len_bookkeeping_info_block)
  local _io = KaitaiStream(stringstream(self._raw__m_buddy_allocator_body))
  self._m_buddy_allocator_body = DsStore.BuddyAllocatorBody(_io, self, self._root)
  self._io:seek(_pos)
  return self._m_buddy_allocator_body
end

-- 
-- Bitmask used to calculate the position and the size of each block
-- of the B-tree from the block addresses.
DsStore.property.block_address_mask = {}
function DsStore.property.block_address_mask:get()
  if self._m_block_address_mask ~= nil then
    return self._m_block_address_mask
  end

  self._m_block_address_mask = 31
  return self._m_block_address_mask
end


DsStore.BuddyAllocatorHeader = class.class(KaitaiStruct)

function DsStore.BuddyAllocatorHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DsStore.BuddyAllocatorHeader:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\066\117\100\049") then
    error("not equal, expected " ..  "\066\117\100\049" .. ", but got " .. self.magic)
  end
  self.ofs_bookkeeping_info_block = self._io:read_u4be()
  self.len_bookkeeping_info_block = self._io:read_u4be()
  self.copy_ofs_bookkeeping_info_block = self._io:read_u4be()
  self._unnamed4 = self._io:read_bytes(16)
end

-- 
-- Magic number 'Bud1'.
-- 
-- Needs to match 'offset_bookkeeping_info_block'.
-- 
-- Unused field which might simply be the unused space at the end of the block,
-- since the minimum allocation size is 32 bytes.

DsStore.BuddyAllocatorBody = class.class(KaitaiStruct)

function DsStore.BuddyAllocatorBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DsStore.BuddyAllocatorBody:_read()
  self.num_blocks = self._io:read_u4be()
  self._unnamed1 = self._io:read_bytes(4)
  self.block_addresses = {}
  for i = 0, self.num_block_addresses - 1 do
    self.block_addresses[i + 1] = DsStore.BuddyAllocatorBody.BlockDescriptor(self._io, self, self._root)
  end
  self.num_directories = self._io:read_u4be()
  self.directory_entries = {}
  for i = 0, self.num_directories - 1 do
    self.directory_entries[i + 1] = DsStore.BuddyAllocatorBody.DirectoryEntry(self._io, self, self._root)
  end
  self.free_lists = {}
  for i = 0, self.num_free_lists - 1 do
    self.free_lists[i + 1] = DsStore.BuddyAllocatorBody.FreeList(self._io, self, self._root)
  end
end

DsStore.BuddyAllocatorBody.property.num_block_addresses = {}
function DsStore.BuddyAllocatorBody.property.num_block_addresses:get()
  if self._m_num_block_addresses ~= nil then
    return self._m_num_block_addresses
  end

  self._m_num_block_addresses = 256
  return self._m_num_block_addresses
end

DsStore.BuddyAllocatorBody.property.num_free_lists = {}
function DsStore.BuddyAllocatorBody.property.num_free_lists:get()
  if self._m_num_free_lists ~= nil then
    return self._m_num_free_lists
  end

  self._m_num_free_lists = 32
  return self._m_num_free_lists
end

-- 
-- Master blocks of the different B-trees.
DsStore.BuddyAllocatorBody.property.directories = {}
function DsStore.BuddyAllocatorBody.property.directories:get()
  if self._m_directories ~= nil then
    return self._m_directories
  end

  local _io = self._root._io
  self._m_directories = {}
  for i = 0, self.num_directories - 1 do
    self._m_directories[i + 1] = DsStore.MasterBlockRef(i, _io, self, self._root)
  end
  return self._m_directories
end

-- 
-- Number of blocks in the allocated-blocks list.
-- 
-- Unknown field which appears to always be 0.
-- 
-- Addresses of the different blocks.
-- 
-- Indicates the number of directory entries.
-- 
-- Each directory is an independent B-tree.

DsStore.BuddyAllocatorBody.BlockDescriptor = class.class(KaitaiStruct)

function DsStore.BuddyAllocatorBody.BlockDescriptor:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DsStore.BuddyAllocatorBody.BlockDescriptor:_read()
  self.address_raw = self._io:read_u4be()
end

DsStore.BuddyAllocatorBody.BlockDescriptor.property.offset = {}
function DsStore.BuddyAllocatorBody.BlockDescriptor.property.offset:get()
  if self._m_offset ~= nil then
    return self._m_offset
  end

  self._m_offset = ((self.address_raw & ~(self._root.block_address_mask)) + 4)
  return self._m_offset
end

DsStore.BuddyAllocatorBody.BlockDescriptor.property.size = {}
function DsStore.BuddyAllocatorBody.BlockDescriptor.property.size:get()
  if self._m_size ~= nil then
    return self._m_size
  end

  self._m_size = (1 << (self.address_raw & self._root.block_address_mask))
  return self._m_size
end


DsStore.BuddyAllocatorBody.DirectoryEntry = class.class(KaitaiStruct)

function DsStore.BuddyAllocatorBody.DirectoryEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DsStore.BuddyAllocatorBody.DirectoryEntry:_read()
  self.len_name = self._io:read_u1()
  self.name = str_decode.decode(self._io:read_bytes(self.len_name), "UTF-8")
  self.block_id = self._io:read_u4be()
end


DsStore.BuddyAllocatorBody.FreeList = class.class(KaitaiStruct)

function DsStore.BuddyAllocatorBody.FreeList:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DsStore.BuddyAllocatorBody.FreeList:_read()
  self.counter = self._io:read_u4be()
  self.offsets = {}
  for i = 0, self.counter - 1 do
    self.offsets[i + 1] = self._io:read_u4be()
  end
end


DsStore.MasterBlockRef = class.class(KaitaiStruct)

function DsStore.MasterBlockRef:_init(idx, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.idx = idx
  self:_read()
end

function DsStore.MasterBlockRef:_read()
end

DsStore.MasterBlockRef.property.master_block = {}
function DsStore.MasterBlockRef.property.master_block:get()
  if self._m_master_block ~= nil then
    return self._m_master_block
  end

  local _pos = self._io:pos()
  self._io:seek(self._parent.block_addresses[self._parent.directory_entries[self.idx + 1].block_id + 1].offset)
  self._raw__m_master_block = self._io:read_bytes(self._parent.block_addresses[self._parent.directory_entries[self.idx + 1].block_id + 1].size)
  local _io = KaitaiStream(stringstream(self._raw__m_master_block))
  self._m_master_block = DsStore.MasterBlockRef.MasterBlock(_io, self, self._root)
  self._io:seek(_pos)
  return self._m_master_block
end


DsStore.MasterBlockRef.MasterBlock = class.class(KaitaiStruct)

function DsStore.MasterBlockRef.MasterBlock:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DsStore.MasterBlockRef.MasterBlock:_read()
  self.block_id = self._io:read_u4be()
  self.num_internal_nodes = self._io:read_u4be()
  self.num_records = self._io:read_u4be()
  self.num_nodes = self._io:read_u4be()
  self._unnamed4 = self._io:read_u4be()
end

DsStore.MasterBlockRef.MasterBlock.property.root_block = {}
function DsStore.MasterBlockRef.MasterBlock.property.root_block:get()
  if self._m_root_block ~= nil then
    return self._m_root_block
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self._root.buddy_allocator_body.block_addresses[self.block_id + 1].offset)
  self._m_root_block = DsStore.Block(_io, self, self._root)
  _io:seek(_pos)
  return self._m_root_block
end

-- 
-- Block number of the B-tree's root node.
-- 
-- Number of internal node levels.
-- 
-- Number of records in the tree.
-- 
-- Number of nodes in the tree.
-- 
-- Always 0x1000, probably the B-tree node page size.

DsStore.Block = class.class(KaitaiStruct)

function DsStore.Block:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DsStore.Block:_read()
  self.mode = self._io:read_u4be()
  self.counter = self._io:read_u4be()
  self.data = {}
  for i = 0, self.counter - 1 do
    self.data[i + 1] = DsStore.Block.BlockData(self.mode, self._io, self, self._root)
  end
end

-- 
-- Rightmost child block pointer.
DsStore.Block.property.rightmost_block = {}
function DsStore.Block.property.rightmost_block:get()
  if self._m_rightmost_block ~= nil then
    return self._m_rightmost_block
  end

  if self.mode > 0 then
    local _io = self._root._io
    local _pos = _io:pos()
    _io:seek(self._root.buddy_allocator_body.block_addresses[self.mode + 1].offset)
    self._m_rightmost_block = DsStore.Block(_io, self, self._root)
    _io:seek(_pos)
  end
  return self._m_rightmost_block
end

-- 
-- If mode is 0, this is a leaf node, otherwise it is an internal node.
-- 
-- Number of records or number of block id + record pairs.

DsStore.Block.BlockData = class.class(KaitaiStruct)

function DsStore.Block.BlockData:_init(mode, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.mode = mode
  self:_read()
end

function DsStore.Block.BlockData:_read()
  if self.mode > 0 then
    self.block_id = self._io:read_u4be()
  end
  self.record = DsStore.Block.BlockData.Record(self._io, self, self._root)
end

DsStore.Block.BlockData.property.block = {}
function DsStore.Block.BlockData.property.block:get()
  if self._m_block ~= nil then
    return self._m_block
  end

  if self.mode > 0 then
    local _io = self._root._io
    local _pos = _io:pos()
    _io:seek(self._root.buddy_allocator_body.block_addresses[self.block_id + 1].offset)
    self._m_block = DsStore.Block(_io, self, self._root)
    _io:seek(_pos)
  end
  return self._m_block
end


DsStore.Block.BlockData.Record = class.class(KaitaiStruct)

function DsStore.Block.BlockData.Record:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DsStore.Block.BlockData.Record:_read()
  self.filename = DsStore.Block.BlockData.Record.Ustr(self._io, self, self._root)
  self.structure_type = DsStore.Block.BlockData.Record.FourCharCode(self._io, self, self._root)
  self.data_type = str_decode.decode(self._io:read_bytes(4), "UTF-8")
  local _on = self.data_type
  if _on == "long" then
    self.value = self._io:read_u4be()
  elseif _on == "shor" then
    self.value = self._io:read_u4be()
  elseif _on == "comp" then
    self.value = self._io:read_u8be()
  elseif _on == "bool" then
    self.value = self._io:read_u1()
  elseif _on == "ustr" then
    self.value = DsStore.Block.BlockData.Record.Ustr(self._io, self, self._root)
  elseif _on == "dutc" then
    self.value = self._io:read_u8be()
  elseif _on == "type" then
    self.value = DsStore.Block.BlockData.Record.FourCharCode(self._io, self, self._root)
  elseif _on == "blob" then
    self.value = DsStore.Block.BlockData.Record.RecordBlob(self._io, self, self._root)
  end
end

-- 
-- Description of the entry's property.
-- 
-- Data type of the value.

DsStore.Block.BlockData.Record.RecordBlob = class.class(KaitaiStruct)

function DsStore.Block.BlockData.Record.RecordBlob:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DsStore.Block.BlockData.Record.RecordBlob:_read()
  self.length = self._io:read_u4be()
  self.value = self._io:read_bytes(self.length)
end


DsStore.Block.BlockData.Record.Ustr = class.class(KaitaiStruct)

function DsStore.Block.BlockData.Record.Ustr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DsStore.Block.BlockData.Record.Ustr:_read()
  self.length = self._io:read_u4be()
  self.value = str_decode.decode(self._io:read_bytes((2 * self.length)), "UTF-16BE")
end


DsStore.Block.BlockData.Record.FourCharCode = class.class(KaitaiStruct)

function DsStore.Block.BlockData.Record.FourCharCode:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DsStore.Block.BlockData.Record.FourCharCode:_read()
  self.value = str_decode.decode(self._io:read_bytes(4), "UTF-8")
end



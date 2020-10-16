-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local str_decode = require("string_decode")
local stringstream = require("string_stream")

Ext2 = class.class(KaitaiStruct)

function Ext2:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ext2:_read()
end

Ext2.property.bg1 = {}
function Ext2.property.bg1:get()
  if self._m_bg1 ~= nil then
    return self._m_bg1
  end

  local _pos = self._io:pos()
  self._io:seek(1024)
  self._m_bg1 = Ext2.BlockGroup(self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_bg1
end

Ext2.property.root_dir = {}
function Ext2.property.root_dir:get()
  if self._m_root_dir ~= nil then
    return self._m_root_dir
  end

  self._m_root_dir = self.bg1.block_groups[0 + 1].inodes[1 + 1].as_dir
  return self._m_root_dir
end


Ext2.SuperBlockStruct = class.class(KaitaiStruct)

Ext2.SuperBlockStruct.StateEnum = enum.Enum {
  valid_fs = 1,
  error_fs = 2,
}

Ext2.SuperBlockStruct.ErrorsEnum = enum.Enum {
  act_continue = 1,
  act_ro = 2,
  act_panic = 3,
}

function Ext2.SuperBlockStruct:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ext2.SuperBlockStruct:_read()
  self.inodes_count = self._io:read_u4le()
  self.blocks_count = self._io:read_u4le()
  self.r_blocks_count = self._io:read_u4le()
  self.free_blocks_count = self._io:read_u4le()
  self.free_inodes_count = self._io:read_u4le()
  self.first_data_block = self._io:read_u4le()
  self.log_block_size = self._io:read_u4le()
  self.log_frag_size = self._io:read_u4le()
  self.blocks_per_group = self._io:read_u4le()
  self.frags_per_group = self._io:read_u4le()
  self.inodes_per_group = self._io:read_u4le()
  self.mtime = self._io:read_u4le()
  self.wtime = self._io:read_u4le()
  self.mnt_count = self._io:read_u2le()
  self.max_mnt_count = self._io:read_u2le()
  self.magic = self._io:read_bytes(2)
  if not(self.magic == "\083\239") then
    error("not equal, expected " ..  "\083\239" .. ", but got " .. self.magic)
  end
  self.state = Ext2.SuperBlockStruct.StateEnum(self._io:read_u2le())
  self.errors = Ext2.SuperBlockStruct.ErrorsEnum(self._io:read_u2le())
  self.minor_rev_level = self._io:read_u2le()
  self.lastcheck = self._io:read_u4le()
  self.checkinterval = self._io:read_u4le()
  self.creator_os = self._io:read_u4le()
  self.rev_level = self._io:read_u4le()
  self.def_resuid = self._io:read_u2le()
  self.def_resgid = self._io:read_u2le()
  self.first_ino = self._io:read_u4le()
  self.inode_size = self._io:read_u2le()
  self.block_group_nr = self._io:read_u2le()
  self.feature_compat = self._io:read_u4le()
  self.feature_incompat = self._io:read_u4le()
  self.feature_ro_compat = self._io:read_u4le()
  self.uuid = self._io:read_bytes(16)
  self.volume_name = self._io:read_bytes(16)
  self.last_mounted = self._io:read_bytes(64)
  self.algo_bitmap = self._io:read_u4le()
  self.prealloc_blocks = self._io:read_u1()
  self.prealloc_dir_blocks = self._io:read_u1()
  self.padding1 = self._io:read_bytes(2)
  self.journal_uuid = self._io:read_bytes(16)
  self.journal_inum = self._io:read_u4le()
  self.journal_dev = self._io:read_u4le()
  self.last_orphan = self._io:read_u4le()
  self.hash_seed = {}
  for i = 0, 4 - 1 do
    self.hash_seed[i + 1] = self._io:read_u4le()
  end
  self.def_hash_version = self._io:read_u1()
end

Ext2.SuperBlockStruct.property.block_size = {}
function Ext2.SuperBlockStruct.property.block_size:get()
  if self._m_block_size ~= nil then
    return self._m_block_size
  end

  self._m_block_size = (1024 << self.log_block_size)
  return self._m_block_size
end

Ext2.SuperBlockStruct.property.block_group_count = {}
function Ext2.SuperBlockStruct.property.block_group_count:get()
  if self._m_block_group_count ~= nil then
    return self._m_block_group_count
  end

  self._m_block_group_count = math.floor(self.blocks_count / self.blocks_per_group)
  return self._m_block_group_count
end


Ext2.DirEntry = class.class(KaitaiStruct)

Ext2.DirEntry.FileTypeEnum = enum.Enum {
  unknown = 0,
  reg_file = 1,
  dir = 2,
  chrdev = 3,
  blkdev = 4,
  fifo = 5,
  sock = 6,
  symlink = 7,
}

function Ext2.DirEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ext2.DirEntry:_read()
  self.inode_ptr = self._io:read_u4le()
  self.rec_len = self._io:read_u2le()
  self.name_len = self._io:read_u1()
  self.file_type = Ext2.DirEntry.FileTypeEnum(self._io:read_u1())
  self.name = str_decode.decode(self._io:read_bytes(self.name_len), "UTF-8")
  self.padding = self._io:read_bytes(((self.rec_len - self.name_len) - 8))
end

Ext2.DirEntry.property.inode = {}
function Ext2.DirEntry.property.inode:get()
  if self._m_inode ~= nil then
    return self._m_inode
  end

  self._m_inode = self._root.bg1.block_groups[math.floor((self.inode_ptr - 1) / self._root.bg1.super_block.inodes_per_group) + 1].inodes[((self.inode_ptr - 1) % self._root.bg1.super_block.inodes_per_group) + 1]
  return self._m_inode
end


Ext2.Inode = class.class(KaitaiStruct)

function Ext2.Inode:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ext2.Inode:_read()
  self.mode = self._io:read_u2le()
  self.uid = self._io:read_u2le()
  self.size = self._io:read_u4le()
  self.atime = self._io:read_u4le()
  self.ctime = self._io:read_u4le()
  self.mtime = self._io:read_u4le()
  self.dtime = self._io:read_u4le()
  self.gid = self._io:read_u2le()
  self.links_count = self._io:read_u2le()
  self.blocks = self._io:read_u4le()
  self.flags = self._io:read_u4le()
  self.osd1 = self._io:read_u4le()
  self.block = {}
  for i = 0, 15 - 1 do
    self.block[i + 1] = Ext2.BlockPtr(self._io, self, self._root)
  end
  self.generation = self._io:read_u4le()
  self.file_acl = self._io:read_u4le()
  self.dir_acl = self._io:read_u4le()
  self.faddr = self._io:read_u4le()
  self.osd2 = self._io:read_bytes(12)
end

Ext2.Inode.property.as_dir = {}
function Ext2.Inode.property.as_dir:get()
  if self._m_as_dir ~= nil then
    return self._m_as_dir
  end

  local _io = self.block[0 + 1].body._io
  local _pos = _io:pos()
  _io:seek(0)
  self._m_as_dir = Ext2.Dir(_io, self, self._root)
  _io:seek(_pos)
  return self._m_as_dir
end


Ext2.BlockPtr = class.class(KaitaiStruct)

function Ext2.BlockPtr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ext2.BlockPtr:_read()
  self.ptr = self._io:read_u4le()
end

Ext2.BlockPtr.property.body = {}
function Ext2.BlockPtr.property.body:get()
  if self._m_body ~= nil then
    return self._m_body
  end

  local _pos = self._io:pos()
  self._io:seek((self.ptr * self._root.bg1.super_block.block_size))
  self._raw__m_body = self._io:read_bytes(self._root.bg1.super_block.block_size)
  local _io = KaitaiStream(stringstream(self._raw__m_body))
  self._m_body = Ext2.RawBlock(_io, self, self._root)
  self._io:seek(_pos)
  return self._m_body
end


Ext2.Dir = class.class(KaitaiStruct)

function Ext2.Dir:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ext2.Dir:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = Ext2.DirEntry(self._io, self, self._root)
    i = i + 1
  end
end


Ext2.BlockGroup = class.class(KaitaiStruct)

function Ext2.BlockGroup:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ext2.BlockGroup:_read()
  self._raw_super_block = self._io:read_bytes(1024)
  local _io = KaitaiStream(stringstream(self._raw_super_block))
  self.super_block = Ext2.SuperBlockStruct(_io, self, self._root)
  self.block_groups = {}
  for i = 0, self.super_block.block_group_count - 1 do
    self.block_groups[i + 1] = Ext2.Bgd(self._io, self, self._root)
  end
end


Ext2.Bgd = class.class(KaitaiStruct)

function Ext2.Bgd:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ext2.Bgd:_read()
  self.block_bitmap_block = self._io:read_u4le()
  self.inode_bitmap_block = self._io:read_u4le()
  self.inode_table_block = self._io:read_u4le()
  self.free_blocks_count = self._io:read_u2le()
  self.free_inodes_count = self._io:read_u2le()
  self.used_dirs_count = self._io:read_u2le()
  self.pad_reserved = self._io:read_bytes((2 + 12))
end

Ext2.Bgd.property.block_bitmap = {}
function Ext2.Bgd.property.block_bitmap:get()
  if self._m_block_bitmap ~= nil then
    return self._m_block_bitmap
  end

  local _pos = self._io:pos()
  self._io:seek((self.block_bitmap_block * self._root.bg1.super_block.block_size))
  self._m_block_bitmap = self._io:read_bytes(1024)
  self._io:seek(_pos)
  return self._m_block_bitmap
end

Ext2.Bgd.property.inode_bitmap = {}
function Ext2.Bgd.property.inode_bitmap:get()
  if self._m_inode_bitmap ~= nil then
    return self._m_inode_bitmap
  end

  local _pos = self._io:pos()
  self._io:seek((self.inode_bitmap_block * self._root.bg1.super_block.block_size))
  self._m_inode_bitmap = self._io:read_bytes(1024)
  self._io:seek(_pos)
  return self._m_inode_bitmap
end

Ext2.Bgd.property.inodes = {}
function Ext2.Bgd.property.inodes:get()
  if self._m_inodes ~= nil then
    return self._m_inodes
  end

  local _pos = self._io:pos()
  self._io:seek((self.inode_table_block * self._root.bg1.super_block.block_size))
  self._m_inodes = {}
  for i = 0, self._root.bg1.super_block.inodes_per_group - 1 do
    self._m_inodes[i + 1] = Ext2.Inode(self._io, self, self._root)
  end
  self._io:seek(_pos)
  return self._m_inodes
end


Ext2.RawBlock = class.class(KaitaiStruct)

function Ext2.RawBlock:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ext2.RawBlock:_read()
  self.body = self._io:read_bytes(self._root.bg1.super_block.block_size)
end



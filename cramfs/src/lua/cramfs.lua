-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local str_decode = require("string_decode")
local stringstream = require("string_stream")

Cramfs = class.class(KaitaiStruct)

function Cramfs:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Cramfs:_read()
  self.super_block = Cramfs.SuperBlockStruct(self._io, self, self._root)
end

Cramfs.property.page_size = {}
function Cramfs.property.page_size:get()
  if self._m_page_size ~= nil then
    return self._m_page_size
  end

  self._m_page_size = 4096
  return self._m_page_size
end


Cramfs.ChunkedDataInode = class.class(KaitaiStruct)

function Cramfs.ChunkedDataInode:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Cramfs.ChunkedDataInode:_read()
  self.block_end_index = {}
  for i = 0, math.floor(((self._parent.size + self._root.page_size) - 1) / self._root.page_size) - 1 do
    self.block_end_index[i + 1] = self._io:read_u4le()
  end
  self.raw_blocks = self._io:read_bytes_full()
end


Cramfs.DirInode = class.class(KaitaiStruct)

function Cramfs.DirInode:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Cramfs.DirInode:_read()
  if self._io:size() > 0 then
    self.children = {}
    local i = 0
    while not self._io:is_eof() do
      self.children[i + 1] = Cramfs.Inode(self._io, self, self._root)
      i = i + 1
    end
  end
end


Cramfs.Info = class.class(KaitaiStruct)

function Cramfs.Info:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Cramfs.Info:_read()
  self.crc = self._io:read_u4le()
  self.edition = self._io:read_u4le()
  self.blocks = self._io:read_u4le()
  self.files = self._io:read_u4le()
end


Cramfs.Inode = class.class(KaitaiStruct)

Cramfs.Inode.FileType = enum.Enum {
  fifo = 1,
  chrdev = 2,
  dir = 4,
  blkdev = 6,
  reg_file = 8,
  symlink = 10,
  socket = 12,
}

function Cramfs.Inode:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Cramfs.Inode:_read()
  self.mode = self._io:read_u2le()
  self.uid = self._io:read_u2le()
  self.size_gid = self._io:read_u4le()
  self.namelen_offset = self._io:read_u4le()
  self.name = str_decode.decode(self._io:read_bytes(self.namelen), "UTF-8")
end

Cramfs.Inode.property.as_dir = {}
function Cramfs.Inode.property.as_dir:get()
  if self._m_as_dir ~= nil then
    return self._m_as_dir
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.offset)
  self._raw__m_as_dir = _io:read_bytes(self.size)
  local _io = KaitaiStream(stringstream(self._raw__m_as_dir))
  self._m_as_dir = Cramfs.DirInode(_io, self, self._root)
  _io:seek(_pos)
  return self._m_as_dir
end

Cramfs.Inode.property.as_reg_file = {}
function Cramfs.Inode.property.as_reg_file:get()
  if self._m_as_reg_file ~= nil then
    return self._m_as_reg_file
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.offset)
  self._m_as_reg_file = Cramfs.ChunkedDataInode(_io, self, self._root)
  _io:seek(_pos)
  return self._m_as_reg_file
end

Cramfs.Inode.property.as_symlink = {}
function Cramfs.Inode.property.as_symlink:get()
  if self._m_as_symlink ~= nil then
    return self._m_as_symlink
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.offset)
  self._m_as_symlink = Cramfs.ChunkedDataInode(_io, self, self._root)
  _io:seek(_pos)
  return self._m_as_symlink
end

Cramfs.Inode.property.attr = {}
function Cramfs.Inode.property.attr:get()
  if self._m_attr ~= nil then
    return self._m_attr
  end

  self._m_attr = self.mode >> 9 & 7
  return self._m_attr
end

Cramfs.Inode.property.gid = {}
function Cramfs.Inode.property.gid:get()
  if self._m_gid ~= nil then
    return self._m_gid
  end

  self._m_gid = self.size_gid >> 24
  return self._m_gid
end

Cramfs.Inode.property.namelen = {}
function Cramfs.Inode.property.namelen:get()
  if self._m_namelen ~= nil then
    return self._m_namelen
  end

  self._m_namelen = (self.namelen_offset & 63) << 2
  return self._m_namelen
end

Cramfs.Inode.property.offset = {}
function Cramfs.Inode.property.offset:get()
  if self._m_offset ~= nil then
    return self._m_offset
  end

  self._m_offset = (self.namelen_offset >> 6 & 67108863) << 2
  return self._m_offset
end

Cramfs.Inode.property.perm_g = {}
function Cramfs.Inode.property.perm_g:get()
  if self._m_perm_g ~= nil then
    return self._m_perm_g
  end

  self._m_perm_g = self.mode >> 3 & 7
  return self._m_perm_g
end

Cramfs.Inode.property.perm_o = {}
function Cramfs.Inode.property.perm_o:get()
  if self._m_perm_o ~= nil then
    return self._m_perm_o
  end

  self._m_perm_o = self.mode & 7
  return self._m_perm_o
end

Cramfs.Inode.property.perm_u = {}
function Cramfs.Inode.property.perm_u:get()
  if self._m_perm_u ~= nil then
    return self._m_perm_u
  end

  self._m_perm_u = self.mode >> 6 & 7
  return self._m_perm_u
end

Cramfs.Inode.property.size = {}
function Cramfs.Inode.property.size:get()
  if self._m_size ~= nil then
    return self._m_size
  end

  self._m_size = self.size_gid & 16777215
  return self._m_size
end

Cramfs.Inode.property.type = {}
function Cramfs.Inode.property.type:get()
  if self._m_type ~= nil then
    return self._m_type
  end

  self._m_type = Cramfs.Inode.FileType(self.mode >> 12 & 15)
  return self._m_type
end


Cramfs.SuperBlockStruct = class.class(KaitaiStruct)

function Cramfs.SuperBlockStruct:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Cramfs.SuperBlockStruct:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\069\061\205\040") then
    error("not equal, expected " .. "\069\061\205\040" .. ", but got " .. self.magic)
  end
  self.size = self._io:read_u4le()
  self.flags = self._io:read_u4le()
  self.future = self._io:read_u4le()
  self.signature = self._io:read_bytes(16)
  if not(self.signature == "\067\111\109\112\114\101\115\115\101\100\032\082\079\077\070\083") then
    error("not equal, expected " .. "\067\111\109\112\114\101\115\115\101\100\032\082\079\077\070\083" .. ", but got " .. self.signature)
  end
  self.fsid = Cramfs.Info(self._io, self, self._root)
  self.name = str_decode.decode(self._io:read_bytes(16), "ASCII")
  self.root = Cramfs.Inode(self._io, self, self._root)
end

Cramfs.SuperBlockStruct.property.flag_fsid_v2 = {}
function Cramfs.SuperBlockStruct.property.flag_fsid_v2:get()
  if self._m_flag_fsid_v2 ~= nil then
    return self._m_flag_fsid_v2
  end

  self._m_flag_fsid_v2 = self.flags >> 0 & 1
  return self._m_flag_fsid_v2
end

Cramfs.SuperBlockStruct.property.flag_holes = {}
function Cramfs.SuperBlockStruct.property.flag_holes:get()
  if self._m_flag_holes ~= nil then
    return self._m_flag_holes
  end

  self._m_flag_holes = self.flags >> 8 & 1
  return self._m_flag_holes
end

Cramfs.SuperBlockStruct.property.flag_shifted_root_offset = {}
function Cramfs.SuperBlockStruct.property.flag_shifted_root_offset:get()
  if self._m_flag_shifted_root_offset ~= nil then
    return self._m_flag_shifted_root_offset
  end

  self._m_flag_shifted_root_offset = self.flags >> 10 & 1
  return self._m_flag_shifted_root_offset
end

Cramfs.SuperBlockStruct.property.flag_sorted_dirs = {}
function Cramfs.SuperBlockStruct.property.flag_sorted_dirs:get()
  if self._m_flag_sorted_dirs ~= nil then
    return self._m_flag_sorted_dirs
  end

  self._m_flag_sorted_dirs = self.flags >> 1 & 1
  return self._m_flag_sorted_dirs
end

Cramfs.SuperBlockStruct.property.flag_wrong_signature = {}
function Cramfs.SuperBlockStruct.property.flag_wrong_signature:get()
  if self._m_flag_wrong_signature ~= nil then
    return self._m_flag_wrong_signature
  end

  self._m_flag_wrong_signature = self.flags >> 9 & 1
  return self._m_flag_wrong_signature
end



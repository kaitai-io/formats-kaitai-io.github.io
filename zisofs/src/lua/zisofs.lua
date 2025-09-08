-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local utils = require("utils")

-- 
-- zisofs is a compression format for files on ISO9660 file system. It has
-- limited support across operating systems, mainly Linux kernel. Typically a
-- directory tree is first preprocessed by mkzftree (from the zisofs-tools
-- package before being turned into an ISO9660 image by mkisofs, genisoimage
-- or similar tool. The data is zlib compressed.
-- 
-- The specification here describes the structure of a file that has been
-- preprocessed by mkzftree, not of a full ISO9660 ziso. Data is not
-- decompressed, as blocks with length 0 have a special meaning. Decompression
-- and deconstruction of this data should be done outside of Kaitai Struct.
-- See also: Source (https://web.archive.org/web/20200612093441/https://dev.lovelyhq.com/libburnia/web/-/wikis/zisofs)
Zisofs = class.class(KaitaiStruct)

function Zisofs:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Zisofs:_read()
  self._raw_header = self._io:read_bytes(16)
  local _io = KaitaiStream(stringstream(self._raw_header))
  self.header = Zisofs.Header(_io, self, self._root)
  self.block_pointers = {}
  for i = 0, self.header.num_blocks + 1 - 1 do
    self.block_pointers[i + 1] = self._io:read_u4le()
  end
end

Zisofs.property.blocks = {}
function Zisofs.property.blocks:get()
  if self._m_blocks ~= nil then
    return self._m_blocks
  end

  self._m_blocks = {}
  for i = 0, self.header.num_blocks - 1 do
    self._m_blocks[i + 1] = Zisofs.Block(self.block_pointers[i + 1], self.block_pointers[(i + 1) + 1], self._io, self, self._root)
  end
  return self._m_blocks
end

-- 
-- The final pointer (`block_pointers[header.num_blocks]`) indicates the end
-- of the last block. Typically this is also the end of the file data.

Zisofs.Block = class.class(KaitaiStruct)

function Zisofs.Block:_init(ofs_start, ofs_end, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self.ofs_start = ofs_start
  self.ofs_end = ofs_end
  self:_read()
end

function Zisofs.Block:_read()
end

Zisofs.Block.property.data = {}
function Zisofs.Block.property.data:get()
  if self._m_data ~= nil then
    return self._m_data
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.ofs_start)
  self._m_data = _io:read_bytes(self.len_data)
  _io:seek(_pos)
  return self._m_data
end

Zisofs.Block.property.len_data = {}
function Zisofs.Block.property.len_data:get()
  if self._m_len_data ~= nil then
    return self._m_len_data
  end

  self._m_len_data = self.ofs_end - self.ofs_start
  return self._m_len_data
end


Zisofs.Header = class.class(KaitaiStruct)

function Zisofs.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Zisofs.Header:_read()
  self.magic = self._io:read_bytes(8)
  if not(self.magic == "\055\228\083\150\201\219\214\007") then
    error("not equal, expected " .. "\055\228\083\150\201\219\214\007" .. ", but got " .. self.magic)
  end
  self.uncompressed_size = self._io:read_u4le()
  self.len_header = self._io:read_u1()
  if not(self.len_header == 4) then
    error("not equal, expected " .. 4 .. ", but got " .. self.len_header)
  end
  self.block_size_log2 = self._io:read_u1()
  if not( ((self.block_size_log2 == 15) or (self.block_size_log2 == 16) or (self.block_size_log2 == 17)) ) then
    error("ValidationNotAnyOfError")
  end
  self.reserved = self._io:read_bytes(2)
  if not(self.reserved == "\000\000") then
    error("not equal, expected " .. "\000\000" .. ", but got " .. self.reserved)
  end
end

Zisofs.Header.property.block_size = {}
function Zisofs.Header.property.block_size:get()
  if self._m_block_size ~= nil then
    return self._m_block_size
  end

  self._m_block_size = 1 << self.block_size_log2
  return self._m_block_size
end

-- 
-- ceil(uncompressed_size / block_size).
Zisofs.Header.property.num_blocks = {}
function Zisofs.Header.property.num_blocks:get()
  if self._m_num_blocks ~= nil then
    return self._m_num_blocks
  end

  self._m_num_blocks = math.floor(self.uncompressed_size / self.block_size) + utils.box_unwrap((self.uncompressed_size % self.block_size ~= 0) and utils.box_wrap(1) or (0))
  return self._m_num_blocks
end

-- 
-- Size of the original uncompressed file.
-- 
-- header_size >> 2 (currently 4).


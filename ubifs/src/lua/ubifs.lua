-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local utils = require("utils")

-- 
-- UBIFS is a file system for raw flash memory devices. It works on top of
-- UBI (Unsorted Block Images), which works as an abstraction layer so UBIFS
-- does not need to care about low level details. This specification only covers
-- UBIFS, not UBI.
-- 
-- A UBIFS image is divided into several Logical Erase Blocks (LEB). The first
-- LEB (LEB0) contains the superblock node, which includes information about LEB
-- size, amongst others. The next two LEBs (LEB1 and LEB2) comprise the so called
-- "master area" and both contain a copy of the master node, which includes
-- information about where to find the root index node, which is then used to
-- access all the files on the file system.
-- 
-- **Limitations of this Kaitai Struct implementation:**
-- 
-- 1. It only supports UBIFS images created by `mkfs.ubifs` (such as those in
--    firmware images built by OpenWrt), not file systems modified after
--    creation, e.g. by writing files to them on a running Linux system. The
--    Linux kernel appends a new copy of the master node to LEB1 and LEB2
--    whenever it mounts the file system read-write, unmounts it, or commits
--    changes (updates the index on flash to include them). When mounting, Linux
--    uses the
--    [last copy](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L84-L165),
--    whereas this implementation reads the first one (`master_1`), which still
--    describes the file system as it was created. Changes made since then are
--    therefore not visible via `index_root`.
-- 2. Changes that have not been committed yet are not in the index at all, so
--    they are not visible via `index_root` either. Until they are committed,
--    UBIFS keeps them only in the journal. This only matters for file systems
--    that were not unmounted cleanly, because unmounting
--    [commits](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/super.c#L486-L493)
--    all changes.
-- 3. Parsing doesn't advance the stream position. This implementation reads
--    the image only through instances, so that parsing doesn't copy the
--    whole image into memory. To find where the image ends, e.g. when
--    carving it out of a larger file, use `len_image`. For the same reason,
--    parsing doesn't fail if the image is truncated. To detect that, check
--    that the stream is at least `len_image` bytes long
--    (`_io.size >= len_image`).
-- See also: Git tag "v7.2" (https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h)
-- See also: Git tag "v7.2" (https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h)
-- See also: Source (http://www.linux-mtd.infradead.org/doc/ubifs.pdf)
Ubifs = class.class(KaitaiStruct)

Ubifs.Compression = enum.Enum {
  no_compression = 0,
  lzo = 1,
  zlib = 2,
  zstd = 3,
}

Ubifs.HashAlgos = enum.Enum {
  md4 = 0,
  md5 = 1,
  sha1 = 2,
  ripe_md_160 = 3,
  sha256 = 4,
  sha384 = 5,
  sha512 = 6,
  sha224 = 7,
  ripe_md_128 = 8,
  ripe_md_256 = 9,
  ripe_md_320 = 10,
  wp_256 = 11,
  wp_384 = 12,
  wp_512 = 13,
  tgr_128 = 14,
  tgr_160 = 15,
  tgr_192 = 16,
  sm3_256 = 17,
  streebog_256 = 18,
  streebog_512 = 19,
  sha3_256 = 20,
  sha3_384 = 21,
  sha3_512 = 22,
}

Ubifs.Hashes = enum.Enum {
  r5 = 0,
  test_hash = 1,
}

Ubifs.InodeTypes = enum.Enum {
  regular = 0,
  directory = 1,
  link = 2,
  block_device = 3,
  character_device = 4,
  fifo = 5,
  socket = 6,
}

Ubifs.KeyFormats = enum.Enum {
  simple = 0,
}

Ubifs.KeyTypes = enum.Enum {
  inode = 0,
  data = 1,
  directory = 2,
  extended_attribute = 3,
}

Ubifs.NodeGroupTypes = enum.Enum {
  no_node_group = 0,
  in_node_group = 1,
  last_of_node_group = 2,
}

Ubifs.NodeTypes = enum.Enum {
  inode = 0,
  data = 1,
  directory = 2,
  extended_attribute = 3,
  truncation = 4,
  padding = 5,
  superblock = 6,
  master = 7,
  reference = 8,
  index = 9,
  commit_start = 10,
  orphan = 11,
  authentication = 12,
  signature = 13,
}

function Ubifs:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ubifs:_read()
end

-- 
-- The LEB containing the root index node, as given by `leb_root` in
-- `master_1`.
-- 
-- This instance only provides the substream for `index_root`, which can then
-- use `ofs_root` (an offset within the LEB) as its `pos` directly.
Ubifs.property.index = {}
function Ubifs.property.index:get()
  if self._m_index ~= nil then
    return self._m_index
  end

  local _pos = self._io:pos()
  self._io:seek(self.superblock.node_header.leb_size * self.master_1.node_header.leb_root)
  self._raw__m_index = self._io:read_bytes(self.superblock.node_header.leb_size)
  local _io = KaitaiStream(stringstream(self._raw__m_index))
  self._m_index = Ubifs.Dummy(_io, self, self._root)
  self._io:seek(_pos)
  return self._m_index
end

-- 
-- The root index node, in the `index` LEB at the offset given by
-- `ofs_root` in `master_1`. All other index nodes, and through them all
-- the files, are reached from it by recursively following the `target` of
-- each of the `branches`.
Ubifs.property.index_root = {}
function Ubifs.property.index_root:get()
  if self._m_index_root ~= nil then
    return self._m_index_root
  end

  local _io = self.index._io
  local _pos = _io:pos()
  _io:seek(self.master_1.node_header.ofs_root)
  self._m_index_root = Ubifs.IndexBlock(_io, self, self._root)
  local _ = self._m_index_root
  if not(_.header.len_full_node == self.master_1.node_header.len_root) then
    error("ValidationExprError")
  end
  _io:seek(_pos)
  return self._m_index_root
end

-- 
-- All LEBs of the file system: `lebs[n]` is LEB number `n`, which starts
-- at offset `n * <superblock_header>.leb_size`.
-- 
-- Accessing this instance reads the whole image into memory. To get a
-- single LEB, it's cheaper to read `<superblock_header>.leb_size` bytes
-- at the offset of that LEB.
Ubifs.property.lebs = {}
function Ubifs.property.lebs:get()
  if self._m_lebs ~= nil then
    return self._m_lebs
  end

  local _pos = self._io:pos()
  self._io:seek(0)
  self._m_lebs = {}
  for i = 0, self.superblock.node_header.num_lebs - 1 do
    self._m_lebs[i + 1] = self._io:read_bytes(self.superblock.node_header.leb_size)
  end
  self._io:seek(_pos)
  return self._m_lebs
end

-- 
-- Length of the file system image in bytes:
-- `<superblock_header>.num_lebs` LEBs of `<superblock_header>.leb_size`
-- bytes each. Use it to find where the image ends and to detect a
-- truncated image (see the top-level `doc`).
Ubifs.property.len_image = {}
function Ubifs.property.len_image:get()
  if self._m_len_image ~= nil then
    return self._m_len_image
  end

  self._m_len_image = self.superblock.node_header.leb_size * self.superblock.node_header.num_lebs
  return self._m_len_image
end

-- 
-- The first copy of the master node in LEB1. This Kaitai Struct
-- implementation uses it to locate `index_root`. In an image created by
-- `mkfs.ubifs`, it is the only copy in LEB1.
-- See also: Git tag "v2.3.1" (https://github.com/sigma-star/mtd-utils/blob/053ee1038e5dedae61a88cadfb7bdfe9894d8bb6/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c#L2627-L2633)
Ubifs.property.master_1 = {}
function Ubifs.property.master_1:get()
  if self._m_master_1 ~= nil then
    return self._m_master_1
  end

  local _pos = self._io:pos()
  self._io:seek(self.superblock.node_header.leb_size)
  self._raw__m_master_1 = self._io:read_bytes(self.superblock.node_header.leb_size)
  local _io = KaitaiStream(stringstream(self._raw__m_master_1))
  self._m_master_1 = Ubifs.MasterblockNode(_io, self, self._root)
  self._io:seek(_pos)
  return self._m_master_1
end

-- 
-- The first copy of the master node in LEB2. In an image created by
-- `mkfs.ubifs`, it is the same as `master_1` except for the sequence
-- number and CRC in the common header. Linux keeps the master node in both
-- LEB1 and LEB2 for redundancy, and when mounting, it checks that the
-- copies in both match.
-- See also: Git tag "v2.3.1" (https://github.com/sigma-star/mtd-utils/blob/053ee1038e5dedae61a88cadfb7bdfe9894d8bb6/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c#L2627-L2633)
-- See also: Git tag "v7.2" (https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L115-L130)
Ubifs.property.master_2 = {}
function Ubifs.property.master_2:get()
  if self._m_master_2 ~= nil then
    return self._m_master_2
  end

  local _pos = self._io:pos()
  self._io:seek(self.superblock.node_header.leb_size * 2)
  self._raw__m_master_2 = self._io:read_bytes(self.superblock.node_header.leb_size)
  local _io = KaitaiStream(stringstream(self._raw__m_master_2))
  self._m_master_2 = Ubifs.MasterblockNode(_io, self, self._root)
  self._io:seek(_pos)
  return self._m_master_2
end

-- 
-- The superblock node will always be at the start of
-- the first LEB.
Ubifs.property.superblock = {}
function Ubifs.property.superblock:get()
  if self._m_superblock ~= nil then
    return self._m_superblock
  end

  local _pos = self._io:pos()
  self._io:seek(0)
  self._m_superblock = Ubifs.SuperblockNode(self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_superblock
end


-- 
-- See also: Git tag "v7.2" (https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L774-L782)
Ubifs.AuthenticationHeader = class.class(KaitaiStruct)

function Ubifs.AuthenticationHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ubifs.AuthenticationHeader:_read()
  self.hmac = self._io:read_bytes(self._root.superblock.node_header.len_hash)
end

-- 
-- HMAC authenticating the journal before this node, keyed with the
-- file system's authentication key (which is not stored on flash).
-- The kernel [uses](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L275-L276)
-- HMAC with the hash algorithm in `<superblock_header>.hash_algo`
-- ([checked when mounting](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L575-L580)),
-- so `hmac` is as long as its digest, e.g. 32 bytes for SHA-256.

Ubifs.Block = class.class(KaitaiStruct)

function Ubifs.Block:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ubifs.Block:_read()
  self.header = Ubifs.CommonHeader(self._io, self, self._root)
  local _on = self.header.node_type
  if _on == Ubifs.NodeTypes.authentication then
    self._raw_node_header = self._io:read_bytes(self.header.len_full_node - 24)
    local _io = KaitaiStream(stringstream(self._raw_node_header))
    self.node_header = Ubifs.AuthenticationHeader(_io, self, self._root)
  elseif _on == Ubifs.NodeTypes.commit_start then
    self._raw_node_header = self._io:read_bytes(self.header.len_full_node - 24)
    local _io = KaitaiStream(stringstream(self._raw_node_header))
    self.node_header = Ubifs.CommitStartHeader(_io, self, self._root)
  elseif _on == Ubifs.NodeTypes.data then
    self._raw_node_header = self._io:read_bytes(self.header.len_full_node - 24)
    local _io = KaitaiStream(stringstream(self._raw_node_header))
    self.node_header = Ubifs.DataHeader(_io, self, self._root)
  elseif _on == Ubifs.NodeTypes.directory then
    self._raw_node_header = self._io:read_bytes(self.header.len_full_node - 24)
    local _io = KaitaiStream(stringstream(self._raw_node_header))
    self.node_header = Ubifs.DirectoryHeader(_io, self, self._root)
  elseif _on == Ubifs.NodeTypes.extended_attribute then
    self._raw_node_header = self._io:read_bytes(self.header.len_full_node - 24)
    local _io = KaitaiStream(stringstream(self._raw_node_header))
    self.node_header = Ubifs.DirectoryHeader(_io, self, self._root)
  elseif _on == Ubifs.NodeTypes.index then
    self._raw_node_header = self._io:read_bytes(self.header.len_full_node - 24)
    local _io = KaitaiStream(stringstream(self._raw_node_header))
    self.node_header = Ubifs.IndexHeader(_io, self, self._root)
  elseif _on == Ubifs.NodeTypes.inode then
    self._raw_node_header = self._io:read_bytes(self.header.len_full_node - 24)
    local _io = KaitaiStream(stringstream(self._raw_node_header))
    self.node_header = Ubifs.InodeHeader(_io, self, self._root)
  elseif _on == Ubifs.NodeTypes.master then
    self._raw_node_header = self._io:read_bytes(self.header.len_full_node - 24)
    local _io = KaitaiStream(stringstream(self._raw_node_header))
    self.node_header = Ubifs.MasterHeader(_io, self, self._root)
  elseif _on == Ubifs.NodeTypes.orphan then
    self._raw_node_header = self._io:read_bytes(self.header.len_full_node - 24)
    local _io = KaitaiStream(stringstream(self._raw_node_header))
    self.node_header = Ubifs.OrphanHeader(_io, self, self._root)
  elseif _on == Ubifs.NodeTypes.padding then
    self._raw_node_header = self._io:read_bytes(self.header.len_full_node - 24)
    local _io = KaitaiStream(stringstream(self._raw_node_header))
    self.node_header = Ubifs.PaddingHeader(_io, self, self._root)
  elseif _on == Ubifs.NodeTypes.reference then
    self._raw_node_header = self._io:read_bytes(self.header.len_full_node - 24)
    local _io = KaitaiStream(stringstream(self._raw_node_header))
    self.node_header = Ubifs.ReferenceHeader(_io, self, self._root)
  elseif _on == Ubifs.NodeTypes.signature then
    self._raw_node_header = self._io:read_bytes(self.header.len_full_node - 24)
    local _io = KaitaiStream(stringstream(self._raw_node_header))
    self.node_header = Ubifs.SignatureHeader(_io, self, self._root)
  elseif _on == Ubifs.NodeTypes.superblock then
    self._raw_node_header = self._io:read_bytes(self.header.len_full_node - 24)
    local _io = KaitaiStream(stringstream(self._raw_node_header))
    self.node_header = Ubifs.SuperblockHeader(_io, self, self._root)
  elseif _on == Ubifs.NodeTypes.truncation then
    self._raw_node_header = self._io:read_bytes(self.header.len_full_node - 24)
    local _io = KaitaiStream(stringstream(self._raw_node_header))
    self.node_header = Ubifs.TruncationHeader(_io, self, self._root)
  else
    self.node_header = self._io:read_bytes(self.header.len_full_node - 24)
  end
end


-- 
-- See also: Git tag "v7.2" (https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L801-L817)
Ubifs.Branch = class.class(KaitaiStruct)

function Ubifs.Branch:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ubifs.Branch:_read()
  self.target_leb = self._io:read_u4le()
  self.ofs_target = self._io:read_u4le()
  self.len_target = self._io:read_u4le()
  self._raw_key = self._io:read_bytes(8)
  local _io = KaitaiStream(stringstream(self._raw_key))
  self.key = Ubifs.Key(_io, self, self._root)
  self.hash = self._io:read_bytes(self._root.superblock.node_header.len_hash)
end

Ubifs.Branch.property.target = {}
function Ubifs.Branch.property.target:get()
  if self._m_target ~= nil then
    return self._m_target
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self._root.superblock.node_header.leb_size * self.target_leb + self.ofs_target)
  self._raw__m_target = _io:read_bytes(self.len_target)
  local _io = KaitaiStream(stringstream(self._raw__m_target))
  self._m_target = Ubifs.Block(_io, self, self._root)
  local _ = self._m_target
  if not( ((_.header.len_full_node == self.len_target) and (utils.box_unwrap((self._parent.level ~= 0) and utils.box_wrap(_.header.node_type == Ubifs.NodeTypes.index) or (_.header.node_type.value == self.key.type.value)))) ) then
    error("ValidationExprError")
  end
  _io:seek(_pos)
  return self._m_target
end

-- 
-- LEB number of the target node.
-- 
-- offset within the LEB `target_leb`.
-- 
-- target node length.
-- 
-- Hash of the target node. It is empty in a file system without
-- authentication (see `<superblock_header>.len_hash`).
-- See also: Git tag "v7.2" (https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs.h#L1642-L1654)

-- 
-- See also: Git tag "v7.2" (https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L833-L841)
Ubifs.CommitStartHeader = class.class(KaitaiStruct)

function Ubifs.CommitStartHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ubifs.CommitStartHeader:_read()
  self.commit_number = self._io:read_u8le()
end

-- 
-- commit number.

-- 
-- See also: Git tag "v7.2" (https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L443-L464)
Ubifs.CommonHeader = class.class(KaitaiStruct)

function Ubifs.CommonHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ubifs.CommonHeader:_read()
  self.magic = self._io:read_u4le()
  if not(self.magic == 101718065) then
    error("not equal, expected " .. 101718065 .. ", but got " .. self.magic)
  end
  self.crc = self._io:read_u4le()
  self.sequence_number = self._io:read_u8le()
  self.len_full_node = self._io:read_u4le()
  self.node_type = Ubifs.NodeTypes(self._io:read_u1())
  self.group_type = Ubifs.NodeGroupTypes(self._io:read_u1())
  self.padding = self._io:read_bytes(2)
  if not(self.padding == "\000\000") then
    error("not equal, expected " .. "\000\000" .. ", but got " .. self.padding)
  end
end

-- 
-- UBIFS node magic number (`UBIFS_NODE_MAGIC`).
-- 
-- CRC-32 checksum of the whole node except `magic` and `crc` (i.e.
-- starting at offset 8). It is computed with an initial register value
-- of 0xFFFFFFFF and no final XOR, so it is the bitwise NOT of a standard
-- CRC-32 (e.g.
-- [`zlib.crc32()`](https://docs.python.org/3/library/zlib.html#zlib.crc32)
-- in Python).
-- 
-- sequence number.
-- 
-- full node length.
-- 
-- node type.
-- 
-- node group type.
-- 
-- reserved for future, zeroes.

-- 
-- See also: Git tag "v7.2" (https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L567-L584)
Ubifs.DataHeader = class.class(KaitaiStruct)

function Ubifs.DataHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ubifs.DataHeader:_read()
  self._raw_key = self._io:read_bytes(16)
  local _io = KaitaiStream(stringstream(self._raw_key))
  self.key = Ubifs.Key(_io, self, self._root)
  self.len_uncompressed = self._io:read_u4le()
  if not(self.len_uncompressed >= 1) then
    error("ValidationLessThanError")
  end
  if not(self.len_uncompressed <= 4096) then
    error("ValidationGreaterThanError")
  end
  self.compression = Ubifs.Compression(self._io:read_u2le())
  if self.compression == nil then
    error("ValidationNotInEnumError")
  end
  self.len_compressed_data = self._io:read_u2le()
  self.data = self._io:read_bytes_full()
end

-- 
-- node key.
-- 
-- uncompressed data size in bytes.
-- 
-- compression type (`compression::no_compression`, `compression::lzo`,
-- etc.)
-- 
-- compressed data size in bytes, only valid when data is encrypted.
-- 
-- One block (up to 4096 bytes) of the file, block number `key.value`,
-- compressed as given by `compression`. Blocks missing from the index
-- are holes (zeros). In an encrypted inode, the compressed data is
-- padded
-- and [encrypted](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/crypto.c#L38-L59),
-- and `len_compressed_data` is the length of the compressed data
-- before padding.

-- 
-- See also: Git tag "v7.2" (https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L541-L565)
Ubifs.DirectoryHeader = class.class(KaitaiStruct)

function Ubifs.DirectoryHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ubifs.DirectoryHeader:_read()
  self._raw_key = self._io:read_bytes(16)
  local _io = KaitaiStream(stringstream(self._raw_key))
  self.key = Ubifs.Key(_io, self, self._root)
  local _ = self.key
  if not( ((_.type == Ubifs.KeyTypes.directory) or (_.type == Ubifs.KeyTypes.extended_attribute)) ) then
    error("ValidationExprError")
  end
  self.inode_number = self._io:read_u8le()
  if not(self.inode_number <= 4294967295) then
    error("ValidationGreaterThanError")
  end
  self.padding1 = self._io:read_bytes(1)
  if not(self.padding1 == "\000") then
    error("not equal, expected " .. "\000" .. ", but got " .. self.padding1)
  end
  self.inode_type = Ubifs.InodeTypes(self._io:read_u1())
  if self.inode_type == nil then
    error("ValidationNotInEnumError")
  end
  self.len_name = self._io:read_u2le()
  self.cookie = self._io:read_u4le()
  self.name = self._io:read_bytes(self.len_name)
  self.name_terminator = self._io:read_bytes(1)
  if not(self.name_terminator == "\000") then
    error("not equal, expected " .. "\000" .. ", but got " .. self.name_terminator)
  end
end

-- 
-- node key.
-- 
-- target inode number.
-- 
-- reserved for future, zeroes.
-- 
-- type of the target inode (`inode_types::regular`,
-- `inode_types::directory`, etc.)
-- 
-- name length.
-- 
-- A 32bits random number, used to construct a 64bits identifier.
-- 
-- Name of the entry.
-- 
-- It is kept as bytes rather than decoded as a string: names in a
-- directory whose inode has `<inode_header>.encrypted` set are
-- ciphertext, which may contain any bytes, including zeros.
-- 
-- Unencrypted names, including all names of extended attributes, contain
-- no zero bytes, because Linux can't create such names. They aren't
-- necessarily valid UTF-8, though, as UBIFS doesn't enforce any encoding
-- of file names. A zero byte in such a name means that the image was
-- crafted, since an accidental corruption would most likely fail the
-- node's
-- [CRC check](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/io.c#L287-L293).
-- 
-- Zero byte after `name`, [not counted in
-- `len_name`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/replay.c#L487-L489).

Ubifs.Dummy = class.class(KaitaiStruct)

function Ubifs.Dummy:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ubifs.Dummy:_read()
end


Ubifs.IndexBlock = class.class(KaitaiStruct)

function Ubifs.IndexBlock:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ubifs.IndexBlock:_read()
  self.header = Ubifs.CommonHeader(self._io, self, self._root)
  local _ = self.header
  if not(_.node_type == Ubifs.NodeTypes.index) then
    error("ValidationExprError")
  end
  self._raw_node_header = self._io:read_bytes(self.header.len_full_node - 24)
  local _io = KaitaiStream(stringstream(self._raw_node_header))
  self.node_header = Ubifs.IndexHeader(_io, self, self._root)
end


-- 
-- See also: Git tag "v7.2" (https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L819-L831)
Ubifs.IndexHeader = class.class(KaitaiStruct)

function Ubifs.IndexHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ubifs.IndexHeader:_read()
  self.num_branches = self._io:read_u2le()
  self.level = self._io:read_u2le()
  self.branches = {}
  for i = 0, self.num_branches - 1 do
    self.branches[i + 1] = Ubifs.Branch(self._io, self, self._root)
  end
end

-- 
-- number of child index nodes.
-- 
-- tree level.
-- 
-- LEB number / offset / length / key branches
-- 
-- All branches have the same size, which is 20 bytes (with the simple
-- key format) plus the hash length in an authenticated file system.
-- See also: Git tag "v7.2" (https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/misc.h#L186-L205)

-- 
-- See also: Git tag "v7.2" (https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L480-L539)
Ubifs.InodeHeader = class.class(KaitaiStruct)

function Ubifs.InodeHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ubifs.InodeHeader:_read()
  self._raw_key = self._io:read_bytes(16)
  local _io = KaitaiStream(stringstream(self._raw_key))
  self.key = Ubifs.Key(_io, self, self._root)
  self.creation_sequence_number = self._io:read_u8le()
  self.len_uncompressed = self._io:read_u8le()
  self.atime_sec = self._io:read_u8le()
  self.ctime_sec = self._io:read_u8le()
  self.mtime_sec = self._io:read_u8le()
  self.atime_nsec = self._io:read_u4le()
  self.ctime_nsec = self._io:read_u4le()
  self.mtime_nsec = self._io:read_u4le()
  self.num_links = self._io:read_u4le()
  self.uid = self._io:read_u4le()
  self.gid = self._io:read_u4le()
  self.mode = self._io:read_u4le()
  self.flags = self._io:read_u4le()
  self.len_data = self._io:read_u4le()
  self.num_xattrs = self._io:read_u4le()
  self.xattr_size = self._io:read_u4le()
  self.padding1 = self._io:read_bytes(4)
  if not(self.padding1 == "\000\000\000\000") then
    error("not equal, expected " .. "\000\000\000\000" .. ", but got " .. self.padding1)
  end
  self.xattr_names = self._io:read_u4le()
  self.compression = Ubifs.Compression(self._io:read_u2le())
  if self.compression == nil then
    error("ValidationNotInEnumError")
  end
  self.padding2 = self._io:read_bytes(26)
  self.data = self._io:read_bytes(self.len_data)
end

-- 
-- writes to the inode may only append data.
Ubifs.InodeHeader.property.append = {}
function Ubifs.InodeHeader.property.append:get()
  if self._m_append ~= nil then
    return self._m_append
  end

  self._m_append = self.flags & 8 ~= 0
  return self._m_append
end

-- 
-- use compression for this inode.
Ubifs.InodeHeader.property.compressed = {}
function Ubifs.InodeHeader.property.compressed:get()
  if self._m_compressed ~= nil then
    return self._m_compressed
  end

  self._m_compressed = self.flags & 1 ~= 0
  return self._m_compressed
end

-- 
-- I/O on this directory inode has to be synchronous.
Ubifs.InodeHeader.property.dirsync = {}
function Ubifs.InodeHeader.property.dirsync:get()
  if self._m_dirsync ~= nil then
    return self._m_dirsync
  end

  self._m_dirsync = self.flags & 16 ~= 0
  return self._m_dirsync
end

-- 
-- use encryption for this inode.
Ubifs.InodeHeader.property.encrypted = {}
function Ubifs.InodeHeader.property.encrypted:get()
  if self._m_encrypted ~= nil then
    return self._m_encrypted
  end

  self._m_encrypted = self.flags & 64 ~= 0
  return self._m_encrypted
end

-- 
-- inode is immutable.
Ubifs.InodeHeader.property.immutable = {}
function Ubifs.InodeHeader.property.immutable:get()
  if self._m_immutable ~= nil then
    return self._m_immutable
  end

  self._m_immutable = self.flags & 4 ~= 0
  return self._m_immutable
end

Ubifs.InodeHeader.property.is_block_device = {}
function Ubifs.InodeHeader.property.is_block_device:get()
  if self._m_is_block_device ~= nil then
    return self._m_is_block_device
  end

  self._m_is_block_device = self.mode & 61440 == 24576
  return self._m_is_block_device
end

Ubifs.InodeHeader.property.is_character_device = {}
function Ubifs.InodeHeader.property.is_character_device:get()
  if self._m_is_character_device ~= nil then
    return self._m_is_character_device
  end

  self._m_is_character_device = self.mode & 61440 == 8192
  return self._m_is_character_device
end

Ubifs.InodeHeader.property.is_dir = {}
function Ubifs.InodeHeader.property.is_dir:get()
  if self._m_is_dir ~= nil then
    return self._m_is_dir
  end

  self._m_is_dir = self.mode & 61440 == 16384
  return self._m_is_dir
end

Ubifs.InodeHeader.property.is_fifo = {}
function Ubifs.InodeHeader.property.is_fifo:get()
  if self._m_is_fifo ~= nil then
    return self._m_is_fifo
  end

  self._m_is_fifo = self.mode & 61440 == 4096
  return self._m_is_fifo
end

Ubifs.InodeHeader.property.is_link = {}
function Ubifs.InodeHeader.property.is_link:get()
  if self._m_is_link ~= nil then
    return self._m_is_link
  end

  self._m_is_link = self.mode & 61440 == 40960
  return self._m_is_link
end

Ubifs.InodeHeader.property.is_regular = {}
function Ubifs.InodeHeader.property.is_regular:get()
  if self._m_is_regular ~= nil then
    return self._m_is_regular
  end

  self._m_is_regular = self.mode & 61440 == 32768
  return self._m_is_regular
end

Ubifs.InodeHeader.property.is_socket = {}
function Ubifs.InodeHeader.property.is_socket:get()
  if self._m_is_socket ~= nil then
    return self._m_is_socket
  end

  self._m_is_socket = self.mode & 61440 == 49152
  return self._m_is_socket
end

-- 
-- I/O on this inode has to be synchronous.
Ubifs.InodeHeader.property.synchronous = {}
function Ubifs.InodeHeader.property.synchronous:get()
  if self._m_synchronous ~= nil then
    return self._m_synchronous
  end

  self._m_synchronous = self.flags & 2 ~= 0
  return self._m_synchronous
end

-- 
-- this inode is the inode for an extended attribute value.
Ubifs.InodeHeader.property.xattr = {}
function Ubifs.InodeHeader.property.xattr:get()
  if self._m_xattr ~= nil then
    return self._m_xattr
  end

  self._m_xattr = self.flags & 32 ~= 0
  return self._m_xattr
end

-- 
-- node key.
-- 
-- sequence number at time of creation.
-- 
-- inode size in bytes (amount of uncompressed data).
-- 
-- access time seconds.
-- 
-- status change time seconds.
-- 
-- modification time seconds.
-- 
-- access time nanoseconds.
-- 
-- status change time nanoseconds.
-- 
-- modification time nanoseconds.
-- 
-- number of hard links.
-- 
-- owner ID.
-- 
-- group ID.
-- 
-- file type and permissions, as in `st_mode` (see the `is_*`
-- instances for the file type)
-- 
-- per-inode flags (see the instances `compressed`, `synchronous`,
-- etc.)
-- 
-- inode data length.
-- 
-- count of extended attributes this inode has.
-- 
-- summarized size of all extended attributes in bytes.
-- 
-- sum of lengths of all extended attribute names belonging
-- to this inode
-- 
-- compression type used for this inode.
-- 
-- reserved for future, zeroes.
-- 
-- Target of a [symbolic link](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/dir.c#L1220-L1241),
-- (encrypted if the inode is encrypted), device number of a device node
-- ([`union ubifs_dev_desc`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L466-L478):
-- 4 bytes from Linux, 8 from `mkfs.ubifs`), or value of an
-- [extended attribute](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/xattr.c#L115-L121)
-- (in its own inode, see `xattr`). Empty otherwise.

-- 
-- Inode nodes (`inode_header`), directory and extended attribute entry
-- nodes (`directory_header`) and data nodes (`data_header`) store keys in a
-- 16-byte field (`UBIFS_MAX_KEY_LEN`). The simple key format, the only one
-- there is (see `<superblock_header>.key_fmt`), uses only the first 8
-- bytes, and Linux (v7.2)
-- [zeroes](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h#L432-L440)
-- the rest. Branches of index nodes (`branch`)
-- [store only these 8 bytes](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h#L448-L455).
-- See also: Git tag "v7.2" (https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h#L16-L22)
Ubifs.Key = class.class(KaitaiStruct)

function Ubifs.Key:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ubifs.Key:_read()
  self.inode_number = self._io:read_u4le()
  self.value = self._io:read_bits_int_le(29)
  self.type = Ubifs.KeyTypes(self._io:read_bits_int_le(3))
  if self.type == nil then
    error("ValidationNotInEnumError")
  end
  self._io:align_to_byte()
  self.unused = self._io:read_bytes_full()
end

-- 
-- Number of the inode that the node belongs to: the parent directory
-- for a directory entry, the inode that the attribute belongs to for an
-- extended attribute entry.
-- 
-- Block number for a data node, hash of the name (see
-- `<superblock_header>.key_hash`) for a directory or extended
-- attribute entry, 0 for an inode node.
-- 
-- Type of the key, which matches the type of the node.
-- 
-- Rest of the field holding the key: 8 zero bytes in `inode_header`,
-- `directory_header` and `data_header`, empty in `branch`.

-- 
-- See also: Git tag "v7.2" (https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L685-L756)
Ubifs.MasterHeader = class.class(KaitaiStruct)

function Ubifs.MasterHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ubifs.MasterHeader:_read()
  self.highest_inum = self._io:read_u8le()
  self.commit_number = self._io:read_u8le()
  self.flags = self._io:read_u4le()
  self.leb_log = self._io:read_u4le()
  self.leb_root = self._io:read_u4le()
  self.ofs_root = self._io:read_u4le()
  self.len_root = self._io:read_u4le()
  self.leb_garbage_collect = self._io:read_u4le()
  self.leb_index_head = self._io:read_u4le()
  self.ofs_index_head = self._io:read_u4le()
  self.len_index = self._io:read_u8le()
  self.total_free = self._io:read_u8le()
  self.total_dirty = self._io:read_u8le()
  self.total_used = self._io:read_u8le()
  self.total_dead = self._io:read_u8le()
  self.total_dark = self._io:read_u8le()
  self.leb_lpt = self._io:read_u4le()
  self.ofs_lpt = self._io:read_u4le()
  self.leb_nhead = self._io:read_u4le()
  self.ofs_nhead = self._io:read_u4le()
  self.leb_lprops_table = self._io:read_u4le()
  self.ofs_lprops_table = self._io:read_u4le()
  self.leb_save_table = self._io:read_u4le()
  self.ofs_save_table = self._io:read_u4le()
  self.leb_last_lpt_scan = self._io:read_u4le()
  self.num_empty_lebs = self._io:read_u4le()
  self.num_index_lebs = self._io:read_u4le()
  self.num_lebs = self._io:read_u4le()
  self.hash_root_index = self._io:read_bytes(64)
  self.hash_lpt = self._io:read_bytes(64)
  self.hmac = self._io:read_bytes(64)
  self.padding = self._io:read_bytes(152)
end

-- 
-- master node is dirty.
Ubifs.MasterHeader.property.dirty = {}
function Ubifs.MasterHeader.property.dirty:get()
  if self._m_dirty ~= nil then
    return self._m_dirty
  end

  self._m_dirty = self.flags & 1 ~= 0
  return self._m_dirty
end

-- 
-- no orphan inodes present.
Ubifs.MasterHeader.property.no_orphans = {}
function Ubifs.MasterHeader.property.no_orphans:get()
  if self._m_no_orphans ~= nil then
    return self._m_no_orphans
  end

  self._m_no_orphans = self.flags & 2 ~= 0
  return self._m_no_orphans
end

-- 
-- written by recovery.
Ubifs.MasterHeader.property.recovery = {}
function Ubifs.MasterHeader.property.recovery:get()
  if self._m_recovery ~= nil then
    return self._m_recovery
  end

  self._m_recovery = self.flags & 4 ~= 0
  return self._m_recovery
end

-- 
-- highest inode number in the committed index.
-- 
-- commit number.
-- 
-- various flags (see the instances `dirty`, `no_orphans` and
-- `recovery`)
-- 
-- start of the log.
-- 
-- LEB number of the root indexing node.
-- 
-- offset within the LEB `leb_root`.
-- 
-- root indexing node length.
-- 
-- LEB reserved for garbage collection, which must be in the main area.
-- 
-- The [comment above `struct ubifs_mst_node`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L695-L696)
-- says that -1 (`0xffff_ffff`) means the LEB was not reserved and should
-- be reserved on mount. However, Linux refuses to mount a file system
-- with -1. Linux
-- [stores](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L362)
-- the field in an
-- [`int`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs.h#L1424),
-- so `0xffff_ffff` becomes -1. Then -1 is rejected by the condition
-- `c->gc_lnum < c->main_first`, because the main area
-- [starts](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L775-L777)
-- after the superblock, master, log, LPT and orphan areas.
-- See also: Git tag "v7.2" (https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L214-L217)
-- 
-- LEB number of index head.
-- 
-- offset of index head.
-- 
-- size of index on flash.
-- 
-- total free space in bytes.
-- 
-- total dirty space in bytes.
-- 
-- total used space in bytes (includes only data LEBs).
-- 
-- total dead space in bytes (includes only data LEBs).
-- 
-- total dark space in bytes (includes only data LEBs).
-- 
-- LEB number of LPT root nnode.
-- 
-- offset of LPT root nnode.
-- 
-- LEB number of LPT head.
-- 
-- offset of LPT head.
-- 
-- LEB number of LPT's own lprops table.
-- 
-- offset of LPT's own lprops table.
-- 
-- LEB number of LPT's save table. Present in every master node, but
-- only meaningful if `<superblock_header>.biglpt` is set: only then
-- does Linux [check the location of the save table](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L252-L256).
-- 
-- offset of LPT's save table (only meaningful if
-- `<superblock_header>.biglpt` is set, see `leb_save_table`)
-- 
-- LEB number of last LPT scan.
-- 
-- number of empty logical eraseblocks.
-- 
-- number of indexing logical eraseblocks.
-- 
-- count of LEBs used by file-system.
-- 
-- the hash of the root index node.
-- 
-- the hash of the LPT.
-- 
-- HMAC to authenticate the master node.
-- 
-- reserved for future, zeroes.

Ubifs.MasterblockNode = class.class(KaitaiStruct)

function Ubifs.MasterblockNode:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ubifs.MasterblockNode:_read()
  self.header = Ubifs.CommonHeader(self._io, self, self._root)
  local _ = self.header
  if not(_.node_type == Ubifs.NodeTypes.master) then
    error("ValidationExprError")
  end
  self._raw_node_header = self._io:read_bytes(self.header.len_full_node - 24)
  local _io = KaitaiStream(stringstream(self._raw_node_header))
  self.node_header = Ubifs.MasterHeader(_io, self, self._root)
end


-- 
-- See also: Git tag "v7.2" (https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L843-L853)
Ubifs.OrphanHeader = class.class(KaitaiStruct)

function Ubifs.OrphanHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ubifs.OrphanHeader:_read()
  self.commit_number = self._io:read_u8le()
  self.inode_numbers = {}
  local i = 0
  while not self._io:is_eof() do
    self.inode_numbers[i + 1] = self._io:read_u8le()
    i = i + 1
  end
end

-- 
-- commit number (also top bit is set on the last node of the commit).
-- 
-- inode numbers of orphans.

-- 
-- See also: Git tag "v7.2" (https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L606-L615)
Ubifs.PaddingHeader = class.class(KaitaiStruct)

function Ubifs.PaddingHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ubifs.PaddingHeader:_read()
  self.len_padding = self._io:read_u4le()
end

-- 
-- how many bytes after this node are unused (because padded).

-- 
-- logical eraseblock reference node.
-- See also: Git tag "v7.2" (https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L758-L772)
Ubifs.ReferenceHeader = class.class(KaitaiStruct)

function Ubifs.ReferenceHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ubifs.ReferenceHeader:_read()
  self.leb_number = self._io:read_u4le()
  self.ofs_leb = self._io:read_u4le()
  self.journal_head_number = self._io:read_u4le()
  self.padding = self._io:read_bytes(28)
end

-- 
-- the referred logical eraseblock number.
-- 
-- start offset in the referred LEB.
-- 
-- journal head number.
-- 
-- reserved for future, zeroes.

-- 
-- Signature of the superblock node of a file system signed when it was
-- created (`mkfs.ubifs` with a key). Linux
-- [expects it](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L198-L216)
-- as the first node after the superblock node in LEB0.
-- See also: Git tag "v7.2" (https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L784-L799)
Ubifs.SignatureHeader = class.class(KaitaiStruct)

function Ubifs.SignatureHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ubifs.SignatureHeader:_read()
  self.type = self._io:read_u4le()
  if not(self.type == 1) then
    error("not equal, expected " .. 1 .. ", but got " .. self.type)
  end
  self.len_signature = self._io:read_u4le()
  self.padding = self._io:read_bytes(32)
  self.signature = self._io:read_bytes(self.len_signature)
end

-- 
-- type of the signature.
-- 
-- length of `signature` in bytes.
-- 
-- reserved for future, zeroes.
-- 
-- [PKCS #7 signature](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L233-L236)
-- of the whole superblock node (4096 bytes, including the common
-- header)

-- 
-- See also: Git tag "v7.2" (https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L617-L683)
Ubifs.SuperblockHeader = class.class(KaitaiStruct)

function Ubifs.SuperblockHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ubifs.SuperblockHeader:_read()
  self.padding0 = self._io:read_bytes(2)
  if not(self.padding0 == "\000\000") then
    error("not equal, expected " .. "\000\000" .. ", but got " .. self.padding0)
  end
  self.key_hash = Ubifs.Hashes(self._io:read_u1())
  if self.key_hash == nil then
    error("ValidationNotInEnumError")
  end
  self.key_fmt = Ubifs.KeyFormats(self._io:read_u1())
  if not(self.key_fmt == Ubifs.KeyFormats.simple) then
    error("not equal, expected " .. Ubifs.KeyFormats.simple .. ", but got " .. self.key_fmt)
  end
  self.flags = self._io:read_u4le()
  self.min_io_size = self._io:read_u4le()
  self.leb_size = self._io:read_u4le()
  self.num_lebs = self._io:read_u4le()
  self.max_num_lebs = self._io:read_u4le()
  if not(self.max_num_lebs >= self.num_lebs) then
    error("ValidationLessThanError")
  end
  self.max_bud_bytes = self._io:read_u8le()
  self.num_log_lebs = self._io:read_u4le()
  if not(self.num_log_lebs >= 2) then
    error("ValidationLessThanError")
  end
  self.num_lpt_lebs = self._io:read_u4le()
  if not(self.num_lpt_lebs >= 2) then
    error("ValidationLessThanError")
  end
  self.num_orphan_lebs = self._io:read_u4le()
  if not(self.num_orphan_lebs >= 1) then
    error("ValidationLessThanError")
  end
  self.num_journal_heads = self._io:read_u4le()
  self.fanout = self._io:read_u4le()
  self.num_save_table_entries = self._io:read_u4le()
  self.fmt_version = self._io:read_u4le()
  if not(self.fmt_version >= 4) then
    error("ValidationLessThanError")
  end
  self.default_compression = Ubifs.Compression(self._io:read_u2le())
  if self.default_compression == nil then
    error("ValidationNotInEnumError")
  end
  self.padding1 = self._io:read_bytes(2)
  if not(self.padding1 == "\000\000") then
    error("not equal, expected " .. "\000\000" .. ", but got " .. self.padding1)
  end
  self.reserve_pool_uid = self._io:read_u4le()
  self.reserve_pool_gid = self._io:read_u4le()
  self.reserve_pool_size = self._io:read_u8le()
  self.time_granularity = self._io:read_u4le()
  if not(self.time_granularity >= 1) then
    error("ValidationLessThanError")
  end
  if not(self.time_granularity <= 1000000000) then
    error("ValidationGreaterThanError")
  end
  self.uuid = self._io:read_bytes(16)
  self.ro_compat_version = self._io:read_u4le()
  self.hmac = self._io:read_bytes(64)
  self.hmac_wkm = self._io:read_bytes(64)
  if self.authenticated then
    self.hash_algo = Ubifs.HashAlgos(self._io:read_u2le())
    if self.hash_algo == nil then
      error("ValidationNotInEnumError")
    end
  end
  if not(self.authenticated) then
    self.hash_algo_unused = self._io:read_u2le()
  end
  self.hash_mst = self._io:read_bytes(64)
  self.padding2 = self._io:read_bytes(3774)
end

-- 
-- this filesystem contains hashes for authentication.
Ubifs.SuperblockHeader.property.authenticated = {}
function Ubifs.SuperblockHeader.property.authenticated:get()
  if self._m_authenticated ~= nil then
    return self._m_authenticated
  end

  self._m_authenticated = self.flags & 32 ~= 0
  return self._m_authenticated
end

-- 
-- if "big" LPT model is used if set.
Ubifs.SuperblockHeader.property.biglpt = {}
function Ubifs.SuperblockHeader.property.biglpt:get()
  if self._m_biglpt ~= nil then
    return self._m_biglpt
  end

  self._m_biglpt = self.flags & 2 ~= 0
  return self._m_biglpt
end

-- 
-- store a 32bit cookie in directory entry nodes to
-- support 64bit cookies for lookups by hash
Ubifs.SuperblockHeader.property.double_hash = {}
function Ubifs.SuperblockHeader.property.double_hash:get()
  if self._m_double_hash ~= nil then
    return self._m_double_hash
  end

  self._m_double_hash = self.flags & 8 ~= 0
  return self._m_double_hash
end

-- 
-- filesystem contains encrypted files.
Ubifs.SuperblockHeader.property.encrypted = {}
function Ubifs.SuperblockHeader.property.encrypted:get()
  if self._m_encrypted ~= nil then
    return self._m_encrypted
  end

  self._m_encrypted = self.flags & 16 ~= 0
  return self._m_encrypted
end

-- 
-- Length in bytes of the hash of a node (`c->hash_len` in Linux), e.g.
-- in each branch of an index node. In an authenticated file system, it
-- is determined by `hash_algo`. Otherwise, it is 0.
Ubifs.SuperblockHeader.property.len_hash = {}
function Ubifs.SuperblockHeader.property.len_hash:get()
  if self._m_len_hash ~= nil then
    return self._m_len_hash
  end

  self._m_len_hash = utils.box_unwrap((not(self.authenticated)) and utils.box_wrap(0) or (utils.box_unwrap(( ((self.hash_algo == Ubifs.HashAlgos.md4) or (self.hash_algo == Ubifs.HashAlgos.md5) or (self.hash_algo == Ubifs.HashAlgos.ripe_md_128) or (self.hash_algo == Ubifs.HashAlgos.tgr_128)) ) and utils.box_wrap(16) or (utils.box_unwrap(( ((self.hash_algo == Ubifs.HashAlgos.sha1) or (self.hash_algo == Ubifs.HashAlgos.ripe_md_160) or (self.hash_algo == Ubifs.HashAlgos.tgr_160)) ) and utils.box_wrap(20) or (utils.box_unwrap((self.hash_algo == Ubifs.HashAlgos.tgr_192) and utils.box_wrap(24) or (utils.box_unwrap((self.hash_algo == Ubifs.HashAlgos.sha224) and utils.box_wrap(28) or (utils.box_unwrap(( ((self.hash_algo == Ubifs.HashAlgos.sha256) or (self.hash_algo == Ubifs.HashAlgos.ripe_md_256) or (self.hash_algo == Ubifs.HashAlgos.wp_256) or (self.hash_algo == Ubifs.HashAlgos.sm3_256) or (self.hash_algo == Ubifs.HashAlgos.streebog_256) or (self.hash_algo == Ubifs.HashAlgos.sha3_256)) ) and utils.box_wrap(32) or (utils.box_unwrap((self.hash_algo == Ubifs.HashAlgos.ripe_md_320) and utils.box_wrap(40) or (utils.box_unwrap(( ((self.hash_algo == Ubifs.HashAlgos.sha384) or (self.hash_algo == Ubifs.HashAlgos.wp_384) or (self.hash_algo == Ubifs.HashAlgos.sha3_384)) ) and utils.box_wrap(48) or (utils.box_unwrap(( ((self.hash_algo == Ubifs.HashAlgos.sha512) or (self.hash_algo == Ubifs.HashAlgos.wp_512) or (self.hash_algo == Ubifs.HashAlgos.streebog_512) or (self.hash_algo == Ubifs.HashAlgos.sha3_512)) ) and utils.box_wrap(64) or (-1))))))))))))))))))
  return self._m_len_hash
end

-- 
-- first-mount "fixup" of free space within LEBs needed.
Ubifs.SuperblockHeader.property.space_fixup = {}
function Ubifs.SuperblockHeader.property.space_fixup:get()
  if self._m_space_fixup ~= nil then
    return self._m_space_fixup
  end

  self._m_space_fixup = self.flags & 4 ~= 0
  return self._m_space_fixup
end

-- 
-- reserved for future, zeroes.
-- 
-- type of hash function used in keys.
-- 
-- format of the key.
-- 
-- file-system flags (see the instances `biglpt`, `space_fixup`, etc.).
-- 
-- minimal input/output unit size.
-- 
-- logical eraseblock size in bytes.
-- 
-- count of LEBs used by file-system.
-- 
-- maximum count of LEBs used by file-system.
-- 
-- maximum amount of data stored in buds.
-- 
-- log size in logical eraseblocks.
-- 
-- number of LEBs used for lprops table.
-- 
-- number of LEBs used for recording orphans.
-- 
-- count of journal heads.
-- 
-- tree fanout (max. number of links per indexing node).
-- 
-- number of LEB numbers in LPT's save table.
-- 
-- UBIFS on-flash format version.
-- 
-- default compression algorithm (`compression::lzo`, etc.).
-- 
-- reserved for future, zeroes.
-- 
-- reserve pool UID.
-- 
-- reserve pool GID.
-- 
-- size of the reserved pool in bytes.
-- 
-- time granularity in nanoseconds.
-- 
-- UUID generated when the file system image was created.
-- 
-- UBIFS R/O compatibility version.
-- 
-- HMAC to authenticate the superblock node.
-- 
-- HMAC of a well known message (the string "UBIFS") as a convenience
-- to the user to check if the correct key is passed
-- 
-- The hash algo used for this filesystem.
-- See also: Git tag "v7.2" (https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L549-L573)
-- 
-- Unused field (would only be meaningful in an authenticated file
-- system, see `hash_algo`). The kernel writes it as 0xffff, `mkfs.ubifs`
-- writes it as 0.
-- See also: Git tag "v7.2" (https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L183-L191)
-- 
-- hash of the master node, only valid for signed images in which the
-- master node does not contain a hmac
-- 
-- reserved for future, zeroes.

Ubifs.SuperblockNode = class.class(KaitaiStruct)

function Ubifs.SuperblockNode:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ubifs.SuperblockNode:_read()
  self.header = Ubifs.CommonHeader(self._io, self, self._root)
  local _ = self.header
  if not(_.node_type == Ubifs.NodeTypes.superblock) then
    error("ValidationExprError")
  end
  self._raw_node_header = self._io:read_bytes(self.header.len_full_node - 24)
  local _io = KaitaiStream(stringstream(self._raw_node_header))
  self.node_header = Ubifs.SuperblockHeader(_io, self, self._root)
end


-- 
-- This node exists only in the journal and never goes to the main area.
-- See also: Git tag "v7.2" (https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L586-L604)
Ubifs.TruncationHeader = class.class(KaitaiStruct)

function Ubifs.TruncationHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Ubifs.TruncationHeader:_read()
  self.inode_number = self._io:read_u4le()
  self.padding = self._io:read_bytes(12)
  self.old_size = self._io:read_u8le()
  if not(self.old_size >= 1) then
    error("ValidationLessThanError")
  end
  self.new_size = self._io:read_u8le()
  if not(self.new_size <= self.old_size - 1) then
    error("ValidationGreaterThanError")
  end
end

-- 
-- truncated inode number.
-- 
-- reserved for future, zeroes.
-- 
-- size before truncation.
-- 
-- size after truncation.


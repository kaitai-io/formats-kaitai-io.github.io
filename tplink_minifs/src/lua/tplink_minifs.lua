-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local utils = require("utils")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

-- 
-- MiniFS is a file system found in certain firmware files from TP-Link
-- (including its Mercusys brand) and Mercury. Such firmware contains an RTOS
-- kernel, e.g. VxWorks in
-- [`RE450(V4)_210531.zip`](https://static.tp-link.com/firmware/2021/202107/20210709/RE450(V4)_210531.zip)
-- ([archived](https://web.archive.org/web/20261105175157/https://static.tp-link.com/firmware/2021/202107/20210709/RE450(V4)_210531.zip))
-- or TPOS, TP-Link's RTOS, in
-- [`TL-WA850RE(EU)_V7.0_250808.zip`](https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)
-- ([archived](https://web.archive.org/web/20260903180047/https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)).
-- 
-- According to a TP-Link manager quoted in a
-- [2021 article](https://shiftdelete.net/tp-link-mercusys-ile-ilgili-hedeflerini-paylasti)
-- ([archived](https://web.archive.org/web/20230513175833/https://shiftdelete.net/tp-link-mercusys-ile-ilgili-hedeflerini-paylasti)),
-- Mercusys has been sold in China as Mercury since 2001. All Mercury images
-- examined contain a certificate with `O=tplink` in its issuer and subject.
-- 
-- All versions share the same header, and its `version` field determines the
-- layout of the rest of the image.
-- 
-- In version 3, the header is followed by a table of directory paths and file
-- names, followed by meta information for each file, meta information about
-- the LZMA compressed blobs including length, offset and uncompressed length,
-- and then a number of LZMA compressed blobs.
-- 
-- The LZMA blobs can contain the concatenated contents of multiple files.
-- The meta information of a file contains the offsets of its directory path
-- and file name, the LZMA blob (numbering starts at 0), the offset of the file
-- in the uncompressed data and the size of the uncompressed file.
-- 
-- Some version 3 images have no uncompressed length in the meta information
-- about the blobs (see `has_8_byte_lzma_metas` in `body_v3`).
-- 
-- In version 2, the header is followed by the length of the files area and a
-- meta information record for each file, each followed directly by the file's
-- data. Unlike versions 1 and 3, version 2 stores no paths or file names at
-- all, only the MD5 hash of each file's path.
-- 
-- In version 1, the header is followed by a record with the path, the compressed
-- length and the offset of each file, and then one LZMA blob per file.
-- 
-- This Kaitai Struct implementation was written independently of the paper
-- [Reverse Engineered MiniFS File System](https://arxiv.org/abs/2407.05064v1).
-- It was started in the firmware analysis project
-- [BANG](https://github.com/armijnhemel/binaryanalysis-ng) (Binary Analysis
-- Next Generation) in
-- [2021](https://github.com/armijnhemel/binaryanalysis-ng/commit/531203a076e3761116320b77b2b9c64a9dca6186)
-- and submitted to the Kaitai Struct format gallery in
-- [September 2023](https://github.com/kaitai-io/kaitai_struct_formats/pull/682),
-- whereas the paper was published in July 2024.
-- See also: The paper, section 4 (version 3) (https://arxiv.org/html/2407.05064v1#S4)
-- See also: tp_research's `Minifs.py` (version 2) (https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py)
-- See also: unblob's MiniFS handler (version 3) (https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py)
TplinkMinifs = class.class(KaitaiStruct)

TplinkMinifs.CompressionType = enum.Enum {
  lzma = 0,
  raw = 2,
  lzma_2014 = 4,
}

function TplinkMinifs:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TplinkMinifs:_read()
  self.header = TplinkMinifs.MinifsHeader(self._io, self, self._root)
  local _on = self.header.version
  if _on == 1 then
    self.body = TplinkMinifs.BodyV1(self._io, self, self._root)
  elseif _on == 2 then
    self.body = TplinkMinifs.BodyV2(self._io, self, self._root)
  elseif _on == 3 then
    self.body = TplinkMinifs.BodyV3(self._io, self, self._root)
  end
end


-- 
-- See also: Source (https://arxiv.org/html/2407.05064v1#S2.SS2)
TplinkMinifs.BodyV1 = class.class(KaitaiStruct)

function TplinkMinifs.BodyV1:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function TplinkMinifs.BodyV1:_read()
  self.inodes = {}
  for i = 0, self._root.header.num_files - 1 do
    self.inodes[i + 1] = TplinkMinifs.InodeV1(utils.box_unwrap((i ~= 0) and utils.box_wrap(self.inodes[(i - 1) + 1].ofs_end) or (0)), self._io, self, self._root)
  end
  self._raw_blobs_area = self._io:read_bytes(self.inodes[#self.inodes].ofs_end)
  local _io = KaitaiStream(stringstream(self._raw_blobs_area))
  self.blobs_area = TplinkMinifs.Dummy(_io, self, self._root)
end


TplinkMinifs.BodyV2 = class.class(KaitaiStruct)

function TplinkMinifs.BodyV2:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function TplinkMinifs.BodyV2:_read()
  self.len_files_area = self._io:read_u4be()
  self._raw_files_area = self._io:read_bytes(self.len_files_area)
  local _io = KaitaiStream(stringstream(self._raw_files_area))
  self.files_area = TplinkMinifs.FilesAreaV2(_io, self, self._root)
end


TplinkMinifs.BodyV3 = class.class(KaitaiStruct)

function TplinkMinifs.BodyV3:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function TplinkMinifs.BodyV3:_read()
  self.len_name_table = self._io:read_u4be()
  self._raw_name_table = self._io:read_bytes(self.len_name_table)
  local _io = KaitaiStream(stringstream(self._raw_name_table))
  self.name_table = TplinkMinifs.NameTable(_io, self, self._root)
  self.inodes = {}
  for i = 0, self._root.header.num_files - 1 do
    self.inodes[i + 1] = TplinkMinifs.Inode(utils.box_unwrap((i ~= 0) and utils.box_wrap(self.inodes[(i - 1) + 1].cur_max_lzma_blob) or (0)), self._io, self, self._root)
  end
  if self.ofs_lzma_metas < 0 then
    self._unnamed3 = self._io:read_bytes(0)
  end
  self.lzma_metas = {}
  for i = 0, self.num_lzma_blobs - 1 do
    self.lzma_metas[i + 1] = TplinkMinifs.LzmaMeta(utils.box_unwrap((i ~= 0) and utils.box_wrap(self.lzma_metas[(i - 1) + 1].ofs_end) or (0)), self._io, self, self._root)
  end
  self._raw_lzma_blobs_area = self._io:read_bytes(self.lzma_metas[#self.lzma_metas].ofs_end)
  local _io = KaitaiStream(stringstream(self._raw_lzma_blobs_area))
  self.lzma_blobs_area = TplinkMinifs.Dummy(_io, self, self._root)
end

-- 
-- Whether each record in `lzma_metas` lacks `len_blob_uncompressed` and
-- is therefore 8 bytes in size instead of 12.
-- 
-- The MiniFS header doesn't say which size is used (both use version 3),
-- so this Kaitai Struct implementation infers it using a heuristic based
-- on the `.lzma` header of the first blob. Bytes 5 to 12 of that header
-- are the uncompressed size, which was unknown (all bits set) for all
-- blobs in all version 3 images examined. So with 8-byte records,
-- `len_first_blob_uncompressed_if_8_byte_metas` has all bits set. With
-- 12-byte records, the same 8 bytes aren't the uncompressed size. With 3
-- or more blobs, they include a whole offset or length in `lzma_metas`,
-- which would have to be 4 GiB. With 1 or 2 blobs, they include the
-- first blob's dictionary size, which is 8 MiB in all images examined.
-- 
-- An image with 8-byte records and a known uncompressed size would be
-- rejected, or misparsed if it has a single blob and other data follows it.
-- 
-- In the images examined, 8-byte records occur in firmware files with
-- modification times from 2018 to 2022 (as stored in their ZIPs), e.g. in
-- [`MW301R(EU)_V2_180821.zip`](https://static.mercusys.com/software/MW301R(EU)_V2_180821.zip)
-- ([archived](https://web.archive.org/web/20261105093950/https://static.mercusys.com/software/MW301R(EU)_V2_180821.zip)),
-- listed on <https://www.mercusys.com/en/download/mw301r/v2/>
-- ([archived](https://web.archive.org/web/20261105142659/https://www.mercusys.com/en/download/mw301r/v2/)).
-- 
-- As far as we know, this implementation is the first description of
-- 8-byte records. The other descriptions and tools found either assume
-- 12 bytes or don't read `lzma_metas` at all. So there is no reference
-- to compare it with, and the evidence comes from the images. In all 49
-- distinct images examined with 8-byte records, the bytes at each
-- record's offset and length are exactly one complete LZMA stream. Each
-- such stream decompresses to exactly the length that the files packed
-- into it need. The file that ends last in it ends exactly where the
-- decompressed data ends. In addition:
-- 
-- * 2614 of the 7230 files in these 49 images have the same path and
--   contents as a file in an image with 12-byte records. For example,
--   49 files are the same in the image with 8-byte records in
--   [`TL-WA850RE(EU)_V7_201029.zip`](https://static.tp-link.com/2021/202102/20210209/TL-WA850RE(EU)_V7_201029.zip)
--   ([archived](https://web.archive.org/web/20220326032207/https://static.tp-link.com/2021/202102/20210209/TL-WA850RE(EU)_V7_201029.zip))
--   and the image with 12-byte records in
--   [`TL-WA850RE(EU)_V7.0_250808.zip`](https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)
--   ([archived](https://web.archive.org/web/20260903180047/https://static.tp-link.com/upload/firmware/2025/202509/20250919/TL-WA850RE(EU)_V7.0_250808.zip)).
-- * The repository
--   [NurMohammadDuari/mw325r-hack-lab](https://github.com/NurMohammadDuari/mw325r-hack-lab/tree/024da680dbf4f9ca287d562622f02d7d8875bd45)
--   has the [files](https://github.com/NurMohammadDuari/mw325r-hack-lab/tree/024da680dbf4f9ca287d562622f02d7d8875bd45/extracted-minifs)
--   of the image with 8-byte records in
--   [`MW325R(EU)_V2_20111620201211065426.zip`](https://static.mercusys.com/software/MW325R(EU)_V2_20111620201211065426.zip)
--   ([archived](https://web.archive.org/web/20261105093427/https://static.mercusys.com/software/MW325R(EU)_V2_20111620201211065426.zip)).
--   They match the files parsed by this implementation in all 92 files
--   that can be compared. Its
--   [extractor](https://github.com/NurMohammadDuari/mw325r-hack-lab/blob/024da680dbf4f9ca287d562622f02d7d8875bd45/analysis/minifs_extract.py)
--   finds the blobs by searching for LZMA headers instead of reading
--   `lzma_metas`.
TplinkMinifs.BodyV3.property.has_8_byte_lzma_metas = {}
function TplinkMinifs.BodyV3.property.has_8_byte_lzma_metas:get()
  if self._m_has_8_byte_lzma_metas ~= nil then
    return self._m_has_8_byte_lzma_metas
  end

  self._m_has_8_byte_lzma_metas = self.len_first_blob_uncompressed_if_8_byte_metas == 0xffffffffffffffff
  return self._m_has_8_byte_lzma_metas
end

-- 
-- The uncompressed size in the `.lzma` header of the first blob, if
-- `lzma_metas` have 8-byte records. It follows the properties byte and the
-- 4-byte dictionary size.
TplinkMinifs.BodyV3.property.len_first_blob_uncompressed_if_8_byte_metas = {}
function TplinkMinifs.BodyV3.property.len_first_blob_uncompressed_if_8_byte_metas:get()
  if self._m_len_first_blob_uncompressed_if_8_byte_metas ~= nil then
    return self._m_len_first_blob_uncompressed_if_8_byte_metas
  end

  local _pos = self._io:pos()
  self._io:seek((self.ofs_lzma_metas + 8 * self.num_lzma_blobs) + 5)
  self._m_len_first_blob_uncompressed_if_8_byte_metas = self._io:read_u8le()
  self._io:seek(_pos)
  return self._m_len_first_blob_uncompressed_if_8_byte_metas
end

-- 
-- The size of each record in `lzma_metas` (8 or 12 bytes).
TplinkMinifs.BodyV3.property.len_lzma_meta = {}
function TplinkMinifs.BodyV3.property.len_lzma_meta:get()
  if self._m_len_lzma_meta ~= nil then
    return self._m_len_lzma_meta
  end

  self._m_len_lzma_meta = utils.box_unwrap((self.has_8_byte_lzma_metas) and utils.box_wrap(8) or (12))
  return self._m_len_lzma_meta
end

-- 
-- Count starts at 0, so there is one more blob than the highest blob number.
-- See also: Source (https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L129-L130)
TplinkMinifs.BodyV3.property.num_lzma_blobs = {}
function TplinkMinifs.BodyV3.property.num_lzma_blobs:get()
  if self._m_num_lzma_blobs ~= nil then
    return self._m_num_lzma_blobs
  end

  self._m_num_lzma_blobs = self.inodes[#self.inodes].cur_max_lzma_blob + 1
  return self._m_num_lzma_blobs
end

TplinkMinifs.BodyV3.property.ofs_lzma_metas = {}
function TplinkMinifs.BodyV3.property.ofs_lzma_metas:get()
  if self._m_ofs_lzma_metas ~= nil then
    return self._m_ofs_lzma_metas
  end

  self._m_ofs_lzma_metas = self._io:pos()
  return self._m_ofs_lzma_metas
end


TplinkMinifs.Dummy = class.class(KaitaiStruct)

function TplinkMinifs.Dummy:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function TplinkMinifs.Dummy:_read()
end


-- 
-- See also: Source (https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py#L41-L52)
TplinkMinifs.FileV2 = class.class(KaitaiStruct)

function TplinkMinifs.FileV2:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function TplinkMinifs.FileV2:_read()
  self.path_md5 = self._io:read_bytes(16)
  self.len_data = self._io:read_u4be()
  self.ofs_data = self._io:read_u4be()
  if not(self.ofs_data == self._io:pos() + 8) then
    error("not equal, expected " .. (self._io:pos() + 8) .. ", but got " .. self.ofs_data)
  end
  self.len_data_uncompressed = self._io:read_u4be()
  self.compression = TplinkMinifs.CompressionType(self._io:read_u4be())
  self.data = self._io:read_bytes(self.len_data)
end

-- 
-- The MD5 hash of the absolute path of the file, e.g. of
-- `/conf/priv-key.pem`.
-- 
-- Version 2 images store only these hashes, not the paths, so a path can
-- only be found by hashing candidate paths and comparing.
-- [`Minifs.py`](https://github.com/zh-explorer/tp_research/blob/a42f9d0427ad0c453a7060f3236c4174bb883441/Minifs.py#L181-L209)
-- takes the candidates from path-like strings in the files' contents.
-- 
-- Offset of `data` relative to the start of `<body_v2>.files_area`.
-- 
-- With `compression_type::lzma`, an LZMA stream in the `.lzma` format
-- (also known as LZMA_Alone). Decompress it in the same way as
-- `<lzma_meta>.blob`.
-- 
-- In all images examined, the `.lzma` header specifies the properties
-- lc = 0, lp = 0, pb = 2 and an 8 MiB dictionary, so it starts with the
-- bytes `5A 00 00 80 00`. It also specifies the uncompressed size of the
-- stream, and there is no end-of-payload marker.

TplinkMinifs.FilesAreaV2 = class.class(KaitaiStruct)

function TplinkMinifs.FilesAreaV2:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function TplinkMinifs.FilesAreaV2:_read()
  self.files = {}
  for i = 0, self._root.header.num_files - 1 do
    self.files[i + 1] = TplinkMinifs.FileV2(self._io, self, self._root)
  end
end


-- 
-- See also: Source (https://arxiv.org/html/2407.05064v1#S4.SS3)
-- See also: Source (https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L36-L42)
TplinkMinifs.Inode = class.class(KaitaiStruct)

function TplinkMinifs.Inode:_init(prev_max_lzma_blob, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self.prev_max_lzma_blob = prev_max_lzma_blob
  self:_read()
end

function TplinkMinifs.Inode:_read()
  self.ofs_directory_path = self._io:read_u4be()
  self.ofs_file_name = self._io:read_u4be()
  self.lzma_blob = self._io:read_u4be()
  self.ofs_file = self._io:read_u4be()
  self.len_file = self._io:read_u4be()
end

TplinkMinifs.Inode.property.cur_max_lzma_blob = {}
function TplinkMinifs.Inode.property.cur_max_lzma_blob:get()
  if self._m_cur_max_lzma_blob ~= nil then
    return self._m_cur_max_lzma_blob
  end

  self._m_cur_max_lzma_blob = utils.box_unwrap((self.lzma_blob > self.prev_max_lzma_blob) and utils.box_wrap(self.lzma_blob) or (self.prev_max_lzma_blob))
  return self._m_cur_max_lzma_blob
end

TplinkMinifs.Inode.property.directory_path = {}
function TplinkMinifs.Inode.property.directory_path:get()
  if self._m_directory_path ~= nil then
    return self._m_directory_path
  end

  local _io = self._parent.name_table._io
  local _pos = _io:pos()
  _io:seek(self.ofs_directory_path)
  self._m_directory_path = str_decode.decode(_io:read_bytes_term(0, false, true, true), "ASCII")
  _io:seek(_pos)
  return self._m_directory_path
end

TplinkMinifs.Inode.property.file_name = {}
function TplinkMinifs.Inode.property.file_name:get()
  if self._m_file_name ~= nil then
    return self._m_file_name
  end

  local _io = self._parent.name_table._io
  local _pos = _io:pos()
  _io:seek(self.ofs_file_name)
  self._m_file_name = str_decode.decode(_io:read_bytes_term(0, false, true, true), "ASCII")
  _io:seek(_pos)
  return self._m_file_name
end


TplinkMinifs.InodeV1 = class.class(KaitaiStruct)

function TplinkMinifs.InodeV1:_init(prev_ofs_end, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self.prev_ofs_end = prev_ofs_end
  self:_read()
end

function TplinkMinifs.InodeV1:_read()
  self.path = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(80), 0, false), "ASCII")
  self.len_blob = self._io:read_u4be()
  self.ofs_blob = self._io:read_u4be()
  if not(self.ofs_blob == self.prev_ofs_end) then
    error("not equal, expected " .. self.prev_ofs_end .. ", but got " .. self.ofs_blob)
  end
end

-- 
-- An LZMA stream in the `.lzma` format (also known as LZMA_Alone) with
-- the contents of the file. Decompress it in the same way as
-- `<lzma_meta>.blob`.
-- 
-- In all images examined, the `.lzma` header specifies the properties
-- lc = 0, lp = 0, pb = 2 and an 8 MiB dictionary, so it starts with the
-- bytes `5A 00 00 80 00`. It also specifies the uncompressed size of the
-- stream, and there is no end-of-payload marker.
TplinkMinifs.InodeV1.property.blob = {}
function TplinkMinifs.InodeV1.property.blob:get()
  if self._m_blob ~= nil then
    return self._m_blob
  end

  local _io = self._parent.blobs_area._io
  local _pos = _io:pos()
  _io:seek(self.ofs_blob)
  self._m_blob = _io:read_bytes(self.len_blob)
  _io:seek(_pos)
  return self._m_blob
end

TplinkMinifs.InodeV1.property.ofs_end = {}
function TplinkMinifs.InodeV1.property.ofs_end:get()
  if self._m_ofs_end ~= nil then
    return self._m_ofs_end
  end

  self._m_ofs_end = self.ofs_blob + self.len_blob
  return self._m_ofs_end
end

-- 
-- Relative to the start of `<body_v1>.blobs_area`.

-- 
-- See also: Source (https://arxiv.org/html/2407.05064v1#S4.SS4)
-- See also: Source (https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L44-L48)
TplinkMinifs.LzmaMeta = class.class(KaitaiStruct)

function TplinkMinifs.LzmaMeta:_init(prev_ofs_end, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self.prev_ofs_end = prev_ofs_end
  self:_read()
end

function TplinkMinifs.LzmaMeta:_read()
  self.ofs_blob = self._io:read_u4be()
  if not(self.ofs_blob == self.prev_ofs_end) then
    error("not equal, expected " .. self.prev_ofs_end .. ", but got " .. self.ofs_blob)
  end
  self.len_blob = self._io:read_u4be()
  if not(self._parent.has_8_byte_lzma_metas) then
    self.len_blob_uncompressed = self._io:read_u4be()
  end
end

-- 
-- An LZMA stream in the `.lzma` format (also known as LZMA_Alone):
-- a 13-byte header followed by the compressed data. Decompress it
-- with a ready-made LZMA decoder that reads this header, e.g. in
-- Python with `lzma.decompress(blob, format=lzma.FORMAT_ALONE)`. The
-- size of the decompressed data is `len_blob_uncompressed`, if present.
-- 
-- In all images examined with `header.version` = 3, the `.lzma` header
-- specifies the properties lc = 3, lp = 0, pb = 2 and an 8 MiB
-- dictionary, so it starts with the bytes `5D 00 00 80 00`. The
-- uncompressed size in the header is unknown (`0xFFFF_FFFF_FFFF_FFFF`),
-- so the stream ends with an end-of-payload marker.
-- See also: Source (https://arxiv.org/html/2407.05064v1#S4.SS5)
-- See also: Source (https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L175-L187)
TplinkMinifs.LzmaMeta.property.blob = {}
function TplinkMinifs.LzmaMeta.property.blob:get()
  if self._m_blob ~= nil then
    return self._m_blob
  end

  local _io = self._parent.lzma_blobs_area._io
  local _pos = _io:pos()
  _io:seek(self.ofs_blob)
  self._m_blob = _io:read_bytes(self.len_blob)
  _io:seek(_pos)
  return self._m_blob
end

TplinkMinifs.LzmaMeta.property.ofs_end = {}
function TplinkMinifs.LzmaMeta.property.ofs_end:get()
  if self._m_ofs_end ~= nil then
    return self._m_ofs_end
  end

  self._m_ofs_end = self.ofs_blob + self.len_blob
  return self._m_ofs_end
end


-- 
-- See also: Source (https://arxiv.org/html/2407.05064v1#S4.SS1)
-- See also: Source (https://github.com/onekey-sec/unblob/blob/678dbce13dcabe3b4ff16b2b958d6f2cfce9ae3f/python/unblob/handlers/filesystem/minifs.py#L27-L34)
TplinkMinifs.MinifsHeader = class.class(KaitaiStruct)

function TplinkMinifs.MinifsHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function TplinkMinifs.MinifsHeader:_read()
  self.magic = self._io:read_bytes(16)
  if not(self.magic == "\077\073\078\073\070\083\000\000\000\000\000\000\000\000\000\000") then
    error("not equal, expected " .. "\077\073\078\073\070\083\000\000\000\000\000\000\000\000\000\000" .. ", but got " .. self.magic)
  end
  self.version = self._io:read_u4be()
  if not( ((self.version == 1) or (self.version == 2) or (self.version == 3)) ) then
    error("ValidationNotAnyOfError")
  end
  self.num_files = self._io:read_u4be()
  self.len_largest_file = self._io:read_u4be()
end

-- 
-- The uncompressed size of the largest file. In all images examined with
-- version 3, the inodes are sorted by size in descending order, so it is
-- also the size of the first file. In all images examined with versions
-- 1 and 2, the value is rounded up to a multiple of 4.

-- 
-- Table of null-terminated directory paths and file names, referenced by
-- `<inode>.ofs_directory_path` and `<inode>.ofs_file_name`. In all images
-- examined, each non-empty string occurs only once, which saves space in
-- flash memory, as many files share a directory or a name.
-- 
-- In all images examined, the table is padded with null bytes to a multiple
-- of 4 bytes, so `names` can end with up to 3 empty strings (one for each
-- padding byte).
-- See also: Source (https://arxiv.org/html/2407.05064v1#S4.SS2)
TplinkMinifs.NameTable = class.class(KaitaiStruct)

function TplinkMinifs.NameTable:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function TplinkMinifs.NameTable:_read()
  self.names = {}
  local i = 0
  while not self._io:is_eof() do
    self.names[i + 1] = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ASCII")
    i = i + 1
  end
end



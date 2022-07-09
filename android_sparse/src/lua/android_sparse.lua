-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local utils = require("utils")

-- 
-- The Android sparse format is a format to more efficiently store files
-- for for example firmware updates to save on bandwidth. Files in sparse
-- format first have to be converted back to their original format.
-- 
-- A tool to create images for testing can be found in the Android source code tree:
-- 
-- <https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse> - `img2simg.c`
-- 
-- Note: this is not the same as the Android sparse data image format.
-- See also: Source (https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_format.h)
-- See also: Source (https://source.android.com/devices/bootloader/images#sparse-image-format)
AndroidSparse = class.class(KaitaiStruct)

AndroidSparse.ChunkTypes = enum.Enum {
  raw = 51905,
  fill = 51906,
  dont_care = 51907,
  crc32 = 51908,
}

function AndroidSparse:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidSparse:_read()
  self.header_prefix = AndroidSparse.FileHeaderPrefix(self._io, self, self._root)
  self._raw_header = self._io:read_bytes((self.header_prefix.len_header - 10))
  local _io = KaitaiStream(stringstream(self._raw_header))
  self.header = AndroidSparse.FileHeader(_io, self, self._root)
  self.chunks = {}
  for i = 0, self.header.num_chunks - 1 do
    self.chunks[i + 1] = AndroidSparse.Chunk(self._io, self, self._root)
  end
end

-- 
-- internal; access `_root.header` instead.

AndroidSparse.FileHeaderPrefix = class.class(KaitaiStruct)

function AndroidSparse.FileHeaderPrefix:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidSparse.FileHeaderPrefix:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\058\255\038\237") then
    error("not equal, expected " ..  "\058\255\038\237" .. ", but got " .. self.magic)
  end
  self.version = AndroidSparse.Version(self._io, self, self._root)
  self.len_header = self._io:read_u2le()
end

-- 
-- internal; access `_root.header.version` instead.
-- 
-- internal; access `_root.header.len_header` instead.

AndroidSparse.FileHeader = class.class(KaitaiStruct)

function AndroidSparse.FileHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidSparse.FileHeader:_read()
  self.len_chunk_header = self._io:read_u2le()
  self.block_size = self._io:read_u4le()
  local _ = self.block_size
  if not((_ % 4) == 0) then
    error("ValidationExprError")
  end
  self.num_blocks = self._io:read_u4le()
  self.num_chunks = self._io:read_u4le()
  self.checksum = self._io:read_u4le()
end

AndroidSparse.FileHeader.property.version = {}
function AndroidSparse.FileHeader.property.version:get()
  if self._m_version ~= nil then
    return self._m_version
  end

  self._m_version = self._root.header_prefix.version
  return self._m_version
end

-- 
-- size of file header, should be 28.
AndroidSparse.FileHeader.property.len_header = {}
function AndroidSparse.FileHeader.property.len_header:get()
  if self._m_len_header ~= nil then
    return self._m_len_header
  end

  self._m_len_header = self._root.header_prefix.len_header
  return self._m_len_header
end

-- 
-- size of chunk header, should be 12.
-- 
-- block size in bytes, must be a multiple of 4.
-- 
-- blocks in the original data.
-- 
-- CRC32 checksum of the original data
-- 
-- In practice always 0; if checksum writing is requested, a CRC32 chunk is written
-- at the end of the file instead. The canonical `libsparse` implementation does this
-- and other implementations tend to follow it, see
-- <https://gitlab.com/teskje/android-sparse-rs/-/blob/57c2577/src/write.rs#L112-114>

AndroidSparse.Chunk = class.class(KaitaiStruct)

function AndroidSparse.Chunk:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidSparse.Chunk:_read()
  self._raw_header = self._io:read_bytes(self._root.header.len_chunk_header)
  local _io = KaitaiStream(stringstream(self._raw_header))
  self.header = AndroidSparse.Chunk.ChunkHeader(_io, self, self._root)
  local _on = self.header.chunk_type
  if _on == AndroidSparse.ChunkTypes.crc32 then
    self.body = self._io:read_u4le()
  else
    self.body = self._io:read_bytes(self.header.len_body)
  end
end


AndroidSparse.Chunk.ChunkHeader = class.class(KaitaiStruct)

function AndroidSparse.Chunk.ChunkHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidSparse.Chunk.ChunkHeader:_read()
  self.chunk_type = AndroidSparse.ChunkTypes(self._io:read_u2le())
  self.reserved1 = self._io:read_u2le()
  self.num_body_blocks = self._io:read_u4le()
  self.len_chunk = self._io:read_u4le()
  if not(self.len_chunk == utils.box_unwrap((self.len_body_expected ~= -1) and utils.box_wrap((self._root.header.len_chunk_header + self.len_body_expected)) or (self.len_chunk))) then
    error("not equal, expected " ..  utils.box_unwrap((self.len_body_expected ~= -1) and utils.box_wrap((self._root.header.len_chunk_header + self.len_body_expected)) or (self.len_chunk)) .. ", but got " .. self.len_chunk)
  end
end

AndroidSparse.Chunk.ChunkHeader.property.len_body = {}
function AndroidSparse.Chunk.ChunkHeader.property.len_body:get()
  if self._m_len_body ~= nil then
    return self._m_len_body
  end

  self._m_len_body = (self.len_chunk - self._root.header.len_chunk_header)
  return self._m_len_body
end

-- 
-- See also: Source (https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#184)
-- See also: Source (https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#215)
-- See also: Source (https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#249)
-- See also: Source (https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#270)
AndroidSparse.Chunk.ChunkHeader.property.len_body_expected = {}
function AndroidSparse.Chunk.ChunkHeader.property.len_body_expected:get()
  if self._m_len_body_expected ~= nil then
    return self._m_len_body_expected
  end

  self._m_len_body_expected = utils.box_unwrap((self.chunk_type == AndroidSparse.ChunkTypes.raw) and utils.box_wrap((self._root.header.block_size * self.num_body_blocks)) or (utils.box_unwrap((self.chunk_type == AndroidSparse.ChunkTypes.fill) and utils.box_wrap(4) or (utils.box_unwrap((self.chunk_type == AndroidSparse.ChunkTypes.dont_care) and utils.box_wrap(0) or (utils.box_unwrap((self.chunk_type == AndroidSparse.ChunkTypes.crc32) and utils.box_wrap(4) or (-1))))))))
  return self._m_len_body_expected
end

-- 
-- size of the chunk body in blocks in output image.
-- 
-- in bytes of chunk input file including chunk header and data.

AndroidSparse.Version = class.class(KaitaiStruct)

function AndroidSparse.Version:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidSparse.Version:_read()
  self.major = self._io:read_u2le()
  if not(self.major == 1) then
    error("not equal, expected " ..  1 .. ", but got " .. self.major)
  end
  self.minor = self._io:read_u2le()
end



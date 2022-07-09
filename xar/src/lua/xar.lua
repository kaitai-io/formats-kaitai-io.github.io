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
-- From [Wikipedia](https://en.wikipedia.org/wiki/Xar_(archiver)):
-- 
-- "XAR (short for eXtensible ARchive format) is an open source file archiver
-- and the archiver's file format. It was created within the OpenDarwin project
-- and is used in macOS X 10.5 and up for software installation routines, as
-- well as browser extensions in Safari 5.0 and up."
-- See also: Source (https://github.com/mackyle/xar/wiki/xarformat)
Xar = class.class(KaitaiStruct)

Xar.ChecksumAlgorithmsApple = enum.Enum {
  none = 0,
  sha1 = 1,
  md5 = 2,
  sha256 = 3,
  sha512 = 4,
}

function Xar:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Xar:_read()
  self.header_prefix = Xar.FileHeaderPrefix(self._io, self, self._root)
  self._raw_header = self._io:read_bytes((self.header_prefix.len_header - 6))
  local _io = KaitaiStream(stringstream(self._raw_header))
  self.header = Xar.FileHeader(_io, self, self._root)
  self._raw__raw_toc = self._io:read_bytes(self.header.len_toc_compressed)
  self._raw_toc = KaitaiStream.process_zlib(self._raw__raw_toc)
  local _io = KaitaiStream(stringstream(self._raw_toc))
  self.toc = Xar.TocType(_io, self, self._root)
end

-- 
-- See also: Source (https://github.com/mackyle/xar/blob/66d451d/xar/include/xar.h.in#L85)
Xar.property.checksum_algorithm_other = {}
function Xar.property.checksum_algorithm_other:get()
  if self._m_checksum_algorithm_other ~= nil then
    return self._m_checksum_algorithm_other
  end

  self._m_checksum_algorithm_other = 3
  return self._m_checksum_algorithm_other
end

-- 
-- internal; access `_root.header` instead.
-- 
-- zlib compressed XML further describing the content of the archive.

Xar.FileHeaderPrefix = class.class(KaitaiStruct)

function Xar.FileHeaderPrefix:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Xar.FileHeaderPrefix:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\120\097\114\033") then
    error("not equal, expected " ..  "\120\097\114\033" .. ", but got " .. self.magic)
  end
  self.len_header = self._io:read_u2be()
end

-- 
-- internal; access `_root.header.len_header` instead.

Xar.FileHeader = class.class(KaitaiStruct)

function Xar.FileHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Xar.FileHeader:_read()
  self.version = self._io:read_u2be()
  if not(self.version == 1) then
    error("not equal, expected " ..  1 .. ", but got " .. self.version)
  end
  self.len_toc_compressed = self._io:read_u8be()
  self.toc_length_uncompressed = self._io:read_u8be()
  self.checksum_algorithm_int = self._io:read_u4be()
  if self.has_checksum_alg_name then
    self.checksum_alg_name = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes_full(), 0, false), "UTF-8")
    local _ = self.checksum_alg_name
    if not( ((_ ~= "") and (_ ~= "none")) ) then
      error("ValidationExprError")
    end
  end
end

-- 
-- If it is not
-- 
-- * `""` (empty string), indicating an unknown integer value (access
--   `checksum_algorithm_int` for debugging purposes to find out
--   what that value is), or
-- * `"none"`, indicating that the TOC checksum is not provided (in that
--   case, the `<checksum>` property or its `style` attribute should be
--   missing, or the `style` attribute must be set to `"none"`),
-- 
-- it must exactly match the `style` attribute value of the
-- `<checksum>` property in the root node `<toc>`. See
-- <https://github.com/mackyle/xar/blob/66d451d/xar/lib/archive.c#L345-L371>
-- for reference.
-- 
-- The `xar` (eXtensible ARchiver) program [uses OpenSSL's function
-- `EVP_get_digestbyname`](
--   https://github.com/mackyle/xar/blob/66d451d/xar/lib/archive.c#L328
-- ) to verify this value (if it's not `""` or `"none"`, of course).
-- So it's reasonable to assume that this can only have one of the values
-- that OpenSSL recognizes.
Xar.FileHeader.property.checksum_algorithm_name = {}
function Xar.FileHeader.property.checksum_algorithm_name:get()
  if self._m_checksum_algorithm_name ~= nil then
    return self._m_checksum_algorithm_name
  end

  self._m_checksum_algorithm_name = utils.box_unwrap((self.has_checksum_alg_name) and utils.box_wrap(self.checksum_alg_name) or (utils.box_unwrap((self.checksum_algorithm_int == Xar.ChecksumAlgorithmsApple.none.value) and utils.box_wrap("none") or (utils.box_unwrap((self.checksum_algorithm_int == Xar.ChecksumAlgorithmsApple.sha1.value) and utils.box_wrap("sha1") or (utils.box_unwrap((self.checksum_algorithm_int == Xar.ChecksumAlgorithmsApple.md5.value) and utils.box_wrap("md5") or (utils.box_unwrap((self.checksum_algorithm_int == Xar.ChecksumAlgorithmsApple.sha256.value) and utils.box_wrap("sha256") or (utils.box_unwrap((self.checksum_algorithm_int == Xar.ChecksumAlgorithmsApple.sha512.value) and utils.box_wrap("sha512") or (""))))))))))))
  return self._m_checksum_algorithm_name
end

Xar.FileHeader.property.has_checksum_alg_name = {}
function Xar.FileHeader.property.has_checksum_alg_name:get()
  if self._m_has_checksum_alg_name ~= nil then
    return self._m_has_checksum_alg_name
  end

  self._m_has_checksum_alg_name =  ((self.checksum_algorithm_int == self._root.checksum_algorithm_other) and (self.len_header >= 32) and ((self.len_header % 4) == 0)) 
  return self._m_has_checksum_alg_name
end

Xar.FileHeader.property.len_header = {}
function Xar.FileHeader.property.len_header:get()
  if self._m_len_header ~= nil then
    return self._m_len_header
  end

  self._m_len_header = self._root.header_prefix.len_header
  return self._m_len_header
end

-- 
-- internal; access `checksum_algorithm_name` instead.
-- 
-- internal; access `checksum_algorithm_name` instead.

Xar.TocType = class.class(KaitaiStruct)

function Xar.TocType:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Xar.TocType:_read()
  self.xml_string = str_decode.decode(self._io:read_bytes_full(), "UTF-8")
end



-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")

-- 
-- Gzip is a popular and standard single-file archiving format. It
-- essentially provides a container that stores original file name,
-- timestamp and a few other things (like optional comment), basic
-- CRCs, etc, and a file compressed by a chosen compression algorithm.
-- 
-- As of 2019, there is actually only one working solution for
-- compression algorithms, so it's typically raw DEFLATE stream
-- (without zlib header) in all gzipped files.
-- See also: Source (https://tools.ietf.org/html/rfc1952)
Gzip = class.class(KaitaiStruct)

Gzip.CompressionMethods = enum.Enum {
  deflate = 8,
}

Gzip.Oses = enum.Enum {
  fat = 0,
  amiga = 1,
  vms = 2,
  unix = 3,
  vm_cms = 4,
  atari_tos = 5,
  hpfs = 6,
  macintosh = 7,
  z_system = 8,
  cp_m = 9,
  tops_20 = 10,
  ntfs = 11,
  qdos = 12,
  acorn_riscos = 13,
  unknown = 255,
}

function Gzip:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gzip:_read()
  self.magic = self._io:read_bytes(2)
  if not(self.magic == "\031\139") then
    error("not equal, expected " ..  "\031\139" .. ", but got " .. self.magic)
  end
  self.compression_method = Gzip.CompressionMethods(self._io:read_u1())
  self.flags = Gzip.Flags(self._io, self, self._root)
  self.mod_time = self._io:read_u4le()
  local _on = self.compression_method
  if _on == Gzip.CompressionMethods.deflate then
    self.extra_flags = Gzip.ExtraFlagsDeflate(self._io, self, self._root)
  end
  self.os = Gzip.Oses(self._io:read_u1())
  if self.flags.has_extra then
    self.extras = Gzip.Extras(self._io, self, self._root)
  end
  if self.flags.has_name then
    self.name = self._io:read_bytes_term(0, false, true, true)
  end
  if self.flags.has_comment then
    self.comment = self._io:read_bytes_term(0, false, true, true)
  end
  if self.flags.has_header_crc then
    self.header_crc16 = self._io:read_u2le()
  end
  self.body = self._io:read_bytes(((self._io:size() - self._io:pos()) - 8))
  self.body_crc32 = self._io:read_u4le()
  self.len_uncompressed = self._io:read_u4le()
end

-- 
-- Compression method used to compress file body. In practice, only
-- one method is widely used: 8 = deflate.
-- 
-- Last modification time of a file archived in UNIX timestamp format.
-- 
-- Extra flags, specific to compression method chosen.
-- 
-- OS used to compress this file.
-- 
-- Compressed body of a file archived. Note that we don't make an
-- attempt to decompress it here.
-- 
-- CRC32 checksum of an uncompressed file body
-- 
-- Size of original uncompressed data in bytes (truncated to 32
-- bits).

Gzip.Flags = class.class(KaitaiStruct)

function Gzip.Flags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gzip.Flags:_read()
  self.reserved1 = self._io:read_bits_int_be(3)
  self.has_comment = self._io:read_bits_int_be(1)
  self.has_name = self._io:read_bits_int_be(1)
  self.has_extra = self._io:read_bits_int_be(1)
  self.has_header_crc = self._io:read_bits_int_be(1)
  self.is_text = self._io:read_bits_int_be(1)
end

-- 
-- If true, optional extra fields are present in the archive.
-- 
-- If true, this archive includes a CRC16 checksum for the header.
-- 
-- If true, file inside this archive is a text file from
-- compressor's point of view.

Gzip.ExtraFlagsDeflate = class.class(KaitaiStruct)

Gzip.ExtraFlagsDeflate.CompressionStrengths = enum.Enum {
  best = 2,
  fast = 4,
}

function Gzip.ExtraFlagsDeflate:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gzip.ExtraFlagsDeflate:_read()
  self.compression_strength = Gzip.ExtraFlagsDeflate.CompressionStrengths(self._io:read_u1())
end


-- 
-- Container for many subfields, constrained by size of stream.
Gzip.Subfields = class.class(KaitaiStruct)

function Gzip.Subfields:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gzip.Subfields:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = Gzip.Subfield(self._io, self, self._root)
    i = i + 1
  end
end


-- 
-- Every subfield follows typical [TLV scheme](https://en.wikipedia.org/wiki/Type-length-value):
-- 
-- * `id` serves role of "T"ype
-- * `len_data` serves role of "L"ength
-- * `data` serves role of "V"alue
-- 
-- This way it's possible to for arbitrary parser to skip over
-- subfields it does not support.
Gzip.Subfield = class.class(KaitaiStruct)

function Gzip.Subfield:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gzip.Subfield:_read()
  self.id = self._io:read_u2le()
  self.len_data = self._io:read_u2le()
  self.data = self._io:read_bytes(self.len_data)
end

-- 
-- Subfield ID, typically two ASCII letters.

Gzip.Extras = class.class(KaitaiStruct)

function Gzip.Extras:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Gzip.Extras:_read()
  self.len_subfields = self._io:read_u2le()
  self._raw_subfields = self._io:read_bytes(self.len_subfields)
  local _io = KaitaiStream(stringstream(self._raw_subfields))
  self.subfields = Gzip.Subfields(_io, self, self._root)
end



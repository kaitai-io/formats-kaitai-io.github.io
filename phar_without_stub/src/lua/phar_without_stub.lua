-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("php_serialized_value")
local enum = require("enum")
local stringstream = require("string_stream")

-- 
-- A phar (PHP archive) file. The phar format is a custom archive format
-- from the PHP ecosystem that is used to package a complete PHP library
-- or application into a single self-contained archive.
-- All phar archives start with an executable PHP stub, which can be used to
-- allow executing or including phar files as if they were regular PHP scripts.
-- PHP 5.3 and later include the phar extension, which adds native support for
-- reading and manipulating phar files.
-- 
-- The phar format was originally developed as part of the PEAR library
-- PHP_Archive, first released in 2005. Later, a native PHP extension
-- named "phar" was developed, which was first released on PECL in 2007,
-- and is included with PHP 5.3 and later. The phar extension has effectively
-- superseded the PHP_Archive library, which has not been updated since 2010.
-- The phar extension is also no longer released independently on PECL;
-- it is now developed and released as part of PHP itself.
-- 
-- Because of current limitations in Kaitai Struct
-- (seekaitai-io/kaitai_struct#158 and kaitai-io/kaitai_struct#538),
-- the executable PHP stub that precedes the rest of the archive is not handled
-- by this spec. Before parsing a phar using this spec, the stub must be
-- removed manually.
-- 
-- A phar's stub is terminated by the special token `__HALT_COMPILER();`
-- (which may be followed by at most one space, the PHP tag end `?>`,
-- and an optional line terminator). The stub termination sequence is
-- immediately followed by the remaining parts of the phar format,
-- as described in this spec.
-- 
-- The phar stub usually contains code that loads the phar and runs
-- a contained PHP file, but this is not required. A minimal valid phar stub
-- is `<?php __HALT_COMPILER();` - such a stub makes it impossible to execute
-- the phar directly, but still allows loading or manipulating it using the
-- phar extension.
-- 
-- Note: The phar format does not specify any encoding for text fields
-- (stub, alias name, and all file names), so these fields may contain arbitrary
-- binary data. The actual text encoding used in a specific phar file usually
-- depends on the application that created the phar, and on the
-- standard encoding of the system on which the phar was created.
-- See also: Source (https://www.php.net/manual/en/phar.fileformat.php)
-- See also: Source (https://github.com/php/php-src/tree/master/ext/phar)
-- See also: Source (https://svn.php.net/viewvc/pecl/phar/)
-- See also: Source (https://svn.php.net/viewvc/pear/packages/PHP_Archive/)
PharWithoutStub = class.class(KaitaiStruct)

PharWithoutStub.SignatureType = enum.Enum {
  md5 = 1,
  sha1 = 2,
  sha256 = 4,
  sha512 = 8,
  openssl = 16,
}

function PharWithoutStub:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function PharWithoutStub:_read()
  self.manifest = PharWithoutStub.Manifest(self._io, self, self._root)
  self.files = {}
  for i = 0, self.manifest.num_files - 1 do
    self.files[i + 1] = self._io:read_bytes(self.manifest.file_entries[i + 1].len_data_compressed)
  end
  if self.manifest.flags.has_signature then
    self._raw_signature = self._io:read_bytes_full()
    local _io = KaitaiStream(stringstream(self._raw_signature))
    self.signature = PharWithoutStub.Signature(_io, self, self._root)
  end
end

-- 
-- The archive's manifest, containing general metadata about the archive
-- and its files.
-- 
-- The contents of each file in the archive (possibly compressed,
-- as indicated by the file's flags in the manifest). The files are stored
-- in the same order as they appear in the manifest.
-- 
-- The archive's signature - a digest of all archive data before
-- the signature itself.
-- 
-- Note: Almost all of the available "signature" types are actually hashes,
-- not signatures, and cannot be used to verify that the archive has not
-- been tampered with. Only the OpenSSL signature type is a true
-- cryptographic signature.

-- 
-- A phar API version number. This version number is meant to indicate
-- which features are used in a specific phar, so that tools reading
-- the phar can easily check that they support all necessary features.
-- 
-- The following API versions exist so far:
-- 
-- * 0.5, 0.6, 0.7, 0.7.1: The first official API versions. At this point,
--   the phar format was only used by the PHP_Archive library, and the
--   API version numbers were identical to the PHP_Archive versions that
--   supported them. Development of the native phar extension started around
--   API version 0.7. These API versions could only be queried using the
--   `PHP_Archive::APIversion()` method, but were not stored physically
--   in archives. These API versions are not supported by this spec.
-- * 0.8.0: Used by PHP_Archive 0.8.0 (released 2006-07-18) and
--   later development versions of the phar extension. This is the first
--   version number to be physically stored in archives. This API version
--   is not supported by this spec.
-- * 0.9.0: Used by later development/early beta versions of the
--   phar extension. Also temporarily used by PHP_Archive 0.9.0
--   (released 2006-12-15), but reverted back to API version 0.8.0 in
--   PHP_Archive 0.9.1 (released 2007-01-05).
-- * 1.0.0: Supported since PHP_Archive 0.10.0 (released 2007-05-29)
--   and phar extension 1.0.0 (released 2007-03-28). This is the first
--   stable, forwards-compatible and documented version of the format.
-- * 1.1.0: Supported since PHP_Archive 0.12.0 (released 2015-07-06)
--   and phar extension 1.1.0 (released 2007-04-12). Adds SHA-256 and
--   SHA-512 signature types.
-- * 1.1.1: Supported since phar extension 2.0.0 (released 2009-07-29 and
--   included with PHP 5.3 and later). (PHP_Archive 0.12.0 also supports
--   all features from API verison 1.1.1, but it reports API version 1.1.0.)
--   Adds the OpenSSL signature type and support for storing
--   empty directories.
PharWithoutStub.ApiVersion = class.class(KaitaiStruct)

function PharWithoutStub.ApiVersion:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function PharWithoutStub.ApiVersion:_read()
  self.release = self._io:read_bits_int_be(4)
  self.major = self._io:read_bits_int_be(4)
  self.minor = self._io:read_bits_int_be(4)
  self.unused = self._io:read_bits_int_be(4)
end


PharWithoutStub.FileEntry = class.class(KaitaiStruct)

function PharWithoutStub.FileEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function PharWithoutStub.FileEntry:_read()
  self.len_filename = self._io:read_u4le()
  self.filename = self._io:read_bytes(self.len_filename)
  self.len_data_uncompressed = self._io:read_u4le()
  self.timestamp = self._io:read_u4le()
  self.len_data_compressed = self._io:read_u4le()
  self.crc32 = self._io:read_u4le()
  self.flags = PharWithoutStub.FileFlags(self._io, self, self._root)
  self.len_metadata = self._io:read_u4le()
  if self.len_metadata ~= 0 then
    self._raw_metadata = self._io:read_bytes(self.len_metadata)
    local _io = KaitaiStream(stringstream(self._raw_metadata))
    self.metadata = PharWithoutStub.SerializedValue(_io, self, self._root)
  end
end

-- 
-- The length of the file name, in bytes.
-- 
-- The name of this file. If the name ends with a slash, this entry
-- represents a directory, otherwise a regular file. Directory entries
-- are supported since phar API version 1.1.1.
-- (Explicit directory entries are only needed for empty directories.
-- Non-empty directories are implied by the files located inside them.)
-- 
-- The length of the file's data when uncompressed, in bytes.
-- 
-- The time at which the file was added or last updated, as a
-- Unix timestamp.
-- 
-- The length of the file's data when compressed, in bytes.
-- 
-- The CRC32 checksum of the file's uncompressed data.
-- 
-- Flags for this file.
-- 
-- The length of the metadata, in bytes, or 0 if there is none.
-- 
-- Metadata for this file, in the format used by PHP's
-- `serialize` function. The meaning of the serialized data is not
-- specified further, it may be used to store arbitrary custom data
-- about the file.

PharWithoutStub.FileFlags = class.class(KaitaiStruct)

function PharWithoutStub.FileFlags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function PharWithoutStub.FileFlags:_read()
  self.value = self._io:read_u4le()
end

-- 
-- Whether this file's data is stored using bzip2 compression.
PharWithoutStub.FileFlags.property.bzip2_compressed = {}
function PharWithoutStub.FileFlags.property.bzip2_compressed:get()
  if self._m_bzip2_compressed ~= nil then
    return self._m_bzip2_compressed
  end

  self._m_bzip2_compressed = self.value & 8192 ~= 0
  return self._m_bzip2_compressed
end

-- 
-- The file's permission bits.
PharWithoutStub.FileFlags.property.permissions = {}
function PharWithoutStub.FileFlags.property.permissions:get()
  if self._m_permissions ~= nil then
    return self._m_permissions
  end

  self._m_permissions = self.value & 511
  return self._m_permissions
end

-- 
-- Whether this file's data is stored using zlib compression.
PharWithoutStub.FileFlags.property.zlib_compressed = {}
function PharWithoutStub.FileFlags.property.zlib_compressed:get()
  if self._m_zlib_compressed ~= nil then
    return self._m_zlib_compressed
  end

  self._m_zlib_compressed = self.value & 4096 ~= 0
  return self._m_zlib_compressed
end

-- 
-- The unparsed flag bits.

PharWithoutStub.GlobalFlags = class.class(KaitaiStruct)

function PharWithoutStub.GlobalFlags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function PharWithoutStub.GlobalFlags:_read()
  self.value = self._io:read_u4le()
end

-- 
-- Whether any of the files in this phar are stored using
-- bzip2 compression.
PharWithoutStub.GlobalFlags.property.any_bzip2_compressed = {}
function PharWithoutStub.GlobalFlags.property.any_bzip2_compressed:get()
  if self._m_any_bzip2_compressed ~= nil then
    return self._m_any_bzip2_compressed
  end

  self._m_any_bzip2_compressed = self.value & 8192 ~= 0
  return self._m_any_bzip2_compressed
end

-- 
-- Whether any of the files in this phar are stored using
-- zlib compression.
PharWithoutStub.GlobalFlags.property.any_zlib_compressed = {}
function PharWithoutStub.GlobalFlags.property.any_zlib_compressed:get()
  if self._m_any_zlib_compressed ~= nil then
    return self._m_any_zlib_compressed
  end

  self._m_any_zlib_compressed = self.value & 4096 ~= 0
  return self._m_any_zlib_compressed
end

-- 
-- Whether this phar contains a signature.
PharWithoutStub.GlobalFlags.property.has_signature = {}
function PharWithoutStub.GlobalFlags.property.has_signature:get()
  if self._m_has_signature ~= nil then
    return self._m_has_signature
  end

  self._m_has_signature = self.value & 65536 ~= 0
  return self._m_has_signature
end

-- 
-- The unparsed flag bits.

PharWithoutStub.Manifest = class.class(KaitaiStruct)

function PharWithoutStub.Manifest:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function PharWithoutStub.Manifest:_read()
  self.len_manifest = self._io:read_u4le()
  self.num_files = self._io:read_u4le()
  self.api_version = PharWithoutStub.ApiVersion(self._io, self, self._root)
  self.flags = PharWithoutStub.GlobalFlags(self._io, self, self._root)
  self.len_alias = self._io:read_u4le()
  self.alias = self._io:read_bytes(self.len_alias)
  self.len_metadata = self._io:read_u4le()
  if self.len_metadata ~= 0 then
    self._raw_metadata = self._io:read_bytes(self.len_metadata)
    local _io = KaitaiStream(stringstream(self._raw_metadata))
    self.metadata = PharWithoutStub.SerializedValue(_io, self, self._root)
  end
  self.file_entries = {}
  for i = 0, self.num_files - 1 do
    self.file_entries[i + 1] = PharWithoutStub.FileEntry(self._io, self, self._root)
  end
end

-- 
-- The length of the manifest, in bytes.
-- 
-- Note: The phar extension does not allow reading manifests
-- larger than 100 MiB.
-- 
-- The number of files in this phar.
-- 
-- The API version used by this phar manifest.
-- 
-- Global flags for this phar.
-- 
-- The length of the alias, in bytes.
-- 
-- The phar's alias, i. e. the name under which it is loaded into PHP.
-- 
-- The size of the metadata, in bytes, or 0 if there is none.
-- 
-- Metadata for this phar, in the format used by PHP's
-- `serialize` function. The meaning of the serialized data is not
-- specified further, it may be used to store arbitrary custom data
-- about the archive.
-- 
-- Manifest entries for the files contained in this phar.

PharWithoutStub.SerializedValue = class.class(KaitaiStruct)

function PharWithoutStub.SerializedValue:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function PharWithoutStub.SerializedValue:_read()
  self.raw = self._io:read_bytes_full()
end

-- 
-- The serialized value, parsed as a structure.
PharWithoutStub.SerializedValue.property.parsed = {}
function PharWithoutStub.SerializedValue.property.parsed:get()
  if self._m_parsed ~= nil then
    return self._m_parsed
  end

  local _pos = self._io:pos()
  self._io:seek(0)
  self._m_parsed = PhpSerializedValue(self._io)
  self._io:seek(_pos)
  return self._m_parsed
end

-- 
-- The serialized value, as a raw byte array.

PharWithoutStub.Signature = class.class(KaitaiStruct)

function PharWithoutStub.Signature:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function PharWithoutStub.Signature:_read()
  self.data = self._io:read_bytes((self._io:size() - self._io:pos()) - 8)
  self.type = PharWithoutStub.SignatureType(self._io:read_u4le())
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\071\066\077\066") then
    error("not equal, expected " .. "\071\066\077\066" .. ", but got " .. self.magic)
  end
end

-- 
-- The signature data. The size and contents depend on the
-- signature type.
-- 
-- The signature type.


-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local utils = require("utils")

-- 
-- RAR is a archive format used by popular proprietary RAR archiver,
-- created by Eugene Roshal. There are two major versions of format
-- (v1.5-4.0 and RAR v5+).
-- 
-- File format essentially consists of a linear sequence of
-- blocks. Each block has fixed header and custom body (that depends on
-- block type), so it's possible to skip block even if one doesn't know
-- how to process a certain block type.
-- See also:  (http://acritum.com/winrar/rar-format)
Rar = class.class(KaitaiStruct)

Rar.BlockTypes = enum.Enum {
  marker = 114,
  archive_header = 115,
  file_header = 116,
  old_style_comment_header = 117,
  old_style_authenticity_info_76 = 118,
  old_style_subblock = 119,
  old_style_recovery_record = 120,
  old_style_authenticity_info_79 = 121,
  subblock = 122,
  terminator = 123,
}

Rar.Oses = enum.Enum {
  ms_dos = 0,
  os_2 = 1,
  windows = 2,
  unix = 3,
  mac_os = 4,
  beos = 5,
}

Rar.Methods = enum.Enum {
  store = 48,
  fastest = 49,
  fast = 50,
  normal = 51,
  good = 52,
  best = 53,
}

function Rar:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Rar:_read()
  self.magic = Rar.MagicSignature(self._io, self, self._root)
  self.blocks = {}
  local i = 0
  while not self._io:is_eof() do
    local _on = self.magic.version
    if _on == 0 then
      self.blocks[i + 1] = Rar.Block(self._io, self, self._root)
    elseif _on == 1 then
      self.blocks[i + 1] = Rar.BlockV5(self._io, self, self._root)
    end
    i = i + 1
  end
end

-- 
-- File format signature to validate that it is indeed a RAR archive.
-- 
-- Sequence of blocks that constitute the RAR file.

Rar.BlockV5 = class.class(KaitaiStruct)

function Rar.BlockV5:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Rar.BlockV5:_read()
end


-- 
-- Basic block that RAR files consist of. There are several block
-- types (see `block_type`), which have different `body` and
-- `add_body`.
Rar.Block = class.class(KaitaiStruct)

function Rar.Block:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Rar.Block:_read()
  self.crc16 = self._io:read_u2le()
  self.block_type = Rar.BlockTypes(self._io:read_u1())
  self.flags = self._io:read_u2le()
  self.block_size = self._io:read_u2le()
  if self.has_add then
    self.add_size = self._io:read_u4le()
  end
  local _on = self.block_type
  if _on == Rar.BlockTypes.file_header then
    self._raw_body = self._io:read_bytes(self.body_size)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Rar.BlockFileHeader(_io, self, self._root)
  else
    self.body = self._io:read_bytes(self.body_size)
  end
  if self.has_add then
    self.add_body = self._io:read_bytes(self.add_size)
  end
end

-- 
-- True if block has additional content attached to it.
Rar.Block.property.has_add = {}
function Rar.Block.property.has_add:get()
  if self._m_has_add ~= nil then
    return self._m_has_add
  end

  self._m_has_add = (self.flags & 32768) ~= 0
  return self._m_has_add
end

Rar.Block.property.header_size = {}
function Rar.Block.property.header_size:get()
  if self._m_header_size ~= nil then
    return self._m_header_size
  end

  self._m_header_size = utils.box_unwrap((self.has_add) and utils.box_wrap(11) or (7))
  return self._m_header_size
end

Rar.Block.property.body_size = {}
function Rar.Block.property.body_size:get()
  if self._m_body_size ~= nil then
    return self._m_body_size
  end

  self._m_body_size = (self.block_size - self.header_size)
  return self._m_body_size
end

-- 
-- CRC16 of whole block or some part of it (depends on block type).
-- 
-- Size of block (header + body, but without additional content).
-- 
-- Size of additional content in this block.
-- 
-- Additional content in this block.

Rar.BlockFileHeader = class.class(KaitaiStruct)

function Rar.BlockFileHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Rar.BlockFileHeader:_read()
  self.low_unp_size = self._io:read_u4le()
  self.host_os = Rar.Oses(self._io:read_u1())
  self.file_crc32 = self._io:read_u4le()
  self.file_time = Rar.DosTime(self._io, self, self._root)
  self.rar_version = self._io:read_u1()
  self.method = Rar.Methods(self._io:read_u1())
  self.name_size = self._io:read_u2le()
  self.attr = self._io:read_u4le()
  if (self._parent.flags & 256) ~= 0 then
    self.high_pack_size = self._io:read_u4le()
  end
  self.file_name = self._io:read_bytes(self.name_size)
  if (self._parent.flags & 1024) ~= 0 then
    self.salt = self._io:read_u8le()
  end
end

-- 
-- Uncompressed file size (lower 32 bits, if 64-bit header flag is present).
-- 
-- Operating system used for archiving.
-- 
-- Date and time in standard MS DOS format.
-- 
-- RAR version needed to extract file (Version number is encoded as 10 * Major version + minor version.).
-- 
-- Compression method.
-- 
-- File name size.
-- 
-- File attributes.
-- 
-- Compressed file size, high 32 bits, only if 64-bit header flag is present.

-- 
-- RAR uses either 7-byte magic for RAR versions 1.5 to 4.0, and
-- 8-byte magic (and pretty different block format) for v5+. This
-- type would parse and validate both versions of signature. Note
-- that actually this signature is a valid RAR "block": in theory,
-- one can omit signature reading at all, and read this normally,
-- as a block, if exact RAR version is known (and thus it's
-- possible to choose correct block format).
Rar.MagicSignature = class.class(KaitaiStruct)

function Rar.MagicSignature:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Rar.MagicSignature:_read()
  self.magic1 = self._io:read_bytes(6)
  if not(self.magic1 == "\082\097\114\033\026\007") then
    error("not equal, expected " ..  "\082\097\114\033\026\007" .. ", but got " .. self.magic1)
  end
  self.version = self._io:read_u1()
  if self.version == 1 then
    self.magic3 = self._io:read_bytes(1)
    if not(self.magic3 == "\000") then
      error("not equal, expected " ..  "\000" .. ", but got " .. self.magic3)
    end
  end
end

-- 
-- Fixed part of file's magic signature that doesn't change with RAR version.
-- 
-- Variable part of magic signature: 0 means old (RAR 1.5-4.0)
-- format, 1 means new (RAR 5+) format
-- 
-- New format (RAR 5+) magic contains extra byte.

Rar.DosTime = class.class(KaitaiStruct)

function Rar.DosTime:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Rar.DosTime:_read()
  self.time = self._io:read_u2le()
  self.date = self._io:read_u2le()
end

Rar.DosTime.property.month = {}
function Rar.DosTime.property.month:get()
  if self._m_month ~= nil then
    return self._m_month
  end

  self._m_month = ((self.date & 480) >> 5)
  return self._m_month
end

Rar.DosTime.property.seconds = {}
function Rar.DosTime.property.seconds:get()
  if self._m_seconds ~= nil then
    return self._m_seconds
  end

  self._m_seconds = ((self.time & 31) * 2)
  return self._m_seconds
end

Rar.DosTime.property.year = {}
function Rar.DosTime.property.year:get()
  if self._m_year ~= nil then
    return self._m_year
  end

  self._m_year = (((self.date & 65024) >> 9) + 1980)
  return self._m_year
end

Rar.DosTime.property.minutes = {}
function Rar.DosTime.property.minutes:get()
  if self._m_minutes ~= nil then
    return self._m_minutes
  end

  self._m_minutes = ((self.time & 2016) >> 5)
  return self._m_minutes
end

Rar.DosTime.property.day = {}
function Rar.DosTime.property.day:get()
  if self._m_day ~= nil then
    return self._m_day
  end

  self._m_day = (self.date & 31)
  return self._m_day
end

Rar.DosTime.property.hours = {}
function Rar.DosTime.property.hours:get()
  if self._m_hours ~= nil then
    return self._m_hours
  end

  self._m_hours = ((self.time & 63488) >> 11)
  return self._m_hours
end



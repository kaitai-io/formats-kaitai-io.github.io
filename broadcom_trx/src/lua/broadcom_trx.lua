-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")
local utils = require("utils")

-- 
-- .trx file format is widely used for distribution of firmware
-- updates for Broadcom devices. The most well-known are ASUS routers.
-- 
-- Fundamentally, it includes a footer which acts as a safeguard
-- against installing a firmware package on a wrong hardware model or
-- version, and a header which list numerous partitions packaged inside
-- a single .trx file.
-- 
-- trx files not necessarily contain all these headers.
-- See also: Source (https://github.com/openwrt/openwrt/blob/3f5619f/tools/firmware-utils/src/trx.c)
-- See also: Source (https://web.archive.org/web/20190127154419/https://openwrt.org/docs/techref/header)
-- See also: Source (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt)
BroadcomTrx = class.class(KaitaiStruct)

function BroadcomTrx:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BroadcomTrx:_read()
end

BroadcomTrx.property.header = {}
function BroadcomTrx.property.header:get()
  if self._m_header ~= nil then
    return self._m_header
  end

  local _pos = self._io:pos()
  self._io:seek(0)
  self._m_header = BroadcomTrx.Header(self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_header
end

BroadcomTrx.property.tail = {}
function BroadcomTrx.property.tail:get()
  if self._m_tail ~= nil then
    return self._m_tail
  end

  local _pos = self._io:pos()
  self._io:seek((self._io:size() - 64))
  self._m_tail = BroadcomTrx.Tail(self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_tail
end


BroadcomTrx.Revision = class.class(KaitaiStruct)

function BroadcomTrx.Revision:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BroadcomTrx.Revision:_read()
  self.major = self._io:read_u1()
  self.minor = self._io:read_u1()
end


BroadcomTrx.Version = class.class(KaitaiStruct)

function BroadcomTrx.Version:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BroadcomTrx.Version:_read()
  self.major = self._io:read_u1()
  self.minor = self._io:read_u1()
  self.patch = self._io:read_u1()
  self.tweak = self._io:read_u1()
end


-- 
-- A safeguard against installation of firmware to an incompatible device.
BroadcomTrx.Tail = class.class(KaitaiStruct)

function BroadcomTrx.Tail:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BroadcomTrx.Tail:_read()
  self.version = BroadcomTrx.Version(self._io, self, self._root)
  self.product_id = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(12), 0, false), "utf-8")
  self.comp_hw = {}
  for i = 0, 4 - 1 do
    self.comp_hw[i + 1] = BroadcomTrx.Tail.HwCompInfo(self._io, self, self._root)
  end
  self.reserved = self._io:read_bytes(32)
end

-- 
-- 1.9.2.7 by default.
-- 
-- 0.02 - 2.99.

BroadcomTrx.Tail.HwCompInfo = class.class(KaitaiStruct)

function BroadcomTrx.Tail.HwCompInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BroadcomTrx.Tail.HwCompInfo:_read()
  self.min = BroadcomTrx.Revision(self._io, self, self._root)
  self.max = BroadcomTrx.Revision(self._io, self, self._root)
end


BroadcomTrx.Header = class.class(KaitaiStruct)

function BroadcomTrx.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BroadcomTrx.Header:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\072\068\082\048") then
    error("not equal, expected " ..  "\072\068\082\048" .. ", but got " .. self.magic)
  end
  self.len = self._io:read_u4le()
  self.crc32 = self._io:read_u4le()
  self.version = self._io:read_u2le()
  self.flags = BroadcomTrx.Header.Flags(self._io, self, self._root)
  self.partitions = {}
  local i = 0
  while true do
    _ = BroadcomTrx.Header.Partition(i, self._io, self, self._root)
    self.partitions[i + 1] = _
    if  ((i >= 4) or (not(_.is_present)))  then
      break
    end
    i = i + 1
  end
end

-- 
-- Length of file including header.
-- 
-- CRC from `version` (??? todo: see the original and disambiguate) to end of file.
-- 
-- Offsets of partitions from start of header.

BroadcomTrx.Header.Partition = class.class(KaitaiStruct)

function BroadcomTrx.Header.Partition:_init(idx, io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self.idx = idx
self:_read()
end

function BroadcomTrx.Header.Partition:_read()
self.ofs_body = self._io:read_u4le()
end

BroadcomTrx.Header.Partition.property.is_present = {}
function BroadcomTrx.Header.Partition.property.is_present:get()
if self._m_is_present ~= nil then
  return self._m_is_present
end

self._m_is_present = self.ofs_body ~= 0
return self._m_is_present
end

BroadcomTrx.Header.Partition.property.is_last = {}
function BroadcomTrx.Header.Partition.property.is_last:get()
if self._m_is_last ~= nil then
  return self._m_is_last
end

if self.is_present then
  self._m_is_last =  ((self.idx == (#self._parent.partitions - 1)) or (not(self._parent.partitions[(self.idx + 1) + 1].is_present))) 
end
return self._m_is_last
end

BroadcomTrx.Header.Partition.property.len_body = {}
function BroadcomTrx.Header.Partition.property.len_body:get()
if self._m_len_body ~= nil then
  return self._m_len_body
end

if self.is_present then
  self._m_len_body = utils.box_unwrap((self.is_last) and utils.box_wrap((self._root._io:size() - self.ofs_body)) or (self._parent.partitions[(self.idx + 1) + 1].ofs_body))
end
return self._m_len_body
end

BroadcomTrx.Header.Partition.property.body = {}
function BroadcomTrx.Header.Partition.property.body:get()
if self._m_body ~= nil then
  return self._m_body
end

if self.is_present then
  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.ofs_body)
  self._m_body = _io:read_bytes(self.len_body)
  _io:seek(_pos)
end
return self._m_body
end


BroadcomTrx.Header.Flags = class.class(KaitaiStruct)

function BroadcomTrx.Header.Flags:_init(io, parent, root)
KaitaiStruct._init(self, io)
self._parent = parent
self._root = root or self
self:_read()
end

function BroadcomTrx.Header.Flags:_read()
self.flags = {}
for i = 0, 16 - 1 do
  self.flags[i + 1] = self._io:read_bits_int_le(1)
end
end



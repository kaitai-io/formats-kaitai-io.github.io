-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local str_decode = require("string_decode")

require("dos_datetime")
-- 
-- LHA (LHarc, LZH) is a file format used by a popular freeware
-- eponymous archiver, created in 1988 by Haruyasu Yoshizaki. Over the
-- years, many ports and implementations were developed, sporting many
-- extensions to original 1988 LZH.
-- 
-- File format is pretty simple and essentially consists of a stream of
-- records.
Lzh = class.class(KaitaiStruct)

function Lzh:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Lzh:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = Lzh.Record(self._io, self, self._root)
    i = i + 1
  end
end


Lzh.Record = class.class(KaitaiStruct)

function Lzh.Record:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Lzh.Record:_read()
  self.header_len = self._io:read_u1()
  if self.header_len > 0 then
    self.file_record = Lzh.FileRecord(self._io, self, self._root)
  end
end


Lzh.FileRecord = class.class(KaitaiStruct)

function Lzh.FileRecord:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Lzh.FileRecord:_read()
  self._raw_header = self._io:read_bytes((self._parent.header_len - 1))
  local _io = KaitaiStream(stringstream(self._raw_header))
  self.header = Lzh.Header(_io, self, self._root)
  if self.header.header1.lha_level == 0 then
    self.file_uncompr_crc16 = self._io:read_u2le()
  end
  self.body = self._io:read_bytes(self.header.header1.file_size_compr)
end


Lzh.Header = class.class(KaitaiStruct)

function Lzh.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Lzh.Header:_read()
  self.header1 = Lzh.Header1(self._io, self, self._root)
  if self.header1.lha_level == 0 then
    self.filename_len = self._io:read_u1()
  end
  if self.header1.lha_level == 0 then
    self.filename = str_decode.decode(self._io:read_bytes(self.filename_len), "ASCII")
  end
  if self.header1.lha_level == 2 then
    self.file_uncompr_crc16 = self._io:read_u2le()
  end
  if self.header1.lha_level == 2 then
    self.os = self._io:read_u1()
  end
  if self.header1.lha_level == 2 then
    self.ext_header_size = self._io:read_u2le()
  end
end

-- 
-- Level-neutral header, same for all LHA levels. Subsequent fields order and meaning varies, based on LHA level specified in this header.

Lzh.Header1 = class.class(KaitaiStruct)

function Lzh.Header1:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Lzh.Header1:_read()
  self.header_checksum = self._io:read_u1()
  self.method_id = str_decode.decode(self._io:read_bytes(5), "ASCII")
  self.file_size_compr = self._io:read_u4le()
  self.file_size_uncompr = self._io:read_u4le()
  self._raw_file_timestamp = self._io:read_bytes(4)
  local _io = KaitaiStream(stringstream(self._raw_file_timestamp))
  self.file_timestamp = DosDatetime(_io)
  self.attr = self._io:read_u1()
  self.lha_level = self._io:read_u1()
end

-- 
-- Compressed file size.
-- 
-- Uncompressed file size.
-- 
-- Original file date/time.
-- 
-- File or directory attribute.


-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")

-- 
-- See also: Source (https://learn.microsoft.com/en-us/previous-versions/ms779636(v=vs.85))
Avi = class.class(KaitaiStruct)

Avi.ChunkType = enum.Enum {
  idx1 = 829973609,
  junk = 1263424842,
  info = 1330007625,
  isft = 1413894985,
  list = 1414744396,
  strf = 1718776947,
  avih = 1751742049,
  strh = 1752331379,
  movi = 1769369453,
  hdrl = 1819436136,
  strl = 1819440243,
}

Avi.StreamType = enum.Enum {
  mids = 1935960429,
  vids = 1935960438,
  auds = 1935963489,
  txts = 1937012852,
}

Avi.HandlerType = enum.Enum {
  mp3 = 85,
  ac3 = 8192,
  dts = 8193,
  cvid = 1684633187,
  xvid = 1684633208,
}

function Avi:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Avi:_read()
  self.magic1 = self._io:read_bytes(4)
  if not(self.magic1 == "\082\073\070\070") then
    error("not equal, expected " ..  "\082\073\070\070" .. ", but got " .. self.magic1)
  end
  self.file_size = self._io:read_u4le()
  self.magic2 = self._io:read_bytes(4)
  if not(self.magic2 == "\065\086\073\032") then
    error("not equal, expected " ..  "\065\086\073\032" .. ", but got " .. self.magic2)
  end
  self._raw_data = self._io:read_bytes((self.file_size - 4))
  local _io = KaitaiStream(stringstream(self._raw_data))
  self.data = Avi.Blocks(_io, self, self._root)
end


Avi.ListBody = class.class(KaitaiStruct)

function Avi.ListBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Avi.ListBody:_read()
  self.list_type = Avi.ChunkType(self._io:read_u4le())
  self.data = Avi.Blocks(self._io, self, self._root)
end


Avi.Rect = class.class(KaitaiStruct)

function Avi.Rect:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Avi.Rect:_read()
  self.left = self._io:read_s2le()
  self.top = self._io:read_s2le()
  self.right = self._io:read_s2le()
  self.bottom = self._io:read_s2le()
end


Avi.Blocks = class.class(KaitaiStruct)

function Avi.Blocks:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Avi.Blocks:_read()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = Avi.Block(self._io, self, self._root)
    i = i + 1
  end
end


-- 
-- Main header of an AVI file, defined as AVIMAINHEADER structure.
-- See also: Source (https://learn.microsoft.com/en-us/previous-versions/ms779632(v=vs.85))
Avi.AvihBody = class.class(KaitaiStruct)

function Avi.AvihBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Avi.AvihBody:_read()
  self.micro_sec_per_frame = self._io:read_u4le()
  self.max_bytes_per_sec = self._io:read_u4le()
  self.padding_granularity = self._io:read_u4le()
  self.flags = self._io:read_u4le()
  self.total_frames = self._io:read_u4le()
  self.initial_frames = self._io:read_u4le()
  self.streams = self._io:read_u4le()
  self.suggested_buffer_size = self._io:read_u4le()
  self.width = self._io:read_u4le()
  self.height = self._io:read_u4le()
  self.reserved = self._io:read_bytes(16)
end


Avi.Block = class.class(KaitaiStruct)

function Avi.Block:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Avi.Block:_read()
  self.four_cc = Avi.ChunkType(self._io:read_u4le())
  self.block_size = self._io:read_u4le()
  local _on = self.four_cc
  if _on == Avi.ChunkType.list then
    self._raw_data = self._io:read_bytes(self.block_size)
    local _io = KaitaiStream(stringstream(self._raw_data))
    self.data = Avi.ListBody(_io, self, self._root)
  elseif _on == Avi.ChunkType.avih then
    self._raw_data = self._io:read_bytes(self.block_size)
    local _io = KaitaiStream(stringstream(self._raw_data))
    self.data = Avi.AvihBody(_io, self, self._root)
  elseif _on == Avi.ChunkType.strh then
    self._raw_data = self._io:read_bytes(self.block_size)
    local _io = KaitaiStream(stringstream(self._raw_data))
    self.data = Avi.StrhBody(_io, self, self._root)
  else
    self.data = self._io:read_bytes(self.block_size)
  end
end


-- 
-- Stream header (one header per stream), defined as AVISTREAMHEADER structure.
-- See also: Source (https://learn.microsoft.com/en-us/previous-versions/ms779638(v=vs.85))
Avi.StrhBody = class.class(KaitaiStruct)

function Avi.StrhBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Avi.StrhBody:_read()
  self.fcc_type = Avi.StreamType(self._io:read_u4le())
  self.fcc_handler = Avi.HandlerType(self._io:read_u4le())
  self.flags = self._io:read_u4le()
  self.priority = self._io:read_u2le()
  self.language = self._io:read_u2le()
  self.initial_frames = self._io:read_u4le()
  self.scale = self._io:read_u4le()
  self.rate = self._io:read_u4le()
  self.start = self._io:read_u4le()
  self.length = self._io:read_u4le()
  self.suggested_buffer_size = self._io:read_u4le()
  self.quality = self._io:read_u4le()
  self.sample_size = self._io:read_u4le()
  self.frame = Avi.Rect(self._io, self, self._root)
end

-- 
-- Type of the data contained in the stream.
-- 
-- Type of preferred data handler for the stream (specifies codec for audio / video streams).

-- 
-- Stream format description.
Avi.StrfBody = class.class(KaitaiStruct)

function Avi.StrfBody:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Avi.StrfBody:_read()
end



-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

-- 
-- Ogg is a popular media container format, which provides basic
-- streaming / buffering mechanisms and is content-agnostic. Most
-- popular codecs that are used within Ogg streams are Vorbis (thus
-- making Ogg/Vorbis streams) and Theora (Ogg/Theora).
-- 
-- Ogg stream is a sequence Ogg pages. They can be read sequentially,
-- or one can jump into arbitrary stream location and scan for "OggS"
-- sync code to find the beginning of a new Ogg page and continue
-- decoding the stream contents from that one.
Ogg = class.class(KaitaiStruct)

function Ogg:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ogg:_read()
  self.pages = {}
  local i = 0
  while not self._io:is_eof() do
    self.pages[i + 1] = Ogg.Page(self._io, self, self._root)
    i = i + 1
  end
end


-- 
-- Ogg page is a basic unit of data in an Ogg bitstream, usually
-- it's around 4-8 KB, with a maximum size of 65307 bytes.
Ogg.Page = class.class(KaitaiStruct)

function Ogg.Page:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Ogg.Page:_read()
  self.sync_code = self._io:read_bytes(4)
  if not(self.sync_code == "\079\103\103\083") then
    error("not equal, expected " ..  "\079\103\103\083" .. ", but got " .. self.sync_code)
  end
  self.version = self._io:read_bytes(1)
  if not(self.version == "\000") then
    error("not equal, expected " ..  "\000" .. ", but got " .. self.version)
  end
  self.reserved1 = self._io:read_bits_int_be(5)
  self.is_end_of_stream = self._io:read_bits_int_be(1)
  self.is_beginning_of_stream = self._io:read_bits_int_be(1)
  self.is_continuation = self._io:read_bits_int_be(1)
  self._io:align_to_byte()
  self.granule_pos = self._io:read_u8le()
  self.bitstream_serial = self._io:read_u4le()
  self.page_seq_num = self._io:read_u4le()
  self.crc32 = self._io:read_u4le()
  self.num_segments = self._io:read_u1()
  self.len_segments = {}
  for i = 0, self.num_segments - 1 do
    self.len_segments[i + 1] = self._io:read_u1()
  end
  self.segments = {}
  for i = 0, self.num_segments - 1 do
    self.segments[i + 1] = self._io:read_bytes(self.len_segments[i + 1])
  end
end

-- 
-- Version of the Ogg bitstream format. Currently must be 0.
-- 
-- EOS (End Of Stream) mark. This page is the last page in the
-- logical bitstream. The EOS flag must be set on the final page of
-- every logical bitstream, and must not be set on any other page.
-- 
-- BOS (Beginning Of Stream) mark. This page is the first page in
-- the logical bitstream. The BOS flag must be set on the first
-- page of every logical bitstream, and must not be set on any
-- other page.
-- 
-- The first packet on this page is a continuation of the previous
-- packet in the logical bitstream.
-- 
-- "Granule position" is the time marker in Ogg files. It is an
-- abstract value, whose meaning is determined by the codec. It
-- may, for example, be a count of the number of samples, the
-- number of frames or a more complex scheme.
-- 
-- Serial number that identifies a page as belonging to a
-- particular logical bitstream. Each logical bitstream in a file
-- has a unique value, and this field allows implementations to
-- deliver the pages to the appropriate decoder. In a typical
-- Vorbis and Theora file, one stream is the audio (Vorbis), and
-- the other is the video (Theora).
-- 
-- Sequential number of page, guaranteed to be monotonically
-- increasing for each logical bitstream. The first page is 0, the
-- second 1, etc. This allows implementations to detect when data
-- has been lost.
-- 
-- This field provides a CRC32 checksum of the data in the entire
-- page (including the page header, calculated with the checksum
-- field set to 0). This allows verification that the data has not
-- been corrupted since it was created. Pages that fail the
-- checksum should be discarded. The checksum is generated using a
-- polynomial value of 0x04C11DB7.
-- 
-- The number of segments that exist in this page. There can be a
-- maximum of 255 segments in any one page.
-- 
-- Table of lengths of segments.
-- 
-- Segment content bytes make up the rest of the Ogg page.


-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local utils = require("utils")
local str_decode = require("string_decode")

-- 
-- The NeXT/Sun audio file format.
-- 
-- Sample files:
-- 
-- * <https://github.com/python/cpython/tree/b8a7daf077da/Lib/test/sndhdrdata>
-- * <ftp://ftp-ccrma.stanford.edu/pub/Lisp/sf.tar.gz>
-- * <http://www-mmsp.ece.mcgill.ca/Documents/AudioFormats/AU/Samples.html>
-- See also: Source (http://www-mmsp.ece.mcgill.ca/Documents/AudioFormats/AU/AU.html)
-- See also: Source (http://soundfile.sapp.org/doc/NextFormat/)
-- See also: Source (http://soundfile.sapp.org/doc/NextFormat/soundstruct.h)
-- See also: Source (https://github.com/andreiw/polaris/blob/deb47cb/usr/src/head/audio/au.h#L87-L112)
-- See also: Source (https://github.com/libsndfile/libsndfile/blob/86c9f9eb/src/au.c#L39-L74)
-- See also: Source (https://github.com/chirlu/sox/blob/dd8b63bd/src/au.c#L34-L49)
-- See also: Source (https://github.com/mpruett/audiofile/blob/b62c902/libaudiofile/NeXT.cpp#L65-L96)
Au = class.class(KaitaiStruct)

Au.Encodings = enum.Enum {
  mulaw_8 = 1,
  linear_8 = 2,
  linear_16 = 3,
  linear_24 = 4,
  linear_32 = 5,
  float = 6,
  double = 7,
  fragmented = 8,
  nested = 9,
  dsp_core = 10,
  fixed_point_8 = 11,
  fixed_point_16 = 12,
  fixed_point_24 = 13,
  fixed_point_32 = 14,
  display = 16,
  mulaw_squelch = 17,
  emphasized = 18,
  compressed = 19,
  compressed_emphasized = 20,
  dsp_commands = 21,
  dsp_commands_samples = 22,
  adpcm_g721 = 23,
  adpcm_g722 = 24,
  adpcm_g723_3 = 25,
  adpcm_g723_5 = 26,
  alaw_8 = 27,
  aes = 28,
  delta_mulaw_8 = 29,
}

function Au:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Au:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\046\115\110\100") then
    error("not equal, expected " ..  "\046\115\110\100" .. ", but got " .. self.magic)
  end
  self.ofs_data = self._io:read_u4be()
  self._raw_header = self._io:read_bytes(((self.ofs_data - 4) - 4))
  local _io = KaitaiStream(stringstream(self._raw_header))
  self.header = Au.Header(_io, self, self._root)
end

Au.property.len_data = {}
function Au.property.len_data:get()
  if self._m_len_data ~= nil then
    return self._m_len_data
  end

  self._m_len_data = utils.box_unwrap((self.header.data_size == 4294967295) and utils.box_wrap((self._io:size() - self.ofs_data)) or (self.header.data_size))
  return self._m_len_data
end


Au.Header = class.class(KaitaiStruct)

function Au.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Au.Header:_read()
  self.data_size = self._io:read_u4be()
  self.encoding = Au.Encodings(self._io:read_u4be())
  self.sample_rate = self._io:read_u4be()
  self.num_channels = self._io:read_u4be()
  if not(self.num_channels >= 1) then
    error("ValidationLessThanError")
  end
  self.comment = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes_full(), 0, false), "ASCII")
end

-- 
-- don't read this field, access `_root.len_data` instead
-- 
-- value `0xffff_ffff` means unspecified size
-- 
-- number of interleaved channels.
-- 
-- Most resources claim that this field must be at least 4 bytes long.
-- However, most programs don't enforce it, and [Audacity](
-- https://www.audacityteam.org/) even generates .au files with this field
-- being 0-byte long. According to <https://nixdoc.net/man-pages/IRIX/man4/dmedia/next.4.html>,
-- "NeXT files require that this chunk be at least 4 bytes (chars) long,
-- whereas this chunk may be zerolength in a Sun .au file."
-- 
-- By convention, size should be a multiple of 4 -
-- see <https://github.com/chirlu/sox/blob/dd8b63bd/src/au.c#L132-L133>.
-- Page <http://soundfile.sapp.org/doc/NextFormat/> also mentions that for some
-- sound playing programs, this field must have an even byte size. So a multiple
-- of 4 is probably best for compatibility.
-- 
-- Must be null-terminated. It is usually an ASCII text string, but this space
-- might be also used to store application-specific binary (i.e. non-ASCII) data.


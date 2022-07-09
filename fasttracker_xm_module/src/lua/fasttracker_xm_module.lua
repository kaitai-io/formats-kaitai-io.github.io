-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local str_decode = require("string_decode")
local utils = require("utils")
local enum = require("enum")

-- 
-- XM (standing for eXtended Module) is a popular module music file
-- format, that was introduced in 1994 in FastTracker2 by Triton demo
-- group. Akin to MOD files, it bundles both digital samples
-- (instruments) and instructions on which note to play at what time
-- (patterns), which provides good audio quality with relatively small
-- file size. Audio is reproducible without relying on the sound of
-- particular hardware samplers or synths.
-- See also: Source (http://sid.ethz.ch/debian/milkytracker/milkytracker-0.90.85%2Bdfsg/resources/reference/xm-form.txt
-- ftp://ftp.modland.com/pub/documents/format_documentation/FastTracker%202%20v2.04%20(.xm).html
-- )
FasttrackerXmModule = class.class(KaitaiStruct)

function FasttrackerXmModule:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function FasttrackerXmModule:_read()
  self.preheader = FasttrackerXmModule.Preheader(self._io, self, self._root)
  self._raw_header = self._io:read_bytes((self.preheader.header_size - 4))
  local _io = KaitaiStream(stringstream(self._raw_header))
  self.header = FasttrackerXmModule.Header(_io, self, self._root)
  self.patterns = {}
  for i = 0, self.header.num_patterns - 1 do
    self.patterns[i + 1] = FasttrackerXmModule.Pattern(self._io, self, self._root)
  end
  self.instruments = {}
  for i = 0, self.header.num_instruments - 1 do
    self.instruments[i + 1] = FasttrackerXmModule.Instrument(self._io, self, self._root)
  end
end


FasttrackerXmModule.Preheader = class.class(KaitaiStruct)

function FasttrackerXmModule.Preheader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function FasttrackerXmModule.Preheader:_read()
  self.signature0 = self._io:read_bytes(17)
  if not(self.signature0 == "\069\120\116\101\110\100\101\100\032\077\111\100\117\108\101\058\032") then
    error("not equal, expected " ..  "\069\120\116\101\110\100\101\100\032\077\111\100\117\108\101\058\032" .. ", but got " .. self.signature0)
  end
  self.module_name = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(20), 0, false), "utf-8")
  self.signature1 = self._io:read_bytes(1)
  if not(self.signature1 == "\026") then
    error("not equal, expected " ..  "\026" .. ", but got " .. self.signature1)
  end
  self.tracker_name = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(20), 0, false), "utf-8")
  self.version_number = FasttrackerXmModule.Preheader.Version(self._io, self, self._root)
  self.header_size = self._io:read_u4le()
end

-- 
-- Module name, padded with zeroes.
-- 
-- Tracker name.
-- 
-- Format versions below [0x01, 0x04] have a LOT of differences. Check this field!.
-- 
-- Header size << Calculated FROM THIS OFFSET, not from the beginning of the file! >>.

FasttrackerXmModule.Preheader.Version = class.class(KaitaiStruct)

function FasttrackerXmModule.Preheader.Version:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function FasttrackerXmModule.Preheader.Version:_read()
  self.minor = self._io:read_u1()
  self.major = self._io:read_u1()
end

FasttrackerXmModule.Preheader.Version.property.value = {}
function FasttrackerXmModule.Preheader.Version.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = ((self.major << 8) | self.minor)
  return self._m_value
end

-- 
-- currently 0x04.
-- 
-- currently 0x01.

FasttrackerXmModule.Pattern = class.class(KaitaiStruct)

function FasttrackerXmModule.Pattern:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function FasttrackerXmModule.Pattern:_read()
  self.header = FasttrackerXmModule.Pattern.Header(self._io, self, self._root)
  self.packed_data = self._io:read_bytes(self.header.main.len_packed_pattern)
end


FasttrackerXmModule.Pattern.Header = class.class(KaitaiStruct)

function FasttrackerXmModule.Pattern.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function FasttrackerXmModule.Pattern.Header:_read()
  self.header_length = self._io:read_u4le()
  self._raw_main = self._io:read_bytes((self.header_length - 4))
  local _io = KaitaiStream(stringstream(self._raw_main))
  self.main = FasttrackerXmModule.Pattern.Header.HeaderMain(_io, self, self._root)
end

-- 
-- Pattern header length.

FasttrackerXmModule.Pattern.Header.HeaderMain = class.class(KaitaiStruct)

function FasttrackerXmModule.Pattern.Header.HeaderMain:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function FasttrackerXmModule.Pattern.Header.HeaderMain:_read()
  self.packing_type = self._io:read_u1()
  local _on = self._root.preheader.version_number.value
  if _on == 258 then
    self.num_rows_raw = self._io:read_u1()
  else
    self.num_rows_raw = self._io:read_u2le()
  end
  self.len_packed_pattern = self._io:read_u2le()
end

FasttrackerXmModule.Pattern.Header.HeaderMain.property.num_rows = {}
function FasttrackerXmModule.Pattern.Header.HeaderMain.property.num_rows:get()
  if self._m_num_rows ~= nil then
    return self._m_num_rows
  end

  self._m_num_rows = (self.num_rows_raw + utils.box_unwrap((self._root.preheader.version_number.value == 258) and utils.box_wrap(1) or (0)))
  return self._m_num_rows
end

-- 
-- Packing type (always 0).
-- 
-- Number of rows in pattern (1..256).
-- 
-- Packed pattern data size.

FasttrackerXmModule.Flags = class.class(KaitaiStruct)

function FasttrackerXmModule.Flags:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function FasttrackerXmModule.Flags:_read()
  self.reserved = self._io:read_bits_int_be(15)
  self.freq_table_type = self._io:read_bits_int_be(1) ~= 0
end

-- 
-- 0 = Amiga frequency table (see below); 1 = Linear frequency table.

FasttrackerXmModule.Header = class.class(KaitaiStruct)

function FasttrackerXmModule.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function FasttrackerXmModule.Header:_read()
  self.song_length = self._io:read_u2le()
  self.restart_position = self._io:read_u2le()
  self.num_channels = self._io:read_u2le()
  self.num_patterns = self._io:read_u2le()
  self.num_instruments = self._io:read_u2le()
  self.flags = FasttrackerXmModule.Flags(self._io, self, self._root)
  self.default_tempo = self._io:read_u2le()
  self.default_bpm = self._io:read_u2le()
  self.pattern_order_table = {}
  for i = 0, 256 - 1 do
    self.pattern_order_table[i + 1] = self._io:read_u1()
  end
end

-- 
-- Song length (in pattern order table).
-- 
-- (2,4,6,8,10,...,32).
-- 
-- (max 256).
-- 
-- (max 128).
-- 
-- max 256.

-- 
-- XM's notion of "instrument" typically constitutes of a
-- instrument metadata and one or several samples. Metadata
-- includes:
-- 
-- * instrument's name
-- * instruction of which sample to use for which note
-- * volume and panning envelopes and looping instructions
-- * vibrato settings
FasttrackerXmModule.Instrument = class.class(KaitaiStruct)

function FasttrackerXmModule.Instrument:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function FasttrackerXmModule.Instrument:_read()
  self.header_size = self._io:read_u4le()
  self._raw_header = self._io:read_bytes((self.header_size - 4))
  local _io = KaitaiStream(stringstream(self._raw_header))
  self.header = FasttrackerXmModule.Instrument.Header(_io, self, self._root)
  self.samples_headers = {}
  for i = 0, self.header.num_samples - 1 do
    self.samples_headers[i + 1] = FasttrackerXmModule.Instrument.SampleHeader(self._io, self, self._root)
  end
  self.samples = {}
  for i = 0, self.header.num_samples - 1 do
    self.samples[i + 1] = FasttrackerXmModule.Instrument.SamplesData(self.samples_headers[i + 1], self._io, self, self._root)
  end
end

-- 
-- Instrument size << header that is >>
-- << "Instrument Size" field tends to be more than the actual size of the structure documented here (it includes also the extended instrument sample header above). So remember to check it and skip the additional bytes before the first sample header >>

FasttrackerXmModule.Instrument.Header = class.class(KaitaiStruct)

function FasttrackerXmModule.Instrument.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function FasttrackerXmModule.Instrument.Header:_read()
  self.name = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(22), 0, false), "utf-8")
  self.type = self._io:read_u1()
  self.num_samples = self._io:read_u2le()
  if self.num_samples > 0 then
    self.extra_header = FasttrackerXmModule.Instrument.ExtraHeader(self._io, self, self._root)
  end
end

-- 
-- Usually zero, but this seems pretty random, don't assume it's zero.

FasttrackerXmModule.Instrument.ExtraHeader = class.class(KaitaiStruct)

FasttrackerXmModule.Instrument.ExtraHeader.Type = enum.Enum {
  true = 0,
  sustain = 1,
  loop = 2,
}

function FasttrackerXmModule.Instrument.ExtraHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function FasttrackerXmModule.Instrument.ExtraHeader:_read()
  self.len_sample_header = self._io:read_u4le()
  self.idx_sample_per_note = {}
  for i = 0, 96 - 1 do
    self.idx_sample_per_note[i + 1] = self._io:read_u1()
  end
  self.volume_points = {}
  for i = 0, 12 - 1 do
    self.volume_points[i + 1] = FasttrackerXmModule.Instrument.ExtraHeader.EnvelopePoint(self._io, self, self._root)
  end
  self.panning_points = {}
  for i = 0, 12 - 1 do
    self.panning_points[i + 1] = FasttrackerXmModule.Instrument.ExtraHeader.EnvelopePoint(self._io, self, self._root)
  end
  self.num_volume_points = self._io:read_u1()
  self.num_panning_points = self._io:read_u1()
  self.volume_sustain_point = self._io:read_u1()
  self.volume_loop_start_point = self._io:read_u1()
  self.volume_loop_end_point = self._io:read_u1()
  self.panning_sustain_point = self._io:read_u1()
  self.panning_loop_start_point = self._io:read_u1()
  self.panning_loop_end_point = self._io:read_u1()
  self.volume_type = FasttrackerXmModule.Instrument.ExtraHeader.Type(self._io:read_u1())
  self.panning_type = FasttrackerXmModule.Instrument.ExtraHeader.Type(self._io:read_u1())
  self.vibrato_type = self._io:read_u1()
  self.vibrato_sweep = self._io:read_u1()
  self.vibrato_depth = self._io:read_u1()
  self.vibrato_rate = self._io:read_u1()
  self.volume_fadeout = self._io:read_u2le()
  self.reserved = self._io:read_u2le()
end

-- 
-- Index of sample that should be used for any particular
-- note. In the simplest case, where it's only one sample
-- is available, it's an array of full of zeroes.
-- 
-- Points for volume envelope. Only `num_volume_points` will be actually used.
-- 
-- Points for panning envelope. Only `num_panning_points` will be actually used.

-- 
-- Envelope frame-counters work in range 0..FFFFh (0..65535 dec).
-- BUT! FT2 only itself supports only range 0..FFh (0..255 dec).
-- Some other trackers (like SoundTracker for Unix), however, can use the full range 0..FFFF, so it should be supported.
-- !!TIP: This is also a good way to detect if the module has been made with FT2 or not. (In case the tracker name is brain- deadly left unchanged!)
-- Of course it does not help if all instruments have the values inside FT2 supported range.
-- The value-field of the envelope point is ranged between 00..3Fh (0..64 dec).
FasttrackerXmModule.Instrument.ExtraHeader.EnvelopePoint = class.class(KaitaiStruct)

function FasttrackerXmModule.Instrument.ExtraHeader.EnvelopePoint:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function FasttrackerXmModule.Instrument.ExtraHeader.EnvelopePoint:_read()
  self.x = self._io:read_u2le()
  self.y = self._io:read_u2le()
end

-- 
-- Frame number of the point.
-- 
-- Value of the point.

-- 
-- The saved data uses simple delta-encoding to achieve better compression ratios (when compressed with pkzip, etc.)
-- Pseudocode for converting the delta-coded data to normal data,
-- old = 0;
-- for i in range(data_len):
--   new = sample[i] + old;
--   sample[i] = new;
--   old = new;
FasttrackerXmModule.Instrument.SamplesData = class.class(KaitaiStruct)

function FasttrackerXmModule.Instrument.SamplesData:_init(header, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.header = header
  self:_read()
end

function FasttrackerXmModule.Instrument.SamplesData:_read()
  self.data = self._io:read_bytes((self.header.sample_length * utils.box_unwrap((self.header.type.is_sample_data_16_bit) and utils.box_wrap(2) or (1))))
end


FasttrackerXmModule.Instrument.SampleHeader = class.class(KaitaiStruct)

function FasttrackerXmModule.Instrument.SampleHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function FasttrackerXmModule.Instrument.SampleHeader:_read()
  self.sample_length = self._io:read_u4le()
  self.sample_loop_start = self._io:read_u4le()
  self.sample_loop_length = self._io:read_u4le()
  self.volume = self._io:read_u1()
  self.fine_tune = self._io:read_s1()
  self.type = FasttrackerXmModule.Instrument.SampleHeader.LoopType(self._io, self, self._root)
  self.panning = self._io:read_u1()
  self.relative_note_number = self._io:read_s1()
  self.reserved = self._io:read_u1()
  self.name = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(22), 0, false), "utf-8")
end

-- 
-- -16..+15.
-- 
-- (0-255).

FasttrackerXmModule.Instrument.SampleHeader.LoopType = class.class(KaitaiStruct)

FasttrackerXmModule.Instrument.SampleHeader.LoopType.LoopType = enum.Enum {
  none = 0,
  forward = 1,
  ping_pong = 2,
}

function FasttrackerXmModule.Instrument.SampleHeader.LoopType:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function FasttrackerXmModule.Instrument.SampleHeader.LoopType:_read()
  self.reserved0 = self._io:read_bits_int_be(3)
  self.is_sample_data_16_bit = self._io:read_bits_int_be(1) ~= 0
  self.reserved1 = self._io:read_bits_int_be(2)
  self.loop_type = FasttrackerXmModule.Instrument.SampleHeader.LoopType.LoopType(self._io:read_bits_int_be(2))
end



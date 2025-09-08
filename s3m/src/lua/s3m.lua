-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")

-- 
-- Scream Tracker 3 module is a tracker music file format that, as all
-- tracker music, bundles both sound samples and instructions on which
-- notes to play. It originates from a Scream Tracker 3 music editor
-- (1994) by Future Crew, derived from original Scream Tracker 2 (.stm)
-- module format.
-- 
-- Instrument descriptions in S3M format allow to use either digital
-- samples or setup and control AdLib (OPL2) synth.
-- 
-- Music is organized in so called `patterns`. "Pattern" is a generally
-- a 64-row long table, which instructs which notes to play on which
-- time measure. "Patterns" are played one-by-one in a sequence
-- determined by `orders`, which is essentially an array of pattern IDs
-- - this way it's possible to reuse certain patterns more than once
-- for repetitive musical phrases.
-- See also: Source (http://hackipedia.org/browse.cgi/File%20formats/Music%20tracker/S3M%2c%20ScreamTracker%203/Scream%20Tracker%203.20%20by%20Future%20Crew.txt)
S3m = class.class(KaitaiStruct)

function S3m:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function S3m:_read()
  self.song_name = KaitaiStream.bytes_terminate(self._io:read_bytes(28), 0, false)
  self.magic1 = self._io:read_bytes(1)
  if not(self.magic1 == "\026") then
    error("not equal, expected " .. "\026" .. ", but got " .. self.magic1)
  end
  self.file_type = self._io:read_u1()
  self.reserved1 = self._io:read_bytes(2)
  self.num_orders = self._io:read_u2le()
  self.num_instruments = self._io:read_u2le()
  self.num_patterns = self._io:read_u2le()
  self.flags = self._io:read_u2le()
  self.version = self._io:read_u2le()
  self.samples_format = self._io:read_u2le()
  self.magic2 = self._io:read_bytes(4)
  if not(self.magic2 == "\083\067\082\077") then
    error("not equal, expected " .. "\083\067\082\077" .. ", but got " .. self.magic2)
  end
  self.global_volume = self._io:read_u1()
  self.initial_speed = self._io:read_u1()
  self.initial_tempo = self._io:read_u1()
  self.is_stereo = self._io:read_bits_int_be(1) ~= 0
  self.master_volume = self._io:read_bits_int_be(7)
  self._io:align_to_byte()
  self.ultra_click_removal = self._io:read_u1()
  self.has_custom_pan = self._io:read_u1()
  self.reserved2 = self._io:read_bytes(8)
  self.ofs_special = self._io:read_u2le()
  self.channels = {}
  for i = 0, 32 - 1 do
    self.channels[i + 1] = S3m.Channel(self._io, self, self._root)
  end
  self.orders = self._io:read_bytes(self.num_orders)
  self.instruments = {}
  for i = 0, self.num_instruments - 1 do
    self.instruments[i + 1] = S3m.InstrumentPtr(self._io, self, self._root)
  end
  self.patterns = {}
  for i = 0, self.num_patterns - 1 do
    self.patterns[i + 1] = S3m.PatternPtr(self._io, self, self._root)
  end
  if self.has_custom_pan == 252 then
    self.channel_pans = {}
    for i = 0, 32 - 1 do
      self.channel_pans[i + 1] = S3m.ChannelPan(self._io, self, self._root)
    end
  end
end

-- 
-- Number of orders in a song.
-- 
-- Number of instruments in a song.
-- 
-- Number of patterns in a song.
-- 
-- Scream Tracker version that was used to save this file.
-- 
-- 1 = signed samples, 2 = unsigned samples.
-- 
-- Offset of special data, not used by Scream Tracker directly.

S3m.Channel = class.class(KaitaiStruct)

function S3m.Channel:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function S3m.Channel:_read()
  self.is_disabled = self._io:read_bits_int_be(1) ~= 0
  self.ch_type = self._io:read_bits_int_be(7)
end

-- 
-- Channel type (0..7 = left sample channels, 8..15 = right sample channels, 16..31 = AdLib synth channels).

S3m.ChannelPan = class.class(KaitaiStruct)

function S3m.ChannelPan:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function S3m.ChannelPan:_read()
  self.reserved1 = self._io:read_bits_int_be(2)
  self.has_custom_pan = self._io:read_bits_int_be(1) ~= 0
  self.reserved2 = self._io:read_bits_int_be(1) ~= 0
  self.pan = self._io:read_bits_int_be(4)
end

-- 
-- If true, then use a custom pan setting provided in the `pan`
-- field. If false, the channel would use the default setting
-- (0x7 for mono, 0x3 or 0xc for stereo).

S3m.Instrument = class.class(KaitaiStruct)

S3m.Instrument.InstTypes = enum.Enum {
  sample = 1,
  melodic = 2,
  bass_drum = 3,
  snare_drum = 4,
  tom = 5,
  cymbal = 6,
  hihat = 7,
}

function S3m.Instrument:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function S3m.Instrument:_read()
  self.type = S3m.Instrument.InstTypes(self._io:read_u1())
  self.filename = KaitaiStream.bytes_terminate(self._io:read_bytes(12), 0, false)
  local _on = self.type
  if _on == S3m.Instrument.InstTypes.sample then
    self.body = S3m.Instrument.Sampled(self._io, self, self._root)
  else
    self.body = S3m.Instrument.Adlib(self._io, self, self._root)
  end
  self.tuning_hz = self._io:read_u4le()
  self.reserved2 = self._io:read_bytes(12)
  self.sample_name = KaitaiStream.bytes_terminate(self._io:read_bytes(28), 0, false)
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\083\067\082\083") then
    error("not equal, expected " .. "\083\067\082\083" .. ", but got " .. self.magic)
  end
end


S3m.Instrument.Adlib = class.class(KaitaiStruct)

function S3m.Instrument.Adlib:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function S3m.Instrument.Adlib:_read()
  self.reserved1 = self._io:read_bytes(3)
  if not(self.reserved1 == "\000\000\000") then
    error("not equal, expected " .. "\000\000\000" .. ", but got " .. self.reserved1)
  end
  self._unnamed1 = self._io:read_bytes(16)
end


S3m.Instrument.Sampled = class.class(KaitaiStruct)

function S3m.Instrument.Sampled:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function S3m.Instrument.Sampled:_read()
  self.paraptr_sample = S3m.SwappedU3(self._io, self, self._root)
  self.len_sample = self._io:read_u4le()
  self.loop_begin = self._io:read_u4le()
  self.loop_end = self._io:read_u4le()
  self.default_volume = self._io:read_u1()
  self.reserved1 = self._io:read_u1()
  self.is_packed = self._io:read_u1()
  self.flags = self._io:read_u1()
end

S3m.Instrument.Sampled.property.sample = {}
function S3m.Instrument.Sampled.property.sample:get()
  if self._m_sample ~= nil then
    return self._m_sample
  end

  local _pos = self._io:pos()
  self._io:seek(self.paraptr_sample.value * 16)
  self._m_sample = self._io:read_bytes(self.len_sample)
  self._io:seek(_pos)
  return self._m_sample
end

-- 
-- Default volume.
-- 
-- 0 = unpacked, 1 = DP30ADPCM packing.

S3m.InstrumentPtr = class.class(KaitaiStruct)

function S3m.InstrumentPtr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function S3m.InstrumentPtr:_read()
  self.paraptr = self._io:read_u2le()
end

S3m.InstrumentPtr.property.body = {}
function S3m.InstrumentPtr.property.body:get()
  if self._m_body ~= nil then
    return self._m_body
  end

  local _pos = self._io:pos()
  self._io:seek(self.paraptr * 16)
  self._m_body = S3m.Instrument(self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_body
end


S3m.Pattern = class.class(KaitaiStruct)

function S3m.Pattern:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function S3m.Pattern:_read()
  self.size = self._io:read_u2le()
  self._raw_body = self._io:read_bytes(self.size - 2)
  local _io = KaitaiStream(stringstream(self._raw_body))
  self.body = S3m.PatternCells(_io, self, self._root)
end


S3m.PatternCell = class.class(KaitaiStruct)

function S3m.PatternCell:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function S3m.PatternCell:_read()
  self.has_fx = self._io:read_bits_int_be(1) ~= 0
  self.has_volume = self._io:read_bits_int_be(1) ~= 0
  self.has_note_and_instrument = self._io:read_bits_int_be(1) ~= 0
  self.channel_num = self._io:read_bits_int_be(5)
  self._io:align_to_byte()
  if self.has_note_and_instrument then
    self.note = self._io:read_u1()
  end
  if self.has_note_and_instrument then
    self.instrument = self._io:read_u1()
  end
  if self.has_volume then
    self.volume = self._io:read_u1()
  end
  if self.has_fx then
    self.fx_type = self._io:read_u1()
  end
  if self.has_fx then
    self.fx_value = self._io:read_u1()
  end
end


S3m.PatternCells = class.class(KaitaiStruct)

function S3m.PatternCells:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function S3m.PatternCells:_read()
  self.cells = {}
  local i = 0
  while not self._io:is_eof() do
    self.cells[i + 1] = S3m.PatternCell(self._io, self, self._root)
    i = i + 1
  end
end


S3m.PatternPtr = class.class(KaitaiStruct)

function S3m.PatternPtr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function S3m.PatternPtr:_read()
  self.paraptr = self._io:read_u2le()
end

S3m.PatternPtr.property.body = {}
function S3m.PatternPtr.property.body:get()
  if self._m_body ~= nil then
    return self._m_body
  end

  local _pos = self._io:pos()
  self._io:seek(self.paraptr * 16)
  self._m_body = S3m.Pattern(self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_body
end


-- 
-- Custom 3-byte integer, stored in mixed endian manner.
S3m.SwappedU3 = class.class(KaitaiStruct)

function S3m.SwappedU3:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function S3m.SwappedU3:_read()
  self.hi = self._io:read_u1()
  self.lo = self._io:read_u2le()
end

S3m.SwappedU3.property.value = {}
function S3m.SwappedU3.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = self.lo | self.hi << 16
  return self._m_value
end



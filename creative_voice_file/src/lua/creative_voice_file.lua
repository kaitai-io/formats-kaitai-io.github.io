-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")

-- 
-- Creative Voice File is a container file format for digital audio
-- wave data. Initial revisions were able to support only unsigned
-- 8-bit PCM and ADPCM data, later versions were revised to add support
-- for 16-bit PCM and a-law / u-law formats.
-- 
-- This format was actively used in 1990s, around the advent of
-- Creative's sound cards (Sound Blaster family). It was a popular
-- choice for a digital sound container in lots of games and multimedia
-- software due to simplicity and availability of Creative's recording
-- / editing tools.
-- See also: Source (https://wiki.multimedia.cx/index.php?title=Creative_Voice)
CreativeVoiceFile = class.class(KaitaiStruct)

CreativeVoiceFile.BlockTypes = enum.Enum {
  terminator = 0,
  sound_data = 1,
  sound_data_cont = 2,
  silence = 3,
  marker = 4,
  text = 5,
  repeat_start = 6,
  repeat_end = 7,
  extra_info = 8,
  sound_data_new = 9,
}

CreativeVoiceFile.Codecs = enum.Enum {
  pcm_8bit_unsigned = 0,
  adpcm_4bit = 1,
  adpcm_2_6bit = 2,
  adpcm_2_bit = 3,
  pcm_16bit_signed = 4,
  alaw = 6,
  ulaw = 7,
  adpcm_4_to_16bit = 512,
}

function CreativeVoiceFile:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CreativeVoiceFile:_read()
  self.magic = self._io:read_bytes(20)
  if not(self.magic == "\067\114\101\097\116\105\118\101\032\086\111\105\099\101\032\070\105\108\101\026") then
    error("not equal, expected " ..  "\067\114\101\097\116\105\118\101\032\086\111\105\099\101\032\070\105\108\101\026" .. ", but got " .. self.magic)
  end
  self.header_size = self._io:read_u2le()
  self.version = self._io:read_u2le()
  self.checksum = self._io:read_u2le()
  self.blocks = {}
  local i = 0
  while not self._io:is_eof() do
    self.blocks[i + 1] = CreativeVoiceFile.Block(self._io, self, self._root)
    i = i + 1
  end
end

-- 
-- Total size of this main header (usually 0x001A).
-- 
-- Checksum: this must be equal to ~version + 0x1234.
-- 
-- Series of blocks that contain the actual audio data.

-- 
-- See also: Source (https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x04:_Marker)
CreativeVoiceFile.BlockMarker = class.class(KaitaiStruct)

function CreativeVoiceFile.BlockMarker:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CreativeVoiceFile.BlockMarker:_read()
  self.marker_id = self._io:read_u2le()
end

-- 
-- Marker ID.

-- 
-- See also: Source (https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x03:_Silence)
CreativeVoiceFile.BlockSilence = class.class(KaitaiStruct)

function CreativeVoiceFile.BlockSilence:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CreativeVoiceFile.BlockSilence:_read()
  self.duration_samples = self._io:read_u2le()
  self.freq_div = self._io:read_u1()
end

CreativeVoiceFile.BlockSilence.property.sample_rate = {}
function CreativeVoiceFile.BlockSilence.property.sample_rate:get()
  if self._m_sample_rate ~= nil then
    return self._m_sample_rate
  end

  self._m_sample_rate = (1000000.0 / (256 - self.freq_div))
  return self._m_sample_rate
end

-- 
-- Duration of silence, in seconds.
CreativeVoiceFile.BlockSilence.property.duration_sec = {}
function CreativeVoiceFile.BlockSilence.property.duration_sec:get()
  if self._m_duration_sec ~= nil then
    return self._m_duration_sec
  end

  self._m_duration_sec = (self.duration_samples / self.sample_rate)
  return self._m_duration_sec
end

-- 
-- Duration of silence, in samples.
-- 
-- Frequency divisor, used to determine sample rate.

-- 
-- See also: Source (https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x09:_Sound_data_.28New_format.29)
CreativeVoiceFile.BlockSoundDataNew = class.class(KaitaiStruct)

function CreativeVoiceFile.BlockSoundDataNew:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CreativeVoiceFile.BlockSoundDataNew:_read()
  self.sample_rate = self._io:read_u4le()
  self.bits_per_sample = self._io:read_u1()
  self.num_channels = self._io:read_u1()
  self.codec = CreativeVoiceFile.Codecs(self._io:read_u2le())
  self.reserved = self._io:read_bytes(4)
  self.wave = self._io:read_bytes_full()
end


CreativeVoiceFile.Block = class.class(KaitaiStruct)

function CreativeVoiceFile.Block:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CreativeVoiceFile.Block:_read()
  self.block_type = CreativeVoiceFile.BlockTypes(self._io:read_u1())
  if self.block_type ~= CreativeVoiceFile.BlockTypes.terminator then
    self.body_size1 = self._io:read_u2le()
  end
  if self.block_type ~= CreativeVoiceFile.BlockTypes.terminator then
    self.body_size2 = self._io:read_u1()
  end
  if self.block_type ~= CreativeVoiceFile.BlockTypes.terminator then
    local _on = self.block_type
    if _on == CreativeVoiceFile.BlockTypes.sound_data_new then
      self._raw_body = self._io:read_bytes(self.body_size)
      local _io = KaitaiStream(stringstream(self._raw_body))
      self.body = CreativeVoiceFile.BlockSoundDataNew(_io, self, self._root)
    elseif _on == CreativeVoiceFile.BlockTypes.repeat_start then
      self._raw_body = self._io:read_bytes(self.body_size)
      local _io = KaitaiStream(stringstream(self._raw_body))
      self.body = CreativeVoiceFile.BlockRepeatStart(_io, self, self._root)
    elseif _on == CreativeVoiceFile.BlockTypes.marker then
      self._raw_body = self._io:read_bytes(self.body_size)
      local _io = KaitaiStream(stringstream(self._raw_body))
      self.body = CreativeVoiceFile.BlockMarker(_io, self, self._root)
    elseif _on == CreativeVoiceFile.BlockTypes.sound_data then
      self._raw_body = self._io:read_bytes(self.body_size)
      local _io = KaitaiStream(stringstream(self._raw_body))
      self.body = CreativeVoiceFile.BlockSoundData(_io, self, self._root)
    elseif _on == CreativeVoiceFile.BlockTypes.extra_info then
      self._raw_body = self._io:read_bytes(self.body_size)
      local _io = KaitaiStream(stringstream(self._raw_body))
      self.body = CreativeVoiceFile.BlockExtraInfo(_io, self, self._root)
    elseif _on == CreativeVoiceFile.BlockTypes.silence then
      self._raw_body = self._io:read_bytes(self.body_size)
      local _io = KaitaiStream(stringstream(self._raw_body))
      self.body = CreativeVoiceFile.BlockSilence(_io, self, self._root)
    else
      self.body = self._io:read_bytes(self.body_size)
    end
  end
end

-- 
-- body_size is a 24-bit little-endian integer, so we're
-- emulating that by adding two standard-sized integers
-- (body_size1 and body_size2).
CreativeVoiceFile.Block.property.body_size = {}
function CreativeVoiceFile.Block.property.body_size:get()
  if self._m_body_size ~= nil then
    return self._m_body_size
  end

  if self.block_type ~= CreativeVoiceFile.BlockTypes.terminator then
    self._m_body_size = (self.body_size1 + (self.body_size2 << 16))
  end
  return self._m_body_size
end

-- 
-- Byte that determines type of block content.
-- 
-- Block body, type depends on block type byte.

-- 
-- See also: Source (https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x06:_Repeat_start)
CreativeVoiceFile.BlockRepeatStart = class.class(KaitaiStruct)

function CreativeVoiceFile.BlockRepeatStart:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CreativeVoiceFile.BlockRepeatStart:_read()
  self.repeat_count_1 = self._io:read_u2le()
end

-- 
-- Number of repetitions minus 1; 0xffff means infinite repetitions.

-- 
-- See also: Source (https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x01:_Sound_data)
CreativeVoiceFile.BlockSoundData = class.class(KaitaiStruct)

function CreativeVoiceFile.BlockSoundData:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CreativeVoiceFile.BlockSoundData:_read()
  self.freq_div = self._io:read_u1()
  self.codec = CreativeVoiceFile.Codecs(self._io:read_u1())
  self.wave = self._io:read_bytes_full()
end

CreativeVoiceFile.BlockSoundData.property.sample_rate = {}
function CreativeVoiceFile.BlockSoundData.property.sample_rate:get()
  if self._m_sample_rate ~= nil then
    return self._m_sample_rate
  end

  self._m_sample_rate = (1000000.0 / (256 - self.freq_div))
  return self._m_sample_rate
end

-- 
-- Frequency divisor, used to determine sample rate.

-- 
-- See also: Source (https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x08:_Extra_info)
CreativeVoiceFile.BlockExtraInfo = class.class(KaitaiStruct)

function CreativeVoiceFile.BlockExtraInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function CreativeVoiceFile.BlockExtraInfo:_read()
  self.freq_div = self._io:read_u2le()
  self.codec = CreativeVoiceFile.Codecs(self._io:read_u1())
  self.num_channels_1 = self._io:read_u1()
end

-- 
-- Number of channels (1 = mono, 2 = stereo).
CreativeVoiceFile.BlockExtraInfo.property.num_channels = {}
function CreativeVoiceFile.BlockExtraInfo.property.num_channels:get()
  if self._m_num_channels ~= nil then
    return self._m_num_channels
  end

  self._m_num_channels = (self.num_channels_1 + 1)
  return self._m_num_channels
end

CreativeVoiceFile.BlockExtraInfo.property.sample_rate = {}
function CreativeVoiceFile.BlockExtraInfo.property.sample_rate:get()
  if self._m_sample_rate ~= nil then
    return self._m_sample_rate
  end

  self._m_sample_rate = (256000000.0 / (self.num_channels * (65536 - self.freq_div)))
  return self._m_sample_rate
end

-- 
-- Frequency divisor.
-- 
-- Number of channels minus 1 (0 = mono, 1 = stereo).


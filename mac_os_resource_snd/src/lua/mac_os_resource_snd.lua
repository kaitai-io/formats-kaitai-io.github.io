-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local str_decode = require("string_decode")
local utils = require("utils")

-- 
-- Sound resources were introduced in Classic MacOS with the Sound Manager program.
-- They can contain sound commands to generate sounds with given frequencies as well as sampled sound data.
-- They are mostly found in resource forks, but can occasionally appear standalone or embedded in other files.
-- See also: Source (https://developer.apple.com/library/archive/documentation/mac/pdf/Sound/Sound_Manager.pdf)
MacOsResourceSnd = class.class(KaitaiStruct)

MacOsResourceSnd.CmdType = enum.Enum {
  null_cmd = 0,
  quiet_cmd = 3,
  flush_cmd = 4,
  re_init_cmd = 5,
  wait_cmd = 10,
  pause_cmd = 11,
  resume_cmd = 12,
  call_back_cmd = 13,
  sync_cmd = 14,
  empty_cmd = 15,
  available_cmd = 24,
  version_cmd = 25,
  total_load_cmd = 26,
  load_cmd = 27,
  freq_duration_cmd = 40,
  rest_cmd = 41,
  freq_cmd = 42,
  amp_cmd = 43,
  timbre_cmd = 44,
  get_amp_cmd = 45,
  volume_cmd = 46,
  get_volume_cmd = 47,
  wave_table_cmd = 60,
  phase_cmd = 61,
  sound_cmd = 80,
  buffer_cmd = 81,
  rate_cmd = 82,
  get_rate_cmd = 85,
}

MacOsResourceSnd.CompressionTypeEnum = enum.Enum {
  variable_compression = -2,
  fixed_compression = -1,
  not_compressed = 0,
  two_to_one = 1,
  eight_to_three = 2,
  three_to_one = 3,
  six_to_one = 4,
}

MacOsResourceSnd.DataType = enum.Enum {
  square_wave_synth = 1,
  wave_table_synth = 3,
  sampled_synth = 5,
}

MacOsResourceSnd.InitOption = enum.Enum {
  chan_left = 2,
  chan_right = 3,
  no_interp = 4,
  no_drop = 8,
  mono = 128,
  stereo = 192,
  mace3 = 768,
  mace6 = 1024,
}

MacOsResourceSnd.SoundHeaderType = enum.Enum {
  standard = 0,
  compressed = 254,
  extended = 255,
}

MacOsResourceSnd.WaveInitOption = enum.Enum {
  channel0 = 4,
  channel1 = 5,
  channel2 = 6,
  channel3 = 7,
}

function MacOsResourceSnd:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MacOsResourceSnd:_read()
  self.format = self._io:read_u2be()
  if self.format == 1 then
    self.num_data_formats = self._io:read_u2be()
  end
  if self.format == 1 then
    self.data_formats = {}
    for i = 0, self.num_data_formats - 1 do
      self.data_formats[i + 1] = MacOsResourceSnd.DataFormat(self._io, self, self._root)
    end
  end
  if self.format == 2 then
    self.reference_count = self._io:read_u2be()
  end
  self.num_sound_commands = self._io:read_u2be()
  self.sound_commands = {}
  for i = 0, self.num_sound_commands - 1 do
    self.sound_commands[i + 1] = MacOsResourceSnd.SoundCommand(self._io, self, self._root)
  end
end

-- 
-- Lookup table to convert a MIDI note into a frequency in Hz
-- The lookup table represents the formula (2 ** ((midi_note - 69) / 12)) * 440
-- See also: Source (https://en.wikipedia.org/wiki/MIDI_tuning_standard)
MacOsResourceSnd.property.midi_note_to_frequency = {}
function MacOsResourceSnd.property.midi_note_to_frequency:get()
  if self._m_midi_note_to_frequency ~= nil then
    return self._m_midi_note_to_frequency
  end

  self._m_midi_note_to_frequency = {8.18, 8.66, 9.18, 9.72, 10.30, 10.91, 11.56, 12.25, 12.98, 13.75, 14.57, 15.43, 16.35, 17.32, 18.35, 19.45, 20.60, 21.83, 23.12, 24.50, 25.96, 27.50, 29.14, 30.87, 32.70, 34.65, 36.71, 38.89, 41.20, 43.65, 46.25, 49.00, 51.91, 55.00, 58.27, 61.74, 65.41, 69.30, 73.42, 77.78, 82.41, 87.31, 92.50, 98.00, 103.83, 110.00, 116.54, 123.47, 130.81, 138.59, 146.83, 155.56, 164.81, 174.61, 185.00, 196.00, 207.65, 220.00, 233.08, 246.94, 261.63, 277.18, 293.66, 311.13, 329.63, 349.23, 369.99, 392.00, 415.30, 440.00, 466.16, 493.88, 523.25, 554.37, 587.33, 622.25, 659.26, 698.46, 739.99, 783.99, 830.61, 880.00, 932.33, 987.77, 1046.50, 1108.73, 1174.66, 1244.51, 1318.51, 1396.91, 1479.98, 1567.98, 1661.22, 1760.00, 1864.66, 1975.53, 2093.00, 2217.46, 2349.32, 2489.02, 2637.02, 2793.83, 2959.96, 3135.96, 3322.44, 3520.00, 3729.31, 3951.07, 4186.01, 4434.92, 4698.64, 4978.03, 5274.04, 5587.65, 5919.91, 6271.93, 6644.88, 7040.00, 7458.62, 7902.13, 8372.02, 8869.84, 9397.27, 9956.06, 10548.08, 11175.30, 11839.82, 12543.85}
  return self._m_midi_note_to_frequency
end


MacOsResourceSnd.Compressed = class.class(KaitaiStruct)

function MacOsResourceSnd.Compressed:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function MacOsResourceSnd.Compressed:_read()
  self.format = str_decode.decode(self._io:read_bytes(4), "ASCII")
  self.reserved = self._io:read_bytes(4)
  self.state_vars_ptr = self._io:read_u4be()
  self.left_over_samples_ptr = self._io:read_u4be()
  self.compression_id = self._io:read_s2be()
  self.packet_size = self._io:read_u2be()
  self.synthesizer_id = self._io:read_u2be()
end

MacOsResourceSnd.Compressed.property.compression_type = {}
function MacOsResourceSnd.Compressed.property.compression_type:get()
  if self._m_compression_type ~= nil then
    return self._m_compression_type
  end

  self._m_compression_type = MacOsResourceSnd.CompressionTypeEnum(self.compression_id)
  return self._m_compression_type
end

-- 
-- data format type.
-- 
-- pointer to StateBlock.
-- 
-- pointer to LeftOverBlock.
-- 
-- ID of compression algorithm.
-- 
-- number of bits per packet.
-- 
-- Latest Sound Manager documentation specifies this field as:
-- This field is unused. You should set it to 0.
-- Inside Macintosh (Volume VI, 1991) specifies it as:
-- Indicates the resource ID number of the 'snth' resource that was used to compress the packets contained in the compressed sound header.
-- See also: Page 22-49, absolute page number 1169 in the PDF (https://vintageapple.org/inside_o/pdf/Inside_Macintosh_Volume_VI_1991.pdf)

MacOsResourceSnd.DataFormat = class.class(KaitaiStruct)

function MacOsResourceSnd.DataFormat:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function MacOsResourceSnd.DataFormat:_read()
  self.id = MacOsResourceSnd.DataType(self._io:read_u2be())
  self.options = self._io:read_u4be()
end

MacOsResourceSnd.DataFormat.property.comp_init = {}
function MacOsResourceSnd.DataFormat.property.comp_init:get()
  if self._m_comp_init ~= nil then
    return self._m_comp_init
  end

  self._m_comp_init = MacOsResourceSnd.InitOption(self.options & self.init_comp_mask)
  return self._m_comp_init
end

-- 
-- mask for compression IDs.
MacOsResourceSnd.DataFormat.property.init_comp_mask = {}
function MacOsResourceSnd.DataFormat.property.init_comp_mask:get()
  if self._m_init_comp_mask ~= nil then
    return self._m_init_comp_mask
  end

  self._m_init_comp_mask = 65280
  return self._m_init_comp_mask
end

-- 
-- mask for right/left pan values.
MacOsResourceSnd.DataFormat.property.init_pan_mask = {}
function MacOsResourceSnd.DataFormat.property.init_pan_mask:get()
  if self._m_init_pan_mask ~= nil then
    return self._m_init_pan_mask
  end

  self._m_init_pan_mask = 3
  return self._m_init_pan_mask
end

-- 
-- mask for mono/stereo values.
MacOsResourceSnd.DataFormat.property.init_stereo_mask = {}
function MacOsResourceSnd.DataFormat.property.init_stereo_mask:get()
  if self._m_init_stereo_mask ~= nil then
    return self._m_init_stereo_mask
  end

  self._m_init_stereo_mask = 192
  return self._m_init_stereo_mask
end

MacOsResourceSnd.DataFormat.property.pan_init = {}
function MacOsResourceSnd.DataFormat.property.pan_init:get()
  if self._m_pan_init ~= nil then
    return self._m_pan_init
  end

  self._m_pan_init = MacOsResourceSnd.InitOption(self.options & self.init_pan_mask)
  return self._m_pan_init
end

MacOsResourceSnd.DataFormat.property.stereo_init = {}
function MacOsResourceSnd.DataFormat.property.stereo_init:get()
  if self._m_stereo_init ~= nil then
    return self._m_stereo_init
  end

  self._m_stereo_init = MacOsResourceSnd.InitOption(self.options & self.init_stereo_mask)
  return self._m_stereo_init
end

MacOsResourceSnd.DataFormat.property.wave_init = {}
function MacOsResourceSnd.DataFormat.property.wave_init:get()
  if self._m_wave_init ~= nil then
    return self._m_wave_init
  end

  if self.id == MacOsResourceSnd.DataType.wave_table_synth then
    self._m_wave_init = MacOsResourceSnd.WaveInitOption(self.options & self.wave_init_channel_mask)
  end
  return self._m_wave_init
end

-- 
-- wave table only, Sound Manager 2.0 and earlier.
MacOsResourceSnd.DataFormat.property.wave_init_channel_mask = {}
function MacOsResourceSnd.DataFormat.property.wave_init_channel_mask:get()
  if self._m_wave_init_channel_mask ~= nil then
    return self._m_wave_init_channel_mask
  end

  self._m_wave_init_channel_mask = 7
  return self._m_wave_init_channel_mask
end

-- 
-- contains initialisation options for the SndNewChannel function.

MacOsResourceSnd.Extended = class.class(KaitaiStruct)

function MacOsResourceSnd.Extended:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function MacOsResourceSnd.Extended:_read()
  self.instrument_chunk_ptr = self._io:read_u4be()
  self.aes_recording_ptr = self._io:read_u4be()
end

-- 
-- pointer to instrument info.
-- 
-- pointer to audio info.

MacOsResourceSnd.ExtendedOrCompressed = class.class(KaitaiStruct)

function MacOsResourceSnd.ExtendedOrCompressed:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function MacOsResourceSnd.ExtendedOrCompressed:_read()
  self.num_frames = self._io:read_u4be()
  self.aiff_sample_rate = self._io:read_bytes(10)
  self.marker_chunk = self._io:read_u4be()
  if self._parent.sound_header_type == MacOsResourceSnd.SoundHeaderType.extended then
    self.extended = MacOsResourceSnd.Extended(self._io, self, self._root)
  end
  if self._parent.sound_header_type == MacOsResourceSnd.SoundHeaderType.compressed then
    self.compressed = MacOsResourceSnd.Compressed(self._io, self, self._root)
  end
  self.bits_per_sample = self._io:read_u2be()
  if self._parent.sound_header_type == MacOsResourceSnd.SoundHeaderType.extended then
    self.reserved = self._io:read_bytes(14)
  end
end

-- 
-- rate of original sample (Extended80).
-- 
-- reserved.
-- 
-- number of bits per sample.
-- 
-- reserved.

MacOsResourceSnd.SoundCommand = class.class(KaitaiStruct)

function MacOsResourceSnd.SoundCommand:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function MacOsResourceSnd.SoundCommand:_read()
  self.is_data_offset = self._io:read_bits_int_be(1) ~= 0
  self.cmd = MacOsResourceSnd.CmdType(self._io:read_bits_int_be(15))
  self._io:align_to_byte()
  self.param1 = self._io:read_u2be()
  self.param2 = self._io:read_u4be()
end

MacOsResourceSnd.SoundCommand.property.sound_header = {}
function MacOsResourceSnd.SoundCommand.property.sound_header:get()
  if self._m_sound_header ~= nil then
    return self._m_sound_header
  end

  if  ((self.is_data_offset) and (self.cmd == MacOsResourceSnd.CmdType.buffer_cmd))  then
    local _pos = self._io:pos()
    self._io:seek(self.param2)
    self._m_sound_header = MacOsResourceSnd.SoundHeader(self._io, self, self._root)
    self._io:seek(_pos)
  end
  return self._m_sound_header
end


MacOsResourceSnd.SoundHeader = class.class(KaitaiStruct)

function MacOsResourceSnd.SoundHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function MacOsResourceSnd.SoundHeader:_read()
  if self.start_ofs < 0 then
    self._unnamed0 = self._io:read_bytes(0)
  end
  self.sample_ptr = self._io:read_u4be()
  if self.sound_header_type == MacOsResourceSnd.SoundHeaderType.standard then
    self.num_samples = self._io:read_u4be()
  end
  if  ((self.sound_header_type == MacOsResourceSnd.SoundHeaderType.extended) or (self.sound_header_type == MacOsResourceSnd.SoundHeaderType.compressed))  then
    self.num_channels = self._io:read_u4be()
  end
  self.sample_rate = MacOsResourceSnd.UnsignedFixedPoint(self._io, self, self._root)
  self.loop_start = self._io:read_u4be()
  self.loop_end = self._io:read_u4be()
  self.encode = MacOsResourceSnd.SoundHeaderType(self._io:read_u1())
  self.midi_note = self._io:read_u1()
  if  ((self.sound_header_type == MacOsResourceSnd.SoundHeaderType.extended) or (self.sound_header_type == MacOsResourceSnd.SoundHeaderType.compressed))  then
    self.extended_or_compressed = MacOsResourceSnd.ExtendedOrCompressed(self._io, self, self._root)
  end
  if self.sample_ptr == 0 then
    self.sample_area = self._io:read_bytes(utils.box_unwrap((self.sound_header_type == MacOsResourceSnd.SoundHeaderType.standard) and utils.box_wrap(self.num_samples) or (utils.box_unwrap((self.sound_header_type == MacOsResourceSnd.SoundHeaderType.extended) and utils.box_wrap(math.floor(((self.extended_or_compressed.num_frames * self.num_channels) * self.extended_or_compressed.bits_per_sample) / 8)) or (self._io:size() - self._io:pos())))))
  end
end

-- 
-- base frequency of sample in Hz
-- Calculated with the formula (2 ** ((midi_note - 69) / 12)) * 440
-- See also: Source (https://en.wikipedia.org/wiki/MIDI_tuning_standard)
MacOsResourceSnd.SoundHeader.property.base_freqeuncy = {}
function MacOsResourceSnd.SoundHeader.property.base_freqeuncy:get()
  if self._m_base_freqeuncy ~= nil then
    return self._m_base_freqeuncy
  end

  if  ((self.midi_note >= 0) and (self.midi_note < 128))  then
    self._m_base_freqeuncy = self._root.midi_note_to_frequency[self.midi_note + 1]
  end
  return self._m_base_freqeuncy
end

MacOsResourceSnd.SoundHeader.property.sound_header_type = {}
function MacOsResourceSnd.SoundHeader.property.sound_header_type:get()
  if self._m_sound_header_type ~= nil then
    return self._m_sound_header_type
  end

  local _pos = self._io:pos()
  self._io:seek(self.start_ofs + 20)
  self._m_sound_header_type = MacOsResourceSnd.SoundHeaderType(self._io:read_u1())
  self._io:seek(_pos)
  return self._m_sound_header_type
end

MacOsResourceSnd.SoundHeader.property.start_ofs = {}
function MacOsResourceSnd.SoundHeader.property.start_ofs:get()
  if self._m_start_ofs ~= nil then
    return self._m_start_ofs
  end

  self._m_start_ofs = self._io:pos()
  return self._m_start_ofs
end

-- 
-- pointer to samples (or 0 if samples follow data structure).
-- 
-- number of samples.
-- 
-- number of channels in sample.
-- 
-- The rate at which the sample was originally recorded.
-- 
-- loop point beginning.
-- 
-- loop point ending.
-- 
-- sample's encoding option.
-- 
-- base frequency of sample, expressed as MIDI note values, 60 is middle C.
-- 
-- sampled-sound data.

MacOsResourceSnd.UnsignedFixedPoint = class.class(KaitaiStruct)

function MacOsResourceSnd.UnsignedFixedPoint:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function MacOsResourceSnd.UnsignedFixedPoint:_read()
  self.integer_part = self._io:read_u2be()
  self.fraction_part = self._io:read_u2be()
end

MacOsResourceSnd.UnsignedFixedPoint.property.value = {}
function MacOsResourceSnd.UnsignedFixedPoint.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = self.integer_part + self.fraction_part / 65535.0
  return self._m_value
end



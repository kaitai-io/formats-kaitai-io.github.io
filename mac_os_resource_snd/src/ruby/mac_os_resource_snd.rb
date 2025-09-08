# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Sound resources were introduced in Classic MacOS with the Sound Manager program.
# They can contain sound commands to generate sounds with given frequencies as well as sampled sound data.
# They are mostly found in resource forks, but can occasionally appear standalone or embedded in other files.
# @see https://developer.apple.com/library/archive/documentation/mac/pdf/Sound/Sound_Manager.pdf Source
class MacOsResourceSnd < Kaitai::Struct::Struct

  CMD_TYPE = {
    0 => :cmd_type_null_cmd,
    3 => :cmd_type_quiet_cmd,
    4 => :cmd_type_flush_cmd,
    5 => :cmd_type_re_init_cmd,
    10 => :cmd_type_wait_cmd,
    11 => :cmd_type_pause_cmd,
    12 => :cmd_type_resume_cmd,
    13 => :cmd_type_call_back_cmd,
    14 => :cmd_type_sync_cmd,
    15 => :cmd_type_empty_cmd,
    24 => :cmd_type_available_cmd,
    25 => :cmd_type_version_cmd,
    26 => :cmd_type_total_load_cmd,
    27 => :cmd_type_load_cmd,
    40 => :cmd_type_freq_duration_cmd,
    41 => :cmd_type_rest_cmd,
    42 => :cmd_type_freq_cmd,
    43 => :cmd_type_amp_cmd,
    44 => :cmd_type_timbre_cmd,
    45 => :cmd_type_get_amp_cmd,
    46 => :cmd_type_volume_cmd,
    47 => :cmd_type_get_volume_cmd,
    60 => :cmd_type_wave_table_cmd,
    61 => :cmd_type_phase_cmd,
    80 => :cmd_type_sound_cmd,
    81 => :cmd_type_buffer_cmd,
    82 => :cmd_type_rate_cmd,
    85 => :cmd_type_get_rate_cmd,
  }
  I__CMD_TYPE = CMD_TYPE.invert

  COMPRESSION_TYPE_ENUM = {
    -2 => :compression_type_enum_variable_compression,
    -1 => :compression_type_enum_fixed_compression,
    0 => :compression_type_enum_not_compressed,
    1 => :compression_type_enum_two_to_one,
    2 => :compression_type_enum_eight_to_three,
    3 => :compression_type_enum_three_to_one,
    4 => :compression_type_enum_six_to_one,
  }
  I__COMPRESSION_TYPE_ENUM = COMPRESSION_TYPE_ENUM.invert

  DATA_TYPE = {
    1 => :data_type_square_wave_synth,
    3 => :data_type_wave_table_synth,
    5 => :data_type_sampled_synth,
  }
  I__DATA_TYPE = DATA_TYPE.invert

  INIT_OPTION = {
    2 => :init_option_chan_left,
    3 => :init_option_chan_right,
    4 => :init_option_no_interp,
    8 => :init_option_no_drop,
    128 => :init_option_mono,
    192 => :init_option_stereo,
    768 => :init_option_mace3,
    1024 => :init_option_mace6,
  }
  I__INIT_OPTION = INIT_OPTION.invert

  SOUND_HEADER_TYPE = {
    0 => :sound_header_type_standard,
    254 => :sound_header_type_compressed,
    255 => :sound_header_type_extended,
  }
  I__SOUND_HEADER_TYPE = SOUND_HEADER_TYPE.invert

  WAVE_INIT_OPTION = {
    4 => :wave_init_option_channel0,
    5 => :wave_init_option_channel1,
    6 => :wave_init_option_channel2,
    7 => :wave_init_option_channel3,
  }
  I__WAVE_INIT_OPTION = WAVE_INIT_OPTION.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @format = @_io.read_u2be
    if format == 1
      @num_data_formats = @_io.read_u2be
    end
    if format == 1
      @data_formats = []
      (num_data_formats).times { |i|
        @data_formats << DataFormat.new(@_io, self, @_root)
      }
    end
    if format == 2
      @reference_count = @_io.read_u2be
    end
    @num_sound_commands = @_io.read_u2be
    @sound_commands = []
    (num_sound_commands).times { |i|
      @sound_commands << SoundCommand.new(@_io, self, @_root)
    }
    self
  end
  class Compressed < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @format = (@_io.read_bytes(4)).force_encoding("ASCII").encode('UTF-8')
      @reserved = @_io.read_bytes(4)
      @state_vars_ptr = @_io.read_u4be
      @left_over_samples_ptr = @_io.read_u4be
      @compression_id = @_io.read_s2be
      @packet_size = @_io.read_u2be
      @synthesizer_id = @_io.read_u2be
      self
    end
    def compression_type
      return @compression_type unless @compression_type.nil?
      @compression_type = Kaitai::Struct::Stream::resolve_enum(MacOsResourceSnd::COMPRESSION_TYPE_ENUM, compression_id)
      @compression_type
    end

    ##
    # data format type
    attr_reader :format
    attr_reader :reserved

    ##
    # pointer to StateBlock
    attr_reader :state_vars_ptr

    ##
    # pointer to LeftOverBlock
    attr_reader :left_over_samples_ptr

    ##
    # ID of compression algorithm
    attr_reader :compression_id

    ##
    # number of bits per packet
    attr_reader :packet_size

    ##
    # Latest Sound Manager documentation specifies this field as:
    # This field is unused. You should set it to 0.
    # Inside Macintosh (Volume VI, 1991) specifies it as:
    # Indicates the resource ID number of the 'snth' resource that was used to compress the packets contained in the compressed sound header.
    # @see https://vintageapple.org/inside_o/pdf/Inside_Macintosh_Volume_VI_1991.pdf Page 22-49, absolute page number 1169 in the PDF
    attr_reader :synthesizer_id
  end
  class DataFormat < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @id = Kaitai::Struct::Stream::resolve_enum(MacOsResourceSnd::DATA_TYPE, @_io.read_u2be)
      @options = @_io.read_u4be
      self
    end
    def comp_init
      return @comp_init unless @comp_init.nil?
      @comp_init = Kaitai::Struct::Stream::resolve_enum(MacOsResourceSnd::INIT_OPTION, options & init_comp_mask)
      @comp_init
    end

    ##
    # mask for compression IDs
    def init_comp_mask
      return @init_comp_mask unless @init_comp_mask.nil?
      @init_comp_mask = 65280
      @init_comp_mask
    end

    ##
    # mask for right/left pan values
    def init_pan_mask
      return @init_pan_mask unless @init_pan_mask.nil?
      @init_pan_mask = 3
      @init_pan_mask
    end

    ##
    # mask for mono/stereo values
    def init_stereo_mask
      return @init_stereo_mask unless @init_stereo_mask.nil?
      @init_stereo_mask = 192
      @init_stereo_mask
    end
    def pan_init
      return @pan_init unless @pan_init.nil?
      @pan_init = Kaitai::Struct::Stream::resolve_enum(MacOsResourceSnd::INIT_OPTION, options & init_pan_mask)
      @pan_init
    end
    def stereo_init
      return @stereo_init unless @stereo_init.nil?
      @stereo_init = Kaitai::Struct::Stream::resolve_enum(MacOsResourceSnd::INIT_OPTION, options & init_stereo_mask)
      @stereo_init
    end
    def wave_init
      return @wave_init unless @wave_init.nil?
      if id == :data_type_wave_table_synth
        @wave_init = Kaitai::Struct::Stream::resolve_enum(MacOsResourceSnd::WAVE_INIT_OPTION, options & wave_init_channel_mask)
      end
      @wave_init
    end

    ##
    # wave table only, Sound Manager 2.0 and earlier
    def wave_init_channel_mask
      return @wave_init_channel_mask unless @wave_init_channel_mask.nil?
      @wave_init_channel_mask = 7
      @wave_init_channel_mask
    end
    attr_reader :id

    ##
    # contains initialisation options for the SndNewChannel function
    attr_reader :options
  end
  class Extended < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @instrument_chunk_ptr = @_io.read_u4be
      @aes_recording_ptr = @_io.read_u4be
      self
    end

    ##
    # pointer to instrument info
    attr_reader :instrument_chunk_ptr

    ##
    # pointer to audio info
    attr_reader :aes_recording_ptr
  end
  class ExtendedOrCompressed < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_frames = @_io.read_u4be
      @aiff_sample_rate = @_io.read_bytes(10)
      @marker_chunk = @_io.read_u4be
      if _parent.sound_header_type == :sound_header_type_extended
        @extended = Extended.new(@_io, self, @_root)
      end
      if _parent.sound_header_type == :sound_header_type_compressed
        @compressed = Compressed.new(@_io, self, @_root)
      end
      @bits_per_sample = @_io.read_u2be
      if _parent.sound_header_type == :sound_header_type_extended
        @reserved = @_io.read_bytes(14)
      end
      self
    end
    attr_reader :num_frames

    ##
    # rate of original sample (Extended80)
    attr_reader :aiff_sample_rate

    ##
    # reserved
    attr_reader :marker_chunk
    attr_reader :extended
    attr_reader :compressed

    ##
    # number of bits per sample
    attr_reader :bits_per_sample

    ##
    # reserved
    attr_reader :reserved
  end
  class SoundCommand < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @is_data_offset = @_io.read_bits_int_be(1) != 0
      @cmd = Kaitai::Struct::Stream::resolve_enum(MacOsResourceSnd::CMD_TYPE, @_io.read_bits_int_be(15))
      @_io.align_to_byte
      @param1 = @_io.read_u2be
      @param2 = @_io.read_u4be
      self
    end
    def sound_header
      return @sound_header unless @sound_header.nil?
      if  ((is_data_offset) && (cmd == :cmd_type_buffer_cmd)) 
        _pos = @_io.pos
        @_io.seek(param2)
        @sound_header = SoundHeader.new(@_io, self, @_root)
        @_io.seek(_pos)
      end
      @sound_header
    end
    attr_reader :is_data_offset
    attr_reader :cmd
    attr_reader :param1
    attr_reader :param2
  end
  class SoundHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      if start_ofs < 0
        @_unnamed0 = @_io.read_bytes(0)
      end
      @sample_ptr = @_io.read_u4be
      if sound_header_type == :sound_header_type_standard
        @num_samples = @_io.read_u4be
      end
      if  ((sound_header_type == :sound_header_type_extended) || (sound_header_type == :sound_header_type_compressed)) 
        @num_channels = @_io.read_u4be
      end
      @sample_rate = UnsignedFixedPoint.new(@_io, self, @_root)
      @loop_start = @_io.read_u4be
      @loop_end = @_io.read_u4be
      @encode = Kaitai::Struct::Stream::resolve_enum(MacOsResourceSnd::SOUND_HEADER_TYPE, @_io.read_u1)
      @midi_note = @_io.read_u1
      if  ((sound_header_type == :sound_header_type_extended) || (sound_header_type == :sound_header_type_compressed)) 
        @extended_or_compressed = ExtendedOrCompressed.new(@_io, self, @_root)
      end
      if sample_ptr == 0
        @sample_area = @_io.read_bytes((sound_header_type == :sound_header_type_standard ? num_samples : (sound_header_type == :sound_header_type_extended ? ((extended_or_compressed.num_frames * num_channels) * extended_or_compressed.bits_per_sample) / 8 : _io.size - _io.pos)))
      end
      self
    end

    ##
    # base frequency of sample in Hz
    # Calculated with the formula (2 ** ((midi_note - 69) / 12)) * 440
    # @see https://en.wikipedia.org/wiki/MIDI_tuning_standard Source
    def base_freqeuncy
      return @base_freqeuncy unless @base_freqeuncy.nil?
      if  ((midi_note >= 0) && (midi_note < 128)) 
        @base_freqeuncy = _root.midi_note_to_frequency[midi_note]
      end
      @base_freqeuncy
    end
    def sound_header_type
      return @sound_header_type unless @sound_header_type.nil?
      _pos = @_io.pos
      @_io.seek(start_ofs + 20)
      @sound_header_type = Kaitai::Struct::Stream::resolve_enum(MacOsResourceSnd::SOUND_HEADER_TYPE, @_io.read_u1)
      @_io.seek(_pos)
      @sound_header_type
    end
    def start_ofs
      return @start_ofs unless @start_ofs.nil?
      @start_ofs = _io.pos
      @start_ofs
    end
    attr_reader :_unnamed0

    ##
    # pointer to samples (or 0 if samples follow data structure)
    attr_reader :sample_ptr

    ##
    # number of samples
    attr_reader :num_samples

    ##
    # number of channels in sample
    attr_reader :num_channels

    ##
    # The rate at which the sample was originally recorded.
    attr_reader :sample_rate

    ##
    # loop point beginning
    attr_reader :loop_start

    ##
    # loop point ending
    attr_reader :loop_end

    ##
    # sample's encoding option
    attr_reader :encode

    ##
    # base frequency of sample, expressed as MIDI note values, 60 is middle C
    attr_reader :midi_note
    attr_reader :extended_or_compressed

    ##
    # sampled-sound data
    attr_reader :sample_area
  end
  class UnsignedFixedPoint < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @integer_part = @_io.read_u2be
      @fraction_part = @_io.read_u2be
      self
    end
    def value
      return @value unless @value.nil?
      @value = integer_part + fraction_part / 65535.0
      @value
    end
    attr_reader :integer_part
    attr_reader :fraction_part
  end

  ##
  # Lookup table to convert a MIDI note into a frequency in Hz
  # The lookup table represents the formula (2 ** ((midi_note - 69) / 12)) * 440
  # @see https://en.wikipedia.org/wiki/MIDI_tuning_standard Source
  def midi_note_to_frequency
    return @midi_note_to_frequency unless @midi_note_to_frequency.nil?
    @midi_note_to_frequency = [8.18, 8.66, 9.18, 9.72, 10.30, 10.91, 11.56, 12.25, 12.98, 13.75, 14.57, 15.43, 16.35, 17.32, 18.35, 19.45, 20.60, 21.83, 23.12, 24.50, 25.96, 27.50, 29.14, 30.87, 32.70, 34.65, 36.71, 38.89, 41.20, 43.65, 46.25, 49.00, 51.91, 55.00, 58.27, 61.74, 65.41, 69.30, 73.42, 77.78, 82.41, 87.31, 92.50, 98.00, 103.83, 110.00, 116.54, 123.47, 130.81, 138.59, 146.83, 155.56, 164.81, 174.61, 185.00, 196.00, 207.65, 220.00, 233.08, 246.94, 261.63, 277.18, 293.66, 311.13, 329.63, 349.23, 369.99, 392.00, 415.30, 440.00, 466.16, 493.88, 523.25, 554.37, 587.33, 622.25, 659.26, 698.46, 739.99, 783.99, 830.61, 880.00, 932.33, 987.77, 1046.50, 1108.73, 1174.66, 1244.51, 1318.51, 1396.91, 1479.98, 1567.98, 1661.22, 1760.00, 1864.66, 1975.53, 2093.00, 2217.46, 2349.32, 2489.02, 2637.02, 2793.83, 2959.96, 3135.96, 3322.44, 3520.00, 3729.31, 3951.07, 4186.01, 4434.92, 4698.64, 4978.03, 5274.04, 5587.65, 5919.91, 6271.93, 6644.88, 7040.00, 7458.62, 7902.13, 8372.02, 8869.84, 9397.27, 9956.06, 10548.08, 11175.30, 11839.82, 12543.85]
    @midi_note_to_frequency
  end
  attr_reader :format
  attr_reader :num_data_formats
  attr_reader :data_formats
  attr_reader :reference_count
  attr_reader :num_sound_commands
  attr_reader :sound_commands
end

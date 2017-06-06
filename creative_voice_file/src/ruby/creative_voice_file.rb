# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Creative Voice File is a container file format for digital audio
# wave data. Initial revisions were able to support only unsigned
# 8-bit PCM and ADPCM data, later versions were revised to add support
# for 16-bit PCM and a-law / u-law formats.
# 
# This format was actively used in 1990s, around the advent of
# Creative's sound cards (Sound Blaster family). It was a popular
# choice for a digital sound container in lots of games and multimedia
# software due to simplicity and availability of Creative's recording
# / editing tools.
# @see https://wiki.multimedia.cx/index.php?title=Creative_Voice Source
class CreativeVoiceFile < Kaitai::Struct::Struct

  BLOCK_TYPES = {
    0 => :block_types_terminator,
    1 => :block_types_sound_data,
    2 => :block_types_sound_data_cont,
    3 => :block_types_silence,
    4 => :block_types_marker,
    5 => :block_types_text,
    6 => :block_types_repeat_start,
    7 => :block_types_repeat_end,
    8 => :block_types_extra_info,
    9 => :block_types_sound_data_new,
  }
  I__BLOCK_TYPES = BLOCK_TYPES.invert

  CODECS = {
    0 => :codecs_pcm_8bit_unsigned,
    1 => :codecs_adpcm_4bit,
    2 => :codecs_adpcm_2_6bit,
    3 => :codecs_adpcm_2_bit,
    4 => :codecs_pcm_16bit_signed,
    6 => :codecs_alaw,
    7 => :codecs_ulaw,
    512 => :codecs_adpcm_4_to_16bit,
  }
  I__CODECS = CODECS.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end
  def _read
    @magic = @_io.ensure_fixed_contents([67, 114, 101, 97, 116, 105, 118, 101, 32, 86, 111, 105, 99, 101, 32, 70, 105, 108, 101, 26].pack('C*'))
    @header_size = @_io.read_u2le
    @version = @_io.read_u2le
    @checksum = @_io.read_u2le
    @blocks = []
    while not @_io.eof?
      @blocks << Block.new(@_io, self, @_root)
    end
  end

  ##
  # @see https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x04:_Marker Source
  class BlockMarker < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @marker_id = @_io.read_u2le
    end

    ##
    # Marker ID
    attr_reader :marker_id
  end

  ##
  # @see https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x03:_Silence Source
  class BlockSilence < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @duration_samples = @_io.read_u2le
      @freq_div = @_io.read_u1
    end
    def sample_rate
      return @sample_rate unless @sample_rate.nil?
      @sample_rate = (1000000.0 / (256 - freq_div))
      @sample_rate
    end

    ##
    # Duration of silence, in seconds
    def duration_sec
      return @duration_sec unless @duration_sec.nil?
      @duration_sec = (duration_samples / sample_rate)
      @duration_sec
    end

    ##
    # Duration of silence, in samples
    attr_reader :duration_samples

    ##
    # Frequency divisor, used to determine sample rate
    attr_reader :freq_div
  end

  ##
  # @see https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x09:_Sound_data_.28New_format.29 Source
  class BlockSoundDataNew < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @sample_rate = @_io.read_u4le
      @bits_per_sample = @_io.read_u1
      @num_channels = @_io.read_u1
      @codec = Kaitai::Struct::Stream::resolve_enum(CODECS, @_io.read_u2le)
      @reserved = @_io.read_bytes(4)
      @wave = @_io.read_bytes_full
    end
    attr_reader :sample_rate
    attr_reader :bits_per_sample
    attr_reader :num_channels
    attr_reader :codec
    attr_reader :reserved
    attr_reader :wave
  end
  class Block < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @block_type = Kaitai::Struct::Stream::resolve_enum(BLOCK_TYPES, @_io.read_u1)
      if block_type != :block_types_terminator
        @body_size1 = @_io.read_u2le
      end
      if block_type != :block_types_terminator
        @body_size2 = @_io.read_u1
      end
      if block_type != :block_types_terminator
        case block_type
        when :block_types_silence
          @_raw_body = @_io.read_bytes(body_size)
          io = Kaitai::Struct::Stream.new(@_raw_body)
          @body = BlockSilence.new(io, self, @_root)
        when :block_types_sound_data
          @_raw_body = @_io.read_bytes(body_size)
          io = Kaitai::Struct::Stream.new(@_raw_body)
          @body = BlockSoundData.new(io, self, @_root)
        when :block_types_marker
          @_raw_body = @_io.read_bytes(body_size)
          io = Kaitai::Struct::Stream.new(@_raw_body)
          @body = BlockMarker.new(io, self, @_root)
        when :block_types_sound_data_new
          @_raw_body = @_io.read_bytes(body_size)
          io = Kaitai::Struct::Stream.new(@_raw_body)
          @body = BlockSoundDataNew.new(io, self, @_root)
        when :block_types_repeat_start
          @_raw_body = @_io.read_bytes(body_size)
          io = Kaitai::Struct::Stream.new(@_raw_body)
          @body = BlockRepeatStart.new(io, self, @_root)
        when :block_types_extra_info
          @_raw_body = @_io.read_bytes(body_size)
          io = Kaitai::Struct::Stream.new(@_raw_body)
          @body = BlockExtraInfo.new(io, self, @_root)
        else
          @body = @_io.read_bytes(body_size)
        end
      end
    end

    ##
    # body_size is a 24-bit little-endian integer, so we're
    # emulating that by adding two standard-sized integers
    # (body_size1 and body_size2).
    def body_size
      return @body_size unless @body_size.nil?
      if block_type != :block_types_terminator
        @body_size = (body_size1 + (body_size2 << 16))
      end
      @body_size
    end

    ##
    # Byte that determines type of block content
    attr_reader :block_type
    attr_reader :body_size1
    attr_reader :body_size2

    ##
    # Block body, type depends on block type byte
    attr_reader :body
    attr_reader :_raw_body
  end

  ##
  # @see https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x06:_Repeat_start Source
  class BlockRepeatStart < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @repeat_count_1 = @_io.read_u2le
    end

    ##
    # Number of repetitions minus 1; 0xffff means infinite repetitions
    attr_reader :repeat_count_1
  end

  ##
  # @see https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x01:_Sound_data Source
  class BlockSoundData < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @freq_div = @_io.read_u1
      @codec = Kaitai::Struct::Stream::resolve_enum(CODECS, @_io.read_u1)
      @wave = @_io.read_bytes_full
    end
    def sample_rate
      return @sample_rate unless @sample_rate.nil?
      @sample_rate = (1000000.0 / (256 - freq_div))
      @sample_rate
    end

    ##
    # Frequency divisor, used to determine sample rate
    attr_reader :freq_div
    attr_reader :codec
    attr_reader :wave
  end

  ##
  # @see https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x08:_Extra_info Source
  class BlockExtraInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @freq_div = @_io.read_u2le
      @codec = Kaitai::Struct::Stream::resolve_enum(CODECS, @_io.read_u1)
      @num_channels_1 = @_io.read_u1
    end

    ##
    # Number of channels (1 = mono, 2 = stereo)
    def num_channels
      return @num_channels unless @num_channels.nil?
      @num_channels = (num_channels_1 + 1)
      @num_channels
    end
    def sample_rate
      return @sample_rate unless @sample_rate.nil?
      @sample_rate = (256000000.0 / (num_channels * (65536 - freq_div)))
      @sample_rate
    end

    ##
    # Frequency divisor
    attr_reader :freq_div
    attr_reader :codec

    ##
    # Number of channels minus 1 (0 = mono, 1 = stereo)
    attr_reader :num_channels_1
  end
  attr_reader :magic

  ##
  # Total size of this main header (usually 0x001A)
  attr_reader :header_size
  attr_reader :version

  ##
  # Checksum: this must be equal to ~version + 0x1234
  attr_reader :checksum

  ##
  # Series of blocks that contain the actual audio data
  attr_reader :blocks
end

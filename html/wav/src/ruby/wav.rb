# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# The WAVE file format is a subset of Microsoft's RIFF specification for the
# storage of multimedia files. A RIFF file starts out with a file header
# followed by a sequence of data chunks. A WAVE file is often just a RIFF
# file with a single "WAVE" chunk which consists of two sub-chunks --
# a "fmt " chunk specifying the data format and a "data" chunk containing
# the actual sample data.
# 
# This Kaitai implementation was written by John Byrd of Gigantic Software
# (jbyrd@giganticsoftware.com), and it is likely to contain bugs.
# @see https://www.loc.gov/preservation/digital/formats/fdd/fdd000001.shtml Source
class Wav < Kaitai::Struct::Struct

  W_FORMAT_TAG_TYPE = {
    0 => :w_format_tag_type_unknown,
    1 => :w_format_tag_type_pcm,
    2 => :w_format_tag_type_adpcm,
    3 => :w_format_tag_type_ieee_float,
    6 => :w_format_tag_type_alaw,
    7 => :w_format_tag_type_mulaw,
    17 => :w_format_tag_type_dvi_adpcm,
    146 => :w_format_tag_type_dolby_ac3_spdif,
    65534 => :w_format_tag_type_extensible,
    65535 => :w_format_tag_type_development,
  }
  I__W_FORMAT_TAG_TYPE = W_FORMAT_TAG_TYPE.invert

  CHUNK_TYPE = {
    544501094 => :chunk_type_fmt,
    1650817140 => :chunk_type_bext,
    1668637984 => :chunk_type_cue,
    1684108385 => :chunk_type_data,
    1835626086 => :chunk_type_minf,
    1919248238 => :chunk_type_regn,
    1970104676 => :chunk_type_umid,
  }
  I__CHUNK_TYPE = CHUNK_TYPE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @riff_id = @_io.ensure_fixed_contents([82, 73, 70, 70].pack('C*'))
    @file_size = @_io.read_u4le
    @wave_id = @_io.ensure_fixed_contents([87, 65, 86, 69].pack('C*'))
    @_raw_chunks = @_io.read_bytes((file_size - 5))
    io = Kaitai::Struct::Stream.new(@_raw_chunks)
    @chunks = ChunksType.new(io, self, @_root)
    self
  end
  class SampleType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @sample = @_io.read_u2le
      self
    end
    attr_reader :sample
  end
  class FormatChunkType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @w_format_tag = Kaitai::Struct::Stream::resolve_enum(W_FORMAT_TAG_TYPE, @_io.read_u2le)
      @n_channels = @_io.read_u2le
      @n_samples_per_sec = @_io.read_u4le
      @n_avg_bytes_per_sec = @_io.read_u4le
      @n_block_align = @_io.read_u2le
      @w_bits_per_sample = @_io.read_u2le
      if !(is_basic_pcm)
        @cb_size = @_io.read_u2le
      end
      if is_cb_size_meaningful
        @w_valid_bits_per_sample = @_io.read_u2le
      end
      if is_extensible
        @channel_mask_and_subformat = ChannelMaskAndSubformatType.new(@_io, self, @_root)
      end
      self
    end
    def is_extensible
      return @is_extensible unless @is_extensible.nil?
      @is_extensible = w_format_tag == :w_format_tag_type_extensible
      @is_extensible
    end
    def is_basic_pcm
      return @is_basic_pcm unless @is_basic_pcm.nil?
      @is_basic_pcm = w_format_tag == :w_format_tag_type_pcm
      @is_basic_pcm
    end
    def is_basic_float
      return @is_basic_float unless @is_basic_float.nil?
      @is_basic_float = w_format_tag == :w_format_tag_type_ieee_float
      @is_basic_float
    end
    def is_cb_size_meaningful
      return @is_cb_size_meaningful unless @is_cb_size_meaningful.nil?
      @is_cb_size_meaningful =  ((!(is_basic_pcm)) && (cb_size != 0)) 
      @is_cb_size_meaningful
    end
    attr_reader :w_format_tag
    attr_reader :n_channels
    attr_reader :n_samples_per_sec
    attr_reader :n_avg_bytes_per_sec
    attr_reader :n_block_align
    attr_reader :w_bits_per_sample
    attr_reader :cb_size
    attr_reader :w_valid_bits_per_sample
    attr_reader :channel_mask_and_subformat
  end
  class GuidType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @data1 = @_io.read_u4le
      @data2 = @_io.read_u2le
      @data3 = @_io.read_u2le
      @data4 = @_io.read_u4be
      @data4a = @_io.read_u4be
      self
    end
    attr_reader :data1
    attr_reader :data2
    attr_reader :data3
    attr_reader :data4
    attr_reader :data4a
  end
  class CuePointType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @dw_name = @_io.read_u4le
      @dw_position = @_io.read_u4le
      @fcc_chunk = @_io.read_u4le
      @dw_chunk_start = @_io.read_u4le
      @dw_block_start = @_io.read_u4le
      @dw_sample_offset = @_io.read_u4le
      self
    end
    attr_reader :dw_name
    attr_reader :dw_position
    attr_reader :fcc_chunk
    attr_reader :dw_chunk_start
    attr_reader :dw_block_start
    attr_reader :dw_sample_offset
  end
  class DataChunkType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @data = @_io.read_bytes_full
      self
    end
    attr_reader :data
  end
  class SamplesType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @samples = @_io.read_u4le
      self
    end
    attr_reader :samples
  end
  class ChannelMaskAndSubformatType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @dw_channel_mask = ChannelMaskType.new(@_io, self, @_root)
      @subformat = GuidType.new(@_io, self, @_root)
      self
    end
    attr_reader :dw_channel_mask
    attr_reader :subformat
  end
  class ChunksType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @chunk = []
      i = 0
      while not @_io.eof?
        @chunk << ChunkType.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :chunk
  end
  class CueChunkType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @dw_cue_points = @_io.read_u4le
      if dw_cue_points != 0
        @cue_points = Array.new(dw_cue_points)
        (dw_cue_points).times { |i|
          @cue_points[i] = CuePointType.new(@_io, self, @_root)
        }
      end
      self
    end
    attr_reader :dw_cue_points
    attr_reader :cue_points
  end
  class ChannelMaskType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @front_right_of_center = @_io.read_bits_int(1) != 0
      @front_left_of_center = @_io.read_bits_int(1) != 0
      @back_right = @_io.read_bits_int(1) != 0
      @back_left = @_io.read_bits_int(1) != 0
      @low_frequency = @_io.read_bits_int(1) != 0
      @front_center = @_io.read_bits_int(1) != 0
      @front_right = @_io.read_bits_int(1) != 0
      @front_left = @_io.read_bits_int(1) != 0
      @top_center = @_io.read_bits_int(1) != 0
      @side_right = @_io.read_bits_int(1) != 0
      @side_left = @_io.read_bits_int(1) != 0
      @back_center = @_io.read_bits_int(1) != 0
      @top_back_left = @_io.read_bits_int(1) != 0
      @top_front_right = @_io.read_bits_int(1) != 0
      @top_front_center = @_io.read_bits_int(1) != 0
      @top_front_left = @_io.read_bits_int(1) != 0
      @unused1 = @_io.read_bits_int(6)
      @top_back_right = @_io.read_bits_int(1) != 0
      @top_back_center = @_io.read_bits_int(1) != 0
      @unused2 = @_io.read_bits_int(8)
      self
    end
    attr_reader :front_right_of_center
    attr_reader :front_left_of_center
    attr_reader :back_right
    attr_reader :back_left
    attr_reader :low_frequency
    attr_reader :front_center
    attr_reader :front_right
    attr_reader :front_left
    attr_reader :top_center
    attr_reader :side_right
    attr_reader :side_left
    attr_reader :back_center
    attr_reader :top_back_left
    attr_reader :top_front_right
    attr_reader :top_front_center
    attr_reader :top_front_left
    attr_reader :unused1
    attr_reader :top_back_right
    attr_reader :top_back_center
    attr_reader :unused2
  end
  class ChunkType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @chunk_id = @_io.read_u4be
      @len = @_io.read_u4le
      case chunk_id
      when 1684108385
        @_raw_data = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_data)
        @data = DataChunkType.new(io, self, @_root)
      when 1668637984
        @_raw_data = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_data)
        @data = CueChunkType.new(io, self, @_root)
      when 1650817140
        @_raw_data = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_data)
        @data = BextChunkType.new(io, self, @_root)
      when 1718449184
        @_raw_data = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_data)
        @data = FormatChunkType.new(io, self, @_root)
      else
        @data = @_io.read_bytes(len)
      end
      self
    end
    attr_reader :chunk_id
    attr_reader :len
    attr_reader :data
    attr_reader :_raw_data
  end
  class BextChunkType < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @description = (@_io.read_bytes(256)).force_encoding("ASCII")
      @originator = (@_io.read_bytes(32)).force_encoding("ASCII")
      @originator_reference = (@_io.read_bytes(32)).force_encoding("ASCII")
      @origination_date = (@_io.read_bytes(10)).force_encoding("ASCII")
      @origination_time = (@_io.read_bytes(8)).force_encoding("ASCII")
      @time_reference_low = @_io.read_u4le
      @time_reference_high = @_io.read_u4le
      @version = @_io.read_u2le
      @umid = @_io.read_bytes(64)
      @loudness_value = @_io.read_u2le
      @loudness_range = @_io.read_u2le
      @max_true_peak_level = @_io.read_u2le
      @max_momentary_loudness = @_io.read_u2le
      @max_short_term_loudness = @_io.read_u2le
      self
    end
    attr_reader :description
    attr_reader :originator
    attr_reader :originator_reference
    attr_reader :origination_date
    attr_reader :origination_time
    attr_reader :time_reference_low
    attr_reader :time_reference_high
    attr_reader :version
    attr_reader :umid
    attr_reader :loudness_value
    attr_reader :loudness_range
    attr_reader :max_true_peak_level
    attr_reader :max_momentary_loudness
    attr_reader :max_short_term_loudness
  end
  def format_chunk
    return @format_chunk unless @format_chunk.nil?
    @format_chunk = chunks.chunk[0].data
    @format_chunk
  end
  attr_reader :riff_id
  attr_reader :file_size
  attr_reader :wave_id
  attr_reader :chunks
  attr_reader :_raw_chunks
end

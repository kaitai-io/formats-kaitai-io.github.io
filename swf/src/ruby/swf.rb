# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require 'zlib'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# SWF files are used by Adobe Flash (AKA Shockwave Flash, Macromedia
# Flash) to encode rich interactive multimedia content and are,
# essentially, a container for special bytecode instructions to play
# back that content. In early 2000s, it was dominant rich multimedia
# web format (.swf files were integrated into web pages and played
# back with a browser plugin), but its usage largely declined in
# 2010s, as HTML5 and performant browser-native solutions
# (i.e. JavaScript engines and graphical approaches, such as WebGL)
# emerged.
# 
# There are a lot of versions of SWF (~36), format is somewhat
# documented by Adobe.
# @see https://www.adobe.com/content/dam/acom/en/devnet/pdf/swf-file-format-spec.pdf Source
class Swf < Kaitai::Struct::Struct

  COMPRESSIONS = {
    67 => :compressions_zlib,
    70 => :compressions_none,
    90 => :compressions_lzma,
  }
  I__COMPRESSIONS = COMPRESSIONS.invert

  TAG_TYPE = {
    0 => :tag_type_end_of_file,
    4 => :tag_type_place_object,
    5 => :tag_type_remove_object,
    9 => :tag_type_set_background_color,
    14 => :tag_type_define_sound,
    26 => :tag_type_place_object2,
    28 => :tag_type_remove_object2,
    43 => :tag_type_frame_label,
    56 => :tag_type_export_assets,
    65 => :tag_type_script_limits,
    69 => :tag_type_file_attributes,
    70 => :tag_type_place_object3,
    76 => :tag_type_symbol_class,
    77 => :tag_type_metadata,
    78 => :tag_type_define_scaling_grid,
    82 => :tag_type_do_abc,
    86 => :tag_type_define_scene_and_frame_label_data,
  }
  I__TAG_TYPE = TAG_TYPE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @compression = Kaitai::Struct::Stream::resolve_enum(COMPRESSIONS, @_io.read_u1)
    @signature = @_io.read_bytes(2)
    raise Kaitai::Struct::ValidationNotEqualError.new([87, 83].pack('C*'), signature, _io, "/seq/1") if not signature == [87, 83].pack('C*')
    @version = @_io.read_u1
    @len_file = @_io.read_u4le
    if compression == :compressions_none
      @_raw_plain_body = @_io.read_bytes_full
      _io__raw_plain_body = Kaitai::Struct::Stream.new(@_raw_plain_body)
      @plain_body = SwfBody.new(_io__raw_plain_body, self, @_root)
    end
    if compression == :compressions_zlib
      @_raw__raw_zlib_body = @_io.read_bytes_full
      @_raw_zlib_body = Zlib::Inflate.inflate(@_raw__raw_zlib_body)
      _io__raw_zlib_body = Kaitai::Struct::Stream.new(@_raw_zlib_body)
      @zlib_body = SwfBody.new(_io__raw_zlib_body, self, @_root)
    end
    self
  end
  class Rgb < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @r = @_io.read_u1
      @g = @_io.read_u1
      @b = @_io.read_u1
      self
    end
    attr_reader :r
    attr_reader :g
    attr_reader :b
  end
  class DoAbcBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @flags = @_io.read_u4le
      @name = (@_io.read_bytes_term(0, false, true, true)).force_encoding("ASCII")
      @abcdata = @_io.read_bytes_full
      self
    end
    attr_reader :flags
    attr_reader :name
    attr_reader :abcdata
  end
  class SwfBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @rect = Rect.new(@_io, self, @_root)
      @frame_rate = @_io.read_u2le
      @frame_count = @_io.read_u2le
      if _root.version >= 8
        @file_attributes_tag = Tag.new(@_io, self, @_root)
      end
      @tags = []
      i = 0
      while not @_io.eof?
        @tags << Tag.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :rect
    attr_reader :frame_rate
    attr_reader :frame_count
    attr_reader :file_attributes_tag
    attr_reader :tags
  end
  class Rect < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @b1 = @_io.read_u1
      @skip = @_io.read_bytes(num_bytes)
      self
    end
    def num_bits
      return @num_bits unless @num_bits.nil?
      @num_bits = (b1 >> 3)
      @num_bits
    end
    def num_bytes
      return @num_bytes unless @num_bytes.nil?
      @num_bytes = ((((num_bits * 4) - 3) + 7) / 8)
      @num_bytes
    end
    attr_reader :b1
    attr_reader :skip
  end
  class Tag < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @record_header = RecordHeader.new(@_io, self, @_root)
      case record_header.tag_type
      when :tag_type_define_sound
        @_raw_tag_body = @_io.read_bytes(record_header.len)
        _io__raw_tag_body = Kaitai::Struct::Stream.new(@_raw_tag_body)
        @tag_body = DefineSoundBody.new(_io__raw_tag_body, self, @_root)
      when :tag_type_set_background_color
        @_raw_tag_body = @_io.read_bytes(record_header.len)
        _io__raw_tag_body = Kaitai::Struct::Stream.new(@_raw_tag_body)
        @tag_body = Rgb.new(_io__raw_tag_body, self, @_root)
      when :tag_type_script_limits
        @_raw_tag_body = @_io.read_bytes(record_header.len)
        _io__raw_tag_body = Kaitai::Struct::Stream.new(@_raw_tag_body)
        @tag_body = ScriptLimitsBody.new(_io__raw_tag_body, self, @_root)
      when :tag_type_do_abc
        @_raw_tag_body = @_io.read_bytes(record_header.len)
        _io__raw_tag_body = Kaitai::Struct::Stream.new(@_raw_tag_body)
        @tag_body = DoAbcBody.new(_io__raw_tag_body, self, @_root)
      when :tag_type_export_assets
        @_raw_tag_body = @_io.read_bytes(record_header.len)
        _io__raw_tag_body = Kaitai::Struct::Stream.new(@_raw_tag_body)
        @tag_body = SymbolClassBody.new(_io__raw_tag_body, self, @_root)
      when :tag_type_symbol_class
        @_raw_tag_body = @_io.read_bytes(record_header.len)
        _io__raw_tag_body = Kaitai::Struct::Stream.new(@_raw_tag_body)
        @tag_body = SymbolClassBody.new(_io__raw_tag_body, self, @_root)
      else
        @tag_body = @_io.read_bytes(record_header.len)
      end
      self
    end
    attr_reader :record_header
    attr_reader :tag_body
    attr_reader :_raw_tag_body
  end
  class SymbolClassBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_symbols = @_io.read_u2le
      @symbols = Array.new(num_symbols)
      (num_symbols).times { |i|
        @symbols[i] = Symbol.new(@_io, self, @_root)
      }
      self
    end
    class Symbol < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @tag = @_io.read_u2le
        @name = (@_io.read_bytes_term(0, false, true, true)).force_encoding("ASCII")
        self
      end
      attr_reader :tag
      attr_reader :name
    end
    attr_reader :num_symbols
    attr_reader :symbols
  end
  class DefineSoundBody < Kaitai::Struct::Struct

    SAMPLING_RATES = {
      0 => :sampling_rates_rate_5_5_khz,
      1 => :sampling_rates_rate_11_khz,
      2 => :sampling_rates_rate_22_khz,
      3 => :sampling_rates_rate_44_khz,
    }
    I__SAMPLING_RATES = SAMPLING_RATES.invert

    BPS = {
      0 => :bps_sound_8_bit,
      1 => :bps_sound_16_bit,
    }
    I__BPS = BPS.invert

    CHANNELS = {
      0 => :channels_mono,
      1 => :channels_stereo,
    }
    I__CHANNELS = CHANNELS.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @id = @_io.read_u2le
      @format = @_io.read_bits_int_be(4)
      @sampling_rate = Kaitai::Struct::Stream::resolve_enum(SAMPLING_RATES, @_io.read_bits_int_be(2))
      @bits_per_sample = Kaitai::Struct::Stream::resolve_enum(BPS, @_io.read_bits_int_be(1))
      @num_channels = Kaitai::Struct::Stream::resolve_enum(CHANNELS, @_io.read_bits_int_be(1))
      @_io.align_to_byte
      @num_samples = @_io.read_u4le
      self
    end
    attr_reader :id
    attr_reader :format

    ##
    # Sound sampling rate, as per enum. Ignored for Nellymoser and Speex codecs.
    attr_reader :sampling_rate
    attr_reader :bits_per_sample
    attr_reader :num_channels
    attr_reader :num_samples
  end
  class RecordHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @tag_code_and_length = @_io.read_u2le
      if small_len == 63
        @big_len = @_io.read_s4le
      end
      self
    end
    def tag_type
      return @tag_type unless @tag_type.nil?
      @tag_type = Kaitai::Struct::Stream::resolve_enum(Swf::TAG_TYPE, (tag_code_and_length >> 6))
      @tag_type
    end
    def small_len
      return @small_len unless @small_len.nil?
      @small_len = (tag_code_and_length & 63)
      @small_len
    end
    def len
      return @len unless @len.nil?
      @len = (small_len == 63 ? big_len : small_len)
      @len
    end
    attr_reader :tag_code_and_length
    attr_reader :big_len
  end
  class ScriptLimitsBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @max_recursion_depth = @_io.read_u2le
      @script_timeout_seconds = @_io.read_u2le
      self
    end
    attr_reader :max_recursion_depth
    attr_reader :script_timeout_seconds
  end
  attr_reader :compression
  attr_reader :signature
  attr_reader :version
  attr_reader :len_file
  attr_reader :plain_body
  attr_reader :zlib_body
  attr_reader :_raw_plain_body
  attr_reader :_raw_zlib_body
  attr_reader :_raw__raw_zlib_body
end

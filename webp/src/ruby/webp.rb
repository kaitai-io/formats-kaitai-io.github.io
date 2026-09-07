# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://developers.google.com/speed/webp/docs/riff_container Source
class Webp < Kaitai::Struct::Struct

  CHUNK_NAMES = {
    5262680 => :chunk_names_xmp_var,
    540561494 => :chunk_names_vp8,
    542133592 => :chunk_names_xmp,
    1179211845 => :chunk_names_exif,
    1179471425 => :chunk_names_anmf,
    1213221953 => :chunk_names_alph,
    1278758998 => :chunk_names_vp8l,
    1296519750 => :chunk_names_frgm,
    1296649793 => :chunk_names_anim,
    1346585417 => :chunk_names_iccp,
    1480085590 => :chunk_names_vp8x,
  }
  I__CHUNK_NAMES = CHUNK_NAMES.invert

  COMPRESSION_METHOD = {
    0 => :compression_method_none,
    1 => :compression_method_webp_lossless,
  }
  I__COMPRESSION_METHOD = COMPRESSION_METHOD.invert

  FILTERING_METHOD = {
    0 => :filtering_method_none,
    1 => :filtering_method_horizontal,
    2 => :filtering_method_vertical,
    3 => :filtering_method_gradient,
  }
  I__FILTERING_METHOD = FILTERING_METHOD.invert

  PREPROCESSING = {
    0 => :preprocessing_none,
    1 => :preprocessing_level_reduction,
  }
  I__PREPROCESSING = PREPROCESSING.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @magic = @_io.read_bytes(4)
    raise Kaitai::Struct::ValidationNotEqualError.new([82, 73, 70, 70].pack('C*'), @magic, @_io, "/seq/0") if not @magic == [82, 73, 70, 70].pack('C*')
    @len_data = @_io.read_u4le
    @webp = @_io.read_bytes(4)
    raise Kaitai::Struct::ValidationNotEqualError.new([87, 69, 66, 80].pack('C*'), @webp, @_io, "/seq/2") if not @webp == [87, 69, 66, 80].pack('C*')
    _io_payload = @_io.substream(len_data - 4)
    @payload = Chunks.new(_io_payload, self, @_root)
    self
  end
  class Alph < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @reserved = @_io.read_bits_int_be(2)
      raise Kaitai::Struct::ValidationNotEqualError.new(0, @reserved, @_io, "/types/alph/seq/0") if not @reserved == 0
      @preprocessing = Kaitai::Struct::Stream::resolve_enum(Webp::PREPROCESSING, @_io.read_bits_int_be(2))
      raise Kaitai::Struct::ValidationNotInEnumError.new(@preprocessing, @_io, "/types/alph/seq/1") if not Webp::I__PREPROCESSING.key?(@preprocessing)
      @filtering = Kaitai::Struct::Stream::resolve_enum(Webp::FILTERING_METHOD, @_io.read_bits_int_be(2))
      @compression = Kaitai::Struct::Stream::resolve_enum(Webp::COMPRESSION_METHOD, @_io.read_bits_int_be(2))
      raise Kaitai::Struct::ValidationNotInEnumError.new(@compression, @_io, "/types/alph/seq/3") if not Webp::I__COMPRESSION_METHOD.key?(@compression)
      @_io.align_to_byte
      @data = @_io.read_bytes_full
      self
    end
    attr_reader :reserved
    attr_reader :preprocessing
    attr_reader :filtering
    attr_reader :compression
    attr_reader :data
  end

  ##
  # @see https://developers.google.com/speed/webp/docs/riff_container#animation Source
  class Anim < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @background_color = BgColor.new(@_io, self, @_root)
      @loop_count = @_io.read_u2le
      self
    end
    class BgColor < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @blue = @_io.read_u1
        @green = @_io.read_u1
        @red = @_io.read_u1
        @alpha = @_io.read_u1
        self
      end
      attr_reader :blue
      attr_reader :green
      attr_reader :red
      attr_reader :alpha
    end
    attr_reader :background_color
    attr_reader :loop_count
  end
  class Anmf < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @frame_x_div_2 = @_io.read_bits_int_le(24)
      @frame_y_div_2 = @_io.read_bits_int_le(24)
      @frame_width_minus_1 = @_io.read_bits_int_le(24)
      @frame_height_minus_1 = @_io.read_bits_int_le(24)
      @duration = @_io.read_bits_int_le(24)
      @reserved = @_io.read_bits_int_be(6)
      raise Kaitai::Struct::ValidationNotEqualError.new(0, @reserved, @_io, "/types/anmf/seq/5") if not @reserved == 0
      @blending_method = @_io.read_bits_int_be(1) != 0
      @disposal_method = @_io.read_bits_int_be(1) != 0
      @_io.align_to_byte
      @data = @_io.read_bytes_full
      self
    end
    def frame_height
      return @frame_height unless @frame_height.nil?
      @frame_height = frame_height_minus_1 + 1
      @frame_height
    end
    def frame_width
      return @frame_width unless @frame_width.nil?
      @frame_width = frame_width_minus_1 + 1
      @frame_width
    end
    def frame_x
      return @frame_x unless @frame_x.nil?
      @frame_x = frame_x_div_2 * 2
      @frame_x
    end
    def frame_y
      return @frame_y unless @frame_y.nil?
      @frame_y = frame_y_div_2 * 2
      @frame_y
    end
    attr_reader :frame_x_div_2
    attr_reader :frame_y_div_2
    attr_reader :frame_width_minus_1
    attr_reader :frame_height_minus_1
    attr_reader :duration
    attr_reader :reserved
    attr_reader :blending_method
    attr_reader :disposal_method
    attr_reader :data
  end
  class Chunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name = Kaitai::Struct::Stream::resolve_enum(Webp::CHUNK_NAMES, @_io.read_u4le)
      raise Kaitai::Struct::ValidationNotInEnumError.new(@name, @_io, "/types/chunk/seq/0") if not Webp::I__CHUNK_NAMES.key?(@name)
      @len_data = @_io.read_u4le
      case name
      when :chunk_names_alph
        _io_data = @_io.substream(len_data)
        @data = Alph.new(_io_data, self, @_root)
      when :chunk_names_anim
        _io_data = @_io.substream(len_data)
        @data = Anim.new(_io_data, self, @_root)
      when :chunk_names_anmf
        _io_data = @_io.substream(len_data)
        @data = Anmf.new(_io_data, self, @_root)
      when :chunk_names_vp8
        _io_data = @_io.substream(len_data)
        @data = Vp8.new(_io_data, self, @_root)
      when :chunk_names_vp8l
        _io_data = @_io.substream(len_data)
        @data = Vp8l.new(_io_data, self, @_root)
      when :chunk_names_vp8x
        _io_data = @_io.substream(len_data)
        @data = Vp8x.new(_io_data, self, @_root)
      when :chunk_names_xmp
        _io_data = @_io.substream(len_data)
        @data = Xmp.new(_io_data, self, @_root)
      when :chunk_names_xmp_var
        _io_data = @_io.substream(len_data)
        @data = Xmp.new(_io_data, self, @_root)
      else
        @data = @_io.read_bytes(len_data)
      end
      if len_data % 2 != 0
        @padding = @_io.read_bytes(1)
        raise Kaitai::Struct::ValidationNotEqualError.new([0].pack('C*'), @padding, @_io, "/types/chunk/seq/3") if not @padding == [0].pack('C*')
      end
      self
    end
    attr_reader :name
    attr_reader :len_data
    attr_reader :data
    attr_reader :padding
    attr_reader :_raw_data
  end
  class Chunks < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @chunks = []
      i = 0
      while not @_io.eof?
        @chunks << Chunk.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :chunks
  end

  ##
  # @see https://www.rfc-editor.org/rfc/rfc6386#section-9.1 Source
  class Vp8 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @frame_type = @_io.read_bits_int_le(1) != 0
      raise Kaitai::Struct::ValidationNotEqualError.new(false, @frame_type, @_io, "/types/vp8/seq/0") if not @frame_type == false
      @version = @_io.read_bits_int_le(3)
      raise Kaitai::Struct::ValidationGreaterThanError.new(3, @version, @_io, "/types/vp8/seq/1") if not @version <= 3
      @show_frame = @_io.read_bits_int_le(1) != 0
      @len_first_partition = @_io.read_bits_int_le(19)
      @_io.align_to_byte
      @start_code = @_io.read_bytes(3)
      raise Kaitai::Struct::ValidationNotEqualError.new([157, 1, 42].pack('C*'), @start_code, @_io, "/types/vp8/seq/4") if not @start_code == [157, 1, 42].pack('C*')
      @width = @_io.read_bits_int_le(14)
      @horizontal_scale = @_io.read_bits_int_le(2)
      @height = @_io.read_bits_int_le(14)
      @vertical_scale = @_io.read_bits_int_le(2)
      @_io.align_to_byte
      @data = @_io.read_bytes_full
      self
    end
    attr_reader :frame_type
    attr_reader :version
    attr_reader :show_frame
    attr_reader :len_first_partition
    attr_reader :start_code
    attr_reader :width
    attr_reader :horizontal_scale
    attr_reader :height
    attr_reader :vertical_scale
    attr_reader :data
  end

  ##
  # @see https://developers.google.com/speed/webp/docs/webp_lossless_bitstream_specification Source
  class Vp8l < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @signature = @_io.read_u1
      raise Kaitai::Struct::ValidationNotEqualError.new(47, @signature, @_io, "/types/vp8l/seq/0") if not @signature == 47
      @image_width_minus_1 = @_io.read_bits_int_le(14)
      @image_height_minus_1 = @_io.read_bits_int_le(14)
      @alpha_is_used = @_io.read_bits_int_le(1) != 0
      @version_number = @_io.read_bits_int_le(3)
      raise Kaitai::Struct::ValidationNotEqualError.new(0, @version_number, @_io, "/types/vp8l/seq/4") if not @version_number == 0
      @_io.align_to_byte
      @data = @_io.read_bytes_full
      self
    end
    def image_height
      return @image_height unless @image_height.nil?
      @image_height = image_height_minus_1 + 1
      @image_height
    end
    def image_width
      return @image_width unless @image_width.nil?
      @image_width = image_width_minus_1 + 1
      @image_width
    end
    attr_reader :signature
    attr_reader :image_width_minus_1
    attr_reader :image_height_minus_1

    ##
    # A hint only - it should not impact decoding. It should be `false` when
    # all alpha values are 255 in the picture, and `true` otherwise.
    attr_reader :alpha_is_used
    attr_reader :version_number
    attr_reader :data
  end
  class Vp8x < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @reserved1 = @_io.read_bits_int_be(2)
      raise Kaitai::Struct::ValidationNotEqualError.new(0, @reserved1, @_io, "/types/vp8x/seq/0") if not @reserved1 == 0
      @icc_profile = @_io.read_bits_int_be(1) != 0
      @alpha = @_io.read_bits_int_be(1) != 0
      @exif = @_io.read_bits_int_be(1) != 0
      @xmp = @_io.read_bits_int_be(1) != 0
      @animation = @_io.read_bits_int_be(1) != 0
      @reserved2 = @_io.read_bits_int_be(1) != 0
      raise Kaitai::Struct::ValidationNotEqualError.new(false, @reserved2, @_io, "/types/vp8x/seq/6") if not @reserved2 == false
      @reserved3 = @_io.read_bits_int_be(24)
      raise Kaitai::Struct::ValidationNotEqualError.new(0, @reserved3, @_io, "/types/vp8x/seq/7") if not @reserved3 == 0
      @canvas_width_minus_1 = @_io.read_bits_int_le(24)
      @canvas_height_minus_1 = @_io.read_bits_int_le(24)
      raise Kaitai::Struct::ValidationGreaterThanError.new(4294967295 / canvas_width - 1, @canvas_height_minus_1, @_io, "/types/vp8x/seq/9") if not @canvas_height_minus_1 <= 4294967295 / canvas_width - 1
      self
    end
    def canvas_height
      return @canvas_height unless @canvas_height.nil?
      @canvas_height = canvas_height_minus_1 + 1
      @canvas_height
    end
    def canvas_width
      return @canvas_width unless @canvas_width.nil?
      @canvas_width = canvas_width_minus_1 + 1
      @canvas_width
    end
    attr_reader :reserved1
    attr_reader :icc_profile
    attr_reader :alpha
    attr_reader :exif
    attr_reader :xmp
    attr_reader :animation
    attr_reader :reserved2
    attr_reader :reserved3
    attr_reader :canvas_width_minus_1
    attr_reader :canvas_height_minus_1
  end
  class Xmp < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @data = (@_io.read_bytes_full).force_encoding("UTF-8")
      self
    end
    attr_reader :data
  end
  attr_reader :magic
  attr_reader :len_data
  attr_reader :webp
  attr_reader :payload
  attr_reader :_raw_payload
end

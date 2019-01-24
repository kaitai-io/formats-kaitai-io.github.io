# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require 'zlib'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Png < Kaitai::Struct::Struct

  COLOR_TYPE = {
    0 => :color_type_greyscale,
    2 => :color_type_truecolor,
    3 => :color_type_indexed,
    4 => :color_type_greyscale_alpha,
    6 => :color_type_truecolor_alpha,
  }
  I__COLOR_TYPE = COLOR_TYPE.invert

  PHYS_UNIT = {
    0 => :phys_unit_unknown,
    1 => :phys_unit_meter,
  }
  I__PHYS_UNIT = PHYS_UNIT.invert

  COMPRESSION_METHODS = {
    0 => :compression_methods_zlib,
  }
  I__COMPRESSION_METHODS = COMPRESSION_METHODS.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @magic = @_io.ensure_fixed_contents([137, 80, 78, 71, 13, 10, 26, 10].pack('C*'))
    @ihdr_len = @_io.ensure_fixed_contents([0, 0, 0, 13].pack('C*'))
    @ihdr_type = @_io.ensure_fixed_contents([73, 72, 68, 82].pack('C*'))
    @ihdr = IhdrChunk.new(@_io, self, @_root)
    @ihdr_crc = @_io.read_bytes(4)
    @chunks = []
    i = 0
    begin
      _ = Chunk.new(@_io, self, @_root)
      @chunks << _
      i += 1
    end until  ((_.type == "IEND") || (_io.eof?)) 
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
  class Chunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = @_io.read_u4be
      @type = (@_io.read_bytes(4)).force_encoding("UTF-8")
      case type
      when "iTXt"
        @_raw_body = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = InternationalTextChunk.new(io, self, @_root)
      when "gAMA"
        @_raw_body = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = GamaChunk.new(io, self, @_root)
      when "tIME"
        @_raw_body = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = TimeChunk.new(io, self, @_root)
      when "PLTE"
        @_raw_body = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = PlteChunk.new(io, self, @_root)
      when "bKGD"
        @_raw_body = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = BkgdChunk.new(io, self, @_root)
      when "pHYs"
        @_raw_body = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = PhysChunk.new(io, self, @_root)
      when "tEXt"
        @_raw_body = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = TextChunk.new(io, self, @_root)
      when "cHRM"
        @_raw_body = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = ChrmChunk.new(io, self, @_root)
      when "sRGB"
        @_raw_body = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = SrgbChunk.new(io, self, @_root)
      when "zTXt"
        @_raw_body = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = CompressedTextChunk.new(io, self, @_root)
      else
        @body = @_io.read_bytes(len)
      end
      @crc = @_io.read_bytes(4)
      self
    end
    attr_reader :len
    attr_reader :type
    attr_reader :body
    attr_reader :crc
    attr_reader :_raw_body
  end

  ##
  # Background chunk for images with indexed palette.
  class BkgdIndexed < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @palette_index = @_io.read_u1
      self
    end
    attr_reader :palette_index
  end
  class Point < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @x_int = @_io.read_u4be
      @y_int = @_io.read_u4be
      self
    end
    def x
      return @x unless @x.nil?
      @x = (x_int / 100000.0)
      @x
    end
    def y
      return @y unless @y.nil?
      @y = (y_int / 100000.0)
      @y
    end
    attr_reader :x_int
    attr_reader :y_int
  end

  ##
  # Background chunk for greyscale images.
  class BkgdGreyscale < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @value = @_io.read_u2be
      self
    end
    attr_reader :value
  end

  ##
  # @see https://www.w3.org/TR/PNG/#11cHRM Source
  class ChrmChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @white_point = Point.new(@_io, self, @_root)
      @red = Point.new(@_io, self, @_root)
      @green = Point.new(@_io, self, @_root)
      @blue = Point.new(@_io, self, @_root)
      self
    end
    attr_reader :white_point
    attr_reader :red
    attr_reader :green
    attr_reader :blue
  end

  ##
  # @see https://www.w3.org/TR/PNG/#11IHDR Source
  class IhdrChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @width = @_io.read_u4be
      @height = @_io.read_u4be
      @bit_depth = @_io.read_u1
      @color_type = Kaitai::Struct::Stream::resolve_enum(COLOR_TYPE, @_io.read_u1)
      @compression_method = @_io.read_u1
      @filter_method = @_io.read_u1
      @interlace_method = @_io.read_u1
      self
    end
    attr_reader :width
    attr_reader :height
    attr_reader :bit_depth
    attr_reader :color_type
    attr_reader :compression_method
    attr_reader :filter_method
    attr_reader :interlace_method
  end

  ##
  # @see https://www.w3.org/TR/PNG/#11PLTE Source
  class PlteChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      i = 0
      while not @_io.eof?
        @entries << Rgb.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :entries
  end

  ##
  # @see https://www.w3.org/TR/PNG/#11sRGB Source
  class SrgbChunk < Kaitai::Struct::Struct

    INTENT = {
      0 => :intent_perceptual,
      1 => :intent_relative_colorimetric,
      2 => :intent_saturation,
      3 => :intent_absolute_colorimetric,
    }
    I__INTENT = INTENT.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @render_intent = Kaitai::Struct::Stream::resolve_enum(INTENT, @_io.read_u1)
      self
    end
    attr_reader :render_intent
  end

  ##
  # Compressed text chunk effectively allows to store key-value
  # string pairs in PNG container, compressing "value" part (which
  # can be quite lengthy) with zlib compression.
  # @see https://www.w3.org/TR/PNG/#11zTXt Source
  class CompressedTextChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @keyword = (@_io.read_bytes_term(0, false, true, true)).force_encoding("UTF-8")
      @compression_method = Kaitai::Struct::Stream::resolve_enum(COMPRESSION_METHODS, @_io.read_u1)
      @_raw_text_datastream = @_io.read_bytes_full
      @text_datastream = Zlib::Inflate.inflate(@_raw_text_datastream)
      self
    end

    ##
    # Indicates purpose of the following text data.
    attr_reader :keyword
    attr_reader :compression_method
    attr_reader :text_datastream
    attr_reader :_raw_text_datastream
  end

  ##
  # Background chunk for truecolor images.
  class BkgdTruecolor < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @red = @_io.read_u2be
      @green = @_io.read_u2be
      @blue = @_io.read_u2be
      self
    end
    attr_reader :red
    attr_reader :green
    attr_reader :blue
  end

  ##
  # @see https://www.w3.org/TR/PNG/#11gAMA Source
  class GamaChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @gamma_int = @_io.read_u4be
      self
    end
    def gamma_ratio
      return @gamma_ratio unless @gamma_ratio.nil?
      @gamma_ratio = (100000.0 / gamma_int)
      @gamma_ratio
    end
    attr_reader :gamma_int
  end

  ##
  # Background chunk stores default background color to display this
  # image against. Contents depend on `color_type` of the image.
  # @see https://www.w3.org/TR/PNG/#11bKGD Source
  class BkgdChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      case _root.ihdr.color_type
      when :color_type_greyscale_alpha
        @bkgd = BkgdGreyscale.new(@_io, self, @_root)
      when :color_type_indexed
        @bkgd = BkgdIndexed.new(@_io, self, @_root)
      when :color_type_greyscale
        @bkgd = BkgdGreyscale.new(@_io, self, @_root)
      when :color_type_truecolor_alpha
        @bkgd = BkgdTruecolor.new(@_io, self, @_root)
      when :color_type_truecolor
        @bkgd = BkgdTruecolor.new(@_io, self, @_root)
      end
      self
    end
    attr_reader :bkgd
  end

  ##
  # "Physical size" chunk stores data that allows to translate
  # logical pixels into physical units (meters, etc) and vice-versa.
  # @see https://www.w3.org/TR/PNG/#11pHYs Source
  class PhysChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @pixels_per_unit_x = @_io.read_u4be
      @pixels_per_unit_y = @_io.read_u4be
      @unit = Kaitai::Struct::Stream::resolve_enum(PHYS_UNIT, @_io.read_u1)
      self
    end

    ##
    # Number of pixels per physical unit (typically, 1 meter) by X
    # axis.
    attr_reader :pixels_per_unit_x

    ##
    # Number of pixels per physical unit (typically, 1 meter) by Y
    # axis.
    attr_reader :pixels_per_unit_y
    attr_reader :unit
  end

  ##
  # International text chunk effectively allows to store key-value string pairs in
  # PNG container. Both "key" (keyword) and "value" (text) parts are
  # given in pre-defined subset of iso8859-1 without control
  # characters.
  # @see https://www.w3.org/TR/PNG/#11iTXt Source
  class InternationalTextChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @keyword = (@_io.read_bytes_term(0, false, true, true)).force_encoding("UTF-8")
      @compression_flag = @_io.read_u1
      @compression_method = Kaitai::Struct::Stream::resolve_enum(COMPRESSION_METHODS, @_io.read_u1)
      @language_tag = (@_io.read_bytes_term(0, false, true, true)).force_encoding("ASCII")
      @translated_keyword = (@_io.read_bytes_term(0, false, true, true)).force_encoding("UTF-8")
      @text = (@_io.read_bytes_full).force_encoding("UTF-8")
      self
    end

    ##
    # Indicates purpose of the following text data.
    attr_reader :keyword

    ##
    # 0 = text is uncompressed, 1 = text is compressed with a
    # method specified in `compression_method`.
    attr_reader :compression_flag
    attr_reader :compression_method

    ##
    # Human language used in `translated_keyword` and `text`
    # attributes - should be a language code conforming to ISO
    # 646.IRV:1991.
    attr_reader :language_tag

    ##
    # Keyword translated into language specified in
    # `language_tag`. Line breaks are not allowed.
    attr_reader :translated_keyword

    ##
    # Text contents ("value" of this key-value pair), written in
    # language specified in `language_tag`. Linke breaks are
    # allowed.
    attr_reader :text
  end

  ##
  # Text chunk effectively allows to store key-value string pairs in
  # PNG container. Both "key" (keyword) and "value" (text) parts are
  # given in pre-defined subset of iso8859-1 without control
  # characters.
  # @see https://www.w3.org/TR/PNG/#11tEXt Source
  class TextChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @keyword = (@_io.read_bytes_term(0, false, true, true)).force_encoding("iso8859-1")
      @text = (@_io.read_bytes_full).force_encoding("iso8859-1")
      self
    end

    ##
    # Indicates purpose of the following text data.
    attr_reader :keyword
    attr_reader :text
  end

  ##
  # Time chunk stores time stamp of last modification of this image,
  # up to 1 second precision in UTC timezone.
  # @see https://www.w3.org/TR/PNG/#11tIME Source
  class TimeChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @year = @_io.read_u2be
      @month = @_io.read_u1
      @day = @_io.read_u1
      @hour = @_io.read_u1
      @minute = @_io.read_u1
      @second = @_io.read_u1
      self
    end
    attr_reader :year
    attr_reader :month
    attr_reader :day
    attr_reader :hour
    attr_reader :minute
    attr_reader :second
  end
  attr_reader :magic
  attr_reader :ihdr_len
  attr_reader :ihdr_type
  attr_reader :ihdr
  attr_reader :ihdr_crc
  attr_reader :chunks
end

# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require 'zlib'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Test files for APNG can be found at the following locations:
# 
#   * <https://philip.html5.org/tests/apng/tests.html>
#   * <http://littlesvr.ca/apng/>
class Png < Kaitai::Struct::Struct

  BLEND_OP_VALUES = {
    0 => :blend_op_values_source,
    1 => :blend_op_values_over,
  }
  I__BLEND_OP_VALUES = BLEND_OP_VALUES.invert

  COLOR_TYPE = {
    0 => :color_type_greyscale,
    2 => :color_type_truecolor,
    3 => :color_type_indexed,
    4 => :color_type_greyscale_alpha,
    6 => :color_type_truecolor_alpha,
  }
  I__COLOR_TYPE = COLOR_TYPE.invert

  COMPRESSION_METHODS = {
    0 => :compression_methods_zlib,
  }
  I__COMPRESSION_METHODS = COMPRESSION_METHODS.invert

  DISPOSE_OP_VALUES = {
    0 => :dispose_op_values_none,
    1 => :dispose_op_values_background,
    2 => :dispose_op_values_previous,
  }
  I__DISPOSE_OP_VALUES = DISPOSE_OP_VALUES.invert

  FILTER_METHOD = {
    0 => :filter_method_base,
  }
  I__FILTER_METHOD = FILTER_METHOD.invert

  INTERLACE_METHOD = {
    0 => :interlace_method_none,
    1 => :interlace_method_adam7,
  }
  I__INTERLACE_METHOD = INTERLACE_METHOD.invert

  PHYS_UNIT = {
    0 => :phys_unit_unknown,
    1 => :phys_unit_meter,
  }
  I__PHYS_UNIT = PHYS_UNIT.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @magic = @_io.read_bytes(8)
    raise Kaitai::Struct::ValidationNotEqualError.new([137, 80, 78, 71, 13, 10, 26, 10].pack('C*'), @magic, @_io, "/seq/0") if not @magic == [137, 80, 78, 71, 13, 10, 26, 10].pack('C*')
    @ihdr_len = @_io.read_u4be
    raise Kaitai::Struct::ValidationNotEqualError.new(13, @ihdr_len, @_io, "/seq/1") if not @ihdr_len == 13
    @ihdr_type = @_io.read_bytes(4)
    raise Kaitai::Struct::ValidationNotEqualError.new([73, 72, 68, 82].pack('C*'), @ihdr_type, @_io, "/seq/2") if not @ihdr_type == [73, 72, 68, 82].pack('C*')
    @ihdr = IhdrChunk.new(@_io, self, @_root)
    @ihdr_crc = @_io.read_u4be
    @chunks = []
    i = 0
    begin
      _ = Chunk.new(@_io, self, @_root)
      @chunks << _
      i += 1
    end until  ((_.type == "IEND") || (_io.eof?)) 
    self
  end

  ##
  # @see https://stackoverflow.com/questions/4242402/the-fireworks-png-format-any-insight-any-libs/51683285#51683285 Source
  class AdobeFireworksChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @_raw_preview_data = @_io.read_bytes_full
      @preview_data = Zlib::Inflate.inflate(@_raw_preview_data)
      self
    end
    attr_reader :preview_data
    attr_reader :_raw_preview_data
  end

  ##
  # @see https://www.w3.org/TR/png/#acTL-chunk Source
  class AnimationControlChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_frames = @_io.read_u4be
      @num_plays = @_io.read_u4be
      self
    end

    ##
    # Number of frames, must be equal to the number of `fcTL` chunks (i.e.
    # `frame_control_chunk` objects)
    attr_reader :num_frames

    ##
    # Number of times to loop, 0 indicates infinite looping.
    attr_reader :num_plays
  end

  ##
  # @see https://github.com/skeeto/scratch/tree/58470254f4a95cdf7a53888e405c851c21eb2cae/pngattach Source
  # @see https://nullprogram.com/blog/2021/12/31/ A new protocol and tool for PNG file attachments
  class AtchChunk < Kaitai::Struct::Struct

    COMPRESSION_ATTACH_METHODS = {
      0 => :compression_attach_methods_none,
      1 => :compression_attach_methods_zlib,
    }
    I__COMPRESSION_ATTACH_METHODS = COMPRESSION_ATTACH_METHODS.invert
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @file_name = (@_io.read_bytes_term(0, false, true, true)).force_encoding("UTF-8")
      _ = @file_name
      raise Kaitai::Struct::ValidationExprError.new(@file_name, @_io, "/types/atch_chunk/seq/0") if not  ((_.size != 0) && (_[0...1] != ".")) 
      @compression = Kaitai::Struct::Stream::resolve_enum(COMPRESSION_ATTACH_METHODS, @_io.read_u1)
      raise Kaitai::Struct::ValidationNotInEnumError.new(@compression, @_io, "/types/atch_chunk/seq/1") if not I__COMPRESSION_ATTACH_METHODS.key?(@compression)
      if compression == :compression_attach_methods_none
        @data_plain = @_io.read_bytes_full
      end
      if compression == :compression_attach_methods_zlib
        @_raw_data_zlib = @_io.read_bytes_full
        @data_zlib = Zlib::Inflate.inflate(@_raw_data_zlib)
      end
      self
    end
    def data
      return @data unless @data.nil?
      @data = (compression == :compression_attach_methods_none ? data_plain : data_zlib)
      @data
    end

    ##
    # From the [official
    # specification](https://github.com/skeeto/scratch/tree/58470254f4a95cdf7a53888e405c851c21eb2cae/pngattach#atch-chunk-specification):
    # 
    # > The name can be any length that fits in the chunk, and should be
    # > encoded with UTF-8. It's up to each implementation to determine how
    # > to appropriately interpret the bytestring for the local system.
    # 
    # > The name must be at least one byte long, not counting the null
    # > terminator. It cannot begin with a period (`0x2e`), nor contain
    # > control bytes (anything less than `0x20`), nor slash (`0x2f`), nor
    # > backslash (`0x5c`), i.e. no directory hierarchies.
    # 
    # As of Kaitai Struct 0.11, we cannot easily check whether a string
    # contains certain characters, so we only enforce that the file name is
    # not empty and that it doesn't start with a period.
    attr_reader :file_name
    attr_reader :compression
    attr_reader :data_plain
    attr_reader :data_zlib
    attr_reader :_raw_data_zlib
  end

  ##
  # Background chunk stores default background color to display this
  # image against. Contents depend on `color_type` of the image.
  # @see https://www.w3.org/TR/png/#11bKGD Source
  class BkgdChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      case _root.ihdr.color_type
      when :color_type_greyscale
        @bkgd = BkgdGreyscale.new(@_io, self, @_root)
      when :color_type_greyscale_alpha
        @bkgd = BkgdGreyscale.new(@_io, self, @_root)
      when :color_type_indexed
        @bkgd = BkgdIndexed.new(@_io, self, @_root)
      when :color_type_truecolor
        @bkgd = BkgdTruecolor.new(@_io, self, @_root)
      when :color_type_truecolor_alpha
        @bkgd = BkgdTruecolor.new(@_io, self, @_root)
      end
      self
    end
    attr_reader :bkgd
  end

  ##
  # Background chunk for greyscale images.
  class BkgdGreyscale < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
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
  # Background chunk for images with indexed palette.
  class BkgdIndexed < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @palette_index = @_io.read_u1
      self
    end
    attr_reader :palette_index
  end

  ##
  # Background chunk for truecolor images.
  class BkgdTruecolor < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
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
  class ChrmChromaticity < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
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
      @x = x_int / 100000.0
      @x
    end
    def y
      return @y unless @y.nil?
      @y = y_int / 100000.0
      @y
    end
    attr_reader :x_int
    attr_reader :y_int
  end

  ##
  # @see https://www.w3.org/TR/png/#11cHRM Source
  class ChrmChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @white_point = ChrmChromaticity.new(@_io, self, @_root)
      @red = ChrmChromaticity.new(@_io, self, @_root)
      @green = ChrmChromaticity.new(@_io, self, @_root)
      @blue = ChrmChromaticity.new(@_io, self, @_root)
      self
    end
    attr_reader :white_point
    attr_reader :red
    attr_reader :green
    attr_reader :blue
  end
  class Chunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = @_io.read_u4be
      @type_raw = @_io.read_bytes(4)
      _ = @type_raw
      raise Kaitai::Struct::ValidationExprError.new(@type_raw, @_io, "/types/chunk/seq/1") if not  (( (( ((_[0].ord >= 65) && (_[0].ord <= 90)) ) || ( ((_[0].ord >= 97) && (_[0].ord <= 122)) )) ) && ( (( ((_[1].ord >= 65) && (_[1].ord <= 90)) ) || ( ((_[1].ord >= 97) && (_[1].ord <= 122)) )) ) && ( (( ((_[2].ord >= 65) && (_[2].ord <= 90)) ) || ( ((_[2].ord >= 97) && (_[2].ord <= 122)) )) ) && ( (( ((_[3].ord >= 65) && (_[3].ord <= 90)) ) || ( ((_[3].ord >= 97) && (_[3].ord <= 122)) )) )) 
      case type
      when "PLTE"
        _io_body = @_io.substream(len)
        @body = PlteChunk.new(_io_body, self, @_root)
      when "acTL"
        _io_body = @_io.substream(len)
        @body = AnimationControlChunk.new(_io_body, self, @_root)
      when "atCh"
        _io_body = @_io.substream(len)
        @body = AtchChunk.new(_io_body, self, @_root)
      when "bKGD"
        _io_body = @_io.substream(len)
        @body = BkgdChunk.new(_io_body, self, @_root)
      when "cHRM"
        _io_body = @_io.substream(len)
        @body = ChrmChunk.new(_io_body, self, @_root)
      when "cICP"
        _io_body = @_io.substream(len)
        @body = CicpChunk.new(_io_body, self, @_root)
      when "cLLI"
        _io_body = @_io.substream(len)
        @body = ClliChunk.new(_io_body, self, @_root)
      when "fcTL"
        _io_body = @_io.substream(len)
        @body = FrameControlChunk.new(_io_body, self, @_root)
      when "fdAT"
        _io_body = @_io.substream(len)
        @body = FrameDataChunk.new(_io_body, self, @_root)
      when "gAMA"
        _io_body = @_io.substream(len)
        @body = GamaChunk.new(_io_body, self, @_root)
      when "iTXt"
        _io_body = @_io.substream(len)
        @body = InternationalTextChunk.new(_io_body, self, @_root)
      when "mDCV"
        _io_body = @_io.substream(len)
        @body = MdcvChunk.new(_io_body, self, @_root)
      when "mkBS"
        _io_body = @_io.substream(len)
        @body = AdobeFireworksChunk.new(_io_body, self, @_root)
      when "mkTS"
        _io_body = @_io.substream(len)
        @body = AdobeFireworksChunk.new(_io_body, self, @_root)
      when "pHYs"
        _io_body = @_io.substream(len)
        @body = PhysChunk.new(_io_body, self, @_root)
      when "prVW"
        _io_body = @_io.substream(len)
        @body = AdobeFireworksChunk.new(_io_body, self, @_root)
      when "sRGB"
        _io_body = @_io.substream(len)
        @body = SrgbChunk.new(_io_body, self, @_root)
      when "skMf"
        _io_body = @_io.substream(len)
        @body = EvernoteSkmfChunk.new(_io_body, self, @_root)
      when "skRf"
        _io_body = @_io.substream(len)
        @body = EvernoteSkrfChunk.new(_io_body, self, @_root)
      when "tEXt"
        _io_body = @_io.substream(len)
        @body = TextChunk.new(_io_body, self, @_root)
      when "tIME"
        _io_body = @_io.substream(len)
        @body = TimeChunk.new(_io_body, self, @_root)
      when "zTXt"
        _io_body = @_io.substream(len)
        @body = CompressedTextChunk.new(_io_body, self, @_root)
      else
        @body = @_io.read_bytes(len)
      end
      @crc = @_io.read_u4be
      self
    end

    ##
    # false = critical chunk, true = ancillary chunk
    def is_ancillary
      return @is_ancillary unless @is_ancillary.nil?
      @is_ancillary = type_raw[0].ord & 32 != 0
      @is_ancillary
    end

    ##
    # false = public chunk (defined by the W3C), true = private chunk (can
    # be defined by anyone)
    def is_private
      return @is_private unless @is_private.nil?
      @is_private = type_raw[1].ord & 32 != 0
      @is_private
    end

    ##
    # Defines whether the chunk may be copied if the image data (i.e.
    # pixels) is modified. This tells PNG editors how to handle unknown
    # chunks - see section [14.2 Behavior of PNG
    # editors](https://www.w3.org/TR/2025/REC-png-3-20250624/#14Ordering) in
    # the official specification.
    def is_safe_to_copy
      return @is_safe_to_copy unless @is_safe_to_copy.nil?
      @is_safe_to_copy = type_raw[3].ord & 32 != 0
      @is_safe_to_copy
    end

    ##
    # Should be `false`, i.e. all chunk types should have uppercase third
    # letters (the lowercase third letter is reserved for possible future
    # extensions to the PNG standard)
    def reserved_bit
      return @reserved_bit unless @reserved_bit.nil?
      @reserved_bit = type_raw[2].ord & 32 != 0
      @reserved_bit
    end
    def type
      return @type unless @type.nil?
      @type = (type_raw).force_encoding("ASCII").encode('UTF-8')
      @type
    end
    attr_reader :len

    ##
    # Each byte of a chunk type is restricted to the hexadecimal values
    # 0x41..0x5a and 0x61..0x7a, i.e. uppercase and lowercase ASCII letters
    # (`A-Z` and `a-z`).
    # @see https://www.w3.org/TR/2025/REC-png-3-20250624/#table51 Source
    attr_reader :type_raw
    attr_reader :body
    attr_reader :crc
    attr_reader :_raw_body
  end

  ##
  # @see https://www.w3.org/TR/png/#cICP-chunk Source
  # @see https://w3c.github.io/png/Implementation_Report_3e/#cicp Source
  class CicpChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @color_primaries = @_io.read_u1
      @transfer_function = @_io.read_u1
      @matrix_coefficients = @_io.read_u1
      raise Kaitai::Struct::ValidationNotEqualError.new(0, @matrix_coefficients, @_io, "/types/cicp_chunk/seq/2") if not @matrix_coefficients == 0
      @video_full_range_flag = @_io.read_u1
      raise Kaitai::Struct::ValidationNotAnyOfError.new(@video_full_range_flag, @_io, "/types/cicp_chunk/seq/3") if not  ((@video_full_range_flag == 0) || (@video_full_range_flag == 1)) 
      self
    end

    ##
    # values above 22 are reserved, see
    # <https://github.com/pnggroup/pngcheck/blob/bd33ad6490269df07cac81e5305f4ebf56c2b637/pngcheck.c#L3322-L3325>
    attr_reader :color_primaries

    ##
    # values above 18 are reserved, see
    # <https://github.com/pnggroup/pngcheck/blob/bd33ad6490269df07cac81e5305f4ebf56c2b637/pngcheck.c#L3326-L3329>
    attr_reader :transfer_function

    ##
    # From the [official
    # specification](https://www.w3.org/TR/2025/REC-png-3-20250624/#cICP-chunk):
    # 
    # > RGB is currently the only supported color model in PNG, and as such
    # > `Matrix Coefficients` shall be set to `0`.
    attr_reader :matrix_coefficients

    ##
    # From the [official
    # specification](https://www.w3.org/TR/2025/REC-png-3-20250624/#cICP-chunk):
    # 
    # > If `Video Full Range Flag` value is `1`, then the image is a
    # > full-range image. Typically, images in the RGB color representation
    # > are stored in the full-range signal quantization, therefore the vast
    # > majority of computer graphics and web images, including those used
    # > in traditional PNG workflows, are full-range images.
    # 
    # > If `Video Full Range Flag` value is `0`, then the image is a
    # > narrow-range image.
    attr_reader :video_full_range_flag
  end

  ##
  # @see https://www.w3.org/TR/png/#cLLI-chunk Source
  # @see https://w3c.github.io/png/Implementation_Report_3e/#light Source
  class ClliChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @max_content_light_level_int = @_io.read_u4be
      @max_frame_average_light_level_int = @_io.read_u4be
      self
    end

    ##
    # Maximum Content Light Level (MaxCLL), in cd/m^2
    def max_content_light_level
      return @max_content_light_level unless @max_content_light_level.nil?
      @max_content_light_level = max_content_light_level_int * 0.0001
      @max_content_light_level
    end

    ##
    # Maximum Frame Average Light Level (MaxFALL), in cd/m^2
    def max_frame_average_light_level
      return @max_frame_average_light_level unless @max_frame_average_light_level.nil?
      @max_frame_average_light_level = max_frame_average_light_level_int * 0.0001
      @max_frame_average_light_level
    end
    attr_reader :max_content_light_level_int
    attr_reader :max_frame_average_light_level_int
  end
  class CompressedText < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @value = (@_io.read_bytes_full).force_encoding("ISO-8859-1").encode('UTF-8')
      self
    end

    ##
    # Text string (the "value" of this key-value pair).
    # 
    # Although it is not null-terminated (unlike the keyword), it must not
    # contain a zero byte (U+0000 NULL character). A newline should be
    # represented by a single U+000A LINE FEED (LF) character (aka `\n`).
    # The remaining control characters (U+0001..U+0009, U+000B..0+001F,
    # U+007F..U+009F) are discouraged.
    attr_reader :value
  end

  ##
  # Compressed textual data (`zTXt`) chunk effectively allows you to store
  # key-value string pairs in the PNG container, compressing the "value" part
  # (which can be quite lengthy) with zlib compression.
  # 
  # The `zTXt` and `tEXt` chunks are semantically equivalent, but the `zTXt`
  # chunk is recommended for storing large blocks of text.
  # @see https://www.w3.org/TR/png/#11zTXt Source
  class CompressedTextChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @keyword = (@_io.read_bytes_term(0, false, true, true)).force_encoding("ISO-8859-1").encode('UTF-8')
      @compression_method = Kaitai::Struct::Stream::resolve_enum(Png::COMPRESSION_METHODS, @_io.read_u1)
      raise Kaitai::Struct::ValidationNotEqualError.new(:compression_methods_zlib, @compression_method, @_io, "/types/compressed_text_chunk/seq/1") if not @compression_method == :compression_methods_zlib
      @_raw__raw_text = @_io.read_bytes_full
      @_raw_text = Zlib::Inflate.inflate(@_raw__raw_text)
      _io__raw_text = Kaitai::Struct::Stream.new(@_raw_text)
      @text = CompressedText.new(_io__raw_text, self, @_root)
      self
    end

    ##
    # Indicates the type of information represented by the text string.
    # 
    # Keywords must consist exclusively of printable ISO-8859-1 (Latin-1)
    # characters and spaces; that is, only code points 0x20-0x7E and
    # 0xA1-0xFF are allowed. To reduce the chances for human misreading of a
    # keyword, leading spaces, trailing spaces, and consecutive spaces are
    # not permitted.
    # @see https://www.w3.org/TR/2025/REC-png-3-20250624/#11keywords Source
    attr_reader :keyword
    attr_reader :compression_method
    attr_reader :text
    attr_reader :_raw_text
    attr_reader :_raw__raw_text
  end

  ##
  # @see https://web.archive.org/web/20210302212148/https://discussion.evernote.com/forums/topic/88532-how-to-extract-annotation-information-from-annotated-evernoteskitch-images/#comment-451501 Source
  class EvernoteSkmfChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @json = (@_io.read_bytes_full).force_encoding("UTF-8")
      self
    end

    ##
    # JSON document with information about editable annotations (text,
    # lines, paths, etc.) in Evernote/Skitch.
    # 
    # It refers to the original image stored in the `skRf` chunk (which
    # usually follows immediately after `skMf`) via the
    # `.children[0].children[0].uri` JSON property. This has the format
    # `"skitch+uuid:///$UUID"`, where `$UUID` is a random UUIDv4 value that
    # matches the `uuid` field in `evernote_skrf_chunk` (i.e. in the first
    # 16 bytes of the `skRf` chunk).
    attr_reader :json
  end

  ##
  # @see https://web.archive.org/web/20210302212148/https://discussion.evernote.com/forums/topic/88532-how-to-extract-annotation-information-from-annotated-evernoteskitch-images/#comment-451501 Source
  class EvernoteSkrfChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @uuid = @_io.read_bytes(16)
      @orig_img = @_io.read_bytes_full
      self
    end

    ##
    # Random UUIDv4 value used to identify the image. It is referenced by
    # the `skMf` chunk - see the documentation for the `json` field in
    # `evernote_skmf_chunk`.
    attr_reader :uuid

    ##
    # The original source image without annotations. It's usually a PNG
    # image as well, but it can also be a JPEG or possibly other formats.
    attr_reader :orig_img
  end

  ##
  # @see https://www.w3.org/TR/png/#fcTL-chunk Source
  class FrameControlChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @sequence_number = @_io.read_u4be
      @width = @_io.read_u4be
      raise Kaitai::Struct::ValidationLessThanError.new(1, @width, @_io, "/types/frame_control_chunk/seq/1") if not @width >= 1
      raise Kaitai::Struct::ValidationGreaterThanError.new(_root.ihdr.width, @width, @_io, "/types/frame_control_chunk/seq/1") if not @width <= _root.ihdr.width
      @height = @_io.read_u4be
      raise Kaitai::Struct::ValidationLessThanError.new(1, @height, @_io, "/types/frame_control_chunk/seq/2") if not @height >= 1
      raise Kaitai::Struct::ValidationGreaterThanError.new(_root.ihdr.height, @height, @_io, "/types/frame_control_chunk/seq/2") if not @height <= _root.ihdr.height
      @x_offset = @_io.read_u4be
      raise Kaitai::Struct::ValidationGreaterThanError.new(_root.ihdr.width - width, @x_offset, @_io, "/types/frame_control_chunk/seq/3") if not @x_offset <= _root.ihdr.width - width
      @y_offset = @_io.read_u4be
      raise Kaitai::Struct::ValidationGreaterThanError.new(_root.ihdr.height - height, @y_offset, @_io, "/types/frame_control_chunk/seq/4") if not @y_offset <= _root.ihdr.height - height
      @delay_num = @_io.read_u2be
      @delay_den = @_io.read_u2be
      @dispose_op = Kaitai::Struct::Stream::resolve_enum(Png::DISPOSE_OP_VALUES, @_io.read_u1)
      raise Kaitai::Struct::ValidationNotInEnumError.new(@dispose_op, @_io, "/types/frame_control_chunk/seq/7") if not Png::I__DISPOSE_OP_VALUES.key?(@dispose_op)
      @blend_op = Kaitai::Struct::Stream::resolve_enum(Png::BLEND_OP_VALUES, @_io.read_u1)
      raise Kaitai::Struct::ValidationNotInEnumError.new(@blend_op, @_io, "/types/frame_control_chunk/seq/8") if not Png::I__BLEND_OP_VALUES.key?(@blend_op)
      self
    end

    ##
    # Time to display this frame, in seconds
    def delay
      return @delay unless @delay.nil?
      @delay = delay_num / (delay_den == 0 ? 100.0 : delay_den)
      @delay
    end

    ##
    # Sequence number of the animation chunk, starting from 0.
    # 
    # The `fcTL` and `fdAT` chunks have a 4-byte sequence number. Both chunk
    # types share the sequence. The purpose of this number is to detect (and
    # optionally correct) sequence errors in an Animated PNG, since the PNG
    # specification does not impose ordering restrictions on ancillary
    # chunks (which means that a PNG editor is technically allowed to
    # reorder them arbitrarily, see [14.2 Behavior of PNG
    # editors](https://www.w3.org/TR/png/#14Ordering) in the spec).
    # 
    # The first `fcTL` chunk must contain sequence number 0, and the
    # sequence numbers in the remaining `fcTL` and `fdAT` chunks must be in
    # ascending order, with no gaps or duplicates.
    attr_reader :sequence_number

    ##
    # Width of the following frame
    attr_reader :width

    ##
    # Height of the following frame
    attr_reader :height

    ##
    # X position at which to render the following frame
    attr_reader :x_offset

    ##
    # Y position at which to render the following frame
    attr_reader :y_offset

    ##
    # Frame delay fraction numerator
    attr_reader :delay_num

    ##
    # Frame delay fraction denominator
    attr_reader :delay_den

    ##
    # Type of frame area disposal to be done after rendering this frame
    attr_reader :dispose_op

    ##
    # Type of frame area rendering for this frame
    attr_reader :blend_op
  end

  ##
  # @see https://www.w3.org/TR/png/#fdAT-chunk Source
  class FrameDataChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @sequence_number = @_io.read_u4be
      @frame_data = @_io.read_bytes_full
      self
    end

    ##
    # Sequence number of the animation chunk, starting from 0.
    # 
    # The `fcTL` and `fdAT` chunks have a 4-byte sequence number. Both chunk
    # types share the sequence. The purpose of this number is to detect (and
    # optionally correct) sequence errors in an Animated PNG, since the PNG
    # specification does not impose ordering restrictions on ancillary
    # chunks (which means that a PNG editor is technically allowed to
    # reorder them arbitrarily, see [14.2 Behavior of PNG
    # editors](https://www.w3.org/TR/png/#14Ordering) in the spec).
    # 
    # The first `fcTL` chunk must contain sequence number 0, and the
    # sequence numbers in the remaining `fcTL` and `fdAT` chunks must be in
    # ascending order, with no gaps or duplicates.
    attr_reader :sequence_number

    ##
    # Frame data for the frame. At least one `fdAT` chunk is required for
    # each frame, except for the first frame, if that frame is represented
    # by an `IDAT` chunk. The compressed datastream for each frame is the
    # concatenation of the contents of the data fields of all the `fdAT`
    # chunks within a frame.
    attr_reader :frame_data
  end

  ##
  # @see https://www.w3.org/TR/png/#11gAMA Source
  class GamaChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @gamma_int = @_io.read_u4be
      _ = @gamma_int
      raise Kaitai::Struct::ValidationExprError.new(@gamma_int, @_io, "/types/gama_chunk/seq/0") if not _ != 0
      self
    end

    ##
    # Image gamma, typically 0.45455 = 1/2.2
    def gamma
      return @gamma unless @gamma.nil?
      @gamma = gamma_int / 100000.0
      @gamma
    end

    ##
    # Inverse of the image gamma (1 / gamma), typically 2.2 (not considering
    # rounding)
    def inv_gamma
      return @inv_gamma unless @inv_gamma.nil?
      @inv_gamma = 100000.0 / gamma_int
      @inv_gamma
    end

    ##
    # Image gamma multiplied by 100000 (a gamma value of 1/2.2 is stored as
    # 45455)
    attr_reader :gamma_int
  end

  ##
  # @see https://www.w3.org/TR/png/#11IHDR Source
  class IhdrChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @width = @_io.read_u4be
      raise Kaitai::Struct::ValidationLessThanError.new(1, @width, @_io, "/types/ihdr_chunk/seq/0") if not @width >= 1
      @height = @_io.read_u4be
      raise Kaitai::Struct::ValidationLessThanError.new(1, @height, @_io, "/types/ihdr_chunk/seq/1") if not @height >= 1
      @bit_depth = @_io.read_u1
      raise Kaitai::Struct::ValidationNotAnyOfError.new(@bit_depth, @_io, "/types/ihdr_chunk/seq/2") if not  ((@bit_depth == 1) || (@bit_depth == 2) || (@bit_depth == 4) || (@bit_depth == 8) || (@bit_depth == 16)) 
      @color_type = Kaitai::Struct::Stream::resolve_enum(Png::COLOR_TYPE, @_io.read_u1)
      raise Kaitai::Struct::ValidationNotInEnumError.new(@color_type, @_io, "/types/ihdr_chunk/seq/3") if not Png::I__COLOR_TYPE.key?(@color_type)
      @compression_method = Kaitai::Struct::Stream::resolve_enum(Png::COMPRESSION_METHODS, @_io.read_u1)
      raise Kaitai::Struct::ValidationNotInEnumError.new(@compression_method, @_io, "/types/ihdr_chunk/seq/4") if not Png::I__COMPRESSION_METHODS.key?(@compression_method)
      @filter_method = Kaitai::Struct::Stream::resolve_enum(Png::FILTER_METHOD, @_io.read_u1)
      raise Kaitai::Struct::ValidationNotInEnumError.new(@filter_method, @_io, "/types/ihdr_chunk/seq/5") if not Png::I__FILTER_METHOD.key?(@filter_method)
      @interlace_method = Kaitai::Struct::Stream::resolve_enum(Png::INTERLACE_METHOD, @_io.read_u1)
      raise Kaitai::Struct::ValidationNotInEnumError.new(@interlace_method, @_io, "/types/ihdr_chunk/seq/6") if not Png::I__INTERLACE_METHOD.key?(@interlace_method)
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
  class InternationalText < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @value = (@_io.read_bytes_full).force_encoding("UTF-8")
      self
    end

    ##
    # Text string (the "value" of this key-value pair), written in language
    # specified in `_parent.language_tag`.
    # 
    # Although it is not null-terminated (unlike other textual data in the
    # `iTXt` chunk), it must not contain a zero byte
    # (U+0000 NULL character). A newline should be represented by a single
    # U+000A LINE FEED (LF) character (aka `\n`). The remaining control
    # characters (U+0001..U+0009, U+000B..0+001F, U+007F..U+009F) are
    # discouraged.
    attr_reader :value
  end

  ##
  # International textual data (`iTXt`) chunk effectively allows you to store
  # key-value string pairs in the PNG container.
  # 
  # The "key" part (`keyword`) is restricted to printable ISO-8859-1 (Latin-1)
  # characters and spaces. The translated keyword and the "value" part
  # (`text`) are stored in UTF-8 and thus can store text in any language -
  # this language can be indicated via the language tag (`language_tag`).
  # @see https://www.w3.org/TR/png/#11iTXt Source
  class InternationalTextChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @keyword = (@_io.read_bytes_term(0, false, true, true)).force_encoding("ISO-8859-1").encode('UTF-8')
      @compression_flag = @_io.read_u1
      raise Kaitai::Struct::ValidationNotAnyOfError.new(@compression_flag, @_io, "/types/international_text_chunk/seq/1") if not  ((@compression_flag == 0) || (@compression_flag == 1)) 
      @compression_method = Kaitai::Struct::Stream::resolve_enum(Png::COMPRESSION_METHODS, @_io.read_u1)
      raise Kaitai::Struct::ValidationNotEqualError.new((compression_flag == 1 ? :compression_methods_zlib : compression_method), @compression_method, @_io, "/types/international_text_chunk/seq/2") if not @compression_method == (compression_flag == 1 ? :compression_methods_zlib : compression_method)
      @language_tag = (@_io.read_bytes_term(0, false, true, true)).force_encoding("ASCII").encode('UTF-8')
      @translated_keyword = (@_io.read_bytes_term(0, false, true, true)).force_encoding("UTF-8")
      if compression_flag == 0
        @_raw_text_plain = @_io.read_bytes_full
        _io__raw_text_plain = Kaitai::Struct::Stream.new(@_raw_text_plain)
        @text_plain = InternationalText.new(_io__raw_text_plain, self, @_root)
      end
      if compression_flag == 1
        @_raw__raw_text_zlib = @_io.read_bytes_full
        @_raw_text_zlib = Zlib::Inflate.inflate(@_raw__raw_text_zlib)
        _io__raw_text_zlib = Kaitai::Struct::Stream.new(@_raw_text_zlib)
        @text_zlib = InternationalText.new(_io__raw_text_zlib, self, @_root)
      end
      self
    end

    ##
    # Text string (the "value" of this key-value pair), written in language
    # specified in `language_tag`.
    # 
    # Although it is not null-terminated (unlike other textual data in the
    # `iTXt` chunk), it must not contain a zero byte
    # (U+0000 NULL character). A newline should be represented by a single
    # U+000A LINE FEED (LF) character (aka `\n`). The remaining control
    # characters (U+0001..U+0009, U+000B..0+001F, U+007F..U+009F) are
    # discouraged.
    def text
      return @text unless @text.nil?
      @text = (compression_flag == 0 ? text_plain : text_zlib).value
      @text
    end

    ##
    # Indicates the type of information represented by the text string.
    # 
    # Keywords must consist exclusively of printable ISO-8859-1 (Latin-1)
    # characters and spaces; that is, only code points 0x20-0x7E and
    # 0xA1-0xFF are allowed. To reduce the chances for human misreading of a
    # keyword, leading spaces, trailing spaces, and consecutive spaces are
    # not permitted.
    # @see https://www.w3.org/TR/2025/REC-png-3-20250624/#11keywords Source
    attr_reader :keyword

    ##
    # 0 = text is uncompressed, 1 = text is compressed with a
    # method specified in `compression_method`.
    attr_reader :compression_flag
    attr_reader :compression_method

    ##
    # Human language used in the `translated_keyword` and `text` fields.
    # 
    # From the [official
    # specification](https://www.w3.org/TR/2025/REC-png-3-20250624/#11iTXt):
    # 
    # > The language tag is a well-formed language tag defined by [RFC 5646:
    # > BCP 47: Tags for Identifying
    # > Languages](https://www.rfc-editor.org/info/rfc5646/). Unlike the
    # > keyword, the language tag is case-insensitive. Subtags must appear
    # > in the [IANA language subtag
    # > registry](https://www.iana.org/assignments/language-subtag-registry/language-subtag-registry).
    # > If the language tag is empty, the language is unspecified. Examples
    # > of language tags include: `en`, `en-GB`, `es-419`, `zh-Hans`,
    # > `zh-Hans-CN`, `tlh-Cyrl-AQ`, `ar-AE-u-nu-latn`, and `x-private`.
    attr_reader :language_tag

    ##
    # The keyword (`keyword`) translated into the language specified in
    # `language_tag`.
    # 
    # It must not contain a zero byte (U+0000 NULL character). Line breaks
    # should not appear. The remaining control characters (U+0001..U+0009,
    # U+000B..0+001F, U+007F..U+009F) are discouraged.
    attr_reader :translated_keyword
    attr_reader :text_plain
    attr_reader :text_zlib
    attr_reader :_raw_text_plain
    attr_reader :_raw_text_zlib
    attr_reader :_raw__raw_text_zlib
  end
  class MdcvChromaticity < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @x_int = @_io.read_u2be
      @y_int = @_io.read_u2be
      self
    end
    def x
      return @x unless @x.nil?
      @x = x_int * 0.00002
      @x
    end
    def y
      return @y unless @y.nil?
      @y = y_int * 0.00002
      @y
    end
    attr_reader :x_int
    attr_reader :y_int
  end

  ##
  # @see https://www.w3.org/TR/png/#mDCV-chunk Source
  # @see https://w3c.github.io/png/Implementation_Report_3e/#mastering Source
  class MdcvChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @red = MdcvChromaticity.new(@_io, self, @_root)
      @green = MdcvChromaticity.new(@_io, self, @_root)
      @blue = MdcvChromaticity.new(@_io, self, @_root)
      @white_point = MdcvChromaticity.new(@_io, self, @_root)
      @max_luminance_int = @_io.read_u4be
      @min_luminance_int = @_io.read_u4be
      self
    end

    ##
    # Maximum luminance in cd/m^2
    def max_luminance
      return @max_luminance unless @max_luminance.nil?
      @max_luminance = max_luminance_int * 0.0001
      @max_luminance
    end

    ##
    # Minimum luminance in cd/m^2
    def min_luminance
      return @min_luminance unless @min_luminance.nil?
      @min_luminance = min_luminance_int * 0.0001
      @min_luminance
    end
    attr_reader :red
    attr_reader :green
    attr_reader :blue
    attr_reader :white_point
    attr_reader :max_luminance_int
    attr_reader :min_luminance_int
  end

  ##
  # Physical pixel dimensions (`pHYs`) chunk specifies the intended physical
  # size of the pixels (in meters) or pixel aspect ratio for display of the
  # image.
  # @see https://www.w3.org/TR/png/#11pHYs Source
  class PhysChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @pixels_per_unit_x = @_io.read_u4be
      @pixels_per_unit_y = @_io.read_u4be
      @unit = Kaitai::Struct::Stream::resolve_enum(Png::PHYS_UNIT, @_io.read_u1)
      raise Kaitai::Struct::ValidationNotInEnumError.new(@unit, @_io, "/types/phys_chunk/seq/2") if not Png::I__PHYS_UNIT.key?(@unit)
      self
    end

    ##
    # Horizontal resolution (DPI)
    def dots_per_inch_x
      return @dots_per_inch_x unless @dots_per_inch_x.nil?
      if unit == :phys_unit_meter
        @dots_per_inch_x = pixels_per_unit_x * 0.0254
      end
      @dots_per_inch_x
    end

    ##
    # Vertical resolution (DPI)
    def dots_per_inch_y
      return @dots_per_inch_y unless @dots_per_inch_y.nil?
      if unit == :phys_unit_meter
        @dots_per_inch_y = pixels_per_unit_y * 0.0254
      end
      @dots_per_inch_y
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
  # @see https://www.w3.org/TR/png/#11PLTE Source
  class PlteChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
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
  class Rgb < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
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

  ##
  # @see https://www.w3.org/TR/png/#11sRGB Source
  class SrgbChunk < Kaitai::Struct::Struct

    INTENT = {
      0 => :intent_perceptual,
      1 => :intent_relative_colorimetric,
      2 => :intent_saturation,
      3 => :intent_absolute_colorimetric,
    }
    I__INTENT = INTENT.invert
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @render_intent = Kaitai::Struct::Stream::resolve_enum(INTENT, @_io.read_u1)
      raise Kaitai::Struct::ValidationNotInEnumError.new(@render_intent, @_io, "/types/srgb_chunk/seq/0") if not I__INTENT.key?(@render_intent)
      self
    end
    attr_reader :render_intent
  end

  ##
  # Textual data (`tEXt`) chunk effectively allows you to store key-value
  # string pairs in the PNG container.
  # 
  # Both the "key" (`keyword`) and "value" (`text`) parts are restricted to
  # printable ISO-8859-1 (Latin-1) characters and ASCII spaces, with the
  # exception that `text` can also contain newlines (U+000A LINE FEED (LF)
  # characters) and U+00A0 NON-BREAKING SPACE characters.
  # @see https://www.w3.org/TR/png/#11tEXt Source
  class TextChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @keyword = (@_io.read_bytes_term(0, false, true, true)).force_encoding("ISO-8859-1").encode('UTF-8')
      @text = (@_io.read_bytes_full).force_encoding("ISO-8859-1").encode('UTF-8')
      self
    end

    ##
    # Indicates the type of information represented by the text string.
    # 
    # Keywords must consist exclusively of printable ISO-8859-1 (Latin-1)
    # characters and spaces; that is, only code points 0x20-0x7E and
    # 0xA1-0xFF are allowed. To reduce the chances for human misreading of a
    # keyword, leading spaces, trailing spaces, and consecutive spaces are
    # not permitted.
    # @see https://www.w3.org/TR/2025/REC-png-3-20250624/#11keywords Source
    attr_reader :keyword

    ##
    # Text string (the "value" of this key-value pair).
    # 
    # Although it is not null-terminated (unlike the keyword), it must not
    # contain a zero byte (U+0000 NULL character). A newline should be
    # represented by a single U+000A LINE FEED (LF) character (aka `\n`).
    # The remaining control characters (U+0001..U+0009, U+000B..0+001F,
    # U+007F..U+009F) are discouraged.
    attr_reader :text
  end

  ##
  # Time chunk stores time stamp of last modification of this image,
  # up to 1 second precision in UTC timezone.
  # @see https://www.w3.org/TR/png/#11tIME Source
  class TimeChunk < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
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

# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Portable Compiled Format (PCF) font is a bitmap font format
# originating from X11 Window System. It matches BDF format (which is
# text-based) closely, but instead being binary and
# platform-independent (as opposed to previously used SNF binary
# format) due to introduced features to handle different endianness
# and bit order.
# 
# The overall composition of the format is straightforward: it's more
# or less classic directory of type-offset-size pointers, pointing to
# what PCF format calls "tables". Each table carries a certain
# piece of information related to the font (metadata properties,
# metrics, bitmaps, mapping of glyphs to characters, etc).
# @see https://fontforge.org/docs/techref/pcf-format.html Source
class PcfFont < Kaitai::Struct::Struct

  TYPES = {
    1 => :types_properties,
    2 => :types_accelerators,
    4 => :types_metrics,
    8 => :types_bitmaps,
    16 => :types_ink_metrics,
    32 => :types_bdf_encodings,
    64 => :types_swidths,
    128 => :types_glyph_names,
    256 => :types_bdf_accelerators,
  }
  I__TYPES = TYPES.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @magic = @_io.read_bytes(4)
    raise Kaitai::Struct::ValidationNotEqualError.new([1, 102, 99, 112].pack('C*'), magic, _io, "/seq/0") if not magic == [1, 102, 99, 112].pack('C*')
    @num_tables = @_io.read_u4le
    @tables = Array.new(num_tables)
    (num_tables).times { |i|
      @tables[i] = Table.new(@_io, self, @_root)
    }
    self
  end

  ##
  # Table offers a offset + length pointer to a particular
  # table. "Type" of table references certain enum. Applications can
  # ignore enum values which they don't support.
  class Table < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @type = Kaitai::Struct::Stream::resolve_enum(PcfFont::TYPES, @_io.read_u4le)
      @format = Format.new(@_io, self, @_root)
      @len_body = @_io.read_u4le
      @ofs_body = @_io.read_u4le
      self
    end

    ##
    # Table containing scalable widths of characters.
    # @see https://fontforge.org/docs/techref/pcf-format.html#the-scalable-widths-table Source
    class Swidths < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @format = Format.new(@_io, self, @_root)
        @num_glyphs = @_io.read_u4le
        @swidths = Array.new(num_glyphs)
        (num_glyphs).times { |i|
          @swidths[i] = @_io.read_u4le
        }
        self
      end
      attr_reader :format
      attr_reader :num_glyphs

      ##
      # The scalable width of a character is the width of the corresponding
      # PostScript character in em-units (1/1000ths of an em).
      attr_reader :swidths
    end

    ##
    # Array of properties (key-value pairs), used to convey different X11
    # settings of a font. Key is always an X font atom.
    # @see https://fontforge.org/docs/techref/pcf-format.html#properties-table Source
    class Properties < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @format = Format.new(@_io, self, @_root)
        @num_props = @_io.read_u4le
        @props = Array.new(num_props)
        (num_props).times { |i|
          @props[i] = Prop.new(@_io, self, @_root)
        }
        @padding = @_io.read_bytes(((num_props & 3) == 0 ? 0 : (4 - (num_props & 3))))
        @len_strings = @_io.read_u4le
        @_raw_strings = @_io.read_bytes(len_strings)
        _io__raw_strings = Kaitai::Struct::Stream.new(@_raw_strings)
        @strings = BytesWithIo.new(_io__raw_strings)
        self
      end

      ##
      # Property is a key-value pair, "key" being always a
      # string and "value" being either a string or a 32-bit
      # integer based on an additinal flag (`is_string`).
      # 
      # Simple offset-based mechanism is employed to keep this
      # type's sequence fixed-sized and thus have simple access
      # to property key/value by index.
      class Prop < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @ofs_name = @_io.read_u4le
          @is_string = @_io.read_u1
          @value_or_ofs_value = @_io.read_u4le
          self
        end

        ##
        # Name of the property addressed in the strings buffer.
        def name
          return @name unless @name.nil?
          io = _parent.strings._io
          _pos = io.pos
          io.seek(ofs_name)
          @name = (io.read_bytes_term(0, false, true, true)).force_encoding("UTF-8")
          io.seek(_pos)
          @name
        end

        ##
        # Value of the property addressed in the strings
        # buffer, if this is a string value.
        def str_value
          return @str_value unless @str_value.nil?
          if is_string != 0
            io = _parent.strings._io
            _pos = io.pos
            io.seek(value_or_ofs_value)
            @str_value = (io.read_bytes_term(0, false, true, true)).force_encoding("UTF-8")
            io.seek(_pos)
          end
          @str_value
        end

        ##
        # Value of the property, if this is an integer value.
        def int_value
          return @int_value unless @int_value.nil?
          if is_string == 0
            @int_value = value_or_ofs_value
          end
          @int_value
        end

        ##
        # Offset to name in the strings buffer.
        attr_reader :ofs_name

        ##
        # Designates if value is an integer (zero) or a string (non-zero).
        attr_reader :is_string

        ##
        # If the value is an integer (`is_string` is false),
        # then it's stored here. If the value is a string
        # (`is_string` is true), then it stores offset to the
        # value in the strings buffer.
        attr_reader :value_or_ofs_value
      end
      attr_reader :format
      attr_reader :num_props
      attr_reader :props
      attr_reader :padding
      attr_reader :len_strings

      ##
      # Strings buffer. Never used directly, but instead is
      # addressed by offsets from the properties.
      attr_reader :strings
      attr_reader :_raw_strings
    end

    ##
    # Table that allows mapping of character codes to glyphs present in the
    # font. Supports 1-byte and 2-byte character codes.
    # 
    # Note that this mapping is agnostic to character encoding itself - it
    # can represent ASCII, Unicode (ISO/IEC 10646), various single-byte
    # national encodings, etc. If application cares about it, normally
    # encoding will be specified in `properties` table, in the properties named
    # `CHARSET_REGISTRY` / `CHARSET_ENCODING`.
    # @see https://fontforge.org/docs/techref/pcf-format.html#the-encoding-table Source
    class BdfEncodings < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @format = Format.new(@_io, self, @_root)
        @min_char_or_byte2 = @_io.read_u2le
        @max_char_or_byte2 = @_io.read_u2le
        @min_byte1 = @_io.read_u2le
        @max_byte1 = @_io.read_u2le
        @default_char = @_io.read_u2le
        @glyph_indexes = Array.new((((max_char_or_byte2 - min_char_or_byte2) + 1) * ((max_byte1 - min_byte1) + 1)))
        ((((max_char_or_byte2 - min_char_or_byte2) + 1) * ((max_byte1 - min_byte1) + 1))).times { |i|
          @glyph_indexes[i] = @_io.read_u2le
        }
        self
      end
      attr_reader :format
      attr_reader :min_char_or_byte2
      attr_reader :max_char_or_byte2
      attr_reader :min_byte1
      attr_reader :max_byte1
      attr_reader :default_char
      attr_reader :glyph_indexes
    end

    ##
    # Table containing character names for every glyph.
    # @see https://fontforge.org/docs/techref/pcf-format.html#the-glyph-names-table Source
    class GlyphNames < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @format = Format.new(@_io, self, @_root)
        @num_glyphs = @_io.read_u4le
        @names = Array.new(num_glyphs)
        (num_glyphs).times { |i|
          @names[i] = StringRef.new(@_io, self, @_root)
        }
        @len_strings = @_io.read_u4le
        @_raw_strings = @_io.read_bytes(len_strings)
        _io__raw_strings = Kaitai::Struct::Stream.new(@_raw_strings)
        @strings = BytesWithIo.new(_io__raw_strings)
        self
      end
      class StringRef < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @ofs_string = @_io.read_u4le
          self
        end
        def value
          return @value unless @value.nil?
          io = _parent.strings._io
          _pos = io.pos
          io.seek(ofs_string)
          @value = (io.read_bytes_term(0, false, true, true)).force_encoding("UTF-8")
          io.seek(_pos)
          @value
        end
        attr_reader :ofs_string
      end
      attr_reader :format
      attr_reader :num_glyphs

      ##
      # Glyph names are represented as string references in strings buffer.
      attr_reader :names
      attr_reader :len_strings

      ##
      # Strings buffer which contains all glyph names.
      attr_reader :strings
      attr_reader :_raw_strings
    end

    ##
    # Table containing uncompressed glyph bitmaps.
    # @see https://fontforge.org/docs/techref/pcf-format.html#the-bitmap-table Source
    class Bitmaps < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @format = Format.new(@_io, self, @_root)
        @num_glyphs = @_io.read_u4le
        @offsets = Array.new(num_glyphs)
        (num_glyphs).times { |i|
          @offsets[i] = @_io.read_u4le
        }
        @bitmap_sizes = Array.new(4)
        (4).times { |i|
          @bitmap_sizes[i] = @_io.read_u4le
        }
        self
      end
      attr_reader :format
      attr_reader :num_glyphs
      attr_reader :offsets
      attr_reader :bitmap_sizes
    end
    def body
      return @body unless @body.nil?
      _pos = @_io.pos
      @_io.seek(ofs_body)
      case type
      when :types_properties
        @_raw_body = @_io.read_bytes(len_body)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = Properties.new(_io__raw_body, self, @_root)
      when :types_bdf_encodings
        @_raw_body = @_io.read_bytes(len_body)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = BdfEncodings.new(_io__raw_body, self, @_root)
      when :types_swidths
        @_raw_body = @_io.read_bytes(len_body)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = Swidths.new(_io__raw_body, self, @_root)
      when :types_glyph_names
        @_raw_body = @_io.read_bytes(len_body)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = GlyphNames.new(_io__raw_body, self, @_root)
      when :types_bitmaps
        @_raw_body = @_io.read_bytes(len_body)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = Bitmaps.new(_io__raw_body, self, @_root)
      else
        @body = @_io.read_bytes(len_body)
      end
      @_io.seek(_pos)
      @body
    end
    attr_reader :type
    attr_reader :format
    attr_reader :len_body
    attr_reader :ofs_body
    attr_reader :_raw_body
  end

  ##
  # Table format specifier, always 4 bytes. Original implementation treats
  # it as always little-endian and makes liberal use of bitmasking to parse
  # various parts of it.
  # 
  # TODO: this format specification recognizes endianness and bit
  # order format bits, but it does not really takes any parsing
  # decisions based on them.
  # @see https://fontforge.org/docs/techref/pcf-format.html#file-header Source
  class Format < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @padding1 = @_io.read_bits_int_be(2)
      @scan_unit_mask = @_io.read_bits_int_be(2)
      @is_most_significant_bit_first = @_io.read_bits_int_be(1) != 0
      @is_big_endian = @_io.read_bits_int_be(1) != 0
      @glyph_pad_mask = @_io.read_bits_int_be(2)
      @_io.align_to_byte
      @format = @_io.read_u1
      @padding = @_io.read_u2le
      self
    end
    attr_reader :padding1
    attr_reader :scan_unit_mask
    attr_reader :is_most_significant_bit_first

    ##
    # If set, then all integers in the table are treated as big-endian
    attr_reader :is_big_endian
    attr_reader :glyph_pad_mask
    attr_reader :format
    attr_reader :padding
  end
  attr_reader :magic
  attr_reader :num_tables
  attr_reader :tables
end

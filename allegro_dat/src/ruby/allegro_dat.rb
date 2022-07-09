# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Allegro library for C (mostly used for game and multimedia apps
# programming) used its own container file format.
# 
# In general, it allows storage of arbitrary binary data blocks
# bundled together with some simple key-value style metadata
# ("properties") for every block. Allegro also pre-defines some simple
# formats for bitmaps, fonts, MIDI music, sound samples and
# palettes. Allegro library v4.0+ also support LZSS compression.
# 
# This spec applies to Allegro data files for library versions 2.2 up
# to 4.4.
# @see https://liballeg.org/stabledocs/en/datafile.html Source
class AllegroDat < Kaitai::Struct::Struct

  PACK_ENUM = {
    1936484398 => :pack_enum_unpacked,
  }
  I__PACK_ENUM = PACK_ENUM.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @pack_magic = Kaitai::Struct::Stream::resolve_enum(PACK_ENUM, @_io.read_u4be)
    @dat_magic = @_io.read_bytes(4)
    raise Kaitai::Struct::ValidationNotEqualError.new([65, 76, 76, 46].pack('C*'), dat_magic, _io, "/seq/1") if not dat_magic == [65, 76, 76, 46].pack('C*')
    @num_objects = @_io.read_u4be
    @objects = []
    (num_objects).times { |i|
      @objects << DatObject.new(@_io, self, @_root)
    }
    self
  end

  ##
  # Simple monochrome monospaced font, 95 characters, 8x16 px
  # characters.
  class DatFont16 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @chars = []
      (95).times { |i|
        @chars << @_io.read_bytes(16)
      }
      self
    end
    attr_reader :chars
  end
  class DatBitmap < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @bits_per_pixel = @_io.read_s2be
      @width = @_io.read_u2be
      @height = @_io.read_u2be
      @image = @_io.read_bytes_full
      self
    end
    attr_reader :bits_per_pixel
    attr_reader :width
    attr_reader :height
    attr_reader :image
  end
  class DatFont < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @font_size = @_io.read_s2be
      case font_size
      when 8
        @body = DatFont8.new(@_io, self, @_root)
      when 16
        @body = DatFont16.new(@_io, self, @_root)
      when 0
        @body = DatFont39.new(@_io, self, @_root)
      end
      self
    end
    attr_reader :font_size
    attr_reader :body
  end

  ##
  # Simple monochrome monospaced font, 95 characters, 8x8 px
  # characters.
  class DatFont8 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @chars = []
      (95).times { |i|
        @chars << @_io.read_bytes(8)
      }
      self
    end
    attr_reader :chars
  end
  class DatObject < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @properties = []
      i = 0
      begin
        _ = Property.new(@_io, self, @_root)
        @properties << _
        i += 1
      end until !(_.is_valid)
      @len_compressed = @_io.read_s4be
      @len_uncompressed = @_io.read_s4be
      case type
      when "BMP "
        @_raw_body = @_io.read_bytes(len_compressed)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = DatBitmap.new(_io__raw_body, self, @_root)
      when "RLE "
        @_raw_body = @_io.read_bytes(len_compressed)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = DatRleSprite.new(_io__raw_body, self, @_root)
      when "FONT"
        @_raw_body = @_io.read_bytes(len_compressed)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = DatFont.new(_io__raw_body, self, @_root)
      else
        @body = @_io.read_bytes(len_compressed)
      end
      self
    end
    def type
      return @type unless @type.nil?
      @type = properties.last.magic
      @type
    end
    attr_reader :properties
    attr_reader :len_compressed
    attr_reader :len_uncompressed
    attr_reader :body
    attr_reader :_raw_body
  end

  ##
  # New bitmap font format introduced since Allegro 3.9: allows
  # flexible designation of character ranges, 8-bit colored
  # characters, etc.
  class DatFont39 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @num_ranges = @_io.read_s2be
      @ranges = []
      (num_ranges).times { |i|
        @ranges << Range.new(@_io, self, @_root)
      }
      self
    end
    class Range < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @mono = @_io.read_u1
        @start_char = @_io.read_u4be
        @end_char = @_io.read_u4be
        @chars = []
        (((end_char - start_char) + 1)).times { |i|
          @chars << FontChar.new(@_io, self, @_root)
        }
        self
      end
      attr_reader :mono

      ##
      # First character in range
      attr_reader :start_char

      ##
      # Last character in range (inclusive)
      attr_reader :end_char
      attr_reader :chars
    end
    class FontChar < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @width = @_io.read_u2be
        @height = @_io.read_u2be
        @body = @_io.read_bytes((width * height))
        self
      end
      attr_reader :width
      attr_reader :height
      attr_reader :body
    end
    attr_reader :num_ranges
    attr_reader :ranges
  end
  class Property < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = (@_io.read_bytes(4)).force_encoding("UTF-8")
      if is_valid
        @type = (@_io.read_bytes(4)).force_encoding("UTF-8")
      end
      if is_valid
        @len_body = @_io.read_u4be
      end
      if is_valid
        @body = (@_io.read_bytes(len_body)).force_encoding("UTF-8")
      end
      self
    end
    def is_valid
      return @is_valid unless @is_valid.nil?
      @is_valid = magic == "prop"
      @is_valid
    end
    attr_reader :magic
    attr_reader :type
    attr_reader :len_body
    attr_reader :body
  end
  class DatRleSprite < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @bits_per_pixel = @_io.read_s2be
      @width = @_io.read_u2be
      @height = @_io.read_u2be
      @len_image = @_io.read_u4be
      @image = @_io.read_bytes_full
      self
    end
    attr_reader :bits_per_pixel
    attr_reader :width
    attr_reader :height
    attr_reader :len_image
    attr_reader :image
  end
  attr_reader :pack_magic
  attr_reader :dat_magic
  attr_reader :num_objects
  attr_reader :objects
end

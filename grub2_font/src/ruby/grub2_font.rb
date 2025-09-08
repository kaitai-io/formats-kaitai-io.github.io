# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Bitmap font format for the GRUB 2 bootloader.
# @see https://grub.gibibit.com/New_font_format Source
class Grub2Font < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @magic = @_io.read_bytes(12)
    raise Kaitai::Struct::ValidationNotEqualError.new([70, 73, 76, 69, 0, 0, 0, 4, 80, 70, 70, 50].pack('C*'), @magic, @_io, "/seq/0") if not @magic == [70, 73, 76, 69, 0, 0, 0, 4, 80, 70, 70, 50].pack('C*')
    @sections = []
    i = 0
    begin
      _ = Section.new(@_io, self, @_root)
      @sections << _
      i += 1
    end until _.section_type == "DATA"
    self
  end
  class AsceSection < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ascent_in_pixels = @_io.read_u2be
      self
    end
    attr_reader :ascent_in_pixels
  end
  class ChixSection < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @characters = []
      i = 0
      while not @_io.eof?
        @characters << Character.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    class Character < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @code_point = @_io.read_u4be
        @flags = @_io.read_u1
        @ofs_definition = @_io.read_u4be
        self
      end
      def definition
        return @definition unless @definition.nil?
        io = _root._io
        _pos = io.pos
        io.seek(ofs_definition)
        @definition = CharacterDefinition.new(io, self, @_root)
        io.seek(_pos)
        @definition
      end

      ##
      # Unicode code point
      attr_reader :code_point
      attr_reader :flags
      attr_reader :ofs_definition
    end
    class CharacterDefinition < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @width = @_io.read_u2be
        @height = @_io.read_u2be
        @x_offset = @_io.read_s2be
        @y_offset = @_io.read_s2be
        @device_width = @_io.read_s2be
        @bitmap_data = @_io.read_bytes((width * height + 7) / 8)
        self
      end
      attr_reader :width
      attr_reader :height
      attr_reader :x_offset
      attr_reader :y_offset
      attr_reader :device_width

      ##
      # A two-dimensional bitmap, one bit per pixel. It is organized as
      # row-major, top-down, left-to-right. The most significant bit of
      # each byte corresponds to the leftmost or uppermost pixel from all
      # bits of the byte. If a bit is set (1, `true`), the pixel is set to
      # the font color, if a bit is clear (0, `false`), the pixel is
      # transparent.
      # 
      # Rows are **not** padded to byte boundaries (i.e., a
      # single byte may contain bits belonging to multiple rows). The last
      # byte of the bitmap _is_ padded with zero bits at all unused least
      # significant bit positions so that the bitmap ends on a byte
      # boundary.
      attr_reader :bitmap_data
    end
    attr_reader :characters
  end
  class DescSection < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @descent_in_pixels = @_io.read_u2be
      self
    end
    attr_reader :descent_in_pixels
  end
  class FamiSection < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @font_family_name = (@_io.read_bytes_term(0, false, true, true)).force_encoding("ASCII").encode('UTF-8')
      self
    end
    attr_reader :font_family_name
  end
  class MaxhSection < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @maximum_character_height = @_io.read_u2be
      self
    end
    attr_reader :maximum_character_height
  end
  class MaxwSection < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @maximum_character_width = @_io.read_u2be
      self
    end
    attr_reader :maximum_character_width
  end
  class NameSection < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @font_name = (@_io.read_bytes_term(0, false, true, true)).force_encoding("ASCII").encode('UTF-8')
      self
    end
    attr_reader :font_name
  end
  class PtszSection < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @font_point_size = @_io.read_u2be
      self
    end
    attr_reader :font_point_size
  end
  class Section < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @section_type = (@_io.read_bytes(4)).force_encoding("ASCII").encode('UTF-8')
      @len_body = @_io.read_u4be
      if section_type != "DATA"
        case section_type
        when "ASCE"
          _io_body = @_io.substream(len_body)
          @body = AsceSection.new(_io_body, self, @_root)
        when "CHIX"
          _io_body = @_io.substream(len_body)
          @body = ChixSection.new(_io_body, self, @_root)
        when "DESC"
          _io_body = @_io.substream(len_body)
          @body = DescSection.new(_io_body, self, @_root)
        when "FAMI"
          _io_body = @_io.substream(len_body)
          @body = FamiSection.new(_io_body, self, @_root)
        when "MAXH"
          _io_body = @_io.substream(len_body)
          @body = MaxhSection.new(_io_body, self, @_root)
        when "MAXW"
          _io_body = @_io.substream(len_body)
          @body = MaxwSection.new(_io_body, self, @_root)
        when "NAME"
          _io_body = @_io.substream(len_body)
          @body = NameSection.new(_io_body, self, @_root)
        when "PTSZ"
          _io_body = @_io.substream(len_body)
          @body = PtszSection.new(_io_body, self, @_root)
        when "SLAN"
          _io_body = @_io.substream(len_body)
          @body = SlanSection.new(_io_body, self, @_root)
        when "WEIG"
          _io_body = @_io.substream(len_body)
          @body = WeigSection.new(_io_body, self, @_root)
        else
          @body = @_io.read_bytes(len_body)
        end
      end
      self
    end
    attr_reader :section_type

    ##
    # Should be set to `0xFFFF_FFFF` for `section_type != "DATA"`
    attr_reader :len_body
    attr_reader :body
    attr_reader :_raw_body
  end
  class SlanSection < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @font_slant = (@_io.read_bytes_term(0, false, true, true)).force_encoding("ASCII").encode('UTF-8')
      self
    end
    attr_reader :font_slant
  end
  class WeigSection < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @font_weight = (@_io.read_bytes_term(0, false, true, true)).force_encoding("ASCII").encode('UTF-8')
      self
    end
    attr_reader :font_weight
  end
  attr_reader :magic

  ##
  # The "DATA" section acts as a terminator. The documentation says:
  # "A marker that indicates the remainder of the file is data accessed
  # via the character index (CHIX) section. When reading this font file,
  # the rest of the file can be ignored when scanning the sections."
  attr_reader :sections
end

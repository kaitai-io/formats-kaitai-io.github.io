# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Pcx < Kaitai::Struct::Struct

  VERSIONS = {
    0 => :versions_v2_5,
    2 => :versions_v2_8_with_palette,
    3 => :versions_v2_8_without_palette,
    4 => :versions_paintbrush_for_windows,
    5 => :versions_v3_0,
  }
  I__VERSIONS = VERSIONS.invert

  ENCODINGS = {
    1 => :encodings_rle,
  }
  I__ENCODINGS = ENCODINGS.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @_raw_hdr = @_io.read_bytes(128)
    _io__raw_hdr = Kaitai::Struct::Stream.new(@_raw_hdr)
    @hdr = Header.new(_io__raw_hdr, self, @_root)
    self
  end

  ##
  # @see http://web.archive.org/web/20100206055706/http://www.qzx.com/pc-gpe/pcx.txt - "ZSoft .PCX FILE HEADER FORMAT"
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([10].pack('C*'), magic, _io, "/types/header/seq/0") if not magic == [10].pack('C*')
      @version = Kaitai::Struct::Stream::resolve_enum(Pcx::VERSIONS, @_io.read_u1)
      @encoding = Kaitai::Struct::Stream::resolve_enum(Pcx::ENCODINGS, @_io.read_u1)
      @bits_per_pixel = @_io.read_u1
      @img_x_min = @_io.read_u2le
      @img_y_min = @_io.read_u2le
      @img_x_max = @_io.read_u2le
      @img_y_max = @_io.read_u2le
      @hdpi = @_io.read_u2le
      @vdpi = @_io.read_u2le
      @palette_16 = @_io.read_bytes(48)
      @reserved = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([0].pack('C*'), reserved, _io, "/types/header/seq/11") if not reserved == [0].pack('C*')
      @num_planes = @_io.read_u1
      @bytes_per_line = @_io.read_u2le
      @palette_info = @_io.read_u2le
      @h_screen_size = @_io.read_u2le
      @v_screen_size = @_io.read_u2le
      self
    end

    ##
    # Technically, this field was supposed to be "manufacturer"
    # mark to distinguish between various software vendors, and
    # 0x0a was supposed to mean "ZSoft", but everyone else ended
    # up writing a 0x0a into this field, so that's what majority
    # of modern software expects to have in this attribute.
    attr_reader :magic
    attr_reader :version
    attr_reader :encoding
    attr_reader :bits_per_pixel
    attr_reader :img_x_min
    attr_reader :img_y_min
    attr_reader :img_x_max
    attr_reader :img_y_max
    attr_reader :hdpi
    attr_reader :vdpi
    attr_reader :palette_16
    attr_reader :reserved
    attr_reader :num_planes
    attr_reader :bytes_per_line
    attr_reader :palette_info
    attr_reader :h_screen_size
    attr_reader :v_screen_size
  end
  class TPalette256 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([12].pack('C*'), magic, _io, "/types/t_palette_256/seq/0") if not magic == [12].pack('C*')
      @colors = Array.new(256)
      (256).times { |i|
        @colors[i] = Rgb.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :magic
    attr_reader :colors
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

  ##
  # @see http://web.archive.org/web/20100206055706/http://www.qzx.com/pc-gpe/pcx.txt - "VGA 256 Color Palette Information"
  def palette_256
    return @palette_256 unless @palette_256.nil?
    if  ((hdr.version == :versions_v3_0) && (hdr.bits_per_pixel == 8) && (hdr.num_planes == 1)) 
      _pos = @_io.pos
      @_io.seek((_io.size - 769))
      @palette_256 = TPalette256.new(@_io, self, @_root)
      @_io.seek(_pos)
    end
    @palette_256
  end
  attr_reader :hdr
  attr_reader :_raw_hdr
end

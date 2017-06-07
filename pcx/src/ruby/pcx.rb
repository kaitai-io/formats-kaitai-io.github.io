# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Pcx < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end
  def _read
    @_raw_hdr = @_io.read_bytes(128)
    io = Kaitai::Struct::Stream.new(@_raw_hdr)
    @hdr = Header.new(io, self, @_root)
  end

  ##
  # @see http://web.archive.org/web/20100206055706/http://www.qzx.com/pc-gpe/pcx.txt - "ZSoft .PCX FILE HEADER FORMAT"
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @manufacturer = @_io.read_u1
      @version = @_io.read_u1
      @encoding = @_io.read_u1
      @bits_per_pixel = @_io.read_u1
      @img_x_min = @_io.read_u2le
      @img_y_min = @_io.read_u2le
      @img_x_max = @_io.read_u2le
      @img_y_max = @_io.read_u2le
      @hdpi = @_io.read_u2le
      @vdpi = @_io.read_u2le
      @colormap = @_io.read_bytes(48)
      @reserved = @_io.read_bytes(1)
      @num_planes = @_io.read_u1
      @bytes_per_line = @_io.read_u2le
      @palette_info = @_io.read_u2le
      @h_screen_size = @_io.read_u2le
      @v_screen_size = @_io.read_u2le
    end
    attr_reader :manufacturer
    attr_reader :version
    attr_reader :encoding
    attr_reader :bits_per_pixel
    attr_reader :img_x_min
    attr_reader :img_y_min
    attr_reader :img_x_max
    attr_reader :img_y_max
    attr_reader :hdpi
    attr_reader :vdpi
    attr_reader :colormap
    attr_reader :reserved
    attr_reader :num_planes
    attr_reader :bytes_per_line
    attr_reader :palette_info
    attr_reader :h_screen_size
    attr_reader :v_screen_size
  end
  attr_reader :hdr
  attr_reader :_raw_hdr
end

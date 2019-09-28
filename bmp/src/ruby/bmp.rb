# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Bmp < Kaitai::Struct::Struct

  COMPRESSIONS = {
    0 => :compressions_rgb,
    1 => :compressions_rle8,
    2 => :compressions_rle4,
    3 => :compressions_bitfields,
    4 => :compressions_jpeg,
    5 => :compressions_png,
    11 => :compressions_cmyk,
    12 => :compressions_cmyk_rle8,
    13 => :compressions_cmyk_rle4,
  }
  I__COMPRESSIONS = COMPRESSIONS.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @file_hdr = FileHeader.new(@_io, self, @_root)
    @len_dib_header = @_io.read_s4le
    case len_dib_header
    when 104
      @_raw_dib_header = @_io.read_bytes((len_dib_header - 4))
      _io__raw_dib_header = Kaitai::Struct::Stream.new(@_raw_dib_header)
      @dib_header = BitmapCoreHeader.new(_io__raw_dib_header, self, @_root)
    when 12
      @_raw_dib_header = @_io.read_bytes((len_dib_header - 4))
      _io__raw_dib_header = Kaitai::Struct::Stream.new(@_raw_dib_header)
      @dib_header = BitmapCoreHeader.new(_io__raw_dib_header, self, @_root)
    when 40
      @_raw_dib_header = @_io.read_bytes((len_dib_header - 4))
      _io__raw_dib_header = Kaitai::Struct::Stream.new(@_raw_dib_header)
      @dib_header = BitmapInfoHeader.new(_io__raw_dib_header, self, @_root)
    when 124
      @_raw_dib_header = @_io.read_bytes((len_dib_header - 4))
      _io__raw_dib_header = Kaitai::Struct::Stream.new(@_raw_dib_header)
      @dib_header = BitmapCoreHeader.new(_io__raw_dib_header, self, @_root)
    else
      @dib_header = @_io.read_bytes((len_dib_header - 4))
    end
    self
  end

  ##
  # @see https://msdn.microsoft.com/en-us/library/dd183374.aspx Source
  class FileHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.ensure_fixed_contents([66, 77].pack('C*'))
      @len_file = @_io.read_u4le
      @reserved1 = @_io.read_u2le
      @reserved2 = @_io.read_u2le
      @ofs_bitmap = @_io.read_s4le
      self
    end
    attr_reader :magic
    attr_reader :len_file
    attr_reader :reserved1
    attr_reader :reserved2

    ##
    # Offset to actual raw pixel data of the image
    attr_reader :ofs_bitmap
  end

  ##
  # @see https://msdn.microsoft.com/en-us/library/dd183372.aspx Source
  class BitmapCoreHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @image_width = @_io.read_u2le
      @image_height = @_io.read_u2le
      @num_planes = @_io.read_u2le
      @bits_per_pixel = @_io.read_u2le
      self
    end

    ##
    # Image width, px
    attr_reader :image_width

    ##
    # Image height, px
    attr_reader :image_height

    ##
    # Number of planes for target device, must be 1
    attr_reader :num_planes

    ##
    # Number of bits per pixel that image buffer uses (1, 4, 8, or 24)
    attr_reader :bits_per_pixel
  end

  ##
  # @see https://msdn.microsoft.com/en-us/library/dd183376.aspx Source
  class BitmapInfoHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @image_width = @_io.read_u4le
      @image_height = @_io.read_u4le
      @num_planes = @_io.read_u2le
      @bits_per_pixel = @_io.read_u2le
      @compression = Kaitai::Struct::Stream::resolve_enum(Bmp::COMPRESSIONS, @_io.read_u4le)
      @len_image = @_io.read_u4le
      @x_px_per_m = @_io.read_u4le
      @y_px_per_m = @_io.read_u4le
      @num_colors_used = @_io.read_u4le
      @num_colors_important = @_io.read_u4le
      self
    end
    attr_reader :image_width
    attr_reader :image_height
    attr_reader :num_planes
    attr_reader :bits_per_pixel
    attr_reader :compression
    attr_reader :len_image
    attr_reader :x_px_per_m
    attr_reader :y_px_per_m
    attr_reader :num_colors_used
    attr_reader :num_colors_important
  end
  def image
    return @image unless @image.nil?
    _pos = @_io.pos
    @_io.seek(file_hdr.ofs_bitmap)
    @image = @_io.read_bytes_full
    @_io.seek(_pos)
    @image
  end
  attr_reader :file_hdr
  attr_reader :len_dib_header
  attr_reader :dib_header
  attr_reader :_raw_dib_header
end

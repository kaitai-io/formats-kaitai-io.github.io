# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Bmp < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @file_hdr = FileHeader.new(@_io, self, @_root)
    @dib_hdr = DibHeader.new(@_io, self, @_root)
    self
  end
  class FileHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @file_type = @_io.read_bytes(2)
      @file_size = @_io.read_u4le
      @reserved1 = @_io.read_u2le
      @reserved2 = @_io.read_u2le
      @bitmap_ofs = @_io.read_s4le
      self
    end
    attr_reader :file_type
    attr_reader :file_size
    attr_reader :reserved1
    attr_reader :reserved2
    attr_reader :bitmap_ofs
  end
  class DibHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @dib_header_size = @_io.read_s4le
      if dib_header_size == 12
        @_raw_bitmap_core_header = @_io.read_bytes((dib_header_size - 4))
        io = Kaitai::Struct::Stream.new(@_raw_bitmap_core_header)
        @bitmap_core_header = BitmapCoreHeader.new(io, self, @_root)
      end
      if dib_header_size == 40
        @_raw_bitmap_info_header = @_io.read_bytes((dib_header_size - 4))
        io = Kaitai::Struct::Stream.new(@_raw_bitmap_info_header)
        @bitmap_info_header = BitmapInfoHeader.new(io, self, @_root)
      end
      if dib_header_size == 124
        @_raw_bitmap_v5_header = @_io.read_bytes((dib_header_size - 4))
        io = Kaitai::Struct::Stream.new(@_raw_bitmap_v5_header)
        @bitmap_v5_header = BitmapCoreHeader.new(io, self, @_root)
      end
      if  ((dib_header_size != 12) && (dib_header_size != 40) && (dib_header_size != 124)) 
        @dib_header_body = @_io.read_bytes((dib_header_size - 4))
      end
      self
    end
    attr_reader :dib_header_size
    attr_reader :bitmap_core_header
    attr_reader :bitmap_info_header
    attr_reader :bitmap_v5_header
    attr_reader :dib_header_body
    attr_reader :_raw_bitmap_core_header
    attr_reader :_raw_bitmap_info_header
    attr_reader :_raw_bitmap_v5_header
  end
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
    attr_reader :image_width
    attr_reader :image_height
    attr_reader :num_planes
    attr_reader :bits_per_pixel
  end
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
      @compression = @_io.read_u4le
      @size_image = @_io.read_u4le
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
    attr_reader :size_image
    attr_reader :x_px_per_m
    attr_reader :y_px_per_m
    attr_reader :num_colors_used
    attr_reader :num_colors_important
  end
  def image
    return @image unless @image.nil?
    _pos = @_io.pos
    @_io.seek(file_hdr.bitmap_ofs)
    @image = @_io.read_bytes_full
    @_io.seek(_pos)
    @image
  end
  attr_reader :file_hdr
  attr_reader :dib_hdr
end

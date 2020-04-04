# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# xwd is a file format written by eponymous X11 screen capture
# application (xwd stands for "X Window Dump"). Typically, an average
# user transforms xwd format into something more widespread by any of
# `xwdtopnm` and `pnmto...` utilities right away.
# 
# xwd format itself provides a raw uncompressed bitmap with some
# metainformation, like pixel format, width, height, bit depth,
# etc. Note that technically format includes machine-dependent fields
# and thus is probably a poor choice for true cross-platform usage.
class Xwd < Kaitai::Struct::Struct

  PIXMAP_FORMAT = {
    0 => :pixmap_format_x_y_bitmap,
    1 => :pixmap_format_x_y_pixmap,
    2 => :pixmap_format_z_pixmap,
  }
  I__PIXMAP_FORMAT = PIXMAP_FORMAT.invert

  BYTE_ORDER = {
    0 => :byte_order_le,
    1 => :byte_order_be,
  }
  I__BYTE_ORDER = BYTE_ORDER.invert

  VISUAL_CLASS = {
    0 => :visual_class_static_gray,
    1 => :visual_class_gray_scale,
    2 => :visual_class_static_color,
    3 => :visual_class_pseudo_color,
    4 => :visual_class_true_color,
    5 => :visual_class_direct_color,
  }
  I__VISUAL_CLASS = VISUAL_CLASS.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @len_header = @_io.read_u4be
    @_raw_hdr = @_io.read_bytes((len_header - 4))
    io = Kaitai::Struct::Stream.new(@_raw_hdr)
    @hdr = Header.new(io, self, @_root)
    @_raw_color_map = Array.new(hdr.color_map_entries)
    @color_map = Array.new(hdr.color_map_entries)
    (hdr.color_map_entries).times { |i|
      @_raw_color_map[i] = @_io.read_bytes(12)
      io = Kaitai::Struct::Stream.new(@_raw_color_map[i])
      @color_map[i] = ColorMapEntry.new(io, self, @_root)
    }
    self
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @file_version = @_io.read_u4be
      @pixmap_format = Kaitai::Struct::Stream::resolve_enum(PIXMAP_FORMAT, @_io.read_u4be)
      @pixmap_depth = @_io.read_u4be
      @pixmap_width = @_io.read_u4be
      @pixmap_height = @_io.read_u4be
      @x_offset = @_io.read_u4be
      @byte_order = Kaitai::Struct::Stream::resolve_enum(BYTE_ORDER, @_io.read_u4be)
      @bitmap_unit = @_io.read_u4be
      @bitmap_bit_order = @_io.read_u4be
      @bitmap_pad = @_io.read_u4be
      @bits_per_pixel = @_io.read_u4be
      @bytes_per_line = @_io.read_u4be
      @visual_class = Kaitai::Struct::Stream::resolve_enum(VISUAL_CLASS, @_io.read_u4be)
      @red_mask = @_io.read_u4be
      @green_mask = @_io.read_u4be
      @blue_mask = @_io.read_u4be
      @bits_per_rgb = @_io.read_u4be
      @number_of_colors = @_io.read_u4be
      @color_map_entries = @_io.read_u4be
      @window_width = @_io.read_u4be
      @window_height = @_io.read_u4be
      @window_x = @_io.read_s4be
      @window_y = @_io.read_s4be
      @window_border_width = @_io.read_u4be
      @creator = (@_io.read_bytes_term(0, false, true, true)).force_encoding("UTF-8")
      self
    end

    ##
    # X11WD file version (always 07h)
    attr_reader :file_version

    ##
    # Format of the image data
    attr_reader :pixmap_format

    ##
    # Pixmap depth in pixels - in practice, bits per pixel
    attr_reader :pixmap_depth

    ##
    # Pixmap width in pixels
    attr_reader :pixmap_width

    ##
    # Pixmap height in pixels
    attr_reader :pixmap_height

    ##
    # Bitmap X offset (number of pixels to ignore at the beginning of each scan-line)
    attr_reader :x_offset

    ##
    # Byte order of image data
    attr_reader :byte_order

    ##
    # Bitmap base data size
    attr_reader :bitmap_unit

    ##
    # Bit-order of image data
    attr_reader :bitmap_bit_order

    ##
    # Bitmap scan-line pad
    attr_reader :bitmap_pad

    ##
    # Bits per pixel
    attr_reader :bits_per_pixel

    ##
    # Bytes per scan-line
    attr_reader :bytes_per_line

    ##
    # Class of the image
    attr_reader :visual_class

    ##
    # Red mask
    attr_reader :red_mask

    ##
    # Green mask
    attr_reader :green_mask

    ##
    # Blue mask
    attr_reader :blue_mask

    ##
    # Size of each color mask in bits
    attr_reader :bits_per_rgb

    ##
    # Number of colors in image
    attr_reader :number_of_colors

    ##
    # Number of entries in color map
    attr_reader :color_map_entries

    ##
    # Window width
    attr_reader :window_width

    ##
    # Window height
    attr_reader :window_height

    ##
    # Window upper left X coordinate
    attr_reader :window_x

    ##
    # Window upper left Y coordinate
    attr_reader :window_y

    ##
    # Window border width
    attr_reader :window_border_width

    ##
    # Program that created this xwd file
    attr_reader :creator
  end
  class ColorMapEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entry_number = @_io.read_u4be
      @red = @_io.read_u2be
      @green = @_io.read_u2be
      @blue = @_io.read_u2be
      @flags = @_io.read_u1
      @padding = @_io.read_u1
      self
    end

    ##
    # Number of the color map entry
    attr_reader :entry_number
    attr_reader :red
    attr_reader :green
    attr_reader :blue
    attr_reader :flags
    attr_reader :padding
  end

  ##
  # Size of the header in bytes
  attr_reader :len_header
  attr_reader :hdr
  attr_reader :color_map
  attr_reader :_raw_hdr
  attr_reader :_raw_color_map
end

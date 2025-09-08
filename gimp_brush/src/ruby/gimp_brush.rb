# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# GIMP brush format is native to the GIMP image editor for storing a brush or a texture.
# It can be used in all [Paint Tools](https://docs.gimp.org/2.10/en/gimp-tools-paint.html),
# for example Pencil and Paintbrush. It works by repeating the brush bitmap as you move
# the tool. The Spacing parameter sets the distance between the brush marks as a percentage
# of brush width. Its default value can be set in the brush file.
# 
# You can also use GIMP to create new brushes in this format. Custom brushes can be loaded
# into GIMP for use in the paint tools by copying them into one of the Brush Folders -
# select **Edit** > **Preferences** in the menu bar, expand the **Folders** section
# and choose **Brushes** to see the recognized Brush Folders or to add new ones.
# @see https://github.com/GNOME/gimp/blob/441631322b/devel-docs/gbr.txt Source
class GimpBrush < Kaitai::Struct::Struct

  COLOR_DEPTH = {
    1 => :color_depth_grayscale,
    4 => :color_depth_rgba,
  }
  I__COLOR_DEPTH = COLOR_DEPTH.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @len_header = @_io.read_u4be
    _io_header = @_io.substream(len_header - 4)
    @header = Header.new(_io_header, self, @_root)
    self
  end
  class Bitmap < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @rows = []
      (_root.header.height).times { |i|
        @rows << Row.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :rows
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @version = @_io.read_u4be
      raise Kaitai::Struct::ValidationNotEqualError.new(2, @version, @_io, "/types/header/seq/0") if not @version == 2
      @width = @_io.read_u4be
      raise Kaitai::Struct::ValidationLessThanError.new(1, @width, @_io, "/types/header/seq/1") if not @width >= 1
      raise Kaitai::Struct::ValidationGreaterThanError.new(10000, @width, @_io, "/types/header/seq/1") if not @width <= 10000
      @height = @_io.read_u4be
      raise Kaitai::Struct::ValidationLessThanError.new(1, @height, @_io, "/types/header/seq/2") if not @height >= 1
      raise Kaitai::Struct::ValidationGreaterThanError.new(10000, @height, @_io, "/types/header/seq/2") if not @height <= 10000
      @bytes_per_pixel = Kaitai::Struct::Stream::resolve_enum(GimpBrush::COLOR_DEPTH, @_io.read_u4be)
      @magic = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([71, 73, 77, 80].pack('C*'), @magic, @_io, "/types/header/seq/4") if not @magic == [71, 73, 77, 80].pack('C*')
      @spacing = @_io.read_u4be
      @brush_name = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes_full, 0, false)).force_encoding("UTF-8")
      self
    end
    attr_reader :version

    ##
    # @see https://github.com/GNOME/gimp/blob/441631322b/app/core/gimpbrush-load.c#L170 Source
    # @see https://github.com/GNOME/gimp/blob/441631322b/app/core/gimpbrush-header.h#L24 Source
    attr_reader :width

    ##
    # @see https://github.com/GNOME/gimp/blob/441631322b/app/core/gimpbrush-load.c#L177 Source
    # @see https://github.com/GNOME/gimp/blob/441631322b/app/core/gimpbrush-header.h#L24 Source
    attr_reader :height
    attr_reader :bytes_per_pixel
    attr_reader :magic

    ##
    # Default spacing to be used for brush. Percentage of brush width.
    attr_reader :spacing
    attr_reader :brush_name
  end
  class Row < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @pixels = []
      (_root.header.width).times { |i|
        case _root.header.bytes_per_pixel
        when :color_depth_grayscale
          @pixels << PixelGray.new(@_io, self, @_root)
        when :color_depth_rgba
          @pixels << PixelRgba.new(@_io, self, @_root)
        end
      }
      self
    end
    class PixelGray < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @gray = @_io.read_u1
        self
      end
      def alpha
        return @alpha unless @alpha.nil?
        @alpha = gray
        @alpha
      end
      def blue
        return @blue unless @blue.nil?
        @blue = 0
        @blue
      end
      def green
        return @green unless @green.nil?
        @green = 0
        @green
      end
      def red
        return @red unless @red.nil?
        @red = 0
        @red
      end
      attr_reader :gray
    end
    class PixelRgba < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @red = @_io.read_u1
        @green = @_io.read_u1
        @blue = @_io.read_u1
        @alpha = @_io.read_u1
        self
      end
      attr_reader :red
      attr_reader :green
      attr_reader :blue
      attr_reader :alpha
    end
    attr_reader :pixels
  end
  def body
    return @body unless @body.nil?
    _pos = @_io.pos
    @_io.seek(len_header)
    @body = @_io.read_bytes(len_body)
    @_io.seek(_pos)
    @body
  end
  def len_body
    return @len_body unless @len_body.nil?
    @len_body = (header.width * header.height) * (I__COLOR_DEPTH[header.bytes_per_pixel] || header.bytes_per_pixel)
    @len_body
  end
  attr_reader :len_header
  attr_reader :header
  attr_reader :_raw_header
end

# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Microsoft Windows uses specific file format to store applications
# icons - ICO. This is a container that contains one or more image
# files (effectively, DIB parts of BMP files or full PNG files are
# contained inside).
# @see https://docs.microsoft.com/en-us/previous-versions/ms997538(v=msdn.10) Source
class Ico < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @magic = @_io.read_bytes(4)
    raise Kaitai::Struct::ValidationNotEqualError.new([0, 0, 1, 0].pack('C*'), magic, _io, "/seq/0") if not magic == [0, 0, 1, 0].pack('C*')
    @num_images = @_io.read_u2le
    @images = []
    (num_images).times { |i|
      @images << IconDirEntry.new(@_io, self, @_root)
    }
    self
  end
  class IconDirEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @width = @_io.read_u1
      @height = @_io.read_u1
      @num_colors = @_io.read_u1
      @reserved = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([0].pack('C*'), reserved, _io, "/types/icon_dir_entry/seq/3") if not reserved == [0].pack('C*')
      @num_planes = @_io.read_u2le
      @bpp = @_io.read_u2le
      @len_img = @_io.read_u4le
      @ofs_img = @_io.read_u4le
      self
    end

    ##
    # Raw image data. Use `is_png` to determine whether this is an
    # embedded PNG file (true) or a DIB bitmap (false) and call a
    # relevant parser, if needed to parse image data further.
    def img
      return @img unless @img.nil?
      _pos = @_io.pos
      @_io.seek(ofs_img)
      @img = @_io.read_bytes(len_img)
      @_io.seek(_pos)
      @img
    end

    ##
    # Pre-reads first 8 bytes of the image to determine if it's an
    # embedded PNG file.
    def png_header
      return @png_header unless @png_header.nil?
      _pos = @_io.pos
      @_io.seek(ofs_img)
      @png_header = @_io.read_bytes(8)
      @_io.seek(_pos)
      @png_header
    end

    ##
    # True if this image is in PNG format.
    def is_png
      return @is_png unless @is_png.nil?
      @is_png = png_header == [137, 80, 78, 71, 13, 10, 26, 10].pack('C*')
      @is_png
    end

    ##
    # Width of image, px
    attr_reader :width

    ##
    # Height of image, px
    attr_reader :height

    ##
    # Number of colors in palette of the image or 0 if image has
    # no palette (i.e. RGB, RGBA, etc)
    attr_reader :num_colors
    attr_reader :reserved

    ##
    # Number of color planes
    attr_reader :num_planes

    ##
    # Bits per pixel in the image
    attr_reader :bpp

    ##
    # Size of the image data
    attr_reader :len_img

    ##
    # Absolute offset of the image data start in the file
    attr_reader :ofs_img
  end
  attr_reader :magic

  ##
  # Number of images contained in this file
  attr_reader :num_images
  attr_reader :images
end

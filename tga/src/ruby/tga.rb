# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# TGA (AKA Truevision TGA, AKA TARGA), is a raster image file format created by Truevision. It supports up to 32 bits per pixel (three 8-bit RGB channels + 8-bit alpha channel), color mapping and optional lossless RLE compression.
# @see http://www.dca.fee.unicamp.br/~martino/disciplinas/ea978/tgaffs.pdf Source
class Tga < Kaitai::Struct::Struct

  COLOR_MAP_ENUM = {
    0 => :color_map_enum_no_color_map,
    1 => :color_map_enum_has_color_map,
  }
  I__COLOR_MAP_ENUM = COLOR_MAP_ENUM.invert

  IMAGE_TYPE_ENUM = {
    0 => :image_type_enum_no_image_data,
    1 => :image_type_enum_uncomp_color_mapped,
    2 => :image_type_enum_uncomp_true_color,
    3 => :image_type_enum_uncomp_bw,
    9 => :image_type_enum_rle_color_mapped,
    10 => :image_type_enum_rle_true_color,
    11 => :image_type_enum_rle_bw,
  }
  I__IMAGE_TYPE_ENUM = IMAGE_TYPE_ENUM.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end
  def _read
    @image_id_len = @_io.read_u1
    @color_map_type = Kaitai::Struct::Stream::resolve_enum(COLOR_MAP_ENUM, @_io.read_u1)
    @image_type = Kaitai::Struct::Stream::resolve_enum(IMAGE_TYPE_ENUM, @_io.read_u1)
    @color_map_ofs = @_io.read_u2le
    @num_color_map = @_io.read_u2le
    @color_map_depth = @_io.read_u1
    @x_offset = @_io.read_u2le
    @y_offset = @_io.read_u2le
    @width = @_io.read_u2le
    @height = @_io.read_u2le
    @image_depth = @_io.read_u1
    @img_descriptor = @_io.read_u1
    @image_id = @_io.read_bytes(image_id_len)
    if color_map_type == :color_map_enum_has_color_map
      @color_map = Array.new(num_color_map)
      (num_color_map).times { |i|
        @color_map[i] = @_io.read_bytes(((color_map_depth + 7) / 8))
      }
    end
  end
  class TgaFooter < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @ext_area_ofs = @_io.read_u4le
      @dev_dir_ofs = @_io.read_u4le
      @version_magic = @_io.read_bytes(18)
    end
    def is_valid
      return @is_valid unless @is_valid.nil?
      @is_valid = version_magic == [84, 82, 85, 69, 86, 73, 83, 73, 79, 78, 45, 88, 70, 73, 76, 69, 46, 0].pack('C*')
      @is_valid
    end
    def ext_area
      return @ext_area unless @ext_area.nil?
      if is_valid
        _pos = @_io.pos
        @_io.seek(ext_area_ofs)
        @ext_area = TgaExtArea.new(@_io, self, @_root)
        @_io.seek(_pos)
      end
      @ext_area
    end

    ##
    # Offset to extension area
    attr_reader :ext_area_ofs

    ##
    # Offset to developer directory
    attr_reader :dev_dir_ofs
    attr_reader :version_magic
  end
  class TgaExtArea < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end
    def _read
      @ext_area_size = @_io.read_u2le
      @author_name = (@_io.read_bytes(41)).force_encoding("ASCII")
      @comments = Array.new(4)
      (4).times { |i|
        @comments[i] = (@_io.read_bytes(81)).force_encoding("ASCII")
      }
      @timestamp = @_io.read_bytes(12)
      @job_id = (@_io.read_bytes(41)).force_encoding("ASCII")
      @job_time = (@_io.read_bytes(6)).force_encoding("ASCII")
      @software_id = (@_io.read_bytes(41)).force_encoding("ASCII")
      @software_version = @_io.read_bytes(3)
      @key_color = @_io.read_u4le
      @pixel_aspect_ratio = @_io.read_u4le
      @gamma_value = @_io.read_u4le
      @color_corr_ofs = @_io.read_u4le
      @postage_stamp_ofs = @_io.read_u4le
      @scan_line_ofs = @_io.read_u4le
      @attributes = @_io.read_u1
    end

    ##
    # Extension area size in bytes (always 495)
    attr_reader :ext_area_size
    attr_reader :author_name

    ##
    # Comments, organized as four lines, each consisting of 80 characters plus a NULL
    attr_reader :comments

    ##
    # Image creation date / time
    attr_reader :timestamp

    ##
    # Internal job ID, to be used in image workflow systems
    attr_reader :job_id

    ##
    # Hours, minutes and seconds spent creating the file (for billing, etc.)
    attr_reader :job_time

    ##
    # The application that created the file.
    attr_reader :software_id
    attr_reader :software_version
    attr_reader :key_color
    attr_reader :pixel_aspect_ratio
    attr_reader :gamma_value

    ##
    # Number of bytes from the beginning of the file to the color correction table if present
    attr_reader :color_corr_ofs

    ##
    # Number of bytes from the beginning of the file to the postage stamp image if present
    attr_reader :postage_stamp_ofs

    ##
    # Number of bytes from the beginning of the file to the scan lines table if present
    attr_reader :scan_line_ofs

    ##
    # Specifies the alpha channel
    attr_reader :attributes
  end
  def footer
    return @footer unless @footer.nil?
    _pos = @_io.pos
    @_io.seek((_io.size - 26))
    @footer = TgaFooter.new(@_io, self, @_root)
    @_io.seek(_pos)
    @footer
  end
  attr_reader :image_id_len
  attr_reader :color_map_type
  attr_reader :image_type
  attr_reader :color_map_ofs

  ##
  # Number of entries in a color map
  attr_reader :num_color_map

  ##
  # Number of bits in a each color maps entry
  attr_reader :color_map_depth
  attr_reader :x_offset
  attr_reader :y_offset

  ##
  # Width of the image, in pixels
  attr_reader :width

  ##
  # Height of the image, in pixels
  attr_reader :height
  attr_reader :image_depth
  attr_reader :img_descriptor

  ##
  # Arbitrary application-specific information that is used to
  # identify image. May contain text or some binary data.
  attr_reader :image_id

  ##
  # Color map
  attr_reader :color_map
end

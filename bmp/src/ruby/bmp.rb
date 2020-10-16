# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# The **BMP file format**, also known as **bitmap image file** or **device independent
# bitmap (DIB) file format** or simply a **bitmap**, is a raster graphics image file
# format used to store bitmap digital images, independently of the display
# device (such as a graphics adapter), especially on Microsoft Windows
# and OS/2 operating systems.
# 
# ## Samples
# 
# Great collection of various BMP sample files:
# [**BMP Suite Image List**](
#   http://entropymine.com/jason/bmpsuite/bmpsuite/html/bmpsuite.html
# ) (by Jason Summers)
# 
# If only there was such a comprehensive sample suite for every file format! It's like
# a dream for every developer of any binary file format parser. It contains a lot of
# different types and variations of BMP files, even the tricky ones, where it's not clear
# from the specification how to deal with them (marked there as "**q**uestionable").
# 
# If you make a program which will be able to read all the "**g**ood" and "**q**uestionable"
# BMP files and won't crash on the "**b**ad" ones, it will definitely have one of the most
# extensive support of BMP files in the universe!
# 
# ## BITMAPV2INFOHEADER and BITMAPV3INFOHEADER
# 
# A beneficial discussion on Adobe forum (archived):
# [**Invalid BMP Format with Alpha channel**](
#   https://web.archive.org/web/20150127132443/https://forums.adobe.com/message/3272950
# )
# 
# In 2010, someone noticed that Photoshop generated BMP with an odd type of header. There wasn't
# any documentation available for this header at the time (and still isn't).
# However, Chris Cox (former Adobe employee) claimed that they hadn't invented any type
# of proprietary header and everything they were writing was taken directly
# from the Microsoft documentation.
# 
# It showed up that the unknown header was called BITMAPV3INFOHEADER.
# Although Microsoft has apparently requested and verified the use of the header,
# the documentation on MSDN has probably got lost and they have probably
# forgotten about this type of header.
# 
# This is the only source I could find about these structures, so we could't rely
# on it so much, but I think supporting them as a read-only format won't harm anything.
# Due to the fact that it isn't documented anywhere else, most applications don't support it.
# 
# All Windows headers at once (including mentioned BITMAPV2INFOHEADER and BITMAPV3INFOHEADER):
# 
# ![Bitmap headers overview](
#   https://web.archive.org/web/20190527043845/https://forums.adobe.com/servlet/JiveServlet/showImage/2-3273299-47801/BMP_Headers.png
# )
# 
# ## Specs
#  * [Bitmap Storage (Windows Dev Center)](
#      https://docs.microsoft.com/en-us/windows/win32/gdi/bitmap-storage
#    )
#     * BITMAPFILEHEADER
#     * BITMAPINFOHEADER
#     * BITMAPV4HEADER
#     * BITMAPV5HEADER
#  * [OS/2 Bitmap File Format](
#       https://www.fileformat.info/format/os2bmp/egff.htm
#    )
#     * BITMAPFILEHEADER (OS2BMPFILEHEADER)
#     * BITMAPCOREHEADER (OS21XBITMAPHEADER)
#     * OS22XBITMAPHEADER
#  * [Microsoft Windows Bitmap](
#       http://netghost.narod.ru/gff/graphics/summary/micbmp.htm
#    )
#     * BITMAPFILEHEADER (WINBMPFILEHEADER)
#     * BITMAPCOREHEADER (WIN2XBITMAPHEADER)
#     * BITMAPINFOHEADER (WINNTBITMAPHEADER)
#     * BITMAPV4HEADER (WIN4XBITMAPHEADER)
class Bmp < Kaitai::Struct::Struct

  INTENT = {
    1 => :intent_business,
    2 => :intent_graphics,
    4 => :intent_images,
    8 => :intent_abs_colorimetric,
  }
  I__INTENT = INTENT.invert

  COLOR_SPACE = {
    0 => :color_space_calibrated_rgb,
    1279872587 => :color_space_profile_linked,
    1296188740 => :color_space_profile_embedded,
    1466527264 => :color_space_windows,
    1934772034 => :color_space_s_rgb,
  }
  I__COLOR_SPACE = COLOR_SPACE.invert

  OS2_RENDERING = {
    0 => :os2_rendering_no_halftoning,
    1 => :os2_rendering_error_diffusion,
    2 => :os2_rendering_panda,
    3 => :os2_rendering_super_circle,
  }
  I__OS2_RENDERING = OS2_RENDERING.invert

  HEADER_TYPE = {
    12 => :header_type_bitmap_core_header,
    40 => :header_type_bitmap_info_header,
    52 => :header_type_bitmap_v2_info_header,
    56 => :header_type_bitmap_v3_info_header,
    64 => :header_type_os2_2x_bitmap_header,
    108 => :header_type_bitmap_v4_header,
    124 => :header_type_bitmap_v5_header,
  }
  I__HEADER_TYPE = HEADER_TYPE.invert

  COMPRESSIONS = {
    0 => :compressions_rgb,
    1 => :compressions_rle8,
    2 => :compressions_rle4,
    3 => :compressions_bitfields,
    4 => :compressions_jpeg,
    5 => :compressions_png,
    6 => :compressions_alpha_bitfields,
  }
  I__COMPRESSIONS = COMPRESSIONS.invert

  OS2_COMPRESSIONS = {
    0 => :os2_compressions_rgb,
    1 => :os2_compressions_rle8,
    2 => :os2_compressions_rle4,
    3 => :os2_compressions_huffman_1d,
    4 => :os2_compressions_rle24,
  }
  I__OS2_COMPRESSIONS = OS2_COMPRESSIONS.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @file_hdr = FileHeader.new(@_io, self, @_root)
    @_raw_dib_info = @_io.read_bytes((file_hdr.ofs_bitmap - 14))
    _io__raw_dib_info = Kaitai::Struct::Stream.new(@_raw_dib_info)
    @dib_info = BitmapInfo.new(_io__raw_dib_info, self, @_root)
    @_raw_bitmap = @_io.read_bytes_full
    _io__raw_bitmap = Kaitai::Struct::Stream.new(@_raw_bitmap)
    @bitmap = Bitmap.new(_io__raw_bitmap, self, @_root)
    self
  end

  ##
  # @see https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-ciexyz Source
  class CieXyz < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @x = FixedPoint2Dot30.new(@_io, self, @_root)
      @y = FixedPoint2Dot30.new(@_io, self, @_root)
      @z = FixedPoint2Dot30.new(@_io, self, @_root)
      self
    end
    attr_reader :x
    attr_reader :y
    attr_reader :z
  end
  class RgbRecord < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, has_reserved_field)
      super(_io, _parent, _root)
      @has_reserved_field = has_reserved_field
      _read
    end

    def _read
      @blue = @_io.read_u1
      @green = @_io.read_u1
      @red = @_io.read_u1
      if has_reserved_field
        @reserved = @_io.read_u1
      end
      self
    end
    attr_reader :blue
    attr_reader :green
    attr_reader :red
    attr_reader :reserved
    attr_reader :has_reserved_field
  end

  ##
  # @see https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapv5header Source
  class BitmapV5Extension < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @intent = Kaitai::Struct::Stream::resolve_enum(Bmp::INTENT, @_io.read_u4le)
      @ofs_profile = @_io.read_u4le
      @len_profile = @_io.read_u4le
      @reserved = @_io.read_u4le
      self
    end
    def has_profile
      return @has_profile unless @has_profile.nil?
      @has_profile =  ((_parent.bitmap_v4_ext.color_space_type == :color_space_profile_linked) || (_parent.bitmap_v4_ext.color_space_type == :color_space_profile_embedded)) 
      @has_profile
    end

    ##
    # @see https://docs.microsoft.com/en-us/previous-versions/windows/desktop/wcs/using-structures-in-wcs-1-0 "If the profile is embedded, profile data is the actual profile, and if it is linked, the profile data is the null-terminated file name of the profile. This cannot be a Unicode string. It must be composed exclusively of characters from the Windows character set (code page 1252)."
    def profile_data
      return @profile_data unless @profile_data.nil?
      if has_profile
        io = _root._io
        _pos = io.pos
        io.seek((14 + ofs_profile))
        case _parent.bitmap_v4_ext.color_space_type == :color_space_profile_linked
        when true
          @profile_data = (Kaitai::Struct::Stream::bytes_terminate(io.read_bytes(len_profile), 0, false)).force_encoding("windows-1252")
        else
          @profile_data = io.read_bytes(len_profile)
        end
        io.seek(_pos)
      end
      @profile_data
    end
    attr_reader :intent

    ##
    # The offset, in bytes, from the beginning of the BITMAPV5HEADER structure to the start of the profile data.
    attr_reader :ofs_profile
    attr_reader :len_profile
    attr_reader :reserved
  end
  class ColorMask < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, has_alpha_mask)
      super(_io, _parent, _root)
      @has_alpha_mask = has_alpha_mask
      _read
    end

    def _read
      @red_mask = @_io.read_u4le
      @green_mask = @_io.read_u4le
      @blue_mask = @_io.read_u4le
      if has_alpha_mask
        @alpha_mask = @_io.read_u4le
      end
      self
    end
    attr_reader :red_mask
    attr_reader :green_mask
    attr_reader :blue_mask
    attr_reader :alpha_mask
    attr_reader :has_alpha_mask
  end

  ##
  # @see https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapv4header Source
  class BitmapV4Extension < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @color_space_type = Kaitai::Struct::Stream::resolve_enum(Bmp::COLOR_SPACE, @_io.read_u4le)
      @endpoint_red = CieXyz.new(@_io, self, @_root)
      @endpoint_green = CieXyz.new(@_io, self, @_root)
      @endpoint_blue = CieXyz.new(@_io, self, @_root)
      @gamma_red = FixedPoint16Dot16.new(@_io, self, @_root)
      @gamma_blue = FixedPoint16Dot16.new(@_io, self, @_root)
      @gamma_green = FixedPoint16Dot16.new(@_io, self, @_root)
      self
    end
    attr_reader :color_space_type
    attr_reader :endpoint_red
    attr_reader :endpoint_green
    attr_reader :endpoint_blue
    attr_reader :gamma_red
    attr_reader :gamma_blue
    attr_reader :gamma_green
  end

  ##
  # @see https://docs.microsoft.com/en-us/previous-versions/dd183376(v=vs.85) Source
  class BitmapInfoExtension < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      if !(_parent.extends_os2_2x_bitmap)
        @compression = Kaitai::Struct::Stream::resolve_enum(Bmp::COMPRESSIONS, @_io.read_u4le)
      end
      if _parent.extends_os2_2x_bitmap
        @os2_compression = Kaitai::Struct::Stream::resolve_enum(Bmp::OS2_COMPRESSIONS, @_io.read_u4le)
      end
      @len_image = @_io.read_u4le
      @x_resolution = @_io.read_u4le
      @y_resolution = @_io.read_u4le
      @num_colors_used = @_io.read_u4le
      @num_colors_important = @_io.read_u4le
      self
    end
    attr_reader :compression
    attr_reader :os2_compression

    ##
    # If biCompression is BI_JPEG or BI_PNG, indicates the size of the JPEG or PNG image buffer.
    # This may be set to zero for BI_RGB bitmaps.
    attr_reader :len_image
    attr_reader :x_resolution
    attr_reader :y_resolution
    attr_reader :num_colors_used
    attr_reader :num_colors_important
  end
  class FixedPoint2Dot30 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @raw = @_io.read_u4le
      self
    end
    def value
      return @value unless @value.nil?
      @value = (raw / (1 << 30))
      @value
    end
    attr_reader :raw
  end

  ##
  # Replace with an opaque type if you care about the pixels.
  # You can look at an example of a JavaScript implementation: https://github.com/generalmimon/bmptool/blob/master/src/Bitmap.js
  # 
  # There is a proposal for adding bitmap data type to Kaitai Struct: https://github.com/kaitai-io/kaitai_struct/issues/188
  class Bitmap < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      self
    end
  end

  ##
  # @see https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapcoreheader Source
  # @see https://www.fileformat.info/format/os2bmp/egff.htm#OS2BMP-DMYID.3.1 Source
  class BitmapHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, len_header)
      super(_io, _parent, _root)
      @len_header = len_header
      _read
    end

    def _read
      case is_core_header
      when true
        @image_width = @_io.read_u2le
      when false
        @image_width = @_io.read_u4le
      end
      case is_core_header
      when true
        @image_height_raw = @_io.read_s2le
      when false
        @image_height_raw = @_io.read_s4le
      end
      @num_planes = @_io.read_u2le
      @bits_per_pixel = @_io.read_u2le
      if extends_bitmap_info
        @bitmap_info_ext = BitmapInfoExtension.new(@_io, self, @_root)
      end
      if is_color_mask_here
        @color_mask = ColorMask.new(@_io, self, @_root, len_header != Bmp::I__HEADER_TYPE[:header_type_bitmap_v2_info_header])
      end
      if extends_os2_2x_bitmap
        @os2_2x_bitmap_ext = Os22xBitmapExtension.new(@_io, self, @_root)
      end
      if extends_bitmap_v4
        @bitmap_v4_ext = BitmapV4Extension.new(@_io, self, @_root)
      end
      if extends_bitmap_v5
        @bitmap_v5_ext = BitmapV5Extension.new(@_io, self, @_root)
      end
      self
    end
    def extends_bitmap_v4
      return @extends_bitmap_v4 unless @extends_bitmap_v4.nil?
      @extends_bitmap_v4 = len_header >= Bmp::I__HEADER_TYPE[:header_type_bitmap_v4_header]
      @extends_bitmap_v4
    end
    def extends_os2_2x_bitmap
      return @extends_os2_2x_bitmap unless @extends_os2_2x_bitmap.nil?
      @extends_os2_2x_bitmap = len_header == Bmp::I__HEADER_TYPE[:header_type_os2_2x_bitmap_header]
      @extends_os2_2x_bitmap
    end
    def uses_fixed_palette
      return @uses_fixed_palette unless @uses_fixed_palette.nil?
      @uses_fixed_palette =  ((!( ((bits_per_pixel == 16) || (bits_per_pixel == 24) || (bits_per_pixel == 32)) )) && (!( ((extends_bitmap_info) && (!(extends_os2_2x_bitmap)) && ( ((bitmap_info_ext.compression == :compressions_jpeg) || (bitmap_info_ext.compression == :compressions_png)) )) ))) 
      @uses_fixed_palette
    end
    def extends_bitmap_info
      return @extends_bitmap_info unless @extends_bitmap_info.nil?
      @extends_bitmap_info = len_header >= Bmp::I__HEADER_TYPE[:header_type_bitmap_info_header]
      @extends_bitmap_info
    end
    def image_height
      return @image_height unless @image_height.nil?
      @image_height = (image_height_raw < 0 ? -(image_height_raw) : image_height_raw)
      @image_height
    end
    def is_core_header
      return @is_core_header unless @is_core_header.nil?
      @is_core_header = len_header == Bmp::I__HEADER_TYPE[:header_type_bitmap_core_header]
      @is_core_header
    end
    def extends_bitmap_v5
      return @extends_bitmap_v5 unless @extends_bitmap_v5.nil?
      @extends_bitmap_v5 = len_header >= Bmp::I__HEADER_TYPE[:header_type_bitmap_v5_header]
      @extends_bitmap_v5
    end
    def is_color_mask_here
      return @is_color_mask_here unless @is_color_mask_here.nil?
      @is_color_mask_here =  ((len_header == Bmp::I__HEADER_TYPE[:header_type_bitmap_v2_info_header]) || (len_header == Bmp::I__HEADER_TYPE[:header_type_bitmap_v3_info_header]) || (extends_bitmap_v4)) 
      @is_color_mask_here
    end
    def bottom_up
      return @bottom_up unless @bottom_up.nil?
      @bottom_up = image_height_raw > 0
      @bottom_up
    end

    ##
    # Image width, px
    attr_reader :image_width

    ##
    # Image height, px (positive => bottom-up image, negative => top-down image)
    attr_reader :image_height_raw

    ##
    # Number of planes for target device, must be 1
    attr_reader :num_planes

    ##
    # Number of bits per pixel that image buffer uses (1, 4, 8, 16, 24 or 32)
    attr_reader :bits_per_pixel
    attr_reader :bitmap_info_ext
    attr_reader :color_mask
    attr_reader :os2_2x_bitmap_ext
    attr_reader :bitmap_v4_ext
    attr_reader :bitmap_v5_ext
    attr_reader :len_header
  end

  ##
  # @see https://www.fileformat.info/format/os2bmp/egff.htm#OS2BMP-DMYID.3.2 Source
  class Os22xBitmapExtension < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @units = @_io.read_u2le
      @reserved = @_io.read_u2le
      @recording = @_io.read_u2le
      @rendering = Kaitai::Struct::Stream::resolve_enum(Bmp::OS2_RENDERING, @_io.read_u2le)
      @size1 = @_io.read_u4le
      @size2 = @_io.read_u4le
      @color_encoding = @_io.read_u4le
      @identifier = @_io.read_u4le
      self
    end
    attr_reader :units
    attr_reader :reserved

    ##
    # Specifies how the bitmap scan lines are stored.
    # The only valid value for this field is 0, indicating that the bitmap is
    # stored from left to right and from the bottom up.
    attr_reader :recording

    ##
    # Specifies the halftoning algorithm used on the bitmap data.
    attr_reader :rendering

    ##
    # rendering == os2_rendering::error_diffusion
    #   => error damping as a percentage in the range 0 through 100
    # rendering == os2_rendering::panda or rendering == os2_rendering::super_circle
    #   => X dimension of the pattern used in pixels
    attr_reader :size1

    ##
    # rendering == os2_rendering::error_diffusion
    #   => not used
    # rendering == os2_rendering::panda or rendering == os2_rendering::super_circle
    #   => Y dimension of the pattern used in pixels
    attr_reader :size2

    ##
    # Specifies the color model used to describe the bitmap data.
    # The only valid value is 0, indicating the RGB encoding scheme.
    attr_reader :color_encoding

    ##
    # Application-specific value
    attr_reader :identifier
  end
  class FixedPoint16Dot16 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @raw = @_io.read_u4le
      self
    end
    def value
      return @value unless @value.nil?
      @value = (raw / (1 << 16))
      @value
    end
    attr_reader :raw
  end
  class ColorTable < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, has_reserved_field, num_colors)
      super(_io, _parent, _root)
      @has_reserved_field = has_reserved_field
      @num_colors = num_colors
      _read
    end

    def _read
      @colors = Array.new(( ((num_colors > 0) && (num_colors < num_colors_present))  ? num_colors : num_colors_present))
      (( ((num_colors > 0) && (num_colors < num_colors_present))  ? num_colors : num_colors_present)).times { |i|
        @colors[i] = RgbRecord.new(@_io, self, @_root, has_reserved_field)
      }
      self
    end
    def num_colors_present
      return @num_colors_present unless @num_colors_present.nil?
      @num_colors_present = (_io.size / (has_reserved_field ? 4 : 3))
      @num_colors_present
    end
    attr_reader :colors
    attr_reader :has_reserved_field

    ##
    # If equal to 0, the pallete should contain as many colors as can fit into the pixel value
    # according to the `bits_per_pixel` field (if `bits_per_pixel` = 8, then the pixel can
    # represent 2 ** 8 = 256 values, so exactly 256 colors should be present). For more flexibility,
    # it reads as many colors as it can until EOS is reached (and the image data begin).
    attr_reader :num_colors
  end

  ##
  # @see https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapfileheader Source
  class FileHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @file_type = @_io.read_bytes(2)
      raise Kaitai::Struct::ValidationNotEqualError.new([66, 77].pack('C*'), file_type, _io, "/types/file_header/seq/0") if not file_type == [66, 77].pack('C*')
      @len_file = @_io.read_u4le
      @reserved1 = @_io.read_u2le
      @reserved2 = @_io.read_u2le
      @ofs_bitmap = @_io.read_s4le
      self
    end
    attr_reader :file_type

    ##
    # not reliable, mostly ignored by BMP decoders
    attr_reader :len_file
    attr_reader :reserved1
    attr_reader :reserved2

    ##
    # Offset to actual raw pixel data of the image
    attr_reader :ofs_bitmap
  end

  ##
  # @see https://docs.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfo Source
  class BitmapInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_header = @_io.read_u4le
      @_raw_header = @_io.read_bytes((len_header - 4))
      _io__raw_header = Kaitai::Struct::Stream.new(@_raw_header)
      @header = BitmapHeader.new(_io__raw_header, self, @_root, len_header)
      if  ((!(_io.eof?)) && (is_color_mask_here)) 
        @color_mask = ColorMask.new(@_io, self, @_root, header.bitmap_info_ext.compression == :compressions_alpha_bitfields)
      end
      if !(_io.eof?)
        @_raw_color_table = @_io.read_bytes_full
        _io__raw_color_table = Kaitai::Struct::Stream.new(@_raw_color_table)
        @color_table = ColorTable.new(_io__raw_color_table, self, @_root, !(header.is_core_header), (header.extends_bitmap_info ? header.bitmap_info_ext.num_colors_used : 0))
      end
      self
    end
    def is_color_mask_given
      return @is_color_mask_given unless @is_color_mask_given.nil?
      @is_color_mask_given =  ((header.extends_bitmap_info) && ( ((header.bitmap_info_ext.compression == :compressions_bitfields) || (header.bitmap_info_ext.compression == :compressions_alpha_bitfields)) ) && ( ((is_color_mask_here) || (header.is_color_mask_here)) )) 
      @is_color_mask_given
    end
    def color_mask_given
      return @color_mask_given unless @color_mask_given.nil?
      if is_color_mask_given
        @color_mask_given = (is_color_mask_here ? color_mask : header.color_mask)
      end
      @color_mask_given
    end
    def color_mask_blue
      return @color_mask_blue unless @color_mask_blue.nil?
      @color_mask_blue = (is_color_mask_given ? color_mask_given.blue_mask : (header.bits_per_pixel == 16 ? 31 : ( ((header.bits_per_pixel == 24) || (header.bits_per_pixel == 32))  ? 255 : 0)))
      @color_mask_blue
    end
    def color_mask_alpha
      return @color_mask_alpha unless @color_mask_alpha.nil?
      @color_mask_alpha = ( ((is_color_mask_given) && (color_mask_given.has_alpha_mask))  ? color_mask_given.alpha_mask : 0)
      @color_mask_alpha
    end
    def color_mask_green
      return @color_mask_green unless @color_mask_green.nil?
      @color_mask_green = (is_color_mask_given ? color_mask_given.green_mask : (header.bits_per_pixel == 16 ? 992 : ( ((header.bits_per_pixel == 24) || (header.bits_per_pixel == 32))  ? 65280 : 0)))
      @color_mask_green
    end
    def is_color_mask_here
      return @is_color_mask_here unless @is_color_mask_here.nil?
      @is_color_mask_here =  ((header.len_header == Bmp::I__HEADER_TYPE[:header_type_bitmap_info_header]) && ( ((header.bitmap_info_ext.compression == :compressions_bitfields) || (header.bitmap_info_ext.compression == :compressions_alpha_bitfields)) )) 
      @is_color_mask_here
    end
    def color_mask_red
      return @color_mask_red unless @color_mask_red.nil?
      @color_mask_red = (is_color_mask_given ? color_mask_given.red_mask : (header.bits_per_pixel == 16 ? 31744 : ( ((header.bits_per_pixel == 24) || (header.bits_per_pixel == 32))  ? 16711680 : 0)))
      @color_mask_red
    end
    attr_reader :len_header
    attr_reader :header

    ##
    # Valid only for BITMAPINFOHEADER, in all headers extending it the masks are contained in the header itself.
    attr_reader :color_mask
    attr_reader :color_table
    attr_reader :_raw_header
    attr_reader :_raw_color_table
  end
  attr_reader :file_hdr
  attr_reader :dib_info
  attr_reader :bitmap
  attr_reader :_raw_dib_info
  attr_reader :_raw_bitmap
end

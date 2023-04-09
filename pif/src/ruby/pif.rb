# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# The Portable Image Format (PIF) is a basic, bitmap-like image format with the
# focus on ease of use (implementation) and small size for embedded
# applications.
# 
# See <https://github.com/gfcwfzkm/PIF-Image-Format> for more info.
# @see https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf Source
# @see https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/C%20Library/pifdec.c#L300 Source
class Pif < Kaitai::Struct::Struct

  IMAGE_TYPE = {
    7763 => :image_type_rgb332,
    17212 => :image_type_rgb888,
    18754 => :image_type_indexed_rgb332,
    18759 => :image_type_indexed_rgb565,
    18770 => :image_type_indexed_rgb888,
    32170 => :image_type_black_white,
    47253 => :image_type_rgb16c,
    58821 => :image_type_rgb565,
  }
  I__IMAGE_TYPE = IMAGE_TYPE.invert

  COMPRESSION_TYPE = {
    0 => :compression_type_none,
    32222 => :compression_type_rle,
  }
  I__COMPRESSION_TYPE = COMPRESSION_TYPE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @file_header = PifHeader.new(@_io, self, @_root)
    @info_header = InformationHeader.new(@_io, self, @_root)
    if info_header.uses_indexed_mode
      @_raw_color_table = @_io.read_bytes(info_header.len_color_table)
      _io__raw_color_table = Kaitai::Struct::Stream.new(@_raw_color_table)
      @color_table = ColorTableData.new(_io__raw_color_table, self, @_root)
    end
    self
  end
  class PifHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([80, 73, 70, 0].pack('C*'), magic, _io, "/types/pif_header/seq/0") if not magic == [80, 73, 70, 0].pack('C*')
      @len_file = @_io.read_u4le
      raise Kaitai::Struct::ValidationLessThanError.new(ofs_image_data_min, len_file, _io, "/types/pif_header/seq/1") if not len_file >= ofs_image_data_min
      @ofs_image_data = @_io.read_u4le
      raise Kaitai::Struct::ValidationLessThanError.new(ofs_image_data_min, ofs_image_data, _io, "/types/pif_header/seq/2") if not ofs_image_data >= ofs_image_data_min
      raise Kaitai::Struct::ValidationGreaterThanError.new(len_file, ofs_image_data, _io, "/types/pif_header/seq/2") if not ofs_image_data <= len_file
      self
    end
    def ofs_image_data_min
      return @ofs_image_data_min unless @ofs_image_data_min.nil?
      @ofs_image_data_min = (12 + 16)
      @ofs_image_data_min
    end
    attr_reader :magic
    attr_reader :len_file
    attr_reader :ofs_image_data
  end
  class InformationHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @image_type = Kaitai::Struct::Stream::resolve_enum(Pif::IMAGE_TYPE, @_io.read_u2le)
      raise Kaitai::Struct::ValidationNotAnyOfError.new(image_type, _io, "/types/information_header/seq/0") if not  ((image_type == :image_type_rgb888) || (image_type == :image_type_rgb565) || (image_type == :image_type_rgb332) || (image_type == :image_type_rgb16c) || (image_type == :image_type_black_white) || (image_type == :image_type_indexed_rgb888) || (image_type == :image_type_indexed_rgb565) || (image_type == :image_type_indexed_rgb332)) 
      @bits_per_pixel = @_io.read_u2le
      _ = bits_per_pixel
      raise Kaitai::Struct::ValidationExprError.new(bits_per_pixel, _io, "/types/information_header/seq/1") if not (image_type == :image_type_rgb888 ? _ == 24 : (image_type == :image_type_rgb565 ? _ == 16 : (image_type == :image_type_rgb332 ? _ == 8 : (image_type == :image_type_rgb16c ? _ == 4 : (image_type == :image_type_black_white ? _ == 1 : (uses_indexed_mode ? _ <= 8 : true))))))
      @width = @_io.read_u2le
      @height = @_io.read_u2le
      @len_image_data = @_io.read_u4le
      raise Kaitai::Struct::ValidationGreaterThanError.new((_root.file_header.len_file - _root.file_header.ofs_image_data), len_image_data, _io, "/types/information_header/seq/4") if not len_image_data <= (_root.file_header.len_file - _root.file_header.ofs_image_data)
      @len_color_table = @_io.read_u2le
      raise Kaitai::Struct::ValidationLessThanError.new((uses_indexed_mode ? (len_color_table_entry * 1) : 0), len_color_table, _io, "/types/information_header/seq/5") if not len_color_table >= (uses_indexed_mode ? (len_color_table_entry * 1) : 0)
      raise Kaitai::Struct::ValidationGreaterThanError.new((uses_indexed_mode ? (len_color_table_max < len_color_table_full ? len_color_table_max : len_color_table_full) : 0), len_color_table, _io, "/types/information_header/seq/5") if not len_color_table <= (uses_indexed_mode ? (len_color_table_max < len_color_table_full ? len_color_table_max : len_color_table_full) : 0)
      @compression = Kaitai::Struct::Stream::resolve_enum(Pif::COMPRESSION_TYPE, @_io.read_u2le)
      raise Kaitai::Struct::ValidationNotAnyOfError.new(compression, _io, "/types/information_header/seq/6") if not  ((compression == :compression_type_none) || (compression == :compression_type_rle)) 
      self
    end
    def len_color_table_entry
      return @len_color_table_entry unless @len_color_table_entry.nil?
      @len_color_table_entry = (image_type == :image_type_indexed_rgb888 ? 3 : (image_type == :image_type_indexed_rgb565 ? 2 : (image_type == :image_type_indexed_rgb332 ? 1 : 0)))
      @len_color_table_entry
    end
    def len_color_table_full
      return @len_color_table_full unless @len_color_table_full.nil?
      @len_color_table_full = (len_color_table_entry * (1 << bits_per_pixel))
      @len_color_table_full
    end
    def len_color_table_max
      return @len_color_table_max unless @len_color_table_max.nil?
      @len_color_table_max = (_root.file_header.ofs_image_data - _root.file_header.ofs_image_data_min)
      @len_color_table_max
    end
    def uses_indexed_mode
      return @uses_indexed_mode unless @uses_indexed_mode.nil?
      @uses_indexed_mode = len_color_table_entry != 0
      @uses_indexed_mode
    end
    attr_reader :image_type

    ##
    # See <https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf>:
    # 
    # > Bits per Pixel: Bit size that each Pixel occupies. Bit size for an
    # > Indexed Image cannot go beyond 8 bits.
    attr_reader :bits_per_pixel
    attr_reader :width
    attr_reader :height
    attr_reader :len_image_data

    ##
    # See <https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf>:
    # 
    # > Color Table Size: (...), only used in Indexed mode, otherwise zero.
    # ---
    # > **Note**: The presence of the Color Table is mandatory when Bits per
    # > Pixel <= 8, unless Image Type states RGB332, RGB16C or B/W
    # ---
    # > **Color Table** (semi-optional)
    # >
    # > (...) The amount of Colors has to be same or less than [Bits per
    # > Pixel] allow, otherwise the image is invalid.
    attr_reader :len_color_table
    attr_reader :compression
  end
  class ColorTableData < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      i = 0
      while not @_io.eof?
        case _root.info_header.image_type
        when :image_type_indexed_rgb888
          @entries << @_io.read_bits_int_le(24)
        when :image_type_indexed_rgb565
          @entries << @_io.read_bits_int_le(16)
        when :image_type_indexed_rgb332
          @entries << @_io.read_bits_int_le(8)
        end
        i += 1
      end
      self
    end
    attr_reader :entries
  end
  def image_data
    return @image_data unless @image_data.nil?
    _pos = @_io.pos
    @_io.seek(file_header.ofs_image_data)
    @image_data = @_io.read_bytes(info_header.len_image_data)
    @_io.seek(_pos)
    @image_data
  end
  attr_reader :file_header
  attr_reader :info_header
  attr_reader :color_table
  attr_reader :_raw_color_table
end

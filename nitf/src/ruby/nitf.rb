# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# The NITF (National Image Transition Format) format is a file format developed by the U.S. Government for
# storing imagery, e.g. from satellites.
# 
# According to the [foreword of the specification](https://gwg.nga.mil/ntb/baseline/docs/2500c/2500C.pdf):
# > The National Imagery Transmission Format Standard (NITFS) is the suite of standards for formatting digital
# > imagery and imagery-related products and exchanging them among members of the Intelligence Community (IC) as
# > defined by the Executive Order 12333, and other United States Government departments and agencies."
# 
# This implementation is set to version format (`file_version`) of 02.10 and `standard_type` of `BF01`.
# It was implemented by [River Loop Security](https://riverloopsecurity.com).
# @see https://gwg.nga.mil/ntb/baseline/docs/2500c/2500C.pdf Source
class Nitf < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @header = Header.new(@_io, self, @_root)
    @image_segments = Array.new(header.num_image_segments.to_i)
    (header.num_image_segments.to_i).times { |i|
      @image_segments[i] = ImageSegment.new(@_io, self, @_root, i)
    }
    @graphics_segments = Array.new(header.num_graphics_segments.to_i)
    (header.num_graphics_segments.to_i).times { |i|
      @graphics_segments[i] = GraphicsSegment.new(@_io, self, @_root, i)
    }
    @text_segments = Array.new(header.num_text_files.to_i)
    (header.num_text_files.to_i).times { |i|
      @text_segments[i] = TextSegment.new(@_io, self, @_root, i)
    }
    @data_extension_segments = Array.new(header.num_data_extension.to_i)
    (header.num_data_extension.to_i).times { |i|
      @data_extension_segments[i] = DataExtensionSegment.new(@_io, self, @_root, i)
    }
    @reserved_extension_segments = Array.new(header.num_reserved_extension.to_i)
    (header.num_reserved_extension.to_i).times { |i|
      @reserved_extension_segments[i] = ReservedExtensionSegment.new(@_io, self, @_root, i)
    }
    self
  end
  class ReservedExtensionSegment < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, idx)
      super(_io, _parent, _root)
      @idx = idx
      _read
    end

    def _read
      @_raw_reserved_sub_header = @_io.read_bytes(_parent.header.lrnfo[idx].length_reserved_extension_subheader.to_i)
      _io__raw_reserved_sub_header = Kaitai::Struct::Stream.new(@_raw_reserved_sub_header)
      @reserved_sub_header = ReservedSubHeader.new(_io__raw_reserved_sub_header, self, @_root)
      @reserved_data_field = @_io.read_bytes(_parent.header.lrnfo[idx].length_reserved_extension_segment.to_i)
      self
    end
    attr_reader :reserved_sub_header
    attr_reader :reserved_data_field
    attr_reader :idx
    attr_reader :_raw_reserved_sub_header
  end
  class ImageComment < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @_unnamed0 = (@_io.read_bytes(80)).force_encoding("UTF-8")
      self
    end
    attr_reader :_unnamed0
  end
  class LengthReservedInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @length_reserved_extension_subheader = (@_io.read_bytes(4)).force_encoding("UTF-8")
      @length_reserved_extension_segment = (@_io.read_bytes(7)).force_encoding("UTF-8")
      self
    end
    attr_reader :length_reserved_extension_subheader
    attr_reader :length_reserved_extension_segment
  end
  class Tre < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @extension_type_id = (@_io.read_bytes(6)).force_encoding("UTF-8")
      @edata_length = (@_io.read_bytes(5)).force_encoding("UTF-8")
      @edata = (@_io.read_bytes(edata_length.to_i)).force_encoding("UTF-8")
      self
    end

    ##
    # RETAG or CETAG
    attr_reader :extension_type_id

    ##
    # REL or CEL
    attr_reader :edata_length

    ##
    # REDATA or CEDATA
    attr_reader :edata
  end
  class BandInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @representation = (@_io.read_bytes(2)).force_encoding("UTF-8")
      @subcategory = (@_io.read_bytes(6)).force_encoding("UTF-8")
      @img_filter_condition = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([78].pack('C*'), img_filter_condition, _io, "/types/band_info/seq/2") if not img_filter_condition == [78].pack('C*')
      @img_filter_code = (@_io.read_bytes(3)).force_encoding("UTF-8")
      @num_luts = (@_io.read_bytes(1)).force_encoding("UTF-8")
      if num_luts.to_i != 0
        @num_lut_entries = (@_io.read_bytes(5)).force_encoding("UTF-8")
      end
      @luts = Array.new(num_luts.to_i)
      (num_luts.to_i).times { |i|
        @luts[i] = @_io.read_bytes(num_lut_entries.to_i)
      }
      self
    end

    ##
    # Indicates processing required to display the nth band of image w.r.t. the general image type recorded by IREP field
    attr_reader :representation
    attr_reader :subcategory
    attr_reader :img_filter_condition

    ##
    # Reserved
    attr_reader :img_filter_code
    attr_reader :num_luts

    ##
    # Number of entries in each of the LUTs for the nth image band
    attr_reader :num_lut_entries
    attr_reader :luts
  end
  class ImageSegment < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, idx)
      super(_io, _parent, _root)
      @idx = idx
      _read
    end

    def _read
      @image_sub_header = ImageSubHeader.new(@_io, self, @_root)
      if has_mask
        @image_data_mask = ImageDataMask.new(@_io, self, @_root)
      end
      if has_mask
        @image_data_field = @_io.read_bytes((_parent.header.linfo[idx].length_image_segment.to_i - image_data_mask.total_size))
      end
      self
    end
    def has_mask
      return @has_mask unless @has_mask.nil?
      @has_mask =  ((image_sub_header.img_compression[0..(1 - 1)] == "M") || (image_sub_header.img_compression[1..(2 - 1)] == "M")) 
      @has_mask
    end
    attr_reader :image_sub_header
    attr_reader :image_data_mask
    attr_reader :image_data_field
    attr_reader :idx
  end
  class TextSegment < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, idx)
      super(_io, _parent, _root)
      @idx = idx
      _read
    end

    def _read
      @text_sub_header = @_io.read_bytes(1)
      @text_data_field = @_io.read_bytes(_parent.header.ltnfo[idx].length_text_segment.to_i)
      self
    end
    attr_reader :text_sub_header
    attr_reader :text_data_field
    attr_reader :idx
  end
  class GraphicSubHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @file_part_type_sy = @_io.read_bytes(2)
      raise Kaitai::Struct::ValidationNotEqualError.new([83, 89].pack('C*'), file_part_type_sy, _io, "/types/graphic_sub_header/seq/0") if not file_part_type_sy == [83, 89].pack('C*')
      @graphic_id = (@_io.read_bytes(10)).force_encoding("UTF-8")
      @graphic_name = (@_io.read_bytes(20)).force_encoding("UTF-8")
      @graphic_classification = Clasnfo.new(@_io, self, @_root)
      @encryption = Encrypt.new(@_io, self, @_root)
      @graphic_type = @_io.read_bytes(1)
      raise Kaitai::Struct::ValidationNotEqualError.new([67].pack('C*'), graphic_type, _io, "/types/graphic_sub_header/seq/5") if not graphic_type == [67].pack('C*')
      @reserved1 = (@_io.read_bytes(13)).force_encoding("UTF-8")
      @graphic_display_level = (@_io.read_bytes(3)).force_encoding("UTF-8")
      @graphic_attachment_level = (@_io.read_bytes(3)).force_encoding("UTF-8")
      @graphic_location = (@_io.read_bytes(10)).force_encoding("UTF-8")
      @first_graphic_bound_loc = (@_io.read_bytes(10)).force_encoding("UTF-8")
      @graphic_color = (@_io.read_bytes(1)).force_encoding("UTF-8")
      @second_graphic_bound_loc = (@_io.read_bytes(10)).force_encoding("UTF-8")
      @reserved2 = (@_io.read_bytes(2)).force_encoding("UTF-8")
      @graphics_extended_sub_header = TreHeader.new(@_io, self, @_root)
      self
    end
    attr_reader :file_part_type_sy
    attr_reader :graphic_id
    attr_reader :graphic_name
    attr_reader :graphic_classification
    attr_reader :encryption
    attr_reader :graphic_type

    ##
    # Reserved
    attr_reader :reserved1
    attr_reader :graphic_display_level
    attr_reader :graphic_attachment_level
    attr_reader :graphic_location
    attr_reader :first_graphic_bound_loc
    attr_reader :graphic_color
    attr_reader :second_graphic_bound_loc

    ##
    # Reserved
    attr_reader :reserved2
    attr_reader :graphics_extended_sub_header
  end
  class Clasnfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @security_class = (@_io.read_bytes(1)).force_encoding("UTF-8")
      @security_system = (@_io.read_bytes(2)).force_encoding("UTF-8")
      @codewords = (@_io.read_bytes(11)).force_encoding("UTF-8")
      @control_and_handling = (@_io.read_bytes(2)).force_encoding("UTF-8")
      @releaseability = (@_io.read_bytes(20)).force_encoding("UTF-8")
      @declass_type = (@_io.read_bytes(2)).force_encoding("UTF-8")
      @declass_date = (@_io.read_bytes(8)).force_encoding("UTF-8")
      @declass_exemption = (@_io.read_bytes(4)).force_encoding("UTF-8")
      @downgrade = (@_io.read_bytes(1)).force_encoding("UTF-8")
      @downgrade_date = (@_io.read_bytes(8)).force_encoding("UTF-8")
      @class_text = (@_io.read_bytes(43)).force_encoding("UTF-8")
      @class_authority_type = (@_io.read_bytes(1)).force_encoding("UTF-8")
      @class_authority = (@_io.read_bytes(40)).force_encoding("UTF-8")
      @class_reason = (@_io.read_bytes(1)).force_encoding("UTF-8")
      @source_date = (@_io.read_bytes(8)).force_encoding("UTF-8")
      @control_number = (@_io.read_bytes(15)).force_encoding("UTF-8")
      self
    end
    attr_reader :security_class
    attr_reader :security_system
    attr_reader :codewords
    attr_reader :control_and_handling
    attr_reader :releaseability
    attr_reader :declass_type
    attr_reader :declass_date
    attr_reader :declass_exemption
    attr_reader :downgrade
    attr_reader :downgrade_date
    attr_reader :class_text
    attr_reader :class_authority_type
    attr_reader :class_authority
    attr_reader :class_reason
    attr_reader :source_date
    attr_reader :control_number
  end
  class LengthGraphicInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @length_graphic_subheader = (@_io.read_bytes(4)).force_encoding("UTF-8")
      @length_graphic_segment = (@_io.read_bytes(6)).force_encoding("UTF-8")
      self
    end
    attr_reader :length_graphic_subheader
    attr_reader :length_graphic_segment
  end
  class Encrypt < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @_unnamed0 = (@_io.read_bytes(1)).force_encoding("UTF-8")
      self
    end
    attr_reader :_unnamed0
  end
  class ImageDataMask < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @blocked_img_data_offset = @_io.read_u4be
      @bmrlnth = @_io.read_u2be
      @tmrlnth = @_io.read_u2be
      @tpxcdlnth = @_io.read_u2be
      @tpxcd = @_io.read_bytes(tpxcd_size)
      if has_bmr
        @bmrbnd = Array.new(bmrtmr_count)
        (bmrtmr_count).times { |i|
          @bmrbnd[i] = @_io.read_u4be
        }
      end
      if has_tmr
        @tmrbnd = Array.new(bmrtmr_count)
        (bmrtmr_count).times { |i|
          @tmrbnd[i] = @_io.read_u4be
        }
      end
      self
    end
    def has_bmr
      return @has_bmr unless @has_bmr.nil?
      @has_bmr = bmrlnth != 0
      @has_bmr
    end
    def has_tmr
      return @has_tmr unless @has_tmr.nil?
      @has_tmr = tmrlnth != 0
      @has_tmr
    end
    def tmrbnd_size
      return @tmrbnd_size unless @tmrbnd_size.nil?
      @tmrbnd_size = (has_tmr ? (bmrtmr_count * 4) : 0)
      @tmrbnd_size
    end
    def tpxcd_size
      return @tpxcd_size unless @tpxcd_size.nil?
      @tpxcd_size = (((tpxcdlnth % 8) == 0 ? tpxcdlnth : (tpxcdlnth + (8 - (tpxcdlnth % 8)))) / 8)
      @tpxcd_size
    end
    def total_size
      return @total_size unless @total_size.nil?
      @total_size = ((((((4 + 2) + 2) + 2) + tpxcd_size) + bmrbnd_size) + tmrbnd_size)
      @total_size
    end
    def bmrbnd_size
      return @bmrbnd_size unless @bmrbnd_size.nil?
      @bmrbnd_size = (has_bmr ? (bmrtmr_count * 4) : 0)
      @bmrbnd_size
    end
    def bmrtmr_count
      return @bmrtmr_count unless @bmrtmr_count.nil?
      @bmrtmr_count = ((_parent.image_sub_header.num_blocks_per_row.to_i * _parent.image_sub_header.num_blocks_per_col.to_i) * (_parent.image_sub_header.img_mode != "S" ? 1 : (_parent.image_sub_header.num_bands.to_i != 0 ? _parent.image_sub_header.num_bands.to_i : _parent.image_sub_header.num_multispectral_bands.to_i)))
      @bmrtmr_count
    end
    attr_reader :blocked_img_data_offset

    ##
    # Block Mask Record Length
    attr_reader :bmrlnth

    ##
    # Pad Pixel Mask Record Length
    attr_reader :tmrlnth

    ##
    # Pad Output Pixel Code Length
    attr_reader :tpxcdlnth

    ##
    # Pad Output Pixel Code
    attr_reader :tpxcd

    ##
    # Block n, Band m Offset
    attr_reader :bmrbnd

    ##
    # Pad Pixel n, Band m
    attr_reader :tmrbnd
  end
  class GraphicsSegment < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, idx)
      super(_io, _parent, _root)
      @idx = idx
      _read
    end

    def _read
      @graphic_sub_header = GraphicSubHeader.new(@_io, self, @_root)
      @graphic_data_field = @_io.read_bytes(_parent.header.lnnfo[idx].length_graphic_segment.to_i)
      self
    end
    attr_reader :graphic_sub_header
    attr_reader :graphic_data_field
    attr_reader :idx
  end
  class DataSubHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @des_base = DataSubHeaderBase.new(@_io, self, @_root)
      if tre_ofl
        @overflowed_header_type = (@_io.read_bytes(6)).force_encoding("UTF-8")
      end
      if tre_ofl
        @data_item_overflowed = (@_io.read_bytes(3)).force_encoding("UTF-8")
      end
      @des_defined_subheader_fields_len = (@_io.read_bytes(4)).force_encoding("UTF-8")
      @desshf = (@_io.read_bytes(des_defined_subheader_fields_len.to_i)).force_encoding("UTF-8")
      @des_defined_data_field = (@_io.read_bytes_full).force_encoding("UTF-8")
      self
    end
    def tre_ofl
      return @tre_ofl unless @tre_ofl.nil?
      @tre_ofl = des_base.desid == "TRE_OVERFLOW"
      @tre_ofl
    end
    attr_reader :des_base
    attr_reader :overflowed_header_type
    attr_reader :data_item_overflowed
    attr_reader :des_defined_subheader_fields_len
    attr_reader :desshf
    attr_reader :des_defined_data_field
  end
  class DataExtensionSegment < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, idx)
      super(_io, _parent, _root)
      @idx = idx
      _read
    end

    def _read
      @_raw_data_sub_header = @_io.read_bytes(_parent.header.ldnfo[idx].length_data_extension_subheader.to_i)
      _io__raw_data_sub_header = Kaitai::Struct::Stream.new(@_raw_data_sub_header)
      @data_sub_header = DataSubHeader.new(_io__raw_data_sub_header, self, @_root)
      @data_data_field = @_io.read_bytes(_parent.header.ldnfo[idx].length_data_extension_segment.to_i)
      self
    end
    attr_reader :data_sub_header
    attr_reader :data_data_field
    attr_reader :idx
    attr_reader :_raw_data_sub_header
  end
  class DataSubHeaderTre < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @des_base = DataSubHeaderBase.new(@_io, self, @_root)
      if des_base.desid == "TRE_OVERFLOW"
        @overflowed_header_type = (@_io.read_bytes(6)).force_encoding("UTF-8")
      end
      if des_base.desid == "TRE_OVERFLOW"
        @data_item_overflowed = (@_io.read_bytes(3)).force_encoding("UTF-8")
      end
      @des_defined_subheader_fields_len = (@_io.read_bytes(4)).force_encoding("UTF-8")
      @des_defined_data_field = (@_io.read_bytes(des_defined_subheader_fields_len.to_i)).force_encoding("UTF-8")
      self
    end
    attr_reader :des_base
    attr_reader :overflowed_header_type
    attr_reader :data_item_overflowed
    attr_reader :des_defined_subheader_fields_len
    attr_reader :des_defined_data_field
  end
  class ImageSubHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @file_part_type = @_io.read_bytes(2)
      raise Kaitai::Struct::ValidationNotEqualError.new([73, 77].pack('C*'), file_part_type, _io, "/types/image_sub_header/seq/0") if not file_part_type == [73, 77].pack('C*')
      @image_id_1 = (@_io.read_bytes(10)).force_encoding("UTF-8")
      @image_date_time = DateTime.new(@_io, self, @_root)
      @target_id = (@_io.read_bytes(17)).force_encoding("UTF-8")
      @image_id_2 = (@_io.read_bytes(80)).force_encoding("UTF-8")
      @image_security_classification = Clasnfo.new(@_io, self, @_root)
      @encryption = Encrypt.new(@_io, self, @_root)
      @image_source = (@_io.read_bytes(42)).force_encoding("UTF-8")
      @num_sig_rows = (@_io.read_bytes(8)).force_encoding("UTF-8")
      @num_sig_cols = (@_io.read_bytes(8)).force_encoding("UTF-8")
      @pixel_value_type = (@_io.read_bytes(3)).force_encoding("UTF-8")
      @image_representation = (@_io.read_bytes(8)).force_encoding("UTF-8")
      @image_category = (@_io.read_bytes(8)).force_encoding("UTF-8")
      @actual_bits_per_pixel_per_band = (@_io.read_bytes(2)).force_encoding("UTF-8")
      @pixel_justification = (@_io.read_bytes(1)).force_encoding("UTF-8")
      @image_coordinate_rep = (@_io.read_bytes(1)).force_encoding("UTF-8")
      @image_geo_loc = (@_io.read_bytes(60)).force_encoding("UTF-8")
      @num_img_comments = (@_io.read_bytes(1)).force_encoding("UTF-8")
      @img_comments = Array.new(num_img_comments.to_i)
      (num_img_comments.to_i).times { |i|
        @img_comments[i] = ImageComment.new(@_io, self, @_root)
      }
      @img_compression = (@_io.read_bytes(2)).force_encoding("UTF-8")
      @compression_rate_code = (@_io.read_bytes(4)).force_encoding("UTF-8")
      @num_bands = (@_io.read_bytes(1)).force_encoding("UTF-8")
      if num_bands.to_i == 0
        @num_multispectral_bands = (@_io.read_bytes(5)).force_encoding("UTF-8")
      end
      @bands = Array.new((num_bands.to_i != 0 ? num_bands.to_i : num_multispectral_bands.to_i))
      ((num_bands.to_i != 0 ? num_bands.to_i : num_multispectral_bands.to_i)).times { |i|
        @bands[i] = BandInfo.new(@_io, self, @_root)
      }
      @img_sync_code = (@_io.read_bytes(1)).force_encoding("UTF-8")
      @img_mode = (@_io.read_bytes(1)).force_encoding("UTF-8")
      @num_blocks_per_row = (@_io.read_bytes(4)).force_encoding("UTF-8")
      @num_blocks_per_col = (@_io.read_bytes(4)).force_encoding("UTF-8")
      @num_pixels_per_block_horz = (@_io.read_bytes(4)).force_encoding("UTF-8")
      @num_pixels_per_block_vert = (@_io.read_bytes(4)).force_encoding("UTF-8")
      @num_pixels_per_band = (@_io.read_bytes(2)).force_encoding("UTF-8")
      @img_display_level = (@_io.read_bytes(3)).force_encoding("UTF-8")
      @attachment_level = (@_io.read_bytes(3)).force_encoding("UTF-8")
      @img_location = (@_io.read_bytes(10)).force_encoding("UTF-8")
      @img_magnification = (@_io.read_bytes(4)).force_encoding("UTF-8")
      @user_def_img_data_len = (@_io.read_bytes(5)).force_encoding("UTF-8")
      if user_def_img_data_len.to_i != 0
        @user_def_overflow = (@_io.read_bytes(3)).force_encoding("UTF-8")
      end
      if user_def_img_data_len.to_i > 2
        @user_def_img_data = Array.new((user_def_img_data_len.to_i - 3))
        ((user_def_img_data_len.to_i - 3)).times { |i|
          @user_def_img_data[i] = @_io.read_u1
        }
      end
      @image_extended_sub_header = TreHeader.new(@_io, self, @_root)
      self
    end
    attr_reader :file_part_type
    attr_reader :image_id_1
    attr_reader :image_date_time
    attr_reader :target_id
    attr_reader :image_id_2
    attr_reader :image_security_classification
    attr_reader :encryption
    attr_reader :image_source

    ##
    # Total number of rows of significant pixels in the image; only rows indexed 0 to (NROWS - 1) of the image contain significant data.
    attr_reader :num_sig_rows
    attr_reader :num_sig_cols
    attr_reader :pixel_value_type

    ##
    # MONO, RGB, RGB/LUT, MULTI, NODISPLY, NVECTOR, POLAR, VPH, YCbCr601
    attr_reader :image_representation

    ##
    # VIS, SL, TI, FL, RD, EO, OP, HR, HS,CP, BP, SAR, SARIQ, IR, MAP, MS, FP, MRI, XRAY, CAT, VD, PAT, LEG, DTEM, MATR, LOCG, BARO, CURRENT, DEPTH, WIND
    attr_reader :image_category
    attr_reader :actual_bits_per_pixel_per_band
    attr_reader :pixel_justification
    attr_reader :image_coordinate_rep
    attr_reader :image_geo_loc
    attr_reader :num_img_comments
    attr_reader :img_comments
    attr_reader :img_compression
    attr_reader :compression_rate_code
    attr_reader :num_bands
    attr_reader :num_multispectral_bands
    attr_reader :bands

    ##
    # Reserved for future use.
    attr_reader :img_sync_code

    ##
    # B = Band Interleaved by Block, P = Band Interleaved by Pixel, R = Band Interleaved by Row, S = Band Sequential
    attr_reader :img_mode
    attr_reader :num_blocks_per_row
    attr_reader :num_blocks_per_col
    attr_reader :num_pixels_per_block_horz
    attr_reader :num_pixels_per_block_vert
    attr_reader :num_pixels_per_band
    attr_reader :img_display_level
    attr_reader :attachment_level
    attr_reader :img_location
    attr_reader :img_magnification
    attr_reader :user_def_img_data_len
    attr_reader :user_def_overflow
    attr_reader :user_def_img_data
    attr_reader :image_extended_sub_header
  end
  class ReservedSubHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @file_part_type_re = @_io.read_bytes(2)
      raise Kaitai::Struct::ValidationNotEqualError.new([82, 69].pack('C*'), file_part_type_re, _io, "/types/reserved_sub_header/seq/0") if not file_part_type_re == [82, 69].pack('C*')
      @res_type_id = (@_io.read_bytes(25)).force_encoding("UTF-8")
      @res_version = (@_io.read_bytes(2)).force_encoding("UTF-8")
      @reclasnfo = Clasnfo.new(@_io, self, @_root)
      @res_user_defined_subheader_length = (@_io.read_bytes(4)).force_encoding("UTF-8")
      @res_user_defined_subheader_fields = (@_io.read_bytes(res_user_defined_subheader_length.to_i)).force_encoding("UTF-8")
      @res_user_defined_data = (@_io.read_bytes_full).force_encoding("UTF-8")
      self
    end
    attr_reader :file_part_type_re
    attr_reader :res_type_id
    attr_reader :res_version
    attr_reader :reclasnfo
    attr_reader :res_user_defined_subheader_length
    attr_reader :res_user_defined_subheader_fields
    attr_reader :res_user_defined_data
  end
  class DataSubHeaderBase < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @file_part_type_de = @_io.read_bytes(2)
      raise Kaitai::Struct::ValidationNotEqualError.new([68, 69].pack('C*'), file_part_type_de, _io, "/types/data_sub_header_base/seq/0") if not file_part_type_de == [68, 69].pack('C*')
      @desid = (@_io.read_bytes(25)).force_encoding("UTF-8")
      @data_definition_version = (@_io.read_bytes(2)).force_encoding("UTF-8")
      @declasnfo = Clasnfo.new(@_io, self, @_root)
      self
    end

    ##
    # File Part Type desigantor for Data Extension
    attr_reader :file_part_type_de
    attr_reader :desid
    attr_reader :data_definition_version
    attr_reader :declasnfo
  end
  class TextSubHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @text_date_time = (@_io.read_bytes(14)).force_encoding("UTF-8")
      @text_title = (@_io.read_bytes(80)).force_encoding("UTF-8")
      @text_security_class = Clasnfo.new(@_io, self, @_root)
      @encryp = Encrypt.new(@_io, self, @_root)
      @text_format = (@_io.read_bytes(3)).force_encoding("UTF-8")
      @text_extended_sub_header = TreHeader.new(@_io, self, @_root)
      self
    end
    attr_reader :text_date_time
    attr_reader :text_title
    attr_reader :text_security_class
    attr_reader :encryp

    ##
    # MTF (USMTF see MIL-STD-6040), STA (indicates BCS), UT1 (indicates ECS), U8S
    attr_reader :text_format
    attr_reader :text_extended_sub_header
  end
  class DateTime < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @_unnamed0 = (@_io.read_bytes(14)).force_encoding("UTF-8")
      self
    end

    ##
    # UTC time of image acquisition in the format CCYYMMDDhhmmss: CC century, YY last two digits of the year, MM month, DD day, hh hour, mm minute, ss second
    attr_reader :_unnamed0
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @file_profile_name = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([78, 73, 84, 70].pack('C*'), file_profile_name, _io, "/types/header/seq/0") if not file_profile_name == [78, 73, 84, 70].pack('C*')
      @file_version = @_io.read_bytes(5)
      raise Kaitai::Struct::ValidationNotEqualError.new([48, 50, 46, 49, 48].pack('C*'), file_version, _io, "/types/header/seq/1") if not file_version == [48, 50, 46, 49, 48].pack('C*')
      @complexity_level = @_io.read_bytes(2)
      @standard_type = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([66, 70, 48, 49].pack('C*'), standard_type, _io, "/types/header/seq/3") if not standard_type == [66, 70, 48, 49].pack('C*')
      @originating_station_id = (@_io.read_bytes(10)).force_encoding("UTF-8")
      @file_date_time = DateTime.new(@_io, self, @_root)
      @file_title = (@_io.read_bytes(80)).force_encoding("UTF-8")
      @file_security = Clasnfo.new(@_io, self, @_root)
      @file_copy_number = (@_io.read_bytes(5)).force_encoding("UTF-8")
      @file_num_of_copys = (@_io.read_bytes(5)).force_encoding("UTF-8")
      @encryption = Encrypt.new(@_io, self, @_root)
      @file_bg_color = @_io.read_bytes(3)
      @originator_name = (@_io.read_bytes(24)).force_encoding("UTF-8")
      @originator_phone = (@_io.read_bytes(18)).force_encoding("UTF-8")
      @file_length = (@_io.read_bytes(12)).force_encoding("UTF-8")
      @file_header_length = (@_io.read_bytes(6)).force_encoding("UTF-8")
      @num_image_segments = (@_io.read_bytes(3)).force_encoding("UTF-8")
      @linfo = Array.new(num_image_segments.to_i)
      (num_image_segments.to_i).times { |i|
        @linfo[i] = LengthImageInfo.new(@_io, self, @_root)
      }
      @num_graphics_segments = (@_io.read_bytes(3)).force_encoding("UTF-8")
      @lnnfo = Array.new(num_graphics_segments.to_i)
      (num_graphics_segments.to_i).times { |i|
        @lnnfo[i] = LengthGraphicInfo.new(@_io, self, @_root)
      }
      @reserved_numx = (@_io.read_bytes(3)).force_encoding("UTF-8")
      @num_text_files = (@_io.read_bytes(3)).force_encoding("UTF-8")
      @ltnfo = Array.new(num_text_files.to_i)
      (num_text_files.to_i).times { |i|
        @ltnfo[i] = LengthTextInfo.new(@_io, self, @_root)
      }
      @num_data_extension = (@_io.read_bytes(3)).force_encoding("UTF-8")
      @ldnfo = Array.new(num_data_extension.to_i)
      (num_data_extension.to_i).times { |i|
        @ldnfo[i] = LengthDataInfo.new(@_io, self, @_root)
      }
      @num_reserved_extension = (@_io.read_bytes(3)).force_encoding("UTF-8")
      @lrnfo = Array.new(num_reserved_extension.to_i)
      (num_reserved_extension.to_i).times { |i|
        @lrnfo[i] = LengthReservedInfo.new(@_io, self, @_root)
      }
      @user_defined_header = TreHeader.new(@_io, self, @_root)
      @extended_header = TreHeader.new(@_io, self, @_root)
      self
    end
    attr_reader :file_profile_name
    attr_reader :file_version
    attr_reader :complexity_level

    ##
    # Value of BF01 indicates the file is formatted using ISO/IEC IS 12087-5.
    attr_reader :standard_type
    attr_reader :originating_station_id
    attr_reader :file_date_time
    attr_reader :file_title
    attr_reader :file_security
    attr_reader :file_copy_number
    attr_reader :file_num_of_copys
    attr_reader :encryption
    attr_reader :file_bg_color
    attr_reader :originator_name
    attr_reader :originator_phone
    attr_reader :file_length
    attr_reader :file_header_length
    attr_reader :num_image_segments
    attr_reader :linfo
    attr_reader :num_graphics_segments
    attr_reader :lnnfo
    attr_reader :reserved_numx
    attr_reader :num_text_files
    attr_reader :ltnfo
    attr_reader :num_data_extension
    attr_reader :ldnfo
    attr_reader :num_reserved_extension
    attr_reader :lrnfo
    attr_reader :user_defined_header
    attr_reader :extended_header
  end

  ##
  # Streaming file Header Data Extension Segment Subheader
  class DataSubHeaderStreaming < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @des_base = DataSubHeaderBase.new(@_io, self, @_root)
      @des_defined_subheader_fields_len = (@_io.read_bytes(4)).force_encoding("UTF-8")
      @sfh_l1 = (@_io.read_bytes(7)).force_encoding("UTF-8")
      @sfh_delim1 = @_io.read_u4be
      @sfh_dr = Array.new(sfh_l1.to_i)
      (sfh_l1.to_i).times { |i|
        @sfh_dr[i] = @_io.read_u1
      }
      @sfh_delim2 = @_io.read_u4be
      @sfh_l2 = (@_io.read_bytes(7)).force_encoding("UTF-8")
      self
    end
    attr_reader :des_base
    attr_reader :des_defined_subheader_fields_len

    ##
    # SFH Length 1: number of bytes in sfh_dr field
    attr_reader :sfh_l1

    ##
    # Shall contain the value 0x0A6E1D97.
    attr_reader :sfh_delim1
    attr_reader :sfh_dr

    ##
    # Shall contain the value 0x0ECA14BF.
    attr_reader :sfh_delim2

    ##
    # A repeat of sfh_l1.
    attr_reader :sfh_l2
  end
  class TreHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @header_data_length = (@_io.read_bytes(5)).force_encoding("UTF-8")
      if header_data_length.to_i != 0
        @header_overflow = (@_io.read_bytes(3)).force_encoding("UTF-8")
      end
      if header_data_length.to_i > 2
        @header_data = Array.new((header_data_length.to_i - 3))
        ((header_data_length.to_i - 3)).times { |i|
          @header_data[i] = @_io.read_u1
        }
      end
      self
    end
    attr_reader :header_data_length
    attr_reader :header_overflow
    attr_reader :header_data
  end
  class LengthImageInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @length_image_subheader = (@_io.read_bytes(6)).force_encoding("UTF-8")
      @length_image_segment = (@_io.read_bytes(10)).force_encoding("UTF-8")
      self
    end
    attr_reader :length_image_subheader
    attr_reader :length_image_segment
  end
  class LengthDataInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @length_data_extension_subheader = (@_io.read_bytes(4)).force_encoding("UTF-8")
      @length_data_extension_segment = (@_io.read_bytes(9)).force_encoding("UTF-8")
      self
    end
    attr_reader :length_data_extension_subheader
    attr_reader :length_data_extension_segment
  end
  class LengthTextInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @length_text_subheader = (@_io.read_bytes(4)).force_encoding("UTF-8")
      @length_text_segment = (@_io.read_bytes(5)).force_encoding("UTF-8")
      self
    end
    attr_reader :length_text_subheader
    attr_reader :length_text_segment
  end
  attr_reader :header
  attr_reader :image_segments
  attr_reader :graphics_segments
  attr_reader :text_segments
  attr_reader :data_extension_segments
  attr_reader :reserved_extension_segments
end

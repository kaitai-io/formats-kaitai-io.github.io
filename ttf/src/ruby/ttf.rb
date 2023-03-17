# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# A TrueType font file contains data, in table format, that comprises
# an outline font.
# @see https://web.archive.org/web/20160410081432/https://www.microsoft.com/typography/tt/ttf_spec/ttch02.doc Source
class Ttf < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @offset_table = OffsetTable.new(@_io, self, @_root)
    @directory_table = []
    (offset_table.num_tables).times { |i|
      @directory_table << DirTableEntry.new(@_io, self, @_root)
    }
    self
  end
  class Post < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @format = Fixed.new(@_io, self, @_root)
      @italic_angle = Fixed.new(@_io, self, @_root)
      @underline_position = @_io.read_s2be
      @underline_thichness = @_io.read_s2be
      @is_fixed_pitch = @_io.read_u4be
      @min_mem_type42 = @_io.read_u4be
      @max_mem_type42 = @_io.read_u4be
      @min_mem_type1 = @_io.read_u4be
      @max_mem_type1 = @_io.read_u4be
      if  ((format.major == 2) && (format.minor == 0)) 
        @format20 = Format20.new(@_io, self, @_root)
      end
      self
    end
    class Format20 < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @number_of_glyphs = @_io.read_u2be
        @glyph_name_index = []
        (number_of_glyphs).times { |i|
          @glyph_name_index << @_io.read_u2be
        }
        @glyph_names = []
        i = 0
        begin
          _ = PascalString.new(@_io, self, @_root)
          @glyph_names << _
          i += 1
        end until  ((_.length == 0) || (_io.eof?)) 
        self
      end
      class PascalString < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @length = @_io.read_u1
          if length != 0
            @value = (@_io.read_bytes(length)).force_encoding("ascii")
          end
          self
        end
        attr_reader :length
        attr_reader :value
      end
      attr_reader :number_of_glyphs
      attr_reader :glyph_name_index
      attr_reader :glyph_names
    end
    attr_reader :format
    attr_reader :italic_angle
    attr_reader :underline_position
    attr_reader :underline_thichness
    attr_reader :is_fixed_pitch
    attr_reader :min_mem_type42
    attr_reader :max_mem_type42
    attr_reader :min_mem_type1
    attr_reader :max_mem_type1
    attr_reader :format20
  end

  ##
  # Name table is meant to include human-readable string metadata
  # that describes font: name of the font, its styles, copyright &
  # trademark notices, vendor and designer info, etc.
  # 
  # The table includes a list of "name records", each of which
  # corresponds to a single metadata entry.
  # @see https://developer.apple.com/fonts/TrueType-Reference-Manual/RM06/Chap6name.html Source
  class Name < Kaitai::Struct::Struct

    PLATFORMS = {
      0 => :platforms_unicode,
      1 => :platforms_macintosh,
      2 => :platforms_reserved_2,
      3 => :platforms_microsoft,
    }
    I__PLATFORMS = PLATFORMS.invert

    NAMES = {
      0 => :names_copyright,
      1 => :names_font_family,
      2 => :names_font_subfamily,
      3 => :names_unique_subfamily_id,
      4 => :names_full_font_name,
      5 => :names_name_table_version,
      6 => :names_postscript_font_name,
      7 => :names_trademark,
      8 => :names_manufacturer,
      9 => :names_designer,
      10 => :names_description,
      11 => :names_url_vendor,
      12 => :names_url_designer,
      13 => :names_license,
      14 => :names_url_license,
      15 => :names_reserved_15,
      16 => :names_preferred_family,
      17 => :names_preferred_subfamily,
      18 => :names_compatible_full_name,
      19 => :names_sample_text,
    }
    I__NAMES = NAMES.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @format_selector = @_io.read_u2be
      @num_name_records = @_io.read_u2be
      @ofs_strings = @_io.read_u2be
      @name_records = []
      (num_name_records).times { |i|
        @name_records << NameRecord.new(@_io, self, @_root)
      }
      self
    end
    class NameRecord < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @platform_id = Kaitai::Struct::Stream::resolve_enum(Ttf::Name::PLATFORMS, @_io.read_u2be)
        @encoding_id = @_io.read_u2be
        @language_id = @_io.read_u2be
        @name_id = Kaitai::Struct::Stream::resolve_enum(Ttf::Name::NAMES, @_io.read_u2be)
        @len_str = @_io.read_u2be
        @ofs_str = @_io.read_u2be
        self
      end
      def ascii_value
        return @ascii_value unless @ascii_value.nil?
        io = _parent._io
        _pos = io.pos
        io.seek((_parent.ofs_strings + ofs_str))
        @ascii_value = (io.read_bytes(len_str)).force_encoding("ascii")
        io.seek(_pos)
        @ascii_value
      end
      def unicode_value
        return @unicode_value unless @unicode_value.nil?
        io = _parent._io
        _pos = io.pos
        io.seek((_parent.ofs_strings + ofs_str))
        @unicode_value = (io.read_bytes(len_str)).force_encoding("utf-16be")
        io.seek(_pos)
        @unicode_value
      end
      attr_reader :platform_id
      attr_reader :encoding_id
      attr_reader :language_id
      attr_reader :name_id
      attr_reader :len_str
      attr_reader :ofs_str
    end
    attr_reader :format_selector
    attr_reader :num_name_records
    attr_reader :ofs_strings
    attr_reader :name_records
  end
  class Head < Kaitai::Struct::Struct

    FLAGS = {
      1 => :flags_baseline_at_y0,
      2 => :flags_left_sidebearing_at_x0,
      4 => :flags_flag_depend_on_point_size,
      8 => :flags_flag_force_ppem,
      16 => :flags_flag_may_advance_width,
    }
    I__FLAGS = FLAGS.invert

    FONT_DIRECTION_HINT = {
      0 => :font_direction_hint_fully_mixed_directional_glyphs,
      1 => :font_direction_hint_only_strongly_left_to_right,
      2 => :font_direction_hint_strongly_left_to_right_and_neutrals,
    }
    I__FONT_DIRECTION_HINT = FONT_DIRECTION_HINT.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @version = Fixed.new(@_io, self, @_root)
      @font_revision = Fixed.new(@_io, self, @_root)
      @checksum_adjustment = @_io.read_u4be
      @magic_number = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([95, 15, 60, 245].pack('C*'), magic_number, _io, "/types/head/seq/3") if not magic_number == [95, 15, 60, 245].pack('C*')
      @flags = Kaitai::Struct::Stream::resolve_enum(FLAGS, @_io.read_u2be)
      @units_per_em = @_io.read_u2be
      @created = @_io.read_u8be
      @modified = @_io.read_u8be
      @x_min = @_io.read_s2be
      @y_min = @_io.read_s2be
      @x_max = @_io.read_s2be
      @y_max = @_io.read_s2be
      @mac_style = @_io.read_u2be
      @lowest_rec_ppem = @_io.read_u2be
      @font_direction_hint = Kaitai::Struct::Stream::resolve_enum(FONT_DIRECTION_HINT, @_io.read_s2be)
      @index_to_loc_format = @_io.read_s2be
      @glyph_data_format = @_io.read_s2be
      self
    end
    attr_reader :version
    attr_reader :font_revision
    attr_reader :checksum_adjustment
    attr_reader :magic_number
    attr_reader :flags
    attr_reader :units_per_em
    attr_reader :created
    attr_reader :modified
    attr_reader :x_min
    attr_reader :y_min
    attr_reader :x_max
    attr_reader :y_max
    attr_reader :mac_style
    attr_reader :lowest_rec_ppem
    attr_reader :font_direction_hint
    attr_reader :index_to_loc_format
    attr_reader :glyph_data_format
  end
  class Prep < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @instructions = @_io.read_bytes_full
      self
    end
    attr_reader :instructions
  end
  class Hhea < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @version = Fixed.new(@_io, self, @_root)
      @ascender = @_io.read_s2be
      @descender = @_io.read_s2be
      @line_gap = @_io.read_s2be
      @advance_width_max = @_io.read_u2be
      @min_left_side_bearing = @_io.read_s2be
      @min_right_side_bearing = @_io.read_s2be
      @x_max_extend = @_io.read_s2be
      @caret_slope_rise = @_io.read_s2be
      @caret_slope_run = @_io.read_s2be
      @reserved = @_io.read_bytes(10)
      raise Kaitai::Struct::ValidationNotEqualError.new([0, 0, 0, 0, 0, 0, 0, 0, 0, 0].pack('C*'), reserved, _io, "/types/hhea/seq/10") if not reserved == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0].pack('C*')
      @metric_data_format = @_io.read_s2be
      @number_of_hmetrics = @_io.read_u2be
      self
    end
    attr_reader :version

    ##
    # Typographic ascent
    attr_reader :ascender

    ##
    # Typographic descent
    attr_reader :descender

    ##
    # Typographic line gap. Negative LineGap values are treated as zero in Windows 3.1, System 6, and System 7.
    attr_reader :line_gap

    ##
    # Maximum advance width value in `hmtx` table.
    attr_reader :advance_width_max

    ##
    # Minimum left sidebearing value in `hmtx` table.
    attr_reader :min_left_side_bearing

    ##
    # Minimum right sidebearing value; calculated as Min(aw - lsb - (xMax - xMin)).
    attr_reader :min_right_side_bearing

    ##
    # Max(lsb + (xMax - xMin)).
    attr_reader :x_max_extend
    attr_reader :caret_slope_rise
    attr_reader :caret_slope_run
    attr_reader :reserved
    attr_reader :metric_data_format
    attr_reader :number_of_hmetrics
  end
  class Fpgm < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @instructions = @_io.read_bytes_full
      self
    end
    attr_reader :instructions
  end
  class Kern < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @version = @_io.read_u2be
      @subtable_count = @_io.read_u2be
      @subtables = []
      (subtable_count).times { |i|
        @subtables << Subtable.new(@_io, self, @_root)
      }
      self
    end
    class Subtable < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @version = @_io.read_u2be
        @length = @_io.read_u2be
        @format = @_io.read_u1
        @reserved = @_io.read_bits_int_be(4)
        @is_override = @_io.read_bits_int_be(1) != 0
        @is_cross_stream = @_io.read_bits_int_be(1) != 0
        @is_minimum = @_io.read_bits_int_be(1) != 0
        @is_horizontal = @_io.read_bits_int_be(1) != 0
        @_io.align_to_byte
        if format == 0
          @format0 = Format0.new(@_io, self, @_root)
        end
        self
      end
      class Format0 < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @pair_count = @_io.read_u2be
          @search_range = @_io.read_u2be
          @entry_selector = @_io.read_u2be
          @range_shift = @_io.read_u2be
          @kerning_pairs = []
          (pair_count).times { |i|
            @kerning_pairs << KerningPair.new(@_io, self, @_root)
          }
          self
        end
        class KerningPair < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @left = @_io.read_u2be
            @right = @_io.read_u2be
            @value = @_io.read_s2be
            self
          end
          attr_reader :left
          attr_reader :right
          attr_reader :value
        end
        attr_reader :pair_count
        attr_reader :search_range
        attr_reader :entry_selector
        attr_reader :range_shift
        attr_reader :kerning_pairs
      end
      attr_reader :version
      attr_reader :length
      attr_reader :format
      attr_reader :reserved
      attr_reader :is_override
      attr_reader :is_cross_stream
      attr_reader :is_minimum
      attr_reader :is_horizontal
      attr_reader :format0
    end
    attr_reader :version
    attr_reader :subtable_count
    attr_reader :subtables
  end
  class DirTableEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @tag = (@_io.read_bytes(4)).force_encoding("ascii")
      @checksum = @_io.read_u4be
      @offset = @_io.read_u4be
      @length = @_io.read_u4be
      self
    end
    def value
      return @value unless @value.nil?
      io = _root._io
      _pos = io.pos
      io.seek(offset)
      case tag
      when "head"
        @_raw_value = io.read_bytes(length)
        _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
        @value = Head.new(_io__raw_value, self, @_root)
      when "cvt "
        @_raw_value = io.read_bytes(length)
        _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
        @value = Cvt.new(_io__raw_value, self, @_root)
      when "prep"
        @_raw_value = io.read_bytes(length)
        _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
        @value = Prep.new(_io__raw_value, self, @_root)
      when "kern"
        @_raw_value = io.read_bytes(length)
        _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
        @value = Kern.new(_io__raw_value, self, @_root)
      when "hhea"
        @_raw_value = io.read_bytes(length)
        _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
        @value = Hhea.new(_io__raw_value, self, @_root)
      when "post"
        @_raw_value = io.read_bytes(length)
        _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
        @value = Post.new(_io__raw_value, self, @_root)
      when "OS/2"
        @_raw_value = io.read_bytes(length)
        _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
        @value = Os2.new(_io__raw_value, self, @_root)
      when "name"
        @_raw_value = io.read_bytes(length)
        _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
        @value = Name.new(_io__raw_value, self, @_root)
      when "maxp"
        @_raw_value = io.read_bytes(length)
        _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
        @value = Maxp.new(_io__raw_value, self, @_root)
      when "glyf"
        @_raw_value = io.read_bytes(length)
        _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
        @value = Glyf.new(_io__raw_value, self, @_root)
      when "fpgm"
        @_raw_value = io.read_bytes(length)
        _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
        @value = Fpgm.new(_io__raw_value, self, @_root)
      when "cmap"
        @_raw_value = io.read_bytes(length)
        _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
        @value = Cmap.new(_io__raw_value, self, @_root)
      else
        @value = io.read_bytes(length)
      end
      io.seek(_pos)
      @value
    end
    attr_reader :tag
    attr_reader :checksum
    attr_reader :offset
    attr_reader :length
    attr_reader :_raw_value
  end

  ##
  # The OS/2 table consists of a set of metrics that are required by Windows and OS/2.
  class Os2 < Kaitai::Struct::Struct

    WEIGHT_CLASS = {
      100 => :weight_class_thin,
      200 => :weight_class_extra_light,
      300 => :weight_class_light,
      400 => :weight_class_normal,
      500 => :weight_class_medium,
      600 => :weight_class_semi_bold,
      700 => :weight_class_bold,
      800 => :weight_class_extra_bold,
      900 => :weight_class_black,
    }
    I__WEIGHT_CLASS = WEIGHT_CLASS.invert

    WIDTH_CLASS = {
      1 => :width_class_ultra_condensed,
      2 => :width_class_extra_condensed,
      3 => :width_class_condensed,
      4 => :width_class_semi_condensed,
      5 => :width_class_normal,
      6 => :width_class_semi_expanded,
      7 => :width_class_expanded,
      8 => :width_class_extra_expanded,
      9 => :width_class_ultra_expanded,
    }
    I__WIDTH_CLASS = WIDTH_CLASS.invert

    FS_TYPE = {
      2 => :fs_type_restricted_license_embedding,
      4 => :fs_type_preview_and_print_embedding,
      8 => :fs_type_editable_embedding,
    }
    I__FS_TYPE = FS_TYPE.invert

    FS_SELECTION = {
      1 => :fs_selection_italic,
      2 => :fs_selection_underscore,
      4 => :fs_selection_negative,
      8 => :fs_selection_outlined,
      16 => :fs_selection_strikeout,
      32 => :fs_selection_bold,
      64 => :fs_selection_regular,
    }
    I__FS_SELECTION = FS_SELECTION.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @version = @_io.read_u2be
      @x_avg_char_width = @_io.read_s2be
      @weight_class = Kaitai::Struct::Stream::resolve_enum(WEIGHT_CLASS, @_io.read_u2be)
      @width_class = Kaitai::Struct::Stream::resolve_enum(WIDTH_CLASS, @_io.read_u2be)
      @fs_type = Kaitai::Struct::Stream::resolve_enum(FS_TYPE, @_io.read_s2be)
      @y_subscript_x_size = @_io.read_s2be
      @y_subscript_y_size = @_io.read_s2be
      @y_subscript_x_offset = @_io.read_s2be
      @y_subscript_y_offset = @_io.read_s2be
      @y_superscript_x_size = @_io.read_s2be
      @y_superscript_y_size = @_io.read_s2be
      @y_superscript_x_offset = @_io.read_s2be
      @y_superscript_y_offset = @_io.read_s2be
      @y_strikeout_size = @_io.read_s2be
      @y_strikeout_position = @_io.read_s2be
      @s_family_class = @_io.read_s2be
      @panose = Panose.new(@_io, self, @_root)
      @unicode_range = UnicodeRange.new(@_io, self, @_root)
      @ach_vend_id = (@_io.read_bytes(4)).force_encoding("ascii")
      @selection = Kaitai::Struct::Stream::resolve_enum(FS_SELECTION, @_io.read_u2be)
      @first_char_index = @_io.read_u2be
      @last_char_index = @_io.read_u2be
      @typo_ascender = @_io.read_s2be
      @typo_descender = @_io.read_s2be
      @typo_line_gap = @_io.read_s2be
      @win_ascent = @_io.read_u2be
      @win_descent = @_io.read_u2be
      @code_page_range = CodePageRange.new(@_io, self, @_root)
      self
    end
    class Panose < Kaitai::Struct::Struct

      WEIGHT = {
        0 => :weight_any,
        1 => :weight_no_fit,
        2 => :weight_very_light,
        3 => :weight_light,
        4 => :weight_thin,
        5 => :weight_book,
        6 => :weight_medium,
        7 => :weight_demi,
        8 => :weight_bold,
        9 => :weight_heavy,
        10 => :weight_black,
        11 => :weight_nord,
      }
      I__WEIGHT = WEIGHT.invert

      PROPORTION = {
        0 => :proportion_any,
        1 => :proportion_no_fit,
        2 => :proportion_old_style,
        3 => :proportion_modern,
        4 => :proportion_even_width,
        5 => :proportion_expanded,
        6 => :proportion_condensed,
        7 => :proportion_very_expanded,
        8 => :proportion_very_condensed,
        9 => :proportion_monospaced,
      }
      I__PROPORTION = PROPORTION.invert

      FAMILY_KIND = {
        0 => :family_kind_any,
        1 => :family_kind_no_fit,
        2 => :family_kind_text_and_display,
        3 => :family_kind_script,
        4 => :family_kind_decorative,
        5 => :family_kind_pictorial,
      }
      I__FAMILY_KIND = FAMILY_KIND.invert

      LETTER_FORM = {
        0 => :letter_form_any,
        1 => :letter_form_no_fit,
        2 => :letter_form_normal_contact,
        3 => :letter_form_normal_weighted,
        4 => :letter_form_normal_boxed,
        5 => :letter_form_normal_flattened,
        6 => :letter_form_normal_rounded,
        7 => :letter_form_normal_off_center,
        8 => :letter_form_normal_square,
        9 => :letter_form_oblique_contact,
        10 => :letter_form_oblique_weighted,
        11 => :letter_form_oblique_boxed,
        12 => :letter_form_oblique_flattened,
        13 => :letter_form_oblique_rounded,
        14 => :letter_form_oblique_off_center,
        15 => :letter_form_oblique_square,
      }
      I__LETTER_FORM = LETTER_FORM.invert

      SERIF_STYLE = {
        0 => :serif_style_any,
        1 => :serif_style_no_fit,
        2 => :serif_style_cove,
        3 => :serif_style_obtuse_cove,
        4 => :serif_style_square_cove,
        5 => :serif_style_obtuse_square_cove,
        6 => :serif_style_square,
        7 => :serif_style_thin,
        8 => :serif_style_bone,
        9 => :serif_style_exaggerated,
        10 => :serif_style_triangle,
        11 => :serif_style_normal_sans,
        12 => :serif_style_obtuse_sans,
        13 => :serif_style_perp_sans,
        14 => :serif_style_flared,
        15 => :serif_style_rounded,
      }
      I__SERIF_STYLE = SERIF_STYLE.invert

      X_HEIGHT = {
        0 => :x_height_any,
        1 => :x_height_no_fit,
        2 => :x_height_constant_small,
        3 => :x_height_constant_standard,
        4 => :x_height_constant_large,
        5 => :x_height_ducking_small,
        6 => :x_height_ducking_standard,
        7 => :x_height_ducking_large,
      }
      I__X_HEIGHT = X_HEIGHT.invert

      ARM_STYLE = {
        0 => :arm_style_any,
        1 => :arm_style_no_fit,
        2 => :arm_style_straight_arms_horizontal,
        3 => :arm_style_straight_arms_wedge,
        4 => :arm_style_straight_arms_vertical,
        5 => :arm_style_straight_arms_single_serif,
        6 => :arm_style_straight_arms_double_serif,
        7 => :arm_style_non_straight_arms_horizontal,
        8 => :arm_style_non_straight_arms_wedge,
        9 => :arm_style_non_straight_arms_vertical,
        10 => :arm_style_non_straight_arms_single_serif,
        11 => :arm_style_non_straight_arms_double_serif,
      }
      I__ARM_STYLE = ARM_STYLE.invert

      STROKE_VARIATION = {
        0 => :stroke_variation_any,
        1 => :stroke_variation_no_fit,
        2 => :stroke_variation_gradual_diagonal,
        3 => :stroke_variation_gradual_transitional,
        4 => :stroke_variation_gradual_vertical,
        5 => :stroke_variation_gradual_horizontal,
        6 => :stroke_variation_rapid_vertical,
        7 => :stroke_variation_rapid_horizontal,
        8 => :stroke_variation_instant_vertical,
      }
      I__STROKE_VARIATION = STROKE_VARIATION.invert

      CONTRAST = {
        0 => :contrast_any,
        1 => :contrast_no_fit,
        2 => :contrast_none,
        3 => :contrast_very_low,
        4 => :contrast_low,
        5 => :contrast_medium_low,
        6 => :contrast_medium,
        7 => :contrast_medium_high,
        8 => :contrast_high,
        9 => :contrast_very_high,
      }
      I__CONTRAST = CONTRAST.invert

      MIDLINE = {
        0 => :midline_any,
        1 => :midline_no_fit,
        2 => :midline_standard_trimmed,
        3 => :midline_standard_pointed,
        4 => :midline_standard_serifed,
        5 => :midline_high_trimmed,
        6 => :midline_high_pointed,
        7 => :midline_high_serifed,
        8 => :midline_constant_trimmed,
        9 => :midline_constant_pointed,
        10 => :midline_constant_serifed,
        11 => :midline_low_trimmed,
        12 => :midline_low_pointed,
        13 => :midline_low_serifed,
      }
      I__MIDLINE = MIDLINE.invert
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @family_type = Kaitai::Struct::Stream::resolve_enum(FAMILY_KIND, @_io.read_u1)
        @serif_style = Kaitai::Struct::Stream::resolve_enum(SERIF_STYLE, @_io.read_u1)
        @weight = Kaitai::Struct::Stream::resolve_enum(WEIGHT, @_io.read_u1)
        @proportion = Kaitai::Struct::Stream::resolve_enum(PROPORTION, @_io.read_u1)
        @contrast = Kaitai::Struct::Stream::resolve_enum(CONTRAST, @_io.read_u1)
        @stroke_variation = Kaitai::Struct::Stream::resolve_enum(STROKE_VARIATION, @_io.read_u1)
        @arm_style = Kaitai::Struct::Stream::resolve_enum(ARM_STYLE, @_io.read_u1)
        @letter_form = Kaitai::Struct::Stream::resolve_enum(LETTER_FORM, @_io.read_u1)
        @midline = Kaitai::Struct::Stream::resolve_enum(MIDLINE, @_io.read_u1)
        @x_height = Kaitai::Struct::Stream::resolve_enum(X_HEIGHT, @_io.read_u1)
        self
      end
      attr_reader :family_type
      attr_reader :serif_style
      attr_reader :weight
      attr_reader :proportion
      attr_reader :contrast
      attr_reader :stroke_variation
      attr_reader :arm_style
      attr_reader :letter_form
      attr_reader :midline
      attr_reader :x_height
    end
    class UnicodeRange < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @basic_latin = @_io.read_bits_int_be(1) != 0
        @latin_1_supplement = @_io.read_bits_int_be(1) != 0
        @latin_extended_a = @_io.read_bits_int_be(1) != 0
        @latin_extended_b = @_io.read_bits_int_be(1) != 0
        @ipa_extensions = @_io.read_bits_int_be(1) != 0
        @spacing_modifier_letters = @_io.read_bits_int_be(1) != 0
        @combining_diacritical_marks = @_io.read_bits_int_be(1) != 0
        @basic_greek = @_io.read_bits_int_be(1) != 0
        @greek_symbols_and_coptic = @_io.read_bits_int_be(1) != 0
        @cyrillic = @_io.read_bits_int_be(1) != 0
        @armenian = @_io.read_bits_int_be(1) != 0
        @basic_hebrew = @_io.read_bits_int_be(1) != 0
        @hebrew_extended = @_io.read_bits_int_be(1) != 0
        @basic_arabic = @_io.read_bits_int_be(1) != 0
        @arabic_extended = @_io.read_bits_int_be(1) != 0
        @devanagari = @_io.read_bits_int_be(1) != 0
        @bengali = @_io.read_bits_int_be(1) != 0
        @gurmukhi = @_io.read_bits_int_be(1) != 0
        @gujarati = @_io.read_bits_int_be(1) != 0
        @oriya = @_io.read_bits_int_be(1) != 0
        @tamil = @_io.read_bits_int_be(1) != 0
        @telugu = @_io.read_bits_int_be(1) != 0
        @kannada = @_io.read_bits_int_be(1) != 0
        @malayalam = @_io.read_bits_int_be(1) != 0
        @thai = @_io.read_bits_int_be(1) != 0
        @lao = @_io.read_bits_int_be(1) != 0
        @basic_georgian = @_io.read_bits_int_be(1) != 0
        @georgian_extended = @_io.read_bits_int_be(1) != 0
        @hangul_jamo = @_io.read_bits_int_be(1) != 0
        @latin_extended_additional = @_io.read_bits_int_be(1) != 0
        @greek_extended = @_io.read_bits_int_be(1) != 0
        @general_punctuation = @_io.read_bits_int_be(1) != 0
        @superscripts_and_subscripts = @_io.read_bits_int_be(1) != 0
        @currency_symbols = @_io.read_bits_int_be(1) != 0
        @combining_diacritical_marks_for_symbols = @_io.read_bits_int_be(1) != 0
        @letterlike_symbols = @_io.read_bits_int_be(1) != 0
        @number_forms = @_io.read_bits_int_be(1) != 0
        @arrows = @_io.read_bits_int_be(1) != 0
        @mathematical_operators = @_io.read_bits_int_be(1) != 0
        @miscellaneous_technical = @_io.read_bits_int_be(1) != 0
        @control_pictures = @_io.read_bits_int_be(1) != 0
        @optical_character_recognition = @_io.read_bits_int_be(1) != 0
        @enclosed_alphanumerics = @_io.read_bits_int_be(1) != 0
        @box_drawing = @_io.read_bits_int_be(1) != 0
        @block_elements = @_io.read_bits_int_be(1) != 0
        @geometric_shapes = @_io.read_bits_int_be(1) != 0
        @miscellaneous_symbols = @_io.read_bits_int_be(1) != 0
        @dingbats = @_io.read_bits_int_be(1) != 0
        @cjk_symbols_and_punctuation = @_io.read_bits_int_be(1) != 0
        @hiragana = @_io.read_bits_int_be(1) != 0
        @katakana = @_io.read_bits_int_be(1) != 0
        @bopomofo = @_io.read_bits_int_be(1) != 0
        @hangul_compatibility_jamo = @_io.read_bits_int_be(1) != 0
        @cjk_miscellaneous = @_io.read_bits_int_be(1) != 0
        @enclosed_cjk_letters_and_months = @_io.read_bits_int_be(1) != 0
        @cjk_compatibility = @_io.read_bits_int_be(1) != 0
        @hangul = @_io.read_bits_int_be(1) != 0
        @reserved_for_unicode_subranges1 = @_io.read_bits_int_be(1) != 0
        @reserved_for_unicode_subranges2 = @_io.read_bits_int_be(1) != 0
        @cjk_unified_ideographs = @_io.read_bits_int_be(1) != 0
        @private_use_area = @_io.read_bits_int_be(1) != 0
        @cjk_compatibility_ideographs = @_io.read_bits_int_be(1) != 0
        @alphabetic_presentation_forms = @_io.read_bits_int_be(1) != 0
        @arabic_presentation_forms_a = @_io.read_bits_int_be(1) != 0
        @combining_half_marks = @_io.read_bits_int_be(1) != 0
        @cjk_compatibility_forms = @_io.read_bits_int_be(1) != 0
        @small_form_variants = @_io.read_bits_int_be(1) != 0
        @arabic_presentation_forms_b = @_io.read_bits_int_be(1) != 0
        @halfwidth_and_fullwidth_forms = @_io.read_bits_int_be(1) != 0
        @specials = @_io.read_bits_int_be(1) != 0
        @_io.align_to_byte
        @reserved = @_io.read_bytes(7)
        self
      end
      attr_reader :basic_latin
      attr_reader :latin_1_supplement
      attr_reader :latin_extended_a
      attr_reader :latin_extended_b
      attr_reader :ipa_extensions
      attr_reader :spacing_modifier_letters
      attr_reader :combining_diacritical_marks
      attr_reader :basic_greek
      attr_reader :greek_symbols_and_coptic
      attr_reader :cyrillic
      attr_reader :armenian
      attr_reader :basic_hebrew
      attr_reader :hebrew_extended
      attr_reader :basic_arabic
      attr_reader :arabic_extended
      attr_reader :devanagari
      attr_reader :bengali
      attr_reader :gurmukhi
      attr_reader :gujarati
      attr_reader :oriya
      attr_reader :tamil
      attr_reader :telugu
      attr_reader :kannada
      attr_reader :malayalam
      attr_reader :thai
      attr_reader :lao
      attr_reader :basic_georgian
      attr_reader :georgian_extended
      attr_reader :hangul_jamo
      attr_reader :latin_extended_additional
      attr_reader :greek_extended
      attr_reader :general_punctuation
      attr_reader :superscripts_and_subscripts
      attr_reader :currency_symbols
      attr_reader :combining_diacritical_marks_for_symbols
      attr_reader :letterlike_symbols
      attr_reader :number_forms
      attr_reader :arrows
      attr_reader :mathematical_operators
      attr_reader :miscellaneous_technical
      attr_reader :control_pictures
      attr_reader :optical_character_recognition
      attr_reader :enclosed_alphanumerics
      attr_reader :box_drawing
      attr_reader :block_elements
      attr_reader :geometric_shapes
      attr_reader :miscellaneous_symbols
      attr_reader :dingbats
      attr_reader :cjk_symbols_and_punctuation
      attr_reader :hiragana
      attr_reader :katakana
      attr_reader :bopomofo
      attr_reader :hangul_compatibility_jamo
      attr_reader :cjk_miscellaneous
      attr_reader :enclosed_cjk_letters_and_months
      attr_reader :cjk_compatibility
      attr_reader :hangul
      attr_reader :reserved_for_unicode_subranges1
      attr_reader :reserved_for_unicode_subranges2
      attr_reader :cjk_unified_ideographs
      attr_reader :private_use_area
      attr_reader :cjk_compatibility_ideographs
      attr_reader :alphabetic_presentation_forms
      attr_reader :arabic_presentation_forms_a
      attr_reader :combining_half_marks
      attr_reader :cjk_compatibility_forms
      attr_reader :small_form_variants
      attr_reader :arabic_presentation_forms_b
      attr_reader :halfwidth_and_fullwidth_forms
      attr_reader :specials
      attr_reader :reserved
    end
    class CodePageRange < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @symbol_character_set = @_io.read_bits_int_be(1) != 0
        @oem_character_set = @_io.read_bits_int_be(1) != 0
        @macintosh_character_set = @_io.read_bits_int_be(1) != 0
        @reserved_for_alternate_ansi_oem = @_io.read_bits_int_be(7)
        @cp1361_korean_johab = @_io.read_bits_int_be(1) != 0
        @cp950_chinese_traditional_chars_taiwan_and_hong_kong = @_io.read_bits_int_be(1) != 0
        @cp949_korean_wansung = @_io.read_bits_int_be(1) != 0
        @cp936_chinese_simplified_chars_prc_and_singapore = @_io.read_bits_int_be(1) != 0
        @cp932_jis_japan = @_io.read_bits_int_be(1) != 0
        @cp874_thai = @_io.read_bits_int_be(1) != 0
        @reserved_for_alternate_ansi = @_io.read_bits_int_be(8)
        @cp1257_windows_baltic = @_io.read_bits_int_be(1) != 0
        @cp1256_arabic = @_io.read_bits_int_be(1) != 0
        @cp1255_hebrew = @_io.read_bits_int_be(1) != 0
        @cp1254_turkish = @_io.read_bits_int_be(1) != 0
        @cp1253_greek = @_io.read_bits_int_be(1) != 0
        @cp1251_cyrillic = @_io.read_bits_int_be(1) != 0
        @cp1250_latin_2_eastern_europe = @_io.read_bits_int_be(1) != 0
        @cp1252_latin_1 = @_io.read_bits_int_be(1) != 0
        @cp437_us = @_io.read_bits_int_be(1) != 0
        @cp850_we_latin_1 = @_io.read_bits_int_be(1) != 0
        @cp708_arabic_asmo_708 = @_io.read_bits_int_be(1) != 0
        @cp737_greek_former_437_g = @_io.read_bits_int_be(1) != 0
        @cp775_ms_dos_baltic = @_io.read_bits_int_be(1) != 0
        @cp852_latin_2 = @_io.read_bits_int_be(1) != 0
        @cp855_ibm_cyrillic_primarily_russian = @_io.read_bits_int_be(1) != 0
        @cp857_ibm_turkish = @_io.read_bits_int_be(1) != 0
        @cp860_ms_dos_portuguese = @_io.read_bits_int_be(1) != 0
        @cp861_ms_dos_icelandic = @_io.read_bits_int_be(1) != 0
        @cp862_hebrew = @_io.read_bits_int_be(1) != 0
        @cp863_ms_dos_canadian_french = @_io.read_bits_int_be(1) != 0
        @cp864_arabic = @_io.read_bits_int_be(1) != 0
        @cp865_ms_dos_nordic = @_io.read_bits_int_be(1) != 0
        @cp866_ms_dos_russian = @_io.read_bits_int_be(1) != 0
        @cp869_ibm_greek = @_io.read_bits_int_be(1) != 0
        @reserved_for_oem = @_io.read_bits_int_be(16)
        self
      end
      attr_reader :symbol_character_set
      attr_reader :oem_character_set
      attr_reader :macintosh_character_set
      attr_reader :reserved_for_alternate_ansi_oem
      attr_reader :cp1361_korean_johab
      attr_reader :cp950_chinese_traditional_chars_taiwan_and_hong_kong
      attr_reader :cp949_korean_wansung
      attr_reader :cp936_chinese_simplified_chars_prc_and_singapore
      attr_reader :cp932_jis_japan
      attr_reader :cp874_thai
      attr_reader :reserved_for_alternate_ansi
      attr_reader :cp1257_windows_baltic
      attr_reader :cp1256_arabic
      attr_reader :cp1255_hebrew
      attr_reader :cp1254_turkish
      attr_reader :cp1253_greek
      attr_reader :cp1251_cyrillic
      attr_reader :cp1250_latin_2_eastern_europe
      attr_reader :cp1252_latin_1
      attr_reader :cp437_us
      attr_reader :cp850_we_latin_1
      attr_reader :cp708_arabic_asmo_708
      attr_reader :cp737_greek_former_437_g
      attr_reader :cp775_ms_dos_baltic
      attr_reader :cp852_latin_2
      attr_reader :cp855_ibm_cyrillic_primarily_russian
      attr_reader :cp857_ibm_turkish
      attr_reader :cp860_ms_dos_portuguese
      attr_reader :cp861_ms_dos_icelandic
      attr_reader :cp862_hebrew
      attr_reader :cp863_ms_dos_canadian_french
      attr_reader :cp864_arabic
      attr_reader :cp865_ms_dos_nordic
      attr_reader :cp866_ms_dos_russian
      attr_reader :cp869_ibm_greek
      attr_reader :reserved_for_oem
    end

    ##
    # The version number for this OS/2 table.
    attr_reader :version

    ##
    # The Average Character Width parameter specifies the arithmetic average of the escapement (width) of all of the 26 lowercase letters a through z of the Latin alphabet and the space character. If any of the 26 lowercase letters are not present, this parameter should equal the weighted average of all glyphs in the font. For non-UGL (platform 3, encoding 0) fonts, use the unweighted average.
    attr_reader :x_avg_char_width

    ##
    # Indicates the visual weight (degree of blackness or thickness of strokes) of the characters in the font.
    attr_reader :weight_class

    ##
    # Indicates a relative change from the normal aspect ratio (width to height ratio) as specified by a font designer for the glyphs in a font.
    attr_reader :width_class

    ##
    # Indicates font embedding licensing rights for the font. Embeddable fonts may be stored in a document. When a document with embedded fonts is opened on a system that does not have the font installed (the remote system), the embedded font may be loaded for temporary (and in some cases, permanent) use on that system by an embedding-aware application. Embedding licensing rights are granted by the vendor of the font.
    attr_reader :fs_type

    ##
    # The recommended horizontal size in font design units for subscripts for this font.
    attr_reader :y_subscript_x_size

    ##
    # The recommended vertical size in font design units for subscripts for this font.
    attr_reader :y_subscript_y_size

    ##
    # The recommended horizontal offset in font design untis for subscripts for this font.
    attr_reader :y_subscript_x_offset

    ##
    # The recommended vertical offset in font design units from the baseline for subscripts for this font.
    attr_reader :y_subscript_y_offset

    ##
    # The recommended horizontal size in font design units for superscripts for this font.
    attr_reader :y_superscript_x_size

    ##
    # The recommended vertical size in font design units for superscripts for this font.
    attr_reader :y_superscript_y_size

    ##
    # The recommended horizontal offset in font design units for superscripts for this font.
    attr_reader :y_superscript_x_offset

    ##
    # The recommended vertical offset in font design units from the baseline for superscripts for this font.
    attr_reader :y_superscript_y_offset

    ##
    # Width of the strikeout stroke in font design units.
    attr_reader :y_strikeout_size

    ##
    # The position of the strikeout stroke relative to the baseline in font design units.
    attr_reader :y_strikeout_position

    ##
    # This parameter is a classification of font-family design.
    attr_reader :s_family_class
    attr_reader :panose
    attr_reader :unicode_range

    ##
    # The four character identifier for the vendor of the given type face.
    attr_reader :ach_vend_id

    ##
    # Contains information concerning the nature of the font patterns
    attr_reader :selection

    ##
    # The minimum Unicode index (character code) in this font, according to the cmap subtable for platform ID 3 and encoding ID 0 or 1.
    attr_reader :first_char_index

    ##
    # The maximum Unicode index (character code) in this font, according to the cmap subtable for platform ID 3 and encoding ID 0 or 1.
    attr_reader :last_char_index

    ##
    # The typographic ascender for this font.
    attr_reader :typo_ascender

    ##
    # The typographic descender for this font.
    attr_reader :typo_descender

    ##
    # The typographic line gap for this font.
    attr_reader :typo_line_gap

    ##
    # The ascender metric for Windows.
    attr_reader :win_ascent

    ##
    # The descender metric for Windows.
    attr_reader :win_descent

    ##
    # This field is used to specify the code pages encompassed by the font file in the `cmap` subtable for platform 3, encoding ID 1 (Microsoft platform).
    attr_reader :code_page_range
  end
  class Fixed < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @major = @_io.read_u2be
      @minor = @_io.read_u2be
      self
    end
    attr_reader :major
    attr_reader :minor
  end
  class Glyf < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @number_of_contours = @_io.read_s2be
      @x_min = @_io.read_s2be
      @y_min = @_io.read_s2be
      @x_max = @_io.read_s2be
      @y_max = @_io.read_s2be
      if number_of_contours > 0
        @value = SimpleGlyph.new(@_io, self, @_root)
      end
      self
    end
    class SimpleGlyph < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @end_pts_of_contours = []
        (_parent.number_of_contours).times { |i|
          @end_pts_of_contours << @_io.read_u2be
        }
        @instruction_length = @_io.read_u2be
        @instructions = @_io.read_bytes(instruction_length)
        @flags = []
        (point_count).times { |i|
          @flags << Flag.new(@_io, self, @_root)
        }
        self
      end
      class Flag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.read_bits_int_be(2)
          @y_is_same = @_io.read_bits_int_be(1) != 0
          @x_is_same = @_io.read_bits_int_be(1) != 0
          @repeat = @_io.read_bits_int_be(1) != 0
          @y_short_vector = @_io.read_bits_int_be(1) != 0
          @x_short_vector = @_io.read_bits_int_be(1) != 0
          @on_curve = @_io.read_bits_int_be(1) != 0
          @_io.align_to_byte
          if repeat
            @repeat_value = @_io.read_u1
          end
          self
        end
        attr_reader :reserved
        attr_reader :y_is_same
        attr_reader :x_is_same
        attr_reader :repeat
        attr_reader :y_short_vector
        attr_reader :x_short_vector
        attr_reader :on_curve
        attr_reader :repeat_value
      end
      def point_count
        return @point_count unless @point_count.nil?
        @point_count = (end_pts_of_contours.max + 1)
        @point_count
      end
      attr_reader :end_pts_of_contours
      attr_reader :instruction_length
      attr_reader :instructions
      attr_reader :flags
    end
    attr_reader :number_of_contours
    attr_reader :x_min
    attr_reader :y_min
    attr_reader :x_max
    attr_reader :y_max
    attr_reader :value
  end

  ##
  # cvt  - Control Value Table This table contains a list of values that can be referenced by instructions. They can be used, among other things, to control characteristics for different glyphs.
  class Cvt < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @fwords = []
      i = 0
      while not @_io.eof?
        @fwords << @_io.read_s2be
        i += 1
      end
      self
    end
    attr_reader :fwords
  end
  class Maxp < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @table_version_number = Fixed.new(@_io, self, @_root)
      @num_glyphs = @_io.read_u2be
      if is_version10
        @version10_body = MaxpVersion10Body.new(@_io, self, @_root)
      end
      self
    end
    def is_version10
      return @is_version10 unless @is_version10.nil?
      @is_version10 =  ((table_version_number.major == 1) && (table_version_number.minor == 0)) 
      @is_version10
    end

    ##
    # 0x00010000 for version 1.0.
    attr_reader :table_version_number

    ##
    # The number of glyphs in the font.
    attr_reader :num_glyphs
    attr_reader :version10_body
  end
  class MaxpVersion10Body < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @max_points = @_io.read_u2be
      @max_contours = @_io.read_u2be
      @max_composite_points = @_io.read_u2be
      @max_composite_contours = @_io.read_u2be
      @max_zones = @_io.read_u2be
      @max_twilight_points = @_io.read_u2be
      @max_storage = @_io.read_u2be
      @max_function_defs = @_io.read_u2be
      @max_instruction_defs = @_io.read_u2be
      @max_stack_elements = @_io.read_u2be
      @max_size_of_instructions = @_io.read_u2be
      @max_component_elements = @_io.read_u2be
      @max_component_depth = @_io.read_u2be
      self
    end

    ##
    # Maximum points in a non-composite glyph.
    attr_reader :max_points

    ##
    # Maximum contours in a non-composite glyph.
    attr_reader :max_contours

    ##
    # Maximum points in a composite glyph.
    attr_reader :max_composite_points

    ##
    # Maximum contours in a composite glyph.
    attr_reader :max_composite_contours

    ##
    # 1 if instructions do not use the twilight zone (Z0), or 2 if instructions do use Z0; should be set to 2 in most cases.
    attr_reader :max_zones

    ##
    # Maximum points used in Z0.
    attr_reader :max_twilight_points

    ##
    # Number of Storage Area locations.
    attr_reader :max_storage

    ##
    # Number of FDEFs.
    attr_reader :max_function_defs

    ##
    # Number of IDEFs.
    attr_reader :max_instruction_defs

    ##
    # Maximum stack depth.
    attr_reader :max_stack_elements

    ##
    # Maximum byte count for glyph instructions.
    attr_reader :max_size_of_instructions

    ##
    # Maximum number of components referenced at "top level" for any composite glyph.
    attr_reader :max_component_elements

    ##
    # Maximum levels of recursion; 1 for simple components.
    attr_reader :max_component_depth
  end
  class OffsetTable < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @sfnt_version = Fixed.new(@_io, self, @_root)
      @num_tables = @_io.read_u2be
      @search_range = @_io.read_u2be
      @entry_selector = @_io.read_u2be
      @range_shift = @_io.read_u2be
      self
    end
    attr_reader :sfnt_version
    attr_reader :num_tables
    attr_reader :search_range
    attr_reader :entry_selector
    attr_reader :range_shift
  end

  ##
  # cmap - Character To Glyph Index Mapping Table This table defines the mapping of character codes to the glyph index values used in the font.
  class Cmap < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @version_number = @_io.read_u2be
      @number_of_encoding_tables = @_io.read_u2be
      @tables = []
      (number_of_encoding_tables).times { |i|
        @tables << SubtableHeader.new(@_io, self, @_root)
      }
      self
    end
    class SubtableHeader < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @platform_id = @_io.read_u2be
        @encoding_id = @_io.read_u2be
        @subtable_offset = @_io.read_u4be
        self
      end
      def table
        return @table unless @table.nil?
        io = _parent._io
        _pos = io.pos
        io.seek(subtable_offset)
        @table = Subtable.new(io, self, @_root)
        io.seek(_pos)
        @table
      end
      attr_reader :platform_id
      attr_reader :encoding_id
      attr_reader :subtable_offset
    end
    class Subtable < Kaitai::Struct::Struct

      SUBTABLE_FORMAT = {
        0 => :subtable_format_byte_encoding_table,
        2 => :subtable_format_high_byte_mapping_through_table,
        4 => :subtable_format_segment_mapping_to_delta_values,
        6 => :subtable_format_trimmed_table_mapping,
      }
      I__SUBTABLE_FORMAT = SUBTABLE_FORMAT.invert
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @format = Kaitai::Struct::Stream::resolve_enum(SUBTABLE_FORMAT, @_io.read_u2be)
        @length = @_io.read_u2be
        @version = @_io.read_u2be
        case format
        when :subtable_format_byte_encoding_table
          @_raw_value = @_io.read_bytes((length - 6))
          _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
          @value = ByteEncodingTable.new(_io__raw_value, self, @_root)
        when :subtable_format_segment_mapping_to_delta_values
          @_raw_value = @_io.read_bytes((length - 6))
          _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
          @value = SegmentMappingToDeltaValues.new(_io__raw_value, self, @_root)
        when :subtable_format_high_byte_mapping_through_table
          @_raw_value = @_io.read_bytes((length - 6))
          _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
          @value = HighByteMappingThroughTable.new(_io__raw_value, self, @_root)
        when :subtable_format_trimmed_table_mapping
          @_raw_value = @_io.read_bytes((length - 6))
          _io__raw_value = Kaitai::Struct::Stream.new(@_raw_value)
          @value = TrimmedTableMapping.new(_io__raw_value, self, @_root)
        else
          @value = @_io.read_bytes((length - 6))
        end
        self
      end
      class ByteEncodingTable < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @glyph_id_array = @_io.read_bytes(256)
          self
        end
        attr_reader :glyph_id_array
      end
      class HighByteMappingThroughTable < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @sub_header_keys = []
          (256).times { |i|
            @sub_header_keys << @_io.read_u2be
          }
          self
        end
        attr_reader :sub_header_keys
      end
      class SegmentMappingToDeltaValues < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @seg_count_x2 = @_io.read_u2be
          @search_range = @_io.read_u2be
          @entry_selector = @_io.read_u2be
          @range_shift = @_io.read_u2be
          @end_count = []
          (seg_count).times { |i|
            @end_count << @_io.read_u2be
          }
          @reserved_pad = @_io.read_u2be
          @start_count = []
          (seg_count).times { |i|
            @start_count << @_io.read_u2be
          }
          @id_delta = []
          (seg_count).times { |i|
            @id_delta << @_io.read_u2be
          }
          @id_range_offset = []
          (seg_count).times { |i|
            @id_range_offset << @_io.read_u2be
          }
          @glyph_id_array = []
          i = 0
          while not @_io.eof?
            @glyph_id_array << @_io.read_u2be
            i += 1
          end
          self
        end
        def seg_count
          return @seg_count unless @seg_count.nil?
          @seg_count = (seg_count_x2 / 2)
          @seg_count
        end
        attr_reader :seg_count_x2
        attr_reader :search_range
        attr_reader :entry_selector
        attr_reader :range_shift
        attr_reader :end_count
        attr_reader :reserved_pad
        attr_reader :start_count
        attr_reader :id_delta
        attr_reader :id_range_offset
        attr_reader :glyph_id_array
      end
      class TrimmedTableMapping < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @first_code = @_io.read_u2be
          @entry_count = @_io.read_u2be
          @glyph_id_array = []
          (entry_count).times { |i|
            @glyph_id_array << @_io.read_u2be
          }
          self
        end
        attr_reader :first_code
        attr_reader :entry_count
        attr_reader :glyph_id_array
      end
      attr_reader :format
      attr_reader :length
      attr_reader :version
      attr_reader :value
      attr_reader :_raw_value
    end
    attr_reader :version_number
    attr_reader :number_of_encoding_tables
    attr_reader :tables
  end
  attr_reader :offset_table
  attr_reader :directory_table
end

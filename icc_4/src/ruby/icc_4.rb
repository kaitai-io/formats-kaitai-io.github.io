# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Icc4 < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @header = ProfileHeader.new(@_io, self, @_root)
    @tag_table = TagTable.new(@_io, self, @_root)
    self
  end
  class U8Fixed8Number < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @number = @_io.read_bytes(2)
      self
    end
    attr_reader :number
  end
  class U16Fixed16Number < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @number = @_io.read_bytes(4)
      self
    end
    attr_reader :number
  end
  class StandardIlluminantEncoding < Kaitai::Struct::Struct

    STANDARD_ILLUMINANT_ENCODINGS = {
      0 => :standard_illuminant_encodings_unknown,
      1 => :standard_illuminant_encodings_d50,
      2 => :standard_illuminant_encodings_d65,
      3 => :standard_illuminant_encodings_d93,
      4 => :standard_illuminant_encodings_f2,
      5 => :standard_illuminant_encodings_d55,
      6 => :standard_illuminant_encodings_a,
      7 => :standard_illuminant_encodings_equi_power,
      8 => :standard_illuminant_encodings_f8,
    }
    I__STANDARD_ILLUMINANT_ENCODINGS = STANDARD_ILLUMINANT_ENCODINGS.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @standard_illuminant_encoding = Kaitai::Struct::Stream::resolve_enum(STANDARD_ILLUMINANT_ENCODINGS, @_io.read_u4be)
      self
    end
    attr_reader :standard_illuminant_encoding
  end
  class ProfileHeader < Kaitai::Struct::Struct

    CMM_SIGNATURES = {
      858931796 => :cmm_signatures_the_imaging_factory_cmm,
      1094929747 => :cmm_signatures_agfa_cmm,
      1094992453 => :cmm_signatures_adobe_cmm,
      1128484179 => :cmm_signatures_color_gear_cmm,
      1147629395 => :cmm_signatures_logosync_cmm,
      1162234144 => :cmm_signatures_efi_cmm,
      1163411779 => :cmm_signatures_exact_scan_cmm,
      1179000864 => :cmm_signatures_fuji_film_cmm,
      1212370253 => :cmm_signatures_harlequin_rip_cmm,
      1212435744 => :cmm_signatures_heidelberg_cmm,
      1262701907 => :cmm_signatures_kodak_cmm,
      1296256324 => :cmm_signatures_konica_minolta_cmm,
      1380404563 => :cmm_signatures_device_link_cmm,
      1397310275 => :cmm_signatures_sample_icc_cmm,
      1397311310 => :cmm_signatures_mutoh_cmm,
      1413696845 => :cmm_signatures_toshiba_cmm,
      1430471501 => :cmm_signatures_color_gear_cmm_lite,
      1430474067 => :cmm_signatures_color_gear_cmm_c,
      1464029984 => :cmm_signatures_windows_color_system_cmm,
      1465141024 => :cmm_signatures_ware_to_go_cmm,
      1634758764 => :cmm_signatures_apple_cmm,
      1634887532 => :cmm_signatures_argyll_cms_cmm,
      1818455411 => :cmm_signatures_little_cms_cmm,
      2053320752 => :cmm_signatures_zoran_cmm,
    }
    I__CMM_SIGNATURES = CMM_SIGNATURES.invert

    PRIMARY_PLATFORMS = {
      1095782476 => :primary_platforms_apple_computer_inc,
      1297303124 => :primary_platforms_microsoft_corporation,
      1397180704 => :primary_platforms_silicon_graphics_inc,
      1398099543 => :primary_platforms_sun_microsystems,
    }
    I__PRIMARY_PLATFORMS = PRIMARY_PLATFORMS.invert

    PROFILE_CLASSES = {
      1633842036 => :profile_classes_abstract_profile,
      1818848875 => :profile_classes_device_link_profile,
      1835955314 => :profile_classes_display_device_profile,
      1852662636 => :profile_classes_named_color_profile,
      1886549106 => :profile_classes_output_device_profile,
      1935896178 => :profile_classes_input_device_profile,
      1936744803 => :profile_classes_color_space_profile,
    }
    I__PROFILE_CLASSES = PROFILE_CLASSES.invert

    RENDERING_INTENTS = {
      0 => :rendering_intents_perceptual,
      1 => :rendering_intents_media_relative_colorimetric,
      2 => :rendering_intents_saturation,
      3 => :rendering_intents_icc_absolute_colorimetric,
    }
    I__RENDERING_INTENTS = RENDERING_INTENTS.invert

    DATA_COLOUR_SPACES = {
      843271250 => :data_colour_spaces_two_colour,
      860048466 => :data_colour_spaces_three_colour,
      876825682 => :data_colour_spaces_four_colour,
      893602898 => :data_colour_spaces_five_colour,
      910380114 => :data_colour_spaces_six_colour,
      927157330 => :data_colour_spaces_seven_colour,
      943934546 => :data_colour_spaces_eight_colour,
      960711762 => :data_colour_spaces_nine_colour,
      1094929490 => :data_colour_spaces_ten_colour,
      1111706706 => :data_colour_spaces_eleven_colour,
      1128483922 => :data_colour_spaces_twelve_colour,
      1129142560 => :data_colour_spaces_cmy,
      1129142603 => :data_colour_spaces_cmyk,
      1145261138 => :data_colour_spaces_thirteen_colour,
      1162038354 => :data_colour_spaces_fourteen_colour,
      1178815570 => :data_colour_spaces_fifteen_colour,
      1196573017 => :data_colour_spaces_gray,
      1212961568 => :data_colour_spaces_hls,
      1213421088 => :data_colour_spaces_hsv,
      1281450528 => :data_colour_spaces_cielab_or_pcslab,
      1282766368 => :data_colour_spaces_cieluv,
      1380401696 => :data_colour_spaces_rgb,
      1482250784 => :data_colour_spaces_nciexyz_or_pcsxyz,
      1497588338 => :data_colour_spaces_ycbcr,
      1501067552 => :data_colour_spaces_cieyxy,
    }
    I__DATA_COLOUR_SPACES = DATA_COLOUR_SPACES.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @size = @_io.read_u4be
      @preferred_cmm_type = Kaitai::Struct::Stream::resolve_enum(CMM_SIGNATURES, @_io.read_u4be)
      @version = VersionField.new(@_io, self, @_root)
      @device_class = Kaitai::Struct::Stream::resolve_enum(PROFILE_CLASSES, @_io.read_u4be)
      @color_space = Kaitai::Struct::Stream::resolve_enum(DATA_COLOUR_SPACES, @_io.read_u4be)
      @pcs = (@_io.read_bytes(4)).force_encoding("ASCII")
      @creation_date_time = DateTimeNumber.new(@_io, self, @_root)
      @file_signature = @_io.ensure_fixed_contents([97, 99, 115, 112].pack('C*'))
      @primary_platform = Kaitai::Struct::Stream::resolve_enum(PRIMARY_PLATFORMS, @_io.read_u4be)
      @profile_flags = ProfileFlags.new(@_io, self, @_root)
      @device_manufacturer = DeviceManufacturer.new(@_io, self, @_root)
      @device_model = (@_io.read_bytes(4)).force_encoding("ASCII")
      @device_attributes = DeviceAttributes.new(@_io, self, @_root)
      @rendering_intent = Kaitai::Struct::Stream::resolve_enum(RENDERING_INTENTS, @_io.read_u4be)
      @nciexyz_values_of_illuminant_of_pcs = XyzNumber.new(@_io, self, @_root)
      @creator = DeviceManufacturer.new(@_io, self, @_root)
      @identifier = @_io.read_bytes(16)
      @reserved_data = @_io.read_bytes(28)
      self
    end
    class VersionField < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @major = @_io.ensure_fixed_contents([4].pack('C*'))
        @minor = @_io.read_bits_int(4)
        @bug_fix_level = @_io.read_bits_int(4)
        @_io.align_to_byte
        @reserved = @_io.ensure_fixed_contents([0, 0].pack('C*'))
        self
      end
      attr_reader :major
      attr_reader :minor
      attr_reader :bug_fix_level
      attr_reader :reserved
    end
    class ProfileFlags < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @embedded_profile = @_io.read_bits_int(1) != 0
        @profile_can_be_used_independently_of_embedded_colour_data = @_io.read_bits_int(1) != 0
        @other_flags = @_io.read_bits_int(30)
        self
      end
      attr_reader :embedded_profile
      attr_reader :profile_can_be_used_independently_of_embedded_colour_data
      attr_reader :other_flags
    end
    attr_reader :size
    attr_reader :preferred_cmm_type
    attr_reader :version
    attr_reader :device_class
    attr_reader :color_space
    attr_reader :pcs
    attr_reader :creation_date_time
    attr_reader :file_signature
    attr_reader :primary_platform
    attr_reader :profile_flags
    attr_reader :device_manufacturer
    attr_reader :device_model
    attr_reader :device_attributes
    attr_reader :rendering_intent
    attr_reader :nciexyz_values_of_illuminant_of_pcs
    attr_reader :creator
    attr_reader :identifier
    attr_reader :reserved_data
  end
  class XyzNumber < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @x = @_io.read_bytes(4)
      @y = @_io.read_bytes(4)
      @z = @_io.read_bytes(4)
      self
    end
    attr_reader :x
    attr_reader :y
    attr_reader :z
  end
  class DateTimeNumber < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @year = @_io.read_u2be
      @month = @_io.read_u2be
      @day = @_io.read_u2be
      @hour = @_io.read_u2be
      @minute = @_io.read_u2be
      @second = @_io.read_u2be
      self
    end
    attr_reader :year
    attr_reader :month
    attr_reader :day
    attr_reader :hour
    attr_reader :minute
    attr_reader :second
  end
  class Response16Number < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @number = @_io.read_u4be
      @reserved = @_io.ensure_fixed_contents([0, 0].pack('C*'))
      @measurement_value = S15Fixed16Number.new(@_io, self, @_root)
      self
    end
    attr_reader :number
    attr_reader :reserved
    attr_reader :measurement_value
  end
  class U1Fixed15Number < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @number = @_io.read_bytes(2)
      self
    end
    attr_reader :number
  end
  class TagTable < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @tag_count = @_io.read_u4be
      @tags = Array.new(tag_count)
      (tag_count).times { |i|
        @tags[i] = TagDefinition.new(@_io, self, @_root)
      }
      self
    end
    class TagDefinition < Kaitai::Struct::Struct

      TAG_SIGNATURES = {
        1093812784 => :tag_signatures_a_to_b_0,
        1093812785 => :tag_signatures_a_to_b_1,
        1093812786 => :tag_signatures_a_to_b_2,
        1110589744 => :tag_signatures_b_to_a_0,
        1110589745 => :tag_signatures_b_to_a_1,
        1110589746 => :tag_signatures_b_to_a_2,
        1110590512 => :tag_signatures_b_to_d_0,
        1110590513 => :tag_signatures_b_to_d_1,
        1110590514 => :tag_signatures_b_to_d_2,
        1110590515 => :tag_signatures_b_to_d_3,
        1144144432 => :tag_signatures_d_to_b_0,
        1144144433 => :tag_signatures_d_to_b_1,
        1144144434 => :tag_signatures_d_to_b_2,
        1144144435 => :tag_signatures_d_to_b_3,
        1649693251 => :tag_signatures_blue_trc,
        1649957210 => :tag_signatures_blue_matrix_column,
        1667329140 => :tag_signatures_calibration_date_time,
        1667785060 => :tag_signatures_chromatic_adaptation,
        1667789421 => :tag_signatures_chromaticity,
        1667852659 => :tag_signatures_colorimetric_intent_image_state,
        1668050804 => :tag_signatures_colorant_table_out,
        1668051567 => :tag_signatures_colorant_order,
        1668051572 => :tag_signatures_colorant_table,
        1668313716 => :tag_signatures_copyright,
        1684370275 => :tag_signatures_profile_description,
        1684890724 => :tag_signatures_device_model_desc,
        1684893284 => :tag_signatures_device_mfg_desc,
        1733579331 => :tag_signatures_green_trc,
        1733843290 => :tag_signatures_green_matrix_column,
        1734438260 => :tag_signatures_gamut,
        1800688195 => :tag_signatures_gray_trc,
        1819635049 => :tag_signatures_luminance,
        1835360627 => :tag_signatures_measurement,
        1852009522 => :tag_signatures_named_color_2,
        1886545200 => :tag_signatures_preview_0,
        1886545201 => :tag_signatures_preview_1,
        1886545202 => :tag_signatures_preview_2,
        1886610801 => :tag_signatures_profile_sequence,
        1886611812 => :tag_signatures_profile_sequence_identifier,
        1918128707 => :tag_signatures_red_trc,
        1918392666 => :tag_signatures_red_matrix_column,
        1919251312 => :tag_signatures_output_response,
        1919510320 => :tag_signatures_perceptual_rendering_intent_gamut,
        1919510322 => :tag_signatures_saturation_rendering_intent_gamut,
        1952543335 => :tag_signatures_char_target,
        1952801640 => :tag_signatures_technology,
        1986618743 => :tag_signatures_viewing_conditions,
        1987405156 => :tag_signatures_viewing_cond_desc,
        2004119668 => :tag_signatures_media_white_point,
      }
      I__TAG_SIGNATURES = TAG_SIGNATURES.invert

      TAG_TYPE_SIGNATURES = {
        1482250784 => :tag_type_signatures_xyz_type,
        1668051572 => :tag_type_signatures_colorant_table_type,
        1668641398 => :tag_type_signatures_curve_type,
        1684108385 => :tag_type_signatures_data_type,
        1685350765 => :tag_type_signatures_date_time_type,
        1832993312 => :tag_type_signatures_multi_function_a_to_b_table_type,
        1833058592 => :tag_type_signatures_multi_function_b_to_a_table_type,
        1835360627 => :tag_type_signatures_measurement_type,
        1835430961 => :tag_type_signatures_multi_function_table_with_one_byte_precision_type,
        1835430962 => :tag_type_signatures_multi_function_table_with_two_byte_precision_type,
        1835824483 => :tag_type_signatures_multi_localized_unicode_type,
        1836082548 => :tag_type_signatures_multi_process_elements_type,
        1852009522 => :tag_type_signatures_named_color_2_type,
        1885434465 => :tag_type_signatures_parametric_curve_type,
        1886610801 => :tag_type_signatures_profile_sequence_desc_type,
        1886611812 => :tag_type_signatures_profile_sequence_identifier_type,
        1919120178 => :tag_type_signatures_response_curve_set_16_type,
        1936077618 => :tag_type_signatures_s_15_fixed_16_array_type,
        1936287520 => :tag_type_signatures_signature_type,
        1952807028 => :tag_type_signatures_text_type,
        1969632050 => :tag_type_signatures_u_16_fixed_16_array_type,
        1969827896 => :tag_type_signatures_u_int_8_array_type,
        1969828150 => :tag_type_signatures_u_int_16_array_type,
        1969828658 => :tag_type_signatures_u_int_32_array_type,
        1969829428 => :tag_type_signatures_u_int_64_array_type,
        1986618743 => :tag_type_signatures_viewing_conditions_type,
      }
      I__TAG_TYPE_SIGNATURES = TAG_TYPE_SIGNATURES.invert

      MULTI_PROCESS_ELEMENTS_TYPES = {
        1648444243 => :multi_process_elements_types_bacs_element_type,
        1668052340 => :multi_process_elements_types_clut_element_type,
        1668641382 => :multi_process_elements_types_one_dimensional_curves_type,
        1698775891 => :multi_process_elements_types_eacs_element_type,
        1835103334 => :multi_process_elements_types_matrix_element_type,
        1835428980 => :multi_process_elements_types_curve_set_element_table_type,
        1885434470 => :multi_process_elements_types_formula_curve_segments_type,
        1935764838 => :multi_process_elements_types_sampled_curve_segment_type,
      }
      I__MULTI_PROCESS_ELEMENTS_TYPES = MULTI_PROCESS_ELEMENTS_TYPES.invert
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @tag_signature = Kaitai::Struct::Stream::resolve_enum(TAG_SIGNATURES, @_io.read_u4be)
        @offset_to_data_element = @_io.read_u4be
        @size_of_data_element = @_io.read_u4be
        self
      end
      class BlueMatrixColumnTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_xyz_type
            @tag_data = XyzType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class DeviceMfgDescTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_multi_localized_unicode_type
            @tag_data = MultiLocalizedUnicodeType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class NamedColor2Type < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @vendor_specific_flag = @_io.read_u4be
          @count_of_named_colours = @_io.read_u4be
          @number_of_device_coordinates_for_each_named_colour = @_io.read_u4be
          @prefix_for_each_colour_name = (@_io.read_bytes_term(0, false, true, true)).force_encoding("ASCII")
          @prefix_for_each_colour_name_padding = Array.new((32 - prefix_for_each_colour_name.size))
          ((32 - prefix_for_each_colour_name.size)).times { |i|
            @prefix_for_each_colour_name_padding = @_io.ensure_fixed_contents([0].pack('C*'))
          }
          @suffix_for_each_colour_name = (@_io.read_bytes_term(0, false, true, true)).force_encoding("ASCII")
          @suffix_for_each_colour_name_padding = Array.new((32 - suffix_for_each_colour_name.size))
          ((32 - suffix_for_each_colour_name.size)).times { |i|
            @suffix_for_each_colour_name_padding = @_io.ensure_fixed_contents([0].pack('C*'))
          }
          @named_colour_definitions = Array.new(count_of_named_colours)
          (count_of_named_colours).times { |i|
            @named_colour_definitions[i] = NamedColourDefinition.new(@_io, self, @_root)
          }
          self
        end
        class NamedColourDefinition < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @root_name = (@_io.read_bytes_term(0, false, true, true)).force_encoding("ASCII")
            @root_name_padding = Array.new((32 - root_name.size))
            ((32 - root_name.size)).times { |i|
              @root_name_padding = @_io.ensure_fixed_contents([0].pack('C*'))
            }
            @pcs_coordinates = @_io.read_bytes(6)
            if _parent.number_of_device_coordinates_for_each_named_colour > 0
              @device_coordinates = Array.new(_parent.count_of_named_colours)
              (_parent.count_of_named_colours).times { |i|
                @device_coordinates[i] = @_io.read_u2be
              }
            end
            self
          end
          attr_reader :root_name
          attr_reader :root_name_padding
          attr_reader :pcs_coordinates
          attr_reader :device_coordinates
        end
        attr_reader :reserved
        attr_reader :vendor_specific_flag
        attr_reader :count_of_named_colours
        attr_reader :number_of_device_coordinates_for_each_named_colour
        attr_reader :prefix_for_each_colour_name
        attr_reader :prefix_for_each_colour_name_padding
        attr_reader :suffix_for_each_colour_name
        attr_reader :suffix_for_each_colour_name_padding
        attr_reader :named_colour_definitions
      end
      class ViewingConditionsTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_viewing_conditions_type
            @tag_data = ViewingConditionsType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class BlueTrcTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_curve_type
            @tag_data = CurveType.new(@_io, self, @_root)
          when :tag_type_signatures_parametric_curve_type
            @tag_data = ParametricCurveType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class ResponseCurveSet16Type < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @number_of_channels = @_io.read_u2be
          @count_of_measurement_types = @_io.read_u2be
          @response_curve_structure_offsets = Array.new(count_of_measurement_types)
          (count_of_measurement_types).times { |i|
            @response_curve_structure_offsets[i] = @_io.read_u4be
          }
          @response_curve_structures = @_io.read_bytes_full
          self
        end
        attr_reader :reserved
        attr_reader :number_of_channels
        attr_reader :count_of_measurement_types
        attr_reader :response_curve_structure_offsets
        attr_reader :response_curve_structures
      end
      class CurveType < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @number_of_entries = @_io.read_u4be
          if number_of_entries > 1
            @curve_values = Array.new(number_of_entries)
            (number_of_entries).times { |i|
              @curve_values[i] = @_io.read_u4be
            }
          end
          if number_of_entries == 1
            @curve_value = @_io.read_u1
          end
          self
        end
        attr_reader :reserved
        attr_reader :number_of_entries
        attr_reader :curve_values
        attr_reader :curve_value
      end
      class SaturationRenderingIntentGamutTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_signature_type
            @tag_data = SignatureType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class XyzType < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @values = []
          while not @_io.eof?
            @values << XyzNumber.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :reserved
        attr_reader :values
      end
      class Lut8Type < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @number_of_input_channels = @_io.read_u1
          @number_of_output_channels = @_io.read_u1
          @number_of_clut_grid_points = @_io.read_u1
          @padding = @_io.ensure_fixed_contents([0].pack('C*'))
          @encoded_e_parameters = Array.new(9)
          (9).times { |i|
            @encoded_e_parameters[i] = @_io.read_s4be
          }
          @number_of_input_table_entries = @_io.read_u4be
          @number_of_output_table_entries = @_io.read_u4be
          @input_tables = @_io.read_bytes((256 * number_of_input_channels))
          @clut_values = @_io.read_bytes(((number_of_clut_grid_points ^ number_of_input_channels) * number_of_output_channels))
          @output_tables = @_io.read_bytes((256 * number_of_output_channels))
          self
        end
        attr_reader :reserved
        attr_reader :number_of_input_channels
        attr_reader :number_of_output_channels
        attr_reader :number_of_clut_grid_points
        attr_reader :padding
        attr_reader :encoded_e_parameters
        attr_reader :number_of_input_table_entries
        attr_reader :number_of_output_table_entries
        attr_reader :input_tables
        attr_reader :clut_values
        attr_reader :output_tables
      end
      class BToA2Tag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_multi_function_table_with_one_byte_precision_type
            @tag_data = Lut8Type.new(@_io, self, @_root)
          when :tag_type_signatures_multi_function_table_with_two_byte_precision_type
            @tag_data = Lut16Type.new(@_io, self, @_root)
          when :tag_type_signatures_multi_function_b_to_a_table_type
            @tag_data = LutBToAType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class LutAToBType < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @number_of_input_channels = @_io.read_u1
          @number_of_output_channels = @_io.read_u1
          @padding = @_io.ensure_fixed_contents([0, 0].pack('C*'))
          @offset_to_first_b_curve = @_io.read_u4be
          @offset_to_matrix = @_io.read_u4be
          @offset_to_first_m_curve = @_io.read_u4be
          @offset_to_clut = @_io.read_u4be
          @offset_to_first_a_curve = @_io.read_u4be
          @data = @_io.read_bytes_full
          self
        end
        attr_reader :reserved
        attr_reader :number_of_input_channels
        attr_reader :number_of_output_channels
        attr_reader :padding
        attr_reader :offset_to_first_b_curve
        attr_reader :offset_to_matrix
        attr_reader :offset_to_first_m_curve
        attr_reader :offset_to_clut
        attr_reader :offset_to_first_a_curve
        attr_reader :data
      end
      class BToA0Tag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_multi_function_table_with_one_byte_precision_type
            @tag_data = Lut8Type.new(@_io, self, @_root)
          when :tag_type_signatures_multi_function_table_with_two_byte_precision_type
            @tag_data = Lut16Type.new(@_io, self, @_root)
          when :tag_type_signatures_multi_function_b_to_a_table_type
            @tag_data = LutBToAType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class MediaWhitePointTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_xyz_type
            @tag_data = XyzType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class Lut16Type < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @number_of_input_channels = @_io.read_u1
          @number_of_output_channels = @_io.read_u1
          @number_of_clut_grid_points = @_io.read_u1
          @padding = @_io.ensure_fixed_contents([0].pack('C*'))
          @encoded_e_parameters = Array.new(9)
          (9).times { |i|
            @encoded_e_parameters[i] = @_io.read_s4be
          }
          @number_of_input_table_entries = @_io.read_u4be
          @number_of_output_table_entries = @_io.read_u4be
          @input_tables = @_io.read_bytes(((2 * number_of_input_channels) * number_of_input_table_entries))
          @clut_values = @_io.read_bytes(((2 * (number_of_clut_grid_points ^ number_of_input_channels)) * number_of_output_channels))
          @output_tables = @_io.read_bytes(((2 * number_of_output_channels) * number_of_output_table_entries))
          self
        end
        attr_reader :reserved
        attr_reader :number_of_input_channels
        attr_reader :number_of_output_channels
        attr_reader :number_of_clut_grid_points
        attr_reader :padding
        attr_reader :encoded_e_parameters
        attr_reader :number_of_input_table_entries
        attr_reader :number_of_output_table_entries
        attr_reader :input_tables
        attr_reader :clut_values
        attr_reader :output_tables
      end
      class PerceptualRenderingIntentGamutTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_signature_type
            @tag_data = SignatureType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class U16Fixed16ArrayType < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @values = []
          while not @_io.eof?
            @values << U16Fixed16Number.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :reserved
        attr_reader :values
      end
      class ColorantTableOutTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_colorant_table_type
            @tag_data = ColorantTableType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class MeasurementTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_measurement_type
            @tag_data = MeasurementType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class ProfileSequenceTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_profile_sequence_desc_type
            @tag_data = ProfileSequenceDescType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class TechnologyTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_signature_type
            @tag_data = SignatureType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class AToB0Tag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_multi_function_table_with_one_byte_precision_type
            @tag_data = Lut8Type.new(@_io, self, @_root)
          when :tag_type_signatures_multi_function_table_with_two_byte_precision_type
            @tag_data = Lut16Type.new(@_io, self, @_root)
          when :tag_type_signatures_multi_function_a_to_b_table_type
            @tag_data = LutAToBType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class DToB0Tag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_multi_process_elements_type
            @tag_data = MultiProcessElementsType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class OutputResponseTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_response_curve_set_16_type
            @tag_data = ResponseCurveSet16Type.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class GreenMatrixColumnTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_xyz_type
            @tag_data = XyzType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class ProfileDescriptionTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_multi_localized_unicode_type
            @tag_data = MultiLocalizedUnicodeType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class Preview1Tag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_multi_function_table_with_one_byte_precision_type
            @tag_data = Lut8Type.new(@_io, self, @_root)
          when :tag_type_signatures_multi_function_table_with_two_byte_precision_type
            @tag_data = Lut16Type.new(@_io, self, @_root)
          when :tag_type_signatures_multi_function_b_to_a_table_type
            @tag_data = LutBToAType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class RedTrcTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_curve_type
            @tag_data = CurveType.new(@_io, self, @_root)
          when :tag_type_signatures_parametric_curve_type
            @tag_data = ParametricCurveType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class BToD0Tag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_multi_process_elements_type
            @tag_data = MultiProcessElementsType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class DToB1Tag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_multi_process_elements_type
            @tag_data = MultiProcessElementsType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class BToA1Tag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_multi_function_table_with_one_byte_precision_type
            @tag_data = Lut8Type.new(@_io, self, @_root)
          when :tag_type_signatures_multi_function_table_with_two_byte_precision_type
            @tag_data = Lut16Type.new(@_io, self, @_root)
          when :tag_type_signatures_multi_function_b_to_a_table_type
            @tag_data = LutBToAType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class ParametricCurveType < Kaitai::Struct::Struct

        PARAMETRIC_CURVE_TYPE_FUNCTIONS = {
          0 => :parametric_curve_type_functions_y_equals_x_to_power_of_g,
          1 => :parametric_curve_type_functions_cie_122_1996,
          2 => :parametric_curve_type_functions_iec_61966_3,
          3 => :parametric_curve_type_functions_iec_61966_2_1,
          4 => :parametric_curve_type_functions_y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c,
        }
        I__PARAMETRIC_CURVE_TYPE_FUNCTIONS = PARAMETRIC_CURVE_TYPE_FUNCTIONS.invert
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @function_type = Kaitai::Struct::Stream::resolve_enum(PARAMETRIC_CURVE_TYPE_FUNCTIONS, @_io.read_u2be)
          @reserved_2 = @_io.ensure_fixed_contents([0, 0].pack('C*'))
          case function_type
          when :parametric_curve_type_functions_y_equals_x_to_power_of_g
            @parameters = ParamsYEqualsXToPowerOfG.new(@_io, self, @_root)
          when :parametric_curve_type_functions_cie_122_1996
            @parameters = ParamsCie1221996.new(@_io, self, @_root)
          when :parametric_curve_type_functions_iec_61966_2_1
            @parameters = ParamsIec6196621.new(@_io, self, @_root)
          when :parametric_curve_type_functions_y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c
            @parameters = ParamsYEqualsObAxPlusBCbToPowerOfGPlusC.new(@_io, self, @_root)
          when :parametric_curve_type_functions_iec_61966_3
            @parameters = ParamsIec619663.new(@_io, self, @_root)
          end
          self
        end
        class ParamsIec619663 < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @g = @_io.read_s4be
            @a = @_io.read_s4be
            @b = @_io.read_s4be
            @c = @_io.read_s4be
            self
          end
          attr_reader :g
          attr_reader :a
          attr_reader :b
          attr_reader :c
        end
        class ParamsIec6196621 < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @g = @_io.read_s4be
            @a = @_io.read_s4be
            @b = @_io.read_s4be
            @c = @_io.read_s4be
            @d = @_io.read_s4be
            self
          end
          attr_reader :g
          attr_reader :a
          attr_reader :b
          attr_reader :c
          attr_reader :d
        end
        class ParamsYEqualsXToPowerOfG < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @g = @_io.read_s4be
            self
          end
          attr_reader :g
        end
        class ParamsYEqualsObAxPlusBCbToPowerOfGPlusC < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @g = @_io.read_s4be
            @a = @_io.read_s4be
            @b = @_io.read_s4be
            @c = @_io.read_s4be
            @d = @_io.read_s4be
            @e = @_io.read_s4be
            @f = @_io.read_s4be
            self
          end
          attr_reader :g
          attr_reader :a
          attr_reader :b
          attr_reader :c
          attr_reader :d
          attr_reader :e
          attr_reader :f
        end
        class ParamsCie1221996 < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @g = @_io.read_s4be
            @a = @_io.read_s4be
            @b = @_io.read_s4be
            self
          end
          attr_reader :g
          attr_reader :a
          attr_reader :b
        end
        attr_reader :reserved
        attr_reader :function_type
        attr_reader :reserved_2
        attr_reader :parameters
      end
      class ChromaticityTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_chromaticity_type
            @tag_data = ChromaticityType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class ChromaticAdaptationTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_s_15_fixed_16_array_type
            @tag_data = S15Fixed16ArrayType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class MeasurementType < Kaitai::Struct::Struct

        STANDARD_OBSERVER_ENCODINGS = {
          0 => :standard_observer_encodings_unknown,
          1 => :standard_observer_encodings_cie_1931_standard_colorimetric_observer,
          2 => :standard_observer_encodings_cie_1964_standard_colorimetric_observer,
        }
        I__STANDARD_OBSERVER_ENCODINGS = STANDARD_OBSERVER_ENCODINGS.invert

        MEASUREMENT_GEOMETRY_ENCODINGS = {
          0 => :measurement_geometry_encodings_unknown,
          1 => :measurement_geometry_encodings_zero_degrees_to_45_degrees_or_45_degrees_to_zero_degrees,
          2 => :measurement_geometry_encodings_zero_degrees_to_d_degrees_or_d_degrees_to_zero_degrees,
        }
        I__MEASUREMENT_GEOMETRY_ENCODINGS = MEASUREMENT_GEOMETRY_ENCODINGS.invert

        MEASUREMENT_FLARE_ENCODINGS = {
          0 => :measurement_flare_encodings_zero_percent,
          65536 => :measurement_flare_encodings_one_hundred_percent,
        }
        I__MEASUREMENT_FLARE_ENCODINGS = MEASUREMENT_FLARE_ENCODINGS.invert
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @standard_observer_encoding = Kaitai::Struct::Stream::resolve_enum(STANDARD_OBSERVER_ENCODINGS, @_io.read_u4be)
          @nciexyz_tristimulus_values_for_measurement_backing = XyzNumber.new(@_io, self, @_root)
          @measurement_geometry_encoding = Kaitai::Struct::Stream::resolve_enum(MEASUREMENT_GEOMETRY_ENCODINGS, @_io.read_u4be)
          @measurement_flare_encoding = Kaitai::Struct::Stream::resolve_enum(MEASUREMENT_FLARE_ENCODINGS, @_io.read_u4be)
          @standard_illuminant_encoding = StandardIlluminantEncoding.new(@_io, self, @_root)
          self
        end
        attr_reader :reserved
        attr_reader :standard_observer_encoding
        attr_reader :nciexyz_tristimulus_values_for_measurement_backing
        attr_reader :measurement_geometry_encoding
        attr_reader :measurement_flare_encoding
        attr_reader :standard_illuminant_encoding
      end
      class TextType < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @value = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes_full, 0, false)).force_encoding("ASCII")
          self
        end
        attr_reader :reserved
        attr_reader :value
      end
      class ProfileSequenceIdentifierType < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @number_of_structures = @_io.read_u4be
          @positions_table = Array.new(number_of_structures)
          (number_of_structures).times { |i|
            @positions_table[i] = PositionNumber.new(@_io, self, @_root)
          }
          @profile_identifiers = Array.new(number_of_structures)
          (number_of_structures).times { |i|
            @profile_identifiers[i] = ProfileIdentifier.new(@_io, self, @_root)
          }
          self
        end
        class ProfileIdentifier < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @profile_id = @_io.read_bytes(16)
            @profile_description = MultiLocalizedUnicodeType.new(@_io, self, @_root)
            self
          end
          attr_reader :profile_id
          attr_reader :profile_description
        end
        attr_reader :reserved
        attr_reader :number_of_structures
        attr_reader :positions_table
        attr_reader :profile_identifiers
      end
      class ColorantTableType < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @count_of_colorants = @_io.read_u4be
          @colorants = Array.new(count_of_colorants)
          (count_of_colorants).times { |i|
            @colorants[i] = Colorant.new(@_io, self, @_root)
          }
          self
        end
        class Colorant < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @name = (@_io.read_bytes_term(0, false, true, true)).force_encoding("ASCII")
            @padding = Array.new((32 - name.size))
            ((32 - name.size)).times { |i|
              @padding = @_io.ensure_fixed_contents([0].pack('C*'))
            }
            @pcs_values = @_io.read_bytes(6)
            self
          end
          attr_reader :name
          attr_reader :padding
          attr_reader :pcs_values
        end
        attr_reader :reserved
        attr_reader :count_of_colorants
        attr_reader :colorants
      end
      class SignatureType < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @signature = (@_io.read_bytes(4)).force_encoding("ASCII")
          self
        end
        attr_reader :reserved
        attr_reader :signature
      end
      class CopyrightTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_multi_localized_unicode_type
            @tag_data = MultiLocalizedUnicodeType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class Preview0Tag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_multi_function_table_with_one_byte_precision_type
            @tag_data = Lut8Type.new(@_io, self, @_root)
          when :tag_type_signatures_multi_function_table_with_two_byte_precision_type
            @tag_data = Lut16Type.new(@_io, self, @_root)
          when :tag_type_signatures_multi_function_a_to_b_table_type
            @tag_data = LutAToBType.new(@_io, self, @_root)
          when :tag_type_signatures_multi_function_b_to_a_table_type
            @tag_data = LutBToAType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class DateTimeType < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @date_and_time = DateTimeNumber.new(@_io, self, @_root)
          self
        end
        attr_reader :reserved
        attr_reader :date_and_time
      end
      class DToB3Tag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_multi_process_elements_type
            @tag_data = MultiProcessElementsType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class Preview2Tag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_multi_function_table_with_one_byte_precision_type
            @tag_data = Lut8Type.new(@_io, self, @_root)
          when :tag_type_signatures_multi_function_table_with_two_byte_precision_type
            @tag_data = Lut16Type.new(@_io, self, @_root)
          when :tag_type_signatures_multi_function_b_to_a_table_type
            @tag_data = LutBToAType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class DeviceModelDescTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_multi_localized_unicode_type
            @tag_data = MultiLocalizedUnicodeType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class MultiProcessElementsType < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @number_of_input_channels = @_io.read_u2be
          @number_of_output_channels = @_io.read_u2be
          @number_of_processing_elements = @_io.read_u4be
          @process_element_positions_table = Array.new(number_of_processing_elements)
          (number_of_processing_elements).times { |i|
            @process_element_positions_table[i] = PositionNumber.new(@_io, self, @_root)
          }
          @data = @_io.read_bytes_full
          self
        end
        attr_reader :reserved
        attr_reader :number_of_input_channels
        attr_reader :number_of_output_channels
        attr_reader :number_of_processing_elements
        attr_reader :process_element_positions_table
        attr_reader :data
      end
      class UInt16ArrayType < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @values = []
          while not @_io.eof?
            @values << @_io.read_u2be
          end
          self
        end
        attr_reader :reserved
        attr_reader :values
      end
      class ColorantOrderTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_colorant_order_type
            @tag_data = ColorantOrderType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class DataType < Kaitai::Struct::Struct

        DATA_TYPES = {
          0 => :data_types_ascii_data,
          1 => :data_types_binary_data,
        }
        I__DATA_TYPES = DATA_TYPES.invert
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @data_flag = Kaitai::Struct::Stream::resolve_enum(DATA_TYPES, @_io.read_u4be)
          self
        end
        attr_reader :data_flag
      end
      class ChromaticityType < Kaitai::Struct::Struct

        COLORANT_AND_PHOSPHOR_ENCODINGS = {
          0 => :colorant_and_phosphor_encodings_unknown,
          1 => :colorant_and_phosphor_encodings_itu_r_bt_709_2,
          2 => :colorant_and_phosphor_encodings_smpte_rp145,
          3 => :colorant_and_phosphor_encodings_ebu_tech_3213_e,
          4 => :colorant_and_phosphor_encodings_p22,
        }
        I__COLORANT_AND_PHOSPHOR_ENCODINGS = COLORANT_AND_PHOSPHOR_ENCODINGS.invert
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @number_of_device_channels = @_io.read_u2be
          @colorant_and_phosphor_encoding = Kaitai::Struct::Stream::resolve_enum(COLORANT_AND_PHOSPHOR_ENCODINGS, @_io.read_u2be)
          @ciexy_coordinates_per_channel = Array.new(number_of_device_channels)
          (number_of_device_channels).times { |i|
            @ciexy_coordinates_per_channel[i] = CiexyCoordinateValues.new(@_io, self, @_root)
          }
          self
        end
        class CiexyCoordinateValues < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @x_coordinate = @_io.read_u2be
            @y_coordinate = @_io.read_u2be
            self
          end
          attr_reader :x_coordinate
          attr_reader :y_coordinate
        end
        attr_reader :reserved
        attr_reader :number_of_device_channels
        attr_reader :colorant_and_phosphor_encoding
        attr_reader :ciexy_coordinates_per_channel
      end
      class LuminanceTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_xyz_type
            @tag_data = XyzType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class S15Fixed16ArrayType < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @values = []
          while not @_io.eof?
            @values << S15Fixed16Number.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :reserved
        attr_reader :values
      end
      class MultiLocalizedUnicodeType < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @number_of_records = @_io.read_u4be
          @record_size = @_io.read_u4be
          @records = Array.new(number_of_records)
          (number_of_records).times { |i|
            @records[i] = Record.new(@_io, self, @_root)
          }
          self
        end
        class Record < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @language_code = @_io.read_u2be
            @country_code = @_io.read_u2be
            @string_length = @_io.read_u4be
            @string_offset = @_io.read_u4be
            self
          end
          def string_data
            return @string_data unless @string_data.nil?
            _pos = @_io.pos
            @_io.seek(string_offset)
            @string_data = (@_io.read_bytes(string_length)).force_encoding("UTF-16BE")
            @_io.seek(_pos)
            @string_data
          end
          attr_reader :language_code
          attr_reader :country_code
          attr_reader :string_length
          attr_reader :string_offset
        end
        attr_reader :reserved
        attr_reader :number_of_records
        attr_reader :record_size
        attr_reader :records
      end
      class AToB2Tag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_multi_function_table_with_one_byte_precision_type
            @tag_data = Lut8Type.new(@_io, self, @_root)
          when :tag_type_signatures_multi_function_table_with_two_byte_precision_type
            @tag_data = Lut16Type.new(@_io, self, @_root)
          when :tag_type_signatures_multi_function_a_to_b_table_type
            @tag_data = LutAToBType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class AToB1Tag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_multi_function_table_with_one_byte_precision_type
            @tag_data = Lut8Type.new(@_io, self, @_root)
          when :tag_type_signatures_multi_function_table_with_two_byte_precision_type
            @tag_data = Lut16Type.new(@_io, self, @_root)
          when :tag_type_signatures_multi_function_a_to_b_table_type
            @tag_data = LutAToBType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class ColorimetricIntentImageStateTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_signature_type
            @tag_data = SignatureType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class CharTargetTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_text_type
            @tag_data = TextType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class ColorantTableTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_colorant_table_type
            @tag_data = ColorantTableType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class CalibrationDateTimeTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_date_time_type
            @tag_data = DateTimeType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class NamedColor2Tag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_named_color_2_type
            @tag_data = NamedColor2Type.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class ViewingCondDescTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_multi_localized_unicode_type
            @tag_data = MultiLocalizedUnicodeType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class BToD3Tag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_multi_process_elements_type
            @tag_data = MultiProcessElementsType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class ProfileSequenceDescType < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @number_of_description_structures = @_io.read_u4be
          @profile_descriptions = Array.new(number_of_description_structures)
          (number_of_description_structures).times { |i|
            @profile_descriptions[i] = ProfileDescription.new(@_io, self, @_root)
          }
          self
        end
        class ProfileDescription < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @device_manufacturer = DeviceManufacturer.new(@_io, self, @_root)
            @device_model = (@_io.read_bytes(4)).force_encoding("ASCII")
            @device_attributes = DeviceAttributes.new(@_io, self, @_root)
            @device_technology = TechnologyTag.new(@_io, self, @_root)
            @description_of_device_manufacturer = DeviceMfgDescTag.new(@_io, self, @_root)
            @description_of_device_model = DeviceModelDescTag.new(@_io, self, @_root)
            self
          end
          attr_reader :device_manufacturer
          attr_reader :device_model
          attr_reader :device_attributes
          attr_reader :device_technology
          attr_reader :description_of_device_manufacturer
          attr_reader :description_of_device_model
        end
        attr_reader :reserved
        attr_reader :number_of_description_structures
        attr_reader :profile_descriptions
      end
      class ProfileSequenceIdentifierTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_profile_sequence_identifier_type
            @tag_data = ProfileSequenceIdentifierType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class BToD1Tag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_multi_process_elements_type
            @tag_data = MultiProcessElementsType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class ColorantOrderType < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @count_of_colorants = @_io.read_u4be
          @numbers_of_colorants_in_order_of_printing = Array.new(count_of_colorants)
          (count_of_colorants).times { |i|
            @numbers_of_colorants_in_order_of_printing[i] = @_io.read_u1
          }
          self
        end
        attr_reader :reserved
        attr_reader :count_of_colorants
        attr_reader :numbers_of_colorants_in_order_of_printing
      end
      class DToB2Tag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_multi_process_elements_type
            @tag_data = MultiProcessElementsType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class GrayTrcTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_curve_type
            @tag_data = CurveType.new(@_io, self, @_root)
          when :tag_type_signatures_parametric_curve_type
            @tag_data = ParametricCurveType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class ViewingConditionsType < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @un_normalized_ciexyz_values_for_illuminant = XyzNumber.new(@_io, self, @_root)
          @un_normalized_ciexyz_values_for_surround = XyzNumber.new(@_io, self, @_root)
          @illuminant_type = StandardIlluminantEncoding.new(@_io, self, @_root)
          self
        end
        attr_reader :reserved
        attr_reader :un_normalized_ciexyz_values_for_illuminant
        attr_reader :un_normalized_ciexyz_values_for_surround
        attr_reader :illuminant_type
      end
      class LutBToAType < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @number_of_input_channels = @_io.read_u1
          @number_of_output_channels = @_io.read_u1
          @padding = @_io.ensure_fixed_contents([0, 0].pack('C*'))
          @offset_to_first_b_curve = @_io.read_u4be
          @offset_to_matrix = @_io.read_u4be
          @offset_to_first_m_curve = @_io.read_u4be
          @offset_to_clut = @_io.read_u4be
          @offset_to_first_a_curve = @_io.read_u4be
          @data = @_io.read_bytes_full
          self
        end
        attr_reader :reserved
        attr_reader :number_of_input_channels
        attr_reader :number_of_output_channels
        attr_reader :padding
        attr_reader :offset_to_first_b_curve
        attr_reader :offset_to_matrix
        attr_reader :offset_to_first_m_curve
        attr_reader :offset_to_clut
        attr_reader :offset_to_first_a_curve
        attr_reader :data
      end
      class GreenTrcTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_curve_type
            @tag_data = CurveType.new(@_io, self, @_root)
          when :tag_type_signatures_parametric_curve_type
            @tag_data = ParametricCurveType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class UInt32ArrayType < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @values = []
          while not @_io.eof?
            @values << @_io.read_u4be
          end
          self
        end
        attr_reader :reserved
        attr_reader :values
      end
      class GamutTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_multi_function_table_with_one_byte_precision_type
            @tag_data = Lut8Type.new(@_io, self, @_root)
          when :tag_type_signatures_multi_function_table_with_two_byte_precision_type
            @tag_data = Lut16Type.new(@_io, self, @_root)
          when :tag_type_signatures_multi_function_b_to_a_table_type
            @tag_data = LutBToAType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class UInt8ArrayType < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @values = []
          while not @_io.eof?
            @values << @_io.read_u1
          end
          self
        end
        attr_reader :reserved
        attr_reader :values
      end
      class RedMatrixColumnTag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_xyz_type
            @tag_data = XyzType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      class UInt64ArrayType < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved = @_io.ensure_fixed_contents([0, 0, 0, 0].pack('C*'))
          @values = []
          while not @_io.eof?
            @values << @_io.read_u8be
          end
          self
        end
        attr_reader :reserved
        attr_reader :values
      end
      class BToD2Tag < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag_type = Kaitai::Struct::Stream::resolve_enum(TAG_TYPE_SIGNATURES, @_io.read_u4be)
          case tag_type
          when :tag_type_signatures_multi_process_elements_type
            @tag_data = MultiProcessElementsType.new(@_io, self, @_root)
          end
          self
        end
        attr_reader :tag_type
        attr_reader :tag_data
      end
      def tag_data_element
        return @tag_data_element unless @tag_data_element.nil?
        _pos = @_io.pos
        @_io.seek(offset_to_data_element)
        case tag_signature
        when :tag_signatures_profile_sequence_identifier
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = ProfileSequenceIdentifierTag.new(io, self, @_root)
        when :tag_signatures_colorimetric_intent_image_state
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = ColorimetricIntentImageStateTag.new(io, self, @_root)
        when :tag_signatures_red_trc
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = RedTrcTag.new(io, self, @_root)
        when :tag_signatures_preview_0
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = Preview0Tag.new(io, self, @_root)
        when :tag_signatures_green_trc
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = GreenTrcTag.new(io, self, @_root)
        when :tag_signatures_b_to_d_0
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = BToD0Tag.new(io, self, @_root)
        when :tag_signatures_colorant_table_out
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = ColorantTableOutTag.new(io, self, @_root)
        when :tag_signatures_b_to_a_2
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = BToA2Tag.new(io, self, @_root)
        when :tag_signatures_calibration_date_time
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = CalibrationDateTimeTag.new(io, self, @_root)
        when :tag_signatures_chromatic_adaptation
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = ChromaticAdaptationTag.new(io, self, @_root)
        when :tag_signatures_colorant_table
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = ColorantTableTag.new(io, self, @_root)
        when :tag_signatures_a_to_b_2
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = AToB2Tag.new(io, self, @_root)
        when :tag_signatures_d_to_b_1
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = DToB1Tag.new(io, self, @_root)
        when :tag_signatures_chromaticity
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = ChromaticityTag.new(io, self, @_root)
        when :tag_signatures_blue_matrix_column
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = BlueMatrixColumnTag.new(io, self, @_root)
        when :tag_signatures_a_to_b_0
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = AToB0Tag.new(io, self, @_root)
        when :tag_signatures_b_to_d_2
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = BToD2Tag.new(io, self, @_root)
        when :tag_signatures_b_to_a_1
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = BToA1Tag.new(io, self, @_root)
        when :tag_signatures_media_white_point
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = MediaWhitePointTag.new(io, self, @_root)
        when :tag_signatures_d_to_b_0
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = DToB0Tag.new(io, self, @_root)
        when :tag_signatures_named_color_2
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = NamedColor2Tag.new(io, self, @_root)
        when :tag_signatures_d_to_b_2
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = DToB2Tag.new(io, self, @_root)
        when :tag_signatures_red_matrix_column
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = RedMatrixColumnTag.new(io, self, @_root)
        when :tag_signatures_viewing_conditions
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = ViewingConditionsTag.new(io, self, @_root)
        when :tag_signatures_a_to_b_1
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = AToB1Tag.new(io, self, @_root)
        when :tag_signatures_preview_1
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = Preview1Tag.new(io, self, @_root)
        when :tag_signatures_gray_trc
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = GrayTrcTag.new(io, self, @_root)
        when :tag_signatures_device_mfg_desc
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = DeviceMfgDescTag.new(io, self, @_root)
        when :tag_signatures_b_to_d_1
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = BToD1Tag.new(io, self, @_root)
        when :tag_signatures_colorant_order
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = ColorantOrderTag.new(io, self, @_root)
        when :tag_signatures_copyright
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = CopyrightTag.new(io, self, @_root)
        when :tag_signatures_gamut
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = GamutTag.new(io, self, @_root)
        when :tag_signatures_char_target
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = CharTargetTag.new(io, self, @_root)
        when :tag_signatures_output_response
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = OutputResponseTag.new(io, self, @_root)
        when :tag_signatures_technology
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = TechnologyTag.new(io, self, @_root)
        when :tag_signatures_viewing_cond_desc
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = ViewingCondDescTag.new(io, self, @_root)
        when :tag_signatures_profile_description
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = ProfileDescriptionTag.new(io, self, @_root)
        when :tag_signatures_luminance
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = LuminanceTag.new(io, self, @_root)
        when :tag_signatures_d_to_b_3
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = DToB3Tag.new(io, self, @_root)
        when :tag_signatures_b_to_d_3
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = BToD3Tag.new(io, self, @_root)
        when :tag_signatures_b_to_a_0
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = BToA0Tag.new(io, self, @_root)
        when :tag_signatures_preview_2
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = Preview2Tag.new(io, self, @_root)
        when :tag_signatures_green_matrix_column
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = GreenMatrixColumnTag.new(io, self, @_root)
        when :tag_signatures_profile_sequence
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = ProfileSequenceTag.new(io, self, @_root)
        when :tag_signatures_saturation_rendering_intent_gamut
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = SaturationRenderingIntentGamutTag.new(io, self, @_root)
        when :tag_signatures_perceptual_rendering_intent_gamut
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = PerceptualRenderingIntentGamutTag.new(io, self, @_root)
        when :tag_signatures_blue_trc
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = BlueTrcTag.new(io, self, @_root)
        when :tag_signatures_device_model_desc
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = DeviceModelDescTag.new(io, self, @_root)
        when :tag_signatures_measurement
          @_raw_tag_data_element = @_io.read_bytes(size_of_data_element)
          io = Kaitai::Struct::Stream.new(@_raw_tag_data_element)
          @tag_data_element = MeasurementTag.new(io, self, @_root)
        else
          @tag_data_element = @_io.read_bytes(size_of_data_element)
        end
        @_io.seek(_pos)
        @tag_data_element
      end
      attr_reader :tag_signature
      attr_reader :offset_to_data_element
      attr_reader :size_of_data_element
      attr_reader :_raw_tag_data_element
    end
    attr_reader :tag_count
    attr_reader :tags
  end
  class DeviceAttributes < Kaitai::Struct::Struct

    DEVICE_ATTRIBUTES_REFLECTIVE_OR_TRANSPARENCY = {
      0 => :device_attributes_reflective_or_transparency_reflective,
      1 => :device_attributes_reflective_or_transparency_transparency,
    }
    I__DEVICE_ATTRIBUTES_REFLECTIVE_OR_TRANSPARENCY = DEVICE_ATTRIBUTES_REFLECTIVE_OR_TRANSPARENCY.invert

    DEVICE_ATTRIBUTES_GLOSSY_OR_MATTE = {
      0 => :device_attributes_glossy_or_matte_glossy,
      1 => :device_attributes_glossy_or_matte_matte,
    }
    I__DEVICE_ATTRIBUTES_GLOSSY_OR_MATTE = DEVICE_ATTRIBUTES_GLOSSY_OR_MATTE.invert

    DEVICE_ATTRIBUTES_POSITIVE_OR_NEGATIVE_MEDIA_POLARITY = {
      0 => :device_attributes_positive_or_negative_media_polarity_positive_media_polarity,
      1 => :device_attributes_positive_or_negative_media_polarity_negative_media_polarity,
    }
    I__DEVICE_ATTRIBUTES_POSITIVE_OR_NEGATIVE_MEDIA_POLARITY = DEVICE_ATTRIBUTES_POSITIVE_OR_NEGATIVE_MEDIA_POLARITY.invert

    DEVICE_ATTRIBUTES_COLOUR_OR_BLACK_AND_WHITE_MEDIA = {
      0 => :device_attributes_colour_or_black_and_white_media_colour_media,
      1 => :device_attributes_colour_or_black_and_white_media_black_and_white_media,
    }
    I__DEVICE_ATTRIBUTES_COLOUR_OR_BLACK_AND_WHITE_MEDIA = DEVICE_ATTRIBUTES_COLOUR_OR_BLACK_AND_WHITE_MEDIA.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @reflective_or_transparency = Kaitai::Struct::Stream::resolve_enum(DEVICE_ATTRIBUTES_REFLECTIVE_OR_TRANSPARENCY, @_io.read_bits_int(1))
      @glossy_or_matte = Kaitai::Struct::Stream::resolve_enum(DEVICE_ATTRIBUTES_GLOSSY_OR_MATTE, @_io.read_bits_int(1))
      @positive_or_negative_media_polarity = Kaitai::Struct::Stream::resolve_enum(DEVICE_ATTRIBUTES_POSITIVE_OR_NEGATIVE_MEDIA_POLARITY, @_io.read_bits_int(1))
      @colour_or_black_and_white_media = Kaitai::Struct::Stream::resolve_enum(DEVICE_ATTRIBUTES_COLOUR_OR_BLACK_AND_WHITE_MEDIA, @_io.read_bits_int(1))
      @reserved = @_io.read_bits_int(28)
      @vendor_specific = @_io.read_bits_int(32)
      self
    end
    attr_reader :reflective_or_transparency
    attr_reader :glossy_or_matte
    attr_reader :positive_or_negative_media_polarity
    attr_reader :colour_or_black_and_white_media
    attr_reader :reserved
    attr_reader :vendor_specific
  end
  class DeviceManufacturer < Kaitai::Struct::Struct

    DEVICE_MANUFACTURERS = {
      878981744 => :device_manufacturers_erdt_systems_gmbh_and_co_kg,
      1094798657 => :device_manufacturers_aamazing_technologies_inc,
      1094927698 => :device_manufacturers_acer_peripherals,
      1094929492 => :device_manufacturers_acolyte_color_research,
      1094931529 => :device_manufacturers_actix_sytems_inc,
      1094992210 => :device_manufacturers_adara_technology_inc,
      1094992453 => :device_manufacturers_adobe_systems_incorporated,
      1094994208 => :device_manufacturers_adi_systems_inc,
      1095190081 => :device_manufacturers_agfa_graphics_nv,
      1095519556 => :device_manufacturers_alps_electric_usa_inc,
      1095520339 => :device_manufacturers_alps_electric_usa_inc_2,
      1095522126 => :device_manufacturers_alwan_color_expertise,
      1095586889 => :device_manufacturers_amiable_technologies_inc,
      1095713568 => :device_manufacturers_aoc_international_usa_ltd,
      1095778631 => :device_manufacturers_apago,
      1095782476 => :device_manufacturers_apple_computer_inc,
      1095980064 => :device_manufacturers_ast,
      1096033876 => :device_manufacturers_atandt_computer_systems,
      1111573836 => :device_manufacturers_barbieri_electronic,
      1112687439 => :device_manufacturers_barco_nv,
      1112689488 => :device_manufacturers_breakpoint_pty_limited,
      1112690516 => :device_manufacturers_brother_industries_ltd,
      1112886348 => :device_manufacturers_bull,
      1112888096 => :device_manufacturers_bus_computer_systems,
      1127041364 => :device_manufacturers_c_itoh,
      1128353106 => :device_manufacturers_intel_corporation,
      1128353359 => :device_manufacturers_canon_inc_canon_development_americas_inc,
      1128354386 => :device_manufacturers_carroll_touch,
      1128354633 => :device_manufacturers_casio_computer_co_ltd,
      1128420691 => :device_manufacturers_colorbus_pl,
      1128614944 => :device_manufacturers_crossfield,
      1128615032 => :device_manufacturers_crossfield_2,
      1128747808 => :device_manufacturers_cgs_publishing_technologies_international_gmbh,
      1128811808 => :device_manufacturers_rochester_robotics,
      1128875852 => :device_manufacturers_colour_imaging_group_london,
      1128879177 => :device_manufacturers_citizen,
      1129066544 => :device_manufacturers_candela_ltd,
      1129072977 => :device_manufacturers_color_iq,
      1129136975 => :device_manufacturers_chromaco_inc,
      1129146712 => :device_manufacturers_chromix,
      1129270351 => :device_manufacturers_colorgraphic_communications_corporation,
      1129270608 => :device_manufacturers_compaq_computer_corporation,
      1129270640 => :device_manufacturers_compeq_usa_focus_technology,
      1129270866 => :device_manufacturers_conrac_display_products,
      1129271876 => :device_manufacturers_cordata_technologies_inc,
      1129337120 => :device_manufacturers_compaq_computer_corporation_2,
      1129337423 => :device_manufacturers_colorpro,
      1129467424 => :device_manufacturers_cornerstone,
      1129601056 => :device_manufacturers_ctx_international_inc,
      1129728339 => :device_manufacturers_colorvision,
      1129792288 => :device_manufacturers_fujitsu_laboratories_ltd,
      1145131593 => :device_manufacturers_darius_technology_ltd,
      1145132097 => :device_manufacturers_dataproducts,
      1145262112 => :device_manufacturers_dry_creek_photo,
      1145262659 => :device_manufacturers_digital_contents_resource_center_chung_ang_university,
      1145392204 => :device_manufacturers_dell_computer_corporation,
      1145652000 => :device_manufacturers_dainippon_ink_and_chemicals,
      1145652047 => :device_manufacturers_diconix,
      1145653065 => :device_manufacturers_digital,
      1145841219 => :device_manufacturers_digital_light_and_color,
      1146113095 => :device_manufacturers_doppelganger_llc,
      1146298400 => :device_manufacturers_dainippon_screen,
      1146310476 => :device_manufacturers_doosol,
      1146441806 => :device_manufacturers_dupont,
      1162892111 => :device_manufacturers_epson,
      1163086671 => :device_manufacturers_esko_graphics,
      1163153993 => :device_manufacturers_electronics_and_telecommunications_research_institute,
      1163281746 => :device_manufacturers_everex_systems_inc,
      1163411779 => :device_manufacturers_exactcode_gmbh,
      1164540527 => :device_manufacturers_eizo_nanao_corporation,
      1178684483 => :device_manufacturers_falco_data_products_inc,
      1179000864 => :device_manufacturers_fuji_photo_film_coltd,
      1179010377 => :device_manufacturers_fujifilm_electronic_imaging_ltd,
      1179537988 => :device_manufacturers_fnord_software,
      1179603521 => :device_manufacturers_fora_inc,
      1179603525 => :device_manufacturers_forefront_technology_corporation,
      1179658794 => :device_manufacturers_fujitsu,
      1179664672 => :device_manufacturers_waytech_development_inc,
      1179994697 => :device_manufacturers_fujitsu_2,
      1180180512 => :device_manufacturers_fuji_xerox_co_ltd,
      1195590432 => :device_manufacturers_gcc_technologies_inc,
      1195856716 => :device_manufacturers_global_graphics_software_limited,
      1196245536 => :device_manufacturers_gretagmacbeth,
      1196246816 => :device_manufacturers_gmg_gmbh_and_co_kg,
      1196379204 => :device_manufacturers_goldstar_technology_inc,
      1196446292 => :device_manufacturers_giantprint_pty_ltd,
      1196707138 => :device_manufacturers_gretagmacbeth_2,
      1196835616 => :device_manufacturers_waytech_development_inc_2,
      1196896843 => :device_manufacturers_sony_corporation,
      1212369184 => :device_manufacturers_hci,
      1212435744 => :device_manufacturers_heidelberger_druckmaschinen_ag,
      1212502605 => :device_manufacturers_hermes,
      1212765249 => :device_manufacturers_hitachi_america_ltd,
      1213210656 => :device_manufacturers_hewlett_packard,
      1213481760 => :device_manufacturers_hitachi_ltd,
      1214862441 => :device_manufacturers_hiti_digital_inc,
      1229081888 => :device_manufacturers_ibm_corporation,
      1229213268 => :device_manufacturers_scitex_corporation_ltd,
      1229275936 => :device_manufacturers_hewlett_packard_2,
      1229543745 => :device_manufacturers_iiyama_north_america_inc,
      1229669703 => :device_manufacturers_ikegami_electronics_inc,
      1229799751 => :device_manufacturers_image_systems_corporation,
      1229801760 => :device_manufacturers_ingram_micro_inc,
      1229870147 => :device_manufacturers_intel_corporation_2,
      1229870156 => :device_manufacturers_intl,
      1229870162 => :device_manufacturers_intra_electronics_usa_inc,
      1229931343 => :device_manufacturers_iocomm_international_technology_corporation,
      1230000928 => :device_manufacturers_infoprint_solutions_company,
      1230129491 => :device_manufacturers_scitex_corporation_ltd_3,
      1230195744 => :device_manufacturers_ichikawa_soft_laboratory,
      1230261836 => :device_manufacturers_itnl,
      1230392608 => :device_manufacturers_ivm,
      1230455124 => :device_manufacturers_iwatsu_electric_co_ltd,
      1231318644 => :device_manufacturers_scitex_corporation_ltd_2,
      1231971169 => :device_manufacturers_inca_digital_printers_ltd,
      1232234867 => :device_manufacturers_scitex_corporation_ltd_4,
      1246971476 => :device_manufacturers_jetsoft_development,
      1247167264 => :device_manufacturers_jvc_information_products_co,
      1262572116 => :device_manufacturers_scitex_corporation_ltd_6,
      1262895904 => :device_manufacturers_kfc_computek_components_corporation,
      1263290400 => :device_manufacturers_klh_computers,
      1263355972 => :device_manufacturers_konica_minolta_holdings_inc,
      1263420225 => :device_manufacturers_konica_corporation,
      1263486017 => :device_manufacturers_kodak,
      1264144195 => :device_manufacturers_kyocera,
      1264677492 => :device_manufacturers_scitex_corporation_ltd_7,
      1279476039 => :device_manufacturers_leica_camera_ag,
      1279476548 => :device_manufacturers_leeds_colour,
      1279541579 => :device_manufacturers_left_dakota,
      1279607108 => :device_manufacturers_leading_technology_inc,
      1279613005 => :device_manufacturers_lexmark_international_inc,
      1279872587 => :device_manufacturers_link_computer_inc,
      1279872591 => :device_manufacturers_linotronic,
      1279874117 => :device_manufacturers_lite_on_inc,
      1296123715 => :device_manufacturers_mag_computronic_usa_inc,
      1296123721 => :device_manufacturers_mag_innovision_inc,
      1296125518 => :device_manufacturers_mannesmann,
      1296646990 => :device_manufacturers_micron_technology_inc,
      1296646994 => :device_manufacturers_microtek,
      1296646998 => :device_manufacturers_microvitec_inc,
      1296649807 => :device_manufacturers_minolta,
      1296651347 => :device_manufacturers_mitsubishi_electronics_america_inc,
      1296651379 => :device_manufacturers_mitsuba_corporation,
      1296976980 => :device_manufacturers_minolta_2,
      1297040455 => :device_manufacturers_modgraph_inc,
      1297043017 => :device_manufacturers_monitronix_inc,
      1297043027 => :device_manufacturers_monaco_systems_inc,
      1297044051 => :device_manufacturers_morse_technology_inc,
      1297044553 => :device_manufacturers_motive_systems,
      1297303124 => :device_manufacturers_microsoft_corporation,
      1297437775 => :device_manufacturers_mutoh_industries_ltd,
      1298756723 => :device_manufacturers_mitsubishi_electric_corporation_kyoto_works,
      1312902721 => :device_manufacturers_nanao_usa_corporation,
      1313162016 => :device_manufacturers_nec_corporation,
      1313167440 => :device_manufacturers_nexpress_solutions_llc,
      1313428307 => :device_manufacturers_nissei_sangyo_america_ltd,
      1313558350 => :device_manufacturers_nikon_corporation,
      1329808672 => :device_manufacturers_oce_technologies_bv,
      1329808707 => :device_manufacturers_ocecolor,
      1330333984 => :device_manufacturers_oki,
      1330334020 => :device_manufacturers_okidata,
      1330334032 => :device_manufacturers_okidata_2,
      1330399574 => :device_manufacturers_olivetti,
      1330403661 => :device_manufacturers_olympus_optical_co_ltd,
      1330534744 => :device_manufacturers_onyx_graphics,
      1330664521 => :device_manufacturers_optiquest,
      1346454347 => :device_manufacturers_packard_bell,
      1346457153 => :device_manufacturers_matsushita_electric_industrial_co_ltd,
      1346457172 => :device_manufacturers_pantone_inc,
      1346522656 => :device_manufacturers_packard_bell_2,
      1346786592 => :device_manufacturers_pfu_limited,
      1346914636 => :device_manufacturers_philips_consumer_electronics_co,
      1347310680 => :device_manufacturers_hoya_corporation_pentax_imaging_systems_division,
      1347382885 => :device_manufacturers_phase_one_a_s,
      1347568973 => :device_manufacturers_premier_computer_innovations,
      1347569998 => :device_manufacturers_princeton_graphic_systems,
      1347570000 => :device_manufacturers_princeton_publishing_labs,
      1363957080 => :device_manufacturers_qlux,
      1364022048 => :device_manufacturers_qms_inc,
      1364214596 => :device_manufacturers_qpcard_ab,
      1364541764 => :device_manufacturers_quadlaser,
      1364544837 => :device_manufacturers_qume_corporation,
      1380009033 => :device_manufacturers_radius_inc,
      1380205688 => :device_manufacturers_integrated_color_solutions_inc_2,
      1380206368 => :device_manufacturers_roland_dg_corporation,
      1380271181 => :device_manufacturers_redms_group_inc,
      1380273225 => :device_manufacturers_relisys,
      1380404563 => :device_manufacturers_rolf_gierling_multitools,
      1380533071 => :device_manufacturers_ricoh_corporation,
      1380863044 => :device_manufacturers_edmund_ronald,
      1380931905 => :device_manufacturers_royal,
      1380991776 => :device_manufacturers_ricoh_printing_systemsltd,
      1381256224 => :device_manufacturers_royal_information_electronics_co_ltd,
      1396788560 => :device_manufacturers_sampo_corporation_of_america,
      1396788563 => :device_manufacturers_samsung_inc,
      1396788820 => :device_manufacturers_jaime_santana_pomares,
      1396918612 => :device_manufacturers_scitex_corporation_ltd_9,
      1396920910 => :device_manufacturers_dainippon_screen_3,
      1396985888 => :device_manufacturers_scitex_corporation_ltd_12,
      1397048096 => :device_manufacturers_samsung_electronics_coltd,
      1397049675 => :device_manufacturers_seiko_instruments_usa_inc,
      1397049707 => :device_manufacturers_seikosha,
      1397183833 => :device_manufacturers_scanguycom,
      1397244242 => :device_manufacturers_sharp_laboratories,
      1397310275 => :device_manufacturers_international_color_consortium,
      1397706329 => :device_manufacturers_sony_corporation_2,
      1397769036 => :device_manufacturers_spectracal,
      1398030674 => :device_manufacturers_star,
      1398031136 => :device_manufacturers_sampo_technology_corporation,
      1399023988 => :device_manufacturers_scitex_corporation_ltd_10,
      1399091232 => :device_manufacturers_scitex_corporation_ltd_13,
      1399811705 => :device_manufacturers_sony_corporation_3,
      1413565519 => :device_manufacturers_talon_technology_corporation,
      1413566020 => :device_manufacturers_tandy,
      1413567573 => :device_manufacturers_tatung_co_of_america_inc,
      1413568577 => :device_manufacturers_taxan_america_inc,
      1413763872 => :device_manufacturers_tokyo_denshi_sekei_kk,
      1413825359 => :device_manufacturers_teco_information_systems_inc,
      1413826386 => :device_manufacturers_tegra,
      1413827412 => :device_manufacturers_tektronix_inc,
      1414078496 => :device_manufacturers_texas_instruments,
      1414351698 => :device_manufacturers_typemaker_ltd,
      1414484802 => :device_manufacturers_toshiba_corp,
      1414484808 => :device_manufacturers_toshiba_inc,
      1414485067 => :device_manufacturers_totoku_electric_co_ltd,
      1414678869 => :device_manufacturers_triumph,
      1414742612 => :device_manufacturers_toshiba_tec_corporation,
      1414813728 => :device_manufacturers_ttx_computer_products_inc,
      1414941984 => :device_manufacturers_tvm_professional_monitor_corporation,
      1414996000 => :device_manufacturers_tw_casper_corporation,
      1431065432 => :device_manufacturers_ulead_systems,
      1431193939 => :device_manufacturers_unisys,
      1431591494 => :device_manufacturers_utz_fehlau_and_sohn,
      1447121481 => :device_manufacturers_varityper,
      1447642455 => :device_manufacturers_viewsonic,
      1447646028 => :device_manufacturers_visual_communication,
      1463897671 => :device_manufacturers_wang,
      1464615506 => :device_manufacturers_wilbur_imaging,
      1465141042 => :device_manufacturers_ware_to_go,
      1465471813 => :device_manufacturers_wyse_technology,
      1480938072 => :device_manufacturers_xerox_corporation,
      1481787732 => :device_manufacturers_x_rite,
      1513173555 => :device_manufacturers_lavanyas_test_company,
      1515340110 => :device_manufacturers_zoran_corporation,
      1516593778 => :device_manufacturers_zebra_technologies_inc,
      1648968515 => :device_manufacturers_basiccolor_gmbh,
      1650815591 => :device_manufacturers_bergdesign_incorporated,
      1667594596 => :device_manufacturers_integrated_color_solutions_inc,
      1668051824 => :device_manufacturers_macdermid_colorspan_inc,
      1685266464 => :device_manufacturers_dainippon_screen_2,
      1685418094 => :device_manufacturers_dupont_2,
      1717986665 => :device_manufacturers_fujifilm_electronic_imaging_ltd_2,
      1718383992 => :device_manufacturers_fluxdata_corporation,
      1769105779 => :device_manufacturers_scitex_corporation_ltd_5,
      1801548404 => :device_manufacturers_scitex_corporation_ltd_8,
      1868706916 => :device_manufacturers_erdt_systems_gmbh_and_co_kg_2,
      1868720483 => :device_manufacturers_medigraph_gmbh,
      1903518329 => :device_manufacturers_qubyx_sarl,
      1935894900 => :device_manufacturers_scitex_corporation_ltd_11,
      1935897198 => :device_manufacturers_dainippon_screen_4,
      1935962144 => :device_manufacturers_scitex_corporation_ltd_14,
      1936291689 => :device_manufacturers_siwi_grafika_corporation,
      2037938541 => :device_manufacturers_yxymaster_gmbh,
    }
    I__DEVICE_MANUFACTURERS = DEVICE_MANUFACTURERS.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @device_manufacturer = Kaitai::Struct::Stream::resolve_enum(DEVICE_MANUFACTURERS, @_io.read_u4be)
      self
    end
    attr_reader :device_manufacturer
  end
  class S15Fixed16Number < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @number = @_io.read_bytes(4)
      self
    end
    attr_reader :number
  end
  class PositionNumber < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @offset_to_data_element = @_io.read_u4be
      @size_of_data_element = @_io.read_u4be
      self
    end
    attr_reader :offset_to_data_element
    attr_reader :size_of_data_element
  end
  attr_reader :header
  attr_reader :tag_table
end

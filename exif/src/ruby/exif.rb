# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Exif < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @endianness = @_io.read_u2le
    @body = ExifBody.new(@_io, self, @_root)
    self
  end
  class ExifBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      case _root.endianness
      when 18761
        @_is_le = true
      when 19789
        @_is_le = false
      end

      if @_is_le == true
        _read_le
      elsif @_is_le == false
        _read_be
      else
        raise Kaitai::Struct::UndecidedEndiannessError.new("/types/exif_body")
      end
      self
    end

    def _read_le
      @version = @_io.read_u2le
      @ifd0_ofs = @_io.read_u4le
      self
    end

    def _read_be
      @version = @_io.read_u2be
      @ifd0_ofs = @_io.read_u4be
      self
    end
    class Ifd < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/exif_body/types/ifd")
        end
        self
      end

      def _read_le
        @num_fields = @_io.read_u2le
        @fields = Array.new(num_fields)
        (num_fields).times { |i|
          @fields[i] = IfdField.new(@_io, self, @_root, @_is_le)
        }
        @next_ifd_ofs = @_io.read_u4le
        self
      end

      def _read_be
        @num_fields = @_io.read_u2be
        @fields = Array.new(num_fields)
        (num_fields).times { |i|
          @fields[i] = IfdField.new(@_io, self, @_root, @_is_le)
        }
        @next_ifd_ofs = @_io.read_u4be
        self
      end
      def next_ifd
        return @next_ifd unless @next_ifd.nil?
        if next_ifd_ofs != 0
          _pos = @_io.pos
          @_io.seek(next_ifd_ofs)
          if @_is_le
            @next_ifd = Ifd.new(@_io, self, @_root, @_is_le)
          else
            @next_ifd = Ifd.new(@_io, self, @_root, @_is_le)
          end
          @_io.seek(_pos)
        end
        @next_ifd
      end
      attr_reader :num_fields
      attr_reader :fields
      attr_reader :next_ifd_ofs
    end
    class IfdField < Kaitai::Struct::Struct

      FIELD_TYPE_ENUM = {
        1 => :field_type_enum_byte,
        2 => :field_type_enum_ascii_string,
        3 => :field_type_enum_word,
        4 => :field_type_enum_dword,
        5 => :field_type_enum_rational,
        7 => :field_type_enum_undefined,
        9 => :field_type_enum_slong,
        10 => :field_type_enum_srational,
      }
      I__FIELD_TYPE_ENUM = FIELD_TYPE_ENUM.invert

      TAG_ENUM = {
        256 => :tag_enum_image_width,
        257 => :tag_enum_image_height,
        258 => :tag_enum_bits_per_sample,
        259 => :tag_enum_compression,
        262 => :tag_enum_photometric_interpretation,
        263 => :tag_enum_thresholding,
        264 => :tag_enum_cell_width,
        265 => :tag_enum_cell_length,
        266 => :tag_enum_fill_order,
        269 => :tag_enum_document_name,
        270 => :tag_enum_image_description,
        271 => :tag_enum_make,
        272 => :tag_enum_model,
        273 => :tag_enum_strip_offsets,
        274 => :tag_enum_orientation,
        277 => :tag_enum_samples_per_pixel,
        278 => :tag_enum_rows_per_strip,
        279 => :tag_enum_strip_byte_counts,
        280 => :tag_enum_min_sample_value,
        281 => :tag_enum_max_sample_value,
        282 => :tag_enum_x_resolution,
        283 => :tag_enum_y_resolution,
        284 => :tag_enum_planar_configuration,
        285 => :tag_enum_page_name,
        286 => :tag_enum_x_position,
        287 => :tag_enum_y_position,
        288 => :tag_enum_free_offsets,
        289 => :tag_enum_free_byte_counts,
        290 => :tag_enum_gray_response_unit,
        291 => :tag_enum_gray_response_curve,
        292 => :tag_enum_t4_options,
        293 => :tag_enum_t6_options,
        296 => :tag_enum_resolution_unit,
        297 => :tag_enum_page_number,
        300 => :tag_enum_color_response_unit,
        301 => :tag_enum_transfer_function,
        305 => :tag_enum_software,
        306 => :tag_enum_modify_date,
        315 => :tag_enum_artist,
        316 => :tag_enum_host_computer,
        317 => :tag_enum_predictor,
        318 => :tag_enum_white_point,
        319 => :tag_enum_primary_chromaticities,
        320 => :tag_enum_color_map,
        321 => :tag_enum_halftone_hints,
        322 => :tag_enum_tile_width,
        323 => :tag_enum_tile_length,
        324 => :tag_enum_tile_offsets,
        325 => :tag_enum_tile_byte_counts,
        326 => :tag_enum_bad_fax_lines,
        327 => :tag_enum_clean_fax_data,
        328 => :tag_enum_consecutive_bad_fax_lines,
        330 => :tag_enum_sub_ifd,
        332 => :tag_enum_ink_set,
        333 => :tag_enum_ink_names,
        334 => :tag_enum_numberof_inks,
        336 => :tag_enum_dot_range,
        337 => :tag_enum_target_printer,
        338 => :tag_enum_extra_samples,
        339 => :tag_enum_sample_format,
        340 => :tag_enum_s_min_sample_value,
        341 => :tag_enum_s_max_sample_value,
        342 => :tag_enum_transfer_range,
        343 => :tag_enum_clip_path,
        344 => :tag_enum_x_clip_path_units,
        345 => :tag_enum_y_clip_path_units,
        346 => :tag_enum_indexed,
        347 => :tag_enum_jpeg_tables,
        351 => :tag_enum_opi_proxy,
        400 => :tag_enum_global_parameters_ifd,
        401 => :tag_enum_profile_type,
        402 => :tag_enum_fax_profile,
        403 => :tag_enum_coding_methods,
        404 => :tag_enum_version_year,
        405 => :tag_enum_mode_number,
        433 => :tag_enum_decode,
        434 => :tag_enum_default_image_color,
        435 => :tag_enum_t82_options,
        437 => :tag_enum_jpeg_tables2,
        512 => :tag_enum_jpeg_proc,
        513 => :tag_enum_thumbnail_offset,
        514 => :tag_enum_thumbnail_length,
        515 => :tag_enum_jpeg_restart_interval,
        517 => :tag_enum_jpeg_lossless_predictors,
        518 => :tag_enum_jpeg_point_transforms,
        519 => :tag_enum_jpegq_tables,
        520 => :tag_enum_jpegdc_tables,
        521 => :tag_enum_jpegac_tables,
        529 => :tag_enum_y_cb_cr_coefficients,
        530 => :tag_enum_y_cb_cr_sub_sampling,
        531 => :tag_enum_y_cb_cr_positioning,
        532 => :tag_enum_reference_black_white,
        559 => :tag_enum_strip_row_counts,
        700 => :tag_enum_application_notes,
        999 => :tag_enum_uspto_miscellaneous,
        4096 => :tag_enum_related_image_file_format,
        4097 => :tag_enum_related_image_width,
        4098 => :tag_enum_related_image_height,
        18246 => :tag_enum_rating,
        18247 => :tag_enum_xp_dip_xml,
        18248 => :tag_enum_stitch_info,
        18249 => :tag_enum_rating_percent,
        28672 => :tag_enum_sony_raw_file_type,
        28722 => :tag_enum_light_falloff_params,
        28725 => :tag_enum_chromatic_aberration_corr_params,
        28727 => :tag_enum_distortion_corr_params,
        32781 => :tag_enum_image_id,
        32931 => :tag_enum_wang_tag1,
        32932 => :tag_enum_wang_annotation,
        32933 => :tag_enum_wang_tag3,
        32934 => :tag_enum_wang_tag4,
        32953 => :tag_enum_image_reference_points,
        32954 => :tag_enum_region_xform_tack_point,
        32955 => :tag_enum_warp_quadrilateral,
        32956 => :tag_enum_affine_transform_mat,
        32995 => :tag_enum_matteing,
        32996 => :tag_enum_data_type,
        32997 => :tag_enum_image_depth,
        32998 => :tag_enum_tile_depth,
        33300 => :tag_enum_image_full_width,
        33301 => :tag_enum_image_full_height,
        33302 => :tag_enum_texture_format,
        33303 => :tag_enum_wrap_modes,
        33304 => :tag_enum_fov_cot,
        33305 => :tag_enum_matrix_world_to_screen,
        33306 => :tag_enum_matrix_world_to_camera,
        33405 => :tag_enum_model2,
        33421 => :tag_enum_cfa_repeat_pattern_dim,
        33422 => :tag_enum_cfa_pattern2,
        33423 => :tag_enum_battery_level,
        33424 => :tag_enum_kodak_ifd,
        33432 => :tag_enum_copyright,
        33434 => :tag_enum_exposure_time,
        33437 => :tag_enum_f_number,
        33445 => :tag_enum_md_file_tag,
        33446 => :tag_enum_md_scale_pixel,
        33447 => :tag_enum_md_color_table,
        33448 => :tag_enum_md_lab_name,
        33449 => :tag_enum_md_sample_info,
        33450 => :tag_enum_md_prep_date,
        33451 => :tag_enum_md_prep_time,
        33452 => :tag_enum_md_file_units,
        33550 => :tag_enum_pixel_scale,
        33589 => :tag_enum_advent_scale,
        33590 => :tag_enum_advent_revision,
        33628 => :tag_enum_uic1_tag,
        33629 => :tag_enum_uic2_tag,
        33630 => :tag_enum_uic3_tag,
        33631 => :tag_enum_uic4_tag,
        33723 => :tag_enum_iptc_naa,
        33918 => :tag_enum_intergraph_packet_data,
        33919 => :tag_enum_intergraph_flag_registers,
        33920 => :tag_enum_intergraph_matrix,
        33921 => :tag_enum_ingr_reserved,
        33922 => :tag_enum_model_tie_point,
        34016 => :tag_enum_site,
        34017 => :tag_enum_color_sequence,
        34018 => :tag_enum_it8_header,
        34019 => :tag_enum_raster_padding,
        34020 => :tag_enum_bits_per_run_length,
        34021 => :tag_enum_bits_per_extended_run_length,
        34022 => :tag_enum_color_table,
        34023 => :tag_enum_image_color_indicator,
        34024 => :tag_enum_background_color_indicator,
        34025 => :tag_enum_image_color_value,
        34026 => :tag_enum_background_color_value,
        34027 => :tag_enum_pixel_intensity_range,
        34028 => :tag_enum_transparency_indicator,
        34029 => :tag_enum_color_characterization,
        34030 => :tag_enum_hc_usage,
        34031 => :tag_enum_trap_indicator,
        34032 => :tag_enum_cmyk_equivalent,
        34118 => :tag_enum_sem_info,
        34152 => :tag_enum_afcp_iptc,
        34232 => :tag_enum_pixel_magic_jbig_options,
        34263 => :tag_enum_jpl_carto_ifd,
        34264 => :tag_enum_model_transform,
        34306 => :tag_enum_wb_grgb_levels,
        34310 => :tag_enum_leaf_data,
        34377 => :tag_enum_photoshop_settings,
        34665 => :tag_enum_exif_offset,
        34675 => :tag_enum_icc_profile,
        34687 => :tag_enum_tiff_fx_extensions,
        34688 => :tag_enum_multi_profiles,
        34689 => :tag_enum_shared_data,
        34690 => :tag_enum_t88_options,
        34732 => :tag_enum_image_layer,
        34735 => :tag_enum_geo_tiff_directory,
        34736 => :tag_enum_geo_tiff_double_params,
        34737 => :tag_enum_geo_tiff_ascii_params,
        34750 => :tag_enum_jbig_options,
        34850 => :tag_enum_exposure_program,
        34852 => :tag_enum_spectral_sensitivity,
        34853 => :tag_enum_gps_info,
        34855 => :tag_enum_iso,
        34856 => :tag_enum_opto_electric_conv_factor,
        34857 => :tag_enum_interlace,
        34858 => :tag_enum_time_zone_offset,
        34859 => :tag_enum_self_timer_mode,
        34864 => :tag_enum_sensitivity_type,
        34865 => :tag_enum_standard_output_sensitivity,
        34866 => :tag_enum_recommended_exposure_index,
        34867 => :tag_enum_iso_speed,
        34868 => :tag_enum_iso_speed_latitudeyyy,
        34869 => :tag_enum_iso_speed_latitudezzz,
        34908 => :tag_enum_fax_recv_params,
        34909 => :tag_enum_fax_sub_address,
        34910 => :tag_enum_fax_recv_time,
        34929 => :tag_enum_fedex_edr,
        34954 => :tag_enum_leaf_sub_ifd,
        36864 => :tag_enum_exif_version,
        36867 => :tag_enum_date_time_original,
        36868 => :tag_enum_create_date,
        36873 => :tag_enum_google_plus_upload_code,
        36880 => :tag_enum_offset_time,
        36881 => :tag_enum_offset_time_original,
        36882 => :tag_enum_offset_time_digitized,
        37121 => :tag_enum_components_configuration,
        37122 => :tag_enum_compressed_bits_per_pixel,
        37377 => :tag_enum_shutter_speed_value,
        37378 => :tag_enum_aperture_value,
        37379 => :tag_enum_brightness_value,
        37380 => :tag_enum_exposure_compensation,
        37381 => :tag_enum_max_aperture_value,
        37382 => :tag_enum_subject_distance,
        37383 => :tag_enum_metering_mode,
        37384 => :tag_enum_light_source,
        37385 => :tag_enum_flash,
        37386 => :tag_enum_focal_length,
        37387 => :tag_enum_flash_energy,
        37388 => :tag_enum_spatial_frequency_response,
        37389 => :tag_enum_noise,
        37390 => :tag_enum_focal_plane_x_resolution,
        37391 => :tag_enum_focal_plane_y_resolution,
        37392 => :tag_enum_focal_plane_resolution_unit,
        37393 => :tag_enum_image_number,
        37394 => :tag_enum_security_classification,
        37395 => :tag_enum_image_history,
        37396 => :tag_enum_subject_area,
        37397 => :tag_enum_exposure_index,
        37398 => :tag_enum_tiff_ep_standard_id,
        37399 => :tag_enum_sensing_method,
        37434 => :tag_enum_cip3_data_file,
        37435 => :tag_enum_cip3_sheet,
        37436 => :tag_enum_cip3_side,
        37439 => :tag_enum_sto_nits,
        37500 => :tag_enum_maker_note,
        37510 => :tag_enum_user_comment,
        37520 => :tag_enum_sub_sec_time,
        37521 => :tag_enum_sub_sec_time_original,
        37522 => :tag_enum_sub_sec_time_digitized,
        37679 => :tag_enum_ms_document_text,
        37680 => :tag_enum_ms_property_set_storage,
        37681 => :tag_enum_ms_document_text_position,
        37724 => :tag_enum_image_source_data,
        37888 => :tag_enum_ambient_temperature,
        37889 => :tag_enum_humidity,
        37890 => :tag_enum_pressure,
        37891 => :tag_enum_water_depth,
        37892 => :tag_enum_acceleration,
        37893 => :tag_enum_camera_elevation_angle,
        40091 => :tag_enum_xp_title,
        40092 => :tag_enum_xp_comment,
        40093 => :tag_enum_xp_author,
        40094 => :tag_enum_xp_keywords,
        40095 => :tag_enum_xp_subject,
        40960 => :tag_enum_flashpix_version,
        40961 => :tag_enum_color_space,
        40962 => :tag_enum_exif_image_width,
        40963 => :tag_enum_exif_image_height,
        40964 => :tag_enum_related_sound_file,
        40965 => :tag_enum_interop_offset,
        40976 => :tag_enum_samsung_raw_pointers_offset,
        40977 => :tag_enum_samsung_raw_pointers_length,
        41217 => :tag_enum_samsung_raw_byte_order,
        41218 => :tag_enum_samsung_raw_unknown,
        41483 => :tag_enum_flash_energy2,
        41484 => :tag_enum_spatial_frequency_response2,
        41485 => :tag_enum_noise2,
        41486 => :tag_enum_focal_plane_x_resolution2,
        41487 => :tag_enum_focal_plane_y_resolution2,
        41488 => :tag_enum_focal_plane_resolution_unit2,
        41489 => :tag_enum_image_number2,
        41490 => :tag_enum_security_classification2,
        41491 => :tag_enum_image_history2,
        41492 => :tag_enum_subject_location,
        41493 => :tag_enum_exposure_index2,
        41494 => :tag_enum_tiff_ep_standard_id2,
        41495 => :tag_enum_sensing_method2,
        41728 => :tag_enum_file_source,
        41729 => :tag_enum_scene_type,
        41730 => :tag_enum_cfa_pattern,
        41985 => :tag_enum_custom_rendered,
        41986 => :tag_enum_exposure_mode,
        41987 => :tag_enum_white_balance,
        41988 => :tag_enum_digital_zoom_ratio,
        41989 => :tag_enum_focal_length_in35mm_format,
        41990 => :tag_enum_scene_capture_type,
        41991 => :tag_enum_gain_control,
        41992 => :tag_enum_contrast,
        41993 => :tag_enum_saturation,
        41994 => :tag_enum_sharpness,
        41995 => :tag_enum_device_setting_description,
        41996 => :tag_enum_subject_distance_range,
        42016 => :tag_enum_image_unique_id,
        42032 => :tag_enum_owner_name,
        42033 => :tag_enum_serial_number,
        42034 => :tag_enum_lens_info,
        42035 => :tag_enum_lens_make,
        42036 => :tag_enum_lens_model,
        42037 => :tag_enum_lens_serial_number,
        42112 => :tag_enum_gdal_metadata,
        42113 => :tag_enum_gdal_no_data,
        42240 => :tag_enum_gamma,
        44992 => :tag_enum_expand_software,
        44993 => :tag_enum_expand_lens,
        44994 => :tag_enum_expand_film,
        44995 => :tag_enum_expand_filter_lens,
        44996 => :tag_enum_expand_scanner,
        44997 => :tag_enum_expand_flash_lamp,
        48129 => :tag_enum_pixel_format,
        48130 => :tag_enum_transformation,
        48131 => :tag_enum_uncompressed,
        48132 => :tag_enum_image_type,
        48256 => :tag_enum_image_width2,
        48257 => :tag_enum_image_height2,
        48258 => :tag_enum_width_resolution,
        48259 => :tag_enum_height_resolution,
        48320 => :tag_enum_image_offset,
        48321 => :tag_enum_image_byte_count,
        48322 => :tag_enum_alpha_offset,
        48323 => :tag_enum_alpha_byte_count,
        48324 => :tag_enum_image_data_discard,
        48325 => :tag_enum_alpha_data_discard,
        50215 => :tag_enum_oce_scanjob_desc,
        50216 => :tag_enum_oce_application_selector,
        50217 => :tag_enum_oce_id_number,
        50218 => :tag_enum_oce_image_logic,
        50255 => :tag_enum_annotations,
        50341 => :tag_enum_print_im,
        50547 => :tag_enum_original_file_name,
        50560 => :tag_enum_uspto_original_content_type,
        50706 => :tag_enum_dng_version,
        50707 => :tag_enum_dng_backward_version,
        50708 => :tag_enum_unique_camera_model,
        50709 => :tag_enum_localized_camera_model,
        50710 => :tag_enum_cfa_plane_color,
        50711 => :tag_enum_cfa_layout,
        50712 => :tag_enum_linearization_table,
        50713 => :tag_enum_black_level_repeat_dim,
        50714 => :tag_enum_black_level,
        50715 => :tag_enum_black_level_delta_h,
        50716 => :tag_enum_black_level_delta_v,
        50717 => :tag_enum_white_level,
        50718 => :tag_enum_default_scale,
        50719 => :tag_enum_default_crop_origin,
        50720 => :tag_enum_default_crop_size,
        50721 => :tag_enum_color_matrix1,
        50722 => :tag_enum_color_matrix2,
        50723 => :tag_enum_camera_calibration1,
        50724 => :tag_enum_camera_calibration2,
        50725 => :tag_enum_reduction_matrix1,
        50726 => :tag_enum_reduction_matrix2,
        50727 => :tag_enum_analog_balance,
        50728 => :tag_enum_as_shot_neutral,
        50729 => :tag_enum_as_shot_white_xy,
        50730 => :tag_enum_baseline_exposure,
        50731 => :tag_enum_baseline_noise,
        50732 => :tag_enum_baseline_sharpness,
        50733 => :tag_enum_bayer_green_split,
        50734 => :tag_enum_linear_response_limit,
        50735 => :tag_enum_camera_serial_number,
        50736 => :tag_enum_dng_lens_info,
        50737 => :tag_enum_chroma_blur_radius,
        50738 => :tag_enum_anti_alias_strength,
        50739 => :tag_enum_shadow_scale,
        50740 => :tag_enum_sr2_private,
        50741 => :tag_enum_maker_note_safety,
        50752 => :tag_enum_raw_image_segmentation,
        50778 => :tag_enum_calibration_illuminant1,
        50779 => :tag_enum_calibration_illuminant2,
        50780 => :tag_enum_best_quality_scale,
        50781 => :tag_enum_raw_data_unique_id,
        50784 => :tag_enum_alias_layer_metadata,
        50827 => :tag_enum_original_raw_file_name,
        50828 => :tag_enum_original_raw_file_data,
        50829 => :tag_enum_active_area,
        50830 => :tag_enum_masked_areas,
        50831 => :tag_enum_as_shot_icc_profile,
        50832 => :tag_enum_as_shot_pre_profile_matrix,
        50833 => :tag_enum_current_icc_profile,
        50834 => :tag_enum_current_pre_profile_matrix,
        50879 => :tag_enum_colorimetric_reference,
        50885 => :tag_enum_s_raw_type,
        50898 => :tag_enum_panasonic_title,
        50899 => :tag_enum_panasonic_title2,
        50931 => :tag_enum_camera_calibration_sig,
        50932 => :tag_enum_profile_calibration_sig,
        50933 => :tag_enum_profile_ifd,
        50934 => :tag_enum_as_shot_profile_name,
        50935 => :tag_enum_noise_reduction_applied,
        50936 => :tag_enum_profile_name,
        50937 => :tag_enum_profile_hue_sat_map_dims,
        50938 => :tag_enum_profile_hue_sat_map_data1,
        50939 => :tag_enum_profile_hue_sat_map_data2,
        50940 => :tag_enum_profile_tone_curve,
        50941 => :tag_enum_profile_embed_policy,
        50942 => :tag_enum_profile_copyright,
        50964 => :tag_enum_forward_matrix1,
        50965 => :tag_enum_forward_matrix2,
        50966 => :tag_enum_preview_application_name,
        50967 => :tag_enum_preview_application_version,
        50968 => :tag_enum_preview_settings_name,
        50969 => :tag_enum_preview_settings_digest,
        50970 => :tag_enum_preview_color_space,
        50971 => :tag_enum_preview_date_time,
        50972 => :tag_enum_raw_image_digest,
        50973 => :tag_enum_original_raw_file_digest,
        50974 => :tag_enum_sub_tile_block_size,
        50975 => :tag_enum_row_interleave_factor,
        50981 => :tag_enum_profile_look_table_dims,
        50982 => :tag_enum_profile_look_table_data,
        51008 => :tag_enum_opcode_list1,
        51009 => :tag_enum_opcode_list2,
        51022 => :tag_enum_opcode_list3,
        51041 => :tag_enum_noise_profile,
        51043 => :tag_enum_time_codes,
        51044 => :tag_enum_frame_rate,
        51058 => :tag_enum_t_stop,
        51081 => :tag_enum_reel_name,
        51089 => :tag_enum_original_default_final_size,
        51090 => :tag_enum_original_best_quality_size,
        51091 => :tag_enum_original_default_crop_size,
        51105 => :tag_enum_camera_label,
        51107 => :tag_enum_profile_hue_sat_map_encoding,
        51108 => :tag_enum_profile_look_table_encoding,
        51109 => :tag_enum_baseline_exposure_offset,
        51110 => :tag_enum_default_black_render,
        51111 => :tag_enum_new_raw_image_digest,
        51112 => :tag_enum_raw_to_preview_gain,
        51125 => :tag_enum_default_user_crop,
        59932 => :tag_enum_padding,
        59933 => :tag_enum_offset_schema,
        65000 => :tag_enum_owner_name2,
        65001 => :tag_enum_serial_number2,
        65002 => :tag_enum_lens,
        65024 => :tag_enum_kdc_ifd,
        65100 => :tag_enum_raw_file,
        65101 => :tag_enum_converter,
        65102 => :tag_enum_white_balance2,
        65105 => :tag_enum_exposure,
        65106 => :tag_enum_shadows,
        65107 => :tag_enum_brightness,
        65108 => :tag_enum_contrast2,
        65109 => :tag_enum_saturation2,
        65110 => :tag_enum_sharpness2,
        65111 => :tag_enum_smoothness,
        65112 => :tag_enum_moire_filter,
      }
      I__TAG_ENUM = TAG_ENUM.invert
      def initialize(_io, _parent = nil, _root = self, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/exif_body/types/ifd_field")
        end
        self
      end

      def _read_le
        @tag = Kaitai::Struct::Stream::resolve_enum(TAG_ENUM, @_io.read_u2le)
        @field_type = Kaitai::Struct::Stream::resolve_enum(FIELD_TYPE_ENUM, @_io.read_u2le)
        @length = @_io.read_u4le
        @ofs_or_data = @_io.read_u4le
        self
      end

      def _read_be
        @tag = Kaitai::Struct::Stream::resolve_enum(TAG_ENUM, @_io.read_u2be)
        @field_type = Kaitai::Struct::Stream::resolve_enum(FIELD_TYPE_ENUM, @_io.read_u2be)
        @length = @_io.read_u4be
        @ofs_or_data = @_io.read_u4be
        self
      end
      def type_byte_length
        return @type_byte_length unless @type_byte_length.nil?
        @type_byte_length = (field_type == :field_type_enum_word ? 2 : (field_type == :field_type_enum_dword ? 4 : 1))
        @type_byte_length
      end
      def byte_length
        return @byte_length unless @byte_length.nil?
        @byte_length = (length * type_byte_length)
        @byte_length
      end
      def is_immediate_data
        return @is_immediate_data unless @is_immediate_data.nil?
        @is_immediate_data = byte_length <= 4
        @is_immediate_data
      end
      def data
        return @data unless @data.nil?
        if !(is_immediate_data)
          io = _root._io
          _pos = io.pos
          io.seek(ofs_or_data)
          if @_is_le
            @data = io.read_bytes(byte_length)
          else
            @data = io.read_bytes(byte_length)
          end
          io.seek(_pos)
        end
        @data
      end
      attr_reader :tag
      attr_reader :field_type
      attr_reader :length
      attr_reader :ofs_or_data
    end
    def ifd0
      return @ifd0 unless @ifd0.nil?
      _pos = @_io.pos
      @_io.seek(ifd0_ofs)
      if @_is_le
        @ifd0 = Ifd.new(@_io, self, @_root, @_is_le)
      else
        @ifd0 = Ifd.new(@_io, self, @_root, @_is_le)
      end
      @_io.seek(_pos)
      @ifd0
    end
    attr_reader :version
    attr_reader :ifd0_ofs
  end
  attr_reader :endianness
  attr_reader :body
end

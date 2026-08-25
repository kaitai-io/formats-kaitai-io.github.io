# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Sample files (numbers in parentheses show how many files per extension contain
# Exif metadata out of the total):
# 
# * <https://github.com/ianare/exif-py/tree/a69bf74770caf6b333221658f5092ed69f99faac/tests/resources/jpg> (84/93 .jpg, 1/1 .jpeg)
# * <https://github.com/exiftool/exiftool/tree/2200871d9cef988051d2a99d67df3bda6cbb30a8/t/images> (34/41 .jpg, 0/1 .png)
# * <https://github.com/Exiv2/exiv2/tree/648ada43dcb35ce6077f38183ace52d5e2071f64/test/data> (85/155 .jpg, 5/23 .png)
# * <https://github.com/python-pillow/Pillow/tree/807d689a83738027b6f6e0f219a6a6dd30e01c08/Tests/images> (36/55 .jpg, 3/420 .png)
# * <https://github.com/drewnoakes/metadata-extractor-images/tree/651ad0e67aa8d43d358ad05f9bc07b52d8b9ac6e/jpg> (335/430 .jpg)
# * <https://github.com/libexif/libexif-testsuite/tree/8c1f5bbc18d2cbc80b01b3f9b3eb29546310acf2> (15/18 .jpg)
# @see https://www.cipa.jp/std/documents/download_e.html?CIPA_DC-008-2026-E Exif Version 3.1
# @see https://www.cipa.jp/std/documents/download_e.html?CIPA_DC-008-2024-E Exif Version 3.0
# @see https://web.archive.org/web/20190624045241id_/https://www.cipa.jp/std/documents/e/DC-008-Translation-2019-E.pdf Exif Version 2.32
# @see https://web.archive.org/web/20190712232333id_/https://www.cipa.jp/std/documents/e/DC-008-Translation-2016-E.pdf Exif Version 2.31
# @see https://www.cipa.jp/std/documents/e/DC-008-2012_E_C.pdf Exif Version 2.3 (with Corrigendum at the end)
# @see https://web.archive.org/web/20051228234707id_/https://tsc.jeita.or.jp/avs/data/cp3451_1.pdf Exif Version 2.21 (2003 draft)
# @see https://web.archive.org/web/20131018091152id_/https://exif.org/Exif2-2.PDF Exif Version 2.2
# @see https://web.archive.org/web/20131111073619id_/https://exif.org/Exif2-1.PDF Exif Version 2.1
class Exif < Kaitai::Struct::Struct

  FIELD_TYPE = {
    1 => :field_type_byte,
    2 => :field_type_ascii,
    3 => :field_type_short,
    4 => :field_type_long,
    5 => :field_type_rational,
    6 => :field_type_sbyte,
    7 => :field_type_undefined,
    8 => :field_type_sshort,
    9 => :field_type_slong,
    10 => :field_type_srational,
    11 => :field_type_float,
    12 => :field_type_double,
    13 => :field_type_ifd,
    129 => :field_type_utf8,
  }
  I__FIELD_TYPE = FIELD_TYPE.invert

  GPS_TAG = {
    0 => :gps_tag_gps_version_id,
    1 => :gps_tag_gps_latitude_ref,
    2 => :gps_tag_gps_latitude,
    3 => :gps_tag_gps_longitude_ref,
    4 => :gps_tag_gps_longitude,
    5 => :gps_tag_gps_altitude_ref,
    6 => :gps_tag_gps_altitude,
    7 => :gps_tag_gps_time_stamp,
    8 => :gps_tag_gps_satellites,
    9 => :gps_tag_gps_status,
    10 => :gps_tag_gps_measure_mode,
    11 => :gps_tag_gps_dop,
    12 => :gps_tag_gps_speed_ref,
    13 => :gps_tag_gps_speed,
    14 => :gps_tag_gps_track_ref,
    15 => :gps_tag_gps_track,
    16 => :gps_tag_gps_img_direction_ref,
    17 => :gps_tag_gps_img_direction,
    18 => :gps_tag_gps_map_datum,
    19 => :gps_tag_gps_dest_latitude_ref,
    20 => :gps_tag_gps_dest_latitude,
    21 => :gps_tag_gps_dest_longitude_ref,
    22 => :gps_tag_gps_dest_longitude,
    23 => :gps_tag_gps_dest_bearing_ref,
    24 => :gps_tag_gps_dest_bearing,
    25 => :gps_tag_gps_dest_distance_ref,
    26 => :gps_tag_gps_dest_distance,
    27 => :gps_tag_gps_processing_method,
    28 => :gps_tag_gps_area_information,
    29 => :gps_tag_gps_date_stamp,
    30 => :gps_tag_gps_differential,
    31 => :gps_tag_gps_h_positioning_error,
  }
  I__GPS_TAG = GPS_TAG.invert

  TAG = {
    1 => :tag_interop_index,
    2 => :tag_interop_version,
    256 => :tag_image_width,
    257 => :tag_image_height,
    258 => :tag_bits_per_sample,
    259 => :tag_compression,
    262 => :tag_photometric_interpretation,
    263 => :tag_thresholding,
    264 => :tag_cell_width,
    265 => :tag_cell_length,
    266 => :tag_fill_order,
    269 => :tag_document_name,
    270 => :tag_image_description,
    271 => :tag_make,
    272 => :tag_model,
    273 => :tag_strip_offsets,
    274 => :tag_orientation,
    277 => :tag_samples_per_pixel,
    278 => :tag_rows_per_strip,
    279 => :tag_strip_byte_counts,
    280 => :tag_min_sample_value,
    281 => :tag_max_sample_value,
    282 => :tag_x_resolution,
    283 => :tag_y_resolution,
    284 => :tag_planar_configuration,
    285 => :tag_page_name,
    286 => :tag_x_position,
    287 => :tag_y_position,
    288 => :tag_free_offsets,
    289 => :tag_free_byte_counts,
    290 => :tag_gray_response_unit,
    291 => :tag_gray_response_curve,
    292 => :tag_t4_options,
    293 => :tag_t6_options,
    296 => :tag_resolution_unit,
    297 => :tag_page_number,
    300 => :tag_color_response_unit,
    301 => :tag_transfer_function,
    305 => :tag_software,
    306 => :tag_modify_date,
    315 => :tag_artist,
    316 => :tag_host_computer,
    317 => :tag_predictor,
    318 => :tag_white_point,
    319 => :tag_primary_chromaticities,
    320 => :tag_color_map,
    321 => :tag_halftone_hints,
    322 => :tag_tile_width,
    323 => :tag_tile_length,
    324 => :tag_tile_offsets,
    325 => :tag_tile_byte_counts,
    326 => :tag_bad_fax_lines,
    327 => :tag_clean_fax_data,
    328 => :tag_consecutive_bad_fax_lines,
    330 => :tag_sub_ifd,
    332 => :tag_ink_set,
    333 => :tag_ink_names,
    334 => :tag_numberof_inks,
    336 => :tag_dot_range,
    337 => :tag_target_printer,
    338 => :tag_extra_samples,
    339 => :tag_sample_format,
    340 => :tag_s_min_sample_value,
    341 => :tag_s_max_sample_value,
    342 => :tag_transfer_range,
    343 => :tag_clip_path,
    344 => :tag_x_clip_path_units,
    345 => :tag_y_clip_path_units,
    346 => :tag_indexed,
    347 => :tag_jpeg_tables,
    351 => :tag_opi_proxy,
    400 => :tag_global_parameters_ifd,
    401 => :tag_profile_type,
    402 => :tag_fax_profile,
    403 => :tag_coding_methods,
    404 => :tag_version_year,
    405 => :tag_mode_number,
    433 => :tag_decode,
    434 => :tag_default_image_color,
    435 => :tag_t82_options,
    437 => :tag_jpeg_tables2,
    512 => :tag_jpeg_proc,
    513 => :tag_thumbnail_offset,
    514 => :tag_thumbnail_length,
    515 => :tag_jpeg_restart_interval,
    517 => :tag_jpeg_lossless_predictors,
    518 => :tag_jpeg_point_transforms,
    519 => :tag_jpegq_tables,
    520 => :tag_jpegdc_tables,
    521 => :tag_jpegac_tables,
    529 => :tag_y_cb_cr_coefficients,
    530 => :tag_y_cb_cr_sub_sampling,
    531 => :tag_y_cb_cr_positioning,
    532 => :tag_reference_black_white,
    559 => :tag_strip_row_counts,
    700 => :tag_application_notes,
    999 => :tag_uspto_miscellaneous,
    4096 => :tag_related_image_file_format,
    4097 => :tag_related_image_width,
    4098 => :tag_related_image_height,
    18246 => :tag_rating,
    18247 => :tag_xp_dip_xml,
    18248 => :tag_stitch_info,
    18249 => :tag_rating_percent,
    28672 => :tag_sony_raw_file_type,
    28722 => :tag_light_falloff_params,
    28725 => :tag_chromatic_aberration_corr_params,
    28727 => :tag_distortion_corr_params,
    32781 => :tag_image_id,
    32931 => :tag_wang_tag1,
    32932 => :tag_wang_annotation,
    32933 => :tag_wang_tag3,
    32934 => :tag_wang_tag4,
    32953 => :tag_image_reference_points,
    32954 => :tag_region_xform_tack_point,
    32955 => :tag_warp_quadrilateral,
    32956 => :tag_affine_transform_mat,
    32995 => :tag_matteing,
    32996 => :tag_data_type,
    32997 => :tag_image_depth,
    32998 => :tag_tile_depth,
    33300 => :tag_image_full_width,
    33301 => :tag_image_full_height,
    33302 => :tag_texture_format,
    33303 => :tag_wrap_modes,
    33304 => :tag_fov_cot,
    33305 => :tag_matrix_world_to_screen,
    33306 => :tag_matrix_world_to_camera,
    33405 => :tag_model2,
    33421 => :tag_cfa_repeat_pattern_dim,
    33422 => :tag_cfa_pattern2,
    33423 => :tag_battery_level,
    33424 => :tag_kodak_ifd,
    33432 => :tag_copyright,
    33434 => :tag_exposure_time,
    33437 => :tag_f_number,
    33445 => :tag_md_file_tag,
    33446 => :tag_md_scale_pixel,
    33447 => :tag_md_color_table,
    33448 => :tag_md_lab_name,
    33449 => :tag_md_sample_info,
    33450 => :tag_md_prep_date,
    33451 => :tag_md_prep_time,
    33452 => :tag_md_file_units,
    33550 => :tag_pixel_scale,
    33589 => :tag_advent_scale,
    33590 => :tag_advent_revision,
    33628 => :tag_uic1_tag,
    33629 => :tag_uic2_tag,
    33630 => :tag_uic3_tag,
    33631 => :tag_uic4_tag,
    33723 => :tag_iptc_naa,
    33918 => :tag_intergraph_packet_data,
    33919 => :tag_intergraph_flag_registers,
    33920 => :tag_intergraph_matrix,
    33921 => :tag_ingr_reserved,
    33922 => :tag_model_tie_point,
    34016 => :tag_site,
    34017 => :tag_color_sequence,
    34018 => :tag_it8_header,
    34019 => :tag_raster_padding,
    34020 => :tag_bits_per_run_length,
    34021 => :tag_bits_per_extended_run_length,
    34022 => :tag_color_table,
    34023 => :tag_image_color_indicator,
    34024 => :tag_background_color_indicator,
    34025 => :tag_image_color_value,
    34026 => :tag_background_color_value,
    34027 => :tag_pixel_intensity_range,
    34028 => :tag_transparency_indicator,
    34029 => :tag_color_characterization,
    34030 => :tag_hc_usage,
    34031 => :tag_trap_indicator,
    34032 => :tag_cmyk_equivalent,
    34118 => :tag_sem_info,
    34152 => :tag_afcp_iptc,
    34232 => :tag_pixel_magic_jbig_options,
    34263 => :tag_jpl_carto_ifd,
    34264 => :tag_model_transform,
    34306 => :tag_wb_grgb_levels,
    34310 => :tag_leaf_data,
    34377 => :tag_photoshop_settings,
    34665 => :tag_exif_offset,
    34675 => :tag_icc_profile,
    34687 => :tag_tiff_fx_extensions,
    34688 => :tag_multi_profiles,
    34689 => :tag_shared_data,
    34690 => :tag_t88_options,
    34732 => :tag_image_layer,
    34735 => :tag_geo_tiff_directory,
    34736 => :tag_geo_tiff_double_params,
    34737 => :tag_geo_tiff_ascii_params,
    34750 => :tag_jbig_options,
    34850 => :tag_exposure_program,
    34852 => :tag_spectral_sensitivity,
    34853 => :tag_gps_info,
    34855 => :tag_iso,
    34856 => :tag_opto_electric_conv_factor,
    34857 => :tag_interlace,
    34858 => :tag_time_zone_offset,
    34859 => :tag_self_timer_mode,
    34864 => :tag_sensitivity_type,
    34865 => :tag_standard_output_sensitivity,
    34866 => :tag_recommended_exposure_index,
    34867 => :tag_iso_speed,
    34868 => :tag_iso_speed_latitudeyyy,
    34869 => :tag_iso_speed_latitudezzz,
    34908 => :tag_fax_recv_params,
    34909 => :tag_fax_sub_address,
    34910 => :tag_fax_recv_time,
    34929 => :tag_fedex_edr,
    34954 => :tag_leaf_sub_ifd,
    36864 => :tag_exif_version,
    36867 => :tag_date_time_original,
    36868 => :tag_create_date,
    36873 => :tag_google_plus_upload_code,
    36880 => :tag_offset_time,
    36881 => :tag_offset_time_original,
    36882 => :tag_offset_time_digitized,
    37121 => :tag_components_configuration,
    37122 => :tag_compressed_bits_per_pixel,
    37377 => :tag_shutter_speed_value,
    37378 => :tag_aperture_value,
    37379 => :tag_brightness_value,
    37380 => :tag_exposure_compensation,
    37381 => :tag_max_aperture_value,
    37382 => :tag_subject_distance,
    37383 => :tag_metering_mode,
    37384 => :tag_light_source,
    37385 => :tag_flash,
    37386 => :tag_focal_length,
    37387 => :tag_flash_energy,
    37388 => :tag_spatial_frequency_response,
    37389 => :tag_noise,
    37390 => :tag_focal_plane_x_resolution,
    37391 => :tag_focal_plane_y_resolution,
    37392 => :tag_focal_plane_resolution_unit,
    37393 => :tag_image_number,
    37394 => :tag_security_classification,
    37395 => :tag_image_history,
    37396 => :tag_subject_area,
    37397 => :tag_exposure_index,
    37398 => :tag_tiff_ep_standard_id,
    37399 => :tag_sensing_method,
    37434 => :tag_cip3_data_file,
    37435 => :tag_cip3_sheet,
    37436 => :tag_cip3_side,
    37439 => :tag_sto_nits,
    37500 => :tag_maker_note,
    37510 => :tag_user_comment,
    37520 => :tag_sub_sec_time,
    37521 => :tag_sub_sec_time_original,
    37522 => :tag_sub_sec_time_digitized,
    37679 => :tag_ms_document_text,
    37680 => :tag_ms_property_set_storage,
    37681 => :tag_ms_document_text_position,
    37724 => :tag_image_source_data,
    37888 => :tag_ambient_temperature,
    37889 => :tag_humidity,
    37890 => :tag_pressure,
    37891 => :tag_water_depth,
    37892 => :tag_acceleration,
    37893 => :tag_camera_elevation_angle,
    40091 => :tag_xp_title,
    40092 => :tag_xp_comment,
    40093 => :tag_xp_author,
    40094 => :tag_xp_keywords,
    40095 => :tag_xp_subject,
    40960 => :tag_flashpix_version,
    40961 => :tag_color_space,
    40962 => :tag_exif_image_width,
    40963 => :tag_exif_image_height,
    40964 => :tag_related_sound_file,
    40965 => :tag_interop_offset,
    40976 => :tag_samsung_raw_pointers_offset,
    40977 => :tag_samsung_raw_pointers_length,
    41217 => :tag_samsung_raw_byte_order,
    41218 => :tag_samsung_raw_unknown,
    41483 => :tag_flash_energy2,
    41484 => :tag_spatial_frequency_response2,
    41485 => :tag_noise2,
    41486 => :tag_focal_plane_x_resolution2,
    41487 => :tag_focal_plane_y_resolution2,
    41488 => :tag_focal_plane_resolution_unit2,
    41489 => :tag_image_number2,
    41490 => :tag_security_classification2,
    41491 => :tag_image_history2,
    41492 => :tag_subject_location,
    41493 => :tag_exposure_index2,
    41494 => :tag_tiff_ep_standard_id2,
    41495 => :tag_sensing_method2,
    41728 => :tag_file_source,
    41729 => :tag_scene_type,
    41730 => :tag_cfa_pattern,
    41985 => :tag_custom_rendered,
    41986 => :tag_exposure_mode,
    41987 => :tag_white_balance,
    41988 => :tag_digital_zoom_ratio,
    41989 => :tag_focal_length_in35mm_format,
    41990 => :tag_scene_capture_type,
    41991 => :tag_gain_control,
    41992 => :tag_contrast,
    41993 => :tag_saturation,
    41994 => :tag_sharpness,
    41995 => :tag_device_setting_description,
    41996 => :tag_subject_distance_range,
    42016 => :tag_image_unique_id,
    42032 => :tag_owner_name,
    42033 => :tag_serial_number,
    42034 => :tag_lens_info,
    42035 => :tag_lens_make,
    42036 => :tag_lens_model,
    42037 => :tag_lens_serial_number,
    42112 => :tag_gdal_metadata,
    42113 => :tag_gdal_no_data,
    42240 => :tag_gamma,
    44992 => :tag_expand_software,
    44993 => :tag_expand_lens,
    44994 => :tag_expand_film,
    44995 => :tag_expand_filter_lens,
    44996 => :tag_expand_scanner,
    44997 => :tag_expand_flash_lamp,
    48129 => :tag_pixel_format,
    48130 => :tag_transformation,
    48131 => :tag_uncompressed,
    48132 => :tag_image_type,
    48256 => :tag_image_width2,
    48257 => :tag_image_height2,
    48258 => :tag_width_resolution,
    48259 => :tag_height_resolution,
    48320 => :tag_image_offset,
    48321 => :tag_image_byte_count,
    48322 => :tag_alpha_offset,
    48323 => :tag_alpha_byte_count,
    48324 => :tag_image_data_discard,
    48325 => :tag_alpha_data_discard,
    50215 => :tag_oce_scanjob_desc,
    50216 => :tag_oce_application_selector,
    50217 => :tag_oce_id_number,
    50218 => :tag_oce_image_logic,
    50255 => :tag_annotations,
    50341 => :tag_print_im,
    50547 => :tag_original_file_name,
    50560 => :tag_uspto_original_content_type,
    50706 => :tag_dng_version,
    50707 => :tag_dng_backward_version,
    50708 => :tag_unique_camera_model,
    50709 => :tag_localized_camera_model,
    50710 => :tag_cfa_plane_color,
    50711 => :tag_cfa_layout,
    50712 => :tag_linearization_table,
    50713 => :tag_black_level_repeat_dim,
    50714 => :tag_black_level,
    50715 => :tag_black_level_delta_h,
    50716 => :tag_black_level_delta_v,
    50717 => :tag_white_level,
    50718 => :tag_default_scale,
    50719 => :tag_default_crop_origin,
    50720 => :tag_default_crop_size,
    50721 => :tag_color_matrix1,
    50722 => :tag_color_matrix2,
    50723 => :tag_camera_calibration1,
    50724 => :tag_camera_calibration2,
    50725 => :tag_reduction_matrix1,
    50726 => :tag_reduction_matrix2,
    50727 => :tag_analog_balance,
    50728 => :tag_as_shot_neutral,
    50729 => :tag_as_shot_white_xy,
    50730 => :tag_baseline_exposure,
    50731 => :tag_baseline_noise,
    50732 => :tag_baseline_sharpness,
    50733 => :tag_bayer_green_split,
    50734 => :tag_linear_response_limit,
    50735 => :tag_camera_serial_number,
    50736 => :tag_dng_lens_info,
    50737 => :tag_chroma_blur_radius,
    50738 => :tag_anti_alias_strength,
    50739 => :tag_shadow_scale,
    50740 => :tag_sr2_private,
    50741 => :tag_maker_note_safety,
    50752 => :tag_raw_image_segmentation,
    50778 => :tag_calibration_illuminant1,
    50779 => :tag_calibration_illuminant2,
    50780 => :tag_best_quality_scale,
    50781 => :tag_raw_data_unique_id,
    50784 => :tag_alias_layer_metadata,
    50827 => :tag_original_raw_file_name,
    50828 => :tag_original_raw_file_data,
    50829 => :tag_active_area,
    50830 => :tag_masked_areas,
    50831 => :tag_as_shot_icc_profile,
    50832 => :tag_as_shot_pre_profile_matrix,
    50833 => :tag_current_icc_profile,
    50834 => :tag_current_pre_profile_matrix,
    50879 => :tag_colorimetric_reference,
    50885 => :tag_s_raw_type,
    50898 => :tag_panasonic_title,
    50899 => :tag_panasonic_title2,
    50931 => :tag_camera_calibration_sig,
    50932 => :tag_profile_calibration_sig,
    50933 => :tag_profile_ifd,
    50934 => :tag_as_shot_profile_name,
    50935 => :tag_noise_reduction_applied,
    50936 => :tag_profile_name,
    50937 => :tag_profile_hue_sat_map_dims,
    50938 => :tag_profile_hue_sat_map_data1,
    50939 => :tag_profile_hue_sat_map_data2,
    50940 => :tag_profile_tone_curve,
    50941 => :tag_profile_embed_policy,
    50942 => :tag_profile_copyright,
    50964 => :tag_forward_matrix1,
    50965 => :tag_forward_matrix2,
    50966 => :tag_preview_application_name,
    50967 => :tag_preview_application_version,
    50968 => :tag_preview_settings_name,
    50969 => :tag_preview_settings_digest,
    50970 => :tag_preview_color_space,
    50971 => :tag_preview_date_time,
    50972 => :tag_raw_image_digest,
    50973 => :tag_original_raw_file_digest,
    50974 => :tag_sub_tile_block_size,
    50975 => :tag_row_interleave_factor,
    50981 => :tag_profile_look_table_dims,
    50982 => :tag_profile_look_table_data,
    51008 => :tag_opcode_list1,
    51009 => :tag_opcode_list2,
    51022 => :tag_opcode_list3,
    51041 => :tag_noise_profile,
    51043 => :tag_time_codes,
    51044 => :tag_frame_rate,
    51058 => :tag_t_stop,
    51081 => :tag_reel_name,
    51089 => :tag_original_default_final_size,
    51090 => :tag_original_best_quality_size,
    51091 => :tag_original_default_crop_size,
    51105 => :tag_camera_label,
    51107 => :tag_profile_hue_sat_map_encoding,
    51108 => :tag_profile_look_table_encoding,
    51109 => :tag_baseline_exposure_offset,
    51110 => :tag_default_black_render,
    51111 => :tag_new_raw_image_digest,
    51112 => :tag_raw_to_preview_gain,
    51125 => :tag_default_user_crop,
    59932 => :tag_padding,
    59933 => :tag_offset_schema,
    65000 => :tag_owner_name2,
    65001 => :tag_serial_number2,
    65002 => :tag_lens,
    65024 => :tag_kdc_ifd,
    65100 => :tag_raw_file,
    65101 => :tag_converter,
    65102 => :tag_white_balance2,
    65105 => :tag_exposure,
    65106 => :tag_shadows,
    65107 => :tag_brightness,
    65108 => :tag_contrast2,
    65109 => :tag_saturation2,
    65110 => :tag_sharpness2,
    65111 => :tag_smoothness,
    65112 => :tag_moire_filter,
  }
  I__TAG = TAG.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @endianness = @_io.read_u2le
    @body = ExifBody.new(@_io, self, @_root)
    self
  end
  class ExifBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
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
      @magic = @_io.read_u2le
      raise Kaitai::Struct::ValidationNotEqualError.new(42, @magic, @_io, "/types/exif_body/seq/0") if not @magic == 42
      @ofs_ifd0 = @_io.read_u4le
      self
    end

    def _read_be
      @magic = @_io.read_u2be
      raise Kaitai::Struct::ValidationNotEqualError.new(42, @magic, @_io, "/types/exif_body/seq/0") if not @magic == 42
      @ofs_ifd0 = @_io.read_u4be
      self
    end
    class AsciiString < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
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
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/exif_body/types/ascii_string")
        end
        self
      end

      def _read_le
        @value = @_io.read_bytes_term(0, false, true, false)
        self
      end

      def _read_be
        @value = @_io.read_bytes_term(0, false, true, false)
        self
      end

      ##
      # According to the core Exif standard, this should be ASCII, but in
      # practice, this is not always the case. From
      # [ExifTool FAQ](https://exiftool.sourceforge.net/faq.html#Q10):
      # 
      # > However, it is not uncommon for applications to write UTF-8 or
      # other encodings where ASCII is expected.
      # 
      # Therefore, this field is a byte array, not a string. This is to
      # avoid non-ASCII characters being treated as errors in some target
      # languages, such as Python. The only assumption is that a null byte
      # terminates the value (although sometimes the null byte is missing,
      # which we tolerate thanks to the `eos-error: false` setting).
      # 
      # Here is a sample JPEG file with a `tag::image_description` IFD
      # field of type `field_type::ascii` that actually contains UTF-8:
      # <https://github.com/Exiv2/exiv2/blob/2cd987a731236037b6b78cbff897d08685a8ef49/test/data/exiv2-bug501.jpg>
      # 
      # It seems that most modern applications (e.g. GIMP 3.0.6) always
      # use UTF-8 when storing Exif metadata. However, there are also
      # files with a non-UTF-8 encoding, for example
      # <https://github.com/drewnoakes/metadata-extractor-images/blob/651ad0e67aa8d43d358ad05f9bc07b52d8b9ac6e/jpg/Ricoh%20DC-3Z%20(low%20res).jpg>
      # has a `tag::copyright` IFD field with a value encoded in
      # ISO-8859-1 (Latin-1).
      attr_reader :value
    end
    class Doubles < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
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
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/exif_body/types/doubles")
        end
        self
      end

      def _read_le
        @values = []
        (_parent.num_values).times { |i|
          @values << @_io.read_f8le
        }
        self
      end

      def _read_be
        @values = []
        (_parent.num_values).times { |i|
          @values << @_io.read_f8be
        }
        self
      end
      attr_reader :values
    end
    class Floats < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
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
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/exif_body/types/floats")
        end
        self
      end

      def _read_le
        @values = []
        (_parent.num_values).times { |i|
          @values << @_io.read_f4le
        }
        self
      end

      def _read_be
        @values = []
        (_parent.num_values).times { |i|
          @values << @_io.read_f4be
        }
        self
      end
      attr_reader :values
    end
    class Ifd < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil, is_gps_ifd)
        super(_io, _parent, _root)
        @_is_le = _is_le
        @is_gps_ifd = is_gps_ifd
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
        @_raw_fields = []
        @fields = []
        (num_fields).times { |i|
          _io_fields = @_io.substream(12)
          @fields << IfdField.new(_io_fields, self, @_root, @_is_le)
        }
        @ofs_next_ifd = @_io.read_u4le
        self
      end

      def _read_be
        @num_fields = @_io.read_u2be
        @_raw_fields = []
        @fields = []
        (num_fields).times { |i|
          _io_fields = @_io.substream(12)
          @fields << IfdField.new(_io_fields, self, @_root, @_is_le)
        }
        @ofs_next_ifd = @_io.read_u4be
        self
      end
      def next_ifd
        return @next_ifd unless @next_ifd.nil?
        if ofs_next_ifd != 0
          _pos = @_io.pos
          @_io.seek(ofs_next_ifd)
          if @_is_le
            @next_ifd = Ifd.new(@_io, self, @_root, @_is_le, is_gps_ifd)
          else
            @next_ifd = Ifd.new(@_io, self, @_root, @_is_le, is_gps_ifd)
          end
          @_io.seek(_pos)
        end
        @next_ifd
      end
      attr_reader :num_fields
      attr_reader :fields
      attr_reader :ofs_next_ifd
      attr_reader :is_gps_ifd
      attr_reader :_raw_fields
    end
    class IfdField < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
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
        @tag_raw = @_io.read_u2le
        @field_type = Kaitai::Struct::Stream::resolve_enum(Exif::FIELD_TYPE, @_io.read_u2le)
        @num_values = @_io.read_u4le
        if !(has_immediate_data)
          @ofs_data = @_io.read_u4le
        end
        self
      end

      def _read_be
        @tag_raw = @_io.read_u2be
        @field_type = Kaitai::Struct::Stream::resolve_enum(Exif::FIELD_TYPE, @_io.read_u2be)
        @num_values = @_io.read_u4be
        if !(has_immediate_data)
          @ofs_data = @_io.read_u4be
        end
        self
      end

      ##
      # Size in bytes of a single value of type `field_type`, or 0 if
      # `field_type` is not one of the known types (in which case the size
      # cannot be determined and `data` will be empty).
      # @see https://www.media.mit.edu/pia/Research/deepview/exif.html#DataForm Source
      def bytes_per_value
        return @bytes_per_value unless @bytes_per_value.nil?
        @bytes_per_value = ( ((field_type == :field_type_byte) || (field_type == :field_type_ascii) || (field_type == :field_type_sbyte) || (field_type == :field_type_undefined) || (field_type == :field_type_utf8))  ? 1 : ( ((field_type == :field_type_short) || (field_type == :field_type_sshort))  ? 2 : ( ((field_type == :field_type_long) || (field_type == :field_type_slong) || (field_type == :field_type_float) || (field_type == :field_type_ifd))  ? 4 : ( ((field_type == :field_type_rational) || (field_type == :field_type_srational) || (field_type == :field_type_double))  ? 8 : 0))))
        @bytes_per_value
      end
      def data
        return @data unless @data.nil?
        io = (has_immediate_data ? _io : _root._io)
        _pos = io.pos
        io.seek((has_immediate_data ? 8 : ofs_data))
        if @_is_le
          case field_type
          when :field_type_ascii
            _io_data = io.substream(len_data)
            @data = AsciiString.new(_io_data, self, @_root, @_is_le)
          when :field_type_double
            _io_data = io.substream(len_data)
            @data = Doubles.new(_io_data, self, @_root, @_is_le)
          when :field_type_float
            _io_data = io.substream(len_data)
            @data = Floats.new(_io_data, self, @_root, @_is_le)
          when :field_type_ifd
            _io_data = io.substream(len_data)
            @data = Longs.new(_io_data, self, @_root, @_is_le)
          when :field_type_long
            _io_data = io.substream(len_data)
            @data = Longs.new(_io_data, self, @_root, @_is_le)
          when :field_type_rational
            _io_data = io.substream(len_data)
            @data = Rationals.new(_io_data, self, @_root, @_is_le)
          when :field_type_sbyte
            _io_data = io.substream(len_data)
            @data = Sbytes.new(_io_data, self, @_root, @_is_le)
          when :field_type_short
            _io_data = io.substream(len_data)
            @data = Shorts.new(_io_data, self, @_root, @_is_le)
          when :field_type_slong
            _io_data = io.substream(len_data)
            @data = Slongs.new(_io_data, self, @_root, @_is_le)
          when :field_type_srational
            _io_data = io.substream(len_data)
            @data = Srationals.new(_io_data, self, @_root, @_is_le)
          when :field_type_sshort
            _io_data = io.substream(len_data)
            @data = Sshorts.new(_io_data, self, @_root, @_is_le)
          when :field_type_utf8
            _io_data = io.substream(len_data)
            @data = Utf8String.new(_io_data, self, @_root, @_is_le)
          else
            @data = io.read_bytes(len_data)
          end
        else
          case field_type
          when :field_type_ascii
            _io_data = io.substream(len_data)
            @data = AsciiString.new(_io_data, self, @_root, @_is_le)
          when :field_type_double
            _io_data = io.substream(len_data)
            @data = Doubles.new(_io_data, self, @_root, @_is_le)
          when :field_type_float
            _io_data = io.substream(len_data)
            @data = Floats.new(_io_data, self, @_root, @_is_le)
          when :field_type_ifd
            _io_data = io.substream(len_data)
            @data = Longs.new(_io_data, self, @_root, @_is_le)
          when :field_type_long
            _io_data = io.substream(len_data)
            @data = Longs.new(_io_data, self, @_root, @_is_le)
          when :field_type_rational
            _io_data = io.substream(len_data)
            @data = Rationals.new(_io_data, self, @_root, @_is_le)
          when :field_type_sbyte
            _io_data = io.substream(len_data)
            @data = Sbytes.new(_io_data, self, @_root, @_is_le)
          when :field_type_short
            _io_data = io.substream(len_data)
            @data = Shorts.new(_io_data, self, @_root, @_is_le)
          when :field_type_slong
            _io_data = io.substream(len_data)
            @data = Slongs.new(_io_data, self, @_root, @_is_le)
          when :field_type_srational
            _io_data = io.substream(len_data)
            @data = Srationals.new(_io_data, self, @_root, @_is_le)
          when :field_type_sshort
            _io_data = io.substream(len_data)
            @data = Sshorts.new(_io_data, self, @_root, @_is_le)
          when :field_type_utf8
            _io_data = io.substream(len_data)
            @data = Utf8String.new(_io_data, self, @_root, @_is_le)
          else
            @data = io.read_bytes(len_data)
          end
        end
        io.seek(_pos)
        @data
      end
      def gps_tag
        return @gps_tag unless @gps_tag.nil?
        if _parent.is_gps_ifd
          @gps_tag = Kaitai::Struct::Stream::resolve_enum(Exif::GPS_TAG, tag_raw)
        end
        @gps_tag
      end
      def has_immediate_data
        return @has_immediate_data unless @has_immediate_data.nil?
        @has_immediate_data = len_data <= 4
        @has_immediate_data
      end
      def len_data
        return @len_data unless @len_data.nil?
        @len_data = bytes_per_value * num_values
        @len_data
      end

      ##
      # All the "IFD Pointer" tags (as the core Exif standard calls them),
      # i.e. `ExifOffset`, `InteropOffset` and `GPSInfo` (using the
      # [ExifTool's
      # names](https://exiftool.sourceforge.net/TagNames/EXIF.html)),
      # should be of type `LONG` (`field_type::long`). However, the type
      # `SLONG` (`field_type::slong`) type has also been observed:
      # <https://github.com/Exiv2/exiv2/blob/2cd987a731236037b6b78cbff897d08685a8ef49/test/data/FurnaceCreekInn.jpg>
      # 
      # Both ExifTool and Exiv2 accept `LONG`, `SLONG` and also `IFD`.
      # Exiv2 specifically supports only these three types - see
      # <https://github.com/Exiv2/exiv2/blob/2cd987a731236037b6b78cbff897d08685a8ef49/src/tiffvisitor_int.cpp#L1141>
      # (Git tag "v0.28.8"). ExifTool is more lenient - it even accepts
      # any integer type. In practice, real files most likely only use one
      # of the three types supported by Exiv2, so we stick with that.
      def sub_ifd
        return @sub_ifd unless @sub_ifd.nil?
        if  ((num_values == 1) && ( ((field_type == :field_type_long) || (field_type == :field_type_ifd) || ( ((field_type == :field_type_slong) && (data.values.first >= 0)) )) ) && ( ((tag == :tag_exif_offset) || (tag == :tag_interop_offset) || (tag == :tag_gps_info)) )) 
          io = _root._io
          _pos = io.pos
          io.seek((field_type == :field_type_slong ? data.values.first : data.values.first))
          if @_is_le
            @sub_ifd = Ifd.new(io, self, @_root, @_is_le, tag == :tag_gps_info)
          else
            @sub_ifd = Ifd.new(io, self, @_root, @_is_le, tag == :tag_gps_info)
          end
          io.seek(_pos)
        end
        @sub_ifd
      end
      def tag
        return @tag unless @tag.nil?
        if !(_parent.is_gps_ifd)
          @tag = Kaitai::Struct::Stream::resolve_enum(Exif::TAG, tag_raw)
        end
        @tag
      end

      ##
      # Raw numeric tag. Don't read this field - access `tag` or `gps_tag`
      # instead.
      attr_reader :tag_raw
      attr_reader :field_type
      attr_reader :num_values
      attr_reader :ofs_data
      attr_reader :_raw_data
    end
    class Longs < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
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
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/exif_body/types/longs")
        end
        self
      end

      def _read_le
        @values = []
        (_parent.num_values).times { |i|
          @values << @_io.read_u4le
        }
        self
      end

      def _read_be
        @values = []
        (_parent.num_values).times { |i|
          @values << @_io.read_u4be
        }
        self
      end
      attr_reader :values
    end
    class Rational < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
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
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/exif_body/types/rational")
        end
        self
      end

      def _read_le
        @value_num = @_io.read_u4le
        @value_den = @_io.read_u4le
        self
      end

      def _read_be
        @value_num = @_io.read_u4be
        @value_den = @_io.read_u4be
        self
      end

      ##
      # If denominator is zero, this instance is disabled to prevent
      # `ZeroDivisionError` in Python.
      # 
      # Here's a sample file with a zero denominator in the IFD fields
      # `tag::x_resolution` and `tag::y_resolution` (both of which are of
      # type `field_type::rational`):
      # <https://github.com/python-pillow/Pillow/blob/807d689a83738027b6f6e0f219a6a6dd30e01c08/Tests/images/exif-dpi-zerodivision.jpg>
      def value
        return @value unless @value.nil?
        if value_den != 0
          @value = (value_num + 0.0) / value_den
        end
        @value
      end

      ##
      # Numerator
      attr_reader :value_num

      ##
      # Denominator
      attr_reader :value_den
    end
    class Rationals < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
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
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/exif_body/types/rationals")
        end
        self
      end

      def _read_le
        @values = []
        (_parent.num_values).times { |i|
          @values << Rational.new(@_io, self, @_root, @_is_le)
        }
        self
      end

      def _read_be
        @values = []
        (_parent.num_values).times { |i|
          @values << Rational.new(@_io, self, @_root, @_is_le)
        }
        self
      end
      attr_reader :values
    end
    class Sbytes < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
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
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/exif_body/types/sbytes")
        end
        self
      end

      def _read_le
        @values = []
        (_parent.num_values).times { |i|
          @values << @_io.read_s1
        }
        self
      end

      def _read_be
        @values = []
        (_parent.num_values).times { |i|
          @values << @_io.read_s1
        }
        self
      end
      attr_reader :values
    end
    class Shorts < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
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
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/exif_body/types/shorts")
        end
        self
      end

      def _read_le
        @values = []
        (_parent.num_values).times { |i|
          @values << @_io.read_u2le
        }
        self
      end

      def _read_be
        @values = []
        (_parent.num_values).times { |i|
          @values << @_io.read_u2be
        }
        self
      end
      attr_reader :values
    end
    class Slongs < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
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
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/exif_body/types/slongs")
        end
        self
      end

      def _read_le
        @values = []
        (_parent.num_values).times { |i|
          @values << @_io.read_s4le
        }
        self
      end

      def _read_be
        @values = []
        (_parent.num_values).times { |i|
          @values << @_io.read_s4be
        }
        self
      end
      attr_reader :values
    end
    class Srational < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
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
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/exif_body/types/srational")
        end
        self
      end

      def _read_le
        @value_num = @_io.read_s4le
        @value_den = @_io.read_s4le
        self
      end

      def _read_be
        @value_num = @_io.read_s4be
        @value_den = @_io.read_s4be
        self
      end

      ##
      # If denominator is zero, this instance is disabled to prevent
      # `ZeroDivisionError` in Python.
      # 
      # Here's a sample file with a zero denominator in the IFD field
      # `tag::exposure_compensation` of type `field_type::srational`:
      # <https://github.com/drewnoakes/metadata-extractor-images/blob/651ad0e67aa8d43d358ad05f9bc07b52d8b9ac6e/jpg/Reconyx%20Hyperfire%20HP4K.jpg>
      def value
        return @value unless @value.nil?
        if value_den != 0
          @value = (value_num + 0.0) / value_den
        end
        @value
      end

      ##
      # Numerator
      attr_reader :value_num

      ##
      # Denominator
      attr_reader :value_den
    end
    class Srationals < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
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
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/exif_body/types/srationals")
        end
        self
      end

      def _read_le
        @values = []
        (_parent.num_values).times { |i|
          @values << Srational.new(@_io, self, @_root, @_is_le)
        }
        self
      end

      def _read_be
        @values = []
        (_parent.num_values).times { |i|
          @values << Srational.new(@_io, self, @_root, @_is_le)
        }
        self
      end
      attr_reader :values
    end
    class Sshorts < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
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
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/exif_body/types/sshorts")
        end
        self
      end

      def _read_le
        @values = []
        (_parent.num_values).times { |i|
          @values << @_io.read_s2le
        }
        self
      end

      def _read_be
        @values = []
        (_parent.num_values).times { |i|
          @values << @_io.read_s2be
        }
        self
      end
      attr_reader :values
    end
    class Utf8String < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil, _is_le = nil)
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
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/exif_body/types/utf8_string")
        end
        self
      end

      def _read_le
        @value = (@_io.read_bytes_term(0, false, true, false)).force_encoding("UTF-8")
        self
      end

      def _read_be
        @value = (@_io.read_bytes_term(0, false, true, false)).force_encoding("UTF-8")
        self
      end
      attr_reader :value
    end
    def ifd0
      return @ifd0 unless @ifd0.nil?
      _pos = @_io.pos
      @_io.seek(ofs_ifd0)
      if @_is_le
        @ifd0 = Ifd.new(@_io, self, @_root, @_is_le, false)
      else
        @ifd0 = Ifd.new(@_io, self, @_root, @_is_le, false)
      end
      @_io.seek(_pos)
      @ifd0
    end
    attr_reader :magic
    attr_reader :ofs_ifd0
  end
  attr_reader :endianness
  attr_reader :body
end

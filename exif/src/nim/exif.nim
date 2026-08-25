import kaitai_struct_nim_runtime
import options

type
  Exif* = ref object of KaitaiStruct
    `endianness`*: uint16
    `body`*: Exif_ExifBody
    `parent`*: KaitaiStruct
  Exif_FieldType* = enum
    byte = 1
    ascii = 2
    short = 3
    long = 4
    rational = 5
    sbyte = 6
    undefined = 7
    sshort = 8
    slong = 9
    srational = 10
    float = 11
    double = 12
    ifd = 13
    utf8 = 129
  Exif_GpsTag* = enum
    gps_version_id = 0
    gps_latitude_ref = 1
    gps_latitude = 2
    gps_longitude_ref = 3
    gps_longitude = 4
    gps_altitude_ref = 5
    gps_altitude = 6
    gps_time_stamp = 7
    gps_satellites = 8
    gps_status = 9
    gps_measure_mode = 10
    gps_dop = 11
    gps_speed_ref = 12
    gps_speed = 13
    gps_track_ref = 14
    gps_track = 15
    gps_img_direction_ref = 16
    gps_img_direction = 17
    gps_map_datum = 18
    gps_dest_latitude_ref = 19
    gps_dest_latitude = 20
    gps_dest_longitude_ref = 21
    gps_dest_longitude = 22
    gps_dest_bearing_ref = 23
    gps_dest_bearing = 24
    gps_dest_distance_ref = 25
    gps_dest_distance = 26
    gps_processing_method = 27
    gps_area_information = 28
    gps_date_stamp = 29
    gps_differential = 30
    gps_h_positioning_error = 31
  Exif_Tag* = enum
    interop_index = 1
    interop_version = 2
    image_width = 256
    image_height = 257
    bits_per_sample = 258
    compression = 259
    photometric_interpretation = 262
    thresholding = 263
    cell_width = 264
    cell_length = 265
    fill_order = 266
    document_name = 269
    image_description = 270
    make = 271
    model = 272
    strip_offsets = 273
    orientation = 274
    samples_per_pixel = 277
    rows_per_strip = 278
    strip_byte_counts = 279
    min_sample_value = 280
    max_sample_value = 281
    x_resolution = 282
    y_resolution = 283
    planar_configuration = 284
    page_name = 285
    x_position = 286
    y_position = 287
    free_offsets = 288
    free_byte_counts = 289
    gray_response_unit = 290
    gray_response_curve = 291
    t4_options = 292
    t6_options = 293
    resolution_unit = 296
    page_number = 297
    color_response_unit = 300
    transfer_function = 301
    software = 305
    modify_date = 306
    artist = 315
    host_computer = 316
    predictor = 317
    white_point = 318
    primary_chromaticities = 319
    color_map = 320
    halftone_hints = 321
    tile_width = 322
    tile_length = 323
    tile_offsets = 324
    tile_byte_counts = 325
    bad_fax_lines = 326
    clean_fax_data = 327
    consecutive_bad_fax_lines = 328
    sub_ifd = 330
    ink_set = 332
    ink_names = 333
    numberof_inks = 334
    dot_range = 336
    target_printer = 337
    extra_samples = 338
    sample_format = 339
    s_min_sample_value = 340
    s_max_sample_value = 341
    transfer_range = 342
    clip_path = 343
    x_clip_path_units = 344
    y_clip_path_units = 345
    indexed = 346
    jpeg_tables = 347
    opi_proxy = 351
    global_parameters_ifd = 400
    profile_type = 401
    fax_profile = 402
    coding_methods = 403
    version_year = 404
    mode_number = 405
    decode = 433
    default_image_color = 434
    t82_options = 435
    jpeg_tables2 = 437
    jpeg_proc = 512
    thumbnail_offset = 513
    thumbnail_length = 514
    jpeg_restart_interval = 515
    jpeg_lossless_predictors = 517
    jpeg_point_transforms = 518
    jpegq_tables = 519
    jpegdc_tables = 520
    jpegac_tables = 521
    y_cb_cr_coefficients = 529
    y_cb_cr_sub_sampling = 530
    y_cb_cr_positioning = 531
    reference_black_white = 532
    strip_row_counts = 559
    application_notes = 700
    uspto_miscellaneous = 999
    related_image_file_format = 4096
    related_image_width = 4097
    related_image_height = 4098
    rating = 18246
    xp_dip_xml = 18247
    stitch_info = 18248
    rating_percent = 18249
    sony_raw_file_type = 28672
    light_falloff_params = 28722
    chromatic_aberration_corr_params = 28725
    distortion_corr_params = 28727
    image_id = 32781
    wang_tag1 = 32931
    wang_annotation = 32932
    wang_tag3 = 32933
    wang_tag4 = 32934
    image_reference_points = 32953
    region_xform_tack_point = 32954
    warp_quadrilateral = 32955
    affine_transform_mat = 32956
    matteing = 32995
    data_type = 32996
    image_depth = 32997
    tile_depth = 32998
    image_full_width = 33300
    image_full_height = 33301
    texture_format = 33302
    wrap_modes = 33303
    fov_cot = 33304
    matrix_world_to_screen = 33305
    matrix_world_to_camera = 33306
    model2 = 33405
    cfa_repeat_pattern_dim = 33421
    cfa_pattern2 = 33422
    battery_level = 33423
    kodak_ifd = 33424
    copyright = 33432
    exposure_time = 33434
    f_number = 33437
    md_file_tag = 33445
    md_scale_pixel = 33446
    md_color_table = 33447
    md_lab_name = 33448
    md_sample_info = 33449
    md_prep_date = 33450
    md_prep_time = 33451
    md_file_units = 33452
    pixel_scale = 33550
    advent_scale = 33589
    advent_revision = 33590
    uic1_tag = 33628
    uic2_tag = 33629
    uic3_tag = 33630
    uic4_tag = 33631
    iptc_naa = 33723
    intergraph_packet_data = 33918
    intergraph_flag_registers = 33919
    intergraph_matrix = 33920
    ingr_reserved = 33921
    model_tie_point = 33922
    site = 34016
    color_sequence = 34017
    it8_header = 34018
    raster_padding = 34019
    bits_per_run_length = 34020
    bits_per_extended_run_length = 34021
    color_table = 34022
    image_color_indicator = 34023
    background_color_indicator = 34024
    image_color_value = 34025
    background_color_value = 34026
    pixel_intensity_range = 34027
    transparency_indicator = 34028
    color_characterization = 34029
    hc_usage = 34030
    trap_indicator = 34031
    cmyk_equivalent = 34032
    sem_info = 34118
    afcp_iptc = 34152
    pixel_magic_jbig_options = 34232
    jpl_carto_ifd = 34263
    model_transform = 34264
    wb_grgb_levels = 34306
    leaf_data = 34310
    photoshop_settings = 34377
    exif_offset = 34665
    icc_profile = 34675
    tiff_fx_extensions = 34687
    multi_profiles = 34688
    shared_data = 34689
    t88_options = 34690
    image_layer = 34732
    geo_tiff_directory = 34735
    geo_tiff_double_params = 34736
    geo_tiff_ascii_params = 34737
    jbig_options = 34750
    exposure_program = 34850
    spectral_sensitivity = 34852
    gps_info = 34853
    iso = 34855
    opto_electric_conv_factor = 34856
    interlace = 34857
    time_zone_offset = 34858
    self_timer_mode = 34859
    sensitivity_type = 34864
    standard_output_sensitivity = 34865
    recommended_exposure_index = 34866
    iso_speed = 34867
    iso_speed_latitudeyyy = 34868
    iso_speed_latitudezzz = 34869
    fax_recv_params = 34908
    fax_sub_address = 34909
    fax_recv_time = 34910
    fedex_edr = 34929
    leaf_sub_ifd = 34954
    exif_version = 36864
    date_time_original = 36867
    create_date = 36868
    google_plus_upload_code = 36873
    offset_time = 36880
    offset_time_original = 36881
    offset_time_digitized = 36882
    components_configuration = 37121
    compressed_bits_per_pixel = 37122
    shutter_speed_value = 37377
    aperture_value = 37378
    brightness_value = 37379
    exposure_compensation = 37380
    max_aperture_value = 37381
    subject_distance = 37382
    metering_mode = 37383
    light_source = 37384
    flash = 37385
    focal_length = 37386
    flash_energy = 37387
    spatial_frequency_response = 37388
    noise = 37389
    focal_plane_x_resolution = 37390
    focal_plane_y_resolution = 37391
    focal_plane_resolution_unit = 37392
    image_number = 37393
    security_classification = 37394
    image_history = 37395
    subject_area = 37396
    exposure_index = 37397
    tiff_ep_standard_id = 37398
    sensing_method = 37399
    cip3_data_file = 37434
    cip3_sheet = 37435
    cip3_side = 37436
    sto_nits = 37439
    maker_note = 37500
    user_comment = 37510
    sub_sec_time = 37520
    sub_sec_time_original = 37521
    sub_sec_time_digitized = 37522
    ms_document_text = 37679
    ms_property_set_storage = 37680
    ms_document_text_position = 37681
    image_source_data = 37724
    ambient_temperature = 37888
    humidity = 37889
    pressure = 37890
    water_depth = 37891
    acceleration = 37892
    camera_elevation_angle = 37893
    xp_title = 40091
    xp_comment = 40092
    xp_author = 40093
    xp_keywords = 40094
    xp_subject = 40095
    flashpix_version = 40960
    color_space = 40961
    exif_image_width = 40962
    exif_image_height = 40963
    related_sound_file = 40964
    interop_offset = 40965
    samsung_raw_pointers_offset = 40976
    samsung_raw_pointers_length = 40977
    samsung_raw_byte_order = 41217
    samsung_raw_unknown = 41218
    flash_energy2 = 41483
    spatial_frequency_response2 = 41484
    noise2 = 41485
    focal_plane_x_resolution2 = 41486
    focal_plane_y_resolution2 = 41487
    focal_plane_resolution_unit2 = 41488
    image_number2 = 41489
    security_classification2 = 41490
    image_history2 = 41491
    subject_location = 41492
    exposure_index2 = 41493
    tiff_ep_standard_id2 = 41494
    sensing_method2 = 41495
    file_source = 41728
    scene_type = 41729
    cfa_pattern = 41730
    custom_rendered = 41985
    exposure_mode = 41986
    white_balance = 41987
    digital_zoom_ratio = 41988
    focal_length_in35mm_format = 41989
    scene_capture_type = 41990
    gain_control = 41991
    contrast = 41992
    saturation = 41993
    sharpness = 41994
    device_setting_description = 41995
    subject_distance_range = 41996
    image_unique_id = 42016
    owner_name = 42032
    serial_number = 42033
    lens_info = 42034
    lens_make = 42035
    lens_model = 42036
    lens_serial_number = 42037
    gdal_metadata = 42112
    gdal_no_data = 42113
    gamma = 42240
    expand_software = 44992
    expand_lens = 44993
    expand_film = 44994
    expand_filter_lens = 44995
    expand_scanner = 44996
    expand_flash_lamp = 44997
    pixel_format = 48129
    transformation = 48130
    uncompressed = 48131
    image_type = 48132
    image_width2 = 48256
    image_height2 = 48257
    width_resolution = 48258
    height_resolution = 48259
    image_offset = 48320
    image_byte_count = 48321
    alpha_offset = 48322
    alpha_byte_count = 48323
    image_data_discard = 48324
    alpha_data_discard = 48325
    oce_scanjob_desc = 50215
    oce_application_selector = 50216
    oce_id_number = 50217
    oce_image_logic = 50218
    annotations = 50255
    print_im = 50341
    original_file_name = 50547
    uspto_original_content_type = 50560
    dng_version = 50706
    dng_backward_version = 50707
    unique_camera_model = 50708
    localized_camera_model = 50709
    cfa_plane_color = 50710
    cfa_layout = 50711
    linearization_table = 50712
    black_level_repeat_dim = 50713
    black_level = 50714
    black_level_delta_h = 50715
    black_level_delta_v = 50716
    white_level = 50717
    default_scale = 50718
    default_crop_origin = 50719
    default_crop_size = 50720
    color_matrix1 = 50721
    color_matrix2 = 50722
    camera_calibration1 = 50723
    camera_calibration2 = 50724
    reduction_matrix1 = 50725
    reduction_matrix2 = 50726
    analog_balance = 50727
    as_shot_neutral = 50728
    as_shot_white_xy = 50729
    baseline_exposure = 50730
    baseline_noise = 50731
    baseline_sharpness = 50732
    bayer_green_split = 50733
    linear_response_limit = 50734
    camera_serial_number = 50735
    dng_lens_info = 50736
    chroma_blur_radius = 50737
    anti_alias_strength = 50738
    shadow_scale = 50739
    sr2_private = 50740
    maker_note_safety = 50741
    raw_image_segmentation = 50752
    calibration_illuminant1 = 50778
    calibration_illuminant2 = 50779
    best_quality_scale = 50780
    raw_data_unique_id = 50781
    alias_layer_metadata = 50784
    original_raw_file_name = 50827
    original_raw_file_data = 50828
    active_area = 50829
    masked_areas = 50830
    as_shot_icc_profile = 50831
    as_shot_pre_profile_matrix = 50832
    current_icc_profile = 50833
    current_pre_profile_matrix = 50834
    colorimetric_reference = 50879
    s_raw_type = 50885
    panasonic_title = 50898
    panasonic_title2 = 50899
    camera_calibration_sig = 50931
    profile_calibration_sig = 50932
    profile_ifd = 50933
    as_shot_profile_name = 50934
    noise_reduction_applied = 50935
    profile_name = 50936
    profile_hue_sat_map_dims = 50937
    profile_hue_sat_map_data1 = 50938
    profile_hue_sat_map_data2 = 50939
    profile_tone_curve = 50940
    profile_embed_policy = 50941
    profile_copyright = 50942
    forward_matrix1 = 50964
    forward_matrix2 = 50965
    preview_application_name = 50966
    preview_application_version = 50967
    preview_settings_name = 50968
    preview_settings_digest = 50969
    preview_color_space = 50970
    preview_date_time = 50971
    raw_image_digest = 50972
    original_raw_file_digest = 50973
    sub_tile_block_size = 50974
    row_interleave_factor = 50975
    profile_look_table_dims = 50981
    profile_look_table_data = 50982
    opcode_list1 = 51008
    opcode_list2 = 51009
    opcode_list3 = 51022
    noise_profile = 51041
    time_codes = 51043
    frame_rate = 51044
    t_stop = 51058
    reel_name = 51081
    original_default_final_size = 51089
    original_best_quality_size = 51090
    original_default_crop_size = 51091
    camera_label = 51105
    profile_hue_sat_map_encoding = 51107
    profile_look_table_encoding = 51108
    baseline_exposure_offset = 51109
    default_black_render = 51110
    new_raw_image_digest = 51111
    raw_to_preview_gain = 51112
    default_user_crop = 51125
    padding = 59932
    offset_schema = 59933
    owner_name2 = 65000
    serial_number2 = 65001
    lens = 65002
    kdc_ifd = 65024
    raw_file = 65100
    converter = 65101
    white_balance2 = 65102
    exposure = 65105
    shadows = 65106
    brightness = 65107
    contrast2 = 65108
    saturation2 = 65109
    sharpness2 = 65110
    smoothness = 65111
    moire_filter = 65112
  Exif_ExifBody* = ref object of KaitaiStruct
    `magic`*: uint16
    `ofsIfd0`*: uint32
    `parent`*: Exif
    `ifd0Inst`: Exif_ExifBody_Ifd
    `ifd0InstFlag`: bool
    isLe: bool
  Exif_ExifBody_AsciiString* = ref object of KaitaiStruct
    `value`*: seq[byte]
    `parent`*: Exif_ExifBody_IfdField
    isLe: bool
  Exif_ExifBody_Doubles* = ref object of KaitaiStruct
    `values`*: seq[float64]
    `parent`*: Exif_ExifBody_IfdField
    isLe: bool
  Exif_ExifBody_Floats* = ref object of KaitaiStruct
    `values`*: seq[float32]
    `parent`*: Exif_ExifBody_IfdField
    isLe: bool
  Exif_ExifBody_Ifd* = ref object of KaitaiStruct
    `numFields`*: uint16
    `fields`*: seq[Exif_ExifBody_IfdField]
    `ofsNextIfd`*: uint32
    `isGpsIfd`*: bool
    `parent`*: KaitaiStruct
    `rawFields`*: seq[seq[byte]]
    `nextIfdInst`: Exif_ExifBody_Ifd
    `nextIfdInstFlag`: bool
    isLe: bool
  Exif_ExifBody_IfdField* = ref object of KaitaiStruct
    `tagRaw`*: uint16
    `fieldType`*: Exif_FieldType
    `numValues`*: uint32
    `ofsData`*: uint32
    `parent`*: Exif_ExifBody_Ifd
    `rawDataInst`*: seq[byte]
    `bytesPerValueInst`: int8
    `bytesPerValueInstFlag`: bool
    `dataInst`: KaitaiStruct
    `dataInstFlag`: bool
    `gpsTagInst`: Exif_GpsTag
    `gpsTagInstFlag`: bool
    `hasImmediateDataInst`: bool
    `hasImmediateDataInstFlag`: bool
    `lenDataInst`: int
    `lenDataInstFlag`: bool
    `subIfdInst`: Exif_ExifBody_Ifd
    `subIfdInstFlag`: bool
    `tagInst`: Exif_Tag
    `tagInstFlag`: bool
    isLe: bool
  Exif_ExifBody_Longs* = ref object of KaitaiStruct
    `values`*: seq[uint32]
    `parent`*: Exif_ExifBody_IfdField
    isLe: bool
  Exif_ExifBody_Rational* = ref object of KaitaiStruct
    `valueNum`*: uint32
    `valueDen`*: uint32
    `parent`*: Exif_ExifBody_Rationals
    `valueInst`: float64
    `valueInstFlag`: bool
    isLe: bool
  Exif_ExifBody_Rationals* = ref object of KaitaiStruct
    `values`*: seq[Exif_ExifBody_Rational]
    `parent`*: Exif_ExifBody_IfdField
    isLe: bool
  Exif_ExifBody_Sbytes* = ref object of KaitaiStruct
    `values`*: seq[int8]
    `parent`*: Exif_ExifBody_IfdField
    isLe: bool
  Exif_ExifBody_Shorts* = ref object of KaitaiStruct
    `values`*: seq[uint16]
    `parent`*: Exif_ExifBody_IfdField
    isLe: bool
  Exif_ExifBody_Slongs* = ref object of KaitaiStruct
    `values`*: seq[int32]
    `parent`*: Exif_ExifBody_IfdField
    isLe: bool
  Exif_ExifBody_Srational* = ref object of KaitaiStruct
    `valueNum`*: int32
    `valueDen`*: int32
    `parent`*: Exif_ExifBody_Srationals
    `valueInst`: float64
    `valueInstFlag`: bool
    isLe: bool
  Exif_ExifBody_Srationals* = ref object of KaitaiStruct
    `values`*: seq[Exif_ExifBody_Srational]
    `parent`*: Exif_ExifBody_IfdField
    isLe: bool
  Exif_ExifBody_Sshorts* = ref object of KaitaiStruct
    `values`*: seq[int16]
    `parent`*: Exif_ExifBody_IfdField
    isLe: bool
  Exif_ExifBody_Utf8String* = ref object of KaitaiStruct
    `value`*: string
    `parent`*: Exif_ExifBody_IfdField
    isLe: bool

proc read*(_: typedesc[Exif], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Exif
proc read*(_: typedesc[Exif_ExifBody], io: KaitaiStream, root: KaitaiStruct, parent: Exif): Exif_ExifBody
proc read*(_: typedesc[Exif_ExifBody_AsciiString], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_IfdField): Exif_ExifBody_AsciiString
proc read*(_: typedesc[Exif_ExifBody_Doubles], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_IfdField): Exif_ExifBody_Doubles
proc read*(_: typedesc[Exif_ExifBody_Floats], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_IfdField): Exif_ExifBody_Floats
proc read*(_: typedesc[Exif_ExifBody_Ifd], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct, isGpsIfd: any): Exif_ExifBody_Ifd
proc read*(_: typedesc[Exif_ExifBody_IfdField], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_Ifd): Exif_ExifBody_IfdField
proc read*(_: typedesc[Exif_ExifBody_Longs], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_IfdField): Exif_ExifBody_Longs
proc read*(_: typedesc[Exif_ExifBody_Rational], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_Rationals): Exif_ExifBody_Rational
proc read*(_: typedesc[Exif_ExifBody_Rationals], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_IfdField): Exif_ExifBody_Rationals
proc read*(_: typedesc[Exif_ExifBody_Sbytes], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_IfdField): Exif_ExifBody_Sbytes
proc read*(_: typedesc[Exif_ExifBody_Shorts], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_IfdField): Exif_ExifBody_Shorts
proc read*(_: typedesc[Exif_ExifBody_Slongs], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_IfdField): Exif_ExifBody_Slongs
proc read*(_: typedesc[Exif_ExifBody_Srational], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_Srationals): Exif_ExifBody_Srational
proc read*(_: typedesc[Exif_ExifBody_Srationals], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_IfdField): Exif_ExifBody_Srationals
proc read*(_: typedesc[Exif_ExifBody_Sshorts], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_IfdField): Exif_ExifBody_Sshorts
proc read*(_: typedesc[Exif_ExifBody_Utf8String], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_IfdField): Exif_ExifBody_Utf8String

proc ifd0*(this: Exif_ExifBody): Exif_ExifBody_Ifd
proc nextIfd*(this: Exif_ExifBody_Ifd): Exif_ExifBody_Ifd
proc bytesPerValue*(this: Exif_ExifBody_IfdField): int8
proc data*(this: Exif_ExifBody_IfdField): KaitaiStruct
proc gpsTag*(this: Exif_ExifBody_IfdField): Exif_GpsTag
proc hasImmediateData*(this: Exif_ExifBody_IfdField): bool
proc lenData*(this: Exif_ExifBody_IfdField): int
proc subIfd*(this: Exif_ExifBody_IfdField): Exif_ExifBody_Ifd
proc tag*(this: Exif_ExifBody_IfdField): Exif_Tag
proc value*(this: Exif_ExifBody_Rational): float64
proc value*(this: Exif_ExifBody_Srational): float64


##[
Sample files (numbers in parentheses show how many files per extension contain
Exif metadata out of the total):

* <https://github.com/ianare/exif-py/tree/a69bf74770caf6b333221658f5092ed69f99faac/tests/resources/jpg> (84/93 .jpg, 1/1 .jpeg)
* <https://github.com/exiftool/exiftool/tree/2200871d9cef988051d2a99d67df3bda6cbb30a8/t/images> (34/41 .jpg, 0/1 .png)
* <https://github.com/Exiv2/exiv2/tree/648ada43dcb35ce6077f38183ace52d5e2071f64/test/data> (85/155 .jpg, 5/23 .png)
* <https://github.com/python-pillow/Pillow/tree/807d689a83738027b6f6e0f219a6a6dd30e01c08/Tests/images> (36/55 .jpg, 3/420 .png)
* <https://github.com/drewnoakes/metadata-extractor-images/tree/651ad0e67aa8d43d358ad05f9bc07b52d8b9ac6e/jpg> (335/430 .jpg)
* <https://github.com/libexif/libexif-testsuite/tree/8c1f5bbc18d2cbc80b01b3f9b3eb29546310acf2> (15/18 .jpg)

@see <a href="https://www.cipa.jp/std/documents/download_e.html?CIPA_DC-008-2026-E">Exif Version 3.1</a>
@see <a href="https://www.cipa.jp/std/documents/download_e.html?CIPA_DC-008-2024-E">Exif Version 3.0</a>
@see <a href="https://web.archive.org/web/20190624045241id_/https://www.cipa.jp/std/documents/e/DC-008-Translation-2019-E.pdf">Exif Version 2.32</a>
@see <a href="https://web.archive.org/web/20190712232333id_/https://www.cipa.jp/std/documents/e/DC-008-Translation-2016-E.pdf">Exif Version 2.31</a>
@see <a href="https://www.cipa.jp/std/documents/e/DC-008-2012_E_C.pdf">Exif Version 2.3 (with Corrigendum at the end)</a>
@see <a href="https://web.archive.org/web/20051228234707id_/https://tsc.jeita.or.jp/avs/data/cp3451_1.pdf">Exif Version 2.21 (2003 draft)</a>
@see <a href="https://web.archive.org/web/20131018091152id_/https://exif.org/Exif2-2.PDF">Exif Version 2.2</a>
@see <a href="https://web.archive.org/web/20131111073619id_/https://exif.org/Exif2-1.PDF">Exif Version 2.1</a>
]##
proc read*(_: typedesc[Exif], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Exif =
  template this: untyped = result
  this = new(Exif)
  let root = if root == nil: cast[Exif](this) else: cast[Exif](root)
  this.io = io
  this.root = root
  this.parent = parent

  let endiannessExpr = this.io.readU2le()
  this.endianness = endiannessExpr
  let bodyExpr = Exif_ExifBody.read(this.io, this.root, this)
  this.body = bodyExpr

proc fromFile*(_: typedesc[Exif], filename: string): Exif =
  Exif.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Exif_ExifBody) =
  let magicExpr = this.io.readU2le()
  this.magic = magicExpr
  let ofsIfd0Expr = this.io.readU4le()
  this.ofsIfd0 = ofsIfd0Expr


proc readBe(this: Exif_ExifBody) =
  let magicExpr = this.io.readU2be()
  this.magic = magicExpr
  let ofsIfd0Expr = this.io.readU4be()
  this.ofsIfd0 = ofsIfd0Expr

proc read*(_: typedesc[Exif_ExifBody], io: KaitaiStream, root: KaitaiStruct, parent: Exif): Exif_ExifBody =
  template this: untyped = result
  this = new(Exif_ExifBody)
  let root = if root == nil: cast[Exif](this) else: cast[Exif](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = false

  block:
    let on = Exif(this.root).endianness
    if on == 18761:
      let isLeExpr = bool(true)
      this.isLe = isLeExpr
    elif on == 19789:
      let isLeExpr = bool(false)
      this.isLe = isLeExpr

  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc ifd0(this: Exif_ExifBody): Exif_ExifBody_Ifd = 
  if this.ifd0InstFlag:
    return this.ifd0Inst
  let pos = this.io.pos()
  this.io.seek(int(this.ofsIfd0))
  if this.isLe:
    let ifd0InstExpr = Exif_ExifBody_Ifd.read(this.io, this.root, this, false)
    this.ifd0Inst = ifd0InstExpr
  else:
    let ifd0InstExpr = Exif_ExifBody_Ifd.read(this.io, this.root, this, false)
    this.ifd0Inst = ifd0InstExpr
  this.io.seek(pos)
  this.ifd0InstFlag = true
  return this.ifd0Inst

proc fromFile*(_: typedesc[Exif_ExifBody], filename: string): Exif_ExifBody =
  Exif_ExifBody.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Exif_ExifBody_AsciiString) =

  ##[
  According to the core Exif standard, this should be ASCII, but in
practice, this is not always the case. From
[ExifTool FAQ](https://exiftool.sourceforge.net/faq.html#Q10):

> However, it is not uncommon for applications to write UTF-8 or
other encodings where ASCII is expected.

Therefore, this field is a byte array, not a string. This is to
avoid non-ASCII characters being treated as errors in some target
languages, such as Python. The only assumption is that a null byte
terminates the value (although sometimes the null byte is missing,
which we tolerate thanks to the `eos-error: false` setting).

Here is a sample JPEG file with a `tag::image_description` IFD
field of type `field_type::ascii` that actually contains UTF-8:
<https://github.com/Exiv2/exiv2/blob/2cd987a731236037b6b78cbff897d08685a8ef49/test/data/exiv2-bug501.jpg>

It seems that most modern applications (e.g. GIMP 3.0.6) always
use UTF-8 when storing Exif metadata. However, there are also
files with a non-UTF-8 encoding, for example
<https://github.com/drewnoakes/metadata-extractor-images/blob/651ad0e67aa8d43d358ad05f9bc07b52d8b9ac6e/jpg/Ricoh%20DC-3Z%20(low%20res).jpg>
has a `tag::copyright` IFD field with a value encoded in
ISO-8859-1 (Latin-1).

  ]##
  let valueExpr = this.io.readBytesTerm(0, false, true, false)
  this.value = valueExpr


proc readBe(this: Exif_ExifBody_AsciiString) =

  ##[
  According to the core Exif standard, this should be ASCII, but in
practice, this is not always the case. From
[ExifTool FAQ](https://exiftool.sourceforge.net/faq.html#Q10):

> However, it is not uncommon for applications to write UTF-8 or
other encodings where ASCII is expected.

Therefore, this field is a byte array, not a string. This is to
avoid non-ASCII characters being treated as errors in some target
languages, such as Python. The only assumption is that a null byte
terminates the value (although sometimes the null byte is missing,
which we tolerate thanks to the `eos-error: false` setting).

Here is a sample JPEG file with a `tag::image_description` IFD
field of type `field_type::ascii` that actually contains UTF-8:
<https://github.com/Exiv2/exiv2/blob/2cd987a731236037b6b78cbff897d08685a8ef49/test/data/exiv2-bug501.jpg>

It seems that most modern applications (e.g. GIMP 3.0.6) always
use UTF-8 when storing Exif metadata. However, there are also
files with a non-UTF-8 encoding, for example
<https://github.com/drewnoakes/metadata-extractor-images/blob/651ad0e67aa8d43d358ad05f9bc07b52d8b9ac6e/jpg/Ricoh%20DC-3Z%20(low%20res).jpg>
has a `tag::copyright` IFD field with a value encoded in
ISO-8859-1 (Latin-1).

  ]##
  let valueExpr = this.io.readBytesTerm(0, false, true, false)
  this.value = valueExpr

proc read*(_: typedesc[Exif_ExifBody_AsciiString], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_IfdField): Exif_ExifBody_AsciiString =
  template this: untyped = result
  this = new(Exif_ExifBody_AsciiString)
  let root = if root == nil: cast[Exif](this) else: cast[Exif](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc fromFile*(_: typedesc[Exif_ExifBody_AsciiString], filename: string): Exif_ExifBody_AsciiString =
  Exif_ExifBody_AsciiString.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Exif_ExifBody_Doubles) =
  for i in 0 ..< int(this.parent.numValues):
    let it = this.io.readF8le()
    this.values.add(it)


proc readBe(this: Exif_ExifBody_Doubles) =
  for i in 0 ..< int(this.parent.numValues):
    let it = this.io.readF8be()
    this.values.add(it)

proc read*(_: typedesc[Exif_ExifBody_Doubles], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_IfdField): Exif_ExifBody_Doubles =
  template this: untyped = result
  this = new(Exif_ExifBody_Doubles)
  let root = if root == nil: cast[Exif](this) else: cast[Exif](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc fromFile*(_: typedesc[Exif_ExifBody_Doubles], filename: string): Exif_ExifBody_Doubles =
  Exif_ExifBody_Doubles.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Exif_ExifBody_Floats) =
  for i in 0 ..< int(this.parent.numValues):
    let it = this.io.readF4le()
    this.values.add(it)


proc readBe(this: Exif_ExifBody_Floats) =
  for i in 0 ..< int(this.parent.numValues):
    let it = this.io.readF4be()
    this.values.add(it)

proc read*(_: typedesc[Exif_ExifBody_Floats], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_IfdField): Exif_ExifBody_Floats =
  template this: untyped = result
  this = new(Exif_ExifBody_Floats)
  let root = if root == nil: cast[Exif](this) else: cast[Exif](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc fromFile*(_: typedesc[Exif_ExifBody_Floats], filename: string): Exif_ExifBody_Floats =
  Exif_ExifBody_Floats.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Exif_ExifBody_Ifd) =
  let numFieldsExpr = this.io.readU2le()
  this.numFields = numFieldsExpr
  for i in 0 ..< int(this.numFields):
    let buf = this.io.readBytes(int(12))
    this.rawFields.add(buf)
    let rawFieldsIo = newKaitaiStream(buf)
    let it = Exif_ExifBody_IfdField.read(rawFieldsIo, this.root, this)
    this.fields.add(it)
  let ofsNextIfdExpr = this.io.readU4le()
  this.ofsNextIfd = ofsNextIfdExpr


proc readBe(this: Exif_ExifBody_Ifd) =
  let numFieldsExpr = this.io.readU2be()
  this.numFields = numFieldsExpr
  for i in 0 ..< int(this.numFields):
    let buf = this.io.readBytes(int(12))
    this.rawFields.add(buf)
    let rawFieldsIo = newKaitaiStream(buf)
    let it = Exif_ExifBody_IfdField.read(rawFieldsIo, this.root, this)
    this.fields.add(it)
  let ofsNextIfdExpr = this.io.readU4be()
  this.ofsNextIfd = ofsNextIfdExpr

proc read*(_: typedesc[Exif_ExifBody_Ifd], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct, isGpsIfd: any): Exif_ExifBody_Ifd =
  template this: untyped = result
  this = new(Exif_ExifBody_Ifd)
  let root = if root == nil: cast[Exif](this) else: cast[Exif](root)
  this.io = io
  this.root = root
  this.parent = parent
  let isGpsIfdExpr = bool(isGpsIfd)
  this.isGpsIfd = isGpsIfdExpr
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc nextIfd(this: Exif_ExifBody_Ifd): Exif_ExifBody_Ifd = 
  if this.nextIfdInstFlag:
    return this.nextIfdInst
  if this.ofsNextIfd != 0:
    let pos = this.io.pos()
    this.io.seek(int(this.ofsNextIfd))
    if this.isLe:
      let nextIfdInstExpr = Exif_ExifBody_Ifd.read(this.io, this.root, this, this.isGpsIfd)
      this.nextIfdInst = nextIfdInstExpr
    else:
      let nextIfdInstExpr = Exif_ExifBody_Ifd.read(this.io, this.root, this, this.isGpsIfd)
      this.nextIfdInst = nextIfdInstExpr
    this.io.seek(pos)
  this.nextIfdInstFlag = true
  return this.nextIfdInst

proc fromFile*(_: typedesc[Exif_ExifBody_Ifd], filename: string): Exif_ExifBody_Ifd =
  Exif_ExifBody_Ifd.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Exif_ExifBody_IfdField) =

  ##[
  Raw numeric tag. Don't read this field - access `tag` or `gps_tag`
instead.

  ]##
  let tagRawExpr = this.io.readU2le()
  this.tagRaw = tagRawExpr
  let fieldTypeExpr = Exif_FieldType(this.io.readU2le())
  this.fieldType = fieldTypeExpr
  let numValuesExpr = this.io.readU4le()
  this.numValues = numValuesExpr
  if not(this.hasImmediateData):
    let ofsDataExpr = this.io.readU4le()
    this.ofsData = ofsDataExpr


proc readBe(this: Exif_ExifBody_IfdField) =

  ##[
  Raw numeric tag. Don't read this field - access `tag` or `gps_tag`
instead.

  ]##
  let tagRawExpr = this.io.readU2be()
  this.tagRaw = tagRawExpr
  let fieldTypeExpr = Exif_FieldType(this.io.readU2be())
  this.fieldType = fieldTypeExpr
  let numValuesExpr = this.io.readU4be()
  this.numValues = numValuesExpr
  if not(this.hasImmediateData):
    let ofsDataExpr = this.io.readU4be()
    this.ofsData = ofsDataExpr

proc read*(_: typedesc[Exif_ExifBody_IfdField], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_Ifd): Exif_ExifBody_IfdField =
  template this: untyped = result
  this = new(Exif_ExifBody_IfdField)
  let root = if root == nil: cast[Exif](this) else: cast[Exif](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc bytesPerValue(this: Exif_ExifBody_IfdField): int8 = 

  ##[
  Size in bytes of a single value of type `field_type`, or 0 if
`field_type` is not one of the known types (in which case the size
cannot be determined and `data` will be empty).

  @see <a href="https://www.media.mit.edu/pia/Research/deepview/exif.html#DataForm">Source</a>
  ]##
  if this.bytesPerValueInstFlag:
    return this.bytesPerValueInst
  let bytesPerValueInstExpr = int8((if  ((this.fieldType == exif.byte) or (this.fieldType == exif.ascii) or (this.fieldType == exif.sbyte) or (this.fieldType == exif.undefined) or (this.fieldType == exif.utf8)) : 1 else: (if  ((this.fieldType == exif.short) or (this.fieldType == exif.sshort)) : 2 else: (if  ((this.fieldType == exif.long) or (this.fieldType == exif.slong) or (this.fieldType == exif.float) or (this.fieldType == exif.ifd)) : 4 else: (if  ((this.fieldType == exif.rational) or (this.fieldType == exif.srational) or (this.fieldType == exif.double)) : 8 else: 0)))))
  this.bytesPerValueInst = bytesPerValueInstExpr
  this.bytesPerValueInstFlag = true
  return this.bytesPerValueInst

proc data(this: Exif_ExifBody_IfdField): KaitaiStruct = 
  if this.dataInstFlag:
    return this.dataInst
  let io = (if this.hasImmediateData: this.io else: Exif(this.root).io)
  let pos = io.pos()
  io.seek(int((if this.hasImmediateData: 8 else: this.ofsData)))
  if this.isLe:
    block:
      let on = this.fieldType
      if on == exif.ascii:
        let rawDataInstExpr = io.readBytes(int(this.lenData))
        this.rawDataInst = rawDataInstExpr
        let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
        let dataInstExpr = Exif_ExifBody_AsciiString.read(rawDataInstIo, this.root, this)
        this.dataInst = dataInstExpr
      elif on == exif.double:
        let rawDataInstExpr = io.readBytes(int(this.lenData))
        this.rawDataInst = rawDataInstExpr
        let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
        let dataInstExpr = Exif_ExifBody_Doubles.read(rawDataInstIo, this.root, this)
        this.dataInst = dataInstExpr
      elif on == exif.float:
        let rawDataInstExpr = io.readBytes(int(this.lenData))
        this.rawDataInst = rawDataInstExpr
        let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
        let dataInstExpr = Exif_ExifBody_Floats.read(rawDataInstIo, this.root, this)
        this.dataInst = dataInstExpr
      elif on == exif.ifd:
        let rawDataInstExpr = io.readBytes(int(this.lenData))
        this.rawDataInst = rawDataInstExpr
        let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
        let dataInstExpr = Exif_ExifBody_Longs.read(rawDataInstIo, this.root, this)
        this.dataInst = dataInstExpr
      elif on == exif.long:
        let rawDataInstExpr = io.readBytes(int(this.lenData))
        this.rawDataInst = rawDataInstExpr
        let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
        let dataInstExpr = Exif_ExifBody_Longs.read(rawDataInstIo, this.root, this)
        this.dataInst = dataInstExpr
      elif on == exif.rational:
        let rawDataInstExpr = io.readBytes(int(this.lenData))
        this.rawDataInst = rawDataInstExpr
        let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
        let dataInstExpr = Exif_ExifBody_Rationals.read(rawDataInstIo, this.root, this)
        this.dataInst = dataInstExpr
      elif on == exif.sbyte:
        let rawDataInstExpr = io.readBytes(int(this.lenData))
        this.rawDataInst = rawDataInstExpr
        let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
        let dataInstExpr = Exif_ExifBody_Sbytes.read(rawDataInstIo, this.root, this)
        this.dataInst = dataInstExpr
      elif on == exif.short:
        let rawDataInstExpr = io.readBytes(int(this.lenData))
        this.rawDataInst = rawDataInstExpr
        let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
        let dataInstExpr = Exif_ExifBody_Shorts.read(rawDataInstIo, this.root, this)
        this.dataInst = dataInstExpr
      elif on == exif.slong:
        let rawDataInstExpr = io.readBytes(int(this.lenData))
        this.rawDataInst = rawDataInstExpr
        let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
        let dataInstExpr = Exif_ExifBody_Slongs.read(rawDataInstIo, this.root, this)
        this.dataInst = dataInstExpr
      elif on == exif.srational:
        let rawDataInstExpr = io.readBytes(int(this.lenData))
        this.rawDataInst = rawDataInstExpr
        let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
        let dataInstExpr = Exif_ExifBody_Srationals.read(rawDataInstIo, this.root, this)
        this.dataInst = dataInstExpr
      elif on == exif.sshort:
        let rawDataInstExpr = io.readBytes(int(this.lenData))
        this.rawDataInst = rawDataInstExpr
        let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
        let dataInstExpr = Exif_ExifBody_Sshorts.read(rawDataInstIo, this.root, this)
        this.dataInst = dataInstExpr
      elif on == exif.utf8:
        let rawDataInstExpr = io.readBytes(int(this.lenData))
        this.rawDataInst = rawDataInstExpr
        let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
        let dataInstExpr = Exif_ExifBody_Utf8String.read(rawDataInstIo, this.root, this)
        this.dataInst = dataInstExpr
      else:
        let dataInstExpr = io.readBytes(int(this.lenData))
        this.dataInst = dataInstExpr
  else:
    block:
      let on = this.fieldType
      if on == exif.ascii:
        let rawDataInstExpr = io.readBytes(int(this.lenData))
        this.rawDataInst = rawDataInstExpr
        let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
        let dataInstExpr = Exif_ExifBody_AsciiString.read(rawDataInstIo, this.root, this)
        this.dataInst = dataInstExpr
      elif on == exif.double:
        let rawDataInstExpr = io.readBytes(int(this.lenData))
        this.rawDataInst = rawDataInstExpr
        let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
        let dataInstExpr = Exif_ExifBody_Doubles.read(rawDataInstIo, this.root, this)
        this.dataInst = dataInstExpr
      elif on == exif.float:
        let rawDataInstExpr = io.readBytes(int(this.lenData))
        this.rawDataInst = rawDataInstExpr
        let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
        let dataInstExpr = Exif_ExifBody_Floats.read(rawDataInstIo, this.root, this)
        this.dataInst = dataInstExpr
      elif on == exif.ifd:
        let rawDataInstExpr = io.readBytes(int(this.lenData))
        this.rawDataInst = rawDataInstExpr
        let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
        let dataInstExpr = Exif_ExifBody_Longs.read(rawDataInstIo, this.root, this)
        this.dataInst = dataInstExpr
      elif on == exif.long:
        let rawDataInstExpr = io.readBytes(int(this.lenData))
        this.rawDataInst = rawDataInstExpr
        let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
        let dataInstExpr = Exif_ExifBody_Longs.read(rawDataInstIo, this.root, this)
        this.dataInst = dataInstExpr
      elif on == exif.rational:
        let rawDataInstExpr = io.readBytes(int(this.lenData))
        this.rawDataInst = rawDataInstExpr
        let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
        let dataInstExpr = Exif_ExifBody_Rationals.read(rawDataInstIo, this.root, this)
        this.dataInst = dataInstExpr
      elif on == exif.sbyte:
        let rawDataInstExpr = io.readBytes(int(this.lenData))
        this.rawDataInst = rawDataInstExpr
        let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
        let dataInstExpr = Exif_ExifBody_Sbytes.read(rawDataInstIo, this.root, this)
        this.dataInst = dataInstExpr
      elif on == exif.short:
        let rawDataInstExpr = io.readBytes(int(this.lenData))
        this.rawDataInst = rawDataInstExpr
        let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
        let dataInstExpr = Exif_ExifBody_Shorts.read(rawDataInstIo, this.root, this)
        this.dataInst = dataInstExpr
      elif on == exif.slong:
        let rawDataInstExpr = io.readBytes(int(this.lenData))
        this.rawDataInst = rawDataInstExpr
        let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
        let dataInstExpr = Exif_ExifBody_Slongs.read(rawDataInstIo, this.root, this)
        this.dataInst = dataInstExpr
      elif on == exif.srational:
        let rawDataInstExpr = io.readBytes(int(this.lenData))
        this.rawDataInst = rawDataInstExpr
        let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
        let dataInstExpr = Exif_ExifBody_Srationals.read(rawDataInstIo, this.root, this)
        this.dataInst = dataInstExpr
      elif on == exif.sshort:
        let rawDataInstExpr = io.readBytes(int(this.lenData))
        this.rawDataInst = rawDataInstExpr
        let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
        let dataInstExpr = Exif_ExifBody_Sshorts.read(rawDataInstIo, this.root, this)
        this.dataInst = dataInstExpr
      elif on == exif.utf8:
        let rawDataInstExpr = io.readBytes(int(this.lenData))
        this.rawDataInst = rawDataInstExpr
        let rawDataInstIo = newKaitaiStream(rawDataInstExpr)
        let dataInstExpr = Exif_ExifBody_Utf8String.read(rawDataInstIo, this.root, this)
        this.dataInst = dataInstExpr
      else:
        let dataInstExpr = io.readBytes(int(this.lenData))
        this.dataInst = dataInstExpr
  io.seek(pos)
  this.dataInstFlag = true
  return this.dataInst

proc gpsTag(this: Exif_ExifBody_IfdField): Exif_GpsTag = 
  if this.gpsTagInstFlag:
    return this.gpsTagInst
  if this.parent.isGpsIfd:
    let gpsTagInstExpr = Exif_GpsTag(Exif_GpsTag(this.tagRaw))
    this.gpsTagInst = gpsTagInstExpr
  this.gpsTagInstFlag = true
  return this.gpsTagInst

proc hasImmediateData(this: Exif_ExifBody_IfdField): bool = 
  if this.hasImmediateDataInstFlag:
    return this.hasImmediateDataInst
  let hasImmediateDataInstExpr = bool(this.lenData <= 4)
  this.hasImmediateDataInst = hasImmediateDataInstExpr
  this.hasImmediateDataInstFlag = true
  return this.hasImmediateDataInst

proc lenData(this: Exif_ExifBody_IfdField): int = 
  if this.lenDataInstFlag:
    return this.lenDataInst
  let lenDataInstExpr = int(this.bytesPerValue * this.numValues)
  this.lenDataInst = lenDataInstExpr
  this.lenDataInstFlag = true
  return this.lenDataInst

proc subIfd(this: Exif_ExifBody_IfdField): Exif_ExifBody_Ifd = 

  ##[
  All the "IFD Pointer" tags (as the core Exif standard calls them),
i.e. `ExifOffset`, `InteropOffset` and `GPSInfo` (using the
[ExifTool's
names](https://exiftool.sourceforge.net/TagNames/EXIF.html)),
should be of type `LONG` (`field_type::long`). However, the type
`SLONG` (`field_type::slong`) type has also been observed:
<https://github.com/Exiv2/exiv2/blob/2cd987a731236037b6b78cbff897d08685a8ef49/test/data/FurnaceCreekInn.jpg>

Both ExifTool and Exiv2 accept `LONG`, `SLONG` and also `IFD`.
Exiv2 specifically supports only these three types - see
<https://github.com/Exiv2/exiv2/blob/2cd987a731236037b6b78cbff897d08685a8ef49/src/tiffvisitor_int.cpp#L1141>
(Git tag "v0.28.8"). ExifTool is more lenient - it even accepts
any integer type. In practice, real files most likely only use one
of the three types supported by Exiv2, so we stick with that.

  ]##
  if this.subIfdInstFlag:
    return this.subIfdInst
  if  ((this.numValues == 1) and ( ((this.fieldType == exif.long) or (this.fieldType == exif.ifd) or ( ((this.fieldType == exif.slong) and ((Exif_ExifBody_Slongs(this.data)).values[0] >= 0)) )) ) and ( ((this.tag == exif.exif_offset) or (this.tag == exif.interop_offset) or (this.tag == exif.gps_info)) )) :
    let io = Exif(this.root).io
    let pos = io.pos()
    io.seek(int((if this.fieldType == exif.slong: (uint32((Exif_ExifBody_Slongs(this.data)).values[0])) else: (Exif_ExifBody_Longs(this.data)).values[0])))
    if this.isLe:
      let subIfdInstExpr = Exif_ExifBody_Ifd.read(io, this.root, this, this.tag == exif.gps_info)
      this.subIfdInst = subIfdInstExpr
    else:
      let subIfdInstExpr = Exif_ExifBody_Ifd.read(io, this.root, this, this.tag == exif.gps_info)
      this.subIfdInst = subIfdInstExpr
    io.seek(pos)
  this.subIfdInstFlag = true
  return this.subIfdInst

proc tag(this: Exif_ExifBody_IfdField): Exif_Tag = 
  if this.tagInstFlag:
    return this.tagInst
  if not(this.parent.isGpsIfd):
    let tagInstExpr = Exif_Tag(Exif_Tag(this.tagRaw))
    this.tagInst = tagInstExpr
  this.tagInstFlag = true
  return this.tagInst

proc fromFile*(_: typedesc[Exif_ExifBody_IfdField], filename: string): Exif_ExifBody_IfdField =
  Exif_ExifBody_IfdField.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Exif_ExifBody_Longs) =
  for i in 0 ..< int(this.parent.numValues):
    let it = this.io.readU4le()
    this.values.add(it)


proc readBe(this: Exif_ExifBody_Longs) =
  for i in 0 ..< int(this.parent.numValues):
    let it = this.io.readU4be()
    this.values.add(it)

proc read*(_: typedesc[Exif_ExifBody_Longs], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_IfdField): Exif_ExifBody_Longs =
  template this: untyped = result
  this = new(Exif_ExifBody_Longs)
  let root = if root == nil: cast[Exif](this) else: cast[Exif](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc fromFile*(_: typedesc[Exif_ExifBody_Longs], filename: string): Exif_ExifBody_Longs =
  Exif_ExifBody_Longs.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Exif_ExifBody_Rational) =

  ##[
  Numerator
  ]##
  let valueNumExpr = this.io.readU4le()
  this.valueNum = valueNumExpr

  ##[
  Denominator
  ]##
  let valueDenExpr = this.io.readU4le()
  this.valueDen = valueDenExpr


proc readBe(this: Exif_ExifBody_Rational) =

  ##[
  Numerator
  ]##
  let valueNumExpr = this.io.readU4be()
  this.valueNum = valueNumExpr

  ##[
  Denominator
  ]##
  let valueDenExpr = this.io.readU4be()
  this.valueDen = valueDenExpr

proc read*(_: typedesc[Exif_ExifBody_Rational], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_Rationals): Exif_ExifBody_Rational =
  template this: untyped = result
  this = new(Exif_ExifBody_Rational)
  let root = if root == nil: cast[Exif](this) else: cast[Exif](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc value(this: Exif_ExifBody_Rational): float64 = 

  ##[
  If denominator is zero, this instance is disabled to prevent
`ZeroDivisionError` in Python.

Here's a sample file with a zero denominator in the IFD fields
`tag::x_resolution` and `tag::y_resolution` (both of which are of
type `field_type::rational`):
<https://github.com/python-pillow/Pillow/blob/807d689a83738027b6f6e0f219a6a6dd30e01c08/Tests/images/exif-dpi-zerodivision.jpg>

  ]##
  if this.valueInstFlag:
    return this.valueInst
  if this.valueDen != 0:
    let valueInstExpr = float64((this.valueNum + 0.0) div this.valueDen)
    this.valueInst = valueInstExpr
  this.valueInstFlag = true
  return this.valueInst

proc fromFile*(_: typedesc[Exif_ExifBody_Rational], filename: string): Exif_ExifBody_Rational =
  Exif_ExifBody_Rational.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Exif_ExifBody_Rationals) =
  for i in 0 ..< int(this.parent.numValues):
    let it = Exif_ExifBody_Rational.read(this.io, this.root, this)
    this.values.add(it)


proc readBe(this: Exif_ExifBody_Rationals) =
  for i in 0 ..< int(this.parent.numValues):
    let it = Exif_ExifBody_Rational.read(this.io, this.root, this)
    this.values.add(it)

proc read*(_: typedesc[Exif_ExifBody_Rationals], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_IfdField): Exif_ExifBody_Rationals =
  template this: untyped = result
  this = new(Exif_ExifBody_Rationals)
  let root = if root == nil: cast[Exif](this) else: cast[Exif](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc fromFile*(_: typedesc[Exif_ExifBody_Rationals], filename: string): Exif_ExifBody_Rationals =
  Exif_ExifBody_Rationals.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Exif_ExifBody_Sbytes) =
  for i in 0 ..< int(this.parent.numValues):
    let it = this.io.readS1()
    this.values.add(it)


proc readBe(this: Exif_ExifBody_Sbytes) =
  for i in 0 ..< int(this.parent.numValues):
    let it = this.io.readS1()
    this.values.add(it)

proc read*(_: typedesc[Exif_ExifBody_Sbytes], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_IfdField): Exif_ExifBody_Sbytes =
  template this: untyped = result
  this = new(Exif_ExifBody_Sbytes)
  let root = if root == nil: cast[Exif](this) else: cast[Exif](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc fromFile*(_: typedesc[Exif_ExifBody_Sbytes], filename: string): Exif_ExifBody_Sbytes =
  Exif_ExifBody_Sbytes.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Exif_ExifBody_Shorts) =
  for i in 0 ..< int(this.parent.numValues):
    let it = this.io.readU2le()
    this.values.add(it)


proc readBe(this: Exif_ExifBody_Shorts) =
  for i in 0 ..< int(this.parent.numValues):
    let it = this.io.readU2be()
    this.values.add(it)

proc read*(_: typedesc[Exif_ExifBody_Shorts], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_IfdField): Exif_ExifBody_Shorts =
  template this: untyped = result
  this = new(Exif_ExifBody_Shorts)
  let root = if root == nil: cast[Exif](this) else: cast[Exif](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc fromFile*(_: typedesc[Exif_ExifBody_Shorts], filename: string): Exif_ExifBody_Shorts =
  Exif_ExifBody_Shorts.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Exif_ExifBody_Slongs) =
  for i in 0 ..< int(this.parent.numValues):
    let it = this.io.readS4le()
    this.values.add(it)


proc readBe(this: Exif_ExifBody_Slongs) =
  for i in 0 ..< int(this.parent.numValues):
    let it = this.io.readS4be()
    this.values.add(it)

proc read*(_: typedesc[Exif_ExifBody_Slongs], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_IfdField): Exif_ExifBody_Slongs =
  template this: untyped = result
  this = new(Exif_ExifBody_Slongs)
  let root = if root == nil: cast[Exif](this) else: cast[Exif](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc fromFile*(_: typedesc[Exif_ExifBody_Slongs], filename: string): Exif_ExifBody_Slongs =
  Exif_ExifBody_Slongs.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Exif_ExifBody_Srational) =

  ##[
  Numerator
  ]##
  let valueNumExpr = this.io.readS4le()
  this.valueNum = valueNumExpr

  ##[
  Denominator
  ]##
  let valueDenExpr = this.io.readS4le()
  this.valueDen = valueDenExpr


proc readBe(this: Exif_ExifBody_Srational) =

  ##[
  Numerator
  ]##
  let valueNumExpr = this.io.readS4be()
  this.valueNum = valueNumExpr

  ##[
  Denominator
  ]##
  let valueDenExpr = this.io.readS4be()
  this.valueDen = valueDenExpr

proc read*(_: typedesc[Exif_ExifBody_Srational], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_Srationals): Exif_ExifBody_Srational =
  template this: untyped = result
  this = new(Exif_ExifBody_Srational)
  let root = if root == nil: cast[Exif](this) else: cast[Exif](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc value(this: Exif_ExifBody_Srational): float64 = 

  ##[
  If denominator is zero, this instance is disabled to prevent
`ZeroDivisionError` in Python.

Here's a sample file with a zero denominator in the IFD field
`tag::exposure_compensation` of type `field_type::srational`:
<https://github.com/drewnoakes/metadata-extractor-images/blob/651ad0e67aa8d43d358ad05f9bc07b52d8b9ac6e/jpg/Reconyx%20Hyperfire%20HP4K.jpg>

  ]##
  if this.valueInstFlag:
    return this.valueInst
  if this.valueDen != 0:
    let valueInstExpr = float64((this.valueNum + 0.0) div this.valueDen)
    this.valueInst = valueInstExpr
  this.valueInstFlag = true
  return this.valueInst

proc fromFile*(_: typedesc[Exif_ExifBody_Srational], filename: string): Exif_ExifBody_Srational =
  Exif_ExifBody_Srational.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Exif_ExifBody_Srationals) =
  for i in 0 ..< int(this.parent.numValues):
    let it = Exif_ExifBody_Srational.read(this.io, this.root, this)
    this.values.add(it)


proc readBe(this: Exif_ExifBody_Srationals) =
  for i in 0 ..< int(this.parent.numValues):
    let it = Exif_ExifBody_Srational.read(this.io, this.root, this)
    this.values.add(it)

proc read*(_: typedesc[Exif_ExifBody_Srationals], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_IfdField): Exif_ExifBody_Srationals =
  template this: untyped = result
  this = new(Exif_ExifBody_Srationals)
  let root = if root == nil: cast[Exif](this) else: cast[Exif](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc fromFile*(_: typedesc[Exif_ExifBody_Srationals], filename: string): Exif_ExifBody_Srationals =
  Exif_ExifBody_Srationals.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Exif_ExifBody_Sshorts) =
  for i in 0 ..< int(this.parent.numValues):
    let it = this.io.readS2le()
    this.values.add(it)


proc readBe(this: Exif_ExifBody_Sshorts) =
  for i in 0 ..< int(this.parent.numValues):
    let it = this.io.readS2be()
    this.values.add(it)

proc read*(_: typedesc[Exif_ExifBody_Sshorts], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_IfdField): Exif_ExifBody_Sshorts =
  template this: untyped = result
  this = new(Exif_ExifBody_Sshorts)
  let root = if root == nil: cast[Exif](this) else: cast[Exif](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc fromFile*(_: typedesc[Exif_ExifBody_Sshorts], filename: string): Exif_ExifBody_Sshorts =
  Exif_ExifBody_Sshorts.read(newKaitaiFileStream(filename), nil, nil)


proc readLe(this: Exif_ExifBody_Utf8String) =
  let valueExpr = encode(this.io.readBytesTerm(0, false, true, false), "UTF-8")
  this.value = valueExpr


proc readBe(this: Exif_ExifBody_Utf8String) =
  let valueExpr = encode(this.io.readBytesTerm(0, false, true, false), "UTF-8")
  this.value = valueExpr

proc read*(_: typedesc[Exif_ExifBody_Utf8String], io: KaitaiStream, root: KaitaiStruct, parent: Exif_ExifBody_IfdField): Exif_ExifBody_Utf8String =
  template this: untyped = result
  this = new(Exif_ExifBody_Utf8String)
  let root = if root == nil: cast[Exif](this) else: cast[Exif](root)
  this.io = io
  this.root = root
  this.parent = parent
  this.isLe = this.parent.isLe


  if this.isLe:
    readLe(this)
  else:
    readBe(this)

proc fromFile*(_: typedesc[Exif_ExifBody_Utf8String], filename: string): Exif_ExifBody_Utf8String =
  Exif_ExifBody_Utf8String.read(newKaitaiFileStream(filename), nil, nil)


import kaitai_struct_nim_runtime
import options

type
  Icc4* = ref object of KaitaiStruct
    `header`*: Icc4_ProfileHeader
    `tagTable`*: Icc4_TagTable
    `parent`*: KaitaiStruct
  Icc4_U8Fixed8Number* = ref object of KaitaiStruct
    `number`*: seq[byte]
    `parent`*: KaitaiStruct
  Icc4_U16Fixed16Number* = ref object of KaitaiStruct
    `number`*: seq[byte]
    `parent`*: KaitaiStruct
  Icc4_StandardIlluminantEncoding* = ref object of KaitaiStruct
    `standardIlluminantEncoding`*: Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings
    `parent`*: KaitaiStruct
  Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings* = enum
    unknown = 0
    d50 = 1
    d65 = 2
    d93 = 3
    f2 = 4
    d55 = 5
    a = 6
    equi_power = 7
    f8 = 8
  Icc4_ProfileHeader* = ref object of KaitaiStruct
    `size`*: uint32
    `preferredCmmType`*: Icc4_ProfileHeader_CmmSignatures
    `version`*: Icc4_ProfileHeader_VersionField
    `deviceClass`*: Icc4_ProfileHeader_ProfileClasses
    `colorSpace`*: Icc4_ProfileHeader_DataColourSpaces
    `pcs`*: string
    `creationDateTime`*: Icc4_DateTimeNumber
    `fileSignature`*: seq[byte]
    `primaryPlatform`*: Icc4_ProfileHeader_PrimaryPlatforms
    `profileFlags`*: Icc4_ProfileHeader_ProfileFlags
    `deviceManufacturer`*: Icc4_DeviceManufacturer
    `deviceModel`*: string
    `deviceAttributes`*: Icc4_DeviceAttributes
    `renderingIntent`*: Icc4_ProfileHeader_RenderingIntents
    `nciexyzValuesOfIlluminantOfPcs`*: Icc4_XyzNumber
    `creator`*: Icc4_DeviceManufacturer
    `identifier`*: seq[byte]
    `reservedData`*: seq[byte]
    `parent`*: Icc4
  Icc4_ProfileHeader_CmmSignatures* = enum
    the_imaging_factory_cmm = 858931796
    agfa_cmm = 1094929747
    adobe_cmm = 1094992453
    color_gear_cmm = 1128484179
    demoiccmax_cmm = 1145654616
    logosync_cmm = 1147629395
    efi_cmm = 1162234144
    exact_scan_cmm = 1163411779
    fuji_film_cmm = 1179000864
    harlequin_rip_cmm = 1212370253
    heidelberg_cmm = 1212435744
    kodak_cmm = 1262701907
    konica_minolta_cmm = 1296256324
    onyx_graphics_cmm = 1330534744
    device_link_cmm = 1380404563
    reficcmax_cmm = 1380535640
    sample_icc_cmm = 1397310275
    mutoh_cmm = 1397311310
    toshiba_cmm = 1413696845
    color_gear_cmm_lite = 1430471501
    color_gear_cmm_c = 1430474067
    windows_color_system_cmm = 1464029984
    ware_to_go_cmm = 1465141024
    apple_cmm = 1634758764
    argyll_cms_cmm = 1634887532
    little_cms_cmm = 1818455411
    vivo_cmm = 1986623087
    zoran_cmm = 2053320752
  Icc4_ProfileHeader_PrimaryPlatforms* = enum
    apple_computer_inc = 1095782476
    microsoft_corporation = 1297303124
    silicon_graphics_inc = 1397180704
    sun_microsystems = 1398099543
  Icc4_ProfileHeader_ProfileClasses* = enum
    abstract_profile = 1633842036
    device_link_profile = 1818848875
    display_device_profile = 1835955314
    named_color_profile = 1852662636
    output_device_profile = 1886549106
    input_device_profile = 1935896178
    color_space_profile = 1936744803
  Icc4_ProfileHeader_RenderingIntents* = enum
    perceptual = 0
    media_relative_colorimetric = 1
    saturation = 2
    icc_absolute_colorimetric = 3
  Icc4_ProfileHeader_DataColourSpaces* = enum
    two_colour = 843271250
    three_colour = 860048466
    four_colour = 876825682
    five_colour = 893602898
    six_colour = 910380114
    seven_colour = 927157330
    eight_colour = 943934546
    nine_colour = 960711762
    ten_colour = 1094929490
    eleven_colour = 1111706706
    twelve_colour = 1128483922
    cmy = 1129142560
    cmyk = 1129142603
    thirteen_colour = 1145261138
    fourteen_colour = 1162038354
    fifteen_colour = 1178815570
    gray = 1196573017
    hls = 1212961568
    hsv = 1213421088
    cielab_or_pcslab = 1281450528
    cieluv = 1282766368
    rgb = 1380401696
    nciexyz_or_pcsxyz = 1482250784
    ycbcr = 1497588338
    cieyxy = 1501067552
  Icc4_ProfileHeader_VersionField* = ref object of KaitaiStruct
    `major`*: seq[byte]
    `minor`*: uint64
    `bugFixLevel`*: uint64
    `reserved`*: seq[byte]
    `parent`*: Icc4_ProfileHeader
  Icc4_ProfileHeader_ProfileFlags* = ref object of KaitaiStruct
    `embeddedProfile`*: bool
    `profileCanBeUsedIndependentlyOfEmbeddedColourData`*: bool
    `otherFlags`*: uint64
    `parent`*: Icc4_ProfileHeader
  Icc4_XyzNumber* = ref object of KaitaiStruct
    `x`*: seq[byte]
    `y`*: seq[byte]
    `z`*: seq[byte]
    `parent`*: KaitaiStruct
  Icc4_DateTimeNumber* = ref object of KaitaiStruct
    `year`*: uint16
    `month`*: uint16
    `day`*: uint16
    `hour`*: uint16
    `minute`*: uint16
    `second`*: uint16
    `parent`*: KaitaiStruct
  Icc4_Response16Number* = ref object of KaitaiStruct
    `number`*: uint32
    `reserved`*: seq[byte]
    `measurementValue`*: Icc4_S15Fixed16Number
    `parent`*: KaitaiStruct
  Icc4_U1Fixed15Number* = ref object of KaitaiStruct
    `number`*: seq[byte]
    `parent`*: KaitaiStruct
  Icc4_TagTable* = ref object of KaitaiStruct
    `tagCount`*: uint32
    `tags`*: seq[Icc4_TagTable_TagDefinition]
    `parent`*: Icc4
  Icc4_TagTable_TagDefinition* = ref object of KaitaiStruct
    `tagSignature`*: Icc4_TagTable_TagDefinition_TagSignatures
    `offsetToDataElement`*: uint32
    `sizeOfDataElement`*: uint32
    `parent`*: Icc4_TagTable
    `rawTagDataElementInst`*: seq[byte]
    `tagDataElementInst`*: KaitaiStruct
  Icc4_TagTable_TagDefinition_TagSignatures* = enum
    a_to_b_0 = 1093812784
    a_to_b_1 = 1093812785
    a_to_b_2 = 1093812786
    b_to_a_0 = 1110589744
    b_to_a_1 = 1110589745
    b_to_a_2 = 1110589746
    b_to_d_0 = 1110590512
    b_to_d_1 = 1110590513
    b_to_d_2 = 1110590514
    b_to_d_3 = 1110590515
    d_to_b_0 = 1144144432
    d_to_b_1 = 1144144433
    d_to_b_2 = 1144144434
    d_to_b_3 = 1144144435
    blue_trc = 1649693251
    blue_matrix_column = 1649957210
    calibration_date_time = 1667329140
    chromatic_adaptation = 1667785060
    chromaticity = 1667789421
    colorimetric_intent_image_state = 1667852659
    colorant_table_out = 1668050804
    colorant_order = 1668051567
    colorant_table = 1668051572
    copyright = 1668313716
    profile_description = 1684370275
    device_model_desc = 1684890724
    device_mfg_desc = 1684893284
    green_trc = 1733579331
    green_matrix_column = 1733843290
    gamut = 1734438260
    gray_trc = 1800688195
    luminance = 1819635049
    measurement = 1835360627
    named_color_2 = 1852009522
    preview_0 = 1886545200
    preview_1 = 1886545201
    preview_2 = 1886545202
    profile_sequence = 1886610801
    profile_sequence_identifier = 1886611812
    red_trc = 1918128707
    red_matrix_column = 1918392666
    output_response = 1919251312
    perceptual_rendering_intent_gamut = 1919510320
    saturation_rendering_intent_gamut = 1919510322
    char_target = 1952543335
    technology = 1952801640
    viewing_conditions = 1986618743
    viewing_cond_desc = 1987405156
    media_white_point = 2004119668
  Icc4_TagTable_TagDefinition_TagTypeSignatures* = enum
    xyz_type = 1482250784
    chromaticity_type = 1667789421
    colorant_order_type = 1668051567
    colorant_table_type = 1668051572
    curve_type = 1668641398
    data_type = 1684108385
    date_time_type = 1685350765
    multi_function_a_to_b_table_type = 1832993312
    multi_function_b_to_a_table_type = 1833058592
    measurement_type = 1835360627
    multi_function_table_with_one_byte_precision_type = 1835430961
    multi_function_table_with_two_byte_precision_type = 1835430962
    multi_localized_unicode_type = 1835824483
    multi_process_elements_type = 1836082548
    named_color_2_type = 1852009522
    parametric_curve_type = 1885434465
    profile_sequence_desc_type = 1886610801
    profile_sequence_identifier_type = 1886611812
    response_curve_set_16_type = 1919120178
    s_15_fixed_16_array_type = 1936077618
    signature_type = 1936287520
    text_type = 1952807028
    u_16_fixed_16_array_type = 1969632050
    u_int_8_array_type = 1969827896
    u_int_16_array_type = 1969828150
    u_int_32_array_type = 1969828658
    u_int_64_array_type = 1969829428
    viewing_conditions_type = 1986618743
  Icc4_TagTable_TagDefinition_MultiProcessElementsTypes* = enum
    bacs_element_type = 1648444243
    clut_element_type = 1668052340
    one_dimensional_curves_type = 1668641382
    eacs_element_type = 1698775891
    matrix_element_type = 1835103334
    curve_set_element_table_type = 1835428980
    formula_curve_segments_type = 1885434470
    sampled_curve_segment_type = 1935764838
  Icc4_TagTable_TagDefinition_BlueMatrixColumnTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_XyzType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_DeviceMfgDescTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType
    `parent`*: KaitaiStruct
  Icc4_TagTable_TagDefinition_NamedColor2Type* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `vendorSpecificFlag`*: uint32
    `countOfNamedColours`*: uint32
    `numberOfDeviceCoordinatesForEachNamedColour`*: uint32
    `prefixForEachColourName`*: string
    `prefixForEachColourNamePadding`*: seq[seq[byte]]
    `suffixForEachColourName`*: string
    `suffixForEachColourNamePadding`*: seq[seq[byte]]
    `namedColourDefinitions`*: seq[Icc4_TagTable_TagDefinition_NamedColor2Type_NamedColourDefinition]
    `parent`*: Icc4_TagTable_TagDefinition_NamedColor2Tag
  Icc4_TagTable_TagDefinition_NamedColor2Type_NamedColourDefinition* = ref object of KaitaiStruct
    `rootName`*: string
    `rootNamePadding`*: seq[seq[byte]]
    `pcsCoordinates`*: seq[byte]
    `deviceCoordinates`*: seq[uint16]
    `parent`*: Icc4_TagTable_TagDefinition_NamedColor2Type
  Icc4_TagTable_TagDefinition_ViewingConditionsTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_ViewingConditionsType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_BlueTrcTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: KaitaiStruct
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_ResponseCurveSet16Type* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `numberOfChannels`*: uint16
    `countOfMeasurementTypes`*: uint16
    `responseCurveStructureOffsets`*: seq[uint32]
    `responseCurveStructures`*: seq[byte]
    `parent`*: Icc4_TagTable_TagDefinition_OutputResponseTag
  Icc4_TagTable_TagDefinition_CurveType* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `numberOfEntries`*: uint32
    `curveValues`*: seq[uint16]
    `curveValue`*: uint8
    `parent`*: KaitaiStruct
  Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_SignatureType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_XyzType* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `values`*: seq[Icc4_XyzNumber]
    `parent`*: KaitaiStruct
  Icc4_TagTable_TagDefinition_Lut8Type* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `numberOfInputChannels`*: uint8
    `numberOfOutputChannels`*: uint8
    `numberOfClutGridPoints`*: uint8
    `padding`*: seq[byte]
    `encodedEParameters`*: seq[int32]
    `numberOfInputTableEntries`*: uint32
    `numberOfOutputTableEntries`*: uint32
    `inputTables`*: seq[byte]
    `clutValues`*: seq[byte]
    `outputTables`*: seq[byte]
    `parent`*: KaitaiStruct
  Icc4_TagTable_TagDefinition_BToA2Tag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: KaitaiStruct
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_LutAToBType* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `numberOfInputChannels`*: uint8
    `numberOfOutputChannels`*: uint8
    `padding`*: seq[byte]
    `offsetToFirstBCurve`*: uint32
    `offsetToMatrix`*: uint32
    `offsetToFirstMCurve`*: uint32
    `offsetToClut`*: uint32
    `offsetToFirstACurve`*: uint32
    `data`*: seq[byte]
    `parent`*: KaitaiStruct
  Icc4_TagTable_TagDefinition_BToA0Tag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: KaitaiStruct
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_MediaWhitePointTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_XyzType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_Lut16Type* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `numberOfInputChannels`*: uint8
    `numberOfOutputChannels`*: uint8
    `numberOfClutGridPoints`*: uint8
    `padding`*: seq[byte]
    `encodedEParameters`*: seq[int32]
    `numberOfInputTableEntries`*: uint16
    `numberOfOutputTableEntries`*: uint16
    `inputTables`*: seq[byte]
    `clutValues`*: seq[byte]
    `outputTables`*: seq[byte]
    `parent`*: KaitaiStruct
  Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_SignatureType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_U16Fixed16ArrayType* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `values`*: seq[Icc4_U16Fixed16Number]
    `parent`*: KaitaiStruct
  Icc4_TagTable_TagDefinition_ColorantTableOutTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_ColorantTableType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_MeasurementTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_MeasurementType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_ProfileSequenceTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_ProfileSequenceDescType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_TechnologyTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_SignatureType
    `parent`*: KaitaiStruct
  Icc4_TagTable_TagDefinition_AToB0Tag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: KaitaiStruct
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_DToB0Tag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_MultiProcessElementsType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_OutputResponseTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_ResponseCurveSet16Type
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_GreenMatrixColumnTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_XyzType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_ProfileDescriptionTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_Preview1Tag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: KaitaiStruct
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_RedTrcTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: KaitaiStruct
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_BToD0Tag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_MultiProcessElementsType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_DToB1Tag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_MultiProcessElementsType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_BToA1Tag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: KaitaiStruct
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_ParametricCurveType* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `functionType`*: Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions
    `reserved2`*: seq[byte]
    `parameters`*: KaitaiStruct
    `parent`*: KaitaiStruct
  Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions* = enum
    y_equals_x_to_power_of_g = 0
    cie_122_1996 = 1
    iec_61966_3 = 2
    iec_61966_2_1 = 3
    y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c = 4
  Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663* = ref object of KaitaiStruct
    `g`*: int32
    `a`*: int32
    `b`*: int32
    `c`*: int32
    `parent`*: Icc4_TagTable_TagDefinition_ParametricCurveType
  Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621* = ref object of KaitaiStruct
    `g`*: int32
    `a`*: int32
    `b`*: int32
    `c`*: int32
    `d`*: int32
    `parent`*: Icc4_TagTable_TagDefinition_ParametricCurveType
  Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsXToPowerOfG* = ref object of KaitaiStruct
    `g`*: int32
    `parent`*: Icc4_TagTable_TagDefinition_ParametricCurveType
  Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC* = ref object of KaitaiStruct
    `g`*: int32
    `a`*: int32
    `b`*: int32
    `c`*: int32
    `d`*: int32
    `e`*: int32
    `f`*: int32
    `parent`*: Icc4_TagTable_TagDefinition_ParametricCurveType
  Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996* = ref object of KaitaiStruct
    `g`*: int32
    `a`*: int32
    `b`*: int32
    `parent`*: Icc4_TagTable_TagDefinition_ParametricCurveType
  Icc4_TagTable_TagDefinition_ChromaticityTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_ChromaticityType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_ChromaticAdaptationTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_S15Fixed16ArrayType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_MeasurementType* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `standardObserverEncoding`*: Icc4_TagTable_TagDefinition_MeasurementType_StandardObserverEncodings
    `nciexyzTristimulusValuesForMeasurementBacking`*: Icc4_XyzNumber
    `measurementGeometryEncoding`*: Icc4_TagTable_TagDefinition_MeasurementType_MeasurementGeometryEncodings
    `measurementFlareEncoding`*: Icc4_TagTable_TagDefinition_MeasurementType_MeasurementFlareEncodings
    `standardIlluminantEncoding`*: Icc4_StandardIlluminantEncoding
    `parent`*: Icc4_TagTable_TagDefinition_MeasurementTag
  Icc4_TagTable_TagDefinition_MeasurementType_StandardObserverEncodings* = enum
    unknown = 0
    cie_1931_standard_colorimetric_observer = 1
    cie_1964_standard_colorimetric_observer = 2
  Icc4_TagTable_TagDefinition_MeasurementType_MeasurementGeometryEncodings* = enum
    unknown = 0
    zero_degrees_to_45_degrees_or_45_degrees_to_zero_degrees = 1
    zero_degrees_to_d_degrees_or_d_degrees_to_zero_degrees = 2
  Icc4_TagTable_TagDefinition_MeasurementType_MeasurementFlareEncodings* = enum
    zero_percent = 0
    one_hundred_percent = 65536
  Icc4_TagTable_TagDefinition_TextType* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `value`*: string
    `parent`*: Icc4_TagTable_TagDefinition_CharTargetTag
  Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `numberOfStructures`*: uint32
    `positionsTable`*: seq[Icc4_PositionNumber]
    `profileIdentifiers`*: seq[Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType_ProfileIdentifier]
    `parent`*: Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag
  Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType_ProfileIdentifier* = ref object of KaitaiStruct
    `profileId`*: seq[byte]
    `profileDescription`*: Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType
    `parent`*: Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType
  Icc4_TagTable_TagDefinition_ColorantTableType* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `countOfColorants`*: uint32
    `colorants`*: seq[Icc4_TagTable_TagDefinition_ColorantTableType_Colorant]
    `parent`*: KaitaiStruct
  Icc4_TagTable_TagDefinition_ColorantTableType_Colorant* = ref object of KaitaiStruct
    `name`*: string
    `padding`*: seq[seq[byte]]
    `pcsValues`*: seq[byte]
    `parent`*: Icc4_TagTable_TagDefinition_ColorantTableType
  Icc4_TagTable_TagDefinition_SignatureType* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `signature`*: string
    `parent`*: KaitaiStruct
  Icc4_TagTable_TagDefinition_CopyrightTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_Preview0Tag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: KaitaiStruct
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_DateTimeType* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `dateAndTime`*: Icc4_DateTimeNumber
    `parent`*: Icc4_TagTable_TagDefinition_CalibrationDateTimeTag
  Icc4_TagTable_TagDefinition_DToB3Tag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_MultiProcessElementsType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_Preview2Tag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: KaitaiStruct
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_DeviceModelDescTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType
    `parent`*: KaitaiStruct
  Icc4_TagTable_TagDefinition_MultiProcessElementsType* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `numberOfInputChannels`*: uint16
    `numberOfOutputChannels`*: uint16
    `numberOfProcessingElements`*: uint32
    `processElementPositionsTable`*: seq[Icc4_PositionNumber]
    `data`*: seq[byte]
    `parent`*: KaitaiStruct
  Icc4_TagTable_TagDefinition_UInt16ArrayType* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `values`*: seq[uint16]
    `parent`*: KaitaiStruct
  Icc4_TagTable_TagDefinition_ColorantOrderTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_ColorantOrderType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_DataType* = ref object of KaitaiStruct
    `dataFlag`*: Icc4_TagTable_TagDefinition_DataType_DataTypes
    `parent`*: KaitaiStruct
  Icc4_TagTable_TagDefinition_DataType_DataTypes* = enum
    ascii_data = 0
    binary_data = 1
  Icc4_TagTable_TagDefinition_ChromaticityType* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `numberOfDeviceChannels`*: uint16
    `colorantAndPhosphorEncoding`*: Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings
    `ciexyCoordinatesPerChannel`*: seq[Icc4_TagTable_TagDefinition_ChromaticityType_CiexyCoordinateValues]
    `parent`*: Icc4_TagTable_TagDefinition_ChromaticityTag
  Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings* = enum
    unknown = 0
    itu_r_bt_709_2 = 1
    smpte_rp145 = 2
    ebu_tech_3213_e = 3
    p22 = 4
  Icc4_TagTable_TagDefinition_ChromaticityType_CiexyCoordinateValues* = ref object of KaitaiStruct
    `xCoordinate`*: uint16
    `yCoordinate`*: uint16
    `parent`*: Icc4_TagTable_TagDefinition_ChromaticityType
  Icc4_TagTable_TagDefinition_LuminanceTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_XyzType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_S15Fixed16ArrayType* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `values`*: seq[Icc4_S15Fixed16Number]
    `parent`*: Icc4_TagTable_TagDefinition_ChromaticAdaptationTag
  Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `numberOfRecords`*: uint32
    `recordSize`*: uint32
    `records`*: seq[Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record]
    `parent`*: KaitaiStruct
  Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record* = ref object of KaitaiStruct
    `languageCode`*: uint16
    `countryCode`*: uint16
    `stringLength`*: uint32
    `stringOffset`*: uint32
    `parent`*: Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType
    `stringDataInst`*: string
  Icc4_TagTable_TagDefinition_AToB2Tag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: KaitaiStruct
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_AToB1Tag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: KaitaiStruct
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_SignatureType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_CharTargetTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_TextType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_ColorantTableTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_ColorantTableType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_CalibrationDateTimeTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_DateTimeType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_NamedColor2Tag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_NamedColor2Type
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_ViewingCondDescTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_BToD3Tag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_MultiProcessElementsType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_ProfileSequenceDescType* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `numberOfDescriptionStructures`*: uint32
    `profileDescriptions`*: seq[Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription]
    `parent`*: Icc4_TagTable_TagDefinition_ProfileSequenceTag
  Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription* = ref object of KaitaiStruct
    `deviceManufacturer`*: Icc4_DeviceManufacturer
    `deviceModel`*: string
    `deviceAttributes`*: Icc4_DeviceAttributes
    `deviceTechnology`*: Icc4_TagTable_TagDefinition_TechnologyTag
    `descriptionOfDeviceManufacturer`*: Icc4_TagTable_TagDefinition_DeviceMfgDescTag
    `descriptionOfDeviceModel`*: Icc4_TagTable_TagDefinition_DeviceModelDescTag
    `parent`*: Icc4_TagTable_TagDefinition_ProfileSequenceDescType
  Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_BToD1Tag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_MultiProcessElementsType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_ColorantOrderType* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `countOfColorants`*: uint32
    `numbersOfColorantsInOrderOfPrinting`*: seq[uint8]
    `parent`*: Icc4_TagTable_TagDefinition_ColorantOrderTag
  Icc4_TagTable_TagDefinition_DToB2Tag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_MultiProcessElementsType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_GrayTrcTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: KaitaiStruct
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_ViewingConditionsType* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `unNormalizedCiexyzValuesForIlluminant`*: Icc4_XyzNumber
    `unNormalizedCiexyzValuesForSurround`*: Icc4_XyzNumber
    `illuminantType`*: Icc4_StandardIlluminantEncoding
    `parent`*: Icc4_TagTable_TagDefinition_ViewingConditionsTag
  Icc4_TagTable_TagDefinition_LutBToAType* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `numberOfInputChannels`*: uint8
    `numberOfOutputChannels`*: uint8
    `padding`*: seq[byte]
    `offsetToFirstBCurve`*: uint32
    `offsetToMatrix`*: uint32
    `offsetToFirstMCurve`*: uint32
    `offsetToClut`*: uint32
    `offsetToFirstACurve`*: uint32
    `data`*: seq[byte]
    `parent`*: KaitaiStruct
  Icc4_TagTable_TagDefinition_GreenTrcTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: KaitaiStruct
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_UInt32ArrayType* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `values`*: seq[uint32]
    `parent`*: KaitaiStruct
  Icc4_TagTable_TagDefinition_GamutTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: KaitaiStruct
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_UInt8ArrayType* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `values`*: seq[uint8]
    `parent`*: KaitaiStruct
  Icc4_TagTable_TagDefinition_RedMatrixColumnTag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_XyzType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_TagTable_TagDefinition_UInt64ArrayType* = ref object of KaitaiStruct
    `reserved`*: seq[byte]
    `values`*: seq[uint64]
    `parent`*: KaitaiStruct
  Icc4_TagTable_TagDefinition_BToD2Tag* = ref object of KaitaiStruct
    `tagType`*: Icc4_TagTable_TagDefinition_TagTypeSignatures
    `tagData`*: Icc4_TagTable_TagDefinition_MultiProcessElementsType
    `parent`*: Icc4_TagTable_TagDefinition
  Icc4_DeviceAttributes* = ref object of KaitaiStruct
    `reflectiveOrTransparency`*: Icc4_DeviceAttributes_DeviceAttributesReflectiveOrTransparency
    `glossyOrMatte`*: Icc4_DeviceAttributes_DeviceAttributesGlossyOrMatte
    `positiveOrNegativeMediaPolarity`*: Icc4_DeviceAttributes_DeviceAttributesPositiveOrNegativeMediaPolarity
    `colourOrBlackAndWhiteMedia`*: Icc4_DeviceAttributes_DeviceAttributesColourOrBlackAndWhiteMedia
    `reserved`*: uint64
    `vendorSpecific`*: uint64
    `parent`*: KaitaiStruct
  Icc4_DeviceAttributes_DeviceAttributesReflectiveOrTransparency* = enum
    reflective = 0
    transparency = 1
  Icc4_DeviceAttributes_DeviceAttributesGlossyOrMatte* = enum
    glossy = 0
    matte = 1
  Icc4_DeviceAttributes_DeviceAttributesPositiveOrNegativeMediaPolarity* = enum
    positive_media_polarity = 0
    negative_media_polarity = 1
  Icc4_DeviceAttributes_DeviceAttributesColourOrBlackAndWhiteMedia* = enum
    colour_media = 0
    black_and_white_media = 1
  Icc4_DeviceManufacturer* = ref object of KaitaiStruct
    `deviceManufacturer`*: Icc4_DeviceManufacturer_DeviceManufacturers
    `parent`*: KaitaiStruct
  Icc4_DeviceManufacturer_DeviceManufacturers* = enum
    erdt_systems_gmbh_and_co_kg = 878981744
    aamazing_technologies_inc = 1094798657
    acer_peripherals = 1094927698
    acolyte_color_research = 1094929492
    actix_sytems_inc = 1094931529
    adara_technology_inc = 1094992210
    adobe_systems_incorporated = 1094992453
    adi_systems_inc = 1094994208
    agfa_graphics_nv = 1095190081
    alps_electric_usa_inc = 1095519556
    alps_electric_usa_inc_2 = 1095520339
    alwan_color_expertise = 1095522126
    amiable_technologies_inc = 1095586889
    aoc_international_usa_ltd = 1095713568
    apago = 1095778631
    apple_computer_inc = 1095782476
    ast = 1095980064
    atandt_computer_systems = 1096033876
    barbieri_electronic = 1111573836
    barco_nv = 1112687439
    breakpoint_pty_limited = 1112689488
    brother_industries_ltd = 1112690516
    bull = 1112886348
    bus_computer_systems = 1112888096
    c_itoh = 1127041364
    intel_corporation = 1128353106
    canon_inc_canon_development_americas_inc = 1128353359
    carroll_touch = 1128354386
    casio_computer_co_ltd = 1128354633
    colorbus_pl = 1128420691
    crossfield = 1128614944
    crossfield_2 = 1128615032
    cgs_publishing_technologies_international_gmbh = 1128747808
    rochester_robotics = 1128811808
    colour_imaging_group_london = 1128875852
    citizen = 1128879177
    candela_ltd = 1129066544
    color_iq = 1129072977
    chromaco_inc = 1129136975
    chromix = 1129146712
    colorgraphic_communications_corporation = 1129270351
    compaq_computer_corporation = 1129270608
    compeq_usa_focus_technology = 1129270640
    conrac_display_products = 1129270866
    cordata_technologies_inc = 1129271876
    compaq_computer_corporation_2 = 1129337120
    colorpro = 1129337423
    cornerstone = 1129467424
    ctx_international_inc = 1129601056
    colorvision = 1129728339
    fujitsu_laboratories_ltd = 1129792288
    darius_technology_ltd = 1145131593
    dataproducts = 1145132097
    dry_creek_photo = 1145262112
    digital_contents_resource_center_chung_ang_university = 1145262659
    dell_computer_corporation = 1145392204
    dainippon_ink_and_chemicals = 1145652000
    diconix = 1145652047
    digital = 1145653065
    digital_light_and_color = 1145841219
    doppelganger_llc = 1146113095
    dainippon_screen = 1146298400
    doosol = 1146310476
    dupont = 1146441806
    epson = 1162892111
    esko_graphics = 1163086671
    electronics_and_telecommunications_research_institute = 1163153993
    everex_systems_inc = 1163281746
    exactcode_gmbh = 1163411779
    eizo_nanao_corporation = 1164540527
    falco_data_products_inc = 1178684483
    fuji_photo_film_coltd = 1179000864
    fujifilm_electronic_imaging_ltd = 1179010377
    fnord_software = 1179537988
    fora_inc = 1179603521
    forefront_technology_corporation = 1179603525
    fujitsu = 1179658794
    waytech_development_inc = 1179664672
    fujitsu_2 = 1179994697
    fuji_xerox_co_ltd = 1180180512
    gcc_technologies_inc = 1195590432
    global_graphics_software_limited = 1195856716
    gretagmacbeth = 1196245536
    gmg_gmbh_and_co_kg = 1196246816
    goldstar_technology_inc = 1196379204
    giantprint_pty_ltd = 1196446292
    gretagmacbeth_2 = 1196707138
    waytech_development_inc_2 = 1196835616
    sony_corporation = 1196896843
    hci = 1212369184
    heidelberger_druckmaschinen_ag = 1212435744
    hermes = 1212502605
    hitachi_america_ltd = 1212765249
    hewlett_packard = 1213210656
    hitachi_ltd = 1213481760
    hiti_digital_inc = 1214862441
    ibm_corporation = 1229081888
    scitex_corporation_ltd = 1229213268
    hewlett_packard_2 = 1229275936
    iiyama_north_america_inc = 1229543745
    ikegami_electronics_inc = 1229669703
    image_systems_corporation = 1229799751
    ingram_micro_inc = 1229801760
    intel_corporation_2 = 1229870147
    intl = 1229870156
    intra_electronics_usa_inc = 1229870162
    iocomm_international_technology_corporation = 1229931343
    infoprint_solutions_company = 1230000928
    scitex_corporation_ltd_3 = 1230129491
    ichikawa_soft_laboratory = 1230195744
    itnl = 1230261836
    ivm = 1230392608
    iwatsu_electric_co_ltd = 1230455124
    scitex_corporation_ltd_2 = 1231318644
    inca_digital_printers_ltd = 1231971169
    scitex_corporation_ltd_4 = 1232234867
    jetsoft_development = 1246971476
    jvc_information_products_co = 1247167264
    scitex_corporation_ltd_6 = 1262572116
    kfc_computek_components_corporation = 1262895904
    klh_computers = 1263290400
    konica_minolta_holdings_inc = 1263355972
    konica_corporation = 1263420225
    kodak = 1263486017
    kyocera = 1264144195
    scitex_corporation_ltd_7 = 1264677492
    leica_camera_ag = 1279476039
    leeds_colour = 1279476548
    left_dakota = 1279541579
    leading_technology_inc = 1279607108
    lexmark_international_inc = 1279613005
    link_computer_inc = 1279872587
    linotronic = 1279872591
    lite_on_inc = 1279874117
    mag_computronic_usa_inc = 1296123715
    mag_innovision_inc = 1296123721
    mannesmann = 1296125518
    micron_technology_inc = 1296646990
    microtek = 1296646994
    microvitec_inc = 1296646998
    minolta = 1296649807
    mitsubishi_electronics_america_inc = 1296651347
    mitsuba_corporation = 1296651379
    minolta_2 = 1296976980
    modgraph_inc = 1297040455
    monitronix_inc = 1297043017
    monaco_systems_inc = 1297043027
    morse_technology_inc = 1297044051
    motive_systems = 1297044553
    microsoft_corporation = 1297303124
    mutoh_industries_ltd = 1297437775
    mitsubishi_electric_corporation_kyoto_works = 1298756723
    nanao_usa_corporation = 1312902721
    nec_corporation = 1313162016
    nexpress_solutions_llc = 1313167440
    nissei_sangyo_america_ltd = 1313428307
    nikon_corporation = 1313558350
    oce_technologies_bv = 1329808672
    ocecolor = 1329808707
    oki = 1330333984
    okidata = 1330334020
    okidata_2 = 1330334032
    olivetti = 1330399574
    olympus_optical_co_ltd = 1330403661
    onyx_graphics = 1330534744
    optiquest = 1330664521
    packard_bell = 1346454347
    matsushita_electric_industrial_co_ltd = 1346457153
    pantone_inc = 1346457172
    packard_bell_2 = 1346522656
    pfu_limited = 1346786592
    philips_consumer_electronics_co = 1346914636
    hoya_corporation_pentax_imaging_systems_division = 1347310680
    phase_one_a_s = 1347382885
    premier_computer_innovations = 1347568973
    princeton_graphic_systems = 1347569998
    princeton_publishing_labs = 1347570000
    qlux = 1363957080
    qms_inc = 1364022048
    qpcard_ab = 1364214596
    quadlaser = 1364541764
    qume_corporation = 1364544837
    radius_inc = 1380009033
    integrated_color_solutions_inc_2 = 1380205688
    roland_dg_corporation = 1380206368
    redms_group_inc = 1380271181
    relisys = 1380273225
    rolf_gierling_multitools = 1380404563
    ricoh_corporation = 1380533071
    edmund_ronald = 1380863044
    royal = 1380931905
    ricoh_printing_systemsltd = 1380991776
    royal_information_electronics_co_ltd = 1381256224
    sampo_corporation_of_america = 1396788560
    samsung_inc = 1396788563
    jaime_santana_pomares = 1396788820
    scitex_corporation_ltd_9 = 1396918612
    dainippon_screen_3 = 1396920910
    scitex_corporation_ltd_12 = 1396985888
    samsung_electronics_coltd = 1397048096
    seiko_instruments_usa_inc = 1397049675
    seikosha = 1397049707
    scanguycom = 1397183833
    sharp_laboratories = 1397244242
    international_color_consortium = 1397310275
    sony_corporation_2 = 1397706329
    spectracal = 1397769036
    star = 1398030674
    sampo_technology_corporation = 1398031136
    scitex_corporation_ltd_10 = 1399023988
    scitex_corporation_ltd_13 = 1399091232
    sony_corporation_3 = 1399811705
    talon_technology_corporation = 1413565519
    tandy = 1413566020
    tatung_co_of_america_inc = 1413567573
    taxan_america_inc = 1413568577
    tokyo_denshi_sekei_kk = 1413763872
    teco_information_systems_inc = 1413825359
    tegra = 1413826386
    tektronix_inc = 1413827412
    texas_instruments = 1414078496
    typemaker_ltd = 1414351698
    toshiba_corp = 1414484802
    toshiba_inc = 1414484808
    totoku_electric_co_ltd = 1414485067
    triumph = 1414678869
    toshiba_tec_corporation = 1414742612
    ttx_computer_products_inc = 1414813728
    tvm_professional_monitor_corporation = 1414941984
    tw_casper_corporation = 1414996000
    ulead_systems = 1431065432
    unisys = 1431193939
    utz_fehlau_and_sohn = 1431591494
    varityper = 1447121481
    viewsonic = 1447642455
    visual_communication = 1447646028
    wang = 1463897671
    wilbur_imaging = 1464615506
    ware_to_go = 1465141042
    wyse_technology = 1465471813
    xerox_corporation = 1480938072
    x_rite = 1481787732
    lavanyas_test_company = 1513173555
    zoran_corporation = 1515340110
    zebra_technologies_inc = 1516593778
    basiccolor_gmbh = 1648968515
    bergdesign_incorporated = 1650815591
    integrated_color_solutions_inc = 1667594596
    macdermid_colorspan_inc = 1668051824
    dainippon_screen_2 = 1685266464
    dupont_2 = 1685418094
    fujifilm_electronic_imaging_ltd_2 = 1717986665
    fluxdata_corporation = 1718383992
    scitex_corporation_ltd_5 = 1769105779
    scitex_corporation_ltd_8 = 1801548404
    erdt_systems_gmbh_and_co_kg_2 = 1868706916
    medigraph_gmbh = 1868720483
    qubyx_sarl = 1903518329
    scitex_corporation_ltd_11 = 1935894900
    dainippon_screen_4 = 1935897198
    scitex_corporation_ltd_14 = 1935962144
    siwi_grafika_corporation = 1936291689
    yxymaster_gmbh = 2037938541
  Icc4_S15Fixed16Number* = ref object of KaitaiStruct
    `number`*: seq[byte]
    `parent`*: Icc4_TagTable_TagDefinition_S15Fixed16ArrayType
  Icc4_PositionNumber* = ref object of KaitaiStruct
    `offsetToDataElement`*: uint32
    `sizeOfDataElement`*: uint32
    `parent`*: KaitaiStruct

proc read*(_: typedesc[Icc4], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4
proc read*(_: typedesc[Icc4_U8Fixed8Number], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_U8Fixed8Number
proc read*(_: typedesc[Icc4_U16Fixed16Number], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_U16Fixed16Number
proc read*(_: typedesc[Icc4_StandardIlluminantEncoding], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_StandardIlluminantEncoding
proc read*(_: typedesc[Icc4_ProfileHeader], io: KaitaiStream, root: KaitaiStruct, parent: Icc4): Icc4_ProfileHeader
proc read*(_: typedesc[Icc4_ProfileHeader_VersionField], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_ProfileHeader): Icc4_ProfileHeader_VersionField
proc read*(_: typedesc[Icc4_ProfileHeader_ProfileFlags], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_ProfileHeader): Icc4_ProfileHeader_ProfileFlags
proc read*(_: typedesc[Icc4_XyzNumber], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_XyzNumber
proc read*(_: typedesc[Icc4_DateTimeNumber], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_DateTimeNumber
proc read*(_: typedesc[Icc4_Response16Number], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_Response16Number
proc read*(_: typedesc[Icc4_U1Fixed15Number], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_U1Fixed15Number
proc read*(_: typedesc[Icc4_TagTable], io: KaitaiStream, root: KaitaiStruct, parent: Icc4): Icc4_TagTable
proc read*(_: typedesc[Icc4_TagTable_TagDefinition], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable): Icc4_TagTable_TagDefinition
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_BlueMatrixColumnTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_BlueMatrixColumnTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_DeviceMfgDescTag], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_DeviceMfgDescTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_NamedColor2Type], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_NamedColor2Tag): Icc4_TagTable_TagDefinition_NamedColor2Type
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_NamedColor2Type_NamedColourDefinition], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_NamedColor2Type): Icc4_TagTable_TagDefinition_NamedColor2Type_NamedColourDefinition
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ViewingConditionsTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_ViewingConditionsTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_BlueTrcTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_BlueTrcTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ResponseCurveSet16Type], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_OutputResponseTag): Icc4_TagTable_TagDefinition_ResponseCurveSet16Type
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_CurveType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_CurveType
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_XyzType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_XyzType
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_Lut8Type], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_Lut8Type
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_BToA2Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_BToA2Tag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_LutAToBType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_LutAToBType
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_BToA0Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_BToA0Tag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_MediaWhitePointTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_MediaWhitePointTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_Lut16Type], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_Lut16Type
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_U16Fixed16ArrayType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_U16Fixed16ArrayType
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ColorantTableOutTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_ColorantTableOutTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_MeasurementTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_MeasurementTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ProfileSequenceTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_ProfileSequenceTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_TechnologyTag], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_TechnologyTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_AToB0Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_AToB0Tag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_DToB0Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_DToB0Tag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_OutputResponseTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_OutputResponseTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_GreenMatrixColumnTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_GreenMatrixColumnTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ProfileDescriptionTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_ProfileDescriptionTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_Preview1Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_Preview1Tag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_RedTrcTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_RedTrcTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_BToD0Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_BToD0Tag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_DToB1Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_DToB1Tag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_BToA1Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_BToA1Tag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ParametricCurveType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_ParametricCurveType
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ParametricCurveType): Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ParametricCurveType): Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsXToPowerOfG], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ParametricCurveType): Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsXToPowerOfG
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ParametricCurveType): Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ParametricCurveType): Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ChromaticityTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_ChromaticityTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ChromaticAdaptationTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_ChromaticAdaptationTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_MeasurementType], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_MeasurementTag): Icc4_TagTable_TagDefinition_MeasurementType
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_TextType], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_CharTargetTag): Icc4_TagTable_TagDefinition_TextType
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag): Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType_ProfileIdentifier], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType): Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType_ProfileIdentifier
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ColorantTableType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_ColorantTableType
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ColorantTableType_Colorant], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ColorantTableType): Icc4_TagTable_TagDefinition_ColorantTableType_Colorant
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_SignatureType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_SignatureType
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_CopyrightTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_CopyrightTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_Preview0Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_Preview0Tag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_DateTimeType], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_CalibrationDateTimeTag): Icc4_TagTable_TagDefinition_DateTimeType
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_DToB3Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_DToB3Tag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_Preview2Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_Preview2Tag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_DeviceModelDescTag], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_DeviceModelDescTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_MultiProcessElementsType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_MultiProcessElementsType
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_UInt16ArrayType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_UInt16ArrayType
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ColorantOrderTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_ColorantOrderTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_DataType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_DataType
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ChromaticityType], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ChromaticityTag): Icc4_TagTable_TagDefinition_ChromaticityType
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ChromaticityType_CiexyCoordinateValues], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ChromaticityType): Icc4_TagTable_TagDefinition_ChromaticityType_CiexyCoordinateValues
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_LuminanceTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_LuminanceTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_S15Fixed16ArrayType], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ChromaticAdaptationTag): Icc4_TagTable_TagDefinition_S15Fixed16ArrayType
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType): Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_AToB2Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_AToB2Tag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_AToB1Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_AToB1Tag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_CharTargetTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_CharTargetTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ColorantTableTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_ColorantTableTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_CalibrationDateTimeTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_CalibrationDateTimeTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_NamedColor2Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_NamedColor2Tag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ViewingCondDescTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_ViewingCondDescTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_BToD3Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_BToD3Tag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ProfileSequenceDescType], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ProfileSequenceTag): Icc4_TagTable_TagDefinition_ProfileSequenceDescType
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ProfileSequenceDescType): Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_BToD1Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_BToD1Tag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ColorantOrderType], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ColorantOrderTag): Icc4_TagTable_TagDefinition_ColorantOrderType
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_DToB2Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_DToB2Tag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_GrayTrcTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_GrayTrcTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ViewingConditionsType], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ViewingConditionsTag): Icc4_TagTable_TagDefinition_ViewingConditionsType
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_LutBToAType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_LutBToAType
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_GreenTrcTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_GreenTrcTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_UInt32ArrayType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_UInt32ArrayType
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_GamutTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_GamutTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_UInt8ArrayType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_UInt8ArrayType
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_RedMatrixColumnTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_RedMatrixColumnTag
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_UInt64ArrayType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_UInt64ArrayType
proc read*(_: typedesc[Icc4_TagTable_TagDefinition_BToD2Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_BToD2Tag
proc read*(_: typedesc[Icc4_DeviceAttributes], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_DeviceAttributes
proc read*(_: typedesc[Icc4_DeviceManufacturer], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_DeviceManufacturer
proc read*(_: typedesc[Icc4_S15Fixed16Number], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_S15Fixed16ArrayType): Icc4_S15Fixed16Number
proc read*(_: typedesc[Icc4_PositionNumber], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_PositionNumber

proc tagDataElement*(this: Icc4_TagTable_TagDefinition): KaitaiStruct
proc stringData*(this: Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record): string

proc read*(_: typedesc[Icc4], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4 =
  template this: untyped = result
  this = new(Icc4)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = Icc4_ProfileHeader.read(this.io, this.root, this)
  this.header = headerExpr
  let tagTableExpr = Icc4_TagTable.read(this.io, this.root, this)
  this.tagTable = tagTableExpr

proc fromFile*(_: typedesc[Icc4], filename: string): Icc4 =
  Icc4.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_U8Fixed8Number], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_U8Fixed8Number =
  template this: untyped = result
  this = new(Icc4_U8Fixed8Number)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numberExpr = this.io.readBytes(int(2))
  this.number = numberExpr

proc fromFile*(_: typedesc[Icc4_U8Fixed8Number], filename: string): Icc4_U8Fixed8Number =
  Icc4_U8Fixed8Number.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_U16Fixed16Number], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_U16Fixed16Number =
  template this: untyped = result
  this = new(Icc4_U16Fixed16Number)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numberExpr = this.io.readBytes(int(4))
  this.number = numberExpr

proc fromFile*(_: typedesc[Icc4_U16Fixed16Number], filename: string): Icc4_U16Fixed16Number =
  Icc4_U16Fixed16Number.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_StandardIlluminantEncoding], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_StandardIlluminantEncoding =
  template this: untyped = result
  this = new(Icc4_StandardIlluminantEncoding)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let standardIlluminantEncodingExpr = Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings(this.io.readU4be())
  this.standardIlluminantEncoding = standardIlluminantEncodingExpr

proc fromFile*(_: typedesc[Icc4_StandardIlluminantEncoding], filename: string): Icc4_StandardIlluminantEncoding =
  Icc4_StandardIlluminantEncoding.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_ProfileHeader], io: KaitaiStream, root: KaitaiStruct, parent: Icc4): Icc4_ProfileHeader =
  template this: untyped = result
  this = new(Icc4_ProfileHeader)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let sizeExpr = this.io.readU4be()
  this.size = sizeExpr
  let preferredCmmTypeExpr = Icc4_ProfileHeader_CmmSignatures(this.io.readU4be())
  this.preferredCmmType = preferredCmmTypeExpr
  let versionExpr = Icc4_ProfileHeader_VersionField.read(this.io, this.root, this)
  this.version = versionExpr
  let deviceClassExpr = Icc4_ProfileHeader_ProfileClasses(this.io.readU4be())
  this.deviceClass = deviceClassExpr
  let colorSpaceExpr = Icc4_ProfileHeader_DataColourSpaces(this.io.readU4be())
  this.colorSpace = colorSpaceExpr
  let pcsExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.pcs = pcsExpr
  let creationDateTimeExpr = Icc4_DateTimeNumber.read(this.io, this.root, this)
  this.creationDateTime = creationDateTimeExpr
  let fileSignatureExpr = this.io.readBytes(int(4))
  this.fileSignature = fileSignatureExpr
  let primaryPlatformExpr = Icc4_ProfileHeader_PrimaryPlatforms(this.io.readU4be())
  this.primaryPlatform = primaryPlatformExpr
  let profileFlagsExpr = Icc4_ProfileHeader_ProfileFlags.read(this.io, this.root, this)
  this.profileFlags = profileFlagsExpr
  let deviceManufacturerExpr = Icc4_DeviceManufacturer.read(this.io, this.root, this)
  this.deviceManufacturer = deviceManufacturerExpr
  let deviceModelExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.deviceModel = deviceModelExpr
  let deviceAttributesExpr = Icc4_DeviceAttributes.read(this.io, this.root, this)
  this.deviceAttributes = deviceAttributesExpr
  let renderingIntentExpr = Icc4_ProfileHeader_RenderingIntents(this.io.readU4be())
  this.renderingIntent = renderingIntentExpr
  let nciexyzValuesOfIlluminantOfPcsExpr = Icc4_XyzNumber.read(this.io, this.root, this)
  this.nciexyzValuesOfIlluminantOfPcs = nciexyzValuesOfIlluminantOfPcsExpr
  let creatorExpr = Icc4_DeviceManufacturer.read(this.io, this.root, this)
  this.creator = creatorExpr
  let identifierExpr = this.io.readBytes(int(16))
  this.identifier = identifierExpr
  let reservedDataExpr = this.io.readBytes(int(28))
  this.reservedData = reservedDataExpr

proc fromFile*(_: typedesc[Icc4_ProfileHeader], filename: string): Icc4_ProfileHeader =
  Icc4_ProfileHeader.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_ProfileHeader_VersionField], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_ProfileHeader): Icc4_ProfileHeader_VersionField =
  template this: untyped = result
  this = new(Icc4_ProfileHeader_VersionField)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let majorExpr = this.io.readBytes(int(1))
  this.major = majorExpr
  let minorExpr = this.io.readBitsIntBe(4)
  this.minor = minorExpr
  let bugFixLevelExpr = this.io.readBitsIntBe(4)
  this.bugFixLevel = bugFixLevelExpr
  alignToByte(this.io)
  let reservedExpr = this.io.readBytes(int(2))
  this.reserved = reservedExpr

proc fromFile*(_: typedesc[Icc4_ProfileHeader_VersionField], filename: string): Icc4_ProfileHeader_VersionField =
  Icc4_ProfileHeader_VersionField.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_ProfileHeader_ProfileFlags], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_ProfileHeader): Icc4_ProfileHeader_ProfileFlags =
  template this: untyped = result
  this = new(Icc4_ProfileHeader_ProfileFlags)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let embeddedProfileExpr = this.io.readBitsIntBe(1) != 0
  this.embeddedProfile = embeddedProfileExpr
  let profileCanBeUsedIndependentlyOfEmbeddedColourDataExpr = this.io.readBitsIntBe(1) != 0
  this.profileCanBeUsedIndependentlyOfEmbeddedColourData = profileCanBeUsedIndependentlyOfEmbeddedColourDataExpr
  let otherFlagsExpr = this.io.readBitsIntBe(30)
  this.otherFlags = otherFlagsExpr

proc fromFile*(_: typedesc[Icc4_ProfileHeader_ProfileFlags], filename: string): Icc4_ProfileHeader_ProfileFlags =
  Icc4_ProfileHeader_ProfileFlags.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_XyzNumber], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_XyzNumber =
  template this: untyped = result
  this = new(Icc4_XyzNumber)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xExpr = this.io.readBytes(int(4))
  this.x = xExpr
  let yExpr = this.io.readBytes(int(4))
  this.y = yExpr
  let zExpr = this.io.readBytes(int(4))
  this.z = zExpr

proc fromFile*(_: typedesc[Icc4_XyzNumber], filename: string): Icc4_XyzNumber =
  Icc4_XyzNumber.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_DateTimeNumber], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_DateTimeNumber =
  template this: untyped = result
  this = new(Icc4_DateTimeNumber)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let yearExpr = this.io.readU2be()
  this.year = yearExpr
  let monthExpr = this.io.readU2be()
  this.month = monthExpr
  let dayExpr = this.io.readU2be()
  this.day = dayExpr
  let hourExpr = this.io.readU2be()
  this.hour = hourExpr
  let minuteExpr = this.io.readU2be()
  this.minute = minuteExpr
  let secondExpr = this.io.readU2be()
  this.second = secondExpr

proc fromFile*(_: typedesc[Icc4_DateTimeNumber], filename: string): Icc4_DateTimeNumber =
  Icc4_DateTimeNumber.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_Response16Number], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_Response16Number =
  template this: untyped = result
  this = new(Icc4_Response16Number)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numberExpr = this.io.readU4be()
  this.number = numberExpr
  let reservedExpr = this.io.readBytes(int(2))
  this.reserved = reservedExpr
  let measurementValueExpr = Icc4_S15Fixed16Number.read(this.io, this.root, this)
  this.measurementValue = measurementValueExpr

proc fromFile*(_: typedesc[Icc4_Response16Number], filename: string): Icc4_Response16Number =
  Icc4_Response16Number.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_U1Fixed15Number], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_U1Fixed15Number =
  template this: untyped = result
  this = new(Icc4_U1Fixed15Number)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numberExpr = this.io.readBytes(int(2))
  this.number = numberExpr

proc fromFile*(_: typedesc[Icc4_U1Fixed15Number], filename: string): Icc4_U1Fixed15Number =
  Icc4_U1Fixed15Number.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable], io: KaitaiStream, root: KaitaiStruct, parent: Icc4): Icc4_TagTable =
  template this: untyped = result
  this = new(Icc4_TagTable)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagCountExpr = this.io.readU4be()
  this.tagCount = tagCountExpr
  for i in 0 ..< int(this.tagCount):
    let it = Icc4_TagTable_TagDefinition.read(this.io, this.root, this)
    this.tags.add(it)

proc fromFile*(_: typedesc[Icc4_TagTable], filename: string): Icc4_TagTable =
  Icc4_TagTable.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable): Icc4_TagTable_TagDefinition =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagSignatureExpr = Icc4_TagTable_TagDefinition_TagSignatures(this.io.readU4be())
  this.tagSignature = tagSignatureExpr
  let offsetToDataElementExpr = this.io.readU4be()
  this.offsetToDataElement = offsetToDataElementExpr
  let sizeOfDataElementExpr = this.io.readU4be()
  this.sizeOfDataElement = sizeOfDataElementExpr

proc tagDataElement(this: Icc4_TagTable_TagDefinition): KaitaiStruct = 
  if this.tagDataElementInst != nil:
    return this.tagDataElementInst
  let pos = this.io.pos()
  this.io.seek(int(this.offsetToDataElement))
  block:
    let on = this.tagSignature
    if on == icc_4.colorant_order:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_ColorantOrderTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.b_to_a_2:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_BToA2Tag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.media_white_point:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_MediaWhitePointTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.b_to_d_3:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_BToD3Tag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.colorimetric_intent_image_state:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.viewing_cond_desc:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_ViewingCondDescTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.preview_1:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_Preview1Tag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.device_model_desc:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_DeviceModelDescTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.chromaticity:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_ChromaticityTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.preview_0:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_Preview0Tag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.d_to_b_1:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_DToB1Tag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.saturation_rendering_intent_gamut:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.b_to_a_0:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_BToA0Tag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.green_matrix_column:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_GreenMatrixColumnTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.copyright:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_CopyrightTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.blue_matrix_column:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_BlueMatrixColumnTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.chromatic_adaptation:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_ChromaticAdaptationTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.a_to_b_1:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_AToB1Tag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.output_response:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_OutputResponseTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.profile_sequence:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_ProfileSequenceTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.char_target:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_CharTargetTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.red_trc:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_RedTrcTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.gamut:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_GamutTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.device_mfg_desc:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_DeviceMfgDescTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.measurement:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_MeasurementTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.green_trc:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_GreenTrcTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.d_to_b_3:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_DToB3Tag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.colorant_table:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_ColorantTableTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.d_to_b_2:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_DToB2Tag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.profile_description:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_ProfileDescriptionTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.profile_sequence_identifier:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.gray_trc:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_GrayTrcTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.perceptual_rendering_intent_gamut:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.blue_trc:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_BlueTrcTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.d_to_b_0:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_DToB0Tag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.a_to_b_2:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_AToB2Tag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.calibration_date_time:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_CalibrationDateTimeTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.colorant_table_out:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_ColorantTableOutTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.red_matrix_column:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_RedMatrixColumnTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.preview_2:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_Preview2Tag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.a_to_b_0:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_AToB0Tag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.luminance:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_LuminanceTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.named_color_2:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_NamedColor2Tag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.b_to_d_2:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_BToD2Tag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.b_to_d_0:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_BToD0Tag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.b_to_a_1:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_BToA1Tag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.b_to_d_1:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_BToD1Tag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.viewing_conditions:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_ViewingConditionsTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    elif on == icc_4.technology:
      let rawTagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.rawTagDataElementInst = rawTagDataElementInstExpr
      let rawTagDataElementInstIo = newKaitaiStream(rawTagDataElementInstExpr)
      let tagDataElementInstExpr = Icc4_TagTable_TagDefinition_TechnologyTag.read(rawTagDataElementInstIo, this.root, this)
      this.tagDataElementInst = tagDataElementInstExpr
    else:
      let tagDataElementInstExpr = this.io.readBytes(int(this.sizeOfDataElement))
      this.tagDataElementInst = tagDataElementInstExpr
  this.io.seek(pos)
  if this.tagDataElementInst != nil:
    return this.tagDataElementInst

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition], filename: string): Icc4_TagTable_TagDefinition =
  Icc4_TagTable_TagDefinition.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_BlueMatrixColumnTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_BlueMatrixColumnTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_BlueMatrixColumnTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.xyz_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_XyzType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_BlueMatrixColumnTag], filename: string): Icc4_TagTable_TagDefinition_BlueMatrixColumnTag =
  Icc4_TagTable_TagDefinition_BlueMatrixColumnTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_DeviceMfgDescTag], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_DeviceMfgDescTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_DeviceMfgDescTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.multi_localized_unicode_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_DeviceMfgDescTag], filename: string): Icc4_TagTable_TagDefinition_DeviceMfgDescTag =
  Icc4_TagTable_TagDefinition_DeviceMfgDescTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_NamedColor2Type], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_NamedColor2Tag): Icc4_TagTable_TagDefinition_NamedColor2Type =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_NamedColor2Type)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  let vendorSpecificFlagExpr = this.io.readU4be()
  this.vendorSpecificFlag = vendorSpecificFlagExpr
  let countOfNamedColoursExpr = this.io.readU4be()
  this.countOfNamedColours = countOfNamedColoursExpr
  let numberOfDeviceCoordinatesForEachNamedColourExpr = this.io.readU4be()
  this.numberOfDeviceCoordinatesForEachNamedColour = numberOfDeviceCoordinatesForEachNamedColourExpr
  let prefixForEachColourNameExpr = encode(this.io.readBytesTerm(0, false, true, true), "ASCII")
  this.prefixForEachColourName = prefixForEachColourNameExpr
  for i in 0 ..< int((32 - len(this.prefixForEachColourName))):
    let it = this.io.readBytes(int(1))
    this.prefixForEachColourNamePadding.add(it)
  let suffixForEachColourNameExpr = encode(this.io.readBytesTerm(0, false, true, true), "ASCII")
  this.suffixForEachColourName = suffixForEachColourNameExpr
  for i in 0 ..< int((32 - len(this.suffixForEachColourName))):
    let it = this.io.readBytes(int(1))
    this.suffixForEachColourNamePadding.add(it)
  for i in 0 ..< int(this.countOfNamedColours):
    let it = Icc4_TagTable_TagDefinition_NamedColor2Type_NamedColourDefinition.read(this.io, this.root, this)
    this.namedColourDefinitions.add(it)

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_NamedColor2Type], filename: string): Icc4_TagTable_TagDefinition_NamedColor2Type =
  Icc4_TagTable_TagDefinition_NamedColor2Type.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_NamedColor2Type_NamedColourDefinition], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_NamedColor2Type): Icc4_TagTable_TagDefinition_NamedColor2Type_NamedColourDefinition =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_NamedColor2Type_NamedColourDefinition)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rootNameExpr = encode(this.io.readBytesTerm(0, false, true, true), "ASCII")
  this.rootName = rootNameExpr
  for i in 0 ..< int((32 - len(this.rootName))):
    let it = this.io.readBytes(int(1))
    this.rootNamePadding.add(it)
  let pcsCoordinatesExpr = this.io.readBytes(int(6))
  this.pcsCoordinates = pcsCoordinatesExpr
  if this.parent.numberOfDeviceCoordinatesForEachNamedColour > 0:
    for i in 0 ..< int(this.parent.numberOfDeviceCoordinatesForEachNamedColour):
      let it = this.io.readU2be()
      this.deviceCoordinates.add(it)

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_NamedColor2Type_NamedColourDefinition], filename: string): Icc4_TagTable_TagDefinition_NamedColor2Type_NamedColourDefinition =
  Icc4_TagTable_TagDefinition_NamedColor2Type_NamedColourDefinition.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ViewingConditionsTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_ViewingConditionsTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ViewingConditionsTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.viewing_conditions_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_ViewingConditionsType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ViewingConditionsTag], filename: string): Icc4_TagTable_TagDefinition_ViewingConditionsTag =
  Icc4_TagTable_TagDefinition_ViewingConditionsTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_BlueTrcTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_BlueTrcTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_BlueTrcTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.curve_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_CurveType.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.parametric_curve_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_ParametricCurveType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_BlueTrcTag], filename: string): Icc4_TagTable_TagDefinition_BlueTrcTag =
  Icc4_TagTable_TagDefinition_BlueTrcTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ResponseCurveSet16Type], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_OutputResponseTag): Icc4_TagTable_TagDefinition_ResponseCurveSet16Type =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ResponseCurveSet16Type)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  let numberOfChannelsExpr = this.io.readU2be()
  this.numberOfChannels = numberOfChannelsExpr
  let countOfMeasurementTypesExpr = this.io.readU2be()
  this.countOfMeasurementTypes = countOfMeasurementTypesExpr
  for i in 0 ..< int(this.countOfMeasurementTypes):
    let it = this.io.readU4be()
    this.responseCurveStructureOffsets.add(it)
  let responseCurveStructuresExpr = this.io.readBytesFull()
  this.responseCurveStructures = responseCurveStructuresExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ResponseCurveSet16Type], filename: string): Icc4_TagTable_TagDefinition_ResponseCurveSet16Type =
  Icc4_TagTable_TagDefinition_ResponseCurveSet16Type.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_CurveType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_CurveType =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_CurveType)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  let numberOfEntriesExpr = this.io.readU4be()
  this.numberOfEntries = numberOfEntriesExpr
  if this.numberOfEntries > 1:
    for i in 0 ..< int(this.numberOfEntries):
      let it = this.io.readU2be()
      this.curveValues.add(it)
  if this.numberOfEntries == 1:
    let curveValueExpr = this.io.readU1()
    this.curveValue = curveValueExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_CurveType], filename: string): Icc4_TagTable_TagDefinition_CurveType =
  Icc4_TagTable_TagDefinition_CurveType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.signature_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_SignatureType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag], filename: string): Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag =
  Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_XyzType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_XyzType =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_XyzType)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  block:
    var i: int
    while not this.io.isEof:
      let it = Icc4_XyzNumber.read(this.io, this.root, this)
      this.values.add(it)
      inc i

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_XyzType], filename: string): Icc4_TagTable_TagDefinition_XyzType =
  Icc4_TagTable_TagDefinition_XyzType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_Lut8Type], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_Lut8Type =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_Lut8Type)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  let numberOfInputChannelsExpr = this.io.readU1()
  this.numberOfInputChannels = numberOfInputChannelsExpr
  let numberOfOutputChannelsExpr = this.io.readU1()
  this.numberOfOutputChannels = numberOfOutputChannelsExpr
  let numberOfClutGridPointsExpr = this.io.readU1()
  this.numberOfClutGridPoints = numberOfClutGridPointsExpr
  let paddingExpr = this.io.readBytes(int(1))
  this.padding = paddingExpr
  for i in 0 ..< int(9):
    let it = this.io.readS4be()
    this.encodedEParameters.add(it)
  let numberOfInputTableEntriesExpr = this.io.readU4be()
  this.numberOfInputTableEntries = numberOfInputTableEntriesExpr
  let numberOfOutputTableEntriesExpr = this.io.readU4be()
  this.numberOfOutputTableEntries = numberOfOutputTableEntriesExpr
  let inputTablesExpr = this.io.readBytes(int((256 * this.numberOfInputChannels)))
  this.inputTables = inputTablesExpr
  let clutValuesExpr = this.io.readBytes(int(((this.numberOfClutGridPoints xor this.numberOfInputChannels) * this.numberOfOutputChannels)))
  this.clutValues = clutValuesExpr
  let outputTablesExpr = this.io.readBytes(int((256 * this.numberOfOutputChannels)))
  this.outputTables = outputTablesExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_Lut8Type], filename: string): Icc4_TagTable_TagDefinition_Lut8Type =
  Icc4_TagTable_TagDefinition_Lut8Type.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_BToA2Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_BToA2Tag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_BToA2Tag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.multi_function_table_with_one_byte_precision_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_Lut8Type.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.multi_function_table_with_two_byte_precision_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_Lut16Type.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.multi_function_b_to_a_table_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_LutBToAType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_BToA2Tag], filename: string): Icc4_TagTable_TagDefinition_BToA2Tag =
  Icc4_TagTable_TagDefinition_BToA2Tag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_LutAToBType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_LutAToBType =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_LutAToBType)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  let numberOfInputChannelsExpr = this.io.readU1()
  this.numberOfInputChannels = numberOfInputChannelsExpr
  let numberOfOutputChannelsExpr = this.io.readU1()
  this.numberOfOutputChannels = numberOfOutputChannelsExpr
  let paddingExpr = this.io.readBytes(int(2))
  this.padding = paddingExpr
  let offsetToFirstBCurveExpr = this.io.readU4be()
  this.offsetToFirstBCurve = offsetToFirstBCurveExpr
  let offsetToMatrixExpr = this.io.readU4be()
  this.offsetToMatrix = offsetToMatrixExpr
  let offsetToFirstMCurveExpr = this.io.readU4be()
  this.offsetToFirstMCurve = offsetToFirstMCurveExpr
  let offsetToClutExpr = this.io.readU4be()
  this.offsetToClut = offsetToClutExpr
  let offsetToFirstACurveExpr = this.io.readU4be()
  this.offsetToFirstACurve = offsetToFirstACurveExpr
  let dataExpr = this.io.readBytesFull()
  this.data = dataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_LutAToBType], filename: string): Icc4_TagTable_TagDefinition_LutAToBType =
  Icc4_TagTable_TagDefinition_LutAToBType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_BToA0Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_BToA0Tag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_BToA0Tag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.multi_function_table_with_one_byte_precision_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_Lut8Type.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.multi_function_table_with_two_byte_precision_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_Lut16Type.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.multi_function_b_to_a_table_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_LutBToAType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_BToA0Tag], filename: string): Icc4_TagTable_TagDefinition_BToA0Tag =
  Icc4_TagTable_TagDefinition_BToA0Tag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_MediaWhitePointTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_MediaWhitePointTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_MediaWhitePointTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.xyz_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_XyzType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_MediaWhitePointTag], filename: string): Icc4_TagTable_TagDefinition_MediaWhitePointTag =
  Icc4_TagTable_TagDefinition_MediaWhitePointTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_Lut16Type], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_Lut16Type =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_Lut16Type)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  let numberOfInputChannelsExpr = this.io.readU1()
  this.numberOfInputChannels = numberOfInputChannelsExpr
  let numberOfOutputChannelsExpr = this.io.readU1()
  this.numberOfOutputChannels = numberOfOutputChannelsExpr
  let numberOfClutGridPointsExpr = this.io.readU1()
  this.numberOfClutGridPoints = numberOfClutGridPointsExpr
  let paddingExpr = this.io.readBytes(int(1))
  this.padding = paddingExpr
  for i in 0 ..< int(9):
    let it = this.io.readS4be()
    this.encodedEParameters.add(it)
  let numberOfInputTableEntriesExpr = this.io.readU2be()
  this.numberOfInputTableEntries = numberOfInputTableEntriesExpr
  let numberOfOutputTableEntriesExpr = this.io.readU2be()
  this.numberOfOutputTableEntries = numberOfOutputTableEntriesExpr
  let inputTablesExpr = this.io.readBytes(int(((2 * this.numberOfInputChannels) * this.numberOfInputTableEntries)))
  this.inputTables = inputTablesExpr
  let clutValuesExpr = this.io.readBytes(int(((2 * (this.numberOfClutGridPoints xor this.numberOfInputChannels)) * this.numberOfOutputChannels)))
  this.clutValues = clutValuesExpr
  let outputTablesExpr = this.io.readBytes(int(((2 * this.numberOfOutputChannels) * this.numberOfOutputTableEntries)))
  this.outputTables = outputTablesExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_Lut16Type], filename: string): Icc4_TagTable_TagDefinition_Lut16Type =
  Icc4_TagTable_TagDefinition_Lut16Type.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.signature_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_SignatureType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag], filename: string): Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag =
  Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_U16Fixed16ArrayType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_U16Fixed16ArrayType =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_U16Fixed16ArrayType)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  block:
    var i: int
    while not this.io.isEof:
      let it = Icc4_U16Fixed16Number.read(this.io, this.root, this)
      this.values.add(it)
      inc i

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_U16Fixed16ArrayType], filename: string): Icc4_TagTable_TagDefinition_U16Fixed16ArrayType =
  Icc4_TagTable_TagDefinition_U16Fixed16ArrayType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ColorantTableOutTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_ColorantTableOutTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ColorantTableOutTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.colorant_table_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_ColorantTableType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ColorantTableOutTag], filename: string): Icc4_TagTable_TagDefinition_ColorantTableOutTag =
  Icc4_TagTable_TagDefinition_ColorantTableOutTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_MeasurementTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_MeasurementTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_MeasurementTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.measurement_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_MeasurementType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_MeasurementTag], filename: string): Icc4_TagTable_TagDefinition_MeasurementTag =
  Icc4_TagTable_TagDefinition_MeasurementTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ProfileSequenceTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_ProfileSequenceTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ProfileSequenceTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.profile_sequence_desc_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_ProfileSequenceDescType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ProfileSequenceTag], filename: string): Icc4_TagTable_TagDefinition_ProfileSequenceTag =
  Icc4_TagTable_TagDefinition_ProfileSequenceTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_TechnologyTag], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_TechnologyTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_TechnologyTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.signature_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_SignatureType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_TechnologyTag], filename: string): Icc4_TagTable_TagDefinition_TechnologyTag =
  Icc4_TagTable_TagDefinition_TechnologyTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_AToB0Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_AToB0Tag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_AToB0Tag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.multi_function_table_with_one_byte_precision_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_Lut8Type.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.multi_function_table_with_two_byte_precision_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_Lut16Type.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.multi_function_a_to_b_table_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_LutAToBType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_AToB0Tag], filename: string): Icc4_TagTable_TagDefinition_AToB0Tag =
  Icc4_TagTable_TagDefinition_AToB0Tag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_DToB0Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_DToB0Tag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_DToB0Tag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.multi_process_elements_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_MultiProcessElementsType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_DToB0Tag], filename: string): Icc4_TagTable_TagDefinition_DToB0Tag =
  Icc4_TagTable_TagDefinition_DToB0Tag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_OutputResponseTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_OutputResponseTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_OutputResponseTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.response_curve_set_16_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_ResponseCurveSet16Type.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_OutputResponseTag], filename: string): Icc4_TagTable_TagDefinition_OutputResponseTag =
  Icc4_TagTable_TagDefinition_OutputResponseTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_GreenMatrixColumnTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_GreenMatrixColumnTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_GreenMatrixColumnTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.xyz_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_XyzType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_GreenMatrixColumnTag], filename: string): Icc4_TagTable_TagDefinition_GreenMatrixColumnTag =
  Icc4_TagTable_TagDefinition_GreenMatrixColumnTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ProfileDescriptionTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_ProfileDescriptionTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ProfileDescriptionTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.multi_localized_unicode_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ProfileDescriptionTag], filename: string): Icc4_TagTable_TagDefinition_ProfileDescriptionTag =
  Icc4_TagTable_TagDefinition_ProfileDescriptionTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_Preview1Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_Preview1Tag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_Preview1Tag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.multi_function_table_with_one_byte_precision_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_Lut8Type.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.multi_function_table_with_two_byte_precision_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_Lut16Type.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.multi_function_b_to_a_table_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_LutBToAType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_Preview1Tag], filename: string): Icc4_TagTable_TagDefinition_Preview1Tag =
  Icc4_TagTable_TagDefinition_Preview1Tag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_RedTrcTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_RedTrcTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_RedTrcTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.curve_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_CurveType.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.parametric_curve_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_ParametricCurveType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_RedTrcTag], filename: string): Icc4_TagTable_TagDefinition_RedTrcTag =
  Icc4_TagTable_TagDefinition_RedTrcTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_BToD0Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_BToD0Tag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_BToD0Tag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.multi_process_elements_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_MultiProcessElementsType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_BToD0Tag], filename: string): Icc4_TagTable_TagDefinition_BToD0Tag =
  Icc4_TagTable_TagDefinition_BToD0Tag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_DToB1Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_DToB1Tag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_DToB1Tag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.multi_process_elements_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_MultiProcessElementsType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_DToB1Tag], filename: string): Icc4_TagTable_TagDefinition_DToB1Tag =
  Icc4_TagTable_TagDefinition_DToB1Tag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_BToA1Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_BToA1Tag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_BToA1Tag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.multi_function_table_with_one_byte_precision_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_Lut8Type.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.multi_function_table_with_two_byte_precision_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_Lut16Type.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.multi_function_b_to_a_table_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_LutBToAType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_BToA1Tag], filename: string): Icc4_TagTable_TagDefinition_BToA1Tag =
  Icc4_TagTable_TagDefinition_BToA1Tag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ParametricCurveType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_ParametricCurveType =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ParametricCurveType)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  let functionTypeExpr = Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions(this.io.readU2be())
  this.functionType = functionTypeExpr
  let reserved2Expr = this.io.readBytes(int(2))
  this.reserved2 = reserved2Expr
  block:
    let on = this.functionType
    if on == icc_4.cie_122_1996:
      let parametersExpr = Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996.read(this.io, this.root, this)
      this.parameters = parametersExpr
    elif on == icc_4.iec_61966_3:
      let parametersExpr = Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663.read(this.io, this.root, this)
      this.parameters = parametersExpr
    elif on == icc_4.iec_61966_2_1:
      let parametersExpr = Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621.read(this.io, this.root, this)
      this.parameters = parametersExpr
    elif on == icc_4.y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c:
      let parametersExpr = Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC.read(this.io, this.root, this)
      this.parameters = parametersExpr
    elif on == icc_4.y_equals_x_to_power_of_g:
      let parametersExpr = Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsXToPowerOfG.read(this.io, this.root, this)
      this.parameters = parametersExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ParametricCurveType], filename: string): Icc4_TagTable_TagDefinition_ParametricCurveType =
  Icc4_TagTable_TagDefinition_ParametricCurveType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ParametricCurveType): Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663 =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let gExpr = this.io.readS4be()
  this.g = gExpr
  let aExpr = this.io.readS4be()
  this.a = aExpr
  let bExpr = this.io.readS4be()
  this.b = bExpr
  let cExpr = this.io.readS4be()
  this.c = cExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663], filename: string): Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663 =
  Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ParametricCurveType): Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621 =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let gExpr = this.io.readS4be()
  this.g = gExpr
  let aExpr = this.io.readS4be()
  this.a = aExpr
  let bExpr = this.io.readS4be()
  this.b = bExpr
  let cExpr = this.io.readS4be()
  this.c = cExpr
  let dExpr = this.io.readS4be()
  this.d = dExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621], filename: string): Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621 =
  Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsXToPowerOfG], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ParametricCurveType): Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsXToPowerOfG =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsXToPowerOfG)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let gExpr = this.io.readS4be()
  this.g = gExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsXToPowerOfG], filename: string): Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsXToPowerOfG =
  Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsXToPowerOfG.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ParametricCurveType): Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let gExpr = this.io.readS4be()
  this.g = gExpr
  let aExpr = this.io.readS4be()
  this.a = aExpr
  let bExpr = this.io.readS4be()
  this.b = bExpr
  let cExpr = this.io.readS4be()
  this.c = cExpr
  let dExpr = this.io.readS4be()
  this.d = dExpr
  let eExpr = this.io.readS4be()
  this.e = eExpr
  let fExpr = this.io.readS4be()
  this.f = fExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC], filename: string): Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC =
  Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ParametricCurveType): Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996 =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let gExpr = this.io.readS4be()
  this.g = gExpr
  let aExpr = this.io.readS4be()
  this.a = aExpr
  let bExpr = this.io.readS4be()
  this.b = bExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996], filename: string): Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996 =
  Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ChromaticityTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_ChromaticityTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ChromaticityTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.chromaticity_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_ChromaticityType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ChromaticityTag], filename: string): Icc4_TagTable_TagDefinition_ChromaticityTag =
  Icc4_TagTable_TagDefinition_ChromaticityTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ChromaticAdaptationTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_ChromaticAdaptationTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ChromaticAdaptationTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.s_15_fixed_16_array_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_S15Fixed16ArrayType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ChromaticAdaptationTag], filename: string): Icc4_TagTable_TagDefinition_ChromaticAdaptationTag =
  Icc4_TagTable_TagDefinition_ChromaticAdaptationTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_MeasurementType], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_MeasurementTag): Icc4_TagTable_TagDefinition_MeasurementType =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_MeasurementType)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  let standardObserverEncodingExpr = Icc4_TagTable_TagDefinition_MeasurementType_StandardObserverEncodings(this.io.readU4be())
  this.standardObserverEncoding = standardObserverEncodingExpr
  let nciexyzTristimulusValuesForMeasurementBackingExpr = Icc4_XyzNumber.read(this.io, this.root, this)
  this.nciexyzTristimulusValuesForMeasurementBacking = nciexyzTristimulusValuesForMeasurementBackingExpr
  let measurementGeometryEncodingExpr = Icc4_TagTable_TagDefinition_MeasurementType_MeasurementGeometryEncodings(this.io.readU4be())
  this.measurementGeometryEncoding = measurementGeometryEncodingExpr
  let measurementFlareEncodingExpr = Icc4_TagTable_TagDefinition_MeasurementType_MeasurementFlareEncodings(this.io.readU4be())
  this.measurementFlareEncoding = measurementFlareEncodingExpr
  let standardIlluminantEncodingExpr = Icc4_StandardIlluminantEncoding.read(this.io, this.root, this)
  this.standardIlluminantEncoding = standardIlluminantEncodingExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_MeasurementType], filename: string): Icc4_TagTable_TagDefinition_MeasurementType =
  Icc4_TagTable_TagDefinition_MeasurementType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_TextType], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_CharTargetTag): Icc4_TagTable_TagDefinition_TextType =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_TextType)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  let valueExpr = encode(this.io.readBytesFull().bytesTerminate(0, false), "ASCII")
  this.value = valueExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_TextType], filename: string): Icc4_TagTable_TagDefinition_TextType =
  Icc4_TagTable_TagDefinition_TextType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag): Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  let numberOfStructuresExpr = this.io.readU4be()
  this.numberOfStructures = numberOfStructuresExpr
  for i in 0 ..< int(this.numberOfStructures):
    let it = Icc4_PositionNumber.read(this.io, this.root, this)
    this.positionsTable.add(it)
  for i in 0 ..< int(this.numberOfStructures):
    let it = Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType_ProfileIdentifier.read(this.io, this.root, this)
    this.profileIdentifiers.add(it)

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType], filename: string): Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType =
  Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType_ProfileIdentifier], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType): Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType_ProfileIdentifier =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType_ProfileIdentifier)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let profileIdExpr = this.io.readBytes(int(16))
  this.profileId = profileIdExpr
  let profileDescriptionExpr = Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType.read(this.io, this.root, this)
  this.profileDescription = profileDescriptionExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType_ProfileIdentifier], filename: string): Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType_ProfileIdentifier =
  Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType_ProfileIdentifier.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ColorantTableType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_ColorantTableType =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ColorantTableType)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  let countOfColorantsExpr = this.io.readU4be()
  this.countOfColorants = countOfColorantsExpr
  for i in 0 ..< int(this.countOfColorants):
    let it = Icc4_TagTable_TagDefinition_ColorantTableType_Colorant.read(this.io, this.root, this)
    this.colorants.add(it)

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ColorantTableType], filename: string): Icc4_TagTable_TagDefinition_ColorantTableType =
  Icc4_TagTable_TagDefinition_ColorantTableType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ColorantTableType_Colorant], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ColorantTableType): Icc4_TagTable_TagDefinition_ColorantTableType_Colorant =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ColorantTableType_Colorant)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameExpr = encode(this.io.readBytesTerm(0, false, true, true), "ASCII")
  this.name = nameExpr
  for i in 0 ..< int((32 - len(this.name))):
    let it = this.io.readBytes(int(1))
    this.padding.add(it)
  let pcsValuesExpr = this.io.readBytes(int(6))
  this.pcsValues = pcsValuesExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ColorantTableType_Colorant], filename: string): Icc4_TagTable_TagDefinition_ColorantTableType_Colorant =
  Icc4_TagTable_TagDefinition_ColorantTableType_Colorant.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_SignatureType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_SignatureType =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_SignatureType)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  let signatureExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.signature = signatureExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_SignatureType], filename: string): Icc4_TagTable_TagDefinition_SignatureType =
  Icc4_TagTable_TagDefinition_SignatureType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_CopyrightTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_CopyrightTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_CopyrightTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.multi_localized_unicode_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_CopyrightTag], filename: string): Icc4_TagTable_TagDefinition_CopyrightTag =
  Icc4_TagTable_TagDefinition_CopyrightTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_Preview0Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_Preview0Tag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_Preview0Tag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.multi_function_table_with_one_byte_precision_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_Lut8Type.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.multi_function_table_with_two_byte_precision_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_Lut16Type.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.multi_function_a_to_b_table_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_LutAToBType.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.multi_function_b_to_a_table_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_LutBToAType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_Preview0Tag], filename: string): Icc4_TagTable_TagDefinition_Preview0Tag =
  Icc4_TagTable_TagDefinition_Preview0Tag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_DateTimeType], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_CalibrationDateTimeTag): Icc4_TagTable_TagDefinition_DateTimeType =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_DateTimeType)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  let dateAndTimeExpr = Icc4_DateTimeNumber.read(this.io, this.root, this)
  this.dateAndTime = dateAndTimeExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_DateTimeType], filename: string): Icc4_TagTable_TagDefinition_DateTimeType =
  Icc4_TagTable_TagDefinition_DateTimeType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_DToB3Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_DToB3Tag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_DToB3Tag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.multi_process_elements_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_MultiProcessElementsType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_DToB3Tag], filename: string): Icc4_TagTable_TagDefinition_DToB3Tag =
  Icc4_TagTable_TagDefinition_DToB3Tag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_Preview2Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_Preview2Tag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_Preview2Tag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.multi_function_table_with_one_byte_precision_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_Lut8Type.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.multi_function_table_with_two_byte_precision_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_Lut16Type.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.multi_function_b_to_a_table_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_LutBToAType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_Preview2Tag], filename: string): Icc4_TagTable_TagDefinition_Preview2Tag =
  Icc4_TagTable_TagDefinition_Preview2Tag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_DeviceModelDescTag], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_DeviceModelDescTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_DeviceModelDescTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.multi_localized_unicode_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_DeviceModelDescTag], filename: string): Icc4_TagTable_TagDefinition_DeviceModelDescTag =
  Icc4_TagTable_TagDefinition_DeviceModelDescTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_MultiProcessElementsType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_MultiProcessElementsType =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_MultiProcessElementsType)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  let numberOfInputChannelsExpr = this.io.readU2be()
  this.numberOfInputChannels = numberOfInputChannelsExpr
  let numberOfOutputChannelsExpr = this.io.readU2be()
  this.numberOfOutputChannels = numberOfOutputChannelsExpr
  let numberOfProcessingElementsExpr = this.io.readU4be()
  this.numberOfProcessingElements = numberOfProcessingElementsExpr
  for i in 0 ..< int(this.numberOfProcessingElements):
    let it = Icc4_PositionNumber.read(this.io, this.root, this)
    this.processElementPositionsTable.add(it)
  let dataExpr = this.io.readBytesFull()
  this.data = dataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_MultiProcessElementsType], filename: string): Icc4_TagTable_TagDefinition_MultiProcessElementsType =
  Icc4_TagTable_TagDefinition_MultiProcessElementsType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_UInt16ArrayType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_UInt16ArrayType =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_UInt16ArrayType)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  block:
    var i: int
    while not this.io.isEof:
      let it = this.io.readU2be()
      this.values.add(it)
      inc i

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_UInt16ArrayType], filename: string): Icc4_TagTable_TagDefinition_UInt16ArrayType =
  Icc4_TagTable_TagDefinition_UInt16ArrayType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ColorantOrderTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_ColorantOrderTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ColorantOrderTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.colorant_order_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_ColorantOrderType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ColorantOrderTag], filename: string): Icc4_TagTable_TagDefinition_ColorantOrderTag =
  Icc4_TagTable_TagDefinition_ColorantOrderTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_DataType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_DataType =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_DataType)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let dataFlagExpr = Icc4_TagTable_TagDefinition_DataType_DataTypes(this.io.readU4be())
  this.dataFlag = dataFlagExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_DataType], filename: string): Icc4_TagTable_TagDefinition_DataType =
  Icc4_TagTable_TagDefinition_DataType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ChromaticityType], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ChromaticityTag): Icc4_TagTable_TagDefinition_ChromaticityType =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ChromaticityType)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  let numberOfDeviceChannelsExpr = this.io.readU2be()
  this.numberOfDeviceChannels = numberOfDeviceChannelsExpr
  let colorantAndPhosphorEncodingExpr = Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings(this.io.readU2be())
  this.colorantAndPhosphorEncoding = colorantAndPhosphorEncodingExpr
  for i in 0 ..< int(this.numberOfDeviceChannels):
    let it = Icc4_TagTable_TagDefinition_ChromaticityType_CiexyCoordinateValues.read(this.io, this.root, this)
    this.ciexyCoordinatesPerChannel.add(it)

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ChromaticityType], filename: string): Icc4_TagTable_TagDefinition_ChromaticityType =
  Icc4_TagTable_TagDefinition_ChromaticityType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ChromaticityType_CiexyCoordinateValues], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ChromaticityType): Icc4_TagTable_TagDefinition_ChromaticityType_CiexyCoordinateValues =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ChromaticityType_CiexyCoordinateValues)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xCoordinateExpr = this.io.readU2be()
  this.xCoordinate = xCoordinateExpr
  let yCoordinateExpr = this.io.readU2be()
  this.yCoordinate = yCoordinateExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ChromaticityType_CiexyCoordinateValues], filename: string): Icc4_TagTable_TagDefinition_ChromaticityType_CiexyCoordinateValues =
  Icc4_TagTable_TagDefinition_ChromaticityType_CiexyCoordinateValues.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_LuminanceTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_LuminanceTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_LuminanceTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.xyz_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_XyzType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_LuminanceTag], filename: string): Icc4_TagTable_TagDefinition_LuminanceTag =
  Icc4_TagTable_TagDefinition_LuminanceTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_S15Fixed16ArrayType], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ChromaticAdaptationTag): Icc4_TagTable_TagDefinition_S15Fixed16ArrayType =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_S15Fixed16ArrayType)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  block:
    var i: int
    while not this.io.isEof:
      let it = Icc4_S15Fixed16Number.read(this.io, this.root, this)
      this.values.add(it)
      inc i

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_S15Fixed16ArrayType], filename: string): Icc4_TagTable_TagDefinition_S15Fixed16ArrayType =
  Icc4_TagTable_TagDefinition_S15Fixed16ArrayType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  let numberOfRecordsExpr = this.io.readU4be()
  this.numberOfRecords = numberOfRecordsExpr
  let recordSizeExpr = this.io.readU4be()
  this.recordSize = recordSizeExpr
  for i in 0 ..< int(this.numberOfRecords):
    let it = Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record.read(this.io, this.root, this)
    this.records.add(it)

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType], filename: string): Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType =
  Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType): Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let languageCodeExpr = this.io.readU2be()
  this.languageCode = languageCodeExpr
  let countryCodeExpr = this.io.readU2be()
  this.countryCode = countryCodeExpr
  let stringLengthExpr = this.io.readU4be()
  this.stringLength = stringLengthExpr
  let stringOffsetExpr = this.io.readU4be()
  this.stringOffset = stringOffsetExpr

proc stringData(this: Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record): string = 
  if this.stringDataInst.len != 0:
    return this.stringDataInst
  let pos = this.io.pos()
  this.io.seek(int(this.stringOffset))
  let stringDataInstExpr = encode(this.io.readBytes(int(this.stringLength)), "UTF-16BE")
  this.stringDataInst = stringDataInstExpr
  this.io.seek(pos)
  if this.stringDataInst.len != 0:
    return this.stringDataInst

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record], filename: string): Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record =
  Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_AToB2Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_AToB2Tag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_AToB2Tag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.multi_function_table_with_one_byte_precision_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_Lut8Type.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.multi_function_table_with_two_byte_precision_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_Lut16Type.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.multi_function_a_to_b_table_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_LutAToBType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_AToB2Tag], filename: string): Icc4_TagTable_TagDefinition_AToB2Tag =
  Icc4_TagTable_TagDefinition_AToB2Tag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_AToB1Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_AToB1Tag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_AToB1Tag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.multi_function_table_with_one_byte_precision_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_Lut8Type.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.multi_function_table_with_two_byte_precision_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_Lut16Type.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.multi_function_a_to_b_table_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_LutAToBType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_AToB1Tag], filename: string): Icc4_TagTable_TagDefinition_AToB1Tag =
  Icc4_TagTable_TagDefinition_AToB1Tag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.signature_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_SignatureType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag], filename: string): Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag =
  Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_CharTargetTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_CharTargetTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_CharTargetTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.text_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_TextType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_CharTargetTag], filename: string): Icc4_TagTable_TagDefinition_CharTargetTag =
  Icc4_TagTable_TagDefinition_CharTargetTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ColorantTableTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_ColorantTableTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ColorantTableTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.colorant_table_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_ColorantTableType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ColorantTableTag], filename: string): Icc4_TagTable_TagDefinition_ColorantTableTag =
  Icc4_TagTable_TagDefinition_ColorantTableTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_CalibrationDateTimeTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_CalibrationDateTimeTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_CalibrationDateTimeTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.date_time_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_DateTimeType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_CalibrationDateTimeTag], filename: string): Icc4_TagTable_TagDefinition_CalibrationDateTimeTag =
  Icc4_TagTable_TagDefinition_CalibrationDateTimeTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_NamedColor2Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_NamedColor2Tag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_NamedColor2Tag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.named_color_2_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_NamedColor2Type.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_NamedColor2Tag], filename: string): Icc4_TagTable_TagDefinition_NamedColor2Tag =
  Icc4_TagTable_TagDefinition_NamedColor2Tag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ViewingCondDescTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_ViewingCondDescTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ViewingCondDescTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.multi_localized_unicode_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ViewingCondDescTag], filename: string): Icc4_TagTable_TagDefinition_ViewingCondDescTag =
  Icc4_TagTable_TagDefinition_ViewingCondDescTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_BToD3Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_BToD3Tag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_BToD3Tag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.multi_process_elements_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_MultiProcessElementsType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_BToD3Tag], filename: string): Icc4_TagTable_TagDefinition_BToD3Tag =
  Icc4_TagTable_TagDefinition_BToD3Tag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ProfileSequenceDescType], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ProfileSequenceTag): Icc4_TagTable_TagDefinition_ProfileSequenceDescType =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ProfileSequenceDescType)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  let numberOfDescriptionStructuresExpr = this.io.readU4be()
  this.numberOfDescriptionStructures = numberOfDescriptionStructuresExpr
  for i in 0 ..< int(this.numberOfDescriptionStructures):
    let it = Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription.read(this.io, this.root, this)
    this.profileDescriptions.add(it)

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ProfileSequenceDescType], filename: string): Icc4_TagTable_TagDefinition_ProfileSequenceDescType =
  Icc4_TagTable_TagDefinition_ProfileSequenceDescType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ProfileSequenceDescType): Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let deviceManufacturerExpr = Icc4_DeviceManufacturer.read(this.io, this.root, this)
  this.deviceManufacturer = deviceManufacturerExpr
  let deviceModelExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.deviceModel = deviceModelExpr
  let deviceAttributesExpr = Icc4_DeviceAttributes.read(this.io, this.root, this)
  this.deviceAttributes = deviceAttributesExpr
  let deviceTechnologyExpr = Icc4_TagTable_TagDefinition_TechnologyTag.read(this.io, this.root, this)
  this.deviceTechnology = deviceTechnologyExpr
  let descriptionOfDeviceManufacturerExpr = Icc4_TagTable_TagDefinition_DeviceMfgDescTag.read(this.io, this.root, this)
  this.descriptionOfDeviceManufacturer = descriptionOfDeviceManufacturerExpr
  let descriptionOfDeviceModelExpr = Icc4_TagTable_TagDefinition_DeviceModelDescTag.read(this.io, this.root, this)
  this.descriptionOfDeviceModel = descriptionOfDeviceModelExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription], filename: string): Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription =
  Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.profile_sequence_identifier_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag], filename: string): Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag =
  Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_BToD1Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_BToD1Tag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_BToD1Tag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.multi_process_elements_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_MultiProcessElementsType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_BToD1Tag], filename: string): Icc4_TagTable_TagDefinition_BToD1Tag =
  Icc4_TagTable_TagDefinition_BToD1Tag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ColorantOrderType], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ColorantOrderTag): Icc4_TagTable_TagDefinition_ColorantOrderType =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ColorantOrderType)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  let countOfColorantsExpr = this.io.readU4be()
  this.countOfColorants = countOfColorantsExpr
  for i in 0 ..< int(this.countOfColorants):
    let it = this.io.readU1()
    this.numbersOfColorantsInOrderOfPrinting.add(it)

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ColorantOrderType], filename: string): Icc4_TagTable_TagDefinition_ColorantOrderType =
  Icc4_TagTable_TagDefinition_ColorantOrderType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_DToB2Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_DToB2Tag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_DToB2Tag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.multi_process_elements_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_MultiProcessElementsType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_DToB2Tag], filename: string): Icc4_TagTable_TagDefinition_DToB2Tag =
  Icc4_TagTable_TagDefinition_DToB2Tag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_GrayTrcTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_GrayTrcTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_GrayTrcTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.curve_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_CurveType.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.parametric_curve_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_ParametricCurveType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_GrayTrcTag], filename: string): Icc4_TagTable_TagDefinition_GrayTrcTag =
  Icc4_TagTable_TagDefinition_GrayTrcTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_ViewingConditionsType], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_ViewingConditionsTag): Icc4_TagTable_TagDefinition_ViewingConditionsType =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_ViewingConditionsType)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  let unNormalizedCiexyzValuesForIlluminantExpr = Icc4_XyzNumber.read(this.io, this.root, this)
  this.unNormalizedCiexyzValuesForIlluminant = unNormalizedCiexyzValuesForIlluminantExpr
  let unNormalizedCiexyzValuesForSurroundExpr = Icc4_XyzNumber.read(this.io, this.root, this)
  this.unNormalizedCiexyzValuesForSurround = unNormalizedCiexyzValuesForSurroundExpr
  let illuminantTypeExpr = Icc4_StandardIlluminantEncoding.read(this.io, this.root, this)
  this.illuminantType = illuminantTypeExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_ViewingConditionsType], filename: string): Icc4_TagTable_TagDefinition_ViewingConditionsType =
  Icc4_TagTable_TagDefinition_ViewingConditionsType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_LutBToAType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_LutBToAType =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_LutBToAType)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  let numberOfInputChannelsExpr = this.io.readU1()
  this.numberOfInputChannels = numberOfInputChannelsExpr
  let numberOfOutputChannelsExpr = this.io.readU1()
  this.numberOfOutputChannels = numberOfOutputChannelsExpr
  let paddingExpr = this.io.readBytes(int(2))
  this.padding = paddingExpr
  let offsetToFirstBCurveExpr = this.io.readU4be()
  this.offsetToFirstBCurve = offsetToFirstBCurveExpr
  let offsetToMatrixExpr = this.io.readU4be()
  this.offsetToMatrix = offsetToMatrixExpr
  let offsetToFirstMCurveExpr = this.io.readU4be()
  this.offsetToFirstMCurve = offsetToFirstMCurveExpr
  let offsetToClutExpr = this.io.readU4be()
  this.offsetToClut = offsetToClutExpr
  let offsetToFirstACurveExpr = this.io.readU4be()
  this.offsetToFirstACurve = offsetToFirstACurveExpr
  let dataExpr = this.io.readBytesFull()
  this.data = dataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_LutBToAType], filename: string): Icc4_TagTable_TagDefinition_LutBToAType =
  Icc4_TagTable_TagDefinition_LutBToAType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_GreenTrcTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_GreenTrcTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_GreenTrcTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.curve_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_CurveType.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.parametric_curve_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_ParametricCurveType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_GreenTrcTag], filename: string): Icc4_TagTable_TagDefinition_GreenTrcTag =
  Icc4_TagTable_TagDefinition_GreenTrcTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_UInt32ArrayType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_UInt32ArrayType =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_UInt32ArrayType)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  block:
    var i: int
    while not this.io.isEof:
      let it = this.io.readU4be()
      this.values.add(it)
      inc i

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_UInt32ArrayType], filename: string): Icc4_TagTable_TagDefinition_UInt32ArrayType =
  Icc4_TagTable_TagDefinition_UInt32ArrayType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_GamutTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_GamutTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_GamutTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.multi_function_table_with_one_byte_precision_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_Lut8Type.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.multi_function_table_with_two_byte_precision_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_Lut16Type.read(this.io, this.root, this)
      this.tagData = tagDataExpr
    elif on == icc_4.multi_function_b_to_a_table_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_LutBToAType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_GamutTag], filename: string): Icc4_TagTable_TagDefinition_GamutTag =
  Icc4_TagTable_TagDefinition_GamutTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_UInt8ArrayType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_UInt8ArrayType =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_UInt8ArrayType)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  block:
    var i: int
    while not this.io.isEof:
      let it = this.io.readU1()
      this.values.add(it)
      inc i

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_UInt8ArrayType], filename: string): Icc4_TagTable_TagDefinition_UInt8ArrayType =
  Icc4_TagTable_TagDefinition_UInt8ArrayType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_RedMatrixColumnTag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_RedMatrixColumnTag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_RedMatrixColumnTag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.xyz_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_XyzType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_RedMatrixColumnTag], filename: string): Icc4_TagTable_TagDefinition_RedMatrixColumnTag =
  Icc4_TagTable_TagDefinition_RedMatrixColumnTag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_UInt64ArrayType], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_TagTable_TagDefinition_UInt64ArrayType =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_UInt64ArrayType)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readBytes(int(4))
  this.reserved = reservedExpr
  block:
    var i: int
    while not this.io.isEof:
      let it = this.io.readU8be()
      this.values.add(it)
      inc i

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_UInt64ArrayType], filename: string): Icc4_TagTable_TagDefinition_UInt64ArrayType =
  Icc4_TagTable_TagDefinition_UInt64ArrayType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_TagTable_TagDefinition_BToD2Tag], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition): Icc4_TagTable_TagDefinition_BToD2Tag =
  template this: untyped = result
  this = new(Icc4_TagTable_TagDefinition_BToD2Tag)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let tagTypeExpr = Icc4_TagTable_TagDefinition_TagTypeSignatures(this.io.readU4be())
  this.tagType = tagTypeExpr
  block:
    let on = this.tagType
    if on == icc_4.multi_process_elements_type:
      let tagDataExpr = Icc4_TagTable_TagDefinition_MultiProcessElementsType.read(this.io, this.root, this)
      this.tagData = tagDataExpr

proc fromFile*(_: typedesc[Icc4_TagTable_TagDefinition_BToD2Tag], filename: string): Icc4_TagTable_TagDefinition_BToD2Tag =
  Icc4_TagTable_TagDefinition_BToD2Tag.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_DeviceAttributes], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_DeviceAttributes =
  template this: untyped = result
  this = new(Icc4_DeviceAttributes)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reflectiveOrTransparencyExpr = Icc4_DeviceAttributes_DeviceAttributesReflectiveOrTransparency(this.io.readBitsIntBe(1))
  this.reflectiveOrTransparency = reflectiveOrTransparencyExpr
  let glossyOrMatteExpr = Icc4_DeviceAttributes_DeviceAttributesGlossyOrMatte(this.io.readBitsIntBe(1))
  this.glossyOrMatte = glossyOrMatteExpr
  let positiveOrNegativeMediaPolarityExpr = Icc4_DeviceAttributes_DeviceAttributesPositiveOrNegativeMediaPolarity(this.io.readBitsIntBe(1))
  this.positiveOrNegativeMediaPolarity = positiveOrNegativeMediaPolarityExpr
  let colourOrBlackAndWhiteMediaExpr = Icc4_DeviceAttributes_DeviceAttributesColourOrBlackAndWhiteMedia(this.io.readBitsIntBe(1))
  this.colourOrBlackAndWhiteMedia = colourOrBlackAndWhiteMediaExpr
  let reservedExpr = this.io.readBitsIntBe(28)
  this.reserved = reservedExpr
  let vendorSpecificExpr = this.io.readBitsIntBe(32)
  this.vendorSpecific = vendorSpecificExpr

proc fromFile*(_: typedesc[Icc4_DeviceAttributes], filename: string): Icc4_DeviceAttributes =
  Icc4_DeviceAttributes.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_DeviceManufacturer], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_DeviceManufacturer =
  template this: untyped = result
  this = new(Icc4_DeviceManufacturer)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let deviceManufacturerExpr = Icc4_DeviceManufacturer_DeviceManufacturers(this.io.readU4be())
  this.deviceManufacturer = deviceManufacturerExpr

proc fromFile*(_: typedesc[Icc4_DeviceManufacturer], filename: string): Icc4_DeviceManufacturer =
  Icc4_DeviceManufacturer.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_S15Fixed16Number], io: KaitaiStream, root: KaitaiStruct, parent: Icc4_TagTable_TagDefinition_S15Fixed16ArrayType): Icc4_S15Fixed16Number =
  template this: untyped = result
  this = new(Icc4_S15Fixed16Number)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let numberExpr = this.io.readBytes(int(4))
  this.number = numberExpr

proc fromFile*(_: typedesc[Icc4_S15Fixed16Number], filename: string): Icc4_S15Fixed16Number =
  Icc4_S15Fixed16Number.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Icc4_PositionNumber], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Icc4_PositionNumber =
  template this: untyped = result
  this = new(Icc4_PositionNumber)
  let root = if root == nil: cast[Icc4](this) else: cast[Icc4](root)
  this.io = io
  this.root = root
  this.parent = parent

  let offsetToDataElementExpr = this.io.readU4be()
  this.offsetToDataElement = offsetToDataElementExpr
  let sizeOfDataElementExpr = this.io.readU4be()
  this.sizeOfDataElement = sizeOfDataElementExpr

proc fromFile*(_: typedesc[Icc4_PositionNumber], filename: string): Icc4_PositionNumber =
  Icc4_PositionNumber.read(newKaitaiFileStream(filename), nil, nil)


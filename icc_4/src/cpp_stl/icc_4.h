#ifndef ICC_4_H_
#define ICC_4_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include <kaitai/kaitaistruct.h>
#include <kaitai/kaitaistream.h>

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class icc_4_t : public kaitai::kstruct {

public:
    class u_8_fixed_8_number_t;
    class u_16_fixed_16_number_t;
    class standard_illuminant_encoding_t;
    class profile_header_t;
    class xyz_number_t;
    class date_time_number_t;
    class response_16_number_t;
    class u_1_fixed_15_number_t;
    class tag_table_t;
    class device_attributes_t;
    class device_manufacturer_t;
    class s_15_fixed_16_number_t;
    class position_number_t;

    icc_4_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
    void _read();
    ~icc_4_t();

    class u_8_fixed_8_number_t : public kaitai::kstruct {

    public:

        u_8_fixed_8_number_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
        void _read();
        ~u_8_fixed_8_number_t();

    private:
        std::string m_number;
        icc_4_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        std::string number() const { return m_number; }
        icc_4_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class u_16_fixed_16_number_t : public kaitai::kstruct {

    public:

        u_16_fixed_16_number_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
        void _read();
        ~u_16_fixed_16_number_t();

    private:
        std::string m_number;
        icc_4_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        std::string number() const { return m_number; }
        icc_4_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class standard_illuminant_encoding_t : public kaitai::kstruct {

    public:

        enum standard_illuminant_encodings_t {
            STANDARD_ILLUMINANT_ENCODINGS_UNKNOWN = 0,
            STANDARD_ILLUMINANT_ENCODINGS_D50 = 1,
            STANDARD_ILLUMINANT_ENCODINGS_D65 = 2,
            STANDARD_ILLUMINANT_ENCODINGS_D93 = 3,
            STANDARD_ILLUMINANT_ENCODINGS_F2 = 4,
            STANDARD_ILLUMINANT_ENCODINGS_D55 = 5,
            STANDARD_ILLUMINANT_ENCODINGS_A = 6,
            STANDARD_ILLUMINANT_ENCODINGS_EQUI_POWER = 7,
            STANDARD_ILLUMINANT_ENCODINGS_F8 = 8
        };

        standard_illuminant_encoding_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
        void _read();
        ~standard_illuminant_encoding_t();

    private:
        standard_illuminant_encodings_t m_standard_illuminant_encoding;
        icc_4_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        standard_illuminant_encodings_t standard_illuminant_encoding() const { return m_standard_illuminant_encoding; }
        icc_4_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class profile_header_t : public kaitai::kstruct {

    public:
        class version_field_t;
        class profile_flags_t;

        enum cmm_signatures_t {
            CMM_SIGNATURES_THE_IMAGING_FACTORY_CMM = 858931796,
            CMM_SIGNATURES_AGFA_CMM = 1094929747,
            CMM_SIGNATURES_ADOBE_CMM = 1094992453,
            CMM_SIGNATURES_COLOR_GEAR_CMM = 1128484179,
            CMM_SIGNATURES_LOGOSYNC_CMM = 1147629395,
            CMM_SIGNATURES_EFI_CMM = 1162234144,
            CMM_SIGNATURES_EXACT_SCAN_CMM = 1163411779,
            CMM_SIGNATURES_FUJI_FILM_CMM = 1179000864,
            CMM_SIGNATURES_HARLEQUIN_RIP_CMM = 1212370253,
            CMM_SIGNATURES_HEIDELBERG_CMM = 1212435744,
            CMM_SIGNATURES_KODAK_CMM = 1262701907,
            CMM_SIGNATURES_KONICA_MINOLTA_CMM = 1296256324,
            CMM_SIGNATURES_DEVICE_LINK_CMM = 1380404563,
            CMM_SIGNATURES_SAMPLE_ICC_CMM = 1397310275,
            CMM_SIGNATURES_MUTOH_CMM = 1397311310,
            CMM_SIGNATURES_TOSHIBA_CMM = 1413696845,
            CMM_SIGNATURES_COLOR_GEAR_CMM_LITE = 1430471501,
            CMM_SIGNATURES_COLOR_GEAR_CMM_C = 1430474067,
            CMM_SIGNATURES_WINDOWS_COLOR_SYSTEM_CMM = 1464029984,
            CMM_SIGNATURES_WARE_TO_GO_CMM = 1465141024,
            CMM_SIGNATURES_APPLE_CMM = 1634758764,
            CMM_SIGNATURES_ARGYLL_CMS_CMM = 1634887532,
            CMM_SIGNATURES_LITTLE_CMS_CMM = 1818455411,
            CMM_SIGNATURES_ZORAN_CMM = 2053320752
        };

        enum primary_platforms_t {
            PRIMARY_PLATFORMS_APPLE_COMPUTER_INC = 1095782476,
            PRIMARY_PLATFORMS_MICROSOFT_CORPORATION = 1297303124,
            PRIMARY_PLATFORMS_SILICON_GRAPHICS_INC = 1397180704,
            PRIMARY_PLATFORMS_SUN_MICROSYSTEMS = 1398099543
        };

        enum profile_classes_t {
            PROFILE_CLASSES_ABSTRACT_PROFILE = 1633842036,
            PROFILE_CLASSES_DEVICE_LINK_PROFILE = 1818848875,
            PROFILE_CLASSES_DISPLAY_DEVICE_PROFILE = 1835955314,
            PROFILE_CLASSES_NAMED_COLOR_PROFILE = 1852662636,
            PROFILE_CLASSES_OUTPUT_DEVICE_PROFILE = 1886549106,
            PROFILE_CLASSES_INPUT_DEVICE_PROFILE = 1935896178,
            PROFILE_CLASSES_COLOR_SPACE_PROFILE = 1936744803
        };

        enum rendering_intents_t {
            RENDERING_INTENTS_PERCEPTUAL = 0,
            RENDERING_INTENTS_MEDIA_RELATIVE_COLORIMETRIC = 1,
            RENDERING_INTENTS_SATURATION = 2,
            RENDERING_INTENTS_ICC_ABSOLUTE_COLORIMETRIC = 3
        };

        enum data_colour_spaces_t {
            DATA_COLOUR_SPACES_TWO_COLOUR = 843271250,
            DATA_COLOUR_SPACES_THREE_COLOUR = 860048466,
            DATA_COLOUR_SPACES_FOUR_COLOUR = 876825682,
            DATA_COLOUR_SPACES_FIVE_COLOUR = 893602898,
            DATA_COLOUR_SPACES_SIX_COLOUR = 910380114,
            DATA_COLOUR_SPACES_SEVEN_COLOUR = 927157330,
            DATA_COLOUR_SPACES_EIGHT_COLOUR = 943934546,
            DATA_COLOUR_SPACES_NINE_COLOUR = 960711762,
            DATA_COLOUR_SPACES_TEN_COLOUR = 1094929490,
            DATA_COLOUR_SPACES_ELEVEN_COLOUR = 1111706706,
            DATA_COLOUR_SPACES_TWELVE_COLOUR = 1128483922,
            DATA_COLOUR_SPACES_CMY = 1129142560,
            DATA_COLOUR_SPACES_CMYK = 1129142603,
            DATA_COLOUR_SPACES_THIRTEEN_COLOUR = 1145261138,
            DATA_COLOUR_SPACES_FOURTEEN_COLOUR = 1162038354,
            DATA_COLOUR_SPACES_FIFTEEN_COLOUR = 1178815570,
            DATA_COLOUR_SPACES_GRAY = 1196573017,
            DATA_COLOUR_SPACES_HLS = 1212961568,
            DATA_COLOUR_SPACES_HSV = 1213421088,
            DATA_COLOUR_SPACES_CIELAB_OR_PCSLAB = 1281450528,
            DATA_COLOUR_SPACES_CIELUV = 1282766368,
            DATA_COLOUR_SPACES_RGB = 1380401696,
            DATA_COLOUR_SPACES_NCIEXYZ_OR_PCSXYZ = 1482250784,
            DATA_COLOUR_SPACES_YCBCR = 1497588338,
            DATA_COLOUR_SPACES_CIEYXY = 1501067552
        };

        profile_header_t(kaitai::kstream* p_io, icc_4_t* p_parent = 0, icc_4_t* p_root = 0);
        void _read();
        ~profile_header_t();

        class version_field_t : public kaitai::kstruct {

        public:

            version_field_t(kaitai::kstream* p_io, icc_4_t::profile_header_t* p_parent = 0, icc_4_t* p_root = 0);
            void _read();
            ~version_field_t();

        private:
            std::string m_major;
            uint64_t m_minor;
            uint64_t m_bug_fix_level;
            std::string m_reserved;
            icc_4_t* m__root;
            icc_4_t::profile_header_t* m__parent;

        public:
            std::string major() const { return m_major; }
            uint64_t minor() const { return m_minor; }
            uint64_t bug_fix_level() const { return m_bug_fix_level; }
            std::string reserved() const { return m_reserved; }
            icc_4_t* _root() const { return m__root; }
            icc_4_t::profile_header_t* _parent() const { return m__parent; }
        };

        class profile_flags_t : public kaitai::kstruct {

        public:

            profile_flags_t(kaitai::kstream* p_io, icc_4_t::profile_header_t* p_parent = 0, icc_4_t* p_root = 0);
            void _read();
            ~profile_flags_t();

        private:
            bool m_embedded_profile;
            bool m_profile_can_be_used_independently_of_embedded_colour_data;
            uint64_t m_other_flags;
            icc_4_t* m__root;
            icc_4_t::profile_header_t* m__parent;

        public:
            bool embedded_profile() const { return m_embedded_profile; }
            bool profile_can_be_used_independently_of_embedded_colour_data() const { return m_profile_can_be_used_independently_of_embedded_colour_data; }
            uint64_t other_flags() const { return m_other_flags; }
            icc_4_t* _root() const { return m__root; }
            icc_4_t::profile_header_t* _parent() const { return m__parent; }
        };

    private:
        uint32_t m_size;
        cmm_signatures_t m_preferred_cmm_type;
        version_field_t* m_version;
        profile_classes_t m_device_class;
        data_colour_spaces_t m_color_space;
        std::string m_pcs;
        date_time_number_t* m_creation_date_time;
        std::string m_file_signature;
        primary_platforms_t m_primary_platform;
        profile_flags_t* m_profile_flags;
        device_manufacturer_t* m_device_manufacturer;
        std::string m_device_model;
        device_attributes_t* m_device_attributes;
        rendering_intents_t m_rendering_intent;
        xyz_number_t* m_nciexyz_values_of_illuminant_of_pcs;
        device_manufacturer_t* m_creator;
        std::string m_identifier;
        std::string m_reserved_data;
        icc_4_t* m__root;
        icc_4_t* m__parent;

    public:
        uint32_t size() const { return m_size; }
        cmm_signatures_t preferred_cmm_type() const { return m_preferred_cmm_type; }
        version_field_t* version() const { return m_version; }
        profile_classes_t device_class() const { return m_device_class; }
        data_colour_spaces_t color_space() const { return m_color_space; }
        std::string pcs() const { return m_pcs; }
        date_time_number_t* creation_date_time() const { return m_creation_date_time; }
        std::string file_signature() const { return m_file_signature; }
        primary_platforms_t primary_platform() const { return m_primary_platform; }
        profile_flags_t* profile_flags() const { return m_profile_flags; }
        device_manufacturer_t* device_manufacturer() const { return m_device_manufacturer; }
        std::string device_model() const { return m_device_model; }
        device_attributes_t* device_attributes() const { return m_device_attributes; }
        rendering_intents_t rendering_intent() const { return m_rendering_intent; }
        xyz_number_t* nciexyz_values_of_illuminant_of_pcs() const { return m_nciexyz_values_of_illuminant_of_pcs; }
        device_manufacturer_t* creator() const { return m_creator; }
        std::string identifier() const { return m_identifier; }
        std::string reserved_data() const { return m_reserved_data; }
        icc_4_t* _root() const { return m__root; }
        icc_4_t* _parent() const { return m__parent; }
    };

    class xyz_number_t : public kaitai::kstruct {

    public:

        xyz_number_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
        void _read();
        ~xyz_number_t();

    private:
        std::string m_x;
        std::string m_y;
        std::string m_z;
        icc_4_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        std::string x() const { return m_x; }
        std::string y() const { return m_y; }
        std::string z() const { return m_z; }
        icc_4_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class date_time_number_t : public kaitai::kstruct {

    public:

        date_time_number_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
        void _read();
        ~date_time_number_t();

    private:
        uint16_t m_year;
        uint16_t m_month;
        uint16_t m_day;
        uint16_t m_hour;
        uint16_t m_minute;
        uint16_t m_second;
        icc_4_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint16_t year() const { return m_year; }
        uint16_t month() const { return m_month; }
        uint16_t day() const { return m_day; }
        uint16_t hour() const { return m_hour; }
        uint16_t minute() const { return m_minute; }
        uint16_t second() const { return m_second; }
        icc_4_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class response_16_number_t : public kaitai::kstruct {

    public:

        response_16_number_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
        void _read();
        ~response_16_number_t();

    private:
        uint32_t m_number;
        std::string m_reserved;
        s_15_fixed_16_number_t* m_measurement_value;
        icc_4_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint32_t number() const { return m_number; }
        std::string reserved() const { return m_reserved; }
        s_15_fixed_16_number_t* measurement_value() const { return m_measurement_value; }
        icc_4_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class u_1_fixed_15_number_t : public kaitai::kstruct {

    public:

        u_1_fixed_15_number_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
        void _read();
        ~u_1_fixed_15_number_t();

    private:
        std::string m_number;
        icc_4_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        std::string number() const { return m_number; }
        icc_4_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class tag_table_t : public kaitai::kstruct {

    public:
        class tag_definition_t;

        tag_table_t(kaitai::kstream* p_io, icc_4_t* p_parent = 0, icc_4_t* p_root = 0);
        void _read();
        ~tag_table_t();

        class tag_definition_t : public kaitai::kstruct {

        public:
            class blue_matrix_column_tag_t;
            class device_mfg_desc_tag_t;
            class named_color_2_type_t;
            class viewing_conditions_tag_t;
            class blue_trc_tag_t;
            class response_curve_set_16_type_t;
            class curve_type_t;
            class saturation_rendering_intent_gamut_tag_t;
            class xyz_type_t;
            class lut_8_type_t;
            class b_to_a_2_tag_t;
            class lut_a_to_b_type_t;
            class b_to_a_0_tag_t;
            class media_white_point_tag_t;
            class lut_16_type_t;
            class perceptual_rendering_intent_gamut_tag_t;
            class u_16_fixed_16_array_type_t;
            class colorant_table_out_tag_t;
            class measurement_tag_t;
            class profile_sequence_tag_t;
            class technology_tag_t;
            class a_to_b_0_tag_t;
            class d_to_b_0_tag_t;
            class output_response_tag_t;
            class green_matrix_column_tag_t;
            class profile_description_tag_t;
            class preview_1_tag_t;
            class red_trc_tag_t;
            class b_to_d_0_tag_t;
            class d_to_b_1_tag_t;
            class b_to_a_1_tag_t;
            class parametric_curve_type_t;
            class chromaticity_tag_t;
            class chromatic_adaptation_tag_t;
            class measurement_type_t;
            class text_type_t;
            class profile_sequence_identifier_type_t;
            class colorant_table_type_t;
            class signature_type_t;
            class copyright_tag_t;
            class preview_0_tag_t;
            class date_time_type_t;
            class d_to_b_3_tag_t;
            class preview_2_tag_t;
            class device_model_desc_tag_t;
            class multi_process_elements_type_t;
            class u_int_16_array_type_t;
            class colorant_order_tag_t;
            class data_type_t;
            class chromaticity_type_t;
            class luminance_tag_t;
            class s_15_fixed_16_array_type_t;
            class multi_localized_unicode_type_t;
            class a_to_b_2_tag_t;
            class a_to_b_1_tag_t;
            class colorimetric_intent_image_state_tag_t;
            class char_target_tag_t;
            class colorant_table_tag_t;
            class calibration_date_time_tag_t;
            class named_color_2_tag_t;
            class viewing_cond_desc_tag_t;
            class b_to_d_3_tag_t;
            class profile_sequence_desc_type_t;
            class profile_sequence_identifier_tag_t;
            class b_to_d_1_tag_t;
            class colorant_order_type_t;
            class d_to_b_2_tag_t;
            class gray_trc_tag_t;
            class viewing_conditions_type_t;
            class lut_b_to_a_type_t;
            class green_trc_tag_t;
            class u_int_32_array_type_t;
            class gamut_tag_t;
            class u_int_8_array_type_t;
            class red_matrix_column_tag_t;
            class u_int_64_array_type_t;
            class b_to_d_2_tag_t;

            enum tag_signatures_t {
                TAG_SIGNATURES_A_TO_B_0 = 1093812784,
                TAG_SIGNATURES_A_TO_B_1 = 1093812785,
                TAG_SIGNATURES_A_TO_B_2 = 1093812786,
                TAG_SIGNATURES_B_TO_A_0 = 1110589744,
                TAG_SIGNATURES_B_TO_A_1 = 1110589745,
                TAG_SIGNATURES_B_TO_A_2 = 1110589746,
                TAG_SIGNATURES_B_TO_D_0 = 1110590512,
                TAG_SIGNATURES_B_TO_D_1 = 1110590513,
                TAG_SIGNATURES_B_TO_D_2 = 1110590514,
                TAG_SIGNATURES_B_TO_D_3 = 1110590515,
                TAG_SIGNATURES_D_TO_B_0 = 1144144432,
                TAG_SIGNATURES_D_TO_B_1 = 1144144433,
                TAG_SIGNATURES_D_TO_B_2 = 1144144434,
                TAG_SIGNATURES_D_TO_B_3 = 1144144435,
                TAG_SIGNATURES_BLUE_TRC = 1649693251,
                TAG_SIGNATURES_BLUE_MATRIX_COLUMN = 1649957210,
                TAG_SIGNATURES_CALIBRATION_DATE_TIME = 1667329140,
                TAG_SIGNATURES_CHROMATIC_ADAPTATION = 1667785060,
                TAG_SIGNATURES_CHROMATICITY = 1667789421,
                TAG_SIGNATURES_COLORIMETRIC_INTENT_IMAGE_STATE = 1667852659,
                TAG_SIGNATURES_COLORANT_TABLE_OUT = 1668050804,
                TAG_SIGNATURES_COLORANT_ORDER = 1668051567,
                TAG_SIGNATURES_COLORANT_TABLE = 1668051572,
                TAG_SIGNATURES_COPYRIGHT = 1668313716,
                TAG_SIGNATURES_PROFILE_DESCRIPTION = 1684370275,
                TAG_SIGNATURES_DEVICE_MODEL_DESC = 1684890724,
                TAG_SIGNATURES_DEVICE_MFG_DESC = 1684893284,
                TAG_SIGNATURES_GREEN_TRC = 1733579331,
                TAG_SIGNATURES_GREEN_MATRIX_COLUMN = 1733843290,
                TAG_SIGNATURES_GAMUT = 1734438260,
                TAG_SIGNATURES_GRAY_TRC = 1800688195,
                TAG_SIGNATURES_LUMINANCE = 1819635049,
                TAG_SIGNATURES_MEASUREMENT = 1835360627,
                TAG_SIGNATURES_NAMED_COLOR_2 = 1852009522,
                TAG_SIGNATURES_PREVIEW_0 = 1886545200,
                TAG_SIGNATURES_PREVIEW_1 = 1886545201,
                TAG_SIGNATURES_PREVIEW_2 = 1886545202,
                TAG_SIGNATURES_PROFILE_SEQUENCE = 1886610801,
                TAG_SIGNATURES_PROFILE_SEQUENCE_IDENTIFIER = 1886611812,
                TAG_SIGNATURES_RED_TRC = 1918128707,
                TAG_SIGNATURES_RED_MATRIX_COLUMN = 1918392666,
                TAG_SIGNATURES_OUTPUT_RESPONSE = 1919251312,
                TAG_SIGNATURES_PERCEPTUAL_RENDERING_INTENT_GAMUT = 1919510320,
                TAG_SIGNATURES_SATURATION_RENDERING_INTENT_GAMUT = 1919510322,
                TAG_SIGNATURES_CHAR_TARGET = 1952543335,
                TAG_SIGNATURES_TECHNOLOGY = 1952801640,
                TAG_SIGNATURES_VIEWING_CONDITIONS = 1986618743,
                TAG_SIGNATURES_VIEWING_COND_DESC = 1987405156,
                TAG_SIGNATURES_MEDIA_WHITE_POINT = 2004119668
            };

            enum tag_type_signatures_t {
                TAG_TYPE_SIGNATURES_XYZ_TYPE = 1482250784,
                TAG_TYPE_SIGNATURES_COLORANT_TABLE_TYPE = 1668051572,
                TAG_TYPE_SIGNATURES_CURVE_TYPE = 1668641398,
                TAG_TYPE_SIGNATURES_DATA_TYPE = 1684108385,
                TAG_TYPE_SIGNATURES_DATE_TIME_TYPE = 1685350765,
                TAG_TYPE_SIGNATURES_MULTI_FUNCTION_A_TO_B_TABLE_TYPE = 1832993312,
                TAG_TYPE_SIGNATURES_MULTI_FUNCTION_B_TO_A_TABLE_TYPE = 1833058592,
                TAG_TYPE_SIGNATURES_MEASUREMENT_TYPE = 1835360627,
                TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE = 1835430961,
                TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE = 1835430962,
                TAG_TYPE_SIGNATURES_MULTI_LOCALIZED_UNICODE_TYPE = 1835824483,
                TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE = 1836082548,
                TAG_TYPE_SIGNATURES_NAMED_COLOR_2_TYPE = 1852009522,
                TAG_TYPE_SIGNATURES_PARAMETRIC_CURVE_TYPE = 1885434465,
                TAG_TYPE_SIGNATURES_PROFILE_SEQUENCE_DESC_TYPE = 1886610801,
                TAG_TYPE_SIGNATURES_PROFILE_SEQUENCE_IDENTIFIER_TYPE = 1886611812,
                TAG_TYPE_SIGNATURES_RESPONSE_CURVE_SET_16_TYPE = 1919120178,
                TAG_TYPE_SIGNATURES_S_15_FIXED_16_ARRAY_TYPE = 1936077618,
                TAG_TYPE_SIGNATURES_SIGNATURE_TYPE = 1936287520,
                TAG_TYPE_SIGNATURES_TEXT_TYPE = 1952807028,
                TAG_TYPE_SIGNATURES_U_16_FIXED_16_ARRAY_TYPE = 1969632050,
                TAG_TYPE_SIGNATURES_U_INT_8_ARRAY_TYPE = 1969827896,
                TAG_TYPE_SIGNATURES_U_INT_16_ARRAY_TYPE = 1969828150,
                TAG_TYPE_SIGNATURES_U_INT_32_ARRAY_TYPE = 1969828658,
                TAG_TYPE_SIGNATURES_U_INT_64_ARRAY_TYPE = 1969829428,
                TAG_TYPE_SIGNATURES_VIEWING_CONDITIONS_TYPE = 1986618743
            };

            enum multi_process_elements_types_t {
                MULTI_PROCESS_ELEMENTS_TYPES_BACS_ELEMENT_TYPE = 1648444243,
                MULTI_PROCESS_ELEMENTS_TYPES_CLUT_ELEMENT_TYPE = 1668052340,
                MULTI_PROCESS_ELEMENTS_TYPES_ONE_DIMENSIONAL_CURVES_TYPE = 1668641382,
                MULTI_PROCESS_ELEMENTS_TYPES_EACS_ELEMENT_TYPE = 1698775891,
                MULTI_PROCESS_ELEMENTS_TYPES_MATRIX_ELEMENT_TYPE = 1835103334,
                MULTI_PROCESS_ELEMENTS_TYPES_CURVE_SET_ELEMENT_TABLE_TYPE = 1835428980,
                MULTI_PROCESS_ELEMENTS_TYPES_FORMULA_CURVE_SEGMENTS_TYPE = 1885434470,
                MULTI_PROCESS_ELEMENTS_TYPES_SAMPLED_CURVE_SEGMENT_TYPE = 1935764838
            };

            tag_definition_t(kaitai::kstream* p_io, icc_4_t::tag_table_t* p_parent = 0, icc_4_t* p_root = 0);
            void _read();
            ~tag_definition_t();

            class blue_matrix_column_tag_t : public kaitai::kstruct {

            public:

                blue_matrix_column_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~blue_matrix_column_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                xyz_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                xyz_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class device_mfg_desc_tag_t : public kaitai::kstruct {

            public:

                device_mfg_desc_tag_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~device_mfg_desc_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                multi_localized_unicode_type_t* m_tag_data;
                icc_4_t* m__root;
                kaitai::kstruct* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                multi_localized_unicode_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                kaitai::kstruct* _parent() const { return m__parent; }
            };

            class named_color_2_type_t : public kaitai::kstruct {

            public:
                class named_colour_definition_t;

                named_color_2_type_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t::named_color_2_tag_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~named_color_2_type_t();

                class named_colour_definition_t : public kaitai::kstruct {

                public:

                    named_colour_definition_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t::named_color_2_type_t* p_parent = 0, icc_4_t* p_root = 0);
                    void _read();
                    ~named_colour_definition_t();

                private:
                    std::string m_root_name;
                    std::vector<std::string>* m_root_name_padding;
                    std::string m_pcs_coordinates;
                    std::vector<uint16_t>* m_device_coordinates;
                    bool n_device_coordinates;

                public:
                    bool _is_null_device_coordinates() { device_coordinates(); return n_device_coordinates; };

                private:
                    icc_4_t* m__root;
                    icc_4_t::tag_table_t::tag_definition_t::named_color_2_type_t* m__parent;

                public:
                    std::string root_name() const { return m_root_name; }
                    std::vector<std::string>* root_name_padding() const { return m_root_name_padding; }
                    std::string pcs_coordinates() const { return m_pcs_coordinates; }
                    std::vector<uint16_t>* device_coordinates() const { return m_device_coordinates; }
                    icc_4_t* _root() const { return m__root; }
                    icc_4_t::tag_table_t::tag_definition_t::named_color_2_type_t* _parent() const { return m__parent; }
                };

            private:
                std::string m_reserved;
                uint32_t m_vendor_specific_flag;
                uint32_t m_count_of_named_colours;
                uint32_t m_number_of_device_coordinates_for_each_named_colour;
                std::string m_prefix_for_each_colour_name;
                std::vector<std::string>* m_prefix_for_each_colour_name_padding;
                std::string m_suffix_for_each_colour_name;
                std::vector<std::string>* m_suffix_for_each_colour_name_padding;
                std::vector<named_colour_definition_t*>* m_named_colour_definitions;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t::named_color_2_tag_t* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                uint32_t vendor_specific_flag() const { return m_vendor_specific_flag; }
                uint32_t count_of_named_colours() const { return m_count_of_named_colours; }
                uint32_t number_of_device_coordinates_for_each_named_colour() const { return m_number_of_device_coordinates_for_each_named_colour; }
                std::string prefix_for_each_colour_name() const { return m_prefix_for_each_colour_name; }
                std::vector<std::string>* prefix_for_each_colour_name_padding() const { return m_prefix_for_each_colour_name_padding; }
                std::string suffix_for_each_colour_name() const { return m_suffix_for_each_colour_name; }
                std::vector<std::string>* suffix_for_each_colour_name_padding() const { return m_suffix_for_each_colour_name_padding; }
                std::vector<named_colour_definition_t*>* named_colour_definitions() const { return m_named_colour_definitions; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t::named_color_2_tag_t* _parent() const { return m__parent; }
            };

            class viewing_conditions_tag_t : public kaitai::kstruct {

            public:

                viewing_conditions_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~viewing_conditions_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                viewing_conditions_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                viewing_conditions_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class blue_trc_tag_t : public kaitai::kstruct {

            public:

                blue_trc_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~blue_trc_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                kaitai::kstruct* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                kaitai::kstruct* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class response_curve_set_16_type_t : public kaitai::kstruct {

            public:

                response_curve_set_16_type_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t::output_response_tag_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~response_curve_set_16_type_t();

            private:
                std::string m_reserved;
                uint16_t m_number_of_channels;
                uint16_t m_count_of_measurement_types;
                std::vector<uint32_t>* m_response_curve_structure_offsets;
                std::string m_response_curve_structures;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t::output_response_tag_t* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                uint16_t number_of_channels() const { return m_number_of_channels; }
                uint16_t count_of_measurement_types() const { return m_count_of_measurement_types; }
                std::vector<uint32_t>* response_curve_structure_offsets() const { return m_response_curve_structure_offsets; }
                std::string response_curve_structures() const { return m_response_curve_structures; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t::output_response_tag_t* _parent() const { return m__parent; }
            };

            class curve_type_t : public kaitai::kstruct {

            public:

                curve_type_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~curve_type_t();

            private:
                std::string m_reserved;
                uint32_t m_number_of_entries;
                std::vector<uint32_t>* m_curve_values;
                bool n_curve_values;

            public:
                bool _is_null_curve_values() { curve_values(); return n_curve_values; };

            private:
                uint8_t m_curve_value;
                bool n_curve_value;

            public:
                bool _is_null_curve_value() { curve_value(); return n_curve_value; };

            private:
                icc_4_t* m__root;
                kaitai::kstruct* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                uint32_t number_of_entries() const { return m_number_of_entries; }
                std::vector<uint32_t>* curve_values() const { return m_curve_values; }
                uint8_t curve_value() const { return m_curve_value; }
                icc_4_t* _root() const { return m__root; }
                kaitai::kstruct* _parent() const { return m__parent; }
            };

            class saturation_rendering_intent_gamut_tag_t : public kaitai::kstruct {

            public:

                saturation_rendering_intent_gamut_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~saturation_rendering_intent_gamut_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                signature_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                signature_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class xyz_type_t : public kaitai::kstruct {

            public:

                xyz_type_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~xyz_type_t();

            private:
                std::string m_reserved;
                std::vector<xyz_number_t*>* m_values;
                icc_4_t* m__root;
                kaitai::kstruct* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                std::vector<xyz_number_t*>* values() const { return m_values; }
                icc_4_t* _root() const { return m__root; }
                kaitai::kstruct* _parent() const { return m__parent; }
            };

            class lut_8_type_t : public kaitai::kstruct {

            public:

                lut_8_type_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~lut_8_type_t();

            private:
                std::string m_reserved;
                uint8_t m_number_of_input_channels;
                uint8_t m_number_of_output_channels;
                uint8_t m_number_of_clut_grid_points;
                std::string m_padding;
                std::vector<int32_t>* m_encoded_e_parameters;
                uint32_t m_number_of_input_table_entries;
                uint32_t m_number_of_output_table_entries;
                std::string m_input_tables;
                std::string m_clut_values;
                std::string m_output_tables;
                icc_4_t* m__root;
                kaitai::kstruct* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                uint8_t number_of_input_channels() const { return m_number_of_input_channels; }
                uint8_t number_of_output_channels() const { return m_number_of_output_channels; }
                uint8_t number_of_clut_grid_points() const { return m_number_of_clut_grid_points; }
                std::string padding() const { return m_padding; }
                std::vector<int32_t>* encoded_e_parameters() const { return m_encoded_e_parameters; }
                uint32_t number_of_input_table_entries() const { return m_number_of_input_table_entries; }
                uint32_t number_of_output_table_entries() const { return m_number_of_output_table_entries; }
                std::string input_tables() const { return m_input_tables; }
                std::string clut_values() const { return m_clut_values; }
                std::string output_tables() const { return m_output_tables; }
                icc_4_t* _root() const { return m__root; }
                kaitai::kstruct* _parent() const { return m__parent; }
            };

            class b_to_a_2_tag_t : public kaitai::kstruct {

            public:

                b_to_a_2_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~b_to_a_2_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                kaitai::kstruct* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                kaitai::kstruct* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class lut_a_to_b_type_t : public kaitai::kstruct {

            public:

                lut_a_to_b_type_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~lut_a_to_b_type_t();

            private:
                std::string m_reserved;
                uint8_t m_number_of_input_channels;
                uint8_t m_number_of_output_channels;
                std::string m_padding;
                uint32_t m_offset_to_first_b_curve;
                uint32_t m_offset_to_matrix;
                uint32_t m_offset_to_first_m_curve;
                uint32_t m_offset_to_clut;
                uint32_t m_offset_to_first_a_curve;
                std::string m_data;
                icc_4_t* m__root;
                kaitai::kstruct* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                uint8_t number_of_input_channels() const { return m_number_of_input_channels; }
                uint8_t number_of_output_channels() const { return m_number_of_output_channels; }
                std::string padding() const { return m_padding; }
                uint32_t offset_to_first_b_curve() const { return m_offset_to_first_b_curve; }
                uint32_t offset_to_matrix() const { return m_offset_to_matrix; }
                uint32_t offset_to_first_m_curve() const { return m_offset_to_first_m_curve; }
                uint32_t offset_to_clut() const { return m_offset_to_clut; }
                uint32_t offset_to_first_a_curve() const { return m_offset_to_first_a_curve; }
                std::string data() const { return m_data; }
                icc_4_t* _root() const { return m__root; }
                kaitai::kstruct* _parent() const { return m__parent; }
            };

            class b_to_a_0_tag_t : public kaitai::kstruct {

            public:

                b_to_a_0_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~b_to_a_0_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                kaitai::kstruct* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                kaitai::kstruct* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class media_white_point_tag_t : public kaitai::kstruct {

            public:

                media_white_point_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~media_white_point_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                xyz_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                xyz_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class lut_16_type_t : public kaitai::kstruct {

            public:

                lut_16_type_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~lut_16_type_t();

            private:
                std::string m_reserved;
                uint8_t m_number_of_input_channels;
                uint8_t m_number_of_output_channels;
                uint8_t m_number_of_clut_grid_points;
                std::string m_padding;
                std::vector<int32_t>* m_encoded_e_parameters;
                uint32_t m_number_of_input_table_entries;
                uint32_t m_number_of_output_table_entries;
                std::string m_input_tables;
                std::string m_clut_values;
                std::string m_output_tables;
                icc_4_t* m__root;
                kaitai::kstruct* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                uint8_t number_of_input_channels() const { return m_number_of_input_channels; }
                uint8_t number_of_output_channels() const { return m_number_of_output_channels; }
                uint8_t number_of_clut_grid_points() const { return m_number_of_clut_grid_points; }
                std::string padding() const { return m_padding; }
                std::vector<int32_t>* encoded_e_parameters() const { return m_encoded_e_parameters; }
                uint32_t number_of_input_table_entries() const { return m_number_of_input_table_entries; }
                uint32_t number_of_output_table_entries() const { return m_number_of_output_table_entries; }
                std::string input_tables() const { return m_input_tables; }
                std::string clut_values() const { return m_clut_values; }
                std::string output_tables() const { return m_output_tables; }
                icc_4_t* _root() const { return m__root; }
                kaitai::kstruct* _parent() const { return m__parent; }
            };

            class perceptual_rendering_intent_gamut_tag_t : public kaitai::kstruct {

            public:

                perceptual_rendering_intent_gamut_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~perceptual_rendering_intent_gamut_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                signature_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                signature_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class u_16_fixed_16_array_type_t : public kaitai::kstruct {

            public:

                u_16_fixed_16_array_type_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~u_16_fixed_16_array_type_t();

            private:
                std::string m_reserved;
                std::vector<u_16_fixed_16_number_t*>* m_values;
                icc_4_t* m__root;
                kaitai::kstruct* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                std::vector<u_16_fixed_16_number_t*>* values() const { return m_values; }
                icc_4_t* _root() const { return m__root; }
                kaitai::kstruct* _parent() const { return m__parent; }
            };

            class colorant_table_out_tag_t : public kaitai::kstruct {

            public:

                colorant_table_out_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~colorant_table_out_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                colorant_table_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                colorant_table_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class measurement_tag_t : public kaitai::kstruct {

            public:

                measurement_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~measurement_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                measurement_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                measurement_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class profile_sequence_tag_t : public kaitai::kstruct {

            public:

                profile_sequence_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~profile_sequence_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                profile_sequence_desc_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                profile_sequence_desc_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class technology_tag_t : public kaitai::kstruct {

            public:

                technology_tag_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~technology_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                signature_type_t* m_tag_data;
                icc_4_t* m__root;
                kaitai::kstruct* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                signature_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                kaitai::kstruct* _parent() const { return m__parent; }
            };

            class a_to_b_0_tag_t : public kaitai::kstruct {

            public:

                a_to_b_0_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~a_to_b_0_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                kaitai::kstruct* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                kaitai::kstruct* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class d_to_b_0_tag_t : public kaitai::kstruct {

            public:

                d_to_b_0_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~d_to_b_0_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                multi_process_elements_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                multi_process_elements_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class output_response_tag_t : public kaitai::kstruct {

            public:

                output_response_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~output_response_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                response_curve_set_16_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                response_curve_set_16_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class green_matrix_column_tag_t : public kaitai::kstruct {

            public:

                green_matrix_column_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~green_matrix_column_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                xyz_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                xyz_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class profile_description_tag_t : public kaitai::kstruct {

            public:

                profile_description_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~profile_description_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                multi_localized_unicode_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                multi_localized_unicode_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class preview_1_tag_t : public kaitai::kstruct {

            public:

                preview_1_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~preview_1_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                kaitai::kstruct* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                kaitai::kstruct* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class red_trc_tag_t : public kaitai::kstruct {

            public:

                red_trc_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~red_trc_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                kaitai::kstruct* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                kaitai::kstruct* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class b_to_d_0_tag_t : public kaitai::kstruct {

            public:

                b_to_d_0_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~b_to_d_0_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                multi_process_elements_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                multi_process_elements_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class d_to_b_1_tag_t : public kaitai::kstruct {

            public:

                d_to_b_1_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~d_to_b_1_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                multi_process_elements_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                multi_process_elements_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class b_to_a_1_tag_t : public kaitai::kstruct {

            public:

                b_to_a_1_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~b_to_a_1_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                kaitai::kstruct* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                kaitai::kstruct* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class parametric_curve_type_t : public kaitai::kstruct {

            public:
                class params_iec_61966_3_t;
                class params_iec_61966_2_1_t;
                class params_y_equals_x_to_power_of_g_t;
                class params_y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c_t;
                class params_cie_122_1996_t;

                enum parametric_curve_type_functions_t {
                    PARAMETRIC_CURVE_TYPE_FUNCTIONS_Y_EQUALS_X_TO_POWER_OF_G = 0,
                    PARAMETRIC_CURVE_TYPE_FUNCTIONS_CIE_122_1996 = 1,
                    PARAMETRIC_CURVE_TYPE_FUNCTIONS_IEC_61966_3 = 2,
                    PARAMETRIC_CURVE_TYPE_FUNCTIONS_IEC_61966_2_1 = 3,
                    PARAMETRIC_CURVE_TYPE_FUNCTIONS_Y_EQUALS_OB_AX_PLUS_B_CB_TO_POWER_OF_G_PLUS_C = 4
                };

                parametric_curve_type_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~parametric_curve_type_t();

                class params_iec_61966_3_t : public kaitai::kstruct {

                public:

                    params_iec_61966_3_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* p_parent = 0, icc_4_t* p_root = 0);
                    void _read();
                    ~params_iec_61966_3_t();

                private:
                    int32_t m_g;
                    int32_t m_a;
                    int32_t m_b;
                    int32_t m_c;
                    icc_4_t* m__root;
                    icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* m__parent;

                public:
                    int32_t g() const { return m_g; }
                    int32_t a() const { return m_a; }
                    int32_t b() const { return m_b; }
                    int32_t c() const { return m_c; }
                    icc_4_t* _root() const { return m__root; }
                    icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* _parent() const { return m__parent; }
                };

                class params_iec_61966_2_1_t : public kaitai::kstruct {

                public:

                    params_iec_61966_2_1_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* p_parent = 0, icc_4_t* p_root = 0);
                    void _read();
                    ~params_iec_61966_2_1_t();

                private:
                    int32_t m_g;
                    int32_t m_a;
                    int32_t m_b;
                    int32_t m_c;
                    int32_t m_d;
                    icc_4_t* m__root;
                    icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* m__parent;

                public:
                    int32_t g() const { return m_g; }
                    int32_t a() const { return m_a; }
                    int32_t b() const { return m_b; }
                    int32_t c() const { return m_c; }
                    int32_t d() const { return m_d; }
                    icc_4_t* _root() const { return m__root; }
                    icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* _parent() const { return m__parent; }
                };

                class params_y_equals_x_to_power_of_g_t : public kaitai::kstruct {

                public:

                    params_y_equals_x_to_power_of_g_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* p_parent = 0, icc_4_t* p_root = 0);
                    void _read();
                    ~params_y_equals_x_to_power_of_g_t();

                private:
                    int32_t m_g;
                    icc_4_t* m__root;
                    icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* m__parent;

                public:
                    int32_t g() const { return m_g; }
                    icc_4_t* _root() const { return m__root; }
                    icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* _parent() const { return m__parent; }
                };

                class params_y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c_t : public kaitai::kstruct {

                public:

                    params_y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* p_parent = 0, icc_4_t* p_root = 0);
                    void _read();
                    ~params_y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c_t();

                private:
                    int32_t m_g;
                    int32_t m_a;
                    int32_t m_b;
                    int32_t m_c;
                    int32_t m_d;
                    int32_t m_e;
                    int32_t m_f;
                    icc_4_t* m__root;
                    icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* m__parent;

                public:
                    int32_t g() const { return m_g; }
                    int32_t a() const { return m_a; }
                    int32_t b() const { return m_b; }
                    int32_t c() const { return m_c; }
                    int32_t d() const { return m_d; }
                    int32_t e() const { return m_e; }
                    int32_t f() const { return m_f; }
                    icc_4_t* _root() const { return m__root; }
                    icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* _parent() const { return m__parent; }
                };

                class params_cie_122_1996_t : public kaitai::kstruct {

                public:

                    params_cie_122_1996_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* p_parent = 0, icc_4_t* p_root = 0);
                    void _read();
                    ~params_cie_122_1996_t();

                private:
                    int32_t m_g;
                    int32_t m_a;
                    int32_t m_b;
                    icc_4_t* m__root;
                    icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* m__parent;

                public:
                    int32_t g() const { return m_g; }
                    int32_t a() const { return m_a; }
                    int32_t b() const { return m_b; }
                    icc_4_t* _root() const { return m__root; }
                    icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* _parent() const { return m__parent; }
                };

            private:
                std::string m_reserved;
                parametric_curve_type_functions_t m_function_type;
                std::string m_reserved_2;
                kaitai::kstruct* m_parameters;
                icc_4_t* m__root;
                kaitai::kstruct* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                parametric_curve_type_functions_t function_type() const { return m_function_type; }
                std::string reserved_2() const { return m_reserved_2; }
                kaitai::kstruct* parameters() const { return m_parameters; }
                icc_4_t* _root() const { return m__root; }
                kaitai::kstruct* _parent() const { return m__parent; }
            };

            class chromaticity_tag_t : public kaitai::kstruct {

            public:

                chromaticity_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~chromaticity_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                chromaticity_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                chromaticity_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class chromatic_adaptation_tag_t : public kaitai::kstruct {

            public:

                chromatic_adaptation_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~chromatic_adaptation_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                s_15_fixed_16_array_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                s_15_fixed_16_array_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class measurement_type_t : public kaitai::kstruct {

            public:

                enum standard_observer_encodings_t {
                    STANDARD_OBSERVER_ENCODINGS_UNKNOWN = 0,
                    STANDARD_OBSERVER_ENCODINGS_CIE_1931_STANDARD_COLORIMETRIC_OBSERVER = 1,
                    STANDARD_OBSERVER_ENCODINGS_CIE_1964_STANDARD_COLORIMETRIC_OBSERVER = 2
                };

                enum measurement_geometry_encodings_t {
                    MEASUREMENT_GEOMETRY_ENCODINGS_UNKNOWN = 0,
                    MEASUREMENT_GEOMETRY_ENCODINGS_ZERO_DEGREES_TO_45_DEGREES_OR_45_DEGREES_TO_ZERO_DEGREES = 1,
                    MEASUREMENT_GEOMETRY_ENCODINGS_ZERO_DEGREES_TO_D_DEGREES_OR_D_DEGREES_TO_ZERO_DEGREES = 2
                };

                enum measurement_flare_encodings_t {
                    MEASUREMENT_FLARE_ENCODINGS_ZERO_PERCENT = 0,
                    MEASUREMENT_FLARE_ENCODINGS_ONE_HUNDRED_PERCENT = 65536
                };

                measurement_type_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t::measurement_tag_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~measurement_type_t();

            private:
                std::string m_reserved;
                standard_observer_encodings_t m_standard_observer_encoding;
                xyz_number_t* m_nciexyz_tristimulus_values_for_measurement_backing;
                measurement_geometry_encodings_t m_measurement_geometry_encoding;
                measurement_flare_encodings_t m_measurement_flare_encoding;
                standard_illuminant_encoding_t* m_standard_illuminant_encoding;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t::measurement_tag_t* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                standard_observer_encodings_t standard_observer_encoding() const { return m_standard_observer_encoding; }
                xyz_number_t* nciexyz_tristimulus_values_for_measurement_backing() const { return m_nciexyz_tristimulus_values_for_measurement_backing; }
                measurement_geometry_encodings_t measurement_geometry_encoding() const { return m_measurement_geometry_encoding; }
                measurement_flare_encodings_t measurement_flare_encoding() const { return m_measurement_flare_encoding; }
                standard_illuminant_encoding_t* standard_illuminant_encoding() const { return m_standard_illuminant_encoding; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t::measurement_tag_t* _parent() const { return m__parent; }
            };

            class text_type_t : public kaitai::kstruct {

            public:

                text_type_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t::char_target_tag_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~text_type_t();

            private:
                std::string m_reserved;
                std::string m_value;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t::char_target_tag_t* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                std::string value() const { return m_value; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t::char_target_tag_t* _parent() const { return m__parent; }
            };

            class profile_sequence_identifier_type_t : public kaitai::kstruct {

            public:
                class profile_identifier_t;

                profile_sequence_identifier_type_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_tag_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~profile_sequence_identifier_type_t();

                class profile_identifier_t : public kaitai::kstruct {

                public:

                    profile_identifier_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_type_t* p_parent = 0, icc_4_t* p_root = 0);
                    void _read();
                    ~profile_identifier_t();

                private:
                    std::string m_profile_id;
                    multi_localized_unicode_type_t* m_profile_description;
                    icc_4_t* m__root;
                    icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_type_t* m__parent;

                public:
                    std::string profile_id() const { return m_profile_id; }
                    multi_localized_unicode_type_t* profile_description() const { return m_profile_description; }
                    icc_4_t* _root() const { return m__root; }
                    icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_type_t* _parent() const { return m__parent; }
                };

            private:
                std::string m_reserved;
                uint32_t m_number_of_structures;
                std::vector<position_number_t*>* m_positions_table;
                std::vector<profile_identifier_t*>* m_profile_identifiers;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_tag_t* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                uint32_t number_of_structures() const { return m_number_of_structures; }
                std::vector<position_number_t*>* positions_table() const { return m_positions_table; }
                std::vector<profile_identifier_t*>* profile_identifiers() const { return m_profile_identifiers; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_tag_t* _parent() const { return m__parent; }
            };

            class colorant_table_type_t : public kaitai::kstruct {

            public:
                class colorant_t;

                colorant_table_type_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~colorant_table_type_t();

                class colorant_t : public kaitai::kstruct {

                public:

                    colorant_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t::colorant_table_type_t* p_parent = 0, icc_4_t* p_root = 0);
                    void _read();
                    ~colorant_t();

                private:
                    std::string m_name;
                    std::vector<std::string>* m_padding;
                    std::string m_pcs_values;
                    icc_4_t* m__root;
                    icc_4_t::tag_table_t::tag_definition_t::colorant_table_type_t* m__parent;

                public:
                    std::string name() const { return m_name; }
                    std::vector<std::string>* padding() const { return m_padding; }
                    std::string pcs_values() const { return m_pcs_values; }
                    icc_4_t* _root() const { return m__root; }
                    icc_4_t::tag_table_t::tag_definition_t::colorant_table_type_t* _parent() const { return m__parent; }
                };

            private:
                std::string m_reserved;
                uint32_t m_count_of_colorants;
                std::vector<colorant_t*>* m_colorants;
                icc_4_t* m__root;
                kaitai::kstruct* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                uint32_t count_of_colorants() const { return m_count_of_colorants; }
                std::vector<colorant_t*>* colorants() const { return m_colorants; }
                icc_4_t* _root() const { return m__root; }
                kaitai::kstruct* _parent() const { return m__parent; }
            };

            class signature_type_t : public kaitai::kstruct {

            public:

                signature_type_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~signature_type_t();

            private:
                std::string m_reserved;
                std::string m_signature;
                icc_4_t* m__root;
                kaitai::kstruct* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                std::string signature() const { return m_signature; }
                icc_4_t* _root() const { return m__root; }
                kaitai::kstruct* _parent() const { return m__parent; }
            };

            class copyright_tag_t : public kaitai::kstruct {

            public:

                copyright_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~copyright_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                multi_localized_unicode_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                multi_localized_unicode_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class preview_0_tag_t : public kaitai::kstruct {

            public:

                preview_0_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~preview_0_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                kaitai::kstruct* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                kaitai::kstruct* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class date_time_type_t : public kaitai::kstruct {

            public:

                date_time_type_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t::calibration_date_time_tag_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~date_time_type_t();

            private:
                std::string m_reserved;
                date_time_number_t* m_date_and_time;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t::calibration_date_time_tag_t* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                date_time_number_t* date_and_time() const { return m_date_and_time; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t::calibration_date_time_tag_t* _parent() const { return m__parent; }
            };

            class d_to_b_3_tag_t : public kaitai::kstruct {

            public:

                d_to_b_3_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~d_to_b_3_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                multi_process_elements_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                multi_process_elements_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class preview_2_tag_t : public kaitai::kstruct {

            public:

                preview_2_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~preview_2_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                kaitai::kstruct* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                kaitai::kstruct* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class device_model_desc_tag_t : public kaitai::kstruct {

            public:

                device_model_desc_tag_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~device_model_desc_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                multi_localized_unicode_type_t* m_tag_data;
                icc_4_t* m__root;
                kaitai::kstruct* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                multi_localized_unicode_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                kaitai::kstruct* _parent() const { return m__parent; }
            };

            class multi_process_elements_type_t : public kaitai::kstruct {

            public:

                multi_process_elements_type_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~multi_process_elements_type_t();

            private:
                std::string m_reserved;
                uint16_t m_number_of_input_channels;
                uint16_t m_number_of_output_channels;
                uint32_t m_number_of_processing_elements;
                std::vector<position_number_t*>* m_process_element_positions_table;
                std::string m_data;
                icc_4_t* m__root;
                kaitai::kstruct* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                uint16_t number_of_input_channels() const { return m_number_of_input_channels; }
                uint16_t number_of_output_channels() const { return m_number_of_output_channels; }
                uint32_t number_of_processing_elements() const { return m_number_of_processing_elements; }
                std::vector<position_number_t*>* process_element_positions_table() const { return m_process_element_positions_table; }
                std::string data() const { return m_data; }
                icc_4_t* _root() const { return m__root; }
                kaitai::kstruct* _parent() const { return m__parent; }
            };

            class u_int_16_array_type_t : public kaitai::kstruct {

            public:

                u_int_16_array_type_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~u_int_16_array_type_t();

            private:
                std::string m_reserved;
                std::vector<uint16_t>* m_values;
                icc_4_t* m__root;
                kaitai::kstruct* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                std::vector<uint16_t>* values() const { return m_values; }
                icc_4_t* _root() const { return m__root; }
                kaitai::kstruct* _parent() const { return m__parent; }
            };

            class colorant_order_tag_t : public kaitai::kstruct {

            public:

                colorant_order_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~colorant_order_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                colorant_order_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                colorant_order_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class data_type_t : public kaitai::kstruct {

            public:

                enum data_types_t {
                    DATA_TYPES_ASCII_DATA = 0,
                    DATA_TYPES_BINARY_DATA = 1
                };

                data_type_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~data_type_t();

            private:
                data_types_t m_data_flag;
                icc_4_t* m__root;
                kaitai::kstruct* m__parent;

            public:
                data_types_t data_flag() const { return m_data_flag; }
                icc_4_t* _root() const { return m__root; }
                kaitai::kstruct* _parent() const { return m__parent; }
            };

            class chromaticity_type_t : public kaitai::kstruct {

            public:
                class ciexy_coordinate_values_t;

                enum colorant_and_phosphor_encodings_t {
                    COLORANT_AND_PHOSPHOR_ENCODINGS_UNKNOWN = 0,
                    COLORANT_AND_PHOSPHOR_ENCODINGS_ITU_R_BT_709_2 = 1,
                    COLORANT_AND_PHOSPHOR_ENCODINGS_SMPTE_RP145 = 2,
                    COLORANT_AND_PHOSPHOR_ENCODINGS_EBU_TECH_3213_E = 3,
                    COLORANT_AND_PHOSPHOR_ENCODINGS_P22 = 4
                };

                chromaticity_type_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t::chromaticity_tag_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~chromaticity_type_t();

                class ciexy_coordinate_values_t : public kaitai::kstruct {

                public:

                    ciexy_coordinate_values_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t* p_parent = 0, icc_4_t* p_root = 0);
                    void _read();
                    ~ciexy_coordinate_values_t();

                private:
                    uint16_t m_x_coordinate;
                    uint16_t m_y_coordinate;
                    icc_4_t* m__root;
                    icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t* m__parent;

                public:
                    uint16_t x_coordinate() const { return m_x_coordinate; }
                    uint16_t y_coordinate() const { return m_y_coordinate; }
                    icc_4_t* _root() const { return m__root; }
                    icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t* _parent() const { return m__parent; }
                };

            private:
                std::string m_reserved;
                uint16_t m_number_of_device_channels;
                colorant_and_phosphor_encodings_t m_colorant_and_phosphor_encoding;
                std::vector<ciexy_coordinate_values_t*>* m_ciexy_coordinates_per_channel;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t::chromaticity_tag_t* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                uint16_t number_of_device_channels() const { return m_number_of_device_channels; }
                colorant_and_phosphor_encodings_t colorant_and_phosphor_encoding() const { return m_colorant_and_phosphor_encoding; }
                std::vector<ciexy_coordinate_values_t*>* ciexy_coordinates_per_channel() const { return m_ciexy_coordinates_per_channel; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t::chromaticity_tag_t* _parent() const { return m__parent; }
            };

            class luminance_tag_t : public kaitai::kstruct {

            public:

                luminance_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~luminance_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                xyz_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                xyz_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class s_15_fixed_16_array_type_t : public kaitai::kstruct {

            public:

                s_15_fixed_16_array_type_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t::chromatic_adaptation_tag_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~s_15_fixed_16_array_type_t();

            private:
                std::string m_reserved;
                std::vector<s_15_fixed_16_number_t*>* m_values;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t::chromatic_adaptation_tag_t* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                std::vector<s_15_fixed_16_number_t*>* values() const { return m_values; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t::chromatic_adaptation_tag_t* _parent() const { return m__parent; }
            };

            class multi_localized_unicode_type_t : public kaitai::kstruct {

            public:
                class record_t;

                multi_localized_unicode_type_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~multi_localized_unicode_type_t();

                class record_t : public kaitai::kstruct {

                public:

                    record_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t::multi_localized_unicode_type_t* p_parent = 0, icc_4_t* p_root = 0);
                    void _read();
                    ~record_t();

                private:
                    bool f_string_data;
                    std::string m_string_data;

                public:
                    std::string string_data();

                private:
                    uint16_t m_language_code;
                    uint16_t m_country_code;
                    uint32_t m_string_length;
                    uint32_t m_string_offset;
                    icc_4_t* m__root;
                    icc_4_t::tag_table_t::tag_definition_t::multi_localized_unicode_type_t* m__parent;

                public:
                    uint16_t language_code() const { return m_language_code; }
                    uint16_t country_code() const { return m_country_code; }
                    uint32_t string_length() const { return m_string_length; }
                    uint32_t string_offset() const { return m_string_offset; }
                    icc_4_t* _root() const { return m__root; }
                    icc_4_t::tag_table_t::tag_definition_t::multi_localized_unicode_type_t* _parent() const { return m__parent; }
                };

            private:
                std::string m_reserved;
                uint32_t m_number_of_records;
                uint32_t m_record_size;
                std::vector<record_t*>* m_records;
                icc_4_t* m__root;
                kaitai::kstruct* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                uint32_t number_of_records() const { return m_number_of_records; }
                uint32_t record_size() const { return m_record_size; }
                std::vector<record_t*>* records() const { return m_records; }
                icc_4_t* _root() const { return m__root; }
                kaitai::kstruct* _parent() const { return m__parent; }
            };

            class a_to_b_2_tag_t : public kaitai::kstruct {

            public:

                a_to_b_2_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~a_to_b_2_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                kaitai::kstruct* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                kaitai::kstruct* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class a_to_b_1_tag_t : public kaitai::kstruct {

            public:

                a_to_b_1_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~a_to_b_1_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                kaitai::kstruct* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                kaitai::kstruct* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class colorimetric_intent_image_state_tag_t : public kaitai::kstruct {

            public:

                colorimetric_intent_image_state_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~colorimetric_intent_image_state_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                signature_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                signature_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class char_target_tag_t : public kaitai::kstruct {

            public:

                char_target_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~char_target_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                text_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                text_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class colorant_table_tag_t : public kaitai::kstruct {

            public:

                colorant_table_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~colorant_table_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                colorant_table_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                colorant_table_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class calibration_date_time_tag_t : public kaitai::kstruct {

            public:

                calibration_date_time_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~calibration_date_time_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                date_time_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                date_time_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class named_color_2_tag_t : public kaitai::kstruct {

            public:

                named_color_2_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~named_color_2_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                named_color_2_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                named_color_2_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class viewing_cond_desc_tag_t : public kaitai::kstruct {

            public:

                viewing_cond_desc_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~viewing_cond_desc_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                multi_localized_unicode_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                multi_localized_unicode_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class b_to_d_3_tag_t : public kaitai::kstruct {

            public:

                b_to_d_3_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~b_to_d_3_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                multi_process_elements_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                multi_process_elements_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class profile_sequence_desc_type_t : public kaitai::kstruct {

            public:
                class profile_description_t;

                profile_sequence_desc_type_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t::profile_sequence_tag_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~profile_sequence_desc_type_t();

                class profile_description_t : public kaitai::kstruct {

                public:

                    profile_description_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t::profile_sequence_desc_type_t* p_parent = 0, icc_4_t* p_root = 0);
                    void _read();
                    ~profile_description_t();

                private:
                    device_manufacturer_t* m_device_manufacturer;
                    std::string m_device_model;
                    device_attributes_t* m_device_attributes;
                    technology_tag_t* m_device_technology;
                    device_mfg_desc_tag_t* m_description_of_device_manufacturer;
                    device_model_desc_tag_t* m_description_of_device_model;
                    icc_4_t* m__root;
                    icc_4_t::tag_table_t::tag_definition_t::profile_sequence_desc_type_t* m__parent;

                public:
                    device_manufacturer_t* device_manufacturer() const { return m_device_manufacturer; }
                    std::string device_model() const { return m_device_model; }
                    device_attributes_t* device_attributes() const { return m_device_attributes; }
                    technology_tag_t* device_technology() const { return m_device_technology; }
                    device_mfg_desc_tag_t* description_of_device_manufacturer() const { return m_description_of_device_manufacturer; }
                    device_model_desc_tag_t* description_of_device_model() const { return m_description_of_device_model; }
                    icc_4_t* _root() const { return m__root; }
                    icc_4_t::tag_table_t::tag_definition_t::profile_sequence_desc_type_t* _parent() const { return m__parent; }
                };

            private:
                std::string m_reserved;
                uint32_t m_number_of_description_structures;
                std::vector<profile_description_t*>* m_profile_descriptions;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t::profile_sequence_tag_t* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                uint32_t number_of_description_structures() const { return m_number_of_description_structures; }
                std::vector<profile_description_t*>* profile_descriptions() const { return m_profile_descriptions; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t::profile_sequence_tag_t* _parent() const { return m__parent; }
            };

            class profile_sequence_identifier_tag_t : public kaitai::kstruct {

            public:

                profile_sequence_identifier_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~profile_sequence_identifier_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                profile_sequence_identifier_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                profile_sequence_identifier_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class b_to_d_1_tag_t : public kaitai::kstruct {

            public:

                b_to_d_1_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~b_to_d_1_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                multi_process_elements_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                multi_process_elements_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class colorant_order_type_t : public kaitai::kstruct {

            public:

                colorant_order_type_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t::colorant_order_tag_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~colorant_order_type_t();

            private:
                std::string m_reserved;
                uint32_t m_count_of_colorants;
                std::vector<uint8_t>* m_numbers_of_colorants_in_order_of_printing;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t::colorant_order_tag_t* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                uint32_t count_of_colorants() const { return m_count_of_colorants; }
                std::vector<uint8_t>* numbers_of_colorants_in_order_of_printing() const { return m_numbers_of_colorants_in_order_of_printing; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t::colorant_order_tag_t* _parent() const { return m__parent; }
            };

            class d_to_b_2_tag_t : public kaitai::kstruct {

            public:

                d_to_b_2_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~d_to_b_2_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                multi_process_elements_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                multi_process_elements_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class gray_trc_tag_t : public kaitai::kstruct {

            public:

                gray_trc_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~gray_trc_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                kaitai::kstruct* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                kaitai::kstruct* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class viewing_conditions_type_t : public kaitai::kstruct {

            public:

                viewing_conditions_type_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t::viewing_conditions_tag_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~viewing_conditions_type_t();

            private:
                std::string m_reserved;
                xyz_number_t* m_un_normalized_ciexyz_values_for_illuminant;
                xyz_number_t* m_un_normalized_ciexyz_values_for_surround;
                standard_illuminant_encoding_t* m_illuminant_type;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t::viewing_conditions_tag_t* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                xyz_number_t* un_normalized_ciexyz_values_for_illuminant() const { return m_un_normalized_ciexyz_values_for_illuminant; }
                xyz_number_t* un_normalized_ciexyz_values_for_surround() const { return m_un_normalized_ciexyz_values_for_surround; }
                standard_illuminant_encoding_t* illuminant_type() const { return m_illuminant_type; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t::viewing_conditions_tag_t* _parent() const { return m__parent; }
            };

            class lut_b_to_a_type_t : public kaitai::kstruct {

            public:

                lut_b_to_a_type_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~lut_b_to_a_type_t();

            private:
                std::string m_reserved;
                uint8_t m_number_of_input_channels;
                uint8_t m_number_of_output_channels;
                std::string m_padding;
                uint32_t m_offset_to_first_b_curve;
                uint32_t m_offset_to_matrix;
                uint32_t m_offset_to_first_m_curve;
                uint32_t m_offset_to_clut;
                uint32_t m_offset_to_first_a_curve;
                std::string m_data;
                icc_4_t* m__root;
                kaitai::kstruct* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                uint8_t number_of_input_channels() const { return m_number_of_input_channels; }
                uint8_t number_of_output_channels() const { return m_number_of_output_channels; }
                std::string padding() const { return m_padding; }
                uint32_t offset_to_first_b_curve() const { return m_offset_to_first_b_curve; }
                uint32_t offset_to_matrix() const { return m_offset_to_matrix; }
                uint32_t offset_to_first_m_curve() const { return m_offset_to_first_m_curve; }
                uint32_t offset_to_clut() const { return m_offset_to_clut; }
                uint32_t offset_to_first_a_curve() const { return m_offset_to_first_a_curve; }
                std::string data() const { return m_data; }
                icc_4_t* _root() const { return m__root; }
                kaitai::kstruct* _parent() const { return m__parent; }
            };

            class green_trc_tag_t : public kaitai::kstruct {

            public:

                green_trc_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~green_trc_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                kaitai::kstruct* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                kaitai::kstruct* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class u_int_32_array_type_t : public kaitai::kstruct {

            public:

                u_int_32_array_type_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~u_int_32_array_type_t();

            private:
                std::string m_reserved;
                std::vector<uint32_t>* m_values;
                icc_4_t* m__root;
                kaitai::kstruct* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                std::vector<uint32_t>* values() const { return m_values; }
                icc_4_t* _root() const { return m__root; }
                kaitai::kstruct* _parent() const { return m__parent; }
            };

            class gamut_tag_t : public kaitai::kstruct {

            public:

                gamut_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~gamut_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                kaitai::kstruct* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                kaitai::kstruct* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class u_int_8_array_type_t : public kaitai::kstruct {

            public:

                u_int_8_array_type_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~u_int_8_array_type_t();

            private:
                std::string m_reserved;
                std::vector<uint8_t>* m_values;
                icc_4_t* m__root;
                kaitai::kstruct* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                std::vector<uint8_t>* values() const { return m_values; }
                icc_4_t* _root() const { return m__root; }
                kaitai::kstruct* _parent() const { return m__parent; }
            };

            class red_matrix_column_tag_t : public kaitai::kstruct {

            public:

                red_matrix_column_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~red_matrix_column_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                xyz_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                xyz_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

            class u_int_64_array_type_t : public kaitai::kstruct {

            public:

                u_int_64_array_type_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~u_int_64_array_type_t();

            private:
                std::string m_reserved;
                std::vector<uint64_t>* m_values;
                icc_4_t* m__root;
                kaitai::kstruct* m__parent;

            public:
                std::string reserved() const { return m_reserved; }
                std::vector<uint64_t>* values() const { return m_values; }
                icc_4_t* _root() const { return m__root; }
                kaitai::kstruct* _parent() const { return m__parent; }
            };

            class b_to_d_2_tag_t : public kaitai::kstruct {

            public:

                b_to_d_2_tag_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t* p_parent = 0, icc_4_t* p_root = 0);
                void _read();
                ~b_to_d_2_tag_t();

            private:
                tag_type_signatures_t m_tag_type;
                multi_process_elements_type_t* m_tag_data;
                icc_4_t* m__root;
                icc_4_t::tag_table_t::tag_definition_t* m__parent;

            public:
                tag_type_signatures_t tag_type() const { return m_tag_type; }
                multi_process_elements_type_t* tag_data() const { return m_tag_data; }
                icc_4_t* _root() const { return m__root; }
                icc_4_t::tag_table_t::tag_definition_t* _parent() const { return m__parent; }
            };

        private:
            bool f_tag_data_element;
            kaitai::kstruct* m_tag_data_element;

        public:
            kaitai::kstruct* tag_data_element();

        private:
            tag_signatures_t m_tag_signature;
            uint32_t m_offset_to_data_element;
            uint32_t m_size_of_data_element;
            icc_4_t* m__root;
            icc_4_t::tag_table_t* m__parent;
            std::string m__raw_tag_data_element;
            kaitai::kstream* m__io__raw_tag_data_element;

        public:
            tag_signatures_t tag_signature() const { return m_tag_signature; }
            uint32_t offset_to_data_element() const { return m_offset_to_data_element; }
            uint32_t size_of_data_element() const { return m_size_of_data_element; }
            icc_4_t* _root() const { return m__root; }
            icc_4_t::tag_table_t* _parent() const { return m__parent; }
            std::string _raw_tag_data_element() const { return m__raw_tag_data_element; }
            kaitai::kstream* _io__raw_tag_data_element() const { return m__io__raw_tag_data_element; }
        };

    private:
        uint32_t m_tag_count;
        std::vector<tag_definition_t*>* m_tags;
        icc_4_t* m__root;
        icc_4_t* m__parent;

    public:
        uint32_t tag_count() const { return m_tag_count; }
        std::vector<tag_definition_t*>* tags() const { return m_tags; }
        icc_4_t* _root() const { return m__root; }
        icc_4_t* _parent() const { return m__parent; }
    };

    class device_attributes_t : public kaitai::kstruct {

    public:

        enum device_attributes_reflective_or_transparency_t {
            DEVICE_ATTRIBUTES_REFLECTIVE_OR_TRANSPARENCY_REFLECTIVE = 0,
            DEVICE_ATTRIBUTES_REFLECTIVE_OR_TRANSPARENCY_TRANSPARENCY = 1
        };

        enum device_attributes_glossy_or_matte_t {
            DEVICE_ATTRIBUTES_GLOSSY_OR_MATTE_GLOSSY = 0,
            DEVICE_ATTRIBUTES_GLOSSY_OR_MATTE_MATTE = 1
        };

        enum device_attributes_positive_or_negative_media_polarity_t {
            DEVICE_ATTRIBUTES_POSITIVE_OR_NEGATIVE_MEDIA_POLARITY_POSITIVE_MEDIA_POLARITY = 0,
            DEVICE_ATTRIBUTES_POSITIVE_OR_NEGATIVE_MEDIA_POLARITY_NEGATIVE_MEDIA_POLARITY = 1
        };

        enum device_attributes_colour_or_black_and_white_media_t {
            DEVICE_ATTRIBUTES_COLOUR_OR_BLACK_AND_WHITE_MEDIA_COLOUR_MEDIA = 0,
            DEVICE_ATTRIBUTES_COLOUR_OR_BLACK_AND_WHITE_MEDIA_BLACK_AND_WHITE_MEDIA = 1
        };

        device_attributes_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
        void _read();
        ~device_attributes_t();

    private:
        device_attributes_reflective_or_transparency_t m_reflective_or_transparency;
        device_attributes_glossy_or_matte_t m_glossy_or_matte;
        device_attributes_positive_or_negative_media_polarity_t m_positive_or_negative_media_polarity;
        device_attributes_colour_or_black_and_white_media_t m_colour_or_black_and_white_media;
        uint64_t m_reserved;
        uint64_t m_vendor_specific;
        icc_4_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        device_attributes_reflective_or_transparency_t reflective_or_transparency() const { return m_reflective_or_transparency; }
        device_attributes_glossy_or_matte_t glossy_or_matte() const { return m_glossy_or_matte; }
        device_attributes_positive_or_negative_media_polarity_t positive_or_negative_media_polarity() const { return m_positive_or_negative_media_polarity; }
        device_attributes_colour_or_black_and_white_media_t colour_or_black_and_white_media() const { return m_colour_or_black_and_white_media; }
        uint64_t reserved() const { return m_reserved; }
        uint64_t vendor_specific() const { return m_vendor_specific; }
        icc_4_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class device_manufacturer_t : public kaitai::kstruct {

    public:

        enum device_manufacturers_t {
            DEVICE_MANUFACTURERS_ERDT_SYSTEMS_GMBH_AND_CO_KG = 878981744,
            DEVICE_MANUFACTURERS_AAMAZING_TECHNOLOGIES_INC = 1094798657,
            DEVICE_MANUFACTURERS_ACER_PERIPHERALS = 1094927698,
            DEVICE_MANUFACTURERS_ACOLYTE_COLOR_RESEARCH = 1094929492,
            DEVICE_MANUFACTURERS_ACTIX_SYTEMS_INC = 1094931529,
            DEVICE_MANUFACTURERS_ADARA_TECHNOLOGY_INC = 1094992210,
            DEVICE_MANUFACTURERS_ADOBE_SYSTEMS_INCORPORATED = 1094992453,
            DEVICE_MANUFACTURERS_ADI_SYSTEMS_INC = 1094994208,
            DEVICE_MANUFACTURERS_AGFA_GRAPHICS_NV = 1095190081,
            DEVICE_MANUFACTURERS_ALPS_ELECTRIC_USA_INC = 1095519556,
            DEVICE_MANUFACTURERS_ALPS_ELECTRIC_USA_INC_2 = 1095520339,
            DEVICE_MANUFACTURERS_ALWAN_COLOR_EXPERTISE = 1095522126,
            DEVICE_MANUFACTURERS_AMIABLE_TECHNOLOGIES_INC = 1095586889,
            DEVICE_MANUFACTURERS_AOC_INTERNATIONAL_USA_LTD = 1095713568,
            DEVICE_MANUFACTURERS_APAGO = 1095778631,
            DEVICE_MANUFACTURERS_APPLE_COMPUTER_INC = 1095782476,
            DEVICE_MANUFACTURERS_AST = 1095980064,
            DEVICE_MANUFACTURERS_ATANDT_COMPUTER_SYSTEMS = 1096033876,
            DEVICE_MANUFACTURERS_BARBIERI_ELECTRONIC = 1111573836,
            DEVICE_MANUFACTURERS_BARCO_NV = 1112687439,
            DEVICE_MANUFACTURERS_BREAKPOINT_PTY_LIMITED = 1112689488,
            DEVICE_MANUFACTURERS_BROTHER_INDUSTRIES_LTD = 1112690516,
            DEVICE_MANUFACTURERS_BULL = 1112886348,
            DEVICE_MANUFACTURERS_BUS_COMPUTER_SYSTEMS = 1112888096,
            DEVICE_MANUFACTURERS_C_ITOH = 1127041364,
            DEVICE_MANUFACTURERS_INTEL_CORPORATION = 1128353106,
            DEVICE_MANUFACTURERS_CANON_INC_CANON_DEVELOPMENT_AMERICAS_INC = 1128353359,
            DEVICE_MANUFACTURERS_CARROLL_TOUCH = 1128354386,
            DEVICE_MANUFACTURERS_CASIO_COMPUTER_CO_LTD = 1128354633,
            DEVICE_MANUFACTURERS_COLORBUS_PL = 1128420691,
            DEVICE_MANUFACTURERS_CROSSFIELD = 1128614944,
            DEVICE_MANUFACTURERS_CROSSFIELD_2 = 1128615032,
            DEVICE_MANUFACTURERS_CGS_PUBLISHING_TECHNOLOGIES_INTERNATIONAL_GMBH = 1128747808,
            DEVICE_MANUFACTURERS_ROCHESTER_ROBOTICS = 1128811808,
            DEVICE_MANUFACTURERS_COLOUR_IMAGING_GROUP_LONDON = 1128875852,
            DEVICE_MANUFACTURERS_CITIZEN = 1128879177,
            DEVICE_MANUFACTURERS_CANDELA_LTD = 1129066544,
            DEVICE_MANUFACTURERS_COLOR_IQ = 1129072977,
            DEVICE_MANUFACTURERS_CHROMACO_INC = 1129136975,
            DEVICE_MANUFACTURERS_CHROMIX = 1129146712,
            DEVICE_MANUFACTURERS_COLORGRAPHIC_COMMUNICATIONS_CORPORATION = 1129270351,
            DEVICE_MANUFACTURERS_COMPAQ_COMPUTER_CORPORATION = 1129270608,
            DEVICE_MANUFACTURERS_COMPEQ_USA_FOCUS_TECHNOLOGY = 1129270640,
            DEVICE_MANUFACTURERS_CONRAC_DISPLAY_PRODUCTS = 1129270866,
            DEVICE_MANUFACTURERS_CORDATA_TECHNOLOGIES_INC = 1129271876,
            DEVICE_MANUFACTURERS_COMPAQ_COMPUTER_CORPORATION_2 = 1129337120,
            DEVICE_MANUFACTURERS_COLORPRO = 1129337423,
            DEVICE_MANUFACTURERS_CORNERSTONE = 1129467424,
            DEVICE_MANUFACTURERS_CTX_INTERNATIONAL_INC = 1129601056,
            DEVICE_MANUFACTURERS_COLORVISION = 1129728339,
            DEVICE_MANUFACTURERS_FUJITSU_LABORATORIES_LTD = 1129792288,
            DEVICE_MANUFACTURERS_DARIUS_TECHNOLOGY_LTD = 1145131593,
            DEVICE_MANUFACTURERS_DATAPRODUCTS = 1145132097,
            DEVICE_MANUFACTURERS_DRY_CREEK_PHOTO = 1145262112,
            DEVICE_MANUFACTURERS_DIGITAL_CONTENTS_RESOURCE_CENTER_CHUNG_ANG_UNIVERSITY = 1145262659,
            DEVICE_MANUFACTURERS_DELL_COMPUTER_CORPORATION = 1145392204,
            DEVICE_MANUFACTURERS_DAINIPPON_INK_AND_CHEMICALS = 1145652000,
            DEVICE_MANUFACTURERS_DICONIX = 1145652047,
            DEVICE_MANUFACTURERS_DIGITAL = 1145653065,
            DEVICE_MANUFACTURERS_DIGITAL_LIGHT_AND_COLOR = 1145841219,
            DEVICE_MANUFACTURERS_DOPPELGANGER_LLC = 1146113095,
            DEVICE_MANUFACTURERS_DAINIPPON_SCREEN = 1146298400,
            DEVICE_MANUFACTURERS_DOOSOL = 1146310476,
            DEVICE_MANUFACTURERS_DUPONT = 1146441806,
            DEVICE_MANUFACTURERS_EPSON = 1162892111,
            DEVICE_MANUFACTURERS_ESKO_GRAPHICS = 1163086671,
            DEVICE_MANUFACTURERS_ELECTRONICS_AND_TELECOMMUNICATIONS_RESEARCH_INSTITUTE = 1163153993,
            DEVICE_MANUFACTURERS_EVEREX_SYSTEMS_INC = 1163281746,
            DEVICE_MANUFACTURERS_EXACTCODE_GMBH = 1163411779,
            DEVICE_MANUFACTURERS_EIZO_NANAO_CORPORATION = 1164540527,
            DEVICE_MANUFACTURERS_FALCO_DATA_PRODUCTS_INC = 1178684483,
            DEVICE_MANUFACTURERS_FUJI_PHOTO_FILM_COLTD = 1179000864,
            DEVICE_MANUFACTURERS_FUJIFILM_ELECTRONIC_IMAGING_LTD = 1179010377,
            DEVICE_MANUFACTURERS_FNORD_SOFTWARE = 1179537988,
            DEVICE_MANUFACTURERS_FORA_INC = 1179603521,
            DEVICE_MANUFACTURERS_FOREFRONT_TECHNOLOGY_CORPORATION = 1179603525,
            DEVICE_MANUFACTURERS_FUJITSU = 1179658794,
            DEVICE_MANUFACTURERS_WAYTECH_DEVELOPMENT_INC = 1179664672,
            DEVICE_MANUFACTURERS_FUJITSU_2 = 1179994697,
            DEVICE_MANUFACTURERS_FUJI_XEROX_CO_LTD = 1180180512,
            DEVICE_MANUFACTURERS_GCC_TECHNOLOGIES_INC = 1195590432,
            DEVICE_MANUFACTURERS_GLOBAL_GRAPHICS_SOFTWARE_LIMITED = 1195856716,
            DEVICE_MANUFACTURERS_GRETAGMACBETH = 1196245536,
            DEVICE_MANUFACTURERS_GMG_GMBH_AND_CO_KG = 1196246816,
            DEVICE_MANUFACTURERS_GOLDSTAR_TECHNOLOGY_INC = 1196379204,
            DEVICE_MANUFACTURERS_GIANTPRINT_PTY_LTD = 1196446292,
            DEVICE_MANUFACTURERS_GRETAGMACBETH_2 = 1196707138,
            DEVICE_MANUFACTURERS_WAYTECH_DEVELOPMENT_INC_2 = 1196835616,
            DEVICE_MANUFACTURERS_SONY_CORPORATION = 1196896843,
            DEVICE_MANUFACTURERS_HCI = 1212369184,
            DEVICE_MANUFACTURERS_HEIDELBERGER_DRUCKMASCHINEN_AG = 1212435744,
            DEVICE_MANUFACTURERS_HERMES = 1212502605,
            DEVICE_MANUFACTURERS_HITACHI_AMERICA_LTD = 1212765249,
            DEVICE_MANUFACTURERS_HEWLETT_PACKARD = 1213210656,
            DEVICE_MANUFACTURERS_HITACHI_LTD = 1213481760,
            DEVICE_MANUFACTURERS_HITI_DIGITAL_INC = 1214862441,
            DEVICE_MANUFACTURERS_IBM_CORPORATION = 1229081888,
            DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD = 1229213268,
            DEVICE_MANUFACTURERS_HEWLETT_PACKARD_2 = 1229275936,
            DEVICE_MANUFACTURERS_IIYAMA_NORTH_AMERICA_INC = 1229543745,
            DEVICE_MANUFACTURERS_IKEGAMI_ELECTRONICS_INC = 1229669703,
            DEVICE_MANUFACTURERS_IMAGE_SYSTEMS_CORPORATION = 1229799751,
            DEVICE_MANUFACTURERS_INGRAM_MICRO_INC = 1229801760,
            DEVICE_MANUFACTURERS_INTEL_CORPORATION_2 = 1229870147,
            DEVICE_MANUFACTURERS_INTL = 1229870156,
            DEVICE_MANUFACTURERS_INTRA_ELECTRONICS_USA_INC = 1229870162,
            DEVICE_MANUFACTURERS_IOCOMM_INTERNATIONAL_TECHNOLOGY_CORPORATION = 1229931343,
            DEVICE_MANUFACTURERS_INFOPRINT_SOLUTIONS_COMPANY = 1230000928,
            DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_3 = 1230129491,
            DEVICE_MANUFACTURERS_ICHIKAWA_SOFT_LABORATORY = 1230195744,
            DEVICE_MANUFACTURERS_ITNL = 1230261836,
            DEVICE_MANUFACTURERS_IVM = 1230392608,
            DEVICE_MANUFACTURERS_IWATSU_ELECTRIC_CO_LTD = 1230455124,
            DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_2 = 1231318644,
            DEVICE_MANUFACTURERS_INCA_DIGITAL_PRINTERS_LTD = 1231971169,
            DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_4 = 1232234867,
            DEVICE_MANUFACTURERS_JETSOFT_DEVELOPMENT = 1246971476,
            DEVICE_MANUFACTURERS_JVC_INFORMATION_PRODUCTS_CO = 1247167264,
            DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_6 = 1262572116,
            DEVICE_MANUFACTURERS_KFC_COMPUTEK_COMPONENTS_CORPORATION = 1262895904,
            DEVICE_MANUFACTURERS_KLH_COMPUTERS = 1263290400,
            DEVICE_MANUFACTURERS_KONICA_MINOLTA_HOLDINGS_INC = 1263355972,
            DEVICE_MANUFACTURERS_KONICA_CORPORATION = 1263420225,
            DEVICE_MANUFACTURERS_KODAK = 1263486017,
            DEVICE_MANUFACTURERS_KYOCERA = 1264144195,
            DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_7 = 1264677492,
            DEVICE_MANUFACTURERS_LEICA_CAMERA_AG = 1279476039,
            DEVICE_MANUFACTURERS_LEEDS_COLOUR = 1279476548,
            DEVICE_MANUFACTURERS_LEFT_DAKOTA = 1279541579,
            DEVICE_MANUFACTURERS_LEADING_TECHNOLOGY_INC = 1279607108,
            DEVICE_MANUFACTURERS_LEXMARK_INTERNATIONAL_INC = 1279613005,
            DEVICE_MANUFACTURERS_LINK_COMPUTER_INC = 1279872587,
            DEVICE_MANUFACTURERS_LINOTRONIC = 1279872591,
            DEVICE_MANUFACTURERS_LITE_ON_INC = 1279874117,
            DEVICE_MANUFACTURERS_MAG_COMPUTRONIC_USA_INC = 1296123715,
            DEVICE_MANUFACTURERS_MAG_INNOVISION_INC = 1296123721,
            DEVICE_MANUFACTURERS_MANNESMANN = 1296125518,
            DEVICE_MANUFACTURERS_MICRON_TECHNOLOGY_INC = 1296646990,
            DEVICE_MANUFACTURERS_MICROTEK = 1296646994,
            DEVICE_MANUFACTURERS_MICROVITEC_INC = 1296646998,
            DEVICE_MANUFACTURERS_MINOLTA = 1296649807,
            DEVICE_MANUFACTURERS_MITSUBISHI_ELECTRONICS_AMERICA_INC = 1296651347,
            DEVICE_MANUFACTURERS_MITSUBA_CORPORATION = 1296651379,
            DEVICE_MANUFACTURERS_MINOLTA_2 = 1296976980,
            DEVICE_MANUFACTURERS_MODGRAPH_INC = 1297040455,
            DEVICE_MANUFACTURERS_MONITRONIX_INC = 1297043017,
            DEVICE_MANUFACTURERS_MONACO_SYSTEMS_INC = 1297043027,
            DEVICE_MANUFACTURERS_MORSE_TECHNOLOGY_INC = 1297044051,
            DEVICE_MANUFACTURERS_MOTIVE_SYSTEMS = 1297044553,
            DEVICE_MANUFACTURERS_MICROSOFT_CORPORATION = 1297303124,
            DEVICE_MANUFACTURERS_MUTOH_INDUSTRIES_LTD = 1297437775,
            DEVICE_MANUFACTURERS_MITSUBISHI_ELECTRIC_CORPORATION_KYOTO_WORKS = 1298756723,
            DEVICE_MANUFACTURERS_NANAO_USA_CORPORATION = 1312902721,
            DEVICE_MANUFACTURERS_NEC_CORPORATION = 1313162016,
            DEVICE_MANUFACTURERS_NEXPRESS_SOLUTIONS_LLC = 1313167440,
            DEVICE_MANUFACTURERS_NISSEI_SANGYO_AMERICA_LTD = 1313428307,
            DEVICE_MANUFACTURERS_NIKON_CORPORATION = 1313558350,
            DEVICE_MANUFACTURERS_OCE_TECHNOLOGIES_BV = 1329808672,
            DEVICE_MANUFACTURERS_OCECOLOR = 1329808707,
            DEVICE_MANUFACTURERS_OKI = 1330333984,
            DEVICE_MANUFACTURERS_OKIDATA = 1330334020,
            DEVICE_MANUFACTURERS_OKIDATA_2 = 1330334032,
            DEVICE_MANUFACTURERS_OLIVETTI = 1330399574,
            DEVICE_MANUFACTURERS_OLYMPUS_OPTICAL_CO_LTD = 1330403661,
            DEVICE_MANUFACTURERS_ONYX_GRAPHICS = 1330534744,
            DEVICE_MANUFACTURERS_OPTIQUEST = 1330664521,
            DEVICE_MANUFACTURERS_PACKARD_BELL = 1346454347,
            DEVICE_MANUFACTURERS_MATSUSHITA_ELECTRIC_INDUSTRIAL_CO_LTD = 1346457153,
            DEVICE_MANUFACTURERS_PANTONE_INC = 1346457172,
            DEVICE_MANUFACTURERS_PACKARD_BELL_2 = 1346522656,
            DEVICE_MANUFACTURERS_PFU_LIMITED = 1346786592,
            DEVICE_MANUFACTURERS_PHILIPS_CONSUMER_ELECTRONICS_CO = 1346914636,
            DEVICE_MANUFACTURERS_HOYA_CORPORATION_PENTAX_IMAGING_SYSTEMS_DIVISION = 1347310680,
            DEVICE_MANUFACTURERS_PHASE_ONE_A_S = 1347382885,
            DEVICE_MANUFACTURERS_PREMIER_COMPUTER_INNOVATIONS = 1347568973,
            DEVICE_MANUFACTURERS_PRINCETON_GRAPHIC_SYSTEMS = 1347569998,
            DEVICE_MANUFACTURERS_PRINCETON_PUBLISHING_LABS = 1347570000,
            DEVICE_MANUFACTURERS_QLUX = 1363957080,
            DEVICE_MANUFACTURERS_QMS_INC = 1364022048,
            DEVICE_MANUFACTURERS_QPCARD_AB = 1364214596,
            DEVICE_MANUFACTURERS_QUADLASER = 1364541764,
            DEVICE_MANUFACTURERS_QUME_CORPORATION = 1364544837,
            DEVICE_MANUFACTURERS_RADIUS_INC = 1380009033,
            DEVICE_MANUFACTURERS_INTEGRATED_COLOR_SOLUTIONS_INC_2 = 1380205688,
            DEVICE_MANUFACTURERS_ROLAND_DG_CORPORATION = 1380206368,
            DEVICE_MANUFACTURERS_REDMS_GROUP_INC = 1380271181,
            DEVICE_MANUFACTURERS_RELISYS = 1380273225,
            DEVICE_MANUFACTURERS_ROLF_GIERLING_MULTITOOLS = 1380404563,
            DEVICE_MANUFACTURERS_RICOH_CORPORATION = 1380533071,
            DEVICE_MANUFACTURERS_EDMUND_RONALD = 1380863044,
            DEVICE_MANUFACTURERS_ROYAL = 1380931905,
            DEVICE_MANUFACTURERS_RICOH_PRINTING_SYSTEMSLTD = 1380991776,
            DEVICE_MANUFACTURERS_ROYAL_INFORMATION_ELECTRONICS_CO_LTD = 1381256224,
            DEVICE_MANUFACTURERS_SAMPO_CORPORATION_OF_AMERICA = 1396788560,
            DEVICE_MANUFACTURERS_SAMSUNG_INC = 1396788563,
            DEVICE_MANUFACTURERS_JAIME_SANTANA_POMARES = 1396788820,
            DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_9 = 1396918612,
            DEVICE_MANUFACTURERS_DAINIPPON_SCREEN_3 = 1396920910,
            DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_12 = 1396985888,
            DEVICE_MANUFACTURERS_SAMSUNG_ELECTRONICS_COLTD = 1397048096,
            DEVICE_MANUFACTURERS_SEIKO_INSTRUMENTS_USA_INC = 1397049675,
            DEVICE_MANUFACTURERS_SEIKOSHA = 1397049707,
            DEVICE_MANUFACTURERS_SCANGUYCOM = 1397183833,
            DEVICE_MANUFACTURERS_SHARP_LABORATORIES = 1397244242,
            DEVICE_MANUFACTURERS_INTERNATIONAL_COLOR_CONSORTIUM = 1397310275,
            DEVICE_MANUFACTURERS_SONY_CORPORATION_2 = 1397706329,
            DEVICE_MANUFACTURERS_SPECTRACAL = 1397769036,
            DEVICE_MANUFACTURERS_STAR = 1398030674,
            DEVICE_MANUFACTURERS_SAMPO_TECHNOLOGY_CORPORATION = 1398031136,
            DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_10 = 1399023988,
            DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_13 = 1399091232,
            DEVICE_MANUFACTURERS_SONY_CORPORATION_3 = 1399811705,
            DEVICE_MANUFACTURERS_TALON_TECHNOLOGY_CORPORATION = 1413565519,
            DEVICE_MANUFACTURERS_TANDY = 1413566020,
            DEVICE_MANUFACTURERS_TATUNG_CO_OF_AMERICA_INC = 1413567573,
            DEVICE_MANUFACTURERS_TAXAN_AMERICA_INC = 1413568577,
            DEVICE_MANUFACTURERS_TOKYO_DENSHI_SEKEI_KK = 1413763872,
            DEVICE_MANUFACTURERS_TECO_INFORMATION_SYSTEMS_INC = 1413825359,
            DEVICE_MANUFACTURERS_TEGRA = 1413826386,
            DEVICE_MANUFACTURERS_TEKTRONIX_INC = 1413827412,
            DEVICE_MANUFACTURERS_TEXAS_INSTRUMENTS = 1414078496,
            DEVICE_MANUFACTURERS_TYPEMAKER_LTD = 1414351698,
            DEVICE_MANUFACTURERS_TOSHIBA_CORP = 1414484802,
            DEVICE_MANUFACTURERS_TOSHIBA_INC = 1414484808,
            DEVICE_MANUFACTURERS_TOTOKU_ELECTRIC_CO_LTD = 1414485067,
            DEVICE_MANUFACTURERS_TRIUMPH = 1414678869,
            DEVICE_MANUFACTURERS_TOSHIBA_TEC_CORPORATION = 1414742612,
            DEVICE_MANUFACTURERS_TTX_COMPUTER_PRODUCTS_INC = 1414813728,
            DEVICE_MANUFACTURERS_TVM_PROFESSIONAL_MONITOR_CORPORATION = 1414941984,
            DEVICE_MANUFACTURERS_TW_CASPER_CORPORATION = 1414996000,
            DEVICE_MANUFACTURERS_ULEAD_SYSTEMS = 1431065432,
            DEVICE_MANUFACTURERS_UNISYS = 1431193939,
            DEVICE_MANUFACTURERS_UTZ_FEHLAU_AND_SOHN = 1431591494,
            DEVICE_MANUFACTURERS_VARITYPER = 1447121481,
            DEVICE_MANUFACTURERS_VIEWSONIC = 1447642455,
            DEVICE_MANUFACTURERS_VISUAL_COMMUNICATION = 1447646028,
            DEVICE_MANUFACTURERS_WANG = 1463897671,
            DEVICE_MANUFACTURERS_WILBUR_IMAGING = 1464615506,
            DEVICE_MANUFACTURERS_WARE_TO_GO = 1465141042,
            DEVICE_MANUFACTURERS_WYSE_TECHNOLOGY = 1465471813,
            DEVICE_MANUFACTURERS_XEROX_CORPORATION = 1480938072,
            DEVICE_MANUFACTURERS_X_RITE = 1481787732,
            DEVICE_MANUFACTURERS_LAVANYAS_TEST_COMPANY = 1513173555,
            DEVICE_MANUFACTURERS_ZORAN_CORPORATION = 1515340110,
            DEVICE_MANUFACTURERS_ZEBRA_TECHNOLOGIES_INC = 1516593778,
            DEVICE_MANUFACTURERS_BASICCOLOR_GMBH = 1648968515,
            DEVICE_MANUFACTURERS_BERGDESIGN_INCORPORATED = 1650815591,
            DEVICE_MANUFACTURERS_INTEGRATED_COLOR_SOLUTIONS_INC = 1667594596,
            DEVICE_MANUFACTURERS_MACDERMID_COLORSPAN_INC = 1668051824,
            DEVICE_MANUFACTURERS_DAINIPPON_SCREEN_2 = 1685266464,
            DEVICE_MANUFACTURERS_DUPONT_2 = 1685418094,
            DEVICE_MANUFACTURERS_FUJIFILM_ELECTRONIC_IMAGING_LTD_2 = 1717986665,
            DEVICE_MANUFACTURERS_FLUXDATA_CORPORATION = 1718383992,
            DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_5 = 1769105779,
            DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_8 = 1801548404,
            DEVICE_MANUFACTURERS_ERDT_SYSTEMS_GMBH_AND_CO_KG_2 = 1868706916,
            DEVICE_MANUFACTURERS_MEDIGRAPH_GMBH = 1868720483,
            DEVICE_MANUFACTURERS_QUBYX_SARL = 1903518329,
            DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_11 = 1935894900,
            DEVICE_MANUFACTURERS_DAINIPPON_SCREEN_4 = 1935897198,
            DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_14 = 1935962144,
            DEVICE_MANUFACTURERS_SIWI_GRAFIKA_CORPORATION = 1936291689,
            DEVICE_MANUFACTURERS_YXYMASTER_GMBH = 2037938541
        };

        device_manufacturer_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
        void _read();
        ~device_manufacturer_t();

    private:
        device_manufacturers_t m_device_manufacturer;
        icc_4_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        device_manufacturers_t device_manufacturer() const { return m_device_manufacturer; }
        icc_4_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class s_15_fixed_16_number_t : public kaitai::kstruct {

    public:

        s_15_fixed_16_number_t(kaitai::kstream* p_io, icc_4_t::tag_table_t::tag_definition_t::s_15_fixed_16_array_type_t* p_parent = 0, icc_4_t* p_root = 0);
        void _read();
        ~s_15_fixed_16_number_t();

    private:
        std::string m_number;
        icc_4_t* m__root;
        icc_4_t::tag_table_t::tag_definition_t::s_15_fixed_16_array_type_t* m__parent;

    public:
        std::string number() const { return m_number; }
        icc_4_t* _root() const { return m__root; }
        icc_4_t::tag_table_t::tag_definition_t::s_15_fixed_16_array_type_t* _parent() const { return m__parent; }
    };

    class position_number_t : public kaitai::kstruct {

    public:

        position_number_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, icc_4_t* p_root = 0);
        void _read();
        ~position_number_t();

    private:
        uint32_t m_offset_to_data_element;
        uint32_t m_size_of_data_element;
        icc_4_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint32_t offset_to_data_element() const { return m_offset_to_data_element; }
        uint32_t size_of_data_element() const { return m_size_of_data_element; }
        icc_4_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

private:
    profile_header_t* m_header;
    tag_table_t* m_tag_table;
    icc_4_t* m__root;
    kaitai::kstruct* m__parent;

public:
    profile_header_t* header() const { return m_header; }
    tag_table_t* tag_table() const { return m_tag_table; }
    icc_4_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // ICC_4_H_

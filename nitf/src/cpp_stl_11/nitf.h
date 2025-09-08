#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class nitf_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * The NITF (National Image Transition Format) format is a file format developed by the U.S. Government for
 * storing imagery, e.g. from satellites.
 * 
 * According to the [foreword of the specification](https://web.archive.org/web/20181105050336/https://www.gwg.nga.mil/ntb/baseline/docs/2500c/2500C.pdf):
 * > The National Imagery Transmission Format Standard (NITFS) is the suite of standards for formatting digital
 * > imagery and imagery-related products and exchanging them among members of the Intelligence Community (IC) as
 * > defined by the Executive Order 12333, and other United States Government departments and agencies."
 * 
 * This implementation is set to version format (`file_version`) of 02.10 and `standard_type` of `BF01`.
 * It was implemented by [River Loop Security](https://www.riverloopsecurity.com/).
 * \sa https://web.archive.org/web/20181105050336/https://www.gwg.nga.mil/ntb/baseline/docs/2500c/2500C.pdf Source
 */

class nitf_t : public kaitai::kstruct {

public:
    class band_info_t;
    class clasnfo_t;
    class data_extension_segment_t;
    class data_sub_header_t;
    class data_sub_header_base_t;
    class data_sub_header_streaming_t;
    class data_sub_header_tre_t;
    class date_time_t;
    class encrypt_t;
    class graphic_sub_header_t;
    class graphics_segment_t;
    class header_t;
    class image_comment_t;
    class image_data_mask_t;
    class image_segment_t;
    class image_sub_header_t;
    class length_data_info_t;
    class length_graphic_info_t;
    class length_image_info_t;
    class length_reserved_info_t;
    class length_text_info_t;
    class reserved_extension_segment_t;
    class reserved_sub_header_t;
    class text_segment_t;
    class text_sub_header_t;
    class tre_t;
    class tre_header_t;

    nitf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, nitf_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~nitf_t();

    class band_info_t : public kaitai::kstruct {

    public:

        band_info_t(kaitai::kstream* p__io, nitf_t::image_sub_header_t* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~band_info_t();

    private:
        std::string m_representation;
        std::string m_subcategory;
        std::string m_img_filter_condition;
        std::string m_img_filter_code;
        std::string m_num_luts;
        std::string m_num_lut_entries;
        bool n_num_lut_entries;

    public:
        bool _is_null_num_lut_entries() { num_lut_entries(); return n_num_lut_entries; };

    private:
        std::unique_ptr<std::vector<std::string>> m_luts;
        nitf_t* m__root;
        nitf_t::image_sub_header_t* m__parent;

    public:

        /**
         * Indicates processing required to display the nth band of image w.r.t. the general image type recorded by IREP field
         */
        std::string representation() const { return m_representation; }
        std::string subcategory() const { return m_subcategory; }
        std::string img_filter_condition() const { return m_img_filter_condition; }

        /**
         * Reserved
         */
        std::string img_filter_code() const { return m_img_filter_code; }
        std::string num_luts() const { return m_num_luts; }

        /**
         * Number of entries in each of the LUTs for the nth image band
         */
        std::string num_lut_entries() const { return m_num_lut_entries; }
        std::vector<std::string>* luts() const { return m_luts.get(); }
        nitf_t* _root() const { return m__root; }
        nitf_t::image_sub_header_t* _parent() const { return m__parent; }
    };

    class clasnfo_t : public kaitai::kstruct {

    public:

        clasnfo_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~clasnfo_t();

    private:
        std::string m_security_class;
        std::string m_security_system;
        std::string m_codewords;
        std::string m_control_and_handling;
        std::string m_releaseability;
        std::string m_declass_type;
        std::string m_declass_date;
        std::string m_declass_exemption;
        std::string m_downgrade;
        std::string m_downgrade_date;
        std::string m_class_text;
        std::string m_class_authority_type;
        std::string m_class_authority;
        std::string m_class_reason;
        std::string m_source_date;
        std::string m_control_number;
        nitf_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        std::string security_class() const { return m_security_class; }
        std::string security_system() const { return m_security_system; }
        std::string codewords() const { return m_codewords; }
        std::string control_and_handling() const { return m_control_and_handling; }
        std::string releaseability() const { return m_releaseability; }
        std::string declass_type() const { return m_declass_type; }
        std::string declass_date() const { return m_declass_date; }
        std::string declass_exemption() const { return m_declass_exemption; }
        std::string downgrade() const { return m_downgrade; }
        std::string downgrade_date() const { return m_downgrade_date; }
        std::string class_text() const { return m_class_text; }
        std::string class_authority_type() const { return m_class_authority_type; }
        std::string class_authority() const { return m_class_authority; }
        std::string class_reason() const { return m_class_reason; }
        std::string source_date() const { return m_source_date; }
        std::string control_number() const { return m_control_number; }
        nitf_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class data_extension_segment_t : public kaitai::kstruct {

    public:

        data_extension_segment_t(uint16_t p_idx, kaitai::kstream* p__io, nitf_t* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~data_extension_segment_t();

    private:
        std::unique_ptr<data_sub_header_t> m_data_sub_header;
        std::string m_data_data_field;
        uint16_t m_idx;
        nitf_t* m__root;
        nitf_t* m__parent;
        std::string m__raw_data_sub_header;
        std::unique_ptr<kaitai::kstream> m__io__raw_data_sub_header;

    public:
        data_sub_header_t* data_sub_header() const { return m_data_sub_header.get(); }
        std::string data_data_field() const { return m_data_data_field; }
        uint16_t idx() const { return m_idx; }
        nitf_t* _root() const { return m__root; }
        nitf_t* _parent() const { return m__parent; }
        std::string _raw_data_sub_header() const { return m__raw_data_sub_header; }
        kaitai::kstream* _io__raw_data_sub_header() const { return m__io__raw_data_sub_header.get(); }
    };

    class data_sub_header_t : public kaitai::kstruct {

    public:

        data_sub_header_t(kaitai::kstream* p__io, nitf_t::data_extension_segment_t* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~data_sub_header_t();

    private:
        bool f_tre_ofl;
        bool m_tre_ofl;

    public:
        bool tre_ofl();

    private:
        std::unique_ptr<data_sub_header_base_t> m_des_base;
        std::string m_overflowed_header_type;
        bool n_overflowed_header_type;

    public:
        bool _is_null_overflowed_header_type() { overflowed_header_type(); return n_overflowed_header_type; };

    private:
        std::string m_data_item_overflowed;
        bool n_data_item_overflowed;

    public:
        bool _is_null_data_item_overflowed() { data_item_overflowed(); return n_data_item_overflowed; };

    private:
        std::string m_des_defined_subheader_fields_len;
        std::string m_desshf;
        std::string m_des_defined_data_field;
        nitf_t* m__root;
        nitf_t::data_extension_segment_t* m__parent;

    public:
        data_sub_header_base_t* des_base() const { return m_des_base.get(); }
        std::string overflowed_header_type() const { return m_overflowed_header_type; }
        std::string data_item_overflowed() const { return m_data_item_overflowed; }
        std::string des_defined_subheader_fields_len() const { return m_des_defined_subheader_fields_len; }
        std::string desshf() const { return m_desshf; }
        std::string des_defined_data_field() const { return m_des_defined_data_field; }
        nitf_t* _root() const { return m__root; }
        nitf_t::data_extension_segment_t* _parent() const { return m__parent; }
    };

    class data_sub_header_base_t : public kaitai::kstruct {

    public:

        data_sub_header_base_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~data_sub_header_base_t();

    private:
        std::string m_file_part_type_de;
        std::string m_desid;
        std::string m_data_definition_version;
        std::unique_ptr<clasnfo_t> m_declasnfo;
        nitf_t* m__root;
        kaitai::kstruct* m__parent;

    public:

        /**
         * File Part Type desigantor for Data Extension
         */
        std::string file_part_type_de() const { return m_file_part_type_de; }
        std::string desid() const { return m_desid; }
        std::string data_definition_version() const { return m_data_definition_version; }
        clasnfo_t* declasnfo() const { return m_declasnfo.get(); }
        nitf_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    /**
     * Streaming file Header Data Extension Segment Subheader
     */

    class data_sub_header_streaming_t : public kaitai::kstruct {

    public:

        data_sub_header_streaming_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~data_sub_header_streaming_t();

    private:
        std::unique_ptr<data_sub_header_base_t> m_des_base;
        std::string m_des_defined_subheader_fields_len;
        std::string m_sfh_l1;
        uint32_t m_sfh_delim1;
        std::unique_ptr<std::vector<uint8_t>> m_sfh_dr;
        uint32_t m_sfh_delim2;
        std::string m_sfh_l2;
        nitf_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        data_sub_header_base_t* des_base() const { return m_des_base.get(); }
        std::string des_defined_subheader_fields_len() const { return m_des_defined_subheader_fields_len; }

        /**
         * SFH Length 1: number of bytes in sfh_dr field
         */
        std::string sfh_l1() const { return m_sfh_l1; }

        /**
         * Shall contain the value 0x0A6E1D97.
         */
        uint32_t sfh_delim1() const { return m_sfh_delim1; }
        std::vector<uint8_t>* sfh_dr() const { return m_sfh_dr.get(); }

        /**
         * Shall contain the value 0x0ECA14BF.
         */
        uint32_t sfh_delim2() const { return m_sfh_delim2; }

        /**
         * A repeat of sfh_l1.
         */
        std::string sfh_l2() const { return m_sfh_l2; }
        nitf_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class data_sub_header_tre_t : public kaitai::kstruct {

    public:

        data_sub_header_tre_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~data_sub_header_tre_t();

    private:
        std::unique_ptr<data_sub_header_base_t> m_des_base;
        std::string m_overflowed_header_type;
        bool n_overflowed_header_type;

    public:
        bool _is_null_overflowed_header_type() { overflowed_header_type(); return n_overflowed_header_type; };

    private:
        std::string m_data_item_overflowed;
        bool n_data_item_overflowed;

    public:
        bool _is_null_data_item_overflowed() { data_item_overflowed(); return n_data_item_overflowed; };

    private:
        std::string m_des_defined_subheader_fields_len;
        std::string m_des_defined_data_field;
        nitf_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        data_sub_header_base_t* des_base() const { return m_des_base.get(); }
        std::string overflowed_header_type() const { return m_overflowed_header_type; }
        std::string data_item_overflowed() const { return m_data_item_overflowed; }
        std::string des_defined_subheader_fields_len() const { return m_des_defined_subheader_fields_len; }
        std::string des_defined_data_field() const { return m_des_defined_data_field; }
        nitf_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class date_time_t : public kaitai::kstruct {

    public:

        date_time_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~date_time_t();

    private:
        std::string m__unnamed0;
        nitf_t* m__root;
        kaitai::kstruct* m__parent;

    public:

        /**
         * UTC time of image acquisition in the format CCYYMMDDhhmmss: CC century, YY last two digits of the year, MM month, DD day, hh hour, mm minute, ss second
         */
        std::string _unnamed0() const { return m__unnamed0; }
        nitf_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class encrypt_t : public kaitai::kstruct {

    public:

        encrypt_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~encrypt_t();

    private:
        std::string m__unnamed0;
        nitf_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        std::string _unnamed0() const { return m__unnamed0; }
        nitf_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class graphic_sub_header_t : public kaitai::kstruct {

    public:

        graphic_sub_header_t(kaitai::kstream* p__io, nitf_t::graphics_segment_t* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~graphic_sub_header_t();

    private:
        std::string m_file_part_type_sy;
        std::string m_graphic_id;
        std::string m_graphic_name;
        std::unique_ptr<clasnfo_t> m_graphic_classification;
        std::unique_ptr<encrypt_t> m_encryption;
        std::string m_graphic_type;
        std::string m_reserved1;
        std::string m_graphic_display_level;
        std::string m_graphic_attachment_level;
        std::string m_graphic_location;
        std::string m_first_graphic_bound_loc;
        std::string m_graphic_color;
        std::string m_second_graphic_bound_loc;
        std::string m_reserved2;
        std::unique_ptr<tre_header_t> m_graphics_extended_sub_header;
        nitf_t* m__root;
        nitf_t::graphics_segment_t* m__parent;

    public:
        std::string file_part_type_sy() const { return m_file_part_type_sy; }
        std::string graphic_id() const { return m_graphic_id; }
        std::string graphic_name() const { return m_graphic_name; }
        clasnfo_t* graphic_classification() const { return m_graphic_classification.get(); }
        encrypt_t* encryption() const { return m_encryption.get(); }
        std::string graphic_type() const { return m_graphic_type; }

        /**
         * Reserved
         */
        std::string reserved1() const { return m_reserved1; }
        std::string graphic_display_level() const { return m_graphic_display_level; }
        std::string graphic_attachment_level() const { return m_graphic_attachment_level; }
        std::string graphic_location() const { return m_graphic_location; }
        std::string first_graphic_bound_loc() const { return m_first_graphic_bound_loc; }
        std::string graphic_color() const { return m_graphic_color; }
        std::string second_graphic_bound_loc() const { return m_second_graphic_bound_loc; }

        /**
         * Reserved
         */
        std::string reserved2() const { return m_reserved2; }
        tre_header_t* graphics_extended_sub_header() const { return m_graphics_extended_sub_header.get(); }
        nitf_t* _root() const { return m__root; }
        nitf_t::graphics_segment_t* _parent() const { return m__parent; }
    };

    class graphics_segment_t : public kaitai::kstruct {

    public:

        graphics_segment_t(uint16_t p_idx, kaitai::kstream* p__io, nitf_t* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~graphics_segment_t();

    private:
        std::unique_ptr<graphic_sub_header_t> m_graphic_sub_header;
        std::string m_graphic_data_field;
        uint16_t m_idx;
        nitf_t* m__root;
        nitf_t* m__parent;

    public:
        graphic_sub_header_t* graphic_sub_header() const { return m_graphic_sub_header.get(); }
        std::string graphic_data_field() const { return m_graphic_data_field; }
        uint16_t idx() const { return m_idx; }
        nitf_t* _root() const { return m__root; }
        nitf_t* _parent() const { return m__parent; }
    };

    class header_t : public kaitai::kstruct {

    public:

        header_t(kaitai::kstream* p__io, nitf_t* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_t();

    private:
        std::string m_file_profile_name;
        std::string m_file_version;
        std::string m_complexity_level;
        std::string m_standard_type;
        std::string m_originating_station_id;
        std::unique_ptr<date_time_t> m_file_date_time;
        std::string m_file_title;
        std::unique_ptr<clasnfo_t> m_file_security;
        std::string m_file_copy_number;
        std::string m_file_num_of_copys;
        std::unique_ptr<encrypt_t> m_encryption;
        std::string m_file_bg_color;
        std::string m_originator_name;
        std::string m_originator_phone;
        std::string m_file_length;
        std::string m_file_header_length;
        std::string m_num_image_segments;
        std::unique_ptr<std::vector<std::unique_ptr<length_image_info_t>>> m_linfo;
        std::string m_num_graphics_segments;
        std::unique_ptr<std::vector<std::unique_ptr<length_graphic_info_t>>> m_lnnfo;
        std::string m_reserved_numx;
        std::string m_num_text_files;
        std::unique_ptr<std::vector<std::unique_ptr<length_text_info_t>>> m_ltnfo;
        std::string m_num_data_extension;
        std::unique_ptr<std::vector<std::unique_ptr<length_data_info_t>>> m_ldnfo;
        std::string m_num_reserved_extension;
        std::unique_ptr<std::vector<std::unique_ptr<length_reserved_info_t>>> m_lrnfo;
        std::unique_ptr<tre_header_t> m_user_defined_header;
        std::unique_ptr<tre_header_t> m_extended_header;
        nitf_t* m__root;
        nitf_t* m__parent;

    public:
        std::string file_profile_name() const { return m_file_profile_name; }
        std::string file_version() const { return m_file_version; }
        std::string complexity_level() const { return m_complexity_level; }

        /**
         * Value of BF01 indicates the file is formatted using ISO/IEC IS 12087-5.
         */
        std::string standard_type() const { return m_standard_type; }
        std::string originating_station_id() const { return m_originating_station_id; }
        date_time_t* file_date_time() const { return m_file_date_time.get(); }
        std::string file_title() const { return m_file_title; }
        clasnfo_t* file_security() const { return m_file_security.get(); }
        std::string file_copy_number() const { return m_file_copy_number; }
        std::string file_num_of_copys() const { return m_file_num_of_copys; }
        encrypt_t* encryption() const { return m_encryption.get(); }
        std::string file_bg_color() const { return m_file_bg_color; }
        std::string originator_name() const { return m_originator_name; }
        std::string originator_phone() const { return m_originator_phone; }
        std::string file_length() const { return m_file_length; }
        std::string file_header_length() const { return m_file_header_length; }
        std::string num_image_segments() const { return m_num_image_segments; }
        std::vector<std::unique_ptr<length_image_info_t>>* linfo() const { return m_linfo.get(); }
        std::string num_graphics_segments() const { return m_num_graphics_segments; }
        std::vector<std::unique_ptr<length_graphic_info_t>>* lnnfo() const { return m_lnnfo.get(); }
        std::string reserved_numx() const { return m_reserved_numx; }
        std::string num_text_files() const { return m_num_text_files; }
        std::vector<std::unique_ptr<length_text_info_t>>* ltnfo() const { return m_ltnfo.get(); }
        std::string num_data_extension() const { return m_num_data_extension; }
        std::vector<std::unique_ptr<length_data_info_t>>* ldnfo() const { return m_ldnfo.get(); }
        std::string num_reserved_extension() const { return m_num_reserved_extension; }
        std::vector<std::unique_ptr<length_reserved_info_t>>* lrnfo() const { return m_lrnfo.get(); }
        tre_header_t* user_defined_header() const { return m_user_defined_header.get(); }
        tre_header_t* extended_header() const { return m_extended_header.get(); }
        nitf_t* _root() const { return m__root; }
        nitf_t* _parent() const { return m__parent; }
    };

    class image_comment_t : public kaitai::kstruct {

    public:

        image_comment_t(kaitai::kstream* p__io, nitf_t::image_sub_header_t* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~image_comment_t();

    private:
        std::string m__unnamed0;
        nitf_t* m__root;
        nitf_t::image_sub_header_t* m__parent;

    public:
        std::string _unnamed0() const { return m__unnamed0; }
        nitf_t* _root() const { return m__root; }
        nitf_t::image_sub_header_t* _parent() const { return m__parent; }
    };

    class image_data_mask_t : public kaitai::kstruct {

    public:

        image_data_mask_t(kaitai::kstream* p__io, nitf_t::image_segment_t* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~image_data_mask_t();

    private:
        bool f_bmrbnd_size;
        int32_t m_bmrbnd_size;

    public:
        int32_t bmrbnd_size();

    private:
        bool f_bmrtmr_count;
        int32_t m_bmrtmr_count;

    public:
        int32_t bmrtmr_count();

    private:
        bool f_has_bmr;
        bool m_has_bmr;

    public:
        bool has_bmr();

    private:
        bool f_has_tmr;
        bool m_has_tmr;

    public:
        bool has_tmr();

    private:
        bool f_tmrbnd_size;
        int32_t m_tmrbnd_size;

    public:
        int32_t tmrbnd_size();

    private:
        bool f_total_size;
        int32_t m_total_size;

    public:
        int32_t total_size();

    private:
        bool f_tpxcd_size;
        int32_t m_tpxcd_size;

    public:
        int32_t tpxcd_size();

    private:
        uint32_t m_blocked_img_data_offset;
        uint16_t m_bmrlnth;
        uint16_t m_tmrlnth;
        uint16_t m_tpxcdlnth;
        std::string m_tpxcd;
        std::unique_ptr<std::vector<uint32_t>> m_bmrbnd;
        bool n_bmrbnd;

    public:
        bool _is_null_bmrbnd() { bmrbnd(); return n_bmrbnd; };

    private:
        std::unique_ptr<std::vector<uint32_t>> m_tmrbnd;
        bool n_tmrbnd;

    public:
        bool _is_null_tmrbnd() { tmrbnd(); return n_tmrbnd; };

    private:
        nitf_t* m__root;
        nitf_t::image_segment_t* m__parent;

    public:
        uint32_t blocked_img_data_offset() const { return m_blocked_img_data_offset; }

        /**
         * Block Mask Record Length
         */
        uint16_t bmrlnth() const { return m_bmrlnth; }

        /**
         * Pad Pixel Mask Record Length
         */
        uint16_t tmrlnth() const { return m_tmrlnth; }

        /**
         * Pad Output Pixel Code Length
         */
        uint16_t tpxcdlnth() const { return m_tpxcdlnth; }

        /**
         * Pad Output Pixel Code
         */
        std::string tpxcd() const { return m_tpxcd; }

        /**
         * Block n, Band m Offset
         */
        std::vector<uint32_t>* bmrbnd() const { return m_bmrbnd.get(); }

        /**
         * Pad Pixel n, Band m
         */
        std::vector<uint32_t>* tmrbnd() const { return m_tmrbnd.get(); }
        nitf_t* _root() const { return m__root; }
        nitf_t::image_segment_t* _parent() const { return m__parent; }
    };

    class image_segment_t : public kaitai::kstruct {

    public:

        image_segment_t(uint16_t p_idx, kaitai::kstream* p__io, nitf_t* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~image_segment_t();

    private:
        bool f_has_mask;
        bool m_has_mask;

    public:
        bool has_mask();

    private:
        std::unique_ptr<image_sub_header_t> m_image_sub_header;
        std::unique_ptr<image_data_mask_t> m_image_data_mask;
        bool n_image_data_mask;

    public:
        bool _is_null_image_data_mask() { image_data_mask(); return n_image_data_mask; };

    private:
        std::string m_image_data_field;
        bool n_image_data_field;

    public:
        bool _is_null_image_data_field() { image_data_field(); return n_image_data_field; };

    private:
        uint16_t m_idx;
        nitf_t* m__root;
        nitf_t* m__parent;

    public:
        image_sub_header_t* image_sub_header() const { return m_image_sub_header.get(); }
        image_data_mask_t* image_data_mask() const { return m_image_data_mask.get(); }
        std::string image_data_field() const { return m_image_data_field; }
        uint16_t idx() const { return m_idx; }
        nitf_t* _root() const { return m__root; }
        nitf_t* _parent() const { return m__parent; }
    };

    class image_sub_header_t : public kaitai::kstruct {

    public:

        image_sub_header_t(kaitai::kstream* p__io, nitf_t::image_segment_t* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~image_sub_header_t();

    private:
        std::string m_file_part_type;
        std::string m_image_id_1;
        std::unique_ptr<date_time_t> m_image_date_time;
        std::string m_target_id;
        std::string m_image_id_2;
        std::unique_ptr<clasnfo_t> m_image_security_classification;
        std::unique_ptr<encrypt_t> m_encryption;
        std::string m_image_source;
        std::string m_num_sig_rows;
        std::string m_num_sig_cols;
        std::string m_pixel_value_type;
        std::string m_image_representation;
        std::string m_image_category;
        std::string m_actual_bits_per_pixel_per_band;
        std::string m_pixel_justification;
        std::string m_image_coordinate_rep;
        std::string m_image_geo_loc;
        std::string m_num_img_comments;
        std::unique_ptr<std::vector<std::unique_ptr<image_comment_t>>> m_img_comments;
        std::string m_img_compression;
        std::string m_compression_rate_code;
        std::string m_num_bands;
        std::string m_num_multispectral_bands;
        bool n_num_multispectral_bands;

    public:
        bool _is_null_num_multispectral_bands() { num_multispectral_bands(); return n_num_multispectral_bands; };

    private:
        std::unique_ptr<std::vector<std::unique_ptr<band_info_t>>> m_bands;
        std::string m_img_sync_code;
        std::string m_img_mode;
        std::string m_num_blocks_per_row;
        std::string m_num_blocks_per_col;
        std::string m_num_pixels_per_block_horz;
        std::string m_num_pixels_per_block_vert;
        std::string m_num_pixels_per_band;
        std::string m_img_display_level;
        std::string m_attachment_level;
        std::string m_img_location;
        std::string m_img_magnification;
        std::string m_user_def_img_data_len;
        std::string m_user_def_overflow;
        bool n_user_def_overflow;

    public:
        bool _is_null_user_def_overflow() { user_def_overflow(); return n_user_def_overflow; };

    private:
        std::unique_ptr<std::vector<uint8_t>> m_user_def_img_data;
        bool n_user_def_img_data;

    public:
        bool _is_null_user_def_img_data() { user_def_img_data(); return n_user_def_img_data; };

    private:
        std::unique_ptr<tre_header_t> m_image_extended_sub_header;
        nitf_t* m__root;
        nitf_t::image_segment_t* m__parent;

    public:
        std::string file_part_type() const { return m_file_part_type; }
        std::string image_id_1() const { return m_image_id_1; }
        date_time_t* image_date_time() const { return m_image_date_time.get(); }
        std::string target_id() const { return m_target_id; }
        std::string image_id_2() const { return m_image_id_2; }
        clasnfo_t* image_security_classification() const { return m_image_security_classification.get(); }
        encrypt_t* encryption() const { return m_encryption.get(); }
        std::string image_source() const { return m_image_source; }

        /**
         * Total number of rows of significant pixels in the image; only rows indexed 0 to (NROWS - 1) of the image contain significant data.
         */
        std::string num_sig_rows() const { return m_num_sig_rows; }
        std::string num_sig_cols() const { return m_num_sig_cols; }
        std::string pixel_value_type() const { return m_pixel_value_type; }

        /**
         * MONO, RGB, RGB/LUT, MULTI, NODISPLY, NVECTOR, POLAR, VPH, YCbCr601
         */
        std::string image_representation() const { return m_image_representation; }

        /**
         * VIS, SL, TI, FL, RD, EO, OP, HR, HS,CP, BP, SAR, SARIQ, IR, MAP, MS, FP, MRI, XRAY, CAT, VD, PAT, LEG, DTEM, MATR, LOCG, BARO, CURRENT, DEPTH, WIND
         */
        std::string image_category() const { return m_image_category; }
        std::string actual_bits_per_pixel_per_band() const { return m_actual_bits_per_pixel_per_band; }
        std::string pixel_justification() const { return m_pixel_justification; }
        std::string image_coordinate_rep() const { return m_image_coordinate_rep; }
        std::string image_geo_loc() const { return m_image_geo_loc; }
        std::string num_img_comments() const { return m_num_img_comments; }
        std::vector<std::unique_ptr<image_comment_t>>* img_comments() const { return m_img_comments.get(); }
        std::string img_compression() const { return m_img_compression; }
        std::string compression_rate_code() const { return m_compression_rate_code; }
        std::string num_bands() const { return m_num_bands; }
        std::string num_multispectral_bands() const { return m_num_multispectral_bands; }
        std::vector<std::unique_ptr<band_info_t>>* bands() const { return m_bands.get(); }

        /**
         * Reserved for future use.
         */
        std::string img_sync_code() const { return m_img_sync_code; }

        /**
         * B = Band Interleaved by Block, P = Band Interleaved by Pixel, R = Band Interleaved by Row, S = Band Sequential
         */
        std::string img_mode() const { return m_img_mode; }
        std::string num_blocks_per_row() const { return m_num_blocks_per_row; }
        std::string num_blocks_per_col() const { return m_num_blocks_per_col; }
        std::string num_pixels_per_block_horz() const { return m_num_pixels_per_block_horz; }
        std::string num_pixels_per_block_vert() const { return m_num_pixels_per_block_vert; }
        std::string num_pixels_per_band() const { return m_num_pixels_per_band; }
        std::string img_display_level() const { return m_img_display_level; }
        std::string attachment_level() const { return m_attachment_level; }
        std::string img_location() const { return m_img_location; }
        std::string img_magnification() const { return m_img_magnification; }
        std::string user_def_img_data_len() const { return m_user_def_img_data_len; }
        std::string user_def_overflow() const { return m_user_def_overflow; }
        std::vector<uint8_t>* user_def_img_data() const { return m_user_def_img_data.get(); }
        tre_header_t* image_extended_sub_header() const { return m_image_extended_sub_header.get(); }
        nitf_t* _root() const { return m__root; }
        nitf_t::image_segment_t* _parent() const { return m__parent; }
    };

    class length_data_info_t : public kaitai::kstruct {

    public:

        length_data_info_t(kaitai::kstream* p__io, nitf_t::header_t* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~length_data_info_t();

    private:
        std::string m_length_data_extension_subheader;
        std::string m_length_data_extension_segment;
        nitf_t* m__root;
        nitf_t::header_t* m__parent;

    public:
        std::string length_data_extension_subheader() const { return m_length_data_extension_subheader; }
        std::string length_data_extension_segment() const { return m_length_data_extension_segment; }
        nitf_t* _root() const { return m__root; }
        nitf_t::header_t* _parent() const { return m__parent; }
    };

    class length_graphic_info_t : public kaitai::kstruct {

    public:

        length_graphic_info_t(kaitai::kstream* p__io, nitf_t::header_t* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~length_graphic_info_t();

    private:
        std::string m_length_graphic_subheader;
        std::string m_length_graphic_segment;
        nitf_t* m__root;
        nitf_t::header_t* m__parent;

    public:
        std::string length_graphic_subheader() const { return m_length_graphic_subheader; }
        std::string length_graphic_segment() const { return m_length_graphic_segment; }
        nitf_t* _root() const { return m__root; }
        nitf_t::header_t* _parent() const { return m__parent; }
    };

    class length_image_info_t : public kaitai::kstruct {

    public:

        length_image_info_t(kaitai::kstream* p__io, nitf_t::header_t* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~length_image_info_t();

    private:
        std::string m_length_image_subheader;
        std::string m_length_image_segment;
        nitf_t* m__root;
        nitf_t::header_t* m__parent;

    public:
        std::string length_image_subheader() const { return m_length_image_subheader; }
        std::string length_image_segment() const { return m_length_image_segment; }
        nitf_t* _root() const { return m__root; }
        nitf_t::header_t* _parent() const { return m__parent; }
    };

    class length_reserved_info_t : public kaitai::kstruct {

    public:

        length_reserved_info_t(kaitai::kstream* p__io, nitf_t::header_t* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~length_reserved_info_t();

    private:
        std::string m_length_reserved_extension_subheader;
        std::string m_length_reserved_extension_segment;
        nitf_t* m__root;
        nitf_t::header_t* m__parent;

    public:
        std::string length_reserved_extension_subheader() const { return m_length_reserved_extension_subheader; }
        std::string length_reserved_extension_segment() const { return m_length_reserved_extension_segment; }
        nitf_t* _root() const { return m__root; }
        nitf_t::header_t* _parent() const { return m__parent; }
    };

    class length_text_info_t : public kaitai::kstruct {

    public:

        length_text_info_t(kaitai::kstream* p__io, nitf_t::header_t* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~length_text_info_t();

    private:
        std::string m_length_text_subheader;
        std::string m_length_text_segment;
        nitf_t* m__root;
        nitf_t::header_t* m__parent;

    public:
        std::string length_text_subheader() const { return m_length_text_subheader; }
        std::string length_text_segment() const { return m_length_text_segment; }
        nitf_t* _root() const { return m__root; }
        nitf_t::header_t* _parent() const { return m__parent; }
    };

    class reserved_extension_segment_t : public kaitai::kstruct {

    public:

        reserved_extension_segment_t(uint16_t p_idx, kaitai::kstream* p__io, nitf_t* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~reserved_extension_segment_t();

    private:
        std::unique_ptr<reserved_sub_header_t> m_reserved_sub_header;
        std::string m_reserved_data_field;
        uint16_t m_idx;
        nitf_t* m__root;
        nitf_t* m__parent;
        std::string m__raw_reserved_sub_header;
        std::unique_ptr<kaitai::kstream> m__io__raw_reserved_sub_header;

    public:
        reserved_sub_header_t* reserved_sub_header() const { return m_reserved_sub_header.get(); }
        std::string reserved_data_field() const { return m_reserved_data_field; }
        uint16_t idx() const { return m_idx; }
        nitf_t* _root() const { return m__root; }
        nitf_t* _parent() const { return m__parent; }
        std::string _raw_reserved_sub_header() const { return m__raw_reserved_sub_header; }
        kaitai::kstream* _io__raw_reserved_sub_header() const { return m__io__raw_reserved_sub_header.get(); }
    };

    class reserved_sub_header_t : public kaitai::kstruct {

    public:

        reserved_sub_header_t(kaitai::kstream* p__io, nitf_t::reserved_extension_segment_t* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~reserved_sub_header_t();

    private:
        std::string m_file_part_type_re;
        std::string m_res_type_id;
        std::string m_res_version;
        std::unique_ptr<clasnfo_t> m_reclasnfo;
        std::string m_res_user_defined_subheader_length;
        std::string m_res_user_defined_subheader_fields;
        std::string m_res_user_defined_data;
        nitf_t* m__root;
        nitf_t::reserved_extension_segment_t* m__parent;

    public:
        std::string file_part_type_re() const { return m_file_part_type_re; }
        std::string res_type_id() const { return m_res_type_id; }
        std::string res_version() const { return m_res_version; }
        clasnfo_t* reclasnfo() const { return m_reclasnfo.get(); }
        std::string res_user_defined_subheader_length() const { return m_res_user_defined_subheader_length; }
        std::string res_user_defined_subheader_fields() const { return m_res_user_defined_subheader_fields; }
        std::string res_user_defined_data() const { return m_res_user_defined_data; }
        nitf_t* _root() const { return m__root; }
        nitf_t::reserved_extension_segment_t* _parent() const { return m__parent; }
    };

    class text_segment_t : public kaitai::kstruct {

    public:

        text_segment_t(uint16_t p_idx, kaitai::kstream* p__io, nitf_t* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~text_segment_t();

    private:
        std::string m_text_sub_header;
        std::string m_text_data_field;
        uint16_t m_idx;
        nitf_t* m__root;
        nitf_t* m__parent;

    public:
        std::string text_sub_header() const { return m_text_sub_header; }
        std::string text_data_field() const { return m_text_data_field; }
        uint16_t idx() const { return m_idx; }
        nitf_t* _root() const { return m__root; }
        nitf_t* _parent() const { return m__parent; }
    };

    class text_sub_header_t : public kaitai::kstruct {

    public:

        text_sub_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~text_sub_header_t();

    private:
        std::string m_text_date_time;
        std::string m_text_title;
        std::unique_ptr<clasnfo_t> m_text_security_class;
        std::unique_ptr<encrypt_t> m_encryp;
        std::string m_text_format;
        std::unique_ptr<tre_header_t> m_text_extended_sub_header;
        nitf_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        std::string text_date_time() const { return m_text_date_time; }
        std::string text_title() const { return m_text_title; }
        clasnfo_t* text_security_class() const { return m_text_security_class.get(); }
        encrypt_t* encryp() const { return m_encryp.get(); }

        /**
         * MTF (USMTF see MIL-STD-6040), STA (indicates BCS), UT1 (indicates ECS), U8S
         */
        std::string text_format() const { return m_text_format; }
        tre_header_t* text_extended_sub_header() const { return m_text_extended_sub_header.get(); }
        nitf_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class tre_t : public kaitai::kstruct {

    public:

        tre_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~tre_t();

    private:
        std::string m_extension_type_id;
        std::string m_edata_length;
        std::string m_edata;
        nitf_t* m__root;
        kaitai::kstruct* m__parent;

    public:

        /**
         * RETAG or CETAG
         */
        std::string extension_type_id() const { return m_extension_type_id; }

        /**
         * REL or CEL
         */
        std::string edata_length() const { return m_edata_length; }

        /**
         * REDATA or CEDATA
         */
        std::string edata() const { return m_edata; }
        nitf_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class tre_header_t : public kaitai::kstruct {

    public:

        tre_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, nitf_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~tre_header_t();

    private:
        std::string m_header_data_length;
        std::string m_header_overflow;
        bool n_header_overflow;

    public:
        bool _is_null_header_overflow() { header_overflow(); return n_header_overflow; };

    private:
        std::unique_ptr<std::vector<uint8_t>> m_header_data;
        bool n_header_data;

    public:
        bool _is_null_header_data() { header_data(); return n_header_data; };

    private:
        nitf_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        std::string header_data_length() const { return m_header_data_length; }
        std::string header_overflow() const { return m_header_overflow; }
        std::vector<uint8_t>* header_data() const { return m_header_data.get(); }
        nitf_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

private:
    std::unique_ptr<header_t> m_header;
    std::unique_ptr<std::vector<std::unique_ptr<image_segment_t>>> m_image_segments;
    std::unique_ptr<std::vector<std::unique_ptr<graphics_segment_t>>> m_graphics_segments;
    std::unique_ptr<std::vector<std::unique_ptr<text_segment_t>>> m_text_segments;
    std::unique_ptr<std::vector<std::unique_ptr<data_extension_segment_t>>> m_data_extension_segments;
    std::unique_ptr<std::vector<std::unique_ptr<reserved_extension_segment_t>>> m_reserved_extension_segments;
    nitf_t* m__root;
    kaitai::kstruct* m__parent;

public:
    header_t* header() const { return m_header.get(); }
    std::vector<std::unique_ptr<image_segment_t>>* image_segments() const { return m_image_segments.get(); }
    std::vector<std::unique_ptr<graphics_segment_t>>* graphics_segments() const { return m_graphics_segments.get(); }
    std::vector<std::unique_ptr<text_segment_t>>* text_segments() const { return m_text_segments.get(); }
    std::vector<std::unique_ptr<data_extension_segment_t>>* data_extension_segments() const { return m_data_extension_segments.get(); }
    std::vector<std::unique_ptr<reserved_extension_segment_t>>* reserved_extension_segments() const { return m_reserved_extension_segments.get(); }
    nitf_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#ifndef NT_MDT_H_
#define NT_MDT_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

/**
 * A native file format of NT-MDT scientific software. Usually contains
 * any of:
 * 
 * * [Scanning probe](https://en.wikipedia.org/wiki/Scanning_probe_microscopy) microscopy scans and spectra
 * * [Raman spectra](https://en.wikipedia.org/wiki/Raman_spectroscopy)
 * * results of their analysis
 * 
 * Some examples of mdt files can be downloaded at:
 * 
 * * http://www.ntmdt-si.ru/scan-gallery
 * * http://callistosoft.narod.ru/Resources/Mdt.zip
 * \sa Source
 */

class nt_mdt_t : public kaitai::kstruct {

public:
    class uuid_t;
    class framez_t;
    class frame_t;
    class version_t;
    class xml_t;
    class title_t;

    enum adc_mode_t {
        ADC_MODE_HEIGHT = 0,
        ADC_MODE_DFL = 1,
        ADC_MODE_LATERAL_F = 2,
        ADC_MODE_BIAS_V = 3,
        ADC_MODE_CURRENT = 4,
        ADC_MODE_FB_OUT = 5,
        ADC_MODE_MAG = 6,
        ADC_MODE_MAG_SIN = 7,
        ADC_MODE_MAG_COS = 8,
        ADC_MODE_RMS = 9,
        ADC_MODE_CALC_MAG = 10,
        ADC_MODE_PHASE1 = 11,
        ADC_MODE_PHASE2 = 12,
        ADC_MODE_CALC_PHASE = 13,
        ADC_MODE_EX1 = 14,
        ADC_MODE_EX2 = 15,
        ADC_MODE_HV_X = 16,
        ADC_MODE_HV_Y = 17,
        ADC_MODE_SNAP_BACK = 18,
        ADC_MODE_FALSE = 255
    };

    enum xml_scan_location_t {
        XML_SCAN_LOCATION_HLT = 0,
        XML_SCAN_LOCATION_HLB = 1,
        XML_SCAN_LOCATION_HRT = 2,
        XML_SCAN_LOCATION_HRB = 3,
        XML_SCAN_LOCATION_VLT = 4,
        XML_SCAN_LOCATION_VLB = 5,
        XML_SCAN_LOCATION_VRT = 6,
        XML_SCAN_LOCATION_VRB = 7
    };

    enum data_type_t {
        DATA_TYPE_FLOATFIX = -65544,
        DATA_TYPE_FLOAT80 = -16138,
        DATA_TYPE_FLOAT64 = -13320,
        DATA_TYPE_FLOAT48 = -9990,
        DATA_TYPE_FLOAT32 = -5892,
        DATA_TYPE_INT64 = -8,
        DATA_TYPE_INT32 = -4,
        DATA_TYPE_INT16 = -2,
        DATA_TYPE_INT8 = -1,
        DATA_TYPE_UNKNOWN0 = 0,
        DATA_TYPE_UINT8 = 1,
        DATA_TYPE_UINT16 = 2,
        DATA_TYPE_UINT32 = 4,
        DATA_TYPE_UINT64 = 8
    };

    enum xml_param_type_t {
        XML_PARAM_TYPE_NONE = 0,
        XML_PARAM_TYPE_LASER_WAVELENGTH = 1,
        XML_PARAM_TYPE_UNITS = 2,
        XML_PARAM_TYPE_DATA_ARRAY = 255
    };

    enum spm_mode_t {
        SPM_MODE_CONSTANT_FORCE = 0,
        SPM_MODE_CONTACT_CONSTANT_HEIGHT = 1,
        SPM_MODE_CONTACT_ERROR = 2,
        SPM_MODE_LATERAL_FORCE = 3,
        SPM_MODE_FORCE_MODULATION = 4,
        SPM_MODE_SPREADING_RESISTANCE_IMAGING = 5,
        SPM_MODE_SEMICONTACT_TOPOGRAPHY = 6,
        SPM_MODE_SEMICONTACT_ERROR = 7,
        SPM_MODE_PHASE_CONTRAST = 8,
        SPM_MODE_AC_MAGNETIC_FORCE = 9,
        SPM_MODE_DC_MAGNETIC_FORCE = 10,
        SPM_MODE_ELECTROSTATIC_FORCE = 11,
        SPM_MODE_CAPACITANCE_CONTRAST = 12,
        SPM_MODE_KELVIN_PROBE = 13,
        SPM_MODE_CONSTANT_CURRENT = 14,
        SPM_MODE_BARRIER_HEIGHT = 15,
        SPM_MODE_CONSTANT_HEIGHT = 16,
        SPM_MODE_AFAM = 17,
        SPM_MODE_CONTACT_EFM = 18,
        SPM_MODE_SHEAR_FORCE_TOPOGRAPHY = 19,
        SPM_MODE_SFOM = 20,
        SPM_MODE_CONTACT_CAPACITANCE = 21,
        SPM_MODE_SNOM_TRANSMISSION = 22,
        SPM_MODE_SNOM_REFLECTION = 23,
        SPM_MODE_SNOM_ALL = 24,
        SPM_MODE_SNOM = 25
    };

    enum unit_t {
        UNIT_RAMAN_SHIFT = -10,
        UNIT_RESERVED0 = -9,
        UNIT_RESERVED1 = -8,
        UNIT_RESERVED2 = -7,
        UNIT_RESERVED3 = -6,
        UNIT_METER = -5,
        UNIT_CENTI_METER = -4,
        UNIT_MILLI_METER = -3,
        UNIT_MICRO_METER = -2,
        UNIT_NANO_METER = -1,
        UNIT_ANGSTROM = 0,
        UNIT_NANO_AMPERE = 1,
        UNIT_VOLT = 2,
        UNIT_NONE = 3,
        UNIT_KILO_HERTZ = 4,
        UNIT_DEGREES = 5,
        UNIT_PERCENT = 6,
        UNIT_CELSIUS_DEGREE = 7,
        UNIT_VOLT_HIGH = 8,
        UNIT_SECOND = 9,
        UNIT_MILLI_SECOND = 10,
        UNIT_MICRO_SECOND = 11,
        UNIT_NANO_SECOND = 12,
        UNIT_COUNTS = 13,
        UNIT_PIXELS = 14,
        UNIT_RESERVED_SFOM0 = 15,
        UNIT_RESERVED_SFOM1 = 16,
        UNIT_RESERVED_SFOM2 = 17,
        UNIT_RESERVED_SFOM3 = 18,
        UNIT_RESERVED_SFOM4 = 19,
        UNIT_AMPERE2 = 20,
        UNIT_MILLI_AMPERE = 21,
        UNIT_MICRO_AMPERE = 22,
        UNIT_NANO_AMPERE2 = 23,
        UNIT_PICO_AMPERE = 24,
        UNIT_VOLT2 = 25,
        UNIT_MILLI_VOLT = 26,
        UNIT_MICRO_VOLT = 27,
        UNIT_NANO_VOLT = 28,
        UNIT_PICO_VOLT = 29,
        UNIT_NEWTON = 30,
        UNIT_MILLI_NEWTON = 31,
        UNIT_MICRO_NEWTON = 32,
        UNIT_NANO_NEWTON = 33,
        UNIT_PICO_NEWTON = 34,
        UNIT_RESERVED_DOS0 = 35,
        UNIT_RESERVED_DOS1 = 36,
        UNIT_RESERVED_DOS2 = 37,
        UNIT_RESERVED_DOS3 = 38,
        UNIT_RESERVED_DOS4 = 39
    };

    enum spm_technique_t {
        SPM_TECHNIQUE_CONTACT_MODE = 0,
        SPM_TECHNIQUE_SEMICONTACT_MODE = 1,
        SPM_TECHNIQUE_TUNNEL_CURRENT = 2,
        SPM_TECHNIQUE_SNOM = 3
    };

    enum consts_t {
        CONSTS_FRAME_MODE_SIZE = 8,
        CONSTS_FRAME_HEADER_SIZE = 22,
        CONSTS_AXIS_SCALES_SIZE = 30,
        CONSTS_FILE_HEADER_SIZE = 32,
        CONSTS_SPECTRO_VARS_MIN_SIZE = 38,
        CONSTS_SCAN_VARS_MIN_SIZE = 77
    };

    nt_mdt_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, nt_mdt_t* p__root = 0);

private:
    void _read();

public:
    ~nt_mdt_t();

    class uuid_t : public kaitai::kstruct {

    public:

        uuid_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::fd_meta_data_t* p__parent = 0, nt_mdt_t* p__root = 0);

    private:
        void _read();

    public:
        ~uuid_t();

    private:
        std::vector<uint8_t>* m_data;
        nt_mdt_t* m__root;
        nt_mdt_t::frame_t::fd_meta_data_t* m__parent;

    public:
        std::vector<uint8_t>* data() const { return m_data; }
        nt_mdt_t* _root() const { return m__root; }
        nt_mdt_t::frame_t::fd_meta_data_t* _parent() const { return m__parent; }
    };

    class framez_t : public kaitai::kstruct {

    public:

        framez_t(kaitai::kstream* p__io, nt_mdt_t* p__parent = 0, nt_mdt_t* p__root = 0);

    private:
        void _read();

    public:
        ~framez_t();

    private:
        std::vector<frame_t*>* m_frames;
        nt_mdt_t* m__root;
        nt_mdt_t* m__parent;

    public:
        std::vector<frame_t*>* frames() const { return m_frames; }
        nt_mdt_t* _root() const { return m__root; }
        nt_mdt_t* _parent() const { return m__parent; }
    };

    class frame_t : public kaitai::kstruct {

    public:
        class dots_t;
        class frame_main_t;
        class fd_curves_new_t;
        class fd_meta_data_t;
        class fd_spectroscopy_t;
        class date_time_t;
        class axis_scale_t;
        class fd_scanned_t;

        enum frame_type_t {
            FRAME_TYPE_SCANNED = 0,
            FRAME_TYPE_SPECTROSCOPY = 1,
            FRAME_TYPE_TEXT = 3,
            FRAME_TYPE_OLD_MDA = 105,
            FRAME_TYPE_MDA = 106,
            FRAME_TYPE_PALETTE = 107,
            FRAME_TYPE_CURVES_NEW = 190,
            FRAME_TYPE_CURVES = 201
        };

        frame_t(kaitai::kstream* p__io, nt_mdt_t::framez_t* p__parent = 0, nt_mdt_t* p__root = 0);

    private:
        void _read();

    public:
        ~frame_t();

        class dots_t : public kaitai::kstruct {

        public:
            class dots_header_t;
            class dots_data_t;
            class data_linez_t;

            dots_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, nt_mdt_t* p__root = 0);

        private:
            void _read();

        public:
            ~dots_t();

            class dots_header_t : public kaitai::kstruct {

            public:
                class header__t;

                dots_header_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::dots_t* p__parent = 0, nt_mdt_t* p__root = 0);

            private:
                void _read();

            public:
                ~dots_header_t();

                class header__t : public kaitai::kstruct {

                public:

                    header__t(kaitai::kstream* p__io, nt_mdt_t::frame_t::dots_t::dots_header_t* p__parent = 0, nt_mdt_t* p__root = 0);

                private:
                    void _read();

                public:
                    ~header__t();

                private:
                    int32_t m_coord_size;
                    int32_t m_version;
                    unit_t m_xyunits;
                    nt_mdt_t* m__root;
                    nt_mdt_t::frame_t::dots_t::dots_header_t* m__parent;

                public:
                    int32_t coord_size() const { return m_coord_size; }
                    int32_t version() const { return m_version; }
                    unit_t xyunits() const { return m_xyunits; }
                    nt_mdt_t* _root() const { return m__root; }
                    nt_mdt_t::frame_t::dots_t::dots_header_t* _parent() const { return m__parent; }
                };

            private:
                int32_t m_header_size;
                header__t* m_header;
                nt_mdt_t* m__root;
                nt_mdt_t::frame_t::dots_t* m__parent;
                std::string m__raw_header;
                kaitai::kstream* m__io__raw_header;

            public:
                int32_t header_size() const { return m_header_size; }
                header__t* header() const { return m_header; }
                nt_mdt_t* _root() const { return m__root; }
                nt_mdt_t::frame_t::dots_t* _parent() const { return m__parent; }
                std::string _raw_header() const { return m__raw_header; }
                kaitai::kstream* _io__raw_header() const { return m__io__raw_header; }
            };

            class dots_data_t : public kaitai::kstruct {

            public:

                dots_data_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::dots_t* p__parent = 0, nt_mdt_t* p__root = 0);

            private:
                void _read();

            public:
                ~dots_data_t();

            private:
                float m_coord_x;
                float m_coord_y;
                int32_t m_forward_size;
                int32_t m_backward_size;
                nt_mdt_t* m__root;
                nt_mdt_t::frame_t::dots_t* m__parent;

            public:
                float coord_x() const { return m_coord_x; }
                float coord_y() const { return m_coord_y; }
                int32_t forward_size() const { return m_forward_size; }
                int32_t backward_size() const { return m_backward_size; }
                nt_mdt_t* _root() const { return m__root; }
                nt_mdt_t::frame_t::dots_t* _parent() const { return m__parent; }
            };

            class data_linez_t : public kaitai::kstruct {

            public:

                data_linez_t(uint16_t p_index, kaitai::kstream* p__io, nt_mdt_t::frame_t::dots_t* p__parent = 0, nt_mdt_t* p__root = 0);

            private:
                void _read();

            public:
                ~data_linez_t();

            private:
                std::vector<int16_t>* m_forward;
                std::vector<int16_t>* m_backward;
                uint16_t m_index;
                nt_mdt_t* m__root;
                nt_mdt_t::frame_t::dots_t* m__parent;

            public:
                std::vector<int16_t>* forward() const { return m_forward; }
                std::vector<int16_t>* backward() const { return m_backward; }
                uint16_t index() const { return m_index; }
                nt_mdt_t* _root() const { return m__root; }
                nt_mdt_t::frame_t::dots_t* _parent() const { return m__parent; }
            };

        private:
            uint16_t m_fm_ndots;
            dots_header_t* m_coord_header;
            bool n_coord_header;

        public:
            bool _is_null_coord_header() { coord_header(); return n_coord_header; };

        private:
            std::vector<dots_data_t*>* m_coordinates;
            std::vector<data_linez_t*>* m_data;
            nt_mdt_t* m__root;
            kaitai::kstruct* m__parent;

        public:
            uint16_t fm_ndots() const { return m_fm_ndots; }
            dots_header_t* coord_header() const { return m_coord_header; }
            std::vector<dots_data_t*>* coordinates() const { return m_coordinates; }
            std::vector<data_linez_t*>* data() const { return m_data; }
            nt_mdt_t* _root() const { return m__root; }
            kaitai::kstruct* _parent() const { return m__parent; }
        };

        class frame_main_t : public kaitai::kstruct {

        public:

            frame_main_t(kaitai::kstream* p__io, nt_mdt_t::frame_t* p__parent = 0, nt_mdt_t* p__root = 0);

        private:
            void _read();

        public:
            ~frame_main_t();

        private:
            frame_type_t m_type;
            version_t* m_version;
            date_time_t* m_date_time;
            uint16_t m_var_size;
            kaitai::kstruct* m_frame_data;
            bool n_frame_data;

        public:
            bool _is_null_frame_data() { frame_data(); return n_frame_data; };

        private:
            nt_mdt_t* m__root;
            nt_mdt_t::frame_t* m__parent;
            std::string m__raw_frame_data;
            kaitai::kstream* m__io__raw_frame_data;

        public:

            /**
             * h_what
             */
            frame_type_t type() const { return m_type; }
            version_t* version() const { return m_version; }
            date_time_t* date_time() const { return m_date_time; }

            /**
             * h_am, v6 and older only
             */
            uint16_t var_size() const { return m_var_size; }

            /**
             * 
             */
            kaitai::kstruct* frame_data() const { return m_frame_data; }
            nt_mdt_t* _root() const { return m__root; }
            nt_mdt_t::frame_t* _parent() const { return m__parent; }
            std::string _raw_frame_data() const { return m__raw_frame_data; }
            kaitai::kstream* _io__raw_frame_data() const { return m__io__raw_frame_data; }
        };

        class fd_curves_new_t : public kaitai::kstruct {

        public:
            class block_descr_t;

            fd_curves_new_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::frame_main_t* p__parent = 0, nt_mdt_t* p__root = 0);

        private:
            void _read();

        public:
            ~fd_curves_new_t();

            class block_descr_t : public kaitai::kstruct {

            public:

                block_descr_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::fd_curves_new_t* p__parent = 0, nt_mdt_t* p__root = 0);

            private:
                void _read();

            public:
                ~block_descr_t();

            private:
                uint32_t m_name_len;
                uint32_t m_len;
                nt_mdt_t* m__root;
                nt_mdt_t::frame_t::fd_curves_new_t* m__parent;

            public:
                uint32_t name_len() const { return m_name_len; }
                uint32_t len() const { return m_len; }
                nt_mdt_t* _root() const { return m__root; }
                nt_mdt_t::frame_t::fd_curves_new_t* _parent() const { return m__parent; }
            };

        private:
            uint32_t m_block_count;
            std::vector<block_descr_t*>* m_blocks_headers;
            std::vector<std::string>* m_blocks_names;
            std::vector<std::string>* m_blocks_data;
            nt_mdt_t* m__root;
            nt_mdt_t::frame_t::frame_main_t* m__parent;

        public:
            uint32_t block_count() const { return m_block_count; }
            std::vector<block_descr_t*>* blocks_headers() const { return m_blocks_headers; }
            std::vector<std::string>* blocks_names() const { return m_blocks_names; }
            std::vector<std::string>* blocks_data() const { return m_blocks_data; }
            nt_mdt_t* _root() const { return m__root; }
            nt_mdt_t::frame_t::frame_main_t* _parent() const { return m__parent; }
        };

        class fd_meta_data_t : public kaitai::kstruct {

        public:
            class image_t;
            class calibration_t;

            fd_meta_data_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::frame_main_t* p__parent = 0, nt_mdt_t* p__root = 0);

        private:
            void _read();

        public:
            ~fd_meta_data_t();

            class image_t : public kaitai::kstruct {

            public:
                class vec_t;

                image_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::fd_meta_data_t* p__parent = 0, nt_mdt_t* p__root = 0);

            private:
                void _read();

            public:
                ~image_t();

                class vec_t : public kaitai::kstruct {

                public:

                    vec_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::fd_meta_data_t::image_t* p__parent = 0, nt_mdt_t* p__root = 0);

                private:
                    void _read();

                public:
                    ~vec_t();

                private:
                    std::vector<double>* m_items;
                    bool n_items;

                public:
                    bool _is_null_items() { items(); return n_items; };

                private:
                    nt_mdt_t* m__root;
                    nt_mdt_t::frame_t::fd_meta_data_t::image_t* m__parent;

                public:
                    std::vector<double>* items() const { return m_items; }
                    nt_mdt_t* _root() const { return m__root; }
                    nt_mdt_t::frame_t::fd_meta_data_t::image_t* _parent() const { return m__parent; }
                };

            private:
                std::vector<vec_t*>* m_image;
                nt_mdt_t* m__root;
                nt_mdt_t::frame_t::fd_meta_data_t* m__parent;

            public:
                std::vector<vec_t*>* image() const { return m_image; }
                nt_mdt_t* _root() const { return m__root; }
                nt_mdt_t::frame_t::fd_meta_data_t* _parent() const { return m__parent; }
            };

            class calibration_t : public kaitai::kstruct {

            public:

                calibration_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::fd_meta_data_t* p__parent = 0, nt_mdt_t* p__root = 0);

            private:
                void _read();

            public:
                ~calibration_t();

            private:
                bool f_count;
                int32_t m_count;

            public:
                int32_t count();

            private:
                uint32_t m_len_tot;
                uint32_t m_len_struct;
                uint32_t m_len_name;
                uint32_t m_len_comment;
                uint32_t m_len_unit;
                uint64_t m_si_unit;
                double m_accuracy;
                uint64_t m_function_id_and_dimensions;
                double m_bias;
                double m_scale;
                uint64_t m_min_index;
                uint64_t m_max_index;
                data_type_t m_data_type;
                uint32_t m_len_author;
                std::string m_name;
                std::string m_comment;
                std::string m_unit;
                std::string m_author;
                nt_mdt_t* m__root;
                nt_mdt_t::frame_t::fd_meta_data_t* m__parent;

            public:
                uint32_t len_tot() const { return m_len_tot; }
                uint32_t len_struct() const { return m_len_struct; }
                uint32_t len_name() const { return m_len_name; }
                uint32_t len_comment() const { return m_len_comment; }
                uint32_t len_unit() const { return m_len_unit; }
                uint64_t si_unit() const { return m_si_unit; }
                double accuracy() const { return m_accuracy; }
                uint64_t function_id_and_dimensions() const { return m_function_id_and_dimensions; }
                double bias() const { return m_bias; }
                double scale() const { return m_scale; }
                uint64_t min_index() const { return m_min_index; }
                uint64_t max_index() const { return m_max_index; }
                data_type_t data_type() const { return m_data_type; }
                uint32_t len_author() const { return m_len_author; }
                std::string name() const { return m_name; }
                std::string comment() const { return m_comment; }
                std::string unit() const { return m_unit; }
                std::string author() const { return m_author; }
                nt_mdt_t* _root() const { return m__root; }
                nt_mdt_t::frame_t::fd_meta_data_t* _parent() const { return m__parent; }
            };

        private:
            bool f_image;
            image_t* m_image;

        public:
            image_t* image();

        private:
            uint32_t m_head_size;
            uint32_t m_tot_len;
            std::vector<uuid_t*>* m_guids;
            std::string m_frame_status;
            uint32_t m_name_size;
            uint32_t m_comm_size;
            uint32_t m_view_info_size;
            uint32_t m_spec_size;
            uint32_t m_source_info_size;
            uint32_t m_var_size;
            uint32_t m_data_offset;
            uint32_t m_data_size;
            std::string m_title;
            std::string m_xml;
            uint32_t m_struct_len;
            uint64_t m_array_size;
            uint32_t m_cell_size;
            uint32_t m_n_dimensions;
            uint32_t m_n_mesurands;
            std::vector<calibration_t*>* m_dimensions;
            std::vector<calibration_t*>* m_mesurands;
            nt_mdt_t* m__root;
            nt_mdt_t::frame_t::frame_main_t* m__parent;
            std::string m__raw_image;
            kaitai::kstream* m__io__raw_image;

        public:
            uint32_t head_size() const { return m_head_size; }
            uint32_t tot_len() const { return m_tot_len; }
            std::vector<uuid_t*>* guids() const { return m_guids; }
            std::string frame_status() const { return m_frame_status; }
            uint32_t name_size() const { return m_name_size; }
            uint32_t comm_size() const { return m_comm_size; }
            uint32_t view_info_size() const { return m_view_info_size; }
            uint32_t spec_size() const { return m_spec_size; }
            uint32_t source_info_size() const { return m_source_info_size; }
            uint32_t var_size() const { return m_var_size; }
            uint32_t data_offset() const { return m_data_offset; }
            uint32_t data_size() const { return m_data_size; }
            std::string title() const { return m_title; }
            std::string xml() const { return m_xml; }
            uint32_t struct_len() const { return m_struct_len; }
            uint64_t array_size() const { return m_array_size; }
            uint32_t cell_size() const { return m_cell_size; }
            uint32_t n_dimensions() const { return m_n_dimensions; }
            uint32_t n_mesurands() const { return m_n_mesurands; }
            std::vector<calibration_t*>* dimensions() const { return m_dimensions; }
            std::vector<calibration_t*>* mesurands() const { return m_mesurands; }
            nt_mdt_t* _root() const { return m__root; }
            nt_mdt_t::frame_t::frame_main_t* _parent() const { return m__parent; }
            std::string _raw_image() const { return m__raw_image; }
            kaitai::kstream* _io__raw_image() const { return m__io__raw_image; }
        };

        class fd_spectroscopy_t : public kaitai::kstruct {

        public:
            class vars_t;

            fd_spectroscopy_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::frame_main_t* p__parent = 0, nt_mdt_t* p__root = 0);

        private:
            void _read();

        public:
            ~fd_spectroscopy_t();

            class vars_t : public kaitai::kstruct {

            public:

                vars_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::fd_spectroscopy_t* p__parent = 0, nt_mdt_t* p__root = 0);

            private:
                void _read();

            public:
                ~vars_t();

            private:
                axis_scale_t* m_x_scale;
                axis_scale_t* m_y_scale;
                axis_scale_t* m_z_scale;
                uint16_t m_sp_mode;
                uint16_t m_sp_filter;
                float m_u_begin;
                float m_u_end;
                int16_t m_z_up;
                int16_t m_z_down;
                uint16_t m_sp_averaging;
                uint8_t m_sp_repeat;
                uint8_t m_sp_back;
                int16_t m_sp_4nx;
                uint8_t m_sp_osc;
                uint8_t m_sp_n4;
                float m_sp_4x0;
                float m_sp_4xr;
                int16_t m_sp_4u;
                int16_t m_sp_4i;
                int16_t m_sp_nx;
                nt_mdt_t* m__root;
                nt_mdt_t::frame_t::fd_spectroscopy_t* m__parent;

            public:
                axis_scale_t* x_scale() const { return m_x_scale; }
                axis_scale_t* y_scale() const { return m_y_scale; }
                axis_scale_t* z_scale() const { return m_z_scale; }
                uint16_t sp_mode() const { return m_sp_mode; }
                uint16_t sp_filter() const { return m_sp_filter; }
                float u_begin() const { return m_u_begin; }
                float u_end() const { return m_u_end; }
                int16_t z_up() const { return m_z_up; }
                int16_t z_down() const { return m_z_down; }
                uint16_t sp_averaging() const { return m_sp_averaging; }
                uint8_t sp_repeat() const { return m_sp_repeat; }
                uint8_t sp_back() const { return m_sp_back; }
                int16_t sp_4nx() const { return m_sp_4nx; }
                uint8_t sp_osc() const { return m_sp_osc; }
                uint8_t sp_n4() const { return m_sp_n4; }
                float sp_4x0() const { return m_sp_4x0; }
                float sp_4xr() const { return m_sp_4xr; }
                int16_t sp_4u() const { return m_sp_4u; }
                int16_t sp_4i() const { return m_sp_4i; }
                int16_t sp_nx() const { return m_sp_nx; }
                nt_mdt_t* _root() const { return m__root; }
                nt_mdt_t::frame_t::fd_spectroscopy_t* _parent() const { return m__parent; }
            };

        private:
            vars_t* m_vars;
            uint16_t m_fm_mode;
            uint16_t m_fm_xres;
            uint16_t m_fm_yres;
            dots_t* m_dots;
            std::vector<int16_t>* m_data;
            title_t* m_title;
            xml_t* m_xml;
            nt_mdt_t* m__root;
            nt_mdt_t::frame_t::frame_main_t* m__parent;
            std::string m__raw_vars;
            kaitai::kstream* m__io__raw_vars;

        public:
            vars_t* vars() const { return m_vars; }
            uint16_t fm_mode() const { return m_fm_mode; }
            uint16_t fm_xres() const { return m_fm_xres; }
            uint16_t fm_yres() const { return m_fm_yres; }
            dots_t* dots() const { return m_dots; }
            std::vector<int16_t>* data() const { return m_data; }
            title_t* title() const { return m_title; }
            xml_t* xml() const { return m_xml; }
            nt_mdt_t* _root() const { return m__root; }
            nt_mdt_t::frame_t::frame_main_t* _parent() const { return m__parent; }
            std::string _raw_vars() const { return m__raw_vars; }
            kaitai::kstream* _io__raw_vars() const { return m__io__raw_vars; }
        };

        class date_time_t : public kaitai::kstruct {

        public:
            class date_t;
            class time_t;

            date_time_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::frame_main_t* p__parent = 0, nt_mdt_t* p__root = 0);

        private:
            void _read();

        public:
            ~date_time_t();

            class date_t : public kaitai::kstruct {

            public:

                date_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::date_time_t* p__parent = 0, nt_mdt_t* p__root = 0);

            private:
                void _read();

            public:
                ~date_t();

            private:
                uint16_t m_year;
                uint16_t m_month;
                uint16_t m_day;
                nt_mdt_t* m__root;
                nt_mdt_t::frame_t::date_time_t* m__parent;

            public:

                /**
                 * h_yea
                 */
                uint16_t year() const { return m_year; }

                /**
                 * h_mon
                 */
                uint16_t month() const { return m_month; }

                /**
                 * h_day
                 */
                uint16_t day() const { return m_day; }
                nt_mdt_t* _root() const { return m__root; }
                nt_mdt_t::frame_t::date_time_t* _parent() const { return m__parent; }
            };

            class time_t : public kaitai::kstruct {

            public:

                time_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::date_time_t* p__parent = 0, nt_mdt_t* p__root = 0);

            private:
                void _read();

            public:
                ~time_t();

            private:
                uint16_t m_hour;
                uint16_t m_min;
                uint16_t m_sec;
                nt_mdt_t* m__root;
                nt_mdt_t::frame_t::date_time_t* m__parent;

            public:

                /**
                 * h_h
                 */
                uint16_t hour() const { return m_hour; }

                /**
                 * h_m
                 */
                uint16_t min() const { return m_min; }

                /**
                 * h_s
                 */
                uint16_t sec() const { return m_sec; }
                nt_mdt_t* _root() const { return m__root; }
                nt_mdt_t::frame_t::date_time_t* _parent() const { return m__parent; }
            };

        private:
            date_t* m_date;
            time_t* m_time;
            nt_mdt_t* m__root;
            nt_mdt_t::frame_t::frame_main_t* m__parent;

        public:
            date_t* date() const { return m_date; }
            time_t* time() const { return m_time; }
            nt_mdt_t* _root() const { return m__root; }
            nt_mdt_t::frame_t::frame_main_t* _parent() const { return m__parent; }
        };

        class axis_scale_t : public kaitai::kstruct {

        public:

            axis_scale_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, nt_mdt_t* p__root = 0);

        private:
            void _read();

        public:
            ~axis_scale_t();

        private:
            float m_offset;
            float m_step;
            unit_t m_unit;
            nt_mdt_t* m__root;
            kaitai::kstruct* m__parent;

        public:

            /**
             * x_scale->offset = gwy_get_gfloat_le(&p);# r0 (physical units)
             */
            float offset() const { return m_offset; }

            /**
             * x_scale->step = gwy_get_gfloat_le(&p); r (physical units) x_scale->step = fabs(x_scale->step); if (!x_scale->step) {
             *   g_warning("x_scale.step == 0, changing to 1");
             *   x_scale->step = 1.0;
             * }
             */
            float step() const { return m_step; }

            /**
             * U
             */
            unit_t unit() const { return m_unit; }
            nt_mdt_t* _root() const { return m__root; }
            kaitai::kstruct* _parent() const { return m__parent; }
        };

        class fd_scanned_t : public kaitai::kstruct {

        public:
            class vars_t;
            class dot_t;
            class scan_dir_t;

            enum mode_t {
                MODE_STM = 0,
                MODE_AFM = 1,
                MODE_UNKNOWN2 = 2,
                MODE_UNKNOWN3 = 3,
                MODE_UNKNOWN4 = 4
            };

            enum input_signal_t {
                INPUT_SIGNAL_EXTENSION_SLOT = 0,
                INPUT_SIGNAL_BIAS_V = 1,
                INPUT_SIGNAL_GROUND = 2
            };

            enum lift_mode_t {
                LIFT_MODE_STEP = 0,
                LIFT_MODE_FINE = 1,
                LIFT_MODE_SLOPE = 2
            };

            fd_scanned_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::frame_main_t* p__parent = 0, nt_mdt_t* p__root = 0);

        private:
            void _read();

        public:
            ~fd_scanned_t();

            class vars_t : public kaitai::kstruct {

            public:

                vars_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::fd_scanned_t* p__parent = 0, nt_mdt_t* p__root = 0);

            private:
                void _read();

            public:
                ~vars_t();

            private:
                axis_scale_t* m_x_scale;
                axis_scale_t* m_y_scale;
                axis_scale_t* m_z_scale;
                adc_mode_t m_channel_index;
                mode_t m_mode;
                uint16_t m_xres;
                uint16_t m_yres;
                uint16_t m_ndacq;
                float m_step_length;
                uint16_t m_adt;
                uint8_t m_adc_gain_amp_log10;
                uint8_t m_adc_index;
                uint8_t m_input_signal_or_version;
                uint8_t m_substr_plane_order_or_pass_num;
                scan_dir_t* m_scan_dir;
                uint8_t m_power_of_2;
                float m_velocity;
                float m_setpoint;
                float m_bias_voltage;
                uint8_t m_draw;
                uint8_t m_reserved;
                int32_t m_xoff;
                int32_t m_yoff;
                uint8_t m_nl_corr;
                nt_mdt_t* m__root;
                nt_mdt_t::frame_t::fd_scanned_t* m__parent;

            public:
                axis_scale_t* x_scale() const { return m_x_scale; }
                axis_scale_t* y_scale() const { return m_y_scale; }
                axis_scale_t* z_scale() const { return m_z_scale; }

                /**
                 * s_mode
                 */
                adc_mode_t channel_index() const { return m_channel_index; }

                /**
                 * s_dev
                 */
                mode_t mode() const { return m_mode; }

                /**
                 * s_nx
                 */
                uint16_t xres() const { return m_xres; }

                /**
                 * s_ny
                 */
                uint16_t yres() const { return m_yres; }

                /**
                 * Step (DAC)
                 */
                uint16_t ndacq() const { return m_ndacq; }

                /**
                 * s_rs in Angstrom's (Angstrom*gwy_get_gfloat_le(&p))
                 */
                float step_length() const { return m_step_length; }

                /**
                 * s_adt
                 */
                uint16_t adt() const { return m_adt; }

                /**
                 * s_adc_a
                 */
                uint8_t adc_gain_amp_log10() const { return m_adc_gain_amp_log10; }

                /**
                 * ADC index
                 */
                uint8_t adc_index() const { return m_adc_index; }

                /**
                 * MDTInputSignal smp_in; s_smp_in (for signal) s_8xx (for version)
                 */
                uint8_t input_signal_or_version() const { return m_input_signal_or_version; }

                /**
                 * s_spl or z_03
                 */
                uint8_t substr_plane_order_or_pass_num() const { return m_substr_plane_order_or_pass_num; }

                /**
                 * s_xy TODO: interpretation
                 */
                scan_dir_t* scan_dir() const { return m_scan_dir; }

                /**
                 * s_2n (bool)
                 */
                uint8_t power_of_2() const { return m_power_of_2; }

                /**
                 * s_vel (Angstrom/second)
                 */
                float velocity() const { return m_velocity; }

                /**
                 * s_i0
                 */
                float setpoint() const { return m_setpoint; }

                /**
                 * s_ut
                 */
                float bias_voltage() const { return m_bias_voltage; }

                /**
                 * s_draw (bool)
                 */
                uint8_t draw() const { return m_draw; }
                uint8_t reserved() const { return m_reserved; }

                /**
                 * s_x00 (in DAC quants)
                 */
                int32_t xoff() const { return m_xoff; }

                /**
                 * s_y00 (in DAC quants)
                 */
                int32_t yoff() const { return m_yoff; }

                /**
                 * s_cor (bool)
                 */
                uint8_t nl_corr() const { return m_nl_corr; }
                nt_mdt_t* _root() const { return m__root; }
                nt_mdt_t::frame_t::fd_scanned_t* _parent() const { return m__parent; }
            };

            class dot_t : public kaitai::kstruct {

            public:

                dot_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, nt_mdt_t* p__root = 0);

            private:
                void _read();

            public:
                ~dot_t();

            private:
                int16_t m_x;
                int16_t m_y;
                nt_mdt_t* m__root;
                kaitai::kstruct* m__parent;

            public:
                int16_t x() const { return m_x; }
                int16_t y() const { return m_y; }
                nt_mdt_t* _root() const { return m__root; }
                kaitai::kstruct* _parent() const { return m__parent; }
            };

            class scan_dir_t : public kaitai::kstruct {

            public:

                scan_dir_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::fd_scanned_t::vars_t* p__parent = 0, nt_mdt_t* p__root = 0);

            private:
                void _read();

            public:
                ~scan_dir_t();

            private:
                uint64_t m_unkn;
                bool m_double_pass;
                bool m_bottom;
                bool m_left;
                bool m_horizontal;
                nt_mdt_t* m__root;
                nt_mdt_t::frame_t::fd_scanned_t::vars_t* m__parent;

            public:
                uint64_t unkn() const { return m_unkn; }
                bool double_pass() const { return m_double_pass; }

                /**
                 * Bottom - 1 Top - 0
                 */
                bool bottom() const { return m_bottom; }

                /**
                 * Left - 1 Right - 0
                 */
                bool left() const { return m_left; }

                /**
                 * Horizontal - 1 Vertical - 0
                 */
                bool horizontal() const { return m_horizontal; }
                nt_mdt_t* _root() const { return m__root; }
                nt_mdt_t::frame_t::fd_scanned_t::vars_t* _parent() const { return m__parent; }
            };

        private:
            vars_t* m_vars;
            uint32_t m_orig_format;
            bool n_orig_format;

        public:
            bool _is_null_orig_format() { orig_format(); return n_orig_format; };

        private:
            lift_mode_t m_tune;
            bool n_tune;

        public:
            bool _is_null_tune() { tune(); return n_tune; };

        private:
            double m_feedback_gain;
            bool n_feedback_gain;

        public:
            bool _is_null_feedback_gain() { feedback_gain(); return n_feedback_gain; };

        private:
            int32_t m_dac_scale;
            bool n_dac_scale;

        public:
            bool _is_null_dac_scale() { dac_scale(); return n_dac_scale; };

        private:
            int32_t m_overscan;
            bool n_overscan;

        public:
            bool _is_null_overscan() { overscan(); return n_overscan; };

        private:
            uint16_t m_fm_mode;
            uint16_t m_fm_xres;
            uint16_t m_fm_yres;
            dots_t* m_dots;
            std::vector<int16_t>* m_image;
            title_t* m_title;
            xml_t* m_xml;
            nt_mdt_t* m__root;
            nt_mdt_t::frame_t::frame_main_t* m__parent;
            std::string m__raw_vars;
            kaitai::kstream* m__io__raw_vars;

        public:
            vars_t* vars() const { return m_vars; }

            /**
             * s_oem
             */
            uint32_t orig_format() const { return m_orig_format; }

            /**
             * z_tune
             */
            lift_mode_t tune() const { return m_tune; }

            /**
             * s_fbg
             */
            double feedback_gain() const { return m_feedback_gain; }

            /**
             * s_s
             */
            int32_t dac_scale() const { return m_dac_scale; }

            /**
             * s_xov (in %)
             */
            int32_t overscan() const { return m_overscan; }

            /**
             * m_mode
             */
            uint16_t fm_mode() const { return m_fm_mode; }

            /**
             * m_nx
             */
            uint16_t fm_xres() const { return m_fm_xres; }

            /**
             * m_ny
             */
            uint16_t fm_yres() const { return m_fm_yres; }
            dots_t* dots() const { return m_dots; }
            std::vector<int16_t>* image() const { return m_image; }
            title_t* title() const { return m_title; }
            xml_t* xml() const { return m_xml; }
            nt_mdt_t* _root() const { return m__root; }
            nt_mdt_t::frame_t::frame_main_t* _parent() const { return m__parent; }
            std::string _raw_vars() const { return m__raw_vars; }
            kaitai::kstream* _io__raw_vars() const { return m__io__raw_vars; }
        };

    private:
        uint32_t m_size;
        frame_main_t* m_main;
        nt_mdt_t* m__root;
        nt_mdt_t::framez_t* m__parent;
        std::string m__raw_main;
        kaitai::kstream* m__io__raw_main;

    public:

        /**
         * h_sz
         */
        uint32_t size() const { return m_size; }
        frame_main_t* main() const { return m_main; }
        nt_mdt_t* _root() const { return m__root; }
        nt_mdt_t::framez_t* _parent() const { return m__parent; }
        std::string _raw_main() const { return m__raw_main; }
        kaitai::kstream* _io__raw_main() const { return m__io__raw_main; }
    };

    class version_t : public kaitai::kstruct {

    public:

        version_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::frame_main_t* p__parent = 0, nt_mdt_t* p__root = 0);

    private:
        void _read();

    public:
        ~version_t();

    private:
        uint8_t m_minor;
        uint8_t m_major;
        nt_mdt_t* m__root;
        nt_mdt_t::frame_t::frame_main_t* m__parent;

    public:
        uint8_t minor() const { return m_minor; }
        uint8_t major() const { return m_major; }
        nt_mdt_t* _root() const { return m__root; }
        nt_mdt_t::frame_t::frame_main_t* _parent() const { return m__parent; }
    };

    class xml_t : public kaitai::kstruct {

    public:

        xml_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, nt_mdt_t* p__root = 0);

    private:
        void _read();

    public:
        ~xml_t();

    private:
        uint32_t m_xml_len;
        std::string m_xml;
        nt_mdt_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint32_t xml_len() const { return m_xml_len; }
        std::string xml() const { return m_xml; }
        nt_mdt_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class title_t : public kaitai::kstruct {

    public:

        title_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, nt_mdt_t* p__root = 0);

    private:
        void _read();

    public:
        ~title_t();

    private:
        uint32_t m_title_len;
        std::string m_title;
        nt_mdt_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        uint32_t title_len() const { return m_title_len; }
        std::string title() const { return m_title; }
        nt_mdt_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

private:
    std::string m_signature;
    uint32_t m_size;
    std::string m_reserved0;
    uint16_t m_last_frame;
    std::string m_reserved1;
    std::string m_wrond_doc;
    framez_t* m_frames;
    nt_mdt_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_frames;
    kaitai::kstream* m__io__raw_frames;

public:
    std::string signature() const { return m_signature; }

    /**
     * File size (w/o header)
     */
    uint32_t size() const { return m_size; }
    std::string reserved0() const { return m_reserved0; }
    uint16_t last_frame() const { return m_last_frame; }
    std::string reserved1() const { return m_reserved1; }

    /**
     * documentation specifies 32 bytes long header, but zeroth frame starts at 33th byte in reality
     */
    std::string wrond_doc() const { return m_wrond_doc; }
    framez_t* frames() const { return m_frames; }
    nt_mdt_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_frames() const { return m__raw_frames; }
    kaitai::kstream* _io__raw_frames() const { return m__io__raw_frames; }
};

#endif  // NT_MDT_H_

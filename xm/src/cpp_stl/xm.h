#ifndef XM_H_
#define XM_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

/**
 * \sa Source
 */

class xm_t : public kaitai::kstruct {

public:
    class preheader_t;
    class pattern_t;
    class flags_t;
    class header_t;
    class instrument_t;

    xm_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, xm_t* p__root = 0);

private:
    void _read();

public:
    ~xm_t();

    class preheader_t : public kaitai::kstruct {

    public:
        class version_t;

        preheader_t(kaitai::kstream* p__io, xm_t* p__parent = 0, xm_t* p__root = 0);

    private:
        void _read();

    public:
        ~preheader_t();

        class version_t : public kaitai::kstruct {

        public:

            version_t(kaitai::kstream* p__io, xm_t::preheader_t* p__parent = 0, xm_t* p__root = 0);

        private:
            void _read();

        public:
            ~version_t();

        private:
            bool f_value;
            int32_t m_value;

        public:
            int32_t value();

        private:
            uint8_t m_minor;
            uint8_t m_major;
            xm_t* m__root;
            xm_t::preheader_t* m__parent;

        public:

            /**
             * currently 0x04
             */
            uint8_t minor() const { return m_minor; }

            /**
             * currently 0x01
             */
            uint8_t major() const { return m_major; }
            xm_t* _root() const { return m__root; }
            xm_t::preheader_t* _parent() const { return m__parent; }
        };

    private:
        std::string m_signature0;
        std::string m_module_name;
        std::string m_signature1;
        std::string m_tracker_name;
        version_t* m_version_number;
        uint32_t m_header_size;
        xm_t* m__root;
        xm_t* m__parent;

    public:
        std::string signature0() const { return m_signature0; }

        /**
         * Module name, padded with zeroes
         */
        std::string module_name() const { return m_module_name; }
        std::string signature1() const { return m_signature1; }

        /**
         * Tracker name
         */
        std::string tracker_name() const { return m_tracker_name; }

        /**
         * Format versions below [0x01, 0x04] have a LOT of differences. Check this field!
         */
        version_t* version_number() const { return m_version_number; }

        /**
         * Header size << Calculated FROM THIS OFFSET, not from the beginning of the file! >>
         */
        uint32_t header_size() const { return m_header_size; }
        xm_t* _root() const { return m__root; }
        xm_t* _parent() const { return m__parent; }
    };

    class pattern_t : public kaitai::kstruct {

    public:
        class header_t;

        pattern_t(kaitai::kstream* p__io, xm_t* p__parent = 0, xm_t* p__root = 0);

    private:
        void _read();

    public:
        ~pattern_t();

        class header_t : public kaitai::kstruct {

        public:
            class header_main_t;

            header_t(kaitai::kstream* p__io, xm_t::pattern_t* p__parent = 0, xm_t* p__root = 0);

        private:
            void _read();

        public:
            ~header_t();

            class header_main_t : public kaitai::kstruct {

            public:

                header_main_t(kaitai::kstream* p__io, xm_t::pattern_t::header_t* p__parent = 0, xm_t* p__root = 0);

            private:
                void _read();

            public:
                ~header_main_t();

            private:
                bool f_number_of_rows;
                int32_t m_number_of_rows;

            public:
                int32_t number_of_rows();

            private:
                uint8_t m_packing_type;
                uint8_t m_number_of_rows_raw;
                uint16_t m_packed_pattern_data_size;
                xm_t* m__root;
                xm_t::pattern_t::header_t* m__parent;

            public:

                /**
                 * Packing type (always 0)
                 */
                uint8_t packing_type() const { return m_packing_type; }

                /**
                 * Number of rows in pattern (1..256)
                 */
                uint8_t number_of_rows_raw() const { return m_number_of_rows_raw; }

                /**
                 * Packed pattern data size
                 */
                uint16_t packed_pattern_data_size() const { return m_packed_pattern_data_size; }
                xm_t* _root() const { return m__root; }
                xm_t::pattern_t::header_t* _parent() const { return m__parent; }
            };

        private:
            uint32_t m_header_length;
            header_main_t* m_main;
            xm_t* m__root;
            xm_t::pattern_t* m__parent;
            std::string m__raw_main;
            kaitai::kstream* m__io__raw_main;

        public:

            /**
             * Pattern header length
             */
            uint32_t header_length() const { return m_header_length; }
            header_main_t* main() const { return m_main; }
            xm_t* _root() const { return m__root; }
            xm_t::pattern_t* _parent() const { return m__parent; }
            std::string _raw_main() const { return m__raw_main; }
            kaitai::kstream* _io__raw_main() const { return m__io__raw_main; }
        };

    private:
        header_t* m_header;
        std::string m_packed_data;
        xm_t* m__root;
        xm_t* m__parent;

    public:
        header_t* header() const { return m_header; }
        std::string packed_data() const { return m_packed_data; }
        xm_t* _root() const { return m__root; }
        xm_t* _parent() const { return m__parent; }
    };

    class flags_t : public kaitai::kstruct {

    public:

        flags_t(kaitai::kstream* p__io, xm_t::header_t* p__parent = 0, xm_t* p__root = 0);

    private:
        void _read();

    public:
        ~flags_t();

    private:
        uint64_t m_reserved;
        bool m_freq_table_type;
        xm_t* m__root;
        xm_t::header_t* m__parent;

    public:
        uint64_t reserved() const { return m_reserved; }

        /**
         * 0 = Amiga frequency table (see below); 1 = Linear frequency table
         */
        bool freq_table_type() const { return m_freq_table_type; }
        xm_t* _root() const { return m__root; }
        xm_t::header_t* _parent() const { return m__parent; }
    };

    class header_t : public kaitai::kstruct {

    public:

        header_t(kaitai::kstream* p__io, xm_t* p__parent = 0, xm_t* p__root = 0);

    private:
        void _read();

    public:
        ~header_t();

    private:
        uint16_t m_song_length;
        uint16_t m_restart_position;
        uint16_t m_number_of_channels;
        uint16_t m_number_of_patterns;
        uint16_t m_number_of_instruments;
        flags_t* m_flags;
        uint16_t m_default_tempo;
        uint16_t m_default_bpm;
        std::vector<uint8_t>* m_pattern_order_table;
        xm_t* m__root;
        xm_t* m__parent;

    public:

        /**
         * Song length (in pattern order table)
         */
        uint16_t song_length() const { return m_song_length; }
        uint16_t restart_position() const { return m_restart_position; }

        /**
         * (2,4,6,8,10,...,32)
         */
        uint16_t number_of_channels() const { return m_number_of_channels; }

        /**
         * (max 256)
         */
        uint16_t number_of_patterns() const { return m_number_of_patterns; }

        /**
         * (max 128)
         */
        uint16_t number_of_instruments() const { return m_number_of_instruments; }
        flags_t* flags() const { return m_flags; }
        uint16_t default_tempo() const { return m_default_tempo; }
        uint16_t default_bpm() const { return m_default_bpm; }

        /**
         * max 256
         */
        std::vector<uint8_t>* pattern_order_table() const { return m_pattern_order_table; }
        xm_t* _root() const { return m__root; }
        xm_t* _parent() const { return m__parent; }
    };

    class instrument_t : public kaitai::kstruct {

    public:
        class header_t;
        class extra_header_t;
        class samples_data_t;
        class sample_header_t;

        instrument_t(kaitai::kstream* p__io, xm_t* p__parent = 0, xm_t* p__root = 0);

    private:
        void _read();

    public:
        ~instrument_t();

        class header_t : public kaitai::kstruct {

        public:

            header_t(kaitai::kstream* p__io, xm_t::instrument_t* p__parent = 0, xm_t* p__root = 0);

        private:
            void _read();

        public:
            ~header_t();

        private:
            std::string m_name;
            uint8_t m_type;
            uint16_t m_number_of_samples;
            extra_header_t* m_extra_header;
            bool n_extra_header;

        public:
            bool _is_null_extra_header() { extra_header(); return n_extra_header; };

        private:
            xm_t* m__root;
            xm_t::instrument_t* m__parent;

        public:
            std::string name() const { return m_name; }

            /**
             * Usually zero, but this seems pretty random, don't assume it's zero
             */
            uint8_t type() const { return m_type; }
            uint16_t number_of_samples() const { return m_number_of_samples; }
            extra_header_t* extra_header() const { return m_extra_header; }
            xm_t* _root() const { return m__root; }
            xm_t::instrument_t* _parent() const { return m__parent; }
        };

        class extra_header_t : public kaitai::kstruct {

        public:
            class envelope_point_t;

            enum type_t {
                TYPE_TRUE = 0,
                TYPE_SUSTAIN = 1,
                TYPE_LOOP = 2
            };

            extra_header_t(kaitai::kstream* p__io, xm_t::instrument_t::header_t* p__parent = 0, xm_t* p__root = 0);

        private:
            void _read();

        public:
            ~extra_header_t();

            /**
             * Envelope frame-counters work in range 0..FFFFh (0..65535 dec).
             * BUT! FT2 only itself supports only range 0..FFh (0..255 dec).
             * Some other trackers (like SoundTracker for Unix), however, can use the full range 0..FFFF, so it should be supported.
             * !!TIP: This is also a good way to detect if the module has been made with FT2 or not. (In case the tracker name is brain- deadly left unchanged!)
             * Of course it does not help if all instruments have the values inside FT2 supported range.
             * The value-field of the envelope point is ranged between 00..3Fh (0..64 dec).
             */

            class envelope_point_t : public kaitai::kstruct {

            public:

                envelope_point_t(kaitai::kstream* p__io, xm_t::instrument_t::extra_header_t* p__parent = 0, xm_t* p__root = 0);

            private:
                void _read();

            public:
                ~envelope_point_t();

            private:
                uint16_t m_x;
                uint16_t m_y;
                xm_t* m__root;
                xm_t::instrument_t::extra_header_t* m__parent;

            public:

                /**
                 * Frame number of the point
                 */
                uint16_t x() const { return m_x; }

                /**
                 * Value of the point
                 */
                uint16_t y() const { return m_y; }
                xm_t* _root() const { return m__root; }
                xm_t::instrument_t::extra_header_t* _parent() const { return m__parent; }
            };

        private:
            uint32_t m_sample_header_size;
            std::vector<uint8_t>* m_sample_number_for_all_notes;
            std::vector<envelope_point_t*>* m_points_for_volume_envelope;
            std::vector<envelope_point_t*>* m_points_for_panning_envelope;
            uint8_t m_number_of_volume_points;
            uint8_t m_number_of_panning_points;
            uint8_t m_volume_sustain_point;
            uint8_t m_volume_loop_start_point;
            uint8_t m_volume_loop_end_point;
            uint8_t m_panning_sustain_point;
            uint8_t m_panning_loop_start_point;
            uint8_t m_panning_loop_end_point;
            type_t m_volume_type;
            type_t m_panning_type;
            uint8_t m_vibrato_type;
            uint8_t m_vibrato_sweep;
            uint8_t m_vibrato_depth;
            uint8_t m_vibrato_rate;
            uint16_t m_volume_fadeout;
            uint16_t m_reserved;
            xm_t* m__root;
            xm_t::instrument_t::header_t* m__parent;

        public:
            uint32_t sample_header_size() const { return m_sample_header_size; }
            std::vector<uint8_t>* sample_number_for_all_notes() const { return m_sample_number_for_all_notes; }
            std::vector<envelope_point_t*>* points_for_volume_envelope() const { return m_points_for_volume_envelope; }
            std::vector<envelope_point_t*>* points_for_panning_envelope() const { return m_points_for_panning_envelope; }
            uint8_t number_of_volume_points() const { return m_number_of_volume_points; }
            uint8_t number_of_panning_points() const { return m_number_of_panning_points; }
            uint8_t volume_sustain_point() const { return m_volume_sustain_point; }
            uint8_t volume_loop_start_point() const { return m_volume_loop_start_point; }
            uint8_t volume_loop_end_point() const { return m_volume_loop_end_point; }
            uint8_t panning_sustain_point() const { return m_panning_sustain_point; }
            uint8_t panning_loop_start_point() const { return m_panning_loop_start_point; }
            uint8_t panning_loop_end_point() const { return m_panning_loop_end_point; }
            type_t volume_type() const { return m_volume_type; }
            type_t panning_type() const { return m_panning_type; }
            uint8_t vibrato_type() const { return m_vibrato_type; }
            uint8_t vibrato_sweep() const { return m_vibrato_sweep; }
            uint8_t vibrato_depth() const { return m_vibrato_depth; }
            uint8_t vibrato_rate() const { return m_vibrato_rate; }
            uint16_t volume_fadeout() const { return m_volume_fadeout; }
            uint16_t reserved() const { return m_reserved; }
            xm_t* _root() const { return m__root; }
            xm_t::instrument_t::header_t* _parent() const { return m__parent; }
        };

        /**
         * The saved data uses simple delta-encoding to achieve better compression ratios (when compressed with pkzip, etc.)
         * Pseudocode for converting the delta-coded data to normal data,
         * old = 0;
         * for i in range(data_len):
         *   new = sample[i] + old;
         *   sample[i] = new;
         *   old = new;
         */

        class samples_data_t : public kaitai::kstruct {

        public:

            samples_data_t(uint16_t p_index, kaitai::kstream* p__io, xm_t::instrument_t* p__parent = 0, xm_t* p__root = 0);

        private:
            void _read();

        public:
            ~samples_data_t();

        private:
            std::vector<uint16_t>* m_samples_data;
            bool n_samples_data;

        public:
            bool _is_null_samples_data() { samples_data(); return n_samples_data; };

        private:
            uint16_t m_index;
            xm_t* m__root;
            xm_t::instrument_t* m__parent;

        public:
            std::vector<uint16_t>* samples_data() const { return m_samples_data; }
            uint16_t index() const { return m_index; }
            xm_t* _root() const { return m__root; }
            xm_t::instrument_t* _parent() const { return m__parent; }
        };

        class sample_header_t : public kaitai::kstruct {

        public:
            class loop_type_t;

            sample_header_t(kaitai::kstream* p__io, xm_t::instrument_t* p__parent = 0, xm_t* p__root = 0);

        private:
            void _read();

        public:
            ~sample_header_t();

            class loop_type_t : public kaitai::kstruct {

            public:

                enum loop_type_t {
                    LOOP_TYPE_NONE = 0,
                    LOOP_TYPE_FORWARD = 1,
                    LOOP_TYPE_PING_PONG = 2
                };

                loop_type_t(kaitai::kstream* p__io, xm_t::instrument_t::sample_header_t* p__parent = 0, xm_t* p__root = 0);

            private:
                void _read();

            public:
                ~loop_type_t();

            private:
                uint64_t m_reserved0;
                bool m_is_sample_data_16_bit;
                uint64_t m_reserved1;
                loop_type_t m_loop_type;
                xm_t* m__root;
                xm_t::instrument_t::sample_header_t* m__parent;

            public:
                uint64_t reserved0() const { return m_reserved0; }
                bool is_sample_data_16_bit() const { return m_is_sample_data_16_bit; }
                uint64_t reserved1() const { return m_reserved1; }
                loop_type_t loop_type() const { return m_loop_type; }
                xm_t* _root() const { return m__root; }
                xm_t::instrument_t::sample_header_t* _parent() const { return m__parent; }
            };

        private:
            uint32_t m_sample_length;
            uint32_t m_sample_loop_start;
            uint32_t m_sample_loop_length;
            uint8_t m_volume;
            int8_t m_fine_tune;
            loop_type_t* m_type;
            uint8_t m_panning;
            int8_t m_relative_note_number;
            uint8_t m_reserved;
            std::string m_name;
            xm_t* m__root;
            xm_t::instrument_t* m__parent;

        public:
            uint32_t sample_length() const { return m_sample_length; }
            uint32_t sample_loop_start() const { return m_sample_loop_start; }
            uint32_t sample_loop_length() const { return m_sample_loop_length; }
            uint8_t volume() const { return m_volume; }

            /**
             * -16..+15
             */
            int8_t fine_tune() const { return m_fine_tune; }
            loop_type_t* type() const { return m_type; }

            /**
             * (0-255)
             */
            uint8_t panning() const { return m_panning; }
            int8_t relative_note_number() const { return m_relative_note_number; }
            uint8_t reserved() const { return m_reserved; }
            std::string name() const { return m_name; }
            xm_t* _root() const { return m__root; }
            xm_t::instrument_t* _parent() const { return m__parent; }
        };

    private:
        uint32_t m_header_size;
        header_t* m_header;
        std::vector<sample_header_t*>* m_samples_headers;
        std::vector<samples_data_t*>* m_samples;
        xm_t* m__root;
        xm_t* m__parent;
        std::string m__raw_header;
        kaitai::kstream* m__io__raw_header;

    public:

        /**
         * Instrument size << header that is >>
         * << "Instrument Size" field tends to be more than the actual size of the structure documented here (it includes also the extended instrument sample header above). So remember to check it and skip the additional bytes before the first sample header >>
         */
        uint32_t header_size() const { return m_header_size; }
        header_t* header() const { return m_header; }
        std::vector<sample_header_t*>* samples_headers() const { return m_samples_headers; }
        std::vector<samples_data_t*>* samples() const { return m_samples; }
        xm_t* _root() const { return m__root; }
        xm_t* _parent() const { return m__parent; }
        std::string _raw_header() const { return m__raw_header; }
        kaitai::kstream* _io__raw_header() const { return m__io__raw_header; }
    };

private:
    preheader_t* m_preheader;
    header_t* m_header;
    std::vector<pattern_t*>* m_patterns;
    std::vector<instrument_t*>* m_instruments;
    xm_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_header;
    kaitai::kstream* m__io__raw_header;

public:
    preheader_t* preheader() const { return m_preheader; }
    header_t* header() const { return m_header; }
    std::vector<pattern_t*>* patterns() const { return m_patterns; }
    std::vector<instrument_t*>* instruments() const { return m_instruments; }
    xm_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_header() const { return m__raw_header; }
    kaitai::kstream* _io__raw_header() const { return m__io__raw_header; }
};

#endif  // XM_H_

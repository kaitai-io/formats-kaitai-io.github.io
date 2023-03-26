#ifndef MIFARE_CLASSIC_H_
#define MIFARE_CLASSIC_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * You can get a dump for testing from this link:
 * <https://github.com/zhovner/mfdread/raw/master/dump.mfd>
 * \sa https://github.com/nfc-tools/libnfc
 * https://www.nxp.com/docs/en/data-sheet/MF1S70YYX_V1.pdf
 *  Source
 */

class mifare_classic_t : public kaitai::kstruct {

public:
    class key_t;
    class sector_t;
    class manufacturer_t;
    class trailer_t;

    mifare_classic_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, mifare_classic_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~mifare_classic_t();

    class key_t : public kaitai::kstruct {

    public:

        key_t(kaitai::kstream* p__io, mifare_classic_t::trailer_t* p__parent = 0, mifare_classic_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~key_t();

    private:
        std::string m_key;
        mifare_classic_t* m__root;
        mifare_classic_t::trailer_t* m__parent;

    public:
        std::string key() const { return m_key; }
        mifare_classic_t* _root() const { return m__root; }
        mifare_classic_t::trailer_t* _parent() const { return m__parent; }
    };

    class sector_t : public kaitai::kstruct {

    public:
        class values_t;
        class filler_t;

        sector_t(bool p_has_manufacturer, kaitai::kstream* p__io, mifare_classic_t* p__parent = 0, mifare_classic_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~sector_t();

        class values_t : public kaitai::kstruct {

        public:
            class value_block_t;

            values_t(kaitai::kstream* p__io, mifare_classic_t::sector_t* p__parent = 0, mifare_classic_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~values_t();

            class value_block_t : public kaitai::kstruct {

            public:

                value_block_t(kaitai::kstream* p__io, mifare_classic_t::sector_t::values_t* p__parent = 0, mifare_classic_t* p__root = 0);

            private:
                void _read();
                void _clean_up();

            public:
                ~value_block_t();

            private:
                bool f_addr;
                uint8_t m_addr;
                bool n_addr;

            public:
                bool _is_null_addr() { addr(); return n_addr; };

            private:

            public:
                uint8_t addr();

            private:
                bool f_addr_valid;
                bool m_addr_valid;

            public:
                bool addr_valid();

            private:
                bool f_valid;
                bool m_valid;

            public:
                bool valid();

            private:
                bool f_value_valid;
                bool m_value_valid;

            public:
                bool value_valid();

            private:
                bool f_value;
                uint32_t m_value;
                bool n_value;

            public:
                bool _is_null_value() { value(); return n_value; };

            private:

            public:
                uint32_t value();

            private:
                std::vector<uint32_t>* m_valuez;
                std::vector<uint8_t>* m_addrz;
                mifare_classic_t* m__root;
                mifare_classic_t::sector_t::values_t* m__parent;

            public:
                std::vector<uint32_t>* valuez() const { return m_valuez; }
                std::vector<uint8_t>* addrz() const { return m_addrz; }
                mifare_classic_t* _root() const { return m__root; }
                mifare_classic_t::sector_t::values_t* _parent() const { return m__parent; }
            };

        private:
            std::vector<value_block_t*>* m_values;
            mifare_classic_t* m__root;
            mifare_classic_t::sector_t* m__parent;

        public:
            std::vector<value_block_t*>* values() const { return m_values; }
            mifare_classic_t* _root() const { return m__root; }
            mifare_classic_t::sector_t* _parent() const { return m__parent; }
        };

        /**
         * only to create _io
         */

        class filler_t : public kaitai::kstruct {

        public:

            filler_t(kaitai::kstream* p__io, mifare_classic_t::sector_t* p__parent = 0, mifare_classic_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~filler_t();

        private:
            std::string m_data;
            mifare_classic_t* m__root;
            mifare_classic_t::sector_t* m__parent;

        public:
            std::string data() const { return m_data; }
            mifare_classic_t* _root() const { return m__root; }
            mifare_classic_t::sector_t* _parent() const { return m__parent; }
        };

    private:
        bool f_block_size;
        int8_t m_block_size;

    public:
        int8_t block_size();

    private:
        bool f_data;
        std::string m_data;

    public:
        std::string data();

    private:
        bool f_blocks;
        std::vector<std::string>* m_blocks;

    public:
        std::vector<std::string>* blocks();

    private:
        bool f_values;
        values_t* m_values;

    public:
        values_t* values();

    private:
        manufacturer_t* m_manufacturer;
        bool n_manufacturer;

    public:
        bool _is_null_manufacturer() { manufacturer(); return n_manufacturer; };

    private:
        filler_t* m_data_filler;
        trailer_t* m_trailer;
        bool m_has_manufacturer;
        mifare_classic_t* m__root;
        mifare_classic_t* m__parent;
        std::string m__raw_data_filler;
        kaitai::kstream* m__io__raw_data_filler;

    public:
        manufacturer_t* manufacturer() const { return m_manufacturer; }
        filler_t* data_filler() const { return m_data_filler; }
        trailer_t* trailer() const { return m_trailer; }
        bool has_manufacturer() const { return m_has_manufacturer; }
        mifare_classic_t* _root() const { return m__root; }
        mifare_classic_t* _parent() const { return m__parent; }
        std::string _raw_data_filler() const { return m__raw_data_filler; }
        kaitai::kstream* _io__raw_data_filler() const { return m__io__raw_data_filler; }
    };

    class manufacturer_t : public kaitai::kstruct {

    public:

        manufacturer_t(kaitai::kstream* p__io, mifare_classic_t::sector_t* p__parent = 0, mifare_classic_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~manufacturer_t();

    private:
        uint32_t m_nuid;
        uint8_t m_bcc;
        uint8_t m_sak;
        uint16_t m_atqa;
        std::string m_manufacturer;
        mifare_classic_t* m__root;
        mifare_classic_t::sector_t* m__parent;

    public:

        /**
         * beware for 7bytes UID it goes over next fields
         */
        uint32_t nuid() const { return m_nuid; }
        uint8_t bcc() const { return m_bcc; }
        uint8_t sak() const { return m_sak; }
        uint16_t atqa() const { return m_atqa; }

        /**
         * may contain manufacture date as BCD
         */
        std::string manufacturer() const { return m_manufacturer; }
        mifare_classic_t* _root() const { return m__root; }
        mifare_classic_t::sector_t* _parent() const { return m__parent; }
    };

    class trailer_t : public kaitai::kstruct {

    public:
        class access_conditions_t;

        trailer_t(kaitai::kstream* p__io, mifare_classic_t::sector_t* p__parent = 0, mifare_classic_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~trailer_t();

        class access_conditions_t : public kaitai::kstruct {

        public:
            class trailer_ac_t;
            class chunk_bit_remap_t;
            class data_ac_t;
            class ac_t;
            class valid_chunk_t;

            access_conditions_t(kaitai::kstream* p__io, mifare_classic_t::trailer_t* p__parent = 0, mifare_classic_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~access_conditions_t();

            class trailer_ac_t : public kaitai::kstruct {

            public:

                trailer_ac_t(ac_t* p_ac, kaitai::kstream* p__io, mifare_classic_t::trailer_t::access_conditions_t* p__parent = 0, mifare_classic_t* p__root = 0);

            private:
                void _read();
                void _clean_up();

            public:
                ~trailer_ac_t();

            private:
                bool f_can_read_key_b;
                bool m_can_read_key_b;

            public:

                /**
                 * key A is required
                 */
                bool can_read_key_b();

            private:
                bool f_can_write_keys;
                bool m_can_write_keys;

            public:
                bool can_write_keys();

            private:
                bool f_can_write_access_bits;
                bool m_can_write_access_bits;

            public:
                bool can_write_access_bits();

            private:
                bool f_key_b_controls_write;
                bool m_key_b_controls_write;

            public:
                bool key_b_controls_write();

            private:
                ac_t* m_ac;
                mifare_classic_t* m__root;
                mifare_classic_t::trailer_t::access_conditions_t* m__parent;

            public:
                ac_t* ac() const { return m_ac; }
                mifare_classic_t* _root() const { return m__root; }
                mifare_classic_t::trailer_t::access_conditions_t* _parent() const { return m__parent; }
            };

            class chunk_bit_remap_t : public kaitai::kstruct {

            public:

                chunk_bit_remap_t(uint8_t p_bit_no, kaitai::kstream* p__io, mifare_classic_t::trailer_t::access_conditions_t* p__parent = 0, mifare_classic_t* p__root = 0);

            private:
                void _read();
                void _clean_up();

            public:
                ~chunk_bit_remap_t();

            private:
                bool f_shift_value;
                int32_t m_shift_value;

            public:
                int32_t shift_value();

            private:
                bool f_chunk_no;
                int32_t m_chunk_no;

            public:
                int32_t chunk_no();

            private:
                bool f_inv_chunk_no;
                int32_t m_inv_chunk_no;

            public:
                int32_t inv_chunk_no();

            private:
                uint8_t m_bit_no;
                mifare_classic_t* m__root;
                mifare_classic_t::trailer_t::access_conditions_t* m__parent;

            public:
                uint8_t bit_no() const { return m_bit_no; }
                mifare_classic_t* _root() const { return m__root; }
                mifare_classic_t::trailer_t::access_conditions_t* _parent() const { return m__parent; }
            };

            class data_ac_t : public kaitai::kstruct {

            public:

                data_ac_t(ac_t* p_ac, kaitai::kstream* p__io, mifare_classic_t::trailer_t::access_conditions_t* p__parent = 0, mifare_classic_t* p__root = 0);

            private:
                void _read();
                void _clean_up();

            public:
                ~data_ac_t();

            private:
                bool f_read_key_a_required;
                bool m_read_key_a_required;

            public:
                bool read_key_a_required();

            private:
                bool f_write_key_b_required;
                bool m_write_key_b_required;

            public:
                bool write_key_b_required();

            private:
                bool f_write_key_a_required;
                bool m_write_key_a_required;

            public:
                bool write_key_a_required();

            private:
                bool f_read_key_b_required;
                bool m_read_key_b_required;

            public:
                bool read_key_b_required();

            private:
                bool f_decrement_available;
                bool m_decrement_available;

            public:
                bool decrement_available();

            private:
                bool f_increment_available;
                bool m_increment_available;

            public:
                bool increment_available();

            private:
                ac_t* m_ac;
                mifare_classic_t* m__root;
                mifare_classic_t::trailer_t::access_conditions_t* m__parent;

            public:
                ac_t* ac() const { return m_ac; }
                mifare_classic_t* _root() const { return m__root; }
                mifare_classic_t::trailer_t::access_conditions_t* _parent() const { return m__parent; }
            };

            class ac_t : public kaitai::kstruct {

            public:
                class ac_bit_t;

                ac_t(uint8_t p_index, kaitai::kstream* p__io, mifare_classic_t::trailer_t::access_conditions_t* p__parent = 0, mifare_classic_t* p__root = 0);

            private:
                void _read();
                void _clean_up();

            public:
                ~ac_t();

                class ac_bit_t : public kaitai::kstruct {

                public:

                    ac_bit_t(uint8_t p_i, uint8_t p_chunk, kaitai::kstream* p__io, mifare_classic_t::trailer_t::access_conditions_t::ac_t* p__parent = 0, mifare_classic_t* p__root = 0);

                private:
                    void _read();
                    void _clean_up();

                public:
                    ~ac_bit_t();

                private:
                    bool f_n;
                    int32_t m_n;

                public:
                    int32_t n();

                private:
                    bool f_b;
                    bool m_b;

                public:
                    bool b();

                private:
                    uint8_t m_i;
                    uint8_t m_chunk;
                    mifare_classic_t* m__root;
                    mifare_classic_t::trailer_t::access_conditions_t::ac_t* m__parent;

                public:
                    uint8_t i() const { return m_i; }
                    uint8_t chunk() const { return m_chunk; }
                    mifare_classic_t* _root() const { return m__root; }
                    mifare_classic_t::trailer_t::access_conditions_t::ac_t* _parent() const { return m__parent; }
                };

            private:
                bool f_bits;
                std::vector<ac_bit_t*>* m_bits;

            public:
                std::vector<ac_bit_t*>* bits();

            private:
                bool f_val;
                int32_t m_val;

            public:

                /**
                 * c3 c2 c1
                 */
                int32_t val();

            private:
                bool f_inv_shift_val;
                int32_t m_inv_shift_val;

            public:
                int32_t inv_shift_val();

            private:
                uint8_t m_index;
                mifare_classic_t* m__root;
                mifare_classic_t::trailer_t::access_conditions_t* m__parent;

            public:
                uint8_t index() const { return m_index; }
                mifare_classic_t* _root() const { return m__root; }
                mifare_classic_t::trailer_t::access_conditions_t* _parent() const { return m__parent; }
            };

            class valid_chunk_t : public kaitai::kstruct {

            public:

                valid_chunk_t(uint8_t p_inv_chunk, uint8_t p_chunk, kaitai::kstream* p__io, mifare_classic_t::trailer_t::access_conditions_t* p__parent = 0, mifare_classic_t* p__root = 0);

            private:
                void _read();
                void _clean_up();

            public:
                ~valid_chunk_t();

            private:
                bool f_valid;
                bool m_valid;

            public:
                bool valid();

            private:
                uint8_t m_inv_chunk;
                uint8_t m_chunk;
                mifare_classic_t* m__root;
                mifare_classic_t::trailer_t::access_conditions_t* m__parent;

            public:
                uint8_t inv_chunk() const { return m_inv_chunk; }

                /**
                 * c3 c2 c1 c0
                 */
                uint8_t chunk() const { return m_chunk; }
                mifare_classic_t* _root() const { return m__root; }
                mifare_classic_t::trailer_t::access_conditions_t* _parent() const { return m__parent; }
            };

        private:
            bool f_data_acs;
            std::vector<data_ac_t*>* m_data_acs;

        public:
            std::vector<data_ac_t*>* data_acs();

        private:
            bool f_remaps;
            std::vector<chunk_bit_remap_t*>* m_remaps;

        public:
            std::vector<chunk_bit_remap_t*>* remaps();

        private:
            bool f_acs_raw;
            std::vector<ac_t*>* m_acs_raw;

        public:
            std::vector<ac_t*>* acs_raw();

        private:
            bool f_trailer_ac;
            trailer_ac_t* m_trailer_ac;

        public:
            trailer_ac_t* trailer_ac();

        private:
            bool f_chunks;
            std::vector<valid_chunk_t*>* m_chunks;

        public:
            std::vector<valid_chunk_t*>* chunks();

        private:
            std::vector<uint64_t>* m_raw_chunks;
            mifare_classic_t* m__root;
            mifare_classic_t::trailer_t* m__parent;

        public:
            std::vector<uint64_t>* raw_chunks() const { return m_raw_chunks; }
            mifare_classic_t* _root() const { return m__root; }
            mifare_classic_t::trailer_t* _parent() const { return m__parent; }
        };

    private:
        bool f_ac_bits;
        int8_t m_ac_bits;

    public:
        int8_t ac_bits();

    private:
        bool f_acs_in_sector;
        int8_t m_acs_in_sector;

    public:
        int8_t acs_in_sector();

    private:
        bool f_ac_count_of_chunks;
        int32_t m_ac_count_of_chunks;

    public:
        int32_t ac_count_of_chunks();

    private:
        key_t* m_key_a;
        access_conditions_t* m_access_bits;
        uint8_t m_user_byte;
        key_t* m_key_b;
        mifare_classic_t* m__root;
        mifare_classic_t::sector_t* m__parent;
        std::string m__raw_access_bits;
        kaitai::kstream* m__io__raw_access_bits;

    public:
        key_t* key_a() const { return m_key_a; }
        access_conditions_t* access_bits() const { return m_access_bits; }
        uint8_t user_byte() const { return m_user_byte; }
        key_t* key_b() const { return m_key_b; }
        mifare_classic_t* _root() const { return m__root; }
        mifare_classic_t::sector_t* _parent() const { return m__parent; }
        std::string _raw_access_bits() const { return m__raw_access_bits; }
        kaitai::kstream* _io__raw_access_bits() const { return m__io__raw_access_bits; }
    };

private:
    std::vector<sector_t*>* m_sectors;
    mifare_classic_t* m__root;
    kaitai::kstruct* m__parent;
    std::vector<std::string>* m__raw_sectors;
    std::vector<kaitai::kstream*>* m__io__raw_sectors;

public:
    std::vector<sector_t*>* sectors() const { return m_sectors; }
    mifare_classic_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::vector<std::string>* _raw_sectors() const { return m__raw_sectors; }
    std::vector<kaitai::kstream*>* _io__raw_sectors() const { return m__io__raw_sectors; }
};

#endif  // MIFARE_CLASSIC_H_

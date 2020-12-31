#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * .trx file format is widely used for distribution of stock firmware
 * updates for ASUS routers.
 * 
 * Fundamentally, it includes a footer which acts as a safeguard
 * against installing a firmware package on a wrong hardware model or
 * version, and a header which list numerous partitions packaged inside
 * a single .trx file.
 * 
 * trx files not necessarily contain all these headers.
 * \sa https://github.com/openwrt/openwrt/blob/3f5619f/tools/firmware-utils/src/trx.c Source
 */

class asus_trx_t : public kaitai::kstruct {

public:
    class revision_t;
    class version_t;
    class tail_t;
    class header_t;

    asus_trx_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, asus_trx_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~asus_trx_t();

    class revision_t : public kaitai::kstruct {

    public:

        revision_t(kaitai::kstream* p__io, asus_trx_t::tail_t::hw_comp_info_t* p__parent = nullptr, asus_trx_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~revision_t();

    private:
        uint8_t m_major;
        uint8_t m_minor;
        asus_trx_t* m__root;
        asus_trx_t::tail_t::hw_comp_info_t* m__parent;

    public:
        uint8_t major() const { return m_major; }
        uint8_t minor() const { return m_minor; }
        asus_trx_t* _root() const { return m__root; }
        asus_trx_t::tail_t::hw_comp_info_t* _parent() const { return m__parent; }
    };

    class version_t : public kaitai::kstruct {

    public:

        version_t(kaitai::kstream* p__io, asus_trx_t::tail_t* p__parent = nullptr, asus_trx_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~version_t();

    private:
        uint8_t m_major;
        uint8_t m_minor;
        uint8_t m_patch;
        uint8_t m_tweak;
        asus_trx_t* m__root;
        asus_trx_t::tail_t* m__parent;

    public:
        uint8_t major() const { return m_major; }
        uint8_t minor() const { return m_minor; }
        uint8_t patch() const { return m_patch; }
        uint8_t tweak() const { return m_tweak; }
        asus_trx_t* _root() const { return m__root; }
        asus_trx_t::tail_t* _parent() const { return m__parent; }
    };

    /**
     * A safeguard against installation of firmware to an incompatible device
     */

    class tail_t : public kaitai::kstruct {

    public:
        class hw_comp_info_t;

        tail_t(kaitai::kstream* p__io, asus_trx_t* p__parent = nullptr, asus_trx_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~tail_t();

        class hw_comp_info_t : public kaitai::kstruct {

        public:

            hw_comp_info_t(kaitai::kstream* p__io, asus_trx_t::tail_t* p__parent = nullptr, asus_trx_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~hw_comp_info_t();

        private:
            std::unique_ptr<revision_t> m_min;
            std::unique_ptr<revision_t> m_max;
            asus_trx_t* m__root;
            asus_trx_t::tail_t* m__parent;

        public:
            revision_t* min() const { return m_min.get(); }
            revision_t* max() const { return m_max.get(); }
            asus_trx_t* _root() const { return m__root; }
            asus_trx_t::tail_t* _parent() const { return m__parent; }
        };

    private:
        std::unique_ptr<version_t> m_version;
        std::string m_product_id;
        std::unique_ptr<std::vector<std::unique_ptr<hw_comp_info_t>>> m_comp_hw;
        std::string m_reserved;
        asus_trx_t* m__root;
        asus_trx_t* m__parent;

    public:

        /**
         * 1.9.2.7 by default
         */
        version_t* version() const { return m_version.get(); }
        std::string product_id() const { return m_product_id; }

        /**
         * 0.02 - 2.99
         */
        std::vector<std::unique_ptr<hw_comp_info_t>>* comp_hw() const { return m_comp_hw.get(); }
        std::string reserved() const { return m_reserved; }
        asus_trx_t* _root() const { return m__root; }
        asus_trx_t* _parent() const { return m__parent; }
    };

    class header_t : public kaitai::kstruct {

    public:
        class partition_t;
        class flags_t;

        header_t(kaitai::kstream* p__io, asus_trx_t* p__parent = nullptr, asus_trx_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_t();

        class partition_t : public kaitai::kstruct {

        public:

            partition_t(uint8_t p_idx, kaitai::kstream* p__io, asus_trx_t::header_t* p__parent = nullptr, asus_trx_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~partition_t();

        private:
            bool f_is_present;
            bool m_is_present;

        public:
            bool is_present();

        private:
            bool f_is_last;
            bool m_is_last;
            bool n_is_last;

        public:
            bool _is_null_is_last() { is_last(); return n_is_last; };

        private:

        public:
            bool is_last();

        private:
            bool f_len_body;
            int32_t m_len_body;
            bool n_len_body;

        public:
            bool _is_null_len_body() { len_body(); return n_len_body; };

        private:

        public:
            int32_t len_body();

        private:
            bool f_body;
            std::string m_body;
            bool n_body;

        public:
            bool _is_null_body() { body(); return n_body; };

        private:

        public:
            std::string body();

        private:
            uint32_t m_ofs_body;
            uint8_t m_idx;
            asus_trx_t* m__root;
            asus_trx_t::header_t* m__parent;

        public:
            uint32_t ofs_body() const { return m_ofs_body; }
            uint8_t idx() const { return m_idx; }
            asus_trx_t* _root() const { return m__root; }
            asus_trx_t::header_t* _parent() const { return m__parent; }
        };

        class flags_t : public kaitai::kstruct {

        public:

            flags_t(kaitai::kstream* p__io, asus_trx_t::header_t* p__parent = nullptr, asus_trx_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~flags_t();

        private:
            std::unique_ptr<std::vector<bool>> m_flags;
            asus_trx_t* m__root;
            asus_trx_t::header_t* m__parent;

        public:
            std::vector<bool>* flags() const { return m_flags.get(); }
            asus_trx_t* _root() const { return m__root; }
            asus_trx_t::header_t* _parent() const { return m__parent; }
        };

    private:
        std::string m_magic;
        uint32_t m_len;
        uint32_t m_crc32;
        uint16_t m_version;
        std::unique_ptr<flags_t> m_flags;
        std::unique_ptr<std::vector<std::unique_ptr<partition_t>>> m_partitions;
        asus_trx_t* m__root;
        asus_trx_t* m__parent;

    public:
        std::string magic() const { return m_magic; }

        /**
         * Length of file including header
         */
        uint32_t len() const { return m_len; }

        /**
         * CRC from `version` (??? todo: see the original and disambiguate) to end of file
         */
        uint32_t crc32() const { return m_crc32; }
        uint16_t version() const { return m_version; }
        flags_t* flags() const { return m_flags.get(); }

        /**
         * Offsets of partitions from start of header
         */
        std::vector<std::unique_ptr<partition_t>>* partitions() const { return m_partitions.get(); }
        asus_trx_t* _root() const { return m__root; }
        asus_trx_t* _parent() const { return m__parent; }
    };

private:
    bool f_header;
    std::unique_ptr<header_t> m_header;

public:
    header_t* header();

private:
    bool f_tail;
    std::unique_ptr<tail_t> m_tail;

public:
    tail_t* tail();

private:
    asus_trx_t* m__root;
    kaitai::kstruct* m__parent;

public:
    asus_trx_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

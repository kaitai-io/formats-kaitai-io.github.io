#ifndef HEAPS_PAK_H_
#define HEAPS_PAK_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class heaps_pak_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * \sa https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Reader.hx Source
 */

class heaps_pak_t : public kaitai::kstruct {

public:
    class header_t;

    heaps_pak_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, heaps_pak_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~heaps_pak_t();

    class header_t : public kaitai::kstruct {

    public:
        class dir_t;
        class entry_t;
        class file_t;

        header_t(kaitai::kstream* p__io, heaps_pak_t* p__parent = 0, heaps_pak_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_t();

        class dir_t : public kaitai::kstruct {

        public:

            dir_t(kaitai::kstream* p__io, heaps_pak_t::header_t::entry_t* p__parent = 0, heaps_pak_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~dir_t();

        private:
            uint32_t m_num_entries;
            std::vector<entry_t*>* m_entries;
            heaps_pak_t* m__root;
            heaps_pak_t::header_t::entry_t* m__parent;

        public:
            uint32_t num_entries() const { return m_num_entries; }
            std::vector<entry_t*>* entries() const { return m_entries; }
            heaps_pak_t* _root() const { return m__root; }
            heaps_pak_t::header_t::entry_t* _parent() const { return m__parent; }
        };

        /**
         * \sa https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Data.hx Source
         */

        class entry_t : public kaitai::kstruct {

        public:
            class flags_t;

            entry_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, heaps_pak_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~entry_t();

            class flags_t : public kaitai::kstruct {

            public:

                flags_t(kaitai::kstream* p__io, heaps_pak_t::header_t::entry_t* p__parent = 0, heaps_pak_t* p__root = 0);

            private:
                void _read();
                void _clean_up();

            public:
                ~flags_t();

            private:
                uint64_t m_unused;
                bool m_is_dir;
                heaps_pak_t* m__root;
                heaps_pak_t::header_t::entry_t* m__parent;

            public:
                uint64_t unused() const { return m_unused; }
                bool is_dir() const { return m_is_dir; }
                heaps_pak_t* _root() const { return m__root; }
                heaps_pak_t::header_t::entry_t* _parent() const { return m__parent; }
            };

        private:
            uint8_t m_len_name;
            std::string m_name;
            flags_t* m_flags;
            kaitai::kstruct* m_body;
            bool n_body;

        public:
            bool _is_null_body() { body(); return n_body; };

        private:
            heaps_pak_t* m__root;
            kaitai::kstruct* m__parent;

        public:
            uint8_t len_name() const { return m_len_name; }
            std::string name() const { return m_name; }
            flags_t* flags() const { return m_flags; }
            kaitai::kstruct* body() const { return m_body; }
            heaps_pak_t* _root() const { return m__root; }
            kaitai::kstruct* _parent() const { return m__parent; }
        };

        class file_t : public kaitai::kstruct {

        public:

            file_t(kaitai::kstream* p__io, heaps_pak_t::header_t::entry_t* p__parent = 0, heaps_pak_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~file_t();

        private:
            bool f_data;
            std::string m_data;

        public:
            std::string data();

        private:
            uint32_t m_ofs_data;
            uint32_t m_len_data;
            std::string m_checksum;
            heaps_pak_t* m__root;
            heaps_pak_t::header_t::entry_t* m__parent;

        public:
            uint32_t ofs_data() const { return m_ofs_data; }
            uint32_t len_data() const { return m_len_data; }
            std::string checksum() const { return m_checksum; }
            heaps_pak_t* _root() const { return m__root; }
            heaps_pak_t::header_t::entry_t* _parent() const { return m__parent; }
        };

    private:
        std::string m_magic1;
        uint8_t m_version;
        uint32_t m_len_header;
        uint32_t m_len_data;
        entry_t* m_root_entry;
        std::string m_magic2;
        heaps_pak_t* m__root;
        heaps_pak_t* m__parent;
        std::string m__raw_root_entry;
        kaitai::kstream* m__io__raw_root_entry;

    public:
        std::string magic1() const { return m_magic1; }
        uint8_t version() const { return m_version; }
        uint32_t len_header() const { return m_len_header; }
        uint32_t len_data() const { return m_len_data; }
        entry_t* root_entry() const { return m_root_entry; }
        std::string magic2() const { return m_magic2; }
        heaps_pak_t* _root() const { return m__root; }
        heaps_pak_t* _parent() const { return m__parent; }
        std::string _raw_root_entry() const { return m__raw_root_entry; }
        kaitai::kstream* _io__raw_root_entry() const { return m__io__raw_root_entry; }
    };

private:
    header_t* m_header;
    heaps_pak_t* m__root;
    kaitai::kstruct* m__parent;

public:
    header_t* header() const { return m_header; }
    heaps_pak_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // HEAPS_PAK_H_

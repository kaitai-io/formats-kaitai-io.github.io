#ifndef TSM_H_
#define TSM_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include <kaitai/kaitaistruct.h>
#include <kaitai/kaitaistream.h>

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

/**
 * InfluxDB is a scalable database optimized for storage of time
 * series, real-time application metrics, operations monitoring events,
 * etc, written in Go.
 * 
 * Data is stored in .tsm files, which are kept pretty simple
 * conceptually. Each .tsm file contains a header and footer, which
 * stores offset to an index. Index is used to find a data block for a
 * requested time boundary.
 */

class tsm_t : public kaitai::kstruct {

public:
    class header_t;
    class index_t;

    tsm_t(kaitai::kstream* p_io, kaitai::kstruct* p_parent = 0, tsm_t* p_root = 0);
    void _read();
    ~tsm_t();

    class header_t : public kaitai::kstruct {

    public:

        header_t(kaitai::kstream* p_io, tsm_t* p_parent = 0, tsm_t* p_root = 0);
        void _read();
        ~header_t();

    private:
        std::string m_magic;
        uint8_t m_version;
        tsm_t* m__root;
        tsm_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        uint8_t version() const { return m_version; }
        tsm_t* _root() const { return m__root; }
        tsm_t* _parent() const { return m__parent; }
    };

    class index_t : public kaitai::kstruct {

    public:
        class index_header_t;

        index_t(kaitai::kstream* p_io, tsm_t* p_parent = 0, tsm_t* p_root = 0);
        void _read();
        ~index_t();

        class index_header_t : public kaitai::kstruct {

        public:
            class index_entry_t;

            index_header_t(kaitai::kstream* p_io, tsm_t::index_t* p_parent = 0, tsm_t* p_root = 0);
            void _read();
            ~index_header_t();

            class index_entry_t : public kaitai::kstruct {

            public:
                class block_entry_t;

                index_entry_t(kaitai::kstream* p_io, tsm_t::index_t::index_header_t* p_parent = 0, tsm_t* p_root = 0);
                void _read();
                ~index_entry_t();

                class block_entry_t : public kaitai::kstruct {

                public:

                    block_entry_t(kaitai::kstream* p_io, tsm_t::index_t::index_header_t::index_entry_t* p_parent = 0, tsm_t* p_root = 0);
                    void _read();
                    ~block_entry_t();

                private:
                    uint32_t m_crc32;
                    std::string m_data;
                    tsm_t* m__root;
                    tsm_t::index_t::index_header_t::index_entry_t* m__parent;

                public:
                    uint32_t crc32() const { return m_crc32; }
                    std::string data() const { return m_data; }
                    tsm_t* _root() const { return m__root; }
                    tsm_t::index_t::index_header_t::index_entry_t* _parent() const { return m__parent; }
                };

            private:
                bool f_block;
                block_entry_t* m_block;

            public:
                block_entry_t* block();

            private:
                uint64_t m_min_time;
                uint64_t m_max_time;
                uint64_t m_block_offset;
                uint32_t m_block_size;
                tsm_t* m__root;
                tsm_t::index_t::index_header_t* m__parent;

            public:
                uint64_t min_time() const { return m_min_time; }
                uint64_t max_time() const { return m_max_time; }
                uint64_t block_offset() const { return m_block_offset; }
                uint32_t block_size() const { return m_block_size; }
                tsm_t* _root() const { return m__root; }
                tsm_t::index_t::index_header_t* _parent() const { return m__parent; }
            };

        private:
            uint16_t m_key_len;
            std::string m_key;
            uint8_t m_type;
            uint16_t m_entry_count;
            std::vector<index_entry_t*>* m_index_entries;
            tsm_t* m__root;
            tsm_t::index_t* m__parent;

        public:
            uint16_t key_len() const { return m_key_len; }
            std::string key() const { return m_key; }
            uint8_t type() const { return m_type; }
            uint16_t entry_count() const { return m_entry_count; }
            std::vector<index_entry_t*>* index_entries() const { return m_index_entries; }
            tsm_t* _root() const { return m__root; }
            tsm_t::index_t* _parent() const { return m__parent; }
        };

    private:
        bool f_entries;
        std::vector<index_header_t*>* m_entries;

    public:
        std::vector<index_header_t*>* entries();

    private:
        uint64_t m_offset;
        tsm_t* m__root;
        tsm_t* m__parent;

    public:
        uint64_t offset() const { return m_offset; }
        tsm_t* _root() const { return m__root; }
        tsm_t* _parent() const { return m__parent; }
    };

private:
    bool f_index;
    index_t* m_index;

public:
    index_t* index();

private:
    header_t* m_header;
    tsm_t* m__root;
    kaitai::kstruct* m__parent;

public:
    header_t* header() const { return m_header; }
    tsm_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // TSM_H_

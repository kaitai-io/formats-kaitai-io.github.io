#ifndef GPT_PARTITION_TABLE_H_
#define GPT_PARTITION_TABLE_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

/**
 * \sa Specification taken from https://en.wikipedia.org/wiki/GUID_Partition_Table
 */

class gpt_partition_table_t : public kaitai::kstruct {

public:
    class partition_entry_t;
    class partition_header_t;

    gpt_partition_table_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, gpt_partition_table_t* p__root = 0);

private:
    void _read();

public:
    ~gpt_partition_table_t();

    class partition_entry_t : public kaitai::kstruct {

    public:

        partition_entry_t(kaitai::kstream* p__io, gpt_partition_table_t::partition_header_t* p__parent = 0, gpt_partition_table_t* p__root = 0);

    private:
        void _read();

    public:
        ~partition_entry_t();

    private:
        std::string m_type_guid;
        std::string m_guid;
        uint64_t m_first_lba;
        uint64_t m_last_lba;
        uint64_t m_attributes;
        std::string m_name;
        gpt_partition_table_t* m__root;
        gpt_partition_table_t::partition_header_t* m__parent;

    public:
        std::string type_guid() const { return m_type_guid; }
        std::string guid() const { return m_guid; }
        uint64_t first_lba() const { return m_first_lba; }
        uint64_t last_lba() const { return m_last_lba; }
        uint64_t attributes() const { return m_attributes; }
        std::string name() const { return m_name; }
        gpt_partition_table_t* _root() const { return m__root; }
        gpt_partition_table_t::partition_header_t* _parent() const { return m__parent; }
    };

    class partition_header_t : public kaitai::kstruct {

    public:

        partition_header_t(kaitai::kstream* p__io, gpt_partition_table_t* p__parent = 0, gpt_partition_table_t* p__root = 0);

    private:
        void _read();

    public:
        ~partition_header_t();

    private:
        bool f_entries;
        std::vector<partition_entry_t*>* m_entries;

    public:
        std::vector<partition_entry_t*>* entries();

    private:
        std::string m_signature;
        uint32_t m_revision;
        uint32_t m_header_size;
        uint32_t m_crc32_header;
        uint32_t m_reserved;
        uint64_t m_current_lba;
        uint64_t m_backup_lba;
        uint64_t m_first_usable_lba;
        uint64_t m_last_usable_lba;
        std::string m_disk_guid;
        uint64_t m_entries_start;
        uint32_t m_entries_count;
        uint32_t m_entries_size;
        uint32_t m_crc32_array;
        gpt_partition_table_t* m__root;
        gpt_partition_table_t* m__parent;
        std::vector<std::string>* m__raw_entries;
        std::vector<kaitai::kstream*>* m__io__raw_entries;

    public:
        std::string signature() const { return m_signature; }
        uint32_t revision() const { return m_revision; }
        uint32_t header_size() const { return m_header_size; }
        uint32_t crc32_header() const { return m_crc32_header; }
        uint32_t reserved() const { return m_reserved; }
        uint64_t current_lba() const { return m_current_lba; }
        uint64_t backup_lba() const { return m_backup_lba; }
        uint64_t first_usable_lba() const { return m_first_usable_lba; }
        uint64_t last_usable_lba() const { return m_last_usable_lba; }
        std::string disk_guid() const { return m_disk_guid; }
        uint64_t entries_start() const { return m_entries_start; }
        uint32_t entries_count() const { return m_entries_count; }
        uint32_t entries_size() const { return m_entries_size; }
        uint32_t crc32_array() const { return m_crc32_array; }
        gpt_partition_table_t* _root() const { return m__root; }
        gpt_partition_table_t* _parent() const { return m__parent; }
        std::vector<std::string>* _raw_entries() const { return m__raw_entries; }
        std::vector<kaitai::kstream*>* _io__raw_entries() const { return m__io__raw_entries; }
    };

private:
    bool f_sector_size;
    int32_t m_sector_size;

public:
    int32_t sector_size();

private:
    bool f_primary;
    partition_header_t* m_primary;

public:
    partition_header_t* primary();

private:
    bool f_backup;
    partition_header_t* m_backup;

public:
    partition_header_t* backup();

private:
    gpt_partition_table_t* m__root;
    kaitai::kstruct* m__parent;

public:
    gpt_partition_table_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // GPT_PARTITION_TABLE_H_

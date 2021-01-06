#ifndef APM_PARTITION_TABLE_H_
#define APM_PARTITION_TABLE_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * \sa https://en.wikipedia.org/wiki/Apple_Partition_Map Source
 */

class apm_partition_table_t : public kaitai::kstruct {

public:
    class partition_entry_t;

    apm_partition_table_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, apm_partition_table_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~apm_partition_table_t();

    class partition_entry_t : public kaitai::kstruct {

    public:

        partition_entry_t(kaitai::kstream* p__io, apm_partition_table_t* p__parent = 0, apm_partition_table_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~partition_entry_t();

    private:
        bool f_partition;
        std::string m_partition;
        bool n_partition;

    public:
        bool _is_null_partition() { partition(); return n_partition; };

    private:

    public:
        std::string partition();

    private:
        bool f_data;
        std::string m_data;

    public:
        std::string data();

    private:
        bool f_boot_code;
        std::string m_boot_code;

    public:
        std::string boot_code();

    private:
        std::string m_magic;
        std::string m_reserved_1;
        uint32_t m_number_of_partitions;
        uint32_t m_partition_start;
        uint32_t m_partition_size;
        std::string m_partition_name;
        std::string m_partition_type;
        uint32_t m_data_start;
        uint32_t m_data_size;
        uint32_t m_partition_status;
        uint32_t m_boot_code_start;
        uint32_t m_boot_code_size;
        uint32_t m_boot_loader_address;
        std::string m_reserved_2;
        uint32_t m_boot_code_entry;
        std::string m_reserved_3;
        uint32_t m_boot_code_cksum;
        std::string m_processor_type;
        apm_partition_table_t* m__root;
        apm_partition_table_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        std::string reserved_1() const { return m_reserved_1; }
        uint32_t number_of_partitions() const { return m_number_of_partitions; }

        /**
         * First sector
         */
        uint32_t partition_start() const { return m_partition_start; }

        /**
         * Number of sectors
         */
        uint32_t partition_size() const { return m_partition_size; }
        std::string partition_name() const { return m_partition_name; }
        std::string partition_type() const { return m_partition_type; }

        /**
         * First sector
         */
        uint32_t data_start() const { return m_data_start; }

        /**
         * Number of sectors
         */
        uint32_t data_size() const { return m_data_size; }
        uint32_t partition_status() const { return m_partition_status; }

        /**
         * First sector
         */
        uint32_t boot_code_start() const { return m_boot_code_start; }

        /**
         * Number of bytes
         */
        uint32_t boot_code_size() const { return m_boot_code_size; }

        /**
         * Address of bootloader code
         */
        uint32_t boot_loader_address() const { return m_boot_loader_address; }
        std::string reserved_2() const { return m_reserved_2; }

        /**
         * Boot code entry point
         */
        uint32_t boot_code_entry() const { return m_boot_code_entry; }
        std::string reserved_3() const { return m_reserved_3; }

        /**
         * Boot code checksum
         */
        uint32_t boot_code_cksum() const { return m_boot_code_cksum; }
        std::string processor_type() const { return m_processor_type; }
        apm_partition_table_t* _root() const { return m__root; }
        apm_partition_table_t* _parent() const { return m__parent; }
    };

private:
    bool f_sector_size;
    int32_t m_sector_size;

public:

    /**
     * 0x200 (512) bytes for disks, 0x1000 (4096) bytes is not supported by APM
     * 0x800 (2048) bytes for CDROM
     */
    int32_t sector_size();

private:
    bool f_partition_lookup;
    partition_entry_t* m_partition_lookup;

public:

    /**
     * Every partition entry contains the number of partition entries.
     * We parse the first entry, to know how many to parse, including the first one.
     * No logic is given what to do if other entries have a different number.
     */
    partition_entry_t* partition_lookup();

private:
    bool f_partition_entries;
    std::vector<partition_entry_t*>* m_partition_entries;

public:
    std::vector<partition_entry_t*>* partition_entries();

private:
    apm_partition_table_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_partition_lookup;
    kaitai::kstream* m__io__raw_partition_lookup;
    std::vector<std::string>* m__raw_partition_entries;
    std::vector<kaitai::kstream*>* m__io__raw_partition_entries;

public:
    apm_partition_table_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_partition_lookup() const { return m__raw_partition_lookup; }
    kaitai::kstream* _io__raw_partition_lookup() const { return m__io__raw_partition_lookup; }
    std::vector<std::string>* _raw_partition_entries() const { return m__raw_partition_entries; }
    std::vector<kaitai::kstream*>* _io__raw_partition_entries() const { return m__io__raw_partition_entries; }
};

#endif  // APM_PARTITION_TABLE_H_

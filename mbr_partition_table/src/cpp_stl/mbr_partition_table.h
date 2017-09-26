#ifndef MBR_PARTITION_TABLE_H_
#define MBR_PARTITION_TABLE_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

/**
 * MBR (Master Boot Record) partition table is a traditional way of
 * MS-DOS to partition larger hard disc drives into distinct
 * partitions.
 * 
 * This table is stored in the end of the boot sector (first sector) of
 * the drive, after the bootstrap code. Original DOS 2.0 specification
 * allowed only 4 partitions per disc, but DOS 3.2 introduced concept
 * of "extended partitions", which work as nested extra "boot records"
 * which are pointed to by original ("primary") partitions in MBR.
 */

class mbr_partition_table_t : public kaitai::kstruct {

public:
    class partition_entry_t;
    class chs_t;

    mbr_partition_table_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, mbr_partition_table_t* p__root = 0);

private:
    void _read();

public:
    ~mbr_partition_table_t();

    class partition_entry_t : public kaitai::kstruct {

    public:

        partition_entry_t(kaitai::kstream* p__io, mbr_partition_table_t* p__parent = 0, mbr_partition_table_t* p__root = 0);

    private:
        void _read();

    public:
        ~partition_entry_t();

    private:
        uint8_t m_status;
        chs_t* m_chs_start;
        uint8_t m_partition_type;
        chs_t* m_chs_end;
        uint32_t m_lba_start;
        uint32_t m_num_sectors;
        mbr_partition_table_t* m__root;
        mbr_partition_table_t* m__parent;

    public:
        uint8_t status() const { return m_status; }
        chs_t* chs_start() const { return m_chs_start; }
        uint8_t partition_type() const { return m_partition_type; }
        chs_t* chs_end() const { return m_chs_end; }
        uint32_t lba_start() const { return m_lba_start; }
        uint32_t num_sectors() const { return m_num_sectors; }
        mbr_partition_table_t* _root() const { return m__root; }
        mbr_partition_table_t* _parent() const { return m__parent; }
    };

    class chs_t : public kaitai::kstruct {

    public:

        chs_t(kaitai::kstream* p__io, mbr_partition_table_t::partition_entry_t* p__parent = 0, mbr_partition_table_t* p__root = 0);

    private:
        void _read();

    public:
        ~chs_t();

    private:
        bool f_sector;
        int32_t m_sector;

    public:
        int32_t sector();

    private:
        bool f_cylinder;
        int32_t m_cylinder;

    public:
        int32_t cylinder();

    private:
        uint8_t m_head;
        uint8_t m_b2;
        uint8_t m_b3;
        mbr_partition_table_t* m__root;
        mbr_partition_table_t::partition_entry_t* m__parent;

    public:
        uint8_t head() const { return m_head; }
        uint8_t b2() const { return m_b2; }
        uint8_t b3() const { return m_b3; }
        mbr_partition_table_t* _root() const { return m__root; }
        mbr_partition_table_t::partition_entry_t* _parent() const { return m__parent; }
    };

private:
    std::string m_bootstrap_code;
    std::vector<partition_entry_t*>* m_partitions;
    std::string m_boot_signature;
    mbr_partition_table_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string bootstrap_code() const { return m_bootstrap_code; }
    std::vector<partition_entry_t*>* partitions() const { return m_partitions; }
    std::string boot_signature() const { return m_boot_signature; }
    mbr_partition_table_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // MBR_PARTITION_TABLE_H_

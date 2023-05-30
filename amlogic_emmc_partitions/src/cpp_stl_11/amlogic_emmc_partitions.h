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
 * This is an unnamed and undocumented partition table format implemented by
 * the bootloader and kernel that Amlogic provides for their Linux SoCs (Meson
 * series at least, and probably others). They appear to use this rather than GPT,
 * the industry standard, because their BootROM loads and executes the next stage
 * loader from offset 512 (0x200) on the eMMC, which is exactly where the GPT
 * header would have to start. So instead of changing their BootROM, Amlogic
 * devised this partition table, which lives at an offset of 36MiB (0x240_0000)
 * on the eMMC and so doesn't conflict. This parser expects as input just the
 * partition table from that offset. The maximum number of partitions in a table
 * is 32, which corresponds to a maximum table size of 1304 bytes (0x518).
 * \sa http://aml-code.amlogic.com/kernel/common.git/tree/include/linux/mmc/emmc_partitions.h?id=18a4a87072ababf76ea08c8539e939b5b8a440ef Source
 * \sa http://aml-code.amlogic.com/kernel/common.git/tree/drivers/amlogic/mmc/emmc_partitions.c?id=18a4a87072ababf76ea08c8539e939b5b8a440ef Source
 */

class amlogic_emmc_partitions_t : public kaitai::kstruct {

public:
    class partition_t;

    amlogic_emmc_partitions_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, amlogic_emmc_partitions_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~amlogic_emmc_partitions_t();

    class partition_t : public kaitai::kstruct {

    public:
        class part_flags_t;

        partition_t(kaitai::kstream* p__io, amlogic_emmc_partitions_t* p__parent = nullptr, amlogic_emmc_partitions_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~partition_t();

        class part_flags_t : public kaitai::kstruct {

        public:

            part_flags_t(kaitai::kstream* p__io, amlogic_emmc_partitions_t::partition_t* p__parent = nullptr, amlogic_emmc_partitions_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~part_flags_t();

        private:
            bool m_is_code;
            bool m_is_cache;
            bool m_is_data;
            amlogic_emmc_partitions_t* m__root;
            amlogic_emmc_partitions_t::partition_t* m__parent;

        public:
            bool is_code() const { return m_is_code; }
            bool is_cache() const { return m_is_cache; }
            bool is_data() const { return m_is_data; }
            amlogic_emmc_partitions_t* _root() const { return m__root; }
            amlogic_emmc_partitions_t::partition_t* _parent() const { return m__parent; }
        };

    private:
        std::string m_name;
        uint64_t m_size;
        uint64_t m_offset;
        std::unique_ptr<part_flags_t> m_flags;
        std::string m_padding;
        amlogic_emmc_partitions_t* m__root;
        amlogic_emmc_partitions_t* m__parent;
        std::string m__raw_flags;
        std::unique_ptr<kaitai::kstream> m__io__raw_flags;

    public:
        std::string name() const { return m_name; }
        uint64_t size() const { return m_size; }

        /**
         * The start of the partition relative to the start of the eMMC, in bytes
         */
        uint64_t offset() const { return m_offset; }
        part_flags_t* flags() const { return m_flags.get(); }
        std::string padding() const { return m_padding; }
        amlogic_emmc_partitions_t* _root() const { return m__root; }
        amlogic_emmc_partitions_t* _parent() const { return m__parent; }
        std::string _raw_flags() const { return m__raw_flags; }
        kaitai::kstream* _io__raw_flags() const { return m__io__raw_flags.get(); }
    };

private:
    std::string m_magic;
    std::string m_version;
    int32_t m_num_partitions;
    uint32_t m_checksum;
    std::unique_ptr<std::vector<std::unique_ptr<partition_t>>> m_partitions;
    amlogic_emmc_partitions_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string magic() const { return m_magic; }
    std::string version() const { return m_version; }
    int32_t num_partitions() const { return m_num_partitions; }

    /**
     * To calculate this, treat the first (and only the first) partition
     * descriptor in the table below as an array of unsigned little-endian
     * 32-bit integers. Sum all those integers mod 2^32, then multiply the
     * result by the total number of partitions, also mod 2^32. Amlogic
     * likely meant to include all the partition descriptors in the sum,
     * but their code as written instead repeatedly loops over the first
     * one, once for each partition in the table.
     */
    uint32_t checksum() const { return m_checksum; }
    std::vector<std::unique_ptr<partition_t>>* partitions() const { return m_partitions.get(); }
    amlogic_emmc_partitions_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

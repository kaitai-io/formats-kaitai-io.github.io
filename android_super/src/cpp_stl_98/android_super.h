#ifndef ANDROID_SUPER_H_
#define ANDROID_SUPER_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * The metadata stored by Android at the beginning of a "super" partition, which
 * is what it calls a disk partition that holds one or more Dynamic Partitions.
 * Dynamic Partitions do more or less the same thing that LVM does on Linux,
 * allowing Android to map ranges of non-contiguous extents to a single logical
 * device. This metadata holds that mapping.
 * \sa https://source.android.com/docs/core/ota/dynamic_partitions Source
 * \sa https://android.googlesource.com/platform/system/core/+/refs/tags/android-11.0.0_r8/fs_mgr/liblp/include/liblp/metadata_format.h Source
 */

class android_super_t : public kaitai::kstruct {

public:
    class root_t;
    class geometry_t;
    class metadata_t;

    android_super_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, android_super_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~android_super_t();

    class root_t : public kaitai::kstruct {

    public:

        root_t(kaitai::kstream* p__io, android_super_t* p__parent = 0, android_super_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~root_t();

    private:
        geometry_t* m_primary_geometry;
        geometry_t* m_backup_geometry;
        std::vector<metadata_t*>* m_primary_metadata;
        std::vector<metadata_t*>* m_backup_metadata;
        android_super_t* m__root;
        android_super_t* m__parent;
        std::string m__raw_primary_geometry;
        kaitai::kstream* m__io__raw_primary_geometry;
        std::string m__raw_backup_geometry;
        kaitai::kstream* m__io__raw_backup_geometry;
        std::vector<std::string>* m__raw_primary_metadata;
        std::vector<kaitai::kstream*>* m__io__raw_primary_metadata;
        std::vector<std::string>* m__raw_backup_metadata;
        std::vector<kaitai::kstream*>* m__io__raw_backup_metadata;

    public:
        geometry_t* primary_geometry() const { return m_primary_geometry; }
        geometry_t* backup_geometry() const { return m_backup_geometry; }
        std::vector<metadata_t*>* primary_metadata() const { return m_primary_metadata; }
        std::vector<metadata_t*>* backup_metadata() const { return m_backup_metadata; }
        android_super_t* _root() const { return m__root; }
        android_super_t* _parent() const { return m__parent; }
        std::string _raw_primary_geometry() const { return m__raw_primary_geometry; }
        kaitai::kstream* _io__raw_primary_geometry() const { return m__io__raw_primary_geometry; }
        std::string _raw_backup_geometry() const { return m__raw_backup_geometry; }
        kaitai::kstream* _io__raw_backup_geometry() const { return m__io__raw_backup_geometry; }
        std::vector<std::string>* _raw_primary_metadata() const { return m__raw_primary_metadata; }
        std::vector<kaitai::kstream*>* _io__raw_primary_metadata() const { return m__io__raw_primary_metadata; }
        std::vector<std::string>* _raw_backup_metadata() const { return m__raw_backup_metadata; }
        std::vector<kaitai::kstream*>* _io__raw_backup_metadata() const { return m__io__raw_backup_metadata; }
    };

    class geometry_t : public kaitai::kstruct {

    public:

        geometry_t(kaitai::kstream* p__io, android_super_t::root_t* p__parent = 0, android_super_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~geometry_t();

    private:
        std::string m_magic;
        uint32_t m_struct_size;
        std::string m_checksum;
        uint32_t m_metadata_max_size;
        uint32_t m_metadata_slot_count;
        uint32_t m_logical_block_size;
        android_super_t* m__root;
        android_super_t::root_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        uint32_t struct_size() const { return m_struct_size; }

        /**
         * SHA-256 hash of struct_size bytes from beginning of geometry,
         * calculated as if checksum were zeroed out
         */
        std::string checksum() const { return m_checksum; }
        uint32_t metadata_max_size() const { return m_metadata_max_size; }
        uint32_t metadata_slot_count() const { return m_metadata_slot_count; }
        uint32_t logical_block_size() const { return m_logical_block_size; }
        android_super_t* _root() const { return m__root; }
        android_super_t::root_t* _parent() const { return m__parent; }
    };

    class metadata_t : public kaitai::kstruct {

    public:
        class block_device_t;
        class extent_t;
        class table_descriptor_t;
        class partition_t;
        class group_t;

        enum table_kind_t {
            TABLE_KIND_PARTITIONS = 0,
            TABLE_KIND_EXTENTS = 1,
            TABLE_KIND_GROUPS = 2,
            TABLE_KIND_BLOCK_DEVICES = 3
        };

        metadata_t(kaitai::kstream* p__io, android_super_t::root_t* p__parent = 0, android_super_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~metadata_t();

        class block_device_t : public kaitai::kstruct {

        public:

            block_device_t(kaitai::kstream* p__io, android_super_t::metadata_t::table_descriptor_t* p__parent = 0, android_super_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~block_device_t();

        private:
            uint64_t m_first_logical_sector;
            uint32_t m_alignment;
            uint32_t m_alignment_offset;
            uint64_t m_size;
            std::string m_partition_name;
            bool m_flag_slot_suffixed;
            uint64_t m_flags_reserved;
            android_super_t* m__root;
            android_super_t::metadata_t::table_descriptor_t* m__parent;

        public:
            uint64_t first_logical_sector() const { return m_first_logical_sector; }
            uint32_t alignment() const { return m_alignment; }
            uint32_t alignment_offset() const { return m_alignment_offset; }
            uint64_t size() const { return m_size; }
            std::string partition_name() const { return m_partition_name; }
            bool flag_slot_suffixed() const { return m_flag_slot_suffixed; }
            uint64_t flags_reserved() const { return m_flags_reserved; }
            android_super_t* _root() const { return m__root; }
            android_super_t::metadata_t::table_descriptor_t* _parent() const { return m__parent; }
        };

        class extent_t : public kaitai::kstruct {

        public:

            enum target_type_t {
                TARGET_TYPE_LINEAR = 0,
                TARGET_TYPE_ZERO = 1
            };

            extent_t(kaitai::kstream* p__io, android_super_t::metadata_t::table_descriptor_t* p__parent = 0, android_super_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~extent_t();

        private:
            uint64_t m_num_sectors;
            target_type_t m_target_type;
            uint64_t m_target_data;
            uint32_t m_target_source;
            android_super_t* m__root;
            android_super_t::metadata_t::table_descriptor_t* m__parent;

        public:
            uint64_t num_sectors() const { return m_num_sectors; }
            target_type_t target_type() const { return m_target_type; }
            uint64_t target_data() const { return m_target_data; }
            uint32_t target_source() const { return m_target_source; }
            android_super_t* _root() const { return m__root; }
            android_super_t::metadata_t::table_descriptor_t* _parent() const { return m__parent; }
        };

        class table_descriptor_t : public kaitai::kstruct {

        public:

            table_descriptor_t(table_kind_t p_kind, kaitai::kstream* p__io, android_super_t::metadata_t* p__parent = 0, android_super_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~table_descriptor_t();

        private:
            bool f_table;
            std::vector<kaitai::kstruct*>* m_table;

        public:
            std::vector<kaitai::kstruct*>* table();

        private:
            uint32_t m_offset;
            uint32_t m_num_entries;
            uint32_t m_entry_size;
            table_kind_t m_kind;
            android_super_t* m__root;
            android_super_t::metadata_t* m__parent;
            std::vector<std::string>* m__raw_table;
            std::vector<kaitai::kstream*>* m__io__raw_table;

        public:
            uint32_t offset() const { return m_offset; }
            uint32_t num_entries() const { return m_num_entries; }
            uint32_t entry_size() const { return m_entry_size; }
            table_kind_t kind() const { return m_kind; }
            android_super_t* _root() const { return m__root; }
            android_super_t::metadata_t* _parent() const { return m__parent; }
            std::vector<std::string>* _raw_table() const { return m__raw_table; }
            std::vector<kaitai::kstream*>* _io__raw_table() const { return m__io__raw_table; }
        };

        class partition_t : public kaitai::kstruct {

        public:

            partition_t(kaitai::kstream* p__io, android_super_t::metadata_t::table_descriptor_t* p__parent = 0, android_super_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~partition_t();

        private:
            std::string m_name;
            bool m_attr_readonly;
            bool m_attr_slot_suffixed;
            bool m_attr_updated;
            bool m_attr_disabled;
            uint64_t m_attrs_reserved;
            uint32_t m_first_extent_index;
            uint32_t m_num_extents;
            uint32_t m_group_index;
            android_super_t* m__root;
            android_super_t::metadata_t::table_descriptor_t* m__parent;

        public:
            std::string name() const { return m_name; }
            bool attr_readonly() const { return m_attr_readonly; }
            bool attr_slot_suffixed() const { return m_attr_slot_suffixed; }
            bool attr_updated() const { return m_attr_updated; }
            bool attr_disabled() const { return m_attr_disabled; }
            uint64_t attrs_reserved() const { return m_attrs_reserved; }
            uint32_t first_extent_index() const { return m_first_extent_index; }
            uint32_t num_extents() const { return m_num_extents; }
            uint32_t group_index() const { return m_group_index; }
            android_super_t* _root() const { return m__root; }
            android_super_t::metadata_t::table_descriptor_t* _parent() const { return m__parent; }
        };

        class group_t : public kaitai::kstruct {

        public:

            group_t(kaitai::kstream* p__io, android_super_t::metadata_t::table_descriptor_t* p__parent = 0, android_super_t* p__root = 0);

        private:
            void _read();
            void _clean_up();

        public:
            ~group_t();

        private:
            std::string m_name;
            bool m_flag_slot_suffixed;
            uint64_t m_flags_reserved;
            uint64_t m_maximum_size;
            android_super_t* m__root;
            android_super_t::metadata_t::table_descriptor_t* m__parent;

        public:
            std::string name() const { return m_name; }
            bool flag_slot_suffixed() const { return m_flag_slot_suffixed; }
            uint64_t flags_reserved() const { return m_flags_reserved; }
            uint64_t maximum_size() const { return m_maximum_size; }
            android_super_t* _root() const { return m__root; }
            android_super_t::metadata_t::table_descriptor_t* _parent() const { return m__parent; }
        };

    private:
        std::string m_magic;
        uint16_t m_major_version;
        uint16_t m_minor_version;
        uint32_t m_header_size;
        std::string m_header_checksum;
        uint32_t m_tables_size;
        std::string m_tables_checksum;
        table_descriptor_t* m_partitions;
        table_descriptor_t* m_extents;
        table_descriptor_t* m_groups;
        table_descriptor_t* m_block_devices;
        android_super_t* m__root;
        android_super_t::root_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        uint16_t major_version() const { return m_major_version; }
        uint16_t minor_version() const { return m_minor_version; }
        uint32_t header_size() const { return m_header_size; }

        /**
         * SHA-256 hash of header_size bytes from beginning of metadata,
         * calculated as if header_checksum were zeroed out
         */
        std::string header_checksum() const { return m_header_checksum; }
        uint32_t tables_size() const { return m_tables_size; }

        /**
         * SHA-256 hash of tables_size bytes from end of header
         */
        std::string tables_checksum() const { return m_tables_checksum; }
        table_descriptor_t* partitions() const { return m_partitions; }
        table_descriptor_t* extents() const { return m_extents; }
        table_descriptor_t* groups() const { return m_groups; }
        table_descriptor_t* block_devices() const { return m_block_devices; }
        android_super_t* _root() const { return m__root; }
        android_super_t::root_t* _parent() const { return m__parent; }
    };

private:
    bool f_root;
    root_t* m_root;

public:
    root_t* root();

private:
    android_super_t* m__root;
    kaitai::kstruct* m__parent;

public:
    android_super_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // ANDROID_SUPER_H_

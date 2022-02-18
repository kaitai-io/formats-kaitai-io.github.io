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
 * A native VirtualBox file format
 * Images for testing can be downloaded from
 *  * https://www.osboxes.org/virtualbox-images/
 *  * https://virtualboxes.org/images/
 * or you can convert images of other formats.
 * \sa https://github.com/qemu/qemu/blob/master/block/vdi.c Source
 */

class vdi_t : public kaitai::kstruct {

public:
    class header_t;
    class blocks_map_t;
    class disk_t;

    enum image_type_t {
        IMAGE_TYPE_DYNAMIC = 1,
        IMAGE_TYPE_STATIC = 2,
        IMAGE_TYPE_UNDO = 3,
        IMAGE_TYPE_DIFF = 4
    };

    vdi_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, vdi_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~vdi_t();

    class header_t : public kaitai::kstruct {

    public:
        class uuid_t;
        class version_t;
        class header_main_t;

        header_t(kaitai::kstream* p__io, vdi_t* p__parent = nullptr, vdi_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~header_t();

        class uuid_t : public kaitai::kstruct {

        public:

            uuid_t(kaitai::kstream* p__io, vdi_t::header_t::header_main_t* p__parent = nullptr, vdi_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~uuid_t();

        private:
            std::string m_uuid;
            vdi_t* m__root;
            vdi_t::header_t::header_main_t* m__parent;

        public:
            std::string uuid() const { return m_uuid; }
            vdi_t* _root() const { return m__root; }
            vdi_t::header_t::header_main_t* _parent() const { return m__parent; }
        };

        class version_t : public kaitai::kstruct {

        public:

            version_t(kaitai::kstream* p__io, vdi_t::header_t* p__parent = nullptr, vdi_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~version_t();

        private:
            uint16_t m_major;
            uint16_t m_minor;
            vdi_t* m__root;
            vdi_t::header_t* m__parent;

        public:
            uint16_t major() const { return m_major; }
            uint16_t minor() const { return m_minor; }
            vdi_t* _root() const { return m__root; }
            vdi_t::header_t* _parent() const { return m__parent; }
        };

        class header_main_t : public kaitai::kstruct {

        public:
            class geometry_t;
            class flags_t;

            header_main_t(kaitai::kstream* p__io, vdi_t::header_t* p__parent = nullptr, vdi_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~header_main_t();

            class geometry_t : public kaitai::kstruct {

            public:

                geometry_t(kaitai::kstream* p__io, vdi_t::header_t::header_main_t* p__parent = nullptr, vdi_t* p__root = nullptr);

            private:
                void _read();
                void _clean_up();

            public:
                ~geometry_t();

            private:
                uint32_t m_cylinders;
                uint32_t m_heads;
                uint32_t m_sectors;
                uint32_t m_sector_size;
                vdi_t* m__root;
                vdi_t::header_t::header_main_t* m__parent;

            public:
                uint32_t cylinders() const { return m_cylinders; }
                uint32_t heads() const { return m_heads; }
                uint32_t sectors() const { return m_sectors; }
                uint32_t sector_size() const { return m_sector_size; }
                vdi_t* _root() const { return m__root; }
                vdi_t::header_t::header_main_t* _parent() const { return m__parent; }
            };

            class flags_t : public kaitai::kstruct {

            public:

                flags_t(kaitai::kstream* p__io, vdi_t::header_t::header_main_t* p__parent = nullptr, vdi_t* p__root = nullptr);

            private:
                void _read();
                void _clean_up();

            public:
                ~flags_t();

            private:
                uint64_t m_reserved0;
                bool m_zero_expand;
                uint64_t m_reserved1;
                bool m_diff;
                bool m_fixed;
                uint64_t m_reserved2;
                vdi_t* m__root;
                vdi_t::header_t::header_main_t* m__parent;

            public:
                uint64_t reserved0() const { return m_reserved0; }
                bool zero_expand() const { return m_zero_expand; }
                uint64_t reserved1() const { return m_reserved1; }
                bool diff() const { return m_diff; }
                bool fixed() const { return m_fixed; }
                uint64_t reserved2() const { return m_reserved2; }
                vdi_t* _root() const { return m__root; }
                vdi_t::header_t::header_main_t* _parent() const { return m__parent; }
            };

        private:
            image_type_t m_image_type;
            std::unique_ptr<flags_t> m_image_flags;
            std::string m_description;
            uint32_t m_blocks_map_offset;
            bool n_blocks_map_offset;

        public:
            bool _is_null_blocks_map_offset() { blocks_map_offset(); return n_blocks_map_offset; };

        private:
            uint32_t m_offset_data;
            bool n_offset_data;

        public:
            bool _is_null_offset_data() { offset_data(); return n_offset_data; };

        private:
            std::unique_ptr<geometry_t> m_geometry;
            uint32_t m_reserved1;
            bool n_reserved1;

        public:
            bool _is_null_reserved1() { reserved1(); return n_reserved1; };

        private:
            uint64_t m_disk_size;
            uint32_t m_block_data_size;
            uint32_t m_block_metadata_size;
            bool n_block_metadata_size;

        public:
            bool _is_null_block_metadata_size() { block_metadata_size(); return n_block_metadata_size; };

        private:
            uint32_t m_blocks_in_image;
            uint32_t m_blocks_allocated;
            std::unique_ptr<uuid_t> m_uuid_image;
            std::unique_ptr<uuid_t> m_uuid_last_snap;
            std::unique_ptr<uuid_t> m_uuid_link;
            std::unique_ptr<uuid_t> m_uuid_parent;
            bool n_uuid_parent;

        public:
            bool _is_null_uuid_parent() { uuid_parent(); return n_uuid_parent; };

        private:
            std::unique_ptr<geometry_t> m_lchc_geometry;
            bool n_lchc_geometry;

        public:
            bool _is_null_lchc_geometry() { lchc_geometry(); return n_lchc_geometry; };

        private:
            vdi_t* m__root;
            vdi_t::header_t* m__parent;

        public:
            image_type_t image_type() const { return m_image_type; }
            flags_t* image_flags() const { return m_image_flags.get(); }
            std::string description() const { return m_description; }
            uint32_t blocks_map_offset() const { return m_blocks_map_offset; }
            uint32_t offset_data() const { return m_offset_data; }
            geometry_t* geometry() const { return m_geometry.get(); }
            uint32_t reserved1() const { return m_reserved1; }
            uint64_t disk_size() const { return m_disk_size; }

            /**
             * Size of block (bytes).
             */
            uint32_t block_data_size() const { return m_block_data_size; }
            uint32_t block_metadata_size() const { return m_block_metadata_size; }
            uint32_t blocks_in_image() const { return m_blocks_in_image; }
            uint32_t blocks_allocated() const { return m_blocks_allocated; }
            uuid_t* uuid_image() const { return m_uuid_image.get(); }
            uuid_t* uuid_last_snap() const { return m_uuid_last_snap.get(); }
            uuid_t* uuid_link() const { return m_uuid_link.get(); }
            uuid_t* uuid_parent() const { return m_uuid_parent.get(); }
            geometry_t* lchc_geometry() const { return m_lchc_geometry.get(); }
            vdi_t* _root() const { return m__root; }
            vdi_t::header_t* _parent() const { return m__parent; }
        };

    private:
        bool f_header_size;
        int32_t m_header_size;

    public:
        int32_t header_size();

    private:
        bool f_blocks_map_offset;
        uint32_t m_blocks_map_offset;

    public:
        uint32_t blocks_map_offset();

    private:
        bool f_subheader_size_is_dynamic;
        bool m_subheader_size_is_dynamic;

    public:
        bool subheader_size_is_dynamic();

    private:
        bool f_blocks_offset;
        uint32_t m_blocks_offset;

    public:
        uint32_t blocks_offset();

    private:
        bool f_block_size;
        int32_t m_block_size;

    public:
        int32_t block_size();

    private:
        bool f_blocks_map_size;
        int32_t m_blocks_map_size;

    public:
        int32_t blocks_map_size();

    private:
        std::string m_text;
        std::string m_signature;
        std::unique_ptr<version_t> m_version;
        uint32_t m_header_size_optional;
        bool n_header_size_optional;

    public:
        bool _is_null_header_size_optional() { header_size_optional(); return n_header_size_optional; };

    private:
        std::unique_ptr<header_main_t> m_header_main;
        vdi_t* m__root;
        vdi_t* m__parent;
        std::string m__raw_header_main;
        std::unique_ptr<kaitai::kstream> m__io__raw_header_main;

    public:
        std::string text() const { return m_text; }
        std::string signature() const { return m_signature; }
        version_t* version() const { return m_version.get(); }
        uint32_t header_size_optional() const { return m_header_size_optional; }
        header_main_t* header_main() const { return m_header_main.get(); }
        vdi_t* _root() const { return m__root; }
        vdi_t* _parent() const { return m__parent; }
        std::string _raw_header_main() const { return m__raw_header_main; }
        kaitai::kstream* _io__raw_header_main() const { return m__io__raw_header_main.get(); }
    };

    class blocks_map_t : public kaitai::kstruct {

    public:
        class block_index_t;

        blocks_map_t(kaitai::kstream* p__io, vdi_t* p__parent = nullptr, vdi_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~blocks_map_t();

        class block_index_t : public kaitai::kstruct {

        public:

            block_index_t(kaitai::kstream* p__io, vdi_t::blocks_map_t* p__parent = nullptr, vdi_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~block_index_t();

        private:
            bool f_is_allocated;
            bool m_is_allocated;

        public:
            bool is_allocated();

        private:
            bool f_block;
            block_t* m_block;
            bool n_block;

        public:
            bool _is_null_block() { block(); return n_block; };

        private:

        public:
            block_t* block();

        private:
            uint32_t m_index;
            vdi_t* m__root;
            vdi_t::blocks_map_t* m__parent;

        public:
            uint32_t index() const { return m_index; }
            vdi_t* _root() const { return m__root; }
            vdi_t::blocks_map_t* _parent() const { return m__parent; }
        };

    private:
        std::unique_ptr<std::vector<std::unique_ptr<block_index_t>>> m_index;
        vdi_t* m__root;
        vdi_t* m__parent;

    public:
        std::vector<std::unique_ptr<block_index_t>>* index() const { return m_index.get(); }
        vdi_t* _root() const { return m__root; }
        vdi_t* _parent() const { return m__parent; }
    };

    class disk_t : public kaitai::kstruct {

    public:
        class block_t;

        disk_t(kaitai::kstream* p__io, vdi_t* p__parent = nullptr, vdi_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~disk_t();

        class block_t : public kaitai::kstruct {

        public:
            class sector_t;

            block_t(kaitai::kstream* p__io, vdi_t::disk_t* p__parent = nullptr, vdi_t* p__root = nullptr);

        private:
            void _read();
            void _clean_up();

        public:
            ~block_t();

            class sector_t : public kaitai::kstruct {

            public:

                sector_t(kaitai::kstream* p__io, vdi_t::disk_t::block_t* p__parent = nullptr, vdi_t* p__root = nullptr);

            private:
                void _read();
                void _clean_up();

            public:
                ~sector_t();

            private:
                std::string m_data;
                vdi_t* m__root;
                vdi_t::disk_t::block_t* m__parent;

            public:
                std::string data() const { return m_data; }
                vdi_t* _root() const { return m__root; }
                vdi_t::disk_t::block_t* _parent() const { return m__parent; }
            };

        private:
            std::string m_metadata;
            std::unique_ptr<std::vector<std::unique_ptr<sector_t>>> m_data;
            vdi_t* m__root;
            vdi_t::disk_t* m__parent;
            std::unique_ptr<std::vector<std::string>> m__raw_data;
            std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>> m__io__raw_data;

        public:
            std::string metadata() const { return m_metadata; }
            std::vector<std::unique_ptr<sector_t>>* data() const { return m_data.get(); }
            vdi_t* _root() const { return m__root; }
            vdi_t::disk_t* _parent() const { return m__parent; }
            std::vector<std::string>* _raw_data() const { return m__raw_data.get(); }
            std::vector<std::unique_ptr<kaitai::kstream>>* _io__raw_data() const { return m__io__raw_data.get(); }
        };

    private:
        std::unique_ptr<std::vector<std::unique_ptr<block_t>>> m_blocks;
        vdi_t* m__root;
        vdi_t* m__parent;

    public:
        std::vector<std::unique_ptr<block_t>>* blocks() const { return m_blocks.get(); }
        vdi_t* _root() const { return m__root; }
        vdi_t* _parent() const { return m__parent; }
    };

private:
    bool f_block_discarded;
    int32_t m_block_discarded;

public:
    int32_t block_discarded();

private:
    bool f_block_unallocated;
    int32_t m_block_unallocated;

public:
    int32_t block_unallocated();

private:
    bool f_blocks_map;
    std::unique_ptr<blocks_map_t> m_blocks_map;

public:

    /**
     * block_index = offset_in_virtual_disk / block_size actual_data_offset = blocks_map[block_index]*block_size+metadata_size+offset_in_block
     * The blocks_map will take up blocks_in_image_max * sizeof(uint32_t) bytes; since the blocks_map is read and written in a single operation, its size needs to be limited to INT_MAX; furthermore, when opening an image, the blocks_map size is rounded up to be aligned on BDRV_SECTOR_SIZE. Therefore this should satisfy the following: blocks_in_image_max * sizeof(uint32_t) + BDRV_SECTOR_SIZE == INT_MAX + 1 (INT_MAX + 1 is the first value not representable as an int) This guarantees that any value below or equal to the constant will, when multiplied by sizeof(uint32_t) and rounded up to a BDRV_SECTOR_SIZE boundary, still be below or equal to INT_MAX.
     */
    blocks_map_t* blocks_map();

private:
    bool f_disk;
    std::unique_ptr<disk_t> m_disk;

public:
    disk_t* disk();

private:
    std::unique_ptr<header_t> m_header;
    vdi_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_blocks_map;
    std::unique_ptr<kaitai::kstream> m__io__raw_blocks_map;

public:
    header_t* header() const { return m_header.get(); }
    vdi_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_blocks_map() const { return m__raw_blocks_map; }
    kaitai::kstream* _io__raw_blocks_map() const { return m__io__raw_blocks_map.get(); }
};

#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class ext2_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>
#include <set>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

class ext2_t : public kaitai::kstruct {

public:
    class bgd_t;
    class block_group_t;
    class block_ptr_t;
    class dir_t;
    class dir_entry_t;
    class inode_t;
    class raw_block_t;
    class super_block_struct_t;

    ext2_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, ext2_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~ext2_t();

    class bgd_t : public kaitai::kstruct {

    public:

        bgd_t(kaitai::kstream* p__io, ext2_t::block_group_t* p__parent = nullptr, ext2_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~bgd_t();

    private:
        bool f_block_bitmap;
        std::string m_block_bitmap;

    public:
        std::string block_bitmap();

    private:
        bool f_inode_bitmap;
        std::string m_inode_bitmap;

    public:
        std::string inode_bitmap();

    private:
        bool f_inodes;
        std::unique_ptr<std::vector<std::unique_ptr<inode_t>>> m_inodes;

    public:
        std::vector<std::unique_ptr<inode_t>>* inodes();

    private:
        uint32_t m_block_bitmap_block;
        uint32_t m_inode_bitmap_block;
        uint32_t m_inode_table_block;
        uint16_t m_free_blocks_count;
        uint16_t m_free_inodes_count;
        uint16_t m_used_dirs_count;
        std::string m_pad_reserved;
        ext2_t* m__root;
        ext2_t::block_group_t* m__parent;

    public:
        uint32_t block_bitmap_block() const { return m_block_bitmap_block; }
        uint32_t inode_bitmap_block() const { return m_inode_bitmap_block; }
        uint32_t inode_table_block() const { return m_inode_table_block; }
        uint16_t free_blocks_count() const { return m_free_blocks_count; }
        uint16_t free_inodes_count() const { return m_free_inodes_count; }
        uint16_t used_dirs_count() const { return m_used_dirs_count; }
        std::string pad_reserved() const { return m_pad_reserved; }
        ext2_t* _root() const { return m__root; }
        ext2_t::block_group_t* _parent() const { return m__parent; }
    };

    class block_group_t : public kaitai::kstruct {

    public:

        block_group_t(kaitai::kstream* p__io, ext2_t* p__parent = nullptr, ext2_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~block_group_t();

    private:
        std::unique_ptr<super_block_struct_t> m_super_block;
        std::unique_ptr<std::vector<std::unique_ptr<bgd_t>>> m_block_groups;
        ext2_t* m__root;
        ext2_t* m__parent;
        std::string m__raw_super_block;
        std::unique_ptr<kaitai::kstream> m__io__raw_super_block;

    public:
        super_block_struct_t* super_block() const { return m_super_block.get(); }
        std::vector<std::unique_ptr<bgd_t>>* block_groups() const { return m_block_groups.get(); }
        ext2_t* _root() const { return m__root; }
        ext2_t* _parent() const { return m__parent; }
        std::string _raw_super_block() const { return m__raw_super_block; }
        kaitai::kstream* _io__raw_super_block() const { return m__io__raw_super_block.get(); }
    };

    class block_ptr_t : public kaitai::kstruct {

    public:

        block_ptr_t(kaitai::kstream* p__io, ext2_t::inode_t* p__parent = nullptr, ext2_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~block_ptr_t();

    private:
        bool f_body;
        std::unique_ptr<raw_block_t> m_body;

    public:
        raw_block_t* body();

    private:
        uint32_t m_ptr;
        ext2_t* m__root;
        ext2_t::inode_t* m__parent;
        std::string m__raw_body;
        std::unique_ptr<kaitai::kstream> m__io__raw_body;

    public:
        uint32_t ptr() const { return m_ptr; }
        ext2_t* _root() const { return m__root; }
        ext2_t::inode_t* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body.get(); }
    };

    class dir_t : public kaitai::kstruct {

    public:

        dir_t(kaitai::kstream* p__io, ext2_t::inode_t* p__parent = nullptr, ext2_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~dir_t();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<dir_entry_t>>> m_entries;
        ext2_t* m__root;
        ext2_t::inode_t* m__parent;

    public:
        std::vector<std::unique_ptr<dir_entry_t>>* entries() const { return m_entries.get(); }
        ext2_t* _root() const { return m__root; }
        ext2_t::inode_t* _parent() const { return m__parent; }
    };

    class dir_entry_t : public kaitai::kstruct {

    public:

        enum file_type_enum_t {
            FILE_TYPE_ENUM_UNKNOWN = 0,
            FILE_TYPE_ENUM_REG_FILE = 1,
            FILE_TYPE_ENUM_DIR = 2,
            FILE_TYPE_ENUM_CHRDEV = 3,
            FILE_TYPE_ENUM_BLKDEV = 4,
            FILE_TYPE_ENUM_FIFO = 5,
            FILE_TYPE_ENUM_SOCK = 6,
            FILE_TYPE_ENUM_SYMLINK = 7
        };
        static bool _is_defined_file_type_enum_t(file_type_enum_t v);

    private:
        static const std::set<file_type_enum_t> _values_file_type_enum_t;

    public:

        dir_entry_t(kaitai::kstream* p__io, ext2_t::dir_t* p__parent = nullptr, ext2_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~dir_entry_t();

    private:
        bool f_inode;
        inode_t* m_inode;

    public:
        inode_t* inode();

    private:
        uint32_t m_inode_ptr;
        uint16_t m_rec_len;
        uint8_t m_name_len;
        file_type_enum_t m_file_type;
        std::string m_name;
        std::string m_padding;
        ext2_t* m__root;
        ext2_t::dir_t* m__parent;

    public:
        uint32_t inode_ptr() const { return m_inode_ptr; }
        uint16_t rec_len() const { return m_rec_len; }
        uint8_t name_len() const { return m_name_len; }
        file_type_enum_t file_type() const { return m_file_type; }
        std::string name() const { return m_name; }
        std::string padding() const { return m_padding; }
        ext2_t* _root() const { return m__root; }
        ext2_t::dir_t* _parent() const { return m__parent; }
    };

    class inode_t : public kaitai::kstruct {

    public:

        inode_t(kaitai::kstream* p__io, ext2_t::bgd_t* p__parent = nullptr, ext2_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~inode_t();

    private:
        bool f_as_dir;
        std::unique_ptr<dir_t> m_as_dir;

    public:
        dir_t* as_dir();

    private:
        uint16_t m_mode;
        uint16_t m_uid;
        uint32_t m_size;
        uint32_t m_atime;
        uint32_t m_ctime;
        uint32_t m_mtime;
        uint32_t m_dtime;
        uint16_t m_gid;
        uint16_t m_links_count;
        uint32_t m_blocks;
        uint32_t m_flags;
        uint32_t m_osd1;
        std::unique_ptr<std::vector<std::unique_ptr<block_ptr_t>>> m_block;
        uint32_t m_generation;
        uint32_t m_file_acl;
        uint32_t m_dir_acl;
        uint32_t m_faddr;
        std::string m_osd2;
        ext2_t* m__root;
        ext2_t::bgd_t* m__parent;

    public:
        uint16_t mode() const { return m_mode; }
        uint16_t uid() const { return m_uid; }
        uint32_t size() const { return m_size; }
        uint32_t atime() const { return m_atime; }
        uint32_t ctime() const { return m_ctime; }
        uint32_t mtime() const { return m_mtime; }
        uint32_t dtime() const { return m_dtime; }
        uint16_t gid() const { return m_gid; }
        uint16_t links_count() const { return m_links_count; }
        uint32_t blocks() const { return m_blocks; }
        uint32_t flags() const { return m_flags; }
        uint32_t osd1() const { return m_osd1; }
        std::vector<std::unique_ptr<block_ptr_t>>* block() const { return m_block.get(); }
        uint32_t generation() const { return m_generation; }
        uint32_t file_acl() const { return m_file_acl; }
        uint32_t dir_acl() const { return m_dir_acl; }
        uint32_t faddr() const { return m_faddr; }
        std::string osd2() const { return m_osd2; }
        ext2_t* _root() const { return m__root; }
        ext2_t::bgd_t* _parent() const { return m__parent; }
    };

    class raw_block_t : public kaitai::kstruct {

    public:

        raw_block_t(kaitai::kstream* p__io, ext2_t::block_ptr_t* p__parent = nullptr, ext2_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~raw_block_t();

    private:
        std::string m_body;
        ext2_t* m__root;
        ext2_t::block_ptr_t* m__parent;

    public:
        std::string body() const { return m_body; }
        ext2_t* _root() const { return m__root; }
        ext2_t::block_ptr_t* _parent() const { return m__parent; }
    };

    class super_block_struct_t : public kaitai::kstruct {

    public:

        enum errors_enum_t {
            ERRORS_ENUM_ACT_CONTINUE = 1,
            ERRORS_ENUM_ACT_RO = 2,
            ERRORS_ENUM_ACT_PANIC = 3
        };
        static bool _is_defined_errors_enum_t(errors_enum_t v);

    private:
        static const std::set<errors_enum_t> _values_errors_enum_t;

    public:

        enum state_enum_t {
            STATE_ENUM_VALID_FS = 1,
            STATE_ENUM_ERROR_FS = 2
        };
        static bool _is_defined_state_enum_t(state_enum_t v);

    private:
        static const std::set<state_enum_t> _values_state_enum_t;

    public:

        super_block_struct_t(kaitai::kstream* p__io, ext2_t::block_group_t* p__parent = nullptr, ext2_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~super_block_struct_t();

    private:
        bool f_block_group_count;
        int32_t m_block_group_count;

    public:
        int32_t block_group_count();

    private:
        bool f_block_size;
        int32_t m_block_size;

    public:
        int32_t block_size();

    private:
        uint32_t m_inodes_count;
        uint32_t m_blocks_count;
        uint32_t m_r_blocks_count;
        uint32_t m_free_blocks_count;
        uint32_t m_free_inodes_count;
        uint32_t m_first_data_block;
        uint32_t m_log_block_size;
        uint32_t m_log_frag_size;
        uint32_t m_blocks_per_group;
        uint32_t m_frags_per_group;
        uint32_t m_inodes_per_group;
        uint32_t m_mtime;
        uint32_t m_wtime;
        uint16_t m_mnt_count;
        uint16_t m_max_mnt_count;
        std::string m_magic;
        state_enum_t m_state;
        errors_enum_t m_errors;
        uint16_t m_minor_rev_level;
        uint32_t m_lastcheck;
        uint32_t m_checkinterval;
        uint32_t m_creator_os;
        uint32_t m_rev_level;
        uint16_t m_def_resuid;
        uint16_t m_def_resgid;
        uint32_t m_first_ino;
        uint16_t m_inode_size;
        uint16_t m_block_group_nr;
        uint32_t m_feature_compat;
        uint32_t m_feature_incompat;
        uint32_t m_feature_ro_compat;
        std::string m_uuid;
        std::string m_volume_name;
        std::string m_last_mounted;
        uint32_t m_algo_bitmap;
        uint8_t m_prealloc_blocks;
        uint8_t m_prealloc_dir_blocks;
        std::string m_padding1;
        std::string m_journal_uuid;
        uint32_t m_journal_inum;
        uint32_t m_journal_dev;
        uint32_t m_last_orphan;
        std::unique_ptr<std::vector<uint32_t>> m_hash_seed;
        uint8_t m_def_hash_version;
        ext2_t* m__root;
        ext2_t::block_group_t* m__parent;

    public:
        uint32_t inodes_count() const { return m_inodes_count; }
        uint32_t blocks_count() const { return m_blocks_count; }
        uint32_t r_blocks_count() const { return m_r_blocks_count; }
        uint32_t free_blocks_count() const { return m_free_blocks_count; }
        uint32_t free_inodes_count() const { return m_free_inodes_count; }
        uint32_t first_data_block() const { return m_first_data_block; }
        uint32_t log_block_size() const { return m_log_block_size; }
        uint32_t log_frag_size() const { return m_log_frag_size; }
        uint32_t blocks_per_group() const { return m_blocks_per_group; }
        uint32_t frags_per_group() const { return m_frags_per_group; }
        uint32_t inodes_per_group() const { return m_inodes_per_group; }
        uint32_t mtime() const { return m_mtime; }
        uint32_t wtime() const { return m_wtime; }
        uint16_t mnt_count() const { return m_mnt_count; }
        uint16_t max_mnt_count() const { return m_max_mnt_count; }
        std::string magic() const { return m_magic; }
        state_enum_t state() const { return m_state; }
        errors_enum_t errors() const { return m_errors; }
        uint16_t minor_rev_level() const { return m_minor_rev_level; }
        uint32_t lastcheck() const { return m_lastcheck; }
        uint32_t checkinterval() const { return m_checkinterval; }
        uint32_t creator_os() const { return m_creator_os; }
        uint32_t rev_level() const { return m_rev_level; }
        uint16_t def_resuid() const { return m_def_resuid; }
        uint16_t def_resgid() const { return m_def_resgid; }
        uint32_t first_ino() const { return m_first_ino; }
        uint16_t inode_size() const { return m_inode_size; }
        uint16_t block_group_nr() const { return m_block_group_nr; }
        uint32_t feature_compat() const { return m_feature_compat; }
        uint32_t feature_incompat() const { return m_feature_incompat; }
        uint32_t feature_ro_compat() const { return m_feature_ro_compat; }
        std::string uuid() const { return m_uuid; }
        std::string volume_name() const { return m_volume_name; }
        std::string last_mounted() const { return m_last_mounted; }
        uint32_t algo_bitmap() const { return m_algo_bitmap; }
        uint8_t prealloc_blocks() const { return m_prealloc_blocks; }
        uint8_t prealloc_dir_blocks() const { return m_prealloc_dir_blocks; }
        std::string padding1() const { return m_padding1; }
        std::string journal_uuid() const { return m_journal_uuid; }
        uint32_t journal_inum() const { return m_journal_inum; }
        uint32_t journal_dev() const { return m_journal_dev; }
        uint32_t last_orphan() const { return m_last_orphan; }
        std::vector<uint32_t>* hash_seed() const { return m_hash_seed.get(); }
        uint8_t def_hash_version() const { return m_def_hash_version; }
        ext2_t* _root() const { return m__root; }
        ext2_t::block_group_t* _parent() const { return m__parent; }
    };

private:
    bool f_bg1;
    std::unique_ptr<block_group_t> m_bg1;

public:
    block_group_t* bg1();

private:
    bool f_root_dir;
    dir_t* m_root_dir;

public:
    dir_t* root_dir();

private:
    ext2_t* m__root;
    kaitai::kstruct* m__parent;

public:
    ext2_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

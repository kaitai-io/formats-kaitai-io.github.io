#ifndef CRAMFS_H_
#define CRAMFS_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class cramfs_t : public kaitai::kstruct {

public:
    class super_block_struct_t;
    class chunked_data_inode_t;
    class inode_t;
    class dir_inode_t;
    class info_t;

    cramfs_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, cramfs_t* p__root = 0);

private:
    void _read();

public:
    ~cramfs_t();

    class super_block_struct_t : public kaitai::kstruct {

    public:

        super_block_struct_t(kaitai::kstream* p__io, cramfs_t* p__parent = 0, cramfs_t* p__root = 0);

    private:
        void _read();

    public:
        ~super_block_struct_t();

    private:
        bool f_flag_fsid_v2;
        int32_t m_flag_fsid_v2;

    public:
        int32_t flag_fsid_v2();

    private:
        bool f_flag_holes;
        int32_t m_flag_holes;

    public:
        int32_t flag_holes();

    private:
        bool f_flag_wrong_signature;
        int32_t m_flag_wrong_signature;

    public:
        int32_t flag_wrong_signature();

    private:
        bool f_flag_sorted_dirs;
        int32_t m_flag_sorted_dirs;

    public:
        int32_t flag_sorted_dirs();

    private:
        bool f_flag_shifted_root_offset;
        int32_t m_flag_shifted_root_offset;

    public:
        int32_t flag_shifted_root_offset();

    private:
        std::string m_magic;
        uint32_t m_size;
        uint32_t m_flags;
        uint32_t m_future;
        std::string m_signature;
        info_t* m_fsid;
        std::string m_name;
        inode_t* m_root;
        cramfs_t* m__root;
        cramfs_t* m__parent;

    public:
        std::string magic() const { return m_magic; }
        uint32_t size() const { return m_size; }
        uint32_t flags() const { return m_flags; }
        uint32_t future() const { return m_future; }
        std::string signature() const { return m_signature; }
        info_t* fsid() const { return m_fsid; }
        std::string name() const { return m_name; }
        inode_t* root() const { return m_root; }
        cramfs_t* _root() const { return m__root; }
        cramfs_t* _parent() const { return m__parent; }
    };

    class chunked_data_inode_t : public kaitai::kstruct {

    public:

        chunked_data_inode_t(kaitai::kstream* p__io, cramfs_t::inode_t* p__parent = 0, cramfs_t* p__root = 0);

    private:
        void _read();

    public:
        ~chunked_data_inode_t();

    private:
        std::vector<uint32_t>* m_block_end_index;
        std::string m_raw_blocks;
        cramfs_t* m__root;
        cramfs_t::inode_t* m__parent;

    public:
        std::vector<uint32_t>* block_end_index() const { return m_block_end_index; }
        std::string raw_blocks() const { return m_raw_blocks; }
        cramfs_t* _root() const { return m__root; }
        cramfs_t::inode_t* _parent() const { return m__parent; }
    };

    class inode_t : public kaitai::kstruct {

    public:

        enum file_type_t {
            FILE_TYPE_FIFO = 1,
            FILE_TYPE_CHRDEV = 2,
            FILE_TYPE_DIR = 4,
            FILE_TYPE_BLKDEV = 6,
            FILE_TYPE_REG_FILE = 8,
            FILE_TYPE_SYMLINK = 10,
            FILE_TYPE_SOCKET = 12
        };

        inode_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, cramfs_t* p__root = 0);

    private:
        void _read();

    public:
        ~inode_t();

    private:
        bool f_attr;
        int32_t m_attr;

    public:
        int32_t attr();

    private:
        bool f_as_reg_file;
        chunked_data_inode_t* m_as_reg_file;

    public:
        chunked_data_inode_t* as_reg_file();

    private:
        bool f_perm_u;
        int32_t m_perm_u;

    public:
        int32_t perm_u();

    private:
        bool f_as_symlink;
        chunked_data_inode_t* m_as_symlink;

    public:
        chunked_data_inode_t* as_symlink();

    private:
        bool f_perm_o;
        int32_t m_perm_o;

    public:
        int32_t perm_o();

    private:
        bool f_size;
        int32_t m_size;

    public:
        int32_t size();

    private:
        bool f_gid;
        int32_t m_gid;

    public:
        int32_t gid();

    private:
        bool f_perm_g;
        int32_t m_perm_g;

    public:
        int32_t perm_g();

    private:
        bool f_namelen;
        int32_t m_namelen;

    public:
        int32_t namelen();

    private:
        bool f_as_dir;
        dir_inode_t* m_as_dir;

    public:
        dir_inode_t* as_dir();

    private:
        bool f_type;
        file_type_t m_type;

    public:
        file_type_t type();

    private:
        bool f_offset;
        int32_t m_offset;

    public:
        int32_t offset();

    private:
        uint16_t m_mode;
        uint16_t m_uid;
        uint32_t m_size_gid;
        uint32_t m_namelen_offset;
        std::string m_name;
        cramfs_t* m__root;
        kaitai::kstruct* m__parent;
        std::string m__raw_as_dir;
        kaitai::kstream* m__io__raw_as_dir;

    public:
        uint16_t mode() const { return m_mode; }
        uint16_t uid() const { return m_uid; }
        uint32_t size_gid() const { return m_size_gid; }
        uint32_t namelen_offset() const { return m_namelen_offset; }
        std::string name() const { return m_name; }
        cramfs_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
        std::string _raw_as_dir() const { return m__raw_as_dir; }
        kaitai::kstream* _io__raw_as_dir() const { return m__io__raw_as_dir; }
    };

    class dir_inode_t : public kaitai::kstruct {

    public:

        dir_inode_t(kaitai::kstream* p__io, cramfs_t::inode_t* p__parent = 0, cramfs_t* p__root = 0);

    private:
        void _read();

    public:
        ~dir_inode_t();

    private:
        std::vector<inode_t*>* m_children;
        bool n_children;

    public:
        bool _is_null_children() { children(); return n_children; };

    private:
        cramfs_t* m__root;
        cramfs_t::inode_t* m__parent;

    public:
        std::vector<inode_t*>* children() const { return m_children; }
        cramfs_t* _root() const { return m__root; }
        cramfs_t::inode_t* _parent() const { return m__parent; }
    };

    class info_t : public kaitai::kstruct {

    public:

        info_t(kaitai::kstream* p__io, cramfs_t::super_block_struct_t* p__parent = 0, cramfs_t* p__root = 0);

    private:
        void _read();

    public:
        ~info_t();

    private:
        uint32_t m_crc;
        uint32_t m_edition;
        uint32_t m_blocks;
        uint32_t m_files;
        cramfs_t* m__root;
        cramfs_t::super_block_struct_t* m__parent;

    public:
        uint32_t crc() const { return m_crc; }
        uint32_t edition() const { return m_edition; }
        uint32_t blocks() const { return m_blocks; }
        uint32_t files() const { return m_files; }
        cramfs_t* _root() const { return m__root; }
        cramfs_t::super_block_struct_t* _parent() const { return m__parent; }
    };

private:
    bool f_page_size;
    int32_t m_page_size;

public:
    int32_t page_size();

private:
    super_block_struct_t* m_super_block;
    cramfs_t* m__root;
    kaitai::kstruct* m__parent;

public:
    super_block_struct_t* super_block() const { return m_super_block; }
    cramfs_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // CRAMFS_H_

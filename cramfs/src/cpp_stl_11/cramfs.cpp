// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "cramfs.h"
#include "kaitai/exceptions.h"

cramfs_t::cramfs_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, cramfs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_super_block = nullptr;
    f_page_size = false;
    _read();
}

void cramfs_t::_read() {
    m_super_block = std::unique_ptr<super_block_struct_t>(new super_block_struct_t(m__io, this, m__root));
}

cramfs_t::~cramfs_t() {
    _clean_up();
}

void cramfs_t::_clean_up() {
}

cramfs_t::chunked_data_inode_t::chunked_data_inode_t(kaitai::kstream* p__io, cramfs_t::inode_t* p__parent, cramfs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_block_end_index = nullptr;
    _read();
}

void cramfs_t::chunked_data_inode_t::_read() {
    m_block_end_index = std::unique_ptr<std::vector<uint32_t>>(new std::vector<uint32_t>());
    const int l_block_end_index = ((_parent()->size() + _root()->page_size()) - 1) / _root()->page_size();
    for (int i = 0; i < l_block_end_index; i++) {
        m_block_end_index->push_back(std::move(m__io->read_u4le()));
    }
    m_raw_blocks = m__io->read_bytes_full();
}

cramfs_t::chunked_data_inode_t::~chunked_data_inode_t() {
    _clean_up();
}

void cramfs_t::chunked_data_inode_t::_clean_up() {
}

cramfs_t::dir_inode_t::dir_inode_t(kaitai::kstream* p__io, cramfs_t::inode_t* p__parent, cramfs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_children = nullptr;
    _read();
}

void cramfs_t::dir_inode_t::_read() {
    n_children = true;
    if (_io()->size() > 0) {
        n_children = false;
        m_children = std::unique_ptr<std::vector<std::unique_ptr<inode_t>>>(new std::vector<std::unique_ptr<inode_t>>());
        {
            int i = 0;
            while (!m__io->is_eof()) {
                m_children->push_back(std::move(std::unique_ptr<inode_t>(new inode_t(m__io, this, m__root))));
                i++;
            }
        }
    }
}

cramfs_t::dir_inode_t::~dir_inode_t() {
    _clean_up();
}

void cramfs_t::dir_inode_t::_clean_up() {
    if (!n_children) {
    }
}

cramfs_t::info_t::info_t(kaitai::kstream* p__io, cramfs_t::super_block_struct_t* p__parent, cramfs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void cramfs_t::info_t::_read() {
    m_crc = m__io->read_u4le();
    m_edition = m__io->read_u4le();
    m_blocks = m__io->read_u4le();
    m_files = m__io->read_u4le();
}

cramfs_t::info_t::~info_t() {
    _clean_up();
}

void cramfs_t::info_t::_clean_up() {
}
const std::set<cramfs_t::inode_t::file_type_t> cramfs_t::inode_t::_values_file_type_t{
    cramfs_t::inode_t::FILE_TYPE_FIFO,
    cramfs_t::inode_t::FILE_TYPE_CHRDEV,
    cramfs_t::inode_t::FILE_TYPE_DIR,
    cramfs_t::inode_t::FILE_TYPE_BLKDEV,
    cramfs_t::inode_t::FILE_TYPE_REG_FILE,
    cramfs_t::inode_t::FILE_TYPE_SYMLINK,
    cramfs_t::inode_t::FILE_TYPE_SOCKET,
};
bool cramfs_t::inode_t::_is_defined_file_type_t(cramfs_t::inode_t::file_type_t v) {
    return cramfs_t::inode_t::_values_file_type_t.find(v) != cramfs_t::inode_t::_values_file_type_t.end();
}

cramfs_t::inode_t::inode_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, cramfs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_as_dir = nullptr;
    m__io__raw_as_dir = nullptr;
    m_as_reg_file = nullptr;
    m_as_symlink = nullptr;
    f_as_dir = false;
    f_as_reg_file = false;
    f_as_symlink = false;
    f_attr = false;
    f_gid = false;
    f_namelen = false;
    f_offset = false;
    f_perm_g = false;
    f_perm_o = false;
    f_perm_u = false;
    f_size = false;
    f_type = false;
    _read();
}

void cramfs_t::inode_t::_read() {
    m_mode = m__io->read_u2le();
    m_uid = m__io->read_u2le();
    m_size_gid = m__io->read_u4le();
    m_namelen_offset = m__io->read_u4le();
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(namelen()), "UTF-8");
}

cramfs_t::inode_t::~inode_t() {
    _clean_up();
}

void cramfs_t::inode_t::_clean_up() {
    if (f_as_dir) {
    }
    if (f_as_reg_file) {
    }
    if (f_as_symlink) {
    }
}

cramfs_t::dir_inode_t* cramfs_t::inode_t::as_dir() {
    if (f_as_dir)
        return m_as_dir.get();
    f_as_dir = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(offset());
    m__raw_as_dir = io->read_bytes(size());
    m__io__raw_as_dir = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_as_dir));
    m_as_dir = std::unique_ptr<dir_inode_t>(new dir_inode_t(m__io__raw_as_dir.get(), this, m__root));
    io->seek(_pos);
    return m_as_dir.get();
}

cramfs_t::chunked_data_inode_t* cramfs_t::inode_t::as_reg_file() {
    if (f_as_reg_file)
        return m_as_reg_file.get();
    f_as_reg_file = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(offset());
    m_as_reg_file = std::unique_ptr<chunked_data_inode_t>(new chunked_data_inode_t(io, this, m__root));
    io->seek(_pos);
    return m_as_reg_file.get();
}

cramfs_t::chunked_data_inode_t* cramfs_t::inode_t::as_symlink() {
    if (f_as_symlink)
        return m_as_symlink.get();
    f_as_symlink = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(offset());
    m_as_symlink = std::unique_ptr<chunked_data_inode_t>(new chunked_data_inode_t(io, this, m__root));
    io->seek(_pos);
    return m_as_symlink.get();
}

int32_t cramfs_t::inode_t::attr() {
    if (f_attr)
        return m_attr;
    f_attr = true;
    m_attr = mode() >> 9 & 7;
    return m_attr;
}

int32_t cramfs_t::inode_t::gid() {
    if (f_gid)
        return m_gid;
    f_gid = true;
    m_gid = size_gid() >> 24;
    return m_gid;
}

int32_t cramfs_t::inode_t::namelen() {
    if (f_namelen)
        return m_namelen;
    f_namelen = true;
    m_namelen = (namelen_offset() & 63) << 2;
    return m_namelen;
}

int32_t cramfs_t::inode_t::offset() {
    if (f_offset)
        return m_offset;
    f_offset = true;
    m_offset = (namelen_offset() >> 6 & 67108863) << 2;
    return m_offset;
}

int32_t cramfs_t::inode_t::perm_g() {
    if (f_perm_g)
        return m_perm_g;
    f_perm_g = true;
    m_perm_g = mode() >> 3 & 7;
    return m_perm_g;
}

int32_t cramfs_t::inode_t::perm_o() {
    if (f_perm_o)
        return m_perm_o;
    f_perm_o = true;
    m_perm_o = mode() & 7;
    return m_perm_o;
}

int32_t cramfs_t::inode_t::perm_u() {
    if (f_perm_u)
        return m_perm_u;
    f_perm_u = true;
    m_perm_u = mode() >> 6 & 7;
    return m_perm_u;
}

int32_t cramfs_t::inode_t::size() {
    if (f_size)
        return m_size;
    f_size = true;
    m_size = size_gid() & 16777215;
    return m_size;
}

cramfs_t::inode_t::file_type_t cramfs_t::inode_t::type() {
    if (f_type)
        return m_type;
    f_type = true;
    m_type = static_cast<cramfs_t::inode_t::file_type_t>(mode() >> 12 & 15);
    return m_type;
}

cramfs_t::super_block_struct_t::super_block_struct_t(kaitai::kstream* p__io, cramfs_t* p__parent, cramfs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_fsid = nullptr;
    m_root = nullptr;
    f_flag_fsid_v2 = false;
    f_flag_holes = false;
    f_flag_shifted_root_offset = false;
    f_flag_sorted_dirs = false;
    f_flag_wrong_signature = false;
    _read();
}

void cramfs_t::super_block_struct_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x45\x3D\xCD\x28", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x45\x3D\xCD\x28", 4), m_magic, m__io, std::string("/types/super_block_struct/seq/0"));
    }
    m_size = m__io->read_u4le();
    m_flags = m__io->read_u4le();
    m_future = m__io->read_u4le();
    m_signature = m__io->read_bytes(16);
    if (!(m_signature == std::string("\x43\x6F\x6D\x70\x72\x65\x73\x73\x65\x64\x20\x52\x4F\x4D\x46\x53", 16))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x43\x6F\x6D\x70\x72\x65\x73\x73\x65\x64\x20\x52\x4F\x4D\x46\x53", 16), m_signature, m__io, std::string("/types/super_block_struct/seq/4"));
    }
    m_fsid = std::unique_ptr<info_t>(new info_t(m__io, this, m__root));
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(16), "ASCII");
    m_root = std::unique_ptr<inode_t>(new inode_t(m__io, this, m__root));
}

cramfs_t::super_block_struct_t::~super_block_struct_t() {
    _clean_up();
}

void cramfs_t::super_block_struct_t::_clean_up() {
}

int32_t cramfs_t::super_block_struct_t::flag_fsid_v2() {
    if (f_flag_fsid_v2)
        return m_flag_fsid_v2;
    f_flag_fsid_v2 = true;
    m_flag_fsid_v2 = flags() >> 0 & 1;
    return m_flag_fsid_v2;
}

int32_t cramfs_t::super_block_struct_t::flag_holes() {
    if (f_flag_holes)
        return m_flag_holes;
    f_flag_holes = true;
    m_flag_holes = flags() >> 8 & 1;
    return m_flag_holes;
}

int32_t cramfs_t::super_block_struct_t::flag_shifted_root_offset() {
    if (f_flag_shifted_root_offset)
        return m_flag_shifted_root_offset;
    f_flag_shifted_root_offset = true;
    m_flag_shifted_root_offset = flags() >> 10 & 1;
    return m_flag_shifted_root_offset;
}

int32_t cramfs_t::super_block_struct_t::flag_sorted_dirs() {
    if (f_flag_sorted_dirs)
        return m_flag_sorted_dirs;
    f_flag_sorted_dirs = true;
    m_flag_sorted_dirs = flags() >> 1 & 1;
    return m_flag_sorted_dirs;
}

int32_t cramfs_t::super_block_struct_t::flag_wrong_signature() {
    if (f_flag_wrong_signature)
        return m_flag_wrong_signature;
    f_flag_wrong_signature = true;
    m_flag_wrong_signature = flags() >> 9 & 1;
    return m_flag_wrong_signature;
}

int32_t cramfs_t::page_size() {
    if (f_page_size)
        return m_page_size;
    f_page_size = true;
    m_page_size = 4096;
    return m_page_size;
}

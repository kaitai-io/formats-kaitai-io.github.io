// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "cramfs.h"



cramfs_t::cramfs_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, cramfs_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    f_page_size = false;
    _read();
}

void cramfs_t::_read() {
    m_super_block = new super_block_struct_t(m__io, this, m__root);
}

cramfs_t::~cramfs_t() {
    delete m_super_block;
}

cramfs_t::super_block_struct_t::super_block_struct_t(kaitai::kstream *p_io, cramfs_t* p_parent, cramfs_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_flag_fsid_v2 = false;
    f_flag_holes = false;
    f_flag_wrong_signature = false;
    f_flag_sorted_dirs = false;
    f_flag_shifted_root_offset = false;
    _read();
}

void cramfs_t::super_block_struct_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\x45\x3D\xCD\x28", 4));
    m_size = m__io->read_u4le();
    m_flags = m__io->read_u4le();
    m_future = m__io->read_u4le();
    m_signature = m__io->ensure_fixed_contents(std::string("\x43\x6F\x6D\x70\x72\x65\x73\x73\x65\x64\x20\x52\x4F\x4D\x46\x53", 16));
    m_fsid = new info_t(m__io, this, m__root);
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(16), std::string("ASCII"));
    m_root = new inode_t(m__io, this, m__root);
}

cramfs_t::super_block_struct_t::~super_block_struct_t() {
    delete m_fsid;
    delete m_root;
}

int32_t cramfs_t::super_block_struct_t::flag_fsid_v2() {
    if (f_flag_fsid_v2)
        return m_flag_fsid_v2;
    m_flag_fsid_v2 = ((flags() >> 0) & 1);
    f_flag_fsid_v2 = true;
    return m_flag_fsid_v2;
}

int32_t cramfs_t::super_block_struct_t::flag_holes() {
    if (f_flag_holes)
        return m_flag_holes;
    m_flag_holes = ((flags() >> 8) & 1);
    f_flag_holes = true;
    return m_flag_holes;
}

int32_t cramfs_t::super_block_struct_t::flag_wrong_signature() {
    if (f_flag_wrong_signature)
        return m_flag_wrong_signature;
    m_flag_wrong_signature = ((flags() >> 9) & 1);
    f_flag_wrong_signature = true;
    return m_flag_wrong_signature;
}

int32_t cramfs_t::super_block_struct_t::flag_sorted_dirs() {
    if (f_flag_sorted_dirs)
        return m_flag_sorted_dirs;
    m_flag_sorted_dirs = ((flags() >> 1) & 1);
    f_flag_sorted_dirs = true;
    return m_flag_sorted_dirs;
}

int32_t cramfs_t::super_block_struct_t::flag_shifted_root_offset() {
    if (f_flag_shifted_root_offset)
        return m_flag_shifted_root_offset;
    m_flag_shifted_root_offset = ((flags() >> 10) & 1);
    f_flag_shifted_root_offset = true;
    return m_flag_shifted_root_offset;
}

cramfs_t::chunked_data_inode_t::chunked_data_inode_t(kaitai::kstream *p_io, cramfs_t::inode_t* p_parent, cramfs_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void cramfs_t::chunked_data_inode_t::_read() {
    int l_block_end_index = (((_parent()->size() + _root()->page_size()) - 1) / _root()->page_size());
    m_block_end_index = new std::vector<uint32_t>();
    m_block_end_index->reserve(l_block_end_index);
    for (int i = 0; i < l_block_end_index; i++) {
        m_block_end_index->push_back(m__io->read_u4le());
    }
    m_raw_blocks = m__io->read_bytes_full();
}

cramfs_t::chunked_data_inode_t::~chunked_data_inode_t() {
    delete m_block_end_index;
}

cramfs_t::inode_t::inode_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, cramfs_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_attr = false;
    f_as_reg_file = false;
    f_perm_u = false;
    f_as_symlink = false;
    f_perm_o = false;
    f_size = false;
    f_gid = false;
    f_perm_g = false;
    f_namelen = false;
    f_as_dir = false;
    f_type = false;
    f_offset = false;
    _read();
}

void cramfs_t::inode_t::_read() {
    m_mode = m__io->read_u2le();
    m_uid = m__io->read_u2le();
    m_size_gid = m__io->read_u4le();
    m_namelen_offset = m__io->read_u4le();
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(namelen()), std::string("utf-8"));
}

cramfs_t::inode_t::~inode_t() {
    if (f_as_reg_file) {
        delete m_as_reg_file;
    }
    if (f_as_symlink) {
        delete m_as_symlink;
    }
    if (f_as_dir) {
        delete m__io__raw_as_dir;
        delete m_as_dir;
    }
}

int32_t cramfs_t::inode_t::attr() {
    if (f_attr)
        return m_attr;
    m_attr = ((mode() >> 9) & 7);
    f_attr = true;
    return m_attr;
}

cramfs_t::chunked_data_inode_t* cramfs_t::inode_t::as_reg_file() {
    if (f_as_reg_file)
        return m_as_reg_file;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(offset());
    m_as_reg_file = new chunked_data_inode_t(io, this, m__root);
    io->seek(_pos);
    f_as_reg_file = true;
    return m_as_reg_file;
}

int32_t cramfs_t::inode_t::perm_u() {
    if (f_perm_u)
        return m_perm_u;
    m_perm_u = ((mode() >> 6) & 7);
    f_perm_u = true;
    return m_perm_u;
}

cramfs_t::chunked_data_inode_t* cramfs_t::inode_t::as_symlink() {
    if (f_as_symlink)
        return m_as_symlink;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(offset());
    m_as_symlink = new chunked_data_inode_t(io, this, m__root);
    io->seek(_pos);
    f_as_symlink = true;
    return m_as_symlink;
}

int32_t cramfs_t::inode_t::perm_o() {
    if (f_perm_o)
        return m_perm_o;
    m_perm_o = (mode() & 7);
    f_perm_o = true;
    return m_perm_o;
}

int32_t cramfs_t::inode_t::size() {
    if (f_size)
        return m_size;
    m_size = (size_gid() & 16777215);
    f_size = true;
    return m_size;
}

int32_t cramfs_t::inode_t::gid() {
    if (f_gid)
        return m_gid;
    m_gid = (size_gid() >> 24);
    f_gid = true;
    return m_gid;
}

int32_t cramfs_t::inode_t::perm_g() {
    if (f_perm_g)
        return m_perm_g;
    m_perm_g = ((mode() >> 3) & 7);
    f_perm_g = true;
    return m_perm_g;
}

int32_t cramfs_t::inode_t::namelen() {
    if (f_namelen)
        return m_namelen;
    m_namelen = ((namelen_offset() & 63) << 2);
    f_namelen = true;
    return m_namelen;
}

cramfs_t::dir_inode_t* cramfs_t::inode_t::as_dir() {
    if (f_as_dir)
        return m_as_dir;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(offset());
    m__raw_as_dir = io->read_bytes(size());
    m__io__raw_as_dir = new kaitai::kstream(m__raw_as_dir);
    m_as_dir = new dir_inode_t(m__io__raw_as_dir, this, m__root);
    io->seek(_pos);
    f_as_dir = true;
    return m_as_dir;
}

cramfs_t::inode_t::file_type_t cramfs_t::inode_t::type() {
    if (f_type)
        return m_type;
    m_type = static_cast<cramfs_t::inode_t::file_type_t>(((mode() >> 12) & 15));
    f_type = true;
    return m_type;
}

int32_t cramfs_t::inode_t::offset() {
    if (f_offset)
        return m_offset;
    m_offset = (((namelen_offset() >> 6) & 67108863) << 2);
    f_offset = true;
    return m_offset;
}

cramfs_t::dir_inode_t::dir_inode_t(kaitai::kstream *p_io, cramfs_t::inode_t* p_parent, cramfs_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void cramfs_t::dir_inode_t::_read() {
    n_children = true;
    if (_io()->size() > 0) {
        n_children = false;
        m_children = new std::vector<inode_t*>();
        while (!m__io->is_eof()) {
            m_children->push_back(new inode_t(m__io, this, m__root));
        }
    }
}

cramfs_t::dir_inode_t::~dir_inode_t() {
    if (!n_children) {
        for (std::vector<inode_t*>::iterator it = m_children->begin(); it != m_children->end(); ++it) {
            delete *it;
        }
        delete m_children;
    }
}

cramfs_t::info_t::info_t(kaitai::kstream *p_io, cramfs_t::super_block_struct_t* p_parent, cramfs_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void cramfs_t::info_t::_read() {
    m_crc = m__io->read_u4le();
    m_edition = m__io->read_u4le();
    m_blocks = m__io->read_u4le();
    m_files = m__io->read_u4le();
}

cramfs_t::info_t::~info_t() {
}

int32_t cramfs_t::page_size() {
    if (f_page_size)
        return m_page_size;
    m_page_size = 4096;
    f_page_size = true;
    return m_page_size;
}

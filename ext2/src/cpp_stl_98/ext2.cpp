// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "ext2.h"
#include "kaitai/exceptions.h"

ext2_t::ext2_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ext2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_bg1 = 0;
    f_bg1 = false;
    f_root_dir = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ext2_t::_read() {
}

ext2_t::~ext2_t() {
    _clean_up();
}

void ext2_t::_clean_up() {
    if (f_bg1) {
        if (m_bg1) {
            delete m_bg1; m_bg1 = 0;
        }
    }
}

ext2_t::super_block_struct_t::super_block_struct_t(kaitai::kstream* p__io, ext2_t::block_group_t* p__parent, ext2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_hash_seed = 0;
    f_block_size = false;
    f_block_group_count = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ext2_t::super_block_struct_t::_read() {
    m_inodes_count = m__io->read_u4le();
    m_blocks_count = m__io->read_u4le();
    m_r_blocks_count = m__io->read_u4le();
    m_free_blocks_count = m__io->read_u4le();
    m_free_inodes_count = m__io->read_u4le();
    m_first_data_block = m__io->read_u4le();
    m_log_block_size = m__io->read_u4le();
    m_log_frag_size = m__io->read_u4le();
    m_blocks_per_group = m__io->read_u4le();
    m_frags_per_group = m__io->read_u4le();
    m_inodes_per_group = m__io->read_u4le();
    m_mtime = m__io->read_u4le();
    m_wtime = m__io->read_u4le();
    m_mnt_count = m__io->read_u2le();
    m_max_mnt_count = m__io->read_u2le();
    m_magic = m__io->read_bytes(2);
    if (!(magic() == std::string("\x53\xEF", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x53\xEF", 2), magic(), _io(), std::string("/types/super_block_struct/seq/15"));
    }
    m_state = static_cast<ext2_t::super_block_struct_t::state_enum_t>(m__io->read_u2le());
    m_errors = static_cast<ext2_t::super_block_struct_t::errors_enum_t>(m__io->read_u2le());
    m_minor_rev_level = m__io->read_u2le();
    m_lastcheck = m__io->read_u4le();
    m_checkinterval = m__io->read_u4le();
    m_creator_os = m__io->read_u4le();
    m_rev_level = m__io->read_u4le();
    m_def_resuid = m__io->read_u2le();
    m_def_resgid = m__io->read_u2le();
    m_first_ino = m__io->read_u4le();
    m_inode_size = m__io->read_u2le();
    m_block_group_nr = m__io->read_u2le();
    m_feature_compat = m__io->read_u4le();
    m_feature_incompat = m__io->read_u4le();
    m_feature_ro_compat = m__io->read_u4le();
    m_uuid = m__io->read_bytes(16);
    m_volume_name = m__io->read_bytes(16);
    m_last_mounted = m__io->read_bytes(64);
    m_algo_bitmap = m__io->read_u4le();
    m_prealloc_blocks = m__io->read_u1();
    m_prealloc_dir_blocks = m__io->read_u1();
    m_padding1 = m__io->read_bytes(2);
    m_journal_uuid = m__io->read_bytes(16);
    m_journal_inum = m__io->read_u4le();
    m_journal_dev = m__io->read_u4le();
    m_last_orphan = m__io->read_u4le();
    int l_hash_seed = 4;
    m_hash_seed = new std::vector<uint32_t>();
    m_hash_seed->reserve(l_hash_seed);
    for (int i = 0; i < l_hash_seed; i++) {
        m_hash_seed->push_back(m__io->read_u4le());
    }
    m_def_hash_version = m__io->read_u1();
}

ext2_t::super_block_struct_t::~super_block_struct_t() {
    _clean_up();
}

void ext2_t::super_block_struct_t::_clean_up() {
    if (m_hash_seed) {
        delete m_hash_seed; m_hash_seed = 0;
    }
}

int32_t ext2_t::super_block_struct_t::block_size() {
    if (f_block_size)
        return m_block_size;
    m_block_size = (1024 << log_block_size());
    f_block_size = true;
    return m_block_size;
}

int32_t ext2_t::super_block_struct_t::block_group_count() {
    if (f_block_group_count)
        return m_block_group_count;
    m_block_group_count = (blocks_count() / blocks_per_group());
    f_block_group_count = true;
    return m_block_group_count;
}

ext2_t::dir_entry_t::dir_entry_t(kaitai::kstream* p__io, ext2_t::dir_t* p__parent, ext2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_inode = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ext2_t::dir_entry_t::_read() {
    m_inode_ptr = m__io->read_u4le();
    m_rec_len = m__io->read_u2le();
    m_name_len = m__io->read_u1();
    m_file_type = static_cast<ext2_t::dir_entry_t::file_type_enum_t>(m__io->read_u1());
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(name_len()), std::string("UTF-8"));
    m_padding = m__io->read_bytes(((rec_len() - name_len()) - 8));
}

ext2_t::dir_entry_t::~dir_entry_t() {
    _clean_up();
}

void ext2_t::dir_entry_t::_clean_up() {
}

ext2_t::inode_t* ext2_t::dir_entry_t::inode() {
    if (f_inode)
        return m_inode;
    m_inode = _root()->bg1()->block_groups()->at(((inode_ptr() - 1) / _root()->bg1()->super_block()->inodes_per_group()))->inodes()->at(kaitai::kstream::mod((inode_ptr() - 1), _root()->bg1()->super_block()->inodes_per_group()));
    f_inode = true;
    return m_inode;
}

ext2_t::inode_t::inode_t(kaitai::kstream* p__io, ext2_t::bgd_t* p__parent, ext2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_block = 0;
    m_as_dir = 0;
    f_as_dir = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ext2_t::inode_t::_read() {
    m_mode = m__io->read_u2le();
    m_uid = m__io->read_u2le();
    m_size = m__io->read_u4le();
    m_atime = m__io->read_u4le();
    m_ctime = m__io->read_u4le();
    m_mtime = m__io->read_u4le();
    m_dtime = m__io->read_u4le();
    m_gid = m__io->read_u2le();
    m_links_count = m__io->read_u2le();
    m_blocks = m__io->read_u4le();
    m_flags = m__io->read_u4le();
    m_osd1 = m__io->read_u4le();
    int l_block = 15;
    m_block = new std::vector<block_ptr_t*>();
    m_block->reserve(l_block);
    for (int i = 0; i < l_block; i++) {
        m_block->push_back(new block_ptr_t(m__io, this, m__root));
    }
    m_generation = m__io->read_u4le();
    m_file_acl = m__io->read_u4le();
    m_dir_acl = m__io->read_u4le();
    m_faddr = m__io->read_u4le();
    m_osd2 = m__io->read_bytes(12);
}

ext2_t::inode_t::~inode_t() {
    _clean_up();
}

void ext2_t::inode_t::_clean_up() {
    if (m_block) {
        for (std::vector<block_ptr_t*>::iterator it = m_block->begin(); it != m_block->end(); ++it) {
            delete *it;
        }
        delete m_block; m_block = 0;
    }
    if (f_as_dir) {
        if (m_as_dir) {
            delete m_as_dir; m_as_dir = 0;
        }
    }
}

ext2_t::dir_t* ext2_t::inode_t::as_dir() {
    if (f_as_dir)
        return m_as_dir;
    kaitai::kstream *io = block()->at(0)->body()->_io();
    std::streampos _pos = io->pos();
    io->seek(0);
    m_as_dir = new dir_t(io, this, m__root);
    io->seek(_pos);
    f_as_dir = true;
    return m_as_dir;
}

ext2_t::block_ptr_t::block_ptr_t(kaitai::kstream* p__io, ext2_t::inode_t* p__parent, ext2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_body = 0;
    m__io__raw_body = 0;
    f_body = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ext2_t::block_ptr_t::_read() {
    m_ptr = m__io->read_u4le();
}

ext2_t::block_ptr_t::~block_ptr_t() {
    _clean_up();
}

void ext2_t::block_ptr_t::_clean_up() {
    if (f_body) {
        if (m__io__raw_body) {
            delete m__io__raw_body; m__io__raw_body = 0;
        }
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

ext2_t::raw_block_t* ext2_t::block_ptr_t::body() {
    if (f_body)
        return m_body;
    std::streampos _pos = m__io->pos();
    m__io->seek((ptr() * _root()->bg1()->super_block()->block_size()));
    m__raw_body = m__io->read_bytes(_root()->bg1()->super_block()->block_size());
    m__io__raw_body = new kaitai::kstream(m__raw_body);
    m_body = new raw_block_t(m__io__raw_body, this, m__root);
    m__io->seek(_pos);
    f_body = true;
    return m_body;
}

ext2_t::dir_t::dir_t(kaitai::kstream* p__io, ext2_t::inode_t* p__parent, ext2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ext2_t::dir_t::_read() {
    m_entries = new std::vector<dir_entry_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new dir_entry_t(m__io, this, m__root));
            i++;
        }
    }
}

ext2_t::dir_t::~dir_t() {
    _clean_up();
}

void ext2_t::dir_t::_clean_up() {
    if (m_entries) {
        for (std::vector<dir_entry_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

ext2_t::block_group_t::block_group_t(kaitai::kstream* p__io, ext2_t* p__parent, ext2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_super_block = 0;
    m__io__raw_super_block = 0;
    m_block_groups = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ext2_t::block_group_t::_read() {
    m__raw_super_block = m__io->read_bytes(1024);
    m__io__raw_super_block = new kaitai::kstream(m__raw_super_block);
    m_super_block = new super_block_struct_t(m__io__raw_super_block, this, m__root);
    int l_block_groups = super_block()->block_group_count();
    m_block_groups = new std::vector<bgd_t*>();
    m_block_groups->reserve(l_block_groups);
    for (int i = 0; i < l_block_groups; i++) {
        m_block_groups->push_back(new bgd_t(m__io, this, m__root));
    }
}

ext2_t::block_group_t::~block_group_t() {
    _clean_up();
}

void ext2_t::block_group_t::_clean_up() {
    if (m__io__raw_super_block) {
        delete m__io__raw_super_block; m__io__raw_super_block = 0;
    }
    if (m_super_block) {
        delete m_super_block; m_super_block = 0;
    }
    if (m_block_groups) {
        for (std::vector<bgd_t*>::iterator it = m_block_groups->begin(); it != m_block_groups->end(); ++it) {
            delete *it;
        }
        delete m_block_groups; m_block_groups = 0;
    }
}

ext2_t::bgd_t::bgd_t(kaitai::kstream* p__io, ext2_t::block_group_t* p__parent, ext2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_inodes = 0;
    f_block_bitmap = false;
    f_inode_bitmap = false;
    f_inodes = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ext2_t::bgd_t::_read() {
    m_block_bitmap_block = m__io->read_u4le();
    m_inode_bitmap_block = m__io->read_u4le();
    m_inode_table_block = m__io->read_u4le();
    m_free_blocks_count = m__io->read_u2le();
    m_free_inodes_count = m__io->read_u2le();
    m_used_dirs_count = m__io->read_u2le();
    m_pad_reserved = m__io->read_bytes((2 + 12));
}

ext2_t::bgd_t::~bgd_t() {
    _clean_up();
}

void ext2_t::bgd_t::_clean_up() {
    if (f_block_bitmap) {
    }
    if (f_inode_bitmap) {
    }
    if (f_inodes) {
        if (m_inodes) {
            for (std::vector<inode_t*>::iterator it = m_inodes->begin(); it != m_inodes->end(); ++it) {
                delete *it;
            }
            delete m_inodes; m_inodes = 0;
        }
    }
}

std::string ext2_t::bgd_t::block_bitmap() {
    if (f_block_bitmap)
        return m_block_bitmap;
    std::streampos _pos = m__io->pos();
    m__io->seek((block_bitmap_block() * _root()->bg1()->super_block()->block_size()));
    m_block_bitmap = m__io->read_bytes(1024);
    m__io->seek(_pos);
    f_block_bitmap = true;
    return m_block_bitmap;
}

std::string ext2_t::bgd_t::inode_bitmap() {
    if (f_inode_bitmap)
        return m_inode_bitmap;
    std::streampos _pos = m__io->pos();
    m__io->seek((inode_bitmap_block() * _root()->bg1()->super_block()->block_size()));
    m_inode_bitmap = m__io->read_bytes(1024);
    m__io->seek(_pos);
    f_inode_bitmap = true;
    return m_inode_bitmap;
}

std::vector<ext2_t::inode_t*>* ext2_t::bgd_t::inodes() {
    if (f_inodes)
        return m_inodes;
    std::streampos _pos = m__io->pos();
    m__io->seek((inode_table_block() * _root()->bg1()->super_block()->block_size()));
    int l_inodes = _root()->bg1()->super_block()->inodes_per_group();
    m_inodes = new std::vector<inode_t*>();
    m_inodes->reserve(l_inodes);
    for (int i = 0; i < l_inodes; i++) {
        m_inodes->push_back(new inode_t(m__io, this, m__root));
    }
    m__io->seek(_pos);
    f_inodes = true;
    return m_inodes;
}

ext2_t::raw_block_t::raw_block_t(kaitai::kstream* p__io, ext2_t::block_ptr_t* p__parent, ext2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ext2_t::raw_block_t::_read() {
    m_body = m__io->read_bytes(_root()->bg1()->super_block()->block_size());
}

ext2_t::raw_block_t::~raw_block_t() {
    _clean_up();
}

void ext2_t::raw_block_t::_clean_up() {
}

ext2_t::block_group_t* ext2_t::bg1() {
    if (f_bg1)
        return m_bg1;
    std::streampos _pos = m__io->pos();
    m__io->seek(1024);
    m_bg1 = new block_group_t(m__io, this, m__root);
    m__io->seek(_pos);
    f_bg1 = true;
    return m_bg1;
}

ext2_t::dir_t* ext2_t::root_dir() {
    if (f_root_dir)
        return m_root_dir;
    m_root_dir = bg1()->block_groups()->at(0)->inodes()->at(1)->as_dir();
    f_root_dir = true;
    return m_root_dir;
}

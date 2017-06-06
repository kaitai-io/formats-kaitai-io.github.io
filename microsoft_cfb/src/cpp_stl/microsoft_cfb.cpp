// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "microsoft_cfb.h"



microsoft_cfb_t::microsoft_cfb_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, microsoft_cfb_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    f_sector_size = false;
    f_fat = false;
    f_dir = false;
    _read();
}

void microsoft_cfb_t::_read() {
    m_header = new cfb_header_t(m__io, this, m__root);
}

microsoft_cfb_t::~microsoft_cfb_t() {
    delete m_header;
    if (f_fat) {
        delete m__io__raw_fat;
        delete m_fat;
    }
    if (f_dir) {
        delete m__io__raw_dir;
        delete m_dir;
    }
}

microsoft_cfb_t::cfb_header_t::cfb_header_t(kaitai::kstream *p_io, microsoft_cfb_t* p_parent, microsoft_cfb_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void microsoft_cfb_t::cfb_header_t::_read() {
    m_signature = m__io->ensure_fixed_contents(std::string("\xD0\xCF\x11\xE0\xA1\xB1\x1A\xE1", 8));
    m_clsid = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", 16));
    m_version_minor = m__io->read_u2le();
    m_version_major = m__io->read_u2le();
    m_byte_order = m__io->ensure_fixed_contents(std::string("\xFE\xFF", 2));
    m_sector_shift = m__io->read_u2le();
    m_mini_sector_shift = m__io->read_u2le();
    m_reserved1 = m__io->read_bytes(6);
    m_size_dir = m__io->read_s4le();
    m_size_fat = m__io->read_s4le();
    m_ofs_dir = m__io->read_s4le();
    m_transaction_seq = m__io->read_s4le();
    m_mini_stream_cutoff_size = m__io->read_s4le();
    m_ofs_mini_fat = m__io->read_s4le();
    m_size_mini_fat = m__io->read_s4le();
    m_ofs_difat = m__io->read_s4le();
    m_size_difat = m__io->read_s4le();
    int l_difat = 109;
    m_difat = new std::vector<int32_t>();
    m_difat->reserve(l_difat);
    for (int i = 0; i < l_difat; i++) {
        m_difat->push_back(m__io->read_s4le());
    }
}

microsoft_cfb_t::cfb_header_t::~cfb_header_t() {
    delete m_difat;
}

microsoft_cfb_t::fat_entries_t::fat_entries_t(kaitai::kstream *p_io, microsoft_cfb_t* p_parent, microsoft_cfb_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void microsoft_cfb_t::fat_entries_t::_read() {
    m_entries = new std::vector<int32_t>();
    while (!m__io->is_eof()) {
        m_entries->push_back(m__io->read_s4le());
    }
}

microsoft_cfb_t::fat_entries_t::~fat_entries_t() {
    delete m_entries;
}

microsoft_cfb_t::dir_entry_t::dir_entry_t(kaitai::kstream *p_io, microsoft_cfb_t* p_parent, microsoft_cfb_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_mini_stream = false;
    _read();
}

void microsoft_cfb_t::dir_entry_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(64), std::string("UTF-16LE"));
    m_name_len = m__io->read_u2le();
    m_object_type = static_cast<microsoft_cfb_t::dir_entry_t::obj_type_t>(m__io->read_u1());
    m_color_flag = static_cast<microsoft_cfb_t::dir_entry_t::rb_color_t>(m__io->read_u1());
    m_left_sibling_id = m__io->read_s4le();
    m_right_sibling_id = m__io->read_s4le();
    m_child_id = m__io->read_s4le();
    m_clsid = m__io->read_bytes(16);
    m_state = m__io->read_u4le();
    m_time_create = m__io->read_u8le();
    m_time_mod = m__io->read_u8le();
    m_ofs = m__io->read_s4le();
    m_size = m__io->read_u8le();
}

microsoft_cfb_t::dir_entry_t::~dir_entry_t() {
}

std::string microsoft_cfb_t::dir_entry_t::mini_stream() {
    if (f_mini_stream)
        return m_mini_stream;
    n_mini_stream = true;
    if (object_type() == OBJ_TYPE_ROOT_STORAGE) {
        n_mini_stream = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(((ofs() + 1) * _root()->sector_size()));
        m_mini_stream = io->read_bytes(size());
        io->seek(_pos);
    }
    f_mini_stream = true;
    return m_mini_stream;
}

int32_t microsoft_cfb_t::sector_size() {
    if (f_sector_size)
        return m_sector_size;
    m_sector_size = (1 << header()->sector_shift());
    f_sector_size = true;
    return m_sector_size;
}

microsoft_cfb_t::fat_entries_t* microsoft_cfb_t::fat() {
    if (f_fat)
        return m_fat;
    std::streampos _pos = m__io->pos();
    m__io->seek(sector_size());
    m__raw_fat = m__io->read_bytes((header()->size_fat() * sector_size()));
    m__io__raw_fat = new kaitai::kstream(m__raw_fat);
    m_fat = new fat_entries_t(m__io__raw_fat, this, m__root);
    m__io->seek(_pos);
    f_fat = true;
    return m_fat;
}

microsoft_cfb_t::dir_entry_t* microsoft_cfb_t::dir() {
    if (f_dir)
        return m_dir;
    std::streampos _pos = m__io->pos();
    m__io->seek(((header()->ofs_dir() + 1) * sector_size()));
    m__raw_dir = m__io->read_bytes(128);
    m__io__raw_dir = new kaitai::kstream(m__raw_dir);
    m_dir = new dir_entry_t(m__io__raw_dir, this, m__root);
    m__io->seek(_pos);
    f_dir = true;
    return m_dir;
}

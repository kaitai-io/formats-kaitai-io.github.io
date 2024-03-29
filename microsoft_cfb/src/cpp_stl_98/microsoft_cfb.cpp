// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "microsoft_cfb.h"
#include "kaitai/exceptions.h"

microsoft_cfb_t::microsoft_cfb_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, microsoft_cfb_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = 0;
    m_fat = 0;
    m__io__raw_fat = 0;
    m_dir = 0;
    f_sector_size = false;
    f_fat = false;
    f_dir = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void microsoft_cfb_t::_read() {
    m_header = new cfb_header_t(m__io, this, m__root);
}

microsoft_cfb_t::~microsoft_cfb_t() {
    _clean_up();
}

void microsoft_cfb_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (f_fat) {
        if (m__io__raw_fat) {
            delete m__io__raw_fat; m__io__raw_fat = 0;
        }
        if (m_fat) {
            delete m_fat; m_fat = 0;
        }
    }
    if (f_dir) {
        if (m_dir) {
            delete m_dir; m_dir = 0;
        }
    }
}

microsoft_cfb_t::cfb_header_t::cfb_header_t(kaitai::kstream* p__io, microsoft_cfb_t* p__parent, microsoft_cfb_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_difat = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void microsoft_cfb_t::cfb_header_t::_read() {
    m_signature = m__io->read_bytes(8);
    if (!(signature() == std::string("\xD0\xCF\x11\xE0\xA1\xB1\x1A\xE1", 8))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xD0\xCF\x11\xE0\xA1\xB1\x1A\xE1", 8), signature(), _io(), std::string("/types/cfb_header/seq/0"));
    }
    m_clsid = m__io->read_bytes(16);
    if (!(clsid() == std::string("\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", 16))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", 16), clsid(), _io(), std::string("/types/cfb_header/seq/1"));
    }
    m_version_minor = m__io->read_u2le();
    m_version_major = m__io->read_u2le();
    m_byte_order = m__io->read_bytes(2);
    if (!(byte_order() == std::string("\xFE\xFF", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xFE\xFF", 2), byte_order(), _io(), std::string("/types/cfb_header/seq/4"));
    }
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
    m_difat = new std::vector<int32_t>();
    const int l_difat = 109;
    for (int i = 0; i < l_difat; i++) {
        m_difat->push_back(m__io->read_s4le());
    }
}

microsoft_cfb_t::cfb_header_t::~cfb_header_t() {
    _clean_up();
}

void microsoft_cfb_t::cfb_header_t::_clean_up() {
    if (m_difat) {
        delete m_difat; m_difat = 0;
    }
}

microsoft_cfb_t::fat_entries_t::fat_entries_t(kaitai::kstream* p__io, microsoft_cfb_t* p__parent, microsoft_cfb_t* p__root) : kaitai::kstruct(p__io) {
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

void microsoft_cfb_t::fat_entries_t::_read() {
    m_entries = new std::vector<int32_t>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(m__io->read_s4le());
            i++;
        }
    }
}

microsoft_cfb_t::fat_entries_t::~fat_entries_t() {
    _clean_up();
}

void microsoft_cfb_t::fat_entries_t::_clean_up() {
    if (m_entries) {
        delete m_entries; m_entries = 0;
    }
}

microsoft_cfb_t::dir_entry_t::dir_entry_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, microsoft_cfb_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_child = 0;
    m_left_sibling = 0;
    m_right_sibling = 0;
    f_mini_stream = false;
    f_child = false;
    f_left_sibling = false;
    f_right_sibling = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    _clean_up();
}

void microsoft_cfb_t::dir_entry_t::_clean_up() {
    if (f_mini_stream && !n_mini_stream) {
    }
    if (f_child && !n_child) {
        if (m_child) {
            delete m_child; m_child = 0;
        }
    }
    if (f_left_sibling && !n_left_sibling) {
        if (m_left_sibling) {
            delete m_left_sibling; m_left_sibling = 0;
        }
    }
    if (f_right_sibling && !n_right_sibling) {
        if (m_right_sibling) {
            delete m_right_sibling; m_right_sibling = 0;
        }
    }
}

std::string microsoft_cfb_t::dir_entry_t::mini_stream() {
    if (f_mini_stream)
        return m_mini_stream;
    n_mini_stream = true;
    if (object_type() == microsoft_cfb_t::dir_entry_t::OBJ_TYPE_ROOT_STORAGE) {
        n_mini_stream = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(((ofs() + 1) * _root()->sector_size()));
        m_mini_stream = io->read_bytes(size());
        io->seek(_pos);
        f_mini_stream = true;
    }
    return m_mini_stream;
}

microsoft_cfb_t::dir_entry_t* microsoft_cfb_t::dir_entry_t::child() {
    if (f_child)
        return m_child;
    n_child = true;
    if (child_id() != -1) {
        n_child = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek((((_root()->header()->ofs_dir() + 1) * _root()->sector_size()) + (child_id() * 128)));
        m_child = new dir_entry_t(io, this, m__root);
        io->seek(_pos);
        f_child = true;
    }
    return m_child;
}

microsoft_cfb_t::dir_entry_t* microsoft_cfb_t::dir_entry_t::left_sibling() {
    if (f_left_sibling)
        return m_left_sibling;
    n_left_sibling = true;
    if (left_sibling_id() != -1) {
        n_left_sibling = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek((((_root()->header()->ofs_dir() + 1) * _root()->sector_size()) + (left_sibling_id() * 128)));
        m_left_sibling = new dir_entry_t(io, this, m__root);
        io->seek(_pos);
        f_left_sibling = true;
    }
    return m_left_sibling;
}

microsoft_cfb_t::dir_entry_t* microsoft_cfb_t::dir_entry_t::right_sibling() {
    if (f_right_sibling)
        return m_right_sibling;
    n_right_sibling = true;
    if (right_sibling_id() != -1) {
        n_right_sibling = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek((((_root()->header()->ofs_dir() + 1) * _root()->sector_size()) + (right_sibling_id() * 128)));
        m_right_sibling = new dir_entry_t(io, this, m__root);
        io->seek(_pos);
        f_right_sibling = true;
    }
    return m_right_sibling;
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
    m_dir = new dir_entry_t(m__io, this, m__root);
    m__io->seek(_pos);
    f_dir = true;
    return m_dir;
}

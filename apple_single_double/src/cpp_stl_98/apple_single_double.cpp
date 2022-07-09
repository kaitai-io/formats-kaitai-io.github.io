// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "apple_single_double.h"

apple_single_double_t::apple_single_double_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, apple_single_double_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void apple_single_double_t::_read() {
    m_magic = static_cast<apple_single_double_t::file_type_t>(m__io->read_u4be());
    m_version = m__io->read_u4be();
    m_reserved = m__io->read_bytes(16);
    m_num_entries = m__io->read_u2be();
    m_entries = new std::vector<entry_t*>();
    const int l_entries = num_entries();
    for (int i = 0; i < l_entries; i++) {
        m_entries->push_back(new entry_t(m__io, this, m__root));
    }
}

apple_single_double_t::~apple_single_double_t() {
    _clean_up();
}

void apple_single_double_t::_clean_up() {
    if (m_entries) {
        for (std::vector<entry_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

apple_single_double_t::entry_t::entry_t(kaitai::kstream* p__io, apple_single_double_t* p__parent, apple_single_double_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = 0;
    f_body = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void apple_single_double_t::entry_t::_read() {
    m_type = static_cast<apple_single_double_t::entry_t::types_t>(m__io->read_u4be());
    m_ofs_body = m__io->read_u4be();
    m_len_body = m__io->read_u4be();
}

apple_single_double_t::entry_t::~entry_t() {
    _clean_up();
}

void apple_single_double_t::entry_t::_clean_up() {
    if (f_body && !n_body) {
        if (m__io__raw_body) {
            delete m__io__raw_body; m__io__raw_body = 0;
        }
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

apple_single_double_t::finder_info_t* apple_single_double_t::entry_t::body() {
    if (f_body)
        return m_body;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_body());
    n_body = true;
    switch (type()) {
    case apple_single_double_t::entry_t::TYPES_FINDER_INFO: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new finder_info_t(m__io__raw_body, this, m__root);
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes(len_body());
        break;
    }
    }
    m__io->seek(_pos);
    f_body = true;
    return m_body;
}

apple_single_double_t::finder_info_t::finder_info_t(kaitai::kstream* p__io, apple_single_double_t::entry_t* p__parent, apple_single_double_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_location = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void apple_single_double_t::finder_info_t::_read() {
    m_file_type = m__io->read_bytes(4);
    m_file_creator = m__io->read_bytes(4);
    m_flags = m__io->read_u2be();
    m_location = new point_t(m__io, this, m__root);
    m_folder_id = m__io->read_u2be();
}

apple_single_double_t::finder_info_t::~finder_info_t() {
    _clean_up();
}

void apple_single_double_t::finder_info_t::_clean_up() {
    if (m_location) {
        delete m_location; m_location = 0;
    }
}

apple_single_double_t::point_t::point_t(kaitai::kstream* p__io, apple_single_double_t::finder_info_t* p__parent, apple_single_double_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void apple_single_double_t::point_t::_read() {
    m_x = m__io->read_u2be();
    m_y = m__io->read_u2be();
}

apple_single_double_t::point_t::~point_t() {
    _clean_up();
}

void apple_single_double_t::point_t::_clean_up() {
}

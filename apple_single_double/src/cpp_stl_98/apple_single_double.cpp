// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "apple_single_double.h"
std::set<apple_single_double_t::file_type_t> apple_single_double_t::_build_values_file_type_t() {
    std::set<apple_single_double_t::file_type_t> _t;
    _t.insert(apple_single_double_t::FILE_TYPE_APPLE_SINGLE);
    _t.insert(apple_single_double_t::FILE_TYPE_APPLE_DOUBLE);
    return _t;
}
const std::set<apple_single_double_t::file_type_t> apple_single_double_t::_values_file_type_t = apple_single_double_t::_build_values_file_type_t();
bool apple_single_double_t::_is_defined_file_type_t(apple_single_double_t::file_type_t v) {
    return apple_single_double_t::_values_file_type_t.find(v) != apple_single_double_t::_values_file_type_t.end();
}

apple_single_double_t::apple_single_double_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, apple_single_double_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
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
std::set<apple_single_double_t::entry_t::types_t> apple_single_double_t::entry_t::_build_values_types_t() {
    std::set<apple_single_double_t::entry_t::types_t> _t;
    _t.insert(apple_single_double_t::entry_t::TYPES_DATA_FORK);
    _t.insert(apple_single_double_t::entry_t::TYPES_RESOURCE_FORK);
    _t.insert(apple_single_double_t::entry_t::TYPES_REAL_NAME);
    _t.insert(apple_single_double_t::entry_t::TYPES_COMMENT);
    _t.insert(apple_single_double_t::entry_t::TYPES_ICON_BW);
    _t.insert(apple_single_double_t::entry_t::TYPES_ICON_COLOR);
    _t.insert(apple_single_double_t::entry_t::TYPES_FILE_DATES_INFO);
    _t.insert(apple_single_double_t::entry_t::TYPES_FINDER_INFO);
    _t.insert(apple_single_double_t::entry_t::TYPES_MACINTOSH_FILE_INFO);
    _t.insert(apple_single_double_t::entry_t::TYPES_PRODOS_FILE_INFO);
    _t.insert(apple_single_double_t::entry_t::TYPES_MSDOS_FILE_INFO);
    _t.insert(apple_single_double_t::entry_t::TYPES_AFP_SHORT_NAME);
    _t.insert(apple_single_double_t::entry_t::TYPES_AFP_FILE_INFO);
    _t.insert(apple_single_double_t::entry_t::TYPES_AFP_DIRECTORY_ID);
    return _t;
}
const std::set<apple_single_double_t::entry_t::types_t> apple_single_double_t::entry_t::_values_types_t = apple_single_double_t::entry_t::_build_values_types_t();
bool apple_single_double_t::entry_t::_is_defined_types_t(apple_single_double_t::entry_t::types_t v) {
    return apple_single_double_t::entry_t::_values_types_t.find(v) != apple_single_double_t::entry_t::_values_types_t.end();
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
    f_body = true;
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

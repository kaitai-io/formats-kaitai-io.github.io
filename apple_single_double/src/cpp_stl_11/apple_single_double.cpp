// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "apple_single_double.h"
const std::set<apple_single_double_t::file_type_t> apple_single_double_t::_values_file_type_t{
    apple_single_double_t::FILE_TYPE_APPLE_SINGLE,
    apple_single_double_t::FILE_TYPE_APPLE_DOUBLE,
};
bool apple_single_double_t::_is_defined_file_type_t(apple_single_double_t::file_type_t v) {
    return apple_single_double_t::_values_file_type_t.find(v) != apple_single_double_t::_values_file_type_t.end();
}

apple_single_double_t::apple_single_double_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, apple_single_double_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_entries = nullptr;
    _read();
}

void apple_single_double_t::_read() {
    m_magic = static_cast<apple_single_double_t::file_type_t>(m__io->read_u4be());
    m_version = m__io->read_u4be();
    m_reserved = m__io->read_bytes(16);
    m_num_entries = m__io->read_u2be();
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<entry_t>>>(new std::vector<std::unique_ptr<entry_t>>());
    const int l_entries = num_entries();
    for (int i = 0; i < l_entries; i++) {
        m_entries->push_back(std::move(std::unique_ptr<entry_t>(new entry_t(m__io, this, m__root))));
    }
}

apple_single_double_t::~apple_single_double_t() {
    _clean_up();
}

void apple_single_double_t::_clean_up() {
}
const std::set<apple_single_double_t::entry_t::types_t> apple_single_double_t::entry_t::_values_types_t{
    apple_single_double_t::entry_t::TYPES_DATA_FORK,
    apple_single_double_t::entry_t::TYPES_RESOURCE_FORK,
    apple_single_double_t::entry_t::TYPES_REAL_NAME,
    apple_single_double_t::entry_t::TYPES_COMMENT,
    apple_single_double_t::entry_t::TYPES_ICON_BW,
    apple_single_double_t::entry_t::TYPES_ICON_COLOR,
    apple_single_double_t::entry_t::TYPES_FILE_DATES_INFO,
    apple_single_double_t::entry_t::TYPES_FINDER_INFO,
    apple_single_double_t::entry_t::TYPES_MACINTOSH_FILE_INFO,
    apple_single_double_t::entry_t::TYPES_PRODOS_FILE_INFO,
    apple_single_double_t::entry_t::TYPES_MSDOS_FILE_INFO,
    apple_single_double_t::entry_t::TYPES_AFP_SHORT_NAME,
    apple_single_double_t::entry_t::TYPES_AFP_FILE_INFO,
    apple_single_double_t::entry_t::TYPES_AFP_DIRECTORY_ID,
};
bool apple_single_double_t::entry_t::_is_defined_types_t(apple_single_double_t::entry_t::types_t v) {
    return apple_single_double_t::entry_t::_values_types_t.find(v) != apple_single_double_t::entry_t::_values_types_t.end();
}

apple_single_double_t::entry_t::entry_t(kaitai::kstream* p__io, apple_single_double_t* p__parent, apple_single_double_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = nullptr;
    f_body = false;
    _read();
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
    }
}

apple_single_double_t::finder_info_t* apple_single_double_t::entry_t::body() {
    if (f_body)
        return m_body.get();
    f_body = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_body());
    n_body = true;
    switch (type()) {
    case apple_single_double_t::entry_t::TYPES_FINDER_INFO: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<finder_info_t>(new finder_info_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes(len_body());
        break;
    }
    }
    m__io->seek(_pos);
    return m_body.get();
}

apple_single_double_t::finder_info_t::finder_info_t(kaitai::kstream* p__io, apple_single_double_t::entry_t* p__parent, apple_single_double_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_location = nullptr;
    _read();
}

void apple_single_double_t::finder_info_t::_read() {
    m_file_type = m__io->read_bytes(4);
    m_file_creator = m__io->read_bytes(4);
    m_flags = m__io->read_u2be();
    m_location = std::unique_ptr<point_t>(new point_t(m__io, this, m__root));
    m_folder_id = m__io->read_u2be();
}

apple_single_double_t::finder_info_t::~finder_info_t() {
    _clean_up();
}

void apple_single_double_t::finder_info_t::_clean_up() {
}

apple_single_double_t::point_t::point_t(kaitai::kstream* p__io, apple_single_double_t::finder_info_t* p__parent, apple_single_double_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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

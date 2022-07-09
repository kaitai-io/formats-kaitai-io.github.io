// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "android_dto.h"
#include "kaitai/exceptions.h"

android_dto_t::android_dto_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, android_dto_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = 0;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void android_dto_t::_read() {
    m_header = new dt_table_header_t(m__io, this, m__root);
    m_entries = new std::vector<dt_table_entry_t*>();
    const int l_entries = header()->dt_entry_count();
    for (int i = 0; i < l_entries; i++) {
        m_entries->push_back(new dt_table_entry_t(m__io, this, m__root));
    }
}

android_dto_t::~android_dto_t() {
    _clean_up();
}

void android_dto_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (m_entries) {
        for (std::vector<dt_table_entry_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

android_dto_t::dt_table_header_t::dt_table_header_t(kaitai::kstream* p__io, android_dto_t* p__parent, android_dto_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void android_dto_t::dt_table_header_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\xD7\xB7\xAB\x1E", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xD7\xB7\xAB\x1E", 4), magic(), _io(), std::string("/types/dt_table_header/seq/0"));
    }
    m_total_size = m__io->read_u4be();
    m_header_size = m__io->read_u4be();
    m_dt_entry_size = m__io->read_u4be();
    m_dt_entry_count = m__io->read_u4be();
    m_dt_entries_offset = m__io->read_u4be();
    m_page_size = m__io->read_u4be();
    m_version = m__io->read_u4be();
}

android_dto_t::dt_table_header_t::~dt_table_header_t() {
    _clean_up();
}

void android_dto_t::dt_table_header_t::_clean_up() {
}

android_dto_t::dt_table_entry_t::dt_table_entry_t(kaitai::kstream* p__io, android_dto_t* p__parent, android_dto_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_custom = 0;
    f_body = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void android_dto_t::dt_table_entry_t::_read() {
    m_dt_size = m__io->read_u4be();
    m_dt_offset = m__io->read_u4be();
    m_id = m__io->read_u4be();
    m_rev = m__io->read_u4be();
    m_custom = new std::vector<uint32_t>();
    const int l_custom = 4;
    for (int i = 0; i < l_custom; i++) {
        m_custom->push_back(m__io->read_u4be());
    }
}

android_dto_t::dt_table_entry_t::~dt_table_entry_t() {
    _clean_up();
}

void android_dto_t::dt_table_entry_t::_clean_up() {
    if (m_custom) {
        delete m_custom; m_custom = 0;
    }
    if (f_body) {
    }
}

std::string android_dto_t::dt_table_entry_t::body() {
    if (f_body)
        return m_body;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(dt_offset());
    m_body = io->read_bytes(dt_size());
    io->seek(_pos);
    f_body = true;
    return m_body;
}

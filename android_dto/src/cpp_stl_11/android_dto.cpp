// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "android_dto.h"
#include "kaitai/exceptions.h"

android_dto_t::android_dto_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, android_dto_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = nullptr;
    m_entries = nullptr;
    _read();
}

void android_dto_t::_read() {
    m_header = std::unique_ptr<dt_table_header_t>(new dt_table_header_t(m__io, this, m__root));
    int l_entries = header()->dt_entry_count();
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<dt_table_entry_t>>>(new std::vector<std::unique_ptr<dt_table_entry_t>>());
    m_entries->reserve(l_entries);
    for (int i = 0; i < l_entries; i++) {
        m_entries->push_back(std::move(std::unique_ptr<dt_table_entry_t>(new dt_table_entry_t(m__io, this, m__root))));
    }
}

android_dto_t::~android_dto_t() {
    _clean_up();
}

void android_dto_t::_clean_up() {
}

android_dto_t::dt_table_header_t::dt_table_header_t(kaitai::kstream* p__io, android_dto_t* p__parent, android_dto_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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
    m_custom = nullptr;
    f_body = false;
    _read();
}

void android_dto_t::dt_table_entry_t::_read() {
    m_dt_size = m__io->read_u4be();
    m_dt_offset = m__io->read_u4be();
    m_id = m__io->read_u4be();
    m_rev = m__io->read_u4be();
    int l_custom = 4;
    m_custom = std::unique_ptr<std::vector<uint32_t>>(new std::vector<uint32_t>());
    m_custom->reserve(l_custom);
    for (int i = 0; i < l_custom; i++) {
        m_custom->push_back(std::move(m__io->read_u4be()));
    }
}

android_dto_t::dt_table_entry_t::~dt_table_entry_t() {
    _clean_up();
}

void android_dto_t::dt_table_entry_t::_clean_up() {
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

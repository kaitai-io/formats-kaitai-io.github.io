// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "tsm.h"
#include "kaitai/exceptions.h"

tsm_t::tsm_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, tsm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = nullptr;
    m_index = nullptr;
    f_index = false;
    _read();
}

void tsm_t::_read() {
    m_header = std::unique_ptr<header_t>(new header_t(m__io, this, m__root));
}

tsm_t::~tsm_t() {
    _clean_up();
}

void tsm_t::_clean_up() {
    if (f_index) {
    }
}

tsm_t::header_t::header_t(kaitai::kstream* p__io, tsm_t* p__parent, tsm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void tsm_t::header_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\x16\xD1\x16\xD1", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x16\xD1\x16\xD1", 4), magic(), _io(), std::string("/types/header/seq/0"));
    }
    m_version = m__io->read_u1();
}

tsm_t::header_t::~header_t() {
    _clean_up();
}

void tsm_t::header_t::_clean_up() {
}

tsm_t::index_t::index_t(kaitai::kstream* p__io, tsm_t* p__parent, tsm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    f_entries = false;
    _read();
}

void tsm_t::index_t::_read() {
    m_offset = m__io->read_u8be();
}

tsm_t::index_t::~index_t() {
    _clean_up();
}

void tsm_t::index_t::_clean_up() {
    if (f_entries) {
    }
}

tsm_t::index_t::index_header_t::index_header_t(kaitai::kstream* p__io, tsm_t::index_t* p__parent, tsm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_index_entries = nullptr;
    _read();
}

void tsm_t::index_t::index_header_t::_read() {
    m_key_len = m__io->read_u2be();
    m_key = kaitai::kstream::bytes_to_str(m__io->read_bytes(key_len()), std::string("UTF-8"));
    m_type = m__io->read_u1();
    m_entry_count = m__io->read_u2be();
    int l_index_entries = entry_count();
    m_index_entries = std::unique_ptr<std::vector<std::unique_ptr<index_entry_t>>>(new std::vector<std::unique_ptr<index_entry_t>>());
    m_index_entries->reserve(l_index_entries);
    for (int i = 0; i < l_index_entries; i++) {
        m_index_entries->push_back(std::move(std::unique_ptr<index_entry_t>(new index_entry_t(m__io, this, m__root))));
    }
}

tsm_t::index_t::index_header_t::~index_header_t() {
    _clean_up();
}

void tsm_t::index_t::index_header_t::_clean_up() {
}

tsm_t::index_t::index_header_t::index_entry_t::index_entry_t(kaitai::kstream* p__io, tsm_t::index_t::index_header_t* p__parent, tsm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_block = nullptr;
    f_block = false;
    _read();
}

void tsm_t::index_t::index_header_t::index_entry_t::_read() {
    m_min_time = m__io->read_u8be();
    m_max_time = m__io->read_u8be();
    m_block_offset = m__io->read_u8be();
    m_block_size = m__io->read_u4be();
}

tsm_t::index_t::index_header_t::index_entry_t::~index_entry_t() {
    _clean_up();
}

void tsm_t::index_t::index_header_t::index_entry_t::_clean_up() {
    if (f_block) {
    }
}

tsm_t::index_t::index_header_t::index_entry_t::block_entry_t::block_entry_t(kaitai::kstream* p__io, tsm_t::index_t::index_header_t::index_entry_t* p__parent, tsm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void tsm_t::index_t::index_header_t::index_entry_t::block_entry_t::_read() {
    m_crc32 = m__io->read_u4be();
    m_data = m__io->read_bytes((_parent()->block_size() - 4));
}

tsm_t::index_t::index_header_t::index_entry_t::block_entry_t::~block_entry_t() {
    _clean_up();
}

void tsm_t::index_t::index_header_t::index_entry_t::block_entry_t::_clean_up() {
}

tsm_t::index_t::index_header_t::index_entry_t::block_entry_t* tsm_t::index_t::index_header_t::index_entry_t::block() {
    if (f_block)
        return m_block.get();
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(block_offset());
    m_block = std::unique_ptr<block_entry_t>(new block_entry_t(io, this, m__root));
    io->seek(_pos);
    f_block = true;
    return m_block.get();
}

std::vector<std::unique_ptr<tsm_t::index_t::index_header_t>>* tsm_t::index_t::entries() {
    if (f_entries)
        return m_entries.get();
    std::streampos _pos = m__io->pos();
    m__io->seek(offset());
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<index_header_t>>>(new std::vector<std::unique_ptr<index_header_t>>());
    {
        int i = 0;
        index_header_t* _;
        do {
            _ = new index_header_t(m__io, this, m__root);
            m_entries->push_back(std::move(std::unique_ptr<index_header_t>(_)));
            i++;
        } while (!(_io()->pos() == (_io()->size() - 8)));
    }
    m__io->seek(_pos);
    f_entries = true;
    return m_entries.get();
}

tsm_t::index_t* tsm_t::index() {
    if (f_index)
        return m_index.get();
    std::streampos _pos = m__io->pos();
    m__io->seek((_io()->size() - 8));
    m_index = std::unique_ptr<index_t>(new index_t(m__io, this, m__root));
    m__io->seek(_pos);
    f_index = true;
    return m_index.get();
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "tsm.h"



tsm_t::tsm_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, tsm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    f_index = false;
    _read();
}

void tsm_t::_read() {
    m_header = new header_t(m__io, this, m__root);
}

tsm_t::~tsm_t() {
    delete m_header;
    if (f_index) {
        delete m_index;
    }
}

tsm_t::header_t::header_t(kaitai::kstream* p__io, tsm_t* p__parent, tsm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void tsm_t::header_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\x16\xD1\x16\xD1", 4));
    m_version = m__io->read_u1();
}

tsm_t::header_t::~header_t() {
}

tsm_t::index_t::index_t(kaitai::kstream* p__io, tsm_t* p__parent, tsm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_entries = false;
    _read();
}

void tsm_t::index_t::_read() {
    m_offset = m__io->read_u8be();
}

tsm_t::index_t::~index_t() {
    if (f_entries) {
        for (std::vector<index_header_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries;
    }
}

tsm_t::index_t::index_header_t::index_header_t(kaitai::kstream* p__io, tsm_t::index_t* p__parent, tsm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void tsm_t::index_t::index_header_t::_read() {
    m_key_len = m__io->read_u2be();
    m_key = kaitai::kstream::bytes_to_str(m__io->read_bytes(key_len()), std::string("UTF-8"));
    m_type = m__io->read_u1();
    m_entry_count = m__io->read_u2be();
    int l_index_entries = entry_count();
    m_index_entries = new std::vector<index_entry_t*>();
    m_index_entries->reserve(l_index_entries);
    for (int i = 0; i < l_index_entries; i++) {
        m_index_entries->push_back(new index_entry_t(m__io, this, m__root));
    }
}

tsm_t::index_t::index_header_t::~index_header_t() {
    for (std::vector<index_entry_t*>::iterator it = m_index_entries->begin(); it != m_index_entries->end(); ++it) {
        delete *it;
    }
    delete m_index_entries;
}

tsm_t::index_t::index_header_t::index_entry_t::index_entry_t(kaitai::kstream* p__io, tsm_t::index_t::index_header_t* p__parent, tsm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
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
    if (f_block) {
        delete m_block;
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
}

tsm_t::index_t::index_header_t::index_entry_t::block_entry_t* tsm_t::index_t::index_header_t::index_entry_t::block() {
    if (f_block)
        return m_block;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(block_offset());
    m_block = new block_entry_t(io, this, m__root);
    io->seek(_pos);
    f_block = true;
    return m_block;
}

std::vector<tsm_t::index_t::index_header_t*>* tsm_t::index_t::entries() {
    if (f_entries)
        return m_entries;
    std::streampos _pos = m__io->pos();
    m__io->seek(offset());
    m_entries = new std::vector<index_header_t*>();
    {
        int i = 0;
        index_header_t* _;
        do {
            _ = new index_header_t(m__io, this, m__root);
            m_entries->push_back(_);
            i++;
        } while (!(_io()->pos() == (_io()->size() - 8)));
    }
    m__io->seek(_pos);
    f_entries = true;
    return m_entries;
}

tsm_t::index_t* tsm_t::index() {
    if (f_index)
        return m_index;
    std::streampos _pos = m__io->pos();
    m__io->seek((_io()->size() - 8));
    m_index = new index_t(m__io, this, m__root);
    m__io->seek(_pos);
    f_index = true;
    return m_index;
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "tsm.h"
#include "kaitai/exceptions.h"

tsm_t::tsm_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, tsm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = 0;
    m_index = 0;
    f_index = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void tsm_t::_read() {
    m_header = new header_t(m__io, this, m__root);
}

tsm_t::~tsm_t() {
    _clean_up();
}

void tsm_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (f_index) {
        if (m_index) {
            delete m_index; m_index = 0;
        }
    }
}

tsm_t::header_t::header_t(kaitai::kstream* p__io, tsm_t* p__parent, tsm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_entries = 0;
    f_entries = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void tsm_t::index_t::_read() {
    m_offset = m__io->read_u8be();
}

tsm_t::index_t::~index_t() {
    _clean_up();
}

void tsm_t::index_t::_clean_up() {
    if (f_entries) {
        if (m_entries) {
            for (std::vector<index_header_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
                delete *it;
            }
            delete m_entries; m_entries = 0;
        }
    }
}

tsm_t::index_t::index_header_t::index_header_t(kaitai::kstream* p__io, tsm_t::index_t* p__parent, tsm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_index_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void tsm_t::index_t::index_header_t::_read() {
    m_key_len = m__io->read_u2be();
    m_key = kaitai::kstream::bytes_to_str(m__io->read_bytes(key_len()), std::string("UTF-8"));
    m_type = m__io->read_u1();
    m_entry_count = m__io->read_u2be();
    m_index_entries = new std::vector<index_entry_t*>();
    const int l_index_entries = entry_count();
    for (int i = 0; i < l_index_entries; i++) {
        m_index_entries->push_back(new index_entry_t(m__io, this, m__root));
    }
}

tsm_t::index_t::index_header_t::~index_header_t() {
    _clean_up();
}

void tsm_t::index_t::index_header_t::_clean_up() {
    if (m_index_entries) {
        for (std::vector<index_entry_t*>::iterator it = m_index_entries->begin(); it != m_index_entries->end(); ++it) {
            delete *it;
        }
        delete m_index_entries; m_index_entries = 0;
    }
}

tsm_t::index_t::index_header_t::index_entry_t::index_entry_t(kaitai::kstream* p__io, tsm_t::index_t::index_header_t* p__parent, tsm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_block = 0;
    f_block = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
        if (m_block) {
            delete m_block; m_block = 0;
        }
    }
}

tsm_t::index_t::index_header_t::index_entry_t::block_entry_t::block_entry_t(kaitai::kstream* p__io, tsm_t::index_t::index_header_t::index_entry_t* p__parent, tsm_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

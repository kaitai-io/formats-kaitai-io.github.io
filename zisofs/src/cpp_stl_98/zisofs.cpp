// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "zisofs.h"
#include "kaitai/exceptions.h"

zisofs_t::zisofs_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, zisofs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header = 0;
    m__io__raw_header = 0;
    m_block_pointers = 0;
    m_blocks = 0;
    f_blocks = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zisofs_t::_read() {
    m__raw_header = m__io->read_bytes(16);
    m__io__raw_header = new kaitai::kstream(m__raw_header);
    m_header = new header_t(m__io__raw_header, this, m__root);
    m_block_pointers = new std::vector<uint32_t>();
    const int l_block_pointers = header()->num_blocks() + 1;
    for (int i = 0; i < l_block_pointers; i++) {
        m_block_pointers->push_back(m__io->read_u4le());
    }
}

zisofs_t::~zisofs_t() {
    _clean_up();
}

void zisofs_t::_clean_up() {
    if (m__io__raw_header) {
        delete m__io__raw_header; m__io__raw_header = 0;
    }
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (m_block_pointers) {
        delete m_block_pointers; m_block_pointers = 0;
    }
    if (f_blocks) {
        if (m_blocks) {
            for (std::vector<block_t*>::iterator it = m_blocks->begin(); it != m_blocks->end(); ++it) {
                delete *it;
            }
            delete m_blocks; m_blocks = 0;
        }
    }
}

zisofs_t::block_t::block_t(uint32_t p_ofs_start, uint32_t p_ofs_end, kaitai::kstream* p__io, zisofs_t* p__parent, zisofs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_ofs_start = p_ofs_start;
    m_ofs_end = p_ofs_end;
    f_data = false;
    f_len_data = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zisofs_t::block_t::_read() {
}

zisofs_t::block_t::~block_t() {
    _clean_up();
}

void zisofs_t::block_t::_clean_up() {
    if (f_data) {
    }
}

std::string zisofs_t::block_t::data() {
    if (f_data)
        return m_data;
    f_data = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_start());
    m_data = io->read_bytes(len_data());
    io->seek(_pos);
    return m_data;
}

int32_t zisofs_t::block_t::len_data() {
    if (f_len_data)
        return m_len_data;
    f_len_data = true;
    m_len_data = ofs_end() - ofs_start();
    return m_len_data;
}

zisofs_t::header_t::header_t(kaitai::kstream* p__io, zisofs_t* p__parent, zisofs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_block_size = false;
    f_num_blocks = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zisofs_t::header_t::_read() {
    m_magic = m__io->read_bytes(8);
    if (!(m_magic == std::string("\x37\xE4\x53\x96\xC9\xDB\xD6\x07", 8))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x37\xE4\x53\x96\xC9\xDB\xD6\x07", 8), m_magic, m__io, std::string("/types/header/seq/0"));
    }
    m_uncompressed_size = m__io->read_u4le();
    m_len_header = m__io->read_u1();
    if (!(m_len_header == 4)) {
        throw kaitai::validation_not_equal_error<uint8_t>(4, m_len_header, m__io, std::string("/types/header/seq/2"));
    }
    m_block_size_log2 = m__io->read_u1();
    if (!( ((m_block_size_log2 == 15) || (m_block_size_log2 == 16) || (m_block_size_log2 == 17)) )) {
        throw kaitai::validation_not_any_of_error<uint8_t>(m_block_size_log2, m__io, std::string("/types/header/seq/3"));
    }
    m_reserved = m__io->read_bytes(2);
    if (!(m_reserved == std::string("\x00\x00", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00", 2), m_reserved, m__io, std::string("/types/header/seq/4"));
    }
}

zisofs_t::header_t::~header_t() {
    _clean_up();
}

void zisofs_t::header_t::_clean_up() {
}

int32_t zisofs_t::header_t::block_size() {
    if (f_block_size)
        return m_block_size;
    f_block_size = true;
    m_block_size = 1 << block_size_log2();
    return m_block_size;
}

int32_t zisofs_t::header_t::num_blocks() {
    if (f_num_blocks)
        return m_num_blocks;
    f_num_blocks = true;
    m_num_blocks = uncompressed_size() / block_size() + ((kaitai::kstream::mod(uncompressed_size(), block_size()) != 0) ? (1) : (0));
    return m_num_blocks;
}

std::vector<zisofs_t::block_t*>* zisofs_t::blocks() {
    if (f_blocks)
        return m_blocks;
    f_blocks = true;
    m_blocks = new std::vector<block_t*>();
    const int l_blocks = header()->num_blocks();
    for (int i = 0; i < l_blocks; i++) {
        m_blocks->push_back(new block_t(block_pointers()->at(i), block_pointers()->at(i + 1), m__io, this, m__root));
    }
    return m_blocks;
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "zisofs.h"
#include "kaitai/exceptions.h"

zisofs_t::zisofs_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, zisofs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = nullptr;
    m__io__raw_header = nullptr;
    m_block_pointers = nullptr;
    m_blocks = nullptr;
    f_blocks = false;
    _read();
}

void zisofs_t::_read() {
    m__raw_header = m__io->read_bytes(16);
    m__io__raw_header = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_header));
    m_header = std::unique_ptr<header_t>(new header_t(m__io__raw_header.get(), this, m__root));
    int l_block_pointers = (header()->num_blocks() + 1);
    m_block_pointers = std::unique_ptr<std::vector<uint32_t>>(new std::vector<uint32_t>());
    m_block_pointers->reserve(l_block_pointers);
    for (int i = 0; i < l_block_pointers; i++) {
        m_block_pointers->push_back(std::move(m__io->read_u4le()));
    }
}

zisofs_t::~zisofs_t() {
    _clean_up();
}

void zisofs_t::_clean_up() {
    if (f_blocks) {
    }
}

zisofs_t::header_t::header_t(kaitai::kstream* p__io, zisofs_t* p__parent, zisofs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_block_size = false;
    f_num_blocks = false;
    _read();
}

void zisofs_t::header_t::_read() {
    m_magic = m__io->read_bytes(8);
    if (!(magic() == std::string("\x37\xE4\x53\x96\xC9\xDB\xD6\x07", 8))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x37\xE4\x53\x96\xC9\xDB\xD6\x07", 8), magic(), _io(), std::string("/types/header/seq/0"));
    }
    m_uncompressed_size = m__io->read_u4le();
    m_len_header = m__io->read_u1();
    if (!(len_header() == 4)) {
        throw kaitai::validation_not_equal_error<uint8_t>(4, len_header(), _io(), std::string("/types/header/seq/2"));
    }
    m_block_size_log2 = m__io->read_u1();
    if (!( ((block_size_log2() == 15) || (block_size_log2() == 16) || (block_size_log2() == 17)) )) {
        throw kaitai::validation_not_any_of_error<uint8_t>(block_size_log2(), _io(), std::string("/types/header/seq/3"));
    }
    m_reserved = m__io->read_bytes(2);
    if (!(reserved() == std::string("\x00\x00", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00", 2), reserved(), _io(), std::string("/types/header/seq/4"));
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
    m_block_size = (1 << block_size_log2());
    f_block_size = true;
    return m_block_size;
}

int32_t zisofs_t::header_t::num_blocks() {
    if (f_num_blocks)
        return m_num_blocks;
    m_num_blocks = ((uncompressed_size() / block_size()) + ((kaitai::kstream::mod(uncompressed_size(), block_size()) != 0) ? (1) : (0)));
    f_num_blocks = true;
    return m_num_blocks;
}

zisofs_t::block_t::block_t(uint32_t p_ofs_start, uint32_t p_ofs_end, kaitai::kstream* p__io, zisofs_t* p__parent, zisofs_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_ofs_start = p_ofs_start;
    m_ofs_end = p_ofs_end;
    f_len_data = false;
    f_data = false;
    _read();
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

int32_t zisofs_t::block_t::len_data() {
    if (f_len_data)
        return m_len_data;
    m_len_data = (ofs_end() - ofs_start());
    f_len_data = true;
    return m_len_data;
}

std::string zisofs_t::block_t::data() {
    if (f_data)
        return m_data;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_start());
    m_data = io->read_bytes(len_data());
    io->seek(_pos);
    f_data = true;
    return m_data;
}

std::vector<std::unique_ptr<zisofs_t::block_t>>* zisofs_t::blocks() {
    if (f_blocks)
        return m_blocks.get();
    int l_blocks = header()->num_blocks();
    m_blocks = std::unique_ptr<std::vector<std::unique_ptr<block_t>>>(new std::vector<std::unique_ptr<block_t>>());
    m_blocks->reserve(l_blocks);
    for (int i = 0; i < l_blocks; i++) {
        m_blocks->push_back(std::move(std::unique_ptr<block_t>(new block_t(block_pointers()->at(i), block_pointers()->at((i + 1)), m__io, this, m__root))));
    }
    f_blocks = true;
    return m_blocks.get();
}

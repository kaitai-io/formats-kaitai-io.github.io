// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "fallout2_dat.h"

fallout2_dat_t::fallout2_dat_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, fallout2_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_footer = nullptr;
    m_index = nullptr;
    f_footer = false;
    f_index = false;
    _read();
}

void fallout2_dat_t::_read() {
}

fallout2_dat_t::~fallout2_dat_t() {
    _clean_up();
}

void fallout2_dat_t::_clean_up() {
    if (f_footer) {
    }
    if (f_index) {
    }
}

fallout2_dat_t::pstr_t::pstr_t(kaitai::kstream* p__io, fallout2_dat_t::file_t* p__parent, fallout2_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void fallout2_dat_t::pstr_t::_read() {
    m_size = m__io->read_u4le();
    m_str = kaitai::kstream::bytes_to_str(m__io->read_bytes(size()), std::string("ASCII"));
}

fallout2_dat_t::pstr_t::~pstr_t() {
    _clean_up();
}

void fallout2_dat_t::pstr_t::_clean_up() {
}

fallout2_dat_t::footer_t::footer_t(kaitai::kstream* p__io, fallout2_dat_t* p__parent, fallout2_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void fallout2_dat_t::footer_t::_read() {
    m_index_size = m__io->read_u4le();
    m_file_size = m__io->read_u4le();
}

fallout2_dat_t::footer_t::~footer_t() {
    _clean_up();
}

void fallout2_dat_t::footer_t::_clean_up() {
}

fallout2_dat_t::index_t::index_t(kaitai::kstream* p__io, fallout2_dat_t* p__parent, fallout2_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_files = nullptr;
    _read();
}

void fallout2_dat_t::index_t::_read() {
    m_file_count = m__io->read_u4le();
    int l_files = file_count();
    m_files = std::unique_ptr<std::vector<std::unique_ptr<file_t>>>(new std::vector<std::unique_ptr<file_t>>());
    m_files->reserve(l_files);
    for (int i = 0; i < l_files; i++) {
        m_files->push_back(std::move(std::unique_ptr<file_t>(new file_t(m__io, this, m__root))));
    }
}

fallout2_dat_t::index_t::~index_t() {
    _clean_up();
}

void fallout2_dat_t::index_t::_clean_up() {
}

fallout2_dat_t::file_t::file_t(kaitai::kstream* p__io, fallout2_dat_t::index_t* p__parent, fallout2_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name = nullptr;
    m__io_contents_zlib = nullptr;
    f_contents_raw = false;
    f_contents_zlib = false;
    f_contents = false;
    _read();
}

void fallout2_dat_t::file_t::_read() {
    m_name = std::unique_ptr<pstr_t>(new pstr_t(m__io, this, m__root));
    m_flags = static_cast<fallout2_dat_t::compression_t>(m__io->read_u1());
    m_size_unpacked = m__io->read_u4le();
    m_size_packed = m__io->read_u4le();
    m_offset = m__io->read_u4le();
}

fallout2_dat_t::file_t::~file_t() {
    _clean_up();
}

void fallout2_dat_t::file_t::_clean_up() {
    if (f_contents_raw && !n_contents_raw) {
    }
    if (f_contents_zlib && !n_contents_zlib) {
    }
}

std::string fallout2_dat_t::file_t::contents_raw() {
    if (f_contents_raw)
        return m_contents_raw;
    n_contents_raw = true;
    if (flags() == fallout2_dat_t::COMPRESSION_NONE) {
        n_contents_raw = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(offset());
        m_contents_raw = io->read_bytes(size_unpacked());
        io->seek(_pos);
        f_contents_raw = true;
    }
    return m_contents_raw;
}

std::string fallout2_dat_t::file_t::contents_zlib() {
    if (f_contents_zlib)
        return m_contents_zlib;
    n_contents_zlib = true;
    if (flags() == fallout2_dat_t::COMPRESSION_ZLIB) {
        n_contents_zlib = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(offset());
        m__raw_contents_zlib = io->read_bytes(size_packed());
        m_contents_zlib = kaitai::kstream::process_zlib(m__raw_contents_zlib);
        io->seek(_pos);
        f_contents_zlib = true;
    }
    return m_contents_zlib;
}

std::string fallout2_dat_t::file_t::contents() {
    if (f_contents)
        return m_contents;
    n_contents = true;
    if ( ((flags() == fallout2_dat_t::COMPRESSION_ZLIB) || (flags() == fallout2_dat_t::COMPRESSION_NONE)) ) {
        n_contents = false;
        m_contents = ((flags() == fallout2_dat_t::COMPRESSION_ZLIB) ? (contents_zlib()) : (contents_raw()));
    }
    f_contents = true;
    return m_contents;
}

fallout2_dat_t::footer_t* fallout2_dat_t::footer() {
    if (f_footer)
        return m_footer.get();
    std::streampos _pos = m__io->pos();
    m__io->seek((_io()->size() - 8));
    m_footer = std::unique_ptr<footer_t>(new footer_t(m__io, this, m__root));
    m__io->seek(_pos);
    f_footer = true;
    return m_footer.get();
}

fallout2_dat_t::index_t* fallout2_dat_t::index() {
    if (f_index)
        return m_index.get();
    std::streampos _pos = m__io->pos();
    m__io->seek(((_io()->size() - 8) - footer()->index_size()));
    m_index = std::unique_ptr<index_t>(new index_t(m__io, this, m__root));
    m__io->seek(_pos);
    f_index = true;
    return m_index.get();
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "fallout2_dat.h"
std::set<fallout2_dat_t::compression_t> fallout2_dat_t::_build_values_compression_t() {
    std::set<fallout2_dat_t::compression_t> _t;
    _t.insert(fallout2_dat_t::COMPRESSION_NONE);
    _t.insert(fallout2_dat_t::COMPRESSION_ZLIB);
    return _t;
}
const std::set<fallout2_dat_t::compression_t> fallout2_dat_t::_values_compression_t = fallout2_dat_t::_build_values_compression_t();
bool fallout2_dat_t::_is_defined_compression_t(fallout2_dat_t::compression_t v) {
    return fallout2_dat_t::_values_compression_t.find(v) != fallout2_dat_t::_values_compression_t.end();
}

fallout2_dat_t::fallout2_dat_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, fallout2_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_footer = 0;
    m_index = 0;
    f_footer = false;
    f_index = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void fallout2_dat_t::_read() {
}

fallout2_dat_t::~fallout2_dat_t() {
    _clean_up();
}

void fallout2_dat_t::_clean_up() {
    if (f_footer) {
        if (m_footer) {
            delete m_footer; m_footer = 0;
        }
    }
    if (f_index) {
        if (m_index) {
            delete m_index; m_index = 0;
        }
    }
}

fallout2_dat_t::file_t::file_t(kaitai::kstream* p__io, fallout2_dat_t::index_t* p__parent, fallout2_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name = 0;
    f_contents = false;
    f_contents_raw = false;
    f_contents_zlib = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void fallout2_dat_t::file_t::_read() {
    m_name = new pstr_t(m__io, this, m__root);
    m_flags = static_cast<fallout2_dat_t::compression_t>(m__io->read_u1());
    m_size_unpacked = m__io->read_u4le();
    m_size_packed = m__io->read_u4le();
    m_offset = m__io->read_u4le();
}

fallout2_dat_t::file_t::~file_t() {
    _clean_up();
}

void fallout2_dat_t::file_t::_clean_up() {
    if (m_name) {
        delete m_name; m_name = 0;
    }
    if (f_contents_raw && !n_contents_raw) {
    }
    if (f_contents_zlib && !n_contents_zlib) {
    }
}

std::string fallout2_dat_t::file_t::contents() {
    if (f_contents)
        return m_contents;
    f_contents = true;
    n_contents = true;
    if ( ((flags() == fallout2_dat_t::COMPRESSION_ZLIB) || (flags() == fallout2_dat_t::COMPRESSION_NONE)) ) {
        n_contents = false;
        m_contents = ((flags() == fallout2_dat_t::COMPRESSION_ZLIB) ? (contents_zlib()) : (contents_raw()));
    }
    return m_contents;
}

std::string fallout2_dat_t::file_t::contents_raw() {
    if (f_contents_raw)
        return m_contents_raw;
    f_contents_raw = true;
    n_contents_raw = true;
    if (flags() == fallout2_dat_t::COMPRESSION_NONE) {
        n_contents_raw = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(offset());
        m_contents_raw = io->read_bytes(size_unpacked());
        io->seek(_pos);
    }
    return m_contents_raw;
}

std::string fallout2_dat_t::file_t::contents_zlib() {
    if (f_contents_zlib)
        return m_contents_zlib;
    f_contents_zlib = true;
    n_contents_zlib = true;
    if (flags() == fallout2_dat_t::COMPRESSION_ZLIB) {
        n_contents_zlib = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(offset());
        m__raw_contents_zlib = io->read_bytes(size_packed());
        m_contents_zlib = kaitai::kstream::process_zlib(m__raw_contents_zlib);
        io->seek(_pos);
    }
    return m_contents_zlib;
}

fallout2_dat_t::footer_t::footer_t(kaitai::kstream* p__io, fallout2_dat_t* p__parent, fallout2_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_files = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void fallout2_dat_t::index_t::_read() {
    m_file_count = m__io->read_u4le();
    m_files = new std::vector<file_t*>();
    const int l_files = file_count();
    for (int i = 0; i < l_files; i++) {
        m_files->push_back(new file_t(m__io, this, m__root));
    }
}

fallout2_dat_t::index_t::~index_t() {
    _clean_up();
}

void fallout2_dat_t::index_t::_clean_up() {
    if (m_files) {
        for (std::vector<file_t*>::iterator it = m_files->begin(); it != m_files->end(); ++it) {
            delete *it;
        }
        delete m_files; m_files = 0;
    }
}

fallout2_dat_t::pstr_t::pstr_t(kaitai::kstream* p__io, fallout2_dat_t::file_t* p__parent, fallout2_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void fallout2_dat_t::pstr_t::_read() {
    m_size = m__io->read_u4le();
    m_str = kaitai::kstream::bytes_to_str(m__io->read_bytes(size()), "ASCII");
}

fallout2_dat_t::pstr_t::~pstr_t() {
    _clean_up();
}

void fallout2_dat_t::pstr_t::_clean_up() {
}

fallout2_dat_t::footer_t* fallout2_dat_t::footer() {
    if (f_footer)
        return m_footer;
    f_footer = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(_io()->size() - 8);
    m_footer = new footer_t(m__io, this, m__root);
    m__io->seek(_pos);
    return m_footer;
}

fallout2_dat_t::index_t* fallout2_dat_t::index() {
    if (f_index)
        return m_index;
    f_index = true;
    std::streampos _pos = m__io->pos();
    m__io->seek((_io()->size() - 8) - footer()->index_size());
    m_index = new index_t(m__io, this, m__root);
    m__io->seek(_pos);
    return m_index;
}

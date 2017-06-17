// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "fallout2_dat.h"



fallout2_dat_t::fallout2_dat_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, fallout2_dat_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    f_footer = false;
    f_index = false;
    _read();
}

void fallout2_dat_t::_read() {
}

fallout2_dat_t::~fallout2_dat_t() {
    if (f_footer) {
        delete m_footer;
    }
    if (f_index) {
        delete m_index;
    }
}

fallout2_dat_t::pstr_t::pstr_t(kaitai::kstream *p_io, fallout2_dat_t::file_t* p_parent, fallout2_dat_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void fallout2_dat_t::pstr_t::_read() {
    m_size = m__io->read_u4le();
    m_str = kaitai::kstream::bytes_to_str(m__io->read_bytes(size()), std::string("ASCII"));
}

fallout2_dat_t::pstr_t::~pstr_t() {
}

fallout2_dat_t::footer_t::footer_t(kaitai::kstream *p_io, fallout2_dat_t* p_parent, fallout2_dat_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void fallout2_dat_t::footer_t::_read() {
    m_index_size = m__io->read_u4le();
    m_file_size = m__io->read_u4le();
}

fallout2_dat_t::footer_t::~footer_t() {
}

fallout2_dat_t::index_t::index_t(kaitai::kstream *p_io, fallout2_dat_t* p_parent, fallout2_dat_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void fallout2_dat_t::index_t::_read() {
    m_file_count = m__io->read_u4le();
    int l_files = file_count();
    m_files = new std::vector<file_t*>();
    m_files->reserve(l_files);
    for (int i = 0; i < l_files; i++) {
        m_files->push_back(new file_t(m__io, this, m__root));
    }
}

fallout2_dat_t::index_t::~index_t() {
    for (std::vector<file_t*>::iterator it = m_files->begin(); it != m_files->end(); ++it) {
        delete *it;
    }
    delete m_files;
}

fallout2_dat_t::file_t::file_t(kaitai::kstream *p_io, fallout2_dat_t::index_t* p_parent, fallout2_dat_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_contents = false;
    _read();
}

void fallout2_dat_t::file_t::_read() {
    m_name = new pstr_t(m__io, this, m__root);
    m_flags = static_cast<fallout2_dat_t::compression_t>(m__io->read_u1());
    m_size_unpacked = m__io->read_u4le();
    m_size_packed = m__io->read_u4le();
    m_offset = m__io->read_u4le();
}

fallout2_dat_t::file_t::~file_t() {
    delete m_name;
}

std::string fallout2_dat_t::file_t::contents() {
    if (f_contents)
        return m_contents;
    n_contents = true;
    if (flags() == COMPRESSION_ZLIB) {
        n_contents = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(offset());
        m__raw_contents = io->read_bytes(size_packed());
        m_contents = kaitai::kstream::process_zlib(m__raw_contents);
        io->seek(_pos);
    }
    f_contents = true;
    return m_contents;
}

fallout2_dat_t::footer_t* fallout2_dat_t::footer() {
    if (f_footer)
        return m_footer;
    std::streampos _pos = m__io->pos();
    m__io->seek((_io()->size() - 8));
    m_footer = new footer_t(m__io, this, m__root);
    m__io->seek(_pos);
    f_footer = true;
    return m_footer;
}

fallout2_dat_t::index_t* fallout2_dat_t::index() {
    if (f_index)
        return m_index;
    std::streampos _pos = m__io->pos();
    m__io->seek(((_io()->size() - 8) - footer()->index_size()));
    m_index = new index_t(m__io, this, m__root);
    m__io->seek(_pos);
    f_index = true;
    return m_index;
}

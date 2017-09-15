// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "dune_2_pak.h"



dune_2_pak_t::dune_2_pak_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, dune_2_pak_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    f_dir_size = false;
    _read();
}

void dune_2_pak_t::_read() {
    m__raw_dir = m__io->read_bytes(dir_size());
    m__io__raw_dir = new kaitai::kstream(m__raw_dir);
    m_dir = new files_t(m__io__raw_dir, this, m__root);
}

dune_2_pak_t::~dune_2_pak_t() {
    delete m__io__raw_dir;
    delete m_dir;
    if (f_dir_size) {
    }
}

dune_2_pak_t::files_t::files_t(kaitai::kstream* p__io, dune_2_pak_t* p__parent, dune_2_pak_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void dune_2_pak_t::files_t::_read() {
    m_files = new std::vector<file_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_files->push_back(new file_t(i, m__io, this, m__root));
            i++;
        }
    }
}

dune_2_pak_t::files_t::~files_t() {
    for (std::vector<file_t*>::iterator it = m_files->begin(); it != m_files->end(); ++it) {
        delete *it;
    }
    delete m_files;
}

dune_2_pak_t::file_t::file_t(uint32_t p_idx, kaitai::kstream* p__io, dune_2_pak_t::files_t* p__parent, dune_2_pak_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_idx = p_idx;
    f_next_ofs0 = false;
    f_next_ofs = false;
    f_body = false;
    _read();
}

void dune_2_pak_t::file_t::_read() {
    m_ofs = m__io->read_u4le();
    n_file_name = true;
    if (ofs() != 0) {
        n_file_name = false;
        m_file_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ASCII"));
    }
}

dune_2_pak_t::file_t::~file_t() {
    if (!n_file_name) {
    }
    if (f_body && !n_body) {
    }
}

uint32_t dune_2_pak_t::file_t::next_ofs0() {
    if (f_next_ofs0)
        return m_next_ofs0;
    n_next_ofs0 = true;
    if (ofs() != 0) {
        n_next_ofs0 = false;
        m_next_ofs0 = _root()->dir()->files()->at((idx() + 1))->ofs();
    }
    f_next_ofs0 = true;
    return m_next_ofs0;
}

int32_t dune_2_pak_t::file_t::next_ofs() {
    if (f_next_ofs)
        return m_next_ofs;
    n_next_ofs = true;
    if (ofs() != 0) {
        n_next_ofs = false;
        m_next_ofs = ((next_ofs0() == 0) ? (_root()->_io()->size()) : (next_ofs0()));
    }
    f_next_ofs = true;
    return m_next_ofs;
}

std::string dune_2_pak_t::file_t::body() {
    if (f_body)
        return m_body;
    n_body = true;
    if (ofs() != 0) {
        n_body = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(ofs());
        m_body = io->read_bytes((next_ofs() - ofs()));
        io->seek(_pos);
    }
    f_body = true;
    return m_body;
}

uint32_t dune_2_pak_t::dir_size() {
    if (f_dir_size)
        return m_dir_size;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_dir_size = m__io->read_u4le();
    m__io->seek(_pos);
    f_dir_size = true;
    return m_dir_size;
}

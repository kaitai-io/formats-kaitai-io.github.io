// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "dune_2_pak.h"

dune_2_pak_t::dune_2_pak_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, dune_2_pak_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_dir = nullptr;
    m__io__raw_dir = nullptr;
    f_dir_size = false;
    _read();
}

void dune_2_pak_t::_read() {
    m__raw_dir = m__io->read_bytes(dir_size());
    m__io__raw_dir = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_dir));
    m_dir = std::unique_ptr<files_t>(new files_t(m__io__raw_dir.get(), this, m__root));
}

dune_2_pak_t::~dune_2_pak_t() {
    _clean_up();
}

void dune_2_pak_t::_clean_up() {
    if (f_dir_size) {
    }
}

dune_2_pak_t::file_t::file_t(uint32_t p_idx, kaitai::kstream* p__io, dune_2_pak_t::files_t* p__parent, dune_2_pak_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_idx = p_idx;
    f_body = false;
    f_next_ofs = false;
    f_next_ofs0 = false;
    _read();
}

void dune_2_pak_t::file_t::_read() {
    m_ofs = m__io->read_u4le();
    n_file_name = true;
    if (ofs() != 0) {
        n_file_name = false;
        m_file_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "ASCII");
    }
}

dune_2_pak_t::file_t::~file_t() {
    _clean_up();
}

void dune_2_pak_t::file_t::_clean_up() {
    if (!n_file_name) {
    }
    if (f_body && !n_body) {
    }
}

std::string dune_2_pak_t::file_t::body() {
    if (f_body)
        return m_body;
    f_body = true;
    n_body = true;
    if (ofs() != 0) {
        n_body = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(ofs());
        m_body = io->read_bytes(next_ofs() - ofs());
        io->seek(_pos);
    }
    return m_body;
}

int32_t dune_2_pak_t::file_t::next_ofs() {
    if (f_next_ofs)
        return m_next_ofs;
    f_next_ofs = true;
    n_next_ofs = true;
    if (ofs() != 0) {
        n_next_ofs = false;
        m_next_ofs = ((next_ofs0() == 0) ? (_root()->_io()->size()) : (next_ofs0()));
    }
    return m_next_ofs;
}

uint32_t dune_2_pak_t::file_t::next_ofs0() {
    if (f_next_ofs0)
        return m_next_ofs0;
    f_next_ofs0 = true;
    n_next_ofs0 = true;
    if (ofs() != 0) {
        n_next_ofs0 = false;
        m_next_ofs0 = _root()->dir()->files()->at(idx() + 1)->ofs();
    }
    return m_next_ofs0;
}

dune_2_pak_t::files_t::files_t(kaitai::kstream* p__io, dune_2_pak_t* p__parent, dune_2_pak_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_files = nullptr;
    _read();
}

void dune_2_pak_t::files_t::_read() {
    m_files = std::unique_ptr<std::vector<std::unique_ptr<file_t>>>(new std::vector<std::unique_ptr<file_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_files->push_back(std::move(std::unique_ptr<file_t>(new file_t(i, m__io, this, m__root))));
            i++;
        }
    }
}

dune_2_pak_t::files_t::~files_t() {
    _clean_up();
}

void dune_2_pak_t::files_t::_clean_up() {
}

uint32_t dune_2_pak_t::dir_size() {
    if (f_dir_size)
        return m_dir_size;
    f_dir_size = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_dir_size = m__io->read_u4le();
    m__io->seek(_pos);
    return m_dir_size;
}

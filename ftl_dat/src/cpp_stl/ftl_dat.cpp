// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "ftl_dat.h"



ftl_dat_t::ftl_dat_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, ftl_dat_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void ftl_dat_t::_read() {
    m_num_files = m__io->read_u4le();
    int l_files = num_files();
    m_files = new std::vector<file_t*>();
    m_files->reserve(l_files);
    for (int i = 0; i < l_files; i++) {
        m_files->push_back(new file_t(m__io, this, m__root));
    }
}

ftl_dat_t::~ftl_dat_t() {
    for (std::vector<file_t*>::iterator it = m_files->begin(); it != m_files->end(); ++it) {
        delete *it;
    }
    delete m_files;
}

ftl_dat_t::file_t::file_t(kaitai::kstream *p_io, ftl_dat_t* p_parent, ftl_dat_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_meta = false;
    _read();
}

void ftl_dat_t::file_t::_read() {
    m_meta_ofs = m__io->read_u4le();
}

ftl_dat_t::file_t::~file_t() {
    if (f_meta && !n_meta) {
        delete m_meta;
    }
}

ftl_dat_t::meta_t* ftl_dat_t::file_t::meta() {
    if (f_meta)
        return m_meta;
    n_meta = true;
    if (meta_ofs() != 0) {
        n_meta = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(meta_ofs());
        m_meta = new meta_t(m__io, this, m__root);
        m__io->seek(_pos);
    }
    f_meta = true;
    return m_meta;
}

ftl_dat_t::meta_t::meta_t(kaitai::kstream *p_io, ftl_dat_t::file_t* p_parent, ftl_dat_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ftl_dat_t::meta_t::_read() {
    m_file_size = m__io->read_u4le();
    m_filename_size = m__io->read_u4le();
    m_filename = kaitai::kstream::bytes_to_str(m__io->read_bytes(filename_size()), std::string("UTF-8"));
    m_body = m__io->read_bytes(file_size());
}

ftl_dat_t::meta_t::~meta_t() {
}

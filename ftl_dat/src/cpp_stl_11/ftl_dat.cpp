// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "ftl_dat.h"

ftl_dat_t::ftl_dat_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ftl_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_files = nullptr;
    _read();
}

void ftl_dat_t::_read() {
    m_num_files = m__io->read_u4le();
    m_files = std::unique_ptr<std::vector<std::unique_ptr<file_t>>>(new std::vector<std::unique_ptr<file_t>>());
    const int l_files = num_files();
    for (int i = 0; i < l_files; i++) {
        m_files->push_back(std::move(std::unique_ptr<file_t>(new file_t(m__io, this, m__root))));
    }
}

ftl_dat_t::~ftl_dat_t() {
    _clean_up();
}

void ftl_dat_t::_clean_up() {
}

ftl_dat_t::file_t::file_t(kaitai::kstream* p__io, ftl_dat_t* p__parent, ftl_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_meta = nullptr;
    f_meta = false;
    _read();
}

void ftl_dat_t::file_t::_read() {
    m_ofs_meta = m__io->read_u4le();
}

ftl_dat_t::file_t::~file_t() {
    _clean_up();
}

void ftl_dat_t::file_t::_clean_up() {
    if (f_meta && !n_meta) {
    }
}

ftl_dat_t::meta_t* ftl_dat_t::file_t::meta() {
    if (f_meta)
        return m_meta.get();
    n_meta = true;
    if (ofs_meta() != 0) {
        n_meta = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(ofs_meta());
        m_meta = std::unique_ptr<meta_t>(new meta_t(m__io, this, m__root));
        m__io->seek(_pos);
        f_meta = true;
    }
    return m_meta.get();
}

ftl_dat_t::meta_t::meta_t(kaitai::kstream* p__io, ftl_dat_t::file_t* p__parent, ftl_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void ftl_dat_t::meta_t::_read() {
    m_len_file = m__io->read_u4le();
    m_len_filename = m__io->read_u4le();
    m_filename = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_filename()), std::string("UTF-8"));
    m_body = m__io->read_bytes(len_file());
}

ftl_dat_t::meta_t::~meta_t() {
    _clean_up();
}

void ftl_dat_t::meta_t::_clean_up() {
}

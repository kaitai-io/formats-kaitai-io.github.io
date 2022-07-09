// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "fallout_dat.h"

fallout_dat_t::fallout_dat_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, fallout_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_folder_names = 0;
    m_folders = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void fallout_dat_t::_read() {
    m_folder_count = m__io->read_u4be();
    m_unknown1 = m__io->read_u4be();
    m_unknown2 = m__io->read_u4be();
    m_timestamp = m__io->read_u4be();
    m_folder_names = new std::vector<pstr_t*>();
    const int l_folder_names = folder_count();
    for (int i = 0; i < l_folder_names; i++) {
        m_folder_names->push_back(new pstr_t(m__io, this, m__root));
    }
    m_folders = new std::vector<folder_t*>();
    const int l_folders = folder_count();
    for (int i = 0; i < l_folders; i++) {
        m_folders->push_back(new folder_t(m__io, this, m__root));
    }
}

fallout_dat_t::~fallout_dat_t() {
    _clean_up();
}

void fallout_dat_t::_clean_up() {
    if (m_folder_names) {
        for (std::vector<pstr_t*>::iterator it = m_folder_names->begin(); it != m_folder_names->end(); ++it) {
            delete *it;
        }
        delete m_folder_names; m_folder_names = 0;
    }
    if (m_folders) {
        for (std::vector<folder_t*>::iterator it = m_folders->begin(); it != m_folders->end(); ++it) {
            delete *it;
        }
        delete m_folders; m_folders = 0;
    }
}

fallout_dat_t::pstr_t::pstr_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, fallout_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void fallout_dat_t::pstr_t::_read() {
    m_size = m__io->read_u1();
    m_str = kaitai::kstream::bytes_to_str(m__io->read_bytes(size()), std::string("ASCII"));
}

fallout_dat_t::pstr_t::~pstr_t() {
    _clean_up();
}

void fallout_dat_t::pstr_t::_clean_up() {
}

fallout_dat_t::folder_t::folder_t(kaitai::kstream* p__io, fallout_dat_t* p__parent, fallout_dat_t* p__root) : kaitai::kstruct(p__io) {
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

void fallout_dat_t::folder_t::_read() {
    m_file_count = m__io->read_u4be();
    m_unknown = m__io->read_u4be();
    m_flags = m__io->read_u4be();
    m_timestamp = m__io->read_u4be();
    m_files = new std::vector<file_t*>();
    const int l_files = file_count();
    for (int i = 0; i < l_files; i++) {
        m_files->push_back(new file_t(m__io, this, m__root));
    }
}

fallout_dat_t::folder_t::~folder_t() {
    _clean_up();
}

void fallout_dat_t::folder_t::_clean_up() {
    if (m_files) {
        for (std::vector<file_t*>::iterator it = m_files->begin(); it != m_files->end(); ++it) {
            delete *it;
        }
        delete m_files; m_files = 0;
    }
}

fallout_dat_t::file_t::file_t(kaitai::kstream* p__io, fallout_dat_t::folder_t* p__parent, fallout_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name = 0;
    f_contents = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void fallout_dat_t::file_t::_read() {
    m_name = new pstr_t(m__io, this, m__root);
    m_flags = static_cast<fallout_dat_t::compression_t>(m__io->read_u4be());
    m_offset = m__io->read_u4be();
    m_size_unpacked = m__io->read_u4be();
    m_size_packed = m__io->read_u4be();
}

fallout_dat_t::file_t::~file_t() {
    _clean_up();
}

void fallout_dat_t::file_t::_clean_up() {
    if (m_name) {
        delete m_name; m_name = 0;
    }
    if (f_contents) {
    }
}

std::string fallout_dat_t::file_t::contents() {
    if (f_contents)
        return m_contents;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(offset());
    m_contents = io->read_bytes(((flags() == fallout_dat_t::COMPRESSION_NONE) ? (size_unpacked()) : (size_packed())));
    io->seek(_pos);
    f_contents = true;
    return m_contents;
}

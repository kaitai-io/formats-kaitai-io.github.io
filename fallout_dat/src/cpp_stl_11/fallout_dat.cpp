// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "fallout_dat.h"
const std::set<fallout_dat_t::compression_t> fallout_dat_t::_values_compression_t{
    fallout_dat_t::COMPRESSION_NONE,
    fallout_dat_t::COMPRESSION_LZSS,
};
bool fallout_dat_t::_is_defined_compression_t(fallout_dat_t::compression_t v) {
    return fallout_dat_t::_values_compression_t.find(v) != fallout_dat_t::_values_compression_t.end();
}

fallout_dat_t::fallout_dat_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, fallout_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_folder_names = nullptr;
    m_folders = nullptr;
    _read();
}

void fallout_dat_t::_read() {
    m_folder_count = m__io->read_u4be();
    m_unknown1 = m__io->read_u4be();
    m_unknown2 = m__io->read_u4be();
    m_timestamp = m__io->read_u4be();
    m_folder_names = std::unique_ptr<std::vector<std::unique_ptr<pstr_t>>>(new std::vector<std::unique_ptr<pstr_t>>());
    const int l_folder_names = folder_count();
    for (int i = 0; i < l_folder_names; i++) {
        m_folder_names->push_back(std::move(std::unique_ptr<pstr_t>(new pstr_t(m__io, this, m__root))));
    }
    m_folders = std::unique_ptr<std::vector<std::unique_ptr<folder_t>>>(new std::vector<std::unique_ptr<folder_t>>());
    const int l_folders = folder_count();
    for (int i = 0; i < l_folders; i++) {
        m_folders->push_back(std::move(std::unique_ptr<folder_t>(new folder_t(m__io, this, m__root))));
    }
}

fallout_dat_t::~fallout_dat_t() {
    _clean_up();
}

void fallout_dat_t::_clean_up() {
}

fallout_dat_t::file_t::file_t(kaitai::kstream* p__io, fallout_dat_t::folder_t* p__parent, fallout_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name = nullptr;
    f_contents = false;
    _read();
}

void fallout_dat_t::file_t::_read() {
    m_name = std::unique_ptr<pstr_t>(new pstr_t(m__io, this, m__root));
    m_flags = static_cast<fallout_dat_t::compression_t>(m__io->read_u4be());
    m_offset = m__io->read_u4be();
    m_size_unpacked = m__io->read_u4be();
    m_size_packed = m__io->read_u4be();
}

fallout_dat_t::file_t::~file_t() {
    _clean_up();
}

void fallout_dat_t::file_t::_clean_up() {
    if (f_contents) {
    }
}

std::string fallout_dat_t::file_t::contents() {
    if (f_contents)
        return m_contents;
    f_contents = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(offset());
    m_contents = io->read_bytes(((flags() == fallout_dat_t::COMPRESSION_NONE) ? (size_unpacked()) : (size_packed())));
    io->seek(_pos);
    return m_contents;
}

fallout_dat_t::folder_t::folder_t(kaitai::kstream* p__io, fallout_dat_t* p__parent, fallout_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_files = nullptr;
    _read();
}

void fallout_dat_t::folder_t::_read() {
    m_file_count = m__io->read_u4be();
    m_unknown = m__io->read_u4be();
    m_flags = m__io->read_u4be();
    m_timestamp = m__io->read_u4be();
    m_files = std::unique_ptr<std::vector<std::unique_ptr<file_t>>>(new std::vector<std::unique_ptr<file_t>>());
    const int l_files = file_count();
    for (int i = 0; i < l_files; i++) {
        m_files->push_back(std::move(std::unique_ptr<file_t>(new file_t(m__io, this, m__root))));
    }
}

fallout_dat_t::folder_t::~folder_t() {
    _clean_up();
}

void fallout_dat_t::folder_t::_clean_up() {
}

fallout_dat_t::pstr_t::pstr_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, fallout_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void fallout_dat_t::pstr_t::_read() {
    m_size = m__io->read_u1();
    m_str = kaitai::kstream::bytes_to_str(m__io->read_bytes(size()), "ASCII");
}

fallout_dat_t::pstr_t::~pstr_t() {
    _clean_up();
}

void fallout_dat_t::pstr_t::_clean_up() {
}

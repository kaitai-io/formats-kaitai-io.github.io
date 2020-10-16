// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "quake_pak.h"
#include "kaitai/exceptions.h"

quake_pak_t::quake_pak_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, quake_pak_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_index = nullptr;
    m__io__raw_index = nullptr;
    f_index = false;
    _read();
}

void quake_pak_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\x50\x41\x43\x4B", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x50\x41\x43\x4B", 4), magic(), _io(), std::string("/seq/0"));
    }
    m_ofs_index = m__io->read_u4le();
    m_len_index = m__io->read_u4le();
}

quake_pak_t::~quake_pak_t() {
    _clean_up();
}

void quake_pak_t::_clean_up() {
    if (f_index) {
    }
}

quake_pak_t::index_struct_t::index_struct_t(kaitai::kstream* p__io, quake_pak_t* p__parent, quake_pak_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    _read();
}

void quake_pak_t::index_struct_t::_read() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<index_entry_t>>>(new std::vector<std::unique_ptr<index_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<index_entry_t>(new index_entry_t(m__io, this, m__root))));
            i++;
        }
    }
}

quake_pak_t::index_struct_t::~index_struct_t() {
    _clean_up();
}

void quake_pak_t::index_struct_t::_clean_up() {
}

quake_pak_t::index_entry_t::index_entry_t(kaitai::kstream* p__io, quake_pak_t::index_struct_t* p__parent, quake_pak_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_body = false;
    _read();
}

void quake_pak_t::index_entry_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(kaitai::kstream::bytes_strip_right(m__io->read_bytes(56), 0), 0, false), std::string("UTF-8"));
    m_ofs = m__io->read_u4le();
    m_size = m__io->read_u4le();
}

quake_pak_t::index_entry_t::~index_entry_t() {
    _clean_up();
}

void quake_pak_t::index_entry_t::_clean_up() {
    if (f_body) {
    }
}

std::string quake_pak_t::index_entry_t::body() {
    if (f_body)
        return m_body;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs());
    m_body = io->read_bytes(size());
    io->seek(_pos);
    f_body = true;
    return m_body;
}

quake_pak_t::index_struct_t* quake_pak_t::index() {
    if (f_index)
        return m_index.get();
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_index());
    m__raw_index = m__io->read_bytes(len_index());
    m__io__raw_index = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_index));
    m_index = std::unique_ptr<index_struct_t>(new index_struct_t(m__io__raw_index.get(), this, m__root));
    m__io->seek(_pos);
    f_index = true;
    return m_index.get();
}

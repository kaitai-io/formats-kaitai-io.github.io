// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "nt_mdt_pal.h"
#include "kaitai/exceptions.h"

nt_mdt_pal_t::nt_mdt_pal_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nt_mdt_pal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_meta = nullptr;
    m_tables = nullptr;
    _read();
}

void nt_mdt_pal_t::_read() {
    m_signature = m__io->read_bytes(26);
    if (!(signature() == std::string("\x4E\x54\x2D\x4D\x44\x54\x20\x50\x61\x6C\x65\x74\x74\x65\x20\x46\x69\x6C\x65\x20\x20\x31\x2E\x30\x30\x21", 26))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4E\x54\x2D\x4D\x44\x54\x20\x50\x61\x6C\x65\x74\x74\x65\x20\x46\x69\x6C\x65\x20\x20\x31\x2E\x30\x30\x21", 26), signature(), _io(), std::string("/seq/0"));
    }
    m_count = m__io->read_u4be();
    m_meta = std::unique_ptr<std::vector<std::unique_ptr<meta_t>>>(new std::vector<std::unique_ptr<meta_t>>());
    const int l_meta = count();
    for (int i = 0; i < l_meta; i++) {
        m_meta->push_back(std::move(std::unique_ptr<meta_t>(new meta_t(m__io, this, m__root))));
    }
    m_something2 = m__io->read_bytes(1);
    m_tables = std::unique_ptr<std::vector<std::unique_ptr<col_table_t>>>(new std::vector<std::unique_ptr<col_table_t>>());
    const int l_tables = count();
    for (int i = 0; i < l_tables; i++) {
        m_tables->push_back(std::move(std::unique_ptr<col_table_t>(new col_table_t(i, m__io, this, m__root))));
    }
}

nt_mdt_pal_t::~nt_mdt_pal_t() {
    _clean_up();
}

void nt_mdt_pal_t::_clean_up() {
}

nt_mdt_pal_t::meta_t::meta_t(kaitai::kstream* p__io, nt_mdt_pal_t* p__parent, nt_mdt_pal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_pal_t::meta_t::_read() {
    m_unkn00 = m__io->read_bytes(3);
    m_unkn01 = m__io->read_bytes(2);
    m_unkn02 = m__io->read_bytes(1);
    m_unkn03 = m__io->read_bytes(1);
    m_colors_count = m__io->read_u2le();
    m_unkn10 = m__io->read_bytes(2);
    m_unkn11 = m__io->read_bytes(1);
    m_unkn12 = m__io->read_bytes(2);
    m_name_size = m__io->read_u2be();
}

nt_mdt_pal_t::meta_t::~meta_t() {
    _clean_up();
}

void nt_mdt_pal_t::meta_t::_clean_up() {
}

nt_mdt_pal_t::color_t::color_t(kaitai::kstream* p__io, nt_mdt_pal_t::col_table_t* p__parent, nt_mdt_pal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_pal_t::color_t::_read() {
    m_red = m__io->read_u1();
    m_unkn = m__io->read_u1();
    m_blue = m__io->read_u1();
    m_green = m__io->read_u1();
}

nt_mdt_pal_t::color_t::~color_t() {
    _clean_up();
}

void nt_mdt_pal_t::color_t::_clean_up() {
}

nt_mdt_pal_t::col_table_t::col_table_t(uint16_t p_index, kaitai::kstream* p__io, nt_mdt_pal_t* p__parent, nt_mdt_pal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_index = p_index;
    m_colors = nullptr;
    _read();
}

void nt_mdt_pal_t::col_table_t::_read() {
    m_size1 = m__io->read_u1();
    m_unkn = m__io->read_u1();
    m_title = kaitai::kstream::bytes_to_str(m__io->read_bytes(_root()->meta()->at(index())->name_size()), std::string("UTF-16LE"));
    m_unkn1 = m__io->read_u2be();
    m_colors = std::unique_ptr<std::vector<std::unique_ptr<color_t>>>(new std::vector<std::unique_ptr<color_t>>());
    const int l_colors = (_root()->meta()->at(index())->colors_count() - 1);
    for (int i = 0; i < l_colors; i++) {
        m_colors->push_back(std::move(std::unique_ptr<color_t>(new color_t(m__io, this, m__root))));
    }
}

nt_mdt_pal_t::col_table_t::~col_table_t() {
    _clean_up();
}

void nt_mdt_pal_t::col_table_t::_clean_up() {
}

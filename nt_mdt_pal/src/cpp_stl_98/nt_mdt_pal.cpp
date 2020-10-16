// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "nt_mdt_pal.h"
#include "kaitai/exceptions.h"

nt_mdt_pal_t::nt_mdt_pal_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nt_mdt_pal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_meta = 0;
    m_tables = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void nt_mdt_pal_t::_read() {
    m_signature = m__io->read_bytes(26);
    if (!(signature() == std::string("\x4E\x54\x2D\x4D\x44\x54\x20\x50\x61\x6C\x65\x74\x74\x65\x20\x46\x69\x6C\x65\x20\x20\x31\x2E\x30\x30\x21", 26))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4E\x54\x2D\x4D\x44\x54\x20\x50\x61\x6C\x65\x74\x74\x65\x20\x46\x69\x6C\x65\x20\x20\x31\x2E\x30\x30\x21", 26), signature(), _io(), std::string("/seq/0"));
    }
    m_count = m__io->read_u4be();
    int l_meta = count();
    m_meta = new std::vector<meta_t*>();
    m_meta->reserve(l_meta);
    for (int i = 0; i < l_meta; i++) {
        m_meta->push_back(new meta_t(m__io, this, m__root));
    }
    m_something2 = m__io->read_bytes(1);
    int l_tables = count();
    m_tables = new std::vector<col_table_t*>();
    m_tables->reserve(l_tables);
    for (int i = 0; i < l_tables; i++) {
        m_tables->push_back(new col_table_t(i, m__io, this, m__root));
    }
}

nt_mdt_pal_t::~nt_mdt_pal_t() {
    _clean_up();
}

void nt_mdt_pal_t::_clean_up() {
    if (m_meta) {
        for (std::vector<meta_t*>::iterator it = m_meta->begin(); it != m_meta->end(); ++it) {
            delete *it;
        }
        delete m_meta; m_meta = 0;
    }
    if (m_tables) {
        for (std::vector<col_table_t*>::iterator it = m_tables->begin(); it != m_tables->end(); ++it) {
            delete *it;
        }
        delete m_tables; m_tables = 0;
    }
}

nt_mdt_pal_t::meta_t::meta_t(kaitai::kstream* p__io, nt_mdt_pal_t* p__parent, nt_mdt_pal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_colors = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void nt_mdt_pal_t::col_table_t::_read() {
    m_size1 = m__io->read_u1();
    m_unkn = m__io->read_u1();
    m_title = kaitai::kstream::bytes_to_str(m__io->read_bytes(_root()->meta()->at(index())->name_size()), std::string("UTF-16"));
    m_unkn1 = m__io->read_u2be();
    int l_colors = (_root()->meta()->at(index())->colors_count() - 1);
    m_colors = new std::vector<color_t*>();
    m_colors->reserve(l_colors);
    for (int i = 0; i < l_colors; i++) {
        m_colors->push_back(new color_t(m__io, this, m__root));
    }
}

nt_mdt_pal_t::col_table_t::~col_table_t() {
    _clean_up();
}

void nt_mdt_pal_t::col_table_t::_clean_up() {
    if (m_colors) {
        for (std::vector<color_t*>::iterator it = m_colors->begin(); it != m_colors->end(); ++it) {
            delete *it;
        }
        delete m_colors; m_colors = 0;
    }
}

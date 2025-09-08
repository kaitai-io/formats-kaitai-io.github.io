// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "monomakh_sapr_chg.h"

monomakh_sapr_chg_t::monomakh_sapr_chg_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, monomakh_sapr_chg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_ent = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void monomakh_sapr_chg_t::_read() {
    m_title = kaitai::kstream::bytes_to_str(m__io->read_bytes(10), "ASCII");
    m_ent = new std::vector<block_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_ent->push_back(new block_t(m__io, this, m__root));
            i++;
        }
    }
}

monomakh_sapr_chg_t::~monomakh_sapr_chg_t() {
    _clean_up();
}

void monomakh_sapr_chg_t::_clean_up() {
    if (m_ent) {
        for (std::vector<block_t*>::iterator it = m_ent->begin(); it != m_ent->end(); ++it) {
            delete *it;
        }
        delete m_ent; m_ent = 0;
    }
}

monomakh_sapr_chg_t::block_t::block_t(kaitai::kstream* p__io, monomakh_sapr_chg_t* p__parent, monomakh_sapr_chg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void monomakh_sapr_chg_t::block_t::_read() {
    m_header = kaitai::kstream::bytes_to_str(m__io->read_bytes(13), "ASCII");
    m_file_size = m__io->read_u8le();
    m_file = m__io->read_bytes(file_size());
}

monomakh_sapr_chg_t::block_t::~block_t() {
    _clean_up();
}

void monomakh_sapr_chg_t::block_t::_clean_up() {
}

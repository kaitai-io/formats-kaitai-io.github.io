// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "monomakh_sapr_chg.h"

monomakh_sapr_chg_t::monomakh_sapr_chg_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, monomakh_sapr_chg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_ent = nullptr;
    _read();
}

void monomakh_sapr_chg_t::_read() {
    m_title = kaitai::kstream::bytes_to_str(m__io->read_bytes(10), std::string("ascii"));
    m_ent = std::unique_ptr<std::vector<std::unique_ptr<block_t>>>(new std::vector<std::unique_ptr<block_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_ent->push_back(std::move(std::unique_ptr<block_t>(new block_t(m__io, this, m__root))));
            i++;
        }
    }
}

monomakh_sapr_chg_t::~monomakh_sapr_chg_t() {
    _clean_up();
}

void monomakh_sapr_chg_t::_clean_up() {
}

monomakh_sapr_chg_t::block_t::block_t(kaitai::kstream* p__io, monomakh_sapr_chg_t* p__parent, monomakh_sapr_chg_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void monomakh_sapr_chg_t::block_t::_read() {
    m_header = kaitai::kstream::bytes_to_str(m__io->read_bytes(13), std::string("ascii"));
    m_file_size = m__io->read_u8le();
    m_file = m__io->read_bytes(file_size());
}

monomakh_sapr_chg_t::block_t::~block_t() {
    _clean_up();
}

void monomakh_sapr_chg_t::block_t::_clean_up() {
}

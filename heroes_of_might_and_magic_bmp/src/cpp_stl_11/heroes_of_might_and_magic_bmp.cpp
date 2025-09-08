// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "heroes_of_might_and_magic_bmp.h"

heroes_of_might_and_magic_bmp_t::heroes_of_might_and_magic_bmp_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, heroes_of_might_and_magic_bmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    _read();
}

void heroes_of_might_and_magic_bmp_t::_read() {
    m_magic = m__io->read_u2le();
    m_width = m__io->read_u2le();
    m_height = m__io->read_u2le();
    m_data = m__io->read_bytes(width() * height());
}

heroes_of_might_and_magic_bmp_t::~heroes_of_might_and_magic_bmp_t() {
    _clean_up();
}

void heroes_of_might_and_magic_bmp_t::_clean_up() {
}

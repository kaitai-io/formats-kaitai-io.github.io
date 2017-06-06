// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "exif.h"


#include "exif_le.h"
#include "exif_be.h"

exif_t::exif_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, exif_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void exif_t::_read() {
    m_endianness = m__io->read_u2le();
    switch (endianness()) {
    case 18761:
        m_body = new exif_le_t(m__io);
        break;
    case 19789:
        m_body = new exif_be_t(m__io);
        break;
    }
}

exif_t::~exif_t() {
}

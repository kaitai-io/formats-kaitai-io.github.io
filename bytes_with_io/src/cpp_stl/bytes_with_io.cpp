// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "bytes_with_io.h"



bytes_with_io_t::bytes_with_io_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, bytes_with_io_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void bytes_with_io_t::_read() {
    m_data = m__io->read_bytes_full();
}

bytes_with_io_t::~bytes_with_io_t() {
}

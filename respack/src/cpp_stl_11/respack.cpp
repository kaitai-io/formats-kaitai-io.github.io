// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "respack.h"
#include "kaitai/exceptions.h"

respack_t::respack_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, respack_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header = nullptr;
    _read();
}

void respack_t::_read() {
    m_header = std::unique_ptr<header_t>(new header_t(m__io, this, m__root));
    m_json = kaitai::kstream::bytes_to_str(m__io->read_bytes(header()->len_json()), "UTF-8");
}

respack_t::~respack_t() {
    _clean_up();
}

void respack_t::_clean_up() {
}

respack_t::header_t::header_t(kaitai::kstream* p__io, respack_t* p__parent, respack_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void respack_t::header_t::_read() {
    m_magic = m__io->read_bytes(2);
    if (!(m_magic == std::string("\x52\x53", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x52\x53", 2), m_magic, m__io, std::string("/types/header/seq/0"));
    }
    m_unknown = m__io->read_bytes(8);
    m_len_json = m__io->read_u4le();
    m_md5 = kaitai::kstream::bytes_to_str(m__io->read_bytes(32), "UTF-8");
}

respack_t::header_t::~header_t() {
    _clean_up();
}

void respack_t::header_t::_clean_up() {
}

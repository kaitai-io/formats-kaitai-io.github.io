// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "zx_spectrum_tap.h"



zx_spectrum_tap_t::zx_spectrum_tap_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, zx_spectrum_tap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void zx_spectrum_tap_t::_read() {
    m_block = new std::vector<block_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_block->push_back(new block_t(m__io, this, m__root));
            i++;
        }
    }
}

zx_spectrum_tap_t::~zx_spectrum_tap_t() {
    for (std::vector<block_t*>::iterator it = m_block->begin(); it != m_block->end(); ++it) {
        delete *it;
    }
    delete m_block;
}

zx_spectrum_tap_t::block_t::block_t(kaitai::kstream* p__io, zx_spectrum_tap_t* p__parent, zx_spectrum_tap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void zx_spectrum_tap_t::block_t::_read() {
    m_len_block = m__io->read_u2le();
    m_flag = static_cast<zx_spectrum_tap_t::flag_enum_t>(m__io->read_u1());
    n_header = true;
    if ( ((len_block() == 19) && (flag() == FLAG_ENUM_HEADER)) ) {
        n_header = false;
        m_header = new header_t(m__io, this, m__root);
    }
    n_data = true;
    if (len_block() == 19) {
        n_data = false;
        m_data = m__io->read_bytes((header()->len_data() + 4));
    }
    n_headerless_data = true;
    if (flag() == FLAG_ENUM_DATA) {
        n_headerless_data = false;
        m_headerless_data = m__io->read_bytes((len_block() - 1));
    }
}

zx_spectrum_tap_t::block_t::~block_t() {
    if (!n_header) {
        delete m_header;
    }
    if (!n_data) {
    }
    if (!n_headerless_data) {
    }
}

zx_spectrum_tap_t::program_params_t::program_params_t(kaitai::kstream* p__io, zx_spectrum_tap_t::header_t* p__parent, zx_spectrum_tap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void zx_spectrum_tap_t::program_params_t::_read() {
    m_autostart_line = m__io->read_u2le();
    m_len_program = m__io->read_u2le();
}

zx_spectrum_tap_t::program_params_t::~program_params_t() {
}

zx_spectrum_tap_t::bytes_params_t::bytes_params_t(kaitai::kstream* p__io, zx_spectrum_tap_t::header_t* p__parent, zx_spectrum_tap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void zx_spectrum_tap_t::bytes_params_t::_read() {
    m_start_address = m__io->read_u2le();
    m_reserved = m__io->ensure_fixed_contents(std::string("\x00\x80", 2));
}

zx_spectrum_tap_t::bytes_params_t::~bytes_params_t() {
}

zx_spectrum_tap_t::header_t::header_t(kaitai::kstream* p__io, zx_spectrum_tap_t::block_t* p__parent, zx_spectrum_tap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void zx_spectrum_tap_t::header_t::_read() {
    m_header_type = static_cast<zx_spectrum_tap_t::header_type_enum_t>(m__io->read_u1());
    m_filename = kaitai::kstream::bytes_strip_right(m__io->read_bytes(10), 32);
    m_len_data = m__io->read_u2le();
    n_params = true;
    switch (header_type()) {
    case HEADER_TYPE_ENUM_PROGRAM: {
        n_params = false;
        m_params = new program_params_t(m__io, this, m__root);
        break;
    }
    case HEADER_TYPE_ENUM_NUM_ARRY: {
        n_params = false;
        m_params = new array_params_t(m__io, this, m__root);
        break;
    }
    case HEADER_TYPE_ENUM_CHAR_ARRY: {
        n_params = false;
        m_params = new array_params_t(m__io, this, m__root);
        break;
    }
    case HEADER_TYPE_ENUM_BYTES: {
        n_params = false;
        m_params = new bytes_params_t(m__io, this, m__root);
        break;
    }
    }
    m_checksum = m__io->read_u1();
}

zx_spectrum_tap_t::header_t::~header_t() {
    if (!n_params) {
        delete m_params;
    }
}

zx_spectrum_tap_t::array_params_t::array_params_t(kaitai::kstream* p__io, zx_spectrum_tap_t::header_t* p__parent, zx_spectrum_tap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void zx_spectrum_tap_t::array_params_t::_read() {
    m_reserved = m__io->read_u1();
    m_var_name = m__io->read_u1();
    m_reserved1 = m__io->ensure_fixed_contents(std::string("\x00\x80", 2));
}

zx_spectrum_tap_t::array_params_t::~array_params_t() {
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "some_ip_sd.h"

some_ip_sd_t::some_ip_sd_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, some_ip_sd_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_flags = 0;
    m_entries = 0;
    m__io__raw_entries = 0;
    m_options = 0;
    m__io__raw_options = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void some_ip_sd_t::_read() {
    m_flags = new sd_flags_t(m__io, this, m__root);
    m_reserved = m__io->read_bytes(3);
    m_len_entries = m__io->read_u4be();
    m__raw_entries = m__io->read_bytes(len_entries());
    m__io__raw_entries = new kaitai::kstream(m__raw_entries);
    m_entries = new some_ip_sd_entries_t(m__io__raw_entries);
    m_len_options = m__io->read_u4be();
    m__raw_options = m__io->read_bytes(len_options());
    m__io__raw_options = new kaitai::kstream(m__raw_options);
    m_options = new some_ip_sd_options_t(m__io__raw_options);
}

some_ip_sd_t::~some_ip_sd_t() {
    _clean_up();
}

void some_ip_sd_t::_clean_up() {
    if (m_flags) {
        delete m_flags; m_flags = 0;
    }
    if (m__io__raw_entries) {
        delete m__io__raw_entries; m__io__raw_entries = 0;
    }
    if (m_entries) {
        delete m_entries; m_entries = 0;
    }
    if (m__io__raw_options) {
        delete m__io__raw_options; m__io__raw_options = 0;
    }
    if (m_options) {
        delete m_options; m_options = 0;
    }
}

some_ip_sd_t::sd_flags_t::sd_flags_t(kaitai::kstream* p__io, some_ip_sd_t* p__parent, some_ip_sd_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void some_ip_sd_t::sd_flags_t::_read() {
    m_reboot = m__io->read_bits_int_be(1);
    m_unicast = m__io->read_bits_int_be(1);
    m_initial_data = m__io->read_bits_int_be(1);
    m_reserved = m__io->read_bits_int_be(5);
}

some_ip_sd_t::sd_flags_t::~sd_flags_t() {
    _clean_up();
}

void some_ip_sd_t::sd_flags_t::_clean_up() {
}

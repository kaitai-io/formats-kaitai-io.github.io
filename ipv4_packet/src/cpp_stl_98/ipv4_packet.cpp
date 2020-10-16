// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "ipv4_packet.h"

ipv4_packet_t::ipv4_packet_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ipv4_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_options = 0;
    m__io__raw_options = 0;
    m_body = 0;
    m__io__raw_body = 0;
    f_version = false;
    f_ihl = false;
    f_ihl_bytes = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ipv4_packet_t::_read() {
    m_b1 = m__io->read_u1();
    m_b2 = m__io->read_u1();
    m_total_length = m__io->read_u2be();
    m_identification = m__io->read_u2be();
    m_b67 = m__io->read_u2be();
    m_ttl = m__io->read_u1();
    m_protocol = m__io->read_u1();
    m_header_checksum = m__io->read_u2be();
    m_src_ip_addr = m__io->read_bytes(4);
    m_dst_ip_addr = m__io->read_bytes(4);
    m__raw_options = m__io->read_bytes((ihl_bytes() - 20));
    m__io__raw_options = new kaitai::kstream(m__raw_options);
    m_options = new ipv4_options_t(m__io__raw_options, this, m__root);
    m__raw_body = m__io->read_bytes((total_length() - ihl_bytes()));
    m__io__raw_body = new kaitai::kstream(m__raw_body);
    m_body = new protocol_body_t(protocol(), m__io__raw_body);
}

ipv4_packet_t::~ipv4_packet_t() {
    _clean_up();
}

void ipv4_packet_t::_clean_up() {
    if (m__io__raw_options) {
        delete m__io__raw_options; m__io__raw_options = 0;
    }
    if (m_options) {
        delete m_options; m_options = 0;
    }
    if (m__io__raw_body) {
        delete m__io__raw_body; m__io__raw_body = 0;
    }
    if (m_body) {
        delete m_body; m_body = 0;
    }
}

ipv4_packet_t::ipv4_options_t::ipv4_options_t(kaitai::kstream* p__io, ipv4_packet_t* p__parent, ipv4_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ipv4_packet_t::ipv4_options_t::_read() {
    m_entries = new std::vector<ipv4_option_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new ipv4_option_t(m__io, this, m__root));
            i++;
        }
    }
}

ipv4_packet_t::ipv4_options_t::~ipv4_options_t() {
    _clean_up();
}

void ipv4_packet_t::ipv4_options_t::_clean_up() {
    if (m_entries) {
        for (std::vector<ipv4_option_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

ipv4_packet_t::ipv4_option_t::ipv4_option_t(kaitai::kstream* p__io, ipv4_packet_t::ipv4_options_t* p__parent, ipv4_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_copy = false;
    f_opt_class = false;
    f_number = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ipv4_packet_t::ipv4_option_t::_read() {
    m_b1 = m__io->read_u1();
    m_len = m__io->read_u1();
    m_body = m__io->read_bytes(((len() > 2) ? ((len() - 2)) : (0)));
}

ipv4_packet_t::ipv4_option_t::~ipv4_option_t() {
    _clean_up();
}

void ipv4_packet_t::ipv4_option_t::_clean_up() {
}

int32_t ipv4_packet_t::ipv4_option_t::copy() {
    if (f_copy)
        return m_copy;
    m_copy = ((b1() & 128) >> 7);
    f_copy = true;
    return m_copy;
}

int32_t ipv4_packet_t::ipv4_option_t::opt_class() {
    if (f_opt_class)
        return m_opt_class;
    m_opt_class = ((b1() & 96) >> 5);
    f_opt_class = true;
    return m_opt_class;
}

int32_t ipv4_packet_t::ipv4_option_t::number() {
    if (f_number)
        return m_number;
    m_number = (b1() & 31);
    f_number = true;
    return m_number;
}

int32_t ipv4_packet_t::version() {
    if (f_version)
        return m_version;
    m_version = ((b1() & 240) >> 4);
    f_version = true;
    return m_version;
}

int32_t ipv4_packet_t::ihl() {
    if (f_ihl)
        return m_ihl;
    m_ihl = (b1() & 15);
    f_ihl = true;
    return m_ihl;
}

int32_t ipv4_packet_t::ihl_bytes() {
    if (f_ihl_bytes)
        return m_ihl_bytes;
    m_ihl_bytes = (ihl() * 4);
    f_ihl_bytes = true;
    return m_ihl_bytes;
}

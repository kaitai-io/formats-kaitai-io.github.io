// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "ipv4_packet.h"

ipv4_packet_t::ipv4_packet_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ipv4_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_options = nullptr;
    m__io__raw_options = nullptr;
    m_body = nullptr;
    m__io__raw_body = nullptr;
    f_version = false;
    f_ihl = false;
    f_ihl_bytes = false;
    _read();
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
    m__io__raw_options = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_options));
    m_options = std::unique_ptr<ipv4_options_t>(new ipv4_options_t(m__io__raw_options.get(), this, m__root));
    m__raw_body = m__io->read_bytes((total_length() - ihl_bytes()));
    m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
    m_body = std::unique_ptr<protocol_body_t>(new protocol_body_t(protocol(), m__io__raw_body.get()));
}

ipv4_packet_t::~ipv4_packet_t() {
    _clean_up();
}

void ipv4_packet_t::_clean_up() {
}

ipv4_packet_t::ipv4_options_t::ipv4_options_t(kaitai::kstream* p__io, ipv4_packet_t* p__parent, ipv4_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    _read();
}

void ipv4_packet_t::ipv4_options_t::_read() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<ipv4_option_t>>>(new std::vector<std::unique_ptr<ipv4_option_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<ipv4_option_t>(new ipv4_option_t(m__io, this, m__root))));
            i++;
        }
    }
}

ipv4_packet_t::ipv4_options_t::~ipv4_options_t() {
    _clean_up();
}

void ipv4_packet_t::ipv4_options_t::_clean_up() {
}

ipv4_packet_t::ipv4_option_t::ipv4_option_t(kaitai::kstream* p__io, ipv4_packet_t::ipv4_options_t* p__parent, ipv4_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_copy = false;
    f_opt_class = false;
    f_number = false;
    _read();
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

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "protocol_body.h"


#include "udp_datagram.h"
#include "tcp_segment.h"
#include "ipv4_packet.h"
#include "ipv6_packet.h"
#include "icmp_packet.h"

protocol_body_t::protocol_body_t(uint8_t p_protocol_num, kaitai::kstream* p__io, kaitai::kstruct* p__parent, protocol_body_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_protocol_num = p_protocol_num;
    f_protocol = false;
    _read();
}

void protocol_body_t::_read() {
    n_body = true;
    switch (protocol()) {
    case PROTOCOL_ENUM_TCP: {
        n_body = false;
        m_body = new tcp_segment_t(m__io);
        break;
    }
    case PROTOCOL_ENUM_IPV6_NONXT: {
        n_body = false;
        m_body = new no_next_header_t(m__io, this, m__root);
        break;
    }
    case PROTOCOL_ENUM_ICMP: {
        n_body = false;
        m_body = new icmp_packet_t(m__io);
        break;
    }
    case PROTOCOL_ENUM_UDP: {
        n_body = false;
        m_body = new udp_datagram_t(m__io);
        break;
    }
    case PROTOCOL_ENUM_HOPOPT: {
        n_body = false;
        m_body = new option_hop_by_hop_t(m__io, this, m__root);
        break;
    }
    case PROTOCOL_ENUM_IPV6: {
        n_body = false;
        m_body = new ipv6_packet_t(m__io);
        break;
    }
    case PROTOCOL_ENUM_IPV4: {
        n_body = false;
        m_body = new ipv4_packet_t(m__io);
        break;
    }
    }
}

protocol_body_t::~protocol_body_t() {
    if (!n_body) {
        delete m_body;
    }
}

protocol_body_t::no_next_header_t::no_next_header_t(kaitai::kstream* p__io, protocol_body_t* p__parent, protocol_body_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void protocol_body_t::no_next_header_t::_read() {
}

protocol_body_t::no_next_header_t::~no_next_header_t() {
}

protocol_body_t::option_hop_by_hop_t::option_hop_by_hop_t(kaitai::kstream* p__io, protocol_body_t* p__parent, protocol_body_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void protocol_body_t::option_hop_by_hop_t::_read() {
    m_next_header_type = m__io->read_u1();
    m_hdr_ext_len = m__io->read_u1();
    m_body = m__io->read_bytes((hdr_ext_len() - 1));
    m_next_header = new protocol_body_t(next_header_type(), m__io);
}

protocol_body_t::option_hop_by_hop_t::~option_hop_by_hop_t() {
    delete m_next_header;
}

protocol_body_t::protocol_enum_t protocol_body_t::protocol() {
    if (f_protocol)
        return m_protocol;
    m_protocol = static_cast<protocol_body_t::protocol_enum_t>(protocol_num());
    f_protocol = true;
    return m_protocol;
}

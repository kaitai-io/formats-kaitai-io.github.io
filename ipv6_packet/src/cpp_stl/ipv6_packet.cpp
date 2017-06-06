// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "ipv6_packet.h"


#include "tcp_segment.h"
#include "udp_datagram.h"
#include "ipv4_packet.h"

ipv6_packet_t::ipv6_packet_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, ipv6_packet_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void ipv6_packet_t::_read() {
    m_version = m__io->read_bits_int(4);
    m_traffic_class = m__io->read_bits_int(8);
    m_flow_label = m__io->read_bits_int(20);
    m__io->align_to_byte();
    m_payload_length = m__io->read_u2be();
    m_next_header_type = m__io->read_u1();
    m_hop_limit = m__io->read_u1();
    m_src_ipv6_addr = m__io->read_bytes(16);
    m_dst_ipv6_addr = m__io->read_bytes(16);
    switch (next_header_type()) {
    case 17:
        m_next_header = new udp_datagram_t(m__io);
        break;
    case 0:
        m_next_header = new option_hop_by_hop_t(m__io, this, m__root);
        break;
    case 4:
        m_next_header = new ipv4_packet_t(m__io);
        break;
    case 6:
        m_next_header = new tcp_segment_t(m__io);
        break;
    case 59:
        m_next_header = new no_next_header_t(m__io, this, m__root);
        break;
    }
    m_rest = m__io->read_bytes_full();
}

ipv6_packet_t::~ipv6_packet_t() {
}

ipv6_packet_t::no_next_header_t::no_next_header_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, ipv6_packet_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ipv6_packet_t::no_next_header_t::_read() {
}

ipv6_packet_t::no_next_header_t::~no_next_header_t() {
}

ipv6_packet_t::option_hop_by_hop_t::option_hop_by_hop_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, ipv6_packet_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ipv6_packet_t::option_hop_by_hop_t::_read() {
    m_next_header_type = m__io->read_u1();
    m_hdr_ext_len = m__io->read_u1();
    m_body = m__io->read_bytes((hdr_ext_len() - 1));
    switch (next_header_type()) {
    case 0:
        m_next_header = new option_hop_by_hop_t(m__io, this, m__root);
        break;
    case 6:
        m_next_header = new tcp_segment_t(m__io);
        break;
    case 59:
        m_next_header = new no_next_header_t(m__io, this, m__root);
        break;
    }
}

ipv6_packet_t::option_hop_by_hop_t::~option_hop_by_hop_t() {
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "ipv6_packet.h"


#include "udp_datagram.h"
#include "tcp_segment.h"
#include "ipv4_packet.h"

ipv6_packet_t::ipv6_packet_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ipv6_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
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
    n_next_header = true;
    switch (next_header_type()) {
    case 17: {
        n_next_header = false;
        m_next_header = new udp_datagram_t(m__io);
        break;
    }
    case 0: {
        n_next_header = false;
        m_next_header = new option_hop_by_hop_t(m__io, this, m__root);
        break;
    }
    case 4: {
        n_next_header = false;
        m_next_header = new ipv4_packet_t(m__io);
        break;
    }
    case 6: {
        n_next_header = false;
        m_next_header = new tcp_segment_t(m__io);
        break;
    }
    case 59: {
        n_next_header = false;
        m_next_header = new no_next_header_t(m__io, this, m__root);
        break;
    }
    }
    m_rest = m__io->read_bytes_full();
}

ipv6_packet_t::~ipv6_packet_t() {
    if (!n_next_header) {
        delete m_next_header;
    }
}

ipv6_packet_t::no_next_header_t::no_next_header_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ipv6_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void ipv6_packet_t::no_next_header_t::_read() {
}

ipv6_packet_t::no_next_header_t::~no_next_header_t() {
}

ipv6_packet_t::option_hop_by_hop_t::option_hop_by_hop_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ipv6_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void ipv6_packet_t::option_hop_by_hop_t::_read() {
    m_next_header_type = m__io->read_u1();
    m_hdr_ext_len = m__io->read_u1();
    m_body = m__io->read_bytes((hdr_ext_len() - 1));
    n_next_header = true;
    switch (next_header_type()) {
    case 0: {
        n_next_header = false;
        m_next_header = new option_hop_by_hop_t(m__io, this, m__root);
        break;
    }
    case 6: {
        n_next_header = false;
        m_next_header = new tcp_segment_t(m__io);
        break;
    }
    case 59: {
        n_next_header = false;
        m_next_header = new no_next_header_t(m__io, this, m__root);
        break;
    }
    }
}

ipv6_packet_t::option_hop_by_hop_t::~option_hop_by_hop_t() {
    if (!n_next_header) {
        delete m_next_header;
    }
}

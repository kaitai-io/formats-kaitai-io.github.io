// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "rtpdump.h"


#include "rtp_packet.h"

rtpdump_t::rtpdump_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, rtpdump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void rtpdump_t::_read() {
    m_file_header = new header_t_t(m__io, this, m__root);
    m_packets = new std::vector<packet_t_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_packets->push_back(new packet_t_t(m__io, this, m__root));
            i++;
        }
    }
}

rtpdump_t::~rtpdump_t() {
    delete m_file_header;
    for (std::vector<packet_t_t*>::iterator it = m_packets->begin(); it != m_packets->end(); ++it) {
        delete *it;
    }
    delete m_packets;
}

rtpdump_t::header_t_t::header_t_t(kaitai::kstream* p__io, rtpdump_t* p__parent, rtpdump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void rtpdump_t::header_t_t::_read() {
    m_shebang = m__io->ensure_fixed_contents(std::string("\x23\x21\x72\x74\x70\x70\x6C\x61\x79\x31\x2E\x30", 12));
    m_space = m__io->ensure_fixed_contents(std::string("\x20", 1));
    m_ip = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(47, false, true, true), std::string("ascii"));
    m_port = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(10, false, true, true), std::string("ascii"));
    m_start_sec = m__io->read_u4be();
    m_start_usec = m__io->read_u4be();
    m_ip2 = m__io->read_u4be();
    m_port2 = m__io->read_u2be();
    m_padding = m__io->read_u2be();
}

rtpdump_t::header_t_t::~header_t_t() {
}

rtpdump_t::packet_t_t::packet_t_t(kaitai::kstream* p__io, rtpdump_t* p__parent, rtpdump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void rtpdump_t::packet_t_t::_read() {
    m_length = m__io->read_u2be();
    m_len_body = m__io->read_u2be();
    m_packet_usec = m__io->read_u4be();
    m__raw_body = m__io->read_bytes(len_body());
    m__io__raw_body = new kaitai::kstream(m__raw_body);
    m_body = new rtp_packet_t(m__io__raw_body);
}

rtpdump_t::packet_t_t::~packet_t_t() {
    delete m__io__raw_body;
    delete m_body;
}

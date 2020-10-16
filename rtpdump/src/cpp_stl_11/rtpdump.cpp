// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "rtpdump.h"
#include "kaitai/exceptions.h"

rtpdump_t::rtpdump_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, rtpdump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_file_header = nullptr;
    m_packets = nullptr;
    _read();
}

void rtpdump_t::_read() {
    m_file_header = std::unique_ptr<header_t_t>(new header_t_t(m__io, this, m__root));
    m_packets = std::unique_ptr<std::vector<std::unique_ptr<packet_t_t>>>(new std::vector<std::unique_ptr<packet_t_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_packets->push_back(std::move(std::unique_ptr<packet_t_t>(new packet_t_t(m__io, this, m__root))));
            i++;
        }
    }
}

rtpdump_t::~rtpdump_t() {
    _clean_up();
}

void rtpdump_t::_clean_up() {
}

rtpdump_t::header_t_t::header_t_t(kaitai::kstream* p__io, rtpdump_t* p__parent, rtpdump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void rtpdump_t::header_t_t::_read() {
    m_shebang = m__io->read_bytes(12);
    if (!(shebang() == std::string("\x23\x21\x72\x74\x70\x70\x6C\x61\x79\x31\x2E\x30", 12))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x23\x21\x72\x74\x70\x70\x6C\x61\x79\x31\x2E\x30", 12), shebang(), _io(), std::string("/types/header_t/seq/0"));
    }
    m_space = m__io->read_bytes(1);
    if (!(space() == std::string("\x20", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x20", 1), space(), _io(), std::string("/types/header_t/seq/1"));
    }
    m_ip = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(47, false, true, true), std::string("ascii"));
    m_port = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(10, false, true, true), std::string("ascii"));
    m_start_sec = m__io->read_u4be();
    m_start_usec = m__io->read_u4be();
    m_ip2 = m__io->read_u4be();
    m_port2 = m__io->read_u2be();
    m_padding = m__io->read_u2be();
}

rtpdump_t::header_t_t::~header_t_t() {
    _clean_up();
}

void rtpdump_t::header_t_t::_clean_up() {
}

rtpdump_t::packet_t_t::packet_t_t(kaitai::kstream* p__io, rtpdump_t* p__parent, rtpdump_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_body = nullptr;
    m__io__raw_body = nullptr;
    _read();
}

void rtpdump_t::packet_t_t::_read() {
    m_length = m__io->read_u2be();
    m_len_body = m__io->read_u2be();
    m_packet_usec = m__io->read_u4be();
    m__raw_body = m__io->read_bytes(len_body());
    m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
    m_body = std::unique_ptr<rtp_packet_t>(new rtp_packet_t(m__io__raw_body.get()));
}

rtpdump_t::packet_t_t::~packet_t_t() {
    _clean_up();
}

void rtpdump_t::packet_t_t::_clean_up() {
}

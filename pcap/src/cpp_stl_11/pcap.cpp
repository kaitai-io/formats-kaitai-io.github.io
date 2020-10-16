// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "pcap.h"
#include "kaitai/exceptions.h"

pcap_t::pcap_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, pcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_hdr = nullptr;
    m_packets = nullptr;
    _read();
}

void pcap_t::_read() {
    m_hdr = std::unique_ptr<header_t>(new header_t(m__io, this, m__root));
    m_packets = std::unique_ptr<std::vector<std::unique_ptr<packet_t>>>(new std::vector<std::unique_ptr<packet_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_packets->push_back(std::move(std::unique_ptr<packet_t>(new packet_t(m__io, this, m__root))));
            i++;
        }
    }
}

pcap_t::~pcap_t() {
    _clean_up();
}

void pcap_t::_clean_up() {
}

pcap_t::header_t::header_t(kaitai::kstream* p__io, pcap_t* p__parent, pcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void pcap_t::header_t::_read() {
    m_magic_number = m__io->read_bytes(4);
    if (!(magic_number() == std::string("\xD4\xC3\xB2\xA1", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xD4\xC3\xB2\xA1", 4), magic_number(), _io(), std::string("/types/header/seq/0"));
    }
    m_version_major = m__io->read_u2le();
    m_version_minor = m__io->read_u2le();
    m_thiszone = m__io->read_s4le();
    m_sigfigs = m__io->read_u4le();
    m_snaplen = m__io->read_u4le();
    m_network = static_cast<pcap_t::linktype_t>(m__io->read_u4le());
}

pcap_t::header_t::~header_t() {
    _clean_up();
}

void pcap_t::header_t::_clean_up() {
}

pcap_t::packet_t::packet_t(kaitai::kstream* p__io, pcap_t* p__parent, pcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = nullptr;
    _read();
}

void pcap_t::packet_t::_read() {
    m_ts_sec = m__io->read_u4le();
    m_ts_usec = m__io->read_u4le();
    m_incl_len = m__io->read_u4le();
    m_orig_len = m__io->read_u4le();
    n_body = true;
    switch (_root()->hdr()->network()) {
    case pcap_t::LINKTYPE_PPI: {
        n_body = false;
        m__raw_body = m__io->read_bytes(incl_len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<packet_ppi_t>(new packet_ppi_t(m__io__raw_body.get()));
        break;
    }
    case pcap_t::LINKTYPE_ETHERNET: {
        n_body = false;
        m__raw_body = m__io->read_bytes(incl_len());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<ethernet_frame_t>(new ethernet_frame_t(m__io__raw_body.get()));
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes(incl_len());
        break;
    }
    }
}

pcap_t::packet_t::~packet_t() {
    _clean_up();
}

void pcap_t::packet_t::_clean_up() {
    if (!n_body) {
    }
}

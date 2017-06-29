// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "pcap.h"


#include "ethernet_frame.h"
#include "packet_ppi.h"

pcap_t::pcap_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, pcap_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void pcap_t::_read() {
    m_hdr = new header_t(m__io, this, m__root);
    m_packets = new std::vector<packet_t*>();
    while (!m__io->is_eof()) {
        m_packets->push_back(new packet_t(m__io, this, m__root));
    }
}

pcap_t::~pcap_t() {
    delete m_hdr;
    for (std::vector<packet_t*>::iterator it = m_packets->begin(); it != m_packets->end(); ++it) {
        delete *it;
    }
    delete m_packets;
}

pcap_t::header_t::header_t(kaitai::kstream *p_io, pcap_t* p_parent, pcap_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void pcap_t::header_t::_read() {
    m_magic_number = m__io->ensure_fixed_contents(std::string("\xD4\xC3\xB2\xA1", 4));
    m_version_major = m__io->read_u2le();
    m_version_minor = m__io->read_u2le();
    m_thiszone = m__io->read_s4le();
    m_sigfigs = m__io->read_u4le();
    m_snaplen = m__io->read_u4le();
    m_network = static_cast<pcap_t::linktype_t>(m__io->read_u4le());
}

pcap_t::header_t::~header_t() {
}

pcap_t::packet_t::packet_t(kaitai::kstream *p_io, pcap_t* p_parent, pcap_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void pcap_t::packet_t::_read() {
    m_ts_sec = m__io->read_u4le();
    m_ts_usec = m__io->read_u4le();
    m_incl_len = m__io->read_u4le();
    m_orig_len = m__io->read_u4le();
    switch (_root()->hdr()->network()) {
    case LINKTYPE_PPI:
        m__raw_body = m__io->read_bytes(incl_len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new packet_ppi_t(m__io__raw_body);
        break;
    case LINKTYPE_ETHERNET:
        m__raw_body = m__io->read_bytes(incl_len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new ethernet_frame_t(m__io__raw_body);
        break;
    default:
        m__raw_body = m__io->read_bytes(incl_len());
        break;
    }
}

pcap_t::packet_t::~packet_t() {
}

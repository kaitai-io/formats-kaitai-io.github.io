// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "pcap.h"
#include "kaitai/exceptions.h"

pcap_t::pcap_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, pcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_hdr = 0;
    m_packets = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void pcap_t::_read() {
    m_hdr = new header_t(m__io, this, m__root);
    m_packets = new std::vector<packet_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_packets->push_back(new packet_t(m__io, this, m__root));
            i++;
        }
    }
}

pcap_t::~pcap_t() {
    _clean_up();
}

void pcap_t::_clean_up() {
    if (m_hdr) {
        delete m_hdr; m_hdr = 0;
    }
    if (m_packets) {
        for (std::vector<packet_t*>::iterator it = m_packets->begin(); it != m_packets->end(); ++it) {
            delete *it;
        }
        delete m_packets; m_packets = 0;
    }
}

pcap_t::header_t::header_t(kaitai::kstream* p__io, pcap_t* p__parent, pcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void pcap_t::header_t::_read() {
    m_magic_number = m__io->read_bytes(4);
    if (!(magic_number() == std::string("\xD4\xC3\xB2\xA1", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xD4\xC3\xB2\xA1", 4), magic_number(), _io(), std::string("/types/header/seq/0"));
    }
    m_version_major = m__io->read_u2le();
    if (!(version_major() == 2)) {
        throw kaitai::validation_not_equal_error<uint16_t>(2, version_major(), _io(), std::string("/types/header/seq/1"));
    }
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
    m__io__raw_body = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new packet_ppi_t(m__io__raw_body);
        break;
    }
    case pcap_t::LINKTYPE_ETHERNET: {
        n_body = false;
        m__raw_body = m__io->read_bytes(incl_len());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new ethernet_frame_t(m__io__raw_body);
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
        if (m__io__raw_body) {
            delete m__io__raw_body; m__io__raw_body = 0;
        }
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

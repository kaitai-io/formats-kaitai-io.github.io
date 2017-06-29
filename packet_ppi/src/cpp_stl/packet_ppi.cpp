// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "packet_ppi.h"


#include "ethernet_frame.h"

packet_ppi_t::packet_ppi_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, packet_ppi_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void packet_ppi_t::_read() {
    m_header = new packet_ppi_header_t(m__io, this, m__root);
    m__raw_fields = m__io->read_bytes((header()->pph_len() - 8));
    m__io__raw_fields = new kaitai::kstream(m__raw_fields);
    m_fields = new packet_ppi_fields_t(m__io__raw_fields, this, m__root);
    switch (header()->pph_dlt()) {
    case LINKTYPE_PPI:
        m__raw_body = m__io->read_bytes_full();
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new packet_ppi_t(m__io__raw_body);
        break;
    case LINKTYPE_ETHERNET:
        m__raw_body = m__io->read_bytes_full();
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new ethernet_frame_t(m__io__raw_body);
        break;
    default:
        m__raw_body = m__io->read_bytes_full();
        break;
    }
}

packet_ppi_t::~packet_ppi_t() {
    delete m_header;
    delete m__io__raw_fields;
    delete m_fields;
}

packet_ppi_t::packet_ppi_header_t::packet_ppi_header_t(kaitai::kstream *p_io, packet_ppi_t* p_parent, packet_ppi_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void packet_ppi_t::packet_ppi_header_t::_read() {
    m_pph_version = m__io->read_u1();
    m_pph_flags = m__io->read_u1();
    m_pph_len = m__io->read_u2le();
    m_pph_dlt = static_cast<packet_ppi_t::linktype_t>(m__io->read_u4le());
}

packet_ppi_t::packet_ppi_header_t::~packet_ppi_header_t() {
}

packet_ppi_t::packet_ppi_fields_t::packet_ppi_fields_t(kaitai::kstream *p_io, packet_ppi_t* p_parent, packet_ppi_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void packet_ppi_t::packet_ppi_fields_t::_read() {
    m_entries = new std::vector<packet_ppi_field_t*>();
    while (!m__io->is_eof()) {
        m_entries->push_back(new packet_ppi_field_t(m__io, this, m__root));
    }
}

packet_ppi_t::packet_ppi_fields_t::~packet_ppi_fields_t() {
    for (std::vector<packet_ppi_field_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
        delete *it;
    }
    delete m_entries;
}

packet_ppi_t::packet_ppi_field_t::packet_ppi_field_t(kaitai::kstream *p_io, packet_ppi_t::packet_ppi_fields_t* p_parent, packet_ppi_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void packet_ppi_t::packet_ppi_field_t::_read() {
    m_pfh_type = static_cast<packet_ppi_t::pfh_type_t>(m__io->read_u2le());
    m_pfh_datalen = m__io->read_u2le();
    switch (pfh_type()) {
    case PFH_TYPE_RADIO_802_11_COMMON:
        m__raw_body = m__io->read_bytes(pfh_datalen());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new radio_802_11_common_body_t(m__io__raw_body, this, m__root);
        break;
    default:
        m__raw_body = m__io->read_bytes(pfh_datalen());
        break;
    }
}

packet_ppi_t::packet_ppi_field_t::~packet_ppi_field_t() {
}

packet_ppi_t::radio_802_11_common_body_t::radio_802_11_common_body_t(kaitai::kstream *p_io, packet_ppi_t::packet_ppi_field_t* p_parent, packet_ppi_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void packet_ppi_t::radio_802_11_common_body_t::_read() {
    m_tsf_timer = m__io->read_u8le();
    m_flags = m__io->read_u2le();
    m_rate = m__io->read_u2le();
    m_channel_freq = m__io->read_u2le();
    m_channel_flags = m__io->read_u2le();
    m_fhss_hopset = m__io->read_u1();
    m_fhss_pattern = m__io->read_u1();
    m_dbm_antsignal = m__io->read_s1();
    m_dbm_antnoise = m__io->read_s1();
}

packet_ppi_t::radio_802_11_common_body_t::~radio_802_11_common_body_t() {
}

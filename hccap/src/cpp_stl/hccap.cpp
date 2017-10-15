// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "hccap.h"



hccap_t::hccap_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, hccap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void hccap_t::_read() {
    m_records = new std::vector<hccap_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_records->push_back(new hccap_t(m__io, this, m__root));
            i++;
        }
    }
}

hccap_t::~hccap_t() {
    for (std::vector<hccap_t*>::iterator it = m_records->begin(); it != m_records->end(); ++it) {
        delete *it;
    }
    delete m_records;
}

hccap_t::hccap_t::hccap_t(kaitai::kstream* p__io, hccap_t* p__parent, hccap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void hccap_t::hccap_t::_read() {
    m_essid = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(36), 0, false), std::string("utf-8"));
    m_ap_mac = m__io->read_bytes(6);
    m_stantion_mac = m__io->read_bytes(6);
    m_stantion_nonce = m__io->read_bytes(32);
    m_ap_nonce = m__io->read_bytes(32);
    m__raw_eapol = m__io->read_bytes(256);
    m__io__raw_eapol = new kaitai::kstream(m__raw_eapol);
    m_eapol = new eapol_frame_t(m__io__raw_eapol, this, m__root);
    m_eapol_size = m__io->read_u4le();
    m_keyver = m__io->read_u4le();
    m_keymic = m__io->read_bytes(16);
}

hccap_t::hccap_t::~hccap_t() {
    delete m__io__raw_eapol;
    delete m_eapol;
}

hccap_t::eapol_frame_t::eapol_frame_t(kaitai::kstream* p__io, hccap_t::hccap_t* p__parent, hccap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_body = false;
    _read();
}

void hccap_t::eapol_frame_t::_read() {
}

hccap_t::eapol_frame_t::~eapol_frame_t() {
    if (f_body) {
    }
}

std::string hccap_t::eapol_frame_t::body() {
    if (f_body)
        return m_body;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_body = m__io->read_bytes(_parent()->eapol_size());
    m__io->seek(_pos);
    f_body = true;
    return m_body;
}

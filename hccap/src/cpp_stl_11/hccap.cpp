// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "hccap.h"

hccap_t::hccap_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, hccap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_records = nullptr;
    _read();
}

void hccap_t::_read() {
    m_records = std::unique_ptr<std::vector<std::unique_ptr<hccap_record_t>>>(new std::vector<std::unique_ptr<hccap_record_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_records->push_back(std::move(std::unique_ptr<hccap_record_t>(new hccap_record_t(m__io, this, m__root))));
            i++;
        }
    }
}

hccap_t::~hccap_t() {
    _clean_up();
}

void hccap_t::_clean_up() {
}

hccap_t::eapol_dummy_t::eapol_dummy_t(kaitai::kstream* p__io, hccap_t::hccap_record_t* p__parent, hccap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void hccap_t::eapol_dummy_t::_read() {
}

hccap_t::eapol_dummy_t::~eapol_dummy_t() {
    _clean_up();
}

void hccap_t::eapol_dummy_t::_clean_up() {
}

hccap_t::hccap_record_t::hccap_record_t(kaitai::kstream* p__io, hccap_t* p__parent, hccap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_eapol_buffer = nullptr;
    m__io__raw_eapol_buffer = nullptr;
    f_eapol = false;
    _read();
}

void hccap_t::hccap_record_t::_read() {
    m_essid = m__io->read_bytes(36);
    m_mac_ap = m__io->read_bytes(6);
    m_mac_station = m__io->read_bytes(6);
    m_nonce_station = m__io->read_bytes(32);
    m_nonce_ap = m__io->read_bytes(32);
    m__raw_eapol_buffer = m__io->read_bytes(256);
    m__io__raw_eapol_buffer = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_eapol_buffer));
    m_eapol_buffer = std::unique_ptr<eapol_dummy_t>(new eapol_dummy_t(m__io__raw_eapol_buffer.get(), this, m__root));
    m_len_eapol = m__io->read_u4le();
    m_keyver = m__io->read_u4le();
    m_keymic = m__io->read_bytes(16);
}

hccap_t::hccap_record_t::~hccap_record_t() {
    _clean_up();
}

void hccap_t::hccap_record_t::_clean_up() {
    if (f_eapol) {
    }
}

std::string hccap_t::hccap_record_t::eapol() {
    if (f_eapol)
        return m_eapol;
    f_eapol = true;
    kaitai::kstream *io = eapol_buffer()->_io();
    std::streampos _pos = io->pos();
    io->seek(0);
    m_eapol = io->read_bytes(len_eapol());
    io->seek(_pos);
    return m_eapol;
}

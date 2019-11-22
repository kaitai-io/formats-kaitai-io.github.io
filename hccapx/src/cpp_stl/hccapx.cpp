// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "hccapx.h"



hccapx_t::hccapx_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, hccapx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void hccapx_t::_read() {
    m_records = new std::vector<hccapx_record_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_records->push_back(new hccapx_record_t(m__io, this, m__root));
            i++;
        }
    }
}

hccapx_t::~hccapx_t() {
    for (std::vector<hccapx_record_t*>::iterator it = m_records->begin(); it != m_records->end(); ++it) {
        delete *it;
    }
    delete m_records;
}

hccapx_t::hccapx_record_t::hccapx_record_t(kaitai::kstream* p__io, hccapx_t* p__parent, hccapx_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void hccapx_t::hccapx_record_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\x48\x43\x50\x58", 4));
    m_version = m__io->read_u4le();
    m_ignore_replay_counter = m__io->read_bits_int(1);
    m_message_pair = m__io->read_bits_int(7);
    m__io->align_to_byte();
    m_len_essid = m__io->read_u1();
    m_essid = m__io->read_bytes(len_essid());
    m_padding1 = m__io->read_bytes((32 - len_essid()));
    m_keyver = m__io->read_u1();
    m_keymic = m__io->read_bytes(16);
    m_mac_ap = m__io->read_bytes(6);
    m_nonce_ap = m__io->read_bytes(32);
    m_mac_station = m__io->read_bytes(6);
    m_nonce_station = m__io->read_bytes(32);
    m_len_eapol = m__io->read_u2le();
    m_eapol = m__io->read_bytes(len_eapol());
    m_padding2 = m__io->read_bytes((256 - len_eapol()));
}

hccapx_t::hccapx_record_t::~hccapx_record_t() {
}

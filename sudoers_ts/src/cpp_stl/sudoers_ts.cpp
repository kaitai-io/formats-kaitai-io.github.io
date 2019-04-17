// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "sudoers_ts.h"



sudoers_ts_t::sudoers_ts_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, sudoers_ts_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void sudoers_ts_t::_read() {
    m_records = new std::vector<record_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_records->push_back(new record_t(m__io, this, m__root));
            i++;
        }
    }
}

sudoers_ts_t::~sudoers_ts_t() {
    for (std::vector<record_t*>::iterator it = m_records->begin(); it != m_records->end(); ++it) {
        delete *it;
    }
    delete m_records;
}

sudoers_ts_t::record_v2_t::record_v2_t(kaitai::kstream* p__io, sudoers_ts_t::record_t* p__parent, sudoers_ts_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void sudoers_ts_t::record_v2_t::_read() {
    m_type = static_cast<sudoers_ts_t::ts_type_t>(m__io->read_u2le());
    m_flags = new ts_flag_t(m__io, this, m__root);
    m_auth_uid = m__io->read_u4le();
    m_sid = m__io->read_u4le();
    m_start_time = new timespec_t(m__io, this, m__root);
    m_ts = new timespec_t(m__io, this, m__root);
    n_ttydev = true;
    if (type() == TS_TYPE_TTY) {
        n_ttydev = false;
        m_ttydev = m__io->read_u4le();
    }
    n_ppid = true;
    if (type() == TS_TYPE_PPID) {
        n_ppid = false;
        m_ppid = m__io->read_u4le();
    }
}

sudoers_ts_t::record_v2_t::~record_v2_t() {
    delete m_flags;
    delete m_start_time;
    delete m_ts;
    if (!n_ttydev) {
    }
    if (!n_ppid) {
    }
}

sudoers_ts_t::ts_flag_t::ts_flag_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, sudoers_ts_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void sudoers_ts_t::ts_flag_t::_read() {
    m_reserved0 = m__io->read_bits_int(6);
    m_anyuid = m__io->read_bits_int(1);
    m_disabled = m__io->read_bits_int(1);
    m_reserved1 = m__io->read_bits_int(8);
}

sudoers_ts_t::ts_flag_t::~ts_flag_t() {
}

sudoers_ts_t::record_v1_t::record_v1_t(kaitai::kstream* p__io, sudoers_ts_t::record_t* p__parent, sudoers_ts_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void sudoers_ts_t::record_v1_t::_read() {
    m_type = static_cast<sudoers_ts_t::ts_type_t>(m__io->read_u2le());
    m_flags = new ts_flag_t(m__io, this, m__root);
    m_auth_uid = m__io->read_u4le();
    m_sid = m__io->read_u4le();
    m_ts = new timespec_t(m__io, this, m__root);
    n_ttydev = true;
    if (type() == TS_TYPE_TTY) {
        n_ttydev = false;
        m_ttydev = m__io->read_u4le();
    }
    n_ppid = true;
    if (type() == TS_TYPE_PPID) {
        n_ppid = false;
        m_ppid = m__io->read_u4le();
    }
}

sudoers_ts_t::record_v1_t::~record_v1_t() {
    delete m_flags;
    delete m_ts;
    if (!n_ttydev) {
    }
    if (!n_ppid) {
    }
}

sudoers_ts_t::timespec_t::timespec_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, sudoers_ts_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void sudoers_ts_t::timespec_t::_read() {
    m_sec = m__io->read_s8le();
    m_nsec = m__io->read_s8le();
}

sudoers_ts_t::timespec_t::~timespec_t() {
}

sudoers_ts_t::record_t::record_t(kaitai::kstream* p__io, sudoers_ts_t* p__parent, sudoers_ts_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void sudoers_ts_t::record_t::_read() {
    m_version = m__io->read_u2le();
    m_len_record = m__io->read_u2le();
    n_payload = true;
    switch (version()) {
    case 1: {
        n_payload = false;
        m__raw_payload = m__io->read_bytes((len_record() - 4));
        m__io__raw_payload = new kaitai::kstream(m__raw_payload);
        m_payload = new record_v1_t(m__io__raw_payload, this, m__root);
        break;
    }
    case 2: {
        n_payload = false;
        m__raw_payload = m__io->read_bytes((len_record() - 4));
        m__io__raw_payload = new kaitai::kstream(m__raw_payload);
        m_payload = new record_v2_t(m__io__raw_payload, this, m__root);
        break;
    }
    default: {
        m__raw_payload = m__io->read_bytes((len_record() - 4));
        break;
    }
    }
}

sudoers_ts_t::record_t::~record_t() {
    if (!n_payload) {
        delete m__io__raw_payload;
        delete m_payload;
    }
}

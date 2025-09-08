// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "sudoers_ts.h"
const std::set<sudoers_ts_t::ts_type_t> sudoers_ts_t::_values_ts_type_t{
    sudoers_ts_t::TS_TYPE_GLOBAL,
    sudoers_ts_t::TS_TYPE_TTY,
    sudoers_ts_t::TS_TYPE_PPID,
    sudoers_ts_t::TS_TYPE_LOCKEXCL,
};
bool sudoers_ts_t::_is_defined_ts_type_t(sudoers_ts_t::ts_type_t v) {
    return sudoers_ts_t::_values_ts_type_t.find(v) != sudoers_ts_t::_values_ts_type_t.end();
}

sudoers_ts_t::sudoers_ts_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, sudoers_ts_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_records = nullptr;
    _read();
}

void sudoers_ts_t::_read() {
    m_records = std::unique_ptr<std::vector<std::unique_ptr<record_t>>>(new std::vector<std::unique_ptr<record_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_records->push_back(std::move(std::unique_ptr<record_t>(new record_t(m__io, this, m__root))));
            i++;
        }
    }
}

sudoers_ts_t::~sudoers_ts_t() {
    _clean_up();
}

void sudoers_ts_t::_clean_up() {
}

sudoers_ts_t::record_t::record_t(kaitai::kstream* p__io, sudoers_ts_t* p__parent, sudoers_ts_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_payload = nullptr;
    _read();
}

void sudoers_ts_t::record_t::_read() {
    m_version = m__io->read_u2le();
    m_len_record = m__io->read_u2le();
    n_payload = true;
    switch (version()) {
    case 1: {
        n_payload = false;
        m__raw_payload = m__io->read_bytes(len_record() - 4);
        m__io__raw_payload = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_payload));
        m_payload = std::unique_ptr<record_v1_t>(new record_v1_t(m__io__raw_payload.get(), this, m__root));
        break;
    }
    case 2: {
        n_payload = false;
        m__raw_payload = m__io->read_bytes(len_record() - 4);
        m__io__raw_payload = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_payload));
        m_payload = std::unique_ptr<record_v2_t>(new record_v2_t(m__io__raw_payload.get(), this, m__root));
        break;
    }
    default: {
        m__raw_payload = m__io->read_bytes(len_record() - 4);
        break;
    }
    }
}

sudoers_ts_t::record_t::~record_t() {
    _clean_up();
}

void sudoers_ts_t::record_t::_clean_up() {
    if (!n_payload) {
    }
}

sudoers_ts_t::record_v1_t::record_v1_t(kaitai::kstream* p__io, sudoers_ts_t::record_t* p__parent, sudoers_ts_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flags = nullptr;
    m_ts = nullptr;
    _read();
}

void sudoers_ts_t::record_v1_t::_read() {
    m_type = static_cast<sudoers_ts_t::ts_type_t>(m__io->read_u2le());
    m_flags = std::unique_ptr<ts_flag_t>(new ts_flag_t(m__io, this, m__root));
    m_auth_uid = m__io->read_u4le();
    m_sid = m__io->read_u4le();
    m_ts = std::unique_ptr<timespec_t>(new timespec_t(m__io, this, m__root));
    n_ttydev = true;
    if (type() == sudoers_ts_t::TS_TYPE_TTY) {
        n_ttydev = false;
        m_ttydev = m__io->read_u4le();
    }
    n_ppid = true;
    if (type() == sudoers_ts_t::TS_TYPE_PPID) {
        n_ppid = false;
        m_ppid = m__io->read_u4le();
    }
}

sudoers_ts_t::record_v1_t::~record_v1_t() {
    _clean_up();
}

void sudoers_ts_t::record_v1_t::_clean_up() {
    if (!n_ttydev) {
    }
    if (!n_ppid) {
    }
}

sudoers_ts_t::record_v2_t::record_v2_t(kaitai::kstream* p__io, sudoers_ts_t::record_t* p__parent, sudoers_ts_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flags = nullptr;
    m_start_time = nullptr;
    m_ts = nullptr;
    _read();
}

void sudoers_ts_t::record_v2_t::_read() {
    m_type = static_cast<sudoers_ts_t::ts_type_t>(m__io->read_u2le());
    m_flags = std::unique_ptr<ts_flag_t>(new ts_flag_t(m__io, this, m__root));
    m_auth_uid = m__io->read_u4le();
    m_sid = m__io->read_u4le();
    m_start_time = std::unique_ptr<timespec_t>(new timespec_t(m__io, this, m__root));
    m_ts = std::unique_ptr<timespec_t>(new timespec_t(m__io, this, m__root));
    n_ttydev = true;
    if (type() == sudoers_ts_t::TS_TYPE_TTY) {
        n_ttydev = false;
        m_ttydev = m__io->read_u4le();
    }
    n_ppid = true;
    if (type() == sudoers_ts_t::TS_TYPE_PPID) {
        n_ppid = false;
        m_ppid = m__io->read_u4le();
    }
}

sudoers_ts_t::record_v2_t::~record_v2_t() {
    _clean_up();
}

void sudoers_ts_t::record_v2_t::_clean_up() {
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
    _clean_up();
}

void sudoers_ts_t::timespec_t::_clean_up() {
}

sudoers_ts_t::ts_flag_t::ts_flag_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, sudoers_ts_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void sudoers_ts_t::ts_flag_t::_read() {
    m_reserved0 = m__io->read_bits_int_be(6);
    m_anyuid = m__io->read_bits_int_be(1);
    m_disabled = m__io->read_bits_int_be(1);
    m_reserved1 = m__io->read_bits_int_be(8);
}

sudoers_ts_t::ts_flag_t::~ts_flag_t() {
    _clean_up();
}

void sudoers_ts_t::ts_flag_t::_clean_up() {
}

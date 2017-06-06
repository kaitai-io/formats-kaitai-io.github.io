// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "glibc_utmp.h"



glibc_utmp_t::glibc_utmp_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, glibc_utmp_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void glibc_utmp_t::_read() {
    m__raw_records = new std::vector<std::string>();
    m_records = new std::vector<record_t*>();
    while (!m__io->is_eof()) {
        m__raw_records->push_back(m__io->read_bytes(384));
        m__io__raw_records = new kaitai::kstream(m__raw_records->at(m__raw_records->size() - 1));
        m_records->push_back(new record_t(m__io__raw_records, this, m__root));
    }
}

glibc_utmp_t::~glibc_utmp_t() {
    delete m__raw_records;
    for (std::vector<record_t*>::iterator it = m_records->begin(); it != m_records->end(); ++it) {
        delete *it;
    }
    delete m_records;
}

glibc_utmp_t::record_t::record_t(kaitai::kstream *p_io, glibc_utmp_t* p_parent, glibc_utmp_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void glibc_utmp_t::record_t::_read() {
    m_ut_type = static_cast<glibc_utmp_t::entry_type_t>(m__io->read_s4le());
    m_pid = m__io->read_u4le();
    m_line = kaitai::kstream::bytes_to_str(m__io->read_bytes(32), std::string("UTF-8"));
    m_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("UTF-8"));
    m_user = kaitai::kstream::bytes_to_str(m__io->read_bytes(32), std::string("UTF-8"));
    m_host = kaitai::kstream::bytes_to_str(m__io->read_bytes(256), std::string("UTF-8"));
    m_exit = m__io->read_u4le();
    m_session = m__io->read_s4le();
    m_tv = new timeval_t(m__io, this, m__root);
    m_addr_v6 = m__io->read_bytes(16);
    m_reserved = m__io->read_bytes(20);
}

glibc_utmp_t::record_t::~record_t() {
    delete m_tv;
}

glibc_utmp_t::timeval_t::timeval_t(kaitai::kstream *p_io, glibc_utmp_t::record_t* p_parent, glibc_utmp_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void glibc_utmp_t::timeval_t::_read() {
    m_sec = m__io->read_s4le();
    m_usec = m__io->read_s4le();
}

glibc_utmp_t::timeval_t::~timeval_t() {
}

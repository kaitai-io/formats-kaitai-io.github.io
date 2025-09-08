// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "glibc_utmp.h"
const std::set<glibc_utmp_t::entry_type_t> glibc_utmp_t::_values_entry_type_t{
    glibc_utmp_t::ENTRY_TYPE_EMPTY,
    glibc_utmp_t::ENTRY_TYPE_RUN_LVL,
    glibc_utmp_t::ENTRY_TYPE_BOOT_TIME,
    glibc_utmp_t::ENTRY_TYPE_NEW_TIME,
    glibc_utmp_t::ENTRY_TYPE_OLD_TIME,
    glibc_utmp_t::ENTRY_TYPE_INIT_PROCESS,
    glibc_utmp_t::ENTRY_TYPE_LOGIN_PROCESS,
    glibc_utmp_t::ENTRY_TYPE_USER_PROCESS,
    glibc_utmp_t::ENTRY_TYPE_DEAD_PROCESS,
    glibc_utmp_t::ENTRY_TYPE_ACCOUNTING,
};
bool glibc_utmp_t::_is_defined_entry_type_t(glibc_utmp_t::entry_type_t v) {
    return glibc_utmp_t::_values_entry_type_t.find(v) != glibc_utmp_t::_values_entry_type_t.end();
}

glibc_utmp_t::glibc_utmp_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, glibc_utmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_records = nullptr;
    m__raw_records = nullptr;
    m__io__raw_records = nullptr;
    _read();
}

void glibc_utmp_t::_read() {
    m__raw_records = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    m__io__raw_records = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>>(new std::vector<std::unique_ptr<kaitai::kstream>>());
    m_records = std::unique_ptr<std::vector<std::unique_ptr<record_t>>>(new std::vector<std::unique_ptr<record_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m__raw_records->push_back(std::move(m__io->read_bytes(384)));
            kaitai::kstream* io__raw_records = new kaitai::kstream(m__raw_records->at(m__raw_records->size() - 1));
            m__io__raw_records->emplace_back(io__raw_records);
            m_records->push_back(std::move(std::unique_ptr<record_t>(new record_t(io__raw_records, this, m__root))));
            i++;
        }
    }
}

glibc_utmp_t::~glibc_utmp_t() {
    _clean_up();
}

void glibc_utmp_t::_clean_up() {
}

glibc_utmp_t::record_t::record_t(kaitai::kstream* p__io, glibc_utmp_t* p__parent, glibc_utmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_tv = nullptr;
    _read();
}

void glibc_utmp_t::record_t::_read() {
    m_ut_type = static_cast<glibc_utmp_t::entry_type_t>(m__io->read_s4le());
    m_pid = m__io->read_s4le();
    m_line = kaitai::kstream::bytes_to_str(m__io->read_bytes(32), "UTF-8");
    m_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), "UTF-8");
    m_user = kaitai::kstream::bytes_to_str(m__io->read_bytes(32), "UTF-8");
    m_host = kaitai::kstream::bytes_to_str(m__io->read_bytes(256), "UTF-8");
    m_exit = m__io->read_u4le();
    m_session = m__io->read_s4le();
    m_tv = std::unique_ptr<timeval_t>(new timeval_t(m__io, this, m__root));
    m_addr_v6 = m__io->read_bytes(16);
    m_reserved = m__io->read_bytes(20);
}

glibc_utmp_t::record_t::~record_t() {
    _clean_up();
}

void glibc_utmp_t::record_t::_clean_up() {
}

glibc_utmp_t::timeval_t::timeval_t(kaitai::kstream* p__io, glibc_utmp_t::record_t* p__parent, glibc_utmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void glibc_utmp_t::timeval_t::_read() {
    m_sec = m__io->read_u4le();
    m_usec = m__io->read_s4le();
}

glibc_utmp_t::timeval_t::~timeval_t() {
    _clean_up();
}

void glibc_utmp_t::timeval_t::_clean_up() {
}

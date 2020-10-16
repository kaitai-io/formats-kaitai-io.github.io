// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "aix_utmp.h"

aix_utmp_t::aix_utmp_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, aix_utmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_records = nullptr;
    _read();
}

void aix_utmp_t::_read() {
    m_records = std::unique_ptr<std::vector<std::unique_ptr<record_t>>>(new std::vector<std::unique_ptr<record_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_records->push_back(std::move(std::unique_ptr<record_t>(new record_t(m__io, this, m__root))));
            i++;
        }
    }
}

aix_utmp_t::~aix_utmp_t() {
    _clean_up();
}

void aix_utmp_t::_clean_up() {
}

aix_utmp_t::record_t::record_t(kaitai::kstream* p__io, aix_utmp_t* p__parent, aix_utmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_exit_status = nullptr;
    _read();
}

void aix_utmp_t::record_t::_read() {
    m_user = kaitai::kstream::bytes_to_str(m__io->read_bytes(256), std::string("ascii"));
    m_inittab_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(14), std::string("ascii"));
    m_device = kaitai::kstream::bytes_to_str(m__io->read_bytes(64), std::string("ascii"));
    m_pid = m__io->read_u8be();
    m_type = static_cast<aix_utmp_t::entry_type_t>(m__io->read_s2be());
    m_timestamp = m__io->read_s8be();
    m_exit_status = std::unique_ptr<exit_status_t>(new exit_status_t(m__io, this, m__root));
    m_hostname = kaitai::kstream::bytes_to_str(m__io->read_bytes(256), std::string("ascii"));
    m_dbl_word_pad = m__io->read_s4be();
    m_reserved_a = m__io->read_bytes(8);
    m_reserved_v = m__io->read_bytes(24);
}

aix_utmp_t::record_t::~record_t() {
    _clean_up();
}

void aix_utmp_t::record_t::_clean_up() {
}

aix_utmp_t::exit_status_t::exit_status_t(kaitai::kstream* p__io, aix_utmp_t::record_t* p__parent, aix_utmp_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void aix_utmp_t::exit_status_t::_read() {
    m_termination_code = m__io->read_s2be();
    m_exit_code = m__io->read_s2be();
}

aix_utmp_t::exit_status_t::~exit_status_t() {
    _clean_up();
}

void aix_utmp_t::exit_status_t::_clean_up() {
}

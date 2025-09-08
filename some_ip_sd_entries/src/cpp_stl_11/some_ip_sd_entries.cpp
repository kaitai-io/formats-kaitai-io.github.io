// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "some_ip_sd_entries.h"

some_ip_sd_entries_t::some_ip_sd_entries_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, some_ip_sd_entries_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_entries = nullptr;
    _read();
}

void some_ip_sd_entries_t::_read() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<sd_entry_t>>>(new std::vector<std::unique_ptr<sd_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<sd_entry_t>(new sd_entry_t(m__io, this, m__root))));
            i++;
        }
    }
}

some_ip_sd_entries_t::~some_ip_sd_entries_t() {
    _clean_up();
}

void some_ip_sd_entries_t::_clean_up() {
}
const std::set<some_ip_sd_entries_t::sd_entry_t::entry_types_t> some_ip_sd_entries_t::sd_entry_t::_values_entry_types_t{
    some_ip_sd_entries_t::sd_entry_t::ENTRY_TYPES_FIND,
    some_ip_sd_entries_t::sd_entry_t::ENTRY_TYPES_OFFER,
    some_ip_sd_entries_t::sd_entry_t::ENTRY_TYPES_SUBSCRIBE,
    some_ip_sd_entries_t::sd_entry_t::ENTRY_TYPES_SUBSCRIBE_ACK,
};
bool some_ip_sd_entries_t::sd_entry_t::_is_defined_entry_types_t(some_ip_sd_entries_t::sd_entry_t::entry_types_t v) {
    return some_ip_sd_entries_t::sd_entry_t::_values_entry_types_t.find(v) != some_ip_sd_entries_t::sd_entry_t::_values_entry_types_t.end();
}

some_ip_sd_entries_t::sd_entry_t::sd_entry_t(kaitai::kstream* p__io, some_ip_sd_entries_t* p__parent, some_ip_sd_entries_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header = nullptr;
    _read();
}

void some_ip_sd_entries_t::sd_entry_t::_read() {
    m_header = std::unique_ptr<sd_entry_header_t>(new sd_entry_header_t(m__io, this, m__root));
    n_content = true;
    switch (header()->type()) {
    case some_ip_sd_entries_t::sd_entry_t::ENTRY_TYPES_FIND: {
        n_content = false;
        m_content = std::unique_ptr<sd_service_entry_t>(new sd_service_entry_t(m__io, this, m__root));
        break;
    }
    case some_ip_sd_entries_t::sd_entry_t::ENTRY_TYPES_OFFER: {
        n_content = false;
        m_content = std::unique_ptr<sd_service_entry_t>(new sd_service_entry_t(m__io, this, m__root));
        break;
    }
    case some_ip_sd_entries_t::sd_entry_t::ENTRY_TYPES_SUBSCRIBE: {
        n_content = false;
        m_content = std::unique_ptr<sd_eventgroup_entry_t>(new sd_eventgroup_entry_t(m__io, this, m__root));
        break;
    }
    case some_ip_sd_entries_t::sd_entry_t::ENTRY_TYPES_SUBSCRIBE_ACK: {
        n_content = false;
        m_content = std::unique_ptr<sd_eventgroup_entry_t>(new sd_eventgroup_entry_t(m__io, this, m__root));
        break;
    }
    }
}

some_ip_sd_entries_t::sd_entry_t::~sd_entry_t() {
    _clean_up();
}

void some_ip_sd_entries_t::sd_entry_t::_clean_up() {
    if (!n_content) {
    }
}

some_ip_sd_entries_t::sd_entry_t::sd_entry_header_t::sd_entry_header_t(kaitai::kstream* p__io, some_ip_sd_entries_t::sd_entry_t* p__parent, some_ip_sd_entries_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void some_ip_sd_entries_t::sd_entry_t::sd_entry_header_t::_read() {
    m_type = static_cast<some_ip_sd_entries_t::sd_entry_t::entry_types_t>(m__io->read_u1());
    m_index_first_options = m__io->read_u1();
    m_index_second_options = m__io->read_u1();
    m_number_first_options = m__io->read_bits_int_be(4);
    m_number_second_options = m__io->read_bits_int_be(4);
    m__io->align_to_byte();
    m_service_id = m__io->read_u2be();
    m_instance_id = m__io->read_u2be();
    m_major_version = m__io->read_u1();
    m_ttl = m__io->read_bits_int_be(24);
}

some_ip_sd_entries_t::sd_entry_t::sd_entry_header_t::~sd_entry_header_t() {
    _clean_up();
}

void some_ip_sd_entries_t::sd_entry_t::sd_entry_header_t::_clean_up() {
}

some_ip_sd_entries_t::sd_entry_t::sd_eventgroup_entry_t::sd_eventgroup_entry_t(kaitai::kstream* p__io, some_ip_sd_entries_t::sd_entry_t* p__parent, some_ip_sd_entries_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void some_ip_sd_entries_t::sd_entry_t::sd_eventgroup_entry_t::_read() {
    m_reserved = m__io->read_u1();
    m_initial_data_requested = m__io->read_bits_int_be(1);
    m_reserved2 = m__io->read_bits_int_be(3);
    m_counter = m__io->read_bits_int_be(4);
    m__io->align_to_byte();
    m_event_group_id = m__io->read_u2be();
}

some_ip_sd_entries_t::sd_entry_t::sd_eventgroup_entry_t::~sd_eventgroup_entry_t() {
    _clean_up();
}

void some_ip_sd_entries_t::sd_entry_t::sd_eventgroup_entry_t::_clean_up() {
}

some_ip_sd_entries_t::sd_entry_t::sd_service_entry_t::sd_service_entry_t(kaitai::kstream* p__io, some_ip_sd_entries_t::sd_entry_t* p__parent, some_ip_sd_entries_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void some_ip_sd_entries_t::sd_entry_t::sd_service_entry_t::_read() {
    m_minor_version = m__io->read_u4be();
}

some_ip_sd_entries_t::sd_entry_t::sd_service_entry_t::~sd_service_entry_t() {
    _clean_up();
}

void some_ip_sd_entries_t::sd_entry_t::sd_service_entry_t::_clean_up() {
}

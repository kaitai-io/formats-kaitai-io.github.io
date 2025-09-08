// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "some_ip_sd_options.h"

some_ip_sd_options_t::some_ip_sd_options_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, some_ip_sd_options_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_entries = nullptr;
    _read();
}

void some_ip_sd_options_t::_read() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<sd_option_t>>>(new std::vector<std::unique_ptr<sd_option_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<sd_option_t>(new sd_option_t(m__io, this, m__root))));
            i++;
        }
    }
}

some_ip_sd_options_t::~some_ip_sd_options_t() {
    _clean_up();
}

void some_ip_sd_options_t::_clean_up() {
}
const std::set<some_ip_sd_options_t::sd_option_t::option_types_t> some_ip_sd_options_t::sd_option_t::_values_option_types_t{
    some_ip_sd_options_t::sd_option_t::OPTION_TYPES_CONFIGURATION_OPTION,
    some_ip_sd_options_t::sd_option_t::OPTION_TYPES_LOAD_BALANCING_OPTION,
    some_ip_sd_options_t::sd_option_t::OPTION_TYPES_IPV4_ENDPOINT_OPTION,
    some_ip_sd_options_t::sd_option_t::OPTION_TYPES_IPV6_ENDPOINT_OPTION,
    some_ip_sd_options_t::sd_option_t::OPTION_TYPES_IPV4_MULTICAST_OPTION,
    some_ip_sd_options_t::sd_option_t::OPTION_TYPES_IPV6_MULTICAST_OPTION,
    some_ip_sd_options_t::sd_option_t::OPTION_TYPES_IPV4_SD_ENDPOINT_OPTION,
    some_ip_sd_options_t::sd_option_t::OPTION_TYPES_IPV6_SD_ENDPOINT_OPTION,
};
bool some_ip_sd_options_t::sd_option_t::_is_defined_option_types_t(some_ip_sd_options_t::sd_option_t::option_types_t v) {
    return some_ip_sd_options_t::sd_option_t::_values_option_types_t.find(v) != some_ip_sd_options_t::sd_option_t::_values_option_types_t.end();
}

some_ip_sd_options_t::sd_option_t::sd_option_t(kaitai::kstream* p__io, some_ip_sd_options_t* p__parent, some_ip_sd_options_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header = nullptr;
    _read();
}

void some_ip_sd_options_t::sd_option_t::_read() {
    m_header = std::unique_ptr<sd_option_header_t>(new sd_option_header_t(m__io, this, m__root));
    n_content = true;
    switch (header()->type()) {
    case some_ip_sd_options_t::sd_option_t::OPTION_TYPES_CONFIGURATION_OPTION: {
        n_content = false;
        m_content = std::unique_ptr<sd_configuration_option_t>(new sd_configuration_option_t(m__io, this, m__root));
        break;
    }
    case some_ip_sd_options_t::sd_option_t::OPTION_TYPES_IPV4_ENDPOINT_OPTION: {
        n_content = false;
        m_content = std::unique_ptr<sd_ipv4_endpoint_option_t>(new sd_ipv4_endpoint_option_t(m__io, this, m__root));
        break;
    }
    case some_ip_sd_options_t::sd_option_t::OPTION_TYPES_IPV4_MULTICAST_OPTION: {
        n_content = false;
        m_content = std::unique_ptr<sd_ipv4_multicast_option_t>(new sd_ipv4_multicast_option_t(m__io, this, m__root));
        break;
    }
    case some_ip_sd_options_t::sd_option_t::OPTION_TYPES_IPV4_SD_ENDPOINT_OPTION: {
        n_content = false;
        m_content = std::unique_ptr<sd_ipv4_sd_endpoint_option_t>(new sd_ipv4_sd_endpoint_option_t(m__io, this, m__root));
        break;
    }
    case some_ip_sd_options_t::sd_option_t::OPTION_TYPES_IPV6_ENDPOINT_OPTION: {
        n_content = false;
        m_content = std::unique_ptr<sd_ipv6_endpoint_option_t>(new sd_ipv6_endpoint_option_t(m__io, this, m__root));
        break;
    }
    case some_ip_sd_options_t::sd_option_t::OPTION_TYPES_IPV6_MULTICAST_OPTION: {
        n_content = false;
        m_content = std::unique_ptr<sd_ipv6_multicast_option_t>(new sd_ipv6_multicast_option_t(m__io, this, m__root));
        break;
    }
    case some_ip_sd_options_t::sd_option_t::OPTION_TYPES_IPV6_SD_ENDPOINT_OPTION: {
        n_content = false;
        m_content = std::unique_ptr<sd_ipv6_sd_endpoint_option_t>(new sd_ipv6_sd_endpoint_option_t(m__io, this, m__root));
        break;
    }
    case some_ip_sd_options_t::sd_option_t::OPTION_TYPES_LOAD_BALANCING_OPTION: {
        n_content = false;
        m_content = std::unique_ptr<sd_load_balancing_option_t>(new sd_load_balancing_option_t(m__io, this, m__root));
        break;
    }
    }
}

some_ip_sd_options_t::sd_option_t::~sd_option_t() {
    _clean_up();
}

void some_ip_sd_options_t::sd_option_t::_clean_up() {
    if (!n_content) {
    }
}

some_ip_sd_options_t::sd_option_t::sd_config_kv_pair_t::sd_config_kv_pair_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t::sd_config_string_t* p__parent, some_ip_sd_options_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void some_ip_sd_options_t::sd_option_t::sd_config_kv_pair_t::_read() {
    m_key = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(61, false, true, true), "ASCII");
    m_value = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "ASCII");
}

some_ip_sd_options_t::sd_option_t::sd_config_kv_pair_t::~sd_config_kv_pair_t() {
    _clean_up();
}

void some_ip_sd_options_t::sd_option_t::sd_config_kv_pair_t::_clean_up() {
}

some_ip_sd_options_t::sd_option_t::sd_config_string_t::sd_config_string_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t::sd_config_strings_container_t* p__parent, some_ip_sd_options_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_config = nullptr;
    m__io__raw_config = nullptr;
    _read();
}

void some_ip_sd_options_t::sd_option_t::sd_config_string_t::_read() {
    m_length = m__io->read_u1();
    n_config = true;
    if (length() != 0) {
        n_config = false;
        m__raw_config = m__io->read_bytes(length());
        m__io__raw_config = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_config));
        m_config = std::unique_ptr<sd_config_kv_pair_t>(new sd_config_kv_pair_t(m__io__raw_config.get(), this, m__root));
    }
}

some_ip_sd_options_t::sd_option_t::sd_config_string_t::~sd_config_string_t() {
    _clean_up();
}

void some_ip_sd_options_t::sd_option_t::sd_config_string_t::_clean_up() {
    if (!n_config) {
    }
}

some_ip_sd_options_t::sd_option_t::sd_config_strings_container_t::sd_config_strings_container_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t::sd_configuration_option_t* p__parent, some_ip_sd_options_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_config_strings = nullptr;
    _read();
}

void some_ip_sd_options_t::sd_option_t::sd_config_strings_container_t::_read() {
    m_config_strings = std::unique_ptr<std::vector<std::unique_ptr<sd_config_string_t>>>(new std::vector<std::unique_ptr<sd_config_string_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_config_strings->push_back(std::move(std::unique_ptr<sd_config_string_t>(new sd_config_string_t(m__io, this, m__root))));
            i++;
        }
    }
}

some_ip_sd_options_t::sd_option_t::sd_config_strings_container_t::~sd_config_strings_container_t() {
    _clean_up();
}

void some_ip_sd_options_t::sd_option_t::sd_config_strings_container_t::_clean_up() {
}

some_ip_sd_options_t::sd_option_t::sd_configuration_option_t::sd_configuration_option_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t* p__parent, some_ip_sd_options_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_configurations = nullptr;
    m__io__raw_configurations = nullptr;
    _read();
}

void some_ip_sd_options_t::sd_option_t::sd_configuration_option_t::_read() {
    m_reserved = m__io->read_u1();
    m__raw_configurations = m__io->read_bytes(_parent()->header()->length() - 1);
    m__io__raw_configurations = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_configurations));
    m_configurations = std::unique_ptr<sd_config_strings_container_t>(new sd_config_strings_container_t(m__io__raw_configurations.get(), this, m__root));
}

some_ip_sd_options_t::sd_option_t::sd_configuration_option_t::~sd_configuration_option_t() {
    _clean_up();
}

void some_ip_sd_options_t::sd_option_t::sd_configuration_option_t::_clean_up() {
}

some_ip_sd_options_t::sd_option_t::sd_ipv4_endpoint_option_t::sd_ipv4_endpoint_option_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t* p__parent, some_ip_sd_options_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void some_ip_sd_options_t::sd_option_t::sd_ipv4_endpoint_option_t::_read() {
    m_reserved = m__io->read_u1();
    m_address = m__io->read_bytes(4);
    m_reserved2 = m__io->read_u1();
    m_l4_protocol = m__io->read_u1();
    m_port = m__io->read_u2be();
}

some_ip_sd_options_t::sd_option_t::sd_ipv4_endpoint_option_t::~sd_ipv4_endpoint_option_t() {
    _clean_up();
}

void some_ip_sd_options_t::sd_option_t::sd_ipv4_endpoint_option_t::_clean_up() {
}

some_ip_sd_options_t::sd_option_t::sd_ipv4_multicast_option_t::sd_ipv4_multicast_option_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t* p__parent, some_ip_sd_options_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void some_ip_sd_options_t::sd_option_t::sd_ipv4_multicast_option_t::_read() {
    m_reserved = m__io->read_u1();
    m_address = m__io->read_bytes(4);
    m_reserved2 = m__io->read_u1();
    m_l4_protocol = m__io->read_u1();
    m_port = m__io->read_u2be();
}

some_ip_sd_options_t::sd_option_t::sd_ipv4_multicast_option_t::~sd_ipv4_multicast_option_t() {
    _clean_up();
}

void some_ip_sd_options_t::sd_option_t::sd_ipv4_multicast_option_t::_clean_up() {
}

some_ip_sd_options_t::sd_option_t::sd_ipv4_sd_endpoint_option_t::sd_ipv4_sd_endpoint_option_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t* p__parent, some_ip_sd_options_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void some_ip_sd_options_t::sd_option_t::sd_ipv4_sd_endpoint_option_t::_read() {
    m_reserved = m__io->read_u1();
    m_address = m__io->read_bytes(4);
    m_reserved2 = m__io->read_u1();
    m_l4_protocol = m__io->read_u1();
    m_port = m__io->read_u2be();
}

some_ip_sd_options_t::sd_option_t::sd_ipv4_sd_endpoint_option_t::~sd_ipv4_sd_endpoint_option_t() {
    _clean_up();
}

void some_ip_sd_options_t::sd_option_t::sd_ipv4_sd_endpoint_option_t::_clean_up() {
}

some_ip_sd_options_t::sd_option_t::sd_ipv6_endpoint_option_t::sd_ipv6_endpoint_option_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t* p__parent, some_ip_sd_options_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void some_ip_sd_options_t::sd_option_t::sd_ipv6_endpoint_option_t::_read() {
    m_reserved = m__io->read_u1();
    m_address = m__io->read_bytes(16);
    m_reserved2 = m__io->read_u1();
    m_l4_protocol = m__io->read_u1();
    m_port = m__io->read_u2be();
}

some_ip_sd_options_t::sd_option_t::sd_ipv6_endpoint_option_t::~sd_ipv6_endpoint_option_t() {
    _clean_up();
}

void some_ip_sd_options_t::sd_option_t::sd_ipv6_endpoint_option_t::_clean_up() {
}

some_ip_sd_options_t::sd_option_t::sd_ipv6_multicast_option_t::sd_ipv6_multicast_option_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t* p__parent, some_ip_sd_options_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void some_ip_sd_options_t::sd_option_t::sd_ipv6_multicast_option_t::_read() {
    m_reserved = m__io->read_u1();
    m_address = m__io->read_bytes(16);
    m_reserved2 = m__io->read_u1();
    m_l4_protocol = m__io->read_u1();
    m_port = m__io->read_u2be();
}

some_ip_sd_options_t::sd_option_t::sd_ipv6_multicast_option_t::~sd_ipv6_multicast_option_t() {
    _clean_up();
}

void some_ip_sd_options_t::sd_option_t::sd_ipv6_multicast_option_t::_clean_up() {
}

some_ip_sd_options_t::sd_option_t::sd_ipv6_sd_endpoint_option_t::sd_ipv6_sd_endpoint_option_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t* p__parent, some_ip_sd_options_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void some_ip_sd_options_t::sd_option_t::sd_ipv6_sd_endpoint_option_t::_read() {
    m_reserved = m__io->read_u1();
    m_address = m__io->read_bytes(16);
    m_reserved2 = m__io->read_u1();
    m_l4_protocol = m__io->read_u1();
    m_port = m__io->read_u2be();
}

some_ip_sd_options_t::sd_option_t::sd_ipv6_sd_endpoint_option_t::~sd_ipv6_sd_endpoint_option_t() {
    _clean_up();
}

void some_ip_sd_options_t::sd_option_t::sd_ipv6_sd_endpoint_option_t::_clean_up() {
}

some_ip_sd_options_t::sd_option_t::sd_load_balancing_option_t::sd_load_balancing_option_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t* p__parent, some_ip_sd_options_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void some_ip_sd_options_t::sd_option_t::sd_load_balancing_option_t::_read() {
    m_reserved = m__io->read_u1();
    m_priority = m__io->read_u2be();
    m_weight = m__io->read_u2be();
}

some_ip_sd_options_t::sd_option_t::sd_load_balancing_option_t::~sd_load_balancing_option_t() {
    _clean_up();
}

void some_ip_sd_options_t::sd_option_t::sd_load_balancing_option_t::_clean_up() {
}

some_ip_sd_options_t::sd_option_t::sd_option_header_t::sd_option_header_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t* p__parent, some_ip_sd_options_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void some_ip_sd_options_t::sd_option_t::sd_option_header_t::_read() {
    m_length = m__io->read_u2be();
    m_type = static_cast<some_ip_sd_options_t::sd_option_t::option_types_t>(m__io->read_u1());
}

some_ip_sd_options_t::sd_option_t::sd_option_header_t::~sd_option_header_t() {
    _clean_up();
}

void some_ip_sd_options_t::sd_option_t::sd_option_header_t::_clean_up() {
}

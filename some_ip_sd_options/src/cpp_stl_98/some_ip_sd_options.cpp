// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "some_ip_sd_options.h"

some_ip_sd_options_t::some_ip_sd_options_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, some_ip_sd_options_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void some_ip_sd_options_t::_read() {
    m_entries = new std::vector<sd_option_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new sd_option_t(m__io, this, m__root));
            i++;
        }
    }
}

some_ip_sd_options_t::~some_ip_sd_options_t() {
    _clean_up();
}

void some_ip_sd_options_t::_clean_up() {
    if (m_entries) {
        for (std::vector<sd_option_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}
std::set<some_ip_sd_options_t::sd_option_t::option_types_t> some_ip_sd_options_t::sd_option_t::_build_values_option_types_t() {
    std::set<some_ip_sd_options_t::sd_option_t::option_types_t> _t;
    _t.insert(some_ip_sd_options_t::sd_option_t::OPTION_TYPES_CONFIGURATION_OPTION);
    _t.insert(some_ip_sd_options_t::sd_option_t::OPTION_TYPES_LOAD_BALANCING_OPTION);
    _t.insert(some_ip_sd_options_t::sd_option_t::OPTION_TYPES_IPV4_ENDPOINT_OPTION);
    _t.insert(some_ip_sd_options_t::sd_option_t::OPTION_TYPES_IPV6_ENDPOINT_OPTION);
    _t.insert(some_ip_sd_options_t::sd_option_t::OPTION_TYPES_IPV4_MULTICAST_OPTION);
    _t.insert(some_ip_sd_options_t::sd_option_t::OPTION_TYPES_IPV6_MULTICAST_OPTION);
    _t.insert(some_ip_sd_options_t::sd_option_t::OPTION_TYPES_IPV4_SD_ENDPOINT_OPTION);
    _t.insert(some_ip_sd_options_t::sd_option_t::OPTION_TYPES_IPV6_SD_ENDPOINT_OPTION);
    return _t;
}
const std::set<some_ip_sd_options_t::sd_option_t::option_types_t> some_ip_sd_options_t::sd_option_t::_values_option_types_t = some_ip_sd_options_t::sd_option_t::_build_values_option_types_t();
bool some_ip_sd_options_t::sd_option_t::_is_defined_option_types_t(some_ip_sd_options_t::sd_option_t::option_types_t v) {
    return some_ip_sd_options_t::sd_option_t::_values_option_types_t.find(v) != some_ip_sd_options_t::sd_option_t::_values_option_types_t.end();
}

some_ip_sd_options_t::sd_option_t::sd_option_t(kaitai::kstream* p__io, some_ip_sd_options_t* p__parent, some_ip_sd_options_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void some_ip_sd_options_t::sd_option_t::_read() {
    m_header = new sd_option_header_t(m__io, this, m__root);
    n_content = true;
    switch (header()->type()) {
    case some_ip_sd_options_t::sd_option_t::OPTION_TYPES_CONFIGURATION_OPTION: {
        n_content = false;
        m_content = new sd_configuration_option_t(m__io, this, m__root);
        break;
    }
    case some_ip_sd_options_t::sd_option_t::OPTION_TYPES_IPV4_ENDPOINT_OPTION: {
        n_content = false;
        m_content = new sd_ipv4_endpoint_option_t(m__io, this, m__root);
        break;
    }
    case some_ip_sd_options_t::sd_option_t::OPTION_TYPES_IPV4_MULTICAST_OPTION: {
        n_content = false;
        m_content = new sd_ipv4_multicast_option_t(m__io, this, m__root);
        break;
    }
    case some_ip_sd_options_t::sd_option_t::OPTION_TYPES_IPV4_SD_ENDPOINT_OPTION: {
        n_content = false;
        m_content = new sd_ipv4_sd_endpoint_option_t(m__io, this, m__root);
        break;
    }
    case some_ip_sd_options_t::sd_option_t::OPTION_TYPES_IPV6_ENDPOINT_OPTION: {
        n_content = false;
        m_content = new sd_ipv6_endpoint_option_t(m__io, this, m__root);
        break;
    }
    case some_ip_sd_options_t::sd_option_t::OPTION_TYPES_IPV6_MULTICAST_OPTION: {
        n_content = false;
        m_content = new sd_ipv6_multicast_option_t(m__io, this, m__root);
        break;
    }
    case some_ip_sd_options_t::sd_option_t::OPTION_TYPES_IPV6_SD_ENDPOINT_OPTION: {
        n_content = false;
        m_content = new sd_ipv6_sd_endpoint_option_t(m__io, this, m__root);
        break;
    }
    case some_ip_sd_options_t::sd_option_t::OPTION_TYPES_LOAD_BALANCING_OPTION: {
        n_content = false;
        m_content = new sd_load_balancing_option_t(m__io, this, m__root);
        break;
    }
    }
}

some_ip_sd_options_t::sd_option_t::~sd_option_t() {
    _clean_up();
}

void some_ip_sd_options_t::sd_option_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (!n_content) {
        if (m_content) {
            delete m_content; m_content = 0;
        }
    }
}

some_ip_sd_options_t::sd_option_t::sd_config_kv_pair_t::sd_config_kv_pair_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t::sd_config_string_t* p__parent, some_ip_sd_options_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_config = 0;
    m__io__raw_config = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void some_ip_sd_options_t::sd_option_t::sd_config_string_t::_read() {
    m_length = m__io->read_u1();
    n_config = true;
    if (length() != 0) {
        n_config = false;
        m__raw_config = m__io->read_bytes(length());
        m__io__raw_config = new kaitai::kstream(m__raw_config);
        m_config = new sd_config_kv_pair_t(m__io__raw_config, this, m__root);
    }
}

some_ip_sd_options_t::sd_option_t::sd_config_string_t::~sd_config_string_t() {
    _clean_up();
}

void some_ip_sd_options_t::sd_option_t::sd_config_string_t::_clean_up() {
    if (!n_config) {
        if (m__io__raw_config) {
            delete m__io__raw_config; m__io__raw_config = 0;
        }
        if (m_config) {
            delete m_config; m_config = 0;
        }
    }
}

some_ip_sd_options_t::sd_option_t::sd_config_strings_container_t::sd_config_strings_container_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t::sd_configuration_option_t* p__parent, some_ip_sd_options_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_config_strings = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void some_ip_sd_options_t::sd_option_t::sd_config_strings_container_t::_read() {
    m_config_strings = new std::vector<sd_config_string_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_config_strings->push_back(new sd_config_string_t(m__io, this, m__root));
            i++;
        }
    }
}

some_ip_sd_options_t::sd_option_t::sd_config_strings_container_t::~sd_config_strings_container_t() {
    _clean_up();
}

void some_ip_sd_options_t::sd_option_t::sd_config_strings_container_t::_clean_up() {
    if (m_config_strings) {
        for (std::vector<sd_config_string_t*>::iterator it = m_config_strings->begin(); it != m_config_strings->end(); ++it) {
            delete *it;
        }
        delete m_config_strings; m_config_strings = 0;
    }
}

some_ip_sd_options_t::sd_option_t::sd_configuration_option_t::sd_configuration_option_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t* p__parent, some_ip_sd_options_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_configurations = 0;
    m__io__raw_configurations = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void some_ip_sd_options_t::sd_option_t::sd_configuration_option_t::_read() {
    m_reserved = m__io->read_u1();
    m__raw_configurations = m__io->read_bytes(_parent()->header()->length() - 1);
    m__io__raw_configurations = new kaitai::kstream(m__raw_configurations);
    m_configurations = new sd_config_strings_container_t(m__io__raw_configurations, this, m__root);
}

some_ip_sd_options_t::sd_option_t::sd_configuration_option_t::~sd_configuration_option_t() {
    _clean_up();
}

void some_ip_sd_options_t::sd_option_t::sd_configuration_option_t::_clean_up() {
    if (m__io__raw_configurations) {
        delete m__io__raw_configurations; m__io__raw_configurations = 0;
    }
    if (m_configurations) {
        delete m_configurations; m_configurations = 0;
    }
}

some_ip_sd_options_t::sd_option_t::sd_ipv4_endpoint_option_t::sd_ipv4_endpoint_option_t(kaitai::kstream* p__io, some_ip_sd_options_t::sd_option_t* p__parent, some_ip_sd_options_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

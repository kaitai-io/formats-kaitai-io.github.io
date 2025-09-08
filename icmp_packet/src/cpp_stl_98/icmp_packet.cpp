// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "icmp_packet.h"
#include "kaitai/exceptions.h"
std::set<icmp_packet_t::icmp_type_enum_t> icmp_packet_t::_build_values_icmp_type_enum_t() {
    std::set<icmp_packet_t::icmp_type_enum_t> _t;
    _t.insert(icmp_packet_t::ICMP_TYPE_ENUM_ECHO_REPLY);
    _t.insert(icmp_packet_t::ICMP_TYPE_ENUM_DESTINATION_UNREACHABLE);
    _t.insert(icmp_packet_t::ICMP_TYPE_ENUM_SOURCE_QUENCH);
    _t.insert(icmp_packet_t::ICMP_TYPE_ENUM_REDIRECT);
    _t.insert(icmp_packet_t::ICMP_TYPE_ENUM_ECHO);
    _t.insert(icmp_packet_t::ICMP_TYPE_ENUM_TIME_EXCEEDED);
    return _t;
}
const std::set<icmp_packet_t::icmp_type_enum_t> icmp_packet_t::_values_icmp_type_enum_t = icmp_packet_t::_build_values_icmp_type_enum_t();
bool icmp_packet_t::_is_defined_icmp_type_enum_t(icmp_packet_t::icmp_type_enum_t v) {
    return icmp_packet_t::_values_icmp_type_enum_t.find(v) != icmp_packet_t::_values_icmp_type_enum_t.end();
}

icmp_packet_t::icmp_packet_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icmp_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_destination_unreachable = 0;
    m_time_exceeded = 0;
    m_echo = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void icmp_packet_t::_read() {
    m_icmp_type = static_cast<icmp_packet_t::icmp_type_enum_t>(m__io->read_u1());
    n_destination_unreachable = true;
    if (icmp_type() == icmp_packet_t::ICMP_TYPE_ENUM_DESTINATION_UNREACHABLE) {
        n_destination_unreachable = false;
        m_destination_unreachable = new destination_unreachable_msg_t(m__io, this, m__root);
    }
    n_time_exceeded = true;
    if (icmp_type() == icmp_packet_t::ICMP_TYPE_ENUM_TIME_EXCEEDED) {
        n_time_exceeded = false;
        m_time_exceeded = new time_exceeded_msg_t(m__io, this, m__root);
    }
    n_echo = true;
    if ( ((icmp_type() == icmp_packet_t::ICMP_TYPE_ENUM_ECHO) || (icmp_type() == icmp_packet_t::ICMP_TYPE_ENUM_ECHO_REPLY)) ) {
        n_echo = false;
        m_echo = new echo_msg_t(m__io, this, m__root);
    }
}

icmp_packet_t::~icmp_packet_t() {
    _clean_up();
}

void icmp_packet_t::_clean_up() {
    if (!n_destination_unreachable) {
        if (m_destination_unreachable) {
            delete m_destination_unreachable; m_destination_unreachable = 0;
        }
    }
    if (!n_time_exceeded) {
        if (m_time_exceeded) {
            delete m_time_exceeded; m_time_exceeded = 0;
        }
    }
    if (!n_echo) {
        if (m_echo) {
            delete m_echo; m_echo = 0;
        }
    }
}
std::set<icmp_packet_t::destination_unreachable_msg_t::destination_unreachable_code_t> icmp_packet_t::destination_unreachable_msg_t::_build_values_destination_unreachable_code_t() {
    std::set<icmp_packet_t::destination_unreachable_msg_t::destination_unreachable_code_t> _t;
    _t.insert(icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_NET_UNREACHABLE);
    _t.insert(icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_HOST_UNREACHABLE);
    _t.insert(icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_PROTOCOL_UNREACHABLE);
    _t.insert(icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_PORT_UNREACHABLE);
    _t.insert(icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_FRAGMENTATION_NEEDED_AND_DF_SET);
    _t.insert(icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_SOURCE_ROUTE_FAILED);
    _t.insert(icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_DST_NET_UNKOWN);
    _t.insert(icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_SDT_HOST_UNKOWN);
    _t.insert(icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_SRC_ISOLATED);
    _t.insert(icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_NET_PROHIBITED_BY_ADMIN);
    _t.insert(icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_HOST_PROHIBITED_BY_ADMIN);
    _t.insert(icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_NET_UNREACHABLE_FOR_TOS);
    _t.insert(icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_HOST_UNREACHABLE_FOR_TOS);
    _t.insert(icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_COMMUNICATION_PROHIBITED_BY_ADMIN);
    _t.insert(icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_HOST_PRECEDENCE_VIOLATION);
    _t.insert(icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_PRECEDENCE_CUTTOFF_IN_EFFECT);
    return _t;
}
const std::set<icmp_packet_t::destination_unreachable_msg_t::destination_unreachable_code_t> icmp_packet_t::destination_unreachable_msg_t::_values_destination_unreachable_code_t = icmp_packet_t::destination_unreachable_msg_t::_build_values_destination_unreachable_code_t();
bool icmp_packet_t::destination_unreachable_msg_t::_is_defined_destination_unreachable_code_t(icmp_packet_t::destination_unreachable_msg_t::destination_unreachable_code_t v) {
    return icmp_packet_t::destination_unreachable_msg_t::_values_destination_unreachable_code_t.find(v) != icmp_packet_t::destination_unreachable_msg_t::_values_destination_unreachable_code_t.end();
}

icmp_packet_t::destination_unreachable_msg_t::destination_unreachable_msg_t(kaitai::kstream* p__io, icmp_packet_t* p__parent, icmp_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void icmp_packet_t::destination_unreachable_msg_t::_read() {
    m_code = static_cast<icmp_packet_t::destination_unreachable_msg_t::destination_unreachable_code_t>(m__io->read_u1());
    m_checksum = m__io->read_u2be();
}

icmp_packet_t::destination_unreachable_msg_t::~destination_unreachable_msg_t() {
    _clean_up();
}

void icmp_packet_t::destination_unreachable_msg_t::_clean_up() {
}

icmp_packet_t::echo_msg_t::echo_msg_t(kaitai::kstream* p__io, icmp_packet_t* p__parent, icmp_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void icmp_packet_t::echo_msg_t::_read() {
    m_code = m__io->read_bytes(1);
    if (!(m_code == std::string("\x00", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00", 1), m_code, m__io, std::string("/types/echo_msg/seq/0"));
    }
    m_checksum = m__io->read_u2be();
    m_identifier = m__io->read_u2be();
    m_seq_num = m__io->read_u2be();
    m_data = m__io->read_bytes_full();
}

icmp_packet_t::echo_msg_t::~echo_msg_t() {
    _clean_up();
}

void icmp_packet_t::echo_msg_t::_clean_up() {
}
std::set<icmp_packet_t::time_exceeded_msg_t::time_exceeded_code_t> icmp_packet_t::time_exceeded_msg_t::_build_values_time_exceeded_code_t() {
    std::set<icmp_packet_t::time_exceeded_msg_t::time_exceeded_code_t> _t;
    _t.insert(icmp_packet_t::time_exceeded_msg_t::TIME_EXCEEDED_CODE_TIME_TO_LIVE_EXCEEDED_IN_TRANSIT);
    _t.insert(icmp_packet_t::time_exceeded_msg_t::TIME_EXCEEDED_CODE_FRAGMENT_REASSEMBLY_TIME_EXCEEDED);
    return _t;
}
const std::set<icmp_packet_t::time_exceeded_msg_t::time_exceeded_code_t> icmp_packet_t::time_exceeded_msg_t::_values_time_exceeded_code_t = icmp_packet_t::time_exceeded_msg_t::_build_values_time_exceeded_code_t();
bool icmp_packet_t::time_exceeded_msg_t::_is_defined_time_exceeded_code_t(icmp_packet_t::time_exceeded_msg_t::time_exceeded_code_t v) {
    return icmp_packet_t::time_exceeded_msg_t::_values_time_exceeded_code_t.find(v) != icmp_packet_t::time_exceeded_msg_t::_values_time_exceeded_code_t.end();
}

icmp_packet_t::time_exceeded_msg_t::time_exceeded_msg_t(kaitai::kstream* p__io, icmp_packet_t* p__parent, icmp_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void icmp_packet_t::time_exceeded_msg_t::_read() {
    m_code = static_cast<icmp_packet_t::time_exceeded_msg_t::time_exceeded_code_t>(m__io->read_u1());
    m_checksum = m__io->read_u2be();
}

icmp_packet_t::time_exceeded_msg_t::~time_exceeded_msg_t() {
    _clean_up();
}

void icmp_packet_t::time_exceeded_msg_t::_clean_up() {
}

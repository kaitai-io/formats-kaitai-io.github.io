// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "icmp_packet.h"
#include "kaitai/exceptions.h"
const std::set<icmp_packet_t::icmp_type_enum_t> icmp_packet_t::_values_icmp_type_enum_t{
    icmp_packet_t::ICMP_TYPE_ENUM_ECHO_REPLY,
    icmp_packet_t::ICMP_TYPE_ENUM_DESTINATION_UNREACHABLE,
    icmp_packet_t::ICMP_TYPE_ENUM_SOURCE_QUENCH,
    icmp_packet_t::ICMP_TYPE_ENUM_REDIRECT,
    icmp_packet_t::ICMP_TYPE_ENUM_ECHO,
    icmp_packet_t::ICMP_TYPE_ENUM_TIME_EXCEEDED,
};
bool icmp_packet_t::_is_defined_icmp_type_enum_t(icmp_packet_t::icmp_type_enum_t v) {
    return icmp_packet_t::_values_icmp_type_enum_t.find(v) != icmp_packet_t::_values_icmp_type_enum_t.end();
}

icmp_packet_t::icmp_packet_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icmp_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_destination_unreachable = nullptr;
    m_time_exceeded = nullptr;
    m_echo = nullptr;
    _read();
}

void icmp_packet_t::_read() {
    m_icmp_type = static_cast<icmp_packet_t::icmp_type_enum_t>(m__io->read_u1());
    n_destination_unreachable = true;
    if (icmp_type() == icmp_packet_t::ICMP_TYPE_ENUM_DESTINATION_UNREACHABLE) {
        n_destination_unreachable = false;
        m_destination_unreachable = std::unique_ptr<destination_unreachable_msg_t>(new destination_unreachable_msg_t(m__io, this, m__root));
    }
    n_time_exceeded = true;
    if (icmp_type() == icmp_packet_t::ICMP_TYPE_ENUM_TIME_EXCEEDED) {
        n_time_exceeded = false;
        m_time_exceeded = std::unique_ptr<time_exceeded_msg_t>(new time_exceeded_msg_t(m__io, this, m__root));
    }
    n_echo = true;
    if ( ((icmp_type() == icmp_packet_t::ICMP_TYPE_ENUM_ECHO) || (icmp_type() == icmp_packet_t::ICMP_TYPE_ENUM_ECHO_REPLY)) ) {
        n_echo = false;
        m_echo = std::unique_ptr<echo_msg_t>(new echo_msg_t(m__io, this, m__root));
    }
}

icmp_packet_t::~icmp_packet_t() {
    _clean_up();
}

void icmp_packet_t::_clean_up() {
    if (!n_destination_unreachable) {
    }
    if (!n_time_exceeded) {
    }
    if (!n_echo) {
    }
}
const std::set<icmp_packet_t::destination_unreachable_msg_t::destination_unreachable_code_t> icmp_packet_t::destination_unreachable_msg_t::_values_destination_unreachable_code_t{
    icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_NET_UNREACHABLE,
    icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_HOST_UNREACHABLE,
    icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_PROTOCOL_UNREACHABLE,
    icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_PORT_UNREACHABLE,
    icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_FRAGMENTATION_NEEDED_AND_DF_SET,
    icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_SOURCE_ROUTE_FAILED,
    icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_DST_NET_UNKOWN,
    icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_SDT_HOST_UNKOWN,
    icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_SRC_ISOLATED,
    icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_NET_PROHIBITED_BY_ADMIN,
    icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_HOST_PROHIBITED_BY_ADMIN,
    icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_NET_UNREACHABLE_FOR_TOS,
    icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_HOST_UNREACHABLE_FOR_TOS,
    icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_COMMUNICATION_PROHIBITED_BY_ADMIN,
    icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_HOST_PRECEDENCE_VIOLATION,
    icmp_packet_t::destination_unreachable_msg_t::DESTINATION_UNREACHABLE_CODE_PRECEDENCE_CUTTOFF_IN_EFFECT,
};
bool icmp_packet_t::destination_unreachable_msg_t::_is_defined_destination_unreachable_code_t(icmp_packet_t::destination_unreachable_msg_t::destination_unreachable_code_t v) {
    return icmp_packet_t::destination_unreachable_msg_t::_values_destination_unreachable_code_t.find(v) != icmp_packet_t::destination_unreachable_msg_t::_values_destination_unreachable_code_t.end();
}

icmp_packet_t::destination_unreachable_msg_t::destination_unreachable_msg_t(kaitai::kstream* p__io, icmp_packet_t* p__parent, icmp_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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
    _read();
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
const std::set<icmp_packet_t::time_exceeded_msg_t::time_exceeded_code_t> icmp_packet_t::time_exceeded_msg_t::_values_time_exceeded_code_t{
    icmp_packet_t::time_exceeded_msg_t::TIME_EXCEEDED_CODE_TIME_TO_LIVE_EXCEEDED_IN_TRANSIT,
    icmp_packet_t::time_exceeded_msg_t::TIME_EXCEEDED_CODE_FRAGMENT_REASSEMBLY_TIME_EXCEEDED,
};
bool icmp_packet_t::time_exceeded_msg_t::_is_defined_time_exceeded_code_t(icmp_packet_t::time_exceeded_msg_t::time_exceeded_code_t v) {
    return icmp_packet_t::time_exceeded_msg_t::_values_time_exceeded_code_t.find(v) != icmp_packet_t::time_exceeded_msg_t::_values_time_exceeded_code_t.end();
}

icmp_packet_t::time_exceeded_msg_t::time_exceeded_msg_t(kaitai::kstream* p__io, icmp_packet_t* p__parent, icmp_packet_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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

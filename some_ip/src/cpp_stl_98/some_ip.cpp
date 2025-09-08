// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "some_ip.h"

some_ip_t::some_ip_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, some_ip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header = 0;
    m__io__raw_payload = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void some_ip_t::_read() {
    m_header = new header_t(m__io, this, m__root);
    n_payload = true;
    switch (header()->message_id()->value()) {
    case 4294934784UL: {
        n_payload = false;
        m__raw_payload = m__io->read_bytes(header()->length() - 8);
        m__io__raw_payload = new kaitai::kstream(m__raw_payload);
        m_payload = new some_ip_sd_t(m__io__raw_payload);
        break;
    }
    default: {
        m__raw_payload = m__io->read_bytes(header()->length() - 8);
        break;
    }
    }
}

some_ip_t::~some_ip_t() {
    _clean_up();
}

void some_ip_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (!n_payload) {
        if (m__io__raw_payload) {
            delete m__io__raw_payload; m__io__raw_payload = 0;
        }
        if (m_payload) {
            delete m_payload; m_payload = 0;
        }
    }
}
std::set<some_ip_t::header_t::message_type_enum_t> some_ip_t::header_t::_build_values_message_type_enum_t() {
    std::set<some_ip_t::header_t::message_type_enum_t> _t;
    _t.insert(some_ip_t::header_t::MESSAGE_TYPE_ENUM_REQUEST);
    _t.insert(some_ip_t::header_t::MESSAGE_TYPE_ENUM_REQUEST_NO_RETURN);
    _t.insert(some_ip_t::header_t::MESSAGE_TYPE_ENUM_NOTIFICATION);
    _t.insert(some_ip_t::header_t::MESSAGE_TYPE_ENUM_REQUEST_ACK);
    _t.insert(some_ip_t::header_t::MESSAGE_TYPE_ENUM_REQUEST_NO_RETURN_ACK);
    _t.insert(some_ip_t::header_t::MESSAGE_TYPE_ENUM_NOTIFICATION_ACK);
    _t.insert(some_ip_t::header_t::MESSAGE_TYPE_ENUM_RESPONSE);
    _t.insert(some_ip_t::header_t::MESSAGE_TYPE_ENUM_ERROR);
    _t.insert(some_ip_t::header_t::MESSAGE_TYPE_ENUM_RESPONSE_ACK);
    _t.insert(some_ip_t::header_t::MESSAGE_TYPE_ENUM_ERROR_ACK);
    return _t;
}
const std::set<some_ip_t::header_t::message_type_enum_t> some_ip_t::header_t::_values_message_type_enum_t = some_ip_t::header_t::_build_values_message_type_enum_t();
bool some_ip_t::header_t::_is_defined_message_type_enum_t(some_ip_t::header_t::message_type_enum_t v) {
    return some_ip_t::header_t::_values_message_type_enum_t.find(v) != some_ip_t::header_t::_values_message_type_enum_t.end();
}
std::set<some_ip_t::header_t::return_code_enum_t> some_ip_t::header_t::_build_values_return_code_enum_t() {
    std::set<some_ip_t::header_t::return_code_enum_t> _t;
    _t.insert(some_ip_t::header_t::RETURN_CODE_ENUM_OK);
    _t.insert(some_ip_t::header_t::RETURN_CODE_ENUM_NOT_OK);
    _t.insert(some_ip_t::header_t::RETURN_CODE_ENUM_UNKNOWN_SERVICE);
    _t.insert(some_ip_t::header_t::RETURN_CODE_ENUM_UNKNOWN_METHOD);
    _t.insert(some_ip_t::header_t::RETURN_CODE_ENUM_NOT_READY);
    _t.insert(some_ip_t::header_t::RETURN_CODE_ENUM_NOT_REACHABLE);
    _t.insert(some_ip_t::header_t::RETURN_CODE_ENUM_TIME_OUT);
    _t.insert(some_ip_t::header_t::RETURN_CODE_ENUM_WRONG_PROTOCOL_VERSION);
    _t.insert(some_ip_t::header_t::RETURN_CODE_ENUM_WRONG_INTERFACE_VERSION);
    _t.insert(some_ip_t::header_t::RETURN_CODE_ENUM_MALFORMED_MESSAGE);
    _t.insert(some_ip_t::header_t::RETURN_CODE_ENUM_WRONG_MESSAGE_TYPE);
    return _t;
}
const std::set<some_ip_t::header_t::return_code_enum_t> some_ip_t::header_t::_values_return_code_enum_t = some_ip_t::header_t::_build_values_return_code_enum_t();
bool some_ip_t::header_t::_is_defined_return_code_enum_t(some_ip_t::header_t::return_code_enum_t v) {
    return some_ip_t::header_t::_values_return_code_enum_t.find(v) != some_ip_t::header_t::_values_return_code_enum_t.end();
}

some_ip_t::header_t::header_t(kaitai::kstream* p__io, some_ip_t* p__parent, some_ip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_message_id = 0;
    m__io__raw_message_id = 0;
    m_request_id = 0;
    m__io__raw_request_id = 0;
    f_is_valid_service_discovery = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void some_ip_t::header_t::_read() {
    m__raw_message_id = m__io->read_bytes(4);
    m__io__raw_message_id = new kaitai::kstream(m__raw_message_id);
    m_message_id = new message_id_t(m__io__raw_message_id, this, m__root);
    m_length = m__io->read_u4be();
    m__raw_request_id = m__io->read_bytes(4);
    m__io__raw_request_id = new kaitai::kstream(m__raw_request_id);
    m_request_id = new request_id_t(m__io__raw_request_id, this, m__root);
    m_protocol_version = m__io->read_u1();
    m_interface_version = m__io->read_u1();
    m_message_type = static_cast<some_ip_t::header_t::message_type_enum_t>(m__io->read_u1());
    m_return_code = static_cast<some_ip_t::header_t::return_code_enum_t>(m__io->read_u1());
}

some_ip_t::header_t::~header_t() {
    _clean_up();
}

void some_ip_t::header_t::_clean_up() {
    if (m__io__raw_message_id) {
        delete m__io__raw_message_id; m__io__raw_message_id = 0;
    }
    if (m_message_id) {
        delete m_message_id; m_message_id = 0;
    }
    if (m__io__raw_request_id) {
        delete m__io__raw_request_id; m__io__raw_request_id = 0;
    }
    if (m_request_id) {
        delete m_request_id; m_request_id = 0;
    }
}

some_ip_t::header_t::message_id_t::message_id_t(kaitai::kstream* p__io, some_ip_t::header_t* p__parent, some_ip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_value = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void some_ip_t::header_t::message_id_t::_read() {
    m_service_id = m__io->read_u2be();
    m_sub_id = m__io->read_bits_int_be(1);
    n_method_id = true;
    if (sub_id() == false) {
        n_method_id = false;
        m_method_id = m__io->read_bits_int_be(15);
    }
    n_event_id = true;
    if (sub_id() == true) {
        n_event_id = false;
        m_event_id = m__io->read_bits_int_be(15);
    }
}

some_ip_t::header_t::message_id_t::~message_id_t() {
    _clean_up();
}

void some_ip_t::header_t::message_id_t::_clean_up() {
    if (!n_method_id) {
    }
    if (!n_event_id) {
    }
    if (f_value) {
    }
}

uint32_t some_ip_t::header_t::message_id_t::value() {
    if (f_value)
        return m_value;
    f_value = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_value = m__io->read_u4be();
    m__io->seek(_pos);
    return m_value;
}

some_ip_t::header_t::request_id_t::request_id_t(kaitai::kstream* p__io, some_ip_t::header_t* p__parent, some_ip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_value = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void some_ip_t::header_t::request_id_t::_read() {
    m_client_id = m__io->read_u2be();
    m_session_id = m__io->read_u2be();
}

some_ip_t::header_t::request_id_t::~request_id_t() {
    _clean_up();
}

void some_ip_t::header_t::request_id_t::_clean_up() {
    if (f_value) {
    }
}

uint32_t some_ip_t::header_t::request_id_t::value() {
    if (f_value)
        return m_value;
    f_value = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_value = m__io->read_u4be();
    m__io->seek(_pos);
    return m_value;
}

bool some_ip_t::header_t::is_valid_service_discovery() {
    if (f_is_valid_service_discovery)
        return m_is_valid_service_discovery;
    f_is_valid_service_discovery = true;
    m_is_valid_service_discovery =  ((message_id()->value() == 4294934784UL) && (protocol_version() == 1) && (interface_version() == 1) && (message_type() == some_ip_t::header_t::MESSAGE_TYPE_ENUM_NOTIFICATION) && (return_code() == some_ip_t::header_t::RETURN_CODE_ENUM_OK)) ;
    return m_is_valid_service_discovery;
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "some_ip.h"

some_ip_t::some_ip_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, some_ip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = nullptr;
    m__io__raw_payload = nullptr;
    _read();
}

void some_ip_t::_read() {
    m_header = std::unique_ptr<header_t>(new header_t(m__io, this, m__root));
    n_payload = true;
    switch (header()->message_id()->value()) {
    case 4294934784UL: {
        n_payload = false;
        m__raw_payload = m__io->read_bytes((header()->length() - 8));
        m__io__raw_payload = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_payload));
        m_payload = std::unique_ptr<some_ip_sd_t>(new some_ip_sd_t(m__io__raw_payload.get()));
        break;
    }
    default: {
        m__raw_payload = m__io->read_bytes((header()->length() - 8));
        break;
    }
    }
}

some_ip_t::~some_ip_t() {
    _clean_up();
}

void some_ip_t::_clean_up() {
    if (!n_payload) {
    }
}

some_ip_t::header_t::header_t(kaitai::kstream* p__io, some_ip_t* p__parent, some_ip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_message_id = nullptr;
    m__io__raw_message_id = nullptr;
    m_request_id = nullptr;
    m__io__raw_request_id = nullptr;
    f_is_valid_service_discovery = false;
    _read();
}

void some_ip_t::header_t::_read() {
    m__raw_message_id = m__io->read_bytes(4);
    m__io__raw_message_id = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_message_id));
    m_message_id = std::unique_ptr<message_id_t>(new message_id_t(m__io__raw_message_id.get(), this, m__root));
    m_length = m__io->read_u4be();
    m__raw_request_id = m__io->read_bytes(4);
    m__io__raw_request_id = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_request_id));
    m_request_id = std::unique_ptr<request_id_t>(new request_id_t(m__io__raw_request_id.get(), this, m__root));
    m_protocol_version = m__io->read_u1();
    m_interface_version = m__io->read_u1();
    m_message_type = static_cast<some_ip_t::header_t::message_type_enum_t>(m__io->read_u1());
    m_return_code = static_cast<some_ip_t::header_t::return_code_enum_t>(m__io->read_u1());
}

some_ip_t::header_t::~header_t() {
    _clean_up();
}

void some_ip_t::header_t::_clean_up() {
}

some_ip_t::header_t::message_id_t::message_id_t(kaitai::kstream* p__io, some_ip_t::header_t* p__parent, some_ip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_value = false;
    _read();
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
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_value = m__io->read_u4be();
    m__io->seek(_pos);
    f_value = true;
    return m_value;
}

some_ip_t::header_t::request_id_t::request_id_t(kaitai::kstream* p__io, some_ip_t::header_t* p__parent, some_ip_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_value = false;
    _read();
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
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_value = m__io->read_u4be();
    m__io->seek(_pos);
    f_value = true;
    return m_value;
}

bool some_ip_t::header_t::is_valid_service_discovery() {
    if (f_is_valid_service_discovery)
        return m_is_valid_service_discovery;
    m_is_valid_service_discovery =  ((message_id()->value() == 4294934784UL) && (protocol_version() == 1) && (interface_version() == 1) && (message_type() == some_ip_t::header_t::MESSAGE_TYPE_ENUM_NOTIFICATION) && (return_code() == some_ip_t::header_t::RETURN_CODE_ENUM_OK)) ;
    f_is_valid_service_discovery = true;
    return m_is_valid_service_discovery;
}

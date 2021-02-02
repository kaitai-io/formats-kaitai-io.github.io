// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "dime_message.h"

dime_message_t::dime_message_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, dime_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_records = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void dime_message_t::_read() {
    m_records = new std::vector<record_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_records->push_back(new record_t(m__io, this, m__root));
            i++;
        }
    }
}

dime_message_t::~dime_message_t() {
    _clean_up();
}

void dime_message_t::_clean_up() {
    if (m_records) {
        for (std::vector<record_t*>::iterator it = m_records->begin(); it != m_records->end(); ++it) {
            delete *it;
        }
        delete m_records; m_records = 0;
    }
}

dime_message_t::padding_t::padding_t(kaitai::kstream* p__io, dime_message_t::record_t* p__parent, dime_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void dime_message_t::padding_t::_read() {
    m_boundary_padding = m__io->read_bytes(kaitai::kstream::mod(-(_io()->pos()), 4));
}

dime_message_t::padding_t::~padding_t() {
    _clean_up();
}

void dime_message_t::padding_t::_clean_up() {
}

dime_message_t::option_field_t::option_field_t(kaitai::kstream* p__io, dime_message_t::record_t* p__parent, dime_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_option_elements = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void dime_message_t::option_field_t::_read() {
    m_option_elements = new std::vector<option_element_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_option_elements->push_back(new option_element_t(m__io, this, m__root));
            i++;
        }
    }
}

dime_message_t::option_field_t::~option_field_t() {
    _clean_up();
}

void dime_message_t::option_field_t::_clean_up() {
    if (m_option_elements) {
        for (std::vector<option_element_t*>::iterator it = m_option_elements->begin(); it != m_option_elements->end(); ++it) {
            delete *it;
        }
        delete m_option_elements; m_option_elements = 0;
    }
}

dime_message_t::option_element_t::option_element_t(kaitai::kstream* p__io, dime_message_t::option_field_t* p__parent, dime_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void dime_message_t::option_element_t::_read() {
    m_element_format = m__io->read_u2be();
    m_len_element = m__io->read_u2be();
    m_element_data = m__io->read_bytes(len_element());
}

dime_message_t::option_element_t::~option_element_t() {
    _clean_up();
}

void dime_message_t::option_element_t::_clean_up() {
}

dime_message_t::record_t::record_t(kaitai::kstream* p__io, dime_message_t* p__parent, dime_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_options = 0;
    m__io__raw_options = 0;
    m_options_padding = 0;
    m_id_padding = 0;
    m_type_padding = 0;
    m_data_padding = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void dime_message_t::record_t::_read() {
    m_version = m__io->read_bits_int_be(5);
    m_is_first_record = m__io->read_bits_int_be(1);
    m_is_last_record = m__io->read_bits_int_be(1);
    m_is_chunk_record = m__io->read_bits_int_be(1);
    m_type_format = static_cast<dime_message_t::type_formats_t>(m__io->read_bits_int_be(4));
    m_reserved = m__io->read_bits_int_be(4);
    m__io->align_to_byte();
    m_len_options = m__io->read_u2be();
    m_len_id = m__io->read_u2be();
    m_len_type = m__io->read_u2be();
    m_len_data = m__io->read_u4be();
    m__raw_options = m__io->read_bytes(len_options());
    m__io__raw_options = new kaitai::kstream(m__raw_options);
    m_options = new option_field_t(m__io__raw_options, this, m__root);
    m_options_padding = new padding_t(m__io, this, m__root);
    m_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_id()), std::string("ASCII"));
    m_id_padding = new padding_t(m__io, this, m__root);
    m_type = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_type()), std::string("ASCII"));
    m_type_padding = new padding_t(m__io, this, m__root);
    m_data = m__io->read_bytes(len_data());
    m_data_padding = new padding_t(m__io, this, m__root);
}

dime_message_t::record_t::~record_t() {
    _clean_up();
}

void dime_message_t::record_t::_clean_up() {
    if (m__io__raw_options) {
        delete m__io__raw_options; m__io__raw_options = 0;
    }
    if (m_options) {
        delete m_options; m_options = 0;
    }
    if (m_options_padding) {
        delete m_options_padding; m_options_padding = 0;
    }
    if (m_id_padding) {
        delete m_id_padding; m_id_padding = 0;
    }
    if (m_type_padding) {
        delete m_type_padding; m_type_padding = 0;
    }
    if (m_data_padding) {
        delete m_data_padding; m_data_padding = 0;
    }
}

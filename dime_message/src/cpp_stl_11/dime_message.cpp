// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "dime_message.h"
const std::set<dime_message_t::type_formats_t> dime_message_t::_values_type_formats_t{
    dime_message_t::TYPE_FORMATS_UNCHANGED,
    dime_message_t::TYPE_FORMATS_MEDIA_TYPE,
    dime_message_t::TYPE_FORMATS_ABSOLUTE_URI,
    dime_message_t::TYPE_FORMATS_UNKNOWN,
    dime_message_t::TYPE_FORMATS_NONE,
};
bool dime_message_t::_is_defined_type_formats_t(dime_message_t::type_formats_t v) {
    return dime_message_t::_values_type_formats_t.find(v) != dime_message_t::_values_type_formats_t.end();
}

dime_message_t::dime_message_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, dime_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_records = nullptr;
    _read();
}

void dime_message_t::_read() {
    m_records = std::unique_ptr<std::vector<std::unique_ptr<record_t>>>(new std::vector<std::unique_ptr<record_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_records->push_back(std::move(std::unique_ptr<record_t>(new record_t(m__io, this, m__root))));
            i++;
        }
    }
}

dime_message_t::~dime_message_t() {
    _clean_up();
}

void dime_message_t::_clean_up() {
}

dime_message_t::option_element_t::option_element_t(kaitai::kstream* p__io, dime_message_t::option_field_t* p__parent, dime_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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

dime_message_t::option_field_t::option_field_t(kaitai::kstream* p__io, dime_message_t::record_t* p__parent, dime_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_option_elements = nullptr;
    _read();
}

void dime_message_t::option_field_t::_read() {
    m_option_elements = std::unique_ptr<std::vector<std::unique_ptr<option_element_t>>>(new std::vector<std::unique_ptr<option_element_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_option_elements->push_back(std::move(std::unique_ptr<option_element_t>(new option_element_t(m__io, this, m__root))));
            i++;
        }
    }
}

dime_message_t::option_field_t::~option_field_t() {
    _clean_up();
}

void dime_message_t::option_field_t::_clean_up() {
}

dime_message_t::padding_t::padding_t(kaitai::kstream* p__io, dime_message_t::record_t* p__parent, dime_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void dime_message_t::padding_t::_read() {
    m_boundary_padding = m__io->read_bytes(kaitai::kstream::mod(-(_io()->pos()), 4));
}

dime_message_t::padding_t::~padding_t() {
    _clean_up();
}

void dime_message_t::padding_t::_clean_up() {
}

dime_message_t::record_t::record_t(kaitai::kstream* p__io, dime_message_t* p__parent, dime_message_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_options = nullptr;
    m__io__raw_options = nullptr;
    m_options_padding = nullptr;
    m_id_padding = nullptr;
    m_type_padding = nullptr;
    m_data_padding = nullptr;
    _read();
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
    m__io__raw_options = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_options));
    m_options = std::unique_ptr<option_field_t>(new option_field_t(m__io__raw_options.get(), this, m__root));
    m_options_padding = std::unique_ptr<padding_t>(new padding_t(m__io, this, m__root));
    m_id = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_id()), "ASCII");
    m_id_padding = std::unique_ptr<padding_t>(new padding_t(m__io, this, m__root));
    m_type = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_type()), "ASCII");
    m_type_padding = std::unique_ptr<padding_t>(new padding_t(m__io, this, m__root));
    m_data = m__io->read_bytes(len_data());
    m_data_padding = std::unique_ptr<padding_t>(new padding_t(m__io, this, m__root));
}

dime_message_t::record_t::~record_t() {
    _clean_up();
}

void dime_message_t::record_t::_clean_up() {
}

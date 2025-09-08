// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "dcmp_0.h"

dcmp_0_t::dcmp_0_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, dcmp_0_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_chunks = nullptr;
    _read();
}

void dcmp_0_t::_read() {
    m_chunks = std::unique_ptr<std::vector<std::unique_ptr<chunk_t>>>(new std::vector<std::unique_ptr<chunk_t>>());
    {
        int i = 0;
        chunk_t* _;
        do {
            _ = new chunk_t(m__io, this, m__root);
            m_chunks->push_back(std::move(std::unique_ptr<chunk_t>(_)));
            i++;
        } while (!(_->tag() == 255));
    }
}

dcmp_0_t::~dcmp_0_t() {
    _clean_up();
}

void dcmp_0_t::_clean_up() {
}
const std::set<dcmp_0_t::chunk_t::tag_kind_t> dcmp_0_t::chunk_t::_values_tag_kind_t{
    dcmp_0_t::chunk_t::TAG_KIND_INVALID,
    dcmp_0_t::chunk_t::TAG_KIND_LITERAL,
    dcmp_0_t::chunk_t::TAG_KIND_BACKREFERENCE,
    dcmp_0_t::chunk_t::TAG_KIND_TABLE_LOOKUP,
    dcmp_0_t::chunk_t::TAG_KIND_EXTENDED,
    dcmp_0_t::chunk_t::TAG_KIND_END,
};
bool dcmp_0_t::chunk_t::_is_defined_tag_kind_t(dcmp_0_t::chunk_t::tag_kind_t v) {
    return dcmp_0_t::chunk_t::_values_tag_kind_t.find(v) != dcmp_0_t::chunk_t::_values_tag_kind_t.end();
}

dcmp_0_t::chunk_t::chunk_t(kaitai::kstream* p__io, dcmp_0_t* p__parent, dcmp_0_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void dcmp_0_t::chunk_t::_read() {
    m_tag = m__io->read_u1();
    n_body = true;
    switch ((( ((tag() >= 0) && (tag() <= 31)) ) ? (dcmp_0_t::chunk_t::TAG_KIND_LITERAL) : ((( ((tag() >= 32) && (tag() <= 74)) ) ? (dcmp_0_t::chunk_t::TAG_KIND_BACKREFERENCE) : ((( ((tag() >= 75) && (tag() <= 253)) ) ? (dcmp_0_t::chunk_t::TAG_KIND_TABLE_LOOKUP) : (((tag() == 254) ? (dcmp_0_t::chunk_t::TAG_KIND_EXTENDED) : (((tag() == 255) ? (dcmp_0_t::chunk_t::TAG_KIND_END) : (dcmp_0_t::chunk_t::TAG_KIND_INVALID))))))))))) {
    case dcmp_0_t::chunk_t::TAG_KIND_BACKREFERENCE: {
        n_body = false;
        m_body = std::unique_ptr<backreference_body_t>(new backreference_body_t(tag(), m__io, this, m__root));
        break;
    }
    case dcmp_0_t::chunk_t::TAG_KIND_END: {
        n_body = false;
        m_body = std::unique_ptr<end_body_t>(new end_body_t(m__io, this, m__root));
        break;
    }
    case dcmp_0_t::chunk_t::TAG_KIND_EXTENDED: {
        n_body = false;
        m_body = std::unique_ptr<extended_body_t>(new extended_body_t(m__io, this, m__root));
        break;
    }
    case dcmp_0_t::chunk_t::TAG_KIND_LITERAL: {
        n_body = false;
        m_body = std::unique_ptr<literal_body_t>(new literal_body_t(tag(), m__io, this, m__root));
        break;
    }
    case dcmp_0_t::chunk_t::TAG_KIND_TABLE_LOOKUP: {
        n_body = false;
        m_body = std::unique_ptr<table_lookup_body_t>(new table_lookup_body_t(tag(), m__io, this, m__root));
        break;
    }
    }
}

dcmp_0_t::chunk_t::~chunk_t() {
    _clean_up();
}

void dcmp_0_t::chunk_t::_clean_up() {
    if (!n_body) {
    }
}

dcmp_0_t::chunk_t::backreference_body_t::backreference_body_t(uint8_t p_tag, kaitai::kstream* p__io, dcmp_0_t::chunk_t* p__parent, dcmp_0_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_tag = p_tag;
    f_index = false;
    f_index_in_tag = false;
    f_index_separate = false;
    f_is_index_separate = false;
    _read();
}

void dcmp_0_t::chunk_t::backreference_body_t::_read() {
    n_index_separate_minus = true;
    if (is_index_separate()) {
        n_index_separate_minus = false;
        n_index_separate_minus = true;
        switch (tag()) {
        case 32: {
            n_index_separate_minus = false;
            m_index_separate_minus = m__io->read_u1();
            break;
        }
        case 33: {
            n_index_separate_minus = false;
            m_index_separate_minus = m__io->read_u1();
            break;
        }
        case 34: {
            n_index_separate_minus = false;
            m_index_separate_minus = m__io->read_u2be();
            break;
        }
        }
    }
}

dcmp_0_t::chunk_t::backreference_body_t::~backreference_body_t() {
    _clean_up();
}

void dcmp_0_t::chunk_t::backreference_body_t::_clean_up() {
    if (!n_index_separate_minus) {
    }
}

int32_t dcmp_0_t::chunk_t::backreference_body_t::index() {
    if (f_index)
        return m_index;
    f_index = true;
    m_index = ((is_index_separate()) ? (index_separate()) : (index_in_tag()));
    return m_index;
}

int32_t dcmp_0_t::chunk_t::backreference_body_t::index_in_tag() {
    if (f_index_in_tag)
        return m_index_in_tag;
    f_index_in_tag = true;
    m_index_in_tag = tag() - 35;
    return m_index_in_tag;
}

int32_t dcmp_0_t::chunk_t::backreference_body_t::index_separate() {
    if (f_index_separate)
        return m_index_separate;
    f_index_separate = true;
    n_index_separate = true;
    if (is_index_separate()) {
        n_index_separate = false;
        m_index_separate = (index_separate_minus() + 40) + ((tag() == 33) ? (256) : (0));
    }
    return m_index_separate;
}

bool dcmp_0_t::chunk_t::backreference_body_t::is_index_separate() {
    if (f_is_index_separate)
        return m_is_index_separate;
    f_is_index_separate = true;
    m_is_index_separate =  ((tag() >= 32) && (tag() <= 34)) ;
    return m_is_index_separate;
}

dcmp_0_t::chunk_t::end_body_t::end_body_t(kaitai::kstream* p__io, dcmp_0_t::chunk_t* p__parent, dcmp_0_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void dcmp_0_t::chunk_t::end_body_t::_read() {
}

dcmp_0_t::chunk_t::end_body_t::~end_body_t() {
    _clean_up();
}

void dcmp_0_t::chunk_t::end_body_t::_clean_up() {
}

dcmp_0_t::chunk_t::extended_body_t::extended_body_t(kaitai::kstream* p__io, dcmp_0_t::chunk_t* p__parent, dcmp_0_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void dcmp_0_t::chunk_t::extended_body_t::_read() {
    m_tag = m__io->read_u1();
    n_body = true;
    switch (tag()) {
    case 0: {
        n_body = false;
        m_body = std::unique_ptr<jump_table_body_t>(new jump_table_body_t(m__io, this, m__root));
        break;
    }
    case 2: {
        n_body = false;
        m_body = std::unique_ptr<repeat_body_t>(new repeat_body_t(tag(), m__io, this, m__root));
        break;
    }
    case 3: {
        n_body = false;
        m_body = std::unique_ptr<repeat_body_t>(new repeat_body_t(tag(), m__io, this, m__root));
        break;
    }
    case 4: {
        n_body = false;
        m_body = std::unique_ptr<delta_encoding_16_bit_body_t>(new delta_encoding_16_bit_body_t(m__io, this, m__root));
        break;
    }
    case 6: {
        n_body = false;
        m_body = std::unique_ptr<delta_encoding_32_bit_body_t>(new delta_encoding_32_bit_body_t(m__io, this, m__root));
        break;
    }
    }
}

dcmp_0_t::chunk_t::extended_body_t::~extended_body_t() {
    _clean_up();
}

void dcmp_0_t::chunk_t::extended_body_t::_clean_up() {
    if (!n_body) {
    }
}

dcmp_0_t::chunk_t::extended_body_t::delta_encoding_16_bit_body_t::delta_encoding_16_bit_body_t(kaitai::kstream* p__io, dcmp_0_t::chunk_t::extended_body_t* p__parent, dcmp_0_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_first_value_raw = nullptr;
    m_num_deltas_raw = nullptr;
    m_deltas = nullptr;
    f_first_value = false;
    f_num_deltas = false;
    _read();
}

void dcmp_0_t::chunk_t::extended_body_t::delta_encoding_16_bit_body_t::_read() {
    m_first_value_raw = std::unique_ptr<dcmp_variable_length_integer_t>(new dcmp_variable_length_integer_t(m__io));
    m_num_deltas_raw = std::unique_ptr<dcmp_variable_length_integer_t>(new dcmp_variable_length_integer_t(m__io));
    m_deltas = std::unique_ptr<std::vector<int8_t>>(new std::vector<int8_t>());
    const int l_deltas = num_deltas();
    for (int i = 0; i < l_deltas; i++) {
        m_deltas->push_back(std::move(m__io->read_s1()));
    }
}

dcmp_0_t::chunk_t::extended_body_t::delta_encoding_16_bit_body_t::~delta_encoding_16_bit_body_t() {
    _clean_up();
}

void dcmp_0_t::chunk_t::extended_body_t::delta_encoding_16_bit_body_t::_clean_up() {
}

int32_t dcmp_0_t::chunk_t::extended_body_t::delta_encoding_16_bit_body_t::first_value() {
    if (f_first_value)
        return m_first_value;
    f_first_value = true;
    m_first_value = first_value_raw()->value();
    return m_first_value;
}

int32_t dcmp_0_t::chunk_t::extended_body_t::delta_encoding_16_bit_body_t::num_deltas() {
    if (f_num_deltas)
        return m_num_deltas;
    f_num_deltas = true;
    m_num_deltas = num_deltas_raw()->value();
    return m_num_deltas;
}

dcmp_0_t::chunk_t::extended_body_t::delta_encoding_32_bit_body_t::delta_encoding_32_bit_body_t(kaitai::kstream* p__io, dcmp_0_t::chunk_t::extended_body_t* p__parent, dcmp_0_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_first_value_raw = nullptr;
    m_num_deltas_raw = nullptr;
    m_deltas_raw = nullptr;
    f_first_value = false;
    f_num_deltas = false;
    _read();
}

void dcmp_0_t::chunk_t::extended_body_t::delta_encoding_32_bit_body_t::_read() {
    m_first_value_raw = std::unique_ptr<dcmp_variable_length_integer_t>(new dcmp_variable_length_integer_t(m__io));
    m_num_deltas_raw = std::unique_ptr<dcmp_variable_length_integer_t>(new dcmp_variable_length_integer_t(m__io));
    m_deltas_raw = std::unique_ptr<std::vector<std::unique_ptr<dcmp_variable_length_integer_t>>>(new std::vector<std::unique_ptr<dcmp_variable_length_integer_t>>());
    const int l_deltas_raw = num_deltas();
    for (int i = 0; i < l_deltas_raw; i++) {
        m_deltas_raw->push_back(std::move(std::unique_ptr<dcmp_variable_length_integer_t>(new dcmp_variable_length_integer_t(m__io))));
    }
}

dcmp_0_t::chunk_t::extended_body_t::delta_encoding_32_bit_body_t::~delta_encoding_32_bit_body_t() {
    _clean_up();
}

void dcmp_0_t::chunk_t::extended_body_t::delta_encoding_32_bit_body_t::_clean_up() {
}

int32_t dcmp_0_t::chunk_t::extended_body_t::delta_encoding_32_bit_body_t::first_value() {
    if (f_first_value)
        return m_first_value;
    f_first_value = true;
    m_first_value = first_value_raw()->value();
    return m_first_value;
}

int32_t dcmp_0_t::chunk_t::extended_body_t::delta_encoding_32_bit_body_t::num_deltas() {
    if (f_num_deltas)
        return m_num_deltas;
    f_num_deltas = true;
    m_num_deltas = num_deltas_raw()->value();
    return m_num_deltas;
}

dcmp_0_t::chunk_t::extended_body_t::jump_table_body_t::jump_table_body_t(kaitai::kstream* p__io, dcmp_0_t::chunk_t::extended_body_t* p__parent, dcmp_0_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_segment_number_raw = nullptr;
    m_num_addresses_raw = nullptr;
    m_addresses_raw = nullptr;
    f_num_addresses = false;
    f_segment_number = false;
    _read();
}

void dcmp_0_t::chunk_t::extended_body_t::jump_table_body_t::_read() {
    m_segment_number_raw = std::unique_ptr<dcmp_variable_length_integer_t>(new dcmp_variable_length_integer_t(m__io));
    m_num_addresses_raw = std::unique_ptr<dcmp_variable_length_integer_t>(new dcmp_variable_length_integer_t(m__io));
    m_addresses_raw = std::unique_ptr<std::vector<std::unique_ptr<dcmp_variable_length_integer_t>>>(new std::vector<std::unique_ptr<dcmp_variable_length_integer_t>>());
    const int l_addresses_raw = num_addresses();
    for (int i = 0; i < l_addresses_raw; i++) {
        m_addresses_raw->push_back(std::move(std::unique_ptr<dcmp_variable_length_integer_t>(new dcmp_variable_length_integer_t(m__io))));
    }
}

dcmp_0_t::chunk_t::extended_body_t::jump_table_body_t::~jump_table_body_t() {
    _clean_up();
}

void dcmp_0_t::chunk_t::extended_body_t::jump_table_body_t::_clean_up() {
}

int32_t dcmp_0_t::chunk_t::extended_body_t::jump_table_body_t::num_addresses() {
    if (f_num_addresses)
        return m_num_addresses;
    f_num_addresses = true;
    m_num_addresses = num_addresses_raw()->value();
    return m_num_addresses;
}

int32_t dcmp_0_t::chunk_t::extended_body_t::jump_table_body_t::segment_number() {
    if (f_segment_number)
        return m_segment_number;
    f_segment_number = true;
    m_segment_number = segment_number_raw()->value();
    return m_segment_number;
}

dcmp_0_t::chunk_t::extended_body_t::repeat_body_t::repeat_body_t(uint8_t p_tag, kaitai::kstream* p__io, dcmp_0_t::chunk_t::extended_body_t* p__parent, dcmp_0_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_tag = p_tag;
    m_to_repeat_raw = nullptr;
    m_repeat_count_m1_raw = nullptr;
    f_byte_count = false;
    f_repeat_count = false;
    f_repeat_count_m1 = false;
    f_to_repeat = false;
    _read();
}

void dcmp_0_t::chunk_t::extended_body_t::repeat_body_t::_read() {
    m_to_repeat_raw = std::unique_ptr<dcmp_variable_length_integer_t>(new dcmp_variable_length_integer_t(m__io));
    m_repeat_count_m1_raw = std::unique_ptr<dcmp_variable_length_integer_t>(new dcmp_variable_length_integer_t(m__io));
}

dcmp_0_t::chunk_t::extended_body_t::repeat_body_t::~repeat_body_t() {
    _clean_up();
}

void dcmp_0_t::chunk_t::extended_body_t::repeat_body_t::_clean_up() {
}

int32_t dcmp_0_t::chunk_t::extended_body_t::repeat_body_t::byte_count() {
    if (f_byte_count)
        return m_byte_count;
    f_byte_count = true;
    m_byte_count = ((tag() == 2) ? (1) : (((tag() == 3) ? (2) : (-1))));
    return m_byte_count;
}

int32_t dcmp_0_t::chunk_t::extended_body_t::repeat_body_t::repeat_count() {
    if (f_repeat_count)
        return m_repeat_count;
    f_repeat_count = true;
    m_repeat_count = repeat_count_m1() + 1;
    return m_repeat_count;
}

int32_t dcmp_0_t::chunk_t::extended_body_t::repeat_body_t::repeat_count_m1() {
    if (f_repeat_count_m1)
        return m_repeat_count_m1;
    f_repeat_count_m1 = true;
    m_repeat_count_m1 = repeat_count_m1_raw()->value();
    return m_repeat_count_m1;
}

int32_t dcmp_0_t::chunk_t::extended_body_t::repeat_body_t::to_repeat() {
    if (f_to_repeat)
        return m_to_repeat;
    f_to_repeat = true;
    m_to_repeat = to_repeat_raw()->value();
    return m_to_repeat;
}

dcmp_0_t::chunk_t::literal_body_t::literal_body_t(uint8_t p_tag, kaitai::kstream* p__io, dcmp_0_t::chunk_t* p__parent, dcmp_0_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_tag = p_tag;
    f_do_store = false;
    f_is_len_literal_div2_separate = false;
    f_len_literal = false;
    f_len_literal_div2 = false;
    f_len_literal_div2_in_tag = false;
    _read();
}

void dcmp_0_t::chunk_t::literal_body_t::_read() {
    n_len_literal_div2_separate = true;
    if (is_len_literal_div2_separate()) {
        n_len_literal_div2_separate = false;
        m_len_literal_div2_separate = m__io->read_u1();
    }
    m_literal = m__io->read_bytes(len_literal());
}

dcmp_0_t::chunk_t::literal_body_t::~literal_body_t() {
    _clean_up();
}

void dcmp_0_t::chunk_t::literal_body_t::_clean_up() {
    if (!n_len_literal_div2_separate) {
    }
}

bool dcmp_0_t::chunk_t::literal_body_t::do_store() {
    if (f_do_store)
        return m_do_store;
    f_do_store = true;
    m_do_store = (tag() & 16) != 0;
    return m_do_store;
}

bool dcmp_0_t::chunk_t::literal_body_t::is_len_literal_div2_separate() {
    if (f_is_len_literal_div2_separate)
        return m_is_len_literal_div2_separate;
    f_is_len_literal_div2_separate = true;
    m_is_len_literal_div2_separate = len_literal_div2_in_tag() == 0;
    return m_is_len_literal_div2_separate;
}

int32_t dcmp_0_t::chunk_t::literal_body_t::len_literal() {
    if (f_len_literal)
        return m_len_literal;
    f_len_literal = true;
    m_len_literal = len_literal_div2() * 2;
    return m_len_literal;
}

int32_t dcmp_0_t::chunk_t::literal_body_t::len_literal_div2() {
    if (f_len_literal_div2)
        return m_len_literal_div2;
    f_len_literal_div2 = true;
    m_len_literal_div2 = ((is_len_literal_div2_separate()) ? (len_literal_div2_separate()) : (len_literal_div2_in_tag()));
    return m_len_literal_div2;
}

int32_t dcmp_0_t::chunk_t::literal_body_t::len_literal_div2_in_tag() {
    if (f_len_literal_div2_in_tag)
        return m_len_literal_div2_in_tag;
    f_len_literal_div2_in_tag = true;
    m_len_literal_div2_in_tag = tag() & 15;
    return m_len_literal_div2_in_tag;
}

dcmp_0_t::chunk_t::table_lookup_body_t::table_lookup_body_t(uint8_t p_tag, kaitai::kstream* p__io, dcmp_0_t::chunk_t* p__parent, dcmp_0_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_tag = p_tag;
    f_lookup_table = false;
    f_value = false;
    _read();
}

void dcmp_0_t::chunk_t::table_lookup_body_t::_read() {
}

dcmp_0_t::chunk_t::table_lookup_body_t::~table_lookup_body_t() {
    _clean_up();
}

void dcmp_0_t::chunk_t::table_lookup_body_t::_clean_up() {
}

std::vector<std::string>* dcmp_0_t::chunk_t::table_lookup_body_t::lookup_table() {
    if (f_lookup_table)
        return m_lookup_table.get();
    f_lookup_table = true;
    m_lookup_table = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>{std::string("\x00\x00", 2), std::string("\x4E\xBA", 2), std::string("\x00\x08", 2), std::string("\x4E\x75", 2), std::string("\x00\x0C", 2), std::string("\x4E\xAD", 2), std::string("\x20\x53", 2), std::string("\x2F\x0B", 2), std::string("\x61\x00", 2), std::string("\x00\x10", 2), std::string("\x70\x00", 2), std::string("\x2F\x00", 2), std::string("\x48\x6E", 2), std::string("\x20\x50", 2), std::string("\x20\x6E", 2), std::string("\x2F\x2E", 2), std::string("\xFF\xFC", 2), std::string("\x48\xE7", 2), std::string("\x3F\x3C", 2), std::string("\x00\x04", 2), std::string("\xFF\xF8", 2), std::string("\x2F\x0C", 2), std::string("\x20\x06", 2), std::string("\x4E\xED", 2), std::string("\x4E\x56", 2), std::string("\x20\x68", 2), std::string("\x4E\x5E", 2), std::string("\x00\x01", 2), std::string("\x58\x8F", 2), std::string("\x4F\xEF", 2), std::string("\x00\x02", 2), std::string("\x00\x18", 2), std::string("\x60\x00", 2), std::string("\xFF\xFF", 2), std::string("\x50\x8F", 2), std::string("\x4E\x90", 2), std::string("\x00\x06", 2), std::string("\x26\x6E", 2), std::string("\x00\x14", 2), std::string("\xFF\xF4", 2), std::string("\x4C\xEE", 2), std::string("\x00\x0A", 2), std::string("\x00\x0E", 2), std::string("\x41\xEE", 2), std::string("\x4C\xDF", 2), std::string("\x48\xC0", 2), std::string("\xFF\xF0", 2), std::string("\x2D\x40", 2), std::string("\x00\x12", 2), std::string("\x30\x2E", 2), std::string("\x70\x01", 2), std::string("\x2F\x28", 2), std::string("\x20\x54", 2), std::string("\x67\x00", 2), std::string("\x00\x20", 2), std::string("\x00\x1C", 2), std::string("\x20\x5F", 2), std::string("\x18\x00", 2), std::string("\x26\x6F", 2), std::string("\x48\x78", 2), std::string("\x00\x16", 2), std::string("\x41\xFA", 2), std::string("\x30\x3C", 2), std::string("\x28\x40", 2), std::string("\x72\x00", 2), std::string("\x28\x6E", 2), std::string("\x20\x0C", 2), std::string("\x66\x00", 2), std::string("\x20\x6B", 2), std::string("\x2F\x07", 2), std::string("\x55\x8F", 2), std::string("\x00\x28", 2), std::string("\xFF\xFE", 2), std::string("\xFF\xEC", 2), std::string("\x22\xD8", 2), std::string("\x20\x0B", 2), std::string("\x00\x0F", 2), std::string("\x59\x8F", 2), std::string("\x2F\x3C", 2), std::string("\xFF\x00", 2), std::string("\x01\x18", 2), std::string("\x81\xE1", 2), std::string("\x4A\x00", 2), std::string("\x4E\xB0", 2), std::string("\xFF\xE8", 2), std::string("\x48\xC7", 2), std::string("\x00\x03", 2), std::string("\x00\x22", 2), std::string("\x00\x07", 2), std::string("\x00\x1A", 2), std::string("\x67\x06", 2), std::string("\x67\x08", 2), std::string("\x4E\xF9", 2), std::string("\x00\x24", 2), std::string("\x20\x78", 2), std::string("\x08\x00", 2), std::string("\x66\x04", 2), std::string("\x00\x2A", 2), std::string("\x4E\xD0", 2), std::string("\x30\x28", 2), std::string("\x26\x5F", 2), std::string("\x67\x04", 2), std::string("\x00\x30", 2), std::string("\x43\xEE", 2), std::string("\x3F\x00", 2), std::string("\x20\x1F", 2), std::string("\x00\x1E", 2), std::string("\xFF\xF6", 2), std::string("\x20\x2E", 2), std::string("\x42\xA7", 2), std::string("\x20\x07", 2), std::string("\xFF\xFA", 2), std::string("\x60\x02", 2), std::string("\x3D\x40", 2), std::string("\x0C\x40", 2), std::string("\x66\x06", 2), std::string("\x00\x26", 2), std::string("\x2D\x48", 2), std::string("\x2F\x01", 2), std::string("\x70\xFF", 2), std::string("\x60\x04", 2), std::string("\x18\x80", 2), std::string("\x4A\x40", 2), std::string("\x00\x40", 2), std::string("\x00\x2C", 2), std::string("\x2F\x08", 2), std::string("\x00\x11", 2), std::string("\xFF\xE4", 2), std::string("\x21\x40", 2), std::string("\x26\x40", 2), std::string("\xFF\xF2", 2), std::string("\x42\x6E", 2), std::string("\x4E\xB9", 2), std::string("\x3D\x7C", 2), std::string("\x00\x38", 2), std::string("\x00\x0D", 2), std::string("\x60\x06", 2), std::string("\x42\x2E", 2), std::string("\x20\x3C", 2), std::string("\x67\x0C", 2), std::string("\x2D\x68", 2), std::string("\x66\x08", 2), std::string("\x4A\x2E", 2), std::string("\x4A\xAE", 2), std::string("\x00\x2E", 2), std::string("\x48\x40", 2), std::string("\x22\x5F", 2), std::string("\x22\x00", 2), std::string("\x67\x0A", 2), std::string("\x30\x07", 2), std::string("\x42\x67", 2), std::string("\x00\x32", 2), std::string("\x20\x28", 2), std::string("\x00\x09", 2), std::string("\x48\x7A", 2), std::string("\x02\x00", 2), std::string("\x2F\x2B", 2), std::string("\x00\x05", 2), std::string("\x22\x6E", 2), std::string("\x66\x02", 2), std::string("\xE5\x80", 2), std::string("\x67\x0E", 2), std::string("\x66\x0A", 2), std::string("\x00\x50", 2), std::string("\x3E\x00", 2), std::string("\x66\x0C", 2), std::string("\x2E\x00", 2), std::string("\xFF\xEE", 2), std::string("\x20\x6D", 2), std::string("\x20\x40", 2), std::string("\xFF\xE0", 2), std::string("\x53\x40", 2), std::string("\x60\x08", 2), std::string("\x04\x80", 2), std::string("\x00\x68", 2), std::string("\x0B\x7C", 2), std::string("\x44\x00", 2), std::string("\x41\xE8", 2), std::string("\x48\x41", 2)});
    return m_lookup_table.get();
}

std::string dcmp_0_t::chunk_t::table_lookup_body_t::value() {
    if (f_value)
        return m_value;
    f_value = true;
    m_value = lookup_table()->at(tag() - 75);
    return m_value;
}

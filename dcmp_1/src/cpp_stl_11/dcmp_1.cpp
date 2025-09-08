// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "dcmp_1.h"

dcmp_1_t::dcmp_1_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, dcmp_1_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_chunks = nullptr;
    _read();
}

void dcmp_1_t::_read() {
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

dcmp_1_t::~dcmp_1_t() {
    _clean_up();
}

void dcmp_1_t::_clean_up() {
}
const std::set<dcmp_1_t::chunk_t::tag_kind_t> dcmp_1_t::chunk_t::_values_tag_kind_t{
    dcmp_1_t::chunk_t::TAG_KIND_INVALID,
    dcmp_1_t::chunk_t::TAG_KIND_LITERAL,
    dcmp_1_t::chunk_t::TAG_KIND_BACKREFERENCE,
    dcmp_1_t::chunk_t::TAG_KIND_TABLE_LOOKUP,
    dcmp_1_t::chunk_t::TAG_KIND_EXTENDED,
    dcmp_1_t::chunk_t::TAG_KIND_END,
};
bool dcmp_1_t::chunk_t::_is_defined_tag_kind_t(dcmp_1_t::chunk_t::tag_kind_t v) {
    return dcmp_1_t::chunk_t::_values_tag_kind_t.find(v) != dcmp_1_t::chunk_t::_values_tag_kind_t.end();
}

dcmp_1_t::chunk_t::chunk_t(kaitai::kstream* p__io, dcmp_1_t* p__parent, dcmp_1_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void dcmp_1_t::chunk_t::_read() {
    m_tag = m__io->read_u1();
    n_body = true;
    switch ((( ((tag() >= 0) && (tag() <= 31)) ) ? (dcmp_1_t::chunk_t::TAG_KIND_LITERAL) : ((( ((tag() >= 32) && (tag() <= 207)) ) ? (dcmp_1_t::chunk_t::TAG_KIND_BACKREFERENCE) : ((( ((tag() >= 208) && (tag() <= 209)) ) ? (dcmp_1_t::chunk_t::TAG_KIND_LITERAL) : (((tag() == 210) ? (dcmp_1_t::chunk_t::TAG_KIND_BACKREFERENCE) : ((( ((tag() >= 213) && (tag() <= 253)) ) ? (dcmp_1_t::chunk_t::TAG_KIND_TABLE_LOOKUP) : (((tag() == 254) ? (dcmp_1_t::chunk_t::TAG_KIND_EXTENDED) : (((tag() == 255) ? (dcmp_1_t::chunk_t::TAG_KIND_END) : (dcmp_1_t::chunk_t::TAG_KIND_INVALID))))))))))))))) {
    case dcmp_1_t::chunk_t::TAG_KIND_BACKREFERENCE: {
        n_body = false;
        m_body = std::unique_ptr<backreference_body_t>(new backreference_body_t(tag(), m__io, this, m__root));
        break;
    }
    case dcmp_1_t::chunk_t::TAG_KIND_END: {
        n_body = false;
        m_body = std::unique_ptr<end_body_t>(new end_body_t(m__io, this, m__root));
        break;
    }
    case dcmp_1_t::chunk_t::TAG_KIND_EXTENDED: {
        n_body = false;
        m_body = std::unique_ptr<extended_body_t>(new extended_body_t(m__io, this, m__root));
        break;
    }
    case dcmp_1_t::chunk_t::TAG_KIND_LITERAL: {
        n_body = false;
        m_body = std::unique_ptr<literal_body_t>(new literal_body_t(tag(), m__io, this, m__root));
        break;
    }
    case dcmp_1_t::chunk_t::TAG_KIND_TABLE_LOOKUP: {
        n_body = false;
        m_body = std::unique_ptr<table_lookup_body_t>(new table_lookup_body_t(tag(), m__io, this, m__root));
        break;
    }
    }
}

dcmp_1_t::chunk_t::~chunk_t() {
    _clean_up();
}

void dcmp_1_t::chunk_t::_clean_up() {
    if (!n_body) {
    }
}

dcmp_1_t::chunk_t::backreference_body_t::backreference_body_t(uint8_t p_tag, kaitai::kstream* p__io, dcmp_1_t::chunk_t* p__parent, dcmp_1_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_tag = p_tag;
    f_index = false;
    f_index_in_tag = false;
    f_index_separate = false;
    f_is_index_separate = false;
    _read();
}

void dcmp_1_t::chunk_t::backreference_body_t::_read() {
    n_index_separate_minus = true;
    if (is_index_separate()) {
        n_index_separate_minus = false;
        m_index_separate_minus = m__io->read_u1();
    }
}

dcmp_1_t::chunk_t::backreference_body_t::~backreference_body_t() {
    _clean_up();
}

void dcmp_1_t::chunk_t::backreference_body_t::_clean_up() {
    if (!n_index_separate_minus) {
    }
}

int32_t dcmp_1_t::chunk_t::backreference_body_t::index() {
    if (f_index)
        return m_index;
    f_index = true;
    m_index = ((is_index_separate()) ? (index_separate()) : (index_in_tag()));
    return m_index;
}

int32_t dcmp_1_t::chunk_t::backreference_body_t::index_in_tag() {
    if (f_index_in_tag)
        return m_index_in_tag;
    f_index_in_tag = true;
    m_index_in_tag = tag() - 32;
    return m_index_in_tag;
}

int32_t dcmp_1_t::chunk_t::backreference_body_t::index_separate() {
    if (f_index_separate)
        return m_index_separate;
    f_index_separate = true;
    n_index_separate = true;
    if (is_index_separate()) {
        n_index_separate = false;
        m_index_separate = index_separate_minus() + 176;
    }
    return m_index_separate;
}

bool dcmp_1_t::chunk_t::backreference_body_t::is_index_separate() {
    if (f_is_index_separate)
        return m_is_index_separate;
    f_is_index_separate = true;
    m_is_index_separate = tag() == 210;
    return m_is_index_separate;
}

dcmp_1_t::chunk_t::end_body_t::end_body_t(kaitai::kstream* p__io, dcmp_1_t::chunk_t* p__parent, dcmp_1_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void dcmp_1_t::chunk_t::end_body_t::_read() {
}

dcmp_1_t::chunk_t::end_body_t::~end_body_t() {
    _clean_up();
}

void dcmp_1_t::chunk_t::end_body_t::_clean_up() {
}

dcmp_1_t::chunk_t::extended_body_t::extended_body_t(kaitai::kstream* p__io, dcmp_1_t::chunk_t* p__parent, dcmp_1_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void dcmp_1_t::chunk_t::extended_body_t::_read() {
    m_tag = m__io->read_u1();
    n_body = true;
    switch (tag()) {
    case 2: {
        n_body = false;
        m_body = std::unique_ptr<repeat_body_t>(new repeat_body_t(m__io, this, m__root));
        break;
    }
    }
}

dcmp_1_t::chunk_t::extended_body_t::~extended_body_t() {
    _clean_up();
}

void dcmp_1_t::chunk_t::extended_body_t::_clean_up() {
    if (!n_body) {
    }
}

dcmp_1_t::chunk_t::extended_body_t::repeat_body_t::repeat_body_t(kaitai::kstream* p__io, dcmp_1_t::chunk_t::extended_body_t* p__parent, dcmp_1_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_to_repeat_raw = nullptr;
    m_repeat_count_m1_raw = nullptr;
    f_repeat_count = false;
    f_repeat_count_m1 = false;
    f_to_repeat = false;
    _read();
}

void dcmp_1_t::chunk_t::extended_body_t::repeat_body_t::_read() {
    m_to_repeat_raw = std::unique_ptr<dcmp_variable_length_integer_t>(new dcmp_variable_length_integer_t(m__io));
    m_repeat_count_m1_raw = std::unique_ptr<dcmp_variable_length_integer_t>(new dcmp_variable_length_integer_t(m__io));
}

dcmp_1_t::chunk_t::extended_body_t::repeat_body_t::~repeat_body_t() {
    _clean_up();
}

void dcmp_1_t::chunk_t::extended_body_t::repeat_body_t::_clean_up() {
}

int32_t dcmp_1_t::chunk_t::extended_body_t::repeat_body_t::repeat_count() {
    if (f_repeat_count)
        return m_repeat_count;
    f_repeat_count = true;
    m_repeat_count = repeat_count_m1() + 1;
    return m_repeat_count;
}

int32_t dcmp_1_t::chunk_t::extended_body_t::repeat_body_t::repeat_count_m1() {
    if (f_repeat_count_m1)
        return m_repeat_count_m1;
    f_repeat_count_m1 = true;
    m_repeat_count_m1 = repeat_count_m1_raw()->value();
    return m_repeat_count_m1;
}

int32_t dcmp_1_t::chunk_t::extended_body_t::repeat_body_t::to_repeat() {
    if (f_to_repeat)
        return m_to_repeat;
    f_to_repeat = true;
    m_to_repeat = to_repeat_raw()->value();
    return m_to_repeat;
}

dcmp_1_t::chunk_t::literal_body_t::literal_body_t(uint8_t p_tag, kaitai::kstream* p__io, dcmp_1_t::chunk_t* p__parent, dcmp_1_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_tag = p_tag;
    f_do_store = false;
    f_is_len_literal_separate = false;
    f_len_literal = false;
    f_len_literal_m1_in_tag = false;
    _read();
}

void dcmp_1_t::chunk_t::literal_body_t::_read() {
    n_len_literal_separate = true;
    if (is_len_literal_separate()) {
        n_len_literal_separate = false;
        m_len_literal_separate = m__io->read_u1();
    }
    m_literal = m__io->read_bytes(len_literal());
}

dcmp_1_t::chunk_t::literal_body_t::~literal_body_t() {
    _clean_up();
}

void dcmp_1_t::chunk_t::literal_body_t::_clean_up() {
    if (!n_len_literal_separate) {
    }
}

bool dcmp_1_t::chunk_t::literal_body_t::do_store() {
    if (f_do_store)
        return m_do_store;
    f_do_store = true;
    m_do_store = ((is_len_literal_separate()) ? (tag() == 209) : ((tag() & 16) != 0));
    return m_do_store;
}

bool dcmp_1_t::chunk_t::literal_body_t::is_len_literal_separate() {
    if (f_is_len_literal_separate)
        return m_is_len_literal_separate;
    f_is_len_literal_separate = true;
    m_is_len_literal_separate = tag() >= 208;
    return m_is_len_literal_separate;
}

int32_t dcmp_1_t::chunk_t::literal_body_t::len_literal() {
    if (f_len_literal)
        return m_len_literal;
    f_len_literal = true;
    m_len_literal = ((is_len_literal_separate()) ? (len_literal_separate()) : (len_literal_m1_in_tag() + 1));
    return m_len_literal;
}

int32_t dcmp_1_t::chunk_t::literal_body_t::len_literal_m1_in_tag() {
    if (f_len_literal_m1_in_tag)
        return m_len_literal_m1_in_tag;
    f_len_literal_m1_in_tag = true;
    n_len_literal_m1_in_tag = true;
    if (!(is_len_literal_separate())) {
        n_len_literal_m1_in_tag = false;
        m_len_literal_m1_in_tag = tag() & 15;
    }
    return m_len_literal_m1_in_tag;
}

dcmp_1_t::chunk_t::table_lookup_body_t::table_lookup_body_t(uint8_t p_tag, kaitai::kstream* p__io, dcmp_1_t::chunk_t* p__parent, dcmp_1_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_tag = p_tag;
    f_lookup_table = false;
    f_value = false;
    _read();
}

void dcmp_1_t::chunk_t::table_lookup_body_t::_read() {
}

dcmp_1_t::chunk_t::table_lookup_body_t::~table_lookup_body_t() {
    _clean_up();
}

void dcmp_1_t::chunk_t::table_lookup_body_t::_clean_up() {
}

std::vector<std::string>* dcmp_1_t::chunk_t::table_lookup_body_t::lookup_table() {
    if (f_lookup_table)
        return m_lookup_table.get();
    f_lookup_table = true;
    m_lookup_table = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>{std::string("\x00\x00", 2), std::string("\x00\x01", 2), std::string("\x00\x02", 2), std::string("\x00\x03", 2), std::string("\x2E\x01", 2), std::string("\x3E\x01", 2), std::string("\x01\x01", 2), std::string("\x1E\x01", 2), std::string("\xFF\xFF", 2), std::string("\x0E\x01", 2), std::string("\x31\x00", 2), std::string("\x11\x12", 2), std::string("\x01\x07", 2), std::string("\x33\x32", 2), std::string("\x12\x39", 2), std::string("\xED\x10", 2), std::string("\x01\x27", 2), std::string("\x23\x22", 2), std::string("\x01\x37", 2), std::string("\x07\x06", 2), std::string("\x01\x17", 2), std::string("\x01\x23", 2), std::string("\x00\xFF", 2), std::string("\x00\x2F", 2), std::string("\x07\x0E", 2), std::string("\xFD\x3C", 2), std::string("\x01\x35", 2), std::string("\x01\x15", 2), std::string("\x01\x02", 2), std::string("\x00\x07", 2), std::string("\x00\x3E", 2), std::string("\x05\xD5", 2), std::string("\x02\x01", 2), std::string("\x06\x07", 2), std::string("\x07\x08", 2), std::string("\x30\x01", 2), std::string("\x01\x33", 2), std::string("\x00\x10", 2), std::string("\x17\x16", 2), std::string("\x37\x3E", 2), std::string("\x36\x37", 2)});
    return m_lookup_table.get();
}

std::string dcmp_1_t::chunk_t::table_lookup_body_t::value() {
    if (f_value)
        return m_value;
    f_value = true;
    m_value = lookup_table()->at(tag() - 213);
    return m_value;
}

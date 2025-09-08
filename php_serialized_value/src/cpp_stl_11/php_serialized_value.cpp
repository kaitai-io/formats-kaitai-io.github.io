// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "php_serialized_value.h"
#include "kaitai/exceptions.h"
const std::set<php_serialized_value_t::bool_value_t> php_serialized_value_t::_values_bool_value_t{
    php_serialized_value_t::BOOL_VALUE_FALSE,
    php_serialized_value_t::BOOL_VALUE_TRUE,
};
bool php_serialized_value_t::_is_defined_bool_value_t(php_serialized_value_t::bool_value_t v) {
    return php_serialized_value_t::_values_bool_value_t.find(v) != php_serialized_value_t::_values_bool_value_t.end();
}
const std::set<php_serialized_value_t::value_type_t> php_serialized_value_t::_values_value_type_t{
    php_serialized_value_t::VALUE_TYPE_CUSTOM_SERIALIZED_OBJECT,
    php_serialized_value_t::VALUE_TYPE_NULL,
    php_serialized_value_t::VALUE_TYPE_OBJECT,
    php_serialized_value_t::VALUE_TYPE_VARIABLE_REFERENCE,
    php_serialized_value_t::VALUE_TYPE_PHP_6_STRING,
    php_serialized_value_t::VALUE_TYPE_ARRAY,
    php_serialized_value_t::VALUE_TYPE_BOOL,
    php_serialized_value_t::VALUE_TYPE_FLOAT,
    php_serialized_value_t::VALUE_TYPE_INT,
    php_serialized_value_t::VALUE_TYPE_PHP_3_OBJECT,
    php_serialized_value_t::VALUE_TYPE_OBJECT_REFERENCE,
    php_serialized_value_t::VALUE_TYPE_STRING,
};
bool php_serialized_value_t::_is_defined_value_type_t(php_serialized_value_t::value_type_t v) {
    return php_serialized_value_t::_values_value_type_t.find(v) != php_serialized_value_t::_values_value_type_t.end();
}

php_serialized_value_t::php_serialized_value_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, php_serialized_value_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    _read();
}

void php_serialized_value_t::_read() {
    m_type = static_cast<php_serialized_value_t::value_type_t>(m__io->read_u1());
    n_contents = true;
    switch (type()) {
    case php_serialized_value_t::VALUE_TYPE_ARRAY: {
        n_contents = false;
        m_contents = std::unique_ptr<array_contents_t>(new array_contents_t(m__io, this, m__root));
        break;
    }
    case php_serialized_value_t::VALUE_TYPE_BOOL: {
        n_contents = false;
        m_contents = std::unique_ptr<bool_contents_t>(new bool_contents_t(m__io, this, m__root));
        break;
    }
    case php_serialized_value_t::VALUE_TYPE_CUSTOM_SERIALIZED_OBJECT: {
        n_contents = false;
        m_contents = std::unique_ptr<custom_serialized_object_contents_t>(new custom_serialized_object_contents_t(m__io, this, m__root));
        break;
    }
    case php_serialized_value_t::VALUE_TYPE_FLOAT: {
        n_contents = false;
        m_contents = std::unique_ptr<float_contents_t>(new float_contents_t(m__io, this, m__root));
        break;
    }
    case php_serialized_value_t::VALUE_TYPE_INT: {
        n_contents = false;
        m_contents = std::unique_ptr<int_contents_t>(new int_contents_t(m__io, this, m__root));
        break;
    }
    case php_serialized_value_t::VALUE_TYPE_NULL: {
        n_contents = false;
        m_contents = std::unique_ptr<null_contents_t>(new null_contents_t(m__io, this, m__root));
        break;
    }
    case php_serialized_value_t::VALUE_TYPE_OBJECT: {
        n_contents = false;
        m_contents = std::unique_ptr<object_contents_t>(new object_contents_t(m__io, this, m__root));
        break;
    }
    case php_serialized_value_t::VALUE_TYPE_OBJECT_REFERENCE: {
        n_contents = false;
        m_contents = std::unique_ptr<int_contents_t>(new int_contents_t(m__io, this, m__root));
        break;
    }
    case php_serialized_value_t::VALUE_TYPE_PHP_3_OBJECT: {
        n_contents = false;
        m_contents = std::unique_ptr<php_3_object_contents_t>(new php_3_object_contents_t(m__io, this, m__root));
        break;
    }
    case php_serialized_value_t::VALUE_TYPE_PHP_6_STRING: {
        n_contents = false;
        m_contents = std::unique_ptr<string_contents_t>(new string_contents_t(m__io, this, m__root));
        break;
    }
    case php_serialized_value_t::VALUE_TYPE_STRING: {
        n_contents = false;
        m_contents = std::unique_ptr<string_contents_t>(new string_contents_t(m__io, this, m__root));
        break;
    }
    case php_serialized_value_t::VALUE_TYPE_VARIABLE_REFERENCE: {
        n_contents = false;
        m_contents = std::unique_ptr<int_contents_t>(new int_contents_t(m__io, this, m__root));
        break;
    }
    }
}

php_serialized_value_t::~php_serialized_value_t() {
    _clean_up();
}

void php_serialized_value_t::_clean_up() {
    if (!n_contents) {
    }
}

php_serialized_value_t::array_contents_t::array_contents_t(kaitai::kstream* p__io, php_serialized_value_t* p__parent, php_serialized_value_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_elements = nullptr;
    _read();
}

void php_serialized_value_t::array_contents_t::_read() {
    m_colon = m__io->read_bytes(1);
    if (!(m_colon == std::string("\x3A", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x3A", 1), m_colon, m__io, std::string("/types/array_contents/seq/0"));
    }
    m_elements = std::unique_ptr<count_prefixed_mapping_t>(new count_prefixed_mapping_t(m__io, this, m__root));
}

php_serialized_value_t::array_contents_t::~array_contents_t() {
    _clean_up();
}

void php_serialized_value_t::array_contents_t::_clean_up() {
}

php_serialized_value_t::bool_contents_t::bool_contents_t(kaitai::kstream* p__io, php_serialized_value_t* p__parent, php_serialized_value_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_value = false;
    _read();
}

void php_serialized_value_t::bool_contents_t::_read() {
    m_colon = m__io->read_bytes(1);
    if (!(m_colon == std::string("\x3A", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x3A", 1), m_colon, m__io, std::string("/types/bool_contents/seq/0"));
    }
    m_value_dec = static_cast<php_serialized_value_t::bool_value_t>(m__io->read_u1());
    m_semicolon = m__io->read_bytes(1);
    if (!(m_semicolon == std::string("\x3B", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x3B", 1), m_semicolon, m__io, std::string("/types/bool_contents/seq/2"));
    }
}

php_serialized_value_t::bool_contents_t::~bool_contents_t() {
    _clean_up();
}

void php_serialized_value_t::bool_contents_t::_clean_up() {
}

bool php_serialized_value_t::bool_contents_t::value() {
    if (f_value)
        return m_value;
    f_value = true;
    m_value = value_dec() == php_serialized_value_t::BOOL_VALUE_TRUE;
    return m_value;
}

php_serialized_value_t::count_prefixed_mapping_t::count_prefixed_mapping_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, php_serialized_value_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    f_num_entries = false;
    _read();
}

void php_serialized_value_t::count_prefixed_mapping_t::_read() {
    m_num_entries_dec = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(58, false, true, true), "ASCII");
    m_opening_brace = m__io->read_bytes(1);
    if (!(m_opening_brace == std::string("\x7B", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x7B", 1), m_opening_brace, m__io, std::string("/types/count_prefixed_mapping/seq/1"));
    }
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<mapping_entry_t>>>(new std::vector<std::unique_ptr<mapping_entry_t>>());
    const int l_entries = num_entries();
    for (int i = 0; i < l_entries; i++) {
        m_entries->push_back(std::move(std::unique_ptr<mapping_entry_t>(new mapping_entry_t(m__io, this, m__root))));
    }
    m_closing_brace = m__io->read_bytes(1);
    if (!(m_closing_brace == std::string("\x7D", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x7D", 1), m_closing_brace, m__io, std::string("/types/count_prefixed_mapping/seq/3"));
    }
}

php_serialized_value_t::count_prefixed_mapping_t::~count_prefixed_mapping_t() {
    _clean_up();
}

void php_serialized_value_t::count_prefixed_mapping_t::_clean_up() {
}

int32_t php_serialized_value_t::count_prefixed_mapping_t::num_entries() {
    if (f_num_entries)
        return m_num_entries;
    f_num_entries = true;
    m_num_entries = kaitai::kstream::string_to_int(num_entries_dec());
    return m_num_entries;
}

php_serialized_value_t::custom_serialized_object_contents_t::custom_serialized_object_contents_t(kaitai::kstream* p__io, php_serialized_value_t* p__parent, php_serialized_value_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_class_name = nullptr;
    f_len_data = false;
    _read();
}

void php_serialized_value_t::custom_serialized_object_contents_t::_read() {
    m_colon1 = m__io->read_bytes(1);
    if (!(m_colon1 == std::string("\x3A", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x3A", 1), m_colon1, m__io, std::string("/types/custom_serialized_object_contents/seq/0"));
    }
    m_class_name = std::unique_ptr<length_prefixed_quoted_string_t>(new length_prefixed_quoted_string_t(m__io, this, m__root));
    m_colon2 = m__io->read_bytes(1);
    if (!(m_colon2 == std::string("\x3A", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x3A", 1), m_colon2, m__io, std::string("/types/custom_serialized_object_contents/seq/2"));
    }
    m_len_data_dec = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(58, false, true, true), "ASCII");
    m_opening_brace = m__io->read_bytes(1);
    if (!(m_opening_brace == std::string("\x7B", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x7B", 1), m_opening_brace, m__io, std::string("/types/custom_serialized_object_contents/seq/4"));
    }
    m_data = m__io->read_bytes(len_data());
    m_closing_quote = m__io->read_bytes(1);
    if (!(m_closing_quote == std::string("\x7D", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x7D", 1), m_closing_quote, m__io, std::string("/types/custom_serialized_object_contents/seq/6"));
    }
}

php_serialized_value_t::custom_serialized_object_contents_t::~custom_serialized_object_contents_t() {
    _clean_up();
}

void php_serialized_value_t::custom_serialized_object_contents_t::_clean_up() {
}

int32_t php_serialized_value_t::custom_serialized_object_contents_t::len_data() {
    if (f_len_data)
        return m_len_data;
    f_len_data = true;
    m_len_data = kaitai::kstream::string_to_int(len_data_dec());
    return m_len_data;
}

php_serialized_value_t::float_contents_t::float_contents_t(kaitai::kstream* p__io, php_serialized_value_t* p__parent, php_serialized_value_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void php_serialized_value_t::float_contents_t::_read() {
    m_colon = m__io->read_bytes(1);
    if (!(m_colon == std::string("\x3A", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x3A", 1), m_colon, m__io, std::string("/types/float_contents/seq/0"));
    }
    m_value_dec = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(59, false, true, true), "ASCII");
}

php_serialized_value_t::float_contents_t::~float_contents_t() {
    _clean_up();
}

void php_serialized_value_t::float_contents_t::_clean_up() {
}

php_serialized_value_t::int_contents_t::int_contents_t(kaitai::kstream* p__io, php_serialized_value_t* p__parent, php_serialized_value_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_value = false;
    _read();
}

void php_serialized_value_t::int_contents_t::_read() {
    m_colon = m__io->read_bytes(1);
    if (!(m_colon == std::string("\x3A", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x3A", 1), m_colon, m__io, std::string("/types/int_contents/seq/0"));
    }
    m_value_dec = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(59, false, true, true), "ASCII");
}

php_serialized_value_t::int_contents_t::~int_contents_t() {
    _clean_up();
}

void php_serialized_value_t::int_contents_t::_clean_up() {
}

int32_t php_serialized_value_t::int_contents_t::value() {
    if (f_value)
        return m_value;
    f_value = true;
    m_value = kaitai::kstream::string_to_int(value_dec());
    return m_value;
}

php_serialized_value_t::length_prefixed_quoted_string_t::length_prefixed_quoted_string_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, php_serialized_value_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_len_data = false;
    _read();
}

void php_serialized_value_t::length_prefixed_quoted_string_t::_read() {
    m_len_data_dec = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(58, false, true, true), "ASCII");
    m_opening_quote = m__io->read_bytes(1);
    if (!(m_opening_quote == std::string("\x22", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x22", 1), m_opening_quote, m__io, std::string("/types/length_prefixed_quoted_string/seq/1"));
    }
    m_data = m__io->read_bytes(len_data());
    m_closing_quote = m__io->read_bytes(1);
    if (!(m_closing_quote == std::string("\x22", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x22", 1), m_closing_quote, m__io, std::string("/types/length_prefixed_quoted_string/seq/3"));
    }
}

php_serialized_value_t::length_prefixed_quoted_string_t::~length_prefixed_quoted_string_t() {
    _clean_up();
}

void php_serialized_value_t::length_prefixed_quoted_string_t::_clean_up() {
}

int32_t php_serialized_value_t::length_prefixed_quoted_string_t::len_data() {
    if (f_len_data)
        return m_len_data;
    f_len_data = true;
    m_len_data = kaitai::kstream::string_to_int(len_data_dec());
    return m_len_data;
}

php_serialized_value_t::mapping_entry_t::mapping_entry_t(kaitai::kstream* p__io, php_serialized_value_t::count_prefixed_mapping_t* p__parent, php_serialized_value_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_key = nullptr;
    m_value = nullptr;
    _read();
}

void php_serialized_value_t::mapping_entry_t::_read() {
    m_key = std::unique_ptr<php_serialized_value_t>(new php_serialized_value_t(m__io, this, m__root));
    m_value = std::unique_ptr<php_serialized_value_t>(new php_serialized_value_t(m__io, this, m__root));
}

php_serialized_value_t::mapping_entry_t::~mapping_entry_t() {
    _clean_up();
}

void php_serialized_value_t::mapping_entry_t::_clean_up() {
}

php_serialized_value_t::null_contents_t::null_contents_t(kaitai::kstream* p__io, php_serialized_value_t* p__parent, php_serialized_value_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void php_serialized_value_t::null_contents_t::_read() {
    m_semicolon = m__io->read_bytes(1);
    if (!(m_semicolon == std::string("\x3B", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x3B", 1), m_semicolon, m__io, std::string("/types/null_contents/seq/0"));
    }
}

php_serialized_value_t::null_contents_t::~null_contents_t() {
    _clean_up();
}

void php_serialized_value_t::null_contents_t::_clean_up() {
}

php_serialized_value_t::object_contents_t::object_contents_t(kaitai::kstream* p__io, php_serialized_value_t* p__parent, php_serialized_value_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_class_name = nullptr;
    m_properties = nullptr;
    _read();
}

void php_serialized_value_t::object_contents_t::_read() {
    m_colon1 = m__io->read_bytes(1);
    if (!(m_colon1 == std::string("\x3A", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x3A", 1), m_colon1, m__io, std::string("/types/object_contents/seq/0"));
    }
    m_class_name = std::unique_ptr<length_prefixed_quoted_string_t>(new length_prefixed_quoted_string_t(m__io, this, m__root));
    m_colon2 = m__io->read_bytes(1);
    if (!(m_colon2 == std::string("\x3A", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x3A", 1), m_colon2, m__io, std::string("/types/object_contents/seq/2"));
    }
    m_properties = std::unique_ptr<count_prefixed_mapping_t>(new count_prefixed_mapping_t(m__io, this, m__root));
}

php_serialized_value_t::object_contents_t::~object_contents_t() {
    _clean_up();
}

void php_serialized_value_t::object_contents_t::_clean_up() {
}

php_serialized_value_t::php_3_object_contents_t::php_3_object_contents_t(kaitai::kstream* p__io, php_serialized_value_t* p__parent, php_serialized_value_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_properties = nullptr;
    _read();
}

void php_serialized_value_t::php_3_object_contents_t::_read() {
    m_colon = m__io->read_bytes(1);
    if (!(m_colon == std::string("\x3A", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x3A", 1), m_colon, m__io, std::string("/types/php_3_object_contents/seq/0"));
    }
    m_properties = std::unique_ptr<count_prefixed_mapping_t>(new count_prefixed_mapping_t(m__io, this, m__root));
}

php_serialized_value_t::php_3_object_contents_t::~php_3_object_contents_t() {
    _clean_up();
}

void php_serialized_value_t::php_3_object_contents_t::_clean_up() {
}

php_serialized_value_t::string_contents_t::string_contents_t(kaitai::kstream* p__io, php_serialized_value_t* p__parent, php_serialized_value_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_string = nullptr;
    f_value = false;
    _read();
}

void php_serialized_value_t::string_contents_t::_read() {
    m_colon = m__io->read_bytes(1);
    if (!(m_colon == std::string("\x3A", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x3A", 1), m_colon, m__io, std::string("/types/string_contents/seq/0"));
    }
    m_string = std::unique_ptr<length_prefixed_quoted_string_t>(new length_prefixed_quoted_string_t(m__io, this, m__root));
    m_semicolon = m__io->read_bytes(1);
    if (!(m_semicolon == std::string("\x3B", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x3B", 1), m_semicolon, m__io, std::string("/types/string_contents/seq/2"));
    }
}

php_serialized_value_t::string_contents_t::~string_contents_t() {
    _clean_up();
}

void php_serialized_value_t::string_contents_t::_clean_up() {
}

std::string php_serialized_value_t::string_contents_t::value() {
    if (f_value)
        return m_value;
    f_value = true;
    m_value = string()->data();
    return m_value;
}

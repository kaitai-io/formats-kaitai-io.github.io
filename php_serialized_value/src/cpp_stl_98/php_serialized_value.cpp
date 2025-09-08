// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "php_serialized_value.h"
#include "kaitai/exceptions.h"
std::set<php_serialized_value_t::bool_value_t> php_serialized_value_t::_build_values_bool_value_t() {
    std::set<php_serialized_value_t::bool_value_t> _t;
    _t.insert(php_serialized_value_t::BOOL_VALUE_FALSE);
    _t.insert(php_serialized_value_t::BOOL_VALUE_TRUE);
    return _t;
}
const std::set<php_serialized_value_t::bool_value_t> php_serialized_value_t::_values_bool_value_t = php_serialized_value_t::_build_values_bool_value_t();
bool php_serialized_value_t::_is_defined_bool_value_t(php_serialized_value_t::bool_value_t v) {
    return php_serialized_value_t::_values_bool_value_t.find(v) != php_serialized_value_t::_values_bool_value_t.end();
}
std::set<php_serialized_value_t::value_type_t> php_serialized_value_t::_build_values_value_type_t() {
    std::set<php_serialized_value_t::value_type_t> _t;
    _t.insert(php_serialized_value_t::VALUE_TYPE_CUSTOM_SERIALIZED_OBJECT);
    _t.insert(php_serialized_value_t::VALUE_TYPE_NULL);
    _t.insert(php_serialized_value_t::VALUE_TYPE_OBJECT);
    _t.insert(php_serialized_value_t::VALUE_TYPE_VARIABLE_REFERENCE);
    _t.insert(php_serialized_value_t::VALUE_TYPE_PHP_6_STRING);
    _t.insert(php_serialized_value_t::VALUE_TYPE_ARRAY);
    _t.insert(php_serialized_value_t::VALUE_TYPE_BOOL);
    _t.insert(php_serialized_value_t::VALUE_TYPE_FLOAT);
    _t.insert(php_serialized_value_t::VALUE_TYPE_INT);
    _t.insert(php_serialized_value_t::VALUE_TYPE_PHP_3_OBJECT);
    _t.insert(php_serialized_value_t::VALUE_TYPE_OBJECT_REFERENCE);
    _t.insert(php_serialized_value_t::VALUE_TYPE_STRING);
    return _t;
}
const std::set<php_serialized_value_t::value_type_t> php_serialized_value_t::_values_value_type_t = php_serialized_value_t::_build_values_value_type_t();
bool php_serialized_value_t::_is_defined_value_type_t(php_serialized_value_t::value_type_t v) {
    return php_serialized_value_t::_values_value_type_t.find(v) != php_serialized_value_t::_values_value_type_t.end();
}

php_serialized_value_t::php_serialized_value_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, php_serialized_value_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void php_serialized_value_t::_read() {
    m_type = static_cast<php_serialized_value_t::value_type_t>(m__io->read_u1());
    n_contents = true;
    switch (type()) {
    case php_serialized_value_t::VALUE_TYPE_ARRAY: {
        n_contents = false;
        m_contents = new array_contents_t(m__io, this, m__root);
        break;
    }
    case php_serialized_value_t::VALUE_TYPE_BOOL: {
        n_contents = false;
        m_contents = new bool_contents_t(m__io, this, m__root);
        break;
    }
    case php_serialized_value_t::VALUE_TYPE_CUSTOM_SERIALIZED_OBJECT: {
        n_contents = false;
        m_contents = new custom_serialized_object_contents_t(m__io, this, m__root);
        break;
    }
    case php_serialized_value_t::VALUE_TYPE_FLOAT: {
        n_contents = false;
        m_contents = new float_contents_t(m__io, this, m__root);
        break;
    }
    case php_serialized_value_t::VALUE_TYPE_INT: {
        n_contents = false;
        m_contents = new int_contents_t(m__io, this, m__root);
        break;
    }
    case php_serialized_value_t::VALUE_TYPE_NULL: {
        n_contents = false;
        m_contents = new null_contents_t(m__io, this, m__root);
        break;
    }
    case php_serialized_value_t::VALUE_TYPE_OBJECT: {
        n_contents = false;
        m_contents = new object_contents_t(m__io, this, m__root);
        break;
    }
    case php_serialized_value_t::VALUE_TYPE_OBJECT_REFERENCE: {
        n_contents = false;
        m_contents = new int_contents_t(m__io, this, m__root);
        break;
    }
    case php_serialized_value_t::VALUE_TYPE_PHP_3_OBJECT: {
        n_contents = false;
        m_contents = new php_3_object_contents_t(m__io, this, m__root);
        break;
    }
    case php_serialized_value_t::VALUE_TYPE_PHP_6_STRING: {
        n_contents = false;
        m_contents = new string_contents_t(m__io, this, m__root);
        break;
    }
    case php_serialized_value_t::VALUE_TYPE_STRING: {
        n_contents = false;
        m_contents = new string_contents_t(m__io, this, m__root);
        break;
    }
    case php_serialized_value_t::VALUE_TYPE_VARIABLE_REFERENCE: {
        n_contents = false;
        m_contents = new int_contents_t(m__io, this, m__root);
        break;
    }
    }
}

php_serialized_value_t::~php_serialized_value_t() {
    _clean_up();
}

void php_serialized_value_t::_clean_up() {
    if (!n_contents) {
        if (m_contents) {
            delete m_contents; m_contents = 0;
        }
    }
}

php_serialized_value_t::array_contents_t::array_contents_t(kaitai::kstream* p__io, php_serialized_value_t* p__parent, php_serialized_value_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_elements = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void php_serialized_value_t::array_contents_t::_read() {
    m_colon = m__io->read_bytes(1);
    if (!(m_colon == std::string("\x3A", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x3A", 1), m_colon, m__io, std::string("/types/array_contents/seq/0"));
    }
    m_elements = new count_prefixed_mapping_t(m__io, this, m__root);
}

php_serialized_value_t::array_contents_t::~array_contents_t() {
    _clean_up();
}

void php_serialized_value_t::array_contents_t::_clean_up() {
    if (m_elements) {
        delete m_elements; m_elements = 0;
    }
}

php_serialized_value_t::bool_contents_t::bool_contents_t(kaitai::kstream* p__io, php_serialized_value_t* p__parent, php_serialized_value_t* p__root) : kaitai::kstruct(p__io) {
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
    m_entries = 0;
    f_num_entries = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void php_serialized_value_t::count_prefixed_mapping_t::_read() {
    m_num_entries_dec = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(58, false, true, true), "ASCII");
    m_opening_brace = m__io->read_bytes(1);
    if (!(m_opening_brace == std::string("\x7B", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x7B", 1), m_opening_brace, m__io, std::string("/types/count_prefixed_mapping/seq/1"));
    }
    m_entries = new std::vector<mapping_entry_t*>();
    const int l_entries = num_entries();
    for (int i = 0; i < l_entries; i++) {
        m_entries->push_back(new mapping_entry_t(m__io, this, m__root));
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
    if (m_entries) {
        for (std::vector<mapping_entry_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
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
    m_class_name = 0;
    f_len_data = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void php_serialized_value_t::custom_serialized_object_contents_t::_read() {
    m_colon1 = m__io->read_bytes(1);
    if (!(m_colon1 == std::string("\x3A", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x3A", 1), m_colon1, m__io, std::string("/types/custom_serialized_object_contents/seq/0"));
    }
    m_class_name = new length_prefixed_quoted_string_t(m__io, this, m__root);
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
    if (m_class_name) {
        delete m_class_name; m_class_name = 0;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_key = 0;
    m_value = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void php_serialized_value_t::mapping_entry_t::_read() {
    m_key = new php_serialized_value_t(m__io, this, m__root);
    m_value = new php_serialized_value_t(m__io, this, m__root);
}

php_serialized_value_t::mapping_entry_t::~mapping_entry_t() {
    _clean_up();
}

void php_serialized_value_t::mapping_entry_t::_clean_up() {
    if (m_key) {
        delete m_key; m_key = 0;
    }
    if (m_value) {
        delete m_value; m_value = 0;
    }
}

php_serialized_value_t::null_contents_t::null_contents_t(kaitai::kstream* p__io, php_serialized_value_t* p__parent, php_serialized_value_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_class_name = 0;
    m_properties = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void php_serialized_value_t::object_contents_t::_read() {
    m_colon1 = m__io->read_bytes(1);
    if (!(m_colon1 == std::string("\x3A", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x3A", 1), m_colon1, m__io, std::string("/types/object_contents/seq/0"));
    }
    m_class_name = new length_prefixed_quoted_string_t(m__io, this, m__root);
    m_colon2 = m__io->read_bytes(1);
    if (!(m_colon2 == std::string("\x3A", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x3A", 1), m_colon2, m__io, std::string("/types/object_contents/seq/2"));
    }
    m_properties = new count_prefixed_mapping_t(m__io, this, m__root);
}

php_serialized_value_t::object_contents_t::~object_contents_t() {
    _clean_up();
}

void php_serialized_value_t::object_contents_t::_clean_up() {
    if (m_class_name) {
        delete m_class_name; m_class_name = 0;
    }
    if (m_properties) {
        delete m_properties; m_properties = 0;
    }
}

php_serialized_value_t::php_3_object_contents_t::php_3_object_contents_t(kaitai::kstream* p__io, php_serialized_value_t* p__parent, php_serialized_value_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_properties = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void php_serialized_value_t::php_3_object_contents_t::_read() {
    m_colon = m__io->read_bytes(1);
    if (!(m_colon == std::string("\x3A", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x3A", 1), m_colon, m__io, std::string("/types/php_3_object_contents/seq/0"));
    }
    m_properties = new count_prefixed_mapping_t(m__io, this, m__root);
}

php_serialized_value_t::php_3_object_contents_t::~php_3_object_contents_t() {
    _clean_up();
}

void php_serialized_value_t::php_3_object_contents_t::_clean_up() {
    if (m_properties) {
        delete m_properties; m_properties = 0;
    }
}

php_serialized_value_t::string_contents_t::string_contents_t(kaitai::kstream* p__io, php_serialized_value_t* p__parent, php_serialized_value_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_string = 0;
    f_value = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void php_serialized_value_t::string_contents_t::_read() {
    m_colon = m__io->read_bytes(1);
    if (!(m_colon == std::string("\x3A", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x3A", 1), m_colon, m__io, std::string("/types/string_contents/seq/0"));
    }
    m_string = new length_prefixed_quoted_string_t(m__io, this, m__root);
    m_semicolon = m__io->read_bytes(1);
    if (!(m_semicolon == std::string("\x3B", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x3B", 1), m_semicolon, m__io, std::string("/types/string_contents/seq/2"));
    }
}

php_serialized_value_t::string_contents_t::~string_contents_t() {
    _clean_up();
}

void php_serialized_value_t::string_contents_t::_clean_up() {
    if (m_string) {
        delete m_string; m_string = 0;
    }
}

std::string php_serialized_value_t::string_contents_t::value() {
    if (f_value)
        return m_value;
    f_value = true;
    m_value = string()->data();
    return m_value;
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "java_class.h"
#include "kaitai/exceptions.h"

java_class_t::java_class_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_constant_pool = 0;
    m_interfaces = 0;
    m_fields = 0;
    m_methods = 0;
    m_attributes = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\xCA\xFE\xBA\xBE", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xCA\xFE\xBA\xBE", 4), m_magic, m__io, std::string("/seq/0"));
    }
    m_version_minor = m__io->read_u2be();
    m_version_major = m__io->read_u2be();
    if (!(m_version_major >= 43)) {
        throw kaitai::validation_less_than_error<uint16_t>(43, m_version_major, m__io, std::string("/seq/2"));
    }
    m_constant_pool_count = m__io->read_u2be();
    m_constant_pool = new std::vector<constant_pool_entry_t*>();
    const int l_constant_pool = constant_pool_count() - 1;
    for (int i = 0; i < l_constant_pool; i++) {
        m_constant_pool->push_back(new constant_pool_entry_t(((i != 0) ? (constant_pool()->at(i - 1)->is_two_entries()) : (false)), m__io, this, m__root));
    }
    m_access_flags = m__io->read_u2be();
    m_this_class = m__io->read_u2be();
    m_super_class = m__io->read_u2be();
    m_interfaces_count = m__io->read_u2be();
    m_interfaces = new std::vector<uint16_t>();
    const int l_interfaces = interfaces_count();
    for (int i = 0; i < l_interfaces; i++) {
        m_interfaces->push_back(m__io->read_u2be());
    }
    m_fields_count = m__io->read_u2be();
    m_fields = new std::vector<field_info_t*>();
    const int l_fields = fields_count();
    for (int i = 0; i < l_fields; i++) {
        m_fields->push_back(new field_info_t(m__io, this, m__root));
    }
    m_methods_count = m__io->read_u2be();
    m_methods = new std::vector<method_info_t*>();
    const int l_methods = methods_count();
    for (int i = 0; i < l_methods; i++) {
        m_methods->push_back(new method_info_t(m__io, this, m__root));
    }
    m_attributes_count = m__io->read_u2be();
    m_attributes = new std::vector<attribute_info_t*>();
    const int l_attributes = attributes_count();
    for (int i = 0; i < l_attributes; i++) {
        m_attributes->push_back(new attribute_info_t(m__io, this, m__root));
    }
}

java_class_t::~java_class_t() {
    _clean_up();
}

void java_class_t::_clean_up() {
    if (m_constant_pool) {
        for (std::vector<constant_pool_entry_t*>::iterator it = m_constant_pool->begin(); it != m_constant_pool->end(); ++it) {
            delete *it;
        }
        delete m_constant_pool; m_constant_pool = 0;
    }
    if (m_interfaces) {
        delete m_interfaces; m_interfaces = 0;
    }
    if (m_fields) {
        for (std::vector<field_info_t*>::iterator it = m_fields->begin(); it != m_fields->end(); ++it) {
            delete *it;
        }
        delete m_fields; m_fields = 0;
    }
    if (m_methods) {
        for (std::vector<method_info_t*>::iterator it = m_methods->begin(); it != m_methods->end(); ++it) {
            delete *it;
        }
        delete m_methods; m_methods = 0;
    }
    if (m_attributes) {
        for (std::vector<attribute_info_t*>::iterator it = m_attributes->begin(); it != m_attributes->end(); ++it) {
            delete *it;
        }
        delete m_attributes; m_attributes = 0;
    }
}

java_class_t::attribute_info_t::attribute_info_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_info = 0;
    f_name_as_str = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::attribute_info_t::_read() {
    m_name_index = m__io->read_u2be();
    m_attribute_length = m__io->read_u4be();
    n_info = true;
    {
        std::string on = name_as_str();
        if (on == std::string("Code")) {
            n_info = false;
            m__raw_info = m__io->read_bytes(attribute_length());
            m__io__raw_info = new kaitai::kstream(m__raw_info);
            m_info = new attr_body_code_t(m__io__raw_info, this, m__root);
        }
        else if (on == std::string("Exceptions")) {
            n_info = false;
            m__raw_info = m__io->read_bytes(attribute_length());
            m__io__raw_info = new kaitai::kstream(m__raw_info);
            m_info = new attr_body_exceptions_t(m__io__raw_info, this, m__root);
        }
        else if (on == std::string("LineNumberTable")) {
            n_info = false;
            m__raw_info = m__io->read_bytes(attribute_length());
            m__io__raw_info = new kaitai::kstream(m__raw_info);
            m_info = new attr_body_line_number_table_t(m__io__raw_info, this, m__root);
        }
        else if (on == std::string("SourceFile")) {
            n_info = false;
            m__raw_info = m__io->read_bytes(attribute_length());
            m__io__raw_info = new kaitai::kstream(m__raw_info);
            m_info = new attr_body_source_file_t(m__io__raw_info, this, m__root);
        }
        else {
            m__raw_info = m__io->read_bytes(attribute_length());
        }
    }
}

java_class_t::attribute_info_t::~attribute_info_t() {
    _clean_up();
}

void java_class_t::attribute_info_t::_clean_up() {
    if (!n_info) {
        if (m__io__raw_info) {
            delete m__io__raw_info; m__io__raw_info = 0;
        }
        if (m_info) {
            delete m_info; m_info = 0;
        }
    }
}

java_class_t::attribute_info_t::attr_body_code_t::attr_body_code_t(kaitai::kstream* p__io, java_class_t::attribute_info_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_exception_table = 0;
    m_attributes = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::attribute_info_t::attr_body_code_t::_read() {
    m_max_stack = m__io->read_u2be();
    m_max_locals = m__io->read_u2be();
    m_code_length = m__io->read_u4be();
    m_code = m__io->read_bytes(code_length());
    m_exception_table_length = m__io->read_u2be();
    m_exception_table = new std::vector<exception_entry_t*>();
    const int l_exception_table = exception_table_length();
    for (int i = 0; i < l_exception_table; i++) {
        m_exception_table->push_back(new exception_entry_t(m__io, this, m__root));
    }
    m_attributes_count = m__io->read_u2be();
    m_attributes = new std::vector<attribute_info_t*>();
    const int l_attributes = attributes_count();
    for (int i = 0; i < l_attributes; i++) {
        m_attributes->push_back(new attribute_info_t(m__io, this, m__root));
    }
}

java_class_t::attribute_info_t::attr_body_code_t::~attr_body_code_t() {
    _clean_up();
}

void java_class_t::attribute_info_t::attr_body_code_t::_clean_up() {
    if (m_exception_table) {
        for (std::vector<exception_entry_t*>::iterator it = m_exception_table->begin(); it != m_exception_table->end(); ++it) {
            delete *it;
        }
        delete m_exception_table; m_exception_table = 0;
    }
    if (m_attributes) {
        for (std::vector<attribute_info_t*>::iterator it = m_attributes->begin(); it != m_attributes->end(); ++it) {
            delete *it;
        }
        delete m_attributes; m_attributes = 0;
    }
}

java_class_t::attribute_info_t::attr_body_code_t::exception_entry_t::exception_entry_t(kaitai::kstream* p__io, java_class_t::attribute_info_t::attr_body_code_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_catch_exception = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::attribute_info_t::attr_body_code_t::exception_entry_t::_read() {
    m_start_pc = m__io->read_u2be();
    m_end_pc = m__io->read_u2be();
    m_handler_pc = m__io->read_u2be();
    m_catch_type = m__io->read_u2be();
}

java_class_t::attribute_info_t::attr_body_code_t::exception_entry_t::~exception_entry_t() {
    _clean_up();
}

void java_class_t::attribute_info_t::attr_body_code_t::exception_entry_t::_clean_up() {
}

java_class_t::constant_pool_entry_t* java_class_t::attribute_info_t::attr_body_code_t::exception_entry_t::catch_exception() {
    if (f_catch_exception)
        return m_catch_exception;
    f_catch_exception = true;
    n_catch_exception = true;
    if (catch_type() != 0) {
        n_catch_exception = false;
        m_catch_exception = _root()->constant_pool()->at(catch_type() - 1);
    }
    return m_catch_exception;
}

java_class_t::attribute_info_t::attr_body_exceptions_t::attr_body_exceptions_t(kaitai::kstream* p__io, java_class_t::attribute_info_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_exceptions = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::attribute_info_t::attr_body_exceptions_t::_read() {
    m_number_of_exceptions = m__io->read_u2be();
    m_exceptions = new std::vector<exception_table_entry_t*>();
    const int l_exceptions = number_of_exceptions();
    for (int i = 0; i < l_exceptions; i++) {
        m_exceptions->push_back(new exception_table_entry_t(m__io, this, m__root));
    }
}

java_class_t::attribute_info_t::attr_body_exceptions_t::~attr_body_exceptions_t() {
    _clean_up();
}

void java_class_t::attribute_info_t::attr_body_exceptions_t::_clean_up() {
    if (m_exceptions) {
        for (std::vector<exception_table_entry_t*>::iterator it = m_exceptions->begin(); it != m_exceptions->end(); ++it) {
            delete *it;
        }
        delete m_exceptions; m_exceptions = 0;
    }
}

java_class_t::attribute_info_t::attr_body_exceptions_t::exception_table_entry_t::exception_table_entry_t(kaitai::kstream* p__io, java_class_t::attribute_info_t::attr_body_exceptions_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_as_info = false;
    f_name_as_str = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::attribute_info_t::attr_body_exceptions_t::exception_table_entry_t::_read() {
    m_index = m__io->read_u2be();
}

java_class_t::attribute_info_t::attr_body_exceptions_t::exception_table_entry_t::~exception_table_entry_t() {
    _clean_up();
}

void java_class_t::attribute_info_t::attr_body_exceptions_t::exception_table_entry_t::_clean_up() {
}

java_class_t::class_cp_info_t* java_class_t::attribute_info_t::attr_body_exceptions_t::exception_table_entry_t::as_info() {
    if (f_as_info)
        return m_as_info;
    f_as_info = true;
    m_as_info = static_cast<java_class_t::class_cp_info_t*>(_root()->constant_pool()->at(index() - 1)->cp_info());
    return m_as_info;
}

std::string java_class_t::attribute_info_t::attr_body_exceptions_t::exception_table_entry_t::name_as_str() {
    if (f_name_as_str)
        return m_name_as_str;
    f_name_as_str = true;
    m_name_as_str = as_info()->name_as_str();
    return m_name_as_str;
}

java_class_t::attribute_info_t::attr_body_line_number_table_t::attr_body_line_number_table_t(kaitai::kstream* p__io, java_class_t::attribute_info_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_line_number_table = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::attribute_info_t::attr_body_line_number_table_t::_read() {
    m_line_number_table_length = m__io->read_u2be();
    m_line_number_table = new std::vector<line_number_table_entry_t*>();
    const int l_line_number_table = line_number_table_length();
    for (int i = 0; i < l_line_number_table; i++) {
        m_line_number_table->push_back(new line_number_table_entry_t(m__io, this, m__root));
    }
}

java_class_t::attribute_info_t::attr_body_line_number_table_t::~attr_body_line_number_table_t() {
    _clean_up();
}

void java_class_t::attribute_info_t::attr_body_line_number_table_t::_clean_up() {
    if (m_line_number_table) {
        for (std::vector<line_number_table_entry_t*>::iterator it = m_line_number_table->begin(); it != m_line_number_table->end(); ++it) {
            delete *it;
        }
        delete m_line_number_table; m_line_number_table = 0;
    }
}

java_class_t::attribute_info_t::attr_body_line_number_table_t::line_number_table_entry_t::line_number_table_entry_t(kaitai::kstream* p__io, java_class_t::attribute_info_t::attr_body_line_number_table_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::attribute_info_t::attr_body_line_number_table_t::line_number_table_entry_t::_read() {
    m_start_pc = m__io->read_u2be();
    m_line_number = m__io->read_u2be();
}

java_class_t::attribute_info_t::attr_body_line_number_table_t::line_number_table_entry_t::~line_number_table_entry_t() {
    _clean_up();
}

void java_class_t::attribute_info_t::attr_body_line_number_table_t::line_number_table_entry_t::_clean_up() {
}

java_class_t::attribute_info_t::attr_body_source_file_t::attr_body_source_file_t(kaitai::kstream* p__io, java_class_t::attribute_info_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_sourcefile_as_str = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::attribute_info_t::attr_body_source_file_t::_read() {
    m_sourcefile_index = m__io->read_u2be();
}

java_class_t::attribute_info_t::attr_body_source_file_t::~attr_body_source_file_t() {
    _clean_up();
}

void java_class_t::attribute_info_t::attr_body_source_file_t::_clean_up() {
}

std::string java_class_t::attribute_info_t::attr_body_source_file_t::sourcefile_as_str() {
    if (f_sourcefile_as_str)
        return m_sourcefile_as_str;
    f_sourcefile_as_str = true;
    m_sourcefile_as_str = static_cast<java_class_t::utf8_cp_info_t*>(_root()->constant_pool()->at(sourcefile_index() - 1)->cp_info())->value();
    return m_sourcefile_as_str;
}

std::string java_class_t::attribute_info_t::name_as_str() {
    if (f_name_as_str)
        return m_name_as_str;
    f_name_as_str = true;
    m_name_as_str = static_cast<java_class_t::utf8_cp_info_t*>(_root()->constant_pool()->at(name_index() - 1)->cp_info())->value();
    return m_name_as_str;
}

java_class_t::class_cp_info_t::class_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_name_as_info = false;
    f_name_as_str = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::class_cp_info_t::_read() {
    m_name_index = m__io->read_u2be();
}

java_class_t::class_cp_info_t::~class_cp_info_t() {
    _clean_up();
}

void java_class_t::class_cp_info_t::_clean_up() {
}

java_class_t::utf8_cp_info_t* java_class_t::class_cp_info_t::name_as_info() {
    if (f_name_as_info)
        return m_name_as_info;
    f_name_as_info = true;
    m_name_as_info = static_cast<java_class_t::utf8_cp_info_t*>(_root()->constant_pool()->at(name_index() - 1)->cp_info());
    return m_name_as_info;
}

std::string java_class_t::class_cp_info_t::name_as_str() {
    if (f_name_as_str)
        return m_name_as_str;
    f_name_as_str = true;
    m_name_as_str = name_as_info()->value();
    return m_name_as_str;
}
std::set<java_class_t::constant_pool_entry_t::tag_enum_t> java_class_t::constant_pool_entry_t::_build_values_tag_enum_t() {
    std::set<java_class_t::constant_pool_entry_t::tag_enum_t> _t;
    _t.insert(java_class_t::constant_pool_entry_t::TAG_ENUM_UTF8);
    _t.insert(java_class_t::constant_pool_entry_t::TAG_ENUM_INTEGER);
    _t.insert(java_class_t::constant_pool_entry_t::TAG_ENUM_FLOAT);
    _t.insert(java_class_t::constant_pool_entry_t::TAG_ENUM_LONG);
    _t.insert(java_class_t::constant_pool_entry_t::TAG_ENUM_DOUBLE);
    _t.insert(java_class_t::constant_pool_entry_t::TAG_ENUM_CLASS_TYPE);
    _t.insert(java_class_t::constant_pool_entry_t::TAG_ENUM_STRING);
    _t.insert(java_class_t::constant_pool_entry_t::TAG_ENUM_FIELD_REF);
    _t.insert(java_class_t::constant_pool_entry_t::TAG_ENUM_METHOD_REF);
    _t.insert(java_class_t::constant_pool_entry_t::TAG_ENUM_INTERFACE_METHOD_REF);
    _t.insert(java_class_t::constant_pool_entry_t::TAG_ENUM_NAME_AND_TYPE);
    _t.insert(java_class_t::constant_pool_entry_t::TAG_ENUM_METHOD_HANDLE);
    _t.insert(java_class_t::constant_pool_entry_t::TAG_ENUM_METHOD_TYPE);
    _t.insert(java_class_t::constant_pool_entry_t::TAG_ENUM_DYNAMIC);
    _t.insert(java_class_t::constant_pool_entry_t::TAG_ENUM_INVOKE_DYNAMIC);
    _t.insert(java_class_t::constant_pool_entry_t::TAG_ENUM_MODULE);
    _t.insert(java_class_t::constant_pool_entry_t::TAG_ENUM_PACKAGE);
    return _t;
}
const std::set<java_class_t::constant_pool_entry_t::tag_enum_t> java_class_t::constant_pool_entry_t::_values_tag_enum_t = java_class_t::constant_pool_entry_t::_build_values_tag_enum_t();
bool java_class_t::constant_pool_entry_t::_is_defined_tag_enum_t(java_class_t::constant_pool_entry_t::tag_enum_t v) {
    return java_class_t::constant_pool_entry_t::_values_tag_enum_t.find(v) != java_class_t::constant_pool_entry_t::_values_tag_enum_t.end();
}

java_class_t::constant_pool_entry_t::constant_pool_entry_t(bool p_is_prev_two_entries, kaitai::kstream* p__io, java_class_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_is_prev_two_entries = p_is_prev_two_entries;
    f_is_two_entries = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::constant_pool_entry_t::_read() {
    n_tag = true;
    if (!(is_prev_two_entries())) {
        n_tag = false;
        m_tag = static_cast<java_class_t::constant_pool_entry_t::tag_enum_t>(m__io->read_u1());
    }
    n_cp_info = true;
    if (!(is_prev_two_entries())) {
        n_cp_info = false;
        n_cp_info = true;
        switch (tag()) {
        case java_class_t::constant_pool_entry_t::TAG_ENUM_CLASS_TYPE: {
            n_cp_info = false;
            m_cp_info = new class_cp_info_t(m__io, this, m__root);
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_DOUBLE: {
            n_cp_info = false;
            m_cp_info = new double_cp_info_t(m__io, this, m__root);
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_DYNAMIC: {
            n_cp_info = false;
            m_cp_info = new dynamic_cp_info_t(m__io, this, m__root);
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_FIELD_REF: {
            n_cp_info = false;
            m_cp_info = new field_ref_cp_info_t(m__io, this, m__root);
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_FLOAT: {
            n_cp_info = false;
            m_cp_info = new float_cp_info_t(m__io, this, m__root);
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_INTEGER: {
            n_cp_info = false;
            m_cp_info = new integer_cp_info_t(m__io, this, m__root);
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_INTERFACE_METHOD_REF: {
            n_cp_info = false;
            m_cp_info = new interface_method_ref_cp_info_t(m__io, this, m__root);
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_INVOKE_DYNAMIC: {
            n_cp_info = false;
            m_cp_info = new invoke_dynamic_cp_info_t(m__io, this, m__root);
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_LONG: {
            n_cp_info = false;
            m_cp_info = new long_cp_info_t(m__io, this, m__root);
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_METHOD_HANDLE: {
            n_cp_info = false;
            m_cp_info = new method_handle_cp_info_t(m__io, this, m__root);
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_METHOD_REF: {
            n_cp_info = false;
            m_cp_info = new method_ref_cp_info_t(m__io, this, m__root);
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_METHOD_TYPE: {
            n_cp_info = false;
            m_cp_info = new method_type_cp_info_t(m__io, this, m__root);
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_MODULE: {
            n_cp_info = false;
            m_cp_info = new module_package_cp_info_t(m__io, this, m__root);
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_NAME_AND_TYPE: {
            n_cp_info = false;
            m_cp_info = new name_and_type_cp_info_t(m__io, this, m__root);
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_PACKAGE: {
            n_cp_info = false;
            m_cp_info = new module_package_cp_info_t(m__io, this, m__root);
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_STRING: {
            n_cp_info = false;
            m_cp_info = new string_cp_info_t(m__io, this, m__root);
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_UTF8: {
            n_cp_info = false;
            m_cp_info = new utf8_cp_info_t(m__io, this, m__root);
            break;
        }
        }
    }
}

java_class_t::constant_pool_entry_t::~constant_pool_entry_t() {
    _clean_up();
}

void java_class_t::constant_pool_entry_t::_clean_up() {
    if (!n_tag) {
    }
    if (!n_cp_info) {
        if (m_cp_info) {
            delete m_cp_info; m_cp_info = 0;
        }
    }
}

bool java_class_t::constant_pool_entry_t::is_two_entries() {
    if (f_is_two_entries)
        return m_is_two_entries;
    f_is_two_entries = true;
    m_is_two_entries = ((is_prev_two_entries()) ? (false) : ( ((tag() == java_class_t::constant_pool_entry_t::TAG_ENUM_LONG) || (tag() == java_class_t::constant_pool_entry_t::TAG_ENUM_DOUBLE)) ));
    return m_is_two_entries;
}

java_class_t::double_cp_info_t::double_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::double_cp_info_t::_read() {
    m_value = m__io->read_f8be();
}

java_class_t::double_cp_info_t::~double_cp_info_t() {
    _clean_up();
}

void java_class_t::double_cp_info_t::_clean_up() {
}

java_class_t::dynamic_cp_info_t::dynamic_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__unnamed0 = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::dynamic_cp_info_t::_read() {
    m__unnamed0 = new version_guard_t(55, m__io, this, m__root);
    m_bootstrap_method_attr_index = m__io->read_u2be();
    m_name_and_type_index = m__io->read_u2be();
}

java_class_t::dynamic_cp_info_t::~dynamic_cp_info_t() {
    _clean_up();
}

void java_class_t::dynamic_cp_info_t::_clean_up() {
    if (m__unnamed0) {
        delete m__unnamed0; m__unnamed0 = 0;
    }
}

java_class_t::field_info_t::field_info_t(kaitai::kstream* p__io, java_class_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_attributes = 0;
    f_name_as_str = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::field_info_t::_read() {
    m_access_flags = m__io->read_u2be();
    m_name_index = m__io->read_u2be();
    m_descriptor_index = m__io->read_u2be();
    m_attributes_count = m__io->read_u2be();
    m_attributes = new std::vector<attribute_info_t*>();
    const int l_attributes = attributes_count();
    for (int i = 0; i < l_attributes; i++) {
        m_attributes->push_back(new attribute_info_t(m__io, this, m__root));
    }
}

java_class_t::field_info_t::~field_info_t() {
    _clean_up();
}

void java_class_t::field_info_t::_clean_up() {
    if (m_attributes) {
        for (std::vector<attribute_info_t*>::iterator it = m_attributes->begin(); it != m_attributes->end(); ++it) {
            delete *it;
        }
        delete m_attributes; m_attributes = 0;
    }
}

std::string java_class_t::field_info_t::name_as_str() {
    if (f_name_as_str)
        return m_name_as_str;
    f_name_as_str = true;
    m_name_as_str = static_cast<java_class_t::utf8_cp_info_t*>(_root()->constant_pool()->at(name_index() - 1)->cp_info())->value();
    return m_name_as_str;
}

java_class_t::field_ref_cp_info_t::field_ref_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_class_as_info = false;
    f_name_and_type_as_info = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::field_ref_cp_info_t::_read() {
    m_class_index = m__io->read_u2be();
    m_name_and_type_index = m__io->read_u2be();
}

java_class_t::field_ref_cp_info_t::~field_ref_cp_info_t() {
    _clean_up();
}

void java_class_t::field_ref_cp_info_t::_clean_up() {
}

java_class_t::class_cp_info_t* java_class_t::field_ref_cp_info_t::class_as_info() {
    if (f_class_as_info)
        return m_class_as_info;
    f_class_as_info = true;
    m_class_as_info = static_cast<java_class_t::class_cp_info_t*>(_root()->constant_pool()->at(class_index() - 1)->cp_info());
    return m_class_as_info;
}

java_class_t::name_and_type_cp_info_t* java_class_t::field_ref_cp_info_t::name_and_type_as_info() {
    if (f_name_and_type_as_info)
        return m_name_and_type_as_info;
    f_name_and_type_as_info = true;
    m_name_and_type_as_info = static_cast<java_class_t::name_and_type_cp_info_t*>(_root()->constant_pool()->at(name_and_type_index() - 1)->cp_info());
    return m_name_and_type_as_info;
}

java_class_t::float_cp_info_t::float_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::float_cp_info_t::_read() {
    m_value = m__io->read_f4be();
}

java_class_t::float_cp_info_t::~float_cp_info_t() {
    _clean_up();
}

void java_class_t::float_cp_info_t::_clean_up() {
}

java_class_t::integer_cp_info_t::integer_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::integer_cp_info_t::_read() {
    m_value = m__io->read_u4be();
}

java_class_t::integer_cp_info_t::~integer_cp_info_t() {
    _clean_up();
}

void java_class_t::integer_cp_info_t::_clean_up() {
}

java_class_t::interface_method_ref_cp_info_t::interface_method_ref_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_class_as_info = false;
    f_name_and_type_as_info = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::interface_method_ref_cp_info_t::_read() {
    m_class_index = m__io->read_u2be();
    m_name_and_type_index = m__io->read_u2be();
}

java_class_t::interface_method_ref_cp_info_t::~interface_method_ref_cp_info_t() {
    _clean_up();
}

void java_class_t::interface_method_ref_cp_info_t::_clean_up() {
}

java_class_t::class_cp_info_t* java_class_t::interface_method_ref_cp_info_t::class_as_info() {
    if (f_class_as_info)
        return m_class_as_info;
    f_class_as_info = true;
    m_class_as_info = static_cast<java_class_t::class_cp_info_t*>(_root()->constant_pool()->at(class_index() - 1)->cp_info());
    return m_class_as_info;
}

java_class_t::name_and_type_cp_info_t* java_class_t::interface_method_ref_cp_info_t::name_and_type_as_info() {
    if (f_name_and_type_as_info)
        return m_name_and_type_as_info;
    f_name_and_type_as_info = true;
    m_name_and_type_as_info = static_cast<java_class_t::name_and_type_cp_info_t*>(_root()->constant_pool()->at(name_and_type_index() - 1)->cp_info());
    return m_name_and_type_as_info;
}

java_class_t::invoke_dynamic_cp_info_t::invoke_dynamic_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__unnamed0 = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::invoke_dynamic_cp_info_t::_read() {
    m__unnamed0 = new version_guard_t(51, m__io, this, m__root);
    m_bootstrap_method_attr_index = m__io->read_u2be();
    m_name_and_type_index = m__io->read_u2be();
}

java_class_t::invoke_dynamic_cp_info_t::~invoke_dynamic_cp_info_t() {
    _clean_up();
}

void java_class_t::invoke_dynamic_cp_info_t::_clean_up() {
    if (m__unnamed0) {
        delete m__unnamed0; m__unnamed0 = 0;
    }
}

java_class_t::long_cp_info_t::long_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::long_cp_info_t::_read() {
    m_value = m__io->read_u8be();
}

java_class_t::long_cp_info_t::~long_cp_info_t() {
    _clean_up();
}

void java_class_t::long_cp_info_t::_clean_up() {
}
std::set<java_class_t::method_handle_cp_info_t::reference_kind_enum_t> java_class_t::method_handle_cp_info_t::_build_values_reference_kind_enum_t() {
    std::set<java_class_t::method_handle_cp_info_t::reference_kind_enum_t> _t;
    _t.insert(java_class_t::method_handle_cp_info_t::REFERENCE_KIND_ENUM_GET_FIELD);
    _t.insert(java_class_t::method_handle_cp_info_t::REFERENCE_KIND_ENUM_GET_STATIC);
    _t.insert(java_class_t::method_handle_cp_info_t::REFERENCE_KIND_ENUM_PUT_FIELD);
    _t.insert(java_class_t::method_handle_cp_info_t::REFERENCE_KIND_ENUM_PUT_STATIC);
    _t.insert(java_class_t::method_handle_cp_info_t::REFERENCE_KIND_ENUM_INVOKE_VIRTUAL);
    _t.insert(java_class_t::method_handle_cp_info_t::REFERENCE_KIND_ENUM_INVOKE_STATIC);
    _t.insert(java_class_t::method_handle_cp_info_t::REFERENCE_KIND_ENUM_INVOKE_SPECIAL);
    _t.insert(java_class_t::method_handle_cp_info_t::REFERENCE_KIND_ENUM_NEW_INVOKE_SPECIAL);
    _t.insert(java_class_t::method_handle_cp_info_t::REFERENCE_KIND_ENUM_INVOKE_INTERFACE);
    return _t;
}
const std::set<java_class_t::method_handle_cp_info_t::reference_kind_enum_t> java_class_t::method_handle_cp_info_t::_values_reference_kind_enum_t = java_class_t::method_handle_cp_info_t::_build_values_reference_kind_enum_t();
bool java_class_t::method_handle_cp_info_t::_is_defined_reference_kind_enum_t(java_class_t::method_handle_cp_info_t::reference_kind_enum_t v) {
    return java_class_t::method_handle_cp_info_t::_values_reference_kind_enum_t.find(v) != java_class_t::method_handle_cp_info_t::_values_reference_kind_enum_t.end();
}

java_class_t::method_handle_cp_info_t::method_handle_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__unnamed0 = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::method_handle_cp_info_t::_read() {
    m__unnamed0 = new version_guard_t(51, m__io, this, m__root);
    m_reference_kind = static_cast<java_class_t::method_handle_cp_info_t::reference_kind_enum_t>(m__io->read_u1());
    m_reference_index = m__io->read_u2be();
}

java_class_t::method_handle_cp_info_t::~method_handle_cp_info_t() {
    _clean_up();
}

void java_class_t::method_handle_cp_info_t::_clean_up() {
    if (m__unnamed0) {
        delete m__unnamed0; m__unnamed0 = 0;
    }
}

java_class_t::method_info_t::method_info_t(kaitai::kstream* p__io, java_class_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_attributes = 0;
    f_name_as_str = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::method_info_t::_read() {
    m_access_flags = m__io->read_u2be();
    m_name_index = m__io->read_u2be();
    m_descriptor_index = m__io->read_u2be();
    m_attributes_count = m__io->read_u2be();
    m_attributes = new std::vector<attribute_info_t*>();
    const int l_attributes = attributes_count();
    for (int i = 0; i < l_attributes; i++) {
        m_attributes->push_back(new attribute_info_t(m__io, this, m__root));
    }
}

java_class_t::method_info_t::~method_info_t() {
    _clean_up();
}

void java_class_t::method_info_t::_clean_up() {
    if (m_attributes) {
        for (std::vector<attribute_info_t*>::iterator it = m_attributes->begin(); it != m_attributes->end(); ++it) {
            delete *it;
        }
        delete m_attributes; m_attributes = 0;
    }
}

std::string java_class_t::method_info_t::name_as_str() {
    if (f_name_as_str)
        return m_name_as_str;
    f_name_as_str = true;
    m_name_as_str = static_cast<java_class_t::utf8_cp_info_t*>(_root()->constant_pool()->at(name_index() - 1)->cp_info())->value();
    return m_name_as_str;
}

java_class_t::method_ref_cp_info_t::method_ref_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_class_as_info = false;
    f_name_and_type_as_info = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::method_ref_cp_info_t::_read() {
    m_class_index = m__io->read_u2be();
    m_name_and_type_index = m__io->read_u2be();
}

java_class_t::method_ref_cp_info_t::~method_ref_cp_info_t() {
    _clean_up();
}

void java_class_t::method_ref_cp_info_t::_clean_up() {
}

java_class_t::class_cp_info_t* java_class_t::method_ref_cp_info_t::class_as_info() {
    if (f_class_as_info)
        return m_class_as_info;
    f_class_as_info = true;
    m_class_as_info = static_cast<java_class_t::class_cp_info_t*>(_root()->constant_pool()->at(class_index() - 1)->cp_info());
    return m_class_as_info;
}

java_class_t::name_and_type_cp_info_t* java_class_t::method_ref_cp_info_t::name_and_type_as_info() {
    if (f_name_and_type_as_info)
        return m_name_and_type_as_info;
    f_name_and_type_as_info = true;
    m_name_and_type_as_info = static_cast<java_class_t::name_and_type_cp_info_t*>(_root()->constant_pool()->at(name_and_type_index() - 1)->cp_info());
    return m_name_and_type_as_info;
}

java_class_t::method_type_cp_info_t::method_type_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__unnamed0 = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::method_type_cp_info_t::_read() {
    m__unnamed0 = new version_guard_t(51, m__io, this, m__root);
    m_descriptor_index = m__io->read_u2be();
}

java_class_t::method_type_cp_info_t::~method_type_cp_info_t() {
    _clean_up();
}

void java_class_t::method_type_cp_info_t::_clean_up() {
    if (m__unnamed0) {
        delete m__unnamed0; m__unnamed0 = 0;
    }
}

java_class_t::module_package_cp_info_t::module_package_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__unnamed0 = 0;
    f_name_as_info = false;
    f_name_as_str = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::module_package_cp_info_t::_read() {
    m__unnamed0 = new version_guard_t(53, m__io, this, m__root);
    m_name_index = m__io->read_u2be();
}

java_class_t::module_package_cp_info_t::~module_package_cp_info_t() {
    _clean_up();
}

void java_class_t::module_package_cp_info_t::_clean_up() {
    if (m__unnamed0) {
        delete m__unnamed0; m__unnamed0 = 0;
    }
}

java_class_t::utf8_cp_info_t* java_class_t::module_package_cp_info_t::name_as_info() {
    if (f_name_as_info)
        return m_name_as_info;
    f_name_as_info = true;
    m_name_as_info = static_cast<java_class_t::utf8_cp_info_t*>(_root()->constant_pool()->at(name_index() - 1)->cp_info());
    return m_name_as_info;
}

std::string java_class_t::module_package_cp_info_t::name_as_str() {
    if (f_name_as_str)
        return m_name_as_str;
    f_name_as_str = true;
    m_name_as_str = name_as_info()->value();
    return m_name_as_str;
}

java_class_t::name_and_type_cp_info_t::name_and_type_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_descriptor_as_info = false;
    f_descriptor_as_str = false;
    f_name_as_info = false;
    f_name_as_str = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::name_and_type_cp_info_t::_read() {
    m_name_index = m__io->read_u2be();
    m_descriptor_index = m__io->read_u2be();
}

java_class_t::name_and_type_cp_info_t::~name_and_type_cp_info_t() {
    _clean_up();
}

void java_class_t::name_and_type_cp_info_t::_clean_up() {
}

java_class_t::utf8_cp_info_t* java_class_t::name_and_type_cp_info_t::descriptor_as_info() {
    if (f_descriptor_as_info)
        return m_descriptor_as_info;
    f_descriptor_as_info = true;
    m_descriptor_as_info = static_cast<java_class_t::utf8_cp_info_t*>(_root()->constant_pool()->at(descriptor_index() - 1)->cp_info());
    return m_descriptor_as_info;
}

std::string java_class_t::name_and_type_cp_info_t::descriptor_as_str() {
    if (f_descriptor_as_str)
        return m_descriptor_as_str;
    f_descriptor_as_str = true;
    m_descriptor_as_str = descriptor_as_info()->value();
    return m_descriptor_as_str;
}

java_class_t::utf8_cp_info_t* java_class_t::name_and_type_cp_info_t::name_as_info() {
    if (f_name_as_info)
        return m_name_as_info;
    f_name_as_info = true;
    m_name_as_info = static_cast<java_class_t::utf8_cp_info_t*>(_root()->constant_pool()->at(name_index() - 1)->cp_info());
    return m_name_as_info;
}

std::string java_class_t::name_and_type_cp_info_t::name_as_str() {
    if (f_name_as_str)
        return m_name_as_str;
    f_name_as_str = true;
    m_name_as_str = name_as_info()->value();
    return m_name_as_str;
}

java_class_t::string_cp_info_t::string_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::string_cp_info_t::_read() {
    m_string_index = m__io->read_u2be();
}

java_class_t::string_cp_info_t::~string_cp_info_t() {
    _clean_up();
}

void java_class_t::string_cp_info_t::_clean_up() {
}

java_class_t::utf8_cp_info_t::utf8_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::utf8_cp_info_t::_read() {
    m_str_len = m__io->read_u2be();
    m_value = kaitai::kstream::bytes_to_str(m__io->read_bytes(str_len()), "UTF-8");
}

java_class_t::utf8_cp_info_t::~utf8_cp_info_t() {
    _clean_up();
}

void java_class_t::utf8_cp_info_t::_clean_up() {
}

java_class_t::version_guard_t::version_guard_t(uint16_t p_major, kaitai::kstream* p__io, kaitai::kstruct* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_major = p_major;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void java_class_t::version_guard_t::_read() {
    m__unnamed0 = m__io->read_bytes(0);
    {
        std::string _ = m__unnamed0;
        if (!(_root()->version_major() >= major())) {
            throw kaitai::validation_expr_error<std::string>(m__unnamed0, m__io, std::string("/types/version_guard/seq/0"));
        }
    }
}

java_class_t::version_guard_t::~version_guard_t() {
    _clean_up();
}

void java_class_t::version_guard_t::_clean_up() {
}

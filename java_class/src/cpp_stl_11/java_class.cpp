// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "java_class.h"
#include "kaitai/exceptions.h"

java_class_t::java_class_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_constant_pool = nullptr;
    m_interfaces = nullptr;
    m_fields = nullptr;
    m_methods = nullptr;
    m_attributes = nullptr;
    _read();
}

void java_class_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\xCA\xFE\xBA\xBE", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xCA\xFE\xBA\xBE", 4), magic(), _io(), std::string("/seq/0"));
    }
    m_version_minor = m__io->read_u2be();
    m_version_major = m__io->read_u2be();
    if (!(version_major() >= 43)) {
        throw kaitai::validation_less_than_error<uint16_t>(43, version_major(), _io(), std::string("/seq/2"));
    }
    m_constant_pool_count = m__io->read_u2be();
    m_constant_pool = std::unique_ptr<std::vector<std::unique_ptr<constant_pool_entry_t>>>(new std::vector<std::unique_ptr<constant_pool_entry_t>>());
    const int l_constant_pool = (constant_pool_count() - 1);
    for (int i = 0; i < l_constant_pool; i++) {
        m_constant_pool->push_back(std::move(std::unique_ptr<constant_pool_entry_t>(new constant_pool_entry_t(((i != 0) ? (constant_pool()->at((i - 1))->is_two_entries()) : (false)), m__io, this, m__root))));
    }
    m_access_flags = m__io->read_u2be();
    m_this_class = m__io->read_u2be();
    m_super_class = m__io->read_u2be();
    m_interfaces_count = m__io->read_u2be();
    m_interfaces = std::unique_ptr<std::vector<uint16_t>>(new std::vector<uint16_t>());
    const int l_interfaces = interfaces_count();
    for (int i = 0; i < l_interfaces; i++) {
        m_interfaces->push_back(std::move(m__io->read_u2be()));
    }
    m_fields_count = m__io->read_u2be();
    m_fields = std::unique_ptr<std::vector<std::unique_ptr<field_info_t>>>(new std::vector<std::unique_ptr<field_info_t>>());
    const int l_fields = fields_count();
    for (int i = 0; i < l_fields; i++) {
        m_fields->push_back(std::move(std::unique_ptr<field_info_t>(new field_info_t(m__io, this, m__root))));
    }
    m_methods_count = m__io->read_u2be();
    m_methods = std::unique_ptr<std::vector<std::unique_ptr<method_info_t>>>(new std::vector<std::unique_ptr<method_info_t>>());
    const int l_methods = methods_count();
    for (int i = 0; i < l_methods; i++) {
        m_methods->push_back(std::move(std::unique_ptr<method_info_t>(new method_info_t(m__io, this, m__root))));
    }
    m_attributes_count = m__io->read_u2be();
    m_attributes = std::unique_ptr<std::vector<std::unique_ptr<attribute_info_t>>>(new std::vector<std::unique_ptr<attribute_info_t>>());
    const int l_attributes = attributes_count();
    for (int i = 0; i < l_attributes; i++) {
        m_attributes->push_back(std::move(std::unique_ptr<attribute_info_t>(new attribute_info_t(m__io, this, m__root))));
    }
}

java_class_t::~java_class_t() {
    _clean_up();
}

void java_class_t::_clean_up() {
}

java_class_t::float_cp_info_t::float_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void java_class_t::float_cp_info_t::_read() {
    m_value = m__io->read_f4be();
}

java_class_t::float_cp_info_t::~float_cp_info_t() {
    _clean_up();
}

void java_class_t::float_cp_info_t::_clean_up() {
}

java_class_t::attribute_info_t::attribute_info_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_info = nullptr;
    f_name_as_str = false;
    _read();
}

void java_class_t::attribute_info_t::_read() {
    m_name_index = m__io->read_u2be();
    m_attribute_length = m__io->read_u4be();
    n_info = true;
    {
        std::string on = name_as_str();
        if (on == std::string("SourceFile")) {
            n_info = false;
            m__raw_info = m__io->read_bytes(attribute_length());
            m__io__raw_info = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_info));
            m_info = std::unique_ptr<attr_body_source_file_t>(new attr_body_source_file_t(m__io__raw_info.get(), this, m__root));
        }
        else if (on == std::string("LineNumberTable")) {
            n_info = false;
            m__raw_info = m__io->read_bytes(attribute_length());
            m__io__raw_info = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_info));
            m_info = std::unique_ptr<attr_body_line_number_table_t>(new attr_body_line_number_table_t(m__io__raw_info.get(), this, m__root));
        }
        else if (on == std::string("Exceptions")) {
            n_info = false;
            m__raw_info = m__io->read_bytes(attribute_length());
            m__io__raw_info = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_info));
            m_info = std::unique_ptr<attr_body_exceptions_t>(new attr_body_exceptions_t(m__io__raw_info.get(), this, m__root));
        }
        else if (on == std::string("Code")) {
            n_info = false;
            m__raw_info = m__io->read_bytes(attribute_length());
            m__io__raw_info = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_info));
            m_info = std::unique_ptr<attr_body_code_t>(new attr_body_code_t(m__io__raw_info.get(), this, m__root));
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
    }
}

java_class_t::attribute_info_t::attr_body_code_t::attr_body_code_t(kaitai::kstream* p__io, java_class_t::attribute_info_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_exception_table = nullptr;
    m_attributes = nullptr;
    _read();
}

void java_class_t::attribute_info_t::attr_body_code_t::_read() {
    m_max_stack = m__io->read_u2be();
    m_max_locals = m__io->read_u2be();
    m_code_length = m__io->read_u4be();
    m_code = m__io->read_bytes(code_length());
    m_exception_table_length = m__io->read_u2be();
    m_exception_table = std::unique_ptr<std::vector<std::unique_ptr<exception_entry_t>>>(new std::vector<std::unique_ptr<exception_entry_t>>());
    const int l_exception_table = exception_table_length();
    for (int i = 0; i < l_exception_table; i++) {
        m_exception_table->push_back(std::move(std::unique_ptr<exception_entry_t>(new exception_entry_t(m__io, this, m__root))));
    }
    m_attributes_count = m__io->read_u2be();
    m_attributes = std::unique_ptr<std::vector<std::unique_ptr<attribute_info_t>>>(new std::vector<std::unique_ptr<attribute_info_t>>());
    const int l_attributes = attributes_count();
    for (int i = 0; i < l_attributes; i++) {
        m_attributes->push_back(std::move(std::unique_ptr<attribute_info_t>(new attribute_info_t(m__io, this, m__root))));
    }
}

java_class_t::attribute_info_t::attr_body_code_t::~attr_body_code_t() {
    _clean_up();
}

void java_class_t::attribute_info_t::attr_body_code_t::_clean_up() {
}

java_class_t::attribute_info_t::attr_body_code_t::exception_entry_t::exception_entry_t(kaitai::kstream* p__io, java_class_t::attribute_info_t::attr_body_code_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_catch_exception = false;
    _read();
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
    n_catch_exception = true;
    if (catch_type() != 0) {
        n_catch_exception = false;
        m_catch_exception = _root()->constant_pool()->at((catch_type() - 1));
    }
    f_catch_exception = true;
    return m_catch_exception;
}

java_class_t::attribute_info_t::attr_body_exceptions_t::attr_body_exceptions_t(kaitai::kstream* p__io, java_class_t::attribute_info_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_exceptions = nullptr;
    _read();
}

void java_class_t::attribute_info_t::attr_body_exceptions_t::_read() {
    m_number_of_exceptions = m__io->read_u2be();
    m_exceptions = std::unique_ptr<std::vector<std::unique_ptr<exception_table_entry_t>>>(new std::vector<std::unique_ptr<exception_table_entry_t>>());
    const int l_exceptions = number_of_exceptions();
    for (int i = 0; i < l_exceptions; i++) {
        m_exceptions->push_back(std::move(std::unique_ptr<exception_table_entry_t>(new exception_table_entry_t(m__io, this, m__root))));
    }
}

java_class_t::attribute_info_t::attr_body_exceptions_t::~attr_body_exceptions_t() {
    _clean_up();
}

void java_class_t::attribute_info_t::attr_body_exceptions_t::_clean_up() {
}

java_class_t::attribute_info_t::attr_body_exceptions_t::exception_table_entry_t::exception_table_entry_t(kaitai::kstream* p__io, java_class_t::attribute_info_t::attr_body_exceptions_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_as_info = false;
    f_name_as_str = false;
    _read();
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
    m_as_info = static_cast<java_class_t::class_cp_info_t*>(_root()->constant_pool()->at((index() - 1))->cp_info());
    f_as_info = true;
    return m_as_info;
}

std::string java_class_t::attribute_info_t::attr_body_exceptions_t::exception_table_entry_t::name_as_str() {
    if (f_name_as_str)
        return m_name_as_str;
    m_name_as_str = as_info()->name_as_str();
    f_name_as_str = true;
    return m_name_as_str;
}

java_class_t::attribute_info_t::attr_body_source_file_t::attr_body_source_file_t(kaitai::kstream* p__io, java_class_t::attribute_info_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_sourcefile_as_str = false;
    _read();
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
    m_sourcefile_as_str = static_cast<java_class_t::utf8_cp_info_t*>(_root()->constant_pool()->at((sourcefile_index() - 1))->cp_info())->value();
    f_sourcefile_as_str = true;
    return m_sourcefile_as_str;
}

java_class_t::attribute_info_t::attr_body_line_number_table_t::attr_body_line_number_table_t(kaitai::kstream* p__io, java_class_t::attribute_info_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_line_number_table = nullptr;
    _read();
}

void java_class_t::attribute_info_t::attr_body_line_number_table_t::_read() {
    m_line_number_table_length = m__io->read_u2be();
    m_line_number_table = std::unique_ptr<std::vector<std::unique_ptr<line_number_table_entry_t>>>(new std::vector<std::unique_ptr<line_number_table_entry_t>>());
    const int l_line_number_table = line_number_table_length();
    for (int i = 0; i < l_line_number_table; i++) {
        m_line_number_table->push_back(std::move(std::unique_ptr<line_number_table_entry_t>(new line_number_table_entry_t(m__io, this, m__root))));
    }
}

java_class_t::attribute_info_t::attr_body_line_number_table_t::~attr_body_line_number_table_t() {
    _clean_up();
}

void java_class_t::attribute_info_t::attr_body_line_number_table_t::_clean_up() {
}

java_class_t::attribute_info_t::attr_body_line_number_table_t::line_number_table_entry_t::line_number_table_entry_t(kaitai::kstream* p__io, java_class_t::attribute_info_t::attr_body_line_number_table_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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

std::string java_class_t::attribute_info_t::name_as_str() {
    if (f_name_as_str)
        return m_name_as_str;
    m_name_as_str = static_cast<java_class_t::utf8_cp_info_t*>(_root()->constant_pool()->at((name_index() - 1))->cp_info())->value();
    f_name_as_str = true;
    return m_name_as_str;
}

java_class_t::method_ref_cp_info_t::method_ref_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_class_as_info = false;
    f_name_and_type_as_info = false;
    _read();
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
    m_class_as_info = static_cast<java_class_t::class_cp_info_t*>(_root()->constant_pool()->at((class_index() - 1))->cp_info());
    f_class_as_info = true;
    return m_class_as_info;
}

java_class_t::name_and_type_cp_info_t* java_class_t::method_ref_cp_info_t::name_and_type_as_info() {
    if (f_name_and_type_as_info)
        return m_name_and_type_as_info;
    m_name_and_type_as_info = static_cast<java_class_t::name_and_type_cp_info_t*>(_root()->constant_pool()->at((name_and_type_index() - 1))->cp_info());
    f_name_and_type_as_info = true;
    return m_name_and_type_as_info;
}

java_class_t::field_info_t::field_info_t(kaitai::kstream* p__io, java_class_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_attributes = nullptr;
    f_name_as_str = false;
    _read();
}

void java_class_t::field_info_t::_read() {
    m_access_flags = m__io->read_u2be();
    m_name_index = m__io->read_u2be();
    m_descriptor_index = m__io->read_u2be();
    m_attributes_count = m__io->read_u2be();
    m_attributes = std::unique_ptr<std::vector<std::unique_ptr<attribute_info_t>>>(new std::vector<std::unique_ptr<attribute_info_t>>());
    const int l_attributes = attributes_count();
    for (int i = 0; i < l_attributes; i++) {
        m_attributes->push_back(std::move(std::unique_ptr<attribute_info_t>(new attribute_info_t(m__io, this, m__root))));
    }
}

java_class_t::field_info_t::~field_info_t() {
    _clean_up();
}

void java_class_t::field_info_t::_clean_up() {
}

std::string java_class_t::field_info_t::name_as_str() {
    if (f_name_as_str)
        return m_name_as_str;
    m_name_as_str = static_cast<java_class_t::utf8_cp_info_t*>(_root()->constant_pool()->at((name_index() - 1))->cp_info())->value();
    f_name_as_str = true;
    return m_name_as_str;
}

java_class_t::double_cp_info_t::double_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void java_class_t::double_cp_info_t::_read() {
    m_value = m__io->read_f8be();
}

java_class_t::double_cp_info_t::~double_cp_info_t() {
    _clean_up();
}

void java_class_t::double_cp_info_t::_clean_up() {
}

java_class_t::long_cp_info_t::long_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void java_class_t::long_cp_info_t::_read() {
    m_value = m__io->read_u8be();
}

java_class_t::long_cp_info_t::~long_cp_info_t() {
    _clean_up();
}

void java_class_t::long_cp_info_t::_clean_up() {
}

java_class_t::invoke_dynamic_cp_info_t::invoke_dynamic_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void java_class_t::invoke_dynamic_cp_info_t::_read() {
    m_bootstrap_method_attr_index = m__io->read_u2be();
    m_name_and_type_index = m__io->read_u2be();
}

java_class_t::invoke_dynamic_cp_info_t::~invoke_dynamic_cp_info_t() {
    _clean_up();
}

void java_class_t::invoke_dynamic_cp_info_t::_clean_up() {
}

java_class_t::method_handle_cp_info_t::method_handle_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void java_class_t::method_handle_cp_info_t::_read() {
    m_reference_kind = static_cast<java_class_t::method_handle_cp_info_t::reference_kind_enum_t>(m__io->read_u1());
    m_reference_index = m__io->read_u2be();
}

java_class_t::method_handle_cp_info_t::~method_handle_cp_info_t() {
    _clean_up();
}

void java_class_t::method_handle_cp_info_t::_clean_up() {
}

java_class_t::name_and_type_cp_info_t::name_and_type_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_name_as_info = false;
    f_name_as_str = false;
    f_descriptor_as_info = false;
    f_descriptor_as_str = false;
    _read();
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

java_class_t::utf8_cp_info_t* java_class_t::name_and_type_cp_info_t::name_as_info() {
    if (f_name_as_info)
        return m_name_as_info;
    m_name_as_info = static_cast<java_class_t::utf8_cp_info_t*>(_root()->constant_pool()->at((name_index() - 1))->cp_info());
    f_name_as_info = true;
    return m_name_as_info;
}

std::string java_class_t::name_and_type_cp_info_t::name_as_str() {
    if (f_name_as_str)
        return m_name_as_str;
    m_name_as_str = name_as_info()->value();
    f_name_as_str = true;
    return m_name_as_str;
}

java_class_t::utf8_cp_info_t* java_class_t::name_and_type_cp_info_t::descriptor_as_info() {
    if (f_descriptor_as_info)
        return m_descriptor_as_info;
    m_descriptor_as_info = static_cast<java_class_t::utf8_cp_info_t*>(_root()->constant_pool()->at((descriptor_index() - 1))->cp_info());
    f_descriptor_as_info = true;
    return m_descriptor_as_info;
}

std::string java_class_t::name_and_type_cp_info_t::descriptor_as_str() {
    if (f_descriptor_as_str)
        return m_descriptor_as_str;
    m_descriptor_as_str = descriptor_as_info()->value();
    f_descriptor_as_str = true;
    return m_descriptor_as_str;
}

java_class_t::utf8_cp_info_t::utf8_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void java_class_t::utf8_cp_info_t::_read() {
    m_str_len = m__io->read_u2be();
    m_value = kaitai::kstream::bytes_to_str(m__io->read_bytes(str_len()), std::string("UTF-8"));
}

java_class_t::utf8_cp_info_t::~utf8_cp_info_t() {
    _clean_up();
}

void java_class_t::utf8_cp_info_t::_clean_up() {
}

java_class_t::string_cp_info_t::string_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void java_class_t::string_cp_info_t::_read() {
    m_string_index = m__io->read_u2be();
}

java_class_t::string_cp_info_t::~string_cp_info_t() {
    _clean_up();
}

void java_class_t::string_cp_info_t::_clean_up() {
}

java_class_t::method_type_cp_info_t::method_type_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void java_class_t::method_type_cp_info_t::_read() {
    m_descriptor_index = m__io->read_u2be();
}

java_class_t::method_type_cp_info_t::~method_type_cp_info_t() {
    _clean_up();
}

void java_class_t::method_type_cp_info_t::_clean_up() {
}

java_class_t::interface_method_ref_cp_info_t::interface_method_ref_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_class_as_info = false;
    f_name_and_type_as_info = false;
    _read();
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
    m_class_as_info = static_cast<java_class_t::class_cp_info_t*>(_root()->constant_pool()->at((class_index() - 1))->cp_info());
    f_class_as_info = true;
    return m_class_as_info;
}

java_class_t::name_and_type_cp_info_t* java_class_t::interface_method_ref_cp_info_t::name_and_type_as_info() {
    if (f_name_and_type_as_info)
        return m_name_and_type_as_info;
    m_name_and_type_as_info = static_cast<java_class_t::name_and_type_cp_info_t*>(_root()->constant_pool()->at((name_and_type_index() - 1))->cp_info());
    f_name_and_type_as_info = true;
    return m_name_and_type_as_info;
}

java_class_t::class_cp_info_t::class_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_name_as_info = false;
    f_name_as_str = false;
    _read();
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
    m_name_as_info = static_cast<java_class_t::utf8_cp_info_t*>(_root()->constant_pool()->at((name_index() - 1))->cp_info());
    f_name_as_info = true;
    return m_name_as_info;
}

std::string java_class_t::class_cp_info_t::name_as_str() {
    if (f_name_as_str)
        return m_name_as_str;
    m_name_as_str = name_as_info()->value();
    f_name_as_str = true;
    return m_name_as_str;
}

java_class_t::constant_pool_entry_t::constant_pool_entry_t(bool p_is_prev_two_entries, kaitai::kstream* p__io, java_class_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_is_prev_two_entries = p_is_prev_two_entries;
    f_is_two_entries = false;
    _read();
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
        case java_class_t::constant_pool_entry_t::TAG_ENUM_INTERFACE_METHOD_REF: {
            n_cp_info = false;
            m_cp_info = std::unique_ptr<interface_method_ref_cp_info_t>(new interface_method_ref_cp_info_t(m__io, this, m__root));
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_CLASS_TYPE: {
            n_cp_info = false;
            m_cp_info = std::unique_ptr<class_cp_info_t>(new class_cp_info_t(m__io, this, m__root));
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_UTF8: {
            n_cp_info = false;
            m_cp_info = std::unique_ptr<utf8_cp_info_t>(new utf8_cp_info_t(m__io, this, m__root));
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_METHOD_TYPE: {
            n_cp_info = false;
            m_cp_info = std::unique_ptr<method_type_cp_info_t>(new method_type_cp_info_t(m__io, this, m__root));
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_INTEGER: {
            n_cp_info = false;
            m_cp_info = std::unique_ptr<integer_cp_info_t>(new integer_cp_info_t(m__io, this, m__root));
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_STRING: {
            n_cp_info = false;
            m_cp_info = std::unique_ptr<string_cp_info_t>(new string_cp_info_t(m__io, this, m__root));
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_FLOAT: {
            n_cp_info = false;
            m_cp_info = std::unique_ptr<float_cp_info_t>(new float_cp_info_t(m__io, this, m__root));
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_LONG: {
            n_cp_info = false;
            m_cp_info = std::unique_ptr<long_cp_info_t>(new long_cp_info_t(m__io, this, m__root));
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_METHOD_REF: {
            n_cp_info = false;
            m_cp_info = std::unique_ptr<method_ref_cp_info_t>(new method_ref_cp_info_t(m__io, this, m__root));
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_DOUBLE: {
            n_cp_info = false;
            m_cp_info = std::unique_ptr<double_cp_info_t>(new double_cp_info_t(m__io, this, m__root));
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_INVOKE_DYNAMIC: {
            n_cp_info = false;
            m_cp_info = std::unique_ptr<invoke_dynamic_cp_info_t>(new invoke_dynamic_cp_info_t(m__io, this, m__root));
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_FIELD_REF: {
            n_cp_info = false;
            m_cp_info = std::unique_ptr<field_ref_cp_info_t>(new field_ref_cp_info_t(m__io, this, m__root));
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_METHOD_HANDLE: {
            n_cp_info = false;
            m_cp_info = std::unique_ptr<method_handle_cp_info_t>(new method_handle_cp_info_t(m__io, this, m__root));
            break;
        }
        case java_class_t::constant_pool_entry_t::TAG_ENUM_NAME_AND_TYPE: {
            n_cp_info = false;
            m_cp_info = std::unique_ptr<name_and_type_cp_info_t>(new name_and_type_cp_info_t(m__io, this, m__root));
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
    }
}

bool java_class_t::constant_pool_entry_t::is_two_entries() {
    if (f_is_two_entries)
        return m_is_two_entries;
    m_is_two_entries = ((is_prev_two_entries()) ? (false) : ( ((tag() == java_class_t::constant_pool_entry_t::TAG_ENUM_LONG) || (tag() == java_class_t::constant_pool_entry_t::TAG_ENUM_DOUBLE)) ));
    f_is_two_entries = true;
    return m_is_two_entries;
}

java_class_t::method_info_t::method_info_t(kaitai::kstream* p__io, java_class_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_attributes = nullptr;
    f_name_as_str = false;
    _read();
}

void java_class_t::method_info_t::_read() {
    m_access_flags = m__io->read_u2be();
    m_name_index = m__io->read_u2be();
    m_descriptor_index = m__io->read_u2be();
    m_attributes_count = m__io->read_u2be();
    m_attributes = std::unique_ptr<std::vector<std::unique_ptr<attribute_info_t>>>(new std::vector<std::unique_ptr<attribute_info_t>>());
    const int l_attributes = attributes_count();
    for (int i = 0; i < l_attributes; i++) {
        m_attributes->push_back(std::move(std::unique_ptr<attribute_info_t>(new attribute_info_t(m__io, this, m__root))));
    }
}

java_class_t::method_info_t::~method_info_t() {
    _clean_up();
}

void java_class_t::method_info_t::_clean_up() {
}

std::string java_class_t::method_info_t::name_as_str() {
    if (f_name_as_str)
        return m_name_as_str;
    m_name_as_str = static_cast<java_class_t::utf8_cp_info_t*>(_root()->constant_pool()->at((name_index() - 1))->cp_info())->value();
    f_name_as_str = true;
    return m_name_as_str;
}

java_class_t::integer_cp_info_t::integer_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void java_class_t::integer_cp_info_t::_read() {
    m_value = m__io->read_u4be();
}

java_class_t::integer_cp_info_t::~integer_cp_info_t() {
    _clean_up();
}

void java_class_t::integer_cp_info_t::_clean_up() {
}

java_class_t::field_ref_cp_info_t::field_ref_cp_info_t(kaitai::kstream* p__io, java_class_t::constant_pool_entry_t* p__parent, java_class_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_class_as_info = false;
    f_name_and_type_as_info = false;
    _read();
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
    m_class_as_info = static_cast<java_class_t::class_cp_info_t*>(_root()->constant_pool()->at((class_index() - 1))->cp_info());
    f_class_as_info = true;
    return m_class_as_info;
}

java_class_t::name_and_type_cp_info_t* java_class_t::field_ref_cp_info_t::name_and_type_as_info() {
    if (f_name_and_type_as_info)
        return m_name_and_type_as_info;
    m_name_and_type_as_info = static_cast<java_class_t::name_and_type_cp_info_t*>(_root()->constant_pool()->at((name_and_type_index() - 1))->cp_info());
    f_name_and_type_as_info = true;
    return m_name_and_type_as_info;
}

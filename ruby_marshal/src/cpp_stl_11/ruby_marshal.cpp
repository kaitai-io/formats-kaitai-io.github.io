// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "ruby_marshal.h"
#include "kaitai/exceptions.h"
const std::set<ruby_marshal_t::codes_t> ruby_marshal_t::_values_codes_t{
    ruby_marshal_t::CODES_RUBY_STRING,
    ruby_marshal_t::CODES_CONST_NIL,
    ruby_marshal_t::CODES_RUBY_SYMBOL,
    ruby_marshal_t::CODES_RUBY_SYMBOL_LINK,
    ruby_marshal_t::CODES_RUBY_OBJECT_LINK,
    ruby_marshal_t::CODES_CONST_FALSE,
    ruby_marshal_t::CODES_INSTANCE_VAR,
    ruby_marshal_t::CODES_RUBY_STRUCT,
    ruby_marshal_t::CODES_CONST_TRUE,
    ruby_marshal_t::CODES_RUBY_ARRAY,
    ruby_marshal_t::CODES_PACKED_INT,
    ruby_marshal_t::CODES_BIGNUM,
    ruby_marshal_t::CODES_RUBY_HASH,
};
bool ruby_marshal_t::_is_defined_codes_t(ruby_marshal_t::codes_t v) {
    return ruby_marshal_t::_values_codes_t.find(v) != ruby_marshal_t::_values_codes_t.end();
}

ruby_marshal_t::ruby_marshal_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ruby_marshal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_records = nullptr;
    _read();
}

void ruby_marshal_t::_read() {
    m_version = m__io->read_bytes(2);
    if (!(m_version == std::string("\x04\x08", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x04\x08", 2), m_version, m__io, std::string("/seq/0"));
    }
    m_records = std::unique_ptr<record_t>(new record_t(m__io, this, m__root));
}

ruby_marshal_t::~ruby_marshal_t() {
    _clean_up();
}

void ruby_marshal_t::_clean_up() {
}

ruby_marshal_t::bignum_t::bignum_t(kaitai::kstream* p__io, ruby_marshal_t::record_t* p__parent, ruby_marshal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_len_div_2 = nullptr;
    _read();
}

void ruby_marshal_t::bignum_t::_read() {
    m_sign = m__io->read_u1();
    m_len_div_2 = std::unique_ptr<packed_int_t>(new packed_int_t(m__io, this, m__root));
    m_body = m__io->read_bytes(len_div_2()->value() * 2);
}

ruby_marshal_t::bignum_t::~bignum_t() {
    _clean_up();
}

void ruby_marshal_t::bignum_t::_clean_up() {
}

ruby_marshal_t::instance_var_t::instance_var_t(kaitai::kstream* p__io, ruby_marshal_t::record_t* p__parent, ruby_marshal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_obj = nullptr;
    m_num_vars = nullptr;
    m_vars = nullptr;
    _read();
}

void ruby_marshal_t::instance_var_t::_read() {
    m_obj = std::unique_ptr<record_t>(new record_t(m__io, this, m__root));
    m_num_vars = std::unique_ptr<packed_int_t>(new packed_int_t(m__io, this, m__root));
    m_vars = std::unique_ptr<std::vector<std::unique_ptr<pair_t>>>(new std::vector<std::unique_ptr<pair_t>>());
    const int l_vars = num_vars()->value();
    for (int i = 0; i < l_vars; i++) {
        m_vars->push_back(std::move(std::unique_ptr<pair_t>(new pair_t(m__io, this, m__root))));
    }
}

ruby_marshal_t::instance_var_t::~instance_var_t() {
    _clean_up();
}

void ruby_marshal_t::instance_var_t::_clean_up() {
}

ruby_marshal_t::packed_int_t::packed_int_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ruby_marshal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_is_immediate = false;
    f_value = false;
    _read();
}

void ruby_marshal_t::packed_int_t::_read() {
    m_code = m__io->read_u1();
    n_encoded = true;
    switch (code()) {
    case 1: {
        n_encoded = false;
        m_encoded = m__io->read_u1();
        break;
    }
    case 2: {
        n_encoded = false;
        m_encoded = m__io->read_u2le();
        break;
    }
    case 252: {
        n_encoded = false;
        m_encoded = m__io->read_u4le();
        break;
    }
    case 253: {
        n_encoded = false;
        m_encoded = m__io->read_u2le();
        break;
    }
    case 254: {
        n_encoded = false;
        m_encoded = m__io->read_u2le();
        break;
    }
    case 255: {
        n_encoded = false;
        m_encoded = m__io->read_u1();
        break;
    }
    case 3: {
        n_encoded = false;
        m_encoded = m__io->read_u2le();
        break;
    }
    case 4: {
        n_encoded = false;
        m_encoded = m__io->read_u4le();
        break;
    }
    }
    n_encoded2 = true;
    switch (code()) {
    case 253: {
        n_encoded2 = false;
        m_encoded2 = m__io->read_u1();
        break;
    }
    case 3: {
        n_encoded2 = false;
        m_encoded2 = m__io->read_u1();
        break;
    }
    }
}

ruby_marshal_t::packed_int_t::~packed_int_t() {
    _clean_up();
}

void ruby_marshal_t::packed_int_t::_clean_up() {
    if (!n_encoded) {
    }
    if (!n_encoded2) {
    }
}

bool ruby_marshal_t::packed_int_t::is_immediate() {
    if (f_is_immediate)
        return m_is_immediate;
    f_is_immediate = true;
    m_is_immediate =  ((code() > 4) && (code() < 252)) ;
    return m_is_immediate;
}

int32_t ruby_marshal_t::packed_int_t::value() {
    if (f_value)
        return m_value;
    f_value = true;
    m_value = ((is_immediate()) ? (((code() < 128) ? (code() - 5) : (4 - (~(code()) & 127)))) : (((code() == 0) ? (0) : (((code() == 255) ? (encoded() - 256) : (((code() == 254) ? (encoded() - 65536) : (((code() == 253) ? ((encoded2() << 16 | encoded()) - 16777216) : (((code() == 3) ? (encoded2() << 16 | encoded()) : (encoded()))))))))))));
    return m_value;
}

ruby_marshal_t::pair_t::pair_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ruby_marshal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_key = nullptr;
    m_value = nullptr;
    _read();
}

void ruby_marshal_t::pair_t::_read() {
    m_key = std::unique_ptr<record_t>(new record_t(m__io, this, m__root));
    m_value = std::unique_ptr<record_t>(new record_t(m__io, this, m__root));
}

ruby_marshal_t::pair_t::~pair_t() {
    _clean_up();
}

void ruby_marshal_t::pair_t::_clean_up() {
}

ruby_marshal_t::record_t::record_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ruby_marshal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void ruby_marshal_t::record_t::_read() {
    m_code = static_cast<ruby_marshal_t::codes_t>(m__io->read_u1());
    n_body = true;
    switch (code()) {
    case ruby_marshal_t::CODES_BIGNUM: {
        n_body = false;
        m_body = std::unique_ptr<bignum_t>(new bignum_t(m__io, this, m__root));
        break;
    }
    case ruby_marshal_t::CODES_INSTANCE_VAR: {
        n_body = false;
        m_body = std::unique_ptr<instance_var_t>(new instance_var_t(m__io, this, m__root));
        break;
    }
    case ruby_marshal_t::CODES_PACKED_INT: {
        n_body = false;
        m_body = std::unique_ptr<packed_int_t>(new packed_int_t(m__io, this, m__root));
        break;
    }
    case ruby_marshal_t::CODES_RUBY_ARRAY: {
        n_body = false;
        m_body = std::unique_ptr<ruby_array_t>(new ruby_array_t(m__io, this, m__root));
        break;
    }
    case ruby_marshal_t::CODES_RUBY_HASH: {
        n_body = false;
        m_body = std::unique_ptr<ruby_hash_t>(new ruby_hash_t(m__io, this, m__root));
        break;
    }
    case ruby_marshal_t::CODES_RUBY_OBJECT_LINK: {
        n_body = false;
        m_body = std::unique_ptr<packed_int_t>(new packed_int_t(m__io, this, m__root));
        break;
    }
    case ruby_marshal_t::CODES_RUBY_STRING: {
        n_body = false;
        m_body = std::unique_ptr<ruby_string_t>(new ruby_string_t(m__io, this, m__root));
        break;
    }
    case ruby_marshal_t::CODES_RUBY_STRUCT: {
        n_body = false;
        m_body = std::unique_ptr<ruby_struct_t>(new ruby_struct_t(m__io, this, m__root));
        break;
    }
    case ruby_marshal_t::CODES_RUBY_SYMBOL: {
        n_body = false;
        m_body = std::unique_ptr<ruby_symbol_t>(new ruby_symbol_t(m__io, this, m__root));
        break;
    }
    case ruby_marshal_t::CODES_RUBY_SYMBOL_LINK: {
        n_body = false;
        m_body = std::unique_ptr<packed_int_t>(new packed_int_t(m__io, this, m__root));
        break;
    }
    }
}

ruby_marshal_t::record_t::~record_t() {
    _clean_up();
}

void ruby_marshal_t::record_t::_clean_up() {
    if (!n_body) {
    }
}

ruby_marshal_t::ruby_array_t::ruby_array_t(kaitai::kstream* p__io, ruby_marshal_t::record_t* p__parent, ruby_marshal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_num_elements = nullptr;
    m_elements = nullptr;
    _read();
}

void ruby_marshal_t::ruby_array_t::_read() {
    m_num_elements = std::unique_ptr<packed_int_t>(new packed_int_t(m__io, this, m__root));
    m_elements = std::unique_ptr<std::vector<std::unique_ptr<record_t>>>(new std::vector<std::unique_ptr<record_t>>());
    const int l_elements = num_elements()->value();
    for (int i = 0; i < l_elements; i++) {
        m_elements->push_back(std::move(std::unique_ptr<record_t>(new record_t(m__io, this, m__root))));
    }
}

ruby_marshal_t::ruby_array_t::~ruby_array_t() {
    _clean_up();
}

void ruby_marshal_t::ruby_array_t::_clean_up() {
}

ruby_marshal_t::ruby_hash_t::ruby_hash_t(kaitai::kstream* p__io, ruby_marshal_t::record_t* p__parent, ruby_marshal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_num_pairs = nullptr;
    m_pairs = nullptr;
    _read();
}

void ruby_marshal_t::ruby_hash_t::_read() {
    m_num_pairs = std::unique_ptr<packed_int_t>(new packed_int_t(m__io, this, m__root));
    m_pairs = std::unique_ptr<std::vector<std::unique_ptr<pair_t>>>(new std::vector<std::unique_ptr<pair_t>>());
    const int l_pairs = num_pairs()->value();
    for (int i = 0; i < l_pairs; i++) {
        m_pairs->push_back(std::move(std::unique_ptr<pair_t>(new pair_t(m__io, this, m__root))));
    }
}

ruby_marshal_t::ruby_hash_t::~ruby_hash_t() {
    _clean_up();
}

void ruby_marshal_t::ruby_hash_t::_clean_up() {
}

ruby_marshal_t::ruby_string_t::ruby_string_t(kaitai::kstream* p__io, ruby_marshal_t::record_t* p__parent, ruby_marshal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_len = nullptr;
    _read();
}

void ruby_marshal_t::ruby_string_t::_read() {
    m_len = std::unique_ptr<packed_int_t>(new packed_int_t(m__io, this, m__root));
    m_body = m__io->read_bytes(len()->value());
}

ruby_marshal_t::ruby_string_t::~ruby_string_t() {
    _clean_up();
}

void ruby_marshal_t::ruby_string_t::_clean_up() {
}

ruby_marshal_t::ruby_struct_t::ruby_struct_t(kaitai::kstream* p__io, ruby_marshal_t::record_t* p__parent, ruby_marshal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name = nullptr;
    m_num_members = nullptr;
    m_members = nullptr;
    _read();
}

void ruby_marshal_t::ruby_struct_t::_read() {
    m_name = std::unique_ptr<record_t>(new record_t(m__io, this, m__root));
    m_num_members = std::unique_ptr<packed_int_t>(new packed_int_t(m__io, this, m__root));
    m_members = std::unique_ptr<std::vector<std::unique_ptr<pair_t>>>(new std::vector<std::unique_ptr<pair_t>>());
    const int l_members = num_members()->value();
    for (int i = 0; i < l_members; i++) {
        m_members->push_back(std::move(std::unique_ptr<pair_t>(new pair_t(m__io, this, m__root))));
    }
}

ruby_marshal_t::ruby_struct_t::~ruby_struct_t() {
    _clean_up();
}

void ruby_marshal_t::ruby_struct_t::_clean_up() {
}

ruby_marshal_t::ruby_symbol_t::ruby_symbol_t(kaitai::kstream* p__io, ruby_marshal_t::record_t* p__parent, ruby_marshal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_len = nullptr;
    _read();
}

void ruby_marshal_t::ruby_symbol_t::_read() {
    m_len = std::unique_ptr<packed_int_t>(new packed_int_t(m__io, this, m__root));
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(len()->value()), "UTF-8");
}

ruby_marshal_t::ruby_symbol_t::~ruby_symbol_t() {
    _clean_up();
}

void ruby_marshal_t::ruby_symbol_t::_clean_up() {
}

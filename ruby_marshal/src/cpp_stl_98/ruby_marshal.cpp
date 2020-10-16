// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "ruby_marshal.h"
#include "kaitai/exceptions.h"

ruby_marshal_t::ruby_marshal_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ruby_marshal_t* p__root) : kaitai::kstruct(p__io) {
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

void ruby_marshal_t::_read() {
    m_version = m__io->read_bytes(2);
    if (!(version() == std::string("\x04\x08", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x04\x08", 2), version(), _io(), std::string("/seq/0"));
    }
    m_records = new record_t(m__io, this, m__root);
}

ruby_marshal_t::~ruby_marshal_t() {
    _clean_up();
}

void ruby_marshal_t::_clean_up() {
    if (m_records) {
        delete m_records; m_records = 0;
    }
}

ruby_marshal_t::ruby_array_t::ruby_array_t(kaitai::kstream* p__io, ruby_marshal_t::record_t* p__parent, ruby_marshal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_num_elements = 0;
    m_elements = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ruby_marshal_t::ruby_array_t::_read() {
    m_num_elements = new packed_int_t(m__io, this, m__root);
    int l_elements = num_elements()->value();
    m_elements = new std::vector<record_t*>();
    m_elements->reserve(l_elements);
    for (int i = 0; i < l_elements; i++) {
        m_elements->push_back(new record_t(m__io, this, m__root));
    }
}

ruby_marshal_t::ruby_array_t::~ruby_array_t() {
    _clean_up();
}

void ruby_marshal_t::ruby_array_t::_clean_up() {
    if (m_num_elements) {
        delete m_num_elements; m_num_elements = 0;
    }
    if (m_elements) {
        for (std::vector<record_t*>::iterator it = m_elements->begin(); it != m_elements->end(); ++it) {
            delete *it;
        }
        delete m_elements; m_elements = 0;
    }
}

ruby_marshal_t::bignum_t::bignum_t(kaitai::kstream* p__io, ruby_marshal_t::record_t* p__parent, ruby_marshal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_len_div_2 = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ruby_marshal_t::bignum_t::_read() {
    m_sign = m__io->read_u1();
    m_len_div_2 = new packed_int_t(m__io, this, m__root);
    m_body = m__io->read_bytes((len_div_2()->value() * 2));
}

ruby_marshal_t::bignum_t::~bignum_t() {
    _clean_up();
}

void ruby_marshal_t::bignum_t::_clean_up() {
    if (m_len_div_2) {
        delete m_len_div_2; m_len_div_2 = 0;
    }
}

ruby_marshal_t::ruby_struct_t::ruby_struct_t(kaitai::kstream* p__io, ruby_marshal_t::record_t* p__parent, ruby_marshal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name = 0;
    m_num_members = 0;
    m_members = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ruby_marshal_t::ruby_struct_t::_read() {
    m_name = new record_t(m__io, this, m__root);
    m_num_members = new packed_int_t(m__io, this, m__root);
    int l_members = num_members()->value();
    m_members = new std::vector<pair_t*>();
    m_members->reserve(l_members);
    for (int i = 0; i < l_members; i++) {
        m_members->push_back(new pair_t(m__io, this, m__root));
    }
}

ruby_marshal_t::ruby_struct_t::~ruby_struct_t() {
    _clean_up();
}

void ruby_marshal_t::ruby_struct_t::_clean_up() {
    if (m_name) {
        delete m_name; m_name = 0;
    }
    if (m_num_members) {
        delete m_num_members; m_num_members = 0;
    }
    if (m_members) {
        for (std::vector<pair_t*>::iterator it = m_members->begin(); it != m_members->end(); ++it) {
            delete *it;
        }
        delete m_members; m_members = 0;
    }
}

ruby_marshal_t::ruby_symbol_t::ruby_symbol_t(kaitai::kstream* p__io, ruby_marshal_t::record_t* p__parent, ruby_marshal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_len = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ruby_marshal_t::ruby_symbol_t::_read() {
    m_len = new packed_int_t(m__io, this, m__root);
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(len()->value()), std::string("UTF-8"));
}

ruby_marshal_t::ruby_symbol_t::~ruby_symbol_t() {
    _clean_up();
}

void ruby_marshal_t::ruby_symbol_t::_clean_up() {
    if (m_len) {
        delete m_len; m_len = 0;
    }
}

ruby_marshal_t::packed_int_t::packed_int_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ruby_marshal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_is_immediate = false;
    f_value = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ruby_marshal_t::packed_int_t::_read() {
    m_code = m__io->read_u1();
    n_encoded = true;
    switch (code()) {
    case 4: {
        n_encoded = false;
        m_encoded = m__io->read_u4le();
        break;
    }
    case 1: {
        n_encoded = false;
        m_encoded = m__io->read_u1();
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
    case 3: {
        n_encoded = false;
        m_encoded = m__io->read_u2le();
        break;
    }
    case 2: {
        n_encoded = false;
        m_encoded = m__io->read_u2le();
        break;
    }
    case 255: {
        n_encoded = false;
        m_encoded = m__io->read_u1();
        break;
    }
    case 254: {
        n_encoded = false;
        m_encoded = m__io->read_u2le();
        break;
    }
    }
    n_encoded2 = true;
    switch (code()) {
    case 3: {
        n_encoded2 = false;
        m_encoded2 = m__io->read_u1();
        break;
    }
    case 253: {
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
    m_is_immediate =  ((code() > 4) && (code() < 252)) ;
    f_is_immediate = true;
    return m_is_immediate;
}

int32_t ruby_marshal_t::packed_int_t::value() {
    if (f_value)
        return m_value;
    m_value = ((is_immediate()) ? (((code() < 128) ? ((code() - 5)) : ((4 - (~(code()) & 127))))) : (((code() == 0) ? (0) : (((code() == 255) ? ((encoded() - 256)) : (((code() == 254) ? ((encoded() - 65536)) : (((code() == 253) ? ((((encoded2() << 16) | encoded()) - 16777216)) : (((code() == 3) ? (((encoded2() << 16) | encoded())) : (encoded()))))))))))));
    f_value = true;
    return m_value;
}

ruby_marshal_t::pair_t::pair_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ruby_marshal_t* p__root) : kaitai::kstruct(p__io) {
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

void ruby_marshal_t::pair_t::_read() {
    m_key = new record_t(m__io, this, m__root);
    m_value = new record_t(m__io, this, m__root);
}

ruby_marshal_t::pair_t::~pair_t() {
    _clean_up();
}

void ruby_marshal_t::pair_t::_clean_up() {
    if (m_key) {
        delete m_key; m_key = 0;
    }
    if (m_value) {
        delete m_value; m_value = 0;
    }
}

ruby_marshal_t::instance_var_t::instance_var_t(kaitai::kstream* p__io, ruby_marshal_t::record_t* p__parent, ruby_marshal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_obj = 0;
    m_num_vars = 0;
    m_vars = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ruby_marshal_t::instance_var_t::_read() {
    m_obj = new record_t(m__io, this, m__root);
    m_num_vars = new packed_int_t(m__io, this, m__root);
    int l_vars = num_vars()->value();
    m_vars = new std::vector<pair_t*>();
    m_vars->reserve(l_vars);
    for (int i = 0; i < l_vars; i++) {
        m_vars->push_back(new pair_t(m__io, this, m__root));
    }
}

ruby_marshal_t::instance_var_t::~instance_var_t() {
    _clean_up();
}

void ruby_marshal_t::instance_var_t::_clean_up() {
    if (m_obj) {
        delete m_obj; m_obj = 0;
    }
    if (m_num_vars) {
        delete m_num_vars; m_num_vars = 0;
    }
    if (m_vars) {
        for (std::vector<pair_t*>::iterator it = m_vars->begin(); it != m_vars->end(); ++it) {
            delete *it;
        }
        delete m_vars; m_vars = 0;
    }
}

ruby_marshal_t::record_t::record_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ruby_marshal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ruby_marshal_t::record_t::_read() {
    m_code = static_cast<ruby_marshal_t::codes_t>(m__io->read_u1());
    n_body = true;
    switch (code()) {
    case ruby_marshal_t::CODES_PACKED_INT: {
        n_body = false;
        m_body = new packed_int_t(m__io, this, m__root);
        break;
    }
    case ruby_marshal_t::CODES_BIGNUM: {
        n_body = false;
        m_body = new bignum_t(m__io, this, m__root);
        break;
    }
    case ruby_marshal_t::CODES_RUBY_ARRAY: {
        n_body = false;
        m_body = new ruby_array_t(m__io, this, m__root);
        break;
    }
    case ruby_marshal_t::CODES_RUBY_SYMBOL_LINK: {
        n_body = false;
        m_body = new packed_int_t(m__io, this, m__root);
        break;
    }
    case ruby_marshal_t::CODES_RUBY_STRUCT: {
        n_body = false;
        m_body = new ruby_struct_t(m__io, this, m__root);
        break;
    }
    case ruby_marshal_t::CODES_RUBY_STRING: {
        n_body = false;
        m_body = new ruby_string_t(m__io, this, m__root);
        break;
    }
    case ruby_marshal_t::CODES_INSTANCE_VAR: {
        n_body = false;
        m_body = new instance_var_t(m__io, this, m__root);
        break;
    }
    case ruby_marshal_t::CODES_RUBY_HASH: {
        n_body = false;
        m_body = new ruby_hash_t(m__io, this, m__root);
        break;
    }
    case ruby_marshal_t::CODES_RUBY_SYMBOL: {
        n_body = false;
        m_body = new ruby_symbol_t(m__io, this, m__root);
        break;
    }
    }
}

ruby_marshal_t::record_t::~record_t() {
    _clean_up();
}

void ruby_marshal_t::record_t::_clean_up() {
    if (!n_body) {
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

ruby_marshal_t::ruby_hash_t::ruby_hash_t(kaitai::kstream* p__io, ruby_marshal_t::record_t* p__parent, ruby_marshal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_num_pairs = 0;
    m_pairs = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ruby_marshal_t::ruby_hash_t::_read() {
    m_num_pairs = new packed_int_t(m__io, this, m__root);
    int l_pairs = num_pairs()->value();
    m_pairs = new std::vector<pair_t*>();
    m_pairs->reserve(l_pairs);
    for (int i = 0; i < l_pairs; i++) {
        m_pairs->push_back(new pair_t(m__io, this, m__root));
    }
}

ruby_marshal_t::ruby_hash_t::~ruby_hash_t() {
    _clean_up();
}

void ruby_marshal_t::ruby_hash_t::_clean_up() {
    if (m_num_pairs) {
        delete m_num_pairs; m_num_pairs = 0;
    }
    if (m_pairs) {
        for (std::vector<pair_t*>::iterator it = m_pairs->begin(); it != m_pairs->end(); ++it) {
            delete *it;
        }
        delete m_pairs; m_pairs = 0;
    }
}

ruby_marshal_t::ruby_string_t::ruby_string_t(kaitai::kstream* p__io, ruby_marshal_t::record_t* p__parent, ruby_marshal_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_len = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void ruby_marshal_t::ruby_string_t::_read() {
    m_len = new packed_int_t(m__io, this, m__root);
    m_body = m__io->read_bytes(len()->value());
}

ruby_marshal_t::ruby_string_t::~ruby_string_t() {
    _clean_up();
}

void ruby_marshal_t::ruby_string_t::_clean_up() {
    if (m_len) {
        delete m_len; m_len = 0;
    }
}

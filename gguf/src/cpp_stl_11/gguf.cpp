// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "gguf.h"
#include "kaitai/exceptions.h"
const std::set<gguf_t::ggml_type_t> gguf_t::_values_ggml_type_t{
    gguf_t::GGML_TYPE_F32,
    gguf_t::GGML_TYPE_F16,
    gguf_t::GGML_TYPE_Q4_0,
    gguf_t::GGML_TYPE_Q4_1,
    gguf_t::GGML_TYPE_Q4_2,
    gguf_t::GGML_TYPE_Q4_3,
    gguf_t::GGML_TYPE_Q5_0,
    gguf_t::GGML_TYPE_Q5_1,
    gguf_t::GGML_TYPE_Q8_0,
    gguf_t::GGML_TYPE_Q8_1,
    gguf_t::GGML_TYPE_Q2_K,
    gguf_t::GGML_TYPE_Q3_K,
    gguf_t::GGML_TYPE_Q4_K,
    gguf_t::GGML_TYPE_Q5_K,
    gguf_t::GGML_TYPE_Q6_K,
    gguf_t::GGML_TYPE_Q8_K,
    gguf_t::GGML_TYPE_IQ2_XXS,
    gguf_t::GGML_TYPE_IQ2_XS,
    gguf_t::GGML_TYPE_IQ3_XXS,
    gguf_t::GGML_TYPE_IQ1_S,
    gguf_t::GGML_TYPE_IQ4_NL,
    gguf_t::GGML_TYPE_IQ3_S,
    gguf_t::GGML_TYPE_IQ2_S,
    gguf_t::GGML_TYPE_IQ4_XS,
    gguf_t::GGML_TYPE_I8,
    gguf_t::GGML_TYPE_I16,
    gguf_t::GGML_TYPE_I32,
    gguf_t::GGML_TYPE_I64,
    gguf_t::GGML_TYPE_F64,
    gguf_t::GGML_TYPE_IQ1_M,
    gguf_t::GGML_TYPE_BF16,
    gguf_t::GGML_TYPE_Q4_0_4_4,
    gguf_t::GGML_TYPE_Q4_0_4_8,
    gguf_t::GGML_TYPE_Q4_0_8_8,
    gguf_t::GGML_TYPE_TQ1_0,
    gguf_t::GGML_TYPE_TQ2_0,
    gguf_t::GGML_TYPE_IQ4_NL_4_4,
    gguf_t::GGML_TYPE_IQ4_NL_4_8,
    gguf_t::GGML_TYPE_IQ4_NL_8_8,
    gguf_t::GGML_TYPE_MXFP4,
    gguf_t::GGML_TYPE_NVFP4,
    gguf_t::GGML_TYPE_Q1_0,
    gguf_t::GGML_TYPE_Q2_0,
};
bool gguf_t::_is_defined_ggml_type_t(gguf_t::ggml_type_t v) {
    return gguf_t::_values_ggml_type_t.find(v) != gguf_t::_values_ggml_type_t.end();
}
const std::set<gguf_t::gguf_type_t> gguf_t::_values_gguf_type_t{
    gguf_t::GGUF_TYPE_UINT8,
    gguf_t::GGUF_TYPE_INT8,
    gguf_t::GGUF_TYPE_UINT16,
    gguf_t::GGUF_TYPE_INT16,
    gguf_t::GGUF_TYPE_UINT32,
    gguf_t::GGUF_TYPE_INT32,
    gguf_t::GGUF_TYPE_FLOAT32,
    gguf_t::GGUF_TYPE_BOOL,
    gguf_t::GGUF_TYPE_STRING,
    gguf_t::GGUF_TYPE_ARRAY,
    gguf_t::GGUF_TYPE_UINT64,
    gguf_t::GGUF_TYPE_INT64,
    gguf_t::GGUF_TYPE_FLOAT64,
};
bool gguf_t::_is_defined_gguf_type_t(gguf_t::gguf_type_t v) {
    return gguf_t::_values_gguf_type_t.find(v) != gguf_t::_values_gguf_type_t.end();
}

gguf_t::gguf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gguf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_body = nullptr;
    f_is_big_endian = false;
    f_len_file = false;
    f_version_le = false;
    _read();
}

void gguf_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x47\x47\x55\x46", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x47\x47\x55\x46", 4), m_magic, m__io, std::string("/seq/0"));
    }
    m_body = std::unique_ptr<gguf_body_t>(new gguf_body_t(m__io, this, m__root));
}

gguf_t::~gguf_t() {
    _clean_up();
}

void gguf_t::_clean_up() {
    if (f_version_le) {
    }
}

gguf_t::gguf_body_t::gguf_body_t(kaitai::kstream* p__io, gguf_t* p__parent, gguf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = -1;
    m_kv_pairs = nullptr;
    m_tensor_infos = nullptr;
    f_alignment = false;
    f_ofs_tensor_data = false;
    _read();
}

void gguf_t::gguf_body_t::_read() {
    {
        bool on = _root()->is_big_endian();
        if (on == true) {
            m__is_le = false;
        }
        else if (on == false) {
            m__is_le = true;
        }
    }

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/gguf_body");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void gguf_t::gguf_body_t::_read_le() {
    m_version = m__io->read_u4le();
    if (!(m_version >= 2)) {
        throw kaitai::validation_less_than_error<uint32_t>(2, m_version, m__io, std::string("/types/gguf_body/seq/0"));
    }
    if (!(m_version <= 3)) {
        throw kaitai::validation_greater_than_error<uint32_t>(3, m_version, m__io, std::string("/types/gguf_body/seq/0"));
    }
    m_num_tensor_infos = m__io->read_u8le();
    m_num_kv_pairs = m__io->read_u8le();
    m_kv_pairs = std::unique_ptr<std::vector<std::unique_ptr<gguf_kv_t>>>(new std::vector<std::unique_ptr<gguf_kv_t>>());
    const int l_kv_pairs = num_kv_pairs();
    for (int i = 0; i < l_kv_pairs; i++) {
        m_kv_pairs->push_back(std::move(std::unique_ptr<gguf_kv_t>(new gguf_kv_t(((i != 0) ? (kv_pairs()->at(i - 1)->alignment()) : (32)), m__io, this, m__root, m__is_le))));
    }
    m_tensor_infos = std::unique_ptr<std::vector<std::unique_ptr<gguf_tensor_info_t>>>(new std::vector<std::unique_ptr<gguf_tensor_info_t>>());
    const int l_tensor_infos = num_tensor_infos();
    for (int i = 0; i < l_tensor_infos; i++) {
        m_tensor_infos->push_back(std::move(std::unique_ptr<gguf_tensor_info_t>(new gguf_tensor_info_t(((i != 0) ? (tensor_infos()->at(i - 1)->expected_next_offset()) : (0)), m__io, this, m__root, m__is_le))));
    }
    n_padding = true;
    if (num_tensor_infos() != 0) {
        n_padding = false;
        m_padding = m__io->read_bytes(kaitai::kstream::mod(alignment() - kaitai::kstream::mod(_io()->pos(), alignment()), alignment()));
    }
    n__unnamed6 = true;
    if (ofs_tensor_data() < 0) {
        n__unnamed6 = false;
        m__unnamed6 = m__io->read_bytes(0);
    }
}

void gguf_t::gguf_body_t::_read_be() {
    m_version = m__io->read_u4be();
    if (!(m_version >= 2)) {
        throw kaitai::validation_less_than_error<uint32_t>(2, m_version, m__io, std::string("/types/gguf_body/seq/0"));
    }
    if (!(m_version <= 3)) {
        throw kaitai::validation_greater_than_error<uint32_t>(3, m_version, m__io, std::string("/types/gguf_body/seq/0"));
    }
    m_num_tensor_infos = m__io->read_u8be();
    m_num_kv_pairs = m__io->read_u8be();
    m_kv_pairs = std::unique_ptr<std::vector<std::unique_ptr<gguf_kv_t>>>(new std::vector<std::unique_ptr<gguf_kv_t>>());
    const int l_kv_pairs = num_kv_pairs();
    for (int i = 0; i < l_kv_pairs; i++) {
        m_kv_pairs->push_back(std::move(std::unique_ptr<gguf_kv_t>(new gguf_kv_t(((i != 0) ? (kv_pairs()->at(i - 1)->alignment()) : (32)), m__io, this, m__root, m__is_le))));
    }
    m_tensor_infos = std::unique_ptr<std::vector<std::unique_ptr<gguf_tensor_info_t>>>(new std::vector<std::unique_ptr<gguf_tensor_info_t>>());
    const int l_tensor_infos = num_tensor_infos();
    for (int i = 0; i < l_tensor_infos; i++) {
        m_tensor_infos->push_back(std::move(std::unique_ptr<gguf_tensor_info_t>(new gguf_tensor_info_t(((i != 0) ? (tensor_infos()->at(i - 1)->expected_next_offset()) : (0)), m__io, this, m__root, m__is_le))));
    }
    n_padding = true;
    if (num_tensor_infos() != 0) {
        n_padding = false;
        m_padding = m__io->read_bytes(kaitai::kstream::mod(alignment() - kaitai::kstream::mod(_io()->pos(), alignment()), alignment()));
    }
    n__unnamed6 = true;
    if (ofs_tensor_data() < 0) {
        n__unnamed6 = false;
        m__unnamed6 = m__io->read_bytes(0);
    }
}

gguf_t::gguf_body_t::~gguf_body_t() {
    _clean_up();
}

void gguf_t::gguf_body_t::_clean_up() {
    if (!n_padding) {
    }
    if (!n__unnamed6) {
    }
}

gguf_t::gguf_body_t::gguf_array_t::gguf_array_t(kaitai::kstream* p__io, gguf_t::gguf_body_t::gguf_value_t* p__parent, gguf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_elems = nullptr;
    _read();
}

void gguf_t::gguf_body_t::gguf_array_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/gguf_body/types/gguf_array");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void gguf_t::gguf_body_t::gguf_array_t::_read_le() {
    m_type = static_cast<gguf_t::gguf_type_t>(m__io->read_u4le());
    if (!gguf_t::_is_defined_gguf_type_t(m_type)) {
        throw kaitai::validation_not_in_enum_error<gguf_t::gguf_type_t>(m_type, m__io, std::string("/types/gguf_body/types/gguf_array/seq/0"));
    }
    m_num_elems = m__io->read_u8le();
    m_elems = std::unique_ptr<std::vector<std::unique_ptr<gguf_value_t>>>(new std::vector<std::unique_ptr<gguf_value_t>>());
    const int l_elems = num_elems();
    for (int i = 0; i < l_elems; i++) {
        m_elems->push_back(std::move(std::unique_ptr<gguf_value_t>(new gguf_value_t(type(), m__io, this, m__root, m__is_le))));
    }
}

void gguf_t::gguf_body_t::gguf_array_t::_read_be() {
    m_type = static_cast<gguf_t::gguf_type_t>(m__io->read_u4be());
    if (!gguf_t::_is_defined_gguf_type_t(m_type)) {
        throw kaitai::validation_not_in_enum_error<gguf_t::gguf_type_t>(m_type, m__io, std::string("/types/gguf_body/types/gguf_array/seq/0"));
    }
    m_num_elems = m__io->read_u8be();
    m_elems = std::unique_ptr<std::vector<std::unique_ptr<gguf_value_t>>>(new std::vector<std::unique_ptr<gguf_value_t>>());
    const int l_elems = num_elems();
    for (int i = 0; i < l_elems; i++) {
        m_elems->push_back(std::move(std::unique_ptr<gguf_value_t>(new gguf_value_t(type(), m__io, this, m__root, m__is_le))));
    }
}

gguf_t::gguf_body_t::gguf_array_t::~gguf_array_t() {
    _clean_up();
}

void gguf_t::gguf_body_t::gguf_array_t::_clean_up() {
}

gguf_t::gguf_body_t::gguf_bool_t::gguf_bool_t(kaitai::kstream* p__io, gguf_t::gguf_body_t::gguf_value_t* p__parent, gguf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    f_value = false;
    _read();
}

void gguf_t::gguf_body_t::gguf_bool_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/gguf_body/types/gguf_bool");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void gguf_t::gguf_body_t::gguf_bool_t::_read_le() {
    m_value_raw = m__io->read_u1();
    if (!(m_value_raw <= 1)) {
        throw kaitai::validation_greater_than_error<uint8_t>(1, m_value_raw, m__io, std::string("/types/gguf_body/types/gguf_bool/seq/0"));
    }
}

void gguf_t::gguf_body_t::gguf_bool_t::_read_be() {
    m_value_raw = m__io->read_u1();
    if (!(m_value_raw <= 1)) {
        throw kaitai::validation_greater_than_error<uint8_t>(1, m_value_raw, m__io, std::string("/types/gguf_body/types/gguf_bool/seq/0"));
    }
}

gguf_t::gguf_body_t::gguf_bool_t::~gguf_bool_t() {
    _clean_up();
}

void gguf_t::gguf_body_t::gguf_bool_t::_clean_up() {
}

bool gguf_t::gguf_body_t::gguf_bool_t::value() {
    if (f_value)
        return m_value;
    f_value = true;
    m_value = value_raw() != 0;
    return m_value;
}

gguf_t::gguf_body_t::gguf_float32_t::gguf_float32_t(kaitai::kstream* p__io, gguf_t::gguf_body_t::gguf_value_t* p__parent, gguf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    _read();
}

void gguf_t::gguf_body_t::gguf_float32_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/gguf_body/types/gguf_float32");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void gguf_t::gguf_body_t::gguf_float32_t::_read_le() {
    m_value = m__io->read_f4le();
}

void gguf_t::gguf_body_t::gguf_float32_t::_read_be() {
    m_value = m__io->read_f4be();
}

gguf_t::gguf_body_t::gguf_float32_t::~gguf_float32_t() {
    _clean_up();
}

void gguf_t::gguf_body_t::gguf_float32_t::_clean_up() {
}

gguf_t::gguf_body_t::gguf_float64_t::gguf_float64_t(kaitai::kstream* p__io, gguf_t::gguf_body_t::gguf_value_t* p__parent, gguf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    _read();
}

void gguf_t::gguf_body_t::gguf_float64_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/gguf_body/types/gguf_float64");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void gguf_t::gguf_body_t::gguf_float64_t::_read_le() {
    m_value = m__io->read_f8le();
}

void gguf_t::gguf_body_t::gguf_float64_t::_read_be() {
    m_value = m__io->read_f8be();
}

gguf_t::gguf_body_t::gguf_float64_t::~gguf_float64_t() {
    _clean_up();
}

void gguf_t::gguf_body_t::gguf_float64_t::_clean_up() {
}

gguf_t::gguf_body_t::gguf_int16_t::gguf_int16_t(kaitai::kstream* p__io, gguf_t::gguf_body_t::gguf_value_t* p__parent, gguf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    _read();
}

void gguf_t::gguf_body_t::gguf_int16_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/gguf_body/types/gguf_int16");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void gguf_t::gguf_body_t::gguf_int16_t::_read_le() {
    m_value = m__io->read_s2le();
}

void gguf_t::gguf_body_t::gguf_int16_t::_read_be() {
    m_value = m__io->read_s2be();
}

gguf_t::gguf_body_t::gguf_int16_t::~gguf_int16_t() {
    _clean_up();
}

void gguf_t::gguf_body_t::gguf_int16_t::_clean_up() {
}

gguf_t::gguf_body_t::gguf_int32_t::gguf_int32_t(kaitai::kstream* p__io, gguf_t::gguf_body_t::gguf_value_t* p__parent, gguf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    _read();
}

void gguf_t::gguf_body_t::gguf_int32_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/gguf_body/types/gguf_int32");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void gguf_t::gguf_body_t::gguf_int32_t::_read_le() {
    m_value = m__io->read_s4le();
}

void gguf_t::gguf_body_t::gguf_int32_t::_read_be() {
    m_value = m__io->read_s4be();
}

gguf_t::gguf_body_t::gguf_int32_t::~gguf_int32_t() {
    _clean_up();
}

void gguf_t::gguf_body_t::gguf_int32_t::_clean_up() {
}

gguf_t::gguf_body_t::gguf_int64_t::gguf_int64_t(kaitai::kstream* p__io, gguf_t::gguf_body_t::gguf_value_t* p__parent, gguf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    _read();
}

void gguf_t::gguf_body_t::gguf_int64_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/gguf_body/types/gguf_int64");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void gguf_t::gguf_body_t::gguf_int64_t::_read_le() {
    m_value = m__io->read_s8le();
}

void gguf_t::gguf_body_t::gguf_int64_t::_read_be() {
    m_value = m__io->read_s8be();
}

gguf_t::gguf_body_t::gguf_int64_t::~gguf_int64_t() {
    _clean_up();
}

void gguf_t::gguf_body_t::gguf_int64_t::_clean_up() {
}

gguf_t::gguf_body_t::gguf_int8_t::gguf_int8_t(kaitai::kstream* p__io, gguf_t::gguf_body_t::gguf_value_t* p__parent, gguf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    _read();
}

void gguf_t::gguf_body_t::gguf_int8_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/gguf_body/types/gguf_int8");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void gguf_t::gguf_body_t::gguf_int8_t::_read_le() {
    m_value = m__io->read_s1();
}

void gguf_t::gguf_body_t::gguf_int8_t::_read_be() {
    m_value = m__io->read_s1();
}

gguf_t::gguf_body_t::gguf_int8_t::~gguf_int8_t() {
    _clean_up();
}

void gguf_t::gguf_body_t::gguf_int8_t::_clean_up() {
}

gguf_t::gguf_body_t::gguf_kv_t::gguf_kv_t(uint32_t p_prev_alignment, kaitai::kstream* p__io, gguf_t::gguf_body_t* p__parent, gguf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_prev_alignment = p_prev_alignment;
    m_key = nullptr;
    m_value = nullptr;
    f_alignment = false;
    _read();
}

void gguf_t::gguf_body_t::gguf_kv_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/gguf_body/types/gguf_kv");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void gguf_t::gguf_body_t::gguf_kv_t::_read_le() {
    m_key = std::unique_ptr<gguf_str_t>(new gguf_str_t(m__io, this, m__root, m__is_le));
    {
        std::unique_ptr<gguf_str_t> _ = m_key;
        if (!(_->len_value() != 0)) {
            throw kaitai::validation_expr_error<std::unique_ptr<gguf_t::gguf_body_t::gguf_str_t>>(m_key, m__io, std::string("/types/gguf_body/types/gguf_kv/seq/0"));
        }
    }
    m_type = static_cast<gguf_t::gguf_type_t>(m__io->read_u4le());
    if (!gguf_t::_is_defined_gguf_type_t(m_type)) {
        throw kaitai::validation_not_in_enum_error<gguf_t::gguf_type_t>(m_type, m__io, std::string("/types/gguf_body/types/gguf_kv/seq/1"));
    }
    m_value = std::unique_ptr<gguf_value_t>(new gguf_value_t(type(), m__io, this, m__root, m__is_le));
    {
        std::unique_ptr<gguf_value_t> _ = m_value;
        if (!(((key()->value() == std::string("general.alignment")) ? ( ((type() == gguf_t::GGUF_TYPE_UINT32) && (static_cast<gguf_t::gguf_body_t::gguf_uint32_t*>(_->value())->value() != 0) && ((static_cast<gguf_t::gguf_body_t::gguf_uint32_t*>(_->value())->value() & static_cast<gguf_t::gguf_body_t::gguf_uint32_t*>(_->value())->value() - 1) == 0)) ) : (true)))) {
            throw kaitai::validation_expr_error<std::unique_ptr<gguf_t::gguf_body_t::gguf_value_t>>(m_value, m__io, std::string("/types/gguf_body/types/gguf_kv/seq/2"));
        }
    }
}

void gguf_t::gguf_body_t::gguf_kv_t::_read_be() {
    m_key = std::unique_ptr<gguf_str_t>(new gguf_str_t(m__io, this, m__root, m__is_le));
    {
        std::unique_ptr<gguf_str_t> _ = m_key;
        if (!(_->len_value() != 0)) {
            throw kaitai::validation_expr_error<std::unique_ptr<gguf_t::gguf_body_t::gguf_str_t>>(m_key, m__io, std::string("/types/gguf_body/types/gguf_kv/seq/0"));
        }
    }
    m_type = static_cast<gguf_t::gguf_type_t>(m__io->read_u4be());
    if (!gguf_t::_is_defined_gguf_type_t(m_type)) {
        throw kaitai::validation_not_in_enum_error<gguf_t::gguf_type_t>(m_type, m__io, std::string("/types/gguf_body/types/gguf_kv/seq/1"));
    }
    m_value = std::unique_ptr<gguf_value_t>(new gguf_value_t(type(), m__io, this, m__root, m__is_le));
    {
        std::unique_ptr<gguf_value_t> _ = m_value;
        if (!(((key()->value() == std::string("general.alignment")) ? ( ((type() == gguf_t::GGUF_TYPE_UINT32) && (static_cast<gguf_t::gguf_body_t::gguf_uint32_t*>(_->value())->value() != 0) && ((static_cast<gguf_t::gguf_body_t::gguf_uint32_t*>(_->value())->value() & static_cast<gguf_t::gguf_body_t::gguf_uint32_t*>(_->value())->value() - 1) == 0)) ) : (true)))) {
            throw kaitai::validation_expr_error<std::unique_ptr<gguf_t::gguf_body_t::gguf_value_t>>(m_value, m__io, std::string("/types/gguf_body/types/gguf_kv/seq/2"));
        }
    }
}

gguf_t::gguf_body_t::gguf_kv_t::~gguf_kv_t() {
    _clean_up();
}

void gguf_t::gguf_body_t::gguf_kv_t::_clean_up() {
}

uint32_t gguf_t::gguf_body_t::gguf_kv_t::alignment() {
    if (f_alignment)
        return m_alignment;
    f_alignment = true;
    m_alignment = ((key()->value() == std::string("general.alignment")) ? (static_cast<gguf_t::gguf_body_t::gguf_uint32_t*>(value()->value())->value()) : (prev_alignment()));
    return m_alignment;
}

gguf_t::gguf_body_t::gguf_str_t::gguf_str_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gguf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    _read();
}

void gguf_t::gguf_body_t::gguf_str_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/gguf_body/types/gguf_str");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void gguf_t::gguf_body_t::gguf_str_t::_read_le() {
    m_len_value = m__io->read_u8le();
    m_value = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_value()), "UTF-8");
}

void gguf_t::gguf_body_t::gguf_str_t::_read_be() {
    m_len_value = m__io->read_u8be();
    m_value = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_value()), "UTF-8");
}

gguf_t::gguf_body_t::gguf_str_t::~gguf_str_t() {
    _clean_up();
}

void gguf_t::gguf_body_t::gguf_str_t::_clean_up() {
}

gguf_t::gguf_body_t::gguf_tensor_info_t::gguf_tensor_info_t(uint64_t p_expected_offset, kaitai::kstream* p__io, gguf_t::gguf_body_t* p__parent, gguf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_expected_offset = p_expected_offset;
    m_name = nullptr;
    m_dims = nullptr;
    f_data = false;
    f_dump_dims = false;
    f_expected_next_offset = false;
    f_len_block = false;
    f_len_data = false;
    f_len_padding = false;
    f_num_blocks = false;
    f_num_elements = false;
    f_num_elements_per_block = false;
    f_padding = false;
    _read();
}

void gguf_t::gguf_body_t::gguf_tensor_info_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/gguf_body/types/gguf_tensor_info");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void gguf_t::gguf_body_t::gguf_tensor_info_t::_read_le() {
    m_name = std::unique_ptr<gguf_str_t>(new gguf_str_t(m__io, this, m__root, m__is_le));
    {
        std::unique_ptr<gguf_str_t> _ = m_name;
        if (!(_->len_value() < 64)) {
            throw kaitai::validation_expr_error<std::unique_ptr<gguf_t::gguf_body_t::gguf_str_t>>(m_name, m__io, std::string("/types/gguf_body/types/gguf_tensor_info/seq/0"));
        }
    }
    m_num_dims = m__io->read_u4le();
    if (!(m_num_dims <= 4)) {
        throw kaitai::validation_greater_than_error<uint32_t>(4, m_num_dims, m__io, std::string("/types/gguf_body/types/gguf_tensor_info/seq/1"));
    }
    m_dims = std::unique_ptr<std::vector<int64_t>>(new std::vector<int64_t>());
    const int l_dims = num_dims();
    for (int i = 0; i < l_dims; i++) {
        m_dims->push_back(std::move(m__io->read_s8le()));
        if (!(m_dims->at(i) >= 0)) {
            throw kaitai::validation_less_than_error<int64_t>(0, m_dims->at(i), m__io, std::string("/types/gguf_body/types/gguf_tensor_info/seq/2"));
        }
    }
    m_type = static_cast<gguf_t::ggml_type_t>(m__io->read_u4le());
    {
        ggml_type_t _ = m_type;
        if (!( ((_ < 43) && (num_elements_per_block() != 0) && (kaitai::kstream::mod(((num_dims() > 0) ? (dims()->at(0)) : (1)), num_elements_per_block()) == 0)) )) {
            throw kaitai::validation_expr_error<gguf_t::ggml_type_t>(m_type, m__io, std::string("/types/gguf_body/types/gguf_tensor_info/seq/3"));
        }
    }
    m_offset = m__io->read_u8le();
    if (!(m_offset == expected_offset())) {
        throw kaitai::validation_not_equal_error<uint64_t>(expected_offset(), m_offset, m__io, std::string("/types/gguf_body/types/gguf_tensor_info/seq/4"));
    }
}

void gguf_t::gguf_body_t::gguf_tensor_info_t::_read_be() {
    m_name = std::unique_ptr<gguf_str_t>(new gguf_str_t(m__io, this, m__root, m__is_le));
    {
        std::unique_ptr<gguf_str_t> _ = m_name;
        if (!(_->len_value() < 64)) {
            throw kaitai::validation_expr_error<std::unique_ptr<gguf_t::gguf_body_t::gguf_str_t>>(m_name, m__io, std::string("/types/gguf_body/types/gguf_tensor_info/seq/0"));
        }
    }
    m_num_dims = m__io->read_u4be();
    if (!(m_num_dims <= 4)) {
        throw kaitai::validation_greater_than_error<uint32_t>(4, m_num_dims, m__io, std::string("/types/gguf_body/types/gguf_tensor_info/seq/1"));
    }
    m_dims = std::unique_ptr<std::vector<int64_t>>(new std::vector<int64_t>());
    const int l_dims = num_dims();
    for (int i = 0; i < l_dims; i++) {
        m_dims->push_back(std::move(m__io->read_s8be()));
        if (!(m_dims->at(i) >= 0)) {
            throw kaitai::validation_less_than_error<int64_t>(0, m_dims->at(i), m__io, std::string("/types/gguf_body/types/gguf_tensor_info/seq/2"));
        }
    }
    m_type = static_cast<gguf_t::ggml_type_t>(m__io->read_u4be());
    {
        ggml_type_t _ = m_type;
        if (!( ((_ < 43) && (num_elements_per_block() != 0) && (kaitai::kstream::mod(((num_dims() > 0) ? (dims()->at(0)) : (1)), num_elements_per_block()) == 0)) )) {
            throw kaitai::validation_expr_error<gguf_t::ggml_type_t>(m_type, m__io, std::string("/types/gguf_body/types/gguf_tensor_info/seq/3"));
        }
    }
    m_offset = m__io->read_u8be();
    if (!(m_offset == expected_offset())) {
        throw kaitai::validation_not_equal_error<uint64_t>(expected_offset(), m_offset, m__io, std::string("/types/gguf_body/types/gguf_tensor_info/seq/4"));
    }
}

gguf_t::gguf_body_t::gguf_tensor_info_t::~gguf_tensor_info_t() {
    _clean_up();
}

void gguf_t::gguf_body_t::gguf_tensor_info_t::_clean_up() {
    if (f_data) {
    }
    if (f_padding) {
    }
}

std::string gguf_t::gguf_body_t::gguf_tensor_info_t::data() {
    if (f_data)
        return m_data;
    f_data = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(_parent()->ofs_tensor_data() + offset());
    if (m__is_le == 1) {
        m_data = m__io->read_bytes(len_data());
    } else {
        m_data = m__io->read_bytes(len_data());
    }
    m__io->seek(_pos);
    return m_data;
}

std::string gguf_t::gguf_body_t::gguf_tensor_info_t::dump_dims() {
    if (f_dump_dims)
        return m_dump_dims;
    f_dump_dims = true;
    m_dump_dims = ((((num_dims() > 0) ? (kaitai::kstream::to_string(dims()->at(0))) : (std::string(""))) + ((num_dims() > 1) ? (std::string(" x ") + kaitai::kstream::to_string(dims()->at(1))) : (std::string("")))) + ((num_dims() > 2) ? (std::string(" x ") + kaitai::kstream::to_string(dims()->at(2))) : (std::string("")))) + ((num_dims() > 3) ? (std::string(" x ") + kaitai::kstream::to_string(dims()->at(3))) : (std::string("")));
    return m_dump_dims;
}

uint64_t gguf_t::gguf_body_t::gguf_tensor_info_t::expected_next_offset() {
    if (f_expected_next_offset)
        return m_expected_next_offset;
    f_expected_next_offset = true;
    m_expected_next_offset = static_cast<uint64_t>((offset() + len_data()) + len_padding());
    return m_expected_next_offset;
}

int32_t gguf_t::gguf_body_t::gguf_tensor_info_t::len_block() {
    if (f_len_block)
        return m_len_block;
    f_len_block = true;
    m_len_block = std::unique_ptr<std::vector<int32_t>>(new std::vector<int32_t>{4, 2, 18, 20, 0, 0, 22, 24, 34, 36, 84, 110, 144, 176, 210, 292, 66, 74, 98, 50, 18, 110, 82, 136, 1, 2, 4, 8, 8, 56, 2, 0, 0, 0, 54, 66, 0, 0, 0, 17, 36, 18, 18})->at(type());
    return m_len_block;
}

uint64_t gguf_t::gguf_body_t::gguf_tensor_info_t::len_data() {
    if (f_len_data)
        return m_len_data;
    f_len_data = true;
    m_len_data = static_cast<uint64_t>(len_block() * num_blocks());
    return m_len_data;
}

int32_t gguf_t::gguf_body_t::gguf_tensor_info_t::len_padding() {
    if (f_len_padding)
        return m_len_padding;
    f_len_padding = true;
    m_len_padding = kaitai::kstream::mod(_parent()->alignment() - kaitai::kstream::mod(len_data(), _parent()->alignment()), _parent()->alignment());
    return m_len_padding;
}

int64_t gguf_t::gguf_body_t::gguf_tensor_info_t::num_blocks() {
    if (f_num_blocks)
        return m_num_blocks;
    f_num_blocks = true;
    m_num_blocks = static_cast<int64_t>(num_elements() / num_elements_per_block());
    return m_num_blocks;
}

int64_t gguf_t::gguf_body_t::gguf_tensor_info_t::num_elements() {
    if (f_num_elements)
        return m_num_elements;
    f_num_elements = true;
    m_num_elements = static_cast<int64_t>(((((num_dims() > 0) ? (dims()->at(0)) : (1)) * ((num_dims() > 1) ? (dims()->at(1)) : (1))) * ((num_dims() > 2) ? (dims()->at(2)) : (1))) * ((num_dims() > 3) ? (dims()->at(3)) : (1)));
    return m_num_elements;
}

int32_t gguf_t::gguf_body_t::gguf_tensor_info_t::num_elements_per_block() {
    if (f_num_elements_per_block)
        return m_num_elements_per_block;
    f_num_elements_per_block = true;
    m_num_elements_per_block = std::unique_ptr<std::vector<int32_t>>(new std::vector<int32_t>{1, 1, 32, 32, 0, 0, 32, 32, 32, 32, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 32, 256, 256, 256, 1, 1, 1, 1, 1, 256, 1, 0, 0, 0, 256, 256, 0, 0, 0, 32, 64, 128, 64})->at(type());
    return m_num_elements_per_block;
}

std::string gguf_t::gguf_body_t::gguf_tensor_info_t::padding() {
    if (f_padding)
        return m_padding;
    f_padding = true;
    std::streampos _pos = m__io->pos();
    m__io->seek((_parent()->ofs_tensor_data() + offset()) + len_data());
    if (m__is_le == 1) {
        m_padding = m__io->read_bytes(len_padding());
    } else {
        m_padding = m__io->read_bytes(len_padding());
    }
    m__io->seek(_pos);
    return m_padding;
}

gguf_t::gguf_body_t::gguf_uint16_t::gguf_uint16_t(kaitai::kstream* p__io, gguf_t::gguf_body_t::gguf_value_t* p__parent, gguf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    _read();
}

void gguf_t::gguf_body_t::gguf_uint16_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/gguf_body/types/gguf_uint16");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void gguf_t::gguf_body_t::gguf_uint16_t::_read_le() {
    m_value = m__io->read_u2le();
}

void gguf_t::gguf_body_t::gguf_uint16_t::_read_be() {
    m_value = m__io->read_u2be();
}

gguf_t::gguf_body_t::gguf_uint16_t::~gguf_uint16_t() {
    _clean_up();
}

void gguf_t::gguf_body_t::gguf_uint16_t::_clean_up() {
}

gguf_t::gguf_body_t::gguf_uint32_t::gguf_uint32_t(kaitai::kstream* p__io, gguf_t::gguf_body_t::gguf_value_t* p__parent, gguf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    _read();
}

void gguf_t::gguf_body_t::gguf_uint32_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/gguf_body/types/gguf_uint32");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void gguf_t::gguf_body_t::gguf_uint32_t::_read_le() {
    m_value = m__io->read_u4le();
}

void gguf_t::gguf_body_t::gguf_uint32_t::_read_be() {
    m_value = m__io->read_u4be();
}

gguf_t::gguf_body_t::gguf_uint32_t::~gguf_uint32_t() {
    _clean_up();
}

void gguf_t::gguf_body_t::gguf_uint32_t::_clean_up() {
}

gguf_t::gguf_body_t::gguf_uint64_t::gguf_uint64_t(kaitai::kstream* p__io, gguf_t::gguf_body_t::gguf_value_t* p__parent, gguf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    _read();
}

void gguf_t::gguf_body_t::gguf_uint64_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/gguf_body/types/gguf_uint64");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void gguf_t::gguf_body_t::gguf_uint64_t::_read_le() {
    m_value = m__io->read_u8le();
}

void gguf_t::gguf_body_t::gguf_uint64_t::_read_be() {
    m_value = m__io->read_u8be();
}

gguf_t::gguf_body_t::gguf_uint64_t::~gguf_uint64_t() {
    _clean_up();
}

void gguf_t::gguf_body_t::gguf_uint64_t::_clean_up() {
}

gguf_t::gguf_body_t::gguf_uint8_t::gguf_uint8_t(kaitai::kstream* p__io, gguf_t::gguf_body_t::gguf_value_t* p__parent, gguf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    _read();
}

void gguf_t::gguf_body_t::gguf_uint8_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/gguf_body/types/gguf_uint8");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void gguf_t::gguf_body_t::gguf_uint8_t::_read_le() {
    m_value = m__io->read_u1();
}

void gguf_t::gguf_body_t::gguf_uint8_t::_read_be() {
    m_value = m__io->read_u1();
}

gguf_t::gguf_body_t::gguf_uint8_t::~gguf_uint8_t() {
    _clean_up();
}

void gguf_t::gguf_body_t::gguf_uint8_t::_clean_up() {
}

gguf_t::gguf_body_t::gguf_value_t::gguf_value_t(gguf_type_t p_type, kaitai::kstream* p__io, kaitai::kstruct* p__parent, gguf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_type = p_type;
    _read();
}

void gguf_t::gguf_body_t::gguf_value_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/gguf_body/types/gguf_value");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void gguf_t::gguf_body_t::gguf_value_t::_read_le() {
    n_value = true;
    switch (type()) {
    case gguf_t::GGUF_TYPE_ARRAY: {
        n_value = false;
        m_value = std::unique_ptr<gguf_array_t>(new gguf_array_t(m__io, this, m__root, m__is_le));
        break;
    }
    case gguf_t::GGUF_TYPE_BOOL: {
        n_value = false;
        m_value = std::unique_ptr<gguf_bool_t>(new gguf_bool_t(m__io, this, m__root, m__is_le));
        break;
    }
    case gguf_t::GGUF_TYPE_FLOAT32: {
        n_value = false;
        m_value = std::unique_ptr<gguf_float32_t>(new gguf_float32_t(m__io, this, m__root, m__is_le));
        break;
    }
    case gguf_t::GGUF_TYPE_FLOAT64: {
        n_value = false;
        m_value = std::unique_ptr<gguf_float64_t>(new gguf_float64_t(m__io, this, m__root, m__is_le));
        break;
    }
    case gguf_t::GGUF_TYPE_INT16: {
        n_value = false;
        m_value = std::unique_ptr<gguf_int16_t>(new gguf_int16_t(m__io, this, m__root, m__is_le));
        break;
    }
    case gguf_t::GGUF_TYPE_INT32: {
        n_value = false;
        m_value = std::unique_ptr<gguf_int32_t>(new gguf_int32_t(m__io, this, m__root, m__is_le));
        break;
    }
    case gguf_t::GGUF_TYPE_INT64: {
        n_value = false;
        m_value = std::unique_ptr<gguf_int64_t>(new gguf_int64_t(m__io, this, m__root, m__is_le));
        break;
    }
    case gguf_t::GGUF_TYPE_INT8: {
        n_value = false;
        m_value = std::unique_ptr<gguf_int8_t>(new gguf_int8_t(m__io, this, m__root, m__is_le));
        break;
    }
    case gguf_t::GGUF_TYPE_STRING: {
        n_value = false;
        m_value = std::unique_ptr<gguf_str_t>(new gguf_str_t(m__io, this, m__root, m__is_le));
        break;
    }
    case gguf_t::GGUF_TYPE_UINT16: {
        n_value = false;
        m_value = std::unique_ptr<gguf_uint16_t>(new gguf_uint16_t(m__io, this, m__root, m__is_le));
        break;
    }
    case gguf_t::GGUF_TYPE_UINT32: {
        n_value = false;
        m_value = std::unique_ptr<gguf_uint32_t>(new gguf_uint32_t(m__io, this, m__root, m__is_le));
        break;
    }
    case gguf_t::GGUF_TYPE_UINT64: {
        n_value = false;
        m_value = std::unique_ptr<gguf_uint64_t>(new gguf_uint64_t(m__io, this, m__root, m__is_le));
        break;
    }
    case gguf_t::GGUF_TYPE_UINT8: {
        n_value = false;
        m_value = std::unique_ptr<gguf_uint8_t>(new gguf_uint8_t(m__io, this, m__root, m__is_le));
        break;
    }
    }
}

void gguf_t::gguf_body_t::gguf_value_t::_read_be() {
    n_value = true;
    switch (type()) {
    case gguf_t::GGUF_TYPE_ARRAY: {
        n_value = false;
        m_value = std::unique_ptr<gguf_array_t>(new gguf_array_t(m__io, this, m__root, m__is_le));
        break;
    }
    case gguf_t::GGUF_TYPE_BOOL: {
        n_value = false;
        m_value = std::unique_ptr<gguf_bool_t>(new gguf_bool_t(m__io, this, m__root, m__is_le));
        break;
    }
    case gguf_t::GGUF_TYPE_FLOAT32: {
        n_value = false;
        m_value = std::unique_ptr<gguf_float32_t>(new gguf_float32_t(m__io, this, m__root, m__is_le));
        break;
    }
    case gguf_t::GGUF_TYPE_FLOAT64: {
        n_value = false;
        m_value = std::unique_ptr<gguf_float64_t>(new gguf_float64_t(m__io, this, m__root, m__is_le));
        break;
    }
    case gguf_t::GGUF_TYPE_INT16: {
        n_value = false;
        m_value = std::unique_ptr<gguf_int16_t>(new gguf_int16_t(m__io, this, m__root, m__is_le));
        break;
    }
    case gguf_t::GGUF_TYPE_INT32: {
        n_value = false;
        m_value = std::unique_ptr<gguf_int32_t>(new gguf_int32_t(m__io, this, m__root, m__is_le));
        break;
    }
    case gguf_t::GGUF_TYPE_INT64: {
        n_value = false;
        m_value = std::unique_ptr<gguf_int64_t>(new gguf_int64_t(m__io, this, m__root, m__is_le));
        break;
    }
    case gguf_t::GGUF_TYPE_INT8: {
        n_value = false;
        m_value = std::unique_ptr<gguf_int8_t>(new gguf_int8_t(m__io, this, m__root, m__is_le));
        break;
    }
    case gguf_t::GGUF_TYPE_STRING: {
        n_value = false;
        m_value = std::unique_ptr<gguf_str_t>(new gguf_str_t(m__io, this, m__root, m__is_le));
        break;
    }
    case gguf_t::GGUF_TYPE_UINT16: {
        n_value = false;
        m_value = std::unique_ptr<gguf_uint16_t>(new gguf_uint16_t(m__io, this, m__root, m__is_le));
        break;
    }
    case gguf_t::GGUF_TYPE_UINT32: {
        n_value = false;
        m_value = std::unique_ptr<gguf_uint32_t>(new gguf_uint32_t(m__io, this, m__root, m__is_le));
        break;
    }
    case gguf_t::GGUF_TYPE_UINT64: {
        n_value = false;
        m_value = std::unique_ptr<gguf_uint64_t>(new gguf_uint64_t(m__io, this, m__root, m__is_le));
        break;
    }
    case gguf_t::GGUF_TYPE_UINT8: {
        n_value = false;
        m_value = std::unique_ptr<gguf_uint8_t>(new gguf_uint8_t(m__io, this, m__root, m__is_le));
        break;
    }
    }
}

gguf_t::gguf_body_t::gguf_value_t::~gguf_value_t() {
    _clean_up();
}

void gguf_t::gguf_body_t::gguf_value_t::_clean_up() {
    if (!n_value) {
    }
}

uint32_t gguf_t::gguf_body_t::alignment() {
    if (f_alignment)
        return m_alignment;
    f_alignment = true;
    m_alignment = ((kv_pairs()->size() != 0) ? (kv_pairs()->back()->alignment()) : (32));
    return m_alignment;
}

uint64_t gguf_t::gguf_body_t::ofs_tensor_data() {
    if (f_ofs_tensor_data)
        return m_ofs_tensor_data;
    f_ofs_tensor_data = true;
    m_ofs_tensor_data = static_cast<uint64_t>(_io()->pos());
    return m_ofs_tensor_data;
}

bool gguf_t::is_big_endian() {
    if (f_is_big_endian)
        return m_is_big_endian;
    f_is_big_endian = true;
    m_is_big_endian = (version_le() & 65535) == 0;
    return m_is_big_endian;
}

uint64_t gguf_t::len_file() {
    if (f_len_file)
        return m_len_file;
    f_len_file = true;
    m_len_file = static_cast<uint64_t>(body()->ofs_tensor_data() + ((body()->num_tensor_infos() != 0) ? (body()->tensor_infos()->back()->expected_next_offset()) : (0)));
    return m_len_file;
}

uint32_t gguf_t::version_le() {
    if (f_version_le)
        return m_version_le;
    f_version_le = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(4);
    m_version_le = m__io->read_u4le();
    m__io->seek(_pos);
    return m_version_le;
}

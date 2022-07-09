// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "msgpack.h"

msgpack_t::msgpack_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, msgpack_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_array_elements = 0;
    m_map_elements = 0;
    f_is_array_32 = false;
    f_int_value = false;
    f_str_len = false;
    f_is_fix_array = false;
    f_is_map = false;
    f_is_array = false;
    f_is_float = false;
    f_is_str_8 = false;
    f_is_fix_map = false;
    f_is_int = false;
    f_is_bool = false;
    f_is_str_16 = false;
    f_is_float_64 = false;
    f_is_map_16 = false;
    f_is_neg_int5 = false;
    f_pos_int7_value = false;
    f_is_nil = false;
    f_float_value = false;
    f_num_array_elements = false;
    f_neg_int5_value = false;
    f_bool_value = false;
    f_is_pos_int7 = false;
    f_is_array_16 = false;
    f_is_str = false;
    f_is_fix_str = false;
    f_is_str_32 = false;
    f_num_map_elements = false;
    f_is_float_32 = false;
    f_is_map_32 = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void msgpack_t::_read() {
    m_b1 = m__io->read_u1();
    n_int_extra = true;
    switch (b1()) {
    case 211: {
        n_int_extra = false;
        m_int_extra = m__io->read_s8be();
        break;
    }
    case 209: {
        n_int_extra = false;
        m_int_extra = m__io->read_s2be();
        break;
    }
    case 210: {
        n_int_extra = false;
        m_int_extra = m__io->read_s4be();
        break;
    }
    case 208: {
        n_int_extra = false;
        m_int_extra = m__io->read_s1();
        break;
    }
    case 205: {
        n_int_extra = false;
        m_int_extra = m__io->read_u2be();
        break;
    }
    case 207: {
        n_int_extra = false;
        m_int_extra = m__io->read_u8be();
        break;
    }
    case 204: {
        n_int_extra = false;
        m_int_extra = m__io->read_u1();
        break;
    }
    case 206: {
        n_int_extra = false;
        m_int_extra = m__io->read_u4be();
        break;
    }
    }
    n_float_32_value = true;
    if (is_float_32()) {
        n_float_32_value = false;
        m_float_32_value = m__io->read_f4be();
    }
    n_float_64_value = true;
    if (is_float_64()) {
        n_float_64_value = false;
        m_float_64_value = m__io->read_f8be();
    }
    n_str_len_8 = true;
    if (is_str_8()) {
        n_str_len_8 = false;
        m_str_len_8 = m__io->read_u1();
    }
    n_str_len_16 = true;
    if (is_str_16()) {
        n_str_len_16 = false;
        m_str_len_16 = m__io->read_u2be();
    }
    n_str_len_32 = true;
    if (is_str_32()) {
        n_str_len_32 = false;
        m_str_len_32 = m__io->read_u4be();
    }
    n_str_value = true;
    if (is_str()) {
        n_str_value = false;
        m_str_value = kaitai::kstream::bytes_to_str(m__io->read_bytes(str_len()), std::string("UTF-8"));
    }
    n_num_array_elements_16 = true;
    if (is_array_16()) {
        n_num_array_elements_16 = false;
        m_num_array_elements_16 = m__io->read_u2be();
    }
    n_num_array_elements_32 = true;
    if (is_array_32()) {
        n_num_array_elements_32 = false;
        m_num_array_elements_32 = m__io->read_u4be();
    }
    n_array_elements = true;
    if (is_array()) {
        n_array_elements = false;
        m_array_elements = new std::vector<msgpack_t*>();
        const int l_array_elements = num_array_elements();
        for (int i = 0; i < l_array_elements; i++) {
            m_array_elements->push_back(new msgpack_t(m__io));
        }
    }
    n_num_map_elements_16 = true;
    if (is_map_16()) {
        n_num_map_elements_16 = false;
        m_num_map_elements_16 = m__io->read_u2be();
    }
    n_num_map_elements_32 = true;
    if (is_map_32()) {
        n_num_map_elements_32 = false;
        m_num_map_elements_32 = m__io->read_u4be();
    }
    n_map_elements = true;
    if (is_map()) {
        n_map_elements = false;
        m_map_elements = new std::vector<map_tuple_t*>();
        const int l_map_elements = num_map_elements();
        for (int i = 0; i < l_map_elements; i++) {
            m_map_elements->push_back(new map_tuple_t(m__io, this, m__root));
        }
    }
}

msgpack_t::~msgpack_t() {
    _clean_up();
}

void msgpack_t::_clean_up() {
    if (!n_int_extra) {
    }
    if (!n_float_32_value) {
    }
    if (!n_float_64_value) {
    }
    if (!n_str_len_8) {
    }
    if (!n_str_len_16) {
    }
    if (!n_str_len_32) {
    }
    if (!n_str_value) {
    }
    if (!n_num_array_elements_16) {
    }
    if (!n_num_array_elements_32) {
    }
    if (!n_array_elements) {
        if (m_array_elements) {
            for (std::vector<msgpack_t*>::iterator it = m_array_elements->begin(); it != m_array_elements->end(); ++it) {
                delete *it;
            }
            delete m_array_elements; m_array_elements = 0;
        }
    }
    if (!n_num_map_elements_16) {
    }
    if (!n_num_map_elements_32) {
    }
    if (!n_map_elements) {
        if (m_map_elements) {
            for (std::vector<map_tuple_t*>::iterator it = m_map_elements->begin(); it != m_map_elements->end(); ++it) {
                delete *it;
            }
            delete m_map_elements; m_map_elements = 0;
        }
    }
}

msgpack_t::map_tuple_t::map_tuple_t(kaitai::kstream* p__io, msgpack_t* p__parent, msgpack_t* p__root) : kaitai::kstruct(p__io) {
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

void msgpack_t::map_tuple_t::_read() {
    m_key = new msgpack_t(m__io);
    m_value = new msgpack_t(m__io);
}

msgpack_t::map_tuple_t::~map_tuple_t() {
    _clean_up();
}

void msgpack_t::map_tuple_t::_clean_up() {
    if (m_key) {
        delete m_key; m_key = 0;
    }
    if (m_value) {
        delete m_value; m_value = 0;
    }
}

bool msgpack_t::is_array_32() {
    if (f_is_array_32)
        return m_is_array_32;
    m_is_array_32 = b1() == 221;
    f_is_array_32 = true;
    return m_is_array_32;
}

int32_t msgpack_t::int_value() {
    if (f_int_value)
        return m_int_value;
    n_int_value = true;
    if (is_int()) {
        n_int_value = false;
        m_int_value = ((is_pos_int7()) ? (pos_int7_value()) : (((is_neg_int5()) ? (neg_int5_value()) : (4919))));
    }
    f_int_value = true;
    return m_int_value;
}

int32_t msgpack_t::str_len() {
    if (f_str_len)
        return m_str_len;
    n_str_len = true;
    if (is_str()) {
        n_str_len = false;
        m_str_len = ((is_fix_str()) ? ((b1() & 31)) : (((is_str_8()) ? (str_len_8()) : (((is_str_16()) ? (str_len_16()) : (str_len_32()))))));
    }
    f_str_len = true;
    return m_str_len;
}

bool msgpack_t::is_fix_array() {
    if (f_is_fix_array)
        return m_is_fix_array;
    m_is_fix_array = (b1() & 240) == 144;
    f_is_fix_array = true;
    return m_is_fix_array;
}

bool msgpack_t::is_map() {
    if (f_is_map)
        return m_is_map;
    m_is_map =  ((is_fix_map()) || (is_map_16()) || (is_map_32())) ;
    f_is_map = true;
    return m_is_map;
}

bool msgpack_t::is_array() {
    if (f_is_array)
        return m_is_array;
    m_is_array =  ((is_fix_array()) || (is_array_16()) || (is_array_32())) ;
    f_is_array = true;
    return m_is_array;
}

bool msgpack_t::is_float() {
    if (f_is_float)
        return m_is_float;
    m_is_float =  ((is_float_32()) || (is_float_64())) ;
    f_is_float = true;
    return m_is_float;
}

bool msgpack_t::is_str_8() {
    if (f_is_str_8)
        return m_is_str_8;
    m_is_str_8 = b1() == 217;
    f_is_str_8 = true;
    return m_is_str_8;
}

bool msgpack_t::is_fix_map() {
    if (f_is_fix_map)
        return m_is_fix_map;
    m_is_fix_map = (b1() & 240) == 128;
    f_is_fix_map = true;
    return m_is_fix_map;
}

bool msgpack_t::is_int() {
    if (f_is_int)
        return m_is_int;
    m_is_int =  ((is_pos_int7()) || (is_neg_int5())) ;
    f_is_int = true;
    return m_is_int;
}

bool msgpack_t::is_bool() {
    if (f_is_bool)
        return m_is_bool;
    m_is_bool =  ((b1() == 194) || (b1() == 195)) ;
    f_is_bool = true;
    return m_is_bool;
}

bool msgpack_t::is_str_16() {
    if (f_is_str_16)
        return m_is_str_16;
    m_is_str_16 = b1() == 218;
    f_is_str_16 = true;
    return m_is_str_16;
}

bool msgpack_t::is_float_64() {
    if (f_is_float_64)
        return m_is_float_64;
    m_is_float_64 = b1() == 203;
    f_is_float_64 = true;
    return m_is_float_64;
}

bool msgpack_t::is_map_16() {
    if (f_is_map_16)
        return m_is_map_16;
    m_is_map_16 = b1() == 222;
    f_is_map_16 = true;
    return m_is_map_16;
}

bool msgpack_t::is_neg_int5() {
    if (f_is_neg_int5)
        return m_is_neg_int5;
    m_is_neg_int5 = (b1() & 224) == 224;
    f_is_neg_int5 = true;
    return m_is_neg_int5;
}

uint8_t msgpack_t::pos_int7_value() {
    if (f_pos_int7_value)
        return m_pos_int7_value;
    n_pos_int7_value = true;
    if (is_pos_int7()) {
        n_pos_int7_value = false;
        m_pos_int7_value = b1();
    }
    f_pos_int7_value = true;
    return m_pos_int7_value;
}

bool msgpack_t::is_nil() {
    if (f_is_nil)
        return m_is_nil;
    m_is_nil = b1() == 192;
    f_is_nil = true;
    return m_is_nil;
}

double msgpack_t::float_value() {
    if (f_float_value)
        return m_float_value;
    n_float_value = true;
    if (is_float()) {
        n_float_value = false;
        m_float_value = ((is_float_32()) ? (float_32_value()) : (float_64_value()));
    }
    f_float_value = true;
    return m_float_value;
}

int32_t msgpack_t::num_array_elements() {
    if (f_num_array_elements)
        return m_num_array_elements;
    n_num_array_elements = true;
    if (is_array()) {
        n_num_array_elements = false;
        m_num_array_elements = ((is_fix_array()) ? ((b1() & 15)) : (((is_array_16()) ? (num_array_elements_16()) : (num_array_elements_32()))));
    }
    f_num_array_elements = true;
    return m_num_array_elements;
}

int32_t msgpack_t::neg_int5_value() {
    if (f_neg_int5_value)
        return m_neg_int5_value;
    n_neg_int5_value = true;
    if (is_neg_int5()) {
        n_neg_int5_value = false;
        m_neg_int5_value = -((b1() & 31));
    }
    f_neg_int5_value = true;
    return m_neg_int5_value;
}

bool msgpack_t::bool_value() {
    if (f_bool_value)
        return m_bool_value;
    n_bool_value = true;
    if (is_bool()) {
        n_bool_value = false;
        m_bool_value = b1() == 195;
    }
    f_bool_value = true;
    return m_bool_value;
}

bool msgpack_t::is_pos_int7() {
    if (f_is_pos_int7)
        return m_is_pos_int7;
    m_is_pos_int7 = (b1() & 128) == 0;
    f_is_pos_int7 = true;
    return m_is_pos_int7;
}

bool msgpack_t::is_array_16() {
    if (f_is_array_16)
        return m_is_array_16;
    m_is_array_16 = b1() == 220;
    f_is_array_16 = true;
    return m_is_array_16;
}

bool msgpack_t::is_str() {
    if (f_is_str)
        return m_is_str;
    m_is_str =  ((is_fix_str()) || (is_str_8()) || (is_str_16()) || (is_str_32())) ;
    f_is_str = true;
    return m_is_str;
}

bool msgpack_t::is_fix_str() {
    if (f_is_fix_str)
        return m_is_fix_str;
    m_is_fix_str = (b1() & 224) == 160;
    f_is_fix_str = true;
    return m_is_fix_str;
}

bool msgpack_t::is_str_32() {
    if (f_is_str_32)
        return m_is_str_32;
    m_is_str_32 = b1() == 219;
    f_is_str_32 = true;
    return m_is_str_32;
}

int32_t msgpack_t::num_map_elements() {
    if (f_num_map_elements)
        return m_num_map_elements;
    n_num_map_elements = true;
    if (is_map()) {
        n_num_map_elements = false;
        m_num_map_elements = ((is_fix_map()) ? ((b1() & 15)) : (((is_map_16()) ? (num_map_elements_16()) : (num_map_elements_32()))));
    }
    f_num_map_elements = true;
    return m_num_map_elements;
}

bool msgpack_t::is_float_32() {
    if (f_is_float_32)
        return m_is_float_32;
    m_is_float_32 = b1() == 202;
    f_is_float_32 = true;
    return m_is_float_32;
}

bool msgpack_t::is_map_32() {
    if (f_is_map_32)
        return m_is_map_32;
    m_is_map_32 = b1() == 223;
    f_is_map_32 = true;
    return m_is_map_32;
}

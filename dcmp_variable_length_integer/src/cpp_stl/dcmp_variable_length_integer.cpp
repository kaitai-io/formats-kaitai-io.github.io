// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "dcmp_variable_length_integer.h"



dcmp_variable_length_integer_t::dcmp_variable_length_integer_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, dcmp_variable_length_integer_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    f_value = false;
    _read();
}

void dcmp_variable_length_integer_t::_read() {
    m_first = m__io->read_u1();
    n_more = true;
    if (first() >= 128) {
        n_more = false;
        switch (first()) {
        case 255: {
            m_more = m__io->read_s4be();
            break;
        }
        default: {
            m_more = m__io->read_u1();
            break;
        }
        }
    }
}

dcmp_variable_length_integer_t::~dcmp_variable_length_integer_t() {
    if (!n_more) {
    }
}

int32_t dcmp_variable_length_integer_t::value() {
    if (f_value)
        return m_value;
    m_value = ((first() == 255) ? (more()) : (((first() >= 128) ? ((((first() << 8) | more()) - 49152)) : (first()))));
    f_value = true;
    return m_value;
}

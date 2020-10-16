// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "bcd.h"

bcd_t::bcd_t(uint8_t p_num_digits, uint8_t p_bits_per_digit, bool p_is_le, kaitai::kstream* p__io, kaitai::kstruct* p__parent, bcd_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_num_digits = p_num_digits;
    m_bits_per_digit = p_bits_per_digit;
    m_is_le = p_is_le;
    m_digits = nullptr;
    f_as_int = false;
    f_as_int_le = false;
    f_last_idx = false;
    f_as_int_be = false;
    _read();
}

void bcd_t::_read() {
    int l_digits = num_digits();
    m_digits = std::unique_ptr<std::vector<int32_t>>(new std::vector<int32_t>());
    m_digits->reserve(l_digits);
    for (int i = 0; i < l_digits; i++) {
        switch (bits_per_digit()) {
        case 4: {
            m_digits->push_back(std::move(m__io->read_bits_int_be(4)));
            break;
        }
        case 8: {
            m_digits->push_back(std::move(m__io->read_u1()));
            break;
        }
        }
    }
}

bcd_t::~bcd_t() {
    _clean_up();
}

void bcd_t::_clean_up() {
}

int32_t bcd_t::as_int() {
    if (f_as_int)
        return m_as_int;
    m_as_int = ((is_le()) ? (as_int_le()) : (as_int_be()));
    f_as_int = true;
    return m_as_int;
}

int32_t bcd_t::as_int_le() {
    if (f_as_int_le)
        return m_as_int_le;
    m_as_int_le = (digits()->at(0) + ((num_digits() < 2) ? (0) : (((digits()->at(1) * 10) + ((num_digits() < 3) ? (0) : (((digits()->at(2) * 100) + ((num_digits() < 4) ? (0) : (((digits()->at(3) * 1000) + ((num_digits() < 5) ? (0) : (((digits()->at(4) * 10000) + ((num_digits() < 6) ? (0) : (((digits()->at(5) * 100000) + ((num_digits() < 7) ? (0) : (((digits()->at(6) * 1000000) + ((num_digits() < 8) ? (0) : ((digits()->at(7) * 10000000))))))))))))))))))))));
    f_as_int_le = true;
    return m_as_int_le;
}

int32_t bcd_t::last_idx() {
    if (f_last_idx)
        return m_last_idx;
    m_last_idx = (num_digits() - 1);
    f_last_idx = true;
    return m_last_idx;
}

int32_t bcd_t::as_int_be() {
    if (f_as_int_be)
        return m_as_int_be;
    m_as_int_be = (digits()->at(last_idx()) + ((num_digits() < 2) ? (0) : (((digits()->at((last_idx() - 1)) * 10) + ((num_digits() < 3) ? (0) : (((digits()->at((last_idx() - 2)) * 100) + ((num_digits() < 4) ? (0) : (((digits()->at((last_idx() - 3)) * 1000) + ((num_digits() < 5) ? (0) : (((digits()->at((last_idx() - 4)) * 10000) + ((num_digits() < 6) ? (0) : (((digits()->at((last_idx() - 5)) * 100000) + ((num_digits() < 7) ? (0) : (((digits()->at((last_idx() - 6)) * 1000000) + ((num_digits() < 8) ? (0) : ((digits()->at((last_idx() - 7)) * 10000000))))))))))))))))))))));
    f_as_int_be = true;
    return m_as_int_be;
}

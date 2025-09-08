// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "vlq_base128_le.h"
#include "kaitai/exceptions.h"

vlq_base128_le_t::vlq_base128_le_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, vlq_base128_le_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_groups = nullptr;
    f_len = false;
    f_sign_bit = false;
    f_value = false;
    f_value_signed = false;
    _read();
}

void vlq_base128_le_t::_read() {
    m_groups = std::unique_ptr<std::vector<std::unique_ptr<group_t>>>(new std::vector<std::unique_ptr<group_t>>());
    {
        int i = 0;
        group_t* _;
        do {
            _ = new group_t(i, ((i != 0) ? (groups()->at(i - 1)->interm_value()) : (0)), ((i != 0) ? (((i == 9) ? (9223372036854775808ULL) : (groups()->at(i - 1)->multiplier() * 128))) : (1)), m__io, this, m__root);
            m_groups->push_back(std::move(std::unique_ptr<group_t>(_)));
            i++;
        } while (!(!(_->has_next())));
    }
}

vlq_base128_le_t::~vlq_base128_le_t() {
    _clean_up();
}

void vlq_base128_le_t::_clean_up() {
}

vlq_base128_le_t::group_t::group_t(int32_t p_idx, uint64_t p_prev_interm_value, uint64_t p_multiplier, kaitai::kstream* p__io, vlq_base128_le_t* p__parent, vlq_base128_le_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_idx = p_idx;
    m_prev_interm_value = p_prev_interm_value;
    m_multiplier = p_multiplier;
    f_interm_value = false;
    _read();
}

void vlq_base128_le_t::group_t::_read() {
    m_has_next = m__io->read_bits_int_be(1);
    if (!(m_has_next == ((idx() == 9) ? (false) : (has_next())))) {
        throw kaitai::validation_not_equal_error<bool>(((idx() == 9) ? (false) : (has_next())), m_has_next, m__io, std::string("/types/group/seq/0"));
    }
    m_value = m__io->read_bits_int_be(7);
    if (!(m_value <= static_cast<uint64_t>(((idx() == 9) ? (1) : (127))))) {
        throw kaitai::validation_greater_than_error<uint64_t>(static_cast<uint64_t>(((idx() == 9) ? (1) : (127))), m_value, m__io, std::string("/types/group/seq/1"));
    }
}

vlq_base128_le_t::group_t::~group_t() {
    _clean_up();
}

void vlq_base128_le_t::group_t::_clean_up() {
}

uint64_t vlq_base128_le_t::group_t::interm_value() {
    if (f_interm_value)
        return m_interm_value;
    f_interm_value = true;
    m_interm_value = static_cast<uint64_t>(prev_interm_value() + value() * multiplier());
    return m_interm_value;
}

int32_t vlq_base128_le_t::len() {
    if (f_len)
        return m_len;
    f_len = true;
    m_len = groups()->size();
    return m_len;
}

uint64_t vlq_base128_le_t::sign_bit() {
    if (f_sign_bit)
        return m_sign_bit;
    f_sign_bit = true;
    m_sign_bit = static_cast<uint64_t>(((len() == 10) ? (9223372036854775808ULL) : (groups()->back()->multiplier() * 64)));
    return m_sign_bit;
}

uint64_t vlq_base128_le_t::value() {
    if (f_value)
        return m_value;
    f_value = true;
    m_value = groups()->back()->interm_value();
    return m_value;
}

int64_t vlq_base128_le_t::value_signed() {
    if (f_value_signed)
        return m_value_signed;
    f_value_signed = true;
    m_value_signed = (( ((sign_bit() > 0) && (value() >= sign_bit())) ) ? (-(static_cast<int64_t>(sign_bit() - (value() - sign_bit())))) : (static_cast<int64_t>(value())));
    return m_value_signed;
}

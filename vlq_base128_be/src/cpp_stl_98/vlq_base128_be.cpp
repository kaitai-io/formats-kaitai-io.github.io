// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "vlq_base128_be.h"

vlq_base128_be_t::vlq_base128_be_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, vlq_base128_be_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_groups = 0;
    f_last = false;
    f_value = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void vlq_base128_be_t::_read() {
    m_groups = new std::vector<group_t*>();
    {
        int i = 0;
        group_t* _;
        do {
            _ = new group_t(m__io, this, m__root);
            m_groups->push_back(_);
            i++;
        } while (!(!(_->has_next())));
    }
}

vlq_base128_be_t::~vlq_base128_be_t() {
    _clean_up();
}

void vlq_base128_be_t::_clean_up() {
    if (m_groups) {
        for (std::vector<group_t*>::iterator it = m_groups->begin(); it != m_groups->end(); ++it) {
            delete *it;
        }
        delete m_groups; m_groups = 0;
    }
}

vlq_base128_be_t::group_t::group_t(kaitai::kstream* p__io, vlq_base128_be_t* p__parent, vlq_base128_be_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void vlq_base128_be_t::group_t::_read() {
    m_has_next = m__io->read_bits_int_be(1);
    m_value = m__io->read_bits_int_be(7);
}

vlq_base128_be_t::group_t::~group_t() {
    _clean_up();
}

void vlq_base128_be_t::group_t::_clean_up() {
}

int32_t vlq_base128_be_t::last() {
    if (f_last)
        return m_last;
    f_last = true;
    m_last = groups()->size() - 1;
    return m_last;
}

uint64_t vlq_base128_be_t::value() {
    if (f_value)
        return m_value;
    f_value = true;
    m_value = static_cast<uint64_t>(((((((groups()->at(last())->value() + ((last() >= 1) ? (groups()->at(last() - 1)->value() << 7) : (0))) + ((last() >= 2) ? (groups()->at(last() - 2)->value() << 14) : (0))) + ((last() >= 3) ? (groups()->at(last() - 3)->value() << 21) : (0))) + ((last() >= 4) ? (groups()->at(last() - 4)->value() << 28) : (0))) + ((last() >= 5) ? (groups()->at(last() - 5)->value() << 35) : (0))) + ((last() >= 6) ? (groups()->at(last() - 6)->value() << 42) : (0))) + ((last() >= 7) ? (groups()->at(last() - 7)->value() << 49) : (0)));
    return m_value;
}

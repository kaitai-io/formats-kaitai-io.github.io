// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "vlq_base128_be.h"



vlq_base128_be_t::vlq_base128_be_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, vlq_base128_be_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    f_last = false;
    f_value = false;
    _read();
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
    for (std::vector<group_t*>::iterator it = m_groups->begin(); it != m_groups->end(); ++it) {
        delete *it;
    }
    delete m_groups;
}

vlq_base128_be_t::group_t::group_t(kaitai::kstream* p__io, vlq_base128_be_t* p__parent, vlq_base128_be_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_has_next = false;
    f_value = false;
    _read();
}

void vlq_base128_be_t::group_t::_read() {
    m_b = m__io->read_u1();
}

vlq_base128_be_t::group_t::~group_t() {
}

bool vlq_base128_be_t::group_t::has_next() {
    if (f_has_next)
        return m_has_next;
    m_has_next = (b() & 128) != 0;
    f_has_next = true;
    return m_has_next;
}

int32_t vlq_base128_be_t::group_t::value() {
    if (f_value)
        return m_value;
    m_value = (b() & 127);
    f_value = true;
    return m_value;
}

int32_t vlq_base128_be_t::last() {
    if (f_last)
        return m_last;
    m_last = (groups()->size() - 1);
    f_last = true;
    return m_last;
}

int32_t vlq_base128_be_t::value() {
    if (f_value)
        return m_value;
    m_value = (((((((groups()->at(last())->value() + ((last() >= 1) ? ((groups()->at((last() - 1))->value() << 7)) : (0))) + ((last() >= 2) ? ((groups()->at((last() - 2))->value() << 14)) : (0))) + ((last() >= 3) ? ((groups()->at((last() - 3))->value() << 21)) : (0))) + ((last() >= 4) ? ((groups()->at((last() - 4))->value() << 28)) : (0))) + ((last() >= 5) ? ((groups()->at((last() - 5))->value() << 35)) : (0))) + ((last() >= 6) ? ((groups()->at((last() - 6))->value() << 42)) : (0))) + ((last() >= 7) ? ((groups()->at((last() - 7))->value() << 49)) : (0)));
    f_value = true;
    return m_value;
}

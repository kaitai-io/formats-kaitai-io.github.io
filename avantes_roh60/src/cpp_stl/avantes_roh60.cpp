// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "avantes_roh60.h"



avantes_roh60_t::avantes_roh60_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, avantes_roh60_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void avantes_roh60_t::_read() {
    m_unknown1 = m__io->read_f4le();
    m_wlintercept = m__io->read_f4le();
    m_wlx1 = m__io->read_f4le();
    m_wlx2 = m__io->read_f4le();
    m_wlx3 = m__io->read_f4le();
    m_wlx4 = m__io->read_f4le();
    int l_unknown2 = 9;
    m_unknown2 = new std::vector<float>();
    m_unknown2->reserve(l_unknown2);
    for (int i = 0; i < l_unknown2; i++) {
        m_unknown2->push_back(m__io->read_f4le());
    }
    m_ipixfirst = m__io->read_f4le();
    m_ipixlast = m__io->read_f4le();
    int l_unknown3 = 4;
    m_unknown3 = new std::vector<float>();
    m_unknown3->reserve(l_unknown3);
    for (int i = 0; i < l_unknown3; i++) {
        m_unknown3->push_back(m__io->read_f4le());
    }
    int l_spectrum = ((static_cast<int>(ipixlast()) - static_cast<int>(ipixfirst())) - 1);
    m_spectrum = new std::vector<float>();
    m_spectrum->reserve(l_spectrum);
    for (int i = 0; i < l_spectrum; i++) {
        m_spectrum->push_back(m__io->read_f4le());
    }
    int l_unknown4 = 3;
    m_unknown4 = new std::vector<float>();
    m_unknown4->reserve(l_unknown4);
    for (int i = 0; i < l_unknown4; i++) {
        m_unknown4->push_back(m__io->read_f4le());
    }
}

avantes_roh60_t::~avantes_roh60_t() {
    delete m_unknown2;
    delete m_unknown3;
    delete m_spectrum;
    delete m_unknown4;
}

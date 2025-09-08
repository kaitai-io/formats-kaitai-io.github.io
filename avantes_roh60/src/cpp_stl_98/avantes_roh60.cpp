// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "avantes_roh60.h"

avantes_roh60_t::avantes_roh60_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, avantes_roh60_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_unknown2 = 0;
    m_unknown3 = 0;
    m_spectrum = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void avantes_roh60_t::_read() {
    m_unknown1 = m__io->read_f4le();
    m_wlintercept = m__io->read_f4le();
    m_wlx1 = m__io->read_f4le();
    m_wlx2 = m__io->read_f4le();
    m_wlx3 = m__io->read_f4le();
    m_wlx4 = m__io->read_f4le();
    m_unknown2 = new std::vector<float>();
    const int l_unknown2 = 9;
    for (int i = 0; i < l_unknown2; i++) {
        m_unknown2->push_back(m__io->read_f4le());
    }
    m_ipixfirst = m__io->read_f4le();
    m_ipixlast = m__io->read_f4le();
    m_unknown3 = new std::vector<float>();
    const int l_unknown3 = 4;
    for (int i = 0; i < l_unknown3; i++) {
        m_unknown3->push_back(m__io->read_f4le());
    }
    m_spectrum = new std::vector<float>();
    const int l_spectrum = (static_cast<int>(ipixlast()) - static_cast<int>(ipixfirst())) - 1;
    for (int i = 0; i < l_spectrum; i++) {
        m_spectrum->push_back(m__io->read_f4le());
    }
    m_integration_ms = m__io->read_f4le();
    m_averaging = m__io->read_f4le();
    m_pixel_smoothing = m__io->read_f4le();
}

avantes_roh60_t::~avantes_roh60_t() {
    _clean_up();
}

void avantes_roh60_t::_clean_up() {
    if (m_unknown2) {
        delete m_unknown2; m_unknown2 = 0;
    }
    if (m_unknown3) {
        delete m_unknown3; m_unknown3 = 0;
    }
    if (m_spectrum) {
        delete m_spectrum; m_spectrum = 0;
    }
}

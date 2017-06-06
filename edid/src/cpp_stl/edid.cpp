// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "edid.h"



edid_t::edid_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, edid_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    f_mfg_year = false;
    f_mfg_id_ch1 = false;
    f_mfg_id_ch3 = false;
    f_gamma = false;
    f_mfg_id_ch2 = false;
    _read();
}

void edid_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\x00\xFF\xFF\xFF\xFF\xFF\xFF\x00", 8));
    m_mfg_bytes = m__io->read_u2le();
    m_product_code = m__io->read_u2le();
    m_serial = m__io->read_u4le();
    m_mfg_week = m__io->read_u1();
    m_mfg_year_mod = m__io->read_u1();
    m_edid_version_major = m__io->read_u1();
    m_edid_version_minor = m__io->read_u1();
    m_input_flags = m__io->read_u1();
    m_screen_size_h = m__io->read_u1();
    m_screen_size_v = m__io->read_u1();
    m_gamma_mod = m__io->read_u1();
    m_features_flags = m__io->read_u1();
    m_chromacity = m__io->read_bytes(10);
}

edid_t::~edid_t() {
}

int32_t edid_t::mfg_year() {
    if (f_mfg_year)
        return m_mfg_year;
    m_mfg_year = (mfg_year_mod() + 1990);
    f_mfg_year = true;
    return m_mfg_year;
}

int32_t edid_t::mfg_id_ch1() {
    if (f_mfg_id_ch1)
        return m_mfg_id_ch1;
    m_mfg_id_ch1 = ((mfg_bytes() & 31744) >> 10);
    f_mfg_id_ch1 = true;
    return m_mfg_id_ch1;
}

int32_t edid_t::mfg_id_ch3() {
    if (f_mfg_id_ch3)
        return m_mfg_id_ch3;
    m_mfg_id_ch3 = (mfg_bytes() & 31);
    f_mfg_id_ch3 = true;
    return m_mfg_id_ch3;
}

double edid_t::gamma() {
    if (f_gamma)
        return m_gamma;
    n_gamma = true;
    if (gamma_mod() != 255) {
        n_gamma = false;
        m_gamma = ((gamma_mod() + 100) / 100.0);
    }
    f_gamma = true;
    return m_gamma;
}

int32_t edid_t::mfg_id_ch2() {
    if (f_mfg_id_ch2)
        return m_mfg_id_ch2;
    m_mfg_id_ch2 = ((mfg_bytes() & 992) >> 5);
    f_mfg_id_ch2 = true;
    return m_mfg_id_ch2;
}

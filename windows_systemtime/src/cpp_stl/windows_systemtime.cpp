// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "windows_systemtime.h"



windows_systemtime_t::windows_systemtime_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, windows_systemtime_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void windows_systemtime_t::_read() {
    m_year = m__io->read_u2le();
    m_month = m__io->read_u2le();
    m_dow = m__io->read_u2le();
    m_day = m__io->read_u2le();
    m_hour = m__io->read_u2le();
    m_min = m__io->read_u2le();
    m_sec = m__io->read_u2le();
    m_msec = m__io->read_u2le();
}

windows_systemtime_t::~windows_systemtime_t() {
}

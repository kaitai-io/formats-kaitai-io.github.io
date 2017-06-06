// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "ines.h"



ines_t::ines_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, ines_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    f_mapper = false;
    _read();
}

void ines_t::_read() {
    m_header = new header_t(m__io, this, m__root);
    m_rom = m__io->read_bytes_full();
}

ines_t::~ines_t() {
    delete m_header;
}

ines_t::f7_t::f7_t(kaitai::kstream *p_io, ines_t::header_t* p_parent, ines_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ines_t::f7_t::_read() {
    m_upper_nibble = m__io->read_bits_int(4);
    m_format = m__io->read_bits_int(2);
    m_arcade_2 = m__io->read_bits_int(1);
    m_arcade_1 = m__io->read_bits_int(1);
}

ines_t::f7_t::~f7_t() {
}

ines_t::f6_t::f6_t(kaitai::kstream *p_io, ines_t::header_t* p_parent, ines_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ines_t::f6_t::_read() {
    m_lower_nibble = m__io->read_bits_int(4);
    m_ignore_mirror = m__io->read_bits_int(1);
    m_trainer = m__io->read_bits_int(1);
    m_has_battery_ram = m__io->read_bits_int(1);
    m_mirror = m__io->read_bits_int(1);
}

ines_t::f6_t::~f6_t() {
}

ines_t::f10_t::f10_t(kaitai::kstream *p_io, ines_t::header_t* p_parent, ines_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ines_t::f10_t::_read() {
    m_nothing1 = m__io->read_bits_int(2);
    m_bus_conflict = m__io->read_bits_int(1);
    m_prg_ram = m__io->read_bits_int(1);
    m_nothing2 = m__io->read_bits_int(2);
    m_tv_system = m__io->read_bits_int(2);
}

ines_t::f10_t::~f10_t() {
}

ines_t::f9_t::f9_t(kaitai::kstream *p_io, ines_t::header_t* p_parent, ines_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ines_t::f9_t::_read() {
    m_reserved = m__io->read_bits_int(7);
    m_tv_system = m__io->read_bits_int(1);
}

ines_t::f9_t::~f9_t() {
}

ines_t::header_t::header_t(kaitai::kstream *p_io, ines_t* p_parent, ines_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void ines_t::header_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\x4E\x45\x53\x1A", 4));
    m_prg_rom_size = m__io->read_u1();
    m_chr_rom_size = m__io->read_u1();
    m_f6 = new f6_t(m__io, this, m__root);
    m_f7 = new f7_t(m__io, this, m__root);
    m_prg_ram_size = m__io->read_u1();
    m_f9 = new f9_t(m__io, this, m__root);
    m_f10 = new f10_t(m__io, this, m__root);
    m_zero_fill = m__io->read_bytes(4);
}

ines_t::header_t::~header_t() {
    delete m_f6;
    delete m_f7;
    delete m_f9;
    delete m_f10;
}

int32_t ines_t::mapper() {
    if (f_mapper)
        return m_mapper;
    m_mapper = (_root()->header()->f6()->lower_nibble() | (_root()->header()->f7()->upper_nibble() << 4));
    f_mapper = true;
    return m_mapper;
}

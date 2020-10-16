// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "ines.h"
#include "kaitai/exceptions.h"

ines_t::ines_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, ines_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = nullptr;
    m__io__raw_header = nullptr;
    m_playchoice10 = nullptr;
    _read();
}

void ines_t::_read() {
    m__raw_header = m__io->read_bytes(16);
    m__io__raw_header = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_header));
    m_header = std::unique_ptr<header_t>(new header_t(m__io__raw_header.get(), this, m__root));
    n_trainer = true;
    if (header()->f6()->trainer()) {
        n_trainer = false;
        m_trainer = m__io->read_bytes(512);
    }
    m_prg_rom = m__io->read_bytes((header()->len_prg_rom() * 16384));
    m_chr_rom = m__io->read_bytes((header()->len_chr_rom() * 8192));
    n_playchoice10 = true;
    if (header()->f7()->playchoice10()) {
        n_playchoice10 = false;
        m_playchoice10 = std::unique_ptr<playchoice10_t>(new playchoice10_t(m__io, this, m__root));
    }
    n_title = true;
    if (!(_io()->is_eof())) {
        n_title = false;
        m_title = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), std::string("ASCII"));
    }
}

ines_t::~ines_t() {
    _clean_up();
}

void ines_t::_clean_up() {
    if (!n_trainer) {
    }
    if (!n_playchoice10) {
    }
    if (!n_title) {
    }
}

ines_t::header_t::header_t(kaitai::kstream* p__io, ines_t* p__parent, ines_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_f6 = nullptr;
    m__io__raw_f6 = nullptr;
    m_f7 = nullptr;
    m__io__raw_f7 = nullptr;
    m_f9 = nullptr;
    m__io__raw_f9 = nullptr;
    m_f10 = nullptr;
    m__io__raw_f10 = nullptr;
    f_mapper = false;
    _read();
}

void ines_t::header_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\x4E\x45\x53\x1A", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4E\x45\x53\x1A", 4), magic(), _io(), std::string("/types/header/seq/0"));
    }
    m_len_prg_rom = m__io->read_u1();
    m_len_chr_rom = m__io->read_u1();
    m__raw_f6 = m__io->read_bytes(1);
    m__io__raw_f6 = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_f6));
    m_f6 = std::unique_ptr<f6_t>(new f6_t(m__io__raw_f6.get(), this, m__root));
    m__raw_f7 = m__io->read_bytes(1);
    m__io__raw_f7 = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_f7));
    m_f7 = std::unique_ptr<f7_t>(new f7_t(m__io__raw_f7.get(), this, m__root));
    m_len_prg_ram = m__io->read_u1();
    m__raw_f9 = m__io->read_bytes(1);
    m__io__raw_f9 = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_f9));
    m_f9 = std::unique_ptr<f9_t>(new f9_t(m__io__raw_f9.get(), this, m__root));
    m__raw_f10 = m__io->read_bytes(1);
    m__io__raw_f10 = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_f10));
    m_f10 = std::unique_ptr<f10_t>(new f10_t(m__io__raw_f10.get(), this, m__root));
    m_reserved = m__io->read_bytes(5);
    if (!(reserved() == std::string("\x00\x00\x00\x00\x00", 5))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00\x00", 5), reserved(), _io(), std::string("/types/header/seq/8"));
    }
}

ines_t::header_t::~header_t() {
    _clean_up();
}

void ines_t::header_t::_clean_up() {
}

ines_t::header_t::f6_t::f6_t(kaitai::kstream* p__io, ines_t::header_t* p__parent, ines_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void ines_t::header_t::f6_t::_read() {
    m_lower_mapper = m__io->read_bits_int_be(4);
    m_four_screen = m__io->read_bits_int_be(1);
    m_trainer = m__io->read_bits_int_be(1);
    m_has_battery_ram = m__io->read_bits_int_be(1);
    m_mirroring = static_cast<ines_t::header_t::f6_t::mirroring_t>(m__io->read_bits_int_be(1));
}

ines_t::header_t::f6_t::~f6_t() {
    _clean_up();
}

void ines_t::header_t::f6_t::_clean_up() {
}

ines_t::header_t::f7_t::f7_t(kaitai::kstream* p__io, ines_t::header_t* p__parent, ines_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void ines_t::header_t::f7_t::_read() {
    m_upper_mapper = m__io->read_bits_int_be(4);
    m_format = m__io->read_bits_int_be(2);
    m_playchoice10 = m__io->read_bits_int_be(1);
    m_vs_unisystem = m__io->read_bits_int_be(1);
}

ines_t::header_t::f7_t::~f7_t() {
    _clean_up();
}

void ines_t::header_t::f7_t::_clean_up() {
}

ines_t::header_t::f9_t::f9_t(kaitai::kstream* p__io, ines_t::header_t* p__parent, ines_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void ines_t::header_t::f9_t::_read() {
    m_reserved = m__io->read_bits_int_be(7);
    m_tv_system = static_cast<ines_t::header_t::f9_t::tv_system_t>(m__io->read_bits_int_be(1));
}

ines_t::header_t::f9_t::~f9_t() {
    _clean_up();
}

void ines_t::header_t::f9_t::_clean_up() {
}

ines_t::header_t::f10_t::f10_t(kaitai::kstream* p__io, ines_t::header_t* p__parent, ines_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void ines_t::header_t::f10_t::_read() {
    m_reserved1 = m__io->read_bits_int_be(2);
    m_bus_conflict = m__io->read_bits_int_be(1);
    m_prg_ram = m__io->read_bits_int_be(1);
    m_reserved2 = m__io->read_bits_int_be(2);
    m_tv_system = static_cast<ines_t::header_t::f10_t::tv_system_t>(m__io->read_bits_int_be(2));
}

ines_t::header_t::f10_t::~f10_t() {
    _clean_up();
}

void ines_t::header_t::f10_t::_clean_up() {
}

int32_t ines_t::header_t::mapper() {
    if (f_mapper)
        return m_mapper;
    m_mapper = (f6()->lower_mapper() | (f7()->upper_mapper() << 4));
    f_mapper = true;
    return m_mapper;
}

ines_t::playchoice10_t::playchoice10_t(kaitai::kstream* p__io, ines_t* p__parent, ines_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_prom = nullptr;
    _read();
}

void ines_t::playchoice10_t::_read() {
    m_inst_rom = m__io->read_bytes(8192);
    m_prom = std::unique_ptr<prom_t>(new prom_t(m__io, this, m__root));
}

ines_t::playchoice10_t::~playchoice10_t() {
    _clean_up();
}

void ines_t::playchoice10_t::_clean_up() {
}

ines_t::playchoice10_t::prom_t::prom_t(kaitai::kstream* p__io, ines_t::playchoice10_t* p__parent, ines_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void ines_t::playchoice10_t::prom_t::_read() {
    m_data = m__io->read_bytes(16);
    m_counter_out = m__io->read_bytes(16);
}

ines_t::playchoice10_t::prom_t::~prom_t() {
    _clean_up();
}

void ines_t::playchoice10_t::prom_t::_clean_up() {
}

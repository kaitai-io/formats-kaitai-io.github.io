// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "vmware_vmdk.h"
#include "kaitai/exceptions.h"

vmware_vmdk_t::vmware_vmdk_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, vmware_vmdk_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_flags = 0;
    f_len_sector = false;
    f_descriptor = false;
    f_grain_primary = false;
    f_grain_secondary = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void vmware_vmdk_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\x4B\x44\x4D\x56", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4B\x44\x4D\x56", 4), magic(), _io(), std::string("/seq/0"));
    }
    m_version = m__io->read_s4le();
    m_flags = new header_flags_t(m__io, this, m__root);
    m_size_max = m__io->read_s8le();
    m_size_grain = m__io->read_s8le();
    m_start_descriptor = m__io->read_s8le();
    m_size_descriptor = m__io->read_s8le();
    m_num_grain_table_entries = m__io->read_s4le();
    m_start_secondary_grain = m__io->read_s8le();
    m_start_primary_grain = m__io->read_s8le();
    m_size_metadata = m__io->read_s8le();
    m_is_dirty = m__io->read_u1();
    m_stuff = m__io->read_bytes(4);
    m_compression_method = static_cast<vmware_vmdk_t::compression_methods_t>(m__io->read_u2le());
}

vmware_vmdk_t::~vmware_vmdk_t() {
    _clean_up();
}

void vmware_vmdk_t::_clean_up() {
    if (m_flags) {
        delete m_flags; m_flags = 0;
    }
    if (f_descriptor) {
    }
    if (f_grain_primary) {
    }
    if (f_grain_secondary) {
    }
}

vmware_vmdk_t::header_flags_t::header_flags_t(kaitai::kstream* p__io, vmware_vmdk_t* p__parent, vmware_vmdk_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void vmware_vmdk_t::header_flags_t::_read() {
    m_reserved1 = m__io->read_bits_int_be(5);
    m_zeroed_grain_table_entry = m__io->read_bits_int_be(1);
    m_use_secondary_grain_dir = m__io->read_bits_int_be(1);
    m_valid_new_line_detection_test = m__io->read_bits_int_be(1);
    m__io->align_to_byte();
    m_reserved2 = m__io->read_u1();
    m_reserved3 = m__io->read_bits_int_be(6);
    m_has_metadata = m__io->read_bits_int_be(1);
    m_has_compressed_grain = m__io->read_bits_int_be(1);
    m__io->align_to_byte();
    m_reserved4 = m__io->read_u1();
}

vmware_vmdk_t::header_flags_t::~header_flags_t() {
    _clean_up();
}

void vmware_vmdk_t::header_flags_t::_clean_up() {
}

int32_t vmware_vmdk_t::len_sector() {
    if (f_len_sector)
        return m_len_sector;
    m_len_sector = 512;
    f_len_sector = true;
    return m_len_sector;
}

std::string vmware_vmdk_t::descriptor() {
    if (f_descriptor)
        return m_descriptor;
    std::streampos _pos = m__io->pos();
    m__io->seek((start_descriptor() * _root()->len_sector()));
    m_descriptor = m__io->read_bytes((size_descriptor() * _root()->len_sector()));
    m__io->seek(_pos);
    f_descriptor = true;
    return m_descriptor;
}

std::string vmware_vmdk_t::grain_primary() {
    if (f_grain_primary)
        return m_grain_primary;
    std::streampos _pos = m__io->pos();
    m__io->seek((start_primary_grain() * _root()->len_sector()));
    m_grain_primary = m__io->read_bytes((size_grain() * _root()->len_sector()));
    m__io->seek(_pos);
    f_grain_primary = true;
    return m_grain_primary;
}

std::string vmware_vmdk_t::grain_secondary() {
    if (f_grain_secondary)
        return m_grain_secondary;
    std::streampos _pos = m__io->pos();
    m__io->seek((start_secondary_grain() * _root()->len_sector()));
    m_grain_secondary = m__io->read_bytes((size_grain() * _root()->len_sector()));
    m__io->seek(_pos);
    f_grain_secondary = true;
    return m_grain_secondary;
}

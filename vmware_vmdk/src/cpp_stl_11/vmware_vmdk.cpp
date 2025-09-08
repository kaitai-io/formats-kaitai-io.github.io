// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "vmware_vmdk.h"
#include "kaitai/exceptions.h"
const std::set<vmware_vmdk_t::compression_methods_t> vmware_vmdk_t::_values_compression_methods_t{
    vmware_vmdk_t::COMPRESSION_METHODS_NONE,
    vmware_vmdk_t::COMPRESSION_METHODS_DEFLATE,
};
bool vmware_vmdk_t::_is_defined_compression_methods_t(vmware_vmdk_t::compression_methods_t v) {
    return vmware_vmdk_t::_values_compression_methods_t.find(v) != vmware_vmdk_t::_values_compression_methods_t.end();
}

vmware_vmdk_t::vmware_vmdk_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, vmware_vmdk_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_flags = nullptr;
    f_descriptor = false;
    f_grain_primary = false;
    f_grain_secondary = false;
    f_len_sector = false;
    _read();
}

void vmware_vmdk_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x4B\x44\x4D\x56", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4B\x44\x4D\x56", 4), m_magic, m__io, std::string("/seq/0"));
    }
    m_version = m__io->read_s4le();
    m_flags = std::unique_ptr<header_flags_t>(new header_flags_t(m__io, this, m__root));
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
    _read();
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

std::string vmware_vmdk_t::descriptor() {
    if (f_descriptor)
        return m_descriptor;
    f_descriptor = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(start_descriptor() * _root()->len_sector());
    m_descriptor = m__io->read_bytes(size_descriptor() * _root()->len_sector());
    m__io->seek(_pos);
    return m_descriptor;
}

std::string vmware_vmdk_t::grain_primary() {
    if (f_grain_primary)
        return m_grain_primary;
    f_grain_primary = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(start_primary_grain() * _root()->len_sector());
    m_grain_primary = m__io->read_bytes(size_grain() * _root()->len_sector());
    m__io->seek(_pos);
    return m_grain_primary;
}

std::string vmware_vmdk_t::grain_secondary() {
    if (f_grain_secondary)
        return m_grain_secondary;
    f_grain_secondary = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(start_secondary_grain() * _root()->len_sector());
    m_grain_secondary = m__io->read_bytes(size_grain() * _root()->len_sector());
    m__io->seek(_pos);
    return m_grain_secondary;
}

int32_t vmware_vmdk_t::len_sector() {
    if (f_len_sector)
        return m_len_sector;
    f_len_sector = true;
    m_len_sector = 512;
    return m_len_sector;
}

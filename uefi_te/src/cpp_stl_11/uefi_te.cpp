// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "uefi_te.h"
#include "kaitai/exceptions.h"

uefi_te_t::uefi_te_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, uefi_te_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_te_hdr = nullptr;
    m__io__raw_te_hdr = nullptr;
    m_sections = nullptr;
    _read();
}

void uefi_te_t::_read() {
    m__raw_te_hdr = m__io->read_bytes(40);
    m__io__raw_te_hdr = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_te_hdr));
    m_te_hdr = std::unique_ptr<te_header_t>(new te_header_t(m__io__raw_te_hdr.get(), this, m__root));
    m_sections = std::unique_ptr<std::vector<std::unique_ptr<section_t>>>(new std::vector<std::unique_ptr<section_t>>());
    const int l_sections = te_hdr()->num_sections();
    for (int i = 0; i < l_sections; i++) {
        m_sections->push_back(std::move(std::unique_ptr<section_t>(new section_t(m__io, this, m__root))));
    }
}

uefi_te_t::~uefi_te_t() {
    _clean_up();
}

void uefi_te_t::_clean_up() {
}

uefi_te_t::te_header_t::te_header_t(kaitai::kstream* p__io, uefi_te_t* p__parent, uefi_te_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_data_dirs = nullptr;
    _read();
}

void uefi_te_t::te_header_t::_read() {
    m_magic = m__io->read_bytes(2);
    if (!(magic() == std::string("\x56\x5A", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x56\x5A", 2), magic(), _io(), std::string("/types/te_header/seq/0"));
    }
    m_machine = static_cast<uefi_te_t::te_header_t::machine_type_t>(m__io->read_u2le());
    m_num_sections = m__io->read_u1();
    m_subsystem = static_cast<uefi_te_t::te_header_t::subsystem_enum_t>(m__io->read_u1());
    m_stripped_size = m__io->read_u2le();
    m_entry_point_addr = m__io->read_u4le();
    m_base_of_code = m__io->read_u4le();
    m_image_base = m__io->read_u8le();
    m_data_dirs = std::unique_ptr<header_data_dirs_t>(new header_data_dirs_t(m__io, this, m__root));
}

uefi_te_t::te_header_t::~te_header_t() {
    _clean_up();
}

void uefi_te_t::te_header_t::_clean_up() {
}

uefi_te_t::header_data_dirs_t::header_data_dirs_t(kaitai::kstream* p__io, uefi_te_t::te_header_t* p__parent, uefi_te_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_base_relocation_table = nullptr;
    m_debug = nullptr;
    _read();
}

void uefi_te_t::header_data_dirs_t::_read() {
    m_base_relocation_table = std::unique_ptr<data_dir_t>(new data_dir_t(m__io, this, m__root));
    m_debug = std::unique_ptr<data_dir_t>(new data_dir_t(m__io, this, m__root));
}

uefi_te_t::header_data_dirs_t::~header_data_dirs_t() {
    _clean_up();
}

void uefi_te_t::header_data_dirs_t::_clean_up() {
}

uefi_te_t::data_dir_t::data_dir_t(kaitai::kstream* p__io, uefi_te_t::header_data_dirs_t* p__parent, uefi_te_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void uefi_te_t::data_dir_t::_read() {
    m_virtual_address = m__io->read_u4le();
    m_size = m__io->read_u4le();
}

uefi_te_t::data_dir_t::~data_dir_t() {
    _clean_up();
}

void uefi_te_t::data_dir_t::_clean_up() {
}

uefi_te_t::section_t::section_t(kaitai::kstream* p__io, uefi_te_t* p__parent, uefi_te_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_body = false;
    _read();
}

void uefi_te_t::section_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_strip_right(m__io->read_bytes(8), 0), std::string("UTF-8"));
    m_virtual_size = m__io->read_u4le();
    m_virtual_address = m__io->read_u4le();
    m_size_of_raw_data = m__io->read_u4le();
    m_pointer_to_raw_data = m__io->read_u4le();
    m_pointer_to_relocations = m__io->read_u4le();
    m_pointer_to_linenumbers = m__io->read_u4le();
    m_num_relocations = m__io->read_u2le();
    m_num_linenumbers = m__io->read_u2le();
    m_characteristics = m__io->read_u4le();
}

uefi_te_t::section_t::~section_t() {
    _clean_up();
}

void uefi_te_t::section_t::_clean_up() {
    if (f_body) {
    }
}

std::string uefi_te_t::section_t::body() {
    if (f_body)
        return m_body;
    std::streampos _pos = m__io->pos();
    m__io->seek(((pointer_to_raw_data() - _root()->te_hdr()->stripped_size()) + _root()->te_hdr()->_io()->size()));
    m_body = m__io->read_bytes(size_of_raw_data());
    m__io->seek(_pos);
    f_body = true;
    return m_body;
}

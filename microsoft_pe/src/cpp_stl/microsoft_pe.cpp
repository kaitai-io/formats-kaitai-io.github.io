// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "microsoft_pe.h"



microsoft_pe_t::microsoft_pe_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, microsoft_pe_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void microsoft_pe_t::_read() {
    m_mz1 = new mz_placeholder_t(m__io, this, m__root);
    m_mz2 = m__io->read_bytes((mz1()->header_size() - 64));
    m_pe_signature = m__io->ensure_fixed_contents(std::string("\x50\x45\x00\x00", 4));
    m_coff_hdr = new coff_header_t(m__io, this, m__root);
    m__raw_optional_hdr = m__io->read_bytes(coff_hdr()->size_of_optional_header());
    m__io__raw_optional_hdr = new kaitai::kstream(m__raw_optional_hdr);
    m_optional_hdr = new optional_header_t(m__io__raw_optional_hdr, this, m__root);
    int l_sections = coff_hdr()->number_of_sections();
    m_sections = new std::vector<section_t*>();
    m_sections->reserve(l_sections);
    for (int i = 0; i < l_sections; i++) {
        m_sections->push_back(new section_t(m__io, this, m__root));
    }
}

microsoft_pe_t::~microsoft_pe_t() {
    delete m_mz1;
    delete m_coff_hdr;
    delete m__io__raw_optional_hdr;
    delete m_optional_hdr;
    for (std::vector<section_t*>::iterator it = m_sections->begin(); it != m_sections->end(); ++it) {
        delete *it;
    }
    delete m_sections;
}

microsoft_pe_t::optional_header_windows_t::optional_header_windows_t(kaitai::kstream *p_io, microsoft_pe_t::optional_header_t* p_parent, microsoft_pe_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void microsoft_pe_t::optional_header_windows_t::_read() {
    n_image_base_32 = true;
    if (_parent()->std()->format() == PE_FORMAT_PE32) {
        n_image_base_32 = false;
        m_image_base_32 = m__io->read_u4le();
    }
    n_image_base_64 = true;
    if (_parent()->std()->format() == PE_FORMAT_PE32_PLUS) {
        n_image_base_64 = false;
        m_image_base_64 = m__io->read_u8le();
    }
    m_section_alignment = m__io->read_u4le();
    m_file_alignment = m__io->read_u4le();
    m_major_operating_system_version = m__io->read_u2le();
    m_minor_operating_system_version = m__io->read_u2le();
    m_major_image_version = m__io->read_u2le();
    m_minor_image_version = m__io->read_u2le();
    m_major_subsystem_version = m__io->read_u2le();
    m_minor_subsystem_version = m__io->read_u2le();
    m_win32_version_value = m__io->read_u4le();
    m_size_of_image = m__io->read_u4le();
    m_size_of_headers = m__io->read_u4le();
    m_check_sum = m__io->read_u4le();
    m_subsystem = static_cast<microsoft_pe_t::optional_header_windows_t::subsystem_enum_t>(m__io->read_u2le());
    m_dll_characteristics = m__io->read_u2le();
    n_size_of_stack_reserve_32 = true;
    if (_parent()->std()->format() == PE_FORMAT_PE32) {
        n_size_of_stack_reserve_32 = false;
        m_size_of_stack_reserve_32 = m__io->read_u4le();
    }
    n_size_of_stack_reserve_64 = true;
    if (_parent()->std()->format() == PE_FORMAT_PE32_PLUS) {
        n_size_of_stack_reserve_64 = false;
        m_size_of_stack_reserve_64 = m__io->read_u8le();
    }
    n_size_of_stack_commit_32 = true;
    if (_parent()->std()->format() == PE_FORMAT_PE32) {
        n_size_of_stack_commit_32 = false;
        m_size_of_stack_commit_32 = m__io->read_u4le();
    }
    n_size_of_stack_commit_64 = true;
    if (_parent()->std()->format() == PE_FORMAT_PE32_PLUS) {
        n_size_of_stack_commit_64 = false;
        m_size_of_stack_commit_64 = m__io->read_u8le();
    }
    n_size_of_heap_reserve_32 = true;
    if (_parent()->std()->format() == PE_FORMAT_PE32) {
        n_size_of_heap_reserve_32 = false;
        m_size_of_heap_reserve_32 = m__io->read_u4le();
    }
    n_size_of_heap_reserve_64 = true;
    if (_parent()->std()->format() == PE_FORMAT_PE32_PLUS) {
        n_size_of_heap_reserve_64 = false;
        m_size_of_heap_reserve_64 = m__io->read_u8le();
    }
    n_size_of_heap_commit_32 = true;
    if (_parent()->std()->format() == PE_FORMAT_PE32) {
        n_size_of_heap_commit_32 = false;
        m_size_of_heap_commit_32 = m__io->read_u4le();
    }
    n_size_of_heap_commit_64 = true;
    if (_parent()->std()->format() == PE_FORMAT_PE32_PLUS) {
        n_size_of_heap_commit_64 = false;
        m_size_of_heap_commit_64 = m__io->read_u8le();
    }
    m_loader_flags = m__io->read_u4le();
    m_number_of_rva_and_sizes = m__io->read_u4le();
}

microsoft_pe_t::optional_header_windows_t::~optional_header_windows_t() {
}

microsoft_pe_t::optional_header_data_dirs_t::optional_header_data_dirs_t(kaitai::kstream *p_io, microsoft_pe_t::optional_header_t* p_parent, microsoft_pe_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void microsoft_pe_t::optional_header_data_dirs_t::_read() {
    m_export_table = new data_dir_t(m__io, this, m__root);
    m_import_table = new data_dir_t(m__io, this, m__root);
    m_resource_table = new data_dir_t(m__io, this, m__root);
    m_exception_table = new data_dir_t(m__io, this, m__root);
    m_certificate_table = new data_dir_t(m__io, this, m__root);
    m_base_relocation_table = new data_dir_t(m__io, this, m__root);
    m_debug = new data_dir_t(m__io, this, m__root);
    m_architecture = new data_dir_t(m__io, this, m__root);
    m_global_ptr = new data_dir_t(m__io, this, m__root);
    m_tls_table = new data_dir_t(m__io, this, m__root);
    m_load_config_table = new data_dir_t(m__io, this, m__root);
    m_bound_import = new data_dir_t(m__io, this, m__root);
    m_iat = new data_dir_t(m__io, this, m__root);
    m_delay_import_descriptor = new data_dir_t(m__io, this, m__root);
    m_clr_runtime_header = new data_dir_t(m__io, this, m__root);
}

microsoft_pe_t::optional_header_data_dirs_t::~optional_header_data_dirs_t() {
    delete m_export_table;
    delete m_import_table;
    delete m_resource_table;
    delete m_exception_table;
    delete m_certificate_table;
    delete m_base_relocation_table;
    delete m_debug;
    delete m_architecture;
    delete m_global_ptr;
    delete m_tls_table;
    delete m_load_config_table;
    delete m_bound_import;
    delete m_iat;
    delete m_delay_import_descriptor;
    delete m_clr_runtime_header;
}

microsoft_pe_t::data_dir_t::data_dir_t(kaitai::kstream *p_io, microsoft_pe_t::optional_header_data_dirs_t* p_parent, microsoft_pe_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void microsoft_pe_t::data_dir_t::_read() {
    m_virtual_address = m__io->read_u4le();
    m_size = m__io->read_u4le();
}

microsoft_pe_t::data_dir_t::~data_dir_t() {
}

microsoft_pe_t::optional_header_t::optional_header_t(kaitai::kstream *p_io, microsoft_pe_t* p_parent, microsoft_pe_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void microsoft_pe_t::optional_header_t::_read() {
    m_std = new optional_header_std_t(m__io, this, m__root);
    m_windows = new optional_header_windows_t(m__io, this, m__root);
    m_data_dirs = new optional_header_data_dirs_t(m__io, this, m__root);
}

microsoft_pe_t::optional_header_t::~optional_header_t() {
    delete m_std;
    delete m_windows;
    delete m_data_dirs;
}

microsoft_pe_t::section_t::section_t(kaitai::kstream *p_io, microsoft_pe_t* p_parent, microsoft_pe_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_body = false;
    _read();
}

void microsoft_pe_t::section_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_strip_right(m__io->read_bytes(8), 0), std::string("UTF-8"));
    m_virtual_size = m__io->read_u4le();
    m_virtual_address = m__io->read_u4le();
    m_size_of_raw_data = m__io->read_u4le();
    m_pointer_to_raw_data = m__io->read_u4le();
    m_pointer_to_relocations = m__io->read_u4le();
    m_pointer_to_linenumbers = m__io->read_u4le();
    m_number_of_relocations = m__io->read_u2le();
    m_number_of_linenumbers = m__io->read_u2le();
    m_characteristics = m__io->read_u4le();
}

microsoft_pe_t::section_t::~section_t() {
}

std::string microsoft_pe_t::section_t::body() {
    if (f_body)
        return m_body;
    std::streampos _pos = m__io->pos();
    m__io->seek(pointer_to_raw_data());
    m_body = m__io->read_bytes(size_of_raw_data());
    m__io->seek(_pos);
    f_body = true;
    return m_body;
}

microsoft_pe_t::mz_placeholder_t::mz_placeholder_t(kaitai::kstream *p_io, microsoft_pe_t* p_parent, microsoft_pe_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void microsoft_pe_t::mz_placeholder_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\x4D\x5A", 2));
    m_data1 = m__io->read_bytes(58);
    m_header_size = m__io->read_u4le();
}

microsoft_pe_t::mz_placeholder_t::~mz_placeholder_t() {
}

microsoft_pe_t::optional_header_std_t::optional_header_std_t(kaitai::kstream *p_io, microsoft_pe_t::optional_header_t* p_parent, microsoft_pe_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void microsoft_pe_t::optional_header_std_t::_read() {
    m_format = static_cast<microsoft_pe_t::pe_format_t>(m__io->read_u2le());
    m_major_linker_version = m__io->read_u1();
    m_minor_linker_version = m__io->read_u1();
    m_size_of_code = m__io->read_u4le();
    m_size_of_initialized_data = m__io->read_u4le();
    m_size_of_uninitialized_data = m__io->read_u4le();
    m_address_of_entry_point = m__io->read_u4le();
    m_base_of_code = m__io->read_u4le();
    n_base_of_data = true;
    if (format() == PE_FORMAT_PE32) {
        n_base_of_data = false;
        m_base_of_data = m__io->read_u4le();
    }
}

microsoft_pe_t::optional_header_std_t::~optional_header_std_t() {
}

microsoft_pe_t::coff_header_t::coff_header_t(kaitai::kstream *p_io, microsoft_pe_t* p_parent, microsoft_pe_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void microsoft_pe_t::coff_header_t::_read() {
    m_machine = static_cast<microsoft_pe_t::coff_header_t::machine_type_t>(m__io->read_u2le());
    m_number_of_sections = m__io->read_u2le();
    m_time_date_stamp = m__io->read_u4le();
    m_pointer_to_symbol_table = m__io->read_u4le();
    m_number_of_symbols = m__io->read_u4le();
    m_size_of_optional_header = m__io->read_u2le();
    m_characteristics = m__io->read_u2le();
}

microsoft_pe_t::coff_header_t::~coff_header_t() {
}

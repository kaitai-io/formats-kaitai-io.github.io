// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "microsoft_pe.h"
#include "kaitai/exceptions.h"
std::set<microsoft_pe_t::pe_format_t> microsoft_pe_t::_build_values_pe_format_t() {
    std::set<microsoft_pe_t::pe_format_t> _t;
    _t.insert(microsoft_pe_t::PE_FORMAT_ROM_IMAGE);
    _t.insert(microsoft_pe_t::PE_FORMAT_PE32);
    _t.insert(microsoft_pe_t::PE_FORMAT_PE32_PLUS);
    return _t;
}
const std::set<microsoft_pe_t::pe_format_t> microsoft_pe_t::_values_pe_format_t = microsoft_pe_t::_build_values_pe_format_t();
bool microsoft_pe_t::_is_defined_pe_format_t(microsoft_pe_t::pe_format_t v) {
    return microsoft_pe_t::_values_pe_format_t.find(v) != microsoft_pe_t::_values_pe_format_t.end();
}

microsoft_pe_t::microsoft_pe_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, microsoft_pe_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_mz = 0;
    m_pe = 0;
    f_pe = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void microsoft_pe_t::_read() {
    m_mz = new mz_placeholder_t(m__io, this, m__root);
}

microsoft_pe_t::~microsoft_pe_t() {
    _clean_up();
}

void microsoft_pe_t::_clean_up() {
    if (m_mz) {
        delete m_mz; m_mz = 0;
    }
    if (f_pe) {
        if (m_pe) {
            delete m_pe; m_pe = 0;
        }
    }
}

microsoft_pe_t::annoyingstring_t::annoyingstring_t(kaitai::kstream* p__io, microsoft_pe_t::coff_symbol_t* p__parent, microsoft_pe_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_name = false;
    f_name_from_offset = false;
    f_name_from_short = false;
    f_name_offset = false;
    f_name_zeroes = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void microsoft_pe_t::annoyingstring_t::_read() {
}

microsoft_pe_t::annoyingstring_t::~annoyingstring_t() {
    _clean_up();
}

void microsoft_pe_t::annoyingstring_t::_clean_up() {
    if (f_name_from_offset && !n_name_from_offset) {
    }
    if (f_name_from_short && !n_name_from_short) {
    }
    if (f_name_offset) {
    }
    if (f_name_zeroes) {
    }
}

std::string microsoft_pe_t::annoyingstring_t::name() {
    if (f_name)
        return m_name;
    f_name = true;
    m_name = ((name_zeroes() == 0) ? (name_from_offset()) : (name_from_short()));
    return m_name;
}

std::string microsoft_pe_t::annoyingstring_t::name_from_offset() {
    if (f_name_from_offset)
        return m_name_from_offset;
    f_name_from_offset = true;
    n_name_from_offset = true;
    if (name_zeroes() == 0) {
        n_name_from_offset = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(((name_zeroes() == 0) ? (_parent()->_parent()->symbol_name_table_offset() + name_offset()) : (0)));
        m_name_from_offset = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, false), "ASCII");
        io->seek(_pos);
    }
    return m_name_from_offset;
}

std::string microsoft_pe_t::annoyingstring_t::name_from_short() {
    if (f_name_from_short)
        return m_name_from_short;
    f_name_from_short = true;
    n_name_from_short = true;
    if (name_zeroes() != 0) {
        n_name_from_short = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(0);
        m_name_from_short = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, false), "ASCII");
        m__io->seek(_pos);
    }
    return m_name_from_short;
}

uint32_t microsoft_pe_t::annoyingstring_t::name_offset() {
    if (f_name_offset)
        return m_name_offset;
    f_name_offset = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(4);
    m_name_offset = m__io->read_u4le();
    m__io->seek(_pos);
    return m_name_offset;
}

uint32_t microsoft_pe_t::annoyingstring_t::name_zeroes() {
    if (f_name_zeroes)
        return m_name_zeroes;
    f_name_zeroes = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_name_zeroes = m__io->read_u4le();
    m__io->seek(_pos);
    return m_name_zeroes;
}
std::set<microsoft_pe_t::certificate_entry_t::certificate_revision_t> microsoft_pe_t::certificate_entry_t::_build_values_certificate_revision_t() {
    std::set<microsoft_pe_t::certificate_entry_t::certificate_revision_t> _t;
    _t.insert(microsoft_pe_t::certificate_entry_t::CERTIFICATE_REVISION_REVISION_1_0);
    _t.insert(microsoft_pe_t::certificate_entry_t::CERTIFICATE_REVISION_REVISION_2_0);
    return _t;
}
const std::set<microsoft_pe_t::certificate_entry_t::certificate_revision_t> microsoft_pe_t::certificate_entry_t::_values_certificate_revision_t = microsoft_pe_t::certificate_entry_t::_build_values_certificate_revision_t();
bool microsoft_pe_t::certificate_entry_t::_is_defined_certificate_revision_t(microsoft_pe_t::certificate_entry_t::certificate_revision_t v) {
    return microsoft_pe_t::certificate_entry_t::_values_certificate_revision_t.find(v) != microsoft_pe_t::certificate_entry_t::_values_certificate_revision_t.end();
}
std::set<microsoft_pe_t::certificate_entry_t::certificate_type_enum_t> microsoft_pe_t::certificate_entry_t::_build_values_certificate_type_enum_t() {
    std::set<microsoft_pe_t::certificate_entry_t::certificate_type_enum_t> _t;
    _t.insert(microsoft_pe_t::certificate_entry_t::CERTIFICATE_TYPE_ENUM_X509);
    _t.insert(microsoft_pe_t::certificate_entry_t::CERTIFICATE_TYPE_ENUM_PKCS_SIGNED_DATA);
    _t.insert(microsoft_pe_t::certificate_entry_t::CERTIFICATE_TYPE_ENUM_RESERVED_1);
    _t.insert(microsoft_pe_t::certificate_entry_t::CERTIFICATE_TYPE_ENUM_TS_STACK_SIGNED);
    return _t;
}
const std::set<microsoft_pe_t::certificate_entry_t::certificate_type_enum_t> microsoft_pe_t::certificate_entry_t::_values_certificate_type_enum_t = microsoft_pe_t::certificate_entry_t::_build_values_certificate_type_enum_t();
bool microsoft_pe_t::certificate_entry_t::_is_defined_certificate_type_enum_t(microsoft_pe_t::certificate_entry_t::certificate_type_enum_t v) {
    return microsoft_pe_t::certificate_entry_t::_values_certificate_type_enum_t.find(v) != microsoft_pe_t::certificate_entry_t::_values_certificate_type_enum_t.end();
}

microsoft_pe_t::certificate_entry_t::certificate_entry_t(kaitai::kstream* p__io, microsoft_pe_t::certificate_table_t* p__parent, microsoft_pe_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void microsoft_pe_t::certificate_entry_t::_read() {
    m_length = m__io->read_u4le();
    m_revision = static_cast<microsoft_pe_t::certificate_entry_t::certificate_revision_t>(m__io->read_u2le());
    m_certificate_type = static_cast<microsoft_pe_t::certificate_entry_t::certificate_type_enum_t>(m__io->read_u2le());
    m_certificate_bytes = m__io->read_bytes(length() - 8);
}

microsoft_pe_t::certificate_entry_t::~certificate_entry_t() {
    _clean_up();
}

void microsoft_pe_t::certificate_entry_t::_clean_up() {
}

microsoft_pe_t::certificate_table_t::certificate_table_t(kaitai::kstream* p__io, microsoft_pe_t::pe_header_t* p__parent, microsoft_pe_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_items = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void microsoft_pe_t::certificate_table_t::_read() {
    m_items = new std::vector<certificate_entry_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_items->push_back(new certificate_entry_t(m__io, this, m__root));
            i++;
        }
    }
}

microsoft_pe_t::certificate_table_t::~certificate_table_t() {
    _clean_up();
}

void microsoft_pe_t::certificate_table_t::_clean_up() {
    if (m_items) {
        for (std::vector<certificate_entry_t*>::iterator it = m_items->begin(); it != m_items->end(); ++it) {
            delete *it;
        }
        delete m_items; m_items = 0;
    }
}
std::set<microsoft_pe_t::coff_header_t::machine_type_t> microsoft_pe_t::coff_header_t::_build_values_machine_type_t() {
    std::set<microsoft_pe_t::coff_header_t::machine_type_t> _t;
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_UNKNOWN);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_I386);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_R4000);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_WCE_MIPS_V2);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_ALPHA);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_SH3);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_SH3_DSP);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_SH4);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_SH5);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_ARM);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_THUMB);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_ARM_NT);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_AM33);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_POWERPC);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_POWERPC_FP);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_IA64);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_MIPS16);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_ALPHA64_OR_AXP64);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_MIPS_FPU);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_MIPS16_FPU);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_EBC);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_RISCV32);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_RISCV64);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_RISCV128);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_LOONGARCH32);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_LOONGARCH64);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_AMD64);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_M32R);
    _t.insert(microsoft_pe_t::coff_header_t::MACHINE_TYPE_ARM64);
    return _t;
}
const std::set<microsoft_pe_t::coff_header_t::machine_type_t> microsoft_pe_t::coff_header_t::_values_machine_type_t = microsoft_pe_t::coff_header_t::_build_values_machine_type_t();
bool microsoft_pe_t::coff_header_t::_is_defined_machine_type_t(microsoft_pe_t::coff_header_t::machine_type_t v) {
    return microsoft_pe_t::coff_header_t::_values_machine_type_t.find(v) != microsoft_pe_t::coff_header_t::_values_machine_type_t.end();
}

microsoft_pe_t::coff_header_t::coff_header_t(kaitai::kstream* p__io, microsoft_pe_t::pe_header_t* p__parent, microsoft_pe_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_symbol_table = 0;
    f_symbol_name_table_offset = false;
    f_symbol_name_table_size = false;
    f_symbol_table = false;
    f_symbol_table_size = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    _clean_up();
}

void microsoft_pe_t::coff_header_t::_clean_up() {
    if (f_symbol_name_table_size) {
    }
    if (f_symbol_table) {
        if (m_symbol_table) {
            for (std::vector<coff_symbol_t*>::iterator it = m_symbol_table->begin(); it != m_symbol_table->end(); ++it) {
                delete *it;
            }
            delete m_symbol_table; m_symbol_table = 0;
        }
    }
}

int32_t microsoft_pe_t::coff_header_t::symbol_name_table_offset() {
    if (f_symbol_name_table_offset)
        return m_symbol_name_table_offset;
    f_symbol_name_table_offset = true;
    m_symbol_name_table_offset = pointer_to_symbol_table() + symbol_table_size();
    return m_symbol_name_table_offset;
}

uint32_t microsoft_pe_t::coff_header_t::symbol_name_table_size() {
    if (f_symbol_name_table_size)
        return m_symbol_name_table_size;
    f_symbol_name_table_size = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(symbol_name_table_offset());
    m_symbol_name_table_size = m__io->read_u4le();
    m__io->seek(_pos);
    return m_symbol_name_table_size;
}

std::vector<microsoft_pe_t::coff_symbol_t*>* microsoft_pe_t::coff_header_t::symbol_table() {
    if (f_symbol_table)
        return m_symbol_table;
    f_symbol_table = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(pointer_to_symbol_table());
    m_symbol_table = new std::vector<coff_symbol_t*>();
    const int l_symbol_table = number_of_symbols();
    for (int i = 0; i < l_symbol_table; i++) {
        m_symbol_table->push_back(new coff_symbol_t(m__io, this, m__root));
    }
    m__io->seek(_pos);
    return m_symbol_table;
}

int32_t microsoft_pe_t::coff_header_t::symbol_table_size() {
    if (f_symbol_table_size)
        return m_symbol_table_size;
    f_symbol_table_size = true;
    m_symbol_table_size = number_of_symbols() * 18;
    return m_symbol_table_size;
}

microsoft_pe_t::coff_symbol_t::coff_symbol_t(kaitai::kstream* p__io, microsoft_pe_t::coff_header_t* p__parent, microsoft_pe_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name_annoying = 0;
    m__io__raw_name_annoying = 0;
    f_data = false;
    f_section = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void microsoft_pe_t::coff_symbol_t::_read() {
    m__raw_name_annoying = m__io->read_bytes(8);
    m__io__raw_name_annoying = new kaitai::kstream(m__raw_name_annoying);
    m_name_annoying = new annoyingstring_t(m__io__raw_name_annoying, this, m__root);
    m_value = m__io->read_u4le();
    m_section_number = m__io->read_u2le();
    m_type = m__io->read_u2le();
    m_storage_class = m__io->read_u1();
    m_number_of_aux_symbols = m__io->read_u1();
}

microsoft_pe_t::coff_symbol_t::~coff_symbol_t() {
    _clean_up();
}

void microsoft_pe_t::coff_symbol_t::_clean_up() {
    if (m__io__raw_name_annoying) {
        delete m__io__raw_name_annoying; m__io__raw_name_annoying = 0;
    }
    if (m_name_annoying) {
        delete m_name_annoying; m_name_annoying = 0;
    }
    if (f_data) {
    }
}

std::string microsoft_pe_t::coff_symbol_t::data() {
    if (f_data)
        return m_data;
    f_data = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(section()->pointer_to_raw_data() + value());
    m_data = m__io->read_bytes(1);
    m__io->seek(_pos);
    return m_data;
}

microsoft_pe_t::section_t* microsoft_pe_t::coff_symbol_t::section() {
    if (f_section)
        return m_section;
    f_section = true;
    m_section = _root()->pe()->sections()->at(section_number() - 1);
    return m_section;
}

microsoft_pe_t::data_dir_t::data_dir_t(kaitai::kstream* p__io, microsoft_pe_t::optional_header_data_dirs_t* p__parent, microsoft_pe_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void microsoft_pe_t::data_dir_t::_read() {
    m_virtual_address = m__io->read_u4le();
    m_size = m__io->read_u4le();
}

microsoft_pe_t::data_dir_t::~data_dir_t() {
    _clean_up();
}

void microsoft_pe_t::data_dir_t::_clean_up() {
}

microsoft_pe_t::mz_placeholder_t::mz_placeholder_t(kaitai::kstream* p__io, microsoft_pe_t* p__parent, microsoft_pe_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void microsoft_pe_t::mz_placeholder_t::_read() {
    m_magic = m__io->read_bytes(2);
    if (!(m_magic == std::string("\x4D\x5A", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x4D\x5A", 2), m_magic, m__io, std::string("/types/mz_placeholder/seq/0"));
    }
    m_data1 = m__io->read_bytes(58);
    m_ofs_pe = m__io->read_u4le();
}

microsoft_pe_t::mz_placeholder_t::~mz_placeholder_t() {
    _clean_up();
}

void microsoft_pe_t::mz_placeholder_t::_clean_up() {
}

microsoft_pe_t::optional_header_t::optional_header_t(kaitai::kstream* p__io, microsoft_pe_t::pe_header_t* p__parent, microsoft_pe_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_std = 0;
    m_windows = 0;
    m_data_dirs = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void microsoft_pe_t::optional_header_t::_read() {
    m_std = new optional_header_std_t(m__io, this, m__root);
    m_windows = new optional_header_windows_t(m__io, this, m__root);
    m_data_dirs = new optional_header_data_dirs_t(m__io, this, m__root);
}

microsoft_pe_t::optional_header_t::~optional_header_t() {
    _clean_up();
}

void microsoft_pe_t::optional_header_t::_clean_up() {
    if (m_std) {
        delete m_std; m_std = 0;
    }
    if (m_windows) {
        delete m_windows; m_windows = 0;
    }
    if (m_data_dirs) {
        delete m_data_dirs; m_data_dirs = 0;
    }
}

microsoft_pe_t::optional_header_data_dirs_t::optional_header_data_dirs_t(kaitai::kstream* p__io, microsoft_pe_t::optional_header_t* p__parent, microsoft_pe_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_export_table = 0;
    m_import_table = 0;
    m_resource_table = 0;
    m_exception_table = 0;
    m_certificate_table = 0;
    m_base_relocation_table = 0;
    m_debug = 0;
    m_architecture = 0;
    m_global_ptr = 0;
    m_tls_table = 0;
    m_load_config_table = 0;
    m_bound_import = 0;
    m_iat = 0;
    m_delay_import_descriptor = 0;
    m_clr_runtime_header = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    _clean_up();
}

void microsoft_pe_t::optional_header_data_dirs_t::_clean_up() {
    if (m_export_table) {
        delete m_export_table; m_export_table = 0;
    }
    if (m_import_table) {
        delete m_import_table; m_import_table = 0;
    }
    if (m_resource_table) {
        delete m_resource_table; m_resource_table = 0;
    }
    if (m_exception_table) {
        delete m_exception_table; m_exception_table = 0;
    }
    if (m_certificate_table) {
        delete m_certificate_table; m_certificate_table = 0;
    }
    if (m_base_relocation_table) {
        delete m_base_relocation_table; m_base_relocation_table = 0;
    }
    if (m_debug) {
        delete m_debug; m_debug = 0;
    }
    if (m_architecture) {
        delete m_architecture; m_architecture = 0;
    }
    if (m_global_ptr) {
        delete m_global_ptr; m_global_ptr = 0;
    }
    if (m_tls_table) {
        delete m_tls_table; m_tls_table = 0;
    }
    if (m_load_config_table) {
        delete m_load_config_table; m_load_config_table = 0;
    }
    if (m_bound_import) {
        delete m_bound_import; m_bound_import = 0;
    }
    if (m_iat) {
        delete m_iat; m_iat = 0;
    }
    if (m_delay_import_descriptor) {
        delete m_delay_import_descriptor; m_delay_import_descriptor = 0;
    }
    if (m_clr_runtime_header) {
        delete m_clr_runtime_header; m_clr_runtime_header = 0;
    }
}

microsoft_pe_t::optional_header_std_t::optional_header_std_t(kaitai::kstream* p__io, microsoft_pe_t::optional_header_t* p__parent, microsoft_pe_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    if (format() == microsoft_pe_t::PE_FORMAT_PE32) {
        n_base_of_data = false;
        m_base_of_data = m__io->read_u4le();
    }
}

microsoft_pe_t::optional_header_std_t::~optional_header_std_t() {
    _clean_up();
}

void microsoft_pe_t::optional_header_std_t::_clean_up() {
    if (!n_base_of_data) {
    }
}
std::set<microsoft_pe_t::optional_header_windows_t::subsystem_enum_t> microsoft_pe_t::optional_header_windows_t::_build_values_subsystem_enum_t() {
    std::set<microsoft_pe_t::optional_header_windows_t::subsystem_enum_t> _t;
    _t.insert(microsoft_pe_t::optional_header_windows_t::SUBSYSTEM_ENUM_UNKNOWN);
    _t.insert(microsoft_pe_t::optional_header_windows_t::SUBSYSTEM_ENUM_NATIVE);
    _t.insert(microsoft_pe_t::optional_header_windows_t::SUBSYSTEM_ENUM_WINDOWS_GUI);
    _t.insert(microsoft_pe_t::optional_header_windows_t::SUBSYSTEM_ENUM_WINDOWS_CUI);
    _t.insert(microsoft_pe_t::optional_header_windows_t::SUBSYSTEM_ENUM_POSIX_CUI);
    _t.insert(microsoft_pe_t::optional_header_windows_t::SUBSYSTEM_ENUM_WINDOWS_CE_GUI);
    _t.insert(microsoft_pe_t::optional_header_windows_t::SUBSYSTEM_ENUM_EFI_APPLICATION);
    _t.insert(microsoft_pe_t::optional_header_windows_t::SUBSYSTEM_ENUM_EFI_BOOT_SERVICE_DRIVER);
    _t.insert(microsoft_pe_t::optional_header_windows_t::SUBSYSTEM_ENUM_EFI_RUNTIME_DRIVER);
    _t.insert(microsoft_pe_t::optional_header_windows_t::SUBSYSTEM_ENUM_EFI_ROM);
    _t.insert(microsoft_pe_t::optional_header_windows_t::SUBSYSTEM_ENUM_XBOX);
    _t.insert(microsoft_pe_t::optional_header_windows_t::SUBSYSTEM_ENUM_WINDOWS_BOOT_APPLICATION);
    return _t;
}
const std::set<microsoft_pe_t::optional_header_windows_t::subsystem_enum_t> microsoft_pe_t::optional_header_windows_t::_values_subsystem_enum_t = microsoft_pe_t::optional_header_windows_t::_build_values_subsystem_enum_t();
bool microsoft_pe_t::optional_header_windows_t::_is_defined_subsystem_enum_t(microsoft_pe_t::optional_header_windows_t::subsystem_enum_t v) {
    return microsoft_pe_t::optional_header_windows_t::_values_subsystem_enum_t.find(v) != microsoft_pe_t::optional_header_windows_t::_values_subsystem_enum_t.end();
}

microsoft_pe_t::optional_header_windows_t::optional_header_windows_t(kaitai::kstream* p__io, microsoft_pe_t::optional_header_t* p__parent, microsoft_pe_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void microsoft_pe_t::optional_header_windows_t::_read() {
    n_image_base_32 = true;
    if (_parent()->std()->format() == microsoft_pe_t::PE_FORMAT_PE32) {
        n_image_base_32 = false;
        m_image_base_32 = m__io->read_u4le();
    }
    n_image_base_64 = true;
    if (_parent()->std()->format() == microsoft_pe_t::PE_FORMAT_PE32_PLUS) {
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
    if (_parent()->std()->format() == microsoft_pe_t::PE_FORMAT_PE32) {
        n_size_of_stack_reserve_32 = false;
        m_size_of_stack_reserve_32 = m__io->read_u4le();
    }
    n_size_of_stack_reserve_64 = true;
    if (_parent()->std()->format() == microsoft_pe_t::PE_FORMAT_PE32_PLUS) {
        n_size_of_stack_reserve_64 = false;
        m_size_of_stack_reserve_64 = m__io->read_u8le();
    }
    n_size_of_stack_commit_32 = true;
    if (_parent()->std()->format() == microsoft_pe_t::PE_FORMAT_PE32) {
        n_size_of_stack_commit_32 = false;
        m_size_of_stack_commit_32 = m__io->read_u4le();
    }
    n_size_of_stack_commit_64 = true;
    if (_parent()->std()->format() == microsoft_pe_t::PE_FORMAT_PE32_PLUS) {
        n_size_of_stack_commit_64 = false;
        m_size_of_stack_commit_64 = m__io->read_u8le();
    }
    n_size_of_heap_reserve_32 = true;
    if (_parent()->std()->format() == microsoft_pe_t::PE_FORMAT_PE32) {
        n_size_of_heap_reserve_32 = false;
        m_size_of_heap_reserve_32 = m__io->read_u4le();
    }
    n_size_of_heap_reserve_64 = true;
    if (_parent()->std()->format() == microsoft_pe_t::PE_FORMAT_PE32_PLUS) {
        n_size_of_heap_reserve_64 = false;
        m_size_of_heap_reserve_64 = m__io->read_u8le();
    }
    n_size_of_heap_commit_32 = true;
    if (_parent()->std()->format() == microsoft_pe_t::PE_FORMAT_PE32) {
        n_size_of_heap_commit_32 = false;
        m_size_of_heap_commit_32 = m__io->read_u4le();
    }
    n_size_of_heap_commit_64 = true;
    if (_parent()->std()->format() == microsoft_pe_t::PE_FORMAT_PE32_PLUS) {
        n_size_of_heap_commit_64 = false;
        m_size_of_heap_commit_64 = m__io->read_u8le();
    }
    m_loader_flags = m__io->read_u4le();
    m_number_of_rva_and_sizes = m__io->read_u4le();
}

microsoft_pe_t::optional_header_windows_t::~optional_header_windows_t() {
    _clean_up();
}

void microsoft_pe_t::optional_header_windows_t::_clean_up() {
    if (!n_image_base_32) {
    }
    if (!n_image_base_64) {
    }
    if (!n_size_of_stack_reserve_32) {
    }
    if (!n_size_of_stack_reserve_64) {
    }
    if (!n_size_of_stack_commit_32) {
    }
    if (!n_size_of_stack_commit_64) {
    }
    if (!n_size_of_heap_reserve_32) {
    }
    if (!n_size_of_heap_reserve_64) {
    }
    if (!n_size_of_heap_commit_32) {
    }
    if (!n_size_of_heap_commit_64) {
    }
}

microsoft_pe_t::pe_header_t::pe_header_t(kaitai::kstream* p__io, microsoft_pe_t* p__parent, microsoft_pe_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_coff_hdr = 0;
    m_optional_hdr = 0;
    m__io__raw_optional_hdr = 0;
    m_sections = 0;
    m_certificate_table = 0;
    m__io__raw_certificate_table = 0;
    f_certificate_table = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void microsoft_pe_t::pe_header_t::_read() {
    m_pe_signature = m__io->read_bytes(4);
    if (!(m_pe_signature == std::string("\x50\x45\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x50\x45\x00\x00", 4), m_pe_signature, m__io, std::string("/types/pe_header/seq/0"));
    }
    m_coff_hdr = new coff_header_t(m__io, this, m__root);
    m__raw_optional_hdr = m__io->read_bytes(coff_hdr()->size_of_optional_header());
    m__io__raw_optional_hdr = new kaitai::kstream(m__raw_optional_hdr);
    m_optional_hdr = new optional_header_t(m__io__raw_optional_hdr, this, m__root);
    m_sections = new std::vector<section_t*>();
    const int l_sections = coff_hdr()->number_of_sections();
    for (int i = 0; i < l_sections; i++) {
        m_sections->push_back(new section_t(m__io, this, m__root));
    }
}

microsoft_pe_t::pe_header_t::~pe_header_t() {
    _clean_up();
}

void microsoft_pe_t::pe_header_t::_clean_up() {
    if (m_coff_hdr) {
        delete m_coff_hdr; m_coff_hdr = 0;
    }
    if (m__io__raw_optional_hdr) {
        delete m__io__raw_optional_hdr; m__io__raw_optional_hdr = 0;
    }
    if (m_optional_hdr) {
        delete m_optional_hdr; m_optional_hdr = 0;
    }
    if (m_sections) {
        for (std::vector<section_t*>::iterator it = m_sections->begin(); it != m_sections->end(); ++it) {
            delete *it;
        }
        delete m_sections; m_sections = 0;
    }
    if (f_certificate_table && !n_certificate_table) {
        if (m__io__raw_certificate_table) {
            delete m__io__raw_certificate_table; m__io__raw_certificate_table = 0;
        }
        if (m_certificate_table) {
            delete m_certificate_table; m_certificate_table = 0;
        }
    }
}

microsoft_pe_t::certificate_table_t* microsoft_pe_t::pe_header_t::certificate_table() {
    if (f_certificate_table)
        return m_certificate_table;
    f_certificate_table = true;
    n_certificate_table = true;
    if (optional_hdr()->data_dirs()->certificate_table()->virtual_address() != 0) {
        n_certificate_table = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(optional_hdr()->data_dirs()->certificate_table()->virtual_address());
        m__raw_certificate_table = m__io->read_bytes(optional_hdr()->data_dirs()->certificate_table()->size());
        m__io__raw_certificate_table = new kaitai::kstream(m__raw_certificate_table);
        m_certificate_table = new certificate_table_t(m__io__raw_certificate_table, this, m__root);
        m__io->seek(_pos);
    }
    return m_certificate_table;
}

microsoft_pe_t::section_t::section_t(kaitai::kstream* p__io, microsoft_pe_t::pe_header_t* p__parent, microsoft_pe_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_body = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void microsoft_pe_t::section_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_strip_right(m__io->read_bytes(8), 0), "UTF-8");
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
    _clean_up();
}

void microsoft_pe_t::section_t::_clean_up() {
    if (f_body) {
    }
}

std::string microsoft_pe_t::section_t::body() {
    if (f_body)
        return m_body;
    f_body = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(pointer_to_raw_data());
    m_body = m__io->read_bytes(size_of_raw_data());
    m__io->seek(_pos);
    return m_body;
}

microsoft_pe_t::pe_header_t* microsoft_pe_t::pe() {
    if (f_pe)
        return m_pe;
    f_pe = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(mz()->ofs_pe());
    m_pe = new pe_header_t(m__io, this, m__root);
    m__io->seek(_pos);
    return m_pe;
}

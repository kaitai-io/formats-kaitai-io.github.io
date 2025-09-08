// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "uefi_te.h"
#include "kaitai/exceptions.h"

uefi_te_t::uefi_te_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, uefi_te_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_te_hdr = 0;
    m__io__raw_te_hdr = 0;
    m_sections = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void uefi_te_t::_read() {
    m__raw_te_hdr = m__io->read_bytes(40);
    m__io__raw_te_hdr = new kaitai::kstream(m__raw_te_hdr);
    m_te_hdr = new te_header_t(m__io__raw_te_hdr, this, m__root);
    m_sections = new std::vector<section_t*>();
    const int l_sections = te_hdr()->num_sections();
    for (int i = 0; i < l_sections; i++) {
        m_sections->push_back(new section_t(m__io, this, m__root));
    }
}

uefi_te_t::~uefi_te_t() {
    _clean_up();
}

void uefi_te_t::_clean_up() {
    if (m__io__raw_te_hdr) {
        delete m__io__raw_te_hdr; m__io__raw_te_hdr = 0;
    }
    if (m_te_hdr) {
        delete m_te_hdr; m_te_hdr = 0;
    }
    if (m_sections) {
        for (std::vector<section_t*>::iterator it = m_sections->begin(); it != m_sections->end(); ++it) {
            delete *it;
        }
        delete m_sections; m_sections = 0;
    }
}

uefi_te_t::data_dir_t::data_dir_t(kaitai::kstream* p__io, uefi_te_t::header_data_dirs_t* p__parent, uefi_te_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

uefi_te_t::header_data_dirs_t::header_data_dirs_t(kaitai::kstream* p__io, uefi_te_t::te_header_t* p__parent, uefi_te_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_base_relocation_table = 0;
    m_debug = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void uefi_te_t::header_data_dirs_t::_read() {
    m_base_relocation_table = new data_dir_t(m__io, this, m__root);
    m_debug = new data_dir_t(m__io, this, m__root);
}

uefi_te_t::header_data_dirs_t::~header_data_dirs_t() {
    _clean_up();
}

void uefi_te_t::header_data_dirs_t::_clean_up() {
    if (m_base_relocation_table) {
        delete m_base_relocation_table; m_base_relocation_table = 0;
    }
    if (m_debug) {
        delete m_debug; m_debug = 0;
    }
}

uefi_te_t::section_t::section_t(kaitai::kstream* p__io, uefi_te_t* p__parent, uefi_te_t* p__root) : kaitai::kstruct(p__io) {
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

void uefi_te_t::section_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_strip_right(m__io->read_bytes(8), 0), "UTF-8");
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
    f_body = true;
    std::streampos _pos = m__io->pos();
    m__io->seek((pointer_to_raw_data() - _root()->te_hdr()->stripped_size()) + _root()->te_hdr()->_io()->size());
    m_body = m__io->read_bytes(size_of_raw_data());
    m__io->seek(_pos);
    return m_body;
}
std::set<uefi_te_t::te_header_t::machine_type_t> uefi_te_t::te_header_t::_build_values_machine_type_t() {
    std::set<uefi_te_t::te_header_t::machine_type_t> _t;
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_UNKNOWN);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_I386);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_R4000);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_WCE_MIPS_V2);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_ALPHA);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_SH3);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_SH3_DSP);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_SH4);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_SH5);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_ARM);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_THUMB);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_ARM_NT);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_AM33);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_POWERPC);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_POWERPC_FP);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_IA64);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_MIPS16);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_ALPHA64_OR_AXP64);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_MIPS_FPU);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_MIPS16_FPU);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_EBC);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_RISCV32);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_RISCV64);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_RISCV128);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_LOONGARCH32);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_LOONGARCH64);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_AMD64);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_M32R);
    _t.insert(uefi_te_t::te_header_t::MACHINE_TYPE_ARM64);
    return _t;
}
const std::set<uefi_te_t::te_header_t::machine_type_t> uefi_te_t::te_header_t::_values_machine_type_t = uefi_te_t::te_header_t::_build_values_machine_type_t();
bool uefi_te_t::te_header_t::_is_defined_machine_type_t(uefi_te_t::te_header_t::machine_type_t v) {
    return uefi_te_t::te_header_t::_values_machine_type_t.find(v) != uefi_te_t::te_header_t::_values_machine_type_t.end();
}
std::set<uefi_te_t::te_header_t::subsystem_enum_t> uefi_te_t::te_header_t::_build_values_subsystem_enum_t() {
    std::set<uefi_te_t::te_header_t::subsystem_enum_t> _t;
    _t.insert(uefi_te_t::te_header_t::SUBSYSTEM_ENUM_UNKNOWN);
    _t.insert(uefi_te_t::te_header_t::SUBSYSTEM_ENUM_NATIVE);
    _t.insert(uefi_te_t::te_header_t::SUBSYSTEM_ENUM_WINDOWS_GUI);
    _t.insert(uefi_te_t::te_header_t::SUBSYSTEM_ENUM_WINDOWS_CUI);
    _t.insert(uefi_te_t::te_header_t::SUBSYSTEM_ENUM_POSIX_CUI);
    _t.insert(uefi_te_t::te_header_t::SUBSYSTEM_ENUM_WINDOWS_CE_GUI);
    _t.insert(uefi_te_t::te_header_t::SUBSYSTEM_ENUM_EFI_APPLICATION);
    _t.insert(uefi_te_t::te_header_t::SUBSYSTEM_ENUM_EFI_BOOT_SERVICE_DRIVER);
    _t.insert(uefi_te_t::te_header_t::SUBSYSTEM_ENUM_EFI_RUNTIME_DRIVER);
    _t.insert(uefi_te_t::te_header_t::SUBSYSTEM_ENUM_EFI_ROM);
    _t.insert(uefi_te_t::te_header_t::SUBSYSTEM_ENUM_XBOX);
    _t.insert(uefi_te_t::te_header_t::SUBSYSTEM_ENUM_WINDOWS_BOOT_APPLICATION);
    return _t;
}
const std::set<uefi_te_t::te_header_t::subsystem_enum_t> uefi_te_t::te_header_t::_values_subsystem_enum_t = uefi_te_t::te_header_t::_build_values_subsystem_enum_t();
bool uefi_te_t::te_header_t::_is_defined_subsystem_enum_t(uefi_te_t::te_header_t::subsystem_enum_t v) {
    return uefi_te_t::te_header_t::_values_subsystem_enum_t.find(v) != uefi_te_t::te_header_t::_values_subsystem_enum_t.end();
}

uefi_te_t::te_header_t::te_header_t(kaitai::kstream* p__io, uefi_te_t* p__parent, uefi_te_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_data_dirs = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void uefi_te_t::te_header_t::_read() {
    m_magic = m__io->read_bytes(2);
    if (!(m_magic == std::string("\x56\x5A", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x56\x5A", 2), m_magic, m__io, std::string("/types/te_header/seq/0"));
    }
    m_machine = static_cast<uefi_te_t::te_header_t::machine_type_t>(m__io->read_u2le());
    m_num_sections = m__io->read_u1();
    m_subsystem = static_cast<uefi_te_t::te_header_t::subsystem_enum_t>(m__io->read_u1());
    m_stripped_size = m__io->read_u2le();
    m_entry_point_addr = m__io->read_u4le();
    m_base_of_code = m__io->read_u4le();
    m_image_base = m__io->read_u8le();
    m_data_dirs = new header_data_dirs_t(m__io, this, m__root);
}

uefi_te_t::te_header_t::~te_header_t() {
    _clean_up();
}

void uefi_te_t::te_header_t::_clean_up() {
    if (m_data_dirs) {
        delete m_data_dirs; m_data_dirs = 0;
    }
}

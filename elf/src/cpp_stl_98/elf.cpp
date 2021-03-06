// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "elf.h"
#include "kaitai/exceptions.h"

elf_t::elf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, elf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void elf_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\x7F\x45\x4C\x46", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x7F\x45\x4C\x46", 4), magic(), _io(), std::string("/seq/0"));
    }
    m_bits = static_cast<elf_t::bits_t>(m__io->read_u1());
    m_endian = static_cast<elf_t::endian_t>(m__io->read_u1());
    m_ei_version = m__io->read_u1();
    m_abi = static_cast<elf_t::os_abi_t>(m__io->read_u1());
    m_abi_version = m__io->read_u1();
    m_pad = m__io->read_bytes(7);
    m_header = new endian_elf_t(m__io, this, m__root);
}

elf_t::~elf_t() {
    _clean_up();
}

void elf_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
}

elf_t::phdr_type_flags_t::phdr_type_flags_t(uint32_t p_value, kaitai::kstream* p__io, elf_t::endian_elf_t::program_header_t* p__parent, elf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_value = p_value;
    f_read = false;
    f_write = false;
    f_execute = false;
    f_mask_proc = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void elf_t::phdr_type_flags_t::_read() {
}

elf_t::phdr_type_flags_t::~phdr_type_flags_t() {
    _clean_up();
}

void elf_t::phdr_type_flags_t::_clean_up() {
}

bool elf_t::phdr_type_flags_t::read() {
    if (f_read)
        return m_read;
    m_read = (value() & 4) != 0;
    f_read = true;
    return m_read;
}

bool elf_t::phdr_type_flags_t::write() {
    if (f_write)
        return m_write;
    m_write = (value() & 2) != 0;
    f_write = true;
    return m_write;
}

bool elf_t::phdr_type_flags_t::execute() {
    if (f_execute)
        return m_execute;
    m_execute = (value() & 1) != 0;
    f_execute = true;
    return m_execute;
}

bool elf_t::phdr_type_flags_t::mask_proc() {
    if (f_mask_proc)
        return m_mask_proc;
    m_mask_proc = (value() & 4026531840UL) != 0;
    f_mask_proc = true;
    return m_mask_proc;
}

elf_t::section_header_flags_t::section_header_flags_t(uint32_t p_value, kaitai::kstream* p__io, elf_t::endian_elf_t::section_header_t* p__parent, elf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_value = p_value;
    f_merge = false;
    f_mask_os = false;
    f_exclude = false;
    f_mask_proc = false;
    f_strings = false;
    f_os_non_conforming = false;
    f_alloc = false;
    f_exec_instr = false;
    f_info_link = false;
    f_write = false;
    f_link_order = false;
    f_ordered = false;
    f_tls = false;
    f_group = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void elf_t::section_header_flags_t::_read() {
}

elf_t::section_header_flags_t::~section_header_flags_t() {
    _clean_up();
}

void elf_t::section_header_flags_t::_clean_up() {
}

bool elf_t::section_header_flags_t::merge() {
    if (f_merge)
        return m_merge;
    m_merge = (value() & 16) != 0;
    f_merge = true;
    return m_merge;
}

bool elf_t::section_header_flags_t::mask_os() {
    if (f_mask_os)
        return m_mask_os;
    m_mask_os = (value() & 267386880) != 0;
    f_mask_os = true;
    return m_mask_os;
}

bool elf_t::section_header_flags_t::exclude() {
    if (f_exclude)
        return m_exclude;
    m_exclude = (value() & 134217728) != 0;
    f_exclude = true;
    return m_exclude;
}

bool elf_t::section_header_flags_t::mask_proc() {
    if (f_mask_proc)
        return m_mask_proc;
    m_mask_proc = (value() & 4026531840UL) != 0;
    f_mask_proc = true;
    return m_mask_proc;
}

bool elf_t::section_header_flags_t::strings() {
    if (f_strings)
        return m_strings;
    m_strings = (value() & 32) != 0;
    f_strings = true;
    return m_strings;
}

bool elf_t::section_header_flags_t::os_non_conforming() {
    if (f_os_non_conforming)
        return m_os_non_conforming;
    m_os_non_conforming = (value() & 256) != 0;
    f_os_non_conforming = true;
    return m_os_non_conforming;
}

bool elf_t::section_header_flags_t::alloc() {
    if (f_alloc)
        return m_alloc;
    m_alloc = (value() & 2) != 0;
    f_alloc = true;
    return m_alloc;
}

bool elf_t::section_header_flags_t::exec_instr() {
    if (f_exec_instr)
        return m_exec_instr;
    m_exec_instr = (value() & 4) != 0;
    f_exec_instr = true;
    return m_exec_instr;
}

bool elf_t::section_header_flags_t::info_link() {
    if (f_info_link)
        return m_info_link;
    m_info_link = (value() & 64) != 0;
    f_info_link = true;
    return m_info_link;
}

bool elf_t::section_header_flags_t::write() {
    if (f_write)
        return m_write;
    m_write = (value() & 1) != 0;
    f_write = true;
    return m_write;
}

bool elf_t::section_header_flags_t::link_order() {
    if (f_link_order)
        return m_link_order;
    m_link_order = (value() & 128) != 0;
    f_link_order = true;
    return m_link_order;
}

bool elf_t::section_header_flags_t::ordered() {
    if (f_ordered)
        return m_ordered;
    m_ordered = (value() & 67108864) != 0;
    f_ordered = true;
    return m_ordered;
}

bool elf_t::section_header_flags_t::tls() {
    if (f_tls)
        return m_tls;
    m_tls = (value() & 1024) != 0;
    f_tls = true;
    return m_tls;
}

bool elf_t::section_header_flags_t::group() {
    if (f_group)
        return m_group;
    m_group = (value() & 512) != 0;
    f_group = true;
    return m_group;
}

elf_t::dt_flag_1_values_t::dt_flag_1_values_t(uint32_t p_value, kaitai::kstream* p__io, elf_t::endian_elf_t::dynamic_section_entry_t* p__parent, elf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_value = p_value;
    f_singleton = false;
    f_ignmuldef = false;
    f_loadfltr = false;
    f_initfirst = false;
    f_symintpose = false;
    f_noreloc = false;
    f_confalt = false;
    f_dispreldne = false;
    f_rtld_global = false;
    f_nodelete = false;
    f_trans = false;
    f_origin = false;
    f_now = false;
    f_nohdr = false;
    f_endfiltee = false;
    f_nodirect = false;
    f_globaudit = false;
    f_noksyms = false;
    f_interpose = false;
    f_nodump = false;
    f_disprelpnd = false;
    f_noopen = false;
    f_stub = false;
    f_direct = false;
    f_edited = false;
    f_group = false;
    f_pie = false;
    f_nodeflib = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void elf_t::dt_flag_1_values_t::_read() {
}

elf_t::dt_flag_1_values_t::~dt_flag_1_values_t() {
    _clean_up();
}

void elf_t::dt_flag_1_values_t::_clean_up() {
}

bool elf_t::dt_flag_1_values_t::singleton() {
    if (f_singleton)
        return m_singleton;
    m_singleton = (value() & 33554432) != 0;
    f_singleton = true;
    return m_singleton;
}

bool elf_t::dt_flag_1_values_t::ignmuldef() {
    if (f_ignmuldef)
        return m_ignmuldef;
    m_ignmuldef = (value() & 262144) != 0;
    f_ignmuldef = true;
    return m_ignmuldef;
}

bool elf_t::dt_flag_1_values_t::loadfltr() {
    if (f_loadfltr)
        return m_loadfltr;
    m_loadfltr = (value() & 16) != 0;
    f_loadfltr = true;
    return m_loadfltr;
}

bool elf_t::dt_flag_1_values_t::initfirst() {
    if (f_initfirst)
        return m_initfirst;
    m_initfirst = (value() & 32) != 0;
    f_initfirst = true;
    return m_initfirst;
}

bool elf_t::dt_flag_1_values_t::symintpose() {
    if (f_symintpose)
        return m_symintpose;
    m_symintpose = (value() & 8388608) != 0;
    f_symintpose = true;
    return m_symintpose;
}

bool elf_t::dt_flag_1_values_t::noreloc() {
    if (f_noreloc)
        return m_noreloc;
    m_noreloc = (value() & 4194304) != 0;
    f_noreloc = true;
    return m_noreloc;
}

bool elf_t::dt_flag_1_values_t::confalt() {
    if (f_confalt)
        return m_confalt;
    m_confalt = (value() & 8192) != 0;
    f_confalt = true;
    return m_confalt;
}

bool elf_t::dt_flag_1_values_t::dispreldne() {
    if (f_dispreldne)
        return m_dispreldne;
    m_dispreldne = (value() & 32768) != 0;
    f_dispreldne = true;
    return m_dispreldne;
}

bool elf_t::dt_flag_1_values_t::rtld_global() {
    if (f_rtld_global)
        return m_rtld_global;
    m_rtld_global = (value() & 2) != 0;
    f_rtld_global = true;
    return m_rtld_global;
}

bool elf_t::dt_flag_1_values_t::nodelete() {
    if (f_nodelete)
        return m_nodelete;
    m_nodelete = (value() & 8) != 0;
    f_nodelete = true;
    return m_nodelete;
}

bool elf_t::dt_flag_1_values_t::trans() {
    if (f_trans)
        return m_trans;
    m_trans = (value() & 512) != 0;
    f_trans = true;
    return m_trans;
}

bool elf_t::dt_flag_1_values_t::origin() {
    if (f_origin)
        return m_origin;
    m_origin = (value() & 128) != 0;
    f_origin = true;
    return m_origin;
}

bool elf_t::dt_flag_1_values_t::now() {
    if (f_now)
        return m_now;
    m_now = (value() & 1) != 0;
    f_now = true;
    return m_now;
}

bool elf_t::dt_flag_1_values_t::nohdr() {
    if (f_nohdr)
        return m_nohdr;
    m_nohdr = (value() & 1048576) != 0;
    f_nohdr = true;
    return m_nohdr;
}

bool elf_t::dt_flag_1_values_t::endfiltee() {
    if (f_endfiltee)
        return m_endfiltee;
    m_endfiltee = (value() & 16384) != 0;
    f_endfiltee = true;
    return m_endfiltee;
}

bool elf_t::dt_flag_1_values_t::nodirect() {
    if (f_nodirect)
        return m_nodirect;
    m_nodirect = (value() & 131072) != 0;
    f_nodirect = true;
    return m_nodirect;
}

bool elf_t::dt_flag_1_values_t::globaudit() {
    if (f_globaudit)
        return m_globaudit;
    m_globaudit = (value() & 16777216) != 0;
    f_globaudit = true;
    return m_globaudit;
}

bool elf_t::dt_flag_1_values_t::noksyms() {
    if (f_noksyms)
        return m_noksyms;
    m_noksyms = (value() & 524288) != 0;
    f_noksyms = true;
    return m_noksyms;
}

bool elf_t::dt_flag_1_values_t::interpose() {
    if (f_interpose)
        return m_interpose;
    m_interpose = (value() & 1024) != 0;
    f_interpose = true;
    return m_interpose;
}

bool elf_t::dt_flag_1_values_t::nodump() {
    if (f_nodump)
        return m_nodump;
    m_nodump = (value() & 4096) != 0;
    f_nodump = true;
    return m_nodump;
}

bool elf_t::dt_flag_1_values_t::disprelpnd() {
    if (f_disprelpnd)
        return m_disprelpnd;
    m_disprelpnd = (value() & 65536) != 0;
    f_disprelpnd = true;
    return m_disprelpnd;
}

bool elf_t::dt_flag_1_values_t::noopen() {
    if (f_noopen)
        return m_noopen;
    m_noopen = (value() & 64) != 0;
    f_noopen = true;
    return m_noopen;
}

bool elf_t::dt_flag_1_values_t::stub() {
    if (f_stub)
        return m_stub;
    m_stub = (value() & 67108864) != 0;
    f_stub = true;
    return m_stub;
}

bool elf_t::dt_flag_1_values_t::direct() {
    if (f_direct)
        return m_direct;
    m_direct = (value() & 256) != 0;
    f_direct = true;
    return m_direct;
}

bool elf_t::dt_flag_1_values_t::edited() {
    if (f_edited)
        return m_edited;
    m_edited = (value() & 2097152) != 0;
    f_edited = true;
    return m_edited;
}

bool elf_t::dt_flag_1_values_t::group() {
    if (f_group)
        return m_group;
    m_group = (value() & 4) != 0;
    f_group = true;
    return m_group;
}

bool elf_t::dt_flag_1_values_t::pie() {
    if (f_pie)
        return m_pie;
    m_pie = (value() & 134217728) != 0;
    f_pie = true;
    return m_pie;
}

bool elf_t::dt_flag_1_values_t::nodeflib() {
    if (f_nodeflib)
        return m_nodeflib;
    m_nodeflib = (value() & 2048) != 0;
    f_nodeflib = true;
    return m_nodeflib;
}

elf_t::endian_elf_t::endian_elf_t(kaitai::kstream* p__io, elf_t* p__parent, elf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = -1;
    m_program_headers = 0;
    m__raw_program_headers = 0;
    m__io__raw_program_headers = 0;
    m_section_headers = 0;
    m__raw_section_headers = 0;
    m__io__raw_section_headers = 0;
    m_strings = 0;
    m__io__raw_strings = 0;
    f_program_headers = false;
    f_section_headers = false;
    f_strings = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void elf_t::endian_elf_t::_read() {
    switch (_root()->endian()) {
    case elf_t::ENDIAN_LE: {
        m__is_le = true;
        break;
    }
    case elf_t::ENDIAN_BE: {
        m__is_le = false;
        break;
    }
    }

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::_read_le() {
    m_e_type = static_cast<elf_t::obj_type_t>(m__io->read_u2le());
    m_machine = static_cast<elf_t::machine_t>(m__io->read_u2le());
    m_e_version = m__io->read_u4le();
    n_entry_point = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_entry_point = false;
        m_entry_point = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_entry_point = false;
        m_entry_point = m__io->read_u8le();
        break;
    }
    }
    n_program_header_offset = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_program_header_offset = false;
        m_program_header_offset = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_program_header_offset = false;
        m_program_header_offset = m__io->read_u8le();
        break;
    }
    }
    n_section_header_offset = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_section_header_offset = false;
        m_section_header_offset = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_section_header_offset = false;
        m_section_header_offset = m__io->read_u8le();
        break;
    }
    }
    m_flags = m__io->read_bytes(4);
    m_e_ehsize = m__io->read_u2le();
    m_program_header_entry_size = m__io->read_u2le();
    m_qty_program_header = m__io->read_u2le();
    m_section_header_entry_size = m__io->read_u2le();
    m_qty_section_header = m__io->read_u2le();
    m_section_names_idx = m__io->read_u2le();
}

void elf_t::endian_elf_t::_read_be() {
    m_e_type = static_cast<elf_t::obj_type_t>(m__io->read_u2be());
    m_machine = static_cast<elf_t::machine_t>(m__io->read_u2be());
    m_e_version = m__io->read_u4be();
    n_entry_point = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_entry_point = false;
        m_entry_point = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_entry_point = false;
        m_entry_point = m__io->read_u8be();
        break;
    }
    }
    n_program_header_offset = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_program_header_offset = false;
        m_program_header_offset = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_program_header_offset = false;
        m_program_header_offset = m__io->read_u8be();
        break;
    }
    }
    n_section_header_offset = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_section_header_offset = false;
        m_section_header_offset = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_section_header_offset = false;
        m_section_header_offset = m__io->read_u8be();
        break;
    }
    }
    m_flags = m__io->read_bytes(4);
    m_e_ehsize = m__io->read_u2be();
    m_program_header_entry_size = m__io->read_u2be();
    m_qty_program_header = m__io->read_u2be();
    m_section_header_entry_size = m__io->read_u2be();
    m_qty_section_header = m__io->read_u2be();
    m_section_names_idx = m__io->read_u2be();
}

elf_t::endian_elf_t::~endian_elf_t() {
    _clean_up();
}

void elf_t::endian_elf_t::_clean_up() {
    if (!n_entry_point) {
    }
    if (!n_program_header_offset) {
    }
    if (!n_section_header_offset) {
    }
    if (f_program_headers) {
        if (m__raw_program_headers) {
            delete m__raw_program_headers; m__raw_program_headers = 0;
        }
        if (m__io__raw_program_headers) {
            for (std::vector<kaitai::kstream*>::iterator it = m__io__raw_program_headers->begin(); it != m__io__raw_program_headers->end(); ++it) {
                delete *it;
            }
            delete m__io__raw_program_headers; m__io__raw_program_headers = 0;
        }
        if (m_program_headers) {
            for (std::vector<program_header_t*>::iterator it = m_program_headers->begin(); it != m_program_headers->end(); ++it) {
                delete *it;
            }
            delete m_program_headers; m_program_headers = 0;
        }
    }
    if (f_section_headers) {
        if (m__raw_section_headers) {
            delete m__raw_section_headers; m__raw_section_headers = 0;
        }
        if (m__io__raw_section_headers) {
            for (std::vector<kaitai::kstream*>::iterator it = m__io__raw_section_headers->begin(); it != m__io__raw_section_headers->end(); ++it) {
                delete *it;
            }
            delete m__io__raw_section_headers; m__io__raw_section_headers = 0;
        }
        if (m_section_headers) {
            for (std::vector<section_header_t*>::iterator it = m_section_headers->begin(); it != m_section_headers->end(); ++it) {
                delete *it;
            }
            delete m_section_headers; m_section_headers = 0;
        }
    }
    if (f_strings) {
        if (m__io__raw_strings) {
            delete m__io__raw_strings; m__io__raw_strings = 0;
        }
        if (m_strings) {
            delete m_strings; m_strings = 0;
        }
    }
}

elf_t::endian_elf_t::dynsym_section_entry64_t::dynsym_section_entry64_t(kaitai::kstream* p__io, elf_t::endian_elf_t::dynsym_section_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void elf_t::endian_elf_t::dynsym_section_entry64_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf/types/dynsym_section_entry64");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::dynsym_section_entry64_t::_read_le() {
    m_name_offset = m__io->read_u4le();
    m_info = m__io->read_u1();
    m_other = m__io->read_u1();
    m_shndx = m__io->read_u2le();
    m_value = m__io->read_u8le();
    m_size = m__io->read_u8le();
}

void elf_t::endian_elf_t::dynsym_section_entry64_t::_read_be() {
    m_name_offset = m__io->read_u4be();
    m_info = m__io->read_u1();
    m_other = m__io->read_u1();
    m_shndx = m__io->read_u2be();
    m_value = m__io->read_u8be();
    m_size = m__io->read_u8be();
}

elf_t::endian_elf_t::dynsym_section_entry64_t::~dynsym_section_entry64_t() {
    _clean_up();
}

void elf_t::endian_elf_t::dynsym_section_entry64_t::_clean_up() {
}

elf_t::endian_elf_t::program_header_t::program_header_t(kaitai::kstream* p__io, elf_t::endian_elf_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_dynamic = 0;
    m__io__raw_dynamic = 0;
    f_dynamic = false;
    f_flags_obj = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void elf_t::endian_elf_t::program_header_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf/types/program_header");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::program_header_t::_read_le() {
    m_type = static_cast<elf_t::ph_type_t>(m__io->read_u4le());
    n_flags64 = true;
    if (_root()->bits() == elf_t::BITS_B64) {
        n_flags64 = false;
        m_flags64 = m__io->read_u4le();
    }
    n_offset = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_offset = false;
        m_offset = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_offset = false;
        m_offset = m__io->read_u8le();
        break;
    }
    }
    n_vaddr = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_vaddr = false;
        m_vaddr = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_vaddr = false;
        m_vaddr = m__io->read_u8le();
        break;
    }
    }
    n_paddr = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_paddr = false;
        m_paddr = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_paddr = false;
        m_paddr = m__io->read_u8le();
        break;
    }
    }
    n_filesz = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_filesz = false;
        m_filesz = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_filesz = false;
        m_filesz = m__io->read_u8le();
        break;
    }
    }
    n_memsz = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_memsz = false;
        m_memsz = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_memsz = false;
        m_memsz = m__io->read_u8le();
        break;
    }
    }
    n_flags32 = true;
    if (_root()->bits() == elf_t::BITS_B32) {
        n_flags32 = false;
        m_flags32 = m__io->read_u4le();
    }
    n_align = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_align = false;
        m_align = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_align = false;
        m_align = m__io->read_u8le();
        break;
    }
    }
}

void elf_t::endian_elf_t::program_header_t::_read_be() {
    m_type = static_cast<elf_t::ph_type_t>(m__io->read_u4be());
    n_flags64 = true;
    if (_root()->bits() == elf_t::BITS_B64) {
        n_flags64 = false;
        m_flags64 = m__io->read_u4be();
    }
    n_offset = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_offset = false;
        m_offset = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_offset = false;
        m_offset = m__io->read_u8be();
        break;
    }
    }
    n_vaddr = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_vaddr = false;
        m_vaddr = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_vaddr = false;
        m_vaddr = m__io->read_u8be();
        break;
    }
    }
    n_paddr = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_paddr = false;
        m_paddr = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_paddr = false;
        m_paddr = m__io->read_u8be();
        break;
    }
    }
    n_filesz = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_filesz = false;
        m_filesz = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_filesz = false;
        m_filesz = m__io->read_u8be();
        break;
    }
    }
    n_memsz = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_memsz = false;
        m_memsz = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_memsz = false;
        m_memsz = m__io->read_u8be();
        break;
    }
    }
    n_flags32 = true;
    if (_root()->bits() == elf_t::BITS_B32) {
        n_flags32 = false;
        m_flags32 = m__io->read_u4be();
    }
    n_align = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_align = false;
        m_align = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_align = false;
        m_align = m__io->read_u8be();
        break;
    }
    }
}

elf_t::endian_elf_t::program_header_t::~program_header_t() {
    _clean_up();
}

void elf_t::endian_elf_t::program_header_t::_clean_up() {
    if (!n_flags64) {
    }
    if (!n_offset) {
    }
    if (!n_vaddr) {
    }
    if (!n_paddr) {
    }
    if (!n_filesz) {
    }
    if (!n_memsz) {
    }
    if (!n_flags32) {
    }
    if (!n_align) {
    }
    if (f_dynamic && !n_dynamic) {
        if (m__io__raw_dynamic) {
            delete m__io__raw_dynamic; m__io__raw_dynamic = 0;
        }
        if (m_dynamic) {
            delete m_dynamic; m_dynamic = 0;
        }
    }
    if (f_flags_obj && !n_flags_obj) {
        if (m_flags_obj) {
            delete m_flags_obj; m_flags_obj = 0;
        }
    }
}

elf_t::endian_elf_t::dynamic_section_t* elf_t::endian_elf_t::program_header_t::dynamic() {
    if (f_dynamic)
        return m_dynamic;
    n_dynamic = true;
    if (type() == elf_t::PH_TYPE_DYNAMIC) {
        n_dynamic = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(offset());
        if (m__is_le == 1) {
            m__raw_dynamic = io->read_bytes(filesz());
            m__io__raw_dynamic = new kaitai::kstream(m__raw_dynamic);
            m_dynamic = new dynamic_section_t(m__io__raw_dynamic, this, m__root, m__is_le);
        } else {
            m__raw_dynamic = io->read_bytes(filesz());
            m__io__raw_dynamic = new kaitai::kstream(m__raw_dynamic);
            m_dynamic = new dynamic_section_t(m__io__raw_dynamic, this, m__root, m__is_le);
        }
        io->seek(_pos);
        f_dynamic = true;
    }
    return m_dynamic;
}

elf_t::phdr_type_flags_t* elf_t::endian_elf_t::program_header_t::flags_obj() {
    if (f_flags_obj)
        return m_flags_obj;
    if (m__is_le == 1) {
        n_flags_obj = true;
        switch (_root()->bits()) {
        case elf_t::BITS_B32: {
            n_flags_obj = false;
            m_flags_obj = new phdr_type_flags_t(flags32(), m__io, this, m__root);
            break;
        }
        case elf_t::BITS_B64: {
            n_flags_obj = false;
            m_flags_obj = new phdr_type_flags_t(flags64(), m__io, this, m__root);
            break;
        }
        }
    } else {
        n_flags_obj = true;
        switch (_root()->bits()) {
        case elf_t::BITS_B32: {
            n_flags_obj = false;
            m_flags_obj = new phdr_type_flags_t(flags32(), m__io, this, m__root);
            break;
        }
        case elf_t::BITS_B64: {
            n_flags_obj = false;
            m_flags_obj = new phdr_type_flags_t(flags64(), m__io, this, m__root);
            break;
        }
        }
    }
    f_flags_obj = true;
    return m_flags_obj;
}

elf_t::endian_elf_t::dynamic_section_entry_t::dynamic_section_entry_t(kaitai::kstream* p__io, elf_t::endian_elf_t::dynamic_section_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_flag_1_values = 0;
    f_tag_enum = false;
    f_flag_1_values = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void elf_t::endian_elf_t::dynamic_section_entry_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf/types/dynamic_section_entry");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::dynamic_section_entry_t::_read_le() {
    n_tag = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_tag = false;
        m_tag = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_tag = false;
        m_tag = m__io->read_u8le();
        break;
    }
    }
    n_value_or_ptr = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_value_or_ptr = false;
        m_value_or_ptr = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_value_or_ptr = false;
        m_value_or_ptr = m__io->read_u8le();
        break;
    }
    }
}

void elf_t::endian_elf_t::dynamic_section_entry_t::_read_be() {
    n_tag = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_tag = false;
        m_tag = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_tag = false;
        m_tag = m__io->read_u8be();
        break;
    }
    }
    n_value_or_ptr = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_value_or_ptr = false;
        m_value_or_ptr = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_value_or_ptr = false;
        m_value_or_ptr = m__io->read_u8be();
        break;
    }
    }
}

elf_t::endian_elf_t::dynamic_section_entry_t::~dynamic_section_entry_t() {
    _clean_up();
}

void elf_t::endian_elf_t::dynamic_section_entry_t::_clean_up() {
    if (!n_tag) {
    }
    if (!n_value_or_ptr) {
    }
    if (f_flag_1_values && !n_flag_1_values) {
        if (m_flag_1_values) {
            delete m_flag_1_values; m_flag_1_values = 0;
        }
    }
}

elf_t::dynamic_array_tags_t elf_t::endian_elf_t::dynamic_section_entry_t::tag_enum() {
    if (f_tag_enum)
        return m_tag_enum;
    m_tag_enum = static_cast<elf_t::dynamic_array_tags_t>(tag());
    f_tag_enum = true;
    return m_tag_enum;
}

elf_t::dt_flag_1_values_t* elf_t::endian_elf_t::dynamic_section_entry_t::flag_1_values() {
    if (f_flag_1_values)
        return m_flag_1_values;
    n_flag_1_values = true;
    if (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_FLAGS_1) {
        n_flag_1_values = false;
        if (m__is_le == 1) {
            m_flag_1_values = new dt_flag_1_values_t(value_or_ptr(), m__io, this, m__root);
        } else {
            m_flag_1_values = new dt_flag_1_values_t(value_or_ptr(), m__io, this, m__root);
        }
        f_flag_1_values = true;
    }
    return m_flag_1_values;
}

elf_t::endian_elf_t::section_header_t::section_header_t(kaitai::kstream* p__io, elf_t::endian_elf_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m__io__raw_body = 0;
    m_flags_obj = 0;
    f_body = false;
    f_name = false;
    f_flags_obj = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void elf_t::endian_elf_t::section_header_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf/types/section_header");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::section_header_t::_read_le() {
    m_ofs_name = m__io->read_u4le();
    m_type = static_cast<elf_t::sh_type_t>(m__io->read_u4le());
    n_flags = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_flags = false;
        m_flags = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_flags = false;
        m_flags = m__io->read_u8le();
        break;
    }
    }
    n_addr = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_addr = false;
        m_addr = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_addr = false;
        m_addr = m__io->read_u8le();
        break;
    }
    }
    n_ofs_body = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_ofs_body = false;
        m_ofs_body = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_ofs_body = false;
        m_ofs_body = m__io->read_u8le();
        break;
    }
    }
    n_len_body = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_len_body = false;
        m_len_body = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_len_body = false;
        m_len_body = m__io->read_u8le();
        break;
    }
    }
    m_linked_section_idx = m__io->read_u4le();
    m_info = m__io->read_bytes(4);
    n_align = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_align = false;
        m_align = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_align = false;
        m_align = m__io->read_u8le();
        break;
    }
    }
    n_entry_size = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_entry_size = false;
        m_entry_size = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_entry_size = false;
        m_entry_size = m__io->read_u8le();
        break;
    }
    }
}

void elf_t::endian_elf_t::section_header_t::_read_be() {
    m_ofs_name = m__io->read_u4be();
    m_type = static_cast<elf_t::sh_type_t>(m__io->read_u4be());
    n_flags = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_flags = false;
        m_flags = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_flags = false;
        m_flags = m__io->read_u8be();
        break;
    }
    }
    n_addr = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_addr = false;
        m_addr = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_addr = false;
        m_addr = m__io->read_u8be();
        break;
    }
    }
    n_ofs_body = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_ofs_body = false;
        m_ofs_body = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_ofs_body = false;
        m_ofs_body = m__io->read_u8be();
        break;
    }
    }
    n_len_body = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_len_body = false;
        m_len_body = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_len_body = false;
        m_len_body = m__io->read_u8be();
        break;
    }
    }
    m_linked_section_idx = m__io->read_u4be();
    m_info = m__io->read_bytes(4);
    n_align = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_align = false;
        m_align = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_align = false;
        m_align = m__io->read_u8be();
        break;
    }
    }
    n_entry_size = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_entry_size = false;
        m_entry_size = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_entry_size = false;
        m_entry_size = m__io->read_u8be();
        break;
    }
    }
}

elf_t::endian_elf_t::section_header_t::~section_header_t() {
    _clean_up();
}

void elf_t::endian_elf_t::section_header_t::_clean_up() {
    if (!n_flags) {
    }
    if (!n_addr) {
    }
    if (!n_ofs_body) {
    }
    if (!n_len_body) {
    }
    if (!n_align) {
    }
    if (!n_entry_size) {
    }
    if (f_body && !n_body) {
        if (m__io__raw_body) {
            delete m__io__raw_body; m__io__raw_body = 0;
        }
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
    if (f_name) {
    }
    if (f_flags_obj) {
        if (m_flags_obj) {
            delete m_flags_obj; m_flags_obj = 0;
        }
    }
}

kaitai::kstruct* elf_t::endian_elf_t::section_header_t::body() {
    if (f_body)
        return m_body;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_body());
    if (m__is_le == 1) {
        n_body = true;
        switch (type()) {
        case elf_t::SH_TYPE_STRTAB: {
            n_body = false;
            m__raw_body = io->read_bytes(len_body());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new strings_struct_t(m__io__raw_body, this, m__root, m__is_le);
            break;
        }
        case elf_t::SH_TYPE_DYNAMIC: {
            n_body = false;
            m__raw_body = io->read_bytes(len_body());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new dynamic_section_t(m__io__raw_body, this, m__root, m__is_le);
            break;
        }
        case elf_t::SH_TYPE_DYNSYM: {
            n_body = false;
            m__raw_body = io->read_bytes(len_body());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new dynsym_section_t(m__io__raw_body, this, m__root, m__is_le);
            break;
        }
        case elf_t::SH_TYPE_DYNSTR: {
            n_body = false;
            m__raw_body = io->read_bytes(len_body());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new strings_struct_t(m__io__raw_body, this, m__root, m__is_le);
            break;
        }
        default: {
            m__raw_body = io->read_bytes(len_body());
            break;
        }
        }
    } else {
        n_body = true;
        switch (type()) {
        case elf_t::SH_TYPE_STRTAB: {
            n_body = false;
            m__raw_body = io->read_bytes(len_body());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new strings_struct_t(m__io__raw_body, this, m__root, m__is_le);
            break;
        }
        case elf_t::SH_TYPE_DYNAMIC: {
            n_body = false;
            m__raw_body = io->read_bytes(len_body());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new dynamic_section_t(m__io__raw_body, this, m__root, m__is_le);
            break;
        }
        case elf_t::SH_TYPE_DYNSYM: {
            n_body = false;
            m__raw_body = io->read_bytes(len_body());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new dynsym_section_t(m__io__raw_body, this, m__root, m__is_le);
            break;
        }
        case elf_t::SH_TYPE_DYNSTR: {
            n_body = false;
            m__raw_body = io->read_bytes(len_body());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new strings_struct_t(m__io__raw_body, this, m__root, m__is_le);
            break;
        }
        default: {
            m__raw_body = io->read_bytes(len_body());
            break;
        }
        }
    }
    io->seek(_pos);
    f_body = true;
    return m_body;
}

std::string elf_t::endian_elf_t::section_header_t::name() {
    if (f_name)
        return m_name;
    kaitai::kstream *io = _root()->header()->strings()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_name());
    if (m__is_le == 1) {
        m_name = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), std::string("ASCII"));
    } else {
        m_name = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), std::string("ASCII"));
    }
    io->seek(_pos);
    f_name = true;
    return m_name;
}

elf_t::section_header_flags_t* elf_t::endian_elf_t::section_header_t::flags_obj() {
    if (f_flags_obj)
        return m_flags_obj;
    if (m__is_le == 1) {
        m_flags_obj = new section_header_flags_t(flags(), m__io, this, m__root);
    } else {
        m_flags_obj = new section_header_flags_t(flags(), m__io, this, m__root);
    }
    f_flags_obj = true;
    return m_flags_obj;
}

elf_t::endian_elf_t::dynamic_section_t::dynamic_section_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void elf_t::endian_elf_t::dynamic_section_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf/types/dynamic_section");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::dynamic_section_t::_read_le() {
    m_entries = new std::vector<dynamic_section_entry_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new dynamic_section_entry_t(m__io, this, m__root, m__is_le));
            i++;
        }
    }
}

void elf_t::endian_elf_t::dynamic_section_t::_read_be() {
    m_entries = new std::vector<dynamic_section_entry_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new dynamic_section_entry_t(m__io, this, m__root, m__is_le));
            i++;
        }
    }
}

elf_t::endian_elf_t::dynamic_section_t::~dynamic_section_t() {
    _clean_up();
}

void elf_t::endian_elf_t::dynamic_section_t::_clean_up() {
    if (m_entries) {
        for (std::vector<dynamic_section_entry_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

elf_t::endian_elf_t::dynsym_section_t::dynsym_section_t(kaitai::kstream* p__io, elf_t::endian_elf_t::section_header_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void elf_t::endian_elf_t::dynsym_section_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf/types/dynsym_section");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::dynsym_section_t::_read_le() {
    m_entries = new std::vector<kaitai::kstruct*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            switch (_root()->bits()) {
            case elf_t::BITS_B32: {
                m_entries->push_back(new dynsym_section_entry32_t(m__io, this, m__root, m__is_le));
                break;
            }
            case elf_t::BITS_B64: {
                m_entries->push_back(new dynsym_section_entry64_t(m__io, this, m__root, m__is_le));
                break;
            }
            }
            i++;
        }
    }
}

void elf_t::endian_elf_t::dynsym_section_t::_read_be() {
    m_entries = new std::vector<kaitai::kstruct*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            switch (_root()->bits()) {
            case elf_t::BITS_B32: {
                m_entries->push_back(new dynsym_section_entry32_t(m__io, this, m__root, m__is_le));
                break;
            }
            case elf_t::BITS_B64: {
                m_entries->push_back(new dynsym_section_entry64_t(m__io, this, m__root, m__is_le));
                break;
            }
            }
            i++;
        }
    }
}

elf_t::endian_elf_t::dynsym_section_t::~dynsym_section_t() {
    _clean_up();
}

void elf_t::endian_elf_t::dynsym_section_t::_clean_up() {
    if (m_entries) {
        for (std::vector<kaitai::kstruct*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

elf_t::endian_elf_t::dynsym_section_entry32_t::dynsym_section_entry32_t(kaitai::kstream* p__io, elf_t::endian_elf_t::dynsym_section_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void elf_t::endian_elf_t::dynsym_section_entry32_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf/types/dynsym_section_entry32");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::dynsym_section_entry32_t::_read_le() {
    m_name_offset = m__io->read_u4le();
    m_value = m__io->read_u4le();
    m_size = m__io->read_u4le();
    m_info = m__io->read_u1();
    m_other = m__io->read_u1();
    m_shndx = m__io->read_u2le();
}

void elf_t::endian_elf_t::dynsym_section_entry32_t::_read_be() {
    m_name_offset = m__io->read_u4be();
    m_value = m__io->read_u4be();
    m_size = m__io->read_u4be();
    m_info = m__io->read_u1();
    m_other = m__io->read_u1();
    m_shndx = m__io->read_u2be();
}

elf_t::endian_elf_t::dynsym_section_entry32_t::~dynsym_section_entry32_t() {
    _clean_up();
}

void elf_t::endian_elf_t::dynsym_section_entry32_t::_clean_up() {
}

elf_t::endian_elf_t::strings_struct_t::strings_struct_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void elf_t::endian_elf_t::strings_struct_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf/types/strings_struct");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::strings_struct_t::_read_le() {
    m_entries = new std::vector<std::string>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ASCII")));
            i++;
        }
    }
}

void elf_t::endian_elf_t::strings_struct_t::_read_be() {
    m_entries = new std::vector<std::string>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ASCII")));
            i++;
        }
    }
}

elf_t::endian_elf_t::strings_struct_t::~strings_struct_t() {
    _clean_up();
}

void elf_t::endian_elf_t::strings_struct_t::_clean_up() {
    if (m_entries) {
        delete m_entries; m_entries = 0;
    }
}

std::vector<elf_t::endian_elf_t::program_header_t*>* elf_t::endian_elf_t::program_headers() {
    if (f_program_headers)
        return m_program_headers;
    std::streampos _pos = m__io->pos();
    m__io->seek(program_header_offset());
    if (m__is_le == 1) {
        int l_program_headers = qty_program_header();
        m__raw_program_headers = new std::vector<std::string>();
        m__raw_program_headers->reserve(l_program_headers);
        m__io__raw_program_headers = new std::vector<kaitai::kstream*>();
        m__io__raw_program_headers->reserve(l_program_headers);
        m_program_headers = new std::vector<program_header_t*>();
        m_program_headers->reserve(l_program_headers);
        for (int i = 0; i < l_program_headers; i++) {
            m__raw_program_headers->push_back(m__io->read_bytes(program_header_entry_size()));
            kaitai::kstream* io__raw_program_headers = new kaitai::kstream(m__raw_program_headers->at(m__raw_program_headers->size() - 1));
            m__io__raw_program_headers->push_back(io__raw_program_headers);
            m_program_headers->push_back(new program_header_t(io__raw_program_headers, this, m__root, m__is_le));
        }
    } else {
        int l_program_headers = qty_program_header();
        m__raw_program_headers = new std::vector<std::string>();
        m__raw_program_headers->reserve(l_program_headers);
        m__io__raw_program_headers = new std::vector<kaitai::kstream*>();
        m__io__raw_program_headers->reserve(l_program_headers);
        m_program_headers = new std::vector<program_header_t*>();
        m_program_headers->reserve(l_program_headers);
        for (int i = 0; i < l_program_headers; i++) {
            m__raw_program_headers->push_back(m__io->read_bytes(program_header_entry_size()));
            kaitai::kstream* io__raw_program_headers = new kaitai::kstream(m__raw_program_headers->at(m__raw_program_headers->size() - 1));
            m__io__raw_program_headers->push_back(io__raw_program_headers);
            m_program_headers->push_back(new program_header_t(io__raw_program_headers, this, m__root, m__is_le));
        }
    }
    m__io->seek(_pos);
    f_program_headers = true;
    return m_program_headers;
}

std::vector<elf_t::endian_elf_t::section_header_t*>* elf_t::endian_elf_t::section_headers() {
    if (f_section_headers)
        return m_section_headers;
    std::streampos _pos = m__io->pos();
    m__io->seek(section_header_offset());
    if (m__is_le == 1) {
        int l_section_headers = qty_section_header();
        m__raw_section_headers = new std::vector<std::string>();
        m__raw_section_headers->reserve(l_section_headers);
        m__io__raw_section_headers = new std::vector<kaitai::kstream*>();
        m__io__raw_section_headers->reserve(l_section_headers);
        m_section_headers = new std::vector<section_header_t*>();
        m_section_headers->reserve(l_section_headers);
        for (int i = 0; i < l_section_headers; i++) {
            m__raw_section_headers->push_back(m__io->read_bytes(section_header_entry_size()));
            kaitai::kstream* io__raw_section_headers = new kaitai::kstream(m__raw_section_headers->at(m__raw_section_headers->size() - 1));
            m__io__raw_section_headers->push_back(io__raw_section_headers);
            m_section_headers->push_back(new section_header_t(io__raw_section_headers, this, m__root, m__is_le));
        }
    } else {
        int l_section_headers = qty_section_header();
        m__raw_section_headers = new std::vector<std::string>();
        m__raw_section_headers->reserve(l_section_headers);
        m__io__raw_section_headers = new std::vector<kaitai::kstream*>();
        m__io__raw_section_headers->reserve(l_section_headers);
        m_section_headers = new std::vector<section_header_t*>();
        m_section_headers->reserve(l_section_headers);
        for (int i = 0; i < l_section_headers; i++) {
            m__raw_section_headers->push_back(m__io->read_bytes(section_header_entry_size()));
            kaitai::kstream* io__raw_section_headers = new kaitai::kstream(m__raw_section_headers->at(m__raw_section_headers->size() - 1));
            m__io__raw_section_headers->push_back(io__raw_section_headers);
            m_section_headers->push_back(new section_header_t(io__raw_section_headers, this, m__root, m__is_le));
        }
    }
    m__io->seek(_pos);
    f_section_headers = true;
    return m_section_headers;
}

elf_t::endian_elf_t::strings_struct_t* elf_t::endian_elf_t::strings() {
    if (f_strings)
        return m_strings;
    std::streampos _pos = m__io->pos();
    m__io->seek(section_headers()->at(section_names_idx())->ofs_body());
    if (m__is_le == 1) {
        m__raw_strings = m__io->read_bytes(section_headers()->at(section_names_idx())->len_body());
        m__io__raw_strings = new kaitai::kstream(m__raw_strings);
        m_strings = new strings_struct_t(m__io__raw_strings, this, m__root, m__is_le);
    } else {
        m__raw_strings = m__io->read_bytes(section_headers()->at(section_names_idx())->len_body());
        m__io__raw_strings = new kaitai::kstream(m__raw_strings);
        m_strings = new strings_struct_t(m__io__raw_strings, this, m__root, m__is_le);
    }
    m__io->seek(_pos);
    f_strings = true;
    return m_strings;
}

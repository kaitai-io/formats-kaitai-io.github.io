// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "elf.h"
#include "kaitai/exceptions.h"

elf_t::elf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, elf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = nullptr;
    f_sh_idx_lo_os = false;
    f_sh_idx_lo_reserved = false;
    f_sh_idx_hi_proc = false;
    f_sh_idx_lo_proc = false;
    f_sh_idx_hi_os = false;
    f_sh_idx_hi_reserved = false;
    _read();
}

void elf_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\x7F\x45\x4C\x46", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x7F\x45\x4C\x46", 4), magic(), _io(), std::string("/seq/0"));
    }
    m_bits = static_cast<elf_t::bits_t>(m__io->read_u1());
    m_endian = static_cast<elf_t::endian_t>(m__io->read_u1());
    m_ei_version = m__io->read_u1();
    if (!(ei_version() == 1)) {
        throw kaitai::validation_not_equal_error<uint8_t>(1, ei_version(), _io(), std::string("/seq/3"));
    }
    m_abi = static_cast<elf_t::os_abi_t>(m__io->read_u1());
    m_abi_version = m__io->read_u1();
    m_pad = m__io->read_bytes(7);
    if (!(pad() == std::string("\x00\x00\x00\x00\x00\x00\x00", 7))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00\x00\x00\x00", 7), pad(), _io(), std::string("/seq/6"));
    }
    m_header = std::unique_ptr<endian_elf_t>(new endian_elf_t(m__io, this, m__root));
}

elf_t::~elf_t() {
    _clean_up();
}

void elf_t::_clean_up() {
}

elf_t::endian_elf_t::endian_elf_t(kaitai::kstream* p__io, elf_t* p__parent, elf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = -1;
    m_program_headers = nullptr;
    m__raw_program_headers = nullptr;
    m__io__raw_program_headers = nullptr;
    m_section_headers = nullptr;
    m__raw_section_headers = nullptr;
    m__io__raw_section_headers = nullptr;
    m_section_names = nullptr;
    m__io__raw_section_names = nullptr;
    f_program_headers = false;
    f_section_headers = false;
    f_section_names = false;
    _read();
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
    n_ofs_program_headers = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_ofs_program_headers = false;
        m_ofs_program_headers = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_ofs_program_headers = false;
        m_ofs_program_headers = m__io->read_u8le();
        break;
    }
    }
    n_ofs_section_headers = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_ofs_section_headers = false;
        m_ofs_section_headers = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_ofs_section_headers = false;
        m_ofs_section_headers = m__io->read_u8le();
        break;
    }
    }
    m_flags = m__io->read_bytes(4);
    m_e_ehsize = m__io->read_u2le();
    m_program_header_size = m__io->read_u2le();
    m_num_program_headers = m__io->read_u2le();
    m_section_header_size = m__io->read_u2le();
    m_num_section_headers = m__io->read_u2le();
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
    n_ofs_program_headers = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_ofs_program_headers = false;
        m_ofs_program_headers = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_ofs_program_headers = false;
        m_ofs_program_headers = m__io->read_u8be();
        break;
    }
    }
    n_ofs_section_headers = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_ofs_section_headers = false;
        m_ofs_section_headers = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_ofs_section_headers = false;
        m_ofs_section_headers = m__io->read_u8be();
        break;
    }
    }
    m_flags = m__io->read_bytes(4);
    m_e_ehsize = m__io->read_u2be();
    m_program_header_size = m__io->read_u2be();
    m_num_program_headers = m__io->read_u2be();
    m_section_header_size = m__io->read_u2be();
    m_num_section_headers = m__io->read_u2be();
    m_section_names_idx = m__io->read_u2be();
}

elf_t::endian_elf_t::~endian_elf_t() {
    _clean_up();
}

void elf_t::endian_elf_t::_clean_up() {
    if (!n_entry_point) {
    }
    if (!n_ofs_program_headers) {
    }
    if (!n_ofs_section_headers) {
    }
    if (f_program_headers) {
    }
    if (f_section_headers) {
    }
    if (f_section_names && !n_section_names) {
    }
}

elf_t::endian_elf_t::note_section_t::note_section_t(kaitai::kstream* p__io, elf_t::endian_elf_t::section_header_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_entries = nullptr;
    _read();
}

void elf_t::endian_elf_t::note_section_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf/types/note_section");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::note_section_t::_read_le() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<note_section_entry_t>>>(new std::vector<std::unique_ptr<note_section_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<note_section_entry_t>(new note_section_entry_t(m__io, this, m__root, m__is_le))));
            i++;
        }
    }
}

void elf_t::endian_elf_t::note_section_t::_read_be() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<note_section_entry_t>>>(new std::vector<std::unique_ptr<note_section_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<note_section_entry_t>(new note_section_entry_t(m__io, this, m__root, m__is_le))));
            i++;
        }
    }
}

elf_t::endian_elf_t::note_section_t::~note_section_t() {
    _clean_up();
}

void elf_t::endian_elf_t::note_section_t::_clean_up() {
}

elf_t::endian_elf_t::program_header_t::program_header_t(kaitai::kstream* p__io, elf_t::endian_elf_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    f_flags_obj = false;
    _read();
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
    if (f_flags_obj && !n_flags_obj) {
    }
}

elf_t::phdr_type_flags_t* elf_t::endian_elf_t::program_header_t::flags_obj() {
    if (f_flags_obj)
        return m_flags_obj.get();
    if (m__is_le == 1) {
        n_flags_obj = true;
        switch (_root()->bits()) {
        case elf_t::BITS_B32: {
            n_flags_obj = false;
            m_flags_obj = std::unique_ptr<phdr_type_flags_t>(new phdr_type_flags_t(flags32(), m__io, this, m__root));
            break;
        }
        case elf_t::BITS_B64: {
            n_flags_obj = false;
            m_flags_obj = std::unique_ptr<phdr_type_flags_t>(new phdr_type_flags_t(flags64(), m__io, this, m__root));
            break;
        }
        }
    } else {
        n_flags_obj = true;
        switch (_root()->bits()) {
        case elf_t::BITS_B32: {
            n_flags_obj = false;
            m_flags_obj = std::unique_ptr<phdr_type_flags_t>(new phdr_type_flags_t(flags32(), m__io, this, m__root));
            break;
        }
        case elf_t::BITS_B64: {
            n_flags_obj = false;
            m_flags_obj = std::unique_ptr<phdr_type_flags_t>(new phdr_type_flags_t(flags64(), m__io, this, m__root));
            break;
        }
        }
    }
    f_flags_obj = true;
    return m_flags_obj.get();
}

elf_t::endian_elf_t::dynamic_section_entry_t::dynamic_section_entry_t(kaitai::kstream* p__io, elf_t::endian_elf_t::dynamic_section_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_flag_1_values = nullptr;
    m_flag_values = nullptr;
    f_flag_1_values = false;
    f_value_str = false;
    f_tag_enum = false;
    f_flag_values = false;
    f_is_value_str = false;
    _read();
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
    }
    if (f_value_str && !n_value_str) {
    }
    if (f_flag_values && !n_flag_values) {
    }
}

elf_t::dt_flag_1_values_t* elf_t::endian_elf_t::dynamic_section_entry_t::flag_1_values() {
    if (f_flag_1_values)
        return m_flag_1_values.get();
    n_flag_1_values = true;
    if (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_FLAGS_1) {
        n_flag_1_values = false;
        if (m__is_le == 1) {
            m_flag_1_values = std::unique_ptr<dt_flag_1_values_t>(new dt_flag_1_values_t(value_or_ptr(), m__io, this, m__root));
        } else {
            m_flag_1_values = std::unique_ptr<dt_flag_1_values_t>(new dt_flag_1_values_t(value_or_ptr(), m__io, this, m__root));
        }
        f_flag_1_values = true;
    }
    return m_flag_1_values.get();
}

std::string elf_t::endian_elf_t::dynamic_section_entry_t::value_str() {
    if (f_value_str)
        return m_value_str;
    n_value_str = true;
    if ( ((is_value_str()) && (_parent()->is_string_table_linked())) ) {
        n_value_str = false;
        kaitai::kstream *io = static_cast<elf_t::endian_elf_t::strings_struct_t*>(_parent()->_parent()->linked_section()->body())->_io();
        std::streampos _pos = io->pos();
        io->seek(value_or_ptr());
        if (m__is_le == 1) {
            m_value_str = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), std::string("ASCII"));
        } else {
            m_value_str = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), std::string("ASCII"));
        }
        io->seek(_pos);
        f_value_str = true;
    }
    return m_value_str;
}

elf_t::dynamic_array_tags_t elf_t::endian_elf_t::dynamic_section_entry_t::tag_enum() {
    if (f_tag_enum)
        return m_tag_enum;
    m_tag_enum = static_cast<elf_t::dynamic_array_tags_t>(tag());
    f_tag_enum = true;
    return m_tag_enum;
}

elf_t::dt_flag_values_t* elf_t::endian_elf_t::dynamic_section_entry_t::flag_values() {
    if (f_flag_values)
        return m_flag_values.get();
    n_flag_values = true;
    if (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_FLAGS) {
        n_flag_values = false;
        if (m__is_le == 1) {
            m_flag_values = std::unique_ptr<dt_flag_values_t>(new dt_flag_values_t(value_or_ptr(), m__io, this, m__root));
        } else {
            m_flag_values = std::unique_ptr<dt_flag_values_t>(new dt_flag_values_t(value_or_ptr(), m__io, this, m__root));
        }
        f_flag_values = true;
    }
    return m_flag_values.get();
}

bool elf_t::endian_elf_t::dynamic_section_entry_t::is_value_str() {
    if (f_is_value_str)
        return m_is_value_str;
    m_is_value_str =  ((value_or_ptr() != 0) && ( ((tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_NEEDED) || (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_SONAME) || (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_RPATH) || (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_RUNPATH) || (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_SUNW_AUXILIARY) || (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_SUNW_FILTER) || (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_AUXILIARY) || (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_FILTER) || (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_CONFIG) || (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_DEPAUDIT) || (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_AUDIT)) )) ;
    f_is_value_str = true;
    return m_is_value_str;
}

elf_t::endian_elf_t::section_header_t::section_header_t(kaitai::kstream* p__io, elf_t::endian_elf_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m__io__raw_body = nullptr;
    m_flags_obj = nullptr;
    f_body = false;
    f_linked_section = false;
    f_name = false;
    f_flags_obj = false;
    _read();
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
    }
    if (f_name) {
    }
    if (f_flags_obj) {
    }
}

kaitai::kstruct* elf_t::endian_elf_t::section_header_t::body() {
    if (f_body)
        return m_body.get();
    n_body = true;
    if (type() != elf_t::SH_TYPE_NOBITS) {
        n_body = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(ofs_body());
        if (m__is_le == 1) {
            n_body = true;
            switch (type()) {
            case elf_t::SH_TYPE_REL: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<relocation_section_t>(new relocation_section_t(false, m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            case elf_t::SH_TYPE_NOTE: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<note_section_t>(new note_section_t(m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            case elf_t::SH_TYPE_SYMTAB: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<dynsym_section_t>(new dynsym_section_t(m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            case elf_t::SH_TYPE_STRTAB: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<strings_struct_t>(new strings_struct_t(m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            case elf_t::SH_TYPE_DYNAMIC: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<dynamic_section_t>(new dynamic_section_t(m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            case elf_t::SH_TYPE_DYNSYM: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<dynsym_section_t>(new dynsym_section_t(m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            case elf_t::SH_TYPE_RELA: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<relocation_section_t>(new relocation_section_t(true, m__io__raw_body.get(), this, m__root, m__is_le));
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
            case elf_t::SH_TYPE_REL: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<relocation_section_t>(new relocation_section_t(false, m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            case elf_t::SH_TYPE_NOTE: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<note_section_t>(new note_section_t(m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            case elf_t::SH_TYPE_SYMTAB: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<dynsym_section_t>(new dynsym_section_t(m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            case elf_t::SH_TYPE_STRTAB: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<strings_struct_t>(new strings_struct_t(m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            case elf_t::SH_TYPE_DYNAMIC: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<dynamic_section_t>(new dynamic_section_t(m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            case elf_t::SH_TYPE_DYNSYM: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<dynsym_section_t>(new dynsym_section_t(m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            case elf_t::SH_TYPE_RELA: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<relocation_section_t>(new relocation_section_t(true, m__io__raw_body.get(), this, m__root, m__is_le));
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
    }
    return m_body.get();
}

elf_t::endian_elf_t::section_header_t* elf_t::endian_elf_t::section_header_t::linked_section() {
    if (f_linked_section)
        return m_linked_section;
    n_linked_section = true;
    if ( ((linked_section_idx() != elf_t::SECTION_HEADER_IDX_SPECIAL_UNDEFINED) && (linked_section_idx() < _root()->header()->num_section_headers())) ) {
        n_linked_section = false;
        m_linked_section = _root()->header()->section_headers()->at(linked_section_idx());
    }
    f_linked_section = true;
    return m_linked_section;
}

std::string elf_t::endian_elf_t::section_header_t::name() {
    if (f_name)
        return m_name;
    kaitai::kstream *io = _root()->header()->section_names()->_io();
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
        return m_flags_obj.get();
    if (m__is_le == 1) {
        m_flags_obj = std::unique_ptr<section_header_flags_t>(new section_header_flags_t(flags(), m__io, this, m__root));
    } else {
        m_flags_obj = std::unique_ptr<section_header_flags_t>(new section_header_flags_t(flags(), m__io, this, m__root));
    }
    f_flags_obj = true;
    return m_flags_obj.get();
}

elf_t::endian_elf_t::relocation_section_t::relocation_section_t(bool p_has_addend, kaitai::kstream* p__io, elf_t::endian_elf_t::section_header_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_has_addend = p_has_addend;
    m_entries = nullptr;
    _read();
}

void elf_t::endian_elf_t::relocation_section_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf/types/relocation_section");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::relocation_section_t::_read_le() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<relocation_section_entry_t>>>(new std::vector<std::unique_ptr<relocation_section_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<relocation_section_entry_t>(new relocation_section_entry_t(m__io, this, m__root, m__is_le))));
            i++;
        }
    }
}

void elf_t::endian_elf_t::relocation_section_t::_read_be() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<relocation_section_entry_t>>>(new std::vector<std::unique_ptr<relocation_section_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<relocation_section_entry_t>(new relocation_section_entry_t(m__io, this, m__root, m__is_le))));
            i++;
        }
    }
}

elf_t::endian_elf_t::relocation_section_t::~relocation_section_t() {
    _clean_up();
}

void elf_t::endian_elf_t::relocation_section_t::_clean_up() {
}

elf_t::endian_elf_t::dynamic_section_t::dynamic_section_t(kaitai::kstream* p__io, elf_t::endian_elf_t::section_header_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_entries = nullptr;
    f_is_string_table_linked = false;
    _read();
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
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<dynamic_section_entry_t>>>(new std::vector<std::unique_ptr<dynamic_section_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<dynamic_section_entry_t>(new dynamic_section_entry_t(m__io, this, m__root, m__is_le))));
            i++;
        }
    }
}

void elf_t::endian_elf_t::dynamic_section_t::_read_be() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<dynamic_section_entry_t>>>(new std::vector<std::unique_ptr<dynamic_section_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<dynamic_section_entry_t>(new dynamic_section_entry_t(m__io, this, m__root, m__is_le))));
            i++;
        }
    }
}

elf_t::endian_elf_t::dynamic_section_t::~dynamic_section_t() {
    _clean_up();
}

void elf_t::endian_elf_t::dynamic_section_t::_clean_up() {
}

bool elf_t::endian_elf_t::dynamic_section_t::is_string_table_linked() {
    if (f_is_string_table_linked)
        return m_is_string_table_linked;
    m_is_string_table_linked = _parent()->linked_section()->type() == elf_t::SH_TYPE_STRTAB;
    f_is_string_table_linked = true;
    return m_is_string_table_linked;
}

elf_t::endian_elf_t::dynsym_section_t::dynsym_section_t(kaitai::kstream* p__io, elf_t::endian_elf_t::section_header_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_entries = nullptr;
    f_is_string_table_linked = false;
    _read();
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
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<dynsym_section_entry_t>>>(new std::vector<std::unique_ptr<dynsym_section_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<dynsym_section_entry_t>(new dynsym_section_entry_t(m__io, this, m__root, m__is_le))));
            i++;
        }
    }
}

void elf_t::endian_elf_t::dynsym_section_t::_read_be() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<dynsym_section_entry_t>>>(new std::vector<std::unique_ptr<dynsym_section_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<dynsym_section_entry_t>(new dynsym_section_entry_t(m__io, this, m__root, m__is_le))));
            i++;
        }
    }
}

elf_t::endian_elf_t::dynsym_section_t::~dynsym_section_t() {
    _clean_up();
}

void elf_t::endian_elf_t::dynsym_section_t::_clean_up() {
}

bool elf_t::endian_elf_t::dynsym_section_t::is_string_table_linked() {
    if (f_is_string_table_linked)
        return m_is_string_table_linked;
    m_is_string_table_linked = _parent()->linked_section()->type() == elf_t::SH_TYPE_STRTAB;
    f_is_string_table_linked = true;
    return m_is_string_table_linked;
}

elf_t::endian_elf_t::relocation_section_entry_t::relocation_section_entry_t(kaitai::kstream* p__io, elf_t::endian_elf_t::relocation_section_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    _read();
}

void elf_t::endian_elf_t::relocation_section_entry_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf/types/relocation_section_entry");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::relocation_section_entry_t::_read_le() {
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
    n_info = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_info = false;
        m_info = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_info = false;
        m_info = m__io->read_u8le();
        break;
    }
    }
    n_addend = true;
    if (_parent()->has_addend()) {
        n_addend = false;
        n_addend = true;
        switch (_root()->bits()) {
        case elf_t::BITS_B32: {
            n_addend = false;
            m_addend = m__io->read_s4le();
            break;
        }
        case elf_t::BITS_B64: {
            n_addend = false;
            m_addend = m__io->read_s8le();
            break;
        }
        }
    }
}

void elf_t::endian_elf_t::relocation_section_entry_t::_read_be() {
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
    n_info = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_info = false;
        m_info = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_info = false;
        m_info = m__io->read_u8be();
        break;
    }
    }
    n_addend = true;
    if (_parent()->has_addend()) {
        n_addend = false;
        n_addend = true;
        switch (_root()->bits()) {
        case elf_t::BITS_B32: {
            n_addend = false;
            m_addend = m__io->read_s4be();
            break;
        }
        case elf_t::BITS_B64: {
            n_addend = false;
            m_addend = m__io->read_s8be();
            break;
        }
        }
    }
}

elf_t::endian_elf_t::relocation_section_entry_t::~relocation_section_entry_t() {
    _clean_up();
}

void elf_t::endian_elf_t::relocation_section_entry_t::_clean_up() {
    if (!n_offset) {
    }
    if (!n_info) {
    }
    if (!n_addend) {
    }
}

elf_t::endian_elf_t::dynsym_section_entry_t::dynsym_section_entry_t(kaitai::kstream* p__io, elf_t::endian_elf_t::dynsym_section_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    f_is_sh_idx_reserved = false;
    f_is_sh_idx_os = false;
    f_is_sh_idx_proc = false;
    f_size = false;
    f_visibility = false;
    f_value = false;
    f_name = false;
    f_sh_idx_special = false;
    _read();
}

void elf_t::endian_elf_t::dynsym_section_entry_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf/types/dynsym_section_entry");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::dynsym_section_entry_t::_read_le() {
    m_ofs_name = m__io->read_u4le();
    n_value_b32 = true;
    if (_root()->bits() == elf_t::BITS_B32) {
        n_value_b32 = false;
        m_value_b32 = m__io->read_u4le();
    }
    n_size_b32 = true;
    if (_root()->bits() == elf_t::BITS_B32) {
        n_size_b32 = false;
        m_size_b32 = m__io->read_u4le();
    }
    m_bind = static_cast<elf_t::symbol_binding_t>(m__io->read_bits_int_be(4));
    m_type = static_cast<elf_t::symbol_type_t>(m__io->read_bits_int_be(4));
    m__io->align_to_byte();
    m_other = m__io->read_u1();
    m_sh_idx = m__io->read_u2le();
    n_value_b64 = true;
    if (_root()->bits() == elf_t::BITS_B64) {
        n_value_b64 = false;
        m_value_b64 = m__io->read_u8le();
    }
    n_size_b64 = true;
    if (_root()->bits() == elf_t::BITS_B64) {
        n_size_b64 = false;
        m_size_b64 = m__io->read_u8le();
    }
}

void elf_t::endian_elf_t::dynsym_section_entry_t::_read_be() {
    m_ofs_name = m__io->read_u4be();
    n_value_b32 = true;
    if (_root()->bits() == elf_t::BITS_B32) {
        n_value_b32 = false;
        m_value_b32 = m__io->read_u4be();
    }
    n_size_b32 = true;
    if (_root()->bits() == elf_t::BITS_B32) {
        n_size_b32 = false;
        m_size_b32 = m__io->read_u4be();
    }
    m_bind = static_cast<elf_t::symbol_binding_t>(m__io->read_bits_int_be(4));
    m_type = static_cast<elf_t::symbol_type_t>(m__io->read_bits_int_be(4));
    m__io->align_to_byte();
    m_other = m__io->read_u1();
    m_sh_idx = m__io->read_u2be();
    n_value_b64 = true;
    if (_root()->bits() == elf_t::BITS_B64) {
        n_value_b64 = false;
        m_value_b64 = m__io->read_u8be();
    }
    n_size_b64 = true;
    if (_root()->bits() == elf_t::BITS_B64) {
        n_size_b64 = false;
        m_size_b64 = m__io->read_u8be();
    }
}

elf_t::endian_elf_t::dynsym_section_entry_t::~dynsym_section_entry_t() {
    _clean_up();
}

void elf_t::endian_elf_t::dynsym_section_entry_t::_clean_up() {
    if (!n_value_b32) {
    }
    if (!n_size_b32) {
    }
    if (!n_value_b64) {
    }
    if (!n_size_b64) {
    }
    if (f_name && !n_name) {
    }
}

bool elf_t::endian_elf_t::dynsym_section_entry_t::is_sh_idx_reserved() {
    if (f_is_sh_idx_reserved)
        return m_is_sh_idx_reserved;
    m_is_sh_idx_reserved =  ((sh_idx() >= _root()->sh_idx_lo_reserved()) && (sh_idx() <= _root()->sh_idx_hi_reserved())) ;
    f_is_sh_idx_reserved = true;
    return m_is_sh_idx_reserved;
}

bool elf_t::endian_elf_t::dynsym_section_entry_t::is_sh_idx_os() {
    if (f_is_sh_idx_os)
        return m_is_sh_idx_os;
    m_is_sh_idx_os =  ((sh_idx() >= _root()->sh_idx_lo_os()) && (sh_idx() <= _root()->sh_idx_hi_os())) ;
    f_is_sh_idx_os = true;
    return m_is_sh_idx_os;
}

bool elf_t::endian_elf_t::dynsym_section_entry_t::is_sh_idx_proc() {
    if (f_is_sh_idx_proc)
        return m_is_sh_idx_proc;
    m_is_sh_idx_proc =  ((sh_idx() >= _root()->sh_idx_lo_proc()) && (sh_idx() <= _root()->sh_idx_hi_proc())) ;
    f_is_sh_idx_proc = true;
    return m_is_sh_idx_proc;
}

uint64_t elf_t::endian_elf_t::dynsym_section_entry_t::size() {
    if (f_size)
        return m_size;
    m_size = ((_root()->bits() == elf_t::BITS_B32) ? (size_b32()) : (((_root()->bits() == elf_t::BITS_B64) ? (size_b64()) : (0))));
    f_size = true;
    return m_size;
}

elf_t::symbol_visibility_t elf_t::endian_elf_t::dynsym_section_entry_t::visibility() {
    if (f_visibility)
        return m_visibility;
    m_visibility = static_cast<elf_t::symbol_visibility_t>((other() & 3));
    f_visibility = true;
    return m_visibility;
}

uint64_t elf_t::endian_elf_t::dynsym_section_entry_t::value() {
    if (f_value)
        return m_value;
    m_value = ((_root()->bits() == elf_t::BITS_B32) ? (value_b32()) : (((_root()->bits() == elf_t::BITS_B64) ? (value_b64()) : (0))));
    f_value = true;
    return m_value;
}

std::string elf_t::endian_elf_t::dynsym_section_entry_t::name() {
    if (f_name)
        return m_name;
    n_name = true;
    if ( ((ofs_name() != 0) && (_parent()->is_string_table_linked())) ) {
        n_name = false;
        kaitai::kstream *io = static_cast<elf_t::endian_elf_t::strings_struct_t*>(_parent()->_parent()->linked_section()->body())->_io();
        std::streampos _pos = io->pos();
        io->seek(ofs_name());
        if (m__is_le == 1) {
            m_name = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), std::string("UTF-8"));
        } else {
            m_name = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), std::string("UTF-8"));
        }
        io->seek(_pos);
        f_name = true;
    }
    return m_name;
}

elf_t::section_header_idx_special_t elf_t::endian_elf_t::dynsym_section_entry_t::sh_idx_special() {
    if (f_sh_idx_special)
        return m_sh_idx_special;
    m_sh_idx_special = static_cast<elf_t::section_header_idx_special_t>(sh_idx());
    f_sh_idx_special = true;
    return m_sh_idx_special;
}

elf_t::endian_elf_t::note_section_entry_t::note_section_entry_t(kaitai::kstream* p__io, elf_t::endian_elf_t::note_section_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    _read();
}

void elf_t::endian_elf_t::note_section_entry_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf/types/note_section_entry");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::note_section_entry_t::_read_le() {
    m_len_name = m__io->read_u4le();
    m_len_descriptor = m__io->read_u4le();
    m_type = m__io->read_u4le();
    m_name = kaitai::kstream::bytes_terminate(m__io->read_bytes(len_name()), 0, false);
    m_name_padding = m__io->read_bytes(kaitai::kstream::mod(-(len_name()), 4));
    m_descriptor = m__io->read_bytes(len_descriptor());
    m_descriptor_padding = m__io->read_bytes(kaitai::kstream::mod(-(len_descriptor()), 4));
}

void elf_t::endian_elf_t::note_section_entry_t::_read_be() {
    m_len_name = m__io->read_u4be();
    m_len_descriptor = m__io->read_u4be();
    m_type = m__io->read_u4be();
    m_name = kaitai::kstream::bytes_terminate(m__io->read_bytes(len_name()), 0, false);
    m_name_padding = m__io->read_bytes(kaitai::kstream::mod(-(len_name()), 4));
    m_descriptor = m__io->read_bytes(len_descriptor());
    m_descriptor_padding = m__io->read_bytes(kaitai::kstream::mod(-(len_descriptor()), 4));
}

elf_t::endian_elf_t::note_section_entry_t::~note_section_entry_t() {
    _clean_up();
}

void elf_t::endian_elf_t::note_section_entry_t::_clean_up() {
}

elf_t::endian_elf_t::strings_struct_t::strings_struct_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_entries = nullptr;
    _read();
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
    m_entries = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("UTF-8"))));
            i++;
        }
    }
}

void elf_t::endian_elf_t::strings_struct_t::_read_be() {
    m_entries = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("UTF-8"))));
            i++;
        }
    }
}

elf_t::endian_elf_t::strings_struct_t::~strings_struct_t() {
    _clean_up();
}

void elf_t::endian_elf_t::strings_struct_t::_clean_up() {
}

std::vector<std::unique_ptr<elf_t::endian_elf_t::program_header_t>>* elf_t::endian_elf_t::program_headers() {
    if (f_program_headers)
        return m_program_headers.get();
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_program_headers());
    if (m__is_le == 1) {
        m__raw_program_headers = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
        m__io__raw_program_headers = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>>(new std::vector<std::unique_ptr<kaitai::kstream>>());
        m_program_headers = std::unique_ptr<std::vector<std::unique_ptr<program_header_t>>>(new std::vector<std::unique_ptr<program_header_t>>());
        const int l_program_headers = num_program_headers();
        for (int i = 0; i < l_program_headers; i++) {
            m__raw_program_headers->push_back(std::move(m__io->read_bytes(program_header_size())));
            kaitai::kstream* io__raw_program_headers = new kaitai::kstream(m__raw_program_headers->at(m__raw_program_headers->size() - 1));
            m__io__raw_program_headers->emplace_back(io__raw_program_headers);
            m_program_headers->push_back(std::move(std::unique_ptr<program_header_t>(new program_header_t(io__raw_program_headers, this, m__root, m__is_le))));
        }
    } else {
        m__raw_program_headers = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
        m__io__raw_program_headers = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>>(new std::vector<std::unique_ptr<kaitai::kstream>>());
        m_program_headers = std::unique_ptr<std::vector<std::unique_ptr<program_header_t>>>(new std::vector<std::unique_ptr<program_header_t>>());
        const int l_program_headers = num_program_headers();
        for (int i = 0; i < l_program_headers; i++) {
            m__raw_program_headers->push_back(std::move(m__io->read_bytes(program_header_size())));
            kaitai::kstream* io__raw_program_headers = new kaitai::kstream(m__raw_program_headers->at(m__raw_program_headers->size() - 1));
            m__io__raw_program_headers->emplace_back(io__raw_program_headers);
            m_program_headers->push_back(std::move(std::unique_ptr<program_header_t>(new program_header_t(io__raw_program_headers, this, m__root, m__is_le))));
        }
    }
    m__io->seek(_pos);
    f_program_headers = true;
    return m_program_headers.get();
}

std::vector<std::unique_ptr<elf_t::endian_elf_t::section_header_t>>* elf_t::endian_elf_t::section_headers() {
    if (f_section_headers)
        return m_section_headers.get();
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_section_headers());
    if (m__is_le == 1) {
        m__raw_section_headers = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
        m__io__raw_section_headers = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>>(new std::vector<std::unique_ptr<kaitai::kstream>>());
        m_section_headers = std::unique_ptr<std::vector<std::unique_ptr<section_header_t>>>(new std::vector<std::unique_ptr<section_header_t>>());
        const int l_section_headers = num_section_headers();
        for (int i = 0; i < l_section_headers; i++) {
            m__raw_section_headers->push_back(std::move(m__io->read_bytes(section_header_size())));
            kaitai::kstream* io__raw_section_headers = new kaitai::kstream(m__raw_section_headers->at(m__raw_section_headers->size() - 1));
            m__io__raw_section_headers->emplace_back(io__raw_section_headers);
            m_section_headers->push_back(std::move(std::unique_ptr<section_header_t>(new section_header_t(io__raw_section_headers, this, m__root, m__is_le))));
        }
    } else {
        m__raw_section_headers = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
        m__io__raw_section_headers = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>>(new std::vector<std::unique_ptr<kaitai::kstream>>());
        m_section_headers = std::unique_ptr<std::vector<std::unique_ptr<section_header_t>>>(new std::vector<std::unique_ptr<section_header_t>>());
        const int l_section_headers = num_section_headers();
        for (int i = 0; i < l_section_headers; i++) {
            m__raw_section_headers->push_back(std::move(m__io->read_bytes(section_header_size())));
            kaitai::kstream* io__raw_section_headers = new kaitai::kstream(m__raw_section_headers->at(m__raw_section_headers->size() - 1));
            m__io__raw_section_headers->emplace_back(io__raw_section_headers);
            m_section_headers->push_back(std::move(std::unique_ptr<section_header_t>(new section_header_t(io__raw_section_headers, this, m__root, m__is_le))));
        }
    }
    m__io->seek(_pos);
    f_section_headers = true;
    return m_section_headers.get();
}

elf_t::endian_elf_t::strings_struct_t* elf_t::endian_elf_t::section_names() {
    if (f_section_names)
        return m_section_names.get();
    n_section_names = true;
    if ( ((section_names_idx() != elf_t::SECTION_HEADER_IDX_SPECIAL_UNDEFINED) && (section_names_idx() < _root()->header()->num_section_headers())) ) {
        n_section_names = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(section_headers()->at(section_names_idx())->ofs_body());
        if (m__is_le == 1) {
            m__raw_section_names = m__io->read_bytes(section_headers()->at(section_names_idx())->len_body());
            m__io__raw_section_names = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_section_names));
            m_section_names = std::unique_ptr<strings_struct_t>(new strings_struct_t(m__io__raw_section_names.get(), this, m__root, m__is_le));
        } else {
            m__raw_section_names = m__io->read_bytes(section_headers()->at(section_names_idx())->len_body());
            m__io__raw_section_names = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_section_names));
            m_section_names = std::unique_ptr<strings_struct_t>(new strings_struct_t(m__io__raw_section_names.get(), this, m__root, m__is_le));
        }
        m__io->seek(_pos);
        f_section_names = true;
    }
    return m_section_names.get();
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
    _read();
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
    _read();
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

elf_t::phdr_type_flags_t::phdr_type_flags_t(uint32_t p_value, kaitai::kstream* p__io, elf_t::endian_elf_t::program_header_t* p__parent, elf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_value = p_value;
    f_read = false;
    f_write = false;
    f_execute = false;
    f_mask_proc = false;
    _read();
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

elf_t::dt_flag_values_t::dt_flag_values_t(uint32_t p_value, kaitai::kstream* p__io, elf_t::endian_elf_t::dynamic_section_entry_t* p__parent, elf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_value = p_value;
    f_bind_now = false;
    f_origin = false;
    f_textrel = false;
    f_static_tls = false;
    f_symbolic = false;
    _read();
}

void elf_t::dt_flag_values_t::_read() {
}

elf_t::dt_flag_values_t::~dt_flag_values_t() {
    _clean_up();
}

void elf_t::dt_flag_values_t::_clean_up() {
}

bool elf_t::dt_flag_values_t::bind_now() {
    if (f_bind_now)
        return m_bind_now;
    m_bind_now = (value() & 8) != 0;
    f_bind_now = true;
    return m_bind_now;
}

bool elf_t::dt_flag_values_t::origin() {
    if (f_origin)
        return m_origin;
    m_origin = (value() & 1) != 0;
    f_origin = true;
    return m_origin;
}

bool elf_t::dt_flag_values_t::textrel() {
    if (f_textrel)
        return m_textrel;
    m_textrel = (value() & 4) != 0;
    f_textrel = true;
    return m_textrel;
}

bool elf_t::dt_flag_values_t::static_tls() {
    if (f_static_tls)
        return m_static_tls;
    m_static_tls = (value() & 16) != 0;
    f_static_tls = true;
    return m_static_tls;
}

bool elf_t::dt_flag_values_t::symbolic() {
    if (f_symbolic)
        return m_symbolic;
    m_symbolic = (value() & 2) != 0;
    f_symbolic = true;
    return m_symbolic;
}

int32_t elf_t::sh_idx_lo_os() {
    if (f_sh_idx_lo_os)
        return m_sh_idx_lo_os;
    m_sh_idx_lo_os = 65312;
    f_sh_idx_lo_os = true;
    return m_sh_idx_lo_os;
}

int32_t elf_t::sh_idx_lo_reserved() {
    if (f_sh_idx_lo_reserved)
        return m_sh_idx_lo_reserved;
    m_sh_idx_lo_reserved = 65280;
    f_sh_idx_lo_reserved = true;
    return m_sh_idx_lo_reserved;
}

int32_t elf_t::sh_idx_hi_proc() {
    if (f_sh_idx_hi_proc)
        return m_sh_idx_hi_proc;
    m_sh_idx_hi_proc = 65311;
    f_sh_idx_hi_proc = true;
    return m_sh_idx_hi_proc;
}

int32_t elf_t::sh_idx_lo_proc() {
    if (f_sh_idx_lo_proc)
        return m_sh_idx_lo_proc;
    m_sh_idx_lo_proc = 65280;
    f_sh_idx_lo_proc = true;
    return m_sh_idx_lo_proc;
}

int32_t elf_t::sh_idx_hi_os() {
    if (f_sh_idx_hi_os)
        return m_sh_idx_hi_os;
    m_sh_idx_hi_os = 65343;
    f_sh_idx_hi_os = true;
    return m_sh_idx_hi_os;
}

int32_t elf_t::sh_idx_hi_reserved() {
    if (f_sh_idx_hi_reserved)
        return m_sh_idx_hi_reserved;
    m_sh_idx_hi_reserved = 65535;
    f_sh_idx_hi_reserved = true;
    return m_sh_idx_hi_reserved;
}

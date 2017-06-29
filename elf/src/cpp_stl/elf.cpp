// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "elf.h"

#include <stdexcept>

elf_t::elf_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, elf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void elf_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\x7F\x45\x4C\x46", 4));
    m_bits = static_cast<elf_t::bits_t>(m__io->read_u1());
    m_endian = static_cast<elf_t::endian_t>(m__io->read_u1());
    m_ei_version = m__io->read_u1();
    m_abi = static_cast<elf_t::os_abi_t>(m__io->read_u1());
    m_abi_version = m__io->read_u1();
    m_pad = m__io->read_bytes(7);
    m_header = new endian_elf_t(m__io, this, m__root);
}

elf_t::~elf_t() {
    delete m_header;
}

elf_t::endian_elf_t::endian_elf_t(kaitai::kstream *p_io, elf_t* p_parent, elf_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    m__is_le = -1;
    f_program_headers = false;
    f_section_headers = false;
    f_strings = false;
    _read();
}

void elf_t::endian_elf_t::_read() {
    switch (_root()->endian()) {
    case ENDIAN_LE:
        m__is_le = true;
        break;
    case ENDIAN_BE:
        m__is_le = false;
        break;
    }

    if (m__is_le == -1) {
        throw std::runtime_error("unable to decide on endianness");
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
    switch (_root()->bits()) {
    case BITS_B32:
        m_entry_point = m__io->read_u4le();
        break;
    case BITS_B64:
        m_entry_point = m__io->read_u8le();
        break;
    }
    switch (_root()->bits()) {
    case BITS_B32:
        m_program_header_offset = m__io->read_u4le();
        break;
    case BITS_B64:
        m_program_header_offset = m__io->read_u8le();
        break;
    }
    switch (_root()->bits()) {
    case BITS_B32:
        m_section_header_offset = m__io->read_u4le();
        break;
    case BITS_B64:
        m_section_header_offset = m__io->read_u8le();
        break;
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
    switch (_root()->bits()) {
    case BITS_B32:
        m_entry_point = m__io->read_u4be();
        break;
    case BITS_B64:
        m_entry_point = m__io->read_u8be();
        break;
    }
    switch (_root()->bits()) {
    case BITS_B32:
        m_program_header_offset = m__io->read_u4be();
        break;
    case BITS_B64:
        m_program_header_offset = m__io->read_u8be();
        break;
    }
    switch (_root()->bits()) {
    case BITS_B32:
        m_section_header_offset = m__io->read_u4be();
        break;
    case BITS_B64:
        m_section_header_offset = m__io->read_u8be();
        break;
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
    delete m__raw_program_headers;
    for (std::vector<program_header_t*>::iterator it = m_program_headers->begin(); it != m_program_headers->end(); ++it) {
        delete *it;
    }
    delete m_program_headers;
    delete m__raw_section_headers;
    for (std::vector<section_header_t*>::iterator it = m_section_headers->begin(); it != m_section_headers->end(); ++it) {
        delete *it;
    }
    delete m_section_headers;
    if (f_strings) {
        delete m__io__raw_strings;
        delete m_strings;
    }
}

elf_t::endian_elf_t::program_header_t::program_header_t(kaitai::kstream *p_io, elf_t::endian_elf_t* p_parent, elf_t *p_root, int p_is_le) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    m__is_le = p_is_le;
    _read();
}

void elf_t::endian_elf_t::program_header_t::_read() {

    if (m__is_le == -1) {
        throw std::runtime_error("unable to decide on endianness");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::program_header_t::_read_le() {
    m_type = static_cast<elf_t::ph_type_t>(m__io->read_u4le());
    n_flags64 = true;
    if (_root()->bits() == BITS_B64) {
        n_flags64 = false;
        m_flags64 = m__io->read_u4le();
    }
    switch (_root()->bits()) {
    case BITS_B32:
        m_offset = m__io->read_u4le();
        break;
    case BITS_B64:
        m_offset = m__io->read_u8le();
        break;
    }
    switch (_root()->bits()) {
    case BITS_B32:
        m_vaddr = m__io->read_u4le();
        break;
    case BITS_B64:
        m_vaddr = m__io->read_u8le();
        break;
    }
    switch (_root()->bits()) {
    case BITS_B32:
        m_paddr = m__io->read_u4le();
        break;
    case BITS_B64:
        m_paddr = m__io->read_u8le();
        break;
    }
    switch (_root()->bits()) {
    case BITS_B32:
        m_filesz = m__io->read_u4le();
        break;
    case BITS_B64:
        m_filesz = m__io->read_u8le();
        break;
    }
    switch (_root()->bits()) {
    case BITS_B32:
        m_memsz = m__io->read_u4le();
        break;
    case BITS_B64:
        m_memsz = m__io->read_u8le();
        break;
    }
    n_flags32 = true;
    if (_root()->bits() == BITS_B32) {
        n_flags32 = false;
        m_flags32 = m__io->read_u4le();
    }
    switch (_root()->bits()) {
    case BITS_B32:
        m_align = m__io->read_u4le();
        break;
    case BITS_B64:
        m_align = m__io->read_u8le();
        break;
    }
}

void elf_t::endian_elf_t::program_header_t::_read_be() {
    m_type = static_cast<elf_t::ph_type_t>(m__io->read_u4be());
    n_flags64 = true;
    if (_root()->bits() == BITS_B64) {
        n_flags64 = false;
        m_flags64 = m__io->read_u4be();
    }
    switch (_root()->bits()) {
    case BITS_B32:
        m_offset = m__io->read_u4be();
        break;
    case BITS_B64:
        m_offset = m__io->read_u8be();
        break;
    }
    switch (_root()->bits()) {
    case BITS_B32:
        m_vaddr = m__io->read_u4be();
        break;
    case BITS_B64:
        m_vaddr = m__io->read_u8be();
        break;
    }
    switch (_root()->bits()) {
    case BITS_B32:
        m_paddr = m__io->read_u4be();
        break;
    case BITS_B64:
        m_paddr = m__io->read_u8be();
        break;
    }
    switch (_root()->bits()) {
    case BITS_B32:
        m_filesz = m__io->read_u4be();
        break;
    case BITS_B64:
        m_filesz = m__io->read_u8be();
        break;
    }
    switch (_root()->bits()) {
    case BITS_B32:
        m_memsz = m__io->read_u4be();
        break;
    case BITS_B64:
        m_memsz = m__io->read_u8be();
        break;
    }
    n_flags32 = true;
    if (_root()->bits() == BITS_B32) {
        n_flags32 = false;
        m_flags32 = m__io->read_u4be();
    }
    switch (_root()->bits()) {
    case BITS_B32:
        m_align = m__io->read_u4be();
        break;
    case BITS_B64:
        m_align = m__io->read_u8be();
        break;
    }
}

elf_t::endian_elf_t::program_header_t::~program_header_t() {
}

elf_t::endian_elf_t::section_header_t::section_header_t(kaitai::kstream *p_io, elf_t::endian_elf_t* p_parent, elf_t *p_root, int p_is_le) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    m__is_le = p_is_le;
    f_body = false;
    f_name = false;
    _read();
}

void elf_t::endian_elf_t::section_header_t::_read() {

    if (m__is_le == -1) {
        throw std::runtime_error("unable to decide on endianness");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::section_header_t::_read_le() {
    m_name_offset = m__io->read_u4le();
    m_type = static_cast<elf_t::sh_type_t>(m__io->read_u4le());
    switch (_root()->bits()) {
    case BITS_B32:
        m_flags = m__io->read_u4le();
        break;
    case BITS_B64:
        m_flags = m__io->read_u8le();
        break;
    }
    switch (_root()->bits()) {
    case BITS_B32:
        m_addr = m__io->read_u4le();
        break;
    case BITS_B64:
        m_addr = m__io->read_u8le();
        break;
    }
    switch (_root()->bits()) {
    case BITS_B32:
        m_offset = m__io->read_u4le();
        break;
    case BITS_B64:
        m_offset = m__io->read_u8le();
        break;
    }
    switch (_root()->bits()) {
    case BITS_B32:
        m_size = m__io->read_u4le();
        break;
    case BITS_B64:
        m_size = m__io->read_u8le();
        break;
    }
    m_linked_section_idx = m__io->read_u4le();
    m_info = m__io->read_bytes(4);
    switch (_root()->bits()) {
    case BITS_B32:
        m_align = m__io->read_u4le();
        break;
    case BITS_B64:
        m_align = m__io->read_u8le();
        break;
    }
    switch (_root()->bits()) {
    case BITS_B32:
        m_entry_size = m__io->read_u4le();
        break;
    case BITS_B64:
        m_entry_size = m__io->read_u8le();
        break;
    }
}

void elf_t::endian_elf_t::section_header_t::_read_be() {
    m_name_offset = m__io->read_u4be();
    m_type = static_cast<elf_t::sh_type_t>(m__io->read_u4be());
    switch (_root()->bits()) {
    case BITS_B32:
        m_flags = m__io->read_u4be();
        break;
    case BITS_B64:
        m_flags = m__io->read_u8be();
        break;
    }
    switch (_root()->bits()) {
    case BITS_B32:
        m_addr = m__io->read_u4be();
        break;
    case BITS_B64:
        m_addr = m__io->read_u8be();
        break;
    }
    switch (_root()->bits()) {
    case BITS_B32:
        m_offset = m__io->read_u4be();
        break;
    case BITS_B64:
        m_offset = m__io->read_u8be();
        break;
    }
    switch (_root()->bits()) {
    case BITS_B32:
        m_size = m__io->read_u4be();
        break;
    case BITS_B64:
        m_size = m__io->read_u8be();
        break;
    }
    m_linked_section_idx = m__io->read_u4be();
    m_info = m__io->read_bytes(4);
    switch (_root()->bits()) {
    case BITS_B32:
        m_align = m__io->read_u4be();
        break;
    case BITS_B64:
        m_align = m__io->read_u8be();
        break;
    }
    switch (_root()->bits()) {
    case BITS_B32:
        m_entry_size = m__io->read_u4be();
        break;
    case BITS_B64:
        m_entry_size = m__io->read_u8be();
        break;
    }
}

elf_t::endian_elf_t::section_header_t::~section_header_t() {
}

std::string elf_t::endian_elf_t::section_header_t::body() {
    if (f_body)
        return m_body;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(offset());
    if (m__is_le == 1) {
        m_body = io->read_bytes(size());
    } else {
        m_body = io->read_bytes(size());
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
    io->seek(name_offset());
    if (m__is_le == 1) {
        m_name = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), std::string("ASCII"));
    } else {
        m_name = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), std::string("ASCII"));
    }
    io->seek(_pos);
    f_name = true;
    return m_name;
}

elf_t::endian_elf_t::strings_struct_t::strings_struct_t(kaitai::kstream *p_io, elf_t::endian_elf_t* p_parent, elf_t *p_root, int p_is_le) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    m__is_le = p_is_le;
    _read();
}

void elf_t::endian_elf_t::strings_struct_t::_read() {

    if (m__is_le == -1) {
        throw std::runtime_error("unable to decide on endianness");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::strings_struct_t::_read_le() {
    m_entries = new std::vector<std::string>();
    while (!m__io->is_eof()) {
        m_entries->push_back(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ASCII")));
    }
}

void elf_t::endian_elf_t::strings_struct_t::_read_be() {
    m_entries = new std::vector<std::string>();
    while (!m__io->is_eof()) {
        m_entries->push_back(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ASCII")));
    }
}

elf_t::endian_elf_t::strings_struct_t::~strings_struct_t() {
    delete m_entries;
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
        m_program_headers = new std::vector<program_header_t*>();
        m_program_headers->reserve(l_program_headers);
        for (int i = 0; i < l_program_headers; i++) {
            m__raw_program_headers->push_back(m__io->read_bytes(program_header_entry_size()));
            m__io__raw_program_headers = new kaitai::kstream(m__raw_program_headers->at(m__raw_program_headers->size() - 1));
            m_program_headers->push_back(new program_header_t(m__io__raw_program_headers, this, m__root, m__is_le));
        }
    } else {
        int l_program_headers = qty_program_header();
        m__raw_program_headers = new std::vector<std::string>();
        m__raw_program_headers->reserve(l_program_headers);
        m_program_headers = new std::vector<program_header_t*>();
        m_program_headers->reserve(l_program_headers);
        for (int i = 0; i < l_program_headers; i++) {
            m__raw_program_headers->push_back(m__io->read_bytes(program_header_entry_size()));
            m__io__raw_program_headers = new kaitai::kstream(m__raw_program_headers->at(m__raw_program_headers->size() - 1));
            m_program_headers->push_back(new program_header_t(m__io__raw_program_headers, this, m__root, m__is_le));
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
        m_section_headers = new std::vector<section_header_t*>();
        m_section_headers->reserve(l_section_headers);
        for (int i = 0; i < l_section_headers; i++) {
            m__raw_section_headers->push_back(m__io->read_bytes(section_header_entry_size()));
            m__io__raw_section_headers = new kaitai::kstream(m__raw_section_headers->at(m__raw_section_headers->size() - 1));
            m_section_headers->push_back(new section_header_t(m__io__raw_section_headers, this, m__root, m__is_le));
        }
    } else {
        int l_section_headers = qty_section_header();
        m__raw_section_headers = new std::vector<std::string>();
        m__raw_section_headers->reserve(l_section_headers);
        m_section_headers = new std::vector<section_header_t*>();
        m_section_headers->reserve(l_section_headers);
        for (int i = 0; i < l_section_headers; i++) {
            m__raw_section_headers->push_back(m__io->read_bytes(section_header_entry_size()));
            m__io__raw_section_headers = new kaitai::kstream(m__raw_section_headers->at(m__raw_section_headers->size() - 1));
            m_section_headers->push_back(new section_header_t(m__io__raw_section_headers, this, m__root, m__is_le));
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
    m__io->seek(section_headers()->at(section_names_idx())->offset());
    if (m__is_le == 1) {
        m__raw_strings = m__io->read_bytes(section_headers()->at(section_names_idx())->size());
        m__io__raw_strings = new kaitai::kstream(m__raw_strings);
        m_strings = new strings_struct_t(m__io__raw_strings, this, m__root, m__is_le);
    } else {
        m__raw_strings = m__io->read_bytes(section_headers()->at(section_names_idx())->size());
        m__io__raw_strings = new kaitai::kstream(m__raw_strings);
        m_strings = new strings_struct_t(m__io__raw_strings, this, m__root, m__is_le);
    }
    m__io->seek(_pos);
    f_strings = true;
    return m_strings;
}

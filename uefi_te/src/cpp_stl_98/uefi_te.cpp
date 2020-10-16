// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "uefi_te.h"
#include "kaitai/exceptions.h"

uefi_te_t::uefi_te_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, uefi_te_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
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
    int l_sections = te_hdr()->num_sections();
    m_sections = new std::vector<section_t*>();
    m_sections->reserve(l_sections);
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

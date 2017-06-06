// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "cpio_old_le.h"



cpio_old_le_t::cpio_old_le_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, cpio_old_le_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void cpio_old_le_t::_read() {
    m_files = new std::vector<file_t*>();
    while (!m__io->is_eof()) {
        m_files->push_back(new file_t(m__io, this, m__root));
    }
}

cpio_old_le_t::~cpio_old_le_t() {
    for (std::vector<file_t*>::iterator it = m_files->begin(); it != m_files->end(); ++it) {
        delete *it;
    }
    delete m_files;
}

cpio_old_le_t::file_t::file_t(kaitai::kstream *p_io, cpio_old_le_t* p_parent, cpio_old_le_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void cpio_old_le_t::file_t::_read() {
    m_header = new file_header_t(m__io, this, m__root);
    m_path_name = m__io->read_bytes((header()->path_name_size() - 1));
    m_string_terminator = m__io->ensure_fixed_contents(std::string("\x00", 1));
    n_path_name_padding = true;
    if (kaitai::kstream::mod(header()->path_name_size(), 2) == 1) {
        n_path_name_padding = false;
        m_path_name_padding = m__io->ensure_fixed_contents(std::string("\x00", 1));
    }
    m_file_data = m__io->read_bytes(header()->file_size()->value());
    n_file_data_padding = true;
    if (kaitai::kstream::mod(header()->file_size()->value(), 2) == 1) {
        n_file_data_padding = false;
        m_file_data_padding = m__io->ensure_fixed_contents(std::string("\x00", 1));
    }
    n_end_of_file_padding = true;
    if ( ((path_name() == std::string("\x54\x52\x41\x49\x4C\x45\x52\x21\x21\x21", 10)) && (header()->file_size()->value() == 0)) ) {
        n_end_of_file_padding = false;
        m_end_of_file_padding = m__io->read_bytes_full();
    }
}

cpio_old_le_t::file_t::~file_t() {
    delete m_header;
}

cpio_old_le_t::file_header_t::file_header_t(kaitai::kstream *p_io, cpio_old_le_t::file_t* p_parent, cpio_old_le_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void cpio_old_le_t::file_header_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\xC7\x71", 2));
    m_device_number = m__io->read_u2le();
    m_inode_number = m__io->read_u2le();
    m_mode = m__io->read_u2le();
    m_user_id = m__io->read_u2le();
    m_group_id = m__io->read_u2le();
    m_number_of_links = m__io->read_u2le();
    m_r_device_number = m__io->read_u2le();
    m_modification_time = new four_byte_unsigned_integer_t(m__io, this, m__root);
    m_path_name_size = m__io->read_u2le();
    m_file_size = new four_byte_unsigned_integer_t(m__io, this, m__root);
}

cpio_old_le_t::file_header_t::~file_header_t() {
    delete m_modification_time;
    delete m_file_size;
}

cpio_old_le_t::four_byte_unsigned_integer_t::four_byte_unsigned_integer_t(kaitai::kstream *p_io, cpio_old_le_t::file_header_t* p_parent, cpio_old_le_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_value = false;
    _read();
}

void cpio_old_le_t::four_byte_unsigned_integer_t::_read() {
    m_most_significant_bits = m__io->read_u2le();
    m_least_significant_bits = m__io->read_u2le();
}

cpio_old_le_t::four_byte_unsigned_integer_t::~four_byte_unsigned_integer_t() {
}

int32_t cpio_old_le_t::four_byte_unsigned_integer_t::value() {
    if (f_value)
        return m_value;
    m_value = (least_significant_bits() + (most_significant_bits() << 16));
    f_value = true;
    return m_value;
}

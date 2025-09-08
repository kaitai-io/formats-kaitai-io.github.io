// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "cpio_old_le.h"
#include "kaitai/exceptions.h"

cpio_old_le_t::cpio_old_le_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, cpio_old_le_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_files = nullptr;
    _read();
}

void cpio_old_le_t::_read() {
    m_files = std::unique_ptr<std::vector<std::unique_ptr<file_t>>>(new std::vector<std::unique_ptr<file_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_files->push_back(std::move(std::unique_ptr<file_t>(new file_t(m__io, this, m__root))));
            i++;
        }
    }
}

cpio_old_le_t::~cpio_old_le_t() {
    _clean_up();
}

void cpio_old_le_t::_clean_up() {
}

cpio_old_le_t::file_t::file_t(kaitai::kstream* p__io, cpio_old_le_t* p__parent, cpio_old_le_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header = nullptr;
    _read();
}

void cpio_old_le_t::file_t::_read() {
    m_header = std::unique_ptr<file_header_t>(new file_header_t(m__io, this, m__root));
    m_path_name = m__io->read_bytes(header()->path_name_size() - 1);
    m_string_terminator = m__io->read_bytes(1);
    if (!(m_string_terminator == std::string("\x00", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00", 1), m_string_terminator, m__io, std::string("/types/file/seq/2"));
    }
    n_path_name_padding = true;
    if (kaitai::kstream::mod(header()->path_name_size(), 2) == 1) {
        n_path_name_padding = false;
        m_path_name_padding = m__io->read_bytes(1);
        if (!(m_path_name_padding == std::string("\x00", 1))) {
            throw kaitai::validation_not_equal_error<std::string>(std::string("\x00", 1), m_path_name_padding, m__io, std::string("/types/file/seq/3"));
        }
    }
    m_file_data = m__io->read_bytes(header()->file_size()->value());
    n_file_data_padding = true;
    if (kaitai::kstream::mod(header()->file_size()->value(), 2) == 1) {
        n_file_data_padding = false;
        m_file_data_padding = m__io->read_bytes(1);
        if (!(m_file_data_padding == std::string("\x00", 1))) {
            throw kaitai::validation_not_equal_error<std::string>(std::string("\x00", 1), m_file_data_padding, m__io, std::string("/types/file/seq/5"));
        }
    }
    n_end_of_file_padding = true;
    if ( ((path_name() == std::string("\x54\x52\x41\x49\x4C\x45\x52\x21\x21\x21", 10)) && (header()->file_size()->value() == 0)) ) {
        n_end_of_file_padding = false;
        m_end_of_file_padding = m__io->read_bytes_full();
    }
}

cpio_old_le_t::file_t::~file_t() {
    _clean_up();
}

void cpio_old_le_t::file_t::_clean_up() {
    if (!n_path_name_padding) {
    }
    if (!n_file_data_padding) {
    }
    if (!n_end_of_file_padding) {
    }
}

cpio_old_le_t::file_header_t::file_header_t(kaitai::kstream* p__io, cpio_old_le_t::file_t* p__parent, cpio_old_le_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_modification_time = nullptr;
    m_file_size = nullptr;
    _read();
}

void cpio_old_le_t::file_header_t::_read() {
    m_magic = m__io->read_bytes(2);
    if (!(m_magic == std::string("\xC7\x71", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xC7\x71", 2), m_magic, m__io, std::string("/types/file_header/seq/0"));
    }
    m_device_number = m__io->read_u2le();
    m_inode_number = m__io->read_u2le();
    m_mode = m__io->read_u2le();
    m_user_id = m__io->read_u2le();
    m_group_id = m__io->read_u2le();
    m_number_of_links = m__io->read_u2le();
    m_r_device_number = m__io->read_u2le();
    m_modification_time = std::unique_ptr<four_byte_unsigned_integer_t>(new four_byte_unsigned_integer_t(m__io, this, m__root));
    m_path_name_size = m__io->read_u2le();
    m_file_size = std::unique_ptr<four_byte_unsigned_integer_t>(new four_byte_unsigned_integer_t(m__io, this, m__root));
}

cpio_old_le_t::file_header_t::~file_header_t() {
    _clean_up();
}

void cpio_old_le_t::file_header_t::_clean_up() {
}

cpio_old_le_t::four_byte_unsigned_integer_t::four_byte_unsigned_integer_t(kaitai::kstream* p__io, cpio_old_le_t::file_header_t* p__parent, cpio_old_le_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_value = false;
    _read();
}

void cpio_old_le_t::four_byte_unsigned_integer_t::_read() {
    m_most_significant_bits = m__io->read_u2le();
    m_least_significant_bits = m__io->read_u2le();
}

cpio_old_le_t::four_byte_unsigned_integer_t::~four_byte_unsigned_integer_t() {
    _clean_up();
}

void cpio_old_le_t::four_byte_unsigned_integer_t::_clean_up() {
}

int32_t cpio_old_le_t::four_byte_unsigned_integer_t::value() {
    if (f_value)
        return m_value;
    f_value = true;
    m_value = least_significant_bits() + (most_significant_bits() << 16);
    return m_value;
}

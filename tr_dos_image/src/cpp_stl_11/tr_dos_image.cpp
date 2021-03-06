// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "tr_dos_image.h"
#include "kaitai/exceptions.h"

tr_dos_image_t::tr_dos_image_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, tr_dos_image_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_files = nullptr;
    m_volume_info = nullptr;
    f_volume_info = false;
    _read();
}

void tr_dos_image_t::_read() {
    m_files = std::unique_ptr<std::vector<std::unique_ptr<file_t>>>(new std::vector<std::unique_ptr<file_t>>());
    {
        int i = 0;
        file_t* _;
        do {
            _ = new file_t(m__io, this, m__root);
            m_files->push_back(std::move(std::unique_ptr<file_t>(_)));
            i++;
        } while (!(_->is_terminator()));
    }
}

tr_dos_image_t::~tr_dos_image_t() {
    _clean_up();
}

void tr_dos_image_t::_clean_up() {
    if (f_volume_info) {
    }
}

tr_dos_image_t::volume_info_t::volume_info_t(kaitai::kstream* p__io, tr_dos_image_t* p__parent, tr_dos_image_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_num_tracks = false;
    f_num_sides = false;
    _read();
}

void tr_dos_image_t::volume_info_t::_read() {
    m_catalog_end = m__io->read_bytes(1);
    if (!(catalog_end() == std::string("\x00", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00", 1), catalog_end(), _io(), std::string("/types/volume_info/seq/0"));
    }
    m_unused = m__io->read_bytes(224);
    m_first_free_sector_sector = m__io->read_u1();
    m_first_free_sector_track = m__io->read_u1();
    m_disk_type = static_cast<tr_dos_image_t::disk_type_t>(m__io->read_u1());
    m_num_files = m__io->read_u1();
    m_num_free_sectors = m__io->read_u2le();
    m_tr_dos_id = m__io->read_bytes(1);
    if (!(tr_dos_id() == std::string("\x10", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x10", 1), tr_dos_id(), _io(), std::string("/types/volume_info/seq/7"));
    }
    m_unused_2 = m__io->read_bytes(2);
    m_password = m__io->read_bytes(9);
    m_unused_3 = m__io->read_bytes(1);
    m_num_deleted_files = m__io->read_u1();
    m_label = m__io->read_bytes(8);
    m_unused_4 = m__io->read_bytes(3);
}

tr_dos_image_t::volume_info_t::~volume_info_t() {
    _clean_up();
}

void tr_dos_image_t::volume_info_t::_clean_up() {
}

int8_t tr_dos_image_t::volume_info_t::num_tracks() {
    if (f_num_tracks)
        return m_num_tracks;
    m_num_tracks = (((disk_type() & 1) != 0) ? (40) : (80));
    f_num_tracks = true;
    return m_num_tracks;
}

int8_t tr_dos_image_t::volume_info_t::num_sides() {
    if (f_num_sides)
        return m_num_sides;
    m_num_sides = (((disk_type() & 8) != 0) ? (1) : (2));
    f_num_sides = true;
    return m_num_sides;
}

tr_dos_image_t::position_and_length_code_t::position_and_length_code_t(kaitai::kstream* p__io, tr_dos_image_t::file_t* p__parent, tr_dos_image_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void tr_dos_image_t::position_and_length_code_t::_read() {
    m_start_address = m__io->read_u2le();
    m_length = m__io->read_u2le();
}

tr_dos_image_t::position_and_length_code_t::~position_and_length_code_t() {
    _clean_up();
}

void tr_dos_image_t::position_and_length_code_t::_clean_up() {
}

tr_dos_image_t::filename_t::filename_t(kaitai::kstream* p__io, tr_dos_image_t::file_t* p__parent, tr_dos_image_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_first_byte = false;
    _read();
}

void tr_dos_image_t::filename_t::_read() {
    m_name = m__io->read_bytes(8);
}

tr_dos_image_t::filename_t::~filename_t() {
    _clean_up();
}

void tr_dos_image_t::filename_t::_clean_up() {
    if (f_first_byte) {
    }
}

uint8_t tr_dos_image_t::filename_t::first_byte() {
    if (f_first_byte)
        return m_first_byte;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_first_byte = m__io->read_u1();
    m__io->seek(_pos);
    f_first_byte = true;
    return m_first_byte;
}

tr_dos_image_t::position_and_length_print_t::position_and_length_print_t(kaitai::kstream* p__io, tr_dos_image_t::file_t* p__parent, tr_dos_image_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void tr_dos_image_t::position_and_length_print_t::_read() {
    m_extent_no = m__io->read_u1();
    m_reserved = m__io->read_u1();
    m_length = m__io->read_u2le();
}

tr_dos_image_t::position_and_length_print_t::~position_and_length_print_t() {
    _clean_up();
}

void tr_dos_image_t::position_and_length_print_t::_clean_up() {
}

tr_dos_image_t::position_and_length_generic_t::position_and_length_generic_t(kaitai::kstream* p__io, tr_dos_image_t::file_t* p__parent, tr_dos_image_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void tr_dos_image_t::position_and_length_generic_t::_read() {
    m_reserved = m__io->read_u2le();
    m_length = m__io->read_u2le();
}

tr_dos_image_t::position_and_length_generic_t::~position_and_length_generic_t() {
    _clean_up();
}

void tr_dos_image_t::position_and_length_generic_t::_clean_up() {
}

tr_dos_image_t::position_and_length_basic_t::position_and_length_basic_t(kaitai::kstream* p__io, tr_dos_image_t::file_t* p__parent, tr_dos_image_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void tr_dos_image_t::position_and_length_basic_t::_read() {
    m_program_and_data_length = m__io->read_u2le();
    m_program_length = m__io->read_u2le();
}

tr_dos_image_t::position_and_length_basic_t::~position_and_length_basic_t() {
    _clean_up();
}

void tr_dos_image_t::position_and_length_basic_t::_clean_up() {
}

tr_dos_image_t::file_t::file_t(kaitai::kstream* p__io, tr_dos_image_t* p__parent, tr_dos_image_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name = nullptr;
    m__io__raw_name = nullptr;
    f_is_deleted = false;
    f_is_terminator = false;
    f_contents = false;
    _read();
}

void tr_dos_image_t::file_t::_read() {
    m__raw_name = m__io->read_bytes(8);
    m__io__raw_name = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_name));
    m_name = std::unique_ptr<filename_t>(new filename_t(m__io__raw_name.get(), this, m__root));
    m_extension = m__io->read_u1();
    switch (extension()) {
    case 66: {
        m_position_and_length = std::unique_ptr<position_and_length_basic_t>(new position_and_length_basic_t(m__io, this, m__root));
        break;
    }
    case 67: {
        m_position_and_length = std::unique_ptr<position_and_length_code_t>(new position_and_length_code_t(m__io, this, m__root));
        break;
    }
    case 35: {
        m_position_and_length = std::unique_ptr<position_and_length_print_t>(new position_and_length_print_t(m__io, this, m__root));
        break;
    }
    default: {
        m_position_and_length = std::unique_ptr<position_and_length_generic_t>(new position_and_length_generic_t(m__io, this, m__root));
        break;
    }
    }
    m_length_sectors = m__io->read_u1();
    m_starting_sector = m__io->read_u1();
    m_starting_track = m__io->read_u1();
}

tr_dos_image_t::file_t::~file_t() {
    _clean_up();
}

void tr_dos_image_t::file_t::_clean_up() {
    if (f_contents) {
    }
}

bool tr_dos_image_t::file_t::is_deleted() {
    if (f_is_deleted)
        return m_is_deleted;
    m_is_deleted = name()->first_byte() == 1;
    f_is_deleted = true;
    return m_is_deleted;
}

bool tr_dos_image_t::file_t::is_terminator() {
    if (f_is_terminator)
        return m_is_terminator;
    m_is_terminator = name()->first_byte() == 0;
    f_is_terminator = true;
    return m_is_terminator;
}

std::string tr_dos_image_t::file_t::contents() {
    if (f_contents)
        return m_contents;
    std::streampos _pos = m__io->pos();
    m__io->seek((((starting_track() * 256) * 16) + (starting_sector() * 256)));
    m_contents = m__io->read_bytes((length_sectors() * 256));
    m__io->seek(_pos);
    f_contents = true;
    return m_contents;
}

tr_dos_image_t::volume_info_t* tr_dos_image_t::volume_info() {
    if (f_volume_info)
        return m_volume_info.get();
    std::streampos _pos = m__io->pos();
    m__io->seek(2048);
    m_volume_info = std::unique_ptr<volume_info_t>(new volume_info_t(m__io, this, m__root));
    m__io->seek(_pos);
    f_volume_info = true;
    return m_volume_info.get();
}

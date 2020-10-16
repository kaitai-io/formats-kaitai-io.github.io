// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "shapefile_index.h"
#include "kaitai/exceptions.h"

shapefile_index_t::shapefile_index_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, shapefile_index_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = nullptr;
    m_records = nullptr;
    _read();
}

void shapefile_index_t::_read() {
    m_header = std::unique_ptr<file_header_t>(new file_header_t(m__io, this, m__root));
    m_records = std::unique_ptr<std::vector<std::unique_ptr<record_t>>>(new std::vector<std::unique_ptr<record_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_records->push_back(std::move(std::unique_ptr<record_t>(new record_t(m__io, this, m__root))));
            i++;
        }
    }
}

shapefile_index_t::~shapefile_index_t() {
    _clean_up();
}

void shapefile_index_t::_clean_up() {
}

shapefile_index_t::file_header_t::file_header_t(kaitai::kstream* p__io, shapefile_index_t* p__parent, shapefile_index_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bounding_box = nullptr;
    _read();
}

void shapefile_index_t::file_header_t::_read() {
    m_file_code = m__io->read_bytes(4);
    if (!(file_code() == std::string("\x00\x00\x27\x0A", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x27\x0A", 4), file_code(), _io(), std::string("/types/file_header/seq/0"));
    }
    m_unused_field_1 = m__io->read_bytes(4);
    if (!(unused_field_1() == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), unused_field_1(), _io(), std::string("/types/file_header/seq/1"));
    }
    m_unused_field_2 = m__io->read_bytes(4);
    if (!(unused_field_2() == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), unused_field_2(), _io(), std::string("/types/file_header/seq/2"));
    }
    m_unused_field_3 = m__io->read_bytes(4);
    if (!(unused_field_3() == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), unused_field_3(), _io(), std::string("/types/file_header/seq/3"));
    }
    m_unused_field_4 = m__io->read_bytes(4);
    if (!(unused_field_4() == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), unused_field_4(), _io(), std::string("/types/file_header/seq/4"));
    }
    m_unused_field_5 = m__io->read_bytes(4);
    if (!(unused_field_5() == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), unused_field_5(), _io(), std::string("/types/file_header/seq/5"));
    }
    m_file_length = m__io->read_s4be();
    m_version = m__io->read_bytes(4);
    if (!(version() == std::string("\xE8\x03\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xE8\x03\x00\x00", 4), version(), _io(), std::string("/types/file_header/seq/7"));
    }
    m_shape_type = static_cast<shapefile_index_t::shape_type_t>(m__io->read_s4le());
    m_bounding_box = std::unique_ptr<bounding_box_x_y_z_m_t>(new bounding_box_x_y_z_m_t(m__io, this, m__root));
}

shapefile_index_t::file_header_t::~file_header_t() {
    _clean_up();
}

void shapefile_index_t::file_header_t::_clean_up() {
}

shapefile_index_t::record_t::record_t(kaitai::kstream* p__io, shapefile_index_t* p__parent, shapefile_index_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void shapefile_index_t::record_t::_read() {
    m_offset = m__io->read_s4be();
    m_content_length = m__io->read_s4be();
}

shapefile_index_t::record_t::~record_t() {
    _clean_up();
}

void shapefile_index_t::record_t::_clean_up() {
}

shapefile_index_t::bounding_box_x_y_z_m_t::bounding_box_x_y_z_m_t(kaitai::kstream* p__io, shapefile_index_t::file_header_t* p__parent, shapefile_index_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_x = nullptr;
    m_y = nullptr;
    m_z = nullptr;
    m_m = nullptr;
    _read();
}

void shapefile_index_t::bounding_box_x_y_z_m_t::_read() {
    m_x = std::unique_ptr<bounds_min_max_t>(new bounds_min_max_t(m__io, this, m__root));
    m_y = std::unique_ptr<bounds_min_max_t>(new bounds_min_max_t(m__io, this, m__root));
    m_z = std::unique_ptr<bounds_min_max_t>(new bounds_min_max_t(m__io, this, m__root));
    m_m = std::unique_ptr<bounds_min_max_t>(new bounds_min_max_t(m__io, this, m__root));
}

shapefile_index_t::bounding_box_x_y_z_m_t::~bounding_box_x_y_z_m_t() {
    _clean_up();
}

void shapefile_index_t::bounding_box_x_y_z_m_t::_clean_up() {
}

shapefile_index_t::bounds_min_max_t::bounds_min_max_t(kaitai::kstream* p__io, shapefile_index_t::bounding_box_x_y_z_m_t* p__parent, shapefile_index_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void shapefile_index_t::bounds_min_max_t::_read() {
    m_min = m__io->read_f8be();
    m_max = m__io->read_f8be();
}

shapefile_index_t::bounds_min_max_t::~bounds_min_max_t() {
    _clean_up();
}

void shapefile_index_t::bounds_min_max_t::_clean_up() {
}

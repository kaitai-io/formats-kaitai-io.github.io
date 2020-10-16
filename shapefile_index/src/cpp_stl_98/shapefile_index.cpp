// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "shapefile_index.h"
#include "kaitai/exceptions.h"

shapefile_index_t::shapefile_index_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, shapefile_index_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = 0;
    m_records = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void shapefile_index_t::_read() {
    m_header = new file_header_t(m__io, this, m__root);
    m_records = new std::vector<record_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_records->push_back(new record_t(m__io, this, m__root));
            i++;
        }
    }
}

shapefile_index_t::~shapefile_index_t() {
    _clean_up();
}

void shapefile_index_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (m_records) {
        for (std::vector<record_t*>::iterator it = m_records->begin(); it != m_records->end(); ++it) {
            delete *it;
        }
        delete m_records; m_records = 0;
    }
}

shapefile_index_t::file_header_t::file_header_t(kaitai::kstream* p__io, shapefile_index_t* p__parent, shapefile_index_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bounding_box = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_bounding_box = new bounding_box_x_y_z_m_t(m__io, this, m__root);
}

shapefile_index_t::file_header_t::~file_header_t() {
    _clean_up();
}

void shapefile_index_t::file_header_t::_clean_up() {
    if (m_bounding_box) {
        delete m_bounding_box; m_bounding_box = 0;
    }
}

shapefile_index_t::record_t::record_t(kaitai::kstream* p__io, shapefile_index_t* p__parent, shapefile_index_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_x = 0;
    m_y = 0;
    m_z = 0;
    m_m = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void shapefile_index_t::bounding_box_x_y_z_m_t::_read() {
    m_x = new bounds_min_max_t(m__io, this, m__root);
    m_y = new bounds_min_max_t(m__io, this, m__root);
    m_z = new bounds_min_max_t(m__io, this, m__root);
    m_m = new bounds_min_max_t(m__io, this, m__root);
}

shapefile_index_t::bounding_box_x_y_z_m_t::~bounding_box_x_y_z_m_t() {
    _clean_up();
}

void shapefile_index_t::bounding_box_x_y_z_m_t::_clean_up() {
    if (m_x) {
        delete m_x; m_x = 0;
    }
    if (m_y) {
        delete m_y; m_y = 0;
    }
    if (m_z) {
        delete m_z; m_z = 0;
    }
    if (m_m) {
        delete m_m; m_m = 0;
    }
}

shapefile_index_t::bounds_min_max_t::bounds_min_max_t(kaitai::kstream* p__io, shapefile_index_t::bounding_box_x_y_z_m_t* p__parent, shapefile_index_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

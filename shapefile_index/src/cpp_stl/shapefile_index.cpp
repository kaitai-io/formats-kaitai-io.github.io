// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "shapefile_index.h"



shapefile_index_t::shapefile_index_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, shapefile_index_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
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
    delete m_header;
    for (std::vector<record_t*>::iterator it = m_records->begin(); it != m_records->end(); ++it) {
        delete *it;
    }
    delete m_records;
}

shapefile_index_t::file_header_t::file_header_t(kaitai::kstream* p__io, shapefile_index_t* p__parent, shapefile_index_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void shapefile_index_t::file_header_t::_read() {
    m_file_code = m__io->ensure_fixed_contents(std::string("\x00\x00\x27\x0A", 4));
    m_unused_field_1 = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_unused_field_2 = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_unused_field_3 = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_unused_field_4 = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_unused_field_5 = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_file_length = m__io->read_s4be();
    m_version = m__io->ensure_fixed_contents(std::string("\xE8\x03\x00\x00", 4));
    m_shape_type = static_cast<shapefile_index_t::shape_type_t>(m__io->read_s4le());
    m_bounding_box = new bounding_box_x_y_z_m_t(m__io, this, m__root);
}

shapefile_index_t::file_header_t::~file_header_t() {
    delete m_bounding_box;
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
}

shapefile_index_t::bounding_box_x_y_z_m_t::bounding_box_x_y_z_m_t(kaitai::kstream* p__io, shapefile_index_t::file_header_t* p__parent, shapefile_index_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void shapefile_index_t::bounding_box_x_y_z_m_t::_read() {
    m_x = new bounds_min_max_t(m__io, this, m__root);
    m_y = new bounds_min_max_t(m__io, this, m__root);
    m_z = new bounds_min_max_t(m__io, this, m__root);
    m_m = new bounds_min_max_t(m__io, this, m__root);
}

shapefile_index_t::bounding_box_x_y_z_m_t::~bounding_box_x_y_z_m_t() {
    delete m_x;
    delete m_y;
    delete m_z;
    delete m_m;
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
}

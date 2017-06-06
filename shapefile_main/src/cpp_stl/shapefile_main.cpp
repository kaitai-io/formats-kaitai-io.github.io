// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "shapefile_main.h"



shapefile_main_t::shapefile_main_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, shapefile_main_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void shapefile_main_t::_read() {
    m_header = new file_header_t(m__io, this, m__root);
    m_records = new std::vector<record_t*>();
    while (!m__io->is_eof()) {
        m_records->push_back(new record_t(m__io, this, m__root));
    }
}

shapefile_main_t::~shapefile_main_t() {
    delete m_header;
    for (std::vector<record_t*>::iterator it = m_records->begin(); it != m_records->end(); ++it) {
        delete *it;
    }
    delete m_records;
}

shapefile_main_t::multi_point_m_t::multi_point_m_t(kaitai::kstream *p_io, shapefile_main_t::record_contents_t* p_parent, shapefile_main_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void shapefile_main_t::multi_point_m_t::_read() {
    m_bounding_box = new bounding_box_x_y_t(m__io, this, m__root);
    m_number_of_points = m__io->read_s4le();
    int l_points = number_of_points();
    m_points = new std::vector<point_t*>();
    m_points->reserve(l_points);
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(new point_t(m__io, this, m__root));
    }
    m_m_range = new bounds_min_max_t(m__io, this, m__root);
    int l_m_values = number_of_points();
    m_m_values = new std::vector<double>();
    m_m_values->reserve(l_m_values);
    for (int i = 0; i < l_m_values; i++) {
        m_m_values->push_back(m__io->read_f8le());
    }
}

shapefile_main_t::multi_point_m_t::~multi_point_m_t() {
    delete m_bounding_box;
    for (std::vector<point_t*>::iterator it = m_points->begin(); it != m_points->end(); ++it) {
        delete *it;
    }
    delete m_points;
    delete m_m_range;
    delete m_m_values;
}

shapefile_main_t::bounding_box_x_y_z_m_t::bounding_box_x_y_z_m_t(kaitai::kstream *p_io, shapefile_main_t::file_header_t* p_parent, shapefile_main_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void shapefile_main_t::bounding_box_x_y_z_m_t::_read() {
    m_x = new bounds_min_max_t(m__io, this, m__root);
    m_y = new bounds_min_max_t(m__io, this, m__root);
    m_z = new bounds_min_max_t(m__io, this, m__root);
    m_m = new bounds_min_max_t(m__io, this, m__root);
}

shapefile_main_t::bounding_box_x_y_z_m_t::~bounding_box_x_y_z_m_t() {
    delete m_x;
    delete m_y;
    delete m_z;
    delete m_m;
}

shapefile_main_t::point_t::point_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, shapefile_main_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void shapefile_main_t::point_t::_read() {
    m_x = m__io->read_f8le();
    m_y = m__io->read_f8le();
}

shapefile_main_t::point_t::~point_t() {
}

shapefile_main_t::polygon_t::polygon_t(kaitai::kstream *p_io, shapefile_main_t::record_contents_t* p_parent, shapefile_main_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void shapefile_main_t::polygon_t::_read() {
    m_bounding_box = new bounding_box_x_y_t(m__io, this, m__root);
    m_number_of_parts = m__io->read_s4le();
    m_number_of_points = m__io->read_s4le();
    int l_parts = number_of_parts();
    m_parts = new std::vector<int32_t>();
    m_parts->reserve(l_parts);
    for (int i = 0; i < l_parts; i++) {
        m_parts->push_back(m__io->read_s4le());
    }
    int l_points = number_of_points();
    m_points = new std::vector<point_t*>();
    m_points->reserve(l_points);
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(new point_t(m__io, this, m__root));
    }
}

shapefile_main_t::polygon_t::~polygon_t() {
    delete m_bounding_box;
    delete m_parts;
    for (std::vector<point_t*>::iterator it = m_points->begin(); it != m_points->end(); ++it) {
        delete *it;
    }
    delete m_points;
}

shapefile_main_t::bounds_min_max_t::bounds_min_max_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, shapefile_main_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void shapefile_main_t::bounds_min_max_t::_read() {
    m_min = m__io->read_f8le();
    m_max = m__io->read_f8le();
}

shapefile_main_t::bounds_min_max_t::~bounds_min_max_t() {
}

shapefile_main_t::poly_line_t::poly_line_t(kaitai::kstream *p_io, shapefile_main_t::record_contents_t* p_parent, shapefile_main_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void shapefile_main_t::poly_line_t::_read() {
    m_bounding_box = new bounding_box_x_y_t(m__io, this, m__root);
    m_number_of_parts = m__io->read_s4le();
    m_number_of_points = m__io->read_s4le();
    int l_parts = number_of_parts();
    m_parts = new std::vector<int32_t>();
    m_parts->reserve(l_parts);
    for (int i = 0; i < l_parts; i++) {
        m_parts->push_back(m__io->read_s4le());
    }
    int l_points = number_of_points();
    m_points = new std::vector<point_t*>();
    m_points->reserve(l_points);
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(new point_t(m__io, this, m__root));
    }
}

shapefile_main_t::poly_line_t::~poly_line_t() {
    delete m_bounding_box;
    delete m_parts;
    for (std::vector<point_t*>::iterator it = m_points->begin(); it != m_points->end(); ++it) {
        delete *it;
    }
    delete m_points;
}

shapefile_main_t::multi_point_z_t::multi_point_z_t(kaitai::kstream *p_io, shapefile_main_t::record_contents_t* p_parent, shapefile_main_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void shapefile_main_t::multi_point_z_t::_read() {
    m_bounding_box = new bounding_box_x_y_t(m__io, this, m__root);
    m_number_of_points = m__io->read_s4le();
    int l_points = number_of_points();
    m_points = new std::vector<point_t*>();
    m_points->reserve(l_points);
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(new point_t(m__io, this, m__root));
    }
    m_z_range = new bounds_min_max_t(m__io, this, m__root);
    int l_z_values = number_of_points();
    m_z_values = new std::vector<double>();
    m_z_values->reserve(l_z_values);
    for (int i = 0; i < l_z_values; i++) {
        m_z_values->push_back(m__io->read_f8le());
    }
    m_m_range = new bounds_min_max_t(m__io, this, m__root);
    int l_m_values = number_of_points();
    m_m_values = new std::vector<double>();
    m_m_values->reserve(l_m_values);
    for (int i = 0; i < l_m_values; i++) {
        m_m_values->push_back(m__io->read_f8le());
    }
}

shapefile_main_t::multi_point_z_t::~multi_point_z_t() {
    delete m_bounding_box;
    for (std::vector<point_t*>::iterator it = m_points->begin(); it != m_points->end(); ++it) {
        delete *it;
    }
    delete m_points;
    delete m_z_range;
    delete m_z_values;
    delete m_m_range;
    delete m_m_values;
}

shapefile_main_t::poly_line_z_t::poly_line_z_t(kaitai::kstream *p_io, shapefile_main_t::record_contents_t* p_parent, shapefile_main_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void shapefile_main_t::poly_line_z_t::_read() {
    m_bounding_box = new bounding_box_x_y_t(m__io, this, m__root);
    m_number_of_parts = m__io->read_s4le();
    m_number_of_points = m__io->read_s4le();
    int l_parts = number_of_parts();
    m_parts = new std::vector<int32_t>();
    m_parts->reserve(l_parts);
    for (int i = 0; i < l_parts; i++) {
        m_parts->push_back(m__io->read_s4le());
    }
    int l_points = number_of_points();
    m_points = new std::vector<point_t*>();
    m_points->reserve(l_points);
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(new point_t(m__io, this, m__root));
    }
    m_z_range = new bounds_min_max_t(m__io, this, m__root);
    int l_z_values = number_of_points();
    m_z_values = new std::vector<double>();
    m_z_values->reserve(l_z_values);
    for (int i = 0; i < l_z_values; i++) {
        m_z_values->push_back(m__io->read_f8le());
    }
    m_m_range = new bounds_min_max_t(m__io, this, m__root);
    int l_m_values = number_of_points();
    m_m_values = new std::vector<double>();
    m_m_values->reserve(l_m_values);
    for (int i = 0; i < l_m_values; i++) {
        m_m_values->push_back(m__io->read_f8le());
    }
}

shapefile_main_t::poly_line_z_t::~poly_line_z_t() {
    delete m_bounding_box;
    delete m_parts;
    for (std::vector<point_t*>::iterator it = m_points->begin(); it != m_points->end(); ++it) {
        delete *it;
    }
    delete m_points;
    delete m_z_range;
    delete m_z_values;
    delete m_m_range;
    delete m_m_values;
}

shapefile_main_t::polygon_z_t::polygon_z_t(kaitai::kstream *p_io, shapefile_main_t::record_contents_t* p_parent, shapefile_main_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void shapefile_main_t::polygon_z_t::_read() {
    m_bounding_box = new bounding_box_x_y_t(m__io, this, m__root);
    m_number_of_parts = m__io->read_s4le();
    m_number_of_points = m__io->read_s4le();
    int l_parts = number_of_parts();
    m_parts = new std::vector<int32_t>();
    m_parts->reserve(l_parts);
    for (int i = 0; i < l_parts; i++) {
        m_parts->push_back(m__io->read_s4le());
    }
    int l_points = number_of_points();
    m_points = new std::vector<point_t*>();
    m_points->reserve(l_points);
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(new point_t(m__io, this, m__root));
    }
    m_z_range = new bounds_min_max_t(m__io, this, m__root);
    int l_z_values = number_of_points();
    m_z_values = new std::vector<double>();
    m_z_values->reserve(l_z_values);
    for (int i = 0; i < l_z_values; i++) {
        m_z_values->push_back(m__io->read_f8le());
    }
    m_m_range = new bounds_min_max_t(m__io, this, m__root);
    int l_m_values = number_of_points();
    m_m_values = new std::vector<double>();
    m_m_values->reserve(l_m_values);
    for (int i = 0; i < l_m_values; i++) {
        m_m_values->push_back(m__io->read_f8le());
    }
}

shapefile_main_t::polygon_z_t::~polygon_z_t() {
    delete m_bounding_box;
    delete m_parts;
    for (std::vector<point_t*>::iterator it = m_points->begin(); it != m_points->end(); ++it) {
        delete *it;
    }
    delete m_points;
    delete m_z_range;
    delete m_z_values;
    delete m_m_range;
    delete m_m_values;
}

shapefile_main_t::bounding_box_x_y_t::bounding_box_x_y_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, shapefile_main_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void shapefile_main_t::bounding_box_x_y_t::_read() {
    m_x = new bounds_min_max_t(m__io, this, m__root);
    m_y = new bounds_min_max_t(m__io, this, m__root);
}

shapefile_main_t::bounding_box_x_y_t::~bounding_box_x_y_t() {
    delete m_x;
    delete m_y;
}

shapefile_main_t::point_m_t::point_m_t(kaitai::kstream *p_io, shapefile_main_t::record_contents_t* p_parent, shapefile_main_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void shapefile_main_t::point_m_t::_read() {
    m_x = m__io->read_f8le();
    m_y = m__io->read_f8le();
    m_m = m__io->read_f8le();
}

shapefile_main_t::point_m_t::~point_m_t() {
}

shapefile_main_t::polygon_m_t::polygon_m_t(kaitai::kstream *p_io, shapefile_main_t::record_contents_t* p_parent, shapefile_main_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void shapefile_main_t::polygon_m_t::_read() {
    m_bounding_box = new bounding_box_x_y_t(m__io, this, m__root);
    m_number_of_parts = m__io->read_s4le();
    m_number_of_points = m__io->read_s4le();
    int l_parts = number_of_parts();
    m_parts = new std::vector<int32_t>();
    m_parts->reserve(l_parts);
    for (int i = 0; i < l_parts; i++) {
        m_parts->push_back(m__io->read_s4le());
    }
    int l_points = number_of_points();
    m_points = new std::vector<point_t*>();
    m_points->reserve(l_points);
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(new point_t(m__io, this, m__root));
    }
    m_m_range = new bounds_min_max_t(m__io, this, m__root);
    int l_m_values = number_of_points();
    m_m_values = new std::vector<double>();
    m_m_values->reserve(l_m_values);
    for (int i = 0; i < l_m_values; i++) {
        m_m_values->push_back(m__io->read_f8le());
    }
}

shapefile_main_t::polygon_m_t::~polygon_m_t() {
    delete m_bounding_box;
    delete m_parts;
    for (std::vector<point_t*>::iterator it = m_points->begin(); it != m_points->end(); ++it) {
        delete *it;
    }
    delete m_points;
    delete m_m_range;
    delete m_m_values;
}

shapefile_main_t::record_header_t::record_header_t(kaitai::kstream *p_io, shapefile_main_t::record_t* p_parent, shapefile_main_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void shapefile_main_t::record_header_t::_read() {
    m_record_number = m__io->read_s4be();
    m_content_length = m__io->read_s4be();
}

shapefile_main_t::record_header_t::~record_header_t() {
}

shapefile_main_t::multi_point_t::multi_point_t(kaitai::kstream *p_io, shapefile_main_t::record_contents_t* p_parent, shapefile_main_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void shapefile_main_t::multi_point_t::_read() {
    m_bounding_box = new bounding_box_x_y_t(m__io, this, m__root);
    m_number_of_points = m__io->read_s4le();
    int l_points = number_of_points();
    m_points = new std::vector<point_t*>();
    m_points->reserve(l_points);
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(new point_t(m__io, this, m__root));
    }
}

shapefile_main_t::multi_point_t::~multi_point_t() {
    delete m_bounding_box;
    for (std::vector<point_t*>::iterator it = m_points->begin(); it != m_points->end(); ++it) {
        delete *it;
    }
    delete m_points;
}

shapefile_main_t::file_header_t::file_header_t(kaitai::kstream *p_io, shapefile_main_t* p_parent, shapefile_main_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void shapefile_main_t::file_header_t::_read() {
    m_file_code = m__io->ensure_fixed_contents(std::string("\x00\x00\x27\x0A", 4));
    m_unused_field_1 = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_unused_field_2 = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_unused_field_3 = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_unused_field_4 = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_unused_field_5 = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x00", 4));
    m_file_length = m__io->read_s4be();
    m_version = m__io->ensure_fixed_contents(std::string("\xE8\x03\x00\x00", 4));
    m_shape_type = static_cast<shapefile_main_t::shape_type_t>(m__io->read_s4le());
    m_bounding_box = new bounding_box_x_y_z_m_t(m__io, this, m__root);
}

shapefile_main_t::file_header_t::~file_header_t() {
    delete m_bounding_box;
}

shapefile_main_t::point_z_t::point_z_t(kaitai::kstream *p_io, shapefile_main_t::record_contents_t* p_parent, shapefile_main_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void shapefile_main_t::point_z_t::_read() {
    m_x = m__io->read_f8le();
    m_y = m__io->read_f8le();
    m_z = m__io->read_f8le();
    m_m = m__io->read_f8le();
}

shapefile_main_t::point_z_t::~point_z_t() {
}

shapefile_main_t::record_t::record_t(kaitai::kstream *p_io, shapefile_main_t* p_parent, shapefile_main_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void shapefile_main_t::record_t::_read() {
    m_header = new record_header_t(m__io, this, m__root);
    m_contents = new record_contents_t(m__io, this, m__root);
}

shapefile_main_t::record_t::~record_t() {
    delete m_header;
    delete m_contents;
}

shapefile_main_t::record_contents_t::record_contents_t(kaitai::kstream *p_io, shapefile_main_t::record_t* p_parent, shapefile_main_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void shapefile_main_t::record_contents_t::_read() {
    m_shape_type = static_cast<shapefile_main_t::shape_type_t>(m__io->read_s4le());
    n_shape_parameters = true;
    if (shape_type() != SHAPE_TYPE_NULL_SHAPE) {
        n_shape_parameters = false;
        switch (shape_type()) {
        case SHAPE_TYPE_POINT_M:
            m_shape_parameters = new point_m_t(m__io, this, m__root);
            break;
        case SHAPE_TYPE_POLYGON_Z:
            m_shape_parameters = new polygon_z_t(m__io, this, m__root);
            break;
        case SHAPE_TYPE_MULTI_POINT_M:
            m_shape_parameters = new multi_point_m_t(m__io, this, m__root);
            break;
        case SHAPE_TYPE_POLY_LINE_Z:
            m_shape_parameters = new poly_line_z_t(m__io, this, m__root);
            break;
        case SHAPE_TYPE_MULTI_POINT_Z:
            m_shape_parameters = new multi_point_z_t(m__io, this, m__root);
            break;
        case SHAPE_TYPE_MULTI_POINT:
            m_shape_parameters = new multi_point_t(m__io, this, m__root);
            break;
        case SHAPE_TYPE_POLYGON_M:
            m_shape_parameters = new polygon_m_t(m__io, this, m__root);
            break;
        case SHAPE_TYPE_POLYGON:
            m_shape_parameters = new polygon_t(m__io, this, m__root);
            break;
        case SHAPE_TYPE_POINT:
            m_shape_parameters = new point_t(m__io, this, m__root);
            break;
        case SHAPE_TYPE_POLY_LINE_M:
            m_shape_parameters = new poly_line_m_t(m__io, this, m__root);
            break;
        case SHAPE_TYPE_POLY_LINE:
            m_shape_parameters = new poly_line_t(m__io, this, m__root);
            break;
        case SHAPE_TYPE_POINT_Z:
            m_shape_parameters = new point_z_t(m__io, this, m__root);
            break;
        case SHAPE_TYPE_MULTI_PATCH:
            m_shape_parameters = new multi_patch_t(m__io, this, m__root);
            break;
        }
    }
}

shapefile_main_t::record_contents_t::~record_contents_t() {
}

shapefile_main_t::multi_patch_t::multi_patch_t(kaitai::kstream *p_io, shapefile_main_t::record_contents_t* p_parent, shapefile_main_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void shapefile_main_t::multi_patch_t::_read() {
    m_bounding_box = new bounding_box_x_y_t(m__io, this, m__root);
    m_number_of_parts = m__io->read_s4le();
    m_number_of_points = m__io->read_s4le();
    int l_parts = number_of_parts();
    m_parts = new std::vector<int32_t>();
    m_parts->reserve(l_parts);
    for (int i = 0; i < l_parts; i++) {
        m_parts->push_back(m__io->read_s4le());
    }
    int l_part_types = number_of_parts();
    m_part_types = new std::vector<part_type_t>();
    m_part_types->reserve(l_part_types);
    for (int i = 0; i < l_part_types; i++) {
        m_part_types->push_back(static_cast<shapefile_main_t::part_type_t>(m__io->read_s4le()));
    }
    int l_points = number_of_points();
    m_points = new std::vector<point_t*>();
    m_points->reserve(l_points);
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(new point_t(m__io, this, m__root));
    }
    m_z_range = new bounds_min_max_t(m__io, this, m__root);
    int l_z_values = number_of_points();
    m_z_values = new std::vector<double>();
    m_z_values->reserve(l_z_values);
    for (int i = 0; i < l_z_values; i++) {
        m_z_values->push_back(m__io->read_f8le());
    }
    m_m_range = new bounds_min_max_t(m__io, this, m__root);
    int l_m_values = number_of_points();
    m_m_values = new std::vector<double>();
    m_m_values->reserve(l_m_values);
    for (int i = 0; i < l_m_values; i++) {
        m_m_values->push_back(m__io->read_f8le());
    }
}

shapefile_main_t::multi_patch_t::~multi_patch_t() {
    delete m_bounding_box;
    delete m_parts;
    delete m_part_types;
    for (std::vector<point_t*>::iterator it = m_points->begin(); it != m_points->end(); ++it) {
        delete *it;
    }
    delete m_points;
    delete m_z_range;
    delete m_z_values;
    delete m_m_range;
    delete m_m_values;
}

shapefile_main_t::poly_line_m_t::poly_line_m_t(kaitai::kstream *p_io, shapefile_main_t::record_contents_t* p_parent, shapefile_main_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void shapefile_main_t::poly_line_m_t::_read() {
    m_bounding_box = new bounding_box_x_y_t(m__io, this, m__root);
    m_number_of_parts = m__io->read_s4le();
    m_number_of_points = m__io->read_s4le();
    int l_parts = number_of_parts();
    m_parts = new std::vector<int32_t>();
    m_parts->reserve(l_parts);
    for (int i = 0; i < l_parts; i++) {
        m_parts->push_back(m__io->read_s4le());
    }
    int l_points = number_of_points();
    m_points = new std::vector<point_t*>();
    m_points->reserve(l_points);
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(new point_t(m__io, this, m__root));
    }
    m_m_range = new bounds_min_max_t(m__io, this, m__root);
    int l_m_values = number_of_points();
    m_m_values = new std::vector<double>();
    m_m_values->reserve(l_m_values);
    for (int i = 0; i < l_m_values; i++) {
        m_m_values->push_back(m__io->read_f8le());
    }
}

shapefile_main_t::poly_line_m_t::~poly_line_m_t() {
    delete m_bounding_box;
    delete m_parts;
    for (std::vector<point_t*>::iterator it = m_points->begin(); it != m_points->end(); ++it) {
        delete *it;
    }
    delete m_points;
    delete m_m_range;
    delete m_m_values;
}

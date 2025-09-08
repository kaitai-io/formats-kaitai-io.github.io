// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "shapefile_main.h"
#include "kaitai/exceptions.h"
std::set<shapefile_main_t::part_type_t> shapefile_main_t::_build_values_part_type_t() {
    std::set<shapefile_main_t::part_type_t> _t;
    _t.insert(shapefile_main_t::PART_TYPE_TRIANGLE_STRIP);
    _t.insert(shapefile_main_t::PART_TYPE_TRIANGLE_FAN);
    _t.insert(shapefile_main_t::PART_TYPE_OUTER_RING);
    _t.insert(shapefile_main_t::PART_TYPE_INNER_RING);
    _t.insert(shapefile_main_t::PART_TYPE_FIRST_RING);
    _t.insert(shapefile_main_t::PART_TYPE_RING);
    return _t;
}
const std::set<shapefile_main_t::part_type_t> shapefile_main_t::_values_part_type_t = shapefile_main_t::_build_values_part_type_t();
bool shapefile_main_t::_is_defined_part_type_t(shapefile_main_t::part_type_t v) {
    return shapefile_main_t::_values_part_type_t.find(v) != shapefile_main_t::_values_part_type_t.end();
}
std::set<shapefile_main_t::shape_type_t> shapefile_main_t::_build_values_shape_type_t() {
    std::set<shapefile_main_t::shape_type_t> _t;
    _t.insert(shapefile_main_t::SHAPE_TYPE_NULL_SHAPE);
    _t.insert(shapefile_main_t::SHAPE_TYPE_POINT);
    _t.insert(shapefile_main_t::SHAPE_TYPE_POLY_LINE);
    _t.insert(shapefile_main_t::SHAPE_TYPE_POLYGON);
    _t.insert(shapefile_main_t::SHAPE_TYPE_MULTI_POINT);
    _t.insert(shapefile_main_t::SHAPE_TYPE_POINT_Z);
    _t.insert(shapefile_main_t::SHAPE_TYPE_POLY_LINE_Z);
    _t.insert(shapefile_main_t::SHAPE_TYPE_POLYGON_Z);
    _t.insert(shapefile_main_t::SHAPE_TYPE_MULTI_POINT_Z);
    _t.insert(shapefile_main_t::SHAPE_TYPE_POINT_M);
    _t.insert(shapefile_main_t::SHAPE_TYPE_POLY_LINE_M);
    _t.insert(shapefile_main_t::SHAPE_TYPE_POLYGON_M);
    _t.insert(shapefile_main_t::SHAPE_TYPE_MULTI_POINT_M);
    _t.insert(shapefile_main_t::SHAPE_TYPE_MULTI_PATCH);
    return _t;
}
const std::set<shapefile_main_t::shape_type_t> shapefile_main_t::_values_shape_type_t = shapefile_main_t::_build_values_shape_type_t();
bool shapefile_main_t::_is_defined_shape_type_t(shapefile_main_t::shape_type_t v) {
    return shapefile_main_t::_values_shape_type_t.find(v) != shapefile_main_t::_values_shape_type_t.end();
}

shapefile_main_t::shapefile_main_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header = 0;
    m_records = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void shapefile_main_t::_read() {
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

shapefile_main_t::~shapefile_main_t() {
    _clean_up();
}

void shapefile_main_t::_clean_up() {
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

shapefile_main_t::bounding_box_x_y_t::bounding_box_x_y_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_x = 0;
    m_y = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void shapefile_main_t::bounding_box_x_y_t::_read() {
    m_x = new bounds_min_max_t(m__io, this, m__root);
    m_y = new bounds_min_max_t(m__io, this, m__root);
}

shapefile_main_t::bounding_box_x_y_t::~bounding_box_x_y_t() {
    _clean_up();
}

void shapefile_main_t::bounding_box_x_y_t::_clean_up() {
    if (m_x) {
        delete m_x; m_x = 0;
    }
    if (m_y) {
        delete m_y; m_y = 0;
    }
}

shapefile_main_t::bounding_box_x_y_z_m_t::bounding_box_x_y_z_m_t(kaitai::kstream* p__io, shapefile_main_t::file_header_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
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

void shapefile_main_t::bounding_box_x_y_z_m_t::_read() {
    m_x = new bounds_min_max_t(m__io, this, m__root);
    m_y = new bounds_min_max_t(m__io, this, m__root);
    m_z = new bounds_min_max_t(m__io, this, m__root);
    m_m = new bounds_min_max_t(m__io, this, m__root);
}

shapefile_main_t::bounding_box_x_y_z_m_t::~bounding_box_x_y_z_m_t() {
    _clean_up();
}

void shapefile_main_t::bounding_box_x_y_z_m_t::_clean_up() {
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

shapefile_main_t::bounds_min_max_t::bounds_min_max_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void shapefile_main_t::bounds_min_max_t::_read() {
    m_min = m__io->read_f8le();
    m_max = m__io->read_f8le();
}

shapefile_main_t::bounds_min_max_t::~bounds_min_max_t() {
    _clean_up();
}

void shapefile_main_t::bounds_min_max_t::_clean_up() {
}

shapefile_main_t::file_header_t::file_header_t(kaitai::kstream* p__io, shapefile_main_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
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

void shapefile_main_t::file_header_t::_read() {
    m_file_code = m__io->read_bytes(4);
    if (!(m_file_code == std::string("\x00\x00\x27\x0A", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x27\x0A", 4), m_file_code, m__io, std::string("/types/file_header/seq/0"));
    }
    m_unused_field_1 = m__io->read_bytes(4);
    if (!(m_unused_field_1 == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_unused_field_1, m__io, std::string("/types/file_header/seq/1"));
    }
    m_unused_field_2 = m__io->read_bytes(4);
    if (!(m_unused_field_2 == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_unused_field_2, m__io, std::string("/types/file_header/seq/2"));
    }
    m_unused_field_3 = m__io->read_bytes(4);
    if (!(m_unused_field_3 == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_unused_field_3, m__io, std::string("/types/file_header/seq/3"));
    }
    m_unused_field_4 = m__io->read_bytes(4);
    if (!(m_unused_field_4 == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_unused_field_4, m__io, std::string("/types/file_header/seq/4"));
    }
    m_unused_field_5 = m__io->read_bytes(4);
    if (!(m_unused_field_5 == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_unused_field_5, m__io, std::string("/types/file_header/seq/5"));
    }
    m_file_length = m__io->read_s4be();
    m_version = m__io->read_bytes(4);
    if (!(m_version == std::string("\xE8\x03\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\xE8\x03\x00\x00", 4), m_version, m__io, std::string("/types/file_header/seq/7"));
    }
    m_shape_type = static_cast<shapefile_main_t::shape_type_t>(m__io->read_s4le());
    m_bounding_box = new bounding_box_x_y_z_m_t(m__io, this, m__root);
}

shapefile_main_t::file_header_t::~file_header_t() {
    _clean_up();
}

void shapefile_main_t::file_header_t::_clean_up() {
    if (m_bounding_box) {
        delete m_bounding_box; m_bounding_box = 0;
    }
}

shapefile_main_t::multi_patch_t::multi_patch_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bounding_box = 0;
    m_parts = 0;
    m_part_types = 0;
    m_points = 0;
    m_z_range = 0;
    m_z_values = 0;
    m_m_range = 0;
    m_m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void shapefile_main_t::multi_patch_t::_read() {
    m_bounding_box = new bounding_box_x_y_t(m__io, this, m__root);
    m_number_of_parts = m__io->read_s4le();
    m_number_of_points = m__io->read_s4le();
    m_parts = new std::vector<int32_t>();
    const int l_parts = number_of_parts();
    for (int i = 0; i < l_parts; i++) {
        m_parts->push_back(m__io->read_s4le());
    }
    m_part_types = new std::vector<part_type_t>();
    const int l_part_types = number_of_parts();
    for (int i = 0; i < l_part_types; i++) {
        m_part_types->push_back(static_cast<shapefile_main_t::part_type_t>(m__io->read_s4le()));
    }
    m_points = new std::vector<point_t*>();
    const int l_points = number_of_points();
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(new point_t(m__io, this, m__root));
    }
    m_z_range = new bounds_min_max_t(m__io, this, m__root);
    m_z_values = new std::vector<double>();
    const int l_z_values = number_of_points();
    for (int i = 0; i < l_z_values; i++) {
        m_z_values->push_back(m__io->read_f8le());
    }
    m_m_range = new bounds_min_max_t(m__io, this, m__root);
    m_m_values = new std::vector<double>();
    const int l_m_values = number_of_points();
    for (int i = 0; i < l_m_values; i++) {
        m_m_values->push_back(m__io->read_f8le());
    }
}

shapefile_main_t::multi_patch_t::~multi_patch_t() {
    _clean_up();
}

void shapefile_main_t::multi_patch_t::_clean_up() {
    if (m_bounding_box) {
        delete m_bounding_box; m_bounding_box = 0;
    }
    if (m_parts) {
        delete m_parts; m_parts = 0;
    }
    if (m_part_types) {
        delete m_part_types; m_part_types = 0;
    }
    if (m_points) {
        for (std::vector<point_t*>::iterator it = m_points->begin(); it != m_points->end(); ++it) {
            delete *it;
        }
        delete m_points; m_points = 0;
    }
    if (m_z_range) {
        delete m_z_range; m_z_range = 0;
    }
    if (m_z_values) {
        delete m_z_values; m_z_values = 0;
    }
    if (m_m_range) {
        delete m_m_range; m_m_range = 0;
    }
    if (m_m_values) {
        delete m_m_values; m_m_values = 0;
    }
}

shapefile_main_t::multi_point_t::multi_point_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bounding_box = 0;
    m_points = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void shapefile_main_t::multi_point_t::_read() {
    m_bounding_box = new bounding_box_x_y_t(m__io, this, m__root);
    m_number_of_points = m__io->read_s4le();
    m_points = new std::vector<point_t*>();
    const int l_points = number_of_points();
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(new point_t(m__io, this, m__root));
    }
}

shapefile_main_t::multi_point_t::~multi_point_t() {
    _clean_up();
}

void shapefile_main_t::multi_point_t::_clean_up() {
    if (m_bounding_box) {
        delete m_bounding_box; m_bounding_box = 0;
    }
    if (m_points) {
        for (std::vector<point_t*>::iterator it = m_points->begin(); it != m_points->end(); ++it) {
            delete *it;
        }
        delete m_points; m_points = 0;
    }
}

shapefile_main_t::multi_point_m_t::multi_point_m_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bounding_box = 0;
    m_points = 0;
    m_m_range = 0;
    m_m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void shapefile_main_t::multi_point_m_t::_read() {
    m_bounding_box = new bounding_box_x_y_t(m__io, this, m__root);
    m_number_of_points = m__io->read_s4le();
    m_points = new std::vector<point_t*>();
    const int l_points = number_of_points();
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(new point_t(m__io, this, m__root));
    }
    m_m_range = new bounds_min_max_t(m__io, this, m__root);
    m_m_values = new std::vector<double>();
    const int l_m_values = number_of_points();
    for (int i = 0; i < l_m_values; i++) {
        m_m_values->push_back(m__io->read_f8le());
    }
}

shapefile_main_t::multi_point_m_t::~multi_point_m_t() {
    _clean_up();
}

void shapefile_main_t::multi_point_m_t::_clean_up() {
    if (m_bounding_box) {
        delete m_bounding_box; m_bounding_box = 0;
    }
    if (m_points) {
        for (std::vector<point_t*>::iterator it = m_points->begin(); it != m_points->end(); ++it) {
            delete *it;
        }
        delete m_points; m_points = 0;
    }
    if (m_m_range) {
        delete m_m_range; m_m_range = 0;
    }
    if (m_m_values) {
        delete m_m_values; m_m_values = 0;
    }
}

shapefile_main_t::multi_point_z_t::multi_point_z_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bounding_box = 0;
    m_points = 0;
    m_z_range = 0;
    m_z_values = 0;
    m_m_range = 0;
    m_m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void shapefile_main_t::multi_point_z_t::_read() {
    m_bounding_box = new bounding_box_x_y_t(m__io, this, m__root);
    m_number_of_points = m__io->read_s4le();
    m_points = new std::vector<point_t*>();
    const int l_points = number_of_points();
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(new point_t(m__io, this, m__root));
    }
    m_z_range = new bounds_min_max_t(m__io, this, m__root);
    m_z_values = new std::vector<double>();
    const int l_z_values = number_of_points();
    for (int i = 0; i < l_z_values; i++) {
        m_z_values->push_back(m__io->read_f8le());
    }
    m_m_range = new bounds_min_max_t(m__io, this, m__root);
    m_m_values = new std::vector<double>();
    const int l_m_values = number_of_points();
    for (int i = 0; i < l_m_values; i++) {
        m_m_values->push_back(m__io->read_f8le());
    }
}

shapefile_main_t::multi_point_z_t::~multi_point_z_t() {
    _clean_up();
}

void shapefile_main_t::multi_point_z_t::_clean_up() {
    if (m_bounding_box) {
        delete m_bounding_box; m_bounding_box = 0;
    }
    if (m_points) {
        for (std::vector<point_t*>::iterator it = m_points->begin(); it != m_points->end(); ++it) {
            delete *it;
        }
        delete m_points; m_points = 0;
    }
    if (m_z_range) {
        delete m_z_range; m_z_range = 0;
    }
    if (m_z_values) {
        delete m_z_values; m_z_values = 0;
    }
    if (m_m_range) {
        delete m_m_range; m_m_range = 0;
    }
    if (m_m_values) {
        delete m_m_values; m_m_values = 0;
    }
}

shapefile_main_t::point_t::point_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void shapefile_main_t::point_t::_read() {
    m_x = m__io->read_f8le();
    m_y = m__io->read_f8le();
}

shapefile_main_t::point_t::~point_t() {
    _clean_up();
}

void shapefile_main_t::point_t::_clean_up() {
}

shapefile_main_t::point_m_t::point_m_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void shapefile_main_t::point_m_t::_read() {
    m_x = m__io->read_f8le();
    m_y = m__io->read_f8le();
    m_m = m__io->read_f8le();
}

shapefile_main_t::point_m_t::~point_m_t() {
    _clean_up();
}

void shapefile_main_t::point_m_t::_clean_up() {
}

shapefile_main_t::point_z_t::point_z_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void shapefile_main_t::point_z_t::_read() {
    m_x = m__io->read_f8le();
    m_y = m__io->read_f8le();
    m_z = m__io->read_f8le();
    m_m = m__io->read_f8le();
}

shapefile_main_t::point_z_t::~point_z_t() {
    _clean_up();
}

void shapefile_main_t::point_z_t::_clean_up() {
}

shapefile_main_t::poly_line_t::poly_line_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bounding_box = 0;
    m_parts = 0;
    m_points = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void shapefile_main_t::poly_line_t::_read() {
    m_bounding_box = new bounding_box_x_y_t(m__io, this, m__root);
    m_number_of_parts = m__io->read_s4le();
    m_number_of_points = m__io->read_s4le();
    m_parts = new std::vector<int32_t>();
    const int l_parts = number_of_parts();
    for (int i = 0; i < l_parts; i++) {
        m_parts->push_back(m__io->read_s4le());
    }
    m_points = new std::vector<point_t*>();
    const int l_points = number_of_points();
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(new point_t(m__io, this, m__root));
    }
}

shapefile_main_t::poly_line_t::~poly_line_t() {
    _clean_up();
}

void shapefile_main_t::poly_line_t::_clean_up() {
    if (m_bounding_box) {
        delete m_bounding_box; m_bounding_box = 0;
    }
    if (m_parts) {
        delete m_parts; m_parts = 0;
    }
    if (m_points) {
        for (std::vector<point_t*>::iterator it = m_points->begin(); it != m_points->end(); ++it) {
            delete *it;
        }
        delete m_points; m_points = 0;
    }
}

shapefile_main_t::poly_line_m_t::poly_line_m_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bounding_box = 0;
    m_parts = 0;
    m_points = 0;
    m_m_range = 0;
    m_m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void shapefile_main_t::poly_line_m_t::_read() {
    m_bounding_box = new bounding_box_x_y_t(m__io, this, m__root);
    m_number_of_parts = m__io->read_s4le();
    m_number_of_points = m__io->read_s4le();
    m_parts = new std::vector<int32_t>();
    const int l_parts = number_of_parts();
    for (int i = 0; i < l_parts; i++) {
        m_parts->push_back(m__io->read_s4le());
    }
    m_points = new std::vector<point_t*>();
    const int l_points = number_of_points();
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(new point_t(m__io, this, m__root));
    }
    m_m_range = new bounds_min_max_t(m__io, this, m__root);
    m_m_values = new std::vector<double>();
    const int l_m_values = number_of_points();
    for (int i = 0; i < l_m_values; i++) {
        m_m_values->push_back(m__io->read_f8le());
    }
}

shapefile_main_t::poly_line_m_t::~poly_line_m_t() {
    _clean_up();
}

void shapefile_main_t::poly_line_m_t::_clean_up() {
    if (m_bounding_box) {
        delete m_bounding_box; m_bounding_box = 0;
    }
    if (m_parts) {
        delete m_parts; m_parts = 0;
    }
    if (m_points) {
        for (std::vector<point_t*>::iterator it = m_points->begin(); it != m_points->end(); ++it) {
            delete *it;
        }
        delete m_points; m_points = 0;
    }
    if (m_m_range) {
        delete m_m_range; m_m_range = 0;
    }
    if (m_m_values) {
        delete m_m_values; m_m_values = 0;
    }
}

shapefile_main_t::poly_line_z_t::poly_line_z_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bounding_box = 0;
    m_parts = 0;
    m_points = 0;
    m_z_range = 0;
    m_z_values = 0;
    m_m_range = 0;
    m_m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void shapefile_main_t::poly_line_z_t::_read() {
    m_bounding_box = new bounding_box_x_y_t(m__io, this, m__root);
    m_number_of_parts = m__io->read_s4le();
    m_number_of_points = m__io->read_s4le();
    m_parts = new std::vector<int32_t>();
    const int l_parts = number_of_parts();
    for (int i = 0; i < l_parts; i++) {
        m_parts->push_back(m__io->read_s4le());
    }
    m_points = new std::vector<point_t*>();
    const int l_points = number_of_points();
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(new point_t(m__io, this, m__root));
    }
    m_z_range = new bounds_min_max_t(m__io, this, m__root);
    m_z_values = new std::vector<double>();
    const int l_z_values = number_of_points();
    for (int i = 0; i < l_z_values; i++) {
        m_z_values->push_back(m__io->read_f8le());
    }
    m_m_range = new bounds_min_max_t(m__io, this, m__root);
    m_m_values = new std::vector<double>();
    const int l_m_values = number_of_points();
    for (int i = 0; i < l_m_values; i++) {
        m_m_values->push_back(m__io->read_f8le());
    }
}

shapefile_main_t::poly_line_z_t::~poly_line_z_t() {
    _clean_up();
}

void shapefile_main_t::poly_line_z_t::_clean_up() {
    if (m_bounding_box) {
        delete m_bounding_box; m_bounding_box = 0;
    }
    if (m_parts) {
        delete m_parts; m_parts = 0;
    }
    if (m_points) {
        for (std::vector<point_t*>::iterator it = m_points->begin(); it != m_points->end(); ++it) {
            delete *it;
        }
        delete m_points; m_points = 0;
    }
    if (m_z_range) {
        delete m_z_range; m_z_range = 0;
    }
    if (m_z_values) {
        delete m_z_values; m_z_values = 0;
    }
    if (m_m_range) {
        delete m_m_range; m_m_range = 0;
    }
    if (m_m_values) {
        delete m_m_values; m_m_values = 0;
    }
}

shapefile_main_t::polygon_t::polygon_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bounding_box = 0;
    m_parts = 0;
    m_points = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void shapefile_main_t::polygon_t::_read() {
    m_bounding_box = new bounding_box_x_y_t(m__io, this, m__root);
    m_number_of_parts = m__io->read_s4le();
    m_number_of_points = m__io->read_s4le();
    m_parts = new std::vector<int32_t>();
    const int l_parts = number_of_parts();
    for (int i = 0; i < l_parts; i++) {
        m_parts->push_back(m__io->read_s4le());
    }
    m_points = new std::vector<point_t*>();
    const int l_points = number_of_points();
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(new point_t(m__io, this, m__root));
    }
}

shapefile_main_t::polygon_t::~polygon_t() {
    _clean_up();
}

void shapefile_main_t::polygon_t::_clean_up() {
    if (m_bounding_box) {
        delete m_bounding_box; m_bounding_box = 0;
    }
    if (m_parts) {
        delete m_parts; m_parts = 0;
    }
    if (m_points) {
        for (std::vector<point_t*>::iterator it = m_points->begin(); it != m_points->end(); ++it) {
            delete *it;
        }
        delete m_points; m_points = 0;
    }
}

shapefile_main_t::polygon_m_t::polygon_m_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bounding_box = 0;
    m_parts = 0;
    m_points = 0;
    m_m_range = 0;
    m_m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void shapefile_main_t::polygon_m_t::_read() {
    m_bounding_box = new bounding_box_x_y_t(m__io, this, m__root);
    m_number_of_parts = m__io->read_s4le();
    m_number_of_points = m__io->read_s4le();
    m_parts = new std::vector<int32_t>();
    const int l_parts = number_of_parts();
    for (int i = 0; i < l_parts; i++) {
        m_parts->push_back(m__io->read_s4le());
    }
    m_points = new std::vector<point_t*>();
    const int l_points = number_of_points();
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(new point_t(m__io, this, m__root));
    }
    m_m_range = new bounds_min_max_t(m__io, this, m__root);
    m_m_values = new std::vector<double>();
    const int l_m_values = number_of_points();
    for (int i = 0; i < l_m_values; i++) {
        m_m_values->push_back(m__io->read_f8le());
    }
}

shapefile_main_t::polygon_m_t::~polygon_m_t() {
    _clean_up();
}

void shapefile_main_t::polygon_m_t::_clean_up() {
    if (m_bounding_box) {
        delete m_bounding_box; m_bounding_box = 0;
    }
    if (m_parts) {
        delete m_parts; m_parts = 0;
    }
    if (m_points) {
        for (std::vector<point_t*>::iterator it = m_points->begin(); it != m_points->end(); ++it) {
            delete *it;
        }
        delete m_points; m_points = 0;
    }
    if (m_m_range) {
        delete m_m_range; m_m_range = 0;
    }
    if (m_m_values) {
        delete m_m_values; m_m_values = 0;
    }
}

shapefile_main_t::polygon_z_t::polygon_z_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bounding_box = 0;
    m_parts = 0;
    m_points = 0;
    m_z_range = 0;
    m_z_values = 0;
    m_m_range = 0;
    m_m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void shapefile_main_t::polygon_z_t::_read() {
    m_bounding_box = new bounding_box_x_y_t(m__io, this, m__root);
    m_number_of_parts = m__io->read_s4le();
    m_number_of_points = m__io->read_s4le();
    m_parts = new std::vector<int32_t>();
    const int l_parts = number_of_parts();
    for (int i = 0; i < l_parts; i++) {
        m_parts->push_back(m__io->read_s4le());
    }
    m_points = new std::vector<point_t*>();
    const int l_points = number_of_points();
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(new point_t(m__io, this, m__root));
    }
    m_z_range = new bounds_min_max_t(m__io, this, m__root);
    m_z_values = new std::vector<double>();
    const int l_z_values = number_of_points();
    for (int i = 0; i < l_z_values; i++) {
        m_z_values->push_back(m__io->read_f8le());
    }
    m_m_range = new bounds_min_max_t(m__io, this, m__root);
    m_m_values = new std::vector<double>();
    const int l_m_values = number_of_points();
    for (int i = 0; i < l_m_values; i++) {
        m_m_values->push_back(m__io->read_f8le());
    }
}

shapefile_main_t::polygon_z_t::~polygon_z_t() {
    _clean_up();
}

void shapefile_main_t::polygon_z_t::_clean_up() {
    if (m_bounding_box) {
        delete m_bounding_box; m_bounding_box = 0;
    }
    if (m_parts) {
        delete m_parts; m_parts = 0;
    }
    if (m_points) {
        for (std::vector<point_t*>::iterator it = m_points->begin(); it != m_points->end(); ++it) {
            delete *it;
        }
        delete m_points; m_points = 0;
    }
    if (m_z_range) {
        delete m_z_range; m_z_range = 0;
    }
    if (m_z_values) {
        delete m_z_values; m_z_values = 0;
    }
    if (m_m_range) {
        delete m_m_range; m_m_range = 0;
    }
    if (m_m_values) {
        delete m_m_values; m_m_values = 0;
    }
}

shapefile_main_t::record_t::record_t(kaitai::kstream* p__io, shapefile_main_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header = 0;
    m_contents = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void shapefile_main_t::record_t::_read() {
    m_header = new record_header_t(m__io, this, m__root);
    m_contents = new record_contents_t(m__io, this, m__root);
}

shapefile_main_t::record_t::~record_t() {
    _clean_up();
}

void shapefile_main_t::record_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (m_contents) {
        delete m_contents; m_contents = 0;
    }
}

shapefile_main_t::record_contents_t::record_contents_t(kaitai::kstream* p__io, shapefile_main_t::record_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void shapefile_main_t::record_contents_t::_read() {
    m_shape_type = static_cast<shapefile_main_t::shape_type_t>(m__io->read_s4le());
    n_shape_parameters = true;
    if (shape_type() != shapefile_main_t::SHAPE_TYPE_NULL_SHAPE) {
        n_shape_parameters = false;
        n_shape_parameters = true;
        switch (shape_type()) {
        case shapefile_main_t::SHAPE_TYPE_MULTI_PATCH: {
            n_shape_parameters = false;
            m_shape_parameters = new multi_patch_t(m__io, this, m__root);
            break;
        }
        case shapefile_main_t::SHAPE_TYPE_MULTI_POINT: {
            n_shape_parameters = false;
            m_shape_parameters = new multi_point_t(m__io, this, m__root);
            break;
        }
        case shapefile_main_t::SHAPE_TYPE_MULTI_POINT_M: {
            n_shape_parameters = false;
            m_shape_parameters = new multi_point_m_t(m__io, this, m__root);
            break;
        }
        case shapefile_main_t::SHAPE_TYPE_MULTI_POINT_Z: {
            n_shape_parameters = false;
            m_shape_parameters = new multi_point_z_t(m__io, this, m__root);
            break;
        }
        case shapefile_main_t::SHAPE_TYPE_POINT: {
            n_shape_parameters = false;
            m_shape_parameters = new point_t(m__io, this, m__root);
            break;
        }
        case shapefile_main_t::SHAPE_TYPE_POINT_M: {
            n_shape_parameters = false;
            m_shape_parameters = new point_m_t(m__io, this, m__root);
            break;
        }
        case shapefile_main_t::SHAPE_TYPE_POINT_Z: {
            n_shape_parameters = false;
            m_shape_parameters = new point_z_t(m__io, this, m__root);
            break;
        }
        case shapefile_main_t::SHAPE_TYPE_POLY_LINE: {
            n_shape_parameters = false;
            m_shape_parameters = new poly_line_t(m__io, this, m__root);
            break;
        }
        case shapefile_main_t::SHAPE_TYPE_POLY_LINE_M: {
            n_shape_parameters = false;
            m_shape_parameters = new poly_line_m_t(m__io, this, m__root);
            break;
        }
        case shapefile_main_t::SHAPE_TYPE_POLY_LINE_Z: {
            n_shape_parameters = false;
            m_shape_parameters = new poly_line_z_t(m__io, this, m__root);
            break;
        }
        case shapefile_main_t::SHAPE_TYPE_POLYGON: {
            n_shape_parameters = false;
            m_shape_parameters = new polygon_t(m__io, this, m__root);
            break;
        }
        case shapefile_main_t::SHAPE_TYPE_POLYGON_M: {
            n_shape_parameters = false;
            m_shape_parameters = new polygon_m_t(m__io, this, m__root);
            break;
        }
        case shapefile_main_t::SHAPE_TYPE_POLYGON_Z: {
            n_shape_parameters = false;
            m_shape_parameters = new polygon_z_t(m__io, this, m__root);
            break;
        }
        }
    }
}

shapefile_main_t::record_contents_t::~record_contents_t() {
    _clean_up();
}

void shapefile_main_t::record_contents_t::_clean_up() {
    if (!n_shape_parameters) {
        if (m_shape_parameters) {
            delete m_shape_parameters; m_shape_parameters = 0;
        }
    }
}

shapefile_main_t::record_header_t::record_header_t(kaitai::kstream* p__io, shapefile_main_t::record_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void shapefile_main_t::record_header_t::_read() {
    m_record_number = m__io->read_s4be();
    m_content_length = m__io->read_s4be();
}

shapefile_main_t::record_header_t::~record_header_t() {
    _clean_up();
}

void shapefile_main_t::record_header_t::_clean_up() {
}

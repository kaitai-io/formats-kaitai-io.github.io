// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "shapefile_main.h"
#include "kaitai/exceptions.h"
const std::set<shapefile_main_t::part_type_t> shapefile_main_t::_values_part_type_t{
    shapefile_main_t::PART_TYPE_TRIANGLE_STRIP,
    shapefile_main_t::PART_TYPE_TRIANGLE_FAN,
    shapefile_main_t::PART_TYPE_OUTER_RING,
    shapefile_main_t::PART_TYPE_INNER_RING,
    shapefile_main_t::PART_TYPE_FIRST_RING,
    shapefile_main_t::PART_TYPE_RING,
};
bool shapefile_main_t::_is_defined_part_type_t(shapefile_main_t::part_type_t v) {
    return shapefile_main_t::_values_part_type_t.find(v) != shapefile_main_t::_values_part_type_t.end();
}
const std::set<shapefile_main_t::shape_type_t> shapefile_main_t::_values_shape_type_t{
    shapefile_main_t::SHAPE_TYPE_NULL_SHAPE,
    shapefile_main_t::SHAPE_TYPE_POINT,
    shapefile_main_t::SHAPE_TYPE_POLY_LINE,
    shapefile_main_t::SHAPE_TYPE_POLYGON,
    shapefile_main_t::SHAPE_TYPE_MULTI_POINT,
    shapefile_main_t::SHAPE_TYPE_POINT_Z,
    shapefile_main_t::SHAPE_TYPE_POLY_LINE_Z,
    shapefile_main_t::SHAPE_TYPE_POLYGON_Z,
    shapefile_main_t::SHAPE_TYPE_MULTI_POINT_Z,
    shapefile_main_t::SHAPE_TYPE_POINT_M,
    shapefile_main_t::SHAPE_TYPE_POLY_LINE_M,
    shapefile_main_t::SHAPE_TYPE_POLYGON_M,
    shapefile_main_t::SHAPE_TYPE_MULTI_POINT_M,
    shapefile_main_t::SHAPE_TYPE_MULTI_PATCH,
};
bool shapefile_main_t::_is_defined_shape_type_t(shapefile_main_t::shape_type_t v) {
    return shapefile_main_t::_values_shape_type_t.find(v) != shapefile_main_t::_values_shape_type_t.end();
}

shapefile_main_t::shapefile_main_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header = nullptr;
    m_records = nullptr;
    _read();
}

void shapefile_main_t::_read() {
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

shapefile_main_t::~shapefile_main_t() {
    _clean_up();
}

void shapefile_main_t::_clean_up() {
}

shapefile_main_t::bounding_box_x_y_t::bounding_box_x_y_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_x = nullptr;
    m_y = nullptr;
    _read();
}

void shapefile_main_t::bounding_box_x_y_t::_read() {
    m_x = std::unique_ptr<bounds_min_max_t>(new bounds_min_max_t(m__io, this, m__root));
    m_y = std::unique_ptr<bounds_min_max_t>(new bounds_min_max_t(m__io, this, m__root));
}

shapefile_main_t::bounding_box_x_y_t::~bounding_box_x_y_t() {
    _clean_up();
}

void shapefile_main_t::bounding_box_x_y_t::_clean_up() {
}

shapefile_main_t::bounding_box_x_y_z_m_t::bounding_box_x_y_z_m_t(kaitai::kstream* p__io, shapefile_main_t::file_header_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_x = nullptr;
    m_y = nullptr;
    m_z = nullptr;
    m_m = nullptr;
    _read();
}

void shapefile_main_t::bounding_box_x_y_z_m_t::_read() {
    m_x = std::unique_ptr<bounds_min_max_t>(new bounds_min_max_t(m__io, this, m__root));
    m_y = std::unique_ptr<bounds_min_max_t>(new bounds_min_max_t(m__io, this, m__root));
    m_z = std::unique_ptr<bounds_min_max_t>(new bounds_min_max_t(m__io, this, m__root));
    m_m = std::unique_ptr<bounds_min_max_t>(new bounds_min_max_t(m__io, this, m__root));
}

shapefile_main_t::bounding_box_x_y_z_m_t::~bounding_box_x_y_z_m_t() {
    _clean_up();
}

void shapefile_main_t::bounding_box_x_y_z_m_t::_clean_up() {
}

shapefile_main_t::bounds_min_max_t::bounds_min_max_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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
    m_bounding_box = nullptr;
    _read();
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
    m_bounding_box = std::unique_ptr<bounding_box_x_y_z_m_t>(new bounding_box_x_y_z_m_t(m__io, this, m__root));
}

shapefile_main_t::file_header_t::~file_header_t() {
    _clean_up();
}

void shapefile_main_t::file_header_t::_clean_up() {
}

shapefile_main_t::multi_patch_t::multi_patch_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bounding_box = nullptr;
    m_parts = nullptr;
    m_part_types = nullptr;
    m_points = nullptr;
    m_z_range = nullptr;
    m_z_values = nullptr;
    m_m_range = nullptr;
    m_m_values = nullptr;
    _read();
}

void shapefile_main_t::multi_patch_t::_read() {
    m_bounding_box = std::unique_ptr<bounding_box_x_y_t>(new bounding_box_x_y_t(m__io, this, m__root));
    m_number_of_parts = m__io->read_s4le();
    m_number_of_points = m__io->read_s4le();
    m_parts = std::unique_ptr<std::vector<int32_t>>(new std::vector<int32_t>());
    const int l_parts = number_of_parts();
    for (int i = 0; i < l_parts; i++) {
        m_parts->push_back(std::move(m__io->read_s4le()));
    }
    m_part_types = std::unique_ptr<std::vector<part_type_t>>(new std::vector<part_type_t>());
    const int l_part_types = number_of_parts();
    for (int i = 0; i < l_part_types; i++) {
        m_part_types->push_back(std::move(static_cast<shapefile_main_t::part_type_t>(m__io->read_s4le())));
    }
    m_points = std::unique_ptr<std::vector<std::unique_ptr<point_t>>>(new std::vector<std::unique_ptr<point_t>>());
    const int l_points = number_of_points();
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(std::move(std::unique_ptr<point_t>(new point_t(m__io, this, m__root))));
    }
    m_z_range = std::unique_ptr<bounds_min_max_t>(new bounds_min_max_t(m__io, this, m__root));
    m_z_values = std::unique_ptr<std::vector<double>>(new std::vector<double>());
    const int l_z_values = number_of_points();
    for (int i = 0; i < l_z_values; i++) {
        m_z_values->push_back(std::move(m__io->read_f8le()));
    }
    m_m_range = std::unique_ptr<bounds_min_max_t>(new bounds_min_max_t(m__io, this, m__root));
    m_m_values = std::unique_ptr<std::vector<double>>(new std::vector<double>());
    const int l_m_values = number_of_points();
    for (int i = 0; i < l_m_values; i++) {
        m_m_values->push_back(std::move(m__io->read_f8le()));
    }
}

shapefile_main_t::multi_patch_t::~multi_patch_t() {
    _clean_up();
}

void shapefile_main_t::multi_patch_t::_clean_up() {
}

shapefile_main_t::multi_point_t::multi_point_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bounding_box = nullptr;
    m_points = nullptr;
    _read();
}

void shapefile_main_t::multi_point_t::_read() {
    m_bounding_box = std::unique_ptr<bounding_box_x_y_t>(new bounding_box_x_y_t(m__io, this, m__root));
    m_number_of_points = m__io->read_s4le();
    m_points = std::unique_ptr<std::vector<std::unique_ptr<point_t>>>(new std::vector<std::unique_ptr<point_t>>());
    const int l_points = number_of_points();
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(std::move(std::unique_ptr<point_t>(new point_t(m__io, this, m__root))));
    }
}

shapefile_main_t::multi_point_t::~multi_point_t() {
    _clean_up();
}

void shapefile_main_t::multi_point_t::_clean_up() {
}

shapefile_main_t::multi_point_m_t::multi_point_m_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bounding_box = nullptr;
    m_points = nullptr;
    m_m_range = nullptr;
    m_m_values = nullptr;
    _read();
}

void shapefile_main_t::multi_point_m_t::_read() {
    m_bounding_box = std::unique_ptr<bounding_box_x_y_t>(new bounding_box_x_y_t(m__io, this, m__root));
    m_number_of_points = m__io->read_s4le();
    m_points = std::unique_ptr<std::vector<std::unique_ptr<point_t>>>(new std::vector<std::unique_ptr<point_t>>());
    const int l_points = number_of_points();
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(std::move(std::unique_ptr<point_t>(new point_t(m__io, this, m__root))));
    }
    m_m_range = std::unique_ptr<bounds_min_max_t>(new bounds_min_max_t(m__io, this, m__root));
    m_m_values = std::unique_ptr<std::vector<double>>(new std::vector<double>());
    const int l_m_values = number_of_points();
    for (int i = 0; i < l_m_values; i++) {
        m_m_values->push_back(std::move(m__io->read_f8le()));
    }
}

shapefile_main_t::multi_point_m_t::~multi_point_m_t() {
    _clean_up();
}

void shapefile_main_t::multi_point_m_t::_clean_up() {
}

shapefile_main_t::multi_point_z_t::multi_point_z_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bounding_box = nullptr;
    m_points = nullptr;
    m_z_range = nullptr;
    m_z_values = nullptr;
    m_m_range = nullptr;
    m_m_values = nullptr;
    _read();
}

void shapefile_main_t::multi_point_z_t::_read() {
    m_bounding_box = std::unique_ptr<bounding_box_x_y_t>(new bounding_box_x_y_t(m__io, this, m__root));
    m_number_of_points = m__io->read_s4le();
    m_points = std::unique_ptr<std::vector<std::unique_ptr<point_t>>>(new std::vector<std::unique_ptr<point_t>>());
    const int l_points = number_of_points();
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(std::move(std::unique_ptr<point_t>(new point_t(m__io, this, m__root))));
    }
    m_z_range = std::unique_ptr<bounds_min_max_t>(new bounds_min_max_t(m__io, this, m__root));
    m_z_values = std::unique_ptr<std::vector<double>>(new std::vector<double>());
    const int l_z_values = number_of_points();
    for (int i = 0; i < l_z_values; i++) {
        m_z_values->push_back(std::move(m__io->read_f8le()));
    }
    m_m_range = std::unique_ptr<bounds_min_max_t>(new bounds_min_max_t(m__io, this, m__root));
    m_m_values = std::unique_ptr<std::vector<double>>(new std::vector<double>());
    const int l_m_values = number_of_points();
    for (int i = 0; i < l_m_values; i++) {
        m_m_values->push_back(std::move(m__io->read_f8le()));
    }
}

shapefile_main_t::multi_point_z_t::~multi_point_z_t() {
    _clean_up();
}

void shapefile_main_t::multi_point_z_t::_clean_up() {
}

shapefile_main_t::point_t::point_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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
    _read();
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
    _read();
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
    m_bounding_box = nullptr;
    m_parts = nullptr;
    m_points = nullptr;
    _read();
}

void shapefile_main_t::poly_line_t::_read() {
    m_bounding_box = std::unique_ptr<bounding_box_x_y_t>(new bounding_box_x_y_t(m__io, this, m__root));
    m_number_of_parts = m__io->read_s4le();
    m_number_of_points = m__io->read_s4le();
    m_parts = std::unique_ptr<std::vector<int32_t>>(new std::vector<int32_t>());
    const int l_parts = number_of_parts();
    for (int i = 0; i < l_parts; i++) {
        m_parts->push_back(std::move(m__io->read_s4le()));
    }
    m_points = std::unique_ptr<std::vector<std::unique_ptr<point_t>>>(new std::vector<std::unique_ptr<point_t>>());
    const int l_points = number_of_points();
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(std::move(std::unique_ptr<point_t>(new point_t(m__io, this, m__root))));
    }
}

shapefile_main_t::poly_line_t::~poly_line_t() {
    _clean_up();
}

void shapefile_main_t::poly_line_t::_clean_up() {
}

shapefile_main_t::poly_line_m_t::poly_line_m_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bounding_box = nullptr;
    m_parts = nullptr;
    m_points = nullptr;
    m_m_range = nullptr;
    m_m_values = nullptr;
    _read();
}

void shapefile_main_t::poly_line_m_t::_read() {
    m_bounding_box = std::unique_ptr<bounding_box_x_y_t>(new bounding_box_x_y_t(m__io, this, m__root));
    m_number_of_parts = m__io->read_s4le();
    m_number_of_points = m__io->read_s4le();
    m_parts = std::unique_ptr<std::vector<int32_t>>(new std::vector<int32_t>());
    const int l_parts = number_of_parts();
    for (int i = 0; i < l_parts; i++) {
        m_parts->push_back(std::move(m__io->read_s4le()));
    }
    m_points = std::unique_ptr<std::vector<std::unique_ptr<point_t>>>(new std::vector<std::unique_ptr<point_t>>());
    const int l_points = number_of_points();
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(std::move(std::unique_ptr<point_t>(new point_t(m__io, this, m__root))));
    }
    m_m_range = std::unique_ptr<bounds_min_max_t>(new bounds_min_max_t(m__io, this, m__root));
    m_m_values = std::unique_ptr<std::vector<double>>(new std::vector<double>());
    const int l_m_values = number_of_points();
    for (int i = 0; i < l_m_values; i++) {
        m_m_values->push_back(std::move(m__io->read_f8le()));
    }
}

shapefile_main_t::poly_line_m_t::~poly_line_m_t() {
    _clean_up();
}

void shapefile_main_t::poly_line_m_t::_clean_up() {
}

shapefile_main_t::poly_line_z_t::poly_line_z_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bounding_box = nullptr;
    m_parts = nullptr;
    m_points = nullptr;
    m_z_range = nullptr;
    m_z_values = nullptr;
    m_m_range = nullptr;
    m_m_values = nullptr;
    _read();
}

void shapefile_main_t::poly_line_z_t::_read() {
    m_bounding_box = std::unique_ptr<bounding_box_x_y_t>(new bounding_box_x_y_t(m__io, this, m__root));
    m_number_of_parts = m__io->read_s4le();
    m_number_of_points = m__io->read_s4le();
    m_parts = std::unique_ptr<std::vector<int32_t>>(new std::vector<int32_t>());
    const int l_parts = number_of_parts();
    for (int i = 0; i < l_parts; i++) {
        m_parts->push_back(std::move(m__io->read_s4le()));
    }
    m_points = std::unique_ptr<std::vector<std::unique_ptr<point_t>>>(new std::vector<std::unique_ptr<point_t>>());
    const int l_points = number_of_points();
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(std::move(std::unique_ptr<point_t>(new point_t(m__io, this, m__root))));
    }
    m_z_range = std::unique_ptr<bounds_min_max_t>(new bounds_min_max_t(m__io, this, m__root));
    m_z_values = std::unique_ptr<std::vector<double>>(new std::vector<double>());
    const int l_z_values = number_of_points();
    for (int i = 0; i < l_z_values; i++) {
        m_z_values->push_back(std::move(m__io->read_f8le()));
    }
    m_m_range = std::unique_ptr<bounds_min_max_t>(new bounds_min_max_t(m__io, this, m__root));
    m_m_values = std::unique_ptr<std::vector<double>>(new std::vector<double>());
    const int l_m_values = number_of_points();
    for (int i = 0; i < l_m_values; i++) {
        m_m_values->push_back(std::move(m__io->read_f8le()));
    }
}

shapefile_main_t::poly_line_z_t::~poly_line_z_t() {
    _clean_up();
}

void shapefile_main_t::poly_line_z_t::_clean_up() {
}

shapefile_main_t::polygon_t::polygon_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bounding_box = nullptr;
    m_parts = nullptr;
    m_points = nullptr;
    _read();
}

void shapefile_main_t::polygon_t::_read() {
    m_bounding_box = std::unique_ptr<bounding_box_x_y_t>(new bounding_box_x_y_t(m__io, this, m__root));
    m_number_of_parts = m__io->read_s4le();
    m_number_of_points = m__io->read_s4le();
    m_parts = std::unique_ptr<std::vector<int32_t>>(new std::vector<int32_t>());
    const int l_parts = number_of_parts();
    for (int i = 0; i < l_parts; i++) {
        m_parts->push_back(std::move(m__io->read_s4le()));
    }
    m_points = std::unique_ptr<std::vector<std::unique_ptr<point_t>>>(new std::vector<std::unique_ptr<point_t>>());
    const int l_points = number_of_points();
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(std::move(std::unique_ptr<point_t>(new point_t(m__io, this, m__root))));
    }
}

shapefile_main_t::polygon_t::~polygon_t() {
    _clean_up();
}

void shapefile_main_t::polygon_t::_clean_up() {
}

shapefile_main_t::polygon_m_t::polygon_m_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bounding_box = nullptr;
    m_parts = nullptr;
    m_points = nullptr;
    m_m_range = nullptr;
    m_m_values = nullptr;
    _read();
}

void shapefile_main_t::polygon_m_t::_read() {
    m_bounding_box = std::unique_ptr<bounding_box_x_y_t>(new bounding_box_x_y_t(m__io, this, m__root));
    m_number_of_parts = m__io->read_s4le();
    m_number_of_points = m__io->read_s4le();
    m_parts = std::unique_ptr<std::vector<int32_t>>(new std::vector<int32_t>());
    const int l_parts = number_of_parts();
    for (int i = 0; i < l_parts; i++) {
        m_parts->push_back(std::move(m__io->read_s4le()));
    }
    m_points = std::unique_ptr<std::vector<std::unique_ptr<point_t>>>(new std::vector<std::unique_ptr<point_t>>());
    const int l_points = number_of_points();
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(std::move(std::unique_ptr<point_t>(new point_t(m__io, this, m__root))));
    }
    m_m_range = std::unique_ptr<bounds_min_max_t>(new bounds_min_max_t(m__io, this, m__root));
    m_m_values = std::unique_ptr<std::vector<double>>(new std::vector<double>());
    const int l_m_values = number_of_points();
    for (int i = 0; i < l_m_values; i++) {
        m_m_values->push_back(std::move(m__io->read_f8le()));
    }
}

shapefile_main_t::polygon_m_t::~polygon_m_t() {
    _clean_up();
}

void shapefile_main_t::polygon_m_t::_clean_up() {
}

shapefile_main_t::polygon_z_t::polygon_z_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bounding_box = nullptr;
    m_parts = nullptr;
    m_points = nullptr;
    m_z_range = nullptr;
    m_z_values = nullptr;
    m_m_range = nullptr;
    m_m_values = nullptr;
    _read();
}

void shapefile_main_t::polygon_z_t::_read() {
    m_bounding_box = std::unique_ptr<bounding_box_x_y_t>(new bounding_box_x_y_t(m__io, this, m__root));
    m_number_of_parts = m__io->read_s4le();
    m_number_of_points = m__io->read_s4le();
    m_parts = std::unique_ptr<std::vector<int32_t>>(new std::vector<int32_t>());
    const int l_parts = number_of_parts();
    for (int i = 0; i < l_parts; i++) {
        m_parts->push_back(std::move(m__io->read_s4le()));
    }
    m_points = std::unique_ptr<std::vector<std::unique_ptr<point_t>>>(new std::vector<std::unique_ptr<point_t>>());
    const int l_points = number_of_points();
    for (int i = 0; i < l_points; i++) {
        m_points->push_back(std::move(std::unique_ptr<point_t>(new point_t(m__io, this, m__root))));
    }
    m_z_range = std::unique_ptr<bounds_min_max_t>(new bounds_min_max_t(m__io, this, m__root));
    m_z_values = std::unique_ptr<std::vector<double>>(new std::vector<double>());
    const int l_z_values = number_of_points();
    for (int i = 0; i < l_z_values; i++) {
        m_z_values->push_back(std::move(m__io->read_f8le()));
    }
    m_m_range = std::unique_ptr<bounds_min_max_t>(new bounds_min_max_t(m__io, this, m__root));
    m_m_values = std::unique_ptr<std::vector<double>>(new std::vector<double>());
    const int l_m_values = number_of_points();
    for (int i = 0; i < l_m_values; i++) {
        m_m_values->push_back(std::move(m__io->read_f8le()));
    }
}

shapefile_main_t::polygon_z_t::~polygon_z_t() {
    _clean_up();
}

void shapefile_main_t::polygon_z_t::_clean_up() {
}

shapefile_main_t::record_t::record_t(kaitai::kstream* p__io, shapefile_main_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header = nullptr;
    m_contents = nullptr;
    _read();
}

void shapefile_main_t::record_t::_read() {
    m_header = std::unique_ptr<record_header_t>(new record_header_t(m__io, this, m__root));
    m_contents = std::unique_ptr<record_contents_t>(new record_contents_t(m__io, this, m__root));
}

shapefile_main_t::record_t::~record_t() {
    _clean_up();
}

void shapefile_main_t::record_t::_clean_up() {
}

shapefile_main_t::record_contents_t::record_contents_t(kaitai::kstream* p__io, shapefile_main_t::record_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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
            m_shape_parameters = std::unique_ptr<multi_patch_t>(new multi_patch_t(m__io, this, m__root));
            break;
        }
        case shapefile_main_t::SHAPE_TYPE_MULTI_POINT: {
            n_shape_parameters = false;
            m_shape_parameters = std::unique_ptr<multi_point_t>(new multi_point_t(m__io, this, m__root));
            break;
        }
        case shapefile_main_t::SHAPE_TYPE_MULTI_POINT_M: {
            n_shape_parameters = false;
            m_shape_parameters = std::unique_ptr<multi_point_m_t>(new multi_point_m_t(m__io, this, m__root));
            break;
        }
        case shapefile_main_t::SHAPE_TYPE_MULTI_POINT_Z: {
            n_shape_parameters = false;
            m_shape_parameters = std::unique_ptr<multi_point_z_t>(new multi_point_z_t(m__io, this, m__root));
            break;
        }
        case shapefile_main_t::SHAPE_TYPE_POINT: {
            n_shape_parameters = false;
            m_shape_parameters = std::unique_ptr<point_t>(new point_t(m__io, this, m__root));
            break;
        }
        case shapefile_main_t::SHAPE_TYPE_POINT_M: {
            n_shape_parameters = false;
            m_shape_parameters = std::unique_ptr<point_m_t>(new point_m_t(m__io, this, m__root));
            break;
        }
        case shapefile_main_t::SHAPE_TYPE_POINT_Z: {
            n_shape_parameters = false;
            m_shape_parameters = std::unique_ptr<point_z_t>(new point_z_t(m__io, this, m__root));
            break;
        }
        case shapefile_main_t::SHAPE_TYPE_POLY_LINE: {
            n_shape_parameters = false;
            m_shape_parameters = std::unique_ptr<poly_line_t>(new poly_line_t(m__io, this, m__root));
            break;
        }
        case shapefile_main_t::SHAPE_TYPE_POLY_LINE_M: {
            n_shape_parameters = false;
            m_shape_parameters = std::unique_ptr<poly_line_m_t>(new poly_line_m_t(m__io, this, m__root));
            break;
        }
        case shapefile_main_t::SHAPE_TYPE_POLY_LINE_Z: {
            n_shape_parameters = false;
            m_shape_parameters = std::unique_ptr<poly_line_z_t>(new poly_line_z_t(m__io, this, m__root));
            break;
        }
        case shapefile_main_t::SHAPE_TYPE_POLYGON: {
            n_shape_parameters = false;
            m_shape_parameters = std::unique_ptr<polygon_t>(new polygon_t(m__io, this, m__root));
            break;
        }
        case shapefile_main_t::SHAPE_TYPE_POLYGON_M: {
            n_shape_parameters = false;
            m_shape_parameters = std::unique_ptr<polygon_m_t>(new polygon_m_t(m__io, this, m__root));
            break;
        }
        case shapefile_main_t::SHAPE_TYPE_POLYGON_Z: {
            n_shape_parameters = false;
            m_shape_parameters = std::unique_ptr<polygon_z_t>(new polygon_z_t(m__io, this, m__root));
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
    }
}

shapefile_main_t::record_header_t::record_header_t(kaitai::kstream* p__io, shapefile_main_t::record_t* p__parent, shapefile_main_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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

#ifndef SHAPEFILE_MAIN_H_
#define SHAPEFILE_MAIN_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class shapefile_main_t : public kaitai::kstruct {

public:
    class multi_point_m_t;
    class bounding_box_x_y_z_m_t;
    class point_t;
    class polygon_t;
    class bounds_min_max_t;
    class poly_line_t;
    class multi_point_z_t;
    class poly_line_z_t;
    class polygon_z_t;
    class bounding_box_x_y_t;
    class point_m_t;
    class polygon_m_t;
    class record_header_t;
    class multi_point_t;
    class file_header_t;
    class point_z_t;
    class record_t;
    class record_contents_t;
    class multi_patch_t;
    class poly_line_m_t;

    enum shape_type_t {
        SHAPE_TYPE_NULL_SHAPE = 0,
        SHAPE_TYPE_POINT = 1,
        SHAPE_TYPE_POLY_LINE = 3,
        SHAPE_TYPE_POLYGON = 5,
        SHAPE_TYPE_MULTI_POINT = 8,
        SHAPE_TYPE_POINT_Z = 11,
        SHAPE_TYPE_POLY_LINE_Z = 13,
        SHAPE_TYPE_POLYGON_Z = 15,
        SHAPE_TYPE_MULTI_POINT_Z = 18,
        SHAPE_TYPE_POINT_M = 21,
        SHAPE_TYPE_POLY_LINE_M = 23,
        SHAPE_TYPE_POLYGON_M = 25,
        SHAPE_TYPE_MULTI_POINT_M = 28,
        SHAPE_TYPE_MULTI_PATCH = 31
    };

    enum part_type_t {
        PART_TYPE_TRIANGLE_STRIP = 0,
        PART_TYPE_TRIANGLE_FAN = 1,
        PART_TYPE_OUTER_RING = 2,
        PART_TYPE_INNER_RING = 3,
        PART_TYPE_FIRST_RING = 4,
        PART_TYPE_RING = 5
    };

    shapefile_main_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, shapefile_main_t* p__root = 0);

private:
    void _read();

public:
    ~shapefile_main_t();

    class multi_point_m_t : public kaitai::kstruct {

    public:

        multi_point_m_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent = 0, shapefile_main_t* p__root = 0);

    private:
        void _read();

    public:
        ~multi_point_m_t();

    private:
        bounding_box_x_y_t* m_bounding_box;
        int32_t m_number_of_points;
        std::vector<point_t*>* m_points;
        bounds_min_max_t* m_m_range;
        std::vector<double>* m_m_values;
        shapefile_main_t* m__root;
        shapefile_main_t::record_contents_t* m__parent;

    public:
        bounding_box_x_y_t* bounding_box() const { return m_bounding_box; }
        int32_t number_of_points() const { return m_number_of_points; }
        std::vector<point_t*>* points() const { return m_points; }
        bounds_min_max_t* m_range() const { return m_m_range; }
        std::vector<double>* m_values() const { return m_m_values; }
        shapefile_main_t* _root() const { return m__root; }
        shapefile_main_t::record_contents_t* _parent() const { return m__parent; }
    };

    class bounding_box_x_y_z_m_t : public kaitai::kstruct {

    public:

        bounding_box_x_y_z_m_t(kaitai::kstream* p__io, shapefile_main_t::file_header_t* p__parent = 0, shapefile_main_t* p__root = 0);

    private:
        void _read();

    public:
        ~bounding_box_x_y_z_m_t();

    private:
        bounds_min_max_t* m_x;
        bounds_min_max_t* m_y;
        bounds_min_max_t* m_z;
        bounds_min_max_t* m_m;
        shapefile_main_t* m__root;
        shapefile_main_t::file_header_t* m__parent;

    public:
        bounds_min_max_t* x() const { return m_x; }
        bounds_min_max_t* y() const { return m_y; }
        bounds_min_max_t* z() const { return m_z; }
        bounds_min_max_t* m() const { return m_m; }
        shapefile_main_t* _root() const { return m__root; }
        shapefile_main_t::file_header_t* _parent() const { return m__parent; }
    };

    class point_t : public kaitai::kstruct {

    public:

        point_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, shapefile_main_t* p__root = 0);

    private:
        void _read();

    public:
        ~point_t();

    private:
        double m_x;
        double m_y;
        shapefile_main_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        double x() const { return m_x; }
        double y() const { return m_y; }
        shapefile_main_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class polygon_t : public kaitai::kstruct {

    public:

        polygon_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent = 0, shapefile_main_t* p__root = 0);

    private:
        void _read();

    public:
        ~polygon_t();

    private:
        bounding_box_x_y_t* m_bounding_box;
        int32_t m_number_of_parts;
        int32_t m_number_of_points;
        std::vector<int32_t>* m_parts;
        std::vector<point_t*>* m_points;
        shapefile_main_t* m__root;
        shapefile_main_t::record_contents_t* m__parent;

    public:
        bounding_box_x_y_t* bounding_box() const { return m_bounding_box; }
        int32_t number_of_parts() const { return m_number_of_parts; }
        int32_t number_of_points() const { return m_number_of_points; }
        std::vector<int32_t>* parts() const { return m_parts; }
        std::vector<point_t*>* points() const { return m_points; }
        shapefile_main_t* _root() const { return m__root; }
        shapefile_main_t::record_contents_t* _parent() const { return m__parent; }
    };

    class bounds_min_max_t : public kaitai::kstruct {

    public:

        bounds_min_max_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, shapefile_main_t* p__root = 0);

    private:
        void _read();

    public:
        ~bounds_min_max_t();

    private:
        double m_min;
        double m_max;
        shapefile_main_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        double min() const { return m_min; }
        double max() const { return m_max; }
        shapefile_main_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class poly_line_t : public kaitai::kstruct {

    public:

        poly_line_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent = 0, shapefile_main_t* p__root = 0);

    private:
        void _read();

    public:
        ~poly_line_t();

    private:
        bounding_box_x_y_t* m_bounding_box;
        int32_t m_number_of_parts;
        int32_t m_number_of_points;
        std::vector<int32_t>* m_parts;
        std::vector<point_t*>* m_points;
        shapefile_main_t* m__root;
        shapefile_main_t::record_contents_t* m__parent;

    public:
        bounding_box_x_y_t* bounding_box() const { return m_bounding_box; }
        int32_t number_of_parts() const { return m_number_of_parts; }
        int32_t number_of_points() const { return m_number_of_points; }
        std::vector<int32_t>* parts() const { return m_parts; }
        std::vector<point_t*>* points() const { return m_points; }
        shapefile_main_t* _root() const { return m__root; }
        shapefile_main_t::record_contents_t* _parent() const { return m__parent; }
    };

    class multi_point_z_t : public kaitai::kstruct {

    public:

        multi_point_z_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent = 0, shapefile_main_t* p__root = 0);

    private:
        void _read();

    public:
        ~multi_point_z_t();

    private:
        bounding_box_x_y_t* m_bounding_box;
        int32_t m_number_of_points;
        std::vector<point_t*>* m_points;
        bounds_min_max_t* m_z_range;
        std::vector<double>* m_z_values;
        bounds_min_max_t* m_m_range;
        std::vector<double>* m_m_values;
        shapefile_main_t* m__root;
        shapefile_main_t::record_contents_t* m__parent;

    public:
        bounding_box_x_y_t* bounding_box() const { return m_bounding_box; }
        int32_t number_of_points() const { return m_number_of_points; }
        std::vector<point_t*>* points() const { return m_points; }
        bounds_min_max_t* z_range() const { return m_z_range; }
        std::vector<double>* z_values() const { return m_z_values; }
        bounds_min_max_t* m_range() const { return m_m_range; }
        std::vector<double>* m_values() const { return m_m_values; }
        shapefile_main_t* _root() const { return m__root; }
        shapefile_main_t::record_contents_t* _parent() const { return m__parent; }
    };

    class poly_line_z_t : public kaitai::kstruct {

    public:

        poly_line_z_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent = 0, shapefile_main_t* p__root = 0);

    private:
        void _read();

    public:
        ~poly_line_z_t();

    private:
        bounding_box_x_y_t* m_bounding_box;
        int32_t m_number_of_parts;
        int32_t m_number_of_points;
        std::vector<int32_t>* m_parts;
        std::vector<point_t*>* m_points;
        bounds_min_max_t* m_z_range;
        std::vector<double>* m_z_values;
        bounds_min_max_t* m_m_range;
        std::vector<double>* m_m_values;
        shapefile_main_t* m__root;
        shapefile_main_t::record_contents_t* m__parent;

    public:
        bounding_box_x_y_t* bounding_box() const { return m_bounding_box; }
        int32_t number_of_parts() const { return m_number_of_parts; }
        int32_t number_of_points() const { return m_number_of_points; }
        std::vector<int32_t>* parts() const { return m_parts; }
        std::vector<point_t*>* points() const { return m_points; }
        bounds_min_max_t* z_range() const { return m_z_range; }
        std::vector<double>* z_values() const { return m_z_values; }
        bounds_min_max_t* m_range() const { return m_m_range; }
        std::vector<double>* m_values() const { return m_m_values; }
        shapefile_main_t* _root() const { return m__root; }
        shapefile_main_t::record_contents_t* _parent() const { return m__parent; }
    };

    class polygon_z_t : public kaitai::kstruct {

    public:

        polygon_z_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent = 0, shapefile_main_t* p__root = 0);

    private:
        void _read();

    public:
        ~polygon_z_t();

    private:
        bounding_box_x_y_t* m_bounding_box;
        int32_t m_number_of_parts;
        int32_t m_number_of_points;
        std::vector<int32_t>* m_parts;
        std::vector<point_t*>* m_points;
        bounds_min_max_t* m_z_range;
        std::vector<double>* m_z_values;
        bounds_min_max_t* m_m_range;
        std::vector<double>* m_m_values;
        shapefile_main_t* m__root;
        shapefile_main_t::record_contents_t* m__parent;

    public:
        bounding_box_x_y_t* bounding_box() const { return m_bounding_box; }
        int32_t number_of_parts() const { return m_number_of_parts; }
        int32_t number_of_points() const { return m_number_of_points; }
        std::vector<int32_t>* parts() const { return m_parts; }
        std::vector<point_t*>* points() const { return m_points; }
        bounds_min_max_t* z_range() const { return m_z_range; }
        std::vector<double>* z_values() const { return m_z_values; }
        bounds_min_max_t* m_range() const { return m_m_range; }
        std::vector<double>* m_values() const { return m_m_values; }
        shapefile_main_t* _root() const { return m__root; }
        shapefile_main_t::record_contents_t* _parent() const { return m__parent; }
    };

    class bounding_box_x_y_t : public kaitai::kstruct {

    public:

        bounding_box_x_y_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, shapefile_main_t* p__root = 0);

    private:
        void _read();

    public:
        ~bounding_box_x_y_t();

    private:
        bounds_min_max_t* m_x;
        bounds_min_max_t* m_y;
        shapefile_main_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        bounds_min_max_t* x() const { return m_x; }
        bounds_min_max_t* y() const { return m_y; }
        shapefile_main_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class point_m_t : public kaitai::kstruct {

    public:

        point_m_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent = 0, shapefile_main_t* p__root = 0);

    private:
        void _read();

    public:
        ~point_m_t();

    private:
        double m_x;
        double m_y;
        double m_m;
        shapefile_main_t* m__root;
        shapefile_main_t::record_contents_t* m__parent;

    public:
        double x() const { return m_x; }
        double y() const { return m_y; }
        double m() const { return m_m; }
        shapefile_main_t* _root() const { return m__root; }
        shapefile_main_t::record_contents_t* _parent() const { return m__parent; }
    };

    class polygon_m_t : public kaitai::kstruct {

    public:

        polygon_m_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent = 0, shapefile_main_t* p__root = 0);

    private:
        void _read();

    public:
        ~polygon_m_t();

    private:
        bounding_box_x_y_t* m_bounding_box;
        int32_t m_number_of_parts;
        int32_t m_number_of_points;
        std::vector<int32_t>* m_parts;
        std::vector<point_t*>* m_points;
        bounds_min_max_t* m_m_range;
        std::vector<double>* m_m_values;
        shapefile_main_t* m__root;
        shapefile_main_t::record_contents_t* m__parent;

    public:
        bounding_box_x_y_t* bounding_box() const { return m_bounding_box; }
        int32_t number_of_parts() const { return m_number_of_parts; }
        int32_t number_of_points() const { return m_number_of_points; }
        std::vector<int32_t>* parts() const { return m_parts; }
        std::vector<point_t*>* points() const { return m_points; }
        bounds_min_max_t* m_range() const { return m_m_range; }
        std::vector<double>* m_values() const { return m_m_values; }
        shapefile_main_t* _root() const { return m__root; }
        shapefile_main_t::record_contents_t* _parent() const { return m__parent; }
    };

    class record_header_t : public kaitai::kstruct {

    public:

        record_header_t(kaitai::kstream* p__io, shapefile_main_t::record_t* p__parent = 0, shapefile_main_t* p__root = 0);

    private:
        void _read();

    public:
        ~record_header_t();

    private:
        int32_t m_record_number;
        int32_t m_content_length;
        shapefile_main_t* m__root;
        shapefile_main_t::record_t* m__parent;

    public:
        int32_t record_number() const { return m_record_number; }
        int32_t content_length() const { return m_content_length; }
        shapefile_main_t* _root() const { return m__root; }
        shapefile_main_t::record_t* _parent() const { return m__parent; }
    };

    class multi_point_t : public kaitai::kstruct {

    public:

        multi_point_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent = 0, shapefile_main_t* p__root = 0);

    private:
        void _read();

    public:
        ~multi_point_t();

    private:
        bounding_box_x_y_t* m_bounding_box;
        int32_t m_number_of_points;
        std::vector<point_t*>* m_points;
        shapefile_main_t* m__root;
        shapefile_main_t::record_contents_t* m__parent;

    public:
        bounding_box_x_y_t* bounding_box() const { return m_bounding_box; }
        int32_t number_of_points() const { return m_number_of_points; }
        std::vector<point_t*>* points() const { return m_points; }
        shapefile_main_t* _root() const { return m__root; }
        shapefile_main_t::record_contents_t* _parent() const { return m__parent; }
    };

    class file_header_t : public kaitai::kstruct {

    public:

        file_header_t(kaitai::kstream* p__io, shapefile_main_t* p__parent = 0, shapefile_main_t* p__root = 0);

    private:
        void _read();

    public:
        ~file_header_t();

    private:
        std::string m_file_code;
        std::string m_unused_field_1;
        std::string m_unused_field_2;
        std::string m_unused_field_3;
        std::string m_unused_field_4;
        std::string m_unused_field_5;
        int32_t m_file_length;
        std::string m_version;
        shape_type_t m_shape_type;
        bounding_box_x_y_z_m_t* m_bounding_box;
        shapefile_main_t* m__root;
        shapefile_main_t* m__parent;

    public:

        /**
         * corresponds to s4be value of 9994
         */
        std::string file_code() const { return m_file_code; }
        std::string unused_field_1() const { return m_unused_field_1; }
        std::string unused_field_2() const { return m_unused_field_2; }
        std::string unused_field_3() const { return m_unused_field_3; }
        std::string unused_field_4() const { return m_unused_field_4; }
        std::string unused_field_5() const { return m_unused_field_5; }
        int32_t file_length() const { return m_file_length; }

        /**
         * corresponds to s4le value of 1000
         */
        std::string version() const { return m_version; }
        shape_type_t shape_type() const { return m_shape_type; }
        bounding_box_x_y_z_m_t* bounding_box() const { return m_bounding_box; }
        shapefile_main_t* _root() const { return m__root; }
        shapefile_main_t* _parent() const { return m__parent; }
    };

    class point_z_t : public kaitai::kstruct {

    public:

        point_z_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent = 0, shapefile_main_t* p__root = 0);

    private:
        void _read();

    public:
        ~point_z_t();

    private:
        double m_x;
        double m_y;
        double m_z;
        double m_m;
        shapefile_main_t* m__root;
        shapefile_main_t::record_contents_t* m__parent;

    public:
        double x() const { return m_x; }
        double y() const { return m_y; }
        double z() const { return m_z; }
        double m() const { return m_m; }
        shapefile_main_t* _root() const { return m__root; }
        shapefile_main_t::record_contents_t* _parent() const { return m__parent; }
    };

    class record_t : public kaitai::kstruct {

    public:

        record_t(kaitai::kstream* p__io, shapefile_main_t* p__parent = 0, shapefile_main_t* p__root = 0);

    private:
        void _read();

    public:
        ~record_t();

    private:
        record_header_t* m_header;
        record_contents_t* m_contents;
        shapefile_main_t* m__root;
        shapefile_main_t* m__parent;

    public:
        record_header_t* header() const { return m_header; }

        /**
         * the size of this contents section in bytes must equal header.content_length * 2
         */
        record_contents_t* contents() const { return m_contents; }
        shapefile_main_t* _root() const { return m__root; }
        shapefile_main_t* _parent() const { return m__parent; }
    };

    class record_contents_t : public kaitai::kstruct {

    public:

        record_contents_t(kaitai::kstream* p__io, shapefile_main_t::record_t* p__parent = 0, shapefile_main_t* p__root = 0);

    private:
        void _read();

    public:
        ~record_contents_t();

    private:
        shape_type_t m_shape_type;
        kaitai::kstruct* m_shape_parameters;
        bool n_shape_parameters;

    public:
        bool _is_null_shape_parameters() { shape_parameters(); return n_shape_parameters; };

    private:
        shapefile_main_t* m__root;
        shapefile_main_t::record_t* m__parent;

    public:
        shape_type_t shape_type() const { return m_shape_type; }
        kaitai::kstruct* shape_parameters() const { return m_shape_parameters; }
        shapefile_main_t* _root() const { return m__root; }
        shapefile_main_t::record_t* _parent() const { return m__parent; }
    };

    class multi_patch_t : public kaitai::kstruct {

    public:

        multi_patch_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent = 0, shapefile_main_t* p__root = 0);

    private:
        void _read();

    public:
        ~multi_patch_t();

    private:
        bounding_box_x_y_t* m_bounding_box;
        int32_t m_number_of_parts;
        int32_t m_number_of_points;
        std::vector<int32_t>* m_parts;
        std::vector<part_type_t>* m_part_types;
        std::vector<point_t*>* m_points;
        bounds_min_max_t* m_z_range;
        std::vector<double>* m_z_values;
        bounds_min_max_t* m_m_range;
        std::vector<double>* m_m_values;
        shapefile_main_t* m__root;
        shapefile_main_t::record_contents_t* m__parent;

    public:
        bounding_box_x_y_t* bounding_box() const { return m_bounding_box; }
        int32_t number_of_parts() const { return m_number_of_parts; }
        int32_t number_of_points() const { return m_number_of_points; }
        std::vector<int32_t>* parts() const { return m_parts; }
        std::vector<part_type_t>* part_types() const { return m_part_types; }
        std::vector<point_t*>* points() const { return m_points; }
        bounds_min_max_t* z_range() const { return m_z_range; }
        std::vector<double>* z_values() const { return m_z_values; }
        bounds_min_max_t* m_range() const { return m_m_range; }
        std::vector<double>* m_values() const { return m_m_values; }
        shapefile_main_t* _root() const { return m__root; }
        shapefile_main_t::record_contents_t* _parent() const { return m__parent; }
    };

    class poly_line_m_t : public kaitai::kstruct {

    public:

        poly_line_m_t(kaitai::kstream* p__io, shapefile_main_t::record_contents_t* p__parent = 0, shapefile_main_t* p__root = 0);

    private:
        void _read();

    public:
        ~poly_line_m_t();

    private:
        bounding_box_x_y_t* m_bounding_box;
        int32_t m_number_of_parts;
        int32_t m_number_of_points;
        std::vector<int32_t>* m_parts;
        std::vector<point_t*>* m_points;
        bounds_min_max_t* m_m_range;
        std::vector<double>* m_m_values;
        shapefile_main_t* m__root;
        shapefile_main_t::record_contents_t* m__parent;

    public:
        bounding_box_x_y_t* bounding_box() const { return m_bounding_box; }
        int32_t number_of_parts() const { return m_number_of_parts; }
        int32_t number_of_points() const { return m_number_of_points; }
        std::vector<int32_t>* parts() const { return m_parts; }
        std::vector<point_t*>* points() const { return m_points; }
        bounds_min_max_t* m_range() const { return m_m_range; }
        std::vector<double>* m_values() const { return m_m_values; }
        shapefile_main_t* _root() const { return m__root; }
        shapefile_main_t::record_contents_t* _parent() const { return m__parent; }
    };

private:
    file_header_t* m_header;
    std::vector<record_t*>* m_records;
    shapefile_main_t* m__root;
    kaitai::kstruct* m__parent;

public:
    file_header_t* header() const { return m_header; }

    /**
     * the size of this section of the file in bytes must equal (header.file_length * 2) - 100
     */
    std::vector<record_t*>* records() const { return m_records; }
    shapefile_main_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // SHAPEFILE_MAIN_H_

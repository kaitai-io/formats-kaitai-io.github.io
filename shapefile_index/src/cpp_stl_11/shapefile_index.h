#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

class shapefile_index_t : public kaitai::kstruct {

public:
    class file_header_t;
    class record_t;
    class bounding_box_x_y_z_m_t;
    class bounds_min_max_t;

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

    shapefile_index_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, shapefile_index_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~shapefile_index_t();

    class file_header_t : public kaitai::kstruct {

    public:

        file_header_t(kaitai::kstream* p__io, shapefile_index_t* p__parent = nullptr, shapefile_index_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

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
        std::unique_ptr<bounding_box_x_y_z_m_t> m_bounding_box;
        shapefile_index_t* m__root;
        shapefile_index_t* m__parent;

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
        bounding_box_x_y_z_m_t* bounding_box() const { return m_bounding_box.get(); }
        shapefile_index_t* _root() const { return m__root; }
        shapefile_index_t* _parent() const { return m__parent; }
    };

    class record_t : public kaitai::kstruct {

    public:

        record_t(kaitai::kstream* p__io, shapefile_index_t* p__parent = nullptr, shapefile_index_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~record_t();

    private:
        int32_t m_offset;
        int32_t m_content_length;
        shapefile_index_t* m__root;
        shapefile_index_t* m__parent;

    public:
        int32_t offset() const { return m_offset; }
        int32_t content_length() const { return m_content_length; }
        shapefile_index_t* _root() const { return m__root; }
        shapefile_index_t* _parent() const { return m__parent; }
    };

    class bounding_box_x_y_z_m_t : public kaitai::kstruct {

    public:

        bounding_box_x_y_z_m_t(kaitai::kstream* p__io, shapefile_index_t::file_header_t* p__parent = nullptr, shapefile_index_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~bounding_box_x_y_z_m_t();

    private:
        std::unique_ptr<bounds_min_max_t> m_x;
        std::unique_ptr<bounds_min_max_t> m_y;
        std::unique_ptr<bounds_min_max_t> m_z;
        std::unique_ptr<bounds_min_max_t> m_m;
        shapefile_index_t* m__root;
        shapefile_index_t::file_header_t* m__parent;

    public:
        bounds_min_max_t* x() const { return m_x.get(); }
        bounds_min_max_t* y() const { return m_y.get(); }
        bounds_min_max_t* z() const { return m_z.get(); }
        bounds_min_max_t* m() const { return m_m.get(); }
        shapefile_index_t* _root() const { return m__root; }
        shapefile_index_t::file_header_t* _parent() const { return m__parent; }
    };

    class bounds_min_max_t : public kaitai::kstruct {

    public:

        bounds_min_max_t(kaitai::kstream* p__io, shapefile_index_t::bounding_box_x_y_z_m_t* p__parent = nullptr, shapefile_index_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~bounds_min_max_t();

    private:
        double m_min;
        double m_max;
        shapefile_index_t* m__root;
        shapefile_index_t::bounding_box_x_y_z_m_t* m__parent;

    public:
        double min() const { return m_min; }
        double max() const { return m_max; }
        shapefile_index_t* _root() const { return m__root; }
        shapefile_index_t::bounding_box_x_y_z_m_t* _parent() const { return m__parent; }
    };

private:
    std::unique_ptr<file_header_t> m_header;
    std::unique_ptr<std::vector<std::unique_ptr<record_t>>> m_records;
    shapefile_index_t* m__root;
    kaitai::kstruct* m__parent;

public:
    file_header_t* header() const { return m_header.get(); }

    /**
     * the size of this section of the file in bytes must equal (header.file_length * 2) - 100
     */
    std::vector<std::unique_ptr<record_t>>* records() const { return m_records.get(); }
    shapefile_index_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

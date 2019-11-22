#ifndef STL_H_
#define STL_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

/**
 * STL files are used to represent simple 3D models, defined using
 * triangular 3D faces.
 * 
 * Initially it was introduced as native format for 3D Systems
 * Stereolithography CAD system, but due to its extreme simplicity, it
 * was adopted by a wide range of 3D modelling, CAD, rapid prototyping
 * and 3D printing applications as the simplest 3D model exchange
 * format.
 * 
 * STL is extremely bare-bones format: there are no complex headers, no
 * texture / color support, no units specifications, no distinct vertex
 * arrays. Whole model is specified as a collection of triangular
 * faces.
 * 
 * There are two versions of the format (text and binary), this spec
 * describes binary version.
 */

class stl_t : public kaitai::kstruct {

public:
    class triangle_t;
    class vec3d_t;

    stl_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, stl_t* p__root = 0);

private:
    void _read();

public:
    ~stl_t();

    /**
     * Each STL triangle is defined by its 3 points in 3D space and a
     * normal vector, which is generally used to determine where is
     * "inside" and "outside" of the model.
     */

    class triangle_t : public kaitai::kstruct {

    public:

        triangle_t(kaitai::kstream* p__io, stl_t* p__parent = 0, stl_t* p__root = 0);

    private:
        void _read();

    public:
        ~triangle_t();

    private:
        vec3d_t* m_normal;
        std::vector<vec3d_t*>* m_vertices;
        uint16_t m_abr;
        stl_t* m__root;
        stl_t* m__parent;

    public:
        vec3d_t* normal() const { return m_normal; }
        std::vector<vec3d_t*>* vertices() const { return m_vertices; }

        /**
         * In theory (per standard), it's "attribute byte count" with
         * no other details given on what "attribute" is and what
         * should be stored in this field.
         * 
         * In practice, software dealing with STL either expected to
         * see 0 here, or uses this 16-bit field per se to store
         * additional attributes (such as RGB color of a vertex or
         * color index).
         */
        uint16_t abr() const { return m_abr; }
        stl_t* _root() const { return m__root; }
        stl_t* _parent() const { return m__parent; }
    };

    class vec3d_t : public kaitai::kstruct {

    public:

        vec3d_t(kaitai::kstream* p__io, stl_t::triangle_t* p__parent = 0, stl_t* p__root = 0);

    private:
        void _read();

    public:
        ~vec3d_t();

    private:
        float m_x;
        float m_y;
        float m_z;
        stl_t* m__root;
        stl_t::triangle_t* m__parent;

    public:
        float x() const { return m_x; }
        float y() const { return m_y; }
        float z() const { return m_z; }
        stl_t* _root() const { return m__root; }
        stl_t::triangle_t* _parent() const { return m__parent; }
    };

private:
    std::string m_header;
    uint32_t m_num_triangles;
    std::vector<triangle_t*>* m_triangles;
    stl_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string header() const { return m_header; }
    uint32_t num_triangles() const { return m_num_triangles; }
    std::vector<triangle_t*>* triangles() const { return m_triangles; }
    stl_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // STL_H_

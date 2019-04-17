// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "stl.h"



stl_t::stl_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, stl_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void stl_t::_read() {
    m_header = m__io->read_bytes(80);
    m_num_triangles = m__io->read_u4le();
    int l_triangles = num_triangles();
    m_triangles = new std::vector<triangle_t*>();
    m_triangles->reserve(l_triangles);
    for (int i = 0; i < l_triangles; i++) {
        m_triangles->push_back(new triangle_t(m__io, this, m__root));
    }
}

stl_t::~stl_t() {
    for (std::vector<triangle_t*>::iterator it = m_triangles->begin(); it != m_triangles->end(); ++it) {
        delete *it;
    }
    delete m_triangles;
}

stl_t::triangle_t::triangle_t(kaitai::kstream* p__io, stl_t* p__parent, stl_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void stl_t::triangle_t::_read() {
    m_normal = new vec3d_t(m__io, this, m__root);
    int l_vertices = 3;
    m_vertices = new std::vector<vec3d_t*>();
    m_vertices->reserve(l_vertices);
    for (int i = 0; i < l_vertices; i++) {
        m_vertices->push_back(new vec3d_t(m__io, this, m__root));
    }
}

stl_t::triangle_t::~triangle_t() {
    delete m_normal;
    for (std::vector<vec3d_t*>::iterator it = m_vertices->begin(); it != m_vertices->end(); ++it) {
        delete *it;
    }
    delete m_vertices;
}

stl_t::vec3d_t::vec3d_t(kaitai::kstream* p__io, stl_t::triangle_t* p__parent, stl_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void stl_t::vec3d_t::_read() {
    m_x = m__io->read_f4le();
    m_y = m__io->read_f4le();
    m_z = m__io->read_f4le();
    m_abr = m__io->read_u2le();
}

stl_t::vec3d_t::~vec3d_t() {
}

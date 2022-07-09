// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "stl.h"

stl_t::stl_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, stl_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_triangles = nullptr;
    _read();
}

void stl_t::_read() {
    m_header = m__io->read_bytes(80);
    m_num_triangles = m__io->read_u4le();
    m_triangles = std::unique_ptr<std::vector<std::unique_ptr<triangle_t>>>(new std::vector<std::unique_ptr<triangle_t>>());
    const int l_triangles = num_triangles();
    for (int i = 0; i < l_triangles; i++) {
        m_triangles->push_back(std::move(std::unique_ptr<triangle_t>(new triangle_t(m__io, this, m__root))));
    }
}

stl_t::~stl_t() {
    _clean_up();
}

void stl_t::_clean_up() {
}

stl_t::triangle_t::triangle_t(kaitai::kstream* p__io, stl_t* p__parent, stl_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_normal = nullptr;
    m_vertices = nullptr;
    _read();
}

void stl_t::triangle_t::_read() {
    m_normal = std::unique_ptr<vec3d_t>(new vec3d_t(m__io, this, m__root));
    m_vertices = std::unique_ptr<std::vector<std::unique_ptr<vec3d_t>>>(new std::vector<std::unique_ptr<vec3d_t>>());
    const int l_vertices = 3;
    for (int i = 0; i < l_vertices; i++) {
        m_vertices->push_back(std::move(std::unique_ptr<vec3d_t>(new vec3d_t(m__io, this, m__root))));
    }
    m_abr = m__io->read_u2le();
}

stl_t::triangle_t::~triangle_t() {
    _clean_up();
}

void stl_t::triangle_t::_clean_up() {
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
}

stl_t::vec3d_t::~vec3d_t() {
    _clean_up();
}

void stl_t::vec3d_t::_clean_up() {
}

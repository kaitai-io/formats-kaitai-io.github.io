// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "renderware_binary_stream.h"



renderware_binary_stream_t::renderware_binary_stream_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, renderware_binary_stream_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void renderware_binary_stream_t::_read() {
    m_code = static_cast<renderware_binary_stream_t::sections_t>(m__io->read_u4le());
    m_size = m__io->read_u4le();
    m_version = m__io->read_u4le();
    switch (code()) {
    case SECTIONS_TEXTURE_DICTIONARY:
        m__raw_body = m__io->read_bytes(size());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new list_with_header_t(m__io__raw_body, this, m__root);
        break;
    case SECTIONS_GEOMETRY_LIST:
        m__raw_body = m__io->read_bytes(size());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new list_with_header_t(m__io__raw_body, this, m__root);
        break;
    case SECTIONS_CLUMP:
        m__raw_body = m__io->read_bytes(size());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new list_with_header_t(m__io__raw_body, this, m__root);
        break;
    case SECTIONS_TEXTURE_NATIVE:
        m__raw_body = m__io->read_bytes(size());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new list_with_header_t(m__io__raw_body, this, m__root);
        break;
    case SECTIONS_FRAME_LIST:
        m__raw_body = m__io->read_bytes(size());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new list_with_header_t(m__io__raw_body, this, m__root);
        break;
    case SECTIONS_GEOMETRY:
        m__raw_body = m__io->read_bytes(size());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new list_with_header_t(m__io__raw_body, this, m__root);
        break;
    default:
        m__raw_body = m__io->read_bytes(size());
        break;
    }
}

renderware_binary_stream_t::~renderware_binary_stream_t() {
}

renderware_binary_stream_t::struct_clump_t::struct_clump_t(kaitai::kstream *p_io, renderware_binary_stream_t::list_with_header_t* p_parent, renderware_binary_stream_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void renderware_binary_stream_t::struct_clump_t::_read() {
    m_num_atomics = m__io->read_u4le();
    n_num_lights = true;
    if (_parent()->version() >= 208896) {
        n_num_lights = false;
        m_num_lights = m__io->read_u4le();
    }
    n_num_cameras = true;
    if (_parent()->version() >= 208896) {
        n_num_cameras = false;
        m_num_cameras = m__io->read_u4le();
    }
}

renderware_binary_stream_t::struct_clump_t::~struct_clump_t() {
}

renderware_binary_stream_t::struct_geometry_t::struct_geometry_t(kaitai::kstream *p_io, renderware_binary_stream_t::list_with_header_t* p_parent, renderware_binary_stream_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_is_textured = false;
    f_is_prelit = false;
    f_is_textured2 = false;
    f_is_native = false;
    _read();
}

void renderware_binary_stream_t::struct_geometry_t::_read() {
    m_format = m__io->read_u4le();
    m_num_triangles = m__io->read_u4le();
    m_num_vertices = m__io->read_u4le();
    m_num_morph_targets = m__io->read_u4le();
    n_surf_prop = true;
    if (_parent()->version() < 212992) {
        n_surf_prop = false;
        m_surf_prop = new surface_properties_t(m__io, this, m__root);
    }
    n_geometry = true;
    if (!(is_native())) {
        n_geometry = false;
        m_geometry = new geometry_non_native_t(m__io, this, m__root);
    }
    int l_morph_targets = num_morph_targets();
    m_morph_targets = new std::vector<morph_target_t*>();
    m_morph_targets->reserve(l_morph_targets);
    for (int i = 0; i < l_morph_targets; i++) {
        m_morph_targets->push_back(new morph_target_t(m__io, this, m__root));
    }
}

renderware_binary_stream_t::struct_geometry_t::~struct_geometry_t() {
    if (!n_surf_prop) {
        delete m_surf_prop;
    }
    if (!n_geometry) {
        delete m_geometry;
    }
    for (std::vector<morph_target_t*>::iterator it = m_morph_targets->begin(); it != m_morph_targets->end(); ++it) {
        delete *it;
    }
    delete m_morph_targets;
}

bool renderware_binary_stream_t::struct_geometry_t::is_textured() {
    if (f_is_textured)
        return m_is_textured;
    m_is_textured = (format() & 4) != 0;
    f_is_textured = true;
    return m_is_textured;
}

bool renderware_binary_stream_t::struct_geometry_t::is_prelit() {
    if (f_is_prelit)
        return m_is_prelit;
    m_is_prelit = (format() & 8) != 0;
    f_is_prelit = true;
    return m_is_prelit;
}

bool renderware_binary_stream_t::struct_geometry_t::is_textured2() {
    if (f_is_textured2)
        return m_is_textured2;
    m_is_textured2 = (format() & 128) != 0;
    f_is_textured2 = true;
    return m_is_textured2;
}

bool renderware_binary_stream_t::struct_geometry_t::is_native() {
    if (f_is_native)
        return m_is_native;
    m_is_native = (format() & 16777216) != 0;
    f_is_native = true;
    return m_is_native;
}

renderware_binary_stream_t::geometry_non_native_t::geometry_non_native_t(kaitai::kstream *p_io, renderware_binary_stream_t::struct_geometry_t* p_parent, renderware_binary_stream_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void renderware_binary_stream_t::geometry_non_native_t::_read() {
    n_prelit_colors = true;
    if (_parent()->is_prelit()) {
        n_prelit_colors = false;
        int l_prelit_colors = _parent()->num_vertices();
        m_prelit_colors = new std::vector<rgba_t*>();
        m_prelit_colors->reserve(l_prelit_colors);
        for (int i = 0; i < l_prelit_colors; i++) {
            m_prelit_colors->push_back(new rgba_t(m__io, this, m__root));
        }
    }
    n_tex_coords = true;
    if ( ((_parent()->is_textured()) || (_parent()->is_textured2())) ) {
        n_tex_coords = false;
        int l_tex_coords = _parent()->num_vertices();
        m_tex_coords = new std::vector<tex_coord_t*>();
        m_tex_coords->reserve(l_tex_coords);
        for (int i = 0; i < l_tex_coords; i++) {
            m_tex_coords->push_back(new tex_coord_t(m__io, this, m__root));
        }
    }
    int l_triangles = _parent()->num_triangles();
    m_triangles = new std::vector<triangle_t*>();
    m_triangles->reserve(l_triangles);
    for (int i = 0; i < l_triangles; i++) {
        m_triangles->push_back(new triangle_t(m__io, this, m__root));
    }
}

renderware_binary_stream_t::geometry_non_native_t::~geometry_non_native_t() {
    if (!n_prelit_colors) {
        for (std::vector<rgba_t*>::iterator it = m_prelit_colors->begin(); it != m_prelit_colors->end(); ++it) {
            delete *it;
        }
        delete m_prelit_colors;
    }
    if (!n_tex_coords) {
        for (std::vector<tex_coord_t*>::iterator it = m_tex_coords->begin(); it != m_tex_coords->end(); ++it) {
            delete *it;
        }
        delete m_tex_coords;
    }
    for (std::vector<triangle_t*>::iterator it = m_triangles->begin(); it != m_triangles->end(); ++it) {
        delete *it;
    }
    delete m_triangles;
}

renderware_binary_stream_t::struct_geometry_list_t::struct_geometry_list_t(kaitai::kstream *p_io, renderware_binary_stream_t::list_with_header_t* p_parent, renderware_binary_stream_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void renderware_binary_stream_t::struct_geometry_list_t::_read() {
    m_num_geometries = m__io->read_u4le();
}

renderware_binary_stream_t::struct_geometry_list_t::~struct_geometry_list_t() {
}

renderware_binary_stream_t::rgba_t::rgba_t(kaitai::kstream *p_io, renderware_binary_stream_t::geometry_non_native_t* p_parent, renderware_binary_stream_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void renderware_binary_stream_t::rgba_t::_read() {
    m_r = m__io->read_u1();
    m_g = m__io->read_u1();
    m_b = m__io->read_u1();
    m_a = m__io->read_u1();
}

renderware_binary_stream_t::rgba_t::~rgba_t() {
}

renderware_binary_stream_t::sphere_t::sphere_t(kaitai::kstream *p_io, renderware_binary_stream_t::morph_target_t* p_parent, renderware_binary_stream_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void renderware_binary_stream_t::sphere_t::_read() {
    m_x = m__io->read_f4le();
    m_y = m__io->read_f4le();
    m_z = m__io->read_f4le();
    m_radius = m__io->read_f4le();
}

renderware_binary_stream_t::sphere_t::~sphere_t() {
}

renderware_binary_stream_t::morph_target_t::morph_target_t(kaitai::kstream *p_io, renderware_binary_stream_t::struct_geometry_t* p_parent, renderware_binary_stream_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void renderware_binary_stream_t::morph_target_t::_read() {
    m_bounding_sphere = new sphere_t(m__io, this, m__root);
    m_has_vertices = m__io->read_u4le();
    m_has_normals = m__io->read_u4le();
    n_vertices = true;
    if (has_vertices() != 0) {
        n_vertices = false;
        int l_vertices = _parent()->num_vertices();
        m_vertices = new std::vector<vector_3d_t*>();
        m_vertices->reserve(l_vertices);
        for (int i = 0; i < l_vertices; i++) {
            m_vertices->push_back(new vector_3d_t(m__io, this, m__root));
        }
    }
    n_normals = true;
    if (has_normals() != 0) {
        n_normals = false;
        int l_normals = _parent()->num_vertices();
        m_normals = new std::vector<vector_3d_t*>();
        m_normals->reserve(l_normals);
        for (int i = 0; i < l_normals; i++) {
            m_normals->push_back(new vector_3d_t(m__io, this, m__root));
        }
    }
}

renderware_binary_stream_t::morph_target_t::~morph_target_t() {
    delete m_bounding_sphere;
    if (!n_vertices) {
        for (std::vector<vector_3d_t*>::iterator it = m_vertices->begin(); it != m_vertices->end(); ++it) {
            delete *it;
        }
        delete m_vertices;
    }
    if (!n_normals) {
        for (std::vector<vector_3d_t*>::iterator it = m_normals->begin(); it != m_normals->end(); ++it) {
            delete *it;
        }
        delete m_normals;
    }
}

renderware_binary_stream_t::surface_properties_t::surface_properties_t(kaitai::kstream *p_io, renderware_binary_stream_t::struct_geometry_t* p_parent, renderware_binary_stream_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void renderware_binary_stream_t::surface_properties_t::_read() {
    m_ambient = m__io->read_f4le();
    m_specular = m__io->read_f4le();
    m_diffuse = m__io->read_f4le();
}

renderware_binary_stream_t::surface_properties_t::~surface_properties_t() {
}

renderware_binary_stream_t::struct_frame_list_t::struct_frame_list_t(kaitai::kstream *p_io, renderware_binary_stream_t::list_with_header_t* p_parent, renderware_binary_stream_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void renderware_binary_stream_t::struct_frame_list_t::_read() {
    m_num_frames = m__io->read_u4le();
    int l_frames = num_frames();
    m_frames = new std::vector<frame_t*>();
    m_frames->reserve(l_frames);
    for (int i = 0; i < l_frames; i++) {
        m_frames->push_back(new frame_t(m__io, this, m__root));
    }
}

renderware_binary_stream_t::struct_frame_list_t::~struct_frame_list_t() {
    for (std::vector<frame_t*>::iterator it = m_frames->begin(); it != m_frames->end(); ++it) {
        delete *it;
    }
    delete m_frames;
}

renderware_binary_stream_t::matrix_t::matrix_t(kaitai::kstream *p_io, renderware_binary_stream_t::frame_t* p_parent, renderware_binary_stream_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void renderware_binary_stream_t::matrix_t::_read() {
    int l_entries = 3;
    m_entries = new std::vector<vector_3d_t*>();
    m_entries->reserve(l_entries);
    for (int i = 0; i < l_entries; i++) {
        m_entries->push_back(new vector_3d_t(m__io, this, m__root));
    }
}

renderware_binary_stream_t::matrix_t::~matrix_t() {
    for (std::vector<vector_3d_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
        delete *it;
    }
    delete m_entries;
}

renderware_binary_stream_t::vector_3d_t::vector_3d_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, renderware_binary_stream_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void renderware_binary_stream_t::vector_3d_t::_read() {
    m_x = m__io->read_f4le();
    m_y = m__io->read_f4le();
    m_z = m__io->read_f4le();
}

renderware_binary_stream_t::vector_3d_t::~vector_3d_t() {
}

renderware_binary_stream_t::list_with_header_t::list_with_header_t(kaitai::kstream *p_io, renderware_binary_stream_t* p_parent, renderware_binary_stream_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void renderware_binary_stream_t::list_with_header_t::_read() {
    m_code = m__io->ensure_fixed_contents(std::string("\x01\x00\x00\x00", 4));
    m_header_size = m__io->read_u4le();
    m_version = m__io->read_u4le();
    switch (_parent()->code()) {
    case SECTIONS_TEXTURE_DICTIONARY:
        m__raw_header = m__io->read_bytes(header_size());
        m__io__raw_header = new kaitai::kstream(m__raw_header);
        m_header = new struct_texture_dictionary_t(m__io__raw_header, this, m__root);
        break;
    case SECTIONS_GEOMETRY_LIST:
        m__raw_header = m__io->read_bytes(header_size());
        m__io__raw_header = new kaitai::kstream(m__raw_header);
        m_header = new struct_geometry_list_t(m__io__raw_header, this, m__root);
        break;
    case SECTIONS_CLUMP:
        m__raw_header = m__io->read_bytes(header_size());
        m__io__raw_header = new kaitai::kstream(m__raw_header);
        m_header = new struct_clump_t(m__io__raw_header, this, m__root);
        break;
    case SECTIONS_FRAME_LIST:
        m__raw_header = m__io->read_bytes(header_size());
        m__io__raw_header = new kaitai::kstream(m__raw_header);
        m_header = new struct_frame_list_t(m__io__raw_header, this, m__root);
        break;
    case SECTIONS_GEOMETRY:
        m__raw_header = m__io->read_bytes(header_size());
        m__io__raw_header = new kaitai::kstream(m__raw_header);
        m_header = new struct_geometry_t(m__io__raw_header, this, m__root);
        break;
    default:
        m__raw_header = m__io->read_bytes(header_size());
        break;
    }
    m_entries = new std::vector<renderware_binary_stream_t*>();
    while (!m__io->is_eof()) {
        m_entries->push_back(new renderware_binary_stream_t(m__io));
    }
}

renderware_binary_stream_t::list_with_header_t::~list_with_header_t() {
    for (std::vector<renderware_binary_stream_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
        delete *it;
    }
    delete m_entries;
}

renderware_binary_stream_t::triangle_t::triangle_t(kaitai::kstream *p_io, renderware_binary_stream_t::geometry_non_native_t* p_parent, renderware_binary_stream_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void renderware_binary_stream_t::triangle_t::_read() {
    m_vertex2 = m__io->read_u2le();
    m_vertex1 = m__io->read_u2le();
    m_material_id = m__io->read_u2le();
    m_vertex3 = m__io->read_u2le();
}

renderware_binary_stream_t::triangle_t::~triangle_t() {
}

renderware_binary_stream_t::frame_t::frame_t(kaitai::kstream *p_io, renderware_binary_stream_t::struct_frame_list_t* p_parent, renderware_binary_stream_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void renderware_binary_stream_t::frame_t::_read() {
    m_rotation_matrix = new matrix_t(m__io, this, m__root);
    m_position = new vector_3d_t(m__io, this, m__root);
    m_cur_frame_idx = m__io->read_s4le();
    m_matrix_creation_flags = m__io->read_u4le();
}

renderware_binary_stream_t::frame_t::~frame_t() {
    delete m_rotation_matrix;
    delete m_position;
}

renderware_binary_stream_t::tex_coord_t::tex_coord_t(kaitai::kstream *p_io, renderware_binary_stream_t::geometry_non_native_t* p_parent, renderware_binary_stream_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void renderware_binary_stream_t::tex_coord_t::_read() {
    m_u = m__io->read_f4le();
    m_v = m__io->read_f4le();
}

renderware_binary_stream_t::tex_coord_t::~tex_coord_t() {
}

renderware_binary_stream_t::struct_texture_dictionary_t::struct_texture_dictionary_t(kaitai::kstream *p_io, renderware_binary_stream_t::list_with_header_t* p_parent, renderware_binary_stream_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void renderware_binary_stream_t::struct_texture_dictionary_t::_read() {
    m_num_textures = m__io->read_u4le();
}

renderware_binary_stream_t::struct_texture_dictionary_t::~struct_texture_dictionary_t() {
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "renderware_binary_stream.h"
#include "kaitai/exceptions.h"

renderware_binary_stream_t::renderware_binary_stream_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, renderware_binary_stream_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m__io__raw_body = 0;
    f_version = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void renderware_binary_stream_t::_read() {
    m_code = static_cast<renderware_binary_stream_t::sections_t>(m__io->read_u4le());
    m_size = m__io->read_u4le();
    m_library_id_stamp = m__io->read_u4le();
    n_body = true;
    switch (code()) {
    case renderware_binary_stream_t::SECTIONS_ATOMIC: {
        n_body = false;
        m__raw_body = m__io->read_bytes(size());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new list_with_header_t(m__io__raw_body, this, m__root);
        break;
    }
    case renderware_binary_stream_t::SECTIONS_GEOMETRY: {
        n_body = false;
        m__raw_body = m__io->read_bytes(size());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new list_with_header_t(m__io__raw_body, this, m__root);
        break;
    }
    case renderware_binary_stream_t::SECTIONS_TEXTURE_DICTIONARY: {
        n_body = false;
        m__raw_body = m__io->read_bytes(size());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new list_with_header_t(m__io__raw_body, this, m__root);
        break;
    }
    case renderware_binary_stream_t::SECTIONS_GEOMETRY_LIST: {
        n_body = false;
        m__raw_body = m__io->read_bytes(size());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new list_with_header_t(m__io__raw_body, this, m__root);
        break;
    }
    case renderware_binary_stream_t::SECTIONS_TEXTURE_NATIVE: {
        n_body = false;
        m__raw_body = m__io->read_bytes(size());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new list_with_header_t(m__io__raw_body, this, m__root);
        break;
    }
    case renderware_binary_stream_t::SECTIONS_CLUMP: {
        n_body = false;
        m__raw_body = m__io->read_bytes(size());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new list_with_header_t(m__io__raw_body, this, m__root);
        break;
    }
    case renderware_binary_stream_t::SECTIONS_FRAME_LIST: {
        n_body = false;
        m__raw_body = m__io->read_bytes(size());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new list_with_header_t(m__io__raw_body, this, m__root);
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes(size());
        break;
    }
    }
}

renderware_binary_stream_t::~renderware_binary_stream_t() {
    _clean_up();
}

void renderware_binary_stream_t::_clean_up() {
    if (!n_body) {
        if (m__io__raw_body) {
            delete m__io__raw_body; m__io__raw_body = 0;
        }
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

renderware_binary_stream_t::struct_clump_t::struct_clump_t(kaitai::kstream* p__io, renderware_binary_stream_t::list_with_header_t* p__parent, renderware_binary_stream_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    _clean_up();
}

void renderware_binary_stream_t::struct_clump_t::_clean_up() {
    if (!n_num_lights) {
    }
    if (!n_num_cameras) {
    }
}

renderware_binary_stream_t::struct_geometry_t::struct_geometry_t(kaitai::kstream* p__io, renderware_binary_stream_t::list_with_header_t* p__parent, renderware_binary_stream_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_surf_prop = 0;
    m_geometry = 0;
    m_morph_targets = 0;
    f_num_uv_layers_raw = false;
    f_is_textured = false;
    f_is_native = false;
    f_num_uv_layers = false;
    f_is_textured2 = false;
    f_is_prelit = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_morph_targets = new std::vector<morph_target_t*>();
    const int l_morph_targets = num_morph_targets();
    for (int i = 0; i < l_morph_targets; i++) {
        m_morph_targets->push_back(new morph_target_t(m__io, this, m__root));
    }
}

renderware_binary_stream_t::struct_geometry_t::~struct_geometry_t() {
    _clean_up();
}

void renderware_binary_stream_t::struct_geometry_t::_clean_up() {
    if (!n_surf_prop) {
        if (m_surf_prop) {
            delete m_surf_prop; m_surf_prop = 0;
        }
    }
    if (!n_geometry) {
        if (m_geometry) {
            delete m_geometry; m_geometry = 0;
        }
    }
    if (m_morph_targets) {
        for (std::vector<morph_target_t*>::iterator it = m_morph_targets->begin(); it != m_morph_targets->end(); ++it) {
            delete *it;
        }
        delete m_morph_targets; m_morph_targets = 0;
    }
}

int32_t renderware_binary_stream_t::struct_geometry_t::num_uv_layers_raw() {
    if (f_num_uv_layers_raw)
        return m_num_uv_layers_raw;
    m_num_uv_layers_raw = ((format() & 16711680) >> 16);
    f_num_uv_layers_raw = true;
    return m_num_uv_layers_raw;
}

bool renderware_binary_stream_t::struct_geometry_t::is_textured() {
    if (f_is_textured)
        return m_is_textured;
    m_is_textured = (format() & 4) != 0;
    f_is_textured = true;
    return m_is_textured;
}

bool renderware_binary_stream_t::struct_geometry_t::is_native() {
    if (f_is_native)
        return m_is_native;
    m_is_native = (format() & 16777216) != 0;
    f_is_native = true;
    return m_is_native;
}

int32_t renderware_binary_stream_t::struct_geometry_t::num_uv_layers() {
    if (f_num_uv_layers)
        return m_num_uv_layers;
    m_num_uv_layers = ((num_uv_layers_raw() == 0) ? (((is_textured2()) ? (2) : (((is_textured()) ? (1) : (0))))) : (num_uv_layers_raw()));
    f_num_uv_layers = true;
    return m_num_uv_layers;
}

bool renderware_binary_stream_t::struct_geometry_t::is_textured2() {
    if (f_is_textured2)
        return m_is_textured2;
    m_is_textured2 = (format() & 128) != 0;
    f_is_textured2 = true;
    return m_is_textured2;
}

bool renderware_binary_stream_t::struct_geometry_t::is_prelit() {
    if (f_is_prelit)
        return m_is_prelit;
    m_is_prelit = (format() & 8) != 0;
    f_is_prelit = true;
    return m_is_prelit;
}

renderware_binary_stream_t::geometry_non_native_t::geometry_non_native_t(kaitai::kstream* p__io, renderware_binary_stream_t::struct_geometry_t* p__parent, renderware_binary_stream_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_prelit_colors = 0;
    m_uv_layers = 0;
    m_triangles = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void renderware_binary_stream_t::geometry_non_native_t::_read() {
    n_prelit_colors = true;
    if (_parent()->is_prelit()) {
        n_prelit_colors = false;
        m_prelit_colors = new std::vector<rgba_t*>();
        const int l_prelit_colors = _parent()->num_vertices();
        for (int i = 0; i < l_prelit_colors; i++) {
            m_prelit_colors->push_back(new rgba_t(m__io, this, m__root));
        }
    }
    m_uv_layers = new std::vector<uv_layer_t*>();
    const int l_uv_layers = _parent()->num_uv_layers();
    for (int i = 0; i < l_uv_layers; i++) {
        m_uv_layers->push_back(new uv_layer_t(_parent()->num_vertices(), m__io, this, m__root));
    }
    m_triangles = new std::vector<triangle_t*>();
    const int l_triangles = _parent()->num_triangles();
    for (int i = 0; i < l_triangles; i++) {
        m_triangles->push_back(new triangle_t(m__io, this, m__root));
    }
}

renderware_binary_stream_t::geometry_non_native_t::~geometry_non_native_t() {
    _clean_up();
}

void renderware_binary_stream_t::geometry_non_native_t::_clean_up() {
    if (!n_prelit_colors) {
        if (m_prelit_colors) {
            for (std::vector<rgba_t*>::iterator it = m_prelit_colors->begin(); it != m_prelit_colors->end(); ++it) {
                delete *it;
            }
            delete m_prelit_colors; m_prelit_colors = 0;
        }
    }
    if (m_uv_layers) {
        for (std::vector<uv_layer_t*>::iterator it = m_uv_layers->begin(); it != m_uv_layers->end(); ++it) {
            delete *it;
        }
        delete m_uv_layers; m_uv_layers = 0;
    }
    if (m_triangles) {
        for (std::vector<triangle_t*>::iterator it = m_triangles->begin(); it != m_triangles->end(); ++it) {
            delete *it;
        }
        delete m_triangles; m_triangles = 0;
    }
}

renderware_binary_stream_t::struct_geometry_list_t::struct_geometry_list_t(kaitai::kstream* p__io, renderware_binary_stream_t::list_with_header_t* p__parent, renderware_binary_stream_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void renderware_binary_stream_t::struct_geometry_list_t::_read() {
    m_num_geometries = m__io->read_u4le();
}

renderware_binary_stream_t::struct_geometry_list_t::~struct_geometry_list_t() {
    _clean_up();
}

void renderware_binary_stream_t::struct_geometry_list_t::_clean_up() {
}

renderware_binary_stream_t::rgba_t::rgba_t(kaitai::kstream* p__io, renderware_binary_stream_t::geometry_non_native_t* p__parent, renderware_binary_stream_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void renderware_binary_stream_t::rgba_t::_read() {
    m_r = m__io->read_u1();
    m_g = m__io->read_u1();
    m_b = m__io->read_u1();
    m_a = m__io->read_u1();
}

renderware_binary_stream_t::rgba_t::~rgba_t() {
    _clean_up();
}

void renderware_binary_stream_t::rgba_t::_clean_up() {
}

renderware_binary_stream_t::sphere_t::sphere_t(kaitai::kstream* p__io, renderware_binary_stream_t::morph_target_t* p__parent, renderware_binary_stream_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void renderware_binary_stream_t::sphere_t::_read() {
    m_x = m__io->read_f4le();
    m_y = m__io->read_f4le();
    m_z = m__io->read_f4le();
    m_radius = m__io->read_f4le();
}

renderware_binary_stream_t::sphere_t::~sphere_t() {
    _clean_up();
}

void renderware_binary_stream_t::sphere_t::_clean_up() {
}

renderware_binary_stream_t::morph_target_t::morph_target_t(kaitai::kstream* p__io, renderware_binary_stream_t::struct_geometry_t* p__parent, renderware_binary_stream_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bounding_sphere = 0;
    m_vertices = 0;
    m_normals = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void renderware_binary_stream_t::morph_target_t::_read() {
    m_bounding_sphere = new sphere_t(m__io, this, m__root);
    m_has_vertices = m__io->read_u4le();
    m_has_normals = m__io->read_u4le();
    n_vertices = true;
    if (has_vertices() != 0) {
        n_vertices = false;
        m_vertices = new std::vector<vector_3d_t*>();
        const int l_vertices = _parent()->num_vertices();
        for (int i = 0; i < l_vertices; i++) {
            m_vertices->push_back(new vector_3d_t(m__io, this, m__root));
        }
    }
    n_normals = true;
    if (has_normals() != 0) {
        n_normals = false;
        m_normals = new std::vector<vector_3d_t*>();
        const int l_normals = _parent()->num_vertices();
        for (int i = 0; i < l_normals; i++) {
            m_normals->push_back(new vector_3d_t(m__io, this, m__root));
        }
    }
}

renderware_binary_stream_t::morph_target_t::~morph_target_t() {
    _clean_up();
}

void renderware_binary_stream_t::morph_target_t::_clean_up() {
    if (m_bounding_sphere) {
        delete m_bounding_sphere; m_bounding_sphere = 0;
    }
    if (!n_vertices) {
        if (m_vertices) {
            for (std::vector<vector_3d_t*>::iterator it = m_vertices->begin(); it != m_vertices->end(); ++it) {
                delete *it;
            }
            delete m_vertices; m_vertices = 0;
        }
    }
    if (!n_normals) {
        if (m_normals) {
            for (std::vector<vector_3d_t*>::iterator it = m_normals->begin(); it != m_normals->end(); ++it) {
                delete *it;
            }
            delete m_normals; m_normals = 0;
        }
    }
}

renderware_binary_stream_t::struct_atomic_t::struct_atomic_t(kaitai::kstream* p__io, renderware_binary_stream_t::list_with_header_t* p__parent, renderware_binary_stream_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void renderware_binary_stream_t::struct_atomic_t::_read() {
    m_frame_index = m__io->read_u4le();
    m_geometry_index = m__io->read_u4le();
    m_flag_render = m__io->read_bits_int_le(1);
    m__unnamed3 = m__io->read_bits_int_le(1);
    m_flag_collision_test = m__io->read_bits_int_le(1);
    m__unnamed5 = m__io->read_bits_int_le(29);
    m__io->align_to_byte();
    m_unused = m__io->read_u4le();
}

renderware_binary_stream_t::struct_atomic_t::~struct_atomic_t() {
    _clean_up();
}

void renderware_binary_stream_t::struct_atomic_t::_clean_up() {
}

renderware_binary_stream_t::surface_properties_t::surface_properties_t(kaitai::kstream* p__io, renderware_binary_stream_t::struct_geometry_t* p__parent, renderware_binary_stream_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void renderware_binary_stream_t::surface_properties_t::_read() {
    m_ambient = m__io->read_f4le();
    m_specular = m__io->read_f4le();
    m_diffuse = m__io->read_f4le();
}

renderware_binary_stream_t::surface_properties_t::~surface_properties_t() {
    _clean_up();
}

void renderware_binary_stream_t::surface_properties_t::_clean_up() {
}

renderware_binary_stream_t::struct_frame_list_t::struct_frame_list_t(kaitai::kstream* p__io, renderware_binary_stream_t::list_with_header_t* p__parent, renderware_binary_stream_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_frames = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void renderware_binary_stream_t::struct_frame_list_t::_read() {
    m_num_frames = m__io->read_u4le();
    m_frames = new std::vector<frame_t*>();
    const int l_frames = num_frames();
    for (int i = 0; i < l_frames; i++) {
        m_frames->push_back(new frame_t(m__io, this, m__root));
    }
}

renderware_binary_stream_t::struct_frame_list_t::~struct_frame_list_t() {
    _clean_up();
}

void renderware_binary_stream_t::struct_frame_list_t::_clean_up() {
    if (m_frames) {
        for (std::vector<frame_t*>::iterator it = m_frames->begin(); it != m_frames->end(); ++it) {
            delete *it;
        }
        delete m_frames; m_frames = 0;
    }
}

renderware_binary_stream_t::matrix_t::matrix_t(kaitai::kstream* p__io, renderware_binary_stream_t::frame_t* p__parent, renderware_binary_stream_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void renderware_binary_stream_t::matrix_t::_read() {
    m_entries = new std::vector<vector_3d_t*>();
    const int l_entries = 3;
    for (int i = 0; i < l_entries; i++) {
        m_entries->push_back(new vector_3d_t(m__io, this, m__root));
    }
}

renderware_binary_stream_t::matrix_t::~matrix_t() {
    _clean_up();
}

void renderware_binary_stream_t::matrix_t::_clean_up() {
    if (m_entries) {
        for (std::vector<vector_3d_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

renderware_binary_stream_t::vector_3d_t::vector_3d_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, renderware_binary_stream_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void renderware_binary_stream_t::vector_3d_t::_read() {
    m_x = m__io->read_f4le();
    m_y = m__io->read_f4le();
    m_z = m__io->read_f4le();
}

renderware_binary_stream_t::vector_3d_t::~vector_3d_t() {
    _clean_up();
}

void renderware_binary_stream_t::vector_3d_t::_clean_up() {
}

renderware_binary_stream_t::list_with_header_t::list_with_header_t(kaitai::kstream* p__io, renderware_binary_stream_t* p__parent, renderware_binary_stream_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_header = 0;
    m_entries = 0;
    f_version = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void renderware_binary_stream_t::list_with_header_t::_read() {
    m_code = m__io->read_bytes(4);
    if (!(code() == std::string("\x01\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x01\x00\x00\x00", 4), code(), _io(), std::string("/types/list_with_header/seq/0"));
    }
    m_header_size = m__io->read_u4le();
    m_library_id_stamp = m__io->read_u4le();
    n_header = true;
    switch (_parent()->code()) {
    case renderware_binary_stream_t::SECTIONS_ATOMIC: {
        n_header = false;
        m__raw_header = m__io->read_bytes(header_size());
        m__io__raw_header = new kaitai::kstream(m__raw_header);
        m_header = new struct_atomic_t(m__io__raw_header, this, m__root);
        break;
    }
    case renderware_binary_stream_t::SECTIONS_GEOMETRY: {
        n_header = false;
        m__raw_header = m__io->read_bytes(header_size());
        m__io__raw_header = new kaitai::kstream(m__raw_header);
        m_header = new struct_geometry_t(m__io__raw_header, this, m__root);
        break;
    }
    case renderware_binary_stream_t::SECTIONS_TEXTURE_DICTIONARY: {
        n_header = false;
        m__raw_header = m__io->read_bytes(header_size());
        m__io__raw_header = new kaitai::kstream(m__raw_header);
        m_header = new struct_texture_dictionary_t(m__io__raw_header, this, m__root);
        break;
    }
    case renderware_binary_stream_t::SECTIONS_GEOMETRY_LIST: {
        n_header = false;
        m__raw_header = m__io->read_bytes(header_size());
        m__io__raw_header = new kaitai::kstream(m__raw_header);
        m_header = new struct_geometry_list_t(m__io__raw_header, this, m__root);
        break;
    }
    case renderware_binary_stream_t::SECTIONS_CLUMP: {
        n_header = false;
        m__raw_header = m__io->read_bytes(header_size());
        m__io__raw_header = new kaitai::kstream(m__raw_header);
        m_header = new struct_clump_t(m__io__raw_header, this, m__root);
        break;
    }
    case renderware_binary_stream_t::SECTIONS_FRAME_LIST: {
        n_header = false;
        m__raw_header = m__io->read_bytes(header_size());
        m__io__raw_header = new kaitai::kstream(m__raw_header);
        m_header = new struct_frame_list_t(m__io__raw_header, this, m__root);
        break;
    }
    default: {
        m__raw_header = m__io->read_bytes(header_size());
        break;
    }
    }
    m_entries = new std::vector<renderware_binary_stream_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new renderware_binary_stream_t(m__io));
            i++;
        }
    }
}

renderware_binary_stream_t::list_with_header_t::~list_with_header_t() {
    _clean_up();
}

void renderware_binary_stream_t::list_with_header_t::_clean_up() {
    if (!n_header) {
        if (m__io__raw_header) {
            delete m__io__raw_header; m__io__raw_header = 0;
        }
        if (m_header) {
            delete m_header; m_header = 0;
        }
    }
    if (m_entries) {
        for (std::vector<renderware_binary_stream_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

int32_t renderware_binary_stream_t::list_with_header_t::version() {
    if (f_version)
        return m_version;
    m_version = (((library_id_stamp() & 4294901760UL) != 0) ? (((((library_id_stamp() >> 14) & 261888) + 196608) | ((library_id_stamp() >> 16) & 63))) : ((library_id_stamp() << 8)));
    f_version = true;
    return m_version;
}

renderware_binary_stream_t::triangle_t::triangle_t(kaitai::kstream* p__io, renderware_binary_stream_t::geometry_non_native_t* p__parent, renderware_binary_stream_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void renderware_binary_stream_t::triangle_t::_read() {
    m_vertex2 = m__io->read_u2le();
    m_vertex1 = m__io->read_u2le();
    m_material_id = m__io->read_u2le();
    m_vertex3 = m__io->read_u2le();
}

renderware_binary_stream_t::triangle_t::~triangle_t() {
    _clean_up();
}

void renderware_binary_stream_t::triangle_t::_clean_up() {
}

renderware_binary_stream_t::frame_t::frame_t(kaitai::kstream* p__io, renderware_binary_stream_t::struct_frame_list_t* p__parent, renderware_binary_stream_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_rotation_matrix = 0;
    m_position = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void renderware_binary_stream_t::frame_t::_read() {
    m_rotation_matrix = new matrix_t(m__io, this, m__root);
    m_position = new vector_3d_t(m__io, this, m__root);
    m_cur_frame_idx = m__io->read_s4le();
    m_matrix_creation_flags = m__io->read_u4le();
}

renderware_binary_stream_t::frame_t::~frame_t() {
    _clean_up();
}

void renderware_binary_stream_t::frame_t::_clean_up() {
    if (m_rotation_matrix) {
        delete m_rotation_matrix; m_rotation_matrix = 0;
    }
    if (m_position) {
        delete m_position; m_position = 0;
    }
}

renderware_binary_stream_t::tex_coord_t::tex_coord_t(kaitai::kstream* p__io, renderware_binary_stream_t::uv_layer_t* p__parent, renderware_binary_stream_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void renderware_binary_stream_t::tex_coord_t::_read() {
    m_u = m__io->read_f4le();
    m_v = m__io->read_f4le();
}

renderware_binary_stream_t::tex_coord_t::~tex_coord_t() {
    _clean_up();
}

void renderware_binary_stream_t::tex_coord_t::_clean_up() {
}

renderware_binary_stream_t::uv_layer_t::uv_layer_t(uint32_t p_num_vertices, kaitai::kstream* p__io, renderware_binary_stream_t::geometry_non_native_t* p__parent, renderware_binary_stream_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_num_vertices = p_num_vertices;
    m_tex_coords = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void renderware_binary_stream_t::uv_layer_t::_read() {
    m_tex_coords = new std::vector<tex_coord_t*>();
    const int l_tex_coords = num_vertices();
    for (int i = 0; i < l_tex_coords; i++) {
        m_tex_coords->push_back(new tex_coord_t(m__io, this, m__root));
    }
}

renderware_binary_stream_t::uv_layer_t::~uv_layer_t() {
    _clean_up();
}

void renderware_binary_stream_t::uv_layer_t::_clean_up() {
    if (m_tex_coords) {
        for (std::vector<tex_coord_t*>::iterator it = m_tex_coords->begin(); it != m_tex_coords->end(); ++it) {
            delete *it;
        }
        delete m_tex_coords; m_tex_coords = 0;
    }
}

renderware_binary_stream_t::struct_texture_dictionary_t::struct_texture_dictionary_t(kaitai::kstream* p__io, renderware_binary_stream_t::list_with_header_t* p__parent, renderware_binary_stream_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void renderware_binary_stream_t::struct_texture_dictionary_t::_read() {
    m_num_textures = m__io->read_u4le();
}

renderware_binary_stream_t::struct_texture_dictionary_t::~struct_texture_dictionary_t() {
    _clean_up();
}

void renderware_binary_stream_t::struct_texture_dictionary_t::_clean_up() {
}

int32_t renderware_binary_stream_t::version() {
    if (f_version)
        return m_version;
    m_version = (((library_id_stamp() & 4294901760UL) != 0) ? (((((library_id_stamp() >> 14) & 261888) + 196608) | ((library_id_stamp() >> 16) & 63))) : ((library_id_stamp() << 8)));
    f_version = true;
    return m_version;
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "quake_mdl.h"
#include "kaitai/exceptions.h"

quake_mdl_t::quake_mdl_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, quake_mdl_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = 0;
    m_skins = 0;
    m_texture_coordinates = 0;
    m_triangles = 0;
    m_frames = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void quake_mdl_t::_read() {
    m_header = new mdl_header_t(m__io, this, m__root);
    int l_skins = header()->num_skins();
    m_skins = new std::vector<mdl_skin_t*>();
    m_skins->reserve(l_skins);
    for (int i = 0; i < l_skins; i++) {
        m_skins->push_back(new mdl_skin_t(m__io, this, m__root));
    }
    int l_texture_coordinates = header()->num_verts();
    m_texture_coordinates = new std::vector<mdl_texcoord_t*>();
    m_texture_coordinates->reserve(l_texture_coordinates);
    for (int i = 0; i < l_texture_coordinates; i++) {
        m_texture_coordinates->push_back(new mdl_texcoord_t(m__io, this, m__root));
    }
    int l_triangles = header()->num_tris();
    m_triangles = new std::vector<mdl_triangle_t*>();
    m_triangles->reserve(l_triangles);
    for (int i = 0; i < l_triangles; i++) {
        m_triangles->push_back(new mdl_triangle_t(m__io, this, m__root));
    }
    int l_frames = header()->num_frames();
    m_frames = new std::vector<mdl_frame_t*>();
    m_frames->reserve(l_frames);
    for (int i = 0; i < l_frames; i++) {
        m_frames->push_back(new mdl_frame_t(m__io, this, m__root));
    }
}

quake_mdl_t::~quake_mdl_t() {
    _clean_up();
}

void quake_mdl_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (m_skins) {
        for (std::vector<mdl_skin_t*>::iterator it = m_skins->begin(); it != m_skins->end(); ++it) {
            delete *it;
        }
        delete m_skins; m_skins = 0;
    }
    if (m_texture_coordinates) {
        for (std::vector<mdl_texcoord_t*>::iterator it = m_texture_coordinates->begin(); it != m_texture_coordinates->end(); ++it) {
            delete *it;
        }
        delete m_texture_coordinates; m_texture_coordinates = 0;
    }
    if (m_triangles) {
        for (std::vector<mdl_triangle_t*>::iterator it = m_triangles->begin(); it != m_triangles->end(); ++it) {
            delete *it;
        }
        delete m_triangles; m_triangles = 0;
    }
    if (m_frames) {
        for (std::vector<mdl_frame_t*>::iterator it = m_frames->begin(); it != m_frames->end(); ++it) {
            delete *it;
        }
        delete m_frames; m_frames = 0;
    }
}

quake_mdl_t::mdl_vertex_t::mdl_vertex_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, quake_mdl_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_values = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void quake_mdl_t::mdl_vertex_t::_read() {
    int l_values = 3;
    m_values = new std::vector<uint8_t>();
    m_values->reserve(l_values);
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(m__io->read_u1());
    }
    m_normal_index = m__io->read_u1();
}

quake_mdl_t::mdl_vertex_t::~mdl_vertex_t() {
    _clean_up();
}

void quake_mdl_t::mdl_vertex_t::_clean_up() {
    if (m_values) {
        delete m_values; m_values = 0;
    }
}

quake_mdl_t::mdl_texcoord_t::mdl_texcoord_t(kaitai::kstream* p__io, quake_mdl_t* p__parent, quake_mdl_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void quake_mdl_t::mdl_texcoord_t::_read() {
    m_on_seam = m__io->read_s4le();
    m_s = m__io->read_s4le();
    m_t = m__io->read_s4le();
}

quake_mdl_t::mdl_texcoord_t::~mdl_texcoord_t() {
    _clean_up();
}

void quake_mdl_t::mdl_texcoord_t::_clean_up() {
}

quake_mdl_t::mdl_header_t::mdl_header_t(kaitai::kstream* p__io, quake_mdl_t* p__parent, quake_mdl_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_scale = 0;
    m_origin = 0;
    m_eye_position = 0;
    f_version = false;
    f_skin_size = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void quake_mdl_t::mdl_header_t::_read() {
    m_ident = m__io->read_bytes(4);
    if (!(ident() == std::string("\x49\x44\x50\x4F", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x49\x44\x50\x4F", 4), ident(), _io(), std::string("/types/mdl_header/seq/0"));
    }
    m_version_must_be_6 = m__io->read_bytes(4);
    if (!(version_must_be_6() == std::string("\x06\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x06\x00\x00\x00", 4), version_must_be_6(), _io(), std::string("/types/mdl_header/seq/1"));
    }
    m_scale = new vec3_t(m__io, this, m__root);
    m_origin = new vec3_t(m__io, this, m__root);
    m_radius = m__io->read_f4le();
    m_eye_position = new vec3_t(m__io, this, m__root);
    m_num_skins = m__io->read_s4le();
    m_skin_width = m__io->read_s4le();
    m_skin_height = m__io->read_s4le();
    m_num_verts = m__io->read_s4le();
    m_num_tris = m__io->read_s4le();
    m_num_frames = m__io->read_s4le();
    m_synctype = m__io->read_s4le();
    m_flags = m__io->read_s4le();
    m_size = m__io->read_f4le();
}

quake_mdl_t::mdl_header_t::~mdl_header_t() {
    _clean_up();
}

void quake_mdl_t::mdl_header_t::_clean_up() {
    if (m_scale) {
        delete m_scale; m_scale = 0;
    }
    if (m_origin) {
        delete m_origin; m_origin = 0;
    }
    if (m_eye_position) {
        delete m_eye_position; m_eye_position = 0;
    }
}

int8_t quake_mdl_t::mdl_header_t::version() {
    if (f_version)
        return m_version;
    m_version = 6;
    f_version = true;
    return m_version;
}

int32_t quake_mdl_t::mdl_header_t::skin_size() {
    if (f_skin_size)
        return m_skin_size;
    m_skin_size = (skin_width() * skin_height());
    f_skin_size = true;
    return m_skin_size;
}

quake_mdl_t::mdl_skin_t::mdl_skin_t(kaitai::kstream* p__io, quake_mdl_t* p__parent, quake_mdl_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_frame_times = 0;
    m_group_texture_data = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void quake_mdl_t::mdl_skin_t::_read() {
    m_group = m__io->read_s4le();
    n_single_texture_data = true;
    if (group() == 0) {
        n_single_texture_data = false;
        m_single_texture_data = m__io->read_bytes(_root()->header()->skin_size());
    }
    n_num_frames = true;
    if (group() != 0) {
        n_num_frames = false;
        m_num_frames = m__io->read_u4le();
    }
    n_frame_times = true;
    if (group() != 0) {
        n_frame_times = false;
        int l_frame_times = num_frames();
        m_frame_times = new std::vector<float>();
        m_frame_times->reserve(l_frame_times);
        for (int i = 0; i < l_frame_times; i++) {
            m_frame_times->push_back(m__io->read_f4le());
        }
    }
    n_group_texture_data = true;
    if (group() != 0) {
        n_group_texture_data = false;
        int l_group_texture_data = num_frames();
        m_group_texture_data = new std::vector<std::string>();
        m_group_texture_data->reserve(l_group_texture_data);
        for (int i = 0; i < l_group_texture_data; i++) {
            m_group_texture_data->push_back(m__io->read_bytes(_root()->header()->skin_size()));
        }
    }
}

quake_mdl_t::mdl_skin_t::~mdl_skin_t() {
    _clean_up();
}

void quake_mdl_t::mdl_skin_t::_clean_up() {
    if (!n_single_texture_data) {
    }
    if (!n_num_frames) {
    }
    if (!n_frame_times) {
        if (m_frame_times) {
            delete m_frame_times; m_frame_times = 0;
        }
    }
    if (!n_group_texture_data) {
        if (m_group_texture_data) {
            delete m_group_texture_data; m_group_texture_data = 0;
        }
    }
}

quake_mdl_t::mdl_frame_t::mdl_frame_t(kaitai::kstream* p__io, quake_mdl_t* p__parent, quake_mdl_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_min = 0;
    m_max = 0;
    m_time = 0;
    m_frames = 0;
    f_num_simple_frames = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void quake_mdl_t::mdl_frame_t::_read() {
    m_type = m__io->read_s4le();
    n_min = true;
    if (type() != 0) {
        n_min = false;
        m_min = new mdl_vertex_t(m__io, this, m__root);
    }
    n_max = true;
    if (type() != 0) {
        n_max = false;
        m_max = new mdl_vertex_t(m__io, this, m__root);
    }
    n_time = true;
    if (type() != 0) {
        n_time = false;
        int l_time = type();
        m_time = new std::vector<float>();
        m_time->reserve(l_time);
        for (int i = 0; i < l_time; i++) {
            m_time->push_back(m__io->read_f4le());
        }
    }
    int l_frames = num_simple_frames();
    m_frames = new std::vector<mdl_simple_frame_t*>();
    m_frames->reserve(l_frames);
    for (int i = 0; i < l_frames; i++) {
        m_frames->push_back(new mdl_simple_frame_t(m__io, this, m__root));
    }
}

quake_mdl_t::mdl_frame_t::~mdl_frame_t() {
    _clean_up();
}

void quake_mdl_t::mdl_frame_t::_clean_up() {
    if (!n_min) {
        if (m_min) {
            delete m_min; m_min = 0;
        }
    }
    if (!n_max) {
        if (m_max) {
            delete m_max; m_max = 0;
        }
    }
    if (!n_time) {
        if (m_time) {
            delete m_time; m_time = 0;
        }
    }
    if (m_frames) {
        for (std::vector<mdl_simple_frame_t*>::iterator it = m_frames->begin(); it != m_frames->end(); ++it) {
            delete *it;
        }
        delete m_frames; m_frames = 0;
    }
}

int32_t quake_mdl_t::mdl_frame_t::num_simple_frames() {
    if (f_num_simple_frames)
        return m_num_simple_frames;
    m_num_simple_frames = ((type() == 0) ? (1) : (type()));
    f_num_simple_frames = true;
    return m_num_simple_frames;
}

quake_mdl_t::mdl_simple_frame_t::mdl_simple_frame_t(kaitai::kstream* p__io, quake_mdl_t::mdl_frame_t* p__parent, quake_mdl_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_bbox_min = 0;
    m_bbox_max = 0;
    m_vertices = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void quake_mdl_t::mdl_simple_frame_t::_read() {
    m_bbox_min = new mdl_vertex_t(m__io, this, m__root);
    m_bbox_max = new mdl_vertex_t(m__io, this, m__root);
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(kaitai::kstream::bytes_strip_right(m__io->read_bytes(16), 0), 0, false), std::string("ASCII"));
    int l_vertices = _root()->header()->num_verts();
    m_vertices = new std::vector<mdl_vertex_t*>();
    m_vertices->reserve(l_vertices);
    for (int i = 0; i < l_vertices; i++) {
        m_vertices->push_back(new mdl_vertex_t(m__io, this, m__root));
    }
}

quake_mdl_t::mdl_simple_frame_t::~mdl_simple_frame_t() {
    _clean_up();
}

void quake_mdl_t::mdl_simple_frame_t::_clean_up() {
    if (m_bbox_min) {
        delete m_bbox_min; m_bbox_min = 0;
    }
    if (m_bbox_max) {
        delete m_bbox_max; m_bbox_max = 0;
    }
    if (m_vertices) {
        for (std::vector<mdl_vertex_t*>::iterator it = m_vertices->begin(); it != m_vertices->end(); ++it) {
            delete *it;
        }
        delete m_vertices; m_vertices = 0;
    }
}

quake_mdl_t::mdl_triangle_t::mdl_triangle_t(kaitai::kstream* p__io, quake_mdl_t* p__parent, quake_mdl_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_vertices = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void quake_mdl_t::mdl_triangle_t::_read() {
    m_faces_front = m__io->read_s4le();
    int l_vertices = 3;
    m_vertices = new std::vector<int32_t>();
    m_vertices->reserve(l_vertices);
    for (int i = 0; i < l_vertices; i++) {
        m_vertices->push_back(m__io->read_s4le());
    }
}

quake_mdl_t::mdl_triangle_t::~mdl_triangle_t() {
    _clean_up();
}

void quake_mdl_t::mdl_triangle_t::_clean_up() {
    if (m_vertices) {
        delete m_vertices; m_vertices = 0;
    }
}

quake_mdl_t::vec3_t::vec3_t(kaitai::kstream* p__io, quake_mdl_t::mdl_header_t* p__parent, quake_mdl_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void quake_mdl_t::vec3_t::_read() {
    m_x = m__io->read_f4le();
    m_y = m__io->read_f4le();
    m_z = m__io->read_f4le();
}

quake_mdl_t::vec3_t::~vec3_t() {
    _clean_up();
}

void quake_mdl_t::vec3_t::_clean_up() {
}

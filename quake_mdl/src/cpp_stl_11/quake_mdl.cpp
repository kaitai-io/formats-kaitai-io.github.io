// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "quake_mdl.h"
#include "kaitai/exceptions.h"

quake_mdl_t::quake_mdl_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, quake_mdl_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = nullptr;
    m_skins = nullptr;
    m_texture_coordinates = nullptr;
    m_triangles = nullptr;
    m_frames = nullptr;
    _read();
}

void quake_mdl_t::_read() {
    m_header = std::unique_ptr<mdl_header_t>(new mdl_header_t(m__io, this, m__root));
    m_skins = std::unique_ptr<std::vector<std::unique_ptr<mdl_skin_t>>>(new std::vector<std::unique_ptr<mdl_skin_t>>());
    const int l_skins = header()->num_skins();
    for (int i = 0; i < l_skins; i++) {
        m_skins->push_back(std::move(std::unique_ptr<mdl_skin_t>(new mdl_skin_t(m__io, this, m__root))));
    }
    m_texture_coordinates = std::unique_ptr<std::vector<std::unique_ptr<mdl_texcoord_t>>>(new std::vector<std::unique_ptr<mdl_texcoord_t>>());
    const int l_texture_coordinates = header()->num_verts();
    for (int i = 0; i < l_texture_coordinates; i++) {
        m_texture_coordinates->push_back(std::move(std::unique_ptr<mdl_texcoord_t>(new mdl_texcoord_t(m__io, this, m__root))));
    }
    m_triangles = std::unique_ptr<std::vector<std::unique_ptr<mdl_triangle_t>>>(new std::vector<std::unique_ptr<mdl_triangle_t>>());
    const int l_triangles = header()->num_tris();
    for (int i = 0; i < l_triangles; i++) {
        m_triangles->push_back(std::move(std::unique_ptr<mdl_triangle_t>(new mdl_triangle_t(m__io, this, m__root))));
    }
    m_frames = std::unique_ptr<std::vector<std::unique_ptr<mdl_frame_t>>>(new std::vector<std::unique_ptr<mdl_frame_t>>());
    const int l_frames = header()->num_frames();
    for (int i = 0; i < l_frames; i++) {
        m_frames->push_back(std::move(std::unique_ptr<mdl_frame_t>(new mdl_frame_t(m__io, this, m__root))));
    }
}

quake_mdl_t::~quake_mdl_t() {
    _clean_up();
}

void quake_mdl_t::_clean_up() {
}

quake_mdl_t::mdl_vertex_t::mdl_vertex_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, quake_mdl_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_values = nullptr;
    _read();
}

void quake_mdl_t::mdl_vertex_t::_read() {
    m_values = std::unique_ptr<std::vector<uint8_t>>(new std::vector<uint8_t>());
    const int l_values = 3;
    for (int i = 0; i < l_values; i++) {
        m_values->push_back(std::move(m__io->read_u1()));
    }
    m_normal_index = m__io->read_u1();
}

quake_mdl_t::mdl_vertex_t::~mdl_vertex_t() {
    _clean_up();
}

void quake_mdl_t::mdl_vertex_t::_clean_up() {
}

quake_mdl_t::mdl_texcoord_t::mdl_texcoord_t(kaitai::kstream* p__io, quake_mdl_t* p__parent, quake_mdl_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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
    m_scale = nullptr;
    m_origin = nullptr;
    m_eye_position = nullptr;
    f_version = false;
    f_skin_size = false;
    _read();
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
    m_scale = std::unique_ptr<vec3_t>(new vec3_t(m__io, this, m__root));
    m_origin = std::unique_ptr<vec3_t>(new vec3_t(m__io, this, m__root));
    m_radius = m__io->read_f4le();
    m_eye_position = std::unique_ptr<vec3_t>(new vec3_t(m__io, this, m__root));
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
    m_frame_times = nullptr;
    m_group_texture_data = nullptr;
    _read();
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
        m_frame_times = std::unique_ptr<std::vector<float>>(new std::vector<float>());
        const int l_frame_times = num_frames();
        for (int i = 0; i < l_frame_times; i++) {
            m_frame_times->push_back(std::move(m__io->read_f4le()));
        }
    }
    n_group_texture_data = true;
    if (group() != 0) {
        n_group_texture_data = false;
        m_group_texture_data = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
        const int l_group_texture_data = num_frames();
        for (int i = 0; i < l_group_texture_data; i++) {
            m_group_texture_data->push_back(std::move(m__io->read_bytes(_root()->header()->skin_size())));
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
    }
    if (!n_group_texture_data) {
    }
}

quake_mdl_t::mdl_frame_t::mdl_frame_t(kaitai::kstream* p__io, quake_mdl_t* p__parent, quake_mdl_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_min = nullptr;
    m_max = nullptr;
    m_time = nullptr;
    m_frames = nullptr;
    f_num_simple_frames = false;
    _read();
}

void quake_mdl_t::mdl_frame_t::_read() {
    m_type = m__io->read_s4le();
    n_min = true;
    if (type() != 0) {
        n_min = false;
        m_min = std::unique_ptr<mdl_vertex_t>(new mdl_vertex_t(m__io, this, m__root));
    }
    n_max = true;
    if (type() != 0) {
        n_max = false;
        m_max = std::unique_ptr<mdl_vertex_t>(new mdl_vertex_t(m__io, this, m__root));
    }
    n_time = true;
    if (type() != 0) {
        n_time = false;
        m_time = std::unique_ptr<std::vector<float>>(new std::vector<float>());
        const int l_time = type();
        for (int i = 0; i < l_time; i++) {
            m_time->push_back(std::move(m__io->read_f4le()));
        }
    }
    m_frames = std::unique_ptr<std::vector<std::unique_ptr<mdl_simple_frame_t>>>(new std::vector<std::unique_ptr<mdl_simple_frame_t>>());
    const int l_frames = num_simple_frames();
    for (int i = 0; i < l_frames; i++) {
        m_frames->push_back(std::move(std::unique_ptr<mdl_simple_frame_t>(new mdl_simple_frame_t(m__io, this, m__root))));
    }
}

quake_mdl_t::mdl_frame_t::~mdl_frame_t() {
    _clean_up();
}

void quake_mdl_t::mdl_frame_t::_clean_up() {
    if (!n_min) {
    }
    if (!n_max) {
    }
    if (!n_time) {
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
    m_bbox_min = nullptr;
    m_bbox_max = nullptr;
    m_vertices = nullptr;
    _read();
}

void quake_mdl_t::mdl_simple_frame_t::_read() {
    m_bbox_min = std::unique_ptr<mdl_vertex_t>(new mdl_vertex_t(m__io, this, m__root));
    m_bbox_max = std::unique_ptr<mdl_vertex_t>(new mdl_vertex_t(m__io, this, m__root));
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(kaitai::kstream::bytes_strip_right(m__io->read_bytes(16), 0), 0, false), std::string("ASCII"));
    m_vertices = std::unique_ptr<std::vector<std::unique_ptr<mdl_vertex_t>>>(new std::vector<std::unique_ptr<mdl_vertex_t>>());
    const int l_vertices = _root()->header()->num_verts();
    for (int i = 0; i < l_vertices; i++) {
        m_vertices->push_back(std::move(std::unique_ptr<mdl_vertex_t>(new mdl_vertex_t(m__io, this, m__root))));
    }
}

quake_mdl_t::mdl_simple_frame_t::~mdl_simple_frame_t() {
    _clean_up();
}

void quake_mdl_t::mdl_simple_frame_t::_clean_up() {
}

quake_mdl_t::mdl_triangle_t::mdl_triangle_t(kaitai::kstream* p__io, quake_mdl_t* p__parent, quake_mdl_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_vertices = nullptr;
    _read();
}

void quake_mdl_t::mdl_triangle_t::_read() {
    m_faces_front = m__io->read_s4le();
    m_vertices = std::unique_ptr<std::vector<int32_t>>(new std::vector<int32_t>());
    const int l_vertices = 3;
    for (int i = 0; i < l_vertices; i++) {
        m_vertices->push_back(std::move(m__io->read_s4le()));
    }
}

quake_mdl_t::mdl_triangle_t::~mdl_triangle_t() {
    _clean_up();
}

void quake_mdl_t::mdl_triangle_t::_clean_up() {
}

quake_mdl_t::vec3_t::vec3_t(kaitai::kstream* p__io, quake_mdl_t::mdl_header_t* p__parent, quake_mdl_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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

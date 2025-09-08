// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "quake2_md2.h"
#include "kaitai/exceptions.h"
const std::set<quake2_md2_t::gl_primitive_t> quake2_md2_t::_values_gl_primitive_t{
    quake2_md2_t::GL_PRIMITIVE_TRIANGLE_STRIP,
    quake2_md2_t::GL_PRIMITIVE_TRIANGLE_FAN,
};
bool quake2_md2_t::_is_defined_gl_primitive_t(quake2_md2_t::gl_primitive_t v) {
    return quake2_md2_t::_values_gl_primitive_t.find(v) != quake2_md2_t::_values_gl_primitive_t.end();
}

quake2_md2_t::quake2_md2_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, quake2_md2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_frames = nullptr;
    m__raw_frames = nullptr;
    m__io__raw_frames = nullptr;
    m_gl_cmds = nullptr;
    m__io__raw_gl_cmds = nullptr;
    m_skins = nullptr;
    m_tex_coords = nullptr;
    m_triangles = nullptr;
    f_anim_names = false;
    f_anim_num_frames = false;
    f_anim_start_indices = false;
    f_anorms_table = false;
    f_frames = false;
    f_gl_cmds = false;
    f_skins = false;
    f_tex_coords = false;
    f_triangles = false;
    _read();
}

void quake2_md2_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x49\x44\x50\x32", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x49\x44\x50\x32", 4), m_magic, m__io, std::string("/seq/0"));
    }
    m_version = m__io->read_u4le();
    if (!(m_version == 8)) {
        throw kaitai::validation_not_equal_error<uint32_t>(8, m_version, m__io, std::string("/seq/1"));
    }
    m_skin_width_px = m__io->read_u4le();
    m_skin_height_px = m__io->read_u4le();
    m_bytes_per_frame = m__io->read_u4le();
    m_num_skins = m__io->read_u4le();
    m_vertices_per_frame = m__io->read_u4le();
    m_num_tex_coords = m__io->read_u4le();
    m_num_triangles = m__io->read_u4le();
    m_num_gl_cmds = m__io->read_u4le();
    m_num_frames = m__io->read_u4le();
    m_ofs_skins = m__io->read_u4le();
    m_ofs_tex_coords = m__io->read_u4le();
    m_ofs_triangles = m__io->read_u4le();
    m_ofs_frames = m__io->read_u4le();
    m_ofs_gl_cmds = m__io->read_u4le();
    m_ofs_eof = m__io->read_u4le();
}

quake2_md2_t::~quake2_md2_t() {
    _clean_up();
}

void quake2_md2_t::_clean_up() {
    if (f_frames) {
    }
    if (f_gl_cmds) {
    }
    if (f_skins) {
    }
    if (f_tex_coords) {
    }
    if (f_triangles) {
    }
}

quake2_md2_t::compressed_vec_t::compressed_vec_t(kaitai::kstream* p__io, quake2_md2_t::vertex_t* p__parent, quake2_md2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_x = false;
    f_y = false;
    f_z = false;
    _read();
}

void quake2_md2_t::compressed_vec_t::_read() {
    m_x_compressed = m__io->read_u1();
    m_y_compressed = m__io->read_u1();
    m_z_compressed = m__io->read_u1();
}

quake2_md2_t::compressed_vec_t::~compressed_vec_t() {
    _clean_up();
}

void quake2_md2_t::compressed_vec_t::_clean_up() {
}

double quake2_md2_t::compressed_vec_t::x() {
    if (f_x)
        return m_x;
    f_x = true;
    m_x = x_compressed() * _parent()->_parent()->scale()->x() + _parent()->_parent()->translate()->x();
    return m_x;
}

double quake2_md2_t::compressed_vec_t::y() {
    if (f_y)
        return m_y;
    f_y = true;
    m_y = y_compressed() * _parent()->_parent()->scale()->y() + _parent()->_parent()->translate()->y();
    return m_y;
}

double quake2_md2_t::compressed_vec_t::z() {
    if (f_z)
        return m_z;
    f_z = true;
    m_z = z_compressed() * _parent()->_parent()->scale()->z() + _parent()->_parent()->translate()->z();
    return m_z;
}

quake2_md2_t::frame_t::frame_t(kaitai::kstream* p__io, quake2_md2_t* p__parent, quake2_md2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_scale = nullptr;
    m_translate = nullptr;
    m_vertices = nullptr;
    _read();
}

void quake2_md2_t::frame_t::_read() {
    m_scale = std::unique_ptr<vec3f_t>(new vec3f_t(m__io, this, m__root));
    m_translate = std::unique_ptr<vec3f_t>(new vec3f_t(m__io, this, m__root));
    m_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(16), 0, false), "ASCII");
    m_vertices = std::unique_ptr<std::vector<std::unique_ptr<vertex_t>>>(new std::vector<std::unique_ptr<vertex_t>>());
    const int l_vertices = _root()->vertices_per_frame();
    for (int i = 0; i < l_vertices; i++) {
        m_vertices->push_back(std::move(std::unique_ptr<vertex_t>(new vertex_t(m__io, this, m__root))));
    }
}

quake2_md2_t::frame_t::~frame_t() {
    _clean_up();
}

void quake2_md2_t::frame_t::_clean_up() {
}

quake2_md2_t::gl_cmd_t::gl_cmd_t(kaitai::kstream* p__io, quake2_md2_t::gl_cmds_list_t* p__parent, quake2_md2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_vertices = nullptr;
    f_num_vertices = false;
    f_primitive = false;
    _read();
}

void quake2_md2_t::gl_cmd_t::_read() {
    m_cmd_num_vertices = m__io->read_s4le();
    m_vertices = std::unique_ptr<std::vector<std::unique_ptr<gl_vertex_t>>>(new std::vector<std::unique_ptr<gl_vertex_t>>());
    const int l_vertices = num_vertices();
    for (int i = 0; i < l_vertices; i++) {
        m_vertices->push_back(std::move(std::unique_ptr<gl_vertex_t>(new gl_vertex_t(m__io, this, m__root))));
    }
}

quake2_md2_t::gl_cmd_t::~gl_cmd_t() {
    _clean_up();
}

void quake2_md2_t::gl_cmd_t::_clean_up() {
}

int32_t quake2_md2_t::gl_cmd_t::num_vertices() {
    if (f_num_vertices)
        return m_num_vertices;
    f_num_vertices = true;
    m_num_vertices = ((cmd_num_vertices() < 0) ? (-(cmd_num_vertices())) : (cmd_num_vertices()));
    return m_num_vertices;
}

quake2_md2_t::gl_primitive_t quake2_md2_t::gl_cmd_t::primitive() {
    if (f_primitive)
        return m_primitive;
    f_primitive = true;
    m_primitive = ((cmd_num_vertices() < 0) ? (quake2_md2_t::GL_PRIMITIVE_TRIANGLE_FAN) : (quake2_md2_t::GL_PRIMITIVE_TRIANGLE_STRIP));
    return m_primitive;
}

quake2_md2_t::gl_cmds_list_t::gl_cmds_list_t(kaitai::kstream* p__io, quake2_md2_t* p__parent, quake2_md2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_items = nullptr;
    _read();
}

void quake2_md2_t::gl_cmds_list_t::_read() {
    n_items = true;
    if (!(_io()->is_eof())) {
        n_items = false;
        m_items = std::unique_ptr<std::vector<std::unique_ptr<gl_cmd_t>>>(new std::vector<std::unique_ptr<gl_cmd_t>>());
        {
            int i = 0;
            gl_cmd_t* _;
            do {
                _ = new gl_cmd_t(m__io, this, m__root);
                m_items->push_back(std::move(std::unique_ptr<gl_cmd_t>(_)));
                i++;
            } while (!(_->cmd_num_vertices() == 0));
        }
    }
}

quake2_md2_t::gl_cmds_list_t::~gl_cmds_list_t() {
    _clean_up();
}

void quake2_md2_t::gl_cmds_list_t::_clean_up() {
    if (!n_items) {
    }
}

quake2_md2_t::gl_vertex_t::gl_vertex_t(kaitai::kstream* p__io, quake2_md2_t::gl_cmd_t* p__parent, quake2_md2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_tex_coords_normalized = nullptr;
    _read();
}

void quake2_md2_t::gl_vertex_t::_read() {
    m_tex_coords_normalized = std::unique_ptr<std::vector<float>>(new std::vector<float>());
    const int l_tex_coords_normalized = 2;
    for (int i = 0; i < l_tex_coords_normalized; i++) {
        m_tex_coords_normalized->push_back(std::move(m__io->read_f4le()));
    }
    m_vertex_index = m__io->read_u4le();
}

quake2_md2_t::gl_vertex_t::~gl_vertex_t() {
    _clean_up();
}

void quake2_md2_t::gl_vertex_t::_clean_up() {
}

quake2_md2_t::tex_point_t::tex_point_t(kaitai::kstream* p__io, quake2_md2_t* p__parent, quake2_md2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_s_normalized = false;
    f_t_normalized = false;
    _read();
}

void quake2_md2_t::tex_point_t::_read() {
    m_s_px = m__io->read_u2le();
    m_t_px = m__io->read_u2le();
}

quake2_md2_t::tex_point_t::~tex_point_t() {
    _clean_up();
}

void quake2_md2_t::tex_point_t::_clean_up() {
}

double quake2_md2_t::tex_point_t::s_normalized() {
    if (f_s_normalized)
        return m_s_normalized;
    f_s_normalized = true;
    m_s_normalized = (s_px() + 0.0) / _root()->skin_width_px();
    return m_s_normalized;
}

double quake2_md2_t::tex_point_t::t_normalized() {
    if (f_t_normalized)
        return m_t_normalized;
    f_t_normalized = true;
    m_t_normalized = (t_px() + 0.0) / _root()->skin_height_px();
    return m_t_normalized;
}

quake2_md2_t::triangle_t::triangle_t(kaitai::kstream* p__io, quake2_md2_t* p__parent, quake2_md2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_vertex_indices = nullptr;
    m_tex_point_indices = nullptr;
    _read();
}

void quake2_md2_t::triangle_t::_read() {
    m_vertex_indices = std::unique_ptr<std::vector<uint16_t>>(new std::vector<uint16_t>());
    const int l_vertex_indices = 3;
    for (int i = 0; i < l_vertex_indices; i++) {
        m_vertex_indices->push_back(std::move(m__io->read_u2le()));
    }
    m_tex_point_indices = std::unique_ptr<std::vector<uint16_t>>(new std::vector<uint16_t>());
    const int l_tex_point_indices = 3;
    for (int i = 0; i < l_tex_point_indices; i++) {
        m_tex_point_indices->push_back(std::move(m__io->read_u2le()));
    }
}

quake2_md2_t::triangle_t::~triangle_t() {
    _clean_up();
}

void quake2_md2_t::triangle_t::_clean_up() {
}

quake2_md2_t::vec3f_t::vec3f_t(kaitai::kstream* p__io, quake2_md2_t::frame_t* p__parent, quake2_md2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void quake2_md2_t::vec3f_t::_read() {
    m_x = m__io->read_f4le();
    m_y = m__io->read_f4le();
    m_z = m__io->read_f4le();
}

quake2_md2_t::vec3f_t::~vec3f_t() {
    _clean_up();
}

void quake2_md2_t::vec3f_t::_clean_up() {
}

quake2_md2_t::vertex_t::vertex_t(kaitai::kstream* p__io, quake2_md2_t::frame_t* p__parent, quake2_md2_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_position = nullptr;
    f_normal = false;
    _read();
}

void quake2_md2_t::vertex_t::_read() {
    m_position = std::unique_ptr<compressed_vec_t>(new compressed_vec_t(m__io, this, m__root));
    m_normal_index = m__io->read_u1();
}

quake2_md2_t::vertex_t::~vertex_t() {
    _clean_up();
}

void quake2_md2_t::vertex_t::_clean_up() {
}

std::vector<double>* quake2_md2_t::vertex_t::normal() {
    if (f_normal)
        return m_normal;
    f_normal = true;
    m_normal = _root()->anorms_table()->at(normal_index()).get();
    return m_normal;
}

std::vector<std::string>* quake2_md2_t::anim_names() {
    if (f_anim_names)
        return m_anim_names.get();
    f_anim_names = true;
    m_anim_names = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>{std::string("stand"), std::string("run"), std::string("attack"), std::string("pain1"), std::string("pain2"), std::string("pain3"), std::string("jump"), std::string("flip"), std::string("salute"), std::string("taunt"), std::string("wave"), std::string("point"), std::string("crstnd"), std::string("crwalk"), std::string("crattak"), std::string("crpain"), std::string("crdeath"), std::string("death1"), std::string("death2"), std::string("death3")});
    return m_anim_names.get();
}

std::string quake2_md2_t::anim_num_frames() {
    if (f_anim_num_frames)
        return m_anim_num_frames;
    f_anim_num_frames = true;
    m_anim_num_frames = std::string("\x28\x06\x08\x04\x04\x04\x06\x0C\x0B\x11\x0B\x0C\x13\x06\x09\x04\x05\x06\x06\x08", 20);
    return m_anim_num_frames;
}

std::string quake2_md2_t::anim_start_indices() {
    if (f_anim_start_indices)
        return m_anim_start_indices;
    f_anim_start_indices = true;
    m_anim_start_indices = std::string("\x00\x28\x2E\x36\x3A\x3E\x42\x48\x54\x5F\x70\x7B\x87\x9A\xA0\xA9\xAD\xB2\xB8\xBE", 20);
    return m_anim_start_indices;
}

std::vector<std::unique_ptr<std::vector<double>>>* quake2_md2_t::anorms_table() {
    if (f_anorms_table)
        return m_anorms_table.get();
    f_anorms_table = true;
    m_anorms_table = std::unique_ptr<std::vector<std::unique_ptr<std::vector<double>>>>(new std::vector<std::unique_ptr<std::vector<double>>>{std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.525731, 0.000000, 0.850651}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.442863, 0.238856, 0.864188}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.295242, 0.000000, 0.955423}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.309017, 0.500000, 0.809017}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.162460, 0.262866, 0.951056}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.000000, 0.000000, 1.000000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.000000, 0.850651, 0.525731}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.147621, 0.716567, 0.681718}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.147621, 0.716567, 0.681718}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.000000, 0.525731, 0.850651}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.309017, 0.500000, 0.809017}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.525731, 0.000000, 0.850651}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.295242, 0.000000, 0.955423}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.442863, 0.238856, 0.864188}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.162460, 0.262866, 0.951056}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.681718, 0.147621, 0.716567}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.809017, 0.309017, 0.500000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.587785, 0.425325, 0.688191}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.850651, 0.525731, 0.000000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.864188, 0.442863, 0.238856}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.716567, 0.681718, 0.147621}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.688191, 0.587785, 0.425325}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.500000, 0.809017, 0.309017}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.238856, 0.864188, 0.442863}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.425325, 0.688191, 0.587785}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.716567, 0.681718, -0.147621}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.500000, 0.809017, -0.309017}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.525731, 0.850651, 0.000000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.000000, 0.850651, -0.525731}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.238856, 0.864188, -0.442863}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.000000, 0.955423, -0.295242}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.262866, 0.951056, -0.162460}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.000000, 1.000000, 0.000000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.000000, 0.955423, 0.295242}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.262866, 0.951056, 0.162460}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.238856, 0.864188, 0.442863}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.262866, 0.951056, 0.162460}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.500000, 0.809017, 0.309017}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.238856, 0.864188, -0.442863}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.262866, 0.951056, -0.162460}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.500000, 0.809017, -0.309017}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.850651, 0.525731, 0.000000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.716567, 0.681718, 0.147621}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.716567, 0.681718, -0.147621}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.525731, 0.850651, 0.000000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.425325, 0.688191, 0.587785}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.864188, 0.442863, 0.238856}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.688191, 0.587785, 0.425325}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.809017, 0.309017, 0.500000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.681718, 0.147621, 0.716567}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.587785, 0.425325, 0.688191}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.955423, 0.295242, 0.000000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{1.000000, 0.000000, 0.000000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.951056, 0.162460, 0.262866}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.850651, -0.525731, 0.000000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.955423, -0.295242, 0.000000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.864188, -0.442863, 0.238856}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.951056, -0.162460, 0.262866}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.809017, -0.309017, 0.500000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.681718, -0.147621, 0.716567}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.850651, 0.000000, 0.525731}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.864188, 0.442863, -0.238856}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.809017, 0.309017, -0.500000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.951056, 0.162460, -0.262866}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.525731, 0.000000, -0.850651}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.681718, 0.147621, -0.716567}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.681718, -0.147621, -0.716567}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.850651, 0.000000, -0.525731}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.809017, -0.309017, -0.500000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.864188, -0.442863, -0.238856}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.951056, -0.162460, -0.262866}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.147621, 0.716567, -0.681718}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.309017, 0.500000, -0.809017}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.425325, 0.688191, -0.587785}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.442863, 0.238856, -0.864188}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.587785, 0.425325, -0.688191}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.688191, 0.587785, -0.425325}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.147621, 0.716567, -0.681718}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.309017, 0.500000, -0.809017}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.000000, 0.525731, -0.850651}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.525731, 0.000000, -0.850651}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.442863, 0.238856, -0.864188}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.295242, 0.000000, -0.955423}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.162460, 0.262866, -0.951056}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.000000, 0.000000, -1.000000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.295242, 0.000000, -0.955423}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.162460, 0.262866, -0.951056}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.442863, -0.238856, -0.864188}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.309017, -0.500000, -0.809017}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.162460, -0.262866, -0.951056}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.000000, -0.850651, -0.525731}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.147621, -0.716567, -0.681718}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.147621, -0.716567, -0.681718}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.000000, -0.525731, -0.850651}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.309017, -0.500000, -0.809017}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.442863, -0.238856, -0.864188}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.162460, -0.262866, -0.951056}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.238856, -0.864188, -0.442863}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.500000, -0.809017, -0.309017}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.425325, -0.688191, -0.587785}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.716567, -0.681718, -0.147621}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.688191, -0.587785, -0.425325}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.587785, -0.425325, -0.688191}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.000000, -0.955423, -0.295242}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.000000, -1.000000, 0.000000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.262866, -0.951056, -0.162460}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.000000, -0.850651, 0.525731}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.000000, -0.955423, 0.295242}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.238856, -0.864188, 0.442863}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.262866, -0.951056, 0.162460}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.500000, -0.809017, 0.309017}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.716567, -0.681718, 0.147621}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.525731, -0.850651, 0.000000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.238856, -0.864188, -0.442863}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.500000, -0.809017, -0.309017}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.262866, -0.951056, -0.162460}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.850651, -0.525731, 0.000000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.716567, -0.681718, -0.147621}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.716567, -0.681718, 0.147621}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.525731, -0.850651, 0.000000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.500000, -0.809017, 0.309017}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.238856, -0.864188, 0.442863}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.262866, -0.951056, 0.162460}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.864188, -0.442863, 0.238856}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.809017, -0.309017, 0.500000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.688191, -0.587785, 0.425325}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.681718, -0.147621, 0.716567}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.442863, -0.238856, 0.864188}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.587785, -0.425325, 0.688191}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.309017, -0.500000, 0.809017}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.147621, -0.716567, 0.681718}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.425325, -0.688191, 0.587785}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.162460, -0.262866, 0.951056}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.442863, -0.238856, 0.864188}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.162460, -0.262866, 0.951056}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.309017, -0.500000, 0.809017}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.147621, -0.716567, 0.681718}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.000000, -0.525731, 0.850651}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.425325, -0.688191, 0.587785}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.587785, -0.425325, 0.688191}), std::unique_ptr<std::vector<double>>(new std::vector<double>{0.688191, -0.587785, 0.425325}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.955423, 0.295242, 0.000000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.951056, 0.162460, 0.262866}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-1.000000, 0.000000, 0.000000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.850651, 0.000000, 0.525731}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.955423, -0.295242, 0.000000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.951056, -0.162460, 0.262866}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.864188, 0.442863, -0.238856}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.951056, 0.162460, -0.262866}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.809017, 0.309017, -0.500000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.864188, -0.442863, -0.238856}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.951056, -0.162460, -0.262866}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.809017, -0.309017, -0.500000}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.681718, 0.147621, -0.716567}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.681718, -0.147621, -0.716567}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.850651, 0.000000, -0.525731}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.688191, 0.587785, -0.425325}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.587785, 0.425325, -0.688191}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.425325, 0.688191, -0.587785}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.425325, -0.688191, -0.587785}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.587785, -0.425325, -0.688191}), std::unique_ptr<std::vector<double>>(new std::vector<double>{-0.688191, -0.587785, -0.425325})});
    return m_anorms_table.get();
}

std::vector<std::unique_ptr<quake2_md2_t::frame_t>>* quake2_md2_t::frames() {
    if (f_frames)
        return m_frames.get();
    f_frames = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_frames());
    m__raw_frames = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    m__io__raw_frames = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>>(new std::vector<std::unique_ptr<kaitai::kstream>>());
    m_frames = std::unique_ptr<std::vector<std::unique_ptr<frame_t>>>(new std::vector<std::unique_ptr<frame_t>>());
    const int l_frames = num_frames();
    for (int i = 0; i < l_frames; i++) {
        m__raw_frames->push_back(std::move(m__io->read_bytes(bytes_per_frame())));
        kaitai::kstream* io__raw_frames = new kaitai::kstream(m__raw_frames->at(m__raw_frames->size() - 1));
        m__io__raw_frames->emplace_back(io__raw_frames);
        m_frames->push_back(std::move(std::unique_ptr<frame_t>(new frame_t(io__raw_frames, this, m__root))));
    }
    m__io->seek(_pos);
    return m_frames.get();
}

quake2_md2_t::gl_cmds_list_t* quake2_md2_t::gl_cmds() {
    if (f_gl_cmds)
        return m_gl_cmds.get();
    f_gl_cmds = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_gl_cmds());
    m__raw_gl_cmds = m__io->read_bytes(4 * num_gl_cmds());
    m__io__raw_gl_cmds = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_gl_cmds));
    m_gl_cmds = std::unique_ptr<gl_cmds_list_t>(new gl_cmds_list_t(m__io__raw_gl_cmds.get(), this, m__root));
    m__io->seek(_pos);
    return m_gl_cmds.get();
}

std::vector<std::string>* quake2_md2_t::skins() {
    if (f_skins)
        return m_skins.get();
    f_skins = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_skins());
    m_skins = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    const int l_skins = num_skins();
    for (int i = 0; i < l_skins; i++) {
        m_skins->push_back(std::move(kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(64), 0, false), "ASCII")));
    }
    m__io->seek(_pos);
    return m_skins.get();
}

std::vector<std::unique_ptr<quake2_md2_t::tex_point_t>>* quake2_md2_t::tex_coords() {
    if (f_tex_coords)
        return m_tex_coords.get();
    f_tex_coords = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_tex_coords());
    m_tex_coords = std::unique_ptr<std::vector<std::unique_ptr<tex_point_t>>>(new std::vector<std::unique_ptr<tex_point_t>>());
    const int l_tex_coords = num_tex_coords();
    for (int i = 0; i < l_tex_coords; i++) {
        m_tex_coords->push_back(std::move(std::unique_ptr<tex_point_t>(new tex_point_t(m__io, this, m__root))));
    }
    m__io->seek(_pos);
    return m_tex_coords.get();
}

std::vector<std::unique_ptr<quake2_md2_t::triangle_t>>* quake2_md2_t::triangles() {
    if (f_triangles)
        return m_triangles.get();
    f_triangles = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_triangles());
    m_triangles = std::unique_ptr<std::vector<std::unique_ptr<triangle_t>>>(new std::vector<std::unique_ptr<triangle_t>>());
    const int l_triangles = num_triangles();
    for (int i = 0; i < l_triangles; i++) {
        m_triangles->push_back(std::move(std::unique_ptr<triangle_t>(new triangle_t(m__io, this, m__root))));
    }
    m__io->seek(_pos);
    return m_triangles.get();
}

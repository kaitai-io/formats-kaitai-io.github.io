#ifndef QUAKE_MDL_H_
#define QUAKE_MDL_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

class quake_mdl_t : public kaitai::kstruct {

public:
    class mdl_vertex_t;
    class mdl_texcoord_t;
    class mdl_header_t;
    class mdl_skin_t;
    class mdl_frame_t;
    class mdl_simple_frame_t;
    class mdl_triangle_t;
    class vec3_t;

    quake_mdl_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, quake_mdl_t* p__root = 0);

private:
    void _read();

public:
    ~quake_mdl_t();

    class mdl_vertex_t : public kaitai::kstruct {

    public:

        mdl_vertex_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, quake_mdl_t* p__root = 0);

    private:
        void _read();

    public:
        ~mdl_vertex_t();

    private:
        std::vector<uint8_t>* m_values;
        uint8_t m_normal_index;
        quake_mdl_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        std::vector<uint8_t>* values() const { return m_values; }
        uint8_t normal_index() const { return m_normal_index; }
        quake_mdl_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    class mdl_texcoord_t : public kaitai::kstruct {

    public:

        mdl_texcoord_t(kaitai::kstream* p__io, quake_mdl_t* p__parent = 0, quake_mdl_t* p__root = 0);

    private:
        void _read();

    public:
        ~mdl_texcoord_t();

    private:
        int32_t m_on_seam;
        int32_t m_s;
        int32_t m_t;
        quake_mdl_t* m__root;
        quake_mdl_t* m__parent;

    public:
        int32_t on_seam() const { return m_on_seam; }
        int32_t s() const { return m_s; }
        int32_t t() const { return m_t; }
        quake_mdl_t* _root() const { return m__root; }
        quake_mdl_t* _parent() const { return m__parent; }
    };

    class mdl_header_t : public kaitai::kstruct {

    public:

        mdl_header_t(kaitai::kstream* p__io, quake_mdl_t* p__parent = 0, quake_mdl_t* p__root = 0);

    private:
        void _read();

    public:
        ~mdl_header_t();

    private:
        bool f_version;
        int8_t m_version;

    public:
        int8_t version();

    private:
        bool f_skin_size;
        int32_t m_skin_size;

    public:
        int32_t skin_size();

    private:
        std::string m_ident;
        std::string m_version_must_be_6;
        vec3_t* m_scale;
        vec3_t* m_origin;
        float m_radius;
        vec3_t* m_eye_position;
        int32_t m_num_skins;
        int32_t m_skin_width;
        int32_t m_skin_height;
        int32_t m_num_verts;
        int32_t m_num_tris;
        int32_t m_num_frames;
        int32_t m_synctype;
        int32_t m_flags;
        float m_size;
        quake_mdl_t* m__root;
        quake_mdl_t* m__parent;

    public:
        std::string ident() const { return m_ident; }
        std::string version_must_be_6() const { return m_version_must_be_6; }
        vec3_t* scale() const { return m_scale; }
        vec3_t* origin() const { return m_origin; }
        float radius() const { return m_radius; }
        vec3_t* eye_position() const { return m_eye_position; }
        int32_t num_skins() const { return m_num_skins; }
        int32_t skin_width() const { return m_skin_width; }
        int32_t skin_height() const { return m_skin_height; }
        int32_t num_verts() const { return m_num_verts; }
        int32_t num_tris() const { return m_num_tris; }
        int32_t num_frames() const { return m_num_frames; }
        int32_t synctype() const { return m_synctype; }
        int32_t flags() const { return m_flags; }
        float size() const { return m_size; }
        quake_mdl_t* _root() const { return m__root; }
        quake_mdl_t* _parent() const { return m__parent; }
    };

    class mdl_skin_t : public kaitai::kstruct {

    public:

        mdl_skin_t(kaitai::kstream* p__io, quake_mdl_t* p__parent = 0, quake_mdl_t* p__root = 0);

    private:
        void _read();

    public:
        ~mdl_skin_t();

    private:
        int32_t m_group;
        std::string m_single_texture_data;
        bool n_single_texture_data;

    public:
        bool _is_null_single_texture_data() { single_texture_data(); return n_single_texture_data; };

    private:
        uint32_t m_num_frames;
        bool n_num_frames;

    public:
        bool _is_null_num_frames() { num_frames(); return n_num_frames; };

    private:
        std::vector<float>* m_frame_times;
        bool n_frame_times;

    public:
        bool _is_null_frame_times() { frame_times(); return n_frame_times; };

    private:
        std::vector<std::string>* m_group_texture_data;
        bool n_group_texture_data;

    public:
        bool _is_null_group_texture_data() { group_texture_data(); return n_group_texture_data; };

    private:
        quake_mdl_t* m__root;
        quake_mdl_t* m__parent;

    public:
        int32_t group() const { return m_group; }
        std::string single_texture_data() const { return m_single_texture_data; }
        uint32_t num_frames() const { return m_num_frames; }
        std::vector<float>* frame_times() const { return m_frame_times; }
        std::vector<std::string>* group_texture_data() const { return m_group_texture_data; }
        quake_mdl_t* _root() const { return m__root; }
        quake_mdl_t* _parent() const { return m__parent; }
    };

    class mdl_frame_t : public kaitai::kstruct {

    public:

        mdl_frame_t(kaitai::kstream* p__io, quake_mdl_t* p__parent = 0, quake_mdl_t* p__root = 0);

    private:
        void _read();

    public:
        ~mdl_frame_t();

    private:
        bool f_num_simple_frames;
        int32_t m_num_simple_frames;

    public:
        int32_t num_simple_frames();

    private:
        int32_t m_type;
        mdl_vertex_t* m_min;
        bool n_min;

    public:
        bool _is_null_min() { min(); return n_min; };

    private:
        mdl_vertex_t* m_max;
        bool n_max;

    public:
        bool _is_null_max() { max(); return n_max; };

    private:
        std::vector<float>* m_time;
        bool n_time;

    public:
        bool _is_null_time() { time(); return n_time; };

    private:
        std::vector<mdl_simple_frame_t*>* m_frames;
        quake_mdl_t* m__root;
        quake_mdl_t* m__parent;

    public:
        int32_t type() const { return m_type; }
        mdl_vertex_t* min() const { return m_min; }
        mdl_vertex_t* max() const { return m_max; }
        std::vector<float>* time() const { return m_time; }
        std::vector<mdl_simple_frame_t*>* frames() const { return m_frames; }
        quake_mdl_t* _root() const { return m__root; }
        quake_mdl_t* _parent() const { return m__parent; }
    };

    class mdl_simple_frame_t : public kaitai::kstruct {

    public:

        mdl_simple_frame_t(kaitai::kstream* p__io, quake_mdl_t::mdl_frame_t* p__parent = 0, quake_mdl_t* p__root = 0);

    private:
        void _read();

    public:
        ~mdl_simple_frame_t();

    private:
        mdl_vertex_t* m_bbox_min;
        mdl_vertex_t* m_bbox_max;
        std::string m_name;
        std::vector<mdl_vertex_t*>* m_vertices;
        quake_mdl_t* m__root;
        quake_mdl_t::mdl_frame_t* m__parent;

    public:
        mdl_vertex_t* bbox_min() const { return m_bbox_min; }
        mdl_vertex_t* bbox_max() const { return m_bbox_max; }
        std::string name() const { return m_name; }
        std::vector<mdl_vertex_t*>* vertices() const { return m_vertices; }
        quake_mdl_t* _root() const { return m__root; }
        quake_mdl_t::mdl_frame_t* _parent() const { return m__parent; }
    };

    class mdl_triangle_t : public kaitai::kstruct {

    public:

        mdl_triangle_t(kaitai::kstream* p__io, quake_mdl_t* p__parent = 0, quake_mdl_t* p__root = 0);

    private:
        void _read();

    public:
        ~mdl_triangle_t();

    private:
        int32_t m_faces_front;
        std::vector<int32_t>* m_vertices;
        quake_mdl_t* m__root;
        quake_mdl_t* m__parent;

    public:
        int32_t faces_front() const { return m_faces_front; }
        std::vector<int32_t>* vertices() const { return m_vertices; }
        quake_mdl_t* _root() const { return m__root; }
        quake_mdl_t* _parent() const { return m__parent; }
    };

    class vec3_t : public kaitai::kstruct {

    public:

        vec3_t(kaitai::kstream* p__io, quake_mdl_t::mdl_header_t* p__parent = 0, quake_mdl_t* p__root = 0);

    private:
        void _read();

    public:
        ~vec3_t();

    private:
        float m_x;
        float m_y;
        float m_z;
        quake_mdl_t* m__root;
        quake_mdl_t::mdl_header_t* m__parent;

    public:
        float x() const { return m_x; }
        float y() const { return m_y; }
        float z() const { return m_z; }
        quake_mdl_t* _root() const { return m__root; }
        quake_mdl_t::mdl_header_t* _parent() const { return m__parent; }
    };

private:
    mdl_header_t* m_header;
    std::vector<mdl_skin_t*>* m_skins;
    std::vector<mdl_texcoord_t*>* m_texture_coordinates;
    std::vector<mdl_triangle_t*>* m_triangles;
    std::vector<mdl_frame_t*>* m_frames;
    quake_mdl_t* m__root;
    kaitai::kstruct* m__parent;

public:
    mdl_header_t* header() const { return m_header; }
    std::vector<mdl_skin_t*>* skins() const { return m_skins; }
    std::vector<mdl_texcoord_t*>* texture_coordinates() const { return m_texture_coordinates; }
    std::vector<mdl_triangle_t*>* triangles() const { return m_triangles; }
    std::vector<mdl_frame_t*>* frames() const { return m_frames; }
    quake_mdl_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // QUAKE_MDL_H_

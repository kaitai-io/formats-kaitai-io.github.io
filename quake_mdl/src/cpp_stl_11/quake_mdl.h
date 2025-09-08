#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class quake_mdl_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * Quake 1 model format is used to store 3D models completely with
 * textures and animations used in the game. Quake 1 engine
 * (retroactively named "idtech2") is a popular 3D engine first used
 * for Quake game by id Software in 1996.
 * 
 * Model is constructed traditionally from vertices in 3D space, faces
 * which connect vertices, textures ("skins", i.e. 2D bitmaps) and
 * texture UV mapping information. As opposed to more modern,
 * bones-based animation formats, Quake model was animated by changing
 * locations of all vertices it included in 3D space, frame by frame.
 * 
 * File format stores:
 * 
 * * "Skins" — effectively 2D bitmaps which will be used as a
 *   texture. Every model can have multiple skins — e.g. these can be
 *   switched to depict various levels of damage to the
 *   monsters. Bitmaps are 8-bit-per-pixel, indexed in global Quake
 *   palette, subject to lighting and gamma adjustment when rendering
 *   in the game using colormap technique.
 * * "Texture coordinates" — UV coordinates, mapping 3D vertices to
 *   skin coordinates.
 * * "Triangles" — triangular faces connecting 3D vertices.
 * * "Frames" — locations of vertices in 3D space; can include more
 *   than one frame, thus allowing representation of different frames
 *   for animation purposes.
 * 
 * Originally, 3D geometry for models for Quake was designed in [Alias
 * PowerAnimator](https://en.wikipedia.org/wiki/PowerAnimator),
 * precursor of modern day Autodesk Maya and Autodesk Alias. Therefore,
 * 3D-related part of Quake model format followed closely Alias TRI
 * format, and Quake development utilities included a converter from Alias
 * TRI (`modelgen`).
 * 
 * Skins (textures) where prepared as LBM bitmaps with the help from
 * `texmap` utility in the same development utilities toolkit.
 */

class quake_mdl_t : public kaitai::kstruct {

public:
    class mdl_frame_t;
    class mdl_header_t;
    class mdl_simple_frame_t;
    class mdl_skin_t;
    class mdl_texcoord_t;
    class mdl_triangle_t;
    class mdl_vertex_t;
    class vec3_t;

    quake_mdl_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, quake_mdl_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~quake_mdl_t();

    class mdl_frame_t : public kaitai::kstruct {

    public:

        mdl_frame_t(kaitai::kstream* p__io, quake_mdl_t* p__parent = nullptr, quake_mdl_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~mdl_frame_t();

    private:
        bool f_num_simple_frames;
        int32_t m_num_simple_frames;

    public:
        int32_t num_simple_frames();

    private:
        int32_t m_type;
        std::unique_ptr<mdl_vertex_t> m_min;
        bool n_min;

    public:
        bool _is_null_min() { min(); return n_min; };

    private:
        std::unique_ptr<mdl_vertex_t> m_max;
        bool n_max;

    public:
        bool _is_null_max() { max(); return n_max; };

    private:
        std::unique_ptr<std::vector<float>> m_time;
        bool n_time;

    public:
        bool _is_null_time() { time(); return n_time; };

    private:
        std::unique_ptr<std::vector<std::unique_ptr<mdl_simple_frame_t>>> m_frames;
        quake_mdl_t* m__root;
        quake_mdl_t* m__parent;

    public:
        int32_t type() const { return m_type; }
        mdl_vertex_t* min() const { return m_min.get(); }
        mdl_vertex_t* max() const { return m_max.get(); }
        std::vector<float>* time() const { return m_time.get(); }
        std::vector<std::unique_ptr<mdl_simple_frame_t>>* frames() const { return m_frames.get(); }
        quake_mdl_t* _root() const { return m__root; }
        quake_mdl_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L59-L75 Source
     * \sa https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD0 Source
     */

    class mdl_header_t : public kaitai::kstruct {

    public:

        mdl_header_t(kaitai::kstream* p__io, quake_mdl_t* p__parent = nullptr, quake_mdl_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~mdl_header_t();

    private:
        bool f_skin_size;
        int32_t m_skin_size;

    public:

        /**
         * Skin size in pixels.
         */
        int32_t skin_size();

    private:
        std::string m_ident;
        int32_t m_version;
        std::unique_ptr<vec3_t> m_scale;
        std::unique_ptr<vec3_t> m_origin;
        float m_radius;
        std::unique_ptr<vec3_t> m_eye_position;
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

        /**
         * Magic signature bytes that every Quake model must
         * have. "IDPO" is short for "IDPOLYHEADER".
         * \sa https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L132-L133 Source
         */
        std::string ident() const { return m_ident; }
        int32_t version() const { return m_version; }

        /**
         * Global scaling factors in 3 dimensions for whole model. When
         * represented in 3D world, this model local coordinates will
         * be multiplied by these factors.
         */
        vec3_t* scale() const { return m_scale.get(); }
        vec3_t* origin() const { return m_origin.get(); }
        float radius() const { return m_radius; }
        vec3_t* eye_position() const { return m_eye_position.get(); }

        /**
         * Number of skins (=texture bitmaps) included in this model.
         */
        int32_t num_skins() const { return m_num_skins; }

        /**
         * Width (U coordinate max) of every skin (=texture) in pixels.
         */
        int32_t skin_width() const { return m_skin_width; }

        /**
         * Height (V coordinate max) of every skin (=texture) in
         * pixels.
         */
        int32_t skin_height() const { return m_skin_height; }

        /**
         * Number of vertices in this model. Note that this is constant
         * for all the animation frames and all textures.
         */
        int32_t num_verts() const { return m_num_verts; }

        /**
         * Number of triangles (=triangular faces) in this model.
         */
        int32_t num_tris() const { return m_num_tris; }

        /**
         * Number of animation frames included in this model.
         */
        int32_t num_frames() const { return m_num_frames; }
        int32_t synctype() const { return m_synctype; }
        int32_t flags() const { return m_flags; }
        float size() const { return m_size; }
        quake_mdl_t* _root() const { return m__root; }
        quake_mdl_t* _parent() const { return m__parent; }
    };

    class mdl_simple_frame_t : public kaitai::kstruct {

    public:

        mdl_simple_frame_t(kaitai::kstream* p__io, quake_mdl_t::mdl_frame_t* p__parent = nullptr, quake_mdl_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~mdl_simple_frame_t();

    private:
        std::unique_ptr<mdl_vertex_t> m_bbox_min;
        std::unique_ptr<mdl_vertex_t> m_bbox_max;
        std::string m_name;
        std::unique_ptr<std::vector<std::unique_ptr<mdl_vertex_t>>> m_vertices;
        quake_mdl_t* m__root;
        quake_mdl_t::mdl_frame_t* m__parent;

    public:
        mdl_vertex_t* bbox_min() const { return m_bbox_min.get(); }
        mdl_vertex_t* bbox_max() const { return m_bbox_max.get(); }
        std::string name() const { return m_name; }
        std::vector<std::unique_ptr<mdl_vertex_t>>* vertices() const { return m_vertices.get(); }
        quake_mdl_t* _root() const { return m__root; }
        quake_mdl_t::mdl_frame_t* _parent() const { return m__parent; }
    };

    class mdl_skin_t : public kaitai::kstruct {

    public:

        mdl_skin_t(kaitai::kstream* p__io, quake_mdl_t* p__parent = nullptr, quake_mdl_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

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
        std::unique_ptr<std::vector<float>> m_frame_times;
        bool n_frame_times;

    public:
        bool _is_null_frame_times() { frame_times(); return n_frame_times; };

    private:
        std::unique_ptr<std::vector<std::string>> m_group_texture_data;
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
        std::vector<float>* frame_times() const { return m_frame_times.get(); }
        std::vector<std::string>* group_texture_data() const { return m_group_texture_data.get(); }
        quake_mdl_t* _root() const { return m__root; }
        quake_mdl_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L79-L83 Source
     * \sa https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD2 Source
     */

    class mdl_texcoord_t : public kaitai::kstruct {

    public:

        mdl_texcoord_t(kaitai::kstream* p__io, quake_mdl_t* p__parent = nullptr, quake_mdl_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

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

    /**
     * Represents a triangular face, connecting 3 vertices, referenced
     * by their indexes.
     * \sa https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L85-L88 Source
     * \sa https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD3 Source
     */

    class mdl_triangle_t : public kaitai::kstruct {

    public:

        mdl_triangle_t(kaitai::kstream* p__io, quake_mdl_t* p__parent = nullptr, quake_mdl_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~mdl_triangle_t();

    private:
        int32_t m_faces_front;
        std::unique_ptr<std::vector<int32_t>> m_vertices;
        quake_mdl_t* m__root;
        quake_mdl_t* m__parent;

    public:
        int32_t faces_front() const { return m_faces_front; }
        std::vector<int32_t>* vertices() const { return m_vertices.get(); }
        quake_mdl_t* _root() const { return m__root; }
        quake_mdl_t* _parent() const { return m__parent; }
    };

    class mdl_vertex_t : public kaitai::kstruct {

    public:

        mdl_vertex_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, quake_mdl_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~mdl_vertex_t();

    private:
        std::unique_ptr<std::vector<uint8_t>> m_values;
        uint8_t m_normal_index;
        quake_mdl_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        std::vector<uint8_t>* values() const { return m_values.get(); }
        uint8_t normal_index() const { return m_normal_index; }
        quake_mdl_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    /**
     * Basic 3D vector (x, y, z) using single-precision floating point
     * coordnates. Can be used to specify a point in 3D space,
     * direction, scaling factor, etc.
     */

    class vec3_t : public kaitai::kstruct {

    public:

        vec3_t(kaitai::kstream* p__io, quake_mdl_t::mdl_header_t* p__parent = nullptr, quake_mdl_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

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
    std::unique_ptr<mdl_header_t> m_header;
    std::unique_ptr<std::vector<std::unique_ptr<mdl_skin_t>>> m_skins;
    std::unique_ptr<std::vector<std::unique_ptr<mdl_texcoord_t>>> m_texture_coordinates;
    std::unique_ptr<std::vector<std::unique_ptr<mdl_triangle_t>>> m_triangles;
    std::unique_ptr<std::vector<std::unique_ptr<mdl_frame_t>>> m_frames;
    quake_mdl_t* m__root;
    kaitai::kstruct* m__parent;

public:
    mdl_header_t* header() const { return m_header.get(); }
    std::vector<std::unique_ptr<mdl_skin_t>>* skins() const { return m_skins.get(); }
    std::vector<std::unique_ptr<mdl_texcoord_t>>* texture_coordinates() const { return m_texture_coordinates.get(); }
    std::vector<std::unique_ptr<mdl_triangle_t>>* triangles() const { return m_triangles.get(); }
    std::vector<std::unique_ptr<mdl_frame_t>>* frames() const { return m_frames.get(); }
    quake_mdl_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

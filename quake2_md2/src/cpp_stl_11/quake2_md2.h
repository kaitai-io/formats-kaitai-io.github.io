#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class quake2_md2_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * The MD2 format is used for 3D animated models in id Sofware's Quake II.
 * 
 * A model consists of named `frames`, each with the same number of `vertices`
 * (`vertices_per_frame`). Each such vertex has a `position` and `normal` in
 * model space. Each vertex has the same topological "meaning" across frames, in
 * terms of triangle and texture info; it just varies in position and normal for
 * animation purposes.
 * 
 * How the vertices form triangles is defined via disjoint `triangles` or via
 * `gl_cmds` (which allows strip and fan topology). Each triangle contains three
 * `vertex_indices` into frame vertices, and three `tex_point_indices` into
 * global `tex_coords`. Each texture point has pixel coords `s_px` and `t_px`
 * ranging from 0 to `skin_{width,height}_px` respectively, along with
 * `{s,t}_normalized` ranging from 0 to 1 for your convenience.
 * 
 * A GL command has a `primitive` type (`TRIANGLE_FAN` or `TRIANGLE_STRIP`) along
 * with some `vertices`. Each GL vertex contains `tex_coords_normalized` from 0
 * to 1, and a `vertex_index` into frame vertices.
 * 
 * A model may also contain `skins`, which are just file paths to PCX images.
 * However, this is empty for many models, in which case it is up to the client
 * (e.g. Q2PRO) to offer skins some other way (e.g. by similar filename in the
 * current directory).
 * 
 * There are 198 `frames` in total, partitioned into a fixed set of ranges used
 * for different animations. Each frame has a standard `name` for humans, but the
 * client just uses their index and the name can be arbitrary. The name, start
 * frame index and frame count of each animation can be looked up in the arrays
 * `anim_names`, `anim_start_indices`, and `anim_num_frames` respectively. This
 * information is summarized in the following table:
 * 
 * ```
 * |   INDEX  |    NAME | SUFFIX | NOTES                                                  |
 * |:--------:|--------:|:-------|:-------------------------------------------------------|
 * |    0-39  |   stand | 01-40  | Idle animation                                         |
 * |   40-45  |     run | 1-6    | Full run cycle                                         |
 * |   46-53  |  attack | 1-8    | Shoot, reload; some weapons just repeat 1st few frames |
 * |   54-57  |   pain1 | 01-04  | Q2Pro also uses this for switching weapons             |
 * |   58-61  |   pain2 | 01-04  |                                                        |
 * |   62-65  |   pain3 | 01-04  |                                                        |
 * |   66-71  |    jump | 1-6    | Starts at height and lands on feet                     |
 * |   72-83  |    flip | 01-12  | Flipoff, i.e. middle finger                            |
 * |   84-94  |  salute | 01-11  |                                                        |
 * |   95-111 |   taunt | 01-17  |                                                        |
 * |  112-122 |    wave | 01-11  | Q2Pro plays this backwards for a handgrenade toss      |
 * |  123-134 |   point | 01-12  |                                                        |
 * |  135-153 |  crstnd | 01-19  | Idle while crouching                                   |
 * |  154-159 |  crwalk | 1-6    |                                                        |
 * |  160-168 | crattak | 1-9    |                                                        |
 * |  169-172 |  crpain | 1-4    |                                                        |
 * |  173-177 | crdeath | 1-5    |                                                        |
 * |  178-183 |  death1 | 01-06  |                                                        |
 * |  184-189 |  death2 | 01-06  |                                                        |
 * |  190-197 |  death3 | 01-08  |                                                        |
 * ```
 * 
 * The above are filled in for player models; for the separate weapon models,
 * the final frame is 173 "g_view" (unknown purpose) since weapons aren't shown
 * during death animations. `a_grenades.md2`, the handgrenade weapon model, is
 * the same except that the `wave` frames are blank (according to the default
 * female model files). This is likely due to its dual use as a grenade throw
 * animation where this model must leave the player's model.
 * \sa https://icculus.org/~phaethon/q3a/formats/md2-schoenblum.html Source
 * \sa http://tfc.duke.free.fr/coding/md2-specs-en.html Source
 * \sa http://tastyspleen.net/~panjoo/downloads/quake2_model_frames.html Source
 * \sa http://wiki.polycount.com/wiki/OldSiteResourcesQuake2FramesList Source
 */

class quake2_md2_t : public kaitai::kstruct {

public:
    class compressed_vec_t;
    class frame_t;
    class gl_cmd_t;
    class gl_cmds_list_t;
    class gl_vertex_t;
    class tex_point_t;
    class triangle_t;
    class vec3f_t;
    class vertex_t;

    enum gl_primitive_t {
        GL_PRIMITIVE_TRIANGLE_STRIP = 0,
        GL_PRIMITIVE_TRIANGLE_FAN = 1
    };
    static bool _is_defined_gl_primitive_t(gl_primitive_t v);

private:
    static const std::set<gl_primitive_t> _values_gl_primitive_t;

public:

    quake2_md2_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, quake2_md2_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~quake2_md2_t();

    class compressed_vec_t : public kaitai::kstruct {

    public:

        compressed_vec_t(kaitai::kstream* p__io, quake2_md2_t::vertex_t* p__parent = nullptr, quake2_md2_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~compressed_vec_t();

    private:
        bool f_x;
        double m_x;

    public:
        double x();

    private:
        bool f_y;
        double m_y;

    public:
        double y();

    private:
        bool f_z;
        double m_z;

    public:
        double z();

    private:
        uint8_t m_x_compressed;
        uint8_t m_y_compressed;
        uint8_t m_z_compressed;
        quake2_md2_t* m__root;
        quake2_md2_t::vertex_t* m__parent;

    public:
        uint8_t x_compressed() const { return m_x_compressed; }
        uint8_t y_compressed() const { return m_y_compressed; }
        uint8_t z_compressed() const { return m_z_compressed; }
        quake2_md2_t* _root() const { return m__root; }
        quake2_md2_t::vertex_t* _parent() const { return m__parent; }
    };

    class frame_t : public kaitai::kstruct {

    public:

        frame_t(kaitai::kstream* p__io, quake2_md2_t* p__parent = nullptr, quake2_md2_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~frame_t();

    private:
        std::unique_ptr<vec3f_t> m_scale;
        std::unique_ptr<vec3f_t> m_translate;
        std::string m_name;
        std::unique_ptr<std::vector<std::unique_ptr<vertex_t>>> m_vertices;
        quake2_md2_t* m__root;
        quake2_md2_t* m__parent;

    public:
        vec3f_t* scale() const { return m_scale.get(); }
        vec3f_t* translate() const { return m_translate.get(); }
        std::string name() const { return m_name; }
        std::vector<std::unique_ptr<vertex_t>>* vertices() const { return m_vertices.get(); }
        quake2_md2_t* _root() const { return m__root; }
        quake2_md2_t* _parent() const { return m__parent; }
    };

    class gl_cmd_t : public kaitai::kstruct {

    public:

        gl_cmd_t(kaitai::kstream* p__io, quake2_md2_t::gl_cmds_list_t* p__parent = nullptr, quake2_md2_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~gl_cmd_t();

    private:
        bool f_num_vertices;
        int32_t m_num_vertices;

    public:
        int32_t num_vertices();

    private:
        bool f_primitive;
        gl_primitive_t m_primitive;

    public:
        gl_primitive_t primitive();

    private:
        int32_t m_cmd_num_vertices;
        std::unique_ptr<std::vector<std::unique_ptr<gl_vertex_t>>> m_vertices;
        quake2_md2_t* m__root;
        quake2_md2_t::gl_cmds_list_t* m__parent;

    public:
        int32_t cmd_num_vertices() const { return m_cmd_num_vertices; }
        std::vector<std::unique_ptr<gl_vertex_t>>* vertices() const { return m_vertices.get(); }
        quake2_md2_t* _root() const { return m__root; }
        quake2_md2_t::gl_cmds_list_t* _parent() const { return m__parent; }
    };

    class gl_cmds_list_t : public kaitai::kstruct {

    public:

        gl_cmds_list_t(kaitai::kstream* p__io, quake2_md2_t* p__parent = nullptr, quake2_md2_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~gl_cmds_list_t();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<gl_cmd_t>>> m_items;
        bool n_items;

    public:
        bool _is_null_items() { items(); return n_items; };

    private:
        quake2_md2_t* m__root;
        quake2_md2_t* m__parent;

    public:
        std::vector<std::unique_ptr<gl_cmd_t>>* items() const { return m_items.get(); }
        quake2_md2_t* _root() const { return m__root; }
        quake2_md2_t* _parent() const { return m__parent; }
    };

    class gl_vertex_t : public kaitai::kstruct {

    public:

        gl_vertex_t(kaitai::kstream* p__io, quake2_md2_t::gl_cmd_t* p__parent = nullptr, quake2_md2_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~gl_vertex_t();

    private:
        std::unique_ptr<std::vector<float>> m_tex_coords_normalized;
        uint32_t m_vertex_index;
        quake2_md2_t* m__root;
        quake2_md2_t::gl_cmd_t* m__parent;

    public:
        std::vector<float>* tex_coords_normalized() const { return m_tex_coords_normalized.get(); }

        /**
         * index to `_root.frames[i].vertices` (for each frame with index `i`)
         */
        uint32_t vertex_index() const { return m_vertex_index; }
        quake2_md2_t* _root() const { return m__root; }
        quake2_md2_t::gl_cmd_t* _parent() const { return m__parent; }
    };

    class tex_point_t : public kaitai::kstruct {

    public:

        tex_point_t(kaitai::kstream* p__io, quake2_md2_t* p__parent = nullptr, quake2_md2_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~tex_point_t();

    private:
        bool f_s_normalized;
        double m_s_normalized;

    public:
        double s_normalized();

    private:
        bool f_t_normalized;
        double m_t_normalized;

    public:
        double t_normalized();

    private:
        uint16_t m_s_px;
        uint16_t m_t_px;
        quake2_md2_t* m__root;
        quake2_md2_t* m__parent;

    public:
        uint16_t s_px() const { return m_s_px; }
        uint16_t t_px() const { return m_t_px; }
        quake2_md2_t* _root() const { return m__root; }
        quake2_md2_t* _parent() const { return m__parent; }
    };

    class triangle_t : public kaitai::kstruct {

    public:

        triangle_t(kaitai::kstream* p__io, quake2_md2_t* p__parent = nullptr, quake2_md2_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~triangle_t();

    private:
        std::unique_ptr<std::vector<uint16_t>> m_vertex_indices;
        std::unique_ptr<std::vector<uint16_t>> m_tex_point_indices;
        quake2_md2_t* m__root;
        quake2_md2_t* m__parent;

    public:

        /**
         * indices to `_root.frames[i].vertices` (for each frame with index `i`)
         */
        std::vector<uint16_t>* vertex_indices() const { return m_vertex_indices.get(); }

        /**
         * indices to `_root.tex_coords`
         */
        std::vector<uint16_t>* tex_point_indices() const { return m_tex_point_indices.get(); }
        quake2_md2_t* _root() const { return m__root; }
        quake2_md2_t* _parent() const { return m__parent; }
    };

    class vec3f_t : public kaitai::kstruct {

    public:

        vec3f_t(kaitai::kstream* p__io, quake2_md2_t::frame_t* p__parent = nullptr, quake2_md2_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~vec3f_t();

    private:
        float m_x;
        float m_y;
        float m_z;
        quake2_md2_t* m__root;
        quake2_md2_t::frame_t* m__parent;

    public:
        float x() const { return m_x; }
        float y() const { return m_y; }
        float z() const { return m_z; }
        quake2_md2_t* _root() const { return m__root; }
        quake2_md2_t::frame_t* _parent() const { return m__parent; }
    };

    class vertex_t : public kaitai::kstruct {

    public:

        vertex_t(kaitai::kstream* p__io, quake2_md2_t::frame_t* p__parent = nullptr, quake2_md2_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~vertex_t();

    private:
        bool f_normal;
        std::vector<double>* m_normal;

    public:
        std::vector<double>* normal();

    private:
        std::unique_ptr<compressed_vec_t> m_position;
        uint8_t m_normal_index;
        quake2_md2_t* m__root;
        quake2_md2_t::frame_t* m__parent;

    public:
        compressed_vec_t* position() const { return m_position.get(); }
        uint8_t normal_index() const { return m_normal_index; }
        quake2_md2_t* _root() const { return m__root; }
        quake2_md2_t::frame_t* _parent() const { return m__parent; }
    };

private:
    bool f_anim_names;
    std::unique_ptr<std::vector<std::string>> m_anim_names;

public:
    std::vector<std::string>* anim_names();

private:
    bool f_anim_num_frames;
    std::string m_anim_num_frames;

public:
    std::string anim_num_frames();

private:
    bool f_anim_start_indices;
    std::string m_anim_start_indices;

public:
    std::string anim_start_indices();

private:
    bool f_anorms_table;
    std::unique_ptr<std::vector<std::unique_ptr<std::vector<double>>>> m_anorms_table;

public:

    /**
     * \sa https://github.com/skullernet/q2pro/blob/f4faabd/src/common/math.c#L80
     * from Quake anorms.h
     */
    std::vector<std::unique_ptr<std::vector<double>>>* anorms_table();

private:
    bool f_frames;
    std::unique_ptr<std::vector<std::unique_ptr<frame_t>>> m_frames;

public:
    std::vector<std::unique_ptr<frame_t>>* frames();

private:
    bool f_gl_cmds;
    std::unique_ptr<gl_cmds_list_t> m_gl_cmds;

public:
    gl_cmds_list_t* gl_cmds();

private:
    bool f_skins;
    std::unique_ptr<std::vector<std::string>> m_skins;

public:
    std::vector<std::string>* skins();

private:
    bool f_tex_coords;
    std::unique_ptr<std::vector<std::unique_ptr<tex_point_t>>> m_tex_coords;

public:
    std::vector<std::unique_ptr<tex_point_t>>* tex_coords();

private:
    bool f_triangles;
    std::unique_ptr<std::vector<std::unique_ptr<triangle_t>>> m_triangles;

public:
    std::vector<std::unique_ptr<triangle_t>>* triangles();

private:
    std::string m_magic;
    uint32_t m_version;
    uint32_t m_skin_width_px;
    uint32_t m_skin_height_px;
    uint32_t m_bytes_per_frame;
    uint32_t m_num_skins;
    uint32_t m_vertices_per_frame;
    uint32_t m_num_tex_coords;
    uint32_t m_num_triangles;
    uint32_t m_num_gl_cmds;
    uint32_t m_num_frames;
    uint32_t m_ofs_skins;
    uint32_t m_ofs_tex_coords;
    uint32_t m_ofs_triangles;
    uint32_t m_ofs_frames;
    uint32_t m_ofs_gl_cmds;
    uint32_t m_ofs_eof;
    quake2_md2_t* m__root;
    kaitai::kstruct* m__parent;
    std::unique_ptr<std::vector<std::string>> m__raw_frames;
    std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>> m__io__raw_frames;
    std::string m__raw_gl_cmds;
    std::unique_ptr<kaitai::kstream> m__io__raw_gl_cmds;

public:
    std::string magic() const { return m_magic; }
    uint32_t version() const { return m_version; }
    uint32_t skin_width_px() const { return m_skin_width_px; }
    uint32_t skin_height_px() const { return m_skin_height_px; }
    uint32_t bytes_per_frame() const { return m_bytes_per_frame; }
    uint32_t num_skins() const { return m_num_skins; }
    uint32_t vertices_per_frame() const { return m_vertices_per_frame; }
    uint32_t num_tex_coords() const { return m_num_tex_coords; }
    uint32_t num_triangles() const { return m_num_triangles; }
    uint32_t num_gl_cmds() const { return m_num_gl_cmds; }
    uint32_t num_frames() const { return m_num_frames; }
    uint32_t ofs_skins() const { return m_ofs_skins; }
    uint32_t ofs_tex_coords() const { return m_ofs_tex_coords; }
    uint32_t ofs_triangles() const { return m_ofs_triangles; }
    uint32_t ofs_frames() const { return m_ofs_frames; }
    uint32_t ofs_gl_cmds() const { return m_ofs_gl_cmds; }
    uint32_t ofs_eof() const { return m_ofs_eof; }
    quake2_md2_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::vector<std::string>* _raw_frames() const { return m__raw_frames.get(); }
    std::vector<std::unique_ptr<kaitai::kstream>>* _io__raw_frames() const { return m__io__raw_frames.get(); }
    std::string _raw_gl_cmds() const { return m__raw_gl_cmds; }
    kaitai::kstream* _io__raw_gl_cmds() const { return m__io__raw_gl_cmds.get(); }
};

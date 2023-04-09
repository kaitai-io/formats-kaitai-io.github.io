#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * \sa https://gtamods.com/wiki/RenderWare_binary_stream_file Source
 */

class renderware_binary_stream_t : public kaitai::kstruct {

public:
    class struct_clump_t;
    class struct_geometry_t;
    class geometry_non_native_t;
    class struct_geometry_list_t;
    class rgba_t;
    class sphere_t;
    class morph_target_t;
    class struct_atomic_t;
    class surface_properties_t;
    class struct_frame_list_t;
    class matrix_t;
    class vector_3d_t;
    class list_with_header_t;
    class triangle_t;
    class frame_t;
    class tex_coord_t;
    class uv_layer_t;
    class struct_texture_dictionary_t;

    enum sections_t {
        SECTIONS_STRUCT = 1,
        SECTIONS_STRING = 2,
        SECTIONS_EXTENSION = 3,
        SECTIONS_CAMERA = 5,
        SECTIONS_TEXTURE = 6,
        SECTIONS_MATERIAL = 7,
        SECTIONS_MATERIAL_LIST = 8,
        SECTIONS_ATOMIC_SECTION = 9,
        SECTIONS_PLANE_SECTION = 10,
        SECTIONS_WORLD = 11,
        SECTIONS_SPLINE = 12,
        SECTIONS_MATRIX = 13,
        SECTIONS_FRAME_LIST = 14,
        SECTIONS_GEOMETRY = 15,
        SECTIONS_CLUMP = 16,
        SECTIONS_LIGHT = 18,
        SECTIONS_UNICODE_STRING = 19,
        SECTIONS_ATOMIC = 20,
        SECTIONS_TEXTURE_NATIVE = 21,
        SECTIONS_TEXTURE_DICTIONARY = 22,
        SECTIONS_ANIMATION_DATABASE = 23,
        SECTIONS_IMAGE = 24,
        SECTIONS_SKIN_ANIMATION = 25,
        SECTIONS_GEOMETRY_LIST = 26,
        SECTIONS_ANIM_ANIMATION = 27,
        SECTIONS_TEAM = 28,
        SECTIONS_CROWD = 29,
        SECTIONS_DELTA_MORPH_ANIMATION = 30,
        SECTIONS_RIGHT_TO_RENDER = 31,
        SECTIONS_MULTITEXTURE_EFFECT_NATIVE = 32,
        SECTIONS_MULTITEXTURE_EFFECT_DICTIONARY = 33,
        SECTIONS_TEAM_DICTIONARY = 34,
        SECTIONS_PLATFORM_INDEPENDENT_TEXTURE_DICTIONARY = 35,
        SECTIONS_TABLE_OF_CONTENTS = 36,
        SECTIONS_PARTICLE_STANDARD_GLOBAL_DATA = 37,
        SECTIONS_ALTPIPE = 38,
        SECTIONS_PLATFORM_INDEPENDENT_PEDS = 39,
        SECTIONS_PATCH_MESH = 40,
        SECTIONS_CHUNK_GROUP_START = 41,
        SECTIONS_CHUNK_GROUP_END = 42,
        SECTIONS_UV_ANIMATION_DICTIONARY = 43,
        SECTIONS_COLL_TREE = 44,
        SECTIONS_METRICS_PLG = 257,
        SECTIONS_SPLINE_PLG = 258,
        SECTIONS_STEREO_PLG = 259,
        SECTIONS_VRML_PLG = 260,
        SECTIONS_MORPH_PLG = 261,
        SECTIONS_PVS_PLG = 262,
        SECTIONS_MEMORY_LEAK_PLG = 263,
        SECTIONS_ANIMATION_PLG = 264,
        SECTIONS_GLOSS_PLG = 265,
        SECTIONS_LOGO_PLG = 266,
        SECTIONS_MEMORY_INFO_PLG = 267,
        SECTIONS_RANDOM_PLG = 268,
        SECTIONS_PNG_IMAGE_PLG = 269,
        SECTIONS_BONE_PLG = 270,
        SECTIONS_VRML_ANIM_PLG = 271,
        SECTIONS_SKY_MIPMAP_VAL = 272,
        SECTIONS_MRM_PLG = 273,
        SECTIONS_LOD_ATOMIC_PLG = 274,
        SECTIONS_ME_PLG = 275,
        SECTIONS_LIGHTMAP_PLG = 276,
        SECTIONS_REFINE_PLG = 277,
        SECTIONS_SKIN_PLG = 278,
        SECTIONS_LABEL_PLG = 279,
        SECTIONS_PARTICLES_PLG = 280,
        SECTIONS_GEOMTX_PLG = 281,
        SECTIONS_SYNTH_CORE_PLG = 282,
        SECTIONS_STQPP_PLG = 283,
        SECTIONS_PART_PP_PLG = 284,
        SECTIONS_COLLISION_PLG = 285,
        SECTIONS_HANIM_PLG = 286,
        SECTIONS_USER_DATA_PLG = 287,
        SECTIONS_MATERIAL_EFFECTS_PLG = 288,
        SECTIONS_PARTICLE_SYSTEM_PLG = 289,
        SECTIONS_DELTA_MORPH_PLG = 290,
        SECTIONS_PATCH_PLG = 291,
        SECTIONS_TEAM_PLG = 292,
        SECTIONS_CROWD_PP_PLG = 293,
        SECTIONS_MIP_SPLIT_PLG = 294,
        SECTIONS_ANISOTROPY_PLG = 295,
        SECTIONS_GCN_MATERIAL_PLG = 297,
        SECTIONS_GEOMETRIC_PVS_PLG = 298,
        SECTIONS_XBOX_MATERIAL_PLG = 299,
        SECTIONS_MULTI_TEXTURE_PLG = 300,
        SECTIONS_CHAIN_PLG = 301,
        SECTIONS_TOON_PLG = 302,
        SECTIONS_PTANK_PLG = 303,
        SECTIONS_PARTICLE_STANDARD_PLG = 304,
        SECTIONS_PDS_PLG = 305,
        SECTIONS_PRTADV_PLG = 306,
        SECTIONS_NORMAL_MAP_PLG = 307,
        SECTIONS_ADC_PLG = 308,
        SECTIONS_UV_ANIMATION_PLG = 309,
        SECTIONS_CHARACTER_SET_PLG = 384,
        SECTIONS_NOHS_WORLD_PLG = 385,
        SECTIONS_IMPORT_UTIL_PLG = 386,
        SECTIONS_SLERP_PLG = 387,
        SECTIONS_OPTIM_PLG = 388,
        SECTIONS_TL_WORLD_PLG = 389,
        SECTIONS_DATABASE_PLG = 390,
        SECTIONS_RAYTRACE_PLG = 391,
        SECTIONS_RAY_PLG = 392,
        SECTIONS_LIBRARY_PLG = 393,
        SECTIONS_PLG_2D = 400,
        SECTIONS_TILE_RENDER_PLG = 401,
        SECTIONS_JPEG_IMAGE_PLG = 402,
        SECTIONS_TGA_IMAGE_PLG = 403,
        SECTIONS_GIF_IMAGE_PLG = 404,
        SECTIONS_QUAT_PLG = 405,
        SECTIONS_SPLINE_PVS_PLG = 406,
        SECTIONS_MIPMAP_PLG = 407,
        SECTIONS_MIPMAPK_PLG = 408,
        SECTIONS_FONT_2D = 409,
        SECTIONS_INTERSECTION_PLG = 410,
        SECTIONS_TIFF_IMAGE_PLG = 411,
        SECTIONS_PICK_PLG = 412,
        SECTIONS_BMP_IMAGE_PLG = 413,
        SECTIONS_RAS_IMAGE_PLG = 414,
        SECTIONS_SKIN_FX_PLG = 415,
        SECTIONS_VCAT_PLG = 416,
        SECTIONS_PATH_2D = 417,
        SECTIONS_BRUSH_2D = 418,
        SECTIONS_OBJECT_2D = 419,
        SECTIONS_SHAPE_2D = 420,
        SECTIONS_SCENE_2D = 421,
        SECTIONS_PICK_REGION_2D = 422,
        SECTIONS_OBJECT_STRING_2D = 423,
        SECTIONS_ANIMATION_PLG_2D = 424,
        SECTIONS_ANIMATION_2D = 425,
        SECTIONS_KEYFRAME_2D = 432,
        SECTIONS_MAESTRO_2D = 433,
        SECTIONS_BARYCENTRIC = 434,
        SECTIONS_PLATFORM_INDEPENDENT_TEXTURE_DICTIONARY_TK = 435,
        SECTIONS_TOC_TK = 436,
        SECTIONS_TPL_TK = 437,
        SECTIONS_ALTPIPE_TK = 438,
        SECTIONS_ANIMATION_TK = 439,
        SECTIONS_SKIN_SPLIT_TOOKIT = 440,
        SECTIONS_COMPRESSED_KEY_TK = 441,
        SECTIONS_GEOMETRY_CONDITIONING_PLG = 442,
        SECTIONS_WING_PLG = 443,
        SECTIONS_GENERIC_PIPELINE_TK = 444,
        SECTIONS_LIGHTMAP_CONVERSION_TK = 445,
        SECTIONS_FILESYSTEM_PLG = 446,
        SECTIONS_DICTIONARY_TK = 447,
        SECTIONS_UV_ANIMATION_LINEAR = 448,
        SECTIONS_UV_ANIMATION_PARAMETER = 449,
        SECTIONS_BIN_MESH_PLG = 1294,
        SECTIONS_NATIVE_DATA_PLG = 1296,
        SECTIONS_ZMODELER_LOCK = 61982,
        SECTIONS_ATOMIC_VISIBILITY_DISTANCE = 39055872,
        SECTIONS_CLUMP_VISIBILITY_DISTANCE = 39055873,
        SECTIONS_FRAME_VISIBILITY_DISTANCE = 39055874,
        SECTIONS_PIPELINE_SET = 39056115,
        SECTIONS_UNUSED_5 = 39056116,
        SECTIONS_TEXDICTIONARY_LINK = 39056117,
        SECTIONS_SPECULAR_MATERIAL = 39056118,
        SECTIONS_UNUSED_8 = 39056119,
        SECTIONS_EFFECT_2D = 39056120,
        SECTIONS_EXTRA_VERT_COLOUR = 39056121,
        SECTIONS_COLLISION_MODEL = 39056122,
        SECTIONS_GTA_HANIM = 39056123,
        SECTIONS_REFLECTION_MATERIAL = 39056124,
        SECTIONS_BREAKABLE = 39056125,
        SECTIONS_FRAME = 39056126,
        SECTIONS_UNUSED_16 = 39056127
    };

    renderware_binary_stream_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, renderware_binary_stream_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~renderware_binary_stream_t();

    /**
     * \sa https://gtamods.com/wiki/RpClump Source
     */

    class struct_clump_t : public kaitai::kstruct {

    public:

        struct_clump_t(kaitai::kstream* p__io, renderware_binary_stream_t::list_with_header_t* p__parent = nullptr, renderware_binary_stream_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~struct_clump_t();

    private:
        uint32_t m_num_atomics;
        uint32_t m_num_lights;
        bool n_num_lights;

    public:
        bool _is_null_num_lights() { num_lights(); return n_num_lights; };

    private:
        uint32_t m_num_cameras;
        bool n_num_cameras;

    public:
        bool _is_null_num_cameras() { num_cameras(); return n_num_cameras; };

    private:
        renderware_binary_stream_t* m__root;
        renderware_binary_stream_t::list_with_header_t* m__parent;

    public:
        uint32_t num_atomics() const { return m_num_atomics; }
        uint32_t num_lights() const { return m_num_lights; }
        uint32_t num_cameras() const { return m_num_cameras; }
        renderware_binary_stream_t* _root() const { return m__root; }
        renderware_binary_stream_t::list_with_header_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://gtamods.com/wiki/RpGeometry Source
     */

    class struct_geometry_t : public kaitai::kstruct {

    public:

        struct_geometry_t(kaitai::kstream* p__io, renderware_binary_stream_t::list_with_header_t* p__parent = nullptr, renderware_binary_stream_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~struct_geometry_t();

    private:
        bool f_num_uv_layers_raw;
        int32_t m_num_uv_layers_raw;

    public:
        int32_t num_uv_layers_raw();

    private:
        bool f_is_textured;
        bool m_is_textured;

    public:
        bool is_textured();

    private:
        bool f_is_native;
        bool m_is_native;

    public:
        bool is_native();

    private:
        bool f_num_uv_layers;
        int32_t m_num_uv_layers;

    public:
        int32_t num_uv_layers();

    private:
        bool f_is_textured2;
        bool m_is_textured2;

    public:
        bool is_textured2();

    private:
        bool f_is_prelit;
        bool m_is_prelit;

    public:
        bool is_prelit();

    private:
        uint32_t m_format;
        uint32_t m_num_triangles;
        uint32_t m_num_vertices;
        uint32_t m_num_morph_targets;
        std::unique_ptr<surface_properties_t> m_surf_prop;
        bool n_surf_prop;

    public:
        bool _is_null_surf_prop() { surf_prop(); return n_surf_prop; };

    private:
        std::unique_ptr<geometry_non_native_t> m_geometry;
        bool n_geometry;

    public:
        bool _is_null_geometry() { geometry(); return n_geometry; };

    private:
        std::unique_ptr<std::vector<std::unique_ptr<morph_target_t>>> m_morph_targets;
        renderware_binary_stream_t* m__root;
        renderware_binary_stream_t::list_with_header_t* m__parent;

    public:
        uint32_t format() const { return m_format; }
        uint32_t num_triangles() const { return m_num_triangles; }
        uint32_t num_vertices() const { return m_num_vertices; }
        uint32_t num_morph_targets() const { return m_num_morph_targets; }
        surface_properties_t* surf_prop() const { return m_surf_prop.get(); }
        geometry_non_native_t* geometry() const { return m_geometry.get(); }
        std::vector<std::unique_ptr<morph_target_t>>* morph_targets() const { return m_morph_targets.get(); }
        renderware_binary_stream_t* _root() const { return m__root; }
        renderware_binary_stream_t::list_with_header_t* _parent() const { return m__parent; }
    };

    class geometry_non_native_t : public kaitai::kstruct {

    public:

        geometry_non_native_t(kaitai::kstream* p__io, renderware_binary_stream_t::struct_geometry_t* p__parent = nullptr, renderware_binary_stream_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~geometry_non_native_t();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<rgba_t>>> m_prelit_colors;
        bool n_prelit_colors;

    public:
        bool _is_null_prelit_colors() { prelit_colors(); return n_prelit_colors; };

    private:
        std::unique_ptr<std::vector<std::unique_ptr<uv_layer_t>>> m_uv_layers;
        std::unique_ptr<std::vector<std::unique_ptr<triangle_t>>> m_triangles;
        renderware_binary_stream_t* m__root;
        renderware_binary_stream_t::struct_geometry_t* m__parent;

    public:
        std::vector<std::unique_ptr<rgba_t>>* prelit_colors() const { return m_prelit_colors.get(); }
        std::vector<std::unique_ptr<uv_layer_t>>* uv_layers() const { return m_uv_layers.get(); }
        std::vector<std::unique_ptr<triangle_t>>* triangles() const { return m_triangles.get(); }
        renderware_binary_stream_t* _root() const { return m__root; }
        renderware_binary_stream_t::struct_geometry_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://gtamods.com/wiki/Geometry_List_(RW_Section)#Structure Source
     */

    class struct_geometry_list_t : public kaitai::kstruct {

    public:

        struct_geometry_list_t(kaitai::kstream* p__io, renderware_binary_stream_t::list_with_header_t* p__parent = nullptr, renderware_binary_stream_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~struct_geometry_list_t();

    private:
        uint32_t m_num_geometries;
        renderware_binary_stream_t* m__root;
        renderware_binary_stream_t::list_with_header_t* m__parent;

    public:
        uint32_t num_geometries() const { return m_num_geometries; }
        renderware_binary_stream_t* _root() const { return m__root; }
        renderware_binary_stream_t::list_with_header_t* _parent() const { return m__parent; }
    };

    class rgba_t : public kaitai::kstruct {

    public:

        rgba_t(kaitai::kstream* p__io, renderware_binary_stream_t::geometry_non_native_t* p__parent = nullptr, renderware_binary_stream_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~rgba_t();

    private:
        uint8_t m_r;
        uint8_t m_g;
        uint8_t m_b;
        uint8_t m_a;
        renderware_binary_stream_t* m__root;
        renderware_binary_stream_t::geometry_non_native_t* m__parent;

    public:
        uint8_t r() const { return m_r; }
        uint8_t g() const { return m_g; }
        uint8_t b() const { return m_b; }
        uint8_t a() const { return m_a; }
        renderware_binary_stream_t* _root() const { return m__root; }
        renderware_binary_stream_t::geometry_non_native_t* _parent() const { return m__parent; }
    };

    class sphere_t : public kaitai::kstruct {

    public:

        sphere_t(kaitai::kstream* p__io, renderware_binary_stream_t::morph_target_t* p__parent = nullptr, renderware_binary_stream_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~sphere_t();

    private:
        float m_x;
        float m_y;
        float m_z;
        float m_radius;
        renderware_binary_stream_t* m__root;
        renderware_binary_stream_t::morph_target_t* m__parent;

    public:
        float x() const { return m_x; }
        float y() const { return m_y; }
        float z() const { return m_z; }
        float radius() const { return m_radius; }
        renderware_binary_stream_t* _root() const { return m__root; }
        renderware_binary_stream_t::morph_target_t* _parent() const { return m__parent; }
    };

    class morph_target_t : public kaitai::kstruct {

    public:

        morph_target_t(kaitai::kstream* p__io, renderware_binary_stream_t::struct_geometry_t* p__parent = nullptr, renderware_binary_stream_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~morph_target_t();

    private:
        std::unique_ptr<sphere_t> m_bounding_sphere;
        uint32_t m_has_vertices;
        uint32_t m_has_normals;
        std::unique_ptr<std::vector<std::unique_ptr<vector_3d_t>>> m_vertices;
        bool n_vertices;

    public:
        bool _is_null_vertices() { vertices(); return n_vertices; };

    private:
        std::unique_ptr<std::vector<std::unique_ptr<vector_3d_t>>> m_normals;
        bool n_normals;

    public:
        bool _is_null_normals() { normals(); return n_normals; };

    private:
        renderware_binary_stream_t* m__root;
        renderware_binary_stream_t::struct_geometry_t* m__parent;

    public:
        sphere_t* bounding_sphere() const { return m_bounding_sphere.get(); }
        uint32_t has_vertices() const { return m_has_vertices; }
        uint32_t has_normals() const { return m_has_normals; }
        std::vector<std::unique_ptr<vector_3d_t>>* vertices() const { return m_vertices.get(); }
        std::vector<std::unique_ptr<vector_3d_t>>* normals() const { return m_normals.get(); }
        renderware_binary_stream_t* _root() const { return m__root; }
        renderware_binary_stream_t::struct_geometry_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://gtamods.com/wiki/Atomic_(RW_Section)#Structure Source
     */

    class struct_atomic_t : public kaitai::kstruct {

    public:

        struct_atomic_t(kaitai::kstream* p__io, renderware_binary_stream_t::list_with_header_t* p__parent = nullptr, renderware_binary_stream_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~struct_atomic_t();

    private:
        uint32_t m_frame_index;
        uint32_t m_geometry_index;
        bool m_flag_render;
        bool m__unnamed3;
        bool m_flag_collision_test;
        uint64_t m__unnamed5;
        uint32_t m_unused;
        renderware_binary_stream_t* m__root;
        renderware_binary_stream_t::list_with_header_t* m__parent;

    public:
        uint32_t frame_index() const { return m_frame_index; }
        uint32_t geometry_index() const { return m_geometry_index; }
        bool flag_render() const { return m_flag_render; }
        bool _unnamed3() const { return m__unnamed3; }
        bool flag_collision_test() const { return m_flag_collision_test; }
        uint64_t _unnamed5() const { return m__unnamed5; }
        uint32_t unused() const { return m_unused; }
        renderware_binary_stream_t* _root() const { return m__root; }
        renderware_binary_stream_t::list_with_header_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://gtamods.com/wiki/RpGeometry Source
     */

    class surface_properties_t : public kaitai::kstruct {

    public:

        surface_properties_t(kaitai::kstream* p__io, renderware_binary_stream_t::struct_geometry_t* p__parent = nullptr, renderware_binary_stream_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~surface_properties_t();

    private:
        float m_ambient;
        float m_specular;
        float m_diffuse;
        renderware_binary_stream_t* m__root;
        renderware_binary_stream_t::struct_geometry_t* m__parent;

    public:
        float ambient() const { return m_ambient; }
        float specular() const { return m_specular; }
        float diffuse() const { return m_diffuse; }
        renderware_binary_stream_t* _root() const { return m__root; }
        renderware_binary_stream_t::struct_geometry_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure Source
     */

    class struct_frame_list_t : public kaitai::kstruct {

    public:

        struct_frame_list_t(kaitai::kstream* p__io, renderware_binary_stream_t::list_with_header_t* p__parent = nullptr, renderware_binary_stream_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~struct_frame_list_t();

    private:
        uint32_t m_num_frames;
        std::unique_ptr<std::vector<std::unique_ptr<frame_t>>> m_frames;
        renderware_binary_stream_t* m__root;
        renderware_binary_stream_t::list_with_header_t* m__parent;

    public:
        uint32_t num_frames() const { return m_num_frames; }
        std::vector<std::unique_ptr<frame_t>>* frames() const { return m_frames.get(); }
        renderware_binary_stream_t* _root() const { return m__root; }
        renderware_binary_stream_t::list_with_header_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure Source
     */

    class matrix_t : public kaitai::kstruct {

    public:

        matrix_t(kaitai::kstream* p__io, renderware_binary_stream_t::frame_t* p__parent = nullptr, renderware_binary_stream_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~matrix_t();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<vector_3d_t>>> m_entries;
        renderware_binary_stream_t* m__root;
        renderware_binary_stream_t::frame_t* m__parent;

    public:
        std::vector<std::unique_ptr<vector_3d_t>>* entries() const { return m_entries.get(); }
        renderware_binary_stream_t* _root() const { return m__root; }
        renderware_binary_stream_t::frame_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure Source
     */

    class vector_3d_t : public kaitai::kstruct {

    public:

        vector_3d_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, renderware_binary_stream_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~vector_3d_t();

    private:
        float m_x;
        float m_y;
        float m_z;
        renderware_binary_stream_t* m__root;
        kaitai::kstruct* m__parent;

    public:
        float x() const { return m_x; }
        float y() const { return m_y; }
        float z() const { return m_z; }
        renderware_binary_stream_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
    };

    /**
     * Typical structure used by many data types in RenderWare binary
     * stream. Substream contains a list of binary stream entries,
     * first entry always has type "struct" and carries some specific
     * binary data it in, determined by the type of parent. All other
     * entries, beside the first one, are normal, self-describing
     * records.
     */

    class list_with_header_t : public kaitai::kstruct {

    public:

        list_with_header_t(kaitai::kstream* p__io, renderware_binary_stream_t* p__parent = nullptr, renderware_binary_stream_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~list_with_header_t();

    private:
        bool f_version;
        int32_t m_version;

    public:
        int32_t version();

    private:
        std::string m_code;
        uint32_t m_header_size;
        uint32_t m_library_id_stamp;
        std::unique_ptr<kaitai::kstruct> m_header;
        bool n_header;

    public:
        bool _is_null_header() { header(); return n_header; };

    private:
        std::unique_ptr<std::vector<std::unique_ptr<renderware_binary_stream_t>>> m_entries;
        renderware_binary_stream_t* m__root;
        renderware_binary_stream_t* m__parent;
        std::string m__raw_header;
        std::unique_ptr<kaitai::kstream> m__io__raw_header;

    public:
        std::string code() const { return m_code; }
        uint32_t header_size() const { return m_header_size; }
        uint32_t library_id_stamp() const { return m_library_id_stamp; }
        kaitai::kstruct* header() const { return m_header.get(); }
        std::vector<std::unique_ptr<renderware_binary_stream_t>>* entries() const { return m_entries.get(); }
        renderware_binary_stream_t* _root() const { return m__root; }
        renderware_binary_stream_t* _parent() const { return m__parent; }
        std::string _raw_header() const { return m__raw_header; }
        kaitai::kstream* _io__raw_header() const { return m__io__raw_header.get(); }
    };

    class triangle_t : public kaitai::kstruct {

    public:

        triangle_t(kaitai::kstream* p__io, renderware_binary_stream_t::geometry_non_native_t* p__parent = nullptr, renderware_binary_stream_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~triangle_t();

    private:
        uint16_t m_vertex2;
        uint16_t m_vertex1;
        uint16_t m_material_id;
        uint16_t m_vertex3;
        renderware_binary_stream_t* m__root;
        renderware_binary_stream_t::geometry_non_native_t* m__parent;

    public:
        uint16_t vertex2() const { return m_vertex2; }
        uint16_t vertex1() const { return m_vertex1; }
        uint16_t material_id() const { return m_material_id; }
        uint16_t vertex3() const { return m_vertex3; }
        renderware_binary_stream_t* _root() const { return m__root; }
        renderware_binary_stream_t::geometry_non_native_t* _parent() const { return m__parent; }
    };

    /**
     * \sa https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure Source
     */

    class frame_t : public kaitai::kstruct {

    public:

        frame_t(kaitai::kstream* p__io, renderware_binary_stream_t::struct_frame_list_t* p__parent = nullptr, renderware_binary_stream_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~frame_t();

    private:
        std::unique_ptr<matrix_t> m_rotation_matrix;
        std::unique_ptr<vector_3d_t> m_position;
        int32_t m_cur_frame_idx;
        uint32_t m_matrix_creation_flags;
        renderware_binary_stream_t* m__root;
        renderware_binary_stream_t::struct_frame_list_t* m__parent;

    public:
        matrix_t* rotation_matrix() const { return m_rotation_matrix.get(); }
        vector_3d_t* position() const { return m_position.get(); }
        int32_t cur_frame_idx() const { return m_cur_frame_idx; }
        uint32_t matrix_creation_flags() const { return m_matrix_creation_flags; }
        renderware_binary_stream_t* _root() const { return m__root; }
        renderware_binary_stream_t::struct_frame_list_t* _parent() const { return m__parent; }
    };

    class tex_coord_t : public kaitai::kstruct {

    public:

        tex_coord_t(kaitai::kstream* p__io, renderware_binary_stream_t::uv_layer_t* p__parent = nullptr, renderware_binary_stream_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~tex_coord_t();

    private:
        float m_u;
        float m_v;
        renderware_binary_stream_t* m__root;
        renderware_binary_stream_t::uv_layer_t* m__parent;

    public:
        float u() const { return m_u; }
        float v() const { return m_v; }
        renderware_binary_stream_t* _root() const { return m__root; }
        renderware_binary_stream_t::uv_layer_t* _parent() const { return m__parent; }
    };

    class uv_layer_t : public kaitai::kstruct {

    public:

        uv_layer_t(uint32_t p_num_vertices, kaitai::kstream* p__io, renderware_binary_stream_t::geometry_non_native_t* p__parent = nullptr, renderware_binary_stream_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~uv_layer_t();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<tex_coord_t>>> m_tex_coords;
        uint32_t m_num_vertices;
        renderware_binary_stream_t* m__root;
        renderware_binary_stream_t::geometry_non_native_t* m__parent;

    public:
        std::vector<std::unique_ptr<tex_coord_t>>* tex_coords() const { return m_tex_coords.get(); }
        uint32_t num_vertices() const { return m_num_vertices; }
        renderware_binary_stream_t* _root() const { return m__root; }
        renderware_binary_stream_t::geometry_non_native_t* _parent() const { return m__parent; }
    };

    class struct_texture_dictionary_t : public kaitai::kstruct {

    public:

        struct_texture_dictionary_t(kaitai::kstream* p__io, renderware_binary_stream_t::list_with_header_t* p__parent = nullptr, renderware_binary_stream_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~struct_texture_dictionary_t();

    private:
        uint32_t m_num_textures;
        renderware_binary_stream_t* m__root;
        renderware_binary_stream_t::list_with_header_t* m__parent;

    public:
        uint32_t num_textures() const { return m_num_textures; }
        renderware_binary_stream_t* _root() const { return m__root; }
        renderware_binary_stream_t::list_with_header_t* _parent() const { return m__parent; }
    };

private:
    bool f_version;
    int32_t m_version;

public:
    int32_t version();

private:
    sections_t m_code;
    uint32_t m_size;
    uint32_t m_library_id_stamp;
    std::unique_ptr<list_with_header_t> m_body;
    bool n_body;

public:
    bool _is_null_body() { body(); return n_body; };

private:
    renderware_binary_stream_t* m__root;
    kaitai::kstruct* m__parent;
    std::string m__raw_body;
    std::unique_ptr<kaitai::kstream> m__io__raw_body;

public:
    sections_t code() const { return m_code; }
    uint32_t size() const { return m_size; }
    uint32_t library_id_stamp() const { return m_library_id_stamp; }
    list_with_header_t* body() const { return m_body.get(); }
    renderware_binary_stream_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
    std::string _raw_body() const { return m__raw_body; }
    kaitai::kstream* _io__raw_body() const { return m__io__raw_body.get(); }
};

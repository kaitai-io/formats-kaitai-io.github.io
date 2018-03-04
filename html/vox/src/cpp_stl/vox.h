#ifndef VOX_H_
#define VOX_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

/**
 * \sa Format Description
 */

class vox_t : public kaitai::kstruct {

public:
    class chunk_t;
    class size_t;
    class rgba_t;
    class pack_t;
    class matt_t;
    class xyzi_t;
    class color_t;
    class voxel_t;

    enum chunk_type_t {
        CHUNK_TYPE_MAIN = 1296124238,
        CHUNK_TYPE_MATT = 1296127060,
        CHUNK_TYPE_PACK = 1346454347,
        CHUNK_TYPE_RGBA = 1380401729,
        CHUNK_TYPE_SIZE = 1397316165,
        CHUNK_TYPE_XYZI = 1482250825
    };

    enum material_type_t {
        MATERIAL_TYPE_DIFFUSE = 0,
        MATERIAL_TYPE_METAL = 1,
        MATERIAL_TYPE_GLASS = 2,
        MATERIAL_TYPE_EMISSIVE = 3
    };

    enum property_bits_type_t {
        PROPERTY_BITS_TYPE_PLASTIC = 1,
        PROPERTY_BITS_TYPE_ROUGHNESS = 2,
        PROPERTY_BITS_TYPE_SPECULAR = 4,
        PROPERTY_BITS_TYPE_IOR = 8,
        PROPERTY_BITS_TYPE_ATTENUATION = 16,
        PROPERTY_BITS_TYPE_POWER = 32,
        PROPERTY_BITS_TYPE_GLOW = 64,
        PROPERTY_BITS_TYPE_IS_TOTAL_POWER = 128
    };

    vox_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, vox_t* p__root = 0);

private:
    void _read();

public:
    ~vox_t();

    class chunk_t : public kaitai::kstruct {

    public:

        chunk_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, vox_t* p__root = 0);

    private:
        void _read();

    public:
        ~chunk_t();

    private:
        chunk_type_t m_chunk_id;
        uint32_t m_num_bytes_of_chunk_content;
        uint32_t m_num_bytes_of_children_chunks;
        kaitai::kstruct* m_chunk_content;
        bool n_chunk_content;

    public:
        bool _is_null_chunk_content() { chunk_content(); return n_chunk_content; };

    private:
        std::vector<chunk_t*>* m_children_chunks;
        bool n_children_chunks;

    public:
        bool _is_null_children_chunks() { children_chunks(); return n_children_chunks; };

    private:
        vox_t* m__root;
        kaitai::kstruct* m__parent;
        std::string m__raw_chunk_content;
        kaitai::kstream* m__io__raw_chunk_content;

    public:
        chunk_type_t chunk_id() const { return m_chunk_id; }
        uint32_t num_bytes_of_chunk_content() const { return m_num_bytes_of_chunk_content; }
        uint32_t num_bytes_of_children_chunks() const { return m_num_bytes_of_children_chunks; }
        kaitai::kstruct* chunk_content() const { return m_chunk_content; }
        std::vector<chunk_t*>* children_chunks() const { return m_children_chunks; }
        vox_t* _root() const { return m__root; }
        kaitai::kstruct* _parent() const { return m__parent; }
        std::string _raw_chunk_content() const { return m__raw_chunk_content; }
        kaitai::kstream* _io__raw_chunk_content() const { return m__io__raw_chunk_content; }
    };

    class size_t : public kaitai::kstruct {

    public:

        size_t(kaitai::kstream* p__io, vox_t::chunk_t* p__parent = 0, vox_t* p__root = 0);

    private:
        void _read();

    public:
        ~size_t();

    private:
        uint32_t m_size_x;
        uint32_t m_size_y;
        uint32_t m_size_z;
        vox_t* m__root;
        vox_t::chunk_t* m__parent;

    public:
        uint32_t size_x() const { return m_size_x; }
        uint32_t size_y() const { return m_size_y; }
        uint32_t size_z() const { return m_size_z; }
        vox_t* _root() const { return m__root; }
        vox_t::chunk_t* _parent() const { return m__parent; }
    };

    class rgba_t : public kaitai::kstruct {

    public:

        rgba_t(kaitai::kstream* p__io, vox_t::chunk_t* p__parent = 0, vox_t* p__root = 0);

    private:
        void _read();

    public:
        ~rgba_t();

    private:
        std::vector<color_t*>* m_colors;
        vox_t* m__root;
        vox_t::chunk_t* m__parent;

    public:
        std::vector<color_t*>* colors() const { return m_colors; }
        vox_t* _root() const { return m__root; }
        vox_t::chunk_t* _parent() const { return m__parent; }
    };

    class pack_t : public kaitai::kstruct {

    public:

        pack_t(kaitai::kstream* p__io, vox_t::chunk_t* p__parent = 0, vox_t* p__root = 0);

    private:
        void _read();

    public:
        ~pack_t();

    private:
        uint32_t m_num_models;
        vox_t* m__root;
        vox_t::chunk_t* m__parent;

    public:
        uint32_t num_models() const { return m_num_models; }
        vox_t* _root() const { return m__root; }
        vox_t::chunk_t* _parent() const { return m__parent; }
    };

    class matt_t : public kaitai::kstruct {

    public:

        matt_t(kaitai::kstream* p__io, vox_t::chunk_t* p__parent = 0, vox_t* p__root = 0);

    private:
        void _read();

    public:
        ~matt_t();

    private:
        bool f_has_is_total_power;
        bool m_has_is_total_power;

    public:
        bool has_is_total_power();

    private:
        bool f_has_plastic;
        bool m_has_plastic;

    public:
        bool has_plastic();

    private:
        bool f_has_attenuation;
        bool m_has_attenuation;

    public:
        bool has_attenuation();

    private:
        bool f_has_power;
        bool m_has_power;

    public:
        bool has_power();

    private:
        bool f_has_roughness;
        bool m_has_roughness;

    public:
        bool has_roughness();

    private:
        bool f_has_specular;
        bool m_has_specular;

    public:
        bool has_specular();

    private:
        bool f_has_ior;
        bool m_has_ior;

    public:
        bool has_ior();

    private:
        bool f_has_glow;
        bool m_has_glow;

    public:
        bool has_glow();

    private:
        uint32_t m_id;
        material_type_t m_material_type;
        float m_material_weight;
        uint32_t m_property_bits;
        float m_plastic;
        bool n_plastic;

    public:
        bool _is_null_plastic() { plastic(); return n_plastic; };

    private:
        float m_roughness;
        bool n_roughness;

    public:
        bool _is_null_roughness() { roughness(); return n_roughness; };

    private:
        float m_specular;
        bool n_specular;

    public:
        bool _is_null_specular() { specular(); return n_specular; };

    private:
        float m_ior;
        bool n_ior;

    public:
        bool _is_null_ior() { ior(); return n_ior; };

    private:
        float m_attenuation;
        bool n_attenuation;

    public:
        bool _is_null_attenuation() { attenuation(); return n_attenuation; };

    private:
        float m_power;
        bool n_power;

    public:
        bool _is_null_power() { power(); return n_power; };

    private:
        float m_glow;
        bool n_glow;

    public:
        bool _is_null_glow() { glow(); return n_glow; };

    private:
        float m_is_total_power;
        bool n_is_total_power;

    public:
        bool _is_null_is_total_power() { is_total_power(); return n_is_total_power; };

    private:
        vox_t* m__root;
        vox_t::chunk_t* m__parent;

    public:
        uint32_t id() const { return m_id; }
        material_type_t material_type() const { return m_material_type; }
        float material_weight() const { return m_material_weight; }
        uint32_t property_bits() const { return m_property_bits; }
        float plastic() const { return m_plastic; }
        float roughness() const { return m_roughness; }
        float specular() const { return m_specular; }
        float ior() const { return m_ior; }
        float attenuation() const { return m_attenuation; }
        float power() const { return m_power; }
        float glow() const { return m_glow; }
        float is_total_power() const { return m_is_total_power; }
        vox_t* _root() const { return m__root; }
        vox_t::chunk_t* _parent() const { return m__parent; }
    };

    class xyzi_t : public kaitai::kstruct {

    public:

        xyzi_t(kaitai::kstream* p__io, vox_t::chunk_t* p__parent = 0, vox_t* p__root = 0);

    private:
        void _read();

    public:
        ~xyzi_t();

    private:
        uint32_t m_num_voxels;
        std::vector<voxel_t*>* m_voxels;
        vox_t* m__root;
        vox_t::chunk_t* m__parent;

    public:
        uint32_t num_voxels() const { return m_num_voxels; }
        std::vector<voxel_t*>* voxels() const { return m_voxels; }
        vox_t* _root() const { return m__root; }
        vox_t::chunk_t* _parent() const { return m__parent; }
    };

    class color_t : public kaitai::kstruct {

    public:

        color_t(kaitai::kstream* p__io, vox_t::rgba_t* p__parent = 0, vox_t* p__root = 0);

    private:
        void _read();

    public:
        ~color_t();

    private:
        uint8_t m_r;
        uint8_t m_g;
        uint8_t m_b;
        uint8_t m_a;
        vox_t* m__root;
        vox_t::rgba_t* m__parent;

    public:
        uint8_t r() const { return m_r; }
        uint8_t g() const { return m_g; }
        uint8_t b() const { return m_b; }
        uint8_t a() const { return m_a; }
        vox_t* _root() const { return m__root; }
        vox_t::rgba_t* _parent() const { return m__parent; }
    };

    class voxel_t : public kaitai::kstruct {

    public:

        voxel_t(kaitai::kstream* p__io, vox_t::xyzi_t* p__parent = 0, vox_t* p__root = 0);

    private:
        void _read();

    public:
        ~voxel_t();

    private:
        uint8_t m_x;
        uint8_t m_y;
        uint8_t m_z;
        uint8_t m_color_index;
        vox_t* m__root;
        vox_t::xyzi_t* m__parent;

    public:
        uint8_t x() const { return m_x; }
        uint8_t y() const { return m_y; }
        uint8_t z() const { return m_z; }
        uint8_t color_index() const { return m_color_index; }
        vox_t* _root() const { return m__root; }
        vox_t::xyzi_t* _parent() const { return m__parent; }
    };

private:
    std::string m_magic;
    uint32_t m_version;
    chunk_t* m_main;
    vox_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::string magic() const { return m_magic; }

    /**
     * 150 expected
     */
    uint32_t version() const { return m_version; }
    chunk_t* main() const { return m_main; }
    vox_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // VOX_H_

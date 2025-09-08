// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "magicavoxel_vox.h"
#include "kaitai/exceptions.h"
std::set<magicavoxel_vox_t::chunk_type_t> magicavoxel_vox_t::_build_values_chunk_type_t() {
    std::set<magicavoxel_vox_t::chunk_type_t> _t;
    _t.insert(magicavoxel_vox_t::CHUNK_TYPE_MAIN);
    _t.insert(magicavoxel_vox_t::CHUNK_TYPE_MATT);
    _t.insert(magicavoxel_vox_t::CHUNK_TYPE_PACK);
    _t.insert(magicavoxel_vox_t::CHUNK_TYPE_RGBA);
    _t.insert(magicavoxel_vox_t::CHUNK_TYPE_SIZE);
    _t.insert(magicavoxel_vox_t::CHUNK_TYPE_XYZI);
    return _t;
}
const std::set<magicavoxel_vox_t::chunk_type_t> magicavoxel_vox_t::_values_chunk_type_t = magicavoxel_vox_t::_build_values_chunk_type_t();
bool magicavoxel_vox_t::_is_defined_chunk_type_t(magicavoxel_vox_t::chunk_type_t v) {
    return magicavoxel_vox_t::_values_chunk_type_t.find(v) != magicavoxel_vox_t::_values_chunk_type_t.end();
}
std::set<magicavoxel_vox_t::material_type_t> magicavoxel_vox_t::_build_values_material_type_t() {
    std::set<magicavoxel_vox_t::material_type_t> _t;
    _t.insert(magicavoxel_vox_t::MATERIAL_TYPE_DIFFUSE);
    _t.insert(magicavoxel_vox_t::MATERIAL_TYPE_METAL);
    _t.insert(magicavoxel_vox_t::MATERIAL_TYPE_GLASS);
    _t.insert(magicavoxel_vox_t::MATERIAL_TYPE_EMISSIVE);
    return _t;
}
const std::set<magicavoxel_vox_t::material_type_t> magicavoxel_vox_t::_values_material_type_t = magicavoxel_vox_t::_build_values_material_type_t();
bool magicavoxel_vox_t::_is_defined_material_type_t(magicavoxel_vox_t::material_type_t v) {
    return magicavoxel_vox_t::_values_material_type_t.find(v) != magicavoxel_vox_t::_values_material_type_t.end();
}
std::set<magicavoxel_vox_t::property_bits_type_t> magicavoxel_vox_t::_build_values_property_bits_type_t() {
    std::set<magicavoxel_vox_t::property_bits_type_t> _t;
    _t.insert(magicavoxel_vox_t::PROPERTY_BITS_TYPE_PLASTIC);
    _t.insert(magicavoxel_vox_t::PROPERTY_BITS_TYPE_ROUGHNESS);
    _t.insert(magicavoxel_vox_t::PROPERTY_BITS_TYPE_SPECULAR);
    _t.insert(magicavoxel_vox_t::PROPERTY_BITS_TYPE_IOR);
    _t.insert(magicavoxel_vox_t::PROPERTY_BITS_TYPE_ATTENUATION);
    _t.insert(magicavoxel_vox_t::PROPERTY_BITS_TYPE_POWER);
    _t.insert(magicavoxel_vox_t::PROPERTY_BITS_TYPE_GLOW);
    _t.insert(magicavoxel_vox_t::PROPERTY_BITS_TYPE_IS_TOTAL_POWER);
    return _t;
}
const std::set<magicavoxel_vox_t::property_bits_type_t> magicavoxel_vox_t::_values_property_bits_type_t = magicavoxel_vox_t::_build_values_property_bits_type_t();
bool magicavoxel_vox_t::_is_defined_property_bits_type_t(magicavoxel_vox_t::property_bits_type_t v) {
    return magicavoxel_vox_t::_values_property_bits_type_t.find(v) != magicavoxel_vox_t::_values_property_bits_type_t.end();
}

magicavoxel_vox_t::magicavoxel_vox_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, magicavoxel_vox_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_main = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void magicavoxel_vox_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x56\x4F\x58\x20", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x56\x4F\x58\x20", 4), m_magic, m__io, std::string("/seq/0"));
    }
    m_version = m__io->read_u4le();
    m_main = new chunk_t(m__io, this, m__root);
}

magicavoxel_vox_t::~magicavoxel_vox_t() {
    _clean_up();
}

void magicavoxel_vox_t::_clean_up() {
    if (m_main) {
        delete m_main; m_main = 0;
    }
}

magicavoxel_vox_t::chunk_t::chunk_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, magicavoxel_vox_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_chunk_content = 0;
    m_children_chunks = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void magicavoxel_vox_t::chunk_t::_read() {
    m_chunk_id = static_cast<magicavoxel_vox_t::chunk_type_t>(m__io->read_u4be());
    m_num_bytes_of_chunk_content = m__io->read_u4le();
    m_num_bytes_of_children_chunks = m__io->read_u4le();
    n_chunk_content = true;
    if (num_bytes_of_chunk_content() != 0) {
        n_chunk_content = false;
        n_chunk_content = true;
        switch (chunk_id()) {
        case magicavoxel_vox_t::CHUNK_TYPE_MATT: {
            n_chunk_content = false;
            m__raw_chunk_content = m__io->read_bytes(num_bytes_of_chunk_content());
            m__io__raw_chunk_content = new kaitai::kstream(m__raw_chunk_content);
            m_chunk_content = new matt_t(m__io__raw_chunk_content, this, m__root);
            break;
        }
        case magicavoxel_vox_t::CHUNK_TYPE_PACK: {
            n_chunk_content = false;
            m__raw_chunk_content = m__io->read_bytes(num_bytes_of_chunk_content());
            m__io__raw_chunk_content = new kaitai::kstream(m__raw_chunk_content);
            m_chunk_content = new pack_t(m__io__raw_chunk_content, this, m__root);
            break;
        }
        case magicavoxel_vox_t::CHUNK_TYPE_RGBA: {
            n_chunk_content = false;
            m__raw_chunk_content = m__io->read_bytes(num_bytes_of_chunk_content());
            m__io__raw_chunk_content = new kaitai::kstream(m__raw_chunk_content);
            m_chunk_content = new rgba_t(m__io__raw_chunk_content, this, m__root);
            break;
        }
        case magicavoxel_vox_t::CHUNK_TYPE_SIZE: {
            n_chunk_content = false;
            m__raw_chunk_content = m__io->read_bytes(num_bytes_of_chunk_content());
            m__io__raw_chunk_content = new kaitai::kstream(m__raw_chunk_content);
            m_chunk_content = new size_t(m__io__raw_chunk_content, this, m__root);
            break;
        }
        case magicavoxel_vox_t::CHUNK_TYPE_XYZI: {
            n_chunk_content = false;
            m__raw_chunk_content = m__io->read_bytes(num_bytes_of_chunk_content());
            m__io__raw_chunk_content = new kaitai::kstream(m__raw_chunk_content);
            m_chunk_content = new xyzi_t(m__io__raw_chunk_content, this, m__root);
            break;
        }
        default: {
            m__raw_chunk_content = m__io->read_bytes(num_bytes_of_chunk_content());
            break;
        }
        }
    }
    n_children_chunks = true;
    if (num_bytes_of_children_chunks() != 0) {
        n_children_chunks = false;
        m_children_chunks = new std::vector<chunk_t*>();
        {
            int i = 0;
            while (!m__io->is_eof()) {
                m_children_chunks->push_back(new chunk_t(m__io, this, m__root));
                i++;
            }
        }
    }
}

magicavoxel_vox_t::chunk_t::~chunk_t() {
    _clean_up();
}

void magicavoxel_vox_t::chunk_t::_clean_up() {
    if (!n_chunk_content) {
        if (m__io__raw_chunk_content) {
            delete m__io__raw_chunk_content; m__io__raw_chunk_content = 0;
        }
        if (m_chunk_content) {
            delete m_chunk_content; m_chunk_content = 0;
        }
    }
    if (!n_children_chunks) {
        if (m_children_chunks) {
            for (std::vector<chunk_t*>::iterator it = m_children_chunks->begin(); it != m_children_chunks->end(); ++it) {
                delete *it;
            }
            delete m_children_chunks; m_children_chunks = 0;
        }
    }
}

magicavoxel_vox_t::color_t::color_t(kaitai::kstream* p__io, magicavoxel_vox_t::rgba_t* p__parent, magicavoxel_vox_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void magicavoxel_vox_t::color_t::_read() {
    m_r = m__io->read_u1();
    m_g = m__io->read_u1();
    m_b = m__io->read_u1();
    m_a = m__io->read_u1();
}

magicavoxel_vox_t::color_t::~color_t() {
    _clean_up();
}

void magicavoxel_vox_t::color_t::_clean_up() {
}

magicavoxel_vox_t::matt_t::matt_t(kaitai::kstream* p__io, magicavoxel_vox_t::chunk_t* p__parent, magicavoxel_vox_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_has_attenuation = false;
    f_has_glow = false;
    f_has_ior = false;
    f_has_is_total_power = false;
    f_has_plastic = false;
    f_has_power = false;
    f_has_roughness = false;
    f_has_specular = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void magicavoxel_vox_t::matt_t::_read() {
    m_id = m__io->read_u4le();
    m_material_type = static_cast<magicavoxel_vox_t::material_type_t>(m__io->read_u4le());
    m_material_weight = m__io->read_f4le();
    m_property_bits = m__io->read_u4le();
    n_plastic = true;
    if (has_plastic()) {
        n_plastic = false;
        m_plastic = m__io->read_f4le();
    }
    n_roughness = true;
    if (has_roughness()) {
        n_roughness = false;
        m_roughness = m__io->read_f4le();
    }
    n_specular = true;
    if (has_specular()) {
        n_specular = false;
        m_specular = m__io->read_f4le();
    }
    n_ior = true;
    if (has_ior()) {
        n_ior = false;
        m_ior = m__io->read_f4le();
    }
    n_attenuation = true;
    if (has_attenuation()) {
        n_attenuation = false;
        m_attenuation = m__io->read_f4le();
    }
    n_power = true;
    if (has_power()) {
        n_power = false;
        m_power = m__io->read_f4le();
    }
    n_glow = true;
    if (has_glow()) {
        n_glow = false;
        m_glow = m__io->read_f4le();
    }
    n_is_total_power = true;
    if (has_is_total_power()) {
        n_is_total_power = false;
        m_is_total_power = m__io->read_f4le();
    }
}

magicavoxel_vox_t::matt_t::~matt_t() {
    _clean_up();
}

void magicavoxel_vox_t::matt_t::_clean_up() {
    if (!n_plastic) {
    }
    if (!n_roughness) {
    }
    if (!n_specular) {
    }
    if (!n_ior) {
    }
    if (!n_attenuation) {
    }
    if (!n_power) {
    }
    if (!n_glow) {
    }
    if (!n_is_total_power) {
    }
}

bool magicavoxel_vox_t::matt_t::has_attenuation() {
    if (f_has_attenuation)
        return m_has_attenuation;
    f_has_attenuation = true;
    m_has_attenuation = (property_bits() & 16) != 0;
    return m_has_attenuation;
}

bool magicavoxel_vox_t::matt_t::has_glow() {
    if (f_has_glow)
        return m_has_glow;
    f_has_glow = true;
    m_has_glow = (property_bits() & 64) != 0;
    return m_has_glow;
}

bool magicavoxel_vox_t::matt_t::has_ior() {
    if (f_has_ior)
        return m_has_ior;
    f_has_ior = true;
    m_has_ior = (property_bits() & 8) != 0;
    return m_has_ior;
}

bool magicavoxel_vox_t::matt_t::has_is_total_power() {
    if (f_has_is_total_power)
        return m_has_is_total_power;
    f_has_is_total_power = true;
    m_has_is_total_power = (property_bits() & 128) != 0;
    return m_has_is_total_power;
}

bool magicavoxel_vox_t::matt_t::has_plastic() {
    if (f_has_plastic)
        return m_has_plastic;
    f_has_plastic = true;
    m_has_plastic = (property_bits() & 1) != 0;
    return m_has_plastic;
}

bool magicavoxel_vox_t::matt_t::has_power() {
    if (f_has_power)
        return m_has_power;
    f_has_power = true;
    m_has_power = (property_bits() & 32) != 0;
    return m_has_power;
}

bool magicavoxel_vox_t::matt_t::has_roughness() {
    if (f_has_roughness)
        return m_has_roughness;
    f_has_roughness = true;
    m_has_roughness = (property_bits() & 2) != 0;
    return m_has_roughness;
}

bool magicavoxel_vox_t::matt_t::has_specular() {
    if (f_has_specular)
        return m_has_specular;
    f_has_specular = true;
    m_has_specular = (property_bits() & 4) != 0;
    return m_has_specular;
}

magicavoxel_vox_t::pack_t::pack_t(kaitai::kstream* p__io, magicavoxel_vox_t::chunk_t* p__parent, magicavoxel_vox_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void magicavoxel_vox_t::pack_t::_read() {
    m_num_models = m__io->read_u4le();
}

magicavoxel_vox_t::pack_t::~pack_t() {
    _clean_up();
}

void magicavoxel_vox_t::pack_t::_clean_up() {
}

magicavoxel_vox_t::rgba_t::rgba_t(kaitai::kstream* p__io, magicavoxel_vox_t::chunk_t* p__parent, magicavoxel_vox_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_colors = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void magicavoxel_vox_t::rgba_t::_read() {
    m_colors = new std::vector<color_t*>();
    const int l_colors = 256;
    for (int i = 0; i < l_colors; i++) {
        m_colors->push_back(new color_t(m__io, this, m__root));
    }
}

magicavoxel_vox_t::rgba_t::~rgba_t() {
    _clean_up();
}

void magicavoxel_vox_t::rgba_t::_clean_up() {
    if (m_colors) {
        for (std::vector<color_t*>::iterator it = m_colors->begin(); it != m_colors->end(); ++it) {
            delete *it;
        }
        delete m_colors; m_colors = 0;
    }
}

magicavoxel_vox_t::size_t::size_t(kaitai::kstream* p__io, magicavoxel_vox_t::chunk_t* p__parent, magicavoxel_vox_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void magicavoxel_vox_t::size_t::_read() {
    m_size_x = m__io->read_u4le();
    m_size_y = m__io->read_u4le();
    m_size_z = m__io->read_u4le();
}

magicavoxel_vox_t::size_t::~size_t() {
    _clean_up();
}

void magicavoxel_vox_t::size_t::_clean_up() {
}

magicavoxel_vox_t::voxel_t::voxel_t(kaitai::kstream* p__io, magicavoxel_vox_t::xyzi_t* p__parent, magicavoxel_vox_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void magicavoxel_vox_t::voxel_t::_read() {
    m_x = m__io->read_u1();
    m_y = m__io->read_u1();
    m_z = m__io->read_u1();
    m_color_index = m__io->read_u1();
}

magicavoxel_vox_t::voxel_t::~voxel_t() {
    _clean_up();
}

void magicavoxel_vox_t::voxel_t::_clean_up() {
}

magicavoxel_vox_t::xyzi_t::xyzi_t(kaitai::kstream* p__io, magicavoxel_vox_t::chunk_t* p__parent, magicavoxel_vox_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_voxels = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void magicavoxel_vox_t::xyzi_t::_read() {
    m_num_voxels = m__io->read_u4le();
    m_voxels = new std::vector<voxel_t*>();
    const int l_voxels = num_voxels();
    for (int i = 0; i < l_voxels; i++) {
        m_voxels->push_back(new voxel_t(m__io, this, m__root));
    }
}

magicavoxel_vox_t::xyzi_t::~xyzi_t() {
    _clean_up();
}

void magicavoxel_vox_t::xyzi_t::_clean_up() {
    if (m_voxels) {
        for (std::vector<voxel_t*>::iterator it = m_voxels->begin(); it != m_voxels->end(); ++it) {
            delete *it;
        }
        delete m_voxels; m_voxels = 0;
    }
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "magicavoxel_vox.h"
#include "kaitai/exceptions.h"

magicavoxel_vox_t::magicavoxel_vox_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, magicavoxel_vox_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_main = nullptr;
    _read();
}

void magicavoxel_vox_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\x56\x4F\x58\x20", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x56\x4F\x58\x20", 4), magic(), _io(), std::string("/seq/0"));
    }
    m_version = m__io->read_u4le();
    m_main = std::unique_ptr<chunk_t>(new chunk_t(m__io, this, m__root));
}

magicavoxel_vox_t::~magicavoxel_vox_t() {
    _clean_up();
}

void magicavoxel_vox_t::_clean_up() {
}

magicavoxel_vox_t::chunk_t::chunk_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, magicavoxel_vox_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_chunk_content = nullptr;
    m_children_chunks = nullptr;
    _read();
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
        case magicavoxel_vox_t::CHUNK_TYPE_SIZE: {
            n_chunk_content = false;
            m__raw_chunk_content = m__io->read_bytes(num_bytes_of_chunk_content());
            m__io__raw_chunk_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_chunk_content));
            m_chunk_content = std::unique_ptr<size_t>(new size_t(m__io__raw_chunk_content.get(), this, m__root));
            break;
        }
        case magicavoxel_vox_t::CHUNK_TYPE_MATT: {
            n_chunk_content = false;
            m__raw_chunk_content = m__io->read_bytes(num_bytes_of_chunk_content());
            m__io__raw_chunk_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_chunk_content));
            m_chunk_content = std::unique_ptr<matt_t>(new matt_t(m__io__raw_chunk_content.get(), this, m__root));
            break;
        }
        case magicavoxel_vox_t::CHUNK_TYPE_RGBA: {
            n_chunk_content = false;
            m__raw_chunk_content = m__io->read_bytes(num_bytes_of_chunk_content());
            m__io__raw_chunk_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_chunk_content));
            m_chunk_content = std::unique_ptr<rgba_t>(new rgba_t(m__io__raw_chunk_content.get(), this, m__root));
            break;
        }
        case magicavoxel_vox_t::CHUNK_TYPE_XYZI: {
            n_chunk_content = false;
            m__raw_chunk_content = m__io->read_bytes(num_bytes_of_chunk_content());
            m__io__raw_chunk_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_chunk_content));
            m_chunk_content = std::unique_ptr<xyzi_t>(new xyzi_t(m__io__raw_chunk_content.get(), this, m__root));
            break;
        }
        case magicavoxel_vox_t::CHUNK_TYPE_PACK: {
            n_chunk_content = false;
            m__raw_chunk_content = m__io->read_bytes(num_bytes_of_chunk_content());
            m__io__raw_chunk_content = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_chunk_content));
            m_chunk_content = std::unique_ptr<pack_t>(new pack_t(m__io__raw_chunk_content.get(), this, m__root));
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
        m_children_chunks = std::unique_ptr<std::vector<std::unique_ptr<chunk_t>>>(new std::vector<std::unique_ptr<chunk_t>>());
        {
            int i = 0;
            while (!m__io->is_eof()) {
                m_children_chunks->push_back(std::move(std::unique_ptr<chunk_t>(new chunk_t(m__io, this, m__root))));
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
    }
    if (!n_children_chunks) {
    }
}

magicavoxel_vox_t::size_t::size_t(kaitai::kstream* p__io, magicavoxel_vox_t::chunk_t* p__parent, magicavoxel_vox_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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

magicavoxel_vox_t::rgba_t::rgba_t(kaitai::kstream* p__io, magicavoxel_vox_t::chunk_t* p__parent, magicavoxel_vox_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_colors = nullptr;
    _read();
}

void magicavoxel_vox_t::rgba_t::_read() {
    int l_colors = 256;
    m_colors = std::unique_ptr<std::vector<std::unique_ptr<color_t>>>(new std::vector<std::unique_ptr<color_t>>());
    m_colors->reserve(l_colors);
    for (int i = 0; i < l_colors; i++) {
        m_colors->push_back(std::move(std::unique_ptr<color_t>(new color_t(m__io, this, m__root))));
    }
}

magicavoxel_vox_t::rgba_t::~rgba_t() {
    _clean_up();
}

void magicavoxel_vox_t::rgba_t::_clean_up() {
}

magicavoxel_vox_t::pack_t::pack_t(kaitai::kstream* p__io, magicavoxel_vox_t::chunk_t* p__parent, magicavoxel_vox_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void magicavoxel_vox_t::pack_t::_read() {
    m_num_models = m__io->read_u4le();
}

magicavoxel_vox_t::pack_t::~pack_t() {
    _clean_up();
}

void magicavoxel_vox_t::pack_t::_clean_up() {
}

magicavoxel_vox_t::matt_t::matt_t(kaitai::kstream* p__io, magicavoxel_vox_t::chunk_t* p__parent, magicavoxel_vox_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_has_is_total_power = false;
    f_has_plastic = false;
    f_has_attenuation = false;
    f_has_power = false;
    f_has_roughness = false;
    f_has_specular = false;
    f_has_ior = false;
    f_has_glow = false;
    _read();
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

bool magicavoxel_vox_t::matt_t::has_is_total_power() {
    if (f_has_is_total_power)
        return m_has_is_total_power;
    m_has_is_total_power = (property_bits() & 128) != 0;
    f_has_is_total_power = true;
    return m_has_is_total_power;
}

bool magicavoxel_vox_t::matt_t::has_plastic() {
    if (f_has_plastic)
        return m_has_plastic;
    m_has_plastic = (property_bits() & 1) != 0;
    f_has_plastic = true;
    return m_has_plastic;
}

bool magicavoxel_vox_t::matt_t::has_attenuation() {
    if (f_has_attenuation)
        return m_has_attenuation;
    m_has_attenuation = (property_bits() & 16) != 0;
    f_has_attenuation = true;
    return m_has_attenuation;
}

bool magicavoxel_vox_t::matt_t::has_power() {
    if (f_has_power)
        return m_has_power;
    m_has_power = (property_bits() & 32) != 0;
    f_has_power = true;
    return m_has_power;
}

bool magicavoxel_vox_t::matt_t::has_roughness() {
    if (f_has_roughness)
        return m_has_roughness;
    m_has_roughness = (property_bits() & 2) != 0;
    f_has_roughness = true;
    return m_has_roughness;
}

bool magicavoxel_vox_t::matt_t::has_specular() {
    if (f_has_specular)
        return m_has_specular;
    m_has_specular = (property_bits() & 4) != 0;
    f_has_specular = true;
    return m_has_specular;
}

bool magicavoxel_vox_t::matt_t::has_ior() {
    if (f_has_ior)
        return m_has_ior;
    m_has_ior = (property_bits() & 8) != 0;
    f_has_ior = true;
    return m_has_ior;
}

bool magicavoxel_vox_t::matt_t::has_glow() {
    if (f_has_glow)
        return m_has_glow;
    m_has_glow = (property_bits() & 64) != 0;
    f_has_glow = true;
    return m_has_glow;
}

magicavoxel_vox_t::xyzi_t::xyzi_t(kaitai::kstream* p__io, magicavoxel_vox_t::chunk_t* p__parent, magicavoxel_vox_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_voxels = nullptr;
    _read();
}

void magicavoxel_vox_t::xyzi_t::_read() {
    m_num_voxels = m__io->read_u4le();
    int l_voxels = num_voxels();
    m_voxels = std::unique_ptr<std::vector<std::unique_ptr<voxel_t>>>(new std::vector<std::unique_ptr<voxel_t>>());
    m_voxels->reserve(l_voxels);
    for (int i = 0; i < l_voxels; i++) {
        m_voxels->push_back(std::move(std::unique_ptr<voxel_t>(new voxel_t(m__io, this, m__root))));
    }
}

magicavoxel_vox_t::xyzi_t::~xyzi_t() {
    _clean_up();
}

void magicavoxel_vox_t::xyzi_t::_clean_up() {
}

magicavoxel_vox_t::color_t::color_t(kaitai::kstream* p__io, magicavoxel_vox_t::rgba_t* p__parent, magicavoxel_vox_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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

magicavoxel_vox_t::voxel_t::voxel_t(kaitai::kstream* p__io, magicavoxel_vox_t::xyzi_t* p__parent, magicavoxel_vox_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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

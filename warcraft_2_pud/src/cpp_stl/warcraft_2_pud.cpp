// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "warcraft_2_pud.h"



warcraft_2_pud_t::warcraft_2_pud_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, warcraft_2_pud_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void warcraft_2_pud_t::_read() {
    m_sections = new std::vector<section_t*>();
    while (!m__io->is_eof()) {
        m_sections->push_back(new section_t(m__io, this, m__root));
    }
}

warcraft_2_pud_t::~warcraft_2_pud_t() {
    for (std::vector<section_t*>::iterator it = m_sections->begin(); it != m_sections->end(); ++it) {
        delete *it;
    }
    delete m_sections;
}

warcraft_2_pud_t::section_starting_resource_t::section_starting_resource_t(kaitai::kstream *p_io, warcraft_2_pud_t::section_t* p_parent, warcraft_2_pud_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void warcraft_2_pud_t::section_starting_resource_t::_read() {
    m_resources_by_player = new std::vector<uint16_t>();
    while (!m__io->is_eof()) {
        m_resources_by_player->push_back(m__io->read_u2le());
    }
}

warcraft_2_pud_t::section_starting_resource_t::~section_starting_resource_t() {
    delete m_resources_by_player;
}

warcraft_2_pud_t::section_era_t::section_era_t(kaitai::kstream *p_io, warcraft_2_pud_t::section_t* p_parent, warcraft_2_pud_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void warcraft_2_pud_t::section_era_t::_read() {
    m_terrain = static_cast<warcraft_2_pud_t::terrain_type_t>(m__io->read_u2le());
}

warcraft_2_pud_t::section_era_t::~section_era_t() {
}

warcraft_2_pud_t::section_ver_t::section_ver_t(kaitai::kstream *p_io, warcraft_2_pud_t::section_t* p_parent, warcraft_2_pud_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void warcraft_2_pud_t::section_ver_t::_read() {
    m_version = m__io->read_u2le();
}

warcraft_2_pud_t::section_ver_t::~section_ver_t() {
}

warcraft_2_pud_t::section_dim_t::section_dim_t(kaitai::kstream *p_io, warcraft_2_pud_t::section_t* p_parent, warcraft_2_pud_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void warcraft_2_pud_t::section_dim_t::_read() {
    m_x = m__io->read_u2le();
    m_y = m__io->read_u2le();
}

warcraft_2_pud_t::section_dim_t::~section_dim_t() {
}

warcraft_2_pud_t::section_type_t::section_type_t(kaitai::kstream *p_io, warcraft_2_pud_t::section_t* p_parent, warcraft_2_pud_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void warcraft_2_pud_t::section_type_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\x57\x41\x52\x32\x20\x4D\x41\x50\x00\x00", 10));
    m_unused = m__io->read_bytes(2);
    m_id_tag = m__io->read_u4le();
}

warcraft_2_pud_t::section_type_t::~section_type_t() {
}

warcraft_2_pud_t::section_unit_t::section_unit_t(kaitai::kstream *p_io, warcraft_2_pud_t::section_t* p_parent, warcraft_2_pud_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void warcraft_2_pud_t::section_unit_t::_read() {
    m_units = new std::vector<unit_t*>();
    while (!m__io->is_eof()) {
        m_units->push_back(new unit_t(m__io, this, m__root));
    }
}

warcraft_2_pud_t::section_unit_t::~section_unit_t() {
    for (std::vector<unit_t*>::iterator it = m_units->begin(); it != m_units->end(); ++it) {
        delete *it;
    }
    delete m_units;
}

warcraft_2_pud_t::section_t::section_t(kaitai::kstream *p_io, warcraft_2_pud_t* p_parent, warcraft_2_pud_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void warcraft_2_pud_t::section_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ASCII"));
    m_size = m__io->read_u4le();
    {
        std::string on = name();
        if (on == std::string("SLBR")) {
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_starting_resource_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("ERAX")) {
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_era_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("OWNR")) {
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_ownr_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("ERA ")) {
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_era_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("SGLD")) {
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_starting_resource_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("VER ")) {
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_ver_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("SOIL")) {
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_starting_resource_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("UNIT")) {
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_unit_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("DIM ")) {
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_dim_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("TYPE")) {
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_type_t(m__io__raw_body, this, m__root);
        }
        else {
            m__raw_body = m__io->read_bytes(size());
        }
    }
}

warcraft_2_pud_t::section_t::~section_t() {
}

warcraft_2_pud_t::section_ownr_t::section_ownr_t(kaitai::kstream *p_io, warcraft_2_pud_t::section_t* p_parent, warcraft_2_pud_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void warcraft_2_pud_t::section_ownr_t::_read() {
    m_controller_by_player = new std::vector<controller_t>();
    while (!m__io->is_eof()) {
        m_controller_by_player->push_back(static_cast<warcraft_2_pud_t::controller_t>(m__io->read_u1()));
    }
}

warcraft_2_pud_t::section_ownr_t::~section_ownr_t() {
    delete m_controller_by_player;
}

warcraft_2_pud_t::unit_t::unit_t(kaitai::kstream *p_io, warcraft_2_pud_t::section_unit_t* p_parent, warcraft_2_pud_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    f_resource = false;
    _read();
}

void warcraft_2_pud_t::unit_t::_read() {
    m_x = m__io->read_u2le();
    m_y = m__io->read_u2le();
    m_u_type = static_cast<warcraft_2_pud_t::unit_type_t>(m__io->read_u1());
    m_owner = m__io->read_u1();
    m_options = m__io->read_u2le();
}

warcraft_2_pud_t::unit_t::~unit_t() {
}

int32_t warcraft_2_pud_t::unit_t::resource() {
    if (f_resource)
        return m_resource;
    n_resource = true;
    if ( ((u_type() == UNIT_TYPE_GOLD_MINE) || (u_type() == UNIT_TYPE_HUMAN_OIL_WELL) || (u_type() == UNIT_TYPE_ORC_OIL_WELL) || (u_type() == UNIT_TYPE_OIL_PATCH)) ) {
        n_resource = false;
        m_resource = (options() * 2500);
    }
    f_resource = true;
    return m_resource;
}

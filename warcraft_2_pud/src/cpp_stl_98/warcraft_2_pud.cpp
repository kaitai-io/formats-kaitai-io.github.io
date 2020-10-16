// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "warcraft_2_pud.h"
#include "kaitai/exceptions.h"

warcraft_2_pud_t::warcraft_2_pud_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, warcraft_2_pud_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_sections = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void warcraft_2_pud_t::_read() {
    m_sections = new std::vector<section_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_sections->push_back(new section_t(m__io, this, m__root));
            i++;
        }
    }
}

warcraft_2_pud_t::~warcraft_2_pud_t() {
    _clean_up();
}

void warcraft_2_pud_t::_clean_up() {
    if (m_sections) {
        for (std::vector<section_t*>::iterator it = m_sections->begin(); it != m_sections->end(); ++it) {
            delete *it;
        }
        delete m_sections; m_sections = 0;
    }
}

warcraft_2_pud_t::section_starting_resource_t::section_starting_resource_t(kaitai::kstream* p__io, warcraft_2_pud_t::section_t* p__parent, warcraft_2_pud_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_resources_by_player = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void warcraft_2_pud_t::section_starting_resource_t::_read() {
    m_resources_by_player = new std::vector<uint16_t>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_resources_by_player->push_back(m__io->read_u2le());
            i++;
        }
    }
}

warcraft_2_pud_t::section_starting_resource_t::~section_starting_resource_t() {
    _clean_up();
}

void warcraft_2_pud_t::section_starting_resource_t::_clean_up() {
    if (m_resources_by_player) {
        delete m_resources_by_player; m_resources_by_player = 0;
    }
}

warcraft_2_pud_t::section_era_t::section_era_t(kaitai::kstream* p__io, warcraft_2_pud_t::section_t* p__parent, warcraft_2_pud_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void warcraft_2_pud_t::section_era_t::_read() {
    m_terrain = static_cast<warcraft_2_pud_t::terrain_type_t>(m__io->read_u2le());
}

warcraft_2_pud_t::section_era_t::~section_era_t() {
    _clean_up();
}

void warcraft_2_pud_t::section_era_t::_clean_up() {
}

warcraft_2_pud_t::section_ver_t::section_ver_t(kaitai::kstream* p__io, warcraft_2_pud_t::section_t* p__parent, warcraft_2_pud_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void warcraft_2_pud_t::section_ver_t::_read() {
    m_version = m__io->read_u2le();
}

warcraft_2_pud_t::section_ver_t::~section_ver_t() {
    _clean_up();
}

void warcraft_2_pud_t::section_ver_t::_clean_up() {
}

warcraft_2_pud_t::section_dim_t::section_dim_t(kaitai::kstream* p__io, warcraft_2_pud_t::section_t* p__parent, warcraft_2_pud_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void warcraft_2_pud_t::section_dim_t::_read() {
    m_x = m__io->read_u2le();
    m_y = m__io->read_u2le();
}

warcraft_2_pud_t::section_dim_t::~section_dim_t() {
    _clean_up();
}

void warcraft_2_pud_t::section_dim_t::_clean_up() {
}

warcraft_2_pud_t::section_type_t::section_type_t(kaitai::kstream* p__io, warcraft_2_pud_t::section_t* p__parent, warcraft_2_pud_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void warcraft_2_pud_t::section_type_t::_read() {
    m_magic = m__io->read_bytes(10);
    if (!(magic() == std::string("\x57\x41\x52\x32\x20\x4D\x41\x50\x00\x00", 10))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x57\x41\x52\x32\x20\x4D\x41\x50\x00\x00", 10), magic(), _io(), std::string("/types/section_type/seq/0"));
    }
    m_unused = m__io->read_bytes(2);
    m_id_tag = m__io->read_u4le();
}

warcraft_2_pud_t::section_type_t::~section_type_t() {
    _clean_up();
}

void warcraft_2_pud_t::section_type_t::_clean_up() {
}

warcraft_2_pud_t::section_unit_t::section_unit_t(kaitai::kstream* p__io, warcraft_2_pud_t::section_t* p__parent, warcraft_2_pud_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_units = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void warcraft_2_pud_t::section_unit_t::_read() {
    m_units = new std::vector<unit_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_units->push_back(new unit_t(m__io, this, m__root));
            i++;
        }
    }
}

warcraft_2_pud_t::section_unit_t::~section_unit_t() {
    _clean_up();
}

void warcraft_2_pud_t::section_unit_t::_clean_up() {
    if (m_units) {
        for (std::vector<unit_t*>::iterator it = m_units->begin(); it != m_units->end(); ++it) {
            delete *it;
        }
        delete m_units; m_units = 0;
    }
}

warcraft_2_pud_t::section_t::section_t(kaitai::kstream* p__io, warcraft_2_pud_t* p__parent, warcraft_2_pud_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void warcraft_2_pud_t::section_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("ASCII"));
    m_size = m__io->read_u4le();
    n_body = true;
    {
        std::string on = name();
        if (on == std::string("SLBR")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_starting_resource_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("ERAX")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_era_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("OWNR")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_ownr_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("ERA ")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_era_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("SGLD")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_starting_resource_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("VER ")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_ver_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("SOIL")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_starting_resource_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("UNIT")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_unit_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("DIM ")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_dim_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("TYPE")) {
            n_body = false;
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
    _clean_up();
}

void warcraft_2_pud_t::section_t::_clean_up() {
    if (!n_body) {
        if (m__io__raw_body) {
            delete m__io__raw_body; m__io__raw_body = 0;
        }
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

warcraft_2_pud_t::section_ownr_t::section_ownr_t(kaitai::kstream* p__io, warcraft_2_pud_t::section_t* p__parent, warcraft_2_pud_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_controller_by_player = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void warcraft_2_pud_t::section_ownr_t::_read() {
    m_controller_by_player = new std::vector<controller_t>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_controller_by_player->push_back(static_cast<warcraft_2_pud_t::controller_t>(m__io->read_u1()));
            i++;
        }
    }
}

warcraft_2_pud_t::section_ownr_t::~section_ownr_t() {
    _clean_up();
}

void warcraft_2_pud_t::section_ownr_t::_clean_up() {
    if (m_controller_by_player) {
        delete m_controller_by_player; m_controller_by_player = 0;
    }
}

warcraft_2_pud_t::unit_t::unit_t(kaitai::kstream* p__io, warcraft_2_pud_t::section_unit_t* p__parent, warcraft_2_pud_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_resource = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void warcraft_2_pud_t::unit_t::_read() {
    m_x = m__io->read_u2le();
    m_y = m__io->read_u2le();
    m_u_type = static_cast<warcraft_2_pud_t::unit_type_t>(m__io->read_u1());
    m_owner = m__io->read_u1();
    m_options = m__io->read_u2le();
}

warcraft_2_pud_t::unit_t::~unit_t() {
    _clean_up();
}

void warcraft_2_pud_t::unit_t::_clean_up() {
}

int32_t warcraft_2_pud_t::unit_t::resource() {
    if (f_resource)
        return m_resource;
    n_resource = true;
    if ( ((u_type() == warcraft_2_pud_t::UNIT_TYPE_GOLD_MINE) || (u_type() == warcraft_2_pud_t::UNIT_TYPE_HUMAN_OIL_WELL) || (u_type() == warcraft_2_pud_t::UNIT_TYPE_ORC_OIL_WELL) || (u_type() == warcraft_2_pud_t::UNIT_TYPE_OIL_PATCH)) ) {
        n_resource = false;
        m_resource = (options() * 2500);
    }
    f_resource = true;
    return m_resource;
}

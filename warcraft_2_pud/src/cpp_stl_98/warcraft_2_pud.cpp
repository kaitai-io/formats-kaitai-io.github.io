// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "warcraft_2_pud.h"
#include "kaitai/exceptions.h"
std::set<warcraft_2_pud_t::controller_t> warcraft_2_pud_t::_build_values_controller_t() {
    std::set<warcraft_2_pud_t::controller_t> _t;
    _t.insert(warcraft_2_pud_t::CONTROLLER_COMPUTER1);
    _t.insert(warcraft_2_pud_t::CONTROLLER_PASSIVE_COMPUTER);
    _t.insert(warcraft_2_pud_t::CONTROLLER_NOBODY);
    _t.insert(warcraft_2_pud_t::CONTROLLER_COMPUTER4);
    _t.insert(warcraft_2_pud_t::CONTROLLER_HUMAN);
    _t.insert(warcraft_2_pud_t::CONTROLLER_RESCUE_PASSIVE);
    _t.insert(warcraft_2_pud_t::CONTROLLER_RESCUE_ACTIVE);
    return _t;
}
const std::set<warcraft_2_pud_t::controller_t> warcraft_2_pud_t::_values_controller_t = warcraft_2_pud_t::_build_values_controller_t();
bool warcraft_2_pud_t::_is_defined_controller_t(warcraft_2_pud_t::controller_t v) {
    return warcraft_2_pud_t::_values_controller_t.find(v) != warcraft_2_pud_t::_values_controller_t.end();
}
std::set<warcraft_2_pud_t::terrain_type_t> warcraft_2_pud_t::_build_values_terrain_type_t() {
    std::set<warcraft_2_pud_t::terrain_type_t> _t;
    _t.insert(warcraft_2_pud_t::TERRAIN_TYPE_FOREST);
    _t.insert(warcraft_2_pud_t::TERRAIN_TYPE_WINTER);
    _t.insert(warcraft_2_pud_t::TERRAIN_TYPE_WASTELAND);
    _t.insert(warcraft_2_pud_t::TERRAIN_TYPE_SWAMP);
    return _t;
}
const std::set<warcraft_2_pud_t::terrain_type_t> warcraft_2_pud_t::_values_terrain_type_t = warcraft_2_pud_t::_build_values_terrain_type_t();
bool warcraft_2_pud_t::_is_defined_terrain_type_t(warcraft_2_pud_t::terrain_type_t v) {
    return warcraft_2_pud_t::_values_terrain_type_t.find(v) != warcraft_2_pud_t::_values_terrain_type_t.end();
}
std::set<warcraft_2_pud_t::unit_type_t> warcraft_2_pud_t::_build_values_unit_type_t() {
    std::set<warcraft_2_pud_t::unit_type_t> _t;
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_INFANTRY);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_GRUNT);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_PEASANT);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_PEON);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_BALLISTA);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_CATAPULT);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_KNIGHT);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_OGRE);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_ARCHER);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_AXETHROWER);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_MAGE);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_DEATH_KNIGHT);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_PALADIN);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_OGRE_MAGE);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_DWARVES);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_GOBLIN_SAPPER);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_ATTACK_PEASANT);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_ATTACK_PEON);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_RANGER);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_BERSERKER);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_ALLERIA);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_TERON_GOREFIEND);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_KURDAN_AND_SKY_REE);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_DENTARG);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_KHADGAR);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_GROM_HELLSCREAM);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_HUMAN_TANKER);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_ORC_TANKER);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_HUMAN_TRANSPORT);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_ORC_TRANSPORT);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_ELVEN_DESTROYER);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_TROLL_DESTROYER);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_BATTLESHIP);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_JUGGERNAUGHT);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_DEATHWING);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_GNOMISH_SUBMARINE);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_GIANT_TURTLE);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_GNOMISH_FLYING_MACHINE);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_GOBLIN_ZEPPLIN);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_GRYPHON_RIDER);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_DRAGON);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_TURALYON);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_EYE_OF_KILROGG);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_DANATH);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_KHORGATH_BLADEFIST);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_CHO_GALL);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_LOTHAR);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_GUL_DAN);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_UTHER_LIGHTBRINGER);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_ZULJIN);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_SKELETON);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_DAEMON);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_CRITTER);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_FARM);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_PIG_FARM);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_HUMAN_BARRACKS);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_ORC_BARRACKS);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_CHURCH);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_ALTAR_OF_STORMS);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_HUMAN_SCOUT_TOWER);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_ORC_SCOUT_TOWER);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_STABLES);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_OGRE_MOUND);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_GNOMISH_INVENTOR);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_GOBLIN_ALCHEMIST);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_GRYPHON_AVIARY);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_DRAGON_ROOST);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_HUMAN_SHIPYARD);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_ORC_SHIPYARD);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_TOWN_HALL);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_GREAT_HALL);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_ELVEN_LUMBER_MILL);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_TROLL_LUMBER_MILL);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_HUMAN_FOUNDRY);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_ORC_FOUNDRY);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_MAGE_TOWER);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_TEMPLE_OF_THE_DAMNED);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_HUMAN_BLACKSMITH);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_ORC_BLACKSMITH);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_HUMAN_REFINERY);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_ORC_REFINERY);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_HUMAN_OIL_WELL);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_ORC_OIL_WELL);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_KEEP);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_STRONGHOLD);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_CASTLE);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_FORTRESS);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_GOLD_MINE);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_OIL_PATCH);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_HUMAN_START);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_ORC_START);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_HUMAN_GUARD_TOWER);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_ORC_GUARD_TOWER);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_HUMAN_CANNON_TOWER);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_ORC_CANNON_TOWER);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_CIRCLE_OF_POWER);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_DARK_PORTAL);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_RUNESTONE);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_HUMAN_WALL);
    _t.insert(warcraft_2_pud_t::UNIT_TYPE_ORC_WALL);
    return _t;
}
const std::set<warcraft_2_pud_t::unit_type_t> warcraft_2_pud_t::_values_unit_type_t = warcraft_2_pud_t::_build_values_unit_type_t();
bool warcraft_2_pud_t::_is_defined_unit_type_t(warcraft_2_pud_t::unit_type_t v) {
    return warcraft_2_pud_t::_values_unit_type_t.find(v) != warcraft_2_pud_t::_values_unit_type_t.end();
}

warcraft_2_pud_t::warcraft_2_pud_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, warcraft_2_pud_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
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
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), "ASCII");
    m_size = m__io->read_u4le();
    n_body = true;
    {
        std::string on = name();
        if (on == std::string("DIM ")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_dim_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("ERA ")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_era_t(m__io__raw_body, this, m__root);
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
        else if (on == std::string("SGLD")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_starting_resource_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("SLBR")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_starting_resource_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("SOIL")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_starting_resource_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("TYPE")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_type_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("UNIT")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_unit_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("VER ")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new section_ver_t(m__io__raw_body, this, m__root);
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
    if (!(m_magic == std::string("\x57\x41\x52\x32\x20\x4D\x41\x50\x00\x00", 10))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x57\x41\x52\x32\x20\x4D\x41\x50\x00\x00", 10), m_magic, m__io, std::string("/types/section_type/seq/0"));
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
    f_resource = true;
    n_resource = true;
    if ( ((u_type() == warcraft_2_pud_t::UNIT_TYPE_GOLD_MINE) || (u_type() == warcraft_2_pud_t::UNIT_TYPE_HUMAN_OIL_WELL) || (u_type() == warcraft_2_pud_t::UNIT_TYPE_ORC_OIL_WELL) || (u_type() == warcraft_2_pud_t::UNIT_TYPE_OIL_PATCH)) ) {
        n_resource = false;
        m_resource = options() * 2500;
    }
    return m_resource;
}

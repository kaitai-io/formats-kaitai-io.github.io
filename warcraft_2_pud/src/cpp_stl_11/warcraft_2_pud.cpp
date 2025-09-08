// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "warcraft_2_pud.h"
#include "kaitai/exceptions.h"
const std::set<warcraft_2_pud_t::controller_t> warcraft_2_pud_t::_values_controller_t{
    warcraft_2_pud_t::CONTROLLER_COMPUTER1,
    warcraft_2_pud_t::CONTROLLER_PASSIVE_COMPUTER,
    warcraft_2_pud_t::CONTROLLER_NOBODY,
    warcraft_2_pud_t::CONTROLLER_COMPUTER4,
    warcraft_2_pud_t::CONTROLLER_HUMAN,
    warcraft_2_pud_t::CONTROLLER_RESCUE_PASSIVE,
    warcraft_2_pud_t::CONTROLLER_RESCUE_ACTIVE,
};
bool warcraft_2_pud_t::_is_defined_controller_t(warcraft_2_pud_t::controller_t v) {
    return warcraft_2_pud_t::_values_controller_t.find(v) != warcraft_2_pud_t::_values_controller_t.end();
}
const std::set<warcraft_2_pud_t::terrain_type_t> warcraft_2_pud_t::_values_terrain_type_t{
    warcraft_2_pud_t::TERRAIN_TYPE_FOREST,
    warcraft_2_pud_t::TERRAIN_TYPE_WINTER,
    warcraft_2_pud_t::TERRAIN_TYPE_WASTELAND,
    warcraft_2_pud_t::TERRAIN_TYPE_SWAMP,
};
bool warcraft_2_pud_t::_is_defined_terrain_type_t(warcraft_2_pud_t::terrain_type_t v) {
    return warcraft_2_pud_t::_values_terrain_type_t.find(v) != warcraft_2_pud_t::_values_terrain_type_t.end();
}
const std::set<warcraft_2_pud_t::unit_type_t> warcraft_2_pud_t::_values_unit_type_t{
    warcraft_2_pud_t::UNIT_TYPE_INFANTRY,
    warcraft_2_pud_t::UNIT_TYPE_GRUNT,
    warcraft_2_pud_t::UNIT_TYPE_PEASANT,
    warcraft_2_pud_t::UNIT_TYPE_PEON,
    warcraft_2_pud_t::UNIT_TYPE_BALLISTA,
    warcraft_2_pud_t::UNIT_TYPE_CATAPULT,
    warcraft_2_pud_t::UNIT_TYPE_KNIGHT,
    warcraft_2_pud_t::UNIT_TYPE_OGRE,
    warcraft_2_pud_t::UNIT_TYPE_ARCHER,
    warcraft_2_pud_t::UNIT_TYPE_AXETHROWER,
    warcraft_2_pud_t::UNIT_TYPE_MAGE,
    warcraft_2_pud_t::UNIT_TYPE_DEATH_KNIGHT,
    warcraft_2_pud_t::UNIT_TYPE_PALADIN,
    warcraft_2_pud_t::UNIT_TYPE_OGRE_MAGE,
    warcraft_2_pud_t::UNIT_TYPE_DWARVES,
    warcraft_2_pud_t::UNIT_TYPE_GOBLIN_SAPPER,
    warcraft_2_pud_t::UNIT_TYPE_ATTACK_PEASANT,
    warcraft_2_pud_t::UNIT_TYPE_ATTACK_PEON,
    warcraft_2_pud_t::UNIT_TYPE_RANGER,
    warcraft_2_pud_t::UNIT_TYPE_BERSERKER,
    warcraft_2_pud_t::UNIT_TYPE_ALLERIA,
    warcraft_2_pud_t::UNIT_TYPE_TERON_GOREFIEND,
    warcraft_2_pud_t::UNIT_TYPE_KURDAN_AND_SKY_REE,
    warcraft_2_pud_t::UNIT_TYPE_DENTARG,
    warcraft_2_pud_t::UNIT_TYPE_KHADGAR,
    warcraft_2_pud_t::UNIT_TYPE_GROM_HELLSCREAM,
    warcraft_2_pud_t::UNIT_TYPE_HUMAN_TANKER,
    warcraft_2_pud_t::UNIT_TYPE_ORC_TANKER,
    warcraft_2_pud_t::UNIT_TYPE_HUMAN_TRANSPORT,
    warcraft_2_pud_t::UNIT_TYPE_ORC_TRANSPORT,
    warcraft_2_pud_t::UNIT_TYPE_ELVEN_DESTROYER,
    warcraft_2_pud_t::UNIT_TYPE_TROLL_DESTROYER,
    warcraft_2_pud_t::UNIT_TYPE_BATTLESHIP,
    warcraft_2_pud_t::UNIT_TYPE_JUGGERNAUGHT,
    warcraft_2_pud_t::UNIT_TYPE_DEATHWING,
    warcraft_2_pud_t::UNIT_TYPE_GNOMISH_SUBMARINE,
    warcraft_2_pud_t::UNIT_TYPE_GIANT_TURTLE,
    warcraft_2_pud_t::UNIT_TYPE_GNOMISH_FLYING_MACHINE,
    warcraft_2_pud_t::UNIT_TYPE_GOBLIN_ZEPPLIN,
    warcraft_2_pud_t::UNIT_TYPE_GRYPHON_RIDER,
    warcraft_2_pud_t::UNIT_TYPE_DRAGON,
    warcraft_2_pud_t::UNIT_TYPE_TURALYON,
    warcraft_2_pud_t::UNIT_TYPE_EYE_OF_KILROGG,
    warcraft_2_pud_t::UNIT_TYPE_DANATH,
    warcraft_2_pud_t::UNIT_TYPE_KHORGATH_BLADEFIST,
    warcraft_2_pud_t::UNIT_TYPE_CHO_GALL,
    warcraft_2_pud_t::UNIT_TYPE_LOTHAR,
    warcraft_2_pud_t::UNIT_TYPE_GUL_DAN,
    warcraft_2_pud_t::UNIT_TYPE_UTHER_LIGHTBRINGER,
    warcraft_2_pud_t::UNIT_TYPE_ZULJIN,
    warcraft_2_pud_t::UNIT_TYPE_SKELETON,
    warcraft_2_pud_t::UNIT_TYPE_DAEMON,
    warcraft_2_pud_t::UNIT_TYPE_CRITTER,
    warcraft_2_pud_t::UNIT_TYPE_FARM,
    warcraft_2_pud_t::UNIT_TYPE_PIG_FARM,
    warcraft_2_pud_t::UNIT_TYPE_HUMAN_BARRACKS,
    warcraft_2_pud_t::UNIT_TYPE_ORC_BARRACKS,
    warcraft_2_pud_t::UNIT_TYPE_CHURCH,
    warcraft_2_pud_t::UNIT_TYPE_ALTAR_OF_STORMS,
    warcraft_2_pud_t::UNIT_TYPE_HUMAN_SCOUT_TOWER,
    warcraft_2_pud_t::UNIT_TYPE_ORC_SCOUT_TOWER,
    warcraft_2_pud_t::UNIT_TYPE_STABLES,
    warcraft_2_pud_t::UNIT_TYPE_OGRE_MOUND,
    warcraft_2_pud_t::UNIT_TYPE_GNOMISH_INVENTOR,
    warcraft_2_pud_t::UNIT_TYPE_GOBLIN_ALCHEMIST,
    warcraft_2_pud_t::UNIT_TYPE_GRYPHON_AVIARY,
    warcraft_2_pud_t::UNIT_TYPE_DRAGON_ROOST,
    warcraft_2_pud_t::UNIT_TYPE_HUMAN_SHIPYARD,
    warcraft_2_pud_t::UNIT_TYPE_ORC_SHIPYARD,
    warcraft_2_pud_t::UNIT_TYPE_TOWN_HALL,
    warcraft_2_pud_t::UNIT_TYPE_GREAT_HALL,
    warcraft_2_pud_t::UNIT_TYPE_ELVEN_LUMBER_MILL,
    warcraft_2_pud_t::UNIT_TYPE_TROLL_LUMBER_MILL,
    warcraft_2_pud_t::UNIT_TYPE_HUMAN_FOUNDRY,
    warcraft_2_pud_t::UNIT_TYPE_ORC_FOUNDRY,
    warcraft_2_pud_t::UNIT_TYPE_MAGE_TOWER,
    warcraft_2_pud_t::UNIT_TYPE_TEMPLE_OF_THE_DAMNED,
    warcraft_2_pud_t::UNIT_TYPE_HUMAN_BLACKSMITH,
    warcraft_2_pud_t::UNIT_TYPE_ORC_BLACKSMITH,
    warcraft_2_pud_t::UNIT_TYPE_HUMAN_REFINERY,
    warcraft_2_pud_t::UNIT_TYPE_ORC_REFINERY,
    warcraft_2_pud_t::UNIT_TYPE_HUMAN_OIL_WELL,
    warcraft_2_pud_t::UNIT_TYPE_ORC_OIL_WELL,
    warcraft_2_pud_t::UNIT_TYPE_KEEP,
    warcraft_2_pud_t::UNIT_TYPE_STRONGHOLD,
    warcraft_2_pud_t::UNIT_TYPE_CASTLE,
    warcraft_2_pud_t::UNIT_TYPE_FORTRESS,
    warcraft_2_pud_t::UNIT_TYPE_GOLD_MINE,
    warcraft_2_pud_t::UNIT_TYPE_OIL_PATCH,
    warcraft_2_pud_t::UNIT_TYPE_HUMAN_START,
    warcraft_2_pud_t::UNIT_TYPE_ORC_START,
    warcraft_2_pud_t::UNIT_TYPE_HUMAN_GUARD_TOWER,
    warcraft_2_pud_t::UNIT_TYPE_ORC_GUARD_TOWER,
    warcraft_2_pud_t::UNIT_TYPE_HUMAN_CANNON_TOWER,
    warcraft_2_pud_t::UNIT_TYPE_ORC_CANNON_TOWER,
    warcraft_2_pud_t::UNIT_TYPE_CIRCLE_OF_POWER,
    warcraft_2_pud_t::UNIT_TYPE_DARK_PORTAL,
    warcraft_2_pud_t::UNIT_TYPE_RUNESTONE,
    warcraft_2_pud_t::UNIT_TYPE_HUMAN_WALL,
    warcraft_2_pud_t::UNIT_TYPE_ORC_WALL,
};
bool warcraft_2_pud_t::_is_defined_unit_type_t(warcraft_2_pud_t::unit_type_t v) {
    return warcraft_2_pud_t::_values_unit_type_t.find(v) != warcraft_2_pud_t::_values_unit_type_t.end();
}

warcraft_2_pud_t::warcraft_2_pud_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, warcraft_2_pud_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_sections = nullptr;
    _read();
}

void warcraft_2_pud_t::_read() {
    m_sections = std::unique_ptr<std::vector<std::unique_ptr<section_t>>>(new std::vector<std::unique_ptr<section_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_sections->push_back(std::move(std::unique_ptr<section_t>(new section_t(m__io, this, m__root))));
            i++;
        }
    }
}

warcraft_2_pud_t::~warcraft_2_pud_t() {
    _clean_up();
}

void warcraft_2_pud_t::_clean_up() {
}

warcraft_2_pud_t::section_t::section_t(kaitai::kstream* p__io, warcraft_2_pud_t* p__parent, warcraft_2_pud_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = nullptr;
    _read();
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
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<section_dim_t>(new section_dim_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("ERA ")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<section_era_t>(new section_era_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("ERAX")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<section_era_t>(new section_era_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("OWNR")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<section_ownr_t>(new section_ownr_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("SGLD")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<section_starting_resource_t>(new section_starting_resource_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("SLBR")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<section_starting_resource_t>(new section_starting_resource_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("SOIL")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<section_starting_resource_t>(new section_starting_resource_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("TYPE")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<section_type_t>(new section_type_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("UNIT")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<section_unit_t>(new section_unit_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("VER ")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(size());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<section_ver_t>(new section_ver_t(m__io__raw_body.get(), this, m__root));
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
    }
}

warcraft_2_pud_t::section_dim_t::section_dim_t(kaitai::kstream* p__io, warcraft_2_pud_t::section_t* p__parent, warcraft_2_pud_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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
    _read();
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
    m_controller_by_player = nullptr;
    _read();
}

void warcraft_2_pud_t::section_ownr_t::_read() {
    m_controller_by_player = std::unique_ptr<std::vector<controller_t>>(new std::vector<controller_t>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_controller_by_player->push_back(std::move(static_cast<warcraft_2_pud_t::controller_t>(m__io->read_u1())));
            i++;
        }
    }
}

warcraft_2_pud_t::section_ownr_t::~section_ownr_t() {
    _clean_up();
}

void warcraft_2_pud_t::section_ownr_t::_clean_up() {
}

warcraft_2_pud_t::section_starting_resource_t::section_starting_resource_t(kaitai::kstream* p__io, warcraft_2_pud_t::section_t* p__parent, warcraft_2_pud_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_resources_by_player = nullptr;
    _read();
}

void warcraft_2_pud_t::section_starting_resource_t::_read() {
    m_resources_by_player = std::unique_ptr<std::vector<uint16_t>>(new std::vector<uint16_t>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_resources_by_player->push_back(std::move(m__io->read_u2le()));
            i++;
        }
    }
}

warcraft_2_pud_t::section_starting_resource_t::~section_starting_resource_t() {
    _clean_up();
}

void warcraft_2_pud_t::section_starting_resource_t::_clean_up() {
}

warcraft_2_pud_t::section_type_t::section_type_t(kaitai::kstream* p__io, warcraft_2_pud_t::section_t* p__parent, warcraft_2_pud_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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
    m_units = nullptr;
    _read();
}

void warcraft_2_pud_t::section_unit_t::_read() {
    m_units = std::unique_ptr<std::vector<std::unique_ptr<unit_t>>>(new std::vector<std::unique_ptr<unit_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_units->push_back(std::move(std::unique_ptr<unit_t>(new unit_t(m__io, this, m__root))));
            i++;
        }
    }
}

warcraft_2_pud_t::section_unit_t::~section_unit_t() {
    _clean_up();
}

void warcraft_2_pud_t::section_unit_t::_clean_up() {
}

warcraft_2_pud_t::section_ver_t::section_ver_t(kaitai::kstream* p__io, warcraft_2_pud_t::section_t* p__parent, warcraft_2_pud_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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

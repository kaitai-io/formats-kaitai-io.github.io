#pragma once

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class warcraft_2_pud_t;

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <memory>
#include <set>
#include <vector>

#if KAITAI_STRUCT_VERSION < 11000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.11 or later is required"
#endif

/**
 * Warcraft II game engine uses this format for map files. External
 * maps can be edited by official Warcraft II map editor and saved in
 * .pud files. Maps supplied with the game (i.e. single player
 * campaign) follow the same format, but are instead embedded inside
 * the game container files.
 * 
 * There are two major versions: 0x11 (original one) and 0x13 (roughly
 * corresponds to v1.33 of the game engine, although some of the
 * features got limited support in v1.3).
 * 
 * File consists of a sequence of typed sections.
 * \sa http://cade.datamax.bg/war2x/pudspec.html Source
 */

class warcraft_2_pud_t : public kaitai::kstruct {

public:
    class section_t;
    class section_dim_t;
    class section_era_t;
    class section_ownr_t;
    class section_starting_resource_t;
    class section_type_t;
    class section_unit_t;
    class section_ver_t;
    class unit_t;

    enum controller_t {
        CONTROLLER_COMPUTER1 = 1,
        CONTROLLER_PASSIVE_COMPUTER = 2,
        CONTROLLER_NOBODY = 3,
        CONTROLLER_COMPUTER4 = 4,
        CONTROLLER_HUMAN = 5,
        CONTROLLER_RESCUE_PASSIVE = 6,
        CONTROLLER_RESCUE_ACTIVE = 7
    };
    static bool _is_defined_controller_t(controller_t v);

private:
    static const std::set<controller_t> _values_controller_t;

public:

    enum terrain_type_t {
        TERRAIN_TYPE_FOREST = 0,
        TERRAIN_TYPE_WINTER = 1,
        TERRAIN_TYPE_WASTELAND = 2,
        TERRAIN_TYPE_SWAMP = 3
    };
    static bool _is_defined_terrain_type_t(terrain_type_t v);

private:
    static const std::set<terrain_type_t> _values_terrain_type_t;

public:

    enum unit_type_t {
        UNIT_TYPE_INFANTRY = 0,
        UNIT_TYPE_GRUNT = 1,
        UNIT_TYPE_PEASANT = 2,
        UNIT_TYPE_PEON = 3,
        UNIT_TYPE_BALLISTA = 4,
        UNIT_TYPE_CATAPULT = 5,
        UNIT_TYPE_KNIGHT = 6,
        UNIT_TYPE_OGRE = 7,
        UNIT_TYPE_ARCHER = 8,
        UNIT_TYPE_AXETHROWER = 9,
        UNIT_TYPE_MAGE = 10,
        UNIT_TYPE_DEATH_KNIGHT = 11,
        UNIT_TYPE_PALADIN = 12,
        UNIT_TYPE_OGRE_MAGE = 13,
        UNIT_TYPE_DWARVES = 14,
        UNIT_TYPE_GOBLIN_SAPPER = 15,
        UNIT_TYPE_ATTACK_PEASANT = 16,
        UNIT_TYPE_ATTACK_PEON = 17,
        UNIT_TYPE_RANGER = 18,
        UNIT_TYPE_BERSERKER = 19,
        UNIT_TYPE_ALLERIA = 20,
        UNIT_TYPE_TERON_GOREFIEND = 21,
        UNIT_TYPE_KURDAN_AND_SKY_REE = 22,
        UNIT_TYPE_DENTARG = 23,
        UNIT_TYPE_KHADGAR = 24,
        UNIT_TYPE_GROM_HELLSCREAM = 25,
        UNIT_TYPE_HUMAN_TANKER = 26,
        UNIT_TYPE_ORC_TANKER = 27,
        UNIT_TYPE_HUMAN_TRANSPORT = 28,
        UNIT_TYPE_ORC_TRANSPORT = 29,
        UNIT_TYPE_ELVEN_DESTROYER = 30,
        UNIT_TYPE_TROLL_DESTROYER = 31,
        UNIT_TYPE_BATTLESHIP = 32,
        UNIT_TYPE_JUGGERNAUGHT = 33,
        UNIT_TYPE_DEATHWING = 35,
        UNIT_TYPE_GNOMISH_SUBMARINE = 38,
        UNIT_TYPE_GIANT_TURTLE = 39,
        UNIT_TYPE_GNOMISH_FLYING_MACHINE = 40,
        UNIT_TYPE_GOBLIN_ZEPPLIN = 41,
        UNIT_TYPE_GRYPHON_RIDER = 42,
        UNIT_TYPE_DRAGON = 43,
        UNIT_TYPE_TURALYON = 44,
        UNIT_TYPE_EYE_OF_KILROGG = 45,
        UNIT_TYPE_DANATH = 46,
        UNIT_TYPE_KHORGATH_BLADEFIST = 47,
        UNIT_TYPE_CHO_GALL = 49,
        UNIT_TYPE_LOTHAR = 50,
        UNIT_TYPE_GUL_DAN = 51,
        UNIT_TYPE_UTHER_LIGHTBRINGER = 52,
        UNIT_TYPE_ZULJIN = 53,
        UNIT_TYPE_SKELETON = 55,
        UNIT_TYPE_DAEMON = 56,
        UNIT_TYPE_CRITTER = 57,
        UNIT_TYPE_FARM = 58,
        UNIT_TYPE_PIG_FARM = 59,
        UNIT_TYPE_HUMAN_BARRACKS = 60,
        UNIT_TYPE_ORC_BARRACKS = 61,
        UNIT_TYPE_CHURCH = 62,
        UNIT_TYPE_ALTAR_OF_STORMS = 63,
        UNIT_TYPE_HUMAN_SCOUT_TOWER = 64,
        UNIT_TYPE_ORC_SCOUT_TOWER = 65,
        UNIT_TYPE_STABLES = 66,
        UNIT_TYPE_OGRE_MOUND = 67,
        UNIT_TYPE_GNOMISH_INVENTOR = 68,
        UNIT_TYPE_GOBLIN_ALCHEMIST = 69,
        UNIT_TYPE_GRYPHON_AVIARY = 70,
        UNIT_TYPE_DRAGON_ROOST = 71,
        UNIT_TYPE_HUMAN_SHIPYARD = 72,
        UNIT_TYPE_ORC_SHIPYARD = 73,
        UNIT_TYPE_TOWN_HALL = 74,
        UNIT_TYPE_GREAT_HALL = 75,
        UNIT_TYPE_ELVEN_LUMBER_MILL = 76,
        UNIT_TYPE_TROLL_LUMBER_MILL = 77,
        UNIT_TYPE_HUMAN_FOUNDRY = 78,
        UNIT_TYPE_ORC_FOUNDRY = 79,
        UNIT_TYPE_MAGE_TOWER = 80,
        UNIT_TYPE_TEMPLE_OF_THE_DAMNED = 81,
        UNIT_TYPE_HUMAN_BLACKSMITH = 82,
        UNIT_TYPE_ORC_BLACKSMITH = 83,
        UNIT_TYPE_HUMAN_REFINERY = 84,
        UNIT_TYPE_ORC_REFINERY = 85,
        UNIT_TYPE_HUMAN_OIL_WELL = 86,
        UNIT_TYPE_ORC_OIL_WELL = 87,
        UNIT_TYPE_KEEP = 88,
        UNIT_TYPE_STRONGHOLD = 89,
        UNIT_TYPE_CASTLE = 90,
        UNIT_TYPE_FORTRESS = 91,
        UNIT_TYPE_GOLD_MINE = 92,
        UNIT_TYPE_OIL_PATCH = 93,
        UNIT_TYPE_HUMAN_START = 94,
        UNIT_TYPE_ORC_START = 95,
        UNIT_TYPE_HUMAN_GUARD_TOWER = 96,
        UNIT_TYPE_ORC_GUARD_TOWER = 97,
        UNIT_TYPE_HUMAN_CANNON_TOWER = 98,
        UNIT_TYPE_ORC_CANNON_TOWER = 99,
        UNIT_TYPE_CIRCLE_OF_POWER = 100,
        UNIT_TYPE_DARK_PORTAL = 101,
        UNIT_TYPE_RUNESTONE = 102,
        UNIT_TYPE_HUMAN_WALL = 103,
        UNIT_TYPE_ORC_WALL = 104
    };
    static bool _is_defined_unit_type_t(unit_type_t v);

private:
    static const std::set<unit_type_t> _values_unit_type_t;

public:

    warcraft_2_pud_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = nullptr, warcraft_2_pud_t* p__root = nullptr);

private:
    void _read();
    void _clean_up();

public:
    ~warcraft_2_pud_t();

    class section_t : public kaitai::kstruct {

    public:

        section_t(kaitai::kstream* p__io, warcraft_2_pud_t* p__parent = nullptr, warcraft_2_pud_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~section_t();

    private:
        std::string m_name;
        uint32_t m_size;
        std::unique_ptr<kaitai::kstruct> m_body;
        bool n_body;

    public:
        bool _is_null_body() { body(); return n_body; };

    private:
        warcraft_2_pud_t* m__root;
        warcraft_2_pud_t* m__parent;
        std::string m__raw_body;
        std::unique_ptr<kaitai::kstream> m__io__raw_body;

    public:
        std::string name() const { return m_name; }
        uint32_t size() const { return m_size; }
        kaitai::kstruct* body() const { return m_body.get(); }
        warcraft_2_pud_t* _root() const { return m__root; }
        warcraft_2_pud_t* _parent() const { return m__parent; }
        std::string _raw_body() const { return m__raw_body; }
        kaitai::kstream* _io__raw_body() const { return m__io__raw_body.get(); }
    };

    class section_dim_t : public kaitai::kstruct {

    public:

        section_dim_t(kaitai::kstream* p__io, warcraft_2_pud_t::section_t* p__parent = nullptr, warcraft_2_pud_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~section_dim_t();

    private:
        uint16_t m_x;
        uint16_t m_y;
        warcraft_2_pud_t* m__root;
        warcraft_2_pud_t::section_t* m__parent;

    public:
        uint16_t x() const { return m_x; }
        uint16_t y() const { return m_y; }
        warcraft_2_pud_t* _root() const { return m__root; }
        warcraft_2_pud_t::section_t* _parent() const { return m__parent; }
    };

    /**
     * Section that specifies terrain type for this map.
     */

    class section_era_t : public kaitai::kstruct {

    public:

        section_era_t(kaitai::kstream* p__io, warcraft_2_pud_t::section_t* p__parent = nullptr, warcraft_2_pud_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~section_era_t();

    private:
        terrain_type_t m_terrain;
        warcraft_2_pud_t* m__root;
        warcraft_2_pud_t::section_t* m__parent;

    public:
        terrain_type_t terrain() const { return m_terrain; }
        warcraft_2_pud_t* _root() const { return m__root; }
        warcraft_2_pud_t::section_t* _parent() const { return m__parent; }
    };

    /**
     * Section that specifies who controls each player.
     */

    class section_ownr_t : public kaitai::kstruct {

    public:

        section_ownr_t(kaitai::kstream* p__io, warcraft_2_pud_t::section_t* p__parent = nullptr, warcraft_2_pud_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~section_ownr_t();

    private:
        std::unique_ptr<std::vector<controller_t>> m_controller_by_player;
        warcraft_2_pud_t* m__root;
        warcraft_2_pud_t::section_t* m__parent;

    public:
        std::vector<controller_t>* controller_by_player() const { return m_controller_by_player.get(); }
        warcraft_2_pud_t* _root() const { return m__root; }
        warcraft_2_pud_t::section_t* _parent() const { return m__parent; }
    };

    class section_starting_resource_t : public kaitai::kstruct {

    public:

        section_starting_resource_t(kaitai::kstream* p__io, warcraft_2_pud_t::section_t* p__parent = nullptr, warcraft_2_pud_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~section_starting_resource_t();

    private:
        std::unique_ptr<std::vector<uint16_t>> m_resources_by_player;
        warcraft_2_pud_t* m__root;
        warcraft_2_pud_t::section_t* m__parent;

    public:
        std::vector<uint16_t>* resources_by_player() const { return m_resources_by_player.get(); }
        warcraft_2_pud_t* _root() const { return m__root; }
        warcraft_2_pud_t::section_t* _parent() const { return m__parent; }
    };

    /**
     * Section that confirms that this file is a "map file" by certain
     * magic string and supplies a tag that could be used in
     * multiplayer to check that all player use the same version of the
     * map.
     */

    class section_type_t : public kaitai::kstruct {

    public:

        section_type_t(kaitai::kstream* p__io, warcraft_2_pud_t::section_t* p__parent = nullptr, warcraft_2_pud_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~section_type_t();

    private:
        std::string m_magic;
        std::string m_unused;
        uint32_t m_id_tag;
        warcraft_2_pud_t* m__root;
        warcraft_2_pud_t::section_t* m__parent;

    public:
        std::string magic() const { return m_magic; }

        /**
         * unused (always set to $0a and $ff by editor, but can be anything for the game)
         */
        std::string unused() const { return m_unused; }

        /**
         * id tag (for consistency check in multiplayer)
         */
        uint32_t id_tag() const { return m_id_tag; }
        warcraft_2_pud_t* _root() const { return m__root; }
        warcraft_2_pud_t::section_t* _parent() const { return m__parent; }
    };

    class section_unit_t : public kaitai::kstruct {

    public:

        section_unit_t(kaitai::kstream* p__io, warcraft_2_pud_t::section_t* p__parent = nullptr, warcraft_2_pud_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~section_unit_t();

    private:
        std::unique_ptr<std::vector<std::unique_ptr<unit_t>>> m_units;
        warcraft_2_pud_t* m__root;
        warcraft_2_pud_t::section_t* m__parent;

    public:
        std::vector<std::unique_ptr<unit_t>>* units() const { return m_units.get(); }
        warcraft_2_pud_t* _root() const { return m__root; }
        warcraft_2_pud_t::section_t* _parent() const { return m__parent; }
    };

    /**
     * Section that specifies format version.
     */

    class section_ver_t : public kaitai::kstruct {

    public:

        section_ver_t(kaitai::kstream* p__io, warcraft_2_pud_t::section_t* p__parent = nullptr, warcraft_2_pud_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~section_ver_t();

    private:
        uint16_t m_version;
        warcraft_2_pud_t* m__root;
        warcraft_2_pud_t::section_t* m__parent;

    public:
        uint16_t version() const { return m_version; }
        warcraft_2_pud_t* _root() const { return m__root; }
        warcraft_2_pud_t::section_t* _parent() const { return m__parent; }
    };

    class unit_t : public kaitai::kstruct {

    public:

        unit_t(kaitai::kstream* p__io, warcraft_2_pud_t::section_unit_t* p__parent = nullptr, warcraft_2_pud_t* p__root = nullptr);

    private:
        void _read();
        void _clean_up();

    public:
        ~unit_t();

    private:
        bool f_resource;
        int32_t m_resource;
        bool n_resource;

    public:
        bool _is_null_resource() { resource(); return n_resource; };

    private:

    public:
        int32_t resource();

    private:
        uint16_t m_x;
        uint16_t m_y;
        unit_type_t m_u_type;
        uint8_t m_owner;
        uint16_t m_options;
        warcraft_2_pud_t* m__root;
        warcraft_2_pud_t::section_unit_t* m__parent;

    public:
        uint16_t x() const { return m_x; }
        uint16_t y() const { return m_y; }
        unit_type_t u_type() const { return m_u_type; }
        uint8_t owner() const { return m_owner; }

        /**
         * if gold mine or oil well, contains 2500 * this, otherwise 0 passive 1 active
         */
        uint16_t options() const { return m_options; }
        warcraft_2_pud_t* _root() const { return m__root; }
        warcraft_2_pud_t::section_unit_t* _parent() const { return m__parent; }
    };

private:
    std::unique_ptr<std::vector<std::unique_ptr<section_t>>> m_sections;
    warcraft_2_pud_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<std::unique_ptr<section_t>>* sections() const { return m_sections.get(); }
    warcraft_2_pud_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

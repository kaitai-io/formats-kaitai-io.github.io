<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

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
 */

class Warcraft2Pud extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Warcraft2Pud $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_sections = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_sections[] = new \Warcraft2Pud\Section($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_sections;
    public function sections() { return $this->_m_sections; }
}

namespace \Warcraft2Pud;

class SectionStartingResource extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Warcraft2Pud\Section $_parent = null, \Warcraft2Pud $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_resourcesByPlayer = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_resourcesByPlayer[] = $this->_io->readU2le();
            $i++;
        }
    }
    protected $_m_resourcesByPlayer;
    public function resourcesByPlayer() { return $this->_m_resourcesByPlayer; }
}

/**
 * Section that specifies terrain type for this map.
 */

namespace \Warcraft2Pud;

class SectionEra extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Warcraft2Pud\Section $_parent = null, \Warcraft2Pud $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_terrain = $this->_io->readU2le();
    }
    protected $_m_terrain;
    public function terrain() { return $this->_m_terrain; }
}

/**
 * Section that specifies format version.
 */

namespace \Warcraft2Pud;

class SectionVer extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Warcraft2Pud\Section $_parent = null, \Warcraft2Pud $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_version = $this->_io->readU2le();
    }
    protected $_m_version;
    public function version() { return $this->_m_version; }
}

namespace \Warcraft2Pud;

class SectionDim extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Warcraft2Pud\Section $_parent = null, \Warcraft2Pud $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_x = $this->_io->readU2le();
        $this->_m_y = $this->_io->readU2le();
    }
    protected $_m_x;
    protected $_m_y;
    public function x() { return $this->_m_x; }
    public function y() { return $this->_m_y; }
}

/**
 * Section that confirms that this file is a "map file" by certain
 * magic string and supplies a tag that could be used in
 * multiplayer to check that all player use the same version of the
 * map.
 */

namespace \Warcraft2Pud;

class SectionType extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Warcraft2Pud\Section $_parent = null, \Warcraft2Pud $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\x57\x41\x52\x32\x20\x4D\x41\x50\x00\x00");
        $this->_m_unused = $this->_io->readBytes(2);
        $this->_m_idTag = $this->_io->readU4le();
    }
    protected $_m_magic;
    protected $_m_unused;
    protected $_m_idTag;
    public function magic() { return $this->_m_magic; }

    /**
     * unused (always set to $0a and $ff by editor, but can be anything for the game)
     */
    public function unused() { return $this->_m_unused; }

    /**
     * id tag (for consistency check in multiplayer)
     */
    public function idTag() { return $this->_m_idTag; }
}

namespace \Warcraft2Pud;

class SectionUnit extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Warcraft2Pud\Section $_parent = null, \Warcraft2Pud $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_units = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_units[] = new \Warcraft2Pud\Unit($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_units;
    public function units() { return $this->_m_units; }
}

namespace \Warcraft2Pud;

class Section extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Warcraft2Pud $_parent = null, \Warcraft2Pud $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ASCII");
        $this->_m_size = $this->_io->readU4le();
        switch ($this->name()) {
            case "SLBR":
                $this->_m__raw_body = $this->_io->readBytes($this->size());
                $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \Warcraft2Pud\SectionStartingResource($_io__raw_body, $this, $this->_root);
                break;
            case "ERAX":
                $this->_m__raw_body = $this->_io->readBytes($this->size());
                $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \Warcraft2Pud\SectionEra($_io__raw_body, $this, $this->_root);
                break;
            case "OWNR":
                $this->_m__raw_body = $this->_io->readBytes($this->size());
                $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \Warcraft2Pud\SectionOwnr($_io__raw_body, $this, $this->_root);
                break;
            case "ERA ":
                $this->_m__raw_body = $this->_io->readBytes($this->size());
                $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \Warcraft2Pud\SectionEra($_io__raw_body, $this, $this->_root);
                break;
            case "SGLD":
                $this->_m__raw_body = $this->_io->readBytes($this->size());
                $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \Warcraft2Pud\SectionStartingResource($_io__raw_body, $this, $this->_root);
                break;
            case "VER ":
                $this->_m__raw_body = $this->_io->readBytes($this->size());
                $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \Warcraft2Pud\SectionVer($_io__raw_body, $this, $this->_root);
                break;
            case "SOIL":
                $this->_m__raw_body = $this->_io->readBytes($this->size());
                $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \Warcraft2Pud\SectionStartingResource($_io__raw_body, $this, $this->_root);
                break;
            case "UNIT":
                $this->_m__raw_body = $this->_io->readBytes($this->size());
                $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \Warcraft2Pud\SectionUnit($_io__raw_body, $this, $this->_root);
                break;
            case "DIM ":
                $this->_m__raw_body = $this->_io->readBytes($this->size());
                $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \Warcraft2Pud\SectionDim($_io__raw_body, $this, $this->_root);
                break;
            case "TYPE":
                $this->_m__raw_body = $this->_io->readBytes($this->size());
                $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \Warcraft2Pud\SectionType($_io__raw_body, $this, $this->_root);
                break;
            default:
                $this->_m_body = $this->_io->readBytes($this->size());
                break;
        }
    }
    protected $_m_name;
    protected $_m_size;
    protected $_m_body;
    protected $_m__raw_body;
    public function name() { return $this->_m_name; }
    public function size() { return $this->_m_size; }
    public function body() { return $this->_m_body; }
    public function _raw_body() { return $this->_m__raw_body; }
}

/**
 * Section that specifies who controls each player.
 */

namespace \Warcraft2Pud;

class SectionOwnr extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Warcraft2Pud\Section $_parent = null, \Warcraft2Pud $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_controllerByPlayer = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_controllerByPlayer[] = $this->_io->readU1();
            $i++;
        }
    }
    protected $_m_controllerByPlayer;
    public function controllerByPlayer() { return $this->_m_controllerByPlayer; }
}

namespace \Warcraft2Pud;

class Unit extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Warcraft2Pud\SectionUnit $_parent = null, \Warcraft2Pud $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_x = $this->_io->readU2le();
        $this->_m_y = $this->_io->readU2le();
        $this->_m_uType = $this->_io->readU1();
        $this->_m_owner = $this->_io->readU1();
        $this->_m_options = $this->_io->readU2le();
    }
    protected $_m_resource;
    public function resource() {
        if ($this->_m_resource !== null)
            return $this->_m_resource;
        if ( (($this->uType() == \Warcraft2Pud\UnitType::GOLD_MINE) || ($this->uType() == \Warcraft2Pud\UnitType::HUMAN_OIL_WELL) || ($this->uType() == \Warcraft2Pud\UnitType::ORC_OIL_WELL) || ($this->uType() == \Warcraft2Pud\UnitType::OIL_PATCH)) ) {
            $this->_m_resource = ($this->options() * 2500);
        }
        return $this->_m_resource;
    }
    protected $_m_x;
    protected $_m_y;
    protected $_m_uType;
    protected $_m_owner;
    protected $_m_options;
    public function x() { return $this->_m_x; }
    public function y() { return $this->_m_y; }
    public function uType() { return $this->_m_uType; }
    public function owner() { return $this->_m_owner; }

    /**
     * if gold mine or oil well, contains 2500 * this, otherwise 0 passive 1 active
     */
    public function options() { return $this->_m_options; }
}

namespace \Warcraft2Pud;

class Controller {
    const COMPUTER = 1;
    const PASSIVE_COMPUTER = 2;
    const NOBODY = 3;
    const COMPUTER = 4;
    const HUMAN = 5;
    const RESCUE_PASSIVE = 6;
    const RESCUE_ACTIVE = 7;
}

namespace \Warcraft2Pud;

class TerrainType {
    const FOREST = 0;
    const WINTER = 1;
    const WASTELAND = 2;
    const SWAMP = 3;
}

namespace \Warcraft2Pud;

class UnitType {
    const INFANTRY = 0;
    const GRUNT = 1;
    const PEASANT = 2;
    const PEON = 3;
    const BALLISTA = 4;
    const CATAPULT = 5;
    const KNIGHT = 6;
    const OGRE = 7;
    const ARCHER = 8;
    const AXETHROWER = 9;
    const MAGE = 10;
    const DEATH_KNIGHT = 11;
    const PALADIN = 12;
    const OGRE_MAGE = 13;
    const DWARVES = 14;
    const GOBLIN_SAPPER = 15;
    const ATTACK_PEASANT = 16;
    const ATTACK_PEON = 17;
    const RANGER = 18;
    const BERSERKER = 19;
    const ALLERIA = 20;
    const TERON_GOREFIEND = 21;
    const KURDAN_AND_SKY_REE = 22;
    const DENTARG = 23;
    const KHADGAR = 24;
    const GROM_HELLSCREAM = 25;
    const HUMAN_TANKER = 26;
    const ORC_TANKER = 27;
    const HUMAN_TRANSPORT = 28;
    const ORC_TRANSPORT = 29;
    const ELVEN_DESTROYER = 30;
    const TROLL_DESTROYER = 31;
    const BATTLESHIP = 32;
    const JUGGERNAUGHT = 33;
    const DEATHWING = 35;
    const GNOMISH_SUBMARINE = 38;
    const GIANT_TURTLE = 39;
    const GNOMISH_FLYING_MACHINE = 40;
    const GOBLIN_ZEPPLIN = 41;
    const GRYPHON_RIDER = 42;
    const DRAGON = 43;
    const TURALYON = 44;
    const EYE_OF_KILROGG = 45;
    const DANATH = 46;
    const KHORGATH_BLADEFIST = 47;
    const CHO_GALL = 49;
    const LOTHAR = 50;
    const GUL_DAN = 51;
    const UTHER_LIGHTBRINGER = 52;
    const ZULJIN = 53;
    const SKELETON = 55;
    const DAEMON = 56;
    const CRITTER = 57;
    const FARM = 58;
    const PIG_FARM = 59;
    const HUMAN_BARRACKS = 60;
    const ORC_BARRACKS = 61;
    const CHURCH = 62;
    const ALTAR_OF_STORMS = 63;
    const HUMAN_SCOUT_TOWER = 64;
    const ORC_SCOUT_TOWER = 65;
    const STABLES = 66;
    const OGRE_MOUND = 67;
    const GNOMISH_INVENTOR = 68;
    const GOBLIN_ALCHEMIST = 69;
    const GRYPHON_AVIARY = 70;
    const DRAGON_ROOST = 71;
    const HUMAN_SHIPYARD = 72;
    const ORC_SHIPYARD = 73;
    const TOWN_HALL = 74;
    const GREAT_HALL = 75;
    const ELVEN_LUMBER_MILL = 76;
    const TROLL_LUMBER_MILL = 77;
    const HUMAN_FOUNDRY = 78;
    const ORC_FOUNDRY = 79;
    const MAGE_TOWER = 80;
    const TEMPLE_OF_THE_DAMNED = 81;
    const HUMAN_BLACKSMITH = 82;
    const ORC_BLACKSMITH = 83;
    const HUMAN_REFINERY = 84;
    const ORC_REFINERY = 85;
    const HUMAN_OIL_WELL = 86;
    const ORC_OIL_WELL = 87;
    const KEEP = 88;
    const STRONGHOLD = 89;
    const CASTLE = 90;
    const FORTRESS = 91;
    const GOLD_MINE = 92;
    const OIL_PATCH = 93;
    const HUMAN_START = 94;
    const ORC_START = 95;
    const HUMAN_GUARD_TOWER = 96;
    const ORC_GUARD_TOWER = 97;
    const HUMAN_CANNON_TOWER = 98;
    const ORC_CANNON_TOWER = 99;
    const CIRCLE_OF_POWER = 100;
    const DARK_PORTAL = 101;
    const RUNESTONE = 102;
    const HUMAN_WALL = 103;
    const ORC_WALL = 104;
}

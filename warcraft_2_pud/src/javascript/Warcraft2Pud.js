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
 * @see {@link http://cade.datamax.bg/war2x/pudspec.html|Source}
 */

var Warcraft2Pud = (function() {
  Warcraft2Pud.Controller = Object.freeze({
    COMPUTER: 1,
    PASSIVE_COMPUTER: 2,
    NOBODY: 3,
    COMPUTER: 4,
    HUMAN: 5,
    RESCUE_PASSIVE: 6,
    RESCUE_ACTIVE: 7,

    1: "COMPUTER",
    2: "PASSIVE_COMPUTER",
    3: "NOBODY",
    4: "COMPUTER",
    5: "HUMAN",
    6: "RESCUE_PASSIVE",
    7: "RESCUE_ACTIVE",
  });

  Warcraft2Pud.TerrainType = Object.freeze({
    FOREST: 0,
    WINTER: 1,
    WASTELAND: 2,
    SWAMP: 3,

    0: "FOREST",
    1: "WINTER",
    2: "WASTELAND",
    3: "SWAMP",
  });

  Warcraft2Pud.UnitType = Object.freeze({
    INFANTRY: 0,
    GRUNT: 1,
    PEASANT: 2,
    PEON: 3,
    BALLISTA: 4,
    CATAPULT: 5,
    KNIGHT: 6,
    OGRE: 7,
    ARCHER: 8,
    AXETHROWER: 9,
    MAGE: 10,
    DEATH_KNIGHT: 11,
    PALADIN: 12,
    OGRE_MAGE: 13,
    DWARVES: 14,
    GOBLIN_SAPPER: 15,
    ATTACK_PEASANT: 16,
    ATTACK_PEON: 17,
    RANGER: 18,
    BERSERKER: 19,
    ALLERIA: 20,
    TERON_GOREFIEND: 21,
    KURDAN_AND_SKY_REE: 22,
    DENTARG: 23,
    KHADGAR: 24,
    GROM_HELLSCREAM: 25,
    HUMAN_TANKER: 26,
    ORC_TANKER: 27,
    HUMAN_TRANSPORT: 28,
    ORC_TRANSPORT: 29,
    ELVEN_DESTROYER: 30,
    TROLL_DESTROYER: 31,
    BATTLESHIP: 32,
    JUGGERNAUGHT: 33,
    DEATHWING: 35,
    GNOMISH_SUBMARINE: 38,
    GIANT_TURTLE: 39,
    GNOMISH_FLYING_MACHINE: 40,
    GOBLIN_ZEPPLIN: 41,
    GRYPHON_RIDER: 42,
    DRAGON: 43,
    TURALYON: 44,
    EYE_OF_KILROGG: 45,
    DANATH: 46,
    KHORGATH_BLADEFIST: 47,
    CHO_GALL: 49,
    LOTHAR: 50,
    GUL_DAN: 51,
    UTHER_LIGHTBRINGER: 52,
    ZULJIN: 53,
    SKELETON: 55,
    DAEMON: 56,
    CRITTER: 57,
    FARM: 58,
    PIG_FARM: 59,
    HUMAN_BARRACKS: 60,
    ORC_BARRACKS: 61,
    CHURCH: 62,
    ALTAR_OF_STORMS: 63,
    HUMAN_SCOUT_TOWER: 64,
    ORC_SCOUT_TOWER: 65,
    STABLES: 66,
    OGRE_MOUND: 67,
    GNOMISH_INVENTOR: 68,
    GOBLIN_ALCHEMIST: 69,
    GRYPHON_AVIARY: 70,
    DRAGON_ROOST: 71,
    HUMAN_SHIPYARD: 72,
    ORC_SHIPYARD: 73,
    TOWN_HALL: 74,
    GREAT_HALL: 75,
    ELVEN_LUMBER_MILL: 76,
    TROLL_LUMBER_MILL: 77,
    HUMAN_FOUNDRY: 78,
    ORC_FOUNDRY: 79,
    MAGE_TOWER: 80,
    TEMPLE_OF_THE_DAMNED: 81,
    HUMAN_BLACKSMITH: 82,
    ORC_BLACKSMITH: 83,
    HUMAN_REFINERY: 84,
    ORC_REFINERY: 85,
    HUMAN_OIL_WELL: 86,
    ORC_OIL_WELL: 87,
    KEEP: 88,
    STRONGHOLD: 89,
    CASTLE: 90,
    FORTRESS: 91,
    GOLD_MINE: 92,
    OIL_PATCH: 93,
    HUMAN_START: 94,
    ORC_START: 95,
    HUMAN_GUARD_TOWER: 96,
    ORC_GUARD_TOWER: 97,
    HUMAN_CANNON_TOWER: 98,
    ORC_CANNON_TOWER: 99,
    CIRCLE_OF_POWER: 100,
    DARK_PORTAL: 101,
    RUNESTONE: 102,
    HUMAN_WALL: 103,
    ORC_WALL: 104,

    0: "INFANTRY",
    1: "GRUNT",
    2: "PEASANT",
    3: "PEON",
    4: "BALLISTA",
    5: "CATAPULT",
    6: "KNIGHT",
    7: "OGRE",
    8: "ARCHER",
    9: "AXETHROWER",
    10: "MAGE",
    11: "DEATH_KNIGHT",
    12: "PALADIN",
    13: "OGRE_MAGE",
    14: "DWARVES",
    15: "GOBLIN_SAPPER",
    16: "ATTACK_PEASANT",
    17: "ATTACK_PEON",
    18: "RANGER",
    19: "BERSERKER",
    20: "ALLERIA",
    21: "TERON_GOREFIEND",
    22: "KURDAN_AND_SKY_REE",
    23: "DENTARG",
    24: "KHADGAR",
    25: "GROM_HELLSCREAM",
    26: "HUMAN_TANKER",
    27: "ORC_TANKER",
    28: "HUMAN_TRANSPORT",
    29: "ORC_TRANSPORT",
    30: "ELVEN_DESTROYER",
    31: "TROLL_DESTROYER",
    32: "BATTLESHIP",
    33: "JUGGERNAUGHT",
    35: "DEATHWING",
    38: "GNOMISH_SUBMARINE",
    39: "GIANT_TURTLE",
    40: "GNOMISH_FLYING_MACHINE",
    41: "GOBLIN_ZEPPLIN",
    42: "GRYPHON_RIDER",
    43: "DRAGON",
    44: "TURALYON",
    45: "EYE_OF_KILROGG",
    46: "DANATH",
    47: "KHORGATH_BLADEFIST",
    49: "CHO_GALL",
    50: "LOTHAR",
    51: "GUL_DAN",
    52: "UTHER_LIGHTBRINGER",
    53: "ZULJIN",
    55: "SKELETON",
    56: "DAEMON",
    57: "CRITTER",
    58: "FARM",
    59: "PIG_FARM",
    60: "HUMAN_BARRACKS",
    61: "ORC_BARRACKS",
    62: "CHURCH",
    63: "ALTAR_OF_STORMS",
    64: "HUMAN_SCOUT_TOWER",
    65: "ORC_SCOUT_TOWER",
    66: "STABLES",
    67: "OGRE_MOUND",
    68: "GNOMISH_INVENTOR",
    69: "GOBLIN_ALCHEMIST",
    70: "GRYPHON_AVIARY",
    71: "DRAGON_ROOST",
    72: "HUMAN_SHIPYARD",
    73: "ORC_SHIPYARD",
    74: "TOWN_HALL",
    75: "GREAT_HALL",
    76: "ELVEN_LUMBER_MILL",
    77: "TROLL_LUMBER_MILL",
    78: "HUMAN_FOUNDRY",
    79: "ORC_FOUNDRY",
    80: "MAGE_TOWER",
    81: "TEMPLE_OF_THE_DAMNED",
    82: "HUMAN_BLACKSMITH",
    83: "ORC_BLACKSMITH",
    84: "HUMAN_REFINERY",
    85: "ORC_REFINERY",
    86: "HUMAN_OIL_WELL",
    87: "ORC_OIL_WELL",
    88: "KEEP",
    89: "STRONGHOLD",
    90: "CASTLE",
    91: "FORTRESS",
    92: "GOLD_MINE",
    93: "OIL_PATCH",
    94: "HUMAN_START",
    95: "ORC_START",
    96: "HUMAN_GUARD_TOWER",
    97: "ORC_GUARD_TOWER",
    98: "HUMAN_CANNON_TOWER",
    99: "ORC_CANNON_TOWER",
    100: "CIRCLE_OF_POWER",
    101: "DARK_PORTAL",
    102: "RUNESTONE",
    103: "HUMAN_WALL",
    104: "ORC_WALL",
  });

  function Warcraft2Pud(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Warcraft2Pud.prototype._read = function() {
    this.sections = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.sections.push(new Section(this._io, this, this._root));
      i++;
    }
  }

  var SectionStartingResource = Warcraft2Pud.SectionStartingResource = (function() {
    function SectionStartingResource(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SectionStartingResource.prototype._read = function() {
      this.resourcesByPlayer = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.resourcesByPlayer.push(this._io.readU2le());
        i++;
      }
    }

    return SectionStartingResource;
  })();

  /**
   * Section that specifies terrain type for this map.
   */

  var SectionEra = Warcraft2Pud.SectionEra = (function() {
    function SectionEra(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SectionEra.prototype._read = function() {
      this.terrain = this._io.readU2le();
    }

    return SectionEra;
  })();

  /**
   * Section that specifies format version.
   */

  var SectionVer = Warcraft2Pud.SectionVer = (function() {
    function SectionVer(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SectionVer.prototype._read = function() {
      this.version = this._io.readU2le();
    }

    return SectionVer;
  })();

  var SectionDim = Warcraft2Pud.SectionDim = (function() {
    function SectionDim(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SectionDim.prototype._read = function() {
      this.x = this._io.readU2le();
      this.y = this._io.readU2le();
    }

    return SectionDim;
  })();

  /**
   * Section that confirms that this file is a "map file" by certain
   * magic string and supplies a tag that could be used in
   * multiplayer to check that all player use the same version of the
   * map.
   */

  var SectionType = Warcraft2Pud.SectionType = (function() {
    function SectionType(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SectionType.prototype._read = function() {
      this.magic = this._io.ensureFixedContents([87, 65, 82, 50, 32, 77, 65, 80, 0, 0]);
      this.unused = this._io.readBytes(2);
      this.idTag = this._io.readU4le();
    }

    /**
     * unused (always set to $0a and $ff by editor, but can be anything for the game)
     */

    /**
     * id tag (for consistency check in multiplayer)
     */

    return SectionType;
  })();

  var SectionUnit = Warcraft2Pud.SectionUnit = (function() {
    function SectionUnit(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SectionUnit.prototype._read = function() {
      this.units = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.units.push(new Unit(this._io, this, this._root));
        i++;
      }
    }

    return SectionUnit;
  })();

  var Section = Warcraft2Pud.Section = (function() {
    function Section(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Section.prototype._read = function() {
      this.name = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
      this.size = this._io.readU4le();
      switch (this.name) {
      case "SLBR":
        this._raw_body = this._io.readBytes(this.size);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new SectionStartingResource(_io__raw_body, this, this._root);
        break;
      case "ERAX":
        this._raw_body = this._io.readBytes(this.size);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new SectionEra(_io__raw_body, this, this._root);
        break;
      case "OWNR":
        this._raw_body = this._io.readBytes(this.size);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new SectionOwnr(_io__raw_body, this, this._root);
        break;
      case "ERA ":
        this._raw_body = this._io.readBytes(this.size);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new SectionEra(_io__raw_body, this, this._root);
        break;
      case "SGLD":
        this._raw_body = this._io.readBytes(this.size);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new SectionStartingResource(_io__raw_body, this, this._root);
        break;
      case "VER ":
        this._raw_body = this._io.readBytes(this.size);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new SectionVer(_io__raw_body, this, this._root);
        break;
      case "SOIL":
        this._raw_body = this._io.readBytes(this.size);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new SectionStartingResource(_io__raw_body, this, this._root);
        break;
      case "UNIT":
        this._raw_body = this._io.readBytes(this.size);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new SectionUnit(_io__raw_body, this, this._root);
        break;
      case "DIM ":
        this._raw_body = this._io.readBytes(this.size);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new SectionDim(_io__raw_body, this, this._root);
        break;
      case "TYPE":
        this._raw_body = this._io.readBytes(this.size);
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new SectionType(_io__raw_body, this, this._root);
        break;
      default:
        this.body = this._io.readBytes(this.size);
        break;
      }
    }

    return Section;
  })();

  /**
   * Section that specifies who controls each player.
   */

  var SectionOwnr = Warcraft2Pud.SectionOwnr = (function() {
    function SectionOwnr(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SectionOwnr.prototype._read = function() {
      this.controllerByPlayer = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.controllerByPlayer.push(this._io.readU1());
        i++;
      }
    }

    return SectionOwnr;
  })();

  var Unit = Warcraft2Pud.Unit = (function() {
    function Unit(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Unit.prototype._read = function() {
      this.x = this._io.readU2le();
      this.y = this._io.readU2le();
      this.uType = this._io.readU1();
      this.owner = this._io.readU1();
      this.options = this._io.readU2le();
    }
    Object.defineProperty(Unit.prototype, 'resource', {
      get: function() {
        if (this._m_resource !== undefined)
          return this._m_resource;
        if ( ((this.uType == Warcraft2Pud.UnitType.GOLD_MINE) || (this.uType == Warcraft2Pud.UnitType.HUMAN_OIL_WELL) || (this.uType == Warcraft2Pud.UnitType.ORC_OIL_WELL) || (this.uType == Warcraft2Pud.UnitType.OIL_PATCH)) ) {
          this._m_resource = (this.options * 2500);
        }
        return this._m_resource;
      }
    });

    /**
     * if gold mine or oil well, contains 2500 * this, otherwise 0 passive 1 active
     */

    return Unit;
  })();

  return Warcraft2Pud;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('Warcraft2Pud', [], function() {
    return Warcraft2Pud;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = Warcraft2Pud;
}

-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local str_decode = require("string_decode")
local stringstream = require("string_stream")

-- 
-- Warcraft II game engine uses this format for map files. External
-- maps can be edited by official Warcraft II map editor and saved in
-- .pud files. Maps supplied with the game (i.e. single player
-- campaign) follow the same format, but are instead embedded inside
-- the game container files.
-- 
-- There are two major versions: 0x11 (original one) and 0x13 (roughly
-- corresponds to v1.33 of the game engine, although some of the
-- features got limited support in v1.3).
-- 
-- File consists of a sequence of typed sections.
-- See also: Source (http://cade.datamax.bg/war2x/pudspec.html)
Warcraft2Pud = class.class(KaitaiStruct)

Warcraft2Pud.Controller = enum.Enum {
  computer1 = 1,
  passive_computer = 2,
  nobody = 3,
  computer4 = 4,
  human = 5,
  rescue_passive = 6,
  rescue_active = 7,
}

Warcraft2Pud.TerrainType = enum.Enum {
  forest = 0,
  winter = 1,
  wasteland = 2,
  swamp = 3,
}

Warcraft2Pud.UnitType = enum.Enum {
  infantry = 0,
  grunt = 1,
  peasant = 2,
  peon = 3,
  ballista = 4,
  catapult = 5,
  knight = 6,
  ogre = 7,
  archer = 8,
  axethrower = 9,
  mage = 10,
  death_knight = 11,
  paladin = 12,
  ogre_mage = 13,
  dwarves = 14,
  goblin_sapper = 15,
  attack_peasant = 16,
  attack_peon = 17,
  ranger = 18,
  berserker = 19,
  alleria = 20,
  teron_gorefiend = 21,
  kurdan_and_sky_ree = 22,
  dentarg = 23,
  khadgar = 24,
  grom_hellscream = 25,
  human_tanker = 26,
  orc_tanker = 27,
  human_transport = 28,
  orc_transport = 29,
  elven_destroyer = 30,
  troll_destroyer = 31,
  battleship = 32,
  juggernaught = 33,
  deathwing = 35,
  gnomish_submarine = 38,
  giant_turtle = 39,
  gnomish_flying_machine = 40,
  goblin_zepplin = 41,
  gryphon_rider = 42,
  dragon = 43,
  turalyon = 44,
  eye_of_kilrogg = 45,
  danath = 46,
  khorgath_bladefist = 47,
  cho_gall = 49,
  lothar = 50,
  gul_dan = 51,
  uther_lightbringer = 52,
  zuljin = 53,
  skeleton = 55,
  daemon = 56,
  critter = 57,
  farm = 58,
  pig_farm = 59,
  human_barracks = 60,
  orc_barracks = 61,
  church = 62,
  altar_of_storms = 63,
  human_scout_tower = 64,
  orc_scout_tower = 65,
  stables = 66,
  ogre_mound = 67,
  gnomish_inventor = 68,
  goblin_alchemist = 69,
  gryphon_aviary = 70,
  dragon_roost = 71,
  human_shipyard = 72,
  orc_shipyard = 73,
  town_hall = 74,
  great_hall = 75,
  elven_lumber_mill = 76,
  troll_lumber_mill = 77,
  human_foundry = 78,
  orc_foundry = 79,
  mage_tower = 80,
  temple_of_the_damned = 81,
  human_blacksmith = 82,
  orc_blacksmith = 83,
  human_refinery = 84,
  orc_refinery = 85,
  human_oil_well = 86,
  orc_oil_well = 87,
  keep = 88,
  stronghold = 89,
  castle = 90,
  fortress = 91,
  gold_mine = 92,
  oil_patch = 93,
  human_start = 94,
  orc_start = 95,
  human_guard_tower = 96,
  orc_guard_tower = 97,
  human_cannon_tower = 98,
  orc_cannon_tower = 99,
  circle_of_power = 100,
  dark_portal = 101,
  runestone = 102,
  human_wall = 103,
  orc_wall = 104,
}

function Warcraft2Pud:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Warcraft2Pud:_read()
  self.sections = {}
  local i = 0
  while not self._io:is_eof() do
    self.sections[i + 1] = Warcraft2Pud.Section(self._io, self, self._root)
    i = i + 1
  end
end


Warcraft2Pud.SectionStartingResource = class.class(KaitaiStruct)

function Warcraft2Pud.SectionStartingResource:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Warcraft2Pud.SectionStartingResource:_read()
  self.resources_by_player = {}
  local i = 0
  while not self._io:is_eof() do
    self.resources_by_player[i + 1] = self._io:read_u2le()
    i = i + 1
  end
end


-- 
-- Section that specifies terrain type for this map.
Warcraft2Pud.SectionEra = class.class(KaitaiStruct)

function Warcraft2Pud.SectionEra:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Warcraft2Pud.SectionEra:_read()
  self.terrain = Warcraft2Pud.TerrainType(self._io:read_u2le())
end


-- 
-- Section that specifies format version.
Warcraft2Pud.SectionVer = class.class(KaitaiStruct)

function Warcraft2Pud.SectionVer:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Warcraft2Pud.SectionVer:_read()
  self.version = self._io:read_u2le()
end


Warcraft2Pud.SectionDim = class.class(KaitaiStruct)

function Warcraft2Pud.SectionDim:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Warcraft2Pud.SectionDim:_read()
  self.x = self._io:read_u2le()
  self.y = self._io:read_u2le()
end


-- 
-- Section that confirms that this file is a "map file" by certain
-- magic string and supplies a tag that could be used in
-- multiplayer to check that all player use the same version of the
-- map.
Warcraft2Pud.SectionType = class.class(KaitaiStruct)

function Warcraft2Pud.SectionType:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Warcraft2Pud.SectionType:_read()
  self.magic = self._io:read_bytes(10)
  if not(self.magic == "\087\065\082\050\032\077\065\080\000\000") then
    error("not equal, expected " ..  "\087\065\082\050\032\077\065\080\000\000" .. ", but got " .. self.magic)
  end
  self.unused = self._io:read_bytes(2)
  self.id_tag = self._io:read_u4le()
end

-- 
-- unused (always set to $0a and $ff by editor, but can be anything for the game).
-- 
-- id tag (for consistency check in multiplayer).

Warcraft2Pud.SectionUnit = class.class(KaitaiStruct)

function Warcraft2Pud.SectionUnit:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Warcraft2Pud.SectionUnit:_read()
  self.units = {}
  local i = 0
  while not self._io:is_eof() do
    self.units[i + 1] = Warcraft2Pud.Unit(self._io, self, self._root)
    i = i + 1
  end
end


Warcraft2Pud.Section = class.class(KaitaiStruct)

function Warcraft2Pud.Section:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Warcraft2Pud.Section:_read()
  self.name = str_decode.decode(self._io:read_bytes(4), "ASCII")
  self.size = self._io:read_u4le()
  local _on = self.name
  if _on == "SLBR" then
    self._raw_body = self._io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Warcraft2Pud.SectionStartingResource(_io, self, self._root)
  elseif _on == "ERAX" then
    self._raw_body = self._io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Warcraft2Pud.SectionEra(_io, self, self._root)
  elseif _on == "OWNR" then
    self._raw_body = self._io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Warcraft2Pud.SectionOwnr(_io, self, self._root)
  elseif _on == "ERA " then
    self._raw_body = self._io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Warcraft2Pud.SectionEra(_io, self, self._root)
  elseif _on == "SGLD" then
    self._raw_body = self._io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Warcraft2Pud.SectionStartingResource(_io, self, self._root)
  elseif _on == "VER " then
    self._raw_body = self._io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Warcraft2Pud.SectionVer(_io, self, self._root)
  elseif _on == "SOIL" then
    self._raw_body = self._io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Warcraft2Pud.SectionStartingResource(_io, self, self._root)
  elseif _on == "UNIT" then
    self._raw_body = self._io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Warcraft2Pud.SectionUnit(_io, self, self._root)
  elseif _on == "DIM " then
    self._raw_body = self._io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Warcraft2Pud.SectionDim(_io, self, self._root)
  elseif _on == "TYPE" then
    self._raw_body = self._io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Warcraft2Pud.SectionType(_io, self, self._root)
  else
    self.body = self._io:read_bytes(self.size)
  end
end


-- 
-- Section that specifies who controls each player.
Warcraft2Pud.SectionOwnr = class.class(KaitaiStruct)

function Warcraft2Pud.SectionOwnr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Warcraft2Pud.SectionOwnr:_read()
  self.controller_by_player = {}
  local i = 0
  while not self._io:is_eof() do
    self.controller_by_player[i + 1] = Warcraft2Pud.Controller(self._io:read_u1())
    i = i + 1
  end
end


Warcraft2Pud.Unit = class.class(KaitaiStruct)

function Warcraft2Pud.Unit:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Warcraft2Pud.Unit:_read()
  self.x = self._io:read_u2le()
  self.y = self._io:read_u2le()
  self.u_type = Warcraft2Pud.UnitType(self._io:read_u1())
  self.owner = self._io:read_u1()
  self.options = self._io:read_u2le()
end

Warcraft2Pud.Unit.property.resource = {}
function Warcraft2Pud.Unit.property.resource:get()
  if self._m_resource ~= nil then
    return self._m_resource
  end

  if  ((self.u_type == Warcraft2Pud.UnitType.gold_mine) or (self.u_type == Warcraft2Pud.UnitType.human_oil_well) or (self.u_type == Warcraft2Pud.UnitType.orc_oil_well) or (self.u_type == Warcraft2Pud.UnitType.oil_patch))  then
    self._m_resource = (self.options * 2500)
  end
  return self._m_resource
end

-- 
-- if gold mine or oil well, contains 2500 * this, otherwise 0 passive 1 active.


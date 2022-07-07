import kaitai_struct_nim_runtime
import options

type
  Warcraft2Pud* = ref object of KaitaiStruct
    `sections`*: seq[Warcraft2Pud_Section]
    `parent`*: KaitaiStruct
  Warcraft2Pud_Controller* = enum
    computer1 = 1
    passive_computer = 2
    nobody = 3
    computer4 = 4
    human = 5
    rescue_passive = 6
    rescue_active = 7
  Warcraft2Pud_TerrainType* = enum
    forest = 0
    winter = 1
    wasteland = 2
    swamp = 3
  Warcraft2Pud_UnitType* = enum
    infantry = 0
    grunt = 1
    peasant = 2
    peon = 3
    ballista = 4
    catapult = 5
    knight = 6
    ogre = 7
    archer = 8
    axethrower = 9
    mage = 10
    death_knight = 11
    paladin = 12
    ogre_mage = 13
    dwarves = 14
    goblin_sapper = 15
    attack_peasant = 16
    attack_peon = 17
    ranger = 18
    berserker = 19
    alleria = 20
    teron_gorefiend = 21
    kurdan_and_sky_ree = 22
    dentarg = 23
    khadgar = 24
    grom_hellscream = 25
    human_tanker = 26
    orc_tanker = 27
    human_transport = 28
    orc_transport = 29
    elven_destroyer = 30
    troll_destroyer = 31
    battleship = 32
    juggernaught = 33
    deathwing = 35
    gnomish_submarine = 38
    giant_turtle = 39
    gnomish_flying_machine = 40
    goblin_zepplin = 41
    gryphon_rider = 42
    dragon = 43
    turalyon = 44
    eye_of_kilrogg = 45
    danath = 46
    khorgath_bladefist = 47
    cho_gall = 49
    lothar = 50
    gul_dan = 51
    uther_lightbringer = 52
    zuljin = 53
    skeleton = 55
    daemon = 56
    critter = 57
    farm = 58
    pig_farm = 59
    human_barracks = 60
    orc_barracks = 61
    church = 62
    altar_of_storms = 63
    human_scout_tower = 64
    orc_scout_tower = 65
    stables = 66
    ogre_mound = 67
    gnomish_inventor = 68
    goblin_alchemist = 69
    gryphon_aviary = 70
    dragon_roost = 71
    human_shipyard = 72
    orc_shipyard = 73
    town_hall = 74
    great_hall = 75
    elven_lumber_mill = 76
    troll_lumber_mill = 77
    human_foundry = 78
    orc_foundry = 79
    mage_tower = 80
    temple_of_the_damned = 81
    human_blacksmith = 82
    orc_blacksmith = 83
    human_refinery = 84
    orc_refinery = 85
    human_oil_well = 86
    orc_oil_well = 87
    keep = 88
    stronghold = 89
    castle = 90
    fortress = 91
    gold_mine = 92
    oil_patch = 93
    human_start = 94
    orc_start = 95
    human_guard_tower = 96
    orc_guard_tower = 97
    human_cannon_tower = 98
    orc_cannon_tower = 99
    circle_of_power = 100
    dark_portal = 101
    runestone = 102
    human_wall = 103
    orc_wall = 104
  Warcraft2Pud_SectionStartingResource* = ref object of KaitaiStruct
    `resourcesByPlayer`*: seq[uint16]
    `parent`*: Warcraft2Pud_Section
  Warcraft2Pud_SectionEra* = ref object of KaitaiStruct
    `terrain`*: Warcraft2Pud_TerrainType
    `parent`*: Warcraft2Pud_Section
  Warcraft2Pud_SectionVer* = ref object of KaitaiStruct
    `version`*: uint16
    `parent`*: Warcraft2Pud_Section
  Warcraft2Pud_SectionDim* = ref object of KaitaiStruct
    `x`*: uint16
    `y`*: uint16
    `parent`*: Warcraft2Pud_Section
  Warcraft2Pud_SectionType* = ref object of KaitaiStruct
    `magic`*: seq[byte]
    `unused`*: seq[byte]
    `idTag`*: uint32
    `parent`*: Warcraft2Pud_Section
  Warcraft2Pud_SectionUnit* = ref object of KaitaiStruct
    `units`*: seq[Warcraft2Pud_Unit]
    `parent`*: Warcraft2Pud_Section
  Warcraft2Pud_Section* = ref object of KaitaiStruct
    `name`*: string
    `size`*: uint32
    `body`*: KaitaiStruct
    `parent`*: Warcraft2Pud
    `rawBody`*: seq[byte]
  Warcraft2Pud_SectionOwnr* = ref object of KaitaiStruct
    `controllerByPlayer`*: seq[Warcraft2Pud_Controller]
    `parent`*: Warcraft2Pud_Section
  Warcraft2Pud_Unit* = ref object of KaitaiStruct
    `x`*: uint16
    `y`*: uint16
    `uType`*: Warcraft2Pud_UnitType
    `owner`*: uint8
    `options`*: uint16
    `parent`*: Warcraft2Pud_SectionUnit
    `resourceInst`*: int

proc read*(_: typedesc[Warcraft2Pud], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Warcraft2Pud
proc read*(_: typedesc[Warcraft2Pud_SectionStartingResource], io: KaitaiStream, root: KaitaiStruct, parent: Warcraft2Pud_Section): Warcraft2Pud_SectionStartingResource
proc read*(_: typedesc[Warcraft2Pud_SectionEra], io: KaitaiStream, root: KaitaiStruct, parent: Warcraft2Pud_Section): Warcraft2Pud_SectionEra
proc read*(_: typedesc[Warcraft2Pud_SectionVer], io: KaitaiStream, root: KaitaiStruct, parent: Warcraft2Pud_Section): Warcraft2Pud_SectionVer
proc read*(_: typedesc[Warcraft2Pud_SectionDim], io: KaitaiStream, root: KaitaiStruct, parent: Warcraft2Pud_Section): Warcraft2Pud_SectionDim
proc read*(_: typedesc[Warcraft2Pud_SectionType], io: KaitaiStream, root: KaitaiStruct, parent: Warcraft2Pud_Section): Warcraft2Pud_SectionType
proc read*(_: typedesc[Warcraft2Pud_SectionUnit], io: KaitaiStream, root: KaitaiStruct, parent: Warcraft2Pud_Section): Warcraft2Pud_SectionUnit
proc read*(_: typedesc[Warcraft2Pud_Section], io: KaitaiStream, root: KaitaiStruct, parent: Warcraft2Pud): Warcraft2Pud_Section
proc read*(_: typedesc[Warcraft2Pud_SectionOwnr], io: KaitaiStream, root: KaitaiStruct, parent: Warcraft2Pud_Section): Warcraft2Pud_SectionOwnr
proc read*(_: typedesc[Warcraft2Pud_Unit], io: KaitaiStream, root: KaitaiStruct, parent: Warcraft2Pud_SectionUnit): Warcraft2Pud_Unit

proc resource*(this: Warcraft2Pud_Unit): int


##[
Warcraft II game engine uses this format for map files. External
maps can be edited by official Warcraft II map editor and saved in
.pud files. Maps supplied with the game (i.e. single player
campaign) follow the same format, but are instead embedded inside
the game container files.

There are two major versions: 0x11 (original one) and 0x13 (roughly
corresponds to v1.33 of the game engine, although some of the
features got limited support in v1.3).

File consists of a sequence of typed sections.

@see <a href="http://cade.datamax.bg/war2x/pudspec.html">Source</a>
]##
proc read*(_: typedesc[Warcraft2Pud], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): Warcraft2Pud =
  template this: untyped = result
  this = new(Warcraft2Pud)
  let root = if root == nil: cast[Warcraft2Pud](this) else: cast[Warcraft2Pud](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Warcraft2Pud_Section.read(this.io, this.root, this)
      this.sections.add(it)
      inc i

proc fromFile*(_: typedesc[Warcraft2Pud], filename: string): Warcraft2Pud =
  Warcraft2Pud.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Warcraft2Pud_SectionStartingResource], io: KaitaiStream, root: KaitaiStruct, parent: Warcraft2Pud_Section): Warcraft2Pud_SectionStartingResource =
  template this: untyped = result
  this = new(Warcraft2Pud_SectionStartingResource)
  let root = if root == nil: cast[Warcraft2Pud](this) else: cast[Warcraft2Pud](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = this.io.readU2le()
      this.resourcesByPlayer.add(it)
      inc i

proc fromFile*(_: typedesc[Warcraft2Pud_SectionStartingResource], filename: string): Warcraft2Pud_SectionStartingResource =
  Warcraft2Pud_SectionStartingResource.read(newKaitaiFileStream(filename), nil, nil)


##[
Section that specifies terrain type for this map.
]##
proc read*(_: typedesc[Warcraft2Pud_SectionEra], io: KaitaiStream, root: KaitaiStruct, parent: Warcraft2Pud_Section): Warcraft2Pud_SectionEra =
  template this: untyped = result
  this = new(Warcraft2Pud_SectionEra)
  let root = if root == nil: cast[Warcraft2Pud](this) else: cast[Warcraft2Pud](root)
  this.io = io
  this.root = root
  this.parent = parent

  let terrainExpr = Warcraft2Pud_TerrainType(this.io.readU2le())
  this.terrain = terrainExpr

proc fromFile*(_: typedesc[Warcraft2Pud_SectionEra], filename: string): Warcraft2Pud_SectionEra =
  Warcraft2Pud_SectionEra.read(newKaitaiFileStream(filename), nil, nil)


##[
Section that specifies format version.
]##
proc read*(_: typedesc[Warcraft2Pud_SectionVer], io: KaitaiStream, root: KaitaiStruct, parent: Warcraft2Pud_Section): Warcraft2Pud_SectionVer =
  template this: untyped = result
  this = new(Warcraft2Pud_SectionVer)
  let root = if root == nil: cast[Warcraft2Pud](this) else: cast[Warcraft2Pud](root)
  this.io = io
  this.root = root
  this.parent = parent

  let versionExpr = this.io.readU2le()
  this.version = versionExpr

proc fromFile*(_: typedesc[Warcraft2Pud_SectionVer], filename: string): Warcraft2Pud_SectionVer =
  Warcraft2Pud_SectionVer.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Warcraft2Pud_SectionDim], io: KaitaiStream, root: KaitaiStruct, parent: Warcraft2Pud_Section): Warcraft2Pud_SectionDim =
  template this: untyped = result
  this = new(Warcraft2Pud_SectionDim)
  let root = if root == nil: cast[Warcraft2Pud](this) else: cast[Warcraft2Pud](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xExpr = this.io.readU2le()
  this.x = xExpr
  let yExpr = this.io.readU2le()
  this.y = yExpr

proc fromFile*(_: typedesc[Warcraft2Pud_SectionDim], filename: string): Warcraft2Pud_SectionDim =
  Warcraft2Pud_SectionDim.read(newKaitaiFileStream(filename), nil, nil)


##[
Section that confirms that this file is a "map file" by certain
magic string and supplies a tag that could be used in
multiplayer to check that all player use the same version of the
map.

]##
proc read*(_: typedesc[Warcraft2Pud_SectionType], io: KaitaiStream, root: KaitaiStruct, parent: Warcraft2Pud_Section): Warcraft2Pud_SectionType =
  template this: untyped = result
  this = new(Warcraft2Pud_SectionType)
  let root = if root == nil: cast[Warcraft2Pud](this) else: cast[Warcraft2Pud](root)
  this.io = io
  this.root = root
  this.parent = parent

  let magicExpr = this.io.readBytes(int(10))
  this.magic = magicExpr

  ##[
  unused (always set to $0a and $ff by editor, but can be anything for the game)
  ]##
  let unusedExpr = this.io.readBytes(int(2))
  this.unused = unusedExpr

  ##[
  id tag (for consistency check in multiplayer)
  ]##
  let idTagExpr = this.io.readU4le()
  this.idTag = idTagExpr

proc fromFile*(_: typedesc[Warcraft2Pud_SectionType], filename: string): Warcraft2Pud_SectionType =
  Warcraft2Pud_SectionType.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Warcraft2Pud_SectionUnit], io: KaitaiStream, root: KaitaiStruct, parent: Warcraft2Pud_Section): Warcraft2Pud_SectionUnit =
  template this: untyped = result
  this = new(Warcraft2Pud_SectionUnit)
  let root = if root == nil: cast[Warcraft2Pud](this) else: cast[Warcraft2Pud](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Warcraft2Pud_Unit.read(this.io, this.root, this)
      this.units.add(it)
      inc i

proc fromFile*(_: typedesc[Warcraft2Pud_SectionUnit], filename: string): Warcraft2Pud_SectionUnit =
  Warcraft2Pud_SectionUnit.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Warcraft2Pud_Section], io: KaitaiStream, root: KaitaiStruct, parent: Warcraft2Pud): Warcraft2Pud_Section =
  template this: untyped = result
  this = new(Warcraft2Pud_Section)
  let root = if root == nil: cast[Warcraft2Pud](this) else: cast[Warcraft2Pud](root)
  this.io = io
  this.root = root
  this.parent = parent

  let nameExpr = encode(this.io.readBytes(int(4)), "ASCII")
  this.name = nameExpr
  let sizeExpr = this.io.readU4le()
  this.size = sizeExpr
  block:
    let on = this.name
    if on == "SLBR":
      let rawBodyExpr = this.io.readBytes(int(this.size))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Warcraft2Pud_SectionStartingResource.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == "ERAX":
      let rawBodyExpr = this.io.readBytes(int(this.size))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Warcraft2Pud_SectionEra.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == "OWNR":
      let rawBodyExpr = this.io.readBytes(int(this.size))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Warcraft2Pud_SectionOwnr.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == "ERA ":
      let rawBodyExpr = this.io.readBytes(int(this.size))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Warcraft2Pud_SectionEra.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == "SGLD":
      let rawBodyExpr = this.io.readBytes(int(this.size))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Warcraft2Pud_SectionStartingResource.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == "VER ":
      let rawBodyExpr = this.io.readBytes(int(this.size))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Warcraft2Pud_SectionVer.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == "SOIL":
      let rawBodyExpr = this.io.readBytes(int(this.size))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Warcraft2Pud_SectionStartingResource.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == "UNIT":
      let rawBodyExpr = this.io.readBytes(int(this.size))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Warcraft2Pud_SectionUnit.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == "DIM ":
      let rawBodyExpr = this.io.readBytes(int(this.size))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Warcraft2Pud_SectionDim.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == "TYPE":
      let rawBodyExpr = this.io.readBytes(int(this.size))
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Warcraft2Pud_SectionType.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    else:
      let bodyExpr = this.io.readBytes(int(this.size))
      this.body = bodyExpr

proc fromFile*(_: typedesc[Warcraft2Pud_Section], filename: string): Warcraft2Pud_Section =
  Warcraft2Pud_Section.read(newKaitaiFileStream(filename), nil, nil)


##[
Section that specifies who controls each player.
]##
proc read*(_: typedesc[Warcraft2Pud_SectionOwnr], io: KaitaiStream, root: KaitaiStruct, parent: Warcraft2Pud_Section): Warcraft2Pud_SectionOwnr =
  template this: untyped = result
  this = new(Warcraft2Pud_SectionOwnr)
  let root = if root == nil: cast[Warcraft2Pud](this) else: cast[Warcraft2Pud](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = Warcraft2Pud_Controller(this.io.readU1())
      this.controllerByPlayer.add(it)
      inc i

proc fromFile*(_: typedesc[Warcraft2Pud_SectionOwnr], filename: string): Warcraft2Pud_SectionOwnr =
  Warcraft2Pud_SectionOwnr.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[Warcraft2Pud_Unit], io: KaitaiStream, root: KaitaiStruct, parent: Warcraft2Pud_SectionUnit): Warcraft2Pud_Unit =
  template this: untyped = result
  this = new(Warcraft2Pud_Unit)
  let root = if root == nil: cast[Warcraft2Pud](this) else: cast[Warcraft2Pud](root)
  this.io = io
  this.root = root
  this.parent = parent

  let xExpr = this.io.readU2le()
  this.x = xExpr
  let yExpr = this.io.readU2le()
  this.y = yExpr
  let uTypeExpr = Warcraft2Pud_UnitType(this.io.readU1())
  this.uType = uTypeExpr
  let ownerExpr = this.io.readU1()
  this.owner = ownerExpr

  ##[
  if gold mine or oil well, contains 2500 * this, otherwise 0 passive 1 active
  ]##
  let optionsExpr = this.io.readU2le()
  this.options = optionsExpr

proc resource(this: Warcraft2Pud_Unit): int = 
  if this.resourceInst != nil:
    return this.resourceInst
  if  ((this.uType == warcraft_2_pud.gold_mine) or (this.uType == warcraft_2_pud.human_oil_well) or (this.uType == warcraft_2_pud.orc_oil_well) or (this.uType == warcraft_2_pud.oil_patch)) :
    let resourceInstExpr = int((this.options * 2500))
    this.resourceInst = resourceInstExpr
  if this.resourceInst != nil:
    return this.resourceInst

proc fromFile*(_: typedesc[Warcraft2Pud_Unit], filename: string): Warcraft2Pud_Unit =
  Warcraft2Pud_Unit.read(newKaitaiFileStream(filename), nil, nil)


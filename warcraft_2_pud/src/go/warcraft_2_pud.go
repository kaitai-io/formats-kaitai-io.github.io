// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


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
 * @see <a href="http://cade.datamax.bg/war2x/pudspec.html">Source</a>
 */

type Warcraft2Pud_Controller int
const (
	Warcraft2Pud_Controller__Computer1 Warcraft2Pud_Controller = 1
	Warcraft2Pud_Controller__PassiveComputer Warcraft2Pud_Controller = 2
	Warcraft2Pud_Controller__Nobody Warcraft2Pud_Controller = 3
	Warcraft2Pud_Controller__Computer4 Warcraft2Pud_Controller = 4
	Warcraft2Pud_Controller__Human Warcraft2Pud_Controller = 5
	Warcraft2Pud_Controller__RescuePassive Warcraft2Pud_Controller = 6
	Warcraft2Pud_Controller__RescueActive Warcraft2Pud_Controller = 7
)

type Warcraft2Pud_TerrainType int
const (
	Warcraft2Pud_TerrainType__Forest Warcraft2Pud_TerrainType = 0
	Warcraft2Pud_TerrainType__Winter Warcraft2Pud_TerrainType = 1
	Warcraft2Pud_TerrainType__Wasteland Warcraft2Pud_TerrainType = 2
	Warcraft2Pud_TerrainType__Swamp Warcraft2Pud_TerrainType = 3
)

type Warcraft2Pud_UnitType int
const (
	Warcraft2Pud_UnitType__Infantry Warcraft2Pud_UnitType = 0
	Warcraft2Pud_UnitType__Grunt Warcraft2Pud_UnitType = 1
	Warcraft2Pud_UnitType__Peasant Warcraft2Pud_UnitType = 2
	Warcraft2Pud_UnitType__Peon Warcraft2Pud_UnitType = 3
	Warcraft2Pud_UnitType__Ballista Warcraft2Pud_UnitType = 4
	Warcraft2Pud_UnitType__Catapult Warcraft2Pud_UnitType = 5
	Warcraft2Pud_UnitType__Knight Warcraft2Pud_UnitType = 6
	Warcraft2Pud_UnitType__Ogre Warcraft2Pud_UnitType = 7
	Warcraft2Pud_UnitType__Archer Warcraft2Pud_UnitType = 8
	Warcraft2Pud_UnitType__Axethrower Warcraft2Pud_UnitType = 9
	Warcraft2Pud_UnitType__Mage Warcraft2Pud_UnitType = 10
	Warcraft2Pud_UnitType__DeathKnight Warcraft2Pud_UnitType = 11
	Warcraft2Pud_UnitType__Paladin Warcraft2Pud_UnitType = 12
	Warcraft2Pud_UnitType__OgreMage Warcraft2Pud_UnitType = 13
	Warcraft2Pud_UnitType__Dwarves Warcraft2Pud_UnitType = 14
	Warcraft2Pud_UnitType__GoblinSapper Warcraft2Pud_UnitType = 15
	Warcraft2Pud_UnitType__AttackPeasant Warcraft2Pud_UnitType = 16
	Warcraft2Pud_UnitType__AttackPeon Warcraft2Pud_UnitType = 17
	Warcraft2Pud_UnitType__Ranger Warcraft2Pud_UnitType = 18
	Warcraft2Pud_UnitType__Berserker Warcraft2Pud_UnitType = 19
	Warcraft2Pud_UnitType__Alleria Warcraft2Pud_UnitType = 20
	Warcraft2Pud_UnitType__TeronGorefiend Warcraft2Pud_UnitType = 21
	Warcraft2Pud_UnitType__KurdanAndSkyRee Warcraft2Pud_UnitType = 22
	Warcraft2Pud_UnitType__Dentarg Warcraft2Pud_UnitType = 23
	Warcraft2Pud_UnitType__Khadgar Warcraft2Pud_UnitType = 24
	Warcraft2Pud_UnitType__GromHellscream Warcraft2Pud_UnitType = 25
	Warcraft2Pud_UnitType__HumanTanker Warcraft2Pud_UnitType = 26
	Warcraft2Pud_UnitType__OrcTanker Warcraft2Pud_UnitType = 27
	Warcraft2Pud_UnitType__HumanTransport Warcraft2Pud_UnitType = 28
	Warcraft2Pud_UnitType__OrcTransport Warcraft2Pud_UnitType = 29
	Warcraft2Pud_UnitType__ElvenDestroyer Warcraft2Pud_UnitType = 30
	Warcraft2Pud_UnitType__TrollDestroyer Warcraft2Pud_UnitType = 31
	Warcraft2Pud_UnitType__Battleship Warcraft2Pud_UnitType = 32
	Warcraft2Pud_UnitType__Juggernaught Warcraft2Pud_UnitType = 33
	Warcraft2Pud_UnitType__Deathwing Warcraft2Pud_UnitType = 35
	Warcraft2Pud_UnitType__GnomishSubmarine Warcraft2Pud_UnitType = 38
	Warcraft2Pud_UnitType__GiantTurtle Warcraft2Pud_UnitType = 39
	Warcraft2Pud_UnitType__GnomishFlyingMachine Warcraft2Pud_UnitType = 40
	Warcraft2Pud_UnitType__GoblinZepplin Warcraft2Pud_UnitType = 41
	Warcraft2Pud_UnitType__GryphonRider Warcraft2Pud_UnitType = 42
	Warcraft2Pud_UnitType__Dragon Warcraft2Pud_UnitType = 43
	Warcraft2Pud_UnitType__Turalyon Warcraft2Pud_UnitType = 44
	Warcraft2Pud_UnitType__EyeOfKilrogg Warcraft2Pud_UnitType = 45
	Warcraft2Pud_UnitType__Danath Warcraft2Pud_UnitType = 46
	Warcraft2Pud_UnitType__KhorgathBladefist Warcraft2Pud_UnitType = 47
	Warcraft2Pud_UnitType__ChoGall Warcraft2Pud_UnitType = 49
	Warcraft2Pud_UnitType__Lothar Warcraft2Pud_UnitType = 50
	Warcraft2Pud_UnitType__GulDan Warcraft2Pud_UnitType = 51
	Warcraft2Pud_UnitType__UtherLightbringer Warcraft2Pud_UnitType = 52
	Warcraft2Pud_UnitType__Zuljin Warcraft2Pud_UnitType = 53
	Warcraft2Pud_UnitType__Skeleton Warcraft2Pud_UnitType = 55
	Warcraft2Pud_UnitType__Daemon Warcraft2Pud_UnitType = 56
	Warcraft2Pud_UnitType__Critter Warcraft2Pud_UnitType = 57
	Warcraft2Pud_UnitType__Farm Warcraft2Pud_UnitType = 58
	Warcraft2Pud_UnitType__PigFarm Warcraft2Pud_UnitType = 59
	Warcraft2Pud_UnitType__HumanBarracks Warcraft2Pud_UnitType = 60
	Warcraft2Pud_UnitType__OrcBarracks Warcraft2Pud_UnitType = 61
	Warcraft2Pud_UnitType__Church Warcraft2Pud_UnitType = 62
	Warcraft2Pud_UnitType__AltarOfStorms Warcraft2Pud_UnitType = 63
	Warcraft2Pud_UnitType__HumanScoutTower Warcraft2Pud_UnitType = 64
	Warcraft2Pud_UnitType__OrcScoutTower Warcraft2Pud_UnitType = 65
	Warcraft2Pud_UnitType__Stables Warcraft2Pud_UnitType = 66
	Warcraft2Pud_UnitType__OgreMound Warcraft2Pud_UnitType = 67
	Warcraft2Pud_UnitType__GnomishInventor Warcraft2Pud_UnitType = 68
	Warcraft2Pud_UnitType__GoblinAlchemist Warcraft2Pud_UnitType = 69
	Warcraft2Pud_UnitType__GryphonAviary Warcraft2Pud_UnitType = 70
	Warcraft2Pud_UnitType__DragonRoost Warcraft2Pud_UnitType = 71
	Warcraft2Pud_UnitType__HumanShipyard Warcraft2Pud_UnitType = 72
	Warcraft2Pud_UnitType__OrcShipyard Warcraft2Pud_UnitType = 73
	Warcraft2Pud_UnitType__TownHall Warcraft2Pud_UnitType = 74
	Warcraft2Pud_UnitType__GreatHall Warcraft2Pud_UnitType = 75
	Warcraft2Pud_UnitType__ElvenLumberMill Warcraft2Pud_UnitType = 76
	Warcraft2Pud_UnitType__TrollLumberMill Warcraft2Pud_UnitType = 77
	Warcraft2Pud_UnitType__HumanFoundry Warcraft2Pud_UnitType = 78
	Warcraft2Pud_UnitType__OrcFoundry Warcraft2Pud_UnitType = 79
	Warcraft2Pud_UnitType__MageTower Warcraft2Pud_UnitType = 80
	Warcraft2Pud_UnitType__TempleOfTheDamned Warcraft2Pud_UnitType = 81
	Warcraft2Pud_UnitType__HumanBlacksmith Warcraft2Pud_UnitType = 82
	Warcraft2Pud_UnitType__OrcBlacksmith Warcraft2Pud_UnitType = 83
	Warcraft2Pud_UnitType__HumanRefinery Warcraft2Pud_UnitType = 84
	Warcraft2Pud_UnitType__OrcRefinery Warcraft2Pud_UnitType = 85
	Warcraft2Pud_UnitType__HumanOilWell Warcraft2Pud_UnitType = 86
	Warcraft2Pud_UnitType__OrcOilWell Warcraft2Pud_UnitType = 87
	Warcraft2Pud_UnitType__Keep Warcraft2Pud_UnitType = 88
	Warcraft2Pud_UnitType__Stronghold Warcraft2Pud_UnitType = 89
	Warcraft2Pud_UnitType__Castle Warcraft2Pud_UnitType = 90
	Warcraft2Pud_UnitType__Fortress Warcraft2Pud_UnitType = 91
	Warcraft2Pud_UnitType__GoldMine Warcraft2Pud_UnitType = 92
	Warcraft2Pud_UnitType__OilPatch Warcraft2Pud_UnitType = 93
	Warcraft2Pud_UnitType__HumanStart Warcraft2Pud_UnitType = 94
	Warcraft2Pud_UnitType__OrcStart Warcraft2Pud_UnitType = 95
	Warcraft2Pud_UnitType__HumanGuardTower Warcraft2Pud_UnitType = 96
	Warcraft2Pud_UnitType__OrcGuardTower Warcraft2Pud_UnitType = 97
	Warcraft2Pud_UnitType__HumanCannonTower Warcraft2Pud_UnitType = 98
	Warcraft2Pud_UnitType__OrcCannonTower Warcraft2Pud_UnitType = 99
	Warcraft2Pud_UnitType__CircleOfPower Warcraft2Pud_UnitType = 100
	Warcraft2Pud_UnitType__DarkPortal Warcraft2Pud_UnitType = 101
	Warcraft2Pud_UnitType__Runestone Warcraft2Pud_UnitType = 102
	Warcraft2Pud_UnitType__HumanWall Warcraft2Pud_UnitType = 103
	Warcraft2Pud_UnitType__OrcWall Warcraft2Pud_UnitType = 104
)
type Warcraft2Pud struct {
	Sections []*Warcraft2Pud_Section
	_io *kaitai.Stream
	_root *Warcraft2Pud
	_parent interface{}
}
func NewWarcraft2Pud() *Warcraft2Pud {
	return &Warcraft2Pud{
	}
}

func (this *Warcraft2Pud) Read(io *kaitai.Stream, parent interface{}, root *Warcraft2Pud) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp1, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp1 {
			break
		}
		tmp2 := NewWarcraft2Pud_Section()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Sections = append(this.Sections, tmp2)
	}
	return err
}
type Warcraft2Pud_SectionStartingResource struct {
	ResourcesByPlayer []uint16
	_io *kaitai.Stream
	_root *Warcraft2Pud
	_parent *Warcraft2Pud_Section
}
func NewWarcraft2Pud_SectionStartingResource() *Warcraft2Pud_SectionStartingResource {
	return &Warcraft2Pud_SectionStartingResource{
	}
}

func (this *Warcraft2Pud_SectionStartingResource) Read(io *kaitai.Stream, parent *Warcraft2Pud_Section, root *Warcraft2Pud) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp3, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp3 {
			break
		}
		tmp4, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.ResourcesByPlayer = append(this.ResourcesByPlayer, tmp4)
	}
	return err
}

/**
 * Section that specifies terrain type for this map.
 */
type Warcraft2Pud_SectionEra struct {
	Terrain Warcraft2Pud_TerrainType
	_io *kaitai.Stream
	_root *Warcraft2Pud
	_parent *Warcraft2Pud_Section
}
func NewWarcraft2Pud_SectionEra() *Warcraft2Pud_SectionEra {
	return &Warcraft2Pud_SectionEra{
	}
}

func (this *Warcraft2Pud_SectionEra) Read(io *kaitai.Stream, parent *Warcraft2Pud_Section, root *Warcraft2Pud) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp5, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Terrain = Warcraft2Pud_TerrainType(tmp5)
	return err
}

/**
 * Section that specifies format version.
 */
type Warcraft2Pud_SectionVer struct {
	Version uint16
	_io *kaitai.Stream
	_root *Warcraft2Pud
	_parent *Warcraft2Pud_Section
}
func NewWarcraft2Pud_SectionVer() *Warcraft2Pud_SectionVer {
	return &Warcraft2Pud_SectionVer{
	}
}

func (this *Warcraft2Pud_SectionVer) Read(io *kaitai.Stream, parent *Warcraft2Pud_Section, root *Warcraft2Pud) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Version = uint16(tmp6)
	return err
}
type Warcraft2Pud_SectionDim struct {
	X uint16
	Y uint16
	_io *kaitai.Stream
	_root *Warcraft2Pud
	_parent *Warcraft2Pud_Section
}
func NewWarcraft2Pud_SectionDim() *Warcraft2Pud_SectionDim {
	return &Warcraft2Pud_SectionDim{
	}
}

func (this *Warcraft2Pud_SectionDim) Read(io *kaitai.Stream, parent *Warcraft2Pud_Section, root *Warcraft2Pud) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp7, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.X = uint16(tmp7)
	tmp8, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Y = uint16(tmp8)
	return err
}

/**
 * Section that confirms that this file is a "map file" by certain
 * magic string and supplies a tag that could be used in
 * multiplayer to check that all player use the same version of the
 * map.
 */
type Warcraft2Pud_SectionType struct {
	Magic []byte
	Unused []byte
	IdTag uint32
	_io *kaitai.Stream
	_root *Warcraft2Pud
	_parent *Warcraft2Pud_Section
}
func NewWarcraft2Pud_SectionType() *Warcraft2Pud_SectionType {
	return &Warcraft2Pud_SectionType{
	}
}

func (this *Warcraft2Pud_SectionType) Read(io *kaitai.Stream, parent *Warcraft2Pud_Section, root *Warcraft2Pud) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp9, err := this._io.ReadBytes(int(10))
	if err != nil {
		return err
	}
	tmp9 = tmp9
	this.Magic = tmp9
	if !(bytes.Equal(this.Magic, []uint8{87, 65, 82, 50, 32, 77, 65, 80, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{87, 65, 82, 50, 32, 77, 65, 80, 0, 0}, this.Magic, this._io, "/types/section_type/seq/0")
	}
	tmp10, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp10 = tmp10
	this.Unused = tmp10
	tmp11, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.IdTag = uint32(tmp11)
	return err
}

/**
 * unused (always set to $0a and $ff by editor, but can be anything for the game)
 */

/**
 * id tag (for consistency check in multiplayer)
 */
type Warcraft2Pud_SectionUnit struct {
	Units []*Warcraft2Pud_Unit
	_io *kaitai.Stream
	_root *Warcraft2Pud
	_parent *Warcraft2Pud_Section
}
func NewWarcraft2Pud_SectionUnit() *Warcraft2Pud_SectionUnit {
	return &Warcraft2Pud_SectionUnit{
	}
}

func (this *Warcraft2Pud_SectionUnit) Read(io *kaitai.Stream, parent *Warcraft2Pud_Section, root *Warcraft2Pud) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp12, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp12 {
			break
		}
		tmp13 := NewWarcraft2Pud_Unit()
		err = tmp13.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Units = append(this.Units, tmp13)
	}
	return err
}
type Warcraft2Pud_Section struct {
	Name string
	Size uint32
	Body interface{}
	_io *kaitai.Stream
	_root *Warcraft2Pud
	_parent *Warcraft2Pud
	_raw_Body []byte
}
func NewWarcraft2Pud_Section() *Warcraft2Pud_Section {
	return &Warcraft2Pud_Section{
	}
}

func (this *Warcraft2Pud_Section) Read(io *kaitai.Stream, parent *Warcraft2Pud, root *Warcraft2Pud) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp14, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp14 = tmp14
	this.Name = string(tmp14)
	tmp15, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Size = uint32(tmp15)
	switch (this.Name) {
	case "SLBR":
		tmp16, err := this._io.ReadBytes(int(this.Size))
		if err != nil {
			return err
		}
		tmp16 = tmp16
		this._raw_Body = tmp16
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp17 := NewWarcraft2Pud_SectionStartingResource()
		err = tmp17.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp17
	case "ERAX":
		tmp18, err := this._io.ReadBytes(int(this.Size))
		if err != nil {
			return err
		}
		tmp18 = tmp18
		this._raw_Body = tmp18
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp19 := NewWarcraft2Pud_SectionEra()
		err = tmp19.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp19
	case "OWNR":
		tmp20, err := this._io.ReadBytes(int(this.Size))
		if err != nil {
			return err
		}
		tmp20 = tmp20
		this._raw_Body = tmp20
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp21 := NewWarcraft2Pud_SectionOwnr()
		err = tmp21.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp21
	case "ERA ":
		tmp22, err := this._io.ReadBytes(int(this.Size))
		if err != nil {
			return err
		}
		tmp22 = tmp22
		this._raw_Body = tmp22
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp23 := NewWarcraft2Pud_SectionEra()
		err = tmp23.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp23
	case "SGLD":
		tmp24, err := this._io.ReadBytes(int(this.Size))
		if err != nil {
			return err
		}
		tmp24 = tmp24
		this._raw_Body = tmp24
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp25 := NewWarcraft2Pud_SectionStartingResource()
		err = tmp25.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp25
	case "VER ":
		tmp26, err := this._io.ReadBytes(int(this.Size))
		if err != nil {
			return err
		}
		tmp26 = tmp26
		this._raw_Body = tmp26
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp27 := NewWarcraft2Pud_SectionVer()
		err = tmp27.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp27
	case "SOIL":
		tmp28, err := this._io.ReadBytes(int(this.Size))
		if err != nil {
			return err
		}
		tmp28 = tmp28
		this._raw_Body = tmp28
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp29 := NewWarcraft2Pud_SectionStartingResource()
		err = tmp29.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp29
	case "UNIT":
		tmp30, err := this._io.ReadBytes(int(this.Size))
		if err != nil {
			return err
		}
		tmp30 = tmp30
		this._raw_Body = tmp30
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp31 := NewWarcraft2Pud_SectionUnit()
		err = tmp31.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp31
	case "DIM ":
		tmp32, err := this._io.ReadBytes(int(this.Size))
		if err != nil {
			return err
		}
		tmp32 = tmp32
		this._raw_Body = tmp32
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp33 := NewWarcraft2Pud_SectionDim()
		err = tmp33.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp33
	case "TYPE":
		tmp34, err := this._io.ReadBytes(int(this.Size))
		if err != nil {
			return err
		}
		tmp34 = tmp34
		this._raw_Body = tmp34
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp35 := NewWarcraft2Pud_SectionType()
		err = tmp35.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp35
	default:
		tmp36, err := this._io.ReadBytes(int(this.Size))
		if err != nil {
			return err
		}
		tmp36 = tmp36
		this._raw_Body = tmp36
	}
	return err
}

/**
 * Section that specifies who controls each player.
 */
type Warcraft2Pud_SectionOwnr struct {
	ControllerByPlayer []Warcraft2Pud_Controller
	_io *kaitai.Stream
	_root *Warcraft2Pud
	_parent *Warcraft2Pud_Section
}
func NewWarcraft2Pud_SectionOwnr() *Warcraft2Pud_SectionOwnr {
	return &Warcraft2Pud_SectionOwnr{
	}
}

func (this *Warcraft2Pud_SectionOwnr) Read(io *kaitai.Stream, parent *Warcraft2Pud_Section, root *Warcraft2Pud) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp37, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp37 {
			break
		}
		tmp38, err := this._io.ReadU1()
		if err != nil {
			return err
		}
		this.ControllerByPlayer = append(this.ControllerByPlayer, Warcraft2Pud_Controller(tmp38))
	}
	return err
}
type Warcraft2Pud_Unit struct {
	X uint16
	Y uint16
	UType Warcraft2Pud_UnitType
	Owner uint8
	Options uint16
	_io *kaitai.Stream
	_root *Warcraft2Pud
	_parent *Warcraft2Pud_SectionUnit
	_f_resource bool
	resource int
}
func NewWarcraft2Pud_Unit() *Warcraft2Pud_Unit {
	return &Warcraft2Pud_Unit{
	}
}

func (this *Warcraft2Pud_Unit) Read(io *kaitai.Stream, parent *Warcraft2Pud_SectionUnit, root *Warcraft2Pud) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp39, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.X = uint16(tmp39)
	tmp40, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Y = uint16(tmp40)
	tmp41, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.UType = Warcraft2Pud_UnitType(tmp41)
	tmp42, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Owner = tmp42
	tmp43, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Options = uint16(tmp43)
	return err
}
func (this *Warcraft2Pud_Unit) Resource() (v int, err error) {
	if (this._f_resource) {
		return this.resource, nil
	}
	if ( ((this.UType == Warcraft2Pud_UnitType__GoldMine) || (this.UType == Warcraft2Pud_UnitType__HumanOilWell) || (this.UType == Warcraft2Pud_UnitType__OrcOilWell) || (this.UType == Warcraft2Pud_UnitType__OilPatch)) ) {
		this.resource = int((this.Options * 2500))
	}
	this._f_resource = true
	return this.resource, nil
}

/**
 * if gold mine or oil well, contains 2500 * this, otherwise 0 passive 1 active
 */

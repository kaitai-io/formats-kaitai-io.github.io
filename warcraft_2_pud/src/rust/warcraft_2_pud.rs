// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#![allow(unused_imports)]
#![allow(non_snake_case)]
#![allow(non_camel_case_types)]
#![allow(irrefutable_let_patterns)]
#![allow(unused_comparisons)]

extern crate kaitai;
use kaitai::*;
use std::convert::{TryFrom, TryInto};
use std::cell::{Ref, Cell, RefCell};
use std::rc::{Rc, Weak};

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

#[derive(Default, Debug, Clone)]
pub struct Warcraft2Pud {
    pub _root: SharedType<Warcraft2Pud>,
    pub _parent: SharedType<Warcraft2Pud>,
    pub _self: SharedType<Self>,
    sections: RefCell<Vec<OptRc<Warcraft2Pud_Section>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Warcraft2Pud {
    type Root = Warcraft2Pud;
    type Parent = Warcraft2Pud;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.sections.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Warcraft2Pud_Section>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.sections.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Warcraft2Pud {
}
impl Warcraft2Pud {
    pub fn sections(&self) -> Ref<'_, Vec<OptRc<Warcraft2Pud_Section>>> {
        self.sections.borrow()
    }
}
impl Warcraft2Pud {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Warcraft2Pud_Controller {
    Computer1,
    PassiveComputer,
    Nobody,
    Computer4,
    Human,
    RescuePassive,
    RescueActive,
    Unknown(i64),
}

impl TryFrom<i64> for Warcraft2Pud_Controller {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Warcraft2Pud_Controller> {
        match flag {
            1 => Ok(Warcraft2Pud_Controller::Computer1),
            2 => Ok(Warcraft2Pud_Controller::PassiveComputer),
            3 => Ok(Warcraft2Pud_Controller::Nobody),
            4 => Ok(Warcraft2Pud_Controller::Computer4),
            5 => Ok(Warcraft2Pud_Controller::Human),
            6 => Ok(Warcraft2Pud_Controller::RescuePassive),
            7 => Ok(Warcraft2Pud_Controller::RescueActive),
            _ => Ok(Warcraft2Pud_Controller::Unknown(flag)),
        }
    }
}

impl From<&Warcraft2Pud_Controller> for i64 {
    fn from(v: &Warcraft2Pud_Controller) -> Self {
        match *v {
            Warcraft2Pud_Controller::Computer1 => 1,
            Warcraft2Pud_Controller::PassiveComputer => 2,
            Warcraft2Pud_Controller::Nobody => 3,
            Warcraft2Pud_Controller::Computer4 => 4,
            Warcraft2Pud_Controller::Human => 5,
            Warcraft2Pud_Controller::RescuePassive => 6,
            Warcraft2Pud_Controller::RescueActive => 7,
            Warcraft2Pud_Controller::Unknown(v) => v
        }
    }
}

impl Default for Warcraft2Pud_Controller {
    fn default() -> Self { Warcraft2Pud_Controller::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Warcraft2Pud_TerrainType {
    Forest,
    Winter,
    Wasteland,
    Swamp,
    Unknown(i64),
}

impl TryFrom<i64> for Warcraft2Pud_TerrainType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Warcraft2Pud_TerrainType> {
        match flag {
            0 => Ok(Warcraft2Pud_TerrainType::Forest),
            1 => Ok(Warcraft2Pud_TerrainType::Winter),
            2 => Ok(Warcraft2Pud_TerrainType::Wasteland),
            3 => Ok(Warcraft2Pud_TerrainType::Swamp),
            _ => Ok(Warcraft2Pud_TerrainType::Unknown(flag)),
        }
    }
}

impl From<&Warcraft2Pud_TerrainType> for i64 {
    fn from(v: &Warcraft2Pud_TerrainType) -> Self {
        match *v {
            Warcraft2Pud_TerrainType::Forest => 0,
            Warcraft2Pud_TerrainType::Winter => 1,
            Warcraft2Pud_TerrainType::Wasteland => 2,
            Warcraft2Pud_TerrainType::Swamp => 3,
            Warcraft2Pud_TerrainType::Unknown(v) => v
        }
    }
}

impl Default for Warcraft2Pud_TerrainType {
    fn default() -> Self { Warcraft2Pud_TerrainType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Warcraft2Pud_UnitType {
    Infantry,
    Grunt,
    Peasant,
    Peon,
    Ballista,
    Catapult,
    Knight,
    Ogre,
    Archer,
    Axethrower,
    Mage,
    DeathKnight,
    Paladin,
    OgreMage,
    Dwarves,
    GoblinSapper,
    AttackPeasant,
    AttackPeon,
    Ranger,
    Berserker,
    Alleria,
    TeronGorefiend,
    KurdanAndSkyRee,
    Dentarg,
    Khadgar,
    GromHellscream,
    HumanTanker,
    OrcTanker,
    HumanTransport,
    OrcTransport,
    ElvenDestroyer,
    TrollDestroyer,
    Battleship,
    Juggernaught,
    Deathwing,
    GnomishSubmarine,
    GiantTurtle,
    GnomishFlyingMachine,
    GoblinZepplin,
    GryphonRider,
    Dragon,
    Turalyon,
    EyeOfKilrogg,
    Danath,
    KhorgathBladefist,
    ChoGall,
    Lothar,
    GulDan,
    UtherLightbringer,
    Zuljin,
    Skeleton,
    Daemon,
    Critter,
    Farm,
    PigFarm,
    HumanBarracks,
    OrcBarracks,
    Church,
    AltarOfStorms,
    HumanScoutTower,
    OrcScoutTower,
    Stables,
    OgreMound,
    GnomishInventor,
    GoblinAlchemist,
    GryphonAviary,
    DragonRoost,
    HumanShipyard,
    OrcShipyard,
    TownHall,
    GreatHall,
    ElvenLumberMill,
    TrollLumberMill,
    HumanFoundry,
    OrcFoundry,
    MageTower,
    TempleOfTheDamned,
    HumanBlacksmith,
    OrcBlacksmith,
    HumanRefinery,
    OrcRefinery,
    HumanOilWell,
    OrcOilWell,
    Keep,
    Stronghold,
    Castle,
    Fortress,
    GoldMine,
    OilPatch,
    HumanStart,
    OrcStart,
    HumanGuardTower,
    OrcGuardTower,
    HumanCannonTower,
    OrcCannonTower,
    CircleOfPower,
    DarkPortal,
    Runestone,
    HumanWall,
    OrcWall,
    Unknown(i64),
}

impl TryFrom<i64> for Warcraft2Pud_UnitType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Warcraft2Pud_UnitType> {
        match flag {
            0 => Ok(Warcraft2Pud_UnitType::Infantry),
            1 => Ok(Warcraft2Pud_UnitType::Grunt),
            2 => Ok(Warcraft2Pud_UnitType::Peasant),
            3 => Ok(Warcraft2Pud_UnitType::Peon),
            4 => Ok(Warcraft2Pud_UnitType::Ballista),
            5 => Ok(Warcraft2Pud_UnitType::Catapult),
            6 => Ok(Warcraft2Pud_UnitType::Knight),
            7 => Ok(Warcraft2Pud_UnitType::Ogre),
            8 => Ok(Warcraft2Pud_UnitType::Archer),
            9 => Ok(Warcraft2Pud_UnitType::Axethrower),
            10 => Ok(Warcraft2Pud_UnitType::Mage),
            11 => Ok(Warcraft2Pud_UnitType::DeathKnight),
            12 => Ok(Warcraft2Pud_UnitType::Paladin),
            13 => Ok(Warcraft2Pud_UnitType::OgreMage),
            14 => Ok(Warcraft2Pud_UnitType::Dwarves),
            15 => Ok(Warcraft2Pud_UnitType::GoblinSapper),
            16 => Ok(Warcraft2Pud_UnitType::AttackPeasant),
            17 => Ok(Warcraft2Pud_UnitType::AttackPeon),
            18 => Ok(Warcraft2Pud_UnitType::Ranger),
            19 => Ok(Warcraft2Pud_UnitType::Berserker),
            20 => Ok(Warcraft2Pud_UnitType::Alleria),
            21 => Ok(Warcraft2Pud_UnitType::TeronGorefiend),
            22 => Ok(Warcraft2Pud_UnitType::KurdanAndSkyRee),
            23 => Ok(Warcraft2Pud_UnitType::Dentarg),
            24 => Ok(Warcraft2Pud_UnitType::Khadgar),
            25 => Ok(Warcraft2Pud_UnitType::GromHellscream),
            26 => Ok(Warcraft2Pud_UnitType::HumanTanker),
            27 => Ok(Warcraft2Pud_UnitType::OrcTanker),
            28 => Ok(Warcraft2Pud_UnitType::HumanTransport),
            29 => Ok(Warcraft2Pud_UnitType::OrcTransport),
            30 => Ok(Warcraft2Pud_UnitType::ElvenDestroyer),
            31 => Ok(Warcraft2Pud_UnitType::TrollDestroyer),
            32 => Ok(Warcraft2Pud_UnitType::Battleship),
            33 => Ok(Warcraft2Pud_UnitType::Juggernaught),
            35 => Ok(Warcraft2Pud_UnitType::Deathwing),
            38 => Ok(Warcraft2Pud_UnitType::GnomishSubmarine),
            39 => Ok(Warcraft2Pud_UnitType::GiantTurtle),
            40 => Ok(Warcraft2Pud_UnitType::GnomishFlyingMachine),
            41 => Ok(Warcraft2Pud_UnitType::GoblinZepplin),
            42 => Ok(Warcraft2Pud_UnitType::GryphonRider),
            43 => Ok(Warcraft2Pud_UnitType::Dragon),
            44 => Ok(Warcraft2Pud_UnitType::Turalyon),
            45 => Ok(Warcraft2Pud_UnitType::EyeOfKilrogg),
            46 => Ok(Warcraft2Pud_UnitType::Danath),
            47 => Ok(Warcraft2Pud_UnitType::KhorgathBladefist),
            49 => Ok(Warcraft2Pud_UnitType::ChoGall),
            50 => Ok(Warcraft2Pud_UnitType::Lothar),
            51 => Ok(Warcraft2Pud_UnitType::GulDan),
            52 => Ok(Warcraft2Pud_UnitType::UtherLightbringer),
            53 => Ok(Warcraft2Pud_UnitType::Zuljin),
            55 => Ok(Warcraft2Pud_UnitType::Skeleton),
            56 => Ok(Warcraft2Pud_UnitType::Daemon),
            57 => Ok(Warcraft2Pud_UnitType::Critter),
            58 => Ok(Warcraft2Pud_UnitType::Farm),
            59 => Ok(Warcraft2Pud_UnitType::PigFarm),
            60 => Ok(Warcraft2Pud_UnitType::HumanBarracks),
            61 => Ok(Warcraft2Pud_UnitType::OrcBarracks),
            62 => Ok(Warcraft2Pud_UnitType::Church),
            63 => Ok(Warcraft2Pud_UnitType::AltarOfStorms),
            64 => Ok(Warcraft2Pud_UnitType::HumanScoutTower),
            65 => Ok(Warcraft2Pud_UnitType::OrcScoutTower),
            66 => Ok(Warcraft2Pud_UnitType::Stables),
            67 => Ok(Warcraft2Pud_UnitType::OgreMound),
            68 => Ok(Warcraft2Pud_UnitType::GnomishInventor),
            69 => Ok(Warcraft2Pud_UnitType::GoblinAlchemist),
            70 => Ok(Warcraft2Pud_UnitType::GryphonAviary),
            71 => Ok(Warcraft2Pud_UnitType::DragonRoost),
            72 => Ok(Warcraft2Pud_UnitType::HumanShipyard),
            73 => Ok(Warcraft2Pud_UnitType::OrcShipyard),
            74 => Ok(Warcraft2Pud_UnitType::TownHall),
            75 => Ok(Warcraft2Pud_UnitType::GreatHall),
            76 => Ok(Warcraft2Pud_UnitType::ElvenLumberMill),
            77 => Ok(Warcraft2Pud_UnitType::TrollLumberMill),
            78 => Ok(Warcraft2Pud_UnitType::HumanFoundry),
            79 => Ok(Warcraft2Pud_UnitType::OrcFoundry),
            80 => Ok(Warcraft2Pud_UnitType::MageTower),
            81 => Ok(Warcraft2Pud_UnitType::TempleOfTheDamned),
            82 => Ok(Warcraft2Pud_UnitType::HumanBlacksmith),
            83 => Ok(Warcraft2Pud_UnitType::OrcBlacksmith),
            84 => Ok(Warcraft2Pud_UnitType::HumanRefinery),
            85 => Ok(Warcraft2Pud_UnitType::OrcRefinery),
            86 => Ok(Warcraft2Pud_UnitType::HumanOilWell),
            87 => Ok(Warcraft2Pud_UnitType::OrcOilWell),
            88 => Ok(Warcraft2Pud_UnitType::Keep),
            89 => Ok(Warcraft2Pud_UnitType::Stronghold),
            90 => Ok(Warcraft2Pud_UnitType::Castle),
            91 => Ok(Warcraft2Pud_UnitType::Fortress),
            92 => Ok(Warcraft2Pud_UnitType::GoldMine),
            93 => Ok(Warcraft2Pud_UnitType::OilPatch),
            94 => Ok(Warcraft2Pud_UnitType::HumanStart),
            95 => Ok(Warcraft2Pud_UnitType::OrcStart),
            96 => Ok(Warcraft2Pud_UnitType::HumanGuardTower),
            97 => Ok(Warcraft2Pud_UnitType::OrcGuardTower),
            98 => Ok(Warcraft2Pud_UnitType::HumanCannonTower),
            99 => Ok(Warcraft2Pud_UnitType::OrcCannonTower),
            100 => Ok(Warcraft2Pud_UnitType::CircleOfPower),
            101 => Ok(Warcraft2Pud_UnitType::DarkPortal),
            102 => Ok(Warcraft2Pud_UnitType::Runestone),
            103 => Ok(Warcraft2Pud_UnitType::HumanWall),
            104 => Ok(Warcraft2Pud_UnitType::OrcWall),
            _ => Ok(Warcraft2Pud_UnitType::Unknown(flag)),
        }
    }
}

impl From<&Warcraft2Pud_UnitType> for i64 {
    fn from(v: &Warcraft2Pud_UnitType) -> Self {
        match *v {
            Warcraft2Pud_UnitType::Infantry => 0,
            Warcraft2Pud_UnitType::Grunt => 1,
            Warcraft2Pud_UnitType::Peasant => 2,
            Warcraft2Pud_UnitType::Peon => 3,
            Warcraft2Pud_UnitType::Ballista => 4,
            Warcraft2Pud_UnitType::Catapult => 5,
            Warcraft2Pud_UnitType::Knight => 6,
            Warcraft2Pud_UnitType::Ogre => 7,
            Warcraft2Pud_UnitType::Archer => 8,
            Warcraft2Pud_UnitType::Axethrower => 9,
            Warcraft2Pud_UnitType::Mage => 10,
            Warcraft2Pud_UnitType::DeathKnight => 11,
            Warcraft2Pud_UnitType::Paladin => 12,
            Warcraft2Pud_UnitType::OgreMage => 13,
            Warcraft2Pud_UnitType::Dwarves => 14,
            Warcraft2Pud_UnitType::GoblinSapper => 15,
            Warcraft2Pud_UnitType::AttackPeasant => 16,
            Warcraft2Pud_UnitType::AttackPeon => 17,
            Warcraft2Pud_UnitType::Ranger => 18,
            Warcraft2Pud_UnitType::Berserker => 19,
            Warcraft2Pud_UnitType::Alleria => 20,
            Warcraft2Pud_UnitType::TeronGorefiend => 21,
            Warcraft2Pud_UnitType::KurdanAndSkyRee => 22,
            Warcraft2Pud_UnitType::Dentarg => 23,
            Warcraft2Pud_UnitType::Khadgar => 24,
            Warcraft2Pud_UnitType::GromHellscream => 25,
            Warcraft2Pud_UnitType::HumanTanker => 26,
            Warcraft2Pud_UnitType::OrcTanker => 27,
            Warcraft2Pud_UnitType::HumanTransport => 28,
            Warcraft2Pud_UnitType::OrcTransport => 29,
            Warcraft2Pud_UnitType::ElvenDestroyer => 30,
            Warcraft2Pud_UnitType::TrollDestroyer => 31,
            Warcraft2Pud_UnitType::Battleship => 32,
            Warcraft2Pud_UnitType::Juggernaught => 33,
            Warcraft2Pud_UnitType::Deathwing => 35,
            Warcraft2Pud_UnitType::GnomishSubmarine => 38,
            Warcraft2Pud_UnitType::GiantTurtle => 39,
            Warcraft2Pud_UnitType::GnomishFlyingMachine => 40,
            Warcraft2Pud_UnitType::GoblinZepplin => 41,
            Warcraft2Pud_UnitType::GryphonRider => 42,
            Warcraft2Pud_UnitType::Dragon => 43,
            Warcraft2Pud_UnitType::Turalyon => 44,
            Warcraft2Pud_UnitType::EyeOfKilrogg => 45,
            Warcraft2Pud_UnitType::Danath => 46,
            Warcraft2Pud_UnitType::KhorgathBladefist => 47,
            Warcraft2Pud_UnitType::ChoGall => 49,
            Warcraft2Pud_UnitType::Lothar => 50,
            Warcraft2Pud_UnitType::GulDan => 51,
            Warcraft2Pud_UnitType::UtherLightbringer => 52,
            Warcraft2Pud_UnitType::Zuljin => 53,
            Warcraft2Pud_UnitType::Skeleton => 55,
            Warcraft2Pud_UnitType::Daemon => 56,
            Warcraft2Pud_UnitType::Critter => 57,
            Warcraft2Pud_UnitType::Farm => 58,
            Warcraft2Pud_UnitType::PigFarm => 59,
            Warcraft2Pud_UnitType::HumanBarracks => 60,
            Warcraft2Pud_UnitType::OrcBarracks => 61,
            Warcraft2Pud_UnitType::Church => 62,
            Warcraft2Pud_UnitType::AltarOfStorms => 63,
            Warcraft2Pud_UnitType::HumanScoutTower => 64,
            Warcraft2Pud_UnitType::OrcScoutTower => 65,
            Warcraft2Pud_UnitType::Stables => 66,
            Warcraft2Pud_UnitType::OgreMound => 67,
            Warcraft2Pud_UnitType::GnomishInventor => 68,
            Warcraft2Pud_UnitType::GoblinAlchemist => 69,
            Warcraft2Pud_UnitType::GryphonAviary => 70,
            Warcraft2Pud_UnitType::DragonRoost => 71,
            Warcraft2Pud_UnitType::HumanShipyard => 72,
            Warcraft2Pud_UnitType::OrcShipyard => 73,
            Warcraft2Pud_UnitType::TownHall => 74,
            Warcraft2Pud_UnitType::GreatHall => 75,
            Warcraft2Pud_UnitType::ElvenLumberMill => 76,
            Warcraft2Pud_UnitType::TrollLumberMill => 77,
            Warcraft2Pud_UnitType::HumanFoundry => 78,
            Warcraft2Pud_UnitType::OrcFoundry => 79,
            Warcraft2Pud_UnitType::MageTower => 80,
            Warcraft2Pud_UnitType::TempleOfTheDamned => 81,
            Warcraft2Pud_UnitType::HumanBlacksmith => 82,
            Warcraft2Pud_UnitType::OrcBlacksmith => 83,
            Warcraft2Pud_UnitType::HumanRefinery => 84,
            Warcraft2Pud_UnitType::OrcRefinery => 85,
            Warcraft2Pud_UnitType::HumanOilWell => 86,
            Warcraft2Pud_UnitType::OrcOilWell => 87,
            Warcraft2Pud_UnitType::Keep => 88,
            Warcraft2Pud_UnitType::Stronghold => 89,
            Warcraft2Pud_UnitType::Castle => 90,
            Warcraft2Pud_UnitType::Fortress => 91,
            Warcraft2Pud_UnitType::GoldMine => 92,
            Warcraft2Pud_UnitType::OilPatch => 93,
            Warcraft2Pud_UnitType::HumanStart => 94,
            Warcraft2Pud_UnitType::OrcStart => 95,
            Warcraft2Pud_UnitType::HumanGuardTower => 96,
            Warcraft2Pud_UnitType::OrcGuardTower => 97,
            Warcraft2Pud_UnitType::HumanCannonTower => 98,
            Warcraft2Pud_UnitType::OrcCannonTower => 99,
            Warcraft2Pud_UnitType::CircleOfPower => 100,
            Warcraft2Pud_UnitType::DarkPortal => 101,
            Warcraft2Pud_UnitType::Runestone => 102,
            Warcraft2Pud_UnitType::HumanWall => 103,
            Warcraft2Pud_UnitType::OrcWall => 104,
            Warcraft2Pud_UnitType::Unknown(v) => v
        }
    }
}

impl Default for Warcraft2Pud_UnitType {
    fn default() -> Self { Warcraft2Pud_UnitType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Warcraft2Pud_Section {
    pub _root: SharedType<Warcraft2Pud>,
    pub _parent: SharedType<Warcraft2Pud>,
    pub _self: SharedType<Self>,
    name: RefCell<String>,
    size: RefCell<u32>,
    body: RefCell<Option<Warcraft2Pud_Section_Body>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum Warcraft2Pud_Section_Body {
    Warcraft2Pud_SectionVer(OptRc<Warcraft2Pud_SectionVer>),
    Warcraft2Pud_SectionUnit(OptRc<Warcraft2Pud_SectionUnit>),
    Warcraft2Pud_SectionOwnr(OptRc<Warcraft2Pud_SectionOwnr>),
    Bytes(Vec<u8>),
    Warcraft2Pud_SectionStartingResource(OptRc<Warcraft2Pud_SectionStartingResource>),
    Warcraft2Pud_SectionDim(OptRc<Warcraft2Pud_SectionDim>),
    Warcraft2Pud_SectionEra(OptRc<Warcraft2Pud_SectionEra>),
    Warcraft2Pud_SectionType(OptRc<Warcraft2Pud_SectionType>),
}
impl From<&Warcraft2Pud_Section_Body> for OptRc<Warcraft2Pud_SectionVer> {
    fn from(v: &Warcraft2Pud_Section_Body) -> Self {
        if let Warcraft2Pud_Section_Body::Warcraft2Pud_SectionVer(x) = v {
            return x.clone();
        }
        panic!("expected Warcraft2Pud_Section_Body::Warcraft2Pud_SectionVer, got {:?}", v)
    }
}
impl From<OptRc<Warcraft2Pud_SectionVer>> for Warcraft2Pud_Section_Body {
    fn from(v: OptRc<Warcraft2Pud_SectionVer>) -> Self {
        Self::Warcraft2Pud_SectionVer(v)
    }
}
impl From<&Warcraft2Pud_Section_Body> for OptRc<Warcraft2Pud_SectionUnit> {
    fn from(v: &Warcraft2Pud_Section_Body) -> Self {
        if let Warcraft2Pud_Section_Body::Warcraft2Pud_SectionUnit(x) = v {
            return x.clone();
        }
        panic!("expected Warcraft2Pud_Section_Body::Warcraft2Pud_SectionUnit, got {:?}", v)
    }
}
impl From<OptRc<Warcraft2Pud_SectionUnit>> for Warcraft2Pud_Section_Body {
    fn from(v: OptRc<Warcraft2Pud_SectionUnit>) -> Self {
        Self::Warcraft2Pud_SectionUnit(v)
    }
}
impl From<&Warcraft2Pud_Section_Body> for OptRc<Warcraft2Pud_SectionOwnr> {
    fn from(v: &Warcraft2Pud_Section_Body) -> Self {
        if let Warcraft2Pud_Section_Body::Warcraft2Pud_SectionOwnr(x) = v {
            return x.clone();
        }
        panic!("expected Warcraft2Pud_Section_Body::Warcraft2Pud_SectionOwnr, got {:?}", v)
    }
}
impl From<OptRc<Warcraft2Pud_SectionOwnr>> for Warcraft2Pud_Section_Body {
    fn from(v: OptRc<Warcraft2Pud_SectionOwnr>) -> Self {
        Self::Warcraft2Pud_SectionOwnr(v)
    }
}
impl From<&Warcraft2Pud_Section_Body> for Vec<u8> {
    fn from(v: &Warcraft2Pud_Section_Body) -> Self {
        if let Warcraft2Pud_Section_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected Warcraft2Pud_Section_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for Warcraft2Pud_Section_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&Warcraft2Pud_Section_Body> for OptRc<Warcraft2Pud_SectionStartingResource> {
    fn from(v: &Warcraft2Pud_Section_Body) -> Self {
        if let Warcraft2Pud_Section_Body::Warcraft2Pud_SectionStartingResource(x) = v {
            return x.clone();
        }
        panic!("expected Warcraft2Pud_Section_Body::Warcraft2Pud_SectionStartingResource, got {:?}", v)
    }
}
impl From<OptRc<Warcraft2Pud_SectionStartingResource>> for Warcraft2Pud_Section_Body {
    fn from(v: OptRc<Warcraft2Pud_SectionStartingResource>) -> Self {
        Self::Warcraft2Pud_SectionStartingResource(v)
    }
}
impl From<&Warcraft2Pud_Section_Body> for OptRc<Warcraft2Pud_SectionDim> {
    fn from(v: &Warcraft2Pud_Section_Body) -> Self {
        if let Warcraft2Pud_Section_Body::Warcraft2Pud_SectionDim(x) = v {
            return x.clone();
        }
        panic!("expected Warcraft2Pud_Section_Body::Warcraft2Pud_SectionDim, got {:?}", v)
    }
}
impl From<OptRc<Warcraft2Pud_SectionDim>> for Warcraft2Pud_Section_Body {
    fn from(v: OptRc<Warcraft2Pud_SectionDim>) -> Self {
        Self::Warcraft2Pud_SectionDim(v)
    }
}
impl From<&Warcraft2Pud_Section_Body> for OptRc<Warcraft2Pud_SectionEra> {
    fn from(v: &Warcraft2Pud_Section_Body) -> Self {
        if let Warcraft2Pud_Section_Body::Warcraft2Pud_SectionEra(x) = v {
            return x.clone();
        }
        panic!("expected Warcraft2Pud_Section_Body::Warcraft2Pud_SectionEra, got {:?}", v)
    }
}
impl From<OptRc<Warcraft2Pud_SectionEra>> for Warcraft2Pud_Section_Body {
    fn from(v: OptRc<Warcraft2Pud_SectionEra>) -> Self {
        Self::Warcraft2Pud_SectionEra(v)
    }
}
impl From<&Warcraft2Pud_Section_Body> for OptRc<Warcraft2Pud_SectionType> {
    fn from(v: &Warcraft2Pud_Section_Body) -> Self {
        if let Warcraft2Pud_Section_Body::Warcraft2Pud_SectionType(x) = v {
            return x.clone();
        }
        panic!("expected Warcraft2Pud_Section_Body::Warcraft2Pud_SectionType, got {:?}", v)
    }
}
impl From<OptRc<Warcraft2Pud_SectionType>> for Warcraft2Pud_Section_Body {
    fn from(v: OptRc<Warcraft2Pud_SectionType>) -> Self {
        Self::Warcraft2Pud_SectionType(v)
    }
}
impl KStruct for Warcraft2Pud_Section {
    type Root = Warcraft2Pud;
    type Parent = Warcraft2Pud;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.name.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "ASCII")?;
        *self_rc.size.borrow_mut() = _io.read_u4le()?.into();
        {
            let on = self_rc.name();
            if *on == "DIM " {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.size() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Warcraft2Pud_SectionDim>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "ERA " {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.size() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Warcraft2Pud_SectionEra>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "ERAX" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.size() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Warcraft2Pud_SectionEra>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "OWNR" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.size() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Warcraft2Pud_SectionOwnr>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "SGLD" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.size() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Warcraft2Pud_SectionStartingResource>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "SLBR" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.size() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Warcraft2Pud_SectionStartingResource>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "SOIL" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.size() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Warcraft2Pud_SectionStartingResource>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "TYPE" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.size() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Warcraft2Pud_SectionType>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "UNIT" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.size() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Warcraft2Pud_SectionUnit>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "VER " {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.size() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Warcraft2Pud_SectionVer>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else {
                *self_rc.body.borrow_mut() = Some(_io.read_bytes(*self_rc.size() as usize)?.into());
            }
        }
        Ok(())
    }
}
impl Warcraft2Pud_Section {
}
impl Warcraft2Pud_Section {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl Warcraft2Pud_Section {
    pub fn size(&self) -> Ref<'_, u32> {
        self.size.borrow()
    }
}
impl Warcraft2Pud_Section {
    pub fn body(&self) -> Ref<'_, Option<Warcraft2Pud_Section_Body>> {
        self.body.borrow()
    }
}
impl Warcraft2Pud_Section {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Warcraft2Pud_Section {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Warcraft2Pud_SectionDim {
    pub _root: SharedType<Warcraft2Pud>,
    pub _parent: SharedType<Warcraft2Pud_Section>,
    pub _self: SharedType<Self>,
    x: RefCell<u16>,
    y: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Warcraft2Pud_SectionDim {
    type Root = Warcraft2Pud;
    type Parent = Warcraft2Pud_Section;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.x.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.y.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl Warcraft2Pud_SectionDim {
}
impl Warcraft2Pud_SectionDim {
    pub fn x(&self) -> Ref<'_, u16> {
        self.x.borrow()
    }
}
impl Warcraft2Pud_SectionDim {
    pub fn y(&self) -> Ref<'_, u16> {
        self.y.borrow()
    }
}
impl Warcraft2Pud_SectionDim {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Section that specifies terrain type for this map.
 */

#[derive(Default, Debug, Clone)]
pub struct Warcraft2Pud_SectionEra {
    pub _root: SharedType<Warcraft2Pud>,
    pub _parent: SharedType<Warcraft2Pud_Section>,
    pub _self: SharedType<Self>,
    terrain: RefCell<Warcraft2Pud_TerrainType>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Warcraft2Pud_SectionEra {
    type Root = Warcraft2Pud;
    type Parent = Warcraft2Pud_Section;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.terrain.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        Ok(())
    }
}
impl Warcraft2Pud_SectionEra {
}
impl Warcraft2Pud_SectionEra {
    pub fn terrain(&self) -> Ref<'_, Warcraft2Pud_TerrainType> {
        self.terrain.borrow()
    }
}
impl Warcraft2Pud_SectionEra {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Section that specifies who controls each player.
 */

#[derive(Default, Debug, Clone)]
pub struct Warcraft2Pud_SectionOwnr {
    pub _root: SharedType<Warcraft2Pud>,
    pub _parent: SharedType<Warcraft2Pud_Section>,
    pub _self: SharedType<Self>,
    controller_by_player: RefCell<Vec<Warcraft2Pud_Controller>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Warcraft2Pud_SectionOwnr {
    type Root = Warcraft2Pud;
    type Parent = Warcraft2Pud_Section;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.controller_by_player.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.controller_by_player.borrow_mut().push((_io.read_u1()? as i64).try_into()?);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Warcraft2Pud_SectionOwnr {
}
impl Warcraft2Pud_SectionOwnr {
    pub fn controller_by_player(&self) -> Ref<'_, Vec<Warcraft2Pud_Controller>> {
        self.controller_by_player.borrow()
    }
}
impl Warcraft2Pud_SectionOwnr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Warcraft2Pud_SectionStartingResource {
    pub _root: SharedType<Warcraft2Pud>,
    pub _parent: SharedType<Warcraft2Pud_Section>,
    pub _self: SharedType<Self>,
    resources_by_player: RefCell<Vec<u16>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Warcraft2Pud_SectionStartingResource {
    type Root = Warcraft2Pud;
    type Parent = Warcraft2Pud_Section;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.resources_by_player.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.resources_by_player.borrow_mut().push(_io.read_u2le()?.into());
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Warcraft2Pud_SectionStartingResource {
}
impl Warcraft2Pud_SectionStartingResource {
    pub fn resources_by_player(&self) -> Ref<'_, Vec<u16>> {
        self.resources_by_player.borrow()
    }
}
impl Warcraft2Pud_SectionStartingResource {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Section that confirms that this file is a "map file" by certain
 * magic string and supplies a tag that could be used in
 * multiplayer to check that all player use the same version of the
 * map.
 */

#[derive(Default, Debug, Clone)]
pub struct Warcraft2Pud_SectionType {
    pub _root: SharedType<Warcraft2Pud>,
    pub _parent: SharedType<Warcraft2Pud_Section>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    unused: RefCell<Vec<u8>>,
    id_tag: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Warcraft2Pud_SectionType {
    type Root = Warcraft2Pud;
    type Parent = Warcraft2Pud_Section;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.magic.borrow_mut() = _io.read_bytes(10 as usize)?.into();
        if !(*self_rc.magic() == vec![0x57u8, 0x41u8, 0x52u8, 0x32u8, 0x20u8, 0x4du8, 0x41u8, 0x50u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/section_type/seq/0".to_string() }));
        }
        *self_rc.unused.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        *self_rc.id_tag.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Warcraft2Pud_SectionType {
}
impl Warcraft2Pud_SectionType {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}

/**
 * unused (always set to $0a and $ff by editor, but can be anything for the game)
 */
impl Warcraft2Pud_SectionType {
    pub fn unused(&self) -> Ref<'_, Vec<u8>> {
        self.unused.borrow()
    }
}

/**
 * id tag (for consistency check in multiplayer)
 */
impl Warcraft2Pud_SectionType {
    pub fn id_tag(&self) -> Ref<'_, u32> {
        self.id_tag.borrow()
    }
}
impl Warcraft2Pud_SectionType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Warcraft2Pud_SectionUnit {
    pub _root: SharedType<Warcraft2Pud>,
    pub _parent: SharedType<Warcraft2Pud_Section>,
    pub _self: SharedType<Self>,
    units: RefCell<Vec<OptRc<Warcraft2Pud_Unit>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Warcraft2Pud_SectionUnit {
    type Root = Warcraft2Pud;
    type Parent = Warcraft2Pud_Section;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.units.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Warcraft2Pud_Unit>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.units.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Warcraft2Pud_SectionUnit {
}
impl Warcraft2Pud_SectionUnit {
    pub fn units(&self) -> Ref<'_, Vec<OptRc<Warcraft2Pud_Unit>>> {
        self.units.borrow()
    }
}
impl Warcraft2Pud_SectionUnit {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Section that specifies format version.
 */

#[derive(Default, Debug, Clone)]
pub struct Warcraft2Pud_SectionVer {
    pub _root: SharedType<Warcraft2Pud>,
    pub _parent: SharedType<Warcraft2Pud_Section>,
    pub _self: SharedType<Self>,
    version: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Warcraft2Pud_SectionVer {
    type Root = Warcraft2Pud;
    type Parent = Warcraft2Pud_Section;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.version.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl Warcraft2Pud_SectionVer {
}
impl Warcraft2Pud_SectionVer {
    pub fn version(&self) -> Ref<'_, u16> {
        self.version.borrow()
    }
}
impl Warcraft2Pud_SectionVer {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Warcraft2Pud_Unit {
    pub _root: SharedType<Warcraft2Pud>,
    pub _parent: SharedType<Warcraft2Pud_SectionUnit>,
    pub _self: SharedType<Self>,
    x: RefCell<u16>,
    y: RefCell<u16>,
    u_type: RefCell<Warcraft2Pud_UnitType>,
    owner: RefCell<u8>,
    options: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_resource: Cell<bool>,
    resource: RefCell<i32>,
}
impl KStruct for Warcraft2Pud_Unit {
    type Root = Warcraft2Pud;
    type Parent = Warcraft2Pud_SectionUnit;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.x.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.y.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.u_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.owner.borrow_mut() = _io.read_u1()?.into();
        *self_rc.options.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl Warcraft2Pud_Unit {
    pub fn resource(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_resource.get() {
            return Ok(self.resource.borrow());
        }
        self.f_resource.set(true);
        if  ((*self.u_type() == Warcraft2Pud_UnitType::GoldMine) || (*self.u_type() == Warcraft2Pud_UnitType::HumanOilWell) || (*self.u_type() == Warcraft2Pud_UnitType::OrcOilWell) || (*self.u_type() == Warcraft2Pud_UnitType::OilPatch))  {
            *self.resource.borrow_mut() = (((*self.options() as i32) * (2500 as i32))) as i32;
        }
        Ok(self.resource.borrow())
    }
}
impl Warcraft2Pud_Unit {
    pub fn x(&self) -> Ref<'_, u16> {
        self.x.borrow()
    }
}
impl Warcraft2Pud_Unit {
    pub fn y(&self) -> Ref<'_, u16> {
        self.y.borrow()
    }
}
impl Warcraft2Pud_Unit {
    pub fn u_type(&self) -> Ref<'_, Warcraft2Pud_UnitType> {
        self.u_type.borrow()
    }
}
impl Warcraft2Pud_Unit {
    pub fn owner(&self) -> Ref<'_, u8> {
        self.owner.borrow()
    }
}

/**
 * if gold mine or oil well, contains 2500 * this, otherwise 0 passive 1 active
 */
impl Warcraft2Pud_Unit {
    pub fn options(&self) -> Ref<'_, u16> {
        self.options.borrow()
    }
}
impl Warcraft2Pud_Unit {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

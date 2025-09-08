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
 * ID3v1.1 tag is a method to store simple metadata in .mp3 files. The
 * tag is appended to the end of file and spans exactly 128 bytes.
 * 
 * This type is supposed to be used on full .mp3 files, seeking to
 * proper position automatically. If you're interesting in parsing only
 * the tag itself, please use `id3v1_1::id3_v1_1_tag` subtype.
 * \sa https://id3.org/ID3v1 Source
 */

#[derive(Default, Debug, Clone)]
pub struct Id3v11 {
    pub _root: SharedType<Id3v11>,
    pub _parent: SharedType<Id3v11>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
    f_id3v1_tag: Cell<bool>,
    id3v1_tag: RefCell<OptRc<Id3v11_Id3V11Tag>>,
}
impl KStruct for Id3v11 {
    type Root = Id3v11;
    type Parent = Id3v11;

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
        Ok(())
    }
}
impl Id3v11 {
    pub fn id3v1_tag(
        &self
    ) -> KResult<Ref<'_, OptRc<Id3v11_Id3V11Tag>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_id3v1_tag.get() {
            return Ok(self.id3v1_tag.borrow());
        }
        let _pos = _io.pos();
        _io.seek(((_io.size() as i32) - (128 as i32)) as usize)?;
        let t = Self::read_into::<_, Id3v11_Id3V11Tag>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.id3v1_tag.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.id3v1_tag.borrow())
    }
}
impl Id3v11 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * ID3v1.1 tag itself, a fixed size 128 byte structure. Contains
 * several metadata fields as fixed-size strings.
 * 
 * Note that string encoding is not specified by standard, so real
 * encoding used would vary a lot from one implementation to
 * another. Most Windows-based applications tend to use "ANSI"
 * (i.e. locale-dependent encoding, usually one byte per
 * character). Some embedded applications allow selection of
 * charset.
 */

#[derive(Default, Debug, Clone)]
pub struct Id3v11_Id3V11Tag {
    pub _root: SharedType<Id3v11>,
    pub _parent: SharedType<Id3v11>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    title: RefCell<Vec<u8>>,
    artist: RefCell<Vec<u8>>,
    album: RefCell<Vec<u8>>,
    year: RefCell<String>,
    comment: RefCell<Vec<u8>>,
    genre: RefCell<Id3v11_Id3V11Tag_GenreEnum>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Id3v11_Id3V11Tag {
    type Root = Id3v11;
    type Parent = Id3v11;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(3 as usize)?.into();
        if !(*self_rc.magic() == vec![0x54u8, 0x41u8, 0x47u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/id3_v1_1_tag/seq/0".to_string() }));
        }
        *self_rc.title.borrow_mut() = _io.read_bytes(30 as usize)?.into();
        *self_rc.artist.borrow_mut() = _io.read_bytes(30 as usize)?.into();
        *self_rc.album.borrow_mut() = _io.read_bytes(30 as usize)?.into();
        *self_rc.year.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "ASCII")?;
        *self_rc.comment.borrow_mut() = _io.read_bytes(30 as usize)?.into();
        *self_rc.genre.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        Ok(())
    }
}
impl Id3v11_Id3V11Tag {
}
impl Id3v11_Id3V11Tag {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}

/**
 * Song title
 */
impl Id3v11_Id3V11Tag {
    pub fn title(&self) -> Ref<'_, Vec<u8>> {
        self.title.borrow()
    }
}

/**
 * Artist name
 */
impl Id3v11_Id3V11Tag {
    pub fn artist(&self) -> Ref<'_, Vec<u8>> {
        self.artist.borrow()
    }
}

/**
 * Album title
 */
impl Id3v11_Id3V11Tag {
    pub fn album(&self) -> Ref<'_, Vec<u8>> {
        self.album.borrow()
    }
}

/**
 * Year of release
 */
impl Id3v11_Id3V11Tag {
    pub fn year(&self) -> Ref<'_, String> {
        self.year.borrow()
    }
}

/**
 * Arbitary comment
 */
impl Id3v11_Id3V11Tag {
    pub fn comment(&self) -> Ref<'_, Vec<u8>> {
        self.comment.borrow()
    }
}
impl Id3v11_Id3V11Tag {
    pub fn genre(&self) -> Ref<'_, Id3v11_Id3V11Tag_GenreEnum> {
        self.genre.borrow()
    }
}
impl Id3v11_Id3V11Tag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Id3v11_Id3V11Tag_GenreEnum {
    Blues,
    ClassicRock,
    Country,
    Dance,
    Disco,
    Funk,
    Grunge,
    HipHop,
    Jazz,
    Metal,
    NewAge,
    Oldies,
    Other,
    Pop,
    Rnb,
    Rap,
    Reggae,
    Rock,
    Techno,
    Industrial,
    Alternative,
    Ska,
    DeathMetal,
    Pranks,
    Soundtrack,
    EuroTechno,
    Ambient,
    TripHop,
    Vocal,
    JazzFunk,
    Fusion,
    Trance,
    Classical,
    Instrumental,
    Acid,
    House,
    Game,
    SoundClip,
    Gospel,
    Noise,
    Alternrock,
    Bass,
    Soul,
    Punk,
    Space,
    Meditative,
    InstrumentalPop,
    InstrumentalRock,
    Ethnic,
    Gothic,
    Darkwave,
    TechnoIndustrial,
    Electronic,
    PopFolk,
    Eurodance,
    Dream,
    SouthernRock,
    Comedy,
    Cult,
    Gangsta,
    Top40,
    ChristianRap,
    PopFunk,
    Jungle,
    NativeAmerican,
    Cabaret,
    NewWave,
    Psychadelic,
    Rave,
    Showtunes,
    Trailer,
    LoFi,
    Tribal,
    AcidPunk,
    AcidJazz,
    Polka,
    Retro,
    Musical,
    RockNRoll,
    HardRock,
    Folk,
    FolkRock,
    NationalFolk,
    Swing,
    FastFusion,
    Bebob,
    Latin,
    Revival,
    Celtic,
    Bluegrass,
    Avantgarde,
    GothicRock,
    ProgressiveRock,
    PsychedelicRock,
    SymphonicRock,
    SlowRock,
    BigBand,
    Chorus,
    EasyListening,
    Acoustic,
    Humour,
    Speech,
    Chanson,
    Opera,
    ChamberMusic,
    Sonata,
    Symphony,
    BootyBass,
    Primus,
    PornGroove,
    Satire,
    SlowJam,
    Club,
    Tango,
    Samba,
    Folklore,
    Ballad,
    PowerBallad,
    RhythmicSoul,
    Freestyle,
    Duet,
    PunkRock,
    DrumSolo,
    ACapella,
    EuroHouse,
    DanceHall,
    Unknown(i64),
}

impl TryFrom<i64> for Id3v11_Id3V11Tag_GenreEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Id3v11_Id3V11Tag_GenreEnum> {
        match flag {
            0 => Ok(Id3v11_Id3V11Tag_GenreEnum::Blues),
            1 => Ok(Id3v11_Id3V11Tag_GenreEnum::ClassicRock),
            2 => Ok(Id3v11_Id3V11Tag_GenreEnum::Country),
            3 => Ok(Id3v11_Id3V11Tag_GenreEnum::Dance),
            4 => Ok(Id3v11_Id3V11Tag_GenreEnum::Disco),
            5 => Ok(Id3v11_Id3V11Tag_GenreEnum::Funk),
            6 => Ok(Id3v11_Id3V11Tag_GenreEnum::Grunge),
            7 => Ok(Id3v11_Id3V11Tag_GenreEnum::HipHop),
            8 => Ok(Id3v11_Id3V11Tag_GenreEnum::Jazz),
            9 => Ok(Id3v11_Id3V11Tag_GenreEnum::Metal),
            10 => Ok(Id3v11_Id3V11Tag_GenreEnum::NewAge),
            11 => Ok(Id3v11_Id3V11Tag_GenreEnum::Oldies),
            12 => Ok(Id3v11_Id3V11Tag_GenreEnum::Other),
            13 => Ok(Id3v11_Id3V11Tag_GenreEnum::Pop),
            14 => Ok(Id3v11_Id3V11Tag_GenreEnum::Rnb),
            15 => Ok(Id3v11_Id3V11Tag_GenreEnum::Rap),
            16 => Ok(Id3v11_Id3V11Tag_GenreEnum::Reggae),
            17 => Ok(Id3v11_Id3V11Tag_GenreEnum::Rock),
            18 => Ok(Id3v11_Id3V11Tag_GenreEnum::Techno),
            19 => Ok(Id3v11_Id3V11Tag_GenreEnum::Industrial),
            20 => Ok(Id3v11_Id3V11Tag_GenreEnum::Alternative),
            21 => Ok(Id3v11_Id3V11Tag_GenreEnum::Ska),
            22 => Ok(Id3v11_Id3V11Tag_GenreEnum::DeathMetal),
            23 => Ok(Id3v11_Id3V11Tag_GenreEnum::Pranks),
            24 => Ok(Id3v11_Id3V11Tag_GenreEnum::Soundtrack),
            25 => Ok(Id3v11_Id3V11Tag_GenreEnum::EuroTechno),
            26 => Ok(Id3v11_Id3V11Tag_GenreEnum::Ambient),
            27 => Ok(Id3v11_Id3V11Tag_GenreEnum::TripHop),
            28 => Ok(Id3v11_Id3V11Tag_GenreEnum::Vocal),
            29 => Ok(Id3v11_Id3V11Tag_GenreEnum::JazzFunk),
            30 => Ok(Id3v11_Id3V11Tag_GenreEnum::Fusion),
            31 => Ok(Id3v11_Id3V11Tag_GenreEnum::Trance),
            32 => Ok(Id3v11_Id3V11Tag_GenreEnum::Classical),
            33 => Ok(Id3v11_Id3V11Tag_GenreEnum::Instrumental),
            34 => Ok(Id3v11_Id3V11Tag_GenreEnum::Acid),
            35 => Ok(Id3v11_Id3V11Tag_GenreEnum::House),
            36 => Ok(Id3v11_Id3V11Tag_GenreEnum::Game),
            37 => Ok(Id3v11_Id3V11Tag_GenreEnum::SoundClip),
            38 => Ok(Id3v11_Id3V11Tag_GenreEnum::Gospel),
            39 => Ok(Id3v11_Id3V11Tag_GenreEnum::Noise),
            40 => Ok(Id3v11_Id3V11Tag_GenreEnum::Alternrock),
            41 => Ok(Id3v11_Id3V11Tag_GenreEnum::Bass),
            42 => Ok(Id3v11_Id3V11Tag_GenreEnum::Soul),
            43 => Ok(Id3v11_Id3V11Tag_GenreEnum::Punk),
            44 => Ok(Id3v11_Id3V11Tag_GenreEnum::Space),
            45 => Ok(Id3v11_Id3V11Tag_GenreEnum::Meditative),
            46 => Ok(Id3v11_Id3V11Tag_GenreEnum::InstrumentalPop),
            47 => Ok(Id3v11_Id3V11Tag_GenreEnum::InstrumentalRock),
            48 => Ok(Id3v11_Id3V11Tag_GenreEnum::Ethnic),
            49 => Ok(Id3v11_Id3V11Tag_GenreEnum::Gothic),
            50 => Ok(Id3v11_Id3V11Tag_GenreEnum::Darkwave),
            51 => Ok(Id3v11_Id3V11Tag_GenreEnum::TechnoIndustrial),
            52 => Ok(Id3v11_Id3V11Tag_GenreEnum::Electronic),
            53 => Ok(Id3v11_Id3V11Tag_GenreEnum::PopFolk),
            54 => Ok(Id3v11_Id3V11Tag_GenreEnum::Eurodance),
            55 => Ok(Id3v11_Id3V11Tag_GenreEnum::Dream),
            56 => Ok(Id3v11_Id3V11Tag_GenreEnum::SouthernRock),
            57 => Ok(Id3v11_Id3V11Tag_GenreEnum::Comedy),
            58 => Ok(Id3v11_Id3V11Tag_GenreEnum::Cult),
            59 => Ok(Id3v11_Id3V11Tag_GenreEnum::Gangsta),
            60 => Ok(Id3v11_Id3V11Tag_GenreEnum::Top40),
            61 => Ok(Id3v11_Id3V11Tag_GenreEnum::ChristianRap),
            62 => Ok(Id3v11_Id3V11Tag_GenreEnum::PopFunk),
            63 => Ok(Id3v11_Id3V11Tag_GenreEnum::Jungle),
            64 => Ok(Id3v11_Id3V11Tag_GenreEnum::NativeAmerican),
            65 => Ok(Id3v11_Id3V11Tag_GenreEnum::Cabaret),
            66 => Ok(Id3v11_Id3V11Tag_GenreEnum::NewWave),
            67 => Ok(Id3v11_Id3V11Tag_GenreEnum::Psychadelic),
            68 => Ok(Id3v11_Id3V11Tag_GenreEnum::Rave),
            69 => Ok(Id3v11_Id3V11Tag_GenreEnum::Showtunes),
            70 => Ok(Id3v11_Id3V11Tag_GenreEnum::Trailer),
            71 => Ok(Id3v11_Id3V11Tag_GenreEnum::LoFi),
            72 => Ok(Id3v11_Id3V11Tag_GenreEnum::Tribal),
            73 => Ok(Id3v11_Id3V11Tag_GenreEnum::AcidPunk),
            74 => Ok(Id3v11_Id3V11Tag_GenreEnum::AcidJazz),
            75 => Ok(Id3v11_Id3V11Tag_GenreEnum::Polka),
            76 => Ok(Id3v11_Id3V11Tag_GenreEnum::Retro),
            77 => Ok(Id3v11_Id3V11Tag_GenreEnum::Musical),
            78 => Ok(Id3v11_Id3V11Tag_GenreEnum::RockNRoll),
            79 => Ok(Id3v11_Id3V11Tag_GenreEnum::HardRock),
            80 => Ok(Id3v11_Id3V11Tag_GenreEnum::Folk),
            81 => Ok(Id3v11_Id3V11Tag_GenreEnum::FolkRock),
            82 => Ok(Id3v11_Id3V11Tag_GenreEnum::NationalFolk),
            83 => Ok(Id3v11_Id3V11Tag_GenreEnum::Swing),
            84 => Ok(Id3v11_Id3V11Tag_GenreEnum::FastFusion),
            85 => Ok(Id3v11_Id3V11Tag_GenreEnum::Bebob),
            86 => Ok(Id3v11_Id3V11Tag_GenreEnum::Latin),
            87 => Ok(Id3v11_Id3V11Tag_GenreEnum::Revival),
            88 => Ok(Id3v11_Id3V11Tag_GenreEnum::Celtic),
            89 => Ok(Id3v11_Id3V11Tag_GenreEnum::Bluegrass),
            90 => Ok(Id3v11_Id3V11Tag_GenreEnum::Avantgarde),
            91 => Ok(Id3v11_Id3V11Tag_GenreEnum::GothicRock),
            92 => Ok(Id3v11_Id3V11Tag_GenreEnum::ProgressiveRock),
            93 => Ok(Id3v11_Id3V11Tag_GenreEnum::PsychedelicRock),
            94 => Ok(Id3v11_Id3V11Tag_GenreEnum::SymphonicRock),
            95 => Ok(Id3v11_Id3V11Tag_GenreEnum::SlowRock),
            96 => Ok(Id3v11_Id3V11Tag_GenreEnum::BigBand),
            97 => Ok(Id3v11_Id3V11Tag_GenreEnum::Chorus),
            98 => Ok(Id3v11_Id3V11Tag_GenreEnum::EasyListening),
            99 => Ok(Id3v11_Id3V11Tag_GenreEnum::Acoustic),
            100 => Ok(Id3v11_Id3V11Tag_GenreEnum::Humour),
            101 => Ok(Id3v11_Id3V11Tag_GenreEnum::Speech),
            102 => Ok(Id3v11_Id3V11Tag_GenreEnum::Chanson),
            103 => Ok(Id3v11_Id3V11Tag_GenreEnum::Opera),
            104 => Ok(Id3v11_Id3V11Tag_GenreEnum::ChamberMusic),
            105 => Ok(Id3v11_Id3V11Tag_GenreEnum::Sonata),
            106 => Ok(Id3v11_Id3V11Tag_GenreEnum::Symphony),
            107 => Ok(Id3v11_Id3V11Tag_GenreEnum::BootyBass),
            108 => Ok(Id3v11_Id3V11Tag_GenreEnum::Primus),
            109 => Ok(Id3v11_Id3V11Tag_GenreEnum::PornGroove),
            110 => Ok(Id3v11_Id3V11Tag_GenreEnum::Satire),
            111 => Ok(Id3v11_Id3V11Tag_GenreEnum::SlowJam),
            112 => Ok(Id3v11_Id3V11Tag_GenreEnum::Club),
            113 => Ok(Id3v11_Id3V11Tag_GenreEnum::Tango),
            114 => Ok(Id3v11_Id3V11Tag_GenreEnum::Samba),
            115 => Ok(Id3v11_Id3V11Tag_GenreEnum::Folklore),
            116 => Ok(Id3v11_Id3V11Tag_GenreEnum::Ballad),
            117 => Ok(Id3v11_Id3V11Tag_GenreEnum::PowerBallad),
            118 => Ok(Id3v11_Id3V11Tag_GenreEnum::RhythmicSoul),
            119 => Ok(Id3v11_Id3V11Tag_GenreEnum::Freestyle),
            120 => Ok(Id3v11_Id3V11Tag_GenreEnum::Duet),
            121 => Ok(Id3v11_Id3V11Tag_GenreEnum::PunkRock),
            122 => Ok(Id3v11_Id3V11Tag_GenreEnum::DrumSolo),
            123 => Ok(Id3v11_Id3V11Tag_GenreEnum::ACapella),
            124 => Ok(Id3v11_Id3V11Tag_GenreEnum::EuroHouse),
            125 => Ok(Id3v11_Id3V11Tag_GenreEnum::DanceHall),
            _ => Ok(Id3v11_Id3V11Tag_GenreEnum::Unknown(flag)),
        }
    }
}

impl From<&Id3v11_Id3V11Tag_GenreEnum> for i64 {
    fn from(v: &Id3v11_Id3V11Tag_GenreEnum) -> Self {
        match *v {
            Id3v11_Id3V11Tag_GenreEnum::Blues => 0,
            Id3v11_Id3V11Tag_GenreEnum::ClassicRock => 1,
            Id3v11_Id3V11Tag_GenreEnum::Country => 2,
            Id3v11_Id3V11Tag_GenreEnum::Dance => 3,
            Id3v11_Id3V11Tag_GenreEnum::Disco => 4,
            Id3v11_Id3V11Tag_GenreEnum::Funk => 5,
            Id3v11_Id3V11Tag_GenreEnum::Grunge => 6,
            Id3v11_Id3V11Tag_GenreEnum::HipHop => 7,
            Id3v11_Id3V11Tag_GenreEnum::Jazz => 8,
            Id3v11_Id3V11Tag_GenreEnum::Metal => 9,
            Id3v11_Id3V11Tag_GenreEnum::NewAge => 10,
            Id3v11_Id3V11Tag_GenreEnum::Oldies => 11,
            Id3v11_Id3V11Tag_GenreEnum::Other => 12,
            Id3v11_Id3V11Tag_GenreEnum::Pop => 13,
            Id3v11_Id3V11Tag_GenreEnum::Rnb => 14,
            Id3v11_Id3V11Tag_GenreEnum::Rap => 15,
            Id3v11_Id3V11Tag_GenreEnum::Reggae => 16,
            Id3v11_Id3V11Tag_GenreEnum::Rock => 17,
            Id3v11_Id3V11Tag_GenreEnum::Techno => 18,
            Id3v11_Id3V11Tag_GenreEnum::Industrial => 19,
            Id3v11_Id3V11Tag_GenreEnum::Alternative => 20,
            Id3v11_Id3V11Tag_GenreEnum::Ska => 21,
            Id3v11_Id3V11Tag_GenreEnum::DeathMetal => 22,
            Id3v11_Id3V11Tag_GenreEnum::Pranks => 23,
            Id3v11_Id3V11Tag_GenreEnum::Soundtrack => 24,
            Id3v11_Id3V11Tag_GenreEnum::EuroTechno => 25,
            Id3v11_Id3V11Tag_GenreEnum::Ambient => 26,
            Id3v11_Id3V11Tag_GenreEnum::TripHop => 27,
            Id3v11_Id3V11Tag_GenreEnum::Vocal => 28,
            Id3v11_Id3V11Tag_GenreEnum::JazzFunk => 29,
            Id3v11_Id3V11Tag_GenreEnum::Fusion => 30,
            Id3v11_Id3V11Tag_GenreEnum::Trance => 31,
            Id3v11_Id3V11Tag_GenreEnum::Classical => 32,
            Id3v11_Id3V11Tag_GenreEnum::Instrumental => 33,
            Id3v11_Id3V11Tag_GenreEnum::Acid => 34,
            Id3v11_Id3V11Tag_GenreEnum::House => 35,
            Id3v11_Id3V11Tag_GenreEnum::Game => 36,
            Id3v11_Id3V11Tag_GenreEnum::SoundClip => 37,
            Id3v11_Id3V11Tag_GenreEnum::Gospel => 38,
            Id3v11_Id3V11Tag_GenreEnum::Noise => 39,
            Id3v11_Id3V11Tag_GenreEnum::Alternrock => 40,
            Id3v11_Id3V11Tag_GenreEnum::Bass => 41,
            Id3v11_Id3V11Tag_GenreEnum::Soul => 42,
            Id3v11_Id3V11Tag_GenreEnum::Punk => 43,
            Id3v11_Id3V11Tag_GenreEnum::Space => 44,
            Id3v11_Id3V11Tag_GenreEnum::Meditative => 45,
            Id3v11_Id3V11Tag_GenreEnum::InstrumentalPop => 46,
            Id3v11_Id3V11Tag_GenreEnum::InstrumentalRock => 47,
            Id3v11_Id3V11Tag_GenreEnum::Ethnic => 48,
            Id3v11_Id3V11Tag_GenreEnum::Gothic => 49,
            Id3v11_Id3V11Tag_GenreEnum::Darkwave => 50,
            Id3v11_Id3V11Tag_GenreEnum::TechnoIndustrial => 51,
            Id3v11_Id3V11Tag_GenreEnum::Electronic => 52,
            Id3v11_Id3V11Tag_GenreEnum::PopFolk => 53,
            Id3v11_Id3V11Tag_GenreEnum::Eurodance => 54,
            Id3v11_Id3V11Tag_GenreEnum::Dream => 55,
            Id3v11_Id3V11Tag_GenreEnum::SouthernRock => 56,
            Id3v11_Id3V11Tag_GenreEnum::Comedy => 57,
            Id3v11_Id3V11Tag_GenreEnum::Cult => 58,
            Id3v11_Id3V11Tag_GenreEnum::Gangsta => 59,
            Id3v11_Id3V11Tag_GenreEnum::Top40 => 60,
            Id3v11_Id3V11Tag_GenreEnum::ChristianRap => 61,
            Id3v11_Id3V11Tag_GenreEnum::PopFunk => 62,
            Id3v11_Id3V11Tag_GenreEnum::Jungle => 63,
            Id3v11_Id3V11Tag_GenreEnum::NativeAmerican => 64,
            Id3v11_Id3V11Tag_GenreEnum::Cabaret => 65,
            Id3v11_Id3V11Tag_GenreEnum::NewWave => 66,
            Id3v11_Id3V11Tag_GenreEnum::Psychadelic => 67,
            Id3v11_Id3V11Tag_GenreEnum::Rave => 68,
            Id3v11_Id3V11Tag_GenreEnum::Showtunes => 69,
            Id3v11_Id3V11Tag_GenreEnum::Trailer => 70,
            Id3v11_Id3V11Tag_GenreEnum::LoFi => 71,
            Id3v11_Id3V11Tag_GenreEnum::Tribal => 72,
            Id3v11_Id3V11Tag_GenreEnum::AcidPunk => 73,
            Id3v11_Id3V11Tag_GenreEnum::AcidJazz => 74,
            Id3v11_Id3V11Tag_GenreEnum::Polka => 75,
            Id3v11_Id3V11Tag_GenreEnum::Retro => 76,
            Id3v11_Id3V11Tag_GenreEnum::Musical => 77,
            Id3v11_Id3V11Tag_GenreEnum::RockNRoll => 78,
            Id3v11_Id3V11Tag_GenreEnum::HardRock => 79,
            Id3v11_Id3V11Tag_GenreEnum::Folk => 80,
            Id3v11_Id3V11Tag_GenreEnum::FolkRock => 81,
            Id3v11_Id3V11Tag_GenreEnum::NationalFolk => 82,
            Id3v11_Id3V11Tag_GenreEnum::Swing => 83,
            Id3v11_Id3V11Tag_GenreEnum::FastFusion => 84,
            Id3v11_Id3V11Tag_GenreEnum::Bebob => 85,
            Id3v11_Id3V11Tag_GenreEnum::Latin => 86,
            Id3v11_Id3V11Tag_GenreEnum::Revival => 87,
            Id3v11_Id3V11Tag_GenreEnum::Celtic => 88,
            Id3v11_Id3V11Tag_GenreEnum::Bluegrass => 89,
            Id3v11_Id3V11Tag_GenreEnum::Avantgarde => 90,
            Id3v11_Id3V11Tag_GenreEnum::GothicRock => 91,
            Id3v11_Id3V11Tag_GenreEnum::ProgressiveRock => 92,
            Id3v11_Id3V11Tag_GenreEnum::PsychedelicRock => 93,
            Id3v11_Id3V11Tag_GenreEnum::SymphonicRock => 94,
            Id3v11_Id3V11Tag_GenreEnum::SlowRock => 95,
            Id3v11_Id3V11Tag_GenreEnum::BigBand => 96,
            Id3v11_Id3V11Tag_GenreEnum::Chorus => 97,
            Id3v11_Id3V11Tag_GenreEnum::EasyListening => 98,
            Id3v11_Id3V11Tag_GenreEnum::Acoustic => 99,
            Id3v11_Id3V11Tag_GenreEnum::Humour => 100,
            Id3v11_Id3V11Tag_GenreEnum::Speech => 101,
            Id3v11_Id3V11Tag_GenreEnum::Chanson => 102,
            Id3v11_Id3V11Tag_GenreEnum::Opera => 103,
            Id3v11_Id3V11Tag_GenreEnum::ChamberMusic => 104,
            Id3v11_Id3V11Tag_GenreEnum::Sonata => 105,
            Id3v11_Id3V11Tag_GenreEnum::Symphony => 106,
            Id3v11_Id3V11Tag_GenreEnum::BootyBass => 107,
            Id3v11_Id3V11Tag_GenreEnum::Primus => 108,
            Id3v11_Id3V11Tag_GenreEnum::PornGroove => 109,
            Id3v11_Id3V11Tag_GenreEnum::Satire => 110,
            Id3v11_Id3V11Tag_GenreEnum::SlowJam => 111,
            Id3v11_Id3V11Tag_GenreEnum::Club => 112,
            Id3v11_Id3V11Tag_GenreEnum::Tango => 113,
            Id3v11_Id3V11Tag_GenreEnum::Samba => 114,
            Id3v11_Id3V11Tag_GenreEnum::Folklore => 115,
            Id3v11_Id3V11Tag_GenreEnum::Ballad => 116,
            Id3v11_Id3V11Tag_GenreEnum::PowerBallad => 117,
            Id3v11_Id3V11Tag_GenreEnum::RhythmicSoul => 118,
            Id3v11_Id3V11Tag_GenreEnum::Freestyle => 119,
            Id3v11_Id3V11Tag_GenreEnum::Duet => 120,
            Id3v11_Id3V11Tag_GenreEnum::PunkRock => 121,
            Id3v11_Id3V11Tag_GenreEnum::DrumSolo => 122,
            Id3v11_Id3V11Tag_GenreEnum::ACapella => 123,
            Id3v11_Id3V11Tag_GenreEnum::EuroHouse => 124,
            Id3v11_Id3V11Tag_GenreEnum::DanceHall => 125,
            Id3v11_Id3V11Tag_GenreEnum::Unknown(v) => v
        }
    }
}

impl Default for Id3v11_Id3V11Tag_GenreEnum {
    fn default() -> Self { Id3v11_Id3V11Tag_GenreEnum::Unknown(0) }
}


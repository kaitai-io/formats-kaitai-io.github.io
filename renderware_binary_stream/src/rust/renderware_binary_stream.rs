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
 * \sa https://gtamods.com/wiki/RenderWare_binary_stream_file Source
 */

#[derive(Default, Debug, Clone)]
pub struct RenderwareBinaryStream {
    pub _root: SharedType<RenderwareBinaryStream>,
    pub _parent: SharedType<RenderwareBinaryStream>,
    pub _self: SharedType<Self>,
    code: RefCell<RenderwareBinaryStream_Sections>,
    size: RefCell<u32>,
    library_id_stamp: RefCell<u32>,
    body: RefCell<Option<RenderwareBinaryStream_Body>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
    f_version: Cell<bool>,
    version: RefCell<i32>,
}
#[derive(Debug, Clone)]
pub enum RenderwareBinaryStream_Body {
    RenderwareBinaryStream_ListWithHeader(OptRc<RenderwareBinaryStream_ListWithHeader>),
    Bytes(Vec<u8>),
}
impl From<&RenderwareBinaryStream_Body> for OptRc<RenderwareBinaryStream_ListWithHeader> {
    fn from(v: &RenderwareBinaryStream_Body) -> Self {
        if let RenderwareBinaryStream_Body::RenderwareBinaryStream_ListWithHeader(x) = v {
            return x.clone();
        }
        panic!("expected RenderwareBinaryStream_Body::RenderwareBinaryStream_ListWithHeader, got {:?}", v)
    }
}
impl From<OptRc<RenderwareBinaryStream_ListWithHeader>> for RenderwareBinaryStream_Body {
    fn from(v: OptRc<RenderwareBinaryStream_ListWithHeader>) -> Self {
        Self::RenderwareBinaryStream_ListWithHeader(v)
    }
}
impl From<&RenderwareBinaryStream_Body> for Vec<u8> {
    fn from(v: &RenderwareBinaryStream_Body) -> Self {
        if let RenderwareBinaryStream_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected RenderwareBinaryStream_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for RenderwareBinaryStream_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl KStruct for RenderwareBinaryStream {
    type Root = RenderwareBinaryStream;
    type Parent = RenderwareBinaryStream;

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
        *self_rc.code.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        *self_rc.size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.library_id_stamp.borrow_mut() = _io.read_u4le()?.into();
        match *self_rc.code() {
            RenderwareBinaryStream_Sections::Atomic => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.size() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, RenderwareBinaryStream_ListWithHeader>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            RenderwareBinaryStream_Sections::Clump => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.size() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, RenderwareBinaryStream_ListWithHeader>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            RenderwareBinaryStream_Sections::FrameList => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.size() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, RenderwareBinaryStream_ListWithHeader>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            RenderwareBinaryStream_Sections::Geometry => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.size() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, RenderwareBinaryStream_ListWithHeader>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            RenderwareBinaryStream_Sections::GeometryList => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.size() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, RenderwareBinaryStream_ListWithHeader>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            RenderwareBinaryStream_Sections::TextureDictionary => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.size() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, RenderwareBinaryStream_ListWithHeader>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            RenderwareBinaryStream_Sections::TextureNative => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.size() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, RenderwareBinaryStream_ListWithHeader>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.body.borrow_mut() = Some(_io.read_bytes(*self_rc.size() as usize)?.into());
            }
        }
        Ok(())
    }
}
impl RenderwareBinaryStream {
    pub fn version(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_version.get() {
            return Ok(self.version.borrow());
        }
        self.f_version.set(true);
        *self.version.borrow_mut() = (if ((((*self.library_id_stamp() as i32) & (4294901760 as i32)) as i32) != (0 as i32)) { ((((((((*self.library_id_stamp() as u32) >> (14 as u32)) as i32) & (261888 as i32)) as i32) + (196608 as i32)) as i32) | (((((*self.library_id_stamp() as u32) >> (16 as u32)) as i32) & (63 as i32)) as i32)) } else { ((*self.library_id_stamp() as u32) << (8 as u32)) }) as i32;
        Ok(self.version.borrow())
    }
}
impl RenderwareBinaryStream {
    pub fn code(&self) -> Ref<'_, RenderwareBinaryStream_Sections> {
        self.code.borrow()
    }
}
impl RenderwareBinaryStream {
    pub fn size(&self) -> Ref<'_, u32> {
        self.size.borrow()
    }
}
impl RenderwareBinaryStream {
    pub fn library_id_stamp(&self) -> Ref<'_, u32> {
        self.library_id_stamp.borrow()
    }
}
impl RenderwareBinaryStream {
    pub fn body(&self) -> Ref<'_, Option<RenderwareBinaryStream_Body>> {
        self.body.borrow()
    }
}
impl RenderwareBinaryStream {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl RenderwareBinaryStream {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum RenderwareBinaryStream_Sections {
    Struct,
    String,
    Extension,
    Camera,
    Texture,
    Material,
    MaterialList,
    AtomicSection,
    PlaneSection,
    World,
    Spline,
    Matrix,
    FrameList,
    Geometry,
    Clump,
    Light,
    UnicodeString,
    Atomic,
    TextureNative,
    TextureDictionary,
    AnimationDatabase,
    Image,
    SkinAnimation,
    GeometryList,
    AnimAnimation,
    Team,
    Crowd,
    DeltaMorphAnimation,
    RightToRender,
    MultitextureEffectNative,
    MultitextureEffectDictionary,
    TeamDictionary,
    PlatformIndependentTextureDictionary,
    TableOfContents,
    ParticleStandardGlobalData,
    Altpipe,
    PlatformIndependentPeds,
    PatchMesh,
    ChunkGroupStart,
    ChunkGroupEnd,
    UvAnimationDictionary,
    CollTree,
    MetricsPlg,
    SplinePlg,
    StereoPlg,
    VrmlPlg,
    MorphPlg,
    PvsPlg,
    MemoryLeakPlg,
    AnimationPlg,
    GlossPlg,
    LogoPlg,
    MemoryInfoPlg,
    RandomPlg,
    PngImagePlg,
    BonePlg,
    VrmlAnimPlg,
    SkyMipmapVal,
    MrmPlg,
    LodAtomicPlg,
    MePlg,
    LightmapPlg,
    RefinePlg,
    SkinPlg,
    LabelPlg,
    ParticlesPlg,
    GeomtxPlg,
    SynthCorePlg,
    StqppPlg,
    PartPpPlg,
    CollisionPlg,
    HanimPlg,
    UserDataPlg,
    MaterialEffectsPlg,
    ParticleSystemPlg,
    DeltaMorphPlg,
    PatchPlg,
    TeamPlg,
    CrowdPpPlg,
    MipSplitPlg,
    AnisotropyPlg,
    GcnMaterialPlg,
    GeometricPvsPlg,
    XboxMaterialPlg,
    MultiTexturePlg,
    ChainPlg,
    ToonPlg,
    PtankPlg,
    ParticleStandardPlg,
    PdsPlg,
    PrtadvPlg,
    NormalMapPlg,
    AdcPlg,
    UvAnimationPlg,
    CharacterSetPlg,
    NohsWorldPlg,
    ImportUtilPlg,
    SlerpPlg,
    OptimPlg,
    TlWorldPlg,
    DatabasePlg,
    RaytracePlg,
    RayPlg,
    LibraryPlg,
    Plg2d,
    TileRenderPlg,
    JpegImagePlg,
    TgaImagePlg,
    GifImagePlg,
    QuatPlg,
    SplinePvsPlg,
    MipmapPlg,
    MipmapkPlg,
    Font2d,
    IntersectionPlg,
    TiffImagePlg,
    PickPlg,
    BmpImagePlg,
    RasImagePlg,
    SkinFxPlg,
    VcatPlg,
    Path2d,
    Brush2d,
    Object2d,
    Shape2d,
    Scene2d,
    PickRegion2d,
    ObjectString2d,
    AnimationPlg2d,
    Animation2d,
    Keyframe2d,
    Maestro2d,
    Barycentric,
    PlatformIndependentTextureDictionaryTk,
    TocTk,
    TplTk,
    AltpipeTk,
    AnimationTk,
    SkinSplitTookit,
    CompressedKeyTk,
    GeometryConditioningPlg,
    WingPlg,
    GenericPipelineTk,
    LightmapConversionTk,
    FilesystemPlg,
    DictionaryTk,
    UvAnimationLinear,
    UvAnimationParameter,
    BinMeshPlg,
    NativeDataPlg,
    ZmodelerLock,
    AtomicVisibilityDistance,
    ClumpVisibilityDistance,
    FrameVisibilityDistance,
    PipelineSet,
    Unused5,
    TexdictionaryLink,
    SpecularMaterial,
    Unused8,
    Effect2d,
    ExtraVertColour,
    CollisionModel,
    GtaHanim,
    ReflectionMaterial,
    Breakable,
    Frame,
    Unused16,
    Unknown(i64),
}

impl TryFrom<i64> for RenderwareBinaryStream_Sections {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<RenderwareBinaryStream_Sections> {
        match flag {
            1 => Ok(RenderwareBinaryStream_Sections::Struct),
            2 => Ok(RenderwareBinaryStream_Sections::String),
            3 => Ok(RenderwareBinaryStream_Sections::Extension),
            5 => Ok(RenderwareBinaryStream_Sections::Camera),
            6 => Ok(RenderwareBinaryStream_Sections::Texture),
            7 => Ok(RenderwareBinaryStream_Sections::Material),
            8 => Ok(RenderwareBinaryStream_Sections::MaterialList),
            9 => Ok(RenderwareBinaryStream_Sections::AtomicSection),
            10 => Ok(RenderwareBinaryStream_Sections::PlaneSection),
            11 => Ok(RenderwareBinaryStream_Sections::World),
            12 => Ok(RenderwareBinaryStream_Sections::Spline),
            13 => Ok(RenderwareBinaryStream_Sections::Matrix),
            14 => Ok(RenderwareBinaryStream_Sections::FrameList),
            15 => Ok(RenderwareBinaryStream_Sections::Geometry),
            16 => Ok(RenderwareBinaryStream_Sections::Clump),
            18 => Ok(RenderwareBinaryStream_Sections::Light),
            19 => Ok(RenderwareBinaryStream_Sections::UnicodeString),
            20 => Ok(RenderwareBinaryStream_Sections::Atomic),
            21 => Ok(RenderwareBinaryStream_Sections::TextureNative),
            22 => Ok(RenderwareBinaryStream_Sections::TextureDictionary),
            23 => Ok(RenderwareBinaryStream_Sections::AnimationDatabase),
            24 => Ok(RenderwareBinaryStream_Sections::Image),
            25 => Ok(RenderwareBinaryStream_Sections::SkinAnimation),
            26 => Ok(RenderwareBinaryStream_Sections::GeometryList),
            27 => Ok(RenderwareBinaryStream_Sections::AnimAnimation),
            28 => Ok(RenderwareBinaryStream_Sections::Team),
            29 => Ok(RenderwareBinaryStream_Sections::Crowd),
            30 => Ok(RenderwareBinaryStream_Sections::DeltaMorphAnimation),
            31 => Ok(RenderwareBinaryStream_Sections::RightToRender),
            32 => Ok(RenderwareBinaryStream_Sections::MultitextureEffectNative),
            33 => Ok(RenderwareBinaryStream_Sections::MultitextureEffectDictionary),
            34 => Ok(RenderwareBinaryStream_Sections::TeamDictionary),
            35 => Ok(RenderwareBinaryStream_Sections::PlatformIndependentTextureDictionary),
            36 => Ok(RenderwareBinaryStream_Sections::TableOfContents),
            37 => Ok(RenderwareBinaryStream_Sections::ParticleStandardGlobalData),
            38 => Ok(RenderwareBinaryStream_Sections::Altpipe),
            39 => Ok(RenderwareBinaryStream_Sections::PlatformIndependentPeds),
            40 => Ok(RenderwareBinaryStream_Sections::PatchMesh),
            41 => Ok(RenderwareBinaryStream_Sections::ChunkGroupStart),
            42 => Ok(RenderwareBinaryStream_Sections::ChunkGroupEnd),
            43 => Ok(RenderwareBinaryStream_Sections::UvAnimationDictionary),
            44 => Ok(RenderwareBinaryStream_Sections::CollTree),
            257 => Ok(RenderwareBinaryStream_Sections::MetricsPlg),
            258 => Ok(RenderwareBinaryStream_Sections::SplinePlg),
            259 => Ok(RenderwareBinaryStream_Sections::StereoPlg),
            260 => Ok(RenderwareBinaryStream_Sections::VrmlPlg),
            261 => Ok(RenderwareBinaryStream_Sections::MorphPlg),
            262 => Ok(RenderwareBinaryStream_Sections::PvsPlg),
            263 => Ok(RenderwareBinaryStream_Sections::MemoryLeakPlg),
            264 => Ok(RenderwareBinaryStream_Sections::AnimationPlg),
            265 => Ok(RenderwareBinaryStream_Sections::GlossPlg),
            266 => Ok(RenderwareBinaryStream_Sections::LogoPlg),
            267 => Ok(RenderwareBinaryStream_Sections::MemoryInfoPlg),
            268 => Ok(RenderwareBinaryStream_Sections::RandomPlg),
            269 => Ok(RenderwareBinaryStream_Sections::PngImagePlg),
            270 => Ok(RenderwareBinaryStream_Sections::BonePlg),
            271 => Ok(RenderwareBinaryStream_Sections::VrmlAnimPlg),
            272 => Ok(RenderwareBinaryStream_Sections::SkyMipmapVal),
            273 => Ok(RenderwareBinaryStream_Sections::MrmPlg),
            274 => Ok(RenderwareBinaryStream_Sections::LodAtomicPlg),
            275 => Ok(RenderwareBinaryStream_Sections::MePlg),
            276 => Ok(RenderwareBinaryStream_Sections::LightmapPlg),
            277 => Ok(RenderwareBinaryStream_Sections::RefinePlg),
            278 => Ok(RenderwareBinaryStream_Sections::SkinPlg),
            279 => Ok(RenderwareBinaryStream_Sections::LabelPlg),
            280 => Ok(RenderwareBinaryStream_Sections::ParticlesPlg),
            281 => Ok(RenderwareBinaryStream_Sections::GeomtxPlg),
            282 => Ok(RenderwareBinaryStream_Sections::SynthCorePlg),
            283 => Ok(RenderwareBinaryStream_Sections::StqppPlg),
            284 => Ok(RenderwareBinaryStream_Sections::PartPpPlg),
            285 => Ok(RenderwareBinaryStream_Sections::CollisionPlg),
            286 => Ok(RenderwareBinaryStream_Sections::HanimPlg),
            287 => Ok(RenderwareBinaryStream_Sections::UserDataPlg),
            288 => Ok(RenderwareBinaryStream_Sections::MaterialEffectsPlg),
            289 => Ok(RenderwareBinaryStream_Sections::ParticleSystemPlg),
            290 => Ok(RenderwareBinaryStream_Sections::DeltaMorphPlg),
            291 => Ok(RenderwareBinaryStream_Sections::PatchPlg),
            292 => Ok(RenderwareBinaryStream_Sections::TeamPlg),
            293 => Ok(RenderwareBinaryStream_Sections::CrowdPpPlg),
            294 => Ok(RenderwareBinaryStream_Sections::MipSplitPlg),
            295 => Ok(RenderwareBinaryStream_Sections::AnisotropyPlg),
            297 => Ok(RenderwareBinaryStream_Sections::GcnMaterialPlg),
            298 => Ok(RenderwareBinaryStream_Sections::GeometricPvsPlg),
            299 => Ok(RenderwareBinaryStream_Sections::XboxMaterialPlg),
            300 => Ok(RenderwareBinaryStream_Sections::MultiTexturePlg),
            301 => Ok(RenderwareBinaryStream_Sections::ChainPlg),
            302 => Ok(RenderwareBinaryStream_Sections::ToonPlg),
            303 => Ok(RenderwareBinaryStream_Sections::PtankPlg),
            304 => Ok(RenderwareBinaryStream_Sections::ParticleStandardPlg),
            305 => Ok(RenderwareBinaryStream_Sections::PdsPlg),
            306 => Ok(RenderwareBinaryStream_Sections::PrtadvPlg),
            307 => Ok(RenderwareBinaryStream_Sections::NormalMapPlg),
            308 => Ok(RenderwareBinaryStream_Sections::AdcPlg),
            309 => Ok(RenderwareBinaryStream_Sections::UvAnimationPlg),
            384 => Ok(RenderwareBinaryStream_Sections::CharacterSetPlg),
            385 => Ok(RenderwareBinaryStream_Sections::NohsWorldPlg),
            386 => Ok(RenderwareBinaryStream_Sections::ImportUtilPlg),
            387 => Ok(RenderwareBinaryStream_Sections::SlerpPlg),
            388 => Ok(RenderwareBinaryStream_Sections::OptimPlg),
            389 => Ok(RenderwareBinaryStream_Sections::TlWorldPlg),
            390 => Ok(RenderwareBinaryStream_Sections::DatabasePlg),
            391 => Ok(RenderwareBinaryStream_Sections::RaytracePlg),
            392 => Ok(RenderwareBinaryStream_Sections::RayPlg),
            393 => Ok(RenderwareBinaryStream_Sections::LibraryPlg),
            400 => Ok(RenderwareBinaryStream_Sections::Plg2d),
            401 => Ok(RenderwareBinaryStream_Sections::TileRenderPlg),
            402 => Ok(RenderwareBinaryStream_Sections::JpegImagePlg),
            403 => Ok(RenderwareBinaryStream_Sections::TgaImagePlg),
            404 => Ok(RenderwareBinaryStream_Sections::GifImagePlg),
            405 => Ok(RenderwareBinaryStream_Sections::QuatPlg),
            406 => Ok(RenderwareBinaryStream_Sections::SplinePvsPlg),
            407 => Ok(RenderwareBinaryStream_Sections::MipmapPlg),
            408 => Ok(RenderwareBinaryStream_Sections::MipmapkPlg),
            409 => Ok(RenderwareBinaryStream_Sections::Font2d),
            410 => Ok(RenderwareBinaryStream_Sections::IntersectionPlg),
            411 => Ok(RenderwareBinaryStream_Sections::TiffImagePlg),
            412 => Ok(RenderwareBinaryStream_Sections::PickPlg),
            413 => Ok(RenderwareBinaryStream_Sections::BmpImagePlg),
            414 => Ok(RenderwareBinaryStream_Sections::RasImagePlg),
            415 => Ok(RenderwareBinaryStream_Sections::SkinFxPlg),
            416 => Ok(RenderwareBinaryStream_Sections::VcatPlg),
            417 => Ok(RenderwareBinaryStream_Sections::Path2d),
            418 => Ok(RenderwareBinaryStream_Sections::Brush2d),
            419 => Ok(RenderwareBinaryStream_Sections::Object2d),
            420 => Ok(RenderwareBinaryStream_Sections::Shape2d),
            421 => Ok(RenderwareBinaryStream_Sections::Scene2d),
            422 => Ok(RenderwareBinaryStream_Sections::PickRegion2d),
            423 => Ok(RenderwareBinaryStream_Sections::ObjectString2d),
            424 => Ok(RenderwareBinaryStream_Sections::AnimationPlg2d),
            425 => Ok(RenderwareBinaryStream_Sections::Animation2d),
            432 => Ok(RenderwareBinaryStream_Sections::Keyframe2d),
            433 => Ok(RenderwareBinaryStream_Sections::Maestro2d),
            434 => Ok(RenderwareBinaryStream_Sections::Barycentric),
            435 => Ok(RenderwareBinaryStream_Sections::PlatformIndependentTextureDictionaryTk),
            436 => Ok(RenderwareBinaryStream_Sections::TocTk),
            437 => Ok(RenderwareBinaryStream_Sections::TplTk),
            438 => Ok(RenderwareBinaryStream_Sections::AltpipeTk),
            439 => Ok(RenderwareBinaryStream_Sections::AnimationTk),
            440 => Ok(RenderwareBinaryStream_Sections::SkinSplitTookit),
            441 => Ok(RenderwareBinaryStream_Sections::CompressedKeyTk),
            442 => Ok(RenderwareBinaryStream_Sections::GeometryConditioningPlg),
            443 => Ok(RenderwareBinaryStream_Sections::WingPlg),
            444 => Ok(RenderwareBinaryStream_Sections::GenericPipelineTk),
            445 => Ok(RenderwareBinaryStream_Sections::LightmapConversionTk),
            446 => Ok(RenderwareBinaryStream_Sections::FilesystemPlg),
            447 => Ok(RenderwareBinaryStream_Sections::DictionaryTk),
            448 => Ok(RenderwareBinaryStream_Sections::UvAnimationLinear),
            449 => Ok(RenderwareBinaryStream_Sections::UvAnimationParameter),
            1294 => Ok(RenderwareBinaryStream_Sections::BinMeshPlg),
            1296 => Ok(RenderwareBinaryStream_Sections::NativeDataPlg),
            61982 => Ok(RenderwareBinaryStream_Sections::ZmodelerLock),
            39055872 => Ok(RenderwareBinaryStream_Sections::AtomicVisibilityDistance),
            39055873 => Ok(RenderwareBinaryStream_Sections::ClumpVisibilityDistance),
            39055874 => Ok(RenderwareBinaryStream_Sections::FrameVisibilityDistance),
            39056115 => Ok(RenderwareBinaryStream_Sections::PipelineSet),
            39056116 => Ok(RenderwareBinaryStream_Sections::Unused5),
            39056117 => Ok(RenderwareBinaryStream_Sections::TexdictionaryLink),
            39056118 => Ok(RenderwareBinaryStream_Sections::SpecularMaterial),
            39056119 => Ok(RenderwareBinaryStream_Sections::Unused8),
            39056120 => Ok(RenderwareBinaryStream_Sections::Effect2d),
            39056121 => Ok(RenderwareBinaryStream_Sections::ExtraVertColour),
            39056122 => Ok(RenderwareBinaryStream_Sections::CollisionModel),
            39056123 => Ok(RenderwareBinaryStream_Sections::GtaHanim),
            39056124 => Ok(RenderwareBinaryStream_Sections::ReflectionMaterial),
            39056125 => Ok(RenderwareBinaryStream_Sections::Breakable),
            39056126 => Ok(RenderwareBinaryStream_Sections::Frame),
            39056127 => Ok(RenderwareBinaryStream_Sections::Unused16),
            _ => Ok(RenderwareBinaryStream_Sections::Unknown(flag)),
        }
    }
}

impl From<&RenderwareBinaryStream_Sections> for i64 {
    fn from(v: &RenderwareBinaryStream_Sections) -> Self {
        match *v {
            RenderwareBinaryStream_Sections::Struct => 1,
            RenderwareBinaryStream_Sections::String => 2,
            RenderwareBinaryStream_Sections::Extension => 3,
            RenderwareBinaryStream_Sections::Camera => 5,
            RenderwareBinaryStream_Sections::Texture => 6,
            RenderwareBinaryStream_Sections::Material => 7,
            RenderwareBinaryStream_Sections::MaterialList => 8,
            RenderwareBinaryStream_Sections::AtomicSection => 9,
            RenderwareBinaryStream_Sections::PlaneSection => 10,
            RenderwareBinaryStream_Sections::World => 11,
            RenderwareBinaryStream_Sections::Spline => 12,
            RenderwareBinaryStream_Sections::Matrix => 13,
            RenderwareBinaryStream_Sections::FrameList => 14,
            RenderwareBinaryStream_Sections::Geometry => 15,
            RenderwareBinaryStream_Sections::Clump => 16,
            RenderwareBinaryStream_Sections::Light => 18,
            RenderwareBinaryStream_Sections::UnicodeString => 19,
            RenderwareBinaryStream_Sections::Atomic => 20,
            RenderwareBinaryStream_Sections::TextureNative => 21,
            RenderwareBinaryStream_Sections::TextureDictionary => 22,
            RenderwareBinaryStream_Sections::AnimationDatabase => 23,
            RenderwareBinaryStream_Sections::Image => 24,
            RenderwareBinaryStream_Sections::SkinAnimation => 25,
            RenderwareBinaryStream_Sections::GeometryList => 26,
            RenderwareBinaryStream_Sections::AnimAnimation => 27,
            RenderwareBinaryStream_Sections::Team => 28,
            RenderwareBinaryStream_Sections::Crowd => 29,
            RenderwareBinaryStream_Sections::DeltaMorphAnimation => 30,
            RenderwareBinaryStream_Sections::RightToRender => 31,
            RenderwareBinaryStream_Sections::MultitextureEffectNative => 32,
            RenderwareBinaryStream_Sections::MultitextureEffectDictionary => 33,
            RenderwareBinaryStream_Sections::TeamDictionary => 34,
            RenderwareBinaryStream_Sections::PlatformIndependentTextureDictionary => 35,
            RenderwareBinaryStream_Sections::TableOfContents => 36,
            RenderwareBinaryStream_Sections::ParticleStandardGlobalData => 37,
            RenderwareBinaryStream_Sections::Altpipe => 38,
            RenderwareBinaryStream_Sections::PlatformIndependentPeds => 39,
            RenderwareBinaryStream_Sections::PatchMesh => 40,
            RenderwareBinaryStream_Sections::ChunkGroupStart => 41,
            RenderwareBinaryStream_Sections::ChunkGroupEnd => 42,
            RenderwareBinaryStream_Sections::UvAnimationDictionary => 43,
            RenderwareBinaryStream_Sections::CollTree => 44,
            RenderwareBinaryStream_Sections::MetricsPlg => 257,
            RenderwareBinaryStream_Sections::SplinePlg => 258,
            RenderwareBinaryStream_Sections::StereoPlg => 259,
            RenderwareBinaryStream_Sections::VrmlPlg => 260,
            RenderwareBinaryStream_Sections::MorphPlg => 261,
            RenderwareBinaryStream_Sections::PvsPlg => 262,
            RenderwareBinaryStream_Sections::MemoryLeakPlg => 263,
            RenderwareBinaryStream_Sections::AnimationPlg => 264,
            RenderwareBinaryStream_Sections::GlossPlg => 265,
            RenderwareBinaryStream_Sections::LogoPlg => 266,
            RenderwareBinaryStream_Sections::MemoryInfoPlg => 267,
            RenderwareBinaryStream_Sections::RandomPlg => 268,
            RenderwareBinaryStream_Sections::PngImagePlg => 269,
            RenderwareBinaryStream_Sections::BonePlg => 270,
            RenderwareBinaryStream_Sections::VrmlAnimPlg => 271,
            RenderwareBinaryStream_Sections::SkyMipmapVal => 272,
            RenderwareBinaryStream_Sections::MrmPlg => 273,
            RenderwareBinaryStream_Sections::LodAtomicPlg => 274,
            RenderwareBinaryStream_Sections::MePlg => 275,
            RenderwareBinaryStream_Sections::LightmapPlg => 276,
            RenderwareBinaryStream_Sections::RefinePlg => 277,
            RenderwareBinaryStream_Sections::SkinPlg => 278,
            RenderwareBinaryStream_Sections::LabelPlg => 279,
            RenderwareBinaryStream_Sections::ParticlesPlg => 280,
            RenderwareBinaryStream_Sections::GeomtxPlg => 281,
            RenderwareBinaryStream_Sections::SynthCorePlg => 282,
            RenderwareBinaryStream_Sections::StqppPlg => 283,
            RenderwareBinaryStream_Sections::PartPpPlg => 284,
            RenderwareBinaryStream_Sections::CollisionPlg => 285,
            RenderwareBinaryStream_Sections::HanimPlg => 286,
            RenderwareBinaryStream_Sections::UserDataPlg => 287,
            RenderwareBinaryStream_Sections::MaterialEffectsPlg => 288,
            RenderwareBinaryStream_Sections::ParticleSystemPlg => 289,
            RenderwareBinaryStream_Sections::DeltaMorphPlg => 290,
            RenderwareBinaryStream_Sections::PatchPlg => 291,
            RenderwareBinaryStream_Sections::TeamPlg => 292,
            RenderwareBinaryStream_Sections::CrowdPpPlg => 293,
            RenderwareBinaryStream_Sections::MipSplitPlg => 294,
            RenderwareBinaryStream_Sections::AnisotropyPlg => 295,
            RenderwareBinaryStream_Sections::GcnMaterialPlg => 297,
            RenderwareBinaryStream_Sections::GeometricPvsPlg => 298,
            RenderwareBinaryStream_Sections::XboxMaterialPlg => 299,
            RenderwareBinaryStream_Sections::MultiTexturePlg => 300,
            RenderwareBinaryStream_Sections::ChainPlg => 301,
            RenderwareBinaryStream_Sections::ToonPlg => 302,
            RenderwareBinaryStream_Sections::PtankPlg => 303,
            RenderwareBinaryStream_Sections::ParticleStandardPlg => 304,
            RenderwareBinaryStream_Sections::PdsPlg => 305,
            RenderwareBinaryStream_Sections::PrtadvPlg => 306,
            RenderwareBinaryStream_Sections::NormalMapPlg => 307,
            RenderwareBinaryStream_Sections::AdcPlg => 308,
            RenderwareBinaryStream_Sections::UvAnimationPlg => 309,
            RenderwareBinaryStream_Sections::CharacterSetPlg => 384,
            RenderwareBinaryStream_Sections::NohsWorldPlg => 385,
            RenderwareBinaryStream_Sections::ImportUtilPlg => 386,
            RenderwareBinaryStream_Sections::SlerpPlg => 387,
            RenderwareBinaryStream_Sections::OptimPlg => 388,
            RenderwareBinaryStream_Sections::TlWorldPlg => 389,
            RenderwareBinaryStream_Sections::DatabasePlg => 390,
            RenderwareBinaryStream_Sections::RaytracePlg => 391,
            RenderwareBinaryStream_Sections::RayPlg => 392,
            RenderwareBinaryStream_Sections::LibraryPlg => 393,
            RenderwareBinaryStream_Sections::Plg2d => 400,
            RenderwareBinaryStream_Sections::TileRenderPlg => 401,
            RenderwareBinaryStream_Sections::JpegImagePlg => 402,
            RenderwareBinaryStream_Sections::TgaImagePlg => 403,
            RenderwareBinaryStream_Sections::GifImagePlg => 404,
            RenderwareBinaryStream_Sections::QuatPlg => 405,
            RenderwareBinaryStream_Sections::SplinePvsPlg => 406,
            RenderwareBinaryStream_Sections::MipmapPlg => 407,
            RenderwareBinaryStream_Sections::MipmapkPlg => 408,
            RenderwareBinaryStream_Sections::Font2d => 409,
            RenderwareBinaryStream_Sections::IntersectionPlg => 410,
            RenderwareBinaryStream_Sections::TiffImagePlg => 411,
            RenderwareBinaryStream_Sections::PickPlg => 412,
            RenderwareBinaryStream_Sections::BmpImagePlg => 413,
            RenderwareBinaryStream_Sections::RasImagePlg => 414,
            RenderwareBinaryStream_Sections::SkinFxPlg => 415,
            RenderwareBinaryStream_Sections::VcatPlg => 416,
            RenderwareBinaryStream_Sections::Path2d => 417,
            RenderwareBinaryStream_Sections::Brush2d => 418,
            RenderwareBinaryStream_Sections::Object2d => 419,
            RenderwareBinaryStream_Sections::Shape2d => 420,
            RenderwareBinaryStream_Sections::Scene2d => 421,
            RenderwareBinaryStream_Sections::PickRegion2d => 422,
            RenderwareBinaryStream_Sections::ObjectString2d => 423,
            RenderwareBinaryStream_Sections::AnimationPlg2d => 424,
            RenderwareBinaryStream_Sections::Animation2d => 425,
            RenderwareBinaryStream_Sections::Keyframe2d => 432,
            RenderwareBinaryStream_Sections::Maestro2d => 433,
            RenderwareBinaryStream_Sections::Barycentric => 434,
            RenderwareBinaryStream_Sections::PlatformIndependentTextureDictionaryTk => 435,
            RenderwareBinaryStream_Sections::TocTk => 436,
            RenderwareBinaryStream_Sections::TplTk => 437,
            RenderwareBinaryStream_Sections::AltpipeTk => 438,
            RenderwareBinaryStream_Sections::AnimationTk => 439,
            RenderwareBinaryStream_Sections::SkinSplitTookit => 440,
            RenderwareBinaryStream_Sections::CompressedKeyTk => 441,
            RenderwareBinaryStream_Sections::GeometryConditioningPlg => 442,
            RenderwareBinaryStream_Sections::WingPlg => 443,
            RenderwareBinaryStream_Sections::GenericPipelineTk => 444,
            RenderwareBinaryStream_Sections::LightmapConversionTk => 445,
            RenderwareBinaryStream_Sections::FilesystemPlg => 446,
            RenderwareBinaryStream_Sections::DictionaryTk => 447,
            RenderwareBinaryStream_Sections::UvAnimationLinear => 448,
            RenderwareBinaryStream_Sections::UvAnimationParameter => 449,
            RenderwareBinaryStream_Sections::BinMeshPlg => 1294,
            RenderwareBinaryStream_Sections::NativeDataPlg => 1296,
            RenderwareBinaryStream_Sections::ZmodelerLock => 61982,
            RenderwareBinaryStream_Sections::AtomicVisibilityDistance => 39055872,
            RenderwareBinaryStream_Sections::ClumpVisibilityDistance => 39055873,
            RenderwareBinaryStream_Sections::FrameVisibilityDistance => 39055874,
            RenderwareBinaryStream_Sections::PipelineSet => 39056115,
            RenderwareBinaryStream_Sections::Unused5 => 39056116,
            RenderwareBinaryStream_Sections::TexdictionaryLink => 39056117,
            RenderwareBinaryStream_Sections::SpecularMaterial => 39056118,
            RenderwareBinaryStream_Sections::Unused8 => 39056119,
            RenderwareBinaryStream_Sections::Effect2d => 39056120,
            RenderwareBinaryStream_Sections::ExtraVertColour => 39056121,
            RenderwareBinaryStream_Sections::CollisionModel => 39056122,
            RenderwareBinaryStream_Sections::GtaHanim => 39056123,
            RenderwareBinaryStream_Sections::ReflectionMaterial => 39056124,
            RenderwareBinaryStream_Sections::Breakable => 39056125,
            RenderwareBinaryStream_Sections::Frame => 39056126,
            RenderwareBinaryStream_Sections::Unused16 => 39056127,
            RenderwareBinaryStream_Sections::Unknown(v) => v
        }
    }
}

impl Default for RenderwareBinaryStream_Sections {
    fn default() -> Self { RenderwareBinaryStream_Sections::Unknown(0) }
}


/**
 * \sa https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure Source
 */

#[derive(Default, Debug, Clone)]
pub struct RenderwareBinaryStream_Frame {
    pub _root: SharedType<RenderwareBinaryStream>,
    pub _parent: SharedType<RenderwareBinaryStream_StructFrameList>,
    pub _self: SharedType<Self>,
    rotation_matrix: RefCell<OptRc<RenderwareBinaryStream_Matrix>>,
    position: RefCell<OptRc<RenderwareBinaryStream_Vector3d>>,
    cur_frame_idx: RefCell<i32>,
    matrix_creation_flags: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for RenderwareBinaryStream_Frame {
    type Root = RenderwareBinaryStream;
    type Parent = RenderwareBinaryStream_StructFrameList;

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
        let t = Self::read_into::<_, RenderwareBinaryStream_Matrix>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.rotation_matrix.borrow_mut() = t;
        let t = Self::read_into::<_, RenderwareBinaryStream_Vector3d>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.position.borrow_mut() = t;
        *self_rc.cur_frame_idx.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.matrix_creation_flags.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl RenderwareBinaryStream_Frame {
}
impl RenderwareBinaryStream_Frame {
    pub fn rotation_matrix(&self) -> Ref<'_, OptRc<RenderwareBinaryStream_Matrix>> {
        self.rotation_matrix.borrow()
    }
}
impl RenderwareBinaryStream_Frame {
    pub fn position(&self) -> Ref<'_, OptRc<RenderwareBinaryStream_Vector3d>> {
        self.position.borrow()
    }
}
impl RenderwareBinaryStream_Frame {
    pub fn cur_frame_idx(&self) -> Ref<'_, i32> {
        self.cur_frame_idx.borrow()
    }
}
impl RenderwareBinaryStream_Frame {
    pub fn matrix_creation_flags(&self) -> Ref<'_, u32> {
        self.matrix_creation_flags.borrow()
    }
}
impl RenderwareBinaryStream_Frame {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct RenderwareBinaryStream_GeometryNonNative {
    pub _root: SharedType<RenderwareBinaryStream>,
    pub _parent: SharedType<RenderwareBinaryStream_StructGeometry>,
    pub _self: SharedType<Self>,
    prelit_colors: RefCell<Vec<OptRc<RenderwareBinaryStream_Rgba>>>,
    uv_layers: RefCell<Vec<OptRc<RenderwareBinaryStream_UvLayer>>>,
    triangles: RefCell<Vec<OptRc<RenderwareBinaryStream_Triangle>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for RenderwareBinaryStream_GeometryNonNative {
    type Root = RenderwareBinaryStream;
    type Parent = RenderwareBinaryStream_StructGeometry;

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
        if *_prc.as_ref().unwrap().is_prelit()? {
            *self_rc.prelit_colors.borrow_mut() = Vec::new();
            let l_prelit_colors = *_prc.as_ref().unwrap().num_vertices();
            for _i in 0..l_prelit_colors {
                let t = Self::read_into::<_, RenderwareBinaryStream_Rgba>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.prelit_colors.borrow_mut().push(t);
            }
        }
        *self_rc.uv_layers.borrow_mut() = Vec::new();
        let l_uv_layers = *_prc.as_ref().unwrap().num_uv_layers()?;
        for _i in 0..l_uv_layers {
            let f = |t : &mut RenderwareBinaryStream_UvLayer| Ok(t.set_params((*_prc.as_ref().unwrap().num_vertices()).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, RenderwareBinaryStream_UvLayer>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            self_rc.uv_layers.borrow_mut().push(t);
        }
        *self_rc.triangles.borrow_mut() = Vec::new();
        let l_triangles = *_prc.as_ref().unwrap().num_triangles();
        for _i in 0..l_triangles {
            let t = Self::read_into::<_, RenderwareBinaryStream_Triangle>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.triangles.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl RenderwareBinaryStream_GeometryNonNative {
}
impl RenderwareBinaryStream_GeometryNonNative {
    pub fn prelit_colors(&self) -> Ref<'_, Vec<OptRc<RenderwareBinaryStream_Rgba>>> {
        self.prelit_colors.borrow()
    }
}
impl RenderwareBinaryStream_GeometryNonNative {
    pub fn uv_layers(&self) -> Ref<'_, Vec<OptRc<RenderwareBinaryStream_UvLayer>>> {
        self.uv_layers.borrow()
    }
}
impl RenderwareBinaryStream_GeometryNonNative {
    pub fn triangles(&self) -> Ref<'_, Vec<OptRc<RenderwareBinaryStream_Triangle>>> {
        self.triangles.borrow()
    }
}
impl RenderwareBinaryStream_GeometryNonNative {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Typical structure used by many data types in RenderWare binary
 * stream. Substream contains a list of binary stream entries,
 * first entry always has type "struct" and carries some specific
 * binary data it in, determined by the type of parent. All other
 * entries, beside the first one, are normal, self-describing
 * records.
 */

#[derive(Default, Debug, Clone)]
pub struct RenderwareBinaryStream_ListWithHeader {
    pub _root: SharedType<RenderwareBinaryStream>,
    pub _parent: SharedType<RenderwareBinaryStream>,
    pub _self: SharedType<Self>,
    code: RefCell<Vec<u8>>,
    header_size: RefCell<u32>,
    library_id_stamp: RefCell<u32>,
    header: RefCell<Option<RenderwareBinaryStream_ListWithHeader_Header>>,
    entries: RefCell<Vec<OptRc<RenderwareBinaryStream>>>,
    _io: RefCell<BytesReader>,
    header_raw: RefCell<Vec<u8>>,
    f_version: Cell<bool>,
    version: RefCell<i32>,
}
#[derive(Debug, Clone)]
pub enum RenderwareBinaryStream_ListWithHeader_Header {
    RenderwareBinaryStream_StructClump(OptRc<RenderwareBinaryStream_StructClump>),
    RenderwareBinaryStream_StructFrameList(OptRc<RenderwareBinaryStream_StructFrameList>),
    RenderwareBinaryStream_StructGeometryList(OptRc<RenderwareBinaryStream_StructGeometryList>),
    Bytes(Vec<u8>),
    RenderwareBinaryStream_StructAtomic(OptRc<RenderwareBinaryStream_StructAtomic>),
    RenderwareBinaryStream_StructGeometry(OptRc<RenderwareBinaryStream_StructGeometry>),
    RenderwareBinaryStream_StructTextureDictionary(OptRc<RenderwareBinaryStream_StructTextureDictionary>),
}
impl From<&RenderwareBinaryStream_ListWithHeader_Header> for OptRc<RenderwareBinaryStream_StructClump> {
    fn from(v: &RenderwareBinaryStream_ListWithHeader_Header) -> Self {
        if let RenderwareBinaryStream_ListWithHeader_Header::RenderwareBinaryStream_StructClump(x) = v {
            return x.clone();
        }
        panic!("expected RenderwareBinaryStream_ListWithHeader_Header::RenderwareBinaryStream_StructClump, got {:?}", v)
    }
}
impl From<OptRc<RenderwareBinaryStream_StructClump>> for RenderwareBinaryStream_ListWithHeader_Header {
    fn from(v: OptRc<RenderwareBinaryStream_StructClump>) -> Self {
        Self::RenderwareBinaryStream_StructClump(v)
    }
}
impl From<&RenderwareBinaryStream_ListWithHeader_Header> for OptRc<RenderwareBinaryStream_StructFrameList> {
    fn from(v: &RenderwareBinaryStream_ListWithHeader_Header) -> Self {
        if let RenderwareBinaryStream_ListWithHeader_Header::RenderwareBinaryStream_StructFrameList(x) = v {
            return x.clone();
        }
        panic!("expected RenderwareBinaryStream_ListWithHeader_Header::RenderwareBinaryStream_StructFrameList, got {:?}", v)
    }
}
impl From<OptRc<RenderwareBinaryStream_StructFrameList>> for RenderwareBinaryStream_ListWithHeader_Header {
    fn from(v: OptRc<RenderwareBinaryStream_StructFrameList>) -> Self {
        Self::RenderwareBinaryStream_StructFrameList(v)
    }
}
impl From<&RenderwareBinaryStream_ListWithHeader_Header> for OptRc<RenderwareBinaryStream_StructGeometryList> {
    fn from(v: &RenderwareBinaryStream_ListWithHeader_Header) -> Self {
        if let RenderwareBinaryStream_ListWithHeader_Header::RenderwareBinaryStream_StructGeometryList(x) = v {
            return x.clone();
        }
        panic!("expected RenderwareBinaryStream_ListWithHeader_Header::RenderwareBinaryStream_StructGeometryList, got {:?}", v)
    }
}
impl From<OptRc<RenderwareBinaryStream_StructGeometryList>> for RenderwareBinaryStream_ListWithHeader_Header {
    fn from(v: OptRc<RenderwareBinaryStream_StructGeometryList>) -> Self {
        Self::RenderwareBinaryStream_StructGeometryList(v)
    }
}
impl From<&RenderwareBinaryStream_ListWithHeader_Header> for Vec<u8> {
    fn from(v: &RenderwareBinaryStream_ListWithHeader_Header) -> Self {
        if let RenderwareBinaryStream_ListWithHeader_Header::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected RenderwareBinaryStream_ListWithHeader_Header::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for RenderwareBinaryStream_ListWithHeader_Header {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&RenderwareBinaryStream_ListWithHeader_Header> for OptRc<RenderwareBinaryStream_StructAtomic> {
    fn from(v: &RenderwareBinaryStream_ListWithHeader_Header) -> Self {
        if let RenderwareBinaryStream_ListWithHeader_Header::RenderwareBinaryStream_StructAtomic(x) = v {
            return x.clone();
        }
        panic!("expected RenderwareBinaryStream_ListWithHeader_Header::RenderwareBinaryStream_StructAtomic, got {:?}", v)
    }
}
impl From<OptRc<RenderwareBinaryStream_StructAtomic>> for RenderwareBinaryStream_ListWithHeader_Header {
    fn from(v: OptRc<RenderwareBinaryStream_StructAtomic>) -> Self {
        Self::RenderwareBinaryStream_StructAtomic(v)
    }
}
impl From<&RenderwareBinaryStream_ListWithHeader_Header> for OptRc<RenderwareBinaryStream_StructGeometry> {
    fn from(v: &RenderwareBinaryStream_ListWithHeader_Header) -> Self {
        if let RenderwareBinaryStream_ListWithHeader_Header::RenderwareBinaryStream_StructGeometry(x) = v {
            return x.clone();
        }
        panic!("expected RenderwareBinaryStream_ListWithHeader_Header::RenderwareBinaryStream_StructGeometry, got {:?}", v)
    }
}
impl From<OptRc<RenderwareBinaryStream_StructGeometry>> for RenderwareBinaryStream_ListWithHeader_Header {
    fn from(v: OptRc<RenderwareBinaryStream_StructGeometry>) -> Self {
        Self::RenderwareBinaryStream_StructGeometry(v)
    }
}
impl From<&RenderwareBinaryStream_ListWithHeader_Header> for OptRc<RenderwareBinaryStream_StructTextureDictionary> {
    fn from(v: &RenderwareBinaryStream_ListWithHeader_Header) -> Self {
        if let RenderwareBinaryStream_ListWithHeader_Header::RenderwareBinaryStream_StructTextureDictionary(x) = v {
            return x.clone();
        }
        panic!("expected RenderwareBinaryStream_ListWithHeader_Header::RenderwareBinaryStream_StructTextureDictionary, got {:?}", v)
    }
}
impl From<OptRc<RenderwareBinaryStream_StructTextureDictionary>> for RenderwareBinaryStream_ListWithHeader_Header {
    fn from(v: OptRc<RenderwareBinaryStream_StructTextureDictionary>) -> Self {
        Self::RenderwareBinaryStream_StructTextureDictionary(v)
    }
}
impl KStruct for RenderwareBinaryStream_ListWithHeader {
    type Root = RenderwareBinaryStream;
    type Parent = RenderwareBinaryStream;

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
        *self_rc.code.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.code() == vec![0x1u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/list_with_header/seq/0".to_string() }));
        }
        *self_rc.header_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.library_id_stamp.borrow_mut() = _io.read_u4le()?.into();
        match *_prc.as_ref().unwrap().code() {
            RenderwareBinaryStream_Sections::Atomic => {
                *self_rc.header_raw.borrow_mut() = _io.read_bytes(*self_rc.header_size() as usize)?.into();
                let header_raw = self_rc.header_raw.borrow();
                let _t_header_raw_io = BytesReader::from(header_raw.clone());
                let t = Self::read_into::<BytesReader, RenderwareBinaryStream_StructAtomic>(&_t_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.header.borrow_mut() = Some(t);
            }
            RenderwareBinaryStream_Sections::Clump => {
                *self_rc.header_raw.borrow_mut() = _io.read_bytes(*self_rc.header_size() as usize)?.into();
                let header_raw = self_rc.header_raw.borrow();
                let _t_header_raw_io = BytesReader::from(header_raw.clone());
                let t = Self::read_into::<BytesReader, RenderwareBinaryStream_StructClump>(&_t_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.header.borrow_mut() = Some(t);
            }
            RenderwareBinaryStream_Sections::FrameList => {
                *self_rc.header_raw.borrow_mut() = _io.read_bytes(*self_rc.header_size() as usize)?.into();
                let header_raw = self_rc.header_raw.borrow();
                let _t_header_raw_io = BytesReader::from(header_raw.clone());
                let t = Self::read_into::<BytesReader, RenderwareBinaryStream_StructFrameList>(&_t_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.header.borrow_mut() = Some(t);
            }
            RenderwareBinaryStream_Sections::Geometry => {
                *self_rc.header_raw.borrow_mut() = _io.read_bytes(*self_rc.header_size() as usize)?.into();
                let header_raw = self_rc.header_raw.borrow();
                let _t_header_raw_io = BytesReader::from(header_raw.clone());
                let t = Self::read_into::<BytesReader, RenderwareBinaryStream_StructGeometry>(&_t_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.header.borrow_mut() = Some(t);
            }
            RenderwareBinaryStream_Sections::GeometryList => {
                *self_rc.header_raw.borrow_mut() = _io.read_bytes(*self_rc.header_size() as usize)?.into();
                let header_raw = self_rc.header_raw.borrow();
                let _t_header_raw_io = BytesReader::from(header_raw.clone());
                let t = Self::read_into::<BytesReader, RenderwareBinaryStream_StructGeometryList>(&_t_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.header.borrow_mut() = Some(t);
            }
            RenderwareBinaryStream_Sections::TextureDictionary => {
                *self_rc.header_raw.borrow_mut() = _io.read_bytes(*self_rc.header_size() as usize)?.into();
                let header_raw = self_rc.header_raw.borrow();
                let _t_header_raw_io = BytesReader::from(header_raw.clone());
                let t = Self::read_into::<BytesReader, RenderwareBinaryStream_StructTextureDictionary>(&_t_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.header.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.header.borrow_mut() = Some(_io.read_bytes(*self_rc.header_size() as usize)?.into());
            }
        }
        *self_rc.entries.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, RenderwareBinaryStream>(&*_io, Some(self_rc._root.clone()), None)?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl RenderwareBinaryStream_ListWithHeader {
    pub fn version(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_version.get() {
            return Ok(self.version.borrow());
        }
        self.f_version.set(true);
        *self.version.borrow_mut() = (if ((((*self.library_id_stamp() as i32) & (4294901760 as i32)) as i32) != (0 as i32)) { ((((((((*self.library_id_stamp() as u32) >> (14 as u32)) as i32) & (261888 as i32)) as i32) + (196608 as i32)) as i32) | (((((*self.library_id_stamp() as u32) >> (16 as u32)) as i32) & (63 as i32)) as i32)) } else { ((*self.library_id_stamp() as u32) << (8 as u32)) }) as i32;
        Ok(self.version.borrow())
    }
}
impl RenderwareBinaryStream_ListWithHeader {
    pub fn code(&self) -> Ref<'_, Vec<u8>> {
        self.code.borrow()
    }
}
impl RenderwareBinaryStream_ListWithHeader {
    pub fn header_size(&self) -> Ref<'_, u32> {
        self.header_size.borrow()
    }
}
impl RenderwareBinaryStream_ListWithHeader {
    pub fn library_id_stamp(&self) -> Ref<'_, u32> {
        self.library_id_stamp.borrow()
    }
}
impl RenderwareBinaryStream_ListWithHeader {
    pub fn header(&self) -> Ref<'_, Option<RenderwareBinaryStream_ListWithHeader_Header>> {
        self.header.borrow()
    }
}
impl RenderwareBinaryStream_ListWithHeader {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<RenderwareBinaryStream>>> {
        self.entries.borrow()
    }
}
impl RenderwareBinaryStream_ListWithHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl RenderwareBinaryStream_ListWithHeader {
    pub fn header_raw(&self) -> Ref<'_, Vec<u8>> {
        self.header_raw.borrow()
    }
}

/**
 * \sa https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure Source
 */

#[derive(Default, Debug, Clone)]
pub struct RenderwareBinaryStream_Matrix {
    pub _root: SharedType<RenderwareBinaryStream>,
    pub _parent: SharedType<RenderwareBinaryStream_Frame>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<RenderwareBinaryStream_Vector3d>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for RenderwareBinaryStream_Matrix {
    type Root = RenderwareBinaryStream;
    type Parent = RenderwareBinaryStream_Frame;

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
        *self_rc.entries.borrow_mut() = Vec::new();
        let l_entries = 3;
        for _i in 0..l_entries {
            let t = Self::read_into::<_, RenderwareBinaryStream_Vector3d>(&*_io, Some(self_rc._root.clone()), None)?.into();
            self_rc.entries.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl RenderwareBinaryStream_Matrix {
}
impl RenderwareBinaryStream_Matrix {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<RenderwareBinaryStream_Vector3d>>> {
        self.entries.borrow()
    }
}
impl RenderwareBinaryStream_Matrix {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct RenderwareBinaryStream_MorphTarget {
    pub _root: SharedType<RenderwareBinaryStream>,
    pub _parent: SharedType<RenderwareBinaryStream_StructGeometry>,
    pub _self: SharedType<Self>,
    bounding_sphere: RefCell<OptRc<RenderwareBinaryStream_Sphere>>,
    has_vertices: RefCell<u32>,
    has_normals: RefCell<u32>,
    vertices: RefCell<Vec<OptRc<RenderwareBinaryStream_Vector3d>>>,
    normals: RefCell<Vec<OptRc<RenderwareBinaryStream_Vector3d>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for RenderwareBinaryStream_MorphTarget {
    type Root = RenderwareBinaryStream;
    type Parent = RenderwareBinaryStream_StructGeometry;

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
        let t = Self::read_into::<_, RenderwareBinaryStream_Sphere>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.bounding_sphere.borrow_mut() = t;
        *self_rc.has_vertices.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.has_normals.borrow_mut() = _io.read_u4le()?.into();
        if ((*self_rc.has_vertices() as u32) != (0 as u32)) {
            *self_rc.vertices.borrow_mut() = Vec::new();
            let l_vertices = *_prc.as_ref().unwrap().num_vertices();
            for _i in 0..l_vertices {
                let t = Self::read_into::<_, RenderwareBinaryStream_Vector3d>(&*_io, Some(self_rc._root.clone()), None)?.into();
                self_rc.vertices.borrow_mut().push(t);
            }
        }
        if ((*self_rc.has_normals() as u32) != (0 as u32)) {
            *self_rc.normals.borrow_mut() = Vec::new();
            let l_normals = *_prc.as_ref().unwrap().num_vertices();
            for _i in 0..l_normals {
                let t = Self::read_into::<_, RenderwareBinaryStream_Vector3d>(&*_io, Some(self_rc._root.clone()), None)?.into();
                self_rc.normals.borrow_mut().push(t);
            }
        }
        Ok(())
    }
}
impl RenderwareBinaryStream_MorphTarget {
}
impl RenderwareBinaryStream_MorphTarget {
    pub fn bounding_sphere(&self) -> Ref<'_, OptRc<RenderwareBinaryStream_Sphere>> {
        self.bounding_sphere.borrow()
    }
}
impl RenderwareBinaryStream_MorphTarget {
    pub fn has_vertices(&self) -> Ref<'_, u32> {
        self.has_vertices.borrow()
    }
}
impl RenderwareBinaryStream_MorphTarget {
    pub fn has_normals(&self) -> Ref<'_, u32> {
        self.has_normals.borrow()
    }
}
impl RenderwareBinaryStream_MorphTarget {
    pub fn vertices(&self) -> Ref<'_, Vec<OptRc<RenderwareBinaryStream_Vector3d>>> {
        self.vertices.borrow()
    }
}
impl RenderwareBinaryStream_MorphTarget {
    pub fn normals(&self) -> Ref<'_, Vec<OptRc<RenderwareBinaryStream_Vector3d>>> {
        self.normals.borrow()
    }
}
impl RenderwareBinaryStream_MorphTarget {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct RenderwareBinaryStream_Rgba {
    pub _root: SharedType<RenderwareBinaryStream>,
    pub _parent: SharedType<RenderwareBinaryStream_GeometryNonNative>,
    pub _self: SharedType<Self>,
    r: RefCell<u8>,
    g: RefCell<u8>,
    b: RefCell<u8>,
    a: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for RenderwareBinaryStream_Rgba {
    type Root = RenderwareBinaryStream;
    type Parent = RenderwareBinaryStream_GeometryNonNative;

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
        *self_rc.r.borrow_mut() = _io.read_u1()?.into();
        *self_rc.g.borrow_mut() = _io.read_u1()?.into();
        *self_rc.b.borrow_mut() = _io.read_u1()?.into();
        *self_rc.a.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl RenderwareBinaryStream_Rgba {
}
impl RenderwareBinaryStream_Rgba {
    pub fn r(&self) -> Ref<'_, u8> {
        self.r.borrow()
    }
}
impl RenderwareBinaryStream_Rgba {
    pub fn g(&self) -> Ref<'_, u8> {
        self.g.borrow()
    }
}
impl RenderwareBinaryStream_Rgba {
    pub fn b(&self) -> Ref<'_, u8> {
        self.b.borrow()
    }
}
impl RenderwareBinaryStream_Rgba {
    pub fn a(&self) -> Ref<'_, u8> {
        self.a.borrow()
    }
}
impl RenderwareBinaryStream_Rgba {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct RenderwareBinaryStream_Sphere {
    pub _root: SharedType<RenderwareBinaryStream>,
    pub _parent: SharedType<RenderwareBinaryStream_MorphTarget>,
    pub _self: SharedType<Self>,
    x: RefCell<f32>,
    y: RefCell<f32>,
    z: RefCell<f32>,
    radius: RefCell<f32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for RenderwareBinaryStream_Sphere {
    type Root = RenderwareBinaryStream;
    type Parent = RenderwareBinaryStream_MorphTarget;

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
        *self_rc.x.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.y.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.z.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.radius.borrow_mut() = _io.read_f4le()?.into();
        Ok(())
    }
}
impl RenderwareBinaryStream_Sphere {
}
impl RenderwareBinaryStream_Sphere {
    pub fn x(&self) -> Ref<'_, f32> {
        self.x.borrow()
    }
}
impl RenderwareBinaryStream_Sphere {
    pub fn y(&self) -> Ref<'_, f32> {
        self.y.borrow()
    }
}
impl RenderwareBinaryStream_Sphere {
    pub fn z(&self) -> Ref<'_, f32> {
        self.z.borrow()
    }
}
impl RenderwareBinaryStream_Sphere {
    pub fn radius(&self) -> Ref<'_, f32> {
        self.radius.borrow()
    }
}
impl RenderwareBinaryStream_Sphere {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://gtamods.com/wiki/Atomic_(RW_Section)#Structure Source
 */

#[derive(Default, Debug, Clone)]
pub struct RenderwareBinaryStream_StructAtomic {
    pub _root: SharedType<RenderwareBinaryStream>,
    pub _parent: SharedType<RenderwareBinaryStream_ListWithHeader>,
    pub _self: SharedType<Self>,
    frame_index: RefCell<u32>,
    geometry_index: RefCell<u32>,
    flag_render: RefCell<bool>,
    unnamed3: RefCell<bool>,
    flag_collision_test: RefCell<bool>,
    unnamed5: RefCell<u64>,
    unused: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for RenderwareBinaryStream_StructAtomic {
    type Root = RenderwareBinaryStream;
    type Parent = RenderwareBinaryStream_ListWithHeader;

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
        *self_rc.frame_index.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.geometry_index.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.flag_render.borrow_mut() = _io.read_bits_int_le(1)? != 0;
        *self_rc.unnamed3.borrow_mut() = _io.read_bits_int_le(1)? != 0;
        *self_rc.flag_collision_test.borrow_mut() = _io.read_bits_int_le(1)? != 0;
        *self_rc.unnamed5.borrow_mut() = _io.read_bits_int_le(29)?;
        _io.align_to_byte()?;
        *self_rc.unused.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl RenderwareBinaryStream_StructAtomic {
}
impl RenderwareBinaryStream_StructAtomic {
    pub fn frame_index(&self) -> Ref<'_, u32> {
        self.frame_index.borrow()
    }
}
impl RenderwareBinaryStream_StructAtomic {
    pub fn geometry_index(&self) -> Ref<'_, u32> {
        self.geometry_index.borrow()
    }
}
impl RenderwareBinaryStream_StructAtomic {
    pub fn flag_render(&self) -> Ref<'_, bool> {
        self.flag_render.borrow()
    }
}
impl RenderwareBinaryStream_StructAtomic {
    pub fn unnamed3(&self) -> Ref<'_, bool> {
        self.unnamed3.borrow()
    }
}
impl RenderwareBinaryStream_StructAtomic {
    pub fn flag_collision_test(&self) -> Ref<'_, bool> {
        self.flag_collision_test.borrow()
    }
}
impl RenderwareBinaryStream_StructAtomic {
    pub fn unnamed5(&self) -> Ref<'_, u64> {
        self.unnamed5.borrow()
    }
}
impl RenderwareBinaryStream_StructAtomic {
    pub fn unused(&self) -> Ref<'_, u32> {
        self.unused.borrow()
    }
}
impl RenderwareBinaryStream_StructAtomic {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://gtamods.com/wiki/RpClump Source
 */

#[derive(Default, Debug, Clone)]
pub struct RenderwareBinaryStream_StructClump {
    pub _root: SharedType<RenderwareBinaryStream>,
    pub _parent: SharedType<RenderwareBinaryStream_ListWithHeader>,
    pub _self: SharedType<Self>,
    num_atomics: RefCell<u32>,
    num_lights: RefCell<u32>,
    num_cameras: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for RenderwareBinaryStream_StructClump {
    type Root = RenderwareBinaryStream;
    type Parent = RenderwareBinaryStream_ListWithHeader;

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
        *self_rc.num_atomics.borrow_mut() = _io.read_u4le()?.into();
        if *_prc.as_ref().unwrap().version()? >= 208896 {
            *self_rc.num_lights.borrow_mut() = _io.read_u4le()?.into();
        }
        if *_prc.as_ref().unwrap().version()? >= 208896 {
            *self_rc.num_cameras.borrow_mut() = _io.read_u4le()?.into();
        }
        Ok(())
    }
}
impl RenderwareBinaryStream_StructClump {
}
impl RenderwareBinaryStream_StructClump {
    pub fn num_atomics(&self) -> Ref<'_, u32> {
        self.num_atomics.borrow()
    }
}
impl RenderwareBinaryStream_StructClump {
    pub fn num_lights(&self) -> Ref<'_, u32> {
        self.num_lights.borrow()
    }
}
impl RenderwareBinaryStream_StructClump {
    pub fn num_cameras(&self) -> Ref<'_, u32> {
        self.num_cameras.borrow()
    }
}
impl RenderwareBinaryStream_StructClump {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure Source
 */

#[derive(Default, Debug, Clone)]
pub struct RenderwareBinaryStream_StructFrameList {
    pub _root: SharedType<RenderwareBinaryStream>,
    pub _parent: SharedType<RenderwareBinaryStream_ListWithHeader>,
    pub _self: SharedType<Self>,
    num_frames: RefCell<u32>,
    frames: RefCell<Vec<OptRc<RenderwareBinaryStream_Frame>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for RenderwareBinaryStream_StructFrameList {
    type Root = RenderwareBinaryStream;
    type Parent = RenderwareBinaryStream_ListWithHeader;

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
        *self_rc.num_frames.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.frames.borrow_mut() = Vec::new();
        let l_frames = *self_rc.num_frames();
        for _i in 0..l_frames {
            let t = Self::read_into::<_, RenderwareBinaryStream_Frame>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.frames.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl RenderwareBinaryStream_StructFrameList {
}
impl RenderwareBinaryStream_StructFrameList {
    pub fn num_frames(&self) -> Ref<'_, u32> {
        self.num_frames.borrow()
    }
}
impl RenderwareBinaryStream_StructFrameList {
    pub fn frames(&self) -> Ref<'_, Vec<OptRc<RenderwareBinaryStream_Frame>>> {
        self.frames.borrow()
    }
}
impl RenderwareBinaryStream_StructFrameList {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://gtamods.com/wiki/RpGeometry Source
 */

#[derive(Default, Debug, Clone)]
pub struct RenderwareBinaryStream_StructGeometry {
    pub _root: SharedType<RenderwareBinaryStream>,
    pub _parent: SharedType<RenderwareBinaryStream_ListWithHeader>,
    pub _self: SharedType<Self>,
    format: RefCell<u32>,
    num_triangles: RefCell<u32>,
    num_vertices: RefCell<u32>,
    num_morph_targets: RefCell<u32>,
    surf_prop: RefCell<OptRc<RenderwareBinaryStream_SurfaceProperties>>,
    geometry: RefCell<OptRc<RenderwareBinaryStream_GeometryNonNative>>,
    morph_targets: RefCell<Vec<OptRc<RenderwareBinaryStream_MorphTarget>>>,
    _io: RefCell<BytesReader>,
    f_is_native: Cell<bool>,
    is_native: RefCell<bool>,
    f_is_prelit: Cell<bool>,
    is_prelit: RefCell<bool>,
    f_is_textured: Cell<bool>,
    is_textured: RefCell<bool>,
    f_is_textured2: Cell<bool>,
    is_textured2: RefCell<bool>,
    f_num_uv_layers: Cell<bool>,
    num_uv_layers: RefCell<i32>,
    f_num_uv_layers_raw: Cell<bool>,
    num_uv_layers_raw: RefCell<i32>,
}
impl KStruct for RenderwareBinaryStream_StructGeometry {
    type Root = RenderwareBinaryStream;
    type Parent = RenderwareBinaryStream_ListWithHeader;

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
        *self_rc.format.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_triangles.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_vertices.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_morph_targets.borrow_mut() = _io.read_u4le()?.into();
        if *_prc.as_ref().unwrap().version()? < 212992 {
            let t = Self::read_into::<_, RenderwareBinaryStream_SurfaceProperties>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.surf_prop.borrow_mut() = t;
        }
        if !(*self_rc.is_native()?) {
            let t = Self::read_into::<_, RenderwareBinaryStream_GeometryNonNative>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.geometry.borrow_mut() = t;
        }
        *self_rc.morph_targets.borrow_mut() = Vec::new();
        let l_morph_targets = *self_rc.num_morph_targets();
        for _i in 0..l_morph_targets {
            let t = Self::read_into::<_, RenderwareBinaryStream_MorphTarget>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.morph_targets.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl RenderwareBinaryStream_StructGeometry {
    pub fn is_native(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_native.get() {
            return Ok(self.is_native.borrow());
        }
        self.f_is_native.set(true);
        *self.is_native.borrow_mut() = (((((*self.format() as i32) & (16777216 as i32)) as i32) != (0 as i32))) as bool;
        Ok(self.is_native.borrow())
    }
    pub fn is_prelit(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_prelit.get() {
            return Ok(self.is_prelit.borrow());
        }
        self.f_is_prelit.set(true);
        *self.is_prelit.borrow_mut() = (((((*self.format() as u32) & (8 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.is_prelit.borrow())
    }
    pub fn is_textured(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_textured.get() {
            return Ok(self.is_textured.borrow());
        }
        self.f_is_textured.set(true);
        *self.is_textured.borrow_mut() = (((((*self.format() as u32) & (4 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.is_textured.borrow())
    }
    pub fn is_textured2(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_textured2.get() {
            return Ok(self.is_textured2.borrow());
        }
        self.f_is_textured2.set(true);
        *self.is_textured2.borrow_mut() = (((((*self.format() as u32) & (128 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.is_textured2.borrow())
    }
    pub fn num_uv_layers(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_uv_layers.get() {
            return Ok(self.num_uv_layers.borrow());
        }
        self.f_num_uv_layers.set(true);
        *self.num_uv_layers.borrow_mut() = (if ((*self.num_uv_layers_raw()? as i32) == (0 as i32)) { if *self.is_textured2()? { 2 } else { if *self.is_textured()? { 1 } else { 0 } } } else { *self.num_uv_layers_raw()? }) as i32;
        Ok(self.num_uv_layers.borrow())
    }
    pub fn num_uv_layers_raw(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_uv_layers_raw.get() {
            return Ok(self.num_uv_layers_raw.borrow());
        }
        self.f_num_uv_layers_raw.set(true);
        *self.num_uv_layers_raw.borrow_mut() = ((((((*self.format() as i32) & (16711680 as i32)) as u64) >> 16) as i32)) as i32;
        Ok(self.num_uv_layers_raw.borrow())
    }
}
impl RenderwareBinaryStream_StructGeometry {
    pub fn format(&self) -> Ref<'_, u32> {
        self.format.borrow()
    }
}
impl RenderwareBinaryStream_StructGeometry {
    pub fn num_triangles(&self) -> Ref<'_, u32> {
        self.num_triangles.borrow()
    }
}
impl RenderwareBinaryStream_StructGeometry {
    pub fn num_vertices(&self) -> Ref<'_, u32> {
        self.num_vertices.borrow()
    }
}
impl RenderwareBinaryStream_StructGeometry {
    pub fn num_morph_targets(&self) -> Ref<'_, u32> {
        self.num_morph_targets.borrow()
    }
}
impl RenderwareBinaryStream_StructGeometry {
    pub fn surf_prop(&self) -> Ref<'_, OptRc<RenderwareBinaryStream_SurfaceProperties>> {
        self.surf_prop.borrow()
    }
}
impl RenderwareBinaryStream_StructGeometry {
    pub fn geometry(&self) -> Ref<'_, OptRc<RenderwareBinaryStream_GeometryNonNative>> {
        self.geometry.borrow()
    }
}
impl RenderwareBinaryStream_StructGeometry {
    pub fn morph_targets(&self) -> Ref<'_, Vec<OptRc<RenderwareBinaryStream_MorphTarget>>> {
        self.morph_targets.borrow()
    }
}
impl RenderwareBinaryStream_StructGeometry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://gtamods.com/wiki/Geometry_List_(RW_Section)#Structure Source
 */

#[derive(Default, Debug, Clone)]
pub struct RenderwareBinaryStream_StructGeometryList {
    pub _root: SharedType<RenderwareBinaryStream>,
    pub _parent: SharedType<RenderwareBinaryStream_ListWithHeader>,
    pub _self: SharedType<Self>,
    num_geometries: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for RenderwareBinaryStream_StructGeometryList {
    type Root = RenderwareBinaryStream;
    type Parent = RenderwareBinaryStream_ListWithHeader;

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
        *self_rc.num_geometries.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl RenderwareBinaryStream_StructGeometryList {
}
impl RenderwareBinaryStream_StructGeometryList {
    pub fn num_geometries(&self) -> Ref<'_, u32> {
        self.num_geometries.borrow()
    }
}
impl RenderwareBinaryStream_StructGeometryList {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct RenderwareBinaryStream_StructTextureDictionary {
    pub _root: SharedType<RenderwareBinaryStream>,
    pub _parent: SharedType<RenderwareBinaryStream_ListWithHeader>,
    pub _self: SharedType<Self>,
    num_textures: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for RenderwareBinaryStream_StructTextureDictionary {
    type Root = RenderwareBinaryStream;
    type Parent = RenderwareBinaryStream_ListWithHeader;

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
        *self_rc.num_textures.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl RenderwareBinaryStream_StructTextureDictionary {
}
impl RenderwareBinaryStream_StructTextureDictionary {
    pub fn num_textures(&self) -> Ref<'_, u32> {
        self.num_textures.borrow()
    }
}
impl RenderwareBinaryStream_StructTextureDictionary {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://gtamods.com/wiki/RpGeometry Source
 */

#[derive(Default, Debug, Clone)]
pub struct RenderwareBinaryStream_SurfaceProperties {
    pub _root: SharedType<RenderwareBinaryStream>,
    pub _parent: SharedType<RenderwareBinaryStream_StructGeometry>,
    pub _self: SharedType<Self>,
    ambient: RefCell<f32>,
    specular: RefCell<f32>,
    diffuse: RefCell<f32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for RenderwareBinaryStream_SurfaceProperties {
    type Root = RenderwareBinaryStream;
    type Parent = RenderwareBinaryStream_StructGeometry;

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
        *self_rc.ambient.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.specular.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.diffuse.borrow_mut() = _io.read_f4le()?.into();
        Ok(())
    }
}
impl RenderwareBinaryStream_SurfaceProperties {
}
impl RenderwareBinaryStream_SurfaceProperties {
    pub fn ambient(&self) -> Ref<'_, f32> {
        self.ambient.borrow()
    }
}
impl RenderwareBinaryStream_SurfaceProperties {
    pub fn specular(&self) -> Ref<'_, f32> {
        self.specular.borrow()
    }
}
impl RenderwareBinaryStream_SurfaceProperties {
    pub fn diffuse(&self) -> Ref<'_, f32> {
        self.diffuse.borrow()
    }
}
impl RenderwareBinaryStream_SurfaceProperties {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct RenderwareBinaryStream_TexCoord {
    pub _root: SharedType<RenderwareBinaryStream>,
    pub _parent: SharedType<RenderwareBinaryStream_UvLayer>,
    pub _self: SharedType<Self>,
    u: RefCell<f32>,
    v: RefCell<f32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for RenderwareBinaryStream_TexCoord {
    type Root = RenderwareBinaryStream;
    type Parent = RenderwareBinaryStream_UvLayer;

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
        *self_rc.u.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.v.borrow_mut() = _io.read_f4le()?.into();
        Ok(())
    }
}
impl RenderwareBinaryStream_TexCoord {
}
impl RenderwareBinaryStream_TexCoord {
    pub fn u(&self) -> Ref<'_, f32> {
        self.u.borrow()
    }
}
impl RenderwareBinaryStream_TexCoord {
    pub fn v(&self) -> Ref<'_, f32> {
        self.v.borrow()
    }
}
impl RenderwareBinaryStream_TexCoord {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct RenderwareBinaryStream_Triangle {
    pub _root: SharedType<RenderwareBinaryStream>,
    pub _parent: SharedType<RenderwareBinaryStream_GeometryNonNative>,
    pub _self: SharedType<Self>,
    vertex2: RefCell<u16>,
    vertex1: RefCell<u16>,
    material_id: RefCell<u16>,
    vertex3: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for RenderwareBinaryStream_Triangle {
    type Root = RenderwareBinaryStream;
    type Parent = RenderwareBinaryStream_GeometryNonNative;

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
        *self_rc.vertex2.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.vertex1.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.material_id.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.vertex3.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl RenderwareBinaryStream_Triangle {
}
impl RenderwareBinaryStream_Triangle {
    pub fn vertex2(&self) -> Ref<'_, u16> {
        self.vertex2.borrow()
    }
}
impl RenderwareBinaryStream_Triangle {
    pub fn vertex1(&self) -> Ref<'_, u16> {
        self.vertex1.borrow()
    }
}
impl RenderwareBinaryStream_Triangle {
    pub fn material_id(&self) -> Ref<'_, u16> {
        self.material_id.borrow()
    }
}
impl RenderwareBinaryStream_Triangle {
    pub fn vertex3(&self) -> Ref<'_, u16> {
        self.vertex3.borrow()
    }
}
impl RenderwareBinaryStream_Triangle {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct RenderwareBinaryStream_UvLayer {
    pub _root: SharedType<RenderwareBinaryStream>,
    pub _parent: SharedType<RenderwareBinaryStream_GeometryNonNative>,
    pub _self: SharedType<Self>,
    num_vertices: RefCell<u32>,
    tex_coords: RefCell<Vec<OptRc<RenderwareBinaryStream_TexCoord>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for RenderwareBinaryStream_UvLayer {
    type Root = RenderwareBinaryStream;
    type Parent = RenderwareBinaryStream_GeometryNonNative;

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
        *self_rc.tex_coords.borrow_mut() = Vec::new();
        let l_tex_coords = *self_rc.num_vertices();
        for _i in 0..l_tex_coords {
            let t = Self::read_into::<_, RenderwareBinaryStream_TexCoord>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.tex_coords.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl RenderwareBinaryStream_UvLayer {
    pub fn num_vertices(&self) -> Ref<'_, u32> {
        self.num_vertices.borrow()
    }
}
impl RenderwareBinaryStream_UvLayer {
    pub fn set_params(&mut self, num_vertices: u32) {
        *self.num_vertices.borrow_mut() = num_vertices;
    }
}
impl RenderwareBinaryStream_UvLayer {
}
impl RenderwareBinaryStream_UvLayer {
    pub fn tex_coords(&self) -> Ref<'_, Vec<OptRc<RenderwareBinaryStream_TexCoord>>> {
        self.tex_coords.borrow()
    }
}
impl RenderwareBinaryStream_UvLayer {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure Source
 */

#[derive(Default, Debug, Clone)]
pub struct RenderwareBinaryStream_Vector3d {
    pub _root: SharedType<RenderwareBinaryStream>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    x: RefCell<f32>,
    y: RefCell<f32>,
    z: RefCell<f32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for RenderwareBinaryStream_Vector3d {
    type Root = RenderwareBinaryStream;
    type Parent = KStructUnit;

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
        *self_rc.x.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.y.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.z.borrow_mut() = _io.read_f4le()?.into();
        Ok(())
    }
}
impl RenderwareBinaryStream_Vector3d {
}
impl RenderwareBinaryStream_Vector3d {
    pub fn x(&self) -> Ref<'_, f32> {
        self.x.borrow()
    }
}
impl RenderwareBinaryStream_Vector3d {
    pub fn y(&self) -> Ref<'_, f32> {
        self.y.borrow()
    }
}
impl RenderwareBinaryStream_Vector3d {
    pub fn z(&self) -> Ref<'_, f32> {
        self.z.borrow()
    }
}
impl RenderwareBinaryStream_Vector3d {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

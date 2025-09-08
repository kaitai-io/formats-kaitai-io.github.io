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

#[derive(Default, Debug, Clone)]
pub struct Icc4 {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<Icc4_ProfileHeader>>,
    tag_table: RefCell<OptRc<Icc4_TagTable>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4 {
    type Root = Icc4;
    type Parent = Icc4;

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
        let t = Self::read_into::<_, Icc4_ProfileHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        let t = Self::read_into::<_, Icc4_TagTable>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.tag_table.borrow_mut() = t;
        Ok(())
    }
}
impl Icc4 {
}
impl Icc4 {
    pub fn header(&self) -> Ref<'_, OptRc<Icc4_ProfileHeader>> {
        self.header.borrow()
    }
}
impl Icc4 {
    pub fn tag_table(&self) -> Ref<'_, OptRc<Icc4_TagTable>> {
        self.tag_table.borrow()
    }
}
impl Icc4 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_DateTimeNumber {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    year: RefCell<u16>,
    month: RefCell<u16>,
    day: RefCell<u16>,
    hour: RefCell<u16>,
    minute: RefCell<u16>,
    second: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_DateTimeNumber {
    type Root = Icc4;
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
        *self_rc.year.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.month.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.day.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.hour.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.minute.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.second.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl Icc4_DateTimeNumber {
}
impl Icc4_DateTimeNumber {
    pub fn year(&self) -> Ref<'_, u16> {
        self.year.borrow()
    }
}
impl Icc4_DateTimeNumber {
    pub fn month(&self) -> Ref<'_, u16> {
        self.month.borrow()
    }
}
impl Icc4_DateTimeNumber {
    pub fn day(&self) -> Ref<'_, u16> {
        self.day.borrow()
    }
}
impl Icc4_DateTimeNumber {
    pub fn hour(&self) -> Ref<'_, u16> {
        self.hour.borrow()
    }
}
impl Icc4_DateTimeNumber {
    pub fn minute(&self) -> Ref<'_, u16> {
        self.minute.borrow()
    }
}
impl Icc4_DateTimeNumber {
    pub fn second(&self) -> Ref<'_, u16> {
        self.second.borrow()
    }
}
impl Icc4_DateTimeNumber {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_DeviceAttributes {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    reflective_or_transparency: RefCell<Icc4_DeviceAttributes_DeviceAttributesReflectiveOrTransparency>,
    glossy_or_matte: RefCell<Icc4_DeviceAttributes_DeviceAttributesGlossyOrMatte>,
    positive_or_negative_media_polarity: RefCell<Icc4_DeviceAttributes_DeviceAttributesPositiveOrNegativeMediaPolarity>,
    colour_or_black_and_white_media: RefCell<Icc4_DeviceAttributes_DeviceAttributesColourOrBlackAndWhiteMedia>,
    reserved: RefCell<u64>,
    vendor_specific: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_DeviceAttributes {
    type Root = Icc4;
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
        *self_rc.reflective_or_transparency.borrow_mut() = (_io.read_bits_int_be(1)? as i64).try_into()?;
        *self_rc.glossy_or_matte.borrow_mut() = (_io.read_bits_int_be(1)? as i64).try_into()?;
        *self_rc.positive_or_negative_media_polarity.borrow_mut() = (_io.read_bits_int_be(1)? as i64).try_into()?;
        *self_rc.colour_or_black_and_white_media.borrow_mut() = (_io.read_bits_int_be(1)? as i64).try_into()?;
        *self_rc.reserved.borrow_mut() = _io.read_bits_int_be(28)?;
        *self_rc.vendor_specific.borrow_mut() = _io.read_bits_int_be(32)?;
        Ok(())
    }
}
impl Icc4_DeviceAttributes {
}
impl Icc4_DeviceAttributes {
    pub fn reflective_or_transparency(&self) -> Ref<'_, Icc4_DeviceAttributes_DeviceAttributesReflectiveOrTransparency> {
        self.reflective_or_transparency.borrow()
    }
}
impl Icc4_DeviceAttributes {
    pub fn glossy_or_matte(&self) -> Ref<'_, Icc4_DeviceAttributes_DeviceAttributesGlossyOrMatte> {
        self.glossy_or_matte.borrow()
    }
}
impl Icc4_DeviceAttributes {
    pub fn positive_or_negative_media_polarity(&self) -> Ref<'_, Icc4_DeviceAttributes_DeviceAttributesPositiveOrNegativeMediaPolarity> {
        self.positive_or_negative_media_polarity.borrow()
    }
}
impl Icc4_DeviceAttributes {
    pub fn colour_or_black_and_white_media(&self) -> Ref<'_, Icc4_DeviceAttributes_DeviceAttributesColourOrBlackAndWhiteMedia> {
        self.colour_or_black_and_white_media.borrow()
    }
}
impl Icc4_DeviceAttributes {
    pub fn reserved(&self) -> Ref<'_, u64> {
        self.reserved.borrow()
    }
}
impl Icc4_DeviceAttributes {
    pub fn vendor_specific(&self) -> Ref<'_, u64> {
        self.vendor_specific.borrow()
    }
}
impl Icc4_DeviceAttributes {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Icc4_DeviceAttributes_DeviceAttributesColourOrBlackAndWhiteMedia {
    ColourMedia,
    BlackAndWhiteMedia,
    Unknown(i64),
}

impl TryFrom<i64> for Icc4_DeviceAttributes_DeviceAttributesColourOrBlackAndWhiteMedia {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Icc4_DeviceAttributes_DeviceAttributesColourOrBlackAndWhiteMedia> {
        match flag {
            0 => Ok(Icc4_DeviceAttributes_DeviceAttributesColourOrBlackAndWhiteMedia::ColourMedia),
            1 => Ok(Icc4_DeviceAttributes_DeviceAttributesColourOrBlackAndWhiteMedia::BlackAndWhiteMedia),
            _ => Ok(Icc4_DeviceAttributes_DeviceAttributesColourOrBlackAndWhiteMedia::Unknown(flag)),
        }
    }
}

impl From<&Icc4_DeviceAttributes_DeviceAttributesColourOrBlackAndWhiteMedia> for i64 {
    fn from(v: &Icc4_DeviceAttributes_DeviceAttributesColourOrBlackAndWhiteMedia) -> Self {
        match *v {
            Icc4_DeviceAttributes_DeviceAttributesColourOrBlackAndWhiteMedia::ColourMedia => 0,
            Icc4_DeviceAttributes_DeviceAttributesColourOrBlackAndWhiteMedia::BlackAndWhiteMedia => 1,
            Icc4_DeviceAttributes_DeviceAttributesColourOrBlackAndWhiteMedia::Unknown(v) => v
        }
    }
}

impl Default for Icc4_DeviceAttributes_DeviceAttributesColourOrBlackAndWhiteMedia {
    fn default() -> Self { Icc4_DeviceAttributes_DeviceAttributesColourOrBlackAndWhiteMedia::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Icc4_DeviceAttributes_DeviceAttributesGlossyOrMatte {
    Glossy,
    Matte,
    Unknown(i64),
}

impl TryFrom<i64> for Icc4_DeviceAttributes_DeviceAttributesGlossyOrMatte {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Icc4_DeviceAttributes_DeviceAttributesGlossyOrMatte> {
        match flag {
            0 => Ok(Icc4_DeviceAttributes_DeviceAttributesGlossyOrMatte::Glossy),
            1 => Ok(Icc4_DeviceAttributes_DeviceAttributesGlossyOrMatte::Matte),
            _ => Ok(Icc4_DeviceAttributes_DeviceAttributesGlossyOrMatte::Unknown(flag)),
        }
    }
}

impl From<&Icc4_DeviceAttributes_DeviceAttributesGlossyOrMatte> for i64 {
    fn from(v: &Icc4_DeviceAttributes_DeviceAttributesGlossyOrMatte) -> Self {
        match *v {
            Icc4_DeviceAttributes_DeviceAttributesGlossyOrMatte::Glossy => 0,
            Icc4_DeviceAttributes_DeviceAttributesGlossyOrMatte::Matte => 1,
            Icc4_DeviceAttributes_DeviceAttributesGlossyOrMatte::Unknown(v) => v
        }
    }
}

impl Default for Icc4_DeviceAttributes_DeviceAttributesGlossyOrMatte {
    fn default() -> Self { Icc4_DeviceAttributes_DeviceAttributesGlossyOrMatte::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Icc4_DeviceAttributes_DeviceAttributesPositiveOrNegativeMediaPolarity {
    PositiveMediaPolarity,
    NegativeMediaPolarity,
    Unknown(i64),
}

impl TryFrom<i64> for Icc4_DeviceAttributes_DeviceAttributesPositiveOrNegativeMediaPolarity {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Icc4_DeviceAttributes_DeviceAttributesPositiveOrNegativeMediaPolarity> {
        match flag {
            0 => Ok(Icc4_DeviceAttributes_DeviceAttributesPositiveOrNegativeMediaPolarity::PositiveMediaPolarity),
            1 => Ok(Icc4_DeviceAttributes_DeviceAttributesPositiveOrNegativeMediaPolarity::NegativeMediaPolarity),
            _ => Ok(Icc4_DeviceAttributes_DeviceAttributesPositiveOrNegativeMediaPolarity::Unknown(flag)),
        }
    }
}

impl From<&Icc4_DeviceAttributes_DeviceAttributesPositiveOrNegativeMediaPolarity> for i64 {
    fn from(v: &Icc4_DeviceAttributes_DeviceAttributesPositiveOrNegativeMediaPolarity) -> Self {
        match *v {
            Icc4_DeviceAttributes_DeviceAttributesPositiveOrNegativeMediaPolarity::PositiveMediaPolarity => 0,
            Icc4_DeviceAttributes_DeviceAttributesPositiveOrNegativeMediaPolarity::NegativeMediaPolarity => 1,
            Icc4_DeviceAttributes_DeviceAttributesPositiveOrNegativeMediaPolarity::Unknown(v) => v
        }
    }
}

impl Default for Icc4_DeviceAttributes_DeviceAttributesPositiveOrNegativeMediaPolarity {
    fn default() -> Self { Icc4_DeviceAttributes_DeviceAttributesPositiveOrNegativeMediaPolarity::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Icc4_DeviceAttributes_DeviceAttributesReflectiveOrTransparency {
    Reflective,
    Transparency,
    Unknown(i64),
}

impl TryFrom<i64> for Icc4_DeviceAttributes_DeviceAttributesReflectiveOrTransparency {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Icc4_DeviceAttributes_DeviceAttributesReflectiveOrTransparency> {
        match flag {
            0 => Ok(Icc4_DeviceAttributes_DeviceAttributesReflectiveOrTransparency::Reflective),
            1 => Ok(Icc4_DeviceAttributes_DeviceAttributesReflectiveOrTransparency::Transparency),
            _ => Ok(Icc4_DeviceAttributes_DeviceAttributesReflectiveOrTransparency::Unknown(flag)),
        }
    }
}

impl From<&Icc4_DeviceAttributes_DeviceAttributesReflectiveOrTransparency> for i64 {
    fn from(v: &Icc4_DeviceAttributes_DeviceAttributesReflectiveOrTransparency) -> Self {
        match *v {
            Icc4_DeviceAttributes_DeviceAttributesReflectiveOrTransparency::Reflective => 0,
            Icc4_DeviceAttributes_DeviceAttributesReflectiveOrTransparency::Transparency => 1,
            Icc4_DeviceAttributes_DeviceAttributesReflectiveOrTransparency::Unknown(v) => v
        }
    }
}

impl Default for Icc4_DeviceAttributes_DeviceAttributesReflectiveOrTransparency {
    fn default() -> Self { Icc4_DeviceAttributes_DeviceAttributesReflectiveOrTransparency::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Icc4_DeviceManufacturer {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    device_manufacturer: RefCell<Icc4_DeviceManufacturer_DeviceManufacturers>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_DeviceManufacturer {
    type Root = Icc4;
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
        *self_rc.device_manufacturer.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        Ok(())
    }
}
impl Icc4_DeviceManufacturer {
}
impl Icc4_DeviceManufacturer {
    pub fn device_manufacturer(&self) -> Ref<'_, Icc4_DeviceManufacturer_DeviceManufacturers> {
        self.device_manufacturer.borrow()
    }
}
impl Icc4_DeviceManufacturer {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Icc4_DeviceManufacturer_DeviceManufacturers {
    ErdtSystemsGmbhAndCoKg,
    AamazingTechnologiesInc,
    AcerPeripherals,
    AcolyteColorResearch,
    ActixSytemsInc,
    AdaraTechnologyInc,
    AdobeSystemsIncorporated,
    AdiSystemsInc,
    AgfaGraphicsNv,
    AlpsElectricUsaInc,
    AlpsElectricUsaInc2,
    AlwanColorExpertise,
    AmiableTechnologiesInc,
    AocInternationalUsaLtd,
    Apago,
    AppleComputerInc,
    Ast,
    AtandtComputerSystems,
    BarbieriElectronic,
    BarcoNv,
    BreakpointPtyLimited,
    BrotherIndustriesLtd,
    Bull,
    BusComputerSystems,
    CItoh,
    IntelCorporation,
    CanonIncCanonDevelopmentAmericasInc,
    CarrollTouch,
    CasioComputerCoLtd,
    ColorbusPl,
    Crossfield,
    Crossfield2,
    CgsPublishingTechnologiesInternationalGmbh,
    RochesterRobotics,
    ColourImagingGroupLondon,
    Citizen,
    CandelaLtd,
    ColorIq,
    ChromacoInc,
    Chromix,
    ColorgraphicCommunicationsCorporation,
    CompaqComputerCorporation,
    CompeqUsaFocusTechnology,
    ConracDisplayProducts,
    CordataTechnologiesInc,
    CompaqComputerCorporation2,
    Colorpro,
    Cornerstone,
    CtxInternationalInc,
    Colorvision,
    FujitsuLaboratoriesLtd,
    DariusTechnologyLtd,
    Dataproducts,
    DryCreekPhoto,
    DigitalContentsResourceCenterChungAngUniversity,
    DellComputerCorporation,
    DainipponInkAndChemicals,
    Diconix,
    Digital,
    DigitalLightAndColor,
    DoppelgangerLlc,
    DainipponScreen,
    Doosol,
    Dupont,
    Epson,
    EskoGraphics,
    ElectronicsAndTelecommunicationsResearchInstitute,
    EverexSystemsInc,
    ExactcodeGmbh,
    EizoNanaoCorporation,
    FalcoDataProductsInc,
    FujiPhotoFilmColtd,
    FujifilmElectronicImagingLtd,
    FnordSoftware,
    ForaInc,
    ForefrontTechnologyCorporation,
    Fujitsu,
    WaytechDevelopmentInc,
    Fujitsu2,
    FujiXeroxCoLtd,
    GccTechnologiesInc,
    GlobalGraphicsSoftwareLimited,
    Gretagmacbeth,
    GmgGmbhAndCoKg,
    GoldstarTechnologyInc,
    GiantprintPtyLtd,
    Gretagmacbeth2,
    WaytechDevelopmentInc2,
    SonyCorporation,
    Hci,
    HeidelbergerDruckmaschinenAg,
    Hermes,
    HitachiAmericaLtd,
    HewlettPackard,
    HitachiLtd,
    HitiDigitalInc,
    IbmCorporation,
    ScitexCorporationLtd,
    HewlettPackard2,
    IiyamaNorthAmericaInc,
    IkegamiElectronicsInc,
    ImageSystemsCorporation,
    IngramMicroInc,
    IntelCorporation2,
    Intl,
    IntraElectronicsUsaInc,
    IocommInternationalTechnologyCorporation,
    InfoprintSolutionsCompany,
    ScitexCorporationLtd3,
    IchikawaSoftLaboratory,
    Itnl,
    Ivm,
    IwatsuElectricCoLtd,
    ScitexCorporationLtd2,
    IncaDigitalPrintersLtd,
    ScitexCorporationLtd4,
    JetsoftDevelopment,
    JvcInformationProductsCo,
    ScitexCorporationLtd6,
    KfcComputekComponentsCorporation,
    KlhComputers,
    KonicaMinoltaHoldingsInc,
    KonicaCorporation,
    Kodak,
    Kyocera,
    ScitexCorporationLtd7,
    LeicaCameraAg,
    LeedsColour,
    LeftDakota,
    LeadingTechnologyInc,
    LexmarkInternationalInc,
    LinkComputerInc,
    Linotronic,
    LiteOnInc,
    MagComputronicUsaInc,
    MagInnovisionInc,
    Mannesmann,
    MicronTechnologyInc,
    Microtek,
    MicrovitecInc,
    Minolta,
    MitsubishiElectronicsAmericaInc,
    MitsubaCorporation,
    Minolta2,
    ModgraphInc,
    MonitronixInc,
    MonacoSystemsInc,
    MorseTechnologyInc,
    MotiveSystems,
    MicrosoftCorporation,
    MutohIndustriesLtd,
    MitsubishiElectricCorporationKyotoWorks,
    NanaoUsaCorporation,
    NecCorporation,
    NexpressSolutionsLlc,
    NisseiSangyoAmericaLtd,
    NikonCorporation,
    OceTechnologiesBv,
    Ocecolor,
    Oki,
    Okidata,
    Okidata2,
    Olivetti,
    OlympusOpticalCoLtd,
    OnyxGraphics,
    Optiquest,
    PackardBell,
    MatsushitaElectricIndustrialCoLtd,
    PantoneInc,
    PackardBell2,
    PfuLimited,
    PhilipsConsumerElectronicsCo,
    HoyaCorporationPentaxImagingSystemsDivision,
    PhaseOneAS,
    PremierComputerInnovations,
    PrincetonGraphicSystems,
    PrincetonPublishingLabs,
    Qlux,
    QmsInc,
    QpcardAb,
    Quadlaser,
    QumeCorporation,
    RadiusInc,
    IntegratedColorSolutionsInc2,
    RolandDgCorporation,
    RedmsGroupInc,
    Relisys,
    RolfGierlingMultitools,
    RicohCorporation,
    EdmundRonald,
    Royal,
    RicohPrintingSystemsltd,
    RoyalInformationElectronicsCoLtd,
    SampoCorporationOfAmerica,
    SamsungInc,
    JaimeSantanaPomares,
    ScitexCorporationLtd9,
    DainipponScreen3,
    ScitexCorporationLtd12,
    SamsungElectronicsColtd,
    SeikoInstrumentsUsaInc,
    Seikosha,
    Scanguycom,
    SharpLaboratories,
    InternationalColorConsortium,
    SonyCorporation2,
    Spectracal,
    Star,
    SampoTechnologyCorporation,
    ScitexCorporationLtd10,
    ScitexCorporationLtd13,
    SonyCorporation3,
    TalonTechnologyCorporation,
    Tandy,
    TatungCoOfAmericaInc,
    TaxanAmericaInc,
    TokyoDenshiSekeiKk,
    TecoInformationSystemsInc,
    Tegra,
    TektronixInc,
    TexasInstruments,
    TypemakerLtd,
    ToshibaCorp,
    ToshibaInc,
    TotokuElectricCoLtd,
    Triumph,
    ToshibaTecCorporation,
    TtxComputerProductsInc,
    TvmProfessionalMonitorCorporation,
    TwCasperCorporation,
    UleadSystems,
    Unisys,
    UtzFehlauAndSohn,
    Varityper,
    Viewsonic,
    VisualCommunication,
    Wang,
    WilburImaging,
    WareToGo,
    WyseTechnology,
    XeroxCorporation,
    XRite,
    LavanyasTestCompany,
    ZoranCorporation,
    ZebraTechnologiesInc,
    BasiccolorGmbh,
    BergdesignIncorporated,
    IntegratedColorSolutionsInc,
    MacdermidColorspanInc,
    DainipponScreen2,
    Dupont2,
    FujifilmElectronicImagingLtd2,
    FluxdataCorporation,
    ScitexCorporationLtd5,
    ScitexCorporationLtd8,
    ErdtSystemsGmbhAndCoKg2,
    MedigraphGmbh,
    QubyxSarl,
    ScitexCorporationLtd11,
    DainipponScreen4,
    ScitexCorporationLtd14,
    SiwiGrafikaCorporation,
    YxymasterGmbh,
    Unknown(i64),
}

impl TryFrom<i64> for Icc4_DeviceManufacturer_DeviceManufacturers {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Icc4_DeviceManufacturer_DeviceManufacturers> {
        match flag {
            878981744 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ErdtSystemsGmbhAndCoKg),
            1094798657 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::AamazingTechnologiesInc),
            1094927698 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::AcerPeripherals),
            1094929492 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::AcolyteColorResearch),
            1094931529 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ActixSytemsInc),
            1094992210 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::AdaraTechnologyInc),
            1094992453 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::AdobeSystemsIncorporated),
            1094994208 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::AdiSystemsInc),
            1095190081 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::AgfaGraphicsNv),
            1095519556 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::AlpsElectricUsaInc),
            1095520339 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::AlpsElectricUsaInc2),
            1095522126 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::AlwanColorExpertise),
            1095586889 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::AmiableTechnologiesInc),
            1095713568 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::AocInternationalUsaLtd),
            1095778631 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Apago),
            1095782476 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::AppleComputerInc),
            1095980064 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Ast),
            1096033876 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::AtandtComputerSystems),
            1111573836 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::BarbieriElectronic),
            1112687439 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::BarcoNv),
            1112689488 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::BreakpointPtyLimited),
            1112690516 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::BrotherIndustriesLtd),
            1112886348 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Bull),
            1112888096 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::BusComputerSystems),
            1127041364 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::CItoh),
            1128353106 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::IntelCorporation),
            1128353359 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::CanonIncCanonDevelopmentAmericasInc),
            1128354386 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::CarrollTouch),
            1128354633 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::CasioComputerCoLtd),
            1128420691 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ColorbusPl),
            1128614944 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Crossfield),
            1128615032 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Crossfield2),
            1128747808 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::CgsPublishingTechnologiesInternationalGmbh),
            1128811808 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::RochesterRobotics),
            1128875852 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ColourImagingGroupLondon),
            1128879177 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Citizen),
            1129066544 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::CandelaLtd),
            1129072977 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ColorIq),
            1129136975 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ChromacoInc),
            1129146712 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Chromix),
            1129270351 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ColorgraphicCommunicationsCorporation),
            1129270608 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::CompaqComputerCorporation),
            1129270640 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::CompeqUsaFocusTechnology),
            1129270866 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ConracDisplayProducts),
            1129271876 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::CordataTechnologiesInc),
            1129337120 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::CompaqComputerCorporation2),
            1129337423 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Colorpro),
            1129467424 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Cornerstone),
            1129601056 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::CtxInternationalInc),
            1129728339 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Colorvision),
            1129792288 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::FujitsuLaboratoriesLtd),
            1145131593 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::DariusTechnologyLtd),
            1145132097 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Dataproducts),
            1145262112 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::DryCreekPhoto),
            1145262659 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::DigitalContentsResourceCenterChungAngUniversity),
            1145392204 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::DellComputerCorporation),
            1145652000 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::DainipponInkAndChemicals),
            1145652047 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Diconix),
            1145653065 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Digital),
            1145841219 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::DigitalLightAndColor),
            1146113095 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::DoppelgangerLlc),
            1146298400 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::DainipponScreen),
            1146310476 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Doosol),
            1146441806 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Dupont),
            1162892111 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Epson),
            1163086671 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::EskoGraphics),
            1163153993 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ElectronicsAndTelecommunicationsResearchInstitute),
            1163281746 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::EverexSystemsInc),
            1163411779 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ExactcodeGmbh),
            1164540527 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::EizoNanaoCorporation),
            1178684483 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::FalcoDataProductsInc),
            1179000864 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::FujiPhotoFilmColtd),
            1179010377 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::FujifilmElectronicImagingLtd),
            1179537988 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::FnordSoftware),
            1179603521 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ForaInc),
            1179603525 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ForefrontTechnologyCorporation),
            1179658794 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Fujitsu),
            1179664672 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::WaytechDevelopmentInc),
            1179994697 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Fujitsu2),
            1180180512 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::FujiXeroxCoLtd),
            1195590432 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::GccTechnologiesInc),
            1195856716 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::GlobalGraphicsSoftwareLimited),
            1196245536 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Gretagmacbeth),
            1196246816 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::GmgGmbhAndCoKg),
            1196379204 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::GoldstarTechnologyInc),
            1196446292 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::GiantprintPtyLtd),
            1196707138 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Gretagmacbeth2),
            1196835616 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::WaytechDevelopmentInc2),
            1196896843 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::SonyCorporation),
            1212369184 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Hci),
            1212435744 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::HeidelbergerDruckmaschinenAg),
            1212502605 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Hermes),
            1212765249 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::HitachiAmericaLtd),
            1213210656 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::HewlettPackard),
            1213481760 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::HitachiLtd),
            1214862441 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::HitiDigitalInc),
            1229081888 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::IbmCorporation),
            1229213268 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd),
            1229275936 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::HewlettPackard2),
            1229543745 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::IiyamaNorthAmericaInc),
            1229669703 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::IkegamiElectronicsInc),
            1229799751 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ImageSystemsCorporation),
            1229801760 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::IngramMicroInc),
            1229870147 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::IntelCorporation2),
            1229870156 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Intl),
            1229870162 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::IntraElectronicsUsaInc),
            1229931343 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::IocommInternationalTechnologyCorporation),
            1230000928 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::InfoprintSolutionsCompany),
            1230129491 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd3),
            1230195744 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::IchikawaSoftLaboratory),
            1230261836 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Itnl),
            1230392608 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Ivm),
            1230455124 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::IwatsuElectricCoLtd),
            1231318644 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd2),
            1231971169 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::IncaDigitalPrintersLtd),
            1232234867 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd4),
            1246971476 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::JetsoftDevelopment),
            1247167264 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::JvcInformationProductsCo),
            1262572116 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd6),
            1262895904 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::KfcComputekComponentsCorporation),
            1263290400 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::KlhComputers),
            1263355972 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::KonicaMinoltaHoldingsInc),
            1263420225 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::KonicaCorporation),
            1263486017 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Kodak),
            1264144195 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Kyocera),
            1264677492 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd7),
            1279476039 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::LeicaCameraAg),
            1279476548 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::LeedsColour),
            1279541579 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::LeftDakota),
            1279607108 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::LeadingTechnologyInc),
            1279613005 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::LexmarkInternationalInc),
            1279872587 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::LinkComputerInc),
            1279872591 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Linotronic),
            1279874117 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::LiteOnInc),
            1296123715 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::MagComputronicUsaInc),
            1296123721 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::MagInnovisionInc),
            1296125518 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Mannesmann),
            1296646990 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::MicronTechnologyInc),
            1296646994 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Microtek),
            1296646998 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::MicrovitecInc),
            1296649807 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Minolta),
            1296651347 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::MitsubishiElectronicsAmericaInc),
            1296651379 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::MitsubaCorporation),
            1296976980 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Minolta2),
            1297040455 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ModgraphInc),
            1297043017 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::MonitronixInc),
            1297043027 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::MonacoSystemsInc),
            1297044051 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::MorseTechnologyInc),
            1297044553 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::MotiveSystems),
            1297303124 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::MicrosoftCorporation),
            1297437775 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::MutohIndustriesLtd),
            1298756723 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::MitsubishiElectricCorporationKyotoWorks),
            1312902721 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::NanaoUsaCorporation),
            1313162016 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::NecCorporation),
            1313167440 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::NexpressSolutionsLlc),
            1313428307 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::NisseiSangyoAmericaLtd),
            1313558350 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::NikonCorporation),
            1329808672 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::OceTechnologiesBv),
            1329808707 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Ocecolor),
            1330333984 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Oki),
            1330334020 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Okidata),
            1330334032 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Okidata2),
            1330399574 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Olivetti),
            1330403661 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::OlympusOpticalCoLtd),
            1330534744 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::OnyxGraphics),
            1330664521 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Optiquest),
            1346454347 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::PackardBell),
            1346457153 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::MatsushitaElectricIndustrialCoLtd),
            1346457172 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::PantoneInc),
            1346522656 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::PackardBell2),
            1346786592 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::PfuLimited),
            1346914636 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::PhilipsConsumerElectronicsCo),
            1347310680 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::HoyaCorporationPentaxImagingSystemsDivision),
            1347382885 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::PhaseOneAS),
            1347568973 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::PremierComputerInnovations),
            1347569998 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::PrincetonGraphicSystems),
            1347570000 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::PrincetonPublishingLabs),
            1363957080 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Qlux),
            1364022048 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::QmsInc),
            1364214596 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::QpcardAb),
            1364541764 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Quadlaser),
            1364544837 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::QumeCorporation),
            1380009033 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::RadiusInc),
            1380205688 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::IntegratedColorSolutionsInc2),
            1380206368 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::RolandDgCorporation),
            1380271181 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::RedmsGroupInc),
            1380273225 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Relisys),
            1380404563 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::RolfGierlingMultitools),
            1380533071 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::RicohCorporation),
            1380863044 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::EdmundRonald),
            1380931905 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Royal),
            1380991776 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::RicohPrintingSystemsltd),
            1381256224 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::RoyalInformationElectronicsCoLtd),
            1396788560 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::SampoCorporationOfAmerica),
            1396788563 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::SamsungInc),
            1396788820 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::JaimeSantanaPomares),
            1396918612 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd9),
            1396920910 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::DainipponScreen3),
            1396985888 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd12),
            1397048096 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::SamsungElectronicsColtd),
            1397049675 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::SeikoInstrumentsUsaInc),
            1397049707 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Seikosha),
            1397183833 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Scanguycom),
            1397244242 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::SharpLaboratories),
            1397310275 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::InternationalColorConsortium),
            1397706329 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::SonyCorporation2),
            1397769036 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Spectracal),
            1398030674 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Star),
            1398031136 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::SampoTechnologyCorporation),
            1399023988 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd10),
            1399091232 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd13),
            1399811705 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::SonyCorporation3),
            1413565519 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::TalonTechnologyCorporation),
            1413566020 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Tandy),
            1413567573 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::TatungCoOfAmericaInc),
            1413568577 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::TaxanAmericaInc),
            1413763872 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::TokyoDenshiSekeiKk),
            1413825359 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::TecoInformationSystemsInc),
            1413826386 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Tegra),
            1413827412 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::TektronixInc),
            1414078496 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::TexasInstruments),
            1414351698 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::TypemakerLtd),
            1414484802 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ToshibaCorp),
            1414484808 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ToshibaInc),
            1414485067 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::TotokuElectricCoLtd),
            1414678869 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Triumph),
            1414742612 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ToshibaTecCorporation),
            1414813728 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::TtxComputerProductsInc),
            1414941984 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::TvmProfessionalMonitorCorporation),
            1414996000 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::TwCasperCorporation),
            1431065432 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::UleadSystems),
            1431193939 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Unisys),
            1431591494 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::UtzFehlauAndSohn),
            1447121481 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Varityper),
            1447642455 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Viewsonic),
            1447646028 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::VisualCommunication),
            1463897671 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Wang),
            1464615506 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::WilburImaging),
            1465141042 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::WareToGo),
            1465471813 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::WyseTechnology),
            1480938072 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::XeroxCorporation),
            1481787732 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::XRite),
            1513173555 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::LavanyasTestCompany),
            1515340110 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ZoranCorporation),
            1516593778 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ZebraTechnologiesInc),
            1648968515 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::BasiccolorGmbh),
            1650815591 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::BergdesignIncorporated),
            1667594596 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::IntegratedColorSolutionsInc),
            1668051824 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::MacdermidColorspanInc),
            1685266464 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::DainipponScreen2),
            1685418094 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Dupont2),
            1717986665 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::FujifilmElectronicImagingLtd2),
            1718383992 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::FluxdataCorporation),
            1769105779 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd5),
            1801548404 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd8),
            1868706916 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ErdtSystemsGmbhAndCoKg2),
            1868720483 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::MedigraphGmbh),
            1903518329 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::QubyxSarl),
            1935894900 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd11),
            1935897198 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::DainipponScreen4),
            1935962144 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd14),
            1936291689 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::SiwiGrafikaCorporation),
            2037938541 => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::YxymasterGmbh),
            _ => Ok(Icc4_DeviceManufacturer_DeviceManufacturers::Unknown(flag)),
        }
    }
}

impl From<&Icc4_DeviceManufacturer_DeviceManufacturers> for i64 {
    fn from(v: &Icc4_DeviceManufacturer_DeviceManufacturers) -> Self {
        match *v {
            Icc4_DeviceManufacturer_DeviceManufacturers::ErdtSystemsGmbhAndCoKg => 878981744,
            Icc4_DeviceManufacturer_DeviceManufacturers::AamazingTechnologiesInc => 1094798657,
            Icc4_DeviceManufacturer_DeviceManufacturers::AcerPeripherals => 1094927698,
            Icc4_DeviceManufacturer_DeviceManufacturers::AcolyteColorResearch => 1094929492,
            Icc4_DeviceManufacturer_DeviceManufacturers::ActixSytemsInc => 1094931529,
            Icc4_DeviceManufacturer_DeviceManufacturers::AdaraTechnologyInc => 1094992210,
            Icc4_DeviceManufacturer_DeviceManufacturers::AdobeSystemsIncorporated => 1094992453,
            Icc4_DeviceManufacturer_DeviceManufacturers::AdiSystemsInc => 1094994208,
            Icc4_DeviceManufacturer_DeviceManufacturers::AgfaGraphicsNv => 1095190081,
            Icc4_DeviceManufacturer_DeviceManufacturers::AlpsElectricUsaInc => 1095519556,
            Icc4_DeviceManufacturer_DeviceManufacturers::AlpsElectricUsaInc2 => 1095520339,
            Icc4_DeviceManufacturer_DeviceManufacturers::AlwanColorExpertise => 1095522126,
            Icc4_DeviceManufacturer_DeviceManufacturers::AmiableTechnologiesInc => 1095586889,
            Icc4_DeviceManufacturer_DeviceManufacturers::AocInternationalUsaLtd => 1095713568,
            Icc4_DeviceManufacturer_DeviceManufacturers::Apago => 1095778631,
            Icc4_DeviceManufacturer_DeviceManufacturers::AppleComputerInc => 1095782476,
            Icc4_DeviceManufacturer_DeviceManufacturers::Ast => 1095980064,
            Icc4_DeviceManufacturer_DeviceManufacturers::AtandtComputerSystems => 1096033876,
            Icc4_DeviceManufacturer_DeviceManufacturers::BarbieriElectronic => 1111573836,
            Icc4_DeviceManufacturer_DeviceManufacturers::BarcoNv => 1112687439,
            Icc4_DeviceManufacturer_DeviceManufacturers::BreakpointPtyLimited => 1112689488,
            Icc4_DeviceManufacturer_DeviceManufacturers::BrotherIndustriesLtd => 1112690516,
            Icc4_DeviceManufacturer_DeviceManufacturers::Bull => 1112886348,
            Icc4_DeviceManufacturer_DeviceManufacturers::BusComputerSystems => 1112888096,
            Icc4_DeviceManufacturer_DeviceManufacturers::CItoh => 1127041364,
            Icc4_DeviceManufacturer_DeviceManufacturers::IntelCorporation => 1128353106,
            Icc4_DeviceManufacturer_DeviceManufacturers::CanonIncCanonDevelopmentAmericasInc => 1128353359,
            Icc4_DeviceManufacturer_DeviceManufacturers::CarrollTouch => 1128354386,
            Icc4_DeviceManufacturer_DeviceManufacturers::CasioComputerCoLtd => 1128354633,
            Icc4_DeviceManufacturer_DeviceManufacturers::ColorbusPl => 1128420691,
            Icc4_DeviceManufacturer_DeviceManufacturers::Crossfield => 1128614944,
            Icc4_DeviceManufacturer_DeviceManufacturers::Crossfield2 => 1128615032,
            Icc4_DeviceManufacturer_DeviceManufacturers::CgsPublishingTechnologiesInternationalGmbh => 1128747808,
            Icc4_DeviceManufacturer_DeviceManufacturers::RochesterRobotics => 1128811808,
            Icc4_DeviceManufacturer_DeviceManufacturers::ColourImagingGroupLondon => 1128875852,
            Icc4_DeviceManufacturer_DeviceManufacturers::Citizen => 1128879177,
            Icc4_DeviceManufacturer_DeviceManufacturers::CandelaLtd => 1129066544,
            Icc4_DeviceManufacturer_DeviceManufacturers::ColorIq => 1129072977,
            Icc4_DeviceManufacturer_DeviceManufacturers::ChromacoInc => 1129136975,
            Icc4_DeviceManufacturer_DeviceManufacturers::Chromix => 1129146712,
            Icc4_DeviceManufacturer_DeviceManufacturers::ColorgraphicCommunicationsCorporation => 1129270351,
            Icc4_DeviceManufacturer_DeviceManufacturers::CompaqComputerCorporation => 1129270608,
            Icc4_DeviceManufacturer_DeviceManufacturers::CompeqUsaFocusTechnology => 1129270640,
            Icc4_DeviceManufacturer_DeviceManufacturers::ConracDisplayProducts => 1129270866,
            Icc4_DeviceManufacturer_DeviceManufacturers::CordataTechnologiesInc => 1129271876,
            Icc4_DeviceManufacturer_DeviceManufacturers::CompaqComputerCorporation2 => 1129337120,
            Icc4_DeviceManufacturer_DeviceManufacturers::Colorpro => 1129337423,
            Icc4_DeviceManufacturer_DeviceManufacturers::Cornerstone => 1129467424,
            Icc4_DeviceManufacturer_DeviceManufacturers::CtxInternationalInc => 1129601056,
            Icc4_DeviceManufacturer_DeviceManufacturers::Colorvision => 1129728339,
            Icc4_DeviceManufacturer_DeviceManufacturers::FujitsuLaboratoriesLtd => 1129792288,
            Icc4_DeviceManufacturer_DeviceManufacturers::DariusTechnologyLtd => 1145131593,
            Icc4_DeviceManufacturer_DeviceManufacturers::Dataproducts => 1145132097,
            Icc4_DeviceManufacturer_DeviceManufacturers::DryCreekPhoto => 1145262112,
            Icc4_DeviceManufacturer_DeviceManufacturers::DigitalContentsResourceCenterChungAngUniversity => 1145262659,
            Icc4_DeviceManufacturer_DeviceManufacturers::DellComputerCorporation => 1145392204,
            Icc4_DeviceManufacturer_DeviceManufacturers::DainipponInkAndChemicals => 1145652000,
            Icc4_DeviceManufacturer_DeviceManufacturers::Diconix => 1145652047,
            Icc4_DeviceManufacturer_DeviceManufacturers::Digital => 1145653065,
            Icc4_DeviceManufacturer_DeviceManufacturers::DigitalLightAndColor => 1145841219,
            Icc4_DeviceManufacturer_DeviceManufacturers::DoppelgangerLlc => 1146113095,
            Icc4_DeviceManufacturer_DeviceManufacturers::DainipponScreen => 1146298400,
            Icc4_DeviceManufacturer_DeviceManufacturers::Doosol => 1146310476,
            Icc4_DeviceManufacturer_DeviceManufacturers::Dupont => 1146441806,
            Icc4_DeviceManufacturer_DeviceManufacturers::Epson => 1162892111,
            Icc4_DeviceManufacturer_DeviceManufacturers::EskoGraphics => 1163086671,
            Icc4_DeviceManufacturer_DeviceManufacturers::ElectronicsAndTelecommunicationsResearchInstitute => 1163153993,
            Icc4_DeviceManufacturer_DeviceManufacturers::EverexSystemsInc => 1163281746,
            Icc4_DeviceManufacturer_DeviceManufacturers::ExactcodeGmbh => 1163411779,
            Icc4_DeviceManufacturer_DeviceManufacturers::EizoNanaoCorporation => 1164540527,
            Icc4_DeviceManufacturer_DeviceManufacturers::FalcoDataProductsInc => 1178684483,
            Icc4_DeviceManufacturer_DeviceManufacturers::FujiPhotoFilmColtd => 1179000864,
            Icc4_DeviceManufacturer_DeviceManufacturers::FujifilmElectronicImagingLtd => 1179010377,
            Icc4_DeviceManufacturer_DeviceManufacturers::FnordSoftware => 1179537988,
            Icc4_DeviceManufacturer_DeviceManufacturers::ForaInc => 1179603521,
            Icc4_DeviceManufacturer_DeviceManufacturers::ForefrontTechnologyCorporation => 1179603525,
            Icc4_DeviceManufacturer_DeviceManufacturers::Fujitsu => 1179658794,
            Icc4_DeviceManufacturer_DeviceManufacturers::WaytechDevelopmentInc => 1179664672,
            Icc4_DeviceManufacturer_DeviceManufacturers::Fujitsu2 => 1179994697,
            Icc4_DeviceManufacturer_DeviceManufacturers::FujiXeroxCoLtd => 1180180512,
            Icc4_DeviceManufacturer_DeviceManufacturers::GccTechnologiesInc => 1195590432,
            Icc4_DeviceManufacturer_DeviceManufacturers::GlobalGraphicsSoftwareLimited => 1195856716,
            Icc4_DeviceManufacturer_DeviceManufacturers::Gretagmacbeth => 1196245536,
            Icc4_DeviceManufacturer_DeviceManufacturers::GmgGmbhAndCoKg => 1196246816,
            Icc4_DeviceManufacturer_DeviceManufacturers::GoldstarTechnologyInc => 1196379204,
            Icc4_DeviceManufacturer_DeviceManufacturers::GiantprintPtyLtd => 1196446292,
            Icc4_DeviceManufacturer_DeviceManufacturers::Gretagmacbeth2 => 1196707138,
            Icc4_DeviceManufacturer_DeviceManufacturers::WaytechDevelopmentInc2 => 1196835616,
            Icc4_DeviceManufacturer_DeviceManufacturers::SonyCorporation => 1196896843,
            Icc4_DeviceManufacturer_DeviceManufacturers::Hci => 1212369184,
            Icc4_DeviceManufacturer_DeviceManufacturers::HeidelbergerDruckmaschinenAg => 1212435744,
            Icc4_DeviceManufacturer_DeviceManufacturers::Hermes => 1212502605,
            Icc4_DeviceManufacturer_DeviceManufacturers::HitachiAmericaLtd => 1212765249,
            Icc4_DeviceManufacturer_DeviceManufacturers::HewlettPackard => 1213210656,
            Icc4_DeviceManufacturer_DeviceManufacturers::HitachiLtd => 1213481760,
            Icc4_DeviceManufacturer_DeviceManufacturers::HitiDigitalInc => 1214862441,
            Icc4_DeviceManufacturer_DeviceManufacturers::IbmCorporation => 1229081888,
            Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd => 1229213268,
            Icc4_DeviceManufacturer_DeviceManufacturers::HewlettPackard2 => 1229275936,
            Icc4_DeviceManufacturer_DeviceManufacturers::IiyamaNorthAmericaInc => 1229543745,
            Icc4_DeviceManufacturer_DeviceManufacturers::IkegamiElectronicsInc => 1229669703,
            Icc4_DeviceManufacturer_DeviceManufacturers::ImageSystemsCorporation => 1229799751,
            Icc4_DeviceManufacturer_DeviceManufacturers::IngramMicroInc => 1229801760,
            Icc4_DeviceManufacturer_DeviceManufacturers::IntelCorporation2 => 1229870147,
            Icc4_DeviceManufacturer_DeviceManufacturers::Intl => 1229870156,
            Icc4_DeviceManufacturer_DeviceManufacturers::IntraElectronicsUsaInc => 1229870162,
            Icc4_DeviceManufacturer_DeviceManufacturers::IocommInternationalTechnologyCorporation => 1229931343,
            Icc4_DeviceManufacturer_DeviceManufacturers::InfoprintSolutionsCompany => 1230000928,
            Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd3 => 1230129491,
            Icc4_DeviceManufacturer_DeviceManufacturers::IchikawaSoftLaboratory => 1230195744,
            Icc4_DeviceManufacturer_DeviceManufacturers::Itnl => 1230261836,
            Icc4_DeviceManufacturer_DeviceManufacturers::Ivm => 1230392608,
            Icc4_DeviceManufacturer_DeviceManufacturers::IwatsuElectricCoLtd => 1230455124,
            Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd2 => 1231318644,
            Icc4_DeviceManufacturer_DeviceManufacturers::IncaDigitalPrintersLtd => 1231971169,
            Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd4 => 1232234867,
            Icc4_DeviceManufacturer_DeviceManufacturers::JetsoftDevelopment => 1246971476,
            Icc4_DeviceManufacturer_DeviceManufacturers::JvcInformationProductsCo => 1247167264,
            Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd6 => 1262572116,
            Icc4_DeviceManufacturer_DeviceManufacturers::KfcComputekComponentsCorporation => 1262895904,
            Icc4_DeviceManufacturer_DeviceManufacturers::KlhComputers => 1263290400,
            Icc4_DeviceManufacturer_DeviceManufacturers::KonicaMinoltaHoldingsInc => 1263355972,
            Icc4_DeviceManufacturer_DeviceManufacturers::KonicaCorporation => 1263420225,
            Icc4_DeviceManufacturer_DeviceManufacturers::Kodak => 1263486017,
            Icc4_DeviceManufacturer_DeviceManufacturers::Kyocera => 1264144195,
            Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd7 => 1264677492,
            Icc4_DeviceManufacturer_DeviceManufacturers::LeicaCameraAg => 1279476039,
            Icc4_DeviceManufacturer_DeviceManufacturers::LeedsColour => 1279476548,
            Icc4_DeviceManufacturer_DeviceManufacturers::LeftDakota => 1279541579,
            Icc4_DeviceManufacturer_DeviceManufacturers::LeadingTechnologyInc => 1279607108,
            Icc4_DeviceManufacturer_DeviceManufacturers::LexmarkInternationalInc => 1279613005,
            Icc4_DeviceManufacturer_DeviceManufacturers::LinkComputerInc => 1279872587,
            Icc4_DeviceManufacturer_DeviceManufacturers::Linotronic => 1279872591,
            Icc4_DeviceManufacturer_DeviceManufacturers::LiteOnInc => 1279874117,
            Icc4_DeviceManufacturer_DeviceManufacturers::MagComputronicUsaInc => 1296123715,
            Icc4_DeviceManufacturer_DeviceManufacturers::MagInnovisionInc => 1296123721,
            Icc4_DeviceManufacturer_DeviceManufacturers::Mannesmann => 1296125518,
            Icc4_DeviceManufacturer_DeviceManufacturers::MicronTechnologyInc => 1296646990,
            Icc4_DeviceManufacturer_DeviceManufacturers::Microtek => 1296646994,
            Icc4_DeviceManufacturer_DeviceManufacturers::MicrovitecInc => 1296646998,
            Icc4_DeviceManufacturer_DeviceManufacturers::Minolta => 1296649807,
            Icc4_DeviceManufacturer_DeviceManufacturers::MitsubishiElectronicsAmericaInc => 1296651347,
            Icc4_DeviceManufacturer_DeviceManufacturers::MitsubaCorporation => 1296651379,
            Icc4_DeviceManufacturer_DeviceManufacturers::Minolta2 => 1296976980,
            Icc4_DeviceManufacturer_DeviceManufacturers::ModgraphInc => 1297040455,
            Icc4_DeviceManufacturer_DeviceManufacturers::MonitronixInc => 1297043017,
            Icc4_DeviceManufacturer_DeviceManufacturers::MonacoSystemsInc => 1297043027,
            Icc4_DeviceManufacturer_DeviceManufacturers::MorseTechnologyInc => 1297044051,
            Icc4_DeviceManufacturer_DeviceManufacturers::MotiveSystems => 1297044553,
            Icc4_DeviceManufacturer_DeviceManufacturers::MicrosoftCorporation => 1297303124,
            Icc4_DeviceManufacturer_DeviceManufacturers::MutohIndustriesLtd => 1297437775,
            Icc4_DeviceManufacturer_DeviceManufacturers::MitsubishiElectricCorporationKyotoWorks => 1298756723,
            Icc4_DeviceManufacturer_DeviceManufacturers::NanaoUsaCorporation => 1312902721,
            Icc4_DeviceManufacturer_DeviceManufacturers::NecCorporation => 1313162016,
            Icc4_DeviceManufacturer_DeviceManufacturers::NexpressSolutionsLlc => 1313167440,
            Icc4_DeviceManufacturer_DeviceManufacturers::NisseiSangyoAmericaLtd => 1313428307,
            Icc4_DeviceManufacturer_DeviceManufacturers::NikonCorporation => 1313558350,
            Icc4_DeviceManufacturer_DeviceManufacturers::OceTechnologiesBv => 1329808672,
            Icc4_DeviceManufacturer_DeviceManufacturers::Ocecolor => 1329808707,
            Icc4_DeviceManufacturer_DeviceManufacturers::Oki => 1330333984,
            Icc4_DeviceManufacturer_DeviceManufacturers::Okidata => 1330334020,
            Icc4_DeviceManufacturer_DeviceManufacturers::Okidata2 => 1330334032,
            Icc4_DeviceManufacturer_DeviceManufacturers::Olivetti => 1330399574,
            Icc4_DeviceManufacturer_DeviceManufacturers::OlympusOpticalCoLtd => 1330403661,
            Icc4_DeviceManufacturer_DeviceManufacturers::OnyxGraphics => 1330534744,
            Icc4_DeviceManufacturer_DeviceManufacturers::Optiquest => 1330664521,
            Icc4_DeviceManufacturer_DeviceManufacturers::PackardBell => 1346454347,
            Icc4_DeviceManufacturer_DeviceManufacturers::MatsushitaElectricIndustrialCoLtd => 1346457153,
            Icc4_DeviceManufacturer_DeviceManufacturers::PantoneInc => 1346457172,
            Icc4_DeviceManufacturer_DeviceManufacturers::PackardBell2 => 1346522656,
            Icc4_DeviceManufacturer_DeviceManufacturers::PfuLimited => 1346786592,
            Icc4_DeviceManufacturer_DeviceManufacturers::PhilipsConsumerElectronicsCo => 1346914636,
            Icc4_DeviceManufacturer_DeviceManufacturers::HoyaCorporationPentaxImagingSystemsDivision => 1347310680,
            Icc4_DeviceManufacturer_DeviceManufacturers::PhaseOneAS => 1347382885,
            Icc4_DeviceManufacturer_DeviceManufacturers::PremierComputerInnovations => 1347568973,
            Icc4_DeviceManufacturer_DeviceManufacturers::PrincetonGraphicSystems => 1347569998,
            Icc4_DeviceManufacturer_DeviceManufacturers::PrincetonPublishingLabs => 1347570000,
            Icc4_DeviceManufacturer_DeviceManufacturers::Qlux => 1363957080,
            Icc4_DeviceManufacturer_DeviceManufacturers::QmsInc => 1364022048,
            Icc4_DeviceManufacturer_DeviceManufacturers::QpcardAb => 1364214596,
            Icc4_DeviceManufacturer_DeviceManufacturers::Quadlaser => 1364541764,
            Icc4_DeviceManufacturer_DeviceManufacturers::QumeCorporation => 1364544837,
            Icc4_DeviceManufacturer_DeviceManufacturers::RadiusInc => 1380009033,
            Icc4_DeviceManufacturer_DeviceManufacturers::IntegratedColorSolutionsInc2 => 1380205688,
            Icc4_DeviceManufacturer_DeviceManufacturers::RolandDgCorporation => 1380206368,
            Icc4_DeviceManufacturer_DeviceManufacturers::RedmsGroupInc => 1380271181,
            Icc4_DeviceManufacturer_DeviceManufacturers::Relisys => 1380273225,
            Icc4_DeviceManufacturer_DeviceManufacturers::RolfGierlingMultitools => 1380404563,
            Icc4_DeviceManufacturer_DeviceManufacturers::RicohCorporation => 1380533071,
            Icc4_DeviceManufacturer_DeviceManufacturers::EdmundRonald => 1380863044,
            Icc4_DeviceManufacturer_DeviceManufacturers::Royal => 1380931905,
            Icc4_DeviceManufacturer_DeviceManufacturers::RicohPrintingSystemsltd => 1380991776,
            Icc4_DeviceManufacturer_DeviceManufacturers::RoyalInformationElectronicsCoLtd => 1381256224,
            Icc4_DeviceManufacturer_DeviceManufacturers::SampoCorporationOfAmerica => 1396788560,
            Icc4_DeviceManufacturer_DeviceManufacturers::SamsungInc => 1396788563,
            Icc4_DeviceManufacturer_DeviceManufacturers::JaimeSantanaPomares => 1396788820,
            Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd9 => 1396918612,
            Icc4_DeviceManufacturer_DeviceManufacturers::DainipponScreen3 => 1396920910,
            Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd12 => 1396985888,
            Icc4_DeviceManufacturer_DeviceManufacturers::SamsungElectronicsColtd => 1397048096,
            Icc4_DeviceManufacturer_DeviceManufacturers::SeikoInstrumentsUsaInc => 1397049675,
            Icc4_DeviceManufacturer_DeviceManufacturers::Seikosha => 1397049707,
            Icc4_DeviceManufacturer_DeviceManufacturers::Scanguycom => 1397183833,
            Icc4_DeviceManufacturer_DeviceManufacturers::SharpLaboratories => 1397244242,
            Icc4_DeviceManufacturer_DeviceManufacturers::InternationalColorConsortium => 1397310275,
            Icc4_DeviceManufacturer_DeviceManufacturers::SonyCorporation2 => 1397706329,
            Icc4_DeviceManufacturer_DeviceManufacturers::Spectracal => 1397769036,
            Icc4_DeviceManufacturer_DeviceManufacturers::Star => 1398030674,
            Icc4_DeviceManufacturer_DeviceManufacturers::SampoTechnologyCorporation => 1398031136,
            Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd10 => 1399023988,
            Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd13 => 1399091232,
            Icc4_DeviceManufacturer_DeviceManufacturers::SonyCorporation3 => 1399811705,
            Icc4_DeviceManufacturer_DeviceManufacturers::TalonTechnologyCorporation => 1413565519,
            Icc4_DeviceManufacturer_DeviceManufacturers::Tandy => 1413566020,
            Icc4_DeviceManufacturer_DeviceManufacturers::TatungCoOfAmericaInc => 1413567573,
            Icc4_DeviceManufacturer_DeviceManufacturers::TaxanAmericaInc => 1413568577,
            Icc4_DeviceManufacturer_DeviceManufacturers::TokyoDenshiSekeiKk => 1413763872,
            Icc4_DeviceManufacturer_DeviceManufacturers::TecoInformationSystemsInc => 1413825359,
            Icc4_DeviceManufacturer_DeviceManufacturers::Tegra => 1413826386,
            Icc4_DeviceManufacturer_DeviceManufacturers::TektronixInc => 1413827412,
            Icc4_DeviceManufacturer_DeviceManufacturers::TexasInstruments => 1414078496,
            Icc4_DeviceManufacturer_DeviceManufacturers::TypemakerLtd => 1414351698,
            Icc4_DeviceManufacturer_DeviceManufacturers::ToshibaCorp => 1414484802,
            Icc4_DeviceManufacturer_DeviceManufacturers::ToshibaInc => 1414484808,
            Icc4_DeviceManufacturer_DeviceManufacturers::TotokuElectricCoLtd => 1414485067,
            Icc4_DeviceManufacturer_DeviceManufacturers::Triumph => 1414678869,
            Icc4_DeviceManufacturer_DeviceManufacturers::ToshibaTecCorporation => 1414742612,
            Icc4_DeviceManufacturer_DeviceManufacturers::TtxComputerProductsInc => 1414813728,
            Icc4_DeviceManufacturer_DeviceManufacturers::TvmProfessionalMonitorCorporation => 1414941984,
            Icc4_DeviceManufacturer_DeviceManufacturers::TwCasperCorporation => 1414996000,
            Icc4_DeviceManufacturer_DeviceManufacturers::UleadSystems => 1431065432,
            Icc4_DeviceManufacturer_DeviceManufacturers::Unisys => 1431193939,
            Icc4_DeviceManufacturer_DeviceManufacturers::UtzFehlauAndSohn => 1431591494,
            Icc4_DeviceManufacturer_DeviceManufacturers::Varityper => 1447121481,
            Icc4_DeviceManufacturer_DeviceManufacturers::Viewsonic => 1447642455,
            Icc4_DeviceManufacturer_DeviceManufacturers::VisualCommunication => 1447646028,
            Icc4_DeviceManufacturer_DeviceManufacturers::Wang => 1463897671,
            Icc4_DeviceManufacturer_DeviceManufacturers::WilburImaging => 1464615506,
            Icc4_DeviceManufacturer_DeviceManufacturers::WareToGo => 1465141042,
            Icc4_DeviceManufacturer_DeviceManufacturers::WyseTechnology => 1465471813,
            Icc4_DeviceManufacturer_DeviceManufacturers::XeroxCorporation => 1480938072,
            Icc4_DeviceManufacturer_DeviceManufacturers::XRite => 1481787732,
            Icc4_DeviceManufacturer_DeviceManufacturers::LavanyasTestCompany => 1513173555,
            Icc4_DeviceManufacturer_DeviceManufacturers::ZoranCorporation => 1515340110,
            Icc4_DeviceManufacturer_DeviceManufacturers::ZebraTechnologiesInc => 1516593778,
            Icc4_DeviceManufacturer_DeviceManufacturers::BasiccolorGmbh => 1648968515,
            Icc4_DeviceManufacturer_DeviceManufacturers::BergdesignIncorporated => 1650815591,
            Icc4_DeviceManufacturer_DeviceManufacturers::IntegratedColorSolutionsInc => 1667594596,
            Icc4_DeviceManufacturer_DeviceManufacturers::MacdermidColorspanInc => 1668051824,
            Icc4_DeviceManufacturer_DeviceManufacturers::DainipponScreen2 => 1685266464,
            Icc4_DeviceManufacturer_DeviceManufacturers::Dupont2 => 1685418094,
            Icc4_DeviceManufacturer_DeviceManufacturers::FujifilmElectronicImagingLtd2 => 1717986665,
            Icc4_DeviceManufacturer_DeviceManufacturers::FluxdataCorporation => 1718383992,
            Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd5 => 1769105779,
            Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd8 => 1801548404,
            Icc4_DeviceManufacturer_DeviceManufacturers::ErdtSystemsGmbhAndCoKg2 => 1868706916,
            Icc4_DeviceManufacturer_DeviceManufacturers::MedigraphGmbh => 1868720483,
            Icc4_DeviceManufacturer_DeviceManufacturers::QubyxSarl => 1903518329,
            Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd11 => 1935894900,
            Icc4_DeviceManufacturer_DeviceManufacturers::DainipponScreen4 => 1935897198,
            Icc4_DeviceManufacturer_DeviceManufacturers::ScitexCorporationLtd14 => 1935962144,
            Icc4_DeviceManufacturer_DeviceManufacturers::SiwiGrafikaCorporation => 1936291689,
            Icc4_DeviceManufacturer_DeviceManufacturers::YxymasterGmbh => 2037938541,
            Icc4_DeviceManufacturer_DeviceManufacturers::Unknown(v) => v
        }
    }
}

impl Default for Icc4_DeviceManufacturer_DeviceManufacturers {
    fn default() -> Self { Icc4_DeviceManufacturer_DeviceManufacturers::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Icc4_PositionNumber {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    offset_to_data_element: RefCell<u32>,
    size_of_data_element: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_PositionNumber {
    type Root = Icc4;
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
        *self_rc.offset_to_data_element.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.size_of_data_element.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl Icc4_PositionNumber {
}
impl Icc4_PositionNumber {
    pub fn offset_to_data_element(&self) -> Ref<'_, u32> {
        self.offset_to_data_element.borrow()
    }
}
impl Icc4_PositionNumber {
    pub fn size_of_data_element(&self) -> Ref<'_, u32> {
        self.size_of_data_element.borrow()
    }
}
impl Icc4_PositionNumber {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_ProfileHeader {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4>,
    pub _self: SharedType<Self>,
    size: RefCell<u32>,
    preferred_cmm_type: RefCell<Icc4_ProfileHeader_CmmSignatures>,
    version: RefCell<OptRc<Icc4_ProfileHeader_VersionField>>,
    device_class: RefCell<Icc4_ProfileHeader_ProfileClasses>,
    color_space: RefCell<Icc4_ProfileHeader_DataColourSpaces>,
    pcs: RefCell<String>,
    creation_date_time: RefCell<OptRc<Icc4_DateTimeNumber>>,
    file_signature: RefCell<Vec<u8>>,
    primary_platform: RefCell<Icc4_ProfileHeader_PrimaryPlatforms>,
    profile_flags: RefCell<OptRc<Icc4_ProfileHeader_ProfileFlags>>,
    device_manufacturer: RefCell<OptRc<Icc4_DeviceManufacturer>>,
    device_model: RefCell<String>,
    device_attributes: RefCell<OptRc<Icc4_DeviceAttributes>>,
    rendering_intent: RefCell<Icc4_ProfileHeader_RenderingIntents>,
    nciexyz_values_of_illuminant_of_pcs: RefCell<OptRc<Icc4_XyzNumber>>,
    creator: RefCell<OptRc<Icc4_DeviceManufacturer>>,
    identifier: RefCell<Vec<u8>>,
    reserved_data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_ProfileHeader {
    type Root = Icc4;
    type Parent = Icc4;

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
        *self_rc.size.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.preferred_cmm_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        let t = Self::read_into::<_, Icc4_ProfileHeader_VersionField>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.version.borrow_mut() = t;
        *self_rc.device_class.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        *self_rc.color_space.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        *self_rc.pcs.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "ASCII")?;
        let t = Self::read_into::<_, Icc4_DateTimeNumber>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.creation_date_time.borrow_mut() = t;
        *self_rc.file_signature.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.file_signature() == vec![0x61u8, 0x63u8, 0x73u8, 0x70u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/profile_header/seq/7".to_string() }));
        }
        *self_rc.primary_platform.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        let t = Self::read_into::<_, Icc4_ProfileHeader_ProfileFlags>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.profile_flags.borrow_mut() = t;
        let t = Self::read_into::<_, Icc4_DeviceManufacturer>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.device_manufacturer.borrow_mut() = t;
        *self_rc.device_model.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "ASCII")?;
        let t = Self::read_into::<_, Icc4_DeviceAttributes>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.device_attributes.borrow_mut() = t;
        *self_rc.rendering_intent.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        let t = Self::read_into::<_, Icc4_XyzNumber>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.nciexyz_values_of_illuminant_of_pcs.borrow_mut() = t;
        let t = Self::read_into::<_, Icc4_DeviceManufacturer>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.creator.borrow_mut() = t;
        *self_rc.identifier.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        *self_rc.reserved_data.borrow_mut() = _io.read_bytes(28 as usize)?.into();
        Ok(())
    }
}
impl Icc4_ProfileHeader {
}
impl Icc4_ProfileHeader {
    pub fn size(&self) -> Ref<'_, u32> {
        self.size.borrow()
    }
}
impl Icc4_ProfileHeader {
    pub fn preferred_cmm_type(&self) -> Ref<'_, Icc4_ProfileHeader_CmmSignatures> {
        self.preferred_cmm_type.borrow()
    }
}
impl Icc4_ProfileHeader {
    pub fn version(&self) -> Ref<'_, OptRc<Icc4_ProfileHeader_VersionField>> {
        self.version.borrow()
    }
}
impl Icc4_ProfileHeader {
    pub fn device_class(&self) -> Ref<'_, Icc4_ProfileHeader_ProfileClasses> {
        self.device_class.borrow()
    }
}
impl Icc4_ProfileHeader {
    pub fn color_space(&self) -> Ref<'_, Icc4_ProfileHeader_DataColourSpaces> {
        self.color_space.borrow()
    }
}
impl Icc4_ProfileHeader {
    pub fn pcs(&self) -> Ref<'_, String> {
        self.pcs.borrow()
    }
}
impl Icc4_ProfileHeader {
    pub fn creation_date_time(&self) -> Ref<'_, OptRc<Icc4_DateTimeNumber>> {
        self.creation_date_time.borrow()
    }
}
impl Icc4_ProfileHeader {
    pub fn file_signature(&self) -> Ref<'_, Vec<u8>> {
        self.file_signature.borrow()
    }
}
impl Icc4_ProfileHeader {
    pub fn primary_platform(&self) -> Ref<'_, Icc4_ProfileHeader_PrimaryPlatforms> {
        self.primary_platform.borrow()
    }
}
impl Icc4_ProfileHeader {
    pub fn profile_flags(&self) -> Ref<'_, OptRc<Icc4_ProfileHeader_ProfileFlags>> {
        self.profile_flags.borrow()
    }
}
impl Icc4_ProfileHeader {
    pub fn device_manufacturer(&self) -> Ref<'_, OptRc<Icc4_DeviceManufacturer>> {
        self.device_manufacturer.borrow()
    }
}
impl Icc4_ProfileHeader {
    pub fn device_model(&self) -> Ref<'_, String> {
        self.device_model.borrow()
    }
}
impl Icc4_ProfileHeader {
    pub fn device_attributes(&self) -> Ref<'_, OptRc<Icc4_DeviceAttributes>> {
        self.device_attributes.borrow()
    }
}
impl Icc4_ProfileHeader {
    pub fn rendering_intent(&self) -> Ref<'_, Icc4_ProfileHeader_RenderingIntents> {
        self.rendering_intent.borrow()
    }
}
impl Icc4_ProfileHeader {
    pub fn nciexyz_values_of_illuminant_of_pcs(&self) -> Ref<'_, OptRc<Icc4_XyzNumber>> {
        self.nciexyz_values_of_illuminant_of_pcs.borrow()
    }
}
impl Icc4_ProfileHeader {
    pub fn creator(&self) -> Ref<'_, OptRc<Icc4_DeviceManufacturer>> {
        self.creator.borrow()
    }
}
impl Icc4_ProfileHeader {
    pub fn identifier(&self) -> Ref<'_, Vec<u8>> {
        self.identifier.borrow()
    }
}
impl Icc4_ProfileHeader {
    pub fn reserved_data(&self) -> Ref<'_, Vec<u8>> {
        self.reserved_data.borrow()
    }
}
impl Icc4_ProfileHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Icc4_ProfileHeader_CmmSignatures {
    TheImagingFactoryCmm,
    AgfaCmm,
    AdobeCmm,
    ColorGearCmm,
    DemoiccmaxCmm,
    LogosyncCmm,
    EfiCmm,
    ExactScanCmm,
    FujiFilmCmm,
    HarlequinRipCmm,
    HeidelbergCmm,
    KodakCmm,
    KonicaMinoltaCmm,
    OnyxGraphicsCmm,
    DeviceLinkCmm,
    ReficcmaxCmm,
    SampleIccCmm,
    MutohCmm,
    ToshibaCmm,
    ColorGearCmmLite,
    ColorGearCmmC,
    WindowsColorSystemCmm,
    WareToGoCmm,
    AppleCmm,
    ArgyllCmsCmm,
    LittleCmsCmm,
    VivoCmm,
    ZoranCmm,
    Unknown(i64),
}

impl TryFrom<i64> for Icc4_ProfileHeader_CmmSignatures {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Icc4_ProfileHeader_CmmSignatures> {
        match flag {
            858931796 => Ok(Icc4_ProfileHeader_CmmSignatures::TheImagingFactoryCmm),
            1094929747 => Ok(Icc4_ProfileHeader_CmmSignatures::AgfaCmm),
            1094992453 => Ok(Icc4_ProfileHeader_CmmSignatures::AdobeCmm),
            1128484179 => Ok(Icc4_ProfileHeader_CmmSignatures::ColorGearCmm),
            1145654616 => Ok(Icc4_ProfileHeader_CmmSignatures::DemoiccmaxCmm),
            1147629395 => Ok(Icc4_ProfileHeader_CmmSignatures::LogosyncCmm),
            1162234144 => Ok(Icc4_ProfileHeader_CmmSignatures::EfiCmm),
            1163411779 => Ok(Icc4_ProfileHeader_CmmSignatures::ExactScanCmm),
            1179000864 => Ok(Icc4_ProfileHeader_CmmSignatures::FujiFilmCmm),
            1212370253 => Ok(Icc4_ProfileHeader_CmmSignatures::HarlequinRipCmm),
            1212435744 => Ok(Icc4_ProfileHeader_CmmSignatures::HeidelbergCmm),
            1262701907 => Ok(Icc4_ProfileHeader_CmmSignatures::KodakCmm),
            1296256324 => Ok(Icc4_ProfileHeader_CmmSignatures::KonicaMinoltaCmm),
            1330534744 => Ok(Icc4_ProfileHeader_CmmSignatures::OnyxGraphicsCmm),
            1380404563 => Ok(Icc4_ProfileHeader_CmmSignatures::DeviceLinkCmm),
            1380535640 => Ok(Icc4_ProfileHeader_CmmSignatures::ReficcmaxCmm),
            1397310275 => Ok(Icc4_ProfileHeader_CmmSignatures::SampleIccCmm),
            1397311310 => Ok(Icc4_ProfileHeader_CmmSignatures::MutohCmm),
            1413696845 => Ok(Icc4_ProfileHeader_CmmSignatures::ToshibaCmm),
            1430471501 => Ok(Icc4_ProfileHeader_CmmSignatures::ColorGearCmmLite),
            1430474067 => Ok(Icc4_ProfileHeader_CmmSignatures::ColorGearCmmC),
            1464029984 => Ok(Icc4_ProfileHeader_CmmSignatures::WindowsColorSystemCmm),
            1465141024 => Ok(Icc4_ProfileHeader_CmmSignatures::WareToGoCmm),
            1634758764 => Ok(Icc4_ProfileHeader_CmmSignatures::AppleCmm),
            1634887532 => Ok(Icc4_ProfileHeader_CmmSignatures::ArgyllCmsCmm),
            1818455411 => Ok(Icc4_ProfileHeader_CmmSignatures::LittleCmsCmm),
            1986623087 => Ok(Icc4_ProfileHeader_CmmSignatures::VivoCmm),
            2053320752 => Ok(Icc4_ProfileHeader_CmmSignatures::ZoranCmm),
            _ => Ok(Icc4_ProfileHeader_CmmSignatures::Unknown(flag)),
        }
    }
}

impl From<&Icc4_ProfileHeader_CmmSignatures> for i64 {
    fn from(v: &Icc4_ProfileHeader_CmmSignatures) -> Self {
        match *v {
            Icc4_ProfileHeader_CmmSignatures::TheImagingFactoryCmm => 858931796,
            Icc4_ProfileHeader_CmmSignatures::AgfaCmm => 1094929747,
            Icc4_ProfileHeader_CmmSignatures::AdobeCmm => 1094992453,
            Icc4_ProfileHeader_CmmSignatures::ColorGearCmm => 1128484179,
            Icc4_ProfileHeader_CmmSignatures::DemoiccmaxCmm => 1145654616,
            Icc4_ProfileHeader_CmmSignatures::LogosyncCmm => 1147629395,
            Icc4_ProfileHeader_CmmSignatures::EfiCmm => 1162234144,
            Icc4_ProfileHeader_CmmSignatures::ExactScanCmm => 1163411779,
            Icc4_ProfileHeader_CmmSignatures::FujiFilmCmm => 1179000864,
            Icc4_ProfileHeader_CmmSignatures::HarlequinRipCmm => 1212370253,
            Icc4_ProfileHeader_CmmSignatures::HeidelbergCmm => 1212435744,
            Icc4_ProfileHeader_CmmSignatures::KodakCmm => 1262701907,
            Icc4_ProfileHeader_CmmSignatures::KonicaMinoltaCmm => 1296256324,
            Icc4_ProfileHeader_CmmSignatures::OnyxGraphicsCmm => 1330534744,
            Icc4_ProfileHeader_CmmSignatures::DeviceLinkCmm => 1380404563,
            Icc4_ProfileHeader_CmmSignatures::ReficcmaxCmm => 1380535640,
            Icc4_ProfileHeader_CmmSignatures::SampleIccCmm => 1397310275,
            Icc4_ProfileHeader_CmmSignatures::MutohCmm => 1397311310,
            Icc4_ProfileHeader_CmmSignatures::ToshibaCmm => 1413696845,
            Icc4_ProfileHeader_CmmSignatures::ColorGearCmmLite => 1430471501,
            Icc4_ProfileHeader_CmmSignatures::ColorGearCmmC => 1430474067,
            Icc4_ProfileHeader_CmmSignatures::WindowsColorSystemCmm => 1464029984,
            Icc4_ProfileHeader_CmmSignatures::WareToGoCmm => 1465141024,
            Icc4_ProfileHeader_CmmSignatures::AppleCmm => 1634758764,
            Icc4_ProfileHeader_CmmSignatures::ArgyllCmsCmm => 1634887532,
            Icc4_ProfileHeader_CmmSignatures::LittleCmsCmm => 1818455411,
            Icc4_ProfileHeader_CmmSignatures::VivoCmm => 1986623087,
            Icc4_ProfileHeader_CmmSignatures::ZoranCmm => 2053320752,
            Icc4_ProfileHeader_CmmSignatures::Unknown(v) => v
        }
    }
}

impl Default for Icc4_ProfileHeader_CmmSignatures {
    fn default() -> Self { Icc4_ProfileHeader_CmmSignatures::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Icc4_ProfileHeader_DataColourSpaces {
    TwoColour,
    ThreeColour,
    FourColour,
    FiveColour,
    SixColour,
    SevenColour,
    EightColour,
    NineColour,
    TenColour,
    ElevenColour,
    TwelveColour,
    Cmy,
    Cmyk,
    ThirteenColour,
    FourteenColour,
    FifteenColour,
    Gray,
    Hls,
    Hsv,
    CielabOrPcslab,
    Cieluv,
    Rgb,
    NciexyzOrPcsxyz,
    Ycbcr,
    Cieyxy,
    Unknown(i64),
}

impl TryFrom<i64> for Icc4_ProfileHeader_DataColourSpaces {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Icc4_ProfileHeader_DataColourSpaces> {
        match flag {
            843271250 => Ok(Icc4_ProfileHeader_DataColourSpaces::TwoColour),
            860048466 => Ok(Icc4_ProfileHeader_DataColourSpaces::ThreeColour),
            876825682 => Ok(Icc4_ProfileHeader_DataColourSpaces::FourColour),
            893602898 => Ok(Icc4_ProfileHeader_DataColourSpaces::FiveColour),
            910380114 => Ok(Icc4_ProfileHeader_DataColourSpaces::SixColour),
            927157330 => Ok(Icc4_ProfileHeader_DataColourSpaces::SevenColour),
            943934546 => Ok(Icc4_ProfileHeader_DataColourSpaces::EightColour),
            960711762 => Ok(Icc4_ProfileHeader_DataColourSpaces::NineColour),
            1094929490 => Ok(Icc4_ProfileHeader_DataColourSpaces::TenColour),
            1111706706 => Ok(Icc4_ProfileHeader_DataColourSpaces::ElevenColour),
            1128483922 => Ok(Icc4_ProfileHeader_DataColourSpaces::TwelveColour),
            1129142560 => Ok(Icc4_ProfileHeader_DataColourSpaces::Cmy),
            1129142603 => Ok(Icc4_ProfileHeader_DataColourSpaces::Cmyk),
            1145261138 => Ok(Icc4_ProfileHeader_DataColourSpaces::ThirteenColour),
            1162038354 => Ok(Icc4_ProfileHeader_DataColourSpaces::FourteenColour),
            1178815570 => Ok(Icc4_ProfileHeader_DataColourSpaces::FifteenColour),
            1196573017 => Ok(Icc4_ProfileHeader_DataColourSpaces::Gray),
            1212961568 => Ok(Icc4_ProfileHeader_DataColourSpaces::Hls),
            1213421088 => Ok(Icc4_ProfileHeader_DataColourSpaces::Hsv),
            1281450528 => Ok(Icc4_ProfileHeader_DataColourSpaces::CielabOrPcslab),
            1282766368 => Ok(Icc4_ProfileHeader_DataColourSpaces::Cieluv),
            1380401696 => Ok(Icc4_ProfileHeader_DataColourSpaces::Rgb),
            1482250784 => Ok(Icc4_ProfileHeader_DataColourSpaces::NciexyzOrPcsxyz),
            1497588338 => Ok(Icc4_ProfileHeader_DataColourSpaces::Ycbcr),
            1501067552 => Ok(Icc4_ProfileHeader_DataColourSpaces::Cieyxy),
            _ => Ok(Icc4_ProfileHeader_DataColourSpaces::Unknown(flag)),
        }
    }
}

impl From<&Icc4_ProfileHeader_DataColourSpaces> for i64 {
    fn from(v: &Icc4_ProfileHeader_DataColourSpaces) -> Self {
        match *v {
            Icc4_ProfileHeader_DataColourSpaces::TwoColour => 843271250,
            Icc4_ProfileHeader_DataColourSpaces::ThreeColour => 860048466,
            Icc4_ProfileHeader_DataColourSpaces::FourColour => 876825682,
            Icc4_ProfileHeader_DataColourSpaces::FiveColour => 893602898,
            Icc4_ProfileHeader_DataColourSpaces::SixColour => 910380114,
            Icc4_ProfileHeader_DataColourSpaces::SevenColour => 927157330,
            Icc4_ProfileHeader_DataColourSpaces::EightColour => 943934546,
            Icc4_ProfileHeader_DataColourSpaces::NineColour => 960711762,
            Icc4_ProfileHeader_DataColourSpaces::TenColour => 1094929490,
            Icc4_ProfileHeader_DataColourSpaces::ElevenColour => 1111706706,
            Icc4_ProfileHeader_DataColourSpaces::TwelveColour => 1128483922,
            Icc4_ProfileHeader_DataColourSpaces::Cmy => 1129142560,
            Icc4_ProfileHeader_DataColourSpaces::Cmyk => 1129142603,
            Icc4_ProfileHeader_DataColourSpaces::ThirteenColour => 1145261138,
            Icc4_ProfileHeader_DataColourSpaces::FourteenColour => 1162038354,
            Icc4_ProfileHeader_DataColourSpaces::FifteenColour => 1178815570,
            Icc4_ProfileHeader_DataColourSpaces::Gray => 1196573017,
            Icc4_ProfileHeader_DataColourSpaces::Hls => 1212961568,
            Icc4_ProfileHeader_DataColourSpaces::Hsv => 1213421088,
            Icc4_ProfileHeader_DataColourSpaces::CielabOrPcslab => 1281450528,
            Icc4_ProfileHeader_DataColourSpaces::Cieluv => 1282766368,
            Icc4_ProfileHeader_DataColourSpaces::Rgb => 1380401696,
            Icc4_ProfileHeader_DataColourSpaces::NciexyzOrPcsxyz => 1482250784,
            Icc4_ProfileHeader_DataColourSpaces::Ycbcr => 1497588338,
            Icc4_ProfileHeader_DataColourSpaces::Cieyxy => 1501067552,
            Icc4_ProfileHeader_DataColourSpaces::Unknown(v) => v
        }
    }
}

impl Default for Icc4_ProfileHeader_DataColourSpaces {
    fn default() -> Self { Icc4_ProfileHeader_DataColourSpaces::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Icc4_ProfileHeader_PrimaryPlatforms {
    AppleComputerInc,
    MicrosoftCorporation,
    SiliconGraphicsInc,
    SunMicrosystems,
    Unknown(i64),
}

impl TryFrom<i64> for Icc4_ProfileHeader_PrimaryPlatforms {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Icc4_ProfileHeader_PrimaryPlatforms> {
        match flag {
            1095782476 => Ok(Icc4_ProfileHeader_PrimaryPlatforms::AppleComputerInc),
            1297303124 => Ok(Icc4_ProfileHeader_PrimaryPlatforms::MicrosoftCorporation),
            1397180704 => Ok(Icc4_ProfileHeader_PrimaryPlatforms::SiliconGraphicsInc),
            1398099543 => Ok(Icc4_ProfileHeader_PrimaryPlatforms::SunMicrosystems),
            _ => Ok(Icc4_ProfileHeader_PrimaryPlatforms::Unknown(flag)),
        }
    }
}

impl From<&Icc4_ProfileHeader_PrimaryPlatforms> for i64 {
    fn from(v: &Icc4_ProfileHeader_PrimaryPlatforms) -> Self {
        match *v {
            Icc4_ProfileHeader_PrimaryPlatforms::AppleComputerInc => 1095782476,
            Icc4_ProfileHeader_PrimaryPlatforms::MicrosoftCorporation => 1297303124,
            Icc4_ProfileHeader_PrimaryPlatforms::SiliconGraphicsInc => 1397180704,
            Icc4_ProfileHeader_PrimaryPlatforms::SunMicrosystems => 1398099543,
            Icc4_ProfileHeader_PrimaryPlatforms::Unknown(v) => v
        }
    }
}

impl Default for Icc4_ProfileHeader_PrimaryPlatforms {
    fn default() -> Self { Icc4_ProfileHeader_PrimaryPlatforms::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Icc4_ProfileHeader_ProfileClasses {
    AbstractProfile,
    DeviceLinkProfile,
    DisplayDeviceProfile,
    NamedColorProfile,
    OutputDeviceProfile,
    InputDeviceProfile,
    ColorSpaceProfile,
    Unknown(i64),
}

impl TryFrom<i64> for Icc4_ProfileHeader_ProfileClasses {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Icc4_ProfileHeader_ProfileClasses> {
        match flag {
            1633842036 => Ok(Icc4_ProfileHeader_ProfileClasses::AbstractProfile),
            1818848875 => Ok(Icc4_ProfileHeader_ProfileClasses::DeviceLinkProfile),
            1835955314 => Ok(Icc4_ProfileHeader_ProfileClasses::DisplayDeviceProfile),
            1852662636 => Ok(Icc4_ProfileHeader_ProfileClasses::NamedColorProfile),
            1886549106 => Ok(Icc4_ProfileHeader_ProfileClasses::OutputDeviceProfile),
            1935896178 => Ok(Icc4_ProfileHeader_ProfileClasses::InputDeviceProfile),
            1936744803 => Ok(Icc4_ProfileHeader_ProfileClasses::ColorSpaceProfile),
            _ => Ok(Icc4_ProfileHeader_ProfileClasses::Unknown(flag)),
        }
    }
}

impl From<&Icc4_ProfileHeader_ProfileClasses> for i64 {
    fn from(v: &Icc4_ProfileHeader_ProfileClasses) -> Self {
        match *v {
            Icc4_ProfileHeader_ProfileClasses::AbstractProfile => 1633842036,
            Icc4_ProfileHeader_ProfileClasses::DeviceLinkProfile => 1818848875,
            Icc4_ProfileHeader_ProfileClasses::DisplayDeviceProfile => 1835955314,
            Icc4_ProfileHeader_ProfileClasses::NamedColorProfile => 1852662636,
            Icc4_ProfileHeader_ProfileClasses::OutputDeviceProfile => 1886549106,
            Icc4_ProfileHeader_ProfileClasses::InputDeviceProfile => 1935896178,
            Icc4_ProfileHeader_ProfileClasses::ColorSpaceProfile => 1936744803,
            Icc4_ProfileHeader_ProfileClasses::Unknown(v) => v
        }
    }
}

impl Default for Icc4_ProfileHeader_ProfileClasses {
    fn default() -> Self { Icc4_ProfileHeader_ProfileClasses::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Icc4_ProfileHeader_RenderingIntents {
    Perceptual,
    MediaRelativeColorimetric,
    Saturation,
    IccAbsoluteColorimetric,
    Unknown(i64),
}

impl TryFrom<i64> for Icc4_ProfileHeader_RenderingIntents {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Icc4_ProfileHeader_RenderingIntents> {
        match flag {
            0 => Ok(Icc4_ProfileHeader_RenderingIntents::Perceptual),
            1 => Ok(Icc4_ProfileHeader_RenderingIntents::MediaRelativeColorimetric),
            2 => Ok(Icc4_ProfileHeader_RenderingIntents::Saturation),
            3 => Ok(Icc4_ProfileHeader_RenderingIntents::IccAbsoluteColorimetric),
            _ => Ok(Icc4_ProfileHeader_RenderingIntents::Unknown(flag)),
        }
    }
}

impl From<&Icc4_ProfileHeader_RenderingIntents> for i64 {
    fn from(v: &Icc4_ProfileHeader_RenderingIntents) -> Self {
        match *v {
            Icc4_ProfileHeader_RenderingIntents::Perceptual => 0,
            Icc4_ProfileHeader_RenderingIntents::MediaRelativeColorimetric => 1,
            Icc4_ProfileHeader_RenderingIntents::Saturation => 2,
            Icc4_ProfileHeader_RenderingIntents::IccAbsoluteColorimetric => 3,
            Icc4_ProfileHeader_RenderingIntents::Unknown(v) => v
        }
    }
}

impl Default for Icc4_ProfileHeader_RenderingIntents {
    fn default() -> Self { Icc4_ProfileHeader_RenderingIntents::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Icc4_ProfileHeader_ProfileFlags {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_ProfileHeader>,
    pub _self: SharedType<Self>,
    embedded_profile: RefCell<bool>,
    profile_can_be_used_independently_of_embedded_colour_data: RefCell<bool>,
    other_flags: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_ProfileHeader_ProfileFlags {
    type Root = Icc4;
    type Parent = Icc4_ProfileHeader;

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
        *self_rc.embedded_profile.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.profile_can_be_used_independently_of_embedded_colour_data.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.other_flags.borrow_mut() = _io.read_bits_int_be(30)?;
        Ok(())
    }
}
impl Icc4_ProfileHeader_ProfileFlags {
}
impl Icc4_ProfileHeader_ProfileFlags {
    pub fn embedded_profile(&self) -> Ref<'_, bool> {
        self.embedded_profile.borrow()
    }
}
impl Icc4_ProfileHeader_ProfileFlags {
    pub fn profile_can_be_used_independently_of_embedded_colour_data(&self) -> Ref<'_, bool> {
        self.profile_can_be_used_independently_of_embedded_colour_data.borrow()
    }
}
impl Icc4_ProfileHeader_ProfileFlags {
    pub fn other_flags(&self) -> Ref<'_, u64> {
        self.other_flags.borrow()
    }
}
impl Icc4_ProfileHeader_ProfileFlags {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_ProfileHeader_VersionField {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_ProfileHeader>,
    pub _self: SharedType<Self>,
    major: RefCell<Vec<u8>>,
    minor: RefCell<u64>,
    bug_fix_level: RefCell<u64>,
    reserved: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_ProfileHeader_VersionField {
    type Root = Icc4;
    type Parent = Icc4_ProfileHeader;

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
        *self_rc.major.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.major() == vec![0x4u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/profile_header/types/version_field/seq/0".to_string() }));
        }
        *self_rc.minor.borrow_mut() = _io.read_bits_int_be(4)?;
        *self_rc.bug_fix_level.borrow_mut() = _io.read_bits_int_be(4)?;
        _io.align_to_byte()?;
        *self_rc.reserved.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/profile_header/types/version_field/seq/3".to_string() }));
        }
        Ok(())
    }
}
impl Icc4_ProfileHeader_VersionField {
}
impl Icc4_ProfileHeader_VersionField {
    pub fn major(&self) -> Ref<'_, Vec<u8>> {
        self.major.borrow()
    }
}
impl Icc4_ProfileHeader_VersionField {
    pub fn minor(&self) -> Ref<'_, u64> {
        self.minor.borrow()
    }
}
impl Icc4_ProfileHeader_VersionField {
    pub fn bug_fix_level(&self) -> Ref<'_, u64> {
        self.bug_fix_level.borrow()
    }
}
impl Icc4_ProfileHeader_VersionField {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_ProfileHeader_VersionField {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_Response16Number {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    number: RefCell<u32>,
    reserved: RefCell<Vec<u8>>,
    measurement_value: RefCell<OptRc<Icc4_S15Fixed16Number>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_Response16Number {
    type Root = Icc4;
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
        *self_rc.number.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/response_16_number/seq/1".to_string() }));
        }
        let t = Self::read_into::<_, Icc4_S15Fixed16Number>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.measurement_value.borrow_mut() = t;
        Ok(())
    }
}
impl Icc4_Response16Number {
}
impl Icc4_Response16Number {
    pub fn number(&self) -> Ref<'_, u32> {
        self.number.borrow()
    }
}
impl Icc4_Response16Number {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_Response16Number {
    pub fn measurement_value(&self) -> Ref<'_, OptRc<Icc4_S15Fixed16Number>> {
        self.measurement_value.borrow()
    }
}
impl Icc4_Response16Number {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_S15Fixed16Number {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    number: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_S15Fixed16Number {
    type Root = Icc4;
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
        *self_rc.number.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        Ok(())
    }
}
impl Icc4_S15Fixed16Number {
}
impl Icc4_S15Fixed16Number {
    pub fn number(&self) -> Ref<'_, Vec<u8>> {
        self.number.borrow()
    }
}
impl Icc4_S15Fixed16Number {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_StandardIlluminantEncoding {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    standard_illuminant_encoding: RefCell<Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_StandardIlluminantEncoding {
    type Root = Icc4;
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
        *self_rc.standard_illuminant_encoding.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        Ok(())
    }
}
impl Icc4_StandardIlluminantEncoding {
}
impl Icc4_StandardIlluminantEncoding {
    pub fn standard_illuminant_encoding(&self) -> Ref<'_, Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings> {
        self.standard_illuminant_encoding.borrow()
    }
}
impl Icc4_StandardIlluminantEncoding {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings {
    Unknown,
    D50,
    D65,
    D93,
    F2,
    D55,
    A,
    EquiPower,
    F8,
    Unknown(i64),
}

impl TryFrom<i64> for Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings> {
        match flag {
            0 => Ok(Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings::Unknown),
            1 => Ok(Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings::D50),
            2 => Ok(Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings::D65),
            3 => Ok(Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings::D93),
            4 => Ok(Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings::F2),
            5 => Ok(Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings::D55),
            6 => Ok(Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings::A),
            7 => Ok(Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings::EquiPower),
            8 => Ok(Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings::F8),
            _ => Ok(Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings::Unknown(flag)),
        }
    }
}

impl From<&Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings> for i64 {
    fn from(v: &Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings) -> Self {
        match *v {
            Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings::Unknown => 0,
            Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings::D50 => 1,
            Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings::D65 => 2,
            Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings::D93 => 3,
            Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings::F2 => 4,
            Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings::D55 => 5,
            Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings::A => 6,
            Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings::EquiPower => 7,
            Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings::F8 => 8,
            Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings::Unknown(v) => v
        }
    }
}

impl Default for Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings {
    fn default() -> Self { Icc4_StandardIlluminantEncoding_StandardIlluminantEncodings::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4>,
    pub _self: SharedType<Self>,
    tag_count: RefCell<u32>,
    tags: RefCell<Vec<OptRc<Icc4_TagTable_TagDefinition>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable {
    type Root = Icc4;
    type Parent = Icc4;

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
        *self_rc.tag_count.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.tags.borrow_mut() = Vec::new();
        let l_tags = *self_rc.tag_count();
        for _i in 0..l_tags {
            let t = Self::read_into::<_, Icc4_TagTable_TagDefinition>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.tags.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Icc4_TagTable {
}
impl Icc4_TagTable {
    pub fn tag_count(&self) -> Ref<'_, u32> {
        self.tag_count.borrow()
    }
}
impl Icc4_TagTable {
    pub fn tags(&self) -> Ref<'_, Vec<OptRc<Icc4_TagTable_TagDefinition>>> {
        self.tags.borrow()
    }
}
impl Icc4_TagTable {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable>,
    pub _self: SharedType<Self>,
    tag_signature: RefCell<Icc4_TagTable_TagDefinition_TagSignatures>,
    offset_to_data_element: RefCell<u32>,
    size_of_data_element: RefCell<u32>,
    _io: RefCell<BytesReader>,
    tag_data_element_raw: RefCell<Vec<u8>>,
    f_tag_data_element: Cell<bool>,
    tag_data_element: RefCell<Option<Icc4_TagTable_TagDefinition_TagDataElement>>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_TagDataElement {
    Icc4_TagTable_TagDefinition_GreenTrcTag(OptRc<Icc4_TagTable_TagDefinition_GreenTrcTag>),
    Icc4_TagTable_TagDefinition_RedTrcTag(OptRc<Icc4_TagTable_TagDefinition_RedTrcTag>),
    Icc4_TagTable_TagDefinition_BToA1Tag(OptRc<Icc4_TagTable_TagDefinition_BToA1Tag>),
    Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag(OptRc<Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag>),
    Icc4_TagTable_TagDefinition_GreenMatrixColumnTag(OptRc<Icc4_TagTable_TagDefinition_GreenMatrixColumnTag>),
    Icc4_TagTable_TagDefinition_GamutTag(OptRc<Icc4_TagTable_TagDefinition_GamutTag>),
    Icc4_TagTable_TagDefinition_CharTargetTag(OptRc<Icc4_TagTable_TagDefinition_CharTargetTag>),
    Icc4_TagTable_TagDefinition_BlueMatrixColumnTag(OptRc<Icc4_TagTable_TagDefinition_BlueMatrixColumnTag>),
    Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag(OptRc<Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag>),
    Icc4_TagTable_TagDefinition_ViewingCondDescTag(OptRc<Icc4_TagTable_TagDefinition_ViewingCondDescTag>),
    Icc4_TagTable_TagDefinition_ColorantTableOutTag(OptRc<Icc4_TagTable_TagDefinition_ColorantTableOutTag>),
    Icc4_TagTable_TagDefinition_ProfileDescriptionTag(OptRc<Icc4_TagTable_TagDefinition_ProfileDescriptionTag>),
    Icc4_TagTable_TagDefinition_ProfileSequenceTag(OptRc<Icc4_TagTable_TagDefinition_ProfileSequenceTag>),
    Icc4_TagTable_TagDefinition_DeviceMfgDescTag(OptRc<Icc4_TagTable_TagDefinition_DeviceMfgDescTag>),
    Icc4_TagTable_TagDefinition_MediaWhitePointTag(OptRc<Icc4_TagTable_TagDefinition_MediaWhitePointTag>),
    Icc4_TagTable_TagDefinition_AToB1Tag(OptRc<Icc4_TagTable_TagDefinition_AToB1Tag>),
    Icc4_TagTable_TagDefinition_RedMatrixColumnTag(OptRc<Icc4_TagTable_TagDefinition_RedMatrixColumnTag>),
    Icc4_TagTable_TagDefinition_DToB0Tag(OptRc<Icc4_TagTable_TagDefinition_DToB0Tag>),
    Icc4_TagTable_TagDefinition_LuminanceTag(OptRc<Icc4_TagTable_TagDefinition_LuminanceTag>),
    Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag(OptRc<Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag>),
    Icc4_TagTable_TagDefinition_ChromaticAdaptationTag(OptRc<Icc4_TagTable_TagDefinition_ChromaticAdaptationTag>),
    Icc4_TagTable_TagDefinition_BToD0Tag(OptRc<Icc4_TagTable_TagDefinition_BToD0Tag>),
    Icc4_TagTable_TagDefinition_Preview1Tag(OptRc<Icc4_TagTable_TagDefinition_Preview1Tag>),
    Icc4_TagTable_TagDefinition_BlueTrcTag(OptRc<Icc4_TagTable_TagDefinition_BlueTrcTag>),
    Icc4_TagTable_TagDefinition_AToB2Tag(OptRc<Icc4_TagTable_TagDefinition_AToB2Tag>),
    Icc4_TagTable_TagDefinition_Preview0Tag(OptRc<Icc4_TagTable_TagDefinition_Preview0Tag>),
    Icc4_TagTable_TagDefinition_ChromaticityTag(OptRc<Icc4_TagTable_TagDefinition_ChromaticityTag>),
    Icc4_TagTable_TagDefinition_DeviceModelDescTag(OptRc<Icc4_TagTable_TagDefinition_DeviceModelDescTag>),
    Icc4_TagTable_TagDefinition_BToA2Tag(OptRc<Icc4_TagTable_TagDefinition_BToA2Tag>),
    Icc4_TagTable_TagDefinition_MeasurementTag(OptRc<Icc4_TagTable_TagDefinition_MeasurementTag>),
    Icc4_TagTable_TagDefinition_BToD3Tag(OptRc<Icc4_TagTable_TagDefinition_BToD3Tag>),
    Icc4_TagTable_TagDefinition_CalibrationDateTimeTag(OptRc<Icc4_TagTable_TagDefinition_CalibrationDateTimeTag>),
    Icc4_TagTable_TagDefinition_NamedColor2Tag(OptRc<Icc4_TagTable_TagDefinition_NamedColor2Tag>),
    Icc4_TagTable_TagDefinition_ViewingConditionsTag(OptRc<Icc4_TagTable_TagDefinition_ViewingConditionsTag>),
    Icc4_TagTable_TagDefinition_BToD1Tag(OptRc<Icc4_TagTable_TagDefinition_BToD1Tag>),
    Icc4_TagTable_TagDefinition_TechnologyTag(OptRc<Icc4_TagTable_TagDefinition_TechnologyTag>),
    Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag(OptRc<Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag>),
    Icc4_TagTable_TagDefinition_BToD2Tag(OptRc<Icc4_TagTable_TagDefinition_BToD2Tag>),
    Icc4_TagTable_TagDefinition_DToB3Tag(OptRc<Icc4_TagTable_TagDefinition_DToB3Tag>),
    Icc4_TagTable_TagDefinition_AToB0Tag(OptRc<Icc4_TagTable_TagDefinition_AToB0Tag>),
    Icc4_TagTable_TagDefinition_DToB2Tag(OptRc<Icc4_TagTable_TagDefinition_DToB2Tag>),
    Bytes(Vec<u8>),
    Icc4_TagTable_TagDefinition_CopyrightTag(OptRc<Icc4_TagTable_TagDefinition_CopyrightTag>),
    Icc4_TagTable_TagDefinition_GrayTrcTag(OptRc<Icc4_TagTable_TagDefinition_GrayTrcTag>),
    Icc4_TagTable_TagDefinition_Preview2Tag(OptRc<Icc4_TagTable_TagDefinition_Preview2Tag>),
    Icc4_TagTable_TagDefinition_BToA0Tag(OptRc<Icc4_TagTable_TagDefinition_BToA0Tag>),
    Icc4_TagTable_TagDefinition_ColorantOrderTag(OptRc<Icc4_TagTable_TagDefinition_ColorantOrderTag>),
    Icc4_TagTable_TagDefinition_ColorantTableTag(OptRc<Icc4_TagTable_TagDefinition_ColorantTableTag>),
    Icc4_TagTable_TagDefinition_OutputResponseTag(OptRc<Icc4_TagTable_TagDefinition_OutputResponseTag>),
    Icc4_TagTable_TagDefinition_DToB1Tag(OptRc<Icc4_TagTable_TagDefinition_DToB1Tag>),
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_GreenTrcTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_GreenTrcTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_GreenTrcTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_GreenTrcTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_GreenTrcTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_GreenTrcTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_RedTrcTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_RedTrcTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_RedTrcTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_RedTrcTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_RedTrcTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_RedTrcTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_BToA1Tag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_BToA1Tag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_BToA1Tag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_BToA1Tag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_BToA1Tag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_BToA1Tag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_GreenMatrixColumnTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_GreenMatrixColumnTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_GreenMatrixColumnTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_GreenMatrixColumnTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_GreenMatrixColumnTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_GreenMatrixColumnTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_GamutTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_GamutTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_GamutTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_GamutTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_GamutTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_GamutTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_CharTargetTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_CharTargetTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_CharTargetTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_CharTargetTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_CharTargetTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_CharTargetTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_BlueMatrixColumnTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_BlueMatrixColumnTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_BlueMatrixColumnTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_BlueMatrixColumnTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_BlueMatrixColumnTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_BlueMatrixColumnTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_ViewingCondDescTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_ViewingCondDescTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_ViewingCondDescTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ViewingCondDescTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ViewingCondDescTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ViewingCondDescTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_ColorantTableOutTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_ColorantTableOutTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_ColorantTableOutTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ColorantTableOutTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ColorantTableOutTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ColorantTableOutTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_ProfileDescriptionTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_ProfileDescriptionTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_ProfileDescriptionTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ProfileDescriptionTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ProfileDescriptionTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ProfileDescriptionTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_ProfileSequenceTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_ProfileSequenceTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_ProfileSequenceTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ProfileSequenceTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ProfileSequenceTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ProfileSequenceTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_DeviceMfgDescTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_DeviceMfgDescTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_DeviceMfgDescTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_DeviceMfgDescTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_DeviceMfgDescTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_DeviceMfgDescTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_MediaWhitePointTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_MediaWhitePointTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_MediaWhitePointTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_MediaWhitePointTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_MediaWhitePointTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_MediaWhitePointTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_AToB1Tag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_AToB1Tag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_AToB1Tag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_AToB1Tag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_AToB1Tag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_AToB1Tag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_RedMatrixColumnTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_RedMatrixColumnTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_RedMatrixColumnTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_RedMatrixColumnTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_RedMatrixColumnTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_RedMatrixColumnTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_DToB0Tag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_DToB0Tag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_DToB0Tag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_DToB0Tag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_DToB0Tag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_DToB0Tag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_LuminanceTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_LuminanceTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_LuminanceTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_LuminanceTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_LuminanceTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_LuminanceTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_ChromaticAdaptationTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_ChromaticAdaptationTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_ChromaticAdaptationTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ChromaticAdaptationTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ChromaticAdaptationTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ChromaticAdaptationTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_BToD0Tag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_BToD0Tag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_BToD0Tag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_BToD0Tag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_BToD0Tag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_BToD0Tag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_Preview1Tag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_Preview1Tag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_Preview1Tag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_Preview1Tag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_Preview1Tag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_Preview1Tag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_BlueTrcTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_BlueTrcTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_BlueTrcTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_BlueTrcTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_BlueTrcTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_BlueTrcTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_AToB2Tag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_AToB2Tag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_AToB2Tag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_AToB2Tag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_AToB2Tag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_AToB2Tag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_Preview0Tag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_Preview0Tag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_Preview0Tag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_Preview0Tag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_Preview0Tag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_Preview0Tag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_ChromaticityTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_ChromaticityTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_ChromaticityTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ChromaticityTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ChromaticityTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ChromaticityTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_DeviceModelDescTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_DeviceModelDescTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_DeviceModelDescTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_DeviceModelDescTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_DeviceModelDescTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_DeviceModelDescTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_BToA2Tag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_BToA2Tag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_BToA2Tag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_BToA2Tag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_BToA2Tag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_BToA2Tag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_MeasurementTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_MeasurementTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_MeasurementTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_MeasurementTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_MeasurementTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_MeasurementTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_BToD3Tag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_BToD3Tag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_BToD3Tag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_BToD3Tag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_BToD3Tag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_BToD3Tag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_CalibrationDateTimeTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_CalibrationDateTimeTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_CalibrationDateTimeTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_CalibrationDateTimeTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_CalibrationDateTimeTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_CalibrationDateTimeTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_NamedColor2Tag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_NamedColor2Tag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_NamedColor2Tag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_NamedColor2Tag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_NamedColor2Tag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_NamedColor2Tag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_ViewingConditionsTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_ViewingConditionsTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_ViewingConditionsTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ViewingConditionsTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ViewingConditionsTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ViewingConditionsTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_BToD1Tag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_BToD1Tag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_BToD1Tag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_BToD1Tag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_BToD1Tag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_BToD1Tag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_TechnologyTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_TechnologyTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_TechnologyTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_TechnologyTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_TechnologyTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_TechnologyTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_BToD2Tag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_BToD2Tag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_BToD2Tag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_BToD2Tag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_BToD2Tag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_BToD2Tag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_DToB3Tag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_DToB3Tag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_DToB3Tag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_DToB3Tag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_DToB3Tag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_DToB3Tag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_AToB0Tag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_AToB0Tag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_AToB0Tag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_AToB0Tag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_AToB0Tag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_AToB0Tag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_DToB2Tag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_DToB2Tag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_DToB2Tag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_DToB2Tag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_DToB2Tag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_DToB2Tag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for Vec<u8> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_CopyrightTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_CopyrightTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_CopyrightTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_CopyrightTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_CopyrightTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_CopyrightTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_GrayTrcTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_GrayTrcTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_GrayTrcTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_GrayTrcTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_GrayTrcTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_GrayTrcTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_Preview2Tag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_Preview2Tag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_Preview2Tag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_Preview2Tag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_Preview2Tag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_Preview2Tag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_BToA0Tag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_BToA0Tag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_BToA0Tag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_BToA0Tag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_BToA0Tag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_BToA0Tag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_ColorantOrderTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_ColorantOrderTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_ColorantOrderTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ColorantOrderTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ColorantOrderTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ColorantOrderTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_ColorantTableTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_ColorantTableTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_ColorantTableTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ColorantTableTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ColorantTableTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ColorantTableTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_OutputResponseTag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_OutputResponseTag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_OutputResponseTag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_OutputResponseTag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_OutputResponseTag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_OutputResponseTag(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_TagDataElement> for OptRc<Icc4_TagTable_TagDefinition_DToB1Tag> {
    fn from(v: &Icc4_TagTable_TagDefinition_TagDataElement) -> Self {
        if let Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_DToB1Tag(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TagDataElement::Icc4_TagTable_TagDefinition_DToB1Tag, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_DToB1Tag>> for Icc4_TagTable_TagDefinition_TagDataElement {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_DToB1Tag>) -> Self {
        Self::Icc4_TagTable_TagDefinition_DToB1Tag(v)
    }
}
impl KStruct for Icc4_TagTable_TagDefinition {
    type Root = Icc4;
    type Parent = Icc4_TagTable;

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
        *self_rc.tag_signature.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        *self_rc.offset_to_data_element.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.size_of_data_element.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition {
    pub fn tag_data_element(
        &self
    ) -> KResult<Ref<'_, Option<Icc4_TagTable_TagDefinition_TagDataElement>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_tag_data_element.get() {
            return Ok(self.tag_data_element.borrow());
        }
        self.f_tag_data_element.set(true);
        let _pos = _io.pos();
        _io.seek(*self.offset_to_data_element() as usize)?;
        match *self.tag_signature() {
            Icc4_TagTable_TagDefinition_TagSignatures::AToB0 => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_AToB0Tag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::AToB1 => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_AToB1Tag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::AToB2 => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_AToB2Tag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::BToA0 => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_BToA0Tag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::BToA1 => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_BToA1Tag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::BToA2 => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_BToA2Tag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::BToD0 => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_BToD0Tag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::BToD1 => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_BToD1Tag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::BToD2 => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_BToD2Tag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::BToD3 => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_BToD3Tag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::BlueMatrixColumn => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_BlueMatrixColumnTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::BlueTrc => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_BlueTrcTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::CalibrationDateTime => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_CalibrationDateTimeTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::CharTarget => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_CharTargetTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::ChromaticAdaptation => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_ChromaticAdaptationTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::Chromaticity => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_ChromaticityTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::ColorantOrder => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_ColorantOrderTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::ColorantTable => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_ColorantTableTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::ColorantTableOut => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_ColorantTableOutTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::ColorimetricIntentImageState => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::Copyright => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_CopyrightTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::DToB0 => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_DToB0Tag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::DToB1 => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_DToB1Tag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::DToB2 => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_DToB2Tag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::DToB3 => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_DToB3Tag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::DeviceMfgDesc => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_DeviceMfgDescTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), None)?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::DeviceModelDesc => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_DeviceModelDescTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), None)?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::Gamut => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_GamutTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::GrayTrc => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_GrayTrcTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::GreenMatrixColumn => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_GreenMatrixColumnTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::GreenTrc => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_GreenTrcTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::Luminance => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_LuminanceTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::Measurement => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_MeasurementTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::MediaWhitePoint => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_MediaWhitePointTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::NamedColor2 => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_NamedColor2Tag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::OutputResponse => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_OutputResponseTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::PerceptualRenderingIntentGamut => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::Preview0 => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_Preview0Tag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::Preview1 => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_Preview1Tag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::Preview2 => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_Preview2Tag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::ProfileDescription => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_ProfileDescriptionTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::ProfileSequence => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_ProfileSequenceTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::ProfileSequenceIdentifier => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::RedMatrixColumn => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_RedMatrixColumnTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::RedTrc => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_RedTrcTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::SaturationRenderingIntentGamut => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::Technology => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_TechnologyTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), None)?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::ViewingCondDesc => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_ViewingCondDescTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagSignatures::ViewingConditions => {
                *self.tag_data_element_raw.borrow_mut() = _io.read_bytes(*self.size_of_data_element() as usize)?.into();
                let tag_data_element_raw = self.tag_data_element_raw.borrow();
                let _t_tag_data_element_raw_io = BytesReader::from(tag_data_element_raw.clone());
                let t = Self::read_into::<BytesReader, Icc4_TagTable_TagDefinition_ViewingConditionsTag>(&_t_tag_data_element_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.tag_data_element.borrow_mut() = Some(t);
            }
            _ => {
                *self.tag_data_element.borrow_mut() = Some(_io.read_bytes(*self.size_of_data_element() as usize)?.into());
            }
        }
        _io.seek(_pos)?;
        Ok(self.tag_data_element.borrow())
    }
}
impl Icc4_TagTable_TagDefinition {
    pub fn tag_signature(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagSignatures> {
        self.tag_signature.borrow()
    }
}
impl Icc4_TagTable_TagDefinition {
    pub fn offset_to_data_element(&self) -> Ref<'_, u32> {
        self.offset_to_data_element.borrow()
    }
}
impl Icc4_TagTable_TagDefinition {
    pub fn size_of_data_element(&self) -> Ref<'_, u32> {
        self.size_of_data_element.borrow()
    }
}
impl Icc4_TagTable_TagDefinition {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Icc4_TagTable_TagDefinition {
    pub fn tag_data_element_raw(&self) -> Ref<'_, Vec<u8>> {
        self.tag_data_element_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Icc4_TagTable_TagDefinition_MultiProcessElementsTypes {
    BacsElementType,
    ClutElementType,
    OneDimensionalCurvesType,
    EacsElementType,
    MatrixElementType,
    CurveSetElementTableType,
    FormulaCurveSegmentsType,
    SampledCurveSegmentType,
    Unknown(i64),
}

impl TryFrom<i64> for Icc4_TagTable_TagDefinition_MultiProcessElementsTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Icc4_TagTable_TagDefinition_MultiProcessElementsTypes> {
        match flag {
            1648444243 => Ok(Icc4_TagTable_TagDefinition_MultiProcessElementsTypes::BacsElementType),
            1668052340 => Ok(Icc4_TagTable_TagDefinition_MultiProcessElementsTypes::ClutElementType),
            1668641382 => Ok(Icc4_TagTable_TagDefinition_MultiProcessElementsTypes::OneDimensionalCurvesType),
            1698775891 => Ok(Icc4_TagTable_TagDefinition_MultiProcessElementsTypes::EacsElementType),
            1835103334 => Ok(Icc4_TagTable_TagDefinition_MultiProcessElementsTypes::MatrixElementType),
            1835428980 => Ok(Icc4_TagTable_TagDefinition_MultiProcessElementsTypes::CurveSetElementTableType),
            1885434470 => Ok(Icc4_TagTable_TagDefinition_MultiProcessElementsTypes::FormulaCurveSegmentsType),
            1935764838 => Ok(Icc4_TagTable_TagDefinition_MultiProcessElementsTypes::SampledCurveSegmentType),
            _ => Ok(Icc4_TagTable_TagDefinition_MultiProcessElementsTypes::Unknown(flag)),
        }
    }
}

impl From<&Icc4_TagTable_TagDefinition_MultiProcessElementsTypes> for i64 {
    fn from(v: &Icc4_TagTable_TagDefinition_MultiProcessElementsTypes) -> Self {
        match *v {
            Icc4_TagTable_TagDefinition_MultiProcessElementsTypes::BacsElementType => 1648444243,
            Icc4_TagTable_TagDefinition_MultiProcessElementsTypes::ClutElementType => 1668052340,
            Icc4_TagTable_TagDefinition_MultiProcessElementsTypes::OneDimensionalCurvesType => 1668641382,
            Icc4_TagTable_TagDefinition_MultiProcessElementsTypes::EacsElementType => 1698775891,
            Icc4_TagTable_TagDefinition_MultiProcessElementsTypes::MatrixElementType => 1835103334,
            Icc4_TagTable_TagDefinition_MultiProcessElementsTypes::CurveSetElementTableType => 1835428980,
            Icc4_TagTable_TagDefinition_MultiProcessElementsTypes::FormulaCurveSegmentsType => 1885434470,
            Icc4_TagTable_TagDefinition_MultiProcessElementsTypes::SampledCurveSegmentType => 1935764838,
            Icc4_TagTable_TagDefinition_MultiProcessElementsTypes::Unknown(v) => v
        }
    }
}

impl Default for Icc4_TagTable_TagDefinition_MultiProcessElementsTypes {
    fn default() -> Self { Icc4_TagTable_TagDefinition_MultiProcessElementsTypes::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Icc4_TagTable_TagDefinition_TagSignatures {
    AToB0,
    AToB1,
    AToB2,
    BToA0,
    BToA1,
    BToA2,
    BToD0,
    BToD1,
    BToD2,
    BToD3,
    DToB0,
    DToB1,
    DToB2,
    DToB3,
    BlueTrc,
    BlueMatrixColumn,
    CalibrationDateTime,
    ChromaticAdaptation,
    Chromaticity,
    ColorimetricIntentImageState,
    ColorantTableOut,
    ColorantOrder,
    ColorantTable,
    Copyright,
    ProfileDescription,
    DeviceModelDesc,
    DeviceMfgDesc,
    GreenTrc,
    GreenMatrixColumn,
    Gamut,
    GrayTrc,
    Luminance,
    Measurement,
    NamedColor2,
    Preview0,
    Preview1,
    Preview2,
    ProfileSequence,
    ProfileSequenceIdentifier,
    RedTrc,
    RedMatrixColumn,
    OutputResponse,
    PerceptualRenderingIntentGamut,
    SaturationRenderingIntentGamut,
    CharTarget,
    Technology,
    ViewingConditions,
    ViewingCondDesc,
    MediaWhitePoint,
    Unknown(i64),
}

impl TryFrom<i64> for Icc4_TagTable_TagDefinition_TagSignatures {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Icc4_TagTable_TagDefinition_TagSignatures> {
        match flag {
            1093812784 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::AToB0),
            1093812785 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::AToB1),
            1093812786 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::AToB2),
            1110589744 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::BToA0),
            1110589745 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::BToA1),
            1110589746 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::BToA2),
            1110590512 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::BToD0),
            1110590513 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::BToD1),
            1110590514 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::BToD2),
            1110590515 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::BToD3),
            1144144432 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::DToB0),
            1144144433 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::DToB1),
            1144144434 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::DToB2),
            1144144435 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::DToB3),
            1649693251 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::BlueTrc),
            1649957210 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::BlueMatrixColumn),
            1667329140 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::CalibrationDateTime),
            1667785060 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::ChromaticAdaptation),
            1667789421 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::Chromaticity),
            1667852659 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::ColorimetricIntentImageState),
            1668050804 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::ColorantTableOut),
            1668051567 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::ColorantOrder),
            1668051572 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::ColorantTable),
            1668313716 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::Copyright),
            1684370275 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::ProfileDescription),
            1684890724 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::DeviceModelDesc),
            1684893284 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::DeviceMfgDesc),
            1733579331 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::GreenTrc),
            1733843290 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::GreenMatrixColumn),
            1734438260 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::Gamut),
            1800688195 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::GrayTrc),
            1819635049 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::Luminance),
            1835360627 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::Measurement),
            1852009522 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::NamedColor2),
            1886545200 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::Preview0),
            1886545201 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::Preview1),
            1886545202 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::Preview2),
            1886610801 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::ProfileSequence),
            1886611812 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::ProfileSequenceIdentifier),
            1918128707 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::RedTrc),
            1918392666 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::RedMatrixColumn),
            1919251312 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::OutputResponse),
            1919510320 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::PerceptualRenderingIntentGamut),
            1919510322 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::SaturationRenderingIntentGamut),
            1952543335 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::CharTarget),
            1952801640 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::Technology),
            1986618743 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::ViewingConditions),
            1987405156 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::ViewingCondDesc),
            2004119668 => Ok(Icc4_TagTable_TagDefinition_TagSignatures::MediaWhitePoint),
            _ => Ok(Icc4_TagTable_TagDefinition_TagSignatures::Unknown(flag)),
        }
    }
}

impl From<&Icc4_TagTable_TagDefinition_TagSignatures> for i64 {
    fn from(v: &Icc4_TagTable_TagDefinition_TagSignatures) -> Self {
        match *v {
            Icc4_TagTable_TagDefinition_TagSignatures::AToB0 => 1093812784,
            Icc4_TagTable_TagDefinition_TagSignatures::AToB1 => 1093812785,
            Icc4_TagTable_TagDefinition_TagSignatures::AToB2 => 1093812786,
            Icc4_TagTable_TagDefinition_TagSignatures::BToA0 => 1110589744,
            Icc4_TagTable_TagDefinition_TagSignatures::BToA1 => 1110589745,
            Icc4_TagTable_TagDefinition_TagSignatures::BToA2 => 1110589746,
            Icc4_TagTable_TagDefinition_TagSignatures::BToD0 => 1110590512,
            Icc4_TagTable_TagDefinition_TagSignatures::BToD1 => 1110590513,
            Icc4_TagTable_TagDefinition_TagSignatures::BToD2 => 1110590514,
            Icc4_TagTable_TagDefinition_TagSignatures::BToD3 => 1110590515,
            Icc4_TagTable_TagDefinition_TagSignatures::DToB0 => 1144144432,
            Icc4_TagTable_TagDefinition_TagSignatures::DToB1 => 1144144433,
            Icc4_TagTable_TagDefinition_TagSignatures::DToB2 => 1144144434,
            Icc4_TagTable_TagDefinition_TagSignatures::DToB3 => 1144144435,
            Icc4_TagTable_TagDefinition_TagSignatures::BlueTrc => 1649693251,
            Icc4_TagTable_TagDefinition_TagSignatures::BlueMatrixColumn => 1649957210,
            Icc4_TagTable_TagDefinition_TagSignatures::CalibrationDateTime => 1667329140,
            Icc4_TagTable_TagDefinition_TagSignatures::ChromaticAdaptation => 1667785060,
            Icc4_TagTable_TagDefinition_TagSignatures::Chromaticity => 1667789421,
            Icc4_TagTable_TagDefinition_TagSignatures::ColorimetricIntentImageState => 1667852659,
            Icc4_TagTable_TagDefinition_TagSignatures::ColorantTableOut => 1668050804,
            Icc4_TagTable_TagDefinition_TagSignatures::ColorantOrder => 1668051567,
            Icc4_TagTable_TagDefinition_TagSignatures::ColorantTable => 1668051572,
            Icc4_TagTable_TagDefinition_TagSignatures::Copyright => 1668313716,
            Icc4_TagTable_TagDefinition_TagSignatures::ProfileDescription => 1684370275,
            Icc4_TagTable_TagDefinition_TagSignatures::DeviceModelDesc => 1684890724,
            Icc4_TagTable_TagDefinition_TagSignatures::DeviceMfgDesc => 1684893284,
            Icc4_TagTable_TagDefinition_TagSignatures::GreenTrc => 1733579331,
            Icc4_TagTable_TagDefinition_TagSignatures::GreenMatrixColumn => 1733843290,
            Icc4_TagTable_TagDefinition_TagSignatures::Gamut => 1734438260,
            Icc4_TagTable_TagDefinition_TagSignatures::GrayTrc => 1800688195,
            Icc4_TagTable_TagDefinition_TagSignatures::Luminance => 1819635049,
            Icc4_TagTable_TagDefinition_TagSignatures::Measurement => 1835360627,
            Icc4_TagTable_TagDefinition_TagSignatures::NamedColor2 => 1852009522,
            Icc4_TagTable_TagDefinition_TagSignatures::Preview0 => 1886545200,
            Icc4_TagTable_TagDefinition_TagSignatures::Preview1 => 1886545201,
            Icc4_TagTable_TagDefinition_TagSignatures::Preview2 => 1886545202,
            Icc4_TagTable_TagDefinition_TagSignatures::ProfileSequence => 1886610801,
            Icc4_TagTable_TagDefinition_TagSignatures::ProfileSequenceIdentifier => 1886611812,
            Icc4_TagTable_TagDefinition_TagSignatures::RedTrc => 1918128707,
            Icc4_TagTable_TagDefinition_TagSignatures::RedMatrixColumn => 1918392666,
            Icc4_TagTable_TagDefinition_TagSignatures::OutputResponse => 1919251312,
            Icc4_TagTable_TagDefinition_TagSignatures::PerceptualRenderingIntentGamut => 1919510320,
            Icc4_TagTable_TagDefinition_TagSignatures::SaturationRenderingIntentGamut => 1919510322,
            Icc4_TagTable_TagDefinition_TagSignatures::CharTarget => 1952543335,
            Icc4_TagTable_TagDefinition_TagSignatures::Technology => 1952801640,
            Icc4_TagTable_TagDefinition_TagSignatures::ViewingConditions => 1986618743,
            Icc4_TagTable_TagDefinition_TagSignatures::ViewingCondDesc => 1987405156,
            Icc4_TagTable_TagDefinition_TagSignatures::MediaWhitePoint => 2004119668,
            Icc4_TagTable_TagDefinition_TagSignatures::Unknown(v) => v
        }
    }
}

impl Default for Icc4_TagTable_TagDefinition_TagSignatures {
    fn default() -> Self { Icc4_TagTable_TagDefinition_TagSignatures::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Icc4_TagTable_TagDefinition_TagTypeSignatures {
    XyzType,
    ChromaticityType,
    ColorantOrderType,
    ColorantTableType,
    CurveType,
    DataType,
    DateTimeType,
    MultiFunctionAToBTableType,
    MultiFunctionBToATableType,
    MeasurementType,
    MultiFunctionTableWithOneBytePrecisionType,
    MultiFunctionTableWithTwoBytePrecisionType,
    MultiLocalizedUnicodeType,
    MultiProcessElementsType,
    NamedColor2Type,
    ParametricCurveType,
    ProfileSequenceDescType,
    ProfileSequenceIdentifierType,
    ResponseCurveSet16Type,
    S15Fixed16ArrayType,
    SignatureType,
    TextType,
    U16Fixed16ArrayType,
    UInt8ArrayType,
    UInt16ArrayType,
    UInt32ArrayType,
    UInt64ArrayType,
    ViewingConditionsType,
    Unknown(i64),
}

impl TryFrom<i64> for Icc4_TagTable_TagDefinition_TagTypeSignatures {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        match flag {
            1482250784 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::XyzType),
            1667789421 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::ChromaticityType),
            1668051567 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::ColorantOrderType),
            1668051572 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::ColorantTableType),
            1668641398 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::CurveType),
            1684108385 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::DataType),
            1685350765 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::DateTimeType),
            1832993312 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionAToBTableType),
            1833058592 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionBToATableType),
            1835360627 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::MeasurementType),
            1835430961 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionTableWithOneBytePrecisionType),
            1835430962 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionTableWithTwoBytePrecisionType),
            1835824483 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiLocalizedUnicodeType),
            1836082548 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiProcessElementsType),
            1852009522 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::NamedColor2Type),
            1885434465 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::ParametricCurveType),
            1886610801 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::ProfileSequenceDescType),
            1886611812 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::ProfileSequenceIdentifierType),
            1919120178 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::ResponseCurveSet16Type),
            1936077618 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::S15Fixed16ArrayType),
            1936287520 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::SignatureType),
            1952807028 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::TextType),
            1969632050 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::U16Fixed16ArrayType),
            1969827896 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::UInt8ArrayType),
            1969828150 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::UInt16ArrayType),
            1969828658 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::UInt32ArrayType),
            1969829428 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::UInt64ArrayType),
            1986618743 => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::ViewingConditionsType),
            _ => Ok(Icc4_TagTable_TagDefinition_TagTypeSignatures::Unknown(flag)),
        }
    }
}

impl From<&Icc4_TagTable_TagDefinition_TagTypeSignatures> for i64 {
    fn from(v: &Icc4_TagTable_TagDefinition_TagTypeSignatures) -> Self {
        match *v {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::XyzType => 1482250784,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::ChromaticityType => 1667789421,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::ColorantOrderType => 1668051567,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::ColorantTableType => 1668051572,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::CurveType => 1668641398,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::DataType => 1684108385,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::DateTimeType => 1685350765,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionAToBTableType => 1832993312,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionBToATableType => 1833058592,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MeasurementType => 1835360627,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionTableWithOneBytePrecisionType => 1835430961,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionTableWithTwoBytePrecisionType => 1835430962,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiLocalizedUnicodeType => 1835824483,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiProcessElementsType => 1836082548,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::NamedColor2Type => 1852009522,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::ParametricCurveType => 1885434465,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::ProfileSequenceDescType => 1886610801,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::ProfileSequenceIdentifierType => 1886611812,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::ResponseCurveSet16Type => 1919120178,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::S15Fixed16ArrayType => 1936077618,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::SignatureType => 1936287520,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::TextType => 1952807028,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::U16Fixed16ArrayType => 1969632050,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::UInt8ArrayType => 1969827896,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::UInt16ArrayType => 1969828150,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::UInt32ArrayType => 1969828658,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::UInt64ArrayType => 1969829428,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::ViewingConditionsType => 1986618743,
            Icc4_TagTable_TagDefinition_TagTypeSignatures::Unknown(v) => v
        }
    }
}

impl Default for Icc4_TagTable_TagDefinition_TagTypeSignatures {
    fn default() -> Self { Icc4_TagTable_TagDefinition_TagTypeSignatures::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_AToB0Tag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_AToB0Tag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_AToB0Tag_TagData {
    Icc4_TagTable_TagDefinition_LutAToBType(OptRc<Icc4_TagTable_TagDefinition_LutAToBType>),
    Icc4_TagTable_TagDefinition_Lut8Type(OptRc<Icc4_TagTable_TagDefinition_Lut8Type>),
    Icc4_TagTable_TagDefinition_Lut16Type(OptRc<Icc4_TagTable_TagDefinition_Lut16Type>),
}
impl From<&Icc4_TagTable_TagDefinition_AToB0Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_LutAToBType> {
    fn from(v: &Icc4_TagTable_TagDefinition_AToB0Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_AToB0Tag_TagData::Icc4_TagTable_TagDefinition_LutAToBType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_AToB0Tag_TagData::Icc4_TagTable_TagDefinition_LutAToBType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_LutAToBType>> for Icc4_TagTable_TagDefinition_AToB0Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_LutAToBType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_LutAToBType(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_AToB0Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_Lut8Type> {
    fn from(v: &Icc4_TagTable_TagDefinition_AToB0Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_AToB0Tag_TagData::Icc4_TagTable_TagDefinition_Lut8Type(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_AToB0Tag_TagData::Icc4_TagTable_TagDefinition_Lut8Type, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_Lut8Type>> for Icc4_TagTable_TagDefinition_AToB0Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_Lut8Type>) -> Self {
        Self::Icc4_TagTable_TagDefinition_Lut8Type(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_AToB0Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_Lut16Type> {
    fn from(v: &Icc4_TagTable_TagDefinition_AToB0Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_AToB0Tag_TagData::Icc4_TagTable_TagDefinition_Lut16Type(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_AToB0Tag_TagData::Icc4_TagTable_TagDefinition_Lut16Type, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_Lut16Type>> for Icc4_TagTable_TagDefinition_AToB0Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_Lut16Type>) -> Self {
        Self::Icc4_TagTable_TagDefinition_Lut16Type(v)
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_AToB0Tag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionAToBTableType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_LutAToBType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionTableWithOneBytePrecisionType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_Lut8Type>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionTableWithTwoBytePrecisionType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_Lut16Type>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_AToB0Tag {
}
impl Icc4_TagTable_TagDefinition_AToB0Tag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_AToB0Tag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_AToB0Tag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_AToB0Tag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_AToB1Tag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_AToB1Tag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_AToB1Tag_TagData {
    Icc4_TagTable_TagDefinition_LutAToBType(OptRc<Icc4_TagTable_TagDefinition_LutAToBType>),
    Icc4_TagTable_TagDefinition_Lut8Type(OptRc<Icc4_TagTable_TagDefinition_Lut8Type>),
    Icc4_TagTable_TagDefinition_Lut16Type(OptRc<Icc4_TagTable_TagDefinition_Lut16Type>),
}
impl From<&Icc4_TagTable_TagDefinition_AToB1Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_LutAToBType> {
    fn from(v: &Icc4_TagTable_TagDefinition_AToB1Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_AToB1Tag_TagData::Icc4_TagTable_TagDefinition_LutAToBType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_AToB1Tag_TagData::Icc4_TagTable_TagDefinition_LutAToBType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_LutAToBType>> for Icc4_TagTable_TagDefinition_AToB1Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_LutAToBType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_LutAToBType(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_AToB1Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_Lut8Type> {
    fn from(v: &Icc4_TagTable_TagDefinition_AToB1Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_AToB1Tag_TagData::Icc4_TagTable_TagDefinition_Lut8Type(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_AToB1Tag_TagData::Icc4_TagTable_TagDefinition_Lut8Type, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_Lut8Type>> for Icc4_TagTable_TagDefinition_AToB1Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_Lut8Type>) -> Self {
        Self::Icc4_TagTable_TagDefinition_Lut8Type(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_AToB1Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_Lut16Type> {
    fn from(v: &Icc4_TagTable_TagDefinition_AToB1Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_AToB1Tag_TagData::Icc4_TagTable_TagDefinition_Lut16Type(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_AToB1Tag_TagData::Icc4_TagTable_TagDefinition_Lut16Type, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_Lut16Type>> for Icc4_TagTable_TagDefinition_AToB1Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_Lut16Type>) -> Self {
        Self::Icc4_TagTable_TagDefinition_Lut16Type(v)
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_AToB1Tag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionAToBTableType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_LutAToBType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionTableWithOneBytePrecisionType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_Lut8Type>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionTableWithTwoBytePrecisionType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_Lut16Type>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_AToB1Tag {
}
impl Icc4_TagTable_TagDefinition_AToB1Tag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_AToB1Tag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_AToB1Tag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_AToB1Tag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_AToB2Tag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_AToB2Tag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_AToB2Tag_TagData {
    Icc4_TagTable_TagDefinition_LutAToBType(OptRc<Icc4_TagTable_TagDefinition_LutAToBType>),
    Icc4_TagTable_TagDefinition_Lut8Type(OptRc<Icc4_TagTable_TagDefinition_Lut8Type>),
    Icc4_TagTable_TagDefinition_Lut16Type(OptRc<Icc4_TagTable_TagDefinition_Lut16Type>),
}
impl From<&Icc4_TagTable_TagDefinition_AToB2Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_LutAToBType> {
    fn from(v: &Icc4_TagTable_TagDefinition_AToB2Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_AToB2Tag_TagData::Icc4_TagTable_TagDefinition_LutAToBType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_AToB2Tag_TagData::Icc4_TagTable_TagDefinition_LutAToBType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_LutAToBType>> for Icc4_TagTable_TagDefinition_AToB2Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_LutAToBType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_LutAToBType(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_AToB2Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_Lut8Type> {
    fn from(v: &Icc4_TagTable_TagDefinition_AToB2Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_AToB2Tag_TagData::Icc4_TagTable_TagDefinition_Lut8Type(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_AToB2Tag_TagData::Icc4_TagTable_TagDefinition_Lut8Type, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_Lut8Type>> for Icc4_TagTable_TagDefinition_AToB2Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_Lut8Type>) -> Self {
        Self::Icc4_TagTable_TagDefinition_Lut8Type(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_AToB2Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_Lut16Type> {
    fn from(v: &Icc4_TagTable_TagDefinition_AToB2Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_AToB2Tag_TagData::Icc4_TagTable_TagDefinition_Lut16Type(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_AToB2Tag_TagData::Icc4_TagTable_TagDefinition_Lut16Type, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_Lut16Type>> for Icc4_TagTable_TagDefinition_AToB2Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_Lut16Type>) -> Self {
        Self::Icc4_TagTable_TagDefinition_Lut16Type(v)
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_AToB2Tag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionAToBTableType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_LutAToBType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionTableWithOneBytePrecisionType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_Lut8Type>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionTableWithTwoBytePrecisionType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_Lut16Type>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_AToB2Tag {
}
impl Icc4_TagTable_TagDefinition_AToB2Tag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_AToB2Tag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_AToB2Tag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_AToB2Tag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_BToA0Tag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_BToA0Tag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_BToA0Tag_TagData {
    Icc4_TagTable_TagDefinition_LutBToAType(OptRc<Icc4_TagTable_TagDefinition_LutBToAType>),
    Icc4_TagTable_TagDefinition_Lut8Type(OptRc<Icc4_TagTable_TagDefinition_Lut8Type>),
    Icc4_TagTable_TagDefinition_Lut16Type(OptRc<Icc4_TagTable_TagDefinition_Lut16Type>),
}
impl From<&Icc4_TagTable_TagDefinition_BToA0Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_LutBToAType> {
    fn from(v: &Icc4_TagTable_TagDefinition_BToA0Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_BToA0Tag_TagData::Icc4_TagTable_TagDefinition_LutBToAType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_BToA0Tag_TagData::Icc4_TagTable_TagDefinition_LutBToAType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_LutBToAType>> for Icc4_TagTable_TagDefinition_BToA0Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_LutBToAType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_LutBToAType(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_BToA0Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_Lut8Type> {
    fn from(v: &Icc4_TagTable_TagDefinition_BToA0Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_BToA0Tag_TagData::Icc4_TagTable_TagDefinition_Lut8Type(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_BToA0Tag_TagData::Icc4_TagTable_TagDefinition_Lut8Type, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_Lut8Type>> for Icc4_TagTable_TagDefinition_BToA0Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_Lut8Type>) -> Self {
        Self::Icc4_TagTable_TagDefinition_Lut8Type(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_BToA0Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_Lut16Type> {
    fn from(v: &Icc4_TagTable_TagDefinition_BToA0Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_BToA0Tag_TagData::Icc4_TagTable_TagDefinition_Lut16Type(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_BToA0Tag_TagData::Icc4_TagTable_TagDefinition_Lut16Type, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_Lut16Type>> for Icc4_TagTable_TagDefinition_BToA0Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_Lut16Type>) -> Self {
        Self::Icc4_TagTable_TagDefinition_Lut16Type(v)
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_BToA0Tag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionBToATableType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_LutBToAType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionTableWithOneBytePrecisionType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_Lut8Type>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionTableWithTwoBytePrecisionType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_Lut16Type>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_BToA0Tag {
}
impl Icc4_TagTable_TagDefinition_BToA0Tag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_BToA0Tag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_BToA0Tag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_BToA0Tag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_BToA1Tag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_BToA1Tag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_BToA1Tag_TagData {
    Icc4_TagTable_TagDefinition_LutBToAType(OptRc<Icc4_TagTable_TagDefinition_LutBToAType>),
    Icc4_TagTable_TagDefinition_Lut8Type(OptRc<Icc4_TagTable_TagDefinition_Lut8Type>),
    Icc4_TagTable_TagDefinition_Lut16Type(OptRc<Icc4_TagTable_TagDefinition_Lut16Type>),
}
impl From<&Icc4_TagTable_TagDefinition_BToA1Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_LutBToAType> {
    fn from(v: &Icc4_TagTable_TagDefinition_BToA1Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_BToA1Tag_TagData::Icc4_TagTable_TagDefinition_LutBToAType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_BToA1Tag_TagData::Icc4_TagTable_TagDefinition_LutBToAType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_LutBToAType>> for Icc4_TagTable_TagDefinition_BToA1Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_LutBToAType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_LutBToAType(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_BToA1Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_Lut8Type> {
    fn from(v: &Icc4_TagTable_TagDefinition_BToA1Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_BToA1Tag_TagData::Icc4_TagTable_TagDefinition_Lut8Type(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_BToA1Tag_TagData::Icc4_TagTable_TagDefinition_Lut8Type, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_Lut8Type>> for Icc4_TagTable_TagDefinition_BToA1Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_Lut8Type>) -> Self {
        Self::Icc4_TagTable_TagDefinition_Lut8Type(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_BToA1Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_Lut16Type> {
    fn from(v: &Icc4_TagTable_TagDefinition_BToA1Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_BToA1Tag_TagData::Icc4_TagTable_TagDefinition_Lut16Type(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_BToA1Tag_TagData::Icc4_TagTable_TagDefinition_Lut16Type, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_Lut16Type>> for Icc4_TagTable_TagDefinition_BToA1Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_Lut16Type>) -> Self {
        Self::Icc4_TagTable_TagDefinition_Lut16Type(v)
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_BToA1Tag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionBToATableType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_LutBToAType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionTableWithOneBytePrecisionType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_Lut8Type>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionTableWithTwoBytePrecisionType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_Lut16Type>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_BToA1Tag {
}
impl Icc4_TagTable_TagDefinition_BToA1Tag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_BToA1Tag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_BToA1Tag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_BToA1Tag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_BToA2Tag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_BToA2Tag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_BToA2Tag_TagData {
    Icc4_TagTable_TagDefinition_LutBToAType(OptRc<Icc4_TagTable_TagDefinition_LutBToAType>),
    Icc4_TagTable_TagDefinition_Lut8Type(OptRc<Icc4_TagTable_TagDefinition_Lut8Type>),
    Icc4_TagTable_TagDefinition_Lut16Type(OptRc<Icc4_TagTable_TagDefinition_Lut16Type>),
}
impl From<&Icc4_TagTable_TagDefinition_BToA2Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_LutBToAType> {
    fn from(v: &Icc4_TagTable_TagDefinition_BToA2Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_BToA2Tag_TagData::Icc4_TagTable_TagDefinition_LutBToAType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_BToA2Tag_TagData::Icc4_TagTable_TagDefinition_LutBToAType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_LutBToAType>> for Icc4_TagTable_TagDefinition_BToA2Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_LutBToAType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_LutBToAType(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_BToA2Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_Lut8Type> {
    fn from(v: &Icc4_TagTable_TagDefinition_BToA2Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_BToA2Tag_TagData::Icc4_TagTable_TagDefinition_Lut8Type(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_BToA2Tag_TagData::Icc4_TagTable_TagDefinition_Lut8Type, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_Lut8Type>> for Icc4_TagTable_TagDefinition_BToA2Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_Lut8Type>) -> Self {
        Self::Icc4_TagTable_TagDefinition_Lut8Type(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_BToA2Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_Lut16Type> {
    fn from(v: &Icc4_TagTable_TagDefinition_BToA2Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_BToA2Tag_TagData::Icc4_TagTable_TagDefinition_Lut16Type(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_BToA2Tag_TagData::Icc4_TagTable_TagDefinition_Lut16Type, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_Lut16Type>> for Icc4_TagTable_TagDefinition_BToA2Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_Lut16Type>) -> Self {
        Self::Icc4_TagTable_TagDefinition_Lut16Type(v)
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_BToA2Tag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionBToATableType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_LutBToAType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionTableWithOneBytePrecisionType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_Lut8Type>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionTableWithTwoBytePrecisionType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_Lut16Type>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_BToA2Tag {
}
impl Icc4_TagTable_TagDefinition_BToA2Tag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_BToA2Tag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_BToA2Tag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_BToA2Tag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_BToD0Tag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_BToD0Tag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_BToD0Tag_TagData {
    Icc4_TagTable_TagDefinition_MultiProcessElementsType(OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType>),
}
impl From<&Icc4_TagTable_TagDefinition_BToD0Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType> {
    fn from(v: &Icc4_TagTable_TagDefinition_BToD0Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_BToD0Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_BToD0Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType>> for Icc4_TagTable_TagDefinition_BToD0Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_MultiProcessElementsType(v)
    }
}
impl Icc4_TagTable_TagDefinition_BToD0Tag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_BToD0Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_BToD0Tag_TagData {
    pub fn number_of_input_channels(&self) -> Ref<'_, u16> {
        match self {
            Icc4_TagTable_TagDefinition_BToD0Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.number_of_input_channels.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_BToD0Tag_TagData {
    pub fn number_of_output_channels(&self) -> Ref<'_, u16> {
        match self {
            Icc4_TagTable_TagDefinition_BToD0Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.number_of_output_channels.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_BToD0Tag_TagData {
    pub fn number_of_processing_elements(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_BToD0Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.number_of_processing_elements.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_BToD0Tag_TagData {
    pub fn process_element_positions_table(&self) -> Ref<'_, Vec<OptRc<Icc4_PositionNumber>>> {
        match self {
            Icc4_TagTable_TagDefinition_BToD0Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.process_element_positions_table.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_BToD0Tag_TagData {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_BToD0Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.data.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_BToD0Tag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiProcessElementsType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_MultiProcessElementsType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_BToD0Tag {
}
impl Icc4_TagTable_TagDefinition_BToD0Tag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_BToD0Tag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_BToD0Tag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_BToD0Tag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_BToD1Tag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_BToD1Tag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_BToD1Tag_TagData {
    Icc4_TagTable_TagDefinition_MultiProcessElementsType(OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType>),
}
impl From<&Icc4_TagTable_TagDefinition_BToD1Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType> {
    fn from(v: &Icc4_TagTable_TagDefinition_BToD1Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_BToD1Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_BToD1Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType>> for Icc4_TagTable_TagDefinition_BToD1Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_MultiProcessElementsType(v)
    }
}
impl Icc4_TagTable_TagDefinition_BToD1Tag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_BToD1Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_BToD1Tag_TagData {
    pub fn number_of_input_channels(&self) -> Ref<'_, u16> {
        match self {
            Icc4_TagTable_TagDefinition_BToD1Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.number_of_input_channels.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_BToD1Tag_TagData {
    pub fn number_of_output_channels(&self) -> Ref<'_, u16> {
        match self {
            Icc4_TagTable_TagDefinition_BToD1Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.number_of_output_channels.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_BToD1Tag_TagData {
    pub fn number_of_processing_elements(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_BToD1Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.number_of_processing_elements.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_BToD1Tag_TagData {
    pub fn process_element_positions_table(&self) -> Ref<'_, Vec<OptRc<Icc4_PositionNumber>>> {
        match self {
            Icc4_TagTable_TagDefinition_BToD1Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.process_element_positions_table.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_BToD1Tag_TagData {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_BToD1Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.data.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_BToD1Tag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiProcessElementsType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_MultiProcessElementsType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_BToD1Tag {
}
impl Icc4_TagTable_TagDefinition_BToD1Tag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_BToD1Tag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_BToD1Tag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_BToD1Tag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_BToD2Tag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_BToD2Tag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_BToD2Tag_TagData {
    Icc4_TagTable_TagDefinition_MultiProcessElementsType(OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType>),
}
impl From<&Icc4_TagTable_TagDefinition_BToD2Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType> {
    fn from(v: &Icc4_TagTable_TagDefinition_BToD2Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_BToD2Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_BToD2Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType>> for Icc4_TagTable_TagDefinition_BToD2Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_MultiProcessElementsType(v)
    }
}
impl Icc4_TagTable_TagDefinition_BToD2Tag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_BToD2Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_BToD2Tag_TagData {
    pub fn number_of_input_channels(&self) -> Ref<'_, u16> {
        match self {
            Icc4_TagTable_TagDefinition_BToD2Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.number_of_input_channels.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_BToD2Tag_TagData {
    pub fn number_of_output_channels(&self) -> Ref<'_, u16> {
        match self {
            Icc4_TagTable_TagDefinition_BToD2Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.number_of_output_channels.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_BToD2Tag_TagData {
    pub fn number_of_processing_elements(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_BToD2Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.number_of_processing_elements.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_BToD2Tag_TagData {
    pub fn process_element_positions_table(&self) -> Ref<'_, Vec<OptRc<Icc4_PositionNumber>>> {
        match self {
            Icc4_TagTable_TagDefinition_BToD2Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.process_element_positions_table.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_BToD2Tag_TagData {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_BToD2Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.data.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_BToD2Tag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiProcessElementsType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_MultiProcessElementsType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_BToD2Tag {
}
impl Icc4_TagTable_TagDefinition_BToD2Tag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_BToD2Tag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_BToD2Tag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_BToD2Tag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_BToD3Tag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_BToD3Tag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_BToD3Tag_TagData {
    Icc4_TagTable_TagDefinition_MultiProcessElementsType(OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType>),
}
impl From<&Icc4_TagTable_TagDefinition_BToD3Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType> {
    fn from(v: &Icc4_TagTable_TagDefinition_BToD3Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_BToD3Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_BToD3Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType>> for Icc4_TagTable_TagDefinition_BToD3Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_MultiProcessElementsType(v)
    }
}
impl Icc4_TagTable_TagDefinition_BToD3Tag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_BToD3Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_BToD3Tag_TagData {
    pub fn number_of_input_channels(&self) -> Ref<'_, u16> {
        match self {
            Icc4_TagTable_TagDefinition_BToD3Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.number_of_input_channels.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_BToD3Tag_TagData {
    pub fn number_of_output_channels(&self) -> Ref<'_, u16> {
        match self {
            Icc4_TagTable_TagDefinition_BToD3Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.number_of_output_channels.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_BToD3Tag_TagData {
    pub fn number_of_processing_elements(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_BToD3Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.number_of_processing_elements.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_BToD3Tag_TagData {
    pub fn process_element_positions_table(&self) -> Ref<'_, Vec<OptRc<Icc4_PositionNumber>>> {
        match self {
            Icc4_TagTable_TagDefinition_BToD3Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.process_element_positions_table.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_BToD3Tag_TagData {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_BToD3Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.data.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_BToD3Tag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiProcessElementsType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_MultiProcessElementsType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_BToD3Tag {
}
impl Icc4_TagTable_TagDefinition_BToD3Tag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_BToD3Tag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_BToD3Tag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_BToD3Tag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_BlueMatrixColumnTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_BlueMatrixColumnTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_BlueMatrixColumnTag_TagData {
    Icc4_TagTable_TagDefinition_XyzType(OptRc<Icc4_TagTable_TagDefinition_XyzType>),
}
impl From<&Icc4_TagTable_TagDefinition_BlueMatrixColumnTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_XyzType> {
    fn from(v: &Icc4_TagTable_TagDefinition_BlueMatrixColumnTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_BlueMatrixColumnTag_TagData::Icc4_TagTable_TagDefinition_XyzType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_BlueMatrixColumnTag_TagData::Icc4_TagTable_TagDefinition_XyzType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_XyzType>> for Icc4_TagTable_TagDefinition_BlueMatrixColumnTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_XyzType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_XyzType(v)
    }
}
impl Icc4_TagTable_TagDefinition_BlueMatrixColumnTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_BlueMatrixColumnTag_TagData::Icc4_TagTable_TagDefinition_XyzType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_BlueMatrixColumnTag_TagData {
    pub fn values(&self) -> Ref<'_, Vec<OptRc<Icc4_XyzNumber>>> {
        match self {
            Icc4_TagTable_TagDefinition_BlueMatrixColumnTag_TagData::Icc4_TagTable_TagDefinition_XyzType(x) => x.values.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_BlueMatrixColumnTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::XyzType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_XyzType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_BlueMatrixColumnTag {
}
impl Icc4_TagTable_TagDefinition_BlueMatrixColumnTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_BlueMatrixColumnTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_BlueMatrixColumnTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_BlueMatrixColumnTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_BlueTrcTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_BlueTrcTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_BlueTrcTag_TagData {
    Icc4_TagTable_TagDefinition_CurveType(OptRc<Icc4_TagTable_TagDefinition_CurveType>),
    Icc4_TagTable_TagDefinition_ParametricCurveType(OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType>),
}
impl From<&Icc4_TagTable_TagDefinition_BlueTrcTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_CurveType> {
    fn from(v: &Icc4_TagTable_TagDefinition_BlueTrcTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_BlueTrcTag_TagData::Icc4_TagTable_TagDefinition_CurveType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_BlueTrcTag_TagData::Icc4_TagTable_TagDefinition_CurveType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_CurveType>> for Icc4_TagTable_TagDefinition_BlueTrcTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_CurveType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_CurveType(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_BlueTrcTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType> {
    fn from(v: &Icc4_TagTable_TagDefinition_BlueTrcTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_BlueTrcTag_TagData::Icc4_TagTable_TagDefinition_ParametricCurveType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_BlueTrcTag_TagData::Icc4_TagTable_TagDefinition_ParametricCurveType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType>> for Icc4_TagTable_TagDefinition_BlueTrcTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ParametricCurveType(v)
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_BlueTrcTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::CurveType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_CurveType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::ParametricCurveType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_ParametricCurveType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_BlueTrcTag {
}
impl Icc4_TagTable_TagDefinition_BlueTrcTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_BlueTrcTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_BlueTrcTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_BlueTrcTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_CalibrationDateTimeTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_CalibrationDateTimeTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_CalibrationDateTimeTag_TagData {
    Icc4_TagTable_TagDefinition_DateTimeType(OptRc<Icc4_TagTable_TagDefinition_DateTimeType>),
}
impl From<&Icc4_TagTable_TagDefinition_CalibrationDateTimeTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_DateTimeType> {
    fn from(v: &Icc4_TagTable_TagDefinition_CalibrationDateTimeTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_CalibrationDateTimeTag_TagData::Icc4_TagTable_TagDefinition_DateTimeType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_CalibrationDateTimeTag_TagData::Icc4_TagTable_TagDefinition_DateTimeType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_DateTimeType>> for Icc4_TagTable_TagDefinition_CalibrationDateTimeTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_DateTimeType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_DateTimeType(v)
    }
}
impl Icc4_TagTable_TagDefinition_CalibrationDateTimeTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_CalibrationDateTimeTag_TagData::Icc4_TagTable_TagDefinition_DateTimeType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_CalibrationDateTimeTag_TagData {
    pub fn date_and_time(&self) -> OptRc<Icc4_DateTimeNumber> {
        match self {
            Icc4_TagTable_TagDefinition_CalibrationDateTimeTag_TagData::Icc4_TagTable_TagDefinition_DateTimeType(x) => x.date_and_time.borrow().clone(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_CalibrationDateTimeTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::DateTimeType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_DateTimeType>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_CalibrationDateTimeTag {
}
impl Icc4_TagTable_TagDefinition_CalibrationDateTimeTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_CalibrationDateTimeTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_CalibrationDateTimeTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_CalibrationDateTimeTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_CharTargetTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_CharTargetTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_CharTargetTag_TagData {
    Icc4_TagTable_TagDefinition_TextType(OptRc<Icc4_TagTable_TagDefinition_TextType>),
}
impl From<&Icc4_TagTable_TagDefinition_CharTargetTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_TextType> {
    fn from(v: &Icc4_TagTable_TagDefinition_CharTargetTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_CharTargetTag_TagData::Icc4_TagTable_TagDefinition_TextType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_CharTargetTag_TagData::Icc4_TagTable_TagDefinition_TextType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_TextType>> for Icc4_TagTable_TagDefinition_CharTargetTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_TextType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_TextType(v)
    }
}
impl Icc4_TagTable_TagDefinition_CharTargetTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_CharTargetTag_TagData::Icc4_TagTable_TagDefinition_TextType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_CharTargetTag_TagData {
    pub fn value(&self) -> Ref<'_, String> {
        match self {
            Icc4_TagTable_TagDefinition_CharTargetTag_TagData::Icc4_TagTable_TagDefinition_TextType(x) => x.value.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_CharTargetTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::TextType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_TextType>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_CharTargetTag {
}
impl Icc4_TagTable_TagDefinition_CharTargetTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_CharTargetTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_CharTargetTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_CharTargetTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ChromaticAdaptationTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_ChromaticAdaptationTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_ChromaticAdaptationTag_TagData {
    Icc4_TagTable_TagDefinition_S15Fixed16ArrayType(OptRc<Icc4_TagTable_TagDefinition_S15Fixed16ArrayType>),
}
impl From<&Icc4_TagTable_TagDefinition_ChromaticAdaptationTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_S15Fixed16ArrayType> {
    fn from(v: &Icc4_TagTable_TagDefinition_ChromaticAdaptationTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_ChromaticAdaptationTag_TagData::Icc4_TagTable_TagDefinition_S15Fixed16ArrayType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_ChromaticAdaptationTag_TagData::Icc4_TagTable_TagDefinition_S15Fixed16ArrayType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_S15Fixed16ArrayType>> for Icc4_TagTable_TagDefinition_ChromaticAdaptationTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_S15Fixed16ArrayType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_S15Fixed16ArrayType(v)
    }
}
impl Icc4_TagTable_TagDefinition_ChromaticAdaptationTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_ChromaticAdaptationTag_TagData::Icc4_TagTable_TagDefinition_S15Fixed16ArrayType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ChromaticAdaptationTag_TagData {
    pub fn values(&self) -> Ref<'_, Vec<OptRc<Icc4_S15Fixed16Number>>> {
        match self {
            Icc4_TagTable_TagDefinition_ChromaticAdaptationTag_TagData::Icc4_TagTable_TagDefinition_S15Fixed16ArrayType(x) => x.values.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_ChromaticAdaptationTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::S15Fixed16ArrayType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_S15Fixed16ArrayType>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ChromaticAdaptationTag {
}
impl Icc4_TagTable_TagDefinition_ChromaticAdaptationTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ChromaticAdaptationTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_ChromaticAdaptationTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ChromaticAdaptationTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ChromaticityTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_ChromaticityTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_ChromaticityTag_TagData {
    Icc4_TagTable_TagDefinition_ChromaticityType(OptRc<Icc4_TagTable_TagDefinition_ChromaticityType>),
}
impl From<&Icc4_TagTable_TagDefinition_ChromaticityTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_ChromaticityType> {
    fn from(v: &Icc4_TagTable_TagDefinition_ChromaticityTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_ChromaticityTag_TagData::Icc4_TagTable_TagDefinition_ChromaticityType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_ChromaticityTag_TagData::Icc4_TagTable_TagDefinition_ChromaticityType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ChromaticityType>> for Icc4_TagTable_TagDefinition_ChromaticityTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ChromaticityType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ChromaticityType(v)
    }
}
impl Icc4_TagTable_TagDefinition_ChromaticityTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_ChromaticityTag_TagData::Icc4_TagTable_TagDefinition_ChromaticityType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ChromaticityTag_TagData {
    pub fn number_of_device_channels(&self) -> Ref<'_, u16> {
        match self {
            Icc4_TagTable_TagDefinition_ChromaticityTag_TagData::Icc4_TagTable_TagDefinition_ChromaticityType(x) => x.number_of_device_channels.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ChromaticityTag_TagData {
    pub fn colorant_and_phosphor_encoding(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings> {
        match self {
            Icc4_TagTable_TagDefinition_ChromaticityTag_TagData::Icc4_TagTable_TagDefinition_ChromaticityType(x) => x.colorant_and_phosphor_encoding.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ChromaticityTag_TagData {
    pub fn ciexy_coordinates_per_channel(&self) -> Ref<'_, Vec<OptRc<Icc4_TagTable_TagDefinition_ChromaticityType_CiexyCoordinateValues>>> {
        match self {
            Icc4_TagTable_TagDefinition_ChromaticityTag_TagData::Icc4_TagTable_TagDefinition_ChromaticityType(x) => x.ciexy_coordinates_per_channel.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_ChromaticityTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::ChromaticityType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_ChromaticityType>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ChromaticityTag {
}
impl Icc4_TagTable_TagDefinition_ChromaticityTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ChromaticityTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_ChromaticityTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ChromaticityTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ChromaticityType {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition_ChromaticityTag>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    number_of_device_channels: RefCell<u16>,
    colorant_and_phosphor_encoding: RefCell<Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings>,
    ciexy_coordinates_per_channel: RefCell<Vec<OptRc<Icc4_TagTable_TagDefinition_ChromaticityType_CiexyCoordinateValues>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_ChromaticityType {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition_ChromaticityTag;

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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/chromaticity_type/seq/0".to_string() }));
        }
        *self_rc.number_of_device_channels.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.colorant_and_phosphor_encoding.borrow_mut() = (_io.read_u2be()? as i64).try_into()?;
        *self_rc.ciexy_coordinates_per_channel.borrow_mut() = Vec::new();
        let l_ciexy_coordinates_per_channel = *self_rc.number_of_device_channels();
        for _i in 0..l_ciexy_coordinates_per_channel {
            let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_ChromaticityType_CiexyCoordinateValues>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.ciexy_coordinates_per_channel.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ChromaticityType {
}
impl Icc4_TagTable_TagDefinition_ChromaticityType {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ChromaticityType {
    pub fn number_of_device_channels(&self) -> Ref<'_, u16> {
        self.number_of_device_channels.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ChromaticityType {
    pub fn colorant_and_phosphor_encoding(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings> {
        self.colorant_and_phosphor_encoding.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ChromaticityType {
    pub fn ciexy_coordinates_per_channel(&self) -> Ref<'_, Vec<OptRc<Icc4_TagTable_TagDefinition_ChromaticityType_CiexyCoordinateValues>>> {
        self.ciexy_coordinates_per_channel.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ChromaticityType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings {
    Unknown,
    ItuRBt7092,
    SmpteRp145,
    EbuTech3213E,
    P22,
    Unknown(i64),
}

impl TryFrom<i64> for Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings> {
        match flag {
            0 => Ok(Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings::Unknown),
            1 => Ok(Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings::ItuRBt7092),
            2 => Ok(Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings::SmpteRp145),
            3 => Ok(Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings::EbuTech3213E),
            4 => Ok(Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings::P22),
            _ => Ok(Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings::Unknown(flag)),
        }
    }
}

impl From<&Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings> for i64 {
    fn from(v: &Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings) -> Self {
        match *v {
            Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings::Unknown => 0,
            Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings::ItuRBt7092 => 1,
            Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings::SmpteRp145 => 2,
            Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings::EbuTech3213E => 3,
            Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings::P22 => 4,
            Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings::Unknown(v) => v
        }
    }
}

impl Default for Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings {
    fn default() -> Self { Icc4_TagTable_TagDefinition_ChromaticityType_ColorantAndPhosphorEncodings::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ChromaticityType_CiexyCoordinateValues {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition_ChromaticityType>,
    pub _self: SharedType<Self>,
    x_coordinate: RefCell<u16>,
    y_coordinate: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_ChromaticityType_CiexyCoordinateValues {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition_ChromaticityType;

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
        *self_rc.x_coordinate.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.y_coordinate.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ChromaticityType_CiexyCoordinateValues {
}
impl Icc4_TagTable_TagDefinition_ChromaticityType_CiexyCoordinateValues {
    pub fn x_coordinate(&self) -> Ref<'_, u16> {
        self.x_coordinate.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ChromaticityType_CiexyCoordinateValues {
    pub fn y_coordinate(&self) -> Ref<'_, u16> {
        self.y_coordinate.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ChromaticityType_CiexyCoordinateValues {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ColorantOrderTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_ColorantOrderTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_ColorantOrderTag_TagData {
    Icc4_TagTable_TagDefinition_ColorantOrderType(OptRc<Icc4_TagTable_TagDefinition_ColorantOrderType>),
}
impl From<&Icc4_TagTable_TagDefinition_ColorantOrderTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_ColorantOrderType> {
    fn from(v: &Icc4_TagTable_TagDefinition_ColorantOrderTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_ColorantOrderTag_TagData::Icc4_TagTable_TagDefinition_ColorantOrderType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_ColorantOrderTag_TagData::Icc4_TagTable_TagDefinition_ColorantOrderType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ColorantOrderType>> for Icc4_TagTable_TagDefinition_ColorantOrderTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ColorantOrderType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ColorantOrderType(v)
    }
}
impl Icc4_TagTable_TagDefinition_ColorantOrderTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_ColorantOrderTag_TagData::Icc4_TagTable_TagDefinition_ColorantOrderType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ColorantOrderTag_TagData {
    pub fn count_of_colorants(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_ColorantOrderTag_TagData::Icc4_TagTable_TagDefinition_ColorantOrderType(x) => x.count_of_colorants.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ColorantOrderTag_TagData {
    pub fn numbers_of_colorants_in_order_of_printing(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_ColorantOrderTag_TagData::Icc4_TagTable_TagDefinition_ColorantOrderType(x) => x.numbers_of_colorants_in_order_of_printing.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_ColorantOrderTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::ColorantOrderType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_ColorantOrderType>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ColorantOrderTag {
}
impl Icc4_TagTable_TagDefinition_ColorantOrderTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ColorantOrderTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_ColorantOrderTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ColorantOrderTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ColorantOrderType {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition_ColorantOrderTag>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    count_of_colorants: RefCell<u32>,
    numbers_of_colorants_in_order_of_printing: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_ColorantOrderType {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition_ColorantOrderTag;

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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/colorant_order_type/seq/0".to_string() }));
        }
        *self_rc.count_of_colorants.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.numbers_of_colorants_in_order_of_printing.borrow_mut() = Vec::new();
        let l_numbers_of_colorants_in_order_of_printing = *self_rc.count_of_colorants();
        for _i in 0..l_numbers_of_colorants_in_order_of_printing {
            self_rc.numbers_of_colorants_in_order_of_printing.borrow_mut().push(_io.read_u1()?.into());
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ColorantOrderType {
}
impl Icc4_TagTable_TagDefinition_ColorantOrderType {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ColorantOrderType {
    pub fn count_of_colorants(&self) -> Ref<'_, u32> {
        self.count_of_colorants.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ColorantOrderType {
    pub fn numbers_of_colorants_in_order_of_printing(&self) -> Ref<'_, Vec<u8>> {
        self.numbers_of_colorants_in_order_of_printing.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ColorantOrderType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ColorantTableOutTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_ColorantTableOutTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_ColorantTableOutTag_TagData {
    Icc4_TagTable_TagDefinition_ColorantTableType(OptRc<Icc4_TagTable_TagDefinition_ColorantTableType>),
}
impl From<&Icc4_TagTable_TagDefinition_ColorantTableOutTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_ColorantTableType> {
    fn from(v: &Icc4_TagTable_TagDefinition_ColorantTableOutTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_ColorantTableOutTag_TagData::Icc4_TagTable_TagDefinition_ColorantTableType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_ColorantTableOutTag_TagData::Icc4_TagTable_TagDefinition_ColorantTableType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ColorantTableType>> for Icc4_TagTable_TagDefinition_ColorantTableOutTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ColorantTableType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ColorantTableType(v)
    }
}
impl Icc4_TagTable_TagDefinition_ColorantTableOutTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_ColorantTableOutTag_TagData::Icc4_TagTable_TagDefinition_ColorantTableType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ColorantTableOutTag_TagData {
    pub fn count_of_colorants(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_ColorantTableOutTag_TagData::Icc4_TagTable_TagDefinition_ColorantTableType(x) => x.count_of_colorants.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ColorantTableOutTag_TagData {
    pub fn colorants(&self) -> Ref<'_, Vec<OptRc<Icc4_TagTable_TagDefinition_ColorantTableType_Colorant>>> {
        match self {
            Icc4_TagTable_TagDefinition_ColorantTableOutTag_TagData::Icc4_TagTable_TagDefinition_ColorantTableType(x) => x.colorants.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_ColorantTableOutTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::ColorantTableType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_ColorantTableType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ColorantTableOutTag {
}
impl Icc4_TagTable_TagDefinition_ColorantTableOutTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ColorantTableOutTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_ColorantTableOutTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ColorantTableOutTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ColorantTableTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_ColorantTableTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_ColorantTableTag_TagData {
    Icc4_TagTable_TagDefinition_ColorantTableType(OptRc<Icc4_TagTable_TagDefinition_ColorantTableType>),
}
impl From<&Icc4_TagTable_TagDefinition_ColorantTableTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_ColorantTableType> {
    fn from(v: &Icc4_TagTable_TagDefinition_ColorantTableTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_ColorantTableTag_TagData::Icc4_TagTable_TagDefinition_ColorantTableType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_ColorantTableTag_TagData::Icc4_TagTable_TagDefinition_ColorantTableType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ColorantTableType>> for Icc4_TagTable_TagDefinition_ColorantTableTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ColorantTableType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ColorantTableType(v)
    }
}
impl Icc4_TagTable_TagDefinition_ColorantTableTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_ColorantTableTag_TagData::Icc4_TagTable_TagDefinition_ColorantTableType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ColorantTableTag_TagData {
    pub fn count_of_colorants(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_ColorantTableTag_TagData::Icc4_TagTable_TagDefinition_ColorantTableType(x) => x.count_of_colorants.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ColorantTableTag_TagData {
    pub fn colorants(&self) -> Ref<'_, Vec<OptRc<Icc4_TagTable_TagDefinition_ColorantTableType_Colorant>>> {
        match self {
            Icc4_TagTable_TagDefinition_ColorantTableTag_TagData::Icc4_TagTable_TagDefinition_ColorantTableType(x) => x.colorants.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_ColorantTableTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::ColorantTableType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_ColorantTableType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ColorantTableTag {
}
impl Icc4_TagTable_TagDefinition_ColorantTableTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ColorantTableTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_ColorantTableTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ColorantTableTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ColorantTableType {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    count_of_colorants: RefCell<u32>,
    colorants: RefCell<Vec<OptRc<Icc4_TagTable_TagDefinition_ColorantTableType_Colorant>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_ColorantTableType {
    type Root = Icc4;
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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/colorant_table_type/seq/0".to_string() }));
        }
        *self_rc.count_of_colorants.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.colorants.borrow_mut() = Vec::new();
        let l_colorants = *self_rc.count_of_colorants();
        for _i in 0..l_colorants {
            let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_ColorantTableType_Colorant>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.colorants.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ColorantTableType {
}
impl Icc4_TagTable_TagDefinition_ColorantTableType {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ColorantTableType {
    pub fn count_of_colorants(&self) -> Ref<'_, u32> {
        self.count_of_colorants.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ColorantTableType {
    pub fn colorants(&self) -> Ref<'_, Vec<OptRc<Icc4_TagTable_TagDefinition_ColorantTableType_Colorant>>> {
        self.colorants.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ColorantTableType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ColorantTableType_Colorant {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition_ColorantTableType>,
    pub _self: SharedType<Self>,
    name: RefCell<String>,
    padding: RefCell<Vec<Vec<u8>>>,
    pcs_values: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_ColorantTableType_Colorant {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition_ColorantTableType;

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
        *self_rc.name.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?;
        *self_rc.padding.borrow_mut() = Vec::new();
        let l_padding = ((32 as i32) - (self_rc.name().len() as i32));
        for _i in 0..l_padding {
            self_rc.padding.borrow_mut().push(_io.read_bytes(1 as usize)?.into());
            if !(self_rc.padding()[_i as usize] == vec![0x0u8]) {
                return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/colorant_table_type/types/colorant/seq/1".to_string() }));
            }
        }
        *self_rc.pcs_values.borrow_mut() = _io.read_bytes(6 as usize)?.into();
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ColorantTableType_Colorant {
}
impl Icc4_TagTable_TagDefinition_ColorantTableType_Colorant {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ColorantTableType_Colorant {
    pub fn padding(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.padding.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ColorantTableType_Colorant {
    pub fn pcs_values(&self) -> Ref<'_, Vec<u8>> {
        self.pcs_values.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ColorantTableType_Colorant {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag_TagData {
    Icc4_TagTable_TagDefinition_SignatureType(OptRc<Icc4_TagTable_TagDefinition_SignatureType>),
}
impl From<&Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_SignatureType> {
    fn from(v: &Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag_TagData::Icc4_TagTable_TagDefinition_SignatureType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag_TagData::Icc4_TagTable_TagDefinition_SignatureType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_SignatureType>> for Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_SignatureType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_SignatureType(v)
    }
}
impl Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag_TagData::Icc4_TagTable_TagDefinition_SignatureType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag_TagData {
    pub fn signature(&self) -> Ref<'_, String> {
        match self {
            Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag_TagData::Icc4_TagTable_TagDefinition_SignatureType(x) => x.signature.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::SignatureType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_SignatureType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag {
}
impl Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ColorimetricIntentImageStateTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_CopyrightTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_CopyrightTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_CopyrightTag_TagData {
    Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType>),
}
impl From<&Icc4_TagTable_TagDefinition_CopyrightTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType> {
    fn from(v: &Icc4_TagTable_TagDefinition_CopyrightTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_CopyrightTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_CopyrightTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType>> for Icc4_TagTable_TagDefinition_CopyrightTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(v)
    }
}
impl Icc4_TagTable_TagDefinition_CopyrightTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_CopyrightTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_CopyrightTag_TagData {
    pub fn number_of_records(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_CopyrightTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) => x.number_of_records.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_CopyrightTag_TagData {
    pub fn record_size(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_CopyrightTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) => x.record_size.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_CopyrightTag_TagData {
    pub fn records(&self) -> Ref<'_, Vec<OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record>>> {
        match self {
            Icc4_TagTable_TagDefinition_CopyrightTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) => x.records.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_CopyrightTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiLocalizedUnicodeType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_CopyrightTag {
}
impl Icc4_TagTable_TagDefinition_CopyrightTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_CopyrightTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_CopyrightTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_CopyrightTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_CurveType {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    number_of_entries: RefCell<u32>,
    curve_values: RefCell<Vec<u16>>,
    curve_value: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_CurveType {
    type Root = Icc4;
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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/curve_type/seq/0".to_string() }));
        }
        *self_rc.number_of_entries.borrow_mut() = _io.read_u4be()?.into();
        if ((*self_rc.number_of_entries() as u32) > (1 as u32)) {
            *self_rc.curve_values.borrow_mut() = Vec::new();
            let l_curve_values = *self_rc.number_of_entries();
            for _i in 0..l_curve_values {
                self_rc.curve_values.borrow_mut().push(_io.read_u2be()?.into());
            }
        }
        if ((*self_rc.number_of_entries() as u32) == (1 as u32)) {
            *self_rc.curve_value.borrow_mut() = _io.read_u1()?.into();
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_CurveType {
}
impl Icc4_TagTable_TagDefinition_CurveType {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_CurveType {
    pub fn number_of_entries(&self) -> Ref<'_, u32> {
        self.number_of_entries.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_CurveType {
    pub fn curve_values(&self) -> Ref<'_, Vec<u16>> {
        self.curve_values.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_CurveType {
    pub fn curve_value(&self) -> Ref<'_, u8> {
        self.curve_value.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_CurveType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_DToB0Tag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_DToB0Tag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_DToB0Tag_TagData {
    Icc4_TagTable_TagDefinition_MultiProcessElementsType(OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType>),
}
impl From<&Icc4_TagTable_TagDefinition_DToB0Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType> {
    fn from(v: &Icc4_TagTable_TagDefinition_DToB0Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_DToB0Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_DToB0Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType>> for Icc4_TagTable_TagDefinition_DToB0Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_MultiProcessElementsType(v)
    }
}
impl Icc4_TagTable_TagDefinition_DToB0Tag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_DToB0Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DToB0Tag_TagData {
    pub fn number_of_input_channels(&self) -> Ref<'_, u16> {
        match self {
            Icc4_TagTable_TagDefinition_DToB0Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.number_of_input_channels.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DToB0Tag_TagData {
    pub fn number_of_output_channels(&self) -> Ref<'_, u16> {
        match self {
            Icc4_TagTable_TagDefinition_DToB0Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.number_of_output_channels.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DToB0Tag_TagData {
    pub fn number_of_processing_elements(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_DToB0Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.number_of_processing_elements.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DToB0Tag_TagData {
    pub fn process_element_positions_table(&self) -> Ref<'_, Vec<OptRc<Icc4_PositionNumber>>> {
        match self {
            Icc4_TagTable_TagDefinition_DToB0Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.process_element_positions_table.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DToB0Tag_TagData {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_DToB0Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.data.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_DToB0Tag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiProcessElementsType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_MultiProcessElementsType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_DToB0Tag {
}
impl Icc4_TagTable_TagDefinition_DToB0Tag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_DToB0Tag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_DToB0Tag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_DToB0Tag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_DToB1Tag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_DToB1Tag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_DToB1Tag_TagData {
    Icc4_TagTable_TagDefinition_MultiProcessElementsType(OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType>),
}
impl From<&Icc4_TagTable_TagDefinition_DToB1Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType> {
    fn from(v: &Icc4_TagTable_TagDefinition_DToB1Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_DToB1Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_DToB1Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType>> for Icc4_TagTable_TagDefinition_DToB1Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_MultiProcessElementsType(v)
    }
}
impl Icc4_TagTable_TagDefinition_DToB1Tag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_DToB1Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DToB1Tag_TagData {
    pub fn number_of_input_channels(&self) -> Ref<'_, u16> {
        match self {
            Icc4_TagTable_TagDefinition_DToB1Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.number_of_input_channels.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DToB1Tag_TagData {
    pub fn number_of_output_channels(&self) -> Ref<'_, u16> {
        match self {
            Icc4_TagTable_TagDefinition_DToB1Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.number_of_output_channels.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DToB1Tag_TagData {
    pub fn number_of_processing_elements(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_DToB1Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.number_of_processing_elements.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DToB1Tag_TagData {
    pub fn process_element_positions_table(&self) -> Ref<'_, Vec<OptRc<Icc4_PositionNumber>>> {
        match self {
            Icc4_TagTable_TagDefinition_DToB1Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.process_element_positions_table.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DToB1Tag_TagData {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_DToB1Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.data.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_DToB1Tag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiProcessElementsType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_MultiProcessElementsType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_DToB1Tag {
}
impl Icc4_TagTable_TagDefinition_DToB1Tag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_DToB1Tag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_DToB1Tag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_DToB1Tag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_DToB2Tag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_DToB2Tag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_DToB2Tag_TagData {
    Icc4_TagTable_TagDefinition_MultiProcessElementsType(OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType>),
}
impl From<&Icc4_TagTable_TagDefinition_DToB2Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType> {
    fn from(v: &Icc4_TagTable_TagDefinition_DToB2Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_DToB2Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_DToB2Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType>> for Icc4_TagTable_TagDefinition_DToB2Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_MultiProcessElementsType(v)
    }
}
impl Icc4_TagTable_TagDefinition_DToB2Tag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_DToB2Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DToB2Tag_TagData {
    pub fn number_of_input_channels(&self) -> Ref<'_, u16> {
        match self {
            Icc4_TagTable_TagDefinition_DToB2Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.number_of_input_channels.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DToB2Tag_TagData {
    pub fn number_of_output_channels(&self) -> Ref<'_, u16> {
        match self {
            Icc4_TagTable_TagDefinition_DToB2Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.number_of_output_channels.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DToB2Tag_TagData {
    pub fn number_of_processing_elements(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_DToB2Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.number_of_processing_elements.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DToB2Tag_TagData {
    pub fn process_element_positions_table(&self) -> Ref<'_, Vec<OptRc<Icc4_PositionNumber>>> {
        match self {
            Icc4_TagTable_TagDefinition_DToB2Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.process_element_positions_table.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DToB2Tag_TagData {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_DToB2Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.data.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_DToB2Tag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiProcessElementsType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_MultiProcessElementsType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_DToB2Tag {
}
impl Icc4_TagTable_TagDefinition_DToB2Tag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_DToB2Tag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_DToB2Tag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_DToB2Tag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_DToB3Tag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_DToB3Tag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_DToB3Tag_TagData {
    Icc4_TagTable_TagDefinition_MultiProcessElementsType(OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType>),
}
impl From<&Icc4_TagTable_TagDefinition_DToB3Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType> {
    fn from(v: &Icc4_TagTable_TagDefinition_DToB3Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_DToB3Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_DToB3Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType>> for Icc4_TagTable_TagDefinition_DToB3Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_MultiProcessElementsType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_MultiProcessElementsType(v)
    }
}
impl Icc4_TagTable_TagDefinition_DToB3Tag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_DToB3Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DToB3Tag_TagData {
    pub fn number_of_input_channels(&self) -> Ref<'_, u16> {
        match self {
            Icc4_TagTable_TagDefinition_DToB3Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.number_of_input_channels.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DToB3Tag_TagData {
    pub fn number_of_output_channels(&self) -> Ref<'_, u16> {
        match self {
            Icc4_TagTable_TagDefinition_DToB3Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.number_of_output_channels.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DToB3Tag_TagData {
    pub fn number_of_processing_elements(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_DToB3Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.number_of_processing_elements.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DToB3Tag_TagData {
    pub fn process_element_positions_table(&self) -> Ref<'_, Vec<OptRc<Icc4_PositionNumber>>> {
        match self {
            Icc4_TagTable_TagDefinition_DToB3Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.process_element_positions_table.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DToB3Tag_TagData {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_DToB3Tag_TagData::Icc4_TagTable_TagDefinition_MultiProcessElementsType(x) => x.data.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_DToB3Tag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiProcessElementsType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_MultiProcessElementsType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_DToB3Tag {
}
impl Icc4_TagTable_TagDefinition_DToB3Tag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_DToB3Tag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_DToB3Tag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_DToB3Tag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_DataType {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    data_flag: RefCell<Icc4_TagTable_TagDefinition_DataType_DataTypes>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_DataType {
    type Root = Icc4;
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
        *self_rc.data_flag.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_DataType {
}
impl Icc4_TagTable_TagDefinition_DataType {
    pub fn data_flag(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_DataType_DataTypes> {
        self.data_flag.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_DataType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Icc4_TagTable_TagDefinition_DataType_DataTypes {
    AsciiData,
    BinaryData,
    Unknown(i64),
}

impl TryFrom<i64> for Icc4_TagTable_TagDefinition_DataType_DataTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Icc4_TagTable_TagDefinition_DataType_DataTypes> {
        match flag {
            0 => Ok(Icc4_TagTable_TagDefinition_DataType_DataTypes::AsciiData),
            1 => Ok(Icc4_TagTable_TagDefinition_DataType_DataTypes::BinaryData),
            _ => Ok(Icc4_TagTable_TagDefinition_DataType_DataTypes::Unknown(flag)),
        }
    }
}

impl From<&Icc4_TagTable_TagDefinition_DataType_DataTypes> for i64 {
    fn from(v: &Icc4_TagTable_TagDefinition_DataType_DataTypes) -> Self {
        match *v {
            Icc4_TagTable_TagDefinition_DataType_DataTypes::AsciiData => 0,
            Icc4_TagTable_TagDefinition_DataType_DataTypes::BinaryData => 1,
            Icc4_TagTable_TagDefinition_DataType_DataTypes::Unknown(v) => v
        }
    }
}

impl Default for Icc4_TagTable_TagDefinition_DataType_DataTypes {
    fn default() -> Self { Icc4_TagTable_TagDefinition_DataType_DataTypes::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_DateTimeType {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition_CalibrationDateTimeTag>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    date_and_time: RefCell<OptRc<Icc4_DateTimeNumber>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_DateTimeType {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition_CalibrationDateTimeTag;

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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/date_time_type/seq/0".to_string() }));
        }
        let t = Self::read_into::<_, Icc4_DateTimeNumber>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.date_and_time.borrow_mut() = t;
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_DateTimeType {
}
impl Icc4_TagTable_TagDefinition_DateTimeType {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_DateTimeType {
    pub fn date_and_time(&self) -> Ref<'_, OptRc<Icc4_DateTimeNumber>> {
        self.date_and_time.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_DateTimeType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_DeviceMfgDescTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_DeviceMfgDescTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_DeviceMfgDescTag_TagData {
    Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType>),
}
impl From<&Icc4_TagTable_TagDefinition_DeviceMfgDescTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType> {
    fn from(v: &Icc4_TagTable_TagDefinition_DeviceMfgDescTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_DeviceMfgDescTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_DeviceMfgDescTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType>> for Icc4_TagTable_TagDefinition_DeviceMfgDescTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(v)
    }
}
impl Icc4_TagTable_TagDefinition_DeviceMfgDescTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_DeviceMfgDescTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DeviceMfgDescTag_TagData {
    pub fn number_of_records(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_DeviceMfgDescTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) => x.number_of_records.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DeviceMfgDescTag_TagData {
    pub fn record_size(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_DeviceMfgDescTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) => x.record_size.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DeviceMfgDescTag_TagData {
    pub fn records(&self) -> Ref<'_, Vec<OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record>>> {
        match self {
            Icc4_TagTable_TagDefinition_DeviceMfgDescTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) => x.records.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_DeviceMfgDescTag {
    type Root = Icc4;
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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiLocalizedUnicodeType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_DeviceMfgDescTag {
}
impl Icc4_TagTable_TagDefinition_DeviceMfgDescTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_DeviceMfgDescTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_DeviceMfgDescTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_DeviceMfgDescTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_DeviceModelDescTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_DeviceModelDescTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_DeviceModelDescTag_TagData {
    Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType>),
}
impl From<&Icc4_TagTable_TagDefinition_DeviceModelDescTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType> {
    fn from(v: &Icc4_TagTable_TagDefinition_DeviceModelDescTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_DeviceModelDescTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_DeviceModelDescTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType>> for Icc4_TagTable_TagDefinition_DeviceModelDescTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(v)
    }
}
impl Icc4_TagTable_TagDefinition_DeviceModelDescTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_DeviceModelDescTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DeviceModelDescTag_TagData {
    pub fn number_of_records(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_DeviceModelDescTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) => x.number_of_records.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DeviceModelDescTag_TagData {
    pub fn record_size(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_DeviceModelDescTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) => x.record_size.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_DeviceModelDescTag_TagData {
    pub fn records(&self) -> Ref<'_, Vec<OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record>>> {
        match self {
            Icc4_TagTable_TagDefinition_DeviceModelDescTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) => x.records.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_DeviceModelDescTag {
    type Root = Icc4;
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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiLocalizedUnicodeType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_DeviceModelDescTag {
}
impl Icc4_TagTable_TagDefinition_DeviceModelDescTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_DeviceModelDescTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_DeviceModelDescTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_DeviceModelDescTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_GamutTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_GamutTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_GamutTag_TagData {
    Icc4_TagTable_TagDefinition_LutBToAType(OptRc<Icc4_TagTable_TagDefinition_LutBToAType>),
    Icc4_TagTable_TagDefinition_Lut8Type(OptRc<Icc4_TagTable_TagDefinition_Lut8Type>),
    Icc4_TagTable_TagDefinition_Lut16Type(OptRc<Icc4_TagTable_TagDefinition_Lut16Type>),
}
impl From<&Icc4_TagTable_TagDefinition_GamutTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_LutBToAType> {
    fn from(v: &Icc4_TagTable_TagDefinition_GamutTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_GamutTag_TagData::Icc4_TagTable_TagDefinition_LutBToAType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_GamutTag_TagData::Icc4_TagTable_TagDefinition_LutBToAType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_LutBToAType>> for Icc4_TagTable_TagDefinition_GamutTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_LutBToAType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_LutBToAType(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_GamutTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_Lut8Type> {
    fn from(v: &Icc4_TagTable_TagDefinition_GamutTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_GamutTag_TagData::Icc4_TagTable_TagDefinition_Lut8Type(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_GamutTag_TagData::Icc4_TagTable_TagDefinition_Lut8Type, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_Lut8Type>> for Icc4_TagTable_TagDefinition_GamutTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_Lut8Type>) -> Self {
        Self::Icc4_TagTable_TagDefinition_Lut8Type(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_GamutTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_Lut16Type> {
    fn from(v: &Icc4_TagTable_TagDefinition_GamutTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_GamutTag_TagData::Icc4_TagTable_TagDefinition_Lut16Type(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_GamutTag_TagData::Icc4_TagTable_TagDefinition_Lut16Type, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_Lut16Type>> for Icc4_TagTable_TagDefinition_GamutTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_Lut16Type>) -> Self {
        Self::Icc4_TagTable_TagDefinition_Lut16Type(v)
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_GamutTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionBToATableType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_LutBToAType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionTableWithOneBytePrecisionType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_Lut8Type>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionTableWithTwoBytePrecisionType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_Lut16Type>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_GamutTag {
}
impl Icc4_TagTable_TagDefinition_GamutTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_GamutTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_GamutTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_GamutTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_GrayTrcTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_GrayTrcTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_GrayTrcTag_TagData {
    Icc4_TagTable_TagDefinition_CurveType(OptRc<Icc4_TagTable_TagDefinition_CurveType>),
    Icc4_TagTable_TagDefinition_ParametricCurveType(OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType>),
}
impl From<&Icc4_TagTable_TagDefinition_GrayTrcTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_CurveType> {
    fn from(v: &Icc4_TagTable_TagDefinition_GrayTrcTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_GrayTrcTag_TagData::Icc4_TagTable_TagDefinition_CurveType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_GrayTrcTag_TagData::Icc4_TagTable_TagDefinition_CurveType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_CurveType>> for Icc4_TagTable_TagDefinition_GrayTrcTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_CurveType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_CurveType(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_GrayTrcTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType> {
    fn from(v: &Icc4_TagTable_TagDefinition_GrayTrcTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_GrayTrcTag_TagData::Icc4_TagTable_TagDefinition_ParametricCurveType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_GrayTrcTag_TagData::Icc4_TagTable_TagDefinition_ParametricCurveType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType>> for Icc4_TagTable_TagDefinition_GrayTrcTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ParametricCurveType(v)
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_GrayTrcTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::CurveType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_CurveType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::ParametricCurveType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_ParametricCurveType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_GrayTrcTag {
}
impl Icc4_TagTable_TagDefinition_GrayTrcTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_GrayTrcTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_GrayTrcTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_GrayTrcTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_GreenMatrixColumnTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_GreenMatrixColumnTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_GreenMatrixColumnTag_TagData {
    Icc4_TagTable_TagDefinition_XyzType(OptRc<Icc4_TagTable_TagDefinition_XyzType>),
}
impl From<&Icc4_TagTable_TagDefinition_GreenMatrixColumnTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_XyzType> {
    fn from(v: &Icc4_TagTable_TagDefinition_GreenMatrixColumnTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_GreenMatrixColumnTag_TagData::Icc4_TagTable_TagDefinition_XyzType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_GreenMatrixColumnTag_TagData::Icc4_TagTable_TagDefinition_XyzType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_XyzType>> for Icc4_TagTable_TagDefinition_GreenMatrixColumnTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_XyzType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_XyzType(v)
    }
}
impl Icc4_TagTable_TagDefinition_GreenMatrixColumnTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_GreenMatrixColumnTag_TagData::Icc4_TagTable_TagDefinition_XyzType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_GreenMatrixColumnTag_TagData {
    pub fn values(&self) -> Ref<'_, Vec<OptRc<Icc4_XyzNumber>>> {
        match self {
            Icc4_TagTable_TagDefinition_GreenMatrixColumnTag_TagData::Icc4_TagTable_TagDefinition_XyzType(x) => x.values.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_GreenMatrixColumnTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::XyzType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_XyzType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_GreenMatrixColumnTag {
}
impl Icc4_TagTable_TagDefinition_GreenMatrixColumnTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_GreenMatrixColumnTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_GreenMatrixColumnTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_GreenMatrixColumnTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_GreenTrcTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_GreenTrcTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_GreenTrcTag_TagData {
    Icc4_TagTable_TagDefinition_CurveType(OptRc<Icc4_TagTable_TagDefinition_CurveType>),
    Icc4_TagTable_TagDefinition_ParametricCurveType(OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType>),
}
impl From<&Icc4_TagTable_TagDefinition_GreenTrcTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_CurveType> {
    fn from(v: &Icc4_TagTable_TagDefinition_GreenTrcTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_GreenTrcTag_TagData::Icc4_TagTable_TagDefinition_CurveType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_GreenTrcTag_TagData::Icc4_TagTable_TagDefinition_CurveType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_CurveType>> for Icc4_TagTable_TagDefinition_GreenTrcTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_CurveType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_CurveType(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_GreenTrcTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType> {
    fn from(v: &Icc4_TagTable_TagDefinition_GreenTrcTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_GreenTrcTag_TagData::Icc4_TagTable_TagDefinition_ParametricCurveType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_GreenTrcTag_TagData::Icc4_TagTable_TagDefinition_ParametricCurveType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType>> for Icc4_TagTable_TagDefinition_GreenTrcTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ParametricCurveType(v)
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_GreenTrcTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::CurveType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_CurveType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::ParametricCurveType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_ParametricCurveType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_GreenTrcTag {
}
impl Icc4_TagTable_TagDefinition_GreenTrcTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_GreenTrcTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_GreenTrcTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_GreenTrcTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_LuminanceTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_LuminanceTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_LuminanceTag_TagData {
    Icc4_TagTable_TagDefinition_XyzType(OptRc<Icc4_TagTable_TagDefinition_XyzType>),
}
impl From<&Icc4_TagTable_TagDefinition_LuminanceTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_XyzType> {
    fn from(v: &Icc4_TagTable_TagDefinition_LuminanceTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_LuminanceTag_TagData::Icc4_TagTable_TagDefinition_XyzType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_LuminanceTag_TagData::Icc4_TagTable_TagDefinition_XyzType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_XyzType>> for Icc4_TagTable_TagDefinition_LuminanceTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_XyzType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_XyzType(v)
    }
}
impl Icc4_TagTable_TagDefinition_LuminanceTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_LuminanceTag_TagData::Icc4_TagTable_TagDefinition_XyzType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_LuminanceTag_TagData {
    pub fn values(&self) -> Ref<'_, Vec<OptRc<Icc4_XyzNumber>>> {
        match self {
            Icc4_TagTable_TagDefinition_LuminanceTag_TagData::Icc4_TagTable_TagDefinition_XyzType(x) => x.values.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_LuminanceTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::XyzType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_XyzType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_LuminanceTag {
}
impl Icc4_TagTable_TagDefinition_LuminanceTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_LuminanceTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_LuminanceTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_LuminanceTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_Lut16Type {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    number_of_input_channels: RefCell<u8>,
    number_of_output_channels: RefCell<u8>,
    number_of_clut_grid_points: RefCell<u8>,
    padding: RefCell<Vec<u8>>,
    encoded_e_parameters: RefCell<Vec<i32>>,
    number_of_input_table_entries: RefCell<u16>,
    number_of_output_table_entries: RefCell<u16>,
    input_tables: RefCell<Vec<u8>>,
    clut_values: RefCell<Vec<u8>>,
    output_tables: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_Lut16Type {
    type Root = Icc4;
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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/lut_16_type/seq/0".to_string() }));
        }
        *self_rc.number_of_input_channels.borrow_mut() = _io.read_u1()?.into();
        *self_rc.number_of_output_channels.borrow_mut() = _io.read_u1()?.into();
        *self_rc.number_of_clut_grid_points.borrow_mut() = _io.read_u1()?.into();
        *self_rc.padding.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.padding() == vec![0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/lut_16_type/seq/4".to_string() }));
        }
        *self_rc.encoded_e_parameters.borrow_mut() = Vec::new();
        let l_encoded_e_parameters = 9;
        for _i in 0..l_encoded_e_parameters {
            self_rc.encoded_e_parameters.borrow_mut().push(_io.read_s4be()?.into());
        }
        *self_rc.number_of_input_table_entries.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.number_of_output_table_entries.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.input_tables.borrow_mut() = _io.read_bytes(((((2 as u8) * (*self_rc.number_of_input_channels() as u8)) as i32) * (*self_rc.number_of_input_table_entries() as i32)) as usize)?.into();
        *self_rc.clut_values.borrow_mut() = _io.read_bytes(((((2 as i32) * (((*self_rc.number_of_clut_grid_points() as u8) ^ (*self_rc.number_of_input_channels() as u8)) as i32)) as i32) * (*self_rc.number_of_output_channels() as i32)) as usize)?.into();
        *self_rc.output_tables.borrow_mut() = _io.read_bytes(((((2 as u8) * (*self_rc.number_of_output_channels() as u8)) as i32) * (*self_rc.number_of_output_table_entries() as i32)) as usize)?.into();
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_Lut16Type {
}
impl Icc4_TagTable_TagDefinition_Lut16Type {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Lut16Type {
    pub fn number_of_input_channels(&self) -> Ref<'_, u8> {
        self.number_of_input_channels.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Lut16Type {
    pub fn number_of_output_channels(&self) -> Ref<'_, u8> {
        self.number_of_output_channels.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Lut16Type {
    pub fn number_of_clut_grid_points(&self) -> Ref<'_, u8> {
        self.number_of_clut_grid_points.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Lut16Type {
    pub fn padding(&self) -> Ref<'_, Vec<u8>> {
        self.padding.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Lut16Type {
    pub fn encoded_e_parameters(&self) -> Ref<'_, Vec<i32>> {
        self.encoded_e_parameters.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Lut16Type {
    pub fn number_of_input_table_entries(&self) -> Ref<'_, u16> {
        self.number_of_input_table_entries.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Lut16Type {
    pub fn number_of_output_table_entries(&self) -> Ref<'_, u16> {
        self.number_of_output_table_entries.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Lut16Type {
    pub fn input_tables(&self) -> Ref<'_, Vec<u8>> {
        self.input_tables.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Lut16Type {
    pub fn clut_values(&self) -> Ref<'_, Vec<u8>> {
        self.clut_values.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Lut16Type {
    pub fn output_tables(&self) -> Ref<'_, Vec<u8>> {
        self.output_tables.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Lut16Type {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_Lut8Type {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    number_of_input_channels: RefCell<u8>,
    number_of_output_channels: RefCell<u8>,
    number_of_clut_grid_points: RefCell<u8>,
    padding: RefCell<Vec<u8>>,
    encoded_e_parameters: RefCell<Vec<i32>>,
    number_of_input_table_entries: RefCell<u32>,
    number_of_output_table_entries: RefCell<u32>,
    input_tables: RefCell<Vec<u8>>,
    clut_values: RefCell<Vec<u8>>,
    output_tables: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_Lut8Type {
    type Root = Icc4;
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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/lut_8_type/seq/0".to_string() }));
        }
        *self_rc.number_of_input_channels.borrow_mut() = _io.read_u1()?.into();
        *self_rc.number_of_output_channels.borrow_mut() = _io.read_u1()?.into();
        *self_rc.number_of_clut_grid_points.borrow_mut() = _io.read_u1()?.into();
        *self_rc.padding.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.padding() == vec![0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/lut_8_type/seq/4".to_string() }));
        }
        *self_rc.encoded_e_parameters.borrow_mut() = Vec::new();
        let l_encoded_e_parameters = 9;
        for _i in 0..l_encoded_e_parameters {
            self_rc.encoded_e_parameters.borrow_mut().push(_io.read_s4be()?.into());
        }
        *self_rc.number_of_input_table_entries.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.number_of_output_table_entries.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.input_tables.borrow_mut() = _io.read_bytes(((256 as i32) * (*self_rc.number_of_input_channels() as i32)) as usize)?.into();
        *self_rc.clut_values.borrow_mut() = _io.read_bytes(((((*self_rc.number_of_clut_grid_points() as u8) ^ (*self_rc.number_of_input_channels() as u8)) as i32) * (*self_rc.number_of_output_channels() as i32)) as usize)?.into();
        *self_rc.output_tables.borrow_mut() = _io.read_bytes(((256 as i32) * (*self_rc.number_of_output_channels() as i32)) as usize)?.into();
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_Lut8Type {
}
impl Icc4_TagTable_TagDefinition_Lut8Type {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Lut8Type {
    pub fn number_of_input_channels(&self) -> Ref<'_, u8> {
        self.number_of_input_channels.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Lut8Type {
    pub fn number_of_output_channels(&self) -> Ref<'_, u8> {
        self.number_of_output_channels.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Lut8Type {
    pub fn number_of_clut_grid_points(&self) -> Ref<'_, u8> {
        self.number_of_clut_grid_points.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Lut8Type {
    pub fn padding(&self) -> Ref<'_, Vec<u8>> {
        self.padding.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Lut8Type {
    pub fn encoded_e_parameters(&self) -> Ref<'_, Vec<i32>> {
        self.encoded_e_parameters.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Lut8Type {
    pub fn number_of_input_table_entries(&self) -> Ref<'_, u32> {
        self.number_of_input_table_entries.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Lut8Type {
    pub fn number_of_output_table_entries(&self) -> Ref<'_, u32> {
        self.number_of_output_table_entries.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Lut8Type {
    pub fn input_tables(&self) -> Ref<'_, Vec<u8>> {
        self.input_tables.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Lut8Type {
    pub fn clut_values(&self) -> Ref<'_, Vec<u8>> {
        self.clut_values.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Lut8Type {
    pub fn output_tables(&self) -> Ref<'_, Vec<u8>> {
        self.output_tables.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Lut8Type {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_LutAToBType {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    number_of_input_channels: RefCell<u8>,
    number_of_output_channels: RefCell<u8>,
    padding: RefCell<Vec<u8>>,
    offset_to_first_b_curve: RefCell<u32>,
    offset_to_matrix: RefCell<u32>,
    offset_to_first_m_curve: RefCell<u32>,
    offset_to_clut: RefCell<u32>,
    offset_to_first_a_curve: RefCell<u32>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_LutAToBType {
    type Root = Icc4;
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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/lut_a_to_b_type/seq/0".to_string() }));
        }
        *self_rc.number_of_input_channels.borrow_mut() = _io.read_u1()?.into();
        *self_rc.number_of_output_channels.borrow_mut() = _io.read_u1()?.into();
        *self_rc.padding.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.padding() == vec![0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/lut_a_to_b_type/seq/3".to_string() }));
        }
        *self_rc.offset_to_first_b_curve.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.offset_to_matrix.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.offset_to_first_m_curve.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.offset_to_clut.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.offset_to_first_a_curve.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.data.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_LutAToBType {
}
impl Icc4_TagTable_TagDefinition_LutAToBType {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_LutAToBType {
    pub fn number_of_input_channels(&self) -> Ref<'_, u8> {
        self.number_of_input_channels.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_LutAToBType {
    pub fn number_of_output_channels(&self) -> Ref<'_, u8> {
        self.number_of_output_channels.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_LutAToBType {
    pub fn padding(&self) -> Ref<'_, Vec<u8>> {
        self.padding.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_LutAToBType {
    pub fn offset_to_first_b_curve(&self) -> Ref<'_, u32> {
        self.offset_to_first_b_curve.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_LutAToBType {
    pub fn offset_to_matrix(&self) -> Ref<'_, u32> {
        self.offset_to_matrix.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_LutAToBType {
    pub fn offset_to_first_m_curve(&self) -> Ref<'_, u32> {
        self.offset_to_first_m_curve.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_LutAToBType {
    pub fn offset_to_clut(&self) -> Ref<'_, u32> {
        self.offset_to_clut.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_LutAToBType {
    pub fn offset_to_first_a_curve(&self) -> Ref<'_, u32> {
        self.offset_to_first_a_curve.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_LutAToBType {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_LutAToBType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_LutBToAType {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    number_of_input_channels: RefCell<u8>,
    number_of_output_channels: RefCell<u8>,
    padding: RefCell<Vec<u8>>,
    offset_to_first_b_curve: RefCell<u32>,
    offset_to_matrix: RefCell<u32>,
    offset_to_first_m_curve: RefCell<u32>,
    offset_to_clut: RefCell<u32>,
    offset_to_first_a_curve: RefCell<u32>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_LutBToAType {
    type Root = Icc4;
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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/lut_b_to_a_type/seq/0".to_string() }));
        }
        *self_rc.number_of_input_channels.borrow_mut() = _io.read_u1()?.into();
        *self_rc.number_of_output_channels.borrow_mut() = _io.read_u1()?.into();
        *self_rc.padding.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.padding() == vec![0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/lut_b_to_a_type/seq/3".to_string() }));
        }
        *self_rc.offset_to_first_b_curve.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.offset_to_matrix.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.offset_to_first_m_curve.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.offset_to_clut.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.offset_to_first_a_curve.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.data.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_LutBToAType {
}
impl Icc4_TagTable_TagDefinition_LutBToAType {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_LutBToAType {
    pub fn number_of_input_channels(&self) -> Ref<'_, u8> {
        self.number_of_input_channels.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_LutBToAType {
    pub fn number_of_output_channels(&self) -> Ref<'_, u8> {
        self.number_of_output_channels.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_LutBToAType {
    pub fn padding(&self) -> Ref<'_, Vec<u8>> {
        self.padding.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_LutBToAType {
    pub fn offset_to_first_b_curve(&self) -> Ref<'_, u32> {
        self.offset_to_first_b_curve.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_LutBToAType {
    pub fn offset_to_matrix(&self) -> Ref<'_, u32> {
        self.offset_to_matrix.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_LutBToAType {
    pub fn offset_to_first_m_curve(&self) -> Ref<'_, u32> {
        self.offset_to_first_m_curve.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_LutBToAType {
    pub fn offset_to_clut(&self) -> Ref<'_, u32> {
        self.offset_to_clut.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_LutBToAType {
    pub fn offset_to_first_a_curve(&self) -> Ref<'_, u32> {
        self.offset_to_first_a_curve.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_LutBToAType {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_LutBToAType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_MeasurementTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_MeasurementTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_MeasurementTag_TagData {
    Icc4_TagTable_TagDefinition_MeasurementType(OptRc<Icc4_TagTable_TagDefinition_MeasurementType>),
}
impl From<&Icc4_TagTable_TagDefinition_MeasurementTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_MeasurementType> {
    fn from(v: &Icc4_TagTable_TagDefinition_MeasurementTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_MeasurementTag_TagData::Icc4_TagTable_TagDefinition_MeasurementType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_MeasurementTag_TagData::Icc4_TagTable_TagDefinition_MeasurementType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_MeasurementType>> for Icc4_TagTable_TagDefinition_MeasurementTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_MeasurementType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_MeasurementType(v)
    }
}
impl Icc4_TagTable_TagDefinition_MeasurementTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_MeasurementTag_TagData::Icc4_TagTable_TagDefinition_MeasurementType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_MeasurementTag_TagData {
    pub fn standard_observer_encoding(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_MeasurementType_StandardObserverEncodings> {
        match self {
            Icc4_TagTable_TagDefinition_MeasurementTag_TagData::Icc4_TagTable_TagDefinition_MeasurementType(x) => x.standard_observer_encoding.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_MeasurementTag_TagData {
    pub fn nciexyz_tristimulus_values_for_measurement_backing(&self) -> OptRc<Icc4_XyzNumber> {
        match self {
            Icc4_TagTable_TagDefinition_MeasurementTag_TagData::Icc4_TagTable_TagDefinition_MeasurementType(x) => x.nciexyz_tristimulus_values_for_measurement_backing.borrow().clone(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_MeasurementTag_TagData {
    pub fn measurement_geometry_encoding(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_MeasurementType_MeasurementGeometryEncodings> {
        match self {
            Icc4_TagTable_TagDefinition_MeasurementTag_TagData::Icc4_TagTable_TagDefinition_MeasurementType(x) => x.measurement_geometry_encoding.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_MeasurementTag_TagData {
    pub fn measurement_flare_encoding(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_MeasurementType_MeasurementFlareEncodings> {
        match self {
            Icc4_TagTable_TagDefinition_MeasurementTag_TagData::Icc4_TagTable_TagDefinition_MeasurementType(x) => x.measurement_flare_encoding.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_MeasurementTag_TagData {
    pub fn standard_illuminant_encoding(&self) -> OptRc<Icc4_StandardIlluminantEncoding> {
        match self {
            Icc4_TagTable_TagDefinition_MeasurementTag_TagData::Icc4_TagTable_TagDefinition_MeasurementType(x) => x.standard_illuminant_encoding.borrow().clone(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_MeasurementTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MeasurementType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_MeasurementType>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_MeasurementTag {
}
impl Icc4_TagTable_TagDefinition_MeasurementTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_MeasurementTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_MeasurementTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_MeasurementTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_MeasurementType {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition_MeasurementTag>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    standard_observer_encoding: RefCell<Icc4_TagTable_TagDefinition_MeasurementType_StandardObserverEncodings>,
    nciexyz_tristimulus_values_for_measurement_backing: RefCell<OptRc<Icc4_XyzNumber>>,
    measurement_geometry_encoding: RefCell<Icc4_TagTable_TagDefinition_MeasurementType_MeasurementGeometryEncodings>,
    measurement_flare_encoding: RefCell<Icc4_TagTable_TagDefinition_MeasurementType_MeasurementFlareEncodings>,
    standard_illuminant_encoding: RefCell<OptRc<Icc4_StandardIlluminantEncoding>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_MeasurementType {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition_MeasurementTag;

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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/measurement_type/seq/0".to_string() }));
        }
        *self_rc.standard_observer_encoding.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        let t = Self::read_into::<_, Icc4_XyzNumber>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.nciexyz_tristimulus_values_for_measurement_backing.borrow_mut() = t;
        *self_rc.measurement_geometry_encoding.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        *self_rc.measurement_flare_encoding.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        let t = Self::read_into::<_, Icc4_StandardIlluminantEncoding>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.standard_illuminant_encoding.borrow_mut() = t;
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_MeasurementType {
}
impl Icc4_TagTable_TagDefinition_MeasurementType {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_MeasurementType {
    pub fn standard_observer_encoding(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_MeasurementType_StandardObserverEncodings> {
        self.standard_observer_encoding.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_MeasurementType {
    pub fn nciexyz_tristimulus_values_for_measurement_backing(&self) -> Ref<'_, OptRc<Icc4_XyzNumber>> {
        self.nciexyz_tristimulus_values_for_measurement_backing.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_MeasurementType {
    pub fn measurement_geometry_encoding(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_MeasurementType_MeasurementGeometryEncodings> {
        self.measurement_geometry_encoding.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_MeasurementType {
    pub fn measurement_flare_encoding(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_MeasurementType_MeasurementFlareEncodings> {
        self.measurement_flare_encoding.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_MeasurementType {
    pub fn standard_illuminant_encoding(&self) -> Ref<'_, OptRc<Icc4_StandardIlluminantEncoding>> {
        self.standard_illuminant_encoding.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_MeasurementType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Icc4_TagTable_TagDefinition_MeasurementType_MeasurementFlareEncodings {
    ZeroPercent,
    OneHundredPercent,
    Unknown(i64),
}

impl TryFrom<i64> for Icc4_TagTable_TagDefinition_MeasurementType_MeasurementFlareEncodings {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Icc4_TagTable_TagDefinition_MeasurementType_MeasurementFlareEncodings> {
        match flag {
            0 => Ok(Icc4_TagTable_TagDefinition_MeasurementType_MeasurementFlareEncodings::ZeroPercent),
            65536 => Ok(Icc4_TagTable_TagDefinition_MeasurementType_MeasurementFlareEncodings::OneHundredPercent),
            _ => Ok(Icc4_TagTable_TagDefinition_MeasurementType_MeasurementFlareEncodings::Unknown(flag)),
        }
    }
}

impl From<&Icc4_TagTable_TagDefinition_MeasurementType_MeasurementFlareEncodings> for i64 {
    fn from(v: &Icc4_TagTable_TagDefinition_MeasurementType_MeasurementFlareEncodings) -> Self {
        match *v {
            Icc4_TagTable_TagDefinition_MeasurementType_MeasurementFlareEncodings::ZeroPercent => 0,
            Icc4_TagTable_TagDefinition_MeasurementType_MeasurementFlareEncodings::OneHundredPercent => 65536,
            Icc4_TagTable_TagDefinition_MeasurementType_MeasurementFlareEncodings::Unknown(v) => v
        }
    }
}

impl Default for Icc4_TagTable_TagDefinition_MeasurementType_MeasurementFlareEncodings {
    fn default() -> Self { Icc4_TagTable_TagDefinition_MeasurementType_MeasurementFlareEncodings::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Icc4_TagTable_TagDefinition_MeasurementType_MeasurementGeometryEncodings {
    Unknown,
    ZeroDegreesTo45DegreesOr45DegreesToZeroDegrees,
    ZeroDegreesToDDegreesOrDDegreesToZeroDegrees,
    Unknown(i64),
}

impl TryFrom<i64> for Icc4_TagTable_TagDefinition_MeasurementType_MeasurementGeometryEncodings {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Icc4_TagTable_TagDefinition_MeasurementType_MeasurementGeometryEncodings> {
        match flag {
            0 => Ok(Icc4_TagTable_TagDefinition_MeasurementType_MeasurementGeometryEncodings::Unknown),
            1 => Ok(Icc4_TagTable_TagDefinition_MeasurementType_MeasurementGeometryEncodings::ZeroDegreesTo45DegreesOr45DegreesToZeroDegrees),
            2 => Ok(Icc4_TagTable_TagDefinition_MeasurementType_MeasurementGeometryEncodings::ZeroDegreesToDDegreesOrDDegreesToZeroDegrees),
            _ => Ok(Icc4_TagTable_TagDefinition_MeasurementType_MeasurementGeometryEncodings::Unknown(flag)),
        }
    }
}

impl From<&Icc4_TagTable_TagDefinition_MeasurementType_MeasurementGeometryEncodings> for i64 {
    fn from(v: &Icc4_TagTable_TagDefinition_MeasurementType_MeasurementGeometryEncodings) -> Self {
        match *v {
            Icc4_TagTable_TagDefinition_MeasurementType_MeasurementGeometryEncodings::Unknown => 0,
            Icc4_TagTable_TagDefinition_MeasurementType_MeasurementGeometryEncodings::ZeroDegreesTo45DegreesOr45DegreesToZeroDegrees => 1,
            Icc4_TagTable_TagDefinition_MeasurementType_MeasurementGeometryEncodings::ZeroDegreesToDDegreesOrDDegreesToZeroDegrees => 2,
            Icc4_TagTable_TagDefinition_MeasurementType_MeasurementGeometryEncodings::Unknown(v) => v
        }
    }
}

impl Default for Icc4_TagTable_TagDefinition_MeasurementType_MeasurementGeometryEncodings {
    fn default() -> Self { Icc4_TagTable_TagDefinition_MeasurementType_MeasurementGeometryEncodings::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Icc4_TagTable_TagDefinition_MeasurementType_StandardObserverEncodings {
    Unknown,
    Cie1931StandardColorimetricObserver,
    Cie1964StandardColorimetricObserver,
    Unknown(i64),
}

impl TryFrom<i64> for Icc4_TagTable_TagDefinition_MeasurementType_StandardObserverEncodings {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Icc4_TagTable_TagDefinition_MeasurementType_StandardObserverEncodings> {
        match flag {
            0 => Ok(Icc4_TagTable_TagDefinition_MeasurementType_StandardObserverEncodings::Unknown),
            1 => Ok(Icc4_TagTable_TagDefinition_MeasurementType_StandardObserverEncodings::Cie1931StandardColorimetricObserver),
            2 => Ok(Icc4_TagTable_TagDefinition_MeasurementType_StandardObserverEncodings::Cie1964StandardColorimetricObserver),
            _ => Ok(Icc4_TagTable_TagDefinition_MeasurementType_StandardObserverEncodings::Unknown(flag)),
        }
    }
}

impl From<&Icc4_TagTable_TagDefinition_MeasurementType_StandardObserverEncodings> for i64 {
    fn from(v: &Icc4_TagTable_TagDefinition_MeasurementType_StandardObserverEncodings) -> Self {
        match *v {
            Icc4_TagTable_TagDefinition_MeasurementType_StandardObserverEncodings::Unknown => 0,
            Icc4_TagTable_TagDefinition_MeasurementType_StandardObserverEncodings::Cie1931StandardColorimetricObserver => 1,
            Icc4_TagTable_TagDefinition_MeasurementType_StandardObserverEncodings::Cie1964StandardColorimetricObserver => 2,
            Icc4_TagTable_TagDefinition_MeasurementType_StandardObserverEncodings::Unknown(v) => v
        }
    }
}

impl Default for Icc4_TagTable_TagDefinition_MeasurementType_StandardObserverEncodings {
    fn default() -> Self { Icc4_TagTable_TagDefinition_MeasurementType_StandardObserverEncodings::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_MediaWhitePointTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_MediaWhitePointTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_MediaWhitePointTag_TagData {
    Icc4_TagTable_TagDefinition_XyzType(OptRc<Icc4_TagTable_TagDefinition_XyzType>),
}
impl From<&Icc4_TagTable_TagDefinition_MediaWhitePointTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_XyzType> {
    fn from(v: &Icc4_TagTable_TagDefinition_MediaWhitePointTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_MediaWhitePointTag_TagData::Icc4_TagTable_TagDefinition_XyzType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_MediaWhitePointTag_TagData::Icc4_TagTable_TagDefinition_XyzType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_XyzType>> for Icc4_TagTable_TagDefinition_MediaWhitePointTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_XyzType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_XyzType(v)
    }
}
impl Icc4_TagTable_TagDefinition_MediaWhitePointTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_MediaWhitePointTag_TagData::Icc4_TagTable_TagDefinition_XyzType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_MediaWhitePointTag_TagData {
    pub fn values(&self) -> Ref<'_, Vec<OptRc<Icc4_XyzNumber>>> {
        match self {
            Icc4_TagTable_TagDefinition_MediaWhitePointTag_TagData::Icc4_TagTable_TagDefinition_XyzType(x) => x.values.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_MediaWhitePointTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::XyzType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_XyzType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_MediaWhitePointTag {
}
impl Icc4_TagTable_TagDefinition_MediaWhitePointTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_MediaWhitePointTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_MediaWhitePointTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_MediaWhitePointTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    number_of_records: RefCell<u32>,
    record_size: RefCell<u32>,
    records: RefCell<Vec<OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType {
    type Root = Icc4;
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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/multi_localized_unicode_type/seq/0".to_string() }));
        }
        *self_rc.number_of_records.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.record_size.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.records.borrow_mut() = Vec::new();
        let l_records = *self_rc.number_of_records();
        for _i in 0..l_records {
            let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.records.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType {
}
impl Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType {
    pub fn number_of_records(&self) -> Ref<'_, u32> {
        self.number_of_records.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType {
    pub fn record_size(&self) -> Ref<'_, u32> {
        self.record_size.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType {
    pub fn records(&self) -> Ref<'_, Vec<OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record>>> {
        self.records.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType>,
    pub _self: SharedType<Self>,
    language_code: RefCell<u16>,
    country_code: RefCell<u16>,
    string_length: RefCell<u32>,
    string_offset: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_string_data: Cell<bool>,
    string_data: RefCell<String>,
}
impl KStruct for Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType;

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
        *self_rc.language_code.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.country_code.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.string_length.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.string_offset.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record {
    pub fn string_data(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_string_data.get() {
            return Ok(self.string_data.borrow());
        }
        self.f_string_data.set(true);
        let _pos = _io.pos();
        _io.seek(*self.string_offset() as usize)?;
        *self.string_data.borrow_mut() = bytes_to_str(&_io.read_bytes(*self.string_length() as usize)?.into(), "UTF-16BE")?;
        _io.seek(_pos)?;
        Ok(self.string_data.borrow())
    }
}
impl Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record {
    pub fn language_code(&self) -> Ref<'_, u16> {
        self.language_code.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record {
    pub fn country_code(&self) -> Ref<'_, u16> {
        self.country_code.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record {
    pub fn string_length(&self) -> Ref<'_, u32> {
        self.string_length.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record {
    pub fn string_offset(&self) -> Ref<'_, u32> {
        self.string_offset.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_MultiProcessElementsType {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    number_of_input_channels: RefCell<u16>,
    number_of_output_channels: RefCell<u16>,
    number_of_processing_elements: RefCell<u32>,
    process_element_positions_table: RefCell<Vec<OptRc<Icc4_PositionNumber>>>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_MultiProcessElementsType {
    type Root = Icc4;
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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/multi_process_elements_type/seq/0".to_string() }));
        }
        *self_rc.number_of_input_channels.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.number_of_output_channels.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.number_of_processing_elements.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.process_element_positions_table.borrow_mut() = Vec::new();
        let l_process_element_positions_table = *self_rc.number_of_processing_elements();
        for _i in 0..l_process_element_positions_table {
            let t = Self::read_into::<_, Icc4_PositionNumber>(&*_io, Some(self_rc._root.clone()), None)?.into();
            self_rc.process_element_positions_table.borrow_mut().push(t);
        }
        *self_rc.data.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_MultiProcessElementsType {
}
impl Icc4_TagTable_TagDefinition_MultiProcessElementsType {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_MultiProcessElementsType {
    pub fn number_of_input_channels(&self) -> Ref<'_, u16> {
        self.number_of_input_channels.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_MultiProcessElementsType {
    pub fn number_of_output_channels(&self) -> Ref<'_, u16> {
        self.number_of_output_channels.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_MultiProcessElementsType {
    pub fn number_of_processing_elements(&self) -> Ref<'_, u32> {
        self.number_of_processing_elements.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_MultiProcessElementsType {
    pub fn process_element_positions_table(&self) -> Ref<'_, Vec<OptRc<Icc4_PositionNumber>>> {
        self.process_element_positions_table.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_MultiProcessElementsType {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_MultiProcessElementsType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_NamedColor2Tag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData {
    Icc4_TagTable_TagDefinition_NamedColor2Type(OptRc<Icc4_TagTable_TagDefinition_NamedColor2Type>),
}
impl From<&Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_NamedColor2Type> {
    fn from(v: &Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData::Icc4_TagTable_TagDefinition_NamedColor2Type(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData::Icc4_TagTable_TagDefinition_NamedColor2Type, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_NamedColor2Type>> for Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_NamedColor2Type>) -> Self {
        Self::Icc4_TagTable_TagDefinition_NamedColor2Type(v)
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData::Icc4_TagTable_TagDefinition_NamedColor2Type(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData {
    pub fn vendor_specific_flag(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData::Icc4_TagTable_TagDefinition_NamedColor2Type(x) => x.vendor_specific_flag.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData {
    pub fn count_of_named_colours(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData::Icc4_TagTable_TagDefinition_NamedColor2Type(x) => x.count_of_named_colours.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData {
    pub fn number_of_device_coordinates_for_each_named_colour(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData::Icc4_TagTable_TagDefinition_NamedColor2Type(x) => x.number_of_device_coordinates_for_each_named_colour.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData {
    pub fn prefix_for_each_colour_name(&self) -> Ref<'_, String> {
        match self {
            Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData::Icc4_TagTable_TagDefinition_NamedColor2Type(x) => x.prefix_for_each_colour_name.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData {
    pub fn prefix_for_each_colour_name_padding(&self) -> Ref<'_, Vec<Vec<u8>>> {
        match self {
            Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData::Icc4_TagTable_TagDefinition_NamedColor2Type(x) => x.prefix_for_each_colour_name_padding.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData {
    pub fn suffix_for_each_colour_name(&self) -> Ref<'_, String> {
        match self {
            Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData::Icc4_TagTable_TagDefinition_NamedColor2Type(x) => x.suffix_for_each_colour_name.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData {
    pub fn suffix_for_each_colour_name_padding(&self) -> Ref<'_, Vec<Vec<u8>>> {
        match self {
            Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData::Icc4_TagTable_TagDefinition_NamedColor2Type(x) => x.suffix_for_each_colour_name_padding.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData {
    pub fn named_colour_definitions(&self) -> Ref<'_, Vec<OptRc<Icc4_TagTable_TagDefinition_NamedColor2Type_NamedColourDefinition>>> {
        match self {
            Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData::Icc4_TagTable_TagDefinition_NamedColor2Type(x) => x.named_colour_definitions.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_NamedColor2Tag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::NamedColor2Type => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_NamedColor2Type>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Tag {
}
impl Icc4_TagTable_TagDefinition_NamedColor2Tag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Tag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_NamedColor2Tag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Tag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_NamedColor2Type {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition_NamedColor2Tag>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    vendor_specific_flag: RefCell<u32>,
    count_of_named_colours: RefCell<u32>,
    number_of_device_coordinates_for_each_named_colour: RefCell<u32>,
    prefix_for_each_colour_name: RefCell<String>,
    prefix_for_each_colour_name_padding: RefCell<Vec<Vec<u8>>>,
    suffix_for_each_colour_name: RefCell<String>,
    suffix_for_each_colour_name_padding: RefCell<Vec<Vec<u8>>>,
    named_colour_definitions: RefCell<Vec<OptRc<Icc4_TagTable_TagDefinition_NamedColor2Type_NamedColourDefinition>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_NamedColor2Type {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition_NamedColor2Tag;

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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/named_color_2_type/seq/0".to_string() }));
        }
        *self_rc.vendor_specific_flag.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.count_of_named_colours.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.number_of_device_coordinates_for_each_named_colour.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.prefix_for_each_colour_name.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?;
        *self_rc.prefix_for_each_colour_name_padding.borrow_mut() = Vec::new();
        let l_prefix_for_each_colour_name_padding = ((32 as i32) - (self_rc.prefix_for_each_colour_name().len() as i32));
        for _i in 0..l_prefix_for_each_colour_name_padding {
            self_rc.prefix_for_each_colour_name_padding.borrow_mut().push(_io.read_bytes(1 as usize)?.into());
            if !(self_rc.prefix_for_each_colour_name_padding()[_i as usize] == vec![0x0u8]) {
                return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/named_color_2_type/seq/5".to_string() }));
            }
        }
        *self_rc.suffix_for_each_colour_name.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?;
        *self_rc.suffix_for_each_colour_name_padding.borrow_mut() = Vec::new();
        let l_suffix_for_each_colour_name_padding = ((32 as i32) - (self_rc.suffix_for_each_colour_name().len() as i32));
        for _i in 0..l_suffix_for_each_colour_name_padding {
            self_rc.suffix_for_each_colour_name_padding.borrow_mut().push(_io.read_bytes(1 as usize)?.into());
            if !(self_rc.suffix_for_each_colour_name_padding()[_i as usize] == vec![0x0u8]) {
                return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/named_color_2_type/seq/7".to_string() }));
            }
        }
        *self_rc.named_colour_definitions.borrow_mut() = Vec::new();
        let l_named_colour_definitions = *self_rc.count_of_named_colours();
        for _i in 0..l_named_colour_definitions {
            let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_NamedColor2Type_NamedColourDefinition>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.named_colour_definitions.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Type {
}
impl Icc4_TagTable_TagDefinition_NamedColor2Type {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Type {
    pub fn vendor_specific_flag(&self) -> Ref<'_, u32> {
        self.vendor_specific_flag.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Type {
    pub fn count_of_named_colours(&self) -> Ref<'_, u32> {
        self.count_of_named_colours.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Type {
    pub fn number_of_device_coordinates_for_each_named_colour(&self) -> Ref<'_, u32> {
        self.number_of_device_coordinates_for_each_named_colour.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Type {
    pub fn prefix_for_each_colour_name(&self) -> Ref<'_, String> {
        self.prefix_for_each_colour_name.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Type {
    pub fn prefix_for_each_colour_name_padding(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.prefix_for_each_colour_name_padding.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Type {
    pub fn suffix_for_each_colour_name(&self) -> Ref<'_, String> {
        self.suffix_for_each_colour_name.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Type {
    pub fn suffix_for_each_colour_name_padding(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.suffix_for_each_colour_name_padding.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Type {
    pub fn named_colour_definitions(&self) -> Ref<'_, Vec<OptRc<Icc4_TagTable_TagDefinition_NamedColor2Type_NamedColourDefinition>>> {
        self.named_colour_definitions.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Type {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_NamedColor2Type_NamedColourDefinition {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition_NamedColor2Type>,
    pub _self: SharedType<Self>,
    root_name: RefCell<String>,
    root_name_padding: RefCell<Vec<Vec<u8>>>,
    pcs_coordinates: RefCell<Vec<u8>>,
    device_coordinates: RefCell<Vec<u16>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_NamedColor2Type_NamedColourDefinition {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition_NamedColor2Type;

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
        *self_rc.root_name.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?;
        *self_rc.root_name_padding.borrow_mut() = Vec::new();
        let l_root_name_padding = ((32 as i32) - (self_rc.root_name().len() as i32));
        for _i in 0..l_root_name_padding {
            self_rc.root_name_padding.borrow_mut().push(_io.read_bytes(1 as usize)?.into());
            if !(self_rc.root_name_padding()[_i as usize] == vec![0x0u8]) {
                return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/named_color_2_type/types/named_colour_definition/seq/1".to_string() }));
            }
        }
        *self_rc.pcs_coordinates.borrow_mut() = _io.read_bytes(6 as usize)?.into();
        if ((*_prc.as_ref().unwrap().number_of_device_coordinates_for_each_named_colour() as u32) > (0 as u32)) {
            *self_rc.device_coordinates.borrow_mut() = Vec::new();
            let l_device_coordinates = *_prc.as_ref().unwrap().number_of_device_coordinates_for_each_named_colour();
            for _i in 0..l_device_coordinates {
                self_rc.device_coordinates.borrow_mut().push(_io.read_u2be()?.into());
            }
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Type_NamedColourDefinition {
}
impl Icc4_TagTable_TagDefinition_NamedColor2Type_NamedColourDefinition {
    pub fn root_name(&self) -> Ref<'_, String> {
        self.root_name.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Type_NamedColourDefinition {
    pub fn root_name_padding(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.root_name_padding.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Type_NamedColourDefinition {
    pub fn pcs_coordinates(&self) -> Ref<'_, Vec<u8>> {
        self.pcs_coordinates.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Type_NamedColourDefinition {
    pub fn device_coordinates(&self) -> Ref<'_, Vec<u16>> {
        self.device_coordinates.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_NamedColor2Type_NamedColourDefinition {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_OutputResponseTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_OutputResponseTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_OutputResponseTag_TagData {
    Icc4_TagTable_TagDefinition_ResponseCurveSet16Type(OptRc<Icc4_TagTable_TagDefinition_ResponseCurveSet16Type>),
}
impl From<&Icc4_TagTable_TagDefinition_OutputResponseTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_ResponseCurveSet16Type> {
    fn from(v: &Icc4_TagTable_TagDefinition_OutputResponseTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_OutputResponseTag_TagData::Icc4_TagTable_TagDefinition_ResponseCurveSet16Type(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_OutputResponseTag_TagData::Icc4_TagTable_TagDefinition_ResponseCurveSet16Type, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ResponseCurveSet16Type>> for Icc4_TagTable_TagDefinition_OutputResponseTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ResponseCurveSet16Type>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ResponseCurveSet16Type(v)
    }
}
impl Icc4_TagTable_TagDefinition_OutputResponseTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_OutputResponseTag_TagData::Icc4_TagTable_TagDefinition_ResponseCurveSet16Type(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_OutputResponseTag_TagData {
    pub fn number_of_channels(&self) -> Ref<'_, u16> {
        match self {
            Icc4_TagTable_TagDefinition_OutputResponseTag_TagData::Icc4_TagTable_TagDefinition_ResponseCurveSet16Type(x) => x.number_of_channels.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_OutputResponseTag_TagData {
    pub fn count_of_measurement_types(&self) -> Ref<'_, u16> {
        match self {
            Icc4_TagTable_TagDefinition_OutputResponseTag_TagData::Icc4_TagTable_TagDefinition_ResponseCurveSet16Type(x) => x.count_of_measurement_types.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_OutputResponseTag_TagData {
    pub fn response_curve_structure_offsets(&self) -> Ref<'_, Vec<u32>> {
        match self {
            Icc4_TagTable_TagDefinition_OutputResponseTag_TagData::Icc4_TagTable_TagDefinition_ResponseCurveSet16Type(x) => x.response_curve_structure_offsets.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_OutputResponseTag_TagData {
    pub fn response_curve_structures(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_OutputResponseTag_TagData::Icc4_TagTable_TagDefinition_ResponseCurveSet16Type(x) => x.response_curve_structures.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_OutputResponseTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::ResponseCurveSet16Type => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_ResponseCurveSet16Type>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_OutputResponseTag {
}
impl Icc4_TagTable_TagDefinition_OutputResponseTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_OutputResponseTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_OutputResponseTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_OutputResponseTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ParametricCurveType {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    function_type: RefCell<Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions>,
    reserved_2: RefCell<Vec<u8>>,
    parameters: RefCell<Option<Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters {
    Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996(OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996>),
    Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663(OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663>),
    Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC(OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC>),
    Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621(OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621>),
    Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsXToPowerOfG(OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsXToPowerOfG>),
}
impl From<&Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters> for OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996> {
    fn from(v: &Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters) -> Self {
        if let Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters::Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters::Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996>> for Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters> for OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663> {
    fn from(v: &Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters) -> Self {
        if let Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters::Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters::Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663>> for Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters> for OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC> {
    fn from(v: &Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters) -> Self {
        if let Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters::Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters::Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC>> for Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters> for OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621> {
    fn from(v: &Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters) -> Self {
        if let Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters::Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters::Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621>> for Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters> for OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsXToPowerOfG> {
    fn from(v: &Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters) -> Self {
        if let Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters::Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsXToPowerOfG(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters::Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsXToPowerOfG, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsXToPowerOfG>> for Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsXToPowerOfG>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsXToPowerOfG(v)
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_ParametricCurveType {
    type Root = Icc4;
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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/parametric_curve_type/seq/0".to_string() }));
        }
        *self_rc.function_type.borrow_mut() = (_io.read_u2be()? as i64).try_into()?;
        *self_rc.reserved_2.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.reserved_2() == vec![0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/parametric_curve_type/seq/2".to_string() }));
        }
        match *self_rc.function_type() {
            Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions::Cie1221996 => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.parameters.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions::Iec6196621 => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.parameters.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions::Iec619663 => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.parameters.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions::YEqualsObAxPlusBCbToPowerOfGPlusC => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.parameters.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions::YEqualsXToPowerOfG => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsXToPowerOfG>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.parameters.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType {
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType {
    pub fn function_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions> {
        self.function_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType {
    pub fn reserved_2(&self) -> Ref<'_, Vec<u8>> {
        self.reserved_2.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType {
    pub fn parameters(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_ParametricCurveType_Parameters>> {
        self.parameters.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions {
    YEqualsXToPowerOfG,
    Cie1221996,
    Iec619663,
    Iec6196621,
    YEqualsObAxPlusBCbToPowerOfGPlusC,
    Unknown(i64),
}

impl TryFrom<i64> for Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions> {
        match flag {
            0 => Ok(Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions::YEqualsXToPowerOfG),
            1 => Ok(Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions::Cie1221996),
            2 => Ok(Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions::Iec619663),
            3 => Ok(Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions::Iec6196621),
            4 => Ok(Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions::YEqualsObAxPlusBCbToPowerOfGPlusC),
            _ => Ok(Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions::Unknown(flag)),
        }
    }
}

impl From<&Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions> for i64 {
    fn from(v: &Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions) -> Self {
        match *v {
            Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions::YEqualsXToPowerOfG => 0,
            Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions::Cie1221996 => 1,
            Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions::Iec619663 => 2,
            Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions::Iec6196621 => 3,
            Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions::YEqualsObAxPlusBCbToPowerOfGPlusC => 4,
            Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions::Unknown(v) => v
        }
    }
}

impl Default for Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions {
    fn default() -> Self { Icc4_TagTable_TagDefinition_ParametricCurveType_ParametricCurveTypeFunctions::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996 {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition_ParametricCurveType>,
    pub _self: SharedType<Self>,
    g: RefCell<i32>,
    a: RefCell<i32>,
    b: RefCell<i32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996 {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition_ParametricCurveType;

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
        *self_rc.g.borrow_mut() = _io.read_s4be()?.into();
        *self_rc.a.borrow_mut() = _io.read_s4be()?.into();
        *self_rc.b.borrow_mut() = _io.read_s4be()?.into();
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996 {
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996 {
    pub fn g(&self) -> Ref<'_, i32> {
        self.g.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996 {
    pub fn a(&self) -> Ref<'_, i32> {
        self.a.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996 {
    pub fn b(&self) -> Ref<'_, i32> {
        self.b.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsCie1221996 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621 {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition_ParametricCurveType>,
    pub _self: SharedType<Self>,
    g: RefCell<i32>,
    a: RefCell<i32>,
    b: RefCell<i32>,
    c: RefCell<i32>,
    d: RefCell<i32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621 {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition_ParametricCurveType;

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
        *self_rc.g.borrow_mut() = _io.read_s4be()?.into();
        *self_rc.a.borrow_mut() = _io.read_s4be()?.into();
        *self_rc.b.borrow_mut() = _io.read_s4be()?.into();
        *self_rc.c.borrow_mut() = _io.read_s4be()?.into();
        *self_rc.d.borrow_mut() = _io.read_s4be()?.into();
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621 {
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621 {
    pub fn g(&self) -> Ref<'_, i32> {
        self.g.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621 {
    pub fn a(&self) -> Ref<'_, i32> {
        self.a.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621 {
    pub fn b(&self) -> Ref<'_, i32> {
        self.b.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621 {
    pub fn c(&self) -> Ref<'_, i32> {
        self.c.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621 {
    pub fn d(&self) -> Ref<'_, i32> {
        self.d.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec6196621 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663 {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition_ParametricCurveType>,
    pub _self: SharedType<Self>,
    g: RefCell<i32>,
    a: RefCell<i32>,
    b: RefCell<i32>,
    c: RefCell<i32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663 {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition_ParametricCurveType;

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
        *self_rc.g.borrow_mut() = _io.read_s4be()?.into();
        *self_rc.a.borrow_mut() = _io.read_s4be()?.into();
        *self_rc.b.borrow_mut() = _io.read_s4be()?.into();
        *self_rc.c.borrow_mut() = _io.read_s4be()?.into();
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663 {
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663 {
    pub fn g(&self) -> Ref<'_, i32> {
        self.g.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663 {
    pub fn a(&self) -> Ref<'_, i32> {
        self.a.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663 {
    pub fn b(&self) -> Ref<'_, i32> {
        self.b.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663 {
    pub fn c(&self) -> Ref<'_, i32> {
        self.c.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsIec619663 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition_ParametricCurveType>,
    pub _self: SharedType<Self>,
    g: RefCell<i32>,
    a: RefCell<i32>,
    b: RefCell<i32>,
    c: RefCell<i32>,
    d: RefCell<i32>,
    e: RefCell<i32>,
    f: RefCell<i32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition_ParametricCurveType;

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
        *self_rc.g.borrow_mut() = _io.read_s4be()?.into();
        *self_rc.a.borrow_mut() = _io.read_s4be()?.into();
        *self_rc.b.borrow_mut() = _io.read_s4be()?.into();
        *self_rc.c.borrow_mut() = _io.read_s4be()?.into();
        *self_rc.d.borrow_mut() = _io.read_s4be()?.into();
        *self_rc.e.borrow_mut() = _io.read_s4be()?.into();
        *self_rc.f.borrow_mut() = _io.read_s4be()?.into();
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC {
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC {
    pub fn g(&self) -> Ref<'_, i32> {
        self.g.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC {
    pub fn a(&self) -> Ref<'_, i32> {
        self.a.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC {
    pub fn b(&self) -> Ref<'_, i32> {
        self.b.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC {
    pub fn c(&self) -> Ref<'_, i32> {
        self.c.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC {
    pub fn d(&self) -> Ref<'_, i32> {
        self.d.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC {
    pub fn e(&self) -> Ref<'_, i32> {
        self.e.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC {
    pub fn f(&self) -> Ref<'_, i32> {
        self.f.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsObAxPlusBCbToPowerOfGPlusC {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsXToPowerOfG {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition_ParametricCurveType>,
    pub _self: SharedType<Self>,
    g: RefCell<i32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsXToPowerOfG {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition_ParametricCurveType;

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
        *self_rc.g.borrow_mut() = _io.read_s4be()?.into();
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsXToPowerOfG {
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsXToPowerOfG {
    pub fn g(&self) -> Ref<'_, i32> {
        self.g.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ParametricCurveType_ParamsYEqualsXToPowerOfG {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag_TagData {
    Icc4_TagTable_TagDefinition_SignatureType(OptRc<Icc4_TagTable_TagDefinition_SignatureType>),
}
impl From<&Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_SignatureType> {
    fn from(v: &Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag_TagData::Icc4_TagTable_TagDefinition_SignatureType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag_TagData::Icc4_TagTable_TagDefinition_SignatureType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_SignatureType>> for Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_SignatureType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_SignatureType(v)
    }
}
impl Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag_TagData::Icc4_TagTable_TagDefinition_SignatureType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag_TagData {
    pub fn signature(&self) -> Ref<'_, String> {
        match self {
            Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag_TagData::Icc4_TagTable_TagDefinition_SignatureType(x) => x.signature.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::SignatureType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_SignatureType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag {
}
impl Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_PerceptualRenderingIntentGamutTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_Preview0Tag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_Preview0Tag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_Preview0Tag_TagData {
    Icc4_TagTable_TagDefinition_LutAToBType(OptRc<Icc4_TagTable_TagDefinition_LutAToBType>),
    Icc4_TagTable_TagDefinition_LutBToAType(OptRc<Icc4_TagTable_TagDefinition_LutBToAType>),
    Icc4_TagTable_TagDefinition_Lut8Type(OptRc<Icc4_TagTable_TagDefinition_Lut8Type>),
    Icc4_TagTable_TagDefinition_Lut16Type(OptRc<Icc4_TagTable_TagDefinition_Lut16Type>),
}
impl From<&Icc4_TagTable_TagDefinition_Preview0Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_LutAToBType> {
    fn from(v: &Icc4_TagTable_TagDefinition_Preview0Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_Preview0Tag_TagData::Icc4_TagTable_TagDefinition_LutAToBType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_Preview0Tag_TagData::Icc4_TagTable_TagDefinition_LutAToBType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_LutAToBType>> for Icc4_TagTable_TagDefinition_Preview0Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_LutAToBType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_LutAToBType(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_Preview0Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_LutBToAType> {
    fn from(v: &Icc4_TagTable_TagDefinition_Preview0Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_Preview0Tag_TagData::Icc4_TagTable_TagDefinition_LutBToAType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_Preview0Tag_TagData::Icc4_TagTable_TagDefinition_LutBToAType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_LutBToAType>> for Icc4_TagTable_TagDefinition_Preview0Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_LutBToAType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_LutBToAType(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_Preview0Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_Lut8Type> {
    fn from(v: &Icc4_TagTable_TagDefinition_Preview0Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_Preview0Tag_TagData::Icc4_TagTable_TagDefinition_Lut8Type(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_Preview0Tag_TagData::Icc4_TagTable_TagDefinition_Lut8Type, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_Lut8Type>> for Icc4_TagTable_TagDefinition_Preview0Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_Lut8Type>) -> Self {
        Self::Icc4_TagTable_TagDefinition_Lut8Type(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_Preview0Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_Lut16Type> {
    fn from(v: &Icc4_TagTable_TagDefinition_Preview0Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_Preview0Tag_TagData::Icc4_TagTable_TagDefinition_Lut16Type(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_Preview0Tag_TagData::Icc4_TagTable_TagDefinition_Lut16Type, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_Lut16Type>> for Icc4_TagTable_TagDefinition_Preview0Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_Lut16Type>) -> Self {
        Self::Icc4_TagTable_TagDefinition_Lut16Type(v)
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_Preview0Tag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionAToBTableType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_LutAToBType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionBToATableType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_LutBToAType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionTableWithOneBytePrecisionType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_Lut8Type>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionTableWithTwoBytePrecisionType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_Lut16Type>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_Preview0Tag {
}
impl Icc4_TagTable_TagDefinition_Preview0Tag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Preview0Tag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_Preview0Tag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Preview0Tag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_Preview1Tag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_Preview1Tag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_Preview1Tag_TagData {
    Icc4_TagTable_TagDefinition_LutBToAType(OptRc<Icc4_TagTable_TagDefinition_LutBToAType>),
    Icc4_TagTable_TagDefinition_Lut8Type(OptRc<Icc4_TagTable_TagDefinition_Lut8Type>),
    Icc4_TagTable_TagDefinition_Lut16Type(OptRc<Icc4_TagTable_TagDefinition_Lut16Type>),
}
impl From<&Icc4_TagTable_TagDefinition_Preview1Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_LutBToAType> {
    fn from(v: &Icc4_TagTable_TagDefinition_Preview1Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_Preview1Tag_TagData::Icc4_TagTable_TagDefinition_LutBToAType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_Preview1Tag_TagData::Icc4_TagTable_TagDefinition_LutBToAType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_LutBToAType>> for Icc4_TagTable_TagDefinition_Preview1Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_LutBToAType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_LutBToAType(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_Preview1Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_Lut8Type> {
    fn from(v: &Icc4_TagTable_TagDefinition_Preview1Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_Preview1Tag_TagData::Icc4_TagTable_TagDefinition_Lut8Type(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_Preview1Tag_TagData::Icc4_TagTable_TagDefinition_Lut8Type, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_Lut8Type>> for Icc4_TagTable_TagDefinition_Preview1Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_Lut8Type>) -> Self {
        Self::Icc4_TagTable_TagDefinition_Lut8Type(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_Preview1Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_Lut16Type> {
    fn from(v: &Icc4_TagTable_TagDefinition_Preview1Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_Preview1Tag_TagData::Icc4_TagTable_TagDefinition_Lut16Type(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_Preview1Tag_TagData::Icc4_TagTable_TagDefinition_Lut16Type, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_Lut16Type>> for Icc4_TagTable_TagDefinition_Preview1Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_Lut16Type>) -> Self {
        Self::Icc4_TagTable_TagDefinition_Lut16Type(v)
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_Preview1Tag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionBToATableType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_LutBToAType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionTableWithOneBytePrecisionType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_Lut8Type>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionTableWithTwoBytePrecisionType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_Lut16Type>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_Preview1Tag {
}
impl Icc4_TagTable_TagDefinition_Preview1Tag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Preview1Tag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_Preview1Tag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Preview1Tag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_Preview2Tag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_Preview2Tag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_Preview2Tag_TagData {
    Icc4_TagTable_TagDefinition_LutBToAType(OptRc<Icc4_TagTable_TagDefinition_LutBToAType>),
    Icc4_TagTable_TagDefinition_Lut8Type(OptRc<Icc4_TagTable_TagDefinition_Lut8Type>),
    Icc4_TagTable_TagDefinition_Lut16Type(OptRc<Icc4_TagTable_TagDefinition_Lut16Type>),
}
impl From<&Icc4_TagTable_TagDefinition_Preview2Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_LutBToAType> {
    fn from(v: &Icc4_TagTable_TagDefinition_Preview2Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_Preview2Tag_TagData::Icc4_TagTable_TagDefinition_LutBToAType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_Preview2Tag_TagData::Icc4_TagTable_TagDefinition_LutBToAType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_LutBToAType>> for Icc4_TagTable_TagDefinition_Preview2Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_LutBToAType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_LutBToAType(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_Preview2Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_Lut8Type> {
    fn from(v: &Icc4_TagTable_TagDefinition_Preview2Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_Preview2Tag_TagData::Icc4_TagTable_TagDefinition_Lut8Type(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_Preview2Tag_TagData::Icc4_TagTable_TagDefinition_Lut8Type, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_Lut8Type>> for Icc4_TagTable_TagDefinition_Preview2Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_Lut8Type>) -> Self {
        Self::Icc4_TagTable_TagDefinition_Lut8Type(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_Preview2Tag_TagData> for OptRc<Icc4_TagTable_TagDefinition_Lut16Type> {
    fn from(v: &Icc4_TagTable_TagDefinition_Preview2Tag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_Preview2Tag_TagData::Icc4_TagTable_TagDefinition_Lut16Type(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_Preview2Tag_TagData::Icc4_TagTable_TagDefinition_Lut16Type, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_Lut16Type>> for Icc4_TagTable_TagDefinition_Preview2Tag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_Lut16Type>) -> Self {
        Self::Icc4_TagTable_TagDefinition_Lut16Type(v)
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_Preview2Tag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionBToATableType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_LutBToAType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionTableWithOneBytePrecisionType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_Lut8Type>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiFunctionTableWithTwoBytePrecisionType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_Lut16Type>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_Preview2Tag {
}
impl Icc4_TagTable_TagDefinition_Preview2Tag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Preview2Tag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_Preview2Tag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_Preview2Tag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ProfileDescriptionTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_ProfileDescriptionTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_ProfileDescriptionTag_TagData {
    Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType>),
}
impl From<&Icc4_TagTable_TagDefinition_ProfileDescriptionTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType> {
    fn from(v: &Icc4_TagTable_TagDefinition_ProfileDescriptionTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_ProfileDescriptionTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_ProfileDescriptionTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType>> for Icc4_TagTable_TagDefinition_ProfileDescriptionTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(v)
    }
}
impl Icc4_TagTable_TagDefinition_ProfileDescriptionTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_ProfileDescriptionTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ProfileDescriptionTag_TagData {
    pub fn number_of_records(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_ProfileDescriptionTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) => x.number_of_records.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ProfileDescriptionTag_TagData {
    pub fn record_size(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_ProfileDescriptionTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) => x.record_size.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ProfileDescriptionTag_TagData {
    pub fn records(&self) -> Ref<'_, Vec<OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record>>> {
        match self {
            Icc4_TagTable_TagDefinition_ProfileDescriptionTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) => x.records.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_ProfileDescriptionTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiLocalizedUnicodeType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ProfileDescriptionTag {
}
impl Icc4_TagTable_TagDefinition_ProfileDescriptionTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ProfileDescriptionTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_ProfileDescriptionTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ProfileDescriptionTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ProfileSequenceDescType {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition_ProfileSequenceTag>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    number_of_description_structures: RefCell<u32>,
    profile_descriptions: RefCell<Vec<OptRc<Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_ProfileSequenceDescType {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition_ProfileSequenceTag;

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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/profile_sequence_desc_type/seq/0".to_string() }));
        }
        *self_rc.number_of_description_structures.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.profile_descriptions.borrow_mut() = Vec::new();
        let l_profile_descriptions = *self_rc.number_of_description_structures();
        for _i in 0..l_profile_descriptions {
            let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.profile_descriptions.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceDescType {
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceDescType {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceDescType {
    pub fn number_of_description_structures(&self) -> Ref<'_, u32> {
        self.number_of_description_structures.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceDescType {
    pub fn profile_descriptions(&self) -> Ref<'_, Vec<OptRc<Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription>>> {
        self.profile_descriptions.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceDescType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition_ProfileSequenceDescType>,
    pub _self: SharedType<Self>,
    device_manufacturer: RefCell<OptRc<Icc4_DeviceManufacturer>>,
    device_model: RefCell<String>,
    device_attributes: RefCell<OptRc<Icc4_DeviceAttributes>>,
    device_technology: RefCell<OptRc<Icc4_TagTable_TagDefinition_TechnologyTag>>,
    description_of_device_manufacturer: RefCell<OptRc<Icc4_TagTable_TagDefinition_DeviceMfgDescTag>>,
    description_of_device_model: RefCell<OptRc<Icc4_TagTable_TagDefinition_DeviceModelDescTag>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition_ProfileSequenceDescType;

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
        let t = Self::read_into::<_, Icc4_DeviceManufacturer>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.device_manufacturer.borrow_mut() = t;
        *self_rc.device_model.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "ASCII")?;
        let t = Self::read_into::<_, Icc4_DeviceAttributes>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.device_attributes.borrow_mut() = t;
        let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_TechnologyTag>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.device_technology.borrow_mut() = t;
        let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_DeviceMfgDescTag>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.description_of_device_manufacturer.borrow_mut() = t;
        let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_DeviceModelDescTag>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.description_of_device_model.borrow_mut() = t;
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription {
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription {
    pub fn device_manufacturer(&self) -> Ref<'_, OptRc<Icc4_DeviceManufacturer>> {
        self.device_manufacturer.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription {
    pub fn device_model(&self) -> Ref<'_, String> {
        self.device_model.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription {
    pub fn device_attributes(&self) -> Ref<'_, OptRc<Icc4_DeviceAttributes>> {
        self.device_attributes.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription {
    pub fn device_technology(&self) -> Ref<'_, OptRc<Icc4_TagTable_TagDefinition_TechnologyTag>> {
        self.device_technology.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription {
    pub fn description_of_device_manufacturer(&self) -> Ref<'_, OptRc<Icc4_TagTable_TagDefinition_DeviceMfgDescTag>> {
        self.description_of_device_manufacturer.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription {
    pub fn description_of_device_model(&self) -> Ref<'_, OptRc<Icc4_TagTable_TagDefinition_DeviceModelDescTag>> {
        self.description_of_device_model.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag_TagData {
    Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType(OptRc<Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType>),
}
impl From<&Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType> {
    fn from(v: &Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag_TagData::Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag_TagData::Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType>> for Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType(v)
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag_TagData::Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag_TagData {
    pub fn number_of_structures(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag_TagData::Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType(x) => x.number_of_structures.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag_TagData {
    pub fn positions_table(&self) -> Ref<'_, Vec<OptRc<Icc4_PositionNumber>>> {
        match self {
            Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag_TagData::Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType(x) => x.positions_table.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag_TagData {
    pub fn profile_identifiers(&self) -> Ref<'_, Vec<OptRc<Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType_ProfileIdentifier>>> {
        match self {
            Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag_TagData::Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType(x) => x.profile_identifiers.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::ProfileSequenceIdentifierType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag {
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    number_of_structures: RefCell<u32>,
    positions_table: RefCell<Vec<OptRc<Icc4_PositionNumber>>>,
    profile_identifiers: RefCell<Vec<OptRc<Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType_ProfileIdentifier>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierTag;

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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/profile_sequence_identifier_type/seq/0".to_string() }));
        }
        *self_rc.number_of_structures.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.positions_table.borrow_mut() = Vec::new();
        let l_positions_table = *self_rc.number_of_structures();
        for _i in 0..l_positions_table {
            let t = Self::read_into::<_, Icc4_PositionNumber>(&*_io, Some(self_rc._root.clone()), None)?.into();
            self_rc.positions_table.borrow_mut().push(t);
        }
        *self_rc.profile_identifiers.borrow_mut() = Vec::new();
        let l_profile_identifiers = *self_rc.number_of_structures();
        for _i in 0..l_profile_identifiers {
            let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType_ProfileIdentifier>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.profile_identifiers.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType {
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType {
    pub fn number_of_structures(&self) -> Ref<'_, u32> {
        self.number_of_structures.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType {
    pub fn positions_table(&self) -> Ref<'_, Vec<OptRc<Icc4_PositionNumber>>> {
        self.positions_table.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType {
    pub fn profile_identifiers(&self) -> Ref<'_, Vec<OptRc<Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType_ProfileIdentifier>>> {
        self.profile_identifiers.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType_ProfileIdentifier {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType>,
    pub _self: SharedType<Self>,
    profile_id: RefCell<Vec<u8>>,
    profile_description: RefCell<OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType_ProfileIdentifier {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType;

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
        *self_rc.profile_id.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.profile_description.borrow_mut() = t;
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType_ProfileIdentifier {
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType_ProfileIdentifier {
    pub fn profile_id(&self) -> Ref<'_, Vec<u8>> {
        self.profile_id.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType_ProfileIdentifier {
    pub fn profile_description(&self) -> Ref<'_, OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType>> {
        self.profile_description.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceIdentifierType_ProfileIdentifier {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ProfileSequenceTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_ProfileSequenceTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_ProfileSequenceTag_TagData {
    Icc4_TagTable_TagDefinition_ProfileSequenceDescType(OptRc<Icc4_TagTable_TagDefinition_ProfileSequenceDescType>),
}
impl From<&Icc4_TagTable_TagDefinition_ProfileSequenceTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_ProfileSequenceDescType> {
    fn from(v: &Icc4_TagTable_TagDefinition_ProfileSequenceTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_ProfileSequenceTag_TagData::Icc4_TagTable_TagDefinition_ProfileSequenceDescType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_ProfileSequenceTag_TagData::Icc4_TagTable_TagDefinition_ProfileSequenceDescType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ProfileSequenceDescType>> for Icc4_TagTable_TagDefinition_ProfileSequenceTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ProfileSequenceDescType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ProfileSequenceDescType(v)
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_ProfileSequenceTag_TagData::Icc4_TagTable_TagDefinition_ProfileSequenceDescType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceTag_TagData {
    pub fn number_of_description_structures(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_ProfileSequenceTag_TagData::Icc4_TagTable_TagDefinition_ProfileSequenceDescType(x) => x.number_of_description_structures.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceTag_TagData {
    pub fn profile_descriptions(&self) -> Ref<'_, Vec<OptRc<Icc4_TagTable_TagDefinition_ProfileSequenceDescType_ProfileDescription>>> {
        match self {
            Icc4_TagTable_TagDefinition_ProfileSequenceTag_TagData::Icc4_TagTable_TagDefinition_ProfileSequenceDescType(x) => x.profile_descriptions.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_ProfileSequenceTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::ProfileSequenceDescType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_ProfileSequenceDescType>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceTag {
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_ProfileSequenceTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ProfileSequenceTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_RedMatrixColumnTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_RedMatrixColumnTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_RedMatrixColumnTag_TagData {
    Icc4_TagTable_TagDefinition_XyzType(OptRc<Icc4_TagTable_TagDefinition_XyzType>),
}
impl From<&Icc4_TagTable_TagDefinition_RedMatrixColumnTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_XyzType> {
    fn from(v: &Icc4_TagTable_TagDefinition_RedMatrixColumnTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_RedMatrixColumnTag_TagData::Icc4_TagTable_TagDefinition_XyzType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_RedMatrixColumnTag_TagData::Icc4_TagTable_TagDefinition_XyzType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_XyzType>> for Icc4_TagTable_TagDefinition_RedMatrixColumnTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_XyzType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_XyzType(v)
    }
}
impl Icc4_TagTable_TagDefinition_RedMatrixColumnTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_RedMatrixColumnTag_TagData::Icc4_TagTable_TagDefinition_XyzType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_RedMatrixColumnTag_TagData {
    pub fn values(&self) -> Ref<'_, Vec<OptRc<Icc4_XyzNumber>>> {
        match self {
            Icc4_TagTable_TagDefinition_RedMatrixColumnTag_TagData::Icc4_TagTable_TagDefinition_XyzType(x) => x.values.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_RedMatrixColumnTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::XyzType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_XyzType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_RedMatrixColumnTag {
}
impl Icc4_TagTable_TagDefinition_RedMatrixColumnTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_RedMatrixColumnTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_RedMatrixColumnTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_RedMatrixColumnTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_RedTrcTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_RedTrcTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_RedTrcTag_TagData {
    Icc4_TagTable_TagDefinition_CurveType(OptRc<Icc4_TagTable_TagDefinition_CurveType>),
    Icc4_TagTable_TagDefinition_ParametricCurveType(OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType>),
}
impl From<&Icc4_TagTable_TagDefinition_RedTrcTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_CurveType> {
    fn from(v: &Icc4_TagTable_TagDefinition_RedTrcTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_RedTrcTag_TagData::Icc4_TagTable_TagDefinition_CurveType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_RedTrcTag_TagData::Icc4_TagTable_TagDefinition_CurveType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_CurveType>> for Icc4_TagTable_TagDefinition_RedTrcTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_CurveType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_CurveType(v)
    }
}
impl From<&Icc4_TagTable_TagDefinition_RedTrcTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType> {
    fn from(v: &Icc4_TagTable_TagDefinition_RedTrcTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_RedTrcTag_TagData::Icc4_TagTable_TagDefinition_ParametricCurveType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_RedTrcTag_TagData::Icc4_TagTable_TagDefinition_ParametricCurveType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType>> for Icc4_TagTable_TagDefinition_RedTrcTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ParametricCurveType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ParametricCurveType(v)
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_RedTrcTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::CurveType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_CurveType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            Icc4_TagTable_TagDefinition_TagTypeSignatures::ParametricCurveType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_ParametricCurveType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_RedTrcTag {
}
impl Icc4_TagTable_TagDefinition_RedTrcTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_RedTrcTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_RedTrcTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_RedTrcTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ResponseCurveSet16Type {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition_OutputResponseTag>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    number_of_channels: RefCell<u16>,
    count_of_measurement_types: RefCell<u16>,
    response_curve_structure_offsets: RefCell<Vec<u32>>,
    response_curve_structures: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_ResponseCurveSet16Type {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition_OutputResponseTag;

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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/response_curve_set_16_type/seq/0".to_string() }));
        }
        *self_rc.number_of_channels.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.count_of_measurement_types.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.response_curve_structure_offsets.borrow_mut() = Vec::new();
        let l_response_curve_structure_offsets = *self_rc.count_of_measurement_types();
        for _i in 0..l_response_curve_structure_offsets {
            self_rc.response_curve_structure_offsets.borrow_mut().push(_io.read_u4be()?.into());
        }
        *self_rc.response_curve_structures.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ResponseCurveSet16Type {
}
impl Icc4_TagTable_TagDefinition_ResponseCurveSet16Type {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ResponseCurveSet16Type {
    pub fn number_of_channels(&self) -> Ref<'_, u16> {
        self.number_of_channels.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ResponseCurveSet16Type {
    pub fn count_of_measurement_types(&self) -> Ref<'_, u16> {
        self.count_of_measurement_types.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ResponseCurveSet16Type {
    pub fn response_curve_structure_offsets(&self) -> Ref<'_, Vec<u32>> {
        self.response_curve_structure_offsets.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ResponseCurveSet16Type {
    pub fn response_curve_structures(&self) -> Ref<'_, Vec<u8>> {
        self.response_curve_structures.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ResponseCurveSet16Type {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_S15Fixed16ArrayType {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition_ChromaticAdaptationTag>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    values: RefCell<Vec<OptRc<Icc4_S15Fixed16Number>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_S15Fixed16ArrayType {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition_ChromaticAdaptationTag;

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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/s_15_fixed_16_array_type/seq/0".to_string() }));
        }
        *self_rc.values.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Icc4_S15Fixed16Number>(&*_io, Some(self_rc._root.clone()), None)?.into();
                self_rc.values.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_S15Fixed16ArrayType {
}
impl Icc4_TagTable_TagDefinition_S15Fixed16ArrayType {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_S15Fixed16ArrayType {
    pub fn values(&self) -> Ref<'_, Vec<OptRc<Icc4_S15Fixed16Number>>> {
        self.values.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_S15Fixed16ArrayType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag_TagData {
    Icc4_TagTable_TagDefinition_SignatureType(OptRc<Icc4_TagTable_TagDefinition_SignatureType>),
}
impl From<&Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_SignatureType> {
    fn from(v: &Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag_TagData::Icc4_TagTable_TagDefinition_SignatureType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag_TagData::Icc4_TagTable_TagDefinition_SignatureType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_SignatureType>> for Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_SignatureType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_SignatureType(v)
    }
}
impl Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag_TagData::Icc4_TagTable_TagDefinition_SignatureType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag_TagData {
    pub fn signature(&self) -> Ref<'_, String> {
        match self {
            Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag_TagData::Icc4_TagTable_TagDefinition_SignatureType(x) => x.signature.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::SignatureType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_SignatureType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag {
}
impl Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_SaturationRenderingIntentGamutTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_SignatureType {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    signature: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_SignatureType {
    type Root = Icc4;
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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/signature_type/seq/0".to_string() }));
        }
        *self_rc.signature.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "ASCII")?;
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_SignatureType {
}
impl Icc4_TagTable_TagDefinition_SignatureType {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_SignatureType {
    pub fn signature(&self) -> Ref<'_, String> {
        self.signature.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_SignatureType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_TechnologyTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_TechnologyTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_TechnologyTag_TagData {
    Icc4_TagTable_TagDefinition_SignatureType(OptRc<Icc4_TagTable_TagDefinition_SignatureType>),
}
impl From<&Icc4_TagTable_TagDefinition_TechnologyTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_SignatureType> {
    fn from(v: &Icc4_TagTable_TagDefinition_TechnologyTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_TechnologyTag_TagData::Icc4_TagTable_TagDefinition_SignatureType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_TechnologyTag_TagData::Icc4_TagTable_TagDefinition_SignatureType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_SignatureType>> for Icc4_TagTable_TagDefinition_TechnologyTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_SignatureType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_SignatureType(v)
    }
}
impl Icc4_TagTable_TagDefinition_TechnologyTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_TechnologyTag_TagData::Icc4_TagTable_TagDefinition_SignatureType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_TechnologyTag_TagData {
    pub fn signature(&self) -> Ref<'_, String> {
        match self {
            Icc4_TagTable_TagDefinition_TechnologyTag_TagData::Icc4_TagTable_TagDefinition_SignatureType(x) => x.signature.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_TechnologyTag {
    type Root = Icc4;
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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::SignatureType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_SignatureType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_TechnologyTag {
}
impl Icc4_TagTable_TagDefinition_TechnologyTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_TechnologyTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_TechnologyTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_TechnologyTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_TextType {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition_CharTargetTag>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    value: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_TextType {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition_CharTargetTag;

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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/text_type/seq/0".to_string() }));
        }
        *self_rc.value.borrow_mut() = bytes_to_str(&bytes_terminate(&_io.read_bytes_full()?.into(), 0, false).into(), "ASCII")?;
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_TextType {
}
impl Icc4_TagTable_TagDefinition_TextType {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_TextType {
    pub fn value(&self) -> Ref<'_, String> {
        self.value.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_TextType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_U16Fixed16ArrayType {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    values: RefCell<Vec<OptRc<Icc4_U16Fixed16Number>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_U16Fixed16ArrayType {
    type Root = Icc4;
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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/u_16_fixed_16_array_type/seq/0".to_string() }));
        }
        *self_rc.values.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Icc4_U16Fixed16Number>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.values.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_U16Fixed16ArrayType {
}
impl Icc4_TagTable_TagDefinition_U16Fixed16ArrayType {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_U16Fixed16ArrayType {
    pub fn values(&self) -> Ref<'_, Vec<OptRc<Icc4_U16Fixed16Number>>> {
        self.values.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_U16Fixed16ArrayType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_UInt16ArrayType {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    values: RefCell<Vec<u16>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_UInt16ArrayType {
    type Root = Icc4;
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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/u_int_16_array_type/seq/0".to_string() }));
        }
        *self_rc.values.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.values.borrow_mut().push(_io.read_u2be()?.into());
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_UInt16ArrayType {
}
impl Icc4_TagTable_TagDefinition_UInt16ArrayType {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_UInt16ArrayType {
    pub fn values(&self) -> Ref<'_, Vec<u16>> {
        self.values.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_UInt16ArrayType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_UInt32ArrayType {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    values: RefCell<Vec<u32>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_UInt32ArrayType {
    type Root = Icc4;
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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/u_int_32_array_type/seq/0".to_string() }));
        }
        *self_rc.values.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.values.borrow_mut().push(_io.read_u4be()?.into());
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_UInt32ArrayType {
}
impl Icc4_TagTable_TagDefinition_UInt32ArrayType {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_UInt32ArrayType {
    pub fn values(&self) -> Ref<'_, Vec<u32>> {
        self.values.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_UInt32ArrayType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_UInt64ArrayType {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    values: RefCell<Vec<u64>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_UInt64ArrayType {
    type Root = Icc4;
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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/u_int_64_array_type/seq/0".to_string() }));
        }
        *self_rc.values.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.values.borrow_mut().push(_io.read_u8be()?.into());
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_UInt64ArrayType {
}
impl Icc4_TagTable_TagDefinition_UInt64ArrayType {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_UInt64ArrayType {
    pub fn values(&self) -> Ref<'_, Vec<u64>> {
        self.values.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_UInt64ArrayType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_UInt8ArrayType {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    values: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_UInt8ArrayType {
    type Root = Icc4;
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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/u_int_8_array_type/seq/0".to_string() }));
        }
        *self_rc.values.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.values.borrow_mut().push(_io.read_u1()?.into());
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_UInt8ArrayType {
}
impl Icc4_TagTable_TagDefinition_UInt8ArrayType {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_UInt8ArrayType {
    pub fn values(&self) -> Ref<'_, Vec<u8>> {
        self.values.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_UInt8ArrayType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ViewingCondDescTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_ViewingCondDescTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_ViewingCondDescTag_TagData {
    Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType>),
}
impl From<&Icc4_TagTable_TagDefinition_ViewingCondDescTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType> {
    fn from(v: &Icc4_TagTable_TagDefinition_ViewingCondDescTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_ViewingCondDescTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_ViewingCondDescTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType>> for Icc4_TagTable_TagDefinition_ViewingCondDescTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(v)
    }
}
impl Icc4_TagTable_TagDefinition_ViewingCondDescTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_ViewingCondDescTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ViewingCondDescTag_TagData {
    pub fn number_of_records(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_ViewingCondDescTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) => x.number_of_records.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ViewingCondDescTag_TagData {
    pub fn record_size(&self) -> Ref<'_, u32> {
        match self {
            Icc4_TagTable_TagDefinition_ViewingCondDescTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) => x.record_size.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ViewingCondDescTag_TagData {
    pub fn records(&self) -> Ref<'_, Vec<OptRc<Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType_Record>>> {
        match self {
            Icc4_TagTable_TagDefinition_ViewingCondDescTag_TagData::Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType(x) => x.records.borrow(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_ViewingCondDescTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::MultiLocalizedUnicodeType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_MultiLocalizedUnicodeType>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ViewingCondDescTag {
}
impl Icc4_TagTable_TagDefinition_ViewingCondDescTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ViewingCondDescTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_ViewingCondDescTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ViewingCondDescTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ViewingConditionsTag {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition>,
    pub _self: SharedType<Self>,
    tag_type: RefCell<Icc4_TagTable_TagDefinition_TagTypeSignatures>,
    tag_data: RefCell<Option<Icc4_TagTable_TagDefinition_ViewingConditionsTag_TagData>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Icc4_TagTable_TagDefinition_ViewingConditionsTag_TagData {
    Icc4_TagTable_TagDefinition_ViewingConditionsType(OptRc<Icc4_TagTable_TagDefinition_ViewingConditionsType>),
}
impl From<&Icc4_TagTable_TagDefinition_ViewingConditionsTag_TagData> for OptRc<Icc4_TagTable_TagDefinition_ViewingConditionsType> {
    fn from(v: &Icc4_TagTable_TagDefinition_ViewingConditionsTag_TagData) -> Self {
        if let Icc4_TagTable_TagDefinition_ViewingConditionsTag_TagData::Icc4_TagTable_TagDefinition_ViewingConditionsType(x) = v {
            return x.clone();
        }
        panic!("expected Icc4_TagTable_TagDefinition_ViewingConditionsTag_TagData::Icc4_TagTable_TagDefinition_ViewingConditionsType, got {:?}", v)
    }
}
impl From<OptRc<Icc4_TagTable_TagDefinition_ViewingConditionsType>> for Icc4_TagTable_TagDefinition_ViewingConditionsTag_TagData {
    fn from(v: OptRc<Icc4_TagTable_TagDefinition_ViewingConditionsType>) -> Self {
        Self::Icc4_TagTable_TagDefinition_ViewingConditionsType(v)
    }
}
impl Icc4_TagTable_TagDefinition_ViewingConditionsTag_TagData {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Icc4_TagTable_TagDefinition_ViewingConditionsTag_TagData::Icc4_TagTable_TagDefinition_ViewingConditionsType(x) => x.reserved.borrow(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ViewingConditionsTag_TagData {
    pub fn un_normalized_ciexyz_values_for_illuminant(&self) -> OptRc<Icc4_XyzNumber> {
        match self {
            Icc4_TagTable_TagDefinition_ViewingConditionsTag_TagData::Icc4_TagTable_TagDefinition_ViewingConditionsType(x) => x.un_normalized_ciexyz_values_for_illuminant.borrow().clone(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ViewingConditionsTag_TagData {
    pub fn un_normalized_ciexyz_values_for_surround(&self) -> OptRc<Icc4_XyzNumber> {
        match self {
            Icc4_TagTable_TagDefinition_ViewingConditionsTag_TagData::Icc4_TagTable_TagDefinition_ViewingConditionsType(x) => x.un_normalized_ciexyz_values_for_surround.borrow().clone(),
        }
    }
}
impl Icc4_TagTable_TagDefinition_ViewingConditionsTag_TagData {
    pub fn illuminant_type(&self) -> OptRc<Icc4_StandardIlluminantEncoding> {
        match self {
            Icc4_TagTable_TagDefinition_ViewingConditionsTag_TagData::Icc4_TagTable_TagDefinition_ViewingConditionsType(x) => x.illuminant_type.borrow().clone(),
        }
    }
}
impl KStruct for Icc4_TagTable_TagDefinition_ViewingConditionsTag {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition;

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
        *self_rc.tag_type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.tag_type() {
            Icc4_TagTable_TagDefinition_TagTypeSignatures::ViewingConditionsType => {
                let t = Self::read_into::<_, Icc4_TagTable_TagDefinition_ViewingConditionsType>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.tag_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ViewingConditionsTag {
}
impl Icc4_TagTable_TagDefinition_ViewingConditionsTag {
    pub fn tag_type(&self) -> Ref<'_, Icc4_TagTable_TagDefinition_TagTypeSignatures> {
        self.tag_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ViewingConditionsTag {
    pub fn tag_data(&self) -> Ref<'_, Option<Icc4_TagTable_TagDefinition_ViewingConditionsTag_TagData>> {
        self.tag_data.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ViewingConditionsTag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_ViewingConditionsType {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition_ViewingConditionsTag>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    un_normalized_ciexyz_values_for_illuminant: RefCell<OptRc<Icc4_XyzNumber>>,
    un_normalized_ciexyz_values_for_surround: RefCell<OptRc<Icc4_XyzNumber>>,
    illuminant_type: RefCell<OptRc<Icc4_StandardIlluminantEncoding>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_ViewingConditionsType {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition_ViewingConditionsTag;

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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/viewing_conditions_type/seq/0".to_string() }));
        }
        let t = Self::read_into::<_, Icc4_XyzNumber>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.un_normalized_ciexyz_values_for_illuminant.borrow_mut() = t;
        let t = Self::read_into::<_, Icc4_XyzNumber>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.un_normalized_ciexyz_values_for_surround.borrow_mut() = t;
        let t = Self::read_into::<_, Icc4_StandardIlluminantEncoding>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.illuminant_type.borrow_mut() = t;
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_ViewingConditionsType {
}
impl Icc4_TagTable_TagDefinition_ViewingConditionsType {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ViewingConditionsType {
    pub fn un_normalized_ciexyz_values_for_illuminant(&self) -> Ref<'_, OptRc<Icc4_XyzNumber>> {
        self.un_normalized_ciexyz_values_for_illuminant.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ViewingConditionsType {
    pub fn un_normalized_ciexyz_values_for_surround(&self) -> Ref<'_, OptRc<Icc4_XyzNumber>> {
        self.un_normalized_ciexyz_values_for_surround.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ViewingConditionsType {
    pub fn illuminant_type(&self) -> Ref<'_, OptRc<Icc4_StandardIlluminantEncoding>> {
        self.illuminant_type.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_ViewingConditionsType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_TagTable_TagDefinition_XyzType {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    reserved: RefCell<Vec<u8>>,
    values: RefCell<Vec<OptRc<Icc4_XyzNumber>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_TagTable_TagDefinition_XyzType {
    type Root = Icc4;
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
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/tag_table/types/tag_definition/types/xyz_type/seq/0".to_string() }));
        }
        *self_rc.values.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Icc4_XyzNumber>(&*_io, Some(self_rc._root.clone()), None)?.into();
                self_rc.values.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Icc4_TagTable_TagDefinition_XyzType {
}
impl Icc4_TagTable_TagDefinition_XyzType {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_XyzType {
    pub fn values(&self) -> Ref<'_, Vec<OptRc<Icc4_XyzNumber>>> {
        self.values.borrow()
    }
}
impl Icc4_TagTable_TagDefinition_XyzType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_U16Fixed16Number {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<Icc4_TagTable_TagDefinition_U16Fixed16ArrayType>,
    pub _self: SharedType<Self>,
    number: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_U16Fixed16Number {
    type Root = Icc4;
    type Parent = Icc4_TagTable_TagDefinition_U16Fixed16ArrayType;

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
        *self_rc.number.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        Ok(())
    }
}
impl Icc4_U16Fixed16Number {
}
impl Icc4_U16Fixed16Number {
    pub fn number(&self) -> Ref<'_, Vec<u8>> {
        self.number.borrow()
    }
}
impl Icc4_U16Fixed16Number {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_U1Fixed15Number {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    number: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_U1Fixed15Number {
    type Root = Icc4;
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
        *self_rc.number.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        Ok(())
    }
}
impl Icc4_U1Fixed15Number {
}
impl Icc4_U1Fixed15Number {
    pub fn number(&self) -> Ref<'_, Vec<u8>> {
        self.number.borrow()
    }
}
impl Icc4_U1Fixed15Number {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_U8Fixed8Number {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    number: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_U8Fixed8Number {
    type Root = Icc4;
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
        *self_rc.number.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        Ok(())
    }
}
impl Icc4_U8Fixed8Number {
}
impl Icc4_U8Fixed8Number {
    pub fn number(&self) -> Ref<'_, Vec<u8>> {
        self.number.borrow()
    }
}
impl Icc4_U8Fixed8Number {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Icc4_XyzNumber {
    pub _root: SharedType<Icc4>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    x: RefCell<Vec<u8>>,
    y: RefCell<Vec<u8>>,
    z: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Icc4_XyzNumber {
    type Root = Icc4;
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
        *self_rc.x.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        *self_rc.y.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        *self_rc.z.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        Ok(())
    }
}
impl Icc4_XyzNumber {
}
impl Icc4_XyzNumber {
    pub fn x(&self) -> Ref<'_, Vec<u8>> {
        self.x.borrow()
    }
}
impl Icc4_XyzNumber {
    pub fn y(&self) -> Ref<'_, Vec<u8>> {
        self.y.borrow()
    }
}
impl Icc4_XyzNumber {
    pub fn z(&self) -> Ref<'_, Vec<u8>> {
        self.z.borrow()
    }
}
impl Icc4_XyzNumber {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

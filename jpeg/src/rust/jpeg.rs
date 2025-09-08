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
use super::exif::Exif;

/**
 * JPEG File Interchange Format, or JFIF, or, more colloquially known
 * as just "JPEG" or "JPG", is a popular 2D bitmap image file format,
 * offering lossy compression which works reasonably well with
 * photographic images.
 * 
 * Format is organized as a container format, serving multiple
 * "segments", each starting with a magic and a marker. JFIF standard
 * dictates order and mandatory apperance of segments:
 * 
 * * SOI
 * * APP0 (with JFIF magic)
 * * APP0 (with JFXX magic, optional)
 * * everything else
 * * SOS
 * * JPEG-compressed stream
 * * EOI
 */

#[derive(Default, Debug, Clone)]
pub struct Jpeg {
    pub _root: SharedType<Jpeg>,
    pub _parent: SharedType<Jpeg>,
    pub _self: SharedType<Self>,
    segments: RefCell<Vec<OptRc<Jpeg_Segment>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Jpeg {
    type Root = Jpeg;
    type Parent = Jpeg;

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
        *self_rc.segments.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Jpeg_Segment>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.segments.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Jpeg {
}
impl Jpeg {
    pub fn segments(&self) -> Ref<'_, Vec<OptRc<Jpeg_Segment>>> {
        self.segments.borrow()
    }
}
impl Jpeg {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Jpeg_ComponentId {
    Y,
    Cb,
    Cr,
    I,
    Q,
    Unknown(i64),
}

impl TryFrom<i64> for Jpeg_ComponentId {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Jpeg_ComponentId> {
        match flag {
            1 => Ok(Jpeg_ComponentId::Y),
            2 => Ok(Jpeg_ComponentId::Cb),
            3 => Ok(Jpeg_ComponentId::Cr),
            4 => Ok(Jpeg_ComponentId::I),
            5 => Ok(Jpeg_ComponentId::Q),
            _ => Ok(Jpeg_ComponentId::Unknown(flag)),
        }
    }
}

impl From<&Jpeg_ComponentId> for i64 {
    fn from(v: &Jpeg_ComponentId) -> Self {
        match *v {
            Jpeg_ComponentId::Y => 1,
            Jpeg_ComponentId::Cb => 2,
            Jpeg_ComponentId::Cr => 3,
            Jpeg_ComponentId::I => 4,
            Jpeg_ComponentId::Q => 5,
            Jpeg_ComponentId::Unknown(v) => v
        }
    }
}

impl Default for Jpeg_ComponentId {
    fn default() -> Self { Jpeg_ComponentId::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Jpeg_ExifInJpeg {
    pub _root: SharedType<Jpeg>,
    pub _parent: SharedType<Jpeg_SegmentApp1>,
    pub _self: SharedType<Self>,
    extra_zero: RefCell<Vec<u8>>,
    data: RefCell<OptRc<Exif>>,
    _io: RefCell<BytesReader>,
    data_raw: RefCell<Vec<u8>>,
}
impl KStruct for Jpeg_ExifInJpeg {
    type Root = Jpeg;
    type Parent = Jpeg_SegmentApp1;

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
        *self_rc.extra_zero.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.extra_zero() == vec![0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/exif_in_jpeg/seq/0".to_string() }));
        }
        *self_rc.data_raw.borrow_mut() = _io.read_bytes_full()?.into();
        let data_raw = self_rc.data_raw.borrow();
        let _t_data_raw_io = BytesReader::from(data_raw.clone());
        let t = Self::read_into::<BytesReader, Exif>(&_t_data_raw_io, None, None)?.into();
        *self_rc.data.borrow_mut() = t;
        Ok(())
    }
}
impl Jpeg_ExifInJpeg {
}
impl Jpeg_ExifInJpeg {
    pub fn extra_zero(&self) -> Ref<'_, Vec<u8>> {
        self.extra_zero.borrow()
    }
}
impl Jpeg_ExifInJpeg {
    pub fn data(&self) -> Ref<'_, OptRc<Exif>> {
        self.data.borrow()
    }
}
impl Jpeg_ExifInJpeg {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Jpeg_ExifInJpeg {
    pub fn data_raw(&self) -> Ref<'_, Vec<u8>> {
        self.data_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Jpeg_Segment {
    pub _root: SharedType<Jpeg>,
    pub _parent: SharedType<Jpeg>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    marker: RefCell<Jpeg_Segment_MarkerEnum>,
    length: RefCell<u16>,
    data: RefCell<Option<Jpeg_Segment_Data>>,
    image_data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    data_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum Jpeg_Segment_Data {
    Jpeg_SegmentSos(OptRc<Jpeg_SegmentSos>),
    Bytes(Vec<u8>),
    Jpeg_SegmentApp1(OptRc<Jpeg_SegmentApp1>),
    Jpeg_SegmentSof0(OptRc<Jpeg_SegmentSof0>),
    Jpeg_SegmentApp0(OptRc<Jpeg_SegmentApp0>),
}
impl From<&Jpeg_Segment_Data> for OptRc<Jpeg_SegmentSos> {
    fn from(v: &Jpeg_Segment_Data) -> Self {
        if let Jpeg_Segment_Data::Jpeg_SegmentSos(x) = v {
            return x.clone();
        }
        panic!("expected Jpeg_Segment_Data::Jpeg_SegmentSos, got {:?}", v)
    }
}
impl From<OptRc<Jpeg_SegmentSos>> for Jpeg_Segment_Data {
    fn from(v: OptRc<Jpeg_SegmentSos>) -> Self {
        Self::Jpeg_SegmentSos(v)
    }
}
impl From<&Jpeg_Segment_Data> for Vec<u8> {
    fn from(v: &Jpeg_Segment_Data) -> Self {
        if let Jpeg_Segment_Data::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected Jpeg_Segment_Data::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for Jpeg_Segment_Data {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&Jpeg_Segment_Data> for OptRc<Jpeg_SegmentApp1> {
    fn from(v: &Jpeg_Segment_Data) -> Self {
        if let Jpeg_Segment_Data::Jpeg_SegmentApp1(x) = v {
            return x.clone();
        }
        panic!("expected Jpeg_Segment_Data::Jpeg_SegmentApp1, got {:?}", v)
    }
}
impl From<OptRc<Jpeg_SegmentApp1>> for Jpeg_Segment_Data {
    fn from(v: OptRc<Jpeg_SegmentApp1>) -> Self {
        Self::Jpeg_SegmentApp1(v)
    }
}
impl From<&Jpeg_Segment_Data> for OptRc<Jpeg_SegmentSof0> {
    fn from(v: &Jpeg_Segment_Data) -> Self {
        if let Jpeg_Segment_Data::Jpeg_SegmentSof0(x) = v {
            return x.clone();
        }
        panic!("expected Jpeg_Segment_Data::Jpeg_SegmentSof0, got {:?}", v)
    }
}
impl From<OptRc<Jpeg_SegmentSof0>> for Jpeg_Segment_Data {
    fn from(v: OptRc<Jpeg_SegmentSof0>) -> Self {
        Self::Jpeg_SegmentSof0(v)
    }
}
impl From<&Jpeg_Segment_Data> for OptRc<Jpeg_SegmentApp0> {
    fn from(v: &Jpeg_Segment_Data) -> Self {
        if let Jpeg_Segment_Data::Jpeg_SegmentApp0(x) = v {
            return x.clone();
        }
        panic!("expected Jpeg_Segment_Data::Jpeg_SegmentApp0, got {:?}", v)
    }
}
impl From<OptRc<Jpeg_SegmentApp0>> for Jpeg_Segment_Data {
    fn from(v: OptRc<Jpeg_SegmentApp0>) -> Self {
        Self::Jpeg_SegmentApp0(v)
    }
}
impl KStruct for Jpeg_Segment {
    type Root = Jpeg;
    type Parent = Jpeg;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.magic() == vec![0xffu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/segment/seq/0".to_string() }));
        }
        *self_rc.marker.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        if  ((*self_rc.marker() != Jpeg_Segment_MarkerEnum::Soi) && (*self_rc.marker() != Jpeg_Segment_MarkerEnum::Eoi))  {
            *self_rc.length.borrow_mut() = _io.read_u2be()?.into();
        }
        if  ((*self_rc.marker() != Jpeg_Segment_MarkerEnum::Soi) && (*self_rc.marker() != Jpeg_Segment_MarkerEnum::Eoi))  {
            match *self_rc.marker() {
                Jpeg_Segment_MarkerEnum::App0 => {
                    *self_rc.data_raw.borrow_mut() = _io.read_bytes(((*self_rc.length() as u16) - (2 as u16)) as usize)?.into();
                    let data_raw = self_rc.data_raw.borrow();
                    let _t_data_raw_io = BytesReader::from(data_raw.clone());
                    let t = Self::read_into::<BytesReader, Jpeg_SegmentApp0>(&_t_data_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.data.borrow_mut() = Some(t);
                }
                Jpeg_Segment_MarkerEnum::App1 => {
                    *self_rc.data_raw.borrow_mut() = _io.read_bytes(((*self_rc.length() as u16) - (2 as u16)) as usize)?.into();
                    let data_raw = self_rc.data_raw.borrow();
                    let _t_data_raw_io = BytesReader::from(data_raw.clone());
                    let t = Self::read_into::<BytesReader, Jpeg_SegmentApp1>(&_t_data_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.data.borrow_mut() = Some(t);
                }
                Jpeg_Segment_MarkerEnum::Sof0 => {
                    *self_rc.data_raw.borrow_mut() = _io.read_bytes(((*self_rc.length() as u16) - (2 as u16)) as usize)?.into();
                    let data_raw = self_rc.data_raw.borrow();
                    let _t_data_raw_io = BytesReader::from(data_raw.clone());
                    let t = Self::read_into::<BytesReader, Jpeg_SegmentSof0>(&_t_data_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.data.borrow_mut() = Some(t);
                }
                Jpeg_Segment_MarkerEnum::Sos => {
                    *self_rc.data_raw.borrow_mut() = _io.read_bytes(((*self_rc.length() as u16) - (2 as u16)) as usize)?.into();
                    let data_raw = self_rc.data_raw.borrow();
                    let _t_data_raw_io = BytesReader::from(data_raw.clone());
                    let t = Self::read_into::<BytesReader, Jpeg_SegmentSos>(&_t_data_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.data.borrow_mut() = Some(t);
                }
                _ => {
                    *self_rc.data.borrow_mut() = Some(_io.read_bytes(((*self_rc.length() as u16) - (2 as u16)) as usize)?.into());
                }
            }
        }
        if *self_rc.marker() == Jpeg_Segment_MarkerEnum::Sos {
            *self_rc.image_data.borrow_mut() = _io.read_bytes_full()?.into();
        }
        Ok(())
    }
}
impl Jpeg_Segment {
}
impl Jpeg_Segment {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl Jpeg_Segment {
    pub fn marker(&self) -> Ref<'_, Jpeg_Segment_MarkerEnum> {
        self.marker.borrow()
    }
}
impl Jpeg_Segment {
    pub fn length(&self) -> Ref<'_, u16> {
        self.length.borrow()
    }
}
impl Jpeg_Segment {
    pub fn data(&self) -> Ref<'_, Option<Jpeg_Segment_Data>> {
        self.data.borrow()
    }
}
impl Jpeg_Segment {
    pub fn image_data(&self) -> Ref<'_, Vec<u8>> {
        self.image_data.borrow()
    }
}
impl Jpeg_Segment {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Jpeg_Segment {
    pub fn data_raw(&self) -> Ref<'_, Vec<u8>> {
        self.data_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Jpeg_Segment_MarkerEnum {
    Tem,
    Sof0,
    Sof1,
    Sof2,
    Sof3,
    Dht,
    Sof5,
    Sof6,
    Sof7,
    Soi,
    Eoi,
    Sos,
    Dqt,
    Dnl,
    Dri,
    Dhp,
    App0,
    App1,
    App2,
    App3,
    App4,
    App5,
    App6,
    App7,
    App8,
    App9,
    App10,
    App11,
    App12,
    App13,
    App14,
    App15,
    Com,
    Unknown(i64),
}

impl TryFrom<i64> for Jpeg_Segment_MarkerEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Jpeg_Segment_MarkerEnum> {
        match flag {
            1 => Ok(Jpeg_Segment_MarkerEnum::Tem),
            192 => Ok(Jpeg_Segment_MarkerEnum::Sof0),
            193 => Ok(Jpeg_Segment_MarkerEnum::Sof1),
            194 => Ok(Jpeg_Segment_MarkerEnum::Sof2),
            195 => Ok(Jpeg_Segment_MarkerEnum::Sof3),
            196 => Ok(Jpeg_Segment_MarkerEnum::Dht),
            197 => Ok(Jpeg_Segment_MarkerEnum::Sof5),
            198 => Ok(Jpeg_Segment_MarkerEnum::Sof6),
            199 => Ok(Jpeg_Segment_MarkerEnum::Sof7),
            216 => Ok(Jpeg_Segment_MarkerEnum::Soi),
            217 => Ok(Jpeg_Segment_MarkerEnum::Eoi),
            218 => Ok(Jpeg_Segment_MarkerEnum::Sos),
            219 => Ok(Jpeg_Segment_MarkerEnum::Dqt),
            220 => Ok(Jpeg_Segment_MarkerEnum::Dnl),
            221 => Ok(Jpeg_Segment_MarkerEnum::Dri),
            222 => Ok(Jpeg_Segment_MarkerEnum::Dhp),
            224 => Ok(Jpeg_Segment_MarkerEnum::App0),
            225 => Ok(Jpeg_Segment_MarkerEnum::App1),
            226 => Ok(Jpeg_Segment_MarkerEnum::App2),
            227 => Ok(Jpeg_Segment_MarkerEnum::App3),
            228 => Ok(Jpeg_Segment_MarkerEnum::App4),
            229 => Ok(Jpeg_Segment_MarkerEnum::App5),
            230 => Ok(Jpeg_Segment_MarkerEnum::App6),
            231 => Ok(Jpeg_Segment_MarkerEnum::App7),
            232 => Ok(Jpeg_Segment_MarkerEnum::App8),
            233 => Ok(Jpeg_Segment_MarkerEnum::App9),
            234 => Ok(Jpeg_Segment_MarkerEnum::App10),
            235 => Ok(Jpeg_Segment_MarkerEnum::App11),
            236 => Ok(Jpeg_Segment_MarkerEnum::App12),
            237 => Ok(Jpeg_Segment_MarkerEnum::App13),
            238 => Ok(Jpeg_Segment_MarkerEnum::App14),
            239 => Ok(Jpeg_Segment_MarkerEnum::App15),
            254 => Ok(Jpeg_Segment_MarkerEnum::Com),
            _ => Ok(Jpeg_Segment_MarkerEnum::Unknown(flag)),
        }
    }
}

impl From<&Jpeg_Segment_MarkerEnum> for i64 {
    fn from(v: &Jpeg_Segment_MarkerEnum) -> Self {
        match *v {
            Jpeg_Segment_MarkerEnum::Tem => 1,
            Jpeg_Segment_MarkerEnum::Sof0 => 192,
            Jpeg_Segment_MarkerEnum::Sof1 => 193,
            Jpeg_Segment_MarkerEnum::Sof2 => 194,
            Jpeg_Segment_MarkerEnum::Sof3 => 195,
            Jpeg_Segment_MarkerEnum::Dht => 196,
            Jpeg_Segment_MarkerEnum::Sof5 => 197,
            Jpeg_Segment_MarkerEnum::Sof6 => 198,
            Jpeg_Segment_MarkerEnum::Sof7 => 199,
            Jpeg_Segment_MarkerEnum::Soi => 216,
            Jpeg_Segment_MarkerEnum::Eoi => 217,
            Jpeg_Segment_MarkerEnum::Sos => 218,
            Jpeg_Segment_MarkerEnum::Dqt => 219,
            Jpeg_Segment_MarkerEnum::Dnl => 220,
            Jpeg_Segment_MarkerEnum::Dri => 221,
            Jpeg_Segment_MarkerEnum::Dhp => 222,
            Jpeg_Segment_MarkerEnum::App0 => 224,
            Jpeg_Segment_MarkerEnum::App1 => 225,
            Jpeg_Segment_MarkerEnum::App2 => 226,
            Jpeg_Segment_MarkerEnum::App3 => 227,
            Jpeg_Segment_MarkerEnum::App4 => 228,
            Jpeg_Segment_MarkerEnum::App5 => 229,
            Jpeg_Segment_MarkerEnum::App6 => 230,
            Jpeg_Segment_MarkerEnum::App7 => 231,
            Jpeg_Segment_MarkerEnum::App8 => 232,
            Jpeg_Segment_MarkerEnum::App9 => 233,
            Jpeg_Segment_MarkerEnum::App10 => 234,
            Jpeg_Segment_MarkerEnum::App11 => 235,
            Jpeg_Segment_MarkerEnum::App12 => 236,
            Jpeg_Segment_MarkerEnum::App13 => 237,
            Jpeg_Segment_MarkerEnum::App14 => 238,
            Jpeg_Segment_MarkerEnum::App15 => 239,
            Jpeg_Segment_MarkerEnum::Com => 254,
            Jpeg_Segment_MarkerEnum::Unknown(v) => v
        }
    }
}

impl Default for Jpeg_Segment_MarkerEnum {
    fn default() -> Self { Jpeg_Segment_MarkerEnum::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Jpeg_SegmentApp0 {
    pub _root: SharedType<Jpeg>,
    pub _parent: SharedType<Jpeg_Segment>,
    pub _self: SharedType<Self>,
    magic: RefCell<String>,
    version_major: RefCell<u8>,
    version_minor: RefCell<u8>,
    density_units: RefCell<Jpeg_SegmentApp0_DensityUnit>,
    density_x: RefCell<u16>,
    density_y: RefCell<u16>,
    thumbnail_x: RefCell<u8>,
    thumbnail_y: RefCell<u8>,
    thumbnail: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Jpeg_SegmentApp0 {
    type Root = Jpeg;
    type Parent = Jpeg_Segment;

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
        *self_rc.magic.borrow_mut() = bytes_to_str(&_io.read_bytes(5 as usize)?.into(), "ASCII")?;
        *self_rc.version_major.borrow_mut() = _io.read_u1()?.into();
        *self_rc.version_minor.borrow_mut() = _io.read_u1()?.into();
        *self_rc.density_units.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.density_x.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.density_y.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.thumbnail_x.borrow_mut() = _io.read_u1()?.into();
        *self_rc.thumbnail_y.borrow_mut() = _io.read_u1()?.into();
        *self_rc.thumbnail.borrow_mut() = _io.read_bytes(((((*self_rc.thumbnail_x() as u8) * (*self_rc.thumbnail_y() as u8)) as i32) * (3 as i32)) as usize)?.into();
        Ok(())
    }
}
impl Jpeg_SegmentApp0 {
}
impl Jpeg_SegmentApp0 {
    pub fn magic(&self) -> Ref<'_, String> {
        self.magic.borrow()
    }
}
impl Jpeg_SegmentApp0 {
    pub fn version_major(&self) -> Ref<'_, u8> {
        self.version_major.borrow()
    }
}
impl Jpeg_SegmentApp0 {
    pub fn version_minor(&self) -> Ref<'_, u8> {
        self.version_minor.borrow()
    }
}
impl Jpeg_SegmentApp0 {
    pub fn density_units(&self) -> Ref<'_, Jpeg_SegmentApp0_DensityUnit> {
        self.density_units.borrow()
    }
}

/**
 * Horizontal pixel density. Must not be zero.
 */
impl Jpeg_SegmentApp0 {
    pub fn density_x(&self) -> Ref<'_, u16> {
        self.density_x.borrow()
    }
}

/**
 * Vertical pixel density. Must not be zero.
 */
impl Jpeg_SegmentApp0 {
    pub fn density_y(&self) -> Ref<'_, u16> {
        self.density_y.borrow()
    }
}

/**
 * Horizontal pixel count of the following embedded RGB thumbnail. May be zero.
 */
impl Jpeg_SegmentApp0 {
    pub fn thumbnail_x(&self) -> Ref<'_, u8> {
        self.thumbnail_x.borrow()
    }
}

/**
 * Vertical pixel count of the following embedded RGB thumbnail. May be zero.
 */
impl Jpeg_SegmentApp0 {
    pub fn thumbnail_y(&self) -> Ref<'_, u8> {
        self.thumbnail_y.borrow()
    }
}

/**
 * Uncompressed 24 bit RGB (8 bits per color channel) raster thumbnail data in the order R0, G0, B0, ... Rn, Gn, Bn
 */
impl Jpeg_SegmentApp0 {
    pub fn thumbnail(&self) -> Ref<'_, Vec<u8>> {
        self.thumbnail.borrow()
    }
}
impl Jpeg_SegmentApp0 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Jpeg_SegmentApp0_DensityUnit {
    NoUnits,
    PixelsPerInch,
    PixelsPerCm,
    Unknown(i64),
}

impl TryFrom<i64> for Jpeg_SegmentApp0_DensityUnit {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Jpeg_SegmentApp0_DensityUnit> {
        match flag {
            0 => Ok(Jpeg_SegmentApp0_DensityUnit::NoUnits),
            1 => Ok(Jpeg_SegmentApp0_DensityUnit::PixelsPerInch),
            2 => Ok(Jpeg_SegmentApp0_DensityUnit::PixelsPerCm),
            _ => Ok(Jpeg_SegmentApp0_DensityUnit::Unknown(flag)),
        }
    }
}

impl From<&Jpeg_SegmentApp0_DensityUnit> for i64 {
    fn from(v: &Jpeg_SegmentApp0_DensityUnit) -> Self {
        match *v {
            Jpeg_SegmentApp0_DensityUnit::NoUnits => 0,
            Jpeg_SegmentApp0_DensityUnit::PixelsPerInch => 1,
            Jpeg_SegmentApp0_DensityUnit::PixelsPerCm => 2,
            Jpeg_SegmentApp0_DensityUnit::Unknown(v) => v
        }
    }
}

impl Default for Jpeg_SegmentApp0_DensityUnit {
    fn default() -> Self { Jpeg_SegmentApp0_DensityUnit::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Jpeg_SegmentApp1 {
    pub _root: SharedType<Jpeg>,
    pub _parent: SharedType<Jpeg_Segment>,
    pub _self: SharedType<Self>,
    magic: RefCell<String>,
    body: RefCell<Option<Jpeg_SegmentApp1_Body>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Jpeg_SegmentApp1_Body {
    Jpeg_ExifInJpeg(OptRc<Jpeg_ExifInJpeg>),
}
impl From<&Jpeg_SegmentApp1_Body> for OptRc<Jpeg_ExifInJpeg> {
    fn from(v: &Jpeg_SegmentApp1_Body) -> Self {
        if let Jpeg_SegmentApp1_Body::Jpeg_ExifInJpeg(x) = v {
            return x.clone();
        }
        panic!("expected Jpeg_SegmentApp1_Body::Jpeg_ExifInJpeg, got {:?}", v)
    }
}
impl From<OptRc<Jpeg_ExifInJpeg>> for Jpeg_SegmentApp1_Body {
    fn from(v: OptRc<Jpeg_ExifInJpeg>) -> Self {
        Self::Jpeg_ExifInJpeg(v)
    }
}
impl Jpeg_SegmentApp1_Body {
    pub fn extra_zero(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Jpeg_SegmentApp1_Body::Jpeg_ExifInJpeg(x) => x.extra_zero.borrow(),
        }
    }
}
impl Jpeg_SegmentApp1_Body {
    pub fn data(&self) -> OptRc<Exif> {
        match self {
            Jpeg_SegmentApp1_Body::Jpeg_ExifInJpeg(x) => x.data.borrow().clone(),
        }
    }
}
impl KStruct for Jpeg_SegmentApp1 {
    type Root = Jpeg;
    type Parent = Jpeg_Segment;

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
        *self_rc.magic.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?;
        {
            let on = self_rc.magic();
            if *on == "Exif" {
                let t = Self::read_into::<_, Jpeg_ExifInJpeg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
        }
        Ok(())
    }
}
impl Jpeg_SegmentApp1 {
}
impl Jpeg_SegmentApp1 {
    pub fn magic(&self) -> Ref<'_, String> {
        self.magic.borrow()
    }
}
impl Jpeg_SegmentApp1 {
    pub fn body(&self) -> Ref<'_, Option<Jpeg_SegmentApp1_Body>> {
        self.body.borrow()
    }
}
impl Jpeg_SegmentApp1 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Jpeg_SegmentSof0 {
    pub _root: SharedType<Jpeg>,
    pub _parent: SharedType<Jpeg_Segment>,
    pub _self: SharedType<Self>,
    bits_per_sample: RefCell<u8>,
    image_height: RefCell<u16>,
    image_width: RefCell<u16>,
    num_components: RefCell<u8>,
    components: RefCell<Vec<OptRc<Jpeg_SegmentSof0_Component>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Jpeg_SegmentSof0 {
    type Root = Jpeg;
    type Parent = Jpeg_Segment;

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
        *self_rc.bits_per_sample.borrow_mut() = _io.read_u1()?.into();
        *self_rc.image_height.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.image_width.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.num_components.borrow_mut() = _io.read_u1()?.into();
        *self_rc.components.borrow_mut() = Vec::new();
        let l_components = *self_rc.num_components();
        for _i in 0..l_components {
            let t = Self::read_into::<_, Jpeg_SegmentSof0_Component>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.components.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Jpeg_SegmentSof0 {
}
impl Jpeg_SegmentSof0 {
    pub fn bits_per_sample(&self) -> Ref<'_, u8> {
        self.bits_per_sample.borrow()
    }
}
impl Jpeg_SegmentSof0 {
    pub fn image_height(&self) -> Ref<'_, u16> {
        self.image_height.borrow()
    }
}
impl Jpeg_SegmentSof0 {
    pub fn image_width(&self) -> Ref<'_, u16> {
        self.image_width.borrow()
    }
}
impl Jpeg_SegmentSof0 {
    pub fn num_components(&self) -> Ref<'_, u8> {
        self.num_components.borrow()
    }
}
impl Jpeg_SegmentSof0 {
    pub fn components(&self) -> Ref<'_, Vec<OptRc<Jpeg_SegmentSof0_Component>>> {
        self.components.borrow()
    }
}
impl Jpeg_SegmentSof0 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Jpeg_SegmentSof0_Component {
    pub _root: SharedType<Jpeg>,
    pub _parent: SharedType<Jpeg_SegmentSof0>,
    pub _self: SharedType<Self>,
    id: RefCell<Jpeg_ComponentId>,
    sampling_factors: RefCell<u8>,
    quantization_table_id: RefCell<u8>,
    _io: RefCell<BytesReader>,
    f_sampling_x: Cell<bool>,
    sampling_x: RefCell<i32>,
    f_sampling_y: Cell<bool>,
    sampling_y: RefCell<i32>,
}
impl KStruct for Jpeg_SegmentSof0_Component {
    type Root = Jpeg;
    type Parent = Jpeg_SegmentSof0;

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
        *self_rc.id.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.sampling_factors.borrow_mut() = _io.read_u1()?.into();
        *self_rc.quantization_table_id.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl Jpeg_SegmentSof0_Component {
    pub fn sampling_x(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_sampling_x.get() {
            return Ok(self.sampling_x.borrow());
        }
        self.f_sampling_x.set(true);
        *self.sampling_x.borrow_mut() = ((((((*self.sampling_factors() as u8) & (240 as u8)) as u64) >> 4) as i32)) as i32;
        Ok(self.sampling_x.borrow())
    }
    pub fn sampling_y(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_sampling_y.get() {
            return Ok(self.sampling_y.borrow());
        }
        self.f_sampling_y.set(true);
        *self.sampling_y.borrow_mut() = (((*self.sampling_factors() as u8) & (15 as u8))) as i32;
        Ok(self.sampling_y.borrow())
    }
}

/**
 * Component selector
 */
impl Jpeg_SegmentSof0_Component {
    pub fn id(&self) -> Ref<'_, Jpeg_ComponentId> {
        self.id.borrow()
    }
}
impl Jpeg_SegmentSof0_Component {
    pub fn sampling_factors(&self) -> Ref<'_, u8> {
        self.sampling_factors.borrow()
    }
}
impl Jpeg_SegmentSof0_Component {
    pub fn quantization_table_id(&self) -> Ref<'_, u8> {
        self.quantization_table_id.borrow()
    }
}
impl Jpeg_SegmentSof0_Component {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Jpeg_SegmentSos {
    pub _root: SharedType<Jpeg>,
    pub _parent: SharedType<Jpeg_Segment>,
    pub _self: SharedType<Self>,
    num_components: RefCell<u8>,
    components: RefCell<Vec<OptRc<Jpeg_SegmentSos_Component>>>,
    start_spectral_selection: RefCell<u8>,
    end_spectral: RefCell<u8>,
    appr_bit_pos: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Jpeg_SegmentSos {
    type Root = Jpeg;
    type Parent = Jpeg_Segment;

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
        *self_rc.num_components.borrow_mut() = _io.read_u1()?.into();
        *self_rc.components.borrow_mut() = Vec::new();
        let l_components = *self_rc.num_components();
        for _i in 0..l_components {
            let t = Self::read_into::<_, Jpeg_SegmentSos_Component>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.components.borrow_mut().push(t);
        }
        *self_rc.start_spectral_selection.borrow_mut() = _io.read_u1()?.into();
        *self_rc.end_spectral.borrow_mut() = _io.read_u1()?.into();
        *self_rc.appr_bit_pos.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl Jpeg_SegmentSos {
}

/**
 * Number of components in scan
 */
impl Jpeg_SegmentSos {
    pub fn num_components(&self) -> Ref<'_, u8> {
        self.num_components.borrow()
    }
}

/**
 * Scan components specification
 */
impl Jpeg_SegmentSos {
    pub fn components(&self) -> Ref<'_, Vec<OptRc<Jpeg_SegmentSos_Component>>> {
        self.components.borrow()
    }
}

/**
 * Start of spectral selection or predictor selection
 */
impl Jpeg_SegmentSos {
    pub fn start_spectral_selection(&self) -> Ref<'_, u8> {
        self.start_spectral_selection.borrow()
    }
}

/**
 * End of spectral selection
 */
impl Jpeg_SegmentSos {
    pub fn end_spectral(&self) -> Ref<'_, u8> {
        self.end_spectral.borrow()
    }
}

/**
 * Successive approximation bit position high + Successive approximation bit position low or point transform
 */
impl Jpeg_SegmentSos {
    pub fn appr_bit_pos(&self) -> Ref<'_, u8> {
        self.appr_bit_pos.borrow()
    }
}
impl Jpeg_SegmentSos {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Jpeg_SegmentSos_Component {
    pub _root: SharedType<Jpeg>,
    pub _parent: SharedType<Jpeg_SegmentSos>,
    pub _self: SharedType<Self>,
    id: RefCell<Jpeg_ComponentId>,
    huffman_table: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Jpeg_SegmentSos_Component {
    type Root = Jpeg;
    type Parent = Jpeg_SegmentSos;

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
        *self_rc.id.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.huffman_table.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl Jpeg_SegmentSos_Component {
}

/**
 * Scan component selector
 */
impl Jpeg_SegmentSos_Component {
    pub fn id(&self) -> Ref<'_, Jpeg_ComponentId> {
        self.id.borrow()
    }
}
impl Jpeg_SegmentSos_Component {
    pub fn huffman_table(&self) -> Ref<'_, u8> {
        self.huffman_table.borrow()
    }
}
impl Jpeg_SegmentSos_Component {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

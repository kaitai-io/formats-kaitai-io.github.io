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
use super::icc_4::Icc4;

/**
 * Test files for APNG can be found at the following locations:
 * 
 *   * <https://philip.html5.org/tests/apng/tests.html>
 *   * <http://littlesvr.ca/apng/>
 */

#[derive(Default, Debug, Clone)]
pub struct Png {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    ihdr_len: RefCell<u32>,
    ihdr_type: RefCell<Vec<u8>>,
    ihdr: RefCell<OptRc<Png_IhdrChunk>>,
    ihdr_crc: RefCell<u32>,
    chunks: RefCell<Vec<OptRc<Png_Chunk>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Png {
    type Root = Png;
    type Parent = Png;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(8 as usize)?.into();
        if !(*self_rc.magic() == vec![0x89u8, 0x50u8, 0x4eu8, 0x47u8, 0xdu8, 0xau8, 0x1au8, 0xau8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.ihdr_len.borrow_mut() = _io.read_u4be()?.into();
        if !(((*self_rc.ihdr_len() as u32) == (13 as u32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/1".to_string() }));
        }
        *self_rc.ihdr_type.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.ihdr_type() == vec![0x49u8, 0x48u8, 0x44u8, 0x52u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/2".to_string() }));
        }
        let t = Self::read_into::<_, Png_IhdrChunk>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.ihdr.borrow_mut() = t;
        *self_rc.ihdr_crc.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.chunks.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let t = Self::read_into::<_, Png_Chunk>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.chunks.borrow_mut().push(t);
                let _t_chunks = self_rc.chunks.borrow();
                let _tmpa = _t_chunks.last().unwrap();
                _i += 1;
                let x = !( ((*_tmpa.type()? == "IEND".to_string()) || (_io.is_eof())) );
                x
            } {}
        }
        Ok(())
    }
}
impl Png {
}
impl Png {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl Png {
    pub fn ihdr_len(&self) -> Ref<'_, u32> {
        self.ihdr_len.borrow()
    }
}
impl Png {
    pub fn ihdr_type(&self) -> Ref<'_, Vec<u8>> {
        self.ihdr_type.borrow()
    }
}
impl Png {
    pub fn ihdr(&self) -> Ref<'_, OptRc<Png_IhdrChunk>> {
        self.ihdr.borrow()
    }
}
impl Png {
    pub fn ihdr_crc(&self) -> Ref<'_, u32> {
        self.ihdr_crc.borrow()
    }
}
impl Png {
    pub fn chunks(&self) -> Ref<'_, Vec<OptRc<Png_Chunk>>> {
        self.chunks.borrow()
    }
}
impl Png {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Png_BlendOpValues {

    /**
     * All color components of the frame, including alpha,
     * overwrite the current contents of the frame's output buffer region.
     * \sa https://www.w3.org/TR/png/#fcTL-chunk Source
     */
    Source,

    /**
     * The frame is composited onto the output buffer based on its alpha, using
     * a simple OVER operation as described in [Alpha Channel
     * Processing](https://www.w3.org/TR/png/#13Alpha-channel-processing).
     * \sa https://www.w3.org/TR/png/#fcTL-chunk Source
     */
    Over,
    Unknown(i64),
}

impl TryFrom<i64> for Png_BlendOpValues {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Png_BlendOpValues> {
        match flag {
            0 => Ok(Png_BlendOpValues::Source),
            1 => Ok(Png_BlendOpValues::Over),
            _ => Ok(Png_BlendOpValues::Unknown(flag)),
        }
    }
}

impl From<&Png_BlendOpValues> for i64 {
    fn from(v: &Png_BlendOpValues) -> Self {
        match *v {
            Png_BlendOpValues::Source => 0,
            Png_BlendOpValues::Over => 1,
            Png_BlendOpValues::Unknown(v) => v
        }
    }
}

impl Default for Png_BlendOpValues {
    fn default() -> Self { Png_BlendOpValues::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Png_ColorType {
    Greyscale,
    Truecolor,
    Indexed,
    GreyscaleAlpha,
    TruecolorAlpha,
    Unknown(i64),
}

impl TryFrom<i64> for Png_ColorType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Png_ColorType> {
        match flag {
            0 => Ok(Png_ColorType::Greyscale),
            2 => Ok(Png_ColorType::Truecolor),
            3 => Ok(Png_ColorType::Indexed),
            4 => Ok(Png_ColorType::GreyscaleAlpha),
            6 => Ok(Png_ColorType::TruecolorAlpha),
            _ => Ok(Png_ColorType::Unknown(flag)),
        }
    }
}

impl From<&Png_ColorType> for i64 {
    fn from(v: &Png_ColorType) -> Self {
        match *v {
            Png_ColorType::Greyscale => 0,
            Png_ColorType::Truecolor => 2,
            Png_ColorType::Indexed => 3,
            Png_ColorType::GreyscaleAlpha => 4,
            Png_ColorType::TruecolorAlpha => 6,
            Png_ColorType::Unknown(v) => v
        }
    }
}

impl Default for Png_ColorType {
    fn default() -> Self { Png_ColorType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Png_CompressionMethods {
    Zlib,
    Unknown(i64),
}

impl TryFrom<i64> for Png_CompressionMethods {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Png_CompressionMethods> {
        match flag {
            0 => Ok(Png_CompressionMethods::Zlib),
            _ => Ok(Png_CompressionMethods::Unknown(flag)),
        }
    }
}

impl From<&Png_CompressionMethods> for i64 {
    fn from(v: &Png_CompressionMethods) -> Self {
        match *v {
            Png_CompressionMethods::Zlib => 0,
            Png_CompressionMethods::Unknown(v) => v
        }
    }
}

impl Default for Png_CompressionMethods {
    fn default() -> Self { Png_CompressionMethods::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Png_DisposeOpValues {

    /**
     * No disposal is done on this frame before rendering the next;
     * the contents of the output buffer are left as is.
     * \sa https://www.w3.org/TR/png/#fcTL-chunk Source
     */
    None,

    /**
     * The frame's region of the output buffer is to be cleared to
     * fully transparent black before rendering the next frame.
     * \sa https://www.w3.org/TR/png/#fcTL-chunk Source
     */
    Background,

    /**
     * The frame's region of the output buffer is to be reverted
     * to the previous contents before rendering the next frame.
     * \sa https://www.w3.org/TR/png/#fcTL-chunk Source
     */
    Previous,
    Unknown(i64),
}

impl TryFrom<i64> for Png_DisposeOpValues {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Png_DisposeOpValues> {
        match flag {
            0 => Ok(Png_DisposeOpValues::None),
            1 => Ok(Png_DisposeOpValues::Background),
            2 => Ok(Png_DisposeOpValues::Previous),
            _ => Ok(Png_DisposeOpValues::Unknown(flag)),
        }
    }
}

impl From<&Png_DisposeOpValues> for i64 {
    fn from(v: &Png_DisposeOpValues) -> Self {
        match *v {
            Png_DisposeOpValues::None => 0,
            Png_DisposeOpValues::Background => 1,
            Png_DisposeOpValues::Previous => 2,
            Png_DisposeOpValues::Unknown(v) => v
        }
    }
}

impl Default for Png_DisposeOpValues {
    fn default() -> Self { Png_DisposeOpValues::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Png_FilterMethod {

    /**
     * Single row per-byte filtering
     * \sa https://github.com/pnggroup/libpng/blob/dd5d363ae1fc7778f2734bf51b10d3fe65028671/png.h#L599 Source
     * \sa https://www.w3.org/TR/png/#9Filter-types Source
     */
    Base,
    Unknown(i64),
}

impl TryFrom<i64> for Png_FilterMethod {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Png_FilterMethod> {
        match flag {
            0 => Ok(Png_FilterMethod::Base),
            _ => Ok(Png_FilterMethod::Unknown(flag)),
        }
    }
}

impl From<&Png_FilterMethod> for i64 {
    fn from(v: &Png_FilterMethod) -> Self {
        match *v {
            Png_FilterMethod::Base => 0,
            Png_FilterMethod::Unknown(v) => v
        }
    }
}

impl Default for Png_FilterMethod {
    fn default() -> Self { Png_FilterMethod::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Png_InterlaceMethod {
    None,
    Adam7,
    Unknown(i64),
}

impl TryFrom<i64> for Png_InterlaceMethod {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Png_InterlaceMethod> {
        match flag {
            0 => Ok(Png_InterlaceMethod::None),
            1 => Ok(Png_InterlaceMethod::Adam7),
            _ => Ok(Png_InterlaceMethod::Unknown(flag)),
        }
    }
}

impl From<&Png_InterlaceMethod> for i64 {
    fn from(v: &Png_InterlaceMethod) -> Self {
        match *v {
            Png_InterlaceMethod::None => 0,
            Png_InterlaceMethod::Adam7 => 1,
            Png_InterlaceMethod::Unknown(v) => v
        }
    }
}

impl Default for Png_InterlaceMethod {
    fn default() -> Self { Png_InterlaceMethod::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Png_PhysUnit {
    Unknown,
    Meter,
    Unknown(i64),
}

impl TryFrom<i64> for Png_PhysUnit {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Png_PhysUnit> {
        match flag {
            0 => Ok(Png_PhysUnit::Unknown),
            1 => Ok(Png_PhysUnit::Meter),
            _ => Ok(Png_PhysUnit::Unknown(flag)),
        }
    }
}

impl From<&Png_PhysUnit> for i64 {
    fn from(v: &Png_PhysUnit) -> Self {
        match *v {
            Png_PhysUnit::Unknown => 0,
            Png_PhysUnit::Meter => 1,
            Png_PhysUnit::Unknown(v) => v
        }
    }
}

impl Default for Png_PhysUnit {
    fn default() -> Self { Png_PhysUnit::Unknown(0) }
}


/**
 * \sa https://stackoverflow.com/questions/4242402/the-fireworks-png-format-any-insight-any-libs/51683285#51683285 Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_AdobeFireworksChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    preview_data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    preview_data_raw: RefCell<Vec<u8>>,
}
impl KStruct for Png_AdobeFireworksChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        *self_rc.preview_data_raw.borrow_mut() = _io.read_bytes_full()?.into();
        *self_rc.preview_data.borrow_mut() = process_zlib(&self_rc.preview_data_raw.borrow()).map_err(|msg| KError::BytesDecodingError { msg })?;
        Ok(())
    }
}
impl Png_AdobeFireworksChunk {
}
impl Png_AdobeFireworksChunk {
    pub fn preview_data(&self) -> Ref<'_, Vec<u8>> {
        self.preview_data.borrow()
    }
}
impl Png_AdobeFireworksChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Png_AdobeFireworksChunk {
    pub fn preview_data_raw(&self) -> Ref<'_, Vec<u8>> {
        self.preview_data_raw.borrow()
    }
}

/**
 * \sa https://www.w3.org/TR/png/#acTL-chunk Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_AnimationControlChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    num_frames: RefCell<u32>,
    num_plays: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Png_AnimationControlChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        *self_rc.num_frames.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.num_plays.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl Png_AnimationControlChunk {
}

/**
 * Number of frames, must be equal to the number of `fcTL` chunks (i.e.
 * `frame_control_chunk` objects)
 */
impl Png_AnimationControlChunk {
    pub fn num_frames(&self) -> Ref<'_, u32> {
        self.num_frames.borrow()
    }
}

/**
 * Number of times to loop, 0 indicates infinite looping.
 */
impl Png_AnimationControlChunk {
    pub fn num_plays(&self) -> Ref<'_, u32> {
        self.num_plays.borrow()
    }
}
impl Png_AnimationControlChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://github.com/skeeto/scratch/tree/58470254f4a95cdf7a53888e405c851c21eb2cae/pngattach Source
 * \sa https://nullprogram.com/blog/2021/12/31/ A new protocol and tool for PNG file attachments
 */

#[derive(Default, Debug, Clone)]
pub struct Png_AtchChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    file_name: RefCell<String>,
    compression: RefCell<Png_AtchChunk_CompressionAttachMethods>,
    data_plain: RefCell<Vec<u8>>,
    data_zlib: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    data_zlib_raw: RefCell<Vec<u8>>,
    f_data: Cell<bool>,
    data: RefCell<Vec<u8>>,
}
impl KStruct for Png_AtchChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        *self_rc.file_name.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?;
        let _tmpa = *self_rc.file_name();
        if !( ((((_tmpa.len() as i32) != (0 as i32))) && (_tmpa[0..1] != ".".to_string())) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/atch_chunk/seq/0".to_string() }));
        }
        *self_rc.compression.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        if *self_rc.compression() == Png_AtchChunk_CompressionAttachMethods::None {
            *self_rc.data_plain.borrow_mut() = _io.read_bytes_full()?.into();
        }
        if *self_rc.compression() == Png_AtchChunk_CompressionAttachMethods::Zlib {
            *self_rc.data_zlib_raw.borrow_mut() = _io.read_bytes_full()?.into();
            *self_rc.data_zlib.borrow_mut() = process_zlib(&self_rc.data_zlib_raw.borrow()).map_err(|msg| KError::BytesDecodingError { msg })?;
        }
        Ok(())
    }
}
impl Png_AtchChunk {
    pub fn data(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_data.get() {
            return Ok(self.data.borrow());
        }
        self.f_data.set(true);
        *self.data.borrow_mut() = if *self.compression() == Png_AtchChunk_CompressionAttachMethods::None { self.data_plain().to_vec() } else { self.data_zlib().to_vec() }.to_vec();
        Ok(self.data.borrow())
    }
}

/**
 * From the [official
 * specification](https://github.com/skeeto/scratch/tree/58470254f4a95cdf7a53888e405c851c21eb2cae/pngattach#atch-chunk-specification):
 * 
 * > The name can be any length that fits in the chunk, and should be
 * > encoded with UTF-8. It's up to each implementation to determine how
 * > to appropriately interpret the bytestring for the local system.
 * 
 * > The name must be at least one byte long, not counting the null
 * > terminator. It cannot begin with a period (`0x2e`), nor contain
 * > control bytes (anything less than `0x20`), nor slash (`0x2f`), nor
 * > backslash (`0x5c`), i.e. no directory hierarchies.
 * 
 * As of Kaitai Struct 0.11, we cannot easily check whether a string
 * contains certain characters, so we only enforce that the file name is
 * not empty and that it doesn't start with a period.
 */
impl Png_AtchChunk {
    pub fn file_name(&self) -> Ref<'_, String> {
        self.file_name.borrow()
    }
}
impl Png_AtchChunk {
    pub fn compression(&self) -> Ref<'_, Png_AtchChunk_CompressionAttachMethods> {
        self.compression.borrow()
    }
}
impl Png_AtchChunk {
    pub fn data_plain(&self) -> Ref<'_, Vec<u8>> {
        self.data_plain.borrow()
    }
}
impl Png_AtchChunk {
    pub fn data_zlib(&self) -> Ref<'_, Vec<u8>> {
        self.data_zlib.borrow()
    }
}
impl Png_AtchChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Png_AtchChunk {
    pub fn data_zlib_raw(&self) -> Ref<'_, Vec<u8>> {
        self.data_zlib_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Png_AtchChunk_CompressionAttachMethods {
    None,
    Zlib,
    Unknown(i64),
}

impl TryFrom<i64> for Png_AtchChunk_CompressionAttachMethods {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Png_AtchChunk_CompressionAttachMethods> {
        match flag {
            0 => Ok(Png_AtchChunk_CompressionAttachMethods::None),
            1 => Ok(Png_AtchChunk_CompressionAttachMethods::Zlib),
            _ => Ok(Png_AtchChunk_CompressionAttachMethods::Unknown(flag)),
        }
    }
}

impl From<&Png_AtchChunk_CompressionAttachMethods> for i64 {
    fn from(v: &Png_AtchChunk_CompressionAttachMethods) -> Self {
        match *v {
            Png_AtchChunk_CompressionAttachMethods::None => 0,
            Png_AtchChunk_CompressionAttachMethods::Zlib => 1,
            Png_AtchChunk_CompressionAttachMethods::Unknown(v) => v
        }
    }
}

impl Default for Png_AtchChunk_CompressionAttachMethods {
    fn default() -> Self { Png_AtchChunk_CompressionAttachMethods::Unknown(0) }
}


/**
 * Background chunk stores default background color to display this
 * image against. Contents depend on `color_type` of the image.
 * \sa https://www.w3.org/TR/png/#11bKGD Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_BkgdChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    bkgd: RefCell<Option<Png_BkgdChunk_Bkgd>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Png_BkgdChunk_Bkgd {
    Png_BkgdGreyscale(OptRc<Png_BkgdGreyscale>),
    Png_BkgdIndexed(OptRc<Png_BkgdIndexed>),
    Png_BkgdTruecolor(OptRc<Png_BkgdTruecolor>),
}
impl From<&Png_BkgdChunk_Bkgd> for OptRc<Png_BkgdGreyscale> {
    fn from(v: &Png_BkgdChunk_Bkgd) -> Self {
        if let Png_BkgdChunk_Bkgd::Png_BkgdGreyscale(x) = v {
            return x.clone();
        }
        panic!("expected Png_BkgdChunk_Bkgd::Png_BkgdGreyscale, got {:?}", v)
    }
}
impl From<OptRc<Png_BkgdGreyscale>> for Png_BkgdChunk_Bkgd {
    fn from(v: OptRc<Png_BkgdGreyscale>) -> Self {
        Self::Png_BkgdGreyscale(v)
    }
}
impl From<&Png_BkgdChunk_Bkgd> for OptRc<Png_BkgdIndexed> {
    fn from(v: &Png_BkgdChunk_Bkgd) -> Self {
        if let Png_BkgdChunk_Bkgd::Png_BkgdIndexed(x) = v {
            return x.clone();
        }
        panic!("expected Png_BkgdChunk_Bkgd::Png_BkgdIndexed, got {:?}", v)
    }
}
impl From<OptRc<Png_BkgdIndexed>> for Png_BkgdChunk_Bkgd {
    fn from(v: OptRc<Png_BkgdIndexed>) -> Self {
        Self::Png_BkgdIndexed(v)
    }
}
impl From<&Png_BkgdChunk_Bkgd> for OptRc<Png_BkgdTruecolor> {
    fn from(v: &Png_BkgdChunk_Bkgd) -> Self {
        if let Png_BkgdChunk_Bkgd::Png_BkgdTruecolor(x) = v {
            return x.clone();
        }
        panic!("expected Png_BkgdChunk_Bkgd::Png_BkgdTruecolor, got {:?}", v)
    }
}
impl From<OptRc<Png_BkgdTruecolor>> for Png_BkgdChunk_Bkgd {
    fn from(v: OptRc<Png_BkgdTruecolor>) -> Self {
        Self::Png_BkgdTruecolor(v)
    }
}
impl KStruct for Png_BkgdChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        match *_r.ihdr().color_type() {
            Png_ColorType::Greyscale => {
                let t = Self::read_into::<_, Png_BkgdGreyscale>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.bkgd.borrow_mut() = Some(t);
            }
            Png_ColorType::GreyscaleAlpha => {
                let t = Self::read_into::<_, Png_BkgdGreyscale>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.bkgd.borrow_mut() = Some(t);
            }
            Png_ColorType::Indexed => {
                let t = Self::read_into::<_, Png_BkgdIndexed>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.bkgd.borrow_mut() = Some(t);
            }
            Png_ColorType::Truecolor => {
                let t = Self::read_into::<_, Png_BkgdTruecolor>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.bkgd.borrow_mut() = Some(t);
            }
            Png_ColorType::TruecolorAlpha => {
                let t = Self::read_into::<_, Png_BkgdTruecolor>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.bkgd.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Png_BkgdChunk {
}
impl Png_BkgdChunk {
    pub fn bkgd(&self) -> Ref<'_, Option<Png_BkgdChunk_Bkgd>> {
        self.bkgd.borrow()
    }
}
impl Png_BkgdChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Background chunk for greyscale images.
 */

#[derive(Default, Debug, Clone)]
pub struct Png_BkgdGreyscale {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_BkgdChunk>,
    pub _self: SharedType<Self>,
    value: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Png_BkgdGreyscale {
    type Root = Png;
    type Parent = Png_BkgdChunk;

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
        *self_rc.value.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl Png_BkgdGreyscale {
}
impl Png_BkgdGreyscale {
    pub fn value(&self) -> Ref<'_, u16> {
        self.value.borrow()
    }
}
impl Png_BkgdGreyscale {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Background chunk for images with indexed palette.
 */

#[derive(Default, Debug, Clone)]
pub struct Png_BkgdIndexed {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_BkgdChunk>,
    pub _self: SharedType<Self>,
    palette_index: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Png_BkgdIndexed {
    type Root = Png;
    type Parent = Png_BkgdChunk;

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
        *self_rc.palette_index.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl Png_BkgdIndexed {
}
impl Png_BkgdIndexed {
    pub fn palette_index(&self) -> Ref<'_, u8> {
        self.palette_index.borrow()
    }
}
impl Png_BkgdIndexed {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Background chunk for truecolor images.
 */

#[derive(Default, Debug, Clone)]
pub struct Png_BkgdTruecolor {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_BkgdChunk>,
    pub _self: SharedType<Self>,
    red: RefCell<u16>,
    green: RefCell<u16>,
    blue: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Png_BkgdTruecolor {
    type Root = Png;
    type Parent = Png_BkgdChunk;

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
        *self_rc.red.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.green.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.blue.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl Png_BkgdTruecolor {
}
impl Png_BkgdTruecolor {
    pub fn red(&self) -> Ref<'_, u16> {
        self.red.borrow()
    }
}
impl Png_BkgdTruecolor {
    pub fn green(&self) -> Ref<'_, u16> {
        self.green.borrow()
    }
}
impl Png_BkgdTruecolor {
    pub fn blue(&self) -> Ref<'_, u16> {
        self.blue.borrow()
    }
}
impl Png_BkgdTruecolor {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Png_ChrmChromaticity {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_ChrmChunk>,
    pub _self: SharedType<Self>,
    x_int: RefCell<u32>,
    y_int: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_x: Cell<bool>,
    x: RefCell<f64>,
    f_y: Cell<bool>,
    y: RefCell<f64>,
}
impl KStruct for Png_ChrmChromaticity {
    type Root = Png;
    type Parent = Png_ChrmChunk;

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
        *self_rc.x_int.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.y_int.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl Png_ChrmChromaticity {
    pub fn x(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_x.get() {
            return Ok(self.x.borrow());
        }
        self.f_x.set(true);
        *self.x.borrow_mut() = (((*self.x_int() as f64) / (100000.0 as f64))) as f64;
        Ok(self.x.borrow())
    }
    pub fn y(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_y.get() {
            return Ok(self.y.borrow());
        }
        self.f_y.set(true);
        *self.y.borrow_mut() = (((*self.y_int() as f64) / (100000.0 as f64))) as f64;
        Ok(self.y.borrow())
    }
}
impl Png_ChrmChromaticity {
    pub fn x_int(&self) -> Ref<'_, u32> {
        self.x_int.borrow()
    }
}
impl Png_ChrmChromaticity {
    pub fn y_int(&self) -> Ref<'_, u32> {
        self.y_int.borrow()
    }
}
impl Png_ChrmChromaticity {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://www.w3.org/TR/png/#11cHRM Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_ChrmChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    white_point: RefCell<OptRc<Png_ChrmChromaticity>>,
    red: RefCell<OptRc<Png_ChrmChromaticity>>,
    green: RefCell<OptRc<Png_ChrmChromaticity>>,
    blue: RefCell<OptRc<Png_ChrmChromaticity>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Png_ChrmChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        let t = Self::read_into::<_, Png_ChrmChromaticity>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.white_point.borrow_mut() = t;
        let t = Self::read_into::<_, Png_ChrmChromaticity>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.red.borrow_mut() = t;
        let t = Self::read_into::<_, Png_ChrmChromaticity>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.green.borrow_mut() = t;
        let t = Self::read_into::<_, Png_ChrmChromaticity>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.blue.borrow_mut() = t;
        Ok(())
    }
}
impl Png_ChrmChunk {
}
impl Png_ChrmChunk {
    pub fn white_point(&self) -> Ref<'_, OptRc<Png_ChrmChromaticity>> {
        self.white_point.borrow()
    }
}
impl Png_ChrmChunk {
    pub fn red(&self) -> Ref<'_, OptRc<Png_ChrmChromaticity>> {
        self.red.borrow()
    }
}
impl Png_ChrmChunk {
    pub fn green(&self) -> Ref<'_, OptRc<Png_ChrmChromaticity>> {
        self.green.borrow()
    }
}
impl Png_ChrmChunk {
    pub fn blue(&self) -> Ref<'_, OptRc<Png_ChrmChromaticity>> {
        self.blue.borrow()
    }
}
impl Png_ChrmChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Png_Chunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png>,
    pub _self: SharedType<Self>,
    len: RefCell<u32>,
    type_raw: RefCell<Vec<u8>>,
    body: RefCell<Option<Png_Chunk_Body>>,
    crc: RefCell<u32>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
    f_is_ancillary: Cell<bool>,
    is_ancillary: RefCell<bool>,
    f_is_private: Cell<bool>,
    is_private: RefCell<bool>,
    f_is_safe_to_copy: Cell<bool>,
    is_safe_to_copy: RefCell<bool>,
    f_reserved_bit: Cell<bool>,
    reserved_bit: RefCell<bool>,
    f_type: Cell<bool>,
    type: RefCell<String>,
}
#[derive(Debug, Clone)]
pub enum Png_Chunk_Body {
    Png_MdcvChunk(OptRc<Png_MdcvChunk>),
    Png_SrgbChunk(OptRc<Png_SrgbChunk>),
    Png_FrameControlChunk(OptRc<Png_FrameControlChunk>),
    Png_TrnsChunk(OptRc<Png_TrnsChunk>),
    Png_ChrmChunk(OptRc<Png_ChrmChunk>),
    Png_EvernoteSkmfChunk(OptRc<Png_EvernoteSkmfChunk>),
    Png_TimeChunk(OptRc<Png_TimeChunk>),
    Png_AnimationControlChunk(OptRc<Png_AnimationControlChunk>),
    Png_CompressedTextChunk(OptRc<Png_CompressedTextChunk>),
    Png_HistChunk(OptRc<Png_HistChunk>),
    Png_AdobeFireworksChunk(OptRc<Png_AdobeFireworksChunk>),
    Png_SbitChunk(OptRc<Png_SbitChunk>),
    Png_AtchChunk(OptRc<Png_AtchChunk>),
    Png_SpltChunk(OptRc<Png_SpltChunk>),
    Png_IccpChunk(OptRc<Png_IccpChunk>),
    Png_PhysChunk(OptRc<Png_PhysChunk>),
    Png_CicpChunk(OptRc<Png_CicpChunk>),
    Png_FrameDataChunk(OptRc<Png_FrameDataChunk>),
    Png_TextChunk(OptRc<Png_TextChunk>),
    Png_EvernoteSkrfChunk(OptRc<Png_EvernoteSkrfChunk>),
    Bytes(Vec<u8>),
    Png_PlteChunk(OptRc<Png_PlteChunk>),
    Png_BkgdChunk(OptRc<Png_BkgdChunk>),
    Png_ClliChunk(OptRc<Png_ClliChunk>),
    Png_InternationalTextChunk(OptRc<Png_InternationalTextChunk>),
    Png_ExifChunk(OptRc<Png_ExifChunk>),
    Png_GamaChunk(OptRc<Png_GamaChunk>),
}
impl From<&Png_Chunk_Body> for OptRc<Png_MdcvChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_MdcvChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_MdcvChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_MdcvChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_MdcvChunk>) -> Self {
        Self::Png_MdcvChunk(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_SrgbChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_SrgbChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_SrgbChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_SrgbChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_SrgbChunk>) -> Self {
        Self::Png_SrgbChunk(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_FrameControlChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_FrameControlChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_FrameControlChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_FrameControlChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_FrameControlChunk>) -> Self {
        Self::Png_FrameControlChunk(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_TrnsChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_TrnsChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_TrnsChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_TrnsChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_TrnsChunk>) -> Self {
        Self::Png_TrnsChunk(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_ChrmChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_ChrmChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_ChrmChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_ChrmChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_ChrmChunk>) -> Self {
        Self::Png_ChrmChunk(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_EvernoteSkmfChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_EvernoteSkmfChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_EvernoteSkmfChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_EvernoteSkmfChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_EvernoteSkmfChunk>) -> Self {
        Self::Png_EvernoteSkmfChunk(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_TimeChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_TimeChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_TimeChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_TimeChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_TimeChunk>) -> Self {
        Self::Png_TimeChunk(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_AnimationControlChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_AnimationControlChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_AnimationControlChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_AnimationControlChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_AnimationControlChunk>) -> Self {
        Self::Png_AnimationControlChunk(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_CompressedTextChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_CompressedTextChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_CompressedTextChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_CompressedTextChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_CompressedTextChunk>) -> Self {
        Self::Png_CompressedTextChunk(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_HistChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_HistChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_HistChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_HistChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_HistChunk>) -> Self {
        Self::Png_HistChunk(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_AdobeFireworksChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_AdobeFireworksChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_AdobeFireworksChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_AdobeFireworksChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_AdobeFireworksChunk>) -> Self {
        Self::Png_AdobeFireworksChunk(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_SbitChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_SbitChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_SbitChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_SbitChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_SbitChunk>) -> Self {
        Self::Png_SbitChunk(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_AtchChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_AtchChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_AtchChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_AtchChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_AtchChunk>) -> Self {
        Self::Png_AtchChunk(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_SpltChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_SpltChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_SpltChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_SpltChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_SpltChunk>) -> Self {
        Self::Png_SpltChunk(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_IccpChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_IccpChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_IccpChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_IccpChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_IccpChunk>) -> Self {
        Self::Png_IccpChunk(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_PhysChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_PhysChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_PhysChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_PhysChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_PhysChunk>) -> Self {
        Self::Png_PhysChunk(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_CicpChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_CicpChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_CicpChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_CicpChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_CicpChunk>) -> Self {
        Self::Png_CicpChunk(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_FrameDataChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_FrameDataChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_FrameDataChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_FrameDataChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_FrameDataChunk>) -> Self {
        Self::Png_FrameDataChunk(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_TextChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_TextChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_TextChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_TextChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_TextChunk>) -> Self {
        Self::Png_TextChunk(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_EvernoteSkrfChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_EvernoteSkrfChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_EvernoteSkrfChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_EvernoteSkrfChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_EvernoteSkrfChunk>) -> Self {
        Self::Png_EvernoteSkrfChunk(v)
    }
}
impl From<&Png_Chunk_Body> for Vec<u8> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for Png_Chunk_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_PlteChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_PlteChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_PlteChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_PlteChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_PlteChunk>) -> Self {
        Self::Png_PlteChunk(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_BkgdChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_BkgdChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_BkgdChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_BkgdChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_BkgdChunk>) -> Self {
        Self::Png_BkgdChunk(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_ClliChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_ClliChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_ClliChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_ClliChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_ClliChunk>) -> Self {
        Self::Png_ClliChunk(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_InternationalTextChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_InternationalTextChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_InternationalTextChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_InternationalTextChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_InternationalTextChunk>) -> Self {
        Self::Png_InternationalTextChunk(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_ExifChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_ExifChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_ExifChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_ExifChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_ExifChunk>) -> Self {
        Self::Png_ExifChunk(v)
    }
}
impl From<&Png_Chunk_Body> for OptRc<Png_GamaChunk> {
    fn from(v: &Png_Chunk_Body) -> Self {
        if let Png_Chunk_Body::Png_GamaChunk(x) = v {
            return x.clone();
        }
        panic!("expected Png_Chunk_Body::Png_GamaChunk, got {:?}", v)
    }
}
impl From<OptRc<Png_GamaChunk>> for Png_Chunk_Body {
    fn from(v: OptRc<Png_GamaChunk>) -> Self {
        Self::Png_GamaChunk(v)
    }
}
impl KStruct for Png_Chunk {
    type Root = Png;
    type Parent = Png;

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
        *self_rc.len.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.type_raw.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        let _tmpa = *self_rc.type_raw();
        if !( (( (( ((((_tmpa[0 as usize] as u8) >= (65 as u8))) && (((_tmpa[0 as usize] as u8) <= (90 as u8)))) ) || ( ((((_tmpa[0 as usize] as u8) >= (97 as u8))) && (((_tmpa[0 as usize] as u8) <= (122 as u8)))) )) ) && ( (( ((((_tmpa[1 as usize] as u8) >= (65 as u8))) && (((_tmpa[1 as usize] as u8) <= (90 as u8)))) ) || ( ((((_tmpa[1 as usize] as u8) >= (97 as u8))) && (((_tmpa[1 as usize] as u8) <= (122 as u8)))) )) ) && ( (( ((((_tmpa[2 as usize] as u8) >= (65 as u8))) && (((_tmpa[2 as usize] as u8) <= (90 as u8)))) ) || ( ((((_tmpa[2 as usize] as u8) >= (97 as u8))) && (((_tmpa[2 as usize] as u8) <= (122 as u8)))) )) ) && ( (( ((((_tmpa[3 as usize] as u8) >= (65 as u8))) && (((_tmpa[3 as usize] as u8) <= (90 as u8)))) ) || ( ((((_tmpa[3 as usize] as u8) >= (97 as u8))) && (((_tmpa[3 as usize] as u8) <= (122 as u8)))) )) )) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/chunk/seq/1".to_string() }));
        }
        {
            let on = self_rc.type()?;
            if *on == "PLTE" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_PlteChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "acTL" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_AnimationControlChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "atCh" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_AtchChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "bKGD" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_BkgdChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "cHRM" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_ChrmChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "cICP" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_CicpChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "cLLI" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_ClliChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "eXIf" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_ExifChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "fcTL" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_FrameControlChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "fdAT" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_FrameDataChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "gAMA" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_GamaChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "hIST" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_HistChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "iCCP" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_IccpChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "iTXt" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_InternationalTextChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "mDCV" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_MdcvChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "mkBS" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_AdobeFireworksChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "mkTS" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_AdobeFireworksChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "pHYs" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_PhysChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "prVW" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_AdobeFireworksChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "sBIT" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_SbitChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "sPLT" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_SpltChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "sRGB" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_SrgbChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "skMf" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_EvernoteSkmfChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "skRf" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_EvernoteSkrfChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "tEXt" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_TextChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "tIME" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_TimeChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "tRNS" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_TrnsChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "zTXt" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_CompressedTextChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else {
                *self_rc.body.borrow_mut() = Some(_io.read_bytes(*self_rc.len() as usize)?.into());
            }
        }
        *self_rc.crc.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl Png_Chunk {

    /**
     * false = critical chunk, true = ancillary chunk
     */
    pub fn is_ancillary(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_ancillary.get() {
            return Ok(self.is_ancillary.borrow());
        }
        self.f_is_ancillary.set(true);
        *self.is_ancillary.borrow_mut() = (((((self.type_raw()[0 as usize] as u8) & (32 as u8)) as i32) != (0 as i32))) as bool;
        Ok(self.is_ancillary.borrow())
    }

    /**
     * false = public chunk (defined by the W3C), true = private chunk (can
     * be defined by anyone)
     */
    pub fn is_private(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_private.get() {
            return Ok(self.is_private.borrow());
        }
        self.f_is_private.set(true);
        *self.is_private.borrow_mut() = (((((self.type_raw()[1 as usize] as u8) & (32 as u8)) as i32) != (0 as i32))) as bool;
        Ok(self.is_private.borrow())
    }

    /**
     * Defines whether the chunk may be copied if the image data (i.e.
     * pixels) is modified. This tells PNG editors how to handle unknown
     * chunks - see section [14.2 Behavior of PNG
     * editors](https://www.w3.org/TR/2025/REC-png-3-20250624/#14Ordering) in
     * the official specification.
     */
    pub fn is_safe_to_copy(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_safe_to_copy.get() {
            return Ok(self.is_safe_to_copy.borrow());
        }
        self.f_is_safe_to_copy.set(true);
        *self.is_safe_to_copy.borrow_mut() = (((((self.type_raw()[3 as usize] as u8) & (32 as u8)) as i32) != (0 as i32))) as bool;
        Ok(self.is_safe_to_copy.borrow())
    }

    /**
     * Should be `false`, i.e. all chunk types should have uppercase third
     * letters (the lowercase third letter is reserved for possible future
     * extensions to the PNG standard)
     */
    pub fn reserved_bit(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_reserved_bit.get() {
            return Ok(self.reserved_bit.borrow());
        }
        self.f_reserved_bit.set(true);
        *self.reserved_bit.borrow_mut() = (((((self.type_raw()[2 as usize] as u8) & (32 as u8)) as i32) != (0 as i32))) as bool;
        Ok(self.reserved_bit.borrow())
    }
    pub fn type(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_type.get() {
            return Ok(self.type.borrow());
        }
        self.f_type.set(true);
        *self.type.borrow_mut() = bytes_to_str(&*self.type_raw(), "ASCII")?.to_string();
        Ok(self.type.borrow())
    }
}
impl Png_Chunk {
    pub fn len(&self) -> Ref<'_, u32> {
        self.len.borrow()
    }
}

/**
 * Each byte of a chunk type is restricted to the hexadecimal values
 * 0x41..0x5a and 0x61..0x7a, i.e. uppercase and lowercase ASCII letters
 * (`A-Z` and `a-z`).
 * \sa https://www.w3.org/TR/2025/REC-png-3-20250624/#table51 Source
 */
impl Png_Chunk {
    pub fn type_raw(&self) -> Ref<'_, Vec<u8>> {
        self.type_raw.borrow()
    }
}
impl Png_Chunk {
    pub fn body(&self) -> Ref<'_, Option<Png_Chunk_Body>> {
        self.body.borrow()
    }
}
impl Png_Chunk {
    pub fn crc(&self) -> Ref<'_, u32> {
        self.crc.borrow()
    }
}
impl Png_Chunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Png_Chunk {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}

/**
 * \sa https://www.w3.org/TR/png/#cICP-chunk Source
 * \sa https://w3c.github.io/png/Implementation_Report_3e/#cicp Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_CicpChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    color_primaries: RefCell<u8>,
    transfer_function: RefCell<u8>,
    matrix_coefficients: RefCell<u8>,
    video_full_range_flag: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Png_CicpChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        *self_rc.color_primaries.borrow_mut() = _io.read_u1()?.into();
        *self_rc.transfer_function.borrow_mut() = _io.read_u1()?.into();
        *self_rc.matrix_coefficients.borrow_mut() = _io.read_u1()?.into();
        if !(((*self_rc.matrix_coefficients() as u8) == (0 as u8))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/cicp_chunk/seq/2".to_string() }));
        }
        *self_rc.video_full_range_flag.borrow_mut() = _io.read_u1()?.into();
        if !( ((((*self_rc.video_full_range_flag() as u8) == (0 as u8))) || (((*self_rc.video_full_range_flag() as u8) == (1 as u8)))) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotAnyOf, src_path: "/types/cicp_chunk/seq/3".to_string() }));
        }
        Ok(())
    }
}
impl Png_CicpChunk {
}

/**
 * values above 22 are reserved, see
 * <https://github.com/pnggroup/pngcheck/blob/bd33ad6490269df07cac81e5305f4ebf56c2b637/pngcheck.c#L3322-L3325>
 */
impl Png_CicpChunk {
    pub fn color_primaries(&self) -> Ref<'_, u8> {
        self.color_primaries.borrow()
    }
}

/**
 * values above 18 are reserved, see
 * <https://github.com/pnggroup/pngcheck/blob/bd33ad6490269df07cac81e5305f4ebf56c2b637/pngcheck.c#L3326-L3329>
 */
impl Png_CicpChunk {
    pub fn transfer_function(&self) -> Ref<'_, u8> {
        self.transfer_function.borrow()
    }
}

/**
 * From the [official
 * specification](https://www.w3.org/TR/2025/REC-png-3-20250624/#cICP-chunk):
 * 
 * > RGB is currently the only supported color model in PNG, and as such
 * > `Matrix Coefficients` shall be set to `0`.
 */
impl Png_CicpChunk {
    pub fn matrix_coefficients(&self) -> Ref<'_, u8> {
        self.matrix_coefficients.borrow()
    }
}

/**
 * From the [official
 * specification](https://www.w3.org/TR/2025/REC-png-3-20250624/#cICP-chunk):
 * 
 * > If `Video Full Range Flag` value is `1`, then the image is a
 * > full-range image. Typically, images in the RGB color representation
 * > are stored in the full-range signal quantization, therefore the vast
 * > majority of computer graphics and web images, including those used
 * > in traditional PNG workflows, are full-range images.
 * 
 * > If `Video Full Range Flag` value is `0`, then the image is a
 * > narrow-range image.
 */
impl Png_CicpChunk {
    pub fn video_full_range_flag(&self) -> Ref<'_, u8> {
        self.video_full_range_flag.borrow()
    }
}
impl Png_CicpChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://www.w3.org/TR/png/#cLLI-chunk Source
 * \sa https://w3c.github.io/png/Implementation_Report_3e/#light Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_ClliChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    max_content_light_level_int: RefCell<u32>,
    max_frame_average_light_level_int: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_max_content_light_level: Cell<bool>,
    max_content_light_level: RefCell<f64>,
    f_max_frame_average_light_level: Cell<bool>,
    max_frame_average_light_level: RefCell<f64>,
}
impl KStruct for Png_ClliChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        *self_rc.max_content_light_level_int.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.max_frame_average_light_level_int.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl Png_ClliChunk {

    /**
     * Maximum Content Light Level (MaxCLL), in cd/m^2
     */
    pub fn max_content_light_level(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_max_content_light_level.get() {
            return Ok(self.max_content_light_level.borrow());
        }
        self.f_max_content_light_level.set(true);
        *self.max_content_light_level.borrow_mut() = (((*self.max_content_light_level_int() as f64) * (0.0001 as f64))) as f64;
        Ok(self.max_content_light_level.borrow())
    }

    /**
     * Maximum Frame Average Light Level (MaxFALL), in cd/m^2
     */
    pub fn max_frame_average_light_level(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_max_frame_average_light_level.get() {
            return Ok(self.max_frame_average_light_level.borrow());
        }
        self.f_max_frame_average_light_level.set(true);
        *self.max_frame_average_light_level.borrow_mut() = (((*self.max_frame_average_light_level_int() as f64) * (0.0001 as f64))) as f64;
        Ok(self.max_frame_average_light_level.borrow())
    }
}
impl Png_ClliChunk {
    pub fn max_content_light_level_int(&self) -> Ref<'_, u32> {
        self.max_content_light_level_int.borrow()
    }
}
impl Png_ClliChunk {
    pub fn max_frame_average_light_level_int(&self) -> Ref<'_, u32> {
        self.max_frame_average_light_level_int.borrow()
    }
}
impl Png_ClliChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Png_CompressedText {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_CompressedTextChunk>,
    pub _self: SharedType<Self>,
    value: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Png_CompressedText {
    type Root = Png;
    type Parent = Png_CompressedTextChunk;

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
        *self_rc.value.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "ISO-8859-1")?;
        Ok(())
    }
}
impl Png_CompressedText {
}

/**
 * Text string (the "value" of this key-value pair).
 * 
 * Although it is not null-terminated (unlike the keyword), it must not
 * contain a zero byte (U+0000 NULL character). A newline should be
 * represented by a single U+000A LINE FEED (LF) character (aka `\n`).
 * The remaining control characters (U+0001..U+0009, U+000B..0+001F,
 * U+007F..U+009F) are discouraged.
 */
impl Png_CompressedText {
    pub fn value(&self) -> Ref<'_, String> {
        self.value.borrow()
    }
}
impl Png_CompressedText {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Compressed textual data (`zTXt`) chunk effectively allows you to store
 * key-value string pairs in the PNG container, compressing the "value" part
 * (which can be quite lengthy) with zlib compression.
 * 
 * The `zTXt` and `tEXt` chunks are semantically equivalent, but the `zTXt`
 * chunk is recommended for storing large blocks of text.
 * \sa https://www.w3.org/TR/png/#11zTXt Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_CompressedTextChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    keyword: RefCell<String>,
    compression_method: RefCell<Png_CompressionMethods>,
    text: RefCell<OptRc<Png_CompressedText>>,
    _io: RefCell<BytesReader>,
    text_raw: RefCell<Vec<u8>>,
    text_raw_raw: RefCell<Vec<u8>>,
}
impl KStruct for Png_CompressedTextChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        *self_rc.keyword.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ISO-8859-1")?;
        *self_rc.compression_method.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        if !(*self_rc.compression_method() == Png_CompressionMethods::Zlib) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/compressed_text_chunk/seq/1".to_string() }));
        }
        *self_rc.text_raw_raw.borrow_mut() = _io.read_bytes_full()?.into();
        *self_rc.text_raw.borrow_mut() = process_zlib(&self_rc.text_raw_raw.borrow()).map_err(|msg| KError::BytesDecodingError { msg })?;
        let text_raw = self_rc.text_raw.borrow();
        let _t_text_raw_io = BytesReader::from(text_raw.clone());
        let t = Self::read_into::<BytesReader, Png_CompressedText>(&_t_text_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.text.borrow_mut() = t;
        Ok(())
    }
}
impl Png_CompressedTextChunk {
}

/**
 * Indicates the type of information represented by the text string.
 * 
 * Keywords must consist exclusively of printable ISO-8859-1 (Latin-1)
 * characters and spaces; that is, only code points 0x20-0x7E and
 * 0xA1-0xFF are allowed. To reduce the chances for human misreading of a
 * keyword, leading spaces, trailing spaces, and consecutive spaces are
 * not permitted.
 * \sa https://www.w3.org/TR/2025/REC-png-3-20250624/#11keywords Source
 */
impl Png_CompressedTextChunk {
    pub fn keyword(&self) -> Ref<'_, String> {
        self.keyword.borrow()
    }
}
impl Png_CompressedTextChunk {
    pub fn compression_method(&self) -> Ref<'_, Png_CompressionMethods> {
        self.compression_method.borrow()
    }
}
impl Png_CompressedTextChunk {
    pub fn text(&self) -> Ref<'_, OptRc<Png_CompressedText>> {
        self.text.borrow()
    }
}
impl Png_CompressedTextChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Png_CompressedTextChunk {
    pub fn text_raw(&self) -> Ref<'_, Vec<u8>> {
        self.text_raw.borrow()
    }
}
impl Png_CompressedTextChunk {
    pub fn text_raw_raw(&self) -> Ref<'_, Vec<u8>> {
        self.text_raw_raw.borrow()
    }
}

/**
 * \sa https://web.archive.org/web/20210302212148/https://discussion.evernote.com/forums/topic/88532-how-to-extract-annotation-information-from-annotated-evernoteskitch-images/#comment-451501 Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_EvernoteSkmfChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    json: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Png_EvernoteSkmfChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        *self_rc.json.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Png_EvernoteSkmfChunk {
}

/**
 * JSON document with information about editable annotations (text,
 * lines, paths, etc.) in Evernote/Skitch.
 * 
 * It refers to the original image stored in the `skRf` chunk (which
 * usually follows immediately after `skMf`) via the
 * `.children[0].children[0].uri` JSON property. This has the format
 * `"skitch+uuid:///$UUID"`, where `$UUID` is a random UUIDv4 value that
 * matches the `uuid` field in `evernote_skrf_chunk` (i.e. in the first
 * 16 bytes of the `skRf` chunk).
 */
impl Png_EvernoteSkmfChunk {
    pub fn json(&self) -> Ref<'_, String> {
        self.json.borrow()
    }
}
impl Png_EvernoteSkmfChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://web.archive.org/web/20210302212148/https://discussion.evernote.com/forums/topic/88532-how-to-extract-annotation-information-from-annotated-evernoteskitch-images/#comment-451501 Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_EvernoteSkrfChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    uuid: RefCell<Vec<u8>>,
    orig_img: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Png_EvernoteSkrfChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        *self_rc.uuid.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        *self_rc.orig_img.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl Png_EvernoteSkrfChunk {
}

/**
 * Random UUIDv4 value used to identify the image. It is referenced by
 * the `skMf` chunk - see the documentation for the `json` field in
 * `evernote_skmf_chunk`.
 */
impl Png_EvernoteSkrfChunk {
    pub fn uuid(&self) -> Ref<'_, Vec<u8>> {
        self.uuid.borrow()
    }
}

/**
 * The original source image without annotations. It's usually a PNG
 * image as well, but it can also be a JPEG or possibly other formats.
 */
impl Png_EvernoteSkrfChunk {
    pub fn orig_img(&self) -> Ref<'_, Vec<u8>> {
        self.orig_img.borrow()
    }
}
impl Png_EvernoteSkrfChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Exchangeable Image File (Exif) Profile (`eXIf`) chunk.
 * 
 * Only one `eXIf` chunk is allowed in a PNG datastream.
 * 
 * The `eXIf` chunk contains metadata concerning the original image data. If
 * the image has been edited subsequent to creation of the Exif profile, this
 * data might no longer apply to the PNG image data.
 * \sa https://www.w3.org/TR/png/#eXIf Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_ExifChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    exif: RefCell<OptRc<Exif>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Png_ExifChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        let t = Self::read_into::<_, Exif>(&*_io, None, None)?.into();
        *self_rc.exif.borrow_mut() = t;
        Ok(())
    }
}
impl Png_ExifChunk {
}
impl Png_ExifChunk {
    pub fn exif(&self) -> Ref<'_, OptRc<Exif>> {
        self.exif.borrow()
    }
}
impl Png_ExifChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://www.w3.org/TR/png/#fcTL-chunk Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_FrameControlChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    sequence_number: RefCell<u32>,
    width: RefCell<u32>,
    height: RefCell<u32>,
    x_offset: RefCell<u32>,
    y_offset: RefCell<u32>,
    delay_num: RefCell<u16>,
    delay_den: RefCell<u16>,
    dispose_op: RefCell<Png_DisposeOpValues>,
    blend_op: RefCell<Png_BlendOpValues>,
    _io: RefCell<BytesReader>,
    f_delay: Cell<bool>,
    delay: RefCell<f64>,
}
impl KStruct for Png_FrameControlChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        *self_rc.sequence_number.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.width.borrow_mut() = _io.read_u4be()?.into();
        if !(((*self_rc.width() as u32) >= (1 as u32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/frame_control_chunk/seq/1".to_string() }));
        }
        if !(*self_rc.width() <= *_r.ihdr().width()) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/frame_control_chunk/seq/1".to_string() }));
        }
        *self_rc.height.borrow_mut() = _io.read_u4be()?.into();
        if !(((*self_rc.height() as u32) >= (1 as u32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/frame_control_chunk/seq/2".to_string() }));
        }
        if !(*self_rc.height() <= *_r.ihdr().height()) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/frame_control_chunk/seq/2".to_string() }));
        }
        *self_rc.x_offset.borrow_mut() = _io.read_u4be()?.into();
        if !(((*self_rc.x_offset() as i32) <= (((*_r.ihdr().width() as u32) - (*self_rc.width() as u32)) as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/frame_control_chunk/seq/3".to_string() }));
        }
        *self_rc.y_offset.borrow_mut() = _io.read_u4be()?.into();
        if !(((*self_rc.y_offset() as i32) <= (((*_r.ihdr().height() as u32) - (*self_rc.height() as u32)) as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/frame_control_chunk/seq/4".to_string() }));
        }
        *self_rc.delay_num.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.delay_den.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.dispose_op.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.blend_op.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        Ok(())
    }
}
impl Png_FrameControlChunk {

    /**
     * Time to display this frame, in seconds
     */
    pub fn delay(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_delay.get() {
            return Ok(self.delay.borrow());
        }
        self.f_delay.set(true);
        *self.delay.borrow_mut() = (((*self.delay_num() as f64) / (if ((*self.delay_den() as u16) == (0 as u16)) { 100.0 } else { *self.delay_den() } as f64))) as f64;
        Ok(self.delay.borrow())
    }
}

/**
 * Sequence number of the animation chunk, starting from 0.
 * 
 * The `fcTL` and `fdAT` chunks have a 4-byte sequence number. Both chunk
 * types share the sequence. The purpose of this number is to detect (and
 * optionally correct) sequence errors in an Animated PNG, since the PNG
 * specification does not impose ordering restrictions on ancillary
 * chunks (which means that a PNG editor is technically allowed to
 * reorder them arbitrarily, see [14.2 Behavior of PNG
 * editors](https://www.w3.org/TR/png/#14Ordering) in the spec).
 * 
 * The first `fcTL` chunk must contain sequence number 0, and the
 * sequence numbers in the remaining `fcTL` and `fdAT` chunks must be in
 * ascending order, with no gaps or duplicates.
 */
impl Png_FrameControlChunk {
    pub fn sequence_number(&self) -> Ref<'_, u32> {
        self.sequence_number.borrow()
    }
}

/**
 * Width of the following frame
 */
impl Png_FrameControlChunk {
    pub fn width(&self) -> Ref<'_, u32> {
        self.width.borrow()
    }
}

/**
 * Height of the following frame
 */
impl Png_FrameControlChunk {
    pub fn height(&self) -> Ref<'_, u32> {
        self.height.borrow()
    }
}

/**
 * X position at which to render the following frame
 */
impl Png_FrameControlChunk {
    pub fn x_offset(&self) -> Ref<'_, u32> {
        self.x_offset.borrow()
    }
}

/**
 * Y position at which to render the following frame
 */
impl Png_FrameControlChunk {
    pub fn y_offset(&self) -> Ref<'_, u32> {
        self.y_offset.borrow()
    }
}

/**
 * Frame delay fraction numerator
 */
impl Png_FrameControlChunk {
    pub fn delay_num(&self) -> Ref<'_, u16> {
        self.delay_num.borrow()
    }
}

/**
 * Frame delay fraction denominator
 */
impl Png_FrameControlChunk {
    pub fn delay_den(&self) -> Ref<'_, u16> {
        self.delay_den.borrow()
    }
}

/**
 * Type of frame area disposal to be done after rendering this frame
 */
impl Png_FrameControlChunk {
    pub fn dispose_op(&self) -> Ref<'_, Png_DisposeOpValues> {
        self.dispose_op.borrow()
    }
}

/**
 * Type of frame area rendering for this frame
 */
impl Png_FrameControlChunk {
    pub fn blend_op(&self) -> Ref<'_, Png_BlendOpValues> {
        self.blend_op.borrow()
    }
}
impl Png_FrameControlChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://www.w3.org/TR/png/#fdAT-chunk Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_FrameDataChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    sequence_number: RefCell<u32>,
    frame_data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Png_FrameDataChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        *self_rc.sequence_number.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.frame_data.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl Png_FrameDataChunk {
}

/**
 * Sequence number of the animation chunk, starting from 0.
 * 
 * The `fcTL` and `fdAT` chunks have a 4-byte sequence number. Both chunk
 * types share the sequence. The purpose of this number is to detect (and
 * optionally correct) sequence errors in an Animated PNG, since the PNG
 * specification does not impose ordering restrictions on ancillary
 * chunks (which means that a PNG editor is technically allowed to
 * reorder them arbitrarily, see [14.2 Behavior of PNG
 * editors](https://www.w3.org/TR/png/#14Ordering) in the spec).
 * 
 * The first `fcTL` chunk must contain sequence number 0, and the
 * sequence numbers in the remaining `fcTL` and `fdAT` chunks must be in
 * ascending order, with no gaps or duplicates.
 */
impl Png_FrameDataChunk {
    pub fn sequence_number(&self) -> Ref<'_, u32> {
        self.sequence_number.borrow()
    }
}

/**
 * Frame data for the frame. At least one `fdAT` chunk is required for
 * each frame, except for the first frame, if that frame is represented
 * by an `IDAT` chunk. The compressed datastream for each frame is the
 * concatenation of the contents of the data fields of all the `fdAT`
 * chunks within a frame.
 */
impl Png_FrameDataChunk {
    pub fn frame_data(&self) -> Ref<'_, Vec<u8>> {
        self.frame_data.borrow()
    }
}
impl Png_FrameDataChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://www.w3.org/TR/png/#11gAMA Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_GamaChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    gamma_int: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_gamma: Cell<bool>,
    gamma: RefCell<f64>,
    f_inv_gamma: Cell<bool>,
    inv_gamma: RefCell<f64>,
}
impl KStruct for Png_GamaChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        *self_rc.gamma_int.borrow_mut() = _io.read_u4be()?.into();
        let _tmpa = *self_rc.gamma_int();
        if !(((_tmpa as u32) != (0 as u32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/gama_chunk/seq/0".to_string() }));
        }
        Ok(())
    }
}
impl Png_GamaChunk {

    /**
     * Image gamma, typically 0.45455 = 1/2.2
     */
    pub fn gamma(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_gamma.get() {
            return Ok(self.gamma.borrow());
        }
        self.f_gamma.set(true);
        *self.gamma.borrow_mut() = (((*self.gamma_int() as f64) / (100000.0 as f64))) as f64;
        Ok(self.gamma.borrow())
    }

    /**
     * Inverse of the image gamma (1 / gamma), typically 2.2 (not considering
     * rounding)
     */
    pub fn inv_gamma(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_inv_gamma.get() {
            return Ok(self.inv_gamma.borrow());
        }
        self.f_inv_gamma.set(true);
        *self.inv_gamma.borrow_mut() = (((100000.0 as f64) / (*self.gamma_int() as f64))) as f64;
        Ok(self.inv_gamma.borrow())
    }
}

/**
 * Image gamma multiplied by 100000 (a gamma value of 1/2.2 is stored as
 * 45455)
 */
impl Png_GamaChunk {
    pub fn gamma_int(&self) -> Ref<'_, u32> {
        self.gamma_int.borrow()
    }
}
impl Png_GamaChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Image histogram (`hIST`) chunk gives the approximate usage frequency of
 * each color in the palette. A histogram chunk can appear only when a `PLTE`
 * chunk appears.
 * \sa https://www.w3.org/TR/png/#11hIST Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_HistChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    usage_freqs: RefCell<Vec<u16>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Png_HistChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        *self_rc.usage_freqs.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.usage_freqs.borrow_mut().push(_io.read_u2be()?.into());
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Png_HistChunk {
}

/**
 * Usage frequencies of each color in the palette.
 * 
 * There must be exactly one entry for each entry in the `PLTE` chunk. Each
 * entry is proportional to the fraction of pixels in the image that have
 * that palette index; the exact scale factor is chosen by the encoder.
 * 
 * Histogram entries are approximate, with the exception that a zero
 * entry specifies that the corresponding palette entry is not used at
 * all in the image. A histogram entry must be nonzero if there are any
 * pixels of that color.
 */
impl Png_HistChunk {
    pub fn usage_freqs(&self) -> Ref<'_, Vec<u16>> {
        self.usage_freqs.borrow()
    }
}
impl Png_HistChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Embedded ICC profile (`iCCP`) chunk.
 * 
 * If the `iCCP` chunk is present, the image samples conform to the color
 * space represented by the embedded ICC profile as defined by the
 * International Color Consortium.
 * 
 * This chunk is ignored unless it is the [highest-precedence color
 * chunk](https://www.w3.org/TR/png/#color-chunk-precendence) understood by
 * the decoder. Unless a `cICP` chunk exists, a PNG datastream should contain
 * at most one embedded profile, whether specified explicitly with an `iCCP`
 * or implicitly with an `sRGB` chunk.
 * 
 * It is recommended that the `sRGB` and `iCCP` chunks do not appear
 * simultaneously in a PNG datastream.
 * \sa https://www.w3.org/TR/png/#11iCCP Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_IccpChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    profile_name: RefCell<String>,
    compression_method: RefCell<Png_CompressionMethods>,
    profile: RefCell<OptRc<Icc4>>,
    _io: RefCell<BytesReader>,
    profile_raw: RefCell<Vec<u8>>,
    profile_raw_raw: RefCell<Vec<u8>>,
}
impl KStruct for Png_IccpChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        *self_rc.profile_name.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ISO-8859-1")?;
        *self_rc.compression_method.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        if !(*self_rc.compression_method() == Png_CompressionMethods::Zlib) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/iccp_chunk/seq/1".to_string() }));
        }
        *self_rc.profile_raw_raw.borrow_mut() = _io.read_bytes_full()?.into();
        *self_rc.profile_raw.borrow_mut() = process_zlib(&self_rc.profile_raw_raw.borrow()).map_err(|msg| KError::BytesDecodingError { msg })?;
        let profile_raw = self_rc.profile_raw.borrow();
        let _t_profile_raw_io = BytesReader::from(profile_raw.clone());
        let t = Self::read_into::<BytesReader, Icc4>(&_t_profile_raw_io, None, None)?.into();
        *self_rc.profile.borrow_mut() = t;
        Ok(())
    }
}
impl Png_IccpChunk {
}

/**
 * Any convenient name for referring to the profile. It is
 * case-sensitive.
 * 
 * Profile names must contain only printable ISO-8859-1 (Latin-1)
 * characters and spaces; that is, only code points 0x20-0x7E and
 * 0xA1-0xFF are allowed. Leading, trailing, and consecutive spaces are
 * not permitted.
 */
impl Png_IccpChunk {
    pub fn profile_name(&self) -> Ref<'_, String> {
        self.profile_name.borrow()
    }
}
impl Png_IccpChunk {
    pub fn compression_method(&self) -> Ref<'_, Png_CompressionMethods> {
        self.compression_method.borrow()
    }
}

/**
 * Embedded ICC profile.
 * 
 * The color space of the ICC profile must be:
 * 
 * * an RGB color space for color images (color types
 *   `color_type::truecolor` = 2, `color_type::indexed` = 3, and
 *   `color_type::truecolor_alpha` = 6), or
 * * a greyscale color space for greyscale images (color types
 *   `color_type::greyscale` = 0 and `color_type::greyscale_alpha` = 4).
 * 
 * Note that the imported `icc_4.ksy` spec currently in use here supports
 * only the ICC.1 v4 specification (as the name suggests), not ICC.1 v2.
 * This means that PNG files with an embedded v2 profile (for example
 * https://github.com/web-platform-tests/wpt/blob/495d9d7716298588ff49d6e701bf27c5134bde06/css/css-color/support/swap-990000-iCCP.png)
 * will fail to parse.
 * 
 * TODO: extend `icc_4.ksy` to support both v4 and v2 profiles, rename it
 * to `icc.ksy`, and use it here.
 */
impl Png_IccpChunk {
    pub fn profile(&self) -> Ref<'_, OptRc<Icc4>> {
        self.profile.borrow()
    }
}
impl Png_IccpChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Png_IccpChunk {
    pub fn profile_raw(&self) -> Ref<'_, Vec<u8>> {
        self.profile_raw.borrow()
    }
}
impl Png_IccpChunk {
    pub fn profile_raw_raw(&self) -> Ref<'_, Vec<u8>> {
        self.profile_raw_raw.borrow()
    }
}

/**
 * \sa https://www.w3.org/TR/png/#11IHDR Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_IhdrChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png>,
    pub _self: SharedType<Self>,
    width: RefCell<u32>,
    height: RefCell<u32>,
    bit_depth: RefCell<u8>,
    color_type: RefCell<Png_ColorType>,
    compression_method: RefCell<Png_CompressionMethods>,
    filter_method: RefCell<Png_FilterMethod>,
    interlace_method: RefCell<Png_InterlaceMethod>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Png_IhdrChunk {
    type Root = Png;
    type Parent = Png;

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
        *self_rc.width.borrow_mut() = _io.read_u4be()?.into();
        if !(((*self_rc.width() as u32) >= (1 as u32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/ihdr_chunk/seq/0".to_string() }));
        }
        *self_rc.height.borrow_mut() = _io.read_u4be()?.into();
        if !(((*self_rc.height() as u32) >= (1 as u32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/ihdr_chunk/seq/1".to_string() }));
        }
        *self_rc.bit_depth.borrow_mut() = _io.read_u1()?.into();
        if !( ((((*self_rc.bit_depth() as u8) == (1 as u8))) || (((*self_rc.bit_depth() as u8) == (2 as u8))) || (((*self_rc.bit_depth() as u8) == (4 as u8))) || (((*self_rc.bit_depth() as u8) == (8 as u8))) || (((*self_rc.bit_depth() as u8) == (16 as u8)))) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotAnyOf, src_path: "/types/ihdr_chunk/seq/2".to_string() }));
        }
        *self_rc.color_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.compression_method.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.filter_method.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.interlace_method.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        Ok(())
    }
}
impl Png_IhdrChunk {
}
impl Png_IhdrChunk {
    pub fn width(&self) -> Ref<'_, u32> {
        self.width.borrow()
    }
}
impl Png_IhdrChunk {
    pub fn height(&self) -> Ref<'_, u32> {
        self.height.borrow()
    }
}
impl Png_IhdrChunk {
    pub fn bit_depth(&self) -> Ref<'_, u8> {
        self.bit_depth.borrow()
    }
}
impl Png_IhdrChunk {
    pub fn color_type(&self) -> Ref<'_, Png_ColorType> {
        self.color_type.borrow()
    }
}
impl Png_IhdrChunk {
    pub fn compression_method(&self) -> Ref<'_, Png_CompressionMethods> {
        self.compression_method.borrow()
    }
}
impl Png_IhdrChunk {
    pub fn filter_method(&self) -> Ref<'_, Png_FilterMethod> {
        self.filter_method.borrow()
    }
}
impl Png_IhdrChunk {
    pub fn interlace_method(&self) -> Ref<'_, Png_InterlaceMethod> {
        self.interlace_method.borrow()
    }
}
impl Png_IhdrChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Png_InternationalText {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_InternationalTextChunk>,
    pub _self: SharedType<Self>,
    value: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Png_InternationalText {
    type Root = Png;
    type Parent = Png_InternationalTextChunk;

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
        *self_rc.value.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Png_InternationalText {
}

/**
 * Text string (the "value" of this key-value pair), written in language
 * specified in `_parent.language_tag`.
 * 
 * Although it is not null-terminated (unlike other textual data in the
 * `iTXt` chunk), it must not contain a zero byte
 * (U+0000 NULL character). A newline should be represented by a single
 * U+000A LINE FEED (LF) character (aka `\n`). The remaining control
 * characters (U+0001..U+0009, U+000B..0+001F, U+007F..U+009F) are
 * discouraged.
 */
impl Png_InternationalText {
    pub fn value(&self) -> Ref<'_, String> {
        self.value.borrow()
    }
}
impl Png_InternationalText {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * International textual data (`iTXt`) chunk effectively allows you to store
 * key-value string pairs in the PNG container.
 * 
 * The "key" part (`keyword`) is restricted to printable ISO-8859-1 (Latin-1)
 * characters and spaces. The translated keyword and the "value" part
 * (`text`) are stored in UTF-8 and thus can store text in any language -
 * this language can be indicated via the language tag (`language_tag`).
 * \sa https://www.w3.org/TR/png/#11iTXt Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_InternationalTextChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    keyword: RefCell<String>,
    compression_flag: RefCell<u8>,
    compression_method: RefCell<Png_CompressionMethods>,
    language_tag: RefCell<String>,
    translated_keyword: RefCell<String>,
    text_plain: RefCell<OptRc<Png_InternationalText>>,
    text_zlib: RefCell<OptRc<Png_InternationalText>>,
    _io: RefCell<BytesReader>,
    text_plain_raw: RefCell<Vec<u8>>,
    text_zlib_raw: RefCell<Vec<u8>>,
    text_zlib_raw_raw: RefCell<Vec<u8>>,
    f_text: Cell<bool>,
    text: RefCell<String>,
}
impl KStruct for Png_InternationalTextChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        *self_rc.keyword.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ISO-8859-1")?;
        *self_rc.compression_flag.borrow_mut() = _io.read_u1()?.into();
        if !( ((((*self_rc.compression_flag() as u8) == (0 as u8))) || (((*self_rc.compression_flag() as u8) == (1 as u8)))) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotAnyOf, src_path: "/types/international_text_chunk/seq/1".to_string() }));
        }
        *self_rc.compression_method.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        if !(*self_rc.compression_method() == if ((*self_rc.compression_flag() as u8) == (1 as u8)) { Png_CompressionMethods::Zlib.clone() } else { self_rc.compression_method().clone() }) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/international_text_chunk/seq/2".to_string() }));
        }
        *self_rc.language_tag.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?;
        *self_rc.translated_keyword.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?;
        if ((*self_rc.compression_flag() as u8) == (0 as u8)) {
            *self_rc.text_plain_raw.borrow_mut() = _io.read_bytes_full()?.into();
            let text_plain_raw = self_rc.text_plain_raw.borrow();
            let _t_text_plain_raw_io = BytesReader::from(text_plain_raw.clone());
            let t = Self::read_into::<BytesReader, Png_InternationalText>(&_t_text_plain_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.text_plain.borrow_mut() = t;
        }
        if ((*self_rc.compression_flag() as u8) == (1 as u8)) {
            *self_rc.text_zlib_raw_raw.borrow_mut() = _io.read_bytes_full()?.into();
            *self_rc.text_zlib_raw.borrow_mut() = process_zlib(&self_rc.text_zlib_raw_raw.borrow()).map_err(|msg| KError::BytesDecodingError { msg })?;
            let text_zlib_raw = self_rc.text_zlib_raw.borrow();
            let _t_text_zlib_raw_io = BytesReader::from(text_zlib_raw.clone());
            let t = Self::read_into::<BytesReader, Png_InternationalText>(&_t_text_zlib_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.text_zlib.borrow_mut() = t;
        }
        Ok(())
    }
}
impl Png_InternationalTextChunk {

    /**
     * Text string (the "value" of this key-value pair), written in language
     * specified in `language_tag`.
     * 
     * Although it is not null-terminated (unlike other textual data in the
     * `iTXt` chunk), it must not contain a zero byte
     * (U+0000 NULL character). A newline should be represented by a single
     * U+000A LINE FEED (LF) character (aka `\n`). The remaining control
     * characters (U+0001..U+0009, U+000B..0+001F, U+007F..U+009F) are
     * discouraged.
     */
    pub fn text(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_text.get() {
            return Ok(self.text.borrow());
        }
        self.f_text.set(true);
        *self.text.borrow_mut() = if ((*self.compression_flag() as u8) == (0 as u8)) { self.text_plain().clone() } else { self.text_zlib().clone() }.value().to_string();
        Ok(self.text.borrow())
    }
}

/**
 * Indicates the type of information represented by the text string.
 * 
 * Keywords must consist exclusively of printable ISO-8859-1 (Latin-1)
 * characters and spaces; that is, only code points 0x20-0x7E and
 * 0xA1-0xFF are allowed. To reduce the chances for human misreading of a
 * keyword, leading spaces, trailing spaces, and consecutive spaces are
 * not permitted.
 * \sa https://www.w3.org/TR/2025/REC-png-3-20250624/#11keywords Source
 */
impl Png_InternationalTextChunk {
    pub fn keyword(&self) -> Ref<'_, String> {
        self.keyword.borrow()
    }
}

/**
 * 0 = text is uncompressed, 1 = text is compressed with a
 * method specified in `compression_method`.
 */
impl Png_InternationalTextChunk {
    pub fn compression_flag(&self) -> Ref<'_, u8> {
        self.compression_flag.borrow()
    }
}
impl Png_InternationalTextChunk {
    pub fn compression_method(&self) -> Ref<'_, Png_CompressionMethods> {
        self.compression_method.borrow()
    }
}

/**
 * Human language used in the `translated_keyword` and `text` fields.
 * 
 * From the [official
 * specification](https://www.w3.org/TR/2025/REC-png-3-20250624/#11iTXt):
 * 
 * > The language tag is a well-formed language tag defined by [RFC 5646:
 * > BCP 47: Tags for Identifying
 * > Languages](https://www.rfc-editor.org/info/rfc5646/). Unlike the
 * > keyword, the language tag is case-insensitive. Subtags must appear
 * > in the [IANA language subtag
 * > registry](https://www.iana.org/assignments/language-subtag-registry/language-subtag-registry).
 * > If the language tag is empty, the language is unspecified. Examples
 * > of language tags include: `en`, `en-GB`, `es-419`, `zh-Hans`,
 * > `zh-Hans-CN`, `tlh-Cyrl-AQ`, `ar-AE-u-nu-latn`, and `x-private`.
 */
impl Png_InternationalTextChunk {
    pub fn language_tag(&self) -> Ref<'_, String> {
        self.language_tag.borrow()
    }
}

/**
 * The keyword (`keyword`) translated into the language specified in
 * `language_tag`.
 * 
 * It must not contain a zero byte (U+0000 NULL character). Line breaks
 * should not appear. The remaining control characters (U+0001..U+0009,
 * U+000B..0+001F, U+007F..U+009F) are discouraged.
 */
impl Png_InternationalTextChunk {
    pub fn translated_keyword(&self) -> Ref<'_, String> {
        self.translated_keyword.borrow()
    }
}
impl Png_InternationalTextChunk {
    pub fn text_plain(&self) -> Ref<'_, OptRc<Png_InternationalText>> {
        self.text_plain.borrow()
    }
}
impl Png_InternationalTextChunk {
    pub fn text_zlib(&self) -> Ref<'_, OptRc<Png_InternationalText>> {
        self.text_zlib.borrow()
    }
}
impl Png_InternationalTextChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Png_InternationalTextChunk {
    pub fn text_plain_raw(&self) -> Ref<'_, Vec<u8>> {
        self.text_plain_raw.borrow()
    }
}
impl Png_InternationalTextChunk {
    pub fn text_zlib_raw(&self) -> Ref<'_, Vec<u8>> {
        self.text_zlib_raw.borrow()
    }
}
impl Png_InternationalTextChunk {
    pub fn text_zlib_raw_raw(&self) -> Ref<'_, Vec<u8>> {
        self.text_zlib_raw_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Png_MdcvChromaticity {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_MdcvChunk>,
    pub _self: SharedType<Self>,
    x_int: RefCell<u16>,
    y_int: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_x: Cell<bool>,
    x: RefCell<f64>,
    f_y: Cell<bool>,
    y: RefCell<f64>,
}
impl KStruct for Png_MdcvChromaticity {
    type Root = Png;
    type Parent = Png_MdcvChunk;

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
        *self_rc.x_int.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.y_int.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl Png_MdcvChromaticity {
    pub fn x(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_x.get() {
            return Ok(self.x.borrow());
        }
        self.f_x.set(true);
        *self.x.borrow_mut() = (((*self.x_int() as f64) * (0.00002 as f64))) as f64;
        Ok(self.x.borrow())
    }
    pub fn y(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_y.get() {
            return Ok(self.y.borrow());
        }
        self.f_y.set(true);
        *self.y.borrow_mut() = (((*self.y_int() as f64) * (0.00002 as f64))) as f64;
        Ok(self.y.borrow())
    }
}
impl Png_MdcvChromaticity {
    pub fn x_int(&self) -> Ref<'_, u16> {
        self.x_int.borrow()
    }
}
impl Png_MdcvChromaticity {
    pub fn y_int(&self) -> Ref<'_, u16> {
        self.y_int.borrow()
    }
}
impl Png_MdcvChromaticity {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://www.w3.org/TR/png/#mDCV-chunk Source
 * \sa https://w3c.github.io/png/Implementation_Report_3e/#mastering Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_MdcvChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    red: RefCell<OptRc<Png_MdcvChromaticity>>,
    green: RefCell<OptRc<Png_MdcvChromaticity>>,
    blue: RefCell<OptRc<Png_MdcvChromaticity>>,
    white_point: RefCell<OptRc<Png_MdcvChromaticity>>,
    max_luminance_int: RefCell<u32>,
    min_luminance_int: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_max_luminance: Cell<bool>,
    max_luminance: RefCell<f64>,
    f_min_luminance: Cell<bool>,
    min_luminance: RefCell<f64>,
}
impl KStruct for Png_MdcvChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        let t = Self::read_into::<_, Png_MdcvChromaticity>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.red.borrow_mut() = t;
        let t = Self::read_into::<_, Png_MdcvChromaticity>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.green.borrow_mut() = t;
        let t = Self::read_into::<_, Png_MdcvChromaticity>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.blue.borrow_mut() = t;
        let t = Self::read_into::<_, Png_MdcvChromaticity>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.white_point.borrow_mut() = t;
        *self_rc.max_luminance_int.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.min_luminance_int.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl Png_MdcvChunk {

    /**
     * Maximum luminance in cd/m^2
     */
    pub fn max_luminance(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_max_luminance.get() {
            return Ok(self.max_luminance.borrow());
        }
        self.f_max_luminance.set(true);
        *self.max_luminance.borrow_mut() = (((*self.max_luminance_int() as f64) * (0.0001 as f64))) as f64;
        Ok(self.max_luminance.borrow())
    }

    /**
     * Minimum luminance in cd/m^2
     */
    pub fn min_luminance(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_min_luminance.get() {
            return Ok(self.min_luminance.borrow());
        }
        self.f_min_luminance.set(true);
        *self.min_luminance.borrow_mut() = (((*self.min_luminance_int() as f64) * (0.0001 as f64))) as f64;
        Ok(self.min_luminance.borrow())
    }
}
impl Png_MdcvChunk {
    pub fn red(&self) -> Ref<'_, OptRc<Png_MdcvChromaticity>> {
        self.red.borrow()
    }
}
impl Png_MdcvChunk {
    pub fn green(&self) -> Ref<'_, OptRc<Png_MdcvChromaticity>> {
        self.green.borrow()
    }
}
impl Png_MdcvChunk {
    pub fn blue(&self) -> Ref<'_, OptRc<Png_MdcvChromaticity>> {
        self.blue.borrow()
    }
}
impl Png_MdcvChunk {
    pub fn white_point(&self) -> Ref<'_, OptRc<Png_MdcvChromaticity>> {
        self.white_point.borrow()
    }
}
impl Png_MdcvChunk {
    pub fn max_luminance_int(&self) -> Ref<'_, u32> {
        self.max_luminance_int.borrow()
    }
}
impl Png_MdcvChunk {
    pub fn min_luminance_int(&self) -> Ref<'_, u32> {
        self.min_luminance_int.borrow()
    }
}
impl Png_MdcvChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Physical pixel dimensions (`pHYs`) chunk specifies the intended physical
 * size of the pixels (in meters) or pixel aspect ratio for display of the
 * image.
 * \sa https://www.w3.org/TR/png/#11pHYs Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_PhysChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    pixels_per_unit_x: RefCell<u32>,
    pixels_per_unit_y: RefCell<u32>,
    unit: RefCell<Png_PhysUnit>,
    _io: RefCell<BytesReader>,
    f_dots_per_inch_x: Cell<bool>,
    dots_per_inch_x: RefCell<f64>,
    f_dots_per_inch_y: Cell<bool>,
    dots_per_inch_y: RefCell<f64>,
}
impl KStruct for Png_PhysChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        *self_rc.pixels_per_unit_x.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.pixels_per_unit_y.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.unit.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        Ok(())
    }
}
impl Png_PhysChunk {

    /**
     * Horizontal resolution (DPI)
     */
    pub fn dots_per_inch_x(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_dots_per_inch_x.get() {
            return Ok(self.dots_per_inch_x.borrow());
        }
        self.f_dots_per_inch_x.set(true);
        if *self.unit() == Png_PhysUnit::Meter {
            *self.dots_per_inch_x.borrow_mut() = (((*self.pixels_per_unit_x() as f64) * (0.0254 as f64))) as f64;
        }
        Ok(self.dots_per_inch_x.borrow())
    }

    /**
     * Vertical resolution (DPI)
     */
    pub fn dots_per_inch_y(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_dots_per_inch_y.get() {
            return Ok(self.dots_per_inch_y.borrow());
        }
        self.f_dots_per_inch_y.set(true);
        if *self.unit() == Png_PhysUnit::Meter {
            *self.dots_per_inch_y.borrow_mut() = (((*self.pixels_per_unit_y() as f64) * (0.0254 as f64))) as f64;
        }
        Ok(self.dots_per_inch_y.borrow())
    }
}

/**
 * Number of pixels per physical unit (typically, 1 meter) by X
 * axis.
 */
impl Png_PhysChunk {
    pub fn pixels_per_unit_x(&self) -> Ref<'_, u32> {
        self.pixels_per_unit_x.borrow()
    }
}

/**
 * Number of pixels per physical unit (typically, 1 meter) by Y
 * axis.
 */
impl Png_PhysChunk {
    pub fn pixels_per_unit_y(&self) -> Ref<'_, u32> {
        self.pixels_per_unit_y.borrow()
    }
}
impl Png_PhysChunk {
    pub fn unit(&self) -> Ref<'_, Png_PhysUnit> {
        self.unit.borrow()
    }
}
impl Png_PhysChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://www.w3.org/TR/png/#11PLTE Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_PlteChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<Png_Rgb>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Png_PlteChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Png_Rgb>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Png_PlteChunk {
}
impl Png_PlteChunk {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Png_Rgb>>> {
        self.entries.borrow()
    }
}
impl Png_PlteChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Png_Rgb {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_PlteChunk>,
    pub _self: SharedType<Self>,
    r: RefCell<u8>,
    g: RefCell<u8>,
    b: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Png_Rgb {
    type Root = Png;
    type Parent = Png_PlteChunk;

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
        Ok(())
    }
}
impl Png_Rgb {
}
impl Png_Rgb {
    pub fn r(&self) -> Ref<'_, u8> {
        self.r.borrow()
    }
}
impl Png_Rgb {
    pub fn g(&self) -> Ref<'_, u8> {
        self.g.borrow()
    }
}
impl Png_Rgb {
    pub fn b(&self) -> Ref<'_, u8> {
        self.b.borrow()
    }
}
impl Png_Rgb {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Significant bits (`sBIT`) chunk stores the original number of significant
 * bits of the sample values (which can be less than or equal to the sample
 * depth). This allows PNG decoders to recover the original data losslessly
 * even if the data had a sample depth not directly supported by PNG.
 * \sa https://www.w3.org/TR/png/#11sBIT Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_SbitChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    significant_bits: RefCell<Option<Png_SbitChunk_SignificantBits>>,
    _io: RefCell<BytesReader>,
    f_sample_depth: Cell<bool>,
    sample_depth: RefCell<u8>,
}
#[derive(Debug, Clone)]
pub enum Png_SbitChunk_SignificantBits {
    Png_SbitGreyscale(OptRc<Png_SbitGreyscale>),
    Png_SbitTruecolor(OptRc<Png_SbitTruecolor>),
}
impl From<&Png_SbitChunk_SignificantBits> for OptRc<Png_SbitGreyscale> {
    fn from(v: &Png_SbitChunk_SignificantBits) -> Self {
        if let Png_SbitChunk_SignificantBits::Png_SbitGreyscale(x) = v {
            return x.clone();
        }
        panic!("expected Png_SbitChunk_SignificantBits::Png_SbitGreyscale, got {:?}", v)
    }
}
impl From<OptRc<Png_SbitGreyscale>> for Png_SbitChunk_SignificantBits {
    fn from(v: OptRc<Png_SbitGreyscale>) -> Self {
        Self::Png_SbitGreyscale(v)
    }
}
impl From<&Png_SbitChunk_SignificantBits> for OptRc<Png_SbitTruecolor> {
    fn from(v: &Png_SbitChunk_SignificantBits) -> Self {
        if let Png_SbitChunk_SignificantBits::Png_SbitTruecolor(x) = v {
            return x.clone();
        }
        panic!("expected Png_SbitChunk_SignificantBits::Png_SbitTruecolor, got {:?}", v)
    }
}
impl From<OptRc<Png_SbitTruecolor>> for Png_SbitChunk_SignificantBits {
    fn from(v: OptRc<Png_SbitTruecolor>) -> Self {
        Self::Png_SbitTruecolor(v)
    }
}
impl KStruct for Png_SbitChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        match *_r.ihdr().color_type() {
            Png_ColorType::Greyscale => {
                let f = |t : &mut Png_SbitGreyscale| Ok(t.set_params(false));
                let t = Self::read_into_with_init::<_, Png_SbitGreyscale>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.significant_bits.borrow_mut() = Some(t);
            }
            Png_ColorType::GreyscaleAlpha => {
                let f = |t : &mut Png_SbitGreyscale| Ok(t.set_params(true));
                let t = Self::read_into_with_init::<_, Png_SbitGreyscale>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.significant_bits.borrow_mut() = Some(t);
            }
            Png_ColorType::Indexed => {
                let f = |t : &mut Png_SbitTruecolor| Ok(t.set_params(false));
                let t = Self::read_into_with_init::<_, Png_SbitTruecolor>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.significant_bits.borrow_mut() = Some(t);
            }
            Png_ColorType::Truecolor => {
                let f = |t : &mut Png_SbitTruecolor| Ok(t.set_params(false));
                let t = Self::read_into_with_init::<_, Png_SbitTruecolor>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.significant_bits.borrow_mut() = Some(t);
            }
            Png_ColorType::TruecolorAlpha => {
                let f = |t : &mut Png_SbitTruecolor| Ok(t.set_params(true));
                let t = Self::read_into_with_init::<_, Png_SbitTruecolor>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.significant_bits.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Png_SbitChunk {
    pub fn sample_depth(
        &self
    ) -> KResult<Ref<'_, u8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_sample_depth.get() {
            return Ok(self.sample_depth.borrow());
        }
        self.f_sample_depth.set(true);
        *self.sample_depth.borrow_mut() = (if *_r.ihdr().color_type() == Png_ColorType::Indexed { 8 } else { *_r.ihdr().bit_depth() }) as u8;
        Ok(self.sample_depth.borrow())
    }
}
impl Png_SbitChunk {
    pub fn significant_bits(&self) -> Ref<'_, Option<Png_SbitChunk_SignificantBits>> {
        self.significant_bits.borrow()
    }
}
impl Png_SbitChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Png_SbitGreyscale {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_SbitChunk>,
    pub _self: SharedType<Self>,
    has_alpha: RefCell<bool>,
    grey: RefCell<u8>,
    alpha: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Png_SbitGreyscale {
    type Root = Png;
    type Parent = Png_SbitChunk;

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
        *self_rc.grey.borrow_mut() = _io.read_u1()?.into();
        if !(((*self_rc.grey() as u8) >= (1 as u8))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/sbit_greyscale/seq/0".to_string() }));
        }
        if !(*self_rc.grey() <= *_prc.as_ref().unwrap().sample_depth()?) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/sbit_greyscale/seq/0".to_string() }));
        }
        if *self_rc.has_alpha() {
            *self_rc.alpha.borrow_mut() = _io.read_u1()?.into();
            if !(((*self_rc.alpha() as u8) >= (1 as u8))) {
                return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/sbit_greyscale/seq/1".to_string() }));
            }
            if !(*self_rc.alpha() <= *_prc.as_ref().unwrap().sample_depth()?) {
                return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/sbit_greyscale/seq/1".to_string() }));
            }
        }
        Ok(())
    }
}
impl Png_SbitGreyscale {
    pub fn has_alpha(&self) -> Ref<'_, bool> {
        self.has_alpha.borrow()
    }
}
impl Png_SbitGreyscale {
    pub fn set_params(&mut self, has_alpha: bool) {
        *self.has_alpha.borrow_mut() = has_alpha;
    }
}
impl Png_SbitGreyscale {
}
impl Png_SbitGreyscale {
    pub fn grey(&self) -> Ref<'_, u8> {
        self.grey.borrow()
    }
}
impl Png_SbitGreyscale {
    pub fn alpha(&self) -> Ref<'_, u8> {
        self.alpha.borrow()
    }
}
impl Png_SbitGreyscale {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Png_SbitTruecolor {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_SbitChunk>,
    pub _self: SharedType<Self>,
    has_alpha: RefCell<bool>,
    red: RefCell<u8>,
    green: RefCell<u8>,
    blue: RefCell<u8>,
    alpha: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Png_SbitTruecolor {
    type Root = Png;
    type Parent = Png_SbitChunk;

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
        *self_rc.red.borrow_mut() = _io.read_u1()?.into();
        if !(((*self_rc.red() as u8) >= (1 as u8))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/sbit_truecolor/seq/0".to_string() }));
        }
        if !(*self_rc.red() <= *_prc.as_ref().unwrap().sample_depth()?) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/sbit_truecolor/seq/0".to_string() }));
        }
        *self_rc.green.borrow_mut() = _io.read_u1()?.into();
        if !(((*self_rc.green() as u8) >= (1 as u8))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/sbit_truecolor/seq/1".to_string() }));
        }
        if !(*self_rc.green() <= *_prc.as_ref().unwrap().sample_depth()?) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/sbit_truecolor/seq/1".to_string() }));
        }
        *self_rc.blue.borrow_mut() = _io.read_u1()?.into();
        if !(((*self_rc.blue() as u8) >= (1 as u8))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/sbit_truecolor/seq/2".to_string() }));
        }
        if !(*self_rc.blue() <= *_prc.as_ref().unwrap().sample_depth()?) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/sbit_truecolor/seq/2".to_string() }));
        }
        if *self_rc.has_alpha() {
            *self_rc.alpha.borrow_mut() = _io.read_u1()?.into();
            if !(((*self_rc.alpha() as u8) >= (1 as u8))) {
                return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/sbit_truecolor/seq/3".to_string() }));
            }
            if !(*self_rc.alpha() <= *_prc.as_ref().unwrap().sample_depth()?) {
                return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/sbit_truecolor/seq/3".to_string() }));
            }
        }
        Ok(())
    }
}
impl Png_SbitTruecolor {
    pub fn has_alpha(&self) -> Ref<'_, bool> {
        self.has_alpha.borrow()
    }
}
impl Png_SbitTruecolor {
    pub fn set_params(&mut self, has_alpha: bool) {
        *self.has_alpha.borrow_mut() = has_alpha;
    }
}
impl Png_SbitTruecolor {
}
impl Png_SbitTruecolor {
    pub fn red(&self) -> Ref<'_, u8> {
        self.red.borrow()
    }
}
impl Png_SbitTruecolor {
    pub fn green(&self) -> Ref<'_, u8> {
        self.green.borrow()
    }
}
impl Png_SbitTruecolor {
    pub fn blue(&self) -> Ref<'_, u8> {
        self.blue.borrow()
    }
}
impl Png_SbitTruecolor {
    pub fn alpha(&self) -> Ref<'_, u8> {
        self.alpha.borrow()
    }
}
impl Png_SbitTruecolor {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Suggested palette (`sPLT`) chunk.
 * 
 * Multiple `sPLT` chunks are permitted, but each must have a different
 * palette name.
 * \sa https://www.w3.org/TR/png/#11sPLT Source
 * \sa https://www.w3.org/TR/png/#12Suggested-palettes Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_SpltChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    palette_name: RefCell<String>,
    sample_depth: RefCell<u8>,
    entries: RefCell<Vec<OptRc<Png_SpltEntry>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Png_SpltChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        *self_rc.palette_name.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ISO-8859-1")?;
        *self_rc.sample_depth.borrow_mut() = _io.read_u1()?.into();
        if !( ((((*self_rc.sample_depth() as u8) == (8 as u8))) || (((*self_rc.sample_depth() as u8) == (16 as u8)))) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotAnyOf, src_path: "/types/splt_chunk/seq/1".to_string() }));
        }
        *self_rc.entries.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Png_SpltEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Png_SpltChunk {
}

/**
 * Any convenient name for referring to the palette. It is
 * case-sensitive. The palette name may aid the choice of the appropriate
 * suggested palette when more than one appears in a PNG datastream.
 * 
 * Palette names must contain only printable ISO-8859-1 (Latin-1)
 * characters and spaces; that is, only code points 0x20-0x7E and
 * 0xA1-0xFF are allowed. Leading, trailing, and consecutive spaces are
 * not permitted.
 */
impl Png_SpltChunk {
    pub fn palette_name(&self) -> Ref<'_, String> {
        self.palette_name.borrow()
    }
}
impl Png_SpltChunk {
    pub fn sample_depth(&self) -> Ref<'_, u8> {
        self.sample_depth.borrow()
    }
}

/**
 * There may be any number of entries. Entries must appear "in decreasing
 * order of frequency" (note: strictly speaking, I think the W3C
 * specification actually meant "non-increasing"). There is no
 * requirement that the entries all be used by the image, nor that they
 * all be different.
 * 
 * The color samples are not premultiplied by alpha, nor are they
 * precomposited against any background.
 * 
 * Entries in `sPLT` use the same gamma value and chromaticity values as
 * the PNG image, but may fall outside the range of values used in the
 * color space of the PNG image; for example, in a greyscale PNG image,
 * each `sPLT` entry would typically have equal red, green, and blue
 * values, but this is not required. Similarly, `sPLT` entries can have
 * non-opaque alpha values even when the PNG image does not use
 * transparency.
 */
impl Png_SpltChunk {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Png_SpltEntry>>> {
        self.entries.borrow()
    }
}
impl Png_SpltChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Png_SpltEntry {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_SpltChunk>,
    pub _self: SharedType<Self>,
    red: RefCell<Option<Png_SpltEntry_Red>>,
    green: RefCell<Option<Png_SpltEntry_Green>>,
    blue: RefCell<Option<Png_SpltEntry_Blue>>,
    alpha: RefCell<Option<Png_SpltEntry_Alpha>>,
    freq: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Png_SpltEntry_Red {
    U1(u8),
    U2(u16),
}
impl From<u8> for Png_SpltEntry_Red {
    fn from(v: u8) -> Self {
        Self::U1(v)
    }
}
impl From<&Png_SpltEntry_Red> for u8 {
    fn from(e: &Png_SpltEntry_Red) -> Self {
        if let Png_SpltEntry_Red::U1(v) = e {
            return *v
        }
        panic!("trying to convert from enum Png_SpltEntry_Red::U1 to u8, enum value {:?}", e)
    }
}
impl From<u16> for Png_SpltEntry_Red {
    fn from(v: u16) -> Self {
        Self::U2(v)
    }
}
impl From<&Png_SpltEntry_Red> for u16 {
    fn from(e: &Png_SpltEntry_Red) -> Self {
        if let Png_SpltEntry_Red::U2(v) = e {
            return *v
        }
        panic!("trying to convert from enum Png_SpltEntry_Red::U2 to u16, enum value {:?}", e)
    }
}
impl From<&Png_SpltEntry_Red> for usize {
    fn from(e: &Png_SpltEntry_Red) -> Self {
        match e {
            Png_SpltEntry_Red::U1(v) => *v as usize,
            Png_SpltEntry_Red::U2(v) => *v as usize,
        }
    }
}

#[derive(Debug, Clone)]
pub enum Png_SpltEntry_Green {
    U1(u8),
    U2(u16),
}
impl From<u8> for Png_SpltEntry_Green {
    fn from(v: u8) -> Self {
        Self::U1(v)
    }
}
impl From<&Png_SpltEntry_Green> for u8 {
    fn from(e: &Png_SpltEntry_Green) -> Self {
        if let Png_SpltEntry_Green::U1(v) = e {
            return *v
        }
        panic!("trying to convert from enum Png_SpltEntry_Green::U1 to u8, enum value {:?}", e)
    }
}
impl From<u16> for Png_SpltEntry_Green {
    fn from(v: u16) -> Self {
        Self::U2(v)
    }
}
impl From<&Png_SpltEntry_Green> for u16 {
    fn from(e: &Png_SpltEntry_Green) -> Self {
        if let Png_SpltEntry_Green::U2(v) = e {
            return *v
        }
        panic!("trying to convert from enum Png_SpltEntry_Green::U2 to u16, enum value {:?}", e)
    }
}
impl From<&Png_SpltEntry_Green> for usize {
    fn from(e: &Png_SpltEntry_Green) -> Self {
        match e {
            Png_SpltEntry_Green::U1(v) => *v as usize,
            Png_SpltEntry_Green::U2(v) => *v as usize,
        }
    }
}

#[derive(Debug, Clone)]
pub enum Png_SpltEntry_Blue {
    U1(u8),
    U2(u16),
}
impl From<u8> for Png_SpltEntry_Blue {
    fn from(v: u8) -> Self {
        Self::U1(v)
    }
}
impl From<&Png_SpltEntry_Blue> for u8 {
    fn from(e: &Png_SpltEntry_Blue) -> Self {
        if let Png_SpltEntry_Blue::U1(v) = e {
            return *v
        }
        panic!("trying to convert from enum Png_SpltEntry_Blue::U1 to u8, enum value {:?}", e)
    }
}
impl From<u16> for Png_SpltEntry_Blue {
    fn from(v: u16) -> Self {
        Self::U2(v)
    }
}
impl From<&Png_SpltEntry_Blue> for u16 {
    fn from(e: &Png_SpltEntry_Blue) -> Self {
        if let Png_SpltEntry_Blue::U2(v) = e {
            return *v
        }
        panic!("trying to convert from enum Png_SpltEntry_Blue::U2 to u16, enum value {:?}", e)
    }
}
impl From<&Png_SpltEntry_Blue> for usize {
    fn from(e: &Png_SpltEntry_Blue) -> Self {
        match e {
            Png_SpltEntry_Blue::U1(v) => *v as usize,
            Png_SpltEntry_Blue::U2(v) => *v as usize,
        }
    }
}

#[derive(Debug, Clone)]
pub enum Png_SpltEntry_Alpha {
    U1(u8),
    U2(u16),
}
impl From<u8> for Png_SpltEntry_Alpha {
    fn from(v: u8) -> Self {
        Self::U1(v)
    }
}
impl From<&Png_SpltEntry_Alpha> for u8 {
    fn from(e: &Png_SpltEntry_Alpha) -> Self {
        if let Png_SpltEntry_Alpha::U1(v) = e {
            return *v
        }
        panic!("trying to convert from enum Png_SpltEntry_Alpha::U1 to u8, enum value {:?}", e)
    }
}
impl From<u16> for Png_SpltEntry_Alpha {
    fn from(v: u16) -> Self {
        Self::U2(v)
    }
}
impl From<&Png_SpltEntry_Alpha> for u16 {
    fn from(e: &Png_SpltEntry_Alpha) -> Self {
        if let Png_SpltEntry_Alpha::U2(v) = e {
            return *v
        }
        panic!("trying to convert from enum Png_SpltEntry_Alpha::U2 to u16, enum value {:?}", e)
    }
}
impl From<&Png_SpltEntry_Alpha> for usize {
    fn from(e: &Png_SpltEntry_Alpha) -> Self {
        match e {
            Png_SpltEntry_Alpha::U1(v) => *v as usize,
            Png_SpltEntry_Alpha::U2(v) => *v as usize,
        }
    }
}

impl KStruct for Png_SpltEntry {
    type Root = Png;
    type Parent = Png_SpltChunk;

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
        match *_prc.as_ref().unwrap().sample_depth()? {
            8 => {
                *self_rc.red.borrow_mut() = Some(_io.read_u1()?.into());
            }
            _ => {
                *self_rc.red.borrow_mut() = Some(_io.read_u2be()?.into());
            }
        }
        match *_prc.as_ref().unwrap().sample_depth()? {
            8 => {
                *self_rc.green.borrow_mut() = Some(_io.read_u1()?.into());
            }
            _ => {
                *self_rc.green.borrow_mut() = Some(_io.read_u2be()?.into());
            }
        }
        match *_prc.as_ref().unwrap().sample_depth()? {
            8 => {
                *self_rc.blue.borrow_mut() = Some(_io.read_u1()?.into());
            }
            _ => {
                *self_rc.blue.borrow_mut() = Some(_io.read_u2be()?.into());
            }
        }
        match *_prc.as_ref().unwrap().sample_depth()? {
            8 => {
                *self_rc.alpha.borrow_mut() = Some(_io.read_u1()?.into());
            }
            _ => {
                *self_rc.alpha.borrow_mut() = Some(_io.read_u2be()?.into());
            }
        }
        *self_rc.freq.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl Png_SpltEntry {
}
impl Png_SpltEntry {
    pub fn red(&self) -> usize {
        self.red.borrow().as_ref().unwrap().into()
    }
    pub fn red_enum(&self) -> Ref<'_, Option<Png_SpltEntry_Red>> {
        self.red.borrow()
    }
}
impl Png_SpltEntry {
    pub fn green(&self) -> usize {
        self.green.borrow().as_ref().unwrap().into()
    }
    pub fn green_enum(&self) -> Ref<'_, Option<Png_SpltEntry_Green>> {
        self.green.borrow()
    }
}
impl Png_SpltEntry {
    pub fn blue(&self) -> usize {
        self.blue.borrow().as_ref().unwrap().into()
    }
    pub fn blue_enum(&self) -> Ref<'_, Option<Png_SpltEntry_Blue>> {
        self.blue.borrow()
    }
}

/**
 * An alpha value of 0 means fully transparent. An alpha value of 255
 * (when `_parent.sample_depth` is 8) or 65535 (when
 * `_parent.sample_depth` is 16) means fully opaque.
 */
impl Png_SpltEntry {
    pub fn alpha(&self) -> usize {
        self.alpha.borrow().as_ref().unwrap().into()
    }
    pub fn alpha_enum(&self) -> Ref<'_, Option<Png_SpltEntry_Alpha>> {
        self.alpha.borrow()
    }
}

/**
 * Each frequency value is proportional to the fraction of the pixels in
 * the image for which that palette entry is the closest match in RGBA
 * space, before the image has been composited against any background.
 * 
 * The exact scale factor is chosen by the PNG encoder; it is recommended
 * that the resulting range of individual values reasonably fills the
 * range 0 to 65535.
 * 
 * Zero is a valid frequency meaning that the color is "least important"
 * or that it is rarely, if ever, used. When all the frequencies are
 * zero, they are meaningless, that is to say, nothing may be inferred
 * about the actual frequencies with which the colors appear in the PNG
 * image.
 */
impl Png_SpltEntry {
    pub fn freq(&self) -> Ref<'_, u16> {
        self.freq.borrow()
    }
}
impl Png_SpltEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://www.w3.org/TR/png/#11sRGB Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_SrgbChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    render_intent: RefCell<Png_SrgbChunk_Intent>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Png_SrgbChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        *self_rc.render_intent.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        Ok(())
    }
}
impl Png_SrgbChunk {
}
impl Png_SrgbChunk {
    pub fn render_intent(&self) -> Ref<'_, Png_SrgbChunk_Intent> {
        self.render_intent.borrow()
    }
}
impl Png_SrgbChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Png_SrgbChunk_Intent {
    Perceptual,
    RelativeColorimetric,
    Saturation,
    AbsoluteColorimetric,
    Unknown(i64),
}

impl TryFrom<i64> for Png_SrgbChunk_Intent {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Png_SrgbChunk_Intent> {
        match flag {
            0 => Ok(Png_SrgbChunk_Intent::Perceptual),
            1 => Ok(Png_SrgbChunk_Intent::RelativeColorimetric),
            2 => Ok(Png_SrgbChunk_Intent::Saturation),
            3 => Ok(Png_SrgbChunk_Intent::AbsoluteColorimetric),
            _ => Ok(Png_SrgbChunk_Intent::Unknown(flag)),
        }
    }
}

impl From<&Png_SrgbChunk_Intent> for i64 {
    fn from(v: &Png_SrgbChunk_Intent) -> Self {
        match *v {
            Png_SrgbChunk_Intent::Perceptual => 0,
            Png_SrgbChunk_Intent::RelativeColorimetric => 1,
            Png_SrgbChunk_Intent::Saturation => 2,
            Png_SrgbChunk_Intent::AbsoluteColorimetric => 3,
            Png_SrgbChunk_Intent::Unknown(v) => v
        }
    }
}

impl Default for Png_SrgbChunk_Intent {
    fn default() -> Self { Png_SrgbChunk_Intent::Unknown(0) }
}


/**
 * Textual data (`tEXt`) chunk effectively allows you to store key-value
 * string pairs in the PNG container.
 * 
 * Both the "key" (`keyword`) and "value" (`text`) parts are restricted to
 * printable ISO-8859-1 (Latin-1) characters and ASCII spaces, with the
 * exception that `text` can also contain newlines (U+000A LINE FEED (LF)
 * characters) and U+00A0 NON-BREAKING SPACE characters.
 * \sa https://www.w3.org/TR/png/#11tEXt Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_TextChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    keyword: RefCell<String>,
    text: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Png_TextChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        *self_rc.keyword.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ISO-8859-1")?;
        *self_rc.text.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "ISO-8859-1")?;
        Ok(())
    }
}
impl Png_TextChunk {
}

/**
 * Indicates the type of information represented by the text string.
 * 
 * Keywords must consist exclusively of printable ISO-8859-1 (Latin-1)
 * characters and spaces; that is, only code points 0x20-0x7E and
 * 0xA1-0xFF are allowed. To reduce the chances for human misreading of a
 * keyword, leading spaces, trailing spaces, and consecutive spaces are
 * not permitted.
 * \sa https://www.w3.org/TR/2025/REC-png-3-20250624/#11keywords Source
 */
impl Png_TextChunk {
    pub fn keyword(&self) -> Ref<'_, String> {
        self.keyword.borrow()
    }
}

/**
 * Text string (the "value" of this key-value pair).
 * 
 * Although it is not null-terminated (unlike the keyword), it must not
 * contain a zero byte (U+0000 NULL character). A newline should be
 * represented by a single U+000A LINE FEED (LF) character (aka `\n`).
 * The remaining control characters (U+0001..U+0009, U+000B..0+001F,
 * U+007F..U+009F) are discouraged.
 */
impl Png_TextChunk {
    pub fn text(&self) -> Ref<'_, String> {
        self.text.borrow()
    }
}
impl Png_TextChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Time chunk stores time stamp of last modification of this image,
 * up to 1 second precision in UTC timezone.
 * \sa https://www.w3.org/TR/png/#11tIME Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_TimeChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    year: RefCell<u16>,
    month: RefCell<u8>,
    day: RefCell<u8>,
    hour: RefCell<u8>,
    minute: RefCell<u8>,
    second: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Png_TimeChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        *self_rc.month.borrow_mut() = _io.read_u1()?.into();
        *self_rc.day.borrow_mut() = _io.read_u1()?.into();
        *self_rc.hour.borrow_mut() = _io.read_u1()?.into();
        *self_rc.minute.borrow_mut() = _io.read_u1()?.into();
        *self_rc.second.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl Png_TimeChunk {
}
impl Png_TimeChunk {
    pub fn year(&self) -> Ref<'_, u16> {
        self.year.borrow()
    }
}
impl Png_TimeChunk {
    pub fn month(&self) -> Ref<'_, u8> {
        self.month.borrow()
    }
}
impl Png_TimeChunk {
    pub fn day(&self) -> Ref<'_, u8> {
        self.day.borrow()
    }
}
impl Png_TimeChunk {
    pub fn hour(&self) -> Ref<'_, u8> {
        self.hour.borrow()
    }
}
impl Png_TimeChunk {
    pub fn minute(&self) -> Ref<'_, u8> {
        self.minute.borrow()
    }
}
impl Png_TimeChunk {
    pub fn second(&self) -> Ref<'_, u8> {
        self.second.borrow()
    }
}
impl Png_TimeChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Transparency (`tRNS`) chunk specifies either alpha values that are
 * associated with palette entries (for indexed-color images) or a single
 * transparent color (for greyscale and truecolor images).
 * 
 * A `tRNS` chunk must not appear for color types
 * `color_type::greyscale_alpha` = 4 and `color_type::truecolor_alpha` = 6,
 * since a full alpha channel is already present in those cases.
 * \sa https://www.w3.org/TR/png/#11tRNS Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_TrnsChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    palette_alphas: RefCell<Vec<u8>>,
    transparent_color: RefCell<Option<Png_TrnsChunk_TransparentColor>>,
    _io: RefCell<BytesReader>,
    f_sample_mask: Cell<bool>,
    sample_mask: RefCell<i32>,
}
#[derive(Debug, Clone)]
pub enum Png_TrnsChunk_TransparentColor {
    Png_TrnsGreyscaleColor(OptRc<Png_TrnsGreyscaleColor>),
    Png_TrnsTruecolorColor(OptRc<Png_TrnsTruecolorColor>),
}
impl From<&Png_TrnsChunk_TransparentColor> for OptRc<Png_TrnsGreyscaleColor> {
    fn from(v: &Png_TrnsChunk_TransparentColor) -> Self {
        if let Png_TrnsChunk_TransparentColor::Png_TrnsGreyscaleColor(x) = v {
            return x.clone();
        }
        panic!("expected Png_TrnsChunk_TransparentColor::Png_TrnsGreyscaleColor, got {:?}", v)
    }
}
impl From<OptRc<Png_TrnsGreyscaleColor>> for Png_TrnsChunk_TransparentColor {
    fn from(v: OptRc<Png_TrnsGreyscaleColor>) -> Self {
        Self::Png_TrnsGreyscaleColor(v)
    }
}
impl From<&Png_TrnsChunk_TransparentColor> for OptRc<Png_TrnsTruecolorColor> {
    fn from(v: &Png_TrnsChunk_TransparentColor) -> Self {
        if let Png_TrnsChunk_TransparentColor::Png_TrnsTruecolorColor(x) = v {
            return x.clone();
        }
        panic!("expected Png_TrnsChunk_TransparentColor::Png_TrnsTruecolorColor, got {:?}", v)
    }
}
impl From<OptRc<Png_TrnsTruecolorColor>> for Png_TrnsChunk_TransparentColor {
    fn from(v: OptRc<Png_TrnsTruecolorColor>) -> Self {
        Self::Png_TrnsTruecolorColor(v)
    }
}
impl KStruct for Png_TrnsChunk {
    type Root = Png;
    type Parent = Png_Chunk;

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
        if *_r.ihdr().color_type() == Png_ColorType::Indexed {
            *self_rc.palette_alphas.borrow_mut() = Vec::new();
            {
                let mut _i = 0;
                while !_io.is_eof() {
                    self_rc.palette_alphas.borrow_mut().push(_io.read_u1()?.into());
                    _i += 1;
                }
            }
        }
        match *_r.ihdr().color_type() {
            Png_ColorType::Greyscale => {
                let t = Self::read_into::<_, Png_TrnsGreyscaleColor>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.transparent_color.borrow_mut() = Some(t);
            }
            Png_ColorType::Truecolor => {
                let t = Self::read_into::<_, Png_TrnsTruecolorColor>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.transparent_color.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Png_TrnsChunk {
    pub fn sample_mask(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_sample_mask.get() {
            return Ok(self.sample_mask.borrow());
        }
        self.f_sample_mask.set(true);
        *self.sample_mask.borrow_mut() = (((((1 as u8) << (*_r.ihdr().bit_depth() as u8)) as i32) - (1 as i32))) as i32;
        Ok(self.sample_mask.borrow())
    }
}

/**
 * Alpha values associated with palette entries in the `PLTE` chunk.
 * 
 * Each entry indicates that pixels of the corresponding palette index
 * shall be treated as having the specified alpha value. Alpha values
 * have the same interpretation as in an 8-bit full alpha channel: 0 is
 * fully transparent, 255 is fully opaque, regardless of image bit depth.
 * 
 * The `tRNS` chunk must not contain more alpha values than there are
 * palette entries, but it may contain fewer values than there are
 * palette entries. In this case, the alpha value for all remaining
 * palette entries is assumed to be 255. If all palette indices are
 * opaque, the `tRNS` chunk may be omitted.
 */
impl Png_TrnsChunk {
    pub fn palette_alphas(&self) -> Ref<'_, Vec<u8>> {
        self.palette_alphas.borrow()
    }
}

/**
 * Pixels of the specified grey sample value or RGB sample values are
 * treated as transparent (equivalent to alpha value 0); all other pixels
 * are to be treated as fully opaque (alpha value `2^{bitdepth} - 1`).
 * 
 * If the image bit depth is less than 16, the least significant bits of
 * these sample values are used. Encoders should set the other bits to 0,
 * and decoders must mask the other bits to 0 before the value is used.
 * 
 * Note: in this Kaitai Struct implementation, the bitmask used to
 * implement this masking is stored in the value instance `sample_mask`.
 */
impl Png_TrnsChunk {
    pub fn transparent_color(&self) -> Ref<'_, Option<Png_TrnsChunk_TransparentColor>> {
        self.transparent_color.borrow()
    }
}
impl Png_TrnsChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Png_TrnsGreyscaleColor {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_TrnsChunk>,
    pub _self: SharedType<Self>,
    grey_raw: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_grey: Cell<bool>,
    grey: RefCell<i32>,
}
impl KStruct for Png_TrnsGreyscaleColor {
    type Root = Png;
    type Parent = Png_TrnsChunk;

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
        *self_rc.grey_raw.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl Png_TrnsGreyscaleColor {
    pub fn grey(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_grey.get() {
            return Ok(self.grey.borrow());
        }
        self.f_grey.set(true);
        *self.grey.borrow_mut() = (((*self.grey_raw() as i32) & (*_prc.as_ref().unwrap().sample_mask()? as i32))) as i32;
        Ok(self.grey.borrow())
    }
}
impl Png_TrnsGreyscaleColor {
    pub fn grey_raw(&self) -> Ref<'_, u16> {
        self.grey_raw.borrow()
    }
}
impl Png_TrnsGreyscaleColor {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Png_TrnsTruecolorColor {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_TrnsChunk>,
    pub _self: SharedType<Self>,
    red_raw: RefCell<u16>,
    green_raw: RefCell<u16>,
    blue_raw: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_blue: Cell<bool>,
    blue: RefCell<i32>,
    f_green: Cell<bool>,
    green: RefCell<i32>,
    f_red: Cell<bool>,
    red: RefCell<i32>,
}
impl KStruct for Png_TrnsTruecolorColor {
    type Root = Png;
    type Parent = Png_TrnsChunk;

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
        *self_rc.red_raw.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.green_raw.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.blue_raw.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl Png_TrnsTruecolorColor {
    pub fn blue(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_blue.get() {
            return Ok(self.blue.borrow());
        }
        self.f_blue.set(true);
        *self.blue.borrow_mut() = (((*self.blue_raw() as i32) & (*_prc.as_ref().unwrap().sample_mask()? as i32))) as i32;
        Ok(self.blue.borrow())
    }
    pub fn green(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_green.get() {
            return Ok(self.green.borrow());
        }
        self.f_green.set(true);
        *self.green.borrow_mut() = (((*self.green_raw() as i32) & (*_prc.as_ref().unwrap().sample_mask()? as i32))) as i32;
        Ok(self.green.borrow())
    }
    pub fn red(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_red.get() {
            return Ok(self.red.borrow());
        }
        self.f_red.set(true);
        *self.red.borrow_mut() = (((*self.red_raw() as i32) & (*_prc.as_ref().unwrap().sample_mask()? as i32))) as i32;
        Ok(self.red.borrow())
    }
}
impl Png_TrnsTruecolorColor {
    pub fn red_raw(&self) -> Ref<'_, u16> {
        self.red_raw.borrow()
    }
}
impl Png_TrnsTruecolorColor {
    pub fn green_raw(&self) -> Ref<'_, u16> {
        self.green_raw.borrow()
    }
}
impl Png_TrnsTruecolorColor {
    pub fn blue_raw(&self) -> Ref<'_, u16> {
        self.blue_raw.borrow()
    }
}
impl Png_TrnsTruecolorColor {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

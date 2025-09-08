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
    ihdr_crc: RefCell<Vec<u8>>,
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
        *self_rc.ihdr_crc.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        *self_rc.chunks.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let t = Self::read_into::<_, Png_Chunk>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.chunks.borrow_mut().push(t);
                let _t_chunks = self_rc.chunks.borrow();
                let _tmpa = _t_chunks.last().unwrap();
                _i += 1;
                let x = !( ((*_tmpa.type() == "IEND".to_string()) || (_io.is_eof())) );
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
    pub fn ihdr_crc(&self) -> Ref<'_, Vec<u8>> {
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
     */
    Source,

    /**
     * The frame is composited onto the output buffer based on its alpha
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
     * \sa https://wiki.mozilla.org/APNG_Specification#.60fcTL.60:_The_Frame_Control_Chunk Source
     */
    None,

    /**
     * The frame's region of the output buffer is to be cleared to
     * fully transparent black before rendering the next frame.
     * \sa https://wiki.mozilla.org/APNG_Specification#.60fcTL.60:_The_Frame_Control_Chunk Source
     */
    Background,

    /**
     * The frame's region of the output buffer is to be reverted
     * to the previous contents before rendering the next frame.
     * \sa https://wiki.mozilla.org/APNG_Specification#.60fcTL.60:_The_Frame_Control_Chunk Source
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
 * \sa https://wiki.mozilla.org/APNG_Specification#.60acTL.60:_The_Animation_Control_Chunk Source
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
 * Number of frames, must be equal to the number of `frame_control_chunk`s
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

/**
 * \sa https://www.w3.org/TR/png/#11cHRM Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_ChrmChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    white_point: RefCell<OptRc<Png_Point>>,
    red: RefCell<OptRc<Png_Point>>,
    green: RefCell<OptRc<Png_Point>>,
    blue: RefCell<OptRc<Png_Point>>,
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
        let t = Self::read_into::<_, Png_Point>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.white_point.borrow_mut() = t;
        let t = Self::read_into::<_, Png_Point>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.red.borrow_mut() = t;
        let t = Self::read_into::<_, Png_Point>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.green.borrow_mut() = t;
        let t = Self::read_into::<_, Png_Point>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.blue.borrow_mut() = t;
        Ok(())
    }
}
impl Png_ChrmChunk {
}
impl Png_ChrmChunk {
    pub fn white_point(&self) -> Ref<'_, OptRc<Png_Point>> {
        self.white_point.borrow()
    }
}
impl Png_ChrmChunk {
    pub fn red(&self) -> Ref<'_, OptRc<Png_Point>> {
        self.red.borrow()
    }
}
impl Png_ChrmChunk {
    pub fn green(&self) -> Ref<'_, OptRc<Png_Point>> {
        self.green.borrow()
    }
}
impl Png_ChrmChunk {
    pub fn blue(&self) -> Ref<'_, OptRc<Png_Point>> {
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
    type: RefCell<String>,
    body: RefCell<Option<Png_Chunk_Body>>,
    crc: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum Png_Chunk_Body {
    Png_SrgbChunk(OptRc<Png_SrgbChunk>),
    Png_FrameControlChunk(OptRc<Png_FrameControlChunk>),
    Png_PhysChunk(OptRc<Png_PhysChunk>),
    Png_ChrmChunk(OptRc<Png_ChrmChunk>),
    Png_TimeChunk(OptRc<Png_TimeChunk>),
    Png_AnimationControlChunk(OptRc<Png_AnimationControlChunk>),
    Bytes(Vec<u8>),
    Png_CompressedTextChunk(OptRc<Png_CompressedTextChunk>),
    Png_InternationalTextChunk(OptRc<Png_InternationalTextChunk>),
    Png_GamaChunk(OptRc<Png_GamaChunk>),
    Png_FrameDataChunk(OptRc<Png_FrameDataChunk>),
    Png_TextChunk(OptRc<Png_TextChunk>),
    Png_PlteChunk(OptRc<Png_PlteChunk>),
    Png_BkgdChunk(OptRc<Png_BkgdChunk>),
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
        *self_rc.type.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "UTF-8")?;
        {
            let on = self_rc.type();
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
            else if *on == "iTXt" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_InternationalTextChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "pHYs" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_PhysChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "sRGB" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Png_SrgbChunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
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
        *self_rc.crc.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        Ok(())
    }
}
impl Png_Chunk {
}
impl Png_Chunk {
    pub fn len(&self) -> Ref<'_, u32> {
        self.len.borrow()
    }
}
impl Png_Chunk {
    pub fn type(&self) -> Ref<'_, String> {
        self.type.borrow()
    }
}
impl Png_Chunk {
    pub fn body(&self) -> Ref<'_, Option<Png_Chunk_Body>> {
        self.body.borrow()
    }
}
impl Png_Chunk {
    pub fn crc(&self) -> Ref<'_, Vec<u8>> {
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
 * Compressed text chunk effectively allows to store key-value
 * string pairs in PNG container, compressing "value" part (which
 * can be quite lengthy) with zlib compression.
 * \sa https://www.w3.org/TR/png/#11zTXt Source
 */

#[derive(Default, Debug, Clone)]
pub struct Png_CompressedTextChunk {
    pub _root: SharedType<Png>,
    pub _parent: SharedType<Png_Chunk>,
    pub _self: SharedType<Self>,
    keyword: RefCell<String>,
    compression_method: RefCell<Png_CompressionMethods>,
    text_datastream: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    text_datastream_raw: RefCell<Vec<u8>>,
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
        *self_rc.keyword.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?;
        *self_rc.compression_method.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.text_datastream_raw.borrow_mut() = _io.read_bytes_full()?.into();
        *self_rc.text_datastream.borrow_mut() = process_zlib(&self_rc.text_datastream_raw.borrow()).map_err(|msg| KError::BytesDecodingError { msg })?;
        Ok(())
    }
}
impl Png_CompressedTextChunk {
}

/**
 * Indicates purpose of the following text data.
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
    pub fn text_datastream(&self) -> Ref<'_, Vec<u8>> {
        self.text_datastream.borrow()
    }
}
impl Png_CompressedTextChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Png_CompressedTextChunk {
    pub fn text_datastream_raw(&self) -> Ref<'_, Vec<u8>> {
        self.text_datastream_raw.borrow()
    }
}

/**
 * \sa https://wiki.mozilla.org/APNG_Specification#.60fcTL.60:_The_Frame_Control_Chunk Source
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
 * Sequence number of the animation chunk
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
 * \sa https://wiki.mozilla.org/APNG_Specification#.60fdAT.60:_The_Frame_Data_Chunk Source
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
 * Sequence number of the animation chunk. The fcTL and fdAT chunks
 * have a 4 byte sequence number. Both chunk types share the sequence.
 * The first fcTL chunk must contain sequence number 0, and the sequence
 * numbers in the remaining fcTL and fdAT chunks must be in order, with
 * no gaps or duplicates.
 */
impl Png_FrameDataChunk {
    pub fn sequence_number(&self) -> Ref<'_, u32> {
        self.sequence_number.borrow()
    }
}

/**
 * Frame data for the frame. At least one fdAT chunk is required for
 * each frame. The compressed datastream is the concatenation of the
 * contents of the data fields of all the fdAT chunks within a frame.
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
    f_gamma_ratio: Cell<bool>,
    gamma_ratio: RefCell<f64>,
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
        Ok(())
    }
}
impl Png_GamaChunk {
    pub fn gamma_ratio(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_gamma_ratio.get() {
            return Ok(self.gamma_ratio.borrow());
        }
        self.f_gamma_ratio.set(true);
        *self.gamma_ratio.borrow_mut() = (((100000.0 as f64) / (*self.gamma_int() as f64))) as f64;
        Ok(self.gamma_ratio.borrow())
    }
}
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
    compression_method: RefCell<u8>,
    filter_method: RefCell<u8>,
    interlace_method: RefCell<u8>,
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
        *self_rc.height.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.bit_depth.borrow_mut() = _io.read_u1()?.into();
        *self_rc.color_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.compression_method.borrow_mut() = _io.read_u1()?.into();
        *self_rc.filter_method.borrow_mut() = _io.read_u1()?.into();
        *self_rc.interlace_method.borrow_mut() = _io.read_u1()?.into();
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
    pub fn compression_method(&self) -> Ref<'_, u8> {
        self.compression_method.borrow()
    }
}
impl Png_IhdrChunk {
    pub fn filter_method(&self) -> Ref<'_, u8> {
        self.filter_method.borrow()
    }
}
impl Png_IhdrChunk {
    pub fn interlace_method(&self) -> Ref<'_, u8> {
        self.interlace_method.borrow()
    }
}
impl Png_IhdrChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * International text chunk effectively allows to store key-value string pairs in
 * PNG container. Both "key" (keyword) and "value" (text) parts are
 * given in pre-defined subset of iso8859-1 without control
 * characters.
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
    text: RefCell<String>,
    _io: RefCell<BytesReader>,
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
        *self_rc.keyword.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?;
        *self_rc.compression_flag.borrow_mut() = _io.read_u1()?.into();
        *self_rc.compression_method.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.language_tag.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?;
        *self_rc.translated_keyword.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?;
        *self_rc.text.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Png_InternationalTextChunk {
}

/**
 * Indicates purpose of the following text data.
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
 * Human language used in `translated_keyword` and `text`
 * attributes - should be a language code conforming to ISO
 * 646.IRV:1991.
 */
impl Png_InternationalTextChunk {
    pub fn language_tag(&self) -> Ref<'_, String> {
        self.language_tag.borrow()
    }
}

/**
 * Keyword translated into language specified in
 * `language_tag`. Line breaks are not allowed.
 */
impl Png_InternationalTextChunk {
    pub fn translated_keyword(&self) -> Ref<'_, String> {
        self.translated_keyword.borrow()
    }
}

/**
 * Text contents ("value" of this key-value pair), written in
 * language specified in `language_tag`. Line breaks are
 * allowed.
 */
impl Png_InternationalTextChunk {
    pub fn text(&self) -> Ref<'_, String> {
        self.text.borrow()
    }
}
impl Png_InternationalTextChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * "Physical size" chunk stores data that allows to translate
 * logical pixels into physical units (meters, etc) and vice-versa.
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
pub struct Png_Point {
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
impl KStruct for Png_Point {
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
impl Png_Point {
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
impl Png_Point {
    pub fn x_int(&self) -> Ref<'_, u32> {
        self.x_int.borrow()
    }
}
impl Png_Point {
    pub fn y_int(&self) -> Ref<'_, u32> {
        self.y_int.borrow()
    }
}
impl Png_Point {
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
 * Text chunk effectively allows to store key-value string pairs in
 * PNG container. Both "key" (keyword) and "value" (text) parts are
 * given in pre-defined subset of iso8859-1 without control
 * characters.
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
 * Indicates purpose of the following text data.
 */
impl Png_TextChunk {
    pub fn keyword(&self) -> Ref<'_, String> {
        self.keyword.borrow()
    }
}
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

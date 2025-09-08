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
 * Allegro library for C (mostly used for game and multimedia apps
 * programming) used its own container file format.
 * 
 * In general, it allows storage of arbitrary binary data blocks
 * bundled together with some simple key-value style metadata
 * ("properties") for every block. Allegro also pre-defines some simple
 * formats for bitmaps, fonts, MIDI music, sound samples and
 * palettes. Allegro library v4.0+ also support LZSS compression.
 * 
 * This spec applies to Allegro data files for library versions 2.2 up
 * to 4.4.
 * \sa https://liballeg.org/stabledocs/en/datafile.html Source
 */

#[derive(Default, Debug, Clone)]
pub struct AllegroDat {
    pub _root: SharedType<AllegroDat>,
    pub _parent: SharedType<AllegroDat>,
    pub _self: SharedType<Self>,
    pack_magic: RefCell<AllegroDat_PackEnum>,
    dat_magic: RefCell<Vec<u8>>,
    num_objects: RefCell<u32>,
    objects: RefCell<Vec<OptRc<AllegroDat_DatObject>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AllegroDat {
    type Root = AllegroDat;
    type Parent = AllegroDat;

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
        *self_rc.pack_magic.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        *self_rc.dat_magic.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.dat_magic() == vec![0x41u8, 0x4cu8, 0x4cu8, 0x2eu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/1".to_string() }));
        }
        *self_rc.num_objects.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.objects.borrow_mut() = Vec::new();
        let l_objects = *self_rc.num_objects();
        for _i in 0..l_objects {
            let t = Self::read_into::<_, AllegroDat_DatObject>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.objects.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl AllegroDat {
}
impl AllegroDat {
    pub fn pack_magic(&self) -> Ref<'_, AllegroDat_PackEnum> {
        self.pack_magic.borrow()
    }
}
impl AllegroDat {
    pub fn dat_magic(&self) -> Ref<'_, Vec<u8>> {
        self.dat_magic.borrow()
    }
}
impl AllegroDat {
    pub fn num_objects(&self) -> Ref<'_, u32> {
        self.num_objects.borrow()
    }
}
impl AllegroDat {
    pub fn objects(&self) -> Ref<'_, Vec<OptRc<AllegroDat_DatObject>>> {
        self.objects.borrow()
    }
}
impl AllegroDat {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum AllegroDat_PackEnum {
    Unpacked,
    Unknown(i64),
}

impl TryFrom<i64> for AllegroDat_PackEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<AllegroDat_PackEnum> {
        match flag {
            1936484398 => Ok(AllegroDat_PackEnum::Unpacked),
            _ => Ok(AllegroDat_PackEnum::Unknown(flag)),
        }
    }
}

impl From<&AllegroDat_PackEnum> for i64 {
    fn from(v: &AllegroDat_PackEnum) -> Self {
        match *v {
            AllegroDat_PackEnum::Unpacked => 1936484398,
            AllegroDat_PackEnum::Unknown(v) => v
        }
    }
}

impl Default for AllegroDat_PackEnum {
    fn default() -> Self { AllegroDat_PackEnum::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct AllegroDat_DatBitmap {
    pub _root: SharedType<AllegroDat>,
    pub _parent: SharedType<AllegroDat_DatObject>,
    pub _self: SharedType<Self>,
    bits_per_pixel: RefCell<i16>,
    width: RefCell<u16>,
    height: RefCell<u16>,
    image: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AllegroDat_DatBitmap {
    type Root = AllegroDat;
    type Parent = AllegroDat_DatObject;

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
        *self_rc.bits_per_pixel.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.width.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.height.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.image.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl AllegroDat_DatBitmap {
}
impl AllegroDat_DatBitmap {
    pub fn bits_per_pixel(&self) -> Ref<'_, i16> {
        self.bits_per_pixel.borrow()
    }
}
impl AllegroDat_DatBitmap {
    pub fn width(&self) -> Ref<'_, u16> {
        self.width.borrow()
    }
}
impl AllegroDat_DatBitmap {
    pub fn height(&self) -> Ref<'_, u16> {
        self.height.borrow()
    }
}
impl AllegroDat_DatBitmap {
    pub fn image(&self) -> Ref<'_, Vec<u8>> {
        self.image.borrow()
    }
}
impl AllegroDat_DatBitmap {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct AllegroDat_DatFont {
    pub _root: SharedType<AllegroDat>,
    pub _parent: SharedType<AllegroDat_DatObject>,
    pub _self: SharedType<Self>,
    font_size: RefCell<i16>,
    body: RefCell<Option<AllegroDat_DatFont_Body>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum AllegroDat_DatFont_Body {
    AllegroDat_DatFont39(OptRc<AllegroDat_DatFont39>),
    AllegroDat_DatFont16(OptRc<AllegroDat_DatFont16>),
    AllegroDat_DatFont8(OptRc<AllegroDat_DatFont8>),
}
impl From<&AllegroDat_DatFont_Body> for OptRc<AllegroDat_DatFont39> {
    fn from(v: &AllegroDat_DatFont_Body) -> Self {
        if let AllegroDat_DatFont_Body::AllegroDat_DatFont39(x) = v {
            return x.clone();
        }
        panic!("expected AllegroDat_DatFont_Body::AllegroDat_DatFont39, got {:?}", v)
    }
}
impl From<OptRc<AllegroDat_DatFont39>> for AllegroDat_DatFont_Body {
    fn from(v: OptRc<AllegroDat_DatFont39>) -> Self {
        Self::AllegroDat_DatFont39(v)
    }
}
impl From<&AllegroDat_DatFont_Body> for OptRc<AllegroDat_DatFont16> {
    fn from(v: &AllegroDat_DatFont_Body) -> Self {
        if let AllegroDat_DatFont_Body::AllegroDat_DatFont16(x) = v {
            return x.clone();
        }
        panic!("expected AllegroDat_DatFont_Body::AllegroDat_DatFont16, got {:?}", v)
    }
}
impl From<OptRc<AllegroDat_DatFont16>> for AllegroDat_DatFont_Body {
    fn from(v: OptRc<AllegroDat_DatFont16>) -> Self {
        Self::AllegroDat_DatFont16(v)
    }
}
impl From<&AllegroDat_DatFont_Body> for OptRc<AllegroDat_DatFont8> {
    fn from(v: &AllegroDat_DatFont_Body) -> Self {
        if let AllegroDat_DatFont_Body::AllegroDat_DatFont8(x) = v {
            return x.clone();
        }
        panic!("expected AllegroDat_DatFont_Body::AllegroDat_DatFont8, got {:?}", v)
    }
}
impl From<OptRc<AllegroDat_DatFont8>> for AllegroDat_DatFont_Body {
    fn from(v: OptRc<AllegroDat_DatFont8>) -> Self {
        Self::AllegroDat_DatFont8(v)
    }
}
impl KStruct for AllegroDat_DatFont {
    type Root = AllegroDat;
    type Parent = AllegroDat_DatObject;

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
        *self_rc.font_size.borrow_mut() = _io.read_s2be()?.into();
        match *self_rc.font_size() {
            0 => {
                let t = Self::read_into::<_, AllegroDat_DatFont39>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            16 => {
                let t = Self::read_into::<_, AllegroDat_DatFont16>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            8 => {
                let t = Self::read_into::<_, AllegroDat_DatFont8>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl AllegroDat_DatFont {
}
impl AllegroDat_DatFont {
    pub fn font_size(&self) -> Ref<'_, i16> {
        self.font_size.borrow()
    }
}
impl AllegroDat_DatFont {
    pub fn body(&self) -> Ref<'_, Option<AllegroDat_DatFont_Body>> {
        self.body.borrow()
    }
}
impl AllegroDat_DatFont {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Simple monochrome monospaced font, 95 characters, 8x16 px
 * characters.
 */

#[derive(Default, Debug, Clone)]
pub struct AllegroDat_DatFont16 {
    pub _root: SharedType<AllegroDat>,
    pub _parent: SharedType<AllegroDat_DatFont>,
    pub _self: SharedType<Self>,
    chars: RefCell<Vec<Vec<u8>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AllegroDat_DatFont16 {
    type Root = AllegroDat;
    type Parent = AllegroDat_DatFont;

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
        *self_rc.chars.borrow_mut() = Vec::new();
        let l_chars = 95;
        for _i in 0..l_chars {
            self_rc.chars.borrow_mut().push(_io.read_bytes(16 as usize)?.into());
        }
        Ok(())
    }
}
impl AllegroDat_DatFont16 {
}
impl AllegroDat_DatFont16 {
    pub fn chars(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.chars.borrow()
    }
}
impl AllegroDat_DatFont16 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * New bitmap font format introduced since Allegro 3.9: allows
 * flexible designation of character ranges, 8-bit colored
 * characters, etc.
 */

#[derive(Default, Debug, Clone)]
pub struct AllegroDat_DatFont39 {
    pub _root: SharedType<AllegroDat>,
    pub _parent: SharedType<AllegroDat_DatFont>,
    pub _self: SharedType<Self>,
    num_ranges: RefCell<i16>,
    ranges: RefCell<Vec<OptRc<AllegroDat_DatFont39_Range>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AllegroDat_DatFont39 {
    type Root = AllegroDat;
    type Parent = AllegroDat_DatFont;

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
        *self_rc.num_ranges.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.ranges.borrow_mut() = Vec::new();
        let l_ranges = *self_rc.num_ranges();
        for _i in 0..l_ranges {
            let t = Self::read_into::<_, AllegroDat_DatFont39_Range>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.ranges.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl AllegroDat_DatFont39 {
}
impl AllegroDat_DatFont39 {
    pub fn num_ranges(&self) -> Ref<'_, i16> {
        self.num_ranges.borrow()
    }
}
impl AllegroDat_DatFont39 {
    pub fn ranges(&self) -> Ref<'_, Vec<OptRc<AllegroDat_DatFont39_Range>>> {
        self.ranges.borrow()
    }
}
impl AllegroDat_DatFont39 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct AllegroDat_DatFont39_FontChar {
    pub _root: SharedType<AllegroDat>,
    pub _parent: SharedType<AllegroDat_DatFont39_Range>,
    pub _self: SharedType<Self>,
    width: RefCell<u16>,
    height: RefCell<u16>,
    body: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AllegroDat_DatFont39_FontChar {
    type Root = AllegroDat;
    type Parent = AllegroDat_DatFont39_Range;

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
        *self_rc.width.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.height.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.body.borrow_mut() = _io.read_bytes(((*self_rc.width() as u16) * (*self_rc.height() as u16)) as usize)?.into();
        Ok(())
    }
}
impl AllegroDat_DatFont39_FontChar {
}
impl AllegroDat_DatFont39_FontChar {
    pub fn width(&self) -> Ref<'_, u16> {
        self.width.borrow()
    }
}
impl AllegroDat_DatFont39_FontChar {
    pub fn height(&self) -> Ref<'_, u16> {
        self.height.borrow()
    }
}
impl AllegroDat_DatFont39_FontChar {
    pub fn body(&self) -> Ref<'_, Vec<u8>> {
        self.body.borrow()
    }
}
impl AllegroDat_DatFont39_FontChar {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct AllegroDat_DatFont39_Range {
    pub _root: SharedType<AllegroDat>,
    pub _parent: SharedType<AllegroDat_DatFont39>,
    pub _self: SharedType<Self>,
    mono: RefCell<u8>,
    start_char: RefCell<u32>,
    end_char: RefCell<u32>,
    chars: RefCell<Vec<OptRc<AllegroDat_DatFont39_FontChar>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AllegroDat_DatFont39_Range {
    type Root = AllegroDat;
    type Parent = AllegroDat_DatFont39;

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
        *self_rc.mono.borrow_mut() = _io.read_u1()?.into();
        *self_rc.start_char.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.end_char.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.chars.borrow_mut() = Vec::new();
        let l_chars = ((((*self_rc.end_char() as u32) - (*self_rc.start_char() as u32)) as i32) + (1 as i32));
        for _i in 0..l_chars {
            let t = Self::read_into::<_, AllegroDat_DatFont39_FontChar>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.chars.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl AllegroDat_DatFont39_Range {
}
impl AllegroDat_DatFont39_Range {
    pub fn mono(&self) -> Ref<'_, u8> {
        self.mono.borrow()
    }
}

/**
 * First character in range
 */
impl AllegroDat_DatFont39_Range {
    pub fn start_char(&self) -> Ref<'_, u32> {
        self.start_char.borrow()
    }
}

/**
 * Last character in range (inclusive)
 */
impl AllegroDat_DatFont39_Range {
    pub fn end_char(&self) -> Ref<'_, u32> {
        self.end_char.borrow()
    }
}
impl AllegroDat_DatFont39_Range {
    pub fn chars(&self) -> Ref<'_, Vec<OptRc<AllegroDat_DatFont39_FontChar>>> {
        self.chars.borrow()
    }
}
impl AllegroDat_DatFont39_Range {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Simple monochrome monospaced font, 95 characters, 8x8 px
 * characters.
 */

#[derive(Default, Debug, Clone)]
pub struct AllegroDat_DatFont8 {
    pub _root: SharedType<AllegroDat>,
    pub _parent: SharedType<AllegroDat_DatFont>,
    pub _self: SharedType<Self>,
    chars: RefCell<Vec<Vec<u8>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AllegroDat_DatFont8 {
    type Root = AllegroDat;
    type Parent = AllegroDat_DatFont;

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
        *self_rc.chars.borrow_mut() = Vec::new();
        let l_chars = 95;
        for _i in 0..l_chars {
            self_rc.chars.borrow_mut().push(_io.read_bytes(8 as usize)?.into());
        }
        Ok(())
    }
}
impl AllegroDat_DatFont8 {
}
impl AllegroDat_DatFont8 {
    pub fn chars(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.chars.borrow()
    }
}
impl AllegroDat_DatFont8 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct AllegroDat_DatObject {
    pub _root: SharedType<AllegroDat>,
    pub _parent: SharedType<AllegroDat>,
    pub _self: SharedType<Self>,
    properties: RefCell<Vec<OptRc<AllegroDat_Property>>>,
    len_compressed: RefCell<i32>,
    len_uncompressed: RefCell<i32>,
    body: RefCell<Option<AllegroDat_DatObject_Body>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
    f_type: Cell<bool>,
    type: RefCell<String>,
}
#[derive(Debug, Clone)]
pub enum AllegroDat_DatObject_Body {
    Bytes(Vec<u8>),
    AllegroDat_DatBitmap(OptRc<AllegroDat_DatBitmap>),
    AllegroDat_DatFont(OptRc<AllegroDat_DatFont>),
    AllegroDat_DatRleSprite(OptRc<AllegroDat_DatRleSprite>),
}
impl From<&AllegroDat_DatObject_Body> for Vec<u8> {
    fn from(v: &AllegroDat_DatObject_Body) -> Self {
        if let AllegroDat_DatObject_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected AllegroDat_DatObject_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for AllegroDat_DatObject_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&AllegroDat_DatObject_Body> for OptRc<AllegroDat_DatBitmap> {
    fn from(v: &AllegroDat_DatObject_Body) -> Self {
        if let AllegroDat_DatObject_Body::AllegroDat_DatBitmap(x) = v {
            return x.clone();
        }
        panic!("expected AllegroDat_DatObject_Body::AllegroDat_DatBitmap, got {:?}", v)
    }
}
impl From<OptRc<AllegroDat_DatBitmap>> for AllegroDat_DatObject_Body {
    fn from(v: OptRc<AllegroDat_DatBitmap>) -> Self {
        Self::AllegroDat_DatBitmap(v)
    }
}
impl From<&AllegroDat_DatObject_Body> for OptRc<AllegroDat_DatFont> {
    fn from(v: &AllegroDat_DatObject_Body) -> Self {
        if let AllegroDat_DatObject_Body::AllegroDat_DatFont(x) = v {
            return x.clone();
        }
        panic!("expected AllegroDat_DatObject_Body::AllegroDat_DatFont, got {:?}", v)
    }
}
impl From<OptRc<AllegroDat_DatFont>> for AllegroDat_DatObject_Body {
    fn from(v: OptRc<AllegroDat_DatFont>) -> Self {
        Self::AllegroDat_DatFont(v)
    }
}
impl From<&AllegroDat_DatObject_Body> for OptRc<AllegroDat_DatRleSprite> {
    fn from(v: &AllegroDat_DatObject_Body) -> Self {
        if let AllegroDat_DatObject_Body::AllegroDat_DatRleSprite(x) = v {
            return x.clone();
        }
        panic!("expected AllegroDat_DatObject_Body::AllegroDat_DatRleSprite, got {:?}", v)
    }
}
impl From<OptRc<AllegroDat_DatRleSprite>> for AllegroDat_DatObject_Body {
    fn from(v: OptRc<AllegroDat_DatRleSprite>) -> Self {
        Self::AllegroDat_DatRleSprite(v)
    }
}
impl KStruct for AllegroDat_DatObject {
    type Root = AllegroDat;
    type Parent = AllegroDat;

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
        *self_rc.properties.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let t = Self::read_into::<_, AllegroDat_Property>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.properties.borrow_mut().push(t);
                let _t_properties = self_rc.properties.borrow();
                let _tmpa = _t_properties.last().unwrap();
                _i += 1;
                let x = !(!(*_tmpa.is_valid()?));
                x
            } {}
        }
        *self_rc.len_compressed.borrow_mut() = _io.read_s4be()?.into();
        *self_rc.len_uncompressed.borrow_mut() = _io.read_s4be()?.into();
        {
            let on = self_rc.type()?;
            if *on == "BMP " {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_compressed() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, AllegroDat_DatBitmap>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "FONT" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_compressed() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, AllegroDat_DatFont>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == "RLE " {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_compressed() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, AllegroDat_DatRleSprite>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else {
                *self_rc.body.borrow_mut() = Some(_io.read_bytes(*self_rc.len_compressed() as usize)?.into());
            }
        }
        Ok(())
    }
}
impl AllegroDat_DatObject {
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
        *self.type.borrow_mut() = self.properties().last().ok_or(KError::EmptyIterator)?.magic().to_string();
        Ok(self.type.borrow())
    }
}
impl AllegroDat_DatObject {
    pub fn properties(&self) -> Ref<'_, Vec<OptRc<AllegroDat_Property>>> {
        self.properties.borrow()
    }
}
impl AllegroDat_DatObject {
    pub fn len_compressed(&self) -> Ref<'_, i32> {
        self.len_compressed.borrow()
    }
}
impl AllegroDat_DatObject {
    pub fn len_uncompressed(&self) -> Ref<'_, i32> {
        self.len_uncompressed.borrow()
    }
}
impl AllegroDat_DatObject {
    pub fn body(&self) -> Ref<'_, Option<AllegroDat_DatObject_Body>> {
        self.body.borrow()
    }
}
impl AllegroDat_DatObject {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl AllegroDat_DatObject {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct AllegroDat_DatRleSprite {
    pub _root: SharedType<AllegroDat>,
    pub _parent: SharedType<AllegroDat_DatObject>,
    pub _self: SharedType<Self>,
    bits_per_pixel: RefCell<i16>,
    width: RefCell<u16>,
    height: RefCell<u16>,
    len_image: RefCell<u32>,
    image: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AllegroDat_DatRleSprite {
    type Root = AllegroDat;
    type Parent = AllegroDat_DatObject;

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
        *self_rc.bits_per_pixel.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.width.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.height.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.len_image.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.image.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl AllegroDat_DatRleSprite {
}
impl AllegroDat_DatRleSprite {
    pub fn bits_per_pixel(&self) -> Ref<'_, i16> {
        self.bits_per_pixel.borrow()
    }
}
impl AllegroDat_DatRleSprite {
    pub fn width(&self) -> Ref<'_, u16> {
        self.width.borrow()
    }
}
impl AllegroDat_DatRleSprite {
    pub fn height(&self) -> Ref<'_, u16> {
        self.height.borrow()
    }
}
impl AllegroDat_DatRleSprite {
    pub fn len_image(&self) -> Ref<'_, u32> {
        self.len_image.borrow()
    }
}
impl AllegroDat_DatRleSprite {
    pub fn image(&self) -> Ref<'_, Vec<u8>> {
        self.image.borrow()
    }
}
impl AllegroDat_DatRleSprite {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct AllegroDat_Property {
    pub _root: SharedType<AllegroDat>,
    pub _parent: SharedType<AllegroDat_DatObject>,
    pub _self: SharedType<Self>,
    magic: RefCell<String>,
    type: RefCell<String>,
    len_body: RefCell<u32>,
    body: RefCell<String>,
    _io: RefCell<BytesReader>,
    f_is_valid: Cell<bool>,
    is_valid: RefCell<bool>,
}
impl KStruct for AllegroDat_Property {
    type Root = AllegroDat;
    type Parent = AllegroDat_DatObject;

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
        *self_rc.magic.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "UTF-8")?;
        if *self_rc.is_valid()? {
            *self_rc.type.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "UTF-8")?;
        }
        if *self_rc.is_valid()? {
            *self_rc.len_body.borrow_mut() = _io.read_u4be()?.into();
        }
        if *self_rc.is_valid()? {
            *self_rc.body.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.len_body() as usize)?.into(), "UTF-8")?;
        }
        Ok(())
    }
}
impl AllegroDat_Property {
    pub fn is_valid(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_valid.get() {
            return Ok(self.is_valid.borrow());
        }
        self.f_is_valid.set(true);
        *self.is_valid.borrow_mut() = (*self.magic() == "prop".to_string()) as bool;
        Ok(self.is_valid.borrow())
    }
}
impl AllegroDat_Property {
    pub fn magic(&self) -> Ref<'_, String> {
        self.magic.borrow()
    }
}
impl AllegroDat_Property {
    pub fn type(&self) -> Ref<'_, String> {
        self.type.borrow()
    }
}
impl AllegroDat_Property {
    pub fn len_body(&self) -> Ref<'_, u32> {
        self.len_body.borrow()
    }
}
impl AllegroDat_Property {
    pub fn body(&self) -> Ref<'_, String> {
        self.body.borrow()
    }
}
impl AllegroDat_Property {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

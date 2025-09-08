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
 * \sa http://fileformats.archiveteam.org/wiki/TIM_(PlayStation_graphics) Source
 * \sa https://mrclick.zophar.net/TilEd/download/timgfx.txt Source
 * \sa https://www.romhacking.net/documents/31/ Source
 */

#[derive(Default, Debug, Clone)]
pub struct PsxTim {
    pub _root: SharedType<PsxTim>,
    pub _parent: SharedType<PsxTim>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    flags: RefCell<u32>,
    clut: RefCell<OptRc<PsxTim_Bitmap>>,
    img: RefCell<OptRc<PsxTim_Bitmap>>,
    _io: RefCell<BytesReader>,
    f_bpp: Cell<bool>,
    bpp: RefCell<i32>,
    f_has_clut: Cell<bool>,
    has_clut: RefCell<bool>,
}
impl KStruct for PsxTim {
    type Root = PsxTim;
    type Parent = PsxTim;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.magic() == vec![0x10u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.flags.borrow_mut() = _io.read_u4le()?.into();
        if *self_rc.has_clut()? {
            let t = Self::read_into::<_, PsxTim_Bitmap>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.clut.borrow_mut() = t;
        }
        let t = Self::read_into::<_, PsxTim_Bitmap>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.img.borrow_mut() = t;
        Ok(())
    }
}
impl PsxTim {
    pub fn bpp(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_bpp.get() {
            return Ok(self.bpp.borrow());
        }
        self.f_bpp.set(true);
        *self.bpp.borrow_mut() = (((*self.flags() as u32) & (3 as u32))) as i32;
        Ok(self.bpp.borrow())
    }
    pub fn has_clut(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_clut.get() {
            return Ok(self.has_clut.borrow());
        }
        self.f_has_clut.set(true);
        *self.has_clut.borrow_mut() = (((((*self.flags() as u32) & (8 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.has_clut.borrow())
    }
}
impl PsxTim {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}

/**
 * Encodes bits-per-pixel and whether CLUT is present in a file or not
 */
impl PsxTim {
    pub fn flags(&self) -> Ref<'_, u32> {
        self.flags.borrow()
    }
}

/**
 * CLUT (Color LookUp Table), one or several palettes for indexed color image, represented as a
 */
impl PsxTim {
    pub fn clut(&self) -> Ref<'_, OptRc<PsxTim_Bitmap>> {
        self.clut.borrow()
    }
}
impl PsxTim {
    pub fn img(&self) -> Ref<'_, OptRc<PsxTim_Bitmap>> {
        self.img.borrow()
    }
}
impl PsxTim {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum PsxTim_BppType {
    Bpp4,
    Bpp8,
    Bpp16,
    Bpp24,
    Unknown(i64),
}

impl TryFrom<i64> for PsxTim_BppType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<PsxTim_BppType> {
        match flag {
            0 => Ok(PsxTim_BppType::Bpp4),
            1 => Ok(PsxTim_BppType::Bpp8),
            2 => Ok(PsxTim_BppType::Bpp16),
            3 => Ok(PsxTim_BppType::Bpp24),
            _ => Ok(PsxTim_BppType::Unknown(flag)),
        }
    }
}

impl From<&PsxTim_BppType> for i64 {
    fn from(v: &PsxTim_BppType) -> Self {
        match *v {
            PsxTim_BppType::Bpp4 => 0,
            PsxTim_BppType::Bpp8 => 1,
            PsxTim_BppType::Bpp16 => 2,
            PsxTim_BppType::Bpp24 => 3,
            PsxTim_BppType::Unknown(v) => v
        }
    }
}

impl Default for PsxTim_BppType {
    fn default() -> Self { PsxTim_BppType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct PsxTim_Bitmap {
    pub _root: SharedType<PsxTim>,
    pub _parent: SharedType<PsxTim>,
    pub _self: SharedType<Self>,
    len: RefCell<u32>,
    origin_x: RefCell<u16>,
    origin_y: RefCell<u16>,
    width: RefCell<u16>,
    height: RefCell<u16>,
    body: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PsxTim_Bitmap {
    type Root = PsxTim;
    type Parent = PsxTim;

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
        *self_rc.len.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.origin_x.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.origin_y.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.width.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.height.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.body.borrow_mut() = _io.read_bytes(((*self_rc.len() as u32) - (12 as u32)) as usize)?.into();
        Ok(())
    }
}
impl PsxTim_Bitmap {
}
impl PsxTim_Bitmap {
    pub fn len(&self) -> Ref<'_, u32> {
        self.len.borrow()
    }
}
impl PsxTim_Bitmap {
    pub fn origin_x(&self) -> Ref<'_, u16> {
        self.origin_x.borrow()
    }
}
impl PsxTim_Bitmap {
    pub fn origin_y(&self) -> Ref<'_, u16> {
        self.origin_y.borrow()
    }
}
impl PsxTim_Bitmap {
    pub fn width(&self) -> Ref<'_, u16> {
        self.width.borrow()
    }
}
impl PsxTim_Bitmap {
    pub fn height(&self) -> Ref<'_, u16> {
        self.height.borrow()
    }
}
impl PsxTim_Bitmap {
    pub fn body(&self) -> Ref<'_, Vec<u8>> {
        self.body.borrow()
    }
}
impl PsxTim_Bitmap {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

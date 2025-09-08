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
 * A bootloader image which only seems to have been used on a few ASUS
 * devices. The encoding is ASCII, because the `releasetools.py` script
 * is written using Python 2, where the default encoding is ASCII.
 * 
 * A test file can be found in the firmware files for the "fugu" device,
 * which can be downloaded from <https://developers.google.com/android/images>
 * \sa https://android.googlesource.com/device/asus/fugu/+/android-8.1.0_r5/releasetools.py Source
 */

#[derive(Default, Debug, Clone)]
pub struct AndroidBootldrAsus {
    pub _root: SharedType<AndroidBootldrAsus>,
    pub _parent: SharedType<AndroidBootldrAsus>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    revision: RefCell<u16>,
    reserved1: RefCell<u16>,
    reserved2: RefCell<u32>,
    images: RefCell<Vec<OptRc<AndroidBootldrAsus_Image>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AndroidBootldrAsus {
    type Root = AndroidBootldrAsus;
    type Parent = AndroidBootldrAsus;

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
        if !(*self_rc.magic() == vec![0x42u8, 0x4fu8, 0x4fu8, 0x54u8, 0x4cu8, 0x44u8, 0x52u8, 0x21u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.revision.borrow_mut() = _io.read_u2le()?.into();
        if !(((*self_rc.revision() as u16) >= (2 as u16))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/seq/1".to_string() }));
        }
        *self_rc.reserved1.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.reserved2.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.images.borrow_mut() = Vec::new();
        let l_images = 3;
        for _i in 0..l_images {
            let t = Self::read_into::<_, AndroidBootldrAsus_Image>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.images.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl AndroidBootldrAsus {
}
impl AndroidBootldrAsus {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl AndroidBootldrAsus {
    pub fn revision(&self) -> Ref<'_, u16> {
        self.revision.borrow()
    }
}
impl AndroidBootldrAsus {
    pub fn reserved1(&self) -> Ref<'_, u16> {
        self.reserved1.borrow()
    }
}
impl AndroidBootldrAsus {
    pub fn reserved2(&self) -> Ref<'_, u32> {
        self.reserved2.borrow()
    }
}

/**
 * Only three images are included: `ifwi.bin`, `droidboot.img`
 * and `splashscreen.img`
 */
impl AndroidBootldrAsus {
    pub fn images(&self) -> Ref<'_, Vec<OptRc<AndroidBootldrAsus_Image>>> {
        self.images.borrow()
    }
}
impl AndroidBootldrAsus {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct AndroidBootldrAsus_Image {
    pub _root: SharedType<AndroidBootldrAsus>,
    pub _parent: SharedType<AndroidBootldrAsus>,
    pub _self: SharedType<Self>,
    chunk_id: RefCell<String>,
    len_body: RefCell<u32>,
    flags: RefCell<u8>,
    reserved1: RefCell<u8>,
    reserved2: RefCell<u8>,
    reserved3: RefCell<u8>,
    body: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_file_name: Cell<bool>,
    file_name: RefCell<String>,
}
impl KStruct for AndroidBootldrAsus_Image {
    type Root = AndroidBootldrAsus;
    type Parent = AndroidBootldrAsus;

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
        *self_rc.chunk_id.borrow_mut() = bytes_to_str(&_io.read_bytes(8 as usize)?.into(), "ASCII")?;
        if !( ((*self_rc.chunk_id() == "IFWI!!!!".to_string()) || (*self_rc.chunk_id() == "DROIDBT!".to_string()) || (*self_rc.chunk_id() == "SPLASHS!".to_string())) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotAnyOf, src_path: "/types/image/seq/0".to_string() }));
        }
        *self_rc.len_body.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.flags.borrow_mut() = _io.read_u1()?.into();
        let _tmpa = *self_rc.flags();
        if !(((((_tmpa as u8) & (1 as u8)) as i32) != (0 as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/image/seq/2".to_string() }));
        }
        *self_rc.reserved1.borrow_mut() = _io.read_u1()?.into();
        *self_rc.reserved2.borrow_mut() = _io.read_u1()?.into();
        *self_rc.reserved3.borrow_mut() = _io.read_u1()?.into();
        *self_rc.body.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
        Ok(())
    }
}
impl AndroidBootldrAsus_Image {
    pub fn file_name(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_file_name.get() {
            return Ok(self.file_name.borrow());
        }
        self.f_file_name.set(true);
        *self.file_name.borrow_mut() = if *self.chunk_id() == "IFWI!!!!".to_string() { "ifwi.bin".to_string() } else { if *self.chunk_id() == "DROIDBT!".to_string() { "droidboot.img".to_string() } else { if *self.chunk_id() == "SPLASHS!".to_string() { "splashscreen.img".to_string() } else { "".to_string() }.to_string() }.to_string() }.to_string();
        Ok(self.file_name.borrow())
    }
}
impl AndroidBootldrAsus_Image {
    pub fn chunk_id(&self) -> Ref<'_, String> {
        self.chunk_id.borrow()
    }
}
impl AndroidBootldrAsus_Image {
    pub fn len_body(&self) -> Ref<'_, u32> {
        self.len_body.borrow()
    }
}
impl AndroidBootldrAsus_Image {
    pub fn flags(&self) -> Ref<'_, u8> {
        self.flags.borrow()
    }
}
impl AndroidBootldrAsus_Image {
    pub fn reserved1(&self) -> Ref<'_, u8> {
        self.reserved1.borrow()
    }
}
impl AndroidBootldrAsus_Image {
    pub fn reserved2(&self) -> Ref<'_, u8> {
        self.reserved2.borrow()
    }
}
impl AndroidBootldrAsus_Image {
    pub fn reserved3(&self) -> Ref<'_, u8> {
        self.reserved3.borrow()
    }
}
impl AndroidBootldrAsus_Image {
    pub fn body(&self) -> Ref<'_, Vec<u8>> {
        self.body.borrow()
    }
}
impl AndroidBootldrAsus_Image {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

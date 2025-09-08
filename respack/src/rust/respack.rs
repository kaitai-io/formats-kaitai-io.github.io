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
 * Resource file found in CPB firmware archives, mostly used on older CoolPad
 * phones and/or tablets. The only observed files are called "ResPack.cfg".
 */

#[derive(Default, Debug, Clone)]
pub struct Respack {
    pub _root: SharedType<Respack>,
    pub _parent: SharedType<Respack>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<Respack_Header>>,
    json: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Respack {
    type Root = Respack;
    type Parent = Respack;

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
        let t = Self::read_into::<_, Respack_Header>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        *self_rc.json.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.header().len_json() as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Respack {
}
impl Respack {
    pub fn header(&self) -> Ref<'_, OptRc<Respack_Header>> {
        self.header.borrow()
    }
}
impl Respack {
    pub fn json(&self) -> Ref<'_, String> {
        self.json.borrow()
    }
}
impl Respack {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Respack_Header {
    pub _root: SharedType<Respack>,
    pub _parent: SharedType<Respack>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    unknown: RefCell<Vec<u8>>,
    len_json: RefCell<u32>,
    md5: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Respack_Header {
    type Root = Respack;
    type Parent = Respack;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.magic() == vec![0x52u8, 0x53u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/seq/0".to_string() }));
        }
        *self_rc.unknown.borrow_mut() = _io.read_bytes(8 as usize)?.into();
        *self_rc.len_json.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.md5.borrow_mut() = bytes_to_str(&_io.read_bytes(32 as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Respack_Header {
}
impl Respack_Header {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl Respack_Header {
    pub fn unknown(&self) -> Ref<'_, Vec<u8>> {
        self.unknown.borrow()
    }
}
impl Respack_Header {
    pub fn len_json(&self) -> Ref<'_, u32> {
        self.len_json.borrow()
    }
}

/**
 * MD5 of data that follows the header
 */
impl Respack_Header {
    pub fn md5(&self) -> Ref<'_, String> {
        self.md5.borrow()
    }
}
impl Respack_Header {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

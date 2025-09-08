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
use super::pcx::Pcx;

/**
 * DCX is a simple extension of PCX image format allowing to bundle
 * many PCX images (typically, pages of a document) in one file. It saw
 * some limited use in DOS-era fax software, but was largely
 * superseded with multi-page TIFFs and PDFs since then.
 */

#[derive(Default, Debug, Clone)]
pub struct PcxDcx {
    pub _root: SharedType<PcxDcx>,
    pub _parent: SharedType<PcxDcx>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    files: RefCell<Vec<OptRc<PcxDcx_PcxOffset>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PcxDcx {
    type Root = PcxDcx;
    type Parent = PcxDcx;

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
        if !(*self_rc.magic() == vec![0xb1u8, 0x68u8, 0xdeu8, 0x3au8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.files.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let t = Self::read_into::<_, PcxDcx_PcxOffset>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.files.borrow_mut().push(t);
                let _t_files = self_rc.files.borrow();
                let _tmpa = _t_files.last().unwrap();
                _i += 1;
                let x = !(((*_tmpa.ofs_body() as u32) == (0 as u32)));
                x
            } {}
        }
        Ok(())
    }
}
impl PcxDcx {
}
impl PcxDcx {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl PcxDcx {
    pub fn files(&self) -> Ref<'_, Vec<OptRc<PcxDcx_PcxOffset>>> {
        self.files.borrow()
    }
}
impl PcxDcx {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct PcxDcx_PcxOffset {
    pub _root: SharedType<PcxDcx>,
    pub _parent: SharedType<PcxDcx>,
    pub _self: SharedType<Self>,
    ofs_body: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_body: Cell<bool>,
    body: RefCell<OptRc<Pcx>>,
}
impl KStruct for PcxDcx_PcxOffset {
    type Root = PcxDcx;
    type Parent = PcxDcx;

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
        *self_rc.ofs_body.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl PcxDcx_PcxOffset {
    pub fn body(
        &self
    ) -> KResult<Ref<'_, OptRc<Pcx>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_body.get() {
            return Ok(self.body.borrow());
        }
        if ((*self.ofs_body() as u32) != (0 as u32)) {
            let _pos = _io.pos();
            _io.seek(*self.ofs_body() as usize)?;
            let t = Self::read_into::<_, Pcx>(&*_io, None, None)?.into();
            *self.body.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.body.borrow())
    }
}
impl PcxDcx_PcxOffset {
    pub fn ofs_body(&self) -> Ref<'_, u32> {
        self.ofs_body.borrow()
    }
}
impl PcxDcx_PcxOffset {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

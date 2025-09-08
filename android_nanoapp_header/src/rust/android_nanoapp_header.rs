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
 * \sa https://android.googlesource.com/platform/system/chre/+/a7ff61b9/build/build_template.mk#130 Source
 */

#[derive(Default, Debug, Clone)]
pub struct AndroidNanoappHeader {
    pub _root: SharedType<AndroidNanoappHeader>,
    pub _parent: SharedType<AndroidNanoappHeader>,
    pub _self: SharedType<Self>,
    header_version: RefCell<u32>,
    magic: RefCell<Vec<u8>>,
    app_id: RefCell<u64>,
    app_version: RefCell<u32>,
    flags: RefCell<u32>,
    hub_type: RefCell<u64>,
    chre_api_major_version: RefCell<u8>,
    chre_api_minor_version: RefCell<u8>,
    reserved: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_is_encrypted: Cell<bool>,
    is_encrypted: RefCell<bool>,
    f_is_signed: Cell<bool>,
    is_signed: RefCell<bool>,
    f_is_tcm_capable: Cell<bool>,
    is_tcm_capable: RefCell<bool>,
}
impl KStruct for AndroidNanoappHeader {
    type Root = AndroidNanoappHeader;
    type Parent = AndroidNanoappHeader;

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
        *self_rc.header_version.borrow_mut() = _io.read_u4le()?.into();
        if !(((*self_rc.header_version() as u32) == (1 as u32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.magic.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.magic() == vec![0x4eu8, 0x41u8, 0x4eu8, 0x4fu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/1".to_string() }));
        }
        *self_rc.app_id.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.app_version.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.flags.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.hub_type.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.chre_api_major_version.borrow_mut() = _io.read_u1()?.into();
        *self_rc.chre_api_minor_version.borrow_mut() = _io.read_u1()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_bytes(6 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/8".to_string() }));
        }
        Ok(())
    }
}
impl AndroidNanoappHeader {
    pub fn is_encrypted(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_encrypted.get() {
            return Ok(self.is_encrypted.borrow());
        }
        self.f_is_encrypted.set(true);
        *self.is_encrypted.borrow_mut() = (((((*self.flags() as u32) & (2 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.is_encrypted.borrow())
    }
    pub fn is_signed(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_signed.get() {
            return Ok(self.is_signed.borrow());
        }
        self.f_is_signed.set(true);
        *self.is_signed.borrow_mut() = (((((*self.flags() as u32) & (1 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.is_signed.borrow())
    }
    pub fn is_tcm_capable(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_tcm_capable.get() {
            return Ok(self.is_tcm_capable.borrow());
        }
        self.f_is_tcm_capable.set(true);
        *self.is_tcm_capable.borrow_mut() = (((((*self.flags() as u32) & (4 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.is_tcm_capable.borrow())
    }
}
impl AndroidNanoappHeader {
    pub fn header_version(&self) -> Ref<'_, u32> {
        self.header_version.borrow()
    }
}
impl AndroidNanoappHeader {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl AndroidNanoappHeader {
    pub fn app_id(&self) -> Ref<'_, u64> {
        self.app_id.borrow()
    }
}
impl AndroidNanoappHeader {
    pub fn app_version(&self) -> Ref<'_, u32> {
        self.app_version.borrow()
    }
}
impl AndroidNanoappHeader {
    pub fn flags(&self) -> Ref<'_, u32> {
        self.flags.borrow()
    }
}
impl AndroidNanoappHeader {
    pub fn hub_type(&self) -> Ref<'_, u64> {
        self.hub_type.borrow()
    }
}
impl AndroidNanoappHeader {
    pub fn chre_api_major_version(&self) -> Ref<'_, u8> {
        self.chre_api_major_version.borrow()
    }
}
impl AndroidNanoappHeader {
    pub fn chre_api_minor_version(&self) -> Ref<'_, u8> {
        self.chre_api_minor_version.borrow()
    }
}
impl AndroidNanoappHeader {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl AndroidNanoappHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

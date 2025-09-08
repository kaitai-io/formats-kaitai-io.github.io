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
 * Firmware image found with MediaTek MT76xx wifi chipsets.
 */

#[derive(Default, Debug, Clone)]
pub struct AndesFirmware {
    pub _root: SharedType<AndesFirmware>,
    pub _parent: SharedType<AndesFirmware>,
    pub _self: SharedType<Self>,
    image_header: RefCell<OptRc<AndesFirmware_ImageHeader>>,
    ilm: RefCell<Vec<u8>>,
    dlm: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    image_header_raw: RefCell<Vec<u8>>,
}
impl KStruct for AndesFirmware {
    type Root = AndesFirmware;
    type Parent = AndesFirmware;

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
        *self_rc.image_header_raw.borrow_mut() = _io.read_bytes(32 as usize)?.into();
        let image_header_raw = self_rc.image_header_raw.borrow();
        let _t_image_header_raw_io = BytesReader::from(image_header_raw.clone());
        let t = Self::read_into::<BytesReader, AndesFirmware_ImageHeader>(&_t_image_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.image_header.borrow_mut() = t;
        *self_rc.ilm.borrow_mut() = _io.read_bytes(*self_rc.image_header().ilm_len() as usize)?.into();
        *self_rc.dlm.borrow_mut() = _io.read_bytes(*self_rc.image_header().dlm_len() as usize)?.into();
        Ok(())
    }
}
impl AndesFirmware {
}
impl AndesFirmware {
    pub fn image_header(&self) -> Ref<'_, OptRc<AndesFirmware_ImageHeader>> {
        self.image_header.borrow()
    }
}
impl AndesFirmware {
    pub fn ilm(&self) -> Ref<'_, Vec<u8>> {
        self.ilm.borrow()
    }
}
impl AndesFirmware {
    pub fn dlm(&self) -> Ref<'_, Vec<u8>> {
        self.dlm.borrow()
    }
}
impl AndesFirmware {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl AndesFirmware {
    pub fn image_header_raw(&self) -> Ref<'_, Vec<u8>> {
        self.image_header_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct AndesFirmware_ImageHeader {
    pub _root: SharedType<AndesFirmware>,
    pub _parent: SharedType<AndesFirmware>,
    pub _self: SharedType<Self>,
    ilm_len: RefCell<u32>,
    dlm_len: RefCell<u32>,
    fw_ver: RefCell<u16>,
    build_ver: RefCell<u16>,
    extra: RefCell<u32>,
    build_time: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AndesFirmware_ImageHeader {
    type Root = AndesFirmware;
    type Parent = AndesFirmware;

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
        *self_rc.ilm_len.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.dlm_len.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.fw_ver.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.build_ver.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.extra.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.build_time.borrow_mut() = bytes_to_str(&_io.read_bytes(16 as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl AndesFirmware_ImageHeader {
}
impl AndesFirmware_ImageHeader {
    pub fn ilm_len(&self) -> Ref<'_, u32> {
        self.ilm_len.borrow()
    }
}
impl AndesFirmware_ImageHeader {
    pub fn dlm_len(&self) -> Ref<'_, u32> {
        self.dlm_len.borrow()
    }
}
impl AndesFirmware_ImageHeader {
    pub fn fw_ver(&self) -> Ref<'_, u16> {
        self.fw_ver.borrow()
    }
}
impl AndesFirmware_ImageHeader {
    pub fn build_ver(&self) -> Ref<'_, u16> {
        self.build_ver.borrow()
    }
}
impl AndesFirmware_ImageHeader {
    pub fn extra(&self) -> Ref<'_, u32> {
        self.extra.borrow()
    }
}
impl AndesFirmware_ImageHeader {
    pub fn build_time(&self) -> Ref<'_, String> {
        self.build_time.borrow()
    }
}
impl AndesFirmware_ImageHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

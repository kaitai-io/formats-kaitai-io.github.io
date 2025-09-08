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
use super::some_ip_sd_options::SomeIpSdOptions;
use super::some_ip_sd_entries::SomeIpSdEntries;

/**
 * The main tasks of the Service Discovery Protocol are communicating the
 * availability of functional entities called services in the in-vehicle
 * communication as well as controlling the send behavior of event messages.
 * This allows sending only event messages to receivers requiring them (Publish/Subscribe).
 * The solution described here is also known as SOME/IP-SD
 * (Scalable service-Oriented MiddlewarE over IP - Service Discovery).
 * \sa https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf Source
 */

#[derive(Default, Debug, Clone)]
pub struct SomeIpSd {
    pub _root: SharedType<SomeIpSd>,
    pub _parent: SharedType<SomeIpSd>,
    pub _self: SharedType<Self>,
    flags: RefCell<OptRc<SomeIpSd_SdFlags>>,
    reserved: RefCell<Vec<u8>>,
    len_entries: RefCell<u32>,
    entries: RefCell<OptRc<SomeIpSdEntries>>,
    len_options: RefCell<u32>,
    options: RefCell<OptRc<SomeIpSdOptions>>,
    _io: RefCell<BytesReader>,
    entries_raw: RefCell<Vec<u8>>,
    options_raw: RefCell<Vec<u8>>,
}
impl KStruct for SomeIpSd {
    type Root = SomeIpSd;
    type Parent = SomeIpSd;

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
        let t = Self::read_into::<_, SomeIpSd_SdFlags>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.flags.borrow_mut() = t;
        *self_rc.reserved.borrow_mut() = _io.read_bytes(3 as usize)?.into();
        *self_rc.len_entries.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.entries_raw.borrow_mut() = _io.read_bytes(*self_rc.len_entries() as usize)?.into();
        let entries_raw = self_rc.entries_raw.borrow();
        let _t_entries_raw_io = BytesReader::from(entries_raw.clone());
        let t = Self::read_into::<BytesReader, SomeIpSdEntries>(&_t_entries_raw_io, None, None)?.into();
        *self_rc.entries.borrow_mut() = t;
        *self_rc.len_options.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.options_raw.borrow_mut() = _io.read_bytes(*self_rc.len_options() as usize)?.into();
        let options_raw = self_rc.options_raw.borrow();
        let _t_options_raw_io = BytesReader::from(options_raw.clone());
        let t = Self::read_into::<BytesReader, SomeIpSdOptions>(&_t_options_raw_io, None, None)?.into();
        *self_rc.options.borrow_mut() = t;
        Ok(())
    }
}
impl SomeIpSd {
}

/**
 * The SOME/IP-SD Header shall start with an 8 Bit field called flags.
 */
impl SomeIpSd {
    pub fn flags(&self) -> Ref<'_, OptRc<SomeIpSd_SdFlags>> {
        self.flags.borrow()
    }
}
impl SomeIpSd {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl SomeIpSd {
    pub fn len_entries(&self) -> Ref<'_, u32> {
        self.len_entries.borrow()
    }
}
impl SomeIpSd {
    pub fn entries(&self) -> Ref<'_, OptRc<SomeIpSdEntries>> {
        self.entries.borrow()
    }
}
impl SomeIpSd {
    pub fn len_options(&self) -> Ref<'_, u32> {
        self.len_options.borrow()
    }
}
impl SomeIpSd {
    pub fn options(&self) -> Ref<'_, OptRc<SomeIpSdOptions>> {
        self.options.borrow()
    }
}
impl SomeIpSd {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl SomeIpSd {
    pub fn entries_raw(&self) -> Ref<'_, Vec<u8>> {
        self.entries_raw.borrow()
    }
}
impl SomeIpSd {
    pub fn options_raw(&self) -> Ref<'_, Vec<u8>> {
        self.options_raw.borrow()
    }
}

/**
 * \sa AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf - Figure 4.3
 */

#[derive(Default, Debug, Clone)]
pub struct SomeIpSd_SdFlags {
    pub _root: SharedType<SomeIpSd>,
    pub _parent: SharedType<SomeIpSd>,
    pub _self: SharedType<Self>,
    reboot: RefCell<bool>,
    unicast: RefCell<bool>,
    initial_data: RefCell<bool>,
    reserved: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SomeIpSd_SdFlags {
    type Root = SomeIpSd;
    type Parent = SomeIpSd;

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
        *self_rc.reboot.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.unicast.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.initial_data.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.reserved.borrow_mut() = _io.read_bits_int_be(5)?;
        Ok(())
    }
}
impl SomeIpSd_SdFlags {
}
impl SomeIpSd_SdFlags {
    pub fn reboot(&self) -> Ref<'_, bool> {
        self.reboot.borrow()
    }
}
impl SomeIpSd_SdFlags {
    pub fn unicast(&self) -> Ref<'_, bool> {
        self.unicast.borrow()
    }
}
impl SomeIpSd_SdFlags {
    pub fn initial_data(&self) -> Ref<'_, bool> {
        self.initial_data.borrow()
    }
}
impl SomeIpSd_SdFlags {
    pub fn reserved(&self) -> Ref<'_, u64> {
        self.reserved.borrow()
    }
}
impl SomeIpSd_SdFlags {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

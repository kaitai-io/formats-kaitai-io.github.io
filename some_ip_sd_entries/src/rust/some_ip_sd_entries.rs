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
 * The entries are used to synchronize the state of services instances and the
 * Publish/-Subscribe handling.
 * \sa https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf
 * - section 4.1.2.3  Entry Format
 */

#[derive(Default, Debug, Clone)]
pub struct SomeIpSdEntries {
    pub _root: SharedType<SomeIpSdEntries>,
    pub _parent: SharedType<SomeIpSdEntries>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<SomeIpSdEntries_SdEntry>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SomeIpSdEntries {
    type Root = SomeIpSdEntries;
    type Parent = SomeIpSdEntries;

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
                let t = Self::read_into::<_, SomeIpSdEntries_SdEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl SomeIpSdEntries {
}
impl SomeIpSdEntries {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<SomeIpSdEntries_SdEntry>>> {
        self.entries.borrow()
    }
}
impl SomeIpSdEntries {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct SomeIpSdEntries_SdEntry {
    pub _root: SharedType<SomeIpSdEntries>,
    pub _parent: SharedType<SomeIpSdEntries>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<SomeIpSdEntries_SdEntry_SdEntryHeader>>,
    content: RefCell<Option<SomeIpSdEntries_SdEntry_Content>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum SomeIpSdEntries_SdEntry_Content {
    SomeIpSdEntries_SdEntry_SdServiceEntry(OptRc<SomeIpSdEntries_SdEntry_SdServiceEntry>),
    SomeIpSdEntries_SdEntry_SdEventgroupEntry(OptRc<SomeIpSdEntries_SdEntry_SdEventgroupEntry>),
}
impl From<&SomeIpSdEntries_SdEntry_Content> for OptRc<SomeIpSdEntries_SdEntry_SdServiceEntry> {
    fn from(v: &SomeIpSdEntries_SdEntry_Content) -> Self {
        if let SomeIpSdEntries_SdEntry_Content::SomeIpSdEntries_SdEntry_SdServiceEntry(x) = v {
            return x.clone();
        }
        panic!("expected SomeIpSdEntries_SdEntry_Content::SomeIpSdEntries_SdEntry_SdServiceEntry, got {:?}", v)
    }
}
impl From<OptRc<SomeIpSdEntries_SdEntry_SdServiceEntry>> for SomeIpSdEntries_SdEntry_Content {
    fn from(v: OptRc<SomeIpSdEntries_SdEntry_SdServiceEntry>) -> Self {
        Self::SomeIpSdEntries_SdEntry_SdServiceEntry(v)
    }
}
impl From<&SomeIpSdEntries_SdEntry_Content> for OptRc<SomeIpSdEntries_SdEntry_SdEventgroupEntry> {
    fn from(v: &SomeIpSdEntries_SdEntry_Content) -> Self {
        if let SomeIpSdEntries_SdEntry_Content::SomeIpSdEntries_SdEntry_SdEventgroupEntry(x) = v {
            return x.clone();
        }
        panic!("expected SomeIpSdEntries_SdEntry_Content::SomeIpSdEntries_SdEntry_SdEventgroupEntry, got {:?}", v)
    }
}
impl From<OptRc<SomeIpSdEntries_SdEntry_SdEventgroupEntry>> for SomeIpSdEntries_SdEntry_Content {
    fn from(v: OptRc<SomeIpSdEntries_SdEntry_SdEventgroupEntry>) -> Self {
        Self::SomeIpSdEntries_SdEntry_SdEventgroupEntry(v)
    }
}
impl KStruct for SomeIpSdEntries_SdEntry {
    type Root = SomeIpSdEntries;
    type Parent = SomeIpSdEntries;

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
        let t = Self::read_into::<_, SomeIpSdEntries_SdEntry_SdEntryHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        match *self_rc.header().type() {
            SomeIpSdEntries_SdEntry_EntryTypes::Find => {
                let t = Self::read_into::<_, SomeIpSdEntries_SdEntry_SdServiceEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            SomeIpSdEntries_SdEntry_EntryTypes::Offer => {
                let t = Self::read_into::<_, SomeIpSdEntries_SdEntry_SdServiceEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            SomeIpSdEntries_SdEntry_EntryTypes::Subscribe => {
                let t = Self::read_into::<_, SomeIpSdEntries_SdEntry_SdEventgroupEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            SomeIpSdEntries_SdEntry_EntryTypes::SubscribeAck => {
                let t = Self::read_into::<_, SomeIpSdEntries_SdEntry_SdEventgroupEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl SomeIpSdEntries_SdEntry {
}
impl SomeIpSdEntries_SdEntry {
    pub fn header(&self) -> Ref<'_, OptRc<SomeIpSdEntries_SdEntry_SdEntryHeader>> {
        self.header.borrow()
    }
}
impl SomeIpSdEntries_SdEntry {
    pub fn content(&self) -> Ref<'_, Option<SomeIpSdEntries_SdEntry_Content>> {
        self.content.borrow()
    }
}
impl SomeIpSdEntries_SdEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum SomeIpSdEntries_SdEntry_EntryTypes {
    Find,
    Offer,
    Subscribe,
    SubscribeAck,
    Unknown(i64),
}

impl TryFrom<i64> for SomeIpSdEntries_SdEntry_EntryTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<SomeIpSdEntries_SdEntry_EntryTypes> {
        match flag {
            0 => Ok(SomeIpSdEntries_SdEntry_EntryTypes::Find),
            1 => Ok(SomeIpSdEntries_SdEntry_EntryTypes::Offer),
            6 => Ok(SomeIpSdEntries_SdEntry_EntryTypes::Subscribe),
            7 => Ok(SomeIpSdEntries_SdEntry_EntryTypes::SubscribeAck),
            _ => Ok(SomeIpSdEntries_SdEntry_EntryTypes::Unknown(flag)),
        }
    }
}

impl From<&SomeIpSdEntries_SdEntry_EntryTypes> for i64 {
    fn from(v: &SomeIpSdEntries_SdEntry_EntryTypes) -> Self {
        match *v {
            SomeIpSdEntries_SdEntry_EntryTypes::Find => 0,
            SomeIpSdEntries_SdEntry_EntryTypes::Offer => 1,
            SomeIpSdEntries_SdEntry_EntryTypes::Subscribe => 6,
            SomeIpSdEntries_SdEntry_EntryTypes::SubscribeAck => 7,
            SomeIpSdEntries_SdEntry_EntryTypes::Unknown(v) => v
        }
    }
}

impl Default for SomeIpSdEntries_SdEntry_EntryTypes {
    fn default() -> Self { SomeIpSdEntries_SdEntry_EntryTypes::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct SomeIpSdEntries_SdEntry_SdEntryHeader {
    pub _root: SharedType<SomeIpSdEntries>,
    pub _parent: SharedType<SomeIpSdEntries_SdEntry>,
    pub _self: SharedType<Self>,
    type: RefCell<SomeIpSdEntries_SdEntry_EntryTypes>,
    index_first_options: RefCell<u8>,
    index_second_options: RefCell<u8>,
    number_first_options: RefCell<u64>,
    number_second_options: RefCell<u64>,
    service_id: RefCell<u16>,
    instance_id: RefCell<u16>,
    major_version: RefCell<u8>,
    ttl: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SomeIpSdEntries_SdEntry_SdEntryHeader {
    type Root = SomeIpSdEntries;
    type Parent = SomeIpSdEntries_SdEntry;

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
        *self_rc.type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.index_first_options.borrow_mut() = _io.read_u1()?.into();
        *self_rc.index_second_options.borrow_mut() = _io.read_u1()?.into();
        *self_rc.number_first_options.borrow_mut() = _io.read_bits_int_be(4)?;
        *self_rc.number_second_options.borrow_mut() = _io.read_bits_int_be(4)?;
        _io.align_to_byte()?;
        *self_rc.service_id.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.instance_id.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.major_version.borrow_mut() = _io.read_u1()?.into();
        *self_rc.ttl.borrow_mut() = _io.read_bits_int_be(24)?;
        Ok(())
    }
}
impl SomeIpSdEntries_SdEntry_SdEntryHeader {
}
impl SomeIpSdEntries_SdEntry_SdEntryHeader {
    pub fn type(&self) -> Ref<'_, SomeIpSdEntries_SdEntry_EntryTypes> {
        self.type.borrow()
    }
}
impl SomeIpSdEntries_SdEntry_SdEntryHeader {
    pub fn index_first_options(&self) -> Ref<'_, u8> {
        self.index_first_options.borrow()
    }
}
impl SomeIpSdEntries_SdEntry_SdEntryHeader {
    pub fn index_second_options(&self) -> Ref<'_, u8> {
        self.index_second_options.borrow()
    }
}
impl SomeIpSdEntries_SdEntry_SdEntryHeader {
    pub fn number_first_options(&self) -> Ref<'_, u64> {
        self.number_first_options.borrow()
    }
}
impl SomeIpSdEntries_SdEntry_SdEntryHeader {
    pub fn number_second_options(&self) -> Ref<'_, u64> {
        self.number_second_options.borrow()
    }
}
impl SomeIpSdEntries_SdEntry_SdEntryHeader {
    pub fn service_id(&self) -> Ref<'_, u16> {
        self.service_id.borrow()
    }
}
impl SomeIpSdEntries_SdEntry_SdEntryHeader {
    pub fn instance_id(&self) -> Ref<'_, u16> {
        self.instance_id.borrow()
    }
}
impl SomeIpSdEntries_SdEntry_SdEntryHeader {
    pub fn major_version(&self) -> Ref<'_, u8> {
        self.major_version.borrow()
    }
}
impl SomeIpSdEntries_SdEntry_SdEntryHeader {
    pub fn ttl(&self) -> Ref<'_, u64> {
        self.ttl.borrow()
    }
}
impl SomeIpSdEntries_SdEntry_SdEntryHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct SomeIpSdEntries_SdEntry_SdEventgroupEntry {
    pub _root: SharedType<SomeIpSdEntries>,
    pub _parent: SharedType<SomeIpSdEntries_SdEntry>,
    pub _self: SharedType<Self>,
    reserved: RefCell<u8>,
    initial_data_requested: RefCell<bool>,
    reserved2: RefCell<u64>,
    counter: RefCell<u64>,
    event_group_id: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SomeIpSdEntries_SdEntry_SdEventgroupEntry {
    type Root = SomeIpSdEntries;
    type Parent = SomeIpSdEntries_SdEntry;

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
        *self_rc.reserved.borrow_mut() = _io.read_u1()?.into();
        *self_rc.initial_data_requested.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.reserved2.borrow_mut() = _io.read_bits_int_be(3)?;
        *self_rc.counter.borrow_mut() = _io.read_bits_int_be(4)?;
        _io.align_to_byte()?;
        *self_rc.event_group_id.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl SomeIpSdEntries_SdEntry_SdEventgroupEntry {
}
impl SomeIpSdEntries_SdEntry_SdEventgroupEntry {
    pub fn reserved(&self) -> Ref<'_, u8> {
        self.reserved.borrow()
    }
}
impl SomeIpSdEntries_SdEntry_SdEventgroupEntry {
    pub fn initial_data_requested(&self) -> Ref<'_, bool> {
        self.initial_data_requested.borrow()
    }
}
impl SomeIpSdEntries_SdEntry_SdEventgroupEntry {
    pub fn reserved2(&self) -> Ref<'_, u64> {
        self.reserved2.borrow()
    }
}
impl SomeIpSdEntries_SdEntry_SdEventgroupEntry {
    pub fn counter(&self) -> Ref<'_, u64> {
        self.counter.borrow()
    }
}
impl SomeIpSdEntries_SdEntry_SdEventgroupEntry {
    pub fn event_group_id(&self) -> Ref<'_, u16> {
        self.event_group_id.borrow()
    }
}
impl SomeIpSdEntries_SdEntry_SdEventgroupEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct SomeIpSdEntries_SdEntry_SdServiceEntry {
    pub _root: SharedType<SomeIpSdEntries>,
    pub _parent: SharedType<SomeIpSdEntries_SdEntry>,
    pub _self: SharedType<Self>,
    minor_version: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SomeIpSdEntries_SdEntry_SdServiceEntry {
    type Root = SomeIpSdEntries;
    type Parent = SomeIpSdEntries_SdEntry;

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
        *self_rc.minor_version.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl SomeIpSdEntries_SdEntry_SdServiceEntry {
}
impl SomeIpSdEntries_SdEntry_SdServiceEntry {
    pub fn minor_version(&self) -> Ref<'_, u32> {
        self.minor_version.borrow()
    }
}
impl SomeIpSdEntries_SdEntry_SdServiceEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

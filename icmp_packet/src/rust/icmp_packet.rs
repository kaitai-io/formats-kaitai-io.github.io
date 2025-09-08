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

#[derive(Default, Debug, Clone)]
pub struct IcmpPacket {
    pub _root: SharedType<IcmpPacket>,
    pub _parent: SharedType<IcmpPacket>,
    pub _self: SharedType<Self>,
    icmp_type: RefCell<IcmpPacket_IcmpTypeEnum>,
    destination_unreachable: RefCell<OptRc<IcmpPacket_DestinationUnreachableMsg>>,
    time_exceeded: RefCell<OptRc<IcmpPacket_TimeExceededMsg>>,
    echo: RefCell<OptRc<IcmpPacket_EchoMsg>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for IcmpPacket {
    type Root = IcmpPacket;
    type Parent = IcmpPacket;

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
        *self_rc.icmp_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        if *self_rc.icmp_type() == IcmpPacket_IcmpTypeEnum::DestinationUnreachable {
            let t = Self::read_into::<_, IcmpPacket_DestinationUnreachableMsg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.destination_unreachable.borrow_mut() = t;
        }
        if *self_rc.icmp_type() == IcmpPacket_IcmpTypeEnum::TimeExceeded {
            let t = Self::read_into::<_, IcmpPacket_TimeExceededMsg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.time_exceeded.borrow_mut() = t;
        }
        if  ((*self_rc.icmp_type() == IcmpPacket_IcmpTypeEnum::Echo) || (*self_rc.icmp_type() == IcmpPacket_IcmpTypeEnum::EchoReply))  {
            let t = Self::read_into::<_, IcmpPacket_EchoMsg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.echo.borrow_mut() = t;
        }
        Ok(())
    }
}
impl IcmpPacket {
}
impl IcmpPacket {
    pub fn icmp_type(&self) -> Ref<'_, IcmpPacket_IcmpTypeEnum> {
        self.icmp_type.borrow()
    }
}
impl IcmpPacket {
    pub fn destination_unreachable(&self) -> Ref<'_, OptRc<IcmpPacket_DestinationUnreachableMsg>> {
        self.destination_unreachable.borrow()
    }
}
impl IcmpPacket {
    pub fn time_exceeded(&self) -> Ref<'_, OptRc<IcmpPacket_TimeExceededMsg>> {
        self.time_exceeded.borrow()
    }
}
impl IcmpPacket {
    pub fn echo(&self) -> Ref<'_, OptRc<IcmpPacket_EchoMsg>> {
        self.echo.borrow()
    }
}
impl IcmpPacket {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum IcmpPacket_IcmpTypeEnum {
    EchoReply,
    DestinationUnreachable,
    SourceQuench,
    Redirect,
    Echo,
    TimeExceeded,
    Unknown(i64),
}

impl TryFrom<i64> for IcmpPacket_IcmpTypeEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<IcmpPacket_IcmpTypeEnum> {
        match flag {
            0 => Ok(IcmpPacket_IcmpTypeEnum::EchoReply),
            3 => Ok(IcmpPacket_IcmpTypeEnum::DestinationUnreachable),
            4 => Ok(IcmpPacket_IcmpTypeEnum::SourceQuench),
            5 => Ok(IcmpPacket_IcmpTypeEnum::Redirect),
            8 => Ok(IcmpPacket_IcmpTypeEnum::Echo),
            11 => Ok(IcmpPacket_IcmpTypeEnum::TimeExceeded),
            _ => Ok(IcmpPacket_IcmpTypeEnum::Unknown(flag)),
        }
    }
}

impl From<&IcmpPacket_IcmpTypeEnum> for i64 {
    fn from(v: &IcmpPacket_IcmpTypeEnum) -> Self {
        match *v {
            IcmpPacket_IcmpTypeEnum::EchoReply => 0,
            IcmpPacket_IcmpTypeEnum::DestinationUnreachable => 3,
            IcmpPacket_IcmpTypeEnum::SourceQuench => 4,
            IcmpPacket_IcmpTypeEnum::Redirect => 5,
            IcmpPacket_IcmpTypeEnum::Echo => 8,
            IcmpPacket_IcmpTypeEnum::TimeExceeded => 11,
            IcmpPacket_IcmpTypeEnum::Unknown(v) => v
        }
    }
}

impl Default for IcmpPacket_IcmpTypeEnum {
    fn default() -> Self { IcmpPacket_IcmpTypeEnum::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct IcmpPacket_DestinationUnreachableMsg {
    pub _root: SharedType<IcmpPacket>,
    pub _parent: SharedType<IcmpPacket>,
    pub _self: SharedType<Self>,
    code: RefCell<IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode>,
    checksum: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for IcmpPacket_DestinationUnreachableMsg {
    type Root = IcmpPacket;
    type Parent = IcmpPacket;

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
        *self_rc.code.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.checksum.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl IcmpPacket_DestinationUnreachableMsg {
}
impl IcmpPacket_DestinationUnreachableMsg {
    pub fn code(&self) -> Ref<'_, IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode> {
        self.code.borrow()
    }
}
impl IcmpPacket_DestinationUnreachableMsg {
    pub fn checksum(&self) -> Ref<'_, u16> {
        self.checksum.borrow()
    }
}
impl IcmpPacket_DestinationUnreachableMsg {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode {
    NetUnreachable,
    HostUnreachable,
    ProtocolUnreachable,
    PortUnreachable,
    FragmentationNeededAndDfSet,
    SourceRouteFailed,
    DstNetUnkown,
    SdtHostUnkown,
    SrcIsolated,
    NetProhibitedByAdmin,
    HostProhibitedByAdmin,
    NetUnreachableForTos,
    HostUnreachableForTos,
    CommunicationProhibitedByAdmin,
    HostPrecedenceViolation,
    PrecedenceCuttoffInEffect,
    Unknown(i64),
}

impl TryFrom<i64> for IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode> {
        match flag {
            0 => Ok(IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::NetUnreachable),
            1 => Ok(IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::HostUnreachable),
            2 => Ok(IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::ProtocolUnreachable),
            3 => Ok(IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::PortUnreachable),
            4 => Ok(IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::FragmentationNeededAndDfSet),
            5 => Ok(IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::SourceRouteFailed),
            6 => Ok(IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::DstNetUnkown),
            7 => Ok(IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::SdtHostUnkown),
            8 => Ok(IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::SrcIsolated),
            9 => Ok(IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::NetProhibitedByAdmin),
            10 => Ok(IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::HostProhibitedByAdmin),
            11 => Ok(IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::NetUnreachableForTos),
            12 => Ok(IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::HostUnreachableForTos),
            13 => Ok(IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::CommunicationProhibitedByAdmin),
            14 => Ok(IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::HostPrecedenceViolation),
            15 => Ok(IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::PrecedenceCuttoffInEffect),
            _ => Ok(IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::Unknown(flag)),
        }
    }
}

impl From<&IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode> for i64 {
    fn from(v: &IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode) -> Self {
        match *v {
            IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::NetUnreachable => 0,
            IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::HostUnreachable => 1,
            IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::ProtocolUnreachable => 2,
            IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::PortUnreachable => 3,
            IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::FragmentationNeededAndDfSet => 4,
            IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::SourceRouteFailed => 5,
            IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::DstNetUnkown => 6,
            IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::SdtHostUnkown => 7,
            IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::SrcIsolated => 8,
            IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::NetProhibitedByAdmin => 9,
            IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::HostProhibitedByAdmin => 10,
            IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::NetUnreachableForTos => 11,
            IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::HostUnreachableForTos => 12,
            IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::CommunicationProhibitedByAdmin => 13,
            IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::HostPrecedenceViolation => 14,
            IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::PrecedenceCuttoffInEffect => 15,
            IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::Unknown(v) => v
        }
    }
}

impl Default for IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode {
    fn default() -> Self { IcmpPacket_DestinationUnreachableMsg_DestinationUnreachableCode::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct IcmpPacket_EchoMsg {
    pub _root: SharedType<IcmpPacket>,
    pub _parent: SharedType<IcmpPacket>,
    pub _self: SharedType<Self>,
    code: RefCell<Vec<u8>>,
    checksum: RefCell<u16>,
    identifier: RefCell<u16>,
    seq_num: RefCell<u16>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for IcmpPacket_EchoMsg {
    type Root = IcmpPacket;
    type Parent = IcmpPacket;

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
        *self_rc.code.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.code() == vec![0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/echo_msg/seq/0".to_string() }));
        }
        *self_rc.checksum.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.identifier.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.seq_num.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.data.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl IcmpPacket_EchoMsg {
}
impl IcmpPacket_EchoMsg {
    pub fn code(&self) -> Ref<'_, Vec<u8>> {
        self.code.borrow()
    }
}
impl IcmpPacket_EchoMsg {
    pub fn checksum(&self) -> Ref<'_, u16> {
        self.checksum.borrow()
    }
}
impl IcmpPacket_EchoMsg {
    pub fn identifier(&self) -> Ref<'_, u16> {
        self.identifier.borrow()
    }
}
impl IcmpPacket_EchoMsg {
    pub fn seq_num(&self) -> Ref<'_, u16> {
        self.seq_num.borrow()
    }
}
impl IcmpPacket_EchoMsg {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl IcmpPacket_EchoMsg {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct IcmpPacket_TimeExceededMsg {
    pub _root: SharedType<IcmpPacket>,
    pub _parent: SharedType<IcmpPacket>,
    pub _self: SharedType<Self>,
    code: RefCell<IcmpPacket_TimeExceededMsg_TimeExceededCode>,
    checksum: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for IcmpPacket_TimeExceededMsg {
    type Root = IcmpPacket;
    type Parent = IcmpPacket;

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
        *self_rc.code.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.checksum.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl IcmpPacket_TimeExceededMsg {
}
impl IcmpPacket_TimeExceededMsg {
    pub fn code(&self) -> Ref<'_, IcmpPacket_TimeExceededMsg_TimeExceededCode> {
        self.code.borrow()
    }
}
impl IcmpPacket_TimeExceededMsg {
    pub fn checksum(&self) -> Ref<'_, u16> {
        self.checksum.borrow()
    }
}
impl IcmpPacket_TimeExceededMsg {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum IcmpPacket_TimeExceededMsg_TimeExceededCode {
    TimeToLiveExceededInTransit,
    FragmentReassemblyTimeExceeded,
    Unknown(i64),
}

impl TryFrom<i64> for IcmpPacket_TimeExceededMsg_TimeExceededCode {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<IcmpPacket_TimeExceededMsg_TimeExceededCode> {
        match flag {
            0 => Ok(IcmpPacket_TimeExceededMsg_TimeExceededCode::TimeToLiveExceededInTransit),
            1 => Ok(IcmpPacket_TimeExceededMsg_TimeExceededCode::FragmentReassemblyTimeExceeded),
            _ => Ok(IcmpPacket_TimeExceededMsg_TimeExceededCode::Unknown(flag)),
        }
    }
}

impl From<&IcmpPacket_TimeExceededMsg_TimeExceededCode> for i64 {
    fn from(v: &IcmpPacket_TimeExceededMsg_TimeExceededCode) -> Self {
        match *v {
            IcmpPacket_TimeExceededMsg_TimeExceededCode::TimeToLiveExceededInTransit => 0,
            IcmpPacket_TimeExceededMsg_TimeExceededCode::FragmentReassemblyTimeExceeded => 1,
            IcmpPacket_TimeExceededMsg_TimeExceededCode::Unknown(v) => v
        }
    }
}

impl Default for IcmpPacket_TimeExceededMsg_TimeExceededCode {
    fn default() -> Self { IcmpPacket_TimeExceededMsg_TimeExceededCode::Unknown(0) }
}


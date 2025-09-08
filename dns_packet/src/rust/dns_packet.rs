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
 * (No support for Auth-Name + Add-Name for simplicity)
 */

#[derive(Default, Debug, Clone)]
pub struct DnsPacket {
    pub _root: SharedType<DnsPacket>,
    pub _parent: SharedType<DnsPacket>,
    pub _self: SharedType<Self>,
    transaction_id: RefCell<u16>,
    flags: RefCell<OptRc<DnsPacket_PacketFlags>>,
    qdcount: RefCell<u16>,
    ancount: RefCell<u16>,
    nscount: RefCell<u16>,
    arcount: RefCell<u16>,
    queries: RefCell<Vec<OptRc<DnsPacket_Query>>>,
    answers: RefCell<Vec<OptRc<DnsPacket_Answer>>>,
    authorities: RefCell<Vec<OptRc<DnsPacket_Answer>>>,
    additionals: RefCell<Vec<OptRc<DnsPacket_Answer>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for DnsPacket {
    type Root = DnsPacket;
    type Parent = DnsPacket;

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
        *self_rc.transaction_id.borrow_mut() = _io.read_u2be()?.into();
        let t = Self::read_into::<_, DnsPacket_PacketFlags>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.flags.borrow_mut() = t;
        if *self_rc.flags().is_opcode_valid()? {
            *self_rc.qdcount.borrow_mut() = _io.read_u2be()?.into();
        }
        if *self_rc.flags().is_opcode_valid()? {
            *self_rc.ancount.borrow_mut() = _io.read_u2be()?.into();
        }
        if *self_rc.flags().is_opcode_valid()? {
            *self_rc.nscount.borrow_mut() = _io.read_u2be()?.into();
        }
        if *self_rc.flags().is_opcode_valid()? {
            *self_rc.arcount.borrow_mut() = _io.read_u2be()?.into();
        }
        if *self_rc.flags().is_opcode_valid()? {
            *self_rc.queries.borrow_mut() = Vec::new();
            let l_queries = *self_rc.qdcount();
            for _i in 0..l_queries {
                let t = Self::read_into::<_, DnsPacket_Query>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.queries.borrow_mut().push(t);
            }
        }
        if *self_rc.flags().is_opcode_valid()? {
            *self_rc.answers.borrow_mut() = Vec::new();
            let l_answers = *self_rc.ancount();
            for _i in 0..l_answers {
                let t = Self::read_into::<_, DnsPacket_Answer>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.answers.borrow_mut().push(t);
            }
        }
        if *self_rc.flags().is_opcode_valid()? {
            *self_rc.authorities.borrow_mut() = Vec::new();
            let l_authorities = *self_rc.nscount();
            for _i in 0..l_authorities {
                let t = Self::read_into::<_, DnsPacket_Answer>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.authorities.borrow_mut().push(t);
            }
        }
        if *self_rc.flags().is_opcode_valid()? {
            *self_rc.additionals.borrow_mut() = Vec::new();
            let l_additionals = *self_rc.arcount();
            for _i in 0..l_additionals {
                let t = Self::read_into::<_, DnsPacket_Answer>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.additionals.borrow_mut().push(t);
            }
        }
        Ok(())
    }
}
impl DnsPacket {
}

/**
 * ID to keep track of request/responces
 */
impl DnsPacket {
    pub fn transaction_id(&self) -> Ref<'_, u16> {
        self.transaction_id.borrow()
    }
}
impl DnsPacket {
    pub fn flags(&self) -> Ref<'_, OptRc<DnsPacket_PacketFlags>> {
        self.flags.borrow()
    }
}

/**
 * How many questions are there
 */
impl DnsPacket {
    pub fn qdcount(&self) -> Ref<'_, u16> {
        self.qdcount.borrow()
    }
}

/**
 * Number of resource records answering the question
 */
impl DnsPacket {
    pub fn ancount(&self) -> Ref<'_, u16> {
        self.ancount.borrow()
    }
}

/**
 * Number of resource records pointing toward an authority
 */
impl DnsPacket {
    pub fn nscount(&self) -> Ref<'_, u16> {
        self.nscount.borrow()
    }
}

/**
 * Number of resource records holding additional information
 */
impl DnsPacket {
    pub fn arcount(&self) -> Ref<'_, u16> {
        self.arcount.borrow()
    }
}
impl DnsPacket {
    pub fn queries(&self) -> Ref<'_, Vec<OptRc<DnsPacket_Query>>> {
        self.queries.borrow()
    }
}
impl DnsPacket {
    pub fn answers(&self) -> Ref<'_, Vec<OptRc<DnsPacket_Answer>>> {
        self.answers.borrow()
    }
}
impl DnsPacket {
    pub fn authorities(&self) -> Ref<'_, Vec<OptRc<DnsPacket_Answer>>> {
        self.authorities.borrow()
    }
}
impl DnsPacket {
    pub fn additionals(&self) -> Ref<'_, Vec<OptRc<DnsPacket_Answer>>> {
        self.additionals.borrow()
    }
}
impl DnsPacket {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum DnsPacket_ClassType {
    InClass,
    Cs,
    Ch,
    Hs,
    Unknown(i64),
}

impl TryFrom<i64> for DnsPacket_ClassType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<DnsPacket_ClassType> {
        match flag {
            1 => Ok(DnsPacket_ClassType::InClass),
            2 => Ok(DnsPacket_ClassType::Cs),
            3 => Ok(DnsPacket_ClassType::Ch),
            4 => Ok(DnsPacket_ClassType::Hs),
            _ => Ok(DnsPacket_ClassType::Unknown(flag)),
        }
    }
}

impl From<&DnsPacket_ClassType> for i64 {
    fn from(v: &DnsPacket_ClassType) -> Self {
        match *v {
            DnsPacket_ClassType::InClass => 1,
            DnsPacket_ClassType::Cs => 2,
            DnsPacket_ClassType::Ch => 3,
            DnsPacket_ClassType::Hs => 4,
            DnsPacket_ClassType::Unknown(v) => v
        }
    }
}

impl Default for DnsPacket_ClassType {
    fn default() -> Self { DnsPacket_ClassType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum DnsPacket_TypeType {
    A,
    Ns,
    Md,
    Mf,
    Cname,
    Soa,
    Mb,
    Mg,
    Mr,
    Null,
    Wks,
    Ptr,
    Hinfo,
    Minfo,
    Mx,
    Txt,
    Aaaa,
    Srv,
    Unknown(i64),
}

impl TryFrom<i64> for DnsPacket_TypeType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<DnsPacket_TypeType> {
        match flag {
            1 => Ok(DnsPacket_TypeType::A),
            2 => Ok(DnsPacket_TypeType::Ns),
            3 => Ok(DnsPacket_TypeType::Md),
            4 => Ok(DnsPacket_TypeType::Mf),
            5 => Ok(DnsPacket_TypeType::Cname),
            6 => Ok(DnsPacket_TypeType::Soa),
            7 => Ok(DnsPacket_TypeType::Mb),
            8 => Ok(DnsPacket_TypeType::Mg),
            9 => Ok(DnsPacket_TypeType::Mr),
            10 => Ok(DnsPacket_TypeType::Null),
            11 => Ok(DnsPacket_TypeType::Wks),
            12 => Ok(DnsPacket_TypeType::Ptr),
            13 => Ok(DnsPacket_TypeType::Hinfo),
            14 => Ok(DnsPacket_TypeType::Minfo),
            15 => Ok(DnsPacket_TypeType::Mx),
            16 => Ok(DnsPacket_TypeType::Txt),
            28 => Ok(DnsPacket_TypeType::Aaaa),
            33 => Ok(DnsPacket_TypeType::Srv),
            _ => Ok(DnsPacket_TypeType::Unknown(flag)),
        }
    }
}

impl From<&DnsPacket_TypeType> for i64 {
    fn from(v: &DnsPacket_TypeType) -> Self {
        match *v {
            DnsPacket_TypeType::A => 1,
            DnsPacket_TypeType::Ns => 2,
            DnsPacket_TypeType::Md => 3,
            DnsPacket_TypeType::Mf => 4,
            DnsPacket_TypeType::Cname => 5,
            DnsPacket_TypeType::Soa => 6,
            DnsPacket_TypeType::Mb => 7,
            DnsPacket_TypeType::Mg => 8,
            DnsPacket_TypeType::Mr => 9,
            DnsPacket_TypeType::Null => 10,
            DnsPacket_TypeType::Wks => 11,
            DnsPacket_TypeType::Ptr => 12,
            DnsPacket_TypeType::Hinfo => 13,
            DnsPacket_TypeType::Minfo => 14,
            DnsPacket_TypeType::Mx => 15,
            DnsPacket_TypeType::Txt => 16,
            DnsPacket_TypeType::Aaaa => 28,
            DnsPacket_TypeType::Srv => 33,
            DnsPacket_TypeType::Unknown(v) => v
        }
    }
}

impl Default for DnsPacket_TypeType {
    fn default() -> Self { DnsPacket_TypeType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct DnsPacket_Address {
    pub _root: SharedType<DnsPacket>,
    pub _parent: SharedType<DnsPacket_Answer>,
    pub _self: SharedType<Self>,
    ip: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for DnsPacket_Address {
    type Root = DnsPacket;
    type Parent = DnsPacket_Answer;

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
        *self_rc.ip.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        Ok(())
    }
}
impl DnsPacket_Address {
}
impl DnsPacket_Address {
    pub fn ip(&self) -> Ref<'_, Vec<u8>> {
        self.ip.borrow()
    }
}
impl DnsPacket_Address {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DnsPacket_AddressV6 {
    pub _root: SharedType<DnsPacket>,
    pub _parent: SharedType<DnsPacket_Answer>,
    pub _self: SharedType<Self>,
    ip_v6: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for DnsPacket_AddressV6 {
    type Root = DnsPacket;
    type Parent = DnsPacket_Answer;

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
        *self_rc.ip_v6.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        Ok(())
    }
}
impl DnsPacket_AddressV6 {
}
impl DnsPacket_AddressV6 {
    pub fn ip_v6(&self) -> Ref<'_, Vec<u8>> {
        self.ip_v6.borrow()
    }
}
impl DnsPacket_AddressV6 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DnsPacket_Answer {
    pub _root: SharedType<DnsPacket>,
    pub _parent: SharedType<DnsPacket>,
    pub _self: SharedType<Self>,
    name: RefCell<OptRc<DnsPacket_DomainName>>,
    type: RefCell<DnsPacket_TypeType>,
    answer_class: RefCell<DnsPacket_ClassType>,
    ttl: RefCell<i32>,
    rdlength: RefCell<u16>,
    payload: RefCell<Option<DnsPacket_Answer_Payload>>,
    _io: RefCell<BytesReader>,
    payload_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum DnsPacket_Answer_Payload {
    DnsPacket_TxtBody(OptRc<DnsPacket_TxtBody>),
    Bytes(Vec<u8>),
    DnsPacket_Service(OptRc<DnsPacket_Service>),
    DnsPacket_Address(OptRc<DnsPacket_Address>),
    DnsPacket_DomainName(OptRc<DnsPacket_DomainName>),
    DnsPacket_AuthorityInfo(OptRc<DnsPacket_AuthorityInfo>),
    DnsPacket_AddressV6(OptRc<DnsPacket_AddressV6>),
    DnsPacket_MxInfo(OptRc<DnsPacket_MxInfo>),
}
impl From<&DnsPacket_Answer_Payload> for OptRc<DnsPacket_TxtBody> {
    fn from(v: &DnsPacket_Answer_Payload) -> Self {
        if let DnsPacket_Answer_Payload::DnsPacket_TxtBody(x) = v {
            return x.clone();
        }
        panic!("expected DnsPacket_Answer_Payload::DnsPacket_TxtBody, got {:?}", v)
    }
}
impl From<OptRc<DnsPacket_TxtBody>> for DnsPacket_Answer_Payload {
    fn from(v: OptRc<DnsPacket_TxtBody>) -> Self {
        Self::DnsPacket_TxtBody(v)
    }
}
impl From<&DnsPacket_Answer_Payload> for Vec<u8> {
    fn from(v: &DnsPacket_Answer_Payload) -> Self {
        if let DnsPacket_Answer_Payload::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected DnsPacket_Answer_Payload::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for DnsPacket_Answer_Payload {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&DnsPacket_Answer_Payload> for OptRc<DnsPacket_Service> {
    fn from(v: &DnsPacket_Answer_Payload) -> Self {
        if let DnsPacket_Answer_Payload::DnsPacket_Service(x) = v {
            return x.clone();
        }
        panic!("expected DnsPacket_Answer_Payload::DnsPacket_Service, got {:?}", v)
    }
}
impl From<OptRc<DnsPacket_Service>> for DnsPacket_Answer_Payload {
    fn from(v: OptRc<DnsPacket_Service>) -> Self {
        Self::DnsPacket_Service(v)
    }
}
impl From<&DnsPacket_Answer_Payload> for OptRc<DnsPacket_Address> {
    fn from(v: &DnsPacket_Answer_Payload) -> Self {
        if let DnsPacket_Answer_Payload::DnsPacket_Address(x) = v {
            return x.clone();
        }
        panic!("expected DnsPacket_Answer_Payload::DnsPacket_Address, got {:?}", v)
    }
}
impl From<OptRc<DnsPacket_Address>> for DnsPacket_Answer_Payload {
    fn from(v: OptRc<DnsPacket_Address>) -> Self {
        Self::DnsPacket_Address(v)
    }
}
impl From<&DnsPacket_Answer_Payload> for OptRc<DnsPacket_DomainName> {
    fn from(v: &DnsPacket_Answer_Payload) -> Self {
        if let DnsPacket_Answer_Payload::DnsPacket_DomainName(x) = v {
            return x.clone();
        }
        panic!("expected DnsPacket_Answer_Payload::DnsPacket_DomainName, got {:?}", v)
    }
}
impl From<OptRc<DnsPacket_DomainName>> for DnsPacket_Answer_Payload {
    fn from(v: OptRc<DnsPacket_DomainName>) -> Self {
        Self::DnsPacket_DomainName(v)
    }
}
impl From<&DnsPacket_Answer_Payload> for OptRc<DnsPacket_AuthorityInfo> {
    fn from(v: &DnsPacket_Answer_Payload) -> Self {
        if let DnsPacket_Answer_Payload::DnsPacket_AuthorityInfo(x) = v {
            return x.clone();
        }
        panic!("expected DnsPacket_Answer_Payload::DnsPacket_AuthorityInfo, got {:?}", v)
    }
}
impl From<OptRc<DnsPacket_AuthorityInfo>> for DnsPacket_Answer_Payload {
    fn from(v: OptRc<DnsPacket_AuthorityInfo>) -> Self {
        Self::DnsPacket_AuthorityInfo(v)
    }
}
impl From<&DnsPacket_Answer_Payload> for OptRc<DnsPacket_AddressV6> {
    fn from(v: &DnsPacket_Answer_Payload) -> Self {
        if let DnsPacket_Answer_Payload::DnsPacket_AddressV6(x) = v {
            return x.clone();
        }
        panic!("expected DnsPacket_Answer_Payload::DnsPacket_AddressV6, got {:?}", v)
    }
}
impl From<OptRc<DnsPacket_AddressV6>> for DnsPacket_Answer_Payload {
    fn from(v: OptRc<DnsPacket_AddressV6>) -> Self {
        Self::DnsPacket_AddressV6(v)
    }
}
impl From<&DnsPacket_Answer_Payload> for OptRc<DnsPacket_MxInfo> {
    fn from(v: &DnsPacket_Answer_Payload) -> Self {
        if let DnsPacket_Answer_Payload::DnsPacket_MxInfo(x) = v {
            return x.clone();
        }
        panic!("expected DnsPacket_Answer_Payload::DnsPacket_MxInfo, got {:?}", v)
    }
}
impl From<OptRc<DnsPacket_MxInfo>> for DnsPacket_Answer_Payload {
    fn from(v: OptRc<DnsPacket_MxInfo>) -> Self {
        Self::DnsPacket_MxInfo(v)
    }
}
impl KStruct for DnsPacket_Answer {
    type Root = DnsPacket;
    type Parent = DnsPacket;

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
        let t = Self::read_into::<_, DnsPacket_DomainName>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.name.borrow_mut() = t;
        *self_rc.type.borrow_mut() = (_io.read_u2be()? as i64).try_into()?;
        *self_rc.answer_class.borrow_mut() = (_io.read_u2be()? as i64).try_into()?;
        *self_rc.ttl.borrow_mut() = _io.read_s4be()?.into();
        *self_rc.rdlength.borrow_mut() = _io.read_u2be()?.into();
        match *self_rc.type() {
            DnsPacket_TypeType::A => {
                *self_rc.payload_raw.borrow_mut() = _io.read_bytes(*self_rc.rdlength() as usize)?.into();
                let payload_raw = self_rc.payload_raw.borrow();
                let _t_payload_raw_io = BytesReader::from(payload_raw.clone());
                let t = Self::read_into::<BytesReader, DnsPacket_Address>(&_t_payload_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.payload.borrow_mut() = Some(t);
            }
            DnsPacket_TypeType::Aaaa => {
                *self_rc.payload_raw.borrow_mut() = _io.read_bytes(*self_rc.rdlength() as usize)?.into();
                let payload_raw = self_rc.payload_raw.borrow();
                let _t_payload_raw_io = BytesReader::from(payload_raw.clone());
                let t = Self::read_into::<BytesReader, DnsPacket_AddressV6>(&_t_payload_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.payload.borrow_mut() = Some(t);
            }
            DnsPacket_TypeType::Cname => {
                *self_rc.payload_raw.borrow_mut() = _io.read_bytes(*self_rc.rdlength() as usize)?.into();
                let payload_raw = self_rc.payload_raw.borrow();
                let _t_payload_raw_io = BytesReader::from(payload_raw.clone());
                let t = Self::read_into::<BytesReader, DnsPacket_DomainName>(&_t_payload_raw_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.payload.borrow_mut() = Some(t);
            }
            DnsPacket_TypeType::Mx => {
                *self_rc.payload_raw.borrow_mut() = _io.read_bytes(*self_rc.rdlength() as usize)?.into();
                let payload_raw = self_rc.payload_raw.borrow();
                let _t_payload_raw_io = BytesReader::from(payload_raw.clone());
                let t = Self::read_into::<BytesReader, DnsPacket_MxInfo>(&_t_payload_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.payload.borrow_mut() = Some(t);
            }
            DnsPacket_TypeType::Ns => {
                *self_rc.payload_raw.borrow_mut() = _io.read_bytes(*self_rc.rdlength() as usize)?.into();
                let payload_raw = self_rc.payload_raw.borrow();
                let _t_payload_raw_io = BytesReader::from(payload_raw.clone());
                let t = Self::read_into::<BytesReader, DnsPacket_DomainName>(&_t_payload_raw_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.payload.borrow_mut() = Some(t);
            }
            DnsPacket_TypeType::Ptr => {
                *self_rc.payload_raw.borrow_mut() = _io.read_bytes(*self_rc.rdlength() as usize)?.into();
                let payload_raw = self_rc.payload_raw.borrow();
                let _t_payload_raw_io = BytesReader::from(payload_raw.clone());
                let t = Self::read_into::<BytesReader, DnsPacket_DomainName>(&_t_payload_raw_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.payload.borrow_mut() = Some(t);
            }
            DnsPacket_TypeType::Soa => {
                *self_rc.payload_raw.borrow_mut() = _io.read_bytes(*self_rc.rdlength() as usize)?.into();
                let payload_raw = self_rc.payload_raw.borrow();
                let _t_payload_raw_io = BytesReader::from(payload_raw.clone());
                let t = Self::read_into::<BytesReader, DnsPacket_AuthorityInfo>(&_t_payload_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.payload.borrow_mut() = Some(t);
            }
            DnsPacket_TypeType::Srv => {
                *self_rc.payload_raw.borrow_mut() = _io.read_bytes(*self_rc.rdlength() as usize)?.into();
                let payload_raw = self_rc.payload_raw.borrow();
                let _t_payload_raw_io = BytesReader::from(payload_raw.clone());
                let t = Self::read_into::<BytesReader, DnsPacket_Service>(&_t_payload_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.payload.borrow_mut() = Some(t);
            }
            DnsPacket_TypeType::Txt => {
                *self_rc.payload_raw.borrow_mut() = _io.read_bytes(*self_rc.rdlength() as usize)?.into();
                let payload_raw = self_rc.payload_raw.borrow();
                let _t_payload_raw_io = BytesReader::from(payload_raw.clone());
                let t = Self::read_into::<BytesReader, DnsPacket_TxtBody>(&_t_payload_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.payload.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.payload.borrow_mut() = Some(_io.read_bytes(*self_rc.rdlength() as usize)?.into());
            }
        }
        Ok(())
    }
}
impl DnsPacket_Answer {
}
impl DnsPacket_Answer {
    pub fn name(&self) -> Ref<'_, OptRc<DnsPacket_DomainName>> {
        self.name.borrow()
    }
}
impl DnsPacket_Answer {
    pub fn type(&self) -> Ref<'_, DnsPacket_TypeType> {
        self.type.borrow()
    }
}
impl DnsPacket_Answer {
    pub fn answer_class(&self) -> Ref<'_, DnsPacket_ClassType> {
        self.answer_class.borrow()
    }
}

/**
 * Time to live (in seconds)
 */
impl DnsPacket_Answer {
    pub fn ttl(&self) -> Ref<'_, i32> {
        self.ttl.borrow()
    }
}

/**
 * Length in octets of the following payload
 */
impl DnsPacket_Answer {
    pub fn rdlength(&self) -> Ref<'_, u16> {
        self.rdlength.borrow()
    }
}
impl DnsPacket_Answer {
    pub fn payload(&self) -> Ref<'_, Option<DnsPacket_Answer_Payload>> {
        self.payload.borrow()
    }
}
impl DnsPacket_Answer {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl DnsPacket_Answer {
    pub fn payload_raw(&self) -> Ref<'_, Vec<u8>> {
        self.payload_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DnsPacket_AuthorityInfo {
    pub _root: SharedType<DnsPacket>,
    pub _parent: SharedType<DnsPacket_Answer>,
    pub _self: SharedType<Self>,
    primary_ns: RefCell<OptRc<DnsPacket_DomainName>>,
    resoponsible_mailbox: RefCell<OptRc<DnsPacket_DomainName>>,
    serial: RefCell<u32>,
    refresh_interval: RefCell<u32>,
    retry_interval: RefCell<u32>,
    expire_limit: RefCell<u32>,
    min_ttl: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for DnsPacket_AuthorityInfo {
    type Root = DnsPacket;
    type Parent = DnsPacket_Answer;

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
        let t = Self::read_into::<_, DnsPacket_DomainName>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.primary_ns.borrow_mut() = t;
        let t = Self::read_into::<_, DnsPacket_DomainName>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.resoponsible_mailbox.borrow_mut() = t;
        *self_rc.serial.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.refresh_interval.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.retry_interval.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.expire_limit.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.min_ttl.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl DnsPacket_AuthorityInfo {
}
impl DnsPacket_AuthorityInfo {
    pub fn primary_ns(&self) -> Ref<'_, OptRc<DnsPacket_DomainName>> {
        self.primary_ns.borrow()
    }
}
impl DnsPacket_AuthorityInfo {
    pub fn resoponsible_mailbox(&self) -> Ref<'_, OptRc<DnsPacket_DomainName>> {
        self.resoponsible_mailbox.borrow()
    }
}
impl DnsPacket_AuthorityInfo {
    pub fn serial(&self) -> Ref<'_, u32> {
        self.serial.borrow()
    }
}
impl DnsPacket_AuthorityInfo {
    pub fn refresh_interval(&self) -> Ref<'_, u32> {
        self.refresh_interval.borrow()
    }
}
impl DnsPacket_AuthorityInfo {
    pub fn retry_interval(&self) -> Ref<'_, u32> {
        self.retry_interval.borrow()
    }
}
impl DnsPacket_AuthorityInfo {
    pub fn expire_limit(&self) -> Ref<'_, u32> {
        self.expire_limit.borrow()
    }
}
impl DnsPacket_AuthorityInfo {
    pub fn min_ttl(&self) -> Ref<'_, u32> {
        self.min_ttl.borrow()
    }
}
impl DnsPacket_AuthorityInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DnsPacket_DomainName {
    pub _root: SharedType<DnsPacket>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    name: RefCell<Vec<OptRc<DnsPacket_Label>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for DnsPacket_DomainName {
    type Root = DnsPacket;
    type Parent = KStructUnit;

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
        *self_rc.name.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let t = Self::read_into::<_, DnsPacket_Label>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.name.borrow_mut().push(t);
                let _t_name = self_rc.name.borrow();
                let _tmpa = _t_name.last().unwrap();
                _i += 1;
                let x = !( ((((*_tmpa.length() as u8) == (0 as u8))) || (*_tmpa.length() >= 192)) );
                x
            } {}
        }
        Ok(())
    }
}
impl DnsPacket_DomainName {
}

/**
 * Repeat until the length is 0 or it is a pointer (bit-hack to get around lack of OR operator)
 */
impl DnsPacket_DomainName {
    pub fn name(&self) -> Ref<'_, Vec<OptRc<DnsPacket_Label>>> {
        self.name.borrow()
    }
}
impl DnsPacket_DomainName {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DnsPacket_Label {
    pub _root: SharedType<DnsPacket>,
    pub _parent: SharedType<DnsPacket_DomainName>,
    pub _self: SharedType<Self>,
    length: RefCell<u8>,
    pointer: RefCell<OptRc<DnsPacket_PointerStruct>>,
    name: RefCell<String>,
    _io: RefCell<BytesReader>,
    f_is_pointer: Cell<bool>,
    is_pointer: RefCell<bool>,
}
impl KStruct for DnsPacket_Label {
    type Root = DnsPacket;
    type Parent = DnsPacket_DomainName;

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
        *self_rc.length.borrow_mut() = _io.read_u1()?.into();
        if *self_rc.is_pointer()? {
            let t = Self::read_into::<_, DnsPacket_PointerStruct>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.pointer.borrow_mut() = t;
        }
        if !(*self_rc.is_pointer()?) {
            *self_rc.name.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.length() as usize)?.into(), "UTF-8")?;
        }
        Ok(())
    }
}
impl DnsPacket_Label {
    pub fn is_pointer(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_pointer.get() {
            return Ok(self.is_pointer.borrow());
        }
        self.f_is_pointer.set(true);
        *self.is_pointer.borrow_mut() = (*self.length() >= 192) as bool;
        Ok(self.is_pointer.borrow())
    }
}

/**
 * RFC1035 4.1.4: If the first two bits are raised it's a pointer-offset to a previously defined name
 */
impl DnsPacket_Label {
    pub fn length(&self) -> Ref<'_, u8> {
        self.length.borrow()
    }
}
impl DnsPacket_Label {
    pub fn pointer(&self) -> Ref<'_, OptRc<DnsPacket_PointerStruct>> {
        self.pointer.borrow()
    }
}

/**
 * Otherwise its a string the length of the length value
 */
impl DnsPacket_Label {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl DnsPacket_Label {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DnsPacket_MxInfo {
    pub _root: SharedType<DnsPacket>,
    pub _parent: SharedType<DnsPacket_Answer>,
    pub _self: SharedType<Self>,
    preference: RefCell<u16>,
    mx: RefCell<OptRc<DnsPacket_DomainName>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for DnsPacket_MxInfo {
    type Root = DnsPacket;
    type Parent = DnsPacket_Answer;

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
        *self_rc.preference.borrow_mut() = _io.read_u2be()?.into();
        let t = Self::read_into::<_, DnsPacket_DomainName>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.mx.borrow_mut() = t;
        Ok(())
    }
}
impl DnsPacket_MxInfo {
}
impl DnsPacket_MxInfo {
    pub fn preference(&self) -> Ref<'_, u16> {
        self.preference.borrow()
    }
}
impl DnsPacket_MxInfo {
    pub fn mx(&self) -> Ref<'_, OptRc<DnsPacket_DomainName>> {
        self.mx.borrow()
    }
}
impl DnsPacket_MxInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DnsPacket_PacketFlags {
    pub _root: SharedType<DnsPacket>,
    pub _parent: SharedType<DnsPacket>,
    pub _self: SharedType<Self>,
    flag: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_aa: Cell<bool>,
    aa: RefCell<i32>,
    f_ad: Cell<bool>,
    ad: RefCell<i32>,
    f_cd: Cell<bool>,
    cd: RefCell<i32>,
    f_is_opcode_valid: Cell<bool>,
    is_opcode_valid: RefCell<bool>,
    f_opcode: Cell<bool>,
    opcode: RefCell<i32>,
    f_qr: Cell<bool>,
    qr: RefCell<i32>,
    f_ra: Cell<bool>,
    ra: RefCell<i32>,
    f_rcode: Cell<bool>,
    rcode: RefCell<i32>,
    f_rd: Cell<bool>,
    rd: RefCell<i32>,
    f_tc: Cell<bool>,
    tc: RefCell<i32>,
    f_z: Cell<bool>,
    z: RefCell<i32>,
}
impl KStruct for DnsPacket_PacketFlags {
    type Root = DnsPacket;
    type Parent = DnsPacket;

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
        *self_rc.flag.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl DnsPacket_PacketFlags {
    pub fn aa(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_aa.get() {
            return Ok(self.aa.borrow());
        }
        self.f_aa.set(true);
        *self.aa.borrow_mut() = ((((((*self.flag() as i32) & (1024 as i32)) as u64) >> 10) as i32)) as i32;
        Ok(self.aa.borrow())
    }
    pub fn ad(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ad.get() {
            return Ok(self.ad.borrow());
        }
        self.f_ad.set(true);
        *self.ad.borrow_mut() = ((((((*self.flag() as u16) & (32 as u16)) as u64) >> 5) as i32)) as i32;
        Ok(self.ad.borrow())
    }
    pub fn cd(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_cd.get() {
            return Ok(self.cd.borrow());
        }
        self.f_cd.set(true);
        *self.cd.borrow_mut() = ((((((*self.flag() as u16) & (16 as u16)) as u64) >> 4) as i32)) as i32;
        Ok(self.cd.borrow())
    }
    pub fn is_opcode_valid(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_opcode_valid.get() {
            return Ok(self.is_opcode_valid.borrow());
        }
        self.f_is_opcode_valid.set(true);
        *self.is_opcode_valid.borrow_mut() = ( ((((*self.opcode()? as i32) == (0 as i32))) || (((*self.opcode()? as i32) == (1 as i32))) || (((*self.opcode()? as i32) == (2 as i32)))) ) as bool;
        Ok(self.is_opcode_valid.borrow())
    }
    pub fn opcode(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_opcode.get() {
            return Ok(self.opcode.borrow());
        }
        self.f_opcode.set(true);
        *self.opcode.borrow_mut() = ((((((*self.flag() as i32) & (30720 as i32)) as u64) >> 11) as i32)) as i32;
        Ok(self.opcode.borrow())
    }
    pub fn qr(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_qr.get() {
            return Ok(self.qr.borrow());
        }
        self.f_qr.set(true);
        *self.qr.borrow_mut() = ((((((*self.flag() as i32) & (32768 as i32)) as u64) >> 15) as i32)) as i32;
        Ok(self.qr.borrow())
    }
    pub fn ra(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ra.get() {
            return Ok(self.ra.borrow());
        }
        self.f_ra.set(true);
        *self.ra.borrow_mut() = ((((((*self.flag() as u16) & (128 as u16)) as u64) >> 7) as i32)) as i32;
        Ok(self.ra.borrow())
    }
    pub fn rcode(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_rcode.get() {
            return Ok(self.rcode.borrow());
        }
        self.f_rcode.set(true);
        *self.rcode.borrow_mut() = ((((((*self.flag() as u16) & (15 as u16)) as u64) >> 0) as i32)) as i32;
        Ok(self.rcode.borrow())
    }
    pub fn rd(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_rd.get() {
            return Ok(self.rd.borrow());
        }
        self.f_rd.set(true);
        *self.rd.borrow_mut() = ((((((*self.flag() as i32) & (256 as i32)) as u64) >> 8) as i32)) as i32;
        Ok(self.rd.borrow())
    }
    pub fn tc(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_tc.get() {
            return Ok(self.tc.borrow());
        }
        self.f_tc.set(true);
        *self.tc.borrow_mut() = ((((((*self.flag() as i32) & (512 as i32)) as u64) >> 9) as i32)) as i32;
        Ok(self.tc.borrow())
    }
    pub fn z(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_z.get() {
            return Ok(self.z.borrow());
        }
        self.f_z.set(true);
        *self.z.borrow_mut() = ((((((*self.flag() as u16) & (64 as u16)) as u64) >> 6) as i32)) as i32;
        Ok(self.z.borrow())
    }
}
impl DnsPacket_PacketFlags {
    pub fn flag(&self) -> Ref<'_, u16> {
        self.flag.borrow()
    }
}
impl DnsPacket_PacketFlags {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DnsPacket_PointerStruct {
    pub _root: SharedType<DnsPacket>,
    pub _parent: SharedType<DnsPacket_Label>,
    pub _self: SharedType<Self>,
    value: RefCell<u8>,
    _io: RefCell<BytesReader>,
    f_contents: Cell<bool>,
    contents: RefCell<OptRc<DnsPacket_DomainName>>,
}
impl KStruct for DnsPacket_PointerStruct {
    type Root = DnsPacket;
    type Parent = DnsPacket_Label;

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
        *self_rc.value.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl DnsPacket_PointerStruct {
    pub fn contents(
        &self
    ) -> KResult<Ref<'_, OptRc<DnsPacket_DomainName>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_contents.get() {
            return Ok(self.contents.borrow());
        }
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(((*self.value() as i32) + (((((*_prc.as_ref().unwrap().length() as u8) - (192 as u8)) as i32) << (8 as i32)) as i32)) as usize)?;
        let t = Self::read_into::<BytesReader, DnsPacket_DomainName>(&io, Some(self._root.clone()), None)?.into();
        *self.contents.borrow_mut() = t;
        io.seek(_pos)?;
        Ok(self.contents.borrow())
    }
}

/**
 * Read one byte, then offset to that position, read one domain-name and return
 */
impl DnsPacket_PointerStruct {
    pub fn value(&self) -> Ref<'_, u8> {
        self.value.borrow()
    }
}
impl DnsPacket_PointerStruct {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DnsPacket_Query {
    pub _root: SharedType<DnsPacket>,
    pub _parent: SharedType<DnsPacket>,
    pub _self: SharedType<Self>,
    name: RefCell<OptRc<DnsPacket_DomainName>>,
    type: RefCell<DnsPacket_TypeType>,
    query_class: RefCell<DnsPacket_ClassType>,
    _io: RefCell<BytesReader>,
}
impl KStruct for DnsPacket_Query {
    type Root = DnsPacket;
    type Parent = DnsPacket;

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
        let t = Self::read_into::<_, DnsPacket_DomainName>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.name.borrow_mut() = t;
        *self_rc.type.borrow_mut() = (_io.read_u2be()? as i64).try_into()?;
        *self_rc.query_class.borrow_mut() = (_io.read_u2be()? as i64).try_into()?;
        Ok(())
    }
}
impl DnsPacket_Query {
}
impl DnsPacket_Query {
    pub fn name(&self) -> Ref<'_, OptRc<DnsPacket_DomainName>> {
        self.name.borrow()
    }
}
impl DnsPacket_Query {
    pub fn type(&self) -> Ref<'_, DnsPacket_TypeType> {
        self.type.borrow()
    }
}
impl DnsPacket_Query {
    pub fn query_class(&self) -> Ref<'_, DnsPacket_ClassType> {
        self.query_class.borrow()
    }
}
impl DnsPacket_Query {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DnsPacket_Service {
    pub _root: SharedType<DnsPacket>,
    pub _parent: SharedType<DnsPacket_Answer>,
    pub _self: SharedType<Self>,
    priority: RefCell<u16>,
    weight: RefCell<u16>,
    port: RefCell<u16>,
    target: RefCell<OptRc<DnsPacket_DomainName>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for DnsPacket_Service {
    type Root = DnsPacket;
    type Parent = DnsPacket_Answer;

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
        *self_rc.priority.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.weight.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.port.borrow_mut() = _io.read_u2be()?.into();
        let t = Self::read_into::<_, DnsPacket_DomainName>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.target.borrow_mut() = t;
        Ok(())
    }
}
impl DnsPacket_Service {
}
impl DnsPacket_Service {
    pub fn priority(&self) -> Ref<'_, u16> {
        self.priority.borrow()
    }
}
impl DnsPacket_Service {
    pub fn weight(&self) -> Ref<'_, u16> {
        self.weight.borrow()
    }
}
impl DnsPacket_Service {
    pub fn port(&self) -> Ref<'_, u16> {
        self.port.borrow()
    }
}
impl DnsPacket_Service {
    pub fn target(&self) -> Ref<'_, OptRc<DnsPacket_DomainName>> {
        self.target.borrow()
    }
}
impl DnsPacket_Service {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DnsPacket_Txt {
    pub _root: SharedType<DnsPacket>,
    pub _parent: SharedType<DnsPacket_TxtBody>,
    pub _self: SharedType<Self>,
    length: RefCell<u8>,
    text: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for DnsPacket_Txt {
    type Root = DnsPacket;
    type Parent = DnsPacket_TxtBody;

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
        *self_rc.length.borrow_mut() = _io.read_u1()?.into();
        *self_rc.text.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.length() as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl DnsPacket_Txt {
}
impl DnsPacket_Txt {
    pub fn length(&self) -> Ref<'_, u8> {
        self.length.borrow()
    }
}
impl DnsPacket_Txt {
    pub fn text(&self) -> Ref<'_, String> {
        self.text.borrow()
    }
}
impl DnsPacket_Txt {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DnsPacket_TxtBody {
    pub _root: SharedType<DnsPacket>,
    pub _parent: SharedType<DnsPacket_Answer>,
    pub _self: SharedType<Self>,
    data: RefCell<Vec<OptRc<DnsPacket_Txt>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for DnsPacket_TxtBody {
    type Root = DnsPacket;
    type Parent = DnsPacket_Answer;

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
        *self_rc.data.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, DnsPacket_Txt>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.data.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl DnsPacket_TxtBody {
}
impl DnsPacket_TxtBody {
    pub fn data(&self) -> Ref<'_, Vec<OptRc<DnsPacket_Txt>>> {
        self.data.borrow()
    }
}
impl DnsPacket_TxtBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

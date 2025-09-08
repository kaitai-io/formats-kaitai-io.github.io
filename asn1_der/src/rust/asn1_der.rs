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
 * ASN.1 (Abstract Syntax Notation One) DER (Distinguished Encoding
 * Rules) is a standard-backed serialization scheme used in many
 * different use-cases. Particularly popular usage scenarios are X.509
 * certificates and some telecommunication / networking protocols.
 * 
 * DER is self-describing encoding scheme which allows representation
 * of simple, atomic data elements, such as strings and numbers, and
 * complex objects, such as sequences of other elements.
 * 
 * DER is a subset of BER (Basic Encoding Rules), with an emphasis on
 * being non-ambiguous: there's always exactly one canonical way to
 * encode a data structure defined in terms of ASN.1 using DER.
 * 
 * This spec allows full parsing of format syntax, but to understand
 * the semantics, one would typically require a dictionary of Object
 * Identifiers (OIDs), to match OID bodies against some human-readable
 * list of constants. OIDs are covered by many different standards,
 * so typically it's simpler to use a pre-compiled list of them, such
 * as:
 * 
 * * <https://www.cs.auckland.ac.nz/~pgut001/dumpasn1.cfg>
 * * <http://oid-info.com/>
 * * <https://www.alvestrand.no/objectid/top.html>
 * \sa https://www.itu.int/itu-t/recommendations/rec.aspx?rec=12483&lang=en Source
 */

#[derive(Default, Debug, Clone)]
pub struct Asn1Der {
    pub _root: SharedType<Asn1Der>,
    pub _parent: SharedType<Asn1Der>,
    pub _self: SharedType<Self>,
    type_tag: RefCell<Asn1Der_TypeTag>,
    len: RefCell<OptRc<Asn1Der_LenEncoded>>,
    body: RefCell<Option<Asn1Der_Body>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum Asn1Der_Body {
    Bytes(Vec<u8>),
    Asn1Der_BodySequence(OptRc<Asn1Der_BodySequence>),
    Asn1Der_BodyPrintableString(OptRc<Asn1Der_BodyPrintableString>),
    Asn1Der_BodyUtf8string(OptRc<Asn1Der_BodyUtf8string>),
    Asn1Der_BodyObjectId(OptRc<Asn1Der_BodyObjectId>),
}
impl From<&Asn1Der_Body> for Vec<u8> {
    fn from(v: &Asn1Der_Body) -> Self {
        if let Asn1Der_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected Asn1Der_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for Asn1Der_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&Asn1Der_Body> for OptRc<Asn1Der_BodySequence> {
    fn from(v: &Asn1Der_Body) -> Self {
        if let Asn1Der_Body::Asn1Der_BodySequence(x) = v {
            return x.clone();
        }
        panic!("expected Asn1Der_Body::Asn1Der_BodySequence, got {:?}", v)
    }
}
impl From<OptRc<Asn1Der_BodySequence>> for Asn1Der_Body {
    fn from(v: OptRc<Asn1Der_BodySequence>) -> Self {
        Self::Asn1Der_BodySequence(v)
    }
}
impl From<&Asn1Der_Body> for OptRc<Asn1Der_BodyPrintableString> {
    fn from(v: &Asn1Der_Body) -> Self {
        if let Asn1Der_Body::Asn1Der_BodyPrintableString(x) = v {
            return x.clone();
        }
        panic!("expected Asn1Der_Body::Asn1Der_BodyPrintableString, got {:?}", v)
    }
}
impl From<OptRc<Asn1Der_BodyPrintableString>> for Asn1Der_Body {
    fn from(v: OptRc<Asn1Der_BodyPrintableString>) -> Self {
        Self::Asn1Der_BodyPrintableString(v)
    }
}
impl From<&Asn1Der_Body> for OptRc<Asn1Der_BodyUtf8string> {
    fn from(v: &Asn1Der_Body) -> Self {
        if let Asn1Der_Body::Asn1Der_BodyUtf8string(x) = v {
            return x.clone();
        }
        panic!("expected Asn1Der_Body::Asn1Der_BodyUtf8string, got {:?}", v)
    }
}
impl From<OptRc<Asn1Der_BodyUtf8string>> for Asn1Der_Body {
    fn from(v: OptRc<Asn1Der_BodyUtf8string>) -> Self {
        Self::Asn1Der_BodyUtf8string(v)
    }
}
impl From<&Asn1Der_Body> for OptRc<Asn1Der_BodyObjectId> {
    fn from(v: &Asn1Der_Body) -> Self {
        if let Asn1Der_Body::Asn1Der_BodyObjectId(x) = v {
            return x.clone();
        }
        panic!("expected Asn1Der_Body::Asn1Der_BodyObjectId, got {:?}", v)
    }
}
impl From<OptRc<Asn1Der_BodyObjectId>> for Asn1Der_Body {
    fn from(v: OptRc<Asn1Der_BodyObjectId>) -> Self {
        Self::Asn1Der_BodyObjectId(v)
    }
}
impl KStruct for Asn1Der {
    type Root = Asn1Der;
    type Parent = Asn1Der;

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
        *self_rc.type_tag.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        let t = Self::read_into::<_, Asn1Der_LenEncoded>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.len.borrow_mut() = t;
        match *self_rc.type_tag() {
            Asn1Der_TypeTag::ObjectId => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len().result()? as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Asn1Der_BodyObjectId>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Asn1Der_TypeTag::PrintableString => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len().result()? as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Asn1Der_BodyPrintableString>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Asn1Der_TypeTag::Sequence10 => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len().result()? as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Asn1Der_BodySequence>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Asn1Der_TypeTag::Sequence30 => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len().result()? as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Asn1Der_BodySequence>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Asn1Der_TypeTag::Set => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len().result()? as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Asn1Der_BodySequence>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Asn1Der_TypeTag::Utf8string => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len().result()? as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Asn1Der_BodyUtf8string>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.body.borrow_mut() = Some(_io.read_bytes(*self_rc.len().result()? as usize)?.into());
            }
        }
        Ok(())
    }
}
impl Asn1Der {
}
impl Asn1Der {
    pub fn type_tag(&self) -> Ref<'_, Asn1Der_TypeTag> {
        self.type_tag.borrow()
    }
}
impl Asn1Der {
    pub fn len(&self) -> Ref<'_, OptRc<Asn1Der_LenEncoded>> {
        self.len.borrow()
    }
}
impl Asn1Der {
    pub fn body(&self) -> Ref<'_, Option<Asn1Der_Body>> {
        self.body.borrow()
    }
}
impl Asn1Der {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Asn1Der {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Asn1Der_TypeTag {
    EndOfContent,
    Boolean,
    Integer,
    BitString,
    OctetString,
    NullValue,
    ObjectId,
    ObjectDescriptor,
    External,
    Real,
    Enumerated,
    EmbeddedPdv,
    Utf8string,
    RelativeOid,
    Sequence10,
    PrintableString,
    Ia5string,
    Sequence30,
    Set,
    Unknown(i64),
}

impl TryFrom<i64> for Asn1Der_TypeTag {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Asn1Der_TypeTag> {
        match flag {
            0 => Ok(Asn1Der_TypeTag::EndOfContent),
            1 => Ok(Asn1Der_TypeTag::Boolean),
            2 => Ok(Asn1Der_TypeTag::Integer),
            3 => Ok(Asn1Der_TypeTag::BitString),
            4 => Ok(Asn1Der_TypeTag::OctetString),
            5 => Ok(Asn1Der_TypeTag::NullValue),
            6 => Ok(Asn1Der_TypeTag::ObjectId),
            7 => Ok(Asn1Der_TypeTag::ObjectDescriptor),
            8 => Ok(Asn1Der_TypeTag::External),
            9 => Ok(Asn1Der_TypeTag::Real),
            10 => Ok(Asn1Der_TypeTag::Enumerated),
            11 => Ok(Asn1Der_TypeTag::EmbeddedPdv),
            12 => Ok(Asn1Der_TypeTag::Utf8string),
            13 => Ok(Asn1Der_TypeTag::RelativeOid),
            16 => Ok(Asn1Der_TypeTag::Sequence10),
            19 => Ok(Asn1Der_TypeTag::PrintableString),
            22 => Ok(Asn1Der_TypeTag::Ia5string),
            48 => Ok(Asn1Der_TypeTag::Sequence30),
            49 => Ok(Asn1Der_TypeTag::Set),
            _ => Ok(Asn1Der_TypeTag::Unknown(flag)),
        }
    }
}

impl From<&Asn1Der_TypeTag> for i64 {
    fn from(v: &Asn1Der_TypeTag) -> Self {
        match *v {
            Asn1Der_TypeTag::EndOfContent => 0,
            Asn1Der_TypeTag::Boolean => 1,
            Asn1Der_TypeTag::Integer => 2,
            Asn1Der_TypeTag::BitString => 3,
            Asn1Der_TypeTag::OctetString => 4,
            Asn1Der_TypeTag::NullValue => 5,
            Asn1Der_TypeTag::ObjectId => 6,
            Asn1Der_TypeTag::ObjectDescriptor => 7,
            Asn1Der_TypeTag::External => 8,
            Asn1Der_TypeTag::Real => 9,
            Asn1Der_TypeTag::Enumerated => 10,
            Asn1Der_TypeTag::EmbeddedPdv => 11,
            Asn1Der_TypeTag::Utf8string => 12,
            Asn1Der_TypeTag::RelativeOid => 13,
            Asn1Der_TypeTag::Sequence10 => 16,
            Asn1Der_TypeTag::PrintableString => 19,
            Asn1Der_TypeTag::Ia5string => 22,
            Asn1Der_TypeTag::Sequence30 => 48,
            Asn1Der_TypeTag::Set => 49,
            Asn1Der_TypeTag::Unknown(v) => v
        }
    }
}

impl Default for Asn1Der_TypeTag {
    fn default() -> Self { Asn1Der_TypeTag::Unknown(0) }
}


/**
 * \sa https://learn.microsoft.com/en-us/windows/win32/seccertenroll/about-object-identifier Source
 */

#[derive(Default, Debug, Clone)]
pub struct Asn1Der_BodyObjectId {
    pub _root: SharedType<Asn1Der>,
    pub _parent: SharedType<Asn1Der>,
    pub _self: SharedType<Self>,
    first_and_second: RefCell<u8>,
    rest: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_first: Cell<bool>,
    first: RefCell<i32>,
    f_second: Cell<bool>,
    second: RefCell<i32>,
}
impl KStruct for Asn1Der_BodyObjectId {
    type Root = Asn1Der;
    type Parent = Asn1Der;

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
        *self_rc.first_and_second.borrow_mut() = _io.read_u1()?.into();
        *self_rc.rest.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl Asn1Der_BodyObjectId {
    pub fn first(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_first.get() {
            return Ok(self.first.borrow());
        }
        self.f_first.set(true);
        *self.first.borrow_mut() = (((*self.first_and_second() as u8) / (40 as u8))) as i32;
        Ok(self.first.borrow())
    }
    pub fn second(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_second.get() {
            return Ok(self.second.borrow());
        }
        self.f_second.set(true);
        *self.second.borrow_mut() = (((*self.first_and_second() as u8) % (40 as u8))) as i32;
        Ok(self.second.borrow())
    }
}
impl Asn1Der_BodyObjectId {
    pub fn first_and_second(&self) -> Ref<'_, u8> {
        self.first_and_second.borrow()
    }
}
impl Asn1Der_BodyObjectId {
    pub fn rest(&self) -> Ref<'_, Vec<u8>> {
        self.rest.borrow()
    }
}
impl Asn1Der_BodyObjectId {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Asn1Der_BodyPrintableString {
    pub _root: SharedType<Asn1Der>,
    pub _parent: SharedType<Asn1Der>,
    pub _self: SharedType<Self>,
    str: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Asn1Der_BodyPrintableString {
    type Root = Asn1Der;
    type Parent = Asn1Der;

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
        *self_rc.str.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "ASCII")?;
        Ok(())
    }
}
impl Asn1Der_BodyPrintableString {
}
impl Asn1Der_BodyPrintableString {
    pub fn str(&self) -> Ref<'_, String> {
        self.str.borrow()
    }
}
impl Asn1Der_BodyPrintableString {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Asn1Der_BodySequence {
    pub _root: SharedType<Asn1Der>,
    pub _parent: SharedType<Asn1Der>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<Asn1Der>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Asn1Der_BodySequence {
    type Root = Asn1Der;
    type Parent = Asn1Der;

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
                let t = Self::read_into::<_, Asn1Der>(&*_io, Some(self_rc._root.clone()), None)?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Asn1Der_BodySequence {
}
impl Asn1Der_BodySequence {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Asn1Der>>> {
        self.entries.borrow()
    }
}
impl Asn1Der_BodySequence {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Asn1Der_BodyUtf8string {
    pub _root: SharedType<Asn1Der>,
    pub _parent: SharedType<Asn1Der>,
    pub _self: SharedType<Self>,
    str: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Asn1Der_BodyUtf8string {
    type Root = Asn1Der;
    type Parent = Asn1Der;

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
        *self_rc.str.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Asn1Der_BodyUtf8string {
}
impl Asn1Der_BodyUtf8string {
    pub fn str(&self) -> Ref<'_, String> {
        self.str.borrow()
    }
}
impl Asn1Der_BodyUtf8string {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Asn1Der_LenEncoded {
    pub _root: SharedType<Asn1Der>,
    pub _parent: SharedType<Asn1Der>,
    pub _self: SharedType<Self>,
    b1: RefCell<u8>,
    int2: RefCell<u16>,
    int1: RefCell<u8>,
    _io: RefCell<BytesReader>,
    f_result: Cell<bool>,
    result: RefCell<u16>,
}
impl KStruct for Asn1Der_LenEncoded {
    type Root = Asn1Der;
    type Parent = Asn1Der;

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
        *self_rc.b1.borrow_mut() = _io.read_u1()?.into();
        if *self_rc.b1() == 130 {
            *self_rc.int2.borrow_mut() = _io.read_u2be()?.into();
        }
        if *self_rc.b1() == 129 {
            *self_rc.int1.borrow_mut() = _io.read_u1()?.into();
        }
        Ok(())
    }
}
impl Asn1Der_LenEncoded {
    pub fn result(
        &self
    ) -> KResult<Ref<'_, u16>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_result.get() {
            return Ok(self.result.borrow());
        }
        self.f_result.set(true);
        *self.result.borrow_mut() = (if *self.b1() == 129 { *self.int1() } else { if *self.b1() == 130 { *self.int2() } else { *self.b1() } }) as u16;
        Ok(self.result.borrow())
    }
}
impl Asn1Der_LenEncoded {
    pub fn b1(&self) -> Ref<'_, u8> {
        self.b1.borrow()
    }
}
impl Asn1Der_LenEncoded {
    pub fn int2(&self) -> Ref<'_, u16> {
        self.int2.borrow()
    }
}
impl Asn1Der_LenEncoded {
    pub fn int1(&self) -> Ref<'_, u8> {
        self.int1.borrow()
    }
}
impl Asn1Der_LenEncoded {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

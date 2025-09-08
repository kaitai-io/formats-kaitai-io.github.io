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
use super::vlq_base128_le::VlqBase128Le;

/**
 * Google Protocol Buffers (AKA protobuf) is a popular data
 * serialization scheme used for communication protocols, data storage,
 * etc. There are implementations are available for almost every
 * popular language. The focus points of this scheme are brevity (data
 * is encoded in a very size-efficient manner) and extensibility (one
 * can add keys to the structure, while keeping it readable in previous
 * version of software).
 * 
 * Protobuf uses semi-self-describing encoding scheme for its
 * messages. It means that it is possible to parse overall structure of
 * the message (skipping over fields one can't understand), but to
 * fully understand the message, one needs a protocol definition file
 * (`.proto`). To be specific:
 * 
 * * "Keys" in key-value pairs provided in the message are identified
 *   only with an integer "field tag". `.proto` file provides info on
 *   which symbolic field names these field tags map to.
 * * "Keys" also provide something called "wire type". It's not a data
 *   type in its common sense (i.e. you can't, for example, distinguish
 *   `sint32` vs `uint32` vs some enum, or `string` from `bytes`), but
 *   it's enough information to determine how many bytes to
 *   parse. Interpretation of the value should be done according to the
 *   type specified in `.proto` file.
 * * There's no direct information on which fields are optional /
 *   required, which fields may be repeated or constitute a map, what
 *   restrictions are placed on fields usage in a single message, what
 *   are the fields' default values, etc, etc.
 * \sa https://protobuf.dev/programming-guides/encoding/ Source
 */

#[derive(Default, Debug, Clone)]
pub struct GoogleProtobuf {
    pub _root: SharedType<GoogleProtobuf>,
    pub _parent: SharedType<GoogleProtobuf>,
    pub _self: SharedType<Self>,
    pairs: RefCell<Vec<OptRc<GoogleProtobuf_Pair>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for GoogleProtobuf {
    type Root = GoogleProtobuf;
    type Parent = GoogleProtobuf;

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
        *self_rc.pairs.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, GoogleProtobuf_Pair>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.pairs.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl GoogleProtobuf {
}

/**
 * Key-value pairs which constitute a message
 */
impl GoogleProtobuf {
    pub fn pairs(&self) -> Ref<'_, Vec<OptRc<GoogleProtobuf_Pair>>> {
        self.pairs.borrow()
    }
}
impl GoogleProtobuf {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct GoogleProtobuf_DelimitedBytes {
    pub _root: SharedType<GoogleProtobuf>,
    pub _parent: SharedType<GoogleProtobuf_Pair>,
    pub _self: SharedType<Self>,
    len: RefCell<OptRc<VlqBase128Le>>,
    body: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for GoogleProtobuf_DelimitedBytes {
    type Root = GoogleProtobuf;
    type Parent = GoogleProtobuf_Pair;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.len.borrow_mut() = t;
        *self_rc.body.borrow_mut() = _io.read_bytes(*self_rc.len().value()? as usize)?.into();
        Ok(())
    }
}
impl GoogleProtobuf_DelimitedBytes {
}
impl GoogleProtobuf_DelimitedBytes {
    pub fn len(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.len.borrow()
    }
}
impl GoogleProtobuf_DelimitedBytes {
    pub fn body(&self) -> Ref<'_, Vec<u8>> {
        self.body.borrow()
    }
}
impl GoogleProtobuf_DelimitedBytes {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Key-value pair
 */

#[derive(Default, Debug, Clone)]
pub struct GoogleProtobuf_Pair {
    pub _root: SharedType<GoogleProtobuf>,
    pub _parent: SharedType<GoogleProtobuf>,
    pub _self: SharedType<Self>,
    key: RefCell<OptRc<VlqBase128Le>>,
    value: RefCell<Option<GoogleProtobuf_Pair_Value>>,
    _io: RefCell<BytesReader>,
    f_field_tag: Cell<bool>,
    field_tag: RefCell<i32>,
    f_wire_type: Cell<bool>,
    wire_type: RefCell<GoogleProtobuf_Pair_WireTypes>,
}
#[derive(Debug, Clone)]
pub enum GoogleProtobuf_Pair_Value {
    U4(u32),
    U8(u64),
    GoogleProtobuf_DelimitedBytes(OptRc<GoogleProtobuf_DelimitedBytes>),
    VlqBase128Le(OptRc<VlqBase128Le>),
}
impl From<&GoogleProtobuf_Pair_Value> for u32 {
    fn from(v: &GoogleProtobuf_Pair_Value) -> Self {
        if let GoogleProtobuf_Pair_Value::U4(x) = v {
            return x.clone();
        }
        panic!("expected GoogleProtobuf_Pair_Value::U4, got {:?}", v)
    }
}
impl From<u32> for GoogleProtobuf_Pair_Value {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&GoogleProtobuf_Pair_Value> for u64 {
    fn from(v: &GoogleProtobuf_Pair_Value) -> Self {
        if let GoogleProtobuf_Pair_Value::U8(x) = v {
            return x.clone();
        }
        panic!("expected GoogleProtobuf_Pair_Value::U8, got {:?}", v)
    }
}
impl From<u64> for GoogleProtobuf_Pair_Value {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&GoogleProtobuf_Pair_Value> for OptRc<GoogleProtobuf_DelimitedBytes> {
    fn from(v: &GoogleProtobuf_Pair_Value) -> Self {
        if let GoogleProtobuf_Pair_Value::GoogleProtobuf_DelimitedBytes(x) = v {
            return x.clone();
        }
        panic!("expected GoogleProtobuf_Pair_Value::GoogleProtobuf_DelimitedBytes, got {:?}", v)
    }
}
impl From<OptRc<GoogleProtobuf_DelimitedBytes>> for GoogleProtobuf_Pair_Value {
    fn from(v: OptRc<GoogleProtobuf_DelimitedBytes>) -> Self {
        Self::GoogleProtobuf_DelimitedBytes(v)
    }
}
impl From<&GoogleProtobuf_Pair_Value> for OptRc<VlqBase128Le> {
    fn from(v: &GoogleProtobuf_Pair_Value) -> Self {
        if let GoogleProtobuf_Pair_Value::VlqBase128Le(x) = v {
            return x.clone();
        }
        panic!("expected GoogleProtobuf_Pair_Value::VlqBase128Le, got {:?}", v)
    }
}
impl From<OptRc<VlqBase128Le>> for GoogleProtobuf_Pair_Value {
    fn from(v: OptRc<VlqBase128Le>) -> Self {
        Self::VlqBase128Le(v)
    }
}
impl KStruct for GoogleProtobuf_Pair {
    type Root = GoogleProtobuf;
    type Parent = GoogleProtobuf;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.key.borrow_mut() = t;
        match *self_rc.wire_type()? {
            GoogleProtobuf_Pair_WireTypes::Bit32 => {
                *self_rc.value.borrow_mut() = Some(_io.read_u4le()?.into());
            }
            GoogleProtobuf_Pair_WireTypes::Bit64 => {
                *self_rc.value.borrow_mut() = Some(_io.read_u8le()?.into());
            }
            GoogleProtobuf_Pair_WireTypes::LenDelimited => {
                let t = Self::read_into::<_, GoogleProtobuf_DelimitedBytes>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            GoogleProtobuf_Pair_WireTypes::Varint => {
                let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl GoogleProtobuf_Pair {

    /**
     * Identifies a field of protocol. One can look up symbolic
     * field name in a `.proto` file by this field tag.
     */
    pub fn field_tag(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_field_tag.get() {
            return Ok(self.field_tag.borrow());
        }
        self.f_field_tag.set(true);
        *self.field_tag.borrow_mut() = (((*self.key().value()? as u64) >> (3 as u64))) as i32;
        Ok(self.field_tag.borrow())
    }

    /**
     * "Wire type" is a part of the "key" that carries enough
     * information to parse value from the wire, i.e. read correct
     * amount of bytes, but there's not enough informaton to
     * interprete in unambiguously. For example, one can't clearly
     * distinguish 64-bit fixed-sized integers from 64-bit floats,
     * signed zigzag-encoded varints from regular unsigned varints,
     * arbitrary bytes from UTF-8 encoded strings, etc.
     */
    pub fn wire_type(
        &self
    ) -> KResult<Ref<'_, GoogleProtobuf_Pair_WireTypes>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_wire_type.get() {
            return Ok(self.wire_type.borrow());
        }
        self.f_wire_type.set(true);
        *self.wire_type.borrow_mut() = (((*self.key().value()? as u64) & (7 as u64)) as i64).try_into()?;
        Ok(self.wire_type.borrow())
    }
}

/**
 * Key is a bit-mapped variable-length integer: lower 3 bits
 * are used for "wire type", and everything higher designates
 * an integer "field tag".
 */
impl GoogleProtobuf_Pair {
    pub fn key(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.key.borrow()
    }
}

/**
 * Value that corresponds to field identified by
 * `field_tag`. Type is determined approximately: there is
 * enough information to parse it unambiguously from a stream,
 * but further infromation from `.proto` file is required to
 * interprete it properly.
 */
impl GoogleProtobuf_Pair {
    pub fn value(&self) -> Ref<'_, Option<GoogleProtobuf_Pair_Value>> {
        self.value.borrow()
    }
}
impl GoogleProtobuf_Pair {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum GoogleProtobuf_Pair_WireTypes {
    Varint,
    Bit64,
    LenDelimited,
    GroupStart,
    GroupEnd,
    Bit32,
    Unknown(i64),
}

impl TryFrom<i64> for GoogleProtobuf_Pair_WireTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<GoogleProtobuf_Pair_WireTypes> {
        match flag {
            0 => Ok(GoogleProtobuf_Pair_WireTypes::Varint),
            1 => Ok(GoogleProtobuf_Pair_WireTypes::Bit64),
            2 => Ok(GoogleProtobuf_Pair_WireTypes::LenDelimited),
            3 => Ok(GoogleProtobuf_Pair_WireTypes::GroupStart),
            4 => Ok(GoogleProtobuf_Pair_WireTypes::GroupEnd),
            5 => Ok(GoogleProtobuf_Pair_WireTypes::Bit32),
            _ => Ok(GoogleProtobuf_Pair_WireTypes::Unknown(flag)),
        }
    }
}

impl From<&GoogleProtobuf_Pair_WireTypes> for i64 {
    fn from(v: &GoogleProtobuf_Pair_WireTypes) -> Self {
        match *v {
            GoogleProtobuf_Pair_WireTypes::Varint => 0,
            GoogleProtobuf_Pair_WireTypes::Bit64 => 1,
            GoogleProtobuf_Pair_WireTypes::LenDelimited => 2,
            GoogleProtobuf_Pair_WireTypes::GroupStart => 3,
            GoogleProtobuf_Pair_WireTypes::GroupEnd => 4,
            GoogleProtobuf_Pair_WireTypes::Bit32 => 5,
            GoogleProtobuf_Pair_WireTypes::Unknown(v) => v
        }
    }
}

impl Default for GoogleProtobuf_Pair_WireTypes {
    fn default() -> Self { GoogleProtobuf_Pair_WireTypes::Unknown(0) }
}


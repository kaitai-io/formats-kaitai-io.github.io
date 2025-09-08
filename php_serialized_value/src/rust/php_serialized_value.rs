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
 * A serialized PHP value, in the format used by PHP's built-in `serialize` and
 * `unserialize` functions. This format closely mirrors PHP's data model:
 * it supports all of PHP's scalar types (`NULL`, booleans, numbers, strings),
 * associative arrays, objects, and recursive data structures using references.
 * The only PHP values not supported by this format are *resources*,
 * which usually correspond to native file or connection handles and cannot be
 * meaningfully serialized.
 * 
 * There is no official documentation for this data format;
 * this spec was created based on the PHP source code and the behavior of
 * `serialize`/`unserialize`. PHP makes no guarantees about compatibility of
 * serialized data between PHP versions, but in practice, the format has
 * remained fully backwards-compatible - values serialized by an older
 * PHP version can be unserialized on any newer PHP version.
 * This spec supports serialized values from PHP 7.3 or any earlier version.
 * \sa https://www.php.net/manual/en/function.serialize.php Source
 * \sa https://www.php.net/manual/en/function.serialize.php#66147 Source
 * \sa https://www.php.net/manual/en/function.unserialize.php Source
 * \sa https://github.com/php/php-src/blob/php-7.3.5/ext/standard/var_unserializer.re Source
 * \sa https://github.com/php/php-src/blob/php-7.3.5/ext/standard/var.c#L822 Source
 */

#[derive(Default, Debug, Clone)]
pub struct PhpSerializedValue {
    pub _root: SharedType<PhpSerializedValue>,
    pub _parent: SharedType<PhpSerializedValue>,
    pub _self: SharedType<Self>,
    type: RefCell<PhpSerializedValue_ValueType>,
    contents: RefCell<Option<PhpSerializedValue_Contents>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum PhpSerializedValue_Contents {
    PhpSerializedValue_BoolContents(OptRc<PhpSerializedValue_BoolContents>),
    PhpSerializedValue_CustomSerializedObjectContents(OptRc<PhpSerializedValue_CustomSerializedObjectContents>),
    PhpSerializedValue_StringContents(OptRc<PhpSerializedValue_StringContents>),
    PhpSerializedValue_Php3ObjectContents(OptRc<PhpSerializedValue_Php3ObjectContents>),
    PhpSerializedValue_FloatContents(OptRc<PhpSerializedValue_FloatContents>),
    PhpSerializedValue_ObjectContents(OptRc<PhpSerializedValue_ObjectContents>),
    PhpSerializedValue_NullContents(OptRc<PhpSerializedValue_NullContents>),
    PhpSerializedValue_ArrayContents(OptRc<PhpSerializedValue_ArrayContents>),
    PhpSerializedValue_IntContents(OptRc<PhpSerializedValue_IntContents>),
}
impl From<&PhpSerializedValue_Contents> for OptRc<PhpSerializedValue_BoolContents> {
    fn from(v: &PhpSerializedValue_Contents) -> Self {
        if let PhpSerializedValue_Contents::PhpSerializedValue_BoolContents(x) = v {
            return x.clone();
        }
        panic!("expected PhpSerializedValue_Contents::PhpSerializedValue_BoolContents, got {:?}", v)
    }
}
impl From<OptRc<PhpSerializedValue_BoolContents>> for PhpSerializedValue_Contents {
    fn from(v: OptRc<PhpSerializedValue_BoolContents>) -> Self {
        Self::PhpSerializedValue_BoolContents(v)
    }
}
impl From<&PhpSerializedValue_Contents> for OptRc<PhpSerializedValue_CustomSerializedObjectContents> {
    fn from(v: &PhpSerializedValue_Contents) -> Self {
        if let PhpSerializedValue_Contents::PhpSerializedValue_CustomSerializedObjectContents(x) = v {
            return x.clone();
        }
        panic!("expected PhpSerializedValue_Contents::PhpSerializedValue_CustomSerializedObjectContents, got {:?}", v)
    }
}
impl From<OptRc<PhpSerializedValue_CustomSerializedObjectContents>> for PhpSerializedValue_Contents {
    fn from(v: OptRc<PhpSerializedValue_CustomSerializedObjectContents>) -> Self {
        Self::PhpSerializedValue_CustomSerializedObjectContents(v)
    }
}
impl From<&PhpSerializedValue_Contents> for OptRc<PhpSerializedValue_StringContents> {
    fn from(v: &PhpSerializedValue_Contents) -> Self {
        if let PhpSerializedValue_Contents::PhpSerializedValue_StringContents(x) = v {
            return x.clone();
        }
        panic!("expected PhpSerializedValue_Contents::PhpSerializedValue_StringContents, got {:?}", v)
    }
}
impl From<OptRc<PhpSerializedValue_StringContents>> for PhpSerializedValue_Contents {
    fn from(v: OptRc<PhpSerializedValue_StringContents>) -> Self {
        Self::PhpSerializedValue_StringContents(v)
    }
}
impl From<&PhpSerializedValue_Contents> for OptRc<PhpSerializedValue_Php3ObjectContents> {
    fn from(v: &PhpSerializedValue_Contents) -> Self {
        if let PhpSerializedValue_Contents::PhpSerializedValue_Php3ObjectContents(x) = v {
            return x.clone();
        }
        panic!("expected PhpSerializedValue_Contents::PhpSerializedValue_Php3ObjectContents, got {:?}", v)
    }
}
impl From<OptRc<PhpSerializedValue_Php3ObjectContents>> for PhpSerializedValue_Contents {
    fn from(v: OptRc<PhpSerializedValue_Php3ObjectContents>) -> Self {
        Self::PhpSerializedValue_Php3ObjectContents(v)
    }
}
impl From<&PhpSerializedValue_Contents> for OptRc<PhpSerializedValue_FloatContents> {
    fn from(v: &PhpSerializedValue_Contents) -> Self {
        if let PhpSerializedValue_Contents::PhpSerializedValue_FloatContents(x) = v {
            return x.clone();
        }
        panic!("expected PhpSerializedValue_Contents::PhpSerializedValue_FloatContents, got {:?}", v)
    }
}
impl From<OptRc<PhpSerializedValue_FloatContents>> for PhpSerializedValue_Contents {
    fn from(v: OptRc<PhpSerializedValue_FloatContents>) -> Self {
        Self::PhpSerializedValue_FloatContents(v)
    }
}
impl From<&PhpSerializedValue_Contents> for OptRc<PhpSerializedValue_ObjectContents> {
    fn from(v: &PhpSerializedValue_Contents) -> Self {
        if let PhpSerializedValue_Contents::PhpSerializedValue_ObjectContents(x) = v {
            return x.clone();
        }
        panic!("expected PhpSerializedValue_Contents::PhpSerializedValue_ObjectContents, got {:?}", v)
    }
}
impl From<OptRc<PhpSerializedValue_ObjectContents>> for PhpSerializedValue_Contents {
    fn from(v: OptRc<PhpSerializedValue_ObjectContents>) -> Self {
        Self::PhpSerializedValue_ObjectContents(v)
    }
}
impl From<&PhpSerializedValue_Contents> for OptRc<PhpSerializedValue_NullContents> {
    fn from(v: &PhpSerializedValue_Contents) -> Self {
        if let PhpSerializedValue_Contents::PhpSerializedValue_NullContents(x) = v {
            return x.clone();
        }
        panic!("expected PhpSerializedValue_Contents::PhpSerializedValue_NullContents, got {:?}", v)
    }
}
impl From<OptRc<PhpSerializedValue_NullContents>> for PhpSerializedValue_Contents {
    fn from(v: OptRc<PhpSerializedValue_NullContents>) -> Self {
        Self::PhpSerializedValue_NullContents(v)
    }
}
impl From<&PhpSerializedValue_Contents> for OptRc<PhpSerializedValue_ArrayContents> {
    fn from(v: &PhpSerializedValue_Contents) -> Self {
        if let PhpSerializedValue_Contents::PhpSerializedValue_ArrayContents(x) = v {
            return x.clone();
        }
        panic!("expected PhpSerializedValue_Contents::PhpSerializedValue_ArrayContents, got {:?}", v)
    }
}
impl From<OptRc<PhpSerializedValue_ArrayContents>> for PhpSerializedValue_Contents {
    fn from(v: OptRc<PhpSerializedValue_ArrayContents>) -> Self {
        Self::PhpSerializedValue_ArrayContents(v)
    }
}
impl From<&PhpSerializedValue_Contents> for OptRc<PhpSerializedValue_IntContents> {
    fn from(v: &PhpSerializedValue_Contents) -> Self {
        if let PhpSerializedValue_Contents::PhpSerializedValue_IntContents(x) = v {
            return x.clone();
        }
        panic!("expected PhpSerializedValue_Contents::PhpSerializedValue_IntContents, got {:?}", v)
    }
}
impl From<OptRc<PhpSerializedValue_IntContents>> for PhpSerializedValue_Contents {
    fn from(v: OptRc<PhpSerializedValue_IntContents>) -> Self {
        Self::PhpSerializedValue_IntContents(v)
    }
}
impl KStruct for PhpSerializedValue {
    type Root = PhpSerializedValue;
    type Parent = PhpSerializedValue;

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
        match *self_rc.type() {
            PhpSerializedValue_ValueType::Array => {
                let t = Self::read_into::<_, PhpSerializedValue_ArrayContents>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.contents.borrow_mut() = Some(t);
            }
            PhpSerializedValue_ValueType::Bool => {
                let t = Self::read_into::<_, PhpSerializedValue_BoolContents>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.contents.borrow_mut() = Some(t);
            }
            PhpSerializedValue_ValueType::CustomSerializedObject => {
                let t = Self::read_into::<_, PhpSerializedValue_CustomSerializedObjectContents>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.contents.borrow_mut() = Some(t);
            }
            PhpSerializedValue_ValueType::Float => {
                let t = Self::read_into::<_, PhpSerializedValue_FloatContents>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.contents.borrow_mut() = Some(t);
            }
            PhpSerializedValue_ValueType::Int => {
                let t = Self::read_into::<_, PhpSerializedValue_IntContents>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.contents.borrow_mut() = Some(t);
            }
            PhpSerializedValue_ValueType::Null => {
                let t = Self::read_into::<_, PhpSerializedValue_NullContents>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.contents.borrow_mut() = Some(t);
            }
            PhpSerializedValue_ValueType::Object => {
                let t = Self::read_into::<_, PhpSerializedValue_ObjectContents>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.contents.borrow_mut() = Some(t);
            }
            PhpSerializedValue_ValueType::ObjectReference => {
                let t = Self::read_into::<_, PhpSerializedValue_IntContents>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.contents.borrow_mut() = Some(t);
            }
            PhpSerializedValue_ValueType::Php3Object => {
                let t = Self::read_into::<_, PhpSerializedValue_Php3ObjectContents>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.contents.borrow_mut() = Some(t);
            }
            PhpSerializedValue_ValueType::Php6String => {
                let t = Self::read_into::<_, PhpSerializedValue_StringContents>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.contents.borrow_mut() = Some(t);
            }
            PhpSerializedValue_ValueType::String => {
                let t = Self::read_into::<_, PhpSerializedValue_StringContents>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.contents.borrow_mut() = Some(t);
            }
            PhpSerializedValue_ValueType::VariableReference => {
                let t = Self::read_into::<_, PhpSerializedValue_IntContents>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.contents.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl PhpSerializedValue {
}

/**
 * A single-character code indicating the type of the serialized value.
 */
impl PhpSerializedValue {
    pub fn type(&self) -> Ref<'_, PhpSerializedValue_ValueType> {
        self.type.borrow()
    }
}

/**
 * The contents of the serialized value, which vary depending on the type.
 */
impl PhpSerializedValue {
    pub fn contents(&self) -> Ref<'_, Option<PhpSerializedValue_Contents>> {
        self.contents.borrow()
    }
}
impl PhpSerializedValue {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum PhpSerializedValue_BoolValue {
    False,
    True,
    Unknown(i64),
}

impl TryFrom<i64> for PhpSerializedValue_BoolValue {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<PhpSerializedValue_BoolValue> {
        match flag {
            48 => Ok(PhpSerializedValue_BoolValue::False),
            49 => Ok(PhpSerializedValue_BoolValue::True),
            _ => Ok(PhpSerializedValue_BoolValue::Unknown(flag)),
        }
    }
}

impl From<&PhpSerializedValue_BoolValue> for i64 {
    fn from(v: &PhpSerializedValue_BoolValue) -> Self {
        match *v {
            PhpSerializedValue_BoolValue::False => 48,
            PhpSerializedValue_BoolValue::True => 49,
            PhpSerializedValue_BoolValue::Unknown(v) => v
        }
    }
}

impl Default for PhpSerializedValue_BoolValue {
    fn default() -> Self { PhpSerializedValue_BoolValue::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum PhpSerializedValue_ValueType {

    /**
     * An `object` whose class implements a custom serialized format using
     * `Serializable`. Available since PHP 5.1.
     */
    CustomSerializedObject,

    /**
     * A `NULL` value.
     */
    Null,

    /**
     * An `object` value (including its class name) serialized in the
     * default format. Available since PHP 4.
     */
    Object,

    /**
     * An additional reference to a value that has already appeared earlier.
     * Available since PHP 4.0.4.
     */
    VariableReference,

    /**
     * A `string` value from PHP 6. PHP 6 was never released, but support for
     * deserializing PHP 6 strings was added in PHP 5.2.1 and is still present
     * as of PHP 7.3. In all versions that support them (other than PHP 6),
     * they are deserialized exactly like regular strings.
     */
    Php6String,

    /**
     * An `array` value.
     */
    Array,

    /**
     * A `bool` value. Available since PHP 4.
     */
    Bool,

    /**
     * A `float` value.
     */
    Float,

    /**
     * An `int` value.
     */
    Int,

    /**
     * An `object` value (without a class name), as serialized by PHP 3.
     * 
     * PHP 4 through 7.3 included code to deserialize PHP 3 objects,
     * which has now been removed from the development repo and will likely
     * no longer be included in PHP 7.4. However, apparently this code
     * has been broken ever since it was added - it cannot even deserialize
     * a simple PHP 3 object like `o:0:{}`. If the code worked, PHP 3 objects
     * deserialized under PHP 4 and higher would have the class `stdClass`.
     */
    Php3Object,

    /**
     * An `object` value which shares its identity with another `object`
     * that has already appeared earlier. Available since PHP 5.
     */
    ObjectReference,

    /**
     * A `string` value.
     */
    String,
    Unknown(i64),
}

impl TryFrom<i64> for PhpSerializedValue_ValueType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<PhpSerializedValue_ValueType> {
        match flag {
            67 => Ok(PhpSerializedValue_ValueType::CustomSerializedObject),
            78 => Ok(PhpSerializedValue_ValueType::Null),
            79 => Ok(PhpSerializedValue_ValueType::Object),
            82 => Ok(PhpSerializedValue_ValueType::VariableReference),
            83 => Ok(PhpSerializedValue_ValueType::Php6String),
            97 => Ok(PhpSerializedValue_ValueType::Array),
            98 => Ok(PhpSerializedValue_ValueType::Bool),
            100 => Ok(PhpSerializedValue_ValueType::Float),
            105 => Ok(PhpSerializedValue_ValueType::Int),
            111 => Ok(PhpSerializedValue_ValueType::Php3Object),
            114 => Ok(PhpSerializedValue_ValueType::ObjectReference),
            115 => Ok(PhpSerializedValue_ValueType::String),
            _ => Ok(PhpSerializedValue_ValueType::Unknown(flag)),
        }
    }
}

impl From<&PhpSerializedValue_ValueType> for i64 {
    fn from(v: &PhpSerializedValue_ValueType) -> Self {
        match *v {
            PhpSerializedValue_ValueType::CustomSerializedObject => 67,
            PhpSerializedValue_ValueType::Null => 78,
            PhpSerializedValue_ValueType::Object => 79,
            PhpSerializedValue_ValueType::VariableReference => 82,
            PhpSerializedValue_ValueType::Php6String => 83,
            PhpSerializedValue_ValueType::Array => 97,
            PhpSerializedValue_ValueType::Bool => 98,
            PhpSerializedValue_ValueType::Float => 100,
            PhpSerializedValue_ValueType::Int => 105,
            PhpSerializedValue_ValueType::Php3Object => 111,
            PhpSerializedValue_ValueType::ObjectReference => 114,
            PhpSerializedValue_ValueType::String => 115,
            PhpSerializedValue_ValueType::Unknown(v) => v
        }
    }
}

impl Default for PhpSerializedValue_ValueType {
    fn default() -> Self { PhpSerializedValue_ValueType::Unknown(0) }
}


/**
 * The contents of an array value.
 */

#[derive(Default, Debug, Clone)]
pub struct PhpSerializedValue_ArrayContents {
    pub _root: SharedType<PhpSerializedValue>,
    pub _parent: SharedType<PhpSerializedValue>,
    pub _self: SharedType<Self>,
    colon: RefCell<Vec<u8>>,
    elements: RefCell<OptRc<PhpSerializedValue_CountPrefixedMapping>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PhpSerializedValue_ArrayContents {
    type Root = PhpSerializedValue;
    type Parent = PhpSerializedValue;

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
        *self_rc.colon.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.colon() == vec![0x3au8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/array_contents/seq/0".to_string() }));
        }
        let t = Self::read_into::<_, PhpSerializedValue_CountPrefixedMapping>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.elements.borrow_mut() = t;
        Ok(())
    }
}
impl PhpSerializedValue_ArrayContents {
}
impl PhpSerializedValue_ArrayContents {
    pub fn colon(&self) -> Ref<'_, Vec<u8>> {
        self.colon.borrow()
    }
}

/**
 * The array's elements. Keys must be of type `int` or `string`,
 * values may have any type.
 */
impl PhpSerializedValue_ArrayContents {
    pub fn elements(&self) -> Ref<'_, OptRc<PhpSerializedValue_CountPrefixedMapping>> {
        self.elements.borrow()
    }
}
impl PhpSerializedValue_ArrayContents {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * The contents of a boolean value (`value_type::bool`).
 */

#[derive(Default, Debug, Clone)]
pub struct PhpSerializedValue_BoolContents {
    pub _root: SharedType<PhpSerializedValue>,
    pub _parent: SharedType<PhpSerializedValue>,
    pub _self: SharedType<Self>,
    colon: RefCell<Vec<u8>>,
    value_dec: RefCell<PhpSerializedValue_BoolValue>,
    semicolon: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_value: Cell<bool>,
    value: RefCell<bool>,
}
impl KStruct for PhpSerializedValue_BoolContents {
    type Root = PhpSerializedValue;
    type Parent = PhpSerializedValue;

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
        *self_rc.colon.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.colon() == vec![0x3au8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/bool_contents/seq/0".to_string() }));
        }
        *self_rc.value_dec.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.semicolon.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.semicolon() == vec![0x3bu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/bool_contents/seq/2".to_string() }));
        }
        Ok(())
    }
}
impl PhpSerializedValue_BoolContents {

    /**
     * The value of the `bool`, parsed as a boolean.
     */
    pub fn value(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        self.f_value.set(true);
        *self.value.borrow_mut() = (*self.value_dec() == PhpSerializedValue_BoolValue::True) as bool;
        Ok(self.value.borrow())
    }
}
impl PhpSerializedValue_BoolContents {
    pub fn colon(&self) -> Ref<'_, Vec<u8>> {
        self.colon.borrow()
    }
}

/**
 * The value of the `bool`: `0` for `false` or `1` for `true`.
 */
impl PhpSerializedValue_BoolContents {
    pub fn value_dec(&self) -> Ref<'_, PhpSerializedValue_BoolValue> {
        self.value_dec.borrow()
    }
}
impl PhpSerializedValue_BoolContents {
    pub fn semicolon(&self) -> Ref<'_, Vec<u8>> {
        self.semicolon.borrow()
    }
}
impl PhpSerializedValue_BoolContents {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * A mapping (a sequence of key-value pairs) prefixed with its size.
 */

#[derive(Default, Debug, Clone)]
pub struct PhpSerializedValue_CountPrefixedMapping {
    pub _root: SharedType<PhpSerializedValue>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    num_entries_dec: RefCell<String>,
    opening_brace: RefCell<Vec<u8>>,
    entries: RefCell<Vec<OptRc<PhpSerializedValue_MappingEntry>>>,
    closing_brace: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_num_entries: Cell<bool>,
    num_entries: RefCell<i32>,
}
impl KStruct for PhpSerializedValue_CountPrefixedMapping {
    type Root = PhpSerializedValue;
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
        *self_rc.num_entries_dec.borrow_mut() = bytes_to_str(&_io.read_bytes_term(58, false, true, true)?.into(), "ASCII")?;
        *self_rc.opening_brace.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.opening_brace() == vec![0x7bu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/count_prefixed_mapping/seq/1".to_string() }));
        }
        *self_rc.entries.borrow_mut() = Vec::new();
        let l_entries = *self_rc.num_entries()?;
        for _i in 0..l_entries {
            let t = Self::read_into::<_, PhpSerializedValue_MappingEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.entries.borrow_mut().push(t);
        }
        *self_rc.closing_brace.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.closing_brace() == vec![0x7du8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/count_prefixed_mapping/seq/3".to_string() }));
        }
        Ok(())
    }
}
impl PhpSerializedValue_CountPrefixedMapping {

    /**
     * The number of key-value pairs in the mapping, parsed as an integer.
     */
    pub fn num_entries(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_entries.get() {
            return Ok(self.num_entries.borrow());
        }
        self.f_num_entries.set(true);
        *self.num_entries.borrow_mut() = (*self.num_entries_dec().parse::<i32>().map_err(|_| KError::CastError)?) as i32;
        Ok(self.num_entries.borrow())
    }
}

/**
 * The number of key-value pairs in the mapping, in ASCII decimal.
 */
impl PhpSerializedValue_CountPrefixedMapping {
    pub fn num_entries_dec(&self) -> Ref<'_, String> {
        self.num_entries_dec.borrow()
    }
}
impl PhpSerializedValue_CountPrefixedMapping {
    pub fn opening_brace(&self) -> Ref<'_, Vec<u8>> {
        self.opening_brace.borrow()
    }
}

/**
 * The key-value pairs contained in the mapping.
 */
impl PhpSerializedValue_CountPrefixedMapping {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<PhpSerializedValue_MappingEntry>>> {
        self.entries.borrow()
    }
}
impl PhpSerializedValue_CountPrefixedMapping {
    pub fn closing_brace(&self) -> Ref<'_, Vec<u8>> {
        self.closing_brace.borrow()
    }
}
impl PhpSerializedValue_CountPrefixedMapping {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * The contents of an object value that implements a custom
 * serialized format using `Serializable`.
 */

#[derive(Default, Debug, Clone)]
pub struct PhpSerializedValue_CustomSerializedObjectContents {
    pub _root: SharedType<PhpSerializedValue>,
    pub _parent: SharedType<PhpSerializedValue>,
    pub _self: SharedType<Self>,
    colon1: RefCell<Vec<u8>>,
    class_name: RefCell<OptRc<PhpSerializedValue_LengthPrefixedQuotedString>>,
    colon2: RefCell<Vec<u8>>,
    len_data_dec: RefCell<String>,
    opening_brace: RefCell<Vec<u8>>,
    data: RefCell<Vec<u8>>,
    closing_quote: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_len_data: Cell<bool>,
    len_data: RefCell<i32>,
}
impl KStruct for PhpSerializedValue_CustomSerializedObjectContents {
    type Root = PhpSerializedValue;
    type Parent = PhpSerializedValue;

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
        *self_rc.colon1.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.colon1() == vec![0x3au8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/custom_serialized_object_contents/seq/0".to_string() }));
        }
        let t = Self::read_into::<_, PhpSerializedValue_LengthPrefixedQuotedString>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.class_name.borrow_mut() = t;
        *self_rc.colon2.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.colon2() == vec![0x3au8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/custom_serialized_object_contents/seq/2".to_string() }));
        }
        *self_rc.len_data_dec.borrow_mut() = bytes_to_str(&_io.read_bytes_term(58, false, true, true)?.into(), "ASCII")?;
        *self_rc.opening_brace.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.opening_brace() == vec![0x7bu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/custom_serialized_object_contents/seq/4".to_string() }));
        }
        *self_rc.data.borrow_mut() = _io.read_bytes(*self_rc.len_data()? as usize)?.into();
        *self_rc.closing_quote.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.closing_quote() == vec![0x7du8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/custom_serialized_object_contents/seq/6".to_string() }));
        }
        Ok(())
    }
}
impl PhpSerializedValue_CustomSerializedObjectContents {

    /**
     * The length of the serialized data in bytes, parsed as an integer.
     * The braces are not counted in this length number.
     */
    pub fn len_data(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_data.get() {
            return Ok(self.len_data.borrow());
        }
        self.f_len_data.set(true);
        *self.len_data.borrow_mut() = (*self.len_data_dec().parse::<i32>().map_err(|_| KError::CastError)?) as i32;
        Ok(self.len_data.borrow())
    }
}
impl PhpSerializedValue_CustomSerializedObjectContents {
    pub fn colon1(&self) -> Ref<'_, Vec<u8>> {
        self.colon1.borrow()
    }
}

/**
 * The name of the object's class.
 */
impl PhpSerializedValue_CustomSerializedObjectContents {
    pub fn class_name(&self) -> Ref<'_, OptRc<PhpSerializedValue_LengthPrefixedQuotedString>> {
        self.class_name.borrow()
    }
}
impl PhpSerializedValue_CustomSerializedObjectContents {
    pub fn colon2(&self) -> Ref<'_, Vec<u8>> {
        self.colon2.borrow()
    }
}

/**
 * The length of the serialized data in bytes, in ASCII decimal.
 * The braces are not counted in this size number.
 */
impl PhpSerializedValue_CustomSerializedObjectContents {
    pub fn len_data_dec(&self) -> Ref<'_, String> {
        self.len_data_dec.borrow()
    }
}
impl PhpSerializedValue_CustomSerializedObjectContents {
    pub fn opening_brace(&self) -> Ref<'_, Vec<u8>> {
        self.opening_brace.borrow()
    }
}

/**
 * The custom serialized data. The braces are not included.
 * 
 * Although the surrounding braces make it look like a regular
 * serialized object, this field is actually more similar to a string:
 * it can contain arbitrary data that is not required to follow
 * any common structure.
 */
impl PhpSerializedValue_CustomSerializedObjectContents {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl PhpSerializedValue_CustomSerializedObjectContents {
    pub fn closing_quote(&self) -> Ref<'_, Vec<u8>> {
        self.closing_quote.borrow()
    }
}
impl PhpSerializedValue_CustomSerializedObjectContents {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * The contents of a floating-point value.
 */

#[derive(Default, Debug, Clone)]
pub struct PhpSerializedValue_FloatContents {
    pub _root: SharedType<PhpSerializedValue>,
    pub _parent: SharedType<PhpSerializedValue>,
    pub _self: SharedType<Self>,
    colon: RefCell<Vec<u8>>,
    value_dec: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PhpSerializedValue_FloatContents {
    type Root = PhpSerializedValue;
    type Parent = PhpSerializedValue;

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
        *self_rc.colon.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.colon() == vec![0x3au8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/float_contents/seq/0".to_string() }));
        }
        *self_rc.value_dec.borrow_mut() = bytes_to_str(&_io.read_bytes_term(59, false, true, true)?.into(), "ASCII")?;
        Ok(())
    }
}
impl PhpSerializedValue_FloatContents {
}
impl PhpSerializedValue_FloatContents {
    pub fn colon(&self) -> Ref<'_, Vec<u8>> {
        self.colon.borrow()
    }
}

/**
 * The value of the `float`, in ASCII decimal, as generated by PHP's
 * usual double-to-string conversion. In particular, this means that:
 * 
 * * A decimal point may not be included (for integral numbers)
 * * The number may use exponent notation (e. g. `1.0E+16`)
 * * Positive and negative infinity are represented as `INF`
 *   and `-INF`, respectively
 * * Not-a-number is represented as `NAN`
 */
impl PhpSerializedValue_FloatContents {
    pub fn value_dec(&self) -> Ref<'_, String> {
        self.value_dec.borrow()
    }
}
impl PhpSerializedValue_FloatContents {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * The contents of an integer-like value:
 * either an actual integer (`value_type::int`) or a reference
 * (`value_type::variable_reference`, `value_type::object_reference`).
 */

#[derive(Default, Debug, Clone)]
pub struct PhpSerializedValue_IntContents {
    pub _root: SharedType<PhpSerializedValue>,
    pub _parent: SharedType<PhpSerializedValue>,
    pub _self: SharedType<Self>,
    colon: RefCell<Vec<u8>>,
    value_dec: RefCell<String>,
    _io: RefCell<BytesReader>,
    f_value: Cell<bool>,
    value: RefCell<i32>,
}
impl KStruct for PhpSerializedValue_IntContents {
    type Root = PhpSerializedValue;
    type Parent = PhpSerializedValue;

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
        *self_rc.colon.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.colon() == vec![0x3au8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/int_contents/seq/0".to_string() }));
        }
        *self_rc.value_dec.borrow_mut() = bytes_to_str(&_io.read_bytes_term(59, false, true, true)?.into(), "ASCII")?;
        Ok(())
    }
}
impl PhpSerializedValue_IntContents {

    /**
     * The value of the `int`, parsed as an integer.
     */
    pub fn value(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        self.f_value.set(true);
        *self.value.borrow_mut() = (*self.value_dec().parse::<i32>().map_err(|_| KError::CastError)?) as i32;
        Ok(self.value.borrow())
    }
}
impl PhpSerializedValue_IntContents {
    pub fn colon(&self) -> Ref<'_, Vec<u8>> {
        self.colon.borrow()
    }
}

/**
 * The value of the `int`, in ASCII decimal.
 */
impl PhpSerializedValue_IntContents {
    pub fn value_dec(&self) -> Ref<'_, String> {
        self.value_dec.borrow()
    }
}
impl PhpSerializedValue_IntContents {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * A quoted string prefixed with its length.
 * 
 * Despite the quotes surrounding the string data, it can contain
 * arbitrary bytes, which are never escaped in any way.
 * This does not cause any ambiguities when parsing - the bounds of
 * the string are determined only by the length field, not by the quotes.
 */

#[derive(Default, Debug, Clone)]
pub struct PhpSerializedValue_LengthPrefixedQuotedString {
    pub _root: SharedType<PhpSerializedValue>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    len_data_dec: RefCell<String>,
    opening_quote: RefCell<Vec<u8>>,
    data: RefCell<Vec<u8>>,
    closing_quote: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_len_data: Cell<bool>,
    len_data: RefCell<i32>,
}
impl KStruct for PhpSerializedValue_LengthPrefixedQuotedString {
    type Root = PhpSerializedValue;
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
        *self_rc.len_data_dec.borrow_mut() = bytes_to_str(&_io.read_bytes_term(58, false, true, true)?.into(), "ASCII")?;
        *self_rc.opening_quote.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.opening_quote() == vec![0x22u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/length_prefixed_quoted_string/seq/1".to_string() }));
        }
        *self_rc.data.borrow_mut() = _io.read_bytes(*self_rc.len_data()? as usize)?.into();
        *self_rc.closing_quote.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.closing_quote() == vec![0x22u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/length_prefixed_quoted_string/seq/3".to_string() }));
        }
        Ok(())
    }
}
impl PhpSerializedValue_LengthPrefixedQuotedString {

    /**
     * The length of the string's contents in bytes, parsed as an integer.
     * The quotes are not counted in this size number.
     */
    pub fn len_data(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_data.get() {
            return Ok(self.len_data.borrow());
        }
        self.f_len_data.set(true);
        *self.len_data.borrow_mut() = (*self.len_data_dec().parse::<i32>().map_err(|_| KError::CastError)?) as i32;
        Ok(self.len_data.borrow())
    }
}

/**
 * The length of the string's data in bytes, in ASCII decimal.
 * The quotes are not counted in this length number.
 */
impl PhpSerializedValue_LengthPrefixedQuotedString {
    pub fn len_data_dec(&self) -> Ref<'_, String> {
        self.len_data_dec.borrow()
    }
}
impl PhpSerializedValue_LengthPrefixedQuotedString {
    pub fn opening_quote(&self) -> Ref<'_, Vec<u8>> {
        self.opening_quote.borrow()
    }
}

/**
 * The data contained in the string. The quotes are not included.
 */
impl PhpSerializedValue_LengthPrefixedQuotedString {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl PhpSerializedValue_LengthPrefixedQuotedString {
    pub fn closing_quote(&self) -> Ref<'_, Vec<u8>> {
        self.closing_quote.borrow()
    }
}
impl PhpSerializedValue_LengthPrefixedQuotedString {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * A mapping entry consisting of a key and a value.
 */

#[derive(Default, Debug, Clone)]
pub struct PhpSerializedValue_MappingEntry {
    pub _root: SharedType<PhpSerializedValue>,
    pub _parent: SharedType<PhpSerializedValue_CountPrefixedMapping>,
    pub _self: SharedType<Self>,
    key: RefCell<OptRc<PhpSerializedValue>>,
    value: RefCell<OptRc<PhpSerializedValue>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PhpSerializedValue_MappingEntry {
    type Root = PhpSerializedValue;
    type Parent = PhpSerializedValue_CountPrefixedMapping;

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
        let t = Self::read_into::<_, PhpSerializedValue>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.key.borrow_mut() = t;
        let t = Self::read_into::<_, PhpSerializedValue>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.value.borrow_mut() = t;
        Ok(())
    }
}
impl PhpSerializedValue_MappingEntry {
}

/**
 * The key of the entry.
 */
impl PhpSerializedValue_MappingEntry {
    pub fn key(&self) -> Ref<'_, OptRc<PhpSerializedValue>> {
        self.key.borrow()
    }
}

/**
 * The value of the entry.
 */
impl PhpSerializedValue_MappingEntry {
    pub fn value(&self) -> Ref<'_, OptRc<PhpSerializedValue>> {
        self.value.borrow()
    }
}
impl PhpSerializedValue_MappingEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * The contents of a null value (`value_type::null`). This structure
 * contains no actual data, since there is only a single `NULL` value.
 */

#[derive(Default, Debug, Clone)]
pub struct PhpSerializedValue_NullContents {
    pub _root: SharedType<PhpSerializedValue>,
    pub _parent: SharedType<PhpSerializedValue>,
    pub _self: SharedType<Self>,
    semicolon: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PhpSerializedValue_NullContents {
    type Root = PhpSerializedValue;
    type Parent = PhpSerializedValue;

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
        *self_rc.semicolon.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.semicolon() == vec![0x3bu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/null_contents/seq/0".to_string() }));
        }
        Ok(())
    }
}
impl PhpSerializedValue_NullContents {
}
impl PhpSerializedValue_NullContents {
    pub fn semicolon(&self) -> Ref<'_, Vec<u8>> {
        self.semicolon.borrow()
    }
}
impl PhpSerializedValue_NullContents {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * The contents of an object value serialized in the default format.
 * Unlike its PHP 3 counterpart, it contains a class name.
 */

#[derive(Default, Debug, Clone)]
pub struct PhpSerializedValue_ObjectContents {
    pub _root: SharedType<PhpSerializedValue>,
    pub _parent: SharedType<PhpSerializedValue>,
    pub _self: SharedType<Self>,
    colon1: RefCell<Vec<u8>>,
    class_name: RefCell<OptRc<PhpSerializedValue_LengthPrefixedQuotedString>>,
    colon2: RefCell<Vec<u8>>,
    properties: RefCell<OptRc<PhpSerializedValue_CountPrefixedMapping>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PhpSerializedValue_ObjectContents {
    type Root = PhpSerializedValue;
    type Parent = PhpSerializedValue;

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
        *self_rc.colon1.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.colon1() == vec![0x3au8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/object_contents/seq/0".to_string() }));
        }
        let t = Self::read_into::<_, PhpSerializedValue_LengthPrefixedQuotedString>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.class_name.borrow_mut() = t;
        *self_rc.colon2.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.colon2() == vec![0x3au8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/object_contents/seq/2".to_string() }));
        }
        let t = Self::read_into::<_, PhpSerializedValue_CountPrefixedMapping>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.properties.borrow_mut() = t;
        Ok(())
    }
}
impl PhpSerializedValue_ObjectContents {
}
impl PhpSerializedValue_ObjectContents {
    pub fn colon1(&self) -> Ref<'_, Vec<u8>> {
        self.colon1.borrow()
    }
}

/**
 * The name of the object's class.
 */
impl PhpSerializedValue_ObjectContents {
    pub fn class_name(&self) -> Ref<'_, OptRc<PhpSerializedValue_LengthPrefixedQuotedString>> {
        self.class_name.borrow()
    }
}
impl PhpSerializedValue_ObjectContents {
    pub fn colon2(&self) -> Ref<'_, Vec<u8>> {
        self.colon2.borrow()
    }
}

/**
 * The object's properties. Keys ust be of type `string`,
 * values may have any type.
 */
impl PhpSerializedValue_ObjectContents {
    pub fn properties(&self) -> Ref<'_, OptRc<PhpSerializedValue_CountPrefixedMapping>> {
        self.properties.borrow()
    }
}
impl PhpSerializedValue_ObjectContents {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * The contents of a PHP 3 object value. Unlike its counterpart in PHP 4
 * and above, it does not contain a class name.
 */

#[derive(Default, Debug, Clone)]
pub struct PhpSerializedValue_Php3ObjectContents {
    pub _root: SharedType<PhpSerializedValue>,
    pub _parent: SharedType<PhpSerializedValue>,
    pub _self: SharedType<Self>,
    colon: RefCell<Vec<u8>>,
    properties: RefCell<OptRc<PhpSerializedValue_CountPrefixedMapping>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PhpSerializedValue_Php3ObjectContents {
    type Root = PhpSerializedValue;
    type Parent = PhpSerializedValue;

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
        *self_rc.colon.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.colon() == vec![0x3au8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/php_3_object_contents/seq/0".to_string() }));
        }
        let t = Self::read_into::<_, PhpSerializedValue_CountPrefixedMapping>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.properties.borrow_mut() = t;
        Ok(())
    }
}
impl PhpSerializedValue_Php3ObjectContents {
}
impl PhpSerializedValue_Php3ObjectContents {
    pub fn colon(&self) -> Ref<'_, Vec<u8>> {
        self.colon.borrow()
    }
}

/**
 * The object's properties. Keys must be of type `string`,
 * values may have any type.
 */
impl PhpSerializedValue_Php3ObjectContents {
    pub fn properties(&self) -> Ref<'_, OptRc<PhpSerializedValue_CountPrefixedMapping>> {
        self.properties.borrow()
    }
}
impl PhpSerializedValue_Php3ObjectContents {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * The contents of a string value.
 * 
 * Note: PHP strings can contain arbitrary byte sequences.
 * They are not necessarily valid text in any specific encoding.
 */

#[derive(Default, Debug, Clone)]
pub struct PhpSerializedValue_StringContents {
    pub _root: SharedType<PhpSerializedValue>,
    pub _parent: SharedType<PhpSerializedValue>,
    pub _self: SharedType<Self>,
    colon: RefCell<Vec<u8>>,
    string: RefCell<OptRc<PhpSerializedValue_LengthPrefixedQuotedString>>,
    semicolon: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_value: Cell<bool>,
    value: RefCell<Vec<u8>>,
}
impl KStruct for PhpSerializedValue_StringContents {
    type Root = PhpSerializedValue;
    type Parent = PhpSerializedValue;

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
        *self_rc.colon.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.colon() == vec![0x3au8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/string_contents/seq/0".to_string() }));
        }
        let t = Self::read_into::<_, PhpSerializedValue_LengthPrefixedQuotedString>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.string.borrow_mut() = t;
        *self_rc.semicolon.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.semicolon() == vec![0x3bu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/string_contents/seq/2".to_string() }));
        }
        Ok(())
    }
}
impl PhpSerializedValue_StringContents {

    /**
     * The value of the string, as a byte array.
     */
    pub fn value(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        self.f_value.set(true);
        *self.value.borrow_mut() = self.string().data().to_vec();
        Ok(self.value.borrow())
    }
}
impl PhpSerializedValue_StringContents {
    pub fn colon(&self) -> Ref<'_, Vec<u8>> {
        self.colon.borrow()
    }
}
impl PhpSerializedValue_StringContents {
    pub fn string(&self) -> Ref<'_, OptRc<PhpSerializedValue_LengthPrefixedQuotedString>> {
        self.string.borrow()
    }
}
impl PhpSerializedValue_StringContents {
    pub fn semicolon(&self) -> Ref<'_, Vec<u8>> {
        self.semicolon.borrow()
    }
}
impl PhpSerializedValue_StringContents {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

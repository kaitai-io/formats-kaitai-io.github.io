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
 * A simple wrapper which allows to read a UTF-16 encoded string that starts
 * with a byte order mark (BOM). The BOM indicates the endianness of the UTF-16
 * encoding, which can be either big-endian (BE) or little-endian (LE).
 * 
 * Use:
 * 
 * * `value` to get the string value with BOM stripped, regardless of endianness.
 * * `is_be` and `is_le` to check the endianness indicated by the BOM.
 * * `bom` to check the raw byte order mark.
 * \sa - https://en.wikipedia.org/wiki/Byte_order_mark
 */

#[derive(Default, Debug, Clone)]
pub struct Utf16WithBom {
    pub _root: SharedType<Utf16WithBom>,
    pub _parent: SharedType<Utf16WithBom>,
    pub _self: SharedType<Self>,
    bom: RefCell<Vec<u8>>,
    str_be: RefCell<String>,
    str_le: RefCell<String>,
    _io: RefCell<BytesReader>,
    f_is_be: Cell<bool>,
    is_be: RefCell<bool>,
    f_is_le: Cell<bool>,
    is_le: RefCell<bool>,
    f_value: Cell<bool>,
    value: RefCell<String>,
}
impl KStruct for Utf16WithBom {
    type Root = Utf16WithBom;
    type Parent = Utf16WithBom;

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
        *self_rc.bom.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !( ((*self_rc.bom() == vec![0xfeu8, 0xffu8]) || (*self_rc.bom() == vec![0xffu8, 0xfeu8])) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotAnyOf, src_path: "/seq/0".to_string() }));
        }
        if *self_rc.is_be()? {
            *self_rc.str_be.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "UTF-16BE")?;
        }
        if *self_rc.is_le()? {
            *self_rc.str_le.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "UTF-16LE")?;
        }
        Ok(())
    }
}
impl Utf16WithBom {

    /**
     * True if the byte order mark indicates big-endian UTF-16 encoding.
     */
    pub fn is_be(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_be.get() {
            return Ok(self.is_be.borrow());
        }
        self.f_is_be.set(true);
        *self.is_be.borrow_mut() = (*self.bom() == vec![0xfeu8, 0xffu8]) as bool;
        Ok(self.is_be.borrow())
    }

    /**
     * True if the byte order mark indicates little-endian UTF-16 encoding.
     */
    pub fn is_le(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_le.get() {
            return Ok(self.is_le.borrow());
        }
        self.f_is_le.set(true);
        *self.is_le.borrow_mut() = (*self.bom() == vec![0xffu8, 0xfeu8]) as bool;
        Ok(self.is_le.borrow())
    }

    /**
     * The string value with BOM stripped, regardless of endianness.
     */
    pub fn value(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        self.f_value.set(true);
        *self.value.borrow_mut() = if *self.is_be()? { self.str_be().to_string() } else { self.str_le().to_string() }.to_string();
        Ok(self.value.borrow())
    }
}

/**
 * The byte order mark (BOM) is a special marker at the beginning of the
 * string that indicates the endianness of the UTF-16 encoding. The
 * character U+FEFF is used as the BOM, and its byte representation differs
 * based on endianness:
 * 
 * * For big-endian (BE) UTF-16, it's `[0xFE, 0xFF]`
 * * For little-endian (LE) UTF-16, it's `[0xFF, 0xFE]`
 * 
 * This implementation checks for the presence of a valid BOM and strips it
 * from the resulting string value.
 */
impl Utf16WithBom {
    pub fn bom(&self) -> Ref<'_, Vec<u8>> {
        self.bom.borrow()
    }
}
impl Utf16WithBom {
    pub fn str_be(&self) -> Ref<'_, String> {
        self.str_be.borrow()
    }
}
impl Utf16WithBom {
    pub fn str_le(&self) -> Ref<'_, String> {
        self.str_le.borrow()
    }
}
impl Utf16WithBom {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

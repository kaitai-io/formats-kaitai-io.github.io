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
 * A variable-length integer,
 * in the format used by the 0xfe chunks in the `'dcmp' (0)` and `'dcmp' (1)` resource compression formats.
 * See the dcmp_0 and dcmp_1 specs for more information about these compression formats.
 * 
 * This variable-length integer format can store an integer `x` in any of the following ways:
 * 
 * * In a single byte,
 *   if `0 <= x <= 0x7f`
 *   (7-bit unsigned integer)
 * * In 2 bytes,
 *   if `-0x4000 <= x <= 0x3eff`
 *   (15-bit signed integer with the highest `0x100` values unavailable)
 * * In 5 bytes, if `-0x80000000 <= x <= 0x7fffffff`
 *   (32-bit signed integer)
 * 
 * In practice,
 * values are always stored in the smallest possible format,
 * but technically any of the larger formats could be used as well.
 * \sa https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/common.py Source
 */

#[derive(Default, Debug, Clone)]
pub struct DcmpVariableLengthInteger {
    pub _root: SharedType<DcmpVariableLengthInteger>,
    pub _parent: SharedType<DcmpVariableLengthInteger>,
    pub _self: SharedType<Self>,
    first: RefCell<u8>,
    more: RefCell<Option<DcmpVariableLengthInteger_More>>,
    _io: RefCell<BytesReader>,
    f_value: Cell<bool>,
    value: RefCell<i32>,
}
#[derive(Debug, Clone)]
pub enum DcmpVariableLengthInteger_More {
    S4(i32),
    U1(u8),
}
impl From<i32> for DcmpVariableLengthInteger_More {
    fn from(v: i32) -> Self {
        Self::S4(v)
    }
}
impl From<&DcmpVariableLengthInteger_More> for i32 {
    fn from(e: &DcmpVariableLengthInteger_More) -> Self {
        if let DcmpVariableLengthInteger_More::S4(v) = e {
            return *v
        }
        panic!("trying to convert from enum DcmpVariableLengthInteger_More::S4 to i32, enum value {:?}", e)
    }
}
impl From<u8> for DcmpVariableLengthInteger_More {
    fn from(v: u8) -> Self {
        Self::U1(v)
    }
}
impl From<&DcmpVariableLengthInteger_More> for u8 {
    fn from(e: &DcmpVariableLengthInteger_More) -> Self {
        if let DcmpVariableLengthInteger_More::U1(v) = e {
            return *v
        }
        panic!("trying to convert from enum DcmpVariableLengthInteger_More::U1 to u8, enum value {:?}", e)
    }
}
impl From<&DcmpVariableLengthInteger_More> for usize {
    fn from(e: &DcmpVariableLengthInteger_More) -> Self {
        match e {
            DcmpVariableLengthInteger_More::S4(v) => *v as usize,
            DcmpVariableLengthInteger_More::U1(v) => *v as usize,
        }
    }
}

impl KStruct for DcmpVariableLengthInteger {
    type Root = DcmpVariableLengthInteger;
    type Parent = DcmpVariableLengthInteger;

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
        *self_rc.first.borrow_mut() = _io.read_u1()?.into();
        if *self_rc.first() >= 128 {
            match *self_rc.first() {
                255 => {
                    *self_rc.more.borrow_mut() = Some(_io.read_s4be()?.into());
                }
                _ => {
                    *self_rc.more.borrow_mut() = Some(_io.read_u1()?.into());
                }
            }
        }
        Ok(())
    }
}
impl DcmpVariableLengthInteger {

    /**
     * The decoded value of the variable-length integer.
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
        *self.value.borrow_mut() = (if *self.first() == 255 { self.more() } else { if *self.first() >= 128 { ((((((*self.first() as u8) << (8 as u8)) as i32) | (self.more() as i32)) as i32) - (49152 as i32)) } else { *self.first() } }) as i32;
        Ok(self.value.borrow())
    }
}

/**
 * The first byte of the variable-length integer.
 * This determines which storage format is used.
 * 
 * * For the 1-byte format,
 *   this encodes the entire value of the value.
 * * For the 2-byte format,
 *   this encodes the high 7 bits of the value,
 *   minus `0xc0`.
 *   The highest bit of the value,
 *   i. e. the second-highest bit of this field,
 *   is the sign bit.
 * * For the 5-byte format,
 *   this is always `0xff`.
 */
impl DcmpVariableLengthInteger {
    pub fn first(&self) -> Ref<'_, u8> {
        self.first.borrow()
    }
}

/**
 * The remaining bytes of the variable-length integer.
 * 
 * * For the 1-byte format,
 *   this is not present.
 * * For the 2-byte format,
 *   this encodes the low 8 bits of the value.
 * * For the 5-byte format,
 *   this encodes the entire value.
 */
impl DcmpVariableLengthInteger {
    pub fn more(&self) -> usize {
        self.more.borrow().as_ref().unwrap().into()
    }
    pub fn more_enum(&self) -> Ref<'_, Option<DcmpVariableLengthInteger_More>> {
        self.more.borrow()
    }
}
impl DcmpVariableLengthInteger {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

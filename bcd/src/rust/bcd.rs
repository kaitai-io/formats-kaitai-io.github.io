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
 * BCD (Binary Coded Decimals) is a common way to encode integer
 * numbers in a way that makes human-readable output somewhat
 * simpler. In this encoding scheme, every decimal digit is encoded as
 * either a single byte (8 bits), or a nibble (half of a byte, 4
 * bits). This obviously wastes a lot of bits, but it makes translation
 * into human-readable string much easier than traditional
 * binary-to-decimal conversion process, which includes lots of
 * divisions by 10.
 * 
 * For example, encoding integer 31337 in 8-digit, 8 bits per digit,
 * big endian order of digits BCD format yields
 * 
 * ```
 * 00 00 00 03 01 03 03 07
 * ```
 * 
 * Encoding the same integer as 8-digit, 4 bits per digit, little
 * endian order BCD format would yield:
 * 
 * ```
 * 73 31 30 00
 * ```
 * 
 * Using this type of encoding in Kaitai Struct is pretty
 * straightforward: one calls for this type, specifying desired
 * encoding parameters, and gets result using either `as_int` or
 * `as_str` attributes.
 */

#[derive(Default, Debug, Clone)]
pub struct Bcd {
    pub _root: SharedType<Bcd>,
    pub _parent: SharedType<Bcd>,
    pub _self: SharedType<Self>,
    num_digits: RefCell<u8>,
    bits_per_digit: RefCell<u8>,
    is_le: RefCell<bool>,
    digits: RefCell<Vec<Bcd_Digits>>,
    _io: RefCell<BytesReader>,
    f_as_int: Cell<bool>,
    as_int: RefCell<i32>,
    f_as_int_be: Cell<bool>,
    as_int_be: RefCell<i32>,
    f_as_int_le: Cell<bool>,
    as_int_le: RefCell<i32>,
    f_last_idx: Cell<bool>,
    last_idx: RefCell<i32>,
}
#[derive(Debug, Clone)]
pub enum Bcd_Digits {
    Bits(u64),
    U1(u8),
}
impl From<u64> for Bcd_Digits {
    fn from(v: u64) -> Self {
        Self::Bits(v)
    }
}
impl From<&Bcd_Digits> for u64 {
    fn from(e: &Bcd_Digits) -> Self {
        if let Bcd_Digits::Bits(v) = e {
            return *v
        }
        panic!("trying to convert from enum Bcd_Digits::Bits to u64, enum value {:?}", e)
    }
}
impl From<u8> for Bcd_Digits {
    fn from(v: u8) -> Self {
        Self::U1(v)
    }
}
impl From<&Bcd_Digits> for u8 {
    fn from(e: &Bcd_Digits) -> Self {
        if let Bcd_Digits::U1(v) = e {
            return *v
        }
        panic!("trying to convert from enum Bcd_Digits::U1 to u8, enum value {:?}", e)
    }
}
impl From<&Bcd_Digits> for usize {
    fn from(e: &Bcd_Digits) -> Self {
        match e {
            Bcd_Digits::Bits(v) => *v as usize,
            Bcd_Digits::U1(v) => *v as usize,
        }
    }
}

impl KStruct for Bcd {
    type Root = Bcd;
    type Parent = Bcd;

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
        *self_rc.digits.borrow_mut() = Vec::new();
        let l_digits = *self_rc.num_digits();
        for _i in 0..l_digits {
            match *self_rc.bits_per_digit() {
                4 => {
                    self_rc.digits.borrow_mut().push(_io.read_bits_int_be(4)?);
                }
                8 => {
                    self_rc.digits.borrow_mut().push(_io.read_u1()?.into());
                }
                _ => {}
            }
        }
        Ok(())
    }
}
impl Bcd {
    pub fn num_digits(&self) -> Ref<'_, u8> {
        self.num_digits.borrow()
    }
}
impl Bcd {
    pub fn bits_per_digit(&self) -> Ref<'_, u8> {
        self.bits_per_digit.borrow()
    }
}
impl Bcd {
    pub fn is_le(&self) -> Ref<'_, bool> {
        self.is_le.borrow()
    }
}
impl Bcd {
    pub fn set_params(&mut self, num_digits: u8, bits_per_digit: u8, is_le: bool) {
        *self.num_digits.borrow_mut() = num_digits;
        *self.bits_per_digit.borrow_mut() = bits_per_digit;
        *self.is_le.borrow_mut() = is_le;
    }
}
impl Bcd {

    /**
     * Value of this BCD number as integer. Endianness would be selected based on `is_le` parameter given.
     */
    pub fn as_int(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_as_int.get() {
            return Ok(self.as_int.borrow());
        }
        self.f_as_int.set(true);
        *self.as_int.borrow_mut() = (if *self.is_le() { *self.as_int_le()? } else { *self.as_int_be()? }) as i32;
        Ok(self.as_int.borrow())
    }

    /**
     * Value of this BCD number as integer (treating digit order as big-endian).
     */
    pub fn as_int_be(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_as_int_be.get() {
            return Ok(self.as_int_be.borrow());
        }
        self.f_as_int_be.set(true);
        *self.as_int_be.borrow_mut() = (((self.digits()[*self.last_idx()? as usize] as i32) + (if ((*self.num_digits() as u8) < (2 as u8)) { 0 } else { ((((self.digits()[((*self.last_idx()? as i32) - (1 as i32)) as usize] as i32) * (10 as i32)) as i32) + (if ((*self.num_digits() as u8) < (3 as u8)) { 0 } else { ((((self.digits()[((*self.last_idx()? as i32) - (2 as i32)) as usize] as i32) * (100 as i32)) as i32) + (if ((*self.num_digits() as u8) < (4 as u8)) { 0 } else { ((((self.digits()[((*self.last_idx()? as i32) - (3 as i32)) as usize] as i32) * (1000 as i32)) as i32) + (if ((*self.num_digits() as u8) < (5 as u8)) { 0 } else { ((((self.digits()[((*self.last_idx()? as i32) - (4 as i32)) as usize] as i32) * (10000 as i32)) as i32) + (if ((*self.num_digits() as u8) < (6 as u8)) { 0 } else { ((((self.digits()[((*self.last_idx()? as i32) - (5 as i32)) as usize] as i32) * (100000 as i32)) as i32) + (if ((*self.num_digits() as u8) < (7 as u8)) { 0 } else { ((((self.digits()[((*self.last_idx()? as i32) - (6 as i32)) as usize] as i32) * (1000000 as i32)) as i32) + (if ((*self.num_digits() as u8) < (8 as u8)) { 0 } else { ((self.digits()[((*self.last_idx()? as i32) - (7 as i32)) as usize] as i32) * (10000000 as i32)) } as i32)) } as i32)) } as i32)) } as i32)) } as i32)) } as i32)) } as i32))) as i32;
        Ok(self.as_int_be.borrow())
    }

    /**
     * Value of this BCD number as integer (treating digit order as little-endian).
     */
    pub fn as_int_le(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_as_int_le.get() {
            return Ok(self.as_int_le.borrow());
        }
        self.f_as_int_le.set(true);
        *self.as_int_le.borrow_mut() = (((self.digits()[0 as usize] as i32) + (if ((*self.num_digits() as u8) < (2 as u8)) { 0 } else { ((((self.digits()[1 as usize] as i32) * (10 as i32)) as i32) + (if ((*self.num_digits() as u8) < (3 as u8)) { 0 } else { ((((self.digits()[2 as usize] as i32) * (100 as i32)) as i32) + (if ((*self.num_digits() as u8) < (4 as u8)) { 0 } else { ((((self.digits()[3 as usize] as i32) * (1000 as i32)) as i32) + (if ((*self.num_digits() as u8) < (5 as u8)) { 0 } else { ((((self.digits()[4 as usize] as i32) * (10000 as i32)) as i32) + (if ((*self.num_digits() as u8) < (6 as u8)) { 0 } else { ((((self.digits()[5 as usize] as i32) * (100000 as i32)) as i32) + (if ((*self.num_digits() as u8) < (7 as u8)) { 0 } else { ((((self.digits()[6 as usize] as i32) * (1000000 as i32)) as i32) + (if ((*self.num_digits() as u8) < (8 as u8)) { 0 } else { ((self.digits()[7 as usize] as i32) * (10000000 as i32)) } as i32)) } as i32)) } as i32)) } as i32)) } as i32)) } as i32)) } as i32))) as i32;
        Ok(self.as_int_le.borrow())
    }

    /**
     * Index of last digit (0-based).
     */
    pub fn last_idx(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_last_idx.get() {
            return Ok(self.last_idx.borrow());
        }
        self.f_last_idx.set(true);
        *self.last_idx.borrow_mut() = (((*self.num_digits() as u8) - (1 as u8))) as i32;
        Ok(self.last_idx.borrow())
    }
}
impl Bcd {
    pub fn digits(&self) -> Ref<'_, Vec<Bcd_Digits>> {
        self.digits.borrow()
    }
}
impl Bcd {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

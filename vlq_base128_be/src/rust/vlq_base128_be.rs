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
 * A variable-length unsigned integer using base128 encoding. 1-byte groups
 * consist of 1-bit flag of continuation and 7-bit value chunk, and are ordered
 * "most significant group first", i.e. in "big-endian" manner.
 * 
 * This particular encoding is specified and used in:
 * 
 * * Standard MIDI file format
 * * ASN.1 BER encoding
 * * RAR 5.0 file format
 * 
 * More information on this encoding is available at
 * <https://en.wikipedia.org/wiki/Variable-length_quantity>
 * 
 * This particular implementation supports serialized values to up 8 bytes long.
 */

#[derive(Default, Debug, Clone)]
pub struct VlqBase128Be {
    pub _root: SharedType<VlqBase128Be>,
    pub _parent: SharedType<VlqBase128Be>,
    pub _self: SharedType<Self>,
    groups: RefCell<Vec<OptRc<VlqBase128Be_Group>>>,
    _io: RefCell<BytesReader>,
    f_last: Cell<bool>,
    last: RefCell<i32>,
    f_value: Cell<bool>,
    value: RefCell<u64>,
}
impl KStruct for VlqBase128Be {
    type Root = VlqBase128Be;
    type Parent = VlqBase128Be;

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
        *self_rc.groups.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let t = Self::read_into::<_, VlqBase128Be_Group>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.groups.borrow_mut().push(t);
                let _t_groups = self_rc.groups.borrow();
                let _tmpa = _t_groups.last().unwrap();
                _i += 1;
                let x = !(!(*_tmpa.has_next()));
                x
            } {}
        }
        Ok(())
    }
}
impl VlqBase128Be {
    pub fn last(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_last.get() {
            return Ok(self.last.borrow());
        }
        self.f_last.set(true);
        *self.last.borrow_mut() = (((self.groups().len() as i32) - (1 as i32))) as i32;
        Ok(self.last.borrow())
    }

    /**
     * Resulting value as normal integer
     */
    pub fn value(
        &self
    ) -> KResult<Ref<'_, u64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        self.f_value.set(true);
        *self.value.borrow_mut() = ((((((((((((((((*self.groups()[*self.last()? as usize].value()? as i32) + (if ((*self.last()? as i32) >= (1 as i32)) { ((*self.groups()[((*self.last()? as i32) - (1 as i32)) as usize].value()? as i32) << (7 as i32)) } else { 0 } as i32)) as i32) + (if ((*self.last()? as i32) >= (2 as i32)) { ((*self.groups()[((*self.last()? as i32) - (2 as i32)) as usize].value()? as i32) << (14 as i32)) } else { 0 } as i32)) as i32) + (if ((*self.last()? as i32) >= (3 as i32)) { ((*self.groups()[((*self.last()? as i32) - (3 as i32)) as usize].value()? as i32) << (21 as i32)) } else { 0 } as i32)) as i32) + (if ((*self.last()? as i32) >= (4 as i32)) { ((*self.groups()[((*self.last()? as i32) - (4 as i32)) as usize].value()? as i32) << (28 as i32)) } else { 0 } as i32)) as i32) + (if ((*self.last()? as i32) >= (5 as i32)) { ((*self.groups()[((*self.last()? as i32) - (5 as i32)) as usize].value()? as i32) << (35 as i32)) } else { 0 } as i32)) as i32) + (if ((*self.last()? as i32) >= (6 as i32)) { ((*self.groups()[((*self.last()? as i32) - (6 as i32)) as usize].value()? as i32) << (42 as i32)) } else { 0 } as i32)) as i32) + (if ((*self.last()? as i32) >= (7 as i32)) { ((*self.groups()[((*self.last()? as i32) - (7 as i32)) as usize].value()? as i32) << (49 as i32)) } else { 0 } as i32)) as u64)) as u64;
        Ok(self.value.borrow())
    }
}
impl VlqBase128Be {
    pub fn groups(&self) -> Ref<'_, Vec<OptRc<VlqBase128Be_Group>>> {
        self.groups.borrow()
    }
}
impl VlqBase128Be {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.
 */

#[derive(Default, Debug, Clone)]
pub struct VlqBase128Be_Group {
    pub _root: SharedType<VlqBase128Be>,
    pub _parent: SharedType<VlqBase128Be>,
    pub _self: SharedType<Self>,
    has_next: RefCell<bool>,
    value: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for VlqBase128Be_Group {
    type Root = VlqBase128Be;
    type Parent = VlqBase128Be;

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
        *self_rc.has_next.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.value.borrow_mut() = _io.read_bits_int_be(7)?;
        Ok(())
    }
}
impl VlqBase128Be_Group {
}

/**
 * If true, then we have more bytes to read
 */
impl VlqBase128Be_Group {
    pub fn has_next(&self) -> Ref<'_, bool> {
        self.has_next.borrow()
    }
}

/**
 * The 7-bit (base128) numeric value chunk of this group
 */
impl VlqBase128Be_Group {
    pub fn value(&self) -> Ref<'_, u64> {
        self.value.borrow()
    }
}
impl VlqBase128Be_Group {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

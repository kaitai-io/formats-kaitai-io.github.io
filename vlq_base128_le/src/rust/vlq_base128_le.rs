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
 * A variable-length unsigned/signed integer using base128 encoding. 1-byte groups
 * consist of 1-bit flag of continuation and 7-bit value chunk, and are ordered
 * "least significant group first", i.e. in "little-endian" manner.
 * 
 * This particular encoding is specified and used in:
 * 
 * * DWARF debug file format, where it's dubbed "unsigned LEB128" or "ULEB128".
 *   <https://dwarfstd.org/doc/dwarf-2.0.0.pdf> - page 139
 * * Google Protocol Buffers, where it's called "Base 128 Varints".
 *   <https://protobuf.dev/programming-guides/encoding/#varints>
 * * Apache Lucene, where it's called "VInt"
 *   <https://lucene.apache.org/core/3_5_0/fileformats.html#VInt>
 * * Apache Avro uses this as a basis for integer encoding, adding ZigZag on
 *   top of it for signed ints
 *   <https://avro.apache.org/docs/1.12.0/specification/#primitive-types-1>
 * 
 * More information on this encoding is available at <https://en.wikipedia.org/wiki/LEB128>
 * 
 * This particular implementation supports integer values up to 64 bits (i.e. the
 * maximum unsigned value supported is `2**64 - 1`), which implies that serialized
 * values can be up to 10 bytes in length.
 * 
 * If the most significant 10th byte (`groups[9]`) is present, its `has_next`
 * must be `false` (otherwise we would have 11 or more bytes, which is not
 * supported) and its `value` can be only `0` or `1` (because a 9-byte VLQ can
 * represent `9 * 7 = 63` bits already, so the 10th byte can only add 1 bit,
 * since only integers up to 64 bits are supported). These restrictions are
 * enforced by this implementation. They were inspired by the Protoscope tool,
 * see <https://github.com/protocolbuffers/protoscope/blob/8e7a6aafa2c9958527b1e0747e66e1bfff045819/writer.go#L644-L648>.
 */

#[derive(Default, Debug, Clone)]
pub struct VlqBase128Le {
    pub _root: SharedType<VlqBase128Le>,
    pub _parent: SharedType<VlqBase128Le>,
    pub _self: SharedType<Self>,
    groups: RefCell<Vec<OptRc<VlqBase128Le_Group>>>,
    _io: RefCell<BytesReader>,
    f_len: Cell<bool>,
    len: RefCell<i32>,
    f_sign_bit: Cell<bool>,
    sign_bit: RefCell<u64>,
    f_value: Cell<bool>,
    value: RefCell<u64>,
    f_value_signed: Cell<bool>,
    value_signed: RefCell<i64>,
}
impl KStruct for VlqBase128Le {
    type Root = VlqBase128Le;
    type Parent = VlqBase128Le;

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
                let f = |t : &mut VlqBase128Le_Group| Ok(t.set_params((_i).try_into().map_err(|_| KError::CastError)?, (if ((_i as i32) != (0 as i32)) { *self_rc.groups()[((_i as i32) - (1 as i32)) as usize].interm_value()? } else { 0 }).try_into().map_err(|_| KError::CastError)?, (if ((_i as i32) != (0 as i32)) { if ((_i as i32) == (9 as i32)) { 9223372036854775808 } else { ((*self_rc.groups()[((_i as i32) - (1 as i32)) as usize].multiplier() as u64) * (128 as u64)) } } else { 1 }).try_into().map_err(|_| KError::CastError)?));
                let t = Self::read_into_with_init::<_, VlqBase128Le_Group>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
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
impl VlqBase128Le {
    pub fn len(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len.get() {
            return Ok(self.len.borrow());
        }
        self.f_len.set(true);
        *self.len.borrow_mut() = (self.groups().len()) as i32;
        Ok(self.len.borrow())
    }
    pub fn sign_bit(
        &self
    ) -> KResult<Ref<'_, u64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_sign_bit.get() {
            return Ok(self.sign_bit.borrow());
        }
        self.f_sign_bit.set(true);
        *self.sign_bit.borrow_mut() = ((if ((*self.len()? as i32) == (10 as i32)) { 9223372036854775808 } else { ((*self.groups().last().ok_or(KError::EmptyIterator)?.multiplier() as u64) * (64 as u64)) } as u64)) as u64;
        Ok(self.sign_bit.borrow())
    }

    /**
     * Resulting unsigned value as normal integer
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
        *self.value.borrow_mut() = (*self.groups().last().ok_or(KError::EmptyIterator)?.interm_value()?) as u64;
        Ok(self.value.borrow())
    }
    pub fn value_signed(
        &self
    ) -> KResult<Ref<'_, i64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value_signed.get() {
            return Ok(self.value_signed.borrow());
        }
        self.f_value_signed.set(true);
        *self.value_signed.borrow_mut() = (if  ((((*self.sign_bit()? as u64) > (0 as u64))) && (*self.value()? >= *self.sign_bit()?))  { -((((*self.sign_bit()? as i32) - (((*self.value()? as u64) - (*self.sign_bit()? as u64)) as i32)) as i64)) } else { (*self.value()? as i64) }) as i64;
        Ok(self.value_signed.borrow())
    }
}
impl VlqBase128Le {
    pub fn groups(&self) -> Ref<'_, Vec<OptRc<VlqBase128Le_Group>>> {
        self.groups.borrow()
    }
}
impl VlqBase128Le {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.
 */

#[derive(Default, Debug, Clone)]
pub struct VlqBase128Le_Group {
    pub _root: SharedType<VlqBase128Le>,
    pub _parent: SharedType<VlqBase128Le>,
    pub _self: SharedType<Self>,
    idx: RefCell<i32>,
    prev_interm_value: RefCell<u64>,
    multiplier: RefCell<u64>,
    has_next: RefCell<bool>,
    value: RefCell<u64>,
    _io: RefCell<BytesReader>,
    f_interm_value: Cell<bool>,
    interm_value: RefCell<u64>,
}
impl KStruct for VlqBase128Le_Group {
    type Root = VlqBase128Le;
    type Parent = VlqBase128Le;

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
        if !(((*self_rc.has_next() as bool) == (if ((*self_rc.idx() as i32) == (9 as i32)) { false } else { *self_rc.has_next() } as bool))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/group/seq/0".to_string() }));
        }
        *self_rc.value.borrow_mut() = _io.read_bits_int_be(7)?;
        if !(((*self_rc.value() as i32) <= ((if ((*self_rc.idx() as i32) == (9 as i32)) { 1 } else { 127 } as u64) as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/group/seq/1".to_string() }));
        }
        Ok(())
    }
}
impl VlqBase128Le_Group {
    pub fn idx(&self) -> Ref<'_, i32> {
        self.idx.borrow()
    }
}
impl VlqBase128Le_Group {
    pub fn prev_interm_value(&self) -> Ref<'_, u64> {
        self.prev_interm_value.borrow()
    }
}
impl VlqBase128Le_Group {
    pub fn multiplier(&self) -> Ref<'_, u64> {
        self.multiplier.borrow()
    }
}
impl VlqBase128Le_Group {
    pub fn set_params(&mut self, idx: i32, prev_interm_value: u64, multiplier: u64) {
        *self.idx.borrow_mut() = idx;
        *self.prev_interm_value.borrow_mut() = prev_interm_value;
        *self.multiplier.borrow_mut() = multiplier;
    }
}
impl VlqBase128Le_Group {
    pub fn interm_value(
        &self
    ) -> KResult<Ref<'_, u64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_interm_value.get() {
            return Ok(self.interm_value.borrow());
        }
        self.f_interm_value.set(true);
        *self.interm_value.borrow_mut() = ((((*self.prev_interm_value() as i32) + (((*self.value() as i32) * (*self.multiplier() as i32)) as i32)) as u64)) as u64;
        Ok(self.interm_value.borrow())
    }
}

/**
 * If `true`, then we have more bytes to read.
 * 
 * Since this implementation only supports serialized values up to 10
 * bytes, this must be `false` in the 10th group (`groups[9]`).
 */
impl VlqBase128Le_Group {
    pub fn has_next(&self) -> Ref<'_, bool> {
        self.has_next.borrow()
    }
}

/**
 * The 7-bit (base128) numeric value chunk of this group
 * 
 * Since this implementation only supports integer values up to 64 bits,
 * the `value` in the 10th group (`groups[9]`) can only be `0` or `1`
 * (otherwise the width of the represented value would be 65 bits or
 * more, which is not supported).
 */
impl VlqBase128Le_Group {
    pub fn value(&self) -> Ref<'_, u64> {
        self.value.borrow()
    }
}
impl VlqBase128Le_Group {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

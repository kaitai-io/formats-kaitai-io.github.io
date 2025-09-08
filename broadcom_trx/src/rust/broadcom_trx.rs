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
 * .trx file format is widely used for distribution of firmware
 * updates for Broadcom devices. The most well-known are ASUS routers.
 * 
 * Fundamentally, it includes a footer which acts as a safeguard
 * against installing a firmware package on a wrong hardware model or
 * version, and a header which list numerous partitions packaged inside
 * a single .trx file.
 * 
 * trx files not necessarily contain all these headers.
 * \sa https://github.com/openwrt/firmware-utils/blob/a2c80c5/src/trx.c Source
 * \sa https://web.archive.org/web/20190127154419/https://openwrt.org/docs/techref/header Source
 * \sa https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt Source
 */

#[derive(Default, Debug, Clone)]
pub struct BroadcomTrx {
    pub _root: SharedType<BroadcomTrx>,
    pub _parent: SharedType<BroadcomTrx>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
    f_header: Cell<bool>,
    header: RefCell<OptRc<BroadcomTrx_Header>>,
    f_tail: Cell<bool>,
    tail: RefCell<OptRc<BroadcomTrx_Tail>>,
}
impl KStruct for BroadcomTrx {
    type Root = BroadcomTrx;
    type Parent = BroadcomTrx;

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
        Ok(())
    }
}
impl BroadcomTrx {
    pub fn header(
        &self
    ) -> KResult<Ref<'_, OptRc<BroadcomTrx_Header>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_header.get() {
            return Ok(self.header.borrow());
        }
        let _pos = _io.pos();
        _io.seek(0 as usize)?;
        let t = Self::read_into::<_, BroadcomTrx_Header>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.header.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.header.borrow())
    }
    pub fn tail(
        &self
    ) -> KResult<Ref<'_, OptRc<BroadcomTrx_Tail>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_tail.get() {
            return Ok(self.tail.borrow());
        }
        let _pos = _io.pos();
        _io.seek(((_io.size() as i32) - (64 as i32)) as usize)?;
        let t = Self::read_into::<_, BroadcomTrx_Tail>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.tail.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.tail.borrow())
    }
}
impl BroadcomTrx {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct BroadcomTrx_Header {
    pub _root: SharedType<BroadcomTrx>,
    pub _parent: SharedType<BroadcomTrx>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    len: RefCell<u32>,
    crc32: RefCell<u32>,
    version: RefCell<u16>,
    flags: RefCell<OptRc<BroadcomTrx_Header_Flags>>,
    partitions: RefCell<Vec<OptRc<BroadcomTrx_Header_Partition>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for BroadcomTrx_Header {
    type Root = BroadcomTrx;
    type Parent = BroadcomTrx;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.magic() == vec![0x48u8, 0x44u8, 0x52u8, 0x30u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/seq/0".to_string() }));
        }
        *self_rc.len.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.crc32.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.version.borrow_mut() = _io.read_u2le()?.into();
        let t = Self::read_into::<_, BroadcomTrx_Header_Flags>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.flags.borrow_mut() = t;
        *self_rc.partitions.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let f = |t : &mut BroadcomTrx_Header_Partition| Ok(t.set_params((_i).try_into().map_err(|_| KError::CastError)?));
                let t = Self::read_into_with_init::<_, BroadcomTrx_Header_Partition>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                self_rc.partitions.borrow_mut().push(t);
                let _t_partitions = self_rc.partitions.borrow();
                let _tmpa = _t_partitions.last().unwrap();
                _i += 1;
                let x = !( ((((_i as i32) >= (4 as i32))) || (!(*_tmpa.is_present()?))) );
                x
            } {}
        }
        Ok(())
    }
}
impl BroadcomTrx_Header {
}
impl BroadcomTrx_Header {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}

/**
 * Length of file including header
 */
impl BroadcomTrx_Header {
    pub fn len(&self) -> Ref<'_, u32> {
        self.len.borrow()
    }
}

/**
 * CRC from `version` (??? todo: see the original and disambiguate) to end of file
 */
impl BroadcomTrx_Header {
    pub fn crc32(&self) -> Ref<'_, u32> {
        self.crc32.borrow()
    }
}
impl BroadcomTrx_Header {
    pub fn version(&self) -> Ref<'_, u16> {
        self.version.borrow()
    }
}
impl BroadcomTrx_Header {
    pub fn flags(&self) -> Ref<'_, OptRc<BroadcomTrx_Header_Flags>> {
        self.flags.borrow()
    }
}

/**
 * Offsets of partitions from start of header
 */
impl BroadcomTrx_Header {
    pub fn partitions(&self) -> Ref<'_, Vec<OptRc<BroadcomTrx_Header_Partition>>> {
        self.partitions.borrow()
    }
}
impl BroadcomTrx_Header {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct BroadcomTrx_Header_Flags {
    pub _root: SharedType<BroadcomTrx>,
    pub _parent: SharedType<BroadcomTrx_Header>,
    pub _self: SharedType<Self>,
    flags: RefCell<Vec<bool>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for BroadcomTrx_Header_Flags {
    type Root = BroadcomTrx;
    type Parent = BroadcomTrx_Header;

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
        *self_rc.flags.borrow_mut() = Vec::new();
        let l_flags = 16;
        for _i in 0..l_flags {
            self_rc.flags.borrow_mut().push(_io.read_bits_int_le(1)? != 0);
        }
        Ok(())
    }
}
impl BroadcomTrx_Header_Flags {
}
impl BroadcomTrx_Header_Flags {
    pub fn flags(&self) -> Ref<'_, Vec<bool>> {
        self.flags.borrow()
    }
}
impl BroadcomTrx_Header_Flags {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct BroadcomTrx_Header_Partition {
    pub _root: SharedType<BroadcomTrx>,
    pub _parent: SharedType<BroadcomTrx_Header>,
    pub _self: SharedType<Self>,
    idx: RefCell<u8>,
    ofs_body: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_body: Cell<bool>,
    body: RefCell<Vec<u8>>,
    f_is_last: Cell<bool>,
    is_last: RefCell<bool>,
    f_is_present: Cell<bool>,
    is_present: RefCell<bool>,
    f_len_body: Cell<bool>,
    len_body: RefCell<i32>,
}
impl KStruct for BroadcomTrx_Header_Partition {
    type Root = BroadcomTrx;
    type Parent = BroadcomTrx_Header;

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
        *self_rc.ofs_body.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl BroadcomTrx_Header_Partition {
    pub fn idx(&self) -> Ref<'_, u8> {
        self.idx.borrow()
    }
}
impl BroadcomTrx_Header_Partition {
    pub fn set_params(&mut self, idx: u8) {
        *self.idx.borrow_mut() = idx;
    }
}
impl BroadcomTrx_Header_Partition {
    pub fn body(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_body.get() {
            return Ok(self.body.borrow());
        }
        self.f_body.set(true);
        if *self.is_present()? {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(*self.ofs_body() as usize)?;
            *self.body.borrow_mut() = io.read_bytes(*self.len_body()? as usize)?.into();
            io.seek(_pos)?;
        }
        Ok(self.body.borrow())
    }
    pub fn is_last(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_last.get() {
            return Ok(self.is_last.borrow());
        }
        self.f_is_last.set(true);
        if *self.is_present()? {
            *self.is_last.borrow_mut() = ( ((((*self.idx() as i32) == (((_prc.as_ref().unwrap().partitions().len() as i32) - (1 as i32)) as i32))) || (!(*_prc.as_ref().unwrap().partitions()[((*self.idx() as u8) + (1 as u8)) as usize].is_present()?))) ) as bool;
        }
        Ok(self.is_last.borrow())
    }
    pub fn is_present(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_present.get() {
            return Ok(self.is_present.borrow());
        }
        self.f_is_present.set(true);
        *self.is_present.borrow_mut() = (((*self.ofs_body() as u32) != (0 as u32))) as bool;
        Ok(self.is_present.borrow())
    }
    pub fn len_body(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_body.get() {
            return Ok(self.len_body.borrow());
        }
        self.f_len_body.set(true);
        if *self.is_present()? {
            *self.len_body.borrow_mut() = (if *self.is_last()? { ((_r._io().size() as i32) - (*self.ofs_body() as i32)) } else { *_prc.as_ref().unwrap().partitions()[((*self.idx() as u8) + (1 as u8)) as usize].ofs_body() }) as i32;
        }
        Ok(self.len_body.borrow())
    }
}
impl BroadcomTrx_Header_Partition {
    pub fn ofs_body(&self) -> Ref<'_, u32> {
        self.ofs_body.borrow()
    }
}
impl BroadcomTrx_Header_Partition {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct BroadcomTrx_Revision {
    pub _root: SharedType<BroadcomTrx>,
    pub _parent: SharedType<BroadcomTrx_Tail_HwCompInfo>,
    pub _self: SharedType<Self>,
    major: RefCell<u8>,
    minor: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for BroadcomTrx_Revision {
    type Root = BroadcomTrx;
    type Parent = BroadcomTrx_Tail_HwCompInfo;

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
        *self_rc.major.borrow_mut() = _io.read_u1()?.into();
        *self_rc.minor.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl BroadcomTrx_Revision {
}
impl BroadcomTrx_Revision {
    pub fn major(&self) -> Ref<'_, u8> {
        self.major.borrow()
    }
}
impl BroadcomTrx_Revision {
    pub fn minor(&self) -> Ref<'_, u8> {
        self.minor.borrow()
    }
}
impl BroadcomTrx_Revision {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * A safeguard against installation of firmware to an incompatible device
 */

#[derive(Default, Debug, Clone)]
pub struct BroadcomTrx_Tail {
    pub _root: SharedType<BroadcomTrx>,
    pub _parent: SharedType<BroadcomTrx>,
    pub _self: SharedType<Self>,
    version: RefCell<OptRc<BroadcomTrx_Version>>,
    product_id: RefCell<String>,
    comp_hw: RefCell<Vec<OptRc<BroadcomTrx_Tail_HwCompInfo>>>,
    reserved: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for BroadcomTrx_Tail {
    type Root = BroadcomTrx;
    type Parent = BroadcomTrx;

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
        let t = Self::read_into::<_, BroadcomTrx_Version>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.version.borrow_mut() = t;
        *self_rc.product_id.borrow_mut() = bytes_to_str(&bytes_terminate(&_io.read_bytes(12 as usize)?.into(), 0, false).into(), "UTF-8")?;
        *self_rc.comp_hw.borrow_mut() = Vec::new();
        let l_comp_hw = 4;
        for _i in 0..l_comp_hw {
            let t = Self::read_into::<_, BroadcomTrx_Tail_HwCompInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.comp_hw.borrow_mut().push(t);
        }
        *self_rc.reserved.borrow_mut() = _io.read_bytes(32 as usize)?.into();
        Ok(())
    }
}
impl BroadcomTrx_Tail {
}

/**
 * 1.9.2.7 by default
 */
impl BroadcomTrx_Tail {
    pub fn version(&self) -> Ref<'_, OptRc<BroadcomTrx_Version>> {
        self.version.borrow()
    }
}
impl BroadcomTrx_Tail {
    pub fn product_id(&self) -> Ref<'_, String> {
        self.product_id.borrow()
    }
}

/**
 * 0.02 - 2.99
 */
impl BroadcomTrx_Tail {
    pub fn comp_hw(&self) -> Ref<'_, Vec<OptRc<BroadcomTrx_Tail_HwCompInfo>>> {
        self.comp_hw.borrow()
    }
}
impl BroadcomTrx_Tail {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl BroadcomTrx_Tail {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct BroadcomTrx_Tail_HwCompInfo {
    pub _root: SharedType<BroadcomTrx>,
    pub _parent: SharedType<BroadcomTrx_Tail>,
    pub _self: SharedType<Self>,
    min: RefCell<OptRc<BroadcomTrx_Revision>>,
    max: RefCell<OptRc<BroadcomTrx_Revision>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for BroadcomTrx_Tail_HwCompInfo {
    type Root = BroadcomTrx;
    type Parent = BroadcomTrx_Tail;

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
        let t = Self::read_into::<_, BroadcomTrx_Revision>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.min.borrow_mut() = t;
        let t = Self::read_into::<_, BroadcomTrx_Revision>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.max.borrow_mut() = t;
        Ok(())
    }
}
impl BroadcomTrx_Tail_HwCompInfo {
}
impl BroadcomTrx_Tail_HwCompInfo {
    pub fn min(&self) -> Ref<'_, OptRc<BroadcomTrx_Revision>> {
        self.min.borrow()
    }
}
impl BroadcomTrx_Tail_HwCompInfo {
    pub fn max(&self) -> Ref<'_, OptRc<BroadcomTrx_Revision>> {
        self.max.borrow()
    }
}
impl BroadcomTrx_Tail_HwCompInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct BroadcomTrx_Version {
    pub _root: SharedType<BroadcomTrx>,
    pub _parent: SharedType<BroadcomTrx_Tail>,
    pub _self: SharedType<Self>,
    major: RefCell<u8>,
    minor: RefCell<u8>,
    patch: RefCell<u8>,
    tweak: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for BroadcomTrx_Version {
    type Root = BroadcomTrx;
    type Parent = BroadcomTrx_Tail;

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
        *self_rc.major.borrow_mut() = _io.read_u1()?.into();
        *self_rc.minor.borrow_mut() = _io.read_u1()?.into();
        *self_rc.patch.borrow_mut() = _io.read_u1()?.into();
        *self_rc.tweak.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl BroadcomTrx_Version {
}
impl BroadcomTrx_Version {
    pub fn major(&self) -> Ref<'_, u8> {
        self.major.borrow()
    }
}
impl BroadcomTrx_Version {
    pub fn minor(&self) -> Ref<'_, u8> {
        self.minor.borrow()
    }
}
impl BroadcomTrx_Version {
    pub fn patch(&self) -> Ref<'_, u8> {
        self.patch.borrow()
    }
}
impl BroadcomTrx_Version {
    pub fn tweak(&self) -> Ref<'_, u8> {
        self.tweak.borrow()
    }
}
impl BroadcomTrx_Version {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

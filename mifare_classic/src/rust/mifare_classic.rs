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
 * You can get a dump for testing from this link:
 * <https://github.com/zhovner/mfdread/raw/master/dump.mfd>
 * \sa https://github.com/nfc-tools/libnfc
 * https://www.nxp.com/docs/en/data-sheet/MF1S70YYX_V1.pdf
 *  Source
 */

#[derive(Default, Debug, Clone)]
pub struct MifareClassic {
    pub _root: SharedType<MifareClassic>,
    pub _parent: SharedType<MifareClassic>,
    pub _self: SharedType<Self>,
    sectors: RefCell<Vec<OptRc<MifareClassic_Sector>>>,
    _io: RefCell<BytesReader>,
    sectors_raw: RefCell<Vec<Vec<u8>>>,
}
impl KStruct for MifareClassic {
    type Root = MifareClassic;
    type Parent = MifareClassic;

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
        *self_rc.sectors_raw.borrow_mut() = Vec::new();
        *self_rc.sectors.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.sectors_raw.borrow_mut().push(_io.read_bytes(((((if ((_i as i32) >= (32 as i32)) { 4 } else { 1 } as i8) * (4 as i8)) as i32) * (16 as i32)) as usize)?.into());
                let sectors_raw = self_rc.sectors_raw.borrow();
                let io_sectors_raw = BytesReader::from(sectors_raw.last().unwrap().clone());
                let f = |t : &mut MifareClassic_Sector| Ok(t.set_params(((_i as i32) == (0 as i32))));
                let t = Self::read_into_with_init::<BytesReader, MifareClassic_Sector>(&io_sectors_raw, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                self_rc.sectors.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl MifareClassic {
}
impl MifareClassic {
    pub fn sectors(&self) -> Ref<'_, Vec<OptRc<MifareClassic_Sector>>> {
        self.sectors.borrow()
    }
}
impl MifareClassic {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl MifareClassic {
    pub fn sectors_raw(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.sectors_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MifareClassic_Key {
    pub _root: SharedType<MifareClassic>,
    pub _parent: SharedType<MifareClassic_Trailer>,
    pub _self: SharedType<Self>,
    key: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MifareClassic_Key {
    type Root = MifareClassic;
    type Parent = MifareClassic_Trailer;

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
        *self_rc.key.borrow_mut() = _io.read_bytes(6 as usize)?.into();
        Ok(())
    }
}
impl MifareClassic_Key {
}
impl MifareClassic_Key {
    pub fn key(&self) -> Ref<'_, Vec<u8>> {
        self.key.borrow()
    }
}
impl MifareClassic_Key {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MifareClassic_Manufacturer {
    pub _root: SharedType<MifareClassic>,
    pub _parent: SharedType<MifareClassic_Sector>,
    pub _self: SharedType<Self>,
    nuid: RefCell<u32>,
    bcc: RefCell<u8>,
    sak: RefCell<u8>,
    atqa: RefCell<u16>,
    manufacturer: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MifareClassic_Manufacturer {
    type Root = MifareClassic;
    type Parent = MifareClassic_Sector;

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
        *self_rc.nuid.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.bcc.borrow_mut() = _io.read_u1()?.into();
        *self_rc.sak.borrow_mut() = _io.read_u1()?.into();
        *self_rc.atqa.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.manufacturer.borrow_mut() = _io.read_bytes(8 as usize)?.into();
        Ok(())
    }
}
impl MifareClassic_Manufacturer {
}

/**
 * beware for 7bytes UID it goes over next fields
 */
impl MifareClassic_Manufacturer {
    pub fn nuid(&self) -> Ref<'_, u32> {
        self.nuid.borrow()
    }
}
impl MifareClassic_Manufacturer {
    pub fn bcc(&self) -> Ref<'_, u8> {
        self.bcc.borrow()
    }
}
impl MifareClassic_Manufacturer {
    pub fn sak(&self) -> Ref<'_, u8> {
        self.sak.borrow()
    }
}
impl MifareClassic_Manufacturer {
    pub fn atqa(&self) -> Ref<'_, u16> {
        self.atqa.borrow()
    }
}

/**
 * may contain manufacture date as BCD
 */
impl MifareClassic_Manufacturer {
    pub fn manufacturer(&self) -> Ref<'_, Vec<u8>> {
        self.manufacturer.borrow()
    }
}
impl MifareClassic_Manufacturer {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MifareClassic_Sector {
    pub _root: SharedType<MifareClassic>,
    pub _parent: SharedType<MifareClassic>,
    pub _self: SharedType<Self>,
    has_manufacturer: RefCell<bool>,
    manufacturer: RefCell<OptRc<MifareClassic_Manufacturer>>,
    data_filler: RefCell<OptRc<MifareClassic_Sector_Filler>>,
    trailer: RefCell<OptRc<MifareClassic_Trailer>>,
    _io: RefCell<BytesReader>,
    data_filler_raw: RefCell<Vec<u8>>,
    f_block_size: Cell<bool>,
    block_size: RefCell<i8>,
    f_blocks: Cell<bool>,
    blocks: RefCell<Vec<Vec<u8>>>,
    f_data: Cell<bool>,
    data: RefCell<Vec<u8>>,
    f_values: Cell<bool>,
    values: RefCell<OptRc<MifareClassic_Sector_Values>>,
}
impl KStruct for MifareClassic_Sector {
    type Root = MifareClassic;
    type Parent = MifareClassic;

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
        if *self_rc.has_manufacturer() {
            let t = Self::read_into::<_, MifareClassic_Manufacturer>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.manufacturer.borrow_mut() = t;
        }
        *self_rc.data_filler_raw.borrow_mut() = _io.read_bytes(((((_io.size() as i32) - (_io.pos() as i32)) as i32) - (16 as i32)) as usize)?.into();
        let data_filler_raw = self_rc.data_filler_raw.borrow();
        let _t_data_filler_raw_io = BytesReader::from(data_filler_raw.clone());
        let t = Self::read_into::<BytesReader, MifareClassic_Sector_Filler>(&_t_data_filler_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.data_filler.borrow_mut() = t;
        let t = Self::read_into::<_, MifareClassic_Trailer>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.trailer.borrow_mut() = t;
        Ok(())
    }
}
impl MifareClassic_Sector {
    pub fn has_manufacturer(&self) -> Ref<'_, bool> {
        self.has_manufacturer.borrow()
    }
}
impl MifareClassic_Sector {
    pub fn set_params(&mut self, has_manufacturer: bool) {
        *self.has_manufacturer.borrow_mut() = has_manufacturer;
    }
}
impl MifareClassic_Sector {
    pub fn block_size(
        &self
    ) -> KResult<Ref<'_, i8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_block_size.get() {
            return Ok(self.block_size.borrow());
        }
        self.f_block_size.set(true);
        *self.block_size.borrow_mut() = (16) as i8;
        Ok(self.block_size.borrow())
    }
    pub fn blocks(
        &self
    ) -> KResult<Ref<'_, Vec<Vec<u8>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_blocks.get() {
            return Ok(self.blocks.borrow());
        }
        self.f_blocks.set(true);
        let io = Clone::clone(&*self.data_filler()._io());
        let _pos = io.pos();
        io.seek(0 as usize)?;
        *self.blocks.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self.blocks.borrow_mut().push(io.read_bytes(*self.block_size()? as usize)?.into());
                _i += 1;
            }
        }
        io.seek(_pos)?;
        Ok(self.blocks.borrow())
    }
    pub fn data(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_data.get() {
            return Ok(self.data.borrow());
        }
        self.f_data.set(true);
        *self.data.borrow_mut() = self.data_filler().data().to_vec();
        Ok(self.data.borrow())
    }
    pub fn values(
        &self
    ) -> KResult<Ref<'_, OptRc<MifareClassic_Sector_Values>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_values.get() {
            return Ok(self.values.borrow());
        }
        let io = Clone::clone(&*self.data_filler()._io());
        let _pos = io.pos();
        io.seek(0 as usize)?;
        let t = Self::read_into::<BytesReader, MifareClassic_Sector_Values>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.values.borrow_mut() = t;
        io.seek(_pos)?;
        Ok(self.values.borrow())
    }
}
impl MifareClassic_Sector {
    pub fn manufacturer(&self) -> Ref<'_, OptRc<MifareClassic_Manufacturer>> {
        self.manufacturer.borrow()
    }
}
impl MifareClassic_Sector {
    pub fn data_filler(&self) -> Ref<'_, OptRc<MifareClassic_Sector_Filler>> {
        self.data_filler.borrow()
    }
}
impl MifareClassic_Sector {
    pub fn trailer(&self) -> Ref<'_, OptRc<MifareClassic_Trailer>> {
        self.trailer.borrow()
    }
}
impl MifareClassic_Sector {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl MifareClassic_Sector {
    pub fn data_filler_raw(&self) -> Ref<'_, Vec<u8>> {
        self.data_filler_raw.borrow()
    }
}

/**
 * only to create _io
 */

#[derive(Default, Debug, Clone)]
pub struct MifareClassic_Sector_Filler {
    pub _root: SharedType<MifareClassic>,
    pub _parent: SharedType<MifareClassic_Sector>,
    pub _self: SharedType<Self>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MifareClassic_Sector_Filler {
    type Root = MifareClassic;
    type Parent = MifareClassic_Sector;

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
        *self_rc.data.borrow_mut() = _io.read_bytes(_io.size() as usize)?.into();
        Ok(())
    }
}
impl MifareClassic_Sector_Filler {
}
impl MifareClassic_Sector_Filler {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl MifareClassic_Sector_Filler {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MifareClassic_Sector_Values {
    pub _root: SharedType<MifareClassic>,
    pub _parent: SharedType<MifareClassic_Sector>,
    pub _self: SharedType<Self>,
    values: RefCell<Vec<OptRc<MifareClassic_Sector_Values_ValueBlock>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MifareClassic_Sector_Values {
    type Root = MifareClassic;
    type Parent = MifareClassic_Sector;

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
        *self_rc.values.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, MifareClassic_Sector_Values_ValueBlock>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.values.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl MifareClassic_Sector_Values {
}
impl MifareClassic_Sector_Values {
    pub fn values(&self) -> Ref<'_, Vec<OptRc<MifareClassic_Sector_Values_ValueBlock>>> {
        self.values.borrow()
    }
}
impl MifareClassic_Sector_Values {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MifareClassic_Sector_Values_ValueBlock {
    pub _root: SharedType<MifareClassic>,
    pub _parent: SharedType<MifareClassic_Sector_Values>,
    pub _self: SharedType<Self>,
    valuez: RefCell<Vec<u32>>,
    addrz: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_addr: Cell<bool>,
    addr: RefCell<u8>,
    f_addr_valid: Cell<bool>,
    addr_valid: RefCell<bool>,
    f_valid: Cell<bool>,
    valid: RefCell<bool>,
    f_value: Cell<bool>,
    value: RefCell<u32>,
    f_value_valid: Cell<bool>,
    value_valid: RefCell<bool>,
}
impl KStruct for MifareClassic_Sector_Values_ValueBlock {
    type Root = MifareClassic;
    type Parent = MifareClassic_Sector_Values;

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
        *self_rc.valuez.borrow_mut() = Vec::new();
        let l_valuez = 3;
        for _i in 0..l_valuez {
            self_rc.valuez.borrow_mut().push(_io.read_u4le()?.into());
        }
        *self_rc.addrz.borrow_mut() = Vec::new();
        let l_addrz = 4;
        for _i in 0..l_addrz {
            self_rc.addrz.borrow_mut().push(_io.read_u1()?.into());
        }
        Ok(())
    }
}
impl MifareClassic_Sector_Values_ValueBlock {
    pub fn addr(
        &self
    ) -> KResult<Ref<'_, u8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_addr.get() {
            return Ok(self.addr.borrow());
        }
        self.f_addr.set(true);
        if *self.valid()? {
            *self.addr.borrow_mut() = (self.addrz()[0 as usize]) as u8;
        }
        Ok(self.addr.borrow())
    }
    pub fn addr_valid(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_addr_valid.get() {
            return Ok(self.addr_valid.borrow());
        }
        self.f_addr_valid.set(true);
        *self.addr_valid.borrow_mut() = ( ((((self.addrz()[0 as usize] as i32) == (~(self.addrz()[1 as usize]) as i32))) && (self.addrz()[0 as usize] == self.addrz()[2 as usize]) && (self.addrz()[1 as usize] == self.addrz()[3 as usize])) ) as bool;
        Ok(self.addr_valid.borrow())
    }
    pub fn valid(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_valid.get() {
            return Ok(self.valid.borrow());
        }
        self.f_valid.set(true);
        *self.valid.borrow_mut() = ( ((*self.value_valid()?) && (*self.addr_valid()?)) ) as bool;
        Ok(self.valid.borrow())
    }
    pub fn value(
        &self
    ) -> KResult<Ref<'_, u32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        self.f_value.set(true);
        if *self.valid()? {
            *self.value.borrow_mut() = (self.valuez()[0 as usize]) as u32;
        }
        Ok(self.value.borrow())
    }
    pub fn value_valid(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value_valid.get() {
            return Ok(self.value_valid.borrow());
        }
        self.f_value_valid.set(true);
        *self.value_valid.borrow_mut() = ( ((((self.valuez()[0 as usize] as i32) == (~(self.valuez()[1 as usize]) as i32))) && (self.valuez()[0 as usize] == self.valuez()[2 as usize])) ) as bool;
        Ok(self.value_valid.borrow())
    }
}
impl MifareClassic_Sector_Values_ValueBlock {
    pub fn valuez(&self) -> Ref<'_, Vec<u32>> {
        self.valuez.borrow()
    }
}
impl MifareClassic_Sector_Values_ValueBlock {
    pub fn addrz(&self) -> Ref<'_, Vec<u8>> {
        self.addrz.borrow()
    }
}
impl MifareClassic_Sector_Values_ValueBlock {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MifareClassic_Trailer {
    pub _root: SharedType<MifareClassic>,
    pub _parent: SharedType<MifareClassic_Sector>,
    pub _self: SharedType<Self>,
    key_a: RefCell<OptRc<MifareClassic_Key>>,
    access_bits: RefCell<OptRc<MifareClassic_Trailer_AccessConditions>>,
    user_byte: RefCell<u8>,
    key_b: RefCell<OptRc<MifareClassic_Key>>,
    _io: RefCell<BytesReader>,
    access_bits_raw: RefCell<Vec<u8>>,
    f_ac_bits: Cell<bool>,
    ac_bits: RefCell<i8>,
    f_ac_count_of_chunks: Cell<bool>,
    ac_count_of_chunks: RefCell<i32>,
    f_acs_in_sector: Cell<bool>,
    acs_in_sector: RefCell<i8>,
}
impl KStruct for MifareClassic_Trailer {
    type Root = MifareClassic;
    type Parent = MifareClassic_Sector;

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
        let t = Self::read_into::<_, MifareClassic_Key>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.key_a.borrow_mut() = t;
        *self_rc.access_bits_raw.borrow_mut() = _io.read_bytes(3 as usize)?.into();
        let access_bits_raw = self_rc.access_bits_raw.borrow();
        let _t_access_bits_raw_io = BytesReader::from(access_bits_raw.clone());
        let t = Self::read_into::<BytesReader, MifareClassic_Trailer_AccessConditions>(&_t_access_bits_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.access_bits.borrow_mut() = t;
        *self_rc.user_byte.borrow_mut() = _io.read_u1()?.into();
        let t = Self::read_into::<_, MifareClassic_Key>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.key_b.borrow_mut() = t;
        Ok(())
    }
}
impl MifareClassic_Trailer {
    pub fn ac_bits(
        &self
    ) -> KResult<Ref<'_, i8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ac_bits.get() {
            return Ok(self.ac_bits.borrow());
        }
        self.f_ac_bits.set(true);
        *self.ac_bits.borrow_mut() = (3) as i8;
        Ok(self.ac_bits.borrow())
    }
    pub fn ac_count_of_chunks(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ac_count_of_chunks.get() {
            return Ok(self.ac_count_of_chunks.borrow());
        }
        self.f_ac_count_of_chunks.set(true);
        *self.ac_count_of_chunks.borrow_mut() = (((*self.ac_bits()? as i8) * (2 as i8))) as i32;
        Ok(self.ac_count_of_chunks.borrow())
    }
    pub fn acs_in_sector(
        &self
    ) -> KResult<Ref<'_, i8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_acs_in_sector.get() {
            return Ok(self.acs_in_sector.borrow());
        }
        self.f_acs_in_sector.set(true);
        *self.acs_in_sector.borrow_mut() = (4) as i8;
        Ok(self.acs_in_sector.borrow())
    }
}
impl MifareClassic_Trailer {
    pub fn key_a(&self) -> Ref<'_, OptRc<MifareClassic_Key>> {
        self.key_a.borrow()
    }
}
impl MifareClassic_Trailer {
    pub fn access_bits(&self) -> Ref<'_, OptRc<MifareClassic_Trailer_AccessConditions>> {
        self.access_bits.borrow()
    }
}
impl MifareClassic_Trailer {
    pub fn user_byte(&self) -> Ref<'_, u8> {
        self.user_byte.borrow()
    }
}
impl MifareClassic_Trailer {
    pub fn key_b(&self) -> Ref<'_, OptRc<MifareClassic_Key>> {
        self.key_b.borrow()
    }
}
impl MifareClassic_Trailer {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl MifareClassic_Trailer {
    pub fn access_bits_raw(&self) -> Ref<'_, Vec<u8>> {
        self.access_bits_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MifareClassic_Trailer_AccessConditions {
    pub _root: SharedType<MifareClassic>,
    pub _parent: SharedType<MifareClassic_Trailer>,
    pub _self: SharedType<Self>,
    raw_chunks: RefCell<Vec<u64>>,
    _io: RefCell<BytesReader>,
    f_acs_raw: Cell<bool>,
    acs_raw: RefCell<Vec<OptRc<MifareClassic_Trailer_AccessConditions_Ac>>>,
    f_chunks: Cell<bool>,
    chunks: RefCell<Vec<OptRc<MifareClassic_Trailer_AccessConditions_ValidChunk>>>,
    f_data_acs: Cell<bool>,
    data_acs: RefCell<Vec<OptRc<MifareClassic_Trailer_AccessConditions_DataAc>>>,
    f_remaps: Cell<bool>,
    remaps: RefCell<Vec<OptRc<MifareClassic_Trailer_AccessConditions_ChunkBitRemap>>>,
    f_trailer_ac: Cell<bool>,
    trailer_ac: RefCell<OptRc<MifareClassic_Trailer_AccessConditions_TrailerAc>>,
}
impl KStruct for MifareClassic_Trailer_AccessConditions {
    type Root = MifareClassic;
    type Parent = MifareClassic_Trailer;

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
        *self_rc.raw_chunks.borrow_mut() = Vec::new();
        let l_raw_chunks = *_prc.as_ref().unwrap().ac_count_of_chunks()?;
        for _i in 0..l_raw_chunks {
            self_rc.raw_chunks.borrow_mut().push(_io.read_bits_int_be(4)?);
        }
        Ok(())
    }
}
impl MifareClassic_Trailer_AccessConditions {
    pub fn acs_raw(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<MifareClassic_Trailer_AccessConditions_Ac>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_acs_raw.get() {
            return Ok(self.acs_raw.borrow());
        }
        self.f_acs_raw.set(true);
        let _pos = _io.pos();
        _io.seek(0 as usize)?;
        *self.acs_raw.borrow_mut() = Vec::new();
        let l_acs_raw = *_prc.as_ref().unwrap().acs_in_sector()?;
        for _i in 0..l_acs_raw {
            let f = |t : &mut MifareClassic_Trailer_AccessConditions_Ac| Ok(t.set_params((_i).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, MifareClassic_Trailer_AccessConditions_Ac>(&*_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
            self.acs_raw.borrow_mut().push(t);
        }
        _io.seek(_pos)?;
        Ok(self.acs_raw.borrow())
    }
    pub fn chunks(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<MifareClassic_Trailer_AccessConditions_ValidChunk>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_chunks.get() {
            return Ok(self.chunks.borrow());
        }
        self.f_chunks.set(true);
        let _pos = _io.pos();
        _io.seek(0 as usize)?;
        *self.chunks.borrow_mut() = Vec::new();
        let l_chunks = *_prc.as_ref().unwrap().ac_bits()?;
        for _i in 0..l_chunks {
            let f = |t : &mut MifareClassic_Trailer_AccessConditions_ValidChunk| Ok(t.set_params((self.raw_chunks()[*self.remaps()?[_i as usize].inv_chunk_no()? as usize]).try_into().map_err(|_| KError::CastError)?, (self.raw_chunks()[*self.remaps()?[_i as usize].chunk_no()? as usize]).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, MifareClassic_Trailer_AccessConditions_ValidChunk>(&*_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
            self.chunks.borrow_mut().push(t);
        }
        _io.seek(_pos)?;
        Ok(self.chunks.borrow())
    }
    pub fn data_acs(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<MifareClassic_Trailer_AccessConditions_DataAc>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_data_acs.get() {
            return Ok(self.data_acs.borrow());
        }
        self.f_data_acs.set(true);
        let _pos = _io.pos();
        _io.seek(0 as usize)?;
        *self.data_acs.borrow_mut() = Vec::new();
        let l_data_acs = ((*_prc.as_ref().unwrap().acs_in_sector()? as i8) - (1 as i8));
        for _i in 0..l_data_acs {
            let f = |t : &mut MifareClassic_Trailer_AccessConditions_DataAc| Ok(t.set_params(&self.acs_raw()?[_i as usize]));
            let t = Self::read_into_with_init::<_, MifareClassic_Trailer_AccessConditions_DataAc>(&*_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
            self.data_acs.borrow_mut().push(t);
        }
        _io.seek(_pos)?;
        Ok(self.data_acs.borrow())
    }
    pub fn remaps(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<MifareClassic_Trailer_AccessConditions_ChunkBitRemap>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_remaps.get() {
            return Ok(self.remaps.borrow());
        }
        self.f_remaps.set(true);
        let _pos = _io.pos();
        _io.seek(0 as usize)?;
        *self.remaps.borrow_mut() = Vec::new();
        let l_remaps = *_prc.as_ref().unwrap().ac_bits()?;
        for _i in 0..l_remaps {
            let f = |t : &mut MifareClassic_Trailer_AccessConditions_ChunkBitRemap| Ok(t.set_params((_i).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, MifareClassic_Trailer_AccessConditions_ChunkBitRemap>(&*_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
            self.remaps.borrow_mut().push(t);
        }
        _io.seek(_pos)?;
        Ok(self.remaps.borrow())
    }
    pub fn trailer_ac(
        &self
    ) -> KResult<Ref<'_, OptRc<MifareClassic_Trailer_AccessConditions_TrailerAc>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_trailer_ac.get() {
            return Ok(self.trailer_ac.borrow());
        }
        let _pos = _io.pos();
        _io.seek(0 as usize)?;
        let f = |t : &mut MifareClassic_Trailer_AccessConditions_TrailerAc| Ok(t.set_params(&self.acs_raw()?[((*_prc.as_ref().unwrap().acs_in_sector()? as i8) - (1 as i8)) as usize]));
        let t = Self::read_into_with_init::<_, MifareClassic_Trailer_AccessConditions_TrailerAc>(&*_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
        *self.trailer_ac.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.trailer_ac.borrow())
    }
}
impl MifareClassic_Trailer_AccessConditions {
    pub fn raw_chunks(&self) -> Ref<'_, Vec<u64>> {
        self.raw_chunks.borrow()
    }
}
impl MifareClassic_Trailer_AccessConditions {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MifareClassic_Trailer_AccessConditions_Ac {
    pub _root: SharedType<MifareClassic>,
    pub _parent: SharedType<MifareClassic_Trailer_AccessConditions>,
    pub _self: SharedType<Self>,
    index: RefCell<u8>,
    _io: RefCell<BytesReader>,
    f_bits: Cell<bool>,
    bits: RefCell<Vec<OptRc<MifareClassic_Trailer_AccessConditions_Ac_AcBit>>>,
    f_inv_shift_val: Cell<bool>,
    inv_shift_val: RefCell<i32>,
    f_val: Cell<bool>,
    val: RefCell<i32>,
}
impl KStruct for MifareClassic_Trailer_AccessConditions_Ac {
    type Root = MifareClassic;
    type Parent = MifareClassic_Trailer_AccessConditions;

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
impl MifareClassic_Trailer_AccessConditions_Ac {
    pub fn index(&self) -> Ref<'_, u8> {
        self.index.borrow()
    }
}
impl MifareClassic_Trailer_AccessConditions_Ac {
    pub fn set_params(&mut self, index: u8) {
        *self.index.borrow_mut() = index;
    }
}
impl MifareClassic_Trailer_AccessConditions_Ac {
    pub fn bits(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<MifareClassic_Trailer_AccessConditions_Ac_AcBit>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_bits.get() {
            return Ok(self.bits.borrow());
        }
        self.f_bits.set(true);
        let _pos = _io.pos();
        _io.seek(0 as usize)?;
        *self.bits.borrow_mut() = Vec::new();
        let l_bits = *_prc.as_ref().unwrap()._parent.get_value().borrow().upgrade().as_ref().unwrap().ac_bits()?;
        for _i in 0..l_bits {
            let f = |t : &mut MifareClassic_Trailer_AccessConditions_Ac_AcBit| Ok(t.set_params((*self.index()).try_into().map_err(|_| KError::CastError)?, (*_prc.as_ref().unwrap().chunks()?[_i as usize].chunk()).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, MifareClassic_Trailer_AccessConditions_Ac_AcBit>(&*_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
            self.bits.borrow_mut().push(t);
        }
        _io.seek(_pos)?;
        Ok(self.bits.borrow())
    }
    pub fn inv_shift_val(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_inv_shift_val.get() {
            return Ok(self.inv_shift_val.borrow());
        }
        self.f_inv_shift_val.set(true);
        *self.inv_shift_val.borrow_mut() = (((((((*self.bits()?[0 as usize].n()? as i32) << (2 as i32)) as i32) | (((*self.bits()?[1 as usize].n()? as i32) << (1 as i32)) as i32)) as i32) | (*self.bits()?[2 as usize].n()? as i32))) as i32;
        Ok(self.inv_shift_val.borrow())
    }

    /**
     * c3 c2 c1
     */
    pub fn val(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_val.get() {
            return Ok(self.val.borrow());
        }
        self.f_val.set(true);
        *self.val.borrow_mut() = (((((((*self.bits()?[2 as usize].n()? as i32) << (2 as i32)) as i32) | (((*self.bits()?[1 as usize].n()? as i32) << (1 as i32)) as i32)) as i32) | (*self.bits()?[0 as usize].n()? as i32))) as i32;
        Ok(self.val.borrow())
    }
}
impl MifareClassic_Trailer_AccessConditions_Ac {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MifareClassic_Trailer_AccessConditions_Ac_AcBit {
    pub _root: SharedType<MifareClassic>,
    pub _parent: SharedType<MifareClassic_Trailer_AccessConditions_Ac>,
    pub _self: SharedType<Self>,
    i: RefCell<u8>,
    chunk: RefCell<u8>,
    _io: RefCell<BytesReader>,
    f_b: Cell<bool>,
    b: RefCell<bool>,
    f_n: Cell<bool>,
    n: RefCell<i32>,
}
impl KStruct for MifareClassic_Trailer_AccessConditions_Ac_AcBit {
    type Root = MifareClassic;
    type Parent = MifareClassic_Trailer_AccessConditions_Ac;

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
impl MifareClassic_Trailer_AccessConditions_Ac_AcBit {
    pub fn i(&self) -> Ref<'_, u8> {
        self.i.borrow()
    }
}
impl MifareClassic_Trailer_AccessConditions_Ac_AcBit {
    pub fn chunk(&self) -> Ref<'_, u8> {
        self.chunk.borrow()
    }
}
impl MifareClassic_Trailer_AccessConditions_Ac_AcBit {
    pub fn set_params(&mut self, i: u8, chunk: u8) {
        *self.i.borrow_mut() = i;
        *self.chunk.borrow_mut() = chunk;
    }
}
impl MifareClassic_Trailer_AccessConditions_Ac_AcBit {
    pub fn b(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_b.get() {
            return Ok(self.b.borrow());
        }
        self.f_b.set(true);
        *self.b.borrow_mut() = (((*self.n()? as i32) == (1 as i32))) as bool;
        Ok(self.b.borrow())
    }
    pub fn n(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_n.get() {
            return Ok(self.n.borrow());
        }
        self.f_n.set(true);
        *self.n.borrow_mut() = (((((*self.chunk() as u8) >> (*self.i() as u8)) as i32) & (1 as i32))) as i32;
        Ok(self.n.borrow())
    }
}
impl MifareClassic_Trailer_AccessConditions_Ac_AcBit {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MifareClassic_Trailer_AccessConditions_ChunkBitRemap {
    pub _root: SharedType<MifareClassic>,
    pub _parent: SharedType<MifareClassic_Trailer_AccessConditions>,
    pub _self: SharedType<Self>,
    bit_no: RefCell<u8>,
    _io: RefCell<BytesReader>,
    f_chunk_no: Cell<bool>,
    chunk_no: RefCell<i32>,
    f_inv_chunk_no: Cell<bool>,
    inv_chunk_no: RefCell<i32>,
    f_shift_value: Cell<bool>,
    shift_value: RefCell<i32>,
}
impl KStruct for MifareClassic_Trailer_AccessConditions_ChunkBitRemap {
    type Root = MifareClassic;
    type Parent = MifareClassic_Trailer_AccessConditions;

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
impl MifareClassic_Trailer_AccessConditions_ChunkBitRemap {
    pub fn bit_no(&self) -> Ref<'_, u8> {
        self.bit_no.borrow()
    }
}
impl MifareClassic_Trailer_AccessConditions_ChunkBitRemap {
    pub fn set_params(&mut self, bit_no: u8) {
        *self.bit_no.borrow_mut() = bit_no;
    }
}
impl MifareClassic_Trailer_AccessConditions_ChunkBitRemap {
    pub fn chunk_no(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_chunk_no.get() {
            return Ok(self.chunk_no.borrow());
        }
        self.f_chunk_no.set(true);
        *self.chunk_no.borrow_mut() = (modulo(((((*self.inv_chunk_no()? as i32) + (*self.shift_value()? as i32)) as i32) + (*_prc.as_ref().unwrap()._parent.get_value().borrow().upgrade().as_ref().unwrap().ac_count_of_chunks()? as i32)) as i64, *_prc.as_ref().unwrap()._parent.get_value().borrow().upgrade().as_ref().unwrap().ac_count_of_chunks()? as i64)) as i32;
        Ok(self.chunk_no.borrow())
    }
    pub fn inv_chunk_no(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_inv_chunk_no.get() {
            return Ok(self.inv_chunk_no.borrow());
        }
        self.f_inv_chunk_no.set(true);
        *self.inv_chunk_no.borrow_mut() = (((*self.bit_no() as i32) + (*self.shift_value()? as i32))) as i32;
        Ok(self.inv_chunk_no.borrow())
    }
    pub fn shift_value(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_shift_value.get() {
            return Ok(self.shift_value.borrow());
        }
        self.f_shift_value.set(true);
        *self.shift_value.borrow_mut() = (if ((*self.bit_no() as u8) == (1 as u8)) { -1 } else { 1 }) as i32;
        Ok(self.shift_value.borrow())
    }
}
impl MifareClassic_Trailer_AccessConditions_ChunkBitRemap {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MifareClassic_Trailer_AccessConditions_DataAc {
    pub _root: SharedType<MifareClassic>,
    pub _parent: SharedType<MifareClassic_Trailer_AccessConditions>,
    pub _self: SharedType<Self>,
    ac: RefCell<OptRc<MifareClassic_Trailer_AccessConditions_Ac>>,
    _io: RefCell<BytesReader>,
    f_decrement_available: Cell<bool>,
    decrement_available: RefCell<bool>,
    f_increment_available: Cell<bool>,
    increment_available: RefCell<bool>,
    f_read_key_a_required: Cell<bool>,
    read_key_a_required: RefCell<bool>,
    f_read_key_b_required: Cell<bool>,
    read_key_b_required: RefCell<bool>,
    f_write_key_a_required: Cell<bool>,
    write_key_a_required: RefCell<bool>,
    f_write_key_b_required: Cell<bool>,
    write_key_b_required: RefCell<bool>,
}
impl KStruct for MifareClassic_Trailer_AccessConditions_DataAc {
    type Root = MifareClassic;
    type Parent = MifareClassic_Trailer_AccessConditions;

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
impl MifareClassic_Trailer_AccessConditions_DataAc {
    pub fn ac(&self) -> Ref<'_, OptRc<MifareClassic_Trailer_AccessConditions_Ac>> {
        self.ac.borrow()
    }
}
impl MifareClassic_Trailer_AccessConditions_DataAc {
    pub fn set_params(&mut self, ac: &OptRc<MifareClassic_Trailer_AccessConditions_Ac>) {
        *self.ac.borrow_mut() = ac.clone();
    }
}
impl MifareClassic_Trailer_AccessConditions_DataAc {
    pub fn decrement_available(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_decrement_available.get() {
            return Ok(self.decrement_available.borrow());
        }
        self.f_decrement_available.set(true);
        *self.decrement_available.borrow_mut() = ( (( ((*self.ac().bits()?[1 as usize].b()?) || (!(*self.ac().bits()?[0 as usize].b()?))) ) && (!(*self.ac().bits()?[2 as usize].b()?))) ) as bool;
        Ok(self.decrement_available.borrow())
    }
    pub fn increment_available(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_increment_available.get() {
            return Ok(self.increment_available.borrow());
        }
        self.f_increment_available.set(true);
        *self.increment_available.borrow_mut() = ( (( ((!(*self.ac().bits()?[0 as usize].b()?)) && (!(*self.read_key_a_required()?)) && (!(*self.read_key_b_required()?))) ) || ( ((!(*self.ac().bits()?[0 as usize].b()?)) && (*self.read_key_a_required()?) && (*self.read_key_b_required()?)) )) ) as bool;
        Ok(self.increment_available.borrow())
    }
    pub fn read_key_a_required(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_read_key_a_required.get() {
            return Ok(self.read_key_a_required.borrow());
        }
        self.f_read_key_a_required.set(true);
        *self.read_key_a_required.borrow_mut() = (((*self.ac().val()? as i32) <= (4 as i32))) as bool;
        Ok(self.read_key_a_required.borrow())
    }
    pub fn read_key_b_required(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_read_key_b_required.get() {
            return Ok(self.read_key_b_required.borrow());
        }
        self.f_read_key_b_required.set(true);
        *self.read_key_b_required.borrow_mut() = (((*self.ac().val()? as i32) <= (6 as i32))) as bool;
        Ok(self.read_key_b_required.borrow())
    }
    pub fn write_key_a_required(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_write_key_a_required.get() {
            return Ok(self.write_key_a_required.borrow());
        }
        self.f_write_key_a_required.set(true);
        *self.write_key_a_required.borrow_mut() = (((*self.ac().val()? as i32) == (0 as i32))) as bool;
        Ok(self.write_key_a_required.borrow())
    }
    pub fn write_key_b_required(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_write_key_b_required.get() {
            return Ok(self.write_key_b_required.borrow());
        }
        self.f_write_key_b_required.set(true);
        *self.write_key_b_required.borrow_mut() = ( (( ((!(*self.read_key_a_required()?)) || (*self.read_key_b_required()?)) ) && (!(*self.ac().bits()?[0 as usize].b()?))) ) as bool;
        Ok(self.write_key_b_required.borrow())
    }
}
impl MifareClassic_Trailer_AccessConditions_DataAc {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MifareClassic_Trailer_AccessConditions_TrailerAc {
    pub _root: SharedType<MifareClassic>,
    pub _parent: SharedType<MifareClassic_Trailer_AccessConditions>,
    pub _self: SharedType<Self>,
    ac: RefCell<OptRc<MifareClassic_Trailer_AccessConditions_Ac>>,
    _io: RefCell<BytesReader>,
    f_can_read_key_b: Cell<bool>,
    can_read_key_b: RefCell<bool>,
    f_can_write_access_bits: Cell<bool>,
    can_write_access_bits: RefCell<bool>,
    f_can_write_keys: Cell<bool>,
    can_write_keys: RefCell<bool>,
    f_key_b_controls_write: Cell<bool>,
    key_b_controls_write: RefCell<bool>,
}
impl KStruct for MifareClassic_Trailer_AccessConditions_TrailerAc {
    type Root = MifareClassic;
    type Parent = MifareClassic_Trailer_AccessConditions;

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
impl MifareClassic_Trailer_AccessConditions_TrailerAc {
    pub fn ac(&self) -> Ref<'_, OptRc<MifareClassic_Trailer_AccessConditions_Ac>> {
        self.ac.borrow()
    }
}
impl MifareClassic_Trailer_AccessConditions_TrailerAc {
    pub fn set_params(&mut self, ac: &OptRc<MifareClassic_Trailer_AccessConditions_Ac>) {
        *self.ac.borrow_mut() = ac.clone();
    }
}
impl MifareClassic_Trailer_AccessConditions_TrailerAc {

    /**
     * key A is required
     */
    pub fn can_read_key_b(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_can_read_key_b.get() {
            return Ok(self.can_read_key_b.borrow());
        }
        self.f_can_read_key_b.set(true);
        *self.can_read_key_b.borrow_mut() = (((*self.ac().inv_shift_val()? as i32) <= (2 as i32))) as bool;
        Ok(self.can_read_key_b.borrow())
    }
    pub fn can_write_access_bits(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_can_write_access_bits.get() {
            return Ok(self.can_write_access_bits.borrow());
        }
        self.f_can_write_access_bits.set(true);
        *self.can_write_access_bits.borrow_mut() = (*self.ac().bits()?[2 as usize].b()?) as bool;
        Ok(self.can_write_access_bits.borrow())
    }
    pub fn can_write_keys(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_can_write_keys.get() {
            return Ok(self.can_write_keys.borrow());
        }
        self.f_can_write_keys.set(true);
        *self.can_write_keys.borrow_mut() = ( ((((modulo(((*self.ac().inv_shift_val()? as i32) + (1 as i32)) as i64, 3 as i64) as i32) != (0 as i32))) && (((*self.ac().inv_shift_val()? as i32) < (6 as i32)))) ) as bool;
        Ok(self.can_write_keys.borrow())
    }
    pub fn key_b_controls_write(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_key_b_controls_write.get() {
            return Ok(self.key_b_controls_write.borrow());
        }
        self.f_key_b_controls_write.set(true);
        *self.key_b_controls_write.borrow_mut() = (!(*self.can_read_key_b()?)) as bool;
        Ok(self.key_b_controls_write.borrow())
    }
}
impl MifareClassic_Trailer_AccessConditions_TrailerAc {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MifareClassic_Trailer_AccessConditions_ValidChunk {
    pub _root: SharedType<MifareClassic>,
    pub _parent: SharedType<MifareClassic_Trailer_AccessConditions>,
    pub _self: SharedType<Self>,
    inv_chunk: RefCell<u8>,
    chunk: RefCell<u8>,
    _io: RefCell<BytesReader>,
    f_valid: Cell<bool>,
    valid: RefCell<bool>,
}
impl KStruct for MifareClassic_Trailer_AccessConditions_ValidChunk {
    type Root = MifareClassic;
    type Parent = MifareClassic_Trailer_AccessConditions;

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
impl MifareClassic_Trailer_AccessConditions_ValidChunk {
    pub fn inv_chunk(&self) -> Ref<'_, u8> {
        self.inv_chunk.borrow()
    }
}
impl MifareClassic_Trailer_AccessConditions_ValidChunk {
    pub fn chunk(&self) -> Ref<'_, u8> {
        self.chunk.borrow()
    }
}
impl MifareClassic_Trailer_AccessConditions_ValidChunk {
    pub fn set_params(&mut self, inv_chunk: u8, chunk: u8) {
        *self.inv_chunk.borrow_mut() = inv_chunk;
        *self.chunk.borrow_mut() = chunk;
    }
}
impl MifareClassic_Trailer_AccessConditions_ValidChunk {
    pub fn valid(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_valid.get() {
            return Ok(self.valid.borrow());
        }
        self.f_valid.set(true);
        *self.valid.borrow_mut() = (((((*self.inv_chunk() as u8) ^ (*self.chunk() as u8)) as i32) == (15 as i32))) as bool;
        Ok(self.valid.borrow())
    }
}
impl MifareClassic_Trailer_AccessConditions_ValidChunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

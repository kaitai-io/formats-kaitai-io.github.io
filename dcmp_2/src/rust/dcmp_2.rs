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
use super::bytes_with_io::BytesWithIo;

/**
 * Compressed resource data in `'dcmp' (2)` format,
 * as stored in compressed resources with header type `9` and decompressor ID `2`.
 * 
 * The `'dcmp' (2)` decompressor resource is included in the System file of System 7.0 and later.
 * This compression format is used for a few compressed resources in System 7.0's files
 * (such as the System file).
 * This decompressor is also included with and used by some other Apple applications,
 * such as ResEdit.
 * (Note: ResEdit includes the `'dcmp' (2)` resource,
 * but none of its resources actually use this decompressor.)
 * 
 * This compression format is based on simple dictionary coding,
 * where each byte in the compressed data expands to two bytes,
 * based on a lookup table
 * (either included in the compressed data or provided by the decompressor).
 * An alternative "tagged" compression format is also supported,
 * which allows using two-byte literals in addition to single-byte table references,
 * at the cost of requiring an extra "tag" byte every 16 output bytes,
 * to differentiate literals and table references.
 * \sa https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/dcmp2.py Source
 */

#[derive(Default, Debug, Clone)]
pub struct Dcmp2 {
    pub _root: SharedType<Dcmp2>,
    pub _parent: SharedType<Dcmp2>,
    pub _self: SharedType<Self>,
    len_decompressed: RefCell<u32>,
    header_parameters_with_io: RefCell<OptRc<BytesWithIo>>,
    custom_lookup_table: RefCell<Vec<Vec<u8>>>,
    data: RefCell<Option<Dcmp2_Data>>,
    last_byte: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    data_raw: RefCell<Vec<u8>>,
    f_default_lookup_table: Cell<bool>,
    default_lookup_table: RefCell<Vec<Vec<u8>>>,
    f_header_parameters: Cell<bool>,
    header_parameters: RefCell<OptRc<Dcmp2_HeaderParameters>>,
    f_is_len_decompressed_odd: Cell<bool>,
    is_len_decompressed_odd: RefCell<bool>,
    f_lookup_table: Cell<bool>,
    lookup_table: RefCell<Vec<Vec<u8>>>,
}
#[derive(Debug, Clone)]
pub enum Dcmp2_Data {
    Dcmp2_TaggedData(OptRc<Dcmp2_TaggedData>),
    Dcmp2_UntaggedData(OptRc<Dcmp2_UntaggedData>),
}
impl From<&Dcmp2_Data> for OptRc<Dcmp2_TaggedData> {
    fn from(v: &Dcmp2_Data) -> Self {
        if let Dcmp2_Data::Dcmp2_TaggedData(x) = v {
            return x.clone();
        }
        panic!("expected Dcmp2_Data::Dcmp2_TaggedData, got {:?}", v)
    }
}
impl From<OptRc<Dcmp2_TaggedData>> for Dcmp2_Data {
    fn from(v: OptRc<Dcmp2_TaggedData>) -> Self {
        Self::Dcmp2_TaggedData(v)
    }
}
impl From<&Dcmp2_Data> for OptRc<Dcmp2_UntaggedData> {
    fn from(v: &Dcmp2_Data) -> Self {
        if let Dcmp2_Data::Dcmp2_UntaggedData(x) = v {
            return x.clone();
        }
        panic!("expected Dcmp2_Data::Dcmp2_UntaggedData, got {:?}", v)
    }
}
impl From<OptRc<Dcmp2_UntaggedData>> for Dcmp2_Data {
    fn from(v: OptRc<Dcmp2_UntaggedData>) -> Self {
        Self::Dcmp2_UntaggedData(v)
    }
}
impl KStruct for Dcmp2 {
    type Root = Dcmp2;
    type Parent = Dcmp2;

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
        if *self_rc.header_parameters()?.flags().has_custom_lookup_table() {
            *self_rc.custom_lookup_table.borrow_mut() = Vec::new();
            let l_custom_lookup_table = *self_rc.header_parameters()?.num_custom_lookup_table_entries()?;
            for _i in 0..l_custom_lookup_table {
                self_rc.custom_lookup_table.borrow_mut().push(_io.read_bytes(2 as usize)?.into());
            }
        }
        {
            let on = self_rc.header_parameters()?.flags().tagged();
            if *on == true {
                *self_rc.data_raw.borrow_mut() = _io.read_bytes(((((_io.size() as i32) - (_io.pos() as i32)) as i32) - (if *self_rc.is_len_decompressed_odd()? { 1 } else { 0 } as i32)) as usize)?.into();
                let data_raw = self_rc.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, Dcmp2_TaggedData>(&_t_data_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.data.borrow_mut() = Some(t);
            }
            else {
                *self_rc.data_raw.borrow_mut() = _io.read_bytes(((((_io.size() as i32) - (_io.pos() as i32)) as i32) - (if *self_rc.is_len_decompressed_odd()? { 1 } else { 0 } as i32)) as usize)?.into();
                let data_raw = self_rc.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, Dcmp2_UntaggedData>(&_t_data_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.data.borrow_mut() = Some(t);
            }
        }
        if *self_rc.is_len_decompressed_odd()? {
            *self_rc.last_byte.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        }
        Ok(())
    }
}
impl Dcmp2 {
    pub fn len_decompressed(&self) -> Ref<'_, u32> {
        self.len_decompressed.borrow()
    }
}
impl Dcmp2 {
    pub fn header_parameters_with_io(&self) -> Ref<'_, OptRc<BytesWithIo>> {
        self.header_parameters_with_io.borrow()
    }
}
impl Dcmp2 {
    pub fn set_params(&mut self, len_decompressed: u32, header_parameters_with_io: &OptRc<BytesWithIo>) {
        *self.len_decompressed.borrow_mut() = len_decompressed;
        *self.header_parameters_with_io.borrow_mut() = header_parameters_with_io.clone();
    }
}
impl Dcmp2 {

    /**
     * The default lookup table,
     * which is used if no custom lookup table is included with the compressed data.
     */
    pub fn default_lookup_table(
        &self
    ) -> KResult<Ref<'_, Vec<Vec<u8>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_default_lookup_table.get() {
            return Ok(self.default_lookup_table.borrow());
        }
        self.f_default_lookup_table.set(true);
        *self.default_lookup_table.borrow_mut() = vec![vec![0x0u8, 0x0u8], vec![0x0u8, 0x8u8], vec![0x4eu8, 0xbau8], vec![0x20u8, 0x6eu8], vec![0x4eu8, 0x75u8], vec![0x0u8, 0xcu8], vec![0x0u8, 0x4u8], vec![0x70u8, 0x0u8], vec![0x0u8, 0x10u8], vec![0x0u8, 0x2u8], vec![0x48u8, 0x6eu8], vec![0xffu8, 0xfcu8], vec![0x60u8, 0x0u8], vec![0x0u8, 0x1u8], vec![0x48u8, 0xe7u8], vec![0x2fu8, 0x2eu8], vec![0x4eu8, 0x56u8], vec![0x0u8, 0x6u8], vec![0x4eu8, 0x5eu8], vec![0x2fu8, 0x0u8], vec![0x61u8, 0x0u8], vec![0xffu8, 0xf8u8], vec![0x2fu8, 0xbu8], vec![0xffu8, 0xffu8], vec![0x0u8, 0x14u8], vec![0x0u8, 0xau8], vec![0x0u8, 0x18u8], vec![0x20u8, 0x5fu8], vec![0x0u8, 0xeu8], vec![0x20u8, 0x50u8], vec![0x3fu8, 0x3cu8], vec![0xffu8, 0xf4u8], vec![0x4cu8, 0xeeu8], vec![0x30u8, 0x2eu8], vec![0x67u8, 0x0u8], vec![0x4cu8, 0xdfu8], vec![0x26u8, 0x6eu8], vec![0x0u8, 0x12u8], vec![0x0u8, 0x1cu8], vec![0x42u8, 0x67u8], vec![0xffu8, 0xf0u8], vec![0x30u8, 0x3cu8], vec![0x2fu8, 0xcu8], vec![0x0u8, 0x3u8], vec![0x4eu8, 0xd0u8], vec![0x0u8, 0x20u8], vec![0x70u8, 0x1u8], vec![0x0u8, 0x16u8], vec![0x2du8, 0x40u8], vec![0x48u8, 0xc0u8], vec![0x20u8, 0x78u8], vec![0x72u8, 0x0u8], vec![0x58u8, 0x8fu8], vec![0x66u8, 0x0u8], vec![0x4fu8, 0xefu8], vec![0x42u8, 0xa7u8], vec![0x67u8, 0x6u8], vec![0xffu8, 0xfau8], vec![0x55u8, 0x8fu8], vec![0x28u8, 0x6eu8], vec![0x3fu8, 0x0u8], vec![0xffu8, 0xfeu8], vec![0x2fu8, 0x3cu8], vec![0x67u8, 0x4u8], vec![0x59u8, 0x8fu8], vec![0x20u8, 0x6bu8], vec![0x0u8, 0x24u8], vec![0x20u8, 0x1fu8], vec![0x41u8, 0xfau8], vec![0x81u8, 0xe1u8], vec![0x66u8, 0x4u8], vec![0x67u8, 0x8u8], vec![0x0u8, 0x1au8], vec![0x4eu8, 0xb9u8], vec![0x50u8, 0x8fu8], vec![0x20u8, 0x2eu8], vec![0x0u8, 0x7u8], vec![0x4eu8, 0xb0u8], vec![0xffu8, 0xf2u8], vec![0x3du8, 0x40u8], vec![0x0u8, 0x1eu8], vec![0x20u8, 0x68u8], vec![0x66u8, 0x6u8], vec![0xffu8, 0xf6u8], vec![0x4eu8, 0xf9u8], vec![0x8u8, 0x0u8], vec![0xcu8, 0x40u8], vec![0x3du8, 0x7cu8], vec![0xffu8, 0xecu8], vec![0x0u8, 0x5u8], vec![0x20u8, 0x3cu8], vec![0xffu8, 0xe8u8], vec![0xdeu8, 0xfcu8], vec![0x4au8, 0x2eu8], vec![0x0u8, 0x30u8], vec![0x0u8, 0x28u8], vec![0x2fu8, 0x8u8], vec![0x20u8, 0xbu8], vec![0x60u8, 0x2u8], vec![0x42u8, 0x6eu8], vec![0x2du8, 0x48u8], vec![0x20u8, 0x53u8], vec![0x20u8, 0x40u8], vec![0x18u8, 0x0u8], vec![0x60u8, 0x4u8], vec![0x41u8, 0xeeu8], vec![0x2fu8, 0x28u8], vec![0x2fu8, 0x1u8], vec![0x67u8, 0xau8], vec![0x48u8, 0x40u8], vec![0x20u8, 0x7u8], vec![0x66u8, 0x8u8], vec![0x1u8, 0x18u8], vec![0x2fu8, 0x7u8], vec![0x30u8, 0x28u8], vec![0x3fu8, 0x2eu8], vec![0x30u8, 0x2bu8], vec![0x22u8, 0x6eu8], vec![0x2fu8, 0x2bu8], vec![0x0u8, 0x2cu8], vec![0x67u8, 0xcu8], vec![0x22u8, 0x5fu8], vec![0x60u8, 0x6u8], vec![0x0u8, 0xffu8], vec![0x30u8, 0x7u8], vec![0xffu8, 0xeeu8], vec![0x53u8, 0x40u8], vec![0x0u8, 0x40u8], vec![0xffu8, 0xe4u8], vec![0x4au8, 0x40u8], vec![0x66u8, 0xau8], vec![0x0u8, 0xfu8], vec![0x4eu8, 0xadu8], vec![0x70u8, 0xffu8], vec![0x22u8, 0xd8u8], vec![0x48u8, 0x6bu8], vec![0x0u8, 0x22u8], vec![0x20u8, 0x4bu8], vec![0x67u8, 0xeu8], vec![0x4au8, 0xaeu8], vec![0x4eu8, 0x90u8], vec![0xffu8, 0xe0u8], vec![0xffu8, 0xc0u8], vec![0x0u8, 0x2au8], vec![0x27u8, 0x40u8], vec![0x67u8, 0x2u8], vec![0x51u8, 0xc8u8], vec![0x2u8, 0xb6u8], vec![0x48u8, 0x7au8], vec![0x22u8, 0x78u8], vec![0xb0u8, 0x6eu8], vec![0xffu8, 0xe6u8], vec![0x0u8, 0x9u8], vec![0x32u8, 0x2eu8], vec![0x3eu8, 0x0u8], vec![0x48u8, 0x41u8], vec![0xffu8, 0xeau8], vec![0x43u8, 0xeeu8], vec![0x4eu8, 0x71u8], vec![0x74u8, 0x0u8], vec![0x2fu8, 0x2cu8], vec![0x20u8, 0x6cu8], vec![0x0u8, 0x3cu8], vec![0x0u8, 0x26u8], vec![0x0u8, 0x50u8], vec![0x18u8, 0x80u8], vec![0x30u8, 0x1fu8], vec![0x22u8, 0x0u8], vec![0x66u8, 0xcu8], vec![0xffu8, 0xdau8], vec![0x0u8, 0x38u8], vec![0x66u8, 0x2u8], vec![0x30u8, 0x2cu8], vec![0x20u8, 0xcu8], vec![0x2du8, 0x6eu8], vec![0x42u8, 0x40u8], vec![0xffu8, 0xe2u8], vec![0xa9u8, 0xf0u8], vec![0xffu8, 0x0u8], vec![0x37u8, 0x7cu8], vec![0xe5u8, 0x80u8], vec![0xffu8, 0xdcu8], vec![0x48u8, 0x68u8], vec![0x59u8, 0x4fu8], vec![0x0u8, 0x34u8], vec![0x3eu8, 0x1fu8], vec![0x60u8, 0x8u8], vec![0x2fu8, 0x6u8], vec![0xffu8, 0xdeu8], vec![0x60u8, 0xau8], vec![0x70u8, 0x2u8], vec![0x0u8, 0x32u8], vec![0xffu8, 0xccu8], vec![0x0u8, 0x80u8], vec![0x22u8, 0x51u8], vec![0x10u8, 0x1fu8], vec![0x31u8, 0x7cu8], vec![0xa0u8, 0x29u8], vec![0xffu8, 0xd8u8], vec![0x52u8, 0x40u8], vec![0x1u8, 0x0u8], vec![0x67u8, 0x10u8], vec![0xa0u8, 0x23u8], vec![0xffu8, 0xceu8], vec![0xffu8, 0xd4u8], vec![0x20u8, 0x6u8], vec![0x48u8, 0x78u8], vec![0x0u8, 0x2eu8], vec![0x50u8, 0x4fu8], vec![0x43u8, 0xfau8], vec![0x67u8, 0x12u8], vec![0x76u8, 0x0u8], vec![0x41u8, 0xe8u8], vec![0x4au8, 0x6eu8], vec![0x20u8, 0xd9u8], vec![0x0u8, 0x5au8], vec![0x7fu8, 0xffu8], vec![0x51u8, 0xcau8], vec![0x0u8, 0x5cu8], vec![0x2eu8, 0x0u8], vec![0x2u8, 0x40u8], vec![0x48u8, 0xc7u8], vec![0x67u8, 0x14u8], vec![0xcu8, 0x80u8], vec![0x2eu8, 0x9fu8], vec![0xffu8, 0xd6u8], vec![0x80u8, 0x0u8], vec![0x10u8, 0x0u8], vec![0x48u8, 0x42u8], vec![0x4au8, 0x6bu8], vec![0xffu8, 0xd2u8], vec![0x0u8, 0x48u8], vec![0x4au8, 0x47u8], vec![0x4eu8, 0xd1u8], vec![0x20u8, 0x6fu8], vec![0x0u8, 0x41u8], vec![0x60u8, 0xcu8], vec![0x2au8, 0x78u8], vec![0x42u8, 0x2eu8], vec![0x32u8, 0x0u8], vec![0x65u8, 0x74u8], vec![0x67u8, 0x16u8], vec![0x0u8, 0x44u8], vec![0x48u8, 0x6du8], vec![0x20u8, 0x8u8], vec![0x48u8, 0x6cu8], vec![0xbu8, 0x7cu8], vec![0x26u8, 0x40u8], vec![0x4u8, 0x0u8], vec![0x0u8, 0x68u8], vec![0x20u8, 0x6du8], vec![0x0u8, 0xdu8], vec![0x2au8, 0x40u8], vec![0x0u8, 0xbu8], vec![0x0u8, 0x3eu8], vec![0x2u8, 0x20u8]].to_vec();
        Ok(self.default_lookup_table.borrow())
    }

    /**
     * The parsed decompressor-specific parameters from the compressed resource header.
     */
    pub fn header_parameters(
        &self
    ) -> KResult<Ref<'_, OptRc<Dcmp2_HeaderParameters>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_header_parameters.get() {
            return Ok(self.header_parameters.borrow());
        }
        let io = Clone::clone(&*self.header_parameters_with_io()._io());
        let _pos = io.pos();
        io.seek(0 as usize)?;
        let t = Self::read_into::<BytesReader, Dcmp2_HeaderParameters>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.header_parameters.borrow_mut() = t;
        io.seek(_pos)?;
        Ok(self.header_parameters.borrow())
    }

    /**
     * Whether the length of the decompressed data is odd.
     * This affects the meaning of the last byte of the compressed data.
     */
    pub fn is_len_decompressed_odd(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_len_decompressed_odd.get() {
            return Ok(self.is_len_decompressed_odd.borrow());
        }
        self.f_is_len_decompressed_odd.set(true);
        *self.is_len_decompressed_odd.borrow_mut() = (((((*self.len_decompressed() as u32) % (2 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.is_len_decompressed_odd.borrow())
    }

    /**
     * The lookup table to be used for this compressed data.
     */
    pub fn lookup_table(
        &self
    ) -> KResult<Ref<'_, Vec<Vec<u8>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_lookup_table.get() {
            return Ok(self.lookup_table.borrow());
        }
        self.f_lookup_table.set(true);
        *self.lookup_table.borrow_mut() = if *self.header_parameters()?.flags().has_custom_lookup_table() { self.custom_lookup_table().clone() } else { self.default_lookup_table()?.clone() }.to_vec();
        Ok(self.lookup_table.borrow())
    }
}

/**
 * The custom lookup table to be used instead of the default lookup table.
 */
impl Dcmp2 {
    pub fn custom_lookup_table(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.custom_lookup_table.borrow()
    }
}

/**
 * The compressed data.
 * The structure of the data varies depending on whether the "tagged" or "untagged" variant of the compression format is used.
 */
impl Dcmp2 {
    pub fn data(&self) -> Ref<'_, Option<Dcmp2_Data>> {
        self.data.borrow()
    }
}

/**
 * The last byte of the decompressed data,
 * stored literally.
 * Only present if the decompressed data has an odd length.
 * 
 * This special case is necessary because the compressed data is otherwise always stored in two-byte groups,
 * either literally or as table references,
 * so otherwise there would be no way to compress odd-length resources using this format.
 */
impl Dcmp2 {
    pub fn last_byte(&self) -> Ref<'_, Vec<u8>> {
        self.last_byte.borrow()
    }
}
impl Dcmp2 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Dcmp2 {
    pub fn data_raw(&self) -> Ref<'_, Vec<u8>> {
        self.data_raw.borrow()
    }
}

/**
 * Decompressor-specific parameters for this compression format,
 * as stored in the compressed resource header.
 */

#[derive(Default, Debug, Clone)]
pub struct Dcmp2_HeaderParameters {
    pub _root: SharedType<Dcmp2>,
    pub _parent: SharedType<Dcmp2>,
    pub _self: SharedType<Self>,
    unknown: RefCell<u16>,
    num_custom_lookup_table_entries_m1: RefCell<u8>,
    flags: RefCell<OptRc<Dcmp2_HeaderParameters_Flags>>,
    _io: RefCell<BytesReader>,
    f_num_custom_lookup_table_entries: Cell<bool>,
    num_custom_lookup_table_entries: RefCell<i32>,
}
impl KStruct for Dcmp2_HeaderParameters {
    type Root = Dcmp2;
    type Parent = Dcmp2;

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
        *self_rc.unknown.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.num_custom_lookup_table_entries_m1.borrow_mut() = _io.read_u1()?.into();
        let t = Self::read_into::<_, Dcmp2_HeaderParameters_Flags>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.flags.borrow_mut() = t;
        Ok(())
    }
}
impl Dcmp2_HeaderParameters {

    /**
     * The number of entries in the custom lookup table.
     * Only used if a custom lookup table is present.
     */
    pub fn num_custom_lookup_table_entries(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_custom_lookup_table_entries.get() {
            return Ok(self.num_custom_lookup_table_entries.borrow());
        }
        self.f_num_custom_lookup_table_entries.set(true);
        if *self.flags().has_custom_lookup_table() {
            *self.num_custom_lookup_table_entries.borrow_mut() = (((*self.num_custom_lookup_table_entries_m1() as u8) + (1 as u8))) as i32;
        }
        Ok(self.num_custom_lookup_table_entries.borrow())
    }
}

/**
 * The meaning of this field is unknown.
 * It does not appear to have any effect on the format of the compressed data or the decompression process.
 * 
 * The value of this field is usually zero and otherwise a small integer (< 10).
 * For `'lpch'` resources,
 * the value is always nonzero,
 * and sometimes larger than usual.
 */
impl Dcmp2_HeaderParameters {
    pub fn unknown(&self) -> Ref<'_, u16> {
        self.unknown.borrow()
    }
}

/**
 * The number of entries in the custom lookup table,
 * minus one.
 * 
 * If the default lookup table is used rather than a custom one,
 * this value is zero.
 */
impl Dcmp2_HeaderParameters {
    pub fn num_custom_lookup_table_entries_m1(&self) -> Ref<'_, u8> {
        self.num_custom_lookup_table_entries_m1.borrow()
    }
}

/**
 * Various flags that affect the format of the compressed data and the decompression process.
 */
impl Dcmp2_HeaderParameters {
    pub fn flags(&self) -> Ref<'_, OptRc<Dcmp2_HeaderParameters_Flags>> {
        self.flags.borrow()
    }
}
impl Dcmp2_HeaderParameters {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Flags for the decompressor,
 * as stored in the decompressor-specific parameters.
 */

#[derive(Default, Debug, Clone)]
pub struct Dcmp2_HeaderParameters_Flags {
    pub _root: SharedType<Dcmp2>,
    pub _parent: SharedType<Dcmp2_HeaderParameters>,
    pub _self: SharedType<Self>,
    reserved: RefCell<u64>,
    tagged: RefCell<bool>,
    has_custom_lookup_table: RefCell<bool>,
    _io: RefCell<BytesReader>,
    f_as_int: Cell<bool>,
    as_int: RefCell<u8>,
}
impl KStruct for Dcmp2_HeaderParameters_Flags {
    type Root = Dcmp2;
    type Parent = Dcmp2_HeaderParameters;

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
        *self_rc.reserved.borrow_mut() = _io.read_bits_int_be(6)?;
        *self_rc.tagged.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.has_custom_lookup_table.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        Ok(())
    }
}
impl Dcmp2_HeaderParameters_Flags {

    /**
     * The flags as a packed integer,
     * as they are stored in the data.
     */
    pub fn as_int(
        &self
    ) -> KResult<Ref<'_, u8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_as_int.get() {
            return Ok(self.as_int.borrow());
        }
        self.f_as_int.set(true);
        let _pos = _io.pos();
        _io.seek(0 as usize)?;
        *self.as_int.borrow_mut() = _io.read_u1()?.into();
        _io.seek(_pos)?;
        Ok(self.as_int.borrow())
    }
}

/**
 * These flags have no known usage or meaning and should always be zero.
 */
impl Dcmp2_HeaderParameters_Flags {
    pub fn reserved(&self) -> Ref<'_, u64> {
        self.reserved.borrow()
    }
}

/**
 * Whether the "tagged" variant of this compression format should be used,
 * rather than the default "untagged" variant.
 */
impl Dcmp2_HeaderParameters_Flags {
    pub fn tagged(&self) -> Ref<'_, bool> {
        self.tagged.borrow()
    }
}

/**
 * Whether a custom lookup table is included before the compressed data,
 * which should be used instead of the default hardcoded lookup table.
 */
impl Dcmp2_HeaderParameters_Flags {
    pub fn has_custom_lookup_table(&self) -> Ref<'_, bool> {
        self.has_custom_lookup_table.borrow()
    }
}
impl Dcmp2_HeaderParameters_Flags {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Compressed data in the "tagged" variant of the format.
 */

#[derive(Default, Debug, Clone)]
pub struct Dcmp2_TaggedData {
    pub _root: SharedType<Dcmp2>,
    pub _parent: SharedType<Dcmp2>,
    pub _self: SharedType<Self>,
    chunks: RefCell<Vec<OptRc<Dcmp2_TaggedData_Chunk>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dcmp2_TaggedData {
    type Root = Dcmp2;
    type Parent = Dcmp2;

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
        *self_rc.chunks.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Dcmp2_TaggedData_Chunk>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.chunks.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Dcmp2_TaggedData {
}

/**
 * The tagged chunks that make up the compressed data.
 */
impl Dcmp2_TaggedData {
    pub fn chunks(&self) -> Ref<'_, Vec<OptRc<Dcmp2_TaggedData_Chunk>>> {
        self.chunks.borrow()
    }
}
impl Dcmp2_TaggedData {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * A single tagged chunk of compressed data.
 * 
 * Each chunk expands to 16 bytes of decompressed data.
 * In compressed form,
 * the chunks have a variable length
 * (between 9 and 17 bytes)
 * depending on the value of the tag byte.
 */

#[derive(Default, Debug, Clone)]
pub struct Dcmp2_TaggedData_Chunk {
    pub _root: SharedType<Dcmp2>,
    pub _parent: SharedType<Dcmp2_TaggedData>,
    pub _self: SharedType<Self>,
    tag: RefCell<Vec<bool>>,
    units: RefCell<Vec<Dcmp2_TaggedData_Chunk_Units>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Dcmp2_TaggedData_Chunk_Units {
    U1(u8),
    Bytes(Vec<u8>),
}
impl From<&Dcmp2_TaggedData_Chunk_Units> for u8 {
    fn from(v: &Dcmp2_TaggedData_Chunk_Units) -> Self {
        if let Dcmp2_TaggedData_Chunk_Units::U1(x) = v {
            return x.clone();
        }
        panic!("expected Dcmp2_TaggedData_Chunk_Units::U1, got {:?}", v)
    }
}
impl From<u8> for Dcmp2_TaggedData_Chunk_Units {
    fn from(v: u8) -> Self {
        Self::U1(v)
    }
}
impl From<&Dcmp2_TaggedData_Chunk_Units> for Vec<u8> {
    fn from(v: &Dcmp2_TaggedData_Chunk_Units) -> Self {
        if let Dcmp2_TaggedData_Chunk_Units::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected Dcmp2_TaggedData_Chunk_Units::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for Dcmp2_TaggedData_Chunk_Units {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl KStruct for Dcmp2_TaggedData_Chunk {
    type Root = Dcmp2;
    type Parent = Dcmp2_TaggedData;

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
        *self_rc.tag.borrow_mut() = Vec::new();
        let l_tag = 8;
        for _i in 0..l_tag {
            self_rc.tag.borrow_mut().push(_io.read_bits_int_be(1)? != 0);
        }
        _io.align_to_byte()?;
        *self_rc.units.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                {
                    let on = self_rc.tag()[_i as usize];
                    if *on == true {
                        self_rc.units.borrow_mut().push(_io.read_u1()?.into());
                        let _t_units = self_rc.units.borrow();
                        let _tmpa = _t_units.last().unwrap();
                    }
                    else {
                        self_rc.units.borrow_mut().push(_io.read_bytes(if self_rc.tag()[_i as usize] { 1 } else { 2 } as usize)?.into());
                        let _t_units = self_rc.units.borrow();
                        let _tmpa = _t_units.last().unwrap();
                    }
                }
                _i += 1;
                let x = !( ((((_i as i32) >= (7 as i32))) || (_io.is_eof())) );
                x
            } {}
        }
        Ok(())
    }
}
impl Dcmp2_TaggedData_Chunk {
}

/**
 * The bits of the tag byte control the format and meaning of the 8 compressed data units that follow the tag byte.
 */
impl Dcmp2_TaggedData_Chunk {
    pub fn tag(&self) -> Ref<'_, Vec<bool>> {
        self.tag.borrow()
    }
}

/**
 * The compressed data units in this chunk.
 * 
 * The format and meaning of each unit is controlled by the bit in the tag byte with the same index.
 * If the bit is 0 (false),
 * the unit is a pair of bytes,
 * which are literally copied to the decompressed data.
 * If the bit is 1 (true),
 * the unit is a reference into the lookup table,
 * an integer which is expanded to two bytes by looking it up in the table.
 */
impl Dcmp2_TaggedData_Chunk {
    pub fn units(&self) -> Ref<'_, Vec<Dcmp2_TaggedData_Chunk_Units>> {
        self.units.borrow()
    }
}
impl Dcmp2_TaggedData_Chunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Compressed data in the "untagged" variant of the format.
 */

#[derive(Default, Debug, Clone)]
pub struct Dcmp2_UntaggedData {
    pub _root: SharedType<Dcmp2>,
    pub _parent: SharedType<Dcmp2>,
    pub _self: SharedType<Self>,
    table_references: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dcmp2_UntaggedData {
    type Root = Dcmp2;
    type Parent = Dcmp2;

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
        *self_rc.table_references.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.table_references.borrow_mut().push(_io.read_u1()?.into());
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Dcmp2_UntaggedData {
}

/**
 * References into the lookup table.
 * Each reference is an integer that is expanded to two bytes by looking it up in the table.
 */
impl Dcmp2_UntaggedData {
    pub fn table_references(&self) -> Ref<'_, Vec<u8>> {
        self.table_references.borrow()
    }
}
impl Dcmp2_UntaggedData {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

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
 * .dbf is a relational database format introduced in DOS database
 * management system dBASE in 1982.
 * 
 * One .dbf file corresponds to one table and contains a series of headers,
 * specification of fields, and a number of fixed-size records.
 * \sa http://www.dbase.com/Knowledgebase/INT/db7_file_fmt.htm Source
 */

#[derive(Default, Debug, Clone)]
pub struct Dbf {
    pub _root: SharedType<Dbf>,
    pub _parent: SharedType<Dbf>,
    pub _self: SharedType<Self>,
    header1: RefCell<OptRc<Dbf_Header1>>,
    header2: RefCell<OptRc<Dbf_Header2>>,
    header_terminator: RefCell<Vec<u8>>,
    records: RefCell<Vec<OptRc<Dbf_Record>>>,
    _io: RefCell<BytesReader>,
    header2_raw: RefCell<Vec<u8>>,
    records_raw: RefCell<Vec<Vec<u8>>>,
}
impl KStruct for Dbf {
    type Root = Dbf;
    type Parent = Dbf;

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
        let t = Self::read_into::<_, Dbf_Header1>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header1.borrow_mut() = t;
        *self_rc.header2_raw.borrow_mut() = _io.read_bytes(((((*self_rc.header1().len_header() as i32) - (12 as i32)) as i32) - (1 as i32)) as usize)?.into();
        let header2_raw = self_rc.header2_raw.borrow();
        let _t_header2_raw_io = BytesReader::from(header2_raw.clone());
        let t = Self::read_into::<BytesReader, Dbf_Header2>(&_t_header2_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header2.borrow_mut() = t;
        *self_rc.header_terminator.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.header_terminator() == vec![0xdu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/2".to_string() }));
        }
        *self_rc.records_raw.borrow_mut() = Vec::new();
        *self_rc.records.borrow_mut() = Vec::new();
        let l_records = *self_rc.header1().num_records();
        for _i in 0..l_records {
            self_rc.records_raw.borrow_mut().push(_io.read_bytes(*self_rc.header1().len_record() as usize)?.into());
            let records_raw = self_rc.records_raw.borrow();
            let io_records_raw = BytesReader::from(records_raw.last().unwrap().clone());
            let t = Self::read_into::<BytesReader, Dbf_Record>(&io_records_raw, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.records.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Dbf {
}
impl Dbf {
    pub fn header1(&self) -> Ref<'_, OptRc<Dbf_Header1>> {
        self.header1.borrow()
    }
}
impl Dbf {
    pub fn header2(&self) -> Ref<'_, OptRc<Dbf_Header2>> {
        self.header2.borrow()
    }
}
impl Dbf {
    pub fn header_terminator(&self) -> Ref<'_, Vec<u8>> {
        self.header_terminator.borrow()
    }
}
impl Dbf {
    pub fn records(&self) -> Ref<'_, Vec<OptRc<Dbf_Record>>> {
        self.records.borrow()
    }
}
impl Dbf {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Dbf {
    pub fn header2_raw(&self) -> Ref<'_, Vec<u8>> {
        self.header2_raw.borrow()
    }
}
impl Dbf {
    pub fn records_raw(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.records_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Dbf_DeleteState {
    False,
    True,
    Unknown(i64),
}

impl TryFrom<i64> for Dbf_DeleteState {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Dbf_DeleteState> {
        match flag {
            32 => Ok(Dbf_DeleteState::False),
            42 => Ok(Dbf_DeleteState::True),
            _ => Ok(Dbf_DeleteState::Unknown(flag)),
        }
    }
}

impl From<&Dbf_DeleteState> for i64 {
    fn from(v: &Dbf_DeleteState) -> Self {
        match *v {
            Dbf_DeleteState::False => 32,
            Dbf_DeleteState::True => 42,
            Dbf_DeleteState::Unknown(v) => v
        }
    }
}

impl Default for Dbf_DeleteState {
    fn default() -> Self { Dbf_DeleteState::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Dbf_Field {
    pub _root: SharedType<Dbf>,
    pub _parent: SharedType<Dbf_Header2>,
    pub _self: SharedType<Self>,
    name: RefCell<String>,
    datatype: RefCell<u8>,
    data_address: RefCell<u32>,
    length: RefCell<u8>,
    decimal_count: RefCell<u8>,
    reserved1: RefCell<Vec<u8>>,
    work_area_id: RefCell<u8>,
    reserved2: RefCell<Vec<u8>>,
    set_fields_flag: RefCell<u8>,
    reserved3: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dbf_Field {
    type Root = Dbf;
    type Parent = Dbf_Header2;

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
        *self_rc.name.borrow_mut() = bytes_to_str(&bytes_terminate(&_io.read_bytes(11 as usize)?.into(), 0, false).into(), "ASCII")?;
        *self_rc.datatype.borrow_mut() = _io.read_u1()?.into();
        *self_rc.data_address.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.length.borrow_mut() = _io.read_u1()?.into();
        *self_rc.decimal_count.borrow_mut() = _io.read_u1()?.into();
        *self_rc.reserved1.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        *self_rc.work_area_id.borrow_mut() = _io.read_u1()?.into();
        *self_rc.reserved2.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        *self_rc.set_fields_flag.borrow_mut() = _io.read_u1()?.into();
        *self_rc.reserved3.borrow_mut() = _io.read_bytes(8 as usize)?.into();
        Ok(())
    }
}
impl Dbf_Field {
}
impl Dbf_Field {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl Dbf_Field {
    pub fn datatype(&self) -> Ref<'_, u8> {
        self.datatype.borrow()
    }
}
impl Dbf_Field {
    pub fn data_address(&self) -> Ref<'_, u32> {
        self.data_address.borrow()
    }
}
impl Dbf_Field {
    pub fn length(&self) -> Ref<'_, u8> {
        self.length.borrow()
    }
}
impl Dbf_Field {
    pub fn decimal_count(&self) -> Ref<'_, u8> {
        self.decimal_count.borrow()
    }
}
impl Dbf_Field {
    pub fn reserved1(&self) -> Ref<'_, Vec<u8>> {
        self.reserved1.borrow()
    }
}
impl Dbf_Field {
    pub fn work_area_id(&self) -> Ref<'_, u8> {
        self.work_area_id.borrow()
    }
}
impl Dbf_Field {
    pub fn reserved2(&self) -> Ref<'_, Vec<u8>> {
        self.reserved2.borrow()
    }
}
impl Dbf_Field {
    pub fn set_fields_flag(&self) -> Ref<'_, u8> {
        self.set_fields_flag.borrow()
    }
}
impl Dbf_Field {
    pub fn reserved3(&self) -> Ref<'_, Vec<u8>> {
        self.reserved3.borrow()
    }
}
impl Dbf_Field {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa http://www.dbase.com/Knowledgebase/INT/db7_file_fmt.htm - section 1.1
 */

#[derive(Default, Debug, Clone)]
pub struct Dbf_Header1 {
    pub _root: SharedType<Dbf>,
    pub _parent: SharedType<Dbf>,
    pub _self: SharedType<Self>,
    version: RefCell<u8>,
    last_update_y: RefCell<u8>,
    last_update_m: RefCell<u8>,
    last_update_d: RefCell<u8>,
    num_records: RefCell<u32>,
    len_header: RefCell<u16>,
    len_record: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_dbase_level: Cell<bool>,
    dbase_level: RefCell<i32>,
}
impl KStruct for Dbf_Header1 {
    type Root = Dbf;
    type Parent = Dbf;

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
        *self_rc.version.borrow_mut() = _io.read_u1()?.into();
        *self_rc.last_update_y.borrow_mut() = _io.read_u1()?.into();
        *self_rc.last_update_m.borrow_mut() = _io.read_u1()?.into();
        *self_rc.last_update_d.borrow_mut() = _io.read_u1()?.into();
        *self_rc.num_records.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len_header.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.len_record.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl Dbf_Header1 {
    pub fn dbase_level(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_dbase_level.get() {
            return Ok(self.dbase_level.borrow());
        }
        self.f_dbase_level.set(true);
        *self.dbase_level.borrow_mut() = (((*self.version() as u8) & (7 as u8))) as i32;
        Ok(self.dbase_level.borrow())
    }
}
impl Dbf_Header1 {
    pub fn version(&self) -> Ref<'_, u8> {
        self.version.borrow()
    }
}
impl Dbf_Header1 {
    pub fn last_update_y(&self) -> Ref<'_, u8> {
        self.last_update_y.borrow()
    }
}
impl Dbf_Header1 {
    pub fn last_update_m(&self) -> Ref<'_, u8> {
        self.last_update_m.borrow()
    }
}
impl Dbf_Header1 {
    pub fn last_update_d(&self) -> Ref<'_, u8> {
        self.last_update_d.borrow()
    }
}
impl Dbf_Header1 {
    pub fn num_records(&self) -> Ref<'_, u32> {
        self.num_records.borrow()
    }
}
impl Dbf_Header1 {
    pub fn len_header(&self) -> Ref<'_, u16> {
        self.len_header.borrow()
    }
}
impl Dbf_Header1 {
    pub fn len_record(&self) -> Ref<'_, u16> {
        self.len_record.borrow()
    }
}
impl Dbf_Header1 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dbf_Header2 {
    pub _root: SharedType<Dbf>,
    pub _parent: SharedType<Dbf>,
    pub _self: SharedType<Self>,
    header_dbase_3: RefCell<OptRc<Dbf_HeaderDbase3>>,
    header_dbase_7: RefCell<OptRc<Dbf_HeaderDbase7>>,
    fields: RefCell<Vec<OptRc<Dbf_Field>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dbf_Header2 {
    type Root = Dbf;
    type Parent = Dbf;

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
        if ((*_r.header1().dbase_level()? as i32) == (3 as i32)) {
            let t = Self::read_into::<_, Dbf_HeaderDbase3>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.header_dbase_3.borrow_mut() = t;
        }
        if ((*_r.header1().dbase_level()? as i32) == (7 as i32)) {
            let t = Self::read_into::<_, Dbf_HeaderDbase7>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.header_dbase_7.borrow_mut() = t;
        }
        *self_rc.fields.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Dbf_Field>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.fields.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Dbf_Header2 {
}
impl Dbf_Header2 {
    pub fn header_dbase_3(&self) -> Ref<'_, OptRc<Dbf_HeaderDbase3>> {
        self.header_dbase_3.borrow()
    }
}
impl Dbf_Header2 {
    pub fn header_dbase_7(&self) -> Ref<'_, OptRc<Dbf_HeaderDbase7>> {
        self.header_dbase_7.borrow()
    }
}
impl Dbf_Header2 {
    pub fn fields(&self) -> Ref<'_, Vec<OptRc<Dbf_Field>>> {
        self.fields.borrow()
    }
}
impl Dbf_Header2 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dbf_HeaderDbase3 {
    pub _root: SharedType<Dbf>,
    pub _parent: SharedType<Dbf_Header2>,
    pub _self: SharedType<Self>,
    reserved1: RefCell<Vec<u8>>,
    reserved2: RefCell<Vec<u8>>,
    reserved3: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dbf_HeaderDbase3 {
    type Root = Dbf;
    type Parent = Dbf_Header2;

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
        *self_rc.reserved1.borrow_mut() = _io.read_bytes(3 as usize)?.into();
        *self_rc.reserved2.borrow_mut() = _io.read_bytes(13 as usize)?.into();
        *self_rc.reserved3.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        Ok(())
    }
}
impl Dbf_HeaderDbase3 {
}
impl Dbf_HeaderDbase3 {
    pub fn reserved1(&self) -> Ref<'_, Vec<u8>> {
        self.reserved1.borrow()
    }
}
impl Dbf_HeaderDbase3 {
    pub fn reserved2(&self) -> Ref<'_, Vec<u8>> {
        self.reserved2.borrow()
    }
}
impl Dbf_HeaderDbase3 {
    pub fn reserved3(&self) -> Ref<'_, Vec<u8>> {
        self.reserved3.borrow()
    }
}
impl Dbf_HeaderDbase3 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dbf_HeaderDbase7 {
    pub _root: SharedType<Dbf>,
    pub _parent: SharedType<Dbf_Header2>,
    pub _self: SharedType<Self>,
    reserved1: RefCell<Vec<u8>>,
    has_incomplete_transaction: RefCell<u8>,
    dbase_iv_encryption: RefCell<u8>,
    reserved2: RefCell<Vec<u8>>,
    production_mdx: RefCell<u8>,
    language_driver_id: RefCell<u8>,
    reserved3: RefCell<Vec<u8>>,
    language_driver_name: RefCell<Vec<u8>>,
    reserved4: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dbf_HeaderDbase7 {
    type Root = Dbf;
    type Parent = Dbf_Header2;

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
        *self_rc.reserved1.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.reserved1() == vec![0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header_dbase_7/seq/0".to_string() }));
        }
        *self_rc.has_incomplete_transaction.borrow_mut() = _io.read_u1()?.into();
        *self_rc.dbase_iv_encryption.borrow_mut() = _io.read_u1()?.into();
        *self_rc.reserved2.borrow_mut() = _io.read_bytes(12 as usize)?.into();
        *self_rc.production_mdx.borrow_mut() = _io.read_u1()?.into();
        *self_rc.language_driver_id.borrow_mut() = _io.read_u1()?.into();
        *self_rc.reserved3.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.reserved3() == vec![0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header_dbase_7/seq/6".to_string() }));
        }
        *self_rc.language_driver_name.borrow_mut() = _io.read_bytes(32 as usize)?.into();
        *self_rc.reserved4.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        Ok(())
    }
}
impl Dbf_HeaderDbase7 {
}
impl Dbf_HeaderDbase7 {
    pub fn reserved1(&self) -> Ref<'_, Vec<u8>> {
        self.reserved1.borrow()
    }
}
impl Dbf_HeaderDbase7 {
    pub fn has_incomplete_transaction(&self) -> Ref<'_, u8> {
        self.has_incomplete_transaction.borrow()
    }
}
impl Dbf_HeaderDbase7 {
    pub fn dbase_iv_encryption(&self) -> Ref<'_, u8> {
        self.dbase_iv_encryption.borrow()
    }
}
impl Dbf_HeaderDbase7 {
    pub fn reserved2(&self) -> Ref<'_, Vec<u8>> {
        self.reserved2.borrow()
    }
}
impl Dbf_HeaderDbase7 {
    pub fn production_mdx(&self) -> Ref<'_, u8> {
        self.production_mdx.borrow()
    }
}
impl Dbf_HeaderDbase7 {
    pub fn language_driver_id(&self) -> Ref<'_, u8> {
        self.language_driver_id.borrow()
    }
}
impl Dbf_HeaderDbase7 {
    pub fn reserved3(&self) -> Ref<'_, Vec<u8>> {
        self.reserved3.borrow()
    }
}
impl Dbf_HeaderDbase7 {
    pub fn language_driver_name(&self) -> Ref<'_, Vec<u8>> {
        self.language_driver_name.borrow()
    }
}
impl Dbf_HeaderDbase7 {
    pub fn reserved4(&self) -> Ref<'_, Vec<u8>> {
        self.reserved4.borrow()
    }
}
impl Dbf_HeaderDbase7 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dbf_Record {
    pub _root: SharedType<Dbf>,
    pub _parent: SharedType<Dbf>,
    pub _self: SharedType<Self>,
    deleted: RefCell<Dbf_DeleteState>,
    record_fields: RefCell<Vec<Vec<u8>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dbf_Record {
    type Root = Dbf;
    type Parent = Dbf;

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
        *self_rc.deleted.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.record_fields.borrow_mut() = Vec::new();
        let l_record_fields = _r.header2().fields().len();
        for _i in 0..l_record_fields {
            self_rc.record_fields.borrow_mut().push(_io.read_bytes(*_r.header2().fields()[_i as usize].length() as usize)?.into());
        }
        Ok(())
    }
}
impl Dbf_Record {
}
impl Dbf_Record {
    pub fn deleted(&self) -> Ref<'_, Dbf_DeleteState> {
        self.deleted.borrow()
    }
}
impl Dbf_Record {
    pub fn record_fields(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.record_fields.borrow()
    }
}
impl Dbf_Record {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

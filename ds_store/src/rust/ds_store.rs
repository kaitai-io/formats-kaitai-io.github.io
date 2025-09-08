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
 * Apple macOS '.DS_Store' file format.
 * \sa https://en.wikipedia.org/wiki/.DS_Store Source
 * \sa https://metacpan.org/dist/Mac-Finder-DSStore/view/DSStoreFormat.pod Source
 * \sa https://0day.work/parsing-the-ds_store-file-format/ Source
 */

#[derive(Default, Debug, Clone)]
pub struct DsStore {
    pub _root: SharedType<DsStore>,
    pub _parent: SharedType<DsStore>,
    pub _self: SharedType<Self>,
    alignment_header: RefCell<Vec<u8>>,
    buddy_allocator_header: RefCell<OptRc<DsStore_BuddyAllocatorHeader>>,
    _io: RefCell<BytesReader>,
    buddy_allocator_body_raw: RefCell<Vec<u8>>,
    f_block_address_mask: Cell<bool>,
    block_address_mask: RefCell<i8>,
    f_buddy_allocator_body: Cell<bool>,
    buddy_allocator_body: RefCell<OptRc<DsStore_BuddyAllocatorBody>>,
}
impl KStruct for DsStore {
    type Root = DsStore;
    type Parent = DsStore;

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
        *self_rc.alignment_header.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.alignment_header() == vec![0x0u8, 0x0u8, 0x0u8, 0x1u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        let t = Self::read_into::<_, DsStore_BuddyAllocatorHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.buddy_allocator_header.borrow_mut() = t;
        Ok(())
    }
}
impl DsStore {

    /**
     * Bitmask used to calculate the position and the size of each block
     * of the B-tree from the block addresses.
     */
    pub fn block_address_mask(
        &self
    ) -> KResult<Ref<'_, i8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_block_address_mask.get() {
            return Ok(self.block_address_mask.borrow());
        }
        self.f_block_address_mask.set(true);
        *self.block_address_mask.borrow_mut() = (31) as i8;
        Ok(self.block_address_mask.borrow())
    }
    pub fn buddy_allocator_body(
        &self
    ) -> KResult<Ref<'_, OptRc<DsStore_BuddyAllocatorBody>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_buddy_allocator_body.get() {
            return Ok(self.buddy_allocator_body.borrow());
        }
        let _pos = _io.pos();
        _io.seek(((*self.buddy_allocator_header().ofs_bookkeeping_info_block() as u32) + (4 as u32)) as usize)?;
        *self.buddy_allocator_body_raw.borrow_mut() = _io.read_bytes(*self.buddy_allocator_header().len_bookkeeping_info_block() as usize)?.into();
        let buddy_allocator_body_raw = self.buddy_allocator_body_raw.borrow();
        let _t_buddy_allocator_body_raw_io = BytesReader::from(buddy_allocator_body_raw.clone());
        let t = Self::read_into::<BytesReader, DsStore_BuddyAllocatorBody>(&_t_buddy_allocator_body_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.buddy_allocator_body.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.buddy_allocator_body.borrow())
    }
}
impl DsStore {
    pub fn alignment_header(&self) -> Ref<'_, Vec<u8>> {
        self.alignment_header.borrow()
    }
}
impl DsStore {
    pub fn buddy_allocator_header(&self) -> Ref<'_, OptRc<DsStore_BuddyAllocatorHeader>> {
        self.buddy_allocator_header.borrow()
    }
}
impl DsStore {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl DsStore {
    pub fn buddy_allocator_body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.buddy_allocator_body_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DsStore_Block {
    pub _root: SharedType<DsStore>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    mode: RefCell<u32>,
    counter: RefCell<u32>,
    data: RefCell<Vec<OptRc<DsStore_Block_BlockData>>>,
    _io: RefCell<BytesReader>,
    f_rightmost_block: Cell<bool>,
    rightmost_block: RefCell<OptRc<DsStore_Block>>,
}
impl KStruct for DsStore_Block {
    type Root = DsStore;
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
        *self_rc.mode.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.counter.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.data.borrow_mut() = Vec::new();
        let l_data = *self_rc.counter();
        for _i in 0..l_data {
            let f = |t : &mut DsStore_Block_BlockData| Ok(t.set_params((*self_rc.mode()).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, DsStore_Block_BlockData>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            self_rc.data.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl DsStore_Block {

    /**
     * Rightmost child block pointer.
     */
    pub fn rightmost_block(
        &self
    ) -> KResult<Ref<'_, OptRc<DsStore_Block>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_rightmost_block.get() {
            return Ok(self.rightmost_block.borrow());
        }
        if ((*self.mode() as u32) > (0 as u32)) {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(*_r.buddy_allocator_body()?.block_addresses()[*self.mode() as usize].offset()? as usize)?;
            let t = Self::read_into::<BytesReader, DsStore_Block>(&io, Some(self._root.clone()), None)?.into();
            *self.rightmost_block.borrow_mut() = t;
            io.seek(_pos)?;
        }
        Ok(self.rightmost_block.borrow())
    }
}

/**
 * If mode is 0, this is a leaf node, otherwise it is an internal node.
 */
impl DsStore_Block {
    pub fn mode(&self) -> Ref<'_, u32> {
        self.mode.borrow()
    }
}

/**
 * Number of records or number of block id + record pairs.
 */
impl DsStore_Block {
    pub fn counter(&self) -> Ref<'_, u32> {
        self.counter.borrow()
    }
}
impl DsStore_Block {
    pub fn data(&self) -> Ref<'_, Vec<OptRc<DsStore_Block_BlockData>>> {
        self.data.borrow()
    }
}
impl DsStore_Block {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DsStore_Block_BlockData {
    pub _root: SharedType<DsStore>,
    pub _parent: SharedType<DsStore_Block>,
    pub _self: SharedType<Self>,
    mode: RefCell<u32>,
    block_id: RefCell<u32>,
    record: RefCell<OptRc<DsStore_Block_BlockData_Record>>,
    _io: RefCell<BytesReader>,
    f_block: Cell<bool>,
    block: RefCell<OptRc<DsStore_Block>>,
}
impl KStruct for DsStore_Block_BlockData {
    type Root = DsStore;
    type Parent = DsStore_Block;

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
        if ((*self_rc.mode() as u32) > (0 as u32)) {
            *self_rc.block_id.borrow_mut() = _io.read_u4be()?.into();
        }
        let t = Self::read_into::<_, DsStore_Block_BlockData_Record>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.record.borrow_mut() = t;
        Ok(())
    }
}
impl DsStore_Block_BlockData {
    pub fn mode(&self) -> Ref<'_, u32> {
        self.mode.borrow()
    }
}
impl DsStore_Block_BlockData {
    pub fn set_params(&mut self, mode: u32) {
        *self.mode.borrow_mut() = mode;
    }
}
impl DsStore_Block_BlockData {
    pub fn block(
        &self
    ) -> KResult<Ref<'_, OptRc<DsStore_Block>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_block.get() {
            return Ok(self.block.borrow());
        }
        if ((*self.mode() as u32) > (0 as u32)) {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(*_r.buddy_allocator_body()?.block_addresses()[(*self.block_id() as u32) as usize].offset()? as usize)?;
            let t = Self::read_into::<BytesReader, DsStore_Block>(&io, Some(self._root.clone()), None)?.into();
            *self.block.borrow_mut() = t;
            io.seek(_pos)?;
        }
        Ok(self.block.borrow())
    }
}
impl DsStore_Block_BlockData {
    pub fn block_id(&self) -> Ref<'_, u32> {
        self.block_id.borrow()
    }
}
impl DsStore_Block_BlockData {
    pub fn record(&self) -> Ref<'_, OptRc<DsStore_Block_BlockData_Record>> {
        self.record.borrow()
    }
}
impl DsStore_Block_BlockData {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DsStore_Block_BlockData_Record {
    pub _root: SharedType<DsStore>,
    pub _parent: SharedType<DsStore_Block_BlockData>,
    pub _self: SharedType<Self>,
    filename: RefCell<OptRc<DsStore_Block_BlockData_Record_Ustr>>,
    structure_type: RefCell<OptRc<DsStore_Block_BlockData_Record_FourCharCode>>,
    data_type: RefCell<String>,
    value: RefCell<Option<DsStore_Block_BlockData_Record_Value>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum DsStore_Block_BlockData_Record_Value {
    U8(u64),
    DsStore_Block_BlockData_Record_FourCharCode(OptRc<DsStore_Block_BlockData_Record_FourCharCode>),
    U4(u32),
    U1(u8),
    DsStore_Block_BlockData_Record_RecordBlob(OptRc<DsStore_Block_BlockData_Record_RecordBlob>),
    DsStore_Block_BlockData_Record_Ustr(OptRc<DsStore_Block_BlockData_Record_Ustr>),
}
impl From<&DsStore_Block_BlockData_Record_Value> for u64 {
    fn from(v: &DsStore_Block_BlockData_Record_Value) -> Self {
        if let DsStore_Block_BlockData_Record_Value::U8(x) = v {
            return x.clone();
        }
        panic!("expected DsStore_Block_BlockData_Record_Value::U8, got {:?}", v)
    }
}
impl From<u64> for DsStore_Block_BlockData_Record_Value {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&DsStore_Block_BlockData_Record_Value> for OptRc<DsStore_Block_BlockData_Record_FourCharCode> {
    fn from(v: &DsStore_Block_BlockData_Record_Value) -> Self {
        if let DsStore_Block_BlockData_Record_Value::DsStore_Block_BlockData_Record_FourCharCode(x) = v {
            return x.clone();
        }
        panic!("expected DsStore_Block_BlockData_Record_Value::DsStore_Block_BlockData_Record_FourCharCode, got {:?}", v)
    }
}
impl From<OptRc<DsStore_Block_BlockData_Record_FourCharCode>> for DsStore_Block_BlockData_Record_Value {
    fn from(v: OptRc<DsStore_Block_BlockData_Record_FourCharCode>) -> Self {
        Self::DsStore_Block_BlockData_Record_FourCharCode(v)
    }
}
impl From<&DsStore_Block_BlockData_Record_Value> for u32 {
    fn from(v: &DsStore_Block_BlockData_Record_Value) -> Self {
        if let DsStore_Block_BlockData_Record_Value::U4(x) = v {
            return x.clone();
        }
        panic!("expected DsStore_Block_BlockData_Record_Value::U4, got {:?}", v)
    }
}
impl From<u32> for DsStore_Block_BlockData_Record_Value {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&DsStore_Block_BlockData_Record_Value> for u8 {
    fn from(v: &DsStore_Block_BlockData_Record_Value) -> Self {
        if let DsStore_Block_BlockData_Record_Value::U1(x) = v {
            return x.clone();
        }
        panic!("expected DsStore_Block_BlockData_Record_Value::U1, got {:?}", v)
    }
}
impl From<u8> for DsStore_Block_BlockData_Record_Value {
    fn from(v: u8) -> Self {
        Self::U1(v)
    }
}
impl From<&DsStore_Block_BlockData_Record_Value> for OptRc<DsStore_Block_BlockData_Record_RecordBlob> {
    fn from(v: &DsStore_Block_BlockData_Record_Value) -> Self {
        if let DsStore_Block_BlockData_Record_Value::DsStore_Block_BlockData_Record_RecordBlob(x) = v {
            return x.clone();
        }
        panic!("expected DsStore_Block_BlockData_Record_Value::DsStore_Block_BlockData_Record_RecordBlob, got {:?}", v)
    }
}
impl From<OptRc<DsStore_Block_BlockData_Record_RecordBlob>> for DsStore_Block_BlockData_Record_Value {
    fn from(v: OptRc<DsStore_Block_BlockData_Record_RecordBlob>) -> Self {
        Self::DsStore_Block_BlockData_Record_RecordBlob(v)
    }
}
impl From<&DsStore_Block_BlockData_Record_Value> for OptRc<DsStore_Block_BlockData_Record_Ustr> {
    fn from(v: &DsStore_Block_BlockData_Record_Value) -> Self {
        if let DsStore_Block_BlockData_Record_Value::DsStore_Block_BlockData_Record_Ustr(x) = v {
            return x.clone();
        }
        panic!("expected DsStore_Block_BlockData_Record_Value::DsStore_Block_BlockData_Record_Ustr, got {:?}", v)
    }
}
impl From<OptRc<DsStore_Block_BlockData_Record_Ustr>> for DsStore_Block_BlockData_Record_Value {
    fn from(v: OptRc<DsStore_Block_BlockData_Record_Ustr>) -> Self {
        Self::DsStore_Block_BlockData_Record_Ustr(v)
    }
}
impl KStruct for DsStore_Block_BlockData_Record {
    type Root = DsStore;
    type Parent = DsStore_Block_BlockData;

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
        let t = Self::read_into::<_, DsStore_Block_BlockData_Record_Ustr>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.filename.borrow_mut() = t;
        let t = Self::read_into::<_, DsStore_Block_BlockData_Record_FourCharCode>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.structure_type.borrow_mut() = t;
        *self_rc.data_type.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "UTF-8")?;
        {
            let on = self_rc.data_type();
            if *on == "blob" {
                let t = Self::read_into::<_, DsStore_Block_BlockData_Record_RecordBlob>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            else if *on == "bool" {
                *self_rc.value.borrow_mut() = Some(_io.read_u1()?.into());
            }
            else if *on == "comp" {
                *self_rc.value.borrow_mut() = Some(_io.read_u8be()?.into());
            }
            else if *on == "dutc" {
                *self_rc.value.borrow_mut() = Some(_io.read_u8be()?.into());
            }
            else if *on == "long" {
                *self_rc.value.borrow_mut() = Some(_io.read_u4be()?.into());
            }
            else if *on == "shor" {
                *self_rc.value.borrow_mut() = Some(_io.read_u4be()?.into());
            }
            else if *on == "type" {
                let t = Self::read_into::<_, DsStore_Block_BlockData_Record_FourCharCode>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            else if *on == "ustr" {
                let t = Self::read_into::<_, DsStore_Block_BlockData_Record_Ustr>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
        }
        Ok(())
    }
}
impl DsStore_Block_BlockData_Record {
}
impl DsStore_Block_BlockData_Record {
    pub fn filename(&self) -> Ref<'_, OptRc<DsStore_Block_BlockData_Record_Ustr>> {
        self.filename.borrow()
    }
}

/**
 * Description of the entry's property.
 */
impl DsStore_Block_BlockData_Record {
    pub fn structure_type(&self) -> Ref<'_, OptRc<DsStore_Block_BlockData_Record_FourCharCode>> {
        self.structure_type.borrow()
    }
}

/**
 * Data type of the value.
 */
impl DsStore_Block_BlockData_Record {
    pub fn data_type(&self) -> Ref<'_, String> {
        self.data_type.borrow()
    }
}
impl DsStore_Block_BlockData_Record {
    pub fn value(&self) -> Ref<'_, Option<DsStore_Block_BlockData_Record_Value>> {
        self.value.borrow()
    }
}
impl DsStore_Block_BlockData_Record {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DsStore_Block_BlockData_Record_FourCharCode {
    pub _root: SharedType<DsStore>,
    pub _parent: SharedType<DsStore_Block_BlockData_Record>,
    pub _self: SharedType<Self>,
    value: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for DsStore_Block_BlockData_Record_FourCharCode {
    type Root = DsStore;
    type Parent = DsStore_Block_BlockData_Record;

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
        *self_rc.value.borrow_mut() = Some(bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "UTF-8")?);
        Ok(())
    }
}
impl DsStore_Block_BlockData_Record_FourCharCode {
}
impl DsStore_Block_BlockData_Record_FourCharCode {
    pub fn value(&self) -> Ref<'_, String> {
        self.value.borrow()
    }
}
impl DsStore_Block_BlockData_Record_FourCharCode {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DsStore_Block_BlockData_Record_RecordBlob {
    pub _root: SharedType<DsStore>,
    pub _parent: SharedType<DsStore_Block_BlockData_Record>,
    pub _self: SharedType<Self>,
    length: RefCell<u32>,
    value: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for DsStore_Block_BlockData_Record_RecordBlob {
    type Root = DsStore;
    type Parent = DsStore_Block_BlockData_Record;

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
        *self_rc.length.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.value.borrow_mut() = _io.read_bytes(*self_rc.length() as usize)?.into();
        Ok(())
    }
}
impl DsStore_Block_BlockData_Record_RecordBlob {
}
impl DsStore_Block_BlockData_Record_RecordBlob {
    pub fn length(&self) -> Ref<'_, u32> {
        self.length.borrow()
    }
}
impl DsStore_Block_BlockData_Record_RecordBlob {
    pub fn value(&self) -> Ref<'_, Vec<u8>> {
        self.value.borrow()
    }
}
impl DsStore_Block_BlockData_Record_RecordBlob {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DsStore_Block_BlockData_Record_Ustr {
    pub _root: SharedType<DsStore>,
    pub _parent: SharedType<DsStore_Block_BlockData_Record>,
    pub _self: SharedType<Self>,
    length: RefCell<u32>,
    value: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for DsStore_Block_BlockData_Record_Ustr {
    type Root = DsStore;
    type Parent = DsStore_Block_BlockData_Record;

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
        *self_rc.length.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.value.borrow_mut() = bytes_to_str(&_io.read_bytes(((2 as u32) * (*self_rc.length() as u32)) as usize)?.into(), "UTF-16BE")?;
        Ok(())
    }
}
impl DsStore_Block_BlockData_Record_Ustr {
}
impl DsStore_Block_BlockData_Record_Ustr {
    pub fn length(&self) -> Ref<'_, u32> {
        self.length.borrow()
    }
}
impl DsStore_Block_BlockData_Record_Ustr {
    pub fn value(&self) -> Ref<'_, String> {
        self.value.borrow()
    }
}
impl DsStore_Block_BlockData_Record_Ustr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DsStore_BuddyAllocatorBody {
    pub _root: SharedType<DsStore>,
    pub _parent: SharedType<DsStore>,
    pub _self: SharedType<Self>,
    num_blocks: RefCell<u32>,
    unnamed1: RefCell<Vec<u8>>,
    block_addresses: RefCell<Vec<OptRc<DsStore_BuddyAllocatorBody_BlockDescriptor>>>,
    num_directories: RefCell<u32>,
    directory_entries: RefCell<Vec<OptRc<DsStore_BuddyAllocatorBody_DirectoryEntry>>>,
    free_lists: RefCell<Vec<OptRc<DsStore_BuddyAllocatorBody_FreeList>>>,
    _io: RefCell<BytesReader>,
    f_directories: Cell<bool>,
    directories: RefCell<Vec<OptRc<DsStore_MasterBlockRef>>>,
    f_num_block_addresses: Cell<bool>,
    num_block_addresses: RefCell<i32>,
    f_num_free_lists: Cell<bool>,
    num_free_lists: RefCell<i8>,
}
impl KStruct for DsStore_BuddyAllocatorBody {
    type Root = DsStore;
    type Parent = DsStore;

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
        *self_rc.num_blocks.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.unnamed1.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        *self_rc.block_addresses.borrow_mut() = Vec::new();
        let l_block_addresses = *self_rc.num_block_addresses()?;
        for _i in 0..l_block_addresses {
            let t = Self::read_into::<_, DsStore_BuddyAllocatorBody_BlockDescriptor>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.block_addresses.borrow_mut().push(t);
        }
        *self_rc.num_directories.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.directory_entries.borrow_mut() = Vec::new();
        let l_directory_entries = *self_rc.num_directories();
        for _i in 0..l_directory_entries {
            let t = Self::read_into::<_, DsStore_BuddyAllocatorBody_DirectoryEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.directory_entries.borrow_mut().push(t);
        }
        *self_rc.free_lists.borrow_mut() = Vec::new();
        let l_free_lists = *self_rc.num_free_lists()?;
        for _i in 0..l_free_lists {
            let t = Self::read_into::<_, DsStore_BuddyAllocatorBody_FreeList>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.free_lists.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl DsStore_BuddyAllocatorBody {

    /**
     * Master blocks of the different B-trees.
     */
    pub fn directories(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<DsStore_MasterBlockRef>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_directories.get() {
            return Ok(self.directories.borrow());
        }
        self.f_directories.set(true);
        let io = Clone::clone(&*_r._io());
        *self.directories.borrow_mut() = Vec::new();
        let l_directories = *self.num_directories();
        for _i in 0..l_directories {
            let f = |t : &mut DsStore_MasterBlockRef| Ok(t.set_params((_i).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<BytesReader, DsStore_MasterBlockRef>(&io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
            self.directories.borrow_mut().push(t);
        }
        Ok(self.directories.borrow())
    }
    pub fn num_block_addresses(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_block_addresses.get() {
            return Ok(self.num_block_addresses.borrow());
        }
        self.f_num_block_addresses.set(true);
        *self.num_block_addresses.borrow_mut() = (256) as i32;
        Ok(self.num_block_addresses.borrow())
    }
    pub fn num_free_lists(
        &self
    ) -> KResult<Ref<'_, i8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_free_lists.get() {
            return Ok(self.num_free_lists.borrow());
        }
        self.f_num_free_lists.set(true);
        *self.num_free_lists.borrow_mut() = (32) as i8;
        Ok(self.num_free_lists.borrow())
    }
}

/**
 * Number of blocks in the allocated-blocks list.
 */
impl DsStore_BuddyAllocatorBody {
    pub fn num_blocks(&self) -> Ref<'_, u32> {
        self.num_blocks.borrow()
    }
}

/**
 * Unknown field which appears to always be 0.
 */
impl DsStore_BuddyAllocatorBody {
    pub fn unnamed1(&self) -> Ref<'_, Vec<u8>> {
        self.unnamed1.borrow()
    }
}

/**
 * Addresses of the different blocks.
 */
impl DsStore_BuddyAllocatorBody {
    pub fn block_addresses(&self) -> Ref<'_, Vec<OptRc<DsStore_BuddyAllocatorBody_BlockDescriptor>>> {
        self.block_addresses.borrow()
    }
}

/**
 * Indicates the number of directory entries.
 */
impl DsStore_BuddyAllocatorBody {
    pub fn num_directories(&self) -> Ref<'_, u32> {
        self.num_directories.borrow()
    }
}

/**
 * Each directory is an independent B-tree.
 */
impl DsStore_BuddyAllocatorBody {
    pub fn directory_entries(&self) -> Ref<'_, Vec<OptRc<DsStore_BuddyAllocatorBody_DirectoryEntry>>> {
        self.directory_entries.borrow()
    }
}
impl DsStore_BuddyAllocatorBody {
    pub fn free_lists(&self) -> Ref<'_, Vec<OptRc<DsStore_BuddyAllocatorBody_FreeList>>> {
        self.free_lists.borrow()
    }
}
impl DsStore_BuddyAllocatorBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DsStore_BuddyAllocatorBody_BlockDescriptor {
    pub _root: SharedType<DsStore>,
    pub _parent: SharedType<DsStore_BuddyAllocatorBody>,
    pub _self: SharedType<Self>,
    address_raw: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_offset: Cell<bool>,
    offset: RefCell<i32>,
    f_size: Cell<bool>,
    size: RefCell<i32>,
}
impl KStruct for DsStore_BuddyAllocatorBody_BlockDescriptor {
    type Root = DsStore;
    type Parent = DsStore_BuddyAllocatorBody;

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
        *self_rc.address_raw.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl DsStore_BuddyAllocatorBody_BlockDescriptor {
    pub fn offset(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_offset.get() {
            return Ok(self.offset.borrow());
        }
        self.f_offset.set(true);
        *self.offset.borrow_mut() = (((((*self.address_raw() as i32) & (~(*_r.block_address_mask()?) as i32)) as i32) + (4 as i32))) as i32;
        Ok(self.offset.borrow())
    }
    pub fn size(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_size.get() {
            return Ok(self.size.borrow());
        }
        self.f_size.set(true);
        *self.size.borrow_mut() = (((1 as i32) << (((*self.address_raw() as u32) & (*_r.block_address_mask()? as u32)) as i32))) as i32;
        Ok(self.size.borrow())
    }
}
impl DsStore_BuddyAllocatorBody_BlockDescriptor {
    pub fn address_raw(&self) -> Ref<'_, u32> {
        self.address_raw.borrow()
    }
}
impl DsStore_BuddyAllocatorBody_BlockDescriptor {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DsStore_BuddyAllocatorBody_DirectoryEntry {
    pub _root: SharedType<DsStore>,
    pub _parent: SharedType<DsStore_BuddyAllocatorBody>,
    pub _self: SharedType<Self>,
    len_name: RefCell<u8>,
    name: RefCell<String>,
    block_id: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for DsStore_BuddyAllocatorBody_DirectoryEntry {
    type Root = DsStore;
    type Parent = DsStore_BuddyAllocatorBody;

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
        *self_rc.len_name.borrow_mut() = _io.read_u1()?.into();
        *self_rc.name.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.len_name() as usize)?.into(), "UTF-8")?;
        *self_rc.block_id.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl DsStore_BuddyAllocatorBody_DirectoryEntry {
}
impl DsStore_BuddyAllocatorBody_DirectoryEntry {
    pub fn len_name(&self) -> Ref<'_, u8> {
        self.len_name.borrow()
    }
}
impl DsStore_BuddyAllocatorBody_DirectoryEntry {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl DsStore_BuddyAllocatorBody_DirectoryEntry {
    pub fn block_id(&self) -> Ref<'_, u32> {
        self.block_id.borrow()
    }
}
impl DsStore_BuddyAllocatorBody_DirectoryEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DsStore_BuddyAllocatorBody_FreeList {
    pub _root: SharedType<DsStore>,
    pub _parent: SharedType<DsStore_BuddyAllocatorBody>,
    pub _self: SharedType<Self>,
    counter: RefCell<u32>,
    offsets: RefCell<Vec<u32>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for DsStore_BuddyAllocatorBody_FreeList {
    type Root = DsStore;
    type Parent = DsStore_BuddyAllocatorBody;

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
        *self_rc.counter.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.offsets.borrow_mut() = Vec::new();
        let l_offsets = *self_rc.counter();
        for _i in 0..l_offsets {
            self_rc.offsets.borrow_mut().push(_io.read_u4be()?.into());
        }
        Ok(())
    }
}
impl DsStore_BuddyAllocatorBody_FreeList {
}
impl DsStore_BuddyAllocatorBody_FreeList {
    pub fn counter(&self) -> Ref<'_, u32> {
        self.counter.borrow()
    }
}
impl DsStore_BuddyAllocatorBody_FreeList {
    pub fn offsets(&self) -> Ref<'_, Vec<u32>> {
        self.offsets.borrow()
    }
}
impl DsStore_BuddyAllocatorBody_FreeList {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DsStore_BuddyAllocatorHeader {
    pub _root: SharedType<DsStore>,
    pub _parent: SharedType<DsStore>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    ofs_bookkeeping_info_block: RefCell<u32>,
    len_bookkeeping_info_block: RefCell<u32>,
    copy_ofs_bookkeeping_info_block: RefCell<u32>,
    unnamed4: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for DsStore_BuddyAllocatorHeader {
    type Root = DsStore;
    type Parent = DsStore;

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
        if !(*self_rc.magic() == vec![0x42u8, 0x75u8, 0x64u8, 0x31u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/buddy_allocator_header/seq/0".to_string() }));
        }
        *self_rc.ofs_bookkeeping_info_block.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.len_bookkeeping_info_block.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.copy_ofs_bookkeeping_info_block.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.unnamed4.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        Ok(())
    }
}
impl DsStore_BuddyAllocatorHeader {
}

/**
 * Magic number 'Bud1'.
 */
impl DsStore_BuddyAllocatorHeader {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl DsStore_BuddyAllocatorHeader {
    pub fn ofs_bookkeeping_info_block(&self) -> Ref<'_, u32> {
        self.ofs_bookkeeping_info_block.borrow()
    }
}
impl DsStore_BuddyAllocatorHeader {
    pub fn len_bookkeeping_info_block(&self) -> Ref<'_, u32> {
        self.len_bookkeeping_info_block.borrow()
    }
}

/**
 * Needs to match 'offset_bookkeeping_info_block'.
 */
impl DsStore_BuddyAllocatorHeader {
    pub fn copy_ofs_bookkeeping_info_block(&self) -> Ref<'_, u32> {
        self.copy_ofs_bookkeeping_info_block.borrow()
    }
}

/**
 * Unused field which might simply be the unused space at the end of the block,
 * since the minimum allocation size is 32 bytes.
 */
impl DsStore_BuddyAllocatorHeader {
    pub fn unnamed4(&self) -> Ref<'_, Vec<u8>> {
        self.unnamed4.borrow()
    }
}
impl DsStore_BuddyAllocatorHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DsStore_MasterBlockRef {
    pub _root: SharedType<DsStore>,
    pub _parent: SharedType<DsStore_BuddyAllocatorBody>,
    pub _self: SharedType<Self>,
    idx: RefCell<u64>,
    _io: RefCell<BytesReader>,
    master_block_raw: RefCell<Vec<u8>>,
    f_master_block: Cell<bool>,
    master_block: RefCell<OptRc<DsStore_MasterBlockRef_MasterBlock>>,
}
impl KStruct for DsStore_MasterBlockRef {
    type Root = DsStore;
    type Parent = DsStore_BuddyAllocatorBody;

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
impl DsStore_MasterBlockRef {
    pub fn idx(&self) -> Ref<'_, u64> {
        self.idx.borrow()
    }
}
impl DsStore_MasterBlockRef {
    pub fn set_params(&mut self, idx: u64) {
        *self.idx.borrow_mut() = idx;
    }
}
impl DsStore_MasterBlockRef {
    pub fn master_block(
        &self
    ) -> KResult<Ref<'_, OptRc<DsStore_MasterBlockRef_MasterBlock>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_master_block.get() {
            return Ok(self.master_block.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*_prc.as_ref().unwrap().block_addresses()[*_prc.as_ref().unwrap().directory_entries()[*self.idx() as usize].block_id() as usize].offset()? as usize)?;
        *self.master_block_raw.borrow_mut() = _io.read_bytes(*_prc.as_ref().unwrap().block_addresses()[*_prc.as_ref().unwrap().directory_entries()[*self.idx() as usize].block_id() as usize].size()? as usize)?.into();
        let master_block_raw = self.master_block_raw.borrow();
        let _t_master_block_raw_io = BytesReader::from(master_block_raw.clone());
        let t = Self::read_into::<BytesReader, DsStore_MasterBlockRef_MasterBlock>(&_t_master_block_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.master_block.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.master_block.borrow())
    }
}
impl DsStore_MasterBlockRef {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl DsStore_MasterBlockRef {
    pub fn master_block_raw(&self) -> Ref<'_, Vec<u8>> {
        self.master_block_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DsStore_MasterBlockRef_MasterBlock {
    pub _root: SharedType<DsStore>,
    pub _parent: SharedType<DsStore_MasterBlockRef>,
    pub _self: SharedType<Self>,
    block_id: RefCell<u32>,
    num_internal_nodes: RefCell<u32>,
    num_records: RefCell<u32>,
    num_nodes: RefCell<u32>,
    unnamed4: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_root_block: Cell<bool>,
    root_block: RefCell<OptRc<DsStore_Block>>,
}
impl KStruct for DsStore_MasterBlockRef_MasterBlock {
    type Root = DsStore;
    type Parent = DsStore_MasterBlockRef;

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
        *self_rc.block_id.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.num_internal_nodes.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.num_records.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.num_nodes.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.unnamed4.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl DsStore_MasterBlockRef_MasterBlock {
    pub fn root_block(
        &self
    ) -> KResult<Ref<'_, OptRc<DsStore_Block>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_root_block.get() {
            return Ok(self.root_block.borrow());
        }
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*_r.buddy_allocator_body()?.block_addresses()[*self.block_id() as usize].offset()? as usize)?;
        let t = Self::read_into::<BytesReader, DsStore_Block>(&io, Some(self._root.clone()), None)?.into();
        *self.root_block.borrow_mut() = t;
        io.seek(_pos)?;
        Ok(self.root_block.borrow())
    }
}

/**
 * Block number of the B-tree's root node.
 */
impl DsStore_MasterBlockRef_MasterBlock {
    pub fn block_id(&self) -> Ref<'_, u32> {
        self.block_id.borrow()
    }
}

/**
 * Number of internal node levels.
 */
impl DsStore_MasterBlockRef_MasterBlock {
    pub fn num_internal_nodes(&self) -> Ref<'_, u32> {
        self.num_internal_nodes.borrow()
    }
}

/**
 * Number of records in the tree.
 */
impl DsStore_MasterBlockRef_MasterBlock {
    pub fn num_records(&self) -> Ref<'_, u32> {
        self.num_records.borrow()
    }
}

/**
 * Number of nodes in the tree.
 */
impl DsStore_MasterBlockRef_MasterBlock {
    pub fn num_nodes(&self) -> Ref<'_, u32> {
        self.num_nodes.borrow()
    }
}

/**
 * Always 0x1000, probably the B-tree node page size.
 */
impl DsStore_MasterBlockRef_MasterBlock {
    pub fn unnamed4(&self) -> Ref<'_, u32> {
        self.unnamed4.borrow()
    }
}
impl DsStore_MasterBlockRef_MasterBlock {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

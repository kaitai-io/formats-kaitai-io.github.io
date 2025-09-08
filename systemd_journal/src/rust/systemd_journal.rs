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
 * systemd, a popular user-space system/service management suite on Linux,
 * offers logging functionality, storing incoming logs in a binary journal
 * format.
 * 
 * On live Linux system running systemd, these journals are typically located at:
 * 
 * * /run/log/journal/machine-id/*.journal (volatile, lost after reboot)
 * * /var/log/journal/machine-id/*.journal (persistent, but disabled by default on Debian / Ubuntu)
 * \sa https://www.freedesktop.org/wiki/Software/systemd/journal-files/ Source
 */

#[derive(Default, Debug, Clone)]
pub struct SystemdJournal {
    pub _root: SharedType<SystemdJournal>,
    pub _parent: SharedType<SystemdJournal>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<SystemdJournal_Header>>,
    objects: RefCell<Vec<OptRc<SystemdJournal_JournalObject>>>,
    _io: RefCell<BytesReader>,
    header_raw: RefCell<Vec<u8>>,
    f_data_hash_table: Cell<bool>,
    data_hash_table: RefCell<Vec<u8>>,
    f_field_hash_table: Cell<bool>,
    field_hash_table: RefCell<Vec<u8>>,
    f_len_header: Cell<bool>,
    len_header: RefCell<u64>,
}
impl KStruct for SystemdJournal {
    type Root = SystemdJournal;
    type Parent = SystemdJournal;

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
        *self_rc.header_raw.borrow_mut() = _io.read_bytes(*self_rc.len_header()? as usize)?.into();
        let header_raw = self_rc.header_raw.borrow();
        let _t_header_raw_io = BytesReader::from(header_raw.clone());
        let t = Self::read_into::<BytesReader, SystemdJournal_Header>(&_t_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        *self_rc.objects.borrow_mut() = Vec::new();
        let l_objects = *self_rc.header().num_objects();
        for _i in 0..l_objects {
            let t = Self::read_into::<_, SystemdJournal_JournalObject>(&*_io, Some(self_rc._root.clone()), None)?.into();
            self_rc.objects.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl SystemdJournal {
    pub fn data_hash_table(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_data_hash_table.get() {
            return Ok(self.data_hash_table.borrow());
        }
        self.f_data_hash_table.set(true);
        let _pos = _io.pos();
        _io.seek(*self.header().ofs_data_hash_table() as usize)?;
        *self.data_hash_table.borrow_mut() = _io.read_bytes(*self.header().len_data_hash_table() as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.data_hash_table.borrow())
    }
    pub fn field_hash_table(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_field_hash_table.get() {
            return Ok(self.field_hash_table.borrow());
        }
        self.f_field_hash_table.set(true);
        let _pos = _io.pos();
        _io.seek(*self.header().ofs_field_hash_table() as usize)?;
        *self.field_hash_table.borrow_mut() = _io.read_bytes(*self.header().len_field_hash_table() as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.field_hash_table.borrow())
    }

    /**
     * Header length is used to set substream size, as it thus required
     * prior to declaration of header.
     */
    pub fn len_header(
        &self
    ) -> KResult<Ref<'_, u64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_header.get() {
            return Ok(self.len_header.borrow());
        }
        self.f_len_header.set(true);
        let _pos = _io.pos();
        _io.seek(88 as usize)?;
        *self.len_header.borrow_mut() = _io.read_u8le()?.into();
        _io.seek(_pos)?;
        Ok(self.len_header.borrow())
    }
}
impl SystemdJournal {
    pub fn header(&self) -> Ref<'_, OptRc<SystemdJournal_Header>> {
        self.header.borrow()
    }
}
impl SystemdJournal {
    pub fn objects(&self) -> Ref<'_, Vec<OptRc<SystemdJournal_JournalObject>>> {
        self.objects.borrow()
    }
}
impl SystemdJournal {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl SystemdJournal {
    pub fn header_raw(&self) -> Ref<'_, Vec<u8>> {
        self.header_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum SystemdJournal_State {

    /**
     * File is closed and thus not being written into right now
     */
    Offline,

    /**
     * File is open and thus might be undergoing update at the moment
     */
    Online,

    /**
     * File has been rotated, no further updates to this file are to be expected
     */
    Archived,
    Unknown(i64),
}

impl TryFrom<i64> for SystemdJournal_State {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<SystemdJournal_State> {
        match flag {
            0 => Ok(SystemdJournal_State::Offline),
            1 => Ok(SystemdJournal_State::Online),
            2 => Ok(SystemdJournal_State::Archived),
            _ => Ok(SystemdJournal_State::Unknown(flag)),
        }
    }
}

impl From<&SystemdJournal_State> for i64 {
    fn from(v: &SystemdJournal_State) -> Self {
        match *v {
            SystemdJournal_State::Offline => 0,
            SystemdJournal_State::Online => 1,
            SystemdJournal_State::Archived => 2,
            SystemdJournal_State::Unknown(v) => v
        }
    }
}

impl Default for SystemdJournal_State {
    fn default() -> Self { SystemdJournal_State::Unknown(0) }
}


/**
 * Data objects are designed to carry log payload, typically in
 * form of a "key=value" string in `payload` attribute.
 * \sa https://www.freedesktop.org/wiki/Software/systemd/journal-files/#dataobjects Source
 */

#[derive(Default, Debug, Clone)]
pub struct SystemdJournal_DataObject {
    pub _root: SharedType<SystemdJournal>,
    pub _parent: SharedType<SystemdJournal_JournalObject>,
    pub _self: SharedType<Self>,
    hash: RefCell<u64>,
    ofs_next_hash: RefCell<u64>,
    ofs_head_field: RefCell<u64>,
    ofs_entry: RefCell<u64>,
    ofs_entry_array: RefCell<u64>,
    num_entries: RefCell<u64>,
    payload: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_entry: Cell<bool>,
    entry: RefCell<OptRc<SystemdJournal_JournalObject>>,
    f_entry_array: Cell<bool>,
    entry_array: RefCell<OptRc<SystemdJournal_JournalObject>>,
    f_head_field: Cell<bool>,
    head_field: RefCell<OptRc<SystemdJournal_JournalObject>>,
    f_next_hash: Cell<bool>,
    next_hash: RefCell<OptRc<SystemdJournal_JournalObject>>,
}
impl KStruct for SystemdJournal_DataObject {
    type Root = SystemdJournal;
    type Parent = SystemdJournal_JournalObject;

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
        *self_rc.hash.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.ofs_next_hash.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.ofs_head_field.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.ofs_entry.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.ofs_entry_array.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.num_entries.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.payload.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl SystemdJournal_DataObject {
    pub fn entry(
        &self
    ) -> KResult<Ref<'_, OptRc<SystemdJournal_JournalObject>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_entry.get() {
            return Ok(self.entry.borrow());
        }
        if ((*self.ofs_entry() as u64) != (0 as u64)) {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(*self.ofs_entry() as usize)?;
            let t = Self::read_into::<BytesReader, SystemdJournal_JournalObject>(&io, Some(self._root.clone()), None)?.into();
            *self.entry.borrow_mut() = t;
            io.seek(_pos)?;
        }
        Ok(self.entry.borrow())
    }
    pub fn entry_array(
        &self
    ) -> KResult<Ref<'_, OptRc<SystemdJournal_JournalObject>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_entry_array.get() {
            return Ok(self.entry_array.borrow());
        }
        if ((*self.ofs_entry_array() as u64) != (0 as u64)) {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(*self.ofs_entry_array() as usize)?;
            let t = Self::read_into::<BytesReader, SystemdJournal_JournalObject>(&io, Some(self._root.clone()), None)?.into();
            *self.entry_array.borrow_mut() = t;
            io.seek(_pos)?;
        }
        Ok(self.entry_array.borrow())
    }
    pub fn head_field(
        &self
    ) -> KResult<Ref<'_, OptRc<SystemdJournal_JournalObject>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_head_field.get() {
            return Ok(self.head_field.borrow());
        }
        if ((*self.ofs_head_field() as u64) != (0 as u64)) {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(*self.ofs_head_field() as usize)?;
            let t = Self::read_into::<BytesReader, SystemdJournal_JournalObject>(&io, Some(self._root.clone()), None)?.into();
            *self.head_field.borrow_mut() = t;
            io.seek(_pos)?;
        }
        Ok(self.head_field.borrow())
    }
    pub fn next_hash(
        &self
    ) -> KResult<Ref<'_, OptRc<SystemdJournal_JournalObject>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_next_hash.get() {
            return Ok(self.next_hash.borrow());
        }
        if ((*self.ofs_next_hash() as u64) != (0 as u64)) {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(*self.ofs_next_hash() as usize)?;
            let t = Self::read_into::<BytesReader, SystemdJournal_JournalObject>(&io, Some(self._root.clone()), None)?.into();
            *self.next_hash.borrow_mut() = t;
            io.seek(_pos)?;
        }
        Ok(self.next_hash.borrow())
    }
}
impl SystemdJournal_DataObject {
    pub fn hash(&self) -> Ref<'_, u64> {
        self.hash.borrow()
    }
}
impl SystemdJournal_DataObject {
    pub fn ofs_next_hash(&self) -> Ref<'_, u64> {
        self.ofs_next_hash.borrow()
    }
}
impl SystemdJournal_DataObject {
    pub fn ofs_head_field(&self) -> Ref<'_, u64> {
        self.ofs_head_field.borrow()
    }
}
impl SystemdJournal_DataObject {
    pub fn ofs_entry(&self) -> Ref<'_, u64> {
        self.ofs_entry.borrow()
    }
}
impl SystemdJournal_DataObject {
    pub fn ofs_entry_array(&self) -> Ref<'_, u64> {
        self.ofs_entry_array.borrow()
    }
}
impl SystemdJournal_DataObject {
    pub fn num_entries(&self) -> Ref<'_, u64> {
        self.num_entries.borrow()
    }
}
impl SystemdJournal_DataObject {
    pub fn payload(&self) -> Ref<'_, Vec<u8>> {
        self.payload.borrow()
    }
}
impl SystemdJournal_DataObject {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct SystemdJournal_Header {
    pub _root: SharedType<SystemdJournal>,
    pub _parent: SharedType<SystemdJournal>,
    pub _self: SharedType<Self>,
    signature: RefCell<Vec<u8>>,
    compatible_flags: RefCell<u32>,
    incompatible_flags: RefCell<u32>,
    state: RefCell<SystemdJournal_State>,
    reserved: RefCell<Vec<u8>>,
    file_id: RefCell<Vec<u8>>,
    machine_id: RefCell<Vec<u8>>,
    boot_id: RefCell<Vec<u8>>,
    seqnum_id: RefCell<Vec<u8>>,
    len_header: RefCell<u64>,
    len_arena: RefCell<u64>,
    ofs_data_hash_table: RefCell<u64>,
    len_data_hash_table: RefCell<u64>,
    ofs_field_hash_table: RefCell<u64>,
    len_field_hash_table: RefCell<u64>,
    ofs_tail_object: RefCell<u64>,
    num_objects: RefCell<u64>,
    num_entries: RefCell<u64>,
    tail_entry_seqnum: RefCell<u64>,
    head_entry_seqnum: RefCell<u64>,
    ofs_entry_array: RefCell<u64>,
    head_entry_realtime: RefCell<u64>,
    tail_entry_realtime: RefCell<u64>,
    tail_entry_monotonic: RefCell<u64>,
    num_data: RefCell<u64>,
    num_fields: RefCell<u64>,
    num_tags: RefCell<u64>,
    num_entry_arrays: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SystemdJournal_Header {
    type Root = SystemdJournal;
    type Parent = SystemdJournal;

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
        *self_rc.signature.borrow_mut() = _io.read_bytes(8 as usize)?.into();
        if !(*self_rc.signature() == vec![0x4cu8, 0x50u8, 0x4bu8, 0x53u8, 0x48u8, 0x48u8, 0x52u8, 0x48u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/seq/0".to_string() }));
        }
        *self_rc.compatible_flags.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.incompatible_flags.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.state.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.reserved.borrow_mut() = _io.read_bytes(7 as usize)?.into();
        *self_rc.file_id.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        *self_rc.machine_id.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        *self_rc.boot_id.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        *self_rc.seqnum_id.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        *self_rc.len_header.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.len_arena.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.ofs_data_hash_table.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.len_data_hash_table.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.ofs_field_hash_table.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.len_field_hash_table.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.ofs_tail_object.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.num_objects.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.num_entries.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.tail_entry_seqnum.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.head_entry_seqnum.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.ofs_entry_array.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.head_entry_realtime.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.tail_entry_realtime.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.tail_entry_monotonic.borrow_mut() = _io.read_u8le()?.into();
        if !(_io.is_eof()) {
            *self_rc.num_data.borrow_mut() = _io.read_u8le()?.into();
        }
        if !(_io.is_eof()) {
            *self_rc.num_fields.borrow_mut() = _io.read_u8le()?.into();
        }
        if !(_io.is_eof()) {
            *self_rc.num_tags.borrow_mut() = _io.read_u8le()?.into();
        }
        if !(_io.is_eof()) {
            *self_rc.num_entry_arrays.borrow_mut() = _io.read_u8le()?.into();
        }
        Ok(())
    }
}
impl SystemdJournal_Header {
}
impl SystemdJournal_Header {
    pub fn signature(&self) -> Ref<'_, Vec<u8>> {
        self.signature.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn compatible_flags(&self) -> Ref<'_, u32> {
        self.compatible_flags.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn incompatible_flags(&self) -> Ref<'_, u32> {
        self.incompatible_flags.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn state(&self) -> Ref<'_, SystemdJournal_State> {
        self.state.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn file_id(&self) -> Ref<'_, Vec<u8>> {
        self.file_id.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn machine_id(&self) -> Ref<'_, Vec<u8>> {
        self.machine_id.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn boot_id(&self) -> Ref<'_, Vec<u8>> {
        self.boot_id.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn seqnum_id(&self) -> Ref<'_, Vec<u8>> {
        self.seqnum_id.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn len_header(&self) -> Ref<'_, u64> {
        self.len_header.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn len_arena(&self) -> Ref<'_, u64> {
        self.len_arena.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn ofs_data_hash_table(&self) -> Ref<'_, u64> {
        self.ofs_data_hash_table.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn len_data_hash_table(&self) -> Ref<'_, u64> {
        self.len_data_hash_table.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn ofs_field_hash_table(&self) -> Ref<'_, u64> {
        self.ofs_field_hash_table.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn len_field_hash_table(&self) -> Ref<'_, u64> {
        self.len_field_hash_table.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn ofs_tail_object(&self) -> Ref<'_, u64> {
        self.ofs_tail_object.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn num_objects(&self) -> Ref<'_, u64> {
        self.num_objects.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn num_entries(&self) -> Ref<'_, u64> {
        self.num_entries.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn tail_entry_seqnum(&self) -> Ref<'_, u64> {
        self.tail_entry_seqnum.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn head_entry_seqnum(&self) -> Ref<'_, u64> {
        self.head_entry_seqnum.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn ofs_entry_array(&self) -> Ref<'_, u64> {
        self.ofs_entry_array.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn head_entry_realtime(&self) -> Ref<'_, u64> {
        self.head_entry_realtime.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn tail_entry_realtime(&self) -> Ref<'_, u64> {
        self.tail_entry_realtime.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn tail_entry_monotonic(&self) -> Ref<'_, u64> {
        self.tail_entry_monotonic.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn num_data(&self) -> Ref<'_, u64> {
        self.num_data.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn num_fields(&self) -> Ref<'_, u64> {
        self.num_fields.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn num_tags(&self) -> Ref<'_, u64> {
        self.num_tags.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn num_entry_arrays(&self) -> Ref<'_, u64> {
        self.num_entry_arrays.borrow()
    }
}
impl SystemdJournal_Header {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://www.freedesktop.org/wiki/Software/systemd/journal-files/#objects Source
 */

#[derive(Default, Debug, Clone)]
pub struct SystemdJournal_JournalObject {
    pub _root: SharedType<SystemdJournal>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    padding: RefCell<Vec<u8>>,
    object_type: RefCell<SystemdJournal_JournalObject_ObjectTypes>,
    flags: RefCell<u8>,
    reserved: RefCell<Vec<u8>>,
    len_object: RefCell<u64>,
    payload: RefCell<Option<SystemdJournal_JournalObject_Payload>>,
    _io: RefCell<BytesReader>,
    payload_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum SystemdJournal_JournalObject_Payload {
    SystemdJournal_DataObject(OptRc<SystemdJournal_DataObject>),
    Bytes(Vec<u8>),
}
impl From<&SystemdJournal_JournalObject_Payload> for OptRc<SystemdJournal_DataObject> {
    fn from(v: &SystemdJournal_JournalObject_Payload) -> Self {
        if let SystemdJournal_JournalObject_Payload::SystemdJournal_DataObject(x) = v {
            return x.clone();
        }
        panic!("expected SystemdJournal_JournalObject_Payload::SystemdJournal_DataObject, got {:?}", v)
    }
}
impl From<OptRc<SystemdJournal_DataObject>> for SystemdJournal_JournalObject_Payload {
    fn from(v: OptRc<SystemdJournal_DataObject>) -> Self {
        Self::SystemdJournal_DataObject(v)
    }
}
impl From<&SystemdJournal_JournalObject_Payload> for Vec<u8> {
    fn from(v: &SystemdJournal_JournalObject_Payload) -> Self {
        if let SystemdJournal_JournalObject_Payload::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected SystemdJournal_JournalObject_Payload::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for SystemdJournal_JournalObject_Payload {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl KStruct for SystemdJournal_JournalObject {
    type Root = SystemdJournal;
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
        *self_rc.padding.borrow_mut() = _io.read_bytes(modulo(((8 as i32) - (_io.pos() as i32)) as i64, 8 as i64) as usize)?.into();
        *self_rc.object_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.flags.borrow_mut() = _io.read_u1()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_bytes(6 as usize)?.into();
        *self_rc.len_object.borrow_mut() = _io.read_u8le()?.into();
        match *self_rc.object_type() {
            SystemdJournal_JournalObject_ObjectTypes::Data => {
                *self_rc.payload_raw.borrow_mut() = _io.read_bytes(((*self_rc.len_object() as u64) - (16 as u64)) as usize)?.into();
                let payload_raw = self_rc.payload_raw.borrow();
                let _t_payload_raw_io = BytesReader::from(payload_raw.clone());
                let t = Self::read_into::<BytesReader, SystemdJournal_DataObject>(&_t_payload_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.payload.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.payload.borrow_mut() = Some(_io.read_bytes(((*self_rc.len_object() as u64) - (16 as u64)) as usize)?.into());
            }
        }
        Ok(())
    }
}
impl SystemdJournal_JournalObject {
}
impl SystemdJournal_JournalObject {
    pub fn padding(&self) -> Ref<'_, Vec<u8>> {
        self.padding.borrow()
    }
}
impl SystemdJournal_JournalObject {
    pub fn object_type(&self) -> Ref<'_, SystemdJournal_JournalObject_ObjectTypes> {
        self.object_type.borrow()
    }
}
impl SystemdJournal_JournalObject {
    pub fn flags(&self) -> Ref<'_, u8> {
        self.flags.borrow()
    }
}
impl SystemdJournal_JournalObject {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl SystemdJournal_JournalObject {
    pub fn len_object(&self) -> Ref<'_, u64> {
        self.len_object.borrow()
    }
}
impl SystemdJournal_JournalObject {
    pub fn payload(&self) -> Ref<'_, Option<SystemdJournal_JournalObject_Payload>> {
        self.payload.borrow()
    }
}
impl SystemdJournal_JournalObject {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl SystemdJournal_JournalObject {
    pub fn payload_raw(&self) -> Ref<'_, Vec<u8>> {
        self.payload_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum SystemdJournal_JournalObject_ObjectTypes {
    Unused,
    Data,
    Field,
    Entry,
    DataHashTable,
    FieldHashTable,
    EntryArray,
    Tag,
    Unknown(i64),
}

impl TryFrom<i64> for SystemdJournal_JournalObject_ObjectTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<SystemdJournal_JournalObject_ObjectTypes> {
        match flag {
            0 => Ok(SystemdJournal_JournalObject_ObjectTypes::Unused),
            1 => Ok(SystemdJournal_JournalObject_ObjectTypes::Data),
            2 => Ok(SystemdJournal_JournalObject_ObjectTypes::Field),
            3 => Ok(SystemdJournal_JournalObject_ObjectTypes::Entry),
            4 => Ok(SystemdJournal_JournalObject_ObjectTypes::DataHashTable),
            5 => Ok(SystemdJournal_JournalObject_ObjectTypes::FieldHashTable),
            6 => Ok(SystemdJournal_JournalObject_ObjectTypes::EntryArray),
            7 => Ok(SystemdJournal_JournalObject_ObjectTypes::Tag),
            _ => Ok(SystemdJournal_JournalObject_ObjectTypes::Unknown(flag)),
        }
    }
}

impl From<&SystemdJournal_JournalObject_ObjectTypes> for i64 {
    fn from(v: &SystemdJournal_JournalObject_ObjectTypes) -> Self {
        match *v {
            SystemdJournal_JournalObject_ObjectTypes::Unused => 0,
            SystemdJournal_JournalObject_ObjectTypes::Data => 1,
            SystemdJournal_JournalObject_ObjectTypes::Field => 2,
            SystemdJournal_JournalObject_ObjectTypes::Entry => 3,
            SystemdJournal_JournalObject_ObjectTypes::DataHashTable => 4,
            SystemdJournal_JournalObject_ObjectTypes::FieldHashTable => 5,
            SystemdJournal_JournalObject_ObjectTypes::EntryArray => 6,
            SystemdJournal_JournalObject_ObjectTypes::Tag => 7,
            SystemdJournal_JournalObject_ObjectTypes::Unknown(v) => v
        }
    }
}

impl Default for SystemdJournal_JournalObject_ObjectTypes {
    fn default() -> Self { SystemdJournal_JournalObject_ObjectTypes::Unknown(0) }
}


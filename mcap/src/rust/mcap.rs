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
 * MCAP is a modular container format and logging library for pub/sub messages with
 * arbitrary message serialization. It is primarily intended for use in robotics
 * applications, and works well under various workloads, resource constraints, and
 * durability requirements.
 * 
 * Time values (`log_time`, `publish_time`, `create_time`) are represented in
 * nanoseconds since a user-understood epoch (i.e. Unix epoch, robot boot time,
 * etc.)
 * \sa https://github.com/foxglove/mcap/tree/c1cc51d/docs/specification#readme Source
 */

#[derive(Default, Debug, Clone)]
pub struct Mcap {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap>,
    pub _self: SharedType<Self>,
    header_magic: RefCell<OptRc<Mcap_Magic>>,
    records: RefCell<Vec<OptRc<Mcap_Record>>>,
    footer_magic: RefCell<OptRc<Mcap_Magic>>,
    _io: RefCell<BytesReader>,
    footer_raw: RefCell<Vec<u8>>,
    f_footer: Cell<bool>,
    footer: RefCell<OptRc<Mcap_Record>>,
    f_ofs_footer: Cell<bool>,
    ofs_footer: RefCell<i32>,
}
impl KStruct for Mcap {
    type Root = Mcap;
    type Parent = Mcap;

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
        let t = Self::read_into::<_, Mcap_Magic>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header_magic.borrow_mut() = t;
        *self_rc.records.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let t = Self::read_into::<_, Mcap_Record>(&*_io, Some(self_rc._root.clone()), None)?.into();
                self_rc.records.borrow_mut().push(t);
                let _t_records = self_rc.records.borrow();
                let _tmpa = _t_records.last().unwrap();
                _i += 1;
                let x = !(*_tmpa.op() == Mcap_Opcode::Footer);
                x
            } {}
        }
        let t = Self::read_into::<_, Mcap_Magic>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.footer_magic.borrow_mut() = t;
        Ok(())
    }
}
impl Mcap {
    pub fn footer(
        &self
    ) -> KResult<Ref<'_, OptRc<Mcap_Record>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_footer.get() {
            return Ok(self.footer.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*self.ofs_footer()? as usize)?;
        *self.footer_raw.borrow_mut() = _io.read_bytes_full()?.into();
        let footer_raw = self.footer_raw.borrow();
        let _t_footer_raw_io = BytesReader::from(footer_raw.clone());
        let t = Self::read_into::<BytesReader, Mcap_Record>(&_t_footer_raw_io, Some(self._root.clone()), None)?.into();
        *self.footer.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.footer.borrow())
    }
    pub fn ofs_footer(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ofs_footer.get() {
            return Ok(self.ofs_footer.borrow());
        }
        self.f_ofs_footer.set(true);
        *self.ofs_footer.borrow_mut() = (((((((((_io.size() as i32) - (1 as i32)) as i32) - (8 as i32)) as i32) - (20 as i32)) as i32) - (8 as i32))) as i32;
        Ok(self.ofs_footer.borrow())
    }
}
impl Mcap {
    pub fn header_magic(&self) -> Ref<'_, OptRc<Mcap_Magic>> {
        self.header_magic.borrow()
    }
}
impl Mcap {
    pub fn records(&self) -> Ref<'_, Vec<OptRc<Mcap_Record>>> {
        self.records.borrow()
    }
}
impl Mcap {
    pub fn footer_magic(&self) -> Ref<'_, OptRc<Mcap_Magic>> {
        self.footer_magic.borrow()
    }
}
impl Mcap {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Mcap {
    pub fn footer_raw(&self) -> Ref<'_, Vec<u8>> {
        self.footer_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Mcap_Opcode {
    Header,
    Footer,
    Schema,
    Channel,
    Message,
    Chunk,
    MessageIndex,
    ChunkIndex,
    Attachment,
    AttachmentIndex,
    Statistics,
    Metadata,
    MetadataIndex,
    SummaryOffset,
    DataEnd,
    Unknown(i64),
}

impl TryFrom<i64> for Mcap_Opcode {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Mcap_Opcode> {
        match flag {
            1 => Ok(Mcap_Opcode::Header),
            2 => Ok(Mcap_Opcode::Footer),
            3 => Ok(Mcap_Opcode::Schema),
            4 => Ok(Mcap_Opcode::Channel),
            5 => Ok(Mcap_Opcode::Message),
            6 => Ok(Mcap_Opcode::Chunk),
            7 => Ok(Mcap_Opcode::MessageIndex),
            8 => Ok(Mcap_Opcode::ChunkIndex),
            9 => Ok(Mcap_Opcode::Attachment),
            10 => Ok(Mcap_Opcode::AttachmentIndex),
            11 => Ok(Mcap_Opcode::Statistics),
            12 => Ok(Mcap_Opcode::Metadata),
            13 => Ok(Mcap_Opcode::MetadataIndex),
            14 => Ok(Mcap_Opcode::SummaryOffset),
            15 => Ok(Mcap_Opcode::DataEnd),
            _ => Ok(Mcap_Opcode::Unknown(flag)),
        }
    }
}

impl From<&Mcap_Opcode> for i64 {
    fn from(v: &Mcap_Opcode) -> Self {
        match *v {
            Mcap_Opcode::Header => 1,
            Mcap_Opcode::Footer => 2,
            Mcap_Opcode::Schema => 3,
            Mcap_Opcode::Channel => 4,
            Mcap_Opcode::Message => 5,
            Mcap_Opcode::Chunk => 6,
            Mcap_Opcode::MessageIndex => 7,
            Mcap_Opcode::ChunkIndex => 8,
            Mcap_Opcode::Attachment => 9,
            Mcap_Opcode::AttachmentIndex => 10,
            Mcap_Opcode::Statistics => 11,
            Mcap_Opcode::Metadata => 12,
            Mcap_Opcode::MetadataIndex => 13,
            Mcap_Opcode::SummaryOffset => 14,
            Mcap_Opcode::DataEnd => 15,
            Mcap_Opcode::Unknown(v) => v
        }
    }
}

impl Default for Mcap_Opcode {
    fn default() -> Self { Mcap_Opcode::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Mcap_Attachment {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap_Record>,
    pub _self: SharedType<Self>,
    log_time: RefCell<u64>,
    create_time: RefCell<u64>,
    name: RefCell<OptRc<Mcap_PrefixedStr>>,
    content_type: RefCell<OptRc<Mcap_PrefixedStr>>,
    len_data: RefCell<u64>,
    data: RefCell<Vec<u8>>,
    invoke_crc32_input_end: RefCell<Vec<u8>>,
    crc32: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_crc32_input: Cell<bool>,
    crc32_input: RefCell<Vec<u8>>,
    f_crc32_input_end: Cell<bool>,
    crc32_input_end: RefCell<i32>,
}
impl KStruct for Mcap_Attachment {
    type Root = Mcap;
    type Parent = Mcap_Record;

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
        *self_rc.log_time.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.create_time.borrow_mut() = _io.read_u8le()?.into();
        let t = Self::read_into::<_, Mcap_PrefixedStr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.name.borrow_mut() = t;
        let t = Self::read_into::<_, Mcap_PrefixedStr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.content_type.borrow_mut() = t;
        *self_rc.len_data.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.data.borrow_mut() = _io.read_bytes(*self_rc.len_data() as usize)?.into();
        if ((*self_rc.crc32_input_end()? as i32) >= (0 as i32)) {
            *self_rc.invoke_crc32_input_end.borrow_mut() = _io.read_bytes(0 as usize)?.into();
        }
        *self_rc.crc32.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Mcap_Attachment {
    pub fn crc32_input(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_crc32_input.get() {
            return Ok(self.crc32_input.borrow());
        }
        self.f_crc32_input.set(true);
        let _pos = _io.pos();
        _io.seek(0 as usize)?;
        *self.crc32_input.borrow_mut() = _io.read_bytes(*self.crc32_input_end()? as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.crc32_input.borrow())
    }
    pub fn crc32_input_end(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_crc32_input_end.get() {
            return Ok(self.crc32_input_end.borrow());
        }
        self.f_crc32_input_end.set(true);
        *self.crc32_input_end.borrow_mut() = (_io.pos()) as i32;
        Ok(self.crc32_input_end.borrow())
    }
}
impl Mcap_Attachment {
    pub fn log_time(&self) -> Ref<'_, u64> {
        self.log_time.borrow()
    }
}
impl Mcap_Attachment {
    pub fn create_time(&self) -> Ref<'_, u64> {
        self.create_time.borrow()
    }
}
impl Mcap_Attachment {
    pub fn name(&self) -> Ref<'_, OptRc<Mcap_PrefixedStr>> {
        self.name.borrow()
    }
}
impl Mcap_Attachment {
    pub fn content_type(&self) -> Ref<'_, OptRc<Mcap_PrefixedStr>> {
        self.content_type.borrow()
    }
}
impl Mcap_Attachment {
    pub fn len_data(&self) -> Ref<'_, u64> {
        self.len_data.borrow()
    }
}
impl Mcap_Attachment {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl Mcap_Attachment {
    pub fn invoke_crc32_input_end(&self) -> Ref<'_, Vec<u8>> {
        self.invoke_crc32_input_end.borrow()
    }
}

/**
 * CRC-32 checksum of preceding fields in the record. A value of zero indicates that
 * CRC validation should not be performed.
 */
impl Mcap_Attachment {
    pub fn crc32(&self) -> Ref<'_, u32> {
        self.crc32.borrow()
    }
}
impl Mcap_Attachment {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_AttachmentIndex {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap_Record>,
    pub _self: SharedType<Self>,
    ofs_attachment: RefCell<u64>,
    len_attachment: RefCell<u64>,
    log_time: RefCell<u64>,
    create_time: RefCell<u64>,
    data_size: RefCell<u64>,
    name: RefCell<OptRc<Mcap_PrefixedStr>>,
    content_type: RefCell<OptRc<Mcap_PrefixedStr>>,
    _io: RefCell<BytesReader>,
    attachment_raw: RefCell<Vec<u8>>,
    f_attachment: Cell<bool>,
    attachment: RefCell<OptRc<Mcap_Record>>,
}
impl KStruct for Mcap_AttachmentIndex {
    type Root = Mcap;
    type Parent = Mcap_Record;

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
        *self_rc.ofs_attachment.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.len_attachment.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.log_time.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.create_time.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.data_size.borrow_mut() = _io.read_u8le()?.into();
        let t = Self::read_into::<_, Mcap_PrefixedStr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.name.borrow_mut() = t;
        let t = Self::read_into::<_, Mcap_PrefixedStr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.content_type.borrow_mut() = t;
        Ok(())
    }
}
impl Mcap_AttachmentIndex {
    pub fn attachment(
        &self
    ) -> KResult<Ref<'_, OptRc<Mcap_Record>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_attachment.get() {
            return Ok(self.attachment.borrow());
        }
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.ofs_attachment() as usize)?;
        *self.attachment_raw.borrow_mut() = io.read_bytes(*self.len_attachment() as usize)?.into();
        let attachment_raw = self.attachment_raw.borrow();
        let _t_attachment_raw_io = BytesReader::from(attachment_raw.clone());
        let t = Self::read_into::<BytesReader, Mcap_Record>(&_t_attachment_raw_io, Some(self._root.clone()), None)?.into();
        *self.attachment.borrow_mut() = t;
        io.seek(_pos)?;
        Ok(self.attachment.borrow())
    }
}
impl Mcap_AttachmentIndex {
    pub fn ofs_attachment(&self) -> Ref<'_, u64> {
        self.ofs_attachment.borrow()
    }
}
impl Mcap_AttachmentIndex {
    pub fn len_attachment(&self) -> Ref<'_, u64> {
        self.len_attachment.borrow()
    }
}
impl Mcap_AttachmentIndex {
    pub fn log_time(&self) -> Ref<'_, u64> {
        self.log_time.borrow()
    }
}
impl Mcap_AttachmentIndex {
    pub fn create_time(&self) -> Ref<'_, u64> {
        self.create_time.borrow()
    }
}
impl Mcap_AttachmentIndex {
    pub fn data_size(&self) -> Ref<'_, u64> {
        self.data_size.borrow()
    }
}
impl Mcap_AttachmentIndex {
    pub fn name(&self) -> Ref<'_, OptRc<Mcap_PrefixedStr>> {
        self.name.borrow()
    }
}
impl Mcap_AttachmentIndex {
    pub fn content_type(&self) -> Ref<'_, OptRc<Mcap_PrefixedStr>> {
        self.content_type.borrow()
    }
}
impl Mcap_AttachmentIndex {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Mcap_AttachmentIndex {
    pub fn attachment_raw(&self) -> Ref<'_, Vec<u8>> {
        self.attachment_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_Channel {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap_Record>,
    pub _self: SharedType<Self>,
    id: RefCell<u16>,
    schema_id: RefCell<u16>,
    topic: RefCell<OptRc<Mcap_PrefixedStr>>,
    message_encoding: RefCell<OptRc<Mcap_PrefixedStr>>,
    metadata: RefCell<OptRc<Mcap_MapStrStr>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Mcap_Channel {
    type Root = Mcap;
    type Parent = Mcap_Record;

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
        *self_rc.id.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.schema_id.borrow_mut() = _io.read_u2le()?.into();
        let t = Self::read_into::<_, Mcap_PrefixedStr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.topic.borrow_mut() = t;
        let t = Self::read_into::<_, Mcap_PrefixedStr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.message_encoding.borrow_mut() = t;
        let t = Self::read_into::<_, Mcap_MapStrStr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.metadata.borrow_mut() = t;
        Ok(())
    }
}
impl Mcap_Channel {
}
impl Mcap_Channel {
    pub fn id(&self) -> Ref<'_, u16> {
        self.id.borrow()
    }
}
impl Mcap_Channel {
    pub fn schema_id(&self) -> Ref<'_, u16> {
        self.schema_id.borrow()
    }
}
impl Mcap_Channel {
    pub fn topic(&self) -> Ref<'_, OptRc<Mcap_PrefixedStr>> {
        self.topic.borrow()
    }
}
impl Mcap_Channel {
    pub fn message_encoding(&self) -> Ref<'_, OptRc<Mcap_PrefixedStr>> {
        self.message_encoding.borrow()
    }
}
impl Mcap_Channel {
    pub fn metadata(&self) -> Ref<'_, OptRc<Mcap_MapStrStr>> {
        self.metadata.borrow()
    }
}
impl Mcap_Channel {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_Chunk {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap_Record>,
    pub _self: SharedType<Self>,
    message_start_time: RefCell<u64>,
    message_end_time: RefCell<u64>,
    uncompressed_size: RefCell<u64>,
    uncompressed_crc32: RefCell<u32>,
    compression: RefCell<OptRc<Mcap_PrefixedStr>>,
    len_records: RefCell<u64>,
    records: RefCell<Option<Mcap_Chunk_Records>>,
    _io: RefCell<BytesReader>,
    records_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum Mcap_Chunk_Records {
    Bytes(Vec<u8>),
    Mcap_Records(OptRc<Mcap_Records>),
}
impl From<&Mcap_Chunk_Records> for Vec<u8> {
    fn from(v: &Mcap_Chunk_Records) -> Self {
        if let Mcap_Chunk_Records::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected Mcap_Chunk_Records::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for Mcap_Chunk_Records {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&Mcap_Chunk_Records> for OptRc<Mcap_Records> {
    fn from(v: &Mcap_Chunk_Records) -> Self {
        if let Mcap_Chunk_Records::Mcap_Records(x) = v {
            return x.clone();
        }
        panic!("expected Mcap_Chunk_Records::Mcap_Records, got {:?}", v)
    }
}
impl From<OptRc<Mcap_Records>> for Mcap_Chunk_Records {
    fn from(v: OptRc<Mcap_Records>) -> Self {
        Self::Mcap_Records(v)
    }
}
impl KStruct for Mcap_Chunk {
    type Root = Mcap;
    type Parent = Mcap_Record;

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
        *self_rc.message_start_time.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.message_end_time.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.uncompressed_size.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.uncompressed_crc32.borrow_mut() = _io.read_u4le()?.into();
        let t = Self::read_into::<_, Mcap_PrefixedStr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.compression.borrow_mut() = t;
        *self_rc.len_records.borrow_mut() = _io.read_u8le()?.into();
        {
            let on = self_rc.compression().str();
            if *on == "" {
                *self_rc.records_raw.borrow_mut() = _io.read_bytes(*self_rc.len_records() as usize)?.into();
                let records_raw = self_rc.records_raw.borrow();
                let _t_records_raw_io = BytesReader::from(records_raw.clone());
                let t = Self::read_into::<BytesReader, Mcap_Records>(&_t_records_raw_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.records.borrow_mut() = Some(t);
            }
            else {
                *self_rc.records.borrow_mut() = Some(_io.read_bytes(*self_rc.len_records() as usize)?.into());
            }
        }
        Ok(())
    }
}
impl Mcap_Chunk {
}
impl Mcap_Chunk {
    pub fn message_start_time(&self) -> Ref<'_, u64> {
        self.message_start_time.borrow()
    }
}
impl Mcap_Chunk {
    pub fn message_end_time(&self) -> Ref<'_, u64> {
        self.message_end_time.borrow()
    }
}
impl Mcap_Chunk {
    pub fn uncompressed_size(&self) -> Ref<'_, u64> {
        self.uncompressed_size.borrow()
    }
}

/**
 * CRC-32 checksum of uncompressed `records` field. A value of zero indicates that
 * CRC validation should not be performed.
 */
impl Mcap_Chunk {
    pub fn uncompressed_crc32(&self) -> Ref<'_, u32> {
        self.uncompressed_crc32.borrow()
    }
}
impl Mcap_Chunk {
    pub fn compression(&self) -> Ref<'_, OptRc<Mcap_PrefixedStr>> {
        self.compression.borrow()
    }
}
impl Mcap_Chunk {
    pub fn len_records(&self) -> Ref<'_, u64> {
        self.len_records.borrow()
    }
}
impl Mcap_Chunk {
    pub fn records(&self) -> Ref<'_, Option<Mcap_Chunk_Records>> {
        self.records.borrow()
    }
}
impl Mcap_Chunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Mcap_Chunk {
    pub fn records_raw(&self) -> Ref<'_, Vec<u8>> {
        self.records_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_ChunkIndex {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap_Record>,
    pub _self: SharedType<Self>,
    message_start_time: RefCell<u64>,
    message_end_time: RefCell<u64>,
    ofs_chunk: RefCell<u64>,
    len_chunk: RefCell<u64>,
    len_message_index_offsets: RefCell<u32>,
    message_index_offsets: RefCell<OptRc<Mcap_ChunkIndex_MessageIndexOffsets>>,
    message_index_length: RefCell<u64>,
    compression: RefCell<OptRc<Mcap_PrefixedStr>>,
    compressed_size: RefCell<u64>,
    uncompressed_size: RefCell<u64>,
    _io: RefCell<BytesReader>,
    message_index_offsets_raw: RefCell<Vec<u8>>,
    chunk_raw: RefCell<Vec<u8>>,
    f_chunk: Cell<bool>,
    chunk: RefCell<OptRc<Mcap_Record>>,
}
impl KStruct for Mcap_ChunkIndex {
    type Root = Mcap;
    type Parent = Mcap_Record;

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
        *self_rc.message_start_time.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.message_end_time.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.ofs_chunk.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.len_chunk.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.len_message_index_offsets.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.message_index_offsets_raw.borrow_mut() = _io.read_bytes(*self_rc.len_message_index_offsets() as usize)?.into();
        let message_index_offsets_raw = self_rc.message_index_offsets_raw.borrow();
        let _t_message_index_offsets_raw_io = BytesReader::from(message_index_offsets_raw.clone());
        let t = Self::read_into::<BytesReader, Mcap_ChunkIndex_MessageIndexOffsets>(&_t_message_index_offsets_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.message_index_offsets.borrow_mut() = t;
        *self_rc.message_index_length.borrow_mut() = _io.read_u8le()?.into();
        let t = Self::read_into::<_, Mcap_PrefixedStr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.compression.borrow_mut() = t;
        *self_rc.compressed_size.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.uncompressed_size.borrow_mut() = _io.read_u8le()?.into();
        Ok(())
    }
}
impl Mcap_ChunkIndex {
    pub fn chunk(
        &self
    ) -> KResult<Ref<'_, OptRc<Mcap_Record>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_chunk.get() {
            return Ok(self.chunk.borrow());
        }
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.ofs_chunk() as usize)?;
        *self.chunk_raw.borrow_mut() = io.read_bytes(*self.len_chunk() as usize)?.into();
        let chunk_raw = self.chunk_raw.borrow();
        let _t_chunk_raw_io = BytesReader::from(chunk_raw.clone());
        let t = Self::read_into::<BytesReader, Mcap_Record>(&_t_chunk_raw_io, Some(self._root.clone()), None)?.into();
        *self.chunk.borrow_mut() = t;
        io.seek(_pos)?;
        Ok(self.chunk.borrow())
    }
}
impl Mcap_ChunkIndex {
    pub fn message_start_time(&self) -> Ref<'_, u64> {
        self.message_start_time.borrow()
    }
}
impl Mcap_ChunkIndex {
    pub fn message_end_time(&self) -> Ref<'_, u64> {
        self.message_end_time.borrow()
    }
}
impl Mcap_ChunkIndex {
    pub fn ofs_chunk(&self) -> Ref<'_, u64> {
        self.ofs_chunk.borrow()
    }
}
impl Mcap_ChunkIndex {
    pub fn len_chunk(&self) -> Ref<'_, u64> {
        self.len_chunk.borrow()
    }
}
impl Mcap_ChunkIndex {
    pub fn len_message_index_offsets(&self) -> Ref<'_, u32> {
        self.len_message_index_offsets.borrow()
    }
}
impl Mcap_ChunkIndex {
    pub fn message_index_offsets(&self) -> Ref<'_, OptRc<Mcap_ChunkIndex_MessageIndexOffsets>> {
        self.message_index_offsets.borrow()
    }
}
impl Mcap_ChunkIndex {
    pub fn message_index_length(&self) -> Ref<'_, u64> {
        self.message_index_length.borrow()
    }
}
impl Mcap_ChunkIndex {
    pub fn compression(&self) -> Ref<'_, OptRc<Mcap_PrefixedStr>> {
        self.compression.borrow()
    }
}
impl Mcap_ChunkIndex {
    pub fn compressed_size(&self) -> Ref<'_, u64> {
        self.compressed_size.borrow()
    }
}
impl Mcap_ChunkIndex {
    pub fn uncompressed_size(&self) -> Ref<'_, u64> {
        self.uncompressed_size.borrow()
    }
}
impl Mcap_ChunkIndex {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Mcap_ChunkIndex {
    pub fn message_index_offsets_raw(&self) -> Ref<'_, Vec<u8>> {
        self.message_index_offsets_raw.borrow()
    }
}
impl Mcap_ChunkIndex {
    pub fn chunk_raw(&self) -> Ref<'_, Vec<u8>> {
        self.chunk_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_ChunkIndex_MessageIndexOffset {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap_ChunkIndex_MessageIndexOffsets>,
    pub _self: SharedType<Self>,
    channel_id: RefCell<u16>,
    offset: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Mcap_ChunkIndex_MessageIndexOffset {
    type Root = Mcap;
    type Parent = Mcap_ChunkIndex_MessageIndexOffsets;

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
        *self_rc.channel_id.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.offset.borrow_mut() = _io.read_u8le()?.into();
        Ok(())
    }
}
impl Mcap_ChunkIndex_MessageIndexOffset {
}
impl Mcap_ChunkIndex_MessageIndexOffset {
    pub fn channel_id(&self) -> Ref<'_, u16> {
        self.channel_id.borrow()
    }
}
impl Mcap_ChunkIndex_MessageIndexOffset {
    pub fn offset(&self) -> Ref<'_, u64> {
        self.offset.borrow()
    }
}
impl Mcap_ChunkIndex_MessageIndexOffset {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_ChunkIndex_MessageIndexOffsets {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap_ChunkIndex>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<Mcap_ChunkIndex_MessageIndexOffset>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Mcap_ChunkIndex_MessageIndexOffsets {
    type Root = Mcap;
    type Parent = Mcap_ChunkIndex;

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
        *self_rc.entries.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Mcap_ChunkIndex_MessageIndexOffset>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Mcap_ChunkIndex_MessageIndexOffsets {
}
impl Mcap_ChunkIndex_MessageIndexOffsets {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Mcap_ChunkIndex_MessageIndexOffset>>> {
        self.entries.borrow()
    }
}
impl Mcap_ChunkIndex_MessageIndexOffsets {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_DataEnd {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap_Record>,
    pub _self: SharedType<Self>,
    data_section_crc32: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Mcap_DataEnd {
    type Root = Mcap;
    type Parent = Mcap_Record;

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
        *self_rc.data_section_crc32.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Mcap_DataEnd {
}

/**
 * CRC-32 of all bytes in the data section. A value of 0 indicates the CRC-32 is not
 * available.
 */
impl Mcap_DataEnd {
    pub fn data_section_crc32(&self) -> Ref<'_, u32> {
        self.data_section_crc32.borrow()
    }
}
impl Mcap_DataEnd {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_Footer {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap_Record>,
    pub _self: SharedType<Self>,
    ofs_summary_section: RefCell<u64>,
    ofs_summary_offset_section: RefCell<u64>,
    summary_crc32: RefCell<u32>,
    _io: RefCell<BytesReader>,
    summary_offset_section_raw: RefCell<Vec<u8>>,
    summary_section_raw: RefCell<Vec<u8>>,
    f_ofs_summary_crc32_input: Cell<bool>,
    ofs_summary_crc32_input: RefCell<i32>,
    f_summary_crc32_input: Cell<bool>,
    summary_crc32_input: RefCell<Vec<u8>>,
    f_summary_offset_section: Cell<bool>,
    summary_offset_section: RefCell<OptRc<Mcap_Records>>,
    f_summary_section: Cell<bool>,
    summary_section: RefCell<OptRc<Mcap_Records>>,
}
impl KStruct for Mcap_Footer {
    type Root = Mcap;
    type Parent = Mcap_Record;

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
        *self_rc.ofs_summary_section.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.ofs_summary_offset_section.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.summary_crc32.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Mcap_Footer {
    pub fn ofs_summary_crc32_input(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ofs_summary_crc32_input.get() {
            return Ok(self.ofs_summary_crc32_input.borrow());
        }
        self.f_ofs_summary_crc32_input.set(true);
        *self.ofs_summary_crc32_input.borrow_mut() = (if ((*self.ofs_summary_section() as u64) != (0 as u64)) { *self.ofs_summary_section() } else { *_r.ofs_footer()? }) as i32;
        Ok(self.ofs_summary_crc32_input.borrow())
    }
    pub fn summary_crc32_input(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_summary_crc32_input.get() {
            return Ok(self.summary_crc32_input.borrow());
        }
        self.f_summary_crc32_input.set(true);
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.ofs_summary_crc32_input()? as usize)?;
        *self.summary_crc32_input.borrow_mut() = io.read_bytes(((((((_r._io().size() as i32) - (*self.ofs_summary_crc32_input()? as i32)) as i32) - (8 as i32)) as i32) - (4 as i32)) as usize)?.into();
        io.seek(_pos)?;
        Ok(self.summary_crc32_input.borrow())
    }
    pub fn summary_offset_section(
        &self
    ) -> KResult<Ref<'_, OptRc<Mcap_Records>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_summary_offset_section.get() {
            return Ok(self.summary_offset_section.borrow());
        }
        if ((*self.ofs_summary_offset_section() as u64) != (0 as u64)) {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(*self.ofs_summary_offset_section() as usize)?;
            *self.summary_offset_section_raw.borrow_mut() = io.read_bytes(((*_r.ofs_footer()? as i32) - (*self.ofs_summary_offset_section() as i32)) as usize)?.into();
            let summary_offset_section_raw = self.summary_offset_section_raw.borrow();
            let _t_summary_offset_section_raw_io = BytesReader::from(summary_offset_section_raw.clone());
            let t = Self::read_into::<BytesReader, Mcap_Records>(&_t_summary_offset_section_raw_io, Some(self._root.clone()), None)?.into();
            *self.summary_offset_section.borrow_mut() = t;
            io.seek(_pos)?;
        }
        Ok(self.summary_offset_section.borrow())
    }
    pub fn summary_section(
        &self
    ) -> KResult<Ref<'_, OptRc<Mcap_Records>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_summary_section.get() {
            return Ok(self.summary_section.borrow());
        }
        if ((*self.ofs_summary_section() as u64) != (0 as u64)) {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(*self.ofs_summary_section() as usize)?;
            *self.summary_section_raw.borrow_mut() = io.read_bytes(((if ((*self.ofs_summary_offset_section() as u64) != (0 as u64)) { *self.ofs_summary_offset_section() } else { *_r.ofs_footer()? } as i32) - (*self.ofs_summary_section() as i32)) as usize)?.into();
            let summary_section_raw = self.summary_section_raw.borrow();
            let _t_summary_section_raw_io = BytesReader::from(summary_section_raw.clone());
            let t = Self::read_into::<BytesReader, Mcap_Records>(&_t_summary_section_raw_io, Some(self._root.clone()), None)?.into();
            *self.summary_section.borrow_mut() = t;
            io.seek(_pos)?;
        }
        Ok(self.summary_section.borrow())
    }
}
impl Mcap_Footer {
    pub fn ofs_summary_section(&self) -> Ref<'_, u64> {
        self.ofs_summary_section.borrow()
    }
}
impl Mcap_Footer {
    pub fn ofs_summary_offset_section(&self) -> Ref<'_, u64> {
        self.ofs_summary_offset_section.borrow()
    }
}

/**
 * A CRC-32 of all bytes from the start of the Summary section up through and
 * including the end of the previous field (summary_offset_start) in the footer
 * record. A value of 0 indicates the CRC-32 is not available.
 */
impl Mcap_Footer {
    pub fn summary_crc32(&self) -> Ref<'_, u32> {
        self.summary_crc32.borrow()
    }
}
impl Mcap_Footer {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Mcap_Footer {
    pub fn summary_offset_section_raw(&self) -> Ref<'_, Vec<u8>> {
        self.summary_offset_section_raw.borrow()
    }
}
impl Mcap_Footer {
    pub fn summary_section_raw(&self) -> Ref<'_, Vec<u8>> {
        self.summary_section_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_Header {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap_Record>,
    pub _self: SharedType<Self>,
    profile: RefCell<OptRc<Mcap_PrefixedStr>>,
    library: RefCell<OptRc<Mcap_PrefixedStr>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Mcap_Header {
    type Root = Mcap;
    type Parent = Mcap_Record;

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
        let t = Self::read_into::<_, Mcap_PrefixedStr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.profile.borrow_mut() = t;
        let t = Self::read_into::<_, Mcap_PrefixedStr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.library.borrow_mut() = t;
        Ok(())
    }
}
impl Mcap_Header {
}
impl Mcap_Header {
    pub fn profile(&self) -> Ref<'_, OptRc<Mcap_PrefixedStr>> {
        self.profile.borrow()
    }
}
impl Mcap_Header {
    pub fn library(&self) -> Ref<'_, OptRc<Mcap_PrefixedStr>> {
        self.library.borrow()
    }
}
impl Mcap_Header {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_Magic {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Mcap_Magic {
    type Root = Mcap;
    type Parent = Mcap;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(8 as usize)?.into();
        if !(*self_rc.magic() == vec![0x89u8, 0x4du8, 0x43u8, 0x41u8, 0x50u8, 0x30u8, 0xdu8, 0xau8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/magic/seq/0".to_string() }));
        }
        Ok(())
    }
}
impl Mcap_Magic {
}
impl Mcap_Magic {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl Mcap_Magic {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_MapStrStr {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    len_entries: RefCell<u32>,
    entries: RefCell<OptRc<Mcap_MapStrStr_Entries>>,
    _io: RefCell<BytesReader>,
    entries_raw: RefCell<Vec<u8>>,
}
impl KStruct for Mcap_MapStrStr {
    type Root = Mcap;
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
        *self_rc.len_entries.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.entries_raw.borrow_mut() = _io.read_bytes(*self_rc.len_entries() as usize)?.into();
        let entries_raw = self_rc.entries_raw.borrow();
        let _t_entries_raw_io = BytesReader::from(entries_raw.clone());
        let t = Self::read_into::<BytesReader, Mcap_MapStrStr_Entries>(&_t_entries_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.entries.borrow_mut() = t;
        Ok(())
    }
}
impl Mcap_MapStrStr {
}
impl Mcap_MapStrStr {
    pub fn len_entries(&self) -> Ref<'_, u32> {
        self.len_entries.borrow()
    }
}
impl Mcap_MapStrStr {
    pub fn entries(&self) -> Ref<'_, OptRc<Mcap_MapStrStr_Entries>> {
        self.entries.borrow()
    }
}
impl Mcap_MapStrStr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Mcap_MapStrStr {
    pub fn entries_raw(&self) -> Ref<'_, Vec<u8>> {
        self.entries_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_MapStrStr_Entries {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap_MapStrStr>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<Mcap_TupleStrStr>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Mcap_MapStrStr_Entries {
    type Root = Mcap;
    type Parent = Mcap_MapStrStr;

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
        *self_rc.entries.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Mcap_TupleStrStr>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Mcap_MapStrStr_Entries {
}
impl Mcap_MapStrStr_Entries {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Mcap_TupleStrStr>>> {
        self.entries.borrow()
    }
}
impl Mcap_MapStrStr_Entries {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_Message {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap_Record>,
    pub _self: SharedType<Self>,
    channel_id: RefCell<u16>,
    sequence: RefCell<u32>,
    log_time: RefCell<u64>,
    publish_time: RefCell<u64>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Mcap_Message {
    type Root = Mcap;
    type Parent = Mcap_Record;

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
        *self_rc.channel_id.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.sequence.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.log_time.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.publish_time.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.data.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl Mcap_Message {
}
impl Mcap_Message {
    pub fn channel_id(&self) -> Ref<'_, u16> {
        self.channel_id.borrow()
    }
}
impl Mcap_Message {
    pub fn sequence(&self) -> Ref<'_, u32> {
        self.sequence.borrow()
    }
}
impl Mcap_Message {
    pub fn log_time(&self) -> Ref<'_, u64> {
        self.log_time.borrow()
    }
}
impl Mcap_Message {
    pub fn publish_time(&self) -> Ref<'_, u64> {
        self.publish_time.borrow()
    }
}
impl Mcap_Message {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl Mcap_Message {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_MessageIndex {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap_Record>,
    pub _self: SharedType<Self>,
    channel_id: RefCell<u16>,
    len_records: RefCell<u32>,
    records: RefCell<OptRc<Mcap_MessageIndex_MessageIndexEntries>>,
    _io: RefCell<BytesReader>,
    records_raw: RefCell<Vec<u8>>,
}
impl KStruct for Mcap_MessageIndex {
    type Root = Mcap;
    type Parent = Mcap_Record;

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
        *self_rc.channel_id.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.len_records.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.records_raw.borrow_mut() = _io.read_bytes(*self_rc.len_records() as usize)?.into();
        let records_raw = self_rc.records_raw.borrow();
        let _t_records_raw_io = BytesReader::from(records_raw.clone());
        let t = Self::read_into::<BytesReader, Mcap_MessageIndex_MessageIndexEntries>(&_t_records_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.records.borrow_mut() = t;
        Ok(())
    }
}
impl Mcap_MessageIndex {
}
impl Mcap_MessageIndex {
    pub fn channel_id(&self) -> Ref<'_, u16> {
        self.channel_id.borrow()
    }
}
impl Mcap_MessageIndex {
    pub fn len_records(&self) -> Ref<'_, u32> {
        self.len_records.borrow()
    }
}
impl Mcap_MessageIndex {
    pub fn records(&self) -> Ref<'_, OptRc<Mcap_MessageIndex_MessageIndexEntries>> {
        self.records.borrow()
    }
}
impl Mcap_MessageIndex {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Mcap_MessageIndex {
    pub fn records_raw(&self) -> Ref<'_, Vec<u8>> {
        self.records_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_MessageIndex_MessageIndexEntries {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap_MessageIndex>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<Mcap_MessageIndex_MessageIndexEntry>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Mcap_MessageIndex_MessageIndexEntries {
    type Root = Mcap;
    type Parent = Mcap_MessageIndex;

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
        *self_rc.entries.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Mcap_MessageIndex_MessageIndexEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Mcap_MessageIndex_MessageIndexEntries {
}
impl Mcap_MessageIndex_MessageIndexEntries {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Mcap_MessageIndex_MessageIndexEntry>>> {
        self.entries.borrow()
    }
}
impl Mcap_MessageIndex_MessageIndexEntries {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_MessageIndex_MessageIndexEntry {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap_MessageIndex_MessageIndexEntries>,
    pub _self: SharedType<Self>,
    log_time: RefCell<u64>,
    offset: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Mcap_MessageIndex_MessageIndexEntry {
    type Root = Mcap;
    type Parent = Mcap_MessageIndex_MessageIndexEntries;

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
        *self_rc.log_time.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.offset.borrow_mut() = _io.read_u8le()?.into();
        Ok(())
    }
}
impl Mcap_MessageIndex_MessageIndexEntry {
}
impl Mcap_MessageIndex_MessageIndexEntry {
    pub fn log_time(&self) -> Ref<'_, u64> {
        self.log_time.borrow()
    }
}
impl Mcap_MessageIndex_MessageIndexEntry {
    pub fn offset(&self) -> Ref<'_, u64> {
        self.offset.borrow()
    }
}
impl Mcap_MessageIndex_MessageIndexEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_Metadata {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap_Record>,
    pub _self: SharedType<Self>,
    name: RefCell<OptRc<Mcap_PrefixedStr>>,
    metadata: RefCell<OptRc<Mcap_MapStrStr>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Mcap_Metadata {
    type Root = Mcap;
    type Parent = Mcap_Record;

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
        let t = Self::read_into::<_, Mcap_PrefixedStr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.name.borrow_mut() = t;
        let t = Self::read_into::<_, Mcap_MapStrStr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.metadata.borrow_mut() = t;
        Ok(())
    }
}
impl Mcap_Metadata {
}
impl Mcap_Metadata {
    pub fn name(&self) -> Ref<'_, OptRc<Mcap_PrefixedStr>> {
        self.name.borrow()
    }
}
impl Mcap_Metadata {
    pub fn metadata(&self) -> Ref<'_, OptRc<Mcap_MapStrStr>> {
        self.metadata.borrow()
    }
}
impl Mcap_Metadata {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_MetadataIndex {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap_Record>,
    pub _self: SharedType<Self>,
    ofs_metadata: RefCell<u64>,
    len_metadata: RefCell<u64>,
    name: RefCell<OptRc<Mcap_PrefixedStr>>,
    _io: RefCell<BytesReader>,
    metadata_raw: RefCell<Vec<u8>>,
    f_metadata: Cell<bool>,
    metadata: RefCell<OptRc<Mcap_Record>>,
}
impl KStruct for Mcap_MetadataIndex {
    type Root = Mcap;
    type Parent = Mcap_Record;

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
        *self_rc.ofs_metadata.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.len_metadata.borrow_mut() = _io.read_u8le()?.into();
        let t = Self::read_into::<_, Mcap_PrefixedStr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.name.borrow_mut() = t;
        Ok(())
    }
}
impl Mcap_MetadataIndex {
    pub fn metadata(
        &self
    ) -> KResult<Ref<'_, OptRc<Mcap_Record>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_metadata.get() {
            return Ok(self.metadata.borrow());
        }
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.ofs_metadata() as usize)?;
        *self.metadata_raw.borrow_mut() = io.read_bytes(*self.len_metadata() as usize)?.into();
        let metadata_raw = self.metadata_raw.borrow();
        let _t_metadata_raw_io = BytesReader::from(metadata_raw.clone());
        let t = Self::read_into::<BytesReader, Mcap_Record>(&_t_metadata_raw_io, Some(self._root.clone()), None)?.into();
        *self.metadata.borrow_mut() = t;
        io.seek(_pos)?;
        Ok(self.metadata.borrow())
    }
}
impl Mcap_MetadataIndex {
    pub fn ofs_metadata(&self) -> Ref<'_, u64> {
        self.ofs_metadata.borrow()
    }
}
impl Mcap_MetadataIndex {
    pub fn len_metadata(&self) -> Ref<'_, u64> {
        self.len_metadata.borrow()
    }
}
impl Mcap_MetadataIndex {
    pub fn name(&self) -> Ref<'_, OptRc<Mcap_PrefixedStr>> {
        self.name.borrow()
    }
}
impl Mcap_MetadataIndex {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Mcap_MetadataIndex {
    pub fn metadata_raw(&self) -> Ref<'_, Vec<u8>> {
        self.metadata_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_PrefixedStr {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    len_str: RefCell<u32>,
    str: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Mcap_PrefixedStr {
    type Root = Mcap;
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
        *self_rc.len_str.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.str.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.len_str() as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Mcap_PrefixedStr {
}
impl Mcap_PrefixedStr {
    pub fn len_str(&self) -> Ref<'_, u32> {
        self.len_str.borrow()
    }
}
impl Mcap_PrefixedStr {
    pub fn str(&self) -> Ref<'_, String> {
        self.str.borrow()
    }
}
impl Mcap_PrefixedStr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_Record {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    op: RefCell<Mcap_Opcode>,
    len_body: RefCell<u64>,
    body: RefCell<Option<Mcap_Record_Body>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum Mcap_Record_Body {
    Mcap_Chunk(OptRc<Mcap_Chunk>),
    Mcap_Header(OptRc<Mcap_Header>),
    Mcap_Attachment(OptRc<Mcap_Attachment>),
    Mcap_AttachmentIndex(OptRc<Mcap_AttachmentIndex>),
    Mcap_Statistics(OptRc<Mcap_Statistics>),
    Mcap_Message(OptRc<Mcap_Message>),
    Mcap_DataEnd(OptRc<Mcap_DataEnd>),
    Mcap_ChunkIndex(OptRc<Mcap_ChunkIndex>),
    Mcap_Channel(OptRc<Mcap_Channel>),
    Mcap_Footer(OptRc<Mcap_Footer>),
    Mcap_Metadata(OptRc<Mcap_Metadata>),
    Mcap_MessageIndex(OptRc<Mcap_MessageIndex>),
    Mcap_MetadataIndex(OptRc<Mcap_MetadataIndex>),
    Bytes(Vec<u8>),
    Mcap_Schema(OptRc<Mcap_Schema>),
    Mcap_SummaryOffset(OptRc<Mcap_SummaryOffset>),
}
impl From<&Mcap_Record_Body> for OptRc<Mcap_Chunk> {
    fn from(v: &Mcap_Record_Body) -> Self {
        if let Mcap_Record_Body::Mcap_Chunk(x) = v {
            return x.clone();
        }
        panic!("expected Mcap_Record_Body::Mcap_Chunk, got {:?}", v)
    }
}
impl From<OptRc<Mcap_Chunk>> for Mcap_Record_Body {
    fn from(v: OptRc<Mcap_Chunk>) -> Self {
        Self::Mcap_Chunk(v)
    }
}
impl From<&Mcap_Record_Body> for OptRc<Mcap_Header> {
    fn from(v: &Mcap_Record_Body) -> Self {
        if let Mcap_Record_Body::Mcap_Header(x) = v {
            return x.clone();
        }
        panic!("expected Mcap_Record_Body::Mcap_Header, got {:?}", v)
    }
}
impl From<OptRc<Mcap_Header>> for Mcap_Record_Body {
    fn from(v: OptRc<Mcap_Header>) -> Self {
        Self::Mcap_Header(v)
    }
}
impl From<&Mcap_Record_Body> for OptRc<Mcap_Attachment> {
    fn from(v: &Mcap_Record_Body) -> Self {
        if let Mcap_Record_Body::Mcap_Attachment(x) = v {
            return x.clone();
        }
        panic!("expected Mcap_Record_Body::Mcap_Attachment, got {:?}", v)
    }
}
impl From<OptRc<Mcap_Attachment>> for Mcap_Record_Body {
    fn from(v: OptRc<Mcap_Attachment>) -> Self {
        Self::Mcap_Attachment(v)
    }
}
impl From<&Mcap_Record_Body> for OptRc<Mcap_AttachmentIndex> {
    fn from(v: &Mcap_Record_Body) -> Self {
        if let Mcap_Record_Body::Mcap_AttachmentIndex(x) = v {
            return x.clone();
        }
        panic!("expected Mcap_Record_Body::Mcap_AttachmentIndex, got {:?}", v)
    }
}
impl From<OptRc<Mcap_AttachmentIndex>> for Mcap_Record_Body {
    fn from(v: OptRc<Mcap_AttachmentIndex>) -> Self {
        Self::Mcap_AttachmentIndex(v)
    }
}
impl From<&Mcap_Record_Body> for OptRc<Mcap_Statistics> {
    fn from(v: &Mcap_Record_Body) -> Self {
        if let Mcap_Record_Body::Mcap_Statistics(x) = v {
            return x.clone();
        }
        panic!("expected Mcap_Record_Body::Mcap_Statistics, got {:?}", v)
    }
}
impl From<OptRc<Mcap_Statistics>> for Mcap_Record_Body {
    fn from(v: OptRc<Mcap_Statistics>) -> Self {
        Self::Mcap_Statistics(v)
    }
}
impl From<&Mcap_Record_Body> for OptRc<Mcap_Message> {
    fn from(v: &Mcap_Record_Body) -> Self {
        if let Mcap_Record_Body::Mcap_Message(x) = v {
            return x.clone();
        }
        panic!("expected Mcap_Record_Body::Mcap_Message, got {:?}", v)
    }
}
impl From<OptRc<Mcap_Message>> for Mcap_Record_Body {
    fn from(v: OptRc<Mcap_Message>) -> Self {
        Self::Mcap_Message(v)
    }
}
impl From<&Mcap_Record_Body> for OptRc<Mcap_DataEnd> {
    fn from(v: &Mcap_Record_Body) -> Self {
        if let Mcap_Record_Body::Mcap_DataEnd(x) = v {
            return x.clone();
        }
        panic!("expected Mcap_Record_Body::Mcap_DataEnd, got {:?}", v)
    }
}
impl From<OptRc<Mcap_DataEnd>> for Mcap_Record_Body {
    fn from(v: OptRc<Mcap_DataEnd>) -> Self {
        Self::Mcap_DataEnd(v)
    }
}
impl From<&Mcap_Record_Body> for OptRc<Mcap_ChunkIndex> {
    fn from(v: &Mcap_Record_Body) -> Self {
        if let Mcap_Record_Body::Mcap_ChunkIndex(x) = v {
            return x.clone();
        }
        panic!("expected Mcap_Record_Body::Mcap_ChunkIndex, got {:?}", v)
    }
}
impl From<OptRc<Mcap_ChunkIndex>> for Mcap_Record_Body {
    fn from(v: OptRc<Mcap_ChunkIndex>) -> Self {
        Self::Mcap_ChunkIndex(v)
    }
}
impl From<&Mcap_Record_Body> for OptRc<Mcap_Channel> {
    fn from(v: &Mcap_Record_Body) -> Self {
        if let Mcap_Record_Body::Mcap_Channel(x) = v {
            return x.clone();
        }
        panic!("expected Mcap_Record_Body::Mcap_Channel, got {:?}", v)
    }
}
impl From<OptRc<Mcap_Channel>> for Mcap_Record_Body {
    fn from(v: OptRc<Mcap_Channel>) -> Self {
        Self::Mcap_Channel(v)
    }
}
impl From<&Mcap_Record_Body> for OptRc<Mcap_Footer> {
    fn from(v: &Mcap_Record_Body) -> Self {
        if let Mcap_Record_Body::Mcap_Footer(x) = v {
            return x.clone();
        }
        panic!("expected Mcap_Record_Body::Mcap_Footer, got {:?}", v)
    }
}
impl From<OptRc<Mcap_Footer>> for Mcap_Record_Body {
    fn from(v: OptRc<Mcap_Footer>) -> Self {
        Self::Mcap_Footer(v)
    }
}
impl From<&Mcap_Record_Body> for OptRc<Mcap_Metadata> {
    fn from(v: &Mcap_Record_Body) -> Self {
        if let Mcap_Record_Body::Mcap_Metadata(x) = v {
            return x.clone();
        }
        panic!("expected Mcap_Record_Body::Mcap_Metadata, got {:?}", v)
    }
}
impl From<OptRc<Mcap_Metadata>> for Mcap_Record_Body {
    fn from(v: OptRc<Mcap_Metadata>) -> Self {
        Self::Mcap_Metadata(v)
    }
}
impl From<&Mcap_Record_Body> for OptRc<Mcap_MessageIndex> {
    fn from(v: &Mcap_Record_Body) -> Self {
        if let Mcap_Record_Body::Mcap_MessageIndex(x) = v {
            return x.clone();
        }
        panic!("expected Mcap_Record_Body::Mcap_MessageIndex, got {:?}", v)
    }
}
impl From<OptRc<Mcap_MessageIndex>> for Mcap_Record_Body {
    fn from(v: OptRc<Mcap_MessageIndex>) -> Self {
        Self::Mcap_MessageIndex(v)
    }
}
impl From<&Mcap_Record_Body> for OptRc<Mcap_MetadataIndex> {
    fn from(v: &Mcap_Record_Body) -> Self {
        if let Mcap_Record_Body::Mcap_MetadataIndex(x) = v {
            return x.clone();
        }
        panic!("expected Mcap_Record_Body::Mcap_MetadataIndex, got {:?}", v)
    }
}
impl From<OptRc<Mcap_MetadataIndex>> for Mcap_Record_Body {
    fn from(v: OptRc<Mcap_MetadataIndex>) -> Self {
        Self::Mcap_MetadataIndex(v)
    }
}
impl From<&Mcap_Record_Body> for Vec<u8> {
    fn from(v: &Mcap_Record_Body) -> Self {
        if let Mcap_Record_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected Mcap_Record_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for Mcap_Record_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&Mcap_Record_Body> for OptRc<Mcap_Schema> {
    fn from(v: &Mcap_Record_Body) -> Self {
        if let Mcap_Record_Body::Mcap_Schema(x) = v {
            return x.clone();
        }
        panic!("expected Mcap_Record_Body::Mcap_Schema, got {:?}", v)
    }
}
impl From<OptRc<Mcap_Schema>> for Mcap_Record_Body {
    fn from(v: OptRc<Mcap_Schema>) -> Self {
        Self::Mcap_Schema(v)
    }
}
impl From<&Mcap_Record_Body> for OptRc<Mcap_SummaryOffset> {
    fn from(v: &Mcap_Record_Body) -> Self {
        if let Mcap_Record_Body::Mcap_SummaryOffset(x) = v {
            return x.clone();
        }
        panic!("expected Mcap_Record_Body::Mcap_SummaryOffset, got {:?}", v)
    }
}
impl From<OptRc<Mcap_SummaryOffset>> for Mcap_Record_Body {
    fn from(v: OptRc<Mcap_SummaryOffset>) -> Self {
        Self::Mcap_SummaryOffset(v)
    }
}
impl KStruct for Mcap_Record {
    type Root = Mcap;
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
        *self_rc.op.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.len_body.borrow_mut() = _io.read_u8le()?.into();
        match *self_rc.op() {
            Mcap_Opcode::Attachment => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Mcap_Attachment>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Mcap_Opcode::AttachmentIndex => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Mcap_AttachmentIndex>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Mcap_Opcode::Channel => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Mcap_Channel>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Mcap_Opcode::Chunk => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Mcap_Chunk>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Mcap_Opcode::ChunkIndex => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Mcap_ChunkIndex>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Mcap_Opcode::DataEnd => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Mcap_DataEnd>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Mcap_Opcode::Footer => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Mcap_Footer>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Mcap_Opcode::Header => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Mcap_Header>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Mcap_Opcode::Message => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Mcap_Message>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Mcap_Opcode::MessageIndex => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Mcap_MessageIndex>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Mcap_Opcode::Metadata => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Mcap_Metadata>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Mcap_Opcode::MetadataIndex => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Mcap_MetadataIndex>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Mcap_Opcode::Schema => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Mcap_Schema>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Mcap_Opcode::Statistics => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Mcap_Statistics>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Mcap_Opcode::SummaryOffset => {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, Mcap_SummaryOffset>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.body.borrow_mut() = Some(_io.read_bytes(*self_rc.len_body() as usize)?.into());
            }
        }
        Ok(())
    }
}
impl Mcap_Record {
}
impl Mcap_Record {
    pub fn op(&self) -> Ref<'_, Mcap_Opcode> {
        self.op.borrow()
    }
}
impl Mcap_Record {
    pub fn len_body(&self) -> Ref<'_, u64> {
        self.len_body.borrow()
    }
}
impl Mcap_Record {
    pub fn body(&self) -> Ref<'_, Option<Mcap_Record_Body>> {
        self.body.borrow()
    }
}
impl Mcap_Record {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Mcap_Record {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_Records {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    records: RefCell<Vec<OptRc<Mcap_Record>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Mcap_Records {
    type Root = Mcap;
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
        *self_rc.records.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Mcap_Record>(&*_io, Some(self_rc._root.clone()), None)?.into();
                self_rc.records.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Mcap_Records {
}
impl Mcap_Records {
    pub fn records(&self) -> Ref<'_, Vec<OptRc<Mcap_Record>>> {
        self.records.borrow()
    }
}
impl Mcap_Records {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_Schema {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap_Record>,
    pub _self: SharedType<Self>,
    id: RefCell<u16>,
    name: RefCell<OptRc<Mcap_PrefixedStr>>,
    encoding: RefCell<OptRc<Mcap_PrefixedStr>>,
    len_data: RefCell<u32>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Mcap_Schema {
    type Root = Mcap;
    type Parent = Mcap_Record;

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
        *self_rc.id.borrow_mut() = _io.read_u2le()?.into();
        let t = Self::read_into::<_, Mcap_PrefixedStr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.name.borrow_mut() = t;
        let t = Self::read_into::<_, Mcap_PrefixedStr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.encoding.borrow_mut() = t;
        *self_rc.len_data.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.data.borrow_mut() = _io.read_bytes(*self_rc.len_data() as usize)?.into();
        Ok(())
    }
}
impl Mcap_Schema {
}
impl Mcap_Schema {
    pub fn id(&self) -> Ref<'_, u16> {
        self.id.borrow()
    }
}
impl Mcap_Schema {
    pub fn name(&self) -> Ref<'_, OptRc<Mcap_PrefixedStr>> {
        self.name.borrow()
    }
}
impl Mcap_Schema {
    pub fn encoding(&self) -> Ref<'_, OptRc<Mcap_PrefixedStr>> {
        self.encoding.borrow()
    }
}
impl Mcap_Schema {
    pub fn len_data(&self) -> Ref<'_, u32> {
        self.len_data.borrow()
    }
}
impl Mcap_Schema {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl Mcap_Schema {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_Statistics {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap_Record>,
    pub _self: SharedType<Self>,
    message_count: RefCell<u64>,
    schema_count: RefCell<u16>,
    channel_count: RefCell<u32>,
    attachment_count: RefCell<u32>,
    metadata_count: RefCell<u32>,
    chunk_count: RefCell<u32>,
    message_start_time: RefCell<u64>,
    message_end_time: RefCell<u64>,
    len_channel_message_counts: RefCell<u32>,
    channel_message_counts: RefCell<OptRc<Mcap_Statistics_ChannelMessageCounts>>,
    _io: RefCell<BytesReader>,
    channel_message_counts_raw: RefCell<Vec<u8>>,
}
impl KStruct for Mcap_Statistics {
    type Root = Mcap;
    type Parent = Mcap_Record;

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
        *self_rc.message_count.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.schema_count.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.channel_count.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.attachment_count.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.metadata_count.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.chunk_count.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.message_start_time.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.message_end_time.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.len_channel_message_counts.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.channel_message_counts_raw.borrow_mut() = _io.read_bytes(*self_rc.len_channel_message_counts() as usize)?.into();
        let channel_message_counts_raw = self_rc.channel_message_counts_raw.borrow();
        let _t_channel_message_counts_raw_io = BytesReader::from(channel_message_counts_raw.clone());
        let t = Self::read_into::<BytesReader, Mcap_Statistics_ChannelMessageCounts>(&_t_channel_message_counts_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.channel_message_counts.borrow_mut() = t;
        Ok(())
    }
}
impl Mcap_Statistics {
}
impl Mcap_Statistics {
    pub fn message_count(&self) -> Ref<'_, u64> {
        self.message_count.borrow()
    }
}
impl Mcap_Statistics {
    pub fn schema_count(&self) -> Ref<'_, u16> {
        self.schema_count.borrow()
    }
}
impl Mcap_Statistics {
    pub fn channel_count(&self) -> Ref<'_, u32> {
        self.channel_count.borrow()
    }
}
impl Mcap_Statistics {
    pub fn attachment_count(&self) -> Ref<'_, u32> {
        self.attachment_count.borrow()
    }
}
impl Mcap_Statistics {
    pub fn metadata_count(&self) -> Ref<'_, u32> {
        self.metadata_count.borrow()
    }
}
impl Mcap_Statistics {
    pub fn chunk_count(&self) -> Ref<'_, u32> {
        self.chunk_count.borrow()
    }
}
impl Mcap_Statistics {
    pub fn message_start_time(&self) -> Ref<'_, u64> {
        self.message_start_time.borrow()
    }
}
impl Mcap_Statistics {
    pub fn message_end_time(&self) -> Ref<'_, u64> {
        self.message_end_time.borrow()
    }
}
impl Mcap_Statistics {
    pub fn len_channel_message_counts(&self) -> Ref<'_, u32> {
        self.len_channel_message_counts.borrow()
    }
}
impl Mcap_Statistics {
    pub fn channel_message_counts(&self) -> Ref<'_, OptRc<Mcap_Statistics_ChannelMessageCounts>> {
        self.channel_message_counts.borrow()
    }
}
impl Mcap_Statistics {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Mcap_Statistics {
    pub fn channel_message_counts_raw(&self) -> Ref<'_, Vec<u8>> {
        self.channel_message_counts_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_Statistics_ChannelMessageCount {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap_Statistics_ChannelMessageCounts>,
    pub _self: SharedType<Self>,
    channel_id: RefCell<u16>,
    message_count: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Mcap_Statistics_ChannelMessageCount {
    type Root = Mcap;
    type Parent = Mcap_Statistics_ChannelMessageCounts;

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
        *self_rc.channel_id.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.message_count.borrow_mut() = _io.read_u8le()?.into();
        Ok(())
    }
}
impl Mcap_Statistics_ChannelMessageCount {
}
impl Mcap_Statistics_ChannelMessageCount {
    pub fn channel_id(&self) -> Ref<'_, u16> {
        self.channel_id.borrow()
    }
}
impl Mcap_Statistics_ChannelMessageCount {
    pub fn message_count(&self) -> Ref<'_, u64> {
        self.message_count.borrow()
    }
}
impl Mcap_Statistics_ChannelMessageCount {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_Statistics_ChannelMessageCounts {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap_Statistics>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<Mcap_Statistics_ChannelMessageCount>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Mcap_Statistics_ChannelMessageCounts {
    type Root = Mcap;
    type Parent = Mcap_Statistics;

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
        *self_rc.entries.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Mcap_Statistics_ChannelMessageCount>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Mcap_Statistics_ChannelMessageCounts {
}
impl Mcap_Statistics_ChannelMessageCounts {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Mcap_Statistics_ChannelMessageCount>>> {
        self.entries.borrow()
    }
}
impl Mcap_Statistics_ChannelMessageCounts {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_SummaryOffset {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap_Record>,
    pub _self: SharedType<Self>,
    group_opcode: RefCell<Mcap_Opcode>,
    ofs_group: RefCell<u64>,
    len_group: RefCell<u64>,
    _io: RefCell<BytesReader>,
    group_raw: RefCell<Vec<u8>>,
    f_group: Cell<bool>,
    group: RefCell<OptRc<Mcap_Records>>,
}
impl KStruct for Mcap_SummaryOffset {
    type Root = Mcap;
    type Parent = Mcap_Record;

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
        *self_rc.group_opcode.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.ofs_group.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.len_group.borrow_mut() = _io.read_u8le()?.into();
        Ok(())
    }
}
impl Mcap_SummaryOffset {
    pub fn group(
        &self
    ) -> KResult<Ref<'_, OptRc<Mcap_Records>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_group.get() {
            return Ok(self.group.borrow());
        }
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.ofs_group() as usize)?;
        *self.group_raw.borrow_mut() = io.read_bytes(*self.len_group() as usize)?.into();
        let group_raw = self.group_raw.borrow();
        let _t_group_raw_io = BytesReader::from(group_raw.clone());
        let t = Self::read_into::<BytesReader, Mcap_Records>(&_t_group_raw_io, Some(self._root.clone()), None)?.into();
        *self.group.borrow_mut() = t;
        io.seek(_pos)?;
        Ok(self.group.borrow())
    }
}
impl Mcap_SummaryOffset {
    pub fn group_opcode(&self) -> Ref<'_, Mcap_Opcode> {
        self.group_opcode.borrow()
    }
}
impl Mcap_SummaryOffset {
    pub fn ofs_group(&self) -> Ref<'_, u64> {
        self.ofs_group.borrow()
    }
}
impl Mcap_SummaryOffset {
    pub fn len_group(&self) -> Ref<'_, u64> {
        self.len_group.borrow()
    }
}
impl Mcap_SummaryOffset {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Mcap_SummaryOffset {
    pub fn group_raw(&self) -> Ref<'_, Vec<u8>> {
        self.group_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Mcap_TupleStrStr {
    pub _root: SharedType<Mcap>,
    pub _parent: SharedType<Mcap_MapStrStr_Entries>,
    pub _self: SharedType<Self>,
    key: RefCell<OptRc<Mcap_PrefixedStr>>,
    value: RefCell<OptRc<Mcap_PrefixedStr>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Mcap_TupleStrStr {
    type Root = Mcap;
    type Parent = Mcap_MapStrStr_Entries;

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
        let t = Self::read_into::<_, Mcap_PrefixedStr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.key.borrow_mut() = t;
        let t = Self::read_into::<_, Mcap_PrefixedStr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.value.borrow_mut() = t;
        Ok(())
    }
}
impl Mcap_TupleStrStr {
}
impl Mcap_TupleStrStr {
    pub fn key(&self) -> Ref<'_, OptRc<Mcap_PrefixedStr>> {
        self.key.borrow()
    }
}
impl Mcap_TupleStrStr {
    pub fn value(&self) -> Ref<'_, OptRc<Mcap_PrefixedStr>> {
        self.value.borrow()
    }
}
impl Mcap_TupleStrStr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

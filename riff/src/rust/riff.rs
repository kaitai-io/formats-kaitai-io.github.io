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
 * The Resource Interchange File Format (RIFF) is a generic file container format
 * for storing data in tagged chunks. It is primarily used to store multimedia
 * such as sound and video, though it may also be used to store any arbitrary data.
 * 
 * The Microsoft implementation is mostly known through container formats
 * like AVI, ANI and WAV, which use RIFF as their basis.
 * \sa https://www.johnloomis.org/cpe102/asgn/asgn1/riff.html Source
 */

#[derive(Default, Debug, Clone)]
pub struct Riff {
    pub _root: SharedType<Riff>,
    pub _parent: SharedType<Riff>,
    pub _self: SharedType<Self>,
    chunk: RefCell<OptRc<Riff_Chunk>>,
    _io: RefCell<BytesReader>,
    f_chunk_id: Cell<bool>,
    chunk_id: RefCell<Riff_Fourcc>,
    f_is_riff_chunk: Cell<bool>,
    is_riff_chunk: RefCell<bool>,
    f_parent_chunk_data: Cell<bool>,
    parent_chunk_data: RefCell<OptRc<Riff_ParentChunkData>>,
    f_subchunks: Cell<bool>,
    subchunks: RefCell<Vec<OptRc<Riff_ChunkType>>>,
}
impl KStruct for Riff {
    type Root = Riff;
    type Parent = Riff;

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
        let t = Self::read_into::<_, Riff_Chunk>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.chunk.borrow_mut() = t;
        Ok(())
    }
}
impl Riff {
    pub fn chunk_id(
        &self
    ) -> KResult<Ref<'_, Riff_Fourcc>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_chunk_id.get() {
            return Ok(self.chunk_id.borrow());
        }
        self.f_chunk_id.set(true);
        *self.chunk_id.borrow_mut() = (*self.chunk().id() as i64).try_into()?;
        Ok(self.chunk_id.borrow())
    }
    pub fn is_riff_chunk(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_riff_chunk.get() {
            return Ok(self.is_riff_chunk.borrow());
        }
        self.f_is_riff_chunk.set(true);
        *self.is_riff_chunk.borrow_mut() = (*self.chunk_id()? == Riff_Fourcc::Riff) as bool;
        Ok(self.is_riff_chunk.borrow())
    }
    pub fn parent_chunk_data(
        &self
    ) -> KResult<Ref<'_, OptRc<Riff_ParentChunkData>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_parent_chunk_data.get() {
            return Ok(self.parent_chunk_data.borrow());
        }
        if *self.is_riff_chunk()? {
            let io = Clone::clone(&*self.chunk().data_slot()._io());
            let _pos = io.pos();
            io.seek(0 as usize)?;
            let t = Self::read_into::<BytesReader, Riff_ParentChunkData>(&io, Some(self._root.clone()), None)?.into();
            *self.parent_chunk_data.borrow_mut() = t;
            io.seek(_pos)?;
        }
        Ok(self.parent_chunk_data.borrow())
    }
    pub fn subchunks(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<Riff_ChunkType>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_subchunks.get() {
            return Ok(self.subchunks.borrow());
        }
        self.f_subchunks.set(true);
        if *self.is_riff_chunk()? {
            let io = Clone::clone(&*self.parent_chunk_data()?.subchunks_slot()._io());
            let _pos = io.pos();
            io.seek(0 as usize)?;
            *self.subchunks.borrow_mut() = Vec::new();
            {
                let mut _i = 0;
                while !_io.is_eof() {
                    let t = Self::read_into::<BytesReader, Riff_ChunkType>(&io, Some(self._root.clone()), None)?.into();
                    self.subchunks.borrow_mut().push(t);
                    _i += 1;
                }
            }
            io.seek(_pos)?;
        }
        Ok(self.subchunks.borrow())
    }
}
impl Riff {
    pub fn chunk(&self) -> Ref<'_, OptRc<Riff_Chunk>> {
        self.chunk.borrow()
    }
}
impl Riff {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Riff_Fourcc {
    Riff,
    Info,
    List,
    Unknown(i64),
}

impl TryFrom<i64> for Riff_Fourcc {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Riff_Fourcc> {
        match flag {
            1179011410 => Ok(Riff_Fourcc::Riff),
            1330007625 => Ok(Riff_Fourcc::Info),
            1414744396 => Ok(Riff_Fourcc::List),
            _ => Ok(Riff_Fourcc::Unknown(flag)),
        }
    }
}

impl From<&Riff_Fourcc> for i64 {
    fn from(v: &Riff_Fourcc) -> Self {
        match *v {
            Riff_Fourcc::Riff => 1179011410,
            Riff_Fourcc::Info => 1330007625,
            Riff_Fourcc::List => 1414744396,
            Riff_Fourcc::Unknown(v) => v
        }
    }
}

impl Default for Riff_Fourcc {
    fn default() -> Self { Riff_Fourcc::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Riff_Chunk {
    pub _root: SharedType<Riff>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    id: RefCell<u32>,
    len: RefCell<u32>,
    data_slot: RefCell<OptRc<Riff_Chunk_Slot>>,
    pad_byte: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    data_slot_raw: RefCell<Vec<u8>>,
}
impl KStruct for Riff_Chunk {
    type Root = Riff;
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
        *self_rc.id.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.data_slot_raw.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
        let data_slot_raw = self_rc.data_slot_raw.borrow();
        let _t_data_slot_raw_io = BytesReader::from(data_slot_raw.clone());
        let t = Self::read_into::<BytesReader, Riff_Chunk_Slot>(&_t_data_slot_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.data_slot.borrow_mut() = t;
        *self_rc.pad_byte.borrow_mut() = _io.read_bytes(((*self_rc.len() as u32) % (2 as u32)) as usize)?.into();
        Ok(())
    }
}
impl Riff_Chunk {
}
impl Riff_Chunk {
    pub fn id(&self) -> Ref<'_, u32> {
        self.id.borrow()
    }
}
impl Riff_Chunk {
    pub fn len(&self) -> Ref<'_, u32> {
        self.len.borrow()
    }
}
impl Riff_Chunk {
    pub fn data_slot(&self) -> Ref<'_, OptRc<Riff_Chunk_Slot>> {
        self.data_slot.borrow()
    }
}
impl Riff_Chunk {
    pub fn pad_byte(&self) -> Ref<'_, Vec<u8>> {
        self.pad_byte.borrow()
    }
}
impl Riff_Chunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Riff_Chunk {
    pub fn data_slot_raw(&self) -> Ref<'_, Vec<u8>> {
        self.data_slot_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Riff_Chunk_Slot {
    pub _root: SharedType<Riff>,
    pub _parent: SharedType<Riff_Chunk>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Riff_Chunk_Slot {
    type Root = Riff;
    type Parent = Riff_Chunk;

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
impl Riff_Chunk_Slot {
}
impl Riff_Chunk_Slot {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Riff_ChunkType {
    pub _root: SharedType<Riff>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    save_chunk_ofs: RefCell<Vec<u8>>,
    chunk: RefCell<OptRc<Riff_Chunk>>,
    _io: RefCell<BytesReader>,
    f_chunk_data: Cell<bool>,
    chunk_data: RefCell<Option<Riff_ChunkType_ChunkData>>,
    f_chunk_id: Cell<bool>,
    chunk_id: RefCell<Riff_Fourcc>,
    f_chunk_id_readable: Cell<bool>,
    chunk_id_readable: RefCell<String>,
    f_chunk_ofs: Cell<bool>,
    chunk_ofs: RefCell<i32>,
}
#[derive(Debug, Clone)]
pub enum Riff_ChunkType_ChunkData {
    Riff_ListChunkData(OptRc<Riff_ListChunkData>),
}
impl From<&Riff_ChunkType_ChunkData> for OptRc<Riff_ListChunkData> {
    fn from(v: &Riff_ChunkType_ChunkData) -> Self {
        if let Riff_ChunkType_ChunkData::Riff_ListChunkData(x) = v {
            return x.clone();
        }
        panic!("expected Riff_ChunkType_ChunkData::Riff_ListChunkData, got {:?}", v)
    }
}
impl From<OptRc<Riff_ListChunkData>> for Riff_ChunkType_ChunkData {
    fn from(v: OptRc<Riff_ListChunkData>) -> Self {
        Self::Riff_ListChunkData(v)
    }
}
impl Riff_ChunkType_ChunkData {
    pub fn save_parent_chunk_data_ofs(&self) -> Ref<'_, Vec<u8>> {
        match self {
            Riff_ChunkType_ChunkData::Riff_ListChunkData(x) => x.save_parent_chunk_data_ofs.borrow(),
        }
    }
}
impl Riff_ChunkType_ChunkData {
    pub fn parent_chunk_data(&self) -> OptRc<Riff_ParentChunkData> {
        match self {
            Riff_ChunkType_ChunkData::Riff_ListChunkData(x) => x.parent_chunk_data.borrow().clone(),
        }
    }
}
impl KStruct for Riff_ChunkType {
    type Root = Riff;
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
        if ((*self_rc.chunk_ofs()? as i32) < (0 as i32)) {
            *self_rc.save_chunk_ofs.borrow_mut() = _io.read_bytes(0 as usize)?.into();
        }
        let t = Self::read_into::<_, Riff_Chunk>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.chunk.borrow_mut() = t;
        Ok(())
    }
}
impl Riff_ChunkType {
    pub fn chunk_data(
        &self
    ) -> KResult<Ref<'_, Option<Riff_ChunkType_ChunkData>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_chunk_data.get() {
            return Ok(self.chunk_data.borrow());
        }
        self.f_chunk_data.set(true);
        let io = Clone::clone(&*self.chunk().data_slot()._io());
        let _pos = io.pos();
        io.seek(0 as usize)?;
        match *self.chunk_id()? {
            Riff_Fourcc::List => {
                let t = Self::read_into::<BytesReader, Riff_ListChunkData>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.chunk_data.borrow_mut() = Some(t);
            }
            _ => {}
        }
        io.seek(_pos)?;
        Ok(self.chunk_data.borrow())
    }
    pub fn chunk_id(
        &self
    ) -> KResult<Ref<'_, Riff_Fourcc>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_chunk_id.get() {
            return Ok(self.chunk_id.borrow());
        }
        self.f_chunk_id.set(true);
        *self.chunk_id.borrow_mut() = (*self.chunk().id() as i64).try_into()?;
        Ok(self.chunk_id.borrow())
    }
    pub fn chunk_id_readable(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_chunk_id_readable.get() {
            return Ok(self.chunk_id_readable.borrow());
        }
        self.f_chunk_id_readable.set(true);
        let _pos = _io.pos();
        _io.seek(*self.chunk_ofs()? as usize)?;
        *self.chunk_id_readable.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "ASCII")?;
        _io.seek(_pos)?;
        Ok(self.chunk_id_readable.borrow())
    }
    pub fn chunk_ofs(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_chunk_ofs.get() {
            return Ok(self.chunk_ofs.borrow());
        }
        self.f_chunk_ofs.set(true);
        *self.chunk_ofs.borrow_mut() = (_io.pos()) as i32;
        Ok(self.chunk_ofs.borrow())
    }
}
impl Riff_ChunkType {
    pub fn save_chunk_ofs(&self) -> Ref<'_, Vec<u8>> {
        self.save_chunk_ofs.borrow()
    }
}
impl Riff_ChunkType {
    pub fn chunk(&self) -> Ref<'_, OptRc<Riff_Chunk>> {
        self.chunk.borrow()
    }
}
impl Riff_ChunkType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * All registered subchunks in the INFO chunk are NULL-terminated strings,
 * but the unregistered might not be. By convention, the registered
 * chunk IDs are in uppercase and the unregistered IDs are in lowercase.
 * 
 * If the chunk ID of an INFO subchunk contains a lowercase
 * letter, this chunk is considered as unregistered and thus we can make
 * no assumptions about the type of data.
 */

#[derive(Default, Debug, Clone)]
pub struct Riff_InfoSubchunk {
    pub _root: SharedType<Riff>,
    pub _parent: SharedType<Riff_ListChunkData>,
    pub _self: SharedType<Self>,
    save_chunk_ofs: RefCell<Vec<u8>>,
    chunk: RefCell<OptRc<Riff_Chunk>>,
    _io: RefCell<BytesReader>,
    f_chunk_data: Cell<bool>,
    chunk_data: RefCell<Option<Riff_InfoSubchunk_ChunkData>>,
    f_chunk_id_readable: Cell<bool>,
    chunk_id_readable: RefCell<String>,
    f_chunk_ofs: Cell<bool>,
    chunk_ofs: RefCell<i32>,
    f_id_chars: Cell<bool>,
    id_chars: RefCell<Vec<u8>>,
    f_is_unregistered_tag: Cell<bool>,
    is_unregistered_tag: RefCell<bool>,
}
#[derive(Debug, Clone)]
pub enum Riff_InfoSubchunk_ChunkData {
    String(String),
}
impl From<&Riff_InfoSubchunk_ChunkData> for String {
    fn from(v: &Riff_InfoSubchunk_ChunkData) -> Self {
        if let Riff_InfoSubchunk_ChunkData::String(x) = v {
            return x.clone();
        }
        panic!("expected Riff_InfoSubchunk_ChunkData::String, got {:?}", v)
    }
}
impl From<String> for Riff_InfoSubchunk_ChunkData {
    fn from(v: String) -> Self {
        Self::String(v)
    }
}
impl KStruct for Riff_InfoSubchunk {
    type Root = Riff;
    type Parent = Riff_ListChunkData;

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
        if ((*self_rc.chunk_ofs()? as i32) < (0 as i32)) {
            *self_rc.save_chunk_ofs.borrow_mut() = _io.read_bytes(0 as usize)?.into();
        }
        let t = Self::read_into::<_, Riff_Chunk>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.chunk.borrow_mut() = t;
        Ok(())
    }
}
impl Riff_InfoSubchunk {
    pub fn chunk_data(
        &self
    ) -> KResult<Ref<'_, Option<Riff_InfoSubchunk_ChunkData>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_chunk_data.get() {
            return Ok(self.chunk_data.borrow());
        }
        self.f_chunk_data.set(true);
        let io = Clone::clone(&*self.chunk().data_slot()._io());
        let _pos = io.pos();
        io.seek(0 as usize)?;
        {
            let on = self.is_unregistered_tag()?;
            if *on == false {
                *self.chunk_data.borrow_mut() = Some(bytes_to_str(&io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?);
            }
        }
        io.seek(_pos)?;
        Ok(self.chunk_data.borrow())
    }
    pub fn chunk_id_readable(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_chunk_id_readable.get() {
            return Ok(self.chunk_id_readable.borrow());
        }
        self.f_chunk_id_readable.set(true);
        *self.chunk_id_readable.borrow_mut() = bytes_to_str(&*self.id_chars()?, "ASCII")?.to_string();
        Ok(self.chunk_id_readable.borrow())
    }
    pub fn chunk_ofs(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_chunk_ofs.get() {
            return Ok(self.chunk_ofs.borrow());
        }
        self.f_chunk_ofs.set(true);
        *self.chunk_ofs.borrow_mut() = (_io.pos()) as i32;
        Ok(self.chunk_ofs.borrow())
    }
    pub fn id_chars(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_id_chars.get() {
            return Ok(self.id_chars.borrow());
        }
        self.f_id_chars.set(true);
        let _pos = _io.pos();
        _io.seek(*self.chunk_ofs()? as usize)?;
        *self.id_chars.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.id_chars.borrow())
    }

    /**
     * Check if chunk_id contains lowercase characters ([a-z], ASCII 97 = a, ASCII 122 = z).
     */
    pub fn is_unregistered_tag(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_unregistered_tag.get() {
            return Ok(self.is_unregistered_tag.borrow());
        }
        self.f_is_unregistered_tag.set(true);
        *self.is_unregistered_tag.borrow_mut() = ( (( ((((self.id_chars()?[0 as usize] as u8) >= (97 as u8))) && (((self.id_chars()?[0 as usize] as u8) <= (122 as u8)))) ) || ( ((((self.id_chars()?[1 as usize] as u8) >= (97 as u8))) && (((self.id_chars()?[1 as usize] as u8) <= (122 as u8)))) ) || ( ((((self.id_chars()?[2 as usize] as u8) >= (97 as u8))) && (((self.id_chars()?[2 as usize] as u8) <= (122 as u8)))) ) || ( ((((self.id_chars()?[3 as usize] as u8) >= (97 as u8))) && (((self.id_chars()?[3 as usize] as u8) <= (122 as u8)))) )) ) as bool;
        Ok(self.is_unregistered_tag.borrow())
    }
}
impl Riff_InfoSubchunk {
    pub fn save_chunk_ofs(&self) -> Ref<'_, Vec<u8>> {
        self.save_chunk_ofs.borrow()
    }
}
impl Riff_InfoSubchunk {
    pub fn chunk(&self) -> Ref<'_, OptRc<Riff_Chunk>> {
        self.chunk.borrow()
    }
}
impl Riff_InfoSubchunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Riff_ListChunkData {
    pub _root: SharedType<Riff>,
    pub _parent: SharedType<Riff_ChunkType>,
    pub _self: SharedType<Self>,
    save_parent_chunk_data_ofs: RefCell<Vec<u8>>,
    parent_chunk_data: RefCell<OptRc<Riff_ParentChunkData>>,
    _io: RefCell<BytesReader>,
    f_form_type: Cell<bool>,
    form_type: RefCell<Riff_Fourcc>,
    f_form_type_readable: Cell<bool>,
    form_type_readable: RefCell<String>,
    f_parent_chunk_data_ofs: Cell<bool>,
    parent_chunk_data_ofs: RefCell<i32>,
    f_subchunks: Cell<bool>,
    subchunks: RefCell<Vec<Riff_ListChunkData_Subchunks>>,
}
impl KStruct for Riff_ListChunkData {
    type Root = Riff;
    type Parent = Riff_ChunkType;

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
        if ((*self_rc.parent_chunk_data_ofs()? as i32) < (0 as i32)) {
            *self_rc.save_parent_chunk_data_ofs.borrow_mut() = _io.read_bytes(0 as usize)?.into();
        }
        let t = Self::read_into::<_, Riff_ParentChunkData>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.parent_chunk_data.borrow_mut() = t;
        Ok(())
    }
}
impl Riff_ListChunkData {
    pub fn form_type(
        &self
    ) -> KResult<Ref<'_, Riff_Fourcc>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_form_type.get() {
            return Ok(self.form_type.borrow());
        }
        self.f_form_type.set(true);
        *self.form_type.borrow_mut() = (*self.parent_chunk_data().form_type() as i64).try_into()?;
        Ok(self.form_type.borrow())
    }
    pub fn form_type_readable(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_form_type_readable.get() {
            return Ok(self.form_type_readable.borrow());
        }
        self.f_form_type_readable.set(true);
        let _pos = _io.pos();
        _io.seek(*self.parent_chunk_data_ofs()? as usize)?;
        *self.form_type_readable.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "ASCII")?;
        _io.seek(_pos)?;
        Ok(self.form_type_readable.borrow())
    }
    pub fn parent_chunk_data_ofs(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_parent_chunk_data_ofs.get() {
            return Ok(self.parent_chunk_data_ofs.borrow());
        }
        self.f_parent_chunk_data_ofs.set(true);
        *self.parent_chunk_data_ofs.borrow_mut() = (_io.pos()) as i32;
        Ok(self.parent_chunk_data_ofs.borrow())
    }
    pub fn subchunks(
        &self
    ) -> KResult<Ref<'_, Vec<Riff_ListChunkData_Subchunks>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_subchunks.get() {
            return Ok(self.subchunks.borrow());
        }
        self.f_subchunks.set(true);
        let io = Clone::clone(&*self.parent_chunk_data().subchunks_slot()._io());
        let _pos = io.pos();
        io.seek(0 as usize)?;
        *self.subchunks.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                match *self.form_type()? {
                    Riff_Fourcc::Info => {
                        let t = Self::read_into::<BytesReader, Riff_InfoSubchunk>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                        self.subchunks.borrow_mut().push(t);
                    }
                    _ => {
                        let t = Self::read_into::<BytesReader, Riff_ChunkType>(&io, Some(self._root.clone()), None)?.into();
                        self.subchunks.borrow_mut().push(t);
                    }
                }
                _i += 1;
            }
        }
        io.seek(_pos)?;
        Ok(self.subchunks.borrow())
    }
}
impl Riff_ListChunkData {
    pub fn save_parent_chunk_data_ofs(&self) -> Ref<'_, Vec<u8>> {
        self.save_parent_chunk_data_ofs.borrow()
    }
}
impl Riff_ListChunkData {
    pub fn parent_chunk_data(&self) -> Ref<'_, OptRc<Riff_ParentChunkData>> {
        self.parent_chunk_data.borrow()
    }
}
impl Riff_ListChunkData {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Riff_ParentChunkData {
    pub _root: SharedType<Riff>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    form_type: RefCell<u32>,
    subchunks_slot: RefCell<OptRc<Riff_ParentChunkData_Slot>>,
    _io: RefCell<BytesReader>,
    subchunks_slot_raw: RefCell<Vec<u8>>,
}
impl KStruct for Riff_ParentChunkData {
    type Root = Riff;
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
        *self_rc.form_type.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.subchunks_slot_raw.borrow_mut() = _io.read_bytes_full()?.into();
        let subchunks_slot_raw = self_rc.subchunks_slot_raw.borrow();
        let _t_subchunks_slot_raw_io = BytesReader::from(subchunks_slot_raw.clone());
        let t = Self::read_into::<BytesReader, Riff_ParentChunkData_Slot>(&_t_subchunks_slot_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.subchunks_slot.borrow_mut() = t;
        Ok(())
    }
}
impl Riff_ParentChunkData {
}
impl Riff_ParentChunkData {
    pub fn form_type(&self) -> Ref<'_, u32> {
        self.form_type.borrow()
    }
}
impl Riff_ParentChunkData {
    pub fn subchunks_slot(&self) -> Ref<'_, OptRc<Riff_ParentChunkData_Slot>> {
        self.subchunks_slot.borrow()
    }
}
impl Riff_ParentChunkData {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Riff_ParentChunkData {
    pub fn subchunks_slot_raw(&self) -> Ref<'_, Vec<u8>> {
        self.subchunks_slot_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Riff_ParentChunkData_Slot {
    pub _root: SharedType<Riff>,
    pub _parent: SharedType<Riff_ParentChunkData>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Riff_ParentChunkData_Slot {
    type Root = Riff;
    type Parent = Riff_ParentChunkData;

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
impl Riff_ParentChunkData_Slot {
}
impl Riff_ParentChunkData_Slot {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

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
 * glTF is a format for distribution of 3D models optimized for being used in software
 * \sa https://github.com/KhronosGroup/glTF/tree/2354846/specification/2.0#binary-gltf-layout Source
 */

#[derive(Default, Debug, Clone)]
pub struct GltfBinary {
    pub _root: SharedType<GltfBinary>,
    pub _parent: SharedType<GltfBinary>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<GltfBinary_Header>>,
    chunks: RefCell<Vec<OptRc<GltfBinary_Chunk>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for GltfBinary {
    type Root = GltfBinary;
    type Parent = GltfBinary;

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
        let t = Self::read_into::<_, GltfBinary_Header>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        *self_rc.chunks.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, GltfBinary_Chunk>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.chunks.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl GltfBinary {
}
impl GltfBinary {
    pub fn header(&self) -> Ref<'_, OptRc<GltfBinary_Header>> {
        self.header.borrow()
    }
}
impl GltfBinary {
    pub fn chunks(&self) -> Ref<'_, Vec<OptRc<GltfBinary_Chunk>>> {
        self.chunks.borrow()
    }
}
impl GltfBinary {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum GltfBinary_ChunkType {
    Bin,
    Json,
    Unknown(i64),
}

impl TryFrom<i64> for GltfBinary_ChunkType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<GltfBinary_ChunkType> {
        match flag {
            5130562 => Ok(GltfBinary_ChunkType::Bin),
            1313821514 => Ok(GltfBinary_ChunkType::Json),
            _ => Ok(GltfBinary_ChunkType::Unknown(flag)),
        }
    }
}

impl From<&GltfBinary_ChunkType> for i64 {
    fn from(v: &GltfBinary_ChunkType) -> Self {
        match *v {
            GltfBinary_ChunkType::Bin => 5130562,
            GltfBinary_ChunkType::Json => 1313821514,
            GltfBinary_ChunkType::Unknown(v) => v
        }
    }
}

impl Default for GltfBinary_ChunkType {
    fn default() -> Self { GltfBinary_ChunkType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct GltfBinary_Bin {
    pub _root: SharedType<GltfBinary>,
    pub _parent: SharedType<GltfBinary_Chunk>,
    pub _self: SharedType<Self>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for GltfBinary_Bin {
    type Root = GltfBinary;
    type Parent = GltfBinary_Chunk;

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
        *self_rc.data.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl GltfBinary_Bin {
}
impl GltfBinary_Bin {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl GltfBinary_Bin {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct GltfBinary_Chunk {
    pub _root: SharedType<GltfBinary>,
    pub _parent: SharedType<GltfBinary>,
    pub _self: SharedType<Self>,
    len_data: RefCell<u32>,
    type: RefCell<GltfBinary_ChunkType>,
    data: RefCell<Option<GltfBinary_Chunk_Data>>,
    _io: RefCell<BytesReader>,
    data_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum GltfBinary_Chunk_Data {
    GltfBinary_Bin(OptRc<GltfBinary_Bin>),
    GltfBinary_Json(OptRc<GltfBinary_Json>),
    Bytes(Vec<u8>),
}
impl From<&GltfBinary_Chunk_Data> for OptRc<GltfBinary_Bin> {
    fn from(v: &GltfBinary_Chunk_Data) -> Self {
        if let GltfBinary_Chunk_Data::GltfBinary_Bin(x) = v {
            return x.clone();
        }
        panic!("expected GltfBinary_Chunk_Data::GltfBinary_Bin, got {:?}", v)
    }
}
impl From<OptRc<GltfBinary_Bin>> for GltfBinary_Chunk_Data {
    fn from(v: OptRc<GltfBinary_Bin>) -> Self {
        Self::GltfBinary_Bin(v)
    }
}
impl From<&GltfBinary_Chunk_Data> for OptRc<GltfBinary_Json> {
    fn from(v: &GltfBinary_Chunk_Data) -> Self {
        if let GltfBinary_Chunk_Data::GltfBinary_Json(x) = v {
            return x.clone();
        }
        panic!("expected GltfBinary_Chunk_Data::GltfBinary_Json, got {:?}", v)
    }
}
impl From<OptRc<GltfBinary_Json>> for GltfBinary_Chunk_Data {
    fn from(v: OptRc<GltfBinary_Json>) -> Self {
        Self::GltfBinary_Json(v)
    }
}
impl From<&GltfBinary_Chunk_Data> for Vec<u8> {
    fn from(v: &GltfBinary_Chunk_Data) -> Self {
        if let GltfBinary_Chunk_Data::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected GltfBinary_Chunk_Data::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for GltfBinary_Chunk_Data {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl KStruct for GltfBinary_Chunk {
    type Root = GltfBinary;
    type Parent = GltfBinary;

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
        *self_rc.len_data.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.type.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        match *self_rc.type() {
            GltfBinary_ChunkType::Bin => {
                *self_rc.data_raw.borrow_mut() = _io.read_bytes(*self_rc.len_data() as usize)?.into();
                let data_raw = self_rc.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, GltfBinary_Bin>(&_t_data_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.data.borrow_mut() = Some(t);
            }
            GltfBinary_ChunkType::Json => {
                *self_rc.data_raw.borrow_mut() = _io.read_bytes(*self_rc.len_data() as usize)?.into();
                let data_raw = self_rc.data_raw.borrow();
                let _t_data_raw_io = BytesReader::from(data_raw.clone());
                let t = Self::read_into::<BytesReader, GltfBinary_Json>(&_t_data_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.data.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.data.borrow_mut() = Some(_io.read_bytes(*self_rc.len_data() as usize)?.into());
            }
        }
        Ok(())
    }
}
impl GltfBinary_Chunk {
}
impl GltfBinary_Chunk {
    pub fn len_data(&self) -> Ref<'_, u32> {
        self.len_data.borrow()
    }
}
impl GltfBinary_Chunk {
    pub fn type(&self) -> Ref<'_, GltfBinary_ChunkType> {
        self.type.borrow()
    }
}
impl GltfBinary_Chunk {
    pub fn data(&self) -> Ref<'_, Option<GltfBinary_Chunk_Data>> {
        self.data.borrow()
    }
}
impl GltfBinary_Chunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl GltfBinary_Chunk {
    pub fn data_raw(&self) -> Ref<'_, Vec<u8>> {
        self.data_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct GltfBinary_Header {
    pub _root: SharedType<GltfBinary>,
    pub _parent: SharedType<GltfBinary>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    version: RefCell<u32>,
    length: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for GltfBinary_Header {
    type Root = GltfBinary;
    type Parent = GltfBinary;

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
        if !(*self_rc.magic() == vec![0x67u8, 0x6cu8, 0x54u8, 0x46u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/seq/0".to_string() }));
        }
        *self_rc.version.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.length.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl GltfBinary_Header {
}
impl GltfBinary_Header {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}

/**
 * Indicates the version of the Binary glTF container format.
 * For this specification, should be set to 2.
 */
impl GltfBinary_Header {
    pub fn version(&self) -> Ref<'_, u32> {
        self.version.borrow()
    }
}

/**
 * Total length of the Binary glTF, including Header and all Chunks, in bytes.
 */
impl GltfBinary_Header {
    pub fn length(&self) -> Ref<'_, u32> {
        self.length.borrow()
    }
}
impl GltfBinary_Header {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct GltfBinary_Json {
    pub _root: SharedType<GltfBinary>,
    pub _parent: SharedType<GltfBinary_Chunk>,
    pub _self: SharedType<Self>,
    data: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for GltfBinary_Json {
    type Root = GltfBinary;
    type Parent = GltfBinary_Chunk;

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
        *self_rc.data.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "UTF-8")?;
        Ok(())
    }
}
impl GltfBinary_Json {
}

/**
 * This is where GLB deviates from being an elegant format.
 * To parse the rest of the file, you have to parse the JSON first.
 */
impl GltfBinary_Json {
    pub fn data(&self) -> Ref<'_, String> {
        self.data.borrow()
    }
}
impl GltfBinary_Json {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

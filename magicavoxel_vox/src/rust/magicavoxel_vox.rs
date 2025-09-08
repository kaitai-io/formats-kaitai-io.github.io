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
 * \sa https://ephtracy.github.io/ MagicaVoxel Homepage
 * \sa https://github.com/ephtracy/voxel-model/blob/master/MagicaVoxel-file-format-vox.txt Format Description
 */

#[derive(Default, Debug, Clone)]
pub struct MagicavoxelVox {
    pub _root: SharedType<MagicavoxelVox>,
    pub _parent: SharedType<MagicavoxelVox>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    version: RefCell<u32>,
    main: RefCell<OptRc<MagicavoxelVox_Chunk>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MagicavoxelVox {
    type Root = MagicavoxelVox;
    type Parent = MagicavoxelVox;

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
        if !(*self_rc.magic() == vec![0x56u8, 0x4fu8, 0x58u8, 0x20u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.version.borrow_mut() = _io.read_u4le()?.into();
        let t = Self::read_into::<_, MagicavoxelVox_Chunk>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.main.borrow_mut() = t;
        Ok(())
    }
}
impl MagicavoxelVox {
}
impl MagicavoxelVox {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}

/**
 * 150 expected
 */
impl MagicavoxelVox {
    pub fn version(&self) -> Ref<'_, u32> {
        self.version.borrow()
    }
}
impl MagicavoxelVox {
    pub fn main(&self) -> Ref<'_, OptRc<MagicavoxelVox_Chunk>> {
        self.main.borrow()
    }
}
impl MagicavoxelVox {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum MagicavoxelVox_ChunkType {
    Main,
    Matt,
    Pack,
    Rgba,
    Size,
    Xyzi,
    Unknown(i64),
}

impl TryFrom<i64> for MagicavoxelVox_ChunkType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MagicavoxelVox_ChunkType> {
        match flag {
            1296124238 => Ok(MagicavoxelVox_ChunkType::Main),
            1296127060 => Ok(MagicavoxelVox_ChunkType::Matt),
            1346454347 => Ok(MagicavoxelVox_ChunkType::Pack),
            1380401729 => Ok(MagicavoxelVox_ChunkType::Rgba),
            1397316165 => Ok(MagicavoxelVox_ChunkType::Size),
            1482250825 => Ok(MagicavoxelVox_ChunkType::Xyzi),
            _ => Ok(MagicavoxelVox_ChunkType::Unknown(flag)),
        }
    }
}

impl From<&MagicavoxelVox_ChunkType> for i64 {
    fn from(v: &MagicavoxelVox_ChunkType) -> Self {
        match *v {
            MagicavoxelVox_ChunkType::Main => 1296124238,
            MagicavoxelVox_ChunkType::Matt => 1296127060,
            MagicavoxelVox_ChunkType::Pack => 1346454347,
            MagicavoxelVox_ChunkType::Rgba => 1380401729,
            MagicavoxelVox_ChunkType::Size => 1397316165,
            MagicavoxelVox_ChunkType::Xyzi => 1482250825,
            MagicavoxelVox_ChunkType::Unknown(v) => v
        }
    }
}

impl Default for MagicavoxelVox_ChunkType {
    fn default() -> Self { MagicavoxelVox_ChunkType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum MagicavoxelVox_MaterialType {
    Diffuse,
    Metal,
    Glass,
    Emissive,
    Unknown(i64),
}

impl TryFrom<i64> for MagicavoxelVox_MaterialType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MagicavoxelVox_MaterialType> {
        match flag {
            0 => Ok(MagicavoxelVox_MaterialType::Diffuse),
            1 => Ok(MagicavoxelVox_MaterialType::Metal),
            2 => Ok(MagicavoxelVox_MaterialType::Glass),
            3 => Ok(MagicavoxelVox_MaterialType::Emissive),
            _ => Ok(MagicavoxelVox_MaterialType::Unknown(flag)),
        }
    }
}

impl From<&MagicavoxelVox_MaterialType> for i64 {
    fn from(v: &MagicavoxelVox_MaterialType) -> Self {
        match *v {
            MagicavoxelVox_MaterialType::Diffuse => 0,
            MagicavoxelVox_MaterialType::Metal => 1,
            MagicavoxelVox_MaterialType::Glass => 2,
            MagicavoxelVox_MaterialType::Emissive => 3,
            MagicavoxelVox_MaterialType::Unknown(v) => v
        }
    }
}

impl Default for MagicavoxelVox_MaterialType {
    fn default() -> Self { MagicavoxelVox_MaterialType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum MagicavoxelVox_PropertyBitsType {
    Plastic,
    Roughness,
    Specular,
    Ior,
    Attenuation,
    Power,
    Glow,
    IsTotalPower,
    Unknown(i64),
}

impl TryFrom<i64> for MagicavoxelVox_PropertyBitsType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MagicavoxelVox_PropertyBitsType> {
        match flag {
            1 => Ok(MagicavoxelVox_PropertyBitsType::Plastic),
            2 => Ok(MagicavoxelVox_PropertyBitsType::Roughness),
            4 => Ok(MagicavoxelVox_PropertyBitsType::Specular),
            8 => Ok(MagicavoxelVox_PropertyBitsType::Ior),
            16 => Ok(MagicavoxelVox_PropertyBitsType::Attenuation),
            32 => Ok(MagicavoxelVox_PropertyBitsType::Power),
            64 => Ok(MagicavoxelVox_PropertyBitsType::Glow),
            128 => Ok(MagicavoxelVox_PropertyBitsType::IsTotalPower),
            _ => Ok(MagicavoxelVox_PropertyBitsType::Unknown(flag)),
        }
    }
}

impl From<&MagicavoxelVox_PropertyBitsType> for i64 {
    fn from(v: &MagicavoxelVox_PropertyBitsType) -> Self {
        match *v {
            MagicavoxelVox_PropertyBitsType::Plastic => 1,
            MagicavoxelVox_PropertyBitsType::Roughness => 2,
            MagicavoxelVox_PropertyBitsType::Specular => 4,
            MagicavoxelVox_PropertyBitsType::Ior => 8,
            MagicavoxelVox_PropertyBitsType::Attenuation => 16,
            MagicavoxelVox_PropertyBitsType::Power => 32,
            MagicavoxelVox_PropertyBitsType::Glow => 64,
            MagicavoxelVox_PropertyBitsType::IsTotalPower => 128,
            MagicavoxelVox_PropertyBitsType::Unknown(v) => v
        }
    }
}

impl Default for MagicavoxelVox_PropertyBitsType {
    fn default() -> Self { MagicavoxelVox_PropertyBitsType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct MagicavoxelVox_Chunk {
    pub _root: SharedType<MagicavoxelVox>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    chunk_id: RefCell<MagicavoxelVox_ChunkType>,
    num_bytes_of_chunk_content: RefCell<u32>,
    num_bytes_of_children_chunks: RefCell<u32>,
    chunk_content: RefCell<Option<MagicavoxelVox_Chunk_ChunkContent>>,
    children_chunks: RefCell<Vec<OptRc<MagicavoxelVox_Chunk>>>,
    _io: RefCell<BytesReader>,
    chunk_content_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum MagicavoxelVox_Chunk_ChunkContent {
    MagicavoxelVox_Size(OptRc<MagicavoxelVox_Size>),
    MagicavoxelVox_Pack(OptRc<MagicavoxelVox_Pack>),
    MagicavoxelVox_Rgba(OptRc<MagicavoxelVox_Rgba>),
    MagicavoxelVox_Xyzi(OptRc<MagicavoxelVox_Xyzi>),
    Bytes(Vec<u8>),
    MagicavoxelVox_Matt(OptRc<MagicavoxelVox_Matt>),
}
impl From<&MagicavoxelVox_Chunk_ChunkContent> for OptRc<MagicavoxelVox_Size> {
    fn from(v: &MagicavoxelVox_Chunk_ChunkContent) -> Self {
        if let MagicavoxelVox_Chunk_ChunkContent::MagicavoxelVox_Size(x) = v {
            return x.clone();
        }
        panic!("expected MagicavoxelVox_Chunk_ChunkContent::MagicavoxelVox_Size, got {:?}", v)
    }
}
impl From<OptRc<MagicavoxelVox_Size>> for MagicavoxelVox_Chunk_ChunkContent {
    fn from(v: OptRc<MagicavoxelVox_Size>) -> Self {
        Self::MagicavoxelVox_Size(v)
    }
}
impl From<&MagicavoxelVox_Chunk_ChunkContent> for OptRc<MagicavoxelVox_Pack> {
    fn from(v: &MagicavoxelVox_Chunk_ChunkContent) -> Self {
        if let MagicavoxelVox_Chunk_ChunkContent::MagicavoxelVox_Pack(x) = v {
            return x.clone();
        }
        panic!("expected MagicavoxelVox_Chunk_ChunkContent::MagicavoxelVox_Pack, got {:?}", v)
    }
}
impl From<OptRc<MagicavoxelVox_Pack>> for MagicavoxelVox_Chunk_ChunkContent {
    fn from(v: OptRc<MagicavoxelVox_Pack>) -> Self {
        Self::MagicavoxelVox_Pack(v)
    }
}
impl From<&MagicavoxelVox_Chunk_ChunkContent> for OptRc<MagicavoxelVox_Rgba> {
    fn from(v: &MagicavoxelVox_Chunk_ChunkContent) -> Self {
        if let MagicavoxelVox_Chunk_ChunkContent::MagicavoxelVox_Rgba(x) = v {
            return x.clone();
        }
        panic!("expected MagicavoxelVox_Chunk_ChunkContent::MagicavoxelVox_Rgba, got {:?}", v)
    }
}
impl From<OptRc<MagicavoxelVox_Rgba>> for MagicavoxelVox_Chunk_ChunkContent {
    fn from(v: OptRc<MagicavoxelVox_Rgba>) -> Self {
        Self::MagicavoxelVox_Rgba(v)
    }
}
impl From<&MagicavoxelVox_Chunk_ChunkContent> for OptRc<MagicavoxelVox_Xyzi> {
    fn from(v: &MagicavoxelVox_Chunk_ChunkContent) -> Self {
        if let MagicavoxelVox_Chunk_ChunkContent::MagicavoxelVox_Xyzi(x) = v {
            return x.clone();
        }
        panic!("expected MagicavoxelVox_Chunk_ChunkContent::MagicavoxelVox_Xyzi, got {:?}", v)
    }
}
impl From<OptRc<MagicavoxelVox_Xyzi>> for MagicavoxelVox_Chunk_ChunkContent {
    fn from(v: OptRc<MagicavoxelVox_Xyzi>) -> Self {
        Self::MagicavoxelVox_Xyzi(v)
    }
}
impl From<&MagicavoxelVox_Chunk_ChunkContent> for Vec<u8> {
    fn from(v: &MagicavoxelVox_Chunk_ChunkContent) -> Self {
        if let MagicavoxelVox_Chunk_ChunkContent::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected MagicavoxelVox_Chunk_ChunkContent::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for MagicavoxelVox_Chunk_ChunkContent {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&MagicavoxelVox_Chunk_ChunkContent> for OptRc<MagicavoxelVox_Matt> {
    fn from(v: &MagicavoxelVox_Chunk_ChunkContent) -> Self {
        if let MagicavoxelVox_Chunk_ChunkContent::MagicavoxelVox_Matt(x) = v {
            return x.clone();
        }
        panic!("expected MagicavoxelVox_Chunk_ChunkContent::MagicavoxelVox_Matt, got {:?}", v)
    }
}
impl From<OptRc<MagicavoxelVox_Matt>> for MagicavoxelVox_Chunk_ChunkContent {
    fn from(v: OptRc<MagicavoxelVox_Matt>) -> Self {
        Self::MagicavoxelVox_Matt(v)
    }
}
impl KStruct for MagicavoxelVox_Chunk {
    type Root = MagicavoxelVox;
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
        *self_rc.chunk_id.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        *self_rc.num_bytes_of_chunk_content.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_bytes_of_children_chunks.borrow_mut() = _io.read_u4le()?.into();
        if ((*self_rc.num_bytes_of_chunk_content() as u32) != (0 as u32)) {
            match *self_rc.chunk_id() {
                MagicavoxelVox_ChunkType::Matt => {
                    *self_rc.chunk_content_raw.borrow_mut() = _io.read_bytes(*self_rc.num_bytes_of_chunk_content() as usize)?.into();
                    let chunk_content_raw = self_rc.chunk_content_raw.borrow();
                    let _t_chunk_content_raw_io = BytesReader::from(chunk_content_raw.clone());
                    let t = Self::read_into::<BytesReader, MagicavoxelVox_Matt>(&_t_chunk_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.chunk_content.borrow_mut() = Some(t);
                }
                MagicavoxelVox_ChunkType::Pack => {
                    *self_rc.chunk_content_raw.borrow_mut() = _io.read_bytes(*self_rc.num_bytes_of_chunk_content() as usize)?.into();
                    let chunk_content_raw = self_rc.chunk_content_raw.borrow();
                    let _t_chunk_content_raw_io = BytesReader::from(chunk_content_raw.clone());
                    let t = Self::read_into::<BytesReader, MagicavoxelVox_Pack>(&_t_chunk_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.chunk_content.borrow_mut() = Some(t);
                }
                MagicavoxelVox_ChunkType::Rgba => {
                    *self_rc.chunk_content_raw.borrow_mut() = _io.read_bytes(*self_rc.num_bytes_of_chunk_content() as usize)?.into();
                    let chunk_content_raw = self_rc.chunk_content_raw.borrow();
                    let _t_chunk_content_raw_io = BytesReader::from(chunk_content_raw.clone());
                    let t = Self::read_into::<BytesReader, MagicavoxelVox_Rgba>(&_t_chunk_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.chunk_content.borrow_mut() = Some(t);
                }
                MagicavoxelVox_ChunkType::Size => {
                    *self_rc.chunk_content_raw.borrow_mut() = _io.read_bytes(*self_rc.num_bytes_of_chunk_content() as usize)?.into();
                    let chunk_content_raw = self_rc.chunk_content_raw.borrow();
                    let _t_chunk_content_raw_io = BytesReader::from(chunk_content_raw.clone());
                    let t = Self::read_into::<BytesReader, MagicavoxelVox_Size>(&_t_chunk_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.chunk_content.borrow_mut() = Some(t);
                }
                MagicavoxelVox_ChunkType::Xyzi => {
                    *self_rc.chunk_content_raw.borrow_mut() = _io.read_bytes(*self_rc.num_bytes_of_chunk_content() as usize)?.into();
                    let chunk_content_raw = self_rc.chunk_content_raw.borrow();
                    let _t_chunk_content_raw_io = BytesReader::from(chunk_content_raw.clone());
                    let t = Self::read_into::<BytesReader, MagicavoxelVox_Xyzi>(&_t_chunk_content_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.chunk_content.borrow_mut() = Some(t);
                }
                _ => {
                    *self_rc.chunk_content.borrow_mut() = Some(_io.read_bytes(*self_rc.num_bytes_of_chunk_content() as usize)?.into());
                }
            }
        }
        if ((*self_rc.num_bytes_of_children_chunks() as u32) != (0 as u32)) {
            *self_rc.children_chunks.borrow_mut() = Vec::new();
            {
                let mut _i = 0;
                while !_io.is_eof() {
                    let t = Self::read_into::<_, MagicavoxelVox_Chunk>(&*_io, Some(self_rc._root.clone()), None)?.into();
                    self_rc.children_chunks.borrow_mut().push(t);
                    _i += 1;
                }
            }
        }
        Ok(())
    }
}
impl MagicavoxelVox_Chunk {
}
impl MagicavoxelVox_Chunk {
    pub fn chunk_id(&self) -> Ref<'_, MagicavoxelVox_ChunkType> {
        self.chunk_id.borrow()
    }
}
impl MagicavoxelVox_Chunk {
    pub fn num_bytes_of_chunk_content(&self) -> Ref<'_, u32> {
        self.num_bytes_of_chunk_content.borrow()
    }
}
impl MagicavoxelVox_Chunk {
    pub fn num_bytes_of_children_chunks(&self) -> Ref<'_, u32> {
        self.num_bytes_of_children_chunks.borrow()
    }
}
impl MagicavoxelVox_Chunk {
    pub fn chunk_content(&self) -> Ref<'_, Option<MagicavoxelVox_Chunk_ChunkContent>> {
        self.chunk_content.borrow()
    }
}
impl MagicavoxelVox_Chunk {
    pub fn children_chunks(&self) -> Ref<'_, Vec<OptRc<MagicavoxelVox_Chunk>>> {
        self.children_chunks.borrow()
    }
}
impl MagicavoxelVox_Chunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl MagicavoxelVox_Chunk {
    pub fn chunk_content_raw(&self) -> Ref<'_, Vec<u8>> {
        self.chunk_content_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MagicavoxelVox_Color {
    pub _root: SharedType<MagicavoxelVox>,
    pub _parent: SharedType<MagicavoxelVox_Rgba>,
    pub _self: SharedType<Self>,
    r: RefCell<u8>,
    g: RefCell<u8>,
    b: RefCell<u8>,
    a: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MagicavoxelVox_Color {
    type Root = MagicavoxelVox;
    type Parent = MagicavoxelVox_Rgba;

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
        *self_rc.r.borrow_mut() = _io.read_u1()?.into();
        *self_rc.g.borrow_mut() = _io.read_u1()?.into();
        *self_rc.b.borrow_mut() = _io.read_u1()?.into();
        *self_rc.a.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl MagicavoxelVox_Color {
}
impl MagicavoxelVox_Color {
    pub fn r(&self) -> Ref<'_, u8> {
        self.r.borrow()
    }
}
impl MagicavoxelVox_Color {
    pub fn g(&self) -> Ref<'_, u8> {
        self.g.borrow()
    }
}
impl MagicavoxelVox_Color {
    pub fn b(&self) -> Ref<'_, u8> {
        self.b.borrow()
    }
}
impl MagicavoxelVox_Color {
    pub fn a(&self) -> Ref<'_, u8> {
        self.a.borrow()
    }
}
impl MagicavoxelVox_Color {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MagicavoxelVox_Matt {
    pub _root: SharedType<MagicavoxelVox>,
    pub _parent: SharedType<MagicavoxelVox_Chunk>,
    pub _self: SharedType<Self>,
    id: RefCell<u32>,
    material_type: RefCell<MagicavoxelVox_MaterialType>,
    material_weight: RefCell<f32>,
    property_bits: RefCell<u32>,
    plastic: RefCell<f32>,
    roughness: RefCell<f32>,
    specular: RefCell<f32>,
    ior: RefCell<f32>,
    attenuation: RefCell<f32>,
    power: RefCell<f32>,
    glow: RefCell<f32>,
    is_total_power: RefCell<f32>,
    _io: RefCell<BytesReader>,
    f_has_attenuation: Cell<bool>,
    has_attenuation: RefCell<bool>,
    f_has_glow: Cell<bool>,
    has_glow: RefCell<bool>,
    f_has_ior: Cell<bool>,
    has_ior: RefCell<bool>,
    f_has_is_total_power: Cell<bool>,
    has_is_total_power: RefCell<bool>,
    f_has_plastic: Cell<bool>,
    has_plastic: RefCell<bool>,
    f_has_power: Cell<bool>,
    has_power: RefCell<bool>,
    f_has_roughness: Cell<bool>,
    has_roughness: RefCell<bool>,
    f_has_specular: Cell<bool>,
    has_specular: RefCell<bool>,
}
impl KStruct for MagicavoxelVox_Matt {
    type Root = MagicavoxelVox;
    type Parent = MagicavoxelVox_Chunk;

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
        *self_rc.material_type.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        *self_rc.material_weight.borrow_mut() = _io.read_f4le()?.into();
        *self_rc.property_bits.borrow_mut() = _io.read_u4le()?.into();
        if *self_rc.has_plastic()? {
            *self_rc.plastic.borrow_mut() = _io.read_f4le()?.into();
        }
        if *self_rc.has_roughness()? {
            *self_rc.roughness.borrow_mut() = _io.read_f4le()?.into();
        }
        if *self_rc.has_specular()? {
            *self_rc.specular.borrow_mut() = _io.read_f4le()?.into();
        }
        if *self_rc.has_ior()? {
            *self_rc.ior.borrow_mut() = _io.read_f4le()?.into();
        }
        if *self_rc.has_attenuation()? {
            *self_rc.attenuation.borrow_mut() = _io.read_f4le()?.into();
        }
        if *self_rc.has_power()? {
            *self_rc.power.borrow_mut() = _io.read_f4le()?.into();
        }
        if *self_rc.has_glow()? {
            *self_rc.glow.borrow_mut() = _io.read_f4le()?.into();
        }
        if *self_rc.has_is_total_power()? {
            *self_rc.is_total_power.borrow_mut() = _io.read_f4le()?.into();
        }
        Ok(())
    }
}
impl MagicavoxelVox_Matt {
    pub fn has_attenuation(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_attenuation.get() {
            return Ok(self.has_attenuation.borrow());
        }
        self.f_has_attenuation.set(true);
        *self.has_attenuation.borrow_mut() = (((((*self.property_bits() as u32) & (16 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.has_attenuation.borrow())
    }
    pub fn has_glow(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_glow.get() {
            return Ok(self.has_glow.borrow());
        }
        self.f_has_glow.set(true);
        *self.has_glow.borrow_mut() = (((((*self.property_bits() as u32) & (64 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.has_glow.borrow())
    }
    pub fn has_ior(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_ior.get() {
            return Ok(self.has_ior.borrow());
        }
        self.f_has_ior.set(true);
        *self.has_ior.borrow_mut() = (((((*self.property_bits() as u32) & (8 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.has_ior.borrow())
    }
    pub fn has_is_total_power(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_is_total_power.get() {
            return Ok(self.has_is_total_power.borrow());
        }
        self.f_has_is_total_power.set(true);
        *self.has_is_total_power.borrow_mut() = (((((*self.property_bits() as u32) & (128 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.has_is_total_power.borrow())
    }
    pub fn has_plastic(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_plastic.get() {
            return Ok(self.has_plastic.borrow());
        }
        self.f_has_plastic.set(true);
        *self.has_plastic.borrow_mut() = (((((*self.property_bits() as u32) & (1 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.has_plastic.borrow())
    }
    pub fn has_power(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_power.get() {
            return Ok(self.has_power.borrow());
        }
        self.f_has_power.set(true);
        *self.has_power.borrow_mut() = (((((*self.property_bits() as u32) & (32 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.has_power.borrow())
    }
    pub fn has_roughness(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_roughness.get() {
            return Ok(self.has_roughness.borrow());
        }
        self.f_has_roughness.set(true);
        *self.has_roughness.borrow_mut() = (((((*self.property_bits() as u32) & (2 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.has_roughness.borrow())
    }
    pub fn has_specular(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_specular.get() {
            return Ok(self.has_specular.borrow());
        }
        self.f_has_specular.set(true);
        *self.has_specular.borrow_mut() = (((((*self.property_bits() as u32) & (4 as u32)) as i32) != (0 as i32))) as bool;
        Ok(self.has_specular.borrow())
    }
}
impl MagicavoxelVox_Matt {
    pub fn id(&self) -> Ref<'_, u32> {
        self.id.borrow()
    }
}
impl MagicavoxelVox_Matt {
    pub fn material_type(&self) -> Ref<'_, MagicavoxelVox_MaterialType> {
        self.material_type.borrow()
    }
}
impl MagicavoxelVox_Matt {
    pub fn material_weight(&self) -> Ref<'_, f32> {
        self.material_weight.borrow()
    }
}
impl MagicavoxelVox_Matt {
    pub fn property_bits(&self) -> Ref<'_, u32> {
        self.property_bits.borrow()
    }
}
impl MagicavoxelVox_Matt {
    pub fn plastic(&self) -> Ref<'_, f32> {
        self.plastic.borrow()
    }
}
impl MagicavoxelVox_Matt {
    pub fn roughness(&self) -> Ref<'_, f32> {
        self.roughness.borrow()
    }
}
impl MagicavoxelVox_Matt {
    pub fn specular(&self) -> Ref<'_, f32> {
        self.specular.borrow()
    }
}
impl MagicavoxelVox_Matt {
    pub fn ior(&self) -> Ref<'_, f32> {
        self.ior.borrow()
    }
}
impl MagicavoxelVox_Matt {
    pub fn attenuation(&self) -> Ref<'_, f32> {
        self.attenuation.borrow()
    }
}
impl MagicavoxelVox_Matt {
    pub fn power(&self) -> Ref<'_, f32> {
        self.power.borrow()
    }
}
impl MagicavoxelVox_Matt {
    pub fn glow(&self) -> Ref<'_, f32> {
        self.glow.borrow()
    }
}
impl MagicavoxelVox_Matt {
    pub fn is_total_power(&self) -> Ref<'_, f32> {
        self.is_total_power.borrow()
    }
}
impl MagicavoxelVox_Matt {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MagicavoxelVox_Pack {
    pub _root: SharedType<MagicavoxelVox>,
    pub _parent: SharedType<MagicavoxelVox_Chunk>,
    pub _self: SharedType<Self>,
    num_models: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MagicavoxelVox_Pack {
    type Root = MagicavoxelVox;
    type Parent = MagicavoxelVox_Chunk;

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
        *self_rc.num_models.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl MagicavoxelVox_Pack {
}
impl MagicavoxelVox_Pack {
    pub fn num_models(&self) -> Ref<'_, u32> {
        self.num_models.borrow()
    }
}
impl MagicavoxelVox_Pack {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MagicavoxelVox_Rgba {
    pub _root: SharedType<MagicavoxelVox>,
    pub _parent: SharedType<MagicavoxelVox_Chunk>,
    pub _self: SharedType<Self>,
    colors: RefCell<Vec<OptRc<MagicavoxelVox_Color>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MagicavoxelVox_Rgba {
    type Root = MagicavoxelVox;
    type Parent = MagicavoxelVox_Chunk;

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
        *self_rc.colors.borrow_mut() = Vec::new();
        let l_colors = 256;
        for _i in 0..l_colors {
            let t = Self::read_into::<_, MagicavoxelVox_Color>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.colors.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl MagicavoxelVox_Rgba {
}
impl MagicavoxelVox_Rgba {
    pub fn colors(&self) -> Ref<'_, Vec<OptRc<MagicavoxelVox_Color>>> {
        self.colors.borrow()
    }
}
impl MagicavoxelVox_Rgba {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MagicavoxelVox_Size {
    pub _root: SharedType<MagicavoxelVox>,
    pub _parent: SharedType<MagicavoxelVox_Chunk>,
    pub _self: SharedType<Self>,
    size_x: RefCell<u32>,
    size_y: RefCell<u32>,
    size_z: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MagicavoxelVox_Size {
    type Root = MagicavoxelVox;
    type Parent = MagicavoxelVox_Chunk;

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
        *self_rc.size_x.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.size_y.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.size_z.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl MagicavoxelVox_Size {
}
impl MagicavoxelVox_Size {
    pub fn size_x(&self) -> Ref<'_, u32> {
        self.size_x.borrow()
    }
}
impl MagicavoxelVox_Size {
    pub fn size_y(&self) -> Ref<'_, u32> {
        self.size_y.borrow()
    }
}
impl MagicavoxelVox_Size {
    pub fn size_z(&self) -> Ref<'_, u32> {
        self.size_z.borrow()
    }
}
impl MagicavoxelVox_Size {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MagicavoxelVox_Voxel {
    pub _root: SharedType<MagicavoxelVox>,
    pub _parent: SharedType<MagicavoxelVox_Xyzi>,
    pub _self: SharedType<Self>,
    x: RefCell<u8>,
    y: RefCell<u8>,
    z: RefCell<u8>,
    color_index: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MagicavoxelVox_Voxel {
    type Root = MagicavoxelVox;
    type Parent = MagicavoxelVox_Xyzi;

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
        *self_rc.x.borrow_mut() = _io.read_u1()?.into();
        *self_rc.y.borrow_mut() = _io.read_u1()?.into();
        *self_rc.z.borrow_mut() = _io.read_u1()?.into();
        *self_rc.color_index.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl MagicavoxelVox_Voxel {
}
impl MagicavoxelVox_Voxel {
    pub fn x(&self) -> Ref<'_, u8> {
        self.x.borrow()
    }
}
impl MagicavoxelVox_Voxel {
    pub fn y(&self) -> Ref<'_, u8> {
        self.y.borrow()
    }
}
impl MagicavoxelVox_Voxel {
    pub fn z(&self) -> Ref<'_, u8> {
        self.z.borrow()
    }
}
impl MagicavoxelVox_Voxel {
    pub fn color_index(&self) -> Ref<'_, u8> {
        self.color_index.borrow()
    }
}
impl MagicavoxelVox_Voxel {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MagicavoxelVox_Xyzi {
    pub _root: SharedType<MagicavoxelVox>,
    pub _parent: SharedType<MagicavoxelVox_Chunk>,
    pub _self: SharedType<Self>,
    num_voxels: RefCell<u32>,
    voxels: RefCell<Vec<OptRc<MagicavoxelVox_Voxel>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MagicavoxelVox_Xyzi {
    type Root = MagicavoxelVox;
    type Parent = MagicavoxelVox_Chunk;

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
        *self_rc.num_voxels.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.voxels.borrow_mut() = Vec::new();
        let l_voxels = *self_rc.num_voxels();
        for _i in 0..l_voxels {
            let t = Self::read_into::<_, MagicavoxelVox_Voxel>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.voxels.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl MagicavoxelVox_Xyzi {
}
impl MagicavoxelVox_Xyzi {
    pub fn num_voxels(&self) -> Ref<'_, u32> {
        self.num_voxels.borrow()
    }
}
impl MagicavoxelVox_Xyzi {
    pub fn voxels(&self) -> Ref<'_, Vec<OptRc<MagicavoxelVox_Voxel>>> {
        self.voxels.borrow()
    }
}
impl MagicavoxelVox_Xyzi {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

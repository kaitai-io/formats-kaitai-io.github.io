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
 * Blender is an open source suite for 3D modelling, sculpting,
 * animation, compositing, rendering, preparation of assets for its own
 * game engine and exporting to others, etc. `.blend` is its own binary
 * format that saves whole state of suite: current scene, animations,
 * all software settings, extensions, etc.
 * 
 * Internally, .blend format is a hybrid semi-self-descriptive
 * format. On top level, it contains a simple header and a sequence of
 * file blocks, which more or less follow typical [TLV
 * pattern](https://en.wikipedia.org/wiki/Type-length-value). Pre-last
 * block would be a structure with code `DNA1`, which is a essentially
 * a machine-readable schema of all other structures used in this file.
 */

#[derive(Default, Debug, Clone)]
pub struct BlenderBlend {
    pub _root: SharedType<BlenderBlend>,
    pub _parent: SharedType<BlenderBlend>,
    pub _self: SharedType<Self>,
    hdr: RefCell<OptRc<BlenderBlend_Header>>,
    blocks: RefCell<Vec<OptRc<BlenderBlend_FileBlock>>>,
    _io: RefCell<BytesReader>,
    f_sdna_structs: Cell<bool>,
    sdna_structs: RefCell<Vec<OptRc<BlenderBlend_DnaStruct>>>,
}
impl KStruct for BlenderBlend {
    type Root = BlenderBlend;
    type Parent = BlenderBlend;

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
        let t = Self::read_into::<_, BlenderBlend_Header>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.hdr.borrow_mut() = t;
        *self_rc.blocks.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, BlenderBlend_FileBlock>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.blocks.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl BlenderBlend {
    pub fn sdna_structs(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<BlenderBlend_DnaStruct>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_sdna_structs.get() {
            return Ok(self.sdna_structs.borrow());
        }
        self.f_sdna_structs.set(true);
        *self.sdna_structs.borrow_mut() = Into::<OptRc<BlenderBlend_Dna1Body>>::into(&*self.blocks()[((self.blocks().len() as i32) - (2 as i32)) as usize].body().as_ref().unwrap()).structs().to_vec();
        Ok(self.sdna_structs.borrow())
    }
}
impl BlenderBlend {
    pub fn hdr(&self) -> Ref<'_, OptRc<BlenderBlend_Header>> {
        self.hdr.borrow()
    }
}
impl BlenderBlend {
    pub fn blocks(&self) -> Ref<'_, Vec<OptRc<BlenderBlend_FileBlock>>> {
        self.blocks.borrow()
    }
}
impl BlenderBlend {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum BlenderBlend_Endian {
    Be,
    Le,
    Unknown(i64),
}

impl TryFrom<i64> for BlenderBlend_Endian {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<BlenderBlend_Endian> {
        match flag {
            86 => Ok(BlenderBlend_Endian::Be),
            118 => Ok(BlenderBlend_Endian::Le),
            _ => Ok(BlenderBlend_Endian::Unknown(flag)),
        }
    }
}

impl From<&BlenderBlend_Endian> for i64 {
    fn from(v: &BlenderBlend_Endian) -> Self {
        match *v {
            BlenderBlend_Endian::Be => 86,
            BlenderBlend_Endian::Le => 118,
            BlenderBlend_Endian::Unknown(v) => v
        }
    }
}

impl Default for BlenderBlend_Endian {
    fn default() -> Self { BlenderBlend_Endian::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum BlenderBlend_PtrSize {
    Bits64,
    Bits32,
    Unknown(i64),
}

impl TryFrom<i64> for BlenderBlend_PtrSize {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<BlenderBlend_PtrSize> {
        match flag {
            45 => Ok(BlenderBlend_PtrSize::Bits64),
            95 => Ok(BlenderBlend_PtrSize::Bits32),
            _ => Ok(BlenderBlend_PtrSize::Unknown(flag)),
        }
    }
}

impl From<&BlenderBlend_PtrSize> for i64 {
    fn from(v: &BlenderBlend_PtrSize) -> Self {
        match *v {
            BlenderBlend_PtrSize::Bits64 => 45,
            BlenderBlend_PtrSize::Bits32 => 95,
            BlenderBlend_PtrSize::Unknown(v) => v
        }
    }
}

impl Default for BlenderBlend_PtrSize {
    fn default() -> Self { BlenderBlend_PtrSize::Unknown(0) }
}


/**
 * DNA1, also known as "Structure DNA", is a special block in
 * .blend file, which contains machine-readable specifications of
 * all other structures used in this .blend file.
 * 
 * Effectively, this block contains:
 * 
 * * a sequence of "names" (strings which represent field names)
 * * a sequence of "types" (strings which represent type name)
 * * a sequence of "type lengths"
 * * a sequence of "structs" (which describe contents of every
 *   structure, referring to types and names by index)
 * \sa https://archive.blender.org/wiki/index.php/Dev:Source/Architecture/File_Format/#Structure_DNA Source
 */

#[derive(Default, Debug, Clone)]
pub struct BlenderBlend_Dna1Body {
    pub _root: SharedType<BlenderBlend>,
    pub _parent: SharedType<BlenderBlend_FileBlock>,
    pub _self: SharedType<Self>,
    id: RefCell<Vec<u8>>,
    name_magic: RefCell<Vec<u8>>,
    num_names: RefCell<u32>,
    names: RefCell<Vec<String>>,
    padding_1: RefCell<Vec<u8>>,
    type_magic: RefCell<Vec<u8>>,
    num_types: RefCell<u32>,
    types: RefCell<Vec<String>>,
    padding_2: RefCell<Vec<u8>>,
    tlen_magic: RefCell<Vec<u8>>,
    lengths: RefCell<Vec<u16>>,
    padding_3: RefCell<Vec<u8>>,
    strc_magic: RefCell<Vec<u8>>,
    num_structs: RefCell<u32>,
    structs: RefCell<Vec<OptRc<BlenderBlend_DnaStruct>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for BlenderBlend_Dna1Body {
    type Root = BlenderBlend;
    type Parent = BlenderBlend_FileBlock;

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
        *self_rc.id.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.id() == vec![0x53u8, 0x44u8, 0x4eu8, 0x41u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/dna1_body/seq/0".to_string() }));
        }
        *self_rc.name_magic.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.name_magic() == vec![0x4eu8, 0x41u8, 0x4du8, 0x45u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/dna1_body/seq/1".to_string() }));
        }
        *self_rc.num_names.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.names.borrow_mut() = Vec::new();
        let l_names = *self_rc.num_names();
        for _i in 0..l_names {
            self_rc.names.borrow_mut().push(bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?);
        }
        *self_rc.padding_1.borrow_mut() = _io.read_bytes(modulo(((4 as i32) - (_io.pos() as i32)) as i64, 4 as i64) as usize)?.into();
        *self_rc.type_magic.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.type_magic() == vec![0x54u8, 0x59u8, 0x50u8, 0x45u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/dna1_body/seq/5".to_string() }));
        }
        *self_rc.num_types.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.types.borrow_mut() = Vec::new();
        let l_types = *self_rc.num_types();
        for _i in 0..l_types {
            self_rc.types.borrow_mut().push(bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?);
        }
        *self_rc.padding_2.borrow_mut() = _io.read_bytes(modulo(((4 as i32) - (_io.pos() as i32)) as i64, 4 as i64) as usize)?.into();
        *self_rc.tlen_magic.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.tlen_magic() == vec![0x54u8, 0x4cu8, 0x45u8, 0x4eu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/dna1_body/seq/9".to_string() }));
        }
        *self_rc.lengths.borrow_mut() = Vec::new();
        let l_lengths = *self_rc.num_types();
        for _i in 0..l_lengths {
            self_rc.lengths.borrow_mut().push(_io.read_u2le()?.into());
        }
        *self_rc.padding_3.borrow_mut() = _io.read_bytes(modulo(((4 as i32) - (_io.pos() as i32)) as i64, 4 as i64) as usize)?.into();
        *self_rc.strc_magic.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.strc_magic() == vec![0x53u8, 0x54u8, 0x52u8, 0x43u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/dna1_body/seq/12".to_string() }));
        }
        *self_rc.num_structs.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.structs.borrow_mut() = Vec::new();
        let l_structs = *self_rc.num_structs();
        for _i in 0..l_structs {
            let t = Self::read_into::<_, BlenderBlend_DnaStruct>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.structs.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl BlenderBlend_Dna1Body {
}
impl BlenderBlend_Dna1Body {
    pub fn id(&self) -> Ref<'_, Vec<u8>> {
        self.id.borrow()
    }
}
impl BlenderBlend_Dna1Body {
    pub fn name_magic(&self) -> Ref<'_, Vec<u8>> {
        self.name_magic.borrow()
    }
}
impl BlenderBlend_Dna1Body {
    pub fn num_names(&self) -> Ref<'_, u32> {
        self.num_names.borrow()
    }
}
impl BlenderBlend_Dna1Body {
    pub fn names(&self) -> Ref<'_, Vec<String>> {
        self.names.borrow()
    }
}
impl BlenderBlend_Dna1Body {
    pub fn padding_1(&self) -> Ref<'_, Vec<u8>> {
        self.padding_1.borrow()
    }
}
impl BlenderBlend_Dna1Body {
    pub fn type_magic(&self) -> Ref<'_, Vec<u8>> {
        self.type_magic.borrow()
    }
}
impl BlenderBlend_Dna1Body {
    pub fn num_types(&self) -> Ref<'_, u32> {
        self.num_types.borrow()
    }
}
impl BlenderBlend_Dna1Body {
    pub fn types(&self) -> Ref<'_, Vec<String>> {
        self.types.borrow()
    }
}
impl BlenderBlend_Dna1Body {
    pub fn padding_2(&self) -> Ref<'_, Vec<u8>> {
        self.padding_2.borrow()
    }
}
impl BlenderBlend_Dna1Body {
    pub fn tlen_magic(&self) -> Ref<'_, Vec<u8>> {
        self.tlen_magic.borrow()
    }
}
impl BlenderBlend_Dna1Body {
    pub fn lengths(&self) -> Ref<'_, Vec<u16>> {
        self.lengths.borrow()
    }
}
impl BlenderBlend_Dna1Body {
    pub fn padding_3(&self) -> Ref<'_, Vec<u8>> {
        self.padding_3.borrow()
    }
}
impl BlenderBlend_Dna1Body {
    pub fn strc_magic(&self) -> Ref<'_, Vec<u8>> {
        self.strc_magic.borrow()
    }
}
impl BlenderBlend_Dna1Body {
    pub fn num_structs(&self) -> Ref<'_, u32> {
        self.num_structs.borrow()
    }
}
impl BlenderBlend_Dna1Body {
    pub fn structs(&self) -> Ref<'_, Vec<OptRc<BlenderBlend_DnaStruct>>> {
        self.structs.borrow()
    }
}
impl BlenderBlend_Dna1Body {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct BlenderBlend_DnaField {
    pub _root: SharedType<BlenderBlend>,
    pub _parent: SharedType<BlenderBlend_DnaStruct>,
    pub _self: SharedType<Self>,
    idx_type: RefCell<u16>,
    idx_name: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_name: Cell<bool>,
    name: RefCell<String>,
    f_type: Cell<bool>,
    type: RefCell<String>,
}
impl KStruct for BlenderBlend_DnaField {
    type Root = BlenderBlend;
    type Parent = BlenderBlend_DnaStruct;

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
        *self_rc.idx_type.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.idx_name.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl BlenderBlend_DnaField {
    pub fn name(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name.get() {
            return Ok(self.name.borrow());
        }
        self.f_name.set(true);
        *self.name.borrow_mut() = _prc.as_ref().unwrap()._parent.get_value().borrow().upgrade().as_ref().unwrap().names()[*self.idx_name() as usize].to_string();
        Ok(self.name.borrow())
    }
    pub fn type(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_type.get() {
            return Ok(self.type.borrow());
        }
        self.f_type.set(true);
        *self.type.borrow_mut() = _prc.as_ref().unwrap()._parent.get_value().borrow().upgrade().as_ref().unwrap().types()[*self.idx_type() as usize].to_string();
        Ok(self.type.borrow())
    }
}
impl BlenderBlend_DnaField {
    pub fn idx_type(&self) -> Ref<'_, u16> {
        self.idx_type.borrow()
    }
}
impl BlenderBlend_DnaField {
    pub fn idx_name(&self) -> Ref<'_, u16> {
        self.idx_name.borrow()
    }
}
impl BlenderBlend_DnaField {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * DNA struct contains a `type` (type name), which is specified as
 * an index in types table, and sequence of fields.
 */

#[derive(Default, Debug, Clone)]
pub struct BlenderBlend_DnaStruct {
    pub _root: SharedType<BlenderBlend>,
    pub _parent: SharedType<BlenderBlend_Dna1Body>,
    pub _self: SharedType<Self>,
    idx_type: RefCell<u16>,
    num_fields: RefCell<u16>,
    fields: RefCell<Vec<OptRc<BlenderBlend_DnaField>>>,
    _io: RefCell<BytesReader>,
    f_type: Cell<bool>,
    type: RefCell<String>,
}
impl KStruct for BlenderBlend_DnaStruct {
    type Root = BlenderBlend;
    type Parent = BlenderBlend_Dna1Body;

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
        *self_rc.idx_type.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.num_fields.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.fields.borrow_mut() = Vec::new();
        let l_fields = *self_rc.num_fields();
        for _i in 0..l_fields {
            let t = Self::read_into::<_, BlenderBlend_DnaField>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.fields.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl BlenderBlend_DnaStruct {
    pub fn type(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_type.get() {
            return Ok(self.type.borrow());
        }
        self.f_type.set(true);
        *self.type.borrow_mut() = _prc.as_ref().unwrap().types()[*self.idx_type() as usize].to_string();
        Ok(self.type.borrow())
    }
}
impl BlenderBlend_DnaStruct {
    pub fn idx_type(&self) -> Ref<'_, u16> {
        self.idx_type.borrow()
    }
}
impl BlenderBlend_DnaStruct {
    pub fn num_fields(&self) -> Ref<'_, u16> {
        self.num_fields.borrow()
    }
}
impl BlenderBlend_DnaStruct {
    pub fn fields(&self) -> Ref<'_, Vec<OptRc<BlenderBlend_DnaField>>> {
        self.fields.borrow()
    }
}
impl BlenderBlend_DnaStruct {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct BlenderBlend_FileBlock {
    pub _root: SharedType<BlenderBlend>,
    pub _parent: SharedType<BlenderBlend>,
    pub _self: SharedType<Self>,
    code: RefCell<String>,
    len_body: RefCell<u32>,
    mem_addr: RefCell<Vec<u8>>,
    sdna_index: RefCell<u32>,
    count: RefCell<u32>,
    body: RefCell<Option<BlenderBlend_FileBlock_Body>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
    f_sdna_struct: Cell<bool>,
    sdna_struct: RefCell<OptRc<BlenderBlend_DnaStruct>>,
}
#[derive(Debug, Clone)]
pub enum BlenderBlend_FileBlock_Body {
    Bytes(Vec<u8>),
    BlenderBlend_Dna1Body(OptRc<BlenderBlend_Dna1Body>),
}
impl From<&BlenderBlend_FileBlock_Body> for Vec<u8> {
    fn from(v: &BlenderBlend_FileBlock_Body) -> Self {
        if let BlenderBlend_FileBlock_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected BlenderBlend_FileBlock_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for BlenderBlend_FileBlock_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&BlenderBlend_FileBlock_Body> for OptRc<BlenderBlend_Dna1Body> {
    fn from(v: &BlenderBlend_FileBlock_Body) -> Self {
        if let BlenderBlend_FileBlock_Body::BlenderBlend_Dna1Body(x) = v {
            return x.clone();
        }
        panic!("expected BlenderBlend_FileBlock_Body::BlenderBlend_Dna1Body, got {:?}", v)
    }
}
impl From<OptRc<BlenderBlend_Dna1Body>> for BlenderBlend_FileBlock_Body {
    fn from(v: OptRc<BlenderBlend_Dna1Body>) -> Self {
        Self::BlenderBlend_Dna1Body(v)
    }
}
impl KStruct for BlenderBlend_FileBlock {
    type Root = BlenderBlend;
    type Parent = BlenderBlend;

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
        *self_rc.code.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "ASCII")?;
        *self_rc.len_body.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.mem_addr.borrow_mut() = _io.read_bytes(*_r.hdr().psize()? as usize)?.into();
        *self_rc.sdna_index.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.count.borrow_mut() = _io.read_u4le()?.into();
        {
            let on = self_rc.code();
            if *on == "DNA1" {
                *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                let body_raw = self_rc.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, BlenderBlend_Dna1Body>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else {
                *self_rc.body.borrow_mut() = Some(_io.read_bytes(*self_rc.len_body() as usize)?.into());
            }
        }
        Ok(())
    }
}
impl BlenderBlend_FileBlock {
    pub fn sdna_struct(
        &self
    ) -> KResult<Ref<'_, OptRc<BlenderBlend_DnaStruct>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_sdna_struct.get() {
            return Ok(self.sdna_struct.borrow());
        }
        if ((*self.sdna_index() as u32) != (0 as u32)) {
            *self.sdna_struct.borrow_mut() = _r.sdna_structs()?[*self.sdna_index() as usize].clone();
        }
        Ok(self.sdna_struct.borrow())
    }
}

/**
 * Identifier of the file block
 */
impl BlenderBlend_FileBlock {
    pub fn code(&self) -> Ref<'_, String> {
        self.code.borrow()
    }
}

/**
 * Total length of the data after the header of file block
 */
impl BlenderBlend_FileBlock {
    pub fn len_body(&self) -> Ref<'_, u32> {
        self.len_body.borrow()
    }
}

/**
 * Memory address the structure was located when written to disk
 */
impl BlenderBlend_FileBlock {
    pub fn mem_addr(&self) -> Ref<'_, Vec<u8>> {
        self.mem_addr.borrow()
    }
}

/**
 * Index of the SDNA structure
 */
impl BlenderBlend_FileBlock {
    pub fn sdna_index(&self) -> Ref<'_, u32> {
        self.sdna_index.borrow()
    }
}

/**
 * Number of structure located in this file-block
 */
impl BlenderBlend_FileBlock {
    pub fn count(&self) -> Ref<'_, u32> {
        self.count.borrow()
    }
}
impl BlenderBlend_FileBlock {
    pub fn body(&self) -> Ref<'_, Option<BlenderBlend_FileBlock_Body>> {
        self.body.borrow()
    }
}
impl BlenderBlend_FileBlock {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl BlenderBlend_FileBlock {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct BlenderBlend_Header {
    pub _root: SharedType<BlenderBlend>,
    pub _parent: SharedType<BlenderBlend>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    ptr_size_id: RefCell<BlenderBlend_PtrSize>,
    endian: RefCell<BlenderBlend_Endian>,
    version: RefCell<String>,
    _io: RefCell<BytesReader>,
    f_psize: Cell<bool>,
    psize: RefCell<i8>,
}
impl KStruct for BlenderBlend_Header {
    type Root = BlenderBlend;
    type Parent = BlenderBlend;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(7 as usize)?.into();
        if !(*self_rc.magic() == vec![0x42u8, 0x4cu8, 0x45u8, 0x4eu8, 0x44u8, 0x45u8, 0x52u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/seq/0".to_string() }));
        }
        *self_rc.ptr_size_id.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.endian.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.version.borrow_mut() = bytes_to_str(&_io.read_bytes(3 as usize)?.into(), "ASCII")?;
        Ok(())
    }
}
impl BlenderBlend_Header {

    /**
     * Number of bytes that a pointer occupies
     */
    pub fn psize(
        &self
    ) -> KResult<Ref<'_, i8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_psize.get() {
            return Ok(self.psize.borrow());
        }
        self.f_psize.set(true);
        *self.psize.borrow_mut() = (if *self.ptr_size_id() == BlenderBlend_PtrSize::Bits64 { 8 } else { 4 }) as i8;
        Ok(self.psize.borrow())
    }
}
impl BlenderBlend_Header {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}

/**
 * Size of a pointer; all pointers in the file are stored in this format
 */
impl BlenderBlend_Header {
    pub fn ptr_size_id(&self) -> Ref<'_, BlenderBlend_PtrSize> {
        self.ptr_size_id.borrow()
    }
}

/**
 * Type of byte ordering used
 */
impl BlenderBlend_Header {
    pub fn endian(&self) -> Ref<'_, BlenderBlend_Endian> {
        self.endian.borrow()
    }
}

/**
 * Blender version used to save this file
 */
impl BlenderBlend_Header {
    pub fn version(&self) -> Ref<'_, String> {
        self.version.borrow()
    }
}
impl BlenderBlend_Header {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

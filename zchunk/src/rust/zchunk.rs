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
 * \sa https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt Source
 */

#[derive(Default, Debug, Clone)]
pub struct Zchunk {
    pub _root: SharedType<Zchunk>,
    pub _parent: SharedType<Zchunk>,
    pub _self: SharedType<Self>,
    lead: RefCell<OptRc<Zchunk_HeaderLead>>,
    header_rest: RefCell<OptRc<Zchunk_HeaderWithoutLead>>,
    dict: RefCell<Vec<u8>>,
    chunks: RefCell<Vec<Vec<u8>>>,
    _io: RefCell<BytesReader>,
    header_rest_raw: RefCell<Vec<u8>>,
}
impl KStruct for Zchunk {
    type Root = Zchunk;
    type Parent = Zchunk;

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
        let t = Self::read_into::<_, Zchunk_HeaderLead>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.lead.borrow_mut() = t;
        *self_rc.header_rest_raw.borrow_mut() = _io.read_bytes(*self_rc.lead().len_header_rest().value()? as usize)?.into();
        let header_rest_raw = self_rc.header_rest_raw.borrow();
        let _t_header_rest_raw_io = BytesReader::from(header_rest_raw.clone());
        let t = Self::read_into::<BytesReader, Zchunk_HeaderWithoutLead>(&_t_header_rest_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header_rest.borrow_mut() = t;
        *self_rc.dict.borrow_mut() = _io.read_bytes(*self_rc.header_rest().index().len_dict().value()? as usize)?.into();
        if !(*self_rc.lead().is_detached_header()?) {
            *self_rc.chunks.borrow_mut() = Vec::new();
            let l_chunks = self_rc.header_rest().index().chunks_metadata().len();
            for _i in 0..l_chunks {
                self_rc.chunks.borrow_mut().push(_io.read_bytes(*self_rc.header_rest().index().chunks_metadata()[_i as usize].len_chunk().value()? as usize)?.into());
            }
        }
        Ok(())
    }
}
impl Zchunk {
}
impl Zchunk {
    pub fn lead(&self) -> Ref<'_, OptRc<Zchunk_HeaderLead>> {
        self.lead.borrow()
    }
}
impl Zchunk {
    pub fn header_rest(&self) -> Ref<'_, OptRc<Zchunk_HeaderWithoutLead>> {
        self.header_rest.borrow()
    }
}

/**
 * Custom dictionary used when compressing each chunk. It's compressed itself
 * without a dictionary.
 * 
 * The official zchunk specification calls this section "Compressed Dict".
 * It's also called a "dictionary chunk". `zck_read_header -c` presents it as
 * "chunk 0" (which is always shown in the chunk table, but can have size 0
 * if the dictionary is not in use).
 */
impl Zchunk {
    pub fn dict(&self) -> Ref<'_, Vec<u8>> {
        self.dict.borrow()
    }
}

/**
 * Chunks of data, each compressed with the custom dictionary `dict` (if
 * applicable).
 * 
 * They are not included in a detached header (`.zhr`) file. Detached headers
 * contain the dictionary, but none of the data chunks.
 */
impl Zchunk {
    pub fn chunks(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.chunks.borrow()
    }
}
impl Zchunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Zchunk {
    pub fn header_rest_raw(&self) -> Ref<'_, Vec<u8>> {
        self.header_rest_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Zchunk_ChecksumTypes {
    Sha1,
    Sha256,
    Sha512,
    Sha512128,
    Unknown(i64),
}

impl TryFrom<i64> for Zchunk_ChecksumTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Zchunk_ChecksumTypes> {
        match flag {
            0 => Ok(Zchunk_ChecksumTypes::Sha1),
            1 => Ok(Zchunk_ChecksumTypes::Sha256),
            2 => Ok(Zchunk_ChecksumTypes::Sha512),
            3 => Ok(Zchunk_ChecksumTypes::Sha512128),
            _ => Ok(Zchunk_ChecksumTypes::Unknown(flag)),
        }
    }
}

impl From<&Zchunk_ChecksumTypes> for i64 {
    fn from(v: &Zchunk_ChecksumTypes) -> Self {
        match *v {
            Zchunk_ChecksumTypes::Sha1 => 0,
            Zchunk_ChecksumTypes::Sha256 => 1,
            Zchunk_ChecksumTypes::Sha512 => 2,
            Zchunk_ChecksumTypes::Sha512128 => 3,
            Zchunk_ChecksumTypes::Unknown(v) => v
        }
    }
}

impl Default for Zchunk_ChecksumTypes {
    fn default() -> Self { Zchunk_ChecksumTypes::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Zchunk_CompressionTypes {
    None,
    Zstd,
    Unknown(i64),
}

impl TryFrom<i64> for Zchunk_CompressionTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Zchunk_CompressionTypes> {
        match flag {
            0 => Ok(Zchunk_CompressionTypes::None),
            2 => Ok(Zchunk_CompressionTypes::Zstd),
            _ => Ok(Zchunk_CompressionTypes::Unknown(flag)),
        }
    }
}

impl From<&Zchunk_CompressionTypes> for i64 {
    fn from(v: &Zchunk_CompressionTypes) -> Self {
        match *v {
            Zchunk_CompressionTypes::None => 0,
            Zchunk_CompressionTypes::Zstd => 2,
            Zchunk_CompressionTypes::Unknown(v) => v
        }
    }
}

impl Default for Zchunk_CompressionTypes {
    fn default() -> Self { Zchunk_CompressionTypes::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Zchunk_ChecksumType {
    pub _root: SharedType<Zchunk>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    raw: RefCell<OptRc<Zchunk_CompressedInteger>>,
    _io: RefCell<BytesReader>,
    f_len_checksum: Cell<bool>,
    len_checksum: RefCell<i8>,
    f_value: Cell<bool>,
    value: RefCell<Zchunk_ChecksumTypes>,
}
impl KStruct for Zchunk_ChecksumType {
    type Root = Zchunk;
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
        let t = Self::read_into::<_, Zchunk_CompressedInteger>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.raw.borrow_mut() = t;
        let _tmpa = *self_rc.raw();
        if !(*self_rc.len_checksum()? != 0) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/checksum_type/seq/0".to_string() }));
        }
        Ok(())
    }
}
impl Zchunk_ChecksumType {
    pub fn len_checksum(
        &self
    ) -> KResult<Ref<'_, i8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_checksum.get() {
            return Ok(self.len_checksum.borrow());
        }
        self.f_len_checksum.set(true);
        *self.len_checksum.borrow_mut() = (if *self.value()? == Zchunk_ChecksumTypes::Sha1 { 20 } else { if *self.value()? == Zchunk_ChecksumTypes::Sha256 { 32 } else { if *self.value()? == Zchunk_ChecksumTypes::Sha512 { 64 } else { if *self.value()? == Zchunk_ChecksumTypes::Sha512128 { 16 } else { 0 } } } }) as i8;
        Ok(self.len_checksum.borrow())
    }
    pub fn value(
        &self
    ) -> KResult<Ref<'_, Zchunk_ChecksumTypes>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        self.f_value.set(true);
        *self.value.borrow_mut() = (*self.raw().value()? as i64).try_into()?;
        Ok(self.value.borrow())
    }
}

/**
 * Raw integer, don't read this field - access `value` instead.
 */
impl Zchunk_ChecksumType {
    pub fn raw(&self) -> Ref<'_, OptRc<Zchunk_CompressedInteger>> {
        self.raw.borrow()
    }
}
impl Zchunk_ChecksumType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Zchunk_Chunk {
    pub _root: SharedType<Zchunk>,
    pub _parent: SharedType<Zchunk_Index>,
    pub _self: SharedType<Self>,
    len_checksum: RefCell<u32>,
    has_data_streams: RefCell<bool>,
    has_uncompressed_source: RefCell<bool>,
    chunk_stream: RefCell<OptRc<Zchunk_CompressedInteger>>,
    chunk_checksum: RefCell<Vec<u8>>,
    uncompressed_chunk_checksum: RefCell<Vec<u8>>,
    len_chunk: RefCell<OptRc<Zchunk_CompressedInteger>>,
    len_uncompressed_chunk: RefCell<OptRc<Zchunk_CompressedInteger>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Zchunk_Chunk {
    type Root = Zchunk;
    type Parent = Zchunk_Index;

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
        if *self_rc.has_data_streams() {
            let t = Self::read_into::<_, Zchunk_CompressedInteger>(&*_io, Some(self_rc._root.clone()), None)?.into();
            *self_rc.chunk_stream.borrow_mut() = t;
        }
        *self_rc.chunk_checksum.borrow_mut() = _io.read_bytes(*self_rc.len_checksum() as usize)?.into();
        if *self_rc.has_uncompressed_source() {
            *self_rc.uncompressed_chunk_checksum.borrow_mut() = _io.read_bytes(*self_rc.len_checksum() as usize)?.into();
        }
        let t = Self::read_into::<_, Zchunk_CompressedInteger>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.len_chunk.borrow_mut() = t;
        let t = Self::read_into::<_, Zchunk_CompressedInteger>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.len_uncompressed_chunk.borrow_mut() = t;
        Ok(())
    }
}
impl Zchunk_Chunk {
    pub fn len_checksum(&self) -> Ref<'_, u32> {
        self.len_checksum.borrow()
    }
}
impl Zchunk_Chunk {
    pub fn has_data_streams(&self) -> Ref<'_, bool> {
        self.has_data_streams.borrow()
    }
}
impl Zchunk_Chunk {
    pub fn has_uncompressed_source(&self) -> Ref<'_, bool> {
        self.has_uncompressed_source.borrow()
    }
}
impl Zchunk_Chunk {
    pub fn set_params(&mut self, len_checksum: u32, has_data_streams: bool, has_uncompressed_source: bool) {
        *self.len_checksum.borrow_mut() = len_checksum;
        *self.has_data_streams.borrow_mut() = has_data_streams;
        *self.has_uncompressed_source.borrow_mut() = has_uncompressed_source;
    }
}
impl Zchunk_Chunk {
}
impl Zchunk_Chunk {
    pub fn chunk_stream(&self) -> Ref<'_, OptRc<Zchunk_CompressedInteger>> {
        self.chunk_stream.borrow()
    }
}
impl Zchunk_Chunk {
    pub fn chunk_checksum(&self) -> Ref<'_, Vec<u8>> {
        self.chunk_checksum.borrow()
    }
}

/**
 * Checksum of the uncompressed chunk. Used to detect whether a chunk
 * from an uncompressed source is identical to the compressed chunk.
 */
impl Zchunk_Chunk {
    pub fn uncompressed_chunk_checksum(&self) -> Ref<'_, Vec<u8>> {
        self.uncompressed_chunk_checksum.borrow()
    }
}
impl Zchunk_Chunk {
    pub fn len_chunk(&self) -> Ref<'_, OptRc<Zchunk_CompressedInteger>> {
        self.len_chunk.borrow()
    }
}
impl Zchunk_Chunk {
    pub fn len_uncompressed_chunk(&self) -> Ref<'_, OptRc<Zchunk_CompressedInteger>> {
        self.len_uncompressed_chunk.borrow()
    }
}
impl Zchunk_Chunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Like `/common/vlq_base128_le` (LEB128), but the logic of the
 * "continuation" flag in the most significant bit is inverted, so instead of
 * `has_next`, it is called `is_last` (if the highest bit is set to zero, it
 * means "continue", whereas in standard LEB128, the highest bit set to
 * **one** means "continue"). Therefore, we cannot simply import
 * `/common/vlq_base128_le` and use it, because it is incompatible.
 */

#[derive(Default, Debug, Clone)]
pub struct Zchunk_CompressedInteger {
    pub _root: SharedType<Zchunk>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    groups: RefCell<Vec<OptRc<Zchunk_CompressedInteger_Group>>>,
    _io: RefCell<BytesReader>,
    f_len: Cell<bool>,
    len: RefCell<i32>,
    f_value: Cell<bool>,
    value: RefCell<u64>,
}
impl KStruct for Zchunk_CompressedInteger {
    type Root = Zchunk;
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
        *self_rc.groups.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let f = |t : &mut Zchunk_CompressedInteger_Group| Ok(t.set_params((_i).try_into().map_err(|_| KError::CastError)?));
                let t = Self::read_into_with_init::<_, Zchunk_CompressedInteger_Group>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                self_rc.groups.borrow_mut().push(t);
                let _t_groups = self_rc.groups.borrow();
                let _tmpa = _t_groups.last().unwrap();
                _i += 1;
                let x = !(*_tmpa.is_last());
                x
            } {}
        }
        Ok(())
    }
}
impl Zchunk_CompressedInteger {
    pub fn len(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len.get() {
            return Ok(self.len.borrow());
        }
        self.f_len.set(true);
        *self.len.borrow_mut() = (self.groups().len()) as i32;
        Ok(self.len.borrow())
    }

    /**
     * Resulting unsigned value as normal integer
     */
    pub fn value(
        &self
    ) -> KResult<Ref<'_, u64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        self.f_value.set(true);
        *self.value.borrow_mut() = ((((((((((((((((((((*self.groups()[0 as usize].value() as i32) | (if ((*self.len()? as i32) >= (2 as i32)) { ((*self.groups()[1 as usize].value() as i32) << (7 as i32)) } else { 0 } as i32)) as i32) | (if ((*self.len()? as i32) >= (3 as i32)) { ((*self.groups()[2 as usize].value() as i32) << (14 as i32)) } else { 0 } as i32)) as i32) | (if ((*self.len()? as i32) >= (4 as i32)) { ((*self.groups()[3 as usize].value() as i32) << (21 as i32)) } else { 0 } as i32)) as i32) | (if ((*self.len()? as i32) >= (5 as i32)) { ((*self.groups()[4 as usize].value() as i32) << (28 as i32)) } else { 0 } as i32)) as i32) | (if ((*self.len()? as i32) >= (6 as i32)) { ((*self.groups()[5 as usize].value() as i32) << (35 as i32)) } else { 0 } as i32)) as i32) | (if ((*self.len()? as i32) >= (7 as i32)) { ((*self.groups()[6 as usize].value() as i32) << (42 as i32)) } else { 0 } as i32)) as i32) | (if ((*self.len()? as i32) >= (8 as i32)) { ((*self.groups()[7 as usize].value() as i32) << (49 as i32)) } else { 0 } as i32)) as i32) | (if ((*self.len()? as i32) >= (9 as i32)) { ((*self.groups()[8 as usize].value() as i32) << (56 as i32)) } else { 0 } as i32)) as i32) | (if ((*self.len()? as i32) >= (10 as i32)) { ((*self.groups()[9 as usize].value() as i32) << (63 as i32)) } else { 0 } as i32)) as u64)) as u64;
        Ok(self.value.borrow())
    }
}
impl Zchunk_CompressedInteger {
    pub fn groups(&self) -> Ref<'_, Vec<OptRc<Zchunk_CompressedInteger_Group>>> {
        self.groups.borrow()
    }
}
impl Zchunk_CompressedInteger {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.
 */

#[derive(Default, Debug, Clone)]
pub struct Zchunk_CompressedInteger_Group {
    pub _root: SharedType<Zchunk>,
    pub _parent: SharedType<Zchunk_CompressedInteger>,
    pub _self: SharedType<Self>,
    idx: RefCell<i32>,
    is_last: RefCell<bool>,
    value: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Zchunk_CompressedInteger_Group {
    type Root = Zchunk;
    type Parent = Zchunk_CompressedInteger;

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
        *self_rc.is_last.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        if !(((*self_rc.is_last() as bool) == (if ((*self_rc.idx() as i32) == (9 as i32)) { true } else { *self_rc.is_last() } as bool))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/compressed_integer/types/group/seq/0".to_string() }));
        }
        *self_rc.value.borrow_mut() = _io.read_bits_int_be(7)?;
        if !(((*self_rc.value() as i32) <= ((if ((*self_rc.idx() as i32) == (9 as i32)) { 1 } else { 127 } as u64) as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/compressed_integer/types/group/seq/1".to_string() }));
        }
        Ok(())
    }
}
impl Zchunk_CompressedInteger_Group {
    pub fn idx(&self) -> Ref<'_, i32> {
        self.idx.borrow()
    }
}
impl Zchunk_CompressedInteger_Group {
    pub fn set_params(&mut self, idx: i32) {
        *self.idx.borrow_mut() = idx;
    }
}
impl Zchunk_CompressedInteger_Group {
}

/**
 * If `true`, then this is the last byte of the compressed integer.
 * 
 * Since this implementation only supports serialized values up to 10
 * bytes, this must be `true` in the 10th group (`groups[9]`).
 */
impl Zchunk_CompressedInteger_Group {
    pub fn is_last(&self) -> Ref<'_, bool> {
        self.is_last.borrow()
    }
}

/**
 * The 7-bit (base128) numeric value chunk of this group
 * 
 * Since this implementation only supports integer values up to 64 bits,
 * the `value` in the 10th group (`groups[9]`) can only be `0` or `1`
 * (otherwise the width of the represented value would be 65 bits or
 * more, which is not supported).
 */
impl Zchunk_CompressedInteger_Group {
    pub fn value(&self) -> Ref<'_, u64> {
        self.value.borrow()
    }
}
impl Zchunk_CompressedInteger_Group {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Zchunk_HeaderLead {
    pub _root: SharedType<Zchunk>,
    pub _parent: SharedType<Zchunk>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    overall_checksum_type: RefCell<OptRc<Zchunk_ChecksumType>>,
    len_header_rest: RefCell<OptRc<Zchunk_CompressedInteger>>,
    header_checksum: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_is_detached_header: Cell<bool>,
    is_detached_header: RefCell<bool>,
}
impl KStruct for Zchunk_HeaderLead {
    type Root = Zchunk;
    type Parent = Zchunk;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(5 as usize)?.into();
        if !( ((*self_rc.magic() == vec![0x0u8, 0x5au8, 0x43u8, 0x4bu8, 0x31u8]) || (*self_rc.magic() == vec![0x0u8, 0x5au8, 0x48u8, 0x52u8, 0x31u8])) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotAnyOf, src_path: "/types/header_lead/seq/0".to_string() }));
        }
        let t = Self::read_into::<_, Zchunk_ChecksumType>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.overall_checksum_type.borrow_mut() = t;
        let t = Self::read_into::<_, Zchunk_CompressedInteger>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.len_header_rest.borrow_mut() = t;
        *self_rc.header_checksum.borrow_mut() = _io.read_bytes(*self_rc.overall_checksum_type().len_checksum()? as usize)?.into();
        Ok(())
    }
}
impl Zchunk_HeaderLead {

    /**
     * Determines whether this file is a zchunk detached header (`.zhr`). If
     * not, it is a complete zchunk file (`.zck`).
     */
    pub fn is_detached_header(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_detached_header.get() {
            return Ok(self.is_detached_header.borrow());
        }
        self.f_is_detached_header.set(true);
        *self.is_detached_header.borrow_mut() = (((self.magic()[2 as usize] as u8) == (72 as u8))) as bool;
        Ok(self.is_detached_header.borrow())
    }
}

/**
 * There are two valid magic numbers for zchunk files:
 * 
 * * `'\0ZCK1'` identifies a zchunk version 1 file (`.zck`)
 * * `'\0ZHR1'` identifies a zchunk version 1 detached header file (`.zhr`)
 */
impl Zchunk_HeaderLead {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}

/**
 * Type of the checksum used for `header_checksum` and
 * `_root.header_rest.preface.data_checksum`.
 */
impl Zchunk_HeaderLead {
    pub fn overall_checksum_type(&self) -> Ref<'_, OptRc<Zchunk_ChecksumType>> {
        self.overall_checksum_type.borrow()
    }
}

/**
 * Size of the header, not including the lead
 */
impl Zchunk_HeaderLead {
    pub fn len_header_rest(&self) -> Ref<'_, OptRc<Zchunk_CompressedInteger>> {
        self.len_header_rest.borrow()
    }
}

/**
 * Checksum of the entire header, which consists of `_root.lead` and
 * `_root.header_rest` (i.e. everything from the beginning of the file to
 * the end of `_root.header_rest`), not including the `header_checksum`
 * field itself (i.e. the input for the checksum algorithm is a
 * concatenation of the bytes preceding the `header_checksum` field with
 * the bytes following it).
 * 
 * For detached headers, the checksum is calculated as if the `magic`
 * field were set to `'\0ZCK1'`, so that it matches the checksum in the
 * full zchunk file.
 */
impl Zchunk_HeaderLead {
    pub fn header_checksum(&self) -> Ref<'_, Vec<u8>> {
        self.header_checksum.borrow()
    }
}
impl Zchunk_HeaderLead {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Zchunk_HeaderWithoutLead {
    pub _root: SharedType<Zchunk>,
    pub _parent: SharedType<Zchunk>,
    pub _self: SharedType<Self>,
    preface: RefCell<OptRc<Zchunk_Preface>>,
    len_index: RefCell<OptRc<Zchunk_CompressedInteger>>,
    index: RefCell<OptRc<Zchunk_Index>>,
    num_signatures: RefCell<OptRc<Zchunk_CompressedInteger>>,
    _io: RefCell<BytesReader>,
    index_raw: RefCell<Vec<u8>>,
}
impl KStruct for Zchunk_HeaderWithoutLead {
    type Root = Zchunk;
    type Parent = Zchunk;

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
        let t = Self::read_into::<_, Zchunk_Preface>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.preface.borrow_mut() = t;
        let t = Self::read_into::<_, Zchunk_CompressedInteger>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.len_index.borrow_mut() = t;
        *self_rc.index_raw.borrow_mut() = _io.read_bytes(*self_rc.len_index().value()? as usize)?.into();
        let index_raw = self_rc.index_raw.borrow();
        let _t_index_raw_io = BytesReader::from(index_raw.clone());
        let t = Self::read_into::<BytesReader, Zchunk_Index>(&_t_index_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.index.borrow_mut() = t;
        let t = Self::read_into::<_, Zchunk_CompressedInteger>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.num_signatures.borrow_mut() = t;
        let _tmpa = *self_rc.num_signatures();
        if !(((*_tmpa.value()? as u64) == (0 as u64))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/header_without_lead/seq/3".to_string() }));
        }
        Ok(())
    }
}
impl Zchunk_HeaderWithoutLead {
}
impl Zchunk_HeaderWithoutLead {
    pub fn preface(&self) -> Ref<'_, OptRc<Zchunk_Preface>> {
        self.preface.borrow()
    }
}
impl Zchunk_HeaderWithoutLead {
    pub fn len_index(&self) -> Ref<'_, OptRc<Zchunk_CompressedInteger>> {
        self.len_index.borrow()
    }
}
impl Zchunk_HeaderWithoutLead {
    pub fn index(&self) -> Ref<'_, OptRc<Zchunk_Index>> {
        self.index.borrow()
    }
}

/**
 * Must be 0. The reference implementation also rejects any file with a
 * non-zero "Signature count", throwing a fatal error stating "Signatures
 * aren't supported yet" - see
 * [`src/lib/header.c:259-264`](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/src/lib/header.c#L259-L264).
 * 
 * Although the structure of signatures is defined [in the official
 * textual
 * specification](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L219-L252),
 * no signature types are defined, and as of this writing no publicly
 * known implementation generates or interprets these signatures.
 * Therefore, we've decided not to implement them here either.
 * 
 * For more details, see
 * <https://github.com/kaitai-io/kaitai_struct_formats/pull/539#discussion_r3713109887>.
 */
impl Zchunk_HeaderWithoutLead {
    pub fn num_signatures(&self) -> Ref<'_, OptRc<Zchunk_CompressedInteger>> {
        self.num_signatures.borrow()
    }
}
impl Zchunk_HeaderWithoutLead {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Zchunk_HeaderWithoutLead {
    pub fn index_raw(&self) -> Ref<'_, Vec<u8>> {
        self.index_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Zchunk_Index {
    pub _root: SharedType<Zchunk>,
    pub _parent: SharedType<Zchunk_HeaderWithoutLead>,
    pub _self: SharedType<Self>,
    chunk_checksum_type: RefCell<OptRc<Zchunk_ChecksumType>>,
    num_chunks: RefCell<OptRc<Zchunk_CompressedInteger>>,
    dict_stream: RefCell<OptRc<Zchunk_CompressedInteger>>,
    dict_checksum: RefCell<Vec<u8>>,
    uncompressed_dict_checksum: RefCell<Vec<u8>>,
    len_dict: RefCell<OptRc<Zchunk_CompressedInteger>>,
    len_uncompressed_dict: RefCell<OptRc<Zchunk_CompressedInteger>>,
    chunks_metadata: RefCell<Vec<OptRc<Zchunk_Chunk>>>,
    _io: RefCell<BytesReader>,
    f_num_data_chunks: Cell<bool>,
    num_data_chunks: RefCell<i32>,
}
impl KStruct for Zchunk_Index {
    type Root = Zchunk;
    type Parent = Zchunk_HeaderWithoutLead;

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
        let t = Self::read_into::<_, Zchunk_ChecksumType>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.chunk_checksum_type.borrow_mut() = t;
        let t = Self::read_into::<_, Zchunk_CompressedInteger>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.num_chunks.borrow_mut() = t;
        let _tmpa = *self_rc.num_chunks();
        if !(((*_tmpa.value()? as u64) >= (1 as u64))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/index/seq/1".to_string() }));
        }
        if *_prc.as_ref().unwrap().preface().has_data_streams()? {
            let t = Self::read_into::<_, Zchunk_CompressedInteger>(&*_io, Some(self_rc._root.clone()), None)?.into();
            *self_rc.dict_stream.borrow_mut() = t;
            let _tmpa = *self_rc.dict_stream();
            if !(((*_tmpa.value()? as u64) == (0 as u64))) {
                return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/index/seq/2".to_string() }));
            }
        }
        *self_rc.dict_checksum.borrow_mut() = _io.read_bytes(*self_rc.chunk_checksum_type().len_checksum()? as usize)?.into();
        if *_prc.as_ref().unwrap().preface().has_uncompressed_source()? {
            *self_rc.uncompressed_dict_checksum.borrow_mut() = _io.read_bytes(*self_rc.chunk_checksum_type().len_checksum()? as usize)?.into();
        }
        let t = Self::read_into::<_, Zchunk_CompressedInteger>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.len_dict.borrow_mut() = t;
        let t = Self::read_into::<_, Zchunk_CompressedInteger>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.len_uncompressed_dict.borrow_mut() = t;
        *self_rc.chunks_metadata.borrow_mut() = Vec::new();
        let l_chunks_metadata = *self_rc.num_data_chunks()?;
        for _i in 0..l_chunks_metadata {
            let f = |t : &mut Zchunk_Chunk| Ok(t.set_params((*self_rc.chunk_checksum_type().len_checksum()?).try_into().map_err(|_| KError::CastError)?, *_prc.as_ref().unwrap().preface().has_data_streams()?, *_prc.as_ref().unwrap().preface().has_uncompressed_source()?));
            let t = Self::read_into_with_init::<_, Zchunk_Chunk>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            self_rc.chunks_metadata.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Zchunk_Index {

    /**
     * Number of data chunks. `num_chunks` counts the dictionary as chunk 0,
     * so it is one greater than this number.
     */
    pub fn num_data_chunks(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_data_chunks.get() {
            return Ok(self.num_data_chunks.borrow());
        }
        self.f_num_data_chunks.set(true);
        *self.num_data_chunks.borrow_mut() = (((*self.num_chunks().value()? as u64) - (1 as u64))) as i32;
        Ok(self.num_data_chunks.borrow())
    }
}

/**
 * Type of the checksum used for `dict_checksum` and for all
 * `chunks_metadata[...].chunk_checksum` and
 * `chunks_metadata[...].uncompressed_chunk_checksum`.
 */
impl Zchunk_Index {
    pub fn chunk_checksum_type(&self) -> Ref<'_, OptRc<Zchunk_ChecksumType>> {
        self.chunk_checksum_type.borrow()
    }
}

/**
 * Number of chunks, **including** the dictionary chunk.
 * 
 * Must be at least 1, because the dictionary chunk is always present,
 * even if it is empty. The reference implementation also fails when the
 * number of chunks is 0, see
 * [`src/lib/index/index_read.c:181-184`](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/src/lib/index/index_read.c#L181-L184).
 */
impl Zchunk_Index {
    pub fn num_chunks(&self) -> Ref<'_, OptRc<Zchunk_CompressedInteger>> {
        self.num_chunks.borrow()
    }
}

/**
 * If present, it must always be 0.
 * \sa https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L159-L162 Source
 */
impl Zchunk_Index {
    pub fn dict_stream(&self) -> Ref<'_, OptRc<Zchunk_CompressedInteger>> {
        self.dict_stream.borrow()
    }
}
impl Zchunk_Index {
    pub fn dict_checksum(&self) -> Ref<'_, Vec<u8>> {
        self.dict_checksum.borrow()
    }
}

/**
 * Checksum of the uncompressed dictionary. It has no real use, as the
 * uncompressed source won't have a dictionary.
 */
impl Zchunk_Index {
    pub fn uncompressed_dict_checksum(&self) -> Ref<'_, Vec<u8>> {
        self.uncompressed_dict_checksum.borrow()
    }
}
impl Zchunk_Index {
    pub fn len_dict(&self) -> Ref<'_, OptRc<Zchunk_CompressedInteger>> {
        self.len_dict.borrow()
    }
}
impl Zchunk_Index {
    pub fn len_uncompressed_dict(&self) -> Ref<'_, OptRc<Zchunk_CompressedInteger>> {
        self.len_uncompressed_dict.borrow()
    }
}

/**
 * Metadata of the data chunks. The dictionary is chunk 0 and its
 * metadata is stored in the `*dict*` fields above, so there is one fewer
 * entry here than indicated by `num_chunks`.
 */
impl Zchunk_Index {
    pub fn chunks_metadata(&self) -> Ref<'_, Vec<OptRc<Zchunk_Chunk>>> {
        self.chunks_metadata.borrow()
    }
}
impl Zchunk_Index {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Zchunk_OptionalElement {
    pub _root: SharedType<Zchunk>,
    pub _parent: SharedType<Zchunk_Preface>,
    pub _self: SharedType<Self>,
    element_id: RefCell<OptRc<Zchunk_CompressedInteger>>,
    len_data: RefCell<OptRc<Zchunk_CompressedInteger>>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Zchunk_OptionalElement {
    type Root = Zchunk;
    type Parent = Zchunk_Preface;

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
        let t = Self::read_into::<_, Zchunk_CompressedInteger>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.element_id.borrow_mut() = t;
        let t = Self::read_into::<_, Zchunk_CompressedInteger>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.len_data.borrow_mut() = t;
        *self_rc.data.borrow_mut() = _io.read_bytes(*self_rc.len_data().value()? as usize)?.into();
        Ok(())
    }
}
impl Zchunk_OptionalElement {
}
impl Zchunk_OptionalElement {
    pub fn element_id(&self) -> Ref<'_, OptRc<Zchunk_CompressedInteger>> {
        self.element_id.borrow()
    }
}
impl Zchunk_OptionalElement {
    pub fn len_data(&self) -> Ref<'_, OptRc<Zchunk_CompressedInteger>> {
        self.len_data.borrow()
    }
}
impl Zchunk_OptionalElement {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl Zchunk_OptionalElement {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Zchunk_Preface {
    pub _root: SharedType<Zchunk>,
    pub _parent: SharedType<Zchunk_HeaderWithoutLead>,
    pub _self: SharedType<Self>,
    data_checksum: RefCell<Vec<u8>>,
    flags: RefCell<OptRc<Zchunk_CompressedInteger>>,
    compression_type_int: RefCell<OptRc<Zchunk_CompressedInteger>>,
    num_optional_elements: RefCell<OptRc<Zchunk_CompressedInteger>>,
    optional_elements: RefCell<Vec<OptRc<Zchunk_OptionalElement>>>,
    _io: RefCell<BytesReader>,
    f_compression_type: Cell<bool>,
    compression_type: RefCell<Zchunk_CompressionTypes>,
    f_has_data_streams: Cell<bool>,
    has_data_streams: RefCell<bool>,
    f_has_optional_elements: Cell<bool>,
    has_optional_elements: RefCell<bool>,
    f_has_uncompressed_source: Cell<bool>,
    has_uncompressed_source: RefCell<bool>,
}
impl KStruct for Zchunk_Preface {
    type Root = Zchunk;
    type Parent = Zchunk_HeaderWithoutLead;

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
        *self_rc.data_checksum.borrow_mut() = _io.read_bytes(*_r.lead().overall_checksum_type().len_checksum()? as usize)?.into();
        let t = Self::read_into::<_, Zchunk_CompressedInteger>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.flags.borrow_mut() = t;
        let _tmpa = *self_rc.flags();
        if !(((*_tmpa.value()? as u64) <= (7 as u64))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/preface/seq/1".to_string() }));
        }
        let t = Self::read_into::<_, Zchunk_CompressedInteger>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.compression_type_int.borrow_mut() = t;
        let _tmpa = *self_rc.compression_type_int();
        if !( ((((*_tmpa.value()? as i32) == (i64::from(&Zchunk_CompressionTypes::None) as i32))) || (((*_tmpa.value()? as i32) == (i64::from(&Zchunk_CompressionTypes::Zstd) as i32)))) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/preface/seq/2".to_string() }));
        }
        if *self_rc.has_optional_elements()? {
            let t = Self::read_into::<_, Zchunk_CompressedInteger>(&*_io, Some(self_rc._root.clone()), None)?.into();
            *self_rc.num_optional_elements.borrow_mut() = t;
            let _tmpa = *self_rc.num_optional_elements();
            if !(((*_tmpa.value()? as u64) >= (1 as u64))) {
                return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/preface/seq/3".to_string() }));
            }
        }
        if *self_rc.has_optional_elements()? {
            *self_rc.optional_elements.borrow_mut() = Vec::new();
            let l_optional_elements = *self_rc.num_optional_elements().value()?;
            for _i in 0..l_optional_elements {
                let t = Self::read_into::<_, Zchunk_OptionalElement>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.optional_elements.borrow_mut().push(t);
            }
        }
        Ok(())
    }
}
impl Zchunk_Preface {
    pub fn compression_type(
        &self
    ) -> KResult<Ref<'_, Zchunk_CompressionTypes>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_compression_type.get() {
            return Ok(self.compression_type.borrow());
        }
        self.f_compression_type.set(true);
        *self.compression_type.borrow_mut() = (*self.compression_type_int().value()? as i64).try_into()?;
        Ok(self.compression_type.borrow())
    }
    pub fn has_data_streams(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_data_streams.get() {
            return Ok(self.has_data_streams.borrow());
        }
        self.f_has_data_streams.set(true);
        *self.has_data_streams.borrow_mut() = (((((*self.flags().value()? as u64) & (1 as u64)) as i32) != (0 as i32))) as bool;
        Ok(self.has_data_streams.borrow())
    }
    pub fn has_optional_elements(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_optional_elements.get() {
            return Ok(self.has_optional_elements.borrow());
        }
        self.f_has_optional_elements.set(true);
        *self.has_optional_elements.borrow_mut() = (((((*self.flags().value()? as u64) & (2 as u64)) as i32) != (0 as i32))) as bool;
        Ok(self.has_optional_elements.borrow())
    }

    /**
     * The file may be applied against an uncompressed source. This adds an
     * uncompressed checksum to every index entry, including the dictionary.
     */
    pub fn has_uncompressed_source(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_uncompressed_source.get() {
            return Ok(self.has_uncompressed_source.borrow());
        }
        self.f_has_uncompressed_source.set(true);
        *self.has_uncompressed_source.borrow_mut() = (((((*self.flags().value()? as u64) & (4 as u64)) as i32) != (0 as i32))) as bool;
        Ok(self.has_uncompressed_source.borrow())
    }
}

/**
 * Total data checksum. Checksum of everything after the header,
 * including the compressed dictionary (`_root.dict`) and all compressed
 * chunks (`_root.chunks`). The type of this checksum is
 * `_root.lead.overall_checksum_type.value`.
 * 
 * If `has_uncompressed_source` is true, this checksum must not be
 * checked and should not be generated. In that case, the reference
 * implementation writes it as all zeros - see the sample file
 * [`mini-uncomp-cksums.zck`](https://github.com/kaitai-io/kaitai_struct_samples/blob/1d2fe11c971fb7e86f343b77a1ed341a0217e86a/archive/zchunk/README.md#mini-uncomp-cksumszck).
 */
impl Zchunk_Preface {
    pub fn data_checksum(&self) -> Ref<'_, Vec<u8>> {
        self.data_checksum.borrow()
    }
}

/**
 * Compressed integer containing a bitmask of the flags. All unused flags
 * MUST be set to 0. If a decoder sees a flag set that it doesn't
 * recognize, it MUST exit with an error.
 * \sa https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L78-L81 Source
 */
impl Zchunk_Preface {
    pub fn flags(&self) -> Ref<'_, OptRc<Zchunk_CompressedInteger>> {
        self.flags.borrow()
    }
}

/**
 * Raw integer, don't read this field - access `compression_type`
 * instead.
 */
impl Zchunk_Preface {
    pub fn compression_type_int(&self) -> Ref<'_, OptRc<Zchunk_CompressedInteger>> {
        self.compression_type_int.borrow()
    }
}

/**
 * If present, it must be at least 1. This is because if there are no
 * optional elements, `has_optional_elements` must be false, and then
 * neither this field nor `optional_elements` is present.
 * \sa https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L99-L102 Source
 */
impl Zchunk_Preface {
    pub fn num_optional_elements(&self) -> Ref<'_, OptRc<Zchunk_CompressedInteger>> {
        self.num_optional_elements.borrow()
    }
}
impl Zchunk_Preface {
    pub fn optional_elements(&self) -> Ref<'_, Vec<OptRc<Zchunk_OptionalElement>>> {
        self.optional_elements.borrow()
    }
}
impl Zchunk_Preface {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

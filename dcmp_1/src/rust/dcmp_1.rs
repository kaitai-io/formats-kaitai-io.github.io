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
use super::dcmp_variable_length_integer::DcmpVariableLengthInteger;

/**
 * Compressed resource data in `'dcmp' (1)` format,
 * as stored in compressed resources with header type `8` and decompressor ID `1`.
 * 
 * The `'dcmp' (1)` decompressor resource is included in the System file of System 7.0 and later.
 * This compression format is used for a few compressed resources in System 7.0's files
 * (such as the Finder Help file).
 * This decompressor is also included with and used by some other Apple applications,
 * such as ResEdit.
 * (Note: ResEdit includes the `'dcmp' (1)` resource,
 * but none of its resources actually use this decompressor.)
 * 
 * This compression format supports some basic general-purpose compression schemes,
 * including backreferences to previous data and run-length encoding.
 * It also includes some types of compression tailored specifically to Mac OS resources,
 * including a set of single-byte codes that correspond to entries in a hard-coded lookup table.
 * 
 * The `'dcmp' (0)` compression format (see dcmp_0.ksy) is very similar to this format,
 * with the main difference that it operates mostly on units of 2 or 4 bytes.
 * This makes the ``dcmp' (0)` format more suitable for word-aligned data,
 * such as executable code, bitmaps, sounds, etc.
 * The `'dcmp' (0)` format also appears to be generally preferred over `'dcmp' (1)`,
 * with the latter only being used in resource files that contain mostly unaligned data,
 * such as text.
 * \sa https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/dcmp1.py Source
 */

#[derive(Default, Debug, Clone)]
pub struct Dcmp1 {
    pub _root: SharedType<Dcmp1>,
    pub _parent: SharedType<Dcmp1>,
    pub _self: SharedType<Self>,
    chunks: RefCell<Vec<OptRc<Dcmp1_Chunk>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dcmp1 {
    type Root = Dcmp1;
    type Parent = Dcmp1;

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
            while {
                let t = Self::read_into::<_, Dcmp1_Chunk>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.chunks.borrow_mut().push(t);
                let _t_chunks = self_rc.chunks.borrow();
                let _tmpa = _t_chunks.last().unwrap();
                _i += 1;
                let x = !(*_tmpa.tag() == 255);
                x
            } {}
        }
        Ok(())
    }
}
impl Dcmp1 {
}

/**
 * The sequence of chunks that make up the compressed data.
 */
impl Dcmp1 {
    pub fn chunks(&self) -> Ref<'_, Vec<OptRc<Dcmp1_Chunk>>> {
        self.chunks.borrow()
    }
}
impl Dcmp1 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * A single chunk of compressed data.
 * Each chunk in the compressed data expands to a sequence of bytes in the uncompressed data,
 * except when `tag == 0xff`,
 * which marks the end of the data and does not correspond to any bytes in the uncompressed data.
 * 
 * Most chunks are stateless and always expand to the same data,
 * regardless of where the chunk appears in the sequence.
 * However,
 * some chunks affect the behavior of future chunks,
 * or expand to different data depending on which chunks came before them.
 */

#[derive(Default, Debug, Clone)]
pub struct Dcmp1_Chunk {
    pub _root: SharedType<Dcmp1>,
    pub _parent: SharedType<Dcmp1>,
    pub _self: SharedType<Self>,
    tag: RefCell<u8>,
    body: RefCell<Option<Dcmp1_Chunk_Body>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Dcmp1_Chunk_Body {
    Dcmp1_Chunk_EndBody(OptRc<Dcmp1_Chunk_EndBody>),
    Dcmp1_Chunk_ExtendedBody(OptRc<Dcmp1_Chunk_ExtendedBody>),
    Dcmp1_Chunk_TableLookupBody(OptRc<Dcmp1_Chunk_TableLookupBody>),
    Dcmp1_Chunk_BackreferenceBody(OptRc<Dcmp1_Chunk_BackreferenceBody>),
    Dcmp1_Chunk_LiteralBody(OptRc<Dcmp1_Chunk_LiteralBody>),
}
impl From<&Dcmp1_Chunk_Body> for OptRc<Dcmp1_Chunk_EndBody> {
    fn from(v: &Dcmp1_Chunk_Body) -> Self {
        if let Dcmp1_Chunk_Body::Dcmp1_Chunk_EndBody(x) = v {
            return x.clone();
        }
        panic!("expected Dcmp1_Chunk_Body::Dcmp1_Chunk_EndBody, got {:?}", v)
    }
}
impl From<OptRc<Dcmp1_Chunk_EndBody>> for Dcmp1_Chunk_Body {
    fn from(v: OptRc<Dcmp1_Chunk_EndBody>) -> Self {
        Self::Dcmp1_Chunk_EndBody(v)
    }
}
impl From<&Dcmp1_Chunk_Body> for OptRc<Dcmp1_Chunk_ExtendedBody> {
    fn from(v: &Dcmp1_Chunk_Body) -> Self {
        if let Dcmp1_Chunk_Body::Dcmp1_Chunk_ExtendedBody(x) = v {
            return x.clone();
        }
        panic!("expected Dcmp1_Chunk_Body::Dcmp1_Chunk_ExtendedBody, got {:?}", v)
    }
}
impl From<OptRc<Dcmp1_Chunk_ExtendedBody>> for Dcmp1_Chunk_Body {
    fn from(v: OptRc<Dcmp1_Chunk_ExtendedBody>) -> Self {
        Self::Dcmp1_Chunk_ExtendedBody(v)
    }
}
impl From<&Dcmp1_Chunk_Body> for OptRc<Dcmp1_Chunk_TableLookupBody> {
    fn from(v: &Dcmp1_Chunk_Body) -> Self {
        if let Dcmp1_Chunk_Body::Dcmp1_Chunk_TableLookupBody(x) = v {
            return x.clone();
        }
        panic!("expected Dcmp1_Chunk_Body::Dcmp1_Chunk_TableLookupBody, got {:?}", v)
    }
}
impl From<OptRc<Dcmp1_Chunk_TableLookupBody>> for Dcmp1_Chunk_Body {
    fn from(v: OptRc<Dcmp1_Chunk_TableLookupBody>) -> Self {
        Self::Dcmp1_Chunk_TableLookupBody(v)
    }
}
impl From<&Dcmp1_Chunk_Body> for OptRc<Dcmp1_Chunk_BackreferenceBody> {
    fn from(v: &Dcmp1_Chunk_Body) -> Self {
        if let Dcmp1_Chunk_Body::Dcmp1_Chunk_BackreferenceBody(x) = v {
            return x.clone();
        }
        panic!("expected Dcmp1_Chunk_Body::Dcmp1_Chunk_BackreferenceBody, got {:?}", v)
    }
}
impl From<OptRc<Dcmp1_Chunk_BackreferenceBody>> for Dcmp1_Chunk_Body {
    fn from(v: OptRc<Dcmp1_Chunk_BackreferenceBody>) -> Self {
        Self::Dcmp1_Chunk_BackreferenceBody(v)
    }
}
impl From<&Dcmp1_Chunk_Body> for OptRc<Dcmp1_Chunk_LiteralBody> {
    fn from(v: &Dcmp1_Chunk_Body) -> Self {
        if let Dcmp1_Chunk_Body::Dcmp1_Chunk_LiteralBody(x) = v {
            return x.clone();
        }
        panic!("expected Dcmp1_Chunk_Body::Dcmp1_Chunk_LiteralBody, got {:?}", v)
    }
}
impl From<OptRc<Dcmp1_Chunk_LiteralBody>> for Dcmp1_Chunk_Body {
    fn from(v: OptRc<Dcmp1_Chunk_LiteralBody>) -> Self {
        Self::Dcmp1_Chunk_LiteralBody(v)
    }
}
impl KStruct for Dcmp1_Chunk {
    type Root = Dcmp1;
    type Parent = Dcmp1;

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
        *self_rc.tag.borrow_mut() = _io.read_u1()?.into();
        match if  ((((*self_rc.tag() as u8) >= (0 as u8))) && (((*self_rc.tag() as u8) <= (31 as u8))))  { Dcmp1_Chunk_TagKind::Literal.clone() } else { if  ((((*self_rc.tag() as u8) >= (32 as u8))) && (*self_rc.tag() <= 207))  { Dcmp1_Chunk_TagKind::Backreference.clone() } else { if  ((*self_rc.tag() >= 208) && (*self_rc.tag() <= 209))  { Dcmp1_Chunk_TagKind::Literal.clone() } else { if *self_rc.tag() == 210 { Dcmp1_Chunk_TagKind::Backreference.clone() } else { if  ((*self_rc.tag() >= 213) && (*self_rc.tag() <= 253))  { Dcmp1_Chunk_TagKind::TableLookup.clone() } else { if *self_rc.tag() == 254 { Dcmp1_Chunk_TagKind::Extended.clone() } else { if *self_rc.tag() == 255 { Dcmp1_Chunk_TagKind::End.clone() } else { Dcmp1_Chunk_TagKind::Invalid.clone() }.clone() }.clone() }.clone() }.clone() }.clone() }.clone() } {
            Dcmp1_Chunk_TagKind::Backreference => {
                let f = |t : &mut Dcmp1_Chunk_BackreferenceBody| Ok(t.set_params((*self_rc.tag()).try_into().map_err(|_| KError::CastError)?));
                let t = Self::read_into_with_init::<_, Dcmp1_Chunk_BackreferenceBody>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Dcmp1_Chunk_TagKind::End => {
                let t = Self::read_into::<_, Dcmp1_Chunk_EndBody>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Dcmp1_Chunk_TagKind::Extended => {
                let t = Self::read_into::<_, Dcmp1_Chunk_ExtendedBody>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Dcmp1_Chunk_TagKind::Literal => {
                let f = |t : &mut Dcmp1_Chunk_LiteralBody| Ok(t.set_params((*self_rc.tag()).try_into().map_err(|_| KError::CastError)?));
                let t = Self::read_into_with_init::<_, Dcmp1_Chunk_LiteralBody>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Dcmp1_Chunk_TagKind::TableLookup => {
                let f = |t : &mut Dcmp1_Chunk_TableLookupBody| Ok(t.set_params((*self_rc.tag()).try_into().map_err(|_| KError::CastError)?));
                let t = Self::read_into_with_init::<_, Dcmp1_Chunk_TableLookupBody>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Dcmp1_Chunk {
}

/**
 * The chunk's tag byte.
 * This controls the structure of the body and the meaning of the chunk.
 */
impl Dcmp1_Chunk {
    pub fn tag(&self) -> Ref<'_, u8> {
        self.tag.borrow()
    }
}

/**
 * The chunk's body.
 * 
 * Certain chunks do not have any data following the tag byte.
 * In this case,
 * the body is a zero-length structure.
 */
impl Dcmp1_Chunk {
    pub fn body(&self) -> Ref<'_, Option<Dcmp1_Chunk_Body>> {
        self.body.borrow()
    }
}
impl Dcmp1_Chunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Dcmp1_Chunk_TagKind {
    Invalid,
    Literal,
    Backreference,
    TableLookup,
    Extended,
    End,
    Unknown(i64),
}

impl TryFrom<i64> for Dcmp1_Chunk_TagKind {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Dcmp1_Chunk_TagKind> {
        match flag {
            -1 => Ok(Dcmp1_Chunk_TagKind::Invalid),
            0 => Ok(Dcmp1_Chunk_TagKind::Literal),
            1 => Ok(Dcmp1_Chunk_TagKind::Backreference),
            2 => Ok(Dcmp1_Chunk_TagKind::TableLookup),
            3 => Ok(Dcmp1_Chunk_TagKind::Extended),
            4 => Ok(Dcmp1_Chunk_TagKind::End),
            _ => Ok(Dcmp1_Chunk_TagKind::Unknown(flag)),
        }
    }
}

impl From<&Dcmp1_Chunk_TagKind> for i64 {
    fn from(v: &Dcmp1_Chunk_TagKind) -> Self {
        match *v {
            Dcmp1_Chunk_TagKind::Invalid => -1,
            Dcmp1_Chunk_TagKind::Literal => 0,
            Dcmp1_Chunk_TagKind::Backreference => 1,
            Dcmp1_Chunk_TagKind::TableLookup => 2,
            Dcmp1_Chunk_TagKind::Extended => 3,
            Dcmp1_Chunk_TagKind::End => 4,
            Dcmp1_Chunk_TagKind::Unknown(v) => v
        }
    }
}

impl Default for Dcmp1_Chunk_TagKind {
    fn default() -> Self { Dcmp1_Chunk_TagKind::Unknown(0) }
}


/**
 * The body of a backreference chunk.
 * 
 * This chunk expands to the data stored in a preceding literal chunk,
 * indicated by an index number (`index`).
 */

#[derive(Default, Debug, Clone)]
pub struct Dcmp1_Chunk_BackreferenceBody {
    pub _root: SharedType<Dcmp1>,
    pub _parent: SharedType<Dcmp1_Chunk>,
    pub _self: SharedType<Self>,
    tag: RefCell<u8>,
    index_separate_minus: RefCell<u8>,
    _io: RefCell<BytesReader>,
    f_index: Cell<bool>,
    index: RefCell<i32>,
    f_index_in_tag: Cell<bool>,
    index_in_tag: RefCell<i32>,
    f_index_separate: Cell<bool>,
    index_separate: RefCell<i32>,
    f_is_index_separate: Cell<bool>,
    is_index_separate: RefCell<bool>,
}
impl KStruct for Dcmp1_Chunk_BackreferenceBody {
    type Root = Dcmp1;
    type Parent = Dcmp1_Chunk;

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
        if *self_rc.is_index_separate()? {
            *self_rc.index_separate_minus.borrow_mut() = _io.read_u1()?.into();
        }
        Ok(())
    }
}
impl Dcmp1_Chunk_BackreferenceBody {
    pub fn tag(&self) -> Ref<'_, u8> {
        self.tag.borrow()
    }
}
impl Dcmp1_Chunk_BackreferenceBody {
    pub fn set_params(&mut self, tag: u8) {
        *self.tag.borrow_mut() = tag;
    }
}
impl Dcmp1_Chunk_BackreferenceBody {

    /**
     * The index of the referenced literal chunk.
     * 
     * Stored literals are assigned index numbers in the order in which they appear in the compressed data,
     * starting at 0.
     * Non-stored literals are not counted in the numbering and cannot be referenced using backreferences.
     * Once an index is assigned to a stored literal,
     * it is never changed or unassigned for the entire length of the compressed data.
     * 
     * As the name indicates,
     * a backreference can only reference stored literal chunks found *before* the backreference,
     * not ones that come after it.
     */
    pub fn index(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_index.get() {
            return Ok(self.index.borrow());
        }
        self.f_index.set(true);
        *self.index.borrow_mut() = (if *self.is_index_separate()? { *self.index_separate()? } else { *self.index_in_tag()? }) as i32;
        Ok(self.index.borrow())
    }

    /**
     * The index of the referenced literal chunk,
     * as stored in the tag byte.
     */
    pub fn index_in_tag(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_index_in_tag.get() {
            return Ok(self.index_in_tag.borrow());
        }
        self.f_index_in_tag.set(true);
        *self.index_in_tag.borrow_mut() = (((*self.tag() as u8) - (32 as u8))) as i32;
        Ok(self.index_in_tag.borrow())
    }

    /**
     * The index of the referenced literal chunk,
     * as stored separately from the tag byte,
     * with the implicit offset corrected for.
     */
    pub fn index_separate(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_index_separate.get() {
            return Ok(self.index_separate.borrow());
        }
        self.f_index_separate.set(true);
        if *self.is_index_separate()? {
            *self.index_separate.borrow_mut() = (((*self.index_separate_minus() as u8) + (176 as u8))) as i32;
        }
        Ok(self.index_separate.borrow())
    }

    /**
     * Whether the index is stored separately from the tag.
     */
    pub fn is_index_separate(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_index_separate.get() {
            return Ok(self.is_index_separate.borrow());
        }
        self.f_is_index_separate.set(true);
        *self.is_index_separate.borrow_mut() = (*self.tag() == 210) as bool;
        Ok(self.is_index_separate.borrow())
    }
}

/**
 * The index of the referenced literal chunk,
 * stored separately from the tag.
 * The value in this field is stored minus 0xb0.
 * 
 * This field is only present if the tag byte is 0xd2.
 * For other tag bytes,
 * the index is encoded in the tag byte.
 * Values smaller than 0xb0 cannot be stored in this field,
 * they must always be encoded in the tag byte.
 */
impl Dcmp1_Chunk_BackreferenceBody {
    pub fn index_separate_minus(&self) -> Ref<'_, u8> {
        self.index_separate_minus.borrow()
    }
}
impl Dcmp1_Chunk_BackreferenceBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * The body of an end chunk.
 * This body is always empty.
 * 
 * The last chunk in the compressed data must always be an end chunk.
 * An end chunk cannot appear elsewhere in the compressed data.
 */

#[derive(Default, Debug, Clone)]
pub struct Dcmp1_Chunk_EndBody {
    pub _root: SharedType<Dcmp1>,
    pub _parent: SharedType<Dcmp1_Chunk>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dcmp1_Chunk_EndBody {
    type Root = Dcmp1;
    type Parent = Dcmp1_Chunk;

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
impl Dcmp1_Chunk_EndBody {
}
impl Dcmp1_Chunk_EndBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * The body of an extended chunk.
 * The meaning of this chunk depends on the extended tag byte stored in the chunk data.
 */

#[derive(Default, Debug, Clone)]
pub struct Dcmp1_Chunk_ExtendedBody {
    pub _root: SharedType<Dcmp1>,
    pub _parent: SharedType<Dcmp1_Chunk>,
    pub _self: SharedType<Self>,
    tag: RefCell<u8>,
    body: RefCell<Option<Dcmp1_Chunk_ExtendedBody_Body>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Dcmp1_Chunk_ExtendedBody_Body {
    Dcmp1_Chunk_ExtendedBody_RepeatBody(OptRc<Dcmp1_Chunk_ExtendedBody_RepeatBody>),
}
impl From<&Dcmp1_Chunk_ExtendedBody_Body> for OptRc<Dcmp1_Chunk_ExtendedBody_RepeatBody> {
    fn from(v: &Dcmp1_Chunk_ExtendedBody_Body) -> Self {
        if let Dcmp1_Chunk_ExtendedBody_Body::Dcmp1_Chunk_ExtendedBody_RepeatBody(x) = v {
            return x.clone();
        }
        panic!("expected Dcmp1_Chunk_ExtendedBody_Body::Dcmp1_Chunk_ExtendedBody_RepeatBody, got {:?}", v)
    }
}
impl From<OptRc<Dcmp1_Chunk_ExtendedBody_RepeatBody>> for Dcmp1_Chunk_ExtendedBody_Body {
    fn from(v: OptRc<Dcmp1_Chunk_ExtendedBody_RepeatBody>) -> Self {
        Self::Dcmp1_Chunk_ExtendedBody_RepeatBody(v)
    }
}
impl Dcmp1_Chunk_ExtendedBody_Body {
    pub fn to_repeat_raw(&self) -> OptRc<DcmpVariableLengthInteger> {
        match self {
            Dcmp1_Chunk_ExtendedBody_Body::Dcmp1_Chunk_ExtendedBody_RepeatBody(x) => x.to_repeat_raw.borrow().clone(),
        }
    }
}
impl Dcmp1_Chunk_ExtendedBody_Body {
    pub fn repeat_count_m1_raw(&self) -> OptRc<DcmpVariableLengthInteger> {
        match self {
            Dcmp1_Chunk_ExtendedBody_Body::Dcmp1_Chunk_ExtendedBody_RepeatBody(x) => x.repeat_count_m1_raw.borrow().clone(),
        }
    }
}
impl KStruct for Dcmp1_Chunk_ExtendedBody {
    type Root = Dcmp1;
    type Parent = Dcmp1_Chunk;

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
        *self_rc.tag.borrow_mut() = _io.read_u1()?.into();
        match *self_rc.tag() {
            2 => {
                let t = Self::read_into::<_, Dcmp1_Chunk_ExtendedBody_RepeatBody>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Dcmp1_Chunk_ExtendedBody {
}

/**
 * The chunk's extended tag byte.
 * This controls the structure of the body and the meaning of the chunk.
 */
impl Dcmp1_Chunk_ExtendedBody {
    pub fn tag(&self) -> Ref<'_, u8> {
        self.tag.borrow()
    }
}

/**
 * The chunk's body.
 */
impl Dcmp1_Chunk_ExtendedBody {
    pub fn body(&self) -> Ref<'_, Option<Dcmp1_Chunk_ExtendedBody_Body>> {
        self.body.borrow()
    }
}
impl Dcmp1_Chunk_ExtendedBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * The body of a repeat chunk.
 * 
 * This chunk expands to the same byte repeated a number of times,
 * i. e. it implements a form of run-length encoding.
 */

#[derive(Default, Debug, Clone)]
pub struct Dcmp1_Chunk_ExtendedBody_RepeatBody {
    pub _root: SharedType<Dcmp1>,
    pub _parent: SharedType<Dcmp1_Chunk_ExtendedBody>,
    pub _self: SharedType<Self>,
    to_repeat_raw: RefCell<OptRc<DcmpVariableLengthInteger>>,
    repeat_count_m1_raw: RefCell<OptRc<DcmpVariableLengthInteger>>,
    _io: RefCell<BytesReader>,
    f_repeat_count: Cell<bool>,
    repeat_count: RefCell<i32>,
    f_repeat_count_m1: Cell<bool>,
    repeat_count_m1: RefCell<i32>,
    f_to_repeat: Cell<bool>,
    to_repeat: RefCell<i32>,
}
impl KStruct for Dcmp1_Chunk_ExtendedBody_RepeatBody {
    type Root = Dcmp1;
    type Parent = Dcmp1_Chunk_ExtendedBody;

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
        let t = Self::read_into::<_, DcmpVariableLengthInteger>(&*_io, None, None)?.into();
        *self_rc.to_repeat_raw.borrow_mut() = t;
        let t = Self::read_into::<_, DcmpVariableLengthInteger>(&*_io, None, None)?.into();
        *self_rc.repeat_count_m1_raw.borrow_mut() = t;
        Ok(())
    }
}
impl Dcmp1_Chunk_ExtendedBody_RepeatBody {

    /**
     * The number of times to repeat the value.
     * 
     * This value must be positive.
     */
    pub fn repeat_count(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_repeat_count.get() {
            return Ok(self.repeat_count.borrow());
        }
        self.f_repeat_count.set(true);
        *self.repeat_count.borrow_mut() = (((*self.repeat_count_m1()? as i32) + (1 as i32))) as i32;
        Ok(self.repeat_count.borrow())
    }

    /**
     * The number of times to repeat the value,
     * minus one.
     * 
     * This value must not be negative.
     */
    pub fn repeat_count_m1(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_repeat_count_m1.get() {
            return Ok(self.repeat_count_m1.borrow());
        }
        self.f_repeat_count_m1.set(true);
        *self.repeat_count_m1.borrow_mut() = (*self.repeat_count_m1_raw().value()?) as i32;
        Ok(self.repeat_count_m1.borrow())
    }

    /**
     * The value to repeat.
     * 
     * Although it is stored as a variable-length integer,
     * this value must fit into an unsigned 8-bit integer.
     */
    pub fn to_repeat(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_to_repeat.get() {
            return Ok(self.to_repeat.borrow());
        }
        self.f_to_repeat.set(true);
        *self.to_repeat.borrow_mut() = (*self.to_repeat_raw().value()?) as i32;
        Ok(self.to_repeat.borrow())
    }
}

/**
 * Raw variable-length integer representation of `to_repeat`.
 */
impl Dcmp1_Chunk_ExtendedBody_RepeatBody {
    pub fn to_repeat_raw(&self) -> Ref<'_, OptRc<DcmpVariableLengthInteger>> {
        self.to_repeat_raw.borrow()
    }
}

/**
 * Raw variable-length integer representation of `repeat_count_m1`.
 */
impl Dcmp1_Chunk_ExtendedBody_RepeatBody {
    pub fn repeat_count_m1_raw(&self) -> Ref<'_, OptRc<DcmpVariableLengthInteger>> {
        self.repeat_count_m1_raw.borrow()
    }
}
impl Dcmp1_Chunk_ExtendedBody_RepeatBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * The body of a literal data chunk.
 * 
 * The data that this chunk expands to is stored literally in the body (`literal`).
 * Optionally,
 * the literal data may also be stored for use by future backreference chunks (`do_store`).
 */

#[derive(Default, Debug, Clone)]
pub struct Dcmp1_Chunk_LiteralBody {
    pub _root: SharedType<Dcmp1>,
    pub _parent: SharedType<Dcmp1_Chunk>,
    pub _self: SharedType<Self>,
    tag: RefCell<u8>,
    len_literal_separate: RefCell<u8>,
    literal: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_do_store: Cell<bool>,
    do_store: RefCell<bool>,
    f_is_len_literal_separate: Cell<bool>,
    is_len_literal_separate: RefCell<bool>,
    f_len_literal: Cell<bool>,
    len_literal: RefCell<i32>,
    f_len_literal_m1_in_tag: Cell<bool>,
    len_literal_m1_in_tag: RefCell<i32>,
}
impl KStruct for Dcmp1_Chunk_LiteralBody {
    type Root = Dcmp1;
    type Parent = Dcmp1_Chunk;

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
        if *self_rc.is_len_literal_separate()? {
            *self_rc.len_literal_separate.borrow_mut() = _io.read_u1()?.into();
        }
        *self_rc.literal.borrow_mut() = _io.read_bytes(*self_rc.len_literal()? as usize)?.into();
        Ok(())
    }
}
impl Dcmp1_Chunk_LiteralBody {
    pub fn tag(&self) -> Ref<'_, u8> {
        self.tag.borrow()
    }
}
impl Dcmp1_Chunk_LiteralBody {
    pub fn set_params(&mut self, tag: u8) {
        *self.tag.borrow_mut() = tag;
    }
}
impl Dcmp1_Chunk_LiteralBody {

    /**
     * Whether this literal should be stored for use by future backreference chunks.
     * 
     * See the documentation of the `backreference_body` type for details about backreference chunks.
     */
    pub fn do_store(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_do_store.get() {
            return Ok(self.do_store.borrow());
        }
        self.f_do_store.set(true);
        *self.do_store.borrow_mut() = (if *self.is_len_literal_separate()? { *self.tag() == 209 } else { ((((*self.tag() as u8) & (16 as u8)) as i32) != (0 as i32)) }) as bool;
        Ok(self.do_store.borrow())
    }

    /**
     * Whether the length of the literal is stored separately from the tag.
     */
    pub fn is_len_literal_separate(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_len_literal_separate.get() {
            return Ok(self.is_len_literal_separate.borrow());
        }
        self.f_is_len_literal_separate.set(true);
        *self.is_len_literal_separate.borrow_mut() = (*self.tag() >= 208) as bool;
        Ok(self.is_len_literal_separate.borrow())
    }

    /**
     * The length of the literal data,
     * in bytes.
     * 
     * In practice,
     * this value is always greater than zero,
     * as there is no use in storing a zero-length literal.
     */
    pub fn len_literal(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_literal.get() {
            return Ok(self.len_literal.borrow());
        }
        self.f_len_literal.set(true);
        *self.len_literal.borrow_mut() = (if *self.is_len_literal_separate()? { *self.len_literal_separate() } else { ((*self.len_literal_m1_in_tag()? as i32) + (1 as i32)) }) as i32;
        Ok(self.len_literal.borrow())
    }

    /**
     * The part of the tag byte that indicates the length of the literal data,
     * in bytes,
     * minus one.
     * 
     * If the tag byte is 0xd0 or 0xd1,
     * the length is stored in a separate byte after the tag byte and before the literal data.
     */
    pub fn len_literal_m1_in_tag(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_literal_m1_in_tag.get() {
            return Ok(self.len_literal_m1_in_tag.borrow());
        }
        self.f_len_literal_m1_in_tag.set(true);
        if !(*self.is_len_literal_separate()?) {
            *self.len_literal_m1_in_tag.borrow_mut() = (((*self.tag() as u8) & (15 as u8))) as i32;
        }
        Ok(self.len_literal_m1_in_tag.borrow())
    }
}

/**
 * The length of the literal data,
 * in bytes.
 * 
 * This field is only present if the tag byte is 0xd0 or 0xd1.
 * In practice,
 * this only happens if the length is 0x11 or greater,
 * because smaller lengths can be encoded into the tag byte.
 */
impl Dcmp1_Chunk_LiteralBody {
    pub fn len_literal_separate(&self) -> Ref<'_, u8> {
        self.len_literal_separate.borrow()
    }
}

/**
 * The literal data.
 */
impl Dcmp1_Chunk_LiteralBody {
    pub fn literal(&self) -> Ref<'_, Vec<u8>> {
        self.literal.borrow()
    }
}
impl Dcmp1_Chunk_LiteralBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * The body of a table lookup chunk.
 * This body is always empty.
 * 
 * This chunk always expands to two bytes (`value`),
 * determined from the tag byte using a fixed lookup table (`lookup_table`).
 * This lookup table is hardcoded in the decompressor and always the same for all compressed data.
 */

#[derive(Default, Debug, Clone)]
pub struct Dcmp1_Chunk_TableLookupBody {
    pub _root: SharedType<Dcmp1>,
    pub _parent: SharedType<Dcmp1_Chunk>,
    pub _self: SharedType<Self>,
    tag: RefCell<u8>,
    _io: RefCell<BytesReader>,
    f_lookup_table: Cell<bool>,
    lookup_table: RefCell<Vec<Vec<u8>>>,
    f_value: Cell<bool>,
    value: RefCell<Vec<u8>>,
}
impl KStruct for Dcmp1_Chunk_TableLookupBody {
    type Root = Dcmp1;
    type Parent = Dcmp1_Chunk;

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
impl Dcmp1_Chunk_TableLookupBody {
    pub fn tag(&self) -> Ref<'_, u8> {
        self.tag.borrow()
    }
}
impl Dcmp1_Chunk_TableLookupBody {
    pub fn set_params(&mut self, tag: u8) {
        *self.tag.borrow_mut() = tag;
    }
}
impl Dcmp1_Chunk_TableLookupBody {

    /**
     * Fixed lookup table that maps tag byte numbers to two bytes each.
     * 
     * The entries in the lookup table are offset -
     * index 0 stands for tag 0xd5, 1 for 0xd6, etc.
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
        *self.lookup_table.borrow_mut() = vec![vec![0x0u8, 0x0u8], vec![0x0u8, 0x1u8], vec![0x0u8, 0x2u8], vec![0x0u8, 0x3u8], vec![0x2eu8, 0x1u8], vec![0x3eu8, 0x1u8], vec![0x1u8, 0x1u8], vec![0x1eu8, 0x1u8], vec![0xffu8, 0xffu8], vec![0xeu8, 0x1u8], vec![0x31u8, 0x0u8], vec![0x11u8, 0x12u8], vec![0x1u8, 0x7u8], vec![0x33u8, 0x32u8], vec![0x12u8, 0x39u8], vec![0xedu8, 0x10u8], vec![0x1u8, 0x27u8], vec![0x23u8, 0x22u8], vec![0x1u8, 0x37u8], vec![0x7u8, 0x6u8], vec![0x1u8, 0x17u8], vec![0x1u8, 0x23u8], vec![0x0u8, 0xffu8], vec![0x0u8, 0x2fu8], vec![0x7u8, 0xeu8], vec![0xfdu8, 0x3cu8], vec![0x1u8, 0x35u8], vec![0x1u8, 0x15u8], vec![0x1u8, 0x2u8], vec![0x0u8, 0x7u8], vec![0x0u8, 0x3eu8], vec![0x5u8, 0xd5u8], vec![0x2u8, 0x1u8], vec![0x6u8, 0x7u8], vec![0x7u8, 0x8u8], vec![0x30u8, 0x1u8], vec![0x1u8, 0x33u8], vec![0x0u8, 0x10u8], vec![0x17u8, 0x16u8], vec![0x37u8, 0x3eu8], vec![0x36u8, 0x37u8]].to_vec();
        Ok(self.lookup_table.borrow())
    }

    /**
     * The two bytes that the tag byte expands to,
     * based on the fixed lookup table.
     */
    pub fn value(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        self.f_value.set(true);
        *self.value.borrow_mut() = self.lookup_table()?[((*self.tag() as u8) - (213 as u8)) as usize].to_vec();
        Ok(self.value.borrow())
    }
}
impl Dcmp1_Chunk_TableLookupBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

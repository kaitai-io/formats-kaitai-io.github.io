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
 * Compressed resource data in `'dcmp' (0)` format,
 * as stored in compressed resources with header type `8` and decompressor ID `0`.
 * 
 * The `'dcmp' (0)` decompressor resource is included in the System file of System 7.0 and later.
 * This compression format is used for most compressed resources in System 7.0's files.
 * This decompressor is also included with and used by some other Apple applications,
 * such as ResEdit.
 * 
 * This compression format supports some basic general-purpose compression schemes,
 * including backreferences to previous data,
 * run-length encoding,
 * and delta encoding.
 * It also includes some types of compression tailored specifically to Mac OS resources,
 * including a set of single-byte codes that correspond to entries in a hard-coded lookup table,
 * and a specialized kind of delta encoding for segment loader jump tables.
 * 
 * Almost all parts of this compression format operate on units of 2 or 4 bytes.
 * As a result,
 * it is nearly impossible to store data with an odd length in this format.
 * To work around this limitation,
 * odd-length resources are padded with an extra byte before compressing them with this format.
 * This extra byte is ignored after decompression,
 * as the real (odd) length of the resource is stored in the compressed resource header.
 * 
 * The `'dcmp' (1)` compression format (see dcmp_1.ksy) is very similar to this format,
 * with the main difference that it operates mostly on single bytes rather than two-byte units.
 * \sa https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/dcmp0.py Source
 */

#[derive(Default, Debug, Clone)]
pub struct Dcmp0 {
    pub _root: SharedType<Dcmp0>,
    pub _parent: SharedType<Dcmp0>,
    pub _self: SharedType<Self>,
    chunks: RefCell<Vec<OptRc<Dcmp0_Chunk>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dcmp0 {
    type Root = Dcmp0;
    type Parent = Dcmp0;

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
                let t = Self::read_into::<_, Dcmp0_Chunk>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
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
impl Dcmp0 {
}

/**
 * The sequence of chunks that make up the compressed data.
 */
impl Dcmp0 {
    pub fn chunks(&self) -> Ref<'_, Vec<OptRc<Dcmp0_Chunk>>> {
        self.chunks.borrow()
    }
}
impl Dcmp0 {
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
pub struct Dcmp0_Chunk {
    pub _root: SharedType<Dcmp0>,
    pub _parent: SharedType<Dcmp0>,
    pub _self: SharedType<Self>,
    tag: RefCell<u8>,
    body: RefCell<Option<Dcmp0_Chunk_Body>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Dcmp0_Chunk_Body {
    Dcmp0_Chunk_EndBody(OptRc<Dcmp0_Chunk_EndBody>),
    Dcmp0_Chunk_ExtendedBody(OptRc<Dcmp0_Chunk_ExtendedBody>),
    Dcmp0_Chunk_TableLookupBody(OptRc<Dcmp0_Chunk_TableLookupBody>),
    Dcmp0_Chunk_BackreferenceBody(OptRc<Dcmp0_Chunk_BackreferenceBody>),
    Dcmp0_Chunk_LiteralBody(OptRc<Dcmp0_Chunk_LiteralBody>),
}
impl From<&Dcmp0_Chunk_Body> for OptRc<Dcmp0_Chunk_EndBody> {
    fn from(v: &Dcmp0_Chunk_Body) -> Self {
        if let Dcmp0_Chunk_Body::Dcmp0_Chunk_EndBody(x) = v {
            return x.clone();
        }
        panic!("expected Dcmp0_Chunk_Body::Dcmp0_Chunk_EndBody, got {:?}", v)
    }
}
impl From<OptRc<Dcmp0_Chunk_EndBody>> for Dcmp0_Chunk_Body {
    fn from(v: OptRc<Dcmp0_Chunk_EndBody>) -> Self {
        Self::Dcmp0_Chunk_EndBody(v)
    }
}
impl From<&Dcmp0_Chunk_Body> for OptRc<Dcmp0_Chunk_ExtendedBody> {
    fn from(v: &Dcmp0_Chunk_Body) -> Self {
        if let Dcmp0_Chunk_Body::Dcmp0_Chunk_ExtendedBody(x) = v {
            return x.clone();
        }
        panic!("expected Dcmp0_Chunk_Body::Dcmp0_Chunk_ExtendedBody, got {:?}", v)
    }
}
impl From<OptRc<Dcmp0_Chunk_ExtendedBody>> for Dcmp0_Chunk_Body {
    fn from(v: OptRc<Dcmp0_Chunk_ExtendedBody>) -> Self {
        Self::Dcmp0_Chunk_ExtendedBody(v)
    }
}
impl From<&Dcmp0_Chunk_Body> for OptRc<Dcmp0_Chunk_TableLookupBody> {
    fn from(v: &Dcmp0_Chunk_Body) -> Self {
        if let Dcmp0_Chunk_Body::Dcmp0_Chunk_TableLookupBody(x) = v {
            return x.clone();
        }
        panic!("expected Dcmp0_Chunk_Body::Dcmp0_Chunk_TableLookupBody, got {:?}", v)
    }
}
impl From<OptRc<Dcmp0_Chunk_TableLookupBody>> for Dcmp0_Chunk_Body {
    fn from(v: OptRc<Dcmp0_Chunk_TableLookupBody>) -> Self {
        Self::Dcmp0_Chunk_TableLookupBody(v)
    }
}
impl From<&Dcmp0_Chunk_Body> for OptRc<Dcmp0_Chunk_BackreferenceBody> {
    fn from(v: &Dcmp0_Chunk_Body) -> Self {
        if let Dcmp0_Chunk_Body::Dcmp0_Chunk_BackreferenceBody(x) = v {
            return x.clone();
        }
        panic!("expected Dcmp0_Chunk_Body::Dcmp0_Chunk_BackreferenceBody, got {:?}", v)
    }
}
impl From<OptRc<Dcmp0_Chunk_BackreferenceBody>> for Dcmp0_Chunk_Body {
    fn from(v: OptRc<Dcmp0_Chunk_BackreferenceBody>) -> Self {
        Self::Dcmp0_Chunk_BackreferenceBody(v)
    }
}
impl From<&Dcmp0_Chunk_Body> for OptRc<Dcmp0_Chunk_LiteralBody> {
    fn from(v: &Dcmp0_Chunk_Body) -> Self {
        if let Dcmp0_Chunk_Body::Dcmp0_Chunk_LiteralBody(x) = v {
            return x.clone();
        }
        panic!("expected Dcmp0_Chunk_Body::Dcmp0_Chunk_LiteralBody, got {:?}", v)
    }
}
impl From<OptRc<Dcmp0_Chunk_LiteralBody>> for Dcmp0_Chunk_Body {
    fn from(v: OptRc<Dcmp0_Chunk_LiteralBody>) -> Self {
        Self::Dcmp0_Chunk_LiteralBody(v)
    }
}
impl KStruct for Dcmp0_Chunk {
    type Root = Dcmp0;
    type Parent = Dcmp0;

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
        match if  ((((*self_rc.tag() as u8) >= (0 as u8))) && (((*self_rc.tag() as u8) <= (31 as u8))))  { Dcmp0_Chunk_TagKind::Literal.clone() } else { if  ((((*self_rc.tag() as u8) >= (32 as u8))) && (((*self_rc.tag() as u8) <= (74 as u8))))  { Dcmp0_Chunk_TagKind::Backreference.clone() } else { if  ((((*self_rc.tag() as u8) >= (75 as u8))) && (*self_rc.tag() <= 253))  { Dcmp0_Chunk_TagKind::TableLookup.clone() } else { if *self_rc.tag() == 254 { Dcmp0_Chunk_TagKind::Extended.clone() } else { if *self_rc.tag() == 255 { Dcmp0_Chunk_TagKind::End.clone() } else { Dcmp0_Chunk_TagKind::Invalid.clone() }.clone() }.clone() }.clone() }.clone() } {
            Dcmp0_Chunk_TagKind::Backreference => {
                let f = |t : &mut Dcmp0_Chunk_BackreferenceBody| Ok(t.set_params((*self_rc.tag()).try_into().map_err(|_| KError::CastError)?));
                let t = Self::read_into_with_init::<_, Dcmp0_Chunk_BackreferenceBody>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Dcmp0_Chunk_TagKind::End => {
                let t = Self::read_into::<_, Dcmp0_Chunk_EndBody>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Dcmp0_Chunk_TagKind::Extended => {
                let t = Self::read_into::<_, Dcmp0_Chunk_ExtendedBody>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Dcmp0_Chunk_TagKind::Literal => {
                let f = |t : &mut Dcmp0_Chunk_LiteralBody| Ok(t.set_params((*self_rc.tag()).try_into().map_err(|_| KError::CastError)?));
                let t = Self::read_into_with_init::<_, Dcmp0_Chunk_LiteralBody>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Dcmp0_Chunk_TagKind::TableLookup => {
                let f = |t : &mut Dcmp0_Chunk_TableLookupBody| Ok(t.set_params((*self_rc.tag()).try_into().map_err(|_| KError::CastError)?));
                let t = Self::read_into_with_init::<_, Dcmp0_Chunk_TableLookupBody>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Dcmp0_Chunk {
}

/**
 * The chunk's tag byte.
 * This controls the structure of the body and the meaning of the chunk.
 */
impl Dcmp0_Chunk {
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
impl Dcmp0_Chunk {
    pub fn body(&self) -> Ref<'_, Option<Dcmp0_Chunk_Body>> {
        self.body.borrow()
    }
}
impl Dcmp0_Chunk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Dcmp0_Chunk_TagKind {
    Invalid,
    Literal,
    Backreference,
    TableLookup,
    Extended,
    End,
    Unknown(i64),
}

impl TryFrom<i64> for Dcmp0_Chunk_TagKind {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Dcmp0_Chunk_TagKind> {
        match flag {
            -1 => Ok(Dcmp0_Chunk_TagKind::Invalid),
            0 => Ok(Dcmp0_Chunk_TagKind::Literal),
            1 => Ok(Dcmp0_Chunk_TagKind::Backreference),
            2 => Ok(Dcmp0_Chunk_TagKind::TableLookup),
            3 => Ok(Dcmp0_Chunk_TagKind::Extended),
            4 => Ok(Dcmp0_Chunk_TagKind::End),
            _ => Ok(Dcmp0_Chunk_TagKind::Unknown(flag)),
        }
    }
}

impl From<&Dcmp0_Chunk_TagKind> for i64 {
    fn from(v: &Dcmp0_Chunk_TagKind) -> Self {
        match *v {
            Dcmp0_Chunk_TagKind::Invalid => -1,
            Dcmp0_Chunk_TagKind::Literal => 0,
            Dcmp0_Chunk_TagKind::Backreference => 1,
            Dcmp0_Chunk_TagKind::TableLookup => 2,
            Dcmp0_Chunk_TagKind::Extended => 3,
            Dcmp0_Chunk_TagKind::End => 4,
            Dcmp0_Chunk_TagKind::Unknown(v) => v
        }
    }
}

impl Default for Dcmp0_Chunk_TagKind {
    fn default() -> Self { Dcmp0_Chunk_TagKind::Unknown(0) }
}


/**
 * The body of a backreference chunk.
 * 
 * This chunk expands to the data stored in a preceding literal chunk,
 * indicated by an index number (`index`).
 */

#[derive(Default, Debug, Clone)]
pub struct Dcmp0_Chunk_BackreferenceBody {
    pub _root: SharedType<Dcmp0>,
    pub _parent: SharedType<Dcmp0_Chunk>,
    pub _self: SharedType<Self>,
    tag: RefCell<u8>,
    index_separate_minus: RefCell<Option<Dcmp0_Chunk_BackreferenceBody_IndexSeparateMinus>>,
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
#[derive(Debug, Clone)]
pub enum Dcmp0_Chunk_BackreferenceBody_IndexSeparateMinus {
    U1(u8),
    U2(u16),
}
impl From<u8> for Dcmp0_Chunk_BackreferenceBody_IndexSeparateMinus {
    fn from(v: u8) -> Self {
        Self::U1(v)
    }
}
impl From<&Dcmp0_Chunk_BackreferenceBody_IndexSeparateMinus> for u8 {
    fn from(e: &Dcmp0_Chunk_BackreferenceBody_IndexSeparateMinus) -> Self {
        if let Dcmp0_Chunk_BackreferenceBody_IndexSeparateMinus::U1(v) = e {
            return *v
        }
        panic!("trying to convert from enum Dcmp0_Chunk_BackreferenceBody_IndexSeparateMinus::U1 to u8, enum value {:?}", e)
    }
}
impl From<u16> for Dcmp0_Chunk_BackreferenceBody_IndexSeparateMinus {
    fn from(v: u16) -> Self {
        Self::U2(v)
    }
}
impl From<&Dcmp0_Chunk_BackreferenceBody_IndexSeparateMinus> for u16 {
    fn from(e: &Dcmp0_Chunk_BackreferenceBody_IndexSeparateMinus) -> Self {
        if let Dcmp0_Chunk_BackreferenceBody_IndexSeparateMinus::U2(v) = e {
            return *v
        }
        panic!("trying to convert from enum Dcmp0_Chunk_BackreferenceBody_IndexSeparateMinus::U2 to u16, enum value {:?}", e)
    }
}
impl From<&Dcmp0_Chunk_BackreferenceBody_IndexSeparateMinus> for usize {
    fn from(e: &Dcmp0_Chunk_BackreferenceBody_IndexSeparateMinus) -> Self {
        match e {
            Dcmp0_Chunk_BackreferenceBody_IndexSeparateMinus::U1(v) => *v as usize,
            Dcmp0_Chunk_BackreferenceBody_IndexSeparateMinus::U2(v) => *v as usize,
        }
    }
}

impl KStruct for Dcmp0_Chunk_BackreferenceBody {
    type Root = Dcmp0;
    type Parent = Dcmp0_Chunk;

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
            match *self_rc.tag() {
                32 => {
                    *self_rc.index_separate_minus.borrow_mut() = Some(_io.read_u1()?.into());
                }
                33 => {
                    *self_rc.index_separate_minus.borrow_mut() = Some(_io.read_u1()?.into());
                }
                34 => {
                    *self_rc.index_separate_minus.borrow_mut() = Some(_io.read_u2be()?.into());
                }
                _ => {}
            }
        }
        Ok(())
    }
}
impl Dcmp0_Chunk_BackreferenceBody {
    pub fn tag(&self) -> Ref<'_, u8> {
        self.tag.borrow()
    }
}
impl Dcmp0_Chunk_BackreferenceBody {
    pub fn set_params(&mut self, tag: u8) {
        *self.tag.borrow_mut() = tag;
    }
}
impl Dcmp0_Chunk_BackreferenceBody {

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
        *self.index_in_tag.borrow_mut() = (((*self.tag() as u8) - (35 as u8))) as i32;
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
            *self.index_separate.borrow_mut() = (((((self.index_separate_minus() as u16) + (40 as u16)) as i32) + (if ((*self.tag() as u8) == (33 as u8)) { 256 } else { 0 } as i32))) as i32;
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
        *self.is_index_separate.borrow_mut() = ( ((((*self.tag() as u8) >= (32 as u8))) && (((*self.tag() as u8) <= (34 as u8)))) ) as bool;
        Ok(self.is_index_separate.borrow())
    }
}

/**
 * The index of the referenced literal chunk,
 * stored separately from the tag.
 * The value in this field is stored minus 0x28.
 * If the tag byte is 0x21,
 * the value is also stored minus 0x100,
 * *on top of* the regular offset
 * (i. e. minus 0x128 in total).
 * 
 * In other words,
 * for tag bytes 0x20 and 0x21,
 * the index is actually 9 bits large,
 * with the low 8 bits stored separately and the highest bit stored in the lowest bit of the tag byte.
 * 
 * This field is only present if the tag byte is 0x20 through 0x22.
 * For higher tag bytes,
 * the index is encoded in the tag byte.
 * Values smaller than 0x28 cannot be stored in this field,
 * they must always be encoded in the tag byte.
 */
impl Dcmp0_Chunk_BackreferenceBody {
    pub fn index_separate_minus(&self) -> usize {
        self.index_separate_minus.borrow().as_ref().unwrap().into()
    }
    pub fn index_separate_minus_enum(&self) -> Ref<'_, Option<Dcmp0_Chunk_BackreferenceBody_IndexSeparateMinus>> {
        self.index_separate_minus.borrow()
    }
}
impl Dcmp0_Chunk_BackreferenceBody {
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
pub struct Dcmp0_Chunk_EndBody {
    pub _root: SharedType<Dcmp0>,
    pub _parent: SharedType<Dcmp0_Chunk>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dcmp0_Chunk_EndBody {
    type Root = Dcmp0;
    type Parent = Dcmp0_Chunk;

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
impl Dcmp0_Chunk_EndBody {
}
impl Dcmp0_Chunk_EndBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * The body of an extended chunk.
 * The meaning of this chunk depends on the extended tag byte stored in the chunk data.
 */

#[derive(Default, Debug, Clone)]
pub struct Dcmp0_Chunk_ExtendedBody {
    pub _root: SharedType<Dcmp0>,
    pub _parent: SharedType<Dcmp0_Chunk>,
    pub _self: SharedType<Self>,
    tag: RefCell<u8>,
    body: RefCell<Option<Dcmp0_Chunk_ExtendedBody_Body>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Dcmp0_Chunk_ExtendedBody_Body {
    Dcmp0_Chunk_ExtendedBody_JumpTableBody(OptRc<Dcmp0_Chunk_ExtendedBody_JumpTableBody>),
    Dcmp0_Chunk_ExtendedBody_RepeatBody(OptRc<Dcmp0_Chunk_ExtendedBody_RepeatBody>),
    Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody(OptRc<Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody>),
    Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody(OptRc<Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody>),
}
impl From<&Dcmp0_Chunk_ExtendedBody_Body> for OptRc<Dcmp0_Chunk_ExtendedBody_JumpTableBody> {
    fn from(v: &Dcmp0_Chunk_ExtendedBody_Body) -> Self {
        if let Dcmp0_Chunk_ExtendedBody_Body::Dcmp0_Chunk_ExtendedBody_JumpTableBody(x) = v {
            return x.clone();
        }
        panic!("expected Dcmp0_Chunk_ExtendedBody_Body::Dcmp0_Chunk_ExtendedBody_JumpTableBody, got {:?}", v)
    }
}
impl From<OptRc<Dcmp0_Chunk_ExtendedBody_JumpTableBody>> for Dcmp0_Chunk_ExtendedBody_Body {
    fn from(v: OptRc<Dcmp0_Chunk_ExtendedBody_JumpTableBody>) -> Self {
        Self::Dcmp0_Chunk_ExtendedBody_JumpTableBody(v)
    }
}
impl From<&Dcmp0_Chunk_ExtendedBody_Body> for OptRc<Dcmp0_Chunk_ExtendedBody_RepeatBody> {
    fn from(v: &Dcmp0_Chunk_ExtendedBody_Body) -> Self {
        if let Dcmp0_Chunk_ExtendedBody_Body::Dcmp0_Chunk_ExtendedBody_RepeatBody(x) = v {
            return x.clone();
        }
        panic!("expected Dcmp0_Chunk_ExtendedBody_Body::Dcmp0_Chunk_ExtendedBody_RepeatBody, got {:?}", v)
    }
}
impl From<OptRc<Dcmp0_Chunk_ExtendedBody_RepeatBody>> for Dcmp0_Chunk_ExtendedBody_Body {
    fn from(v: OptRc<Dcmp0_Chunk_ExtendedBody_RepeatBody>) -> Self {
        Self::Dcmp0_Chunk_ExtendedBody_RepeatBody(v)
    }
}
impl From<&Dcmp0_Chunk_ExtendedBody_Body> for OptRc<Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody> {
    fn from(v: &Dcmp0_Chunk_ExtendedBody_Body) -> Self {
        if let Dcmp0_Chunk_ExtendedBody_Body::Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody(x) = v {
            return x.clone();
        }
        panic!("expected Dcmp0_Chunk_ExtendedBody_Body::Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody, got {:?}", v)
    }
}
impl From<OptRc<Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody>> for Dcmp0_Chunk_ExtendedBody_Body {
    fn from(v: OptRc<Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody>) -> Self {
        Self::Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody(v)
    }
}
impl From<&Dcmp0_Chunk_ExtendedBody_Body> for OptRc<Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody> {
    fn from(v: &Dcmp0_Chunk_ExtendedBody_Body) -> Self {
        if let Dcmp0_Chunk_ExtendedBody_Body::Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody(x) = v {
            return x.clone();
        }
        panic!("expected Dcmp0_Chunk_ExtendedBody_Body::Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody, got {:?}", v)
    }
}
impl From<OptRc<Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody>> for Dcmp0_Chunk_ExtendedBody_Body {
    fn from(v: OptRc<Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody>) -> Self {
        Self::Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody(v)
    }
}
impl KStruct for Dcmp0_Chunk_ExtendedBody {
    type Root = Dcmp0;
    type Parent = Dcmp0_Chunk;

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
            0 => {
                let t = Self::read_into::<_, Dcmp0_Chunk_ExtendedBody_JumpTableBody>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            2 => {
                let f = |t : &mut Dcmp0_Chunk_ExtendedBody_RepeatBody| Ok(t.set_params((*self_rc.tag()).try_into().map_err(|_| KError::CastError)?));
                let t = Self::read_into_with_init::<_, Dcmp0_Chunk_ExtendedBody_RepeatBody>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            3 => {
                let f = |t : &mut Dcmp0_Chunk_ExtendedBody_RepeatBody| Ok(t.set_params((*self_rc.tag()).try_into().map_err(|_| KError::CastError)?));
                let t = Self::read_into_with_init::<_, Dcmp0_Chunk_ExtendedBody_RepeatBody>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            4 => {
                let t = Self::read_into::<_, Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            6 => {
                let t = Self::read_into::<_, Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Dcmp0_Chunk_ExtendedBody {
}

/**
 * The chunk's extended tag byte.
 * This controls the structure of the body and the meaning of the chunk.
 */
impl Dcmp0_Chunk_ExtendedBody {
    pub fn tag(&self) -> Ref<'_, u8> {
        self.tag.borrow()
    }
}

/**
 * The chunk's body.
 */
impl Dcmp0_Chunk_ExtendedBody {
    pub fn body(&self) -> Ref<'_, Option<Dcmp0_Chunk_ExtendedBody_Body>> {
        self.body.borrow()
    }
}
impl Dcmp0_Chunk_ExtendedBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * The body of a 16-bit delta encoding chunk.
 * 
 * This chunk expands to a sequence of 16-bit big-endian integer values.
 * The first value is stored literally.
 * All following values are stored as deltas relative to the previous value.
 */

#[derive(Default, Debug, Clone)]
pub struct Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody {
    pub _root: SharedType<Dcmp0>,
    pub _parent: SharedType<Dcmp0_Chunk_ExtendedBody>,
    pub _self: SharedType<Self>,
    first_value_raw: RefCell<OptRc<DcmpVariableLengthInteger>>,
    num_deltas_raw: RefCell<OptRc<DcmpVariableLengthInteger>>,
    deltas: RefCell<Vec<i8>>,
    _io: RefCell<BytesReader>,
    f_first_value: Cell<bool>,
    first_value: RefCell<i32>,
    f_num_deltas: Cell<bool>,
    num_deltas: RefCell<i32>,
}
impl KStruct for Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody {
    type Root = Dcmp0;
    type Parent = Dcmp0_Chunk_ExtendedBody;

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
        *self_rc.first_value_raw.borrow_mut() = t;
        let t = Self::read_into::<_, DcmpVariableLengthInteger>(&*_io, None, None)?.into();
        *self_rc.num_deltas_raw.borrow_mut() = t;
        *self_rc.deltas.borrow_mut() = Vec::new();
        let l_deltas = *self_rc.num_deltas()?;
        for _i in 0..l_deltas {
            self_rc.deltas.borrow_mut().push(_io.read_s1()?.into());
        }
        Ok(())
    }
}
impl Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody {

    /**
     * The first value in the sequence.
     * 
     * Although it is stored as a variable-length integer,
     * this value must be in the range `-0x8000 <= x <= 0x7fff`,
     * i. e. a signed 16-bit integer.
     */
    pub fn first_value(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_first_value.get() {
            return Ok(self.first_value.borrow());
        }
        self.f_first_value.set(true);
        *self.first_value.borrow_mut() = (*self.first_value_raw().value()?) as i32;
        Ok(self.first_value.borrow())
    }

    /**
     * The number of deltas stored in this chunk.
     * 
     * This number must not be negative.
     */
    pub fn num_deltas(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_deltas.get() {
            return Ok(self.num_deltas.borrow());
        }
        self.f_num_deltas.set(true);
        *self.num_deltas.borrow_mut() = (*self.num_deltas_raw().value()?) as i32;
        Ok(self.num_deltas.borrow())
    }
}

/**
 * Raw variable-length integer representation of `first_value`.
 */
impl Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody {
    pub fn first_value_raw(&self) -> Ref<'_, OptRc<DcmpVariableLengthInteger>> {
        self.first_value_raw.borrow()
    }
}

/**
 * Raw variable-length integer representation of `num_deltas`.
 */
impl Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody {
    pub fn num_deltas_raw(&self) -> Ref<'_, OptRc<DcmpVariableLengthInteger>> {
        self.num_deltas_raw.borrow()
    }
}

/**
 * The deltas for each value relative to the previous value.
 * 
 * Each of these deltas is a signed 8-bit value.
 * When adding the delta to the previous value,
 * 16-bit integer wraparound is performed if necessary,
 * so that the resulting value always fits into a 16-bit signed integer.
 */
impl Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody {
    pub fn deltas(&self) -> Ref<'_, Vec<i8>> {
        self.deltas.borrow()
    }
}
impl Dcmp0_Chunk_ExtendedBody_DeltaEncoding16BitBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * The body of a 32-bit delta encoding chunk.
 * 
 * This chunk expands to a sequence of 32-bit big-endian integer values.
 * The first value is stored literally.
 * All following values are stored as deltas relative to the previous value.
 */

#[derive(Default, Debug, Clone)]
pub struct Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody {
    pub _root: SharedType<Dcmp0>,
    pub _parent: SharedType<Dcmp0_Chunk_ExtendedBody>,
    pub _self: SharedType<Self>,
    first_value_raw: RefCell<OptRc<DcmpVariableLengthInteger>>,
    num_deltas_raw: RefCell<OptRc<DcmpVariableLengthInteger>>,
    deltas_raw: RefCell<Vec<OptRc<DcmpVariableLengthInteger>>>,
    _io: RefCell<BytesReader>,
    f_first_value: Cell<bool>,
    first_value: RefCell<i32>,
    f_num_deltas: Cell<bool>,
    num_deltas: RefCell<i32>,
}
impl KStruct for Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody {
    type Root = Dcmp0;
    type Parent = Dcmp0_Chunk_ExtendedBody;

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
        *self_rc.first_value_raw.borrow_mut() = t;
        let t = Self::read_into::<_, DcmpVariableLengthInteger>(&*_io, None, None)?.into();
        *self_rc.num_deltas_raw.borrow_mut() = t;
        *self_rc.deltas_raw.borrow_mut() = Vec::new();
        let l_deltas_raw = *self_rc.num_deltas()?;
        for _i in 0..l_deltas_raw {
            let t = Self::read_into::<_, DcmpVariableLengthInteger>(&*_io, None, None)?.into();
            self_rc.deltas_raw.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody {

    /**
     * The first value in the sequence.
     */
    pub fn first_value(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_first_value.get() {
            return Ok(self.first_value.borrow());
        }
        self.f_first_value.set(true);
        *self.first_value.borrow_mut() = (*self.first_value_raw().value()?) as i32;
        Ok(self.first_value.borrow())
    }

    /**
     * The number of deltas stored in this chunk.
     * 
     * This number must not be negative.
     */
    pub fn num_deltas(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_deltas.get() {
            return Ok(self.num_deltas.borrow());
        }
        self.f_num_deltas.set(true);
        *self.num_deltas.borrow_mut() = (*self.num_deltas_raw().value()?) as i32;
        Ok(self.num_deltas.borrow())
    }
}

/**
 * Raw variable-length integer representation of `first_value`.
 */
impl Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody {
    pub fn first_value_raw(&self) -> Ref<'_, OptRc<DcmpVariableLengthInteger>> {
        self.first_value_raw.borrow()
    }
}

/**
 * Raw variable-length integer representation of `num_deltas`.
 */
impl Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody {
    pub fn num_deltas_raw(&self) -> Ref<'_, OptRc<DcmpVariableLengthInteger>> {
        self.num_deltas_raw.borrow()
    }
}

/**
 * The deltas for each value relative to the previous value,
 * stored as variable-length integers.
 * 
 * Each of these deltas is a signed value.
 * When adding the delta to the previous value,
 * 32-bit integer wraparound is performed if necessary,
 * so that the resulting value always fits into a 32-bit signed integer.
 */
impl Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody {
    pub fn deltas_raw(&self) -> Ref<'_, Vec<OptRc<DcmpVariableLengthInteger>>> {
        self.deltas_raw.borrow()
    }
}
impl Dcmp0_Chunk_ExtendedBody_DeltaEncoding32BitBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * The body of a jump table chunk.
 * 
 * This chunk generates parts of a segment loader jump table,
 * in the format found in `'CODE' (0)` resources.
 * It expands to the following data,
 * with all non-constant numbers encoded as unsigned 16-bit big-endian integers:
 * 
 * * `0x3f 0x3c` (push following segment number onto stack)
 * * The segment number
 * * `0xa9 0xf0` (`_LoadSeg` trap)
 * * For each address:
 *   * The address
 *   * `0x3f 0x3c` (push following segment number onto stack)
 *   * The segment number
 *   * `0xa9 0xf0` (`_LoadSeg` trap)
 * 
 * Note that this generates one jump table entry without an address before it,
 * meaning that this address needs to be generated by the preceding chunk.
 * All following jump table entries are generated with the addresses encoded in this chunk.
 */

#[derive(Default, Debug, Clone)]
pub struct Dcmp0_Chunk_ExtendedBody_JumpTableBody {
    pub _root: SharedType<Dcmp0>,
    pub _parent: SharedType<Dcmp0_Chunk_ExtendedBody>,
    pub _self: SharedType<Self>,
    segment_number_raw: RefCell<OptRc<DcmpVariableLengthInteger>>,
    num_addresses_raw: RefCell<OptRc<DcmpVariableLengthInteger>>,
    addresses_raw: RefCell<Vec<OptRc<DcmpVariableLengthInteger>>>,
    _io: RefCell<BytesReader>,
    f_num_addresses: Cell<bool>,
    num_addresses: RefCell<i32>,
    f_segment_number: Cell<bool>,
    segment_number: RefCell<i32>,
}
impl KStruct for Dcmp0_Chunk_ExtendedBody_JumpTableBody {
    type Root = Dcmp0;
    type Parent = Dcmp0_Chunk_ExtendedBody;

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
        *self_rc.segment_number_raw.borrow_mut() = t;
        let t = Self::read_into::<_, DcmpVariableLengthInteger>(&*_io, None, None)?.into();
        *self_rc.num_addresses_raw.borrow_mut() = t;
        *self_rc.addresses_raw.borrow_mut() = Vec::new();
        let l_addresses_raw = *self_rc.num_addresses()?;
        for _i in 0..l_addresses_raw {
            let t = Self::read_into::<_, DcmpVariableLengthInteger>(&*_io, None, None)?.into();
            self_rc.addresses_raw.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Dcmp0_Chunk_ExtendedBody_JumpTableBody {

    /**
     * The number of addresses stored in this chunk.
     * 
     * This number must be greater than 0.
     */
    pub fn num_addresses(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_addresses.get() {
            return Ok(self.num_addresses.borrow());
        }
        self.f_num_addresses.set(true);
        *self.num_addresses.borrow_mut() = (*self.num_addresses_raw().value()?) as i32;
        Ok(self.num_addresses.borrow())
    }

    /**
     * The segment number for all of the generated jump table entries.
     * 
     * Although it is stored as a variable-length integer,
     * the segment number must be in the range `0x0 <= x <= 0xffff`,
     * i. e. an unsigned 16-bit integer.
     */
    pub fn segment_number(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_segment_number.get() {
            return Ok(self.segment_number.borrow());
        }
        self.f_segment_number.set(true);
        *self.segment_number.borrow_mut() = (*self.segment_number_raw().value()?) as i32;
        Ok(self.segment_number.borrow())
    }
}

/**
 * Raw variable-length integer representation of `segment_number`.
 */
impl Dcmp0_Chunk_ExtendedBody_JumpTableBody {
    pub fn segment_number_raw(&self) -> Ref<'_, OptRc<DcmpVariableLengthInteger>> {
        self.segment_number_raw.borrow()
    }
}

/**
 * Raw variable-length integer representation of `num_addresses`.
 */
impl Dcmp0_Chunk_ExtendedBody_JumpTableBody {
    pub fn num_addresses_raw(&self) -> Ref<'_, OptRc<DcmpVariableLengthInteger>> {
        self.num_addresses_raw.borrow()
    }
}

/**
 * The addresses for each generated jump table entry,
 * stored as variable-length integers.
 * 
 * The first address is stored literally and must be in the range `0x0 <= x <= 0xffff`,
 * i. e. an unsigned 16-bit integer.
 * 
 * All following addresses are stored as deltas relative to the previous address.
 * Each of these deltas is stored plus 6;
 * this value needs to be subtracted before (or after) adding it to the previous address.
 * 
 * Each delta (after subtracting 6) should be positive,
 * and adding it to the previous address should not result in a value larger than `0xffff`,
 * i. e. there should be no 16-bit unsigned integer wraparound.
 * These conditions are always met in all known jump table chunks,
 * so it is not known how the original decompressor behaves otherwise.
 */
impl Dcmp0_Chunk_ExtendedBody_JumpTableBody {
    pub fn addresses_raw(&self) -> Ref<'_, Vec<OptRc<DcmpVariableLengthInteger>>> {
        self.addresses_raw.borrow()
    }
}
impl Dcmp0_Chunk_ExtendedBody_JumpTableBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * The body of a repeat chunk.
 * 
 * This chunk expands to a 1-byte or 2-byte value repeated a number of times,
 * i. e. it implements a form of run-length encoding.
 */

#[derive(Default, Debug, Clone)]
pub struct Dcmp0_Chunk_ExtendedBody_RepeatBody {
    pub _root: SharedType<Dcmp0>,
    pub _parent: SharedType<Dcmp0_Chunk_ExtendedBody>,
    pub _self: SharedType<Self>,
    tag: RefCell<u8>,
    to_repeat_raw: RefCell<OptRc<DcmpVariableLengthInteger>>,
    repeat_count_m1_raw: RefCell<OptRc<DcmpVariableLengthInteger>>,
    _io: RefCell<BytesReader>,
    f_byte_count: Cell<bool>,
    byte_count: RefCell<i32>,
    f_repeat_count: Cell<bool>,
    repeat_count: RefCell<i32>,
    f_repeat_count_m1: Cell<bool>,
    repeat_count_m1: RefCell<i32>,
    f_to_repeat: Cell<bool>,
    to_repeat: RefCell<i32>,
}
impl KStruct for Dcmp0_Chunk_ExtendedBody_RepeatBody {
    type Root = Dcmp0;
    type Parent = Dcmp0_Chunk_ExtendedBody;

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
impl Dcmp0_Chunk_ExtendedBody_RepeatBody {
    pub fn tag(&self) -> Ref<'_, u8> {
        self.tag.borrow()
    }
}
impl Dcmp0_Chunk_ExtendedBody_RepeatBody {
    pub fn set_params(&mut self, tag: u8) {
        *self.tag.borrow_mut() = tag;
    }
}
impl Dcmp0_Chunk_ExtendedBody_RepeatBody {

    /**
     * The length in bytes of the value to be repeated.
     * Regardless of the byte count,
     * the value to be repeated is stored as a variable-length integer.
     */
    pub fn byte_count(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_byte_count.get() {
            return Ok(self.byte_count.borrow());
        }
        self.f_byte_count.set(true);
        *self.byte_count.borrow_mut() = (if ((*self.tag() as u8) == (2 as u8)) { 1 } else { if ((*self.tag() as u8) == (3 as u8)) { 2 } else { -1 } }) as i32;
        Ok(self.byte_count.borrow())
    }

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
     * this value must fit into an unsigned big-endian integer that is as long as `byte_count`,
     * i. e. either 8 or 16 bits.
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
impl Dcmp0_Chunk_ExtendedBody_RepeatBody {
    pub fn to_repeat_raw(&self) -> Ref<'_, OptRc<DcmpVariableLengthInteger>> {
        self.to_repeat_raw.borrow()
    }
}

/**
 * Raw variable-length integer representation of `repeat_count_m1`.
 */
impl Dcmp0_Chunk_ExtendedBody_RepeatBody {
    pub fn repeat_count_m1_raw(&self) -> Ref<'_, OptRc<DcmpVariableLengthInteger>> {
        self.repeat_count_m1_raw.borrow()
    }
}
impl Dcmp0_Chunk_ExtendedBody_RepeatBody {
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
 * 
 * The length of the literal data is stored as a number of two-byte units.
 * This means that the literal data always has an even length in bytes.
 */

#[derive(Default, Debug, Clone)]
pub struct Dcmp0_Chunk_LiteralBody {
    pub _root: SharedType<Dcmp0>,
    pub _parent: SharedType<Dcmp0_Chunk>,
    pub _self: SharedType<Self>,
    tag: RefCell<u8>,
    len_literal_div2_separate: RefCell<u8>,
    literal: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_do_store: Cell<bool>,
    do_store: RefCell<bool>,
    f_is_len_literal_div2_separate: Cell<bool>,
    is_len_literal_div2_separate: RefCell<bool>,
    f_len_literal: Cell<bool>,
    len_literal: RefCell<i32>,
    f_len_literal_div2: Cell<bool>,
    len_literal_div2: RefCell<i32>,
    f_len_literal_div2_in_tag: Cell<bool>,
    len_literal_div2_in_tag: RefCell<i32>,
}
impl KStruct for Dcmp0_Chunk_LiteralBody {
    type Root = Dcmp0;
    type Parent = Dcmp0_Chunk;

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
        if *self_rc.is_len_literal_div2_separate()? {
            *self_rc.len_literal_div2_separate.borrow_mut() = _io.read_u1()?.into();
        }
        *self_rc.literal.borrow_mut() = _io.read_bytes(*self_rc.len_literal()? as usize)?.into();
        Ok(())
    }
}
impl Dcmp0_Chunk_LiteralBody {
    pub fn tag(&self) -> Ref<'_, u8> {
        self.tag.borrow()
    }
}
impl Dcmp0_Chunk_LiteralBody {
    pub fn set_params(&mut self, tag: u8) {
        *self.tag.borrow_mut() = tag;
    }
}
impl Dcmp0_Chunk_LiteralBody {

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
        *self.do_store.borrow_mut() = (((((*self.tag() as u8) & (16 as u8)) as i32) != (0 as i32))) as bool;
        Ok(self.do_store.borrow())
    }

    /**
     * Whether the length of the literal is stored separately from the tag.
     */
    pub fn is_len_literal_div2_separate(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_len_literal_div2_separate.get() {
            return Ok(self.is_len_literal_div2_separate.borrow());
        }
        self.f_is_len_literal_div2_separate.set(true);
        *self.is_len_literal_div2_separate.borrow_mut() = (((*self.len_literal_div2_in_tag()? as i32) == (0 as i32))) as bool;
        Ok(self.is_len_literal_div2_separate.borrow())
    }

    /**
     * The length of the literal data,
     * in bytes.
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
        *self.len_literal.borrow_mut() = (((*self.len_literal_div2()? as i32) * (2 as i32))) as i32;
        Ok(self.len_literal.borrow())
    }

    /**
     * The length of the literal data,
     * in two-byte units.
     * 
     * In practice,
     * this value is always greater than zero,
     * as there is no use in storing a zero-length literal.
     */
    pub fn len_literal_div2(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_literal_div2.get() {
            return Ok(self.len_literal_div2.borrow());
        }
        self.f_len_literal_div2.set(true);
        *self.len_literal_div2.borrow_mut() = (if *self.is_len_literal_div2_separate()? { *self.len_literal_div2_separate() } else { *self.len_literal_div2_in_tag()? }) as i32;
        Ok(self.len_literal_div2.borrow())
    }

    /**
     * The part of the tag byte that indicates the length of the literal data,
     * in two-byte units.
     * If this value is 0,
     * the length is stored in a separate byte after the tag byte and before the literal data.
     */
    pub fn len_literal_div2_in_tag(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_literal_div2_in_tag.get() {
            return Ok(self.len_literal_div2_in_tag.borrow());
        }
        self.f_len_literal_div2_in_tag.set(true);
        *self.len_literal_div2_in_tag.borrow_mut() = (((*self.tag() as u8) & (15 as u8))) as i32;
        Ok(self.len_literal_div2_in_tag.borrow())
    }
}

/**
 * The length of the literal data,
 * in two-byte units.
 * 
 * This field is only present if the tag byte's low nibble is zero.
 * In practice,
 * this only happens if the length is 0x10 or greater,
 * because smaller lengths can be encoded into the tag byte.
 */
impl Dcmp0_Chunk_LiteralBody {
    pub fn len_literal_div2_separate(&self) -> Ref<'_, u8> {
        self.len_literal_div2_separate.borrow()
    }
}

/**
 * The literal data.
 */
impl Dcmp0_Chunk_LiteralBody {
    pub fn literal(&self) -> Ref<'_, Vec<u8>> {
        self.literal.borrow()
    }
}
impl Dcmp0_Chunk_LiteralBody {
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
pub struct Dcmp0_Chunk_TableLookupBody {
    pub _root: SharedType<Dcmp0>,
    pub _parent: SharedType<Dcmp0_Chunk>,
    pub _self: SharedType<Self>,
    tag: RefCell<u8>,
    _io: RefCell<BytesReader>,
    f_lookup_table: Cell<bool>,
    lookup_table: RefCell<Vec<Vec<u8>>>,
    f_value: Cell<bool>,
    value: RefCell<Vec<u8>>,
}
impl KStruct for Dcmp0_Chunk_TableLookupBody {
    type Root = Dcmp0;
    type Parent = Dcmp0_Chunk;

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
impl Dcmp0_Chunk_TableLookupBody {
    pub fn tag(&self) -> Ref<'_, u8> {
        self.tag.borrow()
    }
}
impl Dcmp0_Chunk_TableLookupBody {
    pub fn set_params(&mut self, tag: u8) {
        *self.tag.borrow_mut() = tag;
    }
}
impl Dcmp0_Chunk_TableLookupBody {

    /**
     * Fixed lookup table that maps tag byte numbers to two bytes each.
     * 
     * The entries in the lookup table are offset -
     * index 0 stands for tag 0x4b, 1 for 0x4c, etc.
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
        *self.lookup_table.borrow_mut() = vec![vec![0x0u8, 0x0u8], vec![0x4eu8, 0xbau8], vec![0x0u8, 0x8u8], vec![0x4eu8, 0x75u8], vec![0x0u8, 0xcu8], vec![0x4eu8, 0xadu8], vec![0x20u8, 0x53u8], vec![0x2fu8, 0xbu8], vec![0x61u8, 0x0u8], vec![0x0u8, 0x10u8], vec![0x70u8, 0x0u8], vec![0x2fu8, 0x0u8], vec![0x48u8, 0x6eu8], vec![0x20u8, 0x50u8], vec![0x20u8, 0x6eu8], vec![0x2fu8, 0x2eu8], vec![0xffu8, 0xfcu8], vec![0x48u8, 0xe7u8], vec![0x3fu8, 0x3cu8], vec![0x0u8, 0x4u8], vec![0xffu8, 0xf8u8], vec![0x2fu8, 0xcu8], vec![0x20u8, 0x6u8], vec![0x4eu8, 0xedu8], vec![0x4eu8, 0x56u8], vec![0x20u8, 0x68u8], vec![0x4eu8, 0x5eu8], vec![0x0u8, 0x1u8], vec![0x58u8, 0x8fu8], vec![0x4fu8, 0xefu8], vec![0x0u8, 0x2u8], vec![0x0u8, 0x18u8], vec![0x60u8, 0x0u8], vec![0xffu8, 0xffu8], vec![0x50u8, 0x8fu8], vec![0x4eu8, 0x90u8], vec![0x0u8, 0x6u8], vec![0x26u8, 0x6eu8], vec![0x0u8, 0x14u8], vec![0xffu8, 0xf4u8], vec![0x4cu8, 0xeeu8], vec![0x0u8, 0xau8], vec![0x0u8, 0xeu8], vec![0x41u8, 0xeeu8], vec![0x4cu8, 0xdfu8], vec![0x48u8, 0xc0u8], vec![0xffu8, 0xf0u8], vec![0x2du8, 0x40u8], vec![0x0u8, 0x12u8], vec![0x30u8, 0x2eu8], vec![0x70u8, 0x1u8], vec![0x2fu8, 0x28u8], vec![0x20u8, 0x54u8], vec![0x67u8, 0x0u8], vec![0x0u8, 0x20u8], vec![0x0u8, 0x1cu8], vec![0x20u8, 0x5fu8], vec![0x18u8, 0x0u8], vec![0x26u8, 0x6fu8], vec![0x48u8, 0x78u8], vec![0x0u8, 0x16u8], vec![0x41u8, 0xfau8], vec![0x30u8, 0x3cu8], vec![0x28u8, 0x40u8], vec![0x72u8, 0x0u8], vec![0x28u8, 0x6eu8], vec![0x20u8, 0xcu8], vec![0x66u8, 0x0u8], vec![0x20u8, 0x6bu8], vec![0x2fu8, 0x7u8], vec![0x55u8, 0x8fu8], vec![0x0u8, 0x28u8], vec![0xffu8, 0xfeu8], vec![0xffu8, 0xecu8], vec![0x22u8, 0xd8u8], vec![0x20u8, 0xbu8], vec![0x0u8, 0xfu8], vec![0x59u8, 0x8fu8], vec![0x2fu8, 0x3cu8], vec![0xffu8, 0x0u8], vec![0x1u8, 0x18u8], vec![0x81u8, 0xe1u8], vec![0x4au8, 0x0u8], vec![0x4eu8, 0xb0u8], vec![0xffu8, 0xe8u8], vec![0x48u8, 0xc7u8], vec![0x0u8, 0x3u8], vec![0x0u8, 0x22u8], vec![0x0u8, 0x7u8], vec![0x0u8, 0x1au8], vec![0x67u8, 0x6u8], vec![0x67u8, 0x8u8], vec![0x4eu8, 0xf9u8], vec![0x0u8, 0x24u8], vec![0x20u8, 0x78u8], vec![0x8u8, 0x0u8], vec![0x66u8, 0x4u8], vec![0x0u8, 0x2au8], vec![0x4eu8, 0xd0u8], vec![0x30u8, 0x28u8], vec![0x26u8, 0x5fu8], vec![0x67u8, 0x4u8], vec![0x0u8, 0x30u8], vec![0x43u8, 0xeeu8], vec![0x3fu8, 0x0u8], vec![0x20u8, 0x1fu8], vec![0x0u8, 0x1eu8], vec![0xffu8, 0xf6u8], vec![0x20u8, 0x2eu8], vec![0x42u8, 0xa7u8], vec![0x20u8, 0x7u8], vec![0xffu8, 0xfau8], vec![0x60u8, 0x2u8], vec![0x3du8, 0x40u8], vec![0xcu8, 0x40u8], vec![0x66u8, 0x6u8], vec![0x0u8, 0x26u8], vec![0x2du8, 0x48u8], vec![0x2fu8, 0x1u8], vec![0x70u8, 0xffu8], vec![0x60u8, 0x4u8], vec![0x18u8, 0x80u8], vec![0x4au8, 0x40u8], vec![0x0u8, 0x40u8], vec![0x0u8, 0x2cu8], vec![0x2fu8, 0x8u8], vec![0x0u8, 0x11u8], vec![0xffu8, 0xe4u8], vec![0x21u8, 0x40u8], vec![0x26u8, 0x40u8], vec![0xffu8, 0xf2u8], vec![0x42u8, 0x6eu8], vec![0x4eu8, 0xb9u8], vec![0x3du8, 0x7cu8], vec![0x0u8, 0x38u8], vec![0x0u8, 0xdu8], vec![0x60u8, 0x6u8], vec![0x42u8, 0x2eu8], vec![0x20u8, 0x3cu8], vec![0x67u8, 0xcu8], vec![0x2du8, 0x68u8], vec![0x66u8, 0x8u8], vec![0x4au8, 0x2eu8], vec![0x4au8, 0xaeu8], vec![0x0u8, 0x2eu8], vec![0x48u8, 0x40u8], vec![0x22u8, 0x5fu8], vec![0x22u8, 0x0u8], vec![0x67u8, 0xau8], vec![0x30u8, 0x7u8], vec![0x42u8, 0x67u8], vec![0x0u8, 0x32u8], vec![0x20u8, 0x28u8], vec![0x0u8, 0x9u8], vec![0x48u8, 0x7au8], vec![0x2u8, 0x0u8], vec![0x2fu8, 0x2bu8], vec![0x0u8, 0x5u8], vec![0x22u8, 0x6eu8], vec![0x66u8, 0x2u8], vec![0xe5u8, 0x80u8], vec![0x67u8, 0xeu8], vec![0x66u8, 0xau8], vec![0x0u8, 0x50u8], vec![0x3eu8, 0x0u8], vec![0x66u8, 0xcu8], vec![0x2eu8, 0x0u8], vec![0xffu8, 0xeeu8], vec![0x20u8, 0x6du8], vec![0x20u8, 0x40u8], vec![0xffu8, 0xe0u8], vec![0x53u8, 0x40u8], vec![0x60u8, 0x8u8], vec![0x4u8, 0x80u8], vec![0x0u8, 0x68u8], vec![0xbu8, 0x7cu8], vec![0x44u8, 0x0u8], vec![0x41u8, 0xe8u8], vec![0x48u8, 0x41u8]].to_vec();
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
        *self.value.borrow_mut() = self.lookup_table()?[((*self.tag() as u8) - (75 as u8)) as usize].to_vec();
        Ok(self.value.borrow())
    }
}
impl Dcmp0_Chunk_TableLookupBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

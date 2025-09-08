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
use super::bytes_with_io::BytesWithIo;

/**
 * Portable Compiled Format (PCF) font is a bitmap font format
 * originating from X11 Window System. It matches BDF format (which is
 * text-based) closely, but instead being binary and
 * platform-independent (as opposed to previously used SNF binary
 * format) due to introduced features to handle different endianness
 * and bit order.
 * 
 * The overall composition of the format is straightforward: it's more
 * or less classic directory of type-offset-size pointers, pointing to
 * what PCF format calls "tables". Each table carries a certain
 * piece of information related to the font (metadata properties,
 * metrics, bitmaps, mapping of glyphs to characters, etc).
 * \sa https://fontforge.org/docs/techref/pcf-format.html Source
 */

#[derive(Default, Debug, Clone)]
pub struct PcfFont {
    pub _root: SharedType<PcfFont>,
    pub _parent: SharedType<PcfFont>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    num_tables: RefCell<u32>,
    tables: RefCell<Vec<OptRc<PcfFont_Table>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PcfFont {
    type Root = PcfFont;
    type Parent = PcfFont;

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
        if !(*self_rc.magic() == vec![0x1u8, 0x66u8, 0x63u8, 0x70u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.num_tables.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.tables.borrow_mut() = Vec::new();
        let l_tables = *self_rc.num_tables();
        for _i in 0..l_tables {
            let t = Self::read_into::<_, PcfFont_Table>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.tables.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl PcfFont {
}
impl PcfFont {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl PcfFont {
    pub fn num_tables(&self) -> Ref<'_, u32> {
        self.num_tables.borrow()
    }
}
impl PcfFont {
    pub fn tables(&self) -> Ref<'_, Vec<OptRc<PcfFont_Table>>> {
        self.tables.borrow()
    }
}
impl PcfFont {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum PcfFont_Types {
    Properties,
    Accelerators,
    Metrics,
    Bitmaps,
    InkMetrics,
    BdfEncodings,
    Swidths,
    GlyphNames,
    BdfAccelerators,
    Unknown(i64),
}

impl TryFrom<i64> for PcfFont_Types {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<PcfFont_Types> {
        match flag {
            1 => Ok(PcfFont_Types::Properties),
            2 => Ok(PcfFont_Types::Accelerators),
            4 => Ok(PcfFont_Types::Metrics),
            8 => Ok(PcfFont_Types::Bitmaps),
            16 => Ok(PcfFont_Types::InkMetrics),
            32 => Ok(PcfFont_Types::BdfEncodings),
            64 => Ok(PcfFont_Types::Swidths),
            128 => Ok(PcfFont_Types::GlyphNames),
            256 => Ok(PcfFont_Types::BdfAccelerators),
            _ => Ok(PcfFont_Types::Unknown(flag)),
        }
    }
}

impl From<&PcfFont_Types> for i64 {
    fn from(v: &PcfFont_Types) -> Self {
        match *v {
            PcfFont_Types::Properties => 1,
            PcfFont_Types::Accelerators => 2,
            PcfFont_Types::Metrics => 4,
            PcfFont_Types::Bitmaps => 8,
            PcfFont_Types::InkMetrics => 16,
            PcfFont_Types::BdfEncodings => 32,
            PcfFont_Types::Swidths => 64,
            PcfFont_Types::GlyphNames => 128,
            PcfFont_Types::BdfAccelerators => 256,
            PcfFont_Types::Unknown(v) => v
        }
    }
}

impl Default for PcfFont_Types {
    fn default() -> Self { PcfFont_Types::Unknown(0) }
}


/**
 * Table format specifier, always 4 bytes. Original implementation treats
 * it as always little-endian and makes liberal use of bitmasking to parse
 * various parts of it.
 * 
 * TODO: this format specification recognizes endianness and bit
 * order format bits, but it does not really takes any parsing
 * decisions based on them.
 * \sa https://fontforge.org/docs/techref/pcf-format.html#file-header Source
 */

#[derive(Default, Debug, Clone)]
pub struct PcfFont_Format {
    pub _root: SharedType<PcfFont>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    padding1: RefCell<u64>,
    scan_unit_mask: RefCell<u64>,
    is_most_significant_bit_first: RefCell<bool>,
    is_big_endian: RefCell<bool>,
    glyph_pad_mask: RefCell<u64>,
    format: RefCell<u8>,
    padding: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PcfFont_Format {
    type Root = PcfFont;
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
        *self_rc.padding1.borrow_mut() = _io.read_bits_int_be(2)?;
        *self_rc.scan_unit_mask.borrow_mut() = _io.read_bits_int_be(2)?;
        *self_rc.is_most_significant_bit_first.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.is_big_endian.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.glyph_pad_mask.borrow_mut() = _io.read_bits_int_be(2)?;
        _io.align_to_byte()?;
        *self_rc.format.borrow_mut() = _io.read_u1()?.into();
        *self_rc.padding.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl PcfFont_Format {
}
impl PcfFont_Format {
    pub fn padding1(&self) -> Ref<'_, u64> {
        self.padding1.borrow()
    }
}
impl PcfFont_Format {
    pub fn scan_unit_mask(&self) -> Ref<'_, u64> {
        self.scan_unit_mask.borrow()
    }
}
impl PcfFont_Format {
    pub fn is_most_significant_bit_first(&self) -> Ref<'_, bool> {
        self.is_most_significant_bit_first.borrow()
    }
}

/**
 * If set, then all integers in the table are treated as big-endian
 */
impl PcfFont_Format {
    pub fn is_big_endian(&self) -> Ref<'_, bool> {
        self.is_big_endian.borrow()
    }
}
impl PcfFont_Format {
    pub fn glyph_pad_mask(&self) -> Ref<'_, u64> {
        self.glyph_pad_mask.borrow()
    }
}
impl PcfFont_Format {
    pub fn format(&self) -> Ref<'_, u8> {
        self.format.borrow()
    }
}
impl PcfFont_Format {
    pub fn padding(&self) -> Ref<'_, u16> {
        self.padding.borrow()
    }
}
impl PcfFont_Format {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Table offers a offset + length pointer to a particular
 * table. "Type" of table references certain enum. Applications can
 * ignore enum values which they don't support.
 */

#[derive(Default, Debug, Clone)]
pub struct PcfFont_Table {
    pub _root: SharedType<PcfFont>,
    pub _parent: SharedType<PcfFont>,
    pub _self: SharedType<Self>,
    type: RefCell<PcfFont_Types>,
    format: RefCell<OptRc<PcfFont_Format>>,
    len_body: RefCell<u32>,
    ofs_body: RefCell<u32>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
    f_body: Cell<bool>,
    body: RefCell<Option<PcfFont_Table_Body>>,
}
#[derive(Debug, Clone)]
pub enum PcfFont_Table_Body {
    Bytes(Vec<u8>),
    PcfFont_Table_BdfEncodings(OptRc<PcfFont_Table_BdfEncodings>),
    PcfFont_Table_Properties(OptRc<PcfFont_Table_Properties>),
    PcfFont_Table_GlyphNames(OptRc<PcfFont_Table_GlyphNames>),
    PcfFont_Table_Bitmaps(OptRc<PcfFont_Table_Bitmaps>),
    PcfFont_Table_Swidths(OptRc<PcfFont_Table_Swidths>),
}
impl From<&PcfFont_Table_Body> for Vec<u8> {
    fn from(v: &PcfFont_Table_Body) -> Self {
        if let PcfFont_Table_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected PcfFont_Table_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for PcfFont_Table_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&PcfFont_Table_Body> for OptRc<PcfFont_Table_BdfEncodings> {
    fn from(v: &PcfFont_Table_Body) -> Self {
        if let PcfFont_Table_Body::PcfFont_Table_BdfEncodings(x) = v {
            return x.clone();
        }
        panic!("expected PcfFont_Table_Body::PcfFont_Table_BdfEncodings, got {:?}", v)
    }
}
impl From<OptRc<PcfFont_Table_BdfEncodings>> for PcfFont_Table_Body {
    fn from(v: OptRc<PcfFont_Table_BdfEncodings>) -> Self {
        Self::PcfFont_Table_BdfEncodings(v)
    }
}
impl From<&PcfFont_Table_Body> for OptRc<PcfFont_Table_Properties> {
    fn from(v: &PcfFont_Table_Body) -> Self {
        if let PcfFont_Table_Body::PcfFont_Table_Properties(x) = v {
            return x.clone();
        }
        panic!("expected PcfFont_Table_Body::PcfFont_Table_Properties, got {:?}", v)
    }
}
impl From<OptRc<PcfFont_Table_Properties>> for PcfFont_Table_Body {
    fn from(v: OptRc<PcfFont_Table_Properties>) -> Self {
        Self::PcfFont_Table_Properties(v)
    }
}
impl From<&PcfFont_Table_Body> for OptRc<PcfFont_Table_GlyphNames> {
    fn from(v: &PcfFont_Table_Body) -> Self {
        if let PcfFont_Table_Body::PcfFont_Table_GlyphNames(x) = v {
            return x.clone();
        }
        panic!("expected PcfFont_Table_Body::PcfFont_Table_GlyphNames, got {:?}", v)
    }
}
impl From<OptRc<PcfFont_Table_GlyphNames>> for PcfFont_Table_Body {
    fn from(v: OptRc<PcfFont_Table_GlyphNames>) -> Self {
        Self::PcfFont_Table_GlyphNames(v)
    }
}
impl From<&PcfFont_Table_Body> for OptRc<PcfFont_Table_Bitmaps> {
    fn from(v: &PcfFont_Table_Body) -> Self {
        if let PcfFont_Table_Body::PcfFont_Table_Bitmaps(x) = v {
            return x.clone();
        }
        panic!("expected PcfFont_Table_Body::PcfFont_Table_Bitmaps, got {:?}", v)
    }
}
impl From<OptRc<PcfFont_Table_Bitmaps>> for PcfFont_Table_Body {
    fn from(v: OptRc<PcfFont_Table_Bitmaps>) -> Self {
        Self::PcfFont_Table_Bitmaps(v)
    }
}
impl From<&PcfFont_Table_Body> for OptRc<PcfFont_Table_Swidths> {
    fn from(v: &PcfFont_Table_Body) -> Self {
        if let PcfFont_Table_Body::PcfFont_Table_Swidths(x) = v {
            return x.clone();
        }
        panic!("expected PcfFont_Table_Body::PcfFont_Table_Swidths, got {:?}", v)
    }
}
impl From<OptRc<PcfFont_Table_Swidths>> for PcfFont_Table_Body {
    fn from(v: OptRc<PcfFont_Table_Swidths>) -> Self {
        Self::PcfFont_Table_Swidths(v)
    }
}
impl KStruct for PcfFont_Table {
    type Root = PcfFont;
    type Parent = PcfFont;

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
        *self_rc.type.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        let t = Self::read_into::<_, PcfFont_Format>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.format.borrow_mut() = t;
        *self_rc.len_body.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_body.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl PcfFont_Table {
    pub fn body(
        &self
    ) -> KResult<Ref<'_, Option<PcfFont_Table_Body>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_body.get() {
            return Ok(self.body.borrow());
        }
        self.f_body.set(true);
        let _pos = _io.pos();
        _io.seek(*self.ofs_body() as usize)?;
        match *self.type() {
            PcfFont_Types::BdfEncodings => {
                *self.body_raw.borrow_mut() = _io.read_bytes(*self.len_body() as usize)?.into();
                let body_raw = self.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, PcfFont_Table_BdfEncodings>(&_t_body_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.body.borrow_mut() = Some(t);
            }
            PcfFont_Types::Bitmaps => {
                *self.body_raw.borrow_mut() = _io.read_bytes(*self.len_body() as usize)?.into();
                let body_raw = self.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, PcfFont_Table_Bitmaps>(&_t_body_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.body.borrow_mut() = Some(t);
            }
            PcfFont_Types::GlyphNames => {
                *self.body_raw.borrow_mut() = _io.read_bytes(*self.len_body() as usize)?.into();
                let body_raw = self.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, PcfFont_Table_GlyphNames>(&_t_body_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.body.borrow_mut() = Some(t);
            }
            PcfFont_Types::Properties => {
                *self.body_raw.borrow_mut() = _io.read_bytes(*self.len_body() as usize)?.into();
                let body_raw = self.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, PcfFont_Table_Properties>(&_t_body_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.body.borrow_mut() = Some(t);
            }
            PcfFont_Types::Swidths => {
                *self.body_raw.borrow_mut() = _io.read_bytes(*self.len_body() as usize)?.into();
                let body_raw = self.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, PcfFont_Table_Swidths>(&_t_body_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.body.borrow_mut() = Some(t);
            }
            _ => {
                *self.body.borrow_mut() = Some(_io.read_bytes(*self.len_body() as usize)?.into());
            }
        }
        _io.seek(_pos)?;
        Ok(self.body.borrow())
    }
}
impl PcfFont_Table {
    pub fn type(&self) -> Ref<'_, PcfFont_Types> {
        self.type.borrow()
    }
}
impl PcfFont_Table {
    pub fn format(&self) -> Ref<'_, OptRc<PcfFont_Format>> {
        self.format.borrow()
    }
}
impl PcfFont_Table {
    pub fn len_body(&self) -> Ref<'_, u32> {
        self.len_body.borrow()
    }
}
impl PcfFont_Table {
    pub fn ofs_body(&self) -> Ref<'_, u32> {
        self.ofs_body.borrow()
    }
}
impl PcfFont_Table {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl PcfFont_Table {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}

/**
 * Table that allows mapping of character codes to glyphs present in the
 * font. Supports 1-byte and 2-byte character codes.
 * 
 * Note that this mapping is agnostic to character encoding itself - it
 * can represent ASCII, Unicode (ISO/IEC 10646), various single-byte
 * national encodings, etc. If application cares about it, normally
 * encoding will be specified in `properties` table, in the properties named
 * `CHARSET_REGISTRY` / `CHARSET_ENCODING`.
 * \sa https://fontforge.org/docs/techref/pcf-format.html#the-encoding-table Source
 */

#[derive(Default, Debug, Clone)]
pub struct PcfFont_Table_BdfEncodings {
    pub _root: SharedType<PcfFont>,
    pub _parent: SharedType<PcfFont_Table>,
    pub _self: SharedType<Self>,
    format: RefCell<OptRc<PcfFont_Format>>,
    min_char_or_byte2: RefCell<u16>,
    max_char_or_byte2: RefCell<u16>,
    min_byte1: RefCell<u16>,
    max_byte1: RefCell<u16>,
    default_char: RefCell<u16>,
    glyph_indexes: RefCell<Vec<u16>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PcfFont_Table_BdfEncodings {
    type Root = PcfFont;
    type Parent = PcfFont_Table;

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
        let t = Self::read_into::<_, PcfFont_Format>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.format.borrow_mut() = t;
        *self_rc.min_char_or_byte2.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.max_char_or_byte2.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.min_byte1.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.max_byte1.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.default_char.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.glyph_indexes.borrow_mut() = Vec::new();
        let l_glyph_indexes = ((((((*self_rc.max_char_or_byte2() as u16) - (*self_rc.min_char_or_byte2() as u16)) as i32) + (1 as i32)) as i32) * (((((*self_rc.max_byte1() as u16) - (*self_rc.min_byte1() as u16)) as i32) + (1 as i32)) as i32));
        for _i in 0..l_glyph_indexes {
            self_rc.glyph_indexes.borrow_mut().push(_io.read_u2le()?.into());
        }
        Ok(())
    }
}
impl PcfFont_Table_BdfEncodings {
}
impl PcfFont_Table_BdfEncodings {
    pub fn format(&self) -> Ref<'_, OptRc<PcfFont_Format>> {
        self.format.borrow()
    }
}
impl PcfFont_Table_BdfEncodings {
    pub fn min_char_or_byte2(&self) -> Ref<'_, u16> {
        self.min_char_or_byte2.borrow()
    }
}
impl PcfFont_Table_BdfEncodings {
    pub fn max_char_or_byte2(&self) -> Ref<'_, u16> {
        self.max_char_or_byte2.borrow()
    }
}
impl PcfFont_Table_BdfEncodings {
    pub fn min_byte1(&self) -> Ref<'_, u16> {
        self.min_byte1.borrow()
    }
}
impl PcfFont_Table_BdfEncodings {
    pub fn max_byte1(&self) -> Ref<'_, u16> {
        self.max_byte1.borrow()
    }
}
impl PcfFont_Table_BdfEncodings {
    pub fn default_char(&self) -> Ref<'_, u16> {
        self.default_char.borrow()
    }
}
impl PcfFont_Table_BdfEncodings {
    pub fn glyph_indexes(&self) -> Ref<'_, Vec<u16>> {
        self.glyph_indexes.borrow()
    }
}
impl PcfFont_Table_BdfEncodings {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Table containing uncompressed glyph bitmaps.
 * \sa https://fontforge.org/docs/techref/pcf-format.html#the-bitmap-table Source
 */

#[derive(Default, Debug, Clone)]
pub struct PcfFont_Table_Bitmaps {
    pub _root: SharedType<PcfFont>,
    pub _parent: SharedType<PcfFont_Table>,
    pub _self: SharedType<Self>,
    format: RefCell<OptRc<PcfFont_Format>>,
    num_glyphs: RefCell<u32>,
    offsets: RefCell<Vec<u32>>,
    bitmap_sizes: RefCell<Vec<u32>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PcfFont_Table_Bitmaps {
    type Root = PcfFont;
    type Parent = PcfFont_Table;

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
        let t = Self::read_into::<_, PcfFont_Format>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.format.borrow_mut() = t;
        *self_rc.num_glyphs.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.offsets.borrow_mut() = Vec::new();
        let l_offsets = *self_rc.num_glyphs();
        for _i in 0..l_offsets {
            self_rc.offsets.borrow_mut().push(_io.read_u4le()?.into());
        }
        *self_rc.bitmap_sizes.borrow_mut() = Vec::new();
        let l_bitmap_sizes = 4;
        for _i in 0..l_bitmap_sizes {
            self_rc.bitmap_sizes.borrow_mut().push(_io.read_u4le()?.into());
        }
        Ok(())
    }
}
impl PcfFont_Table_Bitmaps {
}
impl PcfFont_Table_Bitmaps {
    pub fn format(&self) -> Ref<'_, OptRc<PcfFont_Format>> {
        self.format.borrow()
    }
}
impl PcfFont_Table_Bitmaps {
    pub fn num_glyphs(&self) -> Ref<'_, u32> {
        self.num_glyphs.borrow()
    }
}
impl PcfFont_Table_Bitmaps {
    pub fn offsets(&self) -> Ref<'_, Vec<u32>> {
        self.offsets.borrow()
    }
}
impl PcfFont_Table_Bitmaps {
    pub fn bitmap_sizes(&self) -> Ref<'_, Vec<u32>> {
        self.bitmap_sizes.borrow()
    }
}
impl PcfFont_Table_Bitmaps {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Table containing character names for every glyph.
 * \sa https://fontforge.org/docs/techref/pcf-format.html#the-glyph-names-table Source
 */

#[derive(Default, Debug, Clone)]
pub struct PcfFont_Table_GlyphNames {
    pub _root: SharedType<PcfFont>,
    pub _parent: SharedType<PcfFont_Table>,
    pub _self: SharedType<Self>,
    format: RefCell<OptRc<PcfFont_Format>>,
    num_glyphs: RefCell<u32>,
    names: RefCell<Vec<OptRc<PcfFont_Table_GlyphNames_StringRef>>>,
    len_strings: RefCell<u32>,
    strings: RefCell<OptRc<BytesWithIo>>,
    _io: RefCell<BytesReader>,
    strings_raw: RefCell<Vec<u8>>,
}
impl KStruct for PcfFont_Table_GlyphNames {
    type Root = PcfFont;
    type Parent = PcfFont_Table;

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
        let t = Self::read_into::<_, PcfFont_Format>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.format.borrow_mut() = t;
        *self_rc.num_glyphs.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.names.borrow_mut() = Vec::new();
        let l_names = *self_rc.num_glyphs();
        for _i in 0..l_names {
            let t = Self::read_into::<_, PcfFont_Table_GlyphNames_StringRef>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.names.borrow_mut().push(t);
        }
        *self_rc.len_strings.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.strings_raw.borrow_mut() = _io.read_bytes(*self_rc.len_strings() as usize)?.into();
        let strings_raw = self_rc.strings_raw.borrow();
        let _t_strings_raw_io = BytesReader::from(strings_raw.clone());
        let t = Self::read_into::<BytesReader, BytesWithIo>(&_t_strings_raw_io, None, None)?.into();
        *self_rc.strings.borrow_mut() = t;
        Ok(())
    }
}
impl PcfFont_Table_GlyphNames {
}
impl PcfFont_Table_GlyphNames {
    pub fn format(&self) -> Ref<'_, OptRc<PcfFont_Format>> {
        self.format.borrow()
    }
}
impl PcfFont_Table_GlyphNames {
    pub fn num_glyphs(&self) -> Ref<'_, u32> {
        self.num_glyphs.borrow()
    }
}

/**
 * Glyph names are represented as string references in strings buffer.
 */
impl PcfFont_Table_GlyphNames {
    pub fn names(&self) -> Ref<'_, Vec<OptRc<PcfFont_Table_GlyphNames_StringRef>>> {
        self.names.borrow()
    }
}
impl PcfFont_Table_GlyphNames {
    pub fn len_strings(&self) -> Ref<'_, u32> {
        self.len_strings.borrow()
    }
}

/**
 * Strings buffer which contains all glyph names.
 */
impl PcfFont_Table_GlyphNames {
    pub fn strings(&self) -> Ref<'_, OptRc<BytesWithIo>> {
        self.strings.borrow()
    }
}
impl PcfFont_Table_GlyphNames {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl PcfFont_Table_GlyphNames {
    pub fn strings_raw(&self) -> Ref<'_, Vec<u8>> {
        self.strings_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct PcfFont_Table_GlyphNames_StringRef {
    pub _root: SharedType<PcfFont>,
    pub _parent: SharedType<PcfFont_Table_GlyphNames>,
    pub _self: SharedType<Self>,
    ofs_string: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_value: Cell<bool>,
    value: RefCell<String>,
}
impl KStruct for PcfFont_Table_GlyphNames_StringRef {
    type Root = PcfFont;
    type Parent = PcfFont_Table_GlyphNames;

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
        *self_rc.ofs_string.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl PcfFont_Table_GlyphNames_StringRef {
    pub fn value(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        self.f_value.set(true);
        let io = Clone::clone(&*_prc.as_ref().unwrap().strings()._io());
        let _pos = io.pos();
        io.seek(*self.ofs_string() as usize)?;
        *self.value.borrow_mut() = bytes_to_str(&io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?;
        io.seek(_pos)?;
        Ok(self.value.borrow())
    }
}
impl PcfFont_Table_GlyphNames_StringRef {
    pub fn ofs_string(&self) -> Ref<'_, u32> {
        self.ofs_string.borrow()
    }
}
impl PcfFont_Table_GlyphNames_StringRef {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Array of properties (key-value pairs), used to convey different X11
 * settings of a font. Key is always an X font atom.
 * \sa https://fontforge.org/docs/techref/pcf-format.html#properties-table Source
 */

#[derive(Default, Debug, Clone)]
pub struct PcfFont_Table_Properties {
    pub _root: SharedType<PcfFont>,
    pub _parent: SharedType<PcfFont_Table>,
    pub _self: SharedType<Self>,
    format: RefCell<OptRc<PcfFont_Format>>,
    num_props: RefCell<u32>,
    props: RefCell<Vec<OptRc<PcfFont_Table_Properties_Prop>>>,
    padding: RefCell<Vec<u8>>,
    len_strings: RefCell<u32>,
    strings: RefCell<OptRc<BytesWithIo>>,
    _io: RefCell<BytesReader>,
    strings_raw: RefCell<Vec<u8>>,
}
impl KStruct for PcfFont_Table_Properties {
    type Root = PcfFont;
    type Parent = PcfFont_Table;

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
        let t = Self::read_into::<_, PcfFont_Format>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.format.borrow_mut() = t;
        *self_rc.num_props.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.props.borrow_mut() = Vec::new();
        let l_props = *self_rc.num_props();
        for _i in 0..l_props {
            let t = Self::read_into::<_, PcfFont_Table_Properties_Prop>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.props.borrow_mut().push(t);
        }
        *self_rc.padding.borrow_mut() = _io.read_bytes(if ((((*self_rc.num_props() as u32) & (3 as u32)) as i32) == (0 as i32)) { 0 } else { ((4 as i32) - (((*self_rc.num_props() as u32) & (3 as u32)) as i32)) } as usize)?.into();
        *self_rc.len_strings.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.strings_raw.borrow_mut() = _io.read_bytes(*self_rc.len_strings() as usize)?.into();
        let strings_raw = self_rc.strings_raw.borrow();
        let _t_strings_raw_io = BytesReader::from(strings_raw.clone());
        let t = Self::read_into::<BytesReader, BytesWithIo>(&_t_strings_raw_io, None, None)?.into();
        *self_rc.strings.borrow_mut() = t;
        Ok(())
    }
}
impl PcfFont_Table_Properties {
}
impl PcfFont_Table_Properties {
    pub fn format(&self) -> Ref<'_, OptRc<PcfFont_Format>> {
        self.format.borrow()
    }
}
impl PcfFont_Table_Properties {
    pub fn num_props(&self) -> Ref<'_, u32> {
        self.num_props.borrow()
    }
}
impl PcfFont_Table_Properties {
    pub fn props(&self) -> Ref<'_, Vec<OptRc<PcfFont_Table_Properties_Prop>>> {
        self.props.borrow()
    }
}
impl PcfFont_Table_Properties {
    pub fn padding(&self) -> Ref<'_, Vec<u8>> {
        self.padding.borrow()
    }
}
impl PcfFont_Table_Properties {
    pub fn len_strings(&self) -> Ref<'_, u32> {
        self.len_strings.borrow()
    }
}

/**
 * Strings buffer. Never used directly, but instead is
 * addressed by offsets from the properties.
 */
impl PcfFont_Table_Properties {
    pub fn strings(&self) -> Ref<'_, OptRc<BytesWithIo>> {
        self.strings.borrow()
    }
}
impl PcfFont_Table_Properties {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl PcfFont_Table_Properties {
    pub fn strings_raw(&self) -> Ref<'_, Vec<u8>> {
        self.strings_raw.borrow()
    }
}

/**
 * Property is a key-value pair, "key" being always a
 * string and "value" being either a string or a 32-bit
 * integer based on an additinal flag (`is_string`).
 * 
 * Simple offset-based mechanism is employed to keep this
 * type's sequence fixed-sized and thus have simple access
 * to property key/value by index.
 */

#[derive(Default, Debug, Clone)]
pub struct PcfFont_Table_Properties_Prop {
    pub _root: SharedType<PcfFont>,
    pub _parent: SharedType<PcfFont_Table_Properties>,
    pub _self: SharedType<Self>,
    ofs_name: RefCell<u32>,
    is_string: RefCell<u8>,
    value_or_ofs_value: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_int_value: Cell<bool>,
    int_value: RefCell<u32>,
    f_name: Cell<bool>,
    name: RefCell<String>,
    f_str_value: Cell<bool>,
    str_value: RefCell<String>,
}
impl KStruct for PcfFont_Table_Properties_Prop {
    type Root = PcfFont;
    type Parent = PcfFont_Table_Properties;

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
        *self_rc.ofs_name.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.is_string.borrow_mut() = _io.read_u1()?.into();
        *self_rc.value_or_ofs_value.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl PcfFont_Table_Properties_Prop {

    /**
     * Value of the property, if this is an integer value.
     */
    pub fn int_value(
        &self
    ) -> KResult<Ref<'_, u32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_int_value.get() {
            return Ok(self.int_value.borrow());
        }
        self.f_int_value.set(true);
        if ((*self.is_string() as u8) == (0 as u8)) {
            *self.int_value.borrow_mut() = (*self.value_or_ofs_value()) as u32;
        }
        Ok(self.int_value.borrow())
    }

    /**
     * Name of the property addressed in the strings buffer.
     */
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
        let io = Clone::clone(&*_prc.as_ref().unwrap().strings()._io());
        let _pos = io.pos();
        io.seek(*self.ofs_name() as usize)?;
        *self.name.borrow_mut() = bytes_to_str(&io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?;
        io.seek(_pos)?;
        Ok(self.name.borrow())
    }

    /**
     * Value of the property addressed in the strings
     * buffer, if this is a string value.
     */
    pub fn str_value(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_str_value.get() {
            return Ok(self.str_value.borrow());
        }
        self.f_str_value.set(true);
        if ((*self.is_string() as u8) != (0 as u8)) {
            let io = Clone::clone(&*_prc.as_ref().unwrap().strings()._io());
            let _pos = io.pos();
            io.seek(*self.value_or_ofs_value() as usize)?;
            *self.str_value.borrow_mut() = bytes_to_str(&io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?;
            io.seek(_pos)?;
        }
        Ok(self.str_value.borrow())
    }
}

/**
 * Offset to name in the strings buffer.
 */
impl PcfFont_Table_Properties_Prop {
    pub fn ofs_name(&self) -> Ref<'_, u32> {
        self.ofs_name.borrow()
    }
}

/**
 * Designates if value is an integer (zero) or a string (non-zero).
 */
impl PcfFont_Table_Properties_Prop {
    pub fn is_string(&self) -> Ref<'_, u8> {
        self.is_string.borrow()
    }
}

/**
 * If the value is an integer (`is_string` is false),
 * then it's stored here. If the value is a string
 * (`is_string` is true), then it stores offset to the
 * value in the strings buffer.
 */
impl PcfFont_Table_Properties_Prop {
    pub fn value_or_ofs_value(&self) -> Ref<'_, u32> {
        self.value_or_ofs_value.borrow()
    }
}
impl PcfFont_Table_Properties_Prop {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Table containing scalable widths of characters.
 * \sa https://fontforge.org/docs/techref/pcf-format.html#the-scalable-widths-table Source
 */

#[derive(Default, Debug, Clone)]
pub struct PcfFont_Table_Swidths {
    pub _root: SharedType<PcfFont>,
    pub _parent: SharedType<PcfFont_Table>,
    pub _self: SharedType<Self>,
    format: RefCell<OptRc<PcfFont_Format>>,
    num_glyphs: RefCell<u32>,
    swidths: RefCell<Vec<u32>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PcfFont_Table_Swidths {
    type Root = PcfFont;
    type Parent = PcfFont_Table;

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
        let t = Self::read_into::<_, PcfFont_Format>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.format.borrow_mut() = t;
        *self_rc.num_glyphs.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.swidths.borrow_mut() = Vec::new();
        let l_swidths = *self_rc.num_glyphs();
        for _i in 0..l_swidths {
            self_rc.swidths.borrow_mut().push(_io.read_u4le()?.into());
        }
        Ok(())
    }
}
impl PcfFont_Table_Swidths {
}
impl PcfFont_Table_Swidths {
    pub fn format(&self) -> Ref<'_, OptRc<PcfFont_Format>> {
        self.format.borrow()
    }
}
impl PcfFont_Table_Swidths {
    pub fn num_glyphs(&self) -> Ref<'_, u32> {
        self.num_glyphs.borrow()
    }
}

/**
 * The scalable width of a character is the width of the corresponding
 * PostScript character in em-units (1/1000ths of an em).
 */
impl PcfFont_Table_Swidths {
    pub fn swidths(&self) -> Ref<'_, Vec<u32>> {
        self.swidths.borrow()
    }
}
impl PcfFont_Table_Swidths {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

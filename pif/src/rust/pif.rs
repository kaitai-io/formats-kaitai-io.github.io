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
 * The Portable Image Format (PIF) is a basic, bitmap-like image format with the
 * focus on ease of use (implementation) and small size for embedded
 * applications.
 * 
 * See <https://github.com/gfcwfzkm/PIF-Image-Format> for more info.
 * \sa https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf Source
 * \sa https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/C%20Library/pifdec.c#L300 Source
 */

#[derive(Default, Debug, Clone)]
pub struct Pif {
    pub _root: SharedType<Pif>,
    pub _parent: SharedType<Pif>,
    pub _self: SharedType<Self>,
    file_header: RefCell<OptRc<Pif_PifHeader>>,
    info_header: RefCell<OptRc<Pif_InformationHeader>>,
    color_table: RefCell<OptRc<Pif_ColorTableData>>,
    _io: RefCell<BytesReader>,
    color_table_raw: RefCell<Vec<u8>>,
    f_image_data: Cell<bool>,
    image_data: RefCell<Vec<u8>>,
}
impl KStruct for Pif {
    type Root = Pif;
    type Parent = Pif;

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
        let t = Self::read_into::<_, Pif_PifHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.file_header.borrow_mut() = t;
        let t = Self::read_into::<_, Pif_InformationHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.info_header.borrow_mut() = t;
        if *self_rc.info_header().uses_indexed_mode()? {
            *self_rc.color_table_raw.borrow_mut() = _io.read_bytes(*self_rc.info_header().len_color_table() as usize)?.into();
            let color_table_raw = self_rc.color_table_raw.borrow();
            let _t_color_table_raw_io = BytesReader::from(color_table_raw.clone());
            let t = Self::read_into::<BytesReader, Pif_ColorTableData>(&_t_color_table_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.color_table.borrow_mut() = t;
        }
        Ok(())
    }
}
impl Pif {
    pub fn image_data(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_image_data.get() {
            return Ok(self.image_data.borrow());
        }
        self.f_image_data.set(true);
        let _pos = _io.pos();
        _io.seek(*self.file_header().ofs_image_data() as usize)?;
        *self.image_data.borrow_mut() = _io.read_bytes(*self.info_header().len_image_data() as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.image_data.borrow())
    }
}
impl Pif {
    pub fn file_header(&self) -> Ref<'_, OptRc<Pif_PifHeader>> {
        self.file_header.borrow()
    }
}
impl Pif {
    pub fn info_header(&self) -> Ref<'_, OptRc<Pif_InformationHeader>> {
        self.info_header.borrow()
    }
}
impl Pif {
    pub fn color_table(&self) -> Ref<'_, OptRc<Pif_ColorTableData>> {
        self.color_table.borrow()
    }
}
impl Pif {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Pif {
    pub fn color_table_raw(&self) -> Ref<'_, Vec<u8>> {
        self.color_table_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Pif_CompressionType {
    None,
    Rle,
    Unknown(i64),
}

impl TryFrom<i64> for Pif_CompressionType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Pif_CompressionType> {
        match flag {
            0 => Ok(Pif_CompressionType::None),
            32222 => Ok(Pif_CompressionType::Rle),
            _ => Ok(Pif_CompressionType::Unknown(flag)),
        }
    }
}

impl From<&Pif_CompressionType> for i64 {
    fn from(v: &Pif_CompressionType) -> Self {
        match *v {
            Pif_CompressionType::None => 0,
            Pif_CompressionType::Rle => 32222,
            Pif_CompressionType::Unknown(v) => v
        }
    }
}

impl Default for Pif_CompressionType {
    fn default() -> Self { Pif_CompressionType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Pif_ImageType {
    Rgb332,
    Rgb888,
    IndexedRgb332,
    IndexedRgb565,
    IndexedRgb888,

    /**
     * 0: black, 1: white
     * \sa https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/C%20Library/pifdec.c#L233 Source
     */
    BlackWhite,

    /**
     * Formula to convert the 4-bit color value in RGB16C mode to RGB values
     * (each in the range from 0 to 255):
     * 
     * ```
     * red   = 170 * ((color_value & 0b0100) >> 2) + 85 * ((color_value & 0b1000) >> 3)
     * green = 170 * ((color_value & 0b0010) >> 1) + 85 * ((color_value & 0b1000) >> 3)
     * blue  = 170 * ((color_value & 0b0001) >> 0) + 85 * ((color_value & 0b1000) >> 3)
     * ```
     * 
     * See also <https://en.wikipedia.org/wiki/Color_Graphics_Adapter#Color_palette>
     */
    Rgb16c,
    Rgb565,
    Unknown(i64),
}

impl TryFrom<i64> for Pif_ImageType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Pif_ImageType> {
        match flag {
            7763 => Ok(Pif_ImageType::Rgb332),
            17212 => Ok(Pif_ImageType::Rgb888),
            18754 => Ok(Pif_ImageType::IndexedRgb332),
            18759 => Ok(Pif_ImageType::IndexedRgb565),
            18770 => Ok(Pif_ImageType::IndexedRgb888),
            32170 => Ok(Pif_ImageType::BlackWhite),
            47253 => Ok(Pif_ImageType::Rgb16c),
            58821 => Ok(Pif_ImageType::Rgb565),
            _ => Ok(Pif_ImageType::Unknown(flag)),
        }
    }
}

impl From<&Pif_ImageType> for i64 {
    fn from(v: &Pif_ImageType) -> Self {
        match *v {
            Pif_ImageType::Rgb332 => 7763,
            Pif_ImageType::Rgb888 => 17212,
            Pif_ImageType::IndexedRgb332 => 18754,
            Pif_ImageType::IndexedRgb565 => 18759,
            Pif_ImageType::IndexedRgb888 => 18770,
            Pif_ImageType::BlackWhite => 32170,
            Pif_ImageType::Rgb16c => 47253,
            Pif_ImageType::Rgb565 => 58821,
            Pif_ImageType::Unknown(v) => v
        }
    }
}

impl Default for Pif_ImageType {
    fn default() -> Self { Pif_ImageType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Pif_ColorTableData {
    pub _root: SharedType<Pif>,
    pub _parent: SharedType<Pif>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<Pif_ColorTableData_Entries>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Pif_ColorTableData_Entries {
    Bits(u64),
}
impl From<u64> for Pif_ColorTableData_Entries {
    fn from(v: u64) -> Self {
        Self::Bits(v)
    }
}
impl From<&Pif_ColorTableData_Entries> for u64 {
    fn from(e: &Pif_ColorTableData_Entries) -> Self {
        if let Pif_ColorTableData_Entries::Bits(v) = e {
            return *v
        }
        panic!("trying to convert from enum Pif_ColorTableData_Entries::Bits to u64, enum value {:?}", e)
    }
}
impl From<&Pif_ColorTableData_Entries> for usize {
    fn from(e: &Pif_ColorTableData_Entries) -> Self {
        match e {
            Pif_ColorTableData_Entries::Bits(v) => *v as usize,
        }
    }
}

impl KStruct for Pif_ColorTableData {
    type Root = Pif;
    type Parent = Pif;

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
                match *_r.info_header().image_type() {
                    Pif_ImageType::IndexedRgb332 => {
                        self_rc.entries.borrow_mut().push(_io.read_bits_int_le(8)?);
                    }
                    Pif_ImageType::IndexedRgb565 => {
                        self_rc.entries.borrow_mut().push(_io.read_bits_int_le(16)?);
                    }
                    Pif_ImageType::IndexedRgb888 => {
                        self_rc.entries.borrow_mut().push(_io.read_bits_int_le(24)?);
                    }
                    _ => {}
                }
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Pif_ColorTableData {
}
impl Pif_ColorTableData {
    pub fn entries(&self) -> Ref<'_, Vec<Pif_ColorTableData_Entries>> {
        self.entries.borrow()
    }
}
impl Pif_ColorTableData {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Pif_InformationHeader {
    pub _root: SharedType<Pif>,
    pub _parent: SharedType<Pif>,
    pub _self: SharedType<Self>,
    image_type: RefCell<Pif_ImageType>,
    bits_per_pixel: RefCell<u16>,
    width: RefCell<u16>,
    height: RefCell<u16>,
    len_image_data: RefCell<u32>,
    len_color_table: RefCell<u16>,
    compression: RefCell<Pif_CompressionType>,
    _io: RefCell<BytesReader>,
    f_len_color_table_entry: Cell<bool>,
    len_color_table_entry: RefCell<i8>,
    f_len_color_table_full: Cell<bool>,
    len_color_table_full: RefCell<i32>,
    f_len_color_table_max: Cell<bool>,
    len_color_table_max: RefCell<i32>,
    f_uses_indexed_mode: Cell<bool>,
    uses_indexed_mode: RefCell<bool>,
}
impl KStruct for Pif_InformationHeader {
    type Root = Pif;
    type Parent = Pif;

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
        *self_rc.image_type.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        if !( ((*self_rc.image_type() == Pif_ImageType::Rgb888) || (*self_rc.image_type() == Pif_ImageType::Rgb565) || (*self_rc.image_type() == Pif_ImageType::Rgb332) || (*self_rc.image_type() == Pif_ImageType::Rgb16c) || (*self_rc.image_type() == Pif_ImageType::BlackWhite) || (*self_rc.image_type() == Pif_ImageType::IndexedRgb888) || (*self_rc.image_type() == Pif_ImageType::IndexedRgb565) || (*self_rc.image_type() == Pif_ImageType::IndexedRgb332)) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotAnyOf, src_path: "/types/information_header/seq/0".to_string() }));
        }
        *self_rc.bits_per_pixel.borrow_mut() = _io.read_u2le()?.into();
        let _tmpa = *self_rc.bits_per_pixel();
        if !(if *self_rc.image_type() == Pif_ImageType::Rgb888 { ((_tmpa as u16) == (24 as u16)) } else { if *self_rc.image_type() == Pif_ImageType::Rgb565 { ((_tmpa as u16) == (16 as u16)) } else { if *self_rc.image_type() == Pif_ImageType::Rgb332 { ((_tmpa as u16) == (8 as u16)) } else { if *self_rc.image_type() == Pif_ImageType::Rgb16c { ((_tmpa as u16) == (4 as u16)) } else { if *self_rc.image_type() == Pif_ImageType::BlackWhite { ((_tmpa as u16) == (1 as u16)) } else { if *self_rc.uses_indexed_mode()? { ((_tmpa as u16) <= (8 as u16)) } else { true } } } } } }) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/information_header/seq/1".to_string() }));
        }
        *self_rc.width.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.height.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.len_image_data.borrow_mut() = _io.read_u4le()?.into();
        if !(((*self_rc.len_image_data() as i32) <= (((*_r.file_header().len_file() as u32) - (*_r.file_header().ofs_image_data() as u32)) as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/information_header/seq/4".to_string() }));
        }
        *self_rc.len_color_table.borrow_mut() = _io.read_u2le()?.into();
        if !(((*self_rc.len_color_table() as i32) >= (if *self_rc.uses_indexed_mode()? { ((*self_rc.len_color_table_entry()? as i8) * (1 as i8)) } else { 0 } as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/information_header/seq/5".to_string() }));
        }
        if !(((*self_rc.len_color_table() as i32) <= (if *self_rc.uses_indexed_mode()? { if *self_rc.len_color_table_max()? < *self_rc.len_color_table_full()? { *self_rc.len_color_table_max()? } else { *self_rc.len_color_table_full()? } } else { 0 } as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/information_header/seq/5".to_string() }));
        }
        *self_rc.compression.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        if !( ((*self_rc.compression() == Pif_CompressionType::None) || (*self_rc.compression() == Pif_CompressionType::Rle)) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotAnyOf, src_path: "/types/information_header/seq/6".to_string() }));
        }
        Ok(())
    }
}
impl Pif_InformationHeader {
    pub fn len_color_table_entry(
        &self
    ) -> KResult<Ref<'_, i8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_color_table_entry.get() {
            return Ok(self.len_color_table_entry.borrow());
        }
        self.f_len_color_table_entry.set(true);
        *self.len_color_table_entry.borrow_mut() = (if *self.image_type() == Pif_ImageType::IndexedRgb888 { 3 } else { if *self.image_type() == Pif_ImageType::IndexedRgb565 { 2 } else { if *self.image_type() == Pif_ImageType::IndexedRgb332 { 1 } else { 0 } } }) as i8;
        Ok(self.len_color_table_entry.borrow())
    }
    pub fn len_color_table_full(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_color_table_full.get() {
            return Ok(self.len_color_table_full.borrow());
        }
        self.f_len_color_table_full.set(true);
        *self.len_color_table_full.borrow_mut() = (((*self.len_color_table_entry()? as i32) * (((1 as u16) << (*self.bits_per_pixel() as u16)) as i32))) as i32;
        Ok(self.len_color_table_full.borrow())
    }
    pub fn len_color_table_max(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_color_table_max.get() {
            return Ok(self.len_color_table_max.borrow());
        }
        self.f_len_color_table_max.set(true);
        *self.len_color_table_max.borrow_mut() = (((*_r.file_header().ofs_image_data() as i32) - (*_r.file_header().ofs_image_data_min()? as i32))) as i32;
        Ok(self.len_color_table_max.borrow())
    }
    pub fn uses_indexed_mode(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_uses_indexed_mode.get() {
            return Ok(self.uses_indexed_mode.borrow());
        }
        self.f_uses_indexed_mode.set(true);
        *self.uses_indexed_mode.borrow_mut() = (*self.len_color_table_entry()? != 0) as bool;
        Ok(self.uses_indexed_mode.borrow())
    }
}
impl Pif_InformationHeader {
    pub fn image_type(&self) -> Ref<'_, Pif_ImageType> {
        self.image_type.borrow()
    }
}

/**
 * See <https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf>:
 * 
 * > Bits per Pixel: Bit size that each Pixel occupies. Bit size for an
 * > Indexed Image cannot go beyond 8 bits.
 */
impl Pif_InformationHeader {
    pub fn bits_per_pixel(&self) -> Ref<'_, u16> {
        self.bits_per_pixel.borrow()
    }
}
impl Pif_InformationHeader {
    pub fn width(&self) -> Ref<'_, u16> {
        self.width.borrow()
    }
}
impl Pif_InformationHeader {
    pub fn height(&self) -> Ref<'_, u16> {
        self.height.borrow()
    }
}
impl Pif_InformationHeader {
    pub fn len_image_data(&self) -> Ref<'_, u32> {
        self.len_image_data.borrow()
    }
}

/**
 * See <https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf>:
 * 
 * > Color Table Size: (...), only used in Indexed mode, otherwise zero.
 * ---
 * > **Note**: The presence of the Color Table is mandatory when Bits per
 * > Pixel <= 8, unless Image Type states RGB332, RGB16C or B/W
 * ---
 * > **Color Table** (semi-optional)
 * >
 * > (...) The amount of Colors has to be same or less than [Bits per
 * > Pixel] allow, otherwise the image is invalid.
 */
impl Pif_InformationHeader {
    pub fn len_color_table(&self) -> Ref<'_, u16> {
        self.len_color_table.borrow()
    }
}
impl Pif_InformationHeader {
    pub fn compression(&self) -> Ref<'_, Pif_CompressionType> {
        self.compression.borrow()
    }
}
impl Pif_InformationHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Pif_PifHeader {
    pub _root: SharedType<Pif>,
    pub _parent: SharedType<Pif>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    len_file: RefCell<u32>,
    ofs_image_data: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_ofs_image_data_min: Cell<bool>,
    ofs_image_data_min: RefCell<i32>,
}
impl KStruct for Pif_PifHeader {
    type Root = Pif;
    type Parent = Pif;

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
        if !(*self_rc.magic() == vec![0x50u8, 0x49u8, 0x46u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/pif_header/seq/0".to_string() }));
        }
        *self_rc.len_file.borrow_mut() = _io.read_u4le()?.into();
        if !(((*self_rc.len_file() as i32) >= (*self_rc.ofs_image_data_min()? as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/pif_header/seq/1".to_string() }));
        }
        *self_rc.ofs_image_data.borrow_mut() = _io.read_u4le()?.into();
        if !(((*self_rc.ofs_image_data() as i32) >= (*self_rc.ofs_image_data_min()? as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/pif_header/seq/2".to_string() }));
        }
        if !(*self_rc.ofs_image_data() <= *self_rc.len_file()) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/pif_header/seq/2".to_string() }));
        }
        Ok(())
    }
}
impl Pif_PifHeader {
    pub fn ofs_image_data_min(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ofs_image_data_min.get() {
            return Ok(self.ofs_image_data_min.borrow());
        }
        self.f_ofs_image_data_min.set(true);
        *self.ofs_image_data_min.borrow_mut() = ((12 + 16)) as i32;
        Ok(self.ofs_image_data_min.borrow())
    }
}
impl Pif_PifHeader {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl Pif_PifHeader {
    pub fn len_file(&self) -> Ref<'_, u32> {
        self.len_file.borrow()
    }
}
impl Pif_PifHeader {
    pub fn ofs_image_data(&self) -> Ref<'_, u32> {
        self.ofs_image_data.borrow()
    }
}
impl Pif_PifHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

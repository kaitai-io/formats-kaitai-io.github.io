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
 * A TrueType font file contains data, in table format, that comprises
 * an outline font.
 * \sa https://web.archive.org/web/20160410081432/https://www.microsoft.com/typography/tt/ttf_spec/ttch02.doc Source
 */

#[derive(Default, Debug, Clone)]
pub struct Ttf {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf>,
    pub _self: SharedType<Self>,
    offset_table: RefCell<OptRc<Ttf_OffsetTable>>,
    directory_table: RefCell<Vec<OptRc<Ttf_DirTableEntry>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf {
    type Root = Ttf;
    type Parent = Ttf;

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
        let t = Self::read_into::<_, Ttf_OffsetTable>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.offset_table.borrow_mut() = t;
        *self_rc.directory_table.borrow_mut() = Vec::new();
        let l_directory_table = *self_rc.offset_table().num_tables();
        for _i in 0..l_directory_table {
            let t = Self::read_into::<_, Ttf_DirTableEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.directory_table.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Ttf {
}
impl Ttf {
    pub fn offset_table(&self) -> Ref<'_, OptRc<Ttf_OffsetTable>> {
        self.offset_table.borrow()
    }
}
impl Ttf {
    pub fn directory_table(&self) -> Ref<'_, Vec<OptRc<Ttf_DirTableEntry>>> {
        self.directory_table.borrow()
    }
}
impl Ttf {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * cmap - Character To Glyph Index Mapping Table This table defines the mapping of character codes to the glyph index values used in the font.
 */

#[derive(Default, Debug, Clone)]
pub struct Ttf_Cmap {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_DirTableEntry>,
    pub _self: SharedType<Self>,
    version_number: RefCell<u16>,
    number_of_encoding_tables: RefCell<u16>,
    tables: RefCell<Vec<OptRc<Ttf_Cmap_SubtableHeader>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_Cmap {
    type Root = Ttf;
    type Parent = Ttf_DirTableEntry;

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
        *self_rc.version_number.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.number_of_encoding_tables.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.tables.borrow_mut() = Vec::new();
        let l_tables = *self_rc.number_of_encoding_tables();
        for _i in 0..l_tables {
            let t = Self::read_into::<_, Ttf_Cmap_SubtableHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.tables.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Ttf_Cmap {
}
impl Ttf_Cmap {
    pub fn version_number(&self) -> Ref<'_, u16> {
        self.version_number.borrow()
    }
}
impl Ttf_Cmap {
    pub fn number_of_encoding_tables(&self) -> Ref<'_, u16> {
        self.number_of_encoding_tables.borrow()
    }
}
impl Ttf_Cmap {
    pub fn tables(&self) -> Ref<'_, Vec<OptRc<Ttf_Cmap_SubtableHeader>>> {
        self.tables.borrow()
    }
}
impl Ttf_Cmap {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ttf_Cmap_Subtable {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_Cmap_SubtableHeader>,
    pub _self: SharedType<Self>,
    format: RefCell<Ttf_Cmap_Subtable_SubtableFormat>,
    length: RefCell<u16>,
    version: RefCell<u16>,
    value: RefCell<Option<Ttf_Cmap_Subtable_Value>>,
    _io: RefCell<BytesReader>,
    value_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum Ttf_Cmap_Subtable_Value {
    Ttf_Cmap_Subtable_TrimmedTableMapping(OptRc<Ttf_Cmap_Subtable_TrimmedTableMapping>),
    Ttf_Cmap_Subtable_SegmentMappingToDeltaValues(OptRc<Ttf_Cmap_Subtable_SegmentMappingToDeltaValues>),
    Ttf_Cmap_Subtable_ByteEncodingTable(OptRc<Ttf_Cmap_Subtable_ByteEncodingTable>),
    Ttf_Cmap_Subtable_HighByteMappingThroughTable(OptRc<Ttf_Cmap_Subtable_HighByteMappingThroughTable>),
    Bytes(Vec<u8>),
}
impl From<&Ttf_Cmap_Subtable_Value> for OptRc<Ttf_Cmap_Subtable_TrimmedTableMapping> {
    fn from(v: &Ttf_Cmap_Subtable_Value) -> Self {
        if let Ttf_Cmap_Subtable_Value::Ttf_Cmap_Subtable_TrimmedTableMapping(x) = v {
            return x.clone();
        }
        panic!("expected Ttf_Cmap_Subtable_Value::Ttf_Cmap_Subtable_TrimmedTableMapping, got {:?}", v)
    }
}
impl From<OptRc<Ttf_Cmap_Subtable_TrimmedTableMapping>> for Ttf_Cmap_Subtable_Value {
    fn from(v: OptRc<Ttf_Cmap_Subtable_TrimmedTableMapping>) -> Self {
        Self::Ttf_Cmap_Subtable_TrimmedTableMapping(v)
    }
}
impl From<&Ttf_Cmap_Subtable_Value> for OptRc<Ttf_Cmap_Subtable_SegmentMappingToDeltaValues> {
    fn from(v: &Ttf_Cmap_Subtable_Value) -> Self {
        if let Ttf_Cmap_Subtable_Value::Ttf_Cmap_Subtable_SegmentMappingToDeltaValues(x) = v {
            return x.clone();
        }
        panic!("expected Ttf_Cmap_Subtable_Value::Ttf_Cmap_Subtable_SegmentMappingToDeltaValues, got {:?}", v)
    }
}
impl From<OptRc<Ttf_Cmap_Subtable_SegmentMappingToDeltaValues>> for Ttf_Cmap_Subtable_Value {
    fn from(v: OptRc<Ttf_Cmap_Subtable_SegmentMappingToDeltaValues>) -> Self {
        Self::Ttf_Cmap_Subtable_SegmentMappingToDeltaValues(v)
    }
}
impl From<&Ttf_Cmap_Subtable_Value> for OptRc<Ttf_Cmap_Subtable_ByteEncodingTable> {
    fn from(v: &Ttf_Cmap_Subtable_Value) -> Self {
        if let Ttf_Cmap_Subtable_Value::Ttf_Cmap_Subtable_ByteEncodingTable(x) = v {
            return x.clone();
        }
        panic!("expected Ttf_Cmap_Subtable_Value::Ttf_Cmap_Subtable_ByteEncodingTable, got {:?}", v)
    }
}
impl From<OptRc<Ttf_Cmap_Subtable_ByteEncodingTable>> for Ttf_Cmap_Subtable_Value {
    fn from(v: OptRc<Ttf_Cmap_Subtable_ByteEncodingTable>) -> Self {
        Self::Ttf_Cmap_Subtable_ByteEncodingTable(v)
    }
}
impl From<&Ttf_Cmap_Subtable_Value> for OptRc<Ttf_Cmap_Subtable_HighByteMappingThroughTable> {
    fn from(v: &Ttf_Cmap_Subtable_Value) -> Self {
        if let Ttf_Cmap_Subtable_Value::Ttf_Cmap_Subtable_HighByteMappingThroughTable(x) = v {
            return x.clone();
        }
        panic!("expected Ttf_Cmap_Subtable_Value::Ttf_Cmap_Subtable_HighByteMappingThroughTable, got {:?}", v)
    }
}
impl From<OptRc<Ttf_Cmap_Subtable_HighByteMappingThroughTable>> for Ttf_Cmap_Subtable_Value {
    fn from(v: OptRc<Ttf_Cmap_Subtable_HighByteMappingThroughTable>) -> Self {
        Self::Ttf_Cmap_Subtable_HighByteMappingThroughTable(v)
    }
}
impl From<&Ttf_Cmap_Subtable_Value> for Vec<u8> {
    fn from(v: &Ttf_Cmap_Subtable_Value) -> Self {
        if let Ttf_Cmap_Subtable_Value::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected Ttf_Cmap_Subtable_Value::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for Ttf_Cmap_Subtable_Value {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl KStruct for Ttf_Cmap_Subtable {
    type Root = Ttf;
    type Parent = Ttf_Cmap_SubtableHeader;

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
        *self_rc.format.borrow_mut() = (_io.read_u2be()? as i64).try_into()?;
        *self_rc.length.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.version.borrow_mut() = _io.read_u2be()?.into();
        match *self_rc.format() {
            Ttf_Cmap_Subtable_SubtableFormat::ByteEncodingTable => {
                *self_rc.value_raw.borrow_mut() = _io.read_bytes(((*self_rc.length() as u16) - (6 as u16)) as usize)?.into();
                let value_raw = self_rc.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, Ttf_Cmap_Subtable_ByteEncodingTable>(&_t_value_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            Ttf_Cmap_Subtable_SubtableFormat::HighByteMappingThroughTable => {
                *self_rc.value_raw.borrow_mut() = _io.read_bytes(((*self_rc.length() as u16) - (6 as u16)) as usize)?.into();
                let value_raw = self_rc.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, Ttf_Cmap_Subtable_HighByteMappingThroughTable>(&_t_value_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            Ttf_Cmap_Subtable_SubtableFormat::SegmentMappingToDeltaValues => {
                *self_rc.value_raw.borrow_mut() = _io.read_bytes(((*self_rc.length() as u16) - (6 as u16)) as usize)?.into();
                let value_raw = self_rc.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, Ttf_Cmap_Subtable_SegmentMappingToDeltaValues>(&_t_value_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            Ttf_Cmap_Subtable_SubtableFormat::TrimmedTableMapping => {
                *self_rc.value_raw.borrow_mut() = _io.read_bytes(((*self_rc.length() as u16) - (6 as u16)) as usize)?.into();
                let value_raw = self_rc.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, Ttf_Cmap_Subtable_TrimmedTableMapping>(&_t_value_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.value.borrow_mut() = Some(_io.read_bytes(((*self_rc.length() as u16) - (6 as u16)) as usize)?.into());
            }
        }
        Ok(())
    }
}
impl Ttf_Cmap_Subtable {
}
impl Ttf_Cmap_Subtable {
    pub fn format(&self) -> Ref<'_, Ttf_Cmap_Subtable_SubtableFormat> {
        self.format.borrow()
    }
}
impl Ttf_Cmap_Subtable {
    pub fn length(&self) -> Ref<'_, u16> {
        self.length.borrow()
    }
}
impl Ttf_Cmap_Subtable {
    pub fn version(&self) -> Ref<'_, u16> {
        self.version.borrow()
    }
}
impl Ttf_Cmap_Subtable {
    pub fn value(&self) -> Ref<'_, Option<Ttf_Cmap_Subtable_Value>> {
        self.value.borrow()
    }
}
impl Ttf_Cmap_Subtable {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Ttf_Cmap_Subtable {
    pub fn value_raw(&self) -> Ref<'_, Vec<u8>> {
        self.value_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Ttf_Cmap_Subtable_SubtableFormat {
    ByteEncodingTable,
    HighByteMappingThroughTable,
    SegmentMappingToDeltaValues,
    TrimmedTableMapping,
    Unknown(i64),
}

impl TryFrom<i64> for Ttf_Cmap_Subtable_SubtableFormat {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ttf_Cmap_Subtable_SubtableFormat> {
        match flag {
            0 => Ok(Ttf_Cmap_Subtable_SubtableFormat::ByteEncodingTable),
            2 => Ok(Ttf_Cmap_Subtable_SubtableFormat::HighByteMappingThroughTable),
            4 => Ok(Ttf_Cmap_Subtable_SubtableFormat::SegmentMappingToDeltaValues),
            6 => Ok(Ttf_Cmap_Subtable_SubtableFormat::TrimmedTableMapping),
            _ => Ok(Ttf_Cmap_Subtable_SubtableFormat::Unknown(flag)),
        }
    }
}

impl From<&Ttf_Cmap_Subtable_SubtableFormat> for i64 {
    fn from(v: &Ttf_Cmap_Subtable_SubtableFormat) -> Self {
        match *v {
            Ttf_Cmap_Subtable_SubtableFormat::ByteEncodingTable => 0,
            Ttf_Cmap_Subtable_SubtableFormat::HighByteMappingThroughTable => 2,
            Ttf_Cmap_Subtable_SubtableFormat::SegmentMappingToDeltaValues => 4,
            Ttf_Cmap_Subtable_SubtableFormat::TrimmedTableMapping => 6,
            Ttf_Cmap_Subtable_SubtableFormat::Unknown(v) => v
        }
    }
}

impl Default for Ttf_Cmap_Subtable_SubtableFormat {
    fn default() -> Self { Ttf_Cmap_Subtable_SubtableFormat::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Ttf_Cmap_Subtable_ByteEncodingTable {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_Cmap_Subtable>,
    pub _self: SharedType<Self>,
    glyph_id_array: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_Cmap_Subtable_ByteEncodingTable {
    type Root = Ttf;
    type Parent = Ttf_Cmap_Subtable;

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
        *self_rc.glyph_id_array.borrow_mut() = _io.read_bytes(256 as usize)?.into();
        Ok(())
    }
}
impl Ttf_Cmap_Subtable_ByteEncodingTable {
}
impl Ttf_Cmap_Subtable_ByteEncodingTable {
    pub fn glyph_id_array(&self) -> Ref<'_, Vec<u8>> {
        self.glyph_id_array.borrow()
    }
}
impl Ttf_Cmap_Subtable_ByteEncodingTable {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ttf_Cmap_Subtable_HighByteMappingThroughTable {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_Cmap_Subtable>,
    pub _self: SharedType<Self>,
    sub_header_keys: RefCell<Vec<u16>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_Cmap_Subtable_HighByteMappingThroughTable {
    type Root = Ttf;
    type Parent = Ttf_Cmap_Subtable;

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
        *self_rc.sub_header_keys.borrow_mut() = Vec::new();
        let l_sub_header_keys = 256;
        for _i in 0..l_sub_header_keys {
            self_rc.sub_header_keys.borrow_mut().push(_io.read_u2be()?.into());
        }
        Ok(())
    }
}
impl Ttf_Cmap_Subtable_HighByteMappingThroughTable {
}
impl Ttf_Cmap_Subtable_HighByteMappingThroughTable {
    pub fn sub_header_keys(&self) -> Ref<'_, Vec<u16>> {
        self.sub_header_keys.borrow()
    }
}
impl Ttf_Cmap_Subtable_HighByteMappingThroughTable {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ttf_Cmap_Subtable_SegmentMappingToDeltaValues {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_Cmap_Subtable>,
    pub _self: SharedType<Self>,
    seg_count_x2: RefCell<u16>,
    search_range: RefCell<u16>,
    entry_selector: RefCell<u16>,
    range_shift: RefCell<u16>,
    end_count: RefCell<Vec<u16>>,
    reserved_pad: RefCell<u16>,
    start_count: RefCell<Vec<u16>>,
    id_delta: RefCell<Vec<u16>>,
    id_range_offset: RefCell<Vec<u16>>,
    glyph_id_array: RefCell<Vec<u16>>,
    _io: RefCell<BytesReader>,
    f_seg_count: Cell<bool>,
    seg_count: RefCell<i32>,
}
impl KStruct for Ttf_Cmap_Subtable_SegmentMappingToDeltaValues {
    type Root = Ttf;
    type Parent = Ttf_Cmap_Subtable;

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
        *self_rc.seg_count_x2.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.search_range.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.entry_selector.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.range_shift.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.end_count.borrow_mut() = Vec::new();
        let l_end_count = *self_rc.seg_count()?;
        for _i in 0..l_end_count {
            self_rc.end_count.borrow_mut().push(_io.read_u2be()?.into());
        }
        *self_rc.reserved_pad.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.start_count.borrow_mut() = Vec::new();
        let l_start_count = *self_rc.seg_count()?;
        for _i in 0..l_start_count {
            self_rc.start_count.borrow_mut().push(_io.read_u2be()?.into());
        }
        *self_rc.id_delta.borrow_mut() = Vec::new();
        let l_id_delta = *self_rc.seg_count()?;
        for _i in 0..l_id_delta {
            self_rc.id_delta.borrow_mut().push(_io.read_u2be()?.into());
        }
        *self_rc.id_range_offset.borrow_mut() = Vec::new();
        let l_id_range_offset = *self_rc.seg_count()?;
        for _i in 0..l_id_range_offset {
            self_rc.id_range_offset.borrow_mut().push(_io.read_u2be()?.into());
        }
        *self_rc.glyph_id_array.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.glyph_id_array.borrow_mut().push(_io.read_u2be()?.into());
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Ttf_Cmap_Subtable_SegmentMappingToDeltaValues {
    pub fn seg_count(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_seg_count.get() {
            return Ok(self.seg_count.borrow());
        }
        self.f_seg_count.set(true);
        *self.seg_count.borrow_mut() = (((*self.seg_count_x2() as u16) / (2 as u16))) as i32;
        Ok(self.seg_count.borrow())
    }
}
impl Ttf_Cmap_Subtable_SegmentMappingToDeltaValues {
    pub fn seg_count_x2(&self) -> Ref<'_, u16> {
        self.seg_count_x2.borrow()
    }
}
impl Ttf_Cmap_Subtable_SegmentMappingToDeltaValues {
    pub fn search_range(&self) -> Ref<'_, u16> {
        self.search_range.borrow()
    }
}
impl Ttf_Cmap_Subtable_SegmentMappingToDeltaValues {
    pub fn entry_selector(&self) -> Ref<'_, u16> {
        self.entry_selector.borrow()
    }
}
impl Ttf_Cmap_Subtable_SegmentMappingToDeltaValues {
    pub fn range_shift(&self) -> Ref<'_, u16> {
        self.range_shift.borrow()
    }
}
impl Ttf_Cmap_Subtable_SegmentMappingToDeltaValues {
    pub fn end_count(&self) -> Ref<'_, Vec<u16>> {
        self.end_count.borrow()
    }
}
impl Ttf_Cmap_Subtable_SegmentMappingToDeltaValues {
    pub fn reserved_pad(&self) -> Ref<'_, u16> {
        self.reserved_pad.borrow()
    }
}
impl Ttf_Cmap_Subtable_SegmentMappingToDeltaValues {
    pub fn start_count(&self) -> Ref<'_, Vec<u16>> {
        self.start_count.borrow()
    }
}
impl Ttf_Cmap_Subtable_SegmentMappingToDeltaValues {
    pub fn id_delta(&self) -> Ref<'_, Vec<u16>> {
        self.id_delta.borrow()
    }
}
impl Ttf_Cmap_Subtable_SegmentMappingToDeltaValues {
    pub fn id_range_offset(&self) -> Ref<'_, Vec<u16>> {
        self.id_range_offset.borrow()
    }
}
impl Ttf_Cmap_Subtable_SegmentMappingToDeltaValues {
    pub fn glyph_id_array(&self) -> Ref<'_, Vec<u16>> {
        self.glyph_id_array.borrow()
    }
}
impl Ttf_Cmap_Subtable_SegmentMappingToDeltaValues {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ttf_Cmap_Subtable_TrimmedTableMapping {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_Cmap_Subtable>,
    pub _self: SharedType<Self>,
    first_code: RefCell<u16>,
    entry_count: RefCell<u16>,
    glyph_id_array: RefCell<Vec<u16>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_Cmap_Subtable_TrimmedTableMapping {
    type Root = Ttf;
    type Parent = Ttf_Cmap_Subtable;

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
        *self_rc.first_code.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.entry_count.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.glyph_id_array.borrow_mut() = Vec::new();
        let l_glyph_id_array = *self_rc.entry_count();
        for _i in 0..l_glyph_id_array {
            self_rc.glyph_id_array.borrow_mut().push(_io.read_u2be()?.into());
        }
        Ok(())
    }
}
impl Ttf_Cmap_Subtable_TrimmedTableMapping {
}
impl Ttf_Cmap_Subtable_TrimmedTableMapping {
    pub fn first_code(&self) -> Ref<'_, u16> {
        self.first_code.borrow()
    }
}
impl Ttf_Cmap_Subtable_TrimmedTableMapping {
    pub fn entry_count(&self) -> Ref<'_, u16> {
        self.entry_count.borrow()
    }
}
impl Ttf_Cmap_Subtable_TrimmedTableMapping {
    pub fn glyph_id_array(&self) -> Ref<'_, Vec<u16>> {
        self.glyph_id_array.borrow()
    }
}
impl Ttf_Cmap_Subtable_TrimmedTableMapping {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ttf_Cmap_SubtableHeader {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_Cmap>,
    pub _self: SharedType<Self>,
    platform_id: RefCell<u16>,
    encoding_id: RefCell<u16>,
    subtable_offset: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_table: Cell<bool>,
    table: RefCell<OptRc<Ttf_Cmap_Subtable>>,
}
impl KStruct for Ttf_Cmap_SubtableHeader {
    type Root = Ttf;
    type Parent = Ttf_Cmap;

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
        *self_rc.platform_id.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.encoding_id.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.subtable_offset.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl Ttf_Cmap_SubtableHeader {
    pub fn table(
        &self
    ) -> KResult<Ref<'_, OptRc<Ttf_Cmap_Subtable>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_table.get() {
            return Ok(self.table.borrow());
        }
        let io = Clone::clone(&*_prc.as_ref().unwrap()._io());
        let _pos = io.pos();
        io.seek(*self.subtable_offset() as usize)?;
        let t = Self::read_into::<BytesReader, Ttf_Cmap_Subtable>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.table.borrow_mut() = t;
        io.seek(_pos)?;
        Ok(self.table.borrow())
    }
}
impl Ttf_Cmap_SubtableHeader {
    pub fn platform_id(&self) -> Ref<'_, u16> {
        self.platform_id.borrow()
    }
}
impl Ttf_Cmap_SubtableHeader {
    pub fn encoding_id(&self) -> Ref<'_, u16> {
        self.encoding_id.borrow()
    }
}
impl Ttf_Cmap_SubtableHeader {
    pub fn subtable_offset(&self) -> Ref<'_, u32> {
        self.subtable_offset.borrow()
    }
}
impl Ttf_Cmap_SubtableHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * cvt  - Control Value Table This table contains a list of values that can be referenced by instructions. They can be used, among other things, to control characteristics for different glyphs.
 */

#[derive(Default, Debug, Clone)]
pub struct Ttf_Cvt {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_DirTableEntry>,
    pub _self: SharedType<Self>,
    fwords: RefCell<Vec<i16>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_Cvt {
    type Root = Ttf;
    type Parent = Ttf_DirTableEntry;

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
        *self_rc.fwords.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.fwords.borrow_mut().push(_io.read_s2be()?.into());
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Ttf_Cvt {
}
impl Ttf_Cvt {
    pub fn fwords(&self) -> Ref<'_, Vec<i16>> {
        self.fwords.borrow()
    }
}
impl Ttf_Cvt {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ttf_DirTableEntry {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf>,
    pub _self: SharedType<Self>,
    tag: RefCell<String>,
    checksum: RefCell<u32>,
    offset: RefCell<u32>,
    length: RefCell<u32>,
    _io: RefCell<BytesReader>,
    value_raw: RefCell<Vec<u8>>,
    f_value: Cell<bool>,
    value: RefCell<Option<Ttf_DirTableEntry_Value>>,
}
#[derive(Debug, Clone)]
pub enum Ttf_DirTableEntry_Value {
    Ttf_Head(OptRc<Ttf_Head>),
    Ttf_Maxp(OptRc<Ttf_Maxp>),
    Ttf_Kern(OptRc<Ttf_Kern>),
    Ttf_Cmap(OptRc<Ttf_Cmap>),
    Ttf_Os2(OptRc<Ttf_Os2>),
    Ttf_Prep(OptRc<Ttf_Prep>),
    Ttf_Post(OptRc<Ttf_Post>),
    Ttf_Cvt(OptRc<Ttf_Cvt>),
    Ttf_Hhea(OptRc<Ttf_Hhea>),
    Bytes(Vec<u8>),
    Ttf_Fpgm(OptRc<Ttf_Fpgm>),
    Ttf_Name(OptRc<Ttf_Name>),
    Ttf_Glyf(OptRc<Ttf_Glyf>),
}
impl From<&Ttf_DirTableEntry_Value> for OptRc<Ttf_Head> {
    fn from(v: &Ttf_DirTableEntry_Value) -> Self {
        if let Ttf_DirTableEntry_Value::Ttf_Head(x) = v {
            return x.clone();
        }
        panic!("expected Ttf_DirTableEntry_Value::Ttf_Head, got {:?}", v)
    }
}
impl From<OptRc<Ttf_Head>> for Ttf_DirTableEntry_Value {
    fn from(v: OptRc<Ttf_Head>) -> Self {
        Self::Ttf_Head(v)
    }
}
impl From<&Ttf_DirTableEntry_Value> for OptRc<Ttf_Maxp> {
    fn from(v: &Ttf_DirTableEntry_Value) -> Self {
        if let Ttf_DirTableEntry_Value::Ttf_Maxp(x) = v {
            return x.clone();
        }
        panic!("expected Ttf_DirTableEntry_Value::Ttf_Maxp, got {:?}", v)
    }
}
impl From<OptRc<Ttf_Maxp>> for Ttf_DirTableEntry_Value {
    fn from(v: OptRc<Ttf_Maxp>) -> Self {
        Self::Ttf_Maxp(v)
    }
}
impl From<&Ttf_DirTableEntry_Value> for OptRc<Ttf_Kern> {
    fn from(v: &Ttf_DirTableEntry_Value) -> Self {
        if let Ttf_DirTableEntry_Value::Ttf_Kern(x) = v {
            return x.clone();
        }
        panic!("expected Ttf_DirTableEntry_Value::Ttf_Kern, got {:?}", v)
    }
}
impl From<OptRc<Ttf_Kern>> for Ttf_DirTableEntry_Value {
    fn from(v: OptRc<Ttf_Kern>) -> Self {
        Self::Ttf_Kern(v)
    }
}
impl From<&Ttf_DirTableEntry_Value> for OptRc<Ttf_Cmap> {
    fn from(v: &Ttf_DirTableEntry_Value) -> Self {
        if let Ttf_DirTableEntry_Value::Ttf_Cmap(x) = v {
            return x.clone();
        }
        panic!("expected Ttf_DirTableEntry_Value::Ttf_Cmap, got {:?}", v)
    }
}
impl From<OptRc<Ttf_Cmap>> for Ttf_DirTableEntry_Value {
    fn from(v: OptRc<Ttf_Cmap>) -> Self {
        Self::Ttf_Cmap(v)
    }
}
impl From<&Ttf_DirTableEntry_Value> for OptRc<Ttf_Os2> {
    fn from(v: &Ttf_DirTableEntry_Value) -> Self {
        if let Ttf_DirTableEntry_Value::Ttf_Os2(x) = v {
            return x.clone();
        }
        panic!("expected Ttf_DirTableEntry_Value::Ttf_Os2, got {:?}", v)
    }
}
impl From<OptRc<Ttf_Os2>> for Ttf_DirTableEntry_Value {
    fn from(v: OptRc<Ttf_Os2>) -> Self {
        Self::Ttf_Os2(v)
    }
}
impl From<&Ttf_DirTableEntry_Value> for OptRc<Ttf_Prep> {
    fn from(v: &Ttf_DirTableEntry_Value) -> Self {
        if let Ttf_DirTableEntry_Value::Ttf_Prep(x) = v {
            return x.clone();
        }
        panic!("expected Ttf_DirTableEntry_Value::Ttf_Prep, got {:?}", v)
    }
}
impl From<OptRc<Ttf_Prep>> for Ttf_DirTableEntry_Value {
    fn from(v: OptRc<Ttf_Prep>) -> Self {
        Self::Ttf_Prep(v)
    }
}
impl From<&Ttf_DirTableEntry_Value> for OptRc<Ttf_Post> {
    fn from(v: &Ttf_DirTableEntry_Value) -> Self {
        if let Ttf_DirTableEntry_Value::Ttf_Post(x) = v {
            return x.clone();
        }
        panic!("expected Ttf_DirTableEntry_Value::Ttf_Post, got {:?}", v)
    }
}
impl From<OptRc<Ttf_Post>> for Ttf_DirTableEntry_Value {
    fn from(v: OptRc<Ttf_Post>) -> Self {
        Self::Ttf_Post(v)
    }
}
impl From<&Ttf_DirTableEntry_Value> for OptRc<Ttf_Cvt> {
    fn from(v: &Ttf_DirTableEntry_Value) -> Self {
        if let Ttf_DirTableEntry_Value::Ttf_Cvt(x) = v {
            return x.clone();
        }
        panic!("expected Ttf_DirTableEntry_Value::Ttf_Cvt, got {:?}", v)
    }
}
impl From<OptRc<Ttf_Cvt>> for Ttf_DirTableEntry_Value {
    fn from(v: OptRc<Ttf_Cvt>) -> Self {
        Self::Ttf_Cvt(v)
    }
}
impl From<&Ttf_DirTableEntry_Value> for OptRc<Ttf_Hhea> {
    fn from(v: &Ttf_DirTableEntry_Value) -> Self {
        if let Ttf_DirTableEntry_Value::Ttf_Hhea(x) = v {
            return x.clone();
        }
        panic!("expected Ttf_DirTableEntry_Value::Ttf_Hhea, got {:?}", v)
    }
}
impl From<OptRc<Ttf_Hhea>> for Ttf_DirTableEntry_Value {
    fn from(v: OptRc<Ttf_Hhea>) -> Self {
        Self::Ttf_Hhea(v)
    }
}
impl From<&Ttf_DirTableEntry_Value> for Vec<u8> {
    fn from(v: &Ttf_DirTableEntry_Value) -> Self {
        if let Ttf_DirTableEntry_Value::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected Ttf_DirTableEntry_Value::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for Ttf_DirTableEntry_Value {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&Ttf_DirTableEntry_Value> for OptRc<Ttf_Fpgm> {
    fn from(v: &Ttf_DirTableEntry_Value) -> Self {
        if let Ttf_DirTableEntry_Value::Ttf_Fpgm(x) = v {
            return x.clone();
        }
        panic!("expected Ttf_DirTableEntry_Value::Ttf_Fpgm, got {:?}", v)
    }
}
impl From<OptRc<Ttf_Fpgm>> for Ttf_DirTableEntry_Value {
    fn from(v: OptRc<Ttf_Fpgm>) -> Self {
        Self::Ttf_Fpgm(v)
    }
}
impl From<&Ttf_DirTableEntry_Value> for OptRc<Ttf_Name> {
    fn from(v: &Ttf_DirTableEntry_Value) -> Self {
        if let Ttf_DirTableEntry_Value::Ttf_Name(x) = v {
            return x.clone();
        }
        panic!("expected Ttf_DirTableEntry_Value::Ttf_Name, got {:?}", v)
    }
}
impl From<OptRc<Ttf_Name>> for Ttf_DirTableEntry_Value {
    fn from(v: OptRc<Ttf_Name>) -> Self {
        Self::Ttf_Name(v)
    }
}
impl From<&Ttf_DirTableEntry_Value> for OptRc<Ttf_Glyf> {
    fn from(v: &Ttf_DirTableEntry_Value) -> Self {
        if let Ttf_DirTableEntry_Value::Ttf_Glyf(x) = v {
            return x.clone();
        }
        panic!("expected Ttf_DirTableEntry_Value::Ttf_Glyf, got {:?}", v)
    }
}
impl From<OptRc<Ttf_Glyf>> for Ttf_DirTableEntry_Value {
    fn from(v: OptRc<Ttf_Glyf>) -> Self {
        Self::Ttf_Glyf(v)
    }
}
impl KStruct for Ttf_DirTableEntry {
    type Root = Ttf;
    type Parent = Ttf;

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
        *self_rc.tag.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "ASCII")?;
        *self_rc.checksum.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.offset.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.length.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl Ttf_DirTableEntry {
    pub fn value(
        &self
    ) -> KResult<Ref<'_, Option<Ttf_DirTableEntry_Value>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        self.f_value.set(true);
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.offset() as usize)?;
        {
            let on = self.tag();
            if *on == "OS/2" {
                *self.value_raw.borrow_mut() = io.read_bytes(*self.length() as usize)?.into();
                let value_raw = self.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, Ttf_Os2>(&_t_value_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.value.borrow_mut() = Some(t);
            }
            else if *on == "cmap" {
                *self.value_raw.borrow_mut() = io.read_bytes(*self.length() as usize)?.into();
                let value_raw = self.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, Ttf_Cmap>(&_t_value_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.value.borrow_mut() = Some(t);
            }
            else if *on == "cvt " {
                *self.value_raw.borrow_mut() = io.read_bytes(*self.length() as usize)?.into();
                let value_raw = self.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, Ttf_Cvt>(&_t_value_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.value.borrow_mut() = Some(t);
            }
            else if *on == "fpgm" {
                *self.value_raw.borrow_mut() = io.read_bytes(*self.length() as usize)?.into();
                let value_raw = self.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, Ttf_Fpgm>(&_t_value_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.value.borrow_mut() = Some(t);
            }
            else if *on == "glyf" {
                *self.value_raw.borrow_mut() = io.read_bytes(*self.length() as usize)?.into();
                let value_raw = self.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, Ttf_Glyf>(&_t_value_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.value.borrow_mut() = Some(t);
            }
            else if *on == "head" {
                *self.value_raw.borrow_mut() = io.read_bytes(*self.length() as usize)?.into();
                let value_raw = self.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, Ttf_Head>(&_t_value_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.value.borrow_mut() = Some(t);
            }
            else if *on == "hhea" {
                *self.value_raw.borrow_mut() = io.read_bytes(*self.length() as usize)?.into();
                let value_raw = self.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, Ttf_Hhea>(&_t_value_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.value.borrow_mut() = Some(t);
            }
            else if *on == "kern" {
                *self.value_raw.borrow_mut() = io.read_bytes(*self.length() as usize)?.into();
                let value_raw = self.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, Ttf_Kern>(&_t_value_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.value.borrow_mut() = Some(t);
            }
            else if *on == "maxp" {
                *self.value_raw.borrow_mut() = io.read_bytes(*self.length() as usize)?.into();
                let value_raw = self.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, Ttf_Maxp>(&_t_value_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.value.borrow_mut() = Some(t);
            }
            else if *on == "name" {
                *self.value_raw.borrow_mut() = io.read_bytes(*self.length() as usize)?.into();
                let value_raw = self.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, Ttf_Name>(&_t_value_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.value.borrow_mut() = Some(t);
            }
            else if *on == "post" {
                *self.value_raw.borrow_mut() = io.read_bytes(*self.length() as usize)?.into();
                let value_raw = self.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, Ttf_Post>(&_t_value_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.value.borrow_mut() = Some(t);
            }
            else if *on == "prep" {
                *self.value_raw.borrow_mut() = io.read_bytes(*self.length() as usize)?.into();
                let value_raw = self.value_raw.borrow();
                let _t_value_raw_io = BytesReader::from(value_raw.clone());
                let t = Self::read_into::<BytesReader, Ttf_Prep>(&_t_value_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.value.borrow_mut() = Some(t);
            }
            else {
                *self.value.borrow_mut() = Some(io.read_bytes(*self.length() as usize)?.into());
            }
        }
        io.seek(_pos)?;
        Ok(self.value.borrow())
    }
}
impl Ttf_DirTableEntry {
    pub fn tag(&self) -> Ref<'_, String> {
        self.tag.borrow()
    }
}
impl Ttf_DirTableEntry {
    pub fn checksum(&self) -> Ref<'_, u32> {
        self.checksum.borrow()
    }
}
impl Ttf_DirTableEntry {
    pub fn offset(&self) -> Ref<'_, u32> {
        self.offset.borrow()
    }
}
impl Ttf_DirTableEntry {
    pub fn length(&self) -> Ref<'_, u32> {
        self.length.borrow()
    }
}
impl Ttf_DirTableEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Ttf_DirTableEntry {
    pub fn value_raw(&self) -> Ref<'_, Vec<u8>> {
        self.value_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ttf_Fixed {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    major: RefCell<u16>,
    minor: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_Fixed {
    type Root = Ttf;
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
        *self_rc.major.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.minor.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl Ttf_Fixed {
}
impl Ttf_Fixed {
    pub fn major(&self) -> Ref<'_, u16> {
        self.major.borrow()
    }
}
impl Ttf_Fixed {
    pub fn minor(&self) -> Ref<'_, u16> {
        self.minor.borrow()
    }
}
impl Ttf_Fixed {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ttf_Fpgm {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_DirTableEntry>,
    pub _self: SharedType<Self>,
    instructions: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_Fpgm {
    type Root = Ttf;
    type Parent = Ttf_DirTableEntry;

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
        *self_rc.instructions.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl Ttf_Fpgm {
}
impl Ttf_Fpgm {
    pub fn instructions(&self) -> Ref<'_, Vec<u8>> {
        self.instructions.borrow()
    }
}
impl Ttf_Fpgm {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ttf_Glyf {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_DirTableEntry>,
    pub _self: SharedType<Self>,
    number_of_contours: RefCell<i16>,
    x_min: RefCell<i16>,
    y_min: RefCell<i16>,
    x_max: RefCell<i16>,
    y_max: RefCell<i16>,
    value: RefCell<OptRc<Ttf_Glyf_SimpleGlyph>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_Glyf {
    type Root = Ttf;
    type Parent = Ttf_DirTableEntry;

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
        *self_rc.number_of_contours.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.x_min.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.y_min.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.x_max.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.y_max.borrow_mut() = _io.read_s2be()?.into();
        if ((*self_rc.number_of_contours() as i16) > (0 as i16)) {
            let t = Self::read_into::<_, Ttf_Glyf_SimpleGlyph>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.value.borrow_mut() = t;
        }
        Ok(())
    }
}
impl Ttf_Glyf {
}
impl Ttf_Glyf {
    pub fn number_of_contours(&self) -> Ref<'_, i16> {
        self.number_of_contours.borrow()
    }
}
impl Ttf_Glyf {
    pub fn x_min(&self) -> Ref<'_, i16> {
        self.x_min.borrow()
    }
}
impl Ttf_Glyf {
    pub fn y_min(&self) -> Ref<'_, i16> {
        self.y_min.borrow()
    }
}
impl Ttf_Glyf {
    pub fn x_max(&self) -> Ref<'_, i16> {
        self.x_max.borrow()
    }
}
impl Ttf_Glyf {
    pub fn y_max(&self) -> Ref<'_, i16> {
        self.y_max.borrow()
    }
}
impl Ttf_Glyf {
    pub fn value(&self) -> Ref<'_, OptRc<Ttf_Glyf_SimpleGlyph>> {
        self.value.borrow()
    }
}
impl Ttf_Glyf {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ttf_Glyf_SimpleGlyph {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_Glyf>,
    pub _self: SharedType<Self>,
    end_pts_of_contours: RefCell<Vec<u16>>,
    instruction_length: RefCell<u16>,
    instructions: RefCell<Vec<u8>>,
    flags: RefCell<Vec<OptRc<Ttf_Glyf_SimpleGlyph_Flag>>>,
    _io: RefCell<BytesReader>,
    f_point_count: Cell<bool>,
    point_count: RefCell<i32>,
}
impl KStruct for Ttf_Glyf_SimpleGlyph {
    type Root = Ttf;
    type Parent = Ttf_Glyf;

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
        *self_rc.end_pts_of_contours.borrow_mut() = Vec::new();
        let l_end_pts_of_contours = *_prc.as_ref().unwrap().number_of_contours();
        for _i in 0..l_end_pts_of_contours {
            self_rc.end_pts_of_contours.borrow_mut().push(_io.read_u2be()?.into());
        }
        *self_rc.instruction_length.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.instructions.borrow_mut() = _io.read_bytes(*self_rc.instruction_length() as usize)?.into();
        *self_rc.flags.borrow_mut() = Vec::new();
        let l_flags = *self_rc.point_count()?;
        for _i in 0..l_flags {
            let t = Self::read_into::<_, Ttf_Glyf_SimpleGlyph_Flag>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.flags.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Ttf_Glyf_SimpleGlyph {
    pub fn point_count(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_point_count.get() {
            return Ok(self.point_count.borrow());
        }
        self.f_point_count.set(true);
        *self.point_count.borrow_mut() = (((*self.end_pts_of_contours().iter().max().ok_or(KError::EmptyIterator)? as u16) + (1 as u16))) as i32;
        Ok(self.point_count.borrow())
    }
}
impl Ttf_Glyf_SimpleGlyph {
    pub fn end_pts_of_contours(&self) -> Ref<'_, Vec<u16>> {
        self.end_pts_of_contours.borrow()
    }
}
impl Ttf_Glyf_SimpleGlyph {
    pub fn instruction_length(&self) -> Ref<'_, u16> {
        self.instruction_length.borrow()
    }
}
impl Ttf_Glyf_SimpleGlyph {
    pub fn instructions(&self) -> Ref<'_, Vec<u8>> {
        self.instructions.borrow()
    }
}
impl Ttf_Glyf_SimpleGlyph {
    pub fn flags(&self) -> Ref<'_, Vec<OptRc<Ttf_Glyf_SimpleGlyph_Flag>>> {
        self.flags.borrow()
    }
}
impl Ttf_Glyf_SimpleGlyph {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ttf_Glyf_SimpleGlyph_Flag {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_Glyf_SimpleGlyph>,
    pub _self: SharedType<Self>,
    reserved: RefCell<u64>,
    y_is_same: RefCell<bool>,
    x_is_same: RefCell<bool>,
    repeat: RefCell<bool>,
    y_short_vector: RefCell<bool>,
    x_short_vector: RefCell<bool>,
    on_curve: RefCell<bool>,
    repeat_value: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_Glyf_SimpleGlyph_Flag {
    type Root = Ttf;
    type Parent = Ttf_Glyf_SimpleGlyph;

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
        *self_rc.reserved.borrow_mut() = _io.read_bits_int_be(2)?;
        *self_rc.y_is_same.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.x_is_same.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.repeat.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.y_short_vector.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.x_short_vector.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.on_curve.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        _io.align_to_byte()?;
        if *self_rc.repeat() {
            *self_rc.repeat_value.borrow_mut() = _io.read_u1()?.into();
        }
        Ok(())
    }
}
impl Ttf_Glyf_SimpleGlyph_Flag {
}
impl Ttf_Glyf_SimpleGlyph_Flag {
    pub fn reserved(&self) -> Ref<'_, u64> {
        self.reserved.borrow()
    }
}
impl Ttf_Glyf_SimpleGlyph_Flag {
    pub fn y_is_same(&self) -> Ref<'_, bool> {
        self.y_is_same.borrow()
    }
}
impl Ttf_Glyf_SimpleGlyph_Flag {
    pub fn x_is_same(&self) -> Ref<'_, bool> {
        self.x_is_same.borrow()
    }
}
impl Ttf_Glyf_SimpleGlyph_Flag {
    pub fn repeat(&self) -> Ref<'_, bool> {
        self.repeat.borrow()
    }
}
impl Ttf_Glyf_SimpleGlyph_Flag {
    pub fn y_short_vector(&self) -> Ref<'_, bool> {
        self.y_short_vector.borrow()
    }
}
impl Ttf_Glyf_SimpleGlyph_Flag {
    pub fn x_short_vector(&self) -> Ref<'_, bool> {
        self.x_short_vector.borrow()
    }
}
impl Ttf_Glyf_SimpleGlyph_Flag {
    pub fn on_curve(&self) -> Ref<'_, bool> {
        self.on_curve.borrow()
    }
}
impl Ttf_Glyf_SimpleGlyph_Flag {
    pub fn repeat_value(&self) -> Ref<'_, u8> {
        self.repeat_value.borrow()
    }
}
impl Ttf_Glyf_SimpleGlyph_Flag {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ttf_Head {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_DirTableEntry>,
    pub _self: SharedType<Self>,
    version: RefCell<OptRc<Ttf_Fixed>>,
    font_revision: RefCell<OptRc<Ttf_Fixed>>,
    checksum_adjustment: RefCell<u32>,
    magic_number: RefCell<Vec<u8>>,
    flags: RefCell<Ttf_Head_Flags>,
    units_per_em: RefCell<u16>,
    created: RefCell<u64>,
    modified: RefCell<u64>,
    x_min: RefCell<i16>,
    y_min: RefCell<i16>,
    x_max: RefCell<i16>,
    y_max: RefCell<i16>,
    mac_style: RefCell<u16>,
    lowest_rec_ppem: RefCell<u16>,
    font_direction_hint: RefCell<Ttf_Head_FontDirectionHint>,
    index_to_loc_format: RefCell<i16>,
    glyph_data_format: RefCell<i16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_Head {
    type Root = Ttf;
    type Parent = Ttf_DirTableEntry;

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
        let t = Self::read_into::<_, Ttf_Fixed>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.version.borrow_mut() = t;
        let t = Self::read_into::<_, Ttf_Fixed>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.font_revision.borrow_mut() = t;
        *self_rc.checksum_adjustment.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.magic_number.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.magic_number() == vec![0x5fu8, 0xfu8, 0x3cu8, 0xf5u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/head/seq/3".to_string() }));
        }
        *self_rc.flags.borrow_mut() = (_io.read_u2be()? as i64).try_into()?;
        *self_rc.units_per_em.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.created.borrow_mut() = _io.read_u8be()?.into();
        *self_rc.modified.borrow_mut() = _io.read_u8be()?.into();
        *self_rc.x_min.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.y_min.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.x_max.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.y_max.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.mac_style.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.lowest_rec_ppem.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.font_direction_hint.borrow_mut() = (_io.read_s2be()? as i64).try_into()?;
        *self_rc.index_to_loc_format.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.glyph_data_format.borrow_mut() = _io.read_s2be()?.into();
        Ok(())
    }
}
impl Ttf_Head {
}
impl Ttf_Head {
    pub fn version(&self) -> Ref<'_, OptRc<Ttf_Fixed>> {
        self.version.borrow()
    }
}
impl Ttf_Head {
    pub fn font_revision(&self) -> Ref<'_, OptRc<Ttf_Fixed>> {
        self.font_revision.borrow()
    }
}
impl Ttf_Head {
    pub fn checksum_adjustment(&self) -> Ref<'_, u32> {
        self.checksum_adjustment.borrow()
    }
}
impl Ttf_Head {
    pub fn magic_number(&self) -> Ref<'_, Vec<u8>> {
        self.magic_number.borrow()
    }
}
impl Ttf_Head {
    pub fn flags(&self) -> Ref<'_, Ttf_Head_Flags> {
        self.flags.borrow()
    }
}
impl Ttf_Head {
    pub fn units_per_em(&self) -> Ref<'_, u16> {
        self.units_per_em.borrow()
    }
}
impl Ttf_Head {
    pub fn created(&self) -> Ref<'_, u64> {
        self.created.borrow()
    }
}
impl Ttf_Head {
    pub fn modified(&self) -> Ref<'_, u64> {
        self.modified.borrow()
    }
}
impl Ttf_Head {
    pub fn x_min(&self) -> Ref<'_, i16> {
        self.x_min.borrow()
    }
}
impl Ttf_Head {
    pub fn y_min(&self) -> Ref<'_, i16> {
        self.y_min.borrow()
    }
}
impl Ttf_Head {
    pub fn x_max(&self) -> Ref<'_, i16> {
        self.x_max.borrow()
    }
}
impl Ttf_Head {
    pub fn y_max(&self) -> Ref<'_, i16> {
        self.y_max.borrow()
    }
}
impl Ttf_Head {
    pub fn mac_style(&self) -> Ref<'_, u16> {
        self.mac_style.borrow()
    }
}
impl Ttf_Head {
    pub fn lowest_rec_ppem(&self) -> Ref<'_, u16> {
        self.lowest_rec_ppem.borrow()
    }
}
impl Ttf_Head {
    pub fn font_direction_hint(&self) -> Ref<'_, Ttf_Head_FontDirectionHint> {
        self.font_direction_hint.borrow()
    }
}
impl Ttf_Head {
    pub fn index_to_loc_format(&self) -> Ref<'_, i16> {
        self.index_to_loc_format.borrow()
    }
}
impl Ttf_Head {
    pub fn glyph_data_format(&self) -> Ref<'_, i16> {
        self.glyph_data_format.borrow()
    }
}
impl Ttf_Head {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Ttf_Head_Flags {
    BaselineAtY0,
    LeftSidebearingAtX0,
    FlagDependOnPointSize,
    FlagForcePpem,
    FlagMayAdvanceWidth,
    Unknown(i64),
}

impl TryFrom<i64> for Ttf_Head_Flags {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ttf_Head_Flags> {
        match flag {
            1 => Ok(Ttf_Head_Flags::BaselineAtY0),
            2 => Ok(Ttf_Head_Flags::LeftSidebearingAtX0),
            4 => Ok(Ttf_Head_Flags::FlagDependOnPointSize),
            8 => Ok(Ttf_Head_Flags::FlagForcePpem),
            16 => Ok(Ttf_Head_Flags::FlagMayAdvanceWidth),
            _ => Ok(Ttf_Head_Flags::Unknown(flag)),
        }
    }
}

impl From<&Ttf_Head_Flags> for i64 {
    fn from(v: &Ttf_Head_Flags) -> Self {
        match *v {
            Ttf_Head_Flags::BaselineAtY0 => 1,
            Ttf_Head_Flags::LeftSidebearingAtX0 => 2,
            Ttf_Head_Flags::FlagDependOnPointSize => 4,
            Ttf_Head_Flags::FlagForcePpem => 8,
            Ttf_Head_Flags::FlagMayAdvanceWidth => 16,
            Ttf_Head_Flags::Unknown(v) => v
        }
    }
}

impl Default for Ttf_Head_Flags {
    fn default() -> Self { Ttf_Head_Flags::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Ttf_Head_FontDirectionHint {
    FullyMixedDirectionalGlyphs,
    OnlyStronglyLeftToRight,
    StronglyLeftToRightAndNeutrals,
    Unknown(i64),
}

impl TryFrom<i64> for Ttf_Head_FontDirectionHint {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ttf_Head_FontDirectionHint> {
        match flag {
            0 => Ok(Ttf_Head_FontDirectionHint::FullyMixedDirectionalGlyphs),
            1 => Ok(Ttf_Head_FontDirectionHint::OnlyStronglyLeftToRight),
            2 => Ok(Ttf_Head_FontDirectionHint::StronglyLeftToRightAndNeutrals),
            _ => Ok(Ttf_Head_FontDirectionHint::Unknown(flag)),
        }
    }
}

impl From<&Ttf_Head_FontDirectionHint> for i64 {
    fn from(v: &Ttf_Head_FontDirectionHint) -> Self {
        match *v {
            Ttf_Head_FontDirectionHint::FullyMixedDirectionalGlyphs => 0,
            Ttf_Head_FontDirectionHint::OnlyStronglyLeftToRight => 1,
            Ttf_Head_FontDirectionHint::StronglyLeftToRightAndNeutrals => 2,
            Ttf_Head_FontDirectionHint::Unknown(v) => v
        }
    }
}

impl Default for Ttf_Head_FontDirectionHint {
    fn default() -> Self { Ttf_Head_FontDirectionHint::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Ttf_Hhea {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_DirTableEntry>,
    pub _self: SharedType<Self>,
    version: RefCell<OptRc<Ttf_Fixed>>,
    ascender: RefCell<i16>,
    descender: RefCell<i16>,
    line_gap: RefCell<i16>,
    advance_width_max: RefCell<u16>,
    min_left_side_bearing: RefCell<i16>,
    min_right_side_bearing: RefCell<i16>,
    x_max_extend: RefCell<i16>,
    caret_slope_rise: RefCell<i16>,
    caret_slope_run: RefCell<i16>,
    reserved: RefCell<Vec<u8>>,
    metric_data_format: RefCell<i16>,
    number_of_hmetrics: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_Hhea {
    type Root = Ttf;
    type Parent = Ttf_DirTableEntry;

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
        let t = Self::read_into::<_, Ttf_Fixed>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.version.borrow_mut() = t;
        *self_rc.ascender.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.descender.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.line_gap.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.advance_width_max.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.min_left_side_bearing.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.min_right_side_bearing.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.x_max_extend.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.caret_slope_rise.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.caret_slope_run.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_bytes(10 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/hhea/seq/10".to_string() }));
        }
        *self_rc.metric_data_format.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.number_of_hmetrics.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl Ttf_Hhea {
}
impl Ttf_Hhea {
    pub fn version(&self) -> Ref<'_, OptRc<Ttf_Fixed>> {
        self.version.borrow()
    }
}

/**
 * Typographic ascent
 */
impl Ttf_Hhea {
    pub fn ascender(&self) -> Ref<'_, i16> {
        self.ascender.borrow()
    }
}

/**
 * Typographic descent
 */
impl Ttf_Hhea {
    pub fn descender(&self) -> Ref<'_, i16> {
        self.descender.borrow()
    }
}

/**
 * Typographic line gap. Negative LineGap values are treated as zero in Windows 3.1, System 6, and System 7.
 */
impl Ttf_Hhea {
    pub fn line_gap(&self) -> Ref<'_, i16> {
        self.line_gap.borrow()
    }
}

/**
 * Maximum advance width value in `hmtx` table.
 */
impl Ttf_Hhea {
    pub fn advance_width_max(&self) -> Ref<'_, u16> {
        self.advance_width_max.borrow()
    }
}

/**
 * Minimum left sidebearing value in `hmtx` table.
 */
impl Ttf_Hhea {
    pub fn min_left_side_bearing(&self) -> Ref<'_, i16> {
        self.min_left_side_bearing.borrow()
    }
}

/**
 * Minimum right sidebearing value; calculated as Min(aw - lsb - (xMax - xMin)).
 */
impl Ttf_Hhea {
    pub fn min_right_side_bearing(&self) -> Ref<'_, i16> {
        self.min_right_side_bearing.borrow()
    }
}

/**
 * Max(lsb + (xMax - xMin)).
 */
impl Ttf_Hhea {
    pub fn x_max_extend(&self) -> Ref<'_, i16> {
        self.x_max_extend.borrow()
    }
}
impl Ttf_Hhea {
    pub fn caret_slope_rise(&self) -> Ref<'_, i16> {
        self.caret_slope_rise.borrow()
    }
}
impl Ttf_Hhea {
    pub fn caret_slope_run(&self) -> Ref<'_, i16> {
        self.caret_slope_run.borrow()
    }
}
impl Ttf_Hhea {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Ttf_Hhea {
    pub fn metric_data_format(&self) -> Ref<'_, i16> {
        self.metric_data_format.borrow()
    }
}
impl Ttf_Hhea {
    pub fn number_of_hmetrics(&self) -> Ref<'_, u16> {
        self.number_of_hmetrics.borrow()
    }
}
impl Ttf_Hhea {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ttf_Kern {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_DirTableEntry>,
    pub _self: SharedType<Self>,
    version: RefCell<u16>,
    subtable_count: RefCell<u16>,
    subtables: RefCell<Vec<OptRc<Ttf_Kern_Subtable>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_Kern {
    type Root = Ttf;
    type Parent = Ttf_DirTableEntry;

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
        *self_rc.version.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.subtable_count.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.subtables.borrow_mut() = Vec::new();
        let l_subtables = *self_rc.subtable_count();
        for _i in 0..l_subtables {
            let t = Self::read_into::<_, Ttf_Kern_Subtable>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.subtables.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Ttf_Kern {
}
impl Ttf_Kern {
    pub fn version(&self) -> Ref<'_, u16> {
        self.version.borrow()
    }
}
impl Ttf_Kern {
    pub fn subtable_count(&self) -> Ref<'_, u16> {
        self.subtable_count.borrow()
    }
}
impl Ttf_Kern {
    pub fn subtables(&self) -> Ref<'_, Vec<OptRc<Ttf_Kern_Subtable>>> {
        self.subtables.borrow()
    }
}
impl Ttf_Kern {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ttf_Kern_Subtable {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_Kern>,
    pub _self: SharedType<Self>,
    version: RefCell<u16>,
    length: RefCell<u16>,
    format: RefCell<u8>,
    reserved: RefCell<u64>,
    is_override: RefCell<bool>,
    is_cross_stream: RefCell<bool>,
    is_minimum: RefCell<bool>,
    is_horizontal: RefCell<bool>,
    format0: RefCell<OptRc<Ttf_Kern_Subtable_Format0>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_Kern_Subtable {
    type Root = Ttf;
    type Parent = Ttf_Kern;

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
        *self_rc.version.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.length.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.format.borrow_mut() = _io.read_u1()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_bits_int_be(4)?;
        *self_rc.is_override.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.is_cross_stream.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.is_minimum.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.is_horizontal.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        _io.align_to_byte()?;
        if ((*self_rc.format() as u8) == (0 as u8)) {
            let t = Self::read_into::<_, Ttf_Kern_Subtable_Format0>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.format0.borrow_mut() = t;
        }
        Ok(())
    }
}
impl Ttf_Kern_Subtable {
}
impl Ttf_Kern_Subtable {
    pub fn version(&self) -> Ref<'_, u16> {
        self.version.borrow()
    }
}
impl Ttf_Kern_Subtable {
    pub fn length(&self) -> Ref<'_, u16> {
        self.length.borrow()
    }
}
impl Ttf_Kern_Subtable {
    pub fn format(&self) -> Ref<'_, u8> {
        self.format.borrow()
    }
}
impl Ttf_Kern_Subtable {
    pub fn reserved(&self) -> Ref<'_, u64> {
        self.reserved.borrow()
    }
}
impl Ttf_Kern_Subtable {
    pub fn is_override(&self) -> Ref<'_, bool> {
        self.is_override.borrow()
    }
}
impl Ttf_Kern_Subtable {
    pub fn is_cross_stream(&self) -> Ref<'_, bool> {
        self.is_cross_stream.borrow()
    }
}
impl Ttf_Kern_Subtable {
    pub fn is_minimum(&self) -> Ref<'_, bool> {
        self.is_minimum.borrow()
    }
}
impl Ttf_Kern_Subtable {
    pub fn is_horizontal(&self) -> Ref<'_, bool> {
        self.is_horizontal.borrow()
    }
}
impl Ttf_Kern_Subtable {
    pub fn format0(&self) -> Ref<'_, OptRc<Ttf_Kern_Subtable_Format0>> {
        self.format0.borrow()
    }
}
impl Ttf_Kern_Subtable {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ttf_Kern_Subtable_Format0 {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_Kern_Subtable>,
    pub _self: SharedType<Self>,
    pair_count: RefCell<u16>,
    search_range: RefCell<u16>,
    entry_selector: RefCell<u16>,
    range_shift: RefCell<u16>,
    kerning_pairs: RefCell<Vec<OptRc<Ttf_Kern_Subtable_Format0_KerningPair>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_Kern_Subtable_Format0 {
    type Root = Ttf;
    type Parent = Ttf_Kern_Subtable;

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
        *self_rc.pair_count.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.search_range.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.entry_selector.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.range_shift.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.kerning_pairs.borrow_mut() = Vec::new();
        let l_kerning_pairs = *self_rc.pair_count();
        for _i in 0..l_kerning_pairs {
            let t = Self::read_into::<_, Ttf_Kern_Subtable_Format0_KerningPair>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.kerning_pairs.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Ttf_Kern_Subtable_Format0 {
}
impl Ttf_Kern_Subtable_Format0 {
    pub fn pair_count(&self) -> Ref<'_, u16> {
        self.pair_count.borrow()
    }
}
impl Ttf_Kern_Subtable_Format0 {
    pub fn search_range(&self) -> Ref<'_, u16> {
        self.search_range.borrow()
    }
}
impl Ttf_Kern_Subtable_Format0 {
    pub fn entry_selector(&self) -> Ref<'_, u16> {
        self.entry_selector.borrow()
    }
}
impl Ttf_Kern_Subtable_Format0 {
    pub fn range_shift(&self) -> Ref<'_, u16> {
        self.range_shift.borrow()
    }
}
impl Ttf_Kern_Subtable_Format0 {
    pub fn kerning_pairs(&self) -> Ref<'_, Vec<OptRc<Ttf_Kern_Subtable_Format0_KerningPair>>> {
        self.kerning_pairs.borrow()
    }
}
impl Ttf_Kern_Subtable_Format0 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ttf_Kern_Subtable_Format0_KerningPair {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_Kern_Subtable_Format0>,
    pub _self: SharedType<Self>,
    left: RefCell<u16>,
    right: RefCell<u16>,
    value: RefCell<i16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_Kern_Subtable_Format0_KerningPair {
    type Root = Ttf;
    type Parent = Ttf_Kern_Subtable_Format0;

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
        *self_rc.left.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.right.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.value.borrow_mut() = _io.read_s2be()?.into();
        Ok(())
    }
}
impl Ttf_Kern_Subtable_Format0_KerningPair {
}
impl Ttf_Kern_Subtable_Format0_KerningPair {
    pub fn left(&self) -> Ref<'_, u16> {
        self.left.borrow()
    }
}
impl Ttf_Kern_Subtable_Format0_KerningPair {
    pub fn right(&self) -> Ref<'_, u16> {
        self.right.borrow()
    }
}
impl Ttf_Kern_Subtable_Format0_KerningPair {
    pub fn value(&self) -> Ref<'_, i16> {
        self.value.borrow()
    }
}
impl Ttf_Kern_Subtable_Format0_KerningPair {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ttf_Maxp {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_DirTableEntry>,
    pub _self: SharedType<Self>,
    table_version_number: RefCell<OptRc<Ttf_Fixed>>,
    num_glyphs: RefCell<u16>,
    version10_body: RefCell<OptRc<Ttf_MaxpVersion10Body>>,
    _io: RefCell<BytesReader>,
    f_is_version10: Cell<bool>,
    is_version10: RefCell<bool>,
}
impl KStruct for Ttf_Maxp {
    type Root = Ttf;
    type Parent = Ttf_DirTableEntry;

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
        let t = Self::read_into::<_, Ttf_Fixed>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.table_version_number.borrow_mut() = t;
        *self_rc.num_glyphs.borrow_mut() = _io.read_u2be()?.into();
        if *self_rc.is_version10()? {
            let t = Self::read_into::<_, Ttf_MaxpVersion10Body>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.version10_body.borrow_mut() = t;
        }
        Ok(())
    }
}
impl Ttf_Maxp {
    pub fn is_version10(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_version10.get() {
            return Ok(self.is_version10.borrow());
        }
        self.f_is_version10.set(true);
        *self.is_version10.borrow_mut() = ( ((((*self.table_version_number().major() as u16) == (1 as u16))) && (((*self.table_version_number().minor() as u16) == (0 as u16)))) ) as bool;
        Ok(self.is_version10.borrow())
    }
}

/**
 * 0x00010000 for version 1.0.
 */
impl Ttf_Maxp {
    pub fn table_version_number(&self) -> Ref<'_, OptRc<Ttf_Fixed>> {
        self.table_version_number.borrow()
    }
}

/**
 * The number of glyphs in the font.
 */
impl Ttf_Maxp {
    pub fn num_glyphs(&self) -> Ref<'_, u16> {
        self.num_glyphs.borrow()
    }
}
impl Ttf_Maxp {
    pub fn version10_body(&self) -> Ref<'_, OptRc<Ttf_MaxpVersion10Body>> {
        self.version10_body.borrow()
    }
}
impl Ttf_Maxp {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ttf_MaxpVersion10Body {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_Maxp>,
    pub _self: SharedType<Self>,
    max_points: RefCell<u16>,
    max_contours: RefCell<u16>,
    max_composite_points: RefCell<u16>,
    max_composite_contours: RefCell<u16>,
    max_zones: RefCell<u16>,
    max_twilight_points: RefCell<u16>,
    max_storage: RefCell<u16>,
    max_function_defs: RefCell<u16>,
    max_instruction_defs: RefCell<u16>,
    max_stack_elements: RefCell<u16>,
    max_size_of_instructions: RefCell<u16>,
    max_component_elements: RefCell<u16>,
    max_component_depth: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_MaxpVersion10Body {
    type Root = Ttf;
    type Parent = Ttf_Maxp;

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
        *self_rc.max_points.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.max_contours.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.max_composite_points.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.max_composite_contours.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.max_zones.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.max_twilight_points.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.max_storage.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.max_function_defs.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.max_instruction_defs.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.max_stack_elements.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.max_size_of_instructions.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.max_component_elements.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.max_component_depth.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl Ttf_MaxpVersion10Body {
}

/**
 * Maximum points in a non-composite glyph.
 */
impl Ttf_MaxpVersion10Body {
    pub fn max_points(&self) -> Ref<'_, u16> {
        self.max_points.borrow()
    }
}

/**
 * Maximum contours in a non-composite glyph.
 */
impl Ttf_MaxpVersion10Body {
    pub fn max_contours(&self) -> Ref<'_, u16> {
        self.max_contours.borrow()
    }
}

/**
 * Maximum points in a composite glyph.
 */
impl Ttf_MaxpVersion10Body {
    pub fn max_composite_points(&self) -> Ref<'_, u16> {
        self.max_composite_points.borrow()
    }
}

/**
 * Maximum contours in a composite glyph.
 */
impl Ttf_MaxpVersion10Body {
    pub fn max_composite_contours(&self) -> Ref<'_, u16> {
        self.max_composite_contours.borrow()
    }
}

/**
 * 1 if instructions do not use the twilight zone (Z0), or 2 if instructions do use Z0; should be set to 2 in most cases.
 */
impl Ttf_MaxpVersion10Body {
    pub fn max_zones(&self) -> Ref<'_, u16> {
        self.max_zones.borrow()
    }
}

/**
 * Maximum points used in Z0.
 */
impl Ttf_MaxpVersion10Body {
    pub fn max_twilight_points(&self) -> Ref<'_, u16> {
        self.max_twilight_points.borrow()
    }
}

/**
 * Number of Storage Area locations.
 */
impl Ttf_MaxpVersion10Body {
    pub fn max_storage(&self) -> Ref<'_, u16> {
        self.max_storage.borrow()
    }
}

/**
 * Number of FDEFs.
 */
impl Ttf_MaxpVersion10Body {
    pub fn max_function_defs(&self) -> Ref<'_, u16> {
        self.max_function_defs.borrow()
    }
}

/**
 * Number of IDEFs.
 */
impl Ttf_MaxpVersion10Body {
    pub fn max_instruction_defs(&self) -> Ref<'_, u16> {
        self.max_instruction_defs.borrow()
    }
}

/**
 * Maximum stack depth.
 */
impl Ttf_MaxpVersion10Body {
    pub fn max_stack_elements(&self) -> Ref<'_, u16> {
        self.max_stack_elements.borrow()
    }
}

/**
 * Maximum byte count for glyph instructions.
 */
impl Ttf_MaxpVersion10Body {
    pub fn max_size_of_instructions(&self) -> Ref<'_, u16> {
        self.max_size_of_instructions.borrow()
    }
}

/**
 * Maximum number of components referenced at "top level" for any composite glyph.
 */
impl Ttf_MaxpVersion10Body {
    pub fn max_component_elements(&self) -> Ref<'_, u16> {
        self.max_component_elements.borrow()
    }
}

/**
 * Maximum levels of recursion; 1 for simple components.
 */
impl Ttf_MaxpVersion10Body {
    pub fn max_component_depth(&self) -> Ref<'_, u16> {
        self.max_component_depth.borrow()
    }
}
impl Ttf_MaxpVersion10Body {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Name table is meant to include human-readable string metadata
 * that describes font: name of the font, its styles, copyright &
 * trademark notices, vendor and designer info, etc.
 * 
 * The table includes a list of "name records", each of which
 * corresponds to a single metadata entry.
 * \sa https://developer.apple.com/fonts/TrueType-Reference-Manual/RM06/Chap6name.html Source
 */

#[derive(Default, Debug, Clone)]
pub struct Ttf_Name {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_DirTableEntry>,
    pub _self: SharedType<Self>,
    format_selector: RefCell<u16>,
    num_name_records: RefCell<u16>,
    ofs_strings: RefCell<u16>,
    name_records: RefCell<Vec<OptRc<Ttf_Name_NameRecord>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_Name {
    type Root = Ttf;
    type Parent = Ttf_DirTableEntry;

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
        *self_rc.format_selector.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.num_name_records.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.ofs_strings.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.name_records.borrow_mut() = Vec::new();
        let l_name_records = *self_rc.num_name_records();
        for _i in 0..l_name_records {
            let t = Self::read_into::<_, Ttf_Name_NameRecord>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.name_records.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Ttf_Name {
}
impl Ttf_Name {
    pub fn format_selector(&self) -> Ref<'_, u16> {
        self.format_selector.borrow()
    }
}
impl Ttf_Name {
    pub fn num_name_records(&self) -> Ref<'_, u16> {
        self.num_name_records.borrow()
    }
}
impl Ttf_Name {
    pub fn ofs_strings(&self) -> Ref<'_, u16> {
        self.ofs_strings.borrow()
    }
}
impl Ttf_Name {
    pub fn name_records(&self) -> Ref<'_, Vec<OptRc<Ttf_Name_NameRecord>>> {
        self.name_records.borrow()
    }
}
impl Ttf_Name {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Ttf_Name_Names {
    Copyright,
    FontFamily,
    FontSubfamily,
    UniqueSubfamilyId,
    FullFontName,
    NameTableVersion,
    PostscriptFontName,
    Trademark,
    Manufacturer,
    Designer,
    Description,
    UrlVendor,
    UrlDesigner,
    License,
    UrlLicense,
    Reserved15,
    PreferredFamily,
    PreferredSubfamily,
    CompatibleFullName,
    SampleText,
    Unknown(i64),
}

impl TryFrom<i64> for Ttf_Name_Names {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ttf_Name_Names> {
        match flag {
            0 => Ok(Ttf_Name_Names::Copyright),
            1 => Ok(Ttf_Name_Names::FontFamily),
            2 => Ok(Ttf_Name_Names::FontSubfamily),
            3 => Ok(Ttf_Name_Names::UniqueSubfamilyId),
            4 => Ok(Ttf_Name_Names::FullFontName),
            5 => Ok(Ttf_Name_Names::NameTableVersion),
            6 => Ok(Ttf_Name_Names::PostscriptFontName),
            7 => Ok(Ttf_Name_Names::Trademark),
            8 => Ok(Ttf_Name_Names::Manufacturer),
            9 => Ok(Ttf_Name_Names::Designer),
            10 => Ok(Ttf_Name_Names::Description),
            11 => Ok(Ttf_Name_Names::UrlVendor),
            12 => Ok(Ttf_Name_Names::UrlDesigner),
            13 => Ok(Ttf_Name_Names::License),
            14 => Ok(Ttf_Name_Names::UrlLicense),
            15 => Ok(Ttf_Name_Names::Reserved15),
            16 => Ok(Ttf_Name_Names::PreferredFamily),
            17 => Ok(Ttf_Name_Names::PreferredSubfamily),
            18 => Ok(Ttf_Name_Names::CompatibleFullName),
            19 => Ok(Ttf_Name_Names::SampleText),
            _ => Ok(Ttf_Name_Names::Unknown(flag)),
        }
    }
}

impl From<&Ttf_Name_Names> for i64 {
    fn from(v: &Ttf_Name_Names) -> Self {
        match *v {
            Ttf_Name_Names::Copyright => 0,
            Ttf_Name_Names::FontFamily => 1,
            Ttf_Name_Names::FontSubfamily => 2,
            Ttf_Name_Names::UniqueSubfamilyId => 3,
            Ttf_Name_Names::FullFontName => 4,
            Ttf_Name_Names::NameTableVersion => 5,
            Ttf_Name_Names::PostscriptFontName => 6,
            Ttf_Name_Names::Trademark => 7,
            Ttf_Name_Names::Manufacturer => 8,
            Ttf_Name_Names::Designer => 9,
            Ttf_Name_Names::Description => 10,
            Ttf_Name_Names::UrlVendor => 11,
            Ttf_Name_Names::UrlDesigner => 12,
            Ttf_Name_Names::License => 13,
            Ttf_Name_Names::UrlLicense => 14,
            Ttf_Name_Names::Reserved15 => 15,
            Ttf_Name_Names::PreferredFamily => 16,
            Ttf_Name_Names::PreferredSubfamily => 17,
            Ttf_Name_Names::CompatibleFullName => 18,
            Ttf_Name_Names::SampleText => 19,
            Ttf_Name_Names::Unknown(v) => v
        }
    }
}

impl Default for Ttf_Name_Names {
    fn default() -> Self { Ttf_Name_Names::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Ttf_Name_Platforms {
    Unicode,
    Macintosh,
    Reserved2,
    Microsoft,
    Unknown(i64),
}

impl TryFrom<i64> for Ttf_Name_Platforms {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ttf_Name_Platforms> {
        match flag {
            0 => Ok(Ttf_Name_Platforms::Unicode),
            1 => Ok(Ttf_Name_Platforms::Macintosh),
            2 => Ok(Ttf_Name_Platforms::Reserved2),
            3 => Ok(Ttf_Name_Platforms::Microsoft),
            _ => Ok(Ttf_Name_Platforms::Unknown(flag)),
        }
    }
}

impl From<&Ttf_Name_Platforms> for i64 {
    fn from(v: &Ttf_Name_Platforms) -> Self {
        match *v {
            Ttf_Name_Platforms::Unicode => 0,
            Ttf_Name_Platforms::Macintosh => 1,
            Ttf_Name_Platforms::Reserved2 => 2,
            Ttf_Name_Platforms::Microsoft => 3,
            Ttf_Name_Platforms::Unknown(v) => v
        }
    }
}

impl Default for Ttf_Name_Platforms {
    fn default() -> Self { Ttf_Name_Platforms::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Ttf_Name_NameRecord {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_Name>,
    pub _self: SharedType<Self>,
    platform_id: RefCell<Ttf_Name_Platforms>,
    encoding_id: RefCell<u16>,
    language_id: RefCell<u16>,
    name_id: RefCell<Ttf_Name_Names>,
    len_str: RefCell<u16>,
    ofs_str: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_ascii_value: Cell<bool>,
    ascii_value: RefCell<String>,
    f_unicode_value: Cell<bool>,
    unicode_value: RefCell<String>,
}
impl KStruct for Ttf_Name_NameRecord {
    type Root = Ttf;
    type Parent = Ttf_Name;

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
        *self_rc.platform_id.borrow_mut() = (_io.read_u2be()? as i64).try_into()?;
        *self_rc.encoding_id.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.language_id.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.name_id.borrow_mut() = (_io.read_u2be()? as i64).try_into()?;
        *self_rc.len_str.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.ofs_str.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl Ttf_Name_NameRecord {
    pub fn ascii_value(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ascii_value.get() {
            return Ok(self.ascii_value.borrow());
        }
        self.f_ascii_value.set(true);
        let io = Clone::clone(&*_prc.as_ref().unwrap()._io());
        let _pos = io.pos();
        io.seek(((*_prc.as_ref().unwrap().ofs_strings() as u16) + (*self.ofs_str() as u16)) as usize)?;
        *self.ascii_value.borrow_mut() = bytes_to_str(&io.read_bytes(*self.len_str() as usize)?.into(), "ASCII")?;
        io.seek(_pos)?;
        Ok(self.ascii_value.borrow())
    }
    pub fn unicode_value(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_unicode_value.get() {
            return Ok(self.unicode_value.borrow());
        }
        self.f_unicode_value.set(true);
        let io = Clone::clone(&*_prc.as_ref().unwrap()._io());
        let _pos = io.pos();
        io.seek(((*_prc.as_ref().unwrap().ofs_strings() as u16) + (*self.ofs_str() as u16)) as usize)?;
        *self.unicode_value.borrow_mut() = bytes_to_str(&io.read_bytes(*self.len_str() as usize)?.into(), "UTF-16BE")?;
        io.seek(_pos)?;
        Ok(self.unicode_value.borrow())
    }
}
impl Ttf_Name_NameRecord {
    pub fn platform_id(&self) -> Ref<'_, Ttf_Name_Platforms> {
        self.platform_id.borrow()
    }
}
impl Ttf_Name_NameRecord {
    pub fn encoding_id(&self) -> Ref<'_, u16> {
        self.encoding_id.borrow()
    }
}
impl Ttf_Name_NameRecord {
    pub fn language_id(&self) -> Ref<'_, u16> {
        self.language_id.borrow()
    }
}
impl Ttf_Name_NameRecord {
    pub fn name_id(&self) -> Ref<'_, Ttf_Name_Names> {
        self.name_id.borrow()
    }
}
impl Ttf_Name_NameRecord {
    pub fn len_str(&self) -> Ref<'_, u16> {
        self.len_str.borrow()
    }
}
impl Ttf_Name_NameRecord {
    pub fn ofs_str(&self) -> Ref<'_, u16> {
        self.ofs_str.borrow()
    }
}
impl Ttf_Name_NameRecord {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ttf_OffsetTable {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf>,
    pub _self: SharedType<Self>,
    sfnt_version: RefCell<OptRc<Ttf_Fixed>>,
    num_tables: RefCell<u16>,
    search_range: RefCell<u16>,
    entry_selector: RefCell<u16>,
    range_shift: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_OffsetTable {
    type Root = Ttf;
    type Parent = Ttf;

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
        let t = Self::read_into::<_, Ttf_Fixed>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.sfnt_version.borrow_mut() = t;
        *self_rc.num_tables.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.search_range.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.entry_selector.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.range_shift.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl Ttf_OffsetTable {
}
impl Ttf_OffsetTable {
    pub fn sfnt_version(&self) -> Ref<'_, OptRc<Ttf_Fixed>> {
        self.sfnt_version.borrow()
    }
}
impl Ttf_OffsetTable {
    pub fn num_tables(&self) -> Ref<'_, u16> {
        self.num_tables.borrow()
    }
}
impl Ttf_OffsetTable {
    pub fn search_range(&self) -> Ref<'_, u16> {
        self.search_range.borrow()
    }
}
impl Ttf_OffsetTable {
    pub fn entry_selector(&self) -> Ref<'_, u16> {
        self.entry_selector.borrow()
    }
}
impl Ttf_OffsetTable {
    pub fn range_shift(&self) -> Ref<'_, u16> {
        self.range_shift.borrow()
    }
}
impl Ttf_OffsetTable {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * The OS/2 table consists of a set of metrics that are required by Windows and OS/2.
 */

#[derive(Default, Debug, Clone)]
pub struct Ttf_Os2 {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_DirTableEntry>,
    pub _self: SharedType<Self>,
    version: RefCell<u16>,
    x_avg_char_width: RefCell<i16>,
    weight_class: RefCell<Ttf_Os2_WeightClass>,
    width_class: RefCell<Ttf_Os2_WidthClass>,
    fs_type: RefCell<Ttf_Os2_FsType>,
    y_subscript_x_size: RefCell<i16>,
    y_subscript_y_size: RefCell<i16>,
    y_subscript_x_offset: RefCell<i16>,
    y_subscript_y_offset: RefCell<i16>,
    y_superscript_x_size: RefCell<i16>,
    y_superscript_y_size: RefCell<i16>,
    y_superscript_x_offset: RefCell<i16>,
    y_superscript_y_offset: RefCell<i16>,
    y_strikeout_size: RefCell<i16>,
    y_strikeout_position: RefCell<i16>,
    s_family_class: RefCell<i16>,
    panose: RefCell<OptRc<Ttf_Os2_Panose>>,
    unicode_range: RefCell<OptRc<Ttf_Os2_UnicodeRange>>,
    ach_vend_id: RefCell<String>,
    selection: RefCell<Ttf_Os2_FsSelection>,
    first_char_index: RefCell<u16>,
    last_char_index: RefCell<u16>,
    typo_ascender: RefCell<i16>,
    typo_descender: RefCell<i16>,
    typo_line_gap: RefCell<i16>,
    win_ascent: RefCell<u16>,
    win_descent: RefCell<u16>,
    code_page_range: RefCell<OptRc<Ttf_Os2_CodePageRange>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_Os2 {
    type Root = Ttf;
    type Parent = Ttf_DirTableEntry;

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
        *self_rc.version.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.x_avg_char_width.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.weight_class.borrow_mut() = (_io.read_u2be()? as i64).try_into()?;
        *self_rc.width_class.borrow_mut() = (_io.read_u2be()? as i64).try_into()?;
        *self_rc.fs_type.borrow_mut() = (_io.read_s2be()? as i64).try_into()?;
        *self_rc.y_subscript_x_size.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.y_subscript_y_size.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.y_subscript_x_offset.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.y_subscript_y_offset.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.y_superscript_x_size.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.y_superscript_y_size.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.y_superscript_x_offset.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.y_superscript_y_offset.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.y_strikeout_size.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.y_strikeout_position.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.s_family_class.borrow_mut() = _io.read_s2be()?.into();
        let t = Self::read_into::<_, Ttf_Os2_Panose>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.panose.borrow_mut() = t;
        let t = Self::read_into::<_, Ttf_Os2_UnicodeRange>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.unicode_range.borrow_mut() = t;
        *self_rc.ach_vend_id.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "ASCII")?;
        *self_rc.selection.borrow_mut() = (_io.read_u2be()? as i64).try_into()?;
        *self_rc.first_char_index.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.last_char_index.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.typo_ascender.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.typo_descender.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.typo_line_gap.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.win_ascent.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.win_descent.borrow_mut() = _io.read_u2be()?.into();
        let t = Self::read_into::<_, Ttf_Os2_CodePageRange>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.code_page_range.borrow_mut() = t;
        Ok(())
    }
}
impl Ttf_Os2 {
}

/**
 * The version number for this OS/2 table.
 */
impl Ttf_Os2 {
    pub fn version(&self) -> Ref<'_, u16> {
        self.version.borrow()
    }
}

/**
 * The Average Character Width parameter specifies the arithmetic average of the escapement (width) of all of the 26 lowercase letters a through z of the Latin alphabet and the space character. If any of the 26 lowercase letters are not present, this parameter should equal the weighted average of all glyphs in the font. For non-UGL (platform 3, encoding 0) fonts, use the unweighted average.
 */
impl Ttf_Os2 {
    pub fn x_avg_char_width(&self) -> Ref<'_, i16> {
        self.x_avg_char_width.borrow()
    }
}

/**
 * Indicates the visual weight (degree of blackness or thickness of strokes) of the characters in the font.
 */
impl Ttf_Os2 {
    pub fn weight_class(&self) -> Ref<'_, Ttf_Os2_WeightClass> {
        self.weight_class.borrow()
    }
}

/**
 * Indicates a relative change from the normal aspect ratio (width to height ratio) as specified by a font designer for the glyphs in a font.
 */
impl Ttf_Os2 {
    pub fn width_class(&self) -> Ref<'_, Ttf_Os2_WidthClass> {
        self.width_class.borrow()
    }
}

/**
 * Indicates font embedding licensing rights for the font. Embeddable fonts may be stored in a document. When a document with embedded fonts is opened on a system that does not have the font installed (the remote system), the embedded font may be loaded for temporary (and in some cases, permanent) use on that system by an embedding-aware application. Embedding licensing rights are granted by the vendor of the font.
 */
impl Ttf_Os2 {
    pub fn fs_type(&self) -> Ref<'_, Ttf_Os2_FsType> {
        self.fs_type.borrow()
    }
}

/**
 * The recommended horizontal size in font design units for subscripts for this font.
 */
impl Ttf_Os2 {
    pub fn y_subscript_x_size(&self) -> Ref<'_, i16> {
        self.y_subscript_x_size.borrow()
    }
}

/**
 * The recommended vertical size in font design units for subscripts for this font.
 */
impl Ttf_Os2 {
    pub fn y_subscript_y_size(&self) -> Ref<'_, i16> {
        self.y_subscript_y_size.borrow()
    }
}

/**
 * The recommended horizontal offset in font design untis for subscripts for this font.
 */
impl Ttf_Os2 {
    pub fn y_subscript_x_offset(&self) -> Ref<'_, i16> {
        self.y_subscript_x_offset.borrow()
    }
}

/**
 * The recommended vertical offset in font design units from the baseline for subscripts for this font.
 */
impl Ttf_Os2 {
    pub fn y_subscript_y_offset(&self) -> Ref<'_, i16> {
        self.y_subscript_y_offset.borrow()
    }
}

/**
 * The recommended horizontal size in font design units for superscripts for this font.
 */
impl Ttf_Os2 {
    pub fn y_superscript_x_size(&self) -> Ref<'_, i16> {
        self.y_superscript_x_size.borrow()
    }
}

/**
 * The recommended vertical size in font design units for superscripts for this font.
 */
impl Ttf_Os2 {
    pub fn y_superscript_y_size(&self) -> Ref<'_, i16> {
        self.y_superscript_y_size.borrow()
    }
}

/**
 * The recommended horizontal offset in font design units for superscripts for this font.
 */
impl Ttf_Os2 {
    pub fn y_superscript_x_offset(&self) -> Ref<'_, i16> {
        self.y_superscript_x_offset.borrow()
    }
}

/**
 * The recommended vertical offset in font design units from the baseline for superscripts for this font.
 */
impl Ttf_Os2 {
    pub fn y_superscript_y_offset(&self) -> Ref<'_, i16> {
        self.y_superscript_y_offset.borrow()
    }
}

/**
 * Width of the strikeout stroke in font design units.
 */
impl Ttf_Os2 {
    pub fn y_strikeout_size(&self) -> Ref<'_, i16> {
        self.y_strikeout_size.borrow()
    }
}

/**
 * The position of the strikeout stroke relative to the baseline in font design units.
 */
impl Ttf_Os2 {
    pub fn y_strikeout_position(&self) -> Ref<'_, i16> {
        self.y_strikeout_position.borrow()
    }
}

/**
 * This parameter is a classification of font-family design.
 */
impl Ttf_Os2 {
    pub fn s_family_class(&self) -> Ref<'_, i16> {
        self.s_family_class.borrow()
    }
}
impl Ttf_Os2 {
    pub fn panose(&self) -> Ref<'_, OptRc<Ttf_Os2_Panose>> {
        self.panose.borrow()
    }
}
impl Ttf_Os2 {
    pub fn unicode_range(&self) -> Ref<'_, OptRc<Ttf_Os2_UnicodeRange>> {
        self.unicode_range.borrow()
    }
}

/**
 * The four character identifier for the vendor of the given type face.
 */
impl Ttf_Os2 {
    pub fn ach_vend_id(&self) -> Ref<'_, String> {
        self.ach_vend_id.borrow()
    }
}

/**
 * Contains information concerning the nature of the font patterns
 */
impl Ttf_Os2 {
    pub fn selection(&self) -> Ref<'_, Ttf_Os2_FsSelection> {
        self.selection.borrow()
    }
}

/**
 * The minimum Unicode index (character code) in this font, according to the cmap subtable for platform ID 3 and encoding ID 0 or 1.
 */
impl Ttf_Os2 {
    pub fn first_char_index(&self) -> Ref<'_, u16> {
        self.first_char_index.borrow()
    }
}

/**
 * The maximum Unicode index (character code) in this font, according to the cmap subtable for platform ID 3 and encoding ID 0 or 1.
 */
impl Ttf_Os2 {
    pub fn last_char_index(&self) -> Ref<'_, u16> {
        self.last_char_index.borrow()
    }
}

/**
 * The typographic ascender for this font.
 */
impl Ttf_Os2 {
    pub fn typo_ascender(&self) -> Ref<'_, i16> {
        self.typo_ascender.borrow()
    }
}

/**
 * The typographic descender for this font.
 */
impl Ttf_Os2 {
    pub fn typo_descender(&self) -> Ref<'_, i16> {
        self.typo_descender.borrow()
    }
}

/**
 * The typographic line gap for this font.
 */
impl Ttf_Os2 {
    pub fn typo_line_gap(&self) -> Ref<'_, i16> {
        self.typo_line_gap.borrow()
    }
}

/**
 * The ascender metric for Windows.
 */
impl Ttf_Os2 {
    pub fn win_ascent(&self) -> Ref<'_, u16> {
        self.win_ascent.borrow()
    }
}

/**
 * The descender metric for Windows.
 */
impl Ttf_Os2 {
    pub fn win_descent(&self) -> Ref<'_, u16> {
        self.win_descent.borrow()
    }
}

/**
 * This field is used to specify the code pages encompassed by the font file in the `cmap` subtable for platform 3, encoding ID 1 (Microsoft platform).
 */
impl Ttf_Os2 {
    pub fn code_page_range(&self) -> Ref<'_, OptRc<Ttf_Os2_CodePageRange>> {
        self.code_page_range.borrow()
    }
}
impl Ttf_Os2 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Ttf_Os2_FsSelection {
    Italic,
    Underscore,
    Negative,
    Outlined,
    Strikeout,
    Bold,
    Regular,
    Unknown(i64),
}

impl TryFrom<i64> for Ttf_Os2_FsSelection {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ttf_Os2_FsSelection> {
        match flag {
            1 => Ok(Ttf_Os2_FsSelection::Italic),
            2 => Ok(Ttf_Os2_FsSelection::Underscore),
            4 => Ok(Ttf_Os2_FsSelection::Negative),
            8 => Ok(Ttf_Os2_FsSelection::Outlined),
            16 => Ok(Ttf_Os2_FsSelection::Strikeout),
            32 => Ok(Ttf_Os2_FsSelection::Bold),
            64 => Ok(Ttf_Os2_FsSelection::Regular),
            _ => Ok(Ttf_Os2_FsSelection::Unknown(flag)),
        }
    }
}

impl From<&Ttf_Os2_FsSelection> for i64 {
    fn from(v: &Ttf_Os2_FsSelection) -> Self {
        match *v {
            Ttf_Os2_FsSelection::Italic => 1,
            Ttf_Os2_FsSelection::Underscore => 2,
            Ttf_Os2_FsSelection::Negative => 4,
            Ttf_Os2_FsSelection::Outlined => 8,
            Ttf_Os2_FsSelection::Strikeout => 16,
            Ttf_Os2_FsSelection::Bold => 32,
            Ttf_Os2_FsSelection::Regular => 64,
            Ttf_Os2_FsSelection::Unknown(v) => v
        }
    }
}

impl Default for Ttf_Os2_FsSelection {
    fn default() -> Self { Ttf_Os2_FsSelection::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Ttf_Os2_FsType {
    RestrictedLicenseEmbedding,
    PreviewAndPrintEmbedding,
    EditableEmbedding,
    Unknown(i64),
}

impl TryFrom<i64> for Ttf_Os2_FsType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ttf_Os2_FsType> {
        match flag {
            2 => Ok(Ttf_Os2_FsType::RestrictedLicenseEmbedding),
            4 => Ok(Ttf_Os2_FsType::PreviewAndPrintEmbedding),
            8 => Ok(Ttf_Os2_FsType::EditableEmbedding),
            _ => Ok(Ttf_Os2_FsType::Unknown(flag)),
        }
    }
}

impl From<&Ttf_Os2_FsType> for i64 {
    fn from(v: &Ttf_Os2_FsType) -> Self {
        match *v {
            Ttf_Os2_FsType::RestrictedLicenseEmbedding => 2,
            Ttf_Os2_FsType::PreviewAndPrintEmbedding => 4,
            Ttf_Os2_FsType::EditableEmbedding => 8,
            Ttf_Os2_FsType::Unknown(v) => v
        }
    }
}

impl Default for Ttf_Os2_FsType {
    fn default() -> Self { Ttf_Os2_FsType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Ttf_Os2_WeightClass {
    Thin,
    ExtraLight,
    Light,
    Normal,
    Medium,
    SemiBold,
    Bold,
    ExtraBold,
    Black,
    Unknown(i64),
}

impl TryFrom<i64> for Ttf_Os2_WeightClass {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ttf_Os2_WeightClass> {
        match flag {
            100 => Ok(Ttf_Os2_WeightClass::Thin),
            200 => Ok(Ttf_Os2_WeightClass::ExtraLight),
            300 => Ok(Ttf_Os2_WeightClass::Light),
            400 => Ok(Ttf_Os2_WeightClass::Normal),
            500 => Ok(Ttf_Os2_WeightClass::Medium),
            600 => Ok(Ttf_Os2_WeightClass::SemiBold),
            700 => Ok(Ttf_Os2_WeightClass::Bold),
            800 => Ok(Ttf_Os2_WeightClass::ExtraBold),
            900 => Ok(Ttf_Os2_WeightClass::Black),
            _ => Ok(Ttf_Os2_WeightClass::Unknown(flag)),
        }
    }
}

impl From<&Ttf_Os2_WeightClass> for i64 {
    fn from(v: &Ttf_Os2_WeightClass) -> Self {
        match *v {
            Ttf_Os2_WeightClass::Thin => 100,
            Ttf_Os2_WeightClass::ExtraLight => 200,
            Ttf_Os2_WeightClass::Light => 300,
            Ttf_Os2_WeightClass::Normal => 400,
            Ttf_Os2_WeightClass::Medium => 500,
            Ttf_Os2_WeightClass::SemiBold => 600,
            Ttf_Os2_WeightClass::Bold => 700,
            Ttf_Os2_WeightClass::ExtraBold => 800,
            Ttf_Os2_WeightClass::Black => 900,
            Ttf_Os2_WeightClass::Unknown(v) => v
        }
    }
}

impl Default for Ttf_Os2_WeightClass {
    fn default() -> Self { Ttf_Os2_WeightClass::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Ttf_Os2_WidthClass {
    UltraCondensed,
    ExtraCondensed,
    Condensed,
    SemiCondensed,
    Normal,
    SemiExpanded,
    Expanded,
    ExtraExpanded,
    UltraExpanded,
    Unknown(i64),
}

impl TryFrom<i64> for Ttf_Os2_WidthClass {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ttf_Os2_WidthClass> {
        match flag {
            1 => Ok(Ttf_Os2_WidthClass::UltraCondensed),
            2 => Ok(Ttf_Os2_WidthClass::ExtraCondensed),
            3 => Ok(Ttf_Os2_WidthClass::Condensed),
            4 => Ok(Ttf_Os2_WidthClass::SemiCondensed),
            5 => Ok(Ttf_Os2_WidthClass::Normal),
            6 => Ok(Ttf_Os2_WidthClass::SemiExpanded),
            7 => Ok(Ttf_Os2_WidthClass::Expanded),
            8 => Ok(Ttf_Os2_WidthClass::ExtraExpanded),
            9 => Ok(Ttf_Os2_WidthClass::UltraExpanded),
            _ => Ok(Ttf_Os2_WidthClass::Unknown(flag)),
        }
    }
}

impl From<&Ttf_Os2_WidthClass> for i64 {
    fn from(v: &Ttf_Os2_WidthClass) -> Self {
        match *v {
            Ttf_Os2_WidthClass::UltraCondensed => 1,
            Ttf_Os2_WidthClass::ExtraCondensed => 2,
            Ttf_Os2_WidthClass::Condensed => 3,
            Ttf_Os2_WidthClass::SemiCondensed => 4,
            Ttf_Os2_WidthClass::Normal => 5,
            Ttf_Os2_WidthClass::SemiExpanded => 6,
            Ttf_Os2_WidthClass::Expanded => 7,
            Ttf_Os2_WidthClass::ExtraExpanded => 8,
            Ttf_Os2_WidthClass::UltraExpanded => 9,
            Ttf_Os2_WidthClass::Unknown(v) => v
        }
    }
}

impl Default for Ttf_Os2_WidthClass {
    fn default() -> Self { Ttf_Os2_WidthClass::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Ttf_Os2_CodePageRange {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_Os2>,
    pub _self: SharedType<Self>,
    symbol_character_set: RefCell<bool>,
    oem_character_set: RefCell<bool>,
    macintosh_character_set: RefCell<bool>,
    reserved_for_alternate_ansi_oem: RefCell<u64>,
    cp1361_korean_johab: RefCell<bool>,
    cp950_chinese_traditional_chars_taiwan_and_hong_kong: RefCell<bool>,
    cp949_korean_wansung: RefCell<bool>,
    cp936_chinese_simplified_chars_prc_and_singapore: RefCell<bool>,
    cp932_jis_japan: RefCell<bool>,
    cp874_thai: RefCell<bool>,
    reserved_for_alternate_ansi: RefCell<u64>,
    cp1257_windows_baltic: RefCell<bool>,
    cp1256_arabic: RefCell<bool>,
    cp1255_hebrew: RefCell<bool>,
    cp1254_turkish: RefCell<bool>,
    cp1253_greek: RefCell<bool>,
    cp1251_cyrillic: RefCell<bool>,
    cp1250_latin_2_eastern_europe: RefCell<bool>,
    cp1252_latin_1: RefCell<bool>,
    cp437_us: RefCell<bool>,
    cp850_we_latin_1: RefCell<bool>,
    cp708_arabic_asmo_708: RefCell<bool>,
    cp737_greek_former_437_g: RefCell<bool>,
    cp775_ms_dos_baltic: RefCell<bool>,
    cp852_latin_2: RefCell<bool>,
    cp855_ibm_cyrillic_primarily_russian: RefCell<bool>,
    cp857_ibm_turkish: RefCell<bool>,
    cp860_ms_dos_portuguese: RefCell<bool>,
    cp861_ms_dos_icelandic: RefCell<bool>,
    cp862_hebrew: RefCell<bool>,
    cp863_ms_dos_canadian_french: RefCell<bool>,
    cp864_arabic: RefCell<bool>,
    cp865_ms_dos_nordic: RefCell<bool>,
    cp866_ms_dos_russian: RefCell<bool>,
    cp869_ibm_greek: RefCell<bool>,
    reserved_for_oem: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_Os2_CodePageRange {
    type Root = Ttf;
    type Parent = Ttf_Os2;

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
        *self_rc.symbol_character_set.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.oem_character_set.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.macintosh_character_set.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.reserved_for_alternate_ansi_oem.borrow_mut() = _io.read_bits_int_be(7)?;
        *self_rc.cp1361_korean_johab.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp950_chinese_traditional_chars_taiwan_and_hong_kong.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp949_korean_wansung.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp936_chinese_simplified_chars_prc_and_singapore.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp932_jis_japan.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp874_thai.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.reserved_for_alternate_ansi.borrow_mut() = _io.read_bits_int_be(8)?;
        *self_rc.cp1257_windows_baltic.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp1256_arabic.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp1255_hebrew.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp1254_turkish.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp1253_greek.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp1251_cyrillic.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp1250_latin_2_eastern_europe.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp1252_latin_1.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp437_us.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp850_we_latin_1.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp708_arabic_asmo_708.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp737_greek_former_437_g.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp775_ms_dos_baltic.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp852_latin_2.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp855_ibm_cyrillic_primarily_russian.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp857_ibm_turkish.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp860_ms_dos_portuguese.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp861_ms_dos_icelandic.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp862_hebrew.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp863_ms_dos_canadian_french.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp864_arabic.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp865_ms_dos_nordic.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp866_ms_dos_russian.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cp869_ibm_greek.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.reserved_for_oem.borrow_mut() = _io.read_bits_int_be(16)?;
        Ok(())
    }
}
impl Ttf_Os2_CodePageRange {
}
impl Ttf_Os2_CodePageRange {
    pub fn symbol_character_set(&self) -> Ref<'_, bool> {
        self.symbol_character_set.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn oem_character_set(&self) -> Ref<'_, bool> {
        self.oem_character_set.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn macintosh_character_set(&self) -> Ref<'_, bool> {
        self.macintosh_character_set.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn reserved_for_alternate_ansi_oem(&self) -> Ref<'_, u64> {
        self.reserved_for_alternate_ansi_oem.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp1361_korean_johab(&self) -> Ref<'_, bool> {
        self.cp1361_korean_johab.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp950_chinese_traditional_chars_taiwan_and_hong_kong(&self) -> Ref<'_, bool> {
        self.cp950_chinese_traditional_chars_taiwan_and_hong_kong.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp949_korean_wansung(&self) -> Ref<'_, bool> {
        self.cp949_korean_wansung.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp936_chinese_simplified_chars_prc_and_singapore(&self) -> Ref<'_, bool> {
        self.cp936_chinese_simplified_chars_prc_and_singapore.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp932_jis_japan(&self) -> Ref<'_, bool> {
        self.cp932_jis_japan.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp874_thai(&self) -> Ref<'_, bool> {
        self.cp874_thai.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn reserved_for_alternate_ansi(&self) -> Ref<'_, u64> {
        self.reserved_for_alternate_ansi.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp1257_windows_baltic(&self) -> Ref<'_, bool> {
        self.cp1257_windows_baltic.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp1256_arabic(&self) -> Ref<'_, bool> {
        self.cp1256_arabic.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp1255_hebrew(&self) -> Ref<'_, bool> {
        self.cp1255_hebrew.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp1254_turkish(&self) -> Ref<'_, bool> {
        self.cp1254_turkish.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp1253_greek(&self) -> Ref<'_, bool> {
        self.cp1253_greek.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp1251_cyrillic(&self) -> Ref<'_, bool> {
        self.cp1251_cyrillic.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp1250_latin_2_eastern_europe(&self) -> Ref<'_, bool> {
        self.cp1250_latin_2_eastern_europe.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp1252_latin_1(&self) -> Ref<'_, bool> {
        self.cp1252_latin_1.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp437_us(&self) -> Ref<'_, bool> {
        self.cp437_us.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp850_we_latin_1(&self) -> Ref<'_, bool> {
        self.cp850_we_latin_1.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp708_arabic_asmo_708(&self) -> Ref<'_, bool> {
        self.cp708_arabic_asmo_708.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp737_greek_former_437_g(&self) -> Ref<'_, bool> {
        self.cp737_greek_former_437_g.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp775_ms_dos_baltic(&self) -> Ref<'_, bool> {
        self.cp775_ms_dos_baltic.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp852_latin_2(&self) -> Ref<'_, bool> {
        self.cp852_latin_2.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp855_ibm_cyrillic_primarily_russian(&self) -> Ref<'_, bool> {
        self.cp855_ibm_cyrillic_primarily_russian.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp857_ibm_turkish(&self) -> Ref<'_, bool> {
        self.cp857_ibm_turkish.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp860_ms_dos_portuguese(&self) -> Ref<'_, bool> {
        self.cp860_ms_dos_portuguese.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp861_ms_dos_icelandic(&self) -> Ref<'_, bool> {
        self.cp861_ms_dos_icelandic.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp862_hebrew(&self) -> Ref<'_, bool> {
        self.cp862_hebrew.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp863_ms_dos_canadian_french(&self) -> Ref<'_, bool> {
        self.cp863_ms_dos_canadian_french.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp864_arabic(&self) -> Ref<'_, bool> {
        self.cp864_arabic.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp865_ms_dos_nordic(&self) -> Ref<'_, bool> {
        self.cp865_ms_dos_nordic.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp866_ms_dos_russian(&self) -> Ref<'_, bool> {
        self.cp866_ms_dos_russian.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn cp869_ibm_greek(&self) -> Ref<'_, bool> {
        self.cp869_ibm_greek.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn reserved_for_oem(&self) -> Ref<'_, u64> {
        self.reserved_for_oem.borrow()
    }
}
impl Ttf_Os2_CodePageRange {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ttf_Os2_Panose {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_Os2>,
    pub _self: SharedType<Self>,
    family_type: RefCell<Ttf_Os2_Panose_FamilyKind>,
    serif_style: RefCell<Ttf_Os2_Panose_SerifStyle>,
    weight: RefCell<Ttf_Os2_Panose_Weight>,
    proportion: RefCell<Ttf_Os2_Panose_Proportion>,
    contrast: RefCell<Ttf_Os2_Panose_Contrast>,
    stroke_variation: RefCell<Ttf_Os2_Panose_StrokeVariation>,
    arm_style: RefCell<Ttf_Os2_Panose_ArmStyle>,
    letter_form: RefCell<Ttf_Os2_Panose_LetterForm>,
    midline: RefCell<Ttf_Os2_Panose_Midline>,
    x_height: RefCell<Ttf_Os2_Panose_XHeight>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_Os2_Panose {
    type Root = Ttf;
    type Parent = Ttf_Os2;

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
        *self_rc.family_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.serif_style.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.weight.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.proportion.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.contrast.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.stroke_variation.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.arm_style.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.letter_form.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.midline.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.x_height.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        Ok(())
    }
}
impl Ttf_Os2_Panose {
}
impl Ttf_Os2_Panose {
    pub fn family_type(&self) -> Ref<'_, Ttf_Os2_Panose_FamilyKind> {
        self.family_type.borrow()
    }
}
impl Ttf_Os2_Panose {
    pub fn serif_style(&self) -> Ref<'_, Ttf_Os2_Panose_SerifStyle> {
        self.serif_style.borrow()
    }
}
impl Ttf_Os2_Panose {
    pub fn weight(&self) -> Ref<'_, Ttf_Os2_Panose_Weight> {
        self.weight.borrow()
    }
}
impl Ttf_Os2_Panose {
    pub fn proportion(&self) -> Ref<'_, Ttf_Os2_Panose_Proportion> {
        self.proportion.borrow()
    }
}
impl Ttf_Os2_Panose {
    pub fn contrast(&self) -> Ref<'_, Ttf_Os2_Panose_Contrast> {
        self.contrast.borrow()
    }
}
impl Ttf_Os2_Panose {
    pub fn stroke_variation(&self) -> Ref<'_, Ttf_Os2_Panose_StrokeVariation> {
        self.stroke_variation.borrow()
    }
}
impl Ttf_Os2_Panose {
    pub fn arm_style(&self) -> Ref<'_, Ttf_Os2_Panose_ArmStyle> {
        self.arm_style.borrow()
    }
}
impl Ttf_Os2_Panose {
    pub fn letter_form(&self) -> Ref<'_, Ttf_Os2_Panose_LetterForm> {
        self.letter_form.borrow()
    }
}
impl Ttf_Os2_Panose {
    pub fn midline(&self) -> Ref<'_, Ttf_Os2_Panose_Midline> {
        self.midline.borrow()
    }
}
impl Ttf_Os2_Panose {
    pub fn x_height(&self) -> Ref<'_, Ttf_Os2_Panose_XHeight> {
        self.x_height.borrow()
    }
}
impl Ttf_Os2_Panose {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Ttf_Os2_Panose_ArmStyle {
    Any,
    NoFit,
    StraightArmsHorizontal,
    StraightArmsWedge,
    StraightArmsVertical,
    StraightArmsSingleSerif,
    StraightArmsDoubleSerif,
    NonStraightArmsHorizontal,
    NonStraightArmsWedge,
    NonStraightArmsVertical,
    NonStraightArmsSingleSerif,
    NonStraightArmsDoubleSerif,
    Unknown(i64),
}

impl TryFrom<i64> for Ttf_Os2_Panose_ArmStyle {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ttf_Os2_Panose_ArmStyle> {
        match flag {
            0 => Ok(Ttf_Os2_Panose_ArmStyle::Any),
            1 => Ok(Ttf_Os2_Panose_ArmStyle::NoFit),
            2 => Ok(Ttf_Os2_Panose_ArmStyle::StraightArmsHorizontal),
            3 => Ok(Ttf_Os2_Panose_ArmStyle::StraightArmsWedge),
            4 => Ok(Ttf_Os2_Panose_ArmStyle::StraightArmsVertical),
            5 => Ok(Ttf_Os2_Panose_ArmStyle::StraightArmsSingleSerif),
            6 => Ok(Ttf_Os2_Panose_ArmStyle::StraightArmsDoubleSerif),
            7 => Ok(Ttf_Os2_Panose_ArmStyle::NonStraightArmsHorizontal),
            8 => Ok(Ttf_Os2_Panose_ArmStyle::NonStraightArmsWedge),
            9 => Ok(Ttf_Os2_Panose_ArmStyle::NonStraightArmsVertical),
            10 => Ok(Ttf_Os2_Panose_ArmStyle::NonStraightArmsSingleSerif),
            11 => Ok(Ttf_Os2_Panose_ArmStyle::NonStraightArmsDoubleSerif),
            _ => Ok(Ttf_Os2_Panose_ArmStyle::Unknown(flag)),
        }
    }
}

impl From<&Ttf_Os2_Panose_ArmStyle> for i64 {
    fn from(v: &Ttf_Os2_Panose_ArmStyle) -> Self {
        match *v {
            Ttf_Os2_Panose_ArmStyle::Any => 0,
            Ttf_Os2_Panose_ArmStyle::NoFit => 1,
            Ttf_Os2_Panose_ArmStyle::StraightArmsHorizontal => 2,
            Ttf_Os2_Panose_ArmStyle::StraightArmsWedge => 3,
            Ttf_Os2_Panose_ArmStyle::StraightArmsVertical => 4,
            Ttf_Os2_Panose_ArmStyle::StraightArmsSingleSerif => 5,
            Ttf_Os2_Panose_ArmStyle::StraightArmsDoubleSerif => 6,
            Ttf_Os2_Panose_ArmStyle::NonStraightArmsHorizontal => 7,
            Ttf_Os2_Panose_ArmStyle::NonStraightArmsWedge => 8,
            Ttf_Os2_Panose_ArmStyle::NonStraightArmsVertical => 9,
            Ttf_Os2_Panose_ArmStyle::NonStraightArmsSingleSerif => 10,
            Ttf_Os2_Panose_ArmStyle::NonStraightArmsDoubleSerif => 11,
            Ttf_Os2_Panose_ArmStyle::Unknown(v) => v
        }
    }
}

impl Default for Ttf_Os2_Panose_ArmStyle {
    fn default() -> Self { Ttf_Os2_Panose_ArmStyle::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Ttf_Os2_Panose_Contrast {
    Any,
    NoFit,
    None,
    VeryLow,
    Low,
    MediumLow,
    Medium,
    MediumHigh,
    High,
    VeryHigh,
    Unknown(i64),
}

impl TryFrom<i64> for Ttf_Os2_Panose_Contrast {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ttf_Os2_Panose_Contrast> {
        match flag {
            0 => Ok(Ttf_Os2_Panose_Contrast::Any),
            1 => Ok(Ttf_Os2_Panose_Contrast::NoFit),
            2 => Ok(Ttf_Os2_Panose_Contrast::None),
            3 => Ok(Ttf_Os2_Panose_Contrast::VeryLow),
            4 => Ok(Ttf_Os2_Panose_Contrast::Low),
            5 => Ok(Ttf_Os2_Panose_Contrast::MediumLow),
            6 => Ok(Ttf_Os2_Panose_Contrast::Medium),
            7 => Ok(Ttf_Os2_Panose_Contrast::MediumHigh),
            8 => Ok(Ttf_Os2_Panose_Contrast::High),
            9 => Ok(Ttf_Os2_Panose_Contrast::VeryHigh),
            _ => Ok(Ttf_Os2_Panose_Contrast::Unknown(flag)),
        }
    }
}

impl From<&Ttf_Os2_Panose_Contrast> for i64 {
    fn from(v: &Ttf_Os2_Panose_Contrast) -> Self {
        match *v {
            Ttf_Os2_Panose_Contrast::Any => 0,
            Ttf_Os2_Panose_Contrast::NoFit => 1,
            Ttf_Os2_Panose_Contrast::None => 2,
            Ttf_Os2_Panose_Contrast::VeryLow => 3,
            Ttf_Os2_Panose_Contrast::Low => 4,
            Ttf_Os2_Panose_Contrast::MediumLow => 5,
            Ttf_Os2_Panose_Contrast::Medium => 6,
            Ttf_Os2_Panose_Contrast::MediumHigh => 7,
            Ttf_Os2_Panose_Contrast::High => 8,
            Ttf_Os2_Panose_Contrast::VeryHigh => 9,
            Ttf_Os2_Panose_Contrast::Unknown(v) => v
        }
    }
}

impl Default for Ttf_Os2_Panose_Contrast {
    fn default() -> Self { Ttf_Os2_Panose_Contrast::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Ttf_Os2_Panose_FamilyKind {
    Any,
    NoFit,
    TextAndDisplay,
    Script,
    Decorative,
    Pictorial,
    Unknown(i64),
}

impl TryFrom<i64> for Ttf_Os2_Panose_FamilyKind {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ttf_Os2_Panose_FamilyKind> {
        match flag {
            0 => Ok(Ttf_Os2_Panose_FamilyKind::Any),
            1 => Ok(Ttf_Os2_Panose_FamilyKind::NoFit),
            2 => Ok(Ttf_Os2_Panose_FamilyKind::TextAndDisplay),
            3 => Ok(Ttf_Os2_Panose_FamilyKind::Script),
            4 => Ok(Ttf_Os2_Panose_FamilyKind::Decorative),
            5 => Ok(Ttf_Os2_Panose_FamilyKind::Pictorial),
            _ => Ok(Ttf_Os2_Panose_FamilyKind::Unknown(flag)),
        }
    }
}

impl From<&Ttf_Os2_Panose_FamilyKind> for i64 {
    fn from(v: &Ttf_Os2_Panose_FamilyKind) -> Self {
        match *v {
            Ttf_Os2_Panose_FamilyKind::Any => 0,
            Ttf_Os2_Panose_FamilyKind::NoFit => 1,
            Ttf_Os2_Panose_FamilyKind::TextAndDisplay => 2,
            Ttf_Os2_Panose_FamilyKind::Script => 3,
            Ttf_Os2_Panose_FamilyKind::Decorative => 4,
            Ttf_Os2_Panose_FamilyKind::Pictorial => 5,
            Ttf_Os2_Panose_FamilyKind::Unknown(v) => v
        }
    }
}

impl Default for Ttf_Os2_Panose_FamilyKind {
    fn default() -> Self { Ttf_Os2_Panose_FamilyKind::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Ttf_Os2_Panose_LetterForm {
    Any,
    NoFit,
    NormalContact,
    NormalWeighted,
    NormalBoxed,
    NormalFlattened,
    NormalRounded,
    NormalOffCenter,
    NormalSquare,
    ObliqueContact,
    ObliqueWeighted,
    ObliqueBoxed,
    ObliqueFlattened,
    ObliqueRounded,
    ObliqueOffCenter,
    ObliqueSquare,
    Unknown(i64),
}

impl TryFrom<i64> for Ttf_Os2_Panose_LetterForm {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ttf_Os2_Panose_LetterForm> {
        match flag {
            0 => Ok(Ttf_Os2_Panose_LetterForm::Any),
            1 => Ok(Ttf_Os2_Panose_LetterForm::NoFit),
            2 => Ok(Ttf_Os2_Panose_LetterForm::NormalContact),
            3 => Ok(Ttf_Os2_Panose_LetterForm::NormalWeighted),
            4 => Ok(Ttf_Os2_Panose_LetterForm::NormalBoxed),
            5 => Ok(Ttf_Os2_Panose_LetterForm::NormalFlattened),
            6 => Ok(Ttf_Os2_Panose_LetterForm::NormalRounded),
            7 => Ok(Ttf_Os2_Panose_LetterForm::NormalOffCenter),
            8 => Ok(Ttf_Os2_Panose_LetterForm::NormalSquare),
            9 => Ok(Ttf_Os2_Panose_LetterForm::ObliqueContact),
            10 => Ok(Ttf_Os2_Panose_LetterForm::ObliqueWeighted),
            11 => Ok(Ttf_Os2_Panose_LetterForm::ObliqueBoxed),
            12 => Ok(Ttf_Os2_Panose_LetterForm::ObliqueFlattened),
            13 => Ok(Ttf_Os2_Panose_LetterForm::ObliqueRounded),
            14 => Ok(Ttf_Os2_Panose_LetterForm::ObliqueOffCenter),
            15 => Ok(Ttf_Os2_Panose_LetterForm::ObliqueSquare),
            _ => Ok(Ttf_Os2_Panose_LetterForm::Unknown(flag)),
        }
    }
}

impl From<&Ttf_Os2_Panose_LetterForm> for i64 {
    fn from(v: &Ttf_Os2_Panose_LetterForm) -> Self {
        match *v {
            Ttf_Os2_Panose_LetterForm::Any => 0,
            Ttf_Os2_Panose_LetterForm::NoFit => 1,
            Ttf_Os2_Panose_LetterForm::NormalContact => 2,
            Ttf_Os2_Panose_LetterForm::NormalWeighted => 3,
            Ttf_Os2_Panose_LetterForm::NormalBoxed => 4,
            Ttf_Os2_Panose_LetterForm::NormalFlattened => 5,
            Ttf_Os2_Panose_LetterForm::NormalRounded => 6,
            Ttf_Os2_Panose_LetterForm::NormalOffCenter => 7,
            Ttf_Os2_Panose_LetterForm::NormalSquare => 8,
            Ttf_Os2_Panose_LetterForm::ObliqueContact => 9,
            Ttf_Os2_Panose_LetterForm::ObliqueWeighted => 10,
            Ttf_Os2_Panose_LetterForm::ObliqueBoxed => 11,
            Ttf_Os2_Panose_LetterForm::ObliqueFlattened => 12,
            Ttf_Os2_Panose_LetterForm::ObliqueRounded => 13,
            Ttf_Os2_Panose_LetterForm::ObliqueOffCenter => 14,
            Ttf_Os2_Panose_LetterForm::ObliqueSquare => 15,
            Ttf_Os2_Panose_LetterForm::Unknown(v) => v
        }
    }
}

impl Default for Ttf_Os2_Panose_LetterForm {
    fn default() -> Self { Ttf_Os2_Panose_LetterForm::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Ttf_Os2_Panose_Midline {
    Any,
    NoFit,
    StandardTrimmed,
    StandardPointed,
    StandardSerifed,
    HighTrimmed,
    HighPointed,
    HighSerifed,
    ConstantTrimmed,
    ConstantPointed,
    ConstantSerifed,
    LowTrimmed,
    LowPointed,
    LowSerifed,
    Unknown(i64),
}

impl TryFrom<i64> for Ttf_Os2_Panose_Midline {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ttf_Os2_Panose_Midline> {
        match flag {
            0 => Ok(Ttf_Os2_Panose_Midline::Any),
            1 => Ok(Ttf_Os2_Panose_Midline::NoFit),
            2 => Ok(Ttf_Os2_Panose_Midline::StandardTrimmed),
            3 => Ok(Ttf_Os2_Panose_Midline::StandardPointed),
            4 => Ok(Ttf_Os2_Panose_Midline::StandardSerifed),
            5 => Ok(Ttf_Os2_Panose_Midline::HighTrimmed),
            6 => Ok(Ttf_Os2_Panose_Midline::HighPointed),
            7 => Ok(Ttf_Os2_Panose_Midline::HighSerifed),
            8 => Ok(Ttf_Os2_Panose_Midline::ConstantTrimmed),
            9 => Ok(Ttf_Os2_Panose_Midline::ConstantPointed),
            10 => Ok(Ttf_Os2_Panose_Midline::ConstantSerifed),
            11 => Ok(Ttf_Os2_Panose_Midline::LowTrimmed),
            12 => Ok(Ttf_Os2_Panose_Midline::LowPointed),
            13 => Ok(Ttf_Os2_Panose_Midline::LowSerifed),
            _ => Ok(Ttf_Os2_Panose_Midline::Unknown(flag)),
        }
    }
}

impl From<&Ttf_Os2_Panose_Midline> for i64 {
    fn from(v: &Ttf_Os2_Panose_Midline) -> Self {
        match *v {
            Ttf_Os2_Panose_Midline::Any => 0,
            Ttf_Os2_Panose_Midline::NoFit => 1,
            Ttf_Os2_Panose_Midline::StandardTrimmed => 2,
            Ttf_Os2_Panose_Midline::StandardPointed => 3,
            Ttf_Os2_Panose_Midline::StandardSerifed => 4,
            Ttf_Os2_Panose_Midline::HighTrimmed => 5,
            Ttf_Os2_Panose_Midline::HighPointed => 6,
            Ttf_Os2_Panose_Midline::HighSerifed => 7,
            Ttf_Os2_Panose_Midline::ConstantTrimmed => 8,
            Ttf_Os2_Panose_Midline::ConstantPointed => 9,
            Ttf_Os2_Panose_Midline::ConstantSerifed => 10,
            Ttf_Os2_Panose_Midline::LowTrimmed => 11,
            Ttf_Os2_Panose_Midline::LowPointed => 12,
            Ttf_Os2_Panose_Midline::LowSerifed => 13,
            Ttf_Os2_Panose_Midline::Unknown(v) => v
        }
    }
}

impl Default for Ttf_Os2_Panose_Midline {
    fn default() -> Self { Ttf_Os2_Panose_Midline::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Ttf_Os2_Panose_Proportion {
    Any,
    NoFit,
    OldStyle,
    Modern,
    EvenWidth,
    Expanded,
    Condensed,
    VeryExpanded,
    VeryCondensed,
    Monospaced,
    Unknown(i64),
}

impl TryFrom<i64> for Ttf_Os2_Panose_Proportion {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ttf_Os2_Panose_Proportion> {
        match flag {
            0 => Ok(Ttf_Os2_Panose_Proportion::Any),
            1 => Ok(Ttf_Os2_Panose_Proportion::NoFit),
            2 => Ok(Ttf_Os2_Panose_Proportion::OldStyle),
            3 => Ok(Ttf_Os2_Panose_Proportion::Modern),
            4 => Ok(Ttf_Os2_Panose_Proportion::EvenWidth),
            5 => Ok(Ttf_Os2_Panose_Proportion::Expanded),
            6 => Ok(Ttf_Os2_Panose_Proportion::Condensed),
            7 => Ok(Ttf_Os2_Panose_Proportion::VeryExpanded),
            8 => Ok(Ttf_Os2_Panose_Proportion::VeryCondensed),
            9 => Ok(Ttf_Os2_Panose_Proportion::Monospaced),
            _ => Ok(Ttf_Os2_Panose_Proportion::Unknown(flag)),
        }
    }
}

impl From<&Ttf_Os2_Panose_Proportion> for i64 {
    fn from(v: &Ttf_Os2_Panose_Proportion) -> Self {
        match *v {
            Ttf_Os2_Panose_Proportion::Any => 0,
            Ttf_Os2_Panose_Proportion::NoFit => 1,
            Ttf_Os2_Panose_Proportion::OldStyle => 2,
            Ttf_Os2_Panose_Proportion::Modern => 3,
            Ttf_Os2_Panose_Proportion::EvenWidth => 4,
            Ttf_Os2_Panose_Proportion::Expanded => 5,
            Ttf_Os2_Panose_Proportion::Condensed => 6,
            Ttf_Os2_Panose_Proportion::VeryExpanded => 7,
            Ttf_Os2_Panose_Proportion::VeryCondensed => 8,
            Ttf_Os2_Panose_Proportion::Monospaced => 9,
            Ttf_Os2_Panose_Proportion::Unknown(v) => v
        }
    }
}

impl Default for Ttf_Os2_Panose_Proportion {
    fn default() -> Self { Ttf_Os2_Panose_Proportion::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Ttf_Os2_Panose_SerifStyle {
    Any,
    NoFit,
    Cove,
    ObtuseCove,
    SquareCove,
    ObtuseSquareCove,
    Square,
    Thin,
    Bone,
    Exaggerated,
    Triangle,
    NormalSans,
    ObtuseSans,
    PerpSans,
    Flared,
    Rounded,
    Unknown(i64),
}

impl TryFrom<i64> for Ttf_Os2_Panose_SerifStyle {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ttf_Os2_Panose_SerifStyle> {
        match flag {
            0 => Ok(Ttf_Os2_Panose_SerifStyle::Any),
            1 => Ok(Ttf_Os2_Panose_SerifStyle::NoFit),
            2 => Ok(Ttf_Os2_Panose_SerifStyle::Cove),
            3 => Ok(Ttf_Os2_Panose_SerifStyle::ObtuseCove),
            4 => Ok(Ttf_Os2_Panose_SerifStyle::SquareCove),
            5 => Ok(Ttf_Os2_Panose_SerifStyle::ObtuseSquareCove),
            6 => Ok(Ttf_Os2_Panose_SerifStyle::Square),
            7 => Ok(Ttf_Os2_Panose_SerifStyle::Thin),
            8 => Ok(Ttf_Os2_Panose_SerifStyle::Bone),
            9 => Ok(Ttf_Os2_Panose_SerifStyle::Exaggerated),
            10 => Ok(Ttf_Os2_Panose_SerifStyle::Triangle),
            11 => Ok(Ttf_Os2_Panose_SerifStyle::NormalSans),
            12 => Ok(Ttf_Os2_Panose_SerifStyle::ObtuseSans),
            13 => Ok(Ttf_Os2_Panose_SerifStyle::PerpSans),
            14 => Ok(Ttf_Os2_Panose_SerifStyle::Flared),
            15 => Ok(Ttf_Os2_Panose_SerifStyle::Rounded),
            _ => Ok(Ttf_Os2_Panose_SerifStyle::Unknown(flag)),
        }
    }
}

impl From<&Ttf_Os2_Panose_SerifStyle> for i64 {
    fn from(v: &Ttf_Os2_Panose_SerifStyle) -> Self {
        match *v {
            Ttf_Os2_Panose_SerifStyle::Any => 0,
            Ttf_Os2_Panose_SerifStyle::NoFit => 1,
            Ttf_Os2_Panose_SerifStyle::Cove => 2,
            Ttf_Os2_Panose_SerifStyle::ObtuseCove => 3,
            Ttf_Os2_Panose_SerifStyle::SquareCove => 4,
            Ttf_Os2_Panose_SerifStyle::ObtuseSquareCove => 5,
            Ttf_Os2_Panose_SerifStyle::Square => 6,
            Ttf_Os2_Panose_SerifStyle::Thin => 7,
            Ttf_Os2_Panose_SerifStyle::Bone => 8,
            Ttf_Os2_Panose_SerifStyle::Exaggerated => 9,
            Ttf_Os2_Panose_SerifStyle::Triangle => 10,
            Ttf_Os2_Panose_SerifStyle::NormalSans => 11,
            Ttf_Os2_Panose_SerifStyle::ObtuseSans => 12,
            Ttf_Os2_Panose_SerifStyle::PerpSans => 13,
            Ttf_Os2_Panose_SerifStyle::Flared => 14,
            Ttf_Os2_Panose_SerifStyle::Rounded => 15,
            Ttf_Os2_Panose_SerifStyle::Unknown(v) => v
        }
    }
}

impl Default for Ttf_Os2_Panose_SerifStyle {
    fn default() -> Self { Ttf_Os2_Panose_SerifStyle::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Ttf_Os2_Panose_StrokeVariation {
    Any,
    NoFit,
    GradualDiagonal,
    GradualTransitional,
    GradualVertical,
    GradualHorizontal,
    RapidVertical,
    RapidHorizontal,
    InstantVertical,
    Unknown(i64),
}

impl TryFrom<i64> for Ttf_Os2_Panose_StrokeVariation {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ttf_Os2_Panose_StrokeVariation> {
        match flag {
            0 => Ok(Ttf_Os2_Panose_StrokeVariation::Any),
            1 => Ok(Ttf_Os2_Panose_StrokeVariation::NoFit),
            2 => Ok(Ttf_Os2_Panose_StrokeVariation::GradualDiagonal),
            3 => Ok(Ttf_Os2_Panose_StrokeVariation::GradualTransitional),
            4 => Ok(Ttf_Os2_Panose_StrokeVariation::GradualVertical),
            5 => Ok(Ttf_Os2_Panose_StrokeVariation::GradualHorizontal),
            6 => Ok(Ttf_Os2_Panose_StrokeVariation::RapidVertical),
            7 => Ok(Ttf_Os2_Panose_StrokeVariation::RapidHorizontal),
            8 => Ok(Ttf_Os2_Panose_StrokeVariation::InstantVertical),
            _ => Ok(Ttf_Os2_Panose_StrokeVariation::Unknown(flag)),
        }
    }
}

impl From<&Ttf_Os2_Panose_StrokeVariation> for i64 {
    fn from(v: &Ttf_Os2_Panose_StrokeVariation) -> Self {
        match *v {
            Ttf_Os2_Panose_StrokeVariation::Any => 0,
            Ttf_Os2_Panose_StrokeVariation::NoFit => 1,
            Ttf_Os2_Panose_StrokeVariation::GradualDiagonal => 2,
            Ttf_Os2_Panose_StrokeVariation::GradualTransitional => 3,
            Ttf_Os2_Panose_StrokeVariation::GradualVertical => 4,
            Ttf_Os2_Panose_StrokeVariation::GradualHorizontal => 5,
            Ttf_Os2_Panose_StrokeVariation::RapidVertical => 6,
            Ttf_Os2_Panose_StrokeVariation::RapidHorizontal => 7,
            Ttf_Os2_Panose_StrokeVariation::InstantVertical => 8,
            Ttf_Os2_Panose_StrokeVariation::Unknown(v) => v
        }
    }
}

impl Default for Ttf_Os2_Panose_StrokeVariation {
    fn default() -> Self { Ttf_Os2_Panose_StrokeVariation::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Ttf_Os2_Panose_Weight {
    Any,
    NoFit,
    VeryLight,
    Light,
    Thin,
    Book,
    Medium,
    Demi,
    Bold,
    Heavy,
    Black,
    Nord,
    Unknown(i64),
}

impl TryFrom<i64> for Ttf_Os2_Panose_Weight {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ttf_Os2_Panose_Weight> {
        match flag {
            0 => Ok(Ttf_Os2_Panose_Weight::Any),
            1 => Ok(Ttf_Os2_Panose_Weight::NoFit),
            2 => Ok(Ttf_Os2_Panose_Weight::VeryLight),
            3 => Ok(Ttf_Os2_Panose_Weight::Light),
            4 => Ok(Ttf_Os2_Panose_Weight::Thin),
            5 => Ok(Ttf_Os2_Panose_Weight::Book),
            6 => Ok(Ttf_Os2_Panose_Weight::Medium),
            7 => Ok(Ttf_Os2_Panose_Weight::Demi),
            8 => Ok(Ttf_Os2_Panose_Weight::Bold),
            9 => Ok(Ttf_Os2_Panose_Weight::Heavy),
            10 => Ok(Ttf_Os2_Panose_Weight::Black),
            11 => Ok(Ttf_Os2_Panose_Weight::Nord),
            _ => Ok(Ttf_Os2_Panose_Weight::Unknown(flag)),
        }
    }
}

impl From<&Ttf_Os2_Panose_Weight> for i64 {
    fn from(v: &Ttf_Os2_Panose_Weight) -> Self {
        match *v {
            Ttf_Os2_Panose_Weight::Any => 0,
            Ttf_Os2_Panose_Weight::NoFit => 1,
            Ttf_Os2_Panose_Weight::VeryLight => 2,
            Ttf_Os2_Panose_Weight::Light => 3,
            Ttf_Os2_Panose_Weight::Thin => 4,
            Ttf_Os2_Panose_Weight::Book => 5,
            Ttf_Os2_Panose_Weight::Medium => 6,
            Ttf_Os2_Panose_Weight::Demi => 7,
            Ttf_Os2_Panose_Weight::Bold => 8,
            Ttf_Os2_Panose_Weight::Heavy => 9,
            Ttf_Os2_Panose_Weight::Black => 10,
            Ttf_Os2_Panose_Weight::Nord => 11,
            Ttf_Os2_Panose_Weight::Unknown(v) => v
        }
    }
}

impl Default for Ttf_Os2_Panose_Weight {
    fn default() -> Self { Ttf_Os2_Panose_Weight::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Ttf_Os2_Panose_XHeight {
    Any,
    NoFit,
    ConstantSmall,
    ConstantStandard,
    ConstantLarge,
    DuckingSmall,
    DuckingStandard,
    DuckingLarge,
    Unknown(i64),
}

impl TryFrom<i64> for Ttf_Os2_Panose_XHeight {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ttf_Os2_Panose_XHeight> {
        match flag {
            0 => Ok(Ttf_Os2_Panose_XHeight::Any),
            1 => Ok(Ttf_Os2_Panose_XHeight::NoFit),
            2 => Ok(Ttf_Os2_Panose_XHeight::ConstantSmall),
            3 => Ok(Ttf_Os2_Panose_XHeight::ConstantStandard),
            4 => Ok(Ttf_Os2_Panose_XHeight::ConstantLarge),
            5 => Ok(Ttf_Os2_Panose_XHeight::DuckingSmall),
            6 => Ok(Ttf_Os2_Panose_XHeight::DuckingStandard),
            7 => Ok(Ttf_Os2_Panose_XHeight::DuckingLarge),
            _ => Ok(Ttf_Os2_Panose_XHeight::Unknown(flag)),
        }
    }
}

impl From<&Ttf_Os2_Panose_XHeight> for i64 {
    fn from(v: &Ttf_Os2_Panose_XHeight) -> Self {
        match *v {
            Ttf_Os2_Panose_XHeight::Any => 0,
            Ttf_Os2_Panose_XHeight::NoFit => 1,
            Ttf_Os2_Panose_XHeight::ConstantSmall => 2,
            Ttf_Os2_Panose_XHeight::ConstantStandard => 3,
            Ttf_Os2_Panose_XHeight::ConstantLarge => 4,
            Ttf_Os2_Panose_XHeight::DuckingSmall => 5,
            Ttf_Os2_Panose_XHeight::DuckingStandard => 6,
            Ttf_Os2_Panose_XHeight::DuckingLarge => 7,
            Ttf_Os2_Panose_XHeight::Unknown(v) => v
        }
    }
}

impl Default for Ttf_Os2_Panose_XHeight {
    fn default() -> Self { Ttf_Os2_Panose_XHeight::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Ttf_Os2_UnicodeRange {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_Os2>,
    pub _self: SharedType<Self>,
    basic_latin: RefCell<bool>,
    latin_1_supplement: RefCell<bool>,
    latin_extended_a: RefCell<bool>,
    latin_extended_b: RefCell<bool>,
    ipa_extensions: RefCell<bool>,
    spacing_modifier_letters: RefCell<bool>,
    combining_diacritical_marks: RefCell<bool>,
    basic_greek: RefCell<bool>,
    greek_symbols_and_coptic: RefCell<bool>,
    cyrillic: RefCell<bool>,
    armenian: RefCell<bool>,
    basic_hebrew: RefCell<bool>,
    hebrew_extended: RefCell<bool>,
    basic_arabic: RefCell<bool>,
    arabic_extended: RefCell<bool>,
    devanagari: RefCell<bool>,
    bengali: RefCell<bool>,
    gurmukhi: RefCell<bool>,
    gujarati: RefCell<bool>,
    oriya: RefCell<bool>,
    tamil: RefCell<bool>,
    telugu: RefCell<bool>,
    kannada: RefCell<bool>,
    malayalam: RefCell<bool>,
    thai: RefCell<bool>,
    lao: RefCell<bool>,
    basic_georgian: RefCell<bool>,
    georgian_extended: RefCell<bool>,
    hangul_jamo: RefCell<bool>,
    latin_extended_additional: RefCell<bool>,
    greek_extended: RefCell<bool>,
    general_punctuation: RefCell<bool>,
    superscripts_and_subscripts: RefCell<bool>,
    currency_symbols: RefCell<bool>,
    combining_diacritical_marks_for_symbols: RefCell<bool>,
    letterlike_symbols: RefCell<bool>,
    number_forms: RefCell<bool>,
    arrows: RefCell<bool>,
    mathematical_operators: RefCell<bool>,
    miscellaneous_technical: RefCell<bool>,
    control_pictures: RefCell<bool>,
    optical_character_recognition: RefCell<bool>,
    enclosed_alphanumerics: RefCell<bool>,
    box_drawing: RefCell<bool>,
    block_elements: RefCell<bool>,
    geometric_shapes: RefCell<bool>,
    miscellaneous_symbols: RefCell<bool>,
    dingbats: RefCell<bool>,
    cjk_symbols_and_punctuation: RefCell<bool>,
    hiragana: RefCell<bool>,
    katakana: RefCell<bool>,
    bopomofo: RefCell<bool>,
    hangul_compatibility_jamo: RefCell<bool>,
    cjk_miscellaneous: RefCell<bool>,
    enclosed_cjk_letters_and_months: RefCell<bool>,
    cjk_compatibility: RefCell<bool>,
    hangul: RefCell<bool>,
    reserved_for_unicode_subranges1: RefCell<bool>,
    reserved_for_unicode_subranges2: RefCell<bool>,
    cjk_unified_ideographs: RefCell<bool>,
    private_use_area: RefCell<bool>,
    cjk_compatibility_ideographs: RefCell<bool>,
    alphabetic_presentation_forms: RefCell<bool>,
    arabic_presentation_forms_a: RefCell<bool>,
    combining_half_marks: RefCell<bool>,
    cjk_compatibility_forms: RefCell<bool>,
    small_form_variants: RefCell<bool>,
    arabic_presentation_forms_b: RefCell<bool>,
    halfwidth_and_fullwidth_forms: RefCell<bool>,
    specials: RefCell<bool>,
    reserved: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_Os2_UnicodeRange {
    type Root = Ttf;
    type Parent = Ttf_Os2;

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
        *self_rc.basic_latin.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.latin_1_supplement.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.latin_extended_a.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.latin_extended_b.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.ipa_extensions.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.spacing_modifier_letters.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.combining_diacritical_marks.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.basic_greek.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.greek_symbols_and_coptic.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cyrillic.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.armenian.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.basic_hebrew.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.hebrew_extended.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.basic_arabic.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.arabic_extended.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.devanagari.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.bengali.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.gurmukhi.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.gujarati.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.oriya.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.tamil.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.telugu.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.kannada.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.malayalam.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.thai.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.lao.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.basic_georgian.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.georgian_extended.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.hangul_jamo.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.latin_extended_additional.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.greek_extended.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.general_punctuation.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.superscripts_and_subscripts.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.currency_symbols.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.combining_diacritical_marks_for_symbols.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.letterlike_symbols.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.number_forms.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.arrows.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.mathematical_operators.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.miscellaneous_technical.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.control_pictures.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.optical_character_recognition.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.enclosed_alphanumerics.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.box_drawing.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.block_elements.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.geometric_shapes.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.miscellaneous_symbols.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.dingbats.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cjk_symbols_and_punctuation.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.hiragana.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.katakana.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.bopomofo.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.hangul_compatibility_jamo.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cjk_miscellaneous.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.enclosed_cjk_letters_and_months.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cjk_compatibility.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.hangul.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.reserved_for_unicode_subranges1.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.reserved_for_unicode_subranges2.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cjk_unified_ideographs.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.private_use_area.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cjk_compatibility_ideographs.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.alphabetic_presentation_forms.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.arabic_presentation_forms_a.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.combining_half_marks.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.cjk_compatibility_forms.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.small_form_variants.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.arabic_presentation_forms_b.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.halfwidth_and_fullwidth_forms.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.specials.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        _io.align_to_byte()?;
        *self_rc.reserved.borrow_mut() = _io.read_bytes(7 as usize)?.into();
        Ok(())
    }
}
impl Ttf_Os2_UnicodeRange {
}
impl Ttf_Os2_UnicodeRange {
    pub fn basic_latin(&self) -> Ref<'_, bool> {
        self.basic_latin.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn latin_1_supplement(&self) -> Ref<'_, bool> {
        self.latin_1_supplement.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn latin_extended_a(&self) -> Ref<'_, bool> {
        self.latin_extended_a.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn latin_extended_b(&self) -> Ref<'_, bool> {
        self.latin_extended_b.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn ipa_extensions(&self) -> Ref<'_, bool> {
        self.ipa_extensions.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn spacing_modifier_letters(&self) -> Ref<'_, bool> {
        self.spacing_modifier_letters.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn combining_diacritical_marks(&self) -> Ref<'_, bool> {
        self.combining_diacritical_marks.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn basic_greek(&self) -> Ref<'_, bool> {
        self.basic_greek.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn greek_symbols_and_coptic(&self) -> Ref<'_, bool> {
        self.greek_symbols_and_coptic.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn cyrillic(&self) -> Ref<'_, bool> {
        self.cyrillic.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn armenian(&self) -> Ref<'_, bool> {
        self.armenian.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn basic_hebrew(&self) -> Ref<'_, bool> {
        self.basic_hebrew.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn hebrew_extended(&self) -> Ref<'_, bool> {
        self.hebrew_extended.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn basic_arabic(&self) -> Ref<'_, bool> {
        self.basic_arabic.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn arabic_extended(&self) -> Ref<'_, bool> {
        self.arabic_extended.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn devanagari(&self) -> Ref<'_, bool> {
        self.devanagari.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn bengali(&self) -> Ref<'_, bool> {
        self.bengali.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn gurmukhi(&self) -> Ref<'_, bool> {
        self.gurmukhi.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn gujarati(&self) -> Ref<'_, bool> {
        self.gujarati.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn oriya(&self) -> Ref<'_, bool> {
        self.oriya.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn tamil(&self) -> Ref<'_, bool> {
        self.tamil.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn telugu(&self) -> Ref<'_, bool> {
        self.telugu.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn kannada(&self) -> Ref<'_, bool> {
        self.kannada.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn malayalam(&self) -> Ref<'_, bool> {
        self.malayalam.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn thai(&self) -> Ref<'_, bool> {
        self.thai.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn lao(&self) -> Ref<'_, bool> {
        self.lao.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn basic_georgian(&self) -> Ref<'_, bool> {
        self.basic_georgian.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn georgian_extended(&self) -> Ref<'_, bool> {
        self.georgian_extended.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn hangul_jamo(&self) -> Ref<'_, bool> {
        self.hangul_jamo.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn latin_extended_additional(&self) -> Ref<'_, bool> {
        self.latin_extended_additional.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn greek_extended(&self) -> Ref<'_, bool> {
        self.greek_extended.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn general_punctuation(&self) -> Ref<'_, bool> {
        self.general_punctuation.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn superscripts_and_subscripts(&self) -> Ref<'_, bool> {
        self.superscripts_and_subscripts.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn currency_symbols(&self) -> Ref<'_, bool> {
        self.currency_symbols.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn combining_diacritical_marks_for_symbols(&self) -> Ref<'_, bool> {
        self.combining_diacritical_marks_for_symbols.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn letterlike_symbols(&self) -> Ref<'_, bool> {
        self.letterlike_symbols.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn number_forms(&self) -> Ref<'_, bool> {
        self.number_forms.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn arrows(&self) -> Ref<'_, bool> {
        self.arrows.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn mathematical_operators(&self) -> Ref<'_, bool> {
        self.mathematical_operators.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn miscellaneous_technical(&self) -> Ref<'_, bool> {
        self.miscellaneous_technical.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn control_pictures(&self) -> Ref<'_, bool> {
        self.control_pictures.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn optical_character_recognition(&self) -> Ref<'_, bool> {
        self.optical_character_recognition.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn enclosed_alphanumerics(&self) -> Ref<'_, bool> {
        self.enclosed_alphanumerics.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn box_drawing(&self) -> Ref<'_, bool> {
        self.box_drawing.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn block_elements(&self) -> Ref<'_, bool> {
        self.block_elements.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn geometric_shapes(&self) -> Ref<'_, bool> {
        self.geometric_shapes.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn miscellaneous_symbols(&self) -> Ref<'_, bool> {
        self.miscellaneous_symbols.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn dingbats(&self) -> Ref<'_, bool> {
        self.dingbats.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn cjk_symbols_and_punctuation(&self) -> Ref<'_, bool> {
        self.cjk_symbols_and_punctuation.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn hiragana(&self) -> Ref<'_, bool> {
        self.hiragana.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn katakana(&self) -> Ref<'_, bool> {
        self.katakana.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn bopomofo(&self) -> Ref<'_, bool> {
        self.bopomofo.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn hangul_compatibility_jamo(&self) -> Ref<'_, bool> {
        self.hangul_compatibility_jamo.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn cjk_miscellaneous(&self) -> Ref<'_, bool> {
        self.cjk_miscellaneous.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn enclosed_cjk_letters_and_months(&self) -> Ref<'_, bool> {
        self.enclosed_cjk_letters_and_months.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn cjk_compatibility(&self) -> Ref<'_, bool> {
        self.cjk_compatibility.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn hangul(&self) -> Ref<'_, bool> {
        self.hangul.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn reserved_for_unicode_subranges1(&self) -> Ref<'_, bool> {
        self.reserved_for_unicode_subranges1.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn reserved_for_unicode_subranges2(&self) -> Ref<'_, bool> {
        self.reserved_for_unicode_subranges2.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn cjk_unified_ideographs(&self) -> Ref<'_, bool> {
        self.cjk_unified_ideographs.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn private_use_area(&self) -> Ref<'_, bool> {
        self.private_use_area.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn cjk_compatibility_ideographs(&self) -> Ref<'_, bool> {
        self.cjk_compatibility_ideographs.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn alphabetic_presentation_forms(&self) -> Ref<'_, bool> {
        self.alphabetic_presentation_forms.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn arabic_presentation_forms_a(&self) -> Ref<'_, bool> {
        self.arabic_presentation_forms_a.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn combining_half_marks(&self) -> Ref<'_, bool> {
        self.combining_half_marks.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn cjk_compatibility_forms(&self) -> Ref<'_, bool> {
        self.cjk_compatibility_forms.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn small_form_variants(&self) -> Ref<'_, bool> {
        self.small_form_variants.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn arabic_presentation_forms_b(&self) -> Ref<'_, bool> {
        self.arabic_presentation_forms_b.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn halfwidth_and_fullwidth_forms(&self) -> Ref<'_, bool> {
        self.halfwidth_and_fullwidth_forms.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn specials(&self) -> Ref<'_, bool> {
        self.specials.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Ttf_Os2_UnicodeRange {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ttf_Post {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_DirTableEntry>,
    pub _self: SharedType<Self>,
    format: RefCell<OptRc<Ttf_Fixed>>,
    italic_angle: RefCell<OptRc<Ttf_Fixed>>,
    underline_position: RefCell<i16>,
    underline_thichness: RefCell<i16>,
    is_fixed_pitch: RefCell<u32>,
    min_mem_type42: RefCell<u32>,
    max_mem_type42: RefCell<u32>,
    min_mem_type1: RefCell<u32>,
    max_mem_type1: RefCell<u32>,
    format20: RefCell<OptRc<Ttf_Post_Format20>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_Post {
    type Root = Ttf;
    type Parent = Ttf_DirTableEntry;

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
        let t = Self::read_into::<_, Ttf_Fixed>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.format.borrow_mut() = t;
        let t = Self::read_into::<_, Ttf_Fixed>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.italic_angle.borrow_mut() = t;
        *self_rc.underline_position.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.underline_thichness.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.is_fixed_pitch.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.min_mem_type42.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.max_mem_type42.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.min_mem_type1.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.max_mem_type1.borrow_mut() = _io.read_u4be()?.into();
        if  ((((*self_rc.format().major() as u16) == (2 as u16))) && (((*self_rc.format().minor() as u16) == (0 as u16))))  {
            let t = Self::read_into::<_, Ttf_Post_Format20>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.format20.borrow_mut() = t;
        }
        Ok(())
    }
}
impl Ttf_Post {
}
impl Ttf_Post {
    pub fn format(&self) -> Ref<'_, OptRc<Ttf_Fixed>> {
        self.format.borrow()
    }
}
impl Ttf_Post {
    pub fn italic_angle(&self) -> Ref<'_, OptRc<Ttf_Fixed>> {
        self.italic_angle.borrow()
    }
}
impl Ttf_Post {
    pub fn underline_position(&self) -> Ref<'_, i16> {
        self.underline_position.borrow()
    }
}
impl Ttf_Post {
    pub fn underline_thichness(&self) -> Ref<'_, i16> {
        self.underline_thichness.borrow()
    }
}
impl Ttf_Post {
    pub fn is_fixed_pitch(&self) -> Ref<'_, u32> {
        self.is_fixed_pitch.borrow()
    }
}
impl Ttf_Post {
    pub fn min_mem_type42(&self) -> Ref<'_, u32> {
        self.min_mem_type42.borrow()
    }
}
impl Ttf_Post {
    pub fn max_mem_type42(&self) -> Ref<'_, u32> {
        self.max_mem_type42.borrow()
    }
}
impl Ttf_Post {
    pub fn min_mem_type1(&self) -> Ref<'_, u32> {
        self.min_mem_type1.borrow()
    }
}
impl Ttf_Post {
    pub fn max_mem_type1(&self) -> Ref<'_, u32> {
        self.max_mem_type1.borrow()
    }
}
impl Ttf_Post {
    pub fn format20(&self) -> Ref<'_, OptRc<Ttf_Post_Format20>> {
        self.format20.borrow()
    }
}
impl Ttf_Post {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ttf_Post_Format20 {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_Post>,
    pub _self: SharedType<Self>,
    number_of_glyphs: RefCell<u16>,
    glyph_name_index: RefCell<Vec<u16>>,
    glyph_names: RefCell<Vec<OptRc<Ttf_Post_Format20_PascalString>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_Post_Format20 {
    type Root = Ttf;
    type Parent = Ttf_Post;

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
        *self_rc.number_of_glyphs.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.glyph_name_index.borrow_mut() = Vec::new();
        let l_glyph_name_index = *self_rc.number_of_glyphs();
        for _i in 0..l_glyph_name_index {
            self_rc.glyph_name_index.borrow_mut().push(_io.read_u2be()?.into());
        }
        *self_rc.glyph_names.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let t = Self::read_into::<_, Ttf_Post_Format20_PascalString>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.glyph_names.borrow_mut().push(t);
                let _t_glyph_names = self_rc.glyph_names.borrow();
                let _tmpa = _t_glyph_names.last().unwrap();
                _i += 1;
                let x = !( ((((*_tmpa.length() as u8) == (0 as u8))) || (_io.is_eof())) );
                x
            } {}
        }
        Ok(())
    }
}
impl Ttf_Post_Format20 {
}
impl Ttf_Post_Format20 {
    pub fn number_of_glyphs(&self) -> Ref<'_, u16> {
        self.number_of_glyphs.borrow()
    }
}
impl Ttf_Post_Format20 {
    pub fn glyph_name_index(&self) -> Ref<'_, Vec<u16>> {
        self.glyph_name_index.borrow()
    }
}
impl Ttf_Post_Format20 {
    pub fn glyph_names(&self) -> Ref<'_, Vec<OptRc<Ttf_Post_Format20_PascalString>>> {
        self.glyph_names.borrow()
    }
}
impl Ttf_Post_Format20 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ttf_Post_Format20_PascalString {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_Post_Format20>,
    pub _self: SharedType<Self>,
    length: RefCell<u8>,
    value: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_Post_Format20_PascalString {
    type Root = Ttf;
    type Parent = Ttf_Post_Format20;

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
        *self_rc.length.borrow_mut() = _io.read_u1()?.into();
        if ((*self_rc.length() as u8) != (0 as u8)) {
            *self_rc.value.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.length() as usize)?.into(), "ASCII")?;
        }
        Ok(())
    }
}
impl Ttf_Post_Format20_PascalString {
}
impl Ttf_Post_Format20_PascalString {
    pub fn length(&self) -> Ref<'_, u8> {
        self.length.borrow()
    }
}
impl Ttf_Post_Format20_PascalString {
    pub fn value(&self) -> Ref<'_, String> {
        self.value.borrow()
    }
}
impl Ttf_Post_Format20_PascalString {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ttf_Prep {
    pub _root: SharedType<Ttf>,
    pub _parent: SharedType<Ttf_DirTableEntry>,
    pub _self: SharedType<Self>,
    instructions: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ttf_Prep {
    type Root = Ttf;
    type Parent = Ttf_DirTableEntry;

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
        *self_rc.instructions.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl Ttf_Prep {
}
impl Ttf_Prep {
    pub fn instructions(&self) -> Ref<'_, Vec<u8>> {
        self.instructions.borrow()
    }
}
impl Ttf_Prep {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

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
use super::vlq_base128_be::VlqBase128Be;

/**
 * SQLite3 is a popular serverless SQL engine, implemented as a library
 * to be used within other applications. It keeps its databases as
 * regular disk files.
 * 
 * Every database file is segmented into pages. First page (starting at
 * the very beginning) is special: it contains a file-global header
 * which specifies some data relevant to proper parsing (i.e. format
 * versions, size of page, etc). After the header, normal contents of
 * the first page follow.
 * 
 * Each page would be of some type, and generally, they would be
 * reached via the links starting from the first page. First page type
 * (`root_page`) is always "btree_page".
 * \sa https://www.sqlite.org/fileformat.html Source
 */

#[derive(Default, Debug, Clone)]
pub struct Sqlite3 {
    pub _root: SharedType<Sqlite3>,
    pub _parent: SharedType<Sqlite3>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    len_page_mod: RefCell<u16>,
    write_version: RefCell<Sqlite3_Versions>,
    read_version: RefCell<Sqlite3_Versions>,
    reserved_space: RefCell<u8>,
    max_payload_frac: RefCell<u8>,
    min_payload_frac: RefCell<u8>,
    leaf_payload_frac: RefCell<u8>,
    file_change_counter: RefCell<u32>,
    num_pages: RefCell<u32>,
    first_freelist_trunk_page: RefCell<u32>,
    num_freelist_pages: RefCell<u32>,
    schema_cookie: RefCell<u32>,
    schema_format: RefCell<u32>,
    def_page_cache_size: RefCell<u32>,
    largest_root_page: RefCell<u32>,
    text_encoding: RefCell<Sqlite3_Encodings>,
    user_version: RefCell<u32>,
    is_incremental_vacuum: RefCell<u32>,
    application_id: RefCell<u32>,
    reserved: RefCell<Vec<u8>>,
    version_valid_for: RefCell<u32>,
    sqlite_version_number: RefCell<u32>,
    root_page: RefCell<OptRc<Sqlite3_BtreePage>>,
    _io: RefCell<BytesReader>,
    f_len_page: Cell<bool>,
    len_page: RefCell<i32>,
}
impl KStruct for Sqlite3 {
    type Root = Sqlite3;
    type Parent = Sqlite3;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        if !(*self_rc.magic() == vec![0x53u8, 0x51u8, 0x4cu8, 0x69u8, 0x74u8, 0x65u8, 0x20u8, 0x66u8, 0x6fu8, 0x72u8, 0x6du8, 0x61u8, 0x74u8, 0x20u8, 0x33u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.len_page_mod.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.write_version.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.read_version.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.reserved_space.borrow_mut() = _io.read_u1()?.into();
        *self_rc.max_payload_frac.borrow_mut() = _io.read_u1()?.into();
        *self_rc.min_payload_frac.borrow_mut() = _io.read_u1()?.into();
        *self_rc.leaf_payload_frac.borrow_mut() = _io.read_u1()?.into();
        *self_rc.file_change_counter.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.num_pages.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.first_freelist_trunk_page.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.num_freelist_pages.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.schema_cookie.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.schema_format.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.def_page_cache_size.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.largest_root_page.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.text_encoding.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        *self_rc.user_version.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.is_incremental_vacuum.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.application_id.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_bytes(20 as usize)?.into();
        *self_rc.version_valid_for.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.sqlite_version_number.borrow_mut() = _io.read_u4be()?.into();
        let t = Self::read_into::<_, Sqlite3_BtreePage>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.root_page.borrow_mut() = t;
        Ok(())
    }
}
impl Sqlite3 {
    pub fn len_page(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_page.get() {
            return Ok(self.len_page.borrow());
        }
        self.f_len_page.set(true);
        *self.len_page.borrow_mut() = (if ((*self.len_page_mod() as u16) == (1 as u16)) { 65536 } else { *self.len_page_mod() }) as i32;
        Ok(self.len_page.borrow())
    }
}
impl Sqlite3 {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}

/**
 * The database page size in bytes. Must be a power of two between
 * 512 and 32768 inclusive, or the value 1 representing a page size
 * of 65536.
 */
impl Sqlite3 {
    pub fn len_page_mod(&self) -> Ref<'_, u16> {
        self.len_page_mod.borrow()
    }
}
impl Sqlite3 {
    pub fn write_version(&self) -> Ref<'_, Sqlite3_Versions> {
        self.write_version.borrow()
    }
}
impl Sqlite3 {
    pub fn read_version(&self) -> Ref<'_, Sqlite3_Versions> {
        self.read_version.borrow()
    }
}

/**
 * Bytes of unused "reserved" space at the end of each page. Usually 0.
 */
impl Sqlite3 {
    pub fn reserved_space(&self) -> Ref<'_, u8> {
        self.reserved_space.borrow()
    }
}

/**
 * Maximum embedded payload fraction. Must be 64.
 */
impl Sqlite3 {
    pub fn max_payload_frac(&self) -> Ref<'_, u8> {
        self.max_payload_frac.borrow()
    }
}

/**
 * Minimum embedded payload fraction. Must be 32.
 */
impl Sqlite3 {
    pub fn min_payload_frac(&self) -> Ref<'_, u8> {
        self.min_payload_frac.borrow()
    }
}

/**
 * Leaf payload fraction. Must be 32.
 */
impl Sqlite3 {
    pub fn leaf_payload_frac(&self) -> Ref<'_, u8> {
        self.leaf_payload_frac.borrow()
    }
}
impl Sqlite3 {
    pub fn file_change_counter(&self) -> Ref<'_, u32> {
        self.file_change_counter.borrow()
    }
}

/**
 * Size of the database file in pages. The "in-header database size".
 */
impl Sqlite3 {
    pub fn num_pages(&self) -> Ref<'_, u32> {
        self.num_pages.borrow()
    }
}

/**
 * Page number of the first freelist trunk page.
 */
impl Sqlite3 {
    pub fn first_freelist_trunk_page(&self) -> Ref<'_, u32> {
        self.first_freelist_trunk_page.borrow()
    }
}

/**
 * Total number of freelist pages.
 */
impl Sqlite3 {
    pub fn num_freelist_pages(&self) -> Ref<'_, u32> {
        self.num_freelist_pages.borrow()
    }
}
impl Sqlite3 {
    pub fn schema_cookie(&self) -> Ref<'_, u32> {
        self.schema_cookie.borrow()
    }
}

/**
 * The schema format number. Supported schema formats are 1, 2, 3, and 4.
 */
impl Sqlite3 {
    pub fn schema_format(&self) -> Ref<'_, u32> {
        self.schema_format.borrow()
    }
}

/**
 * Default page cache size.
 */
impl Sqlite3 {
    pub fn def_page_cache_size(&self) -> Ref<'_, u32> {
        self.def_page_cache_size.borrow()
    }
}

/**
 * The page number of the largest root b-tree page when in auto-vacuum or incremental-vacuum modes, or zero otherwise.
 */
impl Sqlite3 {
    pub fn largest_root_page(&self) -> Ref<'_, u32> {
        self.largest_root_page.borrow()
    }
}

/**
 * The database text encoding. A value of 1 means UTF-8. A value of 2 means UTF-16le. A value of 3 means UTF-16be.
 */
impl Sqlite3 {
    pub fn text_encoding(&self) -> Ref<'_, Sqlite3_Encodings> {
        self.text_encoding.borrow()
    }
}

/**
 * The "user version" as read and set by the user_version pragma.
 */
impl Sqlite3 {
    pub fn user_version(&self) -> Ref<'_, u32> {
        self.user_version.borrow()
    }
}

/**
 * True (non-zero) for incremental-vacuum mode. False (zero) otherwise.
 */
impl Sqlite3 {
    pub fn is_incremental_vacuum(&self) -> Ref<'_, u32> {
        self.is_incremental_vacuum.borrow()
    }
}

/**
 * The "Application ID" set by PRAGMA application_id.
 */
impl Sqlite3 {
    pub fn application_id(&self) -> Ref<'_, u32> {
        self.application_id.borrow()
    }
}
impl Sqlite3 {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Sqlite3 {
    pub fn version_valid_for(&self) -> Ref<'_, u32> {
        self.version_valid_for.borrow()
    }
}
impl Sqlite3 {
    pub fn sqlite_version_number(&self) -> Ref<'_, u32> {
        self.sqlite_version_number.borrow()
    }
}
impl Sqlite3 {
    pub fn root_page(&self) -> Ref<'_, OptRc<Sqlite3_BtreePage>> {
        self.root_page.borrow()
    }
}
impl Sqlite3 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Sqlite3_Encodings {
    Utf8,
    Utf16le,
    Utf16be,
    Unknown(i64),
}

impl TryFrom<i64> for Sqlite3_Encodings {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Sqlite3_Encodings> {
        match flag {
            1 => Ok(Sqlite3_Encodings::Utf8),
            2 => Ok(Sqlite3_Encodings::Utf16le),
            3 => Ok(Sqlite3_Encodings::Utf16be),
            _ => Ok(Sqlite3_Encodings::Unknown(flag)),
        }
    }
}

impl From<&Sqlite3_Encodings> for i64 {
    fn from(v: &Sqlite3_Encodings) -> Self {
        match *v {
            Sqlite3_Encodings::Utf8 => 1,
            Sqlite3_Encodings::Utf16le => 2,
            Sqlite3_Encodings::Utf16be => 3,
            Sqlite3_Encodings::Unknown(v) => v
        }
    }
}

impl Default for Sqlite3_Encodings {
    fn default() -> Self { Sqlite3_Encodings::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Sqlite3_Versions {
    Legacy,
    Wal,
    Unknown(i64),
}

impl TryFrom<i64> for Sqlite3_Versions {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Sqlite3_Versions> {
        match flag {
            1 => Ok(Sqlite3_Versions::Legacy),
            2 => Ok(Sqlite3_Versions::Wal),
            _ => Ok(Sqlite3_Versions::Unknown(flag)),
        }
    }
}

impl From<&Sqlite3_Versions> for i64 {
    fn from(v: &Sqlite3_Versions) -> Self {
        match *v {
            Sqlite3_Versions::Legacy => 1,
            Sqlite3_Versions::Wal => 2,
            Sqlite3_Versions::Unknown(v) => v
        }
    }
}

impl Default for Sqlite3_Versions {
    fn default() -> Self { Sqlite3_Versions::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Sqlite3_BtreePage {
    pub _root: SharedType<Sqlite3>,
    pub _parent: SharedType<Sqlite3>,
    pub _self: SharedType<Self>,
    page_type: RefCell<u8>,
    first_freeblock: RefCell<u16>,
    num_cells: RefCell<u16>,
    ofs_cells: RefCell<u16>,
    num_frag_free_bytes: RefCell<u8>,
    right_ptr: RefCell<u32>,
    cells: RefCell<Vec<OptRc<Sqlite3_RefCell>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Sqlite3_BtreePage {
    type Root = Sqlite3;
    type Parent = Sqlite3;

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
        *self_rc.page_type.borrow_mut() = _io.read_u1()?.into();
        *self_rc.first_freeblock.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.num_cells.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.ofs_cells.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.num_frag_free_bytes.borrow_mut() = _io.read_u1()?.into();
        if  ((((*self_rc.page_type() as u8) == (2 as u8))) || (((*self_rc.page_type() as u8) == (5 as u8))))  {
            *self_rc.right_ptr.borrow_mut() = _io.read_u4be()?.into();
        }
        *self_rc.cells.borrow_mut() = Vec::new();
        let l_cells = *self_rc.num_cells();
        for _i in 0..l_cells {
            let t = Self::read_into::<_, Sqlite3_RefCell>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.cells.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Sqlite3_BtreePage {
}
impl Sqlite3_BtreePage {
    pub fn page_type(&self) -> Ref<'_, u8> {
        self.page_type.borrow()
    }
}
impl Sqlite3_BtreePage {
    pub fn first_freeblock(&self) -> Ref<'_, u16> {
        self.first_freeblock.borrow()
    }
}
impl Sqlite3_BtreePage {
    pub fn num_cells(&self) -> Ref<'_, u16> {
        self.num_cells.borrow()
    }
}
impl Sqlite3_BtreePage {
    pub fn ofs_cells(&self) -> Ref<'_, u16> {
        self.ofs_cells.borrow()
    }
}
impl Sqlite3_BtreePage {
    pub fn num_frag_free_bytes(&self) -> Ref<'_, u8> {
        self.num_frag_free_bytes.borrow()
    }
}
impl Sqlite3_BtreePage {
    pub fn right_ptr(&self) -> Ref<'_, u32> {
        self.right_ptr.borrow()
    }
}
impl Sqlite3_BtreePage {
    pub fn cells(&self) -> Ref<'_, Vec<OptRc<Sqlite3_RefCell>>> {
        self.cells.borrow()
    }
}
impl Sqlite3_BtreePage {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://www.sqlite.org/fileformat.html#b_tree_pages Source
 */

#[derive(Default, Debug, Clone)]
pub struct Sqlite3_CellIndexInterior {
    pub _root: SharedType<Sqlite3>,
    pub _parent: SharedType<Sqlite3_RefCell>,
    pub _self: SharedType<Self>,
    left_child_page: RefCell<u32>,
    len_payload: RefCell<OptRc<VlqBase128Be>>,
    payload: RefCell<OptRc<Sqlite3_CellPayload>>,
    _io: RefCell<BytesReader>,
    payload_raw: RefCell<Vec<u8>>,
}
impl KStruct for Sqlite3_CellIndexInterior {
    type Root = Sqlite3;
    type Parent = Sqlite3_RefCell;

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
        *self_rc.left_child_page.borrow_mut() = _io.read_u4be()?.into();
        let t = Self::read_into::<_, VlqBase128Be>(&*_io, None, None)?.into();
        *self_rc.len_payload.borrow_mut() = t;
        *self_rc.payload_raw.borrow_mut() = _io.read_bytes(*self_rc.len_payload().value()? as usize)?.into();
        let payload_raw = self_rc.payload_raw.borrow();
        let _t_payload_raw_io = BytesReader::from(payload_raw.clone());
        let t = Self::read_into::<BytesReader, Sqlite3_CellPayload>(&_t_payload_raw_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.payload.borrow_mut() = t;
        Ok(())
    }
}
impl Sqlite3_CellIndexInterior {
}
impl Sqlite3_CellIndexInterior {
    pub fn left_child_page(&self) -> Ref<'_, u32> {
        self.left_child_page.borrow()
    }
}
impl Sqlite3_CellIndexInterior {
    pub fn len_payload(&self) -> Ref<'_, OptRc<VlqBase128Be>> {
        self.len_payload.borrow()
    }
}
impl Sqlite3_CellIndexInterior {
    pub fn payload(&self) -> Ref<'_, OptRc<Sqlite3_CellPayload>> {
        self.payload.borrow()
    }
}
impl Sqlite3_CellIndexInterior {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Sqlite3_CellIndexInterior {
    pub fn payload_raw(&self) -> Ref<'_, Vec<u8>> {
        self.payload_raw.borrow()
    }
}

/**
 * \sa https://www.sqlite.org/fileformat.html#b_tree_pages Source
 */

#[derive(Default, Debug, Clone)]
pub struct Sqlite3_CellIndexLeaf {
    pub _root: SharedType<Sqlite3>,
    pub _parent: SharedType<Sqlite3_RefCell>,
    pub _self: SharedType<Self>,
    len_payload: RefCell<OptRc<VlqBase128Be>>,
    payload: RefCell<OptRc<Sqlite3_CellPayload>>,
    _io: RefCell<BytesReader>,
    payload_raw: RefCell<Vec<u8>>,
}
impl KStruct for Sqlite3_CellIndexLeaf {
    type Root = Sqlite3;
    type Parent = Sqlite3_RefCell;

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
        let t = Self::read_into::<_, VlqBase128Be>(&*_io, None, None)?.into();
        *self_rc.len_payload.borrow_mut() = t;
        *self_rc.payload_raw.borrow_mut() = _io.read_bytes(*self_rc.len_payload().value()? as usize)?.into();
        let payload_raw = self_rc.payload_raw.borrow();
        let _t_payload_raw_io = BytesReader::from(payload_raw.clone());
        let t = Self::read_into::<BytesReader, Sqlite3_CellPayload>(&_t_payload_raw_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.payload.borrow_mut() = t;
        Ok(())
    }
}
impl Sqlite3_CellIndexLeaf {
}
impl Sqlite3_CellIndexLeaf {
    pub fn len_payload(&self) -> Ref<'_, OptRc<VlqBase128Be>> {
        self.len_payload.borrow()
    }
}
impl Sqlite3_CellIndexLeaf {
    pub fn payload(&self) -> Ref<'_, OptRc<Sqlite3_CellPayload>> {
        self.payload.borrow()
    }
}
impl Sqlite3_CellIndexLeaf {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Sqlite3_CellIndexLeaf {
    pub fn payload_raw(&self) -> Ref<'_, Vec<u8>> {
        self.payload_raw.borrow()
    }
}

/**
 * \sa https://sqlite.org/fileformat2.html#record_format Source
 */

#[derive(Default, Debug, Clone)]
pub struct Sqlite3_CellPayload {
    pub _root: SharedType<Sqlite3>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    len_header_and_len: RefCell<OptRc<VlqBase128Be>>,
    column_serials: RefCell<OptRc<Sqlite3_Serials>>,
    column_contents: RefCell<Vec<OptRc<Sqlite3_ColumnContent>>>,
    _io: RefCell<BytesReader>,
    column_serials_raw: RefCell<Vec<u8>>,
}
impl KStruct for Sqlite3_CellPayload {
    type Root = Sqlite3;
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
        let t = Self::read_into::<_, VlqBase128Be>(&*_io, None, None)?.into();
        *self_rc.len_header_and_len.borrow_mut() = t;
        *self_rc.column_serials_raw.borrow_mut() = _io.read_bytes(((*self_rc.len_header_and_len().value()? as u64) - (1 as u64)) as usize)?.into();
        let column_serials_raw = self_rc.column_serials_raw.borrow();
        let _t_column_serials_raw_io = BytesReader::from(column_serials_raw.clone());
        let t = Self::read_into::<BytesReader, Sqlite3_Serials>(&_t_column_serials_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.column_serials.borrow_mut() = t;
        *self_rc.column_contents.borrow_mut() = Vec::new();
        let l_column_contents = self_rc.column_serials().entries().len();
        for _i in 0..l_column_contents {
            let f = |t : &mut Sqlite3_ColumnContent| Ok(t.set_params(&self_rc.column_serials().entries()[_i as usize]));
            let t = Self::read_into_with_init::<_, Sqlite3_ColumnContent>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            self_rc.column_contents.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Sqlite3_CellPayload {
}
impl Sqlite3_CellPayload {
    pub fn len_header_and_len(&self) -> Ref<'_, OptRc<VlqBase128Be>> {
        self.len_header_and_len.borrow()
    }
}
impl Sqlite3_CellPayload {
    pub fn column_serials(&self) -> Ref<'_, OptRc<Sqlite3_Serials>> {
        self.column_serials.borrow()
    }
}
impl Sqlite3_CellPayload {
    pub fn column_contents(&self) -> Ref<'_, Vec<OptRc<Sqlite3_ColumnContent>>> {
        self.column_contents.borrow()
    }
}
impl Sqlite3_CellPayload {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Sqlite3_CellPayload {
    pub fn column_serials_raw(&self) -> Ref<'_, Vec<u8>> {
        self.column_serials_raw.borrow()
    }
}

/**
 * \sa https://www.sqlite.org/fileformat.html#b_tree_pages Source
 */

#[derive(Default, Debug, Clone)]
pub struct Sqlite3_CellTableInterior {
    pub _root: SharedType<Sqlite3>,
    pub _parent: SharedType<Sqlite3_RefCell>,
    pub _self: SharedType<Self>,
    left_child_page: RefCell<u32>,
    row_id: RefCell<OptRc<VlqBase128Be>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Sqlite3_CellTableInterior {
    type Root = Sqlite3;
    type Parent = Sqlite3_RefCell;

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
        *self_rc.left_child_page.borrow_mut() = _io.read_u4be()?.into();
        let t = Self::read_into::<_, VlqBase128Be>(&*_io, None, None)?.into();
        *self_rc.row_id.borrow_mut() = t;
        Ok(())
    }
}
impl Sqlite3_CellTableInterior {
}
impl Sqlite3_CellTableInterior {
    pub fn left_child_page(&self) -> Ref<'_, u32> {
        self.left_child_page.borrow()
    }
}
impl Sqlite3_CellTableInterior {
    pub fn row_id(&self) -> Ref<'_, OptRc<VlqBase128Be>> {
        self.row_id.borrow()
    }
}
impl Sqlite3_CellTableInterior {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://www.sqlite.org/fileformat.html#b_tree_pages Source
 */

#[derive(Default, Debug, Clone)]
pub struct Sqlite3_CellTableLeaf {
    pub _root: SharedType<Sqlite3>,
    pub _parent: SharedType<Sqlite3_RefCell>,
    pub _self: SharedType<Self>,
    len_payload: RefCell<OptRc<VlqBase128Be>>,
    row_id: RefCell<OptRc<VlqBase128Be>>,
    payload: RefCell<OptRc<Sqlite3_CellPayload>>,
    _io: RefCell<BytesReader>,
    payload_raw: RefCell<Vec<u8>>,
}
impl KStruct for Sqlite3_CellTableLeaf {
    type Root = Sqlite3;
    type Parent = Sqlite3_RefCell;

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
        let t = Self::read_into::<_, VlqBase128Be>(&*_io, None, None)?.into();
        *self_rc.len_payload.borrow_mut() = t;
        let t = Self::read_into::<_, VlqBase128Be>(&*_io, None, None)?.into();
        *self_rc.row_id.borrow_mut() = t;
        *self_rc.payload_raw.borrow_mut() = _io.read_bytes(*self_rc.len_payload().value()? as usize)?.into();
        let payload_raw = self_rc.payload_raw.borrow();
        let _t_payload_raw_io = BytesReader::from(payload_raw.clone());
        let t = Self::read_into::<BytesReader, Sqlite3_CellPayload>(&_t_payload_raw_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.payload.borrow_mut() = t;
        Ok(())
    }
}
impl Sqlite3_CellTableLeaf {
}
impl Sqlite3_CellTableLeaf {
    pub fn len_payload(&self) -> Ref<'_, OptRc<VlqBase128Be>> {
        self.len_payload.borrow()
    }
}
impl Sqlite3_CellTableLeaf {
    pub fn row_id(&self) -> Ref<'_, OptRc<VlqBase128Be>> {
        self.row_id.borrow()
    }
}
impl Sqlite3_CellTableLeaf {
    pub fn payload(&self) -> Ref<'_, OptRc<Sqlite3_CellPayload>> {
        self.payload.borrow()
    }
}
impl Sqlite3_CellTableLeaf {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Sqlite3_CellTableLeaf {
    pub fn payload_raw(&self) -> Ref<'_, Vec<u8>> {
        self.payload_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Sqlite3_ColumnContent {
    pub _root: SharedType<Sqlite3>,
    pub _parent: SharedType<Sqlite3_CellPayload>,
    pub _self: SharedType<Self>,
    serial_type: RefCell<OptRc<Sqlite3_Serial>>,
    as_int: RefCell<Option<Sqlite3_ColumnContent_AsInt>>,
    as_float: RefCell<f64>,
    as_blob: RefCell<Vec<u8>>,
    as_str: RefCell<String>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Sqlite3_ColumnContent_AsInt {
    Bits(u64),
    U4(u32),
    U2(u16),
    U1(u8),
}
impl From<u64> for Sqlite3_ColumnContent_AsInt {
    fn from(v: u64) -> Self {
        Self::Bits(v)
    }
}
impl From<&Sqlite3_ColumnContent_AsInt> for u64 {
    fn from(e: &Sqlite3_ColumnContent_AsInt) -> Self {
        if let Sqlite3_ColumnContent_AsInt::Bits(v) = e {
            return *v
        }
        panic!("trying to convert from enum Sqlite3_ColumnContent_AsInt::Bits to u64, enum value {:?}", e)
    }
}
impl From<u32> for Sqlite3_ColumnContent_AsInt {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&Sqlite3_ColumnContent_AsInt> for u32 {
    fn from(e: &Sqlite3_ColumnContent_AsInt) -> Self {
        if let Sqlite3_ColumnContent_AsInt::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Sqlite3_ColumnContent_AsInt::U4 to u32, enum value {:?}", e)
    }
}
impl From<u16> for Sqlite3_ColumnContent_AsInt {
    fn from(v: u16) -> Self {
        Self::U2(v)
    }
}
impl From<&Sqlite3_ColumnContent_AsInt> for u16 {
    fn from(e: &Sqlite3_ColumnContent_AsInt) -> Self {
        if let Sqlite3_ColumnContent_AsInt::U2(v) = e {
            return *v
        }
        panic!("trying to convert from enum Sqlite3_ColumnContent_AsInt::U2 to u16, enum value {:?}", e)
    }
}
impl From<u8> for Sqlite3_ColumnContent_AsInt {
    fn from(v: u8) -> Self {
        Self::U1(v)
    }
}
impl From<&Sqlite3_ColumnContent_AsInt> for u8 {
    fn from(e: &Sqlite3_ColumnContent_AsInt) -> Self {
        if let Sqlite3_ColumnContent_AsInt::U1(v) = e {
            return *v
        }
        panic!("trying to convert from enum Sqlite3_ColumnContent_AsInt::U1 to u8, enum value {:?}", e)
    }
}
impl From<&Sqlite3_ColumnContent_AsInt> for usize {
    fn from(e: &Sqlite3_ColumnContent_AsInt) -> Self {
        match e {
            Sqlite3_ColumnContent_AsInt::Bits(v) => *v as usize,
            Sqlite3_ColumnContent_AsInt::U8(v) => *v as usize,
            Sqlite3_ColumnContent_AsInt::U4(v) => *v as usize,
            Sqlite3_ColumnContent_AsInt::U2(v) => *v as usize,
            Sqlite3_ColumnContent_AsInt::U1(v) => *v as usize,
        }
    }
}

impl KStruct for Sqlite3_ColumnContent {
    type Root = Sqlite3;
    type Parent = Sqlite3_CellPayload;

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
        if  ((((*self_rc.serial_type().code().value()? as u64) >= (1 as u64))) && (((*self_rc.serial_type().code().value()? as u64) <= (6 as u64))))  {
            match *self_rc.serial_type().code().value()? {
                1 => {
                    *self_rc.as_int.borrow_mut() = Some(_io.read_u1()?.into());
                }
                2 => {
                    *self_rc.as_int.borrow_mut() = Some(_io.read_u2be()?.into());
                }
                3 => {
                    *self_rc.as_int.borrow_mut() = Some(_io.read_bits_int_be(24)?);
                }
                4 => {
                    *self_rc.as_int.borrow_mut() = Some(_io.read_u4be()?.into());
                }
                5 => {
                    *self_rc.as_int.borrow_mut() = Some(_io.read_bits_int_be(48)?);
                }
                6 => {
                    *self_rc.as_int.borrow_mut() = Some(_io.read_u8be()?.into());
                }
                _ => {}
            }
        }
        if ((*self_rc.serial_type().code().value()? as u64) == (7 as u64)) {
            *self_rc.as_float.borrow_mut() = _io.read_f8be()?.into();
        }
        if *self_rc.serial_type().is_blob()? {
            *self_rc.as_blob.borrow_mut() = _io.read_bytes(*self_rc.serial_type().len_content()? as usize)?.into();
        }
        *self_rc.as_str.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.serial_type().len_content()? as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Sqlite3_ColumnContent {
    pub fn serial_type(&self) -> Ref<'_, OptRc<Sqlite3_Serial>> {
        self.serial_type.borrow()
    }
}
impl Sqlite3_ColumnContent {
    pub fn set_params(&mut self, serial_type: &OptRc<Sqlite3_Serial>) {
        *self.serial_type.borrow_mut() = serial_type.clone();
    }
}
impl Sqlite3_ColumnContent {
}
impl Sqlite3_ColumnContent {
    pub fn as_int(&self) -> usize {
        self.as_int.borrow().as_ref().unwrap().into()
    }
    pub fn as_int_enum(&self) -> Ref<'_, Option<Sqlite3_ColumnContent_AsInt>> {
        self.as_int.borrow()
    }
}
impl Sqlite3_ColumnContent {
    pub fn as_float(&self) -> Ref<'_, f64> {
        self.as_float.borrow()
    }
}
impl Sqlite3_ColumnContent {
    pub fn as_blob(&self) -> Ref<'_, Vec<u8>> {
        self.as_blob.borrow()
    }
}
impl Sqlite3_ColumnContent {
    pub fn as_str(&self) -> Ref<'_, String> {
        self.as_str.borrow()
    }
}
impl Sqlite3_ColumnContent {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Sqlite3_RefCell {
    pub _root: SharedType<Sqlite3>,
    pub _parent: SharedType<Sqlite3_BtreePage>,
    pub _self: SharedType<Self>,
    ofs_body: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_body: Cell<bool>,
    body: RefCell<Option<Sqlite3_RefCell_Body>>,
}
#[derive(Debug, Clone)]
pub enum Sqlite3_RefCell_Body {
    Sqlite3_CellIndexLeaf(OptRc<Sqlite3_CellIndexLeaf>),
    Sqlite3_CellTableLeaf(OptRc<Sqlite3_CellTableLeaf>),
    Sqlite3_CellIndexInterior(OptRc<Sqlite3_CellIndexInterior>),
    Sqlite3_CellTableInterior(OptRc<Sqlite3_CellTableInterior>),
}
impl From<&Sqlite3_RefCell_Body> for OptRc<Sqlite3_CellIndexLeaf> {
    fn from(v: &Sqlite3_RefCell_Body) -> Self {
        if let Sqlite3_RefCell_Body::Sqlite3_CellIndexLeaf(x) = v {
            return x.clone();
        }
        panic!("expected Sqlite3_RefCell_Body::Sqlite3_CellIndexLeaf, got {:?}", v)
    }
}
impl From<OptRc<Sqlite3_CellIndexLeaf>> for Sqlite3_RefCell_Body {
    fn from(v: OptRc<Sqlite3_CellIndexLeaf>) -> Self {
        Self::Sqlite3_CellIndexLeaf(v)
    }
}
impl From<&Sqlite3_RefCell_Body> for OptRc<Sqlite3_CellTableLeaf> {
    fn from(v: &Sqlite3_RefCell_Body) -> Self {
        if let Sqlite3_RefCell_Body::Sqlite3_CellTableLeaf(x) = v {
            return x.clone();
        }
        panic!("expected Sqlite3_RefCell_Body::Sqlite3_CellTableLeaf, got {:?}", v)
    }
}
impl From<OptRc<Sqlite3_CellTableLeaf>> for Sqlite3_RefCell_Body {
    fn from(v: OptRc<Sqlite3_CellTableLeaf>) -> Self {
        Self::Sqlite3_CellTableLeaf(v)
    }
}
impl From<&Sqlite3_RefCell_Body> for OptRc<Sqlite3_CellIndexInterior> {
    fn from(v: &Sqlite3_RefCell_Body) -> Self {
        if let Sqlite3_RefCell_Body::Sqlite3_CellIndexInterior(x) = v {
            return x.clone();
        }
        panic!("expected Sqlite3_RefCell_Body::Sqlite3_CellIndexInterior, got {:?}", v)
    }
}
impl From<OptRc<Sqlite3_CellIndexInterior>> for Sqlite3_RefCell_Body {
    fn from(v: OptRc<Sqlite3_CellIndexInterior>) -> Self {
        Self::Sqlite3_CellIndexInterior(v)
    }
}
impl From<&Sqlite3_RefCell_Body> for OptRc<Sqlite3_CellTableInterior> {
    fn from(v: &Sqlite3_RefCell_Body) -> Self {
        if let Sqlite3_RefCell_Body::Sqlite3_CellTableInterior(x) = v {
            return x.clone();
        }
        panic!("expected Sqlite3_RefCell_Body::Sqlite3_CellTableInterior, got {:?}", v)
    }
}
impl From<OptRc<Sqlite3_CellTableInterior>> for Sqlite3_RefCell_Body {
    fn from(v: OptRc<Sqlite3_CellTableInterior>) -> Self {
        Self::Sqlite3_CellTableInterior(v)
    }
}
impl KStruct for Sqlite3_RefCell {
    type Root = Sqlite3;
    type Parent = Sqlite3_BtreePage;

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
        *self_rc.ofs_body.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl Sqlite3_RefCell {
    pub fn body(
        &self
    ) -> KResult<Ref<'_, Option<Sqlite3_RefCell_Body>>> {
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
        match *_prc.as_ref().unwrap().page_type() {
            10 => {
                let t = Self::read_into::<_, Sqlite3_CellIndexLeaf>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.body.borrow_mut() = Some(t);
            }
            13 => {
                let t = Self::read_into::<_, Sqlite3_CellTableLeaf>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.body.borrow_mut() = Some(t);
            }
            2 => {
                let t = Self::read_into::<_, Sqlite3_CellIndexInterior>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.body.borrow_mut() = Some(t);
            }
            5 => {
                let t = Self::read_into::<_, Sqlite3_CellTableInterior>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.body.borrow_mut() = Some(t);
            }
            _ => {}
        }
        _io.seek(_pos)?;
        Ok(self.body.borrow())
    }
}
impl Sqlite3_RefCell {
    pub fn ofs_body(&self) -> Ref<'_, u16> {
        self.ofs_body.borrow()
    }
}
impl Sqlite3_RefCell {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Sqlite3_Serial {
    pub _root: SharedType<Sqlite3>,
    pub _parent: SharedType<Sqlite3_Serials>,
    pub _self: SharedType<Self>,
    code: RefCell<OptRc<VlqBase128Be>>,
    _io: RefCell<BytesReader>,
    f_is_blob: Cell<bool>,
    is_blob: RefCell<bool>,
    f_is_string: Cell<bool>,
    is_string: RefCell<bool>,
    f_len_content: Cell<bool>,
    len_content: RefCell<i32>,
}
impl KStruct for Sqlite3_Serial {
    type Root = Sqlite3;
    type Parent = Sqlite3_Serials;

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
        let t = Self::read_into::<_, VlqBase128Be>(&*_io, None, None)?.into();
        *self_rc.code.borrow_mut() = t;
        Ok(())
    }
}
impl Sqlite3_Serial {
    pub fn is_blob(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_blob.get() {
            return Ok(self.is_blob.borrow());
        }
        self.f_is_blob.set(true);
        *self.is_blob.borrow_mut() = ( ((((*self.code().value()? as u64) >= (12 as u64))) && (((((*self.code().value()? as u64) % (2 as u64)) as i32) == (0 as i32)))) ) as bool;
        Ok(self.is_blob.borrow())
    }
    pub fn is_string(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_string.get() {
            return Ok(self.is_string.borrow());
        }
        self.f_is_string.set(true);
        *self.is_string.borrow_mut() = ( ((((*self.code().value()? as u64) >= (13 as u64))) && (((((*self.code().value()? as u64) % (2 as u64)) as i32) == (1 as i32)))) ) as bool;
        Ok(self.is_string.borrow())
    }
    pub fn len_content(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_content.get() {
            return Ok(self.len_content.borrow());
        }
        self.f_len_content.set(true);
        if ((*self.code().value()? as u64) >= (12 as u64)) {
            *self.len_content.borrow_mut() = (((((*self.code().value()? as u64) - (12 as u64)) as i32) / (2 as i32))) as i32;
        }
        Ok(self.len_content.borrow())
    }
}
impl Sqlite3_Serial {
    pub fn code(&self) -> Ref<'_, OptRc<VlqBase128Be>> {
        self.code.borrow()
    }
}
impl Sqlite3_Serial {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Sqlite3_Serials {
    pub _root: SharedType<Sqlite3>,
    pub _parent: SharedType<Sqlite3_CellPayload>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<Sqlite3_Serial>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Sqlite3_Serials {
    type Root = Sqlite3;
    type Parent = Sqlite3_CellPayload;

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
                let t = Self::read_into::<_, Sqlite3_Serial>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Sqlite3_Serials {
}
impl Sqlite3_Serials {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Sqlite3_Serial>>> {
        self.entries.borrow()
    }
}
impl Sqlite3_Serials {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

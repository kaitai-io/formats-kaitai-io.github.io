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
 * AppleSingle and AppleDouble files are used by certain Mac
 * applications (e.g. Finder) to store Mac-specific file attributes on
 * filesystems that do not support that.
 * 
 * Syntactically, both formats are the same, the only difference is how
 * they are being used:
 * 
 * * AppleSingle means that only one file will be created on external
 *   filesystem that will hold both the data (AKA "data fork" in Apple
 *   terminology), and the attributes (AKA "resource fork").
 * * AppleDouble means that two files will be created: a normal file
 *   that keeps the data ("data fork") is kept separately from an
 *   auxiliary file that contains attributes ("resource fork"), which
 *   is kept with the same name, but starting with an extra dot and
 *   underscore `._` to keep it hidden.
 * 
 * In modern practice (Mac OS X), Finder only uses AppleDouble to keep
 * compatibility with other OSes, as virtually nobody outside of Mac
 * understands how to access data in AppleSingle container.
 * \sa http://kaiser-edv.de/documents/AppleSingle_AppleDouble.pdf Source
 */

#[derive(Default, Debug, Clone)]
pub struct AppleSingleDouble {
    pub _root: SharedType<AppleSingleDouble>,
    pub _parent: SharedType<AppleSingleDouble>,
    pub _self: SharedType<Self>,
    magic: RefCell<AppleSingleDouble_FileType>,
    version: RefCell<u32>,
    reserved: RefCell<Vec<u8>>,
    num_entries: RefCell<u16>,
    entries: RefCell<Vec<OptRc<AppleSingleDouble_Entry>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AppleSingleDouble {
    type Root = AppleSingleDouble;
    type Parent = AppleSingleDouble;

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
        *self_rc.magic.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        *self_rc.version.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        *self_rc.num_entries.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.entries.borrow_mut() = Vec::new();
        let l_entries = *self_rc.num_entries();
        for _i in 0..l_entries {
            let t = Self::read_into::<_, AppleSingleDouble_Entry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.entries.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl AppleSingleDouble {
}
impl AppleSingleDouble {
    pub fn magic(&self) -> Ref<'_, AppleSingleDouble_FileType> {
        self.magic.borrow()
    }
}
impl AppleSingleDouble {
    pub fn version(&self) -> Ref<'_, u32> {
        self.version.borrow()
    }
}

/**
 * Must be all 0.
 */
impl AppleSingleDouble {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl AppleSingleDouble {
    pub fn num_entries(&self) -> Ref<'_, u16> {
        self.num_entries.borrow()
    }
}
impl AppleSingleDouble {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<AppleSingleDouble_Entry>>> {
        self.entries.borrow()
    }
}
impl AppleSingleDouble {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum AppleSingleDouble_FileType {
    AppleSingle,
    AppleDouble,
    Unknown(i64),
}

impl TryFrom<i64> for AppleSingleDouble_FileType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<AppleSingleDouble_FileType> {
        match flag {
            333312 => Ok(AppleSingleDouble_FileType::AppleSingle),
            333319 => Ok(AppleSingleDouble_FileType::AppleDouble),
            _ => Ok(AppleSingleDouble_FileType::Unknown(flag)),
        }
    }
}

impl From<&AppleSingleDouble_FileType> for i64 {
    fn from(v: &AppleSingleDouble_FileType) -> Self {
        match *v {
            AppleSingleDouble_FileType::AppleSingle => 333312,
            AppleSingleDouble_FileType::AppleDouble => 333319,
            AppleSingleDouble_FileType::Unknown(v) => v
        }
    }
}

impl Default for AppleSingleDouble_FileType {
    fn default() -> Self { AppleSingleDouble_FileType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct AppleSingleDouble_Entry {
    pub _root: SharedType<AppleSingleDouble>,
    pub _parent: SharedType<AppleSingleDouble>,
    pub _self: SharedType<Self>,
    type: RefCell<AppleSingleDouble_Entry_Types>,
    ofs_body: RefCell<u32>,
    len_body: RefCell<u32>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
    f_body: Cell<bool>,
    body: RefCell<Option<AppleSingleDouble_Entry_Body>>,
}
#[derive(Debug, Clone)]
pub enum AppleSingleDouble_Entry_Body {
    AppleSingleDouble_FinderInfo(OptRc<AppleSingleDouble_FinderInfo>),
    Bytes(Vec<u8>),
}
impl From<&AppleSingleDouble_Entry_Body> for OptRc<AppleSingleDouble_FinderInfo> {
    fn from(v: &AppleSingleDouble_Entry_Body) -> Self {
        if let AppleSingleDouble_Entry_Body::AppleSingleDouble_FinderInfo(x) = v {
            return x.clone();
        }
        panic!("expected AppleSingleDouble_Entry_Body::AppleSingleDouble_FinderInfo, got {:?}", v)
    }
}
impl From<OptRc<AppleSingleDouble_FinderInfo>> for AppleSingleDouble_Entry_Body {
    fn from(v: OptRc<AppleSingleDouble_FinderInfo>) -> Self {
        Self::AppleSingleDouble_FinderInfo(v)
    }
}
impl From<&AppleSingleDouble_Entry_Body> for Vec<u8> {
    fn from(v: &AppleSingleDouble_Entry_Body) -> Self {
        if let AppleSingleDouble_Entry_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected AppleSingleDouble_Entry_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for AppleSingleDouble_Entry_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl KStruct for AppleSingleDouble_Entry {
    type Root = AppleSingleDouble;
    type Parent = AppleSingleDouble;

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
        *self_rc.type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        *self_rc.ofs_body.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.len_body.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl AppleSingleDouble_Entry {
    pub fn body(
        &self
    ) -> KResult<Ref<'_, Option<AppleSingleDouble_Entry_Body>>> {
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
            AppleSingleDouble_Entry_Types::FinderInfo => {
                *self.body_raw.borrow_mut() = _io.read_bytes(*self.len_body() as usize)?.into();
                let body_raw = self.body_raw.borrow();
                let _t_body_raw_io = BytesReader::from(body_raw.clone());
                let t = Self::read_into::<BytesReader, AppleSingleDouble_FinderInfo>(&_t_body_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
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
impl AppleSingleDouble_Entry {
    pub fn type(&self) -> Ref<'_, AppleSingleDouble_Entry_Types> {
        self.type.borrow()
    }
}
impl AppleSingleDouble_Entry {
    pub fn ofs_body(&self) -> Ref<'_, u32> {
        self.ofs_body.borrow()
    }
}
impl AppleSingleDouble_Entry {
    pub fn len_body(&self) -> Ref<'_, u32> {
        self.len_body.borrow()
    }
}
impl AppleSingleDouble_Entry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl AppleSingleDouble_Entry {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum AppleSingleDouble_Entry_Types {
    DataFork,
    ResourceFork,

    /**
     * File name on a file system that supports all the attributes.
     */
    RealName,
    Comment,
    IconBw,
    IconColor,

    /**
     * File creation, modification, access date/timestamps.
     */
    FileDatesInfo,
    FinderInfo,
    MacintoshFileInfo,
    ProdosFileInfo,
    MsdosFileInfo,
    AfpShortName,
    AfpFileInfo,
    AfpDirectoryId,
    Unknown(i64),
}

impl TryFrom<i64> for AppleSingleDouble_Entry_Types {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<AppleSingleDouble_Entry_Types> {
        match flag {
            1 => Ok(AppleSingleDouble_Entry_Types::DataFork),
            2 => Ok(AppleSingleDouble_Entry_Types::ResourceFork),
            3 => Ok(AppleSingleDouble_Entry_Types::RealName),
            4 => Ok(AppleSingleDouble_Entry_Types::Comment),
            5 => Ok(AppleSingleDouble_Entry_Types::IconBw),
            6 => Ok(AppleSingleDouble_Entry_Types::IconColor),
            8 => Ok(AppleSingleDouble_Entry_Types::FileDatesInfo),
            9 => Ok(AppleSingleDouble_Entry_Types::FinderInfo),
            10 => Ok(AppleSingleDouble_Entry_Types::MacintoshFileInfo),
            11 => Ok(AppleSingleDouble_Entry_Types::ProdosFileInfo),
            12 => Ok(AppleSingleDouble_Entry_Types::MsdosFileInfo),
            13 => Ok(AppleSingleDouble_Entry_Types::AfpShortName),
            14 => Ok(AppleSingleDouble_Entry_Types::AfpFileInfo),
            15 => Ok(AppleSingleDouble_Entry_Types::AfpDirectoryId),
            _ => Ok(AppleSingleDouble_Entry_Types::Unknown(flag)),
        }
    }
}

impl From<&AppleSingleDouble_Entry_Types> for i64 {
    fn from(v: &AppleSingleDouble_Entry_Types) -> Self {
        match *v {
            AppleSingleDouble_Entry_Types::DataFork => 1,
            AppleSingleDouble_Entry_Types::ResourceFork => 2,
            AppleSingleDouble_Entry_Types::RealName => 3,
            AppleSingleDouble_Entry_Types::Comment => 4,
            AppleSingleDouble_Entry_Types::IconBw => 5,
            AppleSingleDouble_Entry_Types::IconColor => 6,
            AppleSingleDouble_Entry_Types::FileDatesInfo => 8,
            AppleSingleDouble_Entry_Types::FinderInfo => 9,
            AppleSingleDouble_Entry_Types::MacintoshFileInfo => 10,
            AppleSingleDouble_Entry_Types::ProdosFileInfo => 11,
            AppleSingleDouble_Entry_Types::MsdosFileInfo => 12,
            AppleSingleDouble_Entry_Types::AfpShortName => 13,
            AppleSingleDouble_Entry_Types::AfpFileInfo => 14,
            AppleSingleDouble_Entry_Types::AfpDirectoryId => 15,
            AppleSingleDouble_Entry_Types::Unknown(v) => v
        }
    }
}

impl Default for AppleSingleDouble_Entry_Types {
    fn default() -> Self { AppleSingleDouble_Entry_Types::Unknown(0) }
}


/**
 * Information specific to Finder
 * \sa older Inside Macintosh, Volume II page 84 or Volume IV page 104.
 */

#[derive(Default, Debug, Clone)]
pub struct AppleSingleDouble_FinderInfo {
    pub _root: SharedType<AppleSingleDouble>,
    pub _parent: SharedType<AppleSingleDouble_Entry>,
    pub _self: SharedType<Self>,
    file_type: RefCell<Vec<u8>>,
    file_creator: RefCell<Vec<u8>>,
    flags: RefCell<u16>,
    location: RefCell<OptRc<AppleSingleDouble_Point>>,
    folder_id: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AppleSingleDouble_FinderInfo {
    type Root = AppleSingleDouble;
    type Parent = AppleSingleDouble_Entry;

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
        *self_rc.file_type.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        *self_rc.file_creator.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        *self_rc.flags.borrow_mut() = _io.read_u2be()?.into();
        let t = Self::read_into::<_, AppleSingleDouble_Point>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.location.borrow_mut() = t;
        *self_rc.folder_id.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl AppleSingleDouble_FinderInfo {
}
impl AppleSingleDouble_FinderInfo {
    pub fn file_type(&self) -> Ref<'_, Vec<u8>> {
        self.file_type.borrow()
    }
}
impl AppleSingleDouble_FinderInfo {
    pub fn file_creator(&self) -> Ref<'_, Vec<u8>> {
        self.file_creator.borrow()
    }
}
impl AppleSingleDouble_FinderInfo {
    pub fn flags(&self) -> Ref<'_, u16> {
        self.flags.borrow()
    }
}

/**
 * File icon's coordinates when displaying this folder.
 */
impl AppleSingleDouble_FinderInfo {
    pub fn location(&self) -> Ref<'_, OptRc<AppleSingleDouble_Point>> {
        self.location.borrow()
    }
}

/**
 * File folder ID (=window).
 */
impl AppleSingleDouble_FinderInfo {
    pub fn folder_id(&self) -> Ref<'_, u16> {
        self.folder_id.borrow()
    }
}
impl AppleSingleDouble_FinderInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Specifies 2D coordinate in QuickDraw grid.
 */

#[derive(Default, Debug, Clone)]
pub struct AppleSingleDouble_Point {
    pub _root: SharedType<AppleSingleDouble>,
    pub _parent: SharedType<AppleSingleDouble_FinderInfo>,
    pub _self: SharedType<Self>,
    x: RefCell<u16>,
    y: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AppleSingleDouble_Point {
    type Root = AppleSingleDouble;
    type Parent = AppleSingleDouble_FinderInfo;

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
        *self_rc.x.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.y.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl AppleSingleDouble_Point {
}
impl AppleSingleDouble_Point {
    pub fn x(&self) -> Ref<'_, u16> {
        self.x.borrow()
    }
}
impl AppleSingleDouble_Point {
    pub fn y(&self) -> Ref<'_, u16> {
        self.y.borrow()
    }
}
impl AppleSingleDouble_Point {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

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
use super::windows_shell_items::WindowsShellItems;

/**
 * Windows .lnk files (AKA "shell link" file) are most frequently used
 * in Windows shell to create "shortcuts" to another files, usually for
 * purposes of running a program from some other directory, sometimes
 * with certain preconfigured arguments and some other options.
 * \sa https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf Source
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsLnkFile {
    pub _root: SharedType<WindowsLnkFile>,
    pub _parent: SharedType<WindowsLnkFile>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<WindowsLnkFile_FileHeader>>,
    target_id_list: RefCell<OptRc<WindowsLnkFile_LinkTargetIdList>>,
    info: RefCell<OptRc<WindowsLnkFile_LinkInfo>>,
    name: RefCell<OptRc<WindowsLnkFile_StringData>>,
    rel_path: RefCell<OptRc<WindowsLnkFile_StringData>>,
    work_dir: RefCell<OptRc<WindowsLnkFile_StringData>>,
    arguments: RefCell<OptRc<WindowsLnkFile_StringData>>,
    icon_location: RefCell<OptRc<WindowsLnkFile_StringData>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for WindowsLnkFile {
    type Root = WindowsLnkFile;
    type Parent = WindowsLnkFile;

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
        let t = Self::read_into::<_, WindowsLnkFile_FileHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        if *self_rc.header().flags().has_link_target_id_list() {
            let t = Self::read_into::<_, WindowsLnkFile_LinkTargetIdList>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.target_id_list.borrow_mut() = t;
        }
        if *self_rc.header().flags().has_link_info() {
            let t = Self::read_into::<_, WindowsLnkFile_LinkInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.info.borrow_mut() = t;
        }
        if *self_rc.header().flags().has_name() {
            let t = Self::read_into::<_, WindowsLnkFile_StringData>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.name.borrow_mut() = t;
        }
        if *self_rc.header().flags().has_rel_path() {
            let t = Self::read_into::<_, WindowsLnkFile_StringData>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.rel_path.borrow_mut() = t;
        }
        if *self_rc.header().flags().has_work_dir() {
            let t = Self::read_into::<_, WindowsLnkFile_StringData>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.work_dir.borrow_mut() = t;
        }
        if *self_rc.header().flags().has_arguments() {
            let t = Self::read_into::<_, WindowsLnkFile_StringData>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.arguments.borrow_mut() = t;
        }
        if *self_rc.header().flags().has_icon_location() {
            let t = Self::read_into::<_, WindowsLnkFile_StringData>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.icon_location.borrow_mut() = t;
        }
        Ok(())
    }
}
impl WindowsLnkFile {
}
impl WindowsLnkFile {
    pub fn header(&self) -> Ref<'_, OptRc<WindowsLnkFile_FileHeader>> {
        self.header.borrow()
    }
}
impl WindowsLnkFile {
    pub fn target_id_list(&self) -> Ref<'_, OptRc<WindowsLnkFile_LinkTargetIdList>> {
        self.target_id_list.borrow()
    }
}
impl WindowsLnkFile {
    pub fn info(&self) -> Ref<'_, OptRc<WindowsLnkFile_LinkInfo>> {
        self.info.borrow()
    }
}
impl WindowsLnkFile {
    pub fn name(&self) -> Ref<'_, OptRc<WindowsLnkFile_StringData>> {
        self.name.borrow()
    }
}
impl WindowsLnkFile {
    pub fn rel_path(&self) -> Ref<'_, OptRc<WindowsLnkFile_StringData>> {
        self.rel_path.borrow()
    }
}
impl WindowsLnkFile {
    pub fn work_dir(&self) -> Ref<'_, OptRc<WindowsLnkFile_StringData>> {
        self.work_dir.borrow()
    }
}
impl WindowsLnkFile {
    pub fn arguments(&self) -> Ref<'_, OptRc<WindowsLnkFile_StringData>> {
        self.arguments.borrow()
    }
}
impl WindowsLnkFile {
    pub fn icon_location(&self) -> Ref<'_, OptRc<WindowsLnkFile_StringData>> {
        self.icon_location.borrow()
    }
}
impl WindowsLnkFile {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum WindowsLnkFile_DriveTypes {
    Unknown,
    NoRootDir,
    Removable,
    Fixed,
    Remote,
    Cdrom,
    Ramdisk,
    Unknown(i64),
}

impl TryFrom<i64> for WindowsLnkFile_DriveTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<WindowsLnkFile_DriveTypes> {
        match flag {
            0 => Ok(WindowsLnkFile_DriveTypes::Unknown),
            1 => Ok(WindowsLnkFile_DriveTypes::NoRootDir),
            2 => Ok(WindowsLnkFile_DriveTypes::Removable),
            3 => Ok(WindowsLnkFile_DriveTypes::Fixed),
            4 => Ok(WindowsLnkFile_DriveTypes::Remote),
            5 => Ok(WindowsLnkFile_DriveTypes::Cdrom),
            6 => Ok(WindowsLnkFile_DriveTypes::Ramdisk),
            _ => Ok(WindowsLnkFile_DriveTypes::Unknown(flag)),
        }
    }
}

impl From<&WindowsLnkFile_DriveTypes> for i64 {
    fn from(v: &WindowsLnkFile_DriveTypes) -> Self {
        match *v {
            WindowsLnkFile_DriveTypes::Unknown => 0,
            WindowsLnkFile_DriveTypes::NoRootDir => 1,
            WindowsLnkFile_DriveTypes::Removable => 2,
            WindowsLnkFile_DriveTypes::Fixed => 3,
            WindowsLnkFile_DriveTypes::Remote => 4,
            WindowsLnkFile_DriveTypes::Cdrom => 5,
            WindowsLnkFile_DriveTypes::Ramdisk => 6,
            WindowsLnkFile_DriveTypes::Unknown(v) => v
        }
    }
}

impl Default for WindowsLnkFile_DriveTypes {
    fn default() -> Self { WindowsLnkFile_DriveTypes::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum WindowsLnkFile_WindowState {
    Normal,
    Maximized,
    MinNoActive,
    Unknown(i64),
}

impl TryFrom<i64> for WindowsLnkFile_WindowState {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<WindowsLnkFile_WindowState> {
        match flag {
            1 => Ok(WindowsLnkFile_WindowState::Normal),
            3 => Ok(WindowsLnkFile_WindowState::Maximized),
            7 => Ok(WindowsLnkFile_WindowState::MinNoActive),
            _ => Ok(WindowsLnkFile_WindowState::Unknown(flag)),
        }
    }
}

impl From<&WindowsLnkFile_WindowState> for i64 {
    fn from(v: &WindowsLnkFile_WindowState) -> Self {
        match *v {
            WindowsLnkFile_WindowState::Normal => 1,
            WindowsLnkFile_WindowState::Maximized => 3,
            WindowsLnkFile_WindowState::MinNoActive => 7,
            WindowsLnkFile_WindowState::Unknown(v) => v
        }
    }
}

impl Default for WindowsLnkFile_WindowState {
    fn default() -> Self { WindowsLnkFile_WindowState::Unknown(0) }
}


/**
 * \sa https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf Section 2.1
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsLnkFile_FileHeader {
    pub _root: SharedType<WindowsLnkFile>,
    pub _parent: SharedType<WindowsLnkFile>,
    pub _self: SharedType<Self>,
    len_header: RefCell<Vec<u8>>,
    link_clsid: RefCell<Vec<u8>>,
    flags: RefCell<OptRc<WindowsLnkFile_LinkFlags>>,
    file_attrs: RefCell<u32>,
    time_creation: RefCell<u64>,
    time_access: RefCell<u64>,
    time_write: RefCell<u64>,
    target_file_size: RefCell<u32>,
    icon_index: RefCell<i32>,
    show_command: RefCell<WindowsLnkFile_WindowState>,
    hotkey: RefCell<u16>,
    reserved: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    flags_raw: RefCell<Vec<u8>>,
}
impl KStruct for WindowsLnkFile_FileHeader {
    type Root = WindowsLnkFile;
    type Parent = WindowsLnkFile;

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
        *self_rc.len_header.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.len_header() == vec![0x4cu8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/file_header/seq/0".to_string() }));
        }
        *self_rc.link_clsid.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        if !(*self_rc.link_clsid() == vec![0x1u8, 0x14u8, 0x2u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0xc0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x46u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/file_header/seq/1".to_string() }));
        }
        *self_rc.flags_raw.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        let flags_raw = self_rc.flags_raw.borrow();
        let _t_flags_raw_io = BytesReader::from(flags_raw.clone());
        let t = Self::read_into::<BytesReader, WindowsLnkFile_LinkFlags>(&_t_flags_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.flags.borrow_mut() = t;
        *self_rc.file_attrs.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.time_creation.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.time_access.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.time_write.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.target_file_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.icon_index.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.show_command.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        *self_rc.hotkey.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_bytes(10 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/file_header/seq/11".to_string() }));
        }
        Ok(())
    }
}
impl WindowsLnkFile_FileHeader {
}

/**
 * Technically, a size of the header, but in reality, it's
 * fixed by standard.
 */
impl WindowsLnkFile_FileHeader {
    pub fn len_header(&self) -> Ref<'_, Vec<u8>> {
        self.len_header.borrow()
    }
}

/**
 * 16-byte class identified (CLSID), reserved for Windows shell
 * link files.
 */
impl WindowsLnkFile_FileHeader {
    pub fn link_clsid(&self) -> Ref<'_, Vec<u8>> {
        self.link_clsid.borrow()
    }
}
impl WindowsLnkFile_FileHeader {
    pub fn flags(&self) -> Ref<'_, OptRc<WindowsLnkFile_LinkFlags>> {
        self.flags.borrow()
    }
}
impl WindowsLnkFile_FileHeader {
    pub fn file_attrs(&self) -> Ref<'_, u32> {
        self.file_attrs.borrow()
    }
}
impl WindowsLnkFile_FileHeader {
    pub fn time_creation(&self) -> Ref<'_, u64> {
        self.time_creation.borrow()
    }
}
impl WindowsLnkFile_FileHeader {
    pub fn time_access(&self) -> Ref<'_, u64> {
        self.time_access.borrow()
    }
}
impl WindowsLnkFile_FileHeader {
    pub fn time_write(&self) -> Ref<'_, u64> {
        self.time_write.borrow()
    }
}

/**
 * Lower 32 bits of the size of the file that this link targets
 */
impl WindowsLnkFile_FileHeader {
    pub fn target_file_size(&self) -> Ref<'_, u32> {
        self.target_file_size.borrow()
    }
}

/**
 * Index of an icon to use from target file
 */
impl WindowsLnkFile_FileHeader {
    pub fn icon_index(&self) -> Ref<'_, i32> {
        self.icon_index.borrow()
    }
}

/**
 * Window state to set after the launch of target executable
 */
impl WindowsLnkFile_FileHeader {
    pub fn show_command(&self) -> Ref<'_, WindowsLnkFile_WindowState> {
        self.show_command.borrow()
    }
}
impl WindowsLnkFile_FileHeader {
    pub fn hotkey(&self) -> Ref<'_, u16> {
        self.hotkey.borrow()
    }
}
impl WindowsLnkFile_FileHeader {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl WindowsLnkFile_FileHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl WindowsLnkFile_FileHeader {
    pub fn flags_raw(&self) -> Ref<'_, Vec<u8>> {
        self.flags_raw.borrow()
    }
}

/**
 * \sa https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf Section 2.1.1
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsLnkFile_LinkFlags {
    pub _root: SharedType<WindowsLnkFile>,
    pub _parent: SharedType<WindowsLnkFile_FileHeader>,
    pub _self: SharedType<Self>,
    is_unicode: RefCell<bool>,
    has_icon_location: RefCell<bool>,
    has_arguments: RefCell<bool>,
    has_work_dir: RefCell<bool>,
    has_rel_path: RefCell<bool>,
    has_name: RefCell<bool>,
    has_link_info: RefCell<bool>,
    has_link_target_id_list: RefCell<bool>,
    unnamed8: RefCell<u64>,
    reserved: RefCell<u64>,
    keep_local_id_list_for_unc_target: RefCell<bool>,
    unnamed11: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for WindowsLnkFile_LinkFlags {
    type Root = WindowsLnkFile;
    type Parent = WindowsLnkFile_FileHeader;

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
        *self_rc.is_unicode.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.has_icon_location.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.has_arguments.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.has_work_dir.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.has_rel_path.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.has_name.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.has_link_info.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.has_link_target_id_list.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.unnamed8.borrow_mut() = _io.read_bits_int_be(16)?;
        *self_rc.reserved.borrow_mut() = _io.read_bits_int_be(5)?;
        *self_rc.keep_local_id_list_for_unc_target.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.unnamed11.borrow_mut() = _io.read_bits_int_be(2)?;
        Ok(())
    }
}
impl WindowsLnkFile_LinkFlags {
}
impl WindowsLnkFile_LinkFlags {
    pub fn is_unicode(&self) -> Ref<'_, bool> {
        self.is_unicode.borrow()
    }
}
impl WindowsLnkFile_LinkFlags {
    pub fn has_icon_location(&self) -> Ref<'_, bool> {
        self.has_icon_location.borrow()
    }
}
impl WindowsLnkFile_LinkFlags {
    pub fn has_arguments(&self) -> Ref<'_, bool> {
        self.has_arguments.borrow()
    }
}
impl WindowsLnkFile_LinkFlags {
    pub fn has_work_dir(&self) -> Ref<'_, bool> {
        self.has_work_dir.borrow()
    }
}
impl WindowsLnkFile_LinkFlags {
    pub fn has_rel_path(&self) -> Ref<'_, bool> {
        self.has_rel_path.borrow()
    }
}
impl WindowsLnkFile_LinkFlags {
    pub fn has_name(&self) -> Ref<'_, bool> {
        self.has_name.borrow()
    }
}
impl WindowsLnkFile_LinkFlags {
    pub fn has_link_info(&self) -> Ref<'_, bool> {
        self.has_link_info.borrow()
    }
}
impl WindowsLnkFile_LinkFlags {
    pub fn has_link_target_id_list(&self) -> Ref<'_, bool> {
        self.has_link_target_id_list.borrow()
    }
}
impl WindowsLnkFile_LinkFlags {
    pub fn unnamed8(&self) -> Ref<'_, u64> {
        self.unnamed8.borrow()
    }
}
impl WindowsLnkFile_LinkFlags {
    pub fn reserved(&self) -> Ref<'_, u64> {
        self.reserved.borrow()
    }
}
impl WindowsLnkFile_LinkFlags {
    pub fn keep_local_id_list_for_unc_target(&self) -> Ref<'_, bool> {
        self.keep_local_id_list_for_unc_target.borrow()
    }
}
impl WindowsLnkFile_LinkFlags {
    pub fn unnamed11(&self) -> Ref<'_, u64> {
        self.unnamed11.borrow()
    }
}
impl WindowsLnkFile_LinkFlags {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf Section 2.3
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsLnkFile_LinkInfo {
    pub _root: SharedType<WindowsLnkFile>,
    pub _parent: SharedType<WindowsLnkFile>,
    pub _self: SharedType<Self>,
    len_all: RefCell<u32>,
    all: RefCell<OptRc<WindowsLnkFile_LinkInfo_All>>,
    _io: RefCell<BytesReader>,
    all_raw: RefCell<Vec<u8>>,
}
impl KStruct for WindowsLnkFile_LinkInfo {
    type Root = WindowsLnkFile;
    type Parent = WindowsLnkFile;

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
        *self_rc.len_all.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.all_raw.borrow_mut() = _io.read_bytes(((*self_rc.len_all() as u32) - (4 as u32)) as usize)?.into();
        let all_raw = self_rc.all_raw.borrow();
        let _t_all_raw_io = BytesReader::from(all_raw.clone());
        let t = Self::read_into::<BytesReader, WindowsLnkFile_LinkInfo_All>(&_t_all_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.all.borrow_mut() = t;
        Ok(())
    }
}
impl WindowsLnkFile_LinkInfo {
}
impl WindowsLnkFile_LinkInfo {
    pub fn len_all(&self) -> Ref<'_, u32> {
        self.len_all.borrow()
    }
}
impl WindowsLnkFile_LinkInfo {
    pub fn all(&self) -> Ref<'_, OptRc<WindowsLnkFile_LinkInfo_All>> {
        self.all.borrow()
    }
}
impl WindowsLnkFile_LinkInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl WindowsLnkFile_LinkInfo {
    pub fn all_raw(&self) -> Ref<'_, Vec<u8>> {
        self.all_raw.borrow()
    }
}

/**
 * \sa https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf Section 2.3
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsLnkFile_LinkInfo_All {
    pub _root: SharedType<WindowsLnkFile>,
    pub _parent: SharedType<WindowsLnkFile_LinkInfo>,
    pub _self: SharedType<Self>,
    len_header: RefCell<u32>,
    header: RefCell<OptRc<WindowsLnkFile_LinkInfo_Header>>,
    _io: RefCell<BytesReader>,
    header_raw: RefCell<Vec<u8>>,
    f_local_base_path: Cell<bool>,
    local_base_path: RefCell<Vec<u8>>,
    f_volume_id: Cell<bool>,
    volume_id: RefCell<OptRc<WindowsLnkFile_LinkInfo_VolumeIdSpec>>,
}
impl KStruct for WindowsLnkFile_LinkInfo_All {
    type Root = WindowsLnkFile;
    type Parent = WindowsLnkFile_LinkInfo;

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
        *self_rc.len_header.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.header_raw.borrow_mut() = _io.read_bytes(((*self_rc.len_header() as u32) - (8 as u32)) as usize)?.into();
        let header_raw = self_rc.header_raw.borrow();
        let _t_header_raw_io = BytesReader::from(header_raw.clone());
        let t = Self::read_into::<BytesReader, WindowsLnkFile_LinkInfo_Header>(&_t_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        Ok(())
    }
}
impl WindowsLnkFile_LinkInfo_All {
    pub fn local_base_path(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_local_base_path.get() {
            return Ok(self.local_base_path.borrow());
        }
        self.f_local_base_path.set(true);
        if *self.header().flags().has_volume_id_and_local_base_path() {
            let _pos = _io.pos();
            _io.seek(((*self.header().ofs_local_base_path() as u32) - (4 as u32)) as usize)?;
            *self.local_base_path.borrow_mut() = _io.read_bytes_term(0, false, true, true)?.into();
            _io.seek(_pos)?;
        }
        Ok(self.local_base_path.borrow())
    }
    pub fn volume_id(
        &self
    ) -> KResult<Ref<'_, OptRc<WindowsLnkFile_LinkInfo_VolumeIdSpec>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_volume_id.get() {
            return Ok(self.volume_id.borrow());
        }
        if *self.header().flags().has_volume_id_and_local_base_path() {
            let _pos = _io.pos();
            _io.seek(((*self.header().ofs_volume_id() as u32) - (4 as u32)) as usize)?;
            let t = Self::read_into::<_, WindowsLnkFile_LinkInfo_VolumeIdSpec>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.volume_id.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.volume_id.borrow())
    }
}
impl WindowsLnkFile_LinkInfo_All {
    pub fn len_header(&self) -> Ref<'_, u32> {
        self.len_header.borrow()
    }
}
impl WindowsLnkFile_LinkInfo_All {
    pub fn header(&self) -> Ref<'_, OptRc<WindowsLnkFile_LinkInfo_Header>> {
        self.header.borrow()
    }
}
impl WindowsLnkFile_LinkInfo_All {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl WindowsLnkFile_LinkInfo_All {
    pub fn header_raw(&self) -> Ref<'_, Vec<u8>> {
        self.header_raw.borrow()
    }
}

/**
 * \sa https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf Section 2.3
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsLnkFile_LinkInfo_Header {
    pub _root: SharedType<WindowsLnkFile>,
    pub _parent: SharedType<WindowsLnkFile_LinkInfo_All>,
    pub _self: SharedType<Self>,
    flags: RefCell<OptRc<WindowsLnkFile_LinkInfo_LinkInfoFlags>>,
    ofs_volume_id: RefCell<u32>,
    ofs_local_base_path: RefCell<u32>,
    ofs_common_net_rel_link: RefCell<u32>,
    ofs_common_path_suffix: RefCell<u32>,
    ofs_local_base_path_unicode: RefCell<u32>,
    ofs_common_path_suffix_unicode: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for WindowsLnkFile_LinkInfo_Header {
    type Root = WindowsLnkFile;
    type Parent = WindowsLnkFile_LinkInfo_All;

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
        let t = Self::read_into::<_, WindowsLnkFile_LinkInfo_LinkInfoFlags>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.flags.borrow_mut() = t;
        *self_rc.ofs_volume_id.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_local_base_path.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_common_net_rel_link.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_common_path_suffix.borrow_mut() = _io.read_u4le()?.into();
        if !(_io.is_eof()) {
            *self_rc.ofs_local_base_path_unicode.borrow_mut() = _io.read_u4le()?.into();
        }
        if !(_io.is_eof()) {
            *self_rc.ofs_common_path_suffix_unicode.borrow_mut() = _io.read_u4le()?.into();
        }
        Ok(())
    }
}
impl WindowsLnkFile_LinkInfo_Header {
}
impl WindowsLnkFile_LinkInfo_Header {
    pub fn flags(&self) -> Ref<'_, OptRc<WindowsLnkFile_LinkInfo_LinkInfoFlags>> {
        self.flags.borrow()
    }
}
impl WindowsLnkFile_LinkInfo_Header {
    pub fn ofs_volume_id(&self) -> Ref<'_, u32> {
        self.ofs_volume_id.borrow()
    }
}
impl WindowsLnkFile_LinkInfo_Header {
    pub fn ofs_local_base_path(&self) -> Ref<'_, u32> {
        self.ofs_local_base_path.borrow()
    }
}
impl WindowsLnkFile_LinkInfo_Header {
    pub fn ofs_common_net_rel_link(&self) -> Ref<'_, u32> {
        self.ofs_common_net_rel_link.borrow()
    }
}
impl WindowsLnkFile_LinkInfo_Header {
    pub fn ofs_common_path_suffix(&self) -> Ref<'_, u32> {
        self.ofs_common_path_suffix.borrow()
    }
}
impl WindowsLnkFile_LinkInfo_Header {
    pub fn ofs_local_base_path_unicode(&self) -> Ref<'_, u32> {
        self.ofs_local_base_path_unicode.borrow()
    }
}
impl WindowsLnkFile_LinkInfo_Header {
    pub fn ofs_common_path_suffix_unicode(&self) -> Ref<'_, u32> {
        self.ofs_common_path_suffix_unicode.borrow()
    }
}
impl WindowsLnkFile_LinkInfo_Header {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf Section 2.3
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsLnkFile_LinkInfo_LinkInfoFlags {
    pub _root: SharedType<WindowsLnkFile>,
    pub _parent: SharedType<WindowsLnkFile_LinkInfo_Header>,
    pub _self: SharedType<Self>,
    reserved1: RefCell<u64>,
    has_common_net_rel_link: RefCell<bool>,
    has_volume_id_and_local_base_path: RefCell<bool>,
    reserved2: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for WindowsLnkFile_LinkInfo_LinkInfoFlags {
    type Root = WindowsLnkFile;
    type Parent = WindowsLnkFile_LinkInfo_Header;

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
        *self_rc.reserved1.borrow_mut() = _io.read_bits_int_be(6)?;
        *self_rc.has_common_net_rel_link.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.has_volume_id_and_local_base_path.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.reserved2.borrow_mut() = _io.read_bits_int_be(24)?;
        Ok(())
    }
}
impl WindowsLnkFile_LinkInfo_LinkInfoFlags {
}
impl WindowsLnkFile_LinkInfo_LinkInfoFlags {
    pub fn reserved1(&self) -> Ref<'_, u64> {
        self.reserved1.borrow()
    }
}
impl WindowsLnkFile_LinkInfo_LinkInfoFlags {
    pub fn has_common_net_rel_link(&self) -> Ref<'_, bool> {
        self.has_common_net_rel_link.borrow()
    }
}
impl WindowsLnkFile_LinkInfo_LinkInfoFlags {
    pub fn has_volume_id_and_local_base_path(&self) -> Ref<'_, bool> {
        self.has_volume_id_and_local_base_path.borrow()
    }
}
impl WindowsLnkFile_LinkInfo_LinkInfoFlags {
    pub fn reserved2(&self) -> Ref<'_, u64> {
        self.reserved2.borrow()
    }
}
impl WindowsLnkFile_LinkInfo_LinkInfoFlags {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf Section 2.3.1
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsLnkFile_LinkInfo_VolumeIdBody {
    pub _root: SharedType<WindowsLnkFile>,
    pub _parent: SharedType<WindowsLnkFile_LinkInfo_VolumeIdSpec>,
    pub _self: SharedType<Self>,
    drive_type: RefCell<WindowsLnkFile_DriveTypes>,
    drive_serial_number: RefCell<u32>,
    ofs_volume_label: RefCell<u32>,
    ofs_volume_label_unicode: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_is_unicode: Cell<bool>,
    is_unicode: RefCell<bool>,
    f_volume_label_ansi: Cell<bool>,
    volume_label_ansi: RefCell<String>,
}
impl KStruct for WindowsLnkFile_LinkInfo_VolumeIdBody {
    type Root = WindowsLnkFile;
    type Parent = WindowsLnkFile_LinkInfo_VolumeIdSpec;

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
        *self_rc.drive_type.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        *self_rc.drive_serial_number.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_volume_label.borrow_mut() = _io.read_u4le()?.into();
        if *self_rc.is_unicode()? {
            *self_rc.ofs_volume_label_unicode.borrow_mut() = _io.read_u4le()?.into();
        }
        Ok(())
    }
}
impl WindowsLnkFile_LinkInfo_VolumeIdBody {
    pub fn is_unicode(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_unicode.get() {
            return Ok(self.is_unicode.borrow());
        }
        self.f_is_unicode.set(true);
        *self.is_unicode.borrow_mut() = (((*self.ofs_volume_label() as u32) == (20 as u32))) as bool;
        Ok(self.is_unicode.borrow())
    }
    pub fn volume_label_ansi(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_volume_label_ansi.get() {
            return Ok(self.volume_label_ansi.borrow());
        }
        self.f_volume_label_ansi.set(true);
        if !(*self.is_unicode()?) {
            let _pos = _io.pos();
            _io.seek(((*self.ofs_volume_label() as u32) - (4 as u32)) as usize)?;
            *self.volume_label_ansi.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "IBM437")?;
            _io.seek(_pos)?;
        }
        Ok(self.volume_label_ansi.borrow())
    }
}
impl WindowsLnkFile_LinkInfo_VolumeIdBody {
    pub fn drive_type(&self) -> Ref<'_, WindowsLnkFile_DriveTypes> {
        self.drive_type.borrow()
    }
}
impl WindowsLnkFile_LinkInfo_VolumeIdBody {
    pub fn drive_serial_number(&self) -> Ref<'_, u32> {
        self.drive_serial_number.borrow()
    }
}
impl WindowsLnkFile_LinkInfo_VolumeIdBody {
    pub fn ofs_volume_label(&self) -> Ref<'_, u32> {
        self.ofs_volume_label.borrow()
    }
}
impl WindowsLnkFile_LinkInfo_VolumeIdBody {
    pub fn ofs_volume_label_unicode(&self) -> Ref<'_, u32> {
        self.ofs_volume_label_unicode.borrow()
    }
}
impl WindowsLnkFile_LinkInfo_VolumeIdBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf Section 2.3.1
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsLnkFile_LinkInfo_VolumeIdSpec {
    pub _root: SharedType<WindowsLnkFile>,
    pub _parent: SharedType<WindowsLnkFile_LinkInfo_All>,
    pub _self: SharedType<Self>,
    len_all: RefCell<u32>,
    body: RefCell<OptRc<WindowsLnkFile_LinkInfo_VolumeIdBody>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
}
impl KStruct for WindowsLnkFile_LinkInfo_VolumeIdSpec {
    type Root = WindowsLnkFile;
    type Parent = WindowsLnkFile_LinkInfo_All;

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
        *self_rc.len_all.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.body_raw.borrow_mut() = _io.read_bytes(((*self_rc.len_all() as u32) - (4 as u32)) as usize)?.into();
        let body_raw = self_rc.body_raw.borrow();
        let _t_body_raw_io = BytesReader::from(body_raw.clone());
        let t = Self::read_into::<BytesReader, WindowsLnkFile_LinkInfo_VolumeIdBody>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.body.borrow_mut() = t;
        Ok(())
    }
}
impl WindowsLnkFile_LinkInfo_VolumeIdSpec {
}
impl WindowsLnkFile_LinkInfo_VolumeIdSpec {
    pub fn len_all(&self) -> Ref<'_, u32> {
        self.len_all.borrow()
    }
}
impl WindowsLnkFile_LinkInfo_VolumeIdSpec {
    pub fn body(&self) -> Ref<'_, OptRc<WindowsLnkFile_LinkInfo_VolumeIdBody>> {
        self.body.borrow()
    }
}
impl WindowsLnkFile_LinkInfo_VolumeIdSpec {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl WindowsLnkFile_LinkInfo_VolumeIdSpec {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}

/**
 * \sa https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf Section 2.2
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsLnkFile_LinkTargetIdList {
    pub _root: SharedType<WindowsLnkFile>,
    pub _parent: SharedType<WindowsLnkFile>,
    pub _self: SharedType<Self>,
    len_id_list: RefCell<u16>,
    id_list: RefCell<OptRc<WindowsShellItems>>,
    _io: RefCell<BytesReader>,
    id_list_raw: RefCell<Vec<u8>>,
}
impl KStruct for WindowsLnkFile_LinkTargetIdList {
    type Root = WindowsLnkFile;
    type Parent = WindowsLnkFile;

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
        *self_rc.len_id_list.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.id_list_raw.borrow_mut() = _io.read_bytes(*self_rc.len_id_list() as usize)?.into();
        let id_list_raw = self_rc.id_list_raw.borrow();
        let _t_id_list_raw_io = BytesReader::from(id_list_raw.clone());
        let t = Self::read_into::<BytesReader, WindowsShellItems>(&_t_id_list_raw_io, None, None)?.into();
        *self_rc.id_list.borrow_mut() = t;
        Ok(())
    }
}
impl WindowsLnkFile_LinkTargetIdList {
}
impl WindowsLnkFile_LinkTargetIdList {
    pub fn len_id_list(&self) -> Ref<'_, u16> {
        self.len_id_list.borrow()
    }
}
impl WindowsLnkFile_LinkTargetIdList {
    pub fn id_list(&self) -> Ref<'_, OptRc<WindowsShellItems>> {
        self.id_list.borrow()
    }
}
impl WindowsLnkFile_LinkTargetIdList {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl WindowsLnkFile_LinkTargetIdList {
    pub fn id_list_raw(&self) -> Ref<'_, Vec<u8>> {
        self.id_list_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct WindowsLnkFile_StringData {
    pub _root: SharedType<WindowsLnkFile>,
    pub _parent: SharedType<WindowsLnkFile>,
    pub _self: SharedType<Self>,
    chars_str: RefCell<u16>,
    str: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for WindowsLnkFile_StringData {
    type Root = WindowsLnkFile;
    type Parent = WindowsLnkFile;

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
        *self_rc.chars_str.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.str.borrow_mut() = bytes_to_str(&_io.read_bytes(((*self_rc.chars_str() as u16) * (2 as u16)) as usize)?.into(), "UTF-16LE")?;
        Ok(())
    }
}
impl WindowsLnkFile_StringData {
}
impl WindowsLnkFile_StringData {
    pub fn chars_str(&self) -> Ref<'_, u16> {
        self.chars_str.borrow()
    }
}
impl WindowsLnkFile_StringData {
    pub fn str(&self) -> Ref<'_, String> {
        self.str.borrow()
    }
}
impl WindowsLnkFile_StringData {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

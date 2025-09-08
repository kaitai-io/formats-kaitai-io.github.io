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
 * Windows Shell Items (AKA "shellbags") is an undocumented set of
 * structures used internally within Windows to identify paths in
 * Windows Folder Hierarchy. It is widely used in Windows Shell (and
 * most visible in File Explorer), both as in-memory and in-file
 * structures. Some formats embed them, namely:
 * 
 * * Windows Shell link files (.lnk) Windows registry
 * * Windows registry "ShellBags" keys
 * 
 * The format is mostly undocumented, and is known to vary between
 * various Windows versions.
 * \sa https://github.com/libyal/libfwsi/blob/main/documentation/Windows%20Shell%20Item%20format.asciidoc Source
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsShellItems {
    pub _root: SharedType<WindowsShellItems>,
    pub _parent: SharedType<WindowsShellItems>,
    pub _self: SharedType<Self>,
    items: RefCell<Vec<OptRc<WindowsShellItems_ShellItem>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for WindowsShellItems {
    type Root = WindowsShellItems;
    type Parent = WindowsShellItems;

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
        *self_rc.items.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let t = Self::read_into::<_, WindowsShellItems_ShellItem>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.items.borrow_mut().push(t);
                let _t_items = self_rc.items.borrow();
                let _tmpa = _t_items.last().unwrap();
                _i += 1;
                let x = !(((*_tmpa.len_data() as u16) == (0 as u16)));
                x
            } {}
        }
        Ok(())
    }
}
impl WindowsShellItems {
}

/**
 * \sa https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf Section 2.2.1
 */
impl WindowsShellItems {
    pub fn items(&self) -> Ref<'_, Vec<OptRc<WindowsShellItems_ShellItem>>> {
        self.items.borrow()
    }
}
impl WindowsShellItems {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://github.com/libyal/libfwsi/blob/main/documentation/Windows%20Shell%20Item%20format.asciidoc#34-file-entry-shell-item Source
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsShellItems_FileEntryBody {
    pub _root: SharedType<WindowsShellItems>,
    pub _parent: SharedType<WindowsShellItems_ShellItemData>,
    pub _self: SharedType<Self>,
    unnamed0: RefCell<u8>,
    file_size: RefCell<u32>,
    last_mod_time: RefCell<u32>,
    file_attrs: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_is_dir: Cell<bool>,
    is_dir: RefCell<bool>,
    f_is_file: Cell<bool>,
    is_file: RefCell<bool>,
}
impl KStruct for WindowsShellItems_FileEntryBody {
    type Root = WindowsShellItems;
    type Parent = WindowsShellItems_ShellItemData;

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
        *self_rc.unnamed0.borrow_mut() = _io.read_u1()?.into();
        *self_rc.file_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.last_mod_time.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.file_attrs.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl WindowsShellItems_FileEntryBody {
    pub fn is_dir(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_dir.get() {
            return Ok(self.is_dir.borrow());
        }
        self.f_is_dir.set(true);
        *self.is_dir.borrow_mut() = (((((*_prc.as_ref().unwrap().code() as u8) & (1 as u8)) as i32) != (0 as i32))) as bool;
        Ok(self.is_dir.borrow())
    }
    pub fn is_file(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_file.get() {
            return Ok(self.is_file.borrow());
        }
        self.f_is_file.set(true);
        *self.is_file.borrow_mut() = (((((*_prc.as_ref().unwrap().code() as u8) & (2 as u8)) as i32) != (0 as i32))) as bool;
        Ok(self.is_file.borrow())
    }
}
impl WindowsShellItems_FileEntryBody {
    pub fn unnamed0(&self) -> Ref<'_, u8> {
        self.unnamed0.borrow()
    }
}
impl WindowsShellItems_FileEntryBody {
    pub fn file_size(&self) -> Ref<'_, u32> {
        self.file_size.borrow()
    }
}
impl WindowsShellItems_FileEntryBody {
    pub fn last_mod_time(&self) -> Ref<'_, u32> {
        self.last_mod_time.borrow()
    }
}
impl WindowsShellItems_FileEntryBody {
    pub fn file_attrs(&self) -> Ref<'_, u16> {
        self.file_attrs.borrow()
    }
}
impl WindowsShellItems_FileEntryBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://github.com/libyal/libfwsi/blob/main/documentation/Windows%20Shell%20Item%20format.asciidoc#32-root-folder-shell-item Source
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsShellItems_RootFolderBody {
    pub _root: SharedType<WindowsShellItems>,
    pub _parent: SharedType<WindowsShellItems_ShellItemData>,
    pub _self: SharedType<Self>,
    sort_index: RefCell<u8>,
    shell_folder_id: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for WindowsShellItems_RootFolderBody {
    type Root = WindowsShellItems;
    type Parent = WindowsShellItems_ShellItemData;

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
        *self_rc.sort_index.borrow_mut() = _io.read_u1()?.into();
        *self_rc.shell_folder_id.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        Ok(())
    }
}
impl WindowsShellItems_RootFolderBody {
}
impl WindowsShellItems_RootFolderBody {
    pub fn sort_index(&self) -> Ref<'_, u8> {
        self.sort_index.borrow()
    }
}
impl WindowsShellItems_RootFolderBody {
    pub fn shell_folder_id(&self) -> Ref<'_, Vec<u8>> {
        self.shell_folder_id.borrow()
    }
}
impl WindowsShellItems_RootFolderBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf Section 2.2.2
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsShellItems_ShellItem {
    pub _root: SharedType<WindowsShellItems>,
    pub _parent: SharedType<WindowsShellItems>,
    pub _self: SharedType<Self>,
    len_data: RefCell<u16>,
    data: RefCell<OptRc<WindowsShellItems_ShellItemData>>,
    _io: RefCell<BytesReader>,
    data_raw: RefCell<Vec<u8>>,
}
impl KStruct for WindowsShellItems_ShellItem {
    type Root = WindowsShellItems;
    type Parent = WindowsShellItems;

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
        *self_rc.len_data.borrow_mut() = _io.read_u2le()?.into();
        if ((*self_rc.len_data() as u16) >= (2 as u16)) {
            *self_rc.data_raw.borrow_mut() = _io.read_bytes(((*self_rc.len_data() as u16) - (2 as u16)) as usize)?.into();
            let data_raw = self_rc.data_raw.borrow();
            let _t_data_raw_io = BytesReader::from(data_raw.clone());
            let t = Self::read_into::<BytesReader, WindowsShellItems_ShellItemData>(&_t_data_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.data.borrow_mut() = t;
        }
        Ok(())
    }
}
impl WindowsShellItems_ShellItem {
}
impl WindowsShellItems_ShellItem {
    pub fn len_data(&self) -> Ref<'_, u16> {
        self.len_data.borrow()
    }
}
impl WindowsShellItems_ShellItem {
    pub fn data(&self) -> Ref<'_, OptRc<WindowsShellItems_ShellItemData>> {
        self.data.borrow()
    }
}
impl WindowsShellItems_ShellItem {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl WindowsShellItems_ShellItem {
    pub fn data_raw(&self) -> Ref<'_, Vec<u8>> {
        self.data_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct WindowsShellItems_ShellItemData {
    pub _root: SharedType<WindowsShellItems>,
    pub _parent: SharedType<WindowsShellItems_ShellItem>,
    pub _self: SharedType<Self>,
    code: RefCell<u8>,
    body1: RefCell<Option<WindowsShellItems_ShellItemData_Body1>>,
    body2: RefCell<Option<WindowsShellItems_ShellItemData_Body2>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum WindowsShellItems_ShellItemData_Body1 {
    WindowsShellItems_RootFolderBody(OptRc<WindowsShellItems_RootFolderBody>),
}
impl From<&WindowsShellItems_ShellItemData_Body1> for OptRc<WindowsShellItems_RootFolderBody> {
    fn from(v: &WindowsShellItems_ShellItemData_Body1) -> Self {
        if let WindowsShellItems_ShellItemData_Body1::WindowsShellItems_RootFolderBody(x) = v {
            return x.clone();
        }
        panic!("expected WindowsShellItems_ShellItemData_Body1::WindowsShellItems_RootFolderBody, got {:?}", v)
    }
}
impl From<OptRc<WindowsShellItems_RootFolderBody>> for WindowsShellItems_ShellItemData_Body1 {
    fn from(v: OptRc<WindowsShellItems_RootFolderBody>) -> Self {
        Self::WindowsShellItems_RootFolderBody(v)
    }
}
impl WindowsShellItems_ShellItemData_Body1 {
    pub fn sort_index(&self) -> Ref<'_, u8> {
        match self {
            WindowsShellItems_ShellItemData_Body1::WindowsShellItems_RootFolderBody(x) => x.sort_index.borrow(),
        }
    }
}
impl WindowsShellItems_ShellItemData_Body1 {
    pub fn shell_folder_id(&self) -> Ref<'_, Vec<u8>> {
        match self {
            WindowsShellItems_ShellItemData_Body1::WindowsShellItems_RootFolderBody(x) => x.shell_folder_id.borrow(),
        }
    }
}
#[derive(Debug, Clone)]
pub enum WindowsShellItems_ShellItemData_Body2 {
    WindowsShellItems_VolumeBody(OptRc<WindowsShellItems_VolumeBody>),
    WindowsShellItems_FileEntryBody(OptRc<WindowsShellItems_FileEntryBody>),
}
impl From<&WindowsShellItems_ShellItemData_Body2> for OptRc<WindowsShellItems_VolumeBody> {
    fn from(v: &WindowsShellItems_ShellItemData_Body2) -> Self {
        if let WindowsShellItems_ShellItemData_Body2::WindowsShellItems_VolumeBody(x) = v {
            return x.clone();
        }
        panic!("expected WindowsShellItems_ShellItemData_Body2::WindowsShellItems_VolumeBody, got {:?}", v)
    }
}
impl From<OptRc<WindowsShellItems_VolumeBody>> for WindowsShellItems_ShellItemData_Body2 {
    fn from(v: OptRc<WindowsShellItems_VolumeBody>) -> Self {
        Self::WindowsShellItems_VolumeBody(v)
    }
}
impl From<&WindowsShellItems_ShellItemData_Body2> for OptRc<WindowsShellItems_FileEntryBody> {
    fn from(v: &WindowsShellItems_ShellItemData_Body2) -> Self {
        if let WindowsShellItems_ShellItemData_Body2::WindowsShellItems_FileEntryBody(x) = v {
            return x.clone();
        }
        panic!("expected WindowsShellItems_ShellItemData_Body2::WindowsShellItems_FileEntryBody, got {:?}", v)
    }
}
impl From<OptRc<WindowsShellItems_FileEntryBody>> for WindowsShellItems_ShellItemData_Body2 {
    fn from(v: OptRc<WindowsShellItems_FileEntryBody>) -> Self {
        Self::WindowsShellItems_FileEntryBody(v)
    }
}
impl KStruct for WindowsShellItems_ShellItemData {
    type Root = WindowsShellItems;
    type Parent = WindowsShellItems_ShellItem;

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
        *self_rc.code.borrow_mut() = _io.read_u1()?.into();
        match *self_rc.code() {
            31 => {
                let t = Self::read_into::<_, WindowsShellItems_RootFolderBody>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body1.borrow_mut() = Some(t);
            }
            _ => {}
        }
        match ((*self_rc.code() as u8) & (112 as u8)) {
            32 => {
                let t = Self::read_into::<_, WindowsShellItems_VolumeBody>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body2.borrow_mut() = Some(t);
            }
            48 => {
                let t = Self::read_into::<_, WindowsShellItems_FileEntryBody>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body2.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl WindowsShellItems_ShellItemData {
}
impl WindowsShellItems_ShellItemData {
    pub fn code(&self) -> Ref<'_, u8> {
        self.code.borrow()
    }
}
impl WindowsShellItems_ShellItemData {
    pub fn body1(&self) -> Ref<'_, Option<WindowsShellItems_ShellItemData_Body1>> {
        self.body1.borrow()
    }
}
impl WindowsShellItems_ShellItemData {
    pub fn body2(&self) -> Ref<'_, Option<WindowsShellItems_ShellItemData_Body2>> {
        self.body2.borrow()
    }
}
impl WindowsShellItems_ShellItemData {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://github.com/libyal/libfwsi/blob/main/documentation/Windows%20Shell%20Item%20format.asciidoc#33-volume-shell-item Source
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsShellItems_VolumeBody {
    pub _root: SharedType<WindowsShellItems>,
    pub _parent: SharedType<WindowsShellItems_ShellItemData>,
    pub _self: SharedType<Self>,
    flags: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for WindowsShellItems_VolumeBody {
    type Root = WindowsShellItems;
    type Parent = WindowsShellItems_ShellItemData;

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
        *self_rc.flags.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl WindowsShellItems_VolumeBody {
}
impl WindowsShellItems_VolumeBody {
    pub fn flags(&self) -> Ref<'_, u8> {
        self.flags.borrow()
    }
}
impl WindowsShellItems_VolumeBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

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

#[derive(Default, Debug, Clone)]
pub struct FalloutDat {
    pub _root: SharedType<FalloutDat>,
    pub _parent: SharedType<FalloutDat>,
    pub _self: SharedType<Self>,
    folder_count: RefCell<u32>,
    unknown1: RefCell<u32>,
    unknown2: RefCell<u32>,
    timestamp: RefCell<u32>,
    folder_names: RefCell<Vec<OptRc<FalloutDat_Pstr>>>,
    folders: RefCell<Vec<OptRc<FalloutDat_Folder>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for FalloutDat {
    type Root = FalloutDat;
    type Parent = FalloutDat;

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
        *self_rc.folder_count.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.unknown1.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.unknown2.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.timestamp.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.folder_names.borrow_mut() = Vec::new();
        let l_folder_names = *self_rc.folder_count();
        for _i in 0..l_folder_names {
            let t = Self::read_into::<_, FalloutDat_Pstr>(&*_io, Some(self_rc._root.clone()), None)?.into();
            self_rc.folder_names.borrow_mut().push(t);
        }
        *self_rc.folders.borrow_mut() = Vec::new();
        let l_folders = *self_rc.folder_count();
        for _i in 0..l_folders {
            let t = Self::read_into::<_, FalloutDat_Folder>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.folders.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl FalloutDat {
}
impl FalloutDat {
    pub fn folder_count(&self) -> Ref<'_, u32> {
        self.folder_count.borrow()
    }
}
impl FalloutDat {
    pub fn unknown1(&self) -> Ref<'_, u32> {
        self.unknown1.borrow()
    }
}
impl FalloutDat {
    pub fn unknown2(&self) -> Ref<'_, u32> {
        self.unknown2.borrow()
    }
}
impl FalloutDat {
    pub fn timestamp(&self) -> Ref<'_, u32> {
        self.timestamp.borrow()
    }
}
impl FalloutDat {
    pub fn folder_names(&self) -> Ref<'_, Vec<OptRc<FalloutDat_Pstr>>> {
        self.folder_names.borrow()
    }
}
impl FalloutDat {
    pub fn folders(&self) -> Ref<'_, Vec<OptRc<FalloutDat_Folder>>> {
        self.folders.borrow()
    }
}
impl FalloutDat {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum FalloutDat_Compression {
    None,
    Lzss,
    Unknown(i64),
}

impl TryFrom<i64> for FalloutDat_Compression {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<FalloutDat_Compression> {
        match flag {
            32 => Ok(FalloutDat_Compression::None),
            64 => Ok(FalloutDat_Compression::Lzss),
            _ => Ok(FalloutDat_Compression::Unknown(flag)),
        }
    }
}

impl From<&FalloutDat_Compression> for i64 {
    fn from(v: &FalloutDat_Compression) -> Self {
        match *v {
            FalloutDat_Compression::None => 32,
            FalloutDat_Compression::Lzss => 64,
            FalloutDat_Compression::Unknown(v) => v
        }
    }
}

impl Default for FalloutDat_Compression {
    fn default() -> Self { FalloutDat_Compression::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct FalloutDat_File {
    pub _root: SharedType<FalloutDat>,
    pub _parent: SharedType<FalloutDat_Folder>,
    pub _self: SharedType<Self>,
    name: RefCell<OptRc<FalloutDat_Pstr>>,
    flags: RefCell<FalloutDat_Compression>,
    offset: RefCell<u32>,
    size_unpacked: RefCell<u32>,
    size_packed: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_contents: Cell<bool>,
    contents: RefCell<Vec<u8>>,
}
impl KStruct for FalloutDat_File {
    type Root = FalloutDat;
    type Parent = FalloutDat_Folder;

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
        let t = Self::read_into::<_, FalloutDat_Pstr>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.name.borrow_mut() = t;
        *self_rc.flags.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        *self_rc.offset.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.size_unpacked.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.size_packed.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl FalloutDat_File {
    pub fn contents(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_contents.get() {
            return Ok(self.contents.borrow());
        }
        self.f_contents.set(true);
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.offset() as usize)?;
        *self.contents.borrow_mut() = io.read_bytes(if *self.flags() == FalloutDat_Compression::None { *self.size_unpacked() } else { *self.size_packed() } as usize)?.into();
        io.seek(_pos)?;
        Ok(self.contents.borrow())
    }
}
impl FalloutDat_File {
    pub fn name(&self) -> Ref<'_, OptRc<FalloutDat_Pstr>> {
        self.name.borrow()
    }
}
impl FalloutDat_File {
    pub fn flags(&self) -> Ref<'_, FalloutDat_Compression> {
        self.flags.borrow()
    }
}
impl FalloutDat_File {
    pub fn offset(&self) -> Ref<'_, u32> {
        self.offset.borrow()
    }
}
impl FalloutDat_File {
    pub fn size_unpacked(&self) -> Ref<'_, u32> {
        self.size_unpacked.borrow()
    }
}
impl FalloutDat_File {
    pub fn size_packed(&self) -> Ref<'_, u32> {
        self.size_packed.borrow()
    }
}
impl FalloutDat_File {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct FalloutDat_Folder {
    pub _root: SharedType<FalloutDat>,
    pub _parent: SharedType<FalloutDat>,
    pub _self: SharedType<Self>,
    file_count: RefCell<u32>,
    unknown: RefCell<u32>,
    flags: RefCell<u32>,
    timestamp: RefCell<u32>,
    files: RefCell<Vec<OptRc<FalloutDat_File>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for FalloutDat_Folder {
    type Root = FalloutDat;
    type Parent = FalloutDat;

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
        *self_rc.file_count.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.unknown.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.flags.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.timestamp.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.files.borrow_mut() = Vec::new();
        let l_files = *self_rc.file_count();
        for _i in 0..l_files {
            let t = Self::read_into::<_, FalloutDat_File>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.files.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl FalloutDat_Folder {
}
impl FalloutDat_Folder {
    pub fn file_count(&self) -> Ref<'_, u32> {
        self.file_count.borrow()
    }
}
impl FalloutDat_Folder {
    pub fn unknown(&self) -> Ref<'_, u32> {
        self.unknown.borrow()
    }
}
impl FalloutDat_Folder {
    pub fn flags(&self) -> Ref<'_, u32> {
        self.flags.borrow()
    }
}
impl FalloutDat_Folder {
    pub fn timestamp(&self) -> Ref<'_, u32> {
        self.timestamp.borrow()
    }
}
impl FalloutDat_Folder {
    pub fn files(&self) -> Ref<'_, Vec<OptRc<FalloutDat_File>>> {
        self.files.borrow()
    }
}
impl FalloutDat_Folder {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct FalloutDat_Pstr {
    pub _root: SharedType<FalloutDat>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    size: RefCell<u8>,
    str: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for FalloutDat_Pstr {
    type Root = FalloutDat;
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
        *self_rc.size.borrow_mut() = _io.read_u1()?.into();
        *self_rc.str.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.size() as usize)?.into(), "ASCII")?;
        Ok(())
    }
}
impl FalloutDat_Pstr {
}
impl FalloutDat_Pstr {
    pub fn size(&self) -> Ref<'_, u8> {
        self.size.borrow()
    }
}
impl FalloutDat_Pstr {
    pub fn str(&self) -> Ref<'_, String> {
        self.str.borrow()
    }
}
impl FalloutDat_Pstr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

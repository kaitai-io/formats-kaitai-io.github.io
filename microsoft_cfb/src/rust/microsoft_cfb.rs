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
pub struct MicrosoftCfb {
    pub _root: SharedType<MicrosoftCfb>,
    pub _parent: SharedType<MicrosoftCfb>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<MicrosoftCfb_CfbHeader>>,
    _io: RefCell<BytesReader>,
    fat_raw: RefCell<Vec<u8>>,
    f_dir: Cell<bool>,
    dir: RefCell<OptRc<MicrosoftCfb_DirEntry>>,
    f_fat: Cell<bool>,
    fat: RefCell<OptRc<MicrosoftCfb_FatEntries>>,
    f_sector_size: Cell<bool>,
    sector_size: RefCell<i32>,
}
impl KStruct for MicrosoftCfb {
    type Root = MicrosoftCfb;
    type Parent = MicrosoftCfb;

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
        let t = Self::read_into::<_, MicrosoftCfb_CfbHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        Ok(())
    }
}
impl MicrosoftCfb {
    pub fn dir(
        &self
    ) -> KResult<Ref<'_, OptRc<MicrosoftCfb_DirEntry>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_dir.get() {
            return Ok(self.dir.borrow());
        }
        let _pos = _io.pos();
        _io.seek(((((*self.header().ofs_dir() as i32) + (1 as i32)) as i32) * (*self.sector_size()? as i32)) as usize)?;
        let t = Self::read_into::<_, MicrosoftCfb_DirEntry>(&*_io, Some(self._root.clone()), None)?.into();
        *self.dir.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.dir.borrow())
    }
    pub fn fat(
        &self
    ) -> KResult<Ref<'_, OptRc<MicrosoftCfb_FatEntries>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_fat.get() {
            return Ok(self.fat.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*self.sector_size()? as usize)?;
        *self.fat_raw.borrow_mut() = _io.read_bytes(((*self.header().size_fat() as i32) * (*self.sector_size()? as i32)) as usize)?.into();
        let fat_raw = self.fat_raw.borrow();
        let _t_fat_raw_io = BytesReader::from(fat_raw.clone());
        let t = Self::read_into::<BytesReader, MicrosoftCfb_FatEntries>(&_t_fat_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.fat.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.fat.borrow())
    }
    pub fn sector_size(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_sector_size.get() {
            return Ok(self.sector_size.borrow());
        }
        self.f_sector_size.set(true);
        *self.sector_size.borrow_mut() = (((1 as u16) << (*self.header().sector_shift() as u16))) as i32;
        Ok(self.sector_size.borrow())
    }
}
impl MicrosoftCfb {
    pub fn header(&self) -> Ref<'_, OptRc<MicrosoftCfb_CfbHeader>> {
        self.header.borrow()
    }
}
impl MicrosoftCfb {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl MicrosoftCfb {
    pub fn fat_raw(&self) -> Ref<'_, Vec<u8>> {
        self.fat_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MicrosoftCfb_CfbHeader {
    pub _root: SharedType<MicrosoftCfb>,
    pub _parent: SharedType<MicrosoftCfb>,
    pub _self: SharedType<Self>,
    signature: RefCell<Vec<u8>>,
    clsid: RefCell<Vec<u8>>,
    version_minor: RefCell<u16>,
    version_major: RefCell<u16>,
    byte_order: RefCell<Vec<u8>>,
    sector_shift: RefCell<u16>,
    mini_sector_shift: RefCell<u16>,
    reserved1: RefCell<Vec<u8>>,
    size_dir: RefCell<i32>,
    size_fat: RefCell<i32>,
    ofs_dir: RefCell<i32>,
    transaction_seq: RefCell<i32>,
    mini_stream_cutoff_size: RefCell<i32>,
    ofs_mini_fat: RefCell<i32>,
    size_mini_fat: RefCell<i32>,
    ofs_difat: RefCell<i32>,
    size_difat: RefCell<i32>,
    difat: RefCell<Vec<i32>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MicrosoftCfb_CfbHeader {
    type Root = MicrosoftCfb;
    type Parent = MicrosoftCfb;

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
        *self_rc.signature.borrow_mut() = _io.read_bytes(8 as usize)?.into();
        if !(*self_rc.signature() == vec![0xd0u8, 0xcfu8, 0x11u8, 0xe0u8, 0xa1u8, 0xb1u8, 0x1au8, 0xe1u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/cfb_header/seq/0".to_string() }));
        }
        *self_rc.clsid.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        if !(*self_rc.clsid() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/cfb_header/seq/1".to_string() }));
        }
        *self_rc.version_minor.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.version_major.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.byte_order.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.byte_order() == vec![0xfeu8, 0xffu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/cfb_header/seq/4".to_string() }));
        }
        *self_rc.sector_shift.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.mini_sector_shift.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.reserved1.borrow_mut() = _io.read_bytes(6 as usize)?.into();
        *self_rc.size_dir.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.size_fat.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.ofs_dir.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.transaction_seq.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.mini_stream_cutoff_size.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.ofs_mini_fat.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.size_mini_fat.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.ofs_difat.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.size_difat.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.difat.borrow_mut() = Vec::new();
        let l_difat = 109;
        for _i in 0..l_difat {
            self_rc.difat.borrow_mut().push(_io.read_s4le()?.into());
        }
        Ok(())
    }
}
impl MicrosoftCfb_CfbHeader {
}

/**
 * Magic bytes that confirm that this is a CFB file
 */
impl MicrosoftCfb_CfbHeader {
    pub fn signature(&self) -> Ref<'_, Vec<u8>> {
        self.signature.borrow()
    }
}

/**
 * Reserved class ID field, must be all 0
 */
impl MicrosoftCfb_CfbHeader {
    pub fn clsid(&self) -> Ref<'_, Vec<u8>> {
        self.clsid.borrow()
    }
}
impl MicrosoftCfb_CfbHeader {
    pub fn version_minor(&self) -> Ref<'_, u16> {
        self.version_minor.borrow()
    }
}
impl MicrosoftCfb_CfbHeader {
    pub fn version_major(&self) -> Ref<'_, u16> {
        self.version_major.borrow()
    }
}

/**
 * In theory, specifies a byte order. In practice, no other values besides FE FF (which imply little endian order) are used.
 */
impl MicrosoftCfb_CfbHeader {
    pub fn byte_order(&self) -> Ref<'_, Vec<u8>> {
        self.byte_order.borrow()
    }
}

/**
 * For major version 3, must be 0x9 (sector size = 512 bytes). For major version 4, must be 0xc (sector size = 4096 bytes).
 */
impl MicrosoftCfb_CfbHeader {
    pub fn sector_shift(&self) -> Ref<'_, u16> {
        self.sector_shift.borrow()
    }
}
impl MicrosoftCfb_CfbHeader {
    pub fn mini_sector_shift(&self) -> Ref<'_, u16> {
        self.mini_sector_shift.borrow()
    }
}
impl MicrosoftCfb_CfbHeader {
    pub fn reserved1(&self) -> Ref<'_, Vec<u8>> {
        self.reserved1.borrow()
    }
}

/**
 * Number of directory sectors in this file. For major version 3, must be 0.
 */
impl MicrosoftCfb_CfbHeader {
    pub fn size_dir(&self) -> Ref<'_, i32> {
        self.size_dir.borrow()
    }
}

/**
 * Number of FAT sectors in this file.
 */
impl MicrosoftCfb_CfbHeader {
    pub fn size_fat(&self) -> Ref<'_, i32> {
        self.size_fat.borrow()
    }
}

/**
 * Starting sector number for directory stream.
 */
impl MicrosoftCfb_CfbHeader {
    pub fn ofs_dir(&self) -> Ref<'_, i32> {
        self.ofs_dir.borrow()
    }
}

/**
 * A transaction sequence number, which is incremented each time the file is saved if transactions are implemented, 0 otherwise.
 */
impl MicrosoftCfb_CfbHeader {
    pub fn transaction_seq(&self) -> Ref<'_, i32> {
        self.transaction_seq.borrow()
    }
}
impl MicrosoftCfb_CfbHeader {
    pub fn mini_stream_cutoff_size(&self) -> Ref<'_, i32> {
        self.mini_stream_cutoff_size.borrow()
    }
}

/**
 * Starting sector number for mini FAT.
 */
impl MicrosoftCfb_CfbHeader {
    pub fn ofs_mini_fat(&self) -> Ref<'_, i32> {
        self.ofs_mini_fat.borrow()
    }
}

/**
 * Number of mini FAT sectors in this file.
 */
impl MicrosoftCfb_CfbHeader {
    pub fn size_mini_fat(&self) -> Ref<'_, i32> {
        self.size_mini_fat.borrow()
    }
}

/**
 * Starting sector number for DIFAT.
 */
impl MicrosoftCfb_CfbHeader {
    pub fn ofs_difat(&self) -> Ref<'_, i32> {
        self.ofs_difat.borrow()
    }
}

/**
 * Number of DIFAT sectors in this file.
 */
impl MicrosoftCfb_CfbHeader {
    pub fn size_difat(&self) -> Ref<'_, i32> {
        self.size_difat.borrow()
    }
}
impl MicrosoftCfb_CfbHeader {
    pub fn difat(&self) -> Ref<'_, Vec<i32>> {
        self.difat.borrow()
    }
}
impl MicrosoftCfb_CfbHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MicrosoftCfb_DirEntry {
    pub _root: SharedType<MicrosoftCfb>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    name: RefCell<String>,
    name_len: RefCell<u16>,
    object_type: RefCell<MicrosoftCfb_DirEntry_ObjType>,
    color_flag: RefCell<MicrosoftCfb_DirEntry_RbColor>,
    left_sibling_id: RefCell<i32>,
    right_sibling_id: RefCell<i32>,
    child_id: RefCell<i32>,
    clsid: RefCell<Vec<u8>>,
    state: RefCell<u32>,
    time_create: RefCell<u64>,
    time_mod: RefCell<u64>,
    ofs: RefCell<i32>,
    size: RefCell<u64>,
    _io: RefCell<BytesReader>,
    f_child: Cell<bool>,
    child: RefCell<OptRc<MicrosoftCfb_DirEntry>>,
    f_left_sibling: Cell<bool>,
    left_sibling: RefCell<OptRc<MicrosoftCfb_DirEntry>>,
    f_mini_stream: Cell<bool>,
    mini_stream: RefCell<Vec<u8>>,
    f_right_sibling: Cell<bool>,
    right_sibling: RefCell<OptRc<MicrosoftCfb_DirEntry>>,
}
impl KStruct for MicrosoftCfb_DirEntry {
    type Root = MicrosoftCfb;
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
        *self_rc.name.borrow_mut() = bytes_to_str(&_io.read_bytes(64 as usize)?.into(), "UTF-16LE")?;
        *self_rc.name_len.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.object_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.color_flag.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.left_sibling_id.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.right_sibling_id.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.child_id.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.clsid.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        *self_rc.state.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.time_create.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.time_mod.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.ofs.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.size.borrow_mut() = _io.read_u8le()?.into();
        Ok(())
    }
}
impl MicrosoftCfb_DirEntry {
    pub fn child(
        &self
    ) -> KResult<Ref<'_, OptRc<MicrosoftCfb_DirEntry>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_child.get() {
            return Ok(self.child.borrow());
        }
        if ((*self.child_id() as i32) != (-1 as i32)) {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(((((((*_r.header().ofs_dir() as i32) + (1 as i32)) as i32) * (*_r.sector_size()? as i32)) as i32) + (((*self.child_id() as i32) * (128 as i32)) as i32)) as usize)?;
            let t = Self::read_into::<BytesReader, MicrosoftCfb_DirEntry>(&io, Some(self._root.clone()), None)?.into();
            *self.child.borrow_mut() = t;
            io.seek(_pos)?;
        }
        Ok(self.child.borrow())
    }
    pub fn left_sibling(
        &self
    ) -> KResult<Ref<'_, OptRc<MicrosoftCfb_DirEntry>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_left_sibling.get() {
            return Ok(self.left_sibling.borrow());
        }
        if ((*self.left_sibling_id() as i32) != (-1 as i32)) {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(((((((*_r.header().ofs_dir() as i32) + (1 as i32)) as i32) * (*_r.sector_size()? as i32)) as i32) + (((*self.left_sibling_id() as i32) * (128 as i32)) as i32)) as usize)?;
            let t = Self::read_into::<BytesReader, MicrosoftCfb_DirEntry>(&io, Some(self._root.clone()), None)?.into();
            *self.left_sibling.borrow_mut() = t;
            io.seek(_pos)?;
        }
        Ok(self.left_sibling.borrow())
    }
    pub fn mini_stream(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_mini_stream.get() {
            return Ok(self.mini_stream.borrow());
        }
        self.f_mini_stream.set(true);
        if *self.object_type() == MicrosoftCfb_DirEntry_ObjType::RootStorage {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(((((*self.ofs() as i32) + (1 as i32)) as i32) * (*_r.sector_size()? as i32)) as usize)?;
            *self.mini_stream.borrow_mut() = io.read_bytes(*self.size() as usize)?.into();
            io.seek(_pos)?;
        }
        Ok(self.mini_stream.borrow())
    }
    pub fn right_sibling(
        &self
    ) -> KResult<Ref<'_, OptRc<MicrosoftCfb_DirEntry>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_right_sibling.get() {
            return Ok(self.right_sibling.borrow());
        }
        if ((*self.right_sibling_id() as i32) != (-1 as i32)) {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(((((((*_r.header().ofs_dir() as i32) + (1 as i32)) as i32) * (*_r.sector_size()? as i32)) as i32) + (((*self.right_sibling_id() as i32) * (128 as i32)) as i32)) as usize)?;
            let t = Self::read_into::<BytesReader, MicrosoftCfb_DirEntry>(&io, Some(self._root.clone()), None)?.into();
            *self.right_sibling.borrow_mut() = t;
            io.seek(_pos)?;
        }
        Ok(self.right_sibling.borrow())
    }
}
impl MicrosoftCfb_DirEntry {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl MicrosoftCfb_DirEntry {
    pub fn name_len(&self) -> Ref<'_, u16> {
        self.name_len.borrow()
    }
}
impl MicrosoftCfb_DirEntry {
    pub fn object_type(&self) -> Ref<'_, MicrosoftCfb_DirEntry_ObjType> {
        self.object_type.borrow()
    }
}
impl MicrosoftCfb_DirEntry {
    pub fn color_flag(&self) -> Ref<'_, MicrosoftCfb_DirEntry_RbColor> {
        self.color_flag.borrow()
    }
}
impl MicrosoftCfb_DirEntry {
    pub fn left_sibling_id(&self) -> Ref<'_, i32> {
        self.left_sibling_id.borrow()
    }
}
impl MicrosoftCfb_DirEntry {
    pub fn right_sibling_id(&self) -> Ref<'_, i32> {
        self.right_sibling_id.borrow()
    }
}
impl MicrosoftCfb_DirEntry {
    pub fn child_id(&self) -> Ref<'_, i32> {
        self.child_id.borrow()
    }
}
impl MicrosoftCfb_DirEntry {
    pub fn clsid(&self) -> Ref<'_, Vec<u8>> {
        self.clsid.borrow()
    }
}

/**
 * User-defined flags for storage or root storage objects
 */
impl MicrosoftCfb_DirEntry {
    pub fn state(&self) -> Ref<'_, u32> {
        self.state.borrow()
    }
}

/**
 * Creation time, in Windows FILETIME format (number of 100-nanosecond intervals since January 1, 1601, UTC)
 */
impl MicrosoftCfb_DirEntry {
    pub fn time_create(&self) -> Ref<'_, u64> {
        self.time_create.borrow()
    }
}

/**
 * Modification time, in Windows FILETIME format (number of 100-nanosecond intervals since January 1, 1601, UTC).
 */
impl MicrosoftCfb_DirEntry {
    pub fn time_mod(&self) -> Ref<'_, u64> {
        self.time_mod.borrow()
    }
}

/**
 * For stream object, number of starting sector. For a root storage object, first sector of the mini stream, if the mini stream exists.
 */
impl MicrosoftCfb_DirEntry {
    pub fn ofs(&self) -> Ref<'_, i32> {
        self.ofs.borrow()
    }
}

/**
 * For stream object, size of user-defined data in bytes. For a root storage object, size of the mini stream.
 */
impl MicrosoftCfb_DirEntry {
    pub fn size(&self) -> Ref<'_, u64> {
        self.size.borrow()
    }
}
impl MicrosoftCfb_DirEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum MicrosoftCfb_DirEntry_ObjType {
    Unknown,
    Storage,
    Stream,
    RootStorage,
    Unknown(i64),
}

impl TryFrom<i64> for MicrosoftCfb_DirEntry_ObjType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MicrosoftCfb_DirEntry_ObjType> {
        match flag {
            0 => Ok(MicrosoftCfb_DirEntry_ObjType::Unknown),
            1 => Ok(MicrosoftCfb_DirEntry_ObjType::Storage),
            2 => Ok(MicrosoftCfb_DirEntry_ObjType::Stream),
            5 => Ok(MicrosoftCfb_DirEntry_ObjType::RootStorage),
            _ => Ok(MicrosoftCfb_DirEntry_ObjType::Unknown(flag)),
        }
    }
}

impl From<&MicrosoftCfb_DirEntry_ObjType> for i64 {
    fn from(v: &MicrosoftCfb_DirEntry_ObjType) -> Self {
        match *v {
            MicrosoftCfb_DirEntry_ObjType::Unknown => 0,
            MicrosoftCfb_DirEntry_ObjType::Storage => 1,
            MicrosoftCfb_DirEntry_ObjType::Stream => 2,
            MicrosoftCfb_DirEntry_ObjType::RootStorage => 5,
            MicrosoftCfb_DirEntry_ObjType::Unknown(v) => v
        }
    }
}

impl Default for MicrosoftCfb_DirEntry_ObjType {
    fn default() -> Self { MicrosoftCfb_DirEntry_ObjType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum MicrosoftCfb_DirEntry_RbColor {
    Red,
    Black,
    Unknown(i64),
}

impl TryFrom<i64> for MicrosoftCfb_DirEntry_RbColor {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MicrosoftCfb_DirEntry_RbColor> {
        match flag {
            0 => Ok(MicrosoftCfb_DirEntry_RbColor::Red),
            1 => Ok(MicrosoftCfb_DirEntry_RbColor::Black),
            _ => Ok(MicrosoftCfb_DirEntry_RbColor::Unknown(flag)),
        }
    }
}

impl From<&MicrosoftCfb_DirEntry_RbColor> for i64 {
    fn from(v: &MicrosoftCfb_DirEntry_RbColor) -> Self {
        match *v {
            MicrosoftCfb_DirEntry_RbColor::Red => 0,
            MicrosoftCfb_DirEntry_RbColor::Black => 1,
            MicrosoftCfb_DirEntry_RbColor::Unknown(v) => v
        }
    }
}

impl Default for MicrosoftCfb_DirEntry_RbColor {
    fn default() -> Self { MicrosoftCfb_DirEntry_RbColor::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct MicrosoftCfb_FatEntries {
    pub _root: SharedType<MicrosoftCfb>,
    pub _parent: SharedType<MicrosoftCfb>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<i32>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MicrosoftCfb_FatEntries {
    type Root = MicrosoftCfb;
    type Parent = MicrosoftCfb;

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
                self_rc.entries.borrow_mut().push(_io.read_s4le()?.into());
                _i += 1;
            }
        }
        Ok(())
    }
}
impl MicrosoftCfb_FatEntries {
}
impl MicrosoftCfb_FatEntries {
    pub fn entries(&self) -> Ref<'_, Vec<i32>> {
        self.entries.borrow()
    }
}
impl MicrosoftCfb_FatEntries {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

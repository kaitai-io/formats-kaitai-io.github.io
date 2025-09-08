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
pub struct Ext2 {
    pub _root: SharedType<Ext2>,
    pub _parent: SharedType<Ext2>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
    f_bg1: Cell<bool>,
    bg1: RefCell<OptRc<Ext2_BlockGroup>>,
    f_root_dir: Cell<bool>,
    root_dir: RefCell<OptRc<Ext2_Dir>>,
}
impl KStruct for Ext2 {
    type Root = Ext2;
    type Parent = Ext2;

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
impl Ext2 {
    pub fn bg1(
        &self
    ) -> KResult<Ref<'_, OptRc<Ext2_BlockGroup>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_bg1.get() {
            return Ok(self.bg1.borrow());
        }
        let _pos = _io.pos();
        _io.seek(1024 as usize)?;
        let t = Self::read_into::<_, Ext2_BlockGroup>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.bg1.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.bg1.borrow())
    }
    pub fn root_dir(
        &self
    ) -> KResult<Ref<'_, OptRc<Ext2_Dir>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_root_dir.get() {
            return Ok(self.root_dir.borrow());
        }
        *self.root_dir.borrow_mut() = self.bg1()?.block_groups()[0 as usize].inodes()?[1 as usize].as_dir()?.clone();
        Ok(self.root_dir.borrow())
    }
}
impl Ext2 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ext2_Bgd {
    pub _root: SharedType<Ext2>,
    pub _parent: SharedType<Ext2_BlockGroup>,
    pub _self: SharedType<Self>,
    block_bitmap_block: RefCell<u32>,
    inode_bitmap_block: RefCell<u32>,
    inode_table_block: RefCell<u32>,
    free_blocks_count: RefCell<u16>,
    free_inodes_count: RefCell<u16>,
    used_dirs_count: RefCell<u16>,
    pad_reserved: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_block_bitmap: Cell<bool>,
    block_bitmap: RefCell<Vec<u8>>,
    f_inode_bitmap: Cell<bool>,
    inode_bitmap: RefCell<Vec<u8>>,
    f_inodes: Cell<bool>,
    inodes: RefCell<Vec<OptRc<Ext2_Inode>>>,
}
impl KStruct for Ext2_Bgd {
    type Root = Ext2;
    type Parent = Ext2_BlockGroup;

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
        *self_rc.block_bitmap_block.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.inode_bitmap_block.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.inode_table_block.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.free_blocks_count.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.free_inodes_count.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.used_dirs_count.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.pad_reserved.borrow_mut() = _io.read_bytes((2 + 12) as usize)?.into();
        Ok(())
    }
}
impl Ext2_Bgd {
    pub fn block_bitmap(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_block_bitmap.get() {
            return Ok(self.block_bitmap.borrow());
        }
        self.f_block_bitmap.set(true);
        let _pos = _io.pos();
        _io.seek(((*self.block_bitmap_block() as i32) * (*_r.bg1()?.super_block().block_size()? as i32)) as usize)?;
        *self.block_bitmap.borrow_mut() = _io.read_bytes(1024 as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.block_bitmap.borrow())
    }
    pub fn inode_bitmap(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_inode_bitmap.get() {
            return Ok(self.inode_bitmap.borrow());
        }
        self.f_inode_bitmap.set(true);
        let _pos = _io.pos();
        _io.seek(((*self.inode_bitmap_block() as i32) * (*_r.bg1()?.super_block().block_size()? as i32)) as usize)?;
        *self.inode_bitmap.borrow_mut() = _io.read_bytes(1024 as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.inode_bitmap.borrow())
    }
    pub fn inodes(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<Ext2_Inode>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_inodes.get() {
            return Ok(self.inodes.borrow());
        }
        self.f_inodes.set(true);
        let _pos = _io.pos();
        _io.seek(((*self.inode_table_block() as i32) * (*_r.bg1()?.super_block().block_size()? as i32)) as usize)?;
        *self.inodes.borrow_mut() = Vec::new();
        let l_inodes = *_r.bg1()?.super_block().inodes_per_group();
        for _i in 0..l_inodes {
            let t = Self::read_into::<_, Ext2_Inode>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            self.inodes.borrow_mut().push(t);
        }
        _io.seek(_pos)?;
        Ok(self.inodes.borrow())
    }
}
impl Ext2_Bgd {
    pub fn block_bitmap_block(&self) -> Ref<'_, u32> {
        self.block_bitmap_block.borrow()
    }
}
impl Ext2_Bgd {
    pub fn inode_bitmap_block(&self) -> Ref<'_, u32> {
        self.inode_bitmap_block.borrow()
    }
}
impl Ext2_Bgd {
    pub fn inode_table_block(&self) -> Ref<'_, u32> {
        self.inode_table_block.borrow()
    }
}
impl Ext2_Bgd {
    pub fn free_blocks_count(&self) -> Ref<'_, u16> {
        self.free_blocks_count.borrow()
    }
}
impl Ext2_Bgd {
    pub fn free_inodes_count(&self) -> Ref<'_, u16> {
        self.free_inodes_count.borrow()
    }
}
impl Ext2_Bgd {
    pub fn used_dirs_count(&self) -> Ref<'_, u16> {
        self.used_dirs_count.borrow()
    }
}
impl Ext2_Bgd {
    pub fn pad_reserved(&self) -> Ref<'_, Vec<u8>> {
        self.pad_reserved.borrow()
    }
}
impl Ext2_Bgd {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ext2_BlockGroup {
    pub _root: SharedType<Ext2>,
    pub _parent: SharedType<Ext2>,
    pub _self: SharedType<Self>,
    super_block: RefCell<OptRc<Ext2_SuperBlockStruct>>,
    block_groups: RefCell<Vec<OptRc<Ext2_Bgd>>>,
    _io: RefCell<BytesReader>,
    super_block_raw: RefCell<Vec<u8>>,
}
impl KStruct for Ext2_BlockGroup {
    type Root = Ext2;
    type Parent = Ext2;

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
        *self_rc.super_block_raw.borrow_mut() = _io.read_bytes(1024 as usize)?.into();
        let super_block_raw = self_rc.super_block_raw.borrow();
        let _t_super_block_raw_io = BytesReader::from(super_block_raw.clone());
        let t = Self::read_into::<BytesReader, Ext2_SuperBlockStruct>(&_t_super_block_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.super_block.borrow_mut() = t;
        *self_rc.block_groups.borrow_mut() = Vec::new();
        let l_block_groups = *self_rc.super_block().block_group_count()?;
        for _i in 0..l_block_groups {
            let t = Self::read_into::<_, Ext2_Bgd>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.block_groups.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Ext2_BlockGroup {
}
impl Ext2_BlockGroup {
    pub fn super_block(&self) -> Ref<'_, OptRc<Ext2_SuperBlockStruct>> {
        self.super_block.borrow()
    }
}
impl Ext2_BlockGroup {
    pub fn block_groups(&self) -> Ref<'_, Vec<OptRc<Ext2_Bgd>>> {
        self.block_groups.borrow()
    }
}
impl Ext2_BlockGroup {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Ext2_BlockGroup {
    pub fn super_block_raw(&self) -> Ref<'_, Vec<u8>> {
        self.super_block_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ext2_BlockPtr {
    pub _root: SharedType<Ext2>,
    pub _parent: SharedType<Ext2_Inode>,
    pub _self: SharedType<Self>,
    ptr: RefCell<u32>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
    f_body: Cell<bool>,
    body: RefCell<OptRc<Ext2_RawBlock>>,
}
impl KStruct for Ext2_BlockPtr {
    type Root = Ext2;
    type Parent = Ext2_Inode;

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
        *self_rc.ptr.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Ext2_BlockPtr {
    pub fn body(
        &self
    ) -> KResult<Ref<'_, OptRc<Ext2_RawBlock>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_body.get() {
            return Ok(self.body.borrow());
        }
        let _pos = _io.pos();
        _io.seek(((*self.ptr() as i32) * (*_r.bg1()?.super_block().block_size()? as i32)) as usize)?;
        *self.body_raw.borrow_mut() = _io.read_bytes(*_r.bg1()?.super_block().block_size()? as usize)?.into();
        let body_raw = self.body_raw.borrow();
        let _t_body_raw_io = BytesReader::from(body_raw.clone());
        let t = Self::read_into::<BytesReader, Ext2_RawBlock>(&_t_body_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.body.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.body.borrow())
    }
}
impl Ext2_BlockPtr {
    pub fn ptr(&self) -> Ref<'_, u32> {
        self.ptr.borrow()
    }
}
impl Ext2_BlockPtr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Ext2_BlockPtr {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ext2_Dir {
    pub _root: SharedType<Ext2>,
    pub _parent: SharedType<Ext2_Inode>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<Ext2_DirEntry>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ext2_Dir {
    type Root = Ext2;
    type Parent = Ext2_Inode;

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
                let t = Self::read_into::<_, Ext2_DirEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Ext2_Dir {
}
impl Ext2_Dir {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Ext2_DirEntry>>> {
        self.entries.borrow()
    }
}
impl Ext2_Dir {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ext2_DirEntry {
    pub _root: SharedType<Ext2>,
    pub _parent: SharedType<Ext2_Dir>,
    pub _self: SharedType<Self>,
    inode_ptr: RefCell<u32>,
    rec_len: RefCell<u16>,
    name_len: RefCell<u8>,
    file_type: RefCell<Ext2_DirEntry_FileTypeEnum>,
    name: RefCell<String>,
    padding: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_inode: Cell<bool>,
    inode: RefCell<OptRc<Ext2_Inode>>,
}
impl KStruct for Ext2_DirEntry {
    type Root = Ext2;
    type Parent = Ext2_Dir;

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
        *self_rc.inode_ptr.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.rec_len.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.name_len.borrow_mut() = _io.read_u1()?.into();
        *self_rc.file_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.name.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.name_len() as usize)?.into(), "UTF-8")?;
        *self_rc.padding.borrow_mut() = _io.read_bytes(((((*self_rc.rec_len() as u16) - (*self_rc.name_len() as u16)) as i32) - (8 as i32)) as usize)?.into();
        Ok(())
    }
}
impl Ext2_DirEntry {
    pub fn inode(
        &self
    ) -> KResult<Ref<'_, OptRc<Ext2_Inode>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_inode.get() {
            return Ok(self.inode.borrow());
        }
        *self.inode.borrow_mut() = _r.bg1()?.block_groups()[((((*self.inode_ptr() as u32) - (1 as u32)) as i32) / (*_r.bg1()?.super_block().inodes_per_group() as i32)) as usize].inodes()?[((((*self.inode_ptr() as u32) - (1 as u32)) as i32) % (*_r.bg1()?.super_block().inodes_per_group() as i32)) as usize].clone();
        Ok(self.inode.borrow())
    }
}
impl Ext2_DirEntry {
    pub fn inode_ptr(&self) -> Ref<'_, u32> {
        self.inode_ptr.borrow()
    }
}
impl Ext2_DirEntry {
    pub fn rec_len(&self) -> Ref<'_, u16> {
        self.rec_len.borrow()
    }
}
impl Ext2_DirEntry {
    pub fn name_len(&self) -> Ref<'_, u8> {
        self.name_len.borrow()
    }
}
impl Ext2_DirEntry {
    pub fn file_type(&self) -> Ref<'_, Ext2_DirEntry_FileTypeEnum> {
        self.file_type.borrow()
    }
}
impl Ext2_DirEntry {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl Ext2_DirEntry {
    pub fn padding(&self) -> Ref<'_, Vec<u8>> {
        self.padding.borrow()
    }
}
impl Ext2_DirEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Ext2_DirEntry_FileTypeEnum {
    Unknown,
    RegFile,
    Dir,
    Chrdev,
    Blkdev,
    Fifo,
    Sock,
    Symlink,
    Unknown(i64),
}

impl TryFrom<i64> for Ext2_DirEntry_FileTypeEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ext2_DirEntry_FileTypeEnum> {
        match flag {
            0 => Ok(Ext2_DirEntry_FileTypeEnum::Unknown),
            1 => Ok(Ext2_DirEntry_FileTypeEnum::RegFile),
            2 => Ok(Ext2_DirEntry_FileTypeEnum::Dir),
            3 => Ok(Ext2_DirEntry_FileTypeEnum::Chrdev),
            4 => Ok(Ext2_DirEntry_FileTypeEnum::Blkdev),
            5 => Ok(Ext2_DirEntry_FileTypeEnum::Fifo),
            6 => Ok(Ext2_DirEntry_FileTypeEnum::Sock),
            7 => Ok(Ext2_DirEntry_FileTypeEnum::Symlink),
            _ => Ok(Ext2_DirEntry_FileTypeEnum::Unknown(flag)),
        }
    }
}

impl From<&Ext2_DirEntry_FileTypeEnum> for i64 {
    fn from(v: &Ext2_DirEntry_FileTypeEnum) -> Self {
        match *v {
            Ext2_DirEntry_FileTypeEnum::Unknown => 0,
            Ext2_DirEntry_FileTypeEnum::RegFile => 1,
            Ext2_DirEntry_FileTypeEnum::Dir => 2,
            Ext2_DirEntry_FileTypeEnum::Chrdev => 3,
            Ext2_DirEntry_FileTypeEnum::Blkdev => 4,
            Ext2_DirEntry_FileTypeEnum::Fifo => 5,
            Ext2_DirEntry_FileTypeEnum::Sock => 6,
            Ext2_DirEntry_FileTypeEnum::Symlink => 7,
            Ext2_DirEntry_FileTypeEnum::Unknown(v) => v
        }
    }
}

impl Default for Ext2_DirEntry_FileTypeEnum {
    fn default() -> Self { Ext2_DirEntry_FileTypeEnum::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Ext2_Inode {
    pub _root: SharedType<Ext2>,
    pub _parent: SharedType<Ext2_Bgd>,
    pub _self: SharedType<Self>,
    mode: RefCell<u16>,
    uid: RefCell<u16>,
    size: RefCell<u32>,
    atime: RefCell<u32>,
    ctime: RefCell<u32>,
    mtime: RefCell<u32>,
    dtime: RefCell<u32>,
    gid: RefCell<u16>,
    links_count: RefCell<u16>,
    blocks: RefCell<u32>,
    flags: RefCell<u32>,
    osd1: RefCell<u32>,
    block: RefCell<Vec<OptRc<Ext2_BlockPtr>>>,
    generation: RefCell<u32>,
    file_acl: RefCell<u32>,
    dir_acl: RefCell<u32>,
    faddr: RefCell<u32>,
    osd2: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_as_dir: Cell<bool>,
    as_dir: RefCell<OptRc<Ext2_Dir>>,
}
impl KStruct for Ext2_Inode {
    type Root = Ext2;
    type Parent = Ext2_Bgd;

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
        *self_rc.mode.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.uid.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.atime.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ctime.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.mtime.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.dtime.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.gid.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.links_count.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.blocks.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.flags.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.osd1.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.block.borrow_mut() = Vec::new();
        let l_block = 15;
        for _i in 0..l_block {
            let t = Self::read_into::<_, Ext2_BlockPtr>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.block.borrow_mut().push(t);
        }
        *self_rc.generation.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.file_acl.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.dir_acl.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.faddr.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.osd2.borrow_mut() = _io.read_bytes(12 as usize)?.into();
        Ok(())
    }
}
impl Ext2_Inode {
    pub fn as_dir(
        &self
    ) -> KResult<Ref<'_, OptRc<Ext2_Dir>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_as_dir.get() {
            return Ok(self.as_dir.borrow());
        }
        let io = Clone::clone(&*self.block()[0 as usize].body()?._io());
        let _pos = io.pos();
        io.seek(0 as usize)?;
        let t = Self::read_into::<BytesReader, Ext2_Dir>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.as_dir.borrow_mut() = t;
        io.seek(_pos)?;
        Ok(self.as_dir.borrow())
    }
}
impl Ext2_Inode {
    pub fn mode(&self) -> Ref<'_, u16> {
        self.mode.borrow()
    }
}
impl Ext2_Inode {
    pub fn uid(&self) -> Ref<'_, u16> {
        self.uid.borrow()
    }
}
impl Ext2_Inode {
    pub fn size(&self) -> Ref<'_, u32> {
        self.size.borrow()
    }
}
impl Ext2_Inode {
    pub fn atime(&self) -> Ref<'_, u32> {
        self.atime.borrow()
    }
}
impl Ext2_Inode {
    pub fn ctime(&self) -> Ref<'_, u32> {
        self.ctime.borrow()
    }
}
impl Ext2_Inode {
    pub fn mtime(&self) -> Ref<'_, u32> {
        self.mtime.borrow()
    }
}
impl Ext2_Inode {
    pub fn dtime(&self) -> Ref<'_, u32> {
        self.dtime.borrow()
    }
}
impl Ext2_Inode {
    pub fn gid(&self) -> Ref<'_, u16> {
        self.gid.borrow()
    }
}
impl Ext2_Inode {
    pub fn links_count(&self) -> Ref<'_, u16> {
        self.links_count.borrow()
    }
}
impl Ext2_Inode {
    pub fn blocks(&self) -> Ref<'_, u32> {
        self.blocks.borrow()
    }
}
impl Ext2_Inode {
    pub fn flags(&self) -> Ref<'_, u32> {
        self.flags.borrow()
    }
}
impl Ext2_Inode {
    pub fn osd1(&self) -> Ref<'_, u32> {
        self.osd1.borrow()
    }
}
impl Ext2_Inode {
    pub fn block(&self) -> Ref<'_, Vec<OptRc<Ext2_BlockPtr>>> {
        self.block.borrow()
    }
}
impl Ext2_Inode {
    pub fn generation(&self) -> Ref<'_, u32> {
        self.generation.borrow()
    }
}
impl Ext2_Inode {
    pub fn file_acl(&self) -> Ref<'_, u32> {
        self.file_acl.borrow()
    }
}
impl Ext2_Inode {
    pub fn dir_acl(&self) -> Ref<'_, u32> {
        self.dir_acl.borrow()
    }
}
impl Ext2_Inode {
    pub fn faddr(&self) -> Ref<'_, u32> {
        self.faddr.borrow()
    }
}
impl Ext2_Inode {
    pub fn osd2(&self) -> Ref<'_, Vec<u8>> {
        self.osd2.borrow()
    }
}
impl Ext2_Inode {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ext2_RawBlock {
    pub _root: SharedType<Ext2>,
    pub _parent: SharedType<Ext2_BlockPtr>,
    pub _self: SharedType<Self>,
    body: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Ext2_RawBlock {
    type Root = Ext2;
    type Parent = Ext2_BlockPtr;

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
        *self_rc.body.borrow_mut() = _io.read_bytes(*_r.bg1()?.super_block().block_size()? as usize)?.into();
        Ok(())
    }
}
impl Ext2_RawBlock {
}
impl Ext2_RawBlock {
    pub fn body(&self) -> Ref<'_, Vec<u8>> {
        self.body.borrow()
    }
}
impl Ext2_RawBlock {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Ext2_SuperBlockStruct {
    pub _root: SharedType<Ext2>,
    pub _parent: SharedType<Ext2_BlockGroup>,
    pub _self: SharedType<Self>,
    inodes_count: RefCell<u32>,
    blocks_count: RefCell<u32>,
    r_blocks_count: RefCell<u32>,
    free_blocks_count: RefCell<u32>,
    free_inodes_count: RefCell<u32>,
    first_data_block: RefCell<u32>,
    log_block_size: RefCell<u32>,
    log_frag_size: RefCell<u32>,
    blocks_per_group: RefCell<u32>,
    frags_per_group: RefCell<u32>,
    inodes_per_group: RefCell<u32>,
    mtime: RefCell<u32>,
    wtime: RefCell<u32>,
    mnt_count: RefCell<u16>,
    max_mnt_count: RefCell<u16>,
    magic: RefCell<Vec<u8>>,
    state: RefCell<Ext2_SuperBlockStruct_StateEnum>,
    errors: RefCell<Ext2_SuperBlockStruct_ErrorsEnum>,
    minor_rev_level: RefCell<u16>,
    lastcheck: RefCell<u32>,
    checkinterval: RefCell<u32>,
    creator_os: RefCell<u32>,
    rev_level: RefCell<u32>,
    def_resuid: RefCell<u16>,
    def_resgid: RefCell<u16>,
    first_ino: RefCell<u32>,
    inode_size: RefCell<u16>,
    block_group_nr: RefCell<u16>,
    feature_compat: RefCell<u32>,
    feature_incompat: RefCell<u32>,
    feature_ro_compat: RefCell<u32>,
    uuid: RefCell<Vec<u8>>,
    volume_name: RefCell<Vec<u8>>,
    last_mounted: RefCell<Vec<u8>>,
    algo_bitmap: RefCell<u32>,
    prealloc_blocks: RefCell<u8>,
    prealloc_dir_blocks: RefCell<u8>,
    padding1: RefCell<Vec<u8>>,
    journal_uuid: RefCell<Vec<u8>>,
    journal_inum: RefCell<u32>,
    journal_dev: RefCell<u32>,
    last_orphan: RefCell<u32>,
    hash_seed: RefCell<Vec<u32>>,
    def_hash_version: RefCell<u8>,
    _io: RefCell<BytesReader>,
    f_block_group_count: Cell<bool>,
    block_group_count: RefCell<i32>,
    f_block_size: Cell<bool>,
    block_size: RefCell<i32>,
}
impl KStruct for Ext2_SuperBlockStruct {
    type Root = Ext2;
    type Parent = Ext2_BlockGroup;

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
        *self_rc.inodes_count.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.blocks_count.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.r_blocks_count.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.free_blocks_count.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.free_inodes_count.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.first_data_block.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.log_block_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.log_frag_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.blocks_per_group.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.frags_per_group.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.inodes_per_group.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.mtime.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.wtime.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.mnt_count.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.max_mnt_count.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.magic.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.magic() == vec![0x53u8, 0xefu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/super_block_struct/seq/15".to_string() }));
        }
        *self_rc.state.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        *self_rc.errors.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        *self_rc.minor_rev_level.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.lastcheck.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.checkinterval.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.creator_os.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.rev_level.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.def_resuid.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.def_resgid.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.first_ino.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.inode_size.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.block_group_nr.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.feature_compat.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.feature_incompat.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.feature_ro_compat.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.uuid.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        *self_rc.volume_name.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        *self_rc.last_mounted.borrow_mut() = _io.read_bytes(64 as usize)?.into();
        *self_rc.algo_bitmap.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.prealloc_blocks.borrow_mut() = _io.read_u1()?.into();
        *self_rc.prealloc_dir_blocks.borrow_mut() = _io.read_u1()?.into();
        *self_rc.padding1.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        *self_rc.journal_uuid.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        *self_rc.journal_inum.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.journal_dev.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.last_orphan.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.hash_seed.borrow_mut() = Vec::new();
        let l_hash_seed = 4;
        for _i in 0..l_hash_seed {
            self_rc.hash_seed.borrow_mut().push(_io.read_u4le()?.into());
        }
        *self_rc.def_hash_version.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl Ext2_SuperBlockStruct {
    pub fn block_group_count(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_block_group_count.get() {
            return Ok(self.block_group_count.borrow());
        }
        self.f_block_group_count.set(true);
        *self.block_group_count.borrow_mut() = (((*self.blocks_count() as u32) / (*self.blocks_per_group() as u32))) as i32;
        Ok(self.block_group_count.borrow())
    }
    pub fn block_size(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_block_size.get() {
            return Ok(self.block_size.borrow());
        }
        self.f_block_size.set(true);
        *self.block_size.borrow_mut() = (((1024 as i32) << (*self.log_block_size() as i32))) as i32;
        Ok(self.block_size.borrow())
    }
}
impl Ext2_SuperBlockStruct {
    pub fn inodes_count(&self) -> Ref<'_, u32> {
        self.inodes_count.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn blocks_count(&self) -> Ref<'_, u32> {
        self.blocks_count.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn r_blocks_count(&self) -> Ref<'_, u32> {
        self.r_blocks_count.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn free_blocks_count(&self) -> Ref<'_, u32> {
        self.free_blocks_count.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn free_inodes_count(&self) -> Ref<'_, u32> {
        self.free_inodes_count.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn first_data_block(&self) -> Ref<'_, u32> {
        self.first_data_block.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn log_block_size(&self) -> Ref<'_, u32> {
        self.log_block_size.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn log_frag_size(&self) -> Ref<'_, u32> {
        self.log_frag_size.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn blocks_per_group(&self) -> Ref<'_, u32> {
        self.blocks_per_group.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn frags_per_group(&self) -> Ref<'_, u32> {
        self.frags_per_group.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn inodes_per_group(&self) -> Ref<'_, u32> {
        self.inodes_per_group.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn mtime(&self) -> Ref<'_, u32> {
        self.mtime.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn wtime(&self) -> Ref<'_, u32> {
        self.wtime.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn mnt_count(&self) -> Ref<'_, u16> {
        self.mnt_count.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn max_mnt_count(&self) -> Ref<'_, u16> {
        self.max_mnt_count.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn state(&self) -> Ref<'_, Ext2_SuperBlockStruct_StateEnum> {
        self.state.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn errors(&self) -> Ref<'_, Ext2_SuperBlockStruct_ErrorsEnum> {
        self.errors.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn minor_rev_level(&self) -> Ref<'_, u16> {
        self.minor_rev_level.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn lastcheck(&self) -> Ref<'_, u32> {
        self.lastcheck.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn checkinterval(&self) -> Ref<'_, u32> {
        self.checkinterval.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn creator_os(&self) -> Ref<'_, u32> {
        self.creator_os.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn rev_level(&self) -> Ref<'_, u32> {
        self.rev_level.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn def_resuid(&self) -> Ref<'_, u16> {
        self.def_resuid.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn def_resgid(&self) -> Ref<'_, u16> {
        self.def_resgid.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn first_ino(&self) -> Ref<'_, u32> {
        self.first_ino.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn inode_size(&self) -> Ref<'_, u16> {
        self.inode_size.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn block_group_nr(&self) -> Ref<'_, u16> {
        self.block_group_nr.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn feature_compat(&self) -> Ref<'_, u32> {
        self.feature_compat.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn feature_incompat(&self) -> Ref<'_, u32> {
        self.feature_incompat.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn feature_ro_compat(&self) -> Ref<'_, u32> {
        self.feature_ro_compat.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn uuid(&self) -> Ref<'_, Vec<u8>> {
        self.uuid.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn volume_name(&self) -> Ref<'_, Vec<u8>> {
        self.volume_name.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn last_mounted(&self) -> Ref<'_, Vec<u8>> {
        self.last_mounted.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn algo_bitmap(&self) -> Ref<'_, u32> {
        self.algo_bitmap.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn prealloc_blocks(&self) -> Ref<'_, u8> {
        self.prealloc_blocks.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn prealloc_dir_blocks(&self) -> Ref<'_, u8> {
        self.prealloc_dir_blocks.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn padding1(&self) -> Ref<'_, Vec<u8>> {
        self.padding1.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn journal_uuid(&self) -> Ref<'_, Vec<u8>> {
        self.journal_uuid.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn journal_inum(&self) -> Ref<'_, u32> {
        self.journal_inum.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn journal_dev(&self) -> Ref<'_, u32> {
        self.journal_dev.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn last_orphan(&self) -> Ref<'_, u32> {
        self.last_orphan.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn hash_seed(&self) -> Ref<'_, Vec<u32>> {
        self.hash_seed.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn def_hash_version(&self) -> Ref<'_, u8> {
        self.def_hash_version.borrow()
    }
}
impl Ext2_SuperBlockStruct {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Ext2_SuperBlockStruct_ErrorsEnum {
    ActContinue,
    ActRo,
    ActPanic,
    Unknown(i64),
}

impl TryFrom<i64> for Ext2_SuperBlockStruct_ErrorsEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ext2_SuperBlockStruct_ErrorsEnum> {
        match flag {
            1 => Ok(Ext2_SuperBlockStruct_ErrorsEnum::ActContinue),
            2 => Ok(Ext2_SuperBlockStruct_ErrorsEnum::ActRo),
            3 => Ok(Ext2_SuperBlockStruct_ErrorsEnum::ActPanic),
            _ => Ok(Ext2_SuperBlockStruct_ErrorsEnum::Unknown(flag)),
        }
    }
}

impl From<&Ext2_SuperBlockStruct_ErrorsEnum> for i64 {
    fn from(v: &Ext2_SuperBlockStruct_ErrorsEnum) -> Self {
        match *v {
            Ext2_SuperBlockStruct_ErrorsEnum::ActContinue => 1,
            Ext2_SuperBlockStruct_ErrorsEnum::ActRo => 2,
            Ext2_SuperBlockStruct_ErrorsEnum::ActPanic => 3,
            Ext2_SuperBlockStruct_ErrorsEnum::Unknown(v) => v
        }
    }
}

impl Default for Ext2_SuperBlockStruct_ErrorsEnum {
    fn default() -> Self { Ext2_SuperBlockStruct_ErrorsEnum::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Ext2_SuperBlockStruct_StateEnum {
    ValidFs,
    ErrorFs,
    Unknown(i64),
}

impl TryFrom<i64> for Ext2_SuperBlockStruct_StateEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Ext2_SuperBlockStruct_StateEnum> {
        match flag {
            1 => Ok(Ext2_SuperBlockStruct_StateEnum::ValidFs),
            2 => Ok(Ext2_SuperBlockStruct_StateEnum::ErrorFs),
            _ => Ok(Ext2_SuperBlockStruct_StateEnum::Unknown(flag)),
        }
    }
}

impl From<&Ext2_SuperBlockStruct_StateEnum> for i64 {
    fn from(v: &Ext2_SuperBlockStruct_StateEnum) -> Self {
        match *v {
            Ext2_SuperBlockStruct_StateEnum::ValidFs => 1,
            Ext2_SuperBlockStruct_StateEnum::ErrorFs => 2,
            Ext2_SuperBlockStruct_StateEnum::Unknown(v) => v
        }
    }
}

impl Default for Ext2_SuperBlockStruct_StateEnum {
    fn default() -> Self { Ext2_SuperBlockStruct_StateEnum::Unknown(0) }
}


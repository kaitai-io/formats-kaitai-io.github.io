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
pub struct Cramfs {
    pub _root: SharedType<Cramfs>,
    pub _parent: SharedType<Cramfs>,
    pub _self: SharedType<Self>,
    super_block: RefCell<OptRc<Cramfs_SuperBlockStruct>>,
    _io: RefCell<BytesReader>,
    f_page_size: Cell<bool>,
    page_size: RefCell<i32>,
}
impl KStruct for Cramfs {
    type Root = Cramfs;
    type Parent = Cramfs;

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
        let t = Self::read_into::<_, Cramfs_SuperBlockStruct>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.super_block.borrow_mut() = t;
        Ok(())
    }
}
impl Cramfs {
    pub fn page_size(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_page_size.get() {
            return Ok(self.page_size.borrow());
        }
        self.f_page_size.set(true);
        *self.page_size.borrow_mut() = (4096) as i32;
        Ok(self.page_size.borrow())
    }
}
impl Cramfs {
    pub fn super_block(&self) -> Ref<'_, OptRc<Cramfs_SuperBlockStruct>> {
        self.super_block.borrow()
    }
}
impl Cramfs {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Cramfs_ChunkedDataInode {
    pub _root: SharedType<Cramfs>,
    pub _parent: SharedType<Cramfs_Inode>,
    pub _self: SharedType<Self>,
    block_end_index: RefCell<Vec<u32>>,
    raw_blocks: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Cramfs_ChunkedDataInode {
    type Root = Cramfs;
    type Parent = Cramfs_Inode;

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
        *self_rc.block_end_index.borrow_mut() = Vec::new();
        let l_block_end_index = ((((((*_prc.as_ref().unwrap().size()? as i32) + (*_r.page_size()? as i32)) as i32) - (1 as i32)) as i32) / (*_r.page_size()? as i32));
        for _i in 0..l_block_end_index {
            self_rc.block_end_index.borrow_mut().push(_io.read_u4le()?.into());
        }
        *self_rc.raw_blocks.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl Cramfs_ChunkedDataInode {
}
impl Cramfs_ChunkedDataInode {
    pub fn block_end_index(&self) -> Ref<'_, Vec<u32>> {
        self.block_end_index.borrow()
    }
}
impl Cramfs_ChunkedDataInode {
    pub fn raw_blocks(&self) -> Ref<'_, Vec<u8>> {
        self.raw_blocks.borrow()
    }
}
impl Cramfs_ChunkedDataInode {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Cramfs_DirInode {
    pub _root: SharedType<Cramfs>,
    pub _parent: SharedType<Cramfs_Inode>,
    pub _self: SharedType<Self>,
    children: RefCell<Vec<OptRc<Cramfs_Inode>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Cramfs_DirInode {
    type Root = Cramfs;
    type Parent = Cramfs_Inode;

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
        if ((*_io.size()? as i32) > (0 as i32)) {
            *self_rc.children.borrow_mut() = Vec::new();
            {
                let mut _i = 0;
                while !_io.is_eof() {
                    let t = Self::read_into::<_, Cramfs_Inode>(&*_io, Some(self_rc._root.clone()), None)?.into();
                    self_rc.children.borrow_mut().push(t);
                    _i += 1;
                }
            }
        }
        Ok(())
    }
}
impl Cramfs_DirInode {
}
impl Cramfs_DirInode {
    pub fn children(&self) -> Ref<'_, Vec<OptRc<Cramfs_Inode>>> {
        self.children.borrow()
    }
}
impl Cramfs_DirInode {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Cramfs_Info {
    pub _root: SharedType<Cramfs>,
    pub _parent: SharedType<Cramfs_SuperBlockStruct>,
    pub _self: SharedType<Self>,
    crc: RefCell<u32>,
    edition: RefCell<u32>,
    blocks: RefCell<u32>,
    files: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Cramfs_Info {
    type Root = Cramfs;
    type Parent = Cramfs_SuperBlockStruct;

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
        *self_rc.crc.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.edition.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.blocks.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.files.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Cramfs_Info {
}
impl Cramfs_Info {
    pub fn crc(&self) -> Ref<'_, u32> {
        self.crc.borrow()
    }
}
impl Cramfs_Info {
    pub fn edition(&self) -> Ref<'_, u32> {
        self.edition.borrow()
    }
}
impl Cramfs_Info {
    pub fn blocks(&self) -> Ref<'_, u32> {
        self.blocks.borrow()
    }
}
impl Cramfs_Info {
    pub fn files(&self) -> Ref<'_, u32> {
        self.files.borrow()
    }
}
impl Cramfs_Info {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Cramfs_Inode {
    pub _root: SharedType<Cramfs>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    mode: RefCell<u16>,
    uid: RefCell<u16>,
    size_gid: RefCell<u32>,
    namelen_offset: RefCell<u32>,
    name: RefCell<String>,
    _io: RefCell<BytesReader>,
    as_dir_raw: RefCell<Vec<u8>>,
    f_as_dir: Cell<bool>,
    as_dir: RefCell<OptRc<Cramfs_DirInode>>,
    f_as_reg_file: Cell<bool>,
    as_reg_file: RefCell<OptRc<Cramfs_ChunkedDataInode>>,
    f_as_symlink: Cell<bool>,
    as_symlink: RefCell<OptRc<Cramfs_ChunkedDataInode>>,
    f_attr: Cell<bool>,
    attr: RefCell<i32>,
    f_gid: Cell<bool>,
    gid: RefCell<i32>,
    f_namelen: Cell<bool>,
    namelen: RefCell<i32>,
    f_offset: Cell<bool>,
    offset: RefCell<i32>,
    f_perm_g: Cell<bool>,
    perm_g: RefCell<i32>,
    f_perm_o: Cell<bool>,
    perm_o: RefCell<i32>,
    f_perm_u: Cell<bool>,
    perm_u: RefCell<i32>,
    f_size: Cell<bool>,
    size: RefCell<i32>,
    f_type: Cell<bool>,
    type: RefCell<Cramfs_Inode_FileType>,
}
impl KStruct for Cramfs_Inode {
    type Root = Cramfs;
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
        *self_rc.mode.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.uid.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.size_gid.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.namelen_offset.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.name.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.namelen()? as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Cramfs_Inode {
    pub fn as_dir(
        &self
    ) -> KResult<Ref<'_, OptRc<Cramfs_DirInode>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_as_dir.get() {
            return Ok(self.as_dir.borrow());
        }
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.offset()? as usize)?;
        *self.as_dir_raw.borrow_mut() = io.read_bytes(*self.size()? as usize)?.into();
        let as_dir_raw = self.as_dir_raw.borrow();
        let _t_as_dir_raw_io = BytesReader::from(as_dir_raw.clone());
        let t = Self::read_into::<BytesReader, Cramfs_DirInode>(&_t_as_dir_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.as_dir.borrow_mut() = t;
        io.seek(_pos)?;
        Ok(self.as_dir.borrow())
    }
    pub fn as_reg_file(
        &self
    ) -> KResult<Ref<'_, OptRc<Cramfs_ChunkedDataInode>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_as_reg_file.get() {
            return Ok(self.as_reg_file.borrow());
        }
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.offset()? as usize)?;
        let t = Self::read_into::<BytesReader, Cramfs_ChunkedDataInode>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.as_reg_file.borrow_mut() = t;
        io.seek(_pos)?;
        Ok(self.as_reg_file.borrow())
    }
    pub fn as_symlink(
        &self
    ) -> KResult<Ref<'_, OptRc<Cramfs_ChunkedDataInode>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_as_symlink.get() {
            return Ok(self.as_symlink.borrow());
        }
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.offset()? as usize)?;
        let t = Self::read_into::<BytesReader, Cramfs_ChunkedDataInode>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.as_symlink.borrow_mut() = t;
        io.seek(_pos)?;
        Ok(self.as_symlink.borrow())
    }
    pub fn attr(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_attr.get() {
            return Ok(self.attr.borrow());
        }
        self.f_attr.set(true);
        *self.attr.borrow_mut() = (((((*self.mode() as u16) >> (9 as u16)) as i32) & (7 as i32))) as i32;
        Ok(self.attr.borrow())
    }
    pub fn gid(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_gid.get() {
            return Ok(self.gid.borrow());
        }
        self.f_gid.set(true);
        *self.gid.borrow_mut() = (((*self.size_gid() as u32) >> (24 as u32))) as i32;
        Ok(self.gid.borrow())
    }
    pub fn namelen(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_namelen.get() {
            return Ok(self.namelen.borrow());
        }
        self.f_namelen.set(true);
        *self.namelen.borrow_mut() = (((((*self.namelen_offset() as u32) & (63 as u32)) as i32) << (2 as i32))) as i32;
        Ok(self.namelen.borrow())
    }
    pub fn offset(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_offset.get() {
            return Ok(self.offset.borrow());
        }
        self.f_offset.set(true);
        *self.offset.borrow_mut() = (((((((*self.namelen_offset() as u32) >> (6 as u32)) as i32) & (67108863 as i32)) as i32) << (2 as i32))) as i32;
        Ok(self.offset.borrow())
    }
    pub fn perm_g(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_perm_g.get() {
            return Ok(self.perm_g.borrow());
        }
        self.f_perm_g.set(true);
        *self.perm_g.borrow_mut() = (((((*self.mode() as u16) >> (3 as u16)) as i32) & (7 as i32))) as i32;
        Ok(self.perm_g.borrow())
    }
    pub fn perm_o(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_perm_o.get() {
            return Ok(self.perm_o.borrow());
        }
        self.f_perm_o.set(true);
        *self.perm_o.borrow_mut() = (((*self.mode() as u16) & (7 as u16))) as i32;
        Ok(self.perm_o.borrow())
    }
    pub fn perm_u(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_perm_u.get() {
            return Ok(self.perm_u.borrow());
        }
        self.f_perm_u.set(true);
        *self.perm_u.borrow_mut() = (((((*self.mode() as u16) >> (6 as u16)) as i32) & (7 as i32))) as i32;
        Ok(self.perm_u.borrow())
    }
    pub fn size(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_size.get() {
            return Ok(self.size.borrow());
        }
        self.f_size.set(true);
        *self.size.borrow_mut() = (((*self.size_gid() as i32) & (16777215 as i32))) as i32;
        Ok(self.size.borrow())
    }
    pub fn type(
        &self
    ) -> KResult<Ref<'_, Cramfs_Inode_FileType>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_type.get() {
            return Ok(self.type.borrow());
        }
        self.f_type.set(true);
        *self.type.borrow_mut() = (((((*self.mode() as u16) >> (12 as u16)) as i32) & (15 as i32)) as i64).try_into()?;
        Ok(self.type.borrow())
    }
}
impl Cramfs_Inode {
    pub fn mode(&self) -> Ref<'_, u16> {
        self.mode.borrow()
    }
}
impl Cramfs_Inode {
    pub fn uid(&self) -> Ref<'_, u16> {
        self.uid.borrow()
    }
}
impl Cramfs_Inode {
    pub fn size_gid(&self) -> Ref<'_, u32> {
        self.size_gid.borrow()
    }
}
impl Cramfs_Inode {
    pub fn namelen_offset(&self) -> Ref<'_, u32> {
        self.namelen_offset.borrow()
    }
}
impl Cramfs_Inode {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl Cramfs_Inode {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Cramfs_Inode {
    pub fn as_dir_raw(&self) -> Ref<'_, Vec<u8>> {
        self.as_dir_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Cramfs_Inode_FileType {
    Fifo,
    Chrdev,
    Dir,
    Blkdev,
    RegFile,
    Symlink,
    Socket,
    Unknown(i64),
}

impl TryFrom<i64> for Cramfs_Inode_FileType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Cramfs_Inode_FileType> {
        match flag {
            1 => Ok(Cramfs_Inode_FileType::Fifo),
            2 => Ok(Cramfs_Inode_FileType::Chrdev),
            4 => Ok(Cramfs_Inode_FileType::Dir),
            6 => Ok(Cramfs_Inode_FileType::Blkdev),
            8 => Ok(Cramfs_Inode_FileType::RegFile),
            10 => Ok(Cramfs_Inode_FileType::Symlink),
            12 => Ok(Cramfs_Inode_FileType::Socket),
            _ => Ok(Cramfs_Inode_FileType::Unknown(flag)),
        }
    }
}

impl From<&Cramfs_Inode_FileType> for i64 {
    fn from(v: &Cramfs_Inode_FileType) -> Self {
        match *v {
            Cramfs_Inode_FileType::Fifo => 1,
            Cramfs_Inode_FileType::Chrdev => 2,
            Cramfs_Inode_FileType::Dir => 4,
            Cramfs_Inode_FileType::Blkdev => 6,
            Cramfs_Inode_FileType::RegFile => 8,
            Cramfs_Inode_FileType::Symlink => 10,
            Cramfs_Inode_FileType::Socket => 12,
            Cramfs_Inode_FileType::Unknown(v) => v
        }
    }
}

impl Default for Cramfs_Inode_FileType {
    fn default() -> Self { Cramfs_Inode_FileType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Cramfs_SuperBlockStruct {
    pub _root: SharedType<Cramfs>,
    pub _parent: SharedType<Cramfs>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    size: RefCell<u32>,
    flags: RefCell<u32>,
    future: RefCell<u32>,
    signature: RefCell<Vec<u8>>,
    fsid: RefCell<OptRc<Cramfs_Info>>,
    name: RefCell<String>,
    root: RefCell<OptRc<Cramfs_Inode>>,
    _io: RefCell<BytesReader>,
    f_flag_fsid_v2: Cell<bool>,
    flag_fsid_v2: RefCell<i32>,
    f_flag_holes: Cell<bool>,
    flag_holes: RefCell<i32>,
    f_flag_shifted_root_offset: Cell<bool>,
    flag_shifted_root_offset: RefCell<i32>,
    f_flag_sorted_dirs: Cell<bool>,
    flag_sorted_dirs: RefCell<i32>,
    f_flag_wrong_signature: Cell<bool>,
    flag_wrong_signature: RefCell<i32>,
}
impl KStruct for Cramfs_SuperBlockStruct {
    type Root = Cramfs;
    type Parent = Cramfs;

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
        if !(*self_rc.magic() == vec![0x45u8, 0x3du8, 0xcdu8, 0x28u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/super_block_struct/seq/0".to_string() }));
        }
        *self_rc.size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.flags.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.future.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.signature.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        if !(*self_rc.signature() == vec![0x43u8, 0x6fu8, 0x6du8, 0x70u8, 0x72u8, 0x65u8, 0x73u8, 0x73u8, 0x65u8, 0x64u8, 0x20u8, 0x52u8, 0x4fu8, 0x4du8, 0x46u8, 0x53u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/super_block_struct/seq/4".to_string() }));
        }
        let t = Self::read_into::<_, Cramfs_Info>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.fsid.borrow_mut() = t;
        *self_rc.name.borrow_mut() = bytes_to_str(&_io.read_bytes(16 as usize)?.into(), "ASCII")?;
        let t = Self::read_into::<_, Cramfs_Inode>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.root.borrow_mut() = t;
        Ok(())
    }
}
impl Cramfs_SuperBlockStruct {
    pub fn flag_fsid_v2(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_flag_fsid_v2.get() {
            return Ok(self.flag_fsid_v2.borrow());
        }
        self.f_flag_fsid_v2.set(true);
        *self.flag_fsid_v2.borrow_mut() = (((((*self.flags() as u32) >> (0 as u32)) as i32) & (1 as i32))) as i32;
        Ok(self.flag_fsid_v2.borrow())
    }
    pub fn flag_holes(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_flag_holes.get() {
            return Ok(self.flag_holes.borrow());
        }
        self.f_flag_holes.set(true);
        *self.flag_holes.borrow_mut() = (((((*self.flags() as u32) >> (8 as u32)) as i32) & (1 as i32))) as i32;
        Ok(self.flag_holes.borrow())
    }
    pub fn flag_shifted_root_offset(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_flag_shifted_root_offset.get() {
            return Ok(self.flag_shifted_root_offset.borrow());
        }
        self.f_flag_shifted_root_offset.set(true);
        *self.flag_shifted_root_offset.borrow_mut() = (((((*self.flags() as u32) >> (10 as u32)) as i32) & (1 as i32))) as i32;
        Ok(self.flag_shifted_root_offset.borrow())
    }
    pub fn flag_sorted_dirs(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_flag_sorted_dirs.get() {
            return Ok(self.flag_sorted_dirs.borrow());
        }
        self.f_flag_sorted_dirs.set(true);
        *self.flag_sorted_dirs.borrow_mut() = (((((*self.flags() as u32) >> (1 as u32)) as i32) & (1 as i32))) as i32;
        Ok(self.flag_sorted_dirs.borrow())
    }
    pub fn flag_wrong_signature(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_flag_wrong_signature.get() {
            return Ok(self.flag_wrong_signature.borrow());
        }
        self.f_flag_wrong_signature.set(true);
        *self.flag_wrong_signature.borrow_mut() = (((((*self.flags() as u32) >> (9 as u32)) as i32) & (1 as i32))) as i32;
        Ok(self.flag_wrong_signature.borrow())
    }
}
impl Cramfs_SuperBlockStruct {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl Cramfs_SuperBlockStruct {
    pub fn size(&self) -> Ref<'_, u32> {
        self.size.borrow()
    }
}
impl Cramfs_SuperBlockStruct {
    pub fn flags(&self) -> Ref<'_, u32> {
        self.flags.borrow()
    }
}
impl Cramfs_SuperBlockStruct {
    pub fn future(&self) -> Ref<'_, u32> {
        self.future.borrow()
    }
}
impl Cramfs_SuperBlockStruct {
    pub fn signature(&self) -> Ref<'_, Vec<u8>> {
        self.signature.borrow()
    }
}
impl Cramfs_SuperBlockStruct {
    pub fn fsid(&self) -> Ref<'_, OptRc<Cramfs_Info>> {
        self.fsid.borrow()
    }
}
impl Cramfs_SuperBlockStruct {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl Cramfs_SuperBlockStruct {
    pub fn root(&self) -> Ref<'_, OptRc<Cramfs_Inode>> {
        self.root.borrow()
    }
}
impl Cramfs_SuperBlockStruct {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

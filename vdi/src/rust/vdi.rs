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
 * A native VirtualBox file format
 * 
 * Images for testing can be downloaded from
 * 
 *  * <https://www.osboxes.org/virtualbox-images/>
 *  * <https://virtualboxes.org/images/>
 * 
 * or you can convert images of other formats.
 * \sa https://github.com/qemu/qemu/blob/master/block/vdi.c Source
 */

#[derive(Default, Debug, Clone)]
pub struct Vdi {
    pub _root: SharedType<Vdi>,
    pub _parent: SharedType<Vdi>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<Vdi_Header>>,
    _io: RefCell<BytesReader>,
    blocks_map_raw: RefCell<Vec<u8>>,
    f_block_discarded: Cell<bool>,
    block_discarded: RefCell<i32>,
    f_block_unallocated: Cell<bool>,
    block_unallocated: RefCell<i32>,
    f_blocks_map: Cell<bool>,
    blocks_map: RefCell<OptRc<Vdi_BlocksMap>>,
    f_disk: Cell<bool>,
    disk: RefCell<OptRc<Vdi_Disk>>,
}
impl KStruct for Vdi {
    type Root = Vdi;
    type Parent = Vdi;

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
        let t = Self::read_into::<_, Vdi_Header>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        Ok(())
    }
}
impl Vdi {
    pub fn block_discarded(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_block_discarded.get() {
            return Ok(self.block_discarded.borrow());
        }
        self.f_block_discarded.set(true);
        *self.block_discarded.borrow_mut() = (4294967294) as i32;
        Ok(self.block_discarded.borrow())
    }
    pub fn block_unallocated(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_block_unallocated.get() {
            return Ok(self.block_unallocated.borrow());
        }
        self.f_block_unallocated.set(true);
        *self.block_unallocated.borrow_mut() = (4294967295) as i32;
        Ok(self.block_unallocated.borrow())
    }

    /**
     * block_index = offset_in_virtual_disk / block_size actual_data_offset = blocks_map[block_index]*block_size+metadata_size+offset_in_block
     * The blocks_map will take up blocks_in_image_max * sizeof(uint32_t) bytes; since the blocks_map is read and written in a single operation, its size needs to be limited to INT_MAX; furthermore, when opening an image, the blocks_map size is rounded up to be aligned on BDRV_SECTOR_SIZE. Therefore this should satisfy the following: blocks_in_image_max * sizeof(uint32_t) + BDRV_SECTOR_SIZE == INT_MAX + 1 (INT_MAX + 1 is the first value not representable as an int) This guarantees that any value below or equal to the constant will, when multiplied by sizeof(uint32_t) and rounded up to a BDRV_SECTOR_SIZE boundary, still be below or equal to INT_MAX.
     */
    pub fn blocks_map(
        &self
    ) -> KResult<Ref<'_, OptRc<Vdi_BlocksMap>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_blocks_map.get() {
            return Ok(self.blocks_map.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*self.header().blocks_map_offset()? as usize)?;
        *self.blocks_map_raw.borrow_mut() = _io.read_bytes(*self.header().blocks_map_size()? as usize)?.into();
        let blocks_map_raw = self.blocks_map_raw.borrow();
        let _t_blocks_map_raw_io = BytesReader::from(blocks_map_raw.clone());
        let t = Self::read_into::<BytesReader, Vdi_BlocksMap>(&_t_blocks_map_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.blocks_map.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.blocks_map.borrow())
    }
    pub fn disk(
        &self
    ) -> KResult<Ref<'_, OptRc<Vdi_Disk>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_disk.get() {
            return Ok(self.disk.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*self.header().blocks_offset()? as usize)?;
        let t = Self::read_into::<_, Vdi_Disk>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.disk.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.disk.borrow())
    }
}
impl Vdi {
    pub fn header(&self) -> Ref<'_, OptRc<Vdi_Header>> {
        self.header.borrow()
    }
}
impl Vdi {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Vdi {
    pub fn blocks_map_raw(&self) -> Ref<'_, Vec<u8>> {
        self.blocks_map_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Vdi_ImageType {
    Dynamic,
    Static,
    Undo,
    Diff,
    Unknown(i64),
}

impl TryFrom<i64> for Vdi_ImageType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Vdi_ImageType> {
        match flag {
            1 => Ok(Vdi_ImageType::Dynamic),
            2 => Ok(Vdi_ImageType::Static),
            3 => Ok(Vdi_ImageType::Undo),
            4 => Ok(Vdi_ImageType::Diff),
            _ => Ok(Vdi_ImageType::Unknown(flag)),
        }
    }
}

impl From<&Vdi_ImageType> for i64 {
    fn from(v: &Vdi_ImageType) -> Self {
        match *v {
            Vdi_ImageType::Dynamic => 1,
            Vdi_ImageType::Static => 2,
            Vdi_ImageType::Undo => 3,
            Vdi_ImageType::Diff => 4,
            Vdi_ImageType::Unknown(v) => v
        }
    }
}

impl Default for Vdi_ImageType {
    fn default() -> Self { Vdi_ImageType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Vdi_BlocksMap {
    pub _root: SharedType<Vdi>,
    pub _parent: SharedType<Vdi>,
    pub _self: SharedType<Self>,
    index: RefCell<Vec<OptRc<Vdi_BlocksMap_BlockIndex>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Vdi_BlocksMap {
    type Root = Vdi;
    type Parent = Vdi;

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
        *self_rc.index.borrow_mut() = Vec::new();
        let l_index = *_r.header().header_main().blocks_in_image();
        for _i in 0..l_index {
            let t = Self::read_into::<_, Vdi_BlocksMap_BlockIndex>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.index.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Vdi_BlocksMap {
}
impl Vdi_BlocksMap {
    pub fn index(&self) -> Ref<'_, Vec<OptRc<Vdi_BlocksMap_BlockIndex>>> {
        self.index.borrow()
    }
}
impl Vdi_BlocksMap {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Vdi_BlocksMap_BlockIndex {
    pub _root: SharedType<Vdi>,
    pub _parent: SharedType<Vdi_BlocksMap>,
    pub _self: SharedType<Self>,
    index: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_block: Cell<bool>,
    block: RefCell<OptRc<Vdi_Disk_Block>>,
    f_is_allocated: Cell<bool>,
    is_allocated: RefCell<bool>,
}
impl KStruct for Vdi_BlocksMap_BlockIndex {
    type Root = Vdi;
    type Parent = Vdi_BlocksMap;

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
        *self_rc.index.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Vdi_BlocksMap_BlockIndex {
    pub fn block(
        &self
    ) -> KResult<Ref<'_, OptRc<Vdi_Disk_Block>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_block.get() {
            return Ok(self.block.borrow());
        }
        if *self.is_allocated()? {
            *self.block.borrow_mut() = _r.disk()?.blocks()[*self.index() as usize].clone();
        }
        Ok(self.block.borrow())
    }
    pub fn is_allocated(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_allocated.get() {
            return Ok(self.is_allocated.borrow());
        }
        self.f_is_allocated.set(true);
        *self.is_allocated.borrow_mut() = (((*self.index() as i32) < (*_r.block_discarded()? as i32))) as bool;
        Ok(self.is_allocated.borrow())
    }
}
impl Vdi_BlocksMap_BlockIndex {
    pub fn index(&self) -> Ref<'_, u32> {
        self.index.borrow()
    }
}
impl Vdi_BlocksMap_BlockIndex {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Vdi_Disk {
    pub _root: SharedType<Vdi>,
    pub _parent: SharedType<Vdi>,
    pub _self: SharedType<Self>,
    blocks: RefCell<Vec<OptRc<Vdi_Disk_Block>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Vdi_Disk {
    type Root = Vdi;
    type Parent = Vdi;

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
        *self_rc.blocks.borrow_mut() = Vec::new();
        let l_blocks = *_r.header().header_main().blocks_in_image();
        for _i in 0..l_blocks {
            let t = Self::read_into::<_, Vdi_Disk_Block>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.blocks.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Vdi_Disk {
}
impl Vdi_Disk {
    pub fn blocks(&self) -> Ref<'_, Vec<OptRc<Vdi_Disk_Block>>> {
        self.blocks.borrow()
    }
}
impl Vdi_Disk {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Vdi_Disk_Block {
    pub _root: SharedType<Vdi>,
    pub _parent: SharedType<Vdi_Disk>,
    pub _self: SharedType<Self>,
    metadata: RefCell<Vec<u8>>,
    data: RefCell<Vec<OptRc<Vdi_Disk_Block_Sector>>>,
    _io: RefCell<BytesReader>,
    data_raw: RefCell<Vec<Vec<u8>>>,
}
impl KStruct for Vdi_Disk_Block {
    type Root = Vdi;
    type Parent = Vdi_Disk;

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
        *self_rc.metadata.borrow_mut() = _io.read_bytes(*_r.header().header_main().block_metadata_size() as usize)?.into();
        *self_rc.data_raw.borrow_mut() = Vec::new();
        *self_rc.data.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.data_raw.borrow_mut().push(_io.read_bytes(*_r.header().header_main().block_data_size() as usize)?.into());
                let data_raw = self_rc.data_raw.borrow();
                let io_data_raw = BytesReader::from(data_raw.last().unwrap().clone());
                let t = Self::read_into::<BytesReader, Vdi_Disk_Block_Sector>(&io_data_raw, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.data.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Vdi_Disk_Block {
}
impl Vdi_Disk_Block {
    pub fn metadata(&self) -> Ref<'_, Vec<u8>> {
        self.metadata.borrow()
    }
}
impl Vdi_Disk_Block {
    pub fn data(&self) -> Ref<'_, Vec<OptRc<Vdi_Disk_Block_Sector>>> {
        self.data.borrow()
    }
}
impl Vdi_Disk_Block {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Vdi_Disk_Block {
    pub fn data_raw(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.data_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Vdi_Disk_Block_Sector {
    pub _root: SharedType<Vdi>,
    pub _parent: SharedType<Vdi_Disk_Block>,
    pub _self: SharedType<Self>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Vdi_Disk_Block_Sector {
    type Root = Vdi;
    type Parent = Vdi_Disk_Block;

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
        *self_rc.data.borrow_mut() = _io.read_bytes(*_r.header().header_main().geometry().sector_size() as usize)?.into();
        Ok(())
    }
}
impl Vdi_Disk_Block_Sector {
}
impl Vdi_Disk_Block_Sector {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl Vdi_Disk_Block_Sector {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Vdi_Header {
    pub _root: SharedType<Vdi>,
    pub _parent: SharedType<Vdi>,
    pub _self: SharedType<Self>,
    text: RefCell<String>,
    signature: RefCell<Vec<u8>>,
    version: RefCell<OptRc<Vdi_Header_Version>>,
    header_size_optional: RefCell<u32>,
    header_main: RefCell<OptRc<Vdi_Header_HeaderMain>>,
    _io: RefCell<BytesReader>,
    header_main_raw: RefCell<Vec<u8>>,
    f_block_size: Cell<bool>,
    block_size: RefCell<i32>,
    f_blocks_map_offset: Cell<bool>,
    blocks_map_offset: RefCell<u32>,
    f_blocks_map_size: Cell<bool>,
    blocks_map_size: RefCell<i32>,
    f_blocks_offset: Cell<bool>,
    blocks_offset: RefCell<u32>,
    f_header_size: Cell<bool>,
    header_size: RefCell<i32>,
    f_subheader_size_is_dynamic: Cell<bool>,
    subheader_size_is_dynamic: RefCell<bool>,
}
impl KStruct for Vdi_Header {
    type Root = Vdi;
    type Parent = Vdi;

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
        *self_rc.text.borrow_mut() = bytes_to_str(&_io.read_bytes(64 as usize)?.into(), "UTF-8")?;
        *self_rc.signature.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.signature() == vec![0x7fu8, 0x10u8, 0xdau8, 0xbeu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/seq/1".to_string() }));
        }
        let t = Self::read_into::<_, Vdi_Header_Version>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.version.borrow_mut() = t;
        if *self_rc.subheader_size_is_dynamic()? {
            *self_rc.header_size_optional.borrow_mut() = _io.read_u4le()?.into();
        }
        *self_rc.header_main_raw.borrow_mut() = _io.read_bytes(*self_rc.header_size()? as usize)?.into();
        let header_main_raw = self_rc.header_main_raw.borrow();
        let _t_header_main_raw_io = BytesReader::from(header_main_raw.clone());
        let t = Self::read_into::<BytesReader, Vdi_Header_HeaderMain>(&_t_header_main_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header_main.borrow_mut() = t;
        Ok(())
    }
}
impl Vdi_Header {
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
        *self.block_size.borrow_mut() = (((*self.header_main().block_metadata_size() as u32) + (*self.header_main().block_data_size() as u32))) as i32;
        Ok(self.block_size.borrow())
    }
    pub fn blocks_map_offset(
        &self
    ) -> KResult<Ref<'_, u32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_blocks_map_offset.get() {
            return Ok(self.blocks_map_offset.borrow());
        }
        self.f_blocks_map_offset.set(true);
        *self.blocks_map_offset.borrow_mut() = (*self.header_main().blocks_map_offset()) as u32;
        Ok(self.blocks_map_offset.borrow())
    }
    pub fn blocks_map_size(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_blocks_map_size.get() {
            return Ok(self.blocks_map_size.borrow());
        }
        self.f_blocks_map_size.set(true);
        *self.blocks_map_size.borrow_mut() = (((((((((((*self.header_main().blocks_in_image() as u32) * (4 as u32)) as i32) + (*self.header_main().geometry().sector_size() as i32)) as i32) - (1 as i32)) as i32) / (*self.header_main().geometry().sector_size() as i32)) as i32) * (*self.header_main().geometry().sector_size() as i32))) as i32;
        Ok(self.blocks_map_size.borrow())
    }
    pub fn blocks_offset(
        &self
    ) -> KResult<Ref<'_, u32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_blocks_offset.get() {
            return Ok(self.blocks_offset.borrow());
        }
        self.f_blocks_offset.set(true);
        *self.blocks_offset.borrow_mut() = (*self.header_main().offset_data()) as u32;
        Ok(self.blocks_offset.borrow())
    }
    pub fn header_size(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_header_size.get() {
            return Ok(self.header_size.borrow());
        }
        self.f_header_size.set(true);
        *self.header_size.borrow_mut() = (if *self.subheader_size_is_dynamic()? { *self.header_size_optional() } else { 336 }) as i32;
        Ok(self.header_size.borrow())
    }
    pub fn subheader_size_is_dynamic(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_subheader_size_is_dynamic.get() {
            return Ok(self.subheader_size_is_dynamic.borrow());
        }
        self.f_subheader_size_is_dynamic.set(true);
        *self.subheader_size_is_dynamic.borrow_mut() = (((*self.version().major() as u16) >= (1 as u16))) as bool;
        Ok(self.subheader_size_is_dynamic.borrow())
    }
}
impl Vdi_Header {
    pub fn text(&self) -> Ref<'_, String> {
        self.text.borrow()
    }
}
impl Vdi_Header {
    pub fn signature(&self) -> Ref<'_, Vec<u8>> {
        self.signature.borrow()
    }
}
impl Vdi_Header {
    pub fn version(&self) -> Ref<'_, OptRc<Vdi_Header_Version>> {
        self.version.borrow()
    }
}
impl Vdi_Header {
    pub fn header_size_optional(&self) -> Ref<'_, u32> {
        self.header_size_optional.borrow()
    }
}
impl Vdi_Header {
    pub fn header_main(&self) -> Ref<'_, OptRc<Vdi_Header_HeaderMain>> {
        self.header_main.borrow()
    }
}
impl Vdi_Header {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Vdi_Header {
    pub fn header_main_raw(&self) -> Ref<'_, Vec<u8>> {
        self.header_main_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Vdi_Header_HeaderMain {
    pub _root: SharedType<Vdi>,
    pub _parent: SharedType<Vdi_Header>,
    pub _self: SharedType<Self>,
    image_type: RefCell<Vdi_ImageType>,
    image_flags: RefCell<OptRc<Vdi_Header_HeaderMain_Flags>>,
    description: RefCell<String>,
    blocks_map_offset: RefCell<u32>,
    offset_data: RefCell<u32>,
    geometry: RefCell<OptRc<Vdi_Header_HeaderMain_Geometry>>,
    reserved1: RefCell<u32>,
    disk_size: RefCell<u64>,
    block_data_size: RefCell<u32>,
    block_metadata_size: RefCell<u32>,
    blocks_in_image: RefCell<u32>,
    blocks_allocated: RefCell<u32>,
    uuid_image: RefCell<OptRc<Vdi_Header_Uuid>>,
    uuid_last_snap: RefCell<OptRc<Vdi_Header_Uuid>>,
    uuid_link: RefCell<OptRc<Vdi_Header_Uuid>>,
    uuid_parent: RefCell<OptRc<Vdi_Header_Uuid>>,
    lchc_geometry: RefCell<OptRc<Vdi_Header_HeaderMain_Geometry>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Vdi_Header_HeaderMain {
    type Root = Vdi;
    type Parent = Vdi_Header;

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
        *self_rc.image_type.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        let t = Self::read_into::<_, Vdi_Header_HeaderMain_Flags>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.image_flags.borrow_mut() = t;
        *self_rc.description.borrow_mut() = bytes_to_str(&_io.read_bytes(256 as usize)?.into(), "UTF-8")?;
        if ((*_prc.as_ref().unwrap().version().major() as u16) >= (1 as u16)) {
            *self_rc.blocks_map_offset.borrow_mut() = _io.read_u4le()?.into();
        }
        if ((*_prc.as_ref().unwrap().version().major() as u16) >= (1 as u16)) {
            *self_rc.offset_data.borrow_mut() = _io.read_u4le()?.into();
        }
        let t = Self::read_into::<_, Vdi_Header_HeaderMain_Geometry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.geometry.borrow_mut() = t;
        if ((*_prc.as_ref().unwrap().version().major() as u16) >= (1 as u16)) {
            *self_rc.reserved1.borrow_mut() = _io.read_u4le()?.into();
        }
        *self_rc.disk_size.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.block_data_size.borrow_mut() = _io.read_u4le()?.into();
        if ((*_prc.as_ref().unwrap().version().major() as u16) >= (1 as u16)) {
            *self_rc.block_metadata_size.borrow_mut() = _io.read_u4le()?.into();
        }
        *self_rc.blocks_in_image.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.blocks_allocated.borrow_mut() = _io.read_u4le()?.into();
        let t = Self::read_into::<_, Vdi_Header_Uuid>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.uuid_image.borrow_mut() = t;
        let t = Self::read_into::<_, Vdi_Header_Uuid>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.uuid_last_snap.borrow_mut() = t;
        let t = Self::read_into::<_, Vdi_Header_Uuid>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.uuid_link.borrow_mut() = t;
        if ((*_prc.as_ref().unwrap().version().major() as u16) >= (1 as u16)) {
            let t = Self::read_into::<_, Vdi_Header_Uuid>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.uuid_parent.borrow_mut() = t;
        }
        if  ((((*_prc.as_ref().unwrap().version().major() as u16) >= (1 as u16))) && (((_io.pos() as i32) + (16 as i32)) <= _io.size()))  {
            let t = Self::read_into::<_, Vdi_Header_HeaderMain_Geometry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.lchc_geometry.borrow_mut() = t;
        }
        Ok(())
    }
}
impl Vdi_Header_HeaderMain {
}
impl Vdi_Header_HeaderMain {
    pub fn image_type(&self) -> Ref<'_, Vdi_ImageType> {
        self.image_type.borrow()
    }
}
impl Vdi_Header_HeaderMain {
    pub fn image_flags(&self) -> Ref<'_, OptRc<Vdi_Header_HeaderMain_Flags>> {
        self.image_flags.borrow()
    }
}
impl Vdi_Header_HeaderMain {
    pub fn description(&self) -> Ref<'_, String> {
        self.description.borrow()
    }
}
impl Vdi_Header_HeaderMain {
    pub fn blocks_map_offset(&self) -> Ref<'_, u32> {
        self.blocks_map_offset.borrow()
    }
}
impl Vdi_Header_HeaderMain {
    pub fn offset_data(&self) -> Ref<'_, u32> {
        self.offset_data.borrow()
    }
}
impl Vdi_Header_HeaderMain {
    pub fn geometry(&self) -> Ref<'_, OptRc<Vdi_Header_HeaderMain_Geometry>> {
        self.geometry.borrow()
    }
}
impl Vdi_Header_HeaderMain {
    pub fn reserved1(&self) -> Ref<'_, u32> {
        self.reserved1.borrow()
    }
}
impl Vdi_Header_HeaderMain {
    pub fn disk_size(&self) -> Ref<'_, u64> {
        self.disk_size.borrow()
    }
}

/**
 * Size of block (bytes).
 */
impl Vdi_Header_HeaderMain {
    pub fn block_data_size(&self) -> Ref<'_, u32> {
        self.block_data_size.borrow()
    }
}
impl Vdi_Header_HeaderMain {
    pub fn block_metadata_size(&self) -> Ref<'_, u32> {
        self.block_metadata_size.borrow()
    }
}
impl Vdi_Header_HeaderMain {
    pub fn blocks_in_image(&self) -> Ref<'_, u32> {
        self.blocks_in_image.borrow()
    }
}
impl Vdi_Header_HeaderMain {
    pub fn blocks_allocated(&self) -> Ref<'_, u32> {
        self.blocks_allocated.borrow()
    }
}
impl Vdi_Header_HeaderMain {
    pub fn uuid_image(&self) -> Ref<'_, OptRc<Vdi_Header_Uuid>> {
        self.uuid_image.borrow()
    }
}
impl Vdi_Header_HeaderMain {
    pub fn uuid_last_snap(&self) -> Ref<'_, OptRc<Vdi_Header_Uuid>> {
        self.uuid_last_snap.borrow()
    }
}
impl Vdi_Header_HeaderMain {
    pub fn uuid_link(&self) -> Ref<'_, OptRc<Vdi_Header_Uuid>> {
        self.uuid_link.borrow()
    }
}
impl Vdi_Header_HeaderMain {
    pub fn uuid_parent(&self) -> Ref<'_, OptRc<Vdi_Header_Uuid>> {
        self.uuid_parent.borrow()
    }
}
impl Vdi_Header_HeaderMain {
    pub fn lchc_geometry(&self) -> Ref<'_, OptRc<Vdi_Header_HeaderMain_Geometry>> {
        self.lchc_geometry.borrow()
    }
}
impl Vdi_Header_HeaderMain {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Vdi_Header_HeaderMain_Flags {
    pub _root: SharedType<Vdi>,
    pub _parent: SharedType<Vdi_Header_HeaderMain>,
    pub _self: SharedType<Self>,
    reserved0: RefCell<u64>,
    zero_expand: RefCell<bool>,
    reserved1: RefCell<u64>,
    diff: RefCell<bool>,
    fixed: RefCell<bool>,
    reserved2: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Vdi_Header_HeaderMain_Flags {
    type Root = Vdi;
    type Parent = Vdi_Header_HeaderMain;

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
        *self_rc.reserved0.borrow_mut() = _io.read_bits_int_be(15)?;
        *self_rc.zero_expand.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.reserved1.borrow_mut() = _io.read_bits_int_be(6)?;
        *self_rc.diff.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.fixed.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.reserved2.borrow_mut() = _io.read_bits_int_be(8)?;
        Ok(())
    }
}
impl Vdi_Header_HeaderMain_Flags {
}
impl Vdi_Header_HeaderMain_Flags {
    pub fn reserved0(&self) -> Ref<'_, u64> {
        self.reserved0.borrow()
    }
}
impl Vdi_Header_HeaderMain_Flags {
    pub fn zero_expand(&self) -> Ref<'_, bool> {
        self.zero_expand.borrow()
    }
}
impl Vdi_Header_HeaderMain_Flags {
    pub fn reserved1(&self) -> Ref<'_, u64> {
        self.reserved1.borrow()
    }
}
impl Vdi_Header_HeaderMain_Flags {
    pub fn diff(&self) -> Ref<'_, bool> {
        self.diff.borrow()
    }
}
impl Vdi_Header_HeaderMain_Flags {
    pub fn fixed(&self) -> Ref<'_, bool> {
        self.fixed.borrow()
    }
}
impl Vdi_Header_HeaderMain_Flags {
    pub fn reserved2(&self) -> Ref<'_, u64> {
        self.reserved2.borrow()
    }
}
impl Vdi_Header_HeaderMain_Flags {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Vdi_Header_HeaderMain_Geometry {
    pub _root: SharedType<Vdi>,
    pub _parent: SharedType<Vdi_Header_HeaderMain>,
    pub _self: SharedType<Self>,
    cylinders: RefCell<u32>,
    heads: RefCell<u32>,
    sectors: RefCell<u32>,
    sector_size: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Vdi_Header_HeaderMain_Geometry {
    type Root = Vdi;
    type Parent = Vdi_Header_HeaderMain;

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
        *self_rc.cylinders.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.heads.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.sectors.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.sector_size.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Vdi_Header_HeaderMain_Geometry {
}
impl Vdi_Header_HeaderMain_Geometry {
    pub fn cylinders(&self) -> Ref<'_, u32> {
        self.cylinders.borrow()
    }
}
impl Vdi_Header_HeaderMain_Geometry {
    pub fn heads(&self) -> Ref<'_, u32> {
        self.heads.borrow()
    }
}
impl Vdi_Header_HeaderMain_Geometry {
    pub fn sectors(&self) -> Ref<'_, u32> {
        self.sectors.borrow()
    }
}
impl Vdi_Header_HeaderMain_Geometry {
    pub fn sector_size(&self) -> Ref<'_, u32> {
        self.sector_size.borrow()
    }
}
impl Vdi_Header_HeaderMain_Geometry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Vdi_Header_Uuid {
    pub _root: SharedType<Vdi>,
    pub _parent: SharedType<Vdi_Header_HeaderMain>,
    pub _self: SharedType<Self>,
    uuid: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Vdi_Header_Uuid {
    type Root = Vdi;
    type Parent = Vdi_Header_HeaderMain;

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
        *self_rc.uuid.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        Ok(())
    }
}
impl Vdi_Header_Uuid {
}
impl Vdi_Header_Uuid {
    pub fn uuid(&self) -> Ref<'_, Vec<u8>> {
        self.uuid.borrow()
    }
}
impl Vdi_Header_Uuid {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Vdi_Header_Version {
    pub _root: SharedType<Vdi>,
    pub _parent: SharedType<Vdi_Header>,
    pub _self: SharedType<Self>,
    major: RefCell<u16>,
    minor: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Vdi_Header_Version {
    type Root = Vdi;
    type Parent = Vdi_Header;

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
        *self_rc.major.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.minor.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl Vdi_Header_Version {
}
impl Vdi_Header_Version {
    pub fn major(&self) -> Ref<'_, u16> {
        self.major.borrow()
    }
}
impl Vdi_Header_Version {
    pub fn minor(&self) -> Ref<'_, u16> {
        self.minor.borrow()
    }
}
impl Vdi_Header_Version {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

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
 * zisofs is a compression format for files on ISO9660 file system. It has
 * limited support across operating systems, mainly Linux kernel. Typically a
 * directory tree is first preprocessed by mkzftree (from the zisofs-tools
 * package before being turned into an ISO9660 image by mkisofs, genisoimage
 * or similar tool. The data is zlib compressed.
 * 
 * The specification here describes the structure of a file that has been
 * preprocessed by mkzftree, not of a full ISO9660 ziso. Data is not
 * decompressed, as blocks with length 0 have a special meaning. Decompression
 * and deconstruction of this data should be done outside of Kaitai Struct.
 * \sa https://web.archive.org/web/20200612093441/https://dev.lovelyhq.com/libburnia/web/-/wikis/zisofs Source
 */

#[derive(Default, Debug, Clone)]
pub struct Zisofs {
    pub _root: SharedType<Zisofs>,
    pub _parent: SharedType<Zisofs>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<Zisofs_Header>>,
    block_pointers: RefCell<Vec<u32>>,
    _io: RefCell<BytesReader>,
    header_raw: RefCell<Vec<u8>>,
    f_blocks: Cell<bool>,
    blocks: RefCell<Vec<OptRc<Zisofs_Block>>>,
}
impl KStruct for Zisofs {
    type Root = Zisofs;
    type Parent = Zisofs;

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
        *self_rc.header_raw.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        let header_raw = self_rc.header_raw.borrow();
        let _t_header_raw_io = BytesReader::from(header_raw.clone());
        let t = Self::read_into::<BytesReader, Zisofs_Header>(&_t_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        *self_rc.block_pointers.borrow_mut() = Vec::new();
        let l_block_pointers = ((*self_rc.header().num_blocks()? as i32) + (1 as i32));
        for _i in 0..l_block_pointers {
            self_rc.block_pointers.borrow_mut().push(_io.read_u4le()?.into());
        }
        Ok(())
    }
}
impl Zisofs {
    pub fn blocks(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<Zisofs_Block>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_blocks.get() {
            return Ok(self.blocks.borrow());
        }
        self.f_blocks.set(true);
        *self.blocks.borrow_mut() = Vec::new();
        let l_blocks = *self.header().num_blocks()?;
        for _i in 0..l_blocks {
            let f = |t : &mut Zisofs_Block| Ok(t.set_params((self.block_pointers()[_i as usize]).try_into().map_err(|_| KError::CastError)?, (self.block_pointers()[((_i as i32) + (1 as i32)) as usize]).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, Zisofs_Block>(&*_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
            self.blocks.borrow_mut().push(t);
        }
        Ok(self.blocks.borrow())
    }
}
impl Zisofs {
    pub fn header(&self) -> Ref<'_, OptRc<Zisofs_Header>> {
        self.header.borrow()
    }
}

/**
 * The final pointer (`block_pointers[header.num_blocks]`) indicates the end
 * of the last block. Typically this is also the end of the file data.
 */
impl Zisofs {
    pub fn block_pointers(&self) -> Ref<'_, Vec<u32>> {
        self.block_pointers.borrow()
    }
}
impl Zisofs {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Zisofs {
    pub fn header_raw(&self) -> Ref<'_, Vec<u8>> {
        self.header_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Zisofs_Block {
    pub _root: SharedType<Zisofs>,
    pub _parent: SharedType<Zisofs>,
    pub _self: SharedType<Self>,
    ofs_start: RefCell<u32>,
    ofs_end: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_data: Cell<bool>,
    data: RefCell<Vec<u8>>,
    f_len_data: Cell<bool>,
    len_data: RefCell<i32>,
}
impl KStruct for Zisofs_Block {
    type Root = Zisofs;
    type Parent = Zisofs;

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
impl Zisofs_Block {
    pub fn ofs_start(&self) -> Ref<'_, u32> {
        self.ofs_start.borrow()
    }
}
impl Zisofs_Block {
    pub fn ofs_end(&self) -> Ref<'_, u32> {
        self.ofs_end.borrow()
    }
}
impl Zisofs_Block {
    pub fn set_params(&mut self, ofs_start: u32, ofs_end: u32) {
        *self.ofs_start.borrow_mut() = ofs_start;
        *self.ofs_end.borrow_mut() = ofs_end;
    }
}
impl Zisofs_Block {
    pub fn data(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_data.get() {
            return Ok(self.data.borrow());
        }
        self.f_data.set(true);
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.ofs_start() as usize)?;
        *self.data.borrow_mut() = io.read_bytes(*self.len_data()? as usize)?.into();
        io.seek(_pos)?;
        Ok(self.data.borrow())
    }
    pub fn len_data(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_data.get() {
            return Ok(self.len_data.borrow());
        }
        self.f_len_data.set(true);
        *self.len_data.borrow_mut() = (((*self.ofs_end() as u32) - (*self.ofs_start() as u32))) as i32;
        Ok(self.len_data.borrow())
    }
}
impl Zisofs_Block {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Zisofs_Header {
    pub _root: SharedType<Zisofs>,
    pub _parent: SharedType<Zisofs>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    uncompressed_size: RefCell<u32>,
    len_header: RefCell<u8>,
    block_size_log2: RefCell<u8>,
    reserved: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_block_size: Cell<bool>,
    block_size: RefCell<i32>,
    f_num_blocks: Cell<bool>,
    num_blocks: RefCell<i32>,
}
impl KStruct for Zisofs_Header {
    type Root = Zisofs;
    type Parent = Zisofs;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(8 as usize)?.into();
        if !(*self_rc.magic() == vec![0x37u8, 0xe4u8, 0x53u8, 0x96u8, 0xc9u8, 0xdbu8, 0xd6u8, 0x7u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/seq/0".to_string() }));
        }
        *self_rc.uncompressed_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len_header.borrow_mut() = _io.read_u1()?.into();
        if !(((*self_rc.len_header() as u8) == (4 as u8))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/seq/2".to_string() }));
        }
        *self_rc.block_size_log2.borrow_mut() = _io.read_u1()?.into();
        if !( ((((*self_rc.block_size_log2() as u8) == (15 as u8))) || (((*self_rc.block_size_log2() as u8) == (16 as u8))) || (((*self_rc.block_size_log2() as u8) == (17 as u8)))) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotAnyOf, src_path: "/types/header/seq/3".to_string() }));
        }
        *self_rc.reserved.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/seq/4".to_string() }));
        }
        Ok(())
    }
}
impl Zisofs_Header {
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
        *self.block_size.borrow_mut() = (((1 as u8) << (*self.block_size_log2() as u8))) as i32;
        Ok(self.block_size.borrow())
    }

    /**
     * ceil(uncompressed_size / block_size)
     */
    pub fn num_blocks(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_blocks.get() {
            return Ok(self.num_blocks.borrow());
        }
        self.f_num_blocks.set(true);
        *self.num_blocks.borrow_mut() = (((((*self.uncompressed_size() as i32) / (*self.block_size()? as i32)) as i32) + (if ((((*self.uncompressed_size() as i32) % (*self.block_size()? as i32)) as i32) != (0 as i32)) { 1 } else { 0 } as i32))) as i32;
        Ok(self.num_blocks.borrow())
    }
}
impl Zisofs_Header {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}

/**
 * Size of the original uncompressed file
 */
impl Zisofs_Header {
    pub fn uncompressed_size(&self) -> Ref<'_, u32> {
        self.uncompressed_size.borrow()
    }
}

/**
 * header_size >> 2 (currently 4)
 */
impl Zisofs_Header {
    pub fn len_header(&self) -> Ref<'_, u8> {
        self.len_header.borrow()
    }
}
impl Zisofs_Header {
    pub fn block_size_log2(&self) -> Ref<'_, u8> {
        self.block_size_log2.borrow()
    }
}
impl Zisofs_Header {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Zisofs_Header {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

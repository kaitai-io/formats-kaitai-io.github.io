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
 * Format for Android DTB/DTBO partitions. It's kind of archive with
 * dtb/dtbo files. Used only when there is a separate unique partition
 * (dtb, dtbo) on an android device to organize device tree files.
 * The format consists of a header with info about size and number
 * of device tree entries and the entries themselves. This format
 * description could be used to extract device tree entries from a
 * partition images and decompile them with dtc (device tree compiler).
 * \sa https://source.android.com/docs/core/architecture/dto/partitions Source
 * \sa https://android.googlesource.com/platform/system/libufdt/+/refs/tags/android-10.0.0_r47 Source
 */

#[derive(Default, Debug, Clone)]
pub struct AndroidDto {
    pub _root: SharedType<AndroidDto>,
    pub _parent: SharedType<AndroidDto>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<AndroidDto_DtTableHeader>>,
    entries: RefCell<Vec<OptRc<AndroidDto_DtTableEntry>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AndroidDto {
    type Root = AndroidDto;
    type Parent = AndroidDto;

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
        let t = Self::read_into::<_, AndroidDto_DtTableHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        *self_rc.entries.borrow_mut() = Vec::new();
        let l_entries = *self_rc.header().dt_entry_count();
        for _i in 0..l_entries {
            let t = Self::read_into::<_, AndroidDto_DtTableEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.entries.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl AndroidDto {
}
impl AndroidDto {
    pub fn header(&self) -> Ref<'_, OptRc<AndroidDto_DtTableHeader>> {
        self.header.borrow()
    }
}
impl AndroidDto {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<AndroidDto_DtTableEntry>>> {
        self.entries.borrow()
    }
}
impl AndroidDto {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct AndroidDto_DtTableEntry {
    pub _root: SharedType<AndroidDto>,
    pub _parent: SharedType<AndroidDto>,
    pub _self: SharedType<Self>,
    dt_size: RefCell<u32>,
    dt_offset: RefCell<u32>,
    id: RefCell<u32>,
    rev: RefCell<u32>,
    custom: RefCell<Vec<u32>>,
    _io: RefCell<BytesReader>,
    f_body: Cell<bool>,
    body: RefCell<Vec<u8>>,
}
impl KStruct for AndroidDto_DtTableEntry {
    type Root = AndroidDto;
    type Parent = AndroidDto;

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
        *self_rc.dt_size.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.dt_offset.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.id.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.rev.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.custom.borrow_mut() = Vec::new();
        let l_custom = 4;
        for _i in 0..l_custom {
            self_rc.custom.borrow_mut().push(_io.read_u4be()?.into());
        }
        Ok(())
    }
}
impl AndroidDto_DtTableEntry {

    /**
     * DTB/DTBO file
     */
    pub fn body(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_body.get() {
            return Ok(self.body.borrow());
        }
        self.f_body.set(true);
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.dt_offset() as usize)?;
        *self.body.borrow_mut() = io.read_bytes(*self.dt_size() as usize)?.into();
        io.seek(_pos)?;
        Ok(self.body.borrow())
    }
}

/**
 * size of this entry
 */
impl AndroidDto_DtTableEntry {
    pub fn dt_size(&self) -> Ref<'_, u32> {
        self.dt_size.borrow()
    }
}

/**
 * offset from head of dt_table_header
 */
impl AndroidDto_DtTableEntry {
    pub fn dt_offset(&self) -> Ref<'_, u32> {
        self.dt_offset.borrow()
    }
}

/**
 * optional, must be zero if unused
 */
impl AndroidDto_DtTableEntry {
    pub fn id(&self) -> Ref<'_, u32> {
        self.id.borrow()
    }
}

/**
 * optional, must be zero if unused
 */
impl AndroidDto_DtTableEntry {
    pub fn rev(&self) -> Ref<'_, u32> {
        self.rev.borrow()
    }
}

/**
 * optional, must be zero if unused
 */
impl AndroidDto_DtTableEntry {
    pub fn custom(&self) -> Ref<'_, Vec<u32>> {
        self.custom.borrow()
    }
}
impl AndroidDto_DtTableEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct AndroidDto_DtTableHeader {
    pub _root: SharedType<AndroidDto>,
    pub _parent: SharedType<AndroidDto>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    total_size: RefCell<u32>,
    header_size: RefCell<u32>,
    dt_entry_size: RefCell<u32>,
    dt_entry_count: RefCell<u32>,
    dt_entries_offset: RefCell<u32>,
    page_size: RefCell<u32>,
    version: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AndroidDto_DtTableHeader {
    type Root = AndroidDto;
    type Parent = AndroidDto;

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
        if !(*self_rc.magic() == vec![0xd7u8, 0xb7u8, 0xabu8, 0x1eu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/dt_table_header/seq/0".to_string() }));
        }
        *self_rc.total_size.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.header_size.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.dt_entry_size.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.dt_entry_count.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.dt_entries_offset.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.page_size.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.version.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl AndroidDto_DtTableHeader {
}
impl AndroidDto_DtTableHeader {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}

/**
 * includes dt_table_header + all dt_table_entry and all dtb/dtbo
 */
impl AndroidDto_DtTableHeader {
    pub fn total_size(&self) -> Ref<'_, u32> {
        self.total_size.borrow()
    }
}

/**
 * sizeof(dt_table_header)
 */
impl AndroidDto_DtTableHeader {
    pub fn header_size(&self) -> Ref<'_, u32> {
        self.header_size.borrow()
    }
}

/**
 * sizeof(dt_table_entry)
 */
impl AndroidDto_DtTableHeader {
    pub fn dt_entry_size(&self) -> Ref<'_, u32> {
        self.dt_entry_size.borrow()
    }
}

/**
 * number of dt_table_entry
 */
impl AndroidDto_DtTableHeader {
    pub fn dt_entry_count(&self) -> Ref<'_, u32> {
        self.dt_entry_count.borrow()
    }
}

/**
 * offset to the first dt_table_entry from head of dt_table_header
 */
impl AndroidDto_DtTableHeader {
    pub fn dt_entries_offset(&self) -> Ref<'_, u32> {
        self.dt_entries_offset.borrow()
    }
}

/**
 * flash page size
 */
impl AndroidDto_DtTableHeader {
    pub fn page_size(&self) -> Ref<'_, u32> {
        self.page_size.borrow()
    }
}

/**
 * DTBO image version
 */
impl AndroidDto_DtTableHeader {
    pub fn version(&self) -> Ref<'_, u32> {
        self.version.borrow()
    }
}
impl AndroidDto_DtTableHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

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
 * It is a color scheme for visualising SPM scans.
 */

#[derive(Default, Debug, Clone)]
pub struct NtMdtPal {
    pub _root: SharedType<NtMdtPal>,
    pub _parent: SharedType<NtMdtPal>,
    pub _self: SharedType<Self>,
    signature: RefCell<Vec<u8>>,
    count: RefCell<u32>,
    meta: RefCell<Vec<OptRc<NtMdtPal_Meta>>>,
    something2: RefCell<Vec<u8>>,
    tables: RefCell<Vec<OptRc<NtMdtPal_ColTable>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NtMdtPal {
    type Root = NtMdtPal;
    type Parent = NtMdtPal;

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
        *self_rc.signature.borrow_mut() = _io.read_bytes(26 as usize)?.into();
        if !(*self_rc.signature() == vec![0x4eu8, 0x54u8, 0x2du8, 0x4du8, 0x44u8, 0x54u8, 0x20u8, 0x50u8, 0x61u8, 0x6cu8, 0x65u8, 0x74u8, 0x74u8, 0x65u8, 0x20u8, 0x46u8, 0x69u8, 0x6cu8, 0x65u8, 0x20u8, 0x20u8, 0x31u8, 0x2eu8, 0x30u8, 0x30u8, 0x21u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.count.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.meta.borrow_mut() = Vec::new();
        let l_meta = *self_rc.count();
        for _i in 0..l_meta {
            let t = Self::read_into::<_, NtMdtPal_Meta>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.meta.borrow_mut().push(t);
        }
        *self_rc.something2.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        *self_rc.tables.borrow_mut() = Vec::new();
        let l_tables = *self_rc.count();
        for _i in 0..l_tables {
            let f = |t : &mut NtMdtPal_ColTable| Ok(t.set_params((_i).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, NtMdtPal_ColTable>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            self_rc.tables.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl NtMdtPal {
}
impl NtMdtPal {
    pub fn signature(&self) -> Ref<'_, Vec<u8>> {
        self.signature.borrow()
    }
}
impl NtMdtPal {
    pub fn count(&self) -> Ref<'_, u32> {
        self.count.borrow()
    }
}
impl NtMdtPal {
    pub fn meta(&self) -> Ref<'_, Vec<OptRc<NtMdtPal_Meta>>> {
        self.meta.borrow()
    }
}
impl NtMdtPal {
    pub fn something2(&self) -> Ref<'_, Vec<u8>> {
        self.something2.borrow()
    }
}
impl NtMdtPal {
    pub fn tables(&self) -> Ref<'_, Vec<OptRc<NtMdtPal_ColTable>>> {
        self.tables.borrow()
    }
}
impl NtMdtPal {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdtPal_ColTable {
    pub _root: SharedType<NtMdtPal>,
    pub _parent: SharedType<NtMdtPal>,
    pub _self: SharedType<Self>,
    index: RefCell<u16>,
    size1: RefCell<u8>,
    unkn: RefCell<u8>,
    title: RefCell<String>,
    unkn1: RefCell<u16>,
    colors: RefCell<Vec<OptRc<NtMdtPal_Color>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NtMdtPal_ColTable {
    type Root = NtMdtPal;
    type Parent = NtMdtPal;

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
        *self_rc.size1.borrow_mut() = _io.read_u1()?.into();
        *self_rc.unkn.borrow_mut() = _io.read_u1()?.into();
        *self_rc.title.borrow_mut() = bytes_to_str(&_io.read_bytes(*_r.meta()[*self_rc.index() as usize].name_size() as usize)?.into(), "UTF-16LE")?;
        *self_rc.unkn1.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.colors.borrow_mut() = Vec::new();
        let l_colors = ((*_r.meta()[*self_rc.index() as usize].colors_count() as u16) - (1 as u16));
        for _i in 0..l_colors {
            let t = Self::read_into::<_, NtMdtPal_Color>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.colors.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl NtMdtPal_ColTable {
    pub fn index(&self) -> Ref<'_, u16> {
        self.index.borrow()
    }
}
impl NtMdtPal_ColTable {
    pub fn set_params(&mut self, index: u16) {
        *self.index.borrow_mut() = index;
    }
}
impl NtMdtPal_ColTable {
}
impl NtMdtPal_ColTable {
    pub fn size1(&self) -> Ref<'_, u8> {
        self.size1.borrow()
    }
}
impl NtMdtPal_ColTable {
    pub fn unkn(&self) -> Ref<'_, u8> {
        self.unkn.borrow()
    }
}
impl NtMdtPal_ColTable {
    pub fn title(&self) -> Ref<'_, String> {
        self.title.borrow()
    }
}
impl NtMdtPal_ColTable {
    pub fn unkn1(&self) -> Ref<'_, u16> {
        self.unkn1.borrow()
    }
}
impl NtMdtPal_ColTable {
    pub fn colors(&self) -> Ref<'_, Vec<OptRc<NtMdtPal_Color>>> {
        self.colors.borrow()
    }
}
impl NtMdtPal_ColTable {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdtPal_Color {
    pub _root: SharedType<NtMdtPal>,
    pub _parent: SharedType<NtMdtPal_ColTable>,
    pub _self: SharedType<Self>,
    red: RefCell<u8>,
    unkn: RefCell<u8>,
    blue: RefCell<u8>,
    green: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NtMdtPal_Color {
    type Root = NtMdtPal;
    type Parent = NtMdtPal_ColTable;

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
        *self_rc.red.borrow_mut() = _io.read_u1()?.into();
        *self_rc.unkn.borrow_mut() = _io.read_u1()?.into();
        *self_rc.blue.borrow_mut() = _io.read_u1()?.into();
        *self_rc.green.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl NtMdtPal_Color {
}
impl NtMdtPal_Color {
    pub fn red(&self) -> Ref<'_, u8> {
        self.red.borrow()
    }
}
impl NtMdtPal_Color {
    pub fn unkn(&self) -> Ref<'_, u8> {
        self.unkn.borrow()
    }
}
impl NtMdtPal_Color {
    pub fn blue(&self) -> Ref<'_, u8> {
        self.blue.borrow()
    }
}
impl NtMdtPal_Color {
    pub fn green(&self) -> Ref<'_, u8> {
        self.green.borrow()
    }
}
impl NtMdtPal_Color {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct NtMdtPal_Meta {
    pub _root: SharedType<NtMdtPal>,
    pub _parent: SharedType<NtMdtPal>,
    pub _self: SharedType<Self>,
    unkn00: RefCell<Vec<u8>>,
    unkn01: RefCell<Vec<u8>>,
    unkn02: RefCell<Vec<u8>>,
    unkn03: RefCell<Vec<u8>>,
    colors_count: RefCell<u16>,
    unkn10: RefCell<Vec<u8>>,
    unkn11: RefCell<Vec<u8>>,
    unkn12: RefCell<Vec<u8>>,
    name_size: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for NtMdtPal_Meta {
    type Root = NtMdtPal;
    type Parent = NtMdtPal;

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
        *self_rc.unkn00.borrow_mut() = _io.read_bytes(3 as usize)?.into();
        *self_rc.unkn01.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        *self_rc.unkn02.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        *self_rc.unkn03.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        *self_rc.colors_count.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.unkn10.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        *self_rc.unkn11.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        *self_rc.unkn12.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        *self_rc.name_size.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl NtMdtPal_Meta {
}

/**
 * usually 0s
 */
impl NtMdtPal_Meta {
    pub fn unkn00(&self) -> Ref<'_, Vec<u8>> {
        self.unkn00.borrow()
    }
}
impl NtMdtPal_Meta {
    pub fn unkn01(&self) -> Ref<'_, Vec<u8>> {
        self.unkn01.borrow()
    }
}
impl NtMdtPal_Meta {
    pub fn unkn02(&self) -> Ref<'_, Vec<u8>> {
        self.unkn02.borrow()
    }
}

/**
 * usually 0s
 */
impl NtMdtPal_Meta {
    pub fn unkn03(&self) -> Ref<'_, Vec<u8>> {
        self.unkn03.borrow()
    }
}
impl NtMdtPal_Meta {
    pub fn colors_count(&self) -> Ref<'_, u16> {
        self.colors_count.borrow()
    }
}

/**
 * usually 0s
 */
impl NtMdtPal_Meta {
    pub fn unkn10(&self) -> Ref<'_, Vec<u8>> {
        self.unkn10.borrow()
    }
}

/**
 * usually 4
 */
impl NtMdtPal_Meta {
    pub fn unkn11(&self) -> Ref<'_, Vec<u8>> {
        self.unkn11.borrow()
    }
}

/**
 * usually 0s
 */
impl NtMdtPal_Meta {
    pub fn unkn12(&self) -> Ref<'_, Vec<u8>> {
        self.unkn12.borrow()
    }
}
impl NtMdtPal_Meta {
    pub fn name_size(&self) -> Ref<'_, u16> {
        self.name_size.borrow()
    }
}
impl NtMdtPal_Meta {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

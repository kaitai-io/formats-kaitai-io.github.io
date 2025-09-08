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
 * \sa https://web.archive.org/web/20170215190034/http://rewiki.regengedanken.de/wiki/.AGG_(Heroes_of_Might_and_Magic) Source
 */

#[derive(Default, Debug, Clone)]
pub struct HeroesOfMightAndMagicAgg {
    pub _root: SharedType<HeroesOfMightAndMagicAgg>,
    pub _parent: SharedType<HeroesOfMightAndMagicAgg>,
    pub _self: SharedType<Self>,
    num_files: RefCell<u16>,
    entries: RefCell<Vec<OptRc<HeroesOfMightAndMagicAgg_Entry>>>,
    _io: RefCell<BytesReader>,
    filenames_raw: RefCell<Vec<Vec<u8>>>,
    f_filenames: Cell<bool>,
    filenames: RefCell<Vec<OptRc<HeroesOfMightAndMagicAgg_Filename>>>,
}
impl KStruct for HeroesOfMightAndMagicAgg {
    type Root = HeroesOfMightAndMagicAgg;
    type Parent = HeroesOfMightAndMagicAgg;

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
        *self_rc.num_files.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.entries.borrow_mut() = Vec::new();
        let l_entries = *self_rc.num_files();
        for _i in 0..l_entries {
            let t = Self::read_into::<_, HeroesOfMightAndMagicAgg_Entry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.entries.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl HeroesOfMightAndMagicAgg {
    pub fn filenames(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<HeroesOfMightAndMagicAgg_Filename>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_filenames.get() {
            return Ok(self.filenames.borrow());
        }
        self.f_filenames.set(true);
        let _pos = _io.pos();
        _io.seek(((*self.entries().last().ok_or(KError::EmptyIterator)?.offset() as u32) + (*self.entries().last().ok_or(KError::EmptyIterator)?.size() as u32)) as usize)?;
        *self.filenames_raw.borrow_mut() = Vec::new();
        *self.filenames.borrow_mut() = Vec::new();
        let l_filenames = *self.num_files();
        for _i in 0..l_filenames {
            self.filenames_raw.borrow_mut().push(_io.read_bytes(15 as usize)?.into());
            let filenames_raw = self.filenames_raw.borrow();
            let io_filenames_raw = BytesReader::from(filenames_raw.last().unwrap().clone());
            let t = Self::read_into::<BytesReader, HeroesOfMightAndMagicAgg_Filename>(&io_filenames_raw, Some(self._root.clone()), Some(self._self.clone()))?.into();
            self.filenames.borrow_mut().push(t);
        }
        _io.seek(_pos)?;
        Ok(self.filenames.borrow())
    }
}
impl HeroesOfMightAndMagicAgg {
    pub fn num_files(&self) -> Ref<'_, u16> {
        self.num_files.borrow()
    }
}
impl HeroesOfMightAndMagicAgg {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<HeroesOfMightAndMagicAgg_Entry>>> {
        self.entries.borrow()
    }
}
impl HeroesOfMightAndMagicAgg {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl HeroesOfMightAndMagicAgg {
    pub fn filenames_raw(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.filenames_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct HeroesOfMightAndMagicAgg_Entry {
    pub _root: SharedType<HeroesOfMightAndMagicAgg>,
    pub _parent: SharedType<HeroesOfMightAndMagicAgg>,
    pub _self: SharedType<Self>,
    hash: RefCell<u16>,
    offset: RefCell<u32>,
    size: RefCell<u32>,
    size2: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_body: Cell<bool>,
    body: RefCell<Vec<u8>>,
}
impl KStruct for HeroesOfMightAndMagicAgg_Entry {
    type Root = HeroesOfMightAndMagicAgg;
    type Parent = HeroesOfMightAndMagicAgg;

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
        *self_rc.hash.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.offset.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.size2.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl HeroesOfMightAndMagicAgg_Entry {
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
        let _pos = _io.pos();
        _io.seek(*self.offset() as usize)?;
        *self.body.borrow_mut() = _io.read_bytes(*self.size() as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.body.borrow())
    }
}
impl HeroesOfMightAndMagicAgg_Entry {
    pub fn hash(&self) -> Ref<'_, u16> {
        self.hash.borrow()
    }
}
impl HeroesOfMightAndMagicAgg_Entry {
    pub fn offset(&self) -> Ref<'_, u32> {
        self.offset.borrow()
    }
}
impl HeroesOfMightAndMagicAgg_Entry {
    pub fn size(&self) -> Ref<'_, u32> {
        self.size.borrow()
    }
}
impl HeroesOfMightAndMagicAgg_Entry {
    pub fn size2(&self) -> Ref<'_, u32> {
        self.size2.borrow()
    }
}
impl HeroesOfMightAndMagicAgg_Entry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct HeroesOfMightAndMagicAgg_Filename {
    pub _root: SharedType<HeroesOfMightAndMagicAgg>,
    pub _parent: SharedType<HeroesOfMightAndMagicAgg>,
    pub _self: SharedType<Self>,
    str: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for HeroesOfMightAndMagicAgg_Filename {
    type Root = HeroesOfMightAndMagicAgg;
    type Parent = HeroesOfMightAndMagicAgg;

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
        *self_rc.str.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?;
        Ok(())
    }
}
impl HeroesOfMightAndMagicAgg_Filename {
}
impl HeroesOfMightAndMagicAgg_Filename {
    pub fn str(&self) -> Ref<'_, String> {
        self.str.borrow()
    }
}
impl HeroesOfMightAndMagicAgg_Filename {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

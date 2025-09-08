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
 * [GNU gettext](https://www.gnu.org/software/gettext/) is a popular
 * solution in free/open source software world to do i18n/l10n of
 * software, by providing translated strings that will substitute
 * strings in original language (typically, English).
 * 
 * gettext .mo is a binary database format which stores these string
 * translation pairs in an efficient binary format, ready to be used by
 * gettext-enabled software. .mo format is a result of compilation of
 * text-based .po files using
 * [msgfmt](https://www.gnu.org/software/gettext/manual/html_node/msgfmt-Invocation.html#msgfmt-Invocation)
 * utility. The reverse conversion (.mo -> .po) is also possible using
 * [msgunfmt](https://www.gnu.org/software/gettext/manual/html_node/msgunfmt-Invocation.html#msgunfmt-Invocation)
 * decompiler utility.
 * \sa https://gitlab.com/worr/libintl Source
 */

#[derive(Default, Debug, Clone)]
pub struct GettextMo {
    pub _root: SharedType<GettextMo>,
    pub _parent: SharedType<GettextMo>,
    pub _self: SharedType<Self>,
    signature: RefCell<Vec<u8>>,
    mo: RefCell<OptRc<GettextMo_Mo>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for GettextMo {
    type Root = GettextMo;
    type Parent = GettextMo;

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
        *self_rc.signature.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        let t = Self::read_into::<_, GettextMo_Mo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.mo.borrow_mut() = t;
        Ok(())
    }
}
impl GettextMo {
}
impl GettextMo {
    pub fn signature(&self) -> Ref<'_, Vec<u8>> {
        self.signature.borrow()
    }
}
impl GettextMo {
    pub fn mo(&self) -> Ref<'_, OptRc<GettextMo_Mo>> {
        self.mo.borrow()
    }
}
impl GettextMo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct GettextMo_HashLookupIteration {
    pub _root: SharedType<GettextMo>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    idx: RefCell<u32>,
    collision_step: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_next: Cell<bool>,
    next: RefCell<OptRc<GettextMo_HashLookupIteration>>,
    f_next_idx: Cell<bool>,
    next_idx: RefCell<i32>,
    f_original: Cell<bool>,
    original: RefCell<String>,
    f_translation: Cell<bool>,
    translation: RefCell<String>,
}
impl KStruct for GettextMo_HashLookupIteration {
    type Root = GettextMo;
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
        Ok(())
    }
}
impl GettextMo_HashLookupIteration {
    pub fn idx(&self) -> Ref<'_, u32> {
        self.idx.borrow()
    }
}
impl GettextMo_HashLookupIteration {
    pub fn collision_step(&self) -> Ref<'_, u32> {
        self.collision_step.borrow()
    }
}
impl GettextMo_HashLookupIteration {
    pub fn set_params(&mut self, idx: u32, collision_step: u32) {
        *self.idx.borrow_mut() = idx;
        *self.collision_step.borrow_mut() = collision_step;
    }
}
impl GettextMo_HashLookupIteration {
    pub fn next(
        &self
    ) -> KResult<Ref<'_, OptRc<GettextMo_HashLookupIteration>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_next.get() {
            return Ok(self.next.borrow());
        }
        let _pos = _io.pos();
        _io.seek(0 as usize)?;
        let f = |t : &mut GettextMo_HashLookupIteration| Ok(t.set_params((*_r.mo().hashtable_items()?[*self.next_idx()? as usize].val()?).try_into().map_err(|_| KError::CastError)?, (*self.collision_step()).try_into().map_err(|_| KError::CastError)?));
        let t = Self::read_into_with_init::<_, GettextMo_HashLookupIteration>(&*_io, Some(self._root.clone()), None, &f)?.into();
        *self.next.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.next.borrow())
    }
    pub fn next_idx(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_next_idx.get() {
            return Ok(self.next_idx.borrow());
        }
        self.f_next_idx.set(true);
        *self.next_idx.borrow_mut() = (((((*self.idx() as u32) + (*self.collision_step() as u32)) as i32) - (if ((*self.idx() as i32) >= (((*_r.mo().num_hashtable_items() as u32) - (*self.collision_step() as u32)) as i32)) { *_r.mo().num_hashtable_items() } else { 0 } as i32))) as i32;
        Ok(self.next_idx.borrow())
    }
    pub fn original(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_original.get() {
            return Ok(self.original.borrow());
        }
        self.f_original.set(true);
        *self.original.borrow_mut() = _r.mo().originals()?[*self.idx() as usize].str()?.to_string();
        Ok(self.original.borrow())
    }
    pub fn translation(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_translation.get() {
            return Ok(self.translation.borrow());
        }
        self.f_translation.set(true);
        *self.translation.borrow_mut() = _r.mo().translations()?[*self.idx() as usize].str()?.to_string();
        Ok(self.translation.borrow())
    }
}
impl GettextMo_HashLookupIteration {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * def lookup(s:str, t:gettext_mo.GettextMo):
 *   try:
 *     l=gettext_mo.GettextMo.HashtableLookup(s, string_hash(s), t._io, _parent=t, _root=t)
 *     e=l.entry
 *     while(not e.found):
 *       e=e.next
 *     return e.current
 *   except:
 *     raise Exception("Not found "+s+" in the hashtable!")
 * 
 * lookup(t.mo.originals[145].str, t)
 * \sa https://gitlab.com/worr/libintl/raw/master/src/lib/libintl/gettext.c Source
 */

#[derive(Default, Debug, Clone)]
pub struct GettextMo_HashtableLookup {
    pub _root: SharedType<GettextMo>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    query: RefCell<String>,
    hash: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_collision_step: Cell<bool>,
    collision_step: RefCell<i32>,
    f_entry: Cell<bool>,
    entry: RefCell<OptRc<GettextMo_LookupIteration>>,
    f_hash_lookup_iteration: Cell<bool>,
    hash_lookup_iteration: RefCell<OptRc<GettextMo_HashLookupIteration>>,
    f_idx: Cell<bool>,
    idx: RefCell<i32>,
}
impl KStruct for GettextMo_HashtableLookup {
    type Root = GettextMo;
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
        Ok(())
    }
}
impl GettextMo_HashtableLookup {
    pub fn query(&self) -> Ref<'_, String> {
        self.query.borrow()
    }
}
impl GettextMo_HashtableLookup {
    pub fn hash(&self) -> Ref<'_, u32> {
        self.hash.borrow()
    }
}
impl GettextMo_HashtableLookup {
    pub fn set_params(&mut self, query: &String, hash: u32) {
        *self.query.borrow_mut() = query.clone();
        *self.hash.borrow_mut() = hash;
    }
}
impl GettextMo_HashtableLookup {
    pub fn collision_step(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_collision_step.get() {
            return Ok(self.collision_step.borrow());
        }
        self.f_collision_step.set(true);
        *self.collision_step.borrow_mut() = (((((*self.hash() as i32) % (((*_r.mo().num_hashtable_items() as u32) - (2 as u32)) as i32)) as i32) + (1 as i32))) as i32;
        Ok(self.collision_step.borrow())
    }
    pub fn entry(
        &self
    ) -> KResult<Ref<'_, OptRc<GettextMo_LookupIteration>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_entry.get() {
            return Ok(self.entry.borrow());
        }
        let _pos = _io.pos();
        _io.seek(0 as usize)?;
        let f = |t : &mut GettextMo_LookupIteration| Ok(t.set_params(&*self.hash_lookup_iteration()?, &*self.query()));
        let t = Self::read_into_with_init::<_, GettextMo_LookupIteration>(&*_io, Some(self._root.clone()), None, &f)?.into();
        *self.entry.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.entry.borrow())
    }
    pub fn hash_lookup_iteration(
        &self
    ) -> KResult<Ref<'_, OptRc<GettextMo_HashLookupIteration>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_hash_lookup_iteration.get() {
            return Ok(self.hash_lookup_iteration.borrow());
        }
        let _pos = _io.pos();
        _io.seek(0 as usize)?;
        let f = |t : &mut GettextMo_HashLookupIteration| Ok(t.set_params((*_r.mo().hashtable_items()?[*self.idx()? as usize].val()?).try_into().map_err(|_| KError::CastError)?, (*self.collision_step()?).try_into().map_err(|_| KError::CastError)?));
        let t = Self::read_into_with_init::<_, GettextMo_HashLookupIteration>(&*_io, Some(self._root.clone()), None, &f)?.into();
        *self.hash_lookup_iteration.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.hash_lookup_iteration.borrow())
    }
    pub fn idx(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_idx.get() {
            return Ok(self.idx.borrow());
        }
        self.f_idx.set(true);
        *self.idx.borrow_mut() = (((*self.hash() as u32) % (*_r.mo().num_hashtable_items() as u32))) as i32;
        Ok(self.idx.borrow())
    }
}
impl GettextMo_HashtableLookup {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct GettextMo_LookupIteration {
    pub _root: SharedType<GettextMo>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    current: RefCell<OptRc<GettextMo_HashLookupIteration>>,
    query: RefCell<String>,
    _io: RefCell<BytesReader>,
    f_found: Cell<bool>,
    found: RefCell<bool>,
    f_next: Cell<bool>,
    next: RefCell<OptRc<GettextMo_LookupIteration>>,
}
impl KStruct for GettextMo_LookupIteration {
    type Root = GettextMo;
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
        Ok(())
    }
}
impl GettextMo_LookupIteration {
    pub fn current(&self) -> Ref<'_, OptRc<GettextMo_HashLookupIteration>> {
        self.current.borrow()
    }
}
impl GettextMo_LookupIteration {
    pub fn query(&self) -> Ref<'_, String> {
        self.query.borrow()
    }
}
impl GettextMo_LookupIteration {
    pub fn set_params(&mut self, current: &OptRc<GettextMo_HashLookupIteration>, query: &String) {
        *self.current.borrow_mut() = current.clone();
        *self.query.borrow_mut() = query.clone();
    }
}
impl GettextMo_LookupIteration {
    pub fn found(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_found.get() {
            return Ok(self.found.borrow());
        }
        self.f_found.set(true);
        *self.found.borrow_mut() = (*self.query() == self.current().original()?.to_string()) as bool;
        Ok(self.found.borrow())
    }
    pub fn next(
        &self
    ) -> KResult<Ref<'_, OptRc<GettextMo_LookupIteration>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_next.get() {
            return Ok(self.next.borrow());
        }
        if !(*self.found()?) {
            let _pos = _io.pos();
            _io.seek(0 as usize)?;
            let f = |t : &mut GettextMo_LookupIteration| Ok(t.set_params(&*self.current().next()?, &*self.query()));
            let t = Self::read_into_with_init::<_, GettextMo_LookupIteration>(&*_io, Some(self._root.clone()), None, &f)?.into();
            *self.next.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.next.borrow())
    }
}
impl GettextMo_LookupIteration {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct GettextMo_Mo {
    pub _root: SharedType<GettextMo>,
    pub _parent: SharedType<GettextMo>,
    pub _self: SharedType<Self>,
    version: RefCell<OptRc<GettextMo_Mo_Version>>,
    num_translations: RefCell<u32>,
    ofs_originals: RefCell<u32>,
    ofs_translations: RefCell<u32>,
    num_hashtable_items: RefCell<u32>,
    ofs_hashtable_items: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_hashtable_items: Cell<bool>,
    hashtable_items: RefCell<Vec<OptRc<GettextMo_Mo_HashtableItem>>>,
    f_originals: Cell<bool>,
    originals: RefCell<Vec<OptRc<GettextMo_Mo_Descriptor>>>,
    f_translations: Cell<bool>,
    translations: RefCell<Vec<OptRc<GettextMo_Mo_Descriptor>>>,
    _is_le: RefCell<i32>,
}
impl KStruct for GettextMo_Mo {
    type Root = GettextMo;
    type Parent = GettextMo;

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
        {
            let on = _r.signature();
            if *on == vec![0xdeu8, 0x12u8, 0x4u8, 0x95u8] {
                *self_rc._is_le.borrow_mut() = (1) as i32;
            }
            else if *on == vec![0x95u8, 0x4u8, 0x12u8, 0xdeu8] {
                *self_rc._is_le.borrow_mut() = (2) as i32;
            }
        }
        if *self_rc._is_le.borrow() == 0 {
            return Err(KError::UndecidedEndianness { src_path: "/types/mo".to_string() });
        }
        let f = |t : &mut GettextMo_Mo_Version| Ok(t.set_endian(*self_rc._is_le.borrow()));
        let t = Self::read_into_with_init::<_, GettextMo_Mo_Version>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
        *self_rc.version.borrow_mut() = t;
        *self_rc.num_translations.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        *self_rc.ofs_originals.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        *self_rc.ofs_translations.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        *self_rc.num_hashtable_items.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        *self_rc.ofs_hashtable_items.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        Ok(())
    }
}
impl GettextMo_Mo {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl GettextMo_Mo {
    pub fn hashtable_items(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<GettextMo_Mo_HashtableItem>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_hashtable_items.get() {
            return Ok(self.hashtable_items.borrow());
        }
        self.f_hashtable_items.set(true);
        if ((*self.ofs_hashtable_items() as u32) != (0 as u32)) {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(*self.ofs_hashtable_items() as usize)?;
            *self.hashtable_items.borrow_mut() = Vec::new();
            let l_hashtable_items = *self.num_hashtable_items();
            for _i in 0..l_hashtable_items {
                let f = |t : &mut GettextMo_Mo_HashtableItem| Ok(t.set_endian(*self._is_le.borrow()));
                let t = Self::read_into_with_init::<BytesReader, GettextMo_Mo_HashtableItem>(&io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
                self.hashtable_items.borrow_mut().push(t);
            }
            io.seek(_pos)?;
        }
        Ok(self.hashtable_items.borrow())
    }
    pub fn originals(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<GettextMo_Mo_Descriptor>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_originals.get() {
            return Ok(self.originals.borrow());
        }
        self.f_originals.set(true);
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.ofs_originals() as usize)?;
        *self.originals.borrow_mut() = Vec::new();
        let l_originals = *self.num_translations();
        for _i in 0..l_originals {
            let f = |t : &mut GettextMo_Mo_Descriptor| Ok(t.set_endian(*self._is_le.borrow()));
            let t = Self::read_into_with_init::<BytesReader, GettextMo_Mo_Descriptor>(&io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
            self.originals.borrow_mut().push(t);
        }
        io.seek(_pos)?;
        Ok(self.originals.borrow())
    }
    pub fn translations(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<GettextMo_Mo_Descriptor>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_translations.get() {
            return Ok(self.translations.borrow());
        }
        self.f_translations.set(true);
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.ofs_translations() as usize)?;
        *self.translations.borrow_mut() = Vec::new();
        let l_translations = *self.num_translations();
        for _i in 0..l_translations {
            let f = |t : &mut GettextMo_Mo_Descriptor| Ok(t.set_endian(*self._is_le.borrow()));
            let t = Self::read_into_with_init::<BytesReader, GettextMo_Mo_Descriptor>(&io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
            self.translations.borrow_mut().push(t);
        }
        io.seek(_pos)?;
        Ok(self.translations.borrow())
    }
}
impl GettextMo_Mo {
    pub fn version(&self) -> Ref<'_, OptRc<GettextMo_Mo_Version>> {
        self.version.borrow()
    }
}
impl GettextMo_Mo {
    pub fn num_translations(&self) -> Ref<'_, u32> {
        self.num_translations.borrow()
    }
}
impl GettextMo_Mo {
    pub fn ofs_originals(&self) -> Ref<'_, u32> {
        self.ofs_originals.borrow()
    }
}
impl GettextMo_Mo {
    pub fn ofs_translations(&self) -> Ref<'_, u32> {
        self.ofs_translations.borrow()
    }
}
impl GettextMo_Mo {
    pub fn num_hashtable_items(&self) -> Ref<'_, u32> {
        self.num_hashtable_items.borrow()
    }
}
impl GettextMo_Mo {
    pub fn ofs_hashtable_items(&self) -> Ref<'_, u32> {
        self.ofs_hashtable_items.borrow()
    }
}
impl GettextMo_Mo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct GettextMo_Mo_Descriptor {
    pub _root: SharedType<GettextMo>,
    pub _parent: SharedType<GettextMo_Mo>,
    pub _self: SharedType<Self>,
    len_str: RefCell<u32>,
    ofs_str: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_str: Cell<bool>,
    str: RefCell<String>,
    _is_le: RefCell<i32>,
}
impl KStruct for GettextMo_Mo_Descriptor {
    type Root = GettextMo;
    type Parent = GettextMo_Mo;

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
        *self_rc.len_str.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        *self_rc.ofs_str.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        Ok(())
    }
}
impl GettextMo_Mo_Descriptor {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl GettextMo_Mo_Descriptor {
    pub fn str(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_str.get() {
            return Ok(self.str.borrow());
        }
        self.f_str.set(true);
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.ofs_str() as usize)?;
        *self.str.borrow_mut() = bytes_to_str(&bytes_terminate(&io.read_bytes(*self.len_str() as usize)?.into(), 0, false).into(), "UTF-8")?;
        io.seek(_pos)?;
        Ok(self.str.borrow())
    }
}
impl GettextMo_Mo_Descriptor {
    pub fn len_str(&self) -> Ref<'_, u32> {
        self.len_str.borrow()
    }
}
impl GettextMo_Mo_Descriptor {
    pub fn ofs_str(&self) -> Ref<'_, u32> {
        self.ofs_str.borrow()
    }
}
impl GettextMo_Mo_Descriptor {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct GettextMo_Mo_HashtableItem {
    pub _root: SharedType<GettextMo>,
    pub _parent: SharedType<GettextMo_Mo>,
    pub _self: SharedType<Self>,
    raw_val: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_is_system_dependent: Cell<bool>,
    is_system_dependent: RefCell<bool>,
    f_mask: Cell<bool>,
    mask: RefCell<i32>,
    f_val: Cell<bool>,
    val: RefCell<i32>,
    f_val_1: Cell<bool>,
    val_1: RefCell<i32>,
    _is_le: RefCell<i32>,
}
impl KStruct for GettextMo_Mo_HashtableItem {
    type Root = GettextMo;
    type Parent = GettextMo_Mo;

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
        *self_rc.raw_val.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        Ok(())
    }
}
impl GettextMo_Mo_HashtableItem {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl GettextMo_Mo_HashtableItem {
    pub fn is_system_dependent(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_system_dependent.get() {
            return Ok(self.is_system_dependent.borrow());
        }
        self.f_is_system_dependent.set(true);
        if ((*self.raw_val() as u32) != (0 as u32)) {
            *self.is_system_dependent.borrow_mut() = (((((*self.val_1()? as i32) & (*self.mask()? as i32)) as i32) == (1 as i32))) as bool;
        }
        Ok(self.is_system_dependent.borrow())
    }
    pub fn mask(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_mask.get() {
            return Ok(self.mask.borrow());
        }
        self.f_mask.set(true);
        *self.mask.borrow_mut() = (2147483648) as i32;
        Ok(self.mask.borrow())
    }
    pub fn val(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_val.get() {
            return Ok(self.val.borrow());
        }
        self.f_val.set(true);
        if ((*self.raw_val() as u32) != (0 as u32)) {
            *self.val.borrow_mut() = (((*self.val_1()? as i32) & (~(*self.mask()?) as i32))) as i32;
        }
        Ok(self.val.borrow())
    }
    pub fn val_1(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_val_1.get() {
            return Ok(self.val_1.borrow());
        }
        self.f_val_1.set(true);
        if ((*self.raw_val() as u32) != (0 as u32)) {
            *self.val_1.borrow_mut() = (((*self.raw_val() as u32) - (1 as u32))) as i32;
        }
        Ok(self.val_1.borrow())
    }
}
impl GettextMo_Mo_HashtableItem {
    pub fn raw_val(&self) -> Ref<'_, u32> {
        self.raw_val.borrow()
    }
}
impl GettextMo_Mo_HashtableItem {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct GettextMo_Mo_Version {
    pub _root: SharedType<GettextMo>,
    pub _parent: SharedType<GettextMo_Mo>,
    pub _self: SharedType<Self>,
    version_raw: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_major: Cell<bool>,
    major: RefCell<i32>,
    f_minor: Cell<bool>,
    minor: RefCell<i32>,
    _is_le: RefCell<i32>,
}
impl KStruct for GettextMo_Mo_Version {
    type Root = GettextMo;
    type Parent = GettextMo_Mo;

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
        *self_rc.version_raw.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        Ok(())
    }
}
impl GettextMo_Mo_Version {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl GettextMo_Mo_Version {
    pub fn major(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_major.get() {
            return Ok(self.major.borrow());
        }
        self.f_major.set(true);
        *self.major.borrow_mut() = (((*self.version_raw() as u32) >> (16 as u32))) as i32;
        Ok(self.major.borrow())
    }
    pub fn minor(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_minor.get() {
            return Ok(self.minor.borrow());
        }
        self.f_minor.set(true);
        *self.minor.borrow_mut() = (((*self.version_raw() as i32) & (65535 as i32))) as i32;
        Ok(self.minor.borrow())
    }
}
impl GettextMo_Mo_Version {
    pub fn version_raw(&self) -> Ref<'_, u32> {
        self.version_raw.borrow()
    }
}
impl GettextMo_Mo_Version {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

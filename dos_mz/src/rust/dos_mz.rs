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
 * DOS MZ file format is a traditional format for executables in MS-DOS
 * environment. Many modern formats (i.e. Windows PE) still maintain
 * compatibility stub with this format.
 * 
 * As opposed to .com file format (which basically sports one 64K code
 * segment of raw CPU instructions), DOS MZ .exe file format allowed
 * more flexible memory management, loading of larger programs and
 * added support for relocations.
 * \sa http://www.delorie.com/djgpp/doc/exe/ Source
 */

#[derive(Default, Debug, Clone)]
pub struct DosMz {
    pub _root: SharedType<DosMz>,
    pub _parent: SharedType<DosMz>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<DosMz_ExeHeader>>,
    body: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_relocations: Cell<bool>,
    relocations: RefCell<Vec<OptRc<DosMz_Relocation>>>,
}
impl KStruct for DosMz {
    type Root = DosMz;
    type Parent = DosMz;

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
        let t = Self::read_into::<_, DosMz_ExeHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        *self_rc.body.borrow_mut() = _io.read_bytes(*self_rc.header().len_body()? as usize)?.into();
        Ok(())
    }
}
impl DosMz {
    pub fn relocations(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<DosMz_Relocation>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_relocations.get() {
            return Ok(self.relocations.borrow());
        }
        self.f_relocations.set(true);
        if ((*self.header().mz().ofs_relocations() as u16) != (0 as u16)) {
            let io = Clone::clone(&*self.header()._io());
            let _pos = io.pos();
            io.seek(*self.header().mz().ofs_relocations() as usize)?;
            *self.relocations.borrow_mut() = Vec::new();
            let l_relocations = *self.header().mz().num_relocations();
            for _i in 0..l_relocations {
                let t = Self::read_into::<BytesReader, DosMz_Relocation>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                self.relocations.borrow_mut().push(t);
            }
            io.seek(_pos)?;
        }
        Ok(self.relocations.borrow())
    }
}
impl DosMz {
    pub fn header(&self) -> Ref<'_, OptRc<DosMz_ExeHeader>> {
        self.header.borrow()
    }
}
impl DosMz {
    pub fn body(&self) -> Ref<'_, Vec<u8>> {
        self.body.borrow()
    }
}
impl DosMz {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DosMz_ExeHeader {
    pub _root: SharedType<DosMz>,
    pub _parent: SharedType<DosMz>,
    pub _self: SharedType<Self>,
    mz: RefCell<OptRc<DosMz_MzHeader>>,
    rest_of_header: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_len_body: Cell<bool>,
    len_body: RefCell<i32>,
}
impl KStruct for DosMz_ExeHeader {
    type Root = DosMz;
    type Parent = DosMz;

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
        let t = Self::read_into::<_, DosMz_MzHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.mz.borrow_mut() = t;
        *self_rc.rest_of_header.borrow_mut() = _io.read_bytes(((*self_rc.mz().len_header()? as i32) - (28 as i32)) as usize)?.into();
        Ok(())
    }
}
impl DosMz_ExeHeader {
    pub fn len_body(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_body.get() {
            return Ok(self.len_body.borrow());
        }
        self.f_len_body.set(true);
        *self.len_body.borrow_mut() = (((if ((*self.mz().last_page_extra_bytes() as u16) == (0 as u16)) { ((*self.mz().num_pages() as i32) * (512 as i32)) } else { ((((((*self.mz().num_pages() as u16) - (1 as u16)) as i32) * (512 as i32)) as i32) + (*self.mz().last_page_extra_bytes() as i32)) } as i32) - (*self.mz().len_header()? as i32))) as i32;
        Ok(self.len_body.borrow())
    }
}
impl DosMz_ExeHeader {
    pub fn mz(&self) -> Ref<'_, OptRc<DosMz_MzHeader>> {
        self.mz.borrow()
    }
}
impl DosMz_ExeHeader {
    pub fn rest_of_header(&self) -> Ref<'_, Vec<u8>> {
        self.rest_of_header.borrow()
    }
}
impl DosMz_ExeHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DosMz_MzHeader {
    pub _root: SharedType<DosMz>,
    pub _parent: SharedType<DosMz_ExeHeader>,
    pub _self: SharedType<Self>,
    magic: RefCell<String>,
    last_page_extra_bytes: RefCell<u16>,
    num_pages: RefCell<u16>,
    num_relocations: RefCell<u16>,
    header_size: RefCell<u16>,
    min_allocation: RefCell<u16>,
    max_allocation: RefCell<u16>,
    initial_ss: RefCell<u16>,
    initial_sp: RefCell<u16>,
    checksum: RefCell<u16>,
    initial_ip: RefCell<u16>,
    initial_cs: RefCell<u16>,
    ofs_relocations: RefCell<u16>,
    overlay_id: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_len_header: Cell<bool>,
    len_header: RefCell<i32>,
}
impl KStruct for DosMz_MzHeader {
    type Root = DosMz;
    type Parent = DosMz_ExeHeader;

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
        *self_rc.magic.borrow_mut() = bytes_to_str(&_io.read_bytes(2 as usize)?.into(), "ASCII")?;
        if !( ((*self_rc.magic() == "MZ".to_string()) || (*self_rc.magic() == "ZM".to_string())) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotAnyOf, src_path: "/types/mz_header/seq/0".to_string() }));
        }
        *self_rc.last_page_extra_bytes.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.num_pages.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.num_relocations.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.header_size.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.min_allocation.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.max_allocation.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.initial_ss.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.initial_sp.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.checksum.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.initial_ip.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.initial_cs.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.ofs_relocations.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.overlay_id.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl DosMz_MzHeader {
    pub fn len_header(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_header.get() {
            return Ok(self.len_header.borrow());
        }
        self.f_len_header.set(true);
        *self.len_header.borrow_mut() = (((*self.header_size() as u16) * (16 as u16))) as i32;
        Ok(self.len_header.borrow())
    }
}
impl DosMz_MzHeader {
    pub fn magic(&self) -> Ref<'_, String> {
        self.magic.borrow()
    }
}
impl DosMz_MzHeader {
    pub fn last_page_extra_bytes(&self) -> Ref<'_, u16> {
        self.last_page_extra_bytes.borrow()
    }
}
impl DosMz_MzHeader {
    pub fn num_pages(&self) -> Ref<'_, u16> {
        self.num_pages.borrow()
    }
}
impl DosMz_MzHeader {
    pub fn num_relocations(&self) -> Ref<'_, u16> {
        self.num_relocations.borrow()
    }
}
impl DosMz_MzHeader {
    pub fn header_size(&self) -> Ref<'_, u16> {
        self.header_size.borrow()
    }
}
impl DosMz_MzHeader {
    pub fn min_allocation(&self) -> Ref<'_, u16> {
        self.min_allocation.borrow()
    }
}
impl DosMz_MzHeader {
    pub fn max_allocation(&self) -> Ref<'_, u16> {
        self.max_allocation.borrow()
    }
}
impl DosMz_MzHeader {
    pub fn initial_ss(&self) -> Ref<'_, u16> {
        self.initial_ss.borrow()
    }
}
impl DosMz_MzHeader {
    pub fn initial_sp(&self) -> Ref<'_, u16> {
        self.initial_sp.borrow()
    }
}
impl DosMz_MzHeader {
    pub fn checksum(&self) -> Ref<'_, u16> {
        self.checksum.borrow()
    }
}
impl DosMz_MzHeader {
    pub fn initial_ip(&self) -> Ref<'_, u16> {
        self.initial_ip.borrow()
    }
}
impl DosMz_MzHeader {
    pub fn initial_cs(&self) -> Ref<'_, u16> {
        self.initial_cs.borrow()
    }
}
impl DosMz_MzHeader {
    pub fn ofs_relocations(&self) -> Ref<'_, u16> {
        self.ofs_relocations.borrow()
    }
}
impl DosMz_MzHeader {
    pub fn overlay_id(&self) -> Ref<'_, u16> {
        self.overlay_id.borrow()
    }
}
impl DosMz_MzHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct DosMz_Relocation {
    pub _root: SharedType<DosMz>,
    pub _parent: SharedType<DosMz>,
    pub _self: SharedType<Self>,
    ofs: RefCell<u16>,
    seg: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for DosMz_Relocation {
    type Root = DosMz;
    type Parent = DosMz;

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
        *self_rc.ofs.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.seg.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl DosMz_Relocation {
}
impl DosMz_Relocation {
    pub fn ofs(&self) -> Ref<'_, u16> {
        self.ofs.borrow()
    }
}
impl DosMz_Relocation {
    pub fn seg(&self) -> Ref<'_, u16> {
        self.seg.borrow()
    }
}
impl DosMz_Relocation {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

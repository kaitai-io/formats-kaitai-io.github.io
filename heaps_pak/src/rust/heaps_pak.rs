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
 * \sa https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Reader.hx Source
 */

#[derive(Default, Debug, Clone)]
pub struct HeapsPak {
    pub _root: SharedType<HeapsPak>,
    pub _parent: SharedType<HeapsPak>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<HeapsPak_Header>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for HeapsPak {
    type Root = HeapsPak;
    type Parent = HeapsPak;

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
        let t = Self::read_into::<_, HeapsPak_Header>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        Ok(())
    }
}
impl HeapsPak {
}
impl HeapsPak {
    pub fn header(&self) -> Ref<'_, OptRc<HeapsPak_Header>> {
        self.header.borrow()
    }
}
impl HeapsPak {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct HeapsPak_Header {
    pub _root: SharedType<HeapsPak>,
    pub _parent: SharedType<HeapsPak>,
    pub _self: SharedType<Self>,
    magic1: RefCell<Vec<u8>>,
    version: RefCell<u8>,
    len_header: RefCell<u32>,
    len_data: RefCell<u32>,
    root_entry: RefCell<OptRc<HeapsPak_Header_Entry>>,
    magic2: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    root_entry_raw: RefCell<Vec<u8>>,
}
impl KStruct for HeapsPak_Header {
    type Root = HeapsPak;
    type Parent = HeapsPak;

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
        *self_rc.magic1.borrow_mut() = _io.read_bytes(3 as usize)?.into();
        if !(*self_rc.magic1() == vec![0x50u8, 0x41u8, 0x4bu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/seq/0".to_string() }));
        }
        *self_rc.version.borrow_mut() = _io.read_u1()?.into();
        *self_rc.len_header.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len_data.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.root_entry_raw.borrow_mut() = _io.read_bytes(((*self_rc.len_header() as u32) - (16 as u32)) as usize)?.into();
        let root_entry_raw = self_rc.root_entry_raw.borrow();
        let _t_root_entry_raw_io = BytesReader::from(root_entry_raw.clone());
        let t = Self::read_into::<BytesReader, HeapsPak_Header_Entry>(&_t_root_entry_raw_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.root_entry.borrow_mut() = t;
        *self_rc.magic2.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.magic2() == vec![0x44u8, 0x41u8, 0x54u8, 0x41u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/seq/5".to_string() }));
        }
        Ok(())
    }
}
impl HeapsPak_Header {
}
impl HeapsPak_Header {
    pub fn magic1(&self) -> Ref<'_, Vec<u8>> {
        self.magic1.borrow()
    }
}
impl HeapsPak_Header {
    pub fn version(&self) -> Ref<'_, u8> {
        self.version.borrow()
    }
}
impl HeapsPak_Header {
    pub fn len_header(&self) -> Ref<'_, u32> {
        self.len_header.borrow()
    }
}
impl HeapsPak_Header {
    pub fn len_data(&self) -> Ref<'_, u32> {
        self.len_data.borrow()
    }
}
impl HeapsPak_Header {
    pub fn root_entry(&self) -> Ref<'_, OptRc<HeapsPak_Header_Entry>> {
        self.root_entry.borrow()
    }
}
impl HeapsPak_Header {
    pub fn magic2(&self) -> Ref<'_, Vec<u8>> {
        self.magic2.borrow()
    }
}
impl HeapsPak_Header {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl HeapsPak_Header {
    pub fn root_entry_raw(&self) -> Ref<'_, Vec<u8>> {
        self.root_entry_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct HeapsPak_Header_Dir {
    pub _root: SharedType<HeapsPak>,
    pub _parent: SharedType<HeapsPak_Header_Entry>,
    pub _self: SharedType<Self>,
    num_entries: RefCell<u32>,
    entries: RefCell<Vec<OptRc<HeapsPak_Header_Entry>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for HeapsPak_Header_Dir {
    type Root = HeapsPak;
    type Parent = HeapsPak_Header_Entry;

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
        *self_rc.num_entries.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.entries.borrow_mut() = Vec::new();
        let l_entries = *self_rc.num_entries();
        for _i in 0..l_entries {
            let t = Self::read_into::<_, HeapsPak_Header_Entry>(&*_io, Some(self_rc._root.clone()), None)?.into();
            self_rc.entries.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl HeapsPak_Header_Dir {
}
impl HeapsPak_Header_Dir {
    pub fn num_entries(&self) -> Ref<'_, u32> {
        self.num_entries.borrow()
    }
}
impl HeapsPak_Header_Dir {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<HeapsPak_Header_Entry>>> {
        self.entries.borrow()
    }
}
impl HeapsPak_Header_Dir {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Data.hx Source
 */

#[derive(Default, Debug, Clone)]
pub struct HeapsPak_Header_Entry {
    pub _root: SharedType<HeapsPak>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    len_name: RefCell<u8>,
    name: RefCell<String>,
    flags: RefCell<OptRc<HeapsPak_Header_Entry_Flags>>,
    body: RefCell<Option<HeapsPak_Header_Entry_Body>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum HeapsPak_Header_Entry_Body {
    HeapsPak_Header_File(OptRc<HeapsPak_Header_File>),
    HeapsPak_Header_Dir(OptRc<HeapsPak_Header_Dir>),
}
impl From<&HeapsPak_Header_Entry_Body> for OptRc<HeapsPak_Header_File> {
    fn from(v: &HeapsPak_Header_Entry_Body) -> Self {
        if let HeapsPak_Header_Entry_Body::HeapsPak_Header_File(x) = v {
            return x.clone();
        }
        panic!("expected HeapsPak_Header_Entry_Body::HeapsPak_Header_File, got {:?}", v)
    }
}
impl From<OptRc<HeapsPak_Header_File>> for HeapsPak_Header_Entry_Body {
    fn from(v: OptRc<HeapsPak_Header_File>) -> Self {
        Self::HeapsPak_Header_File(v)
    }
}
impl From<&HeapsPak_Header_Entry_Body> for OptRc<HeapsPak_Header_Dir> {
    fn from(v: &HeapsPak_Header_Entry_Body) -> Self {
        if let HeapsPak_Header_Entry_Body::HeapsPak_Header_Dir(x) = v {
            return x.clone();
        }
        panic!("expected HeapsPak_Header_Entry_Body::HeapsPak_Header_Dir, got {:?}", v)
    }
}
impl From<OptRc<HeapsPak_Header_Dir>> for HeapsPak_Header_Entry_Body {
    fn from(v: OptRc<HeapsPak_Header_Dir>) -> Self {
        Self::HeapsPak_Header_Dir(v)
    }
}
impl KStruct for HeapsPak_Header_Entry {
    type Root = HeapsPak;
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
        *self_rc.len_name.borrow_mut() = _io.read_u1()?.into();
        *self_rc.name.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.len_name() as usize)?.into(), "UTF-8")?;
        let t = Self::read_into::<_, HeapsPak_Header_Entry_Flags>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.flags.borrow_mut() = t;
        {
            let on = self_rc.flags().is_dir();
            if *on == false {
                let t = Self::read_into::<_, HeapsPak_Header_File>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            else if *on == true {
                let t = Self::read_into::<_, HeapsPak_Header_Dir>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
        }
        Ok(())
    }
}
impl HeapsPak_Header_Entry {
}
impl HeapsPak_Header_Entry {
    pub fn len_name(&self) -> Ref<'_, u8> {
        self.len_name.borrow()
    }
}
impl HeapsPak_Header_Entry {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl HeapsPak_Header_Entry {
    pub fn flags(&self) -> Ref<'_, OptRc<HeapsPak_Header_Entry_Flags>> {
        self.flags.borrow()
    }
}
impl HeapsPak_Header_Entry {
    pub fn body(&self) -> Ref<'_, Option<HeapsPak_Header_Entry_Body>> {
        self.body.borrow()
    }
}
impl HeapsPak_Header_Entry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct HeapsPak_Header_Entry_Flags {
    pub _root: SharedType<HeapsPak>,
    pub _parent: SharedType<HeapsPak_Header_Entry>,
    pub _self: SharedType<Self>,
    unused: RefCell<u64>,
    is_dir: RefCell<bool>,
    _io: RefCell<BytesReader>,
}
impl KStruct for HeapsPak_Header_Entry_Flags {
    type Root = HeapsPak;
    type Parent = HeapsPak_Header_Entry;

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
        *self_rc.unused.borrow_mut() = _io.read_bits_int_be(7)?;
        *self_rc.is_dir.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        Ok(())
    }
}
impl HeapsPak_Header_Entry_Flags {
}
impl HeapsPak_Header_Entry_Flags {
    pub fn unused(&self) -> Ref<'_, u64> {
        self.unused.borrow()
    }
}
impl HeapsPak_Header_Entry_Flags {
    pub fn is_dir(&self) -> Ref<'_, bool> {
        self.is_dir.borrow()
    }
}
impl HeapsPak_Header_Entry_Flags {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct HeapsPak_Header_File {
    pub _root: SharedType<HeapsPak>,
    pub _parent: SharedType<HeapsPak_Header_Entry>,
    pub _self: SharedType<Self>,
    ofs_data: RefCell<u32>,
    len_data: RefCell<u32>,
    checksum: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_data: Cell<bool>,
    data: RefCell<Vec<u8>>,
}
impl KStruct for HeapsPak_Header_File {
    type Root = HeapsPak;
    type Parent = HeapsPak_Header_Entry;

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
        *self_rc.ofs_data.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len_data.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.checksum.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        Ok(())
    }
}
impl HeapsPak_Header_File {
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
        io.seek(((*_r.header().len_header() as u32) + (*self.ofs_data() as u32)) as usize)?;
        *self.data.borrow_mut() = io.read_bytes(*self.len_data() as usize)?.into();
        io.seek(_pos)?;
        Ok(self.data.borrow())
    }
}
impl HeapsPak_Header_File {
    pub fn ofs_data(&self) -> Ref<'_, u32> {
        self.ofs_data.borrow()
    }
}
impl HeapsPak_Header_File {
    pub fn len_data(&self) -> Ref<'_, u32> {
        self.len_data.borrow()
    }
}
impl HeapsPak_Header_File {
    pub fn checksum(&self) -> Ref<'_, Vec<u8>> {
        self.checksum.borrow()
    }
}
impl HeapsPak_Header_File {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

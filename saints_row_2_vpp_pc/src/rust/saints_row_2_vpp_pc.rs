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
pub struct SaintsRow2VppPc {
    pub _root: SharedType<SaintsRow2VppPc>,
    pub _parent: SharedType<SaintsRow2VppPc>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    pad1: RefCell<Vec<u8>>,
    num_files: RefCell<i32>,
    container_size: RefCell<i32>,
    len_offsets: RefCell<i32>,
    len_filenames: RefCell<i32>,
    len_extensions: RefCell<i32>,
    smth5: RefCell<i32>,
    smth6: RefCell<i32>,
    smth7: RefCell<i32>,
    smth8: RefCell<i32>,
    smth9: RefCell<i32>,
    _io: RefCell<BytesReader>,
    extensions_raw: RefCell<Vec<u8>>,
    filenames_raw: RefCell<Vec<u8>>,
    files_raw: RefCell<Vec<u8>>,
    f_data_start: Cell<bool>,
    data_start: RefCell<i32>,
    f_extensions: Cell<bool>,
    extensions: RefCell<OptRc<SaintsRow2VppPc_Strings>>,
    f_filenames: Cell<bool>,
    filenames: RefCell<OptRc<SaintsRow2VppPc_Strings>>,
    f_files: Cell<bool>,
    files: RefCell<OptRc<SaintsRow2VppPc_Offsets>>,
    f_ofs_extensions: Cell<bool>,
    ofs_extensions: RefCell<i32>,
    f_ofs_filenames: Cell<bool>,
    ofs_filenames: RefCell<i32>,
}
impl KStruct for SaintsRow2VppPc {
    type Root = SaintsRow2VppPc;
    type Parent = SaintsRow2VppPc;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(5 as usize)?.into();
        if !(*self_rc.magic() == vec![0xceu8, 0xau8, 0x89u8, 0x51u8, 0x4u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.pad1.borrow_mut() = _io.read_bytes(335 as usize)?.into();
        *self_rc.num_files.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.container_size.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.len_offsets.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.len_filenames.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.len_extensions.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.smth5.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.smth6.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.smth7.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.smth8.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.smth9.borrow_mut() = _io.read_s4le()?.into();
        Ok(())
    }
}
impl SaintsRow2VppPc {
    pub fn data_start(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_data_start.get() {
            return Ok(self.data_start.borrow());
        }
        self.f_data_start.set(true);
        *self.data_start.borrow_mut() = (((((((*self.ofs_extensions()? as i32) + (*self.len_extensions() as i32)) as i32) & (4294965248 as i32)) as i32) + (2048 as i32))) as i32;
        Ok(self.data_start.borrow())
    }
    pub fn extensions(
        &self
    ) -> KResult<Ref<'_, OptRc<SaintsRow2VppPc_Strings>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_extensions.get() {
            return Ok(self.extensions.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*self.ofs_extensions()? as usize)?;
        *self.extensions_raw.borrow_mut() = _io.read_bytes(*self.len_extensions() as usize)?.into();
        let extensions_raw = self.extensions_raw.borrow();
        let _t_extensions_raw_io = BytesReader::from(extensions_raw.clone());
        let t = Self::read_into::<BytesReader, SaintsRow2VppPc_Strings>(&_t_extensions_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.extensions.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.extensions.borrow())
    }
    pub fn filenames(
        &self
    ) -> KResult<Ref<'_, OptRc<SaintsRow2VppPc_Strings>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_filenames.get() {
            return Ok(self.filenames.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*self.ofs_filenames()? as usize)?;
        *self.filenames_raw.borrow_mut() = _io.read_bytes(*self.len_filenames() as usize)?.into();
        let filenames_raw = self.filenames_raw.borrow();
        let _t_filenames_raw_io = BytesReader::from(filenames_raw.clone());
        let t = Self::read_into::<BytesReader, SaintsRow2VppPc_Strings>(&_t_filenames_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.filenames.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.filenames.borrow())
    }
    pub fn files(
        &self
    ) -> KResult<Ref<'_, OptRc<SaintsRow2VppPc_Offsets>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_files.get() {
            return Ok(self.files.borrow());
        }
        let _pos = _io.pos();
        _io.seek(2048 as usize)?;
        *self.files_raw.borrow_mut() = _io.read_bytes(*self.len_offsets() as usize)?.into();
        let files_raw = self.files_raw.borrow();
        let _t_files_raw_io = BytesReader::from(files_raw.clone());
        let t = Self::read_into::<BytesReader, SaintsRow2VppPc_Offsets>(&_t_files_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.files.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.files.borrow())
    }
    pub fn ofs_extensions(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ofs_extensions.get() {
            return Ok(self.ofs_extensions.borrow());
        }
        self.f_ofs_extensions.set(true);
        *self.ofs_extensions.borrow_mut() = (((((((*self.ofs_filenames()? as i32) + (*self.len_filenames() as i32)) as i32) & (4294965248 as i32)) as i32) + (2048 as i32))) as i32;
        Ok(self.ofs_extensions.borrow())
    }
    pub fn ofs_filenames(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ofs_filenames.get() {
            return Ok(self.ofs_filenames.borrow());
        }
        self.f_ofs_filenames.set(true);
        *self.ofs_filenames.borrow_mut() = (((((((2048 as i32) + (*self.len_offsets() as i32)) as i32) & (4294965248 as i32)) as i32) + (2048 as i32))) as i32;
        Ok(self.ofs_filenames.borrow())
    }
}
impl SaintsRow2VppPc {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl SaintsRow2VppPc {
    pub fn pad1(&self) -> Ref<'_, Vec<u8>> {
        self.pad1.borrow()
    }
}
impl SaintsRow2VppPc {
    pub fn num_files(&self) -> Ref<'_, i32> {
        self.num_files.borrow()
    }
}
impl SaintsRow2VppPc {
    pub fn container_size(&self) -> Ref<'_, i32> {
        self.container_size.borrow()
    }
}
impl SaintsRow2VppPc {
    pub fn len_offsets(&self) -> Ref<'_, i32> {
        self.len_offsets.borrow()
    }
}
impl SaintsRow2VppPc {
    pub fn len_filenames(&self) -> Ref<'_, i32> {
        self.len_filenames.borrow()
    }
}
impl SaintsRow2VppPc {
    pub fn len_extensions(&self) -> Ref<'_, i32> {
        self.len_extensions.borrow()
    }
}
impl SaintsRow2VppPc {
    pub fn smth5(&self) -> Ref<'_, i32> {
        self.smth5.borrow()
    }
}
impl SaintsRow2VppPc {
    pub fn smth6(&self) -> Ref<'_, i32> {
        self.smth6.borrow()
    }
}
impl SaintsRow2VppPc {
    pub fn smth7(&self) -> Ref<'_, i32> {
        self.smth7.borrow()
    }
}
impl SaintsRow2VppPc {
    pub fn smth8(&self) -> Ref<'_, i32> {
        self.smth8.borrow()
    }
}
impl SaintsRow2VppPc {
    pub fn smth9(&self) -> Ref<'_, i32> {
        self.smth9.borrow()
    }
}
impl SaintsRow2VppPc {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl SaintsRow2VppPc {
    pub fn extensions_raw(&self) -> Ref<'_, Vec<u8>> {
        self.extensions_raw.borrow()
    }
}
impl SaintsRow2VppPc {
    pub fn filenames_raw(&self) -> Ref<'_, Vec<u8>> {
        self.filenames_raw.borrow()
    }
}
impl SaintsRow2VppPc {
    pub fn files_raw(&self) -> Ref<'_, Vec<u8>> {
        self.files_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct SaintsRow2VppPc_Offsets {
    pub _root: SharedType<SaintsRow2VppPc>,
    pub _parent: SharedType<SaintsRow2VppPc>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<SaintsRow2VppPc_Offsets_Offset>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SaintsRow2VppPc_Offsets {
    type Root = SaintsRow2VppPc;
    type Parent = SaintsRow2VppPc;

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
                let t = Self::read_into::<_, SaintsRow2VppPc_Offsets_Offset>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl SaintsRow2VppPc_Offsets {
}
impl SaintsRow2VppPc_Offsets {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<SaintsRow2VppPc_Offsets_Offset>>> {
        self.entries.borrow()
    }
}
impl SaintsRow2VppPc_Offsets {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct SaintsRow2VppPc_Offsets_Offset {
    pub _root: SharedType<SaintsRow2VppPc>,
    pub _parent: SharedType<SaintsRow2VppPc_Offsets>,
    pub _self: SharedType<Self>,
    name_ofs: RefCell<u32>,
    ext_ofs: RefCell<u32>,
    smth2: RefCell<i32>,
    ofs_body: RefCell<i32>,
    len_body: RefCell<i32>,
    always_minus_1: RefCell<i32>,
    always_zero: RefCell<i32>,
    _io: RefCell<BytesReader>,
    f_body: Cell<bool>,
    body: RefCell<Vec<u8>>,
    f_ext: Cell<bool>,
    ext: RefCell<String>,
    f_filename: Cell<bool>,
    filename: RefCell<String>,
}
impl KStruct for SaintsRow2VppPc_Offsets_Offset {
    type Root = SaintsRow2VppPc;
    type Parent = SaintsRow2VppPc_Offsets;

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
        *self_rc.name_ofs.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ext_ofs.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.smth2.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.ofs_body.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.len_body.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.always_minus_1.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.always_zero.borrow_mut() = _io.read_s4le()?.into();
        Ok(())
    }
}
impl SaintsRow2VppPc_Offsets_Offset {
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
        io.seek(((*_r.data_start()? as i32) + (*self.ofs_body() as i32)) as usize)?;
        *self.body.borrow_mut() = io.read_bytes(*self.len_body() as usize)?.into();
        io.seek(_pos)?;
        Ok(self.body.borrow())
    }
    pub fn ext(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ext.get() {
            return Ok(self.ext.borrow());
        }
        self.f_ext.set(true);
        let io = Clone::clone(&*_r.extensions()?._io());
        let _pos = io.pos();
        io.seek(*self.ext_ofs() as usize)?;
        *self.ext.borrow_mut() = bytes_to_str(&io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?;
        io.seek(_pos)?;
        Ok(self.ext.borrow())
    }
    pub fn filename(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_filename.get() {
            return Ok(self.filename.borrow());
        }
        self.f_filename.set(true);
        let io = Clone::clone(&*_r.filenames()?._io());
        let _pos = io.pos();
        io.seek(*self.name_ofs() as usize)?;
        *self.filename.borrow_mut() = bytes_to_str(&io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?;
        io.seek(_pos)?;
        Ok(self.filename.borrow())
    }
}
impl SaintsRow2VppPc_Offsets_Offset {
    pub fn name_ofs(&self) -> Ref<'_, u32> {
        self.name_ofs.borrow()
    }
}
impl SaintsRow2VppPc_Offsets_Offset {
    pub fn ext_ofs(&self) -> Ref<'_, u32> {
        self.ext_ofs.borrow()
    }
}
impl SaintsRow2VppPc_Offsets_Offset {
    pub fn smth2(&self) -> Ref<'_, i32> {
        self.smth2.borrow()
    }
}
impl SaintsRow2VppPc_Offsets_Offset {
    pub fn ofs_body(&self) -> Ref<'_, i32> {
        self.ofs_body.borrow()
    }
}
impl SaintsRow2VppPc_Offsets_Offset {
    pub fn len_body(&self) -> Ref<'_, i32> {
        self.len_body.borrow()
    }
}
impl SaintsRow2VppPc_Offsets_Offset {
    pub fn always_minus_1(&self) -> Ref<'_, i32> {
        self.always_minus_1.borrow()
    }
}
impl SaintsRow2VppPc_Offsets_Offset {
    pub fn always_zero(&self) -> Ref<'_, i32> {
        self.always_zero.borrow()
    }
}
impl SaintsRow2VppPc_Offsets_Offset {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct SaintsRow2VppPc_Strings {
    pub _root: SharedType<SaintsRow2VppPc>,
    pub _parent: SharedType<SaintsRow2VppPc>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<String>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SaintsRow2VppPc_Strings {
    type Root = SaintsRow2VppPc;
    type Parent = SaintsRow2VppPc;

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
                self_rc.entries.borrow_mut().push(bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "UTF-8")?);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl SaintsRow2VppPc_Strings {
}
impl SaintsRow2VppPc_Strings {
    pub fn entries(&self) -> Ref<'_, Vec<String>> {
        self.entries.borrow()
    }
}
impl SaintsRow2VppPc_Strings {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

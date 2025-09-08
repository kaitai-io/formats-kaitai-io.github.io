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
 * .trd file is a raw dump of TR-DOS (ZX-Spectrum) floppy. .trd files are
 * headerless and contain consequent "logical tracks", each logical track
 * consists of 16 256-byte sectors.
 * 
 * Logical tracks are defined the same way as used by TR-DOS: for single-side
 * floppies it's just a physical track number, for two-side floppies sides are
 * interleaved, i.e. logical_track_num = (physical_track_num << 1) | side
 * 
 * So, this format definition is more for TR-DOS filesystem than for .trd files,
 * which are formatless.
 * 
 * Strings (file names, disk label, disk password) are padded with spaces and use
 * ZX Spectrum character set, including UDGs, block drawing chars and Basic
 * tokens. ASCII range is mostly standard ASCII, with few characters (^, `, DEL)
 * replaced with (up arrow, pound, copyright symbol).
 * 
 * .trd file can be smaller than actual floppy disk, if last logical tracks are
 * empty (contain no file data) they can be omitted.
 */

#[derive(Default, Debug, Clone)]
pub struct TrDosImage {
    pub _root: SharedType<TrDosImage>,
    pub _parent: SharedType<TrDosImage>,
    pub _self: SharedType<Self>,
    files: RefCell<Vec<OptRc<TrDosImage_File>>>,
    _io: RefCell<BytesReader>,
    f_volume_info: Cell<bool>,
    volume_info: RefCell<OptRc<TrDosImage_VolumeInfo>>,
}
impl KStruct for TrDosImage {
    type Root = TrDosImage;
    type Parent = TrDosImage;

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
        *self_rc.files.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let t = Self::read_into::<_, TrDosImage_File>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.files.borrow_mut().push(t);
                let _t_files = self_rc.files.borrow();
                let _tmpa = _t_files.last().unwrap();
                _i += 1;
                let x = !(*_tmpa.is_terminator()?);
                x
            } {}
        }
        Ok(())
    }
}
impl TrDosImage {
    pub fn volume_info(
        &self
    ) -> KResult<Ref<'_, OptRc<TrDosImage_VolumeInfo>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_volume_info.get() {
            return Ok(self.volume_info.borrow());
        }
        let _pos = _io.pos();
        _io.seek(2048 as usize)?;
        let t = Self::read_into::<_, TrDosImage_VolumeInfo>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.volume_info.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.volume_info.borrow())
    }
}
impl TrDosImage {
    pub fn files(&self) -> Ref<'_, Vec<OptRc<TrDosImage_File>>> {
        self.files.borrow()
    }
}
impl TrDosImage {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum TrDosImage_DiskType {
    Type80TracksDoubleSide,
    Type40TracksDoubleSide,
    Type80TracksSingleSide,
    Type40TracksSingleSide,
    Unknown(i64),
}

impl TryFrom<i64> for TrDosImage_DiskType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<TrDosImage_DiskType> {
        match flag {
            22 => Ok(TrDosImage_DiskType::Type80TracksDoubleSide),
            23 => Ok(TrDosImage_DiskType::Type40TracksDoubleSide),
            24 => Ok(TrDosImage_DiskType::Type80TracksSingleSide),
            25 => Ok(TrDosImage_DiskType::Type40TracksSingleSide),
            _ => Ok(TrDosImage_DiskType::Unknown(flag)),
        }
    }
}

impl From<&TrDosImage_DiskType> for i64 {
    fn from(v: &TrDosImage_DiskType) -> Self {
        match *v {
            TrDosImage_DiskType::Type80TracksDoubleSide => 22,
            TrDosImage_DiskType::Type40TracksDoubleSide => 23,
            TrDosImage_DiskType::Type80TracksSingleSide => 24,
            TrDosImage_DiskType::Type40TracksSingleSide => 25,
            TrDosImage_DiskType::Unknown(v) => v
        }
    }
}

impl Default for TrDosImage_DiskType {
    fn default() -> Self { TrDosImage_DiskType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct TrDosImage_File {
    pub _root: SharedType<TrDosImage>,
    pub _parent: SharedType<TrDosImage>,
    pub _self: SharedType<Self>,
    name: RefCell<OptRc<TrDosImage_Filename>>,
    extension: RefCell<u8>,
    position_and_length: RefCell<Option<TrDosImage_File_PositionAndLength>>,
    length_sectors: RefCell<u8>,
    starting_sector: RefCell<u8>,
    starting_track: RefCell<u8>,
    _io: RefCell<BytesReader>,
    name_raw: RefCell<Vec<u8>>,
    f_contents: Cell<bool>,
    contents: RefCell<Vec<u8>>,
    f_is_deleted: Cell<bool>,
    is_deleted: RefCell<bool>,
    f_is_terminator: Cell<bool>,
    is_terminator: RefCell<bool>,
}
#[derive(Debug, Clone)]
pub enum TrDosImage_File_PositionAndLength {
    TrDosImage_PositionAndLengthPrint(OptRc<TrDosImage_PositionAndLengthPrint>),
    TrDosImage_PositionAndLengthBasic(OptRc<TrDosImage_PositionAndLengthBasic>),
    TrDosImage_PositionAndLengthCode(OptRc<TrDosImage_PositionAndLengthCode>),
    TrDosImage_PositionAndLengthGeneric(OptRc<TrDosImage_PositionAndLengthGeneric>),
}
impl From<&TrDosImage_File_PositionAndLength> for OptRc<TrDosImage_PositionAndLengthPrint> {
    fn from(v: &TrDosImage_File_PositionAndLength) -> Self {
        if let TrDosImage_File_PositionAndLength::TrDosImage_PositionAndLengthPrint(x) = v {
            return x.clone();
        }
        panic!("expected TrDosImage_File_PositionAndLength::TrDosImage_PositionAndLengthPrint, got {:?}", v)
    }
}
impl From<OptRc<TrDosImage_PositionAndLengthPrint>> for TrDosImage_File_PositionAndLength {
    fn from(v: OptRc<TrDosImage_PositionAndLengthPrint>) -> Self {
        Self::TrDosImage_PositionAndLengthPrint(v)
    }
}
impl From<&TrDosImage_File_PositionAndLength> for OptRc<TrDosImage_PositionAndLengthBasic> {
    fn from(v: &TrDosImage_File_PositionAndLength) -> Self {
        if let TrDosImage_File_PositionAndLength::TrDosImage_PositionAndLengthBasic(x) = v {
            return x.clone();
        }
        panic!("expected TrDosImage_File_PositionAndLength::TrDosImage_PositionAndLengthBasic, got {:?}", v)
    }
}
impl From<OptRc<TrDosImage_PositionAndLengthBasic>> for TrDosImage_File_PositionAndLength {
    fn from(v: OptRc<TrDosImage_PositionAndLengthBasic>) -> Self {
        Self::TrDosImage_PositionAndLengthBasic(v)
    }
}
impl From<&TrDosImage_File_PositionAndLength> for OptRc<TrDosImage_PositionAndLengthCode> {
    fn from(v: &TrDosImage_File_PositionAndLength) -> Self {
        if let TrDosImage_File_PositionAndLength::TrDosImage_PositionAndLengthCode(x) = v {
            return x.clone();
        }
        panic!("expected TrDosImage_File_PositionAndLength::TrDosImage_PositionAndLengthCode, got {:?}", v)
    }
}
impl From<OptRc<TrDosImage_PositionAndLengthCode>> for TrDosImage_File_PositionAndLength {
    fn from(v: OptRc<TrDosImage_PositionAndLengthCode>) -> Self {
        Self::TrDosImage_PositionAndLengthCode(v)
    }
}
impl From<&TrDosImage_File_PositionAndLength> for OptRc<TrDosImage_PositionAndLengthGeneric> {
    fn from(v: &TrDosImage_File_PositionAndLength) -> Self {
        if let TrDosImage_File_PositionAndLength::TrDosImage_PositionAndLengthGeneric(x) = v {
            return x.clone();
        }
        panic!("expected TrDosImage_File_PositionAndLength::TrDosImage_PositionAndLengthGeneric, got {:?}", v)
    }
}
impl From<OptRc<TrDosImage_PositionAndLengthGeneric>> for TrDosImage_File_PositionAndLength {
    fn from(v: OptRc<TrDosImage_PositionAndLengthGeneric>) -> Self {
        Self::TrDosImage_PositionAndLengthGeneric(v)
    }
}
impl KStruct for TrDosImage_File {
    type Root = TrDosImage;
    type Parent = TrDosImage;

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
        *self_rc.name_raw.borrow_mut() = _io.read_bytes(8 as usize)?.into();
        let name_raw = self_rc.name_raw.borrow();
        let _t_name_raw_io = BytesReader::from(name_raw.clone());
        let t = Self::read_into::<BytesReader, TrDosImage_Filename>(&_t_name_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.name.borrow_mut() = t;
        *self_rc.extension.borrow_mut() = _io.read_u1()?.into();
        match *self_rc.extension() {
            35 => {
                let t = Self::read_into::<_, TrDosImage_PositionAndLengthPrint>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.position_and_length.borrow_mut() = Some(t);
            }
            66 => {
                let t = Self::read_into::<_, TrDosImage_PositionAndLengthBasic>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.position_and_length.borrow_mut() = Some(t);
            }
            67 => {
                let t = Self::read_into::<_, TrDosImage_PositionAndLengthCode>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.position_and_length.borrow_mut() = Some(t);
            }
            _ => {
                let t = Self::read_into::<_, TrDosImage_PositionAndLengthGeneric>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.position_and_length.borrow_mut() = Some(t);
            }
        }
        *self_rc.length_sectors.borrow_mut() = _io.read_u1()?.into();
        *self_rc.starting_sector.borrow_mut() = _io.read_u1()?.into();
        *self_rc.starting_track.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl TrDosImage_File {
    pub fn contents(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_contents.get() {
            return Ok(self.contents.borrow());
        }
        self.f_contents.set(true);
        let _pos = _io.pos();
        _io.seek(((((((*self.starting_track() as i32) * (256 as i32)) as i32) * (16 as i32)) as i32) + (((*self.starting_sector() as i32) * (256 as i32)) as i32)) as usize)?;
        *self.contents.borrow_mut() = _io.read_bytes(((*self.length_sectors() as i32) * (256 as i32)) as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.contents.borrow())
    }
    pub fn is_deleted(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_deleted.get() {
            return Ok(self.is_deleted.borrow());
        }
        self.f_is_deleted.set(true);
        *self.is_deleted.borrow_mut() = (((*self.name().first_byte()? as u8) == (1 as u8))) as bool;
        Ok(self.is_deleted.borrow())
    }
    pub fn is_terminator(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_terminator.get() {
            return Ok(self.is_terminator.borrow());
        }
        self.f_is_terminator.set(true);
        *self.is_terminator.borrow_mut() = (((*self.name().first_byte()? as u8) == (0 as u8))) as bool;
        Ok(self.is_terminator.borrow())
    }
}
impl TrDosImage_File {
    pub fn name(&self) -> Ref<'_, OptRc<TrDosImage_Filename>> {
        self.name.borrow()
    }
}
impl TrDosImage_File {
    pub fn extension(&self) -> Ref<'_, u8> {
        self.extension.borrow()
    }
}
impl TrDosImage_File {
    pub fn position_and_length(&self) -> Ref<'_, Option<TrDosImage_File_PositionAndLength>> {
        self.position_and_length.borrow()
    }
}
impl TrDosImage_File {
    pub fn length_sectors(&self) -> Ref<'_, u8> {
        self.length_sectors.borrow()
    }
}
impl TrDosImage_File {
    pub fn starting_sector(&self) -> Ref<'_, u8> {
        self.starting_sector.borrow()
    }
}
impl TrDosImage_File {
    pub fn starting_track(&self) -> Ref<'_, u8> {
        self.starting_track.borrow()
    }
}
impl TrDosImage_File {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl TrDosImage_File {
    pub fn name_raw(&self) -> Ref<'_, Vec<u8>> {
        self.name_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct TrDosImage_Filename {
    pub _root: SharedType<TrDosImage>,
    pub _parent: SharedType<TrDosImage_File>,
    pub _self: SharedType<Self>,
    name: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_first_byte: Cell<bool>,
    first_byte: RefCell<u8>,
}
impl KStruct for TrDosImage_Filename {
    type Root = TrDosImage;
    type Parent = TrDosImage_File;

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
        *self_rc.name.borrow_mut() = _io.read_bytes(8 as usize)?.into();
        Ok(())
    }
}
impl TrDosImage_Filename {
    pub fn first_byte(
        &self
    ) -> KResult<Ref<'_, u8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_first_byte.get() {
            return Ok(self.first_byte.borrow());
        }
        self.f_first_byte.set(true);
        let _pos = _io.pos();
        _io.seek(0 as usize)?;
        *self.first_byte.borrow_mut() = _io.read_u1()?.into();
        _io.seek(_pos)?;
        Ok(self.first_byte.borrow())
    }
}
impl TrDosImage_Filename {
    pub fn name(&self) -> Ref<'_, Vec<u8>> {
        self.name.borrow()
    }
}
impl TrDosImage_Filename {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct TrDosImage_PositionAndLengthBasic {
    pub _root: SharedType<TrDosImage>,
    pub _parent: SharedType<TrDosImage_File>,
    pub _self: SharedType<Self>,
    program_and_data_length: RefCell<u16>,
    program_length: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for TrDosImage_PositionAndLengthBasic {
    type Root = TrDosImage;
    type Parent = TrDosImage_File;

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
        *self_rc.program_and_data_length.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.program_length.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl TrDosImage_PositionAndLengthBasic {
}
impl TrDosImage_PositionAndLengthBasic {
    pub fn program_and_data_length(&self) -> Ref<'_, u16> {
        self.program_and_data_length.borrow()
    }
}
impl TrDosImage_PositionAndLengthBasic {
    pub fn program_length(&self) -> Ref<'_, u16> {
        self.program_length.borrow()
    }
}
impl TrDosImage_PositionAndLengthBasic {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct TrDosImage_PositionAndLengthCode {
    pub _root: SharedType<TrDosImage>,
    pub _parent: SharedType<TrDosImage_File>,
    pub _self: SharedType<Self>,
    start_address: RefCell<u16>,
    length: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for TrDosImage_PositionAndLengthCode {
    type Root = TrDosImage;
    type Parent = TrDosImage_File;

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
        *self_rc.start_address.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.length.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl TrDosImage_PositionAndLengthCode {
}

/**
 * Default memory address to load this byte array into
 */
impl TrDosImage_PositionAndLengthCode {
    pub fn start_address(&self) -> Ref<'_, u16> {
        self.start_address.borrow()
    }
}
impl TrDosImage_PositionAndLengthCode {
    pub fn length(&self) -> Ref<'_, u16> {
        self.length.borrow()
    }
}
impl TrDosImage_PositionAndLengthCode {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct TrDosImage_PositionAndLengthGeneric {
    pub _root: SharedType<TrDosImage>,
    pub _parent: SharedType<TrDosImage_File>,
    pub _self: SharedType<Self>,
    reserved: RefCell<u16>,
    length: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for TrDosImage_PositionAndLengthGeneric {
    type Root = TrDosImage;
    type Parent = TrDosImage_File;

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
        *self_rc.reserved.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.length.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl TrDosImage_PositionAndLengthGeneric {
}
impl TrDosImage_PositionAndLengthGeneric {
    pub fn reserved(&self) -> Ref<'_, u16> {
        self.reserved.borrow()
    }
}
impl TrDosImage_PositionAndLengthGeneric {
    pub fn length(&self) -> Ref<'_, u16> {
        self.length.borrow()
    }
}
impl TrDosImage_PositionAndLengthGeneric {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct TrDosImage_PositionAndLengthPrint {
    pub _root: SharedType<TrDosImage>,
    pub _parent: SharedType<TrDosImage_File>,
    pub _self: SharedType<Self>,
    extent_no: RefCell<u8>,
    reserved: RefCell<u8>,
    length: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for TrDosImage_PositionAndLengthPrint {
    type Root = TrDosImage;
    type Parent = TrDosImage_File;

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
        *self_rc.extent_no.borrow_mut() = _io.read_u1()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_u1()?.into();
        *self_rc.length.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl TrDosImage_PositionAndLengthPrint {
}
impl TrDosImage_PositionAndLengthPrint {
    pub fn extent_no(&self) -> Ref<'_, u8> {
        self.extent_no.borrow()
    }
}
impl TrDosImage_PositionAndLengthPrint {
    pub fn reserved(&self) -> Ref<'_, u8> {
        self.reserved.borrow()
    }
}
impl TrDosImage_PositionAndLengthPrint {
    pub fn length(&self) -> Ref<'_, u16> {
        self.length.borrow()
    }
}
impl TrDosImage_PositionAndLengthPrint {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct TrDosImage_VolumeInfo {
    pub _root: SharedType<TrDosImage>,
    pub _parent: SharedType<TrDosImage>,
    pub _self: SharedType<Self>,
    catalog_end: RefCell<Vec<u8>>,
    unused: RefCell<Vec<u8>>,
    first_free_sector_sector: RefCell<u8>,
    first_free_sector_track: RefCell<u8>,
    disk_type: RefCell<TrDosImage_DiskType>,
    num_files: RefCell<u8>,
    num_free_sectors: RefCell<u16>,
    tr_dos_id: RefCell<Vec<u8>>,
    unused_2: RefCell<Vec<u8>>,
    password: RefCell<Vec<u8>>,
    unused_3: RefCell<Vec<u8>>,
    num_deleted_files: RefCell<u8>,
    label: RefCell<Vec<u8>>,
    unused_4: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_num_sides: Cell<bool>,
    num_sides: RefCell<i8>,
    f_num_tracks: Cell<bool>,
    num_tracks: RefCell<i8>,
}
impl KStruct for TrDosImage_VolumeInfo {
    type Root = TrDosImage;
    type Parent = TrDosImage;

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
        *self_rc.catalog_end.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.catalog_end() == vec![0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/volume_info/seq/0".to_string() }));
        }
        *self_rc.unused.borrow_mut() = _io.read_bytes(224 as usize)?.into();
        *self_rc.first_free_sector_sector.borrow_mut() = _io.read_u1()?.into();
        *self_rc.first_free_sector_track.borrow_mut() = _io.read_u1()?.into();
        *self_rc.disk_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.num_files.borrow_mut() = _io.read_u1()?.into();
        *self_rc.num_free_sectors.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.tr_dos_id.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.tr_dos_id() == vec![0x10u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/volume_info/seq/7".to_string() }));
        }
        *self_rc.unused_2.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        *self_rc.password.borrow_mut() = _io.read_bytes(9 as usize)?.into();
        *self_rc.unused_3.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        *self_rc.num_deleted_files.borrow_mut() = _io.read_u1()?.into();
        *self_rc.label.borrow_mut() = _io.read_bytes(8 as usize)?.into();
        *self_rc.unused_4.borrow_mut() = _io.read_bytes(3 as usize)?.into();
        Ok(())
    }
}
impl TrDosImage_VolumeInfo {
    pub fn num_sides(
        &self
    ) -> KResult<Ref<'_, i8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_sides.get() {
            return Ok(self.num_sides.borrow());
        }
        self.f_num_sides.set(true);
        *self.num_sides.borrow_mut() = (if ((((i64::from(&*self.disk_type()) as i32) & (8 as i32)) as i32) != (0 as i32)) { 1 } else { 2 }) as i8;
        Ok(self.num_sides.borrow())
    }
    pub fn num_tracks(
        &self
    ) -> KResult<Ref<'_, i8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_tracks.get() {
            return Ok(self.num_tracks.borrow());
        }
        self.f_num_tracks.set(true);
        *self.num_tracks.borrow_mut() = (if ((((i64::from(&*self.disk_type()) as i32) & (1 as i32)) as i32) != (0 as i32)) { 40 } else { 80 }) as i8;
        Ok(self.num_tracks.borrow())
    }
}
impl TrDosImage_VolumeInfo {
    pub fn catalog_end(&self) -> Ref<'_, Vec<u8>> {
        self.catalog_end.borrow()
    }
}
impl TrDosImage_VolumeInfo {
    pub fn unused(&self) -> Ref<'_, Vec<u8>> {
        self.unused.borrow()
    }
}
impl TrDosImage_VolumeInfo {
    pub fn first_free_sector_sector(&self) -> Ref<'_, u8> {
        self.first_free_sector_sector.borrow()
    }
}

/**
 * track number is logical, for double-sided disks it's
 * (physical_track << 1) | side, the same way that tracks are stored
 * sequentially in .trd file
 */
impl TrDosImage_VolumeInfo {
    pub fn first_free_sector_track(&self) -> Ref<'_, u8> {
        self.first_free_sector_track.borrow()
    }
}
impl TrDosImage_VolumeInfo {
    pub fn disk_type(&self) -> Ref<'_, TrDosImage_DiskType> {
        self.disk_type.borrow()
    }
}

/**
 * Number of non-deleted files. Directory can have more than
 * number_of_files entries due to deleted files
 */
impl TrDosImage_VolumeInfo {
    pub fn num_files(&self) -> Ref<'_, u8> {
        self.num_files.borrow()
    }
}
impl TrDosImage_VolumeInfo {
    pub fn num_free_sectors(&self) -> Ref<'_, u16> {
        self.num_free_sectors.borrow()
    }
}
impl TrDosImage_VolumeInfo {
    pub fn tr_dos_id(&self) -> Ref<'_, Vec<u8>> {
        self.tr_dos_id.borrow()
    }
}
impl TrDosImage_VolumeInfo {
    pub fn unused_2(&self) -> Ref<'_, Vec<u8>> {
        self.unused_2.borrow()
    }
}
impl TrDosImage_VolumeInfo {
    pub fn password(&self) -> Ref<'_, Vec<u8>> {
        self.password.borrow()
    }
}
impl TrDosImage_VolumeInfo {
    pub fn unused_3(&self) -> Ref<'_, Vec<u8>> {
        self.unused_3.borrow()
    }
}
impl TrDosImage_VolumeInfo {
    pub fn num_deleted_files(&self) -> Ref<'_, u8> {
        self.num_deleted_files.borrow()
    }
}
impl TrDosImage_VolumeInfo {
    pub fn label(&self) -> Ref<'_, Vec<u8>> {
        self.label.borrow()
    }
}
impl TrDosImage_VolumeInfo {
    pub fn unused_4(&self) -> Ref<'_, Vec<u8>> {
        self.unused_4.borrow()
    }
}
impl TrDosImage_VolumeInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

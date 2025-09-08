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
use super::dos_datetime::DosDatetime;

/**
 * LHA (LHarc, LZH) is a file format used by a popular freeware
 * eponymous archiver, created in 1988 by Haruyasu Yoshizaki. Over the
 * years, many ports and implementations were developed, sporting many
 * extensions to original 1988 LZH.
 * 
 * File format is pretty simple and essentially consists of a stream of
 * records.
 */

#[derive(Default, Debug, Clone)]
pub struct Lzh {
    pub _root: SharedType<Lzh>,
    pub _parent: SharedType<Lzh>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<Lzh_Record>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Lzh {
    type Root = Lzh;
    type Parent = Lzh;

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
                let t = Self::read_into::<_, Lzh_Record>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Lzh {
}
impl Lzh {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Lzh_Record>>> {
        self.entries.borrow()
    }
}
impl Lzh {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Lzh_FileRecord {
    pub _root: SharedType<Lzh>,
    pub _parent: SharedType<Lzh_Record>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<Lzh_Header>>,
    file_uncompr_crc16: RefCell<u16>,
    body: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    header_raw: RefCell<Vec<u8>>,
}
impl KStruct for Lzh_FileRecord {
    type Root = Lzh;
    type Parent = Lzh_Record;

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
        *self_rc.header_raw.borrow_mut() = _io.read_bytes(((*_prc.as_ref().unwrap().header_len() as u8) - (1 as u8)) as usize)?.into();
        let header_raw = self_rc.header_raw.borrow();
        let _t_header_raw_io = BytesReader::from(header_raw.clone());
        let t = Self::read_into::<BytesReader, Lzh_Header>(&_t_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        if ((*self_rc.header().header1().lha_level() as u8) == (0 as u8)) {
            *self_rc.file_uncompr_crc16.borrow_mut() = _io.read_u2le()?.into();
        }
        *self_rc.body.borrow_mut() = _io.read_bytes(*self_rc.header().header1().file_size_compr() as usize)?.into();
        Ok(())
    }
}
impl Lzh_FileRecord {
}
impl Lzh_FileRecord {
    pub fn header(&self) -> Ref<'_, OptRc<Lzh_Header>> {
        self.header.borrow()
    }
}
impl Lzh_FileRecord {
    pub fn file_uncompr_crc16(&self) -> Ref<'_, u16> {
        self.file_uncompr_crc16.borrow()
    }
}
impl Lzh_FileRecord {
    pub fn body(&self) -> Ref<'_, Vec<u8>> {
        self.body.borrow()
    }
}
impl Lzh_FileRecord {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Lzh_FileRecord {
    pub fn header_raw(&self) -> Ref<'_, Vec<u8>> {
        self.header_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Lzh_Header {
    pub _root: SharedType<Lzh>,
    pub _parent: SharedType<Lzh_FileRecord>,
    pub _self: SharedType<Self>,
    header1: RefCell<OptRc<Lzh_Header1>>,
    filename_len: RefCell<u8>,
    filename: RefCell<String>,
    file_uncompr_crc16: RefCell<u16>,
    os: RefCell<u8>,
    ext_header_size: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Lzh_Header {
    type Root = Lzh;
    type Parent = Lzh_FileRecord;

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
        let t = Self::read_into::<_, Lzh_Header1>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header1.borrow_mut() = t;
        if ((*self_rc.header1().lha_level() as u8) == (0 as u8)) {
            *self_rc.filename_len.borrow_mut() = _io.read_u1()?.into();
        }
        if ((*self_rc.header1().lha_level() as u8) == (0 as u8)) {
            *self_rc.filename.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.filename_len() as usize)?.into(), "ASCII")?;
        }
        if ((*self_rc.header1().lha_level() as u8) == (2 as u8)) {
            *self_rc.file_uncompr_crc16.borrow_mut() = _io.read_u2le()?.into();
        }
        if ((*self_rc.header1().lha_level() as u8) == (2 as u8)) {
            *self_rc.os.borrow_mut() = _io.read_u1()?.into();
        }
        if ((*self_rc.header1().lha_level() as u8) == (2 as u8)) {
            *self_rc.ext_header_size.borrow_mut() = _io.read_u2le()?.into();
        }
        Ok(())
    }
}
impl Lzh_Header {
}

/**
 * Level-neutral header, same for all LHA levels. Subsequent fields order and meaning varies, based on LHA level specified in this header.
 */
impl Lzh_Header {
    pub fn header1(&self) -> Ref<'_, OptRc<Lzh_Header1>> {
        self.header1.borrow()
    }
}
impl Lzh_Header {
    pub fn filename_len(&self) -> Ref<'_, u8> {
        self.filename_len.borrow()
    }
}
impl Lzh_Header {
    pub fn filename(&self) -> Ref<'_, String> {
        self.filename.borrow()
    }
}
impl Lzh_Header {
    pub fn file_uncompr_crc16(&self) -> Ref<'_, u16> {
        self.file_uncompr_crc16.borrow()
    }
}
impl Lzh_Header {
    pub fn os(&self) -> Ref<'_, u8> {
        self.os.borrow()
    }
}
impl Lzh_Header {
    pub fn ext_header_size(&self) -> Ref<'_, u16> {
        self.ext_header_size.borrow()
    }
}
impl Lzh_Header {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Lzh_Header1 {
    pub _root: SharedType<Lzh>,
    pub _parent: SharedType<Lzh_Header>,
    pub _self: SharedType<Self>,
    header_checksum: RefCell<u8>,
    method_id: RefCell<String>,
    file_size_compr: RefCell<u32>,
    file_size_uncompr: RefCell<u32>,
    file_timestamp: RefCell<OptRc<DosDatetime>>,
    attr: RefCell<u8>,
    lha_level: RefCell<u8>,
    _io: RefCell<BytesReader>,
    file_timestamp_raw: RefCell<Vec<u8>>,
}
impl KStruct for Lzh_Header1 {
    type Root = Lzh;
    type Parent = Lzh_Header;

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
        *self_rc.header_checksum.borrow_mut() = _io.read_u1()?.into();
        *self_rc.method_id.borrow_mut() = bytes_to_str(&_io.read_bytes(5 as usize)?.into(), "ASCII")?;
        *self_rc.file_size_compr.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.file_size_uncompr.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.file_timestamp_raw.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        let file_timestamp_raw = self_rc.file_timestamp_raw.borrow();
        let _t_file_timestamp_raw_io = BytesReader::from(file_timestamp_raw.clone());
        let t = Self::read_into::<BytesReader, DosDatetime>(&_t_file_timestamp_raw_io, None, None)?.into();
        *self_rc.file_timestamp.borrow_mut() = t;
        *self_rc.attr.borrow_mut() = _io.read_u1()?.into();
        *self_rc.lha_level.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl Lzh_Header1 {
}
impl Lzh_Header1 {
    pub fn header_checksum(&self) -> Ref<'_, u8> {
        self.header_checksum.borrow()
    }
}
impl Lzh_Header1 {
    pub fn method_id(&self) -> Ref<'_, String> {
        self.method_id.borrow()
    }
}

/**
 * Compressed file size
 */
impl Lzh_Header1 {
    pub fn file_size_compr(&self) -> Ref<'_, u32> {
        self.file_size_compr.borrow()
    }
}

/**
 * Uncompressed file size
 */
impl Lzh_Header1 {
    pub fn file_size_uncompr(&self) -> Ref<'_, u32> {
        self.file_size_uncompr.borrow()
    }
}

/**
 * Original file date/time
 */
impl Lzh_Header1 {
    pub fn file_timestamp(&self) -> Ref<'_, OptRc<DosDatetime>> {
        self.file_timestamp.borrow()
    }
}

/**
 * File or directory attribute
 */
impl Lzh_Header1 {
    pub fn attr(&self) -> Ref<'_, u8> {
        self.attr.borrow()
    }
}
impl Lzh_Header1 {
    pub fn lha_level(&self) -> Ref<'_, u8> {
        self.lha_level.borrow()
    }
}
impl Lzh_Header1 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Lzh_Header1 {
    pub fn file_timestamp_raw(&self) -> Ref<'_, Vec<u8>> {
        self.file_timestamp_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Lzh_Record {
    pub _root: SharedType<Lzh>,
    pub _parent: SharedType<Lzh>,
    pub _self: SharedType<Self>,
    header_len: RefCell<u8>,
    file_record: RefCell<OptRc<Lzh_FileRecord>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Lzh_Record {
    type Root = Lzh;
    type Parent = Lzh;

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
        *self_rc.header_len.borrow_mut() = _io.read_u1()?.into();
        if ((*self_rc.header_len() as u8) > (0 as u8)) {
            let t = Self::read_into::<_, Lzh_FileRecord>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.file_record.borrow_mut() = t;
        }
        Ok(())
    }
}
impl Lzh_Record {
}
impl Lzh_Record {
    pub fn header_len(&self) -> Ref<'_, u8> {
        self.header_len.borrow()
    }
}
impl Lzh_Record {
    pub fn file_record(&self) -> Ref<'_, OptRc<Lzh_FileRecord>> {
        self.file_record.borrow()
    }
}
impl Lzh_Record {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

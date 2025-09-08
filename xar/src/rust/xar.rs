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
 * From [Wikipedia](https://en.wikipedia.org/wiki/Xar_(archiver)):
 * 
 * "XAR (short for eXtensible ARchive format) is an open source file archiver
 * and the archiver's file format. It was created within the OpenDarwin project
 * and is used in macOS X 10.5 and up for software installation routines, as
 * well as browser extensions in Safari 5.0 and up."
 * \sa https://github.com/mackyle/xar/wiki/xarformat Source
 */

#[derive(Default, Debug, Clone)]
pub struct Xar {
    pub _root: SharedType<Xar>,
    pub _parent: SharedType<Xar>,
    pub _self: SharedType<Self>,
    header_prefix: RefCell<OptRc<Xar_FileHeaderPrefix>>,
    header: RefCell<OptRc<Xar_FileHeader>>,
    toc: RefCell<OptRc<Xar_TocType>>,
    _io: RefCell<BytesReader>,
    header_raw: RefCell<Vec<u8>>,
    toc_raw: RefCell<Vec<u8>>,
    toc_raw_raw: RefCell<Vec<u8>>,
    f_checksum_algorithm_other: Cell<bool>,
    checksum_algorithm_other: RefCell<i8>,
}
impl KStruct for Xar {
    type Root = Xar;
    type Parent = Xar;

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
        let t = Self::read_into::<_, Xar_FileHeaderPrefix>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header_prefix.borrow_mut() = t;
        *self_rc.header_raw.borrow_mut() = _io.read_bytes(((*self_rc.header_prefix().len_header() as i32) - (6 as i32)) as usize)?.into();
        let header_raw = self_rc.header_raw.borrow();
        let _t_header_raw_io = BytesReader::from(header_raw.clone());
        let t = Self::read_into::<BytesReader, Xar_FileHeader>(&_t_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        *self_rc.toc_raw_raw.borrow_mut() = _io.read_bytes(*self_rc.header().len_toc_compressed() as usize)?.into();
        *self_rc.toc_raw.borrow_mut() = process_zlib(&self_rc.toc_raw_raw.borrow()).map_err(|msg| KError::BytesDecodingError { msg })?;
        let toc_raw = self_rc.toc_raw.borrow();
        let _t_toc_raw_io = BytesReader::from(toc_raw.clone());
        let t = Self::read_into::<BytesReader, Xar_TocType>(&_t_toc_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.toc.borrow_mut() = t;
        Ok(())
    }
}
impl Xar {

    /**
     * \sa https://github.com/mackyle/xar/blob/66d451d/xar/include/xar.h.in#L85 Source
     */
    pub fn checksum_algorithm_other(
        &self
    ) -> KResult<Ref<'_, i8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_checksum_algorithm_other.get() {
            return Ok(self.checksum_algorithm_other.borrow());
        }
        self.f_checksum_algorithm_other.set(true);
        *self.checksum_algorithm_other.borrow_mut() = (3) as i8;
        Ok(self.checksum_algorithm_other.borrow())
    }
}

/**
 * internal; access `_root.header` instead
 */
impl Xar {
    pub fn header_prefix(&self) -> Ref<'_, OptRc<Xar_FileHeaderPrefix>> {
        self.header_prefix.borrow()
    }
}
impl Xar {
    pub fn header(&self) -> Ref<'_, OptRc<Xar_FileHeader>> {
        self.header.borrow()
    }
}

/**
 * zlib compressed XML further describing the content of the archive
 */
impl Xar {
    pub fn toc(&self) -> Ref<'_, OptRc<Xar_TocType>> {
        self.toc.borrow()
    }
}
impl Xar {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Xar {
    pub fn header_raw(&self) -> Ref<'_, Vec<u8>> {
        self.header_raw.borrow()
    }
}
impl Xar {
    pub fn toc_raw(&self) -> Ref<'_, Vec<u8>> {
        self.toc_raw.borrow()
    }
}
impl Xar {
    pub fn toc_raw_raw(&self) -> Ref<'_, Vec<u8>> {
        self.toc_raw_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Xar_ChecksumAlgorithmsApple {
    None,
    Sha1,
    Md5,
    Sha256,
    Sha512,
    Unknown(i64),
}

impl TryFrom<i64> for Xar_ChecksumAlgorithmsApple {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Xar_ChecksumAlgorithmsApple> {
        match flag {
            0 => Ok(Xar_ChecksumAlgorithmsApple::None),
            1 => Ok(Xar_ChecksumAlgorithmsApple::Sha1),
            2 => Ok(Xar_ChecksumAlgorithmsApple::Md5),
            3 => Ok(Xar_ChecksumAlgorithmsApple::Sha256),
            4 => Ok(Xar_ChecksumAlgorithmsApple::Sha512),
            _ => Ok(Xar_ChecksumAlgorithmsApple::Unknown(flag)),
        }
    }
}

impl From<&Xar_ChecksumAlgorithmsApple> for i64 {
    fn from(v: &Xar_ChecksumAlgorithmsApple) -> Self {
        match *v {
            Xar_ChecksumAlgorithmsApple::None => 0,
            Xar_ChecksumAlgorithmsApple::Sha1 => 1,
            Xar_ChecksumAlgorithmsApple::Md5 => 2,
            Xar_ChecksumAlgorithmsApple::Sha256 => 3,
            Xar_ChecksumAlgorithmsApple::Sha512 => 4,
            Xar_ChecksumAlgorithmsApple::Unknown(v) => v
        }
    }
}

impl Default for Xar_ChecksumAlgorithmsApple {
    fn default() -> Self { Xar_ChecksumAlgorithmsApple::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Xar_FileHeader {
    pub _root: SharedType<Xar>,
    pub _parent: SharedType<Xar>,
    pub _self: SharedType<Self>,
    version: RefCell<u16>,
    len_toc_compressed: RefCell<u64>,
    toc_length_uncompressed: RefCell<u64>,
    checksum_algorithm_int: RefCell<u32>,
    checksum_alg_name: RefCell<String>,
    _io: RefCell<BytesReader>,
    f_checksum_algorithm_name: Cell<bool>,
    checksum_algorithm_name: RefCell<String>,
    f_has_checksum_alg_name: Cell<bool>,
    has_checksum_alg_name: RefCell<bool>,
    f_len_header: Cell<bool>,
    len_header: RefCell<u16>,
}
impl KStruct for Xar_FileHeader {
    type Root = Xar;
    type Parent = Xar;

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
        *self_rc.version.borrow_mut() = _io.read_u2be()?.into();
        if !(((*self_rc.version() as u16) == (1 as u16))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/file_header/seq/0".to_string() }));
        }
        *self_rc.len_toc_compressed.borrow_mut() = _io.read_u8be()?.into();
        *self_rc.toc_length_uncompressed.borrow_mut() = _io.read_u8be()?.into();
        *self_rc.checksum_algorithm_int.borrow_mut() = _io.read_u4be()?.into();
        if *self_rc.has_checksum_alg_name()? {
            *self_rc.checksum_alg_name.borrow_mut() = bytes_to_str(&bytes_terminate(&_io.read_bytes_full()?.into(), 0, false).into(), "UTF-8")?;
            let _tmpa = *self_rc.checksum_alg_name();
            if !( ((_tmpa != "".to_string()) && (_tmpa != "none".to_string())) ) {
                return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/file_header/seq/4".to_string() }));
            }
        }
        Ok(())
    }
}
impl Xar_FileHeader {

    /**
     * If it is not
     * 
     * * `""` (empty string), indicating an unknown integer value (access
     *   `checksum_algorithm_int` for debugging purposes to find out
     *   what that value is), or
     * * `"none"`, indicating that the TOC checksum is not provided (in that
     *   case, the `<checksum>` property or its `style` attribute should be
     *   missing, or the `style` attribute must be set to `"none"`),
     * 
     * it must exactly match the `style` attribute value of the
     * `<checksum>` property in the root node `<toc>`. See
     * <https://github.com/mackyle/xar/blob/66d451d/xar/lib/archive.c#L345-L371>
     * for reference.
     * 
     * The `xar` (eXtensible ARchiver) program [uses OpenSSL's function
     * `EVP_get_digestbyname`](
     *   https://github.com/mackyle/xar/blob/66d451d/xar/lib/archive.c#L328
     * ) to verify this value (if it's not `""` or `"none"`, of course).
     * So it's reasonable to assume that this can only have one of the values
     * that OpenSSL recognizes.
     */
    pub fn checksum_algorithm_name(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_checksum_algorithm_name.get() {
            return Ok(self.checksum_algorithm_name.borrow());
        }
        self.f_checksum_algorithm_name.set(true);
        *self.checksum_algorithm_name.borrow_mut() = if *self.has_checksum_alg_name()? { self.checksum_alg_name().to_string() } else { if ((*self.checksum_algorithm_int() as i32) == (i64::from(&Xar_ChecksumAlgorithmsApple::None) as i32)) { "none".to_string() } else { if ((*self.checksum_algorithm_int() as i32) == (i64::from(&Xar_ChecksumAlgorithmsApple::Sha1) as i32)) { "sha1".to_string() } else { if ((*self.checksum_algorithm_int() as i32) == (i64::from(&Xar_ChecksumAlgorithmsApple::Md5) as i32)) { "md5".to_string() } else { if ((*self.checksum_algorithm_int() as i32) == (i64::from(&Xar_ChecksumAlgorithmsApple::Sha256) as i32)) { "sha256".to_string() } else { if ((*self.checksum_algorithm_int() as i32) == (i64::from(&Xar_ChecksumAlgorithmsApple::Sha512) as i32)) { "sha512".to_string() } else { "".to_string() }.to_string() }.to_string() }.to_string() }.to_string() }.to_string() }.to_string();
        Ok(self.checksum_algorithm_name.borrow())
    }
    pub fn has_checksum_alg_name(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_checksum_alg_name.get() {
            return Ok(self.has_checksum_alg_name.borrow());
        }
        self.f_has_checksum_alg_name.set(true);
        *self.has_checksum_alg_name.borrow_mut() = ( ((((*self.checksum_algorithm_int() as u32) == (*_r.checksum_algorithm_other()? as u32))) && (((*self.len_header()? as u16) >= (32 as u16))) && (((((*self.len_header()? as u16) % (4 as u16)) as i32) == (0 as i32)))) ) as bool;
        Ok(self.has_checksum_alg_name.borrow())
    }
    pub fn len_header(
        &self
    ) -> KResult<Ref<'_, u16>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_header.get() {
            return Ok(self.len_header.borrow());
        }
        self.f_len_header.set(true);
        *self.len_header.borrow_mut() = (*_r.header_prefix().len_header()) as u16;
        Ok(self.len_header.borrow())
    }
}
impl Xar_FileHeader {
    pub fn version(&self) -> Ref<'_, u16> {
        self.version.borrow()
    }
}
impl Xar_FileHeader {
    pub fn len_toc_compressed(&self) -> Ref<'_, u64> {
        self.len_toc_compressed.borrow()
    }
}
impl Xar_FileHeader {
    pub fn toc_length_uncompressed(&self) -> Ref<'_, u64> {
        self.toc_length_uncompressed.borrow()
    }
}

/**
 * internal; access `checksum_algorithm_name` instead
 */
impl Xar_FileHeader {
    pub fn checksum_algorithm_int(&self) -> Ref<'_, u32> {
        self.checksum_algorithm_int.borrow()
    }
}

/**
 * internal; access `checksum_algorithm_name` instead
 */
impl Xar_FileHeader {
    pub fn checksum_alg_name(&self) -> Ref<'_, String> {
        self.checksum_alg_name.borrow()
    }
}
impl Xar_FileHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Xar_FileHeaderPrefix {
    pub _root: SharedType<Xar>,
    pub _parent: SharedType<Xar>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    len_header: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Xar_FileHeaderPrefix {
    type Root = Xar;
    type Parent = Xar;

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
        if !(*self_rc.magic() == vec![0x78u8, 0x61u8, 0x72u8, 0x21u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/file_header_prefix/seq/0".to_string() }));
        }
        *self_rc.len_header.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl Xar_FileHeaderPrefix {
}
impl Xar_FileHeaderPrefix {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}

/**
 * internal; access `_root.header.len_header` instead
 */
impl Xar_FileHeaderPrefix {
    pub fn len_header(&self) -> Ref<'_, u16> {
        self.len_header.borrow()
    }
}
impl Xar_FileHeaderPrefix {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Xar_TocType {
    pub _root: SharedType<Xar>,
    pub _parent: SharedType<Xar>,
    pub _self: SharedType<Self>,
    xml_string: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Xar_TocType {
    type Root = Xar;
    type Parent = Xar;

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
        *self_rc.xml_string.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Xar_TocType {
}
impl Xar_TocType {
    pub fn xml_string(&self) -> Ref<'_, String> {
        self.xml_string.borrow()
    }
}
impl Xar_TocType {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

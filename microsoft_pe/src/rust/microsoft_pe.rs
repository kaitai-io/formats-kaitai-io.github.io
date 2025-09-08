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
 * \sa https://learn.microsoft.com/en-us/windows/win32/debug/pe-format Source
 */

#[derive(Default, Debug, Clone)]
pub struct MicrosoftPe {
    pub _root: SharedType<MicrosoftPe>,
    pub _parent: SharedType<MicrosoftPe>,
    pub _self: SharedType<Self>,
    mz: RefCell<OptRc<MicrosoftPe_MzPlaceholder>>,
    _io: RefCell<BytesReader>,
    f_pe: Cell<bool>,
    pe: RefCell<OptRc<MicrosoftPe_PeHeader>>,
}
impl KStruct for MicrosoftPe {
    type Root = MicrosoftPe;
    type Parent = MicrosoftPe;

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
        let t = Self::read_into::<_, MicrosoftPe_MzPlaceholder>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.mz.borrow_mut() = t;
        Ok(())
    }
}
impl MicrosoftPe {
    pub fn pe(
        &self
    ) -> KResult<Ref<'_, OptRc<MicrosoftPe_PeHeader>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_pe.get() {
            return Ok(self.pe.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*self.mz().ofs_pe() as usize)?;
        let t = Self::read_into::<_, MicrosoftPe_PeHeader>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.pe.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.pe.borrow())
    }
}
impl MicrosoftPe {
    pub fn mz(&self) -> Ref<'_, OptRc<MicrosoftPe_MzPlaceholder>> {
        self.mz.borrow()
    }
}
impl MicrosoftPe {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum MicrosoftPe_PeFormat {
    RomImage,
    Pe32,
    Pe32Plus,
    Unknown(i64),
}

impl TryFrom<i64> for MicrosoftPe_PeFormat {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MicrosoftPe_PeFormat> {
        match flag {
            263 => Ok(MicrosoftPe_PeFormat::RomImage),
            267 => Ok(MicrosoftPe_PeFormat::Pe32),
            523 => Ok(MicrosoftPe_PeFormat::Pe32Plus),
            _ => Ok(MicrosoftPe_PeFormat::Unknown(flag)),
        }
    }
}

impl From<&MicrosoftPe_PeFormat> for i64 {
    fn from(v: &MicrosoftPe_PeFormat) -> Self {
        match *v {
            MicrosoftPe_PeFormat::RomImage => 263,
            MicrosoftPe_PeFormat::Pe32 => 267,
            MicrosoftPe_PeFormat::Pe32Plus => 523,
            MicrosoftPe_PeFormat::Unknown(v) => v
        }
    }
}

impl Default for MicrosoftPe_PeFormat {
    fn default() -> Self { MicrosoftPe_PeFormat::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct MicrosoftPe_Annoyingstring {
    pub _root: SharedType<MicrosoftPe>,
    pub _parent: SharedType<MicrosoftPe_CoffSymbol>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
    f_name: Cell<bool>,
    name: RefCell<String>,
    f_name_from_offset: Cell<bool>,
    name_from_offset: RefCell<String>,
    f_name_from_short: Cell<bool>,
    name_from_short: RefCell<String>,
    f_name_offset: Cell<bool>,
    name_offset: RefCell<u32>,
    f_name_zeroes: Cell<bool>,
    name_zeroes: RefCell<u32>,
}
impl KStruct for MicrosoftPe_Annoyingstring {
    type Root = MicrosoftPe;
    type Parent = MicrosoftPe_CoffSymbol;

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
impl MicrosoftPe_Annoyingstring {
    pub fn name(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name.get() {
            return Ok(self.name.borrow());
        }
        self.f_name.set(true);
        *self.name.borrow_mut() = if ((*self.name_zeroes()? as u32) == (0 as u32)) { self.name_from_offset()?.to_string() } else { self.name_from_short()?.to_string() }.to_string();
        Ok(self.name.borrow())
    }
    pub fn name_from_offset(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name_from_offset.get() {
            return Ok(self.name_from_offset.borrow());
        }
        self.f_name_from_offset.set(true);
        if ((*self.name_zeroes()? as u32) == (0 as u32)) {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(if ((*self.name_zeroes()? as u32) == (0 as u32)) { ((*_prc.as_ref().unwrap()._parent.get_value().borrow().upgrade().as_ref().unwrap().symbol_name_table_offset()? as i32) + (*self.name_offset()? as i32)) } else { 0 } as usize)?;
            *self.name_from_offset.borrow_mut() = bytes_to_str(&io.read_bytes_term(0, false, true, false)?.into(), "ASCII")?;
            io.seek(_pos)?;
        }
        Ok(self.name_from_offset.borrow())
    }
    pub fn name_from_short(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name_from_short.get() {
            return Ok(self.name_from_short.borrow());
        }
        self.f_name_from_short.set(true);
        if ((*self.name_zeroes()? as u32) != (0 as u32)) {
            let _pos = _io.pos();
            _io.seek(0 as usize)?;
            *self.name_from_short.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, false)?.into(), "ASCII")?;
            _io.seek(_pos)?;
        }
        Ok(self.name_from_short.borrow())
    }
    pub fn name_offset(
        &self
    ) -> KResult<Ref<'_, u32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name_offset.get() {
            return Ok(self.name_offset.borrow());
        }
        self.f_name_offset.set(true);
        let _pos = _io.pos();
        _io.seek(4 as usize)?;
        *self.name_offset.borrow_mut() = _io.read_u4le()?.into();
        _io.seek(_pos)?;
        Ok(self.name_offset.borrow())
    }
    pub fn name_zeroes(
        &self
    ) -> KResult<Ref<'_, u32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name_zeroes.get() {
            return Ok(self.name_zeroes.borrow());
        }
        self.f_name_zeroes.set(true);
        let _pos = _io.pos();
        _io.seek(0 as usize)?;
        *self.name_zeroes.borrow_mut() = _io.read_u4le()?.into();
        _io.seek(_pos)?;
        Ok(self.name_zeroes.borrow())
    }
}
impl MicrosoftPe_Annoyingstring {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#the-attribute-certificate-table-image-only Source
 */

#[derive(Default, Debug, Clone)]
pub struct MicrosoftPe_CertificateEntry {
    pub _root: SharedType<MicrosoftPe>,
    pub _parent: SharedType<MicrosoftPe_CertificateTable>,
    pub _self: SharedType<Self>,
    length: RefCell<u32>,
    revision: RefCell<MicrosoftPe_CertificateEntry_CertificateRevision>,
    certificate_type: RefCell<MicrosoftPe_CertificateEntry_CertificateTypeEnum>,
    certificate_bytes: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MicrosoftPe_CertificateEntry {
    type Root = MicrosoftPe;
    type Parent = MicrosoftPe_CertificateTable;

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
        *self_rc.length.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.revision.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        *self_rc.certificate_type.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        *self_rc.certificate_bytes.borrow_mut() = _io.read_bytes(((*self_rc.length() as u32) - (8 as u32)) as usize)?.into();
        Ok(())
    }
}
impl MicrosoftPe_CertificateEntry {
}

/**
 * Specifies the length of the attribute certificate entry.
 */
impl MicrosoftPe_CertificateEntry {
    pub fn length(&self) -> Ref<'_, u32> {
        self.length.borrow()
    }
}

/**
 * Contains the certificate version number.
 */
impl MicrosoftPe_CertificateEntry {
    pub fn revision(&self) -> Ref<'_, MicrosoftPe_CertificateEntry_CertificateRevision> {
        self.revision.borrow()
    }
}

/**
 * Specifies the type of content in bCertificate
 */
impl MicrosoftPe_CertificateEntry {
    pub fn certificate_type(&self) -> Ref<'_, MicrosoftPe_CertificateEntry_CertificateTypeEnum> {
        self.certificate_type.borrow()
    }
}

/**
 * Contains a certificate, such as an Authenticode signature.
 */
impl MicrosoftPe_CertificateEntry {
    pub fn certificate_bytes(&self) -> Ref<'_, Vec<u8>> {
        self.certificate_bytes.borrow()
    }
}
impl MicrosoftPe_CertificateEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum MicrosoftPe_CertificateEntry_CertificateRevision {

    /**
     * Version 1, legacy version of the Win_Certificate structure.
     * It is supported only for purposes of verifying legacy Authenticode signatures
     */
    Revision10,

    /**
     * Version 2 is the current version of the Win_Certificate structure.
     */
    Revision20,
    Unknown(i64),
}

impl TryFrom<i64> for MicrosoftPe_CertificateEntry_CertificateRevision {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MicrosoftPe_CertificateEntry_CertificateRevision> {
        match flag {
            256 => Ok(MicrosoftPe_CertificateEntry_CertificateRevision::Revision10),
            512 => Ok(MicrosoftPe_CertificateEntry_CertificateRevision::Revision20),
            _ => Ok(MicrosoftPe_CertificateEntry_CertificateRevision::Unknown(flag)),
        }
    }
}

impl From<&MicrosoftPe_CertificateEntry_CertificateRevision> for i64 {
    fn from(v: &MicrosoftPe_CertificateEntry_CertificateRevision) -> Self {
        match *v {
            MicrosoftPe_CertificateEntry_CertificateRevision::Revision10 => 256,
            MicrosoftPe_CertificateEntry_CertificateRevision::Revision20 => 512,
            MicrosoftPe_CertificateEntry_CertificateRevision::Unknown(v) => v
        }
    }
}

impl Default for MicrosoftPe_CertificateEntry_CertificateRevision {
    fn default() -> Self { MicrosoftPe_CertificateEntry_CertificateRevision::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum MicrosoftPe_CertificateEntry_CertificateTypeEnum {

    /**
     * bCertificate contains an X.509 Certificate
     * Not Supported
     */
    X509,

    /**
     * bCertificate contains a PKCS#7 SignedData structure
     */
    PkcsSignedData,

    /**
     * Reserved
     */
    Reserved1,

    /**
     * Terminal Server Protocol Stack Certificate signing
     * Not Supported
     */
    TsStackSigned,
    Unknown(i64),
}

impl TryFrom<i64> for MicrosoftPe_CertificateEntry_CertificateTypeEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MicrosoftPe_CertificateEntry_CertificateTypeEnum> {
        match flag {
            1 => Ok(MicrosoftPe_CertificateEntry_CertificateTypeEnum::X509),
            2 => Ok(MicrosoftPe_CertificateEntry_CertificateTypeEnum::PkcsSignedData),
            3 => Ok(MicrosoftPe_CertificateEntry_CertificateTypeEnum::Reserved1),
            4 => Ok(MicrosoftPe_CertificateEntry_CertificateTypeEnum::TsStackSigned),
            _ => Ok(MicrosoftPe_CertificateEntry_CertificateTypeEnum::Unknown(flag)),
        }
    }
}

impl From<&MicrosoftPe_CertificateEntry_CertificateTypeEnum> for i64 {
    fn from(v: &MicrosoftPe_CertificateEntry_CertificateTypeEnum) -> Self {
        match *v {
            MicrosoftPe_CertificateEntry_CertificateTypeEnum::X509 => 1,
            MicrosoftPe_CertificateEntry_CertificateTypeEnum::PkcsSignedData => 2,
            MicrosoftPe_CertificateEntry_CertificateTypeEnum::Reserved1 => 3,
            MicrosoftPe_CertificateEntry_CertificateTypeEnum::TsStackSigned => 4,
            MicrosoftPe_CertificateEntry_CertificateTypeEnum::Unknown(v) => v
        }
    }
}

impl Default for MicrosoftPe_CertificateEntry_CertificateTypeEnum {
    fn default() -> Self { MicrosoftPe_CertificateEntry_CertificateTypeEnum::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct MicrosoftPe_CertificateTable {
    pub _root: SharedType<MicrosoftPe>,
    pub _parent: SharedType<MicrosoftPe_PeHeader>,
    pub _self: SharedType<Self>,
    items: RefCell<Vec<OptRc<MicrosoftPe_CertificateEntry>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MicrosoftPe_CertificateTable {
    type Root = MicrosoftPe;
    type Parent = MicrosoftPe_PeHeader;

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
        *self_rc.items.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, MicrosoftPe_CertificateEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.items.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl MicrosoftPe_CertificateTable {
}
impl MicrosoftPe_CertificateTable {
    pub fn items(&self) -> Ref<'_, Vec<OptRc<MicrosoftPe_CertificateEntry>>> {
        self.items.borrow()
    }
}
impl MicrosoftPe_CertificateTable {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa 3.3. COFF File Header (Object and Image)
 */

#[derive(Default, Debug, Clone)]
pub struct MicrosoftPe_CoffHeader {
    pub _root: SharedType<MicrosoftPe>,
    pub _parent: SharedType<MicrosoftPe_PeHeader>,
    pub _self: SharedType<Self>,
    machine: RefCell<MicrosoftPe_CoffHeader_MachineType>,
    number_of_sections: RefCell<u16>,
    time_date_stamp: RefCell<u32>,
    pointer_to_symbol_table: RefCell<u32>,
    number_of_symbols: RefCell<u32>,
    size_of_optional_header: RefCell<u16>,
    characteristics: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_symbol_name_table_offset: Cell<bool>,
    symbol_name_table_offset: RefCell<i32>,
    f_symbol_name_table_size: Cell<bool>,
    symbol_name_table_size: RefCell<u32>,
    f_symbol_table: Cell<bool>,
    symbol_table: RefCell<Vec<OptRc<MicrosoftPe_CoffSymbol>>>,
    f_symbol_table_size: Cell<bool>,
    symbol_table_size: RefCell<i32>,
}
impl KStruct for MicrosoftPe_CoffHeader {
    type Root = MicrosoftPe;
    type Parent = MicrosoftPe_PeHeader;

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
        *self_rc.machine.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        *self_rc.number_of_sections.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.time_date_stamp.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.pointer_to_symbol_table.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.number_of_symbols.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.size_of_optional_header.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.characteristics.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl MicrosoftPe_CoffHeader {
    pub fn symbol_name_table_offset(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_symbol_name_table_offset.get() {
            return Ok(self.symbol_name_table_offset.borrow());
        }
        self.f_symbol_name_table_offset.set(true);
        *self.symbol_name_table_offset.borrow_mut() = (((*self.pointer_to_symbol_table() as i32) + (*self.symbol_table_size()? as i32))) as i32;
        Ok(self.symbol_name_table_offset.borrow())
    }
    pub fn symbol_name_table_size(
        &self
    ) -> KResult<Ref<'_, u32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_symbol_name_table_size.get() {
            return Ok(self.symbol_name_table_size.borrow());
        }
        self.f_symbol_name_table_size.set(true);
        let _pos = _io.pos();
        _io.seek(*self.symbol_name_table_offset()? as usize)?;
        *self.symbol_name_table_size.borrow_mut() = _io.read_u4le()?.into();
        _io.seek(_pos)?;
        Ok(self.symbol_name_table_size.borrow())
    }
    pub fn symbol_table(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<MicrosoftPe_CoffSymbol>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_symbol_table.get() {
            return Ok(self.symbol_table.borrow());
        }
        self.f_symbol_table.set(true);
        let _pos = _io.pos();
        _io.seek(*self.pointer_to_symbol_table() as usize)?;
        *self.symbol_table.borrow_mut() = Vec::new();
        let l_symbol_table = *self.number_of_symbols();
        for _i in 0..l_symbol_table {
            let t = Self::read_into::<_, MicrosoftPe_CoffSymbol>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            self.symbol_table.borrow_mut().push(t);
        }
        _io.seek(_pos)?;
        Ok(self.symbol_table.borrow())
    }
    pub fn symbol_table_size(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_symbol_table_size.get() {
            return Ok(self.symbol_table_size.borrow());
        }
        self.f_symbol_table_size.set(true);
        *self.symbol_table_size.borrow_mut() = (((*self.number_of_symbols() as u32) * (18 as u32))) as i32;
        Ok(self.symbol_table_size.borrow())
    }
}
impl MicrosoftPe_CoffHeader {
    pub fn machine(&self) -> Ref<'_, MicrosoftPe_CoffHeader_MachineType> {
        self.machine.borrow()
    }
}
impl MicrosoftPe_CoffHeader {
    pub fn number_of_sections(&self) -> Ref<'_, u16> {
        self.number_of_sections.borrow()
    }
}
impl MicrosoftPe_CoffHeader {
    pub fn time_date_stamp(&self) -> Ref<'_, u32> {
        self.time_date_stamp.borrow()
    }
}
impl MicrosoftPe_CoffHeader {
    pub fn pointer_to_symbol_table(&self) -> Ref<'_, u32> {
        self.pointer_to_symbol_table.borrow()
    }
}
impl MicrosoftPe_CoffHeader {
    pub fn number_of_symbols(&self) -> Ref<'_, u32> {
        self.number_of_symbols.borrow()
    }
}
impl MicrosoftPe_CoffHeader {
    pub fn size_of_optional_header(&self) -> Ref<'_, u16> {
        self.size_of_optional_header.borrow()
    }
}
impl MicrosoftPe_CoffHeader {
    pub fn characteristics(&self) -> Ref<'_, u16> {
        self.characteristics.borrow()
    }
}
impl MicrosoftPe_CoffHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum MicrosoftPe_CoffHeader_MachineType {

    /**
     * The content of this field is assumed to be applicable to any machine type
     */
    Unknown,

    /**
     * Intel 386 or later processors and compatible processors
     */
    I386,

    /**
     * MIPS little endian
     */
    R4000,

    /**
     * MIPS little-endian WCE v2
     */
    WceMipsV2,

    /**
     * Alpha AXP, 32-bit address space
     */
    Alpha,

    /**
     * Hitachi SH3
     */
    Sh3,

    /**
     * Hitachi SH3 DSP
     */
    Sh3Dsp,

    /**
     * Hitachi SH4
     */
    Sh4,

    /**
     * Hitachi SH5
     */
    Sh5,

    /**
     * ARM little endian
     */
    Arm,

    /**
     * Thumb
     */
    Thumb,

    /**
     * ARM Thumb-2 little endian
     */
    ArmNt,

    /**
     * Matsushita AM33
     */
    Am33,

    /**
     * Power PC little endian
     */
    Powerpc,

    /**
     * Power PC with floating point support
     */
    PowerpcFp,

    /**
     * Intel Itanium processor family
     */
    Ia64,

    /**
     * MIPS16
     */
    Mips16,

    /**
     * > Alpha 64, 64-bit address space
     * or
     * > AXP 64 (Same as Alpha 64)
     */
    Alpha64OrAxp64,

    /**
     * MIPS with FPU
     */
    MipsFpu,

    /**
     * MIPS16 with FPU
     */
    Mips16Fpu,

    /**
     * EFI byte code
     */
    Ebc,

    /**
     * RISC-V 32-bit address space
     */
    Riscv32,

    /**
     * RISC-V 64-bit address space
     */
    Riscv64,

    /**
     * RISC-V 128-bit address space
     */
    Riscv128,

    /**
     * LoongArch 32-bit processor family
     */
    Loongarch32,

    /**
     * LoongArch 64-bit processor family
     */
    Loongarch64,

    /**
     * x64
     */
    Amd64,

    /**
     * Mitsubishi M32R little endian
     */
    M32r,

    /**
     * ARM64 little endian
     */
    Arm64,
    Unknown(i64),
}

impl TryFrom<i64> for MicrosoftPe_CoffHeader_MachineType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MicrosoftPe_CoffHeader_MachineType> {
        match flag {
            0 => Ok(MicrosoftPe_CoffHeader_MachineType::Unknown),
            332 => Ok(MicrosoftPe_CoffHeader_MachineType::I386),
            358 => Ok(MicrosoftPe_CoffHeader_MachineType::R4000),
            361 => Ok(MicrosoftPe_CoffHeader_MachineType::WceMipsV2),
            388 => Ok(MicrosoftPe_CoffHeader_MachineType::Alpha),
            418 => Ok(MicrosoftPe_CoffHeader_MachineType::Sh3),
            419 => Ok(MicrosoftPe_CoffHeader_MachineType::Sh3Dsp),
            422 => Ok(MicrosoftPe_CoffHeader_MachineType::Sh4),
            424 => Ok(MicrosoftPe_CoffHeader_MachineType::Sh5),
            448 => Ok(MicrosoftPe_CoffHeader_MachineType::Arm),
            450 => Ok(MicrosoftPe_CoffHeader_MachineType::Thumb),
            452 => Ok(MicrosoftPe_CoffHeader_MachineType::ArmNt),
            467 => Ok(MicrosoftPe_CoffHeader_MachineType::Am33),
            496 => Ok(MicrosoftPe_CoffHeader_MachineType::Powerpc),
            497 => Ok(MicrosoftPe_CoffHeader_MachineType::PowerpcFp),
            512 => Ok(MicrosoftPe_CoffHeader_MachineType::Ia64),
            614 => Ok(MicrosoftPe_CoffHeader_MachineType::Mips16),
            644 => Ok(MicrosoftPe_CoffHeader_MachineType::Alpha64OrAxp64),
            870 => Ok(MicrosoftPe_CoffHeader_MachineType::MipsFpu),
            1126 => Ok(MicrosoftPe_CoffHeader_MachineType::Mips16Fpu),
            3772 => Ok(MicrosoftPe_CoffHeader_MachineType::Ebc),
            20530 => Ok(MicrosoftPe_CoffHeader_MachineType::Riscv32),
            20580 => Ok(MicrosoftPe_CoffHeader_MachineType::Riscv64),
            20776 => Ok(MicrosoftPe_CoffHeader_MachineType::Riscv128),
            25138 => Ok(MicrosoftPe_CoffHeader_MachineType::Loongarch32),
            25188 => Ok(MicrosoftPe_CoffHeader_MachineType::Loongarch64),
            34404 => Ok(MicrosoftPe_CoffHeader_MachineType::Amd64),
            36929 => Ok(MicrosoftPe_CoffHeader_MachineType::M32r),
            43620 => Ok(MicrosoftPe_CoffHeader_MachineType::Arm64),
            _ => Ok(MicrosoftPe_CoffHeader_MachineType::Unknown(flag)),
        }
    }
}

impl From<&MicrosoftPe_CoffHeader_MachineType> for i64 {
    fn from(v: &MicrosoftPe_CoffHeader_MachineType) -> Self {
        match *v {
            MicrosoftPe_CoffHeader_MachineType::Unknown => 0,
            MicrosoftPe_CoffHeader_MachineType::I386 => 332,
            MicrosoftPe_CoffHeader_MachineType::R4000 => 358,
            MicrosoftPe_CoffHeader_MachineType::WceMipsV2 => 361,
            MicrosoftPe_CoffHeader_MachineType::Alpha => 388,
            MicrosoftPe_CoffHeader_MachineType::Sh3 => 418,
            MicrosoftPe_CoffHeader_MachineType::Sh3Dsp => 419,
            MicrosoftPe_CoffHeader_MachineType::Sh4 => 422,
            MicrosoftPe_CoffHeader_MachineType::Sh5 => 424,
            MicrosoftPe_CoffHeader_MachineType::Arm => 448,
            MicrosoftPe_CoffHeader_MachineType::Thumb => 450,
            MicrosoftPe_CoffHeader_MachineType::ArmNt => 452,
            MicrosoftPe_CoffHeader_MachineType::Am33 => 467,
            MicrosoftPe_CoffHeader_MachineType::Powerpc => 496,
            MicrosoftPe_CoffHeader_MachineType::PowerpcFp => 497,
            MicrosoftPe_CoffHeader_MachineType::Ia64 => 512,
            MicrosoftPe_CoffHeader_MachineType::Mips16 => 614,
            MicrosoftPe_CoffHeader_MachineType::Alpha64OrAxp64 => 644,
            MicrosoftPe_CoffHeader_MachineType::MipsFpu => 870,
            MicrosoftPe_CoffHeader_MachineType::Mips16Fpu => 1126,
            MicrosoftPe_CoffHeader_MachineType::Ebc => 3772,
            MicrosoftPe_CoffHeader_MachineType::Riscv32 => 20530,
            MicrosoftPe_CoffHeader_MachineType::Riscv64 => 20580,
            MicrosoftPe_CoffHeader_MachineType::Riscv128 => 20776,
            MicrosoftPe_CoffHeader_MachineType::Loongarch32 => 25138,
            MicrosoftPe_CoffHeader_MachineType::Loongarch64 => 25188,
            MicrosoftPe_CoffHeader_MachineType::Amd64 => 34404,
            MicrosoftPe_CoffHeader_MachineType::M32r => 36929,
            MicrosoftPe_CoffHeader_MachineType::Arm64 => 43620,
            MicrosoftPe_CoffHeader_MachineType::Unknown(v) => v
        }
    }
}

impl Default for MicrosoftPe_CoffHeader_MachineType {
    fn default() -> Self { MicrosoftPe_CoffHeader_MachineType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct MicrosoftPe_CoffSymbol {
    pub _root: SharedType<MicrosoftPe>,
    pub _parent: SharedType<MicrosoftPe_CoffHeader>,
    pub _self: SharedType<Self>,
    name_annoying: RefCell<OptRc<MicrosoftPe_Annoyingstring>>,
    value: RefCell<u32>,
    section_number: RefCell<u16>,
    type: RefCell<u16>,
    storage_class: RefCell<u8>,
    number_of_aux_symbols: RefCell<u8>,
    _io: RefCell<BytesReader>,
    name_annoying_raw: RefCell<Vec<u8>>,
    f_data: Cell<bool>,
    data: RefCell<Vec<u8>>,
    f_section: Cell<bool>,
    section: RefCell<OptRc<MicrosoftPe_Section>>,
}
impl KStruct for MicrosoftPe_CoffSymbol {
    type Root = MicrosoftPe;
    type Parent = MicrosoftPe_CoffHeader;

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
        *self_rc.name_annoying_raw.borrow_mut() = _io.read_bytes(8 as usize)?.into();
        let name_annoying_raw = self_rc.name_annoying_raw.borrow();
        let _t_name_annoying_raw_io = BytesReader::from(name_annoying_raw.clone());
        let t = Self::read_into::<BytesReader, MicrosoftPe_Annoyingstring>(&_t_name_annoying_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.name_annoying.borrow_mut() = t;
        *self_rc.value.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.section_number.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.type.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.storage_class.borrow_mut() = _io.read_u1()?.into();
        *self_rc.number_of_aux_symbols.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl MicrosoftPe_CoffSymbol {
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
        let _pos = _io.pos();
        _io.seek(((*self.section()?.pointer_to_raw_data() as u32) + (*self.value() as u32)) as usize)?;
        *self.data.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.data.borrow())
    }
    pub fn section(
        &self
    ) -> KResult<Ref<'_, OptRc<MicrosoftPe_Section>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_section.get() {
            return Ok(self.section.borrow());
        }
        *self.section.borrow_mut() = _r.pe()?.sections()[((*self.section_number() as u16) - (1 as u16)) as usize].clone();
        Ok(self.section.borrow())
    }
}
impl MicrosoftPe_CoffSymbol {
    pub fn name_annoying(&self) -> Ref<'_, OptRc<MicrosoftPe_Annoyingstring>> {
        self.name_annoying.borrow()
    }
}
impl MicrosoftPe_CoffSymbol {
    pub fn value(&self) -> Ref<'_, u32> {
        self.value.borrow()
    }
}
impl MicrosoftPe_CoffSymbol {
    pub fn section_number(&self) -> Ref<'_, u16> {
        self.section_number.borrow()
    }
}
impl MicrosoftPe_CoffSymbol {
    pub fn type(&self) -> Ref<'_, u16> {
        self.type.borrow()
    }
}
impl MicrosoftPe_CoffSymbol {
    pub fn storage_class(&self) -> Ref<'_, u8> {
        self.storage_class.borrow()
    }
}
impl MicrosoftPe_CoffSymbol {
    pub fn number_of_aux_symbols(&self) -> Ref<'_, u8> {
        self.number_of_aux_symbols.borrow()
    }
}
impl MicrosoftPe_CoffSymbol {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl MicrosoftPe_CoffSymbol {
    pub fn name_annoying_raw(&self) -> Ref<'_, Vec<u8>> {
        self.name_annoying_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MicrosoftPe_DataDir {
    pub _root: SharedType<MicrosoftPe>,
    pub _parent: SharedType<MicrosoftPe_OptionalHeaderDataDirs>,
    pub _self: SharedType<Self>,
    virtual_address: RefCell<u32>,
    size: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MicrosoftPe_DataDir {
    type Root = MicrosoftPe;
    type Parent = MicrosoftPe_OptionalHeaderDataDirs;

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
        *self_rc.virtual_address.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.size.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl MicrosoftPe_DataDir {
}
impl MicrosoftPe_DataDir {
    pub fn virtual_address(&self) -> Ref<'_, u32> {
        self.virtual_address.borrow()
    }
}
impl MicrosoftPe_DataDir {
    pub fn size(&self) -> Ref<'_, u32> {
        self.size.borrow()
    }
}
impl MicrosoftPe_DataDir {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MicrosoftPe_MzPlaceholder {
    pub _root: SharedType<MicrosoftPe>,
    pub _parent: SharedType<MicrosoftPe>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    data1: RefCell<Vec<u8>>,
    ofs_pe: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MicrosoftPe_MzPlaceholder {
    type Root = MicrosoftPe;
    type Parent = MicrosoftPe;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.magic() == vec![0x4du8, 0x5au8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/mz_placeholder/seq/0".to_string() }));
        }
        *self_rc.data1.borrow_mut() = _io.read_bytes(58 as usize)?.into();
        *self_rc.ofs_pe.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl MicrosoftPe_MzPlaceholder {
}
impl MicrosoftPe_MzPlaceholder {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl MicrosoftPe_MzPlaceholder {
    pub fn data1(&self) -> Ref<'_, Vec<u8>> {
        self.data1.borrow()
    }
}

/**
 * In PE file, an offset to PE header
 */
impl MicrosoftPe_MzPlaceholder {
    pub fn ofs_pe(&self) -> Ref<'_, u32> {
        self.ofs_pe.borrow()
    }
}
impl MicrosoftPe_MzPlaceholder {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MicrosoftPe_OptionalHeader {
    pub _root: SharedType<MicrosoftPe>,
    pub _parent: SharedType<MicrosoftPe_PeHeader>,
    pub _self: SharedType<Self>,
    std: RefCell<OptRc<MicrosoftPe_OptionalHeaderStd>>,
    windows: RefCell<OptRc<MicrosoftPe_OptionalHeaderWindows>>,
    data_dirs: RefCell<OptRc<MicrosoftPe_OptionalHeaderDataDirs>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MicrosoftPe_OptionalHeader {
    type Root = MicrosoftPe;
    type Parent = MicrosoftPe_PeHeader;

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
        let t = Self::read_into::<_, MicrosoftPe_OptionalHeaderStd>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.std.borrow_mut() = t;
        let t = Self::read_into::<_, MicrosoftPe_OptionalHeaderWindows>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.windows.borrow_mut() = t;
        let t = Self::read_into::<_, MicrosoftPe_OptionalHeaderDataDirs>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.data_dirs.borrow_mut() = t;
        Ok(())
    }
}
impl MicrosoftPe_OptionalHeader {
}
impl MicrosoftPe_OptionalHeader {
    pub fn std(&self) -> Ref<'_, OptRc<MicrosoftPe_OptionalHeaderStd>> {
        self.std.borrow()
    }
}
impl MicrosoftPe_OptionalHeader {
    pub fn windows(&self) -> Ref<'_, OptRc<MicrosoftPe_OptionalHeaderWindows>> {
        self.windows.borrow()
    }
}
impl MicrosoftPe_OptionalHeader {
    pub fn data_dirs(&self) -> Ref<'_, OptRc<MicrosoftPe_OptionalHeaderDataDirs>> {
        self.data_dirs.borrow()
    }
}
impl MicrosoftPe_OptionalHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MicrosoftPe_OptionalHeaderDataDirs {
    pub _root: SharedType<MicrosoftPe>,
    pub _parent: SharedType<MicrosoftPe_OptionalHeader>,
    pub _self: SharedType<Self>,
    export_table: RefCell<OptRc<MicrosoftPe_DataDir>>,
    import_table: RefCell<OptRc<MicrosoftPe_DataDir>>,
    resource_table: RefCell<OptRc<MicrosoftPe_DataDir>>,
    exception_table: RefCell<OptRc<MicrosoftPe_DataDir>>,
    certificate_table: RefCell<OptRc<MicrosoftPe_DataDir>>,
    base_relocation_table: RefCell<OptRc<MicrosoftPe_DataDir>>,
    debug: RefCell<OptRc<MicrosoftPe_DataDir>>,
    architecture: RefCell<OptRc<MicrosoftPe_DataDir>>,
    global_ptr: RefCell<OptRc<MicrosoftPe_DataDir>>,
    tls_table: RefCell<OptRc<MicrosoftPe_DataDir>>,
    load_config_table: RefCell<OptRc<MicrosoftPe_DataDir>>,
    bound_import: RefCell<OptRc<MicrosoftPe_DataDir>>,
    iat: RefCell<OptRc<MicrosoftPe_DataDir>>,
    delay_import_descriptor: RefCell<OptRc<MicrosoftPe_DataDir>>,
    clr_runtime_header: RefCell<OptRc<MicrosoftPe_DataDir>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MicrosoftPe_OptionalHeaderDataDirs {
    type Root = MicrosoftPe;
    type Parent = MicrosoftPe_OptionalHeader;

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
        let t = Self::read_into::<_, MicrosoftPe_DataDir>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.export_table.borrow_mut() = t;
        let t = Self::read_into::<_, MicrosoftPe_DataDir>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.import_table.borrow_mut() = t;
        let t = Self::read_into::<_, MicrosoftPe_DataDir>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.resource_table.borrow_mut() = t;
        let t = Self::read_into::<_, MicrosoftPe_DataDir>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.exception_table.borrow_mut() = t;
        let t = Self::read_into::<_, MicrosoftPe_DataDir>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.certificate_table.borrow_mut() = t;
        let t = Self::read_into::<_, MicrosoftPe_DataDir>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.base_relocation_table.borrow_mut() = t;
        let t = Self::read_into::<_, MicrosoftPe_DataDir>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.debug.borrow_mut() = t;
        let t = Self::read_into::<_, MicrosoftPe_DataDir>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.architecture.borrow_mut() = t;
        let t = Self::read_into::<_, MicrosoftPe_DataDir>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.global_ptr.borrow_mut() = t;
        let t = Self::read_into::<_, MicrosoftPe_DataDir>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.tls_table.borrow_mut() = t;
        let t = Self::read_into::<_, MicrosoftPe_DataDir>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.load_config_table.borrow_mut() = t;
        let t = Self::read_into::<_, MicrosoftPe_DataDir>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.bound_import.borrow_mut() = t;
        let t = Self::read_into::<_, MicrosoftPe_DataDir>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.iat.borrow_mut() = t;
        let t = Self::read_into::<_, MicrosoftPe_DataDir>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.delay_import_descriptor.borrow_mut() = t;
        let t = Self::read_into::<_, MicrosoftPe_DataDir>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.clr_runtime_header.borrow_mut() = t;
        Ok(())
    }
}
impl MicrosoftPe_OptionalHeaderDataDirs {
}
impl MicrosoftPe_OptionalHeaderDataDirs {
    pub fn export_table(&self) -> Ref<'_, OptRc<MicrosoftPe_DataDir>> {
        self.export_table.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderDataDirs {
    pub fn import_table(&self) -> Ref<'_, OptRc<MicrosoftPe_DataDir>> {
        self.import_table.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderDataDirs {
    pub fn resource_table(&self) -> Ref<'_, OptRc<MicrosoftPe_DataDir>> {
        self.resource_table.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderDataDirs {
    pub fn exception_table(&self) -> Ref<'_, OptRc<MicrosoftPe_DataDir>> {
        self.exception_table.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderDataDirs {
    pub fn certificate_table(&self) -> Ref<'_, OptRc<MicrosoftPe_DataDir>> {
        self.certificate_table.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderDataDirs {
    pub fn base_relocation_table(&self) -> Ref<'_, OptRc<MicrosoftPe_DataDir>> {
        self.base_relocation_table.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderDataDirs {
    pub fn debug(&self) -> Ref<'_, OptRc<MicrosoftPe_DataDir>> {
        self.debug.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderDataDirs {
    pub fn architecture(&self) -> Ref<'_, OptRc<MicrosoftPe_DataDir>> {
        self.architecture.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderDataDirs {
    pub fn global_ptr(&self) -> Ref<'_, OptRc<MicrosoftPe_DataDir>> {
        self.global_ptr.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderDataDirs {
    pub fn tls_table(&self) -> Ref<'_, OptRc<MicrosoftPe_DataDir>> {
        self.tls_table.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderDataDirs {
    pub fn load_config_table(&self) -> Ref<'_, OptRc<MicrosoftPe_DataDir>> {
        self.load_config_table.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderDataDirs {
    pub fn bound_import(&self) -> Ref<'_, OptRc<MicrosoftPe_DataDir>> {
        self.bound_import.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderDataDirs {
    pub fn iat(&self) -> Ref<'_, OptRc<MicrosoftPe_DataDir>> {
        self.iat.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderDataDirs {
    pub fn delay_import_descriptor(&self) -> Ref<'_, OptRc<MicrosoftPe_DataDir>> {
        self.delay_import_descriptor.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderDataDirs {
    pub fn clr_runtime_header(&self) -> Ref<'_, OptRc<MicrosoftPe_DataDir>> {
        self.clr_runtime_header.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderDataDirs {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MicrosoftPe_OptionalHeaderStd {
    pub _root: SharedType<MicrosoftPe>,
    pub _parent: SharedType<MicrosoftPe_OptionalHeader>,
    pub _self: SharedType<Self>,
    format: RefCell<MicrosoftPe_PeFormat>,
    major_linker_version: RefCell<u8>,
    minor_linker_version: RefCell<u8>,
    size_of_code: RefCell<u32>,
    size_of_initialized_data: RefCell<u32>,
    size_of_uninitialized_data: RefCell<u32>,
    address_of_entry_point: RefCell<u32>,
    base_of_code: RefCell<u32>,
    base_of_data: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MicrosoftPe_OptionalHeaderStd {
    type Root = MicrosoftPe;
    type Parent = MicrosoftPe_OptionalHeader;

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
        *self_rc.format.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        *self_rc.major_linker_version.borrow_mut() = _io.read_u1()?.into();
        *self_rc.minor_linker_version.borrow_mut() = _io.read_u1()?.into();
        *self_rc.size_of_code.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.size_of_initialized_data.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.size_of_uninitialized_data.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.address_of_entry_point.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.base_of_code.borrow_mut() = _io.read_u4le()?.into();
        if *self_rc.format() == MicrosoftPe_PeFormat::Pe32 {
            *self_rc.base_of_data.borrow_mut() = _io.read_u4le()?.into();
        }
        Ok(())
    }
}
impl MicrosoftPe_OptionalHeaderStd {
}
impl MicrosoftPe_OptionalHeaderStd {
    pub fn format(&self) -> Ref<'_, MicrosoftPe_PeFormat> {
        self.format.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderStd {
    pub fn major_linker_version(&self) -> Ref<'_, u8> {
        self.major_linker_version.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderStd {
    pub fn minor_linker_version(&self) -> Ref<'_, u8> {
        self.minor_linker_version.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderStd {
    pub fn size_of_code(&self) -> Ref<'_, u32> {
        self.size_of_code.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderStd {
    pub fn size_of_initialized_data(&self) -> Ref<'_, u32> {
        self.size_of_initialized_data.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderStd {
    pub fn size_of_uninitialized_data(&self) -> Ref<'_, u32> {
        self.size_of_uninitialized_data.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderStd {
    pub fn address_of_entry_point(&self) -> Ref<'_, u32> {
        self.address_of_entry_point.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderStd {
    pub fn base_of_code(&self) -> Ref<'_, u32> {
        self.base_of_code.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderStd {
    pub fn base_of_data(&self) -> Ref<'_, u32> {
        self.base_of_data.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderStd {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MicrosoftPe_OptionalHeaderWindows {
    pub _root: SharedType<MicrosoftPe>,
    pub _parent: SharedType<MicrosoftPe_OptionalHeader>,
    pub _self: SharedType<Self>,
    image_base_32: RefCell<u32>,
    image_base_64: RefCell<u64>,
    section_alignment: RefCell<u32>,
    file_alignment: RefCell<u32>,
    major_operating_system_version: RefCell<u16>,
    minor_operating_system_version: RefCell<u16>,
    major_image_version: RefCell<u16>,
    minor_image_version: RefCell<u16>,
    major_subsystem_version: RefCell<u16>,
    minor_subsystem_version: RefCell<u16>,
    win32_version_value: RefCell<u32>,
    size_of_image: RefCell<u32>,
    size_of_headers: RefCell<u32>,
    check_sum: RefCell<u32>,
    subsystem: RefCell<MicrosoftPe_OptionalHeaderWindows_SubsystemEnum>,
    dll_characteristics: RefCell<u16>,
    size_of_stack_reserve_32: RefCell<u32>,
    size_of_stack_reserve_64: RefCell<u64>,
    size_of_stack_commit_32: RefCell<u32>,
    size_of_stack_commit_64: RefCell<u64>,
    size_of_heap_reserve_32: RefCell<u32>,
    size_of_heap_reserve_64: RefCell<u64>,
    size_of_heap_commit_32: RefCell<u32>,
    size_of_heap_commit_64: RefCell<u64>,
    loader_flags: RefCell<u32>,
    number_of_rva_and_sizes: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for MicrosoftPe_OptionalHeaderWindows {
    type Root = MicrosoftPe;
    type Parent = MicrosoftPe_OptionalHeader;

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
        if *_prc.as_ref().unwrap().std().format() == MicrosoftPe_PeFormat::Pe32 {
            *self_rc.image_base_32.borrow_mut() = _io.read_u4le()?.into();
        }
        if *_prc.as_ref().unwrap().std().format() == MicrosoftPe_PeFormat::Pe32Plus {
            *self_rc.image_base_64.borrow_mut() = _io.read_u8le()?.into();
        }
        *self_rc.section_alignment.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.file_alignment.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.major_operating_system_version.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.minor_operating_system_version.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.major_image_version.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.minor_image_version.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.major_subsystem_version.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.minor_subsystem_version.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.win32_version_value.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.size_of_image.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.size_of_headers.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.check_sum.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.subsystem.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        *self_rc.dll_characteristics.borrow_mut() = _io.read_u2le()?.into();
        if *_prc.as_ref().unwrap().std().format() == MicrosoftPe_PeFormat::Pe32 {
            *self_rc.size_of_stack_reserve_32.borrow_mut() = _io.read_u4le()?.into();
        }
        if *_prc.as_ref().unwrap().std().format() == MicrosoftPe_PeFormat::Pe32Plus {
            *self_rc.size_of_stack_reserve_64.borrow_mut() = _io.read_u8le()?.into();
        }
        if *_prc.as_ref().unwrap().std().format() == MicrosoftPe_PeFormat::Pe32 {
            *self_rc.size_of_stack_commit_32.borrow_mut() = _io.read_u4le()?.into();
        }
        if *_prc.as_ref().unwrap().std().format() == MicrosoftPe_PeFormat::Pe32Plus {
            *self_rc.size_of_stack_commit_64.borrow_mut() = _io.read_u8le()?.into();
        }
        if *_prc.as_ref().unwrap().std().format() == MicrosoftPe_PeFormat::Pe32 {
            *self_rc.size_of_heap_reserve_32.borrow_mut() = _io.read_u4le()?.into();
        }
        if *_prc.as_ref().unwrap().std().format() == MicrosoftPe_PeFormat::Pe32Plus {
            *self_rc.size_of_heap_reserve_64.borrow_mut() = _io.read_u8le()?.into();
        }
        if *_prc.as_ref().unwrap().std().format() == MicrosoftPe_PeFormat::Pe32 {
            *self_rc.size_of_heap_commit_32.borrow_mut() = _io.read_u4le()?.into();
        }
        if *_prc.as_ref().unwrap().std().format() == MicrosoftPe_PeFormat::Pe32Plus {
            *self_rc.size_of_heap_commit_64.borrow_mut() = _io.read_u8le()?.into();
        }
        *self_rc.loader_flags.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.number_of_rva_and_sizes.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn image_base_32(&self) -> Ref<'_, u32> {
        self.image_base_32.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn image_base_64(&self) -> Ref<'_, u64> {
        self.image_base_64.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn section_alignment(&self) -> Ref<'_, u32> {
        self.section_alignment.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn file_alignment(&self) -> Ref<'_, u32> {
        self.file_alignment.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn major_operating_system_version(&self) -> Ref<'_, u16> {
        self.major_operating_system_version.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn minor_operating_system_version(&self) -> Ref<'_, u16> {
        self.minor_operating_system_version.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn major_image_version(&self) -> Ref<'_, u16> {
        self.major_image_version.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn minor_image_version(&self) -> Ref<'_, u16> {
        self.minor_image_version.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn major_subsystem_version(&self) -> Ref<'_, u16> {
        self.major_subsystem_version.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn minor_subsystem_version(&self) -> Ref<'_, u16> {
        self.minor_subsystem_version.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn win32_version_value(&self) -> Ref<'_, u32> {
        self.win32_version_value.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn size_of_image(&self) -> Ref<'_, u32> {
        self.size_of_image.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn size_of_headers(&self) -> Ref<'_, u32> {
        self.size_of_headers.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn check_sum(&self) -> Ref<'_, u32> {
        self.check_sum.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn subsystem(&self) -> Ref<'_, MicrosoftPe_OptionalHeaderWindows_SubsystemEnum> {
        self.subsystem.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn dll_characteristics(&self) -> Ref<'_, u16> {
        self.dll_characteristics.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn size_of_stack_reserve_32(&self) -> Ref<'_, u32> {
        self.size_of_stack_reserve_32.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn size_of_stack_reserve_64(&self) -> Ref<'_, u64> {
        self.size_of_stack_reserve_64.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn size_of_stack_commit_32(&self) -> Ref<'_, u32> {
        self.size_of_stack_commit_32.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn size_of_stack_commit_64(&self) -> Ref<'_, u64> {
        self.size_of_stack_commit_64.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn size_of_heap_reserve_32(&self) -> Ref<'_, u32> {
        self.size_of_heap_reserve_32.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn size_of_heap_reserve_64(&self) -> Ref<'_, u64> {
        self.size_of_heap_reserve_64.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn size_of_heap_commit_32(&self) -> Ref<'_, u32> {
        self.size_of_heap_commit_32.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn size_of_heap_commit_64(&self) -> Ref<'_, u64> {
        self.size_of_heap_commit_64.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn loader_flags(&self) -> Ref<'_, u32> {
        self.loader_flags.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn number_of_rva_and_sizes(&self) -> Ref<'_, u32> {
        self.number_of_rva_and_sizes.borrow()
    }
}
impl MicrosoftPe_OptionalHeaderWindows {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum MicrosoftPe_OptionalHeaderWindows_SubsystemEnum {
    Unknown,
    Native,
    WindowsGui,
    WindowsCui,
    PosixCui,
    WindowsCeGui,
    EfiApplication,
    EfiBootServiceDriver,
    EfiRuntimeDriver,
    EfiRom,
    Xbox,
    WindowsBootApplication,
    Unknown(i64),
}

impl TryFrom<i64> for MicrosoftPe_OptionalHeaderWindows_SubsystemEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<MicrosoftPe_OptionalHeaderWindows_SubsystemEnum> {
        match flag {
            0 => Ok(MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::Unknown),
            1 => Ok(MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::Native),
            2 => Ok(MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::WindowsGui),
            3 => Ok(MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::WindowsCui),
            7 => Ok(MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::PosixCui),
            9 => Ok(MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::WindowsCeGui),
            10 => Ok(MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::EfiApplication),
            11 => Ok(MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::EfiBootServiceDriver),
            12 => Ok(MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::EfiRuntimeDriver),
            13 => Ok(MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::EfiRom),
            14 => Ok(MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::Xbox),
            16 => Ok(MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::WindowsBootApplication),
            _ => Ok(MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::Unknown(flag)),
        }
    }
}

impl From<&MicrosoftPe_OptionalHeaderWindows_SubsystemEnum> for i64 {
    fn from(v: &MicrosoftPe_OptionalHeaderWindows_SubsystemEnum) -> Self {
        match *v {
            MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::Unknown => 0,
            MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::Native => 1,
            MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::WindowsGui => 2,
            MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::WindowsCui => 3,
            MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::PosixCui => 7,
            MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::WindowsCeGui => 9,
            MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::EfiApplication => 10,
            MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::EfiBootServiceDriver => 11,
            MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::EfiRuntimeDriver => 12,
            MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::EfiRom => 13,
            MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::Xbox => 14,
            MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::WindowsBootApplication => 16,
            MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::Unknown(v) => v
        }
    }
}

impl Default for MicrosoftPe_OptionalHeaderWindows_SubsystemEnum {
    fn default() -> Self { MicrosoftPe_OptionalHeaderWindows_SubsystemEnum::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct MicrosoftPe_PeHeader {
    pub _root: SharedType<MicrosoftPe>,
    pub _parent: SharedType<MicrosoftPe>,
    pub _self: SharedType<Self>,
    pe_signature: RefCell<Vec<u8>>,
    coff_hdr: RefCell<OptRc<MicrosoftPe_CoffHeader>>,
    optional_hdr: RefCell<OptRc<MicrosoftPe_OptionalHeader>>,
    sections: RefCell<Vec<OptRc<MicrosoftPe_Section>>>,
    _io: RefCell<BytesReader>,
    optional_hdr_raw: RefCell<Vec<u8>>,
    certificate_table_raw: RefCell<Vec<u8>>,
    f_certificate_table: Cell<bool>,
    certificate_table: RefCell<OptRc<MicrosoftPe_CertificateTable>>,
}
impl KStruct for MicrosoftPe_PeHeader {
    type Root = MicrosoftPe;
    type Parent = MicrosoftPe;

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
        *self_rc.pe_signature.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.pe_signature() == vec![0x50u8, 0x45u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/pe_header/seq/0".to_string() }));
        }
        let t = Self::read_into::<_, MicrosoftPe_CoffHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.coff_hdr.borrow_mut() = t;
        *self_rc.optional_hdr_raw.borrow_mut() = _io.read_bytes(*self_rc.coff_hdr().size_of_optional_header() as usize)?.into();
        let optional_hdr_raw = self_rc.optional_hdr_raw.borrow();
        let _t_optional_hdr_raw_io = BytesReader::from(optional_hdr_raw.clone());
        let t = Self::read_into::<BytesReader, MicrosoftPe_OptionalHeader>(&_t_optional_hdr_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.optional_hdr.borrow_mut() = t;
        *self_rc.sections.borrow_mut() = Vec::new();
        let l_sections = *self_rc.coff_hdr().number_of_sections();
        for _i in 0..l_sections {
            let t = Self::read_into::<_, MicrosoftPe_Section>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.sections.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl MicrosoftPe_PeHeader {
    pub fn certificate_table(
        &self
    ) -> KResult<Ref<'_, OptRc<MicrosoftPe_CertificateTable>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_certificate_table.get() {
            return Ok(self.certificate_table.borrow());
        }
        if ((*self.optional_hdr().data_dirs().certificate_table().virtual_address() as u32) != (0 as u32)) {
            let _pos = _io.pos();
            _io.seek(*self.optional_hdr().data_dirs().certificate_table().virtual_address() as usize)?;
            *self.certificate_table_raw.borrow_mut() = _io.read_bytes(*self.optional_hdr().data_dirs().certificate_table().size() as usize)?.into();
            let certificate_table_raw = self.certificate_table_raw.borrow();
            let _t_certificate_table_raw_io = BytesReader::from(certificate_table_raw.clone());
            let t = Self::read_into::<BytesReader, MicrosoftPe_CertificateTable>(&_t_certificate_table_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.certificate_table.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.certificate_table.borrow())
    }
}
impl MicrosoftPe_PeHeader {
    pub fn pe_signature(&self) -> Ref<'_, Vec<u8>> {
        self.pe_signature.borrow()
    }
}
impl MicrosoftPe_PeHeader {
    pub fn coff_hdr(&self) -> Ref<'_, OptRc<MicrosoftPe_CoffHeader>> {
        self.coff_hdr.borrow()
    }
}
impl MicrosoftPe_PeHeader {
    pub fn optional_hdr(&self) -> Ref<'_, OptRc<MicrosoftPe_OptionalHeader>> {
        self.optional_hdr.borrow()
    }
}
impl MicrosoftPe_PeHeader {
    pub fn sections(&self) -> Ref<'_, Vec<OptRc<MicrosoftPe_Section>>> {
        self.sections.borrow()
    }
}
impl MicrosoftPe_PeHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl MicrosoftPe_PeHeader {
    pub fn optional_hdr_raw(&self) -> Ref<'_, Vec<u8>> {
        self.optional_hdr_raw.borrow()
    }
}
impl MicrosoftPe_PeHeader {
    pub fn certificate_table_raw(&self) -> Ref<'_, Vec<u8>> {
        self.certificate_table_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct MicrosoftPe_Section {
    pub _root: SharedType<MicrosoftPe>,
    pub _parent: SharedType<MicrosoftPe_PeHeader>,
    pub _self: SharedType<Self>,
    name: RefCell<String>,
    virtual_size: RefCell<u32>,
    virtual_address: RefCell<u32>,
    size_of_raw_data: RefCell<u32>,
    pointer_to_raw_data: RefCell<u32>,
    pointer_to_relocations: RefCell<u32>,
    pointer_to_linenumbers: RefCell<u32>,
    number_of_relocations: RefCell<u16>,
    number_of_linenumbers: RefCell<u16>,
    characteristics: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_body: Cell<bool>,
    body: RefCell<Vec<u8>>,
}
impl KStruct for MicrosoftPe_Section {
    type Root = MicrosoftPe;
    type Parent = MicrosoftPe_PeHeader;

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
        *self_rc.name.borrow_mut() = bytes_to_str(&bytes_strip_right(&_io.read_bytes(8 as usize)?.into(), 0).into(), "UTF-8")?;
        *self_rc.virtual_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.virtual_address.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.size_of_raw_data.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.pointer_to_raw_data.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.pointer_to_relocations.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.pointer_to_linenumbers.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.number_of_relocations.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.number_of_linenumbers.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.characteristics.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl MicrosoftPe_Section {
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
        _io.seek(*self.pointer_to_raw_data() as usize)?;
        *self.body.borrow_mut() = _io.read_bytes(*self.size_of_raw_data() as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.body.borrow())
    }
}
impl MicrosoftPe_Section {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl MicrosoftPe_Section {
    pub fn virtual_size(&self) -> Ref<'_, u32> {
        self.virtual_size.borrow()
    }
}
impl MicrosoftPe_Section {
    pub fn virtual_address(&self) -> Ref<'_, u32> {
        self.virtual_address.borrow()
    }
}
impl MicrosoftPe_Section {
    pub fn size_of_raw_data(&self) -> Ref<'_, u32> {
        self.size_of_raw_data.borrow()
    }
}
impl MicrosoftPe_Section {
    pub fn pointer_to_raw_data(&self) -> Ref<'_, u32> {
        self.pointer_to_raw_data.borrow()
    }
}
impl MicrosoftPe_Section {
    pub fn pointer_to_relocations(&self) -> Ref<'_, u32> {
        self.pointer_to_relocations.borrow()
    }
}
impl MicrosoftPe_Section {
    pub fn pointer_to_linenumbers(&self) -> Ref<'_, u32> {
        self.pointer_to_linenumbers.borrow()
    }
}
impl MicrosoftPe_Section {
    pub fn number_of_relocations(&self) -> Ref<'_, u16> {
        self.number_of_relocations.borrow()
    }
}
impl MicrosoftPe_Section {
    pub fn number_of_linenumbers(&self) -> Ref<'_, u16> {
        self.number_of_linenumbers.borrow()
    }
}
impl MicrosoftPe_Section {
    pub fn characteristics(&self) -> Ref<'_, u32> {
        self.characteristics.borrow()
    }
}
impl MicrosoftPe_Section {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

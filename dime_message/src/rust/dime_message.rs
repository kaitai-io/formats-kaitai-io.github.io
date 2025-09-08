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
 * Direct Internet Message Encapsulation (DIME)
 * is an old Microsoft specification for sending and receiving
 * SOAP messages along with additional attachments,
 * like binary files, XML fragments, and even other
 * SOAP messages, using standard transport protocols like HTTP.
 * 
 * Sample file: `curl -LO
 * https://github.com/kaitai-io/kaitai_struct_formats/files/5894723/scanner_withoptions.dump.gz
 * && gunzip scanner_withoptions.dump.gz`
 * \sa https://datatracker.ietf.org/doc/html/draft-nielsen-dime-02 Source
 * \sa https://learn.microsoft.com/en-us/archive/msdn-magazine/2002/december/sending-files-attachments-and-soap-messages-via-dime Source
 * \sa http://imrannazar.com/Parsing-the-DIME-Message-Format Source
 */

#[derive(Default, Debug, Clone)]
pub struct DimeMessage {
    pub _root: SharedType<DimeMessage>,
    pub _parent: SharedType<DimeMessage>,
    pub _self: SharedType<Self>,
    records: RefCell<Vec<OptRc<DimeMessage_Record>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for DimeMessage {
    type Root = DimeMessage;
    type Parent = DimeMessage;

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
        *self_rc.records.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, DimeMessage_Record>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.records.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl DimeMessage {
}
impl DimeMessage {
    pub fn records(&self) -> Ref<'_, Vec<OptRc<DimeMessage_Record>>> {
        self.records.borrow()
    }
}
impl DimeMessage {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum DimeMessage_TypeFormats {
    Unchanged,
    MediaType,
    AbsoluteUri,
    Unknown,
    None,
    Unknown(i64),
}

impl TryFrom<i64> for DimeMessage_TypeFormats {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<DimeMessage_TypeFormats> {
        match flag {
            0 => Ok(DimeMessage_TypeFormats::Unchanged),
            1 => Ok(DimeMessage_TypeFormats::MediaType),
            2 => Ok(DimeMessage_TypeFormats::AbsoluteUri),
            3 => Ok(DimeMessage_TypeFormats::Unknown),
            4 => Ok(DimeMessage_TypeFormats::None),
            _ => Ok(DimeMessage_TypeFormats::Unknown(flag)),
        }
    }
}

impl From<&DimeMessage_TypeFormats> for i64 {
    fn from(v: &DimeMessage_TypeFormats) -> Self {
        match *v {
            DimeMessage_TypeFormats::Unchanged => 0,
            DimeMessage_TypeFormats::MediaType => 1,
            DimeMessage_TypeFormats::AbsoluteUri => 2,
            DimeMessage_TypeFormats::Unknown => 3,
            DimeMessage_TypeFormats::None => 4,
            DimeMessage_TypeFormats::Unknown(v) => v
        }
    }
}

impl Default for DimeMessage_TypeFormats {
    fn default() -> Self { DimeMessage_TypeFormats::Unknown(0) }
}


/**
 * one element of the option field
 */

#[derive(Default, Debug, Clone)]
pub struct DimeMessage_OptionElement {
    pub _root: SharedType<DimeMessage>,
    pub _parent: SharedType<DimeMessage_OptionField>,
    pub _self: SharedType<Self>,
    element_format: RefCell<u16>,
    len_element: RefCell<u16>,
    element_data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for DimeMessage_OptionElement {
    type Root = DimeMessage;
    type Parent = DimeMessage_OptionField;

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
        *self_rc.element_format.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.len_element.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.element_data.borrow_mut() = _io.read_bytes(*self_rc.len_element() as usize)?.into();
        Ok(())
    }
}
impl DimeMessage_OptionElement {
}
impl DimeMessage_OptionElement {
    pub fn element_format(&self) -> Ref<'_, u16> {
        self.element_format.borrow()
    }
}
impl DimeMessage_OptionElement {
    pub fn len_element(&self) -> Ref<'_, u16> {
        self.len_element.borrow()
    }
}
impl DimeMessage_OptionElement {
    pub fn element_data(&self) -> Ref<'_, Vec<u8>> {
        self.element_data.borrow()
    }
}
impl DimeMessage_OptionElement {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * the option field of the record
 */

#[derive(Default, Debug, Clone)]
pub struct DimeMessage_OptionField {
    pub _root: SharedType<DimeMessage>,
    pub _parent: SharedType<DimeMessage_Record>,
    pub _self: SharedType<Self>,
    option_elements: RefCell<Vec<OptRc<DimeMessage_OptionElement>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for DimeMessage_OptionField {
    type Root = DimeMessage;
    type Parent = DimeMessage_Record;

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
        *self_rc.option_elements.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, DimeMessage_OptionElement>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.option_elements.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl DimeMessage_OptionField {
}
impl DimeMessage_OptionField {
    pub fn option_elements(&self) -> Ref<'_, Vec<OptRc<DimeMessage_OptionElement>>> {
        self.option_elements.borrow()
    }
}
impl DimeMessage_OptionField {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * padding to the next 4-byte boundary
 */

#[derive(Default, Debug, Clone)]
pub struct DimeMessage_Padding {
    pub _root: SharedType<DimeMessage>,
    pub _parent: SharedType<DimeMessage_Record>,
    pub _self: SharedType<Self>,
    boundary_padding: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for DimeMessage_Padding {
    type Root = DimeMessage;
    type Parent = DimeMessage_Record;

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
        *self_rc.boundary_padding.borrow_mut() = _io.read_bytes(modulo(-(_io.pos()) as i64, 4 as i64) as usize)?.into();
        Ok(())
    }
}
impl DimeMessage_Padding {
}
impl DimeMessage_Padding {
    pub fn boundary_padding(&self) -> Ref<'_, Vec<u8>> {
        self.boundary_padding.borrow()
    }
}
impl DimeMessage_Padding {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * each individual fragment of the message
 */

#[derive(Default, Debug, Clone)]
pub struct DimeMessage_Record {
    pub _root: SharedType<DimeMessage>,
    pub _parent: SharedType<DimeMessage>,
    pub _self: SharedType<Self>,
    version: RefCell<u64>,
    is_first_record: RefCell<bool>,
    is_last_record: RefCell<bool>,
    is_chunk_record: RefCell<bool>,
    type_format: RefCell<DimeMessage_TypeFormats>,
    reserved: RefCell<u64>,
    len_options: RefCell<u16>,
    len_id: RefCell<u16>,
    len_type: RefCell<u16>,
    len_data: RefCell<u32>,
    options: RefCell<OptRc<DimeMessage_OptionField>>,
    options_padding: RefCell<OptRc<DimeMessage_Padding>>,
    id: RefCell<String>,
    id_padding: RefCell<OptRc<DimeMessage_Padding>>,
    type: RefCell<String>,
    type_padding: RefCell<OptRc<DimeMessage_Padding>>,
    data: RefCell<Vec<u8>>,
    data_padding: RefCell<OptRc<DimeMessage_Padding>>,
    _io: RefCell<BytesReader>,
    options_raw: RefCell<Vec<u8>>,
}
impl KStruct for DimeMessage_Record {
    type Root = DimeMessage;
    type Parent = DimeMessage;

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
        *self_rc.version.borrow_mut() = _io.read_bits_int_be(5)?;
        *self_rc.is_first_record.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.is_last_record.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.is_chunk_record.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.type_format.borrow_mut() = (_io.read_bits_int_be(4)? as i64).try_into()?;
        *self_rc.reserved.borrow_mut() = _io.read_bits_int_be(4)?;
        _io.align_to_byte()?;
        *self_rc.len_options.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.len_id.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.len_type.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.len_data.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.options_raw.borrow_mut() = _io.read_bytes(*self_rc.len_options() as usize)?.into();
        let options_raw = self_rc.options_raw.borrow();
        let _t_options_raw_io = BytesReader::from(options_raw.clone());
        let t = Self::read_into::<BytesReader, DimeMessage_OptionField>(&_t_options_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.options.borrow_mut() = t;
        let t = Self::read_into::<_, DimeMessage_Padding>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.options_padding.borrow_mut() = t;
        *self_rc.id.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.len_id() as usize)?.into(), "ASCII")?;
        let t = Self::read_into::<_, DimeMessage_Padding>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.id_padding.borrow_mut() = t;
        *self_rc.type.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.len_type() as usize)?.into(), "ASCII")?;
        let t = Self::read_into::<_, DimeMessage_Padding>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.type_padding.borrow_mut() = t;
        *self_rc.data.borrow_mut() = _io.read_bytes(*self_rc.len_data() as usize)?.into();
        let t = Self::read_into::<_, DimeMessage_Padding>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.data_padding.borrow_mut() = t;
        Ok(())
    }
}
impl DimeMessage_Record {
}

/**
 * DIME format version (always 1)
 */
impl DimeMessage_Record {
    pub fn version(&self) -> Ref<'_, u64> {
        self.version.borrow()
    }
}

/**
 * Set if this is the first record in the message
 */
impl DimeMessage_Record {
    pub fn is_first_record(&self) -> Ref<'_, bool> {
        self.is_first_record.borrow()
    }
}

/**
 * Set if this is the last record in the message
 */
impl DimeMessage_Record {
    pub fn is_last_record(&self) -> Ref<'_, bool> {
        self.is_last_record.borrow()
    }
}

/**
 * Set if the file contained in this record is chunked into multiple records
 */
impl DimeMessage_Record {
    pub fn is_chunk_record(&self) -> Ref<'_, bool> {
        self.is_chunk_record.borrow()
    }
}

/**
 * Indicates the structure and format of the value of the TYPE field
 */
impl DimeMessage_Record {
    pub fn type_format(&self) -> Ref<'_, DimeMessage_TypeFormats> {
        self.type_format.borrow()
    }
}

/**
 * Reserved for future use
 */
impl DimeMessage_Record {
    pub fn reserved(&self) -> Ref<'_, u64> {
        self.reserved.borrow()
    }
}

/**
 * Length of the Options field
 */
impl DimeMessage_Record {
    pub fn len_options(&self) -> Ref<'_, u16> {
        self.len_options.borrow()
    }
}

/**
 * Length of the ID field
 */
impl DimeMessage_Record {
    pub fn len_id(&self) -> Ref<'_, u16> {
        self.len_id.borrow()
    }
}

/**
 * Length of the Type field
 */
impl DimeMessage_Record {
    pub fn len_type(&self) -> Ref<'_, u16> {
        self.len_type.borrow()
    }
}

/**
 * Length of the Data field
 */
impl DimeMessage_Record {
    pub fn len_data(&self) -> Ref<'_, u32> {
        self.len_data.borrow()
    }
}
impl DimeMessage_Record {
    pub fn options(&self) -> Ref<'_, OptRc<DimeMessage_OptionField>> {
        self.options.borrow()
    }
}
impl DimeMessage_Record {
    pub fn options_padding(&self) -> Ref<'_, OptRc<DimeMessage_Padding>> {
        self.options_padding.borrow()
    }
}

/**
 * Unique identifier of the file (set in the first record of file)
 */
impl DimeMessage_Record {
    pub fn id(&self) -> Ref<'_, String> {
        self.id.borrow()
    }
}
impl DimeMessage_Record {
    pub fn id_padding(&self) -> Ref<'_, OptRc<DimeMessage_Padding>> {
        self.id_padding.borrow()
    }
}

/**
 * Specified type in the format set with type_format
 */
impl DimeMessage_Record {
    pub fn type(&self) -> Ref<'_, String> {
        self.type.borrow()
    }
}
impl DimeMessage_Record {
    pub fn type_padding(&self) -> Ref<'_, OptRc<DimeMessage_Padding>> {
        self.type_padding.borrow()
    }
}

/**
 * The file data
 */
impl DimeMessage_Record {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl DimeMessage_Record {
    pub fn data_padding(&self) -> Ref<'_, OptRc<DimeMessage_Padding>> {
        self.data_padding.borrow()
    }
}
impl DimeMessage_Record {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl DimeMessage_Record {
    pub fn options_raw(&self) -> Ref<'_, Vec<u8>> {
        self.options_raw.borrow()
    }
}

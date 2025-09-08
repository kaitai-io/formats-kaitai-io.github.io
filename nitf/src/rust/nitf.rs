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
 * The NITF (National Image Transition Format) format is a file format developed by the U.S. Government for
 * storing imagery, e.g. from satellites.
 * 
 * According to the [foreword of the specification](https://web.archive.org/web/20181105050336/https://www.gwg.nga.mil/ntb/baseline/docs/2500c/2500C.pdf):
 * > The National Imagery Transmission Format Standard (NITFS) is the suite of standards for formatting digital
 * > imagery and imagery-related products and exchanging them among members of the Intelligence Community (IC) as
 * > defined by the Executive Order 12333, and other United States Government departments and agencies."
 * 
 * This implementation is set to version format (`file_version`) of 02.10 and `standard_type` of `BF01`.
 * It was implemented by [River Loop Security](https://www.riverloopsecurity.com/).
 * \sa https://web.archive.org/web/20181105050336/https://www.gwg.nga.mil/ntb/baseline/docs/2500c/2500C.pdf Source
 */

#[derive(Default, Debug, Clone)]
pub struct Nitf {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<Nitf>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<Nitf_Header>>,
    image_segments: RefCell<Vec<OptRc<Nitf_ImageSegment>>>,
    graphics_segments: RefCell<Vec<OptRc<Nitf_GraphicsSegment>>>,
    text_segments: RefCell<Vec<OptRc<Nitf_TextSegment>>>,
    data_extension_segments: RefCell<Vec<OptRc<Nitf_DataExtensionSegment>>>,
    reserved_extension_segments: RefCell<Vec<OptRc<Nitf_ReservedExtensionSegment>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Nitf {
    type Root = Nitf;
    type Parent = Nitf;

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
        let t = Self::read_into::<_, Nitf_Header>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        *self_rc.image_segments.borrow_mut() = Vec::new();
        let l_image_segments = *self_rc.header().num_image_segments().parse::<i32>().map_err(|_| KError::CastError)?;
        for _i in 0..l_image_segments {
            let f = |t : &mut Nitf_ImageSegment| Ok(t.set_params((_i).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, Nitf_ImageSegment>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            self_rc.image_segments.borrow_mut().push(t);
        }
        *self_rc.graphics_segments.borrow_mut() = Vec::new();
        let l_graphics_segments = *self_rc.header().num_graphics_segments().parse::<i32>().map_err(|_| KError::CastError)?;
        for _i in 0..l_graphics_segments {
            let f = |t : &mut Nitf_GraphicsSegment| Ok(t.set_params((_i).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, Nitf_GraphicsSegment>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            self_rc.graphics_segments.borrow_mut().push(t);
        }
        *self_rc.text_segments.borrow_mut() = Vec::new();
        let l_text_segments = *self_rc.header().num_text_files().parse::<i32>().map_err(|_| KError::CastError)?;
        for _i in 0..l_text_segments {
            let f = |t : &mut Nitf_TextSegment| Ok(t.set_params((_i).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, Nitf_TextSegment>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            self_rc.text_segments.borrow_mut().push(t);
        }
        *self_rc.data_extension_segments.borrow_mut() = Vec::new();
        let l_data_extension_segments = *self_rc.header().num_data_extension().parse::<i32>().map_err(|_| KError::CastError)?;
        for _i in 0..l_data_extension_segments {
            let f = |t : &mut Nitf_DataExtensionSegment| Ok(t.set_params((_i).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, Nitf_DataExtensionSegment>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            self_rc.data_extension_segments.borrow_mut().push(t);
        }
        *self_rc.reserved_extension_segments.borrow_mut() = Vec::new();
        let l_reserved_extension_segments = *self_rc.header().num_reserved_extension().parse::<i32>().map_err(|_| KError::CastError)?;
        for _i in 0..l_reserved_extension_segments {
            let f = |t : &mut Nitf_ReservedExtensionSegment| Ok(t.set_params((_i).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, Nitf_ReservedExtensionSegment>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            self_rc.reserved_extension_segments.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Nitf {
}
impl Nitf {
    pub fn header(&self) -> Ref<'_, OptRc<Nitf_Header>> {
        self.header.borrow()
    }
}
impl Nitf {
    pub fn image_segments(&self) -> Ref<'_, Vec<OptRc<Nitf_ImageSegment>>> {
        self.image_segments.borrow()
    }
}
impl Nitf {
    pub fn graphics_segments(&self) -> Ref<'_, Vec<OptRc<Nitf_GraphicsSegment>>> {
        self.graphics_segments.borrow()
    }
}
impl Nitf {
    pub fn text_segments(&self) -> Ref<'_, Vec<OptRc<Nitf_TextSegment>>> {
        self.text_segments.borrow()
    }
}
impl Nitf {
    pub fn data_extension_segments(&self) -> Ref<'_, Vec<OptRc<Nitf_DataExtensionSegment>>> {
        self.data_extension_segments.borrow()
    }
}
impl Nitf {
    pub fn reserved_extension_segments(&self) -> Ref<'_, Vec<OptRc<Nitf_ReservedExtensionSegment>>> {
        self.reserved_extension_segments.borrow()
    }
}
impl Nitf {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_BandInfo {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<Nitf_ImageSubHeader>,
    pub _self: SharedType<Self>,
    representation: RefCell<String>,
    subcategory: RefCell<String>,
    img_filter_condition: RefCell<Vec<u8>>,
    img_filter_code: RefCell<String>,
    num_luts: RefCell<String>,
    num_lut_entries: RefCell<String>,
    luts: RefCell<Vec<Vec<u8>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Nitf_BandInfo {
    type Root = Nitf;
    type Parent = Nitf_ImageSubHeader;

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
        *self_rc.representation.borrow_mut() = bytes_to_str(&_io.read_bytes(2 as usize)?.into(), "UTF-8")?;
        *self_rc.subcategory.borrow_mut() = bytes_to_str(&_io.read_bytes(6 as usize)?.into(), "UTF-8")?;
        *self_rc.img_filter_condition.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.img_filter_condition() == vec![0x4eu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/band_info/seq/2".to_string() }));
        }
        *self_rc.img_filter_code.borrow_mut() = bytes_to_str(&_io.read_bytes(3 as usize)?.into(), "UTF-8")?;
        *self_rc.num_luts.borrow_mut() = bytes_to_str(&_io.read_bytes(1 as usize)?.into(), "UTF-8")?;
        if ((*self_rc.num_luts().parse::<i32>().map_err(|_| KError::CastError)? as i32) != (0 as i32)) {
            *self_rc.num_lut_entries.borrow_mut() = bytes_to_str(&_io.read_bytes(5 as usize)?.into(), "UTF-8")?;
        }
        *self_rc.luts.borrow_mut() = Vec::new();
        let l_luts = *self_rc.num_luts().parse::<i32>().map_err(|_| KError::CastError)?;
        for _i in 0..l_luts {
            self_rc.luts.borrow_mut().push(_io.read_bytes(*self_rc.num_lut_entries().parse::<i32>().map_err(|_| KError::CastError)? as usize)?.into());
        }
        Ok(())
    }
}
impl Nitf_BandInfo {
}

/**
 * Indicates processing required to display the nth band of image w.r.t. the general image type recorded by IREP field
 */
impl Nitf_BandInfo {
    pub fn representation(&self) -> Ref<'_, String> {
        self.representation.borrow()
    }
}
impl Nitf_BandInfo {
    pub fn subcategory(&self) -> Ref<'_, String> {
        self.subcategory.borrow()
    }
}
impl Nitf_BandInfo {
    pub fn img_filter_condition(&self) -> Ref<'_, Vec<u8>> {
        self.img_filter_condition.borrow()
    }
}

/**
 * Reserved
 */
impl Nitf_BandInfo {
    pub fn img_filter_code(&self) -> Ref<'_, String> {
        self.img_filter_code.borrow()
    }
}
impl Nitf_BandInfo {
    pub fn num_luts(&self) -> Ref<'_, String> {
        self.num_luts.borrow()
    }
}

/**
 * Number of entries in each of the LUTs for the nth image band
 */
impl Nitf_BandInfo {
    pub fn num_lut_entries(&self) -> Ref<'_, String> {
        self.num_lut_entries.borrow()
    }
}
impl Nitf_BandInfo {
    pub fn luts(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.luts.borrow()
    }
}
impl Nitf_BandInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_Clasnfo {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    security_class: RefCell<String>,
    security_system: RefCell<String>,
    codewords: RefCell<String>,
    control_and_handling: RefCell<String>,
    releaseability: RefCell<String>,
    declass_type: RefCell<String>,
    declass_date: RefCell<String>,
    declass_exemption: RefCell<String>,
    downgrade: RefCell<String>,
    downgrade_date: RefCell<String>,
    class_text: RefCell<String>,
    class_authority_type: RefCell<String>,
    class_authority: RefCell<String>,
    class_reason: RefCell<String>,
    source_date: RefCell<String>,
    control_number: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Nitf_Clasnfo {
    type Root = Nitf;
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
        *self_rc.security_class.borrow_mut() = bytes_to_str(&_io.read_bytes(1 as usize)?.into(), "UTF-8")?;
        *self_rc.security_system.borrow_mut() = bytes_to_str(&_io.read_bytes(2 as usize)?.into(), "UTF-8")?;
        *self_rc.codewords.borrow_mut() = bytes_to_str(&_io.read_bytes(11 as usize)?.into(), "UTF-8")?;
        *self_rc.control_and_handling.borrow_mut() = bytes_to_str(&_io.read_bytes(2 as usize)?.into(), "UTF-8")?;
        *self_rc.releaseability.borrow_mut() = bytes_to_str(&_io.read_bytes(20 as usize)?.into(), "UTF-8")?;
        *self_rc.declass_type.borrow_mut() = bytes_to_str(&_io.read_bytes(2 as usize)?.into(), "UTF-8")?;
        *self_rc.declass_date.borrow_mut() = bytes_to_str(&_io.read_bytes(8 as usize)?.into(), "UTF-8")?;
        *self_rc.declass_exemption.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "UTF-8")?;
        *self_rc.downgrade.borrow_mut() = bytes_to_str(&_io.read_bytes(1 as usize)?.into(), "UTF-8")?;
        *self_rc.downgrade_date.borrow_mut() = bytes_to_str(&_io.read_bytes(8 as usize)?.into(), "UTF-8")?;
        *self_rc.class_text.borrow_mut() = bytes_to_str(&_io.read_bytes(43 as usize)?.into(), "UTF-8")?;
        *self_rc.class_authority_type.borrow_mut() = bytes_to_str(&_io.read_bytes(1 as usize)?.into(), "UTF-8")?;
        *self_rc.class_authority.borrow_mut() = bytes_to_str(&_io.read_bytes(40 as usize)?.into(), "UTF-8")?;
        *self_rc.class_reason.borrow_mut() = bytes_to_str(&_io.read_bytes(1 as usize)?.into(), "UTF-8")?;
        *self_rc.source_date.borrow_mut() = bytes_to_str(&_io.read_bytes(8 as usize)?.into(), "UTF-8")?;
        *self_rc.control_number.borrow_mut() = bytes_to_str(&_io.read_bytes(15 as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Nitf_Clasnfo {
}
impl Nitf_Clasnfo {
    pub fn security_class(&self) -> Ref<'_, String> {
        self.security_class.borrow()
    }
}
impl Nitf_Clasnfo {
    pub fn security_system(&self) -> Ref<'_, String> {
        self.security_system.borrow()
    }
}
impl Nitf_Clasnfo {
    pub fn codewords(&self) -> Ref<'_, String> {
        self.codewords.borrow()
    }
}
impl Nitf_Clasnfo {
    pub fn control_and_handling(&self) -> Ref<'_, String> {
        self.control_and_handling.borrow()
    }
}
impl Nitf_Clasnfo {
    pub fn releaseability(&self) -> Ref<'_, String> {
        self.releaseability.borrow()
    }
}
impl Nitf_Clasnfo {
    pub fn declass_type(&self) -> Ref<'_, String> {
        self.declass_type.borrow()
    }
}
impl Nitf_Clasnfo {
    pub fn declass_date(&self) -> Ref<'_, String> {
        self.declass_date.borrow()
    }
}
impl Nitf_Clasnfo {
    pub fn declass_exemption(&self) -> Ref<'_, String> {
        self.declass_exemption.borrow()
    }
}
impl Nitf_Clasnfo {
    pub fn downgrade(&self) -> Ref<'_, String> {
        self.downgrade.borrow()
    }
}
impl Nitf_Clasnfo {
    pub fn downgrade_date(&self) -> Ref<'_, String> {
        self.downgrade_date.borrow()
    }
}
impl Nitf_Clasnfo {
    pub fn class_text(&self) -> Ref<'_, String> {
        self.class_text.borrow()
    }
}
impl Nitf_Clasnfo {
    pub fn class_authority_type(&self) -> Ref<'_, String> {
        self.class_authority_type.borrow()
    }
}
impl Nitf_Clasnfo {
    pub fn class_authority(&self) -> Ref<'_, String> {
        self.class_authority.borrow()
    }
}
impl Nitf_Clasnfo {
    pub fn class_reason(&self) -> Ref<'_, String> {
        self.class_reason.borrow()
    }
}
impl Nitf_Clasnfo {
    pub fn source_date(&self) -> Ref<'_, String> {
        self.source_date.borrow()
    }
}
impl Nitf_Clasnfo {
    pub fn control_number(&self) -> Ref<'_, String> {
        self.control_number.borrow()
    }
}
impl Nitf_Clasnfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_DataExtensionSegment {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<Nitf>,
    pub _self: SharedType<Self>,
    idx: RefCell<u16>,
    data_sub_header: RefCell<OptRc<Nitf_DataSubHeader>>,
    data_data_field: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    data_sub_header_raw: RefCell<Vec<u8>>,
}
impl KStruct for Nitf_DataExtensionSegment {
    type Root = Nitf;
    type Parent = Nitf;

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
        *self_rc.data_sub_header_raw.borrow_mut() = _io.read_bytes(*_prc.as_ref().unwrap().header().ldnfo()[*self_rc.idx() as usize].length_data_extension_subheader().parse::<i32>().map_err(|_| KError::CastError)? as usize)?.into();
        let data_sub_header_raw = self_rc.data_sub_header_raw.borrow();
        let _t_data_sub_header_raw_io = BytesReader::from(data_sub_header_raw.clone());
        let t = Self::read_into::<BytesReader, Nitf_DataSubHeader>(&_t_data_sub_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.data_sub_header.borrow_mut() = t;
        *self_rc.data_data_field.borrow_mut() = _io.read_bytes(*_prc.as_ref().unwrap().header().ldnfo()[*self_rc.idx() as usize].length_data_extension_segment().parse::<i32>().map_err(|_| KError::CastError)? as usize)?.into();
        Ok(())
    }
}
impl Nitf_DataExtensionSegment {
    pub fn idx(&self) -> Ref<'_, u16> {
        self.idx.borrow()
    }
}
impl Nitf_DataExtensionSegment {
    pub fn set_params(&mut self, idx: u16) {
        *self.idx.borrow_mut() = idx;
    }
}
impl Nitf_DataExtensionSegment {
}
impl Nitf_DataExtensionSegment {
    pub fn data_sub_header(&self) -> Ref<'_, OptRc<Nitf_DataSubHeader>> {
        self.data_sub_header.borrow()
    }
}
impl Nitf_DataExtensionSegment {
    pub fn data_data_field(&self) -> Ref<'_, Vec<u8>> {
        self.data_data_field.borrow()
    }
}
impl Nitf_DataExtensionSegment {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Nitf_DataExtensionSegment {
    pub fn data_sub_header_raw(&self) -> Ref<'_, Vec<u8>> {
        self.data_sub_header_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_DataSubHeader {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<Nitf_DataExtensionSegment>,
    pub _self: SharedType<Self>,
    des_base: RefCell<OptRc<Nitf_DataSubHeaderBase>>,
    overflowed_header_type: RefCell<String>,
    data_item_overflowed: RefCell<String>,
    des_defined_subheader_fields_len: RefCell<String>,
    desshf: RefCell<String>,
    des_defined_data_field: RefCell<String>,
    _io: RefCell<BytesReader>,
    f_tre_ofl: Cell<bool>,
    tre_ofl: RefCell<bool>,
}
impl KStruct for Nitf_DataSubHeader {
    type Root = Nitf;
    type Parent = Nitf_DataExtensionSegment;

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
        let t = Self::read_into::<_, Nitf_DataSubHeaderBase>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.des_base.borrow_mut() = t;
        if *self_rc.tre_ofl()? {
            *self_rc.overflowed_header_type.borrow_mut() = bytes_to_str(&_io.read_bytes(6 as usize)?.into(), "UTF-8")?;
        }
        if *self_rc.tre_ofl()? {
            *self_rc.data_item_overflowed.borrow_mut() = bytes_to_str(&_io.read_bytes(3 as usize)?.into(), "UTF-8")?;
        }
        *self_rc.des_defined_subheader_fields_len.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "UTF-8")?;
        *self_rc.desshf.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.des_defined_subheader_fields_len().parse::<i32>().map_err(|_| KError::CastError)? as usize)?.into(), "UTF-8")?;
        *self_rc.des_defined_data_field.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Nitf_DataSubHeader {
    pub fn tre_ofl(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_tre_ofl.get() {
            return Ok(self.tre_ofl.borrow());
        }
        self.f_tre_ofl.set(true);
        *self.tre_ofl.borrow_mut() = (*self.des_base().desid() == "TRE_OVERFLOW".to_string()) as bool;
        Ok(self.tre_ofl.borrow())
    }
}
impl Nitf_DataSubHeader {
    pub fn des_base(&self) -> Ref<'_, OptRc<Nitf_DataSubHeaderBase>> {
        self.des_base.borrow()
    }
}
impl Nitf_DataSubHeader {
    pub fn overflowed_header_type(&self) -> Ref<'_, String> {
        self.overflowed_header_type.borrow()
    }
}
impl Nitf_DataSubHeader {
    pub fn data_item_overflowed(&self) -> Ref<'_, String> {
        self.data_item_overflowed.borrow()
    }
}
impl Nitf_DataSubHeader {
    pub fn des_defined_subheader_fields_len(&self) -> Ref<'_, String> {
        self.des_defined_subheader_fields_len.borrow()
    }
}
impl Nitf_DataSubHeader {
    pub fn desshf(&self) -> Ref<'_, String> {
        self.desshf.borrow()
    }
}
impl Nitf_DataSubHeader {
    pub fn des_defined_data_field(&self) -> Ref<'_, String> {
        self.des_defined_data_field.borrow()
    }
}
impl Nitf_DataSubHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_DataSubHeaderBase {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    file_part_type_de: RefCell<Vec<u8>>,
    desid: RefCell<String>,
    data_definition_version: RefCell<String>,
    declasnfo: RefCell<OptRc<Nitf_Clasnfo>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Nitf_DataSubHeaderBase {
    type Root = Nitf;
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
        *self_rc.file_part_type_de.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.file_part_type_de() == vec![0x44u8, 0x45u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/data_sub_header_base/seq/0".to_string() }));
        }
        *self_rc.desid.borrow_mut() = bytes_to_str(&_io.read_bytes(25 as usize)?.into(), "UTF-8")?;
        *self_rc.data_definition_version.borrow_mut() = bytes_to_str(&_io.read_bytes(2 as usize)?.into(), "UTF-8")?;
        let t = Self::read_into::<_, Nitf_Clasnfo>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.declasnfo.borrow_mut() = t;
        Ok(())
    }
}
impl Nitf_DataSubHeaderBase {
}

/**
 * File Part Type desigantor for Data Extension
 */
impl Nitf_DataSubHeaderBase {
    pub fn file_part_type_de(&self) -> Ref<'_, Vec<u8>> {
        self.file_part_type_de.borrow()
    }
}
impl Nitf_DataSubHeaderBase {
    pub fn desid(&self) -> Ref<'_, String> {
        self.desid.borrow()
    }
}
impl Nitf_DataSubHeaderBase {
    pub fn data_definition_version(&self) -> Ref<'_, String> {
        self.data_definition_version.borrow()
    }
}
impl Nitf_DataSubHeaderBase {
    pub fn declasnfo(&self) -> Ref<'_, OptRc<Nitf_Clasnfo>> {
        self.declasnfo.borrow()
    }
}
impl Nitf_DataSubHeaderBase {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Streaming file Header Data Extension Segment Subheader
 */

#[derive(Default, Debug, Clone)]
pub struct Nitf_DataSubHeaderStreaming {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    des_base: RefCell<OptRc<Nitf_DataSubHeaderBase>>,
    des_defined_subheader_fields_len: RefCell<String>,
    sfh_l1: RefCell<String>,
    sfh_delim1: RefCell<u32>,
    sfh_dr: RefCell<Vec<u8>>,
    sfh_delim2: RefCell<u32>,
    sfh_l2: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Nitf_DataSubHeaderStreaming {
    type Root = Nitf;
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
        let t = Self::read_into::<_, Nitf_DataSubHeaderBase>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.des_base.borrow_mut() = t;
        *self_rc.des_defined_subheader_fields_len.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "UTF-8")?;
        *self_rc.sfh_l1.borrow_mut() = bytes_to_str(&_io.read_bytes(7 as usize)?.into(), "UTF-8")?;
        *self_rc.sfh_delim1.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.sfh_dr.borrow_mut() = Vec::new();
        let l_sfh_dr = *self_rc.sfh_l1().parse::<i32>().map_err(|_| KError::CastError)?;
        for _i in 0..l_sfh_dr {
            self_rc.sfh_dr.borrow_mut().push(_io.read_u1()?.into());
        }
        *self_rc.sfh_delim2.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.sfh_l2.borrow_mut() = bytes_to_str(&_io.read_bytes(7 as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Nitf_DataSubHeaderStreaming {
}
impl Nitf_DataSubHeaderStreaming {
    pub fn des_base(&self) -> Ref<'_, OptRc<Nitf_DataSubHeaderBase>> {
        self.des_base.borrow()
    }
}
impl Nitf_DataSubHeaderStreaming {
    pub fn des_defined_subheader_fields_len(&self) -> Ref<'_, String> {
        self.des_defined_subheader_fields_len.borrow()
    }
}

/**
 * SFH Length 1: number of bytes in sfh_dr field
 */
impl Nitf_DataSubHeaderStreaming {
    pub fn sfh_l1(&self) -> Ref<'_, String> {
        self.sfh_l1.borrow()
    }
}

/**
 * Shall contain the value 0x0A6E1D97.
 */
impl Nitf_DataSubHeaderStreaming {
    pub fn sfh_delim1(&self) -> Ref<'_, u32> {
        self.sfh_delim1.borrow()
    }
}
impl Nitf_DataSubHeaderStreaming {
    pub fn sfh_dr(&self) -> Ref<'_, Vec<u8>> {
        self.sfh_dr.borrow()
    }
}

/**
 * Shall contain the value 0x0ECA14BF.
 */
impl Nitf_DataSubHeaderStreaming {
    pub fn sfh_delim2(&self) -> Ref<'_, u32> {
        self.sfh_delim2.borrow()
    }
}

/**
 * A repeat of sfh_l1.
 */
impl Nitf_DataSubHeaderStreaming {
    pub fn sfh_l2(&self) -> Ref<'_, String> {
        self.sfh_l2.borrow()
    }
}
impl Nitf_DataSubHeaderStreaming {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_DataSubHeaderTre {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    des_base: RefCell<OptRc<Nitf_DataSubHeaderBase>>,
    overflowed_header_type: RefCell<String>,
    data_item_overflowed: RefCell<String>,
    des_defined_subheader_fields_len: RefCell<String>,
    des_defined_data_field: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Nitf_DataSubHeaderTre {
    type Root = Nitf;
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
        let t = Self::read_into::<_, Nitf_DataSubHeaderBase>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.des_base.borrow_mut() = t;
        if *self_rc.des_base().desid() == "TRE_OVERFLOW".to_string() {
            *self_rc.overflowed_header_type.borrow_mut() = bytes_to_str(&_io.read_bytes(6 as usize)?.into(), "UTF-8")?;
        }
        if *self_rc.des_base().desid() == "TRE_OVERFLOW".to_string() {
            *self_rc.data_item_overflowed.borrow_mut() = bytes_to_str(&_io.read_bytes(3 as usize)?.into(), "UTF-8")?;
        }
        *self_rc.des_defined_subheader_fields_len.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "UTF-8")?;
        *self_rc.des_defined_data_field.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.des_defined_subheader_fields_len().parse::<i32>().map_err(|_| KError::CastError)? as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Nitf_DataSubHeaderTre {
}
impl Nitf_DataSubHeaderTre {
    pub fn des_base(&self) -> Ref<'_, OptRc<Nitf_DataSubHeaderBase>> {
        self.des_base.borrow()
    }
}
impl Nitf_DataSubHeaderTre {
    pub fn overflowed_header_type(&self) -> Ref<'_, String> {
        self.overflowed_header_type.borrow()
    }
}
impl Nitf_DataSubHeaderTre {
    pub fn data_item_overflowed(&self) -> Ref<'_, String> {
        self.data_item_overflowed.borrow()
    }
}
impl Nitf_DataSubHeaderTre {
    pub fn des_defined_subheader_fields_len(&self) -> Ref<'_, String> {
        self.des_defined_subheader_fields_len.borrow()
    }
}
impl Nitf_DataSubHeaderTre {
    pub fn des_defined_data_field(&self) -> Ref<'_, String> {
        self.des_defined_data_field.borrow()
    }
}
impl Nitf_DataSubHeaderTre {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_DateTime {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    unnamed0: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Nitf_DateTime {
    type Root = Nitf;
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
        *self_rc.unnamed0.borrow_mut() = bytes_to_str(&_io.read_bytes(14 as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Nitf_DateTime {
}

/**
 * UTC time of image acquisition in the format CCYYMMDDhhmmss: CC century, YY last two digits of the year, MM month, DD day, hh hour, mm minute, ss second
 */
impl Nitf_DateTime {
    pub fn unnamed0(&self) -> Ref<'_, String> {
        self.unnamed0.borrow()
    }
}
impl Nitf_DateTime {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_Encrypt {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    unnamed0: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Nitf_Encrypt {
    type Root = Nitf;
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
        *self_rc.unnamed0.borrow_mut() = bytes_to_str(&_io.read_bytes(1 as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Nitf_Encrypt {
}
impl Nitf_Encrypt {
    pub fn unnamed0(&self) -> Ref<'_, String> {
        self.unnamed0.borrow()
    }
}
impl Nitf_Encrypt {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_GraphicSubHeader {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<Nitf_GraphicsSegment>,
    pub _self: SharedType<Self>,
    file_part_type_sy: RefCell<Vec<u8>>,
    graphic_id: RefCell<String>,
    graphic_name: RefCell<String>,
    graphic_classification: RefCell<OptRc<Nitf_Clasnfo>>,
    encryption: RefCell<OptRc<Nitf_Encrypt>>,
    graphic_type: RefCell<Vec<u8>>,
    reserved1: RefCell<String>,
    graphic_display_level: RefCell<String>,
    graphic_attachment_level: RefCell<String>,
    graphic_location: RefCell<String>,
    first_graphic_bound_loc: RefCell<String>,
    graphic_color: RefCell<String>,
    second_graphic_bound_loc: RefCell<String>,
    reserved2: RefCell<String>,
    graphics_extended_sub_header: RefCell<OptRc<Nitf_TreHeader>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Nitf_GraphicSubHeader {
    type Root = Nitf;
    type Parent = Nitf_GraphicsSegment;

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
        *self_rc.file_part_type_sy.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.file_part_type_sy() == vec![0x53u8, 0x59u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/graphic_sub_header/seq/0".to_string() }));
        }
        *self_rc.graphic_id.borrow_mut() = bytes_to_str(&_io.read_bytes(10 as usize)?.into(), "UTF-8")?;
        *self_rc.graphic_name.borrow_mut() = bytes_to_str(&_io.read_bytes(20 as usize)?.into(), "UTF-8")?;
        let t = Self::read_into::<_, Nitf_Clasnfo>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.graphic_classification.borrow_mut() = t;
        let t = Self::read_into::<_, Nitf_Encrypt>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.encryption.borrow_mut() = t;
        *self_rc.graphic_type.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.graphic_type() == vec![0x43u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/graphic_sub_header/seq/5".to_string() }));
        }
        *self_rc.reserved1.borrow_mut() = bytes_to_str(&_io.read_bytes(13 as usize)?.into(), "UTF-8")?;
        *self_rc.graphic_display_level.borrow_mut() = bytes_to_str(&_io.read_bytes(3 as usize)?.into(), "UTF-8")?;
        *self_rc.graphic_attachment_level.borrow_mut() = bytes_to_str(&_io.read_bytes(3 as usize)?.into(), "UTF-8")?;
        *self_rc.graphic_location.borrow_mut() = bytes_to_str(&_io.read_bytes(10 as usize)?.into(), "UTF-8")?;
        *self_rc.first_graphic_bound_loc.borrow_mut() = bytes_to_str(&_io.read_bytes(10 as usize)?.into(), "UTF-8")?;
        *self_rc.graphic_color.borrow_mut() = bytes_to_str(&_io.read_bytes(1 as usize)?.into(), "UTF-8")?;
        *self_rc.second_graphic_bound_loc.borrow_mut() = bytes_to_str(&_io.read_bytes(10 as usize)?.into(), "UTF-8")?;
        *self_rc.reserved2.borrow_mut() = bytes_to_str(&_io.read_bytes(2 as usize)?.into(), "UTF-8")?;
        let t = Self::read_into::<_, Nitf_TreHeader>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.graphics_extended_sub_header.borrow_mut() = t;
        Ok(())
    }
}
impl Nitf_GraphicSubHeader {
}
impl Nitf_GraphicSubHeader {
    pub fn file_part_type_sy(&self) -> Ref<'_, Vec<u8>> {
        self.file_part_type_sy.borrow()
    }
}
impl Nitf_GraphicSubHeader {
    pub fn graphic_id(&self) -> Ref<'_, String> {
        self.graphic_id.borrow()
    }
}
impl Nitf_GraphicSubHeader {
    pub fn graphic_name(&self) -> Ref<'_, String> {
        self.graphic_name.borrow()
    }
}
impl Nitf_GraphicSubHeader {
    pub fn graphic_classification(&self) -> Ref<'_, OptRc<Nitf_Clasnfo>> {
        self.graphic_classification.borrow()
    }
}
impl Nitf_GraphicSubHeader {
    pub fn encryption(&self) -> Ref<'_, OptRc<Nitf_Encrypt>> {
        self.encryption.borrow()
    }
}
impl Nitf_GraphicSubHeader {
    pub fn graphic_type(&self) -> Ref<'_, Vec<u8>> {
        self.graphic_type.borrow()
    }
}

/**
 * Reserved
 */
impl Nitf_GraphicSubHeader {
    pub fn reserved1(&self) -> Ref<'_, String> {
        self.reserved1.borrow()
    }
}
impl Nitf_GraphicSubHeader {
    pub fn graphic_display_level(&self) -> Ref<'_, String> {
        self.graphic_display_level.borrow()
    }
}
impl Nitf_GraphicSubHeader {
    pub fn graphic_attachment_level(&self) -> Ref<'_, String> {
        self.graphic_attachment_level.borrow()
    }
}
impl Nitf_GraphicSubHeader {
    pub fn graphic_location(&self) -> Ref<'_, String> {
        self.graphic_location.borrow()
    }
}
impl Nitf_GraphicSubHeader {
    pub fn first_graphic_bound_loc(&self) -> Ref<'_, String> {
        self.first_graphic_bound_loc.borrow()
    }
}
impl Nitf_GraphicSubHeader {
    pub fn graphic_color(&self) -> Ref<'_, String> {
        self.graphic_color.borrow()
    }
}
impl Nitf_GraphicSubHeader {
    pub fn second_graphic_bound_loc(&self) -> Ref<'_, String> {
        self.second_graphic_bound_loc.borrow()
    }
}

/**
 * Reserved
 */
impl Nitf_GraphicSubHeader {
    pub fn reserved2(&self) -> Ref<'_, String> {
        self.reserved2.borrow()
    }
}
impl Nitf_GraphicSubHeader {
    pub fn graphics_extended_sub_header(&self) -> Ref<'_, OptRc<Nitf_TreHeader>> {
        self.graphics_extended_sub_header.borrow()
    }
}
impl Nitf_GraphicSubHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_GraphicsSegment {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<Nitf>,
    pub _self: SharedType<Self>,
    idx: RefCell<u16>,
    graphic_sub_header: RefCell<OptRc<Nitf_GraphicSubHeader>>,
    graphic_data_field: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Nitf_GraphicsSegment {
    type Root = Nitf;
    type Parent = Nitf;

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
        let t = Self::read_into::<_, Nitf_GraphicSubHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.graphic_sub_header.borrow_mut() = t;
        *self_rc.graphic_data_field.borrow_mut() = _io.read_bytes(*_prc.as_ref().unwrap().header().lnnfo()[*self_rc.idx() as usize].length_graphic_segment().parse::<i32>().map_err(|_| KError::CastError)? as usize)?.into();
        Ok(())
    }
}
impl Nitf_GraphicsSegment {
    pub fn idx(&self) -> Ref<'_, u16> {
        self.idx.borrow()
    }
}
impl Nitf_GraphicsSegment {
    pub fn set_params(&mut self, idx: u16) {
        *self.idx.borrow_mut() = idx;
    }
}
impl Nitf_GraphicsSegment {
}
impl Nitf_GraphicsSegment {
    pub fn graphic_sub_header(&self) -> Ref<'_, OptRc<Nitf_GraphicSubHeader>> {
        self.graphic_sub_header.borrow()
    }
}
impl Nitf_GraphicsSegment {
    pub fn graphic_data_field(&self) -> Ref<'_, Vec<u8>> {
        self.graphic_data_field.borrow()
    }
}
impl Nitf_GraphicsSegment {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_Header {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<Nitf>,
    pub _self: SharedType<Self>,
    file_profile_name: RefCell<Vec<u8>>,
    file_version: RefCell<Vec<u8>>,
    complexity_level: RefCell<Vec<u8>>,
    standard_type: RefCell<Vec<u8>>,
    originating_station_id: RefCell<String>,
    file_date_time: RefCell<OptRc<Nitf_DateTime>>,
    file_title: RefCell<String>,
    file_security: RefCell<OptRc<Nitf_Clasnfo>>,
    file_copy_number: RefCell<String>,
    file_num_of_copys: RefCell<String>,
    encryption: RefCell<OptRc<Nitf_Encrypt>>,
    file_bg_color: RefCell<Vec<u8>>,
    originator_name: RefCell<String>,
    originator_phone: RefCell<String>,
    file_length: RefCell<String>,
    file_header_length: RefCell<String>,
    num_image_segments: RefCell<String>,
    linfo: RefCell<Vec<OptRc<Nitf_LengthImageInfo>>>,
    num_graphics_segments: RefCell<String>,
    lnnfo: RefCell<Vec<OptRc<Nitf_LengthGraphicInfo>>>,
    reserved_numx: RefCell<String>,
    num_text_files: RefCell<String>,
    ltnfo: RefCell<Vec<OptRc<Nitf_LengthTextInfo>>>,
    num_data_extension: RefCell<String>,
    ldnfo: RefCell<Vec<OptRc<Nitf_LengthDataInfo>>>,
    num_reserved_extension: RefCell<String>,
    lrnfo: RefCell<Vec<OptRc<Nitf_LengthReservedInfo>>>,
    user_defined_header: RefCell<OptRc<Nitf_TreHeader>>,
    extended_header: RefCell<OptRc<Nitf_TreHeader>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Nitf_Header {
    type Root = Nitf;
    type Parent = Nitf;

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
        *self_rc.file_profile_name.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.file_profile_name() == vec![0x4eu8, 0x49u8, 0x54u8, 0x46u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/seq/0".to_string() }));
        }
        *self_rc.file_version.borrow_mut() = _io.read_bytes(5 as usize)?.into();
        if !(*self_rc.file_version() == vec![0x30u8, 0x32u8, 0x2eu8, 0x31u8, 0x30u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/seq/1".to_string() }));
        }
        *self_rc.complexity_level.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        *self_rc.standard_type.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.standard_type() == vec![0x42u8, 0x46u8, 0x30u8, 0x31u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/seq/3".to_string() }));
        }
        *self_rc.originating_station_id.borrow_mut() = bytes_to_str(&_io.read_bytes(10 as usize)?.into(), "UTF-8")?;
        let t = Self::read_into::<_, Nitf_DateTime>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.file_date_time.borrow_mut() = t;
        *self_rc.file_title.borrow_mut() = bytes_to_str(&_io.read_bytes(80 as usize)?.into(), "UTF-8")?;
        let t = Self::read_into::<_, Nitf_Clasnfo>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.file_security.borrow_mut() = t;
        *self_rc.file_copy_number.borrow_mut() = bytes_to_str(&_io.read_bytes(5 as usize)?.into(), "UTF-8")?;
        *self_rc.file_num_of_copys.borrow_mut() = bytes_to_str(&_io.read_bytes(5 as usize)?.into(), "UTF-8")?;
        let t = Self::read_into::<_, Nitf_Encrypt>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.encryption.borrow_mut() = t;
        *self_rc.file_bg_color.borrow_mut() = _io.read_bytes(3 as usize)?.into();
        *self_rc.originator_name.borrow_mut() = bytes_to_str(&_io.read_bytes(24 as usize)?.into(), "UTF-8")?;
        *self_rc.originator_phone.borrow_mut() = bytes_to_str(&_io.read_bytes(18 as usize)?.into(), "UTF-8")?;
        *self_rc.file_length.borrow_mut() = bytes_to_str(&_io.read_bytes(12 as usize)?.into(), "UTF-8")?;
        *self_rc.file_header_length.borrow_mut() = bytes_to_str(&_io.read_bytes(6 as usize)?.into(), "UTF-8")?;
        *self_rc.num_image_segments.borrow_mut() = bytes_to_str(&_io.read_bytes(3 as usize)?.into(), "UTF-8")?;
        *self_rc.linfo.borrow_mut() = Vec::new();
        let l_linfo = *self_rc.num_image_segments().parse::<i32>().map_err(|_| KError::CastError)?;
        for _i in 0..l_linfo {
            let t = Self::read_into::<_, Nitf_LengthImageInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.linfo.borrow_mut().push(t);
        }
        *self_rc.num_graphics_segments.borrow_mut() = bytes_to_str(&_io.read_bytes(3 as usize)?.into(), "UTF-8")?;
        *self_rc.lnnfo.borrow_mut() = Vec::new();
        let l_lnnfo = *self_rc.num_graphics_segments().parse::<i32>().map_err(|_| KError::CastError)?;
        for _i in 0..l_lnnfo {
            let t = Self::read_into::<_, Nitf_LengthGraphicInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.lnnfo.borrow_mut().push(t);
        }
        *self_rc.reserved_numx.borrow_mut() = bytes_to_str(&_io.read_bytes(3 as usize)?.into(), "UTF-8")?;
        *self_rc.num_text_files.borrow_mut() = bytes_to_str(&_io.read_bytes(3 as usize)?.into(), "UTF-8")?;
        *self_rc.ltnfo.borrow_mut() = Vec::new();
        let l_ltnfo = *self_rc.num_text_files().parse::<i32>().map_err(|_| KError::CastError)?;
        for _i in 0..l_ltnfo {
            let t = Self::read_into::<_, Nitf_LengthTextInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.ltnfo.borrow_mut().push(t);
        }
        *self_rc.num_data_extension.borrow_mut() = bytes_to_str(&_io.read_bytes(3 as usize)?.into(), "UTF-8")?;
        *self_rc.ldnfo.borrow_mut() = Vec::new();
        let l_ldnfo = *self_rc.num_data_extension().parse::<i32>().map_err(|_| KError::CastError)?;
        for _i in 0..l_ldnfo {
            let t = Self::read_into::<_, Nitf_LengthDataInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.ldnfo.borrow_mut().push(t);
        }
        *self_rc.num_reserved_extension.borrow_mut() = bytes_to_str(&_io.read_bytes(3 as usize)?.into(), "UTF-8")?;
        *self_rc.lrnfo.borrow_mut() = Vec::new();
        let l_lrnfo = *self_rc.num_reserved_extension().parse::<i32>().map_err(|_| KError::CastError)?;
        for _i in 0..l_lrnfo {
            let t = Self::read_into::<_, Nitf_LengthReservedInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.lrnfo.borrow_mut().push(t);
        }
        let t = Self::read_into::<_, Nitf_TreHeader>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.user_defined_header.borrow_mut() = t;
        let t = Self::read_into::<_, Nitf_TreHeader>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.extended_header.borrow_mut() = t;
        Ok(())
    }
}
impl Nitf_Header {
}
impl Nitf_Header {
    pub fn file_profile_name(&self) -> Ref<'_, Vec<u8>> {
        self.file_profile_name.borrow()
    }
}
impl Nitf_Header {
    pub fn file_version(&self) -> Ref<'_, Vec<u8>> {
        self.file_version.borrow()
    }
}
impl Nitf_Header {
    pub fn complexity_level(&self) -> Ref<'_, Vec<u8>> {
        self.complexity_level.borrow()
    }
}

/**
 * Value of BF01 indicates the file is formatted using ISO/IEC IS 12087-5.
 */
impl Nitf_Header {
    pub fn standard_type(&self) -> Ref<'_, Vec<u8>> {
        self.standard_type.borrow()
    }
}
impl Nitf_Header {
    pub fn originating_station_id(&self) -> Ref<'_, String> {
        self.originating_station_id.borrow()
    }
}
impl Nitf_Header {
    pub fn file_date_time(&self) -> Ref<'_, OptRc<Nitf_DateTime>> {
        self.file_date_time.borrow()
    }
}
impl Nitf_Header {
    pub fn file_title(&self) -> Ref<'_, String> {
        self.file_title.borrow()
    }
}
impl Nitf_Header {
    pub fn file_security(&self) -> Ref<'_, OptRc<Nitf_Clasnfo>> {
        self.file_security.borrow()
    }
}
impl Nitf_Header {
    pub fn file_copy_number(&self) -> Ref<'_, String> {
        self.file_copy_number.borrow()
    }
}
impl Nitf_Header {
    pub fn file_num_of_copys(&self) -> Ref<'_, String> {
        self.file_num_of_copys.borrow()
    }
}
impl Nitf_Header {
    pub fn encryption(&self) -> Ref<'_, OptRc<Nitf_Encrypt>> {
        self.encryption.borrow()
    }
}
impl Nitf_Header {
    pub fn file_bg_color(&self) -> Ref<'_, Vec<u8>> {
        self.file_bg_color.borrow()
    }
}
impl Nitf_Header {
    pub fn originator_name(&self) -> Ref<'_, String> {
        self.originator_name.borrow()
    }
}
impl Nitf_Header {
    pub fn originator_phone(&self) -> Ref<'_, String> {
        self.originator_phone.borrow()
    }
}
impl Nitf_Header {
    pub fn file_length(&self) -> Ref<'_, String> {
        self.file_length.borrow()
    }
}
impl Nitf_Header {
    pub fn file_header_length(&self) -> Ref<'_, String> {
        self.file_header_length.borrow()
    }
}
impl Nitf_Header {
    pub fn num_image_segments(&self) -> Ref<'_, String> {
        self.num_image_segments.borrow()
    }
}
impl Nitf_Header {
    pub fn linfo(&self) -> Ref<'_, Vec<OptRc<Nitf_LengthImageInfo>>> {
        self.linfo.borrow()
    }
}
impl Nitf_Header {
    pub fn num_graphics_segments(&self) -> Ref<'_, String> {
        self.num_graphics_segments.borrow()
    }
}
impl Nitf_Header {
    pub fn lnnfo(&self) -> Ref<'_, Vec<OptRc<Nitf_LengthGraphicInfo>>> {
        self.lnnfo.borrow()
    }
}
impl Nitf_Header {
    pub fn reserved_numx(&self) -> Ref<'_, String> {
        self.reserved_numx.borrow()
    }
}
impl Nitf_Header {
    pub fn num_text_files(&self) -> Ref<'_, String> {
        self.num_text_files.borrow()
    }
}
impl Nitf_Header {
    pub fn ltnfo(&self) -> Ref<'_, Vec<OptRc<Nitf_LengthTextInfo>>> {
        self.ltnfo.borrow()
    }
}
impl Nitf_Header {
    pub fn num_data_extension(&self) -> Ref<'_, String> {
        self.num_data_extension.borrow()
    }
}
impl Nitf_Header {
    pub fn ldnfo(&self) -> Ref<'_, Vec<OptRc<Nitf_LengthDataInfo>>> {
        self.ldnfo.borrow()
    }
}
impl Nitf_Header {
    pub fn num_reserved_extension(&self) -> Ref<'_, String> {
        self.num_reserved_extension.borrow()
    }
}
impl Nitf_Header {
    pub fn lrnfo(&self) -> Ref<'_, Vec<OptRc<Nitf_LengthReservedInfo>>> {
        self.lrnfo.borrow()
    }
}
impl Nitf_Header {
    pub fn user_defined_header(&self) -> Ref<'_, OptRc<Nitf_TreHeader>> {
        self.user_defined_header.borrow()
    }
}
impl Nitf_Header {
    pub fn extended_header(&self) -> Ref<'_, OptRc<Nitf_TreHeader>> {
        self.extended_header.borrow()
    }
}
impl Nitf_Header {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_ImageComment {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<Nitf_ImageSubHeader>,
    pub _self: SharedType<Self>,
    unnamed0: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Nitf_ImageComment {
    type Root = Nitf;
    type Parent = Nitf_ImageSubHeader;

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
        *self_rc.unnamed0.borrow_mut() = bytes_to_str(&_io.read_bytes(80 as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Nitf_ImageComment {
}
impl Nitf_ImageComment {
    pub fn unnamed0(&self) -> Ref<'_, String> {
        self.unnamed0.borrow()
    }
}
impl Nitf_ImageComment {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_ImageDataMask {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<Nitf_ImageSegment>,
    pub _self: SharedType<Self>,
    blocked_img_data_offset: RefCell<u32>,
    bmrlnth: RefCell<u16>,
    tmrlnth: RefCell<u16>,
    tpxcdlnth: RefCell<u16>,
    tpxcd: RefCell<Vec<u8>>,
    bmrbnd: RefCell<Vec<u32>>,
    tmrbnd: RefCell<Vec<u32>>,
    _io: RefCell<BytesReader>,
    f_bmrbnd_size: Cell<bool>,
    bmrbnd_size: RefCell<i32>,
    f_bmrtmr_count: Cell<bool>,
    bmrtmr_count: RefCell<i32>,
    f_has_bmr: Cell<bool>,
    has_bmr: RefCell<bool>,
    f_has_tmr: Cell<bool>,
    has_tmr: RefCell<bool>,
    f_tmrbnd_size: Cell<bool>,
    tmrbnd_size: RefCell<i32>,
    f_total_size: Cell<bool>,
    total_size: RefCell<i32>,
    f_tpxcd_size: Cell<bool>,
    tpxcd_size: RefCell<i32>,
}
impl KStruct for Nitf_ImageDataMask {
    type Root = Nitf;
    type Parent = Nitf_ImageSegment;

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
        *self_rc.blocked_img_data_offset.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.bmrlnth.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.tmrlnth.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.tpxcdlnth.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.tpxcd.borrow_mut() = _io.read_bytes(*self_rc.tpxcd_size()? as usize)?.into();
        if *self_rc.has_bmr()? {
            *self_rc.bmrbnd.borrow_mut() = Vec::new();
            let l_bmrbnd = *self_rc.bmrtmr_count()?;
            for _i in 0..l_bmrbnd {
                self_rc.bmrbnd.borrow_mut().push(_io.read_u4be()?.into());
            }
        }
        if *self_rc.has_tmr()? {
            *self_rc.tmrbnd.borrow_mut() = Vec::new();
            let l_tmrbnd = *self_rc.bmrtmr_count()?;
            for _i in 0..l_tmrbnd {
                self_rc.tmrbnd.borrow_mut().push(_io.read_u4be()?.into());
            }
        }
        Ok(())
    }
}
impl Nitf_ImageDataMask {
    pub fn bmrbnd_size(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_bmrbnd_size.get() {
            return Ok(self.bmrbnd_size.borrow());
        }
        self.f_bmrbnd_size.set(true);
        *self.bmrbnd_size.borrow_mut() = (if *self.has_bmr()? { ((*self.bmrtmr_count()? as i32) * (4 as i32)) } else { 0 }) as i32;
        Ok(self.bmrbnd_size.borrow())
    }
    pub fn bmrtmr_count(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_bmrtmr_count.get() {
            return Ok(self.bmrtmr_count.borrow());
        }
        self.f_bmrtmr_count.set(true);
        *self.bmrtmr_count.borrow_mut() = (((((*_prc.as_ref().unwrap().image_sub_header().num_blocks_per_row().parse::<i32>().map_err(|_| KError::CastError)? as i32) * (*_prc.as_ref().unwrap().image_sub_header().num_blocks_per_col().parse::<i32>().map_err(|_| KError::CastError)? as i32)) as i32) * (if *_prc.as_ref().unwrap().image_sub_header().img_mode() != "S".to_string() { 1 } else { if ((*_prc.as_ref().unwrap().image_sub_header().num_bands().parse::<i32>().map_err(|_| KError::CastError)? as i32) != (0 as i32)) { *_prc.as_ref().unwrap().image_sub_header().num_bands().parse::<i32>().map_err(|_| KError::CastError)? } else { *_prc.as_ref().unwrap().image_sub_header().num_multispectral_bands().parse::<i32>().map_err(|_| KError::CastError)? } } as i32))) as i32;
        Ok(self.bmrtmr_count.borrow())
    }
    pub fn has_bmr(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_bmr.get() {
            return Ok(self.has_bmr.borrow());
        }
        self.f_has_bmr.set(true);
        *self.has_bmr.borrow_mut() = (((*self.bmrlnth() as u16) != (0 as u16))) as bool;
        Ok(self.has_bmr.borrow())
    }
    pub fn has_tmr(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_tmr.get() {
            return Ok(self.has_tmr.borrow());
        }
        self.f_has_tmr.set(true);
        *self.has_tmr.borrow_mut() = (((*self.tmrlnth() as u16) != (0 as u16))) as bool;
        Ok(self.has_tmr.borrow())
    }
    pub fn tmrbnd_size(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_tmrbnd_size.get() {
            return Ok(self.tmrbnd_size.borrow());
        }
        self.f_tmrbnd_size.set(true);
        *self.tmrbnd_size.borrow_mut() = (if *self.has_tmr()? { ((*self.bmrtmr_count()? as i32) * (4 as i32)) } else { 0 }) as i32;
        Ok(self.tmrbnd_size.borrow())
    }
    pub fn total_size(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_total_size.get() {
            return Ok(self.total_size.borrow());
        }
        self.f_total_size.set(true);
        *self.total_size.borrow_mut() = ((((((((((((4 + 2) as i32) + (2 as i32)) as i32) + (2 as i32)) as i32) + (*self.tpxcd_size()? as i32)) as i32) + (*self.bmrbnd_size()? as i32)) as i32) + (*self.tmrbnd_size()? as i32))) as i32;
        Ok(self.total_size.borrow())
    }
    pub fn tpxcd_size(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_tpxcd_size.get() {
            return Ok(self.tpxcd_size.borrow());
        }
        self.f_tpxcd_size.set(true);
        *self.tpxcd_size.borrow_mut() = (((if ((((*self.tpxcdlnth() as u16) % (8 as u16)) as i32) == (0 as i32)) { *self.tpxcdlnth() } else { ((*self.tpxcdlnth() as i32) + (((8 as i32) - (((*self.tpxcdlnth() as u16) % (8 as u16)) as i32)) as i32)) } as i32) / (8 as i32))) as i32;
        Ok(self.tpxcd_size.borrow())
    }
}
impl Nitf_ImageDataMask {
    pub fn blocked_img_data_offset(&self) -> Ref<'_, u32> {
        self.blocked_img_data_offset.borrow()
    }
}

/**
 * Block Mask Record Length
 */
impl Nitf_ImageDataMask {
    pub fn bmrlnth(&self) -> Ref<'_, u16> {
        self.bmrlnth.borrow()
    }
}

/**
 * Pad Pixel Mask Record Length
 */
impl Nitf_ImageDataMask {
    pub fn tmrlnth(&self) -> Ref<'_, u16> {
        self.tmrlnth.borrow()
    }
}

/**
 * Pad Output Pixel Code Length
 */
impl Nitf_ImageDataMask {
    pub fn tpxcdlnth(&self) -> Ref<'_, u16> {
        self.tpxcdlnth.borrow()
    }
}

/**
 * Pad Output Pixel Code
 */
impl Nitf_ImageDataMask {
    pub fn tpxcd(&self) -> Ref<'_, Vec<u8>> {
        self.tpxcd.borrow()
    }
}

/**
 * Block n, Band m Offset
 */
impl Nitf_ImageDataMask {
    pub fn bmrbnd(&self) -> Ref<'_, Vec<u32>> {
        self.bmrbnd.borrow()
    }
}

/**
 * Pad Pixel n, Band m
 */
impl Nitf_ImageDataMask {
    pub fn tmrbnd(&self) -> Ref<'_, Vec<u32>> {
        self.tmrbnd.borrow()
    }
}
impl Nitf_ImageDataMask {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_ImageSegment {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<Nitf>,
    pub _self: SharedType<Self>,
    idx: RefCell<u16>,
    image_sub_header: RefCell<OptRc<Nitf_ImageSubHeader>>,
    image_data_mask: RefCell<OptRc<Nitf_ImageDataMask>>,
    image_data_field: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_has_mask: Cell<bool>,
    has_mask: RefCell<bool>,
}
impl KStruct for Nitf_ImageSegment {
    type Root = Nitf;
    type Parent = Nitf;

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
        let t = Self::read_into::<_, Nitf_ImageSubHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.image_sub_header.borrow_mut() = t;
        if *self_rc.has_mask()? {
            let t = Self::read_into::<_, Nitf_ImageDataMask>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.image_data_mask.borrow_mut() = t;
        }
        if *self_rc.has_mask()? {
            *self_rc.image_data_field.borrow_mut() = _io.read_bytes(((*_prc.as_ref().unwrap().header().linfo()[*self_rc.idx() as usize].length_image_segment().parse::<i32>().map_err(|_| KError::CastError)? as i32) - (*self_rc.image_data_mask().total_size()? as i32)) as usize)?.into();
        }
        Ok(())
    }
}
impl Nitf_ImageSegment {
    pub fn idx(&self) -> Ref<'_, u16> {
        self.idx.borrow()
    }
}
impl Nitf_ImageSegment {
    pub fn set_params(&mut self, idx: u16) {
        *self.idx.borrow_mut() = idx;
    }
}
impl Nitf_ImageSegment {
    pub fn has_mask(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_mask.get() {
            return Ok(self.has_mask.borrow());
        }
        self.f_has_mask.set(true);
        *self.has_mask.borrow_mut() = (*self.image_sub_header().img_compression()[0..2] == "MM".to_string()) as bool;
        Ok(self.has_mask.borrow())
    }
}
impl Nitf_ImageSegment {
    pub fn image_sub_header(&self) -> Ref<'_, OptRc<Nitf_ImageSubHeader>> {
        self.image_sub_header.borrow()
    }
}
impl Nitf_ImageSegment {
    pub fn image_data_mask(&self) -> Ref<'_, OptRc<Nitf_ImageDataMask>> {
        self.image_data_mask.borrow()
    }
}
impl Nitf_ImageSegment {
    pub fn image_data_field(&self) -> Ref<'_, Vec<u8>> {
        self.image_data_field.borrow()
    }
}
impl Nitf_ImageSegment {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_ImageSubHeader {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<Nitf_ImageSegment>,
    pub _self: SharedType<Self>,
    file_part_type: RefCell<Vec<u8>>,
    image_id_1: RefCell<String>,
    image_date_time: RefCell<OptRc<Nitf_DateTime>>,
    target_id: RefCell<String>,
    image_id_2: RefCell<String>,
    image_security_classification: RefCell<OptRc<Nitf_Clasnfo>>,
    encryption: RefCell<OptRc<Nitf_Encrypt>>,
    image_source: RefCell<String>,
    num_sig_rows: RefCell<String>,
    num_sig_cols: RefCell<String>,
    pixel_value_type: RefCell<String>,
    image_representation: RefCell<String>,
    image_category: RefCell<String>,
    actual_bits_per_pixel_per_band: RefCell<String>,
    pixel_justification: RefCell<String>,
    image_coordinate_rep: RefCell<String>,
    image_geo_loc: RefCell<String>,
    num_img_comments: RefCell<String>,
    img_comments: RefCell<Vec<OptRc<Nitf_ImageComment>>>,
    img_compression: RefCell<String>,
    compression_rate_code: RefCell<String>,
    num_bands: RefCell<String>,
    num_multispectral_bands: RefCell<String>,
    bands: RefCell<Vec<OptRc<Nitf_BandInfo>>>,
    img_sync_code: RefCell<String>,
    img_mode: RefCell<String>,
    num_blocks_per_row: RefCell<String>,
    num_blocks_per_col: RefCell<String>,
    num_pixels_per_block_horz: RefCell<String>,
    num_pixels_per_block_vert: RefCell<String>,
    num_pixels_per_band: RefCell<String>,
    img_display_level: RefCell<String>,
    attachment_level: RefCell<String>,
    img_location: RefCell<String>,
    img_magnification: RefCell<String>,
    user_def_img_data_len: RefCell<String>,
    user_def_overflow: RefCell<String>,
    user_def_img_data: RefCell<Vec<u8>>,
    image_extended_sub_header: RefCell<OptRc<Nitf_TreHeader>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Nitf_ImageSubHeader {
    type Root = Nitf;
    type Parent = Nitf_ImageSegment;

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
        *self_rc.file_part_type.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.file_part_type() == vec![0x49u8, 0x4du8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/image_sub_header/seq/0".to_string() }));
        }
        *self_rc.image_id_1.borrow_mut() = bytes_to_str(&_io.read_bytes(10 as usize)?.into(), "UTF-8")?;
        let t = Self::read_into::<_, Nitf_DateTime>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.image_date_time.borrow_mut() = t;
        *self_rc.target_id.borrow_mut() = bytes_to_str(&_io.read_bytes(17 as usize)?.into(), "UTF-8")?;
        *self_rc.image_id_2.borrow_mut() = bytes_to_str(&_io.read_bytes(80 as usize)?.into(), "UTF-8")?;
        let t = Self::read_into::<_, Nitf_Clasnfo>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.image_security_classification.borrow_mut() = t;
        let t = Self::read_into::<_, Nitf_Encrypt>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.encryption.borrow_mut() = t;
        *self_rc.image_source.borrow_mut() = bytes_to_str(&_io.read_bytes(42 as usize)?.into(), "UTF-8")?;
        *self_rc.num_sig_rows.borrow_mut() = bytes_to_str(&_io.read_bytes(8 as usize)?.into(), "UTF-8")?;
        *self_rc.num_sig_cols.borrow_mut() = bytes_to_str(&_io.read_bytes(8 as usize)?.into(), "UTF-8")?;
        *self_rc.pixel_value_type.borrow_mut() = bytes_to_str(&_io.read_bytes(3 as usize)?.into(), "UTF-8")?;
        *self_rc.image_representation.borrow_mut() = bytes_to_str(&_io.read_bytes(8 as usize)?.into(), "UTF-8")?;
        *self_rc.image_category.borrow_mut() = bytes_to_str(&_io.read_bytes(8 as usize)?.into(), "UTF-8")?;
        *self_rc.actual_bits_per_pixel_per_band.borrow_mut() = bytes_to_str(&_io.read_bytes(2 as usize)?.into(), "UTF-8")?;
        *self_rc.pixel_justification.borrow_mut() = bytes_to_str(&_io.read_bytes(1 as usize)?.into(), "UTF-8")?;
        *self_rc.image_coordinate_rep.borrow_mut() = bytes_to_str(&_io.read_bytes(1 as usize)?.into(), "UTF-8")?;
        *self_rc.image_geo_loc.borrow_mut() = bytes_to_str(&_io.read_bytes(60 as usize)?.into(), "UTF-8")?;
        *self_rc.num_img_comments.borrow_mut() = bytes_to_str(&_io.read_bytes(1 as usize)?.into(), "UTF-8")?;
        *self_rc.img_comments.borrow_mut() = Vec::new();
        let l_img_comments = *self_rc.num_img_comments().parse::<i32>().map_err(|_| KError::CastError)?;
        for _i in 0..l_img_comments {
            let t = Self::read_into::<_, Nitf_ImageComment>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.img_comments.borrow_mut().push(t);
        }
        *self_rc.img_compression.borrow_mut() = bytes_to_str(&_io.read_bytes(2 as usize)?.into(), "UTF-8")?;
        *self_rc.compression_rate_code.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "UTF-8")?;
        *self_rc.num_bands.borrow_mut() = bytes_to_str(&_io.read_bytes(1 as usize)?.into(), "UTF-8")?;
        if ((*self_rc.num_bands().parse::<i32>().map_err(|_| KError::CastError)? as i32) == (0 as i32)) {
            *self_rc.num_multispectral_bands.borrow_mut() = bytes_to_str(&_io.read_bytes(5 as usize)?.into(), "UTF-8")?;
        }
        *self_rc.bands.borrow_mut() = Vec::new();
        let l_bands = if ((*self_rc.num_bands().parse::<i32>().map_err(|_| KError::CastError)? as i32) != (0 as i32)) { *self_rc.num_bands().parse::<i32>().map_err(|_| KError::CastError)? } else { *self_rc.num_multispectral_bands().parse::<i32>().map_err(|_| KError::CastError)? };
        for _i in 0..l_bands {
            let t = Self::read_into::<_, Nitf_BandInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.bands.borrow_mut().push(t);
        }
        *self_rc.img_sync_code.borrow_mut() = bytes_to_str(&_io.read_bytes(1 as usize)?.into(), "UTF-8")?;
        *self_rc.img_mode.borrow_mut() = bytes_to_str(&_io.read_bytes(1 as usize)?.into(), "UTF-8")?;
        *self_rc.num_blocks_per_row.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "UTF-8")?;
        *self_rc.num_blocks_per_col.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "UTF-8")?;
        *self_rc.num_pixels_per_block_horz.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "UTF-8")?;
        *self_rc.num_pixels_per_block_vert.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "UTF-8")?;
        *self_rc.num_pixels_per_band.borrow_mut() = bytes_to_str(&_io.read_bytes(2 as usize)?.into(), "UTF-8")?;
        *self_rc.img_display_level.borrow_mut() = bytes_to_str(&_io.read_bytes(3 as usize)?.into(), "UTF-8")?;
        *self_rc.attachment_level.borrow_mut() = bytes_to_str(&_io.read_bytes(3 as usize)?.into(), "UTF-8")?;
        *self_rc.img_location.borrow_mut() = bytes_to_str(&_io.read_bytes(10 as usize)?.into(), "UTF-8")?;
        *self_rc.img_magnification.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "UTF-8")?;
        *self_rc.user_def_img_data_len.borrow_mut() = bytes_to_str(&_io.read_bytes(5 as usize)?.into(), "UTF-8")?;
        if ((*self_rc.user_def_img_data_len().parse::<i32>().map_err(|_| KError::CastError)? as i32) != (0 as i32)) {
            *self_rc.user_def_overflow.borrow_mut() = bytes_to_str(&_io.read_bytes(3 as usize)?.into(), "UTF-8")?;
        }
        if ((*self_rc.user_def_img_data_len().parse::<i32>().map_err(|_| KError::CastError)? as i32) > (2 as i32)) {
            *self_rc.user_def_img_data.borrow_mut() = Vec::new();
            let l_user_def_img_data = ((*self_rc.user_def_img_data_len().parse::<i32>().map_err(|_| KError::CastError)? as i32) - (3 as i32));
            for _i in 0..l_user_def_img_data {
                self_rc.user_def_img_data.borrow_mut().push(_io.read_u1()?.into());
            }
        }
        let t = Self::read_into::<_, Nitf_TreHeader>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.image_extended_sub_header.borrow_mut() = t;
        Ok(())
    }
}
impl Nitf_ImageSubHeader {
}
impl Nitf_ImageSubHeader {
    pub fn file_part_type(&self) -> Ref<'_, Vec<u8>> {
        self.file_part_type.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn image_id_1(&self) -> Ref<'_, String> {
        self.image_id_1.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn image_date_time(&self) -> Ref<'_, OptRc<Nitf_DateTime>> {
        self.image_date_time.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn target_id(&self) -> Ref<'_, String> {
        self.target_id.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn image_id_2(&self) -> Ref<'_, String> {
        self.image_id_2.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn image_security_classification(&self) -> Ref<'_, OptRc<Nitf_Clasnfo>> {
        self.image_security_classification.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn encryption(&self) -> Ref<'_, OptRc<Nitf_Encrypt>> {
        self.encryption.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn image_source(&self) -> Ref<'_, String> {
        self.image_source.borrow()
    }
}

/**
 * Total number of rows of significant pixels in the image; only rows indexed 0 to (NROWS - 1) of the image contain significant data.
 */
impl Nitf_ImageSubHeader {
    pub fn num_sig_rows(&self) -> Ref<'_, String> {
        self.num_sig_rows.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn num_sig_cols(&self) -> Ref<'_, String> {
        self.num_sig_cols.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn pixel_value_type(&self) -> Ref<'_, String> {
        self.pixel_value_type.borrow()
    }
}

/**
 * MONO, RGB, RGB/LUT, MULTI, NODISPLY, NVECTOR, POLAR, VPH, YCbCr601
 */
impl Nitf_ImageSubHeader {
    pub fn image_representation(&self) -> Ref<'_, String> {
        self.image_representation.borrow()
    }
}

/**
 * VIS, SL, TI, FL, RD, EO, OP, HR, HS,CP, BP, SAR, SARIQ, IR, MAP, MS, FP, MRI, XRAY, CAT, VD, PAT, LEG, DTEM, MATR, LOCG, BARO, CURRENT, DEPTH, WIND
 */
impl Nitf_ImageSubHeader {
    pub fn image_category(&self) -> Ref<'_, String> {
        self.image_category.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn actual_bits_per_pixel_per_band(&self) -> Ref<'_, String> {
        self.actual_bits_per_pixel_per_band.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn pixel_justification(&self) -> Ref<'_, String> {
        self.pixel_justification.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn image_coordinate_rep(&self) -> Ref<'_, String> {
        self.image_coordinate_rep.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn image_geo_loc(&self) -> Ref<'_, String> {
        self.image_geo_loc.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn num_img_comments(&self) -> Ref<'_, String> {
        self.num_img_comments.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn img_comments(&self) -> Ref<'_, Vec<OptRc<Nitf_ImageComment>>> {
        self.img_comments.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn img_compression(&self) -> Ref<'_, String> {
        self.img_compression.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn compression_rate_code(&self) -> Ref<'_, String> {
        self.compression_rate_code.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn num_bands(&self) -> Ref<'_, String> {
        self.num_bands.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn num_multispectral_bands(&self) -> Ref<'_, String> {
        self.num_multispectral_bands.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn bands(&self) -> Ref<'_, Vec<OptRc<Nitf_BandInfo>>> {
        self.bands.borrow()
    }
}

/**
 * Reserved for future use.
 */
impl Nitf_ImageSubHeader {
    pub fn img_sync_code(&self) -> Ref<'_, String> {
        self.img_sync_code.borrow()
    }
}

/**
 * B = Band Interleaved by Block, P = Band Interleaved by Pixel, R = Band Interleaved by Row, S = Band Sequential
 */
impl Nitf_ImageSubHeader {
    pub fn img_mode(&self) -> Ref<'_, String> {
        self.img_mode.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn num_blocks_per_row(&self) -> Ref<'_, String> {
        self.num_blocks_per_row.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn num_blocks_per_col(&self) -> Ref<'_, String> {
        self.num_blocks_per_col.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn num_pixels_per_block_horz(&self) -> Ref<'_, String> {
        self.num_pixels_per_block_horz.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn num_pixels_per_block_vert(&self) -> Ref<'_, String> {
        self.num_pixels_per_block_vert.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn num_pixels_per_band(&self) -> Ref<'_, String> {
        self.num_pixels_per_band.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn img_display_level(&self) -> Ref<'_, String> {
        self.img_display_level.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn attachment_level(&self) -> Ref<'_, String> {
        self.attachment_level.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn img_location(&self) -> Ref<'_, String> {
        self.img_location.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn img_magnification(&self) -> Ref<'_, String> {
        self.img_magnification.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn user_def_img_data_len(&self) -> Ref<'_, String> {
        self.user_def_img_data_len.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn user_def_overflow(&self) -> Ref<'_, String> {
        self.user_def_overflow.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn user_def_img_data(&self) -> Ref<'_, Vec<u8>> {
        self.user_def_img_data.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn image_extended_sub_header(&self) -> Ref<'_, OptRc<Nitf_TreHeader>> {
        self.image_extended_sub_header.borrow()
    }
}
impl Nitf_ImageSubHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_LengthDataInfo {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<Nitf_Header>,
    pub _self: SharedType<Self>,
    length_data_extension_subheader: RefCell<String>,
    length_data_extension_segment: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Nitf_LengthDataInfo {
    type Root = Nitf;
    type Parent = Nitf_Header;

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
        *self_rc.length_data_extension_subheader.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "UTF-8")?;
        *self_rc.length_data_extension_segment.borrow_mut() = bytes_to_str(&_io.read_bytes(9 as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Nitf_LengthDataInfo {
}
impl Nitf_LengthDataInfo {
    pub fn length_data_extension_subheader(&self) -> Ref<'_, String> {
        self.length_data_extension_subheader.borrow()
    }
}
impl Nitf_LengthDataInfo {
    pub fn length_data_extension_segment(&self) -> Ref<'_, String> {
        self.length_data_extension_segment.borrow()
    }
}
impl Nitf_LengthDataInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_LengthGraphicInfo {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<Nitf_Header>,
    pub _self: SharedType<Self>,
    length_graphic_subheader: RefCell<String>,
    length_graphic_segment: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Nitf_LengthGraphicInfo {
    type Root = Nitf;
    type Parent = Nitf_Header;

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
        *self_rc.length_graphic_subheader.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "UTF-8")?;
        *self_rc.length_graphic_segment.borrow_mut() = bytes_to_str(&_io.read_bytes(6 as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Nitf_LengthGraphicInfo {
}
impl Nitf_LengthGraphicInfo {
    pub fn length_graphic_subheader(&self) -> Ref<'_, String> {
        self.length_graphic_subheader.borrow()
    }
}
impl Nitf_LengthGraphicInfo {
    pub fn length_graphic_segment(&self) -> Ref<'_, String> {
        self.length_graphic_segment.borrow()
    }
}
impl Nitf_LengthGraphicInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_LengthImageInfo {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<Nitf_Header>,
    pub _self: SharedType<Self>,
    length_image_subheader: RefCell<String>,
    length_image_segment: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Nitf_LengthImageInfo {
    type Root = Nitf;
    type Parent = Nitf_Header;

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
        *self_rc.length_image_subheader.borrow_mut() = bytes_to_str(&_io.read_bytes(6 as usize)?.into(), "UTF-8")?;
        *self_rc.length_image_segment.borrow_mut() = bytes_to_str(&_io.read_bytes(10 as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Nitf_LengthImageInfo {
}
impl Nitf_LengthImageInfo {
    pub fn length_image_subheader(&self) -> Ref<'_, String> {
        self.length_image_subheader.borrow()
    }
}
impl Nitf_LengthImageInfo {
    pub fn length_image_segment(&self) -> Ref<'_, String> {
        self.length_image_segment.borrow()
    }
}
impl Nitf_LengthImageInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_LengthReservedInfo {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<Nitf_Header>,
    pub _self: SharedType<Self>,
    length_reserved_extension_subheader: RefCell<String>,
    length_reserved_extension_segment: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Nitf_LengthReservedInfo {
    type Root = Nitf;
    type Parent = Nitf_Header;

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
        *self_rc.length_reserved_extension_subheader.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "UTF-8")?;
        *self_rc.length_reserved_extension_segment.borrow_mut() = bytes_to_str(&_io.read_bytes(7 as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Nitf_LengthReservedInfo {
}
impl Nitf_LengthReservedInfo {
    pub fn length_reserved_extension_subheader(&self) -> Ref<'_, String> {
        self.length_reserved_extension_subheader.borrow()
    }
}
impl Nitf_LengthReservedInfo {
    pub fn length_reserved_extension_segment(&self) -> Ref<'_, String> {
        self.length_reserved_extension_segment.borrow()
    }
}
impl Nitf_LengthReservedInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_LengthTextInfo {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<Nitf_Header>,
    pub _self: SharedType<Self>,
    length_text_subheader: RefCell<String>,
    length_text_segment: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Nitf_LengthTextInfo {
    type Root = Nitf;
    type Parent = Nitf_Header;

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
        *self_rc.length_text_subheader.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "UTF-8")?;
        *self_rc.length_text_segment.borrow_mut() = bytes_to_str(&_io.read_bytes(5 as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Nitf_LengthTextInfo {
}
impl Nitf_LengthTextInfo {
    pub fn length_text_subheader(&self) -> Ref<'_, String> {
        self.length_text_subheader.borrow()
    }
}
impl Nitf_LengthTextInfo {
    pub fn length_text_segment(&self) -> Ref<'_, String> {
        self.length_text_segment.borrow()
    }
}
impl Nitf_LengthTextInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_ReservedExtensionSegment {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<Nitf>,
    pub _self: SharedType<Self>,
    idx: RefCell<u16>,
    reserved_sub_header: RefCell<OptRc<Nitf_ReservedSubHeader>>,
    reserved_data_field: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    reserved_sub_header_raw: RefCell<Vec<u8>>,
}
impl KStruct for Nitf_ReservedExtensionSegment {
    type Root = Nitf;
    type Parent = Nitf;

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
        *self_rc.reserved_sub_header_raw.borrow_mut() = _io.read_bytes(*_prc.as_ref().unwrap().header().lrnfo()[*self_rc.idx() as usize].length_reserved_extension_subheader().parse::<i32>().map_err(|_| KError::CastError)? as usize)?.into();
        let reserved_sub_header_raw = self_rc.reserved_sub_header_raw.borrow();
        let _t_reserved_sub_header_raw_io = BytesReader::from(reserved_sub_header_raw.clone());
        let t = Self::read_into::<BytesReader, Nitf_ReservedSubHeader>(&_t_reserved_sub_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.reserved_sub_header.borrow_mut() = t;
        *self_rc.reserved_data_field.borrow_mut() = _io.read_bytes(*_prc.as_ref().unwrap().header().lrnfo()[*self_rc.idx() as usize].length_reserved_extension_segment().parse::<i32>().map_err(|_| KError::CastError)? as usize)?.into();
        Ok(())
    }
}
impl Nitf_ReservedExtensionSegment {
    pub fn idx(&self) -> Ref<'_, u16> {
        self.idx.borrow()
    }
}
impl Nitf_ReservedExtensionSegment {
    pub fn set_params(&mut self, idx: u16) {
        *self.idx.borrow_mut() = idx;
    }
}
impl Nitf_ReservedExtensionSegment {
}
impl Nitf_ReservedExtensionSegment {
    pub fn reserved_sub_header(&self) -> Ref<'_, OptRc<Nitf_ReservedSubHeader>> {
        self.reserved_sub_header.borrow()
    }
}
impl Nitf_ReservedExtensionSegment {
    pub fn reserved_data_field(&self) -> Ref<'_, Vec<u8>> {
        self.reserved_data_field.borrow()
    }
}
impl Nitf_ReservedExtensionSegment {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Nitf_ReservedExtensionSegment {
    pub fn reserved_sub_header_raw(&self) -> Ref<'_, Vec<u8>> {
        self.reserved_sub_header_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_ReservedSubHeader {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<Nitf_ReservedExtensionSegment>,
    pub _self: SharedType<Self>,
    file_part_type_re: RefCell<Vec<u8>>,
    res_type_id: RefCell<String>,
    res_version: RefCell<String>,
    reclasnfo: RefCell<OptRc<Nitf_Clasnfo>>,
    res_user_defined_subheader_length: RefCell<String>,
    res_user_defined_subheader_fields: RefCell<String>,
    res_user_defined_data: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Nitf_ReservedSubHeader {
    type Root = Nitf;
    type Parent = Nitf_ReservedExtensionSegment;

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
        *self_rc.file_part_type_re.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.file_part_type_re() == vec![0x52u8, 0x45u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/reserved_sub_header/seq/0".to_string() }));
        }
        *self_rc.res_type_id.borrow_mut() = bytes_to_str(&_io.read_bytes(25 as usize)?.into(), "UTF-8")?;
        *self_rc.res_version.borrow_mut() = bytes_to_str(&_io.read_bytes(2 as usize)?.into(), "UTF-8")?;
        let t = Self::read_into::<_, Nitf_Clasnfo>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.reclasnfo.borrow_mut() = t;
        *self_rc.res_user_defined_subheader_length.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "UTF-8")?;
        *self_rc.res_user_defined_subheader_fields.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.res_user_defined_subheader_length().parse::<i32>().map_err(|_| KError::CastError)? as usize)?.into(), "UTF-8")?;
        *self_rc.res_user_defined_data.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Nitf_ReservedSubHeader {
}
impl Nitf_ReservedSubHeader {
    pub fn file_part_type_re(&self) -> Ref<'_, Vec<u8>> {
        self.file_part_type_re.borrow()
    }
}
impl Nitf_ReservedSubHeader {
    pub fn res_type_id(&self) -> Ref<'_, String> {
        self.res_type_id.borrow()
    }
}
impl Nitf_ReservedSubHeader {
    pub fn res_version(&self) -> Ref<'_, String> {
        self.res_version.borrow()
    }
}
impl Nitf_ReservedSubHeader {
    pub fn reclasnfo(&self) -> Ref<'_, OptRc<Nitf_Clasnfo>> {
        self.reclasnfo.borrow()
    }
}
impl Nitf_ReservedSubHeader {
    pub fn res_user_defined_subheader_length(&self) -> Ref<'_, String> {
        self.res_user_defined_subheader_length.borrow()
    }
}
impl Nitf_ReservedSubHeader {
    pub fn res_user_defined_subheader_fields(&self) -> Ref<'_, String> {
        self.res_user_defined_subheader_fields.borrow()
    }
}
impl Nitf_ReservedSubHeader {
    pub fn res_user_defined_data(&self) -> Ref<'_, String> {
        self.res_user_defined_data.borrow()
    }
}
impl Nitf_ReservedSubHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_TextSegment {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<Nitf>,
    pub _self: SharedType<Self>,
    idx: RefCell<u16>,
    text_sub_header: RefCell<Vec<u8>>,
    text_data_field: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Nitf_TextSegment {
    type Root = Nitf;
    type Parent = Nitf;

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
        *self_rc.text_sub_header.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        *self_rc.text_data_field.borrow_mut() = _io.read_bytes(*_prc.as_ref().unwrap().header().ltnfo()[*self_rc.idx() as usize].length_text_segment().parse::<i32>().map_err(|_| KError::CastError)? as usize)?.into();
        Ok(())
    }
}
impl Nitf_TextSegment {
    pub fn idx(&self) -> Ref<'_, u16> {
        self.idx.borrow()
    }
}
impl Nitf_TextSegment {
    pub fn set_params(&mut self, idx: u16) {
        *self.idx.borrow_mut() = idx;
    }
}
impl Nitf_TextSegment {
}
impl Nitf_TextSegment {
    pub fn text_sub_header(&self) -> Ref<'_, Vec<u8>> {
        self.text_sub_header.borrow()
    }
}
impl Nitf_TextSegment {
    pub fn text_data_field(&self) -> Ref<'_, Vec<u8>> {
        self.text_data_field.borrow()
    }
}
impl Nitf_TextSegment {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_TextSubHeader {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    text_date_time: RefCell<String>,
    text_title: RefCell<String>,
    text_security_class: RefCell<OptRc<Nitf_Clasnfo>>,
    encryp: RefCell<OptRc<Nitf_Encrypt>>,
    text_format: RefCell<String>,
    text_extended_sub_header: RefCell<OptRc<Nitf_TreHeader>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Nitf_TextSubHeader {
    type Root = Nitf;
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
        *self_rc.text_date_time.borrow_mut() = bytes_to_str(&_io.read_bytes(14 as usize)?.into(), "UTF-8")?;
        *self_rc.text_title.borrow_mut() = bytes_to_str(&_io.read_bytes(80 as usize)?.into(), "UTF-8")?;
        let t = Self::read_into::<_, Nitf_Clasnfo>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.text_security_class.borrow_mut() = t;
        let t = Self::read_into::<_, Nitf_Encrypt>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.encryp.borrow_mut() = t;
        *self_rc.text_format.borrow_mut() = bytes_to_str(&_io.read_bytes(3 as usize)?.into(), "UTF-8")?;
        let t = Self::read_into::<_, Nitf_TreHeader>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.text_extended_sub_header.borrow_mut() = t;
        Ok(())
    }
}
impl Nitf_TextSubHeader {
}
impl Nitf_TextSubHeader {
    pub fn text_date_time(&self) -> Ref<'_, String> {
        self.text_date_time.borrow()
    }
}
impl Nitf_TextSubHeader {
    pub fn text_title(&self) -> Ref<'_, String> {
        self.text_title.borrow()
    }
}
impl Nitf_TextSubHeader {
    pub fn text_security_class(&self) -> Ref<'_, OptRc<Nitf_Clasnfo>> {
        self.text_security_class.borrow()
    }
}
impl Nitf_TextSubHeader {
    pub fn encryp(&self) -> Ref<'_, OptRc<Nitf_Encrypt>> {
        self.encryp.borrow()
    }
}

/**
 * MTF (USMTF see MIL-STD-6040), STA (indicates BCS), UT1 (indicates ECS), U8S
 */
impl Nitf_TextSubHeader {
    pub fn text_format(&self) -> Ref<'_, String> {
        self.text_format.borrow()
    }
}
impl Nitf_TextSubHeader {
    pub fn text_extended_sub_header(&self) -> Ref<'_, OptRc<Nitf_TreHeader>> {
        self.text_extended_sub_header.borrow()
    }
}
impl Nitf_TextSubHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_Tre {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    extension_type_id: RefCell<String>,
    edata_length: RefCell<String>,
    edata: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Nitf_Tre {
    type Root = Nitf;
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
        *self_rc.extension_type_id.borrow_mut() = bytes_to_str(&_io.read_bytes(6 as usize)?.into(), "UTF-8")?;
        *self_rc.edata_length.borrow_mut() = bytes_to_str(&_io.read_bytes(5 as usize)?.into(), "UTF-8")?;
        *self_rc.edata.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.edata_length().parse::<i32>().map_err(|_| KError::CastError)? as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Nitf_Tre {
}

/**
 * RETAG or CETAG
 */
impl Nitf_Tre {
    pub fn extension_type_id(&self) -> Ref<'_, String> {
        self.extension_type_id.borrow()
    }
}

/**
 * REL or CEL
 */
impl Nitf_Tre {
    pub fn edata_length(&self) -> Ref<'_, String> {
        self.edata_length.borrow()
    }
}

/**
 * REDATA or CEDATA
 */
impl Nitf_Tre {
    pub fn edata(&self) -> Ref<'_, String> {
        self.edata.borrow()
    }
}
impl Nitf_Tre {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Nitf_TreHeader {
    pub _root: SharedType<Nitf>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    header_data_length: RefCell<String>,
    header_overflow: RefCell<String>,
    header_data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Nitf_TreHeader {
    type Root = Nitf;
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
        *self_rc.header_data_length.borrow_mut() = bytes_to_str(&_io.read_bytes(5 as usize)?.into(), "UTF-8")?;
        if ((*self_rc.header_data_length().parse::<i32>().map_err(|_| KError::CastError)? as i32) != (0 as i32)) {
            *self_rc.header_overflow.borrow_mut() = bytes_to_str(&_io.read_bytes(3 as usize)?.into(), "UTF-8")?;
        }
        if ((*self_rc.header_data_length().parse::<i32>().map_err(|_| KError::CastError)? as i32) > (2 as i32)) {
            *self_rc.header_data.borrow_mut() = Vec::new();
            let l_header_data = ((*self_rc.header_data_length().parse::<i32>().map_err(|_| KError::CastError)? as i32) - (3 as i32));
            for _i in 0..l_header_data {
                self_rc.header_data.borrow_mut().push(_io.read_u1()?.into());
            }
        }
        Ok(())
    }
}
impl Nitf_TreHeader {
}
impl Nitf_TreHeader {
    pub fn header_data_length(&self) -> Ref<'_, String> {
        self.header_data_length.borrow()
    }
}
impl Nitf_TreHeader {
    pub fn header_overflow(&self) -> Ref<'_, String> {
        self.header_overflow.borrow()
    }
}
impl Nitf_TreHeader {
    pub fn header_data(&self) -> Ref<'_, Vec<u8>> {
        self.header_data.borrow()
    }
}
impl Nitf_TreHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

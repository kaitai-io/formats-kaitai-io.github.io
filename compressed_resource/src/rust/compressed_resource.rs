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
use super::bytes_with_io::BytesWithIo;

/**
 * Compressed Macintosh resource data,
 * as stored in resources with the "compressed" attribute.
 * 
 * Resource decompression is not documented by Apple.
 * It is mostly used internally in System 7,
 * some of Apple's own applications (such as ResEdit),
 * and also by some third-party applications.
 * Later versions of Classic Mac OS make less use of resource compression,
 * but still support it fully for backwards compatibility.
 * Carbon in Mac OS X no longer supports resource compression in any way.
 * 
 * The data of all compressed resources starts with a common header,
 * followed by the compressed data.
 * The data is decompressed using code in a `'dcmp'` resource.
 * Some decompressors used by Apple are included in the System file,
 * but applications can also include custom decompressors.
 * The header of the compressed data indicates the ID of the `'dcmp'` resource used to decompress the data,
 * along with some parameters for the decompressor.
 * \sa http://www.alysis.us/arctechnology.htm Source
 * \sa http://preserve.mactech.com/articles/mactech/Vol.09/09.01/ResCompression/index.html Source
 * \sa https://github.com/dgelessus/python-rsrcfork/tree/f891a6e/src/rsrcfork/compress Source
 */

#[derive(Default, Debug, Clone)]
pub struct CompressedResource {
    pub _root: SharedType<CompressedResource>,
    pub _parent: SharedType<CompressedResource>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<CompressedResource_Header>>,
    compressed_data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for CompressedResource {
    type Root = CompressedResource;
    type Parent = CompressedResource;

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
        let t = Self::read_into::<_, CompressedResource_Header>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        *self_rc.compressed_data.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl CompressedResource {
}

/**
 * The header of the compressed data.
 */
impl CompressedResource {
    pub fn header(&self) -> Ref<'_, OptRc<CompressedResource_Header>> {
        self.header.borrow()
    }
}

/**
 * The compressed resource data.
 * 
 * The format of this data is completely dependent on the decompressor and its parameters,
 * as specified in the header.
 * For details about the compressed data formats implemented by Apple's decompressors,
 * see the specs in the resource_compression subdirectory.
 */
impl CompressedResource {
    pub fn compressed_data(&self) -> Ref<'_, Vec<u8>> {
        self.compressed_data.borrow()
    }
}
impl CompressedResource {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Compressed resource data header,
 * as stored at the start of all compressed resources.
 */

#[derive(Default, Debug, Clone)]
pub struct CompressedResource_Header {
    pub _root: SharedType<CompressedResource>,
    pub _parent: SharedType<CompressedResource>,
    pub _self: SharedType<Self>,
    common_part: RefCell<OptRc<CompressedResource_Header_CommonPart>>,
    type_specific_part_raw_with_io: RefCell<OptRc<BytesWithIo>>,
    _io: RefCell<BytesReader>,
    type_specific_part_raw_with_io_raw: RefCell<Vec<u8>>,
    f_type_specific_part: Cell<bool>,
    type_specific_part: RefCell<Option<CompressedResource_Header_TypeSpecificPart>>,
    f_type_specific_part_raw: Cell<bool>,
    type_specific_part_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum CompressedResource_Header_TypeSpecificPart {
    CompressedResource_Header_TypeSpecificPartType8(OptRc<CompressedResource_Header_TypeSpecificPartType8>),
    CompressedResource_Header_TypeSpecificPartType9(OptRc<CompressedResource_Header_TypeSpecificPartType9>),
}
impl From<&CompressedResource_Header_TypeSpecificPart> for OptRc<CompressedResource_Header_TypeSpecificPartType8> {
    fn from(v: &CompressedResource_Header_TypeSpecificPart) -> Self {
        if let CompressedResource_Header_TypeSpecificPart::CompressedResource_Header_TypeSpecificPartType8(x) = v {
            return x.clone();
        }
        panic!("expected CompressedResource_Header_TypeSpecificPart::CompressedResource_Header_TypeSpecificPartType8, got {:?}", v)
    }
}
impl From<OptRc<CompressedResource_Header_TypeSpecificPartType8>> for CompressedResource_Header_TypeSpecificPart {
    fn from(v: OptRc<CompressedResource_Header_TypeSpecificPartType8>) -> Self {
        Self::CompressedResource_Header_TypeSpecificPartType8(v)
    }
}
impl From<&CompressedResource_Header_TypeSpecificPart> for OptRc<CompressedResource_Header_TypeSpecificPartType9> {
    fn from(v: &CompressedResource_Header_TypeSpecificPart) -> Self {
        if let CompressedResource_Header_TypeSpecificPart::CompressedResource_Header_TypeSpecificPartType9(x) = v {
            return x.clone();
        }
        panic!("expected CompressedResource_Header_TypeSpecificPart::CompressedResource_Header_TypeSpecificPartType9, got {:?}", v)
    }
}
impl From<OptRc<CompressedResource_Header_TypeSpecificPartType9>> for CompressedResource_Header_TypeSpecificPart {
    fn from(v: OptRc<CompressedResource_Header_TypeSpecificPartType9>) -> Self {
        Self::CompressedResource_Header_TypeSpecificPartType9(v)
    }
}
impl KStruct for CompressedResource_Header {
    type Root = CompressedResource;
    type Parent = CompressedResource;

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
        let t = Self::read_into::<_, CompressedResource_Header_CommonPart>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.common_part.borrow_mut() = t;
        *self_rc.type_specific_part_raw_with_io_raw.borrow_mut() = _io.read_bytes(((*self_rc.common_part().len_header() as i32) - (12 as i32)) as usize)?.into();
        let type_specific_part_raw_with_io_raw = self_rc.type_specific_part_raw_with_io_raw.borrow();
        let _t_type_specific_part_raw_with_io_raw_io = BytesReader::from(type_specific_part_raw_with_io_raw.clone());
        let t = Self::read_into::<BytesReader, BytesWithIo>(&_t_type_specific_part_raw_with_io_raw_io, None, None)?.into();
        *self_rc.type_specific_part_raw_with_io.borrow_mut() = t;
        Ok(())
    }
}
impl CompressedResource_Header {

    /**
     * The type-specific part of the header,
     * parsed according to the type from the common part.
     */
    pub fn type_specific_part(
        &self
    ) -> KResult<Ref<'_, Option<CompressedResource_Header_TypeSpecificPart>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_type_specific_part.get() {
            return Ok(self.type_specific_part.borrow());
        }
        self.f_type_specific_part.set(true);
        let io = Clone::clone(&*self.type_specific_part_raw_with_io()._io());
        let _pos = io.pos();
        io.seek(0 as usize)?;
        match *self.common_part().header_type() {
            8 => {
                let t = Self::read_into::<BytesReader, CompressedResource_Header_TypeSpecificPartType8>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.type_specific_part.borrow_mut() = Some(t);
            }
            9 => {
                let t = Self::read_into::<BytesReader, CompressedResource_Header_TypeSpecificPartType9>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
                *self.type_specific_part.borrow_mut() = Some(t);
            }
            _ => {}
        }
        io.seek(_pos)?;
        Ok(self.type_specific_part.borrow())
    }

    /**
     * The type-specific part of the header,
     * as a raw byte array.
     */
    pub fn type_specific_part_raw(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_type_specific_part_raw.get() {
            return Ok(self.type_specific_part_raw.borrow());
        }
        self.f_type_specific_part_raw.set(true);
        *self.type_specific_part_raw.borrow_mut() = self.type_specific_part_raw_with_io().data().to_vec();
        Ok(self.type_specific_part_raw.borrow())
    }
}

/**
 * The common part of the header.
 * Among other things,
 * this part contains the header type,
 * which determines the format of the data in the type-specific part of the header.
 */
impl CompressedResource_Header {
    pub fn common_part(&self) -> Ref<'_, OptRc<CompressedResource_Header_CommonPart>> {
        self.common_part.borrow()
    }
}

/**
 * Use `type_specific_part_raw` instead,
 * unless you need access to this field's `_io`.
 */
impl CompressedResource_Header {
    pub fn type_specific_part_raw_with_io(&self) -> Ref<'_, OptRc<BytesWithIo>> {
        self.type_specific_part_raw_with_io.borrow()
    }
}
impl CompressedResource_Header {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl CompressedResource_Header {
    pub fn type_specific_part_raw_with_io_raw(&self) -> Ref<'_, Vec<u8>> {
        self.type_specific_part_raw_with_io_raw.borrow()
    }
}

/**
 * The common part of a compressed resource data header.
 * The format of this part is the same for all compressed resources.
 */

#[derive(Default, Debug, Clone)]
pub struct CompressedResource_Header_CommonPart {
    pub _root: SharedType<CompressedResource>,
    pub _parent: SharedType<CompressedResource_Header>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    len_header: RefCell<u16>,
    header_type: RefCell<u8>,
    unknown: RefCell<u8>,
    len_decompressed: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for CompressedResource_Header_CommonPart {
    type Root = CompressedResource;
    type Parent = CompressedResource_Header;

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
        if !(*self_rc.magic() == vec![0xa8u8, 0x9fu8, 0x65u8, 0x72u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/types/common_part/seq/0".to_string() }));
        }
        *self_rc.len_header.borrow_mut() = _io.read_u2be()?.into();
        if !(((*self_rc.len_header() as u16) == (18 as u16))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/types/common_part/seq/1".to_string() }));
        }
        *self_rc.header_type.borrow_mut() = _io.read_u1()?.into();
        *self_rc.unknown.borrow_mut() = _io.read_u1()?.into();
        if !(((*self_rc.unknown() as u8) == (1 as u8))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/types/common_part/seq/3".to_string() }));
        }
        *self_rc.len_decompressed.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl CompressedResource_Header_CommonPart {
}

/**
 * The signature of all compressed resource data.
 * 
 * When interpreted as MacRoman, this byte sequence decodes to `®üer`.
 */
impl CompressedResource_Header_CommonPart {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}

/**
 * The byte length of the entire header (common and type-specific parts).
 * 
 * The meaning of this field is mostly a guess,
 * as all known header types result in a total length of `0x12`.
 */
impl CompressedResource_Header_CommonPart {
    pub fn len_header(&self) -> Ref<'_, u16> {
        self.len_header.borrow()
    }
}

/**
 * Type of the header.
 * This determines the format of the data in the type-specific part of the header.
 * 
 * The only known header type values are `8` and `9`.
 * 
 * Every known decompressor is only compatible with one of the header types
 * (but every header type is used by more than one decompressor).
 * Apple's decompressors with IDs 0 and 1 use header type 8,
 * and those with IDs 2 and 3 use header type 9.
 */
impl CompressedResource_Header_CommonPart {
    pub fn header_type(&self) -> Ref<'_, u8> {
        self.header_type.borrow()
    }
}

/**
 * The meaning of this field is not known.
 * It has the value `0x01` in all known compressed resources.
 */
impl CompressedResource_Header_CommonPart {
    pub fn unknown(&self) -> Ref<'_, u8> {
        self.unknown.borrow()
    }
}

/**
 * The byte length of the data after decompression.
 */
impl CompressedResource_Header_CommonPart {
    pub fn len_decompressed(&self) -> Ref<'_, u32> {
        self.len_decompressed.borrow()
    }
}
impl CompressedResource_Header_CommonPart {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * The type-specific part of a compressed resource header with header type `8`.
 */

#[derive(Default, Debug, Clone)]
pub struct CompressedResource_Header_TypeSpecificPartType8 {
    pub _root: SharedType<CompressedResource>,
    pub _parent: SharedType<CompressedResource_Header>,
    pub _self: SharedType<Self>,
    working_buffer_fractional_size: RefCell<u8>,
    expansion_buffer_size: RefCell<u8>,
    decompressor_id: RefCell<i16>,
    reserved: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for CompressedResource_Header_TypeSpecificPartType8 {
    type Root = CompressedResource;
    type Parent = CompressedResource_Header;

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
        *self_rc.working_buffer_fractional_size.borrow_mut() = _io.read_u1()?.into();
        *self_rc.expansion_buffer_size.borrow_mut() = _io.read_u1()?.into();
        *self_rc.decompressor_id.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_u2be()?.into();
        if !(((*self_rc.reserved() as u16) == (0 as u16))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/types/type_specific_part_type_8/seq/3".to_string() }));
        }
        Ok(())
    }
}
impl CompressedResource_Header_TypeSpecificPartType8 {
}

/**
 * The ratio of the compressed data size to the uncompressed data size,
 * times 256.
 * 
 * This parameter affects the amount of memory allocated by the Resource Manager during decompression,
 * but does not have a direct effect on the decompressor
 * (except that it will misbehave if insufficient memory is provided).
 * Alternative decompressors that decompress resources into a separate buffer rather than in-place can generally ignore this parameter.
 */
impl CompressedResource_Header_TypeSpecificPartType8 {
    pub fn working_buffer_fractional_size(&self) -> Ref<'_, u8> {
        self.working_buffer_fractional_size.borrow()
    }
}

/**
 * The maximum number of bytes that the compressed data might "grow" during decompression.
 * 
 * This parameter affects the amount of memory allocated by the Resource Manager during decompression,
 * but does not have a direct effect on the decompressor
 * (except that it will misbehave if insufficient memory is provided).
 * Alternative decompressors that decompress resources into a separate buffer rather than in-place can generally ignore this parameter.
 */
impl CompressedResource_Header_TypeSpecificPartType8 {
    pub fn expansion_buffer_size(&self) -> Ref<'_, u8> {
        self.expansion_buffer_size.borrow()
    }
}

/**
 * The ID of the `'dcmp'` resource that should be used to decompress this resource.
 */
impl CompressedResource_Header_TypeSpecificPartType8 {
    pub fn decompressor_id(&self) -> Ref<'_, i16> {
        self.decompressor_id.borrow()
    }
}

/**
 * The meaning of this field is not known.
 * It has the value `0` in all known compressed resources,
 * so it is most likely reserved.
 */
impl CompressedResource_Header_TypeSpecificPartType8 {
    pub fn reserved(&self) -> Ref<'_, u16> {
        self.reserved.borrow()
    }
}
impl CompressedResource_Header_TypeSpecificPartType8 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * The type-specific part of a compressed resource header with header type `9`.
 */

#[derive(Default, Debug, Clone)]
pub struct CompressedResource_Header_TypeSpecificPartType9 {
    pub _root: SharedType<CompressedResource>,
    pub _parent: SharedType<CompressedResource_Header>,
    pub _self: SharedType<Self>,
    decompressor_id: RefCell<i16>,
    decompressor_specific_parameters_with_io: RefCell<OptRc<BytesWithIo>>,
    _io: RefCell<BytesReader>,
    decompressor_specific_parameters_with_io_raw: RefCell<Vec<u8>>,
    f_decompressor_specific_parameters: Cell<bool>,
    decompressor_specific_parameters: RefCell<Vec<u8>>,
}
impl KStruct for CompressedResource_Header_TypeSpecificPartType9 {
    type Root = CompressedResource;
    type Parent = CompressedResource_Header;

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
        *self_rc.decompressor_id.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.decompressor_specific_parameters_with_io_raw.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        let decompressor_specific_parameters_with_io_raw = self_rc.decompressor_specific_parameters_with_io_raw.borrow();
        let _t_decompressor_specific_parameters_with_io_raw_io = BytesReader::from(decompressor_specific_parameters_with_io_raw.clone());
        let t = Self::read_into::<BytesReader, BytesWithIo>(&_t_decompressor_specific_parameters_with_io_raw_io, None, None)?.into();
        *self_rc.decompressor_specific_parameters_with_io.borrow_mut() = t;
        Ok(())
    }
}
impl CompressedResource_Header_TypeSpecificPartType9 {

    /**
     * Decompressor-specific parameters.
     * The exact structure and meaning of this field is different for each decompressor.
     * 
     * This field always has the same length,
     * but decompressors don't always use the entirety of the field,
     * so depending on the decompressor some parts of this field may be meaningless.
     */
    pub fn decompressor_specific_parameters(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_decompressor_specific_parameters.get() {
            return Ok(self.decompressor_specific_parameters.borrow());
        }
        self.f_decompressor_specific_parameters.set(true);
        *self.decompressor_specific_parameters.borrow_mut() = self.decompressor_specific_parameters_with_io().data().to_vec();
        Ok(self.decompressor_specific_parameters.borrow())
    }
}

/**
 * The ID of the `'dcmp'` resource that should be used to decompress this resource.
 */
impl CompressedResource_Header_TypeSpecificPartType9 {
    pub fn decompressor_id(&self) -> Ref<'_, i16> {
        self.decompressor_id.borrow()
    }
}

/**
 * Use `decompressor_specific_parameters` instead,
 * unless you need access to this field's `_io`.
 */
impl CompressedResource_Header_TypeSpecificPartType9 {
    pub fn decompressor_specific_parameters_with_io(&self) -> Ref<'_, OptRc<BytesWithIo>> {
        self.decompressor_specific_parameters_with_io.borrow()
    }
}
impl CompressedResource_Header_TypeSpecificPartType9 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl CompressedResource_Header_TypeSpecificPartType9 {
    pub fn decompressor_specific_parameters_with_io_raw(&self) -> Ref<'_, Vec<u8>> {
        self.decompressor_specific_parameters_with_io_raw.borrow()
    }
}

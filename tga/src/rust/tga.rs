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
 * TGA (AKA Truevision TGA, AKA TARGA), is a raster image file format created by Truevision. It supports up to 32 bits per pixel (three 8-bit RGB channels + 8-bit alpha channel), color mapping and optional lossless RLE compression.
 * \sa https://www.dca.fee.unicamp.br/~martino/disciplinas/ea978/tgaffs.pdf Source
 */

#[derive(Default, Debug, Clone)]
pub struct Tga {
    pub _root: SharedType<Tga>,
    pub _parent: SharedType<Tga>,
    pub _self: SharedType<Self>,
    image_id_len: RefCell<u8>,
    color_map_type: RefCell<Tga_ColorMapEnum>,
    image_type: RefCell<Tga_ImageTypeEnum>,
    color_map_ofs: RefCell<u16>,
    num_color_map: RefCell<u16>,
    color_map_depth: RefCell<u8>,
    x_offset: RefCell<u16>,
    y_offset: RefCell<u16>,
    width: RefCell<u16>,
    height: RefCell<u16>,
    image_depth: RefCell<u8>,
    img_descriptor: RefCell<u8>,
    image_id: RefCell<Vec<u8>>,
    color_map: RefCell<Vec<Vec<u8>>>,
    _io: RefCell<BytesReader>,
    f_footer: Cell<bool>,
    footer: RefCell<OptRc<Tga_TgaFooter>>,
}
impl KStruct for Tga {
    type Root = Tga;
    type Parent = Tga;

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
        *self_rc.image_id_len.borrow_mut() = _io.read_u1()?.into();
        *self_rc.color_map_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.image_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.color_map_ofs.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.num_color_map.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.color_map_depth.borrow_mut() = _io.read_u1()?.into();
        *self_rc.x_offset.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.y_offset.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.width.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.height.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.image_depth.borrow_mut() = _io.read_u1()?.into();
        *self_rc.img_descriptor.borrow_mut() = _io.read_u1()?.into();
        *self_rc.image_id.borrow_mut() = _io.read_bytes(*self_rc.image_id_len() as usize)?.into();
        if *self_rc.color_map_type() == Tga_ColorMapEnum::HasColorMap {
            *self_rc.color_map.borrow_mut() = Vec::new();
            let l_color_map = *self_rc.num_color_map();
            for _i in 0..l_color_map {
                self_rc.color_map.borrow_mut().push(_io.read_bytes(((((*self_rc.color_map_depth() as u8) + (7 as u8)) as i32) / (8 as i32)) as usize)?.into());
            }
        }
        Ok(())
    }
}
impl Tga {
    pub fn footer(
        &self
    ) -> KResult<Ref<'_, OptRc<Tga_TgaFooter>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_footer.get() {
            return Ok(self.footer.borrow());
        }
        let _pos = _io.pos();
        _io.seek(((_io.size() as i32) - (26 as i32)) as usize)?;
        let t = Self::read_into::<_, Tga_TgaFooter>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.footer.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.footer.borrow())
    }
}
impl Tga {
    pub fn image_id_len(&self) -> Ref<'_, u8> {
        self.image_id_len.borrow()
    }
}
impl Tga {
    pub fn color_map_type(&self) -> Ref<'_, Tga_ColorMapEnum> {
        self.color_map_type.borrow()
    }
}
impl Tga {
    pub fn image_type(&self) -> Ref<'_, Tga_ImageTypeEnum> {
        self.image_type.borrow()
    }
}
impl Tga {
    pub fn color_map_ofs(&self) -> Ref<'_, u16> {
        self.color_map_ofs.borrow()
    }
}

/**
 * Number of entries in a color map
 */
impl Tga {
    pub fn num_color_map(&self) -> Ref<'_, u16> {
        self.num_color_map.borrow()
    }
}

/**
 * Number of bits in a each color maps entry
 */
impl Tga {
    pub fn color_map_depth(&self) -> Ref<'_, u8> {
        self.color_map_depth.borrow()
    }
}
impl Tga {
    pub fn x_offset(&self) -> Ref<'_, u16> {
        self.x_offset.borrow()
    }
}
impl Tga {
    pub fn y_offset(&self) -> Ref<'_, u16> {
        self.y_offset.borrow()
    }
}

/**
 * Width of the image, in pixels
 */
impl Tga {
    pub fn width(&self) -> Ref<'_, u16> {
        self.width.borrow()
    }
}

/**
 * Height of the image, in pixels
 */
impl Tga {
    pub fn height(&self) -> Ref<'_, u16> {
        self.height.borrow()
    }
}
impl Tga {
    pub fn image_depth(&self) -> Ref<'_, u8> {
        self.image_depth.borrow()
    }
}
impl Tga {
    pub fn img_descriptor(&self) -> Ref<'_, u8> {
        self.img_descriptor.borrow()
    }
}

/**
 * Arbitrary application-specific information that is used to
 * identify image. May contain text or some binary data.
 */
impl Tga {
    pub fn image_id(&self) -> Ref<'_, Vec<u8>> {
        self.image_id.borrow()
    }
}

/**
 * Color map
 */
impl Tga {
    pub fn color_map(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.color_map.borrow()
    }
}
impl Tga {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Tga_ColorMapEnum {
    NoColorMap,
    HasColorMap,
    Unknown(i64),
}

impl TryFrom<i64> for Tga_ColorMapEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Tga_ColorMapEnum> {
        match flag {
            0 => Ok(Tga_ColorMapEnum::NoColorMap),
            1 => Ok(Tga_ColorMapEnum::HasColorMap),
            _ => Ok(Tga_ColorMapEnum::Unknown(flag)),
        }
    }
}

impl From<&Tga_ColorMapEnum> for i64 {
    fn from(v: &Tga_ColorMapEnum) -> Self {
        match *v {
            Tga_ColorMapEnum::NoColorMap => 0,
            Tga_ColorMapEnum::HasColorMap => 1,
            Tga_ColorMapEnum::Unknown(v) => v
        }
    }
}

impl Default for Tga_ColorMapEnum {
    fn default() -> Self { Tga_ColorMapEnum::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Tga_ImageTypeEnum {
    NoImageData,
    UncompColorMapped,
    UncompTrueColor,
    UncompBw,
    RleColorMapped,
    RleTrueColor,
    RleBw,
    Unknown(i64),
}

impl TryFrom<i64> for Tga_ImageTypeEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Tga_ImageTypeEnum> {
        match flag {
            0 => Ok(Tga_ImageTypeEnum::NoImageData),
            1 => Ok(Tga_ImageTypeEnum::UncompColorMapped),
            2 => Ok(Tga_ImageTypeEnum::UncompTrueColor),
            3 => Ok(Tga_ImageTypeEnum::UncompBw),
            9 => Ok(Tga_ImageTypeEnum::RleColorMapped),
            10 => Ok(Tga_ImageTypeEnum::RleTrueColor),
            11 => Ok(Tga_ImageTypeEnum::RleBw),
            _ => Ok(Tga_ImageTypeEnum::Unknown(flag)),
        }
    }
}

impl From<&Tga_ImageTypeEnum> for i64 {
    fn from(v: &Tga_ImageTypeEnum) -> Self {
        match *v {
            Tga_ImageTypeEnum::NoImageData => 0,
            Tga_ImageTypeEnum::UncompColorMapped => 1,
            Tga_ImageTypeEnum::UncompTrueColor => 2,
            Tga_ImageTypeEnum::UncompBw => 3,
            Tga_ImageTypeEnum::RleColorMapped => 9,
            Tga_ImageTypeEnum::RleTrueColor => 10,
            Tga_ImageTypeEnum::RleBw => 11,
            Tga_ImageTypeEnum::Unknown(v) => v
        }
    }
}

impl Default for Tga_ImageTypeEnum {
    fn default() -> Self { Tga_ImageTypeEnum::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Tga_TgaExtArea {
    pub _root: SharedType<Tga>,
    pub _parent: SharedType<Tga_TgaFooter>,
    pub _self: SharedType<Self>,
    ext_area_size: RefCell<u16>,
    author_name: RefCell<String>,
    comments: RefCell<Vec<String>>,
    timestamp: RefCell<Vec<u8>>,
    job_id: RefCell<String>,
    job_time: RefCell<String>,
    software_id: RefCell<String>,
    software_version: RefCell<Vec<u8>>,
    key_color: RefCell<u32>,
    pixel_aspect_ratio: RefCell<u32>,
    gamma_value: RefCell<u32>,
    color_corr_ofs: RefCell<u32>,
    postage_stamp_ofs: RefCell<u32>,
    scan_line_ofs: RefCell<u32>,
    attributes: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Tga_TgaExtArea {
    type Root = Tga;
    type Parent = Tga_TgaFooter;

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
        *self_rc.ext_area_size.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.author_name.borrow_mut() = bytes_to_str(&_io.read_bytes(41 as usize)?.into(), "ASCII")?;
        *self_rc.comments.borrow_mut() = Vec::new();
        let l_comments = 4;
        for _i in 0..l_comments {
            self_rc.comments.borrow_mut().push(bytes_to_str(&_io.read_bytes(81 as usize)?.into(), "ASCII")?);
        }
        *self_rc.timestamp.borrow_mut() = _io.read_bytes(12 as usize)?.into();
        *self_rc.job_id.borrow_mut() = bytes_to_str(&_io.read_bytes(41 as usize)?.into(), "ASCII")?;
        *self_rc.job_time.borrow_mut() = bytes_to_str(&_io.read_bytes(6 as usize)?.into(), "ASCII")?;
        *self_rc.software_id.borrow_mut() = bytes_to_str(&_io.read_bytes(41 as usize)?.into(), "ASCII")?;
        *self_rc.software_version.borrow_mut() = _io.read_bytes(3 as usize)?.into();
        *self_rc.key_color.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.pixel_aspect_ratio.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.gamma_value.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.color_corr_ofs.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.postage_stamp_ofs.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.scan_line_ofs.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.attributes.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl Tga_TgaExtArea {
}

/**
 * Extension area size in bytes (always 495)
 */
impl Tga_TgaExtArea {
    pub fn ext_area_size(&self) -> Ref<'_, u16> {
        self.ext_area_size.borrow()
    }
}
impl Tga_TgaExtArea {
    pub fn author_name(&self) -> Ref<'_, String> {
        self.author_name.borrow()
    }
}

/**
 * Comments, organized as four lines, each consisting of 80 characters plus a NULL
 */
impl Tga_TgaExtArea {
    pub fn comments(&self) -> Ref<'_, Vec<String>> {
        self.comments.borrow()
    }
}

/**
 * Image creation date / time
 */
impl Tga_TgaExtArea {
    pub fn timestamp(&self) -> Ref<'_, Vec<u8>> {
        self.timestamp.borrow()
    }
}

/**
 * Internal job ID, to be used in image workflow systems
 */
impl Tga_TgaExtArea {
    pub fn job_id(&self) -> Ref<'_, String> {
        self.job_id.borrow()
    }
}

/**
 * Hours, minutes and seconds spent creating the file (for billing, etc.)
 */
impl Tga_TgaExtArea {
    pub fn job_time(&self) -> Ref<'_, String> {
        self.job_time.borrow()
    }
}

/**
 * The application that created the file.
 */
impl Tga_TgaExtArea {
    pub fn software_id(&self) -> Ref<'_, String> {
        self.software_id.borrow()
    }
}
impl Tga_TgaExtArea {
    pub fn software_version(&self) -> Ref<'_, Vec<u8>> {
        self.software_version.borrow()
    }
}
impl Tga_TgaExtArea {
    pub fn key_color(&self) -> Ref<'_, u32> {
        self.key_color.borrow()
    }
}
impl Tga_TgaExtArea {
    pub fn pixel_aspect_ratio(&self) -> Ref<'_, u32> {
        self.pixel_aspect_ratio.borrow()
    }
}
impl Tga_TgaExtArea {
    pub fn gamma_value(&self) -> Ref<'_, u32> {
        self.gamma_value.borrow()
    }
}

/**
 * Number of bytes from the beginning of the file to the color correction table if present
 */
impl Tga_TgaExtArea {
    pub fn color_corr_ofs(&self) -> Ref<'_, u32> {
        self.color_corr_ofs.borrow()
    }
}

/**
 * Number of bytes from the beginning of the file to the postage stamp image if present
 */
impl Tga_TgaExtArea {
    pub fn postage_stamp_ofs(&self) -> Ref<'_, u32> {
        self.postage_stamp_ofs.borrow()
    }
}

/**
 * Number of bytes from the beginning of the file to the scan lines table if present
 */
impl Tga_TgaExtArea {
    pub fn scan_line_ofs(&self) -> Ref<'_, u32> {
        self.scan_line_ofs.borrow()
    }
}

/**
 * Specifies the alpha channel
 */
impl Tga_TgaExtArea {
    pub fn attributes(&self) -> Ref<'_, u8> {
        self.attributes.borrow()
    }
}
impl Tga_TgaExtArea {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Tga_TgaFooter {
    pub _root: SharedType<Tga>,
    pub _parent: SharedType<Tga>,
    pub _self: SharedType<Self>,
    ext_area_ofs: RefCell<u32>,
    dev_dir_ofs: RefCell<u32>,
    version_magic: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_ext_area: Cell<bool>,
    ext_area: RefCell<OptRc<Tga_TgaExtArea>>,
    f_is_valid: Cell<bool>,
    is_valid: RefCell<bool>,
}
impl KStruct for Tga_TgaFooter {
    type Root = Tga;
    type Parent = Tga;

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
        *self_rc.ext_area_ofs.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.dev_dir_ofs.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.version_magic.borrow_mut() = _io.read_bytes(18 as usize)?.into();
        Ok(())
    }
}
impl Tga_TgaFooter {
    pub fn ext_area(
        &self
    ) -> KResult<Ref<'_, OptRc<Tga_TgaExtArea>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ext_area.get() {
            return Ok(self.ext_area.borrow());
        }
        if *self.is_valid()? {
            let _pos = _io.pos();
            _io.seek(*self.ext_area_ofs() as usize)?;
            let t = Self::read_into::<_, Tga_TgaExtArea>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.ext_area.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.ext_area.borrow())
    }
    pub fn is_valid(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_valid.get() {
            return Ok(self.is_valid.borrow());
        }
        self.f_is_valid.set(true);
        *self.is_valid.borrow_mut() = (*self.version_magic() == vec![0x54u8, 0x52u8, 0x55u8, 0x45u8, 0x56u8, 0x49u8, 0x53u8, 0x49u8, 0x4fu8, 0x4eu8, 0x2du8, 0x58u8, 0x46u8, 0x49u8, 0x4cu8, 0x45u8, 0x2eu8, 0x0u8]) as bool;
        Ok(self.is_valid.borrow())
    }
}

/**
 * Offset to extension area
 */
impl Tga_TgaFooter {
    pub fn ext_area_ofs(&self) -> Ref<'_, u32> {
        self.ext_area_ofs.borrow()
    }
}

/**
 * Offset to developer directory
 */
impl Tga_TgaFooter {
    pub fn dev_dir_ofs(&self) -> Ref<'_, u32> {
        self.dev_dir_ofs.borrow()
    }
}
impl Tga_TgaFooter {
    pub fn version_magic(&self) -> Ref<'_, Vec<u8>> {
        self.version_magic.borrow()
    }
}
impl Tga_TgaFooter {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

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
 * GIMP brush format is native to the GIMP image editor for storing a brush or a texture.
 * It can be used in all [Paint Tools](https://docs.gimp.org/2.10/en/gimp-tools-paint.html),
 * for example Pencil and Paintbrush. It works by repeating the brush bitmap as you move
 * the tool. The Spacing parameter sets the distance between the brush marks as a percentage
 * of brush width. Its default value can be set in the brush file.
 * 
 * You can also use GIMP to create new brushes in this format. Custom brushes can be loaded
 * into GIMP for use in the paint tools by copying them into one of the Brush Folders -
 * select **Edit** > **Preferences** in the menu bar, expand the **Folders** section
 * and choose **Brushes** to see the recognized Brush Folders or to add new ones.
 * \sa https://github.com/GNOME/gimp/blob/441631322b/devel-docs/gbr.txt Source
 */

#[derive(Default, Debug, Clone)]
pub struct GimpBrush {
    pub _root: SharedType<GimpBrush>,
    pub _parent: SharedType<GimpBrush>,
    pub _self: SharedType<Self>,
    len_header: RefCell<u32>,
    header: RefCell<OptRc<GimpBrush_Header>>,
    _io: RefCell<BytesReader>,
    header_raw: RefCell<Vec<u8>>,
    f_body: Cell<bool>,
    body: RefCell<Vec<u8>>,
    f_len_body: Cell<bool>,
    len_body: RefCell<i32>,
}
impl KStruct for GimpBrush {
    type Root = GimpBrush;
    type Parent = GimpBrush;

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
        *self_rc.len_header.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.header_raw.borrow_mut() = _io.read_bytes(((*self_rc.len_header() as i32) - (4 as i32)) as usize)?.into();
        let header_raw = self_rc.header_raw.borrow();
        let _t_header_raw_io = BytesReader::from(header_raw.clone());
        let t = Self::read_into::<BytesReader, GimpBrush_Header>(&_t_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        Ok(())
    }
}
impl GimpBrush {
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
        _io.seek(*self.len_header() as usize)?;
        *self.body.borrow_mut() = _io.read_bytes(*self.len_body()? as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.body.borrow())
    }
    pub fn len_body(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_body.get() {
            return Ok(self.len_body.borrow());
        }
        self.f_len_body.set(true);
        *self.len_body.borrow_mut() = (((((*self.header().width() as u32) * (*self.header().height() as u32)) as i32) * (i64::from(&*self.header().bytes_per_pixel()) as i32))) as i32;
        Ok(self.len_body.borrow())
    }
}
impl GimpBrush {
    pub fn len_header(&self) -> Ref<'_, u32> {
        self.len_header.borrow()
    }
}
impl GimpBrush {
    pub fn header(&self) -> Ref<'_, OptRc<GimpBrush_Header>> {
        self.header.borrow()
    }
}
impl GimpBrush {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl GimpBrush {
    pub fn header_raw(&self) -> Ref<'_, Vec<u8>> {
        self.header_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum GimpBrush_ColorDepth {
    Grayscale,
    Rgba,
    Unknown(i64),
}

impl TryFrom<i64> for GimpBrush_ColorDepth {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<GimpBrush_ColorDepth> {
        match flag {
            1 => Ok(GimpBrush_ColorDepth::Grayscale),
            4 => Ok(GimpBrush_ColorDepth::Rgba),
            _ => Ok(GimpBrush_ColorDepth::Unknown(flag)),
        }
    }
}

impl From<&GimpBrush_ColorDepth> for i64 {
    fn from(v: &GimpBrush_ColorDepth) -> Self {
        match *v {
            GimpBrush_ColorDepth::Grayscale => 1,
            GimpBrush_ColorDepth::Rgba => 4,
            GimpBrush_ColorDepth::Unknown(v) => v
        }
    }
}

impl Default for GimpBrush_ColorDepth {
    fn default() -> Self { GimpBrush_ColorDepth::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct GimpBrush_Bitmap {
    pub _root: SharedType<GimpBrush>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    rows: RefCell<Vec<OptRc<GimpBrush_Row>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for GimpBrush_Bitmap {
    type Root = GimpBrush;
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
        *self_rc.rows.borrow_mut() = Vec::new();
        let l_rows = *_r.header().height();
        for _i in 0..l_rows {
            let t = Self::read_into::<_, GimpBrush_Row>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.rows.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl GimpBrush_Bitmap {
}
impl GimpBrush_Bitmap {
    pub fn rows(&self) -> Ref<'_, Vec<OptRc<GimpBrush_Row>>> {
        self.rows.borrow()
    }
}
impl GimpBrush_Bitmap {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct GimpBrush_Header {
    pub _root: SharedType<GimpBrush>,
    pub _parent: SharedType<GimpBrush>,
    pub _self: SharedType<Self>,
    version: RefCell<u32>,
    width: RefCell<u32>,
    height: RefCell<u32>,
    bytes_per_pixel: RefCell<GimpBrush_ColorDepth>,
    magic: RefCell<Vec<u8>>,
    spacing: RefCell<u32>,
    brush_name: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for GimpBrush_Header {
    type Root = GimpBrush;
    type Parent = GimpBrush;

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
        *self_rc.version.borrow_mut() = _io.read_u4be()?.into();
        if !(((*self_rc.version() as u32) == (2 as u32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/seq/0".to_string() }));
        }
        *self_rc.width.borrow_mut() = _io.read_u4be()?.into();
        if !(((*self_rc.width() as u32) >= (1 as u32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/header/seq/1".to_string() }));
        }
        if !(((*self_rc.width() as i32) <= (10000 as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/header/seq/1".to_string() }));
        }
        *self_rc.height.borrow_mut() = _io.read_u4be()?.into();
        if !(((*self_rc.height() as u32) >= (1 as u32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/header/seq/2".to_string() }));
        }
        if !(((*self_rc.height() as i32) <= (10000 as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/header/seq/2".to_string() }));
        }
        *self_rc.bytes_per_pixel.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        *self_rc.magic.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.magic() == vec![0x47u8, 0x49u8, 0x4du8, 0x50u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header/seq/4".to_string() }));
        }
        *self_rc.spacing.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.brush_name.borrow_mut() = bytes_to_str(&bytes_terminate(&_io.read_bytes_full()?.into(), 0, false).into(), "UTF-8")?;
        Ok(())
    }
}
impl GimpBrush_Header {
}
impl GimpBrush_Header {
    pub fn version(&self) -> Ref<'_, u32> {
        self.version.borrow()
    }
}

/**
 * \sa https://github.com/GNOME/gimp/blob/441631322b/app/core/gimpbrush-load.c#L170 Source
 * \sa https://github.com/GNOME/gimp/blob/441631322b/app/core/gimpbrush-header.h#L24 Source
 */
impl GimpBrush_Header {
    pub fn width(&self) -> Ref<'_, u32> {
        self.width.borrow()
    }
}

/**
 * \sa https://github.com/GNOME/gimp/blob/441631322b/app/core/gimpbrush-load.c#L177 Source
 * \sa https://github.com/GNOME/gimp/blob/441631322b/app/core/gimpbrush-header.h#L24 Source
 */
impl GimpBrush_Header {
    pub fn height(&self) -> Ref<'_, u32> {
        self.height.borrow()
    }
}
impl GimpBrush_Header {
    pub fn bytes_per_pixel(&self) -> Ref<'_, GimpBrush_ColorDepth> {
        self.bytes_per_pixel.borrow()
    }
}
impl GimpBrush_Header {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}

/**
 * Default spacing to be used for brush. Percentage of brush width.
 */
impl GimpBrush_Header {
    pub fn spacing(&self) -> Ref<'_, u32> {
        self.spacing.borrow()
    }
}
impl GimpBrush_Header {
    pub fn brush_name(&self) -> Ref<'_, String> {
        self.brush_name.borrow()
    }
}
impl GimpBrush_Header {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct GimpBrush_Row {
    pub _root: SharedType<GimpBrush>,
    pub _parent: SharedType<GimpBrush_Bitmap>,
    pub _self: SharedType<Self>,
    pixels: RefCell<Vec<GimpBrush_Row_Pixels>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum GimpBrush_Row_Pixels {
    GimpBrush_Row_PixelGray(OptRc<GimpBrush_Row_PixelGray>),
    GimpBrush_Row_PixelRgba(OptRc<GimpBrush_Row_PixelRgba>),
}
impl From<&GimpBrush_Row_Pixels> for OptRc<GimpBrush_Row_PixelGray> {
    fn from(v: &GimpBrush_Row_Pixels) -> Self {
        if let GimpBrush_Row_Pixels::GimpBrush_Row_PixelGray(x) = v {
            return x.clone();
        }
        panic!("expected GimpBrush_Row_Pixels::GimpBrush_Row_PixelGray, got {:?}", v)
    }
}
impl From<OptRc<GimpBrush_Row_PixelGray>> for GimpBrush_Row_Pixels {
    fn from(v: OptRc<GimpBrush_Row_PixelGray>) -> Self {
        Self::GimpBrush_Row_PixelGray(v)
    }
}
impl From<&GimpBrush_Row_Pixels> for OptRc<GimpBrush_Row_PixelRgba> {
    fn from(v: &GimpBrush_Row_Pixels) -> Self {
        if let GimpBrush_Row_Pixels::GimpBrush_Row_PixelRgba(x) = v {
            return x.clone();
        }
        panic!("expected GimpBrush_Row_Pixels::GimpBrush_Row_PixelRgba, got {:?}", v)
    }
}
impl From<OptRc<GimpBrush_Row_PixelRgba>> for GimpBrush_Row_Pixels {
    fn from(v: OptRc<GimpBrush_Row_PixelRgba>) -> Self {
        Self::GimpBrush_Row_PixelRgba(v)
    }
}
impl KStruct for GimpBrush_Row {
    type Root = GimpBrush;
    type Parent = GimpBrush_Bitmap;

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
        *self_rc.pixels.borrow_mut() = Vec::new();
        let l_pixels = *_r.header().width();
        for _i in 0..l_pixels {
            match *_r.header().bytes_per_pixel() {
                GimpBrush_ColorDepth::Grayscale => {
                    let t = Self::read_into::<_, GimpBrush_Row_PixelGray>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    self_rc.pixels.borrow_mut().push(t);
                }
                GimpBrush_ColorDepth::Rgba => {
                    let t = Self::read_into::<_, GimpBrush_Row_PixelRgba>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    self_rc.pixels.borrow_mut().push(t);
                }
                _ => {}
            }
        }
        Ok(())
    }
}
impl GimpBrush_Row {
}
impl GimpBrush_Row {
    pub fn pixels(&self) -> Ref<'_, Vec<GimpBrush_Row_Pixels>> {
        self.pixels.borrow()
    }
}
impl GimpBrush_Row {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct GimpBrush_Row_PixelGray {
    pub _root: SharedType<GimpBrush>,
    pub _parent: SharedType<GimpBrush_Row>,
    pub _self: SharedType<Self>,
    gray: RefCell<u8>,
    _io: RefCell<BytesReader>,
    f_alpha: Cell<bool>,
    alpha: RefCell<u8>,
    f_blue: Cell<bool>,
    blue: RefCell<i8>,
    f_green: Cell<bool>,
    green: RefCell<i8>,
    f_red: Cell<bool>,
    red: RefCell<i8>,
}
impl KStruct for GimpBrush_Row_PixelGray {
    type Root = GimpBrush;
    type Parent = GimpBrush_Row;

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
        *self_rc.gray.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl GimpBrush_Row_PixelGray {
    pub fn alpha(
        &self
    ) -> KResult<Ref<'_, u8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_alpha.get() {
            return Ok(self.alpha.borrow());
        }
        self.f_alpha.set(true);
        *self.alpha.borrow_mut() = (*self.gray()) as u8;
        Ok(self.alpha.borrow())
    }
    pub fn blue(
        &self
    ) -> KResult<Ref<'_, i8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_blue.get() {
            return Ok(self.blue.borrow());
        }
        self.f_blue.set(true);
        *self.blue.borrow_mut() = (0) as i8;
        Ok(self.blue.borrow())
    }
    pub fn green(
        &self
    ) -> KResult<Ref<'_, i8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_green.get() {
            return Ok(self.green.borrow());
        }
        self.f_green.set(true);
        *self.green.borrow_mut() = (0) as i8;
        Ok(self.green.borrow())
    }
    pub fn red(
        &self
    ) -> KResult<Ref<'_, i8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_red.get() {
            return Ok(self.red.borrow());
        }
        self.f_red.set(true);
        *self.red.borrow_mut() = (0) as i8;
        Ok(self.red.borrow())
    }
}
impl GimpBrush_Row_PixelGray {
    pub fn gray(&self) -> Ref<'_, u8> {
        self.gray.borrow()
    }
}
impl GimpBrush_Row_PixelGray {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct GimpBrush_Row_PixelRgba {
    pub _root: SharedType<GimpBrush>,
    pub _parent: SharedType<GimpBrush_Row>,
    pub _self: SharedType<Self>,
    red: RefCell<u8>,
    green: RefCell<u8>,
    blue: RefCell<u8>,
    alpha: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for GimpBrush_Row_PixelRgba {
    type Root = GimpBrush;
    type Parent = GimpBrush_Row;

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
        *self_rc.red.borrow_mut() = _io.read_u1()?.into();
        *self_rc.green.borrow_mut() = _io.read_u1()?.into();
        *self_rc.blue.borrow_mut() = _io.read_u1()?.into();
        *self_rc.alpha.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl GimpBrush_Row_PixelRgba {
}
impl GimpBrush_Row_PixelRgba {
    pub fn red(&self) -> Ref<'_, u8> {
        self.red.borrow()
    }
}
impl GimpBrush_Row_PixelRgba {
    pub fn green(&self) -> Ref<'_, u8> {
        self.green.borrow()
    }
}
impl GimpBrush_Row_PixelRgba {
    pub fn blue(&self) -> Ref<'_, u8> {
        self.blue.borrow()
    }
}
impl GimpBrush_Row_PixelRgba {
    pub fn alpha(&self) -> Ref<'_, u8> {
        self.alpha.borrow()
    }
}
impl GimpBrush_Row_PixelRgba {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

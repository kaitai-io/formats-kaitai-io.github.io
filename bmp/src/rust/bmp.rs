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
 * The **BMP file format**, also known as **bitmap image file** or **device independent
 * bitmap (DIB) file format** or simply a **bitmap**, is a raster graphics image file
 * format used to store bitmap digital images, independently of the display
 * device (such as a graphics adapter), especially on Microsoft Windows
 * and OS/2 operating systems.
 * 
 * ## Samples
 * 
 * Great collection of various BMP sample files:
 * [**BMP Suite Image List**](
 *   http://entropymine.com/jason/bmpsuite/bmpsuite/html/bmpsuite.html
 * ) (by Jason Summers)
 * 
 * If only there was such a comprehensive sample suite for every file format! It's like
 * a dream for every developer of any binary file format parser. It contains a lot of
 * different types and variations of BMP files, even the tricky ones, where it's not clear
 * from the specification how to deal with them (marked there as "**q**uestionable").
 * 
 * If you make a program which will be able to read all the "**g**ood" and "**q**uestionable"
 * BMP files and won't crash on the "**b**ad" ones, it will definitely have one of the most
 * extensive support of BMP files in the universe!
 * 
 * ## BITMAPV2INFOHEADER and BITMAPV3INFOHEADER
 * 
 * A beneficial discussion on Adobe forum (archived):
 * [**Invalid BMP Format with Alpha channel**](
 *   https://web.archive.org/web/20150127132443/https://forums.adobe.com/message/3272950
 * )
 * 
 * In 2010, someone noticed that Photoshop generated BMP with an odd type of header. There wasn't
 * any documentation available for this header at the time (and still isn't).
 * However, Chris Cox (former Adobe employee) claimed that they hadn't invented any type
 * of proprietary header and everything they were writing was taken directly
 * from the Microsoft documentation.
 * 
 * It showed up that the unknown header was called BITMAPV3INFOHEADER.
 * Although Microsoft has apparently requested and verified the use of the header,
 * the documentation on MSDN has probably got lost and they have probably
 * forgotten about this type of header.
 * 
 * This is the only source I could find about these structures, so we could't rely
 * on it so much, but I think supporting them as a read-only format won't harm anything.
 * Due to the fact that it isn't documented anywhere else, most applications don't support it.
 * 
 * All Windows headers at once (including mentioned BITMAPV2INFOHEADER and BITMAPV3INFOHEADER):
 * 
 * ![Bitmap headers overview](
 *   https://web.archive.org/web/20190527043845/https://forums.adobe.com/servlet/JiveServlet/showImage/2-3273299-47801/BMP_Headers.png
 * )
 * 
 * ## Specs
 *  * [Bitmap Storage (Windows Dev Center)](
 *      https://learn.microsoft.com/en-us/windows/win32/gdi/bitmap-storage
 *    )
 *     * BITMAPFILEHEADER
 *     * BITMAPINFOHEADER
 *     * BITMAPV4HEADER
 *     * BITMAPV5HEADER
 *  * [OS/2 Bitmap File Format](
 *       https://www.fileformat.info/format/os2bmp/egff.htm
 *    )
 *     * BITMAPFILEHEADER (OS2BMPFILEHEADER)
 *     * BITMAPCOREHEADER (OS21XBITMAPHEADER)
 *     * OS22XBITMAPHEADER
 *  * [Microsoft Windows Bitmap](
 *       http://netghost.narod.ru/gff/graphics/summary/micbmp.htm
 *    )
 *     * BITMAPFILEHEADER (WINBMPFILEHEADER)
 *     * BITMAPCOREHEADER (WIN2XBITMAPHEADER)
 *     * BITMAPINFOHEADER (WINNTBITMAPHEADER)
 *     * BITMAPV4HEADER (WIN4XBITMAPHEADER)
 */

#[derive(Default, Debug, Clone)]
pub struct Bmp {
    pub _root: SharedType<Bmp>,
    pub _parent: SharedType<Bmp>,
    pub _self: SharedType<Self>,
    file_hdr: RefCell<OptRc<Bmp_FileHeader>>,
    dib_info: RefCell<OptRc<Bmp_BitmapInfo>>,
    bitmap: RefCell<OptRc<Bmp_Bitmap>>,
    _io: RefCell<BytesReader>,
    dib_info_raw: RefCell<Vec<u8>>,
    bitmap_raw: RefCell<Vec<u8>>,
}
impl KStruct for Bmp {
    type Root = Bmp;
    type Parent = Bmp;

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
        let t = Self::read_into::<_, Bmp_FileHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.file_hdr.borrow_mut() = t;
        *self_rc.dib_info_raw.borrow_mut() = _io.read_bytes(((*self_rc.file_hdr().ofs_bitmap() as i32) - (14 as i32)) as usize)?.into();
        let dib_info_raw = self_rc.dib_info_raw.borrow();
        let _t_dib_info_raw_io = BytesReader::from(dib_info_raw.clone());
        let t = Self::read_into::<BytesReader, Bmp_BitmapInfo>(&_t_dib_info_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.dib_info.borrow_mut() = t;
        *self_rc.bitmap_raw.borrow_mut() = _io.read_bytes_full()?.into();
        let bitmap_raw = self_rc.bitmap_raw.borrow();
        let _t_bitmap_raw_io = BytesReader::from(bitmap_raw.clone());
        let t = Self::read_into::<BytesReader, Bmp_Bitmap>(&_t_bitmap_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.bitmap.borrow_mut() = t;
        Ok(())
    }
}
impl Bmp {
}
impl Bmp {
    pub fn file_hdr(&self) -> Ref<'_, OptRc<Bmp_FileHeader>> {
        self.file_hdr.borrow()
    }
}
impl Bmp {
    pub fn dib_info(&self) -> Ref<'_, OptRc<Bmp_BitmapInfo>> {
        self.dib_info.borrow()
    }
}
impl Bmp {
    pub fn bitmap(&self) -> Ref<'_, OptRc<Bmp_Bitmap>> {
        self.bitmap.borrow()
    }
}
impl Bmp {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Bmp {
    pub fn dib_info_raw(&self) -> Ref<'_, Vec<u8>> {
        self.dib_info_raw.borrow()
    }
}
impl Bmp {
    pub fn bitmap_raw(&self) -> Ref<'_, Vec<u8>> {
        self.bitmap_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Bmp_ColorSpace {

    /**
     * This value implies that endpoints and gamma values are given in the appropriate fields.
     */
    CalibratedRgb,

    /**
     * This value indicates that bV5ProfileData points to the file name of the profile
     * to use (gamma and endpoints values are ignored).
     * 
     * If a profile is linked, the path of the profile can be any fully qualified name
     * (including a network path) that can be opened using the Win32 CreateFile function.
     */
    ProfileLinked,

    /**
     * This value indicates that bV5ProfileData points to a memory buffer that contains
     * the profile to be used (gamma and endpoints values are ignored).
     */
    ProfileEmbedded,

    /**
     * This value indicates that the bitmap is in the system default color space, sRGB.
     */
    Windows,

    /**
     * Specifies that the bitmap is in sRGB color space.
     */
    SRgb,
    Unknown(i64),
}

impl TryFrom<i64> for Bmp_ColorSpace {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Bmp_ColorSpace> {
        match flag {
            0 => Ok(Bmp_ColorSpace::CalibratedRgb),
            1279872587 => Ok(Bmp_ColorSpace::ProfileLinked),
            1296188740 => Ok(Bmp_ColorSpace::ProfileEmbedded),
            1466527264 => Ok(Bmp_ColorSpace::Windows),
            1934772034 => Ok(Bmp_ColorSpace::SRgb),
            _ => Ok(Bmp_ColorSpace::Unknown(flag)),
        }
    }
}

impl From<&Bmp_ColorSpace> for i64 {
    fn from(v: &Bmp_ColorSpace) -> Self {
        match *v {
            Bmp_ColorSpace::CalibratedRgb => 0,
            Bmp_ColorSpace::ProfileLinked => 1279872587,
            Bmp_ColorSpace::ProfileEmbedded => 1296188740,
            Bmp_ColorSpace::Windows => 1466527264,
            Bmp_ColorSpace::SRgb => 1934772034,
            Bmp_ColorSpace::Unknown(v) => v
        }
    }
}

impl Default for Bmp_ColorSpace {
    fn default() -> Self { Bmp_ColorSpace::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Bmp_Compressions {

    /**
     * Uncompressed RGB format
     */
    Rgb,

    /**
     * RLE compression, 8 bits per pixel
     */
    Rle8,

    /**
     * RLE compression, 4 bits per pixel
     */
    Rle4,
    Bitfields,

    /**
     * BMP file includes whole JPEG file in image buffer
     */
    Jpeg,

    /**
     * BMP file includes whole PNG file in image buffer
     */
    Png,

    /**
     * only Windows CE 5.0 with .NET 4.0 or later
     * \sa https://en.wikipedia.org/wiki/BMP_file_format#DIB_header_(bitmap_information_header) table of compression methods
     * \sa http://entropymine.com/jason/bmpsuite/bmpsuite/html/bmpsuite.html q/rgba32abf.bmp
     */
    AlphaBitfields,
    Unknown(i64),
}

impl TryFrom<i64> for Bmp_Compressions {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Bmp_Compressions> {
        match flag {
            0 => Ok(Bmp_Compressions::Rgb),
            1 => Ok(Bmp_Compressions::Rle8),
            2 => Ok(Bmp_Compressions::Rle4),
            3 => Ok(Bmp_Compressions::Bitfields),
            4 => Ok(Bmp_Compressions::Jpeg),
            5 => Ok(Bmp_Compressions::Png),
            6 => Ok(Bmp_Compressions::AlphaBitfields),
            _ => Ok(Bmp_Compressions::Unknown(flag)),
        }
    }
}

impl From<&Bmp_Compressions> for i64 {
    fn from(v: &Bmp_Compressions) -> Self {
        match *v {
            Bmp_Compressions::Rgb => 0,
            Bmp_Compressions::Rle8 => 1,
            Bmp_Compressions::Rle4 => 2,
            Bmp_Compressions::Bitfields => 3,
            Bmp_Compressions::Jpeg => 4,
            Bmp_Compressions::Png => 5,
            Bmp_Compressions::AlphaBitfields => 6,
            Bmp_Compressions::Unknown(v) => v
        }
    }
}

impl Default for Bmp_Compressions {
    fn default() -> Self { Bmp_Compressions::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Bmp_HeaderType {
    BitmapCoreHeader,
    BitmapInfoHeader,
    BitmapV2InfoHeader,
    BitmapV3InfoHeader,
    Os22xBitmapHeader,
    BitmapV4Header,
    BitmapV5Header,
    Unknown(i64),
}

impl TryFrom<i64> for Bmp_HeaderType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Bmp_HeaderType> {
        match flag {
            12 => Ok(Bmp_HeaderType::BitmapCoreHeader),
            40 => Ok(Bmp_HeaderType::BitmapInfoHeader),
            52 => Ok(Bmp_HeaderType::BitmapV2InfoHeader),
            56 => Ok(Bmp_HeaderType::BitmapV3InfoHeader),
            64 => Ok(Bmp_HeaderType::Os22xBitmapHeader),
            108 => Ok(Bmp_HeaderType::BitmapV4Header),
            124 => Ok(Bmp_HeaderType::BitmapV5Header),
            _ => Ok(Bmp_HeaderType::Unknown(flag)),
        }
    }
}

impl From<&Bmp_HeaderType> for i64 {
    fn from(v: &Bmp_HeaderType) -> Self {
        match *v {
            Bmp_HeaderType::BitmapCoreHeader => 12,
            Bmp_HeaderType::BitmapInfoHeader => 40,
            Bmp_HeaderType::BitmapV2InfoHeader => 52,
            Bmp_HeaderType::BitmapV3InfoHeader => 56,
            Bmp_HeaderType::Os22xBitmapHeader => 64,
            Bmp_HeaderType::BitmapV4Header => 108,
            Bmp_HeaderType::BitmapV5Header => 124,
            Bmp_HeaderType::Unknown(v) => v
        }
    }
}

impl Default for Bmp_HeaderType {
    fn default() -> Self { Bmp_HeaderType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Bmp_Intent {

    /**
     * Maintains saturation. Used for business charts and other situations in which undithered colors are required.
     */
    Business,

    /**
     * Maintains colorimetric match. Used for graphic designs and named colors.
     */
    Graphics,

    /**
     * Maintains contrast. Used for photographs and natural images.
     */
    Images,

    /**
     * Maintains the white point. Matches the colors to their nearest color in the destination gamut.
     */
    AbsColorimetric,
    Unknown(i64),
}

impl TryFrom<i64> for Bmp_Intent {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Bmp_Intent> {
        match flag {
            1 => Ok(Bmp_Intent::Business),
            2 => Ok(Bmp_Intent::Graphics),
            4 => Ok(Bmp_Intent::Images),
            8 => Ok(Bmp_Intent::AbsColorimetric),
            _ => Ok(Bmp_Intent::Unknown(flag)),
        }
    }
}

impl From<&Bmp_Intent> for i64 {
    fn from(v: &Bmp_Intent) -> Self {
        match *v {
            Bmp_Intent::Business => 1,
            Bmp_Intent::Graphics => 2,
            Bmp_Intent::Images => 4,
            Bmp_Intent::AbsColorimetric => 8,
            Bmp_Intent::Unknown(v) => v
        }
    }
}

impl Default for Bmp_Intent {
    fn default() -> Self { Bmp_Intent::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Bmp_Os2Compressions {
    Rgb,
    Rle8,
    Rle4,

    /**
     * Huffman 1D compression (also known as CCITT Group 3 One-Dimensional (G31D))
     */
    Huffman1d,

    /**
     * RLE compression, 24 bits per pixel
     */
    Rle24,
    Unknown(i64),
}

impl TryFrom<i64> for Bmp_Os2Compressions {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Bmp_Os2Compressions> {
        match flag {
            0 => Ok(Bmp_Os2Compressions::Rgb),
            1 => Ok(Bmp_Os2Compressions::Rle8),
            2 => Ok(Bmp_Os2Compressions::Rle4),
            3 => Ok(Bmp_Os2Compressions::Huffman1d),
            4 => Ok(Bmp_Os2Compressions::Rle24),
            _ => Ok(Bmp_Os2Compressions::Unknown(flag)),
        }
    }
}

impl From<&Bmp_Os2Compressions> for i64 {
    fn from(v: &Bmp_Os2Compressions) -> Self {
        match *v {
            Bmp_Os2Compressions::Rgb => 0,
            Bmp_Os2Compressions::Rle8 => 1,
            Bmp_Os2Compressions::Rle4 => 2,
            Bmp_Os2Compressions::Huffman1d => 3,
            Bmp_Os2Compressions::Rle24 => 4,
            Bmp_Os2Compressions::Unknown(v) => v
        }
    }
}

impl Default for Bmp_Os2Compressions {
    fn default() -> Self { Bmp_Os2Compressions::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Bmp_Os2Rendering {
    NoHalftoning,
    ErrorDiffusion,

    /**
     * Processing Algorithm for Noncoded Document Acquisition (PANDA)
     */
    Panda,
    SuperCircle,
    Unknown(i64),
}

impl TryFrom<i64> for Bmp_Os2Rendering {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Bmp_Os2Rendering> {
        match flag {
            0 => Ok(Bmp_Os2Rendering::NoHalftoning),
            1 => Ok(Bmp_Os2Rendering::ErrorDiffusion),
            2 => Ok(Bmp_Os2Rendering::Panda),
            3 => Ok(Bmp_Os2Rendering::SuperCircle),
            _ => Ok(Bmp_Os2Rendering::Unknown(flag)),
        }
    }
}

impl From<&Bmp_Os2Rendering> for i64 {
    fn from(v: &Bmp_Os2Rendering) -> Self {
        match *v {
            Bmp_Os2Rendering::NoHalftoning => 0,
            Bmp_Os2Rendering::ErrorDiffusion => 1,
            Bmp_Os2Rendering::Panda => 2,
            Bmp_Os2Rendering::SuperCircle => 3,
            Bmp_Os2Rendering::Unknown(v) => v
        }
    }
}

impl Default for Bmp_Os2Rendering {
    fn default() -> Self { Bmp_Os2Rendering::Unknown(0) }
}


/**
 * Replace with an opaque type if you care about the pixels. You can look at
 * an example of a JavaScript implementation:
 * <https://github.com/generalmimon/bmptool/blob/master/src/Bitmap.js>
 * 
 * There is a proposal for adding bitmap data type to Kaitai Struct:
 * <https://github.com/kaitai-io/kaitai_struct/issues/188>
 */

#[derive(Default, Debug, Clone)]
pub struct Bmp_Bitmap {
    pub _root: SharedType<Bmp>,
    pub _parent: SharedType<Bmp>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Bmp_Bitmap {
    type Root = Bmp;
    type Parent = Bmp;

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
impl Bmp_Bitmap {
}
impl Bmp_Bitmap {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapcoreheader Source
 * \sa https://www.fileformat.info/format/os2bmp/egff.htm#OS2BMP-DMYID.3.1 Source
 */

#[derive(Default, Debug, Clone)]
pub struct Bmp_BitmapHeader {
    pub _root: SharedType<Bmp>,
    pub _parent: SharedType<Bmp_BitmapInfo>,
    pub _self: SharedType<Self>,
    len_header: RefCell<u32>,
    image_width: RefCell<Option<Bmp_BitmapHeader_ImageWidth>>,
    image_height_raw: RefCell<Option<Bmp_BitmapHeader_ImageHeightRaw>>,
    num_planes: RefCell<u16>,
    bits_per_pixel: RefCell<u16>,
    bitmap_info_ext: RefCell<OptRc<Bmp_BitmapInfoExtension>>,
    color_mask: RefCell<OptRc<Bmp_ColorMask>>,
    os2_2x_bitmap_ext: RefCell<OptRc<Bmp_Os22xBitmapExtension>>,
    bitmap_v4_ext: RefCell<OptRc<Bmp_BitmapV4Extension>>,
    bitmap_v5_ext: RefCell<OptRc<Bmp_BitmapV5Extension>>,
    _io: RefCell<BytesReader>,
    f_bottom_up: Cell<bool>,
    bottom_up: RefCell<bool>,
    f_extends_bitmap_info: Cell<bool>,
    extends_bitmap_info: RefCell<bool>,
    f_extends_bitmap_v4: Cell<bool>,
    extends_bitmap_v4: RefCell<bool>,
    f_extends_bitmap_v5: Cell<bool>,
    extends_bitmap_v5: RefCell<bool>,
    f_extends_os2_2x_bitmap: Cell<bool>,
    extends_os2_2x_bitmap: RefCell<bool>,
    f_image_height: Cell<bool>,
    image_height: RefCell<i32>,
    f_is_color_mask_here: Cell<bool>,
    is_color_mask_here: RefCell<bool>,
    f_is_core_header: Cell<bool>,
    is_core_header: RefCell<bool>,
    f_uses_fixed_palette: Cell<bool>,
    uses_fixed_palette: RefCell<bool>,
}
#[derive(Debug, Clone)]
pub enum Bmp_BitmapHeader_ImageWidth {
    U4(u32),
    U2(u16),
}
impl From<u32> for Bmp_BitmapHeader_ImageWidth {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&Bmp_BitmapHeader_ImageWidth> for u32 {
    fn from(e: &Bmp_BitmapHeader_ImageWidth) -> Self {
        if let Bmp_BitmapHeader_ImageWidth::U4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Bmp_BitmapHeader_ImageWidth::U4 to u32, enum value {:?}", e)
    }
}
impl From<u16> for Bmp_BitmapHeader_ImageWidth {
    fn from(v: u16) -> Self {
        Self::U2(v)
    }
}
impl From<&Bmp_BitmapHeader_ImageWidth> for u16 {
    fn from(e: &Bmp_BitmapHeader_ImageWidth) -> Self {
        if let Bmp_BitmapHeader_ImageWidth::U2(v) = e {
            return *v
        }
        panic!("trying to convert from enum Bmp_BitmapHeader_ImageWidth::U2 to u16, enum value {:?}", e)
    }
}
impl From<&Bmp_BitmapHeader_ImageWidth> for usize {
    fn from(e: &Bmp_BitmapHeader_ImageWidth) -> Self {
        match e {
            Bmp_BitmapHeader_ImageWidth::U4(v) => *v as usize,
            Bmp_BitmapHeader_ImageWidth::U2(v) => *v as usize,
        }
    }
}

#[derive(Debug, Clone)]
pub enum Bmp_BitmapHeader_ImageHeightRaw {
    S4(i32),
    S2(i16),
}
impl From<i32> for Bmp_BitmapHeader_ImageHeightRaw {
    fn from(v: i32) -> Self {
        Self::S4(v)
    }
}
impl From<&Bmp_BitmapHeader_ImageHeightRaw> for i32 {
    fn from(e: &Bmp_BitmapHeader_ImageHeightRaw) -> Self {
        if let Bmp_BitmapHeader_ImageHeightRaw::S4(v) = e {
            return *v
        }
        panic!("trying to convert from enum Bmp_BitmapHeader_ImageHeightRaw::S4 to i32, enum value {:?}", e)
    }
}
impl From<i16> for Bmp_BitmapHeader_ImageHeightRaw {
    fn from(v: i16) -> Self {
        Self::S2(v)
    }
}
impl From<&Bmp_BitmapHeader_ImageHeightRaw> for i16 {
    fn from(e: &Bmp_BitmapHeader_ImageHeightRaw) -> Self {
        if let Bmp_BitmapHeader_ImageHeightRaw::S2(v) = e {
            return *v
        }
        panic!("trying to convert from enum Bmp_BitmapHeader_ImageHeightRaw::S2 to i16, enum value {:?}", e)
    }
}
impl From<&Bmp_BitmapHeader_ImageHeightRaw> for usize {
    fn from(e: &Bmp_BitmapHeader_ImageHeightRaw) -> Self {
        match e {
            Bmp_BitmapHeader_ImageHeightRaw::S4(v) => *v as usize,
            Bmp_BitmapHeader_ImageHeightRaw::S2(v) => *v as usize,
        }
    }
}

impl KStruct for Bmp_BitmapHeader {
    type Root = Bmp;
    type Parent = Bmp_BitmapInfo;

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
        {
            let on = self_rc.is_core_header()?;
            if *on == false {
                *self_rc.image_width.borrow_mut() = Some(_io.read_u4le()?.into());
            }
            else if *on == true {
                *self_rc.image_width.borrow_mut() = Some(_io.read_u2le()?.into());
            }
        }
        {
            let on = self_rc.is_core_header()?;
            if *on == false {
                *self_rc.image_height_raw.borrow_mut() = Some(_io.read_s4le()?.into());
            }
            else if *on == true {
                *self_rc.image_height_raw.borrow_mut() = Some(_io.read_s2le()?.into());
            }
        }
        *self_rc.num_planes.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.bits_per_pixel.borrow_mut() = _io.read_u2le()?.into();
        if *self_rc.extends_bitmap_info()? {
            let t = Self::read_into::<_, Bmp_BitmapInfoExtension>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.bitmap_info_ext.borrow_mut() = t;
        }
        if *self_rc.is_color_mask_here()? {
            let f = |t : &mut Bmp_ColorMask| Ok(t.set_params(((*self_rc.len_header() as i32) != (i64::from(&Bmp_HeaderType::BitmapV2InfoHeader) as i32))));
            let t = Self::read_into_with_init::<_, Bmp_ColorMask>(&*_io, Some(self_rc._root.clone()), None, &f)?.into();
            *self_rc.color_mask.borrow_mut() = t;
        }
        if *self_rc.extends_os2_2x_bitmap()? {
            let t = Self::read_into::<_, Bmp_Os22xBitmapExtension>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.os2_2x_bitmap_ext.borrow_mut() = t;
        }
        if *self_rc.extends_bitmap_v4()? {
            let t = Self::read_into::<_, Bmp_BitmapV4Extension>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.bitmap_v4_ext.borrow_mut() = t;
        }
        if *self_rc.extends_bitmap_v5()? {
            let t = Self::read_into::<_, Bmp_BitmapV5Extension>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.bitmap_v5_ext.borrow_mut() = t;
        }
        Ok(())
    }
}
impl Bmp_BitmapHeader {
    pub fn len_header(&self) -> Ref<'_, u32> {
        self.len_header.borrow()
    }
}
impl Bmp_BitmapHeader {
    pub fn set_params(&mut self, len_header: u32) {
        *self.len_header.borrow_mut() = len_header;
    }
}
impl Bmp_BitmapHeader {
    pub fn bottom_up(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_bottom_up.get() {
            return Ok(self.bottom_up.borrow());
        }
        self.f_bottom_up.set(true);
        *self.bottom_up.borrow_mut() = (((self.image_height_raw() as i32) > (0 as i32))) as bool;
        Ok(self.bottom_up.borrow())
    }
    pub fn extends_bitmap_info(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_extends_bitmap_info.get() {
            return Ok(self.extends_bitmap_info.borrow());
        }
        self.f_extends_bitmap_info.set(true);
        *self.extends_bitmap_info.borrow_mut() = (((*self.len_header() as i32) >= (i64::from(&Bmp_HeaderType::BitmapInfoHeader) as i32))) as bool;
        Ok(self.extends_bitmap_info.borrow())
    }
    pub fn extends_bitmap_v4(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_extends_bitmap_v4.get() {
            return Ok(self.extends_bitmap_v4.borrow());
        }
        self.f_extends_bitmap_v4.set(true);
        *self.extends_bitmap_v4.borrow_mut() = (((*self.len_header() as i32) >= (i64::from(&Bmp_HeaderType::BitmapV4Header) as i32))) as bool;
        Ok(self.extends_bitmap_v4.borrow())
    }
    pub fn extends_bitmap_v5(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_extends_bitmap_v5.get() {
            return Ok(self.extends_bitmap_v5.borrow());
        }
        self.f_extends_bitmap_v5.set(true);
        *self.extends_bitmap_v5.borrow_mut() = (((*self.len_header() as i32) >= (i64::from(&Bmp_HeaderType::BitmapV5Header) as i32))) as bool;
        Ok(self.extends_bitmap_v5.borrow())
    }
    pub fn extends_os2_2x_bitmap(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_extends_os2_2x_bitmap.get() {
            return Ok(self.extends_os2_2x_bitmap.borrow());
        }
        self.f_extends_os2_2x_bitmap.set(true);
        *self.extends_os2_2x_bitmap.borrow_mut() = (((*self.len_header() as i32) == (i64::from(&Bmp_HeaderType::Os22xBitmapHeader) as i32))) as bool;
        Ok(self.extends_os2_2x_bitmap.borrow())
    }
    pub fn image_height(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_image_height.get() {
            return Ok(self.image_height.borrow());
        }
        self.f_image_height.set(true);
        *self.image_height.borrow_mut() = (if ((self.image_height_raw() as i32) < (0 as i32)) { -(self.image_height_raw()) } else { self.image_height_raw() }) as i32;
        Ok(self.image_height.borrow())
    }
    pub fn is_color_mask_here(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_color_mask_here.get() {
            return Ok(self.is_color_mask_here.borrow());
        }
        self.f_is_color_mask_here.set(true);
        *self.is_color_mask_here.borrow_mut() = ( ((((*self.len_header() as i32) == (i64::from(&Bmp_HeaderType::BitmapV2InfoHeader) as i32))) || (((*self.len_header() as i32) == (i64::from(&Bmp_HeaderType::BitmapV3InfoHeader) as i32))) || (*self.extends_bitmap_v4()?)) ) as bool;
        Ok(self.is_color_mask_here.borrow())
    }
    pub fn is_core_header(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_core_header.get() {
            return Ok(self.is_core_header.borrow());
        }
        self.f_is_core_header.set(true);
        *self.is_core_header.borrow_mut() = (((*self.len_header() as i32) == (i64::from(&Bmp_HeaderType::BitmapCoreHeader) as i32))) as bool;
        Ok(self.is_core_header.borrow())
    }
    pub fn uses_fixed_palette(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_uses_fixed_palette.get() {
            return Ok(self.uses_fixed_palette.borrow());
        }
        self.f_uses_fixed_palette.set(true);
        *self.uses_fixed_palette.borrow_mut() = ( ((!( ((((*self.bits_per_pixel() as u16) == (16 as u16))) || (((*self.bits_per_pixel() as u16) == (24 as u16))) || (((*self.bits_per_pixel() as u16) == (32 as u16)))) )) && (!( ((*self.extends_bitmap_info()?) && (!(*self.extends_os2_2x_bitmap()?)) && ( ((*self.bitmap_info_ext().compression() == Bmp_Compressions::Jpeg) || (*self.bitmap_info_ext().compression() == Bmp_Compressions::Png)) )) ))) ) as bool;
        Ok(self.uses_fixed_palette.borrow())
    }
}

/**
 * Image width, px
 */
impl Bmp_BitmapHeader {
    pub fn image_width(&self) -> usize {
        self.image_width.borrow().as_ref().unwrap().into()
    }
    pub fn image_width_enum(&self) -> Ref<'_, Option<Bmp_BitmapHeader_ImageWidth>> {
        self.image_width.borrow()
    }
}

/**
 * Image height, px (positive => bottom-up image, negative => top-down image)
 */
impl Bmp_BitmapHeader {
    pub fn image_height_raw(&self) -> usize {
        self.image_height_raw.borrow().as_ref().unwrap().into()
    }
    pub fn image_height_raw_enum(&self) -> Ref<'_, Option<Bmp_BitmapHeader_ImageHeightRaw>> {
        self.image_height_raw.borrow()
    }
}

/**
 * Number of planes for target device, must be 1
 */
impl Bmp_BitmapHeader {
    pub fn num_planes(&self) -> Ref<'_, u16> {
        self.num_planes.borrow()
    }
}

/**
 * Number of bits per pixel that image buffer uses (1, 4, 8, 16, 24 or 32)
 */
impl Bmp_BitmapHeader {
    pub fn bits_per_pixel(&self) -> Ref<'_, u16> {
        self.bits_per_pixel.borrow()
    }
}
impl Bmp_BitmapHeader {
    pub fn bitmap_info_ext(&self) -> Ref<'_, OptRc<Bmp_BitmapInfoExtension>> {
        self.bitmap_info_ext.borrow()
    }
}
impl Bmp_BitmapHeader {
    pub fn color_mask(&self) -> Ref<'_, OptRc<Bmp_ColorMask>> {
        self.color_mask.borrow()
    }
}
impl Bmp_BitmapHeader {
    pub fn os2_2x_bitmap_ext(&self) -> Ref<'_, OptRc<Bmp_Os22xBitmapExtension>> {
        self.os2_2x_bitmap_ext.borrow()
    }
}
impl Bmp_BitmapHeader {
    pub fn bitmap_v4_ext(&self) -> Ref<'_, OptRc<Bmp_BitmapV4Extension>> {
        self.bitmap_v4_ext.borrow()
    }
}
impl Bmp_BitmapHeader {
    pub fn bitmap_v5_ext(&self) -> Ref<'_, OptRc<Bmp_BitmapV5Extension>> {
        self.bitmap_v5_ext.borrow()
    }
}
impl Bmp_BitmapHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapinfo Source
 */

#[derive(Default, Debug, Clone)]
pub struct Bmp_BitmapInfo {
    pub _root: SharedType<Bmp>,
    pub _parent: SharedType<Bmp>,
    pub _self: SharedType<Self>,
    len_header: RefCell<u32>,
    header: RefCell<OptRc<Bmp_BitmapHeader>>,
    color_mask: RefCell<OptRc<Bmp_ColorMask>>,
    color_table: RefCell<OptRc<Bmp_ColorTable>>,
    _io: RefCell<BytesReader>,
    header_raw: RefCell<Vec<u8>>,
    color_table_raw: RefCell<Vec<u8>>,
    f_color_mask_alpha: Cell<bool>,
    color_mask_alpha: RefCell<u32>,
    f_color_mask_blue: Cell<bool>,
    color_mask_blue: RefCell<u32>,
    f_color_mask_given: Cell<bool>,
    color_mask_given: RefCell<OptRc<Bmp_ColorMask>>,
    f_color_mask_green: Cell<bool>,
    color_mask_green: RefCell<i32>,
    f_color_mask_red: Cell<bool>,
    color_mask_red: RefCell<i32>,
    f_is_color_mask_given: Cell<bool>,
    is_color_mask_given: RefCell<bool>,
    f_is_color_mask_here: Cell<bool>,
    is_color_mask_here: RefCell<bool>,
}
impl KStruct for Bmp_BitmapInfo {
    type Root = Bmp;
    type Parent = Bmp;

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
        *self_rc.len_header.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.header_raw.borrow_mut() = _io.read_bytes(((*self_rc.len_header() as i32) - (4 as i32)) as usize)?.into();
        let header_raw = self_rc.header_raw.borrow();
        let _t_header_raw_io = BytesReader::from(header_raw.clone());
        let f = |t : &mut Bmp_BitmapHeader| Ok(t.set_params((*self_rc.len_header()).try_into().map_err(|_| KError::CastError)?));
        let t = Self::read_into_with_init::<BytesReader, Bmp_BitmapHeader>(&_t_header_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
        *self_rc.header.borrow_mut() = t;
        if *self_rc.is_color_mask_here()? {
            let f = |t : &mut Bmp_ColorMask| Ok(t.set_params(*self_rc.header().bitmap_info_ext().compression() == Bmp_Compressions::AlphaBitfields));
            let t = Self::read_into_with_init::<_, Bmp_ColorMask>(&*_io, Some(self_rc._root.clone()), None, &f)?.into();
            *self_rc.color_mask.borrow_mut() = t;
        }
        if !(_io.is_eof()) {
            *self_rc.color_table_raw.borrow_mut() = _io.read_bytes_full()?.into();
            let color_table_raw = self_rc.color_table_raw.borrow();
            let _t_color_table_raw_io = BytesReader::from(color_table_raw.clone());
            let f = |t : &mut Bmp_ColorTable| Ok(t.set_params(!(*self_rc.header().is_core_header()?), (if *self_rc.header().extends_bitmap_info()? { *self_rc.header().bitmap_info_ext().num_colors_used() } else { 0 }).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<BytesReader, Bmp_ColorTable>(&_t_color_table_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            *self_rc.color_table.borrow_mut() = t;
        }
        Ok(())
    }
}
impl Bmp_BitmapInfo {
    pub fn color_mask_alpha(
        &self
    ) -> KResult<Ref<'_, u32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_color_mask_alpha.get() {
            return Ok(self.color_mask_alpha.borrow());
        }
        self.f_color_mask_alpha.set(true);
        *self.color_mask_alpha.borrow_mut() = (if  ((*self.is_color_mask_given()?) && (*self.color_mask_given()?.has_alpha_mask()))  { *self.color_mask_given()?.alpha_mask() } else { 0 }) as u32;
        Ok(self.color_mask_alpha.borrow())
    }
    pub fn color_mask_blue(
        &self
    ) -> KResult<Ref<'_, u32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_color_mask_blue.get() {
            return Ok(self.color_mask_blue.borrow());
        }
        self.f_color_mask_blue.set(true);
        *self.color_mask_blue.borrow_mut() = (if *self.is_color_mask_given()? { *self.color_mask_given()?.blue_mask() } else { if ((*self.header().bits_per_pixel() as u16) == (16 as u16)) { 31 } else { if  ((((*self.header().bits_per_pixel() as u16) == (24 as u16))) || (((*self.header().bits_per_pixel() as u16) == (32 as u16))))  { 255 } else { 0 } } }) as u32;
        Ok(self.color_mask_blue.borrow())
    }
    pub fn color_mask_given(
        &self
    ) -> KResult<Ref<'_, OptRc<Bmp_ColorMask>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_color_mask_given.get() {
            return Ok(self.color_mask_given.borrow());
        }
        if *self.is_color_mask_given()? {
            *self.color_mask_given.borrow_mut() = if *self.is_color_mask_here()? { self.color_mask().clone() } else { self.header().color_mask().clone() }.clone();
        }
        Ok(self.color_mask_given.borrow())
    }
    pub fn color_mask_green(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_color_mask_green.get() {
            return Ok(self.color_mask_green.borrow());
        }
        self.f_color_mask_green.set(true);
        *self.color_mask_green.borrow_mut() = (if *self.is_color_mask_given()? { *self.color_mask_given()?.green_mask() } else { if ((*self.header().bits_per_pixel() as u16) == (16 as u16)) { 992 } else { if  ((((*self.header().bits_per_pixel() as u16) == (24 as u16))) || (((*self.header().bits_per_pixel() as u16) == (32 as u16))))  { 65280 } else { 0 } } }) as i32;
        Ok(self.color_mask_green.borrow())
    }
    pub fn color_mask_red(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_color_mask_red.get() {
            return Ok(self.color_mask_red.borrow());
        }
        self.f_color_mask_red.set(true);
        *self.color_mask_red.borrow_mut() = (if *self.is_color_mask_given()? { *self.color_mask_given()?.red_mask() } else { if ((*self.header().bits_per_pixel() as u16) == (16 as u16)) { 31744 } else { if  ((((*self.header().bits_per_pixel() as u16) == (24 as u16))) || (((*self.header().bits_per_pixel() as u16) == (32 as u16))))  { 16711680 } else { 0 } } }) as i32;
        Ok(self.color_mask_red.borrow())
    }
    pub fn is_color_mask_given(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_color_mask_given.get() {
            return Ok(self.is_color_mask_given.borrow());
        }
        self.f_is_color_mask_given.set(true);
        *self.is_color_mask_given.borrow_mut() = ( ((*self.header().extends_bitmap_info()?) && ( ((*self.header().bitmap_info_ext().compression() == Bmp_Compressions::Bitfields) || (*self.header().bitmap_info_ext().compression() == Bmp_Compressions::AlphaBitfields)) ) && ( ((*self.is_color_mask_here()?) || (*self.header().is_color_mask_here()?)) )) ) as bool;
        Ok(self.is_color_mask_given.borrow())
    }
    pub fn is_color_mask_here(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_color_mask_here.get() {
            return Ok(self.is_color_mask_here.borrow());
        }
        self.f_is_color_mask_here.set(true);
        *self.is_color_mask_here.borrow_mut() = ( ((!(_io.is_eof())) && (((*self.header().len_header() as i32) == (i64::from(&Bmp_HeaderType::BitmapInfoHeader) as i32))) && ( ((*self.header().bitmap_info_ext().compression() == Bmp_Compressions::Bitfields) || (*self.header().bitmap_info_ext().compression() == Bmp_Compressions::AlphaBitfields)) )) ) as bool;
        Ok(self.is_color_mask_here.borrow())
    }
}
impl Bmp_BitmapInfo {
    pub fn len_header(&self) -> Ref<'_, u32> {
        self.len_header.borrow()
    }
}
impl Bmp_BitmapInfo {
    pub fn header(&self) -> Ref<'_, OptRc<Bmp_BitmapHeader>> {
        self.header.borrow()
    }
}

/**
 * Valid only for BITMAPINFOHEADER, in all headers extending it the masks are contained in the header itself.
 */
impl Bmp_BitmapInfo {
    pub fn color_mask(&self) -> Ref<'_, OptRc<Bmp_ColorMask>> {
        self.color_mask.borrow()
    }
}
impl Bmp_BitmapInfo {
    pub fn color_table(&self) -> Ref<'_, OptRc<Bmp_ColorTable>> {
        self.color_table.borrow()
    }
}
impl Bmp_BitmapInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Bmp_BitmapInfo {
    pub fn header_raw(&self) -> Ref<'_, Vec<u8>> {
        self.header_raw.borrow()
    }
}
impl Bmp_BitmapInfo {
    pub fn color_table_raw(&self) -> Ref<'_, Vec<u8>> {
        self.color_table_raw.borrow()
    }
}

/**
 * \sa https://learn.microsoft.com/en-us/previous-versions/dd183376(v=vs.85) Source
 */

#[derive(Default, Debug, Clone)]
pub struct Bmp_BitmapInfoExtension {
    pub _root: SharedType<Bmp>,
    pub _parent: SharedType<Bmp_BitmapHeader>,
    pub _self: SharedType<Self>,
    compression: RefCell<Bmp_Compressions>,
    os2_compression: RefCell<Bmp_Os2Compressions>,
    len_image: RefCell<u32>,
    x_resolution: RefCell<u32>,
    y_resolution: RefCell<u32>,
    num_colors_used: RefCell<u32>,
    num_colors_important: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Bmp_BitmapInfoExtension {
    type Root = Bmp;
    type Parent = Bmp_BitmapHeader;

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
        if !(*_prc.as_ref().unwrap().extends_os2_2x_bitmap()?) {
            *self_rc.compression.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        }
        if *_prc.as_ref().unwrap().extends_os2_2x_bitmap()? {
            *self_rc.os2_compression.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        }
        *self_rc.len_image.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.x_resolution.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.y_resolution.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_colors_used.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_colors_important.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Bmp_BitmapInfoExtension {
}
impl Bmp_BitmapInfoExtension {
    pub fn compression(&self) -> Ref<'_, Bmp_Compressions> {
        self.compression.borrow()
    }
}
impl Bmp_BitmapInfoExtension {
    pub fn os2_compression(&self) -> Ref<'_, Bmp_Os2Compressions> {
        self.os2_compression.borrow()
    }
}

/**
 * If biCompression is BI_JPEG or BI_PNG, indicates the size of the JPEG or PNG image buffer.
 * This may be set to zero for BI_RGB bitmaps.
 */
impl Bmp_BitmapInfoExtension {
    pub fn len_image(&self) -> Ref<'_, u32> {
        self.len_image.borrow()
    }
}
impl Bmp_BitmapInfoExtension {
    pub fn x_resolution(&self) -> Ref<'_, u32> {
        self.x_resolution.borrow()
    }
}
impl Bmp_BitmapInfoExtension {
    pub fn y_resolution(&self) -> Ref<'_, u32> {
        self.y_resolution.borrow()
    }
}
impl Bmp_BitmapInfoExtension {
    pub fn num_colors_used(&self) -> Ref<'_, u32> {
        self.num_colors_used.borrow()
    }
}
impl Bmp_BitmapInfoExtension {
    pub fn num_colors_important(&self) -> Ref<'_, u32> {
        self.num_colors_important.borrow()
    }
}
impl Bmp_BitmapInfoExtension {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapv4header Source
 */

#[derive(Default, Debug, Clone)]
pub struct Bmp_BitmapV4Extension {
    pub _root: SharedType<Bmp>,
    pub _parent: SharedType<Bmp_BitmapHeader>,
    pub _self: SharedType<Self>,
    color_space_type: RefCell<Bmp_ColorSpace>,
    endpoint_red: RefCell<OptRc<Bmp_CieXyz>>,
    endpoint_green: RefCell<OptRc<Bmp_CieXyz>>,
    endpoint_blue: RefCell<OptRc<Bmp_CieXyz>>,
    gamma_red: RefCell<OptRc<Bmp_FixedPoint16Dot16>>,
    gamma_blue: RefCell<OptRc<Bmp_FixedPoint16Dot16>>,
    gamma_green: RefCell<OptRc<Bmp_FixedPoint16Dot16>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Bmp_BitmapV4Extension {
    type Root = Bmp;
    type Parent = Bmp_BitmapHeader;

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
        *self_rc.color_space_type.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        let t = Self::read_into::<_, Bmp_CieXyz>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.endpoint_red.borrow_mut() = t;
        let t = Self::read_into::<_, Bmp_CieXyz>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.endpoint_green.borrow_mut() = t;
        let t = Self::read_into::<_, Bmp_CieXyz>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.endpoint_blue.borrow_mut() = t;
        let t = Self::read_into::<_, Bmp_FixedPoint16Dot16>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.gamma_red.borrow_mut() = t;
        let t = Self::read_into::<_, Bmp_FixedPoint16Dot16>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.gamma_blue.borrow_mut() = t;
        let t = Self::read_into::<_, Bmp_FixedPoint16Dot16>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.gamma_green.borrow_mut() = t;
        Ok(())
    }
}
impl Bmp_BitmapV4Extension {
}
impl Bmp_BitmapV4Extension {
    pub fn color_space_type(&self) -> Ref<'_, Bmp_ColorSpace> {
        self.color_space_type.borrow()
    }
}
impl Bmp_BitmapV4Extension {
    pub fn endpoint_red(&self) -> Ref<'_, OptRc<Bmp_CieXyz>> {
        self.endpoint_red.borrow()
    }
}
impl Bmp_BitmapV4Extension {
    pub fn endpoint_green(&self) -> Ref<'_, OptRc<Bmp_CieXyz>> {
        self.endpoint_green.borrow()
    }
}
impl Bmp_BitmapV4Extension {
    pub fn endpoint_blue(&self) -> Ref<'_, OptRc<Bmp_CieXyz>> {
        self.endpoint_blue.borrow()
    }
}
impl Bmp_BitmapV4Extension {
    pub fn gamma_red(&self) -> Ref<'_, OptRc<Bmp_FixedPoint16Dot16>> {
        self.gamma_red.borrow()
    }
}
impl Bmp_BitmapV4Extension {
    pub fn gamma_blue(&self) -> Ref<'_, OptRc<Bmp_FixedPoint16Dot16>> {
        self.gamma_blue.borrow()
    }
}
impl Bmp_BitmapV4Extension {
    pub fn gamma_green(&self) -> Ref<'_, OptRc<Bmp_FixedPoint16Dot16>> {
        self.gamma_green.borrow()
    }
}
impl Bmp_BitmapV4Extension {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapv5header Source
 */

#[derive(Default, Debug, Clone)]
pub struct Bmp_BitmapV5Extension {
    pub _root: SharedType<Bmp>,
    pub _parent: SharedType<Bmp_BitmapHeader>,
    pub _self: SharedType<Self>,
    intent: RefCell<Bmp_Intent>,
    ofs_profile: RefCell<u32>,
    len_profile: RefCell<u32>,
    reserved: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_has_profile: Cell<bool>,
    has_profile: RefCell<bool>,
    f_profile_data: Cell<bool>,
    profile_data: RefCell<Option<Bmp_BitmapV5Extension_ProfileData>>,
}
#[derive(Debug, Clone)]
pub enum Bmp_BitmapV5Extension_ProfileData {
    String(String),
    Bytes(Vec<u8>),
}
impl From<&Bmp_BitmapV5Extension_ProfileData> for String {
    fn from(v: &Bmp_BitmapV5Extension_ProfileData) -> Self {
        if let Bmp_BitmapV5Extension_ProfileData::String(x) = v {
            return x.clone();
        }
        panic!("expected Bmp_BitmapV5Extension_ProfileData::String, got {:?}", v)
    }
}
impl From<String> for Bmp_BitmapV5Extension_ProfileData {
    fn from(v: String) -> Self {
        Self::String(v)
    }
}
impl From<&Bmp_BitmapV5Extension_ProfileData> for Vec<u8> {
    fn from(v: &Bmp_BitmapV5Extension_ProfileData) -> Self {
        if let Bmp_BitmapV5Extension_ProfileData::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected Bmp_BitmapV5Extension_ProfileData::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for Bmp_BitmapV5Extension_ProfileData {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl KStruct for Bmp_BitmapV5Extension {
    type Root = Bmp;
    type Parent = Bmp_BitmapHeader;

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
        *self_rc.intent.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        *self_rc.ofs_profile.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len_profile.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Bmp_BitmapV5Extension {
    pub fn has_profile(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_profile.get() {
            return Ok(self.has_profile.borrow());
        }
        self.f_has_profile.set(true);
        *self.has_profile.borrow_mut() = ( ((*_prc.as_ref().unwrap().bitmap_v4_ext().color_space_type() == Bmp_ColorSpace::ProfileLinked) || (*_prc.as_ref().unwrap().bitmap_v4_ext().color_space_type() == Bmp_ColorSpace::ProfileEmbedded)) ) as bool;
        Ok(self.has_profile.borrow())
    }

    /**
     * \sa https://learn.microsoft.com/en-us/windows/win32/wcs/using-structures-in-wcs-1-0 "If the profile is embedded, profile data is the actual profile, and if it is linked, the profile data is the null-terminated file name of the profile. This cannot be a Unicode string. It must be composed exclusively of characters from the Windows character set (code page 1252)."
     */
    pub fn profile_data(
        &self
    ) -> KResult<Ref<'_, Option<Bmp_BitmapV5Extension_ProfileData>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_profile_data.get() {
            return Ok(self.profile_data.borrow());
        }
        self.f_profile_data.set(true);
        if *self.has_profile()? {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(((14 as i32) + (*self.ofs_profile() as i32)) as usize)?;
            {
                let on = _prc.as_ref().unwrap().bitmap_v4_ext().color_space_type() == Bmp_ColorSpace::ProfileLinked;
                if *on == true {
                    *self.profile_data.borrow_mut() = Some(bytes_to_str(&bytes_terminate(&io.read_bytes(*self.len_profile() as usize)?.into(), 0, false).into(), "windows-1252")?);
                }
                else {
                    *self.profile_data.borrow_mut() = Some(io.read_bytes(*self.len_profile() as usize)?.into());
                }
            }
            io.seek(_pos)?;
        }
        Ok(self.profile_data.borrow())
    }
}
impl Bmp_BitmapV5Extension {
    pub fn intent(&self) -> Ref<'_, Bmp_Intent> {
        self.intent.borrow()
    }
}

/**
 * The offset, in bytes, from the beginning of the BITMAPV5HEADER structure to the start of the profile data.
 */
impl Bmp_BitmapV5Extension {
    pub fn ofs_profile(&self) -> Ref<'_, u32> {
        self.ofs_profile.borrow()
    }
}
impl Bmp_BitmapV5Extension {
    pub fn len_profile(&self) -> Ref<'_, u32> {
        self.len_profile.borrow()
    }
}
impl Bmp_BitmapV5Extension {
    pub fn reserved(&self) -> Ref<'_, u32> {
        self.reserved.borrow()
    }
}
impl Bmp_BitmapV5Extension {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-ciexyz Source
 */

#[derive(Default, Debug, Clone)]
pub struct Bmp_CieXyz {
    pub _root: SharedType<Bmp>,
    pub _parent: SharedType<Bmp_BitmapV4Extension>,
    pub _self: SharedType<Self>,
    x: RefCell<OptRc<Bmp_FixedPoint2Dot30>>,
    y: RefCell<OptRc<Bmp_FixedPoint2Dot30>>,
    z: RefCell<OptRc<Bmp_FixedPoint2Dot30>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Bmp_CieXyz {
    type Root = Bmp;
    type Parent = Bmp_BitmapV4Extension;

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
        let t = Self::read_into::<_, Bmp_FixedPoint2Dot30>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.x.borrow_mut() = t;
        let t = Self::read_into::<_, Bmp_FixedPoint2Dot30>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.y.borrow_mut() = t;
        let t = Self::read_into::<_, Bmp_FixedPoint2Dot30>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.z.borrow_mut() = t;
        Ok(())
    }
}
impl Bmp_CieXyz {
}
impl Bmp_CieXyz {
    pub fn x(&self) -> Ref<'_, OptRc<Bmp_FixedPoint2Dot30>> {
        self.x.borrow()
    }
}
impl Bmp_CieXyz {
    pub fn y(&self) -> Ref<'_, OptRc<Bmp_FixedPoint2Dot30>> {
        self.y.borrow()
    }
}
impl Bmp_CieXyz {
    pub fn z(&self) -> Ref<'_, OptRc<Bmp_FixedPoint2Dot30>> {
        self.z.borrow()
    }
}
impl Bmp_CieXyz {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Bmp_ColorMask {
    pub _root: SharedType<Bmp>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    has_alpha_mask: RefCell<bool>,
    red_mask: RefCell<u32>,
    green_mask: RefCell<u32>,
    blue_mask: RefCell<u32>,
    alpha_mask: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Bmp_ColorMask {
    type Root = Bmp;
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
        *self_rc.red_mask.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.green_mask.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.blue_mask.borrow_mut() = _io.read_u4le()?.into();
        if *self_rc.has_alpha_mask() {
            *self_rc.alpha_mask.borrow_mut() = _io.read_u4le()?.into();
        }
        Ok(())
    }
}
impl Bmp_ColorMask {
    pub fn has_alpha_mask(&self) -> Ref<'_, bool> {
        self.has_alpha_mask.borrow()
    }
}
impl Bmp_ColorMask {
    pub fn set_params(&mut self, has_alpha_mask: bool) {
        *self.has_alpha_mask.borrow_mut() = has_alpha_mask;
    }
}
impl Bmp_ColorMask {
}
impl Bmp_ColorMask {
    pub fn red_mask(&self) -> Ref<'_, u32> {
        self.red_mask.borrow()
    }
}
impl Bmp_ColorMask {
    pub fn green_mask(&self) -> Ref<'_, u32> {
        self.green_mask.borrow()
    }
}
impl Bmp_ColorMask {
    pub fn blue_mask(&self) -> Ref<'_, u32> {
        self.blue_mask.borrow()
    }
}
impl Bmp_ColorMask {
    pub fn alpha_mask(&self) -> Ref<'_, u32> {
        self.alpha_mask.borrow()
    }
}
impl Bmp_ColorMask {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Bmp_ColorTable {
    pub _root: SharedType<Bmp>,
    pub _parent: SharedType<Bmp_BitmapInfo>,
    pub _self: SharedType<Self>,
    has_reserved_field: RefCell<bool>,
    num_colors: RefCell<u32>,
    colors: RefCell<Vec<OptRc<Bmp_RgbRecord>>>,
    _io: RefCell<BytesReader>,
    f_num_colors_present: Cell<bool>,
    num_colors_present: RefCell<i32>,
}
impl KStruct for Bmp_ColorTable {
    type Root = Bmp;
    type Parent = Bmp_BitmapInfo;

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
        *self_rc.colors.borrow_mut() = Vec::new();
        let l_colors = if  ((((*self_rc.num_colors() as u32) > (0 as u32))) && (((*self_rc.num_colors() as i32) < (*self_rc.num_colors_present()? as i32))))  { *self_rc.num_colors() } else { *self_rc.num_colors_present()? };
        for _i in 0..l_colors {
            let f = |t : &mut Bmp_RgbRecord| Ok(t.set_params(*self_rc.has_reserved_field()));
            let t = Self::read_into_with_init::<_, Bmp_RgbRecord>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            self_rc.colors.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Bmp_ColorTable {
    pub fn has_reserved_field(&self) -> Ref<'_, bool> {
        self.has_reserved_field.borrow()
    }
}
impl Bmp_ColorTable {
    pub fn num_colors(&self) -> Ref<'_, u32> {
        self.num_colors.borrow()
    }
}
impl Bmp_ColorTable {
    pub fn set_params(&mut self, has_reserved_field: bool, num_colors: u32) {
        *self.has_reserved_field.borrow_mut() = has_reserved_field;
        *self.num_colors.borrow_mut() = num_colors;
    }
}
impl Bmp_ColorTable {
    pub fn num_colors_present(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_colors_present.get() {
            return Ok(self.num_colors_present.borrow());
        }
        self.f_num_colors_present.set(true);
        *self.num_colors_present.borrow_mut() = (((_io.size() as i32) / (if *self.has_reserved_field() { 4 } else { 3 } as i32))) as i32;
        Ok(self.num_colors_present.borrow())
    }
}
impl Bmp_ColorTable {
    pub fn colors(&self) -> Ref<'_, Vec<OptRc<Bmp_RgbRecord>>> {
        self.colors.borrow()
    }
}
impl Bmp_ColorTable {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-bitmapfileheader Source
 */

#[derive(Default, Debug, Clone)]
pub struct Bmp_FileHeader {
    pub _root: SharedType<Bmp>,
    pub _parent: SharedType<Bmp>,
    pub _self: SharedType<Self>,
    file_type: RefCell<Vec<u8>>,
    len_file: RefCell<u32>,
    reserved1: RefCell<u16>,
    reserved2: RefCell<u16>,
    ofs_bitmap: RefCell<i32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Bmp_FileHeader {
    type Root = Bmp;
    type Parent = Bmp;

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
        *self_rc.file_type.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.file_type() == vec![0x42u8, 0x4du8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/file_header/seq/0".to_string() }));
        }
        *self_rc.len_file.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.reserved1.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.reserved2.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.ofs_bitmap.borrow_mut() = _io.read_s4le()?.into();
        Ok(())
    }
}
impl Bmp_FileHeader {
}
impl Bmp_FileHeader {
    pub fn file_type(&self) -> Ref<'_, Vec<u8>> {
        self.file_type.borrow()
    }
}

/**
 * not reliable, mostly ignored by BMP decoders
 */
impl Bmp_FileHeader {
    pub fn len_file(&self) -> Ref<'_, u32> {
        self.len_file.borrow()
    }
}
impl Bmp_FileHeader {
    pub fn reserved1(&self) -> Ref<'_, u16> {
        self.reserved1.borrow()
    }
}
impl Bmp_FileHeader {
    pub fn reserved2(&self) -> Ref<'_, u16> {
        self.reserved2.borrow()
    }
}

/**
 * Offset to actual raw pixel data of the image
 */
impl Bmp_FileHeader {
    pub fn ofs_bitmap(&self) -> Ref<'_, i32> {
        self.ofs_bitmap.borrow()
    }
}
impl Bmp_FileHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Bmp_FixedPoint16Dot16 {
    pub _root: SharedType<Bmp>,
    pub _parent: SharedType<Bmp_BitmapV4Extension>,
    pub _self: SharedType<Self>,
    raw: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_value: Cell<bool>,
    value: RefCell<f64>,
}
impl KStruct for Bmp_FixedPoint16Dot16 {
    type Root = Bmp;
    type Parent = Bmp_BitmapV4Extension;

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
        *self_rc.raw.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Bmp_FixedPoint16Dot16 {
    pub fn value(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        self.f_value.set(true);
        *self.value.borrow_mut() = (((((*self.raw() as f64) + (0.0 as f64)) as f64) / ((1 << 16) as f64))) as f64;
        Ok(self.value.borrow())
    }
}
impl Bmp_FixedPoint16Dot16 {
    pub fn raw(&self) -> Ref<'_, u32> {
        self.raw.borrow()
    }
}
impl Bmp_FixedPoint16Dot16 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Bmp_FixedPoint2Dot30 {
    pub _root: SharedType<Bmp>,
    pub _parent: SharedType<Bmp_CieXyz>,
    pub _self: SharedType<Self>,
    raw: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_value: Cell<bool>,
    value: RefCell<f64>,
}
impl KStruct for Bmp_FixedPoint2Dot30 {
    type Root = Bmp;
    type Parent = Bmp_CieXyz;

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
        *self_rc.raw.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Bmp_FixedPoint2Dot30 {
    pub fn value(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        self.f_value.set(true);
        *self.value.borrow_mut() = (((((*self.raw() as f64) + (0.0 as f64)) as f64) / ((1 << 30) as f64))) as f64;
        Ok(self.value.borrow())
    }
}
impl Bmp_FixedPoint2Dot30 {
    pub fn raw(&self) -> Ref<'_, u32> {
        self.raw.borrow()
    }
}
impl Bmp_FixedPoint2Dot30 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://www.fileformat.info/format/os2bmp/egff.htm#OS2BMP-DMYID.3.2 Source
 */

#[derive(Default, Debug, Clone)]
pub struct Bmp_Os22xBitmapExtension {
    pub _root: SharedType<Bmp>,
    pub _parent: SharedType<Bmp_BitmapHeader>,
    pub _self: SharedType<Self>,
    units: RefCell<u16>,
    reserved: RefCell<u16>,
    recording: RefCell<u16>,
    rendering: RefCell<Bmp_Os2Rendering>,
    size1: RefCell<u32>,
    size2: RefCell<u32>,
    color_encoding: RefCell<u32>,
    identifier: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Bmp_Os22xBitmapExtension {
    type Root = Bmp;
    type Parent = Bmp_BitmapHeader;

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
        *self_rc.units.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.recording.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.rendering.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        *self_rc.size1.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.size2.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.color_encoding.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.identifier.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Bmp_Os22xBitmapExtension {
}
impl Bmp_Os22xBitmapExtension {
    pub fn units(&self) -> Ref<'_, u16> {
        self.units.borrow()
    }
}
impl Bmp_Os22xBitmapExtension {
    pub fn reserved(&self) -> Ref<'_, u16> {
        self.reserved.borrow()
    }
}

/**
 * Specifies how the bitmap scan lines are stored.
 * The only valid value for this field is 0, indicating that the bitmap is
 * stored from left to right and from the bottom up.
 */
impl Bmp_Os22xBitmapExtension {
    pub fn recording(&self) -> Ref<'_, u16> {
        self.recording.borrow()
    }
}

/**
 * Specifies the halftoning algorithm used on the bitmap data.
 */
impl Bmp_Os22xBitmapExtension {
    pub fn rendering(&self) -> Ref<'_, Bmp_Os2Rendering> {
        self.rendering.borrow()
    }
}

/**
 * rendering == os2_rendering::error_diffusion
 *   => error damping as a percentage in the range 0 through 100
 * rendering == os2_rendering::panda or rendering == os2_rendering::super_circle
 *   => X dimension of the pattern used in pixels
 */
impl Bmp_Os22xBitmapExtension {
    pub fn size1(&self) -> Ref<'_, u32> {
        self.size1.borrow()
    }
}

/**
 * rendering == os2_rendering::error_diffusion
 *   => not used
 * rendering == os2_rendering::panda or rendering == os2_rendering::super_circle
 *   => Y dimension of the pattern used in pixels
 */
impl Bmp_Os22xBitmapExtension {
    pub fn size2(&self) -> Ref<'_, u32> {
        self.size2.borrow()
    }
}

/**
 * Specifies the color model used to describe the bitmap data.
 * The only valid value is 0, indicating the RGB encoding scheme.
 */
impl Bmp_Os22xBitmapExtension {
    pub fn color_encoding(&self) -> Ref<'_, u32> {
        self.color_encoding.borrow()
    }
}

/**
 * Application-specific value
 */
impl Bmp_Os22xBitmapExtension {
    pub fn identifier(&self) -> Ref<'_, u32> {
        self.identifier.borrow()
    }
}
impl Bmp_Os22xBitmapExtension {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Bmp_RgbRecord {
    pub _root: SharedType<Bmp>,
    pub _parent: SharedType<Bmp_ColorTable>,
    pub _self: SharedType<Self>,
    has_reserved_field: RefCell<bool>,
    blue: RefCell<u8>,
    green: RefCell<u8>,
    red: RefCell<u8>,
    reserved: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Bmp_RgbRecord {
    type Root = Bmp;
    type Parent = Bmp_ColorTable;

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
        *self_rc.blue.borrow_mut() = _io.read_u1()?.into();
        *self_rc.green.borrow_mut() = _io.read_u1()?.into();
        *self_rc.red.borrow_mut() = _io.read_u1()?.into();
        if *self_rc.has_reserved_field() {
            *self_rc.reserved.borrow_mut() = _io.read_u1()?.into();
        }
        Ok(())
    }
}
impl Bmp_RgbRecord {
    pub fn has_reserved_field(&self) -> Ref<'_, bool> {
        self.has_reserved_field.borrow()
    }
}
impl Bmp_RgbRecord {
    pub fn set_params(&mut self, has_reserved_field: bool) {
        *self.has_reserved_field.borrow_mut() = has_reserved_field;
    }
}
impl Bmp_RgbRecord {
}
impl Bmp_RgbRecord {
    pub fn blue(&self) -> Ref<'_, u8> {
        self.blue.borrow()
    }
}
impl Bmp_RgbRecord {
    pub fn green(&self) -> Ref<'_, u8> {
        self.green.borrow()
    }
}
impl Bmp_RgbRecord {
    pub fn red(&self) -> Ref<'_, u8> {
        self.red.borrow()
    }
}
impl Bmp_RgbRecord {
    pub fn reserved(&self) -> Ref<'_, u8> {
        self.reserved.borrow()
    }
}
impl Bmp_RgbRecord {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

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
 * WMF (Windows Metafile) is a relatively early vector image format
 * introduced for Microsoft Windows in 1990.
 * 
 * Inside, it provides a serialized list of Windows GDI (Graphics
 * Device Interface) function calls, which, if played back, result in
 * an image being drawn on a given surface (display, off-screen buffer,
 * printer, etc).
 * \sa https://www.loc.gov/preservation/digital/formats/digformatspecs/WindowsMetafileFormat(wmf)Specification.pdf Source
 */

#[derive(Default, Debug, Clone)]
pub struct Wmf {
    pub _root: SharedType<Wmf>,
    pub _parent: SharedType<Wmf>,
    pub _self: SharedType<Self>,
    special_header: RefCell<OptRc<Wmf_SpecialHeader>>,
    header: RefCell<OptRc<Wmf_Header>>,
    records: RefCell<Vec<OptRc<Wmf_Record>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wmf {
    type Root = Wmf;
    type Parent = Wmf;

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
        let t = Self::read_into::<_, Wmf_SpecialHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.special_header.borrow_mut() = t;
        let t = Self::read_into::<_, Wmf_Header>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        *self_rc.records.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let t = Self::read_into::<_, Wmf_Record>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.records.borrow_mut().push(t);
                let _t_records = self_rc.records.borrow();
                let _tmpa = _t_records.last().unwrap();
                _i += 1;
                let x = !(*_tmpa.function() == Wmf_Func::Eof);
                x
            } {}
        }
        Ok(())
    }
}
impl Wmf {
}
impl Wmf {
    pub fn special_header(&self) -> Ref<'_, OptRc<Wmf_SpecialHeader>> {
        self.special_header.borrow()
    }
}
impl Wmf {
    pub fn header(&self) -> Ref<'_, OptRc<Wmf_Header>> {
        self.header.borrow()
    }
}
impl Wmf {
    pub fn records(&self) -> Ref<'_, Vec<OptRc<Wmf_Record>>> {
        self.records.borrow()
    }
}
impl Wmf {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Wmf_BinRasterOp {
    Black,
    Notmergepen,
    Masknotpen,
    Notcopypen,
    Maskpennot,
    Not,
    Xorpen,
    Notmaskpen,
    Maskpen,
    Notxorpen,
    Nop,
    Mergenotpen,
    Copypen,
    Mergepennot,
    Mergepen,
    White,
    Unknown(i64),
}

impl TryFrom<i64> for Wmf_BinRasterOp {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Wmf_BinRasterOp> {
        match flag {
            1 => Ok(Wmf_BinRasterOp::Black),
            2 => Ok(Wmf_BinRasterOp::Notmergepen),
            3 => Ok(Wmf_BinRasterOp::Masknotpen),
            4 => Ok(Wmf_BinRasterOp::Notcopypen),
            5 => Ok(Wmf_BinRasterOp::Maskpennot),
            6 => Ok(Wmf_BinRasterOp::Not),
            7 => Ok(Wmf_BinRasterOp::Xorpen),
            8 => Ok(Wmf_BinRasterOp::Notmaskpen),
            9 => Ok(Wmf_BinRasterOp::Maskpen),
            10 => Ok(Wmf_BinRasterOp::Notxorpen),
            11 => Ok(Wmf_BinRasterOp::Nop),
            12 => Ok(Wmf_BinRasterOp::Mergenotpen),
            13 => Ok(Wmf_BinRasterOp::Copypen),
            14 => Ok(Wmf_BinRasterOp::Mergepennot),
            15 => Ok(Wmf_BinRasterOp::Mergepen),
            16 => Ok(Wmf_BinRasterOp::White),
            _ => Ok(Wmf_BinRasterOp::Unknown(flag)),
        }
    }
}

impl From<&Wmf_BinRasterOp> for i64 {
    fn from(v: &Wmf_BinRasterOp) -> Self {
        match *v {
            Wmf_BinRasterOp::Black => 1,
            Wmf_BinRasterOp::Notmergepen => 2,
            Wmf_BinRasterOp::Masknotpen => 3,
            Wmf_BinRasterOp::Notcopypen => 4,
            Wmf_BinRasterOp::Maskpennot => 5,
            Wmf_BinRasterOp::Not => 6,
            Wmf_BinRasterOp::Xorpen => 7,
            Wmf_BinRasterOp::Notmaskpen => 8,
            Wmf_BinRasterOp::Maskpen => 9,
            Wmf_BinRasterOp::Notxorpen => 10,
            Wmf_BinRasterOp::Nop => 11,
            Wmf_BinRasterOp::Mergenotpen => 12,
            Wmf_BinRasterOp::Copypen => 13,
            Wmf_BinRasterOp::Mergepennot => 14,
            Wmf_BinRasterOp::Mergepen => 15,
            Wmf_BinRasterOp::White => 16,
            Wmf_BinRasterOp::Unknown(v) => v
        }
    }
}

impl Default for Wmf_BinRasterOp {
    fn default() -> Self { Wmf_BinRasterOp::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Wmf_Func {
    Eof,
    Savedc,
    Realizepalette,
    Setpalentries,
    Createpalette,
    Setbkmode,
    Setmapmode,
    Setrop2,
    Setrelabs,
    Setpolyfillmode,
    Setstretchbltmode,
    Settextcharextra,
    Restoredc,
    Invertregion,
    Paintregion,
    Selectclipregion,
    Selectobject,
    Settextalign,
    Resizepalette,
    Dibcreatepatternbrush,
    Setlayout,
    Deleteobject,
    Createpatternbrush,
    Setbkcolor,
    Settextcolor,
    Settextjustification,
    Setwindoworg,
    Setwindowext,
    Setviewportorg,
    Setviewportext,
    Offsetwindoworg,
    Offsetviewportorg,
    Lineto,
    Moveto,
    Offsetcliprgn,
    Fillregion,
    Setmapperflags,
    Selectpalette,
    Createpenindirect,
    Createfontindirect,
    Createbrushindirect,
    Polygon,
    Polyline,
    Scalewindowext,
    Scaleviewportext,
    Excludecliprect,
    Intersectcliprect,
    Ellipse,
    Floodfill,
    Rectangle,
    Setpixel,
    Frameregion,
    Animatepalette,
    Textout,
    Polypolygon,
    Extfloodfill,
    Roundrect,
    Patblt,
    Escape,
    Createregion,
    Arc,
    Pie,
    Chord,
    Bitblt,
    Dibbitblt,
    Exttextout,
    Stretchblt,
    Dibstretchblt,
    Setdibtodev,
    Stretchdib,
    Unknown(i64),
}

impl TryFrom<i64> for Wmf_Func {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Wmf_Func> {
        match flag {
            0 => Ok(Wmf_Func::Eof),
            30 => Ok(Wmf_Func::Savedc),
            53 => Ok(Wmf_Func::Realizepalette),
            55 => Ok(Wmf_Func::Setpalentries),
            247 => Ok(Wmf_Func::Createpalette),
            258 => Ok(Wmf_Func::Setbkmode),
            259 => Ok(Wmf_Func::Setmapmode),
            260 => Ok(Wmf_Func::Setrop2),
            261 => Ok(Wmf_Func::Setrelabs),
            262 => Ok(Wmf_Func::Setpolyfillmode),
            263 => Ok(Wmf_Func::Setstretchbltmode),
            264 => Ok(Wmf_Func::Settextcharextra),
            295 => Ok(Wmf_Func::Restoredc),
            298 => Ok(Wmf_Func::Invertregion),
            299 => Ok(Wmf_Func::Paintregion),
            300 => Ok(Wmf_Func::Selectclipregion),
            301 => Ok(Wmf_Func::Selectobject),
            302 => Ok(Wmf_Func::Settextalign),
            313 => Ok(Wmf_Func::Resizepalette),
            322 => Ok(Wmf_Func::Dibcreatepatternbrush),
            329 => Ok(Wmf_Func::Setlayout),
            496 => Ok(Wmf_Func::Deleteobject),
            505 => Ok(Wmf_Func::Createpatternbrush),
            513 => Ok(Wmf_Func::Setbkcolor),
            521 => Ok(Wmf_Func::Settextcolor),
            522 => Ok(Wmf_Func::Settextjustification),
            523 => Ok(Wmf_Func::Setwindoworg),
            524 => Ok(Wmf_Func::Setwindowext),
            525 => Ok(Wmf_Func::Setviewportorg),
            526 => Ok(Wmf_Func::Setviewportext),
            527 => Ok(Wmf_Func::Offsetwindoworg),
            529 => Ok(Wmf_Func::Offsetviewportorg),
            531 => Ok(Wmf_Func::Lineto),
            532 => Ok(Wmf_Func::Moveto),
            544 => Ok(Wmf_Func::Offsetcliprgn),
            552 => Ok(Wmf_Func::Fillregion),
            561 => Ok(Wmf_Func::Setmapperflags),
            564 => Ok(Wmf_Func::Selectpalette),
            762 => Ok(Wmf_Func::Createpenindirect),
            763 => Ok(Wmf_Func::Createfontindirect),
            764 => Ok(Wmf_Func::Createbrushindirect),
            804 => Ok(Wmf_Func::Polygon),
            805 => Ok(Wmf_Func::Polyline),
            1040 => Ok(Wmf_Func::Scalewindowext),
            1042 => Ok(Wmf_Func::Scaleviewportext),
            1045 => Ok(Wmf_Func::Excludecliprect),
            1046 => Ok(Wmf_Func::Intersectcliprect),
            1048 => Ok(Wmf_Func::Ellipse),
            1049 => Ok(Wmf_Func::Floodfill),
            1051 => Ok(Wmf_Func::Rectangle),
            1055 => Ok(Wmf_Func::Setpixel),
            1065 => Ok(Wmf_Func::Frameregion),
            1078 => Ok(Wmf_Func::Animatepalette),
            1313 => Ok(Wmf_Func::Textout),
            1336 => Ok(Wmf_Func::Polypolygon),
            1352 => Ok(Wmf_Func::Extfloodfill),
            1564 => Ok(Wmf_Func::Roundrect),
            1565 => Ok(Wmf_Func::Patblt),
            1574 => Ok(Wmf_Func::Escape),
            1791 => Ok(Wmf_Func::Createregion),
            2071 => Ok(Wmf_Func::Arc),
            2074 => Ok(Wmf_Func::Pie),
            2096 => Ok(Wmf_Func::Chord),
            2338 => Ok(Wmf_Func::Bitblt),
            2368 => Ok(Wmf_Func::Dibbitblt),
            2610 => Ok(Wmf_Func::Exttextout),
            2851 => Ok(Wmf_Func::Stretchblt),
            2881 => Ok(Wmf_Func::Dibstretchblt),
            3379 => Ok(Wmf_Func::Setdibtodev),
            3907 => Ok(Wmf_Func::Stretchdib),
            _ => Ok(Wmf_Func::Unknown(flag)),
        }
    }
}

impl From<&Wmf_Func> for i64 {
    fn from(v: &Wmf_Func) -> Self {
        match *v {
            Wmf_Func::Eof => 0,
            Wmf_Func::Savedc => 30,
            Wmf_Func::Realizepalette => 53,
            Wmf_Func::Setpalentries => 55,
            Wmf_Func::Createpalette => 247,
            Wmf_Func::Setbkmode => 258,
            Wmf_Func::Setmapmode => 259,
            Wmf_Func::Setrop2 => 260,
            Wmf_Func::Setrelabs => 261,
            Wmf_Func::Setpolyfillmode => 262,
            Wmf_Func::Setstretchbltmode => 263,
            Wmf_Func::Settextcharextra => 264,
            Wmf_Func::Restoredc => 295,
            Wmf_Func::Invertregion => 298,
            Wmf_Func::Paintregion => 299,
            Wmf_Func::Selectclipregion => 300,
            Wmf_Func::Selectobject => 301,
            Wmf_Func::Settextalign => 302,
            Wmf_Func::Resizepalette => 313,
            Wmf_Func::Dibcreatepatternbrush => 322,
            Wmf_Func::Setlayout => 329,
            Wmf_Func::Deleteobject => 496,
            Wmf_Func::Createpatternbrush => 505,
            Wmf_Func::Setbkcolor => 513,
            Wmf_Func::Settextcolor => 521,
            Wmf_Func::Settextjustification => 522,
            Wmf_Func::Setwindoworg => 523,
            Wmf_Func::Setwindowext => 524,
            Wmf_Func::Setviewportorg => 525,
            Wmf_Func::Setviewportext => 526,
            Wmf_Func::Offsetwindoworg => 527,
            Wmf_Func::Offsetviewportorg => 529,
            Wmf_Func::Lineto => 531,
            Wmf_Func::Moveto => 532,
            Wmf_Func::Offsetcliprgn => 544,
            Wmf_Func::Fillregion => 552,
            Wmf_Func::Setmapperflags => 561,
            Wmf_Func::Selectpalette => 564,
            Wmf_Func::Createpenindirect => 762,
            Wmf_Func::Createfontindirect => 763,
            Wmf_Func::Createbrushindirect => 764,
            Wmf_Func::Polygon => 804,
            Wmf_Func::Polyline => 805,
            Wmf_Func::Scalewindowext => 1040,
            Wmf_Func::Scaleviewportext => 1042,
            Wmf_Func::Excludecliprect => 1045,
            Wmf_Func::Intersectcliprect => 1046,
            Wmf_Func::Ellipse => 1048,
            Wmf_Func::Floodfill => 1049,
            Wmf_Func::Rectangle => 1051,
            Wmf_Func::Setpixel => 1055,
            Wmf_Func::Frameregion => 1065,
            Wmf_Func::Animatepalette => 1078,
            Wmf_Func::Textout => 1313,
            Wmf_Func::Polypolygon => 1336,
            Wmf_Func::Extfloodfill => 1352,
            Wmf_Func::Roundrect => 1564,
            Wmf_Func::Patblt => 1565,
            Wmf_Func::Escape => 1574,
            Wmf_Func::Createregion => 1791,
            Wmf_Func::Arc => 2071,
            Wmf_Func::Pie => 2074,
            Wmf_Func::Chord => 2096,
            Wmf_Func::Bitblt => 2338,
            Wmf_Func::Dibbitblt => 2368,
            Wmf_Func::Exttextout => 2610,
            Wmf_Func::Stretchblt => 2851,
            Wmf_Func::Dibstretchblt => 2881,
            Wmf_Func::Setdibtodev => 3379,
            Wmf_Func::Stretchdib => 3907,
            Wmf_Func::Unknown(v) => v
        }
    }
}

impl Default for Wmf_Func {
    fn default() -> Self { Wmf_Func::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Wmf_MixMode {
    Transparent,
    Opaque,
    Unknown(i64),
}

impl TryFrom<i64> for Wmf_MixMode {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Wmf_MixMode> {
        match flag {
            1 => Ok(Wmf_MixMode::Transparent),
            2 => Ok(Wmf_MixMode::Opaque),
            _ => Ok(Wmf_MixMode::Unknown(flag)),
        }
    }
}

impl From<&Wmf_MixMode> for i64 {
    fn from(v: &Wmf_MixMode) -> Self {
        match *v {
            Wmf_MixMode::Transparent => 1,
            Wmf_MixMode::Opaque => 2,
            Wmf_MixMode::Unknown(v) => v
        }
    }
}

impl Default for Wmf_MixMode {
    fn default() -> Self { Wmf_MixMode::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Wmf_PolyFillMode {
    Alternate,
    Winding,
    Unknown(i64),
}

impl TryFrom<i64> for Wmf_PolyFillMode {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Wmf_PolyFillMode> {
        match flag {
            1 => Ok(Wmf_PolyFillMode::Alternate),
            2 => Ok(Wmf_PolyFillMode::Winding),
            _ => Ok(Wmf_PolyFillMode::Unknown(flag)),
        }
    }
}

impl From<&Wmf_PolyFillMode> for i64 {
    fn from(v: &Wmf_PolyFillMode) -> Self {
        match *v {
            Wmf_PolyFillMode::Alternate => 1,
            Wmf_PolyFillMode::Winding => 2,
            Wmf_PolyFillMode::Unknown(v) => v
        }
    }
}

impl Default for Wmf_PolyFillMode {
    fn default() -> Self { Wmf_PolyFillMode::Unknown(0) }
}


/**
 * \sa section 2.2.1.7
 */

#[derive(Default, Debug, Clone)]
pub struct Wmf_ColorRef {
    pub _root: SharedType<Wmf>,
    pub _parent: SharedType<Wmf_Record>,
    pub _self: SharedType<Self>,
    red: RefCell<u8>,
    green: RefCell<u8>,
    blue: RefCell<u8>,
    reserved: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wmf_ColorRef {
    type Root = Wmf;
    type Parent = Wmf_Record;

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
        *self_rc.reserved.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl Wmf_ColorRef {
}
impl Wmf_ColorRef {
    pub fn red(&self) -> Ref<'_, u8> {
        self.red.borrow()
    }
}
impl Wmf_ColorRef {
    pub fn green(&self) -> Ref<'_, u8> {
        self.green.borrow()
    }
}
impl Wmf_ColorRef {
    pub fn blue(&self) -> Ref<'_, u8> {
        self.blue.borrow()
    }
}
impl Wmf_ColorRef {
    pub fn reserved(&self) -> Ref<'_, u8> {
        self.reserved.borrow()
    }
}
impl Wmf_ColorRef {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Wmf_Header {
    pub _root: SharedType<Wmf>,
    pub _parent: SharedType<Wmf>,
    pub _self: SharedType<Self>,
    metafile_type: RefCell<Wmf_Header_MetafileType>,
    header_size: RefCell<u16>,
    version: RefCell<u16>,
    size: RefCell<u32>,
    number_of_objects: RefCell<u16>,
    max_record: RefCell<u32>,
    number_of_members: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wmf_Header {
    type Root = Wmf;
    type Parent = Wmf;

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
        *self_rc.metafile_type.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        *self_rc.header_size.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.version.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.number_of_objects.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.max_record.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.number_of_members.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl Wmf_Header {
}
impl Wmf_Header {
    pub fn metafile_type(&self) -> Ref<'_, Wmf_Header_MetafileType> {
        self.metafile_type.borrow()
    }
}
impl Wmf_Header {
    pub fn header_size(&self) -> Ref<'_, u16> {
        self.header_size.borrow()
    }
}
impl Wmf_Header {
    pub fn version(&self) -> Ref<'_, u16> {
        self.version.borrow()
    }
}
impl Wmf_Header {
    pub fn size(&self) -> Ref<'_, u32> {
        self.size.borrow()
    }
}
impl Wmf_Header {
    pub fn number_of_objects(&self) -> Ref<'_, u16> {
        self.number_of_objects.borrow()
    }
}
impl Wmf_Header {
    pub fn max_record(&self) -> Ref<'_, u32> {
        self.max_record.borrow()
    }
}
impl Wmf_Header {
    pub fn number_of_members(&self) -> Ref<'_, u16> {
        self.number_of_members.borrow()
    }
}
impl Wmf_Header {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Wmf_Header_MetafileType {
    MemoryMetafile,
    DiskMetafile,
    Unknown(i64),
}

impl TryFrom<i64> for Wmf_Header_MetafileType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Wmf_Header_MetafileType> {
        match flag {
            1 => Ok(Wmf_Header_MetafileType::MemoryMetafile),
            2 => Ok(Wmf_Header_MetafileType::DiskMetafile),
            _ => Ok(Wmf_Header_MetafileType::Unknown(flag)),
        }
    }
}

impl From<&Wmf_Header_MetafileType> for i64 {
    fn from(v: &Wmf_Header_MetafileType) -> Self {
        match *v {
            Wmf_Header_MetafileType::MemoryMetafile => 1,
            Wmf_Header_MetafileType::DiskMetafile => 2,
            Wmf_Header_MetafileType::Unknown(v) => v
        }
    }
}

impl Default for Wmf_Header_MetafileType {
    fn default() -> Self { Wmf_Header_MetafileType::Unknown(0) }
}


/**
 * \sa section 2.3.3.15 = params_polyline
 */

#[derive(Default, Debug, Clone)]
pub struct Wmf_ParamsPolygon {
    pub _root: SharedType<Wmf>,
    pub _parent: SharedType<Wmf_Record>,
    pub _self: SharedType<Self>,
    num_points: RefCell<i16>,
    points: RefCell<Vec<OptRc<Wmf_PointS>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wmf_ParamsPolygon {
    type Root = Wmf;
    type Parent = Wmf_Record;

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
        *self_rc.num_points.borrow_mut() = _io.read_s2le()?.into();
        *self_rc.points.borrow_mut() = Vec::new();
        let l_points = *self_rc.num_points();
        for _i in 0..l_points {
            let t = Self::read_into::<_, Wmf_PointS>(&*_io, Some(self_rc._root.clone()), None)?.into();
            self_rc.points.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Wmf_ParamsPolygon {
}
impl Wmf_ParamsPolygon {
    pub fn num_points(&self) -> Ref<'_, i16> {
        self.num_points.borrow()
    }
}
impl Wmf_ParamsPolygon {
    pub fn points(&self) -> Ref<'_, Vec<OptRc<Wmf_PointS>>> {
        self.points.borrow()
    }
}
impl Wmf_ParamsPolygon {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa section 2.3.3.14
 */

#[derive(Default, Debug, Clone)]
pub struct Wmf_ParamsPolyline {
    pub _root: SharedType<Wmf>,
    pub _parent: SharedType<Wmf_Record>,
    pub _self: SharedType<Self>,
    num_points: RefCell<i16>,
    points: RefCell<Vec<OptRc<Wmf_PointS>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wmf_ParamsPolyline {
    type Root = Wmf;
    type Parent = Wmf_Record;

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
        *self_rc.num_points.borrow_mut() = _io.read_s2le()?.into();
        *self_rc.points.borrow_mut() = Vec::new();
        let l_points = *self_rc.num_points();
        for _i in 0..l_points {
            let t = Self::read_into::<_, Wmf_PointS>(&*_io, Some(self_rc._root.clone()), None)?.into();
            self_rc.points.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Wmf_ParamsPolyline {
}
impl Wmf_ParamsPolyline {
    pub fn num_points(&self) -> Ref<'_, i16> {
        self.num_points.borrow()
    }
}
impl Wmf_ParamsPolyline {
    pub fn points(&self) -> Ref<'_, Vec<OptRc<Wmf_PointS>>> {
        self.points.borrow()
    }
}
impl Wmf_ParamsPolyline {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa section 2.3.5.15
 */

#[derive(Default, Debug, Clone)]
pub struct Wmf_ParamsSetbkmode {
    pub _root: SharedType<Wmf>,
    pub _parent: SharedType<Wmf_Record>,
    pub _self: SharedType<Self>,
    bk_mode: RefCell<Wmf_MixMode>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wmf_ParamsSetbkmode {
    type Root = Wmf;
    type Parent = Wmf_Record;

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
        *self_rc.bk_mode.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        Ok(())
    }
}
impl Wmf_ParamsSetbkmode {
}

/**
 * Defines current graphic context background mix mode.
 */
impl Wmf_ParamsSetbkmode {
    pub fn bk_mode(&self) -> Ref<'_, Wmf_MixMode> {
        self.bk_mode.borrow()
    }
}
impl Wmf_ParamsSetbkmode {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa section 2.3.5.20
 */

#[derive(Default, Debug, Clone)]
pub struct Wmf_ParamsSetpolyfillmode {
    pub _root: SharedType<Wmf>,
    pub _parent: SharedType<Wmf_Record>,
    pub _self: SharedType<Self>,
    poly_fill_mode: RefCell<Wmf_PolyFillMode>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wmf_ParamsSetpolyfillmode {
    type Root = Wmf;
    type Parent = Wmf_Record;

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
        *self_rc.poly_fill_mode.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        Ok(())
    }
}
impl Wmf_ParamsSetpolyfillmode {
}

/**
 * Defines current polygon fill mode.
 */
impl Wmf_ParamsSetpolyfillmode {
    pub fn poly_fill_mode(&self) -> Ref<'_, Wmf_PolyFillMode> {
        self.poly_fill_mode.borrow()
    }
}
impl Wmf_ParamsSetpolyfillmode {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa section 2.3.5.22
 */

#[derive(Default, Debug, Clone)]
pub struct Wmf_ParamsSetrop2 {
    pub _root: SharedType<Wmf>,
    pub _parent: SharedType<Wmf_Record>,
    pub _self: SharedType<Self>,
    draw_mode: RefCell<Wmf_BinRasterOp>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wmf_ParamsSetrop2 {
    type Root = Wmf;
    type Parent = Wmf_Record;

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
        *self_rc.draw_mode.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        Ok(())
    }
}
impl Wmf_ParamsSetrop2 {
}

/**
 * Defines current foreground binary raster operation mixing mode.
 */
impl Wmf_ParamsSetrop2 {
    pub fn draw_mode(&self) -> Ref<'_, Wmf_BinRasterOp> {
        self.draw_mode.borrow()
    }
}
impl Wmf_ParamsSetrop2 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa section 2.3.5.30
 */

#[derive(Default, Debug, Clone)]
pub struct Wmf_ParamsSetwindowext {
    pub _root: SharedType<Wmf>,
    pub _parent: SharedType<Wmf_Record>,
    pub _self: SharedType<Self>,
    y: RefCell<i16>,
    x: RefCell<i16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wmf_ParamsSetwindowext {
    type Root = Wmf;
    type Parent = Wmf_Record;

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
        *self_rc.y.borrow_mut() = _io.read_s2le()?.into();
        *self_rc.x.borrow_mut() = _io.read_s2le()?.into();
        Ok(())
    }
}
impl Wmf_ParamsSetwindowext {
}

/**
 * Vertical extent of the window in logical units.
 */
impl Wmf_ParamsSetwindowext {
    pub fn y(&self) -> Ref<'_, i16> {
        self.y.borrow()
    }
}

/**
 * Horizontal extent of the window in logical units.
 */
impl Wmf_ParamsSetwindowext {
    pub fn x(&self) -> Ref<'_, i16> {
        self.x.borrow()
    }
}
impl Wmf_ParamsSetwindowext {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa section 2.3.5.31
 */

#[derive(Default, Debug, Clone)]
pub struct Wmf_ParamsSetwindoworg {
    pub _root: SharedType<Wmf>,
    pub _parent: SharedType<Wmf_Record>,
    pub _self: SharedType<Self>,
    y: RefCell<i16>,
    x: RefCell<i16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wmf_ParamsSetwindoworg {
    type Root = Wmf;
    type Parent = Wmf_Record;

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
        *self_rc.y.borrow_mut() = _io.read_s2le()?.into();
        *self_rc.x.borrow_mut() = _io.read_s2le()?.into();
        Ok(())
    }
}
impl Wmf_ParamsSetwindoworg {
}

/**
 * Y coordinate of the window origin, in logical units.
 */
impl Wmf_ParamsSetwindoworg {
    pub fn y(&self) -> Ref<'_, i16> {
        self.y.borrow()
    }
}

/**
 * X coordinate of the window origin, in logical units.
 */
impl Wmf_ParamsSetwindoworg {
    pub fn x(&self) -> Ref<'_, i16> {
        self.x.borrow()
    }
}
impl Wmf_ParamsSetwindoworg {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa section 2.2.1.12
 */

#[derive(Default, Debug, Clone)]
pub struct Wmf_PointS {
    pub _root: SharedType<Wmf>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    x: RefCell<i16>,
    y: RefCell<i16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wmf_PointS {
    type Root = Wmf;
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
        *self_rc.x.borrow_mut() = _io.read_s2le()?.into();
        *self_rc.y.borrow_mut() = _io.read_s2le()?.into();
        Ok(())
    }
}
impl Wmf_PointS {
}

/**
 * X coordinate of the point, in logical units.
 */
impl Wmf_PointS {
    pub fn x(&self) -> Ref<'_, i16> {
        self.x.borrow()
    }
}

/**
 * Y coordinate of the point, in logical units.
 */
impl Wmf_PointS {
    pub fn y(&self) -> Ref<'_, i16> {
        self.y.borrow()
    }
}
impl Wmf_PointS {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Wmf_Record {
    pub _root: SharedType<Wmf>,
    pub _parent: SharedType<Wmf>,
    pub _self: SharedType<Self>,
    size: RefCell<u32>,
    function: RefCell<Wmf_Func>,
    params: RefCell<Option<Wmf_Record_Params>>,
    _io: RefCell<BytesReader>,
    params_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum Wmf_Record_Params {
    Wmf_ParamsPolyline(OptRc<Wmf_ParamsPolyline>),
    Wmf_ParamsPolygon(OptRc<Wmf_ParamsPolygon>),
    Wmf_ColorRef(OptRc<Wmf_ColorRef>),
    Bytes(Vec<u8>),
    Wmf_ParamsSetwindowext(OptRc<Wmf_ParamsSetwindowext>),
    Wmf_ParamsSetwindoworg(OptRc<Wmf_ParamsSetwindoworg>),
    Wmf_ParamsSetrop2(OptRc<Wmf_ParamsSetrop2>),
    Wmf_ParamsSetbkmode(OptRc<Wmf_ParamsSetbkmode>),
    Wmf_ParamsSetpolyfillmode(OptRc<Wmf_ParamsSetpolyfillmode>),
}
impl From<&Wmf_Record_Params> for OptRc<Wmf_ParamsPolyline> {
    fn from(v: &Wmf_Record_Params) -> Self {
        if let Wmf_Record_Params::Wmf_ParamsPolyline(x) = v {
            return x.clone();
        }
        panic!("expected Wmf_Record_Params::Wmf_ParamsPolyline, got {:?}", v)
    }
}
impl From<OptRc<Wmf_ParamsPolyline>> for Wmf_Record_Params {
    fn from(v: OptRc<Wmf_ParamsPolyline>) -> Self {
        Self::Wmf_ParamsPolyline(v)
    }
}
impl From<&Wmf_Record_Params> for OptRc<Wmf_ParamsPolygon> {
    fn from(v: &Wmf_Record_Params) -> Self {
        if let Wmf_Record_Params::Wmf_ParamsPolygon(x) = v {
            return x.clone();
        }
        panic!("expected Wmf_Record_Params::Wmf_ParamsPolygon, got {:?}", v)
    }
}
impl From<OptRc<Wmf_ParamsPolygon>> for Wmf_Record_Params {
    fn from(v: OptRc<Wmf_ParamsPolygon>) -> Self {
        Self::Wmf_ParamsPolygon(v)
    }
}
impl From<&Wmf_Record_Params> for OptRc<Wmf_ColorRef> {
    fn from(v: &Wmf_Record_Params) -> Self {
        if let Wmf_Record_Params::Wmf_ColorRef(x) = v {
            return x.clone();
        }
        panic!("expected Wmf_Record_Params::Wmf_ColorRef, got {:?}", v)
    }
}
impl From<OptRc<Wmf_ColorRef>> for Wmf_Record_Params {
    fn from(v: OptRc<Wmf_ColorRef>) -> Self {
        Self::Wmf_ColorRef(v)
    }
}
impl From<&Wmf_Record_Params> for Vec<u8> {
    fn from(v: &Wmf_Record_Params) -> Self {
        if let Wmf_Record_Params::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected Wmf_Record_Params::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for Wmf_Record_Params {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&Wmf_Record_Params> for OptRc<Wmf_ParamsSetwindowext> {
    fn from(v: &Wmf_Record_Params) -> Self {
        if let Wmf_Record_Params::Wmf_ParamsSetwindowext(x) = v {
            return x.clone();
        }
        panic!("expected Wmf_Record_Params::Wmf_ParamsSetwindowext, got {:?}", v)
    }
}
impl From<OptRc<Wmf_ParamsSetwindowext>> for Wmf_Record_Params {
    fn from(v: OptRc<Wmf_ParamsSetwindowext>) -> Self {
        Self::Wmf_ParamsSetwindowext(v)
    }
}
impl From<&Wmf_Record_Params> for OptRc<Wmf_ParamsSetwindoworg> {
    fn from(v: &Wmf_Record_Params) -> Self {
        if let Wmf_Record_Params::Wmf_ParamsSetwindoworg(x) = v {
            return x.clone();
        }
        panic!("expected Wmf_Record_Params::Wmf_ParamsSetwindoworg, got {:?}", v)
    }
}
impl From<OptRc<Wmf_ParamsSetwindoworg>> for Wmf_Record_Params {
    fn from(v: OptRc<Wmf_ParamsSetwindoworg>) -> Self {
        Self::Wmf_ParamsSetwindoworg(v)
    }
}
impl From<&Wmf_Record_Params> for OptRc<Wmf_ParamsSetrop2> {
    fn from(v: &Wmf_Record_Params) -> Self {
        if let Wmf_Record_Params::Wmf_ParamsSetrop2(x) = v {
            return x.clone();
        }
        panic!("expected Wmf_Record_Params::Wmf_ParamsSetrop2, got {:?}", v)
    }
}
impl From<OptRc<Wmf_ParamsSetrop2>> for Wmf_Record_Params {
    fn from(v: OptRc<Wmf_ParamsSetrop2>) -> Self {
        Self::Wmf_ParamsSetrop2(v)
    }
}
impl From<&Wmf_Record_Params> for OptRc<Wmf_ParamsSetbkmode> {
    fn from(v: &Wmf_Record_Params) -> Self {
        if let Wmf_Record_Params::Wmf_ParamsSetbkmode(x) = v {
            return x.clone();
        }
        panic!("expected Wmf_Record_Params::Wmf_ParamsSetbkmode, got {:?}", v)
    }
}
impl From<OptRc<Wmf_ParamsSetbkmode>> for Wmf_Record_Params {
    fn from(v: OptRc<Wmf_ParamsSetbkmode>) -> Self {
        Self::Wmf_ParamsSetbkmode(v)
    }
}
impl From<&Wmf_Record_Params> for OptRc<Wmf_ParamsSetpolyfillmode> {
    fn from(v: &Wmf_Record_Params) -> Self {
        if let Wmf_Record_Params::Wmf_ParamsSetpolyfillmode(x) = v {
            return x.clone();
        }
        panic!("expected Wmf_Record_Params::Wmf_ParamsSetpolyfillmode, got {:?}", v)
    }
}
impl From<OptRc<Wmf_ParamsSetpolyfillmode>> for Wmf_Record_Params {
    fn from(v: OptRc<Wmf_ParamsSetpolyfillmode>) -> Self {
        Self::Wmf_ParamsSetpolyfillmode(v)
    }
}
impl KStruct for Wmf_Record {
    type Root = Wmf;
    type Parent = Wmf;

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
        *self_rc.size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.function.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        match *self_rc.function() {
            Wmf_Func::Polygon => {
                *self_rc.params_raw.borrow_mut() = _io.read_bytes(((((*self_rc.size() as u32) - (3 as u32)) as i32) * (2 as i32)) as usize)?.into();
                let params_raw = self_rc.params_raw.borrow();
                let _t_params_raw_io = BytesReader::from(params_raw.clone());
                let t = Self::read_into::<BytesReader, Wmf_ParamsPolygon>(&_t_params_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.params.borrow_mut() = Some(t);
            }
            Wmf_Func::Polyline => {
                *self_rc.params_raw.borrow_mut() = _io.read_bytes(((((*self_rc.size() as u32) - (3 as u32)) as i32) * (2 as i32)) as usize)?.into();
                let params_raw = self_rc.params_raw.borrow();
                let _t_params_raw_io = BytesReader::from(params_raw.clone());
                let t = Self::read_into::<BytesReader, Wmf_ParamsPolyline>(&_t_params_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.params.borrow_mut() = Some(t);
            }
            Wmf_Func::Setbkcolor => {
                *self_rc.params_raw.borrow_mut() = _io.read_bytes(((((*self_rc.size() as u32) - (3 as u32)) as i32) * (2 as i32)) as usize)?.into();
                let params_raw = self_rc.params_raw.borrow();
                let _t_params_raw_io = BytesReader::from(params_raw.clone());
                let t = Self::read_into::<BytesReader, Wmf_ColorRef>(&_t_params_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.params.borrow_mut() = Some(t);
            }
            Wmf_Func::Setbkmode => {
                *self_rc.params_raw.borrow_mut() = _io.read_bytes(((((*self_rc.size() as u32) - (3 as u32)) as i32) * (2 as i32)) as usize)?.into();
                let params_raw = self_rc.params_raw.borrow();
                let _t_params_raw_io = BytesReader::from(params_raw.clone());
                let t = Self::read_into::<BytesReader, Wmf_ParamsSetbkmode>(&_t_params_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.params.borrow_mut() = Some(t);
            }
            Wmf_Func::Setpolyfillmode => {
                *self_rc.params_raw.borrow_mut() = _io.read_bytes(((((*self_rc.size() as u32) - (3 as u32)) as i32) * (2 as i32)) as usize)?.into();
                let params_raw = self_rc.params_raw.borrow();
                let _t_params_raw_io = BytesReader::from(params_raw.clone());
                let t = Self::read_into::<BytesReader, Wmf_ParamsSetpolyfillmode>(&_t_params_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.params.borrow_mut() = Some(t);
            }
            Wmf_Func::Setrop2 => {
                *self_rc.params_raw.borrow_mut() = _io.read_bytes(((((*self_rc.size() as u32) - (3 as u32)) as i32) * (2 as i32)) as usize)?.into();
                let params_raw = self_rc.params_raw.borrow();
                let _t_params_raw_io = BytesReader::from(params_raw.clone());
                let t = Self::read_into::<BytesReader, Wmf_ParamsSetrop2>(&_t_params_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.params.borrow_mut() = Some(t);
            }
            Wmf_Func::Setwindowext => {
                *self_rc.params_raw.borrow_mut() = _io.read_bytes(((((*self_rc.size() as u32) - (3 as u32)) as i32) * (2 as i32)) as usize)?.into();
                let params_raw = self_rc.params_raw.borrow();
                let _t_params_raw_io = BytesReader::from(params_raw.clone());
                let t = Self::read_into::<BytesReader, Wmf_ParamsSetwindowext>(&_t_params_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.params.borrow_mut() = Some(t);
            }
            Wmf_Func::Setwindoworg => {
                *self_rc.params_raw.borrow_mut() = _io.read_bytes(((((*self_rc.size() as u32) - (3 as u32)) as i32) * (2 as i32)) as usize)?.into();
                let params_raw = self_rc.params_raw.borrow();
                let _t_params_raw_io = BytesReader::from(params_raw.clone());
                let t = Self::read_into::<BytesReader, Wmf_ParamsSetwindoworg>(&_t_params_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.params.borrow_mut() = Some(t);
            }
            _ => {
                *self_rc.params.borrow_mut() = Some(_io.read_bytes(((((*self_rc.size() as u32) - (3 as u32)) as i32) * (2 as i32)) as usize)?.into());
            }
        }
        Ok(())
    }
}
impl Wmf_Record {
}
impl Wmf_Record {
    pub fn size(&self) -> Ref<'_, u32> {
        self.size.borrow()
    }
}
impl Wmf_Record {
    pub fn function(&self) -> Ref<'_, Wmf_Func> {
        self.function.borrow()
    }
}
impl Wmf_Record {
    pub fn params(&self) -> Ref<'_, Option<Wmf_Record_Params>> {
        self.params.borrow()
    }
}
impl Wmf_Record {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Wmf_Record {
    pub fn params_raw(&self) -> Ref<'_, Vec<u8>> {
        self.params_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Wmf_SpecialHeader {
    pub _root: SharedType<Wmf>,
    pub _parent: SharedType<Wmf>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    handle: RefCell<Vec<u8>>,
    left: RefCell<i16>,
    top: RefCell<i16>,
    right: RefCell<i16>,
    bottom: RefCell<i16>,
    inch: RefCell<u16>,
    reserved: RefCell<Vec<u8>>,
    checksum: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Wmf_SpecialHeader {
    type Root = Wmf;
    type Parent = Wmf;

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
        if !(*self_rc.magic() == vec![0xd7u8, 0xcdu8, 0xc6u8, 0x9au8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/special_header/seq/0".to_string() }));
        }
        *self_rc.handle.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        if !(*self_rc.handle() == vec![0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/special_header/seq/1".to_string() }));
        }
        *self_rc.left.borrow_mut() = _io.read_s2le()?.into();
        *self_rc.top.borrow_mut() = _io.read_s2le()?.into();
        *self_rc.right.borrow_mut() = _io.read_s2le()?.into();
        *self_rc.bottom.borrow_mut() = _io.read_s2le()?.into();
        *self_rc.inch.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.reserved.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.reserved() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/special_header/seq/7".to_string() }));
        }
        *self_rc.checksum.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl Wmf_SpecialHeader {
}
impl Wmf_SpecialHeader {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl Wmf_SpecialHeader {
    pub fn handle(&self) -> Ref<'_, Vec<u8>> {
        self.handle.borrow()
    }
}
impl Wmf_SpecialHeader {
    pub fn left(&self) -> Ref<'_, i16> {
        self.left.borrow()
    }
}
impl Wmf_SpecialHeader {
    pub fn top(&self) -> Ref<'_, i16> {
        self.top.borrow()
    }
}
impl Wmf_SpecialHeader {
    pub fn right(&self) -> Ref<'_, i16> {
        self.right.borrow()
    }
}
impl Wmf_SpecialHeader {
    pub fn bottom(&self) -> Ref<'_, i16> {
        self.bottom.borrow()
    }
}
impl Wmf_SpecialHeader {
    pub fn inch(&self) -> Ref<'_, u16> {
        self.inch.borrow()
    }
}
impl Wmf_SpecialHeader {
    pub fn reserved(&self) -> Ref<'_, Vec<u8>> {
        self.reserved.borrow()
    }
}
impl Wmf_SpecialHeader {
    pub fn checksum(&self) -> Ref<'_, u16> {
        self.checksum.borrow()
    }
}
impl Wmf_SpecialHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

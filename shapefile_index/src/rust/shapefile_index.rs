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

#[derive(Default, Debug, Clone)]
pub struct ShapefileIndex {
    pub _root: SharedType<ShapefileIndex>,
    pub _parent: SharedType<ShapefileIndex>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<ShapefileIndex_FileHeader>>,
    records: RefCell<Vec<OptRc<ShapefileIndex_Record>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for ShapefileIndex {
    type Root = ShapefileIndex;
    type Parent = ShapefileIndex;

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
        let t = Self::read_into::<_, ShapefileIndex_FileHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        *self_rc.records.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, ShapefileIndex_Record>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.records.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl ShapefileIndex {
}
impl ShapefileIndex {
    pub fn header(&self) -> Ref<'_, OptRc<ShapefileIndex_FileHeader>> {
        self.header.borrow()
    }
}

/**
 * the size of this section of the file in bytes must equal (header.file_length * 2) - 100
 */
impl ShapefileIndex {
    pub fn records(&self) -> Ref<'_, Vec<OptRc<ShapefileIndex_Record>>> {
        self.records.borrow()
    }
}
impl ShapefileIndex {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum ShapefileIndex_ShapeType {
    NullShape,
    Point,
    PolyLine,
    Polygon,
    MultiPoint,
    PointZ,
    PolyLineZ,
    PolygonZ,
    MultiPointZ,
    PointM,
    PolyLineM,
    PolygonM,
    MultiPointM,
    MultiPatch,
    Unknown(i64),
}

impl TryFrom<i64> for ShapefileIndex_ShapeType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<ShapefileIndex_ShapeType> {
        match flag {
            0 => Ok(ShapefileIndex_ShapeType::NullShape),
            1 => Ok(ShapefileIndex_ShapeType::Point),
            3 => Ok(ShapefileIndex_ShapeType::PolyLine),
            5 => Ok(ShapefileIndex_ShapeType::Polygon),
            8 => Ok(ShapefileIndex_ShapeType::MultiPoint),
            11 => Ok(ShapefileIndex_ShapeType::PointZ),
            13 => Ok(ShapefileIndex_ShapeType::PolyLineZ),
            15 => Ok(ShapefileIndex_ShapeType::PolygonZ),
            18 => Ok(ShapefileIndex_ShapeType::MultiPointZ),
            21 => Ok(ShapefileIndex_ShapeType::PointM),
            23 => Ok(ShapefileIndex_ShapeType::PolyLineM),
            25 => Ok(ShapefileIndex_ShapeType::PolygonM),
            28 => Ok(ShapefileIndex_ShapeType::MultiPointM),
            31 => Ok(ShapefileIndex_ShapeType::MultiPatch),
            _ => Ok(ShapefileIndex_ShapeType::Unknown(flag)),
        }
    }
}

impl From<&ShapefileIndex_ShapeType> for i64 {
    fn from(v: &ShapefileIndex_ShapeType) -> Self {
        match *v {
            ShapefileIndex_ShapeType::NullShape => 0,
            ShapefileIndex_ShapeType::Point => 1,
            ShapefileIndex_ShapeType::PolyLine => 3,
            ShapefileIndex_ShapeType::Polygon => 5,
            ShapefileIndex_ShapeType::MultiPoint => 8,
            ShapefileIndex_ShapeType::PointZ => 11,
            ShapefileIndex_ShapeType::PolyLineZ => 13,
            ShapefileIndex_ShapeType::PolygonZ => 15,
            ShapefileIndex_ShapeType::MultiPointZ => 18,
            ShapefileIndex_ShapeType::PointM => 21,
            ShapefileIndex_ShapeType::PolyLineM => 23,
            ShapefileIndex_ShapeType::PolygonM => 25,
            ShapefileIndex_ShapeType::MultiPointM => 28,
            ShapefileIndex_ShapeType::MultiPatch => 31,
            ShapefileIndex_ShapeType::Unknown(v) => v
        }
    }
}

impl Default for ShapefileIndex_ShapeType {
    fn default() -> Self { ShapefileIndex_ShapeType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct ShapefileIndex_BoundingBoxXYZM {
    pub _root: SharedType<ShapefileIndex>,
    pub _parent: SharedType<ShapefileIndex_FileHeader>,
    pub _self: SharedType<Self>,
    x: RefCell<OptRc<ShapefileIndex_BoundsMinMax>>,
    y: RefCell<OptRc<ShapefileIndex_BoundsMinMax>>,
    z: RefCell<OptRc<ShapefileIndex_BoundsMinMax>>,
    m: RefCell<OptRc<ShapefileIndex_BoundsMinMax>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for ShapefileIndex_BoundingBoxXYZM {
    type Root = ShapefileIndex;
    type Parent = ShapefileIndex_FileHeader;

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
        let t = Self::read_into::<_, ShapefileIndex_BoundsMinMax>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.x.borrow_mut() = t;
        let t = Self::read_into::<_, ShapefileIndex_BoundsMinMax>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.y.borrow_mut() = t;
        let t = Self::read_into::<_, ShapefileIndex_BoundsMinMax>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.z.borrow_mut() = t;
        let t = Self::read_into::<_, ShapefileIndex_BoundsMinMax>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.m.borrow_mut() = t;
        Ok(())
    }
}
impl ShapefileIndex_BoundingBoxXYZM {
}
impl ShapefileIndex_BoundingBoxXYZM {
    pub fn x(&self) -> Ref<'_, OptRc<ShapefileIndex_BoundsMinMax>> {
        self.x.borrow()
    }
}
impl ShapefileIndex_BoundingBoxXYZM {
    pub fn y(&self) -> Ref<'_, OptRc<ShapefileIndex_BoundsMinMax>> {
        self.y.borrow()
    }
}
impl ShapefileIndex_BoundingBoxXYZM {
    pub fn z(&self) -> Ref<'_, OptRc<ShapefileIndex_BoundsMinMax>> {
        self.z.borrow()
    }
}
impl ShapefileIndex_BoundingBoxXYZM {
    pub fn m(&self) -> Ref<'_, OptRc<ShapefileIndex_BoundsMinMax>> {
        self.m.borrow()
    }
}
impl ShapefileIndex_BoundingBoxXYZM {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct ShapefileIndex_BoundsMinMax {
    pub _root: SharedType<ShapefileIndex>,
    pub _parent: SharedType<ShapefileIndex_BoundingBoxXYZM>,
    pub _self: SharedType<Self>,
    min: RefCell<f64>,
    max: RefCell<f64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for ShapefileIndex_BoundsMinMax {
    type Root = ShapefileIndex;
    type Parent = ShapefileIndex_BoundingBoxXYZM;

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
        *self_rc.min.borrow_mut() = _io.read_f8be()?.into();
        *self_rc.max.borrow_mut() = _io.read_f8be()?.into();
        Ok(())
    }
}
impl ShapefileIndex_BoundsMinMax {
}
impl ShapefileIndex_BoundsMinMax {
    pub fn min(&self) -> Ref<'_, f64> {
        self.min.borrow()
    }
}
impl ShapefileIndex_BoundsMinMax {
    pub fn max(&self) -> Ref<'_, f64> {
        self.max.borrow()
    }
}
impl ShapefileIndex_BoundsMinMax {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct ShapefileIndex_FileHeader {
    pub _root: SharedType<ShapefileIndex>,
    pub _parent: SharedType<ShapefileIndex>,
    pub _self: SharedType<Self>,
    file_code: RefCell<Vec<u8>>,
    unused_field_1: RefCell<Vec<u8>>,
    unused_field_2: RefCell<Vec<u8>>,
    unused_field_3: RefCell<Vec<u8>>,
    unused_field_4: RefCell<Vec<u8>>,
    unused_field_5: RefCell<Vec<u8>>,
    file_length: RefCell<i32>,
    version: RefCell<Vec<u8>>,
    shape_type: RefCell<ShapefileIndex_ShapeType>,
    bounding_box: RefCell<OptRc<ShapefileIndex_BoundingBoxXYZM>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for ShapefileIndex_FileHeader {
    type Root = ShapefileIndex;
    type Parent = ShapefileIndex;

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
        *self_rc.file_code.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.file_code() == vec![0x0u8, 0x0u8, 0x27u8, 0xau8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/file_header/seq/0".to_string() }));
        }
        *self_rc.unused_field_1.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.unused_field_1() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/file_header/seq/1".to_string() }));
        }
        *self_rc.unused_field_2.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.unused_field_2() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/file_header/seq/2".to_string() }));
        }
        *self_rc.unused_field_3.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.unused_field_3() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/file_header/seq/3".to_string() }));
        }
        *self_rc.unused_field_4.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.unused_field_4() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/file_header/seq/4".to_string() }));
        }
        *self_rc.unused_field_5.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.unused_field_5() == vec![0x0u8, 0x0u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/file_header/seq/5".to_string() }));
        }
        *self_rc.file_length.borrow_mut() = _io.read_s4be()?.into();
        *self_rc.version.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.version() == vec![0xe8u8, 0x3u8, 0x0u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/file_header/seq/7".to_string() }));
        }
        *self_rc.shape_type.borrow_mut() = (_io.read_s4le()? as i64).try_into()?;
        let t = Self::read_into::<_, ShapefileIndex_BoundingBoxXYZM>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.bounding_box.borrow_mut() = t;
        Ok(())
    }
}
impl ShapefileIndex_FileHeader {
}

/**
 * corresponds to s4be value of 9994
 */
impl ShapefileIndex_FileHeader {
    pub fn file_code(&self) -> Ref<'_, Vec<u8>> {
        self.file_code.borrow()
    }
}
impl ShapefileIndex_FileHeader {
    pub fn unused_field_1(&self) -> Ref<'_, Vec<u8>> {
        self.unused_field_1.borrow()
    }
}
impl ShapefileIndex_FileHeader {
    pub fn unused_field_2(&self) -> Ref<'_, Vec<u8>> {
        self.unused_field_2.borrow()
    }
}
impl ShapefileIndex_FileHeader {
    pub fn unused_field_3(&self) -> Ref<'_, Vec<u8>> {
        self.unused_field_3.borrow()
    }
}
impl ShapefileIndex_FileHeader {
    pub fn unused_field_4(&self) -> Ref<'_, Vec<u8>> {
        self.unused_field_4.borrow()
    }
}
impl ShapefileIndex_FileHeader {
    pub fn unused_field_5(&self) -> Ref<'_, Vec<u8>> {
        self.unused_field_5.borrow()
    }
}
impl ShapefileIndex_FileHeader {
    pub fn file_length(&self) -> Ref<'_, i32> {
        self.file_length.borrow()
    }
}

/**
 * corresponds to s4le value of 1000
 */
impl ShapefileIndex_FileHeader {
    pub fn version(&self) -> Ref<'_, Vec<u8>> {
        self.version.borrow()
    }
}
impl ShapefileIndex_FileHeader {
    pub fn shape_type(&self) -> Ref<'_, ShapefileIndex_ShapeType> {
        self.shape_type.borrow()
    }
}
impl ShapefileIndex_FileHeader {
    pub fn bounding_box(&self) -> Ref<'_, OptRc<ShapefileIndex_BoundingBoxXYZM>> {
        self.bounding_box.borrow()
    }
}
impl ShapefileIndex_FileHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct ShapefileIndex_Record {
    pub _root: SharedType<ShapefileIndex>,
    pub _parent: SharedType<ShapefileIndex>,
    pub _self: SharedType<Self>,
    offset: RefCell<i32>,
    content_length: RefCell<i32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for ShapefileIndex_Record {
    type Root = ShapefileIndex;
    type Parent = ShapefileIndex;

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
        *self_rc.offset.borrow_mut() = _io.read_s4be()?.into();
        *self_rc.content_length.borrow_mut() = _io.read_s4be()?.into();
        Ok(())
    }
}
impl ShapefileIndex_Record {
}
impl ShapefileIndex_Record {
    pub fn offset(&self) -> Ref<'_, i32> {
        self.offset.borrow()
    }
}
impl ShapefileIndex_Record {
    pub fn content_length(&self) -> Ref<'_, i32> {
        self.content_length.borrow()
    }
}
impl ShapefileIndex_Record {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

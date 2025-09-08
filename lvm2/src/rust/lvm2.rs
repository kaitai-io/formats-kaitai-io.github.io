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
 * ### Building a test file
 * 
 * ```
 * dd if=/dev/zero of=image.img bs=512 count=$(( 4 * 1024 * 2 ))
 * sudo losetup /dev/loop1 image.img
 * sudo pvcreate /dev/loop1
 * sudo vgcreate vg_test /dev/loop1
 * sudo lvcreate --name lv_test1 vg_test
 * sudo losetup -d /dev/loop1
 * ```
 * \sa https://github.com/libyal/libvslvm/blob/main/documentation/Logical%20Volume%20Manager%20(LVM)%20format.asciidoc Source
 */

#[derive(Default, Debug, Clone)]
pub struct Lvm2 {
    pub _root: SharedType<Lvm2>,
    pub _parent: SharedType<Lvm2>,
    pub _self: SharedType<Self>,
    pv: RefCell<OptRc<Lvm2_PhysicalVolume>>,
    _io: RefCell<BytesReader>,
    f_sector_size: Cell<bool>,
    sector_size: RefCell<i32>,
}
impl KStruct for Lvm2 {
    type Root = Lvm2;
    type Parent = Lvm2;

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
        let t = Self::read_into::<_, Lvm2_PhysicalVolume>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.pv.borrow_mut() = t;
        Ok(())
    }
}
impl Lvm2 {
    pub fn sector_size(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_sector_size.get() {
            return Ok(self.sector_size.borrow());
        }
        self.f_sector_size.set(true);
        *self.sector_size.borrow_mut() = (512) as i32;
        Ok(self.sector_size.borrow())
    }
}

/**
 * Physical volume
 */
impl Lvm2 {
    pub fn pv(&self) -> Ref<'_, OptRc<Lvm2_PhysicalVolume>> {
        self.pv.borrow()
    }
}
impl Lvm2 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Lvm2_PhysicalVolume {
    pub _root: SharedType<Lvm2>,
    pub _parent: SharedType<Lvm2>,
    pub _self: SharedType<Self>,
    empty_sector: RefCell<Vec<u8>>,
    label: RefCell<OptRc<Lvm2_PhysicalVolume_Label>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Lvm2_PhysicalVolume {
    type Root = Lvm2;
    type Parent = Lvm2;

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
        *self_rc.empty_sector.borrow_mut() = _io.read_bytes(*_r.sector_size()? as usize)?.into();
        let t = Self::read_into::<_, Lvm2_PhysicalVolume_Label>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.label.borrow_mut() = t;
        Ok(())
    }
}
impl Lvm2_PhysicalVolume {
}
impl Lvm2_PhysicalVolume {
    pub fn empty_sector(&self) -> Ref<'_, Vec<u8>> {
        self.empty_sector.borrow()
    }
}
impl Lvm2_PhysicalVolume {
    pub fn label(&self) -> Ref<'_, OptRc<Lvm2_PhysicalVolume_Label>> {
        self.label.borrow()
    }
}
impl Lvm2_PhysicalVolume {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Lvm2_PhysicalVolume_Label {
    pub _root: SharedType<Lvm2>,
    pub _parent: SharedType<Lvm2_PhysicalVolume>,
    pub _self: SharedType<Self>,
    label_header: RefCell<OptRc<Lvm2_PhysicalVolume_Label_LabelHeader>>,
    volume_header: RefCell<OptRc<Lvm2_PhysicalVolume_Label_VolumeHeader>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Lvm2_PhysicalVolume_Label {
    type Root = Lvm2;
    type Parent = Lvm2_PhysicalVolume;

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
        let t = Self::read_into::<_, Lvm2_PhysicalVolume_Label_LabelHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.label_header.borrow_mut() = t;
        let t = Self::read_into::<_, Lvm2_PhysicalVolume_Label_VolumeHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.volume_header.borrow_mut() = t;
        Ok(())
    }
}
impl Lvm2_PhysicalVolume_Label {
}
impl Lvm2_PhysicalVolume_Label {
    pub fn label_header(&self) -> Ref<'_, OptRc<Lvm2_PhysicalVolume_Label_LabelHeader>> {
        self.label_header.borrow()
    }
}
impl Lvm2_PhysicalVolume_Label {
    pub fn volume_header(&self) -> Ref<'_, OptRc<Lvm2_PhysicalVolume_Label_VolumeHeader>> {
        self.volume_header.borrow()
    }
}
impl Lvm2_PhysicalVolume_Label {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Lvm2_PhysicalVolume_Label_LabelHeader {
    pub _root: SharedType<Lvm2>,
    pub _parent: SharedType<Lvm2_PhysicalVolume_Label>,
    pub _self: SharedType<Self>,
    signature: RefCell<Vec<u8>>,
    sector_number: RefCell<u64>,
    checksum: RefCell<u32>,
    label_header_: RefCell<OptRc<Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Lvm2_PhysicalVolume_Label_LabelHeader {
    type Root = Lvm2;
    type Parent = Lvm2_PhysicalVolume_Label;

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
        *self_rc.signature.borrow_mut() = _io.read_bytes(8 as usize)?.into();
        if !(*self_rc.signature() == vec![0x4cu8, 0x41u8, 0x42u8, 0x45u8, 0x4cu8, 0x4fu8, 0x4eu8, 0x45u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/physical_volume/types/label/types/label_header/seq/0".to_string() }));
        }
        *self_rc.sector_number.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.checksum.borrow_mut() = _io.read_u4le()?.into();
        let t = Self::read_into::<_, Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.label_header_.borrow_mut() = t;
        Ok(())
    }
}
impl Lvm2_PhysicalVolume_Label_LabelHeader {
}
impl Lvm2_PhysicalVolume_Label_LabelHeader {
    pub fn signature(&self) -> Ref<'_, Vec<u8>> {
        self.signature.borrow()
    }
}

/**
 * The sector number of the physical volume label header
 */
impl Lvm2_PhysicalVolume_Label_LabelHeader {
    pub fn sector_number(&self) -> Ref<'_, u64> {
        self.sector_number.borrow()
    }
}

/**
 * CRC-32 for offset 20 to end of the physical volume label sector
 */
impl Lvm2_PhysicalVolume_Label_LabelHeader {
    pub fn checksum(&self) -> Ref<'_, u32> {
        self.checksum.borrow()
    }
}
impl Lvm2_PhysicalVolume_Label_LabelHeader {
    pub fn label_header_(&self) -> Ref<'_, OptRc<Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader>> {
        self.label_header_.borrow()
    }
}
impl Lvm2_PhysicalVolume_Label_LabelHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader {
    pub _root: SharedType<Lvm2>,
    pub _parent: SharedType<Lvm2_PhysicalVolume_Label_LabelHeader>,
    pub _self: SharedType<Self>,
    data_offset: RefCell<u32>,
    type_indicator: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader {
    type Root = Lvm2;
    type Parent = Lvm2_PhysicalVolume_Label_LabelHeader;

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
        *self_rc.data_offset.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.type_indicator.borrow_mut() = _io.read_bytes(8 as usize)?.into();
        if !(*self_rc.type_indicator() == vec![0x4cu8, 0x56u8, 0x4du8, 0x32u8, 0x20u8, 0x30u8, 0x30u8, 0x31u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/physical_volume/types/label/types/label_header/types/label_header_/seq/1".to_string() }));
        }
        Ok(())
    }
}
impl Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader {
}

/**
 * The offset, in bytes, relative from the start of the physical volume label header where data is stored
 */
impl Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader {
    pub fn data_offset(&self) -> Ref<'_, u32> {
        self.data_offset.borrow()
    }
}
impl Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader {
    pub fn type_indicator(&self) -> Ref<'_, Vec<u8>> {
        self.type_indicator.borrow()
    }
}
impl Lvm2_PhysicalVolume_Label_LabelHeader_LabelHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Lvm2_PhysicalVolume_Label_VolumeHeader {
    pub _root: SharedType<Lvm2>,
    pub _parent: SharedType<Lvm2_PhysicalVolume_Label>,
    pub _self: SharedType<Self>,
    id: RefCell<String>,
    size: RefCell<u64>,
    data_area_descriptors: RefCell<Vec<OptRc<Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor>>>,
    metadata_area_descriptors: RefCell<Vec<OptRc<Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Lvm2_PhysicalVolume_Label_VolumeHeader {
    type Root = Lvm2;
    type Parent = Lvm2_PhysicalVolume_Label;

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
        *self_rc.id.borrow_mut() = bytes_to_str(&_io.read_bytes(32 as usize)?.into(), "ASCII")?;
        *self_rc.size.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.data_area_descriptors.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let t = Self::read_into::<_, Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.data_area_descriptors.borrow_mut().push(t);
                let _t_data_area_descriptors = self_rc.data_area_descriptors.borrow();
                let _tmpa = _t_data_area_descriptors.last().unwrap();
                _i += 1;
                let x = !( ((((*_tmpa.size() as u64) != (0 as u64))) && (((*_tmpa.offset() as u64) != (0 as u64)))) );
                x
            } {}
        }
        *self_rc.metadata_area_descriptors.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let t = Self::read_into::<_, Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.metadata_area_descriptors.borrow_mut().push(t);
                let _t_metadata_area_descriptors = self_rc.metadata_area_descriptors.borrow();
                let _tmpa = _t_metadata_area_descriptors.last().unwrap();
                _i += 1;
                let x = !( ((((*_tmpa.size() as u64) != (0 as u64))) && (((*_tmpa.offset() as u64) != (0 as u64)))) );
                x
            } {}
        }
        Ok(())
    }
}
impl Lvm2_PhysicalVolume_Label_VolumeHeader {
}

/**
 * Contains a UUID stored as an ASCII string. The physical volume identifier can be used to uniquely identify a physical volume. The physical volume identifier is stored as: 9LBcEB7PQTGIlLI0KxrtzrynjuSL983W but is equivalent to its formatted variant: 9LBcEB-7PQT-GIlL-I0Kx-rtzr-ynju-SL983W, which is used in the metadata.
 */
impl Lvm2_PhysicalVolume_Label_VolumeHeader {
    pub fn id(&self) -> Ref<'_, String> {
        self.id.borrow()
    }
}

/**
 * Physical Volume size. Value in bytes
 */
impl Lvm2_PhysicalVolume_Label_VolumeHeader {
    pub fn size(&self) -> Ref<'_, u64> {
        self.size.borrow()
    }
}

/**
 * The last descriptor in the list is terminator and consists of 0-byte values.
 */
impl Lvm2_PhysicalVolume_Label_VolumeHeader {
    pub fn data_area_descriptors(&self) -> Ref<'_, Vec<OptRc<Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor>>> {
        self.data_area_descriptors.borrow()
    }
}
impl Lvm2_PhysicalVolume_Label_VolumeHeader {
    pub fn metadata_area_descriptors(&self) -> Ref<'_, Vec<OptRc<Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor>>> {
        self.metadata_area_descriptors.borrow()
    }
}
impl Lvm2_PhysicalVolume_Label_VolumeHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor {
    pub _root: SharedType<Lvm2>,
    pub _parent: SharedType<Lvm2_PhysicalVolume_Label_VolumeHeader>,
    pub _self: SharedType<Self>,
    offset: RefCell<u64>,
    size: RefCell<u64>,
    _io: RefCell<BytesReader>,
    f_data: Cell<bool>,
    data: RefCell<String>,
}
impl KStruct for Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor {
    type Root = Lvm2;
    type Parent = Lvm2_PhysicalVolume_Label_VolumeHeader;

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
        *self_rc.offset.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.size.borrow_mut() = _io.read_u8le()?.into();
        Ok(())
    }
}
impl Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor {
    pub fn data(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_data.get() {
            return Ok(self.data.borrow());
        }
        self.f_data.set(true);
        if ((*self.size() as u64) != (0 as u64)) {
            let _pos = _io.pos();
            _io.seek(*self.offset() as usize)?;
            *self.data.borrow_mut() = bytes_to_str(&_io.read_bytes(*self.size() as usize)?.into(), "ASCII")?;
            _io.seek(_pos)?;
        }
        Ok(self.data.borrow())
    }
}

/**
 * The offset, in bytes, relative from the start of the physical volume
 */
impl Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor {
    pub fn offset(&self) -> Ref<'_, u64> {
        self.offset.borrow()
    }
}

/**
 * Value in bytes. Can be 0. [yellow-background]*Does this represent all remaining available space?*
 */
impl Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor {
    pub fn size(&self) -> Ref<'_, u64> {
        self.size.borrow()
    }
}
impl Lvm2_PhysicalVolume_Label_VolumeHeader_DataAreaDescriptor {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * According to `[REDHAT]` the metadata area is a circular buffer. New metadata is appended to the old metadata and then the pointer to the start of it is updated. The metadata area, therefore, can contain copies of older versions of the metadata.
 */

#[derive(Default, Debug, Clone)]
pub struct Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea {
    pub _root: SharedType<Lvm2>,
    pub _parent: SharedType<Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea {
    type Root = Lvm2;
    type Parent = Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor;

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
        let t = Self::read_into::<_, Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.header.borrow_mut() = t;
        Ok(())
    }
}
impl Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea {
}
impl Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea {
    pub fn header(&self) -> Ref<'_, OptRc<Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader>> {
        self.header.borrow()
    }
}
impl Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader {
    pub _root: SharedType<Lvm2>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    checksum: RefCell<OptRc<Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader>>,
    signature: RefCell<Vec<u8>>,
    version: RefCell<u32>,
    metadata_area_offset: RefCell<u64>,
    metadata_area_size: RefCell<u64>,
    raw_location_descriptors: RefCell<Vec<OptRc<Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor>>>,
    _io: RefCell<BytesReader>,
    f_metadata: Cell<bool>,
    metadata: RefCell<Vec<u8>>,
}
impl KStruct for Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader {
    type Root = Lvm2;
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
        let t = Self::read_into::<_, Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.checksum.borrow_mut() = t;
        *self_rc.signature.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        if !(*self_rc.signature() == vec![0x20u8, 0x4cu8, 0x56u8, 0x4du8, 0x32u8, 0x20u8, 0x78u8, 0x5bu8, 0x35u8, 0x41u8, 0x25u8, 0x72u8, 0x30u8, 0x4eu8, 0x2au8, 0x3eu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/physical_volume/types/label/types/volume_header/types/metadata_area/types/metadata_area_header/seq/1".to_string() }));
        }
        *self_rc.version.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.metadata_area_offset.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.metadata_area_size.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.raw_location_descriptors.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let t = Self::read_into::<_, Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.raw_location_descriptors.borrow_mut().push(t);
                let _t_raw_location_descriptors = self_rc.raw_location_descriptors.borrow();
                let _tmpa = _t_raw_location_descriptors.last().unwrap();
                _i += 1;
                let x = !( ((((*_tmpa.offset() as u64) != (0 as u64))) && (((*_tmpa.size() as u64) != (0 as u64))) && (((*_tmpa.checksum() as u32) != (0 as u32)))) );
                x
            } {}
        }
        Ok(())
    }
}
impl Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader {
    pub fn metadata(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_metadata.get() {
            return Ok(self.metadata.borrow());
        }
        self.f_metadata.set(true);
        let _pos = _io.pos();
        _io.seek(*self.metadata_area_offset() as usize)?;
        *self.metadata.borrow_mut() = _io.read_bytes(*self.metadata_area_size() as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.metadata.borrow())
    }
}

/**
 * CRC-32 for offset 4 to end of the metadata area header
 */
impl Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader {
    pub fn checksum(&self) -> Ref<'_, OptRc<Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader>> {
        self.checksum.borrow()
    }
}
impl Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader {
    pub fn signature(&self) -> Ref<'_, Vec<u8>> {
        self.signature.borrow()
    }
}
impl Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader {
    pub fn version(&self) -> Ref<'_, u32> {
        self.version.borrow()
    }
}

/**
 * The offset, in bytes, of the metadata area relative from the start of the physical volume
 */
impl Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader {
    pub fn metadata_area_offset(&self) -> Ref<'_, u64> {
        self.metadata_area_offset.borrow()
    }
}
impl Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader {
    pub fn metadata_area_size(&self) -> Ref<'_, u64> {
        self.metadata_area_size.borrow()
    }
}

/**
 * The last descriptor in the list is terminator and consists of 0-byte values.
 */
impl Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader {
    pub fn raw_location_descriptors(&self) -> Ref<'_, Vec<OptRc<Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor>>> {
        self.raw_location_descriptors.borrow()
    }
}
impl Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * The data area size can be 0. It is assumed it represents the remaining  available data.
 */

#[derive(Default, Debug, Clone)]
pub struct Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor {
    pub _root: SharedType<Lvm2>,
    pub _parent: SharedType<Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader>,
    pub _self: SharedType<Self>,
    offset: RefCell<u64>,
    size: RefCell<u64>,
    checksum: RefCell<u32>,
    flags: RefCell<Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor_RawLocationDescriptorFlags>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor {
    type Root = Lvm2;
    type Parent = Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader;

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
        *self_rc.offset.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.size.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.checksum.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.flags.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        Ok(())
    }
}
impl Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor {
}

/**
 * The data area offset, in bytes, relative from the start of the metadata area
 */
impl Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor {
    pub fn offset(&self) -> Ref<'_, u64> {
        self.offset.borrow()
    }
}

/**
 * data area size in bytes
 */
impl Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor {
    pub fn size(&self) -> Ref<'_, u64> {
        self.size.borrow()
    }
}

/**
 * CRC-32 of *TODO (metadata?)*
 */
impl Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor {
    pub fn checksum(&self) -> Ref<'_, u32> {
        self.checksum.borrow()
    }
}
impl Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor {
    pub fn flags(&self) -> Ref<'_, Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor_RawLocationDescriptorFlags> {
        self.flags.borrow()
    }
}
impl Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor_RawLocationDescriptorFlags {
    RawLocationIgnored,
    Unknown(i64),
}

impl TryFrom<i64> for Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor_RawLocationDescriptorFlags {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor_RawLocationDescriptorFlags> {
        match flag {
            1 => Ok(Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor_RawLocationDescriptorFlags::RawLocationIgnored),
            _ => Ok(Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor_RawLocationDescriptorFlags::Unknown(flag)),
        }
    }
}

impl From<&Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor_RawLocationDescriptorFlags> for i64 {
    fn from(v: &Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor_RawLocationDescriptorFlags) -> Self {
        match *v {
            Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor_RawLocationDescriptorFlags::RawLocationIgnored => 1,
            Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor_RawLocationDescriptorFlags::Unknown(v) => v
        }
    }
}

impl Default for Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor_RawLocationDescriptorFlags {
    fn default() -> Self { Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea_MetadataAreaHeader_RawLocationDescriptor_RawLocationDescriptorFlags::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor {
    pub _root: SharedType<Lvm2>,
    pub _parent: SharedType<Lvm2_PhysicalVolume_Label_VolumeHeader>,
    pub _self: SharedType<Self>,
    offset: RefCell<u64>,
    size: RefCell<u64>,
    _io: RefCell<BytesReader>,
    data_raw: RefCell<Vec<u8>>,
    f_data: Cell<bool>,
    data: RefCell<OptRc<Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea>>,
}
impl KStruct for Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor {
    type Root = Lvm2;
    type Parent = Lvm2_PhysicalVolume_Label_VolumeHeader;

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
        *self_rc.offset.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.size.borrow_mut() = _io.read_u8le()?.into();
        Ok(())
    }
}
impl Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor {
    pub fn data(
        &self
    ) -> KResult<Ref<'_, OptRc<Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_data.get() {
            return Ok(self.data.borrow());
        }
        if ((*self.size() as u64) != (0 as u64)) {
            let _pos = _io.pos();
            _io.seek(*self.offset() as usize)?;
            *self.data_raw.borrow_mut() = _io.read_bytes(*self.size() as usize)?.into();
            let data_raw = self.data_raw.borrow();
            let _t_data_raw_io = BytesReader::from(data_raw.clone());
            let t = Self::read_into::<BytesReader, Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataArea>(&_t_data_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.data.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.data.borrow())
    }
}

/**
 * The offset, in bytes, relative from the start of the physical volume
 */
impl Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor {
    pub fn offset(&self) -> Ref<'_, u64> {
        self.offset.borrow()
    }
}

/**
 * Value in bytes
 */
impl Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor {
    pub fn size(&self) -> Ref<'_, u64> {
        self.size.borrow()
    }
}
impl Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Lvm2_PhysicalVolume_Label_VolumeHeader_MetadataAreaDescriptor {
    pub fn data_raw(&self) -> Ref<'_, Vec<u8>> {
        self.data_raw.borrow()
    }
}

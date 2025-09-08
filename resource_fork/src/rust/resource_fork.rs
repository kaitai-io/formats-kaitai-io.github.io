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
 * The data format of Macintosh resource forks,
 * used on Classic Mac OS and Mac OS X/macOS to store additional structured data along with a file's main data (the data fork).
 * The kinds of data stored in resource forks include:
 * 
 * * Document resources:
 *   images, sounds, etc. used by a document
 * * Application resources:
 *   graphics, GUI layouts, localizable strings,
 *   and even code used by an application, a library, or system files
 * * Common metadata:
 *   custom icons and version metadata that could be displayed by the Finder
 * * Application-specific metadata:
 *   because resource forks follow a common format,
 *   other applications can store new metadata in them,
 *   even if the original application does not recognize or understand it
 * 
 * Macintosh file systems (MFS, HFS, HFS+, APFS) support resource forks natively,
 * which allows storing resources along with any file.
 * Non-Macintosh file systems and protocols have little or no support for resource forks,
 * so the resource fork data must be stored in some other way when using such file systems or protocols.
 * Various file formats and tools exist for this purpose,
 * such as BinHex, MacBinary, AppleSingle, AppleDouble, or QuickTime RezWack.
 * In some cases,
 * resource forks are stored as plain data in separate files with a .rsrc extension,
 * even on Mac systems that natively support resource forks.
 * 
 * On modern Mac OS X/macOS systems,
 * resource forks are used far less commonly than on classic Mac OS systems,
 * because of compatibility issues with other systems and historical limitations in the format.
 * Modern macOS APIs and libraries do not use resource forks,
 * and the legacy Carbon API that still used them has been deprecated since OS X 10.8.
 * Despite this,
 * even current macOS systems still use resource forks for certain purposes,
 * such as custom file icons.
 * \sa https://developer.apple.com/library/archive/documentation/mac/pdf/MoreMacintoshToolbox.pdf#page=151 Inside Macintosh, More Macintosh Toolbox, Resource Manager, Resource Manager Reference, Resource File Format
 * \sa https://www.pagetable.com/?p=50 Inside Macintosh, Volume I, The Resource Manager, Format of a Resource File
 * \sa https://github.com/kreativekorp/ksfl/wiki/Macintosh-Resource-File-Format Source
 * \sa https://github.com/dgelessus/mac_file_format_docs/blob/master/README.md#resource-forks Source
 */

#[derive(Default, Debug, Clone)]
pub struct ResourceFork {
    pub _root: SharedType<ResourceFork>,
    pub _parent: SharedType<ResourceFork>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<ResourceFork_FileHeader>>,
    system_data: RefCell<Vec<u8>>,
    application_data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    data_blocks_with_io_raw: RefCell<Vec<u8>>,
    resource_map_raw: RefCell<Vec<u8>>,
    f_data_blocks: Cell<bool>,
    data_blocks: RefCell<Vec<u8>>,
    f_data_blocks_with_io: Cell<bool>,
    data_blocks_with_io: RefCell<OptRc<BytesWithIo>>,
    f_resource_map: Cell<bool>,
    resource_map: RefCell<OptRc<ResourceFork_ResourceMap>>,
}
impl KStruct for ResourceFork {
    type Root = ResourceFork;
    type Parent = ResourceFork;

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
        let t = Self::read_into::<_, ResourceFork_FileHeader>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.header.borrow_mut() = t;
        *self_rc.system_data.borrow_mut() = _io.read_bytes(112 as usize)?.into();
        *self_rc.application_data.borrow_mut() = _io.read_bytes(128 as usize)?.into();
        Ok(())
    }
}
impl ResourceFork {

    /**
     * Storage area for the data blocks of all resources.
     * 
     * These data blocks are not required to appear in any particular order,
     * and there may be unused space between and around them.
     * 
     * In practice,
     * the data blocks in newly created resource files are usually contiguous.
     * When existing resources are shortened,
     * the Mac OS resource manager leaves unused space where the now removed resource data was,
     * as this is quicker than moving the following resource data into the newly freed space.
     * Such unused space may be cleaned up later when the resource manager "compacts" the resource file,
     * which happens when resources are removed entirely,
     * or when resources are added or grown so that more space is needed in the data area.
     */
    pub fn data_blocks(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_data_blocks.get() {
            return Ok(self.data_blocks.borrow());
        }
        self.f_data_blocks.set(true);
        *self.data_blocks.borrow_mut() = self.data_blocks_with_io()?.data().to_vec();
        Ok(self.data_blocks.borrow())
    }

    /**
     * Use `data_blocks` instead,
     * unless you need access to this instance's `_io`.
     */
    pub fn data_blocks_with_io(
        &self
    ) -> KResult<Ref<'_, OptRc<BytesWithIo>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_data_blocks_with_io.get() {
            return Ok(self.data_blocks_with_io.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*self.header().ofs_data_blocks() as usize)?;
        *self.data_blocks_with_io_raw.borrow_mut() = _io.read_bytes(*self.header().len_data_blocks() as usize)?.into();
        let data_blocks_with_io_raw = self.data_blocks_with_io_raw.borrow();
        let _t_data_blocks_with_io_raw_io = BytesReader::from(data_blocks_with_io_raw.clone());
        let t = Self::read_into::<BytesReader, BytesWithIo>(&_t_data_blocks_with_io_raw_io, None, None)?.into();
        *self.data_blocks_with_io.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.data_blocks_with_io.borrow())
    }

    /**
     * The resource file's resource map.
     */
    pub fn resource_map(
        &self
    ) -> KResult<Ref<'_, OptRc<ResourceFork_ResourceMap>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_resource_map.get() {
            return Ok(self.resource_map.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*self.header().ofs_resource_map() as usize)?;
        *self.resource_map_raw.borrow_mut() = _io.read_bytes(*self.header().len_resource_map() as usize)?.into();
        let resource_map_raw = self.resource_map_raw.borrow();
        let _t_resource_map_raw_io = BytesReader::from(resource_map_raw.clone());
        let t = Self::read_into::<BytesReader, ResourceFork_ResourceMap>(&_t_resource_map_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.resource_map.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.resource_map.borrow())
    }
}

/**
 * The resource file's header information.
 */
impl ResourceFork {
    pub fn header(&self) -> Ref<'_, OptRc<ResourceFork_FileHeader>> {
        self.header.borrow()
    }
}

/**
 * System-reserved data area.
 * This field can generally be ignored when reading and writing.
 * 
 * This field is used by the Classic Mac OS Finder as temporary storage space.
 * It usually contains parts of the file metadata (name, type/creator code, etc.).
 * Any existing data in this field is ignored and overwritten.
 * 
 * In resource files written by Mac OS X,
 * this field is set to all zero bytes.
 */
impl ResourceFork {
    pub fn system_data(&self) -> Ref<'_, Vec<u8>> {
        self.system_data.borrow()
    }
}

/**
 * Application-specific data area.
 * This field can generally be ignored when reading and writing.
 * 
 * According to early revisions of Inside Macintosh,
 * this field is "available for application data".
 * In practice, it is almost never used for this purpose,
 * and usually contains only junk data.
 * 
 * In resource files written by Mac OS X,
 * this field is set to all zero bytes.
 */
impl ResourceFork {
    pub fn application_data(&self) -> Ref<'_, Vec<u8>> {
        self.application_data.borrow()
    }
}
impl ResourceFork {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl ResourceFork {
    pub fn data_blocks_with_io_raw(&self) -> Ref<'_, Vec<u8>> {
        self.data_blocks_with_io_raw.borrow()
    }
}
impl ResourceFork {
    pub fn resource_map_raw(&self) -> Ref<'_, Vec<u8>> {
        self.resource_map_raw.borrow()
    }
}

/**
 * A resource data block,
 * as stored in the resource data area.
 * 
 * Each data block stores the data contained in a resource,
 * along with its length.
 */

#[derive(Default, Debug, Clone)]
pub struct ResourceFork_DataBlock {
    pub _root: SharedType<ResourceFork>,
    pub _parent: SharedType<ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference>,
    pub _self: SharedType<Self>,
    len_data: RefCell<u32>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for ResourceFork_DataBlock {
    type Root = ResourceFork;
    type Parent = ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference;

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
        *self_rc.len_data.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.data.borrow_mut() = _io.read_bytes(*self_rc.len_data() as usize)?.into();
        Ok(())
    }
}
impl ResourceFork_DataBlock {
}

/**
 * The length of the resource data stored in this block.
 */
impl ResourceFork_DataBlock {
    pub fn len_data(&self) -> Ref<'_, u32> {
        self.len_data.borrow()
    }
}

/**
 * The data stored in this block.
 */
impl ResourceFork_DataBlock {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl ResourceFork_DataBlock {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Resource file header,
 * containing the offsets and lengths of the resource data area and resource map.
 */

#[derive(Default, Debug, Clone)]
pub struct ResourceFork_FileHeader {
    pub _root: SharedType<ResourceFork>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    ofs_data_blocks: RefCell<u32>,
    ofs_resource_map: RefCell<u32>,
    len_data_blocks: RefCell<u32>,
    len_resource_map: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for ResourceFork_FileHeader {
    type Root = ResourceFork;
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
        *self_rc.ofs_data_blocks.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.ofs_resource_map.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.len_data_blocks.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.len_resource_map.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl ResourceFork_FileHeader {
}

/**
 * Offset of the resource data area,
 * from the start of the resource file.
 * 
 * In practice,
 * this should always be `256`,
 * i. e. the resource data area should directly follow the application-specific data area.
 */
impl ResourceFork_FileHeader {
    pub fn ofs_data_blocks(&self) -> Ref<'_, u32> {
        self.ofs_data_blocks.borrow()
    }
}

/**
 * Offset of the resource map,
 * from the start of the resource file.
 * 
 * In practice,
 * this should always be `ofs_data_blocks + len_data_blocks`,
 * i. e. the resource map should directly follow the resource data area.
 */
impl ResourceFork_FileHeader {
    pub fn ofs_resource_map(&self) -> Ref<'_, u32> {
        self.ofs_resource_map.borrow()
    }
}

/**
 * Length of the resource data area.
 */
impl ResourceFork_FileHeader {
    pub fn len_data_blocks(&self) -> Ref<'_, u32> {
        self.len_data_blocks.borrow()
    }
}

/**
 * Length of the resource map.
 * 
 * In practice,
 * this should always be `_root._io.size - ofs_resource_map`,
 * i. e. the resource map should extend to the end of the resource file.
 */
impl ResourceFork_FileHeader {
    pub fn len_resource_map(&self) -> Ref<'_, u32> {
        self.len_resource_map.borrow()
    }
}
impl ResourceFork_FileHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Resource map,
 * containing information about the resources in the file and where they are located in the data area.
 */

#[derive(Default, Debug, Clone)]
pub struct ResourceFork_ResourceMap {
    pub _root: SharedType<ResourceFork>,
    pub _parent: SharedType<ResourceFork>,
    pub _self: SharedType<Self>,
    reserved_file_header_copy: RefCell<OptRc<ResourceFork_FileHeader>>,
    reserved_next_resource_map_handle: RefCell<u32>,
    reserved_file_reference_number: RefCell<u16>,
    file_attributes: RefCell<OptRc<ResourceFork_ResourceMap_FileAttributes>>,
    ofs_type_list: RefCell<u16>,
    ofs_names: RefCell<u16>,
    _io: RefCell<BytesReader>,
    file_attributes_raw: RefCell<Vec<u8>>,
    names_with_io_raw: RefCell<Vec<u8>>,
    type_list_and_reference_lists_raw: RefCell<Vec<u8>>,
    f_names: Cell<bool>,
    names: RefCell<Vec<u8>>,
    f_names_with_io: Cell<bool>,
    names_with_io: RefCell<OptRc<BytesWithIo>>,
    f_type_list_and_reference_lists: Cell<bool>,
    type_list_and_reference_lists: RefCell<OptRc<ResourceFork_ResourceMap_TypeListAndReferenceLists>>,
}
impl KStruct for ResourceFork_ResourceMap {
    type Root = ResourceFork;
    type Parent = ResourceFork;

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
        let t = Self::read_into::<_, ResourceFork_FileHeader>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.reserved_file_header_copy.borrow_mut() = t;
        *self_rc.reserved_next_resource_map_handle.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.reserved_file_reference_number.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.file_attributes_raw.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        let file_attributes_raw = self_rc.file_attributes_raw.borrow();
        let _t_file_attributes_raw_io = BytesReader::from(file_attributes_raw.clone());
        let t = Self::read_into::<BytesReader, ResourceFork_ResourceMap_FileAttributes>(&_t_file_attributes_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.file_attributes.borrow_mut() = t;
        *self_rc.ofs_type_list.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.ofs_names.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl ResourceFork_ResourceMap {

    /**
     * Storage area for the names of all resources.
     */
    pub fn names(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_names.get() {
            return Ok(self.names.borrow());
        }
        self.f_names.set(true);
        *self.names.borrow_mut() = self.names_with_io()?.data().to_vec();
        Ok(self.names.borrow())
    }

    /**
     * Use `names` instead,
     * unless you need access to this instance's `_io`.
     */
    pub fn names_with_io(
        &self
    ) -> KResult<Ref<'_, OptRc<BytesWithIo>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_names_with_io.get() {
            return Ok(self.names_with_io.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*self.ofs_names() as usize)?;
        *self.names_with_io_raw.borrow_mut() = _io.read_bytes_full()?.into();
        let names_with_io_raw = self.names_with_io_raw.borrow();
        let _t_names_with_io_raw_io = BytesReader::from(names_with_io_raw.clone());
        let t = Self::read_into::<BytesReader, BytesWithIo>(&_t_names_with_io_raw_io, None, None)?.into();
        *self.names_with_io.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.names_with_io.borrow())
    }

    /**
     * The resource map's resource type list, followed by the resource reference list area.
     */
    pub fn type_list_and_reference_lists(
        &self
    ) -> KResult<Ref<'_, OptRc<ResourceFork_ResourceMap_TypeListAndReferenceLists>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_type_list_and_reference_lists.get() {
            return Ok(self.type_list_and_reference_lists.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*self.ofs_type_list() as usize)?;
        *self.type_list_and_reference_lists_raw.borrow_mut() = _io.read_bytes(((*self.ofs_names() as u16) - (*self.ofs_type_list() as u16)) as usize)?.into();
        let type_list_and_reference_lists_raw = self.type_list_and_reference_lists_raw.borrow();
        let _t_type_list_and_reference_lists_raw_io = BytesReader::from(type_list_and_reference_lists_raw.clone());
        let t = Self::read_into::<BytesReader, ResourceFork_ResourceMap_TypeListAndReferenceLists>(&_t_type_list_and_reference_lists_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.type_list_and_reference_lists.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.type_list_and_reference_lists.borrow())
    }
}

/**
 * Reserved space for a copy of the resource file header.
 */
impl ResourceFork_ResourceMap {
    pub fn reserved_file_header_copy(&self) -> Ref<'_, OptRc<ResourceFork_FileHeader>> {
        self.reserved_file_header_copy.borrow()
    }
}

/**
 * Reserved space for a handle to the next loaded resource map in memory.
 */
impl ResourceFork_ResourceMap {
    pub fn reserved_next_resource_map_handle(&self) -> Ref<'_, u32> {
        self.reserved_next_resource_map_handle.borrow()
    }
}

/**
 * Reserved space for the resource file's file reference number.
 */
impl ResourceFork_ResourceMap {
    pub fn reserved_file_reference_number(&self) -> Ref<'_, u16> {
        self.reserved_file_reference_number.borrow()
    }
}

/**
 * The resource file's attributes.
 */
impl ResourceFork_ResourceMap {
    pub fn file_attributes(&self) -> Ref<'_, OptRc<ResourceFork_ResourceMap_FileAttributes>> {
        self.file_attributes.borrow()
    }
}

/**
 * Offset of the resource type list,
 * from the start of the resource map.
 * 
 * In practice,
 * this should always be `sizeof<resource_map>`,
 * i. e. the resource type list should directly follow the resource map.
 */
impl ResourceFork_ResourceMap {
    pub fn ofs_type_list(&self) -> Ref<'_, u16> {
        self.ofs_type_list.borrow()
    }
}

/**
 * Offset of the resource name area,
 * from the start of the resource map.
 */
impl ResourceFork_ResourceMap {
    pub fn ofs_names(&self) -> Ref<'_, u16> {
        self.ofs_names.borrow()
    }
}
impl ResourceFork_ResourceMap {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl ResourceFork_ResourceMap {
    pub fn file_attributes_raw(&self) -> Ref<'_, Vec<u8>> {
        self.file_attributes_raw.borrow()
    }
}
impl ResourceFork_ResourceMap {
    pub fn names_with_io_raw(&self) -> Ref<'_, Vec<u8>> {
        self.names_with_io_raw.borrow()
    }
}
impl ResourceFork_ResourceMap {
    pub fn type_list_and_reference_lists_raw(&self) -> Ref<'_, Vec<u8>> {
        self.type_list_and_reference_lists_raw.borrow()
    }
}

/**
 * A resource file's attributes,
 * as stored in the resource map.
 * 
 * These attributes are sometimes also referred to as resource map attributes,
 * because of where they are stored in the file.
 */

#[derive(Default, Debug, Clone)]
pub struct ResourceFork_ResourceMap_FileAttributes {
    pub _root: SharedType<ResourceFork>,
    pub _parent: SharedType<ResourceFork_ResourceMap>,
    pub _self: SharedType<Self>,
    resources_locked: RefCell<bool>,
    reserved0: RefCell<u64>,
    printer_driver_multifinder_compatible: RefCell<bool>,
    no_write_changes: RefCell<bool>,
    needs_compact: RefCell<bool>,
    map_needs_write: RefCell<bool>,
    reserved1: RefCell<u64>,
    _io: RefCell<BytesReader>,
    f_as_int: Cell<bool>,
    as_int: RefCell<u16>,
}
impl KStruct for ResourceFork_ResourceMap_FileAttributes {
    type Root = ResourceFork;
    type Parent = ResourceFork_ResourceMap;

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
        *self_rc.resources_locked.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.reserved0.borrow_mut() = _io.read_bits_int_be(6)?;
        *self_rc.printer_driver_multifinder_compatible.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.no_write_changes.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.needs_compact.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.map_needs_write.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.reserved1.borrow_mut() = _io.read_bits_int_be(5)?;
        Ok(())
    }
}
impl ResourceFork_ResourceMap_FileAttributes {

    /**
     * The attributes as a packed integer,
     * as they are stored in the file.
     */
    pub fn as_int(
        &self
    ) -> KResult<Ref<'_, u16>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_as_int.get() {
            return Ok(self.as_int.borrow());
        }
        self.f_as_int.set(true);
        let _pos = _io.pos();
        _io.seek(0 as usize)?;
        *self.as_int.borrow_mut() = _io.read_u2be()?.into();
        _io.seek(_pos)?;
        Ok(self.as_int.borrow())
    }
}

/**
 * TODO What does this attribute actually do,
 * and how is it different from `read_only`?
 * 
 * This attribute is undocumented and not defined in <CarbonCore/Resources.h>,
 * but ResEdit has a checkbox called "Resources Locked" for this attribute.
 */
impl ResourceFork_ResourceMap_FileAttributes {
    pub fn resources_locked(&self) -> Ref<'_, bool> {
        self.resources_locked.borrow()
    }
}

/**
 * These attributes have no known usage or meaning and should always be zero.
 */
impl ResourceFork_ResourceMap_FileAttributes {
    pub fn reserved0(&self) -> Ref<'_, u64> {
        self.reserved0.borrow()
    }
}

/**
 * Indicates that this printer driver is compatible with MultiFinder,
 * i. e. can be used simultaneously by multiple applications.
 * This attribute is only meant to be set on printer driver resource forks.
 * 
 * This attribute is not documented in Inside Macintosh and is not defined in <CarbonCore/Resources.h>.
 * It is documented in technote PR510,
 * and ResEdit has a checkbox called "Printer Driver MultiFinder Compatible" for this attribute.
 * \sa https://developer.apple.com/library/archive/technotes/pr/pr_510.html Apple Technical Note PR510 - Printer Driver Q&As, section '"Printer driver is MultiFinder compatible" bit'
 */
impl ResourceFork_ResourceMap_FileAttributes {
    pub fn printer_driver_multifinder_compatible(&self) -> Ref<'_, bool> {
        self.printer_driver_multifinder_compatible.borrow()
    }
}

/**
 * Indicates that the Resource Manager should not write any changes from memory into the resource file.
 * Any modification operations requested by the application will return successfully,
 * but will not actually update the resource file.
 * 
 * TODO Is this attribute supposed to be set on disk or only in memory?
 */
impl ResourceFork_ResourceMap_FileAttributes {
    pub fn no_write_changes(&self) -> Ref<'_, bool> {
        self.no_write_changes.borrow()
    }
}

/**
 * Indicates that the resource file should be compacted the next time it is written by the Resource Manager.
 * This attribute is only meant to be set in memory;
 * it is cleared when the resource file is written to disk.
 * 
 * This attribute is mainly used internally by the Resource Manager,
 * but may also be set manually by the application.
 */
impl ResourceFork_ResourceMap_FileAttributes {
    pub fn needs_compact(&self) -> Ref<'_, bool> {
        self.needs_compact.borrow()
    }
}

/**
 * Indicates that the resource map has been changed in memory and should be written to the resource file on the next update.
 * This attribute is only meant to be set in memory;
 * it is cleared when the resource file is written to disk.
 * 
 * This attribute is mainly used internally by the Resource Manager,
 * but may also be set manually by the application.
 */
impl ResourceFork_ResourceMap_FileAttributes {
    pub fn map_needs_write(&self) -> Ref<'_, bool> {
        self.map_needs_write.borrow()
    }
}

/**
 * These attributes have no known usage or meaning and should always be zero.
 */
impl ResourceFork_ResourceMap_FileAttributes {
    pub fn reserved1(&self) -> Ref<'_, u64> {
        self.reserved1.borrow()
    }
}
impl ResourceFork_ResourceMap_FileAttributes {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * A resource name,
 * as stored in the resource name storage area in the resource map.
 * 
 * The resource names are not required to appear in any particular order.
 * There may be unused space between and around resource names,
 * but in practice they are often contiguous.
 */

#[derive(Default, Debug, Clone)]
pub struct ResourceFork_ResourceMap_Name {
    pub _root: SharedType<ResourceFork>,
    pub _parent: SharedType<ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference>,
    pub _self: SharedType<Self>,
    len_value: RefCell<u8>,
    value: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for ResourceFork_ResourceMap_Name {
    type Root = ResourceFork;
    type Parent = ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference;

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
        *self_rc.len_value.borrow_mut() = _io.read_u1()?.into();
        *self_rc.value.borrow_mut() = _io.read_bytes(*self_rc.len_value() as usize)?.into();
        Ok(())
    }
}
impl ResourceFork_ResourceMap_Name {
}

/**
 * The length of the resource name, in bytes.
 */
impl ResourceFork_ResourceMap_Name {
    pub fn len_value(&self) -> Ref<'_, u8> {
        self.len_value.borrow()
    }
}

/**
 * The resource name.
 * 
 * This field is exposed as a byte array,
 * because there is no universal encoding for resource names.
 * Most Classic Mac software does not deal with encodings explicitly and instead assumes that all strings,
 * including resource names,
 * use the system encoding,
 * which varies depending on the system language.
 * This means that resource names can use different encodings depending on what system language they were created with.
 * 
 * Many resource names are plain ASCII,
 * meaning that the encoding often does not matter
 * (because all Mac OS encodings are ASCII-compatible).
 * For non-ASCII resource names,
 * the most common encoding is perhaps MacRoman
 * (used for English and other Western languages),
 * but other encodings are also sometimes used,
 * especially for software in non-Western languages.
 * 
 * There is no requirement that all names in a single resource file use the same encoding.
 * For example,
 * localized software may have some (but not all) of its resource names translated.
 * For non-Western languages,
 * this can lead to some resource names using MacRoman,
 * and others using a different encoding.
 */
impl ResourceFork_ResourceMap_Name {
    pub fn value(&self) -> Ref<'_, Vec<u8>> {
        self.value.borrow()
    }
}
impl ResourceFork_ResourceMap_Name {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Resource type list and storage area for resource reference lists in the resource map.
 * 
 * The two parts are combined into a single type here for technical reasons:
 * the start of the resource reference list area is not stored explicitly in the file,
 * instead it always starts directly after the resource type list.
 * The simplest way to implement this is by placing both types into a single `seq`.
 */

#[derive(Default, Debug, Clone)]
pub struct ResourceFork_ResourceMap_TypeListAndReferenceLists {
    pub _root: SharedType<ResourceFork>,
    pub _parent: SharedType<ResourceFork_ResourceMap>,
    pub _self: SharedType<Self>,
    type_list: RefCell<OptRc<ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList>>,
    reference_lists: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for ResourceFork_ResourceMap_TypeListAndReferenceLists {
    type Root = ResourceFork;
    type Parent = ResourceFork_ResourceMap;

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
        let t = Self::read_into::<_, ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.type_list.borrow_mut() = t;
        *self_rc.reference_lists.borrow_mut() = _io.read_bytes_full()?.into();
        Ok(())
    }
}
impl ResourceFork_ResourceMap_TypeListAndReferenceLists {
}

/**
 * The resource map's resource type list.
 */
impl ResourceFork_ResourceMap_TypeListAndReferenceLists {
    pub fn type_list(&self) -> Ref<'_, OptRc<ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList>> {
        self.type_list.borrow()
    }
}

/**
 * Storage area for the resource map's resource reference lists.
 * 
 * According to Inside Macintosh,
 * the reference lists are stored contiguously,
 * in the same order as their corresponding resource type list entries.
 */
impl ResourceFork_ResourceMap_TypeListAndReferenceLists {
    pub fn reference_lists(&self) -> Ref<'_, Vec<u8>> {
        self.reference_lists.borrow()
    }
}
impl ResourceFork_ResourceMap_TypeListAndReferenceLists {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * A resource reference list,
 * as stored in the reference list area.
 * 
 * Each reference list has exactly one matching entry in the resource type list,
 * and describes all resources of a single type in the file.
 */

#[derive(Default, Debug, Clone)]
pub struct ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList {
    pub _root: SharedType<ResourceFork>,
    pub _parent: SharedType<ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry>,
    pub _self: SharedType<Self>,
    num_references: RefCell<u16>,
    references: RefCell<Vec<OptRc<ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList {
    type Root = ResourceFork;
    type Parent = ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry;

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
        *self_rc.references.borrow_mut() = Vec::new();
        let l_references = *self_rc.num_references();
        for _i in 0..l_references {
            let t = Self::read_into::<_, ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.references.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList {
    pub fn num_references(&self) -> Ref<'_, u16> {
        self.num_references.borrow()
    }
}
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList {
    pub fn set_params(&mut self, num_references: u16) {
        *self.num_references.borrow_mut() = num_references;
    }
}
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList {
}

/**
 * The resource references in this reference list.
 */
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList {
    pub fn references(&self) -> Ref<'_, Vec<OptRc<ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference>>> {
        self.references.borrow()
    }
}
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * A single resource reference in a resource reference list.
 */

#[derive(Default, Debug, Clone)]
pub struct ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference {
    pub _root: SharedType<ResourceFork>,
    pub _parent: SharedType<ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList>,
    pub _self: SharedType<Self>,
    id: RefCell<i16>,
    ofs_name: RefCell<u16>,
    attributes: RefCell<OptRc<ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes>>,
    ofs_data_block: RefCell<u64>,
    reserved_handle: RefCell<u32>,
    _io: RefCell<BytesReader>,
    attributes_raw: RefCell<Vec<u8>>,
    f_data_block: Cell<bool>,
    data_block: RefCell<OptRc<ResourceFork_DataBlock>>,
    f_name: Cell<bool>,
    name: RefCell<OptRc<ResourceFork_ResourceMap_Name>>,
}
impl KStruct for ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference {
    type Root = ResourceFork;
    type Parent = ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList;

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
        *self_rc.id.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.ofs_name.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.attributes_raw.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        let attributes_raw = self_rc.attributes_raw.borrow();
        let _t_attributes_raw_io = BytesReader::from(attributes_raw.clone());
        let t = Self::read_into::<BytesReader, ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes>(&_t_attributes_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.attributes.borrow_mut() = t;
        *self_rc.ofs_data_block.borrow_mut() = _io.read_bits_int_be(24)?;
        _io.align_to_byte()?;
        *self_rc.reserved_handle.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference {

    /**
     * The data block containing the data for the resource described by this reference.
     */
    pub fn data_block(
        &self
    ) -> KResult<Ref<'_, OptRc<ResourceFork_DataBlock>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_data_block.get() {
            return Ok(self.data_block.borrow());
        }
        let io = Clone::clone(&*_r.data_blocks_with_io()?._io());
        let _pos = io.pos();
        io.seek(*self.ofs_data_block() as usize)?;
        let t = Self::read_into::<BytesReader, ResourceFork_DataBlock>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.data_block.borrow_mut() = t;
        io.seek(_pos)?;
        Ok(self.data_block.borrow())
    }

    /**
     * The name (if any) of the resource described by this reference.
     */
    pub fn name(
        &self
    ) -> KResult<Ref<'_, OptRc<ResourceFork_ResourceMap_Name>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name.get() {
            return Ok(self.name.borrow());
        }
        if ((*self.ofs_name() as i32) != (65535 as i32)) {
            let io = Clone::clone(&*_r.resource_map()?.names_with_io()?._io());
            let _pos = io.pos();
            io.seek(*self.ofs_name() as usize)?;
            let t = Self::read_into::<BytesReader, ResourceFork_ResourceMap_Name>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.name.borrow_mut() = t;
            io.seek(_pos)?;
        }
        Ok(self.name.borrow())
    }
}

/**
 * ID of the resource described by this reference.
 */
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference {
    pub fn id(&self) -> Ref<'_, i16> {
        self.id.borrow()
    }
}

/**
 * Offset of the name for the resource described by this reference,
 * from the start of the resource name area.
 * 
 * If the resource has no name,
 * the value of this field is `0xffff`
 * i. e. `-1` truncated to a 16-bit unsigned integer.
 */
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference {
    pub fn ofs_name(&self) -> Ref<'_, u16> {
        self.ofs_name.borrow()
    }
}

/**
 * Attributes of the resource described by this reference.
 */
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference {
    pub fn attributes(&self) -> Ref<'_, OptRc<ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes>> {
        self.attributes.borrow()
    }
}

/**
 * Offset of the data block for the resource described by this reference,
 * from the start of the resource data area.
 */
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference {
    pub fn ofs_data_block(&self) -> Ref<'_, u64> {
        self.ofs_data_block.borrow()
    }
}

/**
 * Reserved space for the resource's handle in memory.
 */
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference {
    pub fn reserved_handle(&self) -> Ref<'_, u32> {
        self.reserved_handle.borrow()
    }
}
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference {
    pub fn attributes_raw(&self) -> Ref<'_, Vec<u8>> {
        self.attributes_raw.borrow()
    }
}

/**
 * A resource's attributes,
 * as stored in a resource reference.
 */

#[derive(Default, Debug, Clone)]
pub struct ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes {
    pub _root: SharedType<ResourceFork>,
    pub _parent: SharedType<ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference>,
    pub _self: SharedType<Self>,
    system_reference: RefCell<bool>,
    load_into_system_heap: RefCell<bool>,
    purgeable: RefCell<bool>,
    locked: RefCell<bool>,
    protected: RefCell<bool>,
    preload: RefCell<bool>,
    needs_write: RefCell<bool>,
    compressed: RefCell<bool>,
    _io: RefCell<BytesReader>,
    f_as_int: Cell<bool>,
    as_int: RefCell<u8>,
}
impl KStruct for ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes {
    type Root = ResourceFork;
    type Parent = ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference;

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
        *self_rc.system_reference.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.load_into_system_heap.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.purgeable.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.locked.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.protected.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.preload.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.needs_write.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.compressed.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        Ok(())
    }
}
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes {

    /**
     * The attributes as a packed integer,
     * as they are stored in the file.
     */
    pub fn as_int(
        &self
    ) -> KResult<Ref<'_, u8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_as_int.get() {
            return Ok(self.as_int.borrow());
        }
        self.f_as_int.set(true);
        let _pos = _io.pos();
        _io.seek(0 as usize)?;
        *self.as_int.borrow_mut() = _io.read_u1()?.into();
        _io.seek(_pos)?;
        Ok(self.as_int.borrow())
    }
}

/**
 * Indicates that this resource reference is a system reference rather than a regular local reference.
 * This attribute is nearly undocumented.
 * For all practical purposes,
 * it should be considered reserved and should always be zero.
 * 
 * This attribute was last documented in the Promotional Edition of Inside Macintosh,
 * in the Resource Manager chapter,
 * on pages 37-41,
 * in a "System References" section that calls itself "of historical interest only".
 * The final versions of Inside Macintosh only mention this attribute as "reserved for use by the Resource Manager".
 * <CarbonCore/Resources.h> contains a `resSysRefBit` constant,
 * but no corresponding `resSysRef` constant like for all other resource attributes.
 * 
 * According to the Inside Macintosh Promotional Edition,
 * a system reference was effectively an alias pointing to a resource stored in the system file,
 * possibly with a different ID and name (but not type) than the system reference.
 * If this attribute is set,
 * `ofs_data_block` is ignored and should be zero,
 * and `reserved_handle` contains
 * (in its high and low two bytes, respectively)
 * the ID and name offset of the real system resource that this system reference points to.
 * 
 * TODO Do any publicly available Mac OS versions support system references,
 * and do any real files/applications use them?
 * So far the answer seems to be no,
 * but I would like to be proven wrong!
 */
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes {
    pub fn system_reference(&self) -> Ref<'_, bool> {
        self.system_reference.borrow()
    }
}

/**
 * Indicates that this resource should be loaded into the system heap if possible,
 * rather than the application heap.
 * 
 * This attribute is only meant to be used by Mac OS itself,
 * for System and Finder resources,
 * and not by normal applications.
 * 
 * This attribute may be set both in memory and on disk,
 * but it only has any meaning while the resource file is loaded into memory.
 */
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes {
    pub fn load_into_system_heap(&self) -> Ref<'_, bool> {
        self.load_into_system_heap.borrow()
    }
}

/**
 * Indicates that this resource's data should be purgeable by the Mac OS Memory Manager.
 * This allows the resource data to be purged from memory if space is needed on the heap.
 * Purged resources can later be reloaded from disk if their data is needed again.
 * 
 * If the `locked` attribute is set,
 * this attribute has no effect
 * (i. e. locked resources are never purgeable).
 * 
 * This attribute may be set both in memory and on disk,
 * but it only has any meaning while the resource file is loaded into memory.
 */
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes {
    pub fn purgeable(&self) -> Ref<'_, bool> {
        self.purgeable.borrow()
    }
}

/**
 * Indicates that this resource's data should be locked to the Mac OS Memory Manager.
 * This prevents the resource data from being moved when the heap is compacted.
 * 
 * This attribute may be set both in memory and on disk,
 * but it only has any meaning while the resource file is loaded into memory.
 */
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes {
    pub fn locked(&self) -> Ref<'_, bool> {
        self.locked.borrow()
    }
}

/**
 * Indicates that this resource should be protected (i. e. unmodifiable) in memory.
 * This prevents the application from using the Resource Manager to change the resource's data or metadata,
 * or delete it.
 * The only exception are the resource's attributes,
 * which can always be changed,
 * even for protected resources.
 * This allows protected resources to be unprotected again by the application.
 * 
 * This attribute may be set both in memory and on disk,
 * but it only has any meaning while the resource file is loaded into memory.
 */
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes {
    pub fn protected(&self) -> Ref<'_, bool> {
        self.protected.borrow()
    }
}

/**
 * Indicates that this resource's data should be immediately loaded into memory when the resource file is opened.
 * 
 * This attribute may be set both in memory and on disk,
 * but it only has any meaning when the resource file is first opened.
 */
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes {
    pub fn preload(&self) -> Ref<'_, bool> {
        self.preload.borrow()
    }
}

/**
 * Indicates that this resource's data has been changed in memory and should be written to the resource file on the next update.
 * This attribute is only meant to be set in memory;
 * it is cleared when the resource file is written to disk.
 * 
 * This attribute is used internally by the Resource Manager and should not be set manually by the application.
 */
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes {
    pub fn needs_write(&self) -> Ref<'_, bool> {
        self.needs_write.borrow()
    }
}

/**
 * Indicates that this resource's data is compressed.
 * Compressed resource data is decompressed transparently by the Resource Manager when reading.
 * 
 * For a detailed description of the structure of compressed resources as they are stored in the file,
 * see the compressed_resource.ksy spec.
 */
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes {
    pub fn compressed(&self) -> Ref<'_, bool> {
        self.compressed.borrow()
    }
}
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Resource type list in the resource map.
 */

#[derive(Default, Debug, Clone)]
pub struct ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList {
    pub _root: SharedType<ResourceFork>,
    pub _parent: SharedType<ResourceFork_ResourceMap_TypeListAndReferenceLists>,
    pub _self: SharedType<Self>,
    num_types_m1: RefCell<u16>,
    entries: RefCell<Vec<OptRc<ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry>>>,
    _io: RefCell<BytesReader>,
    f_num_types: Cell<bool>,
    num_types: RefCell<i32>,
}
impl KStruct for ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList {
    type Root = ResourceFork;
    type Parent = ResourceFork_ResourceMap_TypeListAndReferenceLists;

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
        *self_rc.num_types_m1.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.entries.borrow_mut() = Vec::new();
        let l_entries = *self_rc.num_types()?;
        for _i in 0..l_entries {
            let t = Self::read_into::<_, ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.entries.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList {

    /**
     * The number of resource types in this list.
     */
    pub fn num_types(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_types.get() {
            return Ok(self.num_types.borrow());
        }
        self.f_num_types.set(true);
        *self.num_types.borrow_mut() = (modulo(((*self.num_types_m1() as u16) + (1 as u16)) as i64, 65536 as i64)) as i32;
        Ok(self.num_types.borrow())
    }
}

/**
 * The number of resource types in this list,
 * minus one.
 * 
 * If the resource list is empty,
 * the value of this field is `0xffff`,
 * i. e. `-1` truncated to a 16-bit unsigned integer.
 */
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList {
    pub fn num_types_m1(&self) -> Ref<'_, u16> {
        self.num_types_m1.borrow()
    }
}

/**
 * Entries in the resource type list.
 */
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry>>> {
        self.entries.borrow()
    }
}
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * A single entry in the resource type list.
 * 
 * Each entry corresponds to exactly one resource reference list.
 */

#[derive(Default, Debug, Clone)]
pub struct ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry {
    pub _root: SharedType<ResourceFork>,
    pub _parent: SharedType<ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList>,
    pub _self: SharedType<Self>,
    type: RefCell<Vec<u8>>,
    num_references_m1: RefCell<u16>,
    ofs_reference_list: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_num_references: Cell<bool>,
    num_references: RefCell<i32>,
    f_reference_list: Cell<bool>,
    reference_list: RefCell<OptRc<ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList>>,
}
impl KStruct for ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry {
    type Root = ResourceFork;
    type Parent = ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList;

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
        *self_rc.type.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        *self_rc.num_references_m1.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.ofs_reference_list.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry {

    /**
     * The number of resources in the reference list for this type.
     */
    pub fn num_references(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_references.get() {
            return Ok(self.num_references.borrow());
        }
        self.f_num_references.set(true);
        *self.num_references.borrow_mut() = (modulo(((*self.num_references_m1() as u16) + (1 as u16)) as i64, 65536 as i64)) as i32;
        Ok(self.num_references.borrow())
    }

    /**
     * The resource reference list for this resource type.
     */
    pub fn reference_list(
        &self
    ) -> KResult<Ref<'_, OptRc<ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_reference_list.get() {
            return Ok(self.reference_list.borrow());
        }
        let io = Clone::clone(&*_prc.as_ref().unwrap()._parent.get_value().borrow().upgrade().as_ref().unwrap()._io());
        let _pos = io.pos();
        io.seek(*self.ofs_reference_list() as usize)?;
        let f = |t : &mut ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList| Ok(t.set_params((*self.num_references()?).try_into().map_err(|_| KError::CastError)?));
        let t = Self::read_into_with_init::<BytesReader, ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList>(&io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
        *self.reference_list.borrow_mut() = t;
        io.seek(_pos)?;
        Ok(self.reference_list.borrow())
    }
}

/**
 * The four-character type code of the resources in the reference list.
 */
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry {
    pub fn type(&self) -> Ref<'_, Vec<u8>> {
        self.type.borrow()
    }
}

/**
 * The number of resources in the reference list for this type,
 * minus one.
 * 
 * Empty reference lists should never exist.
 */
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry {
    pub fn num_references_m1(&self) -> Ref<'_, u16> {
        self.num_references_m1.borrow()
    }
}

/**
 * Offset of the resource reference list for this resource type,
 * from the start of the resource type list.
 * 
 * Although the offset is relative to the start of the type list,
 * it should never point into the type list itself,
 * but into the reference list storage area that directly follows it.
 * That is,
 * it should always be at least `_parent._sizeof`.
 */
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry {
    pub fn ofs_reference_list(&self) -> Ref<'_, u16> {
        self.ofs_reference_list.borrow()
    }
}
impl ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

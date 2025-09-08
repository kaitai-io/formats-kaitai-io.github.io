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
use super::vlq_base128_le::VlqBase128Le;

/**
 * Android OS applications executables are typically stored in its own
 * format, optimized for more efficient execution in Dalvik virtual
 * machine.
 * 
 * This format is loosely similar to Java .class file format and
 * generally holds the similar set of data: i.e. classes, methods,
 * fields, annotations, etc.
 * \sa https://source.android.com/docs/core/runtime/dex-format Source
 */

#[derive(Default, Debug, Clone)]
pub struct Dex {
    pub _root: SharedType<Dex>,
    pub _parent: SharedType<Dex>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<Dex_HeaderItem>>,
    _io: RefCell<BytesReader>,
    f_class_defs: Cell<bool>,
    class_defs: RefCell<Vec<OptRc<Dex_ClassDefItem>>>,
    f_data: Cell<bool>,
    data: RefCell<Vec<u8>>,
    f_field_ids: Cell<bool>,
    field_ids: RefCell<Vec<OptRc<Dex_FieldIdItem>>>,
    f_link_data: Cell<bool>,
    link_data: RefCell<Vec<u8>>,
    f_map: Cell<bool>,
    map: RefCell<OptRc<Dex_MapList>>,
    f_method_ids: Cell<bool>,
    method_ids: RefCell<Vec<OptRc<Dex_MethodIdItem>>>,
    f_proto_ids: Cell<bool>,
    proto_ids: RefCell<Vec<OptRc<Dex_ProtoIdItem>>>,
    f_string_ids: Cell<bool>,
    string_ids: RefCell<Vec<OptRc<Dex_StringIdItem>>>,
    f_type_ids: Cell<bool>,
    type_ids: RefCell<Vec<OptRc<Dex_TypeIdItem>>>,
}
impl KStruct for Dex {
    type Root = Dex;
    type Parent = Dex;

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
        let t = Self::read_into::<_, Dex_HeaderItem>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        Ok(())
    }
}
impl Dex {

    /**
     * class definitions list.
     * 
     * The classes must be ordered such that a given class's superclass and
     * implemented interfaces appear in the list earlier than the referring class.
     * 
     * Furthermore, it is invalid for a definition for the same-named class to
     * appear more than once in the list.
     */
    pub fn class_defs(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<Dex_ClassDefItem>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_class_defs.get() {
            return Ok(self.class_defs.borrow());
        }
        self.f_class_defs.set(true);
        let _pos = _io.pos();
        _io.seek(*self.header().class_defs_off() as usize)?;
        *self.class_defs.borrow_mut() = Vec::new();
        let l_class_defs = *self.header().class_defs_size();
        for _i in 0..l_class_defs {
            let t = Self::read_into::<_, Dex_ClassDefItem>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            self.class_defs.borrow_mut().push(t);
        }
        _io.seek(_pos)?;
        Ok(self.class_defs.borrow())
    }

    /**
     * data area, containing all the support data for the tables listed above.
     * 
     * Different items have different alignment requirements, and padding bytes
     * are inserted before each item if necessary to achieve proper alignment.
     */
    pub fn data(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_data.get() {
            return Ok(self.data.borrow());
        }
        self.f_data.set(true);
        let _pos = _io.pos();
        _io.seek(*self.header().data_off() as usize)?;
        *self.data.borrow_mut() = _io.read_bytes(*self.header().data_size() as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.data.borrow())
    }

    /**
     * field identifiers list.
     * 
     * These are identifiers for all fields referred to by this file, whether defined in the file or not.
     * 
     * This list must be sorted, where the defining type (by type_id index)
     * is the major order, field name (by string_id index) is the intermediate
     * order, and type (by type_id index) is the minor order.
     * 
     * The list must not contain any duplicate entries.
     */
    pub fn field_ids(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<Dex_FieldIdItem>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_field_ids.get() {
            return Ok(self.field_ids.borrow());
        }
        self.f_field_ids.set(true);
        let _pos = _io.pos();
        _io.seek(*self.header().field_ids_off() as usize)?;
        *self.field_ids.borrow_mut() = Vec::new();
        let l_field_ids = *self.header().field_ids_size();
        for _i in 0..l_field_ids {
            let t = Self::read_into::<_, Dex_FieldIdItem>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            self.field_ids.borrow_mut().push(t);
        }
        _io.seek(_pos)?;
        Ok(self.field_ids.borrow())
    }

    /**
     * data used in statically linked files.
     * 
     * The format of the data in this section is left unspecified by this document.
     * 
     * This section is empty in unlinked files, and runtime implementations may
     * use it as they see fit.
     */
    pub fn link_data(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_link_data.get() {
            return Ok(self.link_data.borrow());
        }
        self.f_link_data.set(true);
        let _pos = _io.pos();
        _io.seek(*self.header().link_off() as usize)?;
        *self.link_data.borrow_mut() = _io.read_bytes(*self.header().link_size() as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.link_data.borrow())
    }
    pub fn map(
        &self
    ) -> KResult<Ref<'_, OptRc<Dex_MapList>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_map.get() {
            return Ok(self.map.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*self.header().map_off() as usize)?;
        let t = Self::read_into::<_, Dex_MapList>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.map.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.map.borrow())
    }

    /**
     * method identifiers list.
     * 
     * These are identifiers for all methods referred to by this file,
     * whether defined in the file or not.
     * 
     * This list must be sorted, where the defining type (by type_id index
     * is the major order, method name (by string_id index) is the intermediate
     * order, and method prototype (by proto_id index) is the minor order.
     * 
     * The list must not contain any duplicate entries.
     */
    pub fn method_ids(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<Dex_MethodIdItem>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_method_ids.get() {
            return Ok(self.method_ids.borrow());
        }
        self.f_method_ids.set(true);
        let _pos = _io.pos();
        _io.seek(*self.header().method_ids_off() as usize)?;
        *self.method_ids.borrow_mut() = Vec::new();
        let l_method_ids = *self.header().method_ids_size();
        for _i in 0..l_method_ids {
            let t = Self::read_into::<_, Dex_MethodIdItem>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            self.method_ids.borrow_mut().push(t);
        }
        _io.seek(_pos)?;
        Ok(self.method_ids.borrow())
    }

    /**
     * method prototype identifiers list.
     * 
     * These are identifiers for all prototypes referred to by this file.
     * 
     * This list must be sorted in return-type (by type_id index) major order,
     * and then by argument list (lexicographic ordering, individual arguments
     * ordered by type_id index). The list must not contain any duplicate entries.
     */
    pub fn proto_ids(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<Dex_ProtoIdItem>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_proto_ids.get() {
            return Ok(self.proto_ids.borrow());
        }
        self.f_proto_ids.set(true);
        let _pos = _io.pos();
        _io.seek(*self.header().proto_ids_off() as usize)?;
        *self.proto_ids.borrow_mut() = Vec::new();
        let l_proto_ids = *self.header().proto_ids_size();
        for _i in 0..l_proto_ids {
            let t = Self::read_into::<_, Dex_ProtoIdItem>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            self.proto_ids.borrow_mut().push(t);
        }
        _io.seek(_pos)?;
        Ok(self.proto_ids.borrow())
    }

    /**
     * string identifiers list.
     * 
     * These are identifiers for all the strings used by this file, either for
     * internal naming (e.g., type descriptors) or as constant objects referred to by code.
     * 
     * This list must be sorted by string contents, using UTF-16 code point values
     * (not in a locale-sensitive manner), and it must not contain any duplicate entries.
     */
    pub fn string_ids(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<Dex_StringIdItem>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_string_ids.get() {
            return Ok(self.string_ids.borrow());
        }
        self.f_string_ids.set(true);
        let _pos = _io.pos();
        _io.seek(*self.header().string_ids_off() as usize)?;
        *self.string_ids.borrow_mut() = Vec::new();
        let l_string_ids = *self.header().string_ids_size();
        for _i in 0..l_string_ids {
            let t = Self::read_into::<_, Dex_StringIdItem>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            self.string_ids.borrow_mut().push(t);
        }
        _io.seek(_pos)?;
        Ok(self.string_ids.borrow())
    }

    /**
     * type identifiers list.
     * 
     * These are identifiers for all types (classes, arrays, or primitive types)
     * referred to by this file, whether defined in the file or not.
     * 
     * This list must be sorted by string_id index, and it must not contain any duplicate entries.
     */
    pub fn type_ids(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<Dex_TypeIdItem>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_type_ids.get() {
            return Ok(self.type_ids.borrow());
        }
        self.f_type_ids.set(true);
        let _pos = _io.pos();
        _io.seek(*self.header().type_ids_off() as usize)?;
        *self.type_ids.borrow_mut() = Vec::new();
        let l_type_ids = *self.header().type_ids_size();
        for _i in 0..l_type_ids {
            let t = Self::read_into::<_, Dex_TypeIdItem>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            self.type_ids.borrow_mut().push(t);
        }
        _io.seek(_pos)?;
        Ok(self.type_ids.borrow())
    }
}
impl Dex {
    pub fn header(&self) -> Ref<'_, OptRc<Dex_HeaderItem>> {
        self.header.borrow()
    }
}
impl Dex {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Dex_ClassAccessFlags {
    Public,
    Private,
    Protected,
    Static,
    Final,
    Interface,
    Abstract,
    Synthetic,
    Annotation,
    Enum,
    Unknown(i64),
}

impl TryFrom<i64> for Dex_ClassAccessFlags {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Dex_ClassAccessFlags> {
        match flag {
            1 => Ok(Dex_ClassAccessFlags::Public),
            2 => Ok(Dex_ClassAccessFlags::Private),
            4 => Ok(Dex_ClassAccessFlags::Protected),
            8 => Ok(Dex_ClassAccessFlags::Static),
            16 => Ok(Dex_ClassAccessFlags::Final),
            512 => Ok(Dex_ClassAccessFlags::Interface),
            1024 => Ok(Dex_ClassAccessFlags::Abstract),
            4096 => Ok(Dex_ClassAccessFlags::Synthetic),
            8192 => Ok(Dex_ClassAccessFlags::Annotation),
            16384 => Ok(Dex_ClassAccessFlags::Enum),
            _ => Ok(Dex_ClassAccessFlags::Unknown(flag)),
        }
    }
}

impl From<&Dex_ClassAccessFlags> for i64 {
    fn from(v: &Dex_ClassAccessFlags) -> Self {
        match *v {
            Dex_ClassAccessFlags::Public => 1,
            Dex_ClassAccessFlags::Private => 2,
            Dex_ClassAccessFlags::Protected => 4,
            Dex_ClassAccessFlags::Static => 8,
            Dex_ClassAccessFlags::Final => 16,
            Dex_ClassAccessFlags::Interface => 512,
            Dex_ClassAccessFlags::Abstract => 1024,
            Dex_ClassAccessFlags::Synthetic => 4096,
            Dex_ClassAccessFlags::Annotation => 8192,
            Dex_ClassAccessFlags::Enum => 16384,
            Dex_ClassAccessFlags::Unknown(v) => v
        }
    }
}

impl Default for Dex_ClassAccessFlags {
    fn default() -> Self { Dex_ClassAccessFlags::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Dex_AnnotationElement {
    pub _root: SharedType<Dex>,
    pub _parent: SharedType<Dex_EncodedAnnotation>,
    pub _self: SharedType<Self>,
    name_idx: RefCell<OptRc<VlqBase128Le>>,
    value: RefCell<OptRc<Dex_EncodedValue>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dex_AnnotationElement {
    type Root = Dex;
    type Parent = Dex_EncodedAnnotation;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.name_idx.borrow_mut() = t;
        let t = Self::read_into::<_, Dex_EncodedValue>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.value.borrow_mut() = t;
        Ok(())
    }
}
impl Dex_AnnotationElement {
}

/**
 * element name, represented as an index into the string_ids section.
 * 
 * The string must conform to the syntax for MemberName, defined above.
 */
impl Dex_AnnotationElement {
    pub fn name_idx(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.name_idx.borrow()
    }
}

/**
 * element value
 */
impl Dex_AnnotationElement {
    pub fn value(&self) -> Ref<'_, OptRc<Dex_EncodedValue>> {
        self.value.borrow()
    }
}
impl Dex_AnnotationElement {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dex_CallSiteIdItem {
    pub _root: SharedType<Dex>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    call_site_off: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dex_CallSiteIdItem {
    type Root = Dex;
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
        *self_rc.call_site_off.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Dex_CallSiteIdItem {
}

/**
 * offset from the start of the file to call site definition.
 * 
 * The offset should be in the data section, and the data there should
 * be in the format specified by "call_site_item" below.
 */
impl Dex_CallSiteIdItem {
    pub fn call_site_off(&self) -> Ref<'_, u32> {
        self.call_site_off.borrow()
    }
}
impl Dex_CallSiteIdItem {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dex_ClassDataItem {
    pub _root: SharedType<Dex>,
    pub _parent: SharedType<Dex_ClassDefItem>,
    pub _self: SharedType<Self>,
    static_fields_size: RefCell<OptRc<VlqBase128Le>>,
    instance_fields_size: RefCell<OptRc<VlqBase128Le>>,
    direct_methods_size: RefCell<OptRc<VlqBase128Le>>,
    virtual_methods_size: RefCell<OptRc<VlqBase128Le>>,
    static_fields: RefCell<Vec<OptRc<Dex_EncodedField>>>,
    instance_fields: RefCell<Vec<OptRc<Dex_EncodedField>>>,
    direct_methods: RefCell<Vec<OptRc<Dex_EncodedMethod>>>,
    virtual_methods: RefCell<Vec<OptRc<Dex_EncodedMethod>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dex_ClassDataItem {
    type Root = Dex;
    type Parent = Dex_ClassDefItem;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.static_fields_size.borrow_mut() = t;
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.instance_fields_size.borrow_mut() = t;
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.direct_methods_size.borrow_mut() = t;
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.virtual_methods_size.borrow_mut() = t;
        *self_rc.static_fields.borrow_mut() = Vec::new();
        let l_static_fields = *self_rc.static_fields_size().value()?;
        for _i in 0..l_static_fields {
            let t = Self::read_into::<_, Dex_EncodedField>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.static_fields.borrow_mut().push(t);
        }
        *self_rc.instance_fields.borrow_mut() = Vec::new();
        let l_instance_fields = *self_rc.instance_fields_size().value()?;
        for _i in 0..l_instance_fields {
            let t = Self::read_into::<_, Dex_EncodedField>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.instance_fields.borrow_mut().push(t);
        }
        *self_rc.direct_methods.borrow_mut() = Vec::new();
        let l_direct_methods = *self_rc.direct_methods_size().value()?;
        for _i in 0..l_direct_methods {
            let t = Self::read_into::<_, Dex_EncodedMethod>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.direct_methods.borrow_mut().push(t);
        }
        *self_rc.virtual_methods.borrow_mut() = Vec::new();
        let l_virtual_methods = *self_rc.virtual_methods_size().value()?;
        for _i in 0..l_virtual_methods {
            let t = Self::read_into::<_, Dex_EncodedMethod>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.virtual_methods.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Dex_ClassDataItem {
}

/**
 * the number of static fields defined in this item
 */
impl Dex_ClassDataItem {
    pub fn static_fields_size(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.static_fields_size.borrow()
    }
}

/**
 * the number of instance fields defined in this item
 */
impl Dex_ClassDataItem {
    pub fn instance_fields_size(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.instance_fields_size.borrow()
    }
}

/**
 * the number of direct methods defined in this item
 */
impl Dex_ClassDataItem {
    pub fn direct_methods_size(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.direct_methods_size.borrow()
    }
}

/**
 * the number of virtual methods defined in this item
 */
impl Dex_ClassDataItem {
    pub fn virtual_methods_size(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.virtual_methods_size.borrow()
    }
}

/**
 * the defined static fields, represented as a sequence of encoded elements.
 * 
 * The fields must be sorted by field_idx in increasing order.
 */
impl Dex_ClassDataItem {
    pub fn static_fields(&self) -> Ref<'_, Vec<OptRc<Dex_EncodedField>>> {
        self.static_fields.borrow()
    }
}

/**
 * the defined instance fields, represented as a sequence of encoded elements.
 * 
 * The fields must be sorted by field_idx in increasing order.
 */
impl Dex_ClassDataItem {
    pub fn instance_fields(&self) -> Ref<'_, Vec<OptRc<Dex_EncodedField>>> {
        self.instance_fields.borrow()
    }
}

/**
 * the defined direct (any of static, private, or constructor) methods,
 * represented as a sequence of encoded elements.
 * 
 * The methods must be sorted by method_idx in increasing order.
 */
impl Dex_ClassDataItem {
    pub fn direct_methods(&self) -> Ref<'_, Vec<OptRc<Dex_EncodedMethod>>> {
        self.direct_methods.borrow()
    }
}

/**
 * the defined virtual (none of static, private, or constructor) methods,
 * represented as a sequence of encoded elements.
 * 
 * This list should not include inherited methods unless overridden by
 * the class that this item represents.
 * 
 * The methods must be sorted by method_idx in increasing order.
 * 
 * The method_idx of a virtual method must not be the same as any direct method.
 */
impl Dex_ClassDataItem {
    pub fn virtual_methods(&self) -> Ref<'_, Vec<OptRc<Dex_EncodedMethod>>> {
        self.virtual_methods.borrow()
    }
}
impl Dex_ClassDataItem {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dex_ClassDefItem {
    pub _root: SharedType<Dex>,
    pub _parent: SharedType<Dex>,
    pub _self: SharedType<Self>,
    class_idx: RefCell<u32>,
    access_flags: RefCell<Dex_ClassAccessFlags>,
    superclass_idx: RefCell<u32>,
    interfaces_off: RefCell<u32>,
    source_file_idx: RefCell<u32>,
    annotations_off: RefCell<u32>,
    class_data_off: RefCell<u32>,
    static_values_off: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_class_data: Cell<bool>,
    class_data: RefCell<OptRc<Dex_ClassDataItem>>,
    f_static_values: Cell<bool>,
    static_values: RefCell<OptRc<Dex_EncodedArrayItem>>,
    f_type_name: Cell<bool>,
    type_name: RefCell<String>,
}
impl KStruct for Dex_ClassDefItem {
    type Root = Dex;
    type Parent = Dex;

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
        *self_rc.class_idx.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.access_flags.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        *self_rc.superclass_idx.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.interfaces_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.source_file_idx.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.annotations_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.class_data_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.static_values_off.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Dex_ClassDefItem {
    pub fn class_data(
        &self
    ) -> KResult<Ref<'_, OptRc<Dex_ClassDataItem>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_class_data.get() {
            return Ok(self.class_data.borrow());
        }
        if ((*self.class_data_off() as u32) != (0 as u32)) {
            let _pos = _io.pos();
            _io.seek(*self.class_data_off() as usize)?;
            let t = Self::read_into::<_, Dex_ClassDataItem>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.class_data.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.class_data.borrow())
    }
    pub fn static_values(
        &self
    ) -> KResult<Ref<'_, OptRc<Dex_EncodedArrayItem>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_static_values.get() {
            return Ok(self.static_values.borrow());
        }
        if ((*self.static_values_off() as u32) != (0 as u32)) {
            let _pos = _io.pos();
            _io.seek(*self.static_values_off() as usize)?;
            let t = Self::read_into::<_, Dex_EncodedArrayItem>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.static_values.borrow_mut() = t;
            _io.seek(_pos)?;
        }
        Ok(self.static_values.borrow())
    }
    pub fn type_name(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_type_name.get() {
            return Ok(self.type_name.borrow());
        }
        self.f_type_name.set(true);
        *self.type_name.borrow_mut() = _r.type_ids()?[*self.class_idx() as usize].type_name()?.to_string();
        Ok(self.type_name.borrow())
    }
}

/**
 * index into the type_ids list for this class.
 * 
 * This must be a class type, and not an array or primitive type.
 */
impl Dex_ClassDefItem {
    pub fn class_idx(&self) -> Ref<'_, u32> {
        self.class_idx.borrow()
    }
}

/**
 * access flags for the class (public, final, etc.).
 * 
 * See "access_flags Definitions" for details.
 */
impl Dex_ClassDefItem {
    pub fn access_flags(&self) -> Ref<'_, Dex_ClassAccessFlags> {
        self.access_flags.borrow()
    }
}

/**
 * index into the type_ids list for the superclass,
 * or the constant value NO_INDEX if this class has no superclass
 * (i.e., it is a root class such as Object).
 * 
 * If present, this must be a class type, and not an array or primitive type.
 */
impl Dex_ClassDefItem {
    pub fn superclass_idx(&self) -> Ref<'_, u32> {
        self.superclass_idx.borrow()
    }
}

/**
 * offset from the start of the file to the list of interfaces, or 0 if there are none.
 * 
 * This offset should be in the data section, and the data there should
 * be in the format specified by "type_list" below. Each of the elements
 * of the list must be a class type (not an array or primitive type),
 * and there must not be any duplicates.
 */
impl Dex_ClassDefItem {
    pub fn interfaces_off(&self) -> Ref<'_, u32> {
        self.interfaces_off.borrow()
    }
}

/**
 * index into the string_ids list for the name of the file containing
 * the original source for (at least most of) this class, or the
 * special value NO_INDEX to represent a lack of this information.
 * 
 * The debug_info_item of any given method may override this source file,
 * but the expectation is that most classes will only come from one source file.
 */
impl Dex_ClassDefItem {
    pub fn source_file_idx(&self) -> Ref<'_, u32> {
        self.source_file_idx.borrow()
    }
}

/**
 * offset from the start of the file to the annotations structure for
 * this class, or 0 if there are no annotations on this class.
 * 
 * This offset, if non-zero, should be in the data section, and the data
 * there should be in the format specified by "annotations_directory_item"
 * below,with all items referring to this class as the definer.
 */
impl Dex_ClassDefItem {
    pub fn annotations_off(&self) -> Ref<'_, u32> {
        self.annotations_off.borrow()
    }
}

/**
 * offset from the start of the file to the associated class data for this
 * item, or 0 if there is no class data for this class.
 * 
 * (This may be the case, for example, if this class is a marker interface.)
 * 
 * The offset, if non-zero, should be in the data section, and the data
 * there should be in the format specified by "class_data_item" below,
 * with all items referring to this class as the definer.
 */
impl Dex_ClassDefItem {
    pub fn class_data_off(&self) -> Ref<'_, u32> {
        self.class_data_off.borrow()
    }
}

/**
 * offset from the start of the file to the list of initial values for
 * static fields, or 0 if there are none (and all static fields are to be
 * initialized with 0 or null).
 * 
 * This offset should be in the data section, and the data there should
 * be in the format specified by "encoded_array_item" below.
 * 
 * The size of the array must be no larger than the number of static fields
 * declared by this class, and the elements correspond to the static fields
 * in the same order as declared in the corresponding field_list.
 * 
 * The type of each array element must match the declared type of its
 * corresponding field.
 * 
 * If there are fewer elements in the array than there are static fields,
 * then the leftover fields are initialized with a type-appropriate 0 or null.
 */
impl Dex_ClassDefItem {
    pub fn static_values_off(&self) -> Ref<'_, u32> {
        self.static_values_off.borrow()
    }
}
impl Dex_ClassDefItem {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dex_EncodedAnnotation {
    pub _root: SharedType<Dex>,
    pub _parent: SharedType<Dex_EncodedValue>,
    pub _self: SharedType<Self>,
    type_idx: RefCell<OptRc<VlqBase128Le>>,
    size: RefCell<OptRc<VlqBase128Le>>,
    elements: RefCell<Vec<OptRc<Dex_AnnotationElement>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dex_EncodedAnnotation {
    type Root = Dex;
    type Parent = Dex_EncodedValue;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.type_idx.borrow_mut() = t;
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.size.borrow_mut() = t;
        *self_rc.elements.borrow_mut() = Vec::new();
        let l_elements = *self_rc.size().value()?;
        for _i in 0..l_elements {
            let t = Self::read_into::<_, Dex_AnnotationElement>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.elements.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Dex_EncodedAnnotation {
}

/**
 * type of the annotation.
 * 
 * This must be a class (not array or primitive) type.
 */
impl Dex_EncodedAnnotation {
    pub fn type_idx(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.type_idx.borrow()
    }
}

/**
 * number of name-value mappings in this annotation
 */
impl Dex_EncodedAnnotation {
    pub fn size(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.size.borrow()
    }
}

/**
 * elements of the annotation, represented directly in-line (not as offsets).
 * 
 * Elements must be sorted in increasing order by string_id index.
 */
impl Dex_EncodedAnnotation {
    pub fn elements(&self) -> Ref<'_, Vec<OptRc<Dex_AnnotationElement>>> {
        self.elements.borrow()
    }
}
impl Dex_EncodedAnnotation {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dex_EncodedArray {
    pub _root: SharedType<Dex>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    size: RefCell<OptRc<VlqBase128Le>>,
    values: RefCell<Vec<OptRc<Dex_EncodedValue>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dex_EncodedArray {
    type Root = Dex;
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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.size.borrow_mut() = t;
        *self_rc.values.borrow_mut() = Vec::new();
        let l_values = *self_rc.size().value()?;
        for _i in 0..l_values {
            let t = Self::read_into::<_, Dex_EncodedValue>(&*_io, Some(self_rc._root.clone()), None)?.into();
            self_rc.values.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Dex_EncodedArray {
}
impl Dex_EncodedArray {
    pub fn size(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.size.borrow()
    }
}
impl Dex_EncodedArray {
    pub fn values(&self) -> Ref<'_, Vec<OptRc<Dex_EncodedValue>>> {
        self.values.borrow()
    }
}
impl Dex_EncodedArray {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dex_EncodedArrayItem {
    pub _root: SharedType<Dex>,
    pub _parent: SharedType<Dex_ClassDefItem>,
    pub _self: SharedType<Self>,
    value: RefCell<OptRc<Dex_EncodedArray>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dex_EncodedArrayItem {
    type Root = Dex;
    type Parent = Dex_ClassDefItem;

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
        let t = Self::read_into::<_, Dex_EncodedArray>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.value.borrow_mut() = Some(t);
        Ok(())
    }
}
impl Dex_EncodedArrayItem {
}
impl Dex_EncodedArrayItem {
    pub fn value(&self) -> Ref<'_, OptRc<Dex_EncodedArray>> {
        self.value.borrow()
    }
}
impl Dex_EncodedArrayItem {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dex_EncodedField {
    pub _root: SharedType<Dex>,
    pub _parent: SharedType<Dex_ClassDataItem>,
    pub _self: SharedType<Self>,
    field_idx_diff: RefCell<OptRc<VlqBase128Le>>,
    access_flags: RefCell<OptRc<VlqBase128Le>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dex_EncodedField {
    type Root = Dex;
    type Parent = Dex_ClassDataItem;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.field_idx_diff.borrow_mut() = t;
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.access_flags.borrow_mut() = t;
        Ok(())
    }
}
impl Dex_EncodedField {
}

/**
 * index into the field_ids list for the identity of this field
 * (includes the name and descriptor), represented as a difference
 * from the index of previous element in the list.
 * 
 * The index of the first element in a list is represented directly.
 */
impl Dex_EncodedField {
    pub fn field_idx_diff(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.field_idx_diff.borrow()
    }
}

/**
 * access flags for the field (public, final, etc.).
 * 
 * See "access_flags Definitions" for details.
 */
impl Dex_EncodedField {
    pub fn access_flags(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.access_flags.borrow()
    }
}
impl Dex_EncodedField {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dex_EncodedMethod {
    pub _root: SharedType<Dex>,
    pub _parent: SharedType<Dex_ClassDataItem>,
    pub _self: SharedType<Self>,
    method_idx_diff: RefCell<OptRc<VlqBase128Le>>,
    access_flags: RefCell<OptRc<VlqBase128Le>>,
    code_off: RefCell<OptRc<VlqBase128Le>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dex_EncodedMethod {
    type Root = Dex;
    type Parent = Dex_ClassDataItem;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.method_idx_diff.borrow_mut() = t;
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.access_flags.borrow_mut() = t;
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.code_off.borrow_mut() = t;
        Ok(())
    }
}
impl Dex_EncodedMethod {
}

/**
 * index into the method_ids list for the identity of this method
 * (includes the name and descriptor), represented as a difference
 * from the index of previous element in the list.
 * 
 * The index of the first element in a list is represented directly.
 */
impl Dex_EncodedMethod {
    pub fn method_idx_diff(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.method_idx_diff.borrow()
    }
}

/**
 * access flags for the field (public, final, etc.).
 * 
 * See "access_flags Definitions" for details.
 */
impl Dex_EncodedMethod {
    pub fn access_flags(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.access_flags.borrow()
    }
}

/**
 * offset from the start of the file to the code structure for this method,
 * or 0 if this method is either abstract or native.
 * 
 * The offset should be to a location in the data section.
 * 
 * The format of the data is specified by "code_item" below.
 */
impl Dex_EncodedMethod {
    pub fn code_off(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.code_off.borrow()
    }
}
impl Dex_EncodedMethod {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dex_EncodedValue {
    pub _root: SharedType<Dex>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    value_arg: RefCell<u64>,
    value_type: RefCell<Dex_EncodedValue_ValueTypeEnum>,
    value: RefCell<Option<Dex_EncodedValue_Value>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Dex_EncodedValue_Value {
    Dex_EncodedAnnotation(OptRc<Dex_EncodedAnnotation>),
    U2(u16),
    S4(i32),
    S1(i8),
    S8(i64),
    F8(f64),
    F4(f32),
    Dex_EncodedArray(OptRc<Dex_EncodedArray>),
    U4(u32),
    S2(i16),
}
impl From<&Dex_EncodedValue_Value> for OptRc<Dex_EncodedAnnotation> {
    fn from(v: &Dex_EncodedValue_Value) -> Self {
        if let Dex_EncodedValue_Value::Dex_EncodedAnnotation(x) = v {
            return x.clone();
        }
        panic!("expected Dex_EncodedValue_Value::Dex_EncodedAnnotation, got {:?}", v)
    }
}
impl From<OptRc<Dex_EncodedAnnotation>> for Dex_EncodedValue_Value {
    fn from(v: OptRc<Dex_EncodedAnnotation>) -> Self {
        Self::Dex_EncodedAnnotation(v)
    }
}
impl From<&Dex_EncodedValue_Value> for u16 {
    fn from(v: &Dex_EncodedValue_Value) -> Self {
        if let Dex_EncodedValue_Value::U2(x) = v {
            return x.clone();
        }
        panic!("expected Dex_EncodedValue_Value::U2, got {:?}", v)
    }
}
impl From<u16> for Dex_EncodedValue_Value {
    fn from(v: u16) -> Self {
        Self::U2(v)
    }
}
impl From<&Dex_EncodedValue_Value> for i32 {
    fn from(v: &Dex_EncodedValue_Value) -> Self {
        if let Dex_EncodedValue_Value::S4(x) = v {
            return x.clone();
        }
        panic!("expected Dex_EncodedValue_Value::S4, got {:?}", v)
    }
}
impl From<i32> for Dex_EncodedValue_Value {
    fn from(v: i32) -> Self {
        Self::S4(v)
    }
}
impl From<&Dex_EncodedValue_Value> for i8 {
    fn from(v: &Dex_EncodedValue_Value) -> Self {
        if let Dex_EncodedValue_Value::S1(x) = v {
            return x.clone();
        }
        panic!("expected Dex_EncodedValue_Value::S1, got {:?}", v)
    }
}
impl From<i8> for Dex_EncodedValue_Value {
    fn from(v: i8) -> Self {
        Self::S1(v)
    }
}
impl From<&Dex_EncodedValue_Value> for i64 {
    fn from(v: &Dex_EncodedValue_Value) -> Self {
        if let Dex_EncodedValue_Value::S8(x) = v {
            return x.clone();
        }
        panic!("expected Dex_EncodedValue_Value::S8, got {:?}", v)
    }
}
impl From<i64> for Dex_EncodedValue_Value {
    fn from(v: i64) -> Self {
        Self::S8(v)
    }
}
impl From<&Dex_EncodedValue_Value> for f64 {
    fn from(v: &Dex_EncodedValue_Value) -> Self {
        if let Dex_EncodedValue_Value::F8(x) = v {
            return x.clone();
        }
        panic!("expected Dex_EncodedValue_Value::F8, got {:?}", v)
    }
}
impl From<f64> for Dex_EncodedValue_Value {
    fn from(v: f64) -> Self {
        Self::F8(v)
    }
}
impl From<&Dex_EncodedValue_Value> for f32 {
    fn from(v: &Dex_EncodedValue_Value) -> Self {
        if let Dex_EncodedValue_Value::F4(x) = v {
            return x.clone();
        }
        panic!("expected Dex_EncodedValue_Value::F4, got {:?}", v)
    }
}
impl From<f32> for Dex_EncodedValue_Value {
    fn from(v: f32) -> Self {
        Self::F4(v)
    }
}
impl From<&Dex_EncodedValue_Value> for OptRc<Dex_EncodedArray> {
    fn from(v: &Dex_EncodedValue_Value) -> Self {
        if let Dex_EncodedValue_Value::Dex_EncodedArray(x) = v {
            return x.clone();
        }
        panic!("expected Dex_EncodedValue_Value::Dex_EncodedArray, got {:?}", v)
    }
}
impl From<OptRc<Dex_EncodedArray>> for Dex_EncodedValue_Value {
    fn from(v: OptRc<Dex_EncodedArray>) -> Self {
        Self::Dex_EncodedArray(v)
    }
}
impl From<&Dex_EncodedValue_Value> for u32 {
    fn from(v: &Dex_EncodedValue_Value) -> Self {
        if let Dex_EncodedValue_Value::U4(x) = v {
            return x.clone();
        }
        panic!("expected Dex_EncodedValue_Value::U4, got {:?}", v)
    }
}
impl From<u32> for Dex_EncodedValue_Value {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&Dex_EncodedValue_Value> for i16 {
    fn from(v: &Dex_EncodedValue_Value) -> Self {
        if let Dex_EncodedValue_Value::S2(x) = v {
            return x.clone();
        }
        panic!("expected Dex_EncodedValue_Value::S2, got {:?}", v)
    }
}
impl From<i16> for Dex_EncodedValue_Value {
    fn from(v: i16) -> Self {
        Self::S2(v)
    }
}
impl KStruct for Dex_EncodedValue {
    type Root = Dex;
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
        *self_rc.value_arg.borrow_mut() = _io.read_bits_int_be(3)?;
        *self_rc.value_type.borrow_mut() = (_io.read_bits_int_be(5)? as i64).try_into()?;
        _io.align_to_byte()?;
        match *self_rc.value_type() {
            Dex_EncodedValue_ValueTypeEnum::Annotation => {
                let t = Self::read_into::<_, Dex_EncodedAnnotation>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            Dex_EncodedValue_ValueTypeEnum::Array => {
                let t = Self::read_into::<_, Dex_EncodedArray>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            Dex_EncodedValue_ValueTypeEnum::Byte => {
                *self_rc.value.borrow_mut() = Some(_io.read_s1()?.into());
            }
            Dex_EncodedValue_ValueTypeEnum::Char => {
                *self_rc.value.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Dex_EncodedValue_ValueTypeEnum::Double => {
                *self_rc.value.borrow_mut() = Some(_io.read_f8le()?.into());
            }
            Dex_EncodedValue_ValueTypeEnum::Enum => {
                *self_rc.value.borrow_mut() = Some(_io.read_u4le()?.into());
            }
            Dex_EncodedValue_ValueTypeEnum::Field => {
                *self_rc.value.borrow_mut() = Some(_io.read_u4le()?.into());
            }
            Dex_EncodedValue_ValueTypeEnum::Float => {
                *self_rc.value.borrow_mut() = Some(_io.read_f4le()?.into());
            }
            Dex_EncodedValue_ValueTypeEnum::Int => {
                *self_rc.value.borrow_mut() = Some(_io.read_s4le()?.into());
            }
            Dex_EncodedValue_ValueTypeEnum::Long => {
                *self_rc.value.borrow_mut() = Some(_io.read_s8le()?.into());
            }
            Dex_EncodedValue_ValueTypeEnum::Method => {
                *self_rc.value.borrow_mut() = Some(_io.read_u4le()?.into());
            }
            Dex_EncodedValue_ValueTypeEnum::MethodHandle => {
                *self_rc.value.borrow_mut() = Some(_io.read_u4le()?.into());
            }
            Dex_EncodedValue_ValueTypeEnum::MethodType => {
                *self_rc.value.borrow_mut() = Some(_io.read_u4le()?.into());
            }
            Dex_EncodedValue_ValueTypeEnum::Short => {
                *self_rc.value.borrow_mut() = Some(_io.read_s2le()?.into());
            }
            Dex_EncodedValue_ValueTypeEnum::String => {
                *self_rc.value.borrow_mut() = Some(_io.read_u4le()?.into());
            }
            Dex_EncodedValue_ValueTypeEnum::Type => {
                *self_rc.value.borrow_mut() = Some(_io.read_u4le()?.into());
            }
            _ => {}
        }
        Ok(())
    }
}
impl Dex_EncodedValue {
}
impl Dex_EncodedValue {
    pub fn value_arg(&self) -> Ref<'_, u64> {
        self.value_arg.borrow()
    }
}
impl Dex_EncodedValue {
    pub fn value_type(&self) -> Ref<'_, Dex_EncodedValue_ValueTypeEnum> {
        self.value_type.borrow()
    }
}
impl Dex_EncodedValue {
    pub fn value(&self) -> Ref<'_, Option<Dex_EncodedValue_Value>> {
        self.value.borrow()
    }
}
impl Dex_EncodedValue {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Dex_EncodedValue_ValueTypeEnum {
    Byte,
    Short,
    Char,
    Int,
    Long,
    Float,
    Double,
    MethodType,
    MethodHandle,
    String,
    Type,
    Field,
    Method,
    Enum,
    Array,
    Annotation,
    Null,
    Boolean,
    Unknown(i64),
}

impl TryFrom<i64> for Dex_EncodedValue_ValueTypeEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Dex_EncodedValue_ValueTypeEnum> {
        match flag {
            0 => Ok(Dex_EncodedValue_ValueTypeEnum::Byte),
            2 => Ok(Dex_EncodedValue_ValueTypeEnum::Short),
            3 => Ok(Dex_EncodedValue_ValueTypeEnum::Char),
            4 => Ok(Dex_EncodedValue_ValueTypeEnum::Int),
            6 => Ok(Dex_EncodedValue_ValueTypeEnum::Long),
            16 => Ok(Dex_EncodedValue_ValueTypeEnum::Float),
            17 => Ok(Dex_EncodedValue_ValueTypeEnum::Double),
            21 => Ok(Dex_EncodedValue_ValueTypeEnum::MethodType),
            22 => Ok(Dex_EncodedValue_ValueTypeEnum::MethodHandle),
            23 => Ok(Dex_EncodedValue_ValueTypeEnum::String),
            24 => Ok(Dex_EncodedValue_ValueTypeEnum::Type),
            25 => Ok(Dex_EncodedValue_ValueTypeEnum::Field),
            26 => Ok(Dex_EncodedValue_ValueTypeEnum::Method),
            27 => Ok(Dex_EncodedValue_ValueTypeEnum::Enum),
            28 => Ok(Dex_EncodedValue_ValueTypeEnum::Array),
            29 => Ok(Dex_EncodedValue_ValueTypeEnum::Annotation),
            30 => Ok(Dex_EncodedValue_ValueTypeEnum::Null),
            31 => Ok(Dex_EncodedValue_ValueTypeEnum::Boolean),
            _ => Ok(Dex_EncodedValue_ValueTypeEnum::Unknown(flag)),
        }
    }
}

impl From<&Dex_EncodedValue_ValueTypeEnum> for i64 {
    fn from(v: &Dex_EncodedValue_ValueTypeEnum) -> Self {
        match *v {
            Dex_EncodedValue_ValueTypeEnum::Byte => 0,
            Dex_EncodedValue_ValueTypeEnum::Short => 2,
            Dex_EncodedValue_ValueTypeEnum::Char => 3,
            Dex_EncodedValue_ValueTypeEnum::Int => 4,
            Dex_EncodedValue_ValueTypeEnum::Long => 6,
            Dex_EncodedValue_ValueTypeEnum::Float => 16,
            Dex_EncodedValue_ValueTypeEnum::Double => 17,
            Dex_EncodedValue_ValueTypeEnum::MethodType => 21,
            Dex_EncodedValue_ValueTypeEnum::MethodHandle => 22,
            Dex_EncodedValue_ValueTypeEnum::String => 23,
            Dex_EncodedValue_ValueTypeEnum::Type => 24,
            Dex_EncodedValue_ValueTypeEnum::Field => 25,
            Dex_EncodedValue_ValueTypeEnum::Method => 26,
            Dex_EncodedValue_ValueTypeEnum::Enum => 27,
            Dex_EncodedValue_ValueTypeEnum::Array => 28,
            Dex_EncodedValue_ValueTypeEnum::Annotation => 29,
            Dex_EncodedValue_ValueTypeEnum::Null => 30,
            Dex_EncodedValue_ValueTypeEnum::Boolean => 31,
            Dex_EncodedValue_ValueTypeEnum::Unknown(v) => v
        }
    }
}

impl Default for Dex_EncodedValue_ValueTypeEnum {
    fn default() -> Self { Dex_EncodedValue_ValueTypeEnum::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Dex_FieldIdItem {
    pub _root: SharedType<Dex>,
    pub _parent: SharedType<Dex>,
    pub _self: SharedType<Self>,
    class_idx: RefCell<u16>,
    type_idx: RefCell<u16>,
    name_idx: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_class_name: Cell<bool>,
    class_name: RefCell<String>,
    f_field_name: Cell<bool>,
    field_name: RefCell<String>,
    f_type_name: Cell<bool>,
    type_name: RefCell<String>,
}
impl KStruct for Dex_FieldIdItem {
    type Root = Dex;
    type Parent = Dex;

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
        *self_rc.class_idx.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.type_idx.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.name_idx.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Dex_FieldIdItem {

    /**
     * the definer of this field
     */
    pub fn class_name(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_class_name.get() {
            return Ok(self.class_name.borrow());
        }
        self.f_class_name.set(true);
        *self.class_name.borrow_mut() = _r.type_ids()?[*self.class_idx() as usize].type_name()?.to_string();
        Ok(self.class_name.borrow())
    }

    /**
     * the name of this field
     */
    pub fn field_name(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_field_name.get() {
            return Ok(self.field_name.borrow());
        }
        self.f_field_name.set(true);
        *self.field_name.borrow_mut() = _r.string_ids()?[*self.name_idx() as usize].value().data()?.to_string();
        Ok(self.field_name.borrow())
    }

    /**
     * the type of this field
     */
    pub fn type_name(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_type_name.get() {
            return Ok(self.type_name.borrow());
        }
        self.f_type_name.set(true);
        *self.type_name.borrow_mut() = _r.type_ids()?[*self.type_idx() as usize].type_name()?.to_string();
        Ok(self.type_name.borrow())
    }
}

/**
 * index into the type_ids list for the definer of this field.
 * This must be a class type, and not an array or primitive type.
 */
impl Dex_FieldIdItem {
    pub fn class_idx(&self) -> Ref<'_, u16> {
        self.class_idx.borrow()
    }
}

/**
 * index into the type_ids list for the type of this field
 */
impl Dex_FieldIdItem {
    pub fn type_idx(&self) -> Ref<'_, u16> {
        self.type_idx.borrow()
    }
}

/**
 * index into the string_ids list for the name of this field.
 * The string must conform to the syntax for MemberName, defined above.
 */
impl Dex_FieldIdItem {
    pub fn name_idx(&self) -> Ref<'_, u32> {
        self.name_idx.borrow()
    }
}
impl Dex_FieldIdItem {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dex_HeaderItem {
    pub _root: SharedType<Dex>,
    pub _parent: SharedType<Dex>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    version_str: RefCell<String>,
    checksum: RefCell<u32>,
    signature: RefCell<Vec<u8>>,
    file_size: RefCell<u32>,
    header_size: RefCell<u32>,
    endian_tag: RefCell<Dex_HeaderItem_EndianConstant>,
    link_size: RefCell<u32>,
    link_off: RefCell<u32>,
    map_off: RefCell<u32>,
    string_ids_size: RefCell<u32>,
    string_ids_off: RefCell<u32>,
    type_ids_size: RefCell<u32>,
    type_ids_off: RefCell<u32>,
    proto_ids_size: RefCell<u32>,
    proto_ids_off: RefCell<u32>,
    field_ids_size: RefCell<u32>,
    field_ids_off: RefCell<u32>,
    method_ids_size: RefCell<u32>,
    method_ids_off: RefCell<u32>,
    class_defs_size: RefCell<u32>,
    class_defs_off: RefCell<u32>,
    data_size: RefCell<u32>,
    data_off: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dex_HeaderItem {
    type Root = Dex;
    type Parent = Dex;

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
        if !(*self_rc.magic() == vec![0x64u8, 0x65u8, 0x78u8, 0xau8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/header_item/seq/0".to_string() }));
        }
        *self_rc.version_str.borrow_mut() = bytes_to_str(&bytes_terminate(&_io.read_bytes(4 as usize)?.into(), 0, false).into(), "ASCII")?;
        *self_rc.checksum.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.signature.borrow_mut() = _io.read_bytes(20 as usize)?.into();
        *self_rc.file_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.header_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.endian_tag.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        *self_rc.link_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.link_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.map_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.string_ids_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.string_ids_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.type_ids_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.type_ids_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.proto_ids_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.proto_ids_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.field_ids_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.field_ids_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.method_ids_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.method_ids_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.class_defs_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.class_defs_off.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.data_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.data_off.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Dex_HeaderItem {
}
impl Dex_HeaderItem {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl Dex_HeaderItem {
    pub fn version_str(&self) -> Ref<'_, String> {
        self.version_str.borrow()
    }
}

/**
 * adler32 checksum of the rest of the file (everything but magic and this field);
 * used to detect file corruption
 */
impl Dex_HeaderItem {
    pub fn checksum(&self) -> Ref<'_, u32> {
        self.checksum.borrow()
    }
}

/**
 * SHA-1 signature (hash) of the rest of the file (everything but magic, checksum,
 * and this field); used to uniquely identify files
 */
impl Dex_HeaderItem {
    pub fn signature(&self) -> Ref<'_, Vec<u8>> {
        self.signature.borrow()
    }
}

/**
 * size of the entire file (including the header), in bytes
 */
impl Dex_HeaderItem {
    pub fn file_size(&self) -> Ref<'_, u32> {
        self.file_size.borrow()
    }
}

/**
 * size of the header (this entire section), in bytes. This allows for at
 * least a limited amount of backwards/forwards compatibility without
 * invalidating the format.
 */
impl Dex_HeaderItem {
    pub fn header_size(&self) -> Ref<'_, u32> {
        self.header_size.borrow()
    }
}
impl Dex_HeaderItem {
    pub fn endian_tag(&self) -> Ref<'_, Dex_HeaderItem_EndianConstant> {
        self.endian_tag.borrow()
    }
}

/**
 * size of the link section, or 0 if this file isn't statically linked
 */
impl Dex_HeaderItem {
    pub fn link_size(&self) -> Ref<'_, u32> {
        self.link_size.borrow()
    }
}

/**
 * offset from the start of the file to the link section, or 0 if link_size == 0.
 * The offset, if non-zero, should be to an offset into the link_data section.
 * The format of the data pointed at is left unspecified by this document;
 * this header field (and the previous) are left as hooks for use by runtime implementations.
 */
impl Dex_HeaderItem {
    pub fn link_off(&self) -> Ref<'_, u32> {
        self.link_off.borrow()
    }
}

/**
 * offset from the start of the file to the map item.
 * The offset, which must be non-zero, should be to an offset into the data
 * section, and the data should be in the format specified by "map_list" below.
 */
impl Dex_HeaderItem {
    pub fn map_off(&self) -> Ref<'_, u32> {
        self.map_off.borrow()
    }
}

/**
 * count of strings in the string identifiers list
 */
impl Dex_HeaderItem {
    pub fn string_ids_size(&self) -> Ref<'_, u32> {
        self.string_ids_size.borrow()
    }
}

/**
 * offset from the start of the file to the string identifiers list,
 * or 0 if string_ids_size == 0 (admittedly a strange edge case).
 * The offset, if non-zero, should be to the start of the string_ids section.
 */
impl Dex_HeaderItem {
    pub fn string_ids_off(&self) -> Ref<'_, u32> {
        self.string_ids_off.borrow()
    }
}

/**
 * count of elements in the type identifiers list, at most 65535
 */
impl Dex_HeaderItem {
    pub fn type_ids_size(&self) -> Ref<'_, u32> {
        self.type_ids_size.borrow()
    }
}

/**
 * offset from the start of the file to the type identifiers list,
 * or 0 if type_ids_size == 0 (admittedly a strange edge case).
 * The offset, if non-zero, should be to the start of the type_ids section.
 */
impl Dex_HeaderItem {
    pub fn type_ids_off(&self) -> Ref<'_, u32> {
        self.type_ids_off.borrow()
    }
}

/**
 * count of elements in the prototype identifiers list, at most 65535
 */
impl Dex_HeaderItem {
    pub fn proto_ids_size(&self) -> Ref<'_, u32> {
        self.proto_ids_size.borrow()
    }
}

/**
 * offset from the start of the file to the prototype identifiers list,
 * or 0 if proto_ids_size == 0 (admittedly a strange edge case).
 * The offset, if non-zero, should be to the start of the proto_ids section.
 */
impl Dex_HeaderItem {
    pub fn proto_ids_off(&self) -> Ref<'_, u32> {
        self.proto_ids_off.borrow()
    }
}

/**
 * count of elements in the field identifiers list
 */
impl Dex_HeaderItem {
    pub fn field_ids_size(&self) -> Ref<'_, u32> {
        self.field_ids_size.borrow()
    }
}

/**
 * offset from the start of the file to the field identifiers list,
 * or 0 if field_ids_size == 0.
 * The offset, if non-zero, should be to the start of the field_ids section.
 */
impl Dex_HeaderItem {
    pub fn field_ids_off(&self) -> Ref<'_, u32> {
        self.field_ids_off.borrow()
    }
}

/**
 * count of elements in the method identifiers list
 */
impl Dex_HeaderItem {
    pub fn method_ids_size(&self) -> Ref<'_, u32> {
        self.method_ids_size.borrow()
    }
}

/**
 * offset from the start of the file to the method identifiers list,
 * or 0 if method_ids_size == 0.
 * The offset, if non-zero, should be to the start of the method_ids section.
 */
impl Dex_HeaderItem {
    pub fn method_ids_off(&self) -> Ref<'_, u32> {
        self.method_ids_off.borrow()
    }
}

/**
 * count of elements in the class definitions list
 */
impl Dex_HeaderItem {
    pub fn class_defs_size(&self) -> Ref<'_, u32> {
        self.class_defs_size.borrow()
    }
}

/**
 * offset from the start of the file to the class definitions list,
 * or 0 if class_defs_size == 0 (admittedly a strange edge case).
 * The offset, if non-zero, should be to the start of the class_defs section.
 */
impl Dex_HeaderItem {
    pub fn class_defs_off(&self) -> Ref<'_, u32> {
        self.class_defs_off.borrow()
    }
}

/**
 * Size of data section in bytes. Must be an even multiple of sizeof(uint).
 */
impl Dex_HeaderItem {
    pub fn data_size(&self) -> Ref<'_, u32> {
        self.data_size.borrow()
    }
}

/**
 * offset from the start of the file to the start of the data section.
 */
impl Dex_HeaderItem {
    pub fn data_off(&self) -> Ref<'_, u32> {
        self.data_off.borrow()
    }
}
impl Dex_HeaderItem {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Dex_HeaderItem_EndianConstant {
    EndianConstant,
    ReverseEndianConstant,
    Unknown(i64),
}

impl TryFrom<i64> for Dex_HeaderItem_EndianConstant {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Dex_HeaderItem_EndianConstant> {
        match flag {
            305419896 => Ok(Dex_HeaderItem_EndianConstant::EndianConstant),
            2018915346 => Ok(Dex_HeaderItem_EndianConstant::ReverseEndianConstant),
            _ => Ok(Dex_HeaderItem_EndianConstant::Unknown(flag)),
        }
    }
}

impl From<&Dex_HeaderItem_EndianConstant> for i64 {
    fn from(v: &Dex_HeaderItem_EndianConstant) -> Self {
        match *v {
            Dex_HeaderItem_EndianConstant::EndianConstant => 305419896,
            Dex_HeaderItem_EndianConstant::ReverseEndianConstant => 2018915346,
            Dex_HeaderItem_EndianConstant::Unknown(v) => v
        }
    }
}

impl Default for Dex_HeaderItem_EndianConstant {
    fn default() -> Self { Dex_HeaderItem_EndianConstant::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Dex_MapItem {
    pub _root: SharedType<Dex>,
    pub _parent: SharedType<Dex_MapList>,
    pub _self: SharedType<Self>,
    type: RefCell<Dex_MapItem_MapItemType>,
    unused: RefCell<u16>,
    size: RefCell<u32>,
    offset: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dex_MapItem {
    type Root = Dex;
    type Parent = Dex_MapList;

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
        *self_rc.type.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        *self_rc.unused.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.offset.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Dex_MapItem {
}

/**
 * type of the items; see table below
 */
impl Dex_MapItem {
    pub fn type(&self) -> Ref<'_, Dex_MapItem_MapItemType> {
        self.type.borrow()
    }
}

/**
 * (unused)
 */
impl Dex_MapItem {
    pub fn unused(&self) -> Ref<'_, u16> {
        self.unused.borrow()
    }
}

/**
 * count of the number of items to be found at the indicated offset
 */
impl Dex_MapItem {
    pub fn size(&self) -> Ref<'_, u32> {
        self.size.borrow()
    }
}

/**
 * offset from the start of the file to the items in question
 */
impl Dex_MapItem {
    pub fn offset(&self) -> Ref<'_, u32> {
        self.offset.borrow()
    }
}
impl Dex_MapItem {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Dex_MapItem_MapItemType {
    HeaderItem,
    StringIdItem,
    TypeIdItem,
    ProtoIdItem,
    FieldIdItem,
    MethodIdItem,
    ClassDefItem,
    CallSiteIdItem,
    MethodHandleItem,
    MapList,
    TypeList,
    AnnotationSetRefList,
    AnnotationSetItem,
    ClassDataItem,
    CodeItem,
    StringDataItem,
    DebugInfoItem,
    AnnotationItem,
    EncodedArrayItem,
    AnnotationsDirectoryItem,
    Unknown(i64),
}

impl TryFrom<i64> for Dex_MapItem_MapItemType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Dex_MapItem_MapItemType> {
        match flag {
            0 => Ok(Dex_MapItem_MapItemType::HeaderItem),
            1 => Ok(Dex_MapItem_MapItemType::StringIdItem),
            2 => Ok(Dex_MapItem_MapItemType::TypeIdItem),
            3 => Ok(Dex_MapItem_MapItemType::ProtoIdItem),
            4 => Ok(Dex_MapItem_MapItemType::FieldIdItem),
            5 => Ok(Dex_MapItem_MapItemType::MethodIdItem),
            6 => Ok(Dex_MapItem_MapItemType::ClassDefItem),
            7 => Ok(Dex_MapItem_MapItemType::CallSiteIdItem),
            8 => Ok(Dex_MapItem_MapItemType::MethodHandleItem),
            4096 => Ok(Dex_MapItem_MapItemType::MapList),
            4097 => Ok(Dex_MapItem_MapItemType::TypeList),
            4098 => Ok(Dex_MapItem_MapItemType::AnnotationSetRefList),
            4099 => Ok(Dex_MapItem_MapItemType::AnnotationSetItem),
            8192 => Ok(Dex_MapItem_MapItemType::ClassDataItem),
            8193 => Ok(Dex_MapItem_MapItemType::CodeItem),
            8194 => Ok(Dex_MapItem_MapItemType::StringDataItem),
            8195 => Ok(Dex_MapItem_MapItemType::DebugInfoItem),
            8196 => Ok(Dex_MapItem_MapItemType::AnnotationItem),
            8197 => Ok(Dex_MapItem_MapItemType::EncodedArrayItem),
            8198 => Ok(Dex_MapItem_MapItemType::AnnotationsDirectoryItem),
            _ => Ok(Dex_MapItem_MapItemType::Unknown(flag)),
        }
    }
}

impl From<&Dex_MapItem_MapItemType> for i64 {
    fn from(v: &Dex_MapItem_MapItemType) -> Self {
        match *v {
            Dex_MapItem_MapItemType::HeaderItem => 0,
            Dex_MapItem_MapItemType::StringIdItem => 1,
            Dex_MapItem_MapItemType::TypeIdItem => 2,
            Dex_MapItem_MapItemType::ProtoIdItem => 3,
            Dex_MapItem_MapItemType::FieldIdItem => 4,
            Dex_MapItem_MapItemType::MethodIdItem => 5,
            Dex_MapItem_MapItemType::ClassDefItem => 6,
            Dex_MapItem_MapItemType::CallSiteIdItem => 7,
            Dex_MapItem_MapItemType::MethodHandleItem => 8,
            Dex_MapItem_MapItemType::MapList => 4096,
            Dex_MapItem_MapItemType::TypeList => 4097,
            Dex_MapItem_MapItemType::AnnotationSetRefList => 4098,
            Dex_MapItem_MapItemType::AnnotationSetItem => 4099,
            Dex_MapItem_MapItemType::ClassDataItem => 8192,
            Dex_MapItem_MapItemType::CodeItem => 8193,
            Dex_MapItem_MapItemType::StringDataItem => 8194,
            Dex_MapItem_MapItemType::DebugInfoItem => 8195,
            Dex_MapItem_MapItemType::AnnotationItem => 8196,
            Dex_MapItem_MapItemType::EncodedArrayItem => 8197,
            Dex_MapItem_MapItemType::AnnotationsDirectoryItem => 8198,
            Dex_MapItem_MapItemType::Unknown(v) => v
        }
    }
}

impl Default for Dex_MapItem_MapItemType {
    fn default() -> Self { Dex_MapItem_MapItemType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Dex_MapList {
    pub _root: SharedType<Dex>,
    pub _parent: SharedType<Dex>,
    pub _self: SharedType<Self>,
    size: RefCell<u32>,
    list: RefCell<Vec<OptRc<Dex_MapItem>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dex_MapList {
    type Root = Dex;
    type Parent = Dex;

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
        *self_rc.list.borrow_mut() = Vec::new();
        let l_list = *self_rc.size();
        for _i in 0..l_list {
            let t = Self::read_into::<_, Dex_MapItem>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.list.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Dex_MapList {
}
impl Dex_MapList {
    pub fn size(&self) -> Ref<'_, u32> {
        self.size.borrow()
    }
}
impl Dex_MapList {
    pub fn list(&self) -> Ref<'_, Vec<OptRc<Dex_MapItem>>> {
        self.list.borrow()
    }
}
impl Dex_MapList {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dex_MethodIdItem {
    pub _root: SharedType<Dex>,
    pub _parent: SharedType<Dex>,
    pub _self: SharedType<Self>,
    class_idx: RefCell<u16>,
    proto_idx: RefCell<u16>,
    name_idx: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_class_name: Cell<bool>,
    class_name: RefCell<String>,
    f_method_name: Cell<bool>,
    method_name: RefCell<String>,
    f_proto_desc: Cell<bool>,
    proto_desc: RefCell<String>,
}
impl KStruct for Dex_MethodIdItem {
    type Root = Dex;
    type Parent = Dex;

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
        *self_rc.class_idx.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.proto_idx.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.name_idx.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Dex_MethodIdItem {

    /**
     * the definer of this method
     */
    pub fn class_name(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_class_name.get() {
            return Ok(self.class_name.borrow());
        }
        self.f_class_name.set(true);
        *self.class_name.borrow_mut() = _r.type_ids()?[*self.class_idx() as usize].type_name()?.to_string();
        Ok(self.class_name.borrow())
    }

    /**
     * the name of this method
     */
    pub fn method_name(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_method_name.get() {
            return Ok(self.method_name.borrow());
        }
        self.f_method_name.set(true);
        *self.method_name.borrow_mut() = _r.string_ids()?[*self.name_idx() as usize].value().data()?.to_string();
        Ok(self.method_name.borrow())
    }

    /**
     * the short-form descriptor of the prototype of this method
     */
    pub fn proto_desc(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_proto_desc.get() {
            return Ok(self.proto_desc.borrow());
        }
        self.f_proto_desc.set(true);
        *self.proto_desc.borrow_mut() = _r.proto_ids()?[*self.proto_idx() as usize].shorty_desc()?.to_string();
        Ok(self.proto_desc.borrow())
    }
}

/**
 * index into the type_ids list for the definer of this method.
 * This must be a class or array type, and not a primitive type.
 */
impl Dex_MethodIdItem {
    pub fn class_idx(&self) -> Ref<'_, u16> {
        self.class_idx.borrow()
    }
}

/**
 * index into the proto_ids list for the prototype of this method
 */
impl Dex_MethodIdItem {
    pub fn proto_idx(&self) -> Ref<'_, u16> {
        self.proto_idx.borrow()
    }
}

/**
 * index into the string_ids list for the name of this method.
 * The string must conform to the syntax for MemberName, defined above.
 */
impl Dex_MethodIdItem {
    pub fn name_idx(&self) -> Ref<'_, u32> {
        self.name_idx.borrow()
    }
}
impl Dex_MethodIdItem {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dex_ProtoIdItem {
    pub _root: SharedType<Dex>,
    pub _parent: SharedType<Dex>,
    pub _self: SharedType<Self>,
    shorty_idx: RefCell<u32>,
    return_type_idx: RefCell<u32>,
    parameters_off: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_params_types: Cell<bool>,
    params_types: RefCell<OptRc<Dex_TypeList>>,
    f_return_type: Cell<bool>,
    return_type: RefCell<String>,
    f_shorty_desc: Cell<bool>,
    shorty_desc: RefCell<String>,
}
impl KStruct for Dex_ProtoIdItem {
    type Root = Dex;
    type Parent = Dex;

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
        *self_rc.shorty_idx.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.return_type_idx.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.parameters_off.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Dex_ProtoIdItem {

    /**
     * list of parameter types for this prototype
     */
    pub fn params_types(
        &self
    ) -> KResult<Ref<'_, OptRc<Dex_TypeList>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_params_types.get() {
            return Ok(self.params_types.borrow());
        }
        if ((*self.parameters_off() as u32) != (0 as u32)) {
            let io = Clone::clone(&*_r._io());
            let _pos = io.pos();
            io.seek(*self.parameters_off() as usize)?;
            let t = Self::read_into::<BytesReader, Dex_TypeList>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
            *self.params_types.borrow_mut() = t;
            io.seek(_pos)?;
        }
        Ok(self.params_types.borrow())
    }

    /**
     * return type of this prototype
     */
    pub fn return_type(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_return_type.get() {
            return Ok(self.return_type.borrow());
        }
        self.f_return_type.set(true);
        *self.return_type.borrow_mut() = _r.type_ids()?[*self.return_type_idx() as usize].type_name()?.to_string();
        Ok(self.return_type.borrow())
    }

    /**
     * short-form descriptor string of this prototype, as pointed to by shorty_idx
     */
    pub fn shorty_desc(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_shorty_desc.get() {
            return Ok(self.shorty_desc.borrow());
        }
        self.f_shorty_desc.set(true);
        *self.shorty_desc.borrow_mut() = _r.string_ids()?[*self.shorty_idx() as usize].value().data()?.to_string();
        Ok(self.shorty_desc.borrow())
    }
}

/**
 * index into the string_ids list for the short-form descriptor string of this prototype.
 * The string must conform to the syntax for ShortyDescriptor, defined above,
 * and must correspond to the return type and parameters of this item.
 */
impl Dex_ProtoIdItem {
    pub fn shorty_idx(&self) -> Ref<'_, u32> {
        self.shorty_idx.borrow()
    }
}

/**
 * index into the type_ids list for the return type of this prototype
 */
impl Dex_ProtoIdItem {
    pub fn return_type_idx(&self) -> Ref<'_, u32> {
        self.return_type_idx.borrow()
    }
}

/**
 * offset from the start of the file to the list of parameter types for this prototype,
 * or 0 if this prototype has no parameters.
 * This offset, if non-zero, should be in the data section, and the data
 * there should be in the format specified by "type_list" below.
 * Additionally, there should be no reference to the type void in the list.
 */
impl Dex_ProtoIdItem {
    pub fn parameters_off(&self) -> Ref<'_, u32> {
        self.parameters_off.borrow()
    }
}
impl Dex_ProtoIdItem {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dex_StringIdItem {
    pub _root: SharedType<Dex>,
    pub _parent: SharedType<Dex>,
    pub _self: SharedType<Self>,
    string_data_off: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_value: Cell<bool>,
    value: RefCell<OptRc<Dex_StringIdItem_StringDataItem>>,
}
impl KStruct for Dex_StringIdItem {
    type Root = Dex;
    type Parent = Dex;

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
        *self_rc.string_data_off.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Dex_StringIdItem {
    pub fn value(
        &self
    ) -> KResult<Ref<'_, OptRc<Dex_StringIdItem_StringDataItem>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*self.string_data_off() as usize)?;
        let t = Self::read_into::<_, Dex_StringIdItem_StringDataItem>(&*_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.value.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.value.borrow())
    }
}

/**
 * offset from the start of the file to the string data for this item.
 * The offset should be to a location in the data section, and the data
 * should be in the format specified by "string_data_item" below.
 * There is no alignment requirement for the offset.
 */
impl Dex_StringIdItem {
    pub fn string_data_off(&self) -> Ref<'_, u32> {
        self.string_data_off.borrow()
    }
}
impl Dex_StringIdItem {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dex_StringIdItem_StringDataItem {
    pub _root: SharedType<Dex>,
    pub _parent: SharedType<Dex_StringIdItem>,
    pub _self: SharedType<Self>,
    utf16_size: RefCell<OptRc<VlqBase128Le>>,
    data: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dex_StringIdItem_StringDataItem {
    type Root = Dex;
    type Parent = Dex_StringIdItem;

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
        let t = Self::read_into::<_, VlqBase128Le>(&*_io, None, None)?.into();
        *self_rc.utf16_size.borrow_mut() = t;
        *self_rc.data.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.utf16_size().value()? as usize)?.into(), "ASCII")?;
        Ok(())
    }
}
impl Dex_StringIdItem_StringDataItem {
}
impl Dex_StringIdItem_StringDataItem {
    pub fn utf16_size(&self) -> Ref<'_, OptRc<VlqBase128Le>> {
        self.utf16_size.borrow()
    }
}
impl Dex_StringIdItem_StringDataItem {
    pub fn data(&self) -> Ref<'_, String> {
        self.data.borrow()
    }
}
impl Dex_StringIdItem_StringDataItem {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dex_TypeIdItem {
    pub _root: SharedType<Dex>,
    pub _parent: SharedType<Dex>,
    pub _self: SharedType<Self>,
    descriptor_idx: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_type_name: Cell<bool>,
    type_name: RefCell<String>,
}
impl KStruct for Dex_TypeIdItem {
    type Root = Dex;
    type Parent = Dex;

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
        *self_rc.descriptor_idx.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl Dex_TypeIdItem {
    pub fn type_name(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_type_name.get() {
            return Ok(self.type_name.borrow());
        }
        self.f_type_name.set(true);
        *self.type_name.borrow_mut() = _r.string_ids()?[*self.descriptor_idx() as usize].value().data()?.to_string();
        Ok(self.type_name.borrow())
    }
}

/**
 * index into the string_ids list for the descriptor string of this type.
 * The string must conform to the syntax for TypeDescriptor, defined above.
 */
impl Dex_TypeIdItem {
    pub fn descriptor_idx(&self) -> Ref<'_, u32> {
        self.descriptor_idx.borrow()
    }
}
impl Dex_TypeIdItem {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dex_TypeItem {
    pub _root: SharedType<Dex>,
    pub _parent: SharedType<Dex_TypeList>,
    pub _self: SharedType<Self>,
    type_idx: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_value: Cell<bool>,
    value: RefCell<String>,
}
impl KStruct for Dex_TypeItem {
    type Root = Dex;
    type Parent = Dex_TypeList;

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
        *self_rc.type_idx.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl Dex_TypeItem {
    pub fn value(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        self.f_value.set(true);
        *self.value.borrow_mut() = _r.type_ids()?[*self.type_idx() as usize].type_name()?.to_string();
        Ok(self.value.borrow())
    }
}
impl Dex_TypeItem {
    pub fn type_idx(&self) -> Ref<'_, u16> {
        self.type_idx.borrow()
    }
}
impl Dex_TypeItem {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dex_TypeList {
    pub _root: SharedType<Dex>,
    pub _parent: SharedType<Dex_ProtoIdItem>,
    pub _self: SharedType<Self>,
    size: RefCell<u32>,
    list: RefCell<Vec<OptRc<Dex_TypeItem>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dex_TypeList {
    type Root = Dex;
    type Parent = Dex_ProtoIdItem;

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
        *self_rc.list.borrow_mut() = Vec::new();
        let l_list = *self_rc.size();
        for _i in 0..l_list {
            let t = Self::read_into::<_, Dex_TypeItem>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.list.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Dex_TypeList {
}
impl Dex_TypeList {
    pub fn size(&self) -> Ref<'_, u32> {
        self.size.borrow()
    }
}
impl Dex_TypeList {
    pub fn list(&self) -> Ref<'_, Vec<OptRc<Dex_TypeItem>>> {
        self.list.borrow()
    }
}
impl Dex_TypeList {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

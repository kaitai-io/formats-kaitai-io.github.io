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
 * \sa https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-4.html Source
 * \sa https://docs.oracle.com/javase/specs/jls/se6/jls3.pdf Source
 * \sa https://github.com/openjdk/jdk/blob/jdk-21%2B14/src/jdk.hotspot.agent/share/classes/sun/jvm/hotspot/runtime/ClassConstants.java Source
 * \sa https://github.com/openjdk/jdk/blob/jdk-21%2B14/src/java.base/share/native/include/classfile_constants.h.template Source
 * \sa https://github.com/openjdk/jdk/blob/jdk-21%2B14/src/hotspot/share/classfile/classFileParser.cpp Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    version_minor: RefCell<u16>,
    version_major: RefCell<u16>,
    constant_pool_count: RefCell<u16>,
    constant_pool: RefCell<Vec<OptRc<JavaClass_ConstantPoolEntry>>>,
    access_flags: RefCell<u16>,
    this_class: RefCell<u16>,
    super_class: RefCell<u16>,
    interfaces_count: RefCell<u16>,
    interfaces: RefCell<Vec<u16>>,
    fields_count: RefCell<u16>,
    fields: RefCell<Vec<OptRc<JavaClass_FieldInfo>>>,
    methods_count: RefCell<u16>,
    methods: RefCell<Vec<OptRc<JavaClass_MethodInfo>>>,
    attributes_count: RefCell<u16>,
    attributes: RefCell<Vec<OptRc<JavaClass_AttributeInfo>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for JavaClass {
    type Root = JavaClass;
    type Parent = JavaClass;

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
        if !(*self_rc.magic() == vec![0xcau8, 0xfeu8, 0xbau8, 0xbeu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.version_minor.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.version_major.borrow_mut() = _io.read_u2be()?.into();
        if !(((*self_rc.version_major() as u16) >= (43 as u16))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/seq/2".to_string() }));
        }
        *self_rc.constant_pool_count.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.constant_pool.borrow_mut() = Vec::new();
        let l_constant_pool = ((*self_rc.constant_pool_count() as u16) - (1 as u16));
        for _i in 0..l_constant_pool {
            let f = |t : &mut JavaClass_ConstantPoolEntry| Ok(t.set_params(if ((_i as i32) != (0 as i32)) { *self_rc.constant_pool()[((_i as i32) - (1 as i32)) as usize].is_two_entries()? } else { false }));
            let t = Self::read_into_with_init::<_, JavaClass_ConstantPoolEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            self_rc.constant_pool.borrow_mut().push(t);
        }
        *self_rc.access_flags.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.this_class.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.super_class.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.interfaces_count.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.interfaces.borrow_mut() = Vec::new();
        let l_interfaces = *self_rc.interfaces_count();
        for _i in 0..l_interfaces {
            self_rc.interfaces.borrow_mut().push(_io.read_u2be()?.into());
        }
        *self_rc.fields_count.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.fields.borrow_mut() = Vec::new();
        let l_fields = *self_rc.fields_count();
        for _i in 0..l_fields {
            let t = Self::read_into::<_, JavaClass_FieldInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.fields.borrow_mut().push(t);
        }
        *self_rc.methods_count.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.methods.borrow_mut() = Vec::new();
        let l_methods = *self_rc.methods_count();
        for _i in 0..l_methods {
            let t = Self::read_into::<_, JavaClass_MethodInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.methods.borrow_mut().push(t);
        }
        *self_rc.attributes_count.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.attributes.borrow_mut() = Vec::new();
        let l_attributes = *self_rc.attributes_count();
        for _i in 0..l_attributes {
            let t = Self::read_into::<_, JavaClass_AttributeInfo>(&*_io, Some(self_rc._root.clone()), None)?.into();
            self_rc.attributes.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl JavaClass {
}
impl JavaClass {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl JavaClass {
    pub fn version_minor(&self) -> Ref<'_, u16> {
        self.version_minor.borrow()
    }
}
impl JavaClass {
    pub fn version_major(&self) -> Ref<'_, u16> {
        self.version_major.borrow()
    }
}
impl JavaClass {
    pub fn constant_pool_count(&self) -> Ref<'_, u16> {
        self.constant_pool_count.borrow()
    }
}
impl JavaClass {
    pub fn constant_pool(&self) -> Ref<'_, Vec<OptRc<JavaClass_ConstantPoolEntry>>> {
        self.constant_pool.borrow()
    }
}
impl JavaClass {
    pub fn access_flags(&self) -> Ref<'_, u16> {
        self.access_flags.borrow()
    }
}
impl JavaClass {
    pub fn this_class(&self) -> Ref<'_, u16> {
        self.this_class.borrow()
    }
}
impl JavaClass {
    pub fn super_class(&self) -> Ref<'_, u16> {
        self.super_class.borrow()
    }
}
impl JavaClass {
    pub fn interfaces_count(&self) -> Ref<'_, u16> {
        self.interfaces_count.borrow()
    }
}
impl JavaClass {
    pub fn interfaces(&self) -> Ref<'_, Vec<u16>> {
        self.interfaces.borrow()
    }
}
impl JavaClass {
    pub fn fields_count(&self) -> Ref<'_, u16> {
        self.fields_count.borrow()
    }
}
impl JavaClass {
    pub fn fields(&self) -> Ref<'_, Vec<OptRc<JavaClass_FieldInfo>>> {
        self.fields.borrow()
    }
}
impl JavaClass {
    pub fn methods_count(&self) -> Ref<'_, u16> {
        self.methods_count.borrow()
    }
}
impl JavaClass {
    pub fn methods(&self) -> Ref<'_, Vec<OptRc<JavaClass_MethodInfo>>> {
        self.methods.borrow()
    }
}
impl JavaClass {
    pub fn attributes_count(&self) -> Ref<'_, u16> {
        self.attributes_count.borrow()
    }
}
impl JavaClass {
    pub fn attributes(&self) -> Ref<'_, Vec<OptRc<JavaClass_AttributeInfo>>> {
        self.attributes.borrow()
    }
}
impl JavaClass {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_AttributeInfo {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    name_index: RefCell<u16>,
    attribute_length: RefCell<u32>,
    info: RefCell<Option<JavaClass_AttributeInfo_Info>>,
    _io: RefCell<BytesReader>,
    info_raw: RefCell<Vec<u8>>,
    f_name_as_str: Cell<bool>,
    name_as_str: RefCell<String>,
}
#[derive(Debug, Clone)]
pub enum JavaClass_AttributeInfo_Info {
    JavaClass_AttributeInfo_AttrBodyCode(OptRc<JavaClass_AttributeInfo_AttrBodyCode>),
    JavaClass_AttributeInfo_AttrBodyExceptions(OptRc<JavaClass_AttributeInfo_AttrBodyExceptions>),
    JavaClass_AttributeInfo_AttrBodySourceFile(OptRc<JavaClass_AttributeInfo_AttrBodySourceFile>),
    Bytes(Vec<u8>),
    JavaClass_AttributeInfo_AttrBodyLineNumberTable(OptRc<JavaClass_AttributeInfo_AttrBodyLineNumberTable>),
}
impl From<&JavaClass_AttributeInfo_Info> for OptRc<JavaClass_AttributeInfo_AttrBodyCode> {
    fn from(v: &JavaClass_AttributeInfo_Info) -> Self {
        if let JavaClass_AttributeInfo_Info::JavaClass_AttributeInfo_AttrBodyCode(x) = v {
            return x.clone();
        }
        panic!("expected JavaClass_AttributeInfo_Info::JavaClass_AttributeInfo_AttrBodyCode, got {:?}", v)
    }
}
impl From<OptRc<JavaClass_AttributeInfo_AttrBodyCode>> for JavaClass_AttributeInfo_Info {
    fn from(v: OptRc<JavaClass_AttributeInfo_AttrBodyCode>) -> Self {
        Self::JavaClass_AttributeInfo_AttrBodyCode(v)
    }
}
impl From<&JavaClass_AttributeInfo_Info> for OptRc<JavaClass_AttributeInfo_AttrBodyExceptions> {
    fn from(v: &JavaClass_AttributeInfo_Info) -> Self {
        if let JavaClass_AttributeInfo_Info::JavaClass_AttributeInfo_AttrBodyExceptions(x) = v {
            return x.clone();
        }
        panic!("expected JavaClass_AttributeInfo_Info::JavaClass_AttributeInfo_AttrBodyExceptions, got {:?}", v)
    }
}
impl From<OptRc<JavaClass_AttributeInfo_AttrBodyExceptions>> for JavaClass_AttributeInfo_Info {
    fn from(v: OptRc<JavaClass_AttributeInfo_AttrBodyExceptions>) -> Self {
        Self::JavaClass_AttributeInfo_AttrBodyExceptions(v)
    }
}
impl From<&JavaClass_AttributeInfo_Info> for OptRc<JavaClass_AttributeInfo_AttrBodySourceFile> {
    fn from(v: &JavaClass_AttributeInfo_Info) -> Self {
        if let JavaClass_AttributeInfo_Info::JavaClass_AttributeInfo_AttrBodySourceFile(x) = v {
            return x.clone();
        }
        panic!("expected JavaClass_AttributeInfo_Info::JavaClass_AttributeInfo_AttrBodySourceFile, got {:?}", v)
    }
}
impl From<OptRc<JavaClass_AttributeInfo_AttrBodySourceFile>> for JavaClass_AttributeInfo_Info {
    fn from(v: OptRc<JavaClass_AttributeInfo_AttrBodySourceFile>) -> Self {
        Self::JavaClass_AttributeInfo_AttrBodySourceFile(v)
    }
}
impl From<&JavaClass_AttributeInfo_Info> for Vec<u8> {
    fn from(v: &JavaClass_AttributeInfo_Info) -> Self {
        if let JavaClass_AttributeInfo_Info::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected JavaClass_AttributeInfo_Info::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for JavaClass_AttributeInfo_Info {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&JavaClass_AttributeInfo_Info> for OptRc<JavaClass_AttributeInfo_AttrBodyLineNumberTable> {
    fn from(v: &JavaClass_AttributeInfo_Info) -> Self {
        if let JavaClass_AttributeInfo_Info::JavaClass_AttributeInfo_AttrBodyLineNumberTable(x) = v {
            return x.clone();
        }
        panic!("expected JavaClass_AttributeInfo_Info::JavaClass_AttributeInfo_AttrBodyLineNumberTable, got {:?}", v)
    }
}
impl From<OptRc<JavaClass_AttributeInfo_AttrBodyLineNumberTable>> for JavaClass_AttributeInfo_Info {
    fn from(v: OptRc<JavaClass_AttributeInfo_AttrBodyLineNumberTable>) -> Self {
        Self::JavaClass_AttributeInfo_AttrBodyLineNumberTable(v)
    }
}
impl KStruct for JavaClass_AttributeInfo {
    type Root = JavaClass;
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
        *self_rc.name_index.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.attribute_length.borrow_mut() = _io.read_u4be()?.into();
        {
            let on = self_rc.name_as_str()?;
            if *on == "Code" {
                *self_rc.info_raw.borrow_mut() = _io.read_bytes(*self_rc.attribute_length() as usize)?.into();
                let info_raw = self_rc.info_raw.borrow();
                let _t_info_raw_io = BytesReader::from(info_raw.clone());
                let t = Self::read_into::<BytesReader, JavaClass_AttributeInfo_AttrBodyCode>(&_t_info_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.info.borrow_mut() = Some(t);
            }
            else if *on == "Exceptions" {
                *self_rc.info_raw.borrow_mut() = _io.read_bytes(*self_rc.attribute_length() as usize)?.into();
                let info_raw = self_rc.info_raw.borrow();
                let _t_info_raw_io = BytesReader::from(info_raw.clone());
                let t = Self::read_into::<BytesReader, JavaClass_AttributeInfo_AttrBodyExceptions>(&_t_info_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.info.borrow_mut() = Some(t);
            }
            else if *on == "LineNumberTable" {
                *self_rc.info_raw.borrow_mut() = _io.read_bytes(*self_rc.attribute_length() as usize)?.into();
                let info_raw = self_rc.info_raw.borrow();
                let _t_info_raw_io = BytesReader::from(info_raw.clone());
                let t = Self::read_into::<BytesReader, JavaClass_AttributeInfo_AttrBodyLineNumberTable>(&_t_info_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.info.borrow_mut() = Some(t);
            }
            else if *on == "SourceFile" {
                *self_rc.info_raw.borrow_mut() = _io.read_bytes(*self_rc.attribute_length() as usize)?.into();
                let info_raw = self_rc.info_raw.borrow();
                let _t_info_raw_io = BytesReader::from(info_raw.clone());
                let t = Self::read_into::<BytesReader, JavaClass_AttributeInfo_AttrBodySourceFile>(&_t_info_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.info.borrow_mut() = Some(t);
            }
            else {
                *self_rc.info.borrow_mut() = Some(_io.read_bytes(*self_rc.attribute_length() as usize)?.into());
            }
        }
        Ok(())
    }
}
impl JavaClass_AttributeInfo {
    pub fn name_as_str(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name_as_str.get() {
            return Ok(self.name_as_str.borrow());
        }
        self.f_name_as_str.set(true);
        *self.name_as_str.borrow_mut() = Into::<OptRc<JavaClass_Utf8CpInfo>>::into(&*_r.constant_pool()[((*self.name_index() as u16) - (1 as u16)) as usize].cp_info().as_ref().unwrap()).value().to_string();
        Ok(self.name_as_str.borrow())
    }
}
impl JavaClass_AttributeInfo {
    pub fn name_index(&self) -> Ref<'_, u16> {
        self.name_index.borrow()
    }
}
impl JavaClass_AttributeInfo {
    pub fn attribute_length(&self) -> Ref<'_, u32> {
        self.attribute_length.borrow()
    }
}
impl JavaClass_AttributeInfo {
    pub fn info(&self) -> Ref<'_, Option<JavaClass_AttributeInfo_Info>> {
        self.info.borrow()
    }
}
impl JavaClass_AttributeInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl JavaClass_AttributeInfo {
    pub fn info_raw(&self) -> Ref<'_, Vec<u8>> {
        self.info_raw.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.3 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_AttributeInfo_AttrBodyCode {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass_AttributeInfo>,
    pub _self: SharedType<Self>,
    max_stack: RefCell<u16>,
    max_locals: RefCell<u16>,
    code_length: RefCell<u32>,
    code: RefCell<Vec<u8>>,
    exception_table_length: RefCell<u16>,
    exception_table: RefCell<Vec<OptRc<JavaClass_AttributeInfo_AttrBodyCode_ExceptionEntry>>>,
    attributes_count: RefCell<u16>,
    attributes: RefCell<Vec<OptRc<JavaClass_AttributeInfo>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for JavaClass_AttributeInfo_AttrBodyCode {
    type Root = JavaClass;
    type Parent = JavaClass_AttributeInfo;

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
        *self_rc.max_stack.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.max_locals.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.code_length.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.code.borrow_mut() = _io.read_bytes(*self_rc.code_length() as usize)?.into();
        *self_rc.exception_table_length.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.exception_table.borrow_mut() = Vec::new();
        let l_exception_table = *self_rc.exception_table_length();
        for _i in 0..l_exception_table {
            let t = Self::read_into::<_, JavaClass_AttributeInfo_AttrBodyCode_ExceptionEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.exception_table.borrow_mut().push(t);
        }
        *self_rc.attributes_count.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.attributes.borrow_mut() = Vec::new();
        let l_attributes = *self_rc.attributes_count();
        for _i in 0..l_attributes {
            let t = Self::read_into::<_, JavaClass_AttributeInfo>(&*_io, Some(self_rc._root.clone()), None)?.into();
            self_rc.attributes.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl JavaClass_AttributeInfo_AttrBodyCode {
}
impl JavaClass_AttributeInfo_AttrBodyCode {
    pub fn max_stack(&self) -> Ref<'_, u16> {
        self.max_stack.borrow()
    }
}
impl JavaClass_AttributeInfo_AttrBodyCode {
    pub fn max_locals(&self) -> Ref<'_, u16> {
        self.max_locals.borrow()
    }
}
impl JavaClass_AttributeInfo_AttrBodyCode {
    pub fn code_length(&self) -> Ref<'_, u32> {
        self.code_length.borrow()
    }
}
impl JavaClass_AttributeInfo_AttrBodyCode {
    pub fn code(&self) -> Ref<'_, Vec<u8>> {
        self.code.borrow()
    }
}
impl JavaClass_AttributeInfo_AttrBodyCode {
    pub fn exception_table_length(&self) -> Ref<'_, u16> {
        self.exception_table_length.borrow()
    }
}
impl JavaClass_AttributeInfo_AttrBodyCode {
    pub fn exception_table(&self) -> Ref<'_, Vec<OptRc<JavaClass_AttributeInfo_AttrBodyCode_ExceptionEntry>>> {
        self.exception_table.borrow()
    }
}
impl JavaClass_AttributeInfo_AttrBodyCode {
    pub fn attributes_count(&self) -> Ref<'_, u16> {
        self.attributes_count.borrow()
    }
}
impl JavaClass_AttributeInfo_AttrBodyCode {
    pub fn attributes(&self) -> Ref<'_, Vec<OptRc<JavaClass_AttributeInfo>>> {
        self.attributes.borrow()
    }
}
impl JavaClass_AttributeInfo_AttrBodyCode {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.3 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_AttributeInfo_AttrBodyCode_ExceptionEntry {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass_AttributeInfo_AttrBodyCode>,
    pub _self: SharedType<Self>,
    start_pc: RefCell<u16>,
    end_pc: RefCell<u16>,
    handler_pc: RefCell<u16>,
    catch_type: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_catch_exception: Cell<bool>,
    catch_exception: RefCell<OptRc<JavaClass_ConstantPoolEntry>>,
}
impl KStruct for JavaClass_AttributeInfo_AttrBodyCode_ExceptionEntry {
    type Root = JavaClass;
    type Parent = JavaClass_AttributeInfo_AttrBodyCode;

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
        *self_rc.start_pc.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.end_pc.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.handler_pc.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.catch_type.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl JavaClass_AttributeInfo_AttrBodyCode_ExceptionEntry {
    pub fn catch_exception(
        &self
    ) -> KResult<Ref<'_, OptRc<JavaClass_ConstantPoolEntry>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_catch_exception.get() {
            return Ok(self.catch_exception.borrow());
        }
        if ((*self.catch_type() as u16) != (0 as u16)) {
            *self.catch_exception.borrow_mut() = _r.constant_pool()[((*self.catch_type() as u16) - (1 as u16)) as usize].clone();
        }
        Ok(self.catch_exception.borrow())
    }
}

/**
 * Start of a code region where exception handler is being
 * active, index in code array (inclusive)
 */
impl JavaClass_AttributeInfo_AttrBodyCode_ExceptionEntry {
    pub fn start_pc(&self) -> Ref<'_, u16> {
        self.start_pc.borrow()
    }
}

/**
 * End of a code region where exception handler is being
 * active, index in code array (exclusive)
 */
impl JavaClass_AttributeInfo_AttrBodyCode_ExceptionEntry {
    pub fn end_pc(&self) -> Ref<'_, u16> {
        self.end_pc.borrow()
    }
}

/**
 * Start of exception handler code, index in code array
 */
impl JavaClass_AttributeInfo_AttrBodyCode_ExceptionEntry {
    pub fn handler_pc(&self) -> Ref<'_, u16> {
        self.handler_pc.borrow()
    }
}

/**
 * Exception class that this handler catches, index in constant
 * pool, or 0 (catch all exceptions handler, used to implement
 * `finally`).
 */
impl JavaClass_AttributeInfo_AttrBodyCode_ExceptionEntry {
    pub fn catch_type(&self) -> Ref<'_, u16> {
        self.catch_type.borrow()
    }
}
impl JavaClass_AttributeInfo_AttrBodyCode_ExceptionEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.5 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_AttributeInfo_AttrBodyExceptions {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass_AttributeInfo>,
    pub _self: SharedType<Self>,
    number_of_exceptions: RefCell<u16>,
    exceptions: RefCell<Vec<OptRc<JavaClass_AttributeInfo_AttrBodyExceptions_ExceptionTableEntry>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for JavaClass_AttributeInfo_AttrBodyExceptions {
    type Root = JavaClass;
    type Parent = JavaClass_AttributeInfo;

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
        *self_rc.number_of_exceptions.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.exceptions.borrow_mut() = Vec::new();
        let l_exceptions = *self_rc.number_of_exceptions();
        for _i in 0..l_exceptions {
            let t = Self::read_into::<_, JavaClass_AttributeInfo_AttrBodyExceptions_ExceptionTableEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.exceptions.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl JavaClass_AttributeInfo_AttrBodyExceptions {
}
impl JavaClass_AttributeInfo_AttrBodyExceptions {
    pub fn number_of_exceptions(&self) -> Ref<'_, u16> {
        self.number_of_exceptions.borrow()
    }
}
impl JavaClass_AttributeInfo_AttrBodyExceptions {
    pub fn exceptions(&self) -> Ref<'_, Vec<OptRc<JavaClass_AttributeInfo_AttrBodyExceptions_ExceptionTableEntry>>> {
        self.exceptions.borrow()
    }
}
impl JavaClass_AttributeInfo_AttrBodyExceptions {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct JavaClass_AttributeInfo_AttrBodyExceptions_ExceptionTableEntry {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass_AttributeInfo_AttrBodyExceptions>,
    pub _self: SharedType<Self>,
    index: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_as_info: Cell<bool>,
    as_info: RefCell<OptRc<JavaClass_ClassCpInfo>>,
    f_name_as_str: Cell<bool>,
    name_as_str: RefCell<String>,
}
impl KStruct for JavaClass_AttributeInfo_AttrBodyExceptions_ExceptionTableEntry {
    type Root = JavaClass;
    type Parent = JavaClass_AttributeInfo_AttrBodyExceptions;

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
        *self_rc.index.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl JavaClass_AttributeInfo_AttrBodyExceptions_ExceptionTableEntry {
    pub fn as_info(
        &self
    ) -> KResult<Ref<'_, OptRc<JavaClass_ClassCpInfo>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_as_info.get() {
            return Ok(self.as_info.borrow());
        }
        *self.as_info.borrow_mut() = Into::<OptRc<JavaClass_ClassCpInfo>>::into(&*_r.constant_pool()[((*self.index() as u16) - (1 as u16)) as usize].cp_info().as_ref().unwrap()).clone();
        Ok(self.as_info.borrow())
    }
    pub fn name_as_str(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name_as_str.get() {
            return Ok(self.name_as_str.borrow());
        }
        self.f_name_as_str.set(true);
        *self.name_as_str.borrow_mut() = self.as_info()?.name_as_str()?.to_string();
        Ok(self.name_as_str.borrow())
    }
}
impl JavaClass_AttributeInfo_AttrBodyExceptions_ExceptionTableEntry {
    pub fn index(&self) -> Ref<'_, u16> {
        self.index.borrow()
    }
}
impl JavaClass_AttributeInfo_AttrBodyExceptions_ExceptionTableEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.12 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_AttributeInfo_AttrBodyLineNumberTable {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass_AttributeInfo>,
    pub _self: SharedType<Self>,
    line_number_table_length: RefCell<u16>,
    line_number_table: RefCell<Vec<OptRc<JavaClass_AttributeInfo_AttrBodyLineNumberTable_LineNumberTableEntry>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for JavaClass_AttributeInfo_AttrBodyLineNumberTable {
    type Root = JavaClass;
    type Parent = JavaClass_AttributeInfo;

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
        *self_rc.line_number_table_length.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.line_number_table.borrow_mut() = Vec::new();
        let l_line_number_table = *self_rc.line_number_table_length();
        for _i in 0..l_line_number_table {
            let t = Self::read_into::<_, JavaClass_AttributeInfo_AttrBodyLineNumberTable_LineNumberTableEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.line_number_table.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl JavaClass_AttributeInfo_AttrBodyLineNumberTable {
}
impl JavaClass_AttributeInfo_AttrBodyLineNumberTable {
    pub fn line_number_table_length(&self) -> Ref<'_, u16> {
        self.line_number_table_length.borrow()
    }
}
impl JavaClass_AttributeInfo_AttrBodyLineNumberTable {
    pub fn line_number_table(&self) -> Ref<'_, Vec<OptRc<JavaClass_AttributeInfo_AttrBodyLineNumberTable_LineNumberTableEntry>>> {
        self.line_number_table.borrow()
    }
}
impl JavaClass_AttributeInfo_AttrBodyLineNumberTable {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct JavaClass_AttributeInfo_AttrBodyLineNumberTable_LineNumberTableEntry {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass_AttributeInfo_AttrBodyLineNumberTable>,
    pub _self: SharedType<Self>,
    start_pc: RefCell<u16>,
    line_number: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for JavaClass_AttributeInfo_AttrBodyLineNumberTable_LineNumberTableEntry {
    type Root = JavaClass;
    type Parent = JavaClass_AttributeInfo_AttrBodyLineNumberTable;

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
        *self_rc.start_pc.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.line_number.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl JavaClass_AttributeInfo_AttrBodyLineNumberTable_LineNumberTableEntry {
}
impl JavaClass_AttributeInfo_AttrBodyLineNumberTable_LineNumberTableEntry {
    pub fn start_pc(&self) -> Ref<'_, u16> {
        self.start_pc.borrow()
    }
}
impl JavaClass_AttributeInfo_AttrBodyLineNumberTable_LineNumberTableEntry {
    pub fn line_number(&self) -> Ref<'_, u16> {
        self.line_number.borrow()
    }
}
impl JavaClass_AttributeInfo_AttrBodyLineNumberTable_LineNumberTableEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.7.10 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_AttributeInfo_AttrBodySourceFile {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass_AttributeInfo>,
    pub _self: SharedType<Self>,
    sourcefile_index: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_sourcefile_as_str: Cell<bool>,
    sourcefile_as_str: RefCell<String>,
}
impl KStruct for JavaClass_AttributeInfo_AttrBodySourceFile {
    type Root = JavaClass;
    type Parent = JavaClass_AttributeInfo;

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
        *self_rc.sourcefile_index.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl JavaClass_AttributeInfo_AttrBodySourceFile {
    pub fn sourcefile_as_str(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_sourcefile_as_str.get() {
            return Ok(self.sourcefile_as_str.borrow());
        }
        self.f_sourcefile_as_str.set(true);
        *self.sourcefile_as_str.borrow_mut() = Into::<OptRc<JavaClass_Utf8CpInfo>>::into(&*_r.constant_pool()[((*self.sourcefile_index() as u16) - (1 as u16)) as usize].cp_info().as_ref().unwrap()).value().to_string();
        Ok(self.sourcefile_as_str.borrow())
    }
}
impl JavaClass_AttributeInfo_AttrBodySourceFile {
    pub fn sourcefile_index(&self) -> Ref<'_, u16> {
        self.sourcefile_index.borrow()
    }
}
impl JavaClass_AttributeInfo_AttrBodySourceFile {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.1 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_ClassCpInfo {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass_ConstantPoolEntry>,
    pub _self: SharedType<Self>,
    name_index: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_name_as_info: Cell<bool>,
    name_as_info: RefCell<OptRc<JavaClass_Utf8CpInfo>>,
    f_name_as_str: Cell<bool>,
    name_as_str: RefCell<String>,
}
impl KStruct for JavaClass_ClassCpInfo {
    type Root = JavaClass;
    type Parent = JavaClass_ConstantPoolEntry;

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
        *self_rc.name_index.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl JavaClass_ClassCpInfo {
    pub fn name_as_info(
        &self
    ) -> KResult<Ref<'_, OptRc<JavaClass_Utf8CpInfo>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name_as_info.get() {
            return Ok(self.name_as_info.borrow());
        }
        *self.name_as_info.borrow_mut() = Into::<OptRc<JavaClass_Utf8CpInfo>>::into(&*_r.constant_pool()[((*self.name_index() as u16) - (1 as u16)) as usize].cp_info().as_ref().unwrap()).clone();
        Ok(self.name_as_info.borrow())
    }
    pub fn name_as_str(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name_as_str.get() {
            return Ok(self.name_as_str.borrow());
        }
        self.f_name_as_str.set(true);
        *self.name_as_str.borrow_mut() = self.name_as_info()?.value().to_string();
        Ok(self.name_as_str.borrow())
    }
}
impl JavaClass_ClassCpInfo {
    pub fn name_index(&self) -> Ref<'_, u16> {
        self.name_index.borrow()
    }
}
impl JavaClass_ClassCpInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_ConstantPoolEntry {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass>,
    pub _self: SharedType<Self>,
    is_prev_two_entries: RefCell<bool>,
    tag: RefCell<JavaClass_ConstantPoolEntry_TagEnum>,
    cp_info: RefCell<Option<JavaClass_ConstantPoolEntry_CpInfo>>,
    _io: RefCell<BytesReader>,
    f_is_two_entries: Cell<bool>,
    is_two_entries: RefCell<bool>,
}
#[derive(Debug, Clone)]
pub enum JavaClass_ConstantPoolEntry_CpInfo {
    JavaClass_InvokeDynamicCpInfo(OptRc<JavaClass_InvokeDynamicCpInfo>),
    JavaClass_FieldRefCpInfo(OptRc<JavaClass_FieldRefCpInfo>),
    JavaClass_MethodRefCpInfo(OptRc<JavaClass_MethodRefCpInfo>),
    JavaClass_StringCpInfo(OptRc<JavaClass_StringCpInfo>),
    JavaClass_InterfaceMethodRefCpInfo(OptRc<JavaClass_InterfaceMethodRefCpInfo>),
    JavaClass_ModulePackageCpInfo(OptRc<JavaClass_ModulePackageCpInfo>),
    JavaClass_DoubleCpInfo(OptRc<JavaClass_DoubleCpInfo>),
    JavaClass_DynamicCpInfo(OptRc<JavaClass_DynamicCpInfo>),
    JavaClass_FloatCpInfo(OptRc<JavaClass_FloatCpInfo>),
    JavaClass_MethodHandleCpInfo(OptRc<JavaClass_MethodHandleCpInfo>),
    JavaClass_NameAndTypeCpInfo(OptRc<JavaClass_NameAndTypeCpInfo>),
    JavaClass_LongCpInfo(OptRc<JavaClass_LongCpInfo>),
    JavaClass_Utf8CpInfo(OptRc<JavaClass_Utf8CpInfo>),
    JavaClass_IntegerCpInfo(OptRc<JavaClass_IntegerCpInfo>),
    JavaClass_MethodTypeCpInfo(OptRc<JavaClass_MethodTypeCpInfo>),
    JavaClass_ClassCpInfo(OptRc<JavaClass_ClassCpInfo>),
}
impl From<&JavaClass_ConstantPoolEntry_CpInfo> for OptRc<JavaClass_InvokeDynamicCpInfo> {
    fn from(v: &JavaClass_ConstantPoolEntry_CpInfo) -> Self {
        if let JavaClass_ConstantPoolEntry_CpInfo::JavaClass_InvokeDynamicCpInfo(x) = v {
            return x.clone();
        }
        panic!("expected JavaClass_ConstantPoolEntry_CpInfo::JavaClass_InvokeDynamicCpInfo, got {:?}", v)
    }
}
impl From<OptRc<JavaClass_InvokeDynamicCpInfo>> for JavaClass_ConstantPoolEntry_CpInfo {
    fn from(v: OptRc<JavaClass_InvokeDynamicCpInfo>) -> Self {
        Self::JavaClass_InvokeDynamicCpInfo(v)
    }
}
impl From<&JavaClass_ConstantPoolEntry_CpInfo> for OptRc<JavaClass_FieldRefCpInfo> {
    fn from(v: &JavaClass_ConstantPoolEntry_CpInfo) -> Self {
        if let JavaClass_ConstantPoolEntry_CpInfo::JavaClass_FieldRefCpInfo(x) = v {
            return x.clone();
        }
        panic!("expected JavaClass_ConstantPoolEntry_CpInfo::JavaClass_FieldRefCpInfo, got {:?}", v)
    }
}
impl From<OptRc<JavaClass_FieldRefCpInfo>> for JavaClass_ConstantPoolEntry_CpInfo {
    fn from(v: OptRc<JavaClass_FieldRefCpInfo>) -> Self {
        Self::JavaClass_FieldRefCpInfo(v)
    }
}
impl From<&JavaClass_ConstantPoolEntry_CpInfo> for OptRc<JavaClass_MethodRefCpInfo> {
    fn from(v: &JavaClass_ConstantPoolEntry_CpInfo) -> Self {
        if let JavaClass_ConstantPoolEntry_CpInfo::JavaClass_MethodRefCpInfo(x) = v {
            return x.clone();
        }
        panic!("expected JavaClass_ConstantPoolEntry_CpInfo::JavaClass_MethodRefCpInfo, got {:?}", v)
    }
}
impl From<OptRc<JavaClass_MethodRefCpInfo>> for JavaClass_ConstantPoolEntry_CpInfo {
    fn from(v: OptRc<JavaClass_MethodRefCpInfo>) -> Self {
        Self::JavaClass_MethodRefCpInfo(v)
    }
}
impl From<&JavaClass_ConstantPoolEntry_CpInfo> for OptRc<JavaClass_StringCpInfo> {
    fn from(v: &JavaClass_ConstantPoolEntry_CpInfo) -> Self {
        if let JavaClass_ConstantPoolEntry_CpInfo::JavaClass_StringCpInfo(x) = v {
            return x.clone();
        }
        panic!("expected JavaClass_ConstantPoolEntry_CpInfo::JavaClass_StringCpInfo, got {:?}", v)
    }
}
impl From<OptRc<JavaClass_StringCpInfo>> for JavaClass_ConstantPoolEntry_CpInfo {
    fn from(v: OptRc<JavaClass_StringCpInfo>) -> Self {
        Self::JavaClass_StringCpInfo(v)
    }
}
impl From<&JavaClass_ConstantPoolEntry_CpInfo> for OptRc<JavaClass_InterfaceMethodRefCpInfo> {
    fn from(v: &JavaClass_ConstantPoolEntry_CpInfo) -> Self {
        if let JavaClass_ConstantPoolEntry_CpInfo::JavaClass_InterfaceMethodRefCpInfo(x) = v {
            return x.clone();
        }
        panic!("expected JavaClass_ConstantPoolEntry_CpInfo::JavaClass_InterfaceMethodRefCpInfo, got {:?}", v)
    }
}
impl From<OptRc<JavaClass_InterfaceMethodRefCpInfo>> for JavaClass_ConstantPoolEntry_CpInfo {
    fn from(v: OptRc<JavaClass_InterfaceMethodRefCpInfo>) -> Self {
        Self::JavaClass_InterfaceMethodRefCpInfo(v)
    }
}
impl From<&JavaClass_ConstantPoolEntry_CpInfo> for OptRc<JavaClass_ModulePackageCpInfo> {
    fn from(v: &JavaClass_ConstantPoolEntry_CpInfo) -> Self {
        if let JavaClass_ConstantPoolEntry_CpInfo::JavaClass_ModulePackageCpInfo(x) = v {
            return x.clone();
        }
        panic!("expected JavaClass_ConstantPoolEntry_CpInfo::JavaClass_ModulePackageCpInfo, got {:?}", v)
    }
}
impl From<OptRc<JavaClass_ModulePackageCpInfo>> for JavaClass_ConstantPoolEntry_CpInfo {
    fn from(v: OptRc<JavaClass_ModulePackageCpInfo>) -> Self {
        Self::JavaClass_ModulePackageCpInfo(v)
    }
}
impl From<&JavaClass_ConstantPoolEntry_CpInfo> for OptRc<JavaClass_DoubleCpInfo> {
    fn from(v: &JavaClass_ConstantPoolEntry_CpInfo) -> Self {
        if let JavaClass_ConstantPoolEntry_CpInfo::JavaClass_DoubleCpInfo(x) = v {
            return x.clone();
        }
        panic!("expected JavaClass_ConstantPoolEntry_CpInfo::JavaClass_DoubleCpInfo, got {:?}", v)
    }
}
impl From<OptRc<JavaClass_DoubleCpInfo>> for JavaClass_ConstantPoolEntry_CpInfo {
    fn from(v: OptRc<JavaClass_DoubleCpInfo>) -> Self {
        Self::JavaClass_DoubleCpInfo(v)
    }
}
impl From<&JavaClass_ConstantPoolEntry_CpInfo> for OptRc<JavaClass_DynamicCpInfo> {
    fn from(v: &JavaClass_ConstantPoolEntry_CpInfo) -> Self {
        if let JavaClass_ConstantPoolEntry_CpInfo::JavaClass_DynamicCpInfo(x) = v {
            return x.clone();
        }
        panic!("expected JavaClass_ConstantPoolEntry_CpInfo::JavaClass_DynamicCpInfo, got {:?}", v)
    }
}
impl From<OptRc<JavaClass_DynamicCpInfo>> for JavaClass_ConstantPoolEntry_CpInfo {
    fn from(v: OptRc<JavaClass_DynamicCpInfo>) -> Self {
        Self::JavaClass_DynamicCpInfo(v)
    }
}
impl From<&JavaClass_ConstantPoolEntry_CpInfo> for OptRc<JavaClass_FloatCpInfo> {
    fn from(v: &JavaClass_ConstantPoolEntry_CpInfo) -> Self {
        if let JavaClass_ConstantPoolEntry_CpInfo::JavaClass_FloatCpInfo(x) = v {
            return x.clone();
        }
        panic!("expected JavaClass_ConstantPoolEntry_CpInfo::JavaClass_FloatCpInfo, got {:?}", v)
    }
}
impl From<OptRc<JavaClass_FloatCpInfo>> for JavaClass_ConstantPoolEntry_CpInfo {
    fn from(v: OptRc<JavaClass_FloatCpInfo>) -> Self {
        Self::JavaClass_FloatCpInfo(v)
    }
}
impl From<&JavaClass_ConstantPoolEntry_CpInfo> for OptRc<JavaClass_MethodHandleCpInfo> {
    fn from(v: &JavaClass_ConstantPoolEntry_CpInfo) -> Self {
        if let JavaClass_ConstantPoolEntry_CpInfo::JavaClass_MethodHandleCpInfo(x) = v {
            return x.clone();
        }
        panic!("expected JavaClass_ConstantPoolEntry_CpInfo::JavaClass_MethodHandleCpInfo, got {:?}", v)
    }
}
impl From<OptRc<JavaClass_MethodHandleCpInfo>> for JavaClass_ConstantPoolEntry_CpInfo {
    fn from(v: OptRc<JavaClass_MethodHandleCpInfo>) -> Self {
        Self::JavaClass_MethodHandleCpInfo(v)
    }
}
impl From<&JavaClass_ConstantPoolEntry_CpInfo> for OptRc<JavaClass_NameAndTypeCpInfo> {
    fn from(v: &JavaClass_ConstantPoolEntry_CpInfo) -> Self {
        if let JavaClass_ConstantPoolEntry_CpInfo::JavaClass_NameAndTypeCpInfo(x) = v {
            return x.clone();
        }
        panic!("expected JavaClass_ConstantPoolEntry_CpInfo::JavaClass_NameAndTypeCpInfo, got {:?}", v)
    }
}
impl From<OptRc<JavaClass_NameAndTypeCpInfo>> for JavaClass_ConstantPoolEntry_CpInfo {
    fn from(v: OptRc<JavaClass_NameAndTypeCpInfo>) -> Self {
        Self::JavaClass_NameAndTypeCpInfo(v)
    }
}
impl From<&JavaClass_ConstantPoolEntry_CpInfo> for OptRc<JavaClass_LongCpInfo> {
    fn from(v: &JavaClass_ConstantPoolEntry_CpInfo) -> Self {
        if let JavaClass_ConstantPoolEntry_CpInfo::JavaClass_LongCpInfo(x) = v {
            return x.clone();
        }
        panic!("expected JavaClass_ConstantPoolEntry_CpInfo::JavaClass_LongCpInfo, got {:?}", v)
    }
}
impl From<OptRc<JavaClass_LongCpInfo>> for JavaClass_ConstantPoolEntry_CpInfo {
    fn from(v: OptRc<JavaClass_LongCpInfo>) -> Self {
        Self::JavaClass_LongCpInfo(v)
    }
}
impl From<&JavaClass_ConstantPoolEntry_CpInfo> for OptRc<JavaClass_Utf8CpInfo> {
    fn from(v: &JavaClass_ConstantPoolEntry_CpInfo) -> Self {
        if let JavaClass_ConstantPoolEntry_CpInfo::JavaClass_Utf8CpInfo(x) = v {
            return x.clone();
        }
        panic!("expected JavaClass_ConstantPoolEntry_CpInfo::JavaClass_Utf8CpInfo, got {:?}", v)
    }
}
impl From<OptRc<JavaClass_Utf8CpInfo>> for JavaClass_ConstantPoolEntry_CpInfo {
    fn from(v: OptRc<JavaClass_Utf8CpInfo>) -> Self {
        Self::JavaClass_Utf8CpInfo(v)
    }
}
impl From<&JavaClass_ConstantPoolEntry_CpInfo> for OptRc<JavaClass_IntegerCpInfo> {
    fn from(v: &JavaClass_ConstantPoolEntry_CpInfo) -> Self {
        if let JavaClass_ConstantPoolEntry_CpInfo::JavaClass_IntegerCpInfo(x) = v {
            return x.clone();
        }
        panic!("expected JavaClass_ConstantPoolEntry_CpInfo::JavaClass_IntegerCpInfo, got {:?}", v)
    }
}
impl From<OptRc<JavaClass_IntegerCpInfo>> for JavaClass_ConstantPoolEntry_CpInfo {
    fn from(v: OptRc<JavaClass_IntegerCpInfo>) -> Self {
        Self::JavaClass_IntegerCpInfo(v)
    }
}
impl From<&JavaClass_ConstantPoolEntry_CpInfo> for OptRc<JavaClass_MethodTypeCpInfo> {
    fn from(v: &JavaClass_ConstantPoolEntry_CpInfo) -> Self {
        if let JavaClass_ConstantPoolEntry_CpInfo::JavaClass_MethodTypeCpInfo(x) = v {
            return x.clone();
        }
        panic!("expected JavaClass_ConstantPoolEntry_CpInfo::JavaClass_MethodTypeCpInfo, got {:?}", v)
    }
}
impl From<OptRc<JavaClass_MethodTypeCpInfo>> for JavaClass_ConstantPoolEntry_CpInfo {
    fn from(v: OptRc<JavaClass_MethodTypeCpInfo>) -> Self {
        Self::JavaClass_MethodTypeCpInfo(v)
    }
}
impl From<&JavaClass_ConstantPoolEntry_CpInfo> for OptRc<JavaClass_ClassCpInfo> {
    fn from(v: &JavaClass_ConstantPoolEntry_CpInfo) -> Self {
        if let JavaClass_ConstantPoolEntry_CpInfo::JavaClass_ClassCpInfo(x) = v {
            return x.clone();
        }
        panic!("expected JavaClass_ConstantPoolEntry_CpInfo::JavaClass_ClassCpInfo, got {:?}", v)
    }
}
impl From<OptRc<JavaClass_ClassCpInfo>> for JavaClass_ConstantPoolEntry_CpInfo {
    fn from(v: OptRc<JavaClass_ClassCpInfo>) -> Self {
        Self::JavaClass_ClassCpInfo(v)
    }
}
impl KStruct for JavaClass_ConstantPoolEntry {
    type Root = JavaClass;
    type Parent = JavaClass;

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
        if !(*self_rc.is_prev_two_entries()) {
            *self_rc.tag.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        }
        if !(*self_rc.is_prev_two_entries()) {
            match *self_rc.tag() {
                JavaClass_ConstantPoolEntry_TagEnum::ClassType => {
                    let t = Self::read_into::<_, JavaClass_ClassCpInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.cp_info.borrow_mut() = Some(t);
                }
                JavaClass_ConstantPoolEntry_TagEnum::Double => {
                    let t = Self::read_into::<_, JavaClass_DoubleCpInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.cp_info.borrow_mut() = Some(t);
                }
                JavaClass_ConstantPoolEntry_TagEnum::Dynamic => {
                    let t = Self::read_into::<_, JavaClass_DynamicCpInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.cp_info.borrow_mut() = Some(t);
                }
                JavaClass_ConstantPoolEntry_TagEnum::FieldRef => {
                    let t = Self::read_into::<_, JavaClass_FieldRefCpInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.cp_info.borrow_mut() = Some(t);
                }
                JavaClass_ConstantPoolEntry_TagEnum::Float => {
                    let t = Self::read_into::<_, JavaClass_FloatCpInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.cp_info.borrow_mut() = Some(t);
                }
                JavaClass_ConstantPoolEntry_TagEnum::Integer => {
                    let t = Self::read_into::<_, JavaClass_IntegerCpInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.cp_info.borrow_mut() = Some(t);
                }
                JavaClass_ConstantPoolEntry_TagEnum::InterfaceMethodRef => {
                    let t = Self::read_into::<_, JavaClass_InterfaceMethodRefCpInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.cp_info.borrow_mut() = Some(t);
                }
                JavaClass_ConstantPoolEntry_TagEnum::InvokeDynamic => {
                    let t = Self::read_into::<_, JavaClass_InvokeDynamicCpInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.cp_info.borrow_mut() = Some(t);
                }
                JavaClass_ConstantPoolEntry_TagEnum::Long => {
                    let t = Self::read_into::<_, JavaClass_LongCpInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.cp_info.borrow_mut() = Some(t);
                }
                JavaClass_ConstantPoolEntry_TagEnum::MethodHandle => {
                    let t = Self::read_into::<_, JavaClass_MethodHandleCpInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.cp_info.borrow_mut() = Some(t);
                }
                JavaClass_ConstantPoolEntry_TagEnum::MethodRef => {
                    let t = Self::read_into::<_, JavaClass_MethodRefCpInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.cp_info.borrow_mut() = Some(t);
                }
                JavaClass_ConstantPoolEntry_TagEnum::MethodType => {
                    let t = Self::read_into::<_, JavaClass_MethodTypeCpInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.cp_info.borrow_mut() = Some(t);
                }
                JavaClass_ConstantPoolEntry_TagEnum::Module => {
                    let t = Self::read_into::<_, JavaClass_ModulePackageCpInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.cp_info.borrow_mut() = Some(t);
                }
                JavaClass_ConstantPoolEntry_TagEnum::NameAndType => {
                    let t = Self::read_into::<_, JavaClass_NameAndTypeCpInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.cp_info.borrow_mut() = Some(t);
                }
                JavaClass_ConstantPoolEntry_TagEnum::Package => {
                    let t = Self::read_into::<_, JavaClass_ModulePackageCpInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.cp_info.borrow_mut() = Some(t);
                }
                JavaClass_ConstantPoolEntry_TagEnum::String => {
                    let t = Self::read_into::<_, JavaClass_StringCpInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.cp_info.borrow_mut() = Some(t);
                }
                JavaClass_ConstantPoolEntry_TagEnum::Utf8 => {
                    let t = Self::read_into::<_, JavaClass_Utf8CpInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.cp_info.borrow_mut() = Some(t);
                }
                _ => {}
            }
        }
        Ok(())
    }
}
impl JavaClass_ConstantPoolEntry {
    pub fn is_prev_two_entries(&self) -> Ref<'_, bool> {
        self.is_prev_two_entries.borrow()
    }
}
impl JavaClass_ConstantPoolEntry {
    pub fn set_params(&mut self, is_prev_two_entries: bool) {
        *self.is_prev_two_entries.borrow_mut() = is_prev_two_entries;
    }
}
impl JavaClass_ConstantPoolEntry {
    pub fn is_two_entries(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_two_entries.get() {
            return Ok(self.is_two_entries.borrow());
        }
        self.f_is_two_entries.set(true);
        *self.is_two_entries.borrow_mut() = (if *self.is_prev_two_entries() { false } else {  ((*self.tag() == JavaClass_ConstantPoolEntry_TagEnum::Long) || (*self.tag() == JavaClass_ConstantPoolEntry_TagEnum::Double))  }) as bool;
        Ok(self.is_two_entries.borrow())
    }
}
impl JavaClass_ConstantPoolEntry {
    pub fn tag(&self) -> Ref<'_, JavaClass_ConstantPoolEntry_TagEnum> {
        self.tag.borrow()
    }
}
impl JavaClass_ConstantPoolEntry {
    pub fn cp_info(&self) -> Ref<'_, Option<JavaClass_ConstantPoolEntry_CpInfo>> {
        self.cp_info.borrow()
    }
}
impl JavaClass_ConstantPoolEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum JavaClass_ConstantPoolEntry_TagEnum {
    Utf8,
    Integer,
    Float,
    Long,
    Double,
    ClassType,
    String,
    FieldRef,
    MethodRef,
    InterfaceMethodRef,
    NameAndType,
    MethodHandle,
    MethodType,
    Dynamic,
    InvokeDynamic,
    Module,
    Package,
    Unknown(i64),
}

impl TryFrom<i64> for JavaClass_ConstantPoolEntry_TagEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<JavaClass_ConstantPoolEntry_TagEnum> {
        match flag {
            1 => Ok(JavaClass_ConstantPoolEntry_TagEnum::Utf8),
            3 => Ok(JavaClass_ConstantPoolEntry_TagEnum::Integer),
            4 => Ok(JavaClass_ConstantPoolEntry_TagEnum::Float),
            5 => Ok(JavaClass_ConstantPoolEntry_TagEnum::Long),
            6 => Ok(JavaClass_ConstantPoolEntry_TagEnum::Double),
            7 => Ok(JavaClass_ConstantPoolEntry_TagEnum::ClassType),
            8 => Ok(JavaClass_ConstantPoolEntry_TagEnum::String),
            9 => Ok(JavaClass_ConstantPoolEntry_TagEnum::FieldRef),
            10 => Ok(JavaClass_ConstantPoolEntry_TagEnum::MethodRef),
            11 => Ok(JavaClass_ConstantPoolEntry_TagEnum::InterfaceMethodRef),
            12 => Ok(JavaClass_ConstantPoolEntry_TagEnum::NameAndType),
            15 => Ok(JavaClass_ConstantPoolEntry_TagEnum::MethodHandle),
            16 => Ok(JavaClass_ConstantPoolEntry_TagEnum::MethodType),
            17 => Ok(JavaClass_ConstantPoolEntry_TagEnum::Dynamic),
            18 => Ok(JavaClass_ConstantPoolEntry_TagEnum::InvokeDynamic),
            19 => Ok(JavaClass_ConstantPoolEntry_TagEnum::Module),
            20 => Ok(JavaClass_ConstantPoolEntry_TagEnum::Package),
            _ => Ok(JavaClass_ConstantPoolEntry_TagEnum::Unknown(flag)),
        }
    }
}

impl From<&JavaClass_ConstantPoolEntry_TagEnum> for i64 {
    fn from(v: &JavaClass_ConstantPoolEntry_TagEnum) -> Self {
        match *v {
            JavaClass_ConstantPoolEntry_TagEnum::Utf8 => 1,
            JavaClass_ConstantPoolEntry_TagEnum::Integer => 3,
            JavaClass_ConstantPoolEntry_TagEnum::Float => 4,
            JavaClass_ConstantPoolEntry_TagEnum::Long => 5,
            JavaClass_ConstantPoolEntry_TagEnum::Double => 6,
            JavaClass_ConstantPoolEntry_TagEnum::ClassType => 7,
            JavaClass_ConstantPoolEntry_TagEnum::String => 8,
            JavaClass_ConstantPoolEntry_TagEnum::FieldRef => 9,
            JavaClass_ConstantPoolEntry_TagEnum::MethodRef => 10,
            JavaClass_ConstantPoolEntry_TagEnum::InterfaceMethodRef => 11,
            JavaClass_ConstantPoolEntry_TagEnum::NameAndType => 12,
            JavaClass_ConstantPoolEntry_TagEnum::MethodHandle => 15,
            JavaClass_ConstantPoolEntry_TagEnum::MethodType => 16,
            JavaClass_ConstantPoolEntry_TagEnum::Dynamic => 17,
            JavaClass_ConstantPoolEntry_TagEnum::InvokeDynamic => 18,
            JavaClass_ConstantPoolEntry_TagEnum::Module => 19,
            JavaClass_ConstantPoolEntry_TagEnum::Package => 20,
            JavaClass_ConstantPoolEntry_TagEnum::Unknown(v) => v
        }
    }
}

impl Default for JavaClass_ConstantPoolEntry_TagEnum {
    fn default() -> Self { JavaClass_ConstantPoolEntry_TagEnum::Unknown(0) }
}


/**
 * \sa https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.6 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_DoubleCpInfo {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass_ConstantPoolEntry>,
    pub _self: SharedType<Self>,
    value: RefCell<f64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for JavaClass_DoubleCpInfo {
    type Root = JavaClass;
    type Parent = JavaClass_ConstantPoolEntry;

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
        *self_rc.value.borrow_mut() = _io.read_f8be()?.into();
        Ok(())
    }
}
impl JavaClass_DoubleCpInfo {
}
impl JavaClass_DoubleCpInfo {
    pub fn value(&self) -> Ref<'_, f64> {
        self.value.borrow()
    }
}
impl JavaClass_DoubleCpInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-4.html#jvms-4.4.10 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_DynamicCpInfo {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass_ConstantPoolEntry>,
    pub _self: SharedType<Self>,
    unnamed0: RefCell<OptRc<JavaClass_VersionGuard>>,
    bootstrap_method_attr_index: RefCell<u16>,
    name_and_type_index: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for JavaClass_DynamicCpInfo {
    type Root = JavaClass;
    type Parent = JavaClass_ConstantPoolEntry;

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
        let f = |t : &mut JavaClass_VersionGuard| Ok(t.set_params((55).try_into().map_err(|_| KError::CastError)?));
        let t = Self::read_into_with_init::<_, JavaClass_VersionGuard>(&*_io, Some(self_rc._root.clone()), None, &f)?.into();
        *self_rc.unnamed0.borrow_mut() = t;
        *self_rc.bootstrap_method_attr_index.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.name_and_type_index.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl JavaClass_DynamicCpInfo {
}
impl JavaClass_DynamicCpInfo {
    pub fn unnamed0(&self) -> Ref<'_, OptRc<JavaClass_VersionGuard>> {
        self.unnamed0.borrow()
    }
}
impl JavaClass_DynamicCpInfo {
    pub fn bootstrap_method_attr_index(&self) -> Ref<'_, u16> {
        self.bootstrap_method_attr_index.borrow()
    }
}
impl JavaClass_DynamicCpInfo {
    pub fn name_and_type_index(&self) -> Ref<'_, u16> {
        self.name_and_type_index.borrow()
    }
}
impl JavaClass_DynamicCpInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.5 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_FieldInfo {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass>,
    pub _self: SharedType<Self>,
    access_flags: RefCell<u16>,
    name_index: RefCell<u16>,
    descriptor_index: RefCell<u16>,
    attributes_count: RefCell<u16>,
    attributes: RefCell<Vec<OptRc<JavaClass_AttributeInfo>>>,
    _io: RefCell<BytesReader>,
    f_name_as_str: Cell<bool>,
    name_as_str: RefCell<String>,
}
impl KStruct for JavaClass_FieldInfo {
    type Root = JavaClass;
    type Parent = JavaClass;

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
        *self_rc.access_flags.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.name_index.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.descriptor_index.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.attributes_count.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.attributes.borrow_mut() = Vec::new();
        let l_attributes = *self_rc.attributes_count();
        for _i in 0..l_attributes {
            let t = Self::read_into::<_, JavaClass_AttributeInfo>(&*_io, Some(self_rc._root.clone()), None)?.into();
            self_rc.attributes.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl JavaClass_FieldInfo {
    pub fn name_as_str(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name_as_str.get() {
            return Ok(self.name_as_str.borrow());
        }
        self.f_name_as_str.set(true);
        *self.name_as_str.borrow_mut() = Into::<OptRc<JavaClass_Utf8CpInfo>>::into(&*_r.constant_pool()[((*self.name_index() as u16) - (1 as u16)) as usize].cp_info().as_ref().unwrap()).value().to_string();
        Ok(self.name_as_str.borrow())
    }
}
impl JavaClass_FieldInfo {
    pub fn access_flags(&self) -> Ref<'_, u16> {
        self.access_flags.borrow()
    }
}
impl JavaClass_FieldInfo {
    pub fn name_index(&self) -> Ref<'_, u16> {
        self.name_index.borrow()
    }
}
impl JavaClass_FieldInfo {
    pub fn descriptor_index(&self) -> Ref<'_, u16> {
        self.descriptor_index.borrow()
    }
}
impl JavaClass_FieldInfo {
    pub fn attributes_count(&self) -> Ref<'_, u16> {
        self.attributes_count.borrow()
    }
}
impl JavaClass_FieldInfo {
    pub fn attributes(&self) -> Ref<'_, Vec<OptRc<JavaClass_AttributeInfo>>> {
        self.attributes.borrow()
    }
}
impl JavaClass_FieldInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_FieldRefCpInfo {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass_ConstantPoolEntry>,
    pub _self: SharedType<Self>,
    class_index: RefCell<u16>,
    name_and_type_index: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_class_as_info: Cell<bool>,
    class_as_info: RefCell<OptRc<JavaClass_ClassCpInfo>>,
    f_name_and_type_as_info: Cell<bool>,
    name_and_type_as_info: RefCell<OptRc<JavaClass_NameAndTypeCpInfo>>,
}
impl KStruct for JavaClass_FieldRefCpInfo {
    type Root = JavaClass;
    type Parent = JavaClass_ConstantPoolEntry;

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
        *self_rc.class_index.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.name_and_type_index.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl JavaClass_FieldRefCpInfo {
    pub fn class_as_info(
        &self
    ) -> KResult<Ref<'_, OptRc<JavaClass_ClassCpInfo>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_class_as_info.get() {
            return Ok(self.class_as_info.borrow());
        }
        *self.class_as_info.borrow_mut() = Into::<OptRc<JavaClass_ClassCpInfo>>::into(&*_r.constant_pool()[((*self.class_index() as u16) - (1 as u16)) as usize].cp_info().as_ref().unwrap()).clone();
        Ok(self.class_as_info.borrow())
    }
    pub fn name_and_type_as_info(
        &self
    ) -> KResult<Ref<'_, OptRc<JavaClass_NameAndTypeCpInfo>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name_and_type_as_info.get() {
            return Ok(self.name_and_type_as_info.borrow());
        }
        *self.name_and_type_as_info.borrow_mut() = Into::<OptRc<JavaClass_NameAndTypeCpInfo>>::into(&*_r.constant_pool()[((*self.name_and_type_index() as u16) - (1 as u16)) as usize].cp_info().as_ref().unwrap()).clone();
        Ok(self.name_and_type_as_info.borrow())
    }
}
impl JavaClass_FieldRefCpInfo {
    pub fn class_index(&self) -> Ref<'_, u16> {
        self.class_index.borrow()
    }
}
impl JavaClass_FieldRefCpInfo {
    pub fn name_and_type_index(&self) -> Ref<'_, u16> {
        self.name_and_type_index.borrow()
    }
}
impl JavaClass_FieldRefCpInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.5 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_FloatCpInfo {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass_ConstantPoolEntry>,
    pub _self: SharedType<Self>,
    value: RefCell<f32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for JavaClass_FloatCpInfo {
    type Root = JavaClass;
    type Parent = JavaClass_ConstantPoolEntry;

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
        *self_rc.value.borrow_mut() = _io.read_f4be()?.into();
        Ok(())
    }
}
impl JavaClass_FloatCpInfo {
}
impl JavaClass_FloatCpInfo {
    pub fn value(&self) -> Ref<'_, f32> {
        self.value.borrow()
    }
}
impl JavaClass_FloatCpInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.4 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_IntegerCpInfo {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass_ConstantPoolEntry>,
    pub _self: SharedType<Self>,
    value: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for JavaClass_IntegerCpInfo {
    type Root = JavaClass;
    type Parent = JavaClass_ConstantPoolEntry;

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
        *self_rc.value.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl JavaClass_IntegerCpInfo {
}
impl JavaClass_IntegerCpInfo {
    pub fn value(&self) -> Ref<'_, u32> {
        self.value.borrow()
    }
}
impl JavaClass_IntegerCpInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_InterfaceMethodRefCpInfo {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass_ConstantPoolEntry>,
    pub _self: SharedType<Self>,
    class_index: RefCell<u16>,
    name_and_type_index: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_class_as_info: Cell<bool>,
    class_as_info: RefCell<OptRc<JavaClass_ClassCpInfo>>,
    f_name_and_type_as_info: Cell<bool>,
    name_and_type_as_info: RefCell<OptRc<JavaClass_NameAndTypeCpInfo>>,
}
impl KStruct for JavaClass_InterfaceMethodRefCpInfo {
    type Root = JavaClass;
    type Parent = JavaClass_ConstantPoolEntry;

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
        *self_rc.class_index.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.name_and_type_index.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl JavaClass_InterfaceMethodRefCpInfo {
    pub fn class_as_info(
        &self
    ) -> KResult<Ref<'_, OptRc<JavaClass_ClassCpInfo>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_class_as_info.get() {
            return Ok(self.class_as_info.borrow());
        }
        *self.class_as_info.borrow_mut() = Into::<OptRc<JavaClass_ClassCpInfo>>::into(&*_r.constant_pool()[((*self.class_index() as u16) - (1 as u16)) as usize].cp_info().as_ref().unwrap()).clone();
        Ok(self.class_as_info.borrow())
    }
    pub fn name_and_type_as_info(
        &self
    ) -> KResult<Ref<'_, OptRc<JavaClass_NameAndTypeCpInfo>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name_and_type_as_info.get() {
            return Ok(self.name_and_type_as_info.borrow());
        }
        *self.name_and_type_as_info.borrow_mut() = Into::<OptRc<JavaClass_NameAndTypeCpInfo>>::into(&*_r.constant_pool()[((*self.name_and_type_index() as u16) - (1 as u16)) as usize].cp_info().as_ref().unwrap()).clone();
        Ok(self.name_and_type_as_info.borrow())
    }
}
impl JavaClass_InterfaceMethodRefCpInfo {
    pub fn class_index(&self) -> Ref<'_, u16> {
        self.class_index.borrow()
    }
}
impl JavaClass_InterfaceMethodRefCpInfo {
    pub fn name_and_type_index(&self) -> Ref<'_, u16> {
        self.name_and_type_index.borrow()
    }
}
impl JavaClass_InterfaceMethodRefCpInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.10 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_InvokeDynamicCpInfo {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass_ConstantPoolEntry>,
    pub _self: SharedType<Self>,
    unnamed0: RefCell<OptRc<JavaClass_VersionGuard>>,
    bootstrap_method_attr_index: RefCell<u16>,
    name_and_type_index: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for JavaClass_InvokeDynamicCpInfo {
    type Root = JavaClass;
    type Parent = JavaClass_ConstantPoolEntry;

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
        let f = |t : &mut JavaClass_VersionGuard| Ok(t.set_params((51).try_into().map_err(|_| KError::CastError)?));
        let t = Self::read_into_with_init::<_, JavaClass_VersionGuard>(&*_io, Some(self_rc._root.clone()), None, &f)?.into();
        *self_rc.unnamed0.borrow_mut() = t;
        *self_rc.bootstrap_method_attr_index.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.name_and_type_index.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl JavaClass_InvokeDynamicCpInfo {
}
impl JavaClass_InvokeDynamicCpInfo {
    pub fn unnamed0(&self) -> Ref<'_, OptRc<JavaClass_VersionGuard>> {
        self.unnamed0.borrow()
    }
}
impl JavaClass_InvokeDynamicCpInfo {
    pub fn bootstrap_method_attr_index(&self) -> Ref<'_, u16> {
        self.bootstrap_method_attr_index.borrow()
    }
}
impl JavaClass_InvokeDynamicCpInfo {
    pub fn name_and_type_index(&self) -> Ref<'_, u16> {
        self.name_and_type_index.borrow()
    }
}
impl JavaClass_InvokeDynamicCpInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.5 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_LongCpInfo {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass_ConstantPoolEntry>,
    pub _self: SharedType<Self>,
    value: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for JavaClass_LongCpInfo {
    type Root = JavaClass;
    type Parent = JavaClass_ConstantPoolEntry;

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
        *self_rc.value.borrow_mut() = _io.read_u8be()?.into();
        Ok(())
    }
}
impl JavaClass_LongCpInfo {
}
impl JavaClass_LongCpInfo {
    pub fn value(&self) -> Ref<'_, u64> {
        self.value.borrow()
    }
}
impl JavaClass_LongCpInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.8 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_MethodHandleCpInfo {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass_ConstantPoolEntry>,
    pub _self: SharedType<Self>,
    unnamed0: RefCell<OptRc<JavaClass_VersionGuard>>,
    reference_kind: RefCell<JavaClass_MethodHandleCpInfo_ReferenceKindEnum>,
    reference_index: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for JavaClass_MethodHandleCpInfo {
    type Root = JavaClass;
    type Parent = JavaClass_ConstantPoolEntry;

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
        let f = |t : &mut JavaClass_VersionGuard| Ok(t.set_params((51).try_into().map_err(|_| KError::CastError)?));
        let t = Self::read_into_with_init::<_, JavaClass_VersionGuard>(&*_io, Some(self_rc._root.clone()), None, &f)?.into();
        *self_rc.unnamed0.borrow_mut() = t;
        *self_rc.reference_kind.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.reference_index.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl JavaClass_MethodHandleCpInfo {
}
impl JavaClass_MethodHandleCpInfo {
    pub fn unnamed0(&self) -> Ref<'_, OptRc<JavaClass_VersionGuard>> {
        self.unnamed0.borrow()
    }
}
impl JavaClass_MethodHandleCpInfo {
    pub fn reference_kind(&self) -> Ref<'_, JavaClass_MethodHandleCpInfo_ReferenceKindEnum> {
        self.reference_kind.borrow()
    }
}
impl JavaClass_MethodHandleCpInfo {
    pub fn reference_index(&self) -> Ref<'_, u16> {
        self.reference_index.borrow()
    }
}
impl JavaClass_MethodHandleCpInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum JavaClass_MethodHandleCpInfo_ReferenceKindEnum {
    GetField,
    GetStatic,
    PutField,
    PutStatic,
    InvokeVirtual,
    InvokeStatic,
    InvokeSpecial,
    NewInvokeSpecial,
    InvokeInterface,
    Unknown(i64),
}

impl TryFrom<i64> for JavaClass_MethodHandleCpInfo_ReferenceKindEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<JavaClass_MethodHandleCpInfo_ReferenceKindEnum> {
        match flag {
            1 => Ok(JavaClass_MethodHandleCpInfo_ReferenceKindEnum::GetField),
            2 => Ok(JavaClass_MethodHandleCpInfo_ReferenceKindEnum::GetStatic),
            3 => Ok(JavaClass_MethodHandleCpInfo_ReferenceKindEnum::PutField),
            4 => Ok(JavaClass_MethodHandleCpInfo_ReferenceKindEnum::PutStatic),
            5 => Ok(JavaClass_MethodHandleCpInfo_ReferenceKindEnum::InvokeVirtual),
            6 => Ok(JavaClass_MethodHandleCpInfo_ReferenceKindEnum::InvokeStatic),
            7 => Ok(JavaClass_MethodHandleCpInfo_ReferenceKindEnum::InvokeSpecial),
            8 => Ok(JavaClass_MethodHandleCpInfo_ReferenceKindEnum::NewInvokeSpecial),
            9 => Ok(JavaClass_MethodHandleCpInfo_ReferenceKindEnum::InvokeInterface),
            _ => Ok(JavaClass_MethodHandleCpInfo_ReferenceKindEnum::Unknown(flag)),
        }
    }
}

impl From<&JavaClass_MethodHandleCpInfo_ReferenceKindEnum> for i64 {
    fn from(v: &JavaClass_MethodHandleCpInfo_ReferenceKindEnum) -> Self {
        match *v {
            JavaClass_MethodHandleCpInfo_ReferenceKindEnum::GetField => 1,
            JavaClass_MethodHandleCpInfo_ReferenceKindEnum::GetStatic => 2,
            JavaClass_MethodHandleCpInfo_ReferenceKindEnum::PutField => 3,
            JavaClass_MethodHandleCpInfo_ReferenceKindEnum::PutStatic => 4,
            JavaClass_MethodHandleCpInfo_ReferenceKindEnum::InvokeVirtual => 5,
            JavaClass_MethodHandleCpInfo_ReferenceKindEnum::InvokeStatic => 6,
            JavaClass_MethodHandleCpInfo_ReferenceKindEnum::InvokeSpecial => 7,
            JavaClass_MethodHandleCpInfo_ReferenceKindEnum::NewInvokeSpecial => 8,
            JavaClass_MethodHandleCpInfo_ReferenceKindEnum::InvokeInterface => 9,
            JavaClass_MethodHandleCpInfo_ReferenceKindEnum::Unknown(v) => v
        }
    }
}

impl Default for JavaClass_MethodHandleCpInfo_ReferenceKindEnum {
    fn default() -> Self { JavaClass_MethodHandleCpInfo_ReferenceKindEnum::Unknown(0) }
}


/**
 * \sa https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.6 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_MethodInfo {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass>,
    pub _self: SharedType<Self>,
    access_flags: RefCell<u16>,
    name_index: RefCell<u16>,
    descriptor_index: RefCell<u16>,
    attributes_count: RefCell<u16>,
    attributes: RefCell<Vec<OptRc<JavaClass_AttributeInfo>>>,
    _io: RefCell<BytesReader>,
    f_name_as_str: Cell<bool>,
    name_as_str: RefCell<String>,
}
impl KStruct for JavaClass_MethodInfo {
    type Root = JavaClass;
    type Parent = JavaClass;

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
        *self_rc.access_flags.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.name_index.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.descriptor_index.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.attributes_count.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.attributes.borrow_mut() = Vec::new();
        let l_attributes = *self_rc.attributes_count();
        for _i in 0..l_attributes {
            let t = Self::read_into::<_, JavaClass_AttributeInfo>(&*_io, Some(self_rc._root.clone()), None)?.into();
            self_rc.attributes.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl JavaClass_MethodInfo {
    pub fn name_as_str(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name_as_str.get() {
            return Ok(self.name_as_str.borrow());
        }
        self.f_name_as_str.set(true);
        *self.name_as_str.borrow_mut() = Into::<OptRc<JavaClass_Utf8CpInfo>>::into(&*_r.constant_pool()[((*self.name_index() as u16) - (1 as u16)) as usize].cp_info().as_ref().unwrap()).value().to_string();
        Ok(self.name_as_str.borrow())
    }
}
impl JavaClass_MethodInfo {
    pub fn access_flags(&self) -> Ref<'_, u16> {
        self.access_flags.borrow()
    }
}
impl JavaClass_MethodInfo {
    pub fn name_index(&self) -> Ref<'_, u16> {
        self.name_index.borrow()
    }
}
impl JavaClass_MethodInfo {
    pub fn descriptor_index(&self) -> Ref<'_, u16> {
        self.descriptor_index.borrow()
    }
}
impl JavaClass_MethodInfo {
    pub fn attributes_count(&self) -> Ref<'_, u16> {
        self.attributes_count.borrow()
    }
}
impl JavaClass_MethodInfo {
    pub fn attributes(&self) -> Ref<'_, Vec<OptRc<JavaClass_AttributeInfo>>> {
        self.attributes.borrow()
    }
}
impl JavaClass_MethodInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.2 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_MethodRefCpInfo {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass_ConstantPoolEntry>,
    pub _self: SharedType<Self>,
    class_index: RefCell<u16>,
    name_and_type_index: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_class_as_info: Cell<bool>,
    class_as_info: RefCell<OptRc<JavaClass_ClassCpInfo>>,
    f_name_and_type_as_info: Cell<bool>,
    name_and_type_as_info: RefCell<OptRc<JavaClass_NameAndTypeCpInfo>>,
}
impl KStruct for JavaClass_MethodRefCpInfo {
    type Root = JavaClass;
    type Parent = JavaClass_ConstantPoolEntry;

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
        *self_rc.class_index.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.name_and_type_index.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl JavaClass_MethodRefCpInfo {
    pub fn class_as_info(
        &self
    ) -> KResult<Ref<'_, OptRc<JavaClass_ClassCpInfo>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_class_as_info.get() {
            return Ok(self.class_as_info.borrow());
        }
        *self.class_as_info.borrow_mut() = Into::<OptRc<JavaClass_ClassCpInfo>>::into(&*_r.constant_pool()[((*self.class_index() as u16) - (1 as u16)) as usize].cp_info().as_ref().unwrap()).clone();
        Ok(self.class_as_info.borrow())
    }
    pub fn name_and_type_as_info(
        &self
    ) -> KResult<Ref<'_, OptRc<JavaClass_NameAndTypeCpInfo>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name_and_type_as_info.get() {
            return Ok(self.name_and_type_as_info.borrow());
        }
        *self.name_and_type_as_info.borrow_mut() = Into::<OptRc<JavaClass_NameAndTypeCpInfo>>::into(&*_r.constant_pool()[((*self.name_and_type_index() as u16) - (1 as u16)) as usize].cp_info().as_ref().unwrap()).clone();
        Ok(self.name_and_type_as_info.borrow())
    }
}
impl JavaClass_MethodRefCpInfo {
    pub fn class_index(&self) -> Ref<'_, u16> {
        self.class_index.borrow()
    }
}
impl JavaClass_MethodRefCpInfo {
    pub fn name_and_type_index(&self) -> Ref<'_, u16> {
        self.name_and_type_index.borrow()
    }
}
impl JavaClass_MethodRefCpInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.9 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_MethodTypeCpInfo {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass_ConstantPoolEntry>,
    pub _self: SharedType<Self>,
    unnamed0: RefCell<OptRc<JavaClass_VersionGuard>>,
    descriptor_index: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for JavaClass_MethodTypeCpInfo {
    type Root = JavaClass;
    type Parent = JavaClass_ConstantPoolEntry;

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
        let f = |t : &mut JavaClass_VersionGuard| Ok(t.set_params((51).try_into().map_err(|_| KError::CastError)?));
        let t = Self::read_into_with_init::<_, JavaClass_VersionGuard>(&*_io, Some(self_rc._root.clone()), None, &f)?.into();
        *self_rc.unnamed0.borrow_mut() = t;
        *self_rc.descriptor_index.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl JavaClass_MethodTypeCpInfo {
}
impl JavaClass_MethodTypeCpInfo {
    pub fn unnamed0(&self) -> Ref<'_, OptRc<JavaClass_VersionGuard>> {
        self.unnamed0.borrow()
    }
}
impl JavaClass_MethodTypeCpInfo {
    pub fn descriptor_index(&self) -> Ref<'_, u16> {
        self.descriptor_index.borrow()
    }
}
impl JavaClass_MethodTypeCpInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Project Jigsaw modules introduced in Java 9
 * \sa https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-3.html#jvms-3.16 Source
 * \sa https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-4.html#jvms-4.4.11 Source
 * \sa https://docs.oracle.com/javase/specs/jvms/se19/html/jvms-4.html#jvms-4.4.12 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_ModulePackageCpInfo {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass_ConstantPoolEntry>,
    pub _self: SharedType<Self>,
    unnamed0: RefCell<OptRc<JavaClass_VersionGuard>>,
    name_index: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_name_as_info: Cell<bool>,
    name_as_info: RefCell<OptRc<JavaClass_Utf8CpInfo>>,
    f_name_as_str: Cell<bool>,
    name_as_str: RefCell<String>,
}
impl KStruct for JavaClass_ModulePackageCpInfo {
    type Root = JavaClass;
    type Parent = JavaClass_ConstantPoolEntry;

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
        let f = |t : &mut JavaClass_VersionGuard| Ok(t.set_params((53).try_into().map_err(|_| KError::CastError)?));
        let t = Self::read_into_with_init::<_, JavaClass_VersionGuard>(&*_io, Some(self_rc._root.clone()), None, &f)?.into();
        *self_rc.unnamed0.borrow_mut() = t;
        *self_rc.name_index.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl JavaClass_ModulePackageCpInfo {
    pub fn name_as_info(
        &self
    ) -> KResult<Ref<'_, OptRc<JavaClass_Utf8CpInfo>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name_as_info.get() {
            return Ok(self.name_as_info.borrow());
        }
        *self.name_as_info.borrow_mut() = Into::<OptRc<JavaClass_Utf8CpInfo>>::into(&*_r.constant_pool()[((*self.name_index() as u16) - (1 as u16)) as usize].cp_info().as_ref().unwrap()).clone();
        Ok(self.name_as_info.borrow())
    }
    pub fn name_as_str(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name_as_str.get() {
            return Ok(self.name_as_str.borrow());
        }
        self.f_name_as_str.set(true);
        *self.name_as_str.borrow_mut() = self.name_as_info()?.value().to_string();
        Ok(self.name_as_str.borrow())
    }
}
impl JavaClass_ModulePackageCpInfo {
    pub fn unnamed0(&self) -> Ref<'_, OptRc<JavaClass_VersionGuard>> {
        self.unnamed0.borrow()
    }
}
impl JavaClass_ModulePackageCpInfo {
    pub fn name_index(&self) -> Ref<'_, u16> {
        self.name_index.borrow()
    }
}
impl JavaClass_ModulePackageCpInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.6 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_NameAndTypeCpInfo {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass_ConstantPoolEntry>,
    pub _self: SharedType<Self>,
    name_index: RefCell<u16>,
    descriptor_index: RefCell<u16>,
    _io: RefCell<BytesReader>,
    f_descriptor_as_info: Cell<bool>,
    descriptor_as_info: RefCell<OptRc<JavaClass_Utf8CpInfo>>,
    f_descriptor_as_str: Cell<bool>,
    descriptor_as_str: RefCell<String>,
    f_name_as_info: Cell<bool>,
    name_as_info: RefCell<OptRc<JavaClass_Utf8CpInfo>>,
    f_name_as_str: Cell<bool>,
    name_as_str: RefCell<String>,
}
impl KStruct for JavaClass_NameAndTypeCpInfo {
    type Root = JavaClass;
    type Parent = JavaClass_ConstantPoolEntry;

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
        *self_rc.name_index.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.descriptor_index.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl JavaClass_NameAndTypeCpInfo {
    pub fn descriptor_as_info(
        &self
    ) -> KResult<Ref<'_, OptRc<JavaClass_Utf8CpInfo>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_descriptor_as_info.get() {
            return Ok(self.descriptor_as_info.borrow());
        }
        *self.descriptor_as_info.borrow_mut() = Into::<OptRc<JavaClass_Utf8CpInfo>>::into(&*_r.constant_pool()[((*self.descriptor_index() as u16) - (1 as u16)) as usize].cp_info().as_ref().unwrap()).clone();
        Ok(self.descriptor_as_info.borrow())
    }
    pub fn descriptor_as_str(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_descriptor_as_str.get() {
            return Ok(self.descriptor_as_str.borrow());
        }
        self.f_descriptor_as_str.set(true);
        *self.descriptor_as_str.borrow_mut() = self.descriptor_as_info()?.value().to_string();
        Ok(self.descriptor_as_str.borrow())
    }
    pub fn name_as_info(
        &self
    ) -> KResult<Ref<'_, OptRc<JavaClass_Utf8CpInfo>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name_as_info.get() {
            return Ok(self.name_as_info.borrow());
        }
        *self.name_as_info.borrow_mut() = Into::<OptRc<JavaClass_Utf8CpInfo>>::into(&*_r.constant_pool()[((*self.name_index() as u16) - (1 as u16)) as usize].cp_info().as_ref().unwrap()).clone();
        Ok(self.name_as_info.borrow())
    }
    pub fn name_as_str(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name_as_str.get() {
            return Ok(self.name_as_str.borrow());
        }
        self.f_name_as_str.set(true);
        *self.name_as_str.borrow_mut() = self.name_as_info()?.value().to_string();
        Ok(self.name_as_str.borrow())
    }
}
impl JavaClass_NameAndTypeCpInfo {
    pub fn name_index(&self) -> Ref<'_, u16> {
        self.name_index.borrow()
    }
}
impl JavaClass_NameAndTypeCpInfo {
    pub fn descriptor_index(&self) -> Ref<'_, u16> {
        self.descriptor_index.borrow()
    }
}
impl JavaClass_NameAndTypeCpInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.3 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_StringCpInfo {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass_ConstantPoolEntry>,
    pub _self: SharedType<Self>,
    string_index: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for JavaClass_StringCpInfo {
    type Root = JavaClass;
    type Parent = JavaClass_ConstantPoolEntry;

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
        *self_rc.string_index.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl JavaClass_StringCpInfo {
}
impl JavaClass_StringCpInfo {
    pub fn string_index(&self) -> Ref<'_, u16> {
        self.string_index.borrow()
    }
}
impl JavaClass_StringCpInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html#jvms-4.4.7 Source
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_Utf8CpInfo {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<JavaClass_ConstantPoolEntry>,
    pub _self: SharedType<Self>,
    str_len: RefCell<u16>,
    value: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for JavaClass_Utf8CpInfo {
    type Root = JavaClass;
    type Parent = JavaClass_ConstantPoolEntry;

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
        *self_rc.str_len.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.value.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.str_len() as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl JavaClass_Utf8CpInfo {
}
impl JavaClass_Utf8CpInfo {
    pub fn str_len(&self) -> Ref<'_, u16> {
        self.str_len.borrow()
    }
}
impl JavaClass_Utf8CpInfo {
    pub fn value(&self) -> Ref<'_, String> {
        self.value.borrow()
    }
}
impl JavaClass_Utf8CpInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * `class` file format version 45.3 (appeared in the very first publicly
 * known release of Java SE AND JDK 1.0.2, released 23th January 1996) is so
 * ancient that it's taken for granted. Earlier formats seem to be
 * undocumented. Changes of `version_minor` don't change `class` format.
 * Earlier `version_major`s likely belong to Oak programming language, the
 * proprietary predecessor of Java.
 * \sa James Gosling, Bill Joy and Guy Steele. The Java Language Specification. English. Ed. by Lisa Friendly. Addison-Wesley, Aug. 1996, p. 825. ISBN: 0-201-63451-1.
 * \sa Frank Yellin and Tim Lindholm. The Java Virtual Machine Specification. English. Ed. by Lisa Friendly. Addison-Wesley, Sept. 1996, p. 475. ISBN: 0-201-63452-X.
 */

#[derive(Default, Debug, Clone)]
pub struct JavaClass_VersionGuard {
    pub _root: SharedType<JavaClass>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    major: RefCell<u16>,
    unnamed0: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for JavaClass_VersionGuard {
    type Root = JavaClass;
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
        *self_rc.unnamed0.borrow_mut() = _io.read_bytes(0 as usize)?.into();
        let _tmpa = *self_rc.unnamed0();
        if !(((*_r.version_major() as i32) >= (*self_rc.major() as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/version_guard/seq/0".to_string() }));
        }
        Ok(())
    }
}
impl JavaClass_VersionGuard {
    pub fn major(&self) -> Ref<'_, u16> {
        self.major.borrow()
    }
}
impl JavaClass_VersionGuard {
    pub fn set_params(&mut self, major: u16) {
        *self.major.borrow_mut() = major;
    }
}
impl JavaClass_VersionGuard {
}
impl JavaClass_VersionGuard {
    pub fn unnamed0(&self) -> Ref<'_, Vec<u8>> {
        self.unnamed0.borrow()
    }
}
impl JavaClass_VersionGuard {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

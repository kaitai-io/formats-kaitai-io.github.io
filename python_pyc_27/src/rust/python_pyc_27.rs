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
 * Python interpreter runs .py files in 2 step process: first, it
 * produces bytecode, which it then executes. Translation of .py source
 * into bytecode is time-consuming, so Python dumps compiled bytecode
 * into .pyc files, to be reused from cache at later time if possible.
 * 
 * .pyc file is essentially a raw dump of `py_object` (see `body`) with
 * a simple header prepended.
 */

#[derive(Default, Debug, Clone)]
pub struct PythonPyc27 {
    pub _root: SharedType<PythonPyc27>,
    pub _parent: SharedType<PythonPyc27>,
    pub _self: SharedType<Self>,
    version_magic: RefCell<PythonPyc27_Version>,
    crlf: RefCell<u16>,
    modification_timestamp: RefCell<u32>,
    body: RefCell<OptRc<PythonPyc27_PyObject>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPyc27 {
    type Root = PythonPyc27;
    type Parent = PythonPyc27;

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
        *self_rc.version_magic.borrow_mut() = (_io.read_u2le()? as i64).try_into()?;
        *self_rc.crlf.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.modification_timestamp.borrow_mut() = _io.read_u4le()?.into();
        let t = Self::read_into::<_, PythonPyc27_PyObject>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.body.borrow_mut() = t;
        Ok(())
    }
}
impl PythonPyc27 {
}
impl PythonPyc27 {
    pub fn version_magic(&self) -> Ref<'_, PythonPyc27_Version> {
        self.version_magic.borrow()
    }
}
impl PythonPyc27 {
    pub fn crlf(&self) -> Ref<'_, u16> {
        self.crlf.borrow()
    }
}
impl PythonPyc27 {
    pub fn modification_timestamp(&self) -> Ref<'_, u32> {
        self.modification_timestamp.borrow()
    }
}
impl PythonPyc27 {
    pub fn body(&self) -> Ref<'_, OptRc<PythonPyc27_PyObject>> {
        self.body.borrow()
    }
}
impl PythonPyc27 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum PythonPyc27_Version {
    V15,
    V16,
    V20,
    V21,
    V22,
    V23A0,
    V23A0b,
    V24A0,
    V24A3,
    V24B1,
    V25A0,
    V25A0b,
    V25A0c,
    V25A0d,
    V25B3,
    V25B3b,
    V25C1,
    V25C2,
    V26A0,
    V26A1,
    V27A0,
    V27A0b,
    V27A0c,
    V27A0d,
    V27A0e,
    Unknown(i64),
}

impl TryFrom<i64> for PythonPyc27_Version {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<PythonPyc27_Version> {
        match flag {
            20121 => Ok(PythonPyc27_Version::V15),
            50428 => Ok(PythonPyc27_Version::V16),
            50823 => Ok(PythonPyc27_Version::V20),
            60202 => Ok(PythonPyc27_Version::V21),
            60717 => Ok(PythonPyc27_Version::V22),
            62011 => Ok(PythonPyc27_Version::V23A0),
            62021 => Ok(PythonPyc27_Version::V23A0b),
            62041 => Ok(PythonPyc27_Version::V24A0),
            62051 => Ok(PythonPyc27_Version::V24A3),
            62061 => Ok(PythonPyc27_Version::V24B1),
            62071 => Ok(PythonPyc27_Version::V25A0),
            62081 => Ok(PythonPyc27_Version::V25A0b),
            62091 => Ok(PythonPyc27_Version::V25A0c),
            62092 => Ok(PythonPyc27_Version::V25A0d),
            62101 => Ok(PythonPyc27_Version::V25B3),
            62111 => Ok(PythonPyc27_Version::V25B3b),
            62121 => Ok(PythonPyc27_Version::V25C1),
            62131 => Ok(PythonPyc27_Version::V25C2),
            62151 => Ok(PythonPyc27_Version::V26A0),
            62161 => Ok(PythonPyc27_Version::V26A1),
            62171 => Ok(PythonPyc27_Version::V27A0),
            62181 => Ok(PythonPyc27_Version::V27A0b),
            62191 => Ok(PythonPyc27_Version::V27A0c),
            62201 => Ok(PythonPyc27_Version::V27A0d),
            62211 => Ok(PythonPyc27_Version::V27A0e),
            _ => Ok(PythonPyc27_Version::Unknown(flag)),
        }
    }
}

impl From<&PythonPyc27_Version> for i64 {
    fn from(v: &PythonPyc27_Version) -> Self {
        match *v {
            PythonPyc27_Version::V15 => 20121,
            PythonPyc27_Version::V16 => 50428,
            PythonPyc27_Version::V20 => 50823,
            PythonPyc27_Version::V21 => 60202,
            PythonPyc27_Version::V22 => 60717,
            PythonPyc27_Version::V23A0 => 62011,
            PythonPyc27_Version::V23A0b => 62021,
            PythonPyc27_Version::V24A0 => 62041,
            PythonPyc27_Version::V24A3 => 62051,
            PythonPyc27_Version::V24B1 => 62061,
            PythonPyc27_Version::V25A0 => 62071,
            PythonPyc27_Version::V25A0b => 62081,
            PythonPyc27_Version::V25A0c => 62091,
            PythonPyc27_Version::V25A0d => 62092,
            PythonPyc27_Version::V25B3 => 62101,
            PythonPyc27_Version::V25B3b => 62111,
            PythonPyc27_Version::V25C1 => 62121,
            PythonPyc27_Version::V25C2 => 62131,
            PythonPyc27_Version::V26A0 => 62151,
            PythonPyc27_Version::V26A1 => 62161,
            PythonPyc27_Version::V27A0 => 62171,
            PythonPyc27_Version::V27A0b => 62181,
            PythonPyc27_Version::V27A0c => 62191,
            PythonPyc27_Version::V27A0d => 62201,
            PythonPyc27_Version::V27A0e => 62211,
            PythonPyc27_Version::Unknown(v) => v
        }
    }
}

impl Default for PythonPyc27_Version {
    fn default() -> Self { PythonPyc27_Version::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct PythonPyc27_Assembly {
    pub _root: SharedType<PythonPyc27>,
    pub _parent: SharedType<PythonPyc27_CodeObject>,
    pub _self: SharedType<Self>,
    string_magic: RefCell<Vec<u8>>,
    length: RefCell<u32>,
    items: RefCell<OptRc<PythonPyc27_OpArgs>>,
    _io: RefCell<BytesReader>,
    items_raw: RefCell<Vec<u8>>,
}
impl KStruct for PythonPyc27_Assembly {
    type Root = PythonPyc27;
    type Parent = PythonPyc27_CodeObject;

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
        *self_rc.string_magic.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.string_magic() == vec![0x73u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/assembly/seq/0".to_string() }));
        }
        *self_rc.length.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.items_raw.borrow_mut() = _io.read_bytes(*self_rc.length() as usize)?.into();
        let items_raw = self_rc.items_raw.borrow();
        let _t_items_raw_io = BytesReader::from(items_raw.clone());
        let t = Self::read_into::<BytesReader, PythonPyc27_OpArgs>(&_t_items_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.items.borrow_mut() = t;
        Ok(())
    }
}
impl PythonPyc27_Assembly {
}
impl PythonPyc27_Assembly {
    pub fn string_magic(&self) -> Ref<'_, Vec<u8>> {
        self.string_magic.borrow()
    }
}
impl PythonPyc27_Assembly {
    pub fn length(&self) -> Ref<'_, u32> {
        self.length.borrow()
    }
}
impl PythonPyc27_Assembly {
    pub fn items(&self) -> Ref<'_, OptRc<PythonPyc27_OpArgs>> {
        self.items.borrow()
    }
}
impl PythonPyc27_Assembly {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl PythonPyc27_Assembly {
    pub fn items_raw(&self) -> Ref<'_, Vec<u8>> {
        self.items_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct PythonPyc27_CodeObject {
    pub _root: SharedType<PythonPyc27>,
    pub _parent: SharedType<PythonPyc27_PyObject>,
    pub _self: SharedType<Self>,
    arg_count: RefCell<u32>,
    local_count: RefCell<u32>,
    stack_size: RefCell<u32>,
    flags: RefCell<PythonPyc27_CodeObject_FlagsEnum>,
    code: RefCell<OptRc<PythonPyc27_Assembly>>,
    consts: RefCell<OptRc<PythonPyc27_PyObject>>,
    names: RefCell<OptRc<PythonPyc27_PyObject>>,
    var_names: RefCell<OptRc<PythonPyc27_PyObject>>,
    free_vars: RefCell<OptRc<PythonPyc27_PyObject>>,
    cell_vars: RefCell<OptRc<PythonPyc27_PyObject>>,
    filename: RefCell<OptRc<PythonPyc27_PyObject>>,
    name: RefCell<OptRc<PythonPyc27_PyObject>>,
    first_line_no: RefCell<u32>,
    lnotab: RefCell<OptRc<PythonPyc27_PyObject>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPyc27_CodeObject {
    type Root = PythonPyc27;
    type Parent = PythonPyc27_PyObject;

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
        *self_rc.arg_count.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.local_count.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.stack_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.flags.borrow_mut() = (_io.read_u4le()? as i64).try_into()?;
        let t = Self::read_into::<_, PythonPyc27_Assembly>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.code.borrow_mut() = t;
        let t = Self::read_into::<_, PythonPyc27_PyObject>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.consts.borrow_mut() = t;
        let t = Self::read_into::<_, PythonPyc27_PyObject>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.names.borrow_mut() = t;
        let t = Self::read_into::<_, PythonPyc27_PyObject>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.var_names.borrow_mut() = t;
        let t = Self::read_into::<_, PythonPyc27_PyObject>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.free_vars.borrow_mut() = t;
        let t = Self::read_into::<_, PythonPyc27_PyObject>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.cell_vars.borrow_mut() = t;
        let t = Self::read_into::<_, PythonPyc27_PyObject>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.filename.borrow_mut() = t;
        let t = Self::read_into::<_, PythonPyc27_PyObject>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.name.borrow_mut() = t;
        *self_rc.first_line_no.borrow_mut() = _io.read_u4le()?.into();
        let t = Self::read_into::<_, PythonPyc27_PyObject>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.lnotab.borrow_mut() = t;
        Ok(())
    }
}
impl PythonPyc27_CodeObject {
}
impl PythonPyc27_CodeObject {
    pub fn arg_count(&self) -> Ref<'_, u32> {
        self.arg_count.borrow()
    }
}
impl PythonPyc27_CodeObject {
    pub fn local_count(&self) -> Ref<'_, u32> {
        self.local_count.borrow()
    }
}
impl PythonPyc27_CodeObject {
    pub fn stack_size(&self) -> Ref<'_, u32> {
        self.stack_size.borrow()
    }
}
impl PythonPyc27_CodeObject {
    pub fn flags(&self) -> Ref<'_, PythonPyc27_CodeObject_FlagsEnum> {
        self.flags.borrow()
    }
}
impl PythonPyc27_CodeObject {
    pub fn code(&self) -> Ref<'_, OptRc<PythonPyc27_Assembly>> {
        self.code.borrow()
    }
}
impl PythonPyc27_CodeObject {
    pub fn consts(&self) -> Ref<'_, OptRc<PythonPyc27_PyObject>> {
        self.consts.borrow()
    }
}
impl PythonPyc27_CodeObject {
    pub fn names(&self) -> Ref<'_, OptRc<PythonPyc27_PyObject>> {
        self.names.borrow()
    }
}
impl PythonPyc27_CodeObject {
    pub fn var_names(&self) -> Ref<'_, OptRc<PythonPyc27_PyObject>> {
        self.var_names.borrow()
    }
}
impl PythonPyc27_CodeObject {
    pub fn free_vars(&self) -> Ref<'_, OptRc<PythonPyc27_PyObject>> {
        self.free_vars.borrow()
    }
}
impl PythonPyc27_CodeObject {
    pub fn cell_vars(&self) -> Ref<'_, OptRc<PythonPyc27_PyObject>> {
        self.cell_vars.borrow()
    }
}
impl PythonPyc27_CodeObject {
    pub fn filename(&self) -> Ref<'_, OptRc<PythonPyc27_PyObject>> {
        self.filename.borrow()
    }
}
impl PythonPyc27_CodeObject {
    pub fn name(&self) -> Ref<'_, OptRc<PythonPyc27_PyObject>> {
        self.name.borrow()
    }
}
impl PythonPyc27_CodeObject {
    pub fn first_line_no(&self) -> Ref<'_, u32> {
        self.first_line_no.borrow()
    }
}
impl PythonPyc27_CodeObject {
    pub fn lnotab(&self) -> Ref<'_, OptRc<PythonPyc27_PyObject>> {
        self.lnotab.borrow()
    }
}
impl PythonPyc27_CodeObject {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum PythonPyc27_CodeObject_FlagsEnum {
    HasArgs,
    HasKwargs,
    Generator,
    Unknown(i64),
}

impl TryFrom<i64> for PythonPyc27_CodeObject_FlagsEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<PythonPyc27_CodeObject_FlagsEnum> {
        match flag {
            4 => Ok(PythonPyc27_CodeObject_FlagsEnum::HasArgs),
            8 => Ok(PythonPyc27_CodeObject_FlagsEnum::HasKwargs),
            32 => Ok(PythonPyc27_CodeObject_FlagsEnum::Generator),
            _ => Ok(PythonPyc27_CodeObject_FlagsEnum::Unknown(flag)),
        }
    }
}

impl From<&PythonPyc27_CodeObject_FlagsEnum> for i64 {
    fn from(v: &PythonPyc27_CodeObject_FlagsEnum) -> Self {
        match *v {
            PythonPyc27_CodeObject_FlagsEnum::HasArgs => 4,
            PythonPyc27_CodeObject_FlagsEnum::HasKwargs => 8,
            PythonPyc27_CodeObject_FlagsEnum::Generator => 32,
            PythonPyc27_CodeObject_FlagsEnum::Unknown(v) => v
        }
    }
}

impl Default for PythonPyc27_CodeObject_FlagsEnum {
    fn default() -> Self { PythonPyc27_CodeObject_FlagsEnum::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct PythonPyc27_OpArg {
    pub _root: SharedType<PythonPyc27>,
    pub _parent: SharedType<PythonPyc27_OpArgs>,
    pub _self: SharedType<Self>,
    op_code: RefCell<PythonPyc27_OpArg_OpCodeEnum>,
    arg: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPyc27_OpArg {
    type Root = PythonPyc27;
    type Parent = PythonPyc27_OpArgs;

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
        *self_rc.op_code.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        if i64::from(&*self_rc.op_code()) >= i64::from(&PythonPyc27_OpArg_OpCodeEnum::StoreName) {
            *self_rc.arg.borrow_mut() = _io.read_u2le()?.into();
        }
        Ok(())
    }
}
impl PythonPyc27_OpArg {
}
impl PythonPyc27_OpArg {
    pub fn op_code(&self) -> Ref<'_, PythonPyc27_OpArg_OpCodeEnum> {
        self.op_code.borrow()
    }
}
impl PythonPyc27_OpArg {
    pub fn arg(&self) -> Ref<'_, u16> {
        self.arg.borrow()
    }
}
impl PythonPyc27_OpArg {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum PythonPyc27_OpArg_OpCodeEnum {
    StopCode,
    PopTop,
    RotTwo,
    RotThree,
    DupTop,
    RotFour,
    Nop,
    UnaryPositive,
    UnaryNegative,
    UnaryNot,
    UnaryConvert,
    UnaryInvert,
    BinaryPower,
    BinaryMultiply,
    BinaryDivide,
    BinaryModulo,
    BinaryAdd,
    BinarySubtract,
    BinarySubscr,
    BinaryFloorDivide,
    BinaryTrueDivide,
    InplaceFloorDivide,
    InplaceTrueDivide,
    Slice0,
    Slice1,
    Slice2,
    Slice3,
    StoreSlice0,
    StoreSlice1,
    StoreSlice2,
    StoreSlice3,
    DeleteSlice0,
    DeleteSlice1,
    DeleteSlice2,
    DeleteSlice3,
    StoreMap,
    InplaceAdd,
    InplaceSubtract,
    InplaceMultiply,
    InplaceDivide,
    InplaceModulo,
    StoreSubscr,
    DeleteSubscr,
    BinaryLshift,
    BinaryRshift,
    BinaryAnd,
    BinaryXor,
    BinaryOr,
    InplacePower,
    GetIter,
    PrintExpr,
    PrintItem,
    PrintNewline,
    PrintItemTo,
    PrintNewlineTo,
    InplaceLshift,
    InplaceRshift,
    InplaceAnd,
    InplaceXor,
    InplaceOr,
    BreakLoop,
    WithCleanup,
    LoadLocals,
    ReturnValue,
    ImportStar,
    ExecStmt,
    YieldValue,
    PopBlock,
    EndFinally,
    BuildClass,
    StoreName,
    DeleteName,
    UnpackSequence,
    ForIter,
    ListAppend,
    StoreAttr,
    DeleteAttr,
    StoreGlobal,
    DeleteGlobal,
    DupTopx,
    LoadConst,
    LoadName,
    BuildTuple,
    BuildList,
    BuildSet,
    BuildMap,
    LoadAttr,
    CompareOp,
    ImportName,
    ImportFrom,
    JumpForward,
    JumpIfFalseOrPop,
    JumpIfTrueOrPop,
    JumpAbsolute,
    PopJumpIfFalse,
    PopJumpIfTrue,
    LoadGlobal,
    ContinueLoop,
    SetupLoop,
    SetupExcept,
    SetupFinally,
    LoadFast,
    StoreFast,
    DeleteFast,
    RaiseVarargs,
    CallFunction,
    MakeFunction,
    BuildSlice,
    MakeClosure,
    LoadClosure,
    LoadDeref,
    StoreDeref,
    CallFunctionVar,
    CallFunctionKw,
    CallFunctionVarKw,
    SetupWith,
    ExtendedArg,
    SetAdd,
    MapAdd,
    Unknown(i64),
}

impl TryFrom<i64> for PythonPyc27_OpArg_OpCodeEnum {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<PythonPyc27_OpArg_OpCodeEnum> {
        match flag {
            0 => Ok(PythonPyc27_OpArg_OpCodeEnum::StopCode),
            1 => Ok(PythonPyc27_OpArg_OpCodeEnum::PopTop),
            2 => Ok(PythonPyc27_OpArg_OpCodeEnum::RotTwo),
            3 => Ok(PythonPyc27_OpArg_OpCodeEnum::RotThree),
            4 => Ok(PythonPyc27_OpArg_OpCodeEnum::DupTop),
            5 => Ok(PythonPyc27_OpArg_OpCodeEnum::RotFour),
            9 => Ok(PythonPyc27_OpArg_OpCodeEnum::Nop),
            10 => Ok(PythonPyc27_OpArg_OpCodeEnum::UnaryPositive),
            11 => Ok(PythonPyc27_OpArg_OpCodeEnum::UnaryNegative),
            12 => Ok(PythonPyc27_OpArg_OpCodeEnum::UnaryNot),
            13 => Ok(PythonPyc27_OpArg_OpCodeEnum::UnaryConvert),
            15 => Ok(PythonPyc27_OpArg_OpCodeEnum::UnaryInvert),
            19 => Ok(PythonPyc27_OpArg_OpCodeEnum::BinaryPower),
            20 => Ok(PythonPyc27_OpArg_OpCodeEnum::BinaryMultiply),
            21 => Ok(PythonPyc27_OpArg_OpCodeEnum::BinaryDivide),
            22 => Ok(PythonPyc27_OpArg_OpCodeEnum::BinaryModulo),
            23 => Ok(PythonPyc27_OpArg_OpCodeEnum::BinaryAdd),
            24 => Ok(PythonPyc27_OpArg_OpCodeEnum::BinarySubtract),
            25 => Ok(PythonPyc27_OpArg_OpCodeEnum::BinarySubscr),
            26 => Ok(PythonPyc27_OpArg_OpCodeEnum::BinaryFloorDivide),
            27 => Ok(PythonPyc27_OpArg_OpCodeEnum::BinaryTrueDivide),
            28 => Ok(PythonPyc27_OpArg_OpCodeEnum::InplaceFloorDivide),
            29 => Ok(PythonPyc27_OpArg_OpCodeEnum::InplaceTrueDivide),
            30 => Ok(PythonPyc27_OpArg_OpCodeEnum::Slice0),
            31 => Ok(PythonPyc27_OpArg_OpCodeEnum::Slice1),
            32 => Ok(PythonPyc27_OpArg_OpCodeEnum::Slice2),
            33 => Ok(PythonPyc27_OpArg_OpCodeEnum::Slice3),
            40 => Ok(PythonPyc27_OpArg_OpCodeEnum::StoreSlice0),
            41 => Ok(PythonPyc27_OpArg_OpCodeEnum::StoreSlice1),
            42 => Ok(PythonPyc27_OpArg_OpCodeEnum::StoreSlice2),
            43 => Ok(PythonPyc27_OpArg_OpCodeEnum::StoreSlice3),
            50 => Ok(PythonPyc27_OpArg_OpCodeEnum::DeleteSlice0),
            51 => Ok(PythonPyc27_OpArg_OpCodeEnum::DeleteSlice1),
            52 => Ok(PythonPyc27_OpArg_OpCodeEnum::DeleteSlice2),
            53 => Ok(PythonPyc27_OpArg_OpCodeEnum::DeleteSlice3),
            54 => Ok(PythonPyc27_OpArg_OpCodeEnum::StoreMap),
            55 => Ok(PythonPyc27_OpArg_OpCodeEnum::InplaceAdd),
            56 => Ok(PythonPyc27_OpArg_OpCodeEnum::InplaceSubtract),
            57 => Ok(PythonPyc27_OpArg_OpCodeEnum::InplaceMultiply),
            58 => Ok(PythonPyc27_OpArg_OpCodeEnum::InplaceDivide),
            59 => Ok(PythonPyc27_OpArg_OpCodeEnum::InplaceModulo),
            60 => Ok(PythonPyc27_OpArg_OpCodeEnum::StoreSubscr),
            61 => Ok(PythonPyc27_OpArg_OpCodeEnum::DeleteSubscr),
            62 => Ok(PythonPyc27_OpArg_OpCodeEnum::BinaryLshift),
            63 => Ok(PythonPyc27_OpArg_OpCodeEnum::BinaryRshift),
            64 => Ok(PythonPyc27_OpArg_OpCodeEnum::BinaryAnd),
            65 => Ok(PythonPyc27_OpArg_OpCodeEnum::BinaryXor),
            66 => Ok(PythonPyc27_OpArg_OpCodeEnum::BinaryOr),
            67 => Ok(PythonPyc27_OpArg_OpCodeEnum::InplacePower),
            68 => Ok(PythonPyc27_OpArg_OpCodeEnum::GetIter),
            70 => Ok(PythonPyc27_OpArg_OpCodeEnum::PrintExpr),
            71 => Ok(PythonPyc27_OpArg_OpCodeEnum::PrintItem),
            72 => Ok(PythonPyc27_OpArg_OpCodeEnum::PrintNewline),
            73 => Ok(PythonPyc27_OpArg_OpCodeEnum::PrintItemTo),
            74 => Ok(PythonPyc27_OpArg_OpCodeEnum::PrintNewlineTo),
            75 => Ok(PythonPyc27_OpArg_OpCodeEnum::InplaceLshift),
            76 => Ok(PythonPyc27_OpArg_OpCodeEnum::InplaceRshift),
            77 => Ok(PythonPyc27_OpArg_OpCodeEnum::InplaceAnd),
            78 => Ok(PythonPyc27_OpArg_OpCodeEnum::InplaceXor),
            79 => Ok(PythonPyc27_OpArg_OpCodeEnum::InplaceOr),
            80 => Ok(PythonPyc27_OpArg_OpCodeEnum::BreakLoop),
            81 => Ok(PythonPyc27_OpArg_OpCodeEnum::WithCleanup),
            82 => Ok(PythonPyc27_OpArg_OpCodeEnum::LoadLocals),
            83 => Ok(PythonPyc27_OpArg_OpCodeEnum::ReturnValue),
            84 => Ok(PythonPyc27_OpArg_OpCodeEnum::ImportStar),
            85 => Ok(PythonPyc27_OpArg_OpCodeEnum::ExecStmt),
            86 => Ok(PythonPyc27_OpArg_OpCodeEnum::YieldValue),
            87 => Ok(PythonPyc27_OpArg_OpCodeEnum::PopBlock),
            88 => Ok(PythonPyc27_OpArg_OpCodeEnum::EndFinally),
            89 => Ok(PythonPyc27_OpArg_OpCodeEnum::BuildClass),
            90 => Ok(PythonPyc27_OpArg_OpCodeEnum::StoreName),
            91 => Ok(PythonPyc27_OpArg_OpCodeEnum::DeleteName),
            92 => Ok(PythonPyc27_OpArg_OpCodeEnum::UnpackSequence),
            93 => Ok(PythonPyc27_OpArg_OpCodeEnum::ForIter),
            94 => Ok(PythonPyc27_OpArg_OpCodeEnum::ListAppend),
            95 => Ok(PythonPyc27_OpArg_OpCodeEnum::StoreAttr),
            96 => Ok(PythonPyc27_OpArg_OpCodeEnum::DeleteAttr),
            97 => Ok(PythonPyc27_OpArg_OpCodeEnum::StoreGlobal),
            98 => Ok(PythonPyc27_OpArg_OpCodeEnum::DeleteGlobal),
            99 => Ok(PythonPyc27_OpArg_OpCodeEnum::DupTopx),
            100 => Ok(PythonPyc27_OpArg_OpCodeEnum::LoadConst),
            101 => Ok(PythonPyc27_OpArg_OpCodeEnum::LoadName),
            102 => Ok(PythonPyc27_OpArg_OpCodeEnum::BuildTuple),
            103 => Ok(PythonPyc27_OpArg_OpCodeEnum::BuildList),
            104 => Ok(PythonPyc27_OpArg_OpCodeEnum::BuildSet),
            105 => Ok(PythonPyc27_OpArg_OpCodeEnum::BuildMap),
            106 => Ok(PythonPyc27_OpArg_OpCodeEnum::LoadAttr),
            107 => Ok(PythonPyc27_OpArg_OpCodeEnum::CompareOp),
            108 => Ok(PythonPyc27_OpArg_OpCodeEnum::ImportName),
            109 => Ok(PythonPyc27_OpArg_OpCodeEnum::ImportFrom),
            110 => Ok(PythonPyc27_OpArg_OpCodeEnum::JumpForward),
            111 => Ok(PythonPyc27_OpArg_OpCodeEnum::JumpIfFalseOrPop),
            112 => Ok(PythonPyc27_OpArg_OpCodeEnum::JumpIfTrueOrPop),
            113 => Ok(PythonPyc27_OpArg_OpCodeEnum::JumpAbsolute),
            114 => Ok(PythonPyc27_OpArg_OpCodeEnum::PopJumpIfFalse),
            115 => Ok(PythonPyc27_OpArg_OpCodeEnum::PopJumpIfTrue),
            116 => Ok(PythonPyc27_OpArg_OpCodeEnum::LoadGlobal),
            119 => Ok(PythonPyc27_OpArg_OpCodeEnum::ContinueLoop),
            120 => Ok(PythonPyc27_OpArg_OpCodeEnum::SetupLoop),
            121 => Ok(PythonPyc27_OpArg_OpCodeEnum::SetupExcept),
            122 => Ok(PythonPyc27_OpArg_OpCodeEnum::SetupFinally),
            124 => Ok(PythonPyc27_OpArg_OpCodeEnum::LoadFast),
            125 => Ok(PythonPyc27_OpArg_OpCodeEnum::StoreFast),
            126 => Ok(PythonPyc27_OpArg_OpCodeEnum::DeleteFast),
            130 => Ok(PythonPyc27_OpArg_OpCodeEnum::RaiseVarargs),
            131 => Ok(PythonPyc27_OpArg_OpCodeEnum::CallFunction),
            132 => Ok(PythonPyc27_OpArg_OpCodeEnum::MakeFunction),
            133 => Ok(PythonPyc27_OpArg_OpCodeEnum::BuildSlice),
            134 => Ok(PythonPyc27_OpArg_OpCodeEnum::MakeClosure),
            135 => Ok(PythonPyc27_OpArg_OpCodeEnum::LoadClosure),
            136 => Ok(PythonPyc27_OpArg_OpCodeEnum::LoadDeref),
            137 => Ok(PythonPyc27_OpArg_OpCodeEnum::StoreDeref),
            140 => Ok(PythonPyc27_OpArg_OpCodeEnum::CallFunctionVar),
            141 => Ok(PythonPyc27_OpArg_OpCodeEnum::CallFunctionKw),
            142 => Ok(PythonPyc27_OpArg_OpCodeEnum::CallFunctionVarKw),
            143 => Ok(PythonPyc27_OpArg_OpCodeEnum::SetupWith),
            145 => Ok(PythonPyc27_OpArg_OpCodeEnum::ExtendedArg),
            146 => Ok(PythonPyc27_OpArg_OpCodeEnum::SetAdd),
            147 => Ok(PythonPyc27_OpArg_OpCodeEnum::MapAdd),
            _ => Ok(PythonPyc27_OpArg_OpCodeEnum::Unknown(flag)),
        }
    }
}

impl From<&PythonPyc27_OpArg_OpCodeEnum> for i64 {
    fn from(v: &PythonPyc27_OpArg_OpCodeEnum) -> Self {
        match *v {
            PythonPyc27_OpArg_OpCodeEnum::StopCode => 0,
            PythonPyc27_OpArg_OpCodeEnum::PopTop => 1,
            PythonPyc27_OpArg_OpCodeEnum::RotTwo => 2,
            PythonPyc27_OpArg_OpCodeEnum::RotThree => 3,
            PythonPyc27_OpArg_OpCodeEnum::DupTop => 4,
            PythonPyc27_OpArg_OpCodeEnum::RotFour => 5,
            PythonPyc27_OpArg_OpCodeEnum::Nop => 9,
            PythonPyc27_OpArg_OpCodeEnum::UnaryPositive => 10,
            PythonPyc27_OpArg_OpCodeEnum::UnaryNegative => 11,
            PythonPyc27_OpArg_OpCodeEnum::UnaryNot => 12,
            PythonPyc27_OpArg_OpCodeEnum::UnaryConvert => 13,
            PythonPyc27_OpArg_OpCodeEnum::UnaryInvert => 15,
            PythonPyc27_OpArg_OpCodeEnum::BinaryPower => 19,
            PythonPyc27_OpArg_OpCodeEnum::BinaryMultiply => 20,
            PythonPyc27_OpArg_OpCodeEnum::BinaryDivide => 21,
            PythonPyc27_OpArg_OpCodeEnum::BinaryModulo => 22,
            PythonPyc27_OpArg_OpCodeEnum::BinaryAdd => 23,
            PythonPyc27_OpArg_OpCodeEnum::BinarySubtract => 24,
            PythonPyc27_OpArg_OpCodeEnum::BinarySubscr => 25,
            PythonPyc27_OpArg_OpCodeEnum::BinaryFloorDivide => 26,
            PythonPyc27_OpArg_OpCodeEnum::BinaryTrueDivide => 27,
            PythonPyc27_OpArg_OpCodeEnum::InplaceFloorDivide => 28,
            PythonPyc27_OpArg_OpCodeEnum::InplaceTrueDivide => 29,
            PythonPyc27_OpArg_OpCodeEnum::Slice0 => 30,
            PythonPyc27_OpArg_OpCodeEnum::Slice1 => 31,
            PythonPyc27_OpArg_OpCodeEnum::Slice2 => 32,
            PythonPyc27_OpArg_OpCodeEnum::Slice3 => 33,
            PythonPyc27_OpArg_OpCodeEnum::StoreSlice0 => 40,
            PythonPyc27_OpArg_OpCodeEnum::StoreSlice1 => 41,
            PythonPyc27_OpArg_OpCodeEnum::StoreSlice2 => 42,
            PythonPyc27_OpArg_OpCodeEnum::StoreSlice3 => 43,
            PythonPyc27_OpArg_OpCodeEnum::DeleteSlice0 => 50,
            PythonPyc27_OpArg_OpCodeEnum::DeleteSlice1 => 51,
            PythonPyc27_OpArg_OpCodeEnum::DeleteSlice2 => 52,
            PythonPyc27_OpArg_OpCodeEnum::DeleteSlice3 => 53,
            PythonPyc27_OpArg_OpCodeEnum::StoreMap => 54,
            PythonPyc27_OpArg_OpCodeEnum::InplaceAdd => 55,
            PythonPyc27_OpArg_OpCodeEnum::InplaceSubtract => 56,
            PythonPyc27_OpArg_OpCodeEnum::InplaceMultiply => 57,
            PythonPyc27_OpArg_OpCodeEnum::InplaceDivide => 58,
            PythonPyc27_OpArg_OpCodeEnum::InplaceModulo => 59,
            PythonPyc27_OpArg_OpCodeEnum::StoreSubscr => 60,
            PythonPyc27_OpArg_OpCodeEnum::DeleteSubscr => 61,
            PythonPyc27_OpArg_OpCodeEnum::BinaryLshift => 62,
            PythonPyc27_OpArg_OpCodeEnum::BinaryRshift => 63,
            PythonPyc27_OpArg_OpCodeEnum::BinaryAnd => 64,
            PythonPyc27_OpArg_OpCodeEnum::BinaryXor => 65,
            PythonPyc27_OpArg_OpCodeEnum::BinaryOr => 66,
            PythonPyc27_OpArg_OpCodeEnum::InplacePower => 67,
            PythonPyc27_OpArg_OpCodeEnum::GetIter => 68,
            PythonPyc27_OpArg_OpCodeEnum::PrintExpr => 70,
            PythonPyc27_OpArg_OpCodeEnum::PrintItem => 71,
            PythonPyc27_OpArg_OpCodeEnum::PrintNewline => 72,
            PythonPyc27_OpArg_OpCodeEnum::PrintItemTo => 73,
            PythonPyc27_OpArg_OpCodeEnum::PrintNewlineTo => 74,
            PythonPyc27_OpArg_OpCodeEnum::InplaceLshift => 75,
            PythonPyc27_OpArg_OpCodeEnum::InplaceRshift => 76,
            PythonPyc27_OpArg_OpCodeEnum::InplaceAnd => 77,
            PythonPyc27_OpArg_OpCodeEnum::InplaceXor => 78,
            PythonPyc27_OpArg_OpCodeEnum::InplaceOr => 79,
            PythonPyc27_OpArg_OpCodeEnum::BreakLoop => 80,
            PythonPyc27_OpArg_OpCodeEnum::WithCleanup => 81,
            PythonPyc27_OpArg_OpCodeEnum::LoadLocals => 82,
            PythonPyc27_OpArg_OpCodeEnum::ReturnValue => 83,
            PythonPyc27_OpArg_OpCodeEnum::ImportStar => 84,
            PythonPyc27_OpArg_OpCodeEnum::ExecStmt => 85,
            PythonPyc27_OpArg_OpCodeEnum::YieldValue => 86,
            PythonPyc27_OpArg_OpCodeEnum::PopBlock => 87,
            PythonPyc27_OpArg_OpCodeEnum::EndFinally => 88,
            PythonPyc27_OpArg_OpCodeEnum::BuildClass => 89,
            PythonPyc27_OpArg_OpCodeEnum::StoreName => 90,
            PythonPyc27_OpArg_OpCodeEnum::DeleteName => 91,
            PythonPyc27_OpArg_OpCodeEnum::UnpackSequence => 92,
            PythonPyc27_OpArg_OpCodeEnum::ForIter => 93,
            PythonPyc27_OpArg_OpCodeEnum::ListAppend => 94,
            PythonPyc27_OpArg_OpCodeEnum::StoreAttr => 95,
            PythonPyc27_OpArg_OpCodeEnum::DeleteAttr => 96,
            PythonPyc27_OpArg_OpCodeEnum::StoreGlobal => 97,
            PythonPyc27_OpArg_OpCodeEnum::DeleteGlobal => 98,
            PythonPyc27_OpArg_OpCodeEnum::DupTopx => 99,
            PythonPyc27_OpArg_OpCodeEnum::LoadConst => 100,
            PythonPyc27_OpArg_OpCodeEnum::LoadName => 101,
            PythonPyc27_OpArg_OpCodeEnum::BuildTuple => 102,
            PythonPyc27_OpArg_OpCodeEnum::BuildList => 103,
            PythonPyc27_OpArg_OpCodeEnum::BuildSet => 104,
            PythonPyc27_OpArg_OpCodeEnum::BuildMap => 105,
            PythonPyc27_OpArg_OpCodeEnum::LoadAttr => 106,
            PythonPyc27_OpArg_OpCodeEnum::CompareOp => 107,
            PythonPyc27_OpArg_OpCodeEnum::ImportName => 108,
            PythonPyc27_OpArg_OpCodeEnum::ImportFrom => 109,
            PythonPyc27_OpArg_OpCodeEnum::JumpForward => 110,
            PythonPyc27_OpArg_OpCodeEnum::JumpIfFalseOrPop => 111,
            PythonPyc27_OpArg_OpCodeEnum::JumpIfTrueOrPop => 112,
            PythonPyc27_OpArg_OpCodeEnum::JumpAbsolute => 113,
            PythonPyc27_OpArg_OpCodeEnum::PopJumpIfFalse => 114,
            PythonPyc27_OpArg_OpCodeEnum::PopJumpIfTrue => 115,
            PythonPyc27_OpArg_OpCodeEnum::LoadGlobal => 116,
            PythonPyc27_OpArg_OpCodeEnum::ContinueLoop => 119,
            PythonPyc27_OpArg_OpCodeEnum::SetupLoop => 120,
            PythonPyc27_OpArg_OpCodeEnum::SetupExcept => 121,
            PythonPyc27_OpArg_OpCodeEnum::SetupFinally => 122,
            PythonPyc27_OpArg_OpCodeEnum::LoadFast => 124,
            PythonPyc27_OpArg_OpCodeEnum::StoreFast => 125,
            PythonPyc27_OpArg_OpCodeEnum::DeleteFast => 126,
            PythonPyc27_OpArg_OpCodeEnum::RaiseVarargs => 130,
            PythonPyc27_OpArg_OpCodeEnum::CallFunction => 131,
            PythonPyc27_OpArg_OpCodeEnum::MakeFunction => 132,
            PythonPyc27_OpArg_OpCodeEnum::BuildSlice => 133,
            PythonPyc27_OpArg_OpCodeEnum::MakeClosure => 134,
            PythonPyc27_OpArg_OpCodeEnum::LoadClosure => 135,
            PythonPyc27_OpArg_OpCodeEnum::LoadDeref => 136,
            PythonPyc27_OpArg_OpCodeEnum::StoreDeref => 137,
            PythonPyc27_OpArg_OpCodeEnum::CallFunctionVar => 140,
            PythonPyc27_OpArg_OpCodeEnum::CallFunctionKw => 141,
            PythonPyc27_OpArg_OpCodeEnum::CallFunctionVarKw => 142,
            PythonPyc27_OpArg_OpCodeEnum::SetupWith => 143,
            PythonPyc27_OpArg_OpCodeEnum::ExtendedArg => 145,
            PythonPyc27_OpArg_OpCodeEnum::SetAdd => 146,
            PythonPyc27_OpArg_OpCodeEnum::MapAdd => 147,
            PythonPyc27_OpArg_OpCodeEnum::Unknown(v) => v
        }
    }
}

impl Default for PythonPyc27_OpArg_OpCodeEnum {
    fn default() -> Self { PythonPyc27_OpArg_OpCodeEnum::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct PythonPyc27_OpArgs {
    pub _root: SharedType<PythonPyc27>,
    pub _parent: SharedType<PythonPyc27_Assembly>,
    pub _self: SharedType<Self>,
    items: RefCell<Vec<OptRc<PythonPyc27_OpArg>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPyc27_OpArgs {
    type Root = PythonPyc27;
    type Parent = PythonPyc27_Assembly;

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
        *self_rc.items.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, PythonPyc27_OpArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.items.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl PythonPyc27_OpArgs {
}
impl PythonPyc27_OpArgs {
    pub fn items(&self) -> Ref<'_, Vec<OptRc<PythonPyc27_OpArg>>> {
        self.items.borrow()
    }
}
impl PythonPyc27_OpArgs {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct PythonPyc27_PyObject {
    pub _root: SharedType<PythonPyc27>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    type: RefCell<PythonPyc27_PyObject_ObjectType>,
    value: RefCell<Option<PythonPyc27_PyObject_Value>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum PythonPyc27_PyObject_Value {
    PythonPyc27_PyObject_PyFalse(OptRc<PythonPyc27_PyObject_PyFalse>),
    PythonPyc27_PyObject_Tuple(OptRc<PythonPyc27_PyObject_Tuple>),
    PythonPyc27_PyObject_PyString(OptRc<PythonPyc27_PyObject_PyString>),
    PythonPyc27_PyObject_PyNone(OptRc<PythonPyc27_PyObject_PyNone>),
    U4(u32),
    PythonPyc27_PyObject_PyTrue(OptRc<PythonPyc27_PyObject_PyTrue>),
    PythonPyc27_PyObject_InternedString(OptRc<PythonPyc27_PyObject_InternedString>),
    PythonPyc27_PyObject_StringRef(OptRc<PythonPyc27_PyObject_StringRef>),
    PythonPyc27_CodeObject(OptRc<PythonPyc27_CodeObject>),
}
impl From<&PythonPyc27_PyObject_Value> for OptRc<PythonPyc27_PyObject_PyFalse> {
    fn from(v: &PythonPyc27_PyObject_Value) -> Self {
        if let PythonPyc27_PyObject_Value::PythonPyc27_PyObject_PyFalse(x) = v {
            return x.clone();
        }
        panic!("expected PythonPyc27_PyObject_Value::PythonPyc27_PyObject_PyFalse, got {:?}", v)
    }
}
impl From<OptRc<PythonPyc27_PyObject_PyFalse>> for PythonPyc27_PyObject_Value {
    fn from(v: OptRc<PythonPyc27_PyObject_PyFalse>) -> Self {
        Self::PythonPyc27_PyObject_PyFalse(v)
    }
}
impl From<&PythonPyc27_PyObject_Value> for OptRc<PythonPyc27_PyObject_Tuple> {
    fn from(v: &PythonPyc27_PyObject_Value) -> Self {
        if let PythonPyc27_PyObject_Value::PythonPyc27_PyObject_Tuple(x) = v {
            return x.clone();
        }
        panic!("expected PythonPyc27_PyObject_Value::PythonPyc27_PyObject_Tuple, got {:?}", v)
    }
}
impl From<OptRc<PythonPyc27_PyObject_Tuple>> for PythonPyc27_PyObject_Value {
    fn from(v: OptRc<PythonPyc27_PyObject_Tuple>) -> Self {
        Self::PythonPyc27_PyObject_Tuple(v)
    }
}
impl From<&PythonPyc27_PyObject_Value> for OptRc<PythonPyc27_PyObject_PyString> {
    fn from(v: &PythonPyc27_PyObject_Value) -> Self {
        if let PythonPyc27_PyObject_Value::PythonPyc27_PyObject_PyString(x) = v {
            return x.clone();
        }
        panic!("expected PythonPyc27_PyObject_Value::PythonPyc27_PyObject_PyString, got {:?}", v)
    }
}
impl From<OptRc<PythonPyc27_PyObject_PyString>> for PythonPyc27_PyObject_Value {
    fn from(v: OptRc<PythonPyc27_PyObject_PyString>) -> Self {
        Self::PythonPyc27_PyObject_PyString(v)
    }
}
impl From<&PythonPyc27_PyObject_Value> for OptRc<PythonPyc27_PyObject_PyNone> {
    fn from(v: &PythonPyc27_PyObject_Value) -> Self {
        if let PythonPyc27_PyObject_Value::PythonPyc27_PyObject_PyNone(x) = v {
            return x.clone();
        }
        panic!("expected PythonPyc27_PyObject_Value::PythonPyc27_PyObject_PyNone, got {:?}", v)
    }
}
impl From<OptRc<PythonPyc27_PyObject_PyNone>> for PythonPyc27_PyObject_Value {
    fn from(v: OptRc<PythonPyc27_PyObject_PyNone>) -> Self {
        Self::PythonPyc27_PyObject_PyNone(v)
    }
}
impl From<&PythonPyc27_PyObject_Value> for u32 {
    fn from(v: &PythonPyc27_PyObject_Value) -> Self {
        if let PythonPyc27_PyObject_Value::U4(x) = v {
            return x.clone();
        }
        panic!("expected PythonPyc27_PyObject_Value::U4, got {:?}", v)
    }
}
impl From<u32> for PythonPyc27_PyObject_Value {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&PythonPyc27_PyObject_Value> for OptRc<PythonPyc27_PyObject_PyTrue> {
    fn from(v: &PythonPyc27_PyObject_Value) -> Self {
        if let PythonPyc27_PyObject_Value::PythonPyc27_PyObject_PyTrue(x) = v {
            return x.clone();
        }
        panic!("expected PythonPyc27_PyObject_Value::PythonPyc27_PyObject_PyTrue, got {:?}", v)
    }
}
impl From<OptRc<PythonPyc27_PyObject_PyTrue>> for PythonPyc27_PyObject_Value {
    fn from(v: OptRc<PythonPyc27_PyObject_PyTrue>) -> Self {
        Self::PythonPyc27_PyObject_PyTrue(v)
    }
}
impl From<&PythonPyc27_PyObject_Value> for OptRc<PythonPyc27_PyObject_InternedString> {
    fn from(v: &PythonPyc27_PyObject_Value) -> Self {
        if let PythonPyc27_PyObject_Value::PythonPyc27_PyObject_InternedString(x) = v {
            return x.clone();
        }
        panic!("expected PythonPyc27_PyObject_Value::PythonPyc27_PyObject_InternedString, got {:?}", v)
    }
}
impl From<OptRc<PythonPyc27_PyObject_InternedString>> for PythonPyc27_PyObject_Value {
    fn from(v: OptRc<PythonPyc27_PyObject_InternedString>) -> Self {
        Self::PythonPyc27_PyObject_InternedString(v)
    }
}
impl From<&PythonPyc27_PyObject_Value> for OptRc<PythonPyc27_PyObject_StringRef> {
    fn from(v: &PythonPyc27_PyObject_Value) -> Self {
        if let PythonPyc27_PyObject_Value::PythonPyc27_PyObject_StringRef(x) = v {
            return x.clone();
        }
        panic!("expected PythonPyc27_PyObject_Value::PythonPyc27_PyObject_StringRef, got {:?}", v)
    }
}
impl From<OptRc<PythonPyc27_PyObject_StringRef>> for PythonPyc27_PyObject_Value {
    fn from(v: OptRc<PythonPyc27_PyObject_StringRef>) -> Self {
        Self::PythonPyc27_PyObject_StringRef(v)
    }
}
impl From<&PythonPyc27_PyObject_Value> for OptRc<PythonPyc27_CodeObject> {
    fn from(v: &PythonPyc27_PyObject_Value) -> Self {
        if let PythonPyc27_PyObject_Value::PythonPyc27_CodeObject(x) = v {
            return x.clone();
        }
        panic!("expected PythonPyc27_PyObject_Value::PythonPyc27_CodeObject, got {:?}", v)
    }
}
impl From<OptRc<PythonPyc27_CodeObject>> for PythonPyc27_PyObject_Value {
    fn from(v: OptRc<PythonPyc27_CodeObject>) -> Self {
        Self::PythonPyc27_CodeObject(v)
    }
}
impl KStruct for PythonPyc27_PyObject {
    type Root = PythonPyc27;
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
        *self_rc.type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        match *self_rc.type() {
            PythonPyc27_PyObject_ObjectType::CodeObject => {
                let t = Self::read_into::<_, PythonPyc27_CodeObject>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            PythonPyc27_PyObject_ObjectType::Int => {
                *self_rc.value.borrow_mut() = Some(_io.read_u4le()?.into());
            }
            PythonPyc27_PyObject_ObjectType::Interned => {
                let t = Self::read_into::<_, PythonPyc27_PyObject_InternedString>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            PythonPyc27_PyObject_ObjectType::None => {
                let t = Self::read_into::<_, PythonPyc27_PyObject_PyNone>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            PythonPyc27_PyObject_ObjectType::PyFalse => {
                let t = Self::read_into::<_, PythonPyc27_PyObject_PyFalse>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            PythonPyc27_PyObject_ObjectType::PyTrue => {
                let t = Self::read_into::<_, PythonPyc27_PyObject_PyTrue>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            PythonPyc27_PyObject_ObjectType::String => {
                let t = Self::read_into::<_, PythonPyc27_PyObject_PyString>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            PythonPyc27_PyObject_ObjectType::StringRef => {
                let t = Self::read_into::<_, PythonPyc27_PyObject_StringRef>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            PythonPyc27_PyObject_ObjectType::Tuple => {
                let t = Self::read_into::<_, PythonPyc27_PyObject_Tuple>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl PythonPyc27_PyObject {
}
impl PythonPyc27_PyObject {
    pub fn type(&self) -> Ref<'_, PythonPyc27_PyObject_ObjectType> {
        self.type.borrow()
    }
}
impl PythonPyc27_PyObject {
    pub fn value(&self) -> Ref<'_, Option<PythonPyc27_PyObject_Value>> {
        self.value.borrow()
    }
}
impl PythonPyc27_PyObject {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum PythonPyc27_PyObject_ObjectType {
    Tuple,
    PyFalse,
    None,
    StringRef,
    PyTrue,
    CodeObject,
    Int,
    String,
    Interned,
    UnicodeString,
    Unknown(i64),
}

impl TryFrom<i64> for PythonPyc27_PyObject_ObjectType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<PythonPyc27_PyObject_ObjectType> {
        match flag {
            40 => Ok(PythonPyc27_PyObject_ObjectType::Tuple),
            70 => Ok(PythonPyc27_PyObject_ObjectType::PyFalse),
            78 => Ok(PythonPyc27_PyObject_ObjectType::None),
            82 => Ok(PythonPyc27_PyObject_ObjectType::StringRef),
            84 => Ok(PythonPyc27_PyObject_ObjectType::PyTrue),
            99 => Ok(PythonPyc27_PyObject_ObjectType::CodeObject),
            105 => Ok(PythonPyc27_PyObject_ObjectType::Int),
            115 => Ok(PythonPyc27_PyObject_ObjectType::String),
            116 => Ok(PythonPyc27_PyObject_ObjectType::Interned),
            117 => Ok(PythonPyc27_PyObject_ObjectType::UnicodeString),
            _ => Ok(PythonPyc27_PyObject_ObjectType::Unknown(flag)),
        }
    }
}

impl From<&PythonPyc27_PyObject_ObjectType> for i64 {
    fn from(v: &PythonPyc27_PyObject_ObjectType) -> Self {
        match *v {
            PythonPyc27_PyObject_ObjectType::Tuple => 40,
            PythonPyc27_PyObject_ObjectType::PyFalse => 70,
            PythonPyc27_PyObject_ObjectType::None => 78,
            PythonPyc27_PyObject_ObjectType::StringRef => 82,
            PythonPyc27_PyObject_ObjectType::PyTrue => 84,
            PythonPyc27_PyObject_ObjectType::CodeObject => 99,
            PythonPyc27_PyObject_ObjectType::Int => 105,
            PythonPyc27_PyObject_ObjectType::String => 115,
            PythonPyc27_PyObject_ObjectType::Interned => 116,
            PythonPyc27_PyObject_ObjectType::UnicodeString => 117,
            PythonPyc27_PyObject_ObjectType::Unknown(v) => v
        }
    }
}

impl Default for PythonPyc27_PyObject_ObjectType {
    fn default() -> Self { PythonPyc27_PyObject_ObjectType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct PythonPyc27_PyObject_InternedString {
    pub _root: SharedType<PythonPyc27>,
    pub _parent: SharedType<PythonPyc27_PyObject>,
    pub _self: SharedType<Self>,
    length: RefCell<u32>,
    data: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPyc27_PyObject_InternedString {
    type Root = PythonPyc27;
    type Parent = PythonPyc27_PyObject;

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
        *self_rc.length.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.data.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.length() as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl PythonPyc27_PyObject_InternedString {
}
impl PythonPyc27_PyObject_InternedString {
    pub fn length(&self) -> Ref<'_, u32> {
        self.length.borrow()
    }
}
impl PythonPyc27_PyObject_InternedString {
    pub fn data(&self) -> Ref<'_, String> {
        self.data.borrow()
    }
}
impl PythonPyc27_PyObject_InternedString {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct PythonPyc27_PyObject_PyFalse {
    pub _root: SharedType<PythonPyc27>,
    pub _parent: SharedType<PythonPyc27_PyObject>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPyc27_PyObject_PyFalse {
    type Root = PythonPyc27;
    type Parent = PythonPyc27_PyObject;

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
impl PythonPyc27_PyObject_PyFalse {
}
impl PythonPyc27_PyObject_PyFalse {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct PythonPyc27_PyObject_PyNone {
    pub _root: SharedType<PythonPyc27>,
    pub _parent: SharedType<PythonPyc27_PyObject>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPyc27_PyObject_PyNone {
    type Root = PythonPyc27;
    type Parent = PythonPyc27_PyObject;

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
impl PythonPyc27_PyObject_PyNone {
}
impl PythonPyc27_PyObject_PyNone {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct PythonPyc27_PyObject_PyString {
    pub _root: SharedType<PythonPyc27>,
    pub _parent: SharedType<PythonPyc27_PyObject>,
    pub _self: SharedType<Self>,
    length: RefCell<u32>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPyc27_PyObject_PyString {
    type Root = PythonPyc27;
    type Parent = PythonPyc27_PyObject;

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
        *self_rc.length.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.data.borrow_mut() = _io.read_bytes(*self_rc.length() as usize)?.into();
        Ok(())
    }
}
impl PythonPyc27_PyObject_PyString {
}
impl PythonPyc27_PyObject_PyString {
    pub fn length(&self) -> Ref<'_, u32> {
        self.length.borrow()
    }
}
impl PythonPyc27_PyObject_PyString {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl PythonPyc27_PyObject_PyString {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct PythonPyc27_PyObject_PyTrue {
    pub _root: SharedType<PythonPyc27>,
    pub _parent: SharedType<PythonPyc27_PyObject>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPyc27_PyObject_PyTrue {
    type Root = PythonPyc27;
    type Parent = PythonPyc27_PyObject;

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
impl PythonPyc27_PyObject_PyTrue {
}
impl PythonPyc27_PyObject_PyTrue {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct PythonPyc27_PyObject_StringRef {
    pub _root: SharedType<PythonPyc27>,
    pub _parent: SharedType<PythonPyc27_PyObject>,
    pub _self: SharedType<Self>,
    interned_list_index: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPyc27_PyObject_StringRef {
    type Root = PythonPyc27;
    type Parent = PythonPyc27_PyObject;

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
        *self_rc.interned_list_index.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl PythonPyc27_PyObject_StringRef {
}
impl PythonPyc27_PyObject_StringRef {
    pub fn interned_list_index(&self) -> Ref<'_, u32> {
        self.interned_list_index.borrow()
    }
}
impl PythonPyc27_PyObject_StringRef {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct PythonPyc27_PyObject_Tuple {
    pub _root: SharedType<PythonPyc27>,
    pub _parent: SharedType<PythonPyc27_PyObject>,
    pub _self: SharedType<Self>,
    count: RefCell<u32>,
    items: RefCell<Vec<OptRc<PythonPyc27_PyObject>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPyc27_PyObject_Tuple {
    type Root = PythonPyc27;
    type Parent = PythonPyc27_PyObject;

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
        *self_rc.count.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.items.borrow_mut() = Vec::new();
        let l_items = *self_rc.count();
        for _i in 0..l_items {
            let t = Self::read_into::<_, PythonPyc27_PyObject>(&*_io, Some(self_rc._root.clone()), None)?.into();
            self_rc.items.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl PythonPyc27_PyObject_Tuple {
}
impl PythonPyc27_PyObject_Tuple {
    pub fn count(&self) -> Ref<'_, u32> {
        self.count.borrow()
    }
}
impl PythonPyc27_PyObject_Tuple {
    pub fn items(&self) -> Ref<'_, Vec<OptRc<PythonPyc27_PyObject>>> {
        self.items.borrow()
    }
}
impl PythonPyc27_PyObject_Tuple {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct PythonPyc27_PyObject_UnicodeString {
    pub _root: SharedType<PythonPyc27>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    length: RefCell<u32>,
    data: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPyc27_PyObject_UnicodeString {
    type Root = PythonPyc27;
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
        *self_rc.length.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.data.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.length() as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl PythonPyc27_PyObject_UnicodeString {
}
impl PythonPyc27_PyObject_UnicodeString {
    pub fn length(&self) -> Ref<'_, u32> {
        self.length.borrow()
    }
}
impl PythonPyc27_PyObject_UnicodeString {
    pub fn data(&self) -> Ref<'_, String> {
        self.data.borrow()
    }
}
impl PythonPyc27_PyObject_UnicodeString {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

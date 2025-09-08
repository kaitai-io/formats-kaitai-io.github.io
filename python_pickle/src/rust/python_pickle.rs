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
 * Python Pickle format serializes Python objects to a byte stream, as a sequence
 * of operations to run on the Pickle Virtual Machine.
 * 
 * The format is mostly implementation defined, there is no formal specification.
 * Pickle data types are closely coupled to the Python object model.
 * Python singletons, and most builtin types (e.g. `None`, `int`,`dict`, `list`)
 * are serialised using dedicated Pickle opcodes.
 * Other builtin types, and all classes  (e.g. `set`, `datetime.datetime`) are
 * serialised by encoding the name of a constructor callable.
 * They are deserialised by importing that constructor, and calling it.
 * So, unpickling an arbitrary pickle, using the Python's stdlib pickle module
 * can cause arbitrary code execution.
 * 
 * Pickle format has evolved with Python, later protocols add opcodes & types.
 * Later Python releases can pickle to or unpickle from any earlier protocol.
 * 
 * * Protocol 0: ASCII clean, no explicit version, fields are '\n' terminated.
 * * Protocol 1: Binary, no explicit version, first length prefixed types.
 * * Protocol 2 ([PEP 307](https://peps.python.org/pep-0307/)): Python 2.3+.
 *   Explicit versioning, more length prefixed types.
 * * Protocol 3: Python 3.0+. Dedicated opcodes for `bytes` objects.
 * * Protocol 4 ([PEP 3154](https://peps.python.org/pep-3154/)): Python 3.4+.
 *   Opcodes for 64 bit strings, framing, `set`.
 * * Protocol 5 ([PEP 574](https://peps.python.org/pep-0574/)): Python 3.8+:
 * Opcodes for `bytearray` and out of band data
 * \sa https://github.com/python/cpython/blob/v3.8.1/Lib/pickletools.py Source
 */

#[derive(Default, Debug, Clone)]
pub struct PythonPickle {
    pub _root: SharedType<PythonPickle>,
    pub _parent: SharedType<PythonPickle>,
    pub _self: SharedType<Self>,
    ops: RefCell<Vec<OptRc<PythonPickle_Op>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPickle {
    type Root = PythonPickle;
    type Parent = PythonPickle;

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
        *self_rc.ops.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let t = Self::read_into::<_, PythonPickle_Op>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.ops.borrow_mut().push(t);
                let _t_ops = self_rc.ops.borrow();
                let _tmpa = _t_ops.last().unwrap();
                _i += 1;
                let x = !(*_tmpa.code() == PythonPickle_Opcode::Stop);
                x
            } {}
        }
        Ok(())
    }
}
impl PythonPickle {
}
impl PythonPickle {
    pub fn ops(&self) -> Ref<'_, Vec<OptRc<PythonPickle_Op>>> {
        self.ops.borrow()
    }
}
impl PythonPickle {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum PythonPickle_Opcode {

    /**
     * push special markobject on stack
     */
    Mark,

    /**
     * push empty tuple
     */
    EmptyTuple,

    /**
     * every pickle ends with STOP
     */
    Stop,

    /**
     * discard topmost stack item
     */
    Pop,

    /**
     * discard stack top through topmost markobject
     */
    PopMark,

    /**
     * duplicate top stack item
     */
    Dup,

    /**
     * push bytes; counted binary string argument
     */
    Binbytes,

    /**
     * push bytes; counted binary string argument < 256 bytes
     */
    ShortBinbytes,

    /**
     * push float object; decimal string argument
     */
    Float,

    /**
     * push float; arg is 8-byte float encoding
     */
    Binfloat,

    /**
     * push integer or bool; decimal string argument
     */
    Int,

    /**
     * push four-byte signed int
     */
    Binint,

    /**
     * push 1-byte unsigned int
     */
    Binint1,

    /**
     * push long; decimal string argument
     */
    Long,

    /**
     * push 2-byte unsigned int
     */
    Binint2,

    /**
     * push None
     */
    None,

    /**
     * push persistent object; id is taken from string arg
     */
    Persid,

    /**
     * push persistent object; id is taken from stack
     */
    Binpersid,

    /**
     * apply callable to argtuple, both on stack
     */
    Reduce,

    /**
     * push string; NL-terminated string argument
     */
    String,

    /**
     * push string; counted binary string argument
     */
    Binstring,

    /**
     * push string; counted binary string argument 256 bytes
     */
    ShortBinstring,

    /**
     * push Unicode string; raw-unicode-escaped argument
     */
    Unicode,

    /**
     * push Unicode string; counted UTF-8 string argument
     */
    Binunicode,

    /**
     * push empty list
     */
    EmptyList,

    /**
     * append stack top to list below it
     */
    Append,

    /**
     * call __setstate__ or __dict__.update()
     */
    Build,

    /**
     * push self.find_class(modname, name); 2 string args
     * 
     * As of KSC 0.9, this enum key can't be called `global` because it would
     * cause a syntax error in Python (it is a keyword).
     */
    GlobalOpcode,

    /**
     * build a dict from stack items
     */
    Dict,

    /**
     * extend list on stack by topmost stack slice
     */
    Appends,

    /**
     * push item from memo on stack; index is string arg
     */
    Get,

    /**
     * push item from memo on stack; index is 1-byte arg
     */
    Binget,

    /**
     * build & push class instance
     */
    Inst,

    /**
     * push item from memo on stack; index is 4-byte arg
     */
    LongBinget,

    /**
     * build list from topmost stack items
     */
    List,

    /**
     * build & push class instance
     */
    Obj,

    /**
     * store stack top in memo; index is string arg
     */
    Put,

    /**
     * store stack top in memo; index is 1-byte arg
     */
    Binput,

    /**
     * store stack top in memo; index is 4-byte arg
     */
    LongBinput,

    /**
     * add key+value pair to dict
     */
    Setitem,

    /**
     * build tuple from topmost stack items
     */
    Tuple,

    /**
     * modify dict by adding topmost key+value pairs
     */
    Setitems,

    /**
     * push empty dict
     */
    EmptyDict,

    /**
     * identify pickle protocol
     */
    Proto,

    /**
     * build object by applying cls.__new__ to argtuple
     */
    Newobj,

    /**
     * push object from extension registry; 1-byte index
     */
    Ext1,

    /**
     * ditto, but 2-byte index
     */
    Ext2,

    /**
     * ditto, but 4-byte index
     */
    Ext4,

    /**
     * build 1-tuple from stack top
     */
    Tuple1,

    /**
     * build 2-tuple from two topmost stack items
     */
    Tuple2,

    /**
     * build 3-tuple from three topmost stack items
     */
    Tuple3,

    /**
     * push True
     */
    Newtrue,

    /**
     * push False
     */
    Newfalse,

    /**
     * push long from < 256 bytes
     */
    Long1,

    /**
     * push really big long
     */
    Long4,

    /**
     * push short string; UTF-8 length < 256 bytes
     */
    ShortBinunicode,

    /**
     * push very long string
     */
    Binunicode8,

    /**
     * push very long bytes string
     */
    Binbytes8,

    /**
     * push empty set on the stack
     */
    EmptySet,

    /**
     * modify set by adding topmost stack items
     */
    Additems,

    /**
     * build frozenset from topmost stack items
     */
    Frozenset,

    /**
     * like NEWOBJ but work with keyword only arguments
     */
    NewobjEx,

    /**
     * same as GLOBAL but using names on the stacks
     */
    StackGlobal,

    /**
     * store top of the stack in memo
     */
    Memoize,

    /**
     * indicate the beginning of a new frame
     */
    Frame,

    /**
     * push bytearray
     */
    Bytearray8,

    /**
     * push next out-of-band buffer
     */
    NextBuffer,

    /**
     * make top of stack readonly
     */
    ReadonlyBuffer,
    Unknown(i64),
}

impl TryFrom<i64> for PythonPickle_Opcode {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<PythonPickle_Opcode> {
        match flag {
            40 => Ok(PythonPickle_Opcode::Mark),
            41 => Ok(PythonPickle_Opcode::EmptyTuple),
            46 => Ok(PythonPickle_Opcode::Stop),
            48 => Ok(PythonPickle_Opcode::Pop),
            49 => Ok(PythonPickle_Opcode::PopMark),
            50 => Ok(PythonPickle_Opcode::Dup),
            66 => Ok(PythonPickle_Opcode::Binbytes),
            67 => Ok(PythonPickle_Opcode::ShortBinbytes),
            70 => Ok(PythonPickle_Opcode::Float),
            71 => Ok(PythonPickle_Opcode::Binfloat),
            73 => Ok(PythonPickle_Opcode::Int),
            74 => Ok(PythonPickle_Opcode::Binint),
            75 => Ok(PythonPickle_Opcode::Binint1),
            76 => Ok(PythonPickle_Opcode::Long),
            77 => Ok(PythonPickle_Opcode::Binint2),
            78 => Ok(PythonPickle_Opcode::None),
            80 => Ok(PythonPickle_Opcode::Persid),
            81 => Ok(PythonPickle_Opcode::Binpersid),
            82 => Ok(PythonPickle_Opcode::Reduce),
            83 => Ok(PythonPickle_Opcode::String),
            84 => Ok(PythonPickle_Opcode::Binstring),
            85 => Ok(PythonPickle_Opcode::ShortBinstring),
            86 => Ok(PythonPickle_Opcode::Unicode),
            88 => Ok(PythonPickle_Opcode::Binunicode),
            93 => Ok(PythonPickle_Opcode::EmptyList),
            97 => Ok(PythonPickle_Opcode::Append),
            98 => Ok(PythonPickle_Opcode::Build),
            99 => Ok(PythonPickle_Opcode::GlobalOpcode),
            100 => Ok(PythonPickle_Opcode::Dict),
            101 => Ok(PythonPickle_Opcode::Appends),
            103 => Ok(PythonPickle_Opcode::Get),
            104 => Ok(PythonPickle_Opcode::Binget),
            105 => Ok(PythonPickle_Opcode::Inst),
            106 => Ok(PythonPickle_Opcode::LongBinget),
            108 => Ok(PythonPickle_Opcode::List),
            111 => Ok(PythonPickle_Opcode::Obj),
            112 => Ok(PythonPickle_Opcode::Put),
            113 => Ok(PythonPickle_Opcode::Binput),
            114 => Ok(PythonPickle_Opcode::LongBinput),
            115 => Ok(PythonPickle_Opcode::Setitem),
            116 => Ok(PythonPickle_Opcode::Tuple),
            117 => Ok(PythonPickle_Opcode::Setitems),
            125 => Ok(PythonPickle_Opcode::EmptyDict),
            128 => Ok(PythonPickle_Opcode::Proto),
            129 => Ok(PythonPickle_Opcode::Newobj),
            130 => Ok(PythonPickle_Opcode::Ext1),
            131 => Ok(PythonPickle_Opcode::Ext2),
            132 => Ok(PythonPickle_Opcode::Ext4),
            133 => Ok(PythonPickle_Opcode::Tuple1),
            134 => Ok(PythonPickle_Opcode::Tuple2),
            135 => Ok(PythonPickle_Opcode::Tuple3),
            136 => Ok(PythonPickle_Opcode::Newtrue),
            137 => Ok(PythonPickle_Opcode::Newfalse),
            138 => Ok(PythonPickle_Opcode::Long1),
            139 => Ok(PythonPickle_Opcode::Long4),
            140 => Ok(PythonPickle_Opcode::ShortBinunicode),
            141 => Ok(PythonPickle_Opcode::Binunicode8),
            142 => Ok(PythonPickle_Opcode::Binbytes8),
            143 => Ok(PythonPickle_Opcode::EmptySet),
            144 => Ok(PythonPickle_Opcode::Additems),
            145 => Ok(PythonPickle_Opcode::Frozenset),
            146 => Ok(PythonPickle_Opcode::NewobjEx),
            147 => Ok(PythonPickle_Opcode::StackGlobal),
            148 => Ok(PythonPickle_Opcode::Memoize),
            149 => Ok(PythonPickle_Opcode::Frame),
            150 => Ok(PythonPickle_Opcode::Bytearray8),
            151 => Ok(PythonPickle_Opcode::NextBuffer),
            152 => Ok(PythonPickle_Opcode::ReadonlyBuffer),
            _ => Ok(PythonPickle_Opcode::Unknown(flag)),
        }
    }
}

impl From<&PythonPickle_Opcode> for i64 {
    fn from(v: &PythonPickle_Opcode) -> Self {
        match *v {
            PythonPickle_Opcode::Mark => 40,
            PythonPickle_Opcode::EmptyTuple => 41,
            PythonPickle_Opcode::Stop => 46,
            PythonPickle_Opcode::Pop => 48,
            PythonPickle_Opcode::PopMark => 49,
            PythonPickle_Opcode::Dup => 50,
            PythonPickle_Opcode::Binbytes => 66,
            PythonPickle_Opcode::ShortBinbytes => 67,
            PythonPickle_Opcode::Float => 70,
            PythonPickle_Opcode::Binfloat => 71,
            PythonPickle_Opcode::Int => 73,
            PythonPickle_Opcode::Binint => 74,
            PythonPickle_Opcode::Binint1 => 75,
            PythonPickle_Opcode::Long => 76,
            PythonPickle_Opcode::Binint2 => 77,
            PythonPickle_Opcode::None => 78,
            PythonPickle_Opcode::Persid => 80,
            PythonPickle_Opcode::Binpersid => 81,
            PythonPickle_Opcode::Reduce => 82,
            PythonPickle_Opcode::String => 83,
            PythonPickle_Opcode::Binstring => 84,
            PythonPickle_Opcode::ShortBinstring => 85,
            PythonPickle_Opcode::Unicode => 86,
            PythonPickle_Opcode::Binunicode => 88,
            PythonPickle_Opcode::EmptyList => 93,
            PythonPickle_Opcode::Append => 97,
            PythonPickle_Opcode::Build => 98,
            PythonPickle_Opcode::GlobalOpcode => 99,
            PythonPickle_Opcode::Dict => 100,
            PythonPickle_Opcode::Appends => 101,
            PythonPickle_Opcode::Get => 103,
            PythonPickle_Opcode::Binget => 104,
            PythonPickle_Opcode::Inst => 105,
            PythonPickle_Opcode::LongBinget => 106,
            PythonPickle_Opcode::List => 108,
            PythonPickle_Opcode::Obj => 111,
            PythonPickle_Opcode::Put => 112,
            PythonPickle_Opcode::Binput => 113,
            PythonPickle_Opcode::LongBinput => 114,
            PythonPickle_Opcode::Setitem => 115,
            PythonPickle_Opcode::Tuple => 116,
            PythonPickle_Opcode::Setitems => 117,
            PythonPickle_Opcode::EmptyDict => 125,
            PythonPickle_Opcode::Proto => 128,
            PythonPickle_Opcode::Newobj => 129,
            PythonPickle_Opcode::Ext1 => 130,
            PythonPickle_Opcode::Ext2 => 131,
            PythonPickle_Opcode::Ext4 => 132,
            PythonPickle_Opcode::Tuple1 => 133,
            PythonPickle_Opcode::Tuple2 => 134,
            PythonPickle_Opcode::Tuple3 => 135,
            PythonPickle_Opcode::Newtrue => 136,
            PythonPickle_Opcode::Newfalse => 137,
            PythonPickle_Opcode::Long1 => 138,
            PythonPickle_Opcode::Long4 => 139,
            PythonPickle_Opcode::ShortBinunicode => 140,
            PythonPickle_Opcode::Binunicode8 => 141,
            PythonPickle_Opcode::Binbytes8 => 142,
            PythonPickle_Opcode::EmptySet => 143,
            PythonPickle_Opcode::Additems => 144,
            PythonPickle_Opcode::Frozenset => 145,
            PythonPickle_Opcode::NewobjEx => 146,
            PythonPickle_Opcode::StackGlobal => 147,
            PythonPickle_Opcode::Memoize => 148,
            PythonPickle_Opcode::Frame => 149,
            PythonPickle_Opcode::Bytearray8 => 150,
            PythonPickle_Opcode::NextBuffer => 151,
            PythonPickle_Opcode::ReadonlyBuffer => 152,
            PythonPickle_Opcode::Unknown(v) => v
        }
    }
}

impl Default for PythonPickle_Opcode {
    fn default() -> Self { PythonPickle_Opcode::Unknown(0) }
}


/**
 * Length prefixed string, between 0 and 2**64-1 bytes long.
 * 
 * The contents are deserilised into a `bytearray` object.
 */

#[derive(Default, Debug, Clone)]
pub struct PythonPickle_Bytearray8 {
    pub _root: SharedType<PythonPickle>,
    pub _parent: SharedType<PythonPickle_Op>,
    pub _self: SharedType<Self>,
    len: RefCell<u64>,
    val: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPickle_Bytearray8 {
    type Root = PythonPickle;
    type Parent = PythonPickle_Op;

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
        *self_rc.len.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.val.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
        Ok(())
    }
}
impl PythonPickle_Bytearray8 {
}
impl PythonPickle_Bytearray8 {
    pub fn len(&self) -> Ref<'_, u64> {
        self.len.borrow()
    }
}
impl PythonPickle_Bytearray8 {
    pub fn val(&self) -> Ref<'_, Vec<u8>> {
        self.val.borrow()
    }
}
impl PythonPickle_Bytearray8 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Length prefixed byte string, between 0 and 255 bytes long.
 */

#[derive(Default, Debug, Clone)]
pub struct PythonPickle_Bytes1 {
    pub _root: SharedType<PythonPickle>,
    pub _parent: SharedType<PythonPickle_Op>,
    pub _self: SharedType<Self>,
    len: RefCell<u8>,
    val: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPickle_Bytes1 {
    type Root = PythonPickle;
    type Parent = PythonPickle_Op;

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
        *self_rc.len.borrow_mut() = _io.read_u1()?.into();
        *self_rc.val.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
        Ok(())
    }
}
impl PythonPickle_Bytes1 {
}
impl PythonPickle_Bytes1 {
    pub fn len(&self) -> Ref<'_, u8> {
        self.len.borrow()
    }
}
impl PythonPickle_Bytes1 {
    pub fn val(&self) -> Ref<'_, Vec<u8>> {
        self.val.borrow()
    }
}
impl PythonPickle_Bytes1 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Length prefixed string, between 0 and 2**32-1 bytes long
 */

#[derive(Default, Debug, Clone)]
pub struct PythonPickle_Bytes4 {
    pub _root: SharedType<PythonPickle>,
    pub _parent: SharedType<PythonPickle_Op>,
    pub _self: SharedType<Self>,
    len: RefCell<u32>,
    val: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPickle_Bytes4 {
    type Root = PythonPickle;
    type Parent = PythonPickle_Op;

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
        *self_rc.len.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.val.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
        Ok(())
    }
}
impl PythonPickle_Bytes4 {
}
impl PythonPickle_Bytes4 {
    pub fn len(&self) -> Ref<'_, u32> {
        self.len.borrow()
    }
}
impl PythonPickle_Bytes4 {
    pub fn val(&self) -> Ref<'_, Vec<u8>> {
        self.val.borrow()
    }
}
impl PythonPickle_Bytes4 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Length prefixed string, between 0 and 2**64-1 bytes long.
 * 
 * Only a 64-bit build of Python would produce a pickle containing strings
 * large enough to need this type. Such a pickle could not be unpickled on
 * a 32-bit build of Python, because the string would be larger than
 * `sys.maxsize`.
 */

#[derive(Default, Debug, Clone)]
pub struct PythonPickle_Bytes8 {
    pub _root: SharedType<PythonPickle>,
    pub _parent: SharedType<PythonPickle_Op>,
    pub _self: SharedType<Self>,
    len: RefCell<u64>,
    val: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPickle_Bytes8 {
    type Root = PythonPickle;
    type Parent = PythonPickle_Op;

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
        *self_rc.len.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.val.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
        Ok(())
    }
}
impl PythonPickle_Bytes8 {
}
impl PythonPickle_Bytes8 {
    pub fn len(&self) -> Ref<'_, u64> {
        self.len.borrow()
    }
}
impl PythonPickle_Bytes8 {
    pub fn val(&self) -> Ref<'_, Vec<u8>> {
        self.val.borrow()
    }
}
impl PythonPickle_Bytes8 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Integer, encoded with the ASCII chracters [0-9-], followed by 'L'.
 */

#[derive(Default, Debug, Clone)]
pub struct PythonPickle_DecimalnlLong {
    pub _root: SharedType<PythonPickle>,
    pub _parent: SharedType<PythonPickle_Op>,
    pub _self: SharedType<Self>,
    val: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPickle_DecimalnlLong {
    type Root = PythonPickle;
    type Parent = PythonPickle_Op;

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
        *self_rc.val.borrow_mut() = bytes_to_str(&_io.read_bytes_term(10, false, true, true)?.into(), "ASCII")?;
        Ok(())
    }
}
impl PythonPickle_DecimalnlLong {
}
impl PythonPickle_DecimalnlLong {
    pub fn val(&self) -> Ref<'_, String> {
        self.val.borrow()
    }
}
impl PythonPickle_DecimalnlLong {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Integer or boolean, encoded with the ASCII characters [0-9-].
 * 
 * The values '00' and '01' encode the Python values `False` and `True`.
 * Normally a value would not contain leading '0' characters.
 */

#[derive(Default, Debug, Clone)]
pub struct PythonPickle_DecimalnlShort {
    pub _root: SharedType<PythonPickle>,
    pub _parent: SharedType<PythonPickle_Op>,
    pub _self: SharedType<Self>,
    val: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPickle_DecimalnlShort {
    type Root = PythonPickle;
    type Parent = PythonPickle_Op;

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
        *self_rc.val.borrow_mut() = bytes_to_str(&_io.read_bytes_term(10, false, true, true)?.into(), "ASCII")?;
        Ok(())
    }
}
impl PythonPickle_DecimalnlShort {
}
impl PythonPickle_DecimalnlShort {
    pub fn val(&self) -> Ref<'_, String> {
        self.val.borrow()
    }
}
impl PythonPickle_DecimalnlShort {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Double float, encoded with the ASCII characters [0-9.e+-], '-inf', 'inf',
 * or 'nan'.
 */

#[derive(Default, Debug, Clone)]
pub struct PythonPickle_Floatnl {
    pub _root: SharedType<PythonPickle>,
    pub _parent: SharedType<PythonPickle_Op>,
    pub _self: SharedType<Self>,
    val: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPickle_Floatnl {
    type Root = PythonPickle;
    type Parent = PythonPickle_Op;

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
        *self_rc.val.borrow_mut() = bytes_to_str(&_io.read_bytes_term(10, false, true, true)?.into(), "ASCII")?;
        Ok(())
    }
}
impl PythonPickle_Floatnl {
}
impl PythonPickle_Floatnl {
    pub fn val(&self) -> Ref<'_, String> {
        self.val.borrow()
    }
}
impl PythonPickle_Floatnl {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Large signed integer, in the range -2**(8*255-1) to 2**(8*255-1)-1,
 * encoded as two's complement.
 */

#[derive(Default, Debug, Clone)]
pub struct PythonPickle_Long1 {
    pub _root: SharedType<PythonPickle>,
    pub _parent: SharedType<PythonPickle_Op>,
    pub _self: SharedType<Self>,
    len: RefCell<u8>,
    val: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPickle_Long1 {
    type Root = PythonPickle;
    type Parent = PythonPickle_Op;

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
        *self_rc.len.borrow_mut() = _io.read_u1()?.into();
        *self_rc.val.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
        Ok(())
    }
}
impl PythonPickle_Long1 {
}
impl PythonPickle_Long1 {
    pub fn len(&self) -> Ref<'_, u8> {
        self.len.borrow()
    }
}
impl PythonPickle_Long1 {
    pub fn val(&self) -> Ref<'_, Vec<u8>> {
        self.val.borrow()
    }
}
impl PythonPickle_Long1 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Large signed integer, in the range -2**(8*2**32-1) to 2**(8*2**32-1)-1,
 * encoded as two's complement.
 */

#[derive(Default, Debug, Clone)]
pub struct PythonPickle_Long4 {
    pub _root: SharedType<PythonPickle>,
    pub _parent: SharedType<PythonPickle_Op>,
    pub _self: SharedType<Self>,
    len: RefCell<u32>,
    val: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPickle_Long4 {
    type Root = PythonPickle;
    type Parent = PythonPickle_Op;

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
        *self_rc.len.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.val.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
        Ok(())
    }
}
impl PythonPickle_Long4 {
}
impl PythonPickle_Long4 {
    pub fn len(&self) -> Ref<'_, u32> {
        self.len.borrow()
    }
}
impl PythonPickle_Long4 {
    pub fn val(&self) -> Ref<'_, Vec<u8>> {
        self.val.borrow()
    }
}
impl PythonPickle_Long4 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Some opcodes take no argument, this empty type is used for them.
 */

#[derive(Default, Debug, Clone)]
pub struct PythonPickle_NoArg {
    pub _root: SharedType<PythonPickle>,
    pub _parent: SharedType<PythonPickle_Op>,
    pub _self: SharedType<Self>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPickle_NoArg {
    type Root = PythonPickle;
    type Parent = PythonPickle_Op;

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
impl PythonPickle_NoArg {
}
impl PythonPickle_NoArg {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct PythonPickle_Op {
    pub _root: SharedType<PythonPickle>,
    pub _parent: SharedType<PythonPickle>,
    pub _self: SharedType<Self>,
    code: RefCell<PythonPickle_Opcode>,
    arg: RefCell<Option<PythonPickle_Op_Arg>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum PythonPickle_Op_Arg {
    PythonPickle_Bytes4(OptRc<PythonPickle_Bytes4>),
    PythonPickle_String4(OptRc<PythonPickle_String4>),
    S4(i32),
    PythonPickle_Stringnl(OptRc<PythonPickle_Stringnl>),
    PythonPickle_DecimalnlLong(OptRc<PythonPickle_DecimalnlLong>),
    PythonPickle_Bytes1(OptRc<PythonPickle_Bytes1>),
    PythonPickle_Long1(OptRc<PythonPickle_Long1>),
    PythonPickle_Bytearray8(OptRc<PythonPickle_Bytearray8>),
    PythonPickle_Bytes8(OptRc<PythonPickle_Bytes8>),
    U4(u32),
    U1(u8),
    PythonPickle_Unicodestring4(OptRc<PythonPickle_Unicodestring4>),
    PythonPickle_StringnlNoescapePair(OptRc<PythonPickle_StringnlNoescapePair>),
    PythonPickle_StringnlNoescape(OptRc<PythonPickle_StringnlNoescape>),
    PythonPickle_Floatnl(OptRc<PythonPickle_Floatnl>),
    PythonPickle_Long4(OptRc<PythonPickle_Long4>),
    U2(u16),
    PythonPickle_NoArg(OptRc<PythonPickle_NoArg>),
    PythonPickle_Unicodestring1(OptRc<PythonPickle_Unicodestring1>),
    PythonPickle_String1(OptRc<PythonPickle_String1>),
    PythonPickle_Unicodestringnl(OptRc<PythonPickle_Unicodestringnl>),
    U8(u64),
    PythonPickle_Unicodestring8(OptRc<PythonPickle_Unicodestring8>),
    F8(f64),
    PythonPickle_DecimalnlShort(OptRc<PythonPickle_DecimalnlShort>),
}
impl From<&PythonPickle_Op_Arg> for OptRc<PythonPickle_Bytes4> {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::PythonPickle_Bytes4(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::PythonPickle_Bytes4, got {:?}", v)
    }
}
impl From<OptRc<PythonPickle_Bytes4>> for PythonPickle_Op_Arg {
    fn from(v: OptRc<PythonPickle_Bytes4>) -> Self {
        Self::PythonPickle_Bytes4(v)
    }
}
impl From<&PythonPickle_Op_Arg> for OptRc<PythonPickle_String4> {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::PythonPickle_String4(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::PythonPickle_String4, got {:?}", v)
    }
}
impl From<OptRc<PythonPickle_String4>> for PythonPickle_Op_Arg {
    fn from(v: OptRc<PythonPickle_String4>) -> Self {
        Self::PythonPickle_String4(v)
    }
}
impl From<&PythonPickle_Op_Arg> for i32 {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::S4(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::S4, got {:?}", v)
    }
}
impl From<i32> for PythonPickle_Op_Arg {
    fn from(v: i32) -> Self {
        Self::S4(v)
    }
}
impl From<&PythonPickle_Op_Arg> for OptRc<PythonPickle_Stringnl> {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::PythonPickle_Stringnl(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::PythonPickle_Stringnl, got {:?}", v)
    }
}
impl From<OptRc<PythonPickle_Stringnl>> for PythonPickle_Op_Arg {
    fn from(v: OptRc<PythonPickle_Stringnl>) -> Self {
        Self::PythonPickle_Stringnl(v)
    }
}
impl From<&PythonPickle_Op_Arg> for OptRc<PythonPickle_DecimalnlLong> {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::PythonPickle_DecimalnlLong(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::PythonPickle_DecimalnlLong, got {:?}", v)
    }
}
impl From<OptRc<PythonPickle_DecimalnlLong>> for PythonPickle_Op_Arg {
    fn from(v: OptRc<PythonPickle_DecimalnlLong>) -> Self {
        Self::PythonPickle_DecimalnlLong(v)
    }
}
impl From<&PythonPickle_Op_Arg> for OptRc<PythonPickle_Bytes1> {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::PythonPickle_Bytes1(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::PythonPickle_Bytes1, got {:?}", v)
    }
}
impl From<OptRc<PythonPickle_Bytes1>> for PythonPickle_Op_Arg {
    fn from(v: OptRc<PythonPickle_Bytes1>) -> Self {
        Self::PythonPickle_Bytes1(v)
    }
}
impl From<&PythonPickle_Op_Arg> for OptRc<PythonPickle_Long1> {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::PythonPickle_Long1(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::PythonPickle_Long1, got {:?}", v)
    }
}
impl From<OptRc<PythonPickle_Long1>> for PythonPickle_Op_Arg {
    fn from(v: OptRc<PythonPickle_Long1>) -> Self {
        Self::PythonPickle_Long1(v)
    }
}
impl From<&PythonPickle_Op_Arg> for OptRc<PythonPickle_Bytearray8> {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::PythonPickle_Bytearray8(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::PythonPickle_Bytearray8, got {:?}", v)
    }
}
impl From<OptRc<PythonPickle_Bytearray8>> for PythonPickle_Op_Arg {
    fn from(v: OptRc<PythonPickle_Bytearray8>) -> Self {
        Self::PythonPickle_Bytearray8(v)
    }
}
impl From<&PythonPickle_Op_Arg> for OptRc<PythonPickle_Bytes8> {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::PythonPickle_Bytes8(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::PythonPickle_Bytes8, got {:?}", v)
    }
}
impl From<OptRc<PythonPickle_Bytes8>> for PythonPickle_Op_Arg {
    fn from(v: OptRc<PythonPickle_Bytes8>) -> Self {
        Self::PythonPickle_Bytes8(v)
    }
}
impl From<&PythonPickle_Op_Arg> for u32 {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::U4(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::U4, got {:?}", v)
    }
}
impl From<u32> for PythonPickle_Op_Arg {
    fn from(v: u32) -> Self {
        Self::U4(v)
    }
}
impl From<&PythonPickle_Op_Arg> for u8 {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::U1(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::U1, got {:?}", v)
    }
}
impl From<u8> for PythonPickle_Op_Arg {
    fn from(v: u8) -> Self {
        Self::U1(v)
    }
}
impl From<&PythonPickle_Op_Arg> for OptRc<PythonPickle_Unicodestring4> {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::PythonPickle_Unicodestring4(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::PythonPickle_Unicodestring4, got {:?}", v)
    }
}
impl From<OptRc<PythonPickle_Unicodestring4>> for PythonPickle_Op_Arg {
    fn from(v: OptRc<PythonPickle_Unicodestring4>) -> Self {
        Self::PythonPickle_Unicodestring4(v)
    }
}
impl From<&PythonPickle_Op_Arg> for OptRc<PythonPickle_StringnlNoescapePair> {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::PythonPickle_StringnlNoescapePair(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::PythonPickle_StringnlNoescapePair, got {:?}", v)
    }
}
impl From<OptRc<PythonPickle_StringnlNoescapePair>> for PythonPickle_Op_Arg {
    fn from(v: OptRc<PythonPickle_StringnlNoescapePair>) -> Self {
        Self::PythonPickle_StringnlNoescapePair(v)
    }
}
impl From<&PythonPickle_Op_Arg> for OptRc<PythonPickle_StringnlNoescape> {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::PythonPickle_StringnlNoescape(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::PythonPickle_StringnlNoescape, got {:?}", v)
    }
}
impl From<OptRc<PythonPickle_StringnlNoescape>> for PythonPickle_Op_Arg {
    fn from(v: OptRc<PythonPickle_StringnlNoescape>) -> Self {
        Self::PythonPickle_StringnlNoescape(v)
    }
}
impl From<&PythonPickle_Op_Arg> for OptRc<PythonPickle_Floatnl> {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::PythonPickle_Floatnl(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::PythonPickle_Floatnl, got {:?}", v)
    }
}
impl From<OptRc<PythonPickle_Floatnl>> for PythonPickle_Op_Arg {
    fn from(v: OptRc<PythonPickle_Floatnl>) -> Self {
        Self::PythonPickle_Floatnl(v)
    }
}
impl From<&PythonPickle_Op_Arg> for OptRc<PythonPickle_Long4> {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::PythonPickle_Long4(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::PythonPickle_Long4, got {:?}", v)
    }
}
impl From<OptRc<PythonPickle_Long4>> for PythonPickle_Op_Arg {
    fn from(v: OptRc<PythonPickle_Long4>) -> Self {
        Self::PythonPickle_Long4(v)
    }
}
impl From<&PythonPickle_Op_Arg> for u16 {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::U2(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::U2, got {:?}", v)
    }
}
impl From<u16> for PythonPickle_Op_Arg {
    fn from(v: u16) -> Self {
        Self::U2(v)
    }
}
impl From<&PythonPickle_Op_Arg> for OptRc<PythonPickle_NoArg> {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::PythonPickle_NoArg(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::PythonPickle_NoArg, got {:?}", v)
    }
}
impl From<OptRc<PythonPickle_NoArg>> for PythonPickle_Op_Arg {
    fn from(v: OptRc<PythonPickle_NoArg>) -> Self {
        Self::PythonPickle_NoArg(v)
    }
}
impl From<&PythonPickle_Op_Arg> for OptRc<PythonPickle_Unicodestring1> {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::PythonPickle_Unicodestring1(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::PythonPickle_Unicodestring1, got {:?}", v)
    }
}
impl From<OptRc<PythonPickle_Unicodestring1>> for PythonPickle_Op_Arg {
    fn from(v: OptRc<PythonPickle_Unicodestring1>) -> Self {
        Self::PythonPickle_Unicodestring1(v)
    }
}
impl From<&PythonPickle_Op_Arg> for OptRc<PythonPickle_String1> {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::PythonPickle_String1(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::PythonPickle_String1, got {:?}", v)
    }
}
impl From<OptRc<PythonPickle_String1>> for PythonPickle_Op_Arg {
    fn from(v: OptRc<PythonPickle_String1>) -> Self {
        Self::PythonPickle_String1(v)
    }
}
impl From<&PythonPickle_Op_Arg> for OptRc<PythonPickle_Unicodestringnl> {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::PythonPickle_Unicodestringnl(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::PythonPickle_Unicodestringnl, got {:?}", v)
    }
}
impl From<OptRc<PythonPickle_Unicodestringnl>> for PythonPickle_Op_Arg {
    fn from(v: OptRc<PythonPickle_Unicodestringnl>) -> Self {
        Self::PythonPickle_Unicodestringnl(v)
    }
}
impl From<&PythonPickle_Op_Arg> for u64 {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::U8(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::U8, got {:?}", v)
    }
}
impl From<u64> for PythonPickle_Op_Arg {
    fn from(v: u64) -> Self {
        Self::U8(v)
    }
}
impl From<&PythonPickle_Op_Arg> for OptRc<PythonPickle_Unicodestring8> {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::PythonPickle_Unicodestring8(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::PythonPickle_Unicodestring8, got {:?}", v)
    }
}
impl From<OptRc<PythonPickle_Unicodestring8>> for PythonPickle_Op_Arg {
    fn from(v: OptRc<PythonPickle_Unicodestring8>) -> Self {
        Self::PythonPickle_Unicodestring8(v)
    }
}
impl From<&PythonPickle_Op_Arg> for f64 {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::F8(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::F8, got {:?}", v)
    }
}
impl From<f64> for PythonPickle_Op_Arg {
    fn from(v: f64) -> Self {
        Self::F8(v)
    }
}
impl From<&PythonPickle_Op_Arg> for OptRc<PythonPickle_DecimalnlShort> {
    fn from(v: &PythonPickle_Op_Arg) -> Self {
        if let PythonPickle_Op_Arg::PythonPickle_DecimalnlShort(x) = v {
            return x.clone();
        }
        panic!("expected PythonPickle_Op_Arg::PythonPickle_DecimalnlShort, got {:?}", v)
    }
}
impl From<OptRc<PythonPickle_DecimalnlShort>> for PythonPickle_Op_Arg {
    fn from(v: OptRc<PythonPickle_DecimalnlShort>) -> Self {
        Self::PythonPickle_DecimalnlShort(v)
    }
}
impl KStruct for PythonPickle_Op {
    type Root = PythonPickle;
    type Parent = PythonPickle;

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
        *self_rc.code.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        match *self_rc.code() {
            PythonPickle_Opcode::Additems => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Append => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Appends => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Binbytes => {
                let t = Self::read_into::<_, PythonPickle_Bytes4>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Binbytes8 => {
                let t = Self::read_into::<_, PythonPickle_Bytes8>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Binfloat => {
                *self_rc.arg.borrow_mut() = Some(_io.read_f8be()?.into());
            }
            PythonPickle_Opcode::Binget => {
                *self_rc.arg.borrow_mut() = Some(_io.read_u1()?.into());
            }
            PythonPickle_Opcode::Binint => {
                *self_rc.arg.borrow_mut() = Some(_io.read_s4le()?.into());
            }
            PythonPickle_Opcode::Binint1 => {
                *self_rc.arg.borrow_mut() = Some(_io.read_u1()?.into());
            }
            PythonPickle_Opcode::Binint2 => {
                *self_rc.arg.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            PythonPickle_Opcode::Binpersid => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Binput => {
                *self_rc.arg.borrow_mut() = Some(_io.read_u1()?.into());
            }
            PythonPickle_Opcode::Binstring => {
                let t = Self::read_into::<_, PythonPickle_String4>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Binunicode => {
                let t = Self::read_into::<_, PythonPickle_Unicodestring4>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Binunicode8 => {
                let t = Self::read_into::<_, PythonPickle_Unicodestring8>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Build => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Bytearray8 => {
                let t = Self::read_into::<_, PythonPickle_Bytearray8>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Dict => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Dup => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::EmptyDict => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::EmptyList => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::EmptySet => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::EmptyTuple => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Ext1 => {
                *self_rc.arg.borrow_mut() = Some(_io.read_u1()?.into());
            }
            PythonPickle_Opcode::Ext2 => {
                *self_rc.arg.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            PythonPickle_Opcode::Ext4 => {
                *self_rc.arg.borrow_mut() = Some(_io.read_u4le()?.into());
            }
            PythonPickle_Opcode::Float => {
                let t = Self::read_into::<_, PythonPickle_Floatnl>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Frame => {
                *self_rc.arg.borrow_mut() = Some(_io.read_u8le()?.into());
            }
            PythonPickle_Opcode::Frozenset => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Get => {
                let t = Self::read_into::<_, PythonPickle_DecimalnlShort>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::GlobalOpcode => {
                let t = Self::read_into::<_, PythonPickle_StringnlNoescapePair>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Inst => {
                let t = Self::read_into::<_, PythonPickle_StringnlNoescapePair>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Int => {
                let t = Self::read_into::<_, PythonPickle_DecimalnlShort>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::List => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Long => {
                let t = Self::read_into::<_, PythonPickle_DecimalnlLong>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Long1 => {
                let t = Self::read_into::<_, PythonPickle_Long1>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Long4 => {
                let t = Self::read_into::<_, PythonPickle_Long4>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::LongBinget => {
                *self_rc.arg.borrow_mut() = Some(_io.read_u4le()?.into());
            }
            PythonPickle_Opcode::LongBinput => {
                *self_rc.arg.borrow_mut() = Some(_io.read_u4le()?.into());
            }
            PythonPickle_Opcode::Mark => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Memoize => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Newfalse => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Newobj => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::NewobjEx => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Newtrue => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::NextBuffer => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::None => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Obj => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Persid => {
                let t = Self::read_into::<_, PythonPickle_StringnlNoescape>(&*_io, Some(self_rc._root.clone()), None)?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Pop => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::PopMark => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Proto => {
                *self_rc.arg.borrow_mut() = Some(_io.read_u1()?.into());
            }
            PythonPickle_Opcode::Put => {
                let t = Self::read_into::<_, PythonPickle_DecimalnlShort>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::ReadonlyBuffer => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Reduce => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Setitem => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Setitems => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::ShortBinbytes => {
                let t = Self::read_into::<_, PythonPickle_Bytes1>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::ShortBinstring => {
                let t = Self::read_into::<_, PythonPickle_String1>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::ShortBinunicode => {
                let t = Self::read_into::<_, PythonPickle_Unicodestring1>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::StackGlobal => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Stop => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::String => {
                let t = Self::read_into::<_, PythonPickle_Stringnl>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Tuple => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Tuple1 => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Tuple2 => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Tuple3 => {
                let t = Self::read_into::<_, PythonPickle_NoArg>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            PythonPickle_Opcode::Unicode => {
                let t = Self::read_into::<_, PythonPickle_Unicodestringnl>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.arg.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl PythonPickle_Op {
}

/**
 * Operation code that determines which action should be
 * performed next by the Pickle Virtual Machine. Some opcodes
 * are only available in later versions of the Pickle protocol.
 */
impl PythonPickle_Op {
    pub fn code(&self) -> Ref<'_, PythonPickle_Opcode> {
        self.code.borrow()
    }
}

/**
 * Optional argument for the operation. Data type and length
 * are determined by the value of the opcode.
 */
impl PythonPickle_Op {
    pub fn arg(&self) -> Ref<'_, Option<PythonPickle_Op_Arg>> {
        self.arg.borrow()
    }
}
impl PythonPickle_Op {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Length prefixed string, between 0 and 255 bytes long. Encoding is
 * unspecified.
 * 
 * The default Python 2.x string type (`str`) is a sequence of bytes.
 * These are pickled as `string1` or `string4`, when protocol == 2.
 * The bytes are written directly, no explicit encoding is performed.
 * 
 * Python 3.x will not pickle an object as `string1` or `string4`.
 * Instead, opcodes and types with a known encoding are used.
 * When unpickling
 * 
 * - `pickle.Unpickler` objects default to ASCII, which can be overriden
 * - `pickletools.dis` uses latin1, and cannot be overriden
 * \sa https://github.com/python/cpython/blob/bb8071a4cae/Lib/pickle.py#L486-L495 Source
 */

#[derive(Default, Debug, Clone)]
pub struct PythonPickle_String1 {
    pub _root: SharedType<PythonPickle>,
    pub _parent: SharedType<PythonPickle_Op>,
    pub _self: SharedType<Self>,
    len: RefCell<u8>,
    val: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPickle_String1 {
    type Root = PythonPickle;
    type Parent = PythonPickle_Op;

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
        *self_rc.len.borrow_mut() = _io.read_u1()?.into();
        *self_rc.val.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
        Ok(())
    }
}
impl PythonPickle_String1 {
}
impl PythonPickle_String1 {
    pub fn len(&self) -> Ref<'_, u8> {
        self.len.borrow()
    }
}
impl PythonPickle_String1 {
    pub fn val(&self) -> Ref<'_, Vec<u8>> {
        self.val.borrow()
    }
}
impl PythonPickle_String1 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Length prefixed string, between 0 and 2**31-1 bytes long. Encoding is
 * unspecified.
 * 
 * Although the len field is signed, any length < 0 will raise an exception
 * during unpickling.
 * 
 * See the documentation for `string1` for further detail about encodings.
 * \sa https://github.com/python/cpython/blob/bb8071a4cae/Lib/pickle.py#L486-L495 Source
 */

#[derive(Default, Debug, Clone)]
pub struct PythonPickle_String4 {
    pub _root: SharedType<PythonPickle>,
    pub _parent: SharedType<PythonPickle_Op>,
    pub _self: SharedType<Self>,
    len: RefCell<i32>,
    val: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPickle_String4 {
    type Root = PythonPickle;
    type Parent = PythonPickle_Op;

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
        *self_rc.len.borrow_mut() = _io.read_s4le()?.into();
        *self_rc.val.borrow_mut() = _io.read_bytes(*self_rc.len() as usize)?.into();
        Ok(())
    }
}
impl PythonPickle_String4 {
}
impl PythonPickle_String4 {
    pub fn len(&self) -> Ref<'_, i32> {
        self.len.borrow()
    }
}
impl PythonPickle_String4 {
    pub fn val(&self) -> Ref<'_, Vec<u8>> {
        self.val.borrow()
    }
}
impl PythonPickle_String4 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Quoted string, possibly containing Python string escapes.
 */

#[derive(Default, Debug, Clone)]
pub struct PythonPickle_Stringnl {
    pub _root: SharedType<PythonPickle>,
    pub _parent: SharedType<PythonPickle_Op>,
    pub _self: SharedType<Self>,
    val: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPickle_Stringnl {
    type Root = PythonPickle;
    type Parent = PythonPickle_Op;

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
        *self_rc.val.borrow_mut() = bytes_to_str(&_io.read_bytes_term(10, false, true, true)?.into(), "ASCII")?;
        Ok(())
    }
}
impl PythonPickle_Stringnl {
}
impl PythonPickle_Stringnl {
    pub fn val(&self) -> Ref<'_, String> {
        self.val.borrow()
    }
}
impl PythonPickle_Stringnl {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Unquoted string, does not contain string escapes.
 */

#[derive(Default, Debug, Clone)]
pub struct PythonPickle_StringnlNoescape {
    pub _root: SharedType<PythonPickle>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    val: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPickle_StringnlNoescape {
    type Root = PythonPickle;
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
        *self_rc.val.borrow_mut() = bytes_to_str(&_io.read_bytes_term(10, false, true, true)?.into(), "ASCII")?;
        Ok(())
    }
}
impl PythonPickle_StringnlNoescape {
}
impl PythonPickle_StringnlNoescape {
    pub fn val(&self) -> Ref<'_, String> {
        self.val.borrow()
    }
}
impl PythonPickle_StringnlNoescape {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Pair of unquoted, unescaped strings.
 */

#[derive(Default, Debug, Clone)]
pub struct PythonPickle_StringnlNoescapePair {
    pub _root: SharedType<PythonPickle>,
    pub _parent: SharedType<PythonPickle_Op>,
    pub _self: SharedType<Self>,
    val1: RefCell<OptRc<PythonPickle_StringnlNoescape>>,
    val2: RefCell<OptRc<PythonPickle_StringnlNoescape>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPickle_StringnlNoescapePair {
    type Root = PythonPickle;
    type Parent = PythonPickle_Op;

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
        let t = Self::read_into::<_, PythonPickle_StringnlNoescape>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.val1.borrow_mut() = t;
        let t = Self::read_into::<_, PythonPickle_StringnlNoescape>(&*_io, Some(self_rc._root.clone()), None)?.into();
        *self_rc.val2.borrow_mut() = t;
        Ok(())
    }
}
impl PythonPickle_StringnlNoescapePair {
}
impl PythonPickle_StringnlNoescapePair {
    pub fn val1(&self) -> Ref<'_, OptRc<PythonPickle_StringnlNoescape>> {
        self.val1.borrow()
    }
}
impl PythonPickle_StringnlNoescapePair {
    pub fn val2(&self) -> Ref<'_, OptRc<PythonPickle_StringnlNoescape>> {
        self.val2.borrow()
    }
}
impl PythonPickle_StringnlNoescapePair {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Length prefixed string, between 0 and 255 bytes long
 */

#[derive(Default, Debug, Clone)]
pub struct PythonPickle_Unicodestring1 {
    pub _root: SharedType<PythonPickle>,
    pub _parent: SharedType<PythonPickle_Op>,
    pub _self: SharedType<Self>,
    len: RefCell<u8>,
    val: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPickle_Unicodestring1 {
    type Root = PythonPickle;
    type Parent = PythonPickle_Op;

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
        *self_rc.len.borrow_mut() = _io.read_u1()?.into();
        *self_rc.val.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.len() as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl PythonPickle_Unicodestring1 {
}
impl PythonPickle_Unicodestring1 {
    pub fn len(&self) -> Ref<'_, u8> {
        self.len.borrow()
    }
}
impl PythonPickle_Unicodestring1 {
    pub fn val(&self) -> Ref<'_, String> {
        self.val.borrow()
    }
}
impl PythonPickle_Unicodestring1 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Length prefixed string, between 0 and 2**32-1 bytes long
 */

#[derive(Default, Debug, Clone)]
pub struct PythonPickle_Unicodestring4 {
    pub _root: SharedType<PythonPickle>,
    pub _parent: SharedType<PythonPickle_Op>,
    pub _self: SharedType<Self>,
    len: RefCell<u32>,
    val: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPickle_Unicodestring4 {
    type Root = PythonPickle;
    type Parent = PythonPickle_Op;

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
        *self_rc.len.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.val.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.len() as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl PythonPickle_Unicodestring4 {
}
impl PythonPickle_Unicodestring4 {
    pub fn len(&self) -> Ref<'_, u32> {
        self.len.borrow()
    }
}
impl PythonPickle_Unicodestring4 {
    pub fn val(&self) -> Ref<'_, String> {
        self.val.borrow()
    }
}
impl PythonPickle_Unicodestring4 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Length prefixed string, between 0 and 2**64-1 bytes long.
 * 
 * Only a 64-bit build of Python would produce a pickle containing strings
 * large enough to need this type. Such a pickle could not be unpickled on
 * a 32-bit build of Python, because the string would be larger than
 * `sys.maxsize`.
 */

#[derive(Default, Debug, Clone)]
pub struct PythonPickle_Unicodestring8 {
    pub _root: SharedType<PythonPickle>,
    pub _parent: SharedType<PythonPickle_Op>,
    pub _self: SharedType<Self>,
    len: RefCell<u64>,
    val: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPickle_Unicodestring8 {
    type Root = PythonPickle;
    type Parent = PythonPickle_Op;

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
        *self_rc.len.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.val.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.len() as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl PythonPickle_Unicodestring8 {
}
impl PythonPickle_Unicodestring8 {
    pub fn len(&self) -> Ref<'_, u64> {
        self.len.borrow()
    }
}
impl PythonPickle_Unicodestring8 {
    pub fn val(&self) -> Ref<'_, String> {
        self.val.borrow()
    }
}
impl PythonPickle_Unicodestring8 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Unquoted string, containing Python Unicode escapes.
 */

#[derive(Default, Debug, Clone)]
pub struct PythonPickle_Unicodestringnl {
    pub _root: SharedType<PythonPickle>,
    pub _parent: SharedType<PythonPickle_Op>,
    pub _self: SharedType<Self>,
    val: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for PythonPickle_Unicodestringnl {
    type Root = PythonPickle;
    type Parent = PythonPickle_Op;

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
        *self_rc.val.borrow_mut() = bytes_to_str(&_io.read_bytes_term(10, false, true, true)?.into(), "ASCII")?;
        Ok(())
    }
}
impl PythonPickle_Unicodestringnl {
}
impl PythonPickle_Unicodestringnl {
    pub fn val(&self) -> Ref<'_, String> {
        self.val.borrow()
    }
}
impl PythonPickle_Unicodestringnl {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

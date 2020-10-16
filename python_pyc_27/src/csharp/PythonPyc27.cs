// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Python interpreter runs .py files in 2 step process: first, it
    /// produces bytecode, which it then executes. Translation of .py source
    /// into bytecode is time-consuming, so Python dumps compiled bytecode
    /// into .pyc files, to be reused from cache at later time if possible.
    /// 
    /// .pyc file is essentially a raw dump of `py_object` (see `body`) with
    /// a simple header prepended.
    /// </summary>
    public partial class PythonPyc27 : KaitaiStruct
    {
        public static PythonPyc27 FromFile(string fileName)
        {
            return new PythonPyc27(new KaitaiStream(fileName));
        }


        public enum Version
        {
            V15 = 20121,
            V16 = 50428,
            V20 = 50823,
            V21 = 60202,
            V22 = 60717,
            V23A0 = 62011,
            V23A0b = 62021,
            V24A0 = 62041,
            V24A3 = 62051,
            V24B1 = 62061,
            V25A0 = 62071,
            V25A0b = 62081,
            V25A0c = 62091,
            V25A0d = 62092,
            V25B3 = 62101,
            V25B3b = 62111,
            V25C1 = 62121,
            V25C2 = 62131,
            V26A0 = 62151,
            V26A1 = 62161,
            V27A0 = 62171,
            V27A0b = 62181,
            V27A0c = 62191,
            V27A0d = 62201,
            V27A0e = 62211,
        }
        public PythonPyc27(KaitaiStream p__io, KaitaiStruct p__parent = null, PythonPyc27 p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _versionMagic = ((Version) m_io.ReadU2le());
            _crlf = m_io.ReadU2le();
            _modificationTimestamp = m_io.ReadU4le();
            _body = new PyObject(m_io, this, m_root);
        }
        public partial class CodeObject : KaitaiStruct
        {
            public static CodeObject FromFile(string fileName)
            {
                return new CodeObject(new KaitaiStream(fileName));
            }


            public enum FlagsEnum
            {
                HasArgs = 4,
                HasKwargs = 8,
                Generator = 32,
            }
            public CodeObject(KaitaiStream p__io, PythonPyc27.PyObject p__parent = null, PythonPyc27 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _argCount = m_io.ReadU4le();
                _localCount = m_io.ReadU4le();
                _stackSize = m_io.ReadU4le();
                _flags = ((FlagsEnum) m_io.ReadU4le());
                _code = new Assembly(m_io, this, m_root);
                _consts = new PyObject(m_io, this, m_root);
                _names = new PyObject(m_io, this, m_root);
                _varNames = new PyObject(m_io, this, m_root);
                _freeVars = new PyObject(m_io, this, m_root);
                _cellVars = new PyObject(m_io, this, m_root);
                _filename = new PyObject(m_io, this, m_root);
                _name = new PyObject(m_io, this, m_root);
                _firstLineNo = m_io.ReadU4le();
                _lnotab = new PyObject(m_io, this, m_root);
            }
            private uint _argCount;
            private uint _localCount;
            private uint _stackSize;
            private FlagsEnum _flags;
            private Assembly _code;
            private PyObject _consts;
            private PyObject _names;
            private PyObject _varNames;
            private PyObject _freeVars;
            private PyObject _cellVars;
            private PyObject _filename;
            private PyObject _name;
            private uint _firstLineNo;
            private PyObject _lnotab;
            private PythonPyc27 m_root;
            private PythonPyc27.PyObject m_parent;
            public uint ArgCount { get { return _argCount; } }
            public uint LocalCount { get { return _localCount; } }
            public uint StackSize { get { return _stackSize; } }
            public FlagsEnum Flags { get { return _flags; } }
            public Assembly Code { get { return _code; } }
            public PyObject Consts { get { return _consts; } }
            public PyObject Names { get { return _names; } }
            public PyObject VarNames { get { return _varNames; } }
            public PyObject FreeVars { get { return _freeVars; } }
            public PyObject CellVars { get { return _cellVars; } }
            public PyObject Filename { get { return _filename; } }
            public PyObject Name { get { return _name; } }
            public uint FirstLineNo { get { return _firstLineNo; } }
            public PyObject Lnotab { get { return _lnotab; } }
            public PythonPyc27 M_Root { get { return m_root; } }
            public PythonPyc27.PyObject M_Parent { get { return m_parent; } }
        }
        public partial class Assembly : KaitaiStruct
        {
            public static Assembly FromFile(string fileName)
            {
                return new Assembly(new KaitaiStream(fileName));
            }

            public Assembly(KaitaiStream p__io, PythonPyc27.CodeObject p__parent = null, PythonPyc27 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _stringMagic = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(StringMagic, new byte[] { 115 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 115 }, StringMagic, M_Io, "/types/assembly/seq/0");
                }
                _length = m_io.ReadU4le();
                __raw_items = m_io.ReadBytes(Length);
                var io___raw_items = new KaitaiStream(__raw_items);
                _items = new OpArgs(io___raw_items, this, m_root);
            }
            private byte[] _stringMagic;
            private uint _length;
            private OpArgs _items;
            private PythonPyc27 m_root;
            private PythonPyc27.CodeObject m_parent;
            private byte[] __raw_items;
            public byte[] StringMagic { get { return _stringMagic; } }
            public uint Length { get { return _length; } }
            public OpArgs Items { get { return _items; } }
            public PythonPyc27 M_Root { get { return m_root; } }
            public PythonPyc27.CodeObject M_Parent { get { return m_parent; } }
            public byte[] M_RawItems { get { return __raw_items; } }
        }
        public partial class OpArg : KaitaiStruct
        {
            public static OpArg FromFile(string fileName)
            {
                return new OpArg(new KaitaiStream(fileName));
            }


            public enum OpCodeEnum
            {
                StopCode = 0,
                PopTop = 1,
                RotTwo = 2,
                RotThree = 3,
                DupTop = 4,
                RotFour = 5,
                Nop = 9,
                UnaryPositive = 10,
                UnaryNegative = 11,
                UnaryNot = 12,
                UnaryConvert = 13,
                UnaryInvert = 15,
                BinaryPower = 19,
                BinaryMultiply = 20,
                BinaryDivide = 21,
                BinaryModulo = 22,
                BinaryAdd = 23,
                BinarySubtract = 24,
                BinarySubscr = 25,
                BinaryFloorDivide = 26,
                BinaryTrueDivide = 27,
                InplaceFloorDivide = 28,
                InplaceTrueDivide = 29,
                Slice0 = 30,
                Slice1 = 31,
                Slice2 = 32,
                Slice3 = 33,
                StoreSlice0 = 40,
                StoreSlice1 = 41,
                StoreSlice2 = 42,
                StoreSlice3 = 43,
                DeleteSlice0 = 50,
                DeleteSlice1 = 51,
                DeleteSlice2 = 52,
                DeleteSlice3 = 53,
                StoreMap = 54,
                InplaceAdd = 55,
                InplaceSubtract = 56,
                InplaceMultiply = 57,
                InplaceDivide = 58,
                InplaceModulo = 59,
                StoreSubscr = 60,
                DeleteSubscr = 61,
                BinaryLshift = 62,
                BinaryRshift = 63,
                BinaryAnd = 64,
                BinaryXor = 65,
                BinaryOr = 66,
                InplacePower = 67,
                GetIter = 68,
                PrintExpr = 70,
                PrintItem = 71,
                PrintNewline = 72,
                PrintItemTo = 73,
                PrintNewlineTo = 74,
                InplaceLshift = 75,
                InplaceRshift = 76,
                InplaceAnd = 77,
                InplaceXor = 78,
                InplaceOr = 79,
                BreakLoop = 80,
                WithCleanup = 81,
                LoadLocals = 82,
                ReturnValue = 83,
                ImportStar = 84,
                ExecStmt = 85,
                YieldValue = 86,
                PopBlock = 87,
                EndFinally = 88,
                BuildClass = 89,
                StoreName = 90,
                DeleteName = 91,
                UnpackSequence = 92,
                ForIter = 93,
                ListAppend = 94,
                StoreAttr = 95,
                DeleteAttr = 96,
                StoreGlobal = 97,
                DeleteGlobal = 98,
                DupTopx = 99,
                LoadConst = 100,
                LoadName = 101,
                BuildTuple = 102,
                BuildList = 103,
                BuildSet = 104,
                BuildMap = 105,
                LoadAttr = 106,
                CompareOp = 107,
                ImportName = 108,
                ImportFrom = 109,
                JumpForward = 110,
                JumpIfFalseOrPop = 111,
                JumpIfTrueOrPop = 112,
                JumpAbsolute = 113,
                PopJumpIfFalse = 114,
                PopJumpIfTrue = 115,
                LoadGlobal = 116,
                ContinueLoop = 119,
                SetupLoop = 120,
                SetupExcept = 121,
                SetupFinally = 122,
                LoadFast = 124,
                StoreFast = 125,
                DeleteFast = 126,
                RaiseVarargs = 130,
                CallFunction = 131,
                MakeFunction = 132,
                BuildSlice = 133,
                MakeClosure = 134,
                LoadClosure = 135,
                LoadDeref = 136,
                StoreDeref = 137,
                CallFunctionVar = 140,
                CallFunctionKw = 141,
                CallFunctionVarKw = 142,
                SetupWith = 143,
                ExtendedArg = 145,
                SetAdd = 146,
                MapAdd = 147,
            }
            public OpArg(KaitaiStream p__io, PythonPyc27.OpArgs p__parent = null, PythonPyc27 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _opCode = ((OpCodeEnum) m_io.ReadU1());
                if (OpCode >= OpCodeEnum.StoreName) {
                    _arg = m_io.ReadU2le();
                }
            }
            private OpCodeEnum _opCode;
            private ushort? _arg;
            private PythonPyc27 m_root;
            private PythonPyc27.OpArgs m_parent;
            public OpCodeEnum OpCode { get { return _opCode; } }
            public ushort? Arg { get { return _arg; } }
            public PythonPyc27 M_Root { get { return m_root; } }
            public PythonPyc27.OpArgs M_Parent { get { return m_parent; } }
        }
        public partial class PyObject : KaitaiStruct
        {
            public static PyObject FromFile(string fileName)
            {
                return new PyObject(new KaitaiStream(fileName));
            }


            public enum ObjectType
            {
                Tuple = 40,
                PyFalse = 70,
                None = 78,
                StringRef = 82,
                PyTrue = 84,
                CodeObject = 99,
                Int = 105,
                String = 115,
                Interned = 116,
                UnicodeString = 117,
            }
            public PyObject(KaitaiStream p__io, KaitaiStruct p__parent = null, PythonPyc27 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _type = ((ObjectType) m_io.ReadU1());
                switch (Type) {
                case ObjectType.String: {
                    _value = new PyString(m_io, this, m_root);
                    break;
                }
                case ObjectType.Tuple: {
                    _value = new Tuple(m_io, this, m_root);
                    break;
                }
                case ObjectType.Int: {
                    _value = m_io.ReadU4le();
                    break;
                }
                case ObjectType.PyTrue: {
                    _value = new PyTrue(m_io, this, m_root);
                    break;
                }
                case ObjectType.PyFalse: {
                    _value = new PyFalse(m_io, this, m_root);
                    break;
                }
                case ObjectType.None: {
                    _value = new PyNone(m_io, this, m_root);
                    break;
                }
                case ObjectType.StringRef: {
                    _value = new StringRef(m_io, this, m_root);
                    break;
                }
                case ObjectType.CodeObject: {
                    _value = new CodeObject(m_io, this, m_root);
                    break;
                }
                case ObjectType.Interned: {
                    _value = new InternedString(m_io, this, m_root);
                    break;
                }
                }
            }
            public partial class PyNone : KaitaiStruct
            {
                public static PyNone FromFile(string fileName)
                {
                    return new PyNone(new KaitaiStream(fileName));
                }

                public PyNone(KaitaiStream p__io, PythonPyc27.PyObject p__parent = null, PythonPyc27 p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                }
                private PythonPyc27 m_root;
                private PythonPyc27.PyObject m_parent;
                public PythonPyc27 M_Root { get { return m_root; } }
                public PythonPyc27.PyObject M_Parent { get { return m_parent; } }
            }
            public partial class PyFalse : KaitaiStruct
            {
                public static PyFalse FromFile(string fileName)
                {
                    return new PyFalse(new KaitaiStream(fileName));
                }

                public PyFalse(KaitaiStream p__io, PythonPyc27.PyObject p__parent = null, PythonPyc27 p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                }
                private PythonPyc27 m_root;
                private PythonPyc27.PyObject m_parent;
                public PythonPyc27 M_Root { get { return m_root; } }
                public PythonPyc27.PyObject M_Parent { get { return m_parent; } }
            }
            public partial class StringRef : KaitaiStruct
            {
                public static StringRef FromFile(string fileName)
                {
                    return new StringRef(new KaitaiStream(fileName));
                }

                public StringRef(KaitaiStream p__io, PythonPyc27.PyObject p__parent = null, PythonPyc27 p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _internedListIndex = m_io.ReadU4le();
                }
                private uint _internedListIndex;
                private PythonPyc27 m_root;
                private PythonPyc27.PyObject m_parent;
                public uint InternedListIndex { get { return _internedListIndex; } }
                public PythonPyc27 M_Root { get { return m_root; } }
                public PythonPyc27.PyObject M_Parent { get { return m_parent; } }
            }
            public partial class PyTrue : KaitaiStruct
            {
                public static PyTrue FromFile(string fileName)
                {
                    return new PyTrue(new KaitaiStream(fileName));
                }

                public PyTrue(KaitaiStream p__io, PythonPyc27.PyObject p__parent = null, PythonPyc27 p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                }
                private PythonPyc27 m_root;
                private PythonPyc27.PyObject m_parent;
                public PythonPyc27 M_Root { get { return m_root; } }
                public PythonPyc27.PyObject M_Parent { get { return m_parent; } }
            }
            public partial class Tuple : KaitaiStruct
            {
                public static Tuple FromFile(string fileName)
                {
                    return new Tuple(new KaitaiStream(fileName));
                }

                public Tuple(KaitaiStream p__io, PythonPyc27.PyObject p__parent = null, PythonPyc27 p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _count = m_io.ReadU4le();
                    _items = new List<PyObject>((int) (Count));
                    for (var i = 0; i < Count; i++)
                    {
                        _items.Add(new PyObject(m_io, this, m_root));
                    }
                }
                private uint _count;
                private List<PyObject> _items;
                private PythonPyc27 m_root;
                private PythonPyc27.PyObject m_parent;
                public uint Count { get { return _count; } }
                public List<PyObject> Items { get { return _items; } }
                public PythonPyc27 M_Root { get { return m_root; } }
                public PythonPyc27.PyObject M_Parent { get { return m_parent; } }
            }
            public partial class UnicodeString : KaitaiStruct
            {
                public static UnicodeString FromFile(string fileName)
                {
                    return new UnicodeString(new KaitaiStream(fileName));
                }

                public UnicodeString(KaitaiStream p__io, KaitaiStruct p__parent = null, PythonPyc27 p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _length = m_io.ReadU4le();
                    _data = System.Text.Encoding.GetEncoding("utf-8").GetString(m_io.ReadBytes(Length));
                }
                private uint _length;
                private string _data;
                private PythonPyc27 m_root;
                private KaitaiStruct m_parent;
                public uint Length { get { return _length; } }
                public string Data { get { return _data; } }
                public PythonPyc27 M_Root { get { return m_root; } }
                public KaitaiStruct M_Parent { get { return m_parent; } }
            }
            public partial class InternedString : KaitaiStruct
            {
                public static InternedString FromFile(string fileName)
                {
                    return new InternedString(new KaitaiStream(fileName));
                }

                public InternedString(KaitaiStream p__io, PythonPyc27.PyObject p__parent = null, PythonPyc27 p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _length = m_io.ReadU4le();
                    _data = System.Text.Encoding.GetEncoding("utf-8").GetString(m_io.ReadBytes(Length));
                }
                private uint _length;
                private string _data;
                private PythonPyc27 m_root;
                private PythonPyc27.PyObject m_parent;
                public uint Length { get { return _length; } }
                public string Data { get { return _data; } }
                public PythonPyc27 M_Root { get { return m_root; } }
                public PythonPyc27.PyObject M_Parent { get { return m_parent; } }
            }
            public partial class PyString : KaitaiStruct
            {
                public static PyString FromFile(string fileName)
                {
                    return new PyString(new KaitaiStream(fileName));
                }

                public PyString(KaitaiStream p__io, PythonPyc27.PyObject p__parent = null, PythonPyc27 p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _length = m_io.ReadU4le();
                    _data = m_io.ReadBytes(Length);
                }
                private uint _length;
                private byte[] _data;
                private PythonPyc27 m_root;
                private PythonPyc27.PyObject m_parent;
                public uint Length { get { return _length; } }
                public byte[] Data { get { return _data; } }
                public PythonPyc27 M_Root { get { return m_root; } }
                public PythonPyc27.PyObject M_Parent { get { return m_parent; } }
            }
            private ObjectType _type;
            private object _value;
            private PythonPyc27 m_root;
            private KaitaiStruct m_parent;
            public ObjectType Type { get { return _type; } }
            public object Value { get { return _value; } }
            public PythonPyc27 M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class OpArgs : KaitaiStruct
        {
            public static OpArgs FromFile(string fileName)
            {
                return new OpArgs(new KaitaiStream(fileName));
            }

            public OpArgs(KaitaiStream p__io, PythonPyc27.Assembly p__parent = null, PythonPyc27 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _items = new List<OpArg>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _items.Add(new OpArg(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<OpArg> _items;
            private PythonPyc27 m_root;
            private PythonPyc27.Assembly m_parent;
            public List<OpArg> Items { get { return _items; } }
            public PythonPyc27 M_Root { get { return m_root; } }
            public PythonPyc27.Assembly M_Parent { get { return m_parent; } }
        }
        private Version _versionMagic;
        private ushort _crlf;
        private uint _modificationTimestamp;
        private PyObject _body;
        private PythonPyc27 m_root;
        private KaitaiStruct m_parent;
        public Version VersionMagic { get { return _versionMagic; } }
        public ushort Crlf { get { return _crlf; } }
        public uint ModificationTimestamp { get { return _modificationTimestamp; } }
        public PyObject Body { get { return _body; } }
        public PythonPyc27 M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

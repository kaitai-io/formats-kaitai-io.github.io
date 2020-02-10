// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Python Pickle format serializes Python objects to a byte stream, as a sequence
    /// of operations to run on the Pickle Virtual Machine.
    /// 
    /// The format is mostly implementation defined, there is no formal specification.
    /// Pickle data types are closely coupled to the Python object model.
    /// Python singletons, and most builtin types (e.g. `None`, `int`,`dict`, `list`)
    /// are serialised using dedicated Pickle opcodes.
    /// Other builtin types, and all classes  (e.g. `set`, `datetime.datetime`) are
    /// serialised by encoding the name of a constructor callable.
    /// They are deserialised by importing that constructor, and calling it.
    /// So, unpickling an arbitrary pickle, using the Python's stdlib pickle module
    /// can cause arbitrary code execution.
    /// 
    /// Pickle format has evolved with Python, later protocols add opcodes &amp; types.
    /// Later Python releases can pickle to or unpickle from any earlier protocol.
    /// 
    /// * Protocol 0: ASCII clean, no explicit version, fields are '\n' terminated.
    /// * Protocol 1: Binary, no explicit version, first length prefixed types.
    /// * Protocol 2: Python 2.3+. Explicit versioning, more length prefixed types.
    ///   https://www.python.org/dev/peps/pep-0307/
    /// * Protocol 3: Python 3.0+. Dedicated opcodes for `bytes` objects.
    /// * Protocol 4: Python 3.4+. Opcodes for 64 bit strings, framing, `set`.
    ///   https://www.python.org/dev/peps/pep-3154/
    /// * Protocol 5: Python 3.8+: Opcodes for `bytearray` and out of band data
    ///   https://www.python.org/dev/peps/pep-0574/
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://github.com/python/cpython/blob/v3.8.1/Lib/pickletools.py">Source</a>
    /// </remarks>
    public partial class PythonPickle : KaitaiStruct
    {
        public static PythonPickle FromFile(string fileName)
        {
            return new PythonPickle(new KaitaiStream(fileName));
        }


        public enum Opcode
        {
            Mark = 40,
            EmptyTuple = 41,
            Stop = 46,
            Pop = 48,
            PopMark = 49,
            Dup = 50,
            Binbytes = 66,
            ShortBinbytes = 67,
            Float = 70,
            Binfloat = 71,
            Int = 73,
            Binint = 74,
            Binint1 = 75,
            Long = 76,
            Binint2 = 77,
            None = 78,
            Persid = 80,
            Binpersid = 81,
            Reduce = 82,
            String = 83,
            Binstring = 84,
            ShortBinstring = 85,
            Unicode = 86,
            Binunicode = 88,
            EmptyList = 93,
            Append = 97,
            Build = 98,
            Global = 99,
            Dict = 100,
            Appends = 101,
            Get = 103,
            Binget = 104,
            Inst = 105,
            LongBinget = 106,
            List = 108,
            Obj = 111,
            Put = 112,
            Binput = 113,
            LongBinput = 114,
            Setitem = 115,
            Tuple = 116,
            Setitems = 117,
            EmptyDict = 125,
            Proto = 128,
            Newobj = 129,
            Ext1 = 130,
            Ext2 = 131,
            Ext4 = 132,
            Tuple1 = 133,
            Tuple2 = 134,
            Tuple3 = 135,
            Newtrue = 136,
            Newfalse = 137,
            Long1 = 138,
            Long4 = 139,
            ShortBinunicode = 140,
            Binunicode8 = 141,
            Binbytes8 = 142,
            EmptySet = 143,
            Additems = 144,
            Frozenset = 145,
            NewobjEx = 146,
            StackGlobal = 147,
            Memoize = 148,
            Frame = 149,
            Bytearray8 = 150,
            NextBuffer = 151,
            ReadBuffer = 152,
        }
        public PythonPickle(KaitaiStream p__io, KaitaiStruct p__parent = null, PythonPickle p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _ops = new List<Op>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _ops.Add(new Op(m_io, this, m_root));
                    i++;
                }
            }
        }

        /// <summary>
        /// Length prefixed string, between 0 and 2**64-1 bytes long.
        /// 
        /// Only a 64-bit build of Python would produce a pickle containing strings
        /// large enough to need this type. Such a pickle could not be unpickled on
        /// a 32-bit build of Python, because the string would be larger than
        /// `sys.maxsize`.
        /// </summary>
        public partial class Unicodestring8 : KaitaiStruct
        {
            public static Unicodestring8 FromFile(string fileName)
            {
                return new Unicodestring8(new KaitaiStream(fileName));
            }

            public Unicodestring8(KaitaiStream p__io, PythonPickle.Op p__parent = null, PythonPickle p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = m_io.ReadU8le();
                _val = System.Text.Encoding.GetEncoding("utf8").GetString(m_io.ReadBytes(Len));
            }
            private ulong _len;
            private string _val;
            private PythonPickle m_root;
            private PythonPickle.Op m_parent;
            public ulong Len { get { return _len; } }
            public string Val { get { return _val; } }
            public PythonPickle M_Root { get { return m_root; } }
            public PythonPickle.Op M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Large signed integer, in the range -2**(8*255-1) to 2**(8*255-1)-1,
        /// encoded as two's complement.
        /// </summary>
        public partial class Long1 : KaitaiStruct
        {
            public static Long1 FromFile(string fileName)
            {
                return new Long1(new KaitaiStream(fileName));
            }

            public Long1(KaitaiStream p__io, PythonPickle.Op p__parent = null, PythonPickle p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = m_io.ReadU1();
                _val = m_io.ReadBytes(Len);
            }
            private byte _len;
            private byte[] _val;
            private PythonPickle m_root;
            private PythonPickle.Op m_parent;
            public byte Len { get { return _len; } }
            public byte[] Val { get { return _val; } }
            public PythonPickle M_Root { get { return m_root; } }
            public PythonPickle.Op M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Length prefixed string, between 0 and 2**64-1 bytes long.
        /// 
        /// Only a 64-bit build of Python would produce a pickle containing strings
        /// large enough to need this type. Such a pickle could not be unpickled on
        /// a 32-bit build of Python, because the string would be larger than
        /// `sys.maxsize`.
        /// </summary>
        public partial class Bytes8 : KaitaiStruct
        {
            public static Bytes8 FromFile(string fileName)
            {
                return new Bytes8(new KaitaiStream(fileName));
            }

            public Bytes8(KaitaiStream p__io, PythonPickle.Op p__parent = null, PythonPickle p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = m_io.ReadU8le();
                _val = m_io.ReadBytes(Len);
            }
            private ulong _len;
            private byte[] _val;
            private PythonPickle m_root;
            private PythonPickle.Op m_parent;
            public ulong Len { get { return _len; } }
            public byte[] Val { get { return _val; } }
            public PythonPickle M_Root { get { return m_root; } }
            public PythonPickle.Op M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Length prefixed byte string, between 0 and 255 bytes long.
        /// </summary>
        public partial class Bytes1 : KaitaiStruct
        {
            public static Bytes1 FromFile(string fileName)
            {
                return new Bytes1(new KaitaiStream(fileName));
            }

            public Bytes1(KaitaiStream p__io, PythonPickle.Op p__parent = null, PythonPickle p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = m_io.ReadU1();
                _val = m_io.ReadBytes(Len);
            }
            private byte _len;
            private byte[] _val;
            private PythonPickle m_root;
            private PythonPickle.Op m_parent;
            public byte Len { get { return _len; } }
            public byte[] Val { get { return _val; } }
            public PythonPickle M_Root { get { return m_root; } }
            public PythonPickle.Op M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Length prefixed string, between 0 and 2**32-1 bytes long
        /// </summary>
        public partial class Bytes4 : KaitaiStruct
        {
            public static Bytes4 FromFile(string fileName)
            {
                return new Bytes4(new KaitaiStream(fileName));
            }

            public Bytes4(KaitaiStream p__io, PythonPickle.Op p__parent = null, PythonPickle p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = m_io.ReadU4le();
                _val = m_io.ReadBytes(Len);
            }
            private uint _len;
            private byte[] _val;
            private PythonPickle m_root;
            private PythonPickle.Op m_parent;
            public uint Len { get { return _len; } }
            public byte[] Val { get { return _val; } }
            public PythonPickle M_Root { get { return m_root; } }
            public PythonPickle.Op M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Some opcodes take no argument, this empty type is used for them.
        /// </summary>
        public partial class NoArg : KaitaiStruct
        {
            public static NoArg FromFile(string fileName)
            {
                return new NoArg(new KaitaiStream(fileName));
            }

            public NoArg(KaitaiStream p__io, PythonPickle.Op p__parent = null, PythonPickle p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
            }
            private PythonPickle m_root;
            private PythonPickle.Op m_parent;
            public PythonPickle M_Root { get { return m_root; } }
            public PythonPickle.Op M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Unquoted string, does not contain string escapes.
        /// </summary>
        public partial class StringnlNoescape : KaitaiStruct
        {
            public static StringnlNoescape FromFile(string fileName)
            {
                return new StringnlNoescape(new KaitaiStream(fileName));
            }

            public StringnlNoescape(KaitaiStream p__io, KaitaiStruct p__parent = null, PythonPickle p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _val = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytesTerm(10, false, true, true));
            }
            private string _val;
            private PythonPickle m_root;
            private KaitaiStruct m_parent;
            public string Val { get { return _val; } }
            public PythonPickle M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Integer, encoded with the ASCII chracters [0-9-], followed by 'L'.
        /// </summary>
        public partial class DecimalnlLong : KaitaiStruct
        {
            public static DecimalnlLong FromFile(string fileName)
            {
                return new DecimalnlLong(new KaitaiStream(fileName));
            }

            public DecimalnlLong(KaitaiStream p__io, PythonPickle.Op p__parent = null, PythonPickle p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _val = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytesTerm(10, false, true, true));
            }
            private string _val;
            private PythonPickle m_root;
            private PythonPickle.Op m_parent;
            public string Val { get { return _val; } }
            public PythonPickle M_Root { get { return m_root; } }
            public PythonPickle.Op M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Length prefixed string, between 0 and 2**32-1 bytes long
        /// </summary>
        public partial class Unicodestring4 : KaitaiStruct
        {
            public static Unicodestring4 FromFile(string fileName)
            {
                return new Unicodestring4(new KaitaiStream(fileName));
            }

            public Unicodestring4(KaitaiStream p__io, PythonPickle.Op p__parent = null, PythonPickle p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = m_io.ReadU4le();
                _val = System.Text.Encoding.GetEncoding("utf8").GetString(m_io.ReadBytes(Len));
            }
            private uint _len;
            private string _val;
            private PythonPickle m_root;
            private PythonPickle.Op m_parent;
            public uint Len { get { return _len; } }
            public string Val { get { return _val; } }
            public PythonPickle M_Root { get { return m_root; } }
            public PythonPickle.Op M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Unquoted string, containing Python Unicode escapes.
        /// </summary>
        public partial class Unicodestringnl : KaitaiStruct
        {
            public static Unicodestringnl FromFile(string fileName)
            {
                return new Unicodestringnl(new KaitaiStream(fileName));
            }

            public Unicodestringnl(KaitaiStream p__io, PythonPickle.Op p__parent = null, PythonPickle p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _val = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytesTerm(10, false, true, true));
            }
            private string _val;
            private PythonPickle m_root;
            private PythonPickle.Op m_parent;
            public string Val { get { return _val; } }
            public PythonPickle M_Root { get { return m_root; } }
            public PythonPickle.Op M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Large signed integer, in the range -2**(8*2**32-1) to 2**(8*2**32-1)-1,
        /// encoded as two's complement.
        /// </summary>
        public partial class Long4 : KaitaiStruct
        {
            public static Long4 FromFile(string fileName)
            {
                return new Long4(new KaitaiStream(fileName));
            }

            public Long4(KaitaiStream p__io, PythonPickle.Op p__parent = null, PythonPickle p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = m_io.ReadU4le();
                _val = m_io.ReadBytes(Len);
            }
            private uint _len;
            private byte[] _val;
            private PythonPickle m_root;
            private PythonPickle.Op m_parent;
            public uint Len { get { return _len; } }
            public byte[] Val { get { return _val; } }
            public PythonPickle M_Root { get { return m_root; } }
            public PythonPickle.Op M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Length prefixed string, between 0 and 255 bytes long. Encoding is
        /// unspecified.
        /// 
        /// The default Python 2.x string type (`str`) is a sequence of bytes.
        /// These are pickled as `string1` or `string4`, when protocol == 2.
        /// The bytes are written directly, no explicit encoding is performed.
        /// 
        /// Python 3.x will not pickle an object as `string1` or `string4`.
        /// Instead, opcodes and types with a known encoding are used.
        /// When unpickling
        /// 
        /// - `pickle.Unpickler` objects default to ASCII, which can be overriden
        /// - `pickletools.dis` uses latin1, and cannot be overriden
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://github.com/python/cpython/blob/bb8071a4/Lib/pickle.py#L486-L495">Source</a>
        /// </remarks>
        public partial class String1 : KaitaiStruct
        {
            public static String1 FromFile(string fileName)
            {
                return new String1(new KaitaiStream(fileName));
            }

            public String1(KaitaiStream p__io, PythonPickle.Op p__parent = null, PythonPickle p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = m_io.ReadU1();
                _val = m_io.ReadBytes(Len);
            }
            private byte _len;
            private byte[] _val;
            private PythonPickle m_root;
            private PythonPickle.Op m_parent;
            public byte Len { get { return _len; } }
            public byte[] Val { get { return _val; } }
            public PythonPickle M_Root { get { return m_root; } }
            public PythonPickle.Op M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Length prefixed string, between 0 and 2**64-1 bytes long.
        /// 
        /// The contents are deserilised into a `bytearray` object.
        /// </summary>
        public partial class Bytearray8 : KaitaiStruct
        {
            public static Bytearray8 FromFile(string fileName)
            {
                return new Bytearray8(new KaitaiStream(fileName));
            }

            public Bytearray8(KaitaiStream p__io, PythonPickle.Op p__parent = null, PythonPickle p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = m_io.ReadU8le();
                _val = m_io.ReadBytes(Len);
            }
            private ulong _len;
            private byte[] _val;
            private PythonPickle m_root;
            private PythonPickle.Op m_parent;
            public ulong Len { get { return _len; } }
            public byte[] Val { get { return _val; } }
            public PythonPickle M_Root { get { return m_root; } }
            public PythonPickle.Op M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Integer or boolean, encoded with the ASCII characters [0-9-].
        /// 
        /// The values '00' and '01' encode the Python values `False` and `True`.
        /// Normally a value would not contain leading '0' characters.
        /// </summary>
        public partial class DecimalnlShort : KaitaiStruct
        {
            public static DecimalnlShort FromFile(string fileName)
            {
                return new DecimalnlShort(new KaitaiStream(fileName));
            }

            public DecimalnlShort(KaitaiStream p__io, PythonPickle.Op p__parent = null, PythonPickle p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _val = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytesTerm(10, false, true, true));
            }
            private string _val;
            private PythonPickle m_root;
            private PythonPickle.Op m_parent;
            public string Val { get { return _val; } }
            public PythonPickle M_Root { get { return m_root; } }
            public PythonPickle.Op M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Length prefixed string, between 0 and 255 bytes long
        /// </summary>
        public partial class Unicodestring1 : KaitaiStruct
        {
            public static Unicodestring1 FromFile(string fileName)
            {
                return new Unicodestring1(new KaitaiStream(fileName));
            }

            public Unicodestring1(KaitaiStream p__io, PythonPickle.Op p__parent = null, PythonPickle p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = m_io.ReadU4le();
                _val = System.Text.Encoding.GetEncoding("utf8").GetString(m_io.ReadBytes(Len));
            }
            private uint _len;
            private string _val;
            private PythonPickle m_root;
            private PythonPickle.Op m_parent;
            public uint Len { get { return _len; } }
            public string Val { get { return _val; } }
            public PythonPickle M_Root { get { return m_root; } }
            public PythonPickle.Op M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Quoted string, possibly containing Python string escapes.
        /// </summary>
        public partial class Stringnl : KaitaiStruct
        {
            public static Stringnl FromFile(string fileName)
            {
                return new Stringnl(new KaitaiStream(fileName));
            }

            public Stringnl(KaitaiStream p__io, PythonPickle.Op p__parent = null, PythonPickle p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _val = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytesTerm(10, false, true, true));
            }
            private string _val;
            private PythonPickle m_root;
            private PythonPickle.Op m_parent;
            public string Val { get { return _val; } }
            public PythonPickle M_Root { get { return m_root; } }
            public PythonPickle.Op M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Pair of unquoted, unescaped strings.
        /// </summary>
        public partial class StringnlNoescapePair : KaitaiStruct
        {
            public static StringnlNoescapePair FromFile(string fileName)
            {
                return new StringnlNoescapePair(new KaitaiStream(fileName));
            }

            public StringnlNoescapePair(KaitaiStream p__io, PythonPickle.Op p__parent = null, PythonPickle p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _val1 = new StringnlNoescape(m_io, this, m_root);
                _val2 = new StringnlNoescape(m_io, this, m_root);
            }
            private StringnlNoescape _val1;
            private StringnlNoescape _val2;
            private PythonPickle m_root;
            private PythonPickle.Op m_parent;
            public StringnlNoescape Val1 { get { return _val1; } }
            public StringnlNoescape Val2 { get { return _val2; } }
            public PythonPickle M_Root { get { return m_root; } }
            public PythonPickle.Op M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Length prefixed string, between 0 and 2**31-1 bytes long. Encoding is
        /// unspecified.
        /// 
        /// Although the len field is signed, any length &lt; 0 will raise an exception
        /// during unpickling.
        /// 
        /// See the documentation for `string1` for further detail about encodings.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://github.com/python/cpython/blob/bb8071a4/Lib/pickle.py#L486-L495">Source</a>
        /// </remarks>
        public partial class String4 : KaitaiStruct
        {
            public static String4 FromFile(string fileName)
            {
                return new String4(new KaitaiStream(fileName));
            }

            public String4(KaitaiStream p__io, PythonPickle.Op p__parent = null, PythonPickle p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = m_io.ReadS4le();
                _val = m_io.ReadBytes(Len);
            }
            private int _len;
            private byte[] _val;
            private PythonPickle m_root;
            private PythonPickle.Op m_parent;
            public int Len { get { return _len; } }
            public byte[] Val { get { return _val; } }
            public PythonPickle M_Root { get { return m_root; } }
            public PythonPickle.Op M_Parent { get { return m_parent; } }
        }
        public partial class Op : KaitaiStruct
        {
            public static Op FromFile(string fileName)
            {
                return new Op(new KaitaiStream(fileName));
            }

            public Op(KaitaiStream p__io, PythonPickle p__parent = null, PythonPickle p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _code = ((PythonPickle.Opcode) m_io.ReadU1());
                switch (Code) {
                case PythonPickle.Opcode.List: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Ext2: {
                    _arg = m_io.ReadU2le();
                    break;
                }
                case PythonPickle.Opcode.ReadonlyBuffer: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Stop: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Binunicode: {
                    _arg = new Unicodestring4(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Put: {
                    _arg = new DecimalnlShort(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Newfalse: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Long1: {
                    _arg = new Long1(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Unicode: {
                    _arg = new Unicodestringnl(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.EmptyList: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Mark: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Persid: {
                    _arg = new StringnlNoescape(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.StackGlobal: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Binint: {
                    _arg = m_io.ReadS4le();
                    break;
                }
                case PythonPickle.Opcode.Binput: {
                    _arg = m_io.ReadU1();
                    break;
                }
                case PythonPickle.Opcode.Binint1: {
                    _arg = m_io.ReadU1();
                    break;
                }
                case PythonPickle.Opcode.Binint2: {
                    _arg = m_io.ReadU2le();
                    break;
                }
                case PythonPickle.Opcode.Tuple: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.ShortBinstring: {
                    _arg = new String1(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.EmptySet: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.String: {
                    _arg = new Stringnl(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.EmptyDict: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Binget: {
                    _arg = m_io.ReadU1();
                    break;
                }
                case PythonPickle.Opcode.Append: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.PopMark: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Get: {
                    _arg = new DecimalnlShort(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Newobj: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Reduce: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Binbytes: {
                    _arg = new Bytes4(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.NextBuffer: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Binbytes8: {
                    _arg = new Bytes8(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Setitem: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Frame: {
                    _arg = m_io.ReadU8le();
                    break;
                }
                case PythonPickle.Opcode.Float: {
                    _arg = new Floatnl(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Binunicode8: {
                    _arg = new Unicodestring8(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Int: {
                    _arg = new DecimalnlShort(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.LongBinput: {
                    _arg = m_io.ReadU4le();
                    break;
                }
                case PythonPickle.Opcode.EmptyTuple: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Long: {
                    _arg = new DecimalnlLong(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Frozenset: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Global: {
                    _arg = new StringnlNoescapePair(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Obj: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Additems: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Tuple1: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Setitems: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.None: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Build: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Ext4: {
                    _arg = m_io.ReadU4le();
                    break;
                }
                case PythonPickle.Opcode.NewobjEx: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Binfloat: {
                    _arg = m_io.ReadF8be();
                    break;
                }
                case PythonPickle.Opcode.Dup: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Bytearray8: {
                    _arg = new Bytearray8(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Long4: {
                    _arg = new Long4(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.ShortBinunicode: {
                    _arg = new Unicodestring1(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Tuple3: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.ShortBinbytes: {
                    _arg = new Bytes1(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Ext1: {
                    _arg = m_io.ReadU1();
                    break;
                }
                case PythonPickle.Opcode.Dict: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Appends: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Inst: {
                    _arg = new StringnlNoescapePair(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Binpersid: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Memoize: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Proto: {
                    _arg = m_io.ReadU1();
                    break;
                }
                case PythonPickle.Opcode.Newtrue: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Binstring: {
                    _arg = new String4(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Tuple2: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.Pop: {
                    _arg = new NoArg(m_io, this, m_root);
                    break;
                }
                case PythonPickle.Opcode.LongBinget: {
                    _arg = m_io.ReadU4le();
                    break;
                }
                }
            }
            private Opcode _code;
            private object _arg;
            private PythonPickle m_root;
            private PythonPickle m_parent;

            /// <summary>
            /// Operation code that determines which action should be
            /// performed next by the Pickle Virtual Machine. Some opcodes
            /// are only available in later versions of the Pickle protocol.
            /// </summary>
            public Opcode Code { get { return _code; } }

            /// <summary>
            /// Optional argument for the operation. Data type and length
            /// are determined by the value of the opcode.
            /// </summary>
            public object Arg { get { return _arg; } }
            public PythonPickle M_Root { get { return m_root; } }
            public PythonPickle M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Double float, encoded with the ASCII characters [0-9.e+-], '-inf', 'inf',
        /// or 'nan'.
        /// </summary>
        public partial class Floatnl : KaitaiStruct
        {
            public static Floatnl FromFile(string fileName)
            {
                return new Floatnl(new KaitaiStream(fileName));
            }

            public Floatnl(KaitaiStream p__io, PythonPickle.Op p__parent = null, PythonPickle p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _val = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytesTerm(10, false, true, true));
            }
            private string _val;
            private PythonPickle m_root;
            private PythonPickle.Op m_parent;
            public string Val { get { return _val; } }
            public PythonPickle M_Root { get { return m_root; } }
            public PythonPickle.Op M_Parent { get { return m_parent; } }
        }
        private List<Op> _ops;
        private PythonPickle m_root;
        private KaitaiStruct m_parent;
        public List<Op> Ops { get { return _ops; } }
        public PythonPickle M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

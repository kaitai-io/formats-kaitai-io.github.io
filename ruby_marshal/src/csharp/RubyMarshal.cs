// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Ruby's Marshal module allows serialization and deserialization of
    /// many standard and arbitrary Ruby objects in a compact binary
    /// format. It is relatively fast, available in stdlibs standard and
    /// allows conservation of language-specific properties (such as symbols
    /// or encoding-aware strings).
    /// 
    /// Feature-wise, it is comparable to other language-specific
    /// implementations, such as:
    /// 
    /// * Java's
    ///   [Serializable](https://docs.oracle.com/javase/8/docs/api/java/io/Serializable.html)
    /// * .NET
    ///   [BinaryFormatter](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.serialization.formatters.binary.binaryformatter)
    /// * Python's
    ///   [marshal](https://docs.python.org/3/library/marshal.html),
    ///   [pickle](https://docs.python.org/3/library/pickle.html) and
    ///   [shelve](https://docs.python.org/3/library/shelve.html)
    /// 
    /// From internal perspective, serialized stream consists of a simple
    /// magic header and a record.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Stream+Format">Source</a>
    /// </remarks>
    public partial class RubyMarshal : KaitaiStruct
    {
        public static RubyMarshal FromFile(string fileName)
        {
            return new RubyMarshal(new KaitaiStream(fileName));
        }


        public enum Codes
        {
            RubyString = 34,
            ConstNil = 48,
            RubySymbol = 58,
            RubySymbolLink = 59,
            ConstFalse = 70,
            InstanceVar = 73,
            RubyStruct = 83,
            ConstTrue = 84,
            RubyArray = 91,
            PackedInt = 105,
            Bignum = 108,
            RubyHash = 123,
        }
        public RubyMarshal(KaitaiStream p__io, KaitaiStruct p__parent = null, RubyMarshal p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _version = m_io.EnsureFixedContents(new byte[] { 4, 8 });
            _records = new Record(m_io, this, m_root);
        }
        public partial class RubyArray : KaitaiStruct
        {
            public static RubyArray FromFile(string fileName)
            {
                return new RubyArray(new KaitaiStream(fileName));
            }

            public RubyArray(KaitaiStream p__io, RubyMarshal.Record p__parent = null, RubyMarshal p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _numElements = new PackedInt(m_io, this, m_root);
                _elements = new List<Record>((int) (NumElements.Value));
                for (var i = 0; i < NumElements.Value; i++)
                {
                    _elements.Add(new Record(m_io, this, m_root));
                }
            }
            private PackedInt _numElements;
            private List<Record> _elements;
            private RubyMarshal m_root;
            private RubyMarshal.Record m_parent;
            public PackedInt NumElements { get { return _numElements; } }
            public List<Record> Elements { get { return _elements; } }
            public RubyMarshal M_Root { get { return m_root; } }
            public RubyMarshal.Record M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Bignum">Source</a>
        /// </remarks>
        public partial class Bignum : KaitaiStruct
        {
            public static Bignum FromFile(string fileName)
            {
                return new Bignum(new KaitaiStream(fileName));
            }

            public Bignum(KaitaiStream p__io, RubyMarshal.Record p__parent = null, RubyMarshal p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _sign = m_io.ReadU1();
                _lenDiv2 = new PackedInt(m_io, this, m_root);
                _body = m_io.ReadBytes((LenDiv2.Value * 2));
            }
            private byte _sign;
            private PackedInt _lenDiv2;
            private byte[] _body;
            private RubyMarshal m_root;
            private RubyMarshal.Record m_parent;

            /// <summary>
            /// A single byte containing `+` for a positive value or `-` for a negative value.
            /// </summary>
            public byte Sign { get { return _sign; } }

            /// <summary>
            /// Length of bignum body, divided by 2.
            /// </summary>
            public PackedInt LenDiv2 { get { return _lenDiv2; } }

            /// <summary>
            /// Bytes that represent the number, see ruby-lang.org docs for reconstruction algorithm.
            /// </summary>
            public byte[] Body { get { return _body; } }
            public RubyMarshal M_Root { get { return m_root; } }
            public RubyMarshal.Record M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Struct">Source</a>
        /// </remarks>
        public partial class RubyStruct : KaitaiStruct
        {
            public static RubyStruct FromFile(string fileName)
            {
                return new RubyStruct(new KaitaiStream(fileName));
            }

            public RubyStruct(KaitaiStream p__io, RubyMarshal.Record p__parent = null, RubyMarshal p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _name = new Record(m_io, this, m_root);
                _numMembers = new PackedInt(m_io, this, m_root);
                _members = new List<Pair>((int) (NumMembers.Value));
                for (var i = 0; i < NumMembers.Value; i++)
                {
                    _members.Add(new Pair(m_io, this, m_root));
                }
            }
            private Record _name;
            private PackedInt _numMembers;
            private List<Pair> _members;
            private RubyMarshal m_root;
            private RubyMarshal.Record m_parent;

            /// <summary>
            /// Symbol containing the name of the struct.
            /// </summary>
            public Record Name { get { return _name; } }

            /// <summary>
            /// Number of members in a struct
            /// </summary>
            public PackedInt NumMembers { get { return _numMembers; } }
            public List<Pair> Members { get { return _members; } }
            public RubyMarshal M_Root { get { return m_root; } }
            public RubyMarshal.Record M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Symbols+and+Byte+Sequence">Source</a>
        /// </remarks>
        public partial class RubySymbol : KaitaiStruct
        {
            public static RubySymbol FromFile(string fileName)
            {
                return new RubySymbol(new KaitaiStream(fileName));
            }

            public RubySymbol(KaitaiStream p__io, RubyMarshal.Record p__parent = null, RubyMarshal p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = new PackedInt(m_io, this, m_root);
                _name = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(Len.Value));
            }
            private PackedInt _len;
            private string _name;
            private RubyMarshal m_root;
            private RubyMarshal.Record m_parent;
            public PackedInt Len { get { return _len; } }
            public string Name { get { return _name; } }
            public RubyMarshal M_Root { get { return m_root; } }
            public RubyMarshal.Record M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Ruby uses sophisticated system to pack integers: first `code`
        /// byte either determines packing scheme or carries encoded
        /// immediate value (thus allowing smaller values from -123 to 122
        /// (inclusive) to take only one byte. There are 11 encoding schemes
        /// in total:
        /// 
        /// * 0 is encoded specially (as 0)
        /// * 1..122 are encoded as immediate value with a shift
        /// * 123..255 are encoded with code of 0x01 and 1 extra byte
        /// * 0x100..0xffff are encoded with code of 0x02 and 2 extra bytes
        /// * 0x10000..0xffffff are encoded with code of 0x03 and 3 extra
        ///   bytes
        /// * 0x1000000..0xffffffff are encoded with code of 0x04 and 4
        ///   extra bytes
        /// * -123..-1 are encoded as immediate value with another shift
        /// * -256..-124 are encoded with code of 0xff and 1 extra byte
        /// * -0x10000..-257 are encoded with code of 0xfe and 2 extra bytes
        /// * -0x1000000..0x10001 are encoded with code of 0xfd and 3 extra
        ///    bytes
        /// * -0x40000000..-0x1000001 are encoded with code of 0xfc and 4
        ///    extra bytes
        /// 
        /// Values beyond that are serialized as bignum (even if they
        /// technically might be not Bignum class in Ruby implementation,
        /// i.e. if they fit into 64 bits on a 64-bit platform).
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Fixnum+and+long">Source</a>
        /// </remarks>
        public partial class PackedInt : KaitaiStruct
        {
            public static PackedInt FromFile(string fileName)
            {
                return new PackedInt(new KaitaiStream(fileName));
            }

            public PackedInt(KaitaiStream p__io, KaitaiStruct p__parent = null, RubyMarshal p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_isImmediate = false;
                f_value = false;
                _read();
            }
            private void _read()
            {
                _code = m_io.ReadU1();
                switch (Code) {
                case 4: {
                    _encoded = m_io.ReadU4le();
                    break;
                }
                case 1: {
                    _encoded = m_io.ReadU1();
                    break;
                }
                case 252: {
                    _encoded = m_io.ReadU4le();
                    break;
                }
                case 253: {
                    _encoded = m_io.ReadU2le();
                    break;
                }
                case 3: {
                    _encoded = m_io.ReadU2le();
                    break;
                }
                case 2: {
                    _encoded = m_io.ReadU2le();
                    break;
                }
                case 255: {
                    _encoded = m_io.ReadU1();
                    break;
                }
                case 254: {
                    _encoded = m_io.ReadU2le();
                    break;
                }
                }
                switch (Code) {
                case 3: {
                    _encoded2 = m_io.ReadU1();
                    break;
                }
                case 253: {
                    _encoded2 = m_io.ReadU1();
                    break;
                }
                }
            }
            private bool f_isImmediate;
            private bool _isImmediate;
            public bool IsImmediate
            {
                get
                {
                    if (f_isImmediate)
                        return _isImmediate;
                    _isImmediate = (bool) ( ((Code > 4) && (Code < 252)) );
                    f_isImmediate = true;
                    return _isImmediate;
                }
            }
            private bool f_value;
            private int _value;
            public int Value
            {
                get
                {
                    if (f_value)
                        return _value;
                    _value = (int) ((IsImmediate ? (Code < 128 ? (Code - 5) : (4 - (~(Code) & 127))) : (Code == 0 ? 0 : (Code == 255 ? (Encoded - 256) : (Code == 254 ? (Encoded - 65536) : (Code == 253 ? (((Encoded2 << 16) | Encoded) - 16777216) : (Code == 3 ? ((Encoded2 << 16) | Encoded) : Encoded)))))));
                    f_value = true;
                    return _value;
                }
            }
            private byte _code;
            private uint _encoded;
            private byte _encoded2;
            private RubyMarshal m_root;
            private KaitaiStruct m_parent;
            public byte Code { get { return _code; } }
            public uint Encoded { get { return _encoded; } }

            /// <summary>
            /// One extra byte for 3-byte integers (0x03 and 0xfd), as
            /// there is no standard `u3` type in KS.
            /// </summary>
            public byte Encoded2 { get { return _encoded2; } }
            public RubyMarshal M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class Pair : KaitaiStruct
        {
            public static Pair FromFile(string fileName)
            {
                return new Pair(new KaitaiStream(fileName));
            }

            public Pair(KaitaiStream p__io, KaitaiStruct p__parent = null, RubyMarshal p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _key = new Record(m_io, this, m_root);
                _value = new Record(m_io, this, m_root);
            }
            private Record _key;
            private Record _value;
            private RubyMarshal m_root;
            private KaitaiStruct m_parent;
            public Record Key { get { return _key; } }
            public Record Value { get { return _value; } }
            public RubyMarshal M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Instance+Variables">Source</a>
        /// </remarks>
        public partial class InstanceVar : KaitaiStruct
        {
            public static InstanceVar FromFile(string fileName)
            {
                return new InstanceVar(new KaitaiStream(fileName));
            }

            public InstanceVar(KaitaiStream p__io, RubyMarshal.Record p__parent = null, RubyMarshal p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _obj = new Record(m_io, this, m_root);
                _numVars = new PackedInt(m_io, this, m_root);
                _vars = new List<Pair>((int) (NumVars.Value));
                for (var i = 0; i < NumVars.Value; i++)
                {
                    _vars.Add(new Pair(m_io, this, m_root));
                }
            }
            private Record _obj;
            private PackedInt _numVars;
            private List<Pair> _vars;
            private RubyMarshal m_root;
            private RubyMarshal.Record m_parent;
            public Record Obj { get { return _obj; } }
            public PackedInt NumVars { get { return _numVars; } }
            public List<Pair> Vars { get { return _vars; } }
            public RubyMarshal M_Root { get { return m_root; } }
            public RubyMarshal.Record M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Each record starts with a single byte that determines its type
        /// (`code`) and contents. If necessary, additional info as parsed
        /// as `body`, to be determined by `code`.
        /// </summary>
        public partial class Record : KaitaiStruct
        {
            public static Record FromFile(string fileName)
            {
                return new Record(new KaitaiStream(fileName));
            }

            public Record(KaitaiStream p__io, KaitaiStruct p__parent = null, RubyMarshal p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _code = ((RubyMarshal.Codes) m_io.ReadU1());
                switch (Code) {
                case RubyMarshal.Codes.PackedInt: {
                    _body = new PackedInt(m_io, this, m_root);
                    break;
                }
                case RubyMarshal.Codes.Bignum: {
                    _body = new Bignum(m_io, this, m_root);
                    break;
                }
                case RubyMarshal.Codes.RubyArray: {
                    _body = new RubyArray(m_io, this, m_root);
                    break;
                }
                case RubyMarshal.Codes.RubySymbolLink: {
                    _body = new PackedInt(m_io, this, m_root);
                    break;
                }
                case RubyMarshal.Codes.RubyStruct: {
                    _body = new RubyStruct(m_io, this, m_root);
                    break;
                }
                case RubyMarshal.Codes.RubyString: {
                    _body = new RubyString(m_io, this, m_root);
                    break;
                }
                case RubyMarshal.Codes.InstanceVar: {
                    _body = new InstanceVar(m_io, this, m_root);
                    break;
                }
                case RubyMarshal.Codes.RubyHash: {
                    _body = new RubyHash(m_io, this, m_root);
                    break;
                }
                case RubyMarshal.Codes.RubySymbol: {
                    _body = new RubySymbol(m_io, this, m_root);
                    break;
                }
                }
            }
            private Codes _code;
            private KaitaiStruct _body;
            private RubyMarshal m_root;
            private KaitaiStruct m_parent;
            public Codes Code { get { return _code; } }
            public KaitaiStruct Body { get { return _body; } }
            public RubyMarshal M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Hash+and+Hash+with+Default+Value">Source</a>
        /// </remarks>
        public partial class RubyHash : KaitaiStruct
        {
            public static RubyHash FromFile(string fileName)
            {
                return new RubyHash(new KaitaiStream(fileName));
            }

            public RubyHash(KaitaiStream p__io, RubyMarshal.Record p__parent = null, RubyMarshal p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _numPairs = new PackedInt(m_io, this, m_root);
                _pairs = new List<Pair>((int) (NumPairs.Value));
                for (var i = 0; i < NumPairs.Value; i++)
                {
                    _pairs.Add(new Pair(m_io, this, m_root));
                }
            }
            private PackedInt _numPairs;
            private List<Pair> _pairs;
            private RubyMarshal m_root;
            private RubyMarshal.Record m_parent;
            public PackedInt NumPairs { get { return _numPairs; } }
            public List<Pair> Pairs { get { return _pairs; } }
            public RubyMarshal M_Root { get { return m_root; } }
            public RubyMarshal.Record M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-String">Source</a>
        /// </remarks>
        public partial class RubyString : KaitaiStruct
        {
            public static RubyString FromFile(string fileName)
            {
                return new RubyString(new KaitaiStream(fileName));
            }

            public RubyString(KaitaiStream p__io, RubyMarshal.Record p__parent = null, RubyMarshal p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = new PackedInt(m_io, this, m_root);
                _body = m_io.ReadBytes(Len.Value);
            }
            private PackedInt _len;
            private byte[] _body;
            private RubyMarshal m_root;
            private RubyMarshal.Record m_parent;
            public PackedInt Len { get { return _len; } }
            public byte[] Body { get { return _body; } }
            public RubyMarshal M_Root { get { return m_root; } }
            public RubyMarshal.Record M_Parent { get { return m_parent; } }
        }
        private byte[] _version;
        private Record _records;
        private RubyMarshal m_root;
        private KaitaiStruct m_parent;
        public byte[] Version { get { return _version; } }
        public Record Records { get { return _records; } }
        public RubyMarshal M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

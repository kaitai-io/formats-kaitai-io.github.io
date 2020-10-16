// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// BSON, short for Binary JSON, is a binary-encoded serialization of JSON-like documents. Like JSON, BSON supports the embedding of documents and arrays within other documents and arrays. BSON also contains extensions that allow representation of data types that are not part of the JSON spec. For example, BSON has a Date type and a BinData type. BSON can be compared to binary interchange formats, like Protocol Buffers. BSON is more &quot;schemaless&quot; than Protocol Buffers, which can give it an advantage in flexibility but also a slight disadvantage in space efficiency (BSON has overhead for field names within the serialized data). BSON was designed to have the following three characteristics:
    ///   * Lightweight. Keeping spatial overhead to a minimum is important for any data representation format, especially when used over the network.
    ///   * Traversable. BSON is designed to be traversed easily. This is a vital property in its role as the primary data representation for MongoDB.
    ///   * Efficient. Encoding data to BSON and decoding from BSON can be performed very quickly in most languages due to the use of C data types.
    /// </summary>
    public partial class Bson : KaitaiStruct
    {
        public static Bson FromFile(string fileName)
        {
            return new Bson(new KaitaiStream(fileName));
        }

        public Bson(KaitaiStream p__io, KaitaiStruct p__parent = null, Bson p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _len = m_io.ReadS4le();
            __raw_fields = m_io.ReadBytes((Len - 5));
            var io___raw_fields = new KaitaiStream(__raw_fields);
            _fields = new ElementsList(io___raw_fields, this, m_root);
            _terminator = m_io.ReadBytes(1);
            if (!((KaitaiStream.ByteArrayCompare(Terminator, new byte[] { 0 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 0 }, Terminator, M_Io, "/seq/2");
            }
        }

        /// <summary>
        /// Special internal type used by MongoDB replication and sharding. First 4 bytes are an increment, second 4 are a timestamp.
        /// </summary>
        public partial class Timestamp : KaitaiStruct
        {
            public static Timestamp FromFile(string fileName)
            {
                return new Timestamp(new KaitaiStream(fileName));
            }

            public Timestamp(KaitaiStream p__io, Bson.Element p__parent = null, Bson p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _increment = m_io.ReadU4le();
                _timestamp = m_io.ReadU4le();
            }
            private uint _increment;
            private uint _timestamp;
            private Bson m_root;
            private Bson.Element m_parent;
            public uint Increment { get { return _increment; } }
            public uint Timestamp { get { return _timestamp; } }
            public Bson M_Root { get { return m_root; } }
            public Bson.Element M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// The BSON &quot;binary&quot; or &quot;BinData&quot; datatype is used to represent arrays of bytes. It is somewhat analogous to the Java notion of a ByteArray. BSON binary values have a subtype. This is used to indicate what kind of data is in the byte array. Subtypes from zero to 127 are predefined or reserved. Subtypes from 128-255 are user-defined.
        /// </summary>
        public partial class BinData : KaitaiStruct
        {
            public static BinData FromFile(string fileName)
            {
                return new BinData(new KaitaiStream(fileName));
            }


            public enum Subtype
            {
                Generic = 0,
                Function = 1,
                ByteArrayDeprecated = 2,
                UuidDeprecated = 3,
                Uuid = 4,
                Md5 = 5,
                Custom = 128,
            }
            public BinData(KaitaiStream p__io, Bson.Element p__parent = null, Bson p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = m_io.ReadS4le();
                _subtype = ((Subtype) m_io.ReadU1());
                switch (Subtype) {
                case Subtype.ByteArrayDeprecated: {
                    __raw_content = m_io.ReadBytes(Len);
                    var io___raw_content = new KaitaiStream(__raw_content);
                    _content = new ByteArrayDeprecated(io___raw_content, this, m_root);
                    break;
                }
                default: {
                    _content = m_io.ReadBytes(Len);
                    break;
                }
                }
            }

            /// <summary>
            /// The BSON &quot;binary&quot; or &quot;BinData&quot; datatype is used to represent arrays of bytes. It is somewhat analogous to the Java notion of a ByteArray. BSON binary values have a subtype. This is used to indicate what kind of data is in the byte array. Subtypes from zero to 127 are predefined or reserved. Subtypes from 128-255 are user-defined.
            /// </summary>
            public partial class ByteArrayDeprecated : KaitaiStruct
            {
                public static ByteArrayDeprecated FromFile(string fileName)
                {
                    return new ByteArrayDeprecated(new KaitaiStream(fileName));
                }

                public ByteArrayDeprecated(KaitaiStream p__io, Bson.BinData p__parent = null, Bson p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _len = m_io.ReadS4le();
                    _content = m_io.ReadBytes(Len);
                }
                private int _len;
                private byte[] _content;
                private Bson m_root;
                private Bson.BinData m_parent;
                public int Len { get { return _len; } }
                public byte[] Content { get { return _content; } }
                public Bson M_Root { get { return m_root; } }
                public Bson.BinData M_Parent { get { return m_parent; } }
            }
            private int _len;
            private Subtype _subtype;
            private object _content;
            private Bson m_root;
            private Bson.Element m_parent;
            private byte[] __raw_content;
            public int Len { get { return _len; } }
            public Subtype Subtype { get { return _subtype; } }
            public object Content { get { return _content; } }
            public Bson M_Root { get { return m_root; } }
            public Bson.Element M_Parent { get { return m_parent; } }
            public byte[] M_RawContent { get { return __raw_content; } }
        }
        public partial class ElementsList : KaitaiStruct
        {
            public static ElementsList FromFile(string fileName)
            {
                return new ElementsList(new KaitaiStream(fileName));
            }

            public ElementsList(KaitaiStream p__io, Bson p__parent = null, Bson p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _elements = new List<Element>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _elements.Add(new Element(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<Element> _elements;
            private Bson m_root;
            private Bson m_parent;
            public List<Element> Elements { get { return _elements; } }
            public Bson M_Root { get { return m_root; } }
            public Bson M_Parent { get { return m_parent; } }
        }
        public partial class Cstring : KaitaiStruct
        {
            public static Cstring FromFile(string fileName)
            {
                return new Cstring(new KaitaiStream(fileName));
            }

            public Cstring(KaitaiStream p__io, KaitaiStruct p__parent = null, Bson p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _str = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesTerm(0, false, true, true));
            }
            private string _str;
            private Bson m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// MUST NOT contain '\x00', hence it is not full UTF-8.
            /// </summary>
            public string Str { get { return _str; } }
            public Bson M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class String : KaitaiStruct
        {
            public static String FromFile(string fileName)
            {
                return new String(new KaitaiStream(fileName));
            }

            public String(KaitaiStream p__io, KaitaiStruct p__parent = null, Bson p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _len = m_io.ReadS4le();
                _str = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes((Len - 1)));
                _terminator = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(Terminator, new byte[] { 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0 }, Terminator, M_Io, "/types/string/seq/2");
                }
            }
            private int _len;
            private string _str;
            private byte[] _terminator;
            private Bson m_root;
            private KaitaiStruct m_parent;
            public int Len { get { return _len; } }
            public string Str { get { return _str; } }
            public byte[] Terminator { get { return _terminator; } }
            public Bson M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class Element : KaitaiStruct
        {
            public static Element FromFile(string fileName)
            {
                return new Element(new KaitaiStream(fileName));
            }


            public enum BsonType
            {
                MinKey = -1,
                EndOfObject = 0,
                NumberDouble = 1,
                String = 2,
                Document = 3,
                Array = 4,
                BinData = 5,
                Undefined = 6,
                ObjectId = 7,
                Boolean = 8,
                UtcDatetime = 9,
                JstNull = 10,
                RegEx = 11,
                DbPointer = 12,
                Javascript = 13,
                Symbol = 14,
                CodeWithScope = 15,
                NumberInt = 16,
                Timestamp = 17,
                NumberLong = 18,
                NumberDecimal = 19,
                MaxKey = 127,
            }
            public Element(KaitaiStream p__io, Bson.ElementsList p__parent = null, Bson p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _typeByte = ((BsonType) m_io.ReadU1());
                _name = new Cstring(m_io, this, m_root);
                switch (TypeByte) {
                case BsonType.CodeWithScope: {
                    _content = new CodeWithScope(m_io, this, m_root);
                    break;
                }
                case BsonType.RegEx: {
                    _content = new RegEx(m_io, this, m_root);
                    break;
                }
                case BsonType.NumberDouble: {
                    _content = m_io.ReadF8le();
                    break;
                }
                case BsonType.Symbol: {
                    _content = new String(m_io, this, m_root);
                    break;
                }
                case BsonType.Timestamp: {
                    _content = new Timestamp(m_io, this, m_root);
                    break;
                }
                case BsonType.NumberInt: {
                    _content = m_io.ReadS4le();
                    break;
                }
                case BsonType.Document: {
                    _content = new Bson(m_io);
                    break;
                }
                case BsonType.ObjectId: {
                    _content = new ObjectId(m_io, this, m_root);
                    break;
                }
                case BsonType.Javascript: {
                    _content = new String(m_io, this, m_root);
                    break;
                }
                case BsonType.UtcDatetime: {
                    _content = m_io.ReadS8le();
                    break;
                }
                case BsonType.Boolean: {
                    _content = m_io.ReadU1();
                    break;
                }
                case BsonType.NumberLong: {
                    _content = m_io.ReadS8le();
                    break;
                }
                case BsonType.BinData: {
                    _content = new BinData(m_io, this, m_root);
                    break;
                }
                case BsonType.String: {
                    _content = new String(m_io, this, m_root);
                    break;
                }
                case BsonType.DbPointer: {
                    _content = new DbPointer(m_io, this, m_root);
                    break;
                }
                case BsonType.Array: {
                    _content = new Bson(m_io);
                    break;
                }
                case BsonType.NumberDecimal: {
                    _content = new F16(m_io, this, m_root);
                    break;
                }
                }
            }
            private BsonType _typeByte;
            private Cstring _name;
            private object _content;
            private Bson m_root;
            private Bson.ElementsList m_parent;
            public BsonType TypeByte { get { return _typeByte; } }
            public Cstring Name { get { return _name; } }
            public object Content { get { return _content; } }
            public Bson M_Root { get { return m_root; } }
            public Bson.ElementsList M_Parent { get { return m_parent; } }
        }
        public partial class DbPointer : KaitaiStruct
        {
            public static DbPointer FromFile(string fileName)
            {
                return new DbPointer(new KaitaiStream(fileName));
            }

            public DbPointer(KaitaiStream p__io, Bson.Element p__parent = null, Bson p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _namespace = new String(m_io, this, m_root);
                _id = new ObjectId(m_io, this, m_root);
            }
            private String _namespace;
            private ObjectId _id;
            private Bson m_root;
            private Bson.Element m_parent;
            public String Namespace { get { return _namespace; } }
            public ObjectId Id { get { return _id; } }
            public Bson M_Root { get { return m_root; } }
            public Bson.Element M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Implements unsigned 24-bit (3 byte) integer.
        /// </summary>
        public partial class U3 : KaitaiStruct
        {
            public static U3 FromFile(string fileName)
            {
                return new U3(new KaitaiStream(fileName));
            }

            public U3(KaitaiStream p__io, Bson.ObjectId p__parent = null, Bson p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_value = false;
                _read();
            }
            private void _read()
            {
                _b1 = m_io.ReadU1();
                _b2 = m_io.ReadU1();
                _b3 = m_io.ReadU1();
            }
            private bool f_value;
            private int _value;
            public int Value
            {
                get
                {
                    if (f_value)
                        return _value;
                    _value = (int) (((B1 | (B2 << 8)) | (B3 << 16)));
                    f_value = true;
                    return _value;
                }
            }
            private byte _b1;
            private byte _b2;
            private byte _b3;
            private Bson m_root;
            private Bson.ObjectId m_parent;
            public byte B1 { get { return _b1; } }
            public byte B2 { get { return _b2; } }
            public byte B3 { get { return _b3; } }
            public Bson M_Root { get { return m_root; } }
            public Bson.ObjectId M_Parent { get { return m_parent; } }
        }
        public partial class CodeWithScope : KaitaiStruct
        {
            public static CodeWithScope FromFile(string fileName)
            {
                return new CodeWithScope(new KaitaiStream(fileName));
            }

            public CodeWithScope(KaitaiStream p__io, Bson.Element p__parent = null, Bson p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _id = m_io.ReadS4le();
                _source = new String(m_io, this, m_root);
                _scope = new Bson(m_io);
            }
            private int _id;
            private String _source;
            private Bson _scope;
            private Bson m_root;
            private Bson.Element m_parent;
            public int Id { get { return _id; } }
            public String Source { get { return _source; } }

            /// <summary>
            /// mapping from identifiers to values, representing the scope in which the string should be evaluated.
            /// </summary>
            public Bson Scope { get { return _scope; } }
            public Bson M_Root { get { return m_root; } }
            public Bson.Element M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// 128-bit IEEE 754-2008 decimal floating point
        /// </summary>
        public partial class F16 : KaitaiStruct
        {
            public static F16 FromFile(string fileName)
            {
                return new F16(new KaitaiStream(fileName));
            }

            public F16(KaitaiStream p__io, Bson.Element p__parent = null, Bson p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _str = m_io.ReadBitsIntBe(1) != 0;
                _exponent = m_io.ReadBitsIntBe(15);
                _significandHi = m_io.ReadBitsIntBe(49);
                m_io.AlignToByte();
                _significandLo = m_io.ReadU8le();
            }
            private bool _str;
            private ulong _exponent;
            private ulong _significandHi;
            private ulong _significandLo;
            private Bson m_root;
            private Bson.Element m_parent;
            public bool Str { get { return _str; } }
            public ulong Exponent { get { return _exponent; } }
            public ulong SignificandHi { get { return _significandHi; } }
            public ulong SignificandLo { get { return _significandLo; } }
            public Bson M_Root { get { return m_root; } }
            public Bson.Element M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// https://docs.mongodb.com/manual/reference/method/ObjectId/
        /// </summary>
        public partial class ObjectId : KaitaiStruct
        {
            public static ObjectId FromFile(string fileName)
            {
                return new ObjectId(new KaitaiStream(fileName));
            }

            public ObjectId(KaitaiStream p__io, KaitaiStruct p__parent = null, Bson p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _epochTime = m_io.ReadU4le();
                _machineId = new U3(m_io, this, m_root);
                _processId = m_io.ReadU2le();
                _counter = new U3(m_io, this, m_root);
            }
            private uint _epochTime;
            private U3 _machineId;
            private ushort _processId;
            private U3 _counter;
            private Bson m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// seconds since the Unix epoch
            /// </summary>
            public uint EpochTime { get { return _epochTime; } }
            public U3 MachineId { get { return _machineId; } }
            public ushort ProcessId { get { return _processId; } }

            /// <summary>
            /// counter, starting with a random value.
            /// </summary>
            public U3 Counter { get { return _counter; } }
            public Bson M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class RegEx : KaitaiStruct
        {
            public static RegEx FromFile(string fileName)
            {
                return new RegEx(new KaitaiStream(fileName));
            }

            public RegEx(KaitaiStream p__io, Bson.Element p__parent = null, Bson p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _pattern = new Cstring(m_io, this, m_root);
                _options = new Cstring(m_io, this, m_root);
            }
            private Cstring _pattern;
            private Cstring _options;
            private Bson m_root;
            private Bson.Element m_parent;
            public Cstring Pattern { get { return _pattern; } }
            public Cstring Options { get { return _options; } }
            public Bson M_Root { get { return m_root; } }
            public Bson.Element M_Parent { get { return m_parent; } }
        }
        private int _len;
        private ElementsList _fields;
        private byte[] _terminator;
        private Bson m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_fields;

        /// <summary>
        /// Total number of bytes comprising the document.
        /// </summary>
        public int Len { get { return _len; } }
        public ElementsList Fields { get { return _fields; } }
        public byte[] Terminator { get { return _terminator; } }
        public Bson M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawFields { get { return __raw_fields; } }
    }
}

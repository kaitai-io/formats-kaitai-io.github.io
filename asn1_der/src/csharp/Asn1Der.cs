// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// ASN.1 (Abstract Syntax Notation One) DER (Distinguished Encoding
    /// Rules) is a standard-backed serialization scheme used in many
    /// different use-cases. Particularly popular usage scenarios are X.509
    /// certificates and some telecommunication / networking protocols.
    /// 
    /// DER is self-describing encoding scheme which allows representation
    /// of simple, atomic data elements, such as strings and numbers, and
    /// complex objects, such as sequences of other elements.
    /// 
    /// DER is a subset of BER (Basic Encoding Rules), with an emphasis on
    /// being non-ambiguous: there's always exactly one canonical way to
    /// encode a data structure defined in terms of ASN.1 using DER.
    /// 
    /// This spec allows full parsing of format syntax, but to understand
    /// the semantics, one would typically require a dictionary of Object
    /// Identifiers (OIDs), to match OID bodies against some human-readable
    /// list of constants. OIDs are covered by many different standards,
    /// so typically it's simpler to use a pre-compiled list of them, such
    /// as:
    /// 
    /// * https://www.cs.auckland.ac.nz/~pgut001/dumpasn1.cfg
    /// * http://oid-info.com/
    /// * https://www.alvestrand.no/objectid/top.html
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://www.itu.int/itu-t/recommendations/rec.aspx?rec=12483&amp;lang=en">Source</a>
    /// </remarks>
    public partial class Asn1Der : KaitaiStruct
    {
        public static Asn1Der FromFile(string fileName)
        {
            return new Asn1Der(new KaitaiStream(fileName));
        }


        public enum TypeTag
        {
            EndOfContent = 0,
            Boolean = 1,
            Integer = 2,
            BitString = 3,
            OctetString = 4,
            NullValue = 5,
            ObjectId = 6,
            ObjectDescriptor = 7,
            External = 8,
            Real = 9,
            Enumerated = 10,
            EmbeddedPdv = 11,
            Utf8string = 12,
            RelativeOid = 13,
            Sequence10 = 16,
            PrintableString = 19,
            Ia5string = 22,
            Sequence30 = 48,
            Set = 49,
        }
        public Asn1Der(KaitaiStream p__io, KaitaiStruct p__parent = null, Asn1Der p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _typeTag = ((TypeTag) m_io.ReadU1());
            _len = new LenEncoded(m_io, this, m_root);
            switch (TypeTag) {
            case TypeTag.PrintableString: {
                __raw_body = m_io.ReadBytes(Len.Result);
                var io___raw_body = new KaitaiStream(__raw_body);
                _body = new BodyPrintableString(io___raw_body, this, m_root);
                break;
            }
            case TypeTag.Sequence10: {
                __raw_body = m_io.ReadBytes(Len.Result);
                var io___raw_body = new KaitaiStream(__raw_body);
                _body = new BodySequence(io___raw_body, this, m_root);
                break;
            }
            case TypeTag.Set: {
                __raw_body = m_io.ReadBytes(Len.Result);
                var io___raw_body = new KaitaiStream(__raw_body);
                _body = new BodySequence(io___raw_body, this, m_root);
                break;
            }
            case TypeTag.Sequence30: {
                __raw_body = m_io.ReadBytes(Len.Result);
                var io___raw_body = new KaitaiStream(__raw_body);
                _body = new BodySequence(io___raw_body, this, m_root);
                break;
            }
            case TypeTag.Utf8string: {
                __raw_body = m_io.ReadBytes(Len.Result);
                var io___raw_body = new KaitaiStream(__raw_body);
                _body = new BodyUtf8string(io___raw_body, this, m_root);
                break;
            }
            case TypeTag.ObjectId: {
                __raw_body = m_io.ReadBytes(Len.Result);
                var io___raw_body = new KaitaiStream(__raw_body);
                _body = new BodyObjectId(io___raw_body, this, m_root);
                break;
            }
            default: {
                _body = m_io.ReadBytes(Len.Result);
                break;
            }
            }
        }
        public partial class BodySequence : KaitaiStruct
        {
            public static BodySequence FromFile(string fileName)
            {
                return new BodySequence(new KaitaiStream(fileName));
            }

            public BodySequence(KaitaiStream p__io, Asn1Der p__parent = null, Asn1Der p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<Asn1Der>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _entries.Add(new Asn1Der(m_io));
                        i++;
                    }
                }
            }
            private List<Asn1Der> _entries;
            private Asn1Der m_root;
            private Asn1Der m_parent;
            public List<Asn1Der> Entries { get { return _entries; } }
            public Asn1Der M_Root { get { return m_root; } }
            public Asn1Der M_Parent { get { return m_parent; } }
        }
        public partial class BodyUtf8string : KaitaiStruct
        {
            public static BodyUtf8string FromFile(string fileName)
            {
                return new BodyUtf8string(new KaitaiStream(fileName));
            }

            public BodyUtf8string(KaitaiStream p__io, Asn1Der p__parent = null, Asn1Der p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _str = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesFull());
            }
            private string _str;
            private Asn1Der m_root;
            private Asn1Der m_parent;
            public string Str { get { return _str; } }
            public Asn1Der M_Root { get { return m_root; } }
            public Asn1Der M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://docs.microsoft.com/en-us/windows/desktop/SecCertEnroll/about-object-identifier">Source</a>
        /// </remarks>
        public partial class BodyObjectId : KaitaiStruct
        {
            public static BodyObjectId FromFile(string fileName)
            {
                return new BodyObjectId(new KaitaiStream(fileName));
            }

            public BodyObjectId(KaitaiStream p__io, Asn1Der p__parent = null, Asn1Der p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_first = false;
                f_second = false;
                _read();
            }
            private void _read()
            {
                _firstAndSecond = m_io.ReadU1();
                _rest = m_io.ReadBytesFull();
            }
            private bool f_first;
            private int _first;
            public int First
            {
                get
                {
                    if (f_first)
                        return _first;
                    _first = (int) ((FirstAndSecond / 40));
                    f_first = true;
                    return _first;
                }
            }
            private bool f_second;
            private int _second;
            public int Second
            {
                get
                {
                    if (f_second)
                        return _second;
                    _second = (int) (KaitaiStream.Mod(FirstAndSecond, 40));
                    f_second = true;
                    return _second;
                }
            }
            private byte _firstAndSecond;
            private byte[] _rest;
            private Asn1Der m_root;
            private Asn1Der m_parent;
            public byte FirstAndSecond { get { return _firstAndSecond; } }
            public byte[] Rest { get { return _rest; } }
            public Asn1Der M_Root { get { return m_root; } }
            public Asn1Der M_Parent { get { return m_parent; } }
        }
        public partial class LenEncoded : KaitaiStruct
        {
            public static LenEncoded FromFile(string fileName)
            {
                return new LenEncoded(new KaitaiStream(fileName));
            }

            public LenEncoded(KaitaiStream p__io, Asn1Der p__parent = null, Asn1Der p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_result = false;
                _read();
            }
            private void _read()
            {
                _b1 = m_io.ReadU1();
                if (B1 == 130) {
                    _int2 = m_io.ReadU2be();
                }
                if (B1 == 129) {
                    _int1 = m_io.ReadU1();
                }
            }
            private bool f_result;
            private ushort _result;
            public ushort Result
            {
                get
                {
                    if (f_result)
                        return _result;
                    _result = (ushort) ((B1 == 129 ? Int1 : (B1 == 130 ? Int2 : B1)));
                    f_result = true;
                    return _result;
                }
            }
            private byte _b1;
            private ushort? _int2;
            private byte? _int1;
            private Asn1Der m_root;
            private Asn1Der m_parent;
            public byte B1 { get { return _b1; } }
            public ushort? Int2 { get { return _int2; } }
            public byte? Int1 { get { return _int1; } }
            public Asn1Der M_Root { get { return m_root; } }
            public Asn1Der M_Parent { get { return m_parent; } }
        }
        public partial class BodyPrintableString : KaitaiStruct
        {
            public static BodyPrintableString FromFile(string fileName)
            {
                return new BodyPrintableString(new KaitaiStream(fileName));
            }

            public BodyPrintableString(KaitaiStream p__io, Asn1Der p__parent = null, Asn1Der p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _str = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesFull());
            }
            private string _str;
            private Asn1Der m_root;
            private Asn1Der m_parent;
            public string Str { get { return _str; } }
            public Asn1Der M_Root { get { return m_root; } }
            public Asn1Der M_Parent { get { return m_parent; } }
        }
        private TypeTag _typeTag;
        private LenEncoded _len;
        private object _body;
        private Asn1Der m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_body;
        public TypeTag TypeTag { get { return _typeTag; } }
        public LenEncoded Len { get { return _len; } }
        public object Body { get { return _body; } }
        public Asn1Der M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawBody { get { return __raw_body; } }
    }
}

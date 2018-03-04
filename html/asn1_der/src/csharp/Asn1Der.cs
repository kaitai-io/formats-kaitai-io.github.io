// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
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
            case TypeTag.Sequence30: {
                __raw_body = m_io.ReadBytes(Len.Result);
                var io___raw_body = new KaitaiStream(__raw_body);
                _body = new BodySequence(io___raw_body, this, m_root);
                break;
            }
            case TypeTag.Sequence10: {
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
            case TypeTag.PrintableString: {
                __raw_body = m_io.ReadBytes(Len.Result);
                var io___raw_body = new KaitaiStream(__raw_body);
                _body = new BodyPrintableString(io___raw_body, this, m_root);
                break;
            }
            case TypeTag.Set: {
                __raw_body = m_io.ReadBytes(Len.Result);
                var io___raw_body = new KaitaiStream(__raw_body);
                _body = new BodySequence(io___raw_body, this, m_root);
                break;
            }
            default: {
                _body = m_io.ReadBytes(Len.Result);
                break;
            }
            }
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
            }
            private bool f_result;
            private ushort _result;
            public ushort Result
            {
                get
                {
                    if (f_result)
                        return _result;
                    _result = (ushort) (((B1 & 128) == 0 ? B1 : Int2));
                    f_result = true;
                    return _result;
                }
            }
            private byte _b1;
            private ushort? _int2;
            private Asn1Der m_root;
            private Asn1Der m_parent;
            public byte B1 { get { return _b1; } }
            public ushort? Int2 { get { return _int2; } }
            public Asn1Der M_Root { get { return m_root; } }
            public Asn1Der M_Parent { get { return m_parent; } }
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

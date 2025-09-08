// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// Resource file found in CPB firmware archives, mostly used on older CoolPad
    /// phones and/or tablets. The only observed files are called &quot;ResPack.cfg&quot;.
    /// </summary>
    public partial class Respack : KaitaiStruct
    {
        public static Respack FromFile(string fileName)
        {
            return new Respack(new KaitaiStream(fileName));
        }

        public Respack(KaitaiStream p__io, KaitaiStruct p__parent = null, Respack p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _header = new Header(m_io, this, m_root);
            _json = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(Header.LenJson));
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, Respack p__parent = null, Respack p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadBytes(2);
                if (!((KaitaiStream.ByteArrayCompare(_magic, new byte[] { 82, 83 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 82, 83 }, _magic, m_io, "/types/header/seq/0");
                }
                _unknown = m_io.ReadBytes(8);
                _lenJson = m_io.ReadU4le();
                _md5 = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(32));
            }
            private byte[] _magic;
            private byte[] _unknown;
            private uint _lenJson;
            private string _md5;
            private Respack m_root;
            private Respack m_parent;
            public byte[] Magic { get { return _magic; } }
            public byte[] Unknown { get { return _unknown; } }
            public uint LenJson { get { return _lenJson; } }

            /// <summary>
            /// MD5 of data that follows the header
            /// </summary>
            public string Md5 { get { return _md5; } }
            public Respack M_Root { get { return m_root; } }
            public Respack M_Parent { get { return m_parent; } }
        }
        private Header _header;
        private string _json;
        private Respack m_root;
        private KaitaiStruct m_parent;
        public Header Header { get { return _header; } }
        public string Json { get { return _json; } }
        public Respack M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

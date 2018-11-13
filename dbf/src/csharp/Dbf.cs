// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class Dbf : KaitaiStruct
    {
        public static Dbf FromFile(string fileName)
        {
            return new Dbf(new KaitaiStream(fileName));
        }

        public Dbf(KaitaiStream p__io, KaitaiStruct p__parent = null, Dbf p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _header1 = new Header1(m_io, this, m_root);
            __raw_header2 = m_io.ReadBytes((Header1.LenHeader - 12));
            var io___raw_header2 = new KaitaiStream(__raw_header2);
            _header2 = new Header2(io___raw_header2, this, m_root);
            _records = new List<byte[]>((int) (Header1.NumRecords));
            for (var i = 0; i < Header1.NumRecords; i++)
            {
                _records.Add(m_io.ReadBytes(Header1.LenRecord));
            }
        }
        public partial class Header2 : KaitaiStruct
        {
            public static Header2 FromFile(string fileName)
            {
                return new Header2(new KaitaiStream(fileName));
            }

            public Header2(KaitaiStream p__io, Dbf p__parent = null, Dbf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                if (M_Root.Header1.DbaseLevel == 3) {
                    _headerDbase3 = new HeaderDbase3(m_io, this, m_root);
                }
                if (M_Root.Header1.DbaseLevel == 7) {
                    _headerDbase7 = new HeaderDbase7(m_io, this, m_root);
                }
                _fields = new List<Field>((int) (11));
                for (var i = 0; i < 11; i++)
                {
                    _fields.Add(new Field(m_io, this, m_root));
                }
            }
            private HeaderDbase3 _headerDbase3;
            private HeaderDbase7 _headerDbase7;
            private List<Field> _fields;
            private Dbf m_root;
            private Dbf m_parent;
            public HeaderDbase3 HeaderDbase3 { get { return _headerDbase3; } }
            public HeaderDbase7 HeaderDbase7 { get { return _headerDbase7; } }
            public List<Field> Fields { get { return _fields; } }
            public Dbf M_Root { get { return m_root; } }
            public Dbf M_Parent { get { return m_parent; } }
        }
        public partial class Field : KaitaiStruct
        {
            public static Field FromFile(string fileName)
            {
                return new Field(new KaitaiStream(fileName));
            }

            public Field(KaitaiStream p__io, Dbf.Header2 p__parent = null, Dbf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _name = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(11));
                _datatype = m_io.ReadU1();
                _dataAddress = m_io.ReadU4le();
                _length = m_io.ReadU1();
                _decimalCount = m_io.ReadU1();
                _reserved1 = m_io.ReadBytes(2);
                _workAreaId = m_io.ReadU1();
                _reserved2 = m_io.ReadBytes(2);
                _setFieldsFlag = m_io.ReadU1();
                _reserved3 = m_io.ReadBytes(8);
            }
            private string _name;
            private byte _datatype;
            private uint _dataAddress;
            private byte _length;
            private byte _decimalCount;
            private byte[] _reserved1;
            private byte _workAreaId;
            private byte[] _reserved2;
            private byte _setFieldsFlag;
            private byte[] _reserved3;
            private Dbf m_root;
            private Dbf.Header2 m_parent;
            public string Name { get { return _name; } }
            public byte Datatype { get { return _datatype; } }
            public uint DataAddress { get { return _dataAddress; } }
            public byte Length { get { return _length; } }
            public byte DecimalCount { get { return _decimalCount; } }
            public byte[] Reserved1 { get { return _reserved1; } }
            public byte WorkAreaId { get { return _workAreaId; } }
            public byte[] Reserved2 { get { return _reserved2; } }
            public byte SetFieldsFlag { get { return _setFieldsFlag; } }
            public byte[] Reserved3 { get { return _reserved3; } }
            public Dbf M_Root { get { return m_root; } }
            public Dbf.Header2 M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="http://www.dbase.com/Knowledgebase/INT/db7_file_fmt.htm">- section 1.1</a>
        /// </remarks>
        public partial class Header1 : KaitaiStruct
        {
            public static Header1 FromFile(string fileName)
            {
                return new Header1(new KaitaiStream(fileName));
            }

            public Header1(KaitaiStream p__io, Dbf p__parent = null, Dbf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_dbaseLevel = false;
                _read();
            }
            private void _read()
            {
                _version = m_io.ReadU1();
                _lastUpdateY = m_io.ReadU1();
                _lastUpdateM = m_io.ReadU1();
                _lastUpdateD = m_io.ReadU1();
                _numRecords = m_io.ReadU4le();
                _lenHeader = m_io.ReadU2le();
                _lenRecord = m_io.ReadU2le();
            }
            private bool f_dbaseLevel;
            private int _dbaseLevel;
            public int DbaseLevel
            {
                get
                {
                    if (f_dbaseLevel)
                        return _dbaseLevel;
                    _dbaseLevel = (int) ((Version & 7));
                    f_dbaseLevel = true;
                    return _dbaseLevel;
                }
            }
            private byte _version;
            private byte _lastUpdateY;
            private byte _lastUpdateM;
            private byte _lastUpdateD;
            private uint _numRecords;
            private ushort _lenHeader;
            private ushort _lenRecord;
            private Dbf m_root;
            private Dbf m_parent;
            public byte Version { get { return _version; } }
            public byte LastUpdateY { get { return _lastUpdateY; } }
            public byte LastUpdateM { get { return _lastUpdateM; } }
            public byte LastUpdateD { get { return _lastUpdateD; } }
            public uint NumRecords { get { return _numRecords; } }
            public ushort LenHeader { get { return _lenHeader; } }
            public ushort LenRecord { get { return _lenRecord; } }
            public Dbf M_Root { get { return m_root; } }
            public Dbf M_Parent { get { return m_parent; } }
        }
        public partial class HeaderDbase3 : KaitaiStruct
        {
            public static HeaderDbase3 FromFile(string fileName)
            {
                return new HeaderDbase3(new KaitaiStream(fileName));
            }

            public HeaderDbase3(KaitaiStream p__io, Dbf.Header2 p__parent = null, Dbf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _reserved1 = m_io.ReadBytes(3);
                _reserved2 = m_io.ReadBytes(13);
                _reserved3 = m_io.ReadBytes(4);
            }
            private byte[] _reserved1;
            private byte[] _reserved2;
            private byte[] _reserved3;
            private Dbf m_root;
            private Dbf.Header2 m_parent;
            public byte[] Reserved1 { get { return _reserved1; } }
            public byte[] Reserved2 { get { return _reserved2; } }
            public byte[] Reserved3 { get { return _reserved3; } }
            public Dbf M_Root { get { return m_root; } }
            public Dbf.Header2 M_Parent { get { return m_parent; } }
        }
        public partial class HeaderDbase7 : KaitaiStruct
        {
            public static HeaderDbase7 FromFile(string fileName)
            {
                return new HeaderDbase7(new KaitaiStream(fileName));
            }

            public HeaderDbase7(KaitaiStream p__io, Dbf.Header2 p__parent = null, Dbf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _reserved1 = m_io.EnsureFixedContents(new byte[] { 0, 0 });
                _hasIncompleteTransaction = m_io.ReadU1();
                _dbaseIvEncryption = m_io.ReadU1();
                _reserved2 = m_io.ReadBytes(12);
                _productionMdx = m_io.ReadU1();
                _languageDriverId = m_io.ReadU1();
                _reserved3 = m_io.EnsureFixedContents(new byte[] { 0, 0 });
                _languageDriverName = m_io.ReadBytes(32);
                _reserved4 = m_io.ReadBytes(4);
            }
            private byte[] _reserved1;
            private byte _hasIncompleteTransaction;
            private byte _dbaseIvEncryption;
            private byte[] _reserved2;
            private byte _productionMdx;
            private byte _languageDriverId;
            private byte[] _reserved3;
            private byte[] _languageDriverName;
            private byte[] _reserved4;
            private Dbf m_root;
            private Dbf.Header2 m_parent;
            public byte[] Reserved1 { get { return _reserved1; } }
            public byte HasIncompleteTransaction { get { return _hasIncompleteTransaction; } }
            public byte DbaseIvEncryption { get { return _dbaseIvEncryption; } }
            public byte[] Reserved2 { get { return _reserved2; } }
            public byte ProductionMdx { get { return _productionMdx; } }
            public byte LanguageDriverId { get { return _languageDriverId; } }
            public byte[] Reserved3 { get { return _reserved3; } }
            public byte[] LanguageDriverName { get { return _languageDriverName; } }
            public byte[] Reserved4 { get { return _reserved4; } }
            public Dbf M_Root { get { return m_root; } }
            public Dbf.Header2 M_Parent { get { return m_parent; } }
        }
        private Header1 _header1;
        private Header2 _header2;
        private List<byte[]> _records;
        private Dbf m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_header2;
        public Header1 Header1 { get { return _header1; } }
        public Header2 Header2 { get { return _header2; } }
        public List<byte[]> Records { get { return _records; } }
        public Dbf M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawHeader2 { get { return __raw_header2; } }
    }
}

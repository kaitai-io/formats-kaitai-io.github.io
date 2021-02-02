// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Direct Internet Message Encapsulation (DIME)
    /// is an old Microsoft specification for sending and receiving
    /// SOAP messages along with additional attachments,
    /// like binary files, XML fragments, and even other
    /// SOAP messages, using standard transport protocols like HTTP.
    /// 
    /// Sample file: `curl -LO
    /// https://github.com/kaitai-io/kaitai_struct_formats/files/5894723/scanner_withoptions.dump.gz
    /// &amp;&amp; gunzip scanner_withoptions.dump.gz`
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://tools.ietf.org/html/draft-nielsen-dime-02">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://docs.microsoft.com/en-us/archive/msdn-magazine/2002/december/sending-files-attachments-and-soap-messages-via-dime">Source</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="http://imrannazar.com/Parsing-the-DIME-Message-Format">Source</a>
    /// </remarks>
    public partial class DimeMessage : KaitaiStruct
    {
        public static DimeMessage FromFile(string fileName)
        {
            return new DimeMessage(new KaitaiStream(fileName));
        }


        public enum TypeFormats
        {
            Unchanged = 0,
            MediaType = 1,
            AbsoluteUri = 2,
            Unknown = 3,
            None = 4,
        }
        public DimeMessage(KaitaiStream p__io, KaitaiStruct p__parent = null, DimeMessage p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _records = new List<Record>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _records.Add(new Record(m_io, this, m_root));
                    i++;
                }
            }
        }

        /// <summary>
        /// padding to the next 4-byte boundary
        /// </summary>
        public partial class Padding : KaitaiStruct
        {
            public static Padding FromFile(string fileName)
            {
                return new Padding(new KaitaiStream(fileName));
            }

            public Padding(KaitaiStream p__io, DimeMessage.Record p__parent = null, DimeMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _boundaryPadding = m_io.ReadBytes(KaitaiStream.Mod(-(M_Io.Pos), 4));
            }
            private byte[] _boundaryPadding;
            private DimeMessage m_root;
            private DimeMessage.Record m_parent;
            public byte[] BoundaryPadding { get { return _boundaryPadding; } }
            public DimeMessage M_Root { get { return m_root; } }
            public DimeMessage.Record M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// the option field of the record
        /// </summary>
        public partial class OptionField : KaitaiStruct
        {
            public static OptionField FromFile(string fileName)
            {
                return new OptionField(new KaitaiStream(fileName));
            }

            public OptionField(KaitaiStream p__io, DimeMessage.Record p__parent = null, DimeMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _optionElements = new List<OptionElement>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _optionElements.Add(new OptionElement(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<OptionElement> _optionElements;
            private DimeMessage m_root;
            private DimeMessage.Record m_parent;
            public List<OptionElement> OptionElements { get { return _optionElements; } }
            public DimeMessage M_Root { get { return m_root; } }
            public DimeMessage.Record M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// one element of the option field
        /// </summary>
        public partial class OptionElement : KaitaiStruct
        {
            public static OptionElement FromFile(string fileName)
            {
                return new OptionElement(new KaitaiStream(fileName));
            }

            public OptionElement(KaitaiStream p__io, DimeMessage.OptionField p__parent = null, DimeMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _elementFormat = m_io.ReadU2be();
                _lenElement = m_io.ReadU2be();
                _elementData = m_io.ReadBytes(LenElement);
            }
            private ushort _elementFormat;
            private ushort _lenElement;
            private byte[] _elementData;
            private DimeMessage m_root;
            private DimeMessage.OptionField m_parent;
            public ushort ElementFormat { get { return _elementFormat; } }
            public ushort LenElement { get { return _lenElement; } }
            public byte[] ElementData { get { return _elementData; } }
            public DimeMessage M_Root { get { return m_root; } }
            public DimeMessage.OptionField M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// each individual fragment of the message
        /// </summary>
        public partial class Record : KaitaiStruct
        {
            public static Record FromFile(string fileName)
            {
                return new Record(new KaitaiStream(fileName));
            }

            public Record(KaitaiStream p__io, DimeMessage p__parent = null, DimeMessage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _version = m_io.ReadBitsIntBe(5);
                _isFirstRecord = m_io.ReadBitsIntBe(1) != 0;
                _isLastRecord = m_io.ReadBitsIntBe(1) != 0;
                _isChunkRecord = m_io.ReadBitsIntBe(1) != 0;
                _typeFormat = ((DimeMessage.TypeFormats) m_io.ReadBitsIntBe(4));
                _reserved = m_io.ReadBitsIntBe(4);
                m_io.AlignToByte();
                _lenOptions = m_io.ReadU2be();
                _lenId = m_io.ReadU2be();
                _lenType = m_io.ReadU2be();
                _lenData = m_io.ReadU4be();
                __raw_options = m_io.ReadBytes(LenOptions);
                var io___raw_options = new KaitaiStream(__raw_options);
                _options = new OptionField(io___raw_options, this, m_root);
                _optionsPadding = new Padding(m_io, this, m_root);
                _id = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(LenId));
                _idPadding = new Padding(m_io, this, m_root);
                _type = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(LenType));
                _typePadding = new Padding(m_io, this, m_root);
                _data = m_io.ReadBytes(LenData);
                _dataPadding = new Padding(m_io, this, m_root);
            }
            private ulong _version;
            private bool _isFirstRecord;
            private bool _isLastRecord;
            private bool _isChunkRecord;
            private TypeFormats _typeFormat;
            private ulong _reserved;
            private ushort _lenOptions;
            private ushort _lenId;
            private ushort _lenType;
            private uint _lenData;
            private OptionField _options;
            private Padding _optionsPadding;
            private string _id;
            private Padding _idPadding;
            private string _type;
            private Padding _typePadding;
            private byte[] _data;
            private Padding _dataPadding;
            private DimeMessage m_root;
            private DimeMessage m_parent;
            private byte[] __raw_options;

            /// <summary>
            /// DIME format version (always 1)
            /// </summary>
            public ulong Version { get { return _version; } }

            /// <summary>
            /// Set if this is the first record in the message
            /// </summary>
            public bool IsFirstRecord { get { return _isFirstRecord; } }

            /// <summary>
            /// Set if this is the last record in the message
            /// </summary>
            public bool IsLastRecord { get { return _isLastRecord; } }

            /// <summary>
            /// Set if the file contained in this record is chunked into multiple records
            /// </summary>
            public bool IsChunkRecord { get { return _isChunkRecord; } }

            /// <summary>
            /// Indicates the structure and format of the value of the TYPE field
            /// </summary>
            public TypeFormats TypeFormat { get { return _typeFormat; } }

            /// <summary>
            /// Reserved for future use
            /// </summary>
            public ulong Reserved { get { return _reserved; } }

            /// <summary>
            /// Length of the Options field
            /// </summary>
            public ushort LenOptions { get { return _lenOptions; } }

            /// <summary>
            /// Length of the ID field
            /// </summary>
            public ushort LenId { get { return _lenId; } }

            /// <summary>
            /// Length of the Type field
            /// </summary>
            public ushort LenType { get { return _lenType; } }

            /// <summary>
            /// Length of the Data field
            /// </summary>
            public uint LenData { get { return _lenData; } }
            public OptionField Options { get { return _options; } }
            public Padding OptionsPadding { get { return _optionsPadding; } }

            /// <summary>
            /// Unique identifier of the file (set in the first record of file)
            /// </summary>
            public string Id { get { return _id; } }
            public Padding IdPadding { get { return _idPadding; } }

            /// <summary>
            /// Specified type in the format set with type_format
            /// </summary>
            public string Type { get { return _type; } }
            public Padding TypePadding { get { return _typePadding; } }

            /// <summary>
            /// The file data
            /// </summary>
            public byte[] Data { get { return _data; } }
            public Padding DataPadding { get { return _dataPadding; } }
            public DimeMessage M_Root { get { return m_root; } }
            public DimeMessage M_Parent { get { return m_parent; } }
            public byte[] M_RawOptions { get { return __raw_options; } }
        }
        private List<Record> _records;
        private DimeMessage m_root;
        private KaitaiStruct m_parent;
        public List<Record> Records { get { return _records; } }
        public DimeMessage M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

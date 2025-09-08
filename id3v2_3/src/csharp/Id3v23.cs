// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="https://id3.org/id3v2.3.0">Source</a>
    /// </remarks>
    public partial class Id3v23 : KaitaiStruct
    {
        public static Id3v23 FromFile(string fileName)
        {
            return new Id3v23(new KaitaiStream(fileName));
        }

        public Id3v23(KaitaiStream p__io, KaitaiStruct p__parent = null, Id3v23 p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _tag = new Tag(m_io, this, m_root);
        }

        /// <remarks>
        /// Reference: Section 3.3. ID3v2 frame overview
        /// </remarks>
        public partial class Frame : KaitaiStruct
        {
            public static Frame FromFile(string fileName)
            {
                return new Frame(new KaitaiStream(fileName));
            }

            public Frame(KaitaiStream p__io, Id3v23.Tag p__parent = null, Id3v23 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_isInvalid = false;
                _read();
            }
            private void _read()
            {
                _id = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(4));
                _size = m_io.ReadU4be();
                _flags = new Flags(m_io, this, m_root);
                _data = m_io.ReadBytes(Size);
            }
            public partial class Flags : KaitaiStruct
            {
                public static Flags FromFile(string fileName)
                {
                    return new Flags(new KaitaiStream(fileName));
                }

                public Flags(KaitaiStream p__io, Id3v23.Frame p__parent = null, Id3v23 p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _flagDiscardAlterTag = m_io.ReadBitsIntBe(1) != 0;
                    _flagDiscardAlterFile = m_io.ReadBitsIntBe(1) != 0;
                    _flagReadOnly = m_io.ReadBitsIntBe(1) != 0;
                    _reserved1 = m_io.ReadBitsIntBe(5);
                    _flagCompressed = m_io.ReadBitsIntBe(1) != 0;
                    _flagEncrypted = m_io.ReadBitsIntBe(1) != 0;
                    _flagGrouping = m_io.ReadBitsIntBe(1) != 0;
                    _reserved2 = m_io.ReadBitsIntBe(5);
                }
                private bool _flagDiscardAlterTag;
                private bool _flagDiscardAlterFile;
                private bool _flagReadOnly;
                private ulong _reserved1;
                private bool _flagCompressed;
                private bool _flagEncrypted;
                private bool _flagGrouping;
                private ulong _reserved2;
                private Id3v23 m_root;
                private Id3v23.Frame m_parent;
                public bool FlagDiscardAlterTag { get { return _flagDiscardAlterTag; } }
                public bool FlagDiscardAlterFile { get { return _flagDiscardAlterFile; } }
                public bool FlagReadOnly { get { return _flagReadOnly; } }
                public ulong Reserved1 { get { return _reserved1; } }
                public bool FlagCompressed { get { return _flagCompressed; } }
                public bool FlagEncrypted { get { return _flagEncrypted; } }
                public bool FlagGrouping { get { return _flagGrouping; } }
                public ulong Reserved2 { get { return _reserved2; } }
                public Id3v23 M_Root { get { return m_root; } }
                public Id3v23.Frame M_Parent { get { return m_parent; } }
            }
            private bool f_isInvalid;
            private bool _isInvalid;
            public bool IsInvalid
            {
                get
                {
                    if (f_isInvalid)
                        return _isInvalid;
                    f_isInvalid = true;
                    _isInvalid = (bool) (Id == "\0\0\0\0");
                    return _isInvalid;
                }
            }
            private string _id;
            private uint _size;
            private Flags _flags;
            private byte[] _data;
            private Id3v23 m_root;
            private Id3v23.Tag m_parent;
            public string Id { get { return _id; } }
            public uint Size { get { return _size; } }
            public Flags Flags { get { return _flags; } }
            public byte[] Data { get { return _data; } }
            public Id3v23 M_Root { get { return m_root; } }
            public Id3v23.Tag M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// ID3v2 fixed header
        /// </summary>
        /// <remarks>
        /// Reference: Section 3.1. ID3v2 header
        /// </remarks>
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, Id3v23.Tag p__parent = null, Id3v23 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadBytes(3);
                if (!((KaitaiStream.ByteArrayCompare(_magic, new byte[] { 73, 68, 51 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 73, 68, 51 }, _magic, m_io, "/types/header/seq/0");
                }
                _versionMajor = m_io.ReadU1();
                _versionRevision = m_io.ReadU1();
                _flags = new Flags(m_io, this, m_root);
                _size = new U4beSynchsafe(m_io, this, m_root);
            }
            public partial class Flags : KaitaiStruct
            {
                public static Flags FromFile(string fileName)
                {
                    return new Flags(new KaitaiStream(fileName));
                }

                public Flags(KaitaiStream p__io, Id3v23.Header p__parent = null, Id3v23 p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _flagUnsynchronization = m_io.ReadBitsIntBe(1) != 0;
                    _flagHeaderex = m_io.ReadBitsIntBe(1) != 0;
                    _flagExperimental = m_io.ReadBitsIntBe(1) != 0;
                    _reserved = m_io.ReadBitsIntBe(5);
                }
                private bool _flagUnsynchronization;
                private bool _flagHeaderex;
                private bool _flagExperimental;
                private ulong _reserved;
                private Id3v23 m_root;
                private Id3v23.Header m_parent;
                public bool FlagUnsynchronization { get { return _flagUnsynchronization; } }
                public bool FlagHeaderex { get { return _flagHeaderex; } }
                public bool FlagExperimental { get { return _flagExperimental; } }
                public ulong Reserved { get { return _reserved; } }
                public Id3v23 M_Root { get { return m_root; } }
                public Id3v23.Header M_Parent { get { return m_parent; } }
            }
            private byte[] _magic;
            private byte _versionMajor;
            private byte _versionRevision;
            private Flags _flags;
            private U4beSynchsafe _size;
            private Id3v23 m_root;
            private Id3v23.Tag m_parent;
            public byte[] Magic { get { return _magic; } }
            public byte VersionMajor { get { return _versionMajor; } }
            public byte VersionRevision { get { return _versionRevision; } }
            public Flags Flags { get { return _flags; } }
            public U4beSynchsafe Size { get { return _size; } }
            public Id3v23 M_Root { get { return m_root; } }
            public Id3v23.Tag M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// ID3v2 extended header
        /// </summary>
        /// <remarks>
        /// Reference: Section 3.2. ID3v2 extended header
        /// </remarks>
        public partial class HeaderEx : KaitaiStruct
        {
            public static HeaderEx FromFile(string fileName)
            {
                return new HeaderEx(new KaitaiStream(fileName));
            }

            public HeaderEx(KaitaiStream p__io, Id3v23.Tag p__parent = null, Id3v23 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _size = m_io.ReadU4be();
                _flagsEx = new FlagsEx(m_io, this, m_root);
                _paddingSize = m_io.ReadU4be();
                if (FlagsEx.FlagCrc) {
                    _crc = m_io.ReadU4be();
                }
            }
            public partial class FlagsEx : KaitaiStruct
            {
                public static FlagsEx FromFile(string fileName)
                {
                    return new FlagsEx(new KaitaiStream(fileName));
                }

                public FlagsEx(KaitaiStream p__io, Id3v23.HeaderEx p__parent = null, Id3v23 p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _flagCrc = m_io.ReadBitsIntBe(1) != 0;
                    _reserved = m_io.ReadBitsIntBe(15);
                }
                private bool _flagCrc;
                private ulong _reserved;
                private Id3v23 m_root;
                private Id3v23.HeaderEx m_parent;
                public bool FlagCrc { get { return _flagCrc; } }
                public ulong Reserved { get { return _reserved; } }
                public Id3v23 M_Root { get { return m_root; } }
                public Id3v23.HeaderEx M_Parent { get { return m_parent; } }
            }
            private uint _size;
            private FlagsEx _flagsEx;
            private uint _paddingSize;
            private uint? _crc;
            private Id3v23 m_root;
            private Id3v23.Tag m_parent;
            public uint Size { get { return _size; } }
            public FlagsEx FlagsEx { get { return _flagsEx; } }
            public uint PaddingSize { get { return _paddingSize; } }
            public uint? Crc { get { return _crc; } }
            public Id3v23 M_Root { get { return m_root; } }
            public Id3v23.Tag M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: Section 3. ID3v2 overview
        /// </remarks>
        public partial class Tag : KaitaiStruct
        {
            public static Tag FromFile(string fileName)
            {
                return new Tag(new KaitaiStream(fileName));
            }

            public Tag(KaitaiStream p__io, Id3v23 p__parent = null, Id3v23 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _header = new Header(m_io, this, m_root);
                if (Header.Flags.FlagHeaderex) {
                    _headerEx = new HeaderEx(m_io, this, m_root);
                }
                _frames = new List<Frame>();
                {
                    var i = 0;
                    Frame M_;
                    do {
                        M_ = new Frame(m_io, this, m_root);
                        _frames.Add(M_);
                        i++;
                    } while (!( ((M_Io.Pos + M_.Size > Header.Size.Value) || (M_.IsInvalid)) ));
                }
                if (Header.Flags.FlagHeaderex) {
                    _padding = m_io.ReadBytes(HeaderEx.PaddingSize - M_Io.Pos);
                }
            }
            private Header _header;
            private HeaderEx _headerEx;
            private List<Frame> _frames;
            private byte[] _padding;
            private Id3v23 m_root;
            private Id3v23 m_parent;
            public Header Header { get { return _header; } }
            public HeaderEx HeaderEx { get { return _headerEx; } }
            public List<Frame> Frames { get { return _frames; } }
            public byte[] Padding { get { return _padding; } }
            public Id3v23 M_Root { get { return m_root; } }
            public Id3v23 M_Parent { get { return m_parent; } }
        }
        public partial class U1beSynchsafe : KaitaiStruct
        {
            public static U1beSynchsafe FromFile(string fileName)
            {
                return new U1beSynchsafe(new KaitaiStream(fileName));
            }

            public U1beSynchsafe(KaitaiStream p__io, Id3v23.U2beSynchsafe p__parent = null, Id3v23 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _padding = m_io.ReadBitsIntBe(1) != 0;
                _value = m_io.ReadBitsIntBe(7);
            }
            private bool _padding;
            private ulong _value;
            private Id3v23 m_root;
            private Id3v23.U2beSynchsafe m_parent;
            public bool Padding { get { return _padding; } }
            public ulong Value { get { return _value; } }
            public Id3v23 M_Root { get { return m_root; } }
            public Id3v23.U2beSynchsafe M_Parent { get { return m_parent; } }
        }
        public partial class U2beSynchsafe : KaitaiStruct
        {
            public static U2beSynchsafe FromFile(string fileName)
            {
                return new U2beSynchsafe(new KaitaiStream(fileName));
            }

            public U2beSynchsafe(KaitaiStream p__io, Id3v23.U4beSynchsafe p__parent = null, Id3v23 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_value = false;
                _read();
            }
            private void _read()
            {
                _byte0 = new U1beSynchsafe(m_io, this, m_root);
                _byte1 = new U1beSynchsafe(m_io, this, m_root);
            }
            private bool f_value;
            private int _value;
            public int Value
            {
                get
                {
                    if (f_value)
                        return _value;
                    f_value = true;
                    _value = (int) (Byte0.Value << 7 | Byte1.Value);
                    return _value;
                }
            }
            private U1beSynchsafe _byte0;
            private U1beSynchsafe _byte1;
            private Id3v23 m_root;
            private Id3v23.U4beSynchsafe m_parent;
            public U1beSynchsafe Byte0 { get { return _byte0; } }
            public U1beSynchsafe Byte1 { get { return _byte1; } }
            public Id3v23 M_Root { get { return m_root; } }
            public Id3v23.U4beSynchsafe M_Parent { get { return m_parent; } }
        }
        public partial class U4beSynchsafe : KaitaiStruct
        {
            public static U4beSynchsafe FromFile(string fileName)
            {
                return new U4beSynchsafe(new KaitaiStream(fileName));
            }

            public U4beSynchsafe(KaitaiStream p__io, Id3v23.Header p__parent = null, Id3v23 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_value = false;
                _read();
            }
            private void _read()
            {
                _short0 = new U2beSynchsafe(m_io, this, m_root);
                _short1 = new U2beSynchsafe(m_io, this, m_root);
            }
            private bool f_value;
            private int _value;
            public int Value
            {
                get
                {
                    if (f_value)
                        return _value;
                    f_value = true;
                    _value = (int) (Short0.Value << 14 | Short1.Value);
                    return _value;
                }
            }
            private U2beSynchsafe _short0;
            private U2beSynchsafe _short1;
            private Id3v23 m_root;
            private Id3v23.Header m_parent;
            public U2beSynchsafe Short0 { get { return _short0; } }
            public U2beSynchsafe Short1 { get { return _short1; } }
            public Id3v23 M_Root { get { return m_root; } }
            public Id3v23.Header M_Parent { get { return m_parent; } }
        }
        private Tag _tag;
        private Id3v23 m_root;
        private KaitaiStruct m_parent;
        public Tag Tag { get { return _tag; } }
        public Id3v23 M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

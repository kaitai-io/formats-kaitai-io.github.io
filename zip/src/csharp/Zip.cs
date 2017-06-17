// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT">Source</a>
    /// </remarks>
    public partial class Zip : KaitaiStruct
    {
        public static Zip FromFile(string fileName)
        {
            return new Zip(new KaitaiStream(fileName));
        }

        public enum Compression
        {
            None = 0,
            Shrunk = 1,
            Reduced1 = 2,
            Reduced2 = 3,
            Reduced3 = 4,
            Reduced4 = 5,
            Imploded = 6,
            Deflated = 8,
            EnhancedDeflated = 9,
            PkwareDclImploded = 10,
            Bzip2 = 12,
            Lzma = 14,
            IbmTerse = 18,
            IbmLz77Z = 19,
            Ppmd = 98,
        }

        public enum ExtraCodes
        {
            Zip64 = 1,
            AvInfo = 7,
            Os2 = 9,
            Ntfs = 10,
            Openvms = 12,
            PkwareUnix = 13,
            FileStreamAndForkDescriptors = 14,
            PatchDescriptor = 15,
            Pkcs7 = 20,
            X509CertIdAndSignatureForFile = 21,
            X509CertIdForCentralDir = 22,
            StrongEncryptionHeader = 23,
            RecordManagementControls = 24,
            Pkcs7EncRecipCertList = 25,
            IbmS390Uncomp = 101,
            IbmS390Comp = 102,
            Poszip4690 = 18064,
            ExtendedTimestamp = 21589,
            InfozipUnix = 30805,
            InfozipUnixVarSize = 30837,
        }

        public Zip(KaitaiStream io, KaitaiStruct parent = null, Zip root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            _read();
        }
        private void _read() {
            _sections = new List<PkSection>();
            while (!m_io.IsEof) {
                _sections.Add(new PkSection(m_io, this, m_root));
            }
            }
        public partial class LocalFile : KaitaiStruct
        {
            public static LocalFile FromFile(string fileName)
            {
                return new LocalFile(new KaitaiStream(fileName));
            }

            public LocalFile(KaitaiStream io, Zip.PkSection parent = null, Zip root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _header = new LocalFileHeader(m_io, this, m_root);
                _body = m_io.ReadBytes(Header.CompressedSize);
                }
            private LocalFileHeader _header;
            private byte[] _body;
            private Zip m_root;
            private Zip.PkSection m_parent;
            public LocalFileHeader Header { get { return _header; } }
            public byte[] Body { get { return _body; } }
            public Zip M_Root { get { return m_root; } }
            public Zip.PkSection M_Parent { get { return m_parent; } }
        }
        public partial class ExtraField : KaitaiStruct
        {
            public static ExtraField FromFile(string fileName)
            {
                return new ExtraField(new KaitaiStream(fileName));
            }

            public ExtraField(KaitaiStream io, Zip.Extras parent = null, Zip root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _code = ((Zip.ExtraCodes) m_io.ReadU2le());
                _size = m_io.ReadU2le();
                switch (Code) {
                case Zip.ExtraCodes.Ntfs: {
                    __raw_body = m_io.ReadBytes(Size);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new Ntfs(io___raw_body, this, m_root);
                    break;
                }
                case Zip.ExtraCodes.ExtendedTimestamp: {
                    __raw_body = m_io.ReadBytes(Size);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new ExtendedTimestamp(io___raw_body, this, m_root);
                    break;
                }
                case Zip.ExtraCodes.InfozipUnixVarSize: {
                    __raw_body = m_io.ReadBytes(Size);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new InfozipUnixVarSize(io___raw_body, this, m_root);
                    break;
                }
                default: {
                    _body = m_io.ReadBytes(Size);
                    break;
                }
                }
                }

            /// <remarks>
            /// Reference: <a href="https://github.com/LuaDist/zip/blob/master/proginfo/extrafld.txt#L191">Source</a>
            /// </remarks>
            public partial class Ntfs : KaitaiStruct
            {
                public static Ntfs FromFile(string fileName)
                {
                    return new Ntfs(new KaitaiStream(fileName));
                }

                public Ntfs(KaitaiStream io, Zip.ExtraField parent = null, Zip root = null) : base(io)
                {
                    m_parent = parent;
                    m_root = root;
                    _read();
                }
                private void _read() {
                    _reserved = m_io.ReadU4le();
                    _attributes = new List<Attribute>();
                    while (!m_io.IsEof) {
                        _attributes.Add(new Attribute(m_io, this, m_root));
                    }
                    }
                public partial class Attribute : KaitaiStruct
                {
                    public static Attribute FromFile(string fileName)
                    {
                        return new Attribute(new KaitaiStream(fileName));
                    }

                    public Attribute(KaitaiStream io, Zip.ExtraField.Ntfs parent = null, Zip root = null) : base(io)
                    {
                        m_parent = parent;
                        m_root = root;
                        _read();
                    }
                    private void _read() {
                        _tag = m_io.ReadU2le();
                        _size = m_io.ReadU2le();
                        switch (Tag) {
                        case 1: {
                            __raw_body = m_io.ReadBytes(Size);
                            var io___raw_body = new KaitaiStream(__raw_body);
                            _body = new Attribute1(io___raw_body, this, m_root);
                            break;
                        }
                        default: {
                            _body = m_io.ReadBytes(Size);
                            break;
                        }
                        }
                        }
                    private ushort _tag;
                    private ushort _size;
                    private object _body;
                    private Zip m_root;
                    private Zip.ExtraField.Ntfs m_parent;
                    private byte[] __raw_body;
                    public ushort Tag { get { return _tag; } }
                    public ushort Size { get { return _size; } }
                    public object Body { get { return _body; } }
                    public Zip M_Root { get { return m_root; } }
                    public Zip.ExtraField.Ntfs M_Parent { get { return m_parent; } }
                    public byte[] M_RawBody { get { return __raw_body; } }
                }
                public partial class Attribute1 : KaitaiStruct
                {
                    public static Attribute1 FromFile(string fileName)
                    {
                        return new Attribute1(new KaitaiStream(fileName));
                    }

                    public Attribute1(KaitaiStream io, Zip.ExtraField.Ntfs.Attribute parent = null, Zip root = null) : base(io)
                    {
                        m_parent = parent;
                        m_root = root;
                        _read();
                    }
                    private void _read() {
                        _lastModTime = m_io.ReadU8le();
                        _lastAccessTime = m_io.ReadU8le();
                        _creationTime = m_io.ReadU8le();
                        }
                    private ulong _lastModTime;
                    private ulong _lastAccessTime;
                    private ulong _creationTime;
                    private Zip m_root;
                    private Zip.ExtraField.Ntfs.Attribute m_parent;
                    public ulong LastModTime { get { return _lastModTime; } }
                    public ulong LastAccessTime { get { return _lastAccessTime; } }
                    public ulong CreationTime { get { return _creationTime; } }
                    public Zip M_Root { get { return m_root; } }
                    public Zip.ExtraField.Ntfs.Attribute M_Parent { get { return m_parent; } }
                }
                private uint _reserved;
                private List<Attribute> _attributes;
                private Zip m_root;
                private Zip.ExtraField m_parent;
                public uint Reserved { get { return _reserved; } }
                public List<Attribute> Attributes { get { return _attributes; } }
                public Zip M_Root { get { return m_root; } }
                public Zip.ExtraField M_Parent { get { return m_parent; } }
            }

            /// <remarks>
            /// Reference: <a href="https://github.com/LuaDist/zip/blob/master/proginfo/extrafld.txt#L817">Source</a>
            /// </remarks>
            public partial class ExtendedTimestamp : KaitaiStruct
            {
                public static ExtendedTimestamp FromFile(string fileName)
                {
                    return new ExtendedTimestamp(new KaitaiStream(fileName));
                }

                public ExtendedTimestamp(KaitaiStream io, Zip.ExtraField parent = null, Zip root = null) : base(io)
                {
                    m_parent = parent;
                    m_root = root;
                    _read();
                }
                private void _read() {
                    _flags = m_io.ReadU1();
                    _modTime = m_io.ReadU4le();
                    if (!(M_Io.IsEof)) {
                        _accessTime = m_io.ReadU4le();
                    }
                    if (!(M_Io.IsEof)) {
                        _createTime = m_io.ReadU4le();
                    }
                    }
                private byte _flags;
                private uint _modTime;
                private uint _accessTime;
                private uint _createTime;
                private Zip m_root;
                private Zip.ExtraField m_parent;
                public byte Flags { get { return _flags; } }
                public uint ModTime { get { return _modTime; } }
                public uint AccessTime { get { return _accessTime; } }
                public uint CreateTime { get { return _createTime; } }
                public Zip M_Root { get { return m_root; } }
                public Zip.ExtraField M_Parent { get { return m_parent; } }
            }

            /// <remarks>
            /// Reference: <a href="https://github.com/LuaDist/zip/blob/master/proginfo/extrafld.txt#L1339">Source</a>
            /// </remarks>
            public partial class InfozipUnixVarSize : KaitaiStruct
            {
                public static InfozipUnixVarSize FromFile(string fileName)
                {
                    return new InfozipUnixVarSize(new KaitaiStream(fileName));
                }

                public InfozipUnixVarSize(KaitaiStream io, Zip.ExtraField parent = null, Zip root = null) : base(io)
                {
                    m_parent = parent;
                    m_root = root;
                    _read();
                }
                private void _read() {
                    _version = m_io.ReadU1();
                    _uidSize = m_io.ReadU1();
                    _uid = m_io.ReadBytes(UidSize);
                    _gidSize = m_io.ReadU1();
                    _gid = m_io.ReadBytes(GidSize);
                    }
                private byte _version;
                private byte _uidSize;
                private byte[] _uid;
                private byte _gidSize;
                private byte[] _gid;
                private Zip m_root;
                private Zip.ExtraField m_parent;

                /// <summary>
                /// Version of this extra field, currently 1
                /// </summary>
                public byte Version { get { return _version; } }

                /// <summary>
                /// Size of UID field
                /// </summary>
                public byte UidSize { get { return _uidSize; } }

                /// <summary>
                /// UID (User ID) for a file
                /// </summary>
                public byte[] Uid { get { return _uid; } }

                /// <summary>
                /// Size of GID field
                /// </summary>
                public byte GidSize { get { return _gidSize; } }

                /// <summary>
                /// GID (Group ID) for a file
                /// </summary>
                public byte[] Gid { get { return _gid; } }
                public Zip M_Root { get { return m_root; } }
                public Zip.ExtraField M_Parent { get { return m_parent; } }
            }
            private ExtraCodes _code;
            private ushort _size;
            private object _body;
            private Zip m_root;
            private Zip.Extras m_parent;
            private byte[] __raw_body;
            public ExtraCodes Code { get { return _code; } }
            public ushort Size { get { return _size; } }
            public object Body { get { return _body; } }
            public Zip M_Root { get { return m_root; } }
            public Zip.Extras M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }

        /// <remarks>
        /// Reference: <a href="https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT">- 4.3.12</a>
        /// </remarks>
        public partial class CentralDirEntry : KaitaiStruct
        {
            public static CentralDirEntry FromFile(string fileName)
            {
                return new CentralDirEntry(new KaitaiStream(fileName));
            }

            public CentralDirEntry(KaitaiStream io, Zip.PkSection parent = null, Zip root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                f_localHeader = false;
                _read();
            }
            private void _read() {
                _versionMadeBy = m_io.ReadU2le();
                _versionNeededToExtract = m_io.ReadU2le();
                _flags = m_io.ReadU2le();
                _compressionMethod = ((Zip.Compression) m_io.ReadU2le());
                _lastModFileTime = m_io.ReadU2le();
                _lastModFileDate = m_io.ReadU2le();
                _crc32 = m_io.ReadU4le();
                _compressedSize = m_io.ReadU4le();
                _uncompressedSize = m_io.ReadU4le();
                _fileNameLen = m_io.ReadU2le();
                _extraLen = m_io.ReadU2le();
                _commentLen = m_io.ReadU2le();
                _diskNumberStart = m_io.ReadU2le();
                _intFileAttr = m_io.ReadU2le();
                _extFileAttr = m_io.ReadU4le();
                _localHeaderOffset = m_io.ReadS4le();
                _fileName = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(FileNameLen));
                __raw_extra = m_io.ReadBytes(ExtraLen);
                var io___raw_extra = new KaitaiStream(__raw_extra);
                _extra = new Extras(io___raw_extra, this, m_root);
                _comment = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(CommentLen));
                }
            private bool f_localHeader;
            private PkSection _localHeader;
            public PkSection LocalHeader
            {
                get
                {
                    if (f_localHeader)
                        return _localHeader;
                    long _pos = m_io.Pos;
                    m_io.Seek(LocalHeaderOffset);
                    _localHeader = new PkSection(m_io, this, m_root);
                    m_io.Seek(_pos);
                    f_localHeader = true;
                    return _localHeader;
                }
            }
            private ushort _versionMadeBy;
            private ushort _versionNeededToExtract;
            private ushort _flags;
            private Compression _compressionMethod;
            private ushort _lastModFileTime;
            private ushort _lastModFileDate;
            private uint _crc32;
            private uint _compressedSize;
            private uint _uncompressedSize;
            private ushort _fileNameLen;
            private ushort _extraLen;
            private ushort _commentLen;
            private ushort _diskNumberStart;
            private ushort _intFileAttr;
            private uint _extFileAttr;
            private int _localHeaderOffset;
            private string _fileName;
            private Extras _extra;
            private string _comment;
            private Zip m_root;
            private Zip.PkSection m_parent;
            private byte[] __raw_extra;
            public ushort VersionMadeBy { get { return _versionMadeBy; } }
            public ushort VersionNeededToExtract { get { return _versionNeededToExtract; } }
            public ushort Flags { get { return _flags; } }
            public Compression CompressionMethod { get { return _compressionMethod; } }
            public ushort LastModFileTime { get { return _lastModFileTime; } }
            public ushort LastModFileDate { get { return _lastModFileDate; } }
            public uint Crc32 { get { return _crc32; } }
            public uint CompressedSize { get { return _compressedSize; } }
            public uint UncompressedSize { get { return _uncompressedSize; } }
            public ushort FileNameLen { get { return _fileNameLen; } }
            public ushort ExtraLen { get { return _extraLen; } }
            public ushort CommentLen { get { return _commentLen; } }
            public ushort DiskNumberStart { get { return _diskNumberStart; } }
            public ushort IntFileAttr { get { return _intFileAttr; } }
            public uint ExtFileAttr { get { return _extFileAttr; } }
            public int LocalHeaderOffset { get { return _localHeaderOffset; } }
            public string FileName { get { return _fileName; } }
            public Extras Extra { get { return _extra; } }
            public string Comment { get { return _comment; } }
            public Zip M_Root { get { return m_root; } }
            public Zip.PkSection M_Parent { get { return m_parent; } }
            public byte[] M_RawExtra { get { return __raw_extra; } }
        }
        public partial class PkSection : KaitaiStruct
        {
            public static PkSection FromFile(string fileName)
            {
                return new PkSection(new KaitaiStream(fileName));
            }

            public PkSection(KaitaiStream io, KaitaiStruct parent = null, Zip root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _magic = m_io.EnsureFixedContents(new byte[] { 80, 75 });
                _sectionType = m_io.ReadU2le();
                switch (SectionType) {
                case 513: {
                    _body = new CentralDirEntry(m_io, this, m_root);
                    break;
                }
                case 1027: {
                    _body = new LocalFile(m_io, this, m_root);
                    break;
                }
                case 1541: {
                    _body = new EndOfCentralDir(m_io, this, m_root);
                    break;
                }
                }
                }
            private byte[] _magic;
            private ushort _sectionType;
            private KaitaiStruct _body;
            private Zip m_root;
            private KaitaiStruct m_parent;
            public byte[] Magic { get { return _magic; } }
            public ushort SectionType { get { return _sectionType; } }
            public KaitaiStruct Body { get { return _body; } }
            public Zip M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class Extras : KaitaiStruct
        {
            public static Extras FromFile(string fileName)
            {
                return new Extras(new KaitaiStream(fileName));
            }

            public Extras(KaitaiStream io, KaitaiStruct parent = null, Zip root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _entries = new List<ExtraField>();
                while (!m_io.IsEof) {
                    _entries.Add(new ExtraField(m_io, this, m_root));
                }
                }
            private List<ExtraField> _entries;
            private Zip m_root;
            private KaitaiStruct m_parent;
            public List<ExtraField> Entries { get { return _entries; } }
            public Zip M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class LocalFileHeader : KaitaiStruct
        {
            public static LocalFileHeader FromFile(string fileName)
            {
                return new LocalFileHeader(new KaitaiStream(fileName));
            }

            public LocalFileHeader(KaitaiStream io, Zip.LocalFile parent = null, Zip root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _version = m_io.ReadU2le();
                _flags = m_io.ReadU2le();
                _compressionMethod = ((Zip.Compression) m_io.ReadU2le());
                _fileModTime = m_io.ReadU2le();
                _fileModDate = m_io.ReadU2le();
                _crc32 = m_io.ReadU4le();
                _compressedSize = m_io.ReadU4le();
                _uncompressedSize = m_io.ReadU4le();
                _fileNameLen = m_io.ReadU2le();
                _extraLen = m_io.ReadU2le();
                _fileName = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(FileNameLen));
                __raw_extra = m_io.ReadBytes(ExtraLen);
                var io___raw_extra = new KaitaiStream(__raw_extra);
                _extra = new Extras(io___raw_extra, this, m_root);
                }
            private ushort _version;
            private ushort _flags;
            private Compression _compressionMethod;
            private ushort _fileModTime;
            private ushort _fileModDate;
            private uint _crc32;
            private uint _compressedSize;
            private uint _uncompressedSize;
            private ushort _fileNameLen;
            private ushort _extraLen;
            private string _fileName;
            private Extras _extra;
            private Zip m_root;
            private Zip.LocalFile m_parent;
            private byte[] __raw_extra;
            public ushort Version { get { return _version; } }
            public ushort Flags { get { return _flags; } }
            public Compression CompressionMethod { get { return _compressionMethod; } }
            public ushort FileModTime { get { return _fileModTime; } }
            public ushort FileModDate { get { return _fileModDate; } }
            public uint Crc32 { get { return _crc32; } }
            public uint CompressedSize { get { return _compressedSize; } }
            public uint UncompressedSize { get { return _uncompressedSize; } }
            public ushort FileNameLen { get { return _fileNameLen; } }
            public ushort ExtraLen { get { return _extraLen; } }
            public string FileName { get { return _fileName; } }
            public Extras Extra { get { return _extra; } }
            public Zip M_Root { get { return m_root; } }
            public Zip.LocalFile M_Parent { get { return m_parent; } }
            public byte[] M_RawExtra { get { return __raw_extra; } }
        }
        public partial class EndOfCentralDir : KaitaiStruct
        {
            public static EndOfCentralDir FromFile(string fileName)
            {
                return new EndOfCentralDir(new KaitaiStream(fileName));
            }

            public EndOfCentralDir(KaitaiStream io, Zip.PkSection parent = null, Zip root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _diskOfEndOfCentralDir = m_io.ReadU2le();
                _diskOfCentralDir = m_io.ReadU2le();
                _qtyCentralDirEntriesOnDisk = m_io.ReadU2le();
                _qtyCentralDirEntriesTotal = m_io.ReadU2le();
                _centralDirSize = m_io.ReadU4le();
                _centralDirOffset = m_io.ReadU4le();
                _commentLen = m_io.ReadU2le();
                _comment = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(CommentLen));
                }
            private ushort _diskOfEndOfCentralDir;
            private ushort _diskOfCentralDir;
            private ushort _qtyCentralDirEntriesOnDisk;
            private ushort _qtyCentralDirEntriesTotal;
            private uint _centralDirSize;
            private uint _centralDirOffset;
            private ushort _commentLen;
            private string _comment;
            private Zip m_root;
            private Zip.PkSection m_parent;
            public ushort DiskOfEndOfCentralDir { get { return _diskOfEndOfCentralDir; } }
            public ushort DiskOfCentralDir { get { return _diskOfCentralDir; } }
            public ushort QtyCentralDirEntriesOnDisk { get { return _qtyCentralDirEntriesOnDisk; } }
            public ushort QtyCentralDirEntriesTotal { get { return _qtyCentralDirEntriesTotal; } }
            public uint CentralDirSize { get { return _centralDirSize; } }
            public uint CentralDirOffset { get { return _centralDirOffset; } }
            public ushort CommentLen { get { return _commentLen; } }
            public string Comment { get { return _comment; } }
            public Zip M_Root { get { return m_root; } }
            public Zip.PkSection M_Parent { get { return m_parent; } }
        }
        private List<PkSection> _sections;
        private Zip m_root;
        private KaitaiStruct m_parent;
        public List<PkSection> Sections { get { return _sections; } }
        public Zip M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

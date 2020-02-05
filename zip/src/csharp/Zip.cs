// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// ZIP is a popular archive file format, introduced in 1989 by Phil Katz
    /// and originally implemented in PKZIP utility by PKWARE.
    /// 
    /// Thanks to solid support of it in most desktop environments and
    /// operating systems, and algorithms / specs availability in public
    /// domain, it quickly became tool of choice for implementing file
    /// containers.
    /// 
    /// For example, Java .jar files, OpenDocument, Office Open XML, EPUB files
    /// are actually ZIP archives.
    /// </summary>
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
        public Zip(KaitaiStream p__io, KaitaiStruct p__parent = null, Zip p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _sections = new List<PkSection>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _sections.Add(new PkSection(m_io, this, m_root));
                    i++;
                }
            }
        }
        public partial class LocalFile : KaitaiStruct
        {
            public static LocalFile FromFile(string fileName)
            {
                return new LocalFile(new KaitaiStream(fileName));
            }

            public LocalFile(KaitaiStream p__io, Zip.PkSection p__parent = null, Zip p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _header = new LocalFileHeader(m_io, this, m_root);
                _body = m_io.ReadBytes(Header.LenBodyCompressed);
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
        public partial class DataDescriptor : KaitaiStruct
        {
            public static DataDescriptor FromFile(string fileName)
            {
                return new DataDescriptor(new KaitaiStream(fileName));
            }

            public DataDescriptor(KaitaiStream p__io, Zip.PkSection p__parent = null, Zip p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _crc32 = m_io.ReadU4le();
                _lenBodyCompressed = m_io.ReadU4le();
                _lenBodyUncompressed = m_io.ReadU4le();
            }
            private uint _crc32;
            private uint _lenBodyCompressed;
            private uint _lenBodyUncompressed;
            private Zip m_root;
            private Zip.PkSection m_parent;
            public uint Crc32 { get { return _crc32; } }
            public uint LenBodyCompressed { get { return _lenBodyCompressed; } }
            public uint LenBodyUncompressed { get { return _lenBodyUncompressed; } }
            public Zip M_Root { get { return m_root; } }
            public Zip.PkSection M_Parent { get { return m_parent; } }
        }
        public partial class ExtraField : KaitaiStruct
        {
            public static ExtraField FromFile(string fileName)
            {
                return new ExtraField(new KaitaiStream(fileName));
            }

            public ExtraField(KaitaiStream p__io, Zip.Extras p__parent = null, Zip p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _code = ((Zip.ExtraCodes) m_io.ReadU2le());
                _lenBody = m_io.ReadU2le();
                switch (Code) {
                case Zip.ExtraCodes.Ntfs: {
                    __raw_body = m_io.ReadBytes(LenBody);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new Ntfs(io___raw_body, this, m_root);
                    break;
                }
                case Zip.ExtraCodes.ExtendedTimestamp: {
                    __raw_body = m_io.ReadBytes(LenBody);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new ExtendedTimestamp(io___raw_body, this, m_root);
                    break;
                }
                case Zip.ExtraCodes.InfozipUnixVarSize: {
                    __raw_body = m_io.ReadBytes(LenBody);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new InfozipUnixVarSize(io___raw_body, this, m_root);
                    break;
                }
                default: {
                    _body = m_io.ReadBytes(LenBody);
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

                public Ntfs(KaitaiStream p__io, Zip.ExtraField p__parent = null, Zip p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _reserved = m_io.ReadU4le();
                    _attributes = new List<Attribute>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            _attributes.Add(new Attribute(m_io, this, m_root));
                            i++;
                        }
                    }
                }
                public partial class Attribute : KaitaiStruct
                {
                    public static Attribute FromFile(string fileName)
                    {
                        return new Attribute(new KaitaiStream(fileName));
                    }

                    public Attribute(KaitaiStream p__io, Zip.ExtraField.Ntfs p__parent = null, Zip p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _tag = m_io.ReadU2le();
                        _lenBody = m_io.ReadU2le();
                        switch (Tag) {
                        case 1: {
                            __raw_body = m_io.ReadBytes(LenBody);
                            var io___raw_body = new KaitaiStream(__raw_body);
                            _body = new Attribute1(io___raw_body, this, m_root);
                            break;
                        }
                        default: {
                            _body = m_io.ReadBytes(LenBody);
                            break;
                        }
                        }
                    }
                    private ushort _tag;
                    private ushort _lenBody;
                    private object _body;
                    private Zip m_root;
                    private Zip.ExtraField.Ntfs m_parent;
                    private byte[] __raw_body;
                    public ushort Tag { get { return _tag; } }
                    public ushort LenBody { get { return _lenBody; } }
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

                    public Attribute1(KaitaiStream p__io, Zip.ExtraField.Ntfs.Attribute p__parent = null, Zip p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
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

                public ExtendedTimestamp(KaitaiStream p__io, Zip.ExtraField p__parent = null, Zip p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
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
                private uint? _accessTime;
                private uint? _createTime;
                private Zip m_root;
                private Zip.ExtraField m_parent;
                public byte Flags { get { return _flags; } }
                public uint ModTime { get { return _modTime; } }
                public uint? AccessTime { get { return _accessTime; } }
                public uint? CreateTime { get { return _createTime; } }
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

                public InfozipUnixVarSize(KaitaiStream p__io, Zip.ExtraField p__parent = null, Zip p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _version = m_io.ReadU1();
                    _lenUid = m_io.ReadU1();
                    _uid = m_io.ReadBytes(LenUid);
                    _lenGid = m_io.ReadU1();
                    _gid = m_io.ReadBytes(LenGid);
                }
                private byte _version;
                private byte _lenUid;
                private byte[] _uid;
                private byte _lenGid;
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
                public byte LenUid { get { return _lenUid; } }

                /// <summary>
                /// UID (User ID) for a file
                /// </summary>
                public byte[] Uid { get { return _uid; } }

                /// <summary>
                /// Size of GID field
                /// </summary>
                public byte LenGid { get { return _lenGid; } }

                /// <summary>
                /// GID (Group ID) for a file
                /// </summary>
                public byte[] Gid { get { return _gid; } }
                public Zip M_Root { get { return m_root; } }
                public Zip.ExtraField M_Parent { get { return m_parent; } }
            }
            private ExtraCodes _code;
            private ushort _lenBody;
            private object _body;
            private Zip m_root;
            private Zip.Extras m_parent;
            private byte[] __raw_body;
            public ExtraCodes Code { get { return _code; } }
            public ushort LenBody { get { return _lenBody; } }
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

            public CentralDirEntry(KaitaiStream p__io, Zip.PkSection p__parent = null, Zip p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_localHeader = false;
                _read();
            }
            private void _read()
            {
                _versionMadeBy = m_io.ReadU2le();
                _versionNeededToExtract = m_io.ReadU2le();
                _flags = m_io.ReadU2le();
                _compressionMethod = ((Zip.Compression) m_io.ReadU2le());
                _lastModFileTime = m_io.ReadU2le();
                _lastModFileDate = m_io.ReadU2le();
                _crc32 = m_io.ReadU4le();
                _lenBodyCompressed = m_io.ReadU4le();
                _lenBodyUncompressed = m_io.ReadU4le();
                _lenFileName = m_io.ReadU2le();
                _lenExtra = m_io.ReadU2le();
                _lenComment = m_io.ReadU2le();
                _diskNumberStart = m_io.ReadU2le();
                _intFileAttr = m_io.ReadU2le();
                _extFileAttr = m_io.ReadU4le();
                _ofsLocalHeader = m_io.ReadS4le();
                _fileName = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(LenFileName));
                __raw_extra = m_io.ReadBytes(LenExtra);
                var io___raw_extra = new KaitaiStream(__raw_extra);
                _extra = new Extras(io___raw_extra, this, m_root);
                _comment = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(LenComment));
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
                    m_io.Seek(OfsLocalHeader);
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
            private uint _lenBodyCompressed;
            private uint _lenBodyUncompressed;
            private ushort _lenFileName;
            private ushort _lenExtra;
            private ushort _lenComment;
            private ushort _diskNumberStart;
            private ushort _intFileAttr;
            private uint _extFileAttr;
            private int _ofsLocalHeader;
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
            public uint LenBodyCompressed { get { return _lenBodyCompressed; } }
            public uint LenBodyUncompressed { get { return _lenBodyUncompressed; } }
            public ushort LenFileName { get { return _lenFileName; } }
            public ushort LenExtra { get { return _lenExtra; } }
            public ushort LenComment { get { return _lenComment; } }
            public ushort DiskNumberStart { get { return _diskNumberStart; } }
            public ushort IntFileAttr { get { return _intFileAttr; } }
            public uint ExtFileAttr { get { return _extFileAttr; } }
            public int OfsLocalHeader { get { return _ofsLocalHeader; } }
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

            public PkSection(KaitaiStream p__io, KaitaiStruct p__parent = null, Zip p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
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
                case 2055: {
                    _body = new DataDescriptor(m_io, this, m_root);
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

            public Extras(KaitaiStream p__io, KaitaiStruct p__parent = null, Zip p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<ExtraField>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _entries.Add(new ExtraField(m_io, this, m_root));
                        i++;
                    }
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

            public LocalFileHeader(KaitaiStream p__io, Zip.LocalFile p__parent = null, Zip p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _version = m_io.ReadU2le();
                _flags = m_io.ReadU2le();
                _compressionMethod = ((Zip.Compression) m_io.ReadU2le());
                _fileModTime = m_io.ReadU2le();
                _fileModDate = m_io.ReadU2le();
                _crc32 = m_io.ReadU4le();
                _lenBodyCompressed = m_io.ReadU4le();
                _lenBodyUncompressed = m_io.ReadU4le();
                _lenFileName = m_io.ReadU2le();
                _lenExtra = m_io.ReadU2le();
                _fileName = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(LenFileName));
                __raw_extra = m_io.ReadBytes(LenExtra);
                var io___raw_extra = new KaitaiStream(__raw_extra);
                _extra = new Extras(io___raw_extra, this, m_root);
            }
            private ushort _version;
            private ushort _flags;
            private Compression _compressionMethod;
            private ushort _fileModTime;
            private ushort _fileModDate;
            private uint _crc32;
            private uint _lenBodyCompressed;
            private uint _lenBodyUncompressed;
            private ushort _lenFileName;
            private ushort _lenExtra;
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
            public uint LenBodyCompressed { get { return _lenBodyCompressed; } }
            public uint LenBodyUncompressed { get { return _lenBodyUncompressed; } }
            public ushort LenFileName { get { return _lenFileName; } }
            public ushort LenExtra { get { return _lenExtra; } }
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

            public EndOfCentralDir(KaitaiStream p__io, Zip.PkSection p__parent = null, Zip p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _diskOfEndOfCentralDir = m_io.ReadU2le();
                _diskOfCentralDir = m_io.ReadU2le();
                _numCentralDirEntriesOnDisk = m_io.ReadU2le();
                _numCentralDirEntriesTotal = m_io.ReadU2le();
                _lenCentralDir = m_io.ReadU4le();
                _ofsCentralDir = m_io.ReadU4le();
                _lenComment = m_io.ReadU2le();
                _comment = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(LenComment));
            }
            private ushort _diskOfEndOfCentralDir;
            private ushort _diskOfCentralDir;
            private ushort _numCentralDirEntriesOnDisk;
            private ushort _numCentralDirEntriesTotal;
            private uint _lenCentralDir;
            private uint _ofsCentralDir;
            private ushort _lenComment;
            private string _comment;
            private Zip m_root;
            private Zip.PkSection m_parent;
            public ushort DiskOfEndOfCentralDir { get { return _diskOfEndOfCentralDir; } }
            public ushort DiskOfCentralDir { get { return _diskOfCentralDir; } }
            public ushort NumCentralDirEntriesOnDisk { get { return _numCentralDirEntriesOnDisk; } }
            public ushort NumCentralDirEntriesTotal { get { return _numCentralDirEntriesTotal; } }
            public uint LenCentralDir { get { return _lenCentralDir; } }
            public uint OfsCentralDir { get { return _ofsCentralDir; } }
            public ushort LenComment { get { return _lenComment; } }
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

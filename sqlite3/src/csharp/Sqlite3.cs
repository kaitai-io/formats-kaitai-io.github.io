// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// SQLite3 is a popular serverless SQL engine, implemented as a library
    /// to be used within other applications. It keeps its databases as
    /// regular disk files.
    /// 
    /// Every database file is segmented into pages. First page (starting at
    /// the very beginning) is special: it contains a file-global header
    /// which specifies some data relevant to proper parsing (i.e. format
    /// versions, size of page, etc). After the header, normal contents of
    /// the first page follow.
    /// 
    /// Each page would be of some type, and generally, they would be
    /// reached via the links starting from the first page. First page type
    /// (`root_page`) is always &quot;btree_page&quot;.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://www.sqlite.org/fileformat.html">Source</a>
    /// </remarks>
    public partial class Sqlite3 : KaitaiStruct
    {
        public static Sqlite3 FromFile(string fileName)
        {
            return new Sqlite3(new KaitaiStream(fileName));
        }


        public enum Versions
        {
            Legacy = 1,
            Wal = 2,
        }

        public enum Encodings
        {
            Utf8 = 1,
            Utf16le = 2,
            Utf16be = 3,
        }
        public Sqlite3(KaitaiStream p__io, KaitaiStruct p__parent = null, Sqlite3 p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_lenPage = false;
            _read();
        }
        private void _read()
        {
            _magic = m_io.ReadBytes(16);
            if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 83, 81, 76, 105, 116, 101, 32, 102, 111, 114, 109, 97, 116, 32, 51, 0 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 83, 81, 76, 105, 116, 101, 32, 102, 111, 114, 109, 97, 116, 32, 51, 0 }, Magic, M_Io, "/seq/0");
            }
            _lenPageMod = m_io.ReadU2be();
            _writeVersion = ((Versions) m_io.ReadU1());
            _readVersion = ((Versions) m_io.ReadU1());
            _reservedSpace = m_io.ReadU1();
            _maxPayloadFrac = m_io.ReadU1();
            _minPayloadFrac = m_io.ReadU1();
            _leafPayloadFrac = m_io.ReadU1();
            _fileChangeCounter = m_io.ReadU4be();
            _numPages = m_io.ReadU4be();
            _firstFreelistTrunkPage = m_io.ReadU4be();
            _numFreelistPages = m_io.ReadU4be();
            _schemaCookie = m_io.ReadU4be();
            _schemaFormat = m_io.ReadU4be();
            _defPageCacheSize = m_io.ReadU4be();
            _largestRootPage = m_io.ReadU4be();
            _textEncoding = ((Encodings) m_io.ReadU4be());
            _userVersion = m_io.ReadU4be();
            _isIncrementalVacuum = m_io.ReadU4be();
            _applicationId = m_io.ReadU4be();
            _reserved = m_io.ReadBytes(20);
            _versionValidFor = m_io.ReadU4be();
            _sqliteVersionNumber = m_io.ReadU4be();
            _rootPage = new BtreePage(m_io, this, m_root);
        }
        public partial class Serial : KaitaiStruct
        {
            public static Serial FromFile(string fileName)
            {
                return new Serial(new KaitaiStream(fileName));
            }

            public Serial(KaitaiStream p__io, KaitaiStruct p__parent = null, Sqlite3 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_isBlob = false;
                f_isString = false;
                f_lenContent = false;
                _read();
            }
            private void _read()
            {
                _code = new VlqBase128Be(m_io);
            }
            private bool f_isBlob;
            private bool _isBlob;
            public bool IsBlob
            {
                get
                {
                    if (f_isBlob)
                        return _isBlob;
                    _isBlob = (bool) ( ((Code.Value >= 12) && (KaitaiStream.Mod(Code.Value, 2) == 0)) );
                    f_isBlob = true;
                    return _isBlob;
                }
            }
            private bool f_isString;
            private bool _isString;
            public bool IsString
            {
                get
                {
                    if (f_isString)
                        return _isString;
                    _isString = (bool) ( ((Code.Value >= 13) && (KaitaiStream.Mod(Code.Value, 2) == 1)) );
                    f_isString = true;
                    return _isString;
                }
            }
            private bool f_lenContent;
            private int? _lenContent;
            public int? LenContent
            {
                get
                {
                    if (f_lenContent)
                        return _lenContent;
                    if (Code.Value >= 12) {
                        _lenContent = (int) (((Code.Value - 12) / 2));
                    }
                    f_lenContent = true;
                    return _lenContent;
                }
            }
            private VlqBase128Be _code;
            private Sqlite3 m_root;
            private KaitaiStruct m_parent;
            public VlqBase128Be Code { get { return _code; } }
            public Sqlite3 M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class BtreePage : KaitaiStruct
        {
            public static BtreePage FromFile(string fileName)
            {
                return new BtreePage(new KaitaiStream(fileName));
            }

            public BtreePage(KaitaiStream p__io, Sqlite3 p__parent = null, Sqlite3 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _pageType = m_io.ReadU1();
                _firstFreeblock = m_io.ReadU2be();
                _numCells = m_io.ReadU2be();
                _ofsCells = m_io.ReadU2be();
                _numFragFreeBytes = m_io.ReadU1();
                if ( ((PageType == 2) || (PageType == 5)) ) {
                    _rightPtr = m_io.ReadU4be();
                }
                _cells = new List<RefCell>();
                for (var i = 0; i < NumCells; i++)
                {
                    _cells.Add(new RefCell(m_io, this, m_root));
                }
            }
            private byte _pageType;
            private ushort _firstFreeblock;
            private ushort _numCells;
            private ushort _ofsCells;
            private byte _numFragFreeBytes;
            private uint? _rightPtr;
            private List<RefCell> _cells;
            private Sqlite3 m_root;
            private Sqlite3 m_parent;
            public byte PageType { get { return _pageType; } }
            public ushort FirstFreeblock { get { return _firstFreeblock; } }
            public ushort NumCells { get { return _numCells; } }
            public ushort OfsCells { get { return _ofsCells; } }
            public byte NumFragFreeBytes { get { return _numFragFreeBytes; } }
            public uint? RightPtr { get { return _rightPtr; } }
            public List<RefCell> Cells { get { return _cells; } }
            public Sqlite3 M_Root { get { return m_root; } }
            public Sqlite3 M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.sqlite.org/fileformat.html#b_tree_pages">Source</a>
        /// </remarks>
        public partial class CellIndexLeaf : KaitaiStruct
        {
            public static CellIndexLeaf FromFile(string fileName)
            {
                return new CellIndexLeaf(new KaitaiStream(fileName));
            }

            public CellIndexLeaf(KaitaiStream p__io, Sqlite3.RefCell p__parent = null, Sqlite3 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenPayload = new VlqBase128Be(m_io);
                __raw_payload = m_io.ReadBytes(LenPayload.Value);
                var io___raw_payload = new KaitaiStream(__raw_payload);
                _payload = new CellPayload(io___raw_payload, this, m_root);
            }
            private VlqBase128Be _lenPayload;
            private CellPayload _payload;
            private Sqlite3 m_root;
            private Sqlite3.RefCell m_parent;
            private byte[] __raw_payload;
            public VlqBase128Be LenPayload { get { return _lenPayload; } }
            public CellPayload Payload { get { return _payload; } }
            public Sqlite3 M_Root { get { return m_root; } }
            public Sqlite3.RefCell M_Parent { get { return m_parent; } }
            public byte[] M_RawPayload { get { return __raw_payload; } }
        }
        public partial class Serials : KaitaiStruct
        {
            public static Serials FromFile(string fileName)
            {
                return new Serials(new KaitaiStream(fileName));
            }

            public Serials(KaitaiStream p__io, Sqlite3.CellPayload p__parent = null, Sqlite3 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<VlqBase128Be>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _entries.Add(new VlqBase128Be(m_io));
                        i++;
                    }
                }
            }
            private List<VlqBase128Be> _entries;
            private Sqlite3 m_root;
            private Sqlite3.CellPayload m_parent;
            public List<VlqBase128Be> Entries { get { return _entries; } }
            public Sqlite3 M_Root { get { return m_root; } }
            public Sqlite3.CellPayload M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.sqlite.org/fileformat.html#b_tree_pages">Source</a>
        /// </remarks>
        public partial class CellTableLeaf : KaitaiStruct
        {
            public static CellTableLeaf FromFile(string fileName)
            {
                return new CellTableLeaf(new KaitaiStream(fileName));
            }

            public CellTableLeaf(KaitaiStream p__io, Sqlite3.RefCell p__parent = null, Sqlite3 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenPayload = new VlqBase128Be(m_io);
                _rowId = new VlqBase128Be(m_io);
                __raw_payload = m_io.ReadBytes(LenPayload.Value);
                var io___raw_payload = new KaitaiStream(__raw_payload);
                _payload = new CellPayload(io___raw_payload, this, m_root);
            }
            private VlqBase128Be _lenPayload;
            private VlqBase128Be _rowId;
            private CellPayload _payload;
            private Sqlite3 m_root;
            private Sqlite3.RefCell m_parent;
            private byte[] __raw_payload;
            public VlqBase128Be LenPayload { get { return _lenPayload; } }
            public VlqBase128Be RowId { get { return _rowId; } }
            public CellPayload Payload { get { return _payload; } }
            public Sqlite3 M_Root { get { return m_root; } }
            public Sqlite3.RefCell M_Parent { get { return m_parent; } }
            public byte[] M_RawPayload { get { return __raw_payload; } }
        }

        /// <remarks>
        /// Reference: <a href="https://sqlite.org/fileformat2.html#record_format">Source</a>
        /// </remarks>
        public partial class CellPayload : KaitaiStruct
        {
            public static CellPayload FromFile(string fileName)
            {
                return new CellPayload(new KaitaiStream(fileName));
            }

            public CellPayload(KaitaiStream p__io, KaitaiStruct p__parent = null, Sqlite3 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenHeaderAndLen = new VlqBase128Be(m_io);
                __raw_columnSerials = m_io.ReadBytes((LenHeaderAndLen.Value - 1));
                var io___raw_columnSerials = new KaitaiStream(__raw_columnSerials);
                _columnSerials = new Serials(io___raw_columnSerials, this, m_root);
                _columnContents = new List<ColumnContent>();
                for (var i = 0; i < ColumnSerials.Entries.Count; i++)
                {
                    _columnContents.Add(new ColumnContent(ColumnSerials.Entries[i], m_io, this, m_root));
                }
            }
            private VlqBase128Be _lenHeaderAndLen;
            private Serials _columnSerials;
            private List<ColumnContent> _columnContents;
            private Sqlite3 m_root;
            private KaitaiStruct m_parent;
            private byte[] __raw_columnSerials;
            public VlqBase128Be LenHeaderAndLen { get { return _lenHeaderAndLen; } }
            public Serials ColumnSerials { get { return _columnSerials; } }
            public List<ColumnContent> ColumnContents { get { return _columnContents; } }
            public Sqlite3 M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
            public byte[] M_RawColumnSerials { get { return __raw_columnSerials; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.sqlite.org/fileformat.html#b_tree_pages">Source</a>
        /// </remarks>
        public partial class CellTableInterior : KaitaiStruct
        {
            public static CellTableInterior FromFile(string fileName)
            {
                return new CellTableInterior(new KaitaiStream(fileName));
            }

            public CellTableInterior(KaitaiStream p__io, Sqlite3.RefCell p__parent = null, Sqlite3 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _leftChildPage = m_io.ReadU4be();
                _rowId = new VlqBase128Be(m_io);
            }
            private uint _leftChildPage;
            private VlqBase128Be _rowId;
            private Sqlite3 m_root;
            private Sqlite3.RefCell m_parent;
            public uint LeftChildPage { get { return _leftChildPage; } }
            public VlqBase128Be RowId { get { return _rowId; } }
            public Sqlite3 M_Root { get { return m_root; } }
            public Sqlite3.RefCell M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.sqlite.org/fileformat.html#b_tree_pages">Source</a>
        /// </remarks>
        public partial class CellIndexInterior : KaitaiStruct
        {
            public static CellIndexInterior FromFile(string fileName)
            {
                return new CellIndexInterior(new KaitaiStream(fileName));
            }

            public CellIndexInterior(KaitaiStream p__io, Sqlite3.RefCell p__parent = null, Sqlite3 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _leftChildPage = m_io.ReadU4be();
                _lenPayload = new VlqBase128Be(m_io);
                __raw_payload = m_io.ReadBytes(LenPayload.Value);
                var io___raw_payload = new KaitaiStream(__raw_payload);
                _payload = new CellPayload(io___raw_payload, this, m_root);
            }
            private uint _leftChildPage;
            private VlqBase128Be _lenPayload;
            private CellPayload _payload;
            private Sqlite3 m_root;
            private Sqlite3.RefCell m_parent;
            private byte[] __raw_payload;
            public uint LeftChildPage { get { return _leftChildPage; } }
            public VlqBase128Be LenPayload { get { return _lenPayload; } }
            public CellPayload Payload { get { return _payload; } }
            public Sqlite3 M_Root { get { return m_root; } }
            public Sqlite3.RefCell M_Parent { get { return m_parent; } }
            public byte[] M_RawPayload { get { return __raw_payload; } }
        }
        public partial class ColumnContent : KaitaiStruct
        {
            public ColumnContent(KaitaiStruct p_ser, KaitaiStream p__io, Sqlite3.CellPayload p__parent = null, Sqlite3 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _ser = p_ser;
                f_serialType = false;
                _read();
            }
            private void _read()
            {
                if ( ((SerialType.Code.Value >= 1) && (SerialType.Code.Value <= 6)) ) {
                    switch (SerialType.Code.Value) {
                    case 4: {
                        _asInt = m_io.ReadU4be();
                        break;
                    }
                    case 6: {
                        _asInt = m_io.ReadU8be();
                        break;
                    }
                    case 1: {
                        _asInt = m_io.ReadU1();
                        break;
                    }
                    case 3: {
                        _asInt = m_io.ReadBitsIntBe(24);
                        break;
                    }
                    case 5: {
                        _asInt = m_io.ReadBitsIntBe(48);
                        break;
                    }
                    case 2: {
                        _asInt = m_io.ReadU2be();
                        break;
                    }
                    }
                }
                if (SerialType.Code.Value == 7) {
                    _asFloat = m_io.ReadF8be();
                }
                if (SerialType.IsBlob) {
                    _asBlob = m_io.ReadBytes(SerialType.LenContent);
                }
                _asStr = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(SerialType.LenContent));
            }
            private bool f_serialType;
            private Sqlite3.Serial _serialType;
            public Sqlite3.Serial SerialType
            {
                get
                {
                    if (f_serialType)
                        return _serialType;
                    _serialType = (Sqlite3.Serial) (((Sqlite3.Serial) (Ser)));
                    f_serialType = true;
                    return _serialType;
                }
            }
            private int _asInt;
            private double? _asFloat;
            private byte[] _asBlob;
            private string _asStr;
            private KaitaiStruct _ser;
            private Sqlite3 m_root;
            private Sqlite3.CellPayload m_parent;
            public int AsInt { get { return _asInt; } }
            public double? AsFloat { get { return _asFloat; } }
            public byte[] AsBlob { get { return _asBlob; } }
            public string AsStr { get { return _asStr; } }
            public KaitaiStruct Ser { get { return _ser; } }
            public Sqlite3 M_Root { get { return m_root; } }
            public Sqlite3.CellPayload M_Parent { get { return m_parent; } }
        }
        public partial class RefCell : KaitaiStruct
        {
            public static RefCell FromFile(string fileName)
            {
                return new RefCell(new KaitaiStream(fileName));
            }

            public RefCell(KaitaiStream p__io, Sqlite3.BtreePage p__parent = null, Sqlite3 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_body = false;
                _read();
            }
            private void _read()
            {
                _ofsBody = m_io.ReadU2be();
            }
            private bool f_body;
            private KaitaiStruct _body;
            public KaitaiStruct Body
            {
                get
                {
                    if (f_body)
                        return _body;
                    long _pos = m_io.Pos;
                    m_io.Seek(OfsBody);
                    switch (M_Parent.PageType) {
                    case 13: {
                        _body = new CellTableLeaf(m_io, this, m_root);
                        break;
                    }
                    case 5: {
                        _body = new CellTableInterior(m_io, this, m_root);
                        break;
                    }
                    case 10: {
                        _body = new CellIndexLeaf(m_io, this, m_root);
                        break;
                    }
                    case 2: {
                        _body = new CellIndexInterior(m_io, this, m_root);
                        break;
                    }
                    }
                    m_io.Seek(_pos);
                    f_body = true;
                    return _body;
                }
            }
            private ushort _ofsBody;
            private Sqlite3 m_root;
            private Sqlite3.BtreePage m_parent;
            public ushort OfsBody { get { return _ofsBody; } }
            public Sqlite3 M_Root { get { return m_root; } }
            public Sqlite3.BtreePage M_Parent { get { return m_parent; } }
        }
        private bool f_lenPage;
        private int _lenPage;
        public int LenPage
        {
            get
            {
                if (f_lenPage)
                    return _lenPage;
                _lenPage = (int) ((LenPageMod == 1 ? 65536 : LenPageMod));
                f_lenPage = true;
                return _lenPage;
            }
        }
        private byte[] _magic;
        private ushort _lenPageMod;
        private Versions _writeVersion;
        private Versions _readVersion;
        private byte _reservedSpace;
        private byte _maxPayloadFrac;
        private byte _minPayloadFrac;
        private byte _leafPayloadFrac;
        private uint _fileChangeCounter;
        private uint _numPages;
        private uint _firstFreelistTrunkPage;
        private uint _numFreelistPages;
        private uint _schemaCookie;
        private uint _schemaFormat;
        private uint _defPageCacheSize;
        private uint _largestRootPage;
        private Encodings _textEncoding;
        private uint _userVersion;
        private uint _isIncrementalVacuum;
        private uint _applicationId;
        private byte[] _reserved;
        private uint _versionValidFor;
        private uint _sqliteVersionNumber;
        private BtreePage _rootPage;
        private Sqlite3 m_root;
        private KaitaiStruct m_parent;
        public byte[] Magic { get { return _magic; } }

        /// <summary>
        /// The database page size in bytes. Must be a power of two between
        /// 512 and 32768 inclusive, or the value 1 representing a page size
        /// of 65536.
        /// </summary>
        public ushort LenPageMod { get { return _lenPageMod; } }
        public Versions WriteVersion { get { return _writeVersion; } }
        public Versions ReadVersion { get { return _readVersion; } }

        /// <summary>
        /// Bytes of unused &quot;reserved&quot; space at the end of each page. Usually 0.
        /// </summary>
        public byte ReservedSpace { get { return _reservedSpace; } }

        /// <summary>
        /// Maximum embedded payload fraction. Must be 64.
        /// </summary>
        public byte MaxPayloadFrac { get { return _maxPayloadFrac; } }

        /// <summary>
        /// Minimum embedded payload fraction. Must be 32.
        /// </summary>
        public byte MinPayloadFrac { get { return _minPayloadFrac; } }

        /// <summary>
        /// Leaf payload fraction. Must be 32.
        /// </summary>
        public byte LeafPayloadFrac { get { return _leafPayloadFrac; } }
        public uint FileChangeCounter { get { return _fileChangeCounter; } }

        /// <summary>
        /// Size of the database file in pages. The &quot;in-header database size&quot;.
        /// </summary>
        public uint NumPages { get { return _numPages; } }

        /// <summary>
        /// Page number of the first freelist trunk page.
        /// </summary>
        public uint FirstFreelistTrunkPage { get { return _firstFreelistTrunkPage; } }

        /// <summary>
        /// Total number of freelist pages.
        /// </summary>
        public uint NumFreelistPages { get { return _numFreelistPages; } }
        public uint SchemaCookie { get { return _schemaCookie; } }

        /// <summary>
        /// The schema format number. Supported schema formats are 1, 2, 3, and 4.
        /// </summary>
        public uint SchemaFormat { get { return _schemaFormat; } }

        /// <summary>
        /// Default page cache size.
        /// </summary>
        public uint DefPageCacheSize { get { return _defPageCacheSize; } }

        /// <summary>
        /// The page number of the largest root b-tree page when in auto-vacuum or incremental-vacuum modes, or zero otherwise.
        /// </summary>
        public uint LargestRootPage { get { return _largestRootPage; } }

        /// <summary>
        /// The database text encoding. A value of 1 means UTF-8. A value of 2 means UTF-16le. A value of 3 means UTF-16be.
        /// </summary>
        public Encodings TextEncoding { get { return _textEncoding; } }

        /// <summary>
        /// The &quot;user version&quot; as read and set by the user_version pragma.
        /// </summary>
        public uint UserVersion { get { return _userVersion; } }

        /// <summary>
        /// True (non-zero) for incremental-vacuum mode. False (zero) otherwise.
        /// </summary>
        public uint IsIncrementalVacuum { get { return _isIncrementalVacuum; } }

        /// <summary>
        /// The &quot;Application ID&quot; set by PRAGMA application_id.
        /// </summary>
        public uint ApplicationId { get { return _applicationId; } }
        public byte[] Reserved { get { return _reserved; } }
        public uint VersionValidFor { get { return _versionValidFor; } }
        public uint SqliteVersionNumber { get { return _sqliteVersionNumber; } }
        public BtreePage RootPage { get { return _rootPage; } }
        public Sqlite3 M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

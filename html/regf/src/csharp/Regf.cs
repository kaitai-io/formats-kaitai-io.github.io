// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// This spec allows to parse files used by Microsoft Windows family of
    /// operating systems to store parts of its &quot;registry&quot;. &quot;Registry&quot; is a
    /// hierarchical database that is used to store system settings (global
    /// configuration, per-user, per-application configuration, etc).
    /// 
    /// Typically, registry files are stored in:
    /// 
    /// * System-wide: several files in `%SystemRoot%\System32\Config\`
    /// * User-wide:
    ///   * `%USERPROFILE%\Ntuser.dat`
    ///   * `%USERPROFILE%\Local Settings\Application Data\Microsoft\Windows\Usrclass.dat` (localized, Windows 2000, Server 2003 and Windows XP)
    ///   * `%USERPROFILE%\AppData\Local\Microsoft\Windows\Usrclass.dat` (non-localized, Windows Vista and later)
    /// 
    /// Note that one typically can't access files directly on a mounted
    /// filesystem with a running Windows OS.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://github.com/libyal/libregf/blob/master/documentation/Windows%20NT%20Registry%20File%20(REGF)%20format.asciidoc">Source</a>
    /// </remarks>
    public partial class Regf : KaitaiStruct
    {
        public static Regf FromFile(string fileName)
        {
            return new Regf(new KaitaiStream(fileName));
        }

        public Regf(KaitaiStream p__io, KaitaiStruct p__parent = null, Regf p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _header = new FileHeader(m_io, this, m_root);
            __raw_hiveBins = new List<byte[]>();
            _hiveBins = new List<HiveBin>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    __raw_hiveBins.Add(m_io.ReadBytes(4096));
                    var io___raw_hiveBins = new KaitaiStream(__raw_hiveBins[__raw_hiveBins.Count - 1]);
                    _hiveBins.Add(new HiveBin(io___raw_hiveBins, this, m_root));
                    i++;
                }
            }
        }
        public partial class Filetime : KaitaiStruct
        {
            public static Filetime FromFile(string fileName)
            {
                return new Filetime(new KaitaiStream(fileName));
            }

            public Filetime(KaitaiStream p__io, KaitaiStruct p__parent = null, Regf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _value = m_io.ReadU8le();
            }
            private ulong _value;
            private Regf m_root;
            private KaitaiStruct m_parent;
            public ulong Value { get { return _value; } }
            public Regf M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class HiveBin : KaitaiStruct
        {
            public static HiveBin FromFile(string fileName)
            {
                return new HiveBin(new KaitaiStream(fileName));
            }

            public HiveBin(KaitaiStream p__io, Regf p__parent = null, Regf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _header = new HiveBinHeader(m_io, this, m_root);
                _cells = new List<HiveBinCell>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _cells.Add(new HiveBinCell(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private HiveBinHeader _header;
            private List<HiveBinCell> _cells;
            private Regf m_root;
            private Regf m_parent;
            public HiveBinHeader Header { get { return _header; } }
            public List<HiveBinCell> Cells { get { return _cells; } }
            public Regf M_Root { get { return m_root; } }
            public Regf M_Parent { get { return m_parent; } }
        }
        public partial class HiveBinHeader : KaitaiStruct
        {
            public static HiveBinHeader FromFile(string fileName)
            {
                return new HiveBinHeader(new KaitaiStream(fileName));
            }

            public HiveBinHeader(KaitaiStream p__io, Regf.HiveBin p__parent = null, Regf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _signature = m_io.EnsureFixedContents(new byte[] { 104, 98, 105, 110 });
                _offset = m_io.ReadU4le();
                _size = m_io.ReadU4le();
                _unknown1 = m_io.ReadU4le();
                _unknown2 = m_io.ReadU4le();
                _timestamp = new Filetime(m_io, this, m_root);
                _unknown4 = m_io.ReadU4le();
            }
            private byte[] _signature;
            private uint _offset;
            private uint _size;
            private uint _unknown1;
            private uint _unknown2;
            private Filetime _timestamp;
            private uint _unknown4;
            private Regf m_root;
            private Regf.HiveBin m_parent;
            public byte[] Signature { get { return _signature; } }

            /// <summary>
            /// The offset of the hive bin, Value in bytes and relative from
            /// the start of the hive bin data
            /// </summary>
            public uint Offset { get { return _offset; } }

            /// <summary>
            /// Size of the hive bin
            /// </summary>
            public uint Size { get { return _size; } }

            /// <summary>
            /// 0 most of the time, can contain remnant data
            /// </summary>
            public uint Unknown1 { get { return _unknown1; } }

            /// <summary>
            /// 0 most of the time, can contain remnant data
            /// </summary>
            public uint Unknown2 { get { return _unknown2; } }

            /// <summary>
            /// Only the root (first) hive bin seems to contain a valid FILETIME
            /// </summary>
            public Filetime Timestamp { get { return _timestamp; } }

            /// <summary>
            /// Contains number of bytes
            /// </summary>
            public uint Unknown4 { get { return _unknown4; } }
            public Regf M_Root { get { return m_root; } }
            public Regf.HiveBin M_Parent { get { return m_parent; } }
        }
        public partial class HiveBinCell : KaitaiStruct
        {
            public static HiveBinCell FromFile(string fileName)
            {
                return new HiveBinCell(new KaitaiStream(fileName));
            }

            public HiveBinCell(KaitaiStream p__io, Regf.HiveBin p__parent = null, Regf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_cellSize = false;
                f_isAllocated = false;
                _read();
            }
            private void _read()
            {
                _cellSizeRaw = m_io.ReadS4le();
                _identifier = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(2));
                switch (Identifier) {
                case "li": {
                    __raw_data = m_io.ReadBytes(((CellSize - 2) - 4));
                    var io___raw_data = new KaitaiStream(__raw_data);
                    _data = new SubKeyListLi(io___raw_data, this, m_root);
                    break;
                }
                case "vk": {
                    __raw_data = m_io.ReadBytes(((CellSize - 2) - 4));
                    var io___raw_data = new KaitaiStream(__raw_data);
                    _data = new SubKeyListVk(io___raw_data, this, m_root);
                    break;
                }
                case "lf": {
                    __raw_data = m_io.ReadBytes(((CellSize - 2) - 4));
                    var io___raw_data = new KaitaiStream(__raw_data);
                    _data = new SubKeyListLhLf(io___raw_data, this, m_root);
                    break;
                }
                case "ri": {
                    __raw_data = m_io.ReadBytes(((CellSize - 2) - 4));
                    var io___raw_data = new KaitaiStream(__raw_data);
                    _data = new SubKeyListRi(io___raw_data, this, m_root);
                    break;
                }
                case "lh": {
                    __raw_data = m_io.ReadBytes(((CellSize - 2) - 4));
                    var io___raw_data = new KaitaiStream(__raw_data);
                    _data = new SubKeyListLhLf(io___raw_data, this, m_root);
                    break;
                }
                case "nk": {
                    __raw_data = m_io.ReadBytes(((CellSize - 2) - 4));
                    var io___raw_data = new KaitaiStream(__raw_data);
                    _data = new NamedKey(io___raw_data, this, m_root);
                    break;
                }
                case "sk": {
                    __raw_data = m_io.ReadBytes(((CellSize - 2) - 4));
                    var io___raw_data = new KaitaiStream(__raw_data);
                    _data = new SubKeyListSk(io___raw_data, this, m_root);
                    break;
                }
                default: {
                    _data = m_io.ReadBytes(((CellSize - 2) - 4));
                    break;
                }
                }
            }
            public partial class SubKeyListVk : KaitaiStruct
            {
                public static SubKeyListVk FromFile(string fileName)
                {
                    return new SubKeyListVk(new KaitaiStream(fileName));
                }


                public enum DataTypeEnum
                {
                    RegNone = 0,
                    RegSz = 1,
                    RegExpandSz = 2,
                    RegBinary = 3,
                    RegDword = 4,
                    RegDwordBigEndian = 5,
                    RegLink = 6,
                    RegMultiSz = 7,
                    RegResourceList = 8,
                    RegFullResourceDescriptor = 9,
                    RegResourceRequirementsList = 10,
                    RegQword = 11,
                }

                public enum VkFlags
                {
                    ValueCompName = 1,
                }
                public SubKeyListVk(KaitaiStream p__io, Regf.HiveBinCell p__parent = null, Regf p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _valueNameSize = m_io.ReadU2le();
                    _dataSize = m_io.ReadU4le();
                    _dataOffset = m_io.ReadU4le();
                    _dataType = ((DataTypeEnum) m_io.ReadU4le());
                    _flags = ((VkFlags) m_io.ReadU2le());
                    _padding = m_io.ReadU2le();
                    if (Flags == VkFlags.ValueCompName) {
                        _valueName = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(ValueNameSize));
                    }
                }
                private ushort _valueNameSize;
                private uint _dataSize;
                private uint _dataOffset;
                private DataTypeEnum _dataType;
                private VkFlags _flags;
                private ushort _padding;
                private string _valueName;
                private Regf m_root;
                private Regf.HiveBinCell m_parent;
                public ushort ValueNameSize { get { return _valueNameSize; } }
                public uint DataSize { get { return _dataSize; } }
                public uint DataOffset { get { return _dataOffset; } }
                public DataTypeEnum DataType { get { return _dataType; } }
                public VkFlags Flags { get { return _flags; } }
                public ushort Padding { get { return _padding; } }
                public string ValueName { get { return _valueName; } }
                public Regf M_Root { get { return m_root; } }
                public Regf.HiveBinCell M_Parent { get { return m_parent; } }
            }
            public partial class SubKeyListLhLf : KaitaiStruct
            {
                public static SubKeyListLhLf FromFile(string fileName)
                {
                    return new SubKeyListLhLf(new KaitaiStream(fileName));
                }

                public SubKeyListLhLf(KaitaiStream p__io, Regf.HiveBinCell p__parent = null, Regf p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _count = m_io.ReadU2le();
                    _items = new List<Item>((int) (Count));
                    for (var i = 0; i < Count; i++)
                    {
                        _items.Add(new Item(m_io, this, m_root));
                    }
                }
                public partial class Item : KaitaiStruct
                {
                    public static Item FromFile(string fileName)
                    {
                        return new Item(new KaitaiStream(fileName));
                    }

                    public Item(KaitaiStream p__io, Regf.HiveBinCell.SubKeyListLhLf p__parent = null, Regf p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _namedKeyOffset = m_io.ReadU4le();
                        _hashValue = m_io.ReadU4le();
                    }
                    private uint _namedKeyOffset;
                    private uint _hashValue;
                    private Regf m_root;
                    private Regf.HiveBinCell.SubKeyListLhLf m_parent;
                    public uint NamedKeyOffset { get { return _namedKeyOffset; } }
                    public uint HashValue { get { return _hashValue; } }
                    public Regf M_Root { get { return m_root; } }
                    public Regf.HiveBinCell.SubKeyListLhLf M_Parent { get { return m_parent; } }
                }
                private ushort _count;
                private List<Item> _items;
                private Regf m_root;
                private Regf.HiveBinCell m_parent;
                public ushort Count { get { return _count; } }
                public List<Item> Items { get { return _items; } }
                public Regf M_Root { get { return m_root; } }
                public Regf.HiveBinCell M_Parent { get { return m_parent; } }
            }
            public partial class SubKeyListSk : KaitaiStruct
            {
                public static SubKeyListSk FromFile(string fileName)
                {
                    return new SubKeyListSk(new KaitaiStream(fileName));
                }

                public SubKeyListSk(KaitaiStream p__io, Regf.HiveBinCell p__parent = null, Regf p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _unknown1 = m_io.ReadU2le();
                    _previousSecurityKeyOffset = m_io.ReadU4le();
                    _nextSecurityKeyOffset = m_io.ReadU4le();
                    _referenceCount = m_io.ReadU4le();
                }
                private ushort _unknown1;
                private uint _previousSecurityKeyOffset;
                private uint _nextSecurityKeyOffset;
                private uint _referenceCount;
                private Regf m_root;
                private Regf.HiveBinCell m_parent;
                public ushort Unknown1 { get { return _unknown1; } }
                public uint PreviousSecurityKeyOffset { get { return _previousSecurityKeyOffset; } }
                public uint NextSecurityKeyOffset { get { return _nextSecurityKeyOffset; } }
                public uint ReferenceCount { get { return _referenceCount; } }
                public Regf M_Root { get { return m_root; } }
                public Regf.HiveBinCell M_Parent { get { return m_parent; } }
            }
            public partial class SubKeyListLi : KaitaiStruct
            {
                public static SubKeyListLi FromFile(string fileName)
                {
                    return new SubKeyListLi(new KaitaiStream(fileName));
                }

                public SubKeyListLi(KaitaiStream p__io, Regf.HiveBinCell p__parent = null, Regf p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _count = m_io.ReadU2le();
                    _items = new List<Item>((int) (Count));
                    for (var i = 0; i < Count; i++)
                    {
                        _items.Add(new Item(m_io, this, m_root));
                    }
                }
                public partial class Item : KaitaiStruct
                {
                    public static Item FromFile(string fileName)
                    {
                        return new Item(new KaitaiStream(fileName));
                    }

                    public Item(KaitaiStream p__io, Regf.HiveBinCell.SubKeyListLi p__parent = null, Regf p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _namedKeyOffset = m_io.ReadU4le();
                    }
                    private uint _namedKeyOffset;
                    private Regf m_root;
                    private Regf.HiveBinCell.SubKeyListLi m_parent;
                    public uint NamedKeyOffset { get { return _namedKeyOffset; } }
                    public Regf M_Root { get { return m_root; } }
                    public Regf.HiveBinCell.SubKeyListLi M_Parent { get { return m_parent; } }
                }
                private ushort _count;
                private List<Item> _items;
                private Regf m_root;
                private Regf.HiveBinCell m_parent;
                public ushort Count { get { return _count; } }
                public List<Item> Items { get { return _items; } }
                public Regf M_Root { get { return m_root; } }
                public Regf.HiveBinCell M_Parent { get { return m_parent; } }
            }
            public partial class NamedKey : KaitaiStruct
            {
                public static NamedKey FromFile(string fileName)
                {
                    return new NamedKey(new KaitaiStream(fileName));
                }


                public enum NkFlags
                {
                    KeyIsVolatile = 1,
                    KeyHiveExit = 2,
                    KeyHiveEntry = 4,
                    KeyNoDelete = 8,
                    KeySymLink = 16,
                    KeyCompName = 32,
                    KeyPrefefHandle = 64,
                    KeyVirtMirrored = 128,
                    KeyVirtTarget = 256,
                    KeyVirtualStore = 512,
                    Unknown1 = 4096,
                    Unknown2 = 16384,
                }
                public NamedKey(KaitaiStream p__io, Regf.HiveBinCell p__parent = null, Regf p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _flags = ((NkFlags) m_io.ReadU2le());
                    _lastKeyWrittenDateAndTime = new Filetime(m_io, this, m_root);
                    _unknown1 = m_io.ReadU4le();
                    _parentKeyOffset = m_io.ReadU4le();
                    _numberOfSubKeys = m_io.ReadU4le();
                    _numberOfVolatileSubKeys = m_io.ReadU4le();
                    _subKeysListOffset = m_io.ReadU4le();
                    _numberOfValues = m_io.ReadU4le();
                    _valuesListOffset = m_io.ReadU4le();
                    _securityKeyOffset = m_io.ReadU4le();
                    _classNameOffset = m_io.ReadU4le();
                    _largestSubKeyNameSize = m_io.ReadU4le();
                    _largestSubKeyClassNameSize = m_io.ReadU4le();
                    _largestValueNameSize = m_io.ReadU4le();
                    _largestValueDataSize = m_io.ReadU4le();
                    _unknown2 = m_io.ReadU4le();
                    _keyNameSize = m_io.ReadU2le();
                    _classNameSize = m_io.ReadU2le();
                    _unknownStringSize = m_io.ReadU4le();
                    _unknownString = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(UnknownStringSize));
                }
                private NkFlags _flags;
                private Filetime _lastKeyWrittenDateAndTime;
                private uint _unknown1;
                private uint _parentKeyOffset;
                private uint _numberOfSubKeys;
                private uint _numberOfVolatileSubKeys;
                private uint _subKeysListOffset;
                private uint _numberOfValues;
                private uint _valuesListOffset;
                private uint _securityKeyOffset;
                private uint _classNameOffset;
                private uint _largestSubKeyNameSize;
                private uint _largestSubKeyClassNameSize;
                private uint _largestValueNameSize;
                private uint _largestValueDataSize;
                private uint _unknown2;
                private ushort _keyNameSize;
                private ushort _classNameSize;
                private uint _unknownStringSize;
                private string _unknownString;
                private Regf m_root;
                private Regf.HiveBinCell m_parent;
                public NkFlags Flags { get { return _flags; } }
                public Filetime LastKeyWrittenDateAndTime { get { return _lastKeyWrittenDateAndTime; } }
                public uint Unknown1 { get { return _unknown1; } }
                public uint ParentKeyOffset { get { return _parentKeyOffset; } }
                public uint NumberOfSubKeys { get { return _numberOfSubKeys; } }
                public uint NumberOfVolatileSubKeys { get { return _numberOfVolatileSubKeys; } }
                public uint SubKeysListOffset { get { return _subKeysListOffset; } }
                public uint NumberOfValues { get { return _numberOfValues; } }
                public uint ValuesListOffset { get { return _valuesListOffset; } }
                public uint SecurityKeyOffset { get { return _securityKeyOffset; } }
                public uint ClassNameOffset { get { return _classNameOffset; } }
                public uint LargestSubKeyNameSize { get { return _largestSubKeyNameSize; } }
                public uint LargestSubKeyClassNameSize { get { return _largestSubKeyClassNameSize; } }
                public uint LargestValueNameSize { get { return _largestValueNameSize; } }
                public uint LargestValueDataSize { get { return _largestValueDataSize; } }
                public uint Unknown2 { get { return _unknown2; } }
                public ushort KeyNameSize { get { return _keyNameSize; } }
                public ushort ClassNameSize { get { return _classNameSize; } }
                public uint UnknownStringSize { get { return _unknownStringSize; } }
                public string UnknownString { get { return _unknownString; } }
                public Regf M_Root { get { return m_root; } }
                public Regf.HiveBinCell M_Parent { get { return m_parent; } }
            }
            public partial class SubKeyListRi : KaitaiStruct
            {
                public static SubKeyListRi FromFile(string fileName)
                {
                    return new SubKeyListRi(new KaitaiStream(fileName));
                }

                public SubKeyListRi(KaitaiStream p__io, Regf.HiveBinCell p__parent = null, Regf p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _count = m_io.ReadU2le();
                    _items = new List<Item>((int) (Count));
                    for (var i = 0; i < Count; i++)
                    {
                        _items.Add(new Item(m_io, this, m_root));
                    }
                }
                public partial class Item : KaitaiStruct
                {
                    public static Item FromFile(string fileName)
                    {
                        return new Item(new KaitaiStream(fileName));
                    }

                    public Item(KaitaiStream p__io, Regf.HiveBinCell.SubKeyListRi p__parent = null, Regf p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _subKeyListOffset = m_io.ReadU4le();
                    }
                    private uint _subKeyListOffset;
                    private Regf m_root;
                    private Regf.HiveBinCell.SubKeyListRi m_parent;
                    public uint SubKeyListOffset { get { return _subKeyListOffset; } }
                    public Regf M_Root { get { return m_root; } }
                    public Regf.HiveBinCell.SubKeyListRi M_Parent { get { return m_parent; } }
                }
                private ushort _count;
                private List<Item> _items;
                private Regf m_root;
                private Regf.HiveBinCell m_parent;
                public ushort Count { get { return _count; } }
                public List<Item> Items { get { return _items; } }
                public Regf M_Root { get { return m_root; } }
                public Regf.HiveBinCell M_Parent { get { return m_parent; } }
            }
            private bool f_cellSize;
            private int _cellSize;
            public int CellSize
            {
                get
                {
                    if (f_cellSize)
                        return _cellSize;
                    _cellSize = (int) (((CellSizeRaw < 0 ? -1 : 1) * CellSizeRaw));
                    f_cellSize = true;
                    return _cellSize;
                }
            }
            private bool f_isAllocated;
            private bool _isAllocated;
            public bool IsAllocated
            {
                get
                {
                    if (f_isAllocated)
                        return _isAllocated;
                    _isAllocated = (bool) (CellSizeRaw < 0);
                    f_isAllocated = true;
                    return _isAllocated;
                }
            }
            private int _cellSizeRaw;
            private string _identifier;
            private object _data;
            private Regf m_root;
            private Regf.HiveBin m_parent;
            private byte[] __raw_data;
            public int CellSizeRaw { get { return _cellSizeRaw; } }
            public string Identifier { get { return _identifier; } }
            public object Data { get { return _data; } }
            public Regf M_Root { get { return m_root; } }
            public Regf.HiveBin M_Parent { get { return m_parent; } }
            public byte[] M_RawData { get { return __raw_data; } }
        }
        public partial class FileHeader : KaitaiStruct
        {
            public static FileHeader FromFile(string fileName)
            {
                return new FileHeader(new KaitaiStream(fileName));
            }


            public enum FileType
            {
                Normal = 0,
                TransactionLog = 1,
            }

            public enum FileFormat
            {
                DirectMemoryLoad = 1,
            }
            public FileHeader(KaitaiStream p__io, Regf p__parent = null, Regf p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _signature = m_io.EnsureFixedContents(new byte[] { 114, 101, 103, 102 });
                _primarySequenceNumber = m_io.ReadU4le();
                _secondarySequenceNumber = m_io.ReadU4le();
                _lastModificationDateAndTime = new Filetime(m_io, this, m_root);
                _majorVersion = m_io.ReadU4le();
                _minorVersion = m_io.ReadU4le();
                _type = ((FileType) m_io.ReadU4le());
                _format = ((FileFormat) m_io.ReadU4le());
                _rootKeyOffset = m_io.ReadU4le();
                _hiveBinsDataSize = m_io.ReadU4le();
                _clusteringFactor = m_io.ReadU4le();
                _unknown1 = m_io.ReadBytes(64);
                _unknown2 = m_io.ReadBytes(396);
                _checksum = m_io.ReadU4le();
                _reserved = m_io.ReadBytes(3576);
                _bootType = m_io.ReadU4le();
                _bootRecover = m_io.ReadU4le();
            }
            private byte[] _signature;
            private uint _primarySequenceNumber;
            private uint _secondarySequenceNumber;
            private Filetime _lastModificationDateAndTime;
            private uint _majorVersion;
            private uint _minorVersion;
            private FileType _type;
            private FileFormat _format;
            private uint _rootKeyOffset;
            private uint _hiveBinsDataSize;
            private uint _clusteringFactor;
            private byte[] _unknown1;
            private byte[] _unknown2;
            private uint _checksum;
            private byte[] _reserved;
            private uint _bootType;
            private uint _bootRecover;
            private Regf m_root;
            private Regf m_parent;
            public byte[] Signature { get { return _signature; } }
            public uint PrimarySequenceNumber { get { return _primarySequenceNumber; } }
            public uint SecondarySequenceNumber { get { return _secondarySequenceNumber; } }
            public Filetime LastModificationDateAndTime { get { return _lastModificationDateAndTime; } }
            public uint MajorVersion { get { return _majorVersion; } }
            public uint MinorVersion { get { return _minorVersion; } }
            public FileType Type { get { return _type; } }
            public FileFormat Format { get { return _format; } }
            public uint RootKeyOffset { get { return _rootKeyOffset; } }
            public uint HiveBinsDataSize { get { return _hiveBinsDataSize; } }
            public uint ClusteringFactor { get { return _clusteringFactor; } }
            public byte[] Unknown1 { get { return _unknown1; } }
            public byte[] Unknown2 { get { return _unknown2; } }
            public uint Checksum { get { return _checksum; } }
            public byte[] Reserved { get { return _reserved; } }
            public uint BootType { get { return _bootType; } }
            public uint BootRecover { get { return _bootRecover; } }
            public Regf M_Root { get { return m_root; } }
            public Regf M_Parent { get { return m_parent; } }
        }
        private FileHeader _header;
        private List<HiveBin> _hiveBins;
        private Regf m_root;
        private KaitaiStruct m_parent;
        private List<byte[]> __raw_hiveBins;
        public FileHeader Header { get { return _header; } }
        public List<HiveBin> HiveBins { get { return _hiveBins; } }
        public Regf M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public List<byte[]> M_RawHiveBins { get { return __raw_hiveBins; } }
    }
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Apple macOS '.DS_Store' file format.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://en.wikipedia.org/wiki/.DS_Store
    /// https://metacpan.org/pod/distribution/Mac-Finder-DSStore/DSStoreFormat.pod
    /// https://0day.work/parsing-the-ds_store-file-format
    /// ">Source</a>
    /// </remarks>
    public partial class DsStore : KaitaiStruct
    {
        public static DsStore FromFile(string fileName)
        {
            return new DsStore(new KaitaiStream(fileName));
        }

        public DsStore(KaitaiStream p__io, KaitaiStruct p__parent = null, DsStore p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_buddyAllocatorBody = false;
            f_blockAddressMask = false;
            _read();
        }
        private void _read()
        {
            _alignmentHeader = m_io.ReadBytes(4);
            if (!((KaitaiStream.ByteArrayCompare(AlignmentHeader, new byte[] { 0, 0, 0, 1 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 0, 0, 0, 1 }, AlignmentHeader, M_Io, "/seq/0");
            }
            _buddyAllocatorHeader = new BuddyAllocatorHeader(m_io, this, m_root);
        }
        public partial class BuddyAllocatorHeader : KaitaiStruct
        {
            public static BuddyAllocatorHeader FromFile(string fileName)
            {
                return new BuddyAllocatorHeader(new KaitaiStream(fileName));
            }

            public BuddyAllocatorHeader(KaitaiStream p__io, DsStore p__parent = null, DsStore p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 66, 117, 100, 49 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 66, 117, 100, 49 }, Magic, M_Io, "/types/buddy_allocator_header/seq/0");
                }
                _ofsBookkeepingInfoBlock = m_io.ReadU4be();
                _lenBookkeepingInfoBlock = m_io.ReadU4be();
                _copyOfsBookkeepingInfoBlock = m_io.ReadU4be();
                __unnamed4 = m_io.ReadBytes(16);
            }
            private byte[] _magic;
            private uint _ofsBookkeepingInfoBlock;
            private uint _lenBookkeepingInfoBlock;
            private uint _copyOfsBookkeepingInfoBlock;
            private byte[] __unnamed4;
            private DsStore m_root;
            private DsStore m_parent;

            /// <summary>
            /// Magic number 'Bud1'.
            /// </summary>
            public byte[] Magic { get { return _magic; } }
            public uint OfsBookkeepingInfoBlock { get { return _ofsBookkeepingInfoBlock; } }
            public uint LenBookkeepingInfoBlock { get { return _lenBookkeepingInfoBlock; } }

            /// <summary>
            /// Needs to match 'offset_bookkeeping_info_block'.
            /// </summary>
            public uint CopyOfsBookkeepingInfoBlock { get { return _copyOfsBookkeepingInfoBlock; } }

            /// <summary>
            /// Unused field which might simply be the unused space at the end of the block,
            /// since the minimum allocation size is 32 bytes.
            /// </summary>
            public byte[] Unnamed_4 { get { return __unnamed4; } }
            public DsStore M_Root { get { return m_root; } }
            public DsStore M_Parent { get { return m_parent; } }
        }
        public partial class BuddyAllocatorBody : KaitaiStruct
        {
            public static BuddyAllocatorBody FromFile(string fileName)
            {
                return new BuddyAllocatorBody(new KaitaiStream(fileName));
            }

            public BuddyAllocatorBody(KaitaiStream p__io, DsStore p__parent = null, DsStore p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_numBlockAddresses = false;
                f_numFreeLists = false;
                f_directories = false;
                _read();
            }
            private void _read()
            {
                _numBlocks = m_io.ReadU4be();
                __unnamed1 = m_io.ReadBytes(4);
                _blockAddresses = new List<BlockDescriptor>();
                for (var i = 0; i < NumBlockAddresses; i++)
                {
                    _blockAddresses.Add(new BlockDescriptor(m_io, this, m_root));
                }
                _numDirectories = m_io.ReadU4be();
                _directoryEntries = new List<DirectoryEntry>();
                for (var i = 0; i < NumDirectories; i++)
                {
                    _directoryEntries.Add(new DirectoryEntry(m_io, this, m_root));
                }
                _freeLists = new List<FreeList>();
                for (var i = 0; i < NumFreeLists; i++)
                {
                    _freeLists.Add(new FreeList(m_io, this, m_root));
                }
            }
            public partial class BlockDescriptor : KaitaiStruct
            {
                public static BlockDescriptor FromFile(string fileName)
                {
                    return new BlockDescriptor(new KaitaiStream(fileName));
                }

                public BlockDescriptor(KaitaiStream p__io, DsStore.BuddyAllocatorBody p__parent = null, DsStore p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_offset = false;
                    f_size = false;
                    _read();
                }
                private void _read()
                {
                    _addressRaw = m_io.ReadU4be();
                }
                private bool f_offset;
                private int _offset;
                public int Offset
                {
                    get
                    {
                        if (f_offset)
                            return _offset;
                        _offset = (int) (((AddressRaw & ~(M_Root.BlockAddressMask)) + 4));
                        f_offset = true;
                        return _offset;
                    }
                }
                private bool f_size;
                private int _size;
                public int Size
                {
                    get
                    {
                        if (f_size)
                            return _size;
                        _size = (int) (((1 << AddressRaw) & M_Root.BlockAddressMask));
                        f_size = true;
                        return _size;
                    }
                }
                private uint _addressRaw;
                private DsStore m_root;
                private DsStore.BuddyAllocatorBody m_parent;
                public uint AddressRaw { get { return _addressRaw; } }
                public DsStore M_Root { get { return m_root; } }
                public DsStore.BuddyAllocatorBody M_Parent { get { return m_parent; } }
            }
            public partial class DirectoryEntry : KaitaiStruct
            {
                public static DirectoryEntry FromFile(string fileName)
                {
                    return new DirectoryEntry(new KaitaiStream(fileName));
                }

                public DirectoryEntry(KaitaiStream p__io, DsStore.BuddyAllocatorBody p__parent = null, DsStore p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _lenName = m_io.ReadU1();
                    _name = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(LenName));
                    _blockId = m_io.ReadU4be();
                }
                private byte _lenName;
                private string _name;
                private uint _blockId;
                private DsStore m_root;
                private DsStore.BuddyAllocatorBody m_parent;
                public byte LenName { get { return _lenName; } }
                public string Name { get { return _name; } }
                public uint BlockId { get { return _blockId; } }
                public DsStore M_Root { get { return m_root; } }
                public DsStore.BuddyAllocatorBody M_Parent { get { return m_parent; } }
            }
            public partial class FreeList : KaitaiStruct
            {
                public static FreeList FromFile(string fileName)
                {
                    return new FreeList(new KaitaiStream(fileName));
                }

                public FreeList(KaitaiStream p__io, DsStore.BuddyAllocatorBody p__parent = null, DsStore p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _counter = m_io.ReadU4be();
                    _offsets = new List<uint>();
                    for (var i = 0; i < Counter; i++)
                    {
                        _offsets.Add(m_io.ReadU4be());
                    }
                }
                private uint _counter;
                private List<uint> _offsets;
                private DsStore m_root;
                private DsStore.BuddyAllocatorBody m_parent;
                public uint Counter { get { return _counter; } }
                public List<uint> Offsets { get { return _offsets; } }
                public DsStore M_Root { get { return m_root; } }
                public DsStore.BuddyAllocatorBody M_Parent { get { return m_parent; } }
            }
            private bool f_numBlockAddresses;
            private int _numBlockAddresses;
            public int NumBlockAddresses
            {
                get
                {
                    if (f_numBlockAddresses)
                        return _numBlockAddresses;
                    _numBlockAddresses = (int) (256);
                    f_numBlockAddresses = true;
                    return _numBlockAddresses;
                }
            }
            private bool f_numFreeLists;
            private sbyte _numFreeLists;
            public sbyte NumFreeLists
            {
                get
                {
                    if (f_numFreeLists)
                        return _numFreeLists;
                    _numFreeLists = (sbyte) (32);
                    f_numFreeLists = true;
                    return _numFreeLists;
                }
            }
            private bool f_directories;
            private List<MasterBlockRef> _directories;

            /// <summary>
            /// Master blocks of the different B-trees.
            /// </summary>
            public List<MasterBlockRef> Directories
            {
                get
                {
                    if (f_directories)
                        return _directories;
                    KaitaiStream io = M_Root.M_Io;
                    _directories = new List<MasterBlockRef>();
                    for (var i = 0; i < NumDirectories; i++)
                    {
                        _directories.Add(new MasterBlockRef(i, io, this, m_root));
                    }
                    f_directories = true;
                    return _directories;
                }
            }
            private uint _numBlocks;
            private byte[] __unnamed1;
            private List<BlockDescriptor> _blockAddresses;
            private uint _numDirectories;
            private List<DirectoryEntry> _directoryEntries;
            private List<FreeList> _freeLists;
            private DsStore m_root;
            private DsStore m_parent;

            /// <summary>
            /// Number of blocks in the allocated-blocks list.
            /// </summary>
            public uint NumBlocks { get { return _numBlocks; } }

            /// <summary>
            /// Unknown field which appears to always be 0.
            /// </summary>
            public byte[] Unnamed_1 { get { return __unnamed1; } }

            /// <summary>
            /// Addresses of the different blocks.
            /// </summary>
            public List<BlockDescriptor> BlockAddresses { get { return _blockAddresses; } }

            /// <summary>
            /// Indicates the number of directory entries.
            /// </summary>
            public uint NumDirectories { get { return _numDirectories; } }

            /// <summary>
            /// Each directory is an independent B-tree.
            /// </summary>
            public List<DirectoryEntry> DirectoryEntries { get { return _directoryEntries; } }
            public List<FreeList> FreeLists { get { return _freeLists; } }
            public DsStore M_Root { get { return m_root; } }
            public DsStore M_Parent { get { return m_parent; } }
        }
        public partial class MasterBlockRef : KaitaiStruct
        {
            public MasterBlockRef(ulong p_idx, KaitaiStream p__io, DsStore.BuddyAllocatorBody p__parent = null, DsStore p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _idx = p_idx;
                f_masterBlock = false;
                _read();
            }
            private void _read()
            {
            }
            public partial class MasterBlock : KaitaiStruct
            {
                public static MasterBlock FromFile(string fileName)
                {
                    return new MasterBlock(new KaitaiStream(fileName));
                }

                public MasterBlock(KaitaiStream p__io, DsStore.MasterBlockRef p__parent = null, DsStore p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_rootBlock = false;
                    _read();
                }
                private void _read()
                {
                    _blockId = m_io.ReadU4be();
                    _numInternalNodes = m_io.ReadU4be();
                    _numRecords = m_io.ReadU4be();
                    _numNodes = m_io.ReadU4be();
                    __unnamed4 = m_io.ReadU4be();
                }
                private bool f_rootBlock;
                private Block _rootBlock;
                public Block RootBlock
                {
                    get
                    {
                        if (f_rootBlock)
                            return _rootBlock;
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(M_Root.BuddyAllocatorBody.BlockAddresses[BlockId].Offset);
                        _rootBlock = new Block(io, this, m_root);
                        io.Seek(_pos);
                        f_rootBlock = true;
                        return _rootBlock;
                    }
                }
                private uint _blockId;
                private uint _numInternalNodes;
                private uint _numRecords;
                private uint _numNodes;
                private uint __unnamed4;
                private DsStore m_root;
                private DsStore.MasterBlockRef m_parent;

                /// <summary>
                /// Block number of the B-tree's root node.
                /// </summary>
                public uint BlockId { get { return _blockId; } }

                /// <summary>
                /// Number of internal node levels.
                /// </summary>
                public uint NumInternalNodes { get { return _numInternalNodes; } }

                /// <summary>
                /// Number of records in the tree.
                /// </summary>
                public uint NumRecords { get { return _numRecords; } }

                /// <summary>
                /// Number of nodes in the tree.
                /// </summary>
                public uint NumNodes { get { return _numNodes; } }

                /// <summary>
                /// Always 0x1000, probably the B-tree node page size.
                /// </summary>
                public uint Unnamed_4 { get { return __unnamed4; } }
                public DsStore M_Root { get { return m_root; } }
                public DsStore.MasterBlockRef M_Parent { get { return m_parent; } }
            }
            private bool f_masterBlock;
            private MasterBlock _masterBlock;
            public MasterBlock MasterBlock
            {
                get
                {
                    if (f_masterBlock)
                        return _masterBlock;
                    long _pos = m_io.Pos;
                    m_io.Seek(M_Parent.BlockAddresses[M_Parent.DirectoryEntries[Idx].BlockId].Offset);
                    __raw_masterBlock = m_io.ReadBytes(M_Parent.BlockAddresses[M_Parent.DirectoryEntries[Idx].BlockId].Size);
                    var io___raw_masterBlock = new KaitaiStream(__raw_masterBlock);
                    _masterBlock = new MasterBlock(io___raw_masterBlock, this, m_root);
                    m_io.Seek(_pos);
                    f_masterBlock = true;
                    return _masterBlock;
                }
            }
            private ulong _idx;
            private DsStore m_root;
            private DsStore.BuddyAllocatorBody m_parent;
            private byte[] __raw_masterBlock;
            public ulong Idx { get { return _idx; } }
            public DsStore M_Root { get { return m_root; } }
            public DsStore.BuddyAllocatorBody M_Parent { get { return m_parent; } }
            public byte[] M_RawMasterBlock { get { return __raw_masterBlock; } }
        }
        public partial class Block : KaitaiStruct
        {
            public static Block FromFile(string fileName)
            {
                return new Block(new KaitaiStream(fileName));
            }

            public Block(KaitaiStream p__io, KaitaiStruct p__parent = null, DsStore p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_rightmostBlock = false;
                _read();
            }
            private void _read()
            {
                _mode = m_io.ReadU4be();
                _counter = m_io.ReadU4be();
                _data = new List<BlockData>();
                for (var i = 0; i < Counter; i++)
                {
                    _data.Add(new BlockData(Mode, m_io, this, m_root));
                }
            }
            public partial class BlockData : KaitaiStruct
            {
                public BlockData(uint p_mode, KaitaiStream p__io, DsStore.Block p__parent = null, DsStore p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _mode = p_mode;
                    f_block = false;
                    _read();
                }
                private void _read()
                {
                    if (Mode > 0) {
                        _blockId = m_io.ReadU4be();
                    }
                    _record = new Record(m_io, this, m_root);
                }
                public partial class Record : KaitaiStruct
                {
                    public static Record FromFile(string fileName)
                    {
                        return new Record(new KaitaiStream(fileName));
                    }

                    public Record(KaitaiStream p__io, DsStore.Block.BlockData p__parent = null, DsStore p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _filename = new Ustr(m_io, this, m_root);
                        _structureType = new FourCharCode(m_io, this, m_root);
                        _dataType = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(4));
                        switch (DataType) {
                        case "long": {
                            _value = m_io.ReadU4be();
                            break;
                        }
                        case "shor": {
                            _value = m_io.ReadU4be();
                            break;
                        }
                        case "comp": {
                            _value = m_io.ReadU8be();
                            break;
                        }
                        case "bool": {
                            _value = m_io.ReadU1();
                            break;
                        }
                        case "ustr": {
                            _value = new Ustr(m_io, this, m_root);
                            break;
                        }
                        case "dutc": {
                            _value = m_io.ReadU8be();
                            break;
                        }
                        case "type": {
                            _value = new FourCharCode(m_io, this, m_root);
                            break;
                        }
                        case "blob": {
                            _value = new RecordBlob(m_io, this, m_root);
                            break;
                        }
                        }
                    }
                    public partial class RecordBlob : KaitaiStruct
                    {
                        public static RecordBlob FromFile(string fileName)
                        {
                            return new RecordBlob(new KaitaiStream(fileName));
                        }

                        public RecordBlob(KaitaiStream p__io, DsStore.Block.BlockData.Record p__parent = null, DsStore p__root = null) : base(p__io)
                        {
                            m_parent = p__parent;
                            m_root = p__root;
                            _read();
                        }
                        private void _read()
                        {
                            _length = m_io.ReadU4be();
                            _value = m_io.ReadBytes(Length);
                        }
                        private uint _length;
                        private byte[] _value;
                        private DsStore m_root;
                        private DsStore.Block.BlockData.Record m_parent;
                        public uint Length { get { return _length; } }
                        public byte[] Value { get { return _value; } }
                        public DsStore M_Root { get { return m_root; } }
                        public DsStore.Block.BlockData.Record M_Parent { get { return m_parent; } }
                    }
                    public partial class Ustr : KaitaiStruct
                    {
                        public static Ustr FromFile(string fileName)
                        {
                            return new Ustr(new KaitaiStream(fileName));
                        }

                        public Ustr(KaitaiStream p__io, DsStore.Block.BlockData.Record p__parent = null, DsStore p__root = null) : base(p__io)
                        {
                            m_parent = p__parent;
                            m_root = p__root;
                            _read();
                        }
                        private void _read()
                        {
                            _length = m_io.ReadU4be();
                            _value = System.Text.Encoding.GetEncoding("UTF-16BE").GetString(m_io.ReadBytes((2 * Length)));
                        }
                        private uint _length;
                        private string _value;
                        private DsStore m_root;
                        private DsStore.Block.BlockData.Record m_parent;
                        public uint Length { get { return _length; } }
                        public string Value { get { return _value; } }
                        public DsStore M_Root { get { return m_root; } }
                        public DsStore.Block.BlockData.Record M_Parent { get { return m_parent; } }
                    }
                    public partial class FourCharCode : KaitaiStruct
                    {
                        public static FourCharCode FromFile(string fileName)
                        {
                            return new FourCharCode(new KaitaiStream(fileName));
                        }

                        public FourCharCode(KaitaiStream p__io, DsStore.Block.BlockData.Record p__parent = null, DsStore p__root = null) : base(p__io)
                        {
                            m_parent = p__parent;
                            m_root = p__root;
                            _read();
                        }
                        private void _read()
                        {
                            _value = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(4));
                        }
                        private string _value;
                        private DsStore m_root;
                        private DsStore.Block.BlockData.Record m_parent;
                        public string Value { get { return _value; } }
                        public DsStore M_Root { get { return m_root; } }
                        public DsStore.Block.BlockData.Record M_Parent { get { return m_parent; } }
                    }
                    private Ustr _filename;
                    private FourCharCode _structureType;
                    private string _dataType;
                    private object _value;
                    private DsStore m_root;
                    private DsStore.Block.BlockData m_parent;
                    public Ustr Filename { get { return _filename; } }

                    /// <summary>
                    /// Description of the entry's property.
                    /// </summary>
                    public FourCharCode StructureType { get { return _structureType; } }

                    /// <summary>
                    /// Data type of the value.
                    /// </summary>
                    public string DataType { get { return _dataType; } }
                    public object Value { get { return _value; } }
                    public DsStore M_Root { get { return m_root; } }
                    public DsStore.Block.BlockData M_Parent { get { return m_parent; } }
                }
                private bool f_block;
                private Block _block;
                public Block Block
                {
                    get
                    {
                        if (f_block)
                            return _block;
                        if (Mode > 0) {
                            KaitaiStream io = M_Root.M_Io;
                            long _pos = io.Pos;
                            io.Seek(M_Root.BuddyAllocatorBody.BlockAddresses[((uint) (BlockId))].Offset);
                            _block = new Block(io, this, m_root);
                            io.Seek(_pos);
                            f_block = true;
                        }
                        return _block;
                    }
                }
                private uint? _blockId;
                private Record _record;
                private uint _mode;
                private DsStore m_root;
                private DsStore.Block m_parent;
                public uint? BlockId { get { return _blockId; } }
                public Record Record { get { return _record; } }
                public uint Mode { get { return _mode; } }
                public DsStore M_Root { get { return m_root; } }
                public DsStore.Block M_Parent { get { return m_parent; } }
            }
            private bool f_rightmostBlock;
            private Block _rightmostBlock;

            /// <summary>
            /// Rightmost child block pointer.
            /// </summary>
            public Block RightmostBlock
            {
                get
                {
                    if (f_rightmostBlock)
                        return _rightmostBlock;
                    if (Mode > 0) {
                        KaitaiStream io = M_Root.M_Io;
                        long _pos = io.Pos;
                        io.Seek(M_Root.BuddyAllocatorBody.BlockAddresses[Mode].Offset);
                        _rightmostBlock = new Block(io, this, m_root);
                        io.Seek(_pos);
                        f_rightmostBlock = true;
                    }
                    return _rightmostBlock;
                }
            }
            private uint _mode;
            private uint _counter;
            private List<BlockData> _data;
            private DsStore m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// If mode is 0, this is a leaf node, otherwise it is an internal node.
            /// </summary>
            public uint Mode { get { return _mode; } }

            /// <summary>
            /// Number of records or number of block id + record pairs.
            /// </summary>
            public uint Counter { get { return _counter; } }
            public List<BlockData> Data { get { return _data; } }
            public DsStore M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        private bool f_buddyAllocatorBody;
        private BuddyAllocatorBody _buddyAllocatorBody;
        public BuddyAllocatorBody BuddyAllocatorBody
        {
            get
            {
                if (f_buddyAllocatorBody)
                    return _buddyAllocatorBody;
                long _pos = m_io.Pos;
                m_io.Seek((BuddyAllocatorHeader.OfsBookkeepingInfoBlock + 4));
                __raw_buddyAllocatorBody = m_io.ReadBytes(BuddyAllocatorHeader.LenBookkeepingInfoBlock);
                var io___raw_buddyAllocatorBody = new KaitaiStream(__raw_buddyAllocatorBody);
                _buddyAllocatorBody = new BuddyAllocatorBody(io___raw_buddyAllocatorBody, this, m_root);
                m_io.Seek(_pos);
                f_buddyAllocatorBody = true;
                return _buddyAllocatorBody;
            }
        }
        private bool f_blockAddressMask;
        private sbyte _blockAddressMask;

        /// <summary>
        /// Bitmask used to calculate the position and the size of each block
        /// of the B-tree from the block addresses.
        /// </summary>
        public sbyte BlockAddressMask
        {
            get
            {
                if (f_blockAddressMask)
                    return _blockAddressMask;
                _blockAddressMask = (sbyte) (31);
                f_blockAddressMask = true;
                return _blockAddressMask;
            }
        }
        private byte[] _alignmentHeader;
        private BuddyAllocatorHeader _buddyAllocatorHeader;
        private DsStore m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_buddyAllocatorBody;
        public byte[] AlignmentHeader { get { return _alignmentHeader; } }
        public BuddyAllocatorHeader BuddyAllocatorHeader { get { return _buddyAllocatorHeader; } }
        public DsStore M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawBuddyAllocatorBody { get { return __raw_buddyAllocatorBody; } }
    }
}

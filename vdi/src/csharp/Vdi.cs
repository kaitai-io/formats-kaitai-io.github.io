// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// A native VirtualBox file format
    /// 
    /// Images for testing can be downloaded from
    /// 
    ///  * &lt;https://www.osboxes.org/virtualbox-images/&gt;
    ///  * &lt;https://virtualboxes.org/images/&gt;
    /// 
    /// or you can convert images of other formats.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://github.com/qemu/qemu/blob/master/block/vdi.c">Source</a>
    /// </remarks>
    public partial class Vdi : KaitaiStruct
    {
        public static Vdi FromFile(string fileName)
        {
            return new Vdi(new KaitaiStream(fileName));
        }


        public enum ImageType
        {
            Dynamic = 1,
            Static = 2,
            Undo = 3,
            Diff = 4,
        }
        public Vdi(KaitaiStream p__io, KaitaiStruct p__parent = null, Vdi p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_blockDiscarded = false;
            f_blockUnallocated = false;
            f_blocksMap = false;
            f_disk = false;
            _read();
        }
        private void _read()
        {
            _header = new Header(m_io, this, m_root);
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, Vdi p__parent = null, Vdi p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_headerSize = false;
                f_blocksMapOffset = false;
                f_subheaderSizeIsDynamic = false;
                f_blocksOffset = false;
                f_blockSize = false;
                f_blocksMapSize = false;
                _read();
            }
            private void _read()
            {
                _text = System.Text.Encoding.GetEncoding("utf-8").GetString(m_io.ReadBytes(64));
                _signature = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(Signature, new byte[] { 127, 16, 218, 190 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 127, 16, 218, 190 }, Signature, M_Io, "/types/header/seq/1");
                }
                _version = new Version(m_io, this, m_root);
                if (SubheaderSizeIsDynamic) {
                    _headerSizeOptional = m_io.ReadU4le();
                }
                __raw_headerMain = m_io.ReadBytes(HeaderSize);
                var io___raw_headerMain = new KaitaiStream(__raw_headerMain);
                _headerMain = new HeaderMain(io___raw_headerMain, this, m_root);
            }
            public partial class Uuid : KaitaiStruct
            {
                public static Uuid FromFile(string fileName)
                {
                    return new Uuid(new KaitaiStream(fileName));
                }

                public Uuid(KaitaiStream p__io, Vdi.Header.HeaderMain p__parent = null, Vdi p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _uuid = m_io.ReadBytes(16);
                }
                private byte[] _uuid;
                private Vdi m_root;
                private Vdi.Header.HeaderMain m_parent;
                public byte[] Uuid { get { return _uuid; } }
                public Vdi M_Root { get { return m_root; } }
                public Vdi.Header.HeaderMain M_Parent { get { return m_parent; } }
            }
            public partial class Version : KaitaiStruct
            {
                public static Version FromFile(string fileName)
                {
                    return new Version(new KaitaiStream(fileName));
                }

                public Version(KaitaiStream p__io, Vdi.Header p__parent = null, Vdi p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _major = m_io.ReadU2le();
                    _minor = m_io.ReadU2le();
                }
                private ushort _major;
                private ushort _minor;
                private Vdi m_root;
                private Vdi.Header m_parent;
                public ushort Major { get { return _major; } }
                public ushort Minor { get { return _minor; } }
                public Vdi M_Root { get { return m_root; } }
                public Vdi.Header M_Parent { get { return m_parent; } }
            }
            public partial class HeaderMain : KaitaiStruct
            {
                public static HeaderMain FromFile(string fileName)
                {
                    return new HeaderMain(new KaitaiStream(fileName));
                }

                public HeaderMain(KaitaiStream p__io, Vdi.Header p__parent = null, Vdi p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _imageType = ((Vdi.ImageType) m_io.ReadU4le());
                    _imageFlags = new Flags(m_io, this, m_root);
                    _description = System.Text.Encoding.GetEncoding("utf-8").GetString(m_io.ReadBytes(256));
                    if (M_Parent.Version.Major >= 1) {
                        _blocksMapOffset = m_io.ReadU4le();
                    }
                    if (M_Parent.Version.Major >= 1) {
                        _offsetData = m_io.ReadU4le();
                    }
                    _geometry = new Geometry(m_io, this, m_root);
                    if (M_Parent.Version.Major >= 1) {
                        _reserved1 = m_io.ReadU4le();
                    }
                    _diskSize = m_io.ReadU8le();
                    _blockDataSize = m_io.ReadU4le();
                    if (M_Parent.Version.Major >= 1) {
                        _blockMetadataSize = m_io.ReadU4le();
                    }
                    _blocksInImage = m_io.ReadU4le();
                    _blocksAllocated = m_io.ReadU4le();
                    _uuidImage = new Uuid(m_io, this, m_root);
                    _uuidLastSnap = new Uuid(m_io, this, m_root);
                    _uuidLink = new Uuid(m_io, this, m_root);
                    if (M_Parent.Version.Major >= 1) {
                        _uuidParent = new Uuid(m_io, this, m_root);
                    }
                    if ( ((M_Parent.Version.Major >= 1) && ((M_Io.Pos + 16) <= M_Io.Size)) ) {
                        _lchcGeometry = new Geometry(m_io, this, m_root);
                    }
                }
                public partial class Geometry : KaitaiStruct
                {
                    public static Geometry FromFile(string fileName)
                    {
                        return new Geometry(new KaitaiStream(fileName));
                    }

                    public Geometry(KaitaiStream p__io, Vdi.Header.HeaderMain p__parent = null, Vdi p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _cylinders = m_io.ReadU4le();
                        _heads = m_io.ReadU4le();
                        _sectors = m_io.ReadU4le();
                        _sectorSize = m_io.ReadU4le();
                    }
                    private uint _cylinders;
                    private uint _heads;
                    private uint _sectors;
                    private uint _sectorSize;
                    private Vdi m_root;
                    private Vdi.Header.HeaderMain m_parent;
                    public uint Cylinders { get { return _cylinders; } }
                    public uint Heads { get { return _heads; } }
                    public uint Sectors { get { return _sectors; } }
                    public uint SectorSize { get { return _sectorSize; } }
                    public Vdi M_Root { get { return m_root; } }
                    public Vdi.Header.HeaderMain M_Parent { get { return m_parent; } }
                }
                public partial class Flags : KaitaiStruct
                {
                    public static Flags FromFile(string fileName)
                    {
                        return new Flags(new KaitaiStream(fileName));
                    }

                    public Flags(KaitaiStream p__io, Vdi.Header.HeaderMain p__parent = null, Vdi p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _reserved0 = m_io.ReadBitsIntBe(15);
                        _zeroExpand = m_io.ReadBitsIntBe(1) != 0;
                        _reserved1 = m_io.ReadBitsIntBe(6);
                        _diff = m_io.ReadBitsIntBe(1) != 0;
                        _fixed = m_io.ReadBitsIntBe(1) != 0;
                        _reserved2 = m_io.ReadBitsIntBe(8);
                    }
                    private ulong _reserved0;
                    private bool _zeroExpand;
                    private ulong _reserved1;
                    private bool _diff;
                    private bool _fixed;
                    private ulong _reserved2;
                    private Vdi m_root;
                    private Vdi.Header.HeaderMain m_parent;
                    public ulong Reserved0 { get { return _reserved0; } }
                    public bool ZeroExpand { get { return _zeroExpand; } }
                    public ulong Reserved1 { get { return _reserved1; } }
                    public bool Diff { get { return _diff; } }
                    public bool Fixed { get { return _fixed; } }
                    public ulong Reserved2 { get { return _reserved2; } }
                    public Vdi M_Root { get { return m_root; } }
                    public Vdi.Header.HeaderMain M_Parent { get { return m_parent; } }
                }
                private ImageType _imageType;
                private Flags _imageFlags;
                private string _description;
                private uint? _blocksMapOffset;
                private uint? _offsetData;
                private Geometry _geometry;
                private uint? _reserved1;
                private ulong _diskSize;
                private uint _blockDataSize;
                private uint? _blockMetadataSize;
                private uint _blocksInImage;
                private uint _blocksAllocated;
                private Uuid _uuidImage;
                private Uuid _uuidLastSnap;
                private Uuid _uuidLink;
                private Uuid _uuidParent;
                private Geometry _lchcGeometry;
                private Vdi m_root;
                private Vdi.Header m_parent;
                public ImageType ImageType { get { return _imageType; } }
                public Flags ImageFlags { get { return _imageFlags; } }
                public string Description { get { return _description; } }
                public uint? BlocksMapOffset { get { return _blocksMapOffset; } }
                public uint? OffsetData { get { return _offsetData; } }
                public Geometry Geometry { get { return _geometry; } }
                public uint? Reserved1 { get { return _reserved1; } }
                public ulong DiskSize { get { return _diskSize; } }

                /// <summary>
                /// Size of block (bytes).
                /// </summary>
                public uint BlockDataSize { get { return _blockDataSize; } }
                public uint? BlockMetadataSize { get { return _blockMetadataSize; } }
                public uint BlocksInImage { get { return _blocksInImage; } }
                public uint BlocksAllocated { get { return _blocksAllocated; } }
                public Uuid UuidImage { get { return _uuidImage; } }
                public Uuid UuidLastSnap { get { return _uuidLastSnap; } }
                public Uuid UuidLink { get { return _uuidLink; } }
                public Uuid UuidParent { get { return _uuidParent; } }
                public Geometry LchcGeometry { get { return _lchcGeometry; } }
                public Vdi M_Root { get { return m_root; } }
                public Vdi.Header M_Parent { get { return m_parent; } }
            }
            private bool f_headerSize;
            private int _headerSize;
            public int HeaderSize
            {
                get
                {
                    if (f_headerSize)
                        return _headerSize;
                    _headerSize = (int) ((SubheaderSizeIsDynamic ? HeaderSizeOptional : 336));
                    f_headerSize = true;
                    return _headerSize;
                }
            }
            private bool f_blocksMapOffset;
            private uint _blocksMapOffset;
            public uint BlocksMapOffset
            {
                get
                {
                    if (f_blocksMapOffset)
                        return _blocksMapOffset;
                    _blocksMapOffset = (uint) (HeaderMain.BlocksMapOffset);
                    f_blocksMapOffset = true;
                    return _blocksMapOffset;
                }
            }
            private bool f_subheaderSizeIsDynamic;
            private bool _subheaderSizeIsDynamic;
            public bool SubheaderSizeIsDynamic
            {
                get
                {
                    if (f_subheaderSizeIsDynamic)
                        return _subheaderSizeIsDynamic;
                    _subheaderSizeIsDynamic = (bool) (Version.Major >= 1);
                    f_subheaderSizeIsDynamic = true;
                    return _subheaderSizeIsDynamic;
                }
            }
            private bool f_blocksOffset;
            private uint _blocksOffset;
            public uint BlocksOffset
            {
                get
                {
                    if (f_blocksOffset)
                        return _blocksOffset;
                    _blocksOffset = (uint) (HeaderMain.OffsetData);
                    f_blocksOffset = true;
                    return _blocksOffset;
                }
            }
            private bool f_blockSize;
            private int _blockSize;
            public int BlockSize
            {
                get
                {
                    if (f_blockSize)
                        return _blockSize;
                    _blockSize = (int) ((HeaderMain.BlockMetadataSize + HeaderMain.BlockDataSize));
                    f_blockSize = true;
                    return _blockSize;
                }
            }
            private bool f_blocksMapSize;
            private int _blocksMapSize;
            public int BlocksMapSize
            {
                get
                {
                    if (f_blocksMapSize)
                        return _blocksMapSize;
                    _blocksMapSize = (int) ((((((HeaderMain.BlocksInImage * 4) + HeaderMain.Geometry.SectorSize) - 1) / HeaderMain.Geometry.SectorSize) * HeaderMain.Geometry.SectorSize));
                    f_blocksMapSize = true;
                    return _blocksMapSize;
                }
            }
            private string _text;
            private byte[] _signature;
            private Version _version;
            private uint? _headerSizeOptional;
            private HeaderMain _headerMain;
            private Vdi m_root;
            private Vdi m_parent;
            private byte[] __raw_headerMain;
            public string Text { get { return _text; } }
            public byte[] Signature { get { return _signature; } }
            public Version Version { get { return _version; } }
            public uint? HeaderSizeOptional { get { return _headerSizeOptional; } }
            public HeaderMain HeaderMain { get { return _headerMain; } }
            public Vdi M_Root { get { return m_root; } }
            public Vdi M_Parent { get { return m_parent; } }
            public byte[] M_RawHeaderMain { get { return __raw_headerMain; } }
        }
        public partial class BlocksMap : KaitaiStruct
        {
            public static BlocksMap FromFile(string fileName)
            {
                return new BlocksMap(new KaitaiStream(fileName));
            }

            public BlocksMap(KaitaiStream p__io, Vdi p__parent = null, Vdi p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _index = new List<BlockIndex>();
                for (var i = 0; i < M_Root.Header.HeaderMain.BlocksInImage; i++)
                {
                    _index.Add(new BlockIndex(m_io, this, m_root));
                }
            }
            public partial class BlockIndex : KaitaiStruct
            {
                public static BlockIndex FromFile(string fileName)
                {
                    return new BlockIndex(new KaitaiStream(fileName));
                }

                public BlockIndex(KaitaiStream p__io, Vdi.BlocksMap p__parent = null, Vdi p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_isAllocated = false;
                    f_block = false;
                    _read();
                }
                private void _read()
                {
                    _index = m_io.ReadU4le();
                }
                private bool f_isAllocated;
                private bool _isAllocated;
                public bool IsAllocated
                {
                    get
                    {
                        if (f_isAllocated)
                            return _isAllocated;
                        _isAllocated = (bool) (Index < M_Root.BlockDiscarded);
                        f_isAllocated = true;
                        return _isAllocated;
                    }
                }
                private bool f_block;
                private Block _block;
                public Block Block
                {
                    get
                    {
                        if (f_block)
                            return _block;
                        if (IsAllocated) {
                            _block = (Block) (M_Root.Disk.Blocks[Index]);
                        }
                        f_block = true;
                        return _block;
                    }
                }
                private uint _index;
                private Vdi m_root;
                private Vdi.BlocksMap m_parent;
                public uint Index { get { return _index; } }
                public Vdi M_Root { get { return m_root; } }
                public Vdi.BlocksMap M_Parent { get { return m_parent; } }
            }
            private List<BlockIndex> _index;
            private Vdi m_root;
            private Vdi m_parent;
            public List<BlockIndex> Index { get { return _index; } }
            public Vdi M_Root { get { return m_root; } }
            public Vdi M_Parent { get { return m_parent; } }
        }
        public partial class Disk : KaitaiStruct
        {
            public static Disk FromFile(string fileName)
            {
                return new Disk(new KaitaiStream(fileName));
            }

            public Disk(KaitaiStream p__io, Vdi p__parent = null, Vdi p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _blocks = new List<Block>();
                for (var i = 0; i < M_Root.Header.HeaderMain.BlocksInImage; i++)
                {
                    _blocks.Add(new Block(m_io, this, m_root));
                }
            }
            public partial class Block : KaitaiStruct
            {
                public static Block FromFile(string fileName)
                {
                    return new Block(new KaitaiStream(fileName));
                }

                public Block(KaitaiStream p__io, Vdi.Disk p__parent = null, Vdi p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _metadata = m_io.ReadBytes(M_Root.Header.HeaderMain.BlockMetadataSize);
                    __raw_data = new List<byte[]>();
                    _data = new List<Sector>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            __raw_data.Add(m_io.ReadBytes(M_Root.Header.HeaderMain.BlockDataSize));
                            var io___raw_data = new KaitaiStream(__raw_data[__raw_data.Count - 1]);
                            _data.Add(new Sector(io___raw_data, this, m_root));
                            i++;
                        }
                    }
                }
                public partial class Sector : KaitaiStruct
                {
                    public static Sector FromFile(string fileName)
                    {
                        return new Sector(new KaitaiStream(fileName));
                    }

                    public Sector(KaitaiStream p__io, Vdi.Disk.Block p__parent = null, Vdi p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _data = m_io.ReadBytes(M_Root.Header.HeaderMain.Geometry.SectorSize);
                    }
                    private byte[] _data;
                    private Vdi m_root;
                    private Vdi.Disk.Block m_parent;
                    public byte[] Data { get { return _data; } }
                    public Vdi M_Root { get { return m_root; } }
                    public Vdi.Disk.Block M_Parent { get { return m_parent; } }
                }
                private byte[] _metadata;
                private List<Sector> _data;
                private Vdi m_root;
                private Vdi.Disk m_parent;
                private List<byte[]> __raw_data;
                public byte[] Metadata { get { return _metadata; } }
                public List<Sector> Data { get { return _data; } }
                public Vdi M_Root { get { return m_root; } }
                public Vdi.Disk M_Parent { get { return m_parent; } }
                public List<byte[]> M_RawData { get { return __raw_data; } }
            }
            private List<Block> _blocks;
            private Vdi m_root;
            private Vdi m_parent;
            public List<Block> Blocks { get { return _blocks; } }
            public Vdi M_Root { get { return m_root; } }
            public Vdi M_Parent { get { return m_parent; } }
        }
        private bool f_blockDiscarded;
        private int _blockDiscarded;
        public int BlockDiscarded
        {
            get
            {
                if (f_blockDiscarded)
                    return _blockDiscarded;
                _blockDiscarded = (int) (4294967294);
                f_blockDiscarded = true;
                return _blockDiscarded;
            }
        }
        private bool f_blockUnallocated;
        private int _blockUnallocated;
        public int BlockUnallocated
        {
            get
            {
                if (f_blockUnallocated)
                    return _blockUnallocated;
                _blockUnallocated = (int) (4294967295);
                f_blockUnallocated = true;
                return _blockUnallocated;
            }
        }
        private bool f_blocksMap;
        private BlocksMap _blocksMap;

        /// <summary>
        /// block_index = offset_in_virtual_disk / block_size actual_data_offset = blocks_map[block_index]*block_size+metadata_size+offset_in_block
        /// The blocks_map will take up blocks_in_image_max * sizeof(uint32_t) bytes; since the blocks_map is read and written in a single operation, its size needs to be limited to INT_MAX; furthermore, when opening an image, the blocks_map size is rounded up to be aligned on BDRV_SECTOR_SIZE. Therefore this should satisfy the following: blocks_in_image_max * sizeof(uint32_t) + BDRV_SECTOR_SIZE == INT_MAX + 1 (INT_MAX + 1 is the first value not representable as an int) This guarantees that any value below or equal to the constant will, when multiplied by sizeof(uint32_t) and rounded up to a BDRV_SECTOR_SIZE boundary, still be below or equal to INT_MAX.
        /// </summary>
        public BlocksMap BlocksMap
        {
            get
            {
                if (f_blocksMap)
                    return _blocksMap;
                long _pos = m_io.Pos;
                m_io.Seek(Header.BlocksMapOffset);
                __raw_blocksMap = m_io.ReadBytes(Header.BlocksMapSize);
                var io___raw_blocksMap = new KaitaiStream(__raw_blocksMap);
                _blocksMap = new BlocksMap(io___raw_blocksMap, this, m_root);
                m_io.Seek(_pos);
                f_blocksMap = true;
                return _blocksMap;
            }
        }
        private bool f_disk;
        private Disk _disk;
        public Disk Disk
        {
            get
            {
                if (f_disk)
                    return _disk;
                long _pos = m_io.Pos;
                m_io.Seek(Header.BlocksOffset);
                _disk = new Disk(m_io, this, m_root);
                m_io.Seek(_pos);
                f_disk = true;
                return _disk;
            }
        }
        private Header _header;
        private Vdi m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_blocksMap;
        public Header Header { get { return _header; } }
        public Vdi M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawBlocksMap { get { return __raw_blocksMap; } }
    }
}

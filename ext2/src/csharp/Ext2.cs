// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class Ext2 : KaitaiStruct
    {
        public static Ext2 FromFile(string fileName)
        {
            return new Ext2(new KaitaiStream(fileName));
        }

        public Ext2(KaitaiStream p__io, KaitaiStruct p__parent = null, Ext2 p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_bg1 = false;
            f_rootDir = false;
            _read();
        }
        private void _read()
        {
        }
        public partial class SuperBlockStruct : KaitaiStruct
        {
            public static SuperBlockStruct FromFile(string fileName)
            {
                return new SuperBlockStruct(new KaitaiStream(fileName));
            }


            public enum StateEnum
            {
                ValidFs = 1,
                ErrorFs = 2,
            }

            public enum ErrorsEnum
            {
                ActContinue = 1,
                ActRo = 2,
                ActPanic = 3,
            }
            public SuperBlockStruct(KaitaiStream p__io, Ext2.BlockGroup p__parent = null, Ext2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_blockSize = false;
                f_blockGroupCount = false;
                _read();
            }
            private void _read()
            {
                _inodesCount = m_io.ReadU4le();
                _blocksCount = m_io.ReadU4le();
                _rBlocksCount = m_io.ReadU4le();
                _freeBlocksCount = m_io.ReadU4le();
                _freeInodesCount = m_io.ReadU4le();
                _firstDataBlock = m_io.ReadU4le();
                _logBlockSize = m_io.ReadU4le();
                _logFragSize = m_io.ReadU4le();
                _blocksPerGroup = m_io.ReadU4le();
                _fragsPerGroup = m_io.ReadU4le();
                _inodesPerGroup = m_io.ReadU4le();
                _mtime = m_io.ReadU4le();
                _wtime = m_io.ReadU4le();
                _mntCount = m_io.ReadU2le();
                _maxMntCount = m_io.ReadU2le();
                _magic = m_io.EnsureFixedContents(new byte[] { 83, 239 });
                _state = ((StateEnum) m_io.ReadU2le());
                _errors = ((ErrorsEnum) m_io.ReadU2le());
                _minorRevLevel = m_io.ReadU2le();
                _lastcheck = m_io.ReadU4le();
                _checkinterval = m_io.ReadU4le();
                _creatorOs = m_io.ReadU4le();
                _revLevel = m_io.ReadU4le();
                _defResuid = m_io.ReadU2le();
                _defResgid = m_io.ReadU2le();
                _firstIno = m_io.ReadU4le();
                _inodeSize = m_io.ReadU2le();
                _blockGroupNr = m_io.ReadU2le();
                _featureCompat = m_io.ReadU4le();
                _featureIncompat = m_io.ReadU4le();
                _featureRoCompat = m_io.ReadU4le();
                _uuid = m_io.ReadBytes(16);
                _volumeName = m_io.ReadBytes(16);
                _lastMounted = m_io.ReadBytes(64);
                _algoBitmap = m_io.ReadU4le();
                _preallocBlocks = m_io.ReadU1();
                _preallocDirBlocks = m_io.ReadU1();
                _padding1 = m_io.ReadBytes(2);
                _journalUuid = m_io.ReadBytes(16);
                _journalInum = m_io.ReadU4le();
                _journalDev = m_io.ReadU4le();
                _lastOrphan = m_io.ReadU4le();
                _hashSeed = new List<uint>((int) (4));
                for (var i = 0; i < 4; i++)
                {
                    _hashSeed.Add(m_io.ReadU4le());
                }
                _defHashVersion = m_io.ReadU1();
            }
            private bool f_blockSize;
            private int _blockSize;
            public int BlockSize
            {
                get
                {
                    if (f_blockSize)
                        return _blockSize;
                    _blockSize = (int) ((1024 << LogBlockSize));
                    f_blockSize = true;
                    return _blockSize;
                }
            }
            private bool f_blockGroupCount;
            private int _blockGroupCount;
            public int BlockGroupCount
            {
                get
                {
                    if (f_blockGroupCount)
                        return _blockGroupCount;
                    _blockGroupCount = (int) ((BlocksCount / BlocksPerGroup));
                    f_blockGroupCount = true;
                    return _blockGroupCount;
                }
            }
            private uint _inodesCount;
            private uint _blocksCount;
            private uint _rBlocksCount;
            private uint _freeBlocksCount;
            private uint _freeInodesCount;
            private uint _firstDataBlock;
            private uint _logBlockSize;
            private uint _logFragSize;
            private uint _blocksPerGroup;
            private uint _fragsPerGroup;
            private uint _inodesPerGroup;
            private uint _mtime;
            private uint _wtime;
            private ushort _mntCount;
            private ushort _maxMntCount;
            private byte[] _magic;
            private StateEnum _state;
            private ErrorsEnum _errors;
            private ushort _minorRevLevel;
            private uint _lastcheck;
            private uint _checkinterval;
            private uint _creatorOs;
            private uint _revLevel;
            private ushort _defResuid;
            private ushort _defResgid;
            private uint _firstIno;
            private ushort _inodeSize;
            private ushort _blockGroupNr;
            private uint _featureCompat;
            private uint _featureIncompat;
            private uint _featureRoCompat;
            private byte[] _uuid;
            private byte[] _volumeName;
            private byte[] _lastMounted;
            private uint _algoBitmap;
            private byte _preallocBlocks;
            private byte _preallocDirBlocks;
            private byte[] _padding1;
            private byte[] _journalUuid;
            private uint _journalInum;
            private uint _journalDev;
            private uint _lastOrphan;
            private List<uint> _hashSeed;
            private byte _defHashVersion;
            private Ext2 m_root;
            private Ext2.BlockGroup m_parent;
            public uint InodesCount { get { return _inodesCount; } }
            public uint BlocksCount { get { return _blocksCount; } }
            public uint RBlocksCount { get { return _rBlocksCount; } }
            public uint FreeBlocksCount { get { return _freeBlocksCount; } }
            public uint FreeInodesCount { get { return _freeInodesCount; } }
            public uint FirstDataBlock { get { return _firstDataBlock; } }
            public uint LogBlockSize { get { return _logBlockSize; } }
            public uint LogFragSize { get { return _logFragSize; } }
            public uint BlocksPerGroup { get { return _blocksPerGroup; } }
            public uint FragsPerGroup { get { return _fragsPerGroup; } }
            public uint InodesPerGroup { get { return _inodesPerGroup; } }
            public uint Mtime { get { return _mtime; } }
            public uint Wtime { get { return _wtime; } }
            public ushort MntCount { get { return _mntCount; } }
            public ushort MaxMntCount { get { return _maxMntCount; } }
            public byte[] Magic { get { return _magic; } }
            public StateEnum State { get { return _state; } }
            public ErrorsEnum Errors { get { return _errors; } }
            public ushort MinorRevLevel { get { return _minorRevLevel; } }
            public uint Lastcheck { get { return _lastcheck; } }
            public uint Checkinterval { get { return _checkinterval; } }
            public uint CreatorOs { get { return _creatorOs; } }
            public uint RevLevel { get { return _revLevel; } }
            public ushort DefResuid { get { return _defResuid; } }
            public ushort DefResgid { get { return _defResgid; } }
            public uint FirstIno { get { return _firstIno; } }
            public ushort InodeSize { get { return _inodeSize; } }
            public ushort BlockGroupNr { get { return _blockGroupNr; } }
            public uint FeatureCompat { get { return _featureCompat; } }
            public uint FeatureIncompat { get { return _featureIncompat; } }
            public uint FeatureRoCompat { get { return _featureRoCompat; } }
            public byte[] Uuid { get { return _uuid; } }
            public byte[] VolumeName { get { return _volumeName; } }
            public byte[] LastMounted { get { return _lastMounted; } }
            public uint AlgoBitmap { get { return _algoBitmap; } }
            public byte PreallocBlocks { get { return _preallocBlocks; } }
            public byte PreallocDirBlocks { get { return _preallocDirBlocks; } }
            public byte[] Padding1 { get { return _padding1; } }
            public byte[] JournalUuid { get { return _journalUuid; } }
            public uint JournalInum { get { return _journalInum; } }
            public uint JournalDev { get { return _journalDev; } }
            public uint LastOrphan { get { return _lastOrphan; } }
            public List<uint> HashSeed { get { return _hashSeed; } }
            public byte DefHashVersion { get { return _defHashVersion; } }
            public Ext2 M_Root { get { return m_root; } }
            public Ext2.BlockGroup M_Parent { get { return m_parent; } }
        }
        public partial class DirEntry : KaitaiStruct
        {
            public static DirEntry FromFile(string fileName)
            {
                return new DirEntry(new KaitaiStream(fileName));
            }


            public enum FileTypeEnum
            {
                Unknown = 0,
                RegFile = 1,
                Dir = 2,
                Chrdev = 3,
                Blkdev = 4,
                Fifo = 5,
                Sock = 6,
                Symlink = 7,
            }
            public DirEntry(KaitaiStream p__io, Ext2.Dir p__parent = null, Ext2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_inode = false;
                _read();
            }
            private void _read()
            {
                _inodePtr = m_io.ReadU4le();
                _recLen = m_io.ReadU2le();
                _nameLen = m_io.ReadU1();
                _fileType = ((FileTypeEnum) m_io.ReadU1());
                _name = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(NameLen));
                _padding = m_io.ReadBytes(((RecLen - NameLen) - 8));
            }
            private bool f_inode;
            private Inode _inode;
            public Inode Inode
            {
                get
                {
                    if (f_inode)
                        return _inode;
                    _inode = (Inode) (M_Root.Bg1.BlockGroups[((InodePtr - 1) / M_Root.Bg1.SuperBlock.InodesPerGroup)].Inodes[KaitaiStream.Mod((InodePtr - 1), M_Root.Bg1.SuperBlock.InodesPerGroup)]);
                    f_inode = true;
                    return _inode;
                }
            }
            private uint _inodePtr;
            private ushort _recLen;
            private byte _nameLen;
            private FileTypeEnum _fileType;
            private string _name;
            private byte[] _padding;
            private Ext2 m_root;
            private Ext2.Dir m_parent;
            public uint InodePtr { get { return _inodePtr; } }
            public ushort RecLen { get { return _recLen; } }
            public byte NameLen { get { return _nameLen; } }
            public FileTypeEnum FileType { get { return _fileType; } }
            public string Name { get { return _name; } }
            public byte[] Padding { get { return _padding; } }
            public Ext2 M_Root { get { return m_root; } }
            public Ext2.Dir M_Parent { get { return m_parent; } }
        }
        public partial class Inode : KaitaiStruct
        {
            public static Inode FromFile(string fileName)
            {
                return new Inode(new KaitaiStream(fileName));
            }

            public Inode(KaitaiStream p__io, Ext2.Bgd p__parent = null, Ext2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_asDir = false;
                _read();
            }
            private void _read()
            {
                _mode = m_io.ReadU2le();
                _uid = m_io.ReadU2le();
                _size = m_io.ReadU4le();
                _atime = m_io.ReadU4le();
                _ctime = m_io.ReadU4le();
                _mtime = m_io.ReadU4le();
                _dtime = m_io.ReadU4le();
                _gid = m_io.ReadU2le();
                _linksCount = m_io.ReadU2le();
                _blocks = m_io.ReadU4le();
                _flags = m_io.ReadU4le();
                _osd1 = m_io.ReadU4le();
                _block = new List<BlockPtr>((int) (15));
                for (var i = 0; i < 15; i++)
                {
                    _block.Add(new BlockPtr(m_io, this, m_root));
                }
                _generation = m_io.ReadU4le();
                _fileAcl = m_io.ReadU4le();
                _dirAcl = m_io.ReadU4le();
                _faddr = m_io.ReadU4le();
                _osd2 = m_io.ReadBytes(12);
            }
            private bool f_asDir;
            private Dir _asDir;
            public Dir AsDir
            {
                get
                {
                    if (f_asDir)
                        return _asDir;
                    KaitaiStream io = Block[0].Body.M_Io;
                    long _pos = io.Pos;
                    io.Seek(0);
                    _asDir = new Dir(io, this, m_root);
                    io.Seek(_pos);
                    f_asDir = true;
                    return _asDir;
                }
            }
            private ushort _mode;
            private ushort _uid;
            private uint _size;
            private uint _atime;
            private uint _ctime;
            private uint _mtime;
            private uint _dtime;
            private ushort _gid;
            private ushort _linksCount;
            private uint _blocks;
            private uint _flags;
            private uint _osd1;
            private List<BlockPtr> _block;
            private uint _generation;
            private uint _fileAcl;
            private uint _dirAcl;
            private uint _faddr;
            private byte[] _osd2;
            private Ext2 m_root;
            private Ext2.Bgd m_parent;
            public ushort Mode { get { return _mode; } }
            public ushort Uid { get { return _uid; } }
            public uint Size { get { return _size; } }
            public uint Atime { get { return _atime; } }
            public uint Ctime { get { return _ctime; } }
            public uint Mtime { get { return _mtime; } }
            public uint Dtime { get { return _dtime; } }
            public ushort Gid { get { return _gid; } }
            public ushort LinksCount { get { return _linksCount; } }
            public uint Blocks { get { return _blocks; } }
            public uint Flags { get { return _flags; } }
            public uint Osd1 { get { return _osd1; } }
            public List<BlockPtr> Block { get { return _block; } }
            public uint Generation { get { return _generation; } }
            public uint FileAcl { get { return _fileAcl; } }
            public uint DirAcl { get { return _dirAcl; } }
            public uint Faddr { get { return _faddr; } }
            public byte[] Osd2 { get { return _osd2; } }
            public Ext2 M_Root { get { return m_root; } }
            public Ext2.Bgd M_Parent { get { return m_parent; } }
        }
        public partial class BlockPtr : KaitaiStruct
        {
            public static BlockPtr FromFile(string fileName)
            {
                return new BlockPtr(new KaitaiStream(fileName));
            }

            public BlockPtr(KaitaiStream p__io, Ext2.Inode p__parent = null, Ext2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_body = false;
                _read();
            }
            private void _read()
            {
                _ptr = m_io.ReadU4le();
            }
            private bool f_body;
            private RawBlock _body;
            public RawBlock Body
            {
                get
                {
                    if (f_body)
                        return _body;
                    long _pos = m_io.Pos;
                    m_io.Seek((Ptr * M_Root.Bg1.SuperBlock.BlockSize));
                    __raw_body = m_io.ReadBytes(M_Root.Bg1.SuperBlock.BlockSize);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new RawBlock(io___raw_body, this, m_root);
                    m_io.Seek(_pos);
                    f_body = true;
                    return _body;
                }
            }
            private uint _ptr;
            private Ext2 m_root;
            private Ext2.Inode m_parent;
            private byte[] __raw_body;
            public uint Ptr { get { return _ptr; } }
            public Ext2 M_Root { get { return m_root; } }
            public Ext2.Inode M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }
        public partial class Dir : KaitaiStruct
        {
            public static Dir FromFile(string fileName)
            {
                return new Dir(new KaitaiStream(fileName));
            }

            public Dir(KaitaiStream p__io, Ext2.Inode p__parent = null, Ext2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<DirEntry>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _entries.Add(new DirEntry(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<DirEntry> _entries;
            private Ext2 m_root;
            private Ext2.Inode m_parent;
            public List<DirEntry> Entries { get { return _entries; } }
            public Ext2 M_Root { get { return m_root; } }
            public Ext2.Inode M_Parent { get { return m_parent; } }
        }
        public partial class BlockGroup : KaitaiStruct
        {
            public static BlockGroup FromFile(string fileName)
            {
                return new BlockGroup(new KaitaiStream(fileName));
            }

            public BlockGroup(KaitaiStream p__io, Ext2 p__parent = null, Ext2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                __raw_superBlock = m_io.ReadBytes(1024);
                var io___raw_superBlock = new KaitaiStream(__raw_superBlock);
                _superBlock = new SuperBlockStruct(io___raw_superBlock, this, m_root);
                _blockGroups = new List<Bgd>((int) (SuperBlock.BlockGroupCount));
                for (var i = 0; i < SuperBlock.BlockGroupCount; i++)
                {
                    _blockGroups.Add(new Bgd(m_io, this, m_root));
                }
            }
            private SuperBlockStruct _superBlock;
            private List<Bgd> _blockGroups;
            private Ext2 m_root;
            private Ext2 m_parent;
            private byte[] __raw_superBlock;
            public SuperBlockStruct SuperBlock { get { return _superBlock; } }
            public List<Bgd> BlockGroups { get { return _blockGroups; } }
            public Ext2 M_Root { get { return m_root; } }
            public Ext2 M_Parent { get { return m_parent; } }
            public byte[] M_RawSuperBlock { get { return __raw_superBlock; } }
        }
        public partial class Bgd : KaitaiStruct
        {
            public static Bgd FromFile(string fileName)
            {
                return new Bgd(new KaitaiStream(fileName));
            }

            public Bgd(KaitaiStream p__io, Ext2.BlockGroup p__parent = null, Ext2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_blockBitmap = false;
                f_inodeBitmap = false;
                f_inodes = false;
                _read();
            }
            private void _read()
            {
                _blockBitmapBlock = m_io.ReadU4le();
                _inodeBitmapBlock = m_io.ReadU4le();
                _inodeTableBlock = m_io.ReadU4le();
                _freeBlocksCount = m_io.ReadU2le();
                _freeInodesCount = m_io.ReadU2le();
                _usedDirsCount = m_io.ReadU2le();
                _padReserved = m_io.ReadBytes((2 + 12));
            }
            private bool f_blockBitmap;
            private byte[] _blockBitmap;
            public byte[] BlockBitmap
            {
                get
                {
                    if (f_blockBitmap)
                        return _blockBitmap;
                    long _pos = m_io.Pos;
                    m_io.Seek((BlockBitmapBlock * M_Root.Bg1.SuperBlock.BlockSize));
                    _blockBitmap = m_io.ReadBytes(1024);
                    m_io.Seek(_pos);
                    f_blockBitmap = true;
                    return _blockBitmap;
                }
            }
            private bool f_inodeBitmap;
            private byte[] _inodeBitmap;
            public byte[] InodeBitmap
            {
                get
                {
                    if (f_inodeBitmap)
                        return _inodeBitmap;
                    long _pos = m_io.Pos;
                    m_io.Seek((InodeBitmapBlock * M_Root.Bg1.SuperBlock.BlockSize));
                    _inodeBitmap = m_io.ReadBytes(1024);
                    m_io.Seek(_pos);
                    f_inodeBitmap = true;
                    return _inodeBitmap;
                }
            }
            private bool f_inodes;
            private List<Inode> _inodes;
            public List<Inode> Inodes
            {
                get
                {
                    if (f_inodes)
                        return _inodes;
                    long _pos = m_io.Pos;
                    m_io.Seek((InodeTableBlock * M_Root.Bg1.SuperBlock.BlockSize));
                    _inodes = new List<Inode>((int) (M_Root.Bg1.SuperBlock.InodesPerGroup));
                    for (var i = 0; i < M_Root.Bg1.SuperBlock.InodesPerGroup; i++)
                    {
                        _inodes.Add(new Inode(m_io, this, m_root));
                    }
                    m_io.Seek(_pos);
                    f_inodes = true;
                    return _inodes;
                }
            }
            private uint _blockBitmapBlock;
            private uint _inodeBitmapBlock;
            private uint _inodeTableBlock;
            private ushort _freeBlocksCount;
            private ushort _freeInodesCount;
            private ushort _usedDirsCount;
            private byte[] _padReserved;
            private Ext2 m_root;
            private Ext2.BlockGroup m_parent;
            public uint BlockBitmapBlock { get { return _blockBitmapBlock; } }
            public uint InodeBitmapBlock { get { return _inodeBitmapBlock; } }
            public uint InodeTableBlock { get { return _inodeTableBlock; } }
            public ushort FreeBlocksCount { get { return _freeBlocksCount; } }
            public ushort FreeInodesCount { get { return _freeInodesCount; } }
            public ushort UsedDirsCount { get { return _usedDirsCount; } }
            public byte[] PadReserved { get { return _padReserved; } }
            public Ext2 M_Root { get { return m_root; } }
            public Ext2.BlockGroup M_Parent { get { return m_parent; } }
        }
        public partial class RawBlock : KaitaiStruct
        {
            public static RawBlock FromFile(string fileName)
            {
                return new RawBlock(new KaitaiStream(fileName));
            }

            public RawBlock(KaitaiStream p__io, Ext2.BlockPtr p__parent = null, Ext2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _body = m_io.ReadBytes(M_Root.Bg1.SuperBlock.BlockSize);
            }
            private byte[] _body;
            private Ext2 m_root;
            private Ext2.BlockPtr m_parent;
            public byte[] Body { get { return _body; } }
            public Ext2 M_Root { get { return m_root; } }
            public Ext2.BlockPtr M_Parent { get { return m_parent; } }
        }
        private bool f_bg1;
        private BlockGroup _bg1;
        public BlockGroup Bg1
        {
            get
            {
                if (f_bg1)
                    return _bg1;
                long _pos = m_io.Pos;
                m_io.Seek(1024);
                _bg1 = new BlockGroup(m_io, this, m_root);
                m_io.Seek(_pos);
                f_bg1 = true;
                return _bg1;
            }
        }
        private bool f_rootDir;
        private Dir _rootDir;
        public Dir RootDir
        {
            get
            {
                if (f_rootDir)
                    return _rootDir;
                _rootDir = (Dir) (Bg1.BlockGroups[0].Inodes[1].AsDir);
                f_rootDir = true;
                return _rootDir;
            }
        }
        private Ext2 m_root;
        private KaitaiStruct m_parent;
        public Ext2 M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

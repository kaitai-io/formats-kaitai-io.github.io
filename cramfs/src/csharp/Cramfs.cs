// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class Cramfs : KaitaiStruct
    {
        public static Cramfs FromFile(string fileName)
        {
            return new Cramfs(new KaitaiStream(fileName));
        }

        public Cramfs(KaitaiStream p__io, KaitaiStruct p__parent = null, Cramfs p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_pageSize = false;
            _read();
        }
        private void _read()
        {
            _superBlock = new SuperBlockStruct(m_io, this, m_root);
        }
        public partial class ChunkedDataInode : KaitaiStruct
        {
            public static ChunkedDataInode FromFile(string fileName)
            {
                return new ChunkedDataInode(new KaitaiStream(fileName));
            }

            public ChunkedDataInode(KaitaiStream p__io, Cramfs.Inode p__parent = null, Cramfs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _blockEndIndex = new List<uint>();
                for (var i = 0; i < ((M_Parent.Size + M_Root.PageSize) - 1) / M_Root.PageSize; i++)
                {
                    _blockEndIndex.Add(m_io.ReadU4le());
                }
                _rawBlocks = m_io.ReadBytesFull();
            }
            private List<uint> _blockEndIndex;
            private byte[] _rawBlocks;
            private Cramfs m_root;
            private Cramfs.Inode m_parent;
            public List<uint> BlockEndIndex { get { return _blockEndIndex; } }
            public byte[] RawBlocks { get { return _rawBlocks; } }
            public Cramfs M_Root { get { return m_root; } }
            public Cramfs.Inode M_Parent { get { return m_parent; } }
        }
        public partial class DirInode : KaitaiStruct
        {
            public static DirInode FromFile(string fileName)
            {
                return new DirInode(new KaitaiStream(fileName));
            }

            public DirInode(KaitaiStream p__io, Cramfs.Inode p__parent = null, Cramfs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                if (M_Io.Size > 0) {
                    _children = new List<Inode>();
                    {
                        var i = 0;
                        while (!m_io.IsEof) {
                            _children.Add(new Inode(m_io, this, m_root));
                            i++;
                        }
                    }
                }
            }
            private List<Inode> _children;
            private Cramfs m_root;
            private Cramfs.Inode m_parent;
            public List<Inode> Children { get { return _children; } }
            public Cramfs M_Root { get { return m_root; } }
            public Cramfs.Inode M_Parent { get { return m_parent; } }
        }
        public partial class Info : KaitaiStruct
        {
            public static Info FromFile(string fileName)
            {
                return new Info(new KaitaiStream(fileName));
            }

            public Info(KaitaiStream p__io, Cramfs.SuperBlockStruct p__parent = null, Cramfs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _crc = m_io.ReadU4le();
                _edition = m_io.ReadU4le();
                _blocks = m_io.ReadU4le();
                _files = m_io.ReadU4le();
            }
            private uint _crc;
            private uint _edition;
            private uint _blocks;
            private uint _files;
            private Cramfs m_root;
            private Cramfs.SuperBlockStruct m_parent;
            public uint Crc { get { return _crc; } }
            public uint Edition { get { return _edition; } }
            public uint Blocks { get { return _blocks; } }
            public uint Files { get { return _files; } }
            public Cramfs M_Root { get { return m_root; } }
            public Cramfs.SuperBlockStruct M_Parent { get { return m_parent; } }
        }
        public partial class Inode : KaitaiStruct
        {
            public static Inode FromFile(string fileName)
            {
                return new Inode(new KaitaiStream(fileName));
            }


            public enum FileType
            {
                Fifo = 1,
                Chrdev = 2,
                Dir = 4,
                Blkdev = 6,
                RegFile = 8,
                Symlink = 10,
                Socket = 12,
            }
            public Inode(KaitaiStream p__io, KaitaiStruct p__parent = null, Cramfs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_asDir = false;
                f_asRegFile = false;
                f_asSymlink = false;
                f_attr = false;
                f_gid = false;
                f_namelen = false;
                f_offset = false;
                f_permG = false;
                f_permO = false;
                f_permU = false;
                f_size = false;
                f_type = false;
                _read();
            }
            private void _read()
            {
                _mode = m_io.ReadU2le();
                _uid = m_io.ReadU2le();
                _sizeGid = m_io.ReadU4le();
                _namelenOffset = m_io.ReadU4le();
                _name = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(Namelen));
            }
            private bool f_asDir;
            private DirInode _asDir;
            public DirInode AsDir
            {
                get
                {
                    if (f_asDir)
                        return _asDir;
                    f_asDir = true;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek(Offset);
                    __raw_asDir = io.ReadBytes(Size);
                    var io___raw_asDir = new KaitaiStream(__raw_asDir);
                    _asDir = new DirInode(io___raw_asDir, this, m_root);
                    io.Seek(_pos);
                    return _asDir;
                }
            }
            private bool f_asRegFile;
            private ChunkedDataInode _asRegFile;
            public ChunkedDataInode AsRegFile
            {
                get
                {
                    if (f_asRegFile)
                        return _asRegFile;
                    f_asRegFile = true;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek(Offset);
                    _asRegFile = new ChunkedDataInode(io, this, m_root);
                    io.Seek(_pos);
                    return _asRegFile;
                }
            }
            private bool f_asSymlink;
            private ChunkedDataInode _asSymlink;
            public ChunkedDataInode AsSymlink
            {
                get
                {
                    if (f_asSymlink)
                        return _asSymlink;
                    f_asSymlink = true;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek(Offset);
                    _asSymlink = new ChunkedDataInode(io, this, m_root);
                    io.Seek(_pos);
                    return _asSymlink;
                }
            }
            private bool f_attr;
            private int _attr;
            public int Attr
            {
                get
                {
                    if (f_attr)
                        return _attr;
                    f_attr = true;
                    _attr = (int) (Mode >> 9 & 7);
                    return _attr;
                }
            }
            private bool f_gid;
            private int _gid;
            public int Gid
            {
                get
                {
                    if (f_gid)
                        return _gid;
                    f_gid = true;
                    _gid = (int) (SizeGid >> 24);
                    return _gid;
                }
            }
            private bool f_namelen;
            private int _namelen;
            public int Namelen
            {
                get
                {
                    if (f_namelen)
                        return _namelen;
                    f_namelen = true;
                    _namelen = (int) ((NamelenOffset & 63) << 2);
                    return _namelen;
                }
            }
            private bool f_offset;
            private int _offset;
            public int Offset
            {
                get
                {
                    if (f_offset)
                        return _offset;
                    f_offset = true;
                    _offset = (int) ((NamelenOffset >> 6 & 67108863) << 2);
                    return _offset;
                }
            }
            private bool f_permG;
            private int _permG;
            public int PermG
            {
                get
                {
                    if (f_permG)
                        return _permG;
                    f_permG = true;
                    _permG = (int) (Mode >> 3 & 7);
                    return _permG;
                }
            }
            private bool f_permO;
            private int _permO;
            public int PermO
            {
                get
                {
                    if (f_permO)
                        return _permO;
                    f_permO = true;
                    _permO = (int) (Mode & 7);
                    return _permO;
                }
            }
            private bool f_permU;
            private int _permU;
            public int PermU
            {
                get
                {
                    if (f_permU)
                        return _permU;
                    f_permU = true;
                    _permU = (int) (Mode >> 6 & 7);
                    return _permU;
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
                    f_size = true;
                    _size = (int) (SizeGid & 16777215);
                    return _size;
                }
            }
            private bool f_type;
            private FileType _type;
            public FileType Type
            {
                get
                {
                    if (f_type)
                        return _type;
                    f_type = true;
                    _type = (FileType) (((FileType) Mode >> 12 & 15));
                    return _type;
                }
            }
            private ushort _mode;
            private ushort _uid;
            private uint _sizeGid;
            private uint _namelenOffset;
            private string _name;
            private Cramfs m_root;
            private KaitaiStruct m_parent;
            private byte[] __raw_asDir;
            public ushort Mode { get { return _mode; } }
            public ushort Uid { get { return _uid; } }
            public uint SizeGid { get { return _sizeGid; } }
            public uint NamelenOffset { get { return _namelenOffset; } }
            public string Name { get { return _name; } }
            public Cramfs M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
            public byte[] M_RawAsDir { get { return __raw_asDir; } }
        }
        public partial class SuperBlockStruct : KaitaiStruct
        {
            public static SuperBlockStruct FromFile(string fileName)
            {
                return new SuperBlockStruct(new KaitaiStream(fileName));
            }

            public SuperBlockStruct(KaitaiStream p__io, Cramfs p__parent = null, Cramfs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_flagFsidV2 = false;
                f_flagHoles = false;
                f_flagShiftedRootOffset = false;
                f_flagSortedDirs = false;
                f_flagWrongSignature = false;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(_magic, new byte[] { 69, 61, 205, 40 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 69, 61, 205, 40 }, _magic, m_io, "/types/super_block_struct/seq/0");
                }
                _size = m_io.ReadU4le();
                _flags = m_io.ReadU4le();
                _future = m_io.ReadU4le();
                _signature = m_io.ReadBytes(16);
                if (!((KaitaiStream.ByteArrayCompare(_signature, new byte[] { 67, 111, 109, 112, 114, 101, 115, 115, 101, 100, 32, 82, 79, 77, 70, 83 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 67, 111, 109, 112, 114, 101, 115, 115, 101, 100, 32, 82, 79, 77, 70, 83 }, _signature, m_io, "/types/super_block_struct/seq/4");
                }
                _fsid = new Info(m_io, this, m_root);
                _name = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytes(16));
                _root = new Inode(m_io, this, m_root);
            }
            private bool f_flagFsidV2;
            private int _flagFsidV2;
            public int FlagFsidV2
            {
                get
                {
                    if (f_flagFsidV2)
                        return _flagFsidV2;
                    f_flagFsidV2 = true;
                    _flagFsidV2 = (int) (Flags >> 0 & 1);
                    return _flagFsidV2;
                }
            }
            private bool f_flagHoles;
            private int _flagHoles;
            public int FlagHoles
            {
                get
                {
                    if (f_flagHoles)
                        return _flagHoles;
                    f_flagHoles = true;
                    _flagHoles = (int) (Flags >> 8 & 1);
                    return _flagHoles;
                }
            }
            private bool f_flagShiftedRootOffset;
            private int _flagShiftedRootOffset;
            public int FlagShiftedRootOffset
            {
                get
                {
                    if (f_flagShiftedRootOffset)
                        return _flagShiftedRootOffset;
                    f_flagShiftedRootOffset = true;
                    _flagShiftedRootOffset = (int) (Flags >> 10 & 1);
                    return _flagShiftedRootOffset;
                }
            }
            private bool f_flagSortedDirs;
            private int _flagSortedDirs;
            public int FlagSortedDirs
            {
                get
                {
                    if (f_flagSortedDirs)
                        return _flagSortedDirs;
                    f_flagSortedDirs = true;
                    _flagSortedDirs = (int) (Flags >> 1 & 1);
                    return _flagSortedDirs;
                }
            }
            private bool f_flagWrongSignature;
            private int _flagWrongSignature;
            public int FlagWrongSignature
            {
                get
                {
                    if (f_flagWrongSignature)
                        return _flagWrongSignature;
                    f_flagWrongSignature = true;
                    _flagWrongSignature = (int) (Flags >> 9 & 1);
                    return _flagWrongSignature;
                }
            }
            private byte[] _magic;
            private uint _size;
            private uint _flags;
            private uint _future;
            private byte[] _signature;
            private Info _fsid;
            private string _name;
            private Inode _root;
            private Cramfs m_root;
            private Cramfs m_parent;
            public byte[] Magic { get { return _magic; } }
            public uint Size { get { return _size; } }
            public uint Flags { get { return _flags; } }
            public uint Future { get { return _future; } }
            public byte[] Signature { get { return _signature; } }
            public Info Fsid { get { return _fsid; } }
            public string Name { get { return _name; } }
            public Inode Root { get { return _root; } }
            public Cramfs M_Root { get { return m_root; } }
            public Cramfs M_Parent { get { return m_parent; } }
        }
        private bool f_pageSize;
        private int _pageSize;
        public int PageSize
        {
            get
            {
                if (f_pageSize)
                    return _pageSize;
                f_pageSize = true;
                _pageSize = (int) (4096);
                return _pageSize;
            }
        }
        private SuperBlockStruct _superBlock;
        private Cramfs m_root;
        private KaitaiStruct m_parent;
        public SuperBlockStruct SuperBlock { get { return _superBlock; } }
        public Cramfs M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

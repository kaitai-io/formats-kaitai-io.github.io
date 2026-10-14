// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System;
using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// UBIFS is a file system for raw flash memory devices. It works on top of
    /// UBI (Unsorted Block Images), which works as an abstraction layer so UBIFS
    /// does not need to care about low level details. This specification only covers
    /// UBIFS, not UBI.
    /// 
    /// A UBIFS image is divided into several Logical Erase Blocks (LEB). The first
    /// LEB (LEB0) contains the superblock node, which includes information about LEB
    /// size, amongst others. The next two LEBs (LEB1 and LEB2) comprise the so called
    /// &quot;master area&quot; and both contain a copy of the master node, which includes
    /// information about where to find the root index node, which is then used to
    /// access all the files on the file system.
    /// 
    /// **Limitations of this Kaitai Struct implementation:**
    /// 
    /// 1. It only supports UBIFS images created by `mkfs.ubifs` (such as those in
    ///    firmware images built by OpenWrt), not file systems modified after
    ///    creation, e.g. by writing files to them on a running Linux system. The
    ///    Linux kernel appends a new copy of the master node to LEB1 and LEB2
    ///    whenever it mounts the file system read-write, unmounts it, or commits
    ///    changes (updates the index on flash to include them). When mounting, Linux
    ///    uses the
    ///    [last copy](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L84-L165),
    ///    whereas this implementation reads the first one (`master_1`), which still
    ///    describes the file system as it was created. Changes made since then are
    ///    therefore not visible via `index_root`.
    /// 2. Changes that have not been committed yet are not in the index at all, so
    ///    they are not visible via `index_root` either. Until they are committed,
    ///    UBIFS keeps them only in the journal. This only matters for file systems
    ///    that were not unmounted cleanly, because unmounting
    ///    [commits](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/super.c#L486-L493)
    ///    all changes.
    /// 3. Parsing doesn't advance the stream position. This implementation reads
    ///    the image only through instances, so that parsing doesn't copy the
    ///    whole image into memory. To find where the image ends, e.g. when
    ///    carving it out of a larger file, use `len_image`. For the same reason,
    ///    parsing doesn't fail if the image is truncated. To detect that, check
    ///    that the stream is at least `len_image` bytes long
    ///    (`_io.size &gt;= len_image`).
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h">Git tag "v7.2"</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h">Git tag "v7.2"</a>
    /// </remarks>
    /// <remarks>
    /// Reference: <a href="http://www.linux-mtd.infradead.org/doc/ubifs.pdf">Source</a>
    /// </remarks>
    public partial class Ubifs : KaitaiStruct
    {
        public static Ubifs FromFile(string fileName)
        {
            return new Ubifs(new KaitaiStream(fileName));
        }


        public enum Compression
        {
            NoCompression = 0,
            Lzo = 1,
            Zlib = 2,
            Zstd = 3,
        }

        public enum HashAlgos
        {
            Md4 = 0,
            Md5 = 1,
            Sha1 = 2,
            RipeMd160 = 3,
            Sha256 = 4,
            Sha384 = 5,
            Sha512 = 6,
            Sha224 = 7,
            RipeMd128 = 8,
            RipeMd256 = 9,
            RipeMd320 = 10,
            Wp256 = 11,
            Wp384 = 12,
            Wp512 = 13,
            Tgr128 = 14,
            Tgr160 = 15,
            Tgr192 = 16,
            Sm3256 = 17,
            Streebog256 = 18,
            Streebog512 = 19,
            Sha3256 = 20,
            Sha3384 = 21,
            Sha3512 = 22,
        }

        public enum Hashes
        {
            R5 = 0,
            TestHash = 1,
        }

        public enum InodeTypes
        {
            Regular = 0,
            Directory = 1,
            Link = 2,
            BlockDevice = 3,
            CharacterDevice = 4,
            Fifo = 5,
            Socket = 6,
        }

        public enum KeyFormats
        {
            Simple = 0,
        }

        public enum KeyTypes
        {
            Inode = 0,
            Data = 1,
            Directory = 2,
            ExtendedAttribute = 3,
        }

        public enum NodeGroupTypes
        {
            NoNodeGroup = 0,
            InNodeGroup = 1,
            LastOfNodeGroup = 2,
        }

        public enum NodeTypes
        {
            Inode = 0,
            Data = 1,
            Directory = 2,
            ExtendedAttribute = 3,
            Truncation = 4,
            Padding = 5,
            Superblock = 6,
            Master = 7,
            Reference = 8,
            Index = 9,
            CommitStart = 10,
            Orphan = 11,
            Authentication = 12,
            Signature = 13,
        }
        public Ubifs(KaitaiStream p__io, KaitaiStruct p__parent = null, Ubifs p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_index = false;
            f_indexRoot = false;
            f_lebs = false;
            f_lenImage = false;
            f_master1 = false;
            f_master2 = false;
            f_superblock = false;
            _read();
        }
        private void _read()
        {
        }

        /// <remarks>
        /// Reference: <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L774-L782">Git tag "v7.2"</a>
        /// </remarks>
        public partial class AuthenticationHeader : KaitaiStruct
        {
            public static AuthenticationHeader FromFile(string fileName)
            {
                return new AuthenticationHeader(new KaitaiStream(fileName));
            }

            public AuthenticationHeader(KaitaiStream p__io, Ubifs.Block p__parent = null, Ubifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _hmac = m_io.ReadBytes(M_Root.Superblock.NodeHeader.LenHash);
            }
            private byte[] _hmac;
            private Ubifs m_root;
            private Ubifs.Block m_parent;

            /// <summary>
            /// HMAC authenticating the journal before this node, keyed with the
            /// file system's authentication key (which is not stored on flash).
            /// The kernel [uses](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L275-L276)
            /// HMAC with the hash algorithm in `&lt;superblock_header&gt;.hash_algo`
            /// ([checked when mounting](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L575-L580)),
            /// so `hmac` is as long as its digest, e.g. 32 bytes for SHA-256.
            /// </summary>
            public byte[] Hmac { get { return _hmac; } }
            public Ubifs M_Root { get { return m_root; } }
            public Ubifs.Block M_Parent { get { return m_parent; } }
        }
        public partial class Block : KaitaiStruct
        {
            public static Block FromFile(string fileName)
            {
                return new Block(new KaitaiStream(fileName));
            }

            public Block(KaitaiStream p__io, Ubifs.Branch p__parent = null, Ubifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _header = new CommonHeader(m_io, this, m_root);
                switch (Header.NodeType) {
                case Ubifs.NodeTypes.Authentication: {
                    __raw_nodeHeader = m_io.ReadBytes(Header.LenFullNode - 24);
                    var io___raw_nodeHeader = new KaitaiStream(__raw_nodeHeader);
                    _nodeHeader = new AuthenticationHeader(io___raw_nodeHeader, this, m_root);
                    break;
                }
                case Ubifs.NodeTypes.CommitStart: {
                    __raw_nodeHeader = m_io.ReadBytes(Header.LenFullNode - 24);
                    var io___raw_nodeHeader = new KaitaiStream(__raw_nodeHeader);
                    _nodeHeader = new CommitStartHeader(io___raw_nodeHeader, this, m_root);
                    break;
                }
                case Ubifs.NodeTypes.Data: {
                    __raw_nodeHeader = m_io.ReadBytes(Header.LenFullNode - 24);
                    var io___raw_nodeHeader = new KaitaiStream(__raw_nodeHeader);
                    _nodeHeader = new DataHeader(io___raw_nodeHeader, this, m_root);
                    break;
                }
                case Ubifs.NodeTypes.Directory: {
                    __raw_nodeHeader = m_io.ReadBytes(Header.LenFullNode - 24);
                    var io___raw_nodeHeader = new KaitaiStream(__raw_nodeHeader);
                    _nodeHeader = new DirectoryHeader(io___raw_nodeHeader, this, m_root);
                    break;
                }
                case Ubifs.NodeTypes.ExtendedAttribute: {
                    __raw_nodeHeader = m_io.ReadBytes(Header.LenFullNode - 24);
                    var io___raw_nodeHeader = new KaitaiStream(__raw_nodeHeader);
                    _nodeHeader = new DirectoryHeader(io___raw_nodeHeader, this, m_root);
                    break;
                }
                case Ubifs.NodeTypes.Index: {
                    __raw_nodeHeader = m_io.ReadBytes(Header.LenFullNode - 24);
                    var io___raw_nodeHeader = new KaitaiStream(__raw_nodeHeader);
                    _nodeHeader = new IndexHeader(io___raw_nodeHeader, this, m_root);
                    break;
                }
                case Ubifs.NodeTypes.Inode: {
                    __raw_nodeHeader = m_io.ReadBytes(Header.LenFullNode - 24);
                    var io___raw_nodeHeader = new KaitaiStream(__raw_nodeHeader);
                    _nodeHeader = new InodeHeader(io___raw_nodeHeader, this, m_root);
                    break;
                }
                case Ubifs.NodeTypes.Master: {
                    __raw_nodeHeader = m_io.ReadBytes(Header.LenFullNode - 24);
                    var io___raw_nodeHeader = new KaitaiStream(__raw_nodeHeader);
                    _nodeHeader = new MasterHeader(io___raw_nodeHeader, this, m_root);
                    break;
                }
                case Ubifs.NodeTypes.Orphan: {
                    __raw_nodeHeader = m_io.ReadBytes(Header.LenFullNode - 24);
                    var io___raw_nodeHeader = new KaitaiStream(__raw_nodeHeader);
                    _nodeHeader = new OrphanHeader(io___raw_nodeHeader, this, m_root);
                    break;
                }
                case Ubifs.NodeTypes.Padding: {
                    __raw_nodeHeader = m_io.ReadBytes(Header.LenFullNode - 24);
                    var io___raw_nodeHeader = new KaitaiStream(__raw_nodeHeader);
                    _nodeHeader = new PaddingHeader(io___raw_nodeHeader, this, m_root);
                    break;
                }
                case Ubifs.NodeTypes.Reference: {
                    __raw_nodeHeader = m_io.ReadBytes(Header.LenFullNode - 24);
                    var io___raw_nodeHeader = new KaitaiStream(__raw_nodeHeader);
                    _nodeHeader = new ReferenceHeader(io___raw_nodeHeader, this, m_root);
                    break;
                }
                case Ubifs.NodeTypes.Signature: {
                    __raw_nodeHeader = m_io.ReadBytes(Header.LenFullNode - 24);
                    var io___raw_nodeHeader = new KaitaiStream(__raw_nodeHeader);
                    _nodeHeader = new SignatureHeader(io___raw_nodeHeader, this, m_root);
                    break;
                }
                case Ubifs.NodeTypes.Superblock: {
                    __raw_nodeHeader = m_io.ReadBytes(Header.LenFullNode - 24);
                    var io___raw_nodeHeader = new KaitaiStream(__raw_nodeHeader);
                    _nodeHeader = new SuperblockHeader(io___raw_nodeHeader, this, m_root);
                    break;
                }
                case Ubifs.NodeTypes.Truncation: {
                    __raw_nodeHeader = m_io.ReadBytes(Header.LenFullNode - 24);
                    var io___raw_nodeHeader = new KaitaiStream(__raw_nodeHeader);
                    _nodeHeader = new TruncationHeader(io___raw_nodeHeader, this, m_root);
                    break;
                }
                default: {
                    _nodeHeader = m_io.ReadBytes(Header.LenFullNode - 24);
                    break;
                }
                }
            }
            private CommonHeader _header;
            private object _nodeHeader;
            private Ubifs m_root;
            private Ubifs.Branch m_parent;
            private byte[] __raw_nodeHeader;
            public CommonHeader Header { get { return _header; } }
            public object NodeHeader { get { return _nodeHeader; } }
            public Ubifs M_Root { get { return m_root; } }
            public Ubifs.Branch M_Parent { get { return m_parent; } }
            public byte[] M_RawNodeHeader { get { return __raw_nodeHeader; } }
        }

        /// <remarks>
        /// Reference: <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L801-L817">Git tag "v7.2"</a>
        /// </remarks>
        public partial class Branch : KaitaiStruct
        {
            public static Branch FromFile(string fileName)
            {
                return new Branch(new KaitaiStream(fileName));
            }

            public Branch(KaitaiStream p__io, Ubifs.IndexHeader p__parent = null, Ubifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_target = false;
                _read();
            }
            private void _read()
            {
                _targetLeb = m_io.ReadU4le();
                _ofsTarget = m_io.ReadU4le();
                _lenTarget = m_io.ReadU4le();
                __raw_key = m_io.ReadBytes(8);
                var io___raw_key = new KaitaiStream(__raw_key);
                _key = new Key(io___raw_key, this, m_root);
                _hash = m_io.ReadBytes(M_Root.Superblock.NodeHeader.LenHash);
            }
            private bool f_target;
            private Block _target;
            public Block Target
            {
                get
                {
                    if (f_target)
                        return _target;
                    f_target = true;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek(M_Root.Superblock.NodeHeader.LebSize * TargetLeb + OfsTarget);
                    __raw_target = io.ReadBytes(LenTarget);
                    var io___raw_target = new KaitaiStream(__raw_target);
                    _target = new Block(io___raw_target, this, m_root);
                    {
                        Block M_ = _target;
                        if (!( ((M_.Header.LenFullNode == LenTarget) && ((M_Parent.Level != 0 ? M_.Header.NodeType == Ubifs.NodeTypes.Index : ((int) M_.Header.NodeType) == ((int) Key.Type)))) ))
                        {
                            throw new ValidationExprError(_target, m_io, "/types/branch/instances/target");
                        }
                    }
                    io.Seek(_pos);
                    return _target;
                }
            }
            private uint _targetLeb;
            private uint _ofsTarget;
            private uint _lenTarget;
            private Key _key;
            private byte[] _hash;
            private Ubifs m_root;
            private Ubifs.IndexHeader m_parent;
            private byte[] __raw_key;
            private byte[] __raw_target;

            /// <summary>
            /// LEB number of the target node
            /// </summary>
            public uint TargetLeb { get { return _targetLeb; } }

            /// <summary>
            /// offset within the LEB `target_leb`
            /// </summary>
            public uint OfsTarget { get { return _ofsTarget; } }

            /// <summary>
            /// target node length
            /// </summary>
            public uint LenTarget { get { return _lenTarget; } }
            public Key Key { get { return _key; } }

            /// <summary>
            /// Hash of the target node. It is empty in a file system without
            /// authentication (see `&lt;superblock_header&gt;.len_hash`).
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs.h#L1642-L1654">Git tag "v7.2"</a>
            /// </remarks>
            public byte[] Hash { get { return _hash; } }
            public Ubifs M_Root { get { return m_root; } }
            public Ubifs.IndexHeader M_Parent { get { return m_parent; } }
            public byte[] M_RawKey { get { return __raw_key; } }
            public byte[] M_RawTarget { get { return __raw_target; } }
        }

        /// <remarks>
        /// Reference: <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L833-L841">Git tag "v7.2"</a>
        /// </remarks>
        public partial class CommitStartHeader : KaitaiStruct
        {
            public static CommitStartHeader FromFile(string fileName)
            {
                return new CommitStartHeader(new KaitaiStream(fileName));
            }

            public CommitStartHeader(KaitaiStream p__io, Ubifs.Block p__parent = null, Ubifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _commitNumber = m_io.ReadU8le();
            }
            private ulong _commitNumber;
            private Ubifs m_root;
            private Ubifs.Block m_parent;

            /// <summary>
            /// commit number
            /// </summary>
            public ulong CommitNumber { get { return _commitNumber; } }
            public Ubifs M_Root { get { return m_root; } }
            public Ubifs.Block M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L443-L464">Git tag "v7.2"</a>
        /// </remarks>
        public partial class CommonHeader : KaitaiStruct
        {
            public static CommonHeader FromFile(string fileName)
            {
                return new CommonHeader(new KaitaiStream(fileName));
            }

            public CommonHeader(KaitaiStream p__io, KaitaiStruct p__parent = null, Ubifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadU4le();
                if (!(_magic == 101718065))
                {
                    throw new ValidationNotEqualError(101718065, _magic, m_io, "/types/common_header/seq/0");
                }
                _crc = m_io.ReadU4le();
                _sequenceNumber = m_io.ReadU8le();
                _lenFullNode = m_io.ReadU4le();
                _nodeType = ((Ubifs.NodeTypes) m_io.ReadU1());
                _groupType = ((Ubifs.NodeGroupTypes) m_io.ReadU1());
                _padding = m_io.ReadBytes(2);
                if (!((KaitaiStream.ByteArrayCompare(_padding, new byte[] { 0, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0, 0 }, _padding, m_io, "/types/common_header/seq/6");
                }
            }
            private uint _magic;
            private uint _crc;
            private ulong _sequenceNumber;
            private uint _lenFullNode;
            private NodeTypes _nodeType;
            private NodeGroupTypes _groupType;
            private byte[] _padding;
            private Ubifs m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// UBIFS node magic number (`UBIFS_NODE_MAGIC`)
            /// </summary>
            public uint Magic { get { return _magic; } }

            /// <summary>
            /// CRC-32 checksum of the whole node except `magic` and `crc` (i.e.
            /// starting at offset 8). It is computed with an initial register value
            /// of 0xFFFFFFFF and no final XOR, so it is the bitwise NOT of a standard
            /// CRC-32 (e.g.
            /// [`zlib.crc32()`](https://docs.python.org/3/library/zlib.html#zlib.crc32)
            /// in Python).
            /// </summary>
            public uint Crc { get { return _crc; } }

            /// <summary>
            /// sequence number
            /// </summary>
            public ulong SequenceNumber { get { return _sequenceNumber; } }

            /// <summary>
            /// full node length
            /// </summary>
            public uint LenFullNode { get { return _lenFullNode; } }

            /// <summary>
            /// node type
            /// </summary>
            public NodeTypes NodeType { get { return _nodeType; } }

            /// <summary>
            /// node group type
            /// </summary>
            public NodeGroupTypes GroupType { get { return _groupType; } }

            /// <summary>
            /// reserved for future, zeroes
            /// </summary>
            public byte[] Padding { get { return _padding; } }
            public Ubifs M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L567-L584">Git tag "v7.2"</a>
        /// </remarks>
        public partial class DataHeader : KaitaiStruct
        {
            public static DataHeader FromFile(string fileName)
            {
                return new DataHeader(new KaitaiStream(fileName));
            }

            public DataHeader(KaitaiStream p__io, Ubifs.Block p__parent = null, Ubifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                __raw_key = m_io.ReadBytes(16);
                var io___raw_key = new KaitaiStream(__raw_key);
                _key = new Key(io___raw_key, this, m_root);
                _lenUncompressed = m_io.ReadU4le();
                if (!(_lenUncompressed >= 1))
                {
                    throw new ValidationLessThanError(1, _lenUncompressed, m_io, "/types/data_header/seq/1");
                }
                if (!(_lenUncompressed <= 4096))
                {
                    throw new ValidationGreaterThanError(4096, _lenUncompressed, m_io, "/types/data_header/seq/1");
                }
                _compression = ((Ubifs.Compression) m_io.ReadU2le());
                if (!Enum.IsDefined(typeof(Compression), _compression))
                {
                    throw new ValidationNotInEnumError(_compression, m_io, "/types/data_header/seq/2");
                }
                _lenCompressedData = m_io.ReadU2le();
                _data = m_io.ReadBytesFull();
            }
            private Key _key;
            private uint _lenUncompressed;
            private Compression _compression;
            private ushort _lenCompressedData;
            private byte[] _data;
            private Ubifs m_root;
            private Ubifs.Block m_parent;
            private byte[] __raw_key;

            /// <summary>
            /// node key
            /// </summary>
            public Key Key { get { return _key; } }

            /// <summary>
            /// uncompressed data size in bytes
            /// </summary>
            public uint LenUncompressed { get { return _lenUncompressed; } }

            /// <summary>
            /// compression type (`compression::no_compression`, `compression::lzo`,
            /// etc.)
            /// </summary>
            public Compression Compression { get { return _compression; } }

            /// <summary>
            /// compressed data size in bytes, only valid when data is encrypted
            /// </summary>
            public ushort LenCompressedData { get { return _lenCompressedData; } }

            /// <summary>
            /// One block (up to 4096 bytes) of the file, block number `key.value`,
            /// compressed as given by `compression`. Blocks missing from the index
            /// are holes (zeros). In an encrypted inode, the compressed data is
            /// padded
            /// and [encrypted](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/crypto.c#L38-L59),
            /// and `len_compressed_data` is the length of the compressed data
            /// before padding.
            /// </summary>
            public byte[] Data { get { return _data; } }
            public Ubifs M_Root { get { return m_root; } }
            public Ubifs.Block M_Parent { get { return m_parent; } }
            public byte[] M_RawKey { get { return __raw_key; } }
        }

        /// <remarks>
        /// Reference: <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L541-L565">Git tag "v7.2"</a>
        /// </remarks>
        public partial class DirectoryHeader : KaitaiStruct
        {
            public static DirectoryHeader FromFile(string fileName)
            {
                return new DirectoryHeader(new KaitaiStream(fileName));
            }

            public DirectoryHeader(KaitaiStream p__io, Ubifs.Block p__parent = null, Ubifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                __raw_key = m_io.ReadBytes(16);
                var io___raw_key = new KaitaiStream(__raw_key);
                _key = new Key(io___raw_key, this, m_root);
                {
                    Key M_ = _key;
                    if (!( ((M_.Type == Ubifs.KeyTypes.Directory) || (M_.Type == Ubifs.KeyTypes.ExtendedAttribute)) ))
                    {
                        throw new ValidationExprError(_key, m_io, "/types/directory_header/seq/0");
                    }
                }
                _inodeNumber = m_io.ReadU8le();
                if (!(_inodeNumber <= 4294967295))
                {
                    throw new ValidationGreaterThanError(4294967295, _inodeNumber, m_io, "/types/directory_header/seq/1");
                }
                _padding1 = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_padding1, new byte[] { 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0 }, _padding1, m_io, "/types/directory_header/seq/2");
                }
                _inodeType = ((Ubifs.InodeTypes) m_io.ReadU1());
                if (!Enum.IsDefined(typeof(InodeTypes), _inodeType))
                {
                    throw new ValidationNotInEnumError(_inodeType, m_io, "/types/directory_header/seq/3");
                }
                _lenName = m_io.ReadU2le();
                _cookie = m_io.ReadU4le();
                _name = m_io.ReadBytes(LenName);
                _nameTerminator = m_io.ReadBytes(1);
                if (!((KaitaiStream.ByteArrayCompare(_nameTerminator, new byte[] { 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0 }, _nameTerminator, m_io, "/types/directory_header/seq/7");
                }
            }
            private Key _key;
            private ulong _inodeNumber;
            private byte[] _padding1;
            private InodeTypes _inodeType;
            private ushort _lenName;
            private uint _cookie;
            private byte[] _name;
            private byte[] _nameTerminator;
            private Ubifs m_root;
            private Ubifs.Block m_parent;
            private byte[] __raw_key;

            /// <summary>
            /// node key
            /// </summary>
            public Key Key { get { return _key; } }

            /// <summary>
            /// target inode number
            /// </summary>
            public ulong InodeNumber { get { return _inodeNumber; } }

            /// <summary>
            /// reserved for future, zeroes
            /// </summary>
            public byte[] Padding1 { get { return _padding1; } }

            /// <summary>
            /// type of the target inode (`inode_types::regular`,
            /// `inode_types::directory`, etc.)
            /// </summary>
            public InodeTypes InodeType { get { return _inodeType; } }

            /// <summary>
            /// name length
            /// </summary>
            public ushort LenName { get { return _lenName; } }

            /// <summary>
            /// A 32bits random number, used to construct a 64bits identifier.
            /// </summary>
            public uint Cookie { get { return _cookie; } }

            /// <summary>
            /// Name of the entry.
            /// 
            /// It is kept as bytes rather than decoded as a string: names in a
            /// directory whose inode has `&lt;inode_header&gt;.encrypted` set are
            /// ciphertext, which may contain any bytes, including zeros.
            /// 
            /// Unencrypted names, including all names of extended attributes, contain
            /// no zero bytes, because Linux can't create such names. They aren't
            /// necessarily valid UTF-8, though, as UBIFS doesn't enforce any encoding
            /// of file names. A zero byte in such a name means that the image was
            /// crafted, since an accidental corruption would most likely fail the
            /// node's
            /// [CRC check](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/io.c#L287-L293).
            /// </summary>
            public byte[] Name { get { return _name; } }

            /// <summary>
            /// Zero byte after `name`, [not counted in
            /// `len_name`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/replay.c#L487-L489).
            /// </summary>
            public byte[] NameTerminator { get { return _nameTerminator; } }
            public Ubifs M_Root { get { return m_root; } }
            public Ubifs.Block M_Parent { get { return m_parent; } }
            public byte[] M_RawKey { get { return __raw_key; } }
        }
        public partial class Dummy : KaitaiStruct
        {
            public static Dummy FromFile(string fileName)
            {
                return new Dummy(new KaitaiStream(fileName));
            }

            public Dummy(KaitaiStream p__io, Ubifs p__parent = null, Ubifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
            }
            private Ubifs m_root;
            private Ubifs m_parent;
            public Ubifs M_Root { get { return m_root; } }
            public Ubifs M_Parent { get { return m_parent; } }
        }
        public partial class IndexBlock : KaitaiStruct
        {
            public static IndexBlock FromFile(string fileName)
            {
                return new IndexBlock(new KaitaiStream(fileName));
            }

            public IndexBlock(KaitaiStream p__io, Ubifs p__parent = null, Ubifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _header = new CommonHeader(m_io, this, m_root);
                {
                    CommonHeader M_ = _header;
                    if (!(M_.NodeType == Ubifs.NodeTypes.Index))
                    {
                        throw new ValidationExprError(_header, m_io, "/types/index_block/seq/0");
                    }
                }
                __raw_nodeHeader = m_io.ReadBytes(Header.LenFullNode - 24);
                var io___raw_nodeHeader = new KaitaiStream(__raw_nodeHeader);
                _nodeHeader = new IndexHeader(io___raw_nodeHeader, this, m_root);
            }
            private CommonHeader _header;
            private IndexHeader _nodeHeader;
            private Ubifs m_root;
            private Ubifs m_parent;
            private byte[] __raw_nodeHeader;
            public CommonHeader Header { get { return _header; } }
            public IndexHeader NodeHeader { get { return _nodeHeader; } }
            public Ubifs M_Root { get { return m_root; } }
            public Ubifs M_Parent { get { return m_parent; } }
            public byte[] M_RawNodeHeader { get { return __raw_nodeHeader; } }
        }

        /// <remarks>
        /// Reference: <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L819-L831">Git tag "v7.2"</a>
        /// </remarks>
        public partial class IndexHeader : KaitaiStruct
        {
            public static IndexHeader FromFile(string fileName)
            {
                return new IndexHeader(new KaitaiStream(fileName));
            }

            public IndexHeader(KaitaiStream p__io, KaitaiStruct p__parent = null, Ubifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _numBranches = m_io.ReadU2le();
                _level = m_io.ReadU2le();
                _branches = new List<Branch>();
                for (var i = 0; i < NumBranches; i++)
                {
                    _branches.Add(new Branch(m_io, this, m_root));
                }
            }
            private ushort _numBranches;
            private ushort _level;
            private List<Branch> _branches;
            private Ubifs m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// number of child index nodes
            /// </summary>
            public ushort NumBranches { get { return _numBranches; } }

            /// <summary>
            /// tree level
            /// </summary>
            public ushort Level { get { return _level; } }

            /// <summary>
            /// LEB number / offset / length / key branches
            /// 
            /// All branches have the same size, which is 20 bytes (with the simple
            /// key format) plus the hash length in an authenticated file system.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/misc.h#L186-L205">Git tag "v7.2"</a>
            /// </remarks>
            public List<Branch> Branches { get { return _branches; } }
            public Ubifs M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L480-L539">Git tag "v7.2"</a>
        /// </remarks>
        public partial class InodeHeader : KaitaiStruct
        {
            public static InodeHeader FromFile(string fileName)
            {
                return new InodeHeader(new KaitaiStream(fileName));
            }

            public InodeHeader(KaitaiStream p__io, Ubifs.Block p__parent = null, Ubifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_append = false;
                f_compressed = false;
                f_dirsync = false;
                f_encrypted = false;
                f_immutable = false;
                f_isBlockDevice = false;
                f_isCharacterDevice = false;
                f_isDir = false;
                f_isFifo = false;
                f_isLink = false;
                f_isRegular = false;
                f_isSocket = false;
                f_synchronous = false;
                f_xattr = false;
                _read();
            }
            private void _read()
            {
                __raw_key = m_io.ReadBytes(16);
                var io___raw_key = new KaitaiStream(__raw_key);
                _key = new Key(io___raw_key, this, m_root);
                _creationSequenceNumber = m_io.ReadU8le();
                _lenUncompressed = m_io.ReadU8le();
                _atimeSec = m_io.ReadU8le();
                _ctimeSec = m_io.ReadU8le();
                _mtimeSec = m_io.ReadU8le();
                _atimeNsec = m_io.ReadU4le();
                _ctimeNsec = m_io.ReadU4le();
                _mtimeNsec = m_io.ReadU4le();
                _numLinks = m_io.ReadU4le();
                _uid = m_io.ReadU4le();
                _gid = m_io.ReadU4le();
                _mode = m_io.ReadU4le();
                _flags = m_io.ReadU4le();
                _lenData = m_io.ReadU4le();
                _numXattrs = m_io.ReadU4le();
                _xattrSize = m_io.ReadU4le();
                _padding1 = m_io.ReadBytes(4);
                if (!((KaitaiStream.ByteArrayCompare(_padding1, new byte[] { 0, 0, 0, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, _padding1, m_io, "/types/inode_header/seq/17");
                }
                _xattrNames = m_io.ReadU4le();
                _compression = ((Ubifs.Compression) m_io.ReadU2le());
                if (!Enum.IsDefined(typeof(Compression), _compression))
                {
                    throw new ValidationNotInEnumError(_compression, m_io, "/types/inode_header/seq/19");
                }
                _padding2 = m_io.ReadBytes(26);
                _data = m_io.ReadBytes(LenData);
            }
            private bool f_append;
            private bool _append;

            /// <summary>
            /// writes to the inode may only append data
            /// </summary>
            public bool Append
            {
                get
                {
                    if (f_append)
                        return _append;
                    f_append = true;
                    _append = (bool) ((Flags & 8) != 0);
                    return _append;
                }
            }
            private bool f_compressed;
            private bool _compressed;

            /// <summary>
            /// use compression for this inode
            /// </summary>
            public bool Compressed
            {
                get
                {
                    if (f_compressed)
                        return _compressed;
                    f_compressed = true;
                    _compressed = (bool) ((Flags & 1) != 0);
                    return _compressed;
                }
            }
            private bool f_dirsync;
            private bool _dirsync;

            /// <summary>
            /// I/O on this directory inode has to be synchronous
            /// </summary>
            public bool Dirsync
            {
                get
                {
                    if (f_dirsync)
                        return _dirsync;
                    f_dirsync = true;
                    _dirsync = (bool) ((Flags & 16) != 0);
                    return _dirsync;
                }
            }
            private bool f_encrypted;
            private bool _encrypted;

            /// <summary>
            /// use encryption for this inode
            /// </summary>
            public bool Encrypted
            {
                get
                {
                    if (f_encrypted)
                        return _encrypted;
                    f_encrypted = true;
                    _encrypted = (bool) ((Flags & 64) != 0);
                    return _encrypted;
                }
            }
            private bool f_immutable;
            private bool _immutable;

            /// <summary>
            /// inode is immutable
            /// </summary>
            public bool Immutable
            {
                get
                {
                    if (f_immutable)
                        return _immutable;
                    f_immutable = true;
                    _immutable = (bool) ((Flags & 4) != 0);
                    return _immutable;
                }
            }
            private bool f_isBlockDevice;
            private bool _isBlockDevice;
            public bool IsBlockDevice
            {
                get
                {
                    if (f_isBlockDevice)
                        return _isBlockDevice;
                    f_isBlockDevice = true;
                    _isBlockDevice = (bool) ((Mode & 61440) == 24576);
                    return _isBlockDevice;
                }
            }
            private bool f_isCharacterDevice;
            private bool _isCharacterDevice;
            public bool IsCharacterDevice
            {
                get
                {
                    if (f_isCharacterDevice)
                        return _isCharacterDevice;
                    f_isCharacterDevice = true;
                    _isCharacterDevice = (bool) ((Mode & 61440) == 8192);
                    return _isCharacterDevice;
                }
            }
            private bool f_isDir;
            private bool _isDir;
            public bool IsDir
            {
                get
                {
                    if (f_isDir)
                        return _isDir;
                    f_isDir = true;
                    _isDir = (bool) ((Mode & 61440) == 16384);
                    return _isDir;
                }
            }
            private bool f_isFifo;
            private bool _isFifo;
            public bool IsFifo
            {
                get
                {
                    if (f_isFifo)
                        return _isFifo;
                    f_isFifo = true;
                    _isFifo = (bool) ((Mode & 61440) == 4096);
                    return _isFifo;
                }
            }
            private bool f_isLink;
            private bool _isLink;
            public bool IsLink
            {
                get
                {
                    if (f_isLink)
                        return _isLink;
                    f_isLink = true;
                    _isLink = (bool) ((Mode & 61440) == 40960);
                    return _isLink;
                }
            }
            private bool f_isRegular;
            private bool _isRegular;
            public bool IsRegular
            {
                get
                {
                    if (f_isRegular)
                        return _isRegular;
                    f_isRegular = true;
                    _isRegular = (bool) ((Mode & 61440) == 32768);
                    return _isRegular;
                }
            }
            private bool f_isSocket;
            private bool _isSocket;
            public bool IsSocket
            {
                get
                {
                    if (f_isSocket)
                        return _isSocket;
                    f_isSocket = true;
                    _isSocket = (bool) ((Mode & 61440) == 49152);
                    return _isSocket;
                }
            }
            private bool f_synchronous;
            private bool _synchronous;

            /// <summary>
            /// I/O on this inode has to be synchronous
            /// </summary>
            public bool Synchronous
            {
                get
                {
                    if (f_synchronous)
                        return _synchronous;
                    f_synchronous = true;
                    _synchronous = (bool) ((Flags & 2) != 0);
                    return _synchronous;
                }
            }
            private bool f_xattr;
            private bool _xattr;

            /// <summary>
            /// this inode is the inode for an extended attribute value
            /// </summary>
            public bool Xattr
            {
                get
                {
                    if (f_xattr)
                        return _xattr;
                    f_xattr = true;
                    _xattr = (bool) ((Flags & 32) != 0);
                    return _xattr;
                }
            }
            private Key _key;
            private ulong _creationSequenceNumber;
            private ulong _lenUncompressed;
            private ulong _atimeSec;
            private ulong _ctimeSec;
            private ulong _mtimeSec;
            private uint _atimeNsec;
            private uint _ctimeNsec;
            private uint _mtimeNsec;
            private uint _numLinks;
            private uint _uid;
            private uint _gid;
            private uint _mode;
            private uint _flags;
            private uint _lenData;
            private uint _numXattrs;
            private uint _xattrSize;
            private byte[] _padding1;
            private uint _xattrNames;
            private Compression _compression;
            private byte[] _padding2;
            private byte[] _data;
            private Ubifs m_root;
            private Ubifs.Block m_parent;
            private byte[] __raw_key;

            /// <summary>
            /// node key
            /// </summary>
            public Key Key { get { return _key; } }

            /// <summary>
            /// sequence number at time of creation
            /// </summary>
            public ulong CreationSequenceNumber { get { return _creationSequenceNumber; } }

            /// <summary>
            /// inode size in bytes (amount of uncompressed data)
            /// </summary>
            public ulong LenUncompressed { get { return _lenUncompressed; } }

            /// <summary>
            /// access time seconds
            /// </summary>
            public ulong AtimeSec { get { return _atimeSec; } }

            /// <summary>
            /// status change time seconds
            /// </summary>
            public ulong CtimeSec { get { return _ctimeSec; } }

            /// <summary>
            /// modification time seconds
            /// </summary>
            public ulong MtimeSec { get { return _mtimeSec; } }

            /// <summary>
            /// access time nanoseconds
            /// </summary>
            public uint AtimeNsec { get { return _atimeNsec; } }

            /// <summary>
            /// status change time nanoseconds
            /// </summary>
            public uint CtimeNsec { get { return _ctimeNsec; } }

            /// <summary>
            /// modification time nanoseconds
            /// </summary>
            public uint MtimeNsec { get { return _mtimeNsec; } }

            /// <summary>
            /// number of hard links
            /// </summary>
            public uint NumLinks { get { return _numLinks; } }

            /// <summary>
            /// owner ID
            /// </summary>
            public uint Uid { get { return _uid; } }

            /// <summary>
            /// group ID
            /// </summary>
            public uint Gid { get { return _gid; } }

            /// <summary>
            /// file type and permissions, as in `st_mode` (see the `is_*`
            /// instances for the file type)
            /// </summary>
            public uint Mode { get { return _mode; } }

            /// <summary>
            /// per-inode flags (see the instances `compressed`, `synchronous`,
            /// etc.)
            /// </summary>
            public uint Flags { get { return _flags; } }

            /// <summary>
            /// inode data length
            /// </summary>
            public uint LenData { get { return _lenData; } }

            /// <summary>
            /// count of extended attributes this inode has
            /// </summary>
            public uint NumXattrs { get { return _numXattrs; } }

            /// <summary>
            /// summarized size of all extended attributes in bytes
            /// </summary>
            public uint XattrSize { get { return _xattrSize; } }
            public byte[] Padding1 { get { return _padding1; } }

            /// <summary>
            /// sum of lengths of all extended attribute names belonging
            /// to this inode
            /// </summary>
            public uint XattrNames { get { return _xattrNames; } }

            /// <summary>
            /// compression type used for this inode
            /// </summary>
            public Compression Compression { get { return _compression; } }

            /// <summary>
            /// reserved for future, zeroes
            /// </summary>
            public byte[] Padding2 { get { return _padding2; } }

            /// <summary>
            /// Target of a [symbolic link](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/dir.c#L1220-L1241),
            /// (encrypted if the inode is encrypted), device number of a device node
            /// ([`union ubifs_dev_desc`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L466-L478):
            /// 4 bytes from Linux, 8 from `mkfs.ubifs`), or value of an
            /// [extended attribute](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/xattr.c#L115-L121)
            /// (in its own inode, see `xattr`). Empty otherwise.
            /// </summary>
            public byte[] Data { get { return _data; } }
            public Ubifs M_Root { get { return m_root; } }
            public Ubifs.Block M_Parent { get { return m_parent; } }
            public byte[] M_RawKey { get { return __raw_key; } }
        }

        /// <summary>
        /// Inode nodes (`inode_header`), directory and extended attribute entry
        /// nodes (`directory_header`) and data nodes (`data_header`) store keys in a
        /// 16-byte field (`UBIFS_MAX_KEY_LEN`). The simple key format, the only one
        /// there is (see `&lt;superblock_header&gt;.key_fmt`), uses only the first 8
        /// bytes, and Linux (v7.2)
        /// [zeroes](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h#L432-L440)
        /// the rest. Branches of index nodes (`branch`)
        /// [store only these 8 bytes](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h#L448-L455).
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/key.h#L16-L22">Git tag "v7.2"</a>
        /// </remarks>
        public partial class Key : KaitaiStruct
        {
            public static Key FromFile(string fileName)
            {
                return new Key(new KaitaiStream(fileName));
            }

            public Key(KaitaiStream p__io, KaitaiStruct p__parent = null, Ubifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _inodeNumber = m_io.ReadU4le();
                _value = m_io.ReadBitsIntLe(29);
                _type = ((Ubifs.KeyTypes) m_io.ReadBitsIntLe(3));
                if (!Enum.IsDefined(typeof(KeyTypes), _type))
                {
                    throw new ValidationNotInEnumError(_type, m_io, "/types/key/seq/2");
                }
                m_io.AlignToByte();
                _unused = m_io.ReadBytesFull();
            }
            private uint _inodeNumber;
            private ulong _value;
            private KeyTypes _type;
            private byte[] _unused;
            private Ubifs m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// Number of the inode that the node belongs to: the parent directory
            /// for a directory entry, the inode that the attribute belongs to for an
            /// extended attribute entry.
            /// </summary>
            public uint InodeNumber { get { return _inodeNumber; } }

            /// <summary>
            /// Block number for a data node, hash of the name (see
            /// `&lt;superblock_header&gt;.key_hash`) for a directory or extended
            /// attribute entry, 0 for an inode node.
            /// </summary>
            public ulong Value { get { return _value; } }

            /// <summary>
            /// Type of the key, which matches the type of the node.
            /// </summary>
            public KeyTypes Type { get { return _type; } }

            /// <summary>
            /// Rest of the field holding the key: 8 zero bytes in `inode_header`,
            /// `directory_header` and `data_header`, empty in `branch`.
            /// </summary>
            public byte[] Unused { get { return _unused; } }
            public Ubifs M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L685-L756">Git tag "v7.2"</a>
        /// </remarks>
        public partial class MasterHeader : KaitaiStruct
        {
            public static MasterHeader FromFile(string fileName)
            {
                return new MasterHeader(new KaitaiStream(fileName));
            }

            public MasterHeader(KaitaiStream p__io, KaitaiStruct p__parent = null, Ubifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_dirty = false;
                f_noOrphans = false;
                f_recovery = false;
                _read();
            }
            private void _read()
            {
                _highestInum = m_io.ReadU8le();
                _commitNumber = m_io.ReadU8le();
                _flags = m_io.ReadU4le();
                _lebLog = m_io.ReadU4le();
                _lebRoot = m_io.ReadU4le();
                _ofsRoot = m_io.ReadU4le();
                _lenRoot = m_io.ReadU4le();
                _lebGarbageCollect = m_io.ReadU4le();
                _lebIndexHead = m_io.ReadU4le();
                _ofsIndexHead = m_io.ReadU4le();
                _lenIndex = m_io.ReadU8le();
                _totalFree = m_io.ReadU8le();
                _totalDirty = m_io.ReadU8le();
                _totalUsed = m_io.ReadU8le();
                _totalDead = m_io.ReadU8le();
                _totalDark = m_io.ReadU8le();
                _lebLpt = m_io.ReadU4le();
                _ofsLpt = m_io.ReadU4le();
                _lebNhead = m_io.ReadU4le();
                _ofsNhead = m_io.ReadU4le();
                _lebLpropsTable = m_io.ReadU4le();
                _ofsLpropsTable = m_io.ReadU4le();
                _lebSaveTable = m_io.ReadU4le();
                _ofsSaveTable = m_io.ReadU4le();
                _lebLastLptScan = m_io.ReadU4le();
                _numEmptyLebs = m_io.ReadU4le();
                _numIndexLebs = m_io.ReadU4le();
                _numLebs = m_io.ReadU4le();
                _hashRootIndex = m_io.ReadBytes(64);
                _hashLpt = m_io.ReadBytes(64);
                _hmac = m_io.ReadBytes(64);
                _padding = m_io.ReadBytes(152);
            }
            private bool f_dirty;
            private bool _dirty;

            /// <summary>
            /// master node is dirty
            /// </summary>
            public bool Dirty
            {
                get
                {
                    if (f_dirty)
                        return _dirty;
                    f_dirty = true;
                    _dirty = (bool) ((Flags & 1) != 0);
                    return _dirty;
                }
            }
            private bool f_noOrphans;
            private bool _noOrphans;

            /// <summary>
            /// no orphan inodes present
            /// </summary>
            public bool NoOrphans
            {
                get
                {
                    if (f_noOrphans)
                        return _noOrphans;
                    f_noOrphans = true;
                    _noOrphans = (bool) ((Flags & 2) != 0);
                    return _noOrphans;
                }
            }
            private bool f_recovery;
            private bool _recovery;

            /// <summary>
            /// written by recovery
            /// </summary>
            public bool Recovery
            {
                get
                {
                    if (f_recovery)
                        return _recovery;
                    f_recovery = true;
                    _recovery = (bool) ((Flags & 4) != 0);
                    return _recovery;
                }
            }
            private ulong _highestInum;
            private ulong _commitNumber;
            private uint _flags;
            private uint _lebLog;
            private uint _lebRoot;
            private uint _ofsRoot;
            private uint _lenRoot;
            private uint _lebGarbageCollect;
            private uint _lebIndexHead;
            private uint _ofsIndexHead;
            private ulong _lenIndex;
            private ulong _totalFree;
            private ulong _totalDirty;
            private ulong _totalUsed;
            private ulong _totalDead;
            private ulong _totalDark;
            private uint _lebLpt;
            private uint _ofsLpt;
            private uint _lebNhead;
            private uint _ofsNhead;
            private uint _lebLpropsTable;
            private uint _ofsLpropsTable;
            private uint _lebSaveTable;
            private uint _ofsSaveTable;
            private uint _lebLastLptScan;
            private uint _numEmptyLebs;
            private uint _numIndexLebs;
            private uint _numLebs;
            private byte[] _hashRootIndex;
            private byte[] _hashLpt;
            private byte[] _hmac;
            private byte[] _padding;
            private Ubifs m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// highest inode number in the committed index
            /// </summary>
            public ulong HighestInum { get { return _highestInum; } }

            /// <summary>
            /// commit number
            /// </summary>
            public ulong CommitNumber { get { return _commitNumber; } }

            /// <summary>
            /// various flags (see the instances `dirty`, `no_orphans` and
            /// `recovery`)
            /// </summary>
            public uint Flags { get { return _flags; } }

            /// <summary>
            /// start of the log
            /// </summary>
            public uint LebLog { get { return _lebLog; } }

            /// <summary>
            /// LEB number of the root indexing node
            /// </summary>
            public uint LebRoot { get { return _lebRoot; } }

            /// <summary>
            /// offset within the LEB `leb_root`
            /// </summary>
            public uint OfsRoot { get { return _ofsRoot; } }

            /// <summary>
            /// root indexing node length
            /// </summary>
            public uint LenRoot { get { return _lenRoot; } }

            /// <summary>
            /// LEB reserved for garbage collection, which must be in the main area.
            /// 
            /// The [comment above `struct ubifs_mst_node`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L695-L696)
            /// says that -1 (`0xffff_ffff`) means the LEB was not reserved and should
            /// be reserved on mount. However, Linux refuses to mount a file system
            /// with -1. Linux
            /// [stores](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L362)
            /// the field in an
            /// [`int`](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs.h#L1424),
            /// so `0xffff_ffff` becomes -1. Then -1 is rejected by the condition
            /// `c-&gt;gc_lnum &lt; c-&gt;main_first`, because the main area
            /// [starts](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L775-L777)
            /// after the superblock, master, log, LPT and orphan areas.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L214-L217">Git tag "v7.2"</a>
            /// </remarks>
            public uint LebGarbageCollect { get { return _lebGarbageCollect; } }

            /// <summary>
            /// LEB number of index head
            /// </summary>
            public uint LebIndexHead { get { return _lebIndexHead; } }

            /// <summary>
            /// offset of index head
            /// </summary>
            public uint OfsIndexHead { get { return _ofsIndexHead; } }

            /// <summary>
            /// size of index on flash
            /// </summary>
            public ulong LenIndex { get { return _lenIndex; } }

            /// <summary>
            /// total free space in bytes
            /// </summary>
            public ulong TotalFree { get { return _totalFree; } }

            /// <summary>
            /// total dirty space in bytes
            /// </summary>
            public ulong TotalDirty { get { return _totalDirty; } }

            /// <summary>
            /// total used space in bytes (includes only data LEBs)
            /// </summary>
            public ulong TotalUsed { get { return _totalUsed; } }

            /// <summary>
            /// total dead space in bytes (includes only data LEBs)
            /// </summary>
            public ulong TotalDead { get { return _totalDead; } }

            /// <summary>
            /// total dark space in bytes (includes only data LEBs)
            /// </summary>
            public ulong TotalDark { get { return _totalDark; } }

            /// <summary>
            /// LEB number of LPT root nnode
            /// </summary>
            public uint LebLpt { get { return _lebLpt; } }

            /// <summary>
            /// offset of LPT root nnode
            /// </summary>
            public uint OfsLpt { get { return _ofsLpt; } }

            /// <summary>
            /// LEB number of LPT head
            /// </summary>
            public uint LebNhead { get { return _lebNhead; } }

            /// <summary>
            /// offset of LPT head
            /// </summary>
            public uint OfsNhead { get { return _ofsNhead; } }

            /// <summary>
            /// LEB number of LPT's own lprops table
            /// </summary>
            public uint LebLpropsTable { get { return _lebLpropsTable; } }

            /// <summary>
            /// offset of LPT's own lprops table
            /// </summary>
            public uint OfsLpropsTable { get { return _ofsLpropsTable; } }

            /// <summary>
            /// LEB number of LPT's save table. Present in every master node, but
            /// only meaningful if `&lt;superblock_header&gt;.biglpt` is set: only then
            /// does Linux [check the location of the save table](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L252-L256).
            /// </summary>
            public uint LebSaveTable { get { return _lebSaveTable; } }

            /// <summary>
            /// offset of LPT's save table (only meaningful if
            /// `&lt;superblock_header&gt;.biglpt` is set, see `leb_save_table`)
            /// </summary>
            public uint OfsSaveTable { get { return _ofsSaveTable; } }

            /// <summary>
            /// LEB number of last LPT scan
            /// </summary>
            public uint LebLastLptScan { get { return _lebLastLptScan; } }

            /// <summary>
            /// number of empty logical eraseblocks
            /// </summary>
            public uint NumEmptyLebs { get { return _numEmptyLebs; } }

            /// <summary>
            /// number of indexing logical eraseblocks
            /// </summary>
            public uint NumIndexLebs { get { return _numIndexLebs; } }

            /// <summary>
            /// count of LEBs used by file-system
            /// </summary>
            public uint NumLebs { get { return _numLebs; } }

            /// <summary>
            /// the hash of the root index node
            /// </summary>
            public byte[] HashRootIndex { get { return _hashRootIndex; } }

            /// <summary>
            /// the hash of the LPT
            /// </summary>
            public byte[] HashLpt { get { return _hashLpt; } }

            /// <summary>
            /// HMAC to authenticate the master node
            /// </summary>
            public byte[] Hmac { get { return _hmac; } }

            /// <summary>
            /// reserved for future, zeroes
            /// </summary>
            public byte[] Padding { get { return _padding; } }
            public Ubifs M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class MasterblockNode : KaitaiStruct
        {
            public static MasterblockNode FromFile(string fileName)
            {
                return new MasterblockNode(new KaitaiStream(fileName));
            }

            public MasterblockNode(KaitaiStream p__io, Ubifs p__parent = null, Ubifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _header = new CommonHeader(m_io, this, m_root);
                {
                    CommonHeader M_ = _header;
                    if (!(M_.NodeType == Ubifs.NodeTypes.Master))
                    {
                        throw new ValidationExprError(_header, m_io, "/types/masterblock_node/seq/0");
                    }
                }
                __raw_nodeHeader = m_io.ReadBytes(Header.LenFullNode - 24);
                var io___raw_nodeHeader = new KaitaiStream(__raw_nodeHeader);
                _nodeHeader = new MasterHeader(io___raw_nodeHeader, this, m_root);
            }
            private CommonHeader _header;
            private MasterHeader _nodeHeader;
            private Ubifs m_root;
            private Ubifs m_parent;
            private byte[] __raw_nodeHeader;
            public CommonHeader Header { get { return _header; } }
            public MasterHeader NodeHeader { get { return _nodeHeader; } }
            public Ubifs M_Root { get { return m_root; } }
            public Ubifs M_Parent { get { return m_parent; } }
            public byte[] M_RawNodeHeader { get { return __raw_nodeHeader; } }
        }

        /// <remarks>
        /// Reference: <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L843-L853">Git tag "v7.2"</a>
        /// </remarks>
        public partial class OrphanHeader : KaitaiStruct
        {
            public static OrphanHeader FromFile(string fileName)
            {
                return new OrphanHeader(new KaitaiStream(fileName));
            }

            public OrphanHeader(KaitaiStream p__io, Ubifs.Block p__parent = null, Ubifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _commitNumber = m_io.ReadU8le();
                _inodeNumbers = new List<ulong>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _inodeNumbers.Add(m_io.ReadU8le());
                        i++;
                    }
                }
            }
            private ulong _commitNumber;
            private List<ulong> _inodeNumbers;
            private Ubifs m_root;
            private Ubifs.Block m_parent;

            /// <summary>
            /// commit number (also top bit is set on the last node of the commit)
            /// </summary>
            public ulong CommitNumber { get { return _commitNumber; } }

            /// <summary>
            /// inode numbers of orphans
            /// </summary>
            public List<ulong> InodeNumbers { get { return _inodeNumbers; } }
            public Ubifs M_Root { get { return m_root; } }
            public Ubifs.Block M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L606-L615">Git tag "v7.2"</a>
        /// </remarks>
        public partial class PaddingHeader : KaitaiStruct
        {
            public static PaddingHeader FromFile(string fileName)
            {
                return new PaddingHeader(new KaitaiStream(fileName));
            }

            public PaddingHeader(KaitaiStream p__io, Ubifs.Block p__parent = null, Ubifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenPadding = m_io.ReadU4le();
            }
            private uint _lenPadding;
            private Ubifs m_root;
            private Ubifs.Block m_parent;

            /// <summary>
            /// how many bytes after this node are unused (because padded)
            /// </summary>
            public uint LenPadding { get { return _lenPadding; } }
            public Ubifs M_Root { get { return m_root; } }
            public Ubifs.Block M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// logical eraseblock reference node.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L758-L772">Git tag "v7.2"</a>
        /// </remarks>
        public partial class ReferenceHeader : KaitaiStruct
        {
            public static ReferenceHeader FromFile(string fileName)
            {
                return new ReferenceHeader(new KaitaiStream(fileName));
            }

            public ReferenceHeader(KaitaiStream p__io, Ubifs.Block p__parent = null, Ubifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lebNumber = m_io.ReadU4le();
                _ofsLeb = m_io.ReadU4le();
                _journalHeadNumber = m_io.ReadU4le();
                _padding = m_io.ReadBytes(28);
            }
            private uint _lebNumber;
            private uint _ofsLeb;
            private uint _journalHeadNumber;
            private byte[] _padding;
            private Ubifs m_root;
            private Ubifs.Block m_parent;

            /// <summary>
            /// the referred logical eraseblock number
            /// </summary>
            public uint LebNumber { get { return _lebNumber; } }

            /// <summary>
            /// start offset in the referred LEB
            /// </summary>
            public uint OfsLeb { get { return _ofsLeb; } }

            /// <summary>
            /// journal head number
            /// </summary>
            public uint JournalHeadNumber { get { return _journalHeadNumber; } }

            /// <summary>
            /// reserved for future, zeroes
            /// </summary>
            public byte[] Padding { get { return _padding; } }
            public Ubifs M_Root { get { return m_root; } }
            public Ubifs.Block M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Signature of the superblock node of a file system signed when it was
        /// created (`mkfs.ubifs` with a key). Linux
        /// [expects it](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L198-L216)
        /// as the first node after the superblock node in LEB0.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L784-L799">Git tag "v7.2"</a>
        /// </remarks>
        public partial class SignatureHeader : KaitaiStruct
        {
            public static SignatureHeader FromFile(string fileName)
            {
                return new SignatureHeader(new KaitaiStream(fileName));
            }

            public SignatureHeader(KaitaiStream p__io, Ubifs.Block p__parent = null, Ubifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _type = m_io.ReadU4le();
                if (!(_type == 1))
                {
                    throw new ValidationNotEqualError(1, _type, m_io, "/types/signature_header/seq/0");
                }
                _lenSignature = m_io.ReadU4le();
                _padding = m_io.ReadBytes(32);
                _signature = m_io.ReadBytes(LenSignature);
            }
            private uint _type;
            private uint _lenSignature;
            private byte[] _padding;
            private byte[] _signature;
            private Ubifs m_root;
            private Ubifs.Block m_parent;

            /// <summary>
            /// type of the signature
            /// </summary>
            public uint Type { get { return _type; } }

            /// <summary>
            /// length of `signature` in bytes
            /// </summary>
            public uint LenSignature { get { return _lenSignature; } }

            /// <summary>
            /// reserved for future, zeroes
            /// </summary>
            public byte[] Padding { get { return _padding; } }

            /// <summary>
            /// [PKCS #7 signature](https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/auth.c#L233-L236)
            /// of the whole superblock node (4096 bytes, including the common
            /// header)
            /// </summary>
            public byte[] Signature { get { return _signature; } }
            public Ubifs M_Root { get { return m_root; } }
            public Ubifs.Block M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L617-L683">Git tag "v7.2"</a>
        /// </remarks>
        public partial class SuperblockHeader : KaitaiStruct
        {
            public static SuperblockHeader FromFile(string fileName)
            {
                return new SuperblockHeader(new KaitaiStream(fileName));
            }

            public SuperblockHeader(KaitaiStream p__io, KaitaiStruct p__parent = null, Ubifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_authenticated = false;
                f_biglpt = false;
                f_doubleHash = false;
                f_encrypted = false;
                f_lenHash = false;
                f_spaceFixup = false;
                _read();
            }
            private void _read()
            {
                _padding0 = m_io.ReadBytes(2);
                if (!((KaitaiStream.ByteArrayCompare(_padding0, new byte[] { 0, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0, 0 }, _padding0, m_io, "/types/superblock_header/seq/0");
                }
                _keyHash = ((Ubifs.Hashes) m_io.ReadU1());
                if (!Enum.IsDefined(typeof(Hashes), _keyHash))
                {
                    throw new ValidationNotInEnumError(_keyHash, m_io, "/types/superblock_header/seq/1");
                }
                _keyFmt = ((Ubifs.KeyFormats) m_io.ReadU1());
                if (!(_keyFmt == Ubifs.KeyFormats.Simple))
                {
                    throw new ValidationNotEqualError(Ubifs.KeyFormats.Simple, _keyFmt, m_io, "/types/superblock_header/seq/2");
                }
                _flags = m_io.ReadU4le();
                _minIoSize = m_io.ReadU4le();
                _lebSize = m_io.ReadU4le();
                _numLebs = m_io.ReadU4le();
                _maxNumLebs = m_io.ReadU4le();
                if (!(_maxNumLebs >= NumLebs))
                {
                    throw new ValidationLessThanError(NumLebs, _maxNumLebs, m_io, "/types/superblock_header/seq/7");
                }
                _maxBudBytes = m_io.ReadU8le();
                _numLogLebs = m_io.ReadU4le();
                if (!(_numLogLebs >= 2))
                {
                    throw new ValidationLessThanError(2, _numLogLebs, m_io, "/types/superblock_header/seq/9");
                }
                _numLptLebs = m_io.ReadU4le();
                if (!(_numLptLebs >= 2))
                {
                    throw new ValidationLessThanError(2, _numLptLebs, m_io, "/types/superblock_header/seq/10");
                }
                _numOrphanLebs = m_io.ReadU4le();
                if (!(_numOrphanLebs >= 1))
                {
                    throw new ValidationLessThanError(1, _numOrphanLebs, m_io, "/types/superblock_header/seq/11");
                }
                _numJournalHeads = m_io.ReadU4le();
                _fanout = m_io.ReadU4le();
                _numSaveTableEntries = m_io.ReadU4le();
                _fmtVersion = m_io.ReadU4le();
                if (!(_fmtVersion >= 4))
                {
                    throw new ValidationLessThanError(4, _fmtVersion, m_io, "/types/superblock_header/seq/15");
                }
                _defaultCompression = ((Ubifs.Compression) m_io.ReadU2le());
                if (!Enum.IsDefined(typeof(Compression), _defaultCompression))
                {
                    throw new ValidationNotInEnumError(_defaultCompression, m_io, "/types/superblock_header/seq/16");
                }
                _padding1 = m_io.ReadBytes(2);
                if (!((KaitaiStream.ByteArrayCompare(_padding1, new byte[] { 0, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0, 0 }, _padding1, m_io, "/types/superblock_header/seq/17");
                }
                _reservePoolUid = m_io.ReadU4le();
                _reservePoolGid = m_io.ReadU4le();
                _reservePoolSize = m_io.ReadU8le();
                _timeGranularity = m_io.ReadU4le();
                if (!(_timeGranularity >= 1))
                {
                    throw new ValidationLessThanError(1, _timeGranularity, m_io, "/types/superblock_header/seq/21");
                }
                if (!(_timeGranularity <= 1000000000))
                {
                    throw new ValidationGreaterThanError(1000000000, _timeGranularity, m_io, "/types/superblock_header/seq/21");
                }
                _uuid = m_io.ReadBytes(16);
                _roCompatVersion = m_io.ReadU4le();
                _hmac = m_io.ReadBytes(64);
                _hmacWkm = m_io.ReadBytes(64);
                if (Authenticated) {
                    _hashAlgo = ((Ubifs.HashAlgos) m_io.ReadU2le());
                    if (!Enum.IsDefined(typeof(HashAlgos), _hashAlgo))
                    {
                        throw new ValidationNotInEnumError(_hashAlgo, m_io, "/types/superblock_header/seq/26");
                    }
                }
                if (!(Authenticated)) {
                    _hashAlgoUnused = m_io.ReadU2le();
                }
                _hashMst = m_io.ReadBytes(64);
                _padding2 = m_io.ReadBytes(3774);
            }
            private bool f_authenticated;
            private bool _authenticated;

            /// <summary>
            /// this filesystem contains hashes for authentication
            /// </summary>
            public bool Authenticated
            {
                get
                {
                    if (f_authenticated)
                        return _authenticated;
                    f_authenticated = true;
                    _authenticated = (bool) ((Flags & 32) != 0);
                    return _authenticated;
                }
            }
            private bool f_biglpt;
            private bool _biglpt;

            /// <summary>
            /// if &quot;big&quot; LPT model is used if set
            /// </summary>
            public bool Biglpt
            {
                get
                {
                    if (f_biglpt)
                        return _biglpt;
                    f_biglpt = true;
                    _biglpt = (bool) ((Flags & 2) != 0);
                    return _biglpt;
                }
            }
            private bool f_doubleHash;
            private bool _doubleHash;

            /// <summary>
            /// store a 32bit cookie in directory entry nodes to
            /// support 64bit cookies for lookups by hash
            /// </summary>
            public bool DoubleHash
            {
                get
                {
                    if (f_doubleHash)
                        return _doubleHash;
                    f_doubleHash = true;
                    _doubleHash = (bool) ((Flags & 8) != 0);
                    return _doubleHash;
                }
            }
            private bool f_encrypted;
            private bool _encrypted;

            /// <summary>
            /// filesystem contains encrypted files
            /// </summary>
            public bool Encrypted
            {
                get
                {
                    if (f_encrypted)
                        return _encrypted;
                    f_encrypted = true;
                    _encrypted = (bool) ((Flags & 16) != 0);
                    return _encrypted;
                }
            }
            private bool f_lenHash;
            private int _lenHash;

            /// <summary>
            /// Length in bytes of the hash of a node (`c-&gt;hash_len` in Linux), e.g.
            /// in each branch of an index node. In an authenticated file system, it
            /// is determined by `hash_algo`. Otherwise, it is 0.
            /// </summary>
            public int LenHash
            {
                get
                {
                    if (f_lenHash)
                        return _lenHash;
                    f_lenHash = true;
                    _lenHash = (int) ((!(Authenticated) ? 0 : ( ((HashAlgo == Ubifs.HashAlgos.Md4) || (HashAlgo == Ubifs.HashAlgos.Md5) || (HashAlgo == Ubifs.HashAlgos.RipeMd128) || (HashAlgo == Ubifs.HashAlgos.Tgr128))  ? 16 : ( ((HashAlgo == Ubifs.HashAlgos.Sha1) || (HashAlgo == Ubifs.HashAlgos.RipeMd160) || (HashAlgo == Ubifs.HashAlgos.Tgr160))  ? 20 : (HashAlgo == Ubifs.HashAlgos.Tgr192 ? 24 : (HashAlgo == Ubifs.HashAlgos.Sha224 ? 28 : ( ((HashAlgo == Ubifs.HashAlgos.Sha256) || (HashAlgo == Ubifs.HashAlgos.RipeMd256) || (HashAlgo == Ubifs.HashAlgos.Wp256) || (HashAlgo == Ubifs.HashAlgos.Sm3256) || (HashAlgo == Ubifs.HashAlgos.Streebog256) || (HashAlgo == Ubifs.HashAlgos.Sha3256))  ? 32 : (HashAlgo == Ubifs.HashAlgos.RipeMd320 ? 40 : ( ((HashAlgo == Ubifs.HashAlgos.Sha384) || (HashAlgo == Ubifs.HashAlgos.Wp384) || (HashAlgo == Ubifs.HashAlgos.Sha3384))  ? 48 : ( ((HashAlgo == Ubifs.HashAlgos.Sha512) || (HashAlgo == Ubifs.HashAlgos.Wp512) || (HashAlgo == Ubifs.HashAlgos.Streebog512) || (HashAlgo == Ubifs.HashAlgos.Sha3512))  ? 64 : -1))))))))));
                    return _lenHash;
                }
            }
            private bool f_spaceFixup;
            private bool _spaceFixup;

            /// <summary>
            /// first-mount &quot;fixup&quot; of free space within LEBs needed
            /// </summary>
            public bool SpaceFixup
            {
                get
                {
                    if (f_spaceFixup)
                        return _spaceFixup;
                    f_spaceFixup = true;
                    _spaceFixup = (bool) ((Flags & 4) != 0);
                    return _spaceFixup;
                }
            }
            private byte[] _padding0;
            private Hashes _keyHash;
            private KeyFormats _keyFmt;
            private uint _flags;
            private uint _minIoSize;
            private uint _lebSize;
            private uint _numLebs;
            private uint _maxNumLebs;
            private ulong _maxBudBytes;
            private uint _numLogLebs;
            private uint _numLptLebs;
            private uint _numOrphanLebs;
            private uint _numJournalHeads;
            private uint _fanout;
            private uint _numSaveTableEntries;
            private uint _fmtVersion;
            private Compression _defaultCompression;
            private byte[] _padding1;
            private uint _reservePoolUid;
            private uint _reservePoolGid;
            private ulong _reservePoolSize;
            private uint _timeGranularity;
            private byte[] _uuid;
            private uint _roCompatVersion;
            private byte[] _hmac;
            private byte[] _hmacWkm;
            private HashAlgos _hashAlgo;
            private ushort? _hashAlgoUnused;
            private byte[] _hashMst;
            private byte[] _padding2;
            private Ubifs m_root;
            private KaitaiStruct m_parent;

            /// <summary>
            /// reserved for future, zeroes
            /// </summary>
            public byte[] Padding0 { get { return _padding0; } }

            /// <summary>
            /// type of hash function used in keys
            /// </summary>
            public Hashes KeyHash { get { return _keyHash; } }

            /// <summary>
            /// format of the key
            /// </summary>
            public KeyFormats KeyFmt { get { return _keyFmt; } }

            /// <summary>
            /// file-system flags (see the instances `biglpt`, `space_fixup`, etc.)
            /// </summary>
            public uint Flags { get { return _flags; } }

            /// <summary>
            /// minimal input/output unit size
            /// </summary>
            public uint MinIoSize { get { return _minIoSize; } }

            /// <summary>
            /// logical eraseblock size in bytes
            /// </summary>
            public uint LebSize { get { return _lebSize; } }

            /// <summary>
            /// count of LEBs used by file-system
            /// </summary>
            public uint NumLebs { get { return _numLebs; } }

            /// <summary>
            /// maximum count of LEBs used by file-system
            /// </summary>
            public uint MaxNumLebs { get { return _maxNumLebs; } }

            /// <summary>
            /// maximum amount of data stored in buds
            /// </summary>
            public ulong MaxBudBytes { get { return _maxBudBytes; } }

            /// <summary>
            /// log size in logical eraseblocks
            /// </summary>
            public uint NumLogLebs { get { return _numLogLebs; } }

            /// <summary>
            /// number of LEBs used for lprops table
            /// </summary>
            public uint NumLptLebs { get { return _numLptLebs; } }

            /// <summary>
            /// number of LEBs used for recording orphans
            /// </summary>
            public uint NumOrphanLebs { get { return _numOrphanLebs; } }

            /// <summary>
            /// count of journal heads
            /// </summary>
            public uint NumJournalHeads { get { return _numJournalHeads; } }

            /// <summary>
            /// tree fanout (max. number of links per indexing node)
            /// </summary>
            public uint Fanout { get { return _fanout; } }

            /// <summary>
            /// number of LEB numbers in LPT's save table
            /// </summary>
            public uint NumSaveTableEntries { get { return _numSaveTableEntries; } }

            /// <summary>
            /// UBIFS on-flash format version
            /// </summary>
            public uint FmtVersion { get { return _fmtVersion; } }

            /// <summary>
            /// default compression algorithm (`compression::lzo`, etc.)
            /// </summary>
            public Compression DefaultCompression { get { return _defaultCompression; } }

            /// <summary>
            /// reserved for future, zeroes
            /// </summary>
            public byte[] Padding1 { get { return _padding1; } }

            /// <summary>
            /// reserve pool UID
            /// </summary>
            public uint ReservePoolUid { get { return _reservePoolUid; } }

            /// <summary>
            /// reserve pool GID
            /// </summary>
            public uint ReservePoolGid { get { return _reservePoolGid; } }

            /// <summary>
            /// size of the reserved pool in bytes
            /// </summary>
            public ulong ReservePoolSize { get { return _reservePoolSize; } }

            /// <summary>
            /// time granularity in nanoseconds
            /// </summary>
            public uint TimeGranularity { get { return _timeGranularity; } }

            /// <summary>
            /// UUID generated when the file system image was created
            /// </summary>
            public byte[] Uuid { get { return _uuid; } }

            /// <summary>
            /// UBIFS R/O compatibility version
            /// </summary>
            public uint RoCompatVersion { get { return _roCompatVersion; } }

            /// <summary>
            /// HMAC to authenticate the superblock node
            /// </summary>
            public byte[] Hmac { get { return _hmac; } }

            /// <summary>
            /// HMAC of a well known message (the string &quot;UBIFS&quot;) as a convenience
            /// to the user to check if the correct key is passed
            /// </summary>
            public byte[] HmacWkm { get { return _hmacWkm; } }

            /// <summary>
            /// The hash algo used for this filesystem
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L549-L573">Git tag "v7.2"</a>
            /// </remarks>
            public HashAlgos HashAlgo { get { return _hashAlgo; } }

            /// <summary>
            /// Unused field (would only be meaningful in an authenticated file
            /// system, see `hash_algo`). The kernel writes it as 0xffff, `mkfs.ubifs`
            /// writes it as 0.
            /// </summary>
            /// <remarks>
            /// Reference: <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/sb.c#L183-L191">Git tag "v7.2"</a>
            /// </remarks>
            public ushort? HashAlgoUnused { get { return _hashAlgoUnused; } }

            /// <summary>
            /// hash of the master node, only valid for signed images in which the
            /// master node does not contain a hmac
            /// </summary>
            public byte[] HashMst { get { return _hashMst; } }

            /// <summary>
            /// reserved for future, zeroes
            /// </summary>
            public byte[] Padding2 { get { return _padding2; } }
            public Ubifs M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class SuperblockNode : KaitaiStruct
        {
            public static SuperblockNode FromFile(string fileName)
            {
                return new SuperblockNode(new KaitaiStream(fileName));
            }

            public SuperblockNode(KaitaiStream p__io, Ubifs p__parent = null, Ubifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _header = new CommonHeader(m_io, this, m_root);
                {
                    CommonHeader M_ = _header;
                    if (!(M_.NodeType == Ubifs.NodeTypes.Superblock))
                    {
                        throw new ValidationExprError(_header, m_io, "/types/superblock_node/seq/0");
                    }
                }
                __raw_nodeHeader = m_io.ReadBytes(Header.LenFullNode - 24);
                var io___raw_nodeHeader = new KaitaiStream(__raw_nodeHeader);
                _nodeHeader = new SuperblockHeader(io___raw_nodeHeader, this, m_root);
            }
            private CommonHeader _header;
            private SuperblockHeader _nodeHeader;
            private Ubifs m_root;
            private Ubifs m_parent;
            private byte[] __raw_nodeHeader;
            public CommonHeader Header { get { return _header; } }
            public SuperblockHeader NodeHeader { get { return _nodeHeader; } }
            public Ubifs M_Root { get { return m_root; } }
            public Ubifs M_Parent { get { return m_parent; } }
            public byte[] M_RawNodeHeader { get { return __raw_nodeHeader; } }
        }

        /// <summary>
        /// This node exists only in the journal and never goes to the main area.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/ubifs-media.h#L586-L604">Git tag "v7.2"</a>
        /// </remarks>
        public partial class TruncationHeader : KaitaiStruct
        {
            public static TruncationHeader FromFile(string fileName)
            {
                return new TruncationHeader(new KaitaiStream(fileName));
            }

            public TruncationHeader(KaitaiStream p__io, Ubifs.Block p__parent = null, Ubifs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _inodeNumber = m_io.ReadU4le();
                _padding = m_io.ReadBytes(12);
                _oldSize = m_io.ReadU8le();
                if (!(_oldSize >= 1))
                {
                    throw new ValidationLessThanError(1, _oldSize, m_io, "/types/truncation_header/seq/2");
                }
                _newSize = m_io.ReadU8le();
                if (!(_newSize <= OldSize - 1))
                {
                    throw new ValidationGreaterThanError(OldSize - 1, _newSize, m_io, "/types/truncation_header/seq/3");
                }
            }
            private uint _inodeNumber;
            private byte[] _padding;
            private ulong _oldSize;
            private ulong _newSize;
            private Ubifs m_root;
            private Ubifs.Block m_parent;

            /// <summary>
            /// truncated inode number
            /// </summary>
            public uint InodeNumber { get { return _inodeNumber; } }

            /// <summary>
            /// reserved for future, zeroes
            /// </summary>
            public byte[] Padding { get { return _padding; } }

            /// <summary>
            /// size before truncation
            /// </summary>
            public ulong OldSize { get { return _oldSize; } }

            /// <summary>
            /// size after truncation
            /// </summary>
            public ulong NewSize { get { return _newSize; } }
            public Ubifs M_Root { get { return m_root; } }
            public Ubifs.Block M_Parent { get { return m_parent; } }
        }
        private bool f_index;
        private Dummy _index;

        /// <summary>
        /// The LEB containing the root index node, as given by `leb_root` in
        /// `master_1`.
        /// 
        /// This instance only provides the substream for `index_root`, which can then
        /// use `ofs_root` (an offset within the LEB) as its `pos` directly.
        /// </summary>
        public Dummy Index
        {
            get
            {
                if (f_index)
                    return _index;
                f_index = true;
                long _pos = m_io.Pos;
                m_io.Seek(Superblock.NodeHeader.LebSize * Master1.NodeHeader.LebRoot);
                __raw_index = m_io.ReadBytes(Superblock.NodeHeader.LebSize);
                var io___raw_index = new KaitaiStream(__raw_index);
                _index = new Dummy(io___raw_index, this, m_root);
                m_io.Seek(_pos);
                return _index;
            }
        }
        private bool f_indexRoot;
        private IndexBlock _indexRoot;

        /// <summary>
        /// The root index node, in the `index` LEB at the offset given by
        /// `ofs_root` in `master_1`. All other index nodes, and through them all
        /// the files, are reached from it by recursively following the `target` of
        /// each of the `branches`.
        /// </summary>
        public IndexBlock IndexRoot
        {
            get
            {
                if (f_indexRoot)
                    return _indexRoot;
                f_indexRoot = true;
                KaitaiStream io = Index.M_Io;
                long _pos = io.Pos;
                io.Seek(Master1.NodeHeader.OfsRoot);
                _indexRoot = new IndexBlock(io, this, m_root);
                {
                    IndexBlock M_ = _indexRoot;
                    if (!(M_.Header.LenFullNode == Master1.NodeHeader.LenRoot))
                    {
                        throw new ValidationExprError(_indexRoot, m_io, "/instances/index_root");
                    }
                }
                io.Seek(_pos);
                return _indexRoot;
            }
        }
        private bool f_lebs;
        private List<byte[]> _lebs;

        /// <summary>
        /// All LEBs of the file system: `lebs[n]` is LEB number `n`, which starts
        /// at offset `n * &lt;superblock_header&gt;.leb_size`.
        /// 
        /// Accessing this instance reads the whole image into memory. To get a
        /// single LEB, it's cheaper to read `&lt;superblock_header&gt;.leb_size` bytes
        /// at the offset of that LEB.
        /// </summary>
        public List<byte[]> Lebs
        {
            get
            {
                if (f_lebs)
                    return _lebs;
                f_lebs = true;
                long _pos = m_io.Pos;
                m_io.Seek(0);
                _lebs = new List<byte[]>();
                for (var i = 0; i < Superblock.NodeHeader.NumLebs; i++)
                {
                    _lebs.Add(m_io.ReadBytes(Superblock.NodeHeader.LebSize));
                }
                m_io.Seek(_pos);
                return _lebs;
            }
        }
        private bool f_lenImage;
        private int _lenImage;

        /// <summary>
        /// Length of the file system image in bytes:
        /// `&lt;superblock_header&gt;.num_lebs` LEBs of `&lt;superblock_header&gt;.leb_size`
        /// bytes each. Use it to find where the image ends and to detect a
        /// truncated image (see the top-level `doc`).
        /// </summary>
        public int LenImage
        {
            get
            {
                if (f_lenImage)
                    return _lenImage;
                f_lenImage = true;
                _lenImage = (int) (Superblock.NodeHeader.LebSize * Superblock.NodeHeader.NumLebs);
                return _lenImage;
            }
        }
        private bool f_master1;
        private MasterblockNode _master1;

        /// <summary>
        /// The first copy of the master node in LEB1. This Kaitai Struct
        /// implementation uses it to locate `index_root`. In an image created by
        /// `mkfs.ubifs`, it is the only copy in LEB1.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://github.com/sigma-star/mtd-utils/blob/053ee1038e5dedae61a88cadfb7bdfe9894d8bb6/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c#L2627-L2633">Git tag "v2.3.1"</a>
        /// </remarks>
        public MasterblockNode Master1
        {
            get
            {
                if (f_master1)
                    return _master1;
                f_master1 = true;
                long _pos = m_io.Pos;
                m_io.Seek(Superblock.NodeHeader.LebSize);
                __raw_master1 = m_io.ReadBytes(Superblock.NodeHeader.LebSize);
                var io___raw_master1 = new KaitaiStream(__raw_master1);
                _master1 = new MasterblockNode(io___raw_master1, this, m_root);
                m_io.Seek(_pos);
                return _master1;
            }
        }
        private bool f_master2;
        private MasterblockNode _master2;

        /// <summary>
        /// The first copy of the master node in LEB2. In an image created by
        /// `mkfs.ubifs`, it is the same as `master_1` except for the sequence
        /// number and CRC in the common header. Linux keeps the master node in both
        /// LEB1 and LEB2 for redundancy, and when mounting, it checks that the
        /// copies in both match.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://github.com/sigma-star/mtd-utils/blob/053ee1038e5dedae61a88cadfb7bdfe9894d8bb6/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c#L2627-L2633">Git tag "v2.3.1"</a>
        /// </remarks>
        /// <remarks>
        /// Reference: <a href="https://github.com/torvalds/linux/blob/8d3ae59288f1e7d58d76558a6ee96d533bc5019f/fs/ubifs/master.c#L115-L130">Git tag "v7.2"</a>
        /// </remarks>
        public MasterblockNode Master2
        {
            get
            {
                if (f_master2)
                    return _master2;
                f_master2 = true;
                long _pos = m_io.Pos;
                m_io.Seek(Superblock.NodeHeader.LebSize * 2);
                __raw_master2 = m_io.ReadBytes(Superblock.NodeHeader.LebSize);
                var io___raw_master2 = new KaitaiStream(__raw_master2);
                _master2 = new MasterblockNode(io___raw_master2, this, m_root);
                m_io.Seek(_pos);
                return _master2;
            }
        }
        private bool f_superblock;
        private SuperblockNode _superblock;

        /// <summary>
        /// The superblock node will always be at the start of
        /// the first LEB.
        /// </summary>
        public SuperblockNode Superblock
        {
            get
            {
                if (f_superblock)
                    return _superblock;
                f_superblock = true;
                long _pos = m_io.Pos;
                m_io.Seek(0);
                _superblock = new SuperblockNode(m_io, this, m_root);
                m_io.Seek(_pos);
                return _superblock;
            }
        }
        private Ubifs m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_index;
        private byte[] __raw_master1;
        private byte[] __raw_master2;
        public Ubifs M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawIndex { get { return __raw_index; } }
        public byte[] M_RawMaster1 { get { return __raw_master1; } }
        public byte[] M_RawMaster2 { get { return __raw_master2; } }
    }
}

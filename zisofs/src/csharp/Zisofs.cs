// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// zisofs is a compression format for files on ISO9660 file system. It has
    /// limited support across operating systems, mainly Linux kernel. Typically a
    /// directory tree is first preprocessed by mkzftree (from the zisofs-tools
    /// package before being turned into an ISO9660 image by mkisofs, genisoimage
    /// or similar tool. The data is zlib compressed.
    /// 
    /// The specification here describes the structure of a file that has been
    /// preprocessed by mkzftree, not of a full ISO9660 ziso. Data is not
    /// decompressed, as blocks with length 0 have a special meaning. Decompression
    /// and deconstruction of this data should be done outside of Kaitai Struct.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://web.archive.org/web/20200612093441/https://dev.lovelyhq.com/libburnia/web/-/wikis/zisofs">Source</a>
    /// </remarks>
    public partial class Zisofs : KaitaiStruct
    {
        public static Zisofs FromFile(string fileName)
        {
            return new Zisofs(new KaitaiStream(fileName));
        }

        public Zisofs(KaitaiStream p__io, KaitaiStruct p__parent = null, Zisofs p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_blocks = false;
            _read();
        }
        private void _read()
        {
            __raw_header = m_io.ReadBytes(16);
            var io___raw_header = new KaitaiStream(__raw_header);
            _header = new Header(io___raw_header, this, m_root);
            _blockPointers = new List<uint>((int) ((Header.NumBlocks + 1)));
            for (var i = 0; i < (Header.NumBlocks + 1); i++)
            {
                _blockPointers.Add(m_io.ReadU4le());
            }
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream p__io, Zisofs p__parent = null, Zisofs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_blockSize = false;
                f_numBlocks = false;
                _read();
            }
            private void _read()
            {
                _magic = m_io.ReadBytes(8);
                if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 55, 228, 83, 150, 201, 219, 214, 7 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 55, 228, 83, 150, 201, 219, 214, 7 }, Magic, M_Io, "/types/header/seq/0");
                }
                _uncompressedSize = m_io.ReadU4le();
                _lenHeader = m_io.ReadU1();
                if (!(LenHeader == 4))
                {
                    throw new ValidationNotEqualError(4, LenHeader, M_Io, "/types/header/seq/2");
                }
                _blockSizeLog2 = m_io.ReadU1();
                if (!( ((BlockSizeLog2 == 15) || (BlockSizeLog2 == 16) || (BlockSizeLog2 == 17)) ))
                {
                    throw new ValidationNotAnyOfError(BlockSizeLog2, M_Io, "/types/header/seq/3");
                }
                _reserved = m_io.ReadBytes(2);
                if (!((KaitaiStream.ByteArrayCompare(Reserved, new byte[] { 0, 0 }) == 0)))
                {
                    throw new ValidationNotEqualError(new byte[] { 0, 0 }, Reserved, M_Io, "/types/header/seq/4");
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
                    _blockSize = (int) ((1 << BlockSizeLog2));
                    f_blockSize = true;
                    return _blockSize;
                }
            }
            private bool f_numBlocks;
            private int _numBlocks;

            /// <summary>
            /// ceil(uncompressed_size / block_size)
            /// </summary>
            public int NumBlocks
            {
                get
                {
                    if (f_numBlocks)
                        return _numBlocks;
                    _numBlocks = (int) (((UncompressedSize / BlockSize) + (KaitaiStream.Mod(UncompressedSize, BlockSize) != 0 ? 1 : 0)));
                    f_numBlocks = true;
                    return _numBlocks;
                }
            }
            private byte[] _magic;
            private uint _uncompressedSize;
            private byte _lenHeader;
            private byte _blockSizeLog2;
            private byte[] _reserved;
            private Zisofs m_root;
            private Zisofs m_parent;
            public byte[] Magic { get { return _magic; } }

            /// <summary>
            /// Size of the original uncompressed file
            /// </summary>
            public uint UncompressedSize { get { return _uncompressedSize; } }

            /// <summary>
            /// header_size &gt;&gt; 2 (currently 4)
            /// </summary>
            public byte LenHeader { get { return _lenHeader; } }
            public byte BlockSizeLog2 { get { return _blockSizeLog2; } }
            public byte[] Reserved { get { return _reserved; } }
            public Zisofs M_Root { get { return m_root; } }
            public Zisofs M_Parent { get { return m_parent; } }
        }
        public partial class Block : KaitaiStruct
        {
            public Block(uint p_ofsStart, uint p_ofsEnd, KaitaiStream p__io, Zisofs p__parent = null, Zisofs p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _ofsStart = p_ofsStart;
                _ofsEnd = p_ofsEnd;
                f_lenData = false;
                f_data = false;
                _read();
            }
            private void _read()
            {
            }
            private bool f_lenData;
            private int _lenData;
            public int LenData
            {
                get
                {
                    if (f_lenData)
                        return _lenData;
                    _lenData = (int) ((OfsEnd - OfsStart));
                    f_lenData = true;
                    return _lenData;
                }
            }
            private bool f_data;
            private byte[] _data;
            public byte[] Data
            {
                get
                {
                    if (f_data)
                        return _data;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek(OfsStart);
                    _data = io.ReadBytes(LenData);
                    io.Seek(_pos);
                    f_data = true;
                    return _data;
                }
            }
            private uint _ofsStart;
            private uint _ofsEnd;
            private Zisofs m_root;
            private Zisofs m_parent;
            public uint OfsStart { get { return _ofsStart; } }
            public uint OfsEnd { get { return _ofsEnd; } }
            public Zisofs M_Root { get { return m_root; } }
            public Zisofs M_Parent { get { return m_parent; } }
        }
        private bool f_blocks;
        private List<Block> _blocks;
        public List<Block> Blocks
        {
            get
            {
                if (f_blocks)
                    return _blocks;
                _blocks = new List<Block>((int) (Header.NumBlocks));
                for (var i = 0; i < Header.NumBlocks; i++)
                {
                    _blocks.Add(new Block(BlockPointers[i], BlockPointers[(i + 1)], m_io, this, m_root));
                }
                f_blocks = true;
                return _blocks;
            }
        }
        private Header _header;
        private List<uint> _blockPointers;
        private Zisofs m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_header;
        public Header Header { get { return _header; } }

        /// <summary>
        /// The final pointer (`block_pointers[header.num_blocks]`) indicates the end
        /// of the last block. Typically this is also the end of the file data.
        /// </summary>
        public List<uint> BlockPointers { get { return _blockPointers; } }
        public Zisofs M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawHeader { get { return __raw_header; } }
    }
}

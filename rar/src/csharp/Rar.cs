// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// RAR is a archive format used by popular proprietary RAR archiver,
    /// created by Eugene Roshal. There are two major versions of format
    /// (v1.5-4.0 and RAR v5+).
    /// 
    /// File format essentially consists of a linear sequence of
    /// blocks. Each block has fixed header and custom body (that depends on
    /// block type), so it's possible to skip block even if one doesn't know
    /// how to process a certain block type.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="http://acritum.com/winrar/rar-format"></a>
    /// </remarks>
    public partial class Rar : KaitaiStruct
    {
        public static Rar FromFile(string fileName)
        {
            return new Rar(new KaitaiStream(fileName));
        }


        public enum BlockTypes
        {
            Marker = 114,
            ArchiveHeader = 115,
            FileHeader = 116,
            OldStyleCommentHeader = 117,
            OldStyleAuthenticityInfo76 = 118,
            OldStyleSubblock = 119,
            OldStyleRecoveryRecord = 120,
            OldStyleAuthenticityInfo79 = 121,
            Subblock = 122,
            Terminator = 123,
        }

        public enum Oses
        {
            MsDos = 0,
            Os2 = 1,
            Windows = 2,
            Unix = 3,
            MacOs = 4,
            Beos = 5,
        }

        public enum Methods
        {
            Store = 48,
            Fastest = 49,
            Fast = 50,
            Normal = 51,
            Good = 52,
            Best = 53,
        }
        public Rar(KaitaiStream p__io, KaitaiStruct p__parent = null, Rar p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _magic = new MagicSignature(m_io, this, m_root);
            _blocks = new List<KaitaiStruct>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    switch (Magic.Version) {
                    case 0: {
                        _blocks.Add(new Block(m_io, this, m_root));
                        break;
                    }
                    case 1: {
                        _blocks.Add(new BlockV5(m_io, this, m_root));
                        break;
                    }
                    }
                    i++;
                }
            }
        }
        public partial class BlockV5 : KaitaiStruct
        {
            public static BlockV5 FromFile(string fileName)
            {
                return new BlockV5(new KaitaiStream(fileName));
            }

            public BlockV5(KaitaiStream p__io, Rar p__parent = null, Rar p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
            }
            private Rar m_root;
            private Rar m_parent;
            public Rar M_Root { get { return m_root; } }
            public Rar M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Basic block that RAR files consist of. There are several block
        /// types (see `block_type`), which have different `body` and
        /// `add_body`.
        /// </summary>
        public partial class Block : KaitaiStruct
        {
            public static Block FromFile(string fileName)
            {
                return new Block(new KaitaiStream(fileName));
            }

            public Block(KaitaiStream p__io, Rar p__parent = null, Rar p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_hasAdd = false;
                f_headerSize = false;
                f_bodySize = false;
                _read();
            }
            private void _read()
            {
                _crc16 = m_io.ReadU2le();
                _blockType = ((Rar.BlockTypes) m_io.ReadU1());
                _flags = m_io.ReadU2le();
                _blockSize = m_io.ReadU2le();
                if (HasAdd) {
                    _addSize = m_io.ReadU4le();
                }
                switch (BlockType) {
                case Rar.BlockTypes.FileHeader: {
                    __raw_body = m_io.ReadBytes(BodySize);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new BlockFileHeader(io___raw_body, this, m_root);
                    break;
                }
                default: {
                    _body = m_io.ReadBytes(BodySize);
                    break;
                }
                }
                if (HasAdd) {
                    _addBody = m_io.ReadBytes(AddSize);
                }
            }
            private bool f_hasAdd;
            private bool _hasAdd;

            /// <summary>
            /// True if block has additional content attached to it
            /// </summary>
            public bool HasAdd
            {
                get
                {
                    if (f_hasAdd)
                        return _hasAdd;
                    _hasAdd = (bool) ((Flags & 32768) != 0);
                    f_hasAdd = true;
                    return _hasAdd;
                }
            }
            private bool f_headerSize;
            private sbyte _headerSize;
            public sbyte HeaderSize
            {
                get
                {
                    if (f_headerSize)
                        return _headerSize;
                    _headerSize = (sbyte) ((HasAdd ? 11 : 7));
                    f_headerSize = true;
                    return _headerSize;
                }
            }
            private bool f_bodySize;
            private int _bodySize;
            public int BodySize
            {
                get
                {
                    if (f_bodySize)
                        return _bodySize;
                    _bodySize = (int) ((BlockSize - HeaderSize));
                    f_bodySize = true;
                    return _bodySize;
                }
            }
            private ushort _crc16;
            private BlockTypes _blockType;
            private ushort _flags;
            private ushort _blockSize;
            private uint? _addSize;
            private object _body;
            private byte[] _addBody;
            private Rar m_root;
            private Rar m_parent;
            private byte[] __raw_body;

            /// <summary>
            /// CRC16 of whole block or some part of it (depends on block type)
            /// </summary>
            public ushort Crc16 { get { return _crc16; } }
            public BlockTypes BlockType { get { return _blockType; } }
            public ushort Flags { get { return _flags; } }

            /// <summary>
            /// Size of block (header + body, but without additional content)
            /// </summary>
            public ushort BlockSize { get { return _blockSize; } }

            /// <summary>
            /// Size of additional content in this block
            /// </summary>
            public uint? AddSize { get { return _addSize; } }
            public object Body { get { return _body; } }

            /// <summary>
            /// Additional content in this block
            /// </summary>
            public byte[] AddBody { get { return _addBody; } }
            public Rar M_Root { get { return m_root; } }
            public Rar M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }
        public partial class BlockFileHeader : KaitaiStruct
        {
            public static BlockFileHeader FromFile(string fileName)
            {
                return new BlockFileHeader(new KaitaiStream(fileName));
            }

            public BlockFileHeader(KaitaiStream p__io, Rar.Block p__parent = null, Rar p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lowUnpSize = m_io.ReadU4le();
                _hostOs = ((Rar.Oses) m_io.ReadU1());
                _fileCrc32 = m_io.ReadU4le();
                _fileTime = new DosTime(m_io, this, m_root);
                _rarVersion = m_io.ReadU1();
                _method = ((Rar.Methods) m_io.ReadU1());
                _nameSize = m_io.ReadU2le();
                _attr = m_io.ReadU4le();
                if ((M_Parent.Flags & 256) != 0) {
                    _highPackSize = m_io.ReadU4le();
                }
                _fileName = m_io.ReadBytes(NameSize);
                if ((M_Parent.Flags & 1024) != 0) {
                    _salt = m_io.ReadU8le();
                }
            }
            private uint _lowUnpSize;
            private Oses _hostOs;
            private uint _fileCrc32;
            private DosTime _fileTime;
            private byte _rarVersion;
            private Methods _method;
            private ushort _nameSize;
            private uint _attr;
            private uint? _highPackSize;
            private byte[] _fileName;
            private ulong? _salt;
            private Rar m_root;
            private Rar.Block m_parent;

            /// <summary>
            /// Uncompressed file size (lower 32 bits, if 64-bit header flag is present)
            /// </summary>
            public uint LowUnpSize { get { return _lowUnpSize; } }

            /// <summary>
            /// Operating system used for archiving
            /// </summary>
            public Oses HostOs { get { return _hostOs; } }
            public uint FileCrc32 { get { return _fileCrc32; } }

            /// <summary>
            /// Date and time in standard MS DOS format
            /// </summary>
            public DosTime FileTime { get { return _fileTime; } }

            /// <summary>
            /// RAR version needed to extract file (Version number is encoded as 10 * Major version + minor version.)
            /// </summary>
            public byte RarVersion { get { return _rarVersion; } }

            /// <summary>
            /// Compression method
            /// </summary>
            public Methods Method { get { return _method; } }

            /// <summary>
            /// File name size
            /// </summary>
            public ushort NameSize { get { return _nameSize; } }

            /// <summary>
            /// File attributes
            /// </summary>
            public uint Attr { get { return _attr; } }

            /// <summary>
            /// Compressed file size, high 32 bits, only if 64-bit header flag is present
            /// </summary>
            public uint? HighPackSize { get { return _highPackSize; } }
            public byte[] FileName { get { return _fileName; } }
            public ulong? Salt { get { return _salt; } }
            public Rar M_Root { get { return m_root; } }
            public Rar.Block M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// RAR uses either 7-byte magic for RAR versions 1.5 to 4.0, and
        /// 8-byte magic (and pretty different block format) for v5+. This
        /// type would parse and validate both versions of signature. Note
        /// that actually this signature is a valid RAR &quot;block&quot;: in theory,
        /// one can omit signature reading at all, and read this normally,
        /// as a block, if exact RAR version is known (and thus it's
        /// possible to choose correct block format).
        /// </summary>
        public partial class MagicSignature : KaitaiStruct
        {
            public static MagicSignature FromFile(string fileName)
            {
                return new MagicSignature(new KaitaiStream(fileName));
            }

            public MagicSignature(KaitaiStream p__io, Rar p__parent = null, Rar p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic1 = m_io.EnsureFixedContents(new byte[] { 82, 97, 114, 33, 26, 7 });
                _version = m_io.ReadU1();
                if (Version == 1) {
                    _magic3 = m_io.EnsureFixedContents(new byte[] { 0 });
                }
            }
            private byte[] _magic1;
            private byte _version;
            private byte[] _magic3;
            private Rar m_root;
            private Rar m_parent;

            /// <summary>
            /// Fixed part of file's magic signature that doesn't change with RAR version
            /// </summary>
            public byte[] Magic1 { get { return _magic1; } }

            /// <summary>
            /// Variable part of magic signature: 0 means old (RAR 1.5-4.0)
            /// format, 1 means new (RAR 5+) format
            /// </summary>
            public byte Version { get { return _version; } }

            /// <summary>
            /// New format (RAR 5+) magic contains extra byte
            /// </summary>
            public byte[] Magic3 { get { return _magic3; } }
            public Rar M_Root { get { return m_root; } }
            public Rar M_Parent { get { return m_parent; } }
        }
        public partial class DosTime : KaitaiStruct
        {
            public static DosTime FromFile(string fileName)
            {
                return new DosTime(new KaitaiStream(fileName));
            }

            public DosTime(KaitaiStream p__io, Rar.BlockFileHeader p__parent = null, Rar p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_month = false;
                f_seconds = false;
                f_year = false;
                f_minutes = false;
                f_day = false;
                f_hours = false;
                _read();
            }
            private void _read()
            {
                _time = m_io.ReadU2le();
                _date = m_io.ReadU2le();
            }
            private bool f_month;
            private int _month;
            public int Month
            {
                get
                {
                    if (f_month)
                        return _month;
                    _month = (int) (((Date & 480) >> 5));
                    f_month = true;
                    return _month;
                }
            }
            private bool f_seconds;
            private int _seconds;
            public int Seconds
            {
                get
                {
                    if (f_seconds)
                        return _seconds;
                    _seconds = (int) (((Time & 31) * 2));
                    f_seconds = true;
                    return _seconds;
                }
            }
            private bool f_year;
            private int _year;
            public int Year
            {
                get
                {
                    if (f_year)
                        return _year;
                    _year = (int) ((((Date & 65024) >> 9) + 1980));
                    f_year = true;
                    return _year;
                }
            }
            private bool f_minutes;
            private int _minutes;
            public int Minutes
            {
                get
                {
                    if (f_minutes)
                        return _minutes;
                    _minutes = (int) (((Time & 2016) >> 5));
                    f_minutes = true;
                    return _minutes;
                }
            }
            private bool f_day;
            private int _day;
            public int Day
            {
                get
                {
                    if (f_day)
                        return _day;
                    _day = (int) ((Date & 31));
                    f_day = true;
                    return _day;
                }
            }
            private bool f_hours;
            private int _hours;
            public int Hours
            {
                get
                {
                    if (f_hours)
                        return _hours;
                    _hours = (int) (((Time & 63488) >> 11));
                    f_hours = true;
                    return _hours;
                }
            }
            private ushort _time;
            private ushort _date;
            private Rar m_root;
            private Rar.BlockFileHeader m_parent;
            public ushort Time { get { return _time; } }
            public ushort Date { get { return _date; } }
            public Rar M_Root { get { return m_root; } }
            public Rar.BlockFileHeader M_Parent { get { return m_parent; } }
        }
        private MagicSignature _magic;
        private List<KaitaiStruct> _blocks;
        private Rar m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// File format signature to validate that it is indeed a RAR archive
        /// </summary>
        public MagicSignature Magic { get { return _magic; } }

        /// <summary>
        /// Sequence of blocks that constitute the RAR file
        /// </summary>
        public List<KaitaiStruct> Blocks { get { return _blocks; } }
        public Rar M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

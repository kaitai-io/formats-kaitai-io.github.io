// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// InfluxDB is a scalable database optimized for storage of time
    /// series, real-time application metrics, operations monitoring events,
    /// etc, written in Go.
    /// 
    /// Data is stored in .tsm files, which are kept pretty simple
    /// conceptually. Each .tsm file contains a header and footer, which
    /// stores offset to an index. Index is used to find a data block for a
    /// requested time boundary.
    /// </summary>
    public partial class Tsm : KaitaiStruct
    {
        public static Tsm FromFile(string fileName)
        {
            return new Tsm(new KaitaiStream(fileName));
        }

        public Tsm(KaitaiStream io, KaitaiStruct parent = null, Tsm root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            f_index = false;
            _read();
        }
        private void _read() {
            _header = new Header(m_io, this, m_root);
            }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream io, Tsm parent = null, Tsm root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _magic = m_io.EnsureFixedContents(new byte[] { 22, 209, 22, 209 });
                _version = m_io.ReadU1();
                }
            private byte[] _magic;
            private byte _version;
            private Tsm m_root;
            private Tsm m_parent;
            public byte[] Magic { get { return _magic; } }
            public byte Version { get { return _version; } }
            public Tsm M_Root { get { return m_root; } }
            public Tsm M_Parent { get { return m_parent; } }
        }
        public partial class Index : KaitaiStruct
        {
            public static Index FromFile(string fileName)
            {
                return new Index(new KaitaiStream(fileName));
            }

            public Index(KaitaiStream io, Tsm parent = null, Tsm root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                f_entries = false;
                _read();
            }
            private void _read() {
                _offset = m_io.ReadU8be();
                }
            public partial class IndexHeader : KaitaiStruct
            {
                public static IndexHeader FromFile(string fileName)
                {
                    return new IndexHeader(new KaitaiStream(fileName));
                }

                public IndexHeader(KaitaiStream io, Tsm.Index parent = null, Tsm root = null) : base(io)
                {
                    m_parent = parent;
                    m_root = root;
                    _read();
                }
                private void _read() {
                    _keyLen = m_io.ReadU2be();
                    _key = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(KeyLen));
                    _type = m_io.ReadU1();
                    _entryCount = m_io.ReadU2be();
                    _indexEntries = new List<IndexEntry>((int) (EntryCount));
                    for (var i = 0; i < EntryCount; i++) {
                        _indexEntries.Add(new IndexEntry(m_io, this, m_root));
                    }
                    }
                public partial class IndexEntry : KaitaiStruct
                {
                    public static IndexEntry FromFile(string fileName)
                    {
                        return new IndexEntry(new KaitaiStream(fileName));
                    }

                    public IndexEntry(KaitaiStream io, Tsm.Index.IndexHeader parent = null, Tsm root = null) : base(io)
                    {
                        m_parent = parent;
                        m_root = root;
                        f_block = false;
                        _read();
                    }
                    private void _read() {
                        _minTime = m_io.ReadU8be();
                        _maxTime = m_io.ReadU8be();
                        _blockOffset = m_io.ReadU8be();
                        _blockSize = m_io.ReadU4be();
                        }
                    public partial class BlockEntry : KaitaiStruct
                    {
                        public static BlockEntry FromFile(string fileName)
                        {
                            return new BlockEntry(new KaitaiStream(fileName));
                        }

                        public BlockEntry(KaitaiStream io, Tsm.Index.IndexHeader.IndexEntry parent = null, Tsm root = null) : base(io)
                        {
                            m_parent = parent;
                            m_root = root;
                            _read();
                        }
                        private void _read() {
                            _crc32 = m_io.ReadU4be();
                            _data = m_io.ReadBytes((M_Parent.BlockSize - 4));
                            }
                        private uint _crc32;
                        private byte[] _data;
                        private Tsm m_root;
                        private Tsm.Index.IndexHeader.IndexEntry m_parent;
                        public uint Crc32 { get { return _crc32; } }
                        public byte[] Data { get { return _data; } }
                        public Tsm M_Root { get { return m_root; } }
                        public Tsm.Index.IndexHeader.IndexEntry M_Parent { get { return m_parent; } }
                    }
                    private bool f_block;
                    private BlockEntry _block;
                    public BlockEntry Block
                    {
                        get
                        {
                            if (f_block)
                                return _block;
                            KaitaiStream io = M_Root.M_Io;
                            long _pos = io.Pos;
                            io.Seek(BlockOffset);
                            _block = new BlockEntry(io, this, m_root);
                            io.Seek(_pos);
                            f_block = true;
                            return _block;
                        }
                    }
                    private ulong _minTime;
                    private ulong _maxTime;
                    private ulong _blockOffset;
                    private uint _blockSize;
                    private Tsm m_root;
                    private Tsm.Index.IndexHeader m_parent;
                    public ulong MinTime { get { return _minTime; } }
                    public ulong MaxTime { get { return _maxTime; } }
                    public ulong BlockOffset { get { return _blockOffset; } }
                    public uint BlockSize { get { return _blockSize; } }
                    public Tsm M_Root { get { return m_root; } }
                    public Tsm.Index.IndexHeader M_Parent { get { return m_parent; } }
                }
                private ushort _keyLen;
                private string _key;
                private byte _type;
                private ushort _entryCount;
                private List<IndexEntry> _indexEntries;
                private Tsm m_root;
                private Tsm.Index m_parent;
                public ushort KeyLen { get { return _keyLen; } }
                public string Key { get { return _key; } }
                public byte Type { get { return _type; } }
                public ushort EntryCount { get { return _entryCount; } }
                public List<IndexEntry> IndexEntries { get { return _indexEntries; } }
                public Tsm M_Root { get { return m_root; } }
                public Tsm.Index M_Parent { get { return m_parent; } }
            }
            private bool f_entries;
            private List<IndexHeader> _entries;
            public List<IndexHeader> Entries
            {
                get
                {
                    if (f_entries)
                        return _entries;
                    long _pos = m_io.Pos;
                    m_io.Seek(Offset);
                    _entries = new List<IndexHeader>();
                    {
                        IndexHeader M_;
                        do {
                            M_ = new IndexHeader(m_io, this, m_root);
                            _entries.Add(M_);
                        } while (!(M_Io.Pos == (M_Io.Size - 8)));
                    }
                    m_io.Seek(_pos);
                    f_entries = true;
                    return _entries;
                }
            }
            private ulong _offset;
            private Tsm m_root;
            private Tsm m_parent;
            public ulong Offset { get { return _offset; } }
            public Tsm M_Root { get { return m_root; } }
            public Tsm M_Parent { get { return m_parent; } }
        }
        private bool f_index;
        private Index _index;
        public Index Index
        {
            get
            {
                if (f_index)
                    return _index;
                long _pos = m_io.Pos;
                m_io.Seek((M_Io.Size - 8));
                _index = new Index(m_io, this, m_root);
                m_io.Seek(_pos);
                f_index = true;
                return _index;
            }
        }
        private Header _header;
        private Tsm m_root;
        private KaitaiStruct m_parent;
        public Header Header { get { return _header; } }
        public Tsm M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

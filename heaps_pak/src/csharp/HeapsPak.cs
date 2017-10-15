// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Reader.hx">Source</a>
    /// </remarks>
    public partial class HeapsPak : KaitaiStruct
    {
        public static HeapsPak FromFile(string fileName)
        {
            return new HeapsPak(new KaitaiStream(fileName));
        }

        public HeapsPak(KaitaiStream p__io, KaitaiStruct p__parent = null, HeapsPak p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
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

            public Header(KaitaiStream p__io, HeapsPak p__parent = null, HeapsPak p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic1 = m_io.EnsureFixedContents(new byte[] { 80, 65, 75 });
                _version = m_io.ReadU1();
                _lenHeader = m_io.ReadU4le();
                _lenData = m_io.ReadU4le();
                __raw_rootEntry = m_io.ReadBytes((LenHeader - 16));
                var io___raw_rootEntry = new KaitaiStream(__raw_rootEntry);
                _rootEntry = new Entry(io___raw_rootEntry, this, m_root);
                _magic2 = m_io.EnsureFixedContents(new byte[] { 68, 65, 84, 65 });
            }

            /// <remarks>
            /// Reference: <a href="https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Data.hx">Source</a>
            /// </remarks>
            public partial class Entry : KaitaiStruct
            {
                public static Entry FromFile(string fileName)
                {
                    return new Entry(new KaitaiStream(fileName));
                }

                public Entry(KaitaiStream p__io, KaitaiStruct p__parent = null, HeapsPak p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _lenName = m_io.ReadU1();
                    _name = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytes(LenName));
                    _flags = new Flags(m_io, this, m_root);
                    {
                        bool on = Flags.IsDir;
                        if (on == true)
                        {
                            _body = new Dir(m_io, this, m_root);
                        }
                        else if (on == false)
                        {
                            _body = new File(m_io, this, m_root);
                        }
                    }
                }
                public partial class Flags : KaitaiStruct
                {
                    public static Flags FromFile(string fileName)
                    {
                        return new Flags(new KaitaiStream(fileName));
                    }

                    public Flags(KaitaiStream p__io, HeapsPak.Header.Entry p__parent = null, HeapsPak p__root = null) : base(p__io)
                    {
                        m_parent = p__parent;
                        m_root = p__root;
                        _read();
                    }
                    private void _read()
                    {
                        _unused = m_io.ReadBitsInt(7);
                        _isDir = m_io.ReadBitsInt(1) != 0;
                    }
                    private ulong _unused;
                    private bool _isDir;
                    private HeapsPak m_root;
                    private HeapsPak.Header.Entry m_parent;
                    public ulong Unused { get { return _unused; } }
                    public bool IsDir { get { return _isDir; } }
                    public HeapsPak M_Root { get { return m_root; } }
                    public HeapsPak.Header.Entry M_Parent { get { return m_parent; } }
                }
                private byte _lenName;
                private string _name;
                private Flags _flags;
                private KaitaiStruct _body;
                private HeapsPak m_root;
                private KaitaiStruct m_parent;
                public byte LenName { get { return _lenName; } }
                public string Name { get { return _name; } }
                public Flags Flags { get { return _flags; } }
                public KaitaiStruct Body { get { return _body; } }
                public HeapsPak M_Root { get { return m_root; } }
                public KaitaiStruct M_Parent { get { return m_parent; } }
            }
            public partial class File : KaitaiStruct
            {
                public static File FromFile(string fileName)
                {
                    return new File(new KaitaiStream(fileName));
                }

                public File(KaitaiStream p__io, HeapsPak.Header.Entry p__parent = null, HeapsPak p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    f_data = false;
                    _read();
                }
                private void _read()
                {
                    _ofsData = m_io.ReadU4le();
                    _lenData = m_io.ReadU4le();
                    _checksum = m_io.ReadBytes(4);
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
                        io.Seek((M_Root.Header.LenHeader + OfsData));
                        _data = io.ReadBytes(LenData);
                        io.Seek(_pos);
                        f_data = true;
                        return _data;
                    }
                }
                private uint _ofsData;
                private uint _lenData;
                private byte[] _checksum;
                private HeapsPak m_root;
                private HeapsPak.Header.Entry m_parent;
                public uint OfsData { get { return _ofsData; } }
                public uint LenData { get { return _lenData; } }
                public byte[] Checksum { get { return _checksum; } }
                public HeapsPak M_Root { get { return m_root; } }
                public HeapsPak.Header.Entry M_Parent { get { return m_parent; } }
            }
            public partial class Dir : KaitaiStruct
            {
                public static Dir FromFile(string fileName)
                {
                    return new Dir(new KaitaiStream(fileName));
                }

                public Dir(KaitaiStream p__io, HeapsPak.Header.Entry p__parent = null, HeapsPak p__root = null) : base(p__io)
                {
                    m_parent = p__parent;
                    m_root = p__root;
                    _read();
                }
                private void _read()
                {
                    _numEntries = m_io.ReadU4le();
                    _entries = new List<Entry>((int) (NumEntries));
                    for (var i = 0; i < NumEntries; i++)
                    {
                        _entries.Add(new Entry(m_io, this, m_root));
                    }
                }
                private uint _numEntries;
                private List<Entry> _entries;
                private HeapsPak m_root;
                private HeapsPak.Header.Entry m_parent;
                public uint NumEntries { get { return _numEntries; } }
                public List<Entry> Entries { get { return _entries; } }
                public HeapsPak M_Root { get { return m_root; } }
                public HeapsPak.Header.Entry M_Parent { get { return m_parent; } }
            }
            private byte[] _magic1;
            private byte _version;
            private uint _lenHeader;
            private uint _lenData;
            private Entry _rootEntry;
            private byte[] _magic2;
            private HeapsPak m_root;
            private HeapsPak m_parent;
            private byte[] __raw_rootEntry;
            public byte[] Magic1 { get { return _magic1; } }
            public byte Version { get { return _version; } }
            public uint LenHeader { get { return _lenHeader; } }
            public uint LenData { get { return _lenData; } }
            public Entry RootEntry { get { return _rootEntry; } }
            public byte[] Magic2 { get { return _magic2; } }
            public HeapsPak M_Root { get { return m_root; } }
            public HeapsPak M_Parent { get { return m_parent; } }
            public byte[] M_RawRootEntry { get { return __raw_rootEntry; } }
        }
        private Header _header;
        private HeapsPak m_root;
        private KaitaiStruct m_parent;
        public Header Header { get { return _header; } }
        public HeapsPak M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

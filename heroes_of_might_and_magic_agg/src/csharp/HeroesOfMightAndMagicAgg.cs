// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class HeroesOfMightAndMagicAgg : KaitaiStruct
    {
        public static HeroesOfMightAndMagicAgg FromFile(string fileName)
        {
            return new HeroesOfMightAndMagicAgg(new KaitaiStream(fileName));
        }

        public HeroesOfMightAndMagicAgg(KaitaiStream io, KaitaiStruct parent = null, HeroesOfMightAndMagicAgg root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            f_filenames = false;
            _read();
        }
        private void _read() {
            _numFiles = m_io.ReadU2le();
            _entries = new List<Entry>((int) (NumFiles));
            for (var i = 0; i < NumFiles; i++) {
                _entries.Add(new Entry(m_io, this, m_root));
            }
            }
        public partial class Entry : KaitaiStruct
        {
            public static Entry FromFile(string fileName)
            {
                return new Entry(new KaitaiStream(fileName));
            }

            public Entry(KaitaiStream io, HeroesOfMightAndMagicAgg parent = null, HeroesOfMightAndMagicAgg root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                f_body = false;
                _read();
            }
            private void _read() {
                _hash = m_io.ReadU2le();
                _offset = m_io.ReadU4le();
                _size = m_io.ReadU4le();
                _size2 = m_io.ReadU4le();
                }
            private bool f_body;
            private byte[] _body;
            public byte[] Body
            {
                get
                {
                    if (f_body)
                        return _body;
                    long _pos = m_io.Pos;
                    m_io.Seek(Offset);
                    _body = m_io.ReadBytes(Size);
                    m_io.Seek(_pos);
                    f_body = true;
                    return _body;
                }
            }
            private ushort _hash;
            private uint _offset;
            private uint _size;
            private uint _size2;
            private HeroesOfMightAndMagicAgg m_root;
            private HeroesOfMightAndMagicAgg m_parent;
            public ushort Hash { get { return _hash; } }
            public uint Offset { get { return _offset; } }
            public uint Size { get { return _size; } }
            public uint Size2 { get { return _size2; } }
            public HeroesOfMightAndMagicAgg M_Root { get { return m_root; } }
            public HeroesOfMightAndMagicAgg M_Parent { get { return m_parent; } }
        }
        public partial class Filename : KaitaiStruct
        {
            public static Filename FromFile(string fileName)
            {
                return new Filename(new KaitaiStream(fileName));
            }

            public Filename(KaitaiStream io, HeroesOfMightAndMagicAgg parent = null, HeroesOfMightAndMagicAgg root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _str = System.Text.Encoding.GetEncoding("ASCII").GetString(m_io.ReadBytesTerm(0, false, true, true));
                }
            private string _str;
            private HeroesOfMightAndMagicAgg m_root;
            private HeroesOfMightAndMagicAgg m_parent;
            public string Str { get { return _str; } }
            public HeroesOfMightAndMagicAgg M_Root { get { return m_root; } }
            public HeroesOfMightAndMagicAgg M_Parent { get { return m_parent; } }
        }
        private bool f_filenames;
        private List<Filename> _filenames;
        public List<Filename> Filenames
        {
            get
            {
                if (f_filenames)
                    return _filenames;
                long _pos = m_io.Pos;
                m_io.Seek((Entries[Entries.Count - 1].Offset + Entries[Entries.Count - 1].Size));
                __raw_filenames = new List<byte[]>((int) (NumFiles));
                _filenames = new List<Filename>((int) (NumFiles));
                for (var i = 0; i < NumFiles; i++) {
                    __raw_filenames.Add(m_io.ReadBytes(15));
                    var io___raw_filenames = new KaitaiStream(__raw_filenames[__raw_filenames.Count - 1]);
                    _filenames.Add(new Filename(io___raw_filenames, this, m_root));
                }
                m_io.Seek(_pos);
                f_filenames = true;
                return _filenames;
            }
        }
        private ushort _numFiles;
        private List<Entry> _entries;
        private HeroesOfMightAndMagicAgg m_root;
        private KaitaiStruct m_parent;
        private List<byte[]> __raw_filenames;
        public ushort NumFiles { get { return _numFiles; } }
        public List<Entry> Entries { get { return _entries; } }
        public HeroesOfMightAndMagicAgg M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public List<byte[]> M_RawFilenames { get { return __raw_filenames; } }
    }
}

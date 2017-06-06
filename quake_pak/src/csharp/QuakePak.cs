// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class QuakePak : KaitaiStruct
    {
        public static QuakePak FromFile(string fileName)
        {
            return new QuakePak(new KaitaiStream(fileName));
        }

        public QuakePak(KaitaiStream io, KaitaiStruct parent = null, QuakePak root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            f_index = false;
            _read();
        }
        private void _read() {
            _magic = m_io.EnsureFixedContents(new byte[] { 80, 65, 67, 75 });
            _indexOfs = m_io.ReadU4le();
            _indexSize = m_io.ReadU4le();
            }
        public partial class IndexStruct : KaitaiStruct
        {
            public static IndexStruct FromFile(string fileName)
            {
                return new IndexStruct(new KaitaiStream(fileName));
            }

            public IndexStruct(KaitaiStream io, QuakePak parent = null, QuakePak root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _entries = new List<IndexEntry>();
                while (!m_io.IsEof) {
                    _entries.Add(new IndexEntry(m_io, this, m_root));
                }
                }
            private List<IndexEntry> _entries;
            private QuakePak m_root;
            private QuakePak m_parent;
            public List<IndexEntry> Entries { get { return _entries; } }
            public QuakePak M_Root { get { return m_root; } }
            public QuakePak M_Parent { get { return m_parent; } }
        }
        public partial class IndexEntry : KaitaiStruct
        {
            public static IndexEntry FromFile(string fileName)
            {
                return new IndexEntry(new KaitaiStream(fileName));
            }

            public IndexEntry(KaitaiStream io, QuakePak.IndexStruct parent = null, QuakePak root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                f_body = false;
                _read();
            }
            private void _read() {
                _name = System.Text.Encoding.GetEncoding("UTF-8").GetString(KaitaiStream.BytesTerminate(KaitaiStream.BytesStripRight(m_io.ReadBytes(56), 0), 0, false));
                _ofs = m_io.ReadU4le();
                _size = m_io.ReadU4le();
                }
            private bool f_body;
            private byte[] _body;
            public byte[] Body
            {
                get
                {
                    if (f_body)
                        return _body;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek(Ofs);
                    _body = io.ReadBytes(Size);
                    io.Seek(_pos);
                    f_body = true;
                    return _body;
                }
            }
            private string _name;
            private uint _ofs;
            private uint _size;
            private QuakePak m_root;
            private QuakePak.IndexStruct m_parent;
            public string Name { get { return _name; } }
            public uint Ofs { get { return _ofs; } }
            public uint Size { get { return _size; } }
            public QuakePak M_Root { get { return m_root; } }
            public QuakePak.IndexStruct M_Parent { get { return m_parent; } }
        }
        private bool f_index;
        private IndexStruct _index;
        public IndexStruct Index
        {
            get
            {
                if (f_index)
                    return _index;
                long _pos = m_io.Pos;
                m_io.Seek(IndexOfs);
                __raw_index = m_io.ReadBytes(IndexSize);
                var io___raw_index = new KaitaiStream(__raw_index);
                _index = new IndexStruct(io___raw_index, this, m_root);
                m_io.Seek(_pos);
                f_index = true;
                return _index;
            }
        }
        private byte[] _magic;
        private uint _indexOfs;
        private uint _indexSize;
        private QuakePak m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_index;
        public byte[] Magic { get { return _magic; } }
        public uint IndexOfs { get { return _indexOfs; } }
        public uint IndexSize { get { return _indexSize; } }
        public QuakePak M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawIndex { get { return __raw_index; } }
    }
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="https://quakewiki.org/wiki/.pak#Format_specification">Source</a>
    /// </remarks>
    public partial class QuakePak : KaitaiStruct
    {
        public static QuakePak FromFile(string fileName)
        {
            return new QuakePak(new KaitaiStream(fileName));
        }

        public QuakePak(KaitaiStream p__io, KaitaiStruct p__parent = null, QuakePak p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_index = false;
            _read();
        }
        private void _read()
        {
            _magic = m_io.ReadBytes(4);
            if (!((KaitaiStream.ByteArrayCompare(_magic, new byte[] { 80, 65, 67, 75 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 80, 65, 67, 75 }, _magic, m_io, "/seq/0");
            }
            _ofsIndex = m_io.ReadU4le();
            _lenIndex = m_io.ReadU4le();
        }
        public partial class IndexEntry : KaitaiStruct
        {
            public static IndexEntry FromFile(string fileName)
            {
                return new IndexEntry(new KaitaiStream(fileName));
            }

            public IndexEntry(KaitaiStream p__io, QuakePak.IndexStruct p__parent = null, QuakePak p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_body = false;
                _read();
            }
            private void _read()
            {
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
                    f_body = true;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek(Ofs);
                    _body = io.ReadBytes(Size);
                    io.Seek(_pos);
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
        public partial class IndexStruct : KaitaiStruct
        {
            public static IndexStruct FromFile(string fileName)
            {
                return new IndexStruct(new KaitaiStream(fileName));
            }

            public IndexStruct(KaitaiStream p__io, QuakePak p__parent = null, QuakePak p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<IndexEntry>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _entries.Add(new IndexEntry(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<IndexEntry> _entries;
            private QuakePak m_root;
            private QuakePak m_parent;
            public List<IndexEntry> Entries { get { return _entries; } }
            public QuakePak M_Root { get { return m_root; } }
            public QuakePak M_Parent { get { return m_parent; } }
        }
        private bool f_index;
        private IndexStruct _index;
        public IndexStruct Index
        {
            get
            {
                if (f_index)
                    return _index;
                f_index = true;
                long _pos = m_io.Pos;
                m_io.Seek(OfsIndex);
                __raw_index = m_io.ReadBytes(LenIndex);
                var io___raw_index = new KaitaiStream(__raw_index);
                _index = new IndexStruct(io___raw_index, this, m_root);
                m_io.Seek(_pos);
                return _index;
            }
        }
        private byte[] _magic;
        private uint _ofsIndex;
        private uint _lenIndex;
        private QuakePak m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_index;
        public byte[] Magic { get { return _magic; } }
        public uint OfsIndex { get { return _ofsIndex; } }
        public uint LenIndex { get { return _lenIndex; } }
        public QuakePak M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawIndex { get { return __raw_index; } }
    }
}

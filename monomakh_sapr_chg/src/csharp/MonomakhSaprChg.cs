// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// CHG is a container format file used by
    /// [MONOMAKH-SAPR](https://www.liraland.com/mono/), a software
    /// package for analysis &amp; design of reinforced concrete multi-storey
    /// buildings with arbitrary configuration in plan.
    /// 
    /// CHG is a simple container, which bundles several project files
    /// together.
    /// 
    /// Written and tested by Vladimir Shulzhitskiy, 2017
    /// </summary>
    public partial class MonomakhSaprChg : KaitaiStruct
    {
        public static MonomakhSaprChg FromFile(string fileName)
        {
            return new MonomakhSaprChg(new KaitaiStream(fileName));
        }

        public MonomakhSaprChg(KaitaiStream p__io, KaitaiStruct p__parent = null, MonomakhSaprChg p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _title = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(10));
            _ent = new List<Block>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _ent.Add(new Block(m_io, this, m_root));
                    i++;
                }
            }
        }
        public partial class Block : KaitaiStruct
        {
            public static Block FromFile(string fileName)
            {
                return new Block(new KaitaiStream(fileName));
            }

            public Block(KaitaiStream p__io, MonomakhSaprChg p__parent = null, MonomakhSaprChg p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _header = System.Text.Encoding.GetEncoding("ascii").GetString(m_io.ReadBytes(13));
                _fileSize = m_io.ReadU8le();
                _file = m_io.ReadBytes(FileSize);
            }
            private string _header;
            private ulong _fileSize;
            private byte[] _file;
            private MonomakhSaprChg m_root;
            private MonomakhSaprChg m_parent;
            public string Header { get { return _header; } }
            public ulong FileSize { get { return _fileSize; } }
            public byte[] File { get { return _file; } }
            public MonomakhSaprChg M_Root { get { return m_root; } }
            public MonomakhSaprChg M_Parent { get { return m_parent; } }
        }
        private string _title;
        private List<Block> _ent;
        private MonomakhSaprChg m_root;
        private KaitaiStruct m_parent;
        public string Title { get { return _title; } }
        public List<Block> Ent { get { return _ent; } }
        public MonomakhSaprChg M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

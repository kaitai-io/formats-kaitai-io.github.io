// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// DCX is a simple extension of PCX image format allowing to bundle
    /// many PCX images (typically, pages of a document) in one file. It saw
    /// some limited use in DOS-era fax software, but was largely
    /// superseded with multi-page TIFFs and PDFs since then.
    /// </summary>
    public partial class PcxDcx : KaitaiStruct
    {
        public static PcxDcx FromFile(string fileName)
        {
            return new PcxDcx(new KaitaiStream(fileName));
        }

        public PcxDcx(KaitaiStream p__io, KaitaiStruct p__parent = null, PcxDcx p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _magic = m_io.ReadBytes(4);
            if (!((KaitaiStream.ByteArrayCompare(Magic, new byte[] { 177, 104, 222, 58 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 177, 104, 222, 58 }, Magic, M_Io, "/seq/0");
            }
            _files = new List<PcxOffset>();
            {
                var i = 0;
                PcxOffset M_;
                do {
                    M_ = new PcxOffset(m_io, this, m_root);
                    _files.Add(M_);
                    i++;
                } while (!(M_.OfsBody == 0));
            }
        }
        public partial class PcxOffset : KaitaiStruct
        {
            public static PcxOffset FromFile(string fileName)
            {
                return new PcxOffset(new KaitaiStream(fileName));
            }

            public PcxOffset(KaitaiStream p__io, PcxDcx p__parent = null, PcxDcx p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_body = false;
                _read();
            }
            private void _read()
            {
                _ofsBody = m_io.ReadU4le();
            }
            private bool f_body;
            private Pcx _body;
            public Pcx Body
            {
                get
                {
                    if (f_body)
                        return _body;
                    if (OfsBody != 0) {
                        long _pos = m_io.Pos;
                        m_io.Seek(OfsBody);
                        _body = new Pcx(m_io);
                        m_io.Seek(_pos);
                        f_body = true;
                    }
                    return _body;
                }
            }
            private uint _ofsBody;
            private PcxDcx m_root;
            private PcxDcx m_parent;
            public uint OfsBody { get { return _ofsBody; } }
            public PcxDcx M_Root { get { return m_root; } }
            public PcxDcx M_Parent { get { return m_parent; } }
        }
        private byte[] _magic;
        private List<PcxOffset> _files;
        private PcxDcx m_root;
        private KaitaiStruct m_parent;
        public byte[] Magic { get { return _magic; } }
        public List<PcxOffset> Files { get { return _files; } }
        public PcxDcx M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

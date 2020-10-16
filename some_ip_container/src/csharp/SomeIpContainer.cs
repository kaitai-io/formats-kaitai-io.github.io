// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class SomeIpContainer : KaitaiStruct
    {
        public static SomeIpContainer FromFile(string fileName)
        {
            return new SomeIpContainer(new KaitaiStream(fileName));
        }

        public SomeIpContainer(KaitaiStream p__io, KaitaiStruct p__parent = null, SomeIpContainer p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _someIpPackages = new List<SomeIp>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _someIpPackages.Add(new SomeIp(m_io));
                    i++;
                }
            }
        }
        private List<SomeIp> _someIpPackages;
        private SomeIpContainer m_root;
        private KaitaiStruct m_parent;
        public List<SomeIp> SomeIpPackages { get { return _someIpPackages; } }
        public SomeIpContainer M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

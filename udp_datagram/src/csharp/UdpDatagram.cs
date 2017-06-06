// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{
    public partial class UdpDatagram : KaitaiStruct
    {
        public static UdpDatagram FromFile(string fileName)
        {
            return new UdpDatagram(new KaitaiStream(fileName));
        }

        public UdpDatagram(KaitaiStream io, KaitaiStruct parent = null, UdpDatagram root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            _read();
        }
        private void _read() {
            _srcPort = m_io.ReadU2be();
            _dstPort = m_io.ReadU2be();
            _length = m_io.ReadU2be();
            _checksum = m_io.ReadU2be();
            _body = m_io.ReadBytesFull();
            }
        private ushort _srcPort;
        private ushort _dstPort;
        private ushort _length;
        private ushort _checksum;
        private byte[] _body;
        private UdpDatagram m_root;
        private KaitaiStruct m_parent;
        public ushort SrcPort { get { return _srcPort; } }
        public ushort DstPort { get { return _dstPort; } }
        public ushort Length { get { return _length; } }
        public ushort Checksum { get { return _checksum; } }
        public byte[] Body { get { return _body; } }
        public UdpDatagram M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

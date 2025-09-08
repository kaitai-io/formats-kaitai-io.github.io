// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class Ipv4Packet : KaitaiStruct
    {
        public static Ipv4Packet FromFile(string fileName)
        {
            return new Ipv4Packet(new KaitaiStream(fileName));
        }

        public Ipv4Packet(KaitaiStream p__io, KaitaiStruct p__parent = null, Ipv4Packet p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_ihl = false;
            f_ihlBytes = false;
            f_version = false;
            _read();
        }
        private void _read()
        {
            _b1 = m_io.ReadU1();
            _b2 = m_io.ReadU1();
            _totalLength = m_io.ReadU2be();
            _identification = m_io.ReadU2be();
            _b67 = m_io.ReadU2be();
            _ttl = m_io.ReadU1();
            _protocol = m_io.ReadU1();
            _headerChecksum = m_io.ReadU2be();
            _srcIpAddr = m_io.ReadBytes(4);
            _dstIpAddr = m_io.ReadBytes(4);
            __raw_options = m_io.ReadBytes(IhlBytes - 20);
            var io___raw_options = new KaitaiStream(__raw_options);
            _options = new Ipv4Options(io___raw_options, this, m_root);
            __raw_body = m_io.ReadBytes(TotalLength - IhlBytes);
            var io___raw_body = new KaitaiStream(__raw_body);
            _body = new ProtocolBody(Protocol, io___raw_body);
        }
        public partial class Ipv4Option : KaitaiStruct
        {
            public static Ipv4Option FromFile(string fileName)
            {
                return new Ipv4Option(new KaitaiStream(fileName));
            }

            public Ipv4Option(KaitaiStream p__io, Ipv4Packet.Ipv4Options p__parent = null, Ipv4Packet p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_copy = false;
                f_number = false;
                f_optClass = false;
                _read();
            }
            private void _read()
            {
                _b1 = m_io.ReadU1();
                _len = m_io.ReadU1();
                _body = m_io.ReadBytes((Len > 2 ? Len - 2 : 0));
            }
            private bool f_copy;
            private int _copy;
            public int Copy
            {
                get
                {
                    if (f_copy)
                        return _copy;
                    f_copy = true;
                    _copy = (int) ((B1 & 128) >> 7);
                    return _copy;
                }
            }
            private bool f_number;
            private int _number;
            public int Number
            {
                get
                {
                    if (f_number)
                        return _number;
                    f_number = true;
                    _number = (int) (B1 & 31);
                    return _number;
                }
            }
            private bool f_optClass;
            private int _optClass;
            public int OptClass
            {
                get
                {
                    if (f_optClass)
                        return _optClass;
                    f_optClass = true;
                    _optClass = (int) ((B1 & 96) >> 5);
                    return _optClass;
                }
            }
            private byte _b1;
            private byte _len;
            private byte[] _body;
            private Ipv4Packet m_root;
            private Ipv4Packet.Ipv4Options m_parent;
            public byte B1 { get { return _b1; } }
            public byte Len { get { return _len; } }
            public byte[] Body { get { return _body; } }
            public Ipv4Packet M_Root { get { return m_root; } }
            public Ipv4Packet.Ipv4Options M_Parent { get { return m_parent; } }
        }
        public partial class Ipv4Options : KaitaiStruct
        {
            public static Ipv4Options FromFile(string fileName)
            {
                return new Ipv4Options(new KaitaiStream(fileName));
            }

            public Ipv4Options(KaitaiStream p__io, Ipv4Packet p__parent = null, Ipv4Packet p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<Ipv4Option>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _entries.Add(new Ipv4Option(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<Ipv4Option> _entries;
            private Ipv4Packet m_root;
            private Ipv4Packet m_parent;
            public List<Ipv4Option> Entries { get { return _entries; } }
            public Ipv4Packet M_Root { get { return m_root; } }
            public Ipv4Packet M_Parent { get { return m_parent; } }
        }
        private bool f_ihl;
        private int _ihl;
        public int Ihl
        {
            get
            {
                if (f_ihl)
                    return _ihl;
                f_ihl = true;
                _ihl = (int) (B1 & 15);
                return _ihl;
            }
        }
        private bool f_ihlBytes;
        private int _ihlBytes;
        public int IhlBytes
        {
            get
            {
                if (f_ihlBytes)
                    return _ihlBytes;
                f_ihlBytes = true;
                _ihlBytes = (int) (Ihl * 4);
                return _ihlBytes;
            }
        }
        private bool f_version;
        private int _version;
        public int Version
        {
            get
            {
                if (f_version)
                    return _version;
                f_version = true;
                _version = (int) ((B1 & 240) >> 4);
                return _version;
            }
        }
        private byte _b1;
        private byte _b2;
        private ushort _totalLength;
        private ushort _identification;
        private ushort _b67;
        private byte _ttl;
        private byte _protocol;
        private ushort _headerChecksum;
        private byte[] _srcIpAddr;
        private byte[] _dstIpAddr;
        private Ipv4Options _options;
        private ProtocolBody _body;
        private Ipv4Packet m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_options;
        private byte[] __raw_body;
        public byte B1 { get { return _b1; } }
        public byte B2 { get { return _b2; } }
        public ushort TotalLength { get { return _totalLength; } }
        public ushort Identification { get { return _identification; } }
        public ushort B67 { get { return _b67; } }
        public byte Ttl { get { return _ttl; } }
        public byte Protocol { get { return _protocol; } }
        public ushort HeaderChecksum { get { return _headerChecksum; } }
        public byte[] SrcIpAddr { get { return _srcIpAddr; } }
        public byte[] DstIpAddr { get { return _dstIpAddr; } }
        public Ipv4Options Options { get { return _options; } }
        public ProtocolBody Body { get { return _body; } }
        public Ipv4Packet M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawOptions { get { return __raw_options; } }
        public byte[] M_RawBody { get { return __raw_body; } }
    }
}

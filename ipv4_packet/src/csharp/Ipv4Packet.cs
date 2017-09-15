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


        public enum ProtocolEnum
        {
            Hopopt = 0,
            Icmp = 1,
            Igmp = 2,
            Ggp = 3,
            Ipv4 = 4,
            St = 5,
            Tcp = 6,
            Cbt = 7,
            Egp = 8,
            Igp = 9,
            BbnRccMon = 10,
            NvpIi = 11,
            Pup = 12,
            Argus = 13,
            Emcon = 14,
            Xnet = 15,
            Chaos = 16,
            Udp = 17,
            Mux = 18,
            DcnMeas = 19,
            Hmp = 20,
            Prm = 21,
            XnsIdp = 22,
            Trunk1 = 23,
            Trunk2 = 24,
            Leaf1 = 25,
            Leaf2 = 26,
            Rdp = 27,
            Irtp = 28,
            IsoTp4 = 29,
            Netblt = 30,
            MfeNsp = 31,
            MeritInp = 32,
            Dccp = 33,
            X3pc = 34,
            Idpr = 35,
            Xtp = 36,
            Ddp = 37,
            IdprCmtp = 38,
            TpPlusPlus = 39,
            Il = 40,
            Ipv6 = 41,
            Sdrp = 42,
            Ipv6Route = 43,
            Ipv6Frag = 44,
            Idrp = 45,
            Rsvp = 46,
            Gre = 47,
            Dsr = 48,
            Bna = 49,
            Esp = 50,
            Ah = 51,
            INlsp = 52,
            Swipe = 53,
            Narp = 54,
            Mobile = 55,
            Tlsp = 56,
            Skip = 57,
            Ipv6Icmp = 58,
            Ipv6Nonxt = 59,
            Ipv6Opts = 60,
            AnyHostInternalProtocol = 61,
            Cftp = 62,
            AnyLocalNetwork = 63,
            SatExpak = 64,
            Kryptolan = 65,
            Rvd = 66,
            Ippc = 67,
            AnyDistributedFileSystem = 68,
            SatMon = 69,
            Visa = 70,
            Ipcv = 71,
            Cpnx = 72,
            Cphb = 73,
            Wsn = 74,
            Pvp = 75,
            BrSatMon = 76,
            SunNd = 77,
            WbMon = 78,
            WbExpak = 79,
            IsoIp = 80,
            Vmtp = 81,
            SecureVmtp = 82,
            Vines = 83,
            Iptm = 84,
            NsfnetIgp = 85,
            Dgp = 86,
            Tcf = 87,
            Eigrp = 88,
            Ospfigp = 89,
            SpriteRpc = 90,
            Larp = 91,
            Mtp = 92,
            Ax25 = 93,
            Ipip = 94,
            Micp = 95,
            SccSp = 96,
            Etherip = 97,
            Encap = 98,
            AnyPrivateEncryptionScheme = 99,
            Gmtp = 100,
            Ifmp = 101,
            Pnni = 102,
            Pim = 103,
            Aris = 104,
            Scps = 105,
            Qnx = 106,
            AN = 107,
            Ipcomp = 108,
            Snp = 109,
            CompaqPeer = 110,
            IpxInIp = 111,
            Vrrp = 112,
            Pgm = 113,
            Any0Hop = 114,
            L2tp = 115,
            Ddx = 116,
            Iatp = 117,
            Stp = 118,
            Srp = 119,
            Uti = 120,
            Smp = 121,
            Sm = 122,
            Ptp = 123,
            IsisOverIpv4 = 124,
            Fire = 125,
            Crtp = 126,
            Crudp = 127,
            Sscopmce = 128,
            Iplt = 129,
            Sps = 130,
            Pipe = 131,
            Sctp = 132,
            Fc = 133,
            RsvpE2eIgnore = 134,
            MobilityHeader = 135,
            Udplite = 136,
            MplsInIp = 137,
            Manet = 138,
            Hip = 139,
            Shim6 = 140,
            Wesp = 141,
            Rohc = 142,
            Reserved255 = 255,
        }
        public Ipv4Packet(KaitaiStream p__io, KaitaiStruct p__parent = null, Ipv4Packet p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_version = false;
            f_ihl = false;
            f_ihlBytes = false;
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
            _protocol = ((ProtocolEnum) m_io.ReadU1());
            _headerChecksum = m_io.ReadU2be();
            _srcIpAddr = m_io.ReadBytes(4);
            _dstIpAddr = m_io.ReadBytes(4);
            __raw_options = m_io.ReadBytes((IhlBytes - 20));
            var io___raw_options = new KaitaiStream(__raw_options);
            _options = new Ipv4Options(io___raw_options, this, m_root);
            switch (Protocol) {
            case ProtocolEnum.Tcp: {
                __raw_body = m_io.ReadBytes((TotalLength - IhlBytes));
                var io___raw_body = new KaitaiStream(__raw_body);
                _body = new TcpSegment(io___raw_body);
                break;
            }
            case ProtocolEnum.Icmp: {
                __raw_body = m_io.ReadBytes((TotalLength - IhlBytes));
                var io___raw_body = new KaitaiStream(__raw_body);
                _body = new IcmpPacket(io___raw_body);
                break;
            }
            case ProtocolEnum.Udp: {
                __raw_body = m_io.ReadBytes((TotalLength - IhlBytes));
                var io___raw_body = new KaitaiStream(__raw_body);
                _body = new UdpDatagram(io___raw_body);
                break;
            }
            case ProtocolEnum.Ipv6: {
                __raw_body = m_io.ReadBytes((TotalLength - IhlBytes));
                var io___raw_body = new KaitaiStream(__raw_body);
                _body = new Ipv6Packet(io___raw_body);
                break;
            }
            default: {
                _body = m_io.ReadBytes((TotalLength - IhlBytes));
                break;
            }
            }
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
                f_optClass = false;
                f_number = false;
                _read();
            }
            private void _read()
            {
                _b1 = m_io.ReadU1();
                _len = m_io.ReadU1();
                _body = m_io.ReadBytes((Len > 2 ? (Len - 2) : 0));
            }
            private bool f_copy;
            private int _copy;
            public int Copy
            {
                get
                {
                    if (f_copy)
                        return _copy;
                    _copy = (int) (((B1 & 128) >> 7));
                    f_copy = true;
                    return _copy;
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
                    _optClass = (int) (((B1 & 96) >> 5));
                    f_optClass = true;
                    return _optClass;
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
                    _number = (int) ((B1 & 31));
                    f_number = true;
                    return _number;
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
        private bool f_version;
        private int _version;
        public int Version
        {
            get
            {
                if (f_version)
                    return _version;
                _version = (int) (((B1 & 240) >> 4));
                f_version = true;
                return _version;
            }
        }
        private bool f_ihl;
        private int _ihl;
        public int Ihl
        {
            get
            {
                if (f_ihl)
                    return _ihl;
                _ihl = (int) ((B1 & 15));
                f_ihl = true;
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
                _ihlBytes = (int) ((Ihl * 4));
                f_ihlBytes = true;
                return _ihlBytes;
            }
        }
        private byte _b1;
        private byte _b2;
        private ushort _totalLength;
        private ushort _identification;
        private ushort _b67;
        private byte _ttl;
        private ProtocolEnum _protocol;
        private ushort _headerChecksum;
        private byte[] _srcIpAddr;
        private byte[] _dstIpAddr;
        private Ipv4Options _options;
        private object _body;
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
        public ProtocolEnum Protocol { get { return _protocol; } }
        public ushort HeaderChecksum { get { return _headerChecksum; } }
        public byte[] SrcIpAddr { get { return _srcIpAddr; } }
        public byte[] DstIpAddr { get { return _dstIpAddr; } }
        public Ipv4Options Options { get { return _options; } }
        public object Body { get { return _body; } }
        public Ipv4Packet M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawOptions { get { return __raw_options; } }
        public byte[] M_RawBody { get { return __raw_body; } }
    }
}

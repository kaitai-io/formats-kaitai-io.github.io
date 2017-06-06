// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{
    public partial class Pcap : KaitaiStruct
    {
        public static Pcap FromFile(string fileName)
        {
            return new Pcap(new KaitaiStream(fileName));
        }

        public enum Linktype
        {
            NullLinktype = 0,
            Ethernet = 1,
            Ax25 = 3,
            Ieee8025 = 6,
            ArcnetBsd = 7,
            Slip = 8,
            Ppp = 9,
            Fddi = 10,
            PppHdlc = 50,
            PppEther = 51,
            AtmRfc1483 = 100,
            Raw = 101,
            CHdlc = 104,
            Ieee80211 = 105,
            Frelay = 107,
            Loop = 108,
            LinuxSll = 113,
            Ltalk = 114,
            Pflog = 117,
            Ieee80211Prism = 119,
            IpOverFc = 122,
            Sunatm = 123,
            Ieee80211Radiotap = 127,
            ArcnetLinux = 129,
            AppleIpOverIeee1394 = 138,
            Mtp2WithPhdr = 139,
            Mtp2 = 140,
            Mtp3 = 141,
            Sccp = 142,
            Docsis = 143,
            LinuxIrda = 144,
            User0 = 147,
            User1 = 148,
            User2 = 149,
            User3 = 150,
            User4 = 151,
            User5 = 152,
            User6 = 153,
            User7 = 154,
            User8 = 155,
            User9 = 156,
            User10 = 157,
            User11 = 158,
            User12 = 159,
            User13 = 160,
            User14 = 161,
            User15 = 162,
            Ieee80211Avs = 163,
            BacnetMsTp = 165,
            PppPppd = 166,
            GprsLlc = 169,
            GpfT = 170,
            GpfF = 171,
            LinuxLapd = 177,
            BluetoothHciH4 = 187,
            UsbLinux = 189,
            Ppi = 192,
            Ieee802154 = 195,
            Sita = 196,
            Erf = 197,
            BluetoothHciH4WithPhdr = 201,
            Ax25Kiss = 202,
            Lapd = 203,
            PppWithDir = 204,
            CHdlcWithDir = 205,
            FrelayWithDir = 206,
            IpmbLinux = 209,
            Ieee802154NonaskPhy = 215,
            UsbLinuxMmapped = 220,
            Fc2 = 224,
            Fc2WithFrameDelims = 225,
            Ipnet = 226,
            CanSocketcan = 227,
            Ipv4 = 228,
            Ipv6 = 229,
            Ieee802154Nofcs = 230,
            Dbus = 231,
            DvbCi = 235,
            Mux27010 = 236,
            Stanag5066DPdu = 237,
            Nflog = 239,
            Netanalyzer = 240,
            NetanalyzerTransparent = 241,
            Ipoib = 242,
            Mpeg2Ts = 243,
            Ng40 = 244,
            NfcLlcp = 245,
            Infiniband = 247,
            Sctp = 248,
            Usbpcap = 249,
            RtacSerial = 250,
            BluetoothLeLl = 251,
            Netlink = 253,
            BluetoothLinuxMonitor = 254,
            BluetoothBredrBb = 255,
            BluetoothLeLlWithPhdr = 256,
            ProfibusDl = 257,
            Pktap = 258,
            Epon = 259,
            IpmiHpm2 = 260,
            ZwaveR1R2 = 261,
            ZwaveR3 = 262,
            WattstopperDlm = 263,
            Iso14443 = 264,
        }

        public enum PfhType
        {
            Radio80211Common = 2,
            Radio80211nMacExt = 3,
            Radio80211nMacPhyExt = 4,
            SpectrumMap = 5,
            ProcessInfo = 6,
            CaptureInfo = 7,
        }

        public Pcap(KaitaiStream io, KaitaiStruct parent = null, Pcap root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            _read();
        }
        private void _read() {
            _hdr = new Header(m_io, this, m_root);
            _packets = new List<Packet>();
            while (!m_io.IsEof) {
                _packets.Add(new Packet(m_io, this, m_root));
            }
            }
        public partial class PacketPpi : KaitaiStruct
        {
            public static PacketPpi FromFile(string fileName)
            {
                return new PacketPpi(new KaitaiStream(fileName));
            }

            public PacketPpi(KaitaiStream io, Pcap.Packet parent = null, Pcap root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _header = new PacketPpiHeader(m_io, this, m_root);
                _fields = new List<PacketPpiField>();
                while (!m_io.IsEof) {
                    _fields.Add(new PacketPpiField(m_io, this, m_root));
                }
                }
            private PacketPpiHeader _header;
            private List<PacketPpiField> _fields;
            private Pcap m_root;
            private Pcap.Packet m_parent;
            public PacketPpiHeader Header { get { return _header; } }
            public List<PacketPpiField> Fields { get { return _fields; } }
            public Pcap M_Root { get { return m_root; } }
            public Pcap.Packet M_Parent { get { return m_parent; } }
        }
        public partial class PacketPpiHeader : KaitaiStruct
        {
            public static PacketPpiHeader FromFile(string fileName)
            {
                return new PacketPpiHeader(new KaitaiStream(fileName));
            }

            public PacketPpiHeader(KaitaiStream io, Pcap.PacketPpi parent = null, Pcap root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _pphVersion = m_io.ReadU1();
                _pphFlags = m_io.ReadU1();
                _pphLen = m_io.ReadU2le();
                _pphDlt = m_io.ReadU4le();
                }
            private byte _pphVersion;
            private byte _pphFlags;
            private ushort _pphLen;
            private uint _pphDlt;
            private Pcap m_root;
            private Pcap.PacketPpi m_parent;
            public byte PphVersion { get { return _pphVersion; } }
            public byte PphFlags { get { return _pphFlags; } }
            public ushort PphLen { get { return _pphLen; } }
            public uint PphDlt { get { return _pphDlt; } }
            public Pcap M_Root { get { return m_root; } }
            public Pcap.PacketPpi M_Parent { get { return m_parent; } }
        }
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            public Header(KaitaiStream io, Pcap parent = null, Pcap root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _magicNumber = m_io.EnsureFixedContents(new byte[] { 212, 195, 178, 161 });
                _versionMajor = m_io.ReadU2le();
                _versionMinor = m_io.ReadU2le();
                _thiszone = m_io.ReadS4le();
                _sigfigs = m_io.ReadU4le();
                _snaplen = m_io.ReadU4le();
                _network = ((Pcap.Linktype) m_io.ReadU4le());
                }
            private byte[] _magicNumber;
            private ushort _versionMajor;
            private ushort _versionMinor;
            private int _thiszone;
            private uint _sigfigs;
            private uint _snaplen;
            private Linktype _network;
            private Pcap m_root;
            private Pcap m_parent;
            public byte[] MagicNumber { get { return _magicNumber; } }
            public ushort VersionMajor { get { return _versionMajor; } }
            public ushort VersionMinor { get { return _versionMinor; } }

            /// <summary>
            /// Correction time in seconds between UTC and the local
            /// timezone of the following packet header timestamps.
            /// </summary>
            public int Thiszone { get { return _thiszone; } }

            /// <summary>
            /// In theory, the accuracy of time stamps in the capture; in
            /// practice, all tools set it to 0.
            /// </summary>
            public uint Sigfigs { get { return _sigfigs; } }

            /// <summary>
            /// The &quot;snapshot length&quot; for the capture (typically 65535 or
            /// even more, but might be limited by the user), see: incl_len
            /// vs. orig_len.
            /// </summary>
            public uint Snaplen { get { return _snaplen; } }

            /// <summary>
            /// Link-layer header type, specifying the type of headers at
            /// the beginning of the packet.
            /// </summary>
            public Linktype Network { get { return _network; } }
            public Pcap M_Root { get { return m_root; } }
            public Pcap M_Parent { get { return m_parent; } }
        }
        public partial class Radio80211CommonBody : KaitaiStruct
        {
            public static Radio80211CommonBody FromFile(string fileName)
            {
                return new Radio80211CommonBody(new KaitaiStream(fileName));
            }

            public Radio80211CommonBody(KaitaiStream io, KaitaiStruct parent = null, Pcap root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _tsfTimer = m_io.ReadU8le();
                _flags = m_io.ReadU2le();
                _rate = m_io.ReadU2le();
                _channelFreq = m_io.ReadU2le();
                _channelFlags = m_io.ReadU2le();
                _fhssHopset = m_io.ReadU1();
                _fhssPattern = m_io.ReadU1();
                _dbmAntsignal = m_io.ReadS1();
                _dbmAntnoise = m_io.ReadS1();
                }
            private ulong _tsfTimer;
            private ushort _flags;
            private ushort _rate;
            private ushort _channelFreq;
            private ushort _channelFlags;
            private byte _fhssHopset;
            private byte _fhssPattern;
            private sbyte _dbmAntsignal;
            private sbyte _dbmAntnoise;
            private Pcap m_root;
            private KaitaiStruct m_parent;
            public ulong TsfTimer { get { return _tsfTimer; } }
            public ushort Flags { get { return _flags; } }
            public ushort Rate { get { return _rate; } }
            public ushort ChannelFreq { get { return _channelFreq; } }
            public ushort ChannelFlags { get { return _channelFlags; } }
            public byte FhssHopset { get { return _fhssHopset; } }
            public byte FhssPattern { get { return _fhssPattern; } }
            public sbyte DbmAntsignal { get { return _dbmAntsignal; } }
            public sbyte DbmAntnoise { get { return _dbmAntnoise; } }
            public Pcap M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class PacketPpiField : KaitaiStruct
        {
            public static PacketPpiField FromFile(string fileName)
            {
                return new PacketPpiField(new KaitaiStream(fileName));
            }

            public PacketPpiField(KaitaiStream io, Pcap.PacketPpi parent = null, Pcap root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _pfhType = m_io.ReadU2le();
                _pfhDatalen = m_io.ReadU2le();
                _body = m_io.ReadBytes(PfhDatalen);
                }
            private ushort _pfhType;
            private ushort _pfhDatalen;
            private byte[] _body;
            private Pcap m_root;
            private Pcap.PacketPpi m_parent;
            public ushort PfhType { get { return _pfhType; } }
            public ushort PfhDatalen { get { return _pfhDatalen; } }
            public byte[] Body { get { return _body; } }
            public Pcap M_Root { get { return m_root; } }
            public Pcap.PacketPpi M_Parent { get { return m_parent; } }
        }
        public partial class Packet : KaitaiStruct
        {
            public static Packet FromFile(string fileName)
            {
                return new Packet(new KaitaiStream(fileName));
            }

            public Packet(KaitaiStream io, Pcap parent = null, Pcap root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _tsSec = m_io.ReadU4le();
                _tsUsec = m_io.ReadU4le();
                _inclLen = m_io.ReadU4le();
                _origLen = m_io.ReadU4le();
                switch (M_Root.Hdr.Network) {
                case Pcap.Linktype.Ppi: {
                    __raw_body = m_io.ReadBytes(InclLen);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new PacketPpi(io___raw_body, this, m_root);
                    break;
                }
                case Pcap.Linktype.Ethernet: {
                    __raw_body = m_io.ReadBytes(InclLen);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new EthernetFrame(io___raw_body);
                    break;
                }
                default: {
                    _body = m_io.ReadBytes(InclLen);
                    break;
                }
                }
                }
            private uint _tsSec;
            private uint _tsUsec;
            private uint _inclLen;
            private uint _origLen;
            private object _body;
            private Pcap m_root;
            private Pcap m_parent;
            private byte[] __raw_body;
            public uint TsSec { get { return _tsSec; } }
            public uint TsUsec { get { return _tsUsec; } }

            /// <summary>
            /// Number of bytes of packet data actually captured and saved in the file.
            /// </summary>
            public uint InclLen { get { return _inclLen; } }

            /// <summary>
            /// Length of the packet as it appeared on the network when it was captured.
            /// </summary>
            public uint OrigLen { get { return _origLen; } }
            public object Body { get { return _body; } }
            public Pcap M_Root { get { return m_root; } }
            public Pcap M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }
        private Header _hdr;
        private List<Packet> _packets;
        private Pcap m_root;
        private KaitaiStruct m_parent;
        public Header Hdr { get { return _hdr; } }
        public List<Packet> Packets { get { return _packets; } }
        public Pcap M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

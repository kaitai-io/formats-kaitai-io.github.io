// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;
using System;

namespace Kaitai
{

    /// <summary>
    /// PCAP (named after libpcap / winpcap) is a popular format for saving
    /// network traffic grabbed by network sniffers. It is typically
    /// produced by tools like [tcpdump](https://www.tcpdump.org/) or
    /// [Wireshark](https://www.wireshark.org/).
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://wiki.wireshark.org/Development/LibpcapFileFormat">Source</a>
    /// </remarks>
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
            ExpEthernet = 2,
            Ax25 = 3,
            Pronet = 4,
            Chaos = 5,
            Ieee8025 = 6,
            ArcnetBsd = 7,
            Slip = 8,
            Ppp = 9,
            Fddi = 10,
            RedbackSmartedge = 32,
            PppHdlc = 50,
            PppEther = 51,
            SymantecFirewall = 99,
            AtmRfc1483 = 100,
            Raw = 101,
            CHdlc = 104,
            Ieee80211 = 105,
            AtmClip = 106,
            Frelay = 107,
            Loop = 108,
            Enc = 109,
            NetbsdHdlc = 112,
            LinuxSll = 113,
            Ltalk = 114,
            Econet = 115,
            Ipfilter = 116,
            Pflog = 117,
            CiscoIos = 118,
            Ieee80211Prism = 119,
            AironetHeader = 120,
            IpOverFc = 122,
            Sunatm = 123,
            Rio = 124,
            PciExp = 125,
            Aurora = 126,
            Ieee80211Radiotap = 127,
            Tzsp = 128,
            ArcnetLinux = 129,
            JuniperMlppp = 130,
            JuniperMlfr = 131,
            JuniperEs = 132,
            JuniperGgsn = 133,
            JuniperMfr = 134,
            JuniperAtm2 = 135,
            JuniperServices = 136,
            JuniperAtm1 = 137,
            AppleIpOverIeee1394 = 138,
            Mtp2WithPhdr = 139,
            Mtp2 = 140,
            Mtp3 = 141,
            Sccp = 142,
            Docsis = 143,
            LinuxIrda = 144,
            IbmSp = 145,
            IbmSn = 146,
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
            JuniperMonitor = 164,
            BacnetMsTp = 165,
            PppPppd = 166,
            JuniperPppoe = 167,
            JuniperPppoeAtm = 168,
            GprsLlc = 169,
            GpfT = 170,
            GpfF = 171,
            GcomT1e1 = 172,
            GcomSerial = 173,
            JuniperPicPeer = 174,
            ErfEth = 175,
            ErfPos = 176,
            LinuxLapd = 177,
            JuniperEther = 178,
            JuniperPpp = 179,
            JuniperFrelay = 180,
            JuniperChdlc = 181,
            Mfr = 182,
            JuniperVp = 183,
            A429 = 184,
            A653Icm = 185,
            UsbFreebsd = 186,
            BluetoothHciH4 = 187,
            Ieee80216MacCps = 188,
            UsbLinux = 189,
            Can20b = 190,
            Ieee802154Linux = 191,
            Ppi = 192,
            Ieee80216MacCpsRadio = 193,
            JuniperIsm = 194,
            Ieee802154Withfcs = 195,
            Sita = 196,
            Erf = 197,
            Raif1 = 198,
            IpmbKontron = 199,
            JuniperSt = 200,
            BluetoothHciH4WithPhdr = 201,
            Ax25Kiss = 202,
            Lapd = 203,
            PppWithDir = 204,
            CHdlcWithDir = 205,
            FrelayWithDir = 206,
            LapbWithDir = 207,
            IpmbLinux = 209,
            Flexray = 210,
            Most = 211,
            Lin = 212,
            X2eSerial = 213,
            X2eXoraya = 214,
            Ieee802154NonaskPhy = 215,
            LinuxEvdev = 216,
            GsmtapUm = 217,
            GsmtapAbis = 218,
            Mpls = 219,
            UsbLinuxMmapped = 220,
            Dect = 221,
            Aos = 222,
            Wihart = 223,
            Fc2 = 224,
            Fc2WithFrameDelims = 225,
            Ipnet = 226,
            CanSocketcan = 227,
            Ipv4 = 228,
            Ipv6 = 229,
            Ieee802154Nofcs = 230,
            Dbus = 231,
            JuniperVs = 232,
            JuniperSrxE2e = 233,
            JuniperFibrechannel = 234,
            DvbCi = 235,
            Mux27010 = 236,
            Stanag5066DPdu = 237,
            JuniperAtmCemic = 238,
            Nflog = 239,
            Netanalyzer = 240,
            NetanalyzerTransparent = 241,
            Ipoib = 242,
            Mpeg2Ts = 243,
            Ng40 = 244,
            NfcLlcp = 245,
            Pfsync = 246,
            Infiniband = 247,
            Sctp = 248,
            Usbpcap = 249,
            RtacSerial = 250,
            BluetoothLeLl = 251,
            WiresharkUpperPdu = 252,
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
            Rds = 265,
            UsbDarwin = 266,
            Openflow = 267,
            Sdlc = 268,
            TiLlnSniffer = 269,
            Loratap = 270,
            Vsock = 271,
            NordicBle = 272,
            Docsis31Xra31 = 273,
            EthernetMpacket = 274,
            DisplayportAux = 275,
            LinuxSll2 = 276,
            SercosMonitor = 277,
            Openvizsla = 278,
            Ebhscr = 279,
            VppDispatch = 280,
            DsaTagBrcm = 281,
            DsaTagBrcmPrepend = 282,
            Ieee802154Tap = 283,
            DsaTagDsa = 284,
            DsaTagEdsa = 285,
            Elee = 286,
            ZwaveSerial = 287,
            Usb20 = 288,
            AtscAlp = 289,
            Etw = 290,
            NetanalyzerNg = 291,
            ZbossNcp = 292,
            Usb20LowSpeed = 293,
            Usb20FullSpeed = 294,
            Usb20HighSpeed = 295,
            AuerswaldLog = 296,
            ZwaveTap = 297,
            SilabsDebugChannel = 298,
            FiraUci = 299,
        }

        public enum Magic
        {
            LeNanoseconds = 1295823521,
            BeNanoseconds = 2712812621,
            BeMicroseconds = 2712847316,
            LeMicroseconds = 3569595041,
        }
        public Pcap(KaitaiStream p__io, KaitaiStruct p__parent = null, Pcap p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _magicNumber = ((Magic) m_io.ReadU4be());
            _hdr = new Header(m_io, this, m_root);
            _packets = new List<Packet>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _packets.Add(new Packet(m_io, this, m_root));
                    i++;
                }
            }
        }

        /// <remarks>
        /// Reference: <a href="https://wiki.wireshark.org/Development/LibpcapFileFormat#Global_Header">Source</a>
        /// </remarks>
        public partial class Header : KaitaiStruct
        {
            public static Header FromFile(string fileName)
            {
                return new Header(new KaitaiStream(fileName));
            }

            private bool? m_isLe;
            public Header(KaitaiStream p__io, Pcap p__parent = null, Pcap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                switch (M_Root.MagicNumber) {
                case Pcap.Magic.LeMicroseconds: {
                    m_isLe = (bool) (true);
                    break;
                }
                case Pcap.Magic.LeNanoseconds: {
                    m_isLe = (bool) (true);
                    break;
                }
                case Pcap.Magic.BeMicroseconds: {
                    m_isLe = (bool) (false);
                    break;
                }
                case Pcap.Magic.BeNanoseconds: {
                    m_isLe = (bool) (false);
                    break;
                }
                }

                if (m_isLe == null) {
                    throw new UndecidedEndiannessError();
                } else if (m_isLe == true) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE()
            {
                _versionMajor = m_io.ReadU2le();
                if (!(_versionMajor == 2))
                {
                    throw new ValidationNotEqualError(2, _versionMajor, m_io, "/types/header/seq/0");
                }
                _versionMinor = m_io.ReadU2le();
                _thiszone = m_io.ReadS4le();
                _sigfigs = m_io.ReadU4le();
                _snaplen = m_io.ReadU4le();
                _network = ((Pcap.Linktype) m_io.ReadU4le());
            }
            private void _readBE()
            {
                _versionMajor = m_io.ReadU2be();
                if (!(_versionMajor == 2))
                {
                    throw new ValidationNotEqualError(2, _versionMajor, m_io, "/types/header/seq/0");
                }
                _versionMinor = m_io.ReadU2be();
                _thiszone = m_io.ReadS4be();
                _sigfigs = m_io.ReadU4be();
                _snaplen = m_io.ReadU4be();
                _network = ((Pcap.Linktype) m_io.ReadU4be());
            }
            private ushort _versionMajor;
            private ushort _versionMinor;
            private int _thiszone;
            private uint _sigfigs;
            private uint _snaplen;
            private Linktype _network;
            private Pcap m_root;
            private Pcap m_parent;
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

        /// <remarks>
        /// Reference: <a href="https://wiki.wireshark.org/Development/LibpcapFileFormat#Record_.28Packet.29_Header">Source</a>
        /// </remarks>
        public partial class Packet : KaitaiStruct
        {
            public static Packet FromFile(string fileName)
            {
                return new Packet(new KaitaiStream(fileName));
            }

            private bool? m_isLe;
            public Packet(KaitaiStream p__io, Pcap p__parent = null, Pcap p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                switch (M_Root.MagicNumber) {
                case Pcap.Magic.LeMicroseconds: {
                    m_isLe = (bool) (true);
                    break;
                }
                case Pcap.Magic.LeNanoseconds: {
                    m_isLe = (bool) (true);
                    break;
                }
                case Pcap.Magic.BeMicroseconds: {
                    m_isLe = (bool) (false);
                    break;
                }
                case Pcap.Magic.BeNanoseconds: {
                    m_isLe = (bool) (false);
                    break;
                }
                }

                if (m_isLe == null) {
                    throw new UndecidedEndiannessError();
                } else if (m_isLe == true) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE()
            {
                _tsSec = m_io.ReadU4le();
                _tsUsec = m_io.ReadU4le();
                _inclLen = m_io.ReadU4le();
                _origLen = m_io.ReadU4le();
                switch (M_Root.Hdr.Network) {
                case Pcap.Linktype.Ethernet: {
                    __raw_body = m_io.ReadBytes((InclLen < M_Root.Hdr.Snaplen ? InclLen : M_Root.Hdr.Snaplen));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new EthernetFrame(io___raw_body);
                    break;
                }
                case Pcap.Linktype.Ppi: {
                    __raw_body = m_io.ReadBytes((InclLen < M_Root.Hdr.Snaplen ? InclLen : M_Root.Hdr.Snaplen));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new PacketPpi(io___raw_body);
                    break;
                }
                default: {
                    _body = m_io.ReadBytes((InclLen < M_Root.Hdr.Snaplen ? InclLen : M_Root.Hdr.Snaplen));
                    break;
                }
                }
            }
            private void _readBE()
            {
                _tsSec = m_io.ReadU4be();
                _tsUsec = m_io.ReadU4be();
                _inclLen = m_io.ReadU4be();
                _origLen = m_io.ReadU4be();
                switch (M_Root.Hdr.Network) {
                case Pcap.Linktype.Ethernet: {
                    __raw_body = m_io.ReadBytes((InclLen < M_Root.Hdr.Snaplen ? InclLen : M_Root.Hdr.Snaplen));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new EthernetFrame(io___raw_body);
                    break;
                }
                case Pcap.Linktype.Ppi: {
                    __raw_body = m_io.ReadBytes((InclLen < M_Root.Hdr.Snaplen ? InclLen : M_Root.Hdr.Snaplen));
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new PacketPpi(io___raw_body);
                    break;
                }
                default: {
                    _body = m_io.ReadBytes((InclLen < M_Root.Hdr.Snaplen ? InclLen : M_Root.Hdr.Snaplen));
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

            /// <summary>
            /// Timestamp of a packet in seconds since 1970-01-01 00:00:00 UTC (UNIX timestamp).
            /// 
            /// In practice, some captures are not following that (e.g. because the device lacks
            /// a real-time clock), so this field might represent time since device boot, start of
            /// capture, or other arbitrary epoch.
            /// </summary>
            public uint TsSec { get { return _tsSec; } }

            /// <summary>
            /// Depending on `_root.magic_number`, units for this field change:
            /// 
            /// * If it's `le_microseconds` or `be_microseconds`, this field
            ///   contains microseconds.
            /// * If it's `le_nanoseconds` or `be_nanoseconds`, this field
            ///   contains nanoseconds.
            /// </summary>
            public uint TsUsec { get { return _tsUsec; } }

            /// <summary>
            /// Number of bytes of packet data actually captured and saved in the file.
            /// </summary>
            public uint InclLen { get { return _inclLen; } }

            /// <summary>
            /// Length of the packet as it appeared on the network when it was captured.
            /// </summary>
            public uint OrigLen { get { return _origLen; } }

            /// <remarks>
            /// Reference: <a href="https://wiki.wireshark.org/Development/LibpcapFileFormat#Packet_Data">Source</a>
            /// </remarks>
            public object Body { get { return _body; } }
            public Pcap M_Root { get { return m_root; } }
            public Pcap M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }
        private Magic _magicNumber;
        private Header _hdr;
        private List<Packet> _packets;
        private Pcap m_root;
        private KaitaiStruct m_parent;
        public Magic MagicNumber { get { return _magicNumber; } }
        public Header Hdr { get { return _hdr; } }
        public List<Packet> Packets { get { return _packets; } }
        public Pcap M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

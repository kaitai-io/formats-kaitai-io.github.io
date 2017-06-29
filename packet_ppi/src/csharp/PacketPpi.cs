// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// PPI is a standard for link layer packet encapsulation, proposed as
    /// generic extensible container to store both captured in-band data and
    /// out-of-band data. Originally it was developed to provide 802.11n
    /// radio information, but can be used for other purposes as well.
    /// 
    /// Sample capture: https://wiki.wireshark.org/SampleCaptures?action=AttachFile&amp;do=get&amp;target=Http.cap  
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 3</a>
    /// </remarks>
    public partial class PacketPpi : KaitaiStruct
    {
        public static PacketPpi FromFile(string fileName)
        {
            return new PacketPpi(new KaitaiStream(fileName));
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

        public PacketPpi(KaitaiStream io, KaitaiStruct parent = null, PacketPpi root = null) : base(io)
        {
            m_parent = parent;
            m_root = root ?? this;
            _read();
        }
        private void _read() {
            _header = new PacketPpiHeader(m_io, this, m_root);
            __raw_fields = m_io.ReadBytes((Header.PphLen - 8));
            var io___raw_fields = new KaitaiStream(__raw_fields);
            _fields = new PacketPpiFields(io___raw_fields, this, m_root);
            switch (Header.PphDlt) {
            case Linktype.Ppi: {
                __raw_body = m_io.ReadBytesFull();
                var io___raw_body = new KaitaiStream(__raw_body);
                _body = new PacketPpi(io___raw_body);
                break;
            }
            case Linktype.Ethernet: {
                __raw_body = m_io.ReadBytesFull();
                var io___raw_body = new KaitaiStream(__raw_body);
                _body = new EthernetFrame(io___raw_body);
                break;
            }
            default: {
                _body = m_io.ReadBytesFull();
                break;
            }
            }
            }

        /// <remarks>
        /// Reference: <a href="https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 3.1</a>
        /// </remarks>
        public partial class PacketPpiHeader : KaitaiStruct
        {
            public static PacketPpiHeader FromFile(string fileName)
            {
                return new PacketPpiHeader(new KaitaiStream(fileName));
            }

            public PacketPpiHeader(KaitaiStream io, PacketPpi parent = null, PacketPpi root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _pphVersion = m_io.ReadU1();
                _pphFlags = m_io.ReadU1();
                _pphLen = m_io.ReadU2le();
                _pphDlt = ((PacketPpi.Linktype) m_io.ReadU4le());
                }
            private byte _pphVersion;
            private byte _pphFlags;
            private ushort _pphLen;
            private Linktype _pphDlt;
            private PacketPpi m_root;
            private PacketPpi m_parent;
            public byte PphVersion { get { return _pphVersion; } }
            public byte PphFlags { get { return _pphFlags; } }
            public ushort PphLen { get { return _pphLen; } }
            public Linktype PphDlt { get { return _pphDlt; } }
            public PacketPpi M_Root { get { return m_root; } }
            public PacketPpi M_Parent { get { return m_parent; } }
        }
        public partial class PacketPpiFields : KaitaiStruct
        {
            public static PacketPpiFields FromFile(string fileName)
            {
                return new PacketPpiFields(new KaitaiStream(fileName));
            }

            public PacketPpiFields(KaitaiStream io, PacketPpi parent = null, PacketPpi root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _entries = new List<PacketPpiField>();
                while (!m_io.IsEof) {
                    _entries.Add(new PacketPpiField(m_io, this, m_root));
                }
                }
            private List<PacketPpiField> _entries;
            private PacketPpi m_root;
            private PacketPpi m_parent;
            public List<PacketPpiField> Entries { get { return _entries; } }
            public PacketPpi M_Root { get { return m_root; } }
            public PacketPpi M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 3.1</a>
        /// </remarks>
        public partial class PacketPpiField : KaitaiStruct
        {
            public static PacketPpiField FromFile(string fileName)
            {
                return new PacketPpiField(new KaitaiStream(fileName));
            }

            public PacketPpiField(KaitaiStream io, PacketPpi.PacketPpiFields parent = null, PacketPpi root = null) : base(io)
            {
                m_parent = parent;
                m_root = root;
                _read();
            }
            private void _read() {
                _pfhType = ((PacketPpi.PfhType) m_io.ReadU2le());
                _pfhDatalen = m_io.ReadU2le();
                switch (PfhType) {
                case PacketPpi.PfhType.Radio80211Common: {
                    __raw_body = m_io.ReadBytes(PfhDatalen);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new Radio80211CommonBody(io___raw_body, this, m_root);
                    break;
                }
                default: {
                    _body = m_io.ReadBytes(PfhDatalen);
                    break;
                }
                }
                }
            private PfhType _pfhType;
            private ushort _pfhDatalen;
            private object _body;
            private PacketPpi m_root;
            private PacketPpi.PacketPpiFields m_parent;
            private byte[] __raw_body;
            public PfhType PfhType { get { return _pfhType; } }
            public ushort PfhDatalen { get { return _pfhDatalen; } }
            public object Body { get { return _body; } }
            public PacketPpi M_Root { get { return m_root; } }
            public PacketPpi.PacketPpiFields M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }

        /// <remarks>
        /// Reference: <a href="https://www.cacetech.com/documents/PPI_Header_format_1.0.1.pdf">PPI header format spec, section 4.1.2</a>
        /// </remarks>
        public partial class Radio80211CommonBody : KaitaiStruct
        {
            public static Radio80211CommonBody FromFile(string fileName)
            {
                return new Radio80211CommonBody(new KaitaiStream(fileName));
            }

            public Radio80211CommonBody(KaitaiStream io, PacketPpi.PacketPpiField parent = null, PacketPpi root = null) : base(io)
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
            private PacketPpi m_root;
            private PacketPpi.PacketPpiField m_parent;
            public ulong TsfTimer { get { return _tsfTimer; } }
            public ushort Flags { get { return _flags; } }
            public ushort Rate { get { return _rate; } }
            public ushort ChannelFreq { get { return _channelFreq; } }
            public ushort ChannelFlags { get { return _channelFlags; } }
            public byte FhssHopset { get { return _fhssHopset; } }
            public byte FhssPattern { get { return _fhssPattern; } }
            public sbyte DbmAntsignal { get { return _dbmAntsignal; } }
            public sbyte DbmAntnoise { get { return _dbmAntnoise; } }
            public PacketPpi M_Root { get { return m_root; } }
            public PacketPpi.PacketPpiField M_Parent { get { return m_parent; } }
        }
        private PacketPpiHeader _header;
        private PacketPpiFields _fields;
        private object _body;
        private PacketPpi m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_fields;
        private byte[] __raw_body;
        public PacketPpiHeader Header { get { return _header; } }
        public PacketPpiFields Fields { get { return _fields; } }
        public object Body { get { return _body; } }
        public PacketPpi M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawFields { get { return __raw_fields; } }
        public byte[] M_RawBody { get { return __raw_body; } }
    }
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Microsoft Network Monitor (AKA Netmon) is a proprietary Microsoft's
    /// network packet sniffing and analysis tool. It can save captured
    /// traffic as .cap files, which usually contain the packets and may
    /// contain some additional info - enhanced network info, calculated
    /// statistics, etc.
    /// 
    /// There are at least 2 different versions of the format: v1 and
    /// v2. Netmon v3 seems to use the same file format as v1.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://learn.microsoft.com/en-us/windows/win32/netmon2/capturefile-header-values">Source</a>
    /// </remarks>
    public partial class MicrosoftNetworkMonitorV2 : KaitaiStruct
    {
        public static MicrosoftNetworkMonitorV2 FromFile(string fileName)
        {
            return new MicrosoftNetworkMonitorV2(new KaitaiStream(fileName));
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
        public MicrosoftNetworkMonitorV2(KaitaiStream p__io, KaitaiStruct p__parent = null, MicrosoftNetworkMonitorV2 p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_frameTable = false;
            _read();
        }
        private void _read()
        {
            _signature = m_io.ReadBytes(4);
            if (!((KaitaiStream.ByteArrayCompare(_signature, new byte[] { 71, 77, 66, 85 }) == 0)))
            {
                throw new ValidationNotEqualError(new byte[] { 71, 77, 66, 85 }, _signature, m_io, "/seq/0");
            }
            _versionMinor = m_io.ReadU1();
            _versionMajor = m_io.ReadU1();
            _macType = ((Linktype) m_io.ReadU2le());
            _timeCaptureStart = new WindowsSystemtime(m_io);
            _frameTableOfs = m_io.ReadU4le();
            _frameTableLen = m_io.ReadU4le();
            _userDataOfs = m_io.ReadU4le();
            _userDataLen = m_io.ReadU4le();
            _commentOfs = m_io.ReadU4le();
            _commentLen = m_io.ReadU4le();
            _statisticsOfs = m_io.ReadU4le();
            _statisticsLen = m_io.ReadU4le();
            _networkInfoOfs = m_io.ReadU4le();
            _networkInfoLen = m_io.ReadU4le();
            _conversationStatsOfs = m_io.ReadU4le();
            _conversationStatsLen = m_io.ReadU4le();
        }

        /// <summary>
        /// A container for actually captured network data. Allow to
        /// timestamp individual frames and designates how much data from
        /// the original packet was actually written into the file.
        /// </summary>
        /// <remarks>
        /// Reference: <a href="https://learn.microsoft.com/en-us/windows/win32/netmon2/frame">Source</a>
        /// </remarks>
        public partial class Frame : KaitaiStruct
        {
            public static Frame FromFile(string fileName)
            {
                return new Frame(new KaitaiStream(fileName));
            }

            public Frame(KaitaiStream p__io, MicrosoftNetworkMonitorV2.FrameIndexEntry p__parent = null, MicrosoftNetworkMonitorV2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _tsDelta = m_io.ReadU8le();
                _origLen = m_io.ReadU4le();
                _incLen = m_io.ReadU4le();
                switch (M_Root.MacType) {
                case MicrosoftNetworkMonitorV2.Linktype.Ethernet: {
                    __raw_body = m_io.ReadBytes(IncLen);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new EthernetFrame(io___raw_body);
                    break;
                }
                default: {
                    _body = m_io.ReadBytes(IncLen);
                    break;
                }
                }
            }
            private ulong _tsDelta;
            private uint _origLen;
            private uint _incLen;
            private object _body;
            private MicrosoftNetworkMonitorV2 m_root;
            private MicrosoftNetworkMonitorV2.FrameIndexEntry m_parent;
            private byte[] __raw_body;

            /// <summary>
            /// Time stamp - usecs since start of capture
            /// </summary>
            public ulong TsDelta { get { return _tsDelta; } }

            /// <summary>
            /// Actual length of packet
            /// </summary>
            public uint OrigLen { get { return _origLen; } }

            /// <summary>
            /// Number of octets captured in file
            /// </summary>
            public uint IncLen { get { return _incLen; } }

            /// <summary>
            /// Actual packet captured from the network
            /// </summary>
            public object Body { get { return _body; } }
            public MicrosoftNetworkMonitorV2 M_Root { get { return m_root; } }
            public MicrosoftNetworkMonitorV2.FrameIndexEntry M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }
        public partial class FrameIndex : KaitaiStruct
        {
            public static FrameIndex FromFile(string fileName)
            {
                return new FrameIndex(new KaitaiStream(fileName));
            }

            public FrameIndex(KaitaiStream p__io, MicrosoftNetworkMonitorV2 p__parent = null, MicrosoftNetworkMonitorV2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _entries = new List<FrameIndexEntry>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _entries.Add(new FrameIndexEntry(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private List<FrameIndexEntry> _entries;
            private MicrosoftNetworkMonitorV2 m_root;
            private MicrosoftNetworkMonitorV2 m_parent;
            public List<FrameIndexEntry> Entries { get { return _entries; } }
            public MicrosoftNetworkMonitorV2 M_Root { get { return m_root; } }
            public MicrosoftNetworkMonitorV2 M_Parent { get { return m_parent; } }
        }

        /// <summary>
        /// Each index entry is just a pointer to where the frame data is
        /// stored in the file.
        /// </summary>
        public partial class FrameIndexEntry : KaitaiStruct
        {
            public static FrameIndexEntry FromFile(string fileName)
            {
                return new FrameIndexEntry(new KaitaiStream(fileName));
            }

            public FrameIndexEntry(KaitaiStream p__io, MicrosoftNetworkMonitorV2.FrameIndex p__parent = null, MicrosoftNetworkMonitorV2 p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_body = false;
                _read();
            }
            private void _read()
            {
                _ofs = m_io.ReadU4le();
            }
            private bool f_body;
            private Frame _body;

            /// <summary>
            /// Frame body itself
            /// </summary>
            public Frame Body
            {
                get
                {
                    if (f_body)
                        return _body;
                    f_body = true;
                    KaitaiStream io = M_Root.M_Io;
                    long _pos = io.Pos;
                    io.Seek(Ofs);
                    _body = new Frame(io, this, m_root);
                    io.Seek(_pos);
                    return _body;
                }
            }
            private uint _ofs;
            private MicrosoftNetworkMonitorV2 m_root;
            private MicrosoftNetworkMonitorV2.FrameIndex m_parent;

            /// <summary>
            /// Absolute pointer to frame data in the file
            /// </summary>
            public uint Ofs { get { return _ofs; } }
            public MicrosoftNetworkMonitorV2 M_Root { get { return m_root; } }
            public MicrosoftNetworkMonitorV2.FrameIndex M_Parent { get { return m_parent; } }
        }
        private bool f_frameTable;
        private FrameIndex _frameTable;

        /// <summary>
        /// Index that is used to access individual captured frames
        /// </summary>
        public FrameIndex FrameTable
        {
            get
            {
                if (f_frameTable)
                    return _frameTable;
                f_frameTable = true;
                long _pos = m_io.Pos;
                m_io.Seek(FrameTableOfs);
                __raw_frameTable = m_io.ReadBytes(FrameTableLen);
                var io___raw_frameTable = new KaitaiStream(__raw_frameTable);
                _frameTable = new FrameIndex(io___raw_frameTable, this, m_root);
                m_io.Seek(_pos);
                return _frameTable;
            }
        }
        private byte[] _signature;
        private byte _versionMinor;
        private byte _versionMajor;
        private Linktype _macType;
        private WindowsSystemtime _timeCaptureStart;
        private uint _frameTableOfs;
        private uint _frameTableLen;
        private uint _userDataOfs;
        private uint _userDataLen;
        private uint _commentOfs;
        private uint _commentLen;
        private uint _statisticsOfs;
        private uint _statisticsLen;
        private uint _networkInfoOfs;
        private uint _networkInfoLen;
        private uint _conversationStatsOfs;
        private uint _conversationStatsLen;
        private MicrosoftNetworkMonitorV2 m_root;
        private KaitaiStruct m_parent;
        private byte[] __raw_frameTable;
        public byte[] Signature { get { return _signature; } }

        /// <summary>
        /// Format version (minor), BCD
        /// </summary>
        public byte VersionMinor { get { return _versionMinor; } }

        /// <summary>
        /// Format version (major), BCD
        /// </summary>
        public byte VersionMajor { get { return _versionMajor; } }

        /// <summary>
        /// Network topology type of captured data
        /// </summary>
        public Linktype MacType { get { return _macType; } }

        /// <summary>
        /// Timestamp of capture start
        /// </summary>
        public WindowsSystemtime TimeCaptureStart { get { return _timeCaptureStart; } }
        public uint FrameTableOfs { get { return _frameTableOfs; } }
        public uint FrameTableLen { get { return _frameTableLen; } }
        public uint UserDataOfs { get { return _userDataOfs; } }
        public uint UserDataLen { get { return _userDataLen; } }
        public uint CommentOfs { get { return _commentOfs; } }
        public uint CommentLen { get { return _commentLen; } }
        public uint StatisticsOfs { get { return _statisticsOfs; } }
        public uint StatisticsLen { get { return _statisticsLen; } }
        public uint NetworkInfoOfs { get { return _networkInfoOfs; } }
        public uint NetworkInfoLen { get { return _networkInfoLen; } }
        public uint ConversationStatsOfs { get { return _conversationStatsOfs; } }
        public uint ConversationStatsLen { get { return _conversationStatsLen; } }
        public MicrosoftNetworkMonitorV2 M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
        public byte[] M_RawFrameTable { get { return __raw_frameTable; } }
    }
}

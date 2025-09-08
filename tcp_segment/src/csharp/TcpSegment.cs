// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// TCP is one of the core Internet protocols on transport layer (AKA
    /// OSI layer 4), providing stateful connections with error checking,
    /// guarantees of delivery, order of segments and avoidance of duplicate
    /// delivery.
    /// </summary>
    public partial class TcpSegment : KaitaiStruct
    {
        public static TcpSegment FromFile(string fileName)
        {
            return new TcpSegment(new KaitaiStream(fileName));
        }

        public TcpSegment(KaitaiStream p__io, KaitaiStruct p__parent = null, TcpSegment p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _srcPort = m_io.ReadU2be();
            _dstPort = m_io.ReadU2be();
            _seqNum = m_io.ReadU4be();
            _ackNum = m_io.ReadU4be();
            _dataOffset = m_io.ReadBitsIntBe(4);
            _reserved = m_io.ReadBitsIntBe(4);
            m_io.AlignToByte();
            _flags = new Flags(m_io, this, m_root);
            _windowSize = m_io.ReadU2be();
            _checksum = m_io.ReadU2be();
            _urgentPointer = m_io.ReadU2be();
            if (DataOffset * 4 - 20 != 0) {
                _options = m_io.ReadBytes(DataOffset * 4 - 20);
            }
            _body = m_io.ReadBytesFull();
        }

        /// <summary>
        /// TCP header flags as defined &quot;TCP Header Flags&quot; registry.
        /// </summary>
        public partial class Flags : KaitaiStruct
        {
            public static Flags FromFile(string fileName)
            {
                return new Flags(new KaitaiStream(fileName));
            }

            public Flags(KaitaiStream p__io, TcpSegment p__parent = null, TcpSegment p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _cwr = m_io.ReadBitsIntBe(1) != 0;
                _ece = m_io.ReadBitsIntBe(1) != 0;
                _urg = m_io.ReadBitsIntBe(1) != 0;
                _ack = m_io.ReadBitsIntBe(1) != 0;
                _psh = m_io.ReadBitsIntBe(1) != 0;
                _rst = m_io.ReadBitsIntBe(1) != 0;
                _syn = m_io.ReadBitsIntBe(1) != 0;
                _fin = m_io.ReadBitsIntBe(1) != 0;
            }
            private bool _cwr;
            private bool _ece;
            private bool _urg;
            private bool _ack;
            private bool _psh;
            private bool _rst;
            private bool _syn;
            private bool _fin;
            private TcpSegment m_root;
            private TcpSegment m_parent;

            /// <summary>
            /// Congestion Window Reduced
            /// </summary>
            public bool Cwr { get { return _cwr; } }

            /// <summary>
            /// ECN-Echo
            /// </summary>
            public bool Ece { get { return _ece; } }

            /// <summary>
            /// Urgent pointer field is significant
            /// </summary>
            public bool Urg { get { return _urg; } }

            /// <summary>
            /// Acknowledgment field is significant
            /// </summary>
            public bool Ack { get { return _ack; } }

            /// <summary>
            /// Push function
            /// </summary>
            public bool Psh { get { return _psh; } }

            /// <summary>
            /// Reset the connection
            /// </summary>
            public bool Rst { get { return _rst; } }

            /// <summary>
            /// Synchronize sequence numbers
            /// </summary>
            public bool Syn { get { return _syn; } }

            /// <summary>
            /// No more data from sender
            /// </summary>
            public bool Fin { get { return _fin; } }
            public TcpSegment M_Root { get { return m_root; } }
            public TcpSegment M_Parent { get { return m_parent; } }

            public override string ToString()
            {
                return (((((((Cwr ? "|CWR" : "") + (Ece ? "|ECE" : "")) + (Urg ? "|URG" : "")) + (Ack ? "|ACK" : "")) + (Psh ? "|PSH" : "")) + (Rst ? "|RST" : "")) + (Syn ? "|SYN" : "")) + (Fin ? "|FIN" : "");
            }
        }
        private ushort _srcPort;
        private ushort _dstPort;
        private uint _seqNum;
        private uint _ackNum;
        private ulong _dataOffset;
        private ulong _reserved;
        private Flags _flags;
        private ushort _windowSize;
        private ushort _checksum;
        private ushort _urgentPointer;
        private byte[] _options;
        private byte[] _body;
        private TcpSegment m_root;
        private KaitaiStruct m_parent;

        /// <summary>
        /// Source port
        /// </summary>
        public ushort SrcPort { get { return _srcPort; } }

        /// <summary>
        /// Destination port
        /// </summary>
        public ushort DstPort { get { return _dstPort; } }

        /// <summary>
        /// Sequence number
        /// </summary>
        public uint SeqNum { get { return _seqNum; } }

        /// <summary>
        /// Acknowledgment number
        /// </summary>
        public uint AckNum { get { return _ackNum; } }

        /// <summary>
        /// Data offset (in 32-bit words from the beginning of this type, normally 32 or can be extended if there are any TCP options or padding is present)
        /// </summary>
        public ulong DataOffset { get { return _dataOffset; } }
        public ulong Reserved { get { return _reserved; } }
        public Flags Flags { get { return _flags; } }
        public ushort WindowSize { get { return _windowSize; } }
        public ushort Checksum { get { return _checksum; } }
        public ushort UrgentPointer { get { return _urgentPointer; } }
        public byte[] Options { get { return _options; } }
        public byte[] Body { get { return _body; } }
        public TcpSegment M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

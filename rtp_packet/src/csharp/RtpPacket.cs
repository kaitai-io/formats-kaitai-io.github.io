// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild



namespace Kaitai
{

    /// <summary>
    /// The Real-time Transport Protocol (RTP) is a widely used network
    /// protocol for transmitting audio or video. It usually works with the
    /// RTP Control Protocol (RTCP). The transmission can be based on
    /// Transmission Control Protocol (TCP) or User Datagram Protocol (UDP).
    /// </summary>
    public partial class RtpPacket : KaitaiStruct
    {
        public static RtpPacket FromFile(string fileName)
        {
            return new RtpPacket(new KaitaiStream(fileName));
        }


        public enum PayloadTypeEnum
        {
            Pcmu = 0,
            Reserved1 = 1,
            Reserved2 = 2,
            Gsm = 3,
            G723 = 4,
            Dvi41 = 5,
            Dvi42 = 6,
            Lpc = 7,
            Pama = 8,
            G722 = 9,
            L161 = 10,
            L162 = 11,
            Qcelp = 12,
            Cn = 13,
            Mpa = 14,
            G728 = 15,
            Dvi43 = 16,
            Dvi44 = 17,
            G729 = 18,
            Reserved19 = 19,
            Unassigned20 = 20,
            Unassigned21 = 21,
            Unassigned22 = 22,
            Unassigned23 = 23,
            Unassigned24 = 24,
            Celb = 25,
            Jpeg = 26,
            Unassigned27 = 27,
            Nv = 28,
            Unassigned29 = 29,
            Unassigned30 = 30,
            H261 = 31,
            Mpv = 32,
            Mp2t = 33,
            H263 = 34,
            MpegPs = 96,
        }
        public RtpPacket(KaitaiStream p__io, KaitaiStruct p__parent = null, RtpPacket p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            f_lenPaddingIfExists = false;
            f_lenPadding = false;
            _read();
        }
        private void _read()
        {
            _version = m_io.ReadBitsIntBe(2);
            _hasPadding = m_io.ReadBitsIntBe(1) != 0;
            _hasExtension = m_io.ReadBitsIntBe(1) != 0;
            _csrcCount = m_io.ReadBitsIntBe(4);
            _marker = m_io.ReadBitsIntBe(1) != 0;
            _payloadType = ((PayloadTypeEnum) m_io.ReadBitsIntBe(7));
            m_io.AlignToByte();
            _sequenceNumber = m_io.ReadU2be();
            _timestamp = m_io.ReadU4be();
            _ssrc = m_io.ReadU4be();
            if (HasExtension) {
                _headerExtension = new HeaderExtention(m_io, this, m_root);
            }
            _data = m_io.ReadBytes(((M_Io.Size - M_Io.Pos) - LenPadding));
            _padding = m_io.ReadBytes(LenPadding);
        }
        public partial class HeaderExtention : KaitaiStruct
        {
            public static HeaderExtention FromFile(string fileName)
            {
                return new HeaderExtention(new KaitaiStream(fileName));
            }

            public HeaderExtention(KaitaiStream p__io, RtpPacket p__parent = null, RtpPacket p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _id = m_io.ReadU2be();
                _length = m_io.ReadU2be();
            }
            private ushort _id;
            private ushort _length;
            private RtpPacket m_root;
            private RtpPacket m_parent;
            public ushort Id { get { return _id; } }
            public ushort Length { get { return _length; } }
            public RtpPacket M_Root { get { return m_root; } }
            public RtpPacket M_Parent { get { return m_parent; } }
        }
        private bool f_lenPaddingIfExists;
        private byte? _lenPaddingIfExists;

        /// <summary>
        /// If padding bit is enabled, last byte of data contains number of
        /// bytes appended to the payload as padding.
        /// </summary>
        public byte? LenPaddingIfExists
        {
            get
            {
                if (f_lenPaddingIfExists)
                    return _lenPaddingIfExists;
                if (HasPadding) {
                    long _pos = m_io.Pos;
                    m_io.Seek((M_Io.Size - 1));
                    _lenPaddingIfExists = m_io.ReadU1();
                    m_io.Seek(_pos);
                    f_lenPaddingIfExists = true;
                }
                return _lenPaddingIfExists;
            }
        }
        private bool f_lenPadding;
        private byte _lenPadding;

        /// <summary>
        /// Always returns number of padding bytes to in the payload.
        /// </summary>
        public byte LenPadding
        {
            get
            {
                if (f_lenPadding)
                    return _lenPadding;
                _lenPadding = (byte) ((HasPadding ? LenPaddingIfExists : 0));
                f_lenPadding = true;
                return _lenPadding;
            }
        }
        private ulong _version;
        private bool _hasPadding;
        private bool _hasExtension;
        private ulong _csrcCount;
        private bool _marker;
        private PayloadTypeEnum _payloadType;
        private ushort _sequenceNumber;
        private uint _timestamp;
        private uint _ssrc;
        private HeaderExtention _headerExtension;
        private byte[] _data;
        private byte[] _padding;
        private RtpPacket m_root;
        private KaitaiStruct m_parent;
        public ulong Version { get { return _version; } }
        public bool HasPadding { get { return _hasPadding; } }
        public bool HasExtension { get { return _hasExtension; } }
        public ulong CsrcCount { get { return _csrcCount; } }
        public bool Marker { get { return _marker; } }
        public PayloadTypeEnum PayloadType { get { return _payloadType; } }
        public ushort SequenceNumber { get { return _sequenceNumber; } }
        public uint Timestamp { get { return _timestamp; } }
        public uint Ssrc { get { return _ssrc; } }
        public HeaderExtention HeaderExtension { get { return _headerExtension; } }

        /// <summary>
        /// Payload without padding.
        /// </summary>
        public byte[] Data { get { return _data; } }
        public byte[] Padding { get { return _padding; } }
        public RtpPacket M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

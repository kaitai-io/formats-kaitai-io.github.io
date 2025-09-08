// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// RTCP is the Real-Time Control Protocol
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://www.rfc-editor.org/rfc/rfc3550">Source</a>
    /// </remarks>
    public partial class RtcpPayload : KaitaiStruct
    {
        public static RtcpPayload FromFile(string fileName)
        {
            return new RtcpPayload(new KaitaiStream(fileName));
        }


        public enum PayloadType
        {
            Fir = 192,
            Nack = 193,
            Ij = 195,
            Sr = 200,
            Rr = 201,
            Sdes = 202,
            Bye = 203,
            App = 204,
            Rtpfb = 205,
            Psfb = 206,
            Xr = 207,
            Avb = 208,
            Rsi = 209,
        }

        public enum PsfbSubtype
        {
            Pli = 1,
            Sli = 2,
            Rpsi = 3,
            Fir = 4,
            Tstr = 5,
            Tstn = 6,
            Vbcm = 7,
            Afb = 15,
        }

        public enum RtpfbSubtype
        {
            Nack = 1,
            Tmmbr = 3,
            Tmmbn = 4,
            Rrr = 5,
            TransportFeedback = 15,
        }

        public enum SdesSubtype
        {
            Pad = 0,
            Cname = 1,
            Name = 2,
            Email = 3,
            Phone = 4,
            Loc = 5,
            Tool = 6,
            Note = 7,
            Priv = 8,
        }
        public RtcpPayload(KaitaiStream p__io, KaitaiStruct p__parent = null, RtcpPayload p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _rtcpPackets = new List<RtcpPacket>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _rtcpPackets.Add(new RtcpPacket(m_io, this, m_root));
                    i++;
                }
            }
        }
        public partial class PacketStatusChunk : KaitaiStruct
        {
            public static PacketStatusChunk FromFile(string fileName)
            {
                return new PacketStatusChunk(new KaitaiStream(fileName));
            }

            public PacketStatusChunk(KaitaiStream p__io, KaitaiStruct p__parent = null, RtcpPayload p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_s = false;
                _read();
            }
            private void _read()
            {
                _t = m_io.ReadBitsIntBe(1) != 0;
                if ((T ? 1 : 0) == 0) {
                    _s2 = m_io.ReadBitsIntBe(2);
                }
                if ((T ? 1 : 0) == 1) {
                    _s1 = m_io.ReadBitsIntBe(1) != 0;
                }
                if ((T ? 1 : 0) == 0) {
                    _rle = m_io.ReadBitsIntBe(13);
                }
                if ((T ? 1 : 0) == 1) {
                    _symbolList = m_io.ReadBitsIntBe(14);
                }
            }
            private bool f_s;
            private int _s;
            public int S
            {
                get
                {
                    if (f_s)
                        return _s;
                    f_s = true;
                    _s = (int) (((T ? 1 : 0) == 0 ? S2 : ((S1 ? 1 : 0) == 0 ? 1 : 0)));
                    return _s;
                }
            }
            private bool _t;
            private ulong? _s2;
            private bool? _s1;
            private ulong? _rle;
            private ulong? _symbolList;
            private RtcpPayload m_root;
            private KaitaiStruct m_parent;
            public bool T { get { return _t; } }
            public ulong? S2 { get { return _s2; } }
            public bool? S1 { get { return _s1; } }
            public ulong? Rle { get { return _rle; } }
            public ulong? SymbolList { get { return _symbolList; } }
            public RtcpPayload M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class PsfbAfbPacket : KaitaiStruct
        {
            public static PsfbAfbPacket FromFile(string fileName)
            {
                return new PsfbAfbPacket(new KaitaiStream(fileName));
            }

            public PsfbAfbPacket(KaitaiStream p__io, RtcpPayload.PsfbPacket p__parent = null, RtcpPayload p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _uid = m_io.ReadU4be();
                switch (Uid) {
                case 1380273474: {
                    __raw_contents = m_io.ReadBytesFull();
                    var io___raw_contents = new KaitaiStream(__raw_contents);
                    _contents = new PsfbAfbRembPacket(io___raw_contents, this, m_root);
                    break;
                }
                default: {
                    _contents = m_io.ReadBytesFull();
                    break;
                }
                }
            }
            private uint _uid;
            private object _contents;
            private RtcpPayload m_root;
            private RtcpPayload.PsfbPacket m_parent;
            private byte[] __raw_contents;
            public uint Uid { get { return _uid; } }
            public object Contents { get { return _contents; } }
            public RtcpPayload M_Root { get { return m_root; } }
            public RtcpPayload.PsfbPacket M_Parent { get { return m_parent; } }
            public byte[] M_RawContents { get { return __raw_contents; } }
        }
        public partial class PsfbAfbRembPacket : KaitaiStruct
        {
            public static PsfbAfbRembPacket FromFile(string fileName)
            {
                return new PsfbAfbRembPacket(new KaitaiStream(fileName));
            }

            public PsfbAfbRembPacket(KaitaiStream p__io, RtcpPayload.PsfbAfbPacket p__parent = null, RtcpPayload p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_maxTotalBitrate = false;
                _read();
            }
            private void _read()
            {
                _numSsrc = m_io.ReadU1();
                _brExp = m_io.ReadBitsIntBe(6);
                _brMantissa = m_io.ReadBitsIntBe(18);
                m_io.AlignToByte();
                _ssrcList = new List<uint>();
                for (var i = 0; i < NumSsrc; i++)
                {
                    _ssrcList.Add(m_io.ReadU4be());
                }
            }
            private bool f_maxTotalBitrate;
            private int _maxTotalBitrate;
            public int MaxTotalBitrate
            {
                get
                {
                    if (f_maxTotalBitrate)
                        return _maxTotalBitrate;
                    f_maxTotalBitrate = true;
                    _maxTotalBitrate = (int) (BrMantissa * (1 << BrExp));
                    return _maxTotalBitrate;
                }
            }
            private byte _numSsrc;
            private ulong _brExp;
            private ulong _brMantissa;
            private List<uint> _ssrcList;
            private RtcpPayload m_root;
            private RtcpPayload.PsfbAfbPacket m_parent;
            public byte NumSsrc { get { return _numSsrc; } }
            public ulong BrExp { get { return _brExp; } }
            public ulong BrMantissa { get { return _brMantissa; } }
            public List<uint> SsrcList { get { return _ssrcList; } }
            public RtcpPayload M_Root { get { return m_root; } }
            public RtcpPayload.PsfbAfbPacket M_Parent { get { return m_parent; } }
        }
        public partial class PsfbPacket : KaitaiStruct
        {
            public static PsfbPacket FromFile(string fileName)
            {
                return new PsfbPacket(new KaitaiStream(fileName));
            }

            public PsfbPacket(KaitaiStream p__io, RtcpPayload.RtcpPacket p__parent = null, RtcpPayload p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_fmt = false;
                _read();
            }
            private void _read()
            {
                _ssrc = m_io.ReadU4be();
                _ssrcMediaSource = m_io.ReadU4be();
                switch (Fmt) {
                case RtcpPayload.PsfbSubtype.Afb: {
                    __raw_fciBlock = m_io.ReadBytesFull();
                    var io___raw_fciBlock = new KaitaiStream(__raw_fciBlock);
                    _fciBlock = new PsfbAfbPacket(io___raw_fciBlock, this, m_root);
                    break;
                }
                default: {
                    _fciBlock = m_io.ReadBytesFull();
                    break;
                }
                }
            }
            private bool f_fmt;
            private PsfbSubtype _fmt;
            public PsfbSubtype Fmt
            {
                get
                {
                    if (f_fmt)
                        return _fmt;
                    f_fmt = true;
                    _fmt = (PsfbSubtype) (((RtcpPayload.PsfbSubtype) M_Parent.Subtype));
                    return _fmt;
                }
            }
            private uint _ssrc;
            private uint _ssrcMediaSource;
            private object _fciBlock;
            private RtcpPayload m_root;
            private RtcpPayload.RtcpPacket m_parent;
            private byte[] __raw_fciBlock;
            public uint Ssrc { get { return _ssrc; } }
            public uint SsrcMediaSource { get { return _ssrcMediaSource; } }
            public object FciBlock { get { return _fciBlock; } }
            public RtcpPayload M_Root { get { return m_root; } }
            public RtcpPayload.RtcpPacket M_Parent { get { return m_parent; } }
            public byte[] M_RawFciBlock { get { return __raw_fciBlock; } }
        }
        public partial class ReportBlock : KaitaiStruct
        {
            public static ReportBlock FromFile(string fileName)
            {
                return new ReportBlock(new KaitaiStream(fileName));
            }

            public ReportBlock(KaitaiStream p__io, KaitaiStruct p__parent = null, RtcpPayload p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_cumulativePacketsLost = false;
                f_fractionLost = false;
                _read();
            }
            private void _read()
            {
                _ssrcSource = m_io.ReadU4be();
                _lostVal = m_io.ReadU1();
                _highestSeqNumReceived = m_io.ReadU4be();
                _interarrivalJitter = m_io.ReadU4be();
                _lsr = m_io.ReadU4be();
                _dlsr = m_io.ReadU4be();
            }
            private bool f_cumulativePacketsLost;
            private int _cumulativePacketsLost;
            public int CumulativePacketsLost
            {
                get
                {
                    if (f_cumulativePacketsLost)
                        return _cumulativePacketsLost;
                    f_cumulativePacketsLost = true;
                    _cumulativePacketsLost = (int) (LostVal & 16777215);
                    return _cumulativePacketsLost;
                }
            }
            private bool f_fractionLost;
            private int _fractionLost;
            public int FractionLost
            {
                get
                {
                    if (f_fractionLost)
                        return _fractionLost;
                    f_fractionLost = true;
                    _fractionLost = (int) (LostVal >> 24);
                    return _fractionLost;
                }
            }
            private uint _ssrcSource;
            private byte _lostVal;
            private uint _highestSeqNumReceived;
            private uint _interarrivalJitter;
            private uint _lsr;
            private uint _dlsr;
            private RtcpPayload m_root;
            private KaitaiStruct m_parent;
            public uint SsrcSource { get { return _ssrcSource; } }
            public byte LostVal { get { return _lostVal; } }
            public uint HighestSeqNumReceived { get { return _highestSeqNumReceived; } }
            public uint InterarrivalJitter { get { return _interarrivalJitter; } }
            public uint Lsr { get { return _lsr; } }
            public uint Dlsr { get { return _dlsr; } }
            public RtcpPayload M_Root { get { return m_root; } }
            public KaitaiStruct M_Parent { get { return m_parent; } }
        }
        public partial class RrPacket : KaitaiStruct
        {
            public static RrPacket FromFile(string fileName)
            {
                return new RrPacket(new KaitaiStream(fileName));
            }

            public RrPacket(KaitaiStream p__io, RtcpPayload.RtcpPacket p__parent = null, RtcpPayload p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _ssrc = m_io.ReadU4be();
                _reportBlock = new List<ReportBlock>();
                for (var i = 0; i < M_Parent.Subtype; i++)
                {
                    _reportBlock.Add(new ReportBlock(m_io, this, m_root));
                }
            }
            private uint _ssrc;
            private List<ReportBlock> _reportBlock;
            private RtcpPayload m_root;
            private RtcpPayload.RtcpPacket m_parent;
            public uint Ssrc { get { return _ssrc; } }
            public List<ReportBlock> ReportBlock { get { return _reportBlock; } }
            public RtcpPayload M_Root { get { return m_root; } }
            public RtcpPayload.RtcpPacket M_Parent { get { return m_parent; } }
        }
        public partial class RtcpPacket : KaitaiStruct
        {
            public static RtcpPacket FromFile(string fileName)
            {
                return new RtcpPacket(new KaitaiStream(fileName));
            }

            public RtcpPacket(KaitaiStream p__io, RtcpPayload p__parent = null, RtcpPayload p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _version = m_io.ReadBitsIntBe(2);
                _padding = m_io.ReadBitsIntBe(1) != 0;
                _subtype = m_io.ReadBitsIntBe(5);
                m_io.AlignToByte();
                _payloadType = ((RtcpPayload.PayloadType) m_io.ReadU1());
                _length = m_io.ReadU2be();
                switch (PayloadType) {
                case RtcpPayload.PayloadType.Psfb: {
                    __raw_body = m_io.ReadBytes(4 * Length);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new PsfbPacket(io___raw_body, this, m_root);
                    break;
                }
                case RtcpPayload.PayloadType.Rr: {
                    __raw_body = m_io.ReadBytes(4 * Length);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new RrPacket(io___raw_body, this, m_root);
                    break;
                }
                case RtcpPayload.PayloadType.Rtpfb: {
                    __raw_body = m_io.ReadBytes(4 * Length);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new RtpfbPacket(io___raw_body, this, m_root);
                    break;
                }
                case RtcpPayload.PayloadType.Sdes: {
                    __raw_body = m_io.ReadBytes(4 * Length);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SdesPacket(io___raw_body, this, m_root);
                    break;
                }
                case RtcpPayload.PayloadType.Sr: {
                    __raw_body = m_io.ReadBytes(4 * Length);
                    var io___raw_body = new KaitaiStream(__raw_body);
                    _body = new SrPacket(io___raw_body, this, m_root);
                    break;
                }
                default: {
                    _body = m_io.ReadBytes(4 * Length);
                    break;
                }
                }
            }
            private ulong _version;
            private bool _padding;
            private ulong _subtype;
            private PayloadType _payloadType;
            private ushort _length;
            private object _body;
            private RtcpPayload m_root;
            private RtcpPayload m_parent;
            private byte[] __raw_body;
            public ulong Version { get { return _version; } }
            public bool Padding { get { return _padding; } }
            public ulong Subtype { get { return _subtype; } }
            public PayloadType PayloadType { get { return _payloadType; } }
            public ushort Length { get { return _length; } }
            public object Body { get { return _body; } }
            public RtcpPayload M_Root { get { return m_root; } }
            public RtcpPayload M_Parent { get { return m_parent; } }
            public byte[] M_RawBody { get { return __raw_body; } }
        }
        public partial class RtpfbPacket : KaitaiStruct
        {
            public static RtpfbPacket FromFile(string fileName)
            {
                return new RtpfbPacket(new KaitaiStream(fileName));
            }

            public RtpfbPacket(KaitaiStream p__io, RtcpPayload.RtcpPacket p__parent = null, RtcpPayload p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_fmt = false;
                _read();
            }
            private void _read()
            {
                _ssrc = m_io.ReadU4be();
                _ssrcMediaSource = m_io.ReadU4be();
                switch (Fmt) {
                case RtcpPayload.RtpfbSubtype.TransportFeedback: {
                    __raw_fciBlock = m_io.ReadBytesFull();
                    var io___raw_fciBlock = new KaitaiStream(__raw_fciBlock);
                    _fciBlock = new RtpfbTransportFeedbackPacket(io___raw_fciBlock, this, m_root);
                    break;
                }
                default: {
                    _fciBlock = m_io.ReadBytesFull();
                    break;
                }
                }
            }
            private bool f_fmt;
            private RtpfbSubtype _fmt;
            public RtpfbSubtype Fmt
            {
                get
                {
                    if (f_fmt)
                        return _fmt;
                    f_fmt = true;
                    _fmt = (RtpfbSubtype) (((RtcpPayload.RtpfbSubtype) M_Parent.Subtype));
                    return _fmt;
                }
            }
            private uint _ssrc;
            private uint _ssrcMediaSource;
            private object _fciBlock;
            private RtcpPayload m_root;
            private RtcpPayload.RtcpPacket m_parent;
            private byte[] __raw_fciBlock;
            public uint Ssrc { get { return _ssrc; } }
            public uint SsrcMediaSource { get { return _ssrcMediaSource; } }
            public object FciBlock { get { return _fciBlock; } }
            public RtcpPayload M_Root { get { return m_root; } }
            public RtcpPayload.RtcpPacket M_Parent { get { return m_parent; } }
            public byte[] M_RawFciBlock { get { return __raw_fciBlock; } }
        }
        public partial class RtpfbTransportFeedbackPacket : KaitaiStruct
        {
            public static RtpfbTransportFeedbackPacket FromFile(string fileName)
            {
                return new RtpfbTransportFeedbackPacket(new KaitaiStream(fileName));
            }

            public RtpfbTransportFeedbackPacket(KaitaiStream p__io, RtcpPayload.RtpfbPacket p__parent = null, RtcpPayload p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_fbPktCount = false;
                f_packetStatus = false;
                f_recvDelta = false;
                f_referenceTime = false;
                _read();
            }
            private void _read()
            {
                _baseSequenceNumber = m_io.ReadU2be();
                _packetStatusCount = m_io.ReadU2be();
                _b4 = m_io.ReadU4be();
                _remaining = m_io.ReadBytesFull();
            }
            private bool f_fbPktCount;
            private int _fbPktCount;
            public int FbPktCount
            {
                get
                {
                    if (f_fbPktCount)
                        return _fbPktCount;
                    f_fbPktCount = true;
                    _fbPktCount = (int) (B4 & 255);
                    return _fbPktCount;
                }
            }
            private bool f_packetStatus;
            private byte[] _packetStatus;
            public byte[] PacketStatus
            {
                get
                {
                    if (f_packetStatus)
                        return _packetStatus;
                    f_packetStatus = true;
                    _packetStatus = m_io.ReadBytes(0);
                    return _packetStatus;
                }
            }
            private bool f_recvDelta;
            private byte[] _recvDelta;
            public byte[] RecvDelta
            {
                get
                {
                    if (f_recvDelta)
                        return _recvDelta;
                    f_recvDelta = true;
                    _recvDelta = m_io.ReadBytes(0);
                    return _recvDelta;
                }
            }
            private bool f_referenceTime;
            private int _referenceTime;
            public int ReferenceTime
            {
                get
                {
                    if (f_referenceTime)
                        return _referenceTime;
                    f_referenceTime = true;
                    _referenceTime = (int) (B4 >> 8);
                    return _referenceTime;
                }
            }
            private ushort _baseSequenceNumber;
            private ushort _packetStatusCount;
            private uint _b4;
            private byte[] _remaining;
            private RtcpPayload m_root;
            private RtcpPayload.RtpfbPacket m_parent;
            public ushort BaseSequenceNumber { get { return _baseSequenceNumber; } }
            public ushort PacketStatusCount { get { return _packetStatusCount; } }
            public uint B4 { get { return _b4; } }
            public byte[] Remaining { get { return _remaining; } }
            public RtcpPayload M_Root { get { return m_root; } }
            public RtcpPayload.RtpfbPacket M_Parent { get { return m_parent; } }
        }
        public partial class SdesPacket : KaitaiStruct
        {
            public static SdesPacket FromFile(string fileName)
            {
                return new SdesPacket(new KaitaiStream(fileName));
            }

            public SdesPacket(KaitaiStream p__io, RtcpPayload.RtcpPacket p__parent = null, RtcpPayload p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_sourceCount = false;
                _read();
            }
            private void _read()
            {
                _sourceChunk = new List<SourceChunk>();
                for (var i = 0; i < SourceCount; i++)
                {
                    _sourceChunk.Add(new SourceChunk(m_io, this, m_root));
                }
            }
            private bool f_sourceCount;
            private ulong _sourceCount;
            public ulong SourceCount
            {
                get
                {
                    if (f_sourceCount)
                        return _sourceCount;
                    f_sourceCount = true;
                    _sourceCount = (ulong) (M_Parent.Subtype);
                    return _sourceCount;
                }
            }
            private List<SourceChunk> _sourceChunk;
            private RtcpPayload m_root;
            private RtcpPayload.RtcpPacket m_parent;
            public List<SourceChunk> SourceChunk { get { return _sourceChunk; } }
            public RtcpPayload M_Root { get { return m_root; } }
            public RtcpPayload.RtcpPacket M_Parent { get { return m_parent; } }
        }
        public partial class SdesTlv : KaitaiStruct
        {
            public static SdesTlv FromFile(string fileName)
            {
                return new SdesTlv(new KaitaiStream(fileName));
            }

            public SdesTlv(KaitaiStream p__io, RtcpPayload.SourceChunk p__parent = null, RtcpPayload p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _type = ((RtcpPayload.SdesSubtype) m_io.ReadU1());
                if (Type != RtcpPayload.SdesSubtype.Pad) {
                    _length = m_io.ReadU1();
                }
                if (Type != RtcpPayload.SdesSubtype.Pad) {
                    _value = m_io.ReadBytes(Length);
                }
            }
            private SdesSubtype _type;
            private byte? _length;
            private byte[] _value;
            private RtcpPayload m_root;
            private RtcpPayload.SourceChunk m_parent;
            public SdesSubtype Type { get { return _type; } }
            public byte? Length { get { return _length; } }
            public byte[] Value { get { return _value; } }
            public RtcpPayload M_Root { get { return m_root; } }
            public RtcpPayload.SourceChunk M_Parent { get { return m_parent; } }
        }
        public partial class SourceChunk : KaitaiStruct
        {
            public static SourceChunk FromFile(string fileName)
            {
                return new SourceChunk(new KaitaiStream(fileName));
            }

            public SourceChunk(KaitaiStream p__io, RtcpPayload.SdesPacket p__parent = null, RtcpPayload p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _ssrc = m_io.ReadU4be();
                _sdesTlv = new List<SdesTlv>();
                {
                    var i = 0;
                    while (!m_io.IsEof) {
                        _sdesTlv.Add(new SdesTlv(m_io, this, m_root));
                        i++;
                    }
                }
            }
            private uint _ssrc;
            private List<SdesTlv> _sdesTlv;
            private RtcpPayload m_root;
            private RtcpPayload.SdesPacket m_parent;
            public uint Ssrc { get { return _ssrc; } }
            public List<SdesTlv> SdesTlv { get { return _sdesTlv; } }
            public RtcpPayload M_Root { get { return m_root; } }
            public RtcpPayload.SdesPacket M_Parent { get { return m_parent; } }
        }
        public partial class SrPacket : KaitaiStruct
        {
            public static SrPacket FromFile(string fileName)
            {
                return new SrPacket(new KaitaiStream(fileName));
            }

            public SrPacket(KaitaiStream p__io, RtcpPayload.RtcpPacket p__parent = null, RtcpPayload p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_ntp = false;
                _read();
            }
            private void _read()
            {
                _ssrc = m_io.ReadU4be();
                _ntpMsw = m_io.ReadU4be();
                _ntpLsw = m_io.ReadU4be();
                _rtpTimestamp = m_io.ReadU4be();
                _senderPacketCount = m_io.ReadU4be();
                _senderOctetCount = m_io.ReadU4be();
                _reportBlock = new List<ReportBlock>();
                for (var i = 0; i < M_Parent.Subtype; i++)
                {
                    _reportBlock.Add(new ReportBlock(m_io, this, m_root));
                }
            }
            private bool f_ntp;
            private int _ntp;
            public int Ntp
            {
                get
                {
                    if (f_ntp)
                        return _ntp;
                    f_ntp = true;
                    _ntp = (int) (NtpMsw << 32 & NtpLsw);
                    return _ntp;
                }
            }
            private uint _ssrc;
            private uint _ntpMsw;
            private uint _ntpLsw;
            private uint _rtpTimestamp;
            private uint _senderPacketCount;
            private uint _senderOctetCount;
            private List<ReportBlock> _reportBlock;
            private RtcpPayload m_root;
            private RtcpPayload.RtcpPacket m_parent;
            public uint Ssrc { get { return _ssrc; } }
            public uint NtpMsw { get { return _ntpMsw; } }
            public uint NtpLsw { get { return _ntpLsw; } }
            public uint RtpTimestamp { get { return _rtpTimestamp; } }
            public uint SenderPacketCount { get { return _senderPacketCount; } }
            public uint SenderOctetCount { get { return _senderOctetCount; } }
            public List<ReportBlock> ReportBlock { get { return _reportBlock; } }
            public RtcpPayload M_Root { get { return m_root; } }
            public RtcpPayload.RtcpPacket M_Parent { get { return m_parent; } }
        }
        private List<RtcpPacket> _rtcpPackets;
        private RtcpPayload m_root;
        private KaitaiStruct m_parent;
        public List<RtcpPacket> RtcpPackets { get { return _rtcpPackets; } }
        public RtcpPayload M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

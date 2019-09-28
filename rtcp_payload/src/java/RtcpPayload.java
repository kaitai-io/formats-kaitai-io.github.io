// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;


/**
 * RTCP is the Real-Time Control Protocol
 * @see <a href="https://tools.ietf.org/html/rfc3550">Source</a>
 */
public class RtcpPayload extends KaitaiStruct {
    public static RtcpPayload fromFile(String fileName) throws IOException {
        return new RtcpPayload(new ByteBufferKaitaiStream(fileName));
    }

    public enum PayloadType {
        FIR(192),
        NACK(193),
        IJ(195),
        SR(200),
        RR(201),
        SDES(202),
        BYE(203),
        APP(204),
        RTPFB(205),
        PSFB(206),
        XR(207),
        AVB(208),
        RSI(209);

        private final long id;
        PayloadType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, PayloadType> byId = new HashMap<Long, PayloadType>(13);
        static {
            for (PayloadType e : PayloadType.values())
                byId.put(e.id(), e);
        }
        public static PayloadType byId(long id) { return byId.get(id); }
    }

    public enum SdesSubtype {
        PAD(0),
        CNAME(1),
        NAME(2),
        EMAIL(3),
        PHONE(4),
        LOC(5),
        TOOL(6),
        NOTE(7),
        PRIV(8);

        private final long id;
        SdesSubtype(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, SdesSubtype> byId = new HashMap<Long, SdesSubtype>(9);
        static {
            for (SdesSubtype e : SdesSubtype.values())
                byId.put(e.id(), e);
        }
        public static SdesSubtype byId(long id) { return byId.get(id); }
    }

    public enum PsfbSubtype {
        PLI(1),
        SLI(2),
        RPSI(3),
        FIR(4),
        TSTR(5),
        TSTN(6),
        VBCM(7),
        AFB(15);

        private final long id;
        PsfbSubtype(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, PsfbSubtype> byId = new HashMap<Long, PsfbSubtype>(8);
        static {
            for (PsfbSubtype e : PsfbSubtype.values())
                byId.put(e.id(), e);
        }
        public static PsfbSubtype byId(long id) { return byId.get(id); }
    }

    public enum RtpfbSubtype {
        NACK(1),
        TMMBR(3),
        TMMBN(4),
        RRR(5),
        TRANSPORT_FEEDBACK(15);

        private final long id;
        RtpfbSubtype(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, RtpfbSubtype> byId = new HashMap<Long, RtpfbSubtype>(5);
        static {
            for (RtpfbSubtype e : RtpfbSubtype.values())
                byId.put(e.id(), e);
        }
        public static RtpfbSubtype byId(long id) { return byId.get(id); }
    }

    public RtcpPayload(KaitaiStream _io) {
        this(_io, null, null);
    }

    public RtcpPayload(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public RtcpPayload(KaitaiStream _io, KaitaiStruct _parent, RtcpPayload _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.rtcpPackets = new ArrayList<RtcpPacket>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.rtcpPackets.add(new RtcpPacket(this._io, this, _root));
                i++;
            }
        }
    }
    public static class PsfbAfbRembPacket extends KaitaiStruct {
        public static PsfbAfbRembPacket fromFile(String fileName) throws IOException {
            return new PsfbAfbRembPacket(new ByteBufferKaitaiStream(fileName));
        }

        public PsfbAfbRembPacket(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PsfbAfbRembPacket(KaitaiStream _io, RtcpPayload.PsfbAfbPacket _parent) {
            this(_io, _parent, null);
        }

        public PsfbAfbRembPacket(KaitaiStream _io, RtcpPayload.PsfbAfbPacket _parent, RtcpPayload _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.numSsrc = this._io.readU1();
            this.brExp = this._io.readBitsInt(6);
            this.brMantissa = this._io.readBitsInt(18);
            this._io.alignToByte();
            ssrcList = new ArrayList<Long>(((Number) (numSsrc())).intValue());
            for (int i = 0; i < numSsrc(); i++) {
                this.ssrcList.add(this._io.readU4be());
            }
        }
        private Integer maxTotalBitrate;
        public Integer maxTotalBitrate() {
            if (this.maxTotalBitrate != null)
                return this.maxTotalBitrate;
            int _tmp = (int) ((brMantissa() * (1 << brExp())));
            this.maxTotalBitrate = _tmp;
            return this.maxTotalBitrate;
        }
        private int numSsrc;
        private long brExp;
        private long brMantissa;
        private ArrayList<Long> ssrcList;
        private RtcpPayload _root;
        private RtcpPayload.PsfbAfbPacket _parent;
        public int numSsrc() { return numSsrc; }
        public long brExp() { return brExp; }
        public long brMantissa() { return brMantissa; }
        public ArrayList<Long> ssrcList() { return ssrcList; }
        public RtcpPayload _root() { return _root; }
        public RtcpPayload.PsfbAfbPacket _parent() { return _parent; }
    }
    public static class SrPacket extends KaitaiStruct {
        public static SrPacket fromFile(String fileName) throws IOException {
            return new SrPacket(new ByteBufferKaitaiStream(fileName));
        }

        public SrPacket(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SrPacket(KaitaiStream _io, RtcpPayload.RtcpPacket _parent) {
            this(_io, _parent, null);
        }

        public SrPacket(KaitaiStream _io, RtcpPayload.RtcpPacket _parent, RtcpPayload _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.ssrc = this._io.readU4be();
            this.ntpMsw = this._io.readU4be();
            this.ntpLsw = this._io.readU4be();
            this.rtpTimestamp = this._io.readU4be();
            this.senderPacketCount = this._io.readU4be();
            this.senderOctetCount = this._io.readU4be();
            reportBlock = new ArrayList<ReportBlock>(((Number) (_parent().subtype())).intValue());
            for (int i = 0; i < _parent().subtype(); i++) {
                this.reportBlock.add(new ReportBlock(this._io, this, _root));
            }
        }
        private Integer ntp;
        public Integer ntp() {
            if (this.ntp != null)
                return this.ntp;
            int _tmp = (int) (((ntpMsw() << 32) & ntpLsw()));
            this.ntp = _tmp;
            return this.ntp;
        }
        private long ssrc;
        private long ntpMsw;
        private long ntpLsw;
        private long rtpTimestamp;
        private long senderPacketCount;
        private long senderOctetCount;
        private ArrayList<ReportBlock> reportBlock;
        private RtcpPayload _root;
        private RtcpPayload.RtcpPacket _parent;
        public long ssrc() { return ssrc; }
        public long ntpMsw() { return ntpMsw; }
        public long ntpLsw() { return ntpLsw; }
        public long rtpTimestamp() { return rtpTimestamp; }
        public long senderPacketCount() { return senderPacketCount; }
        public long senderOctetCount() { return senderOctetCount; }
        public ArrayList<ReportBlock> reportBlock() { return reportBlock; }
        public RtcpPayload _root() { return _root; }
        public RtcpPayload.RtcpPacket _parent() { return _parent; }
    }
    public static class RrPacket extends KaitaiStruct {
        public static RrPacket fromFile(String fileName) throws IOException {
            return new RrPacket(new ByteBufferKaitaiStream(fileName));
        }

        public RrPacket(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RrPacket(KaitaiStream _io, RtcpPayload.RtcpPacket _parent) {
            this(_io, _parent, null);
        }

        public RrPacket(KaitaiStream _io, RtcpPayload.RtcpPacket _parent, RtcpPayload _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.ssrc = this._io.readU4be();
            reportBlock = new ArrayList<ReportBlock>(((Number) (_parent().subtype())).intValue());
            for (int i = 0; i < _parent().subtype(); i++) {
                this.reportBlock.add(new ReportBlock(this._io, this, _root));
            }
        }
        private long ssrc;
        private ArrayList<ReportBlock> reportBlock;
        private RtcpPayload _root;
        private RtcpPayload.RtcpPacket _parent;
        public long ssrc() { return ssrc; }
        public ArrayList<ReportBlock> reportBlock() { return reportBlock; }
        public RtcpPayload _root() { return _root; }
        public RtcpPayload.RtcpPacket _parent() { return _parent; }
    }
    public static class RtcpPacket extends KaitaiStruct {
        public static RtcpPacket fromFile(String fileName) throws IOException {
            return new RtcpPacket(new ByteBufferKaitaiStream(fileName));
        }

        public RtcpPacket(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RtcpPacket(KaitaiStream _io, RtcpPayload _parent) {
            this(_io, _parent, null);
        }

        public RtcpPacket(KaitaiStream _io, RtcpPayload _parent, RtcpPayload _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.version = this._io.readBitsInt(2);
            this.padding = this._io.readBitsInt(1) != 0;
            this.subtype = this._io.readBitsInt(5);
            this._io.alignToByte();
            this.payloadType = RtcpPayload.PayloadType.byId(this._io.readU1());
            this.length = this._io.readU2be();
            {
                PayloadType on = payloadType();
                if (on != null) {
                    switch (payloadType()) {
                    case SR: {
                        this._raw_body = this._io.readBytes((4 * length()));
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new SrPacket(_io__raw_body, this, _root);
                        break;
                    }
                    case PSFB: {
                        this._raw_body = this._io.readBytes((4 * length()));
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new PsfbPacket(_io__raw_body, this, _root);
                        break;
                    }
                    case RR: {
                        this._raw_body = this._io.readBytes((4 * length()));
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new RrPacket(_io__raw_body, this, _root);
                        break;
                    }
                    case RTPFB: {
                        this._raw_body = this._io.readBytes((4 * length()));
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new RtpfbPacket(_io__raw_body, this, _root);
                        break;
                    }
                    case SDES: {
                        this._raw_body = this._io.readBytes((4 * length()));
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                        this.body = new SdesPacket(_io__raw_body, this, _root);
                        break;
                    }
                    default: {
                        this.body = this._io.readBytes((4 * length()));
                        break;
                    }
                    }
                } else {
                    this.body = this._io.readBytes((4 * length()));
                }
            }
        }
        private long version;
        private boolean padding;
        private long subtype;
        private PayloadType payloadType;
        private int length;
        private Object body;
        private RtcpPayload _root;
        private RtcpPayload _parent;
        private byte[] _raw_body;
        public long version() { return version; }
        public boolean padding() { return padding; }
        public long subtype() { return subtype; }
        public PayloadType payloadType() { return payloadType; }
        public int length() { return length; }
        public Object body() { return body; }
        public RtcpPayload _root() { return _root; }
        public RtcpPayload _parent() { return _parent; }
        public byte[] _raw_body() { return _raw_body; }
    }
    public static class SdesTlv extends KaitaiStruct {
        public static SdesTlv fromFile(String fileName) throws IOException {
            return new SdesTlv(new ByteBufferKaitaiStream(fileName));
        }

        public SdesTlv(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SdesTlv(KaitaiStream _io, RtcpPayload.SourceChunk _parent) {
            this(_io, _parent, null);
        }

        public SdesTlv(KaitaiStream _io, RtcpPayload.SourceChunk _parent, RtcpPayload _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.type = RtcpPayload.SdesSubtype.byId(this._io.readU1());
            if (type() != RtcpPayload.SdesSubtype.PAD) {
                this.length = this._io.readU1();
            }
            if (type() != RtcpPayload.SdesSubtype.PAD) {
                this.value = this._io.readBytes(length());
            }
        }
        private SdesSubtype type;
        private Integer length;
        private byte[] value;
        private RtcpPayload _root;
        private RtcpPayload.SourceChunk _parent;
        public SdesSubtype type() { return type; }
        public Integer length() { return length; }
        public byte[] value() { return value; }
        public RtcpPayload _root() { return _root; }
        public RtcpPayload.SourceChunk _parent() { return _parent; }
    }
    public static class ReportBlock extends KaitaiStruct {
        public static ReportBlock fromFile(String fileName) throws IOException {
            return new ReportBlock(new ByteBufferKaitaiStream(fileName));
        }

        public ReportBlock(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ReportBlock(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public ReportBlock(KaitaiStream _io, KaitaiStruct _parent, RtcpPayload _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.ssrcSource = this._io.readU4be();
            this.lostVal = this._io.readU1();
            this.highestSeqNumReceived = this._io.readU4be();
            this.interarrivalJitter = this._io.readU4be();
            this.lsr = this._io.readU4be();
            this.dlsr = this._io.readU4be();
        }
        private Integer fractionLost;
        public Integer fractionLost() {
            if (this.fractionLost != null)
                return this.fractionLost;
            int _tmp = (int) ((lostVal() >> 24));
            this.fractionLost = _tmp;
            return this.fractionLost;
        }
        private Integer cumulativePacketsLost;
        public Integer cumulativePacketsLost() {
            if (this.cumulativePacketsLost != null)
                return this.cumulativePacketsLost;
            int _tmp = (int) ((lostVal() & 16777215));
            this.cumulativePacketsLost = _tmp;
            return this.cumulativePacketsLost;
        }
        private long ssrcSource;
        private int lostVal;
        private long highestSeqNumReceived;
        private long interarrivalJitter;
        private long lsr;
        private long dlsr;
        private RtcpPayload _root;
        private KaitaiStruct _parent;
        public long ssrcSource() { return ssrcSource; }
        public int lostVal() { return lostVal; }
        public long highestSeqNumReceived() { return highestSeqNumReceived; }
        public long interarrivalJitter() { return interarrivalJitter; }
        public long lsr() { return lsr; }
        public long dlsr() { return dlsr; }
        public RtcpPayload _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class RtpfbTransportFeedbackPacket extends KaitaiStruct {
        public static RtpfbTransportFeedbackPacket fromFile(String fileName) throws IOException {
            return new RtpfbTransportFeedbackPacket(new ByteBufferKaitaiStream(fileName));
        }

        public RtpfbTransportFeedbackPacket(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RtpfbTransportFeedbackPacket(KaitaiStream _io, RtcpPayload.RtpfbPacket _parent) {
            this(_io, _parent, null);
        }

        public RtpfbTransportFeedbackPacket(KaitaiStream _io, RtcpPayload.RtpfbPacket _parent, RtcpPayload _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.baseSequenceNumber = this._io.readU2be();
            this.packetStatusCount = this._io.readU2be();
            this.b4 = this._io.readU4be();
            this.remaining = this._io.readBytesFull();
        }
        private Integer referenceTime;
        public Integer referenceTime() {
            if (this.referenceTime != null)
                return this.referenceTime;
            int _tmp = (int) ((b4() >> 8));
            this.referenceTime = _tmp;
            return this.referenceTime;
        }
        private Integer fbPktCount;
        public Integer fbPktCount() {
            if (this.fbPktCount != null)
                return this.fbPktCount;
            int _tmp = (int) ((b4() & 255));
            this.fbPktCount = _tmp;
            return this.fbPktCount;
        }
        private byte[] packetStatus;
        public byte[] packetStatus() {
            if (this.packetStatus != null)
                return this.packetStatus;
            this.packetStatus = this._io.readBytes(0);
            return this.packetStatus;
        }
        private byte[] recvDelta;
        public byte[] recvDelta() {
            if (this.recvDelta != null)
                return this.recvDelta;
            this.recvDelta = this._io.readBytes(0);
            return this.recvDelta;
        }
        private int baseSequenceNumber;
        private int packetStatusCount;
        private long b4;
        private byte[] remaining;
        private RtcpPayload _root;
        private RtcpPayload.RtpfbPacket _parent;
        public int baseSequenceNumber() { return baseSequenceNumber; }
        public int packetStatusCount() { return packetStatusCount; }
        public long b4() { return b4; }
        public byte[] remaining() { return remaining; }
        public RtcpPayload _root() { return _root; }
        public RtcpPayload.RtpfbPacket _parent() { return _parent; }
    }
    public static class PsfbPacket extends KaitaiStruct {
        public static PsfbPacket fromFile(String fileName) throws IOException {
            return new PsfbPacket(new ByteBufferKaitaiStream(fileName));
        }

        public PsfbPacket(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PsfbPacket(KaitaiStream _io, RtcpPayload.RtcpPacket _parent) {
            this(_io, _parent, null);
        }

        public PsfbPacket(KaitaiStream _io, RtcpPayload.RtcpPacket _parent, RtcpPayload _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.ssrc = this._io.readU4be();
            this.ssrcMediaSource = this._io.readU4be();
            {
                PsfbSubtype on = fmt();
                if (on != null) {
                    switch (fmt()) {
                    case AFB: {
                        this._raw_fciBlock = this._io.readBytesFull();
                        KaitaiStream _io__raw_fciBlock = new ByteBufferKaitaiStream(_raw_fciBlock);
                        this.fciBlock = new PsfbAfbPacket(_io__raw_fciBlock, this, _root);
                        break;
                    }
                    default: {
                        this.fciBlock = this._io.readBytesFull();
                        break;
                    }
                    }
                } else {
                    this.fciBlock = this._io.readBytesFull();
                }
            }
        }
        private PsfbSubtype fmt;
        public PsfbSubtype fmt() {
            if (this.fmt != null)
                return this.fmt;
            this.fmt = RtcpPayload.PsfbSubtype.byId(_parent().subtype());
            return this.fmt;
        }
        private long ssrc;
        private long ssrcMediaSource;
        private Object fciBlock;
        private RtcpPayload _root;
        private RtcpPayload.RtcpPacket _parent;
        private byte[] _raw_fciBlock;
        public long ssrc() { return ssrc; }
        public long ssrcMediaSource() { return ssrcMediaSource; }
        public Object fciBlock() { return fciBlock; }
        public RtcpPayload _root() { return _root; }
        public RtcpPayload.RtcpPacket _parent() { return _parent; }
        public byte[] _raw_fciBlock() { return _raw_fciBlock; }
    }
    public static class SourceChunk extends KaitaiStruct {
        public static SourceChunk fromFile(String fileName) throws IOException {
            return new SourceChunk(new ByteBufferKaitaiStream(fileName));
        }

        public SourceChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SourceChunk(KaitaiStream _io, RtcpPayload.SdesPacket _parent) {
            this(_io, _parent, null);
        }

        public SourceChunk(KaitaiStream _io, RtcpPayload.SdesPacket _parent, RtcpPayload _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.ssrc = this._io.readU4be();
            this.sdesTlv = new ArrayList<SdesTlv>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.sdesTlv.add(new SdesTlv(this._io, this, _root));
                    i++;
                }
            }
        }
        private long ssrc;
        private ArrayList<SdesTlv> sdesTlv;
        private RtcpPayload _root;
        private RtcpPayload.SdesPacket _parent;
        public long ssrc() { return ssrc; }
        public ArrayList<SdesTlv> sdesTlv() { return sdesTlv; }
        public RtcpPayload _root() { return _root; }
        public RtcpPayload.SdesPacket _parent() { return _parent; }
    }
    public static class SdesPacket extends KaitaiStruct {
        public static SdesPacket fromFile(String fileName) throws IOException {
            return new SdesPacket(new ByteBufferKaitaiStream(fileName));
        }

        public SdesPacket(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SdesPacket(KaitaiStream _io, RtcpPayload.RtcpPacket _parent) {
            this(_io, _parent, null);
        }

        public SdesPacket(KaitaiStream _io, RtcpPayload.RtcpPacket _parent, RtcpPayload _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            sourceChunk = new ArrayList<SourceChunk>(((Number) (sourceCount())).intValue());
            for (int i = 0; i < sourceCount(); i++) {
                this.sourceChunk.add(new SourceChunk(this._io, this, _root));
            }
        }
        private Long sourceCount;
        public Long sourceCount() {
            if (this.sourceCount != null)
                return this.sourceCount;
            long _tmp = (long) (_parent().subtype());
            this.sourceCount = _tmp;
            return this.sourceCount;
        }
        private ArrayList<SourceChunk> sourceChunk;
        private RtcpPayload _root;
        private RtcpPayload.RtcpPacket _parent;
        public ArrayList<SourceChunk> sourceChunk() { return sourceChunk; }
        public RtcpPayload _root() { return _root; }
        public RtcpPayload.RtcpPacket _parent() { return _parent; }
    }
    public static class RtpfbPacket extends KaitaiStruct {
        public static RtpfbPacket fromFile(String fileName) throws IOException {
            return new RtpfbPacket(new ByteBufferKaitaiStream(fileName));
        }

        public RtpfbPacket(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RtpfbPacket(KaitaiStream _io, RtcpPayload.RtcpPacket _parent) {
            this(_io, _parent, null);
        }

        public RtpfbPacket(KaitaiStream _io, RtcpPayload.RtcpPacket _parent, RtcpPayload _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.ssrc = this._io.readU4be();
            this.ssrcMediaSource = this._io.readU4be();
            {
                RtpfbSubtype on = fmt();
                if (on != null) {
                    switch (fmt()) {
                    case TRANSPORT_FEEDBACK: {
                        this._raw_fciBlock = this._io.readBytesFull();
                        KaitaiStream _io__raw_fciBlock = new ByteBufferKaitaiStream(_raw_fciBlock);
                        this.fciBlock = new RtpfbTransportFeedbackPacket(_io__raw_fciBlock, this, _root);
                        break;
                    }
                    default: {
                        this.fciBlock = this._io.readBytesFull();
                        break;
                    }
                    }
                } else {
                    this.fciBlock = this._io.readBytesFull();
                }
            }
        }
        private RtpfbSubtype fmt;
        public RtpfbSubtype fmt() {
            if (this.fmt != null)
                return this.fmt;
            this.fmt = RtcpPayload.RtpfbSubtype.byId(_parent().subtype());
            return this.fmt;
        }
        private long ssrc;
        private long ssrcMediaSource;
        private Object fciBlock;
        private RtcpPayload _root;
        private RtcpPayload.RtcpPacket _parent;
        private byte[] _raw_fciBlock;
        public long ssrc() { return ssrc; }
        public long ssrcMediaSource() { return ssrcMediaSource; }
        public Object fciBlock() { return fciBlock; }
        public RtcpPayload _root() { return _root; }
        public RtcpPayload.RtcpPacket _parent() { return _parent; }
        public byte[] _raw_fciBlock() { return _raw_fciBlock; }
    }
    public static class PacketStatusChunk extends KaitaiStruct {
        public static PacketStatusChunk fromFile(String fileName) throws IOException {
            return new PacketStatusChunk(new ByteBufferKaitaiStream(fileName));
        }

        public PacketStatusChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PacketStatusChunk(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public PacketStatusChunk(KaitaiStream _io, KaitaiStruct _parent, RtcpPayload _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.t = this._io.readBitsInt(1) != 0;
            if ((t() ? 1 : 0) == 0) {
                this.s2 = this._io.readBitsInt(2);
            }
            if ((t() ? 1 : 0) == 1) {
                this.s1 = this._io.readBitsInt(1) != 0;
            }
            if ((t() ? 1 : 0) == 0) {
                this.rle = this._io.readBitsInt(13);
            }
            if ((t() ? 1 : 0) == 1) {
                this.symbolList = this._io.readBitsInt(14);
            }
        }
        private Integer s;
        public Integer s() {
            if (this.s != null)
                return this.s;
            int _tmp = (int) (((t() ? 1 : 0) == 0 ? s2() : ((s1() ? 1 : 0) == 0 ? 1 : 0)));
            this.s = _tmp;
            return this.s;
        }
        private boolean t;
        private Long s2;
        private Boolean s1;
        private Long rle;
        private Long symbolList;
        private RtcpPayload _root;
        private KaitaiStruct _parent;
        public boolean t() { return t; }
        public Long s2() { return s2; }
        public Boolean s1() { return s1; }
        public Long rle() { return rle; }
        public Long symbolList() { return symbolList; }
        public RtcpPayload _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class PsfbAfbPacket extends KaitaiStruct {
        public static PsfbAfbPacket fromFile(String fileName) throws IOException {
            return new PsfbAfbPacket(new ByteBufferKaitaiStream(fileName));
        }

        public PsfbAfbPacket(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PsfbAfbPacket(KaitaiStream _io, RtcpPayload.PsfbPacket _parent) {
            this(_io, _parent, null);
        }

        public PsfbAfbPacket(KaitaiStream _io, RtcpPayload.PsfbPacket _parent, RtcpPayload _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.uid = this._io.readU4be();
            switch (uid()) {
            case 1380273474: {
                this._raw_contents = this._io.readBytesFull();
                KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(_raw_contents);
                this.contents = new PsfbAfbRembPacket(_io__raw_contents, this, _root);
                break;
            }
            default: {
                this.contents = this._io.readBytesFull();
                break;
            }
            }
        }
        private long uid;
        private Object contents;
        private RtcpPayload _root;
        private RtcpPayload.PsfbPacket _parent;
        private byte[] _raw_contents;
        public long uid() { return uid; }
        public Object contents() { return contents; }
        public RtcpPayload _root() { return _root; }
        public RtcpPayload.PsfbPacket _parent() { return _parent; }
        public byte[] _raw_contents() { return _raw_contents; }
    }
    private ArrayList<RtcpPacket> rtcpPackets;
    private RtcpPayload _root;
    private KaitaiStruct _parent;
    public ArrayList<RtcpPacket> rtcpPackets() { return rtcpPackets; }
    public RtcpPayload _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

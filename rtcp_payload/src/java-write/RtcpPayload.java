// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;


/**
 * RTCP is the Real-Time Control Protocol
 * @see <a href="https://www.rfc-editor.org/rfc/rfc3550">Source</a>
 */
public class RtcpPayload extends KaitaiStruct.ReadWrite {
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
    public RtcpPayload() {
        this(null, null, null);
    }

    public RtcpPayload(KaitaiStream _io) {
        this(_io, null, null);
    }

    public RtcpPayload(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public RtcpPayload(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, RtcpPayload _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.rtcpPackets = new ArrayList<RtcpPacket>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                RtcpPacket _t_rtcpPackets = new RtcpPacket(this._io, this, _root);
                try {
                    _t_rtcpPackets._read();
                } finally {
                    this.rtcpPackets.add(_t_rtcpPackets);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.rtcpPackets.size(); i++) {
            this.rtcpPackets.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        for (int i = 0; i < this.rtcpPackets.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("rtcp_packets", 0, this._io.size() - this._io.pos());
            this.rtcpPackets.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("rtcp_packets", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        for (int i = 0; i < this.rtcpPackets.size(); i++) {
            if (!Objects.equals(this.rtcpPackets.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("rtcp_packets", _root(), this.rtcpPackets.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.rtcpPackets.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("rtcp_packets", this, this.rtcpPackets.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class PacketStatusChunk extends KaitaiStruct.ReadWrite {
        public static PacketStatusChunk fromFile(String fileName) throws IOException {
            return new PacketStatusChunk(new ByteBufferKaitaiStream(fileName));
        }
        public PacketStatusChunk() {
            this(null, null, null);
        }

        public PacketStatusChunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PacketStatusChunk(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public PacketStatusChunk(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, RtcpPayload _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.t = this._io.readBitsIntBe(1) != 0;
            if ((t() ? 1 : 0) == 0) {
                this.s2 = this._io.readBitsIntBe(2);
            }
            if ((t() ? 1 : 0) == 1) {
                this.s1 = this._io.readBitsIntBe(1) != 0;
            }
            if ((t() ? 1 : 0) == 0) {
                this.rle = this._io.readBitsIntBe(13);
            }
            if ((t() ? 1 : 0) == 1) {
                this.symbolList = this._io.readBitsIntBe(14);
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if ((t() ? 1 : 0) == 0) {
            }
            if ((t() ? 1 : 0) == 1) {
            }
            if ((t() ? 1 : 0) == 0) {
            }
            if ((t() ? 1 : 0) == 1) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(1, (this.t ? 1 : 0));
            if ((t() ? 1 : 0) == 0) {
                this._io.writeBitsIntBe(2, this.s2);
            }
            if ((t() ? 1 : 0) == 1) {
                this._io.writeBitsIntBe(1, (this.s1 ? 1 : 0));
            }
            if ((t() ? 1 : 0) == 0) {
                this._io.writeBitsIntBe(13, this.rle);
            }
            if ((t() ? 1 : 0) == 1) {
                this._io.writeBitsIntBe(14, this.symbolList);
            }
        }

        public void _check() {
            if ((t() ? 1 : 0) == 0) {
            }
            if ((t() ? 1 : 0) == 1) {
            }
            if ((t() ? 1 : 0) == 0) {
            }
            if ((t() ? 1 : 0) == 1) {
            }
            _dirty = false;
        }
        private Integer s;
        public Integer s() {
            if (this.s != null)
                return this.s;
            this.s = ((Number) (((t() ? 1 : 0) == 0 ? s2() : ((s1() ? 1 : 0) == 0 ? 1 : 0)))).intValue();
            return this.s;
        }
        public void _invalidateS() { this.s = null; }
        private boolean t;
        private Long s2;
        private Boolean s1;
        private Long rle;
        private Long symbolList;
        private RtcpPayload _root;
        private KaitaiStruct.ReadWrite _parent;
        public boolean t() { return t; }
        public void setT(boolean _v) { _dirty = true; t = _v; }
        public Long s2() { return s2; }
        public void setS2(Long _v) { _dirty = true; s2 = _v; }
        public Boolean s1() { return s1; }
        public void setS1(Boolean _v) { _dirty = true; s1 = _v; }
        public Long rle() { return rle; }
        public void setRle(Long _v) { _dirty = true; rle = _v; }
        public Long symbolList() { return symbolList; }
        public void setSymbolList(Long _v) { _dirty = true; symbolList = _v; }
        public RtcpPayload _root() { return _root; }
        public void set_root(RtcpPayload _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class PsfbAfbPacket extends KaitaiStruct.ReadWrite {
        public static PsfbAfbPacket fromFile(String fileName) throws IOException {
            return new PsfbAfbPacket(new ByteBufferKaitaiStream(fileName));
        }
        public PsfbAfbPacket() {
            this(null, null, null);
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
        }
        public void _read() {
            this.uid = this._io.readU4be();
            switch (uid()) {
            case 1380273474: {
                this._raw_contents = this._io.readBytesFull();
                KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(this._raw_contents);
                this.contents = new PsfbAfbRembPacket(_io__raw_contents, this, _root);
                ((PsfbAfbRembPacket) (this.contents))._read();
                break;
            }
            default: {
                this.contents = this._io.readBytesFull();
                break;
            }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            switch (uid()) {
            case 1380273474: {
                ((PsfbAfbRembPacket) (this.contents))._fetchInstances();
                break;
            }
            default: {
                break;
            }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.uid);
            switch (uid()) {
            case 1380273474: {
                final KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(this._io.size() - this._io.pos());
                this._io.addChildStream(_io__raw_contents);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (this._io.size() - this._io.pos()));
                    final PsfbAfbPacket _this = this;
                    _io__raw_contents.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_contents = _io__raw_contents.toByteArray();
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_contents)))));
                            if (!(parent.isEof()))
                                throw new ConsistencyError("raw(contents)", 0, parent.size() - parent.pos());
                        }
                    });
                }
                ((PsfbAfbRembPacket) (this.contents))._write_Seq(_io__raw_contents);
                break;
            }
            default: {
                this._io.writeBytes(((byte[]) (((byte[]) (this.contents)))));
                if (!(this._io.isEof()))
                    throw new ConsistencyError("contents", 0, this._io.size() - this._io.pos());
                break;
            }
            }
        }

        public void _check() {
            switch (uid()) {
            case 1380273474: {
                if (!Objects.equals(((RtcpPayload.PsfbAfbRembPacket) (this.contents))._root(), _root()))
                    throw new ConsistencyError("contents", _root(), ((RtcpPayload.PsfbAfbRembPacket) (this.contents))._root());
                if (!Objects.equals(((RtcpPayload.PsfbAfbRembPacket) (this.contents))._parent(), this))
                    throw new ConsistencyError("contents", this, ((RtcpPayload.PsfbAfbRembPacket) (this.contents))._parent());
                break;
            }
            default: {
                break;
            }
            }
            _dirty = false;
        }
        private long uid;
        private Object contents;
        private RtcpPayload _root;
        private RtcpPayload.PsfbPacket _parent;
        private byte[] _raw_contents;
        public long uid() { return uid; }
        public void setUid(long _v) { _dirty = true; uid = _v; }
        public Object contents() { return contents; }
        public void setContents(Object _v) { _dirty = true; contents = _v; }
        public RtcpPayload _root() { return _root; }
        public void set_root(RtcpPayload _v) { _dirty = true; _root = _v; }
        public RtcpPayload.PsfbPacket _parent() { return _parent; }
        public void set_parent(RtcpPayload.PsfbPacket _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_contents() { return _raw_contents; }
        public void set_raw_Contents(byte[] _v) { _dirty = true; _raw_contents = _v; }
    }
    public static class PsfbAfbRembPacket extends KaitaiStruct.ReadWrite {
        public static PsfbAfbRembPacket fromFile(String fileName) throws IOException {
            return new PsfbAfbRembPacket(new ByteBufferKaitaiStream(fileName));
        }
        public PsfbAfbRembPacket() {
            this(null, null, null);
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
        }
        public void _read() {
            this.numSsrc = this._io.readU1();
            this.brExp = this._io.readBitsIntBe(6);
            this.brMantissa = this._io.readBitsIntBe(18);
            this.ssrcList = new ArrayList<Long>();
            for (int i = 0; i < numSsrc(); i++) {
                this.ssrcList.add(this._io.readU4be());
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.ssrcList.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.numSsrc);
            this._io.writeBitsIntBe(6, this.brExp);
            this._io.writeBitsIntBe(18, this.brMantissa);
            for (int i = 0; i < this.ssrcList.size(); i++) {
                this._io.writeU4be(this.ssrcList.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (this.ssrcList.size() != numSsrc())
                throw new ConsistencyError("ssrc_list", numSsrc(), this.ssrcList.size());
            for (int i = 0; i < this.ssrcList.size(); i++) {
            }
            _dirty = false;
        }
        private Integer maxTotalBitrate;
        public Integer maxTotalBitrate() {
            if (this.maxTotalBitrate != null)
                return this.maxTotalBitrate;
            this.maxTotalBitrate = ((Number) (brMantissa() * (1 << brExp()))).intValue();
            return this.maxTotalBitrate;
        }
        public void _invalidateMaxTotalBitrate() { this.maxTotalBitrate = null; }
        private int numSsrc;
        private long brExp;
        private long brMantissa;
        private List<Long> ssrcList;
        private RtcpPayload _root;
        private RtcpPayload.PsfbAfbPacket _parent;
        public int numSsrc() { return numSsrc; }
        public void setNumSsrc(int _v) { _dirty = true; numSsrc = _v; }
        public long brExp() { return brExp; }
        public void setBrExp(long _v) { _dirty = true; brExp = _v; }
        public long brMantissa() { return brMantissa; }
        public void setBrMantissa(long _v) { _dirty = true; brMantissa = _v; }
        public List<Long> ssrcList() { return ssrcList; }
        public void setSsrcList(List<Long> _v) { _dirty = true; ssrcList = _v; }
        public RtcpPayload _root() { return _root; }
        public void set_root(RtcpPayload _v) { _dirty = true; _root = _v; }
        public RtcpPayload.PsfbAfbPacket _parent() { return _parent; }
        public void set_parent(RtcpPayload.PsfbAfbPacket _v) { _dirty = true; _parent = _v; }
    }
    public static class PsfbPacket extends KaitaiStruct.ReadWrite {
        public static PsfbPacket fromFile(String fileName) throws IOException {
            return new PsfbPacket(new ByteBufferKaitaiStream(fileName));
        }
        public PsfbPacket() {
            this(null, null, null);
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
        }
        public void _read() {
            this.ssrc = this._io.readU4be();
            this.ssrcMediaSource = this._io.readU4be();
            {
                PsfbSubtype on = fmt();
                if (on != null) {
                    switch (fmt()) {
                    case AFB: {
                        this._raw_fciBlock = this._io.readBytesFull();
                        KaitaiStream _io__raw_fciBlock = new ByteBufferKaitaiStream(this._raw_fciBlock);
                        this.fciBlock = new PsfbAfbPacket(_io__raw_fciBlock, this, _root);
                        ((PsfbAfbPacket) (this.fciBlock))._read();
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
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                PsfbSubtype on = fmt();
                if (on != null) {
                    switch (fmt()) {
                    case AFB: {
                        ((PsfbAfbPacket) (this.fciBlock))._fetchInstances();
                        break;
                    }
                    default: {
                        break;
                    }
                    }
                } else {
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.ssrc);
            this._io.writeU4be(this.ssrcMediaSource);
            {
                PsfbSubtype on = fmt();
                if (on != null) {
                    switch (fmt()) {
                    case AFB: {
                        final KaitaiStream _io__raw_fciBlock = new ByteBufferKaitaiStream(this._io.size() - this._io.pos());
                        this._io.addChildStream(_io__raw_fciBlock);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (this._io.size() - this._io.pos()));
                            final PsfbPacket _this = this;
                            _io__raw_fciBlock.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_fciBlock = _io__raw_fciBlock.toByteArray();
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_fciBlock)))));
                                    if (!(parent.isEof()))
                                        throw new ConsistencyError("raw(fci_block)", 0, parent.size() - parent.pos());
                                }
                            });
                        }
                        ((PsfbAfbPacket) (this.fciBlock))._write_Seq(_io__raw_fciBlock);
                        break;
                    }
                    default: {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.fciBlock)))));
                        if (!(this._io.isEof()))
                            throw new ConsistencyError("fci_block", 0, this._io.size() - this._io.pos());
                        break;
                    }
                    }
                } else {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.fciBlock)))));
                    if (!(this._io.isEof()))
                        throw new ConsistencyError("fci_block", 0, this._io.size() - this._io.pos());
                }
            }
        }

        public void _check() {
            {
                PsfbSubtype on = fmt();
                if (on != null) {
                    switch (fmt()) {
                    case AFB: {
                        if (!Objects.equals(((RtcpPayload.PsfbAfbPacket) (this.fciBlock))._root(), _root()))
                            throw new ConsistencyError("fci_block", _root(), ((RtcpPayload.PsfbAfbPacket) (this.fciBlock))._root());
                        if (!Objects.equals(((RtcpPayload.PsfbAfbPacket) (this.fciBlock))._parent(), this))
                            throw new ConsistencyError("fci_block", this, ((RtcpPayload.PsfbAfbPacket) (this.fciBlock))._parent());
                        break;
                    }
                    default: {
                        break;
                    }
                    }
                } else {
                }
            }
            _dirty = false;
        }
        private PsfbSubtype fmt;
        public PsfbSubtype fmt() {
            if (this.fmt != null)
                return this.fmt;
            this.fmt = RtcpPayload.PsfbSubtype.byId(_parent().subtype());
            return this.fmt;
        }
        public void _invalidateFmt() { this.fmt = null; }
        private long ssrc;
        private long ssrcMediaSource;
        private Object fciBlock;
        private RtcpPayload _root;
        private RtcpPayload.RtcpPacket _parent;
        private byte[] _raw_fciBlock;
        public long ssrc() { return ssrc; }
        public void setSsrc(long _v) { _dirty = true; ssrc = _v; }
        public long ssrcMediaSource() { return ssrcMediaSource; }
        public void setSsrcMediaSource(long _v) { _dirty = true; ssrcMediaSource = _v; }
        public Object fciBlock() { return fciBlock; }
        public void setFciBlock(Object _v) { _dirty = true; fciBlock = _v; }
        public RtcpPayload _root() { return _root; }
        public void set_root(RtcpPayload _v) { _dirty = true; _root = _v; }
        public RtcpPayload.RtcpPacket _parent() { return _parent; }
        public void set_parent(RtcpPayload.RtcpPacket _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_fciBlock() { return _raw_fciBlock; }
        public void set_raw_FciBlock(byte[] _v) { _dirty = true; _raw_fciBlock = _v; }
    }
    public static class ReportBlock extends KaitaiStruct.ReadWrite {
        public static ReportBlock fromFile(String fileName) throws IOException {
            return new ReportBlock(new ByteBufferKaitaiStream(fileName));
        }
        public ReportBlock() {
            this(null, null, null);
        }

        public ReportBlock(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ReportBlock(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public ReportBlock(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, RtcpPayload _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.ssrcSource = this._io.readU4be();
            this.lostVal = this._io.readU1();
            this.highestSeqNumReceived = this._io.readU4be();
            this.interarrivalJitter = this._io.readU4be();
            this.lsr = this._io.readU4be();
            this.dlsr = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.ssrcSource);
            this._io.writeU1(this.lostVal);
            this._io.writeU4be(this.highestSeqNumReceived);
            this._io.writeU4be(this.interarrivalJitter);
            this._io.writeU4be(this.lsr);
            this._io.writeU4be(this.dlsr);
        }

        public void _check() {
            _dirty = false;
        }
        private Integer cumulativePacketsLost;
        public Integer cumulativePacketsLost() {
            if (this.cumulativePacketsLost != null)
                return this.cumulativePacketsLost;
            this.cumulativePacketsLost = ((Number) (lostVal() & 16777215)).intValue();
            return this.cumulativePacketsLost;
        }
        public void _invalidateCumulativePacketsLost() { this.cumulativePacketsLost = null; }
        private Integer fractionLost;
        public Integer fractionLost() {
            if (this.fractionLost != null)
                return this.fractionLost;
            this.fractionLost = ((Number) (lostVal() >> 24)).intValue();
            return this.fractionLost;
        }
        public void _invalidateFractionLost() { this.fractionLost = null; }
        private long ssrcSource;
        private int lostVal;
        private long highestSeqNumReceived;
        private long interarrivalJitter;
        private long lsr;
        private long dlsr;
        private RtcpPayload _root;
        private KaitaiStruct.ReadWrite _parent;
        public long ssrcSource() { return ssrcSource; }
        public void setSsrcSource(long _v) { _dirty = true; ssrcSource = _v; }
        public int lostVal() { return lostVal; }
        public void setLostVal(int _v) { _dirty = true; lostVal = _v; }
        public long highestSeqNumReceived() { return highestSeqNumReceived; }
        public void setHighestSeqNumReceived(long _v) { _dirty = true; highestSeqNumReceived = _v; }
        public long interarrivalJitter() { return interarrivalJitter; }
        public void setInterarrivalJitter(long _v) { _dirty = true; interarrivalJitter = _v; }
        public long lsr() { return lsr; }
        public void setLsr(long _v) { _dirty = true; lsr = _v; }
        public long dlsr() { return dlsr; }
        public void setDlsr(long _v) { _dirty = true; dlsr = _v; }
        public RtcpPayload _root() { return _root; }
        public void set_root(RtcpPayload _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class RrPacket extends KaitaiStruct.ReadWrite {
        public static RrPacket fromFile(String fileName) throws IOException {
            return new RrPacket(new ByteBufferKaitaiStream(fileName));
        }
        public RrPacket() {
            this(null, null, null);
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
        }
        public void _read() {
            this.ssrc = this._io.readU4be();
            this.reportBlock = new ArrayList<ReportBlock>();
            for (int i = 0; i < _parent().subtype(); i++) {
                ReportBlock _t_reportBlock = new ReportBlock(this._io, this, _root);
                try {
                    _t_reportBlock._read();
                } finally {
                    this.reportBlock.add(_t_reportBlock);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.reportBlock.size(); i++) {
                this.reportBlock.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.ssrc);
            for (int i = 0; i < this.reportBlock.size(); i++) {
                this.reportBlock.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.reportBlock.size() != _parent().subtype())
                throw new ConsistencyError("report_block", _parent().subtype(), this.reportBlock.size());
            for (int i = 0; i < this.reportBlock.size(); i++) {
                if (!Objects.equals(this.reportBlock.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("report_block", _root(), this.reportBlock.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.reportBlock.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("report_block", this, this.reportBlock.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private long ssrc;
        private List<ReportBlock> reportBlock;
        private RtcpPayload _root;
        private RtcpPayload.RtcpPacket _parent;
        public long ssrc() { return ssrc; }
        public void setSsrc(long _v) { _dirty = true; ssrc = _v; }
        public List<ReportBlock> reportBlock() { return reportBlock; }
        public void setReportBlock(List<ReportBlock> _v) { _dirty = true; reportBlock = _v; }
        public RtcpPayload _root() { return _root; }
        public void set_root(RtcpPayload _v) { _dirty = true; _root = _v; }
        public RtcpPayload.RtcpPacket _parent() { return _parent; }
        public void set_parent(RtcpPayload.RtcpPacket _v) { _dirty = true; _parent = _v; }
    }
    public static class RtcpPacket extends KaitaiStruct.ReadWrite {
        public static RtcpPacket fromFile(String fileName) throws IOException {
            return new RtcpPacket(new ByteBufferKaitaiStream(fileName));
        }
        public RtcpPacket() {
            this(null, null, null);
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
        }
        public void _read() {
            this.version = this._io.readBitsIntBe(2);
            this.padding = this._io.readBitsIntBe(1) != 0;
            this.subtype = this._io.readBitsIntBe(5);
            this.payloadType = RtcpPayload.PayloadType.byId(this._io.readU1());
            this.length = this._io.readU2be();
            {
                PayloadType on = payloadType();
                if (on != null) {
                    switch (payloadType()) {
                    case PSFB: {
                        this._raw_body = this._io.readBytes(4 * length());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new PsfbPacket(_io__raw_body, this, _root);
                        ((PsfbPacket) (this.body))._read();
                        break;
                    }
                    case RR: {
                        this._raw_body = this._io.readBytes(4 * length());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new RrPacket(_io__raw_body, this, _root);
                        ((RrPacket) (this.body))._read();
                        break;
                    }
                    case RTPFB: {
                        this._raw_body = this._io.readBytes(4 * length());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new RtpfbPacket(_io__raw_body, this, _root);
                        ((RtpfbPacket) (this.body))._read();
                        break;
                    }
                    case SDES: {
                        this._raw_body = this._io.readBytes(4 * length());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new SdesPacket(_io__raw_body, this, _root);
                        ((SdesPacket) (this.body))._read();
                        break;
                    }
                    case SR: {
                        this._raw_body = this._io.readBytes(4 * length());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new SrPacket(_io__raw_body, this, _root);
                        ((SrPacket) (this.body))._read();
                        break;
                    }
                    default: {
                        this.body = this._io.readBytes(4 * length());
                        break;
                    }
                    }
                } else {
                    this.body = this._io.readBytes(4 * length());
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                PayloadType on = payloadType();
                if (on != null) {
                    switch (payloadType()) {
                    case PSFB: {
                        ((PsfbPacket) (this.body))._fetchInstances();
                        break;
                    }
                    case RR: {
                        ((RrPacket) (this.body))._fetchInstances();
                        break;
                    }
                    case RTPFB: {
                        ((RtpfbPacket) (this.body))._fetchInstances();
                        break;
                    }
                    case SDES: {
                        ((SdesPacket) (this.body))._fetchInstances();
                        break;
                    }
                    case SR: {
                        ((SrPacket) (this.body))._fetchInstances();
                        break;
                    }
                    default: {
                        break;
                    }
                    }
                } else {
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(2, this.version);
            this._io.writeBitsIntBe(1, (this.padding ? 1 : 0));
            this._io.writeBitsIntBe(5, this.subtype);
            this._io.writeU1(((Number) (this.payloadType.id())).intValue());
            this._io.writeU2be(this.length);
            {
                PayloadType on = payloadType();
                if (on != null) {
                    switch (payloadType()) {
                    case PSFB: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(4 * length());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (4 * length()));
                            final RtcpPacket _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != 4 * length())
                                        throw new ConsistencyError("raw(body)", 4 * length(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((PsfbPacket) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case RR: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(4 * length());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (4 * length()));
                            final RtcpPacket _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != 4 * length())
                                        throw new ConsistencyError("raw(body)", 4 * length(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((RrPacket) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case RTPFB: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(4 * length());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (4 * length()));
                            final RtcpPacket _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != 4 * length())
                                        throw new ConsistencyError("raw(body)", 4 * length(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((RtpfbPacket) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case SDES: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(4 * length());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (4 * length()));
                            final RtcpPacket _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != 4 * length())
                                        throw new ConsistencyError("raw(body)", 4 * length(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((SdesPacket) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case SR: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(4 * length());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (4 * length()));
                            final RtcpPacket _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != 4 * length())
                                        throw new ConsistencyError("raw(body)", 4 * length(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((SrPacket) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    default: {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                        break;
                    }
                    }
                } else {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                }
            }
        }

        public void _check() {
            {
                PayloadType on = payloadType();
                if (on != null) {
                    switch (payloadType()) {
                    case PSFB: {
                        if (!Objects.equals(((RtcpPayload.PsfbPacket) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((RtcpPayload.PsfbPacket) (this.body))._root());
                        if (!Objects.equals(((RtcpPayload.PsfbPacket) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((RtcpPayload.PsfbPacket) (this.body))._parent());
                        break;
                    }
                    case RR: {
                        if (!Objects.equals(((RtcpPayload.RrPacket) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((RtcpPayload.RrPacket) (this.body))._root());
                        if (!Objects.equals(((RtcpPayload.RrPacket) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((RtcpPayload.RrPacket) (this.body))._parent());
                        break;
                    }
                    case RTPFB: {
                        if (!Objects.equals(((RtcpPayload.RtpfbPacket) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((RtcpPayload.RtpfbPacket) (this.body))._root());
                        if (!Objects.equals(((RtcpPayload.RtpfbPacket) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((RtcpPayload.RtpfbPacket) (this.body))._parent());
                        break;
                    }
                    case SDES: {
                        if (!Objects.equals(((RtcpPayload.SdesPacket) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((RtcpPayload.SdesPacket) (this.body))._root());
                        if (!Objects.equals(((RtcpPayload.SdesPacket) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((RtcpPayload.SdesPacket) (this.body))._parent());
                        break;
                    }
                    case SR: {
                        if (!Objects.equals(((RtcpPayload.SrPacket) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((RtcpPayload.SrPacket) (this.body))._root());
                        if (!Objects.equals(((RtcpPayload.SrPacket) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((RtcpPayload.SrPacket) (this.body))._parent());
                        break;
                    }
                    default: {
                        if (((byte[]) (this.body)).length != 4 * length())
                            throw new ConsistencyError("body", 4 * length(), ((byte[]) (this.body)).length);
                        break;
                    }
                    }
                } else {
                    if (((byte[]) (this.body)).length != 4 * length())
                        throw new ConsistencyError("body", 4 * length(), ((byte[]) (this.body)).length);
                }
            }
            _dirty = false;
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
        public void setVersion(long _v) { _dirty = true; version = _v; }
        public boolean padding() { return padding; }
        public void setPadding(boolean _v) { _dirty = true; padding = _v; }
        public long subtype() { return subtype; }
        public void setSubtype(long _v) { _dirty = true; subtype = _v; }
        public PayloadType payloadType() { return payloadType; }
        public void setPayloadType(PayloadType _v) { _dirty = true; payloadType = _v; }
        public int length() { return length; }
        public void setLength(int _v) { _dirty = true; length = _v; }
        public Object body() { return body; }
        public void setBody(Object _v) { _dirty = true; body = _v; }
        public RtcpPayload _root() { return _root; }
        public void set_root(RtcpPayload _v) { _dirty = true; _root = _v; }
        public RtcpPayload _parent() { return _parent; }
        public void set_parent(RtcpPayload _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_body() { return _raw_body; }
        public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
    }
    public static class RtpfbPacket extends KaitaiStruct.ReadWrite {
        public static RtpfbPacket fromFile(String fileName) throws IOException {
            return new RtpfbPacket(new ByteBufferKaitaiStream(fileName));
        }
        public RtpfbPacket() {
            this(null, null, null);
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
        }
        public void _read() {
            this.ssrc = this._io.readU4be();
            this.ssrcMediaSource = this._io.readU4be();
            {
                RtpfbSubtype on = fmt();
                if (on != null) {
                    switch (fmt()) {
                    case TRANSPORT_FEEDBACK: {
                        this._raw_fciBlock = this._io.readBytesFull();
                        KaitaiStream _io__raw_fciBlock = new ByteBufferKaitaiStream(this._raw_fciBlock);
                        this.fciBlock = new RtpfbTransportFeedbackPacket(_io__raw_fciBlock, this, _root);
                        ((RtpfbTransportFeedbackPacket) (this.fciBlock))._read();
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
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                RtpfbSubtype on = fmt();
                if (on != null) {
                    switch (fmt()) {
                    case TRANSPORT_FEEDBACK: {
                        ((RtpfbTransportFeedbackPacket) (this.fciBlock))._fetchInstances();
                        break;
                    }
                    default: {
                        break;
                    }
                    }
                } else {
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.ssrc);
            this._io.writeU4be(this.ssrcMediaSource);
            {
                RtpfbSubtype on = fmt();
                if (on != null) {
                    switch (fmt()) {
                    case TRANSPORT_FEEDBACK: {
                        final KaitaiStream _io__raw_fciBlock = new ByteBufferKaitaiStream(this._io.size() - this._io.pos());
                        this._io.addChildStream(_io__raw_fciBlock);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (this._io.size() - this._io.pos()));
                            final RtpfbPacket _this = this;
                            _io__raw_fciBlock.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_fciBlock = _io__raw_fciBlock.toByteArray();
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_fciBlock)))));
                                    if (!(parent.isEof()))
                                        throw new ConsistencyError("raw(fci_block)", 0, parent.size() - parent.pos());
                                }
                            });
                        }
                        ((RtpfbTransportFeedbackPacket) (this.fciBlock))._write_Seq(_io__raw_fciBlock);
                        break;
                    }
                    default: {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.fciBlock)))));
                        if (!(this._io.isEof()))
                            throw new ConsistencyError("fci_block", 0, this._io.size() - this._io.pos());
                        break;
                    }
                    }
                } else {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.fciBlock)))));
                    if (!(this._io.isEof()))
                        throw new ConsistencyError("fci_block", 0, this._io.size() - this._io.pos());
                }
            }
        }

        public void _check() {
            {
                RtpfbSubtype on = fmt();
                if (on != null) {
                    switch (fmt()) {
                    case TRANSPORT_FEEDBACK: {
                        if (!Objects.equals(((RtcpPayload.RtpfbTransportFeedbackPacket) (this.fciBlock))._root(), _root()))
                            throw new ConsistencyError("fci_block", _root(), ((RtcpPayload.RtpfbTransportFeedbackPacket) (this.fciBlock))._root());
                        if (!Objects.equals(((RtcpPayload.RtpfbTransportFeedbackPacket) (this.fciBlock))._parent(), this))
                            throw new ConsistencyError("fci_block", this, ((RtcpPayload.RtpfbTransportFeedbackPacket) (this.fciBlock))._parent());
                        break;
                    }
                    default: {
                        break;
                    }
                    }
                } else {
                }
            }
            _dirty = false;
        }
        private RtpfbSubtype fmt;
        public RtpfbSubtype fmt() {
            if (this.fmt != null)
                return this.fmt;
            this.fmt = RtcpPayload.RtpfbSubtype.byId(_parent().subtype());
            return this.fmt;
        }
        public void _invalidateFmt() { this.fmt = null; }
        private long ssrc;
        private long ssrcMediaSource;
        private Object fciBlock;
        private RtcpPayload _root;
        private RtcpPayload.RtcpPacket _parent;
        private byte[] _raw_fciBlock;
        public long ssrc() { return ssrc; }
        public void setSsrc(long _v) { _dirty = true; ssrc = _v; }
        public long ssrcMediaSource() { return ssrcMediaSource; }
        public void setSsrcMediaSource(long _v) { _dirty = true; ssrcMediaSource = _v; }
        public Object fciBlock() { return fciBlock; }
        public void setFciBlock(Object _v) { _dirty = true; fciBlock = _v; }
        public RtcpPayload _root() { return _root; }
        public void set_root(RtcpPayload _v) { _dirty = true; _root = _v; }
        public RtcpPayload.RtcpPacket _parent() { return _parent; }
        public void set_parent(RtcpPayload.RtcpPacket _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_fciBlock() { return _raw_fciBlock; }
        public void set_raw_FciBlock(byte[] _v) { _dirty = true; _raw_fciBlock = _v; }
    }
    public static class RtpfbTransportFeedbackPacket extends KaitaiStruct.ReadWrite {
        public static RtpfbTransportFeedbackPacket fromFile(String fileName) throws IOException {
            return new RtpfbTransportFeedbackPacket(new ByteBufferKaitaiStream(fileName));
        }
        public RtpfbTransportFeedbackPacket() {
            this(null, null, null);
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
        }
        public void _read() {
            this.baseSequenceNumber = this._io.readU2be();
            this.packetStatusCount = this._io.readU2be();
            this.b4 = this._io.readU4be();
            this.remaining = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
            packetStatus();
            if (this.packetStatus != null) {
            }
            recvDelta();
            if (this.recvDelta != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWritePacketStatus = _enabledPacketStatus;
            _shouldWriteRecvDelta = _enabledRecvDelta;
            this._io.writeU2be(this.baseSequenceNumber);
            this._io.writeU2be(this.packetStatusCount);
            this._io.writeU4be(this.b4);
            this._io.writeBytes(this.remaining);
            if (!(this._io.isEof()))
                throw new ConsistencyError("remaining", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (_enabledPacketStatus) {
                if (this.packetStatus.length != 0)
                    throw new ConsistencyError("packet_status", 0, this.packetStatus.length);
            }
            if (_enabledRecvDelta) {
                if (this.recvDelta.length != 0)
                    throw new ConsistencyError("recv_delta", 0, this.recvDelta.length);
            }
            _dirty = false;
        }
        private Integer fbPktCount;
        public Integer fbPktCount() {
            if (this.fbPktCount != null)
                return this.fbPktCount;
            this.fbPktCount = ((Number) (b4() & 255)).intValue();
            return this.fbPktCount;
        }
        public void _invalidateFbPktCount() { this.fbPktCount = null; }
        private byte[] packetStatus;
        private boolean _shouldWritePacketStatus = false;
        private boolean _enabledPacketStatus = true;
        public byte[] packetStatus() {
            if (_shouldWritePacketStatus)
                _writePacketStatus();
            if (this.packetStatus != null)
                return this.packetStatus;
            if (!_enabledPacketStatus)
                return null;
            this.packetStatus = this._io.readBytes(0);
            return this.packetStatus;
        }
        public void setPacketStatus(byte[] _v) { _dirty = true; packetStatus = _v; }
        public void setPacketStatus_Enabled(boolean _v) { _dirty = true; _enabledPacketStatus = _v; }

        private void _writePacketStatus() {
            _shouldWritePacketStatus = false;
            this._io.writeBytes(this.packetStatus);
        }
        private byte[] recvDelta;
        private boolean _shouldWriteRecvDelta = false;
        private boolean _enabledRecvDelta = true;
        public byte[] recvDelta() {
            if (_shouldWriteRecvDelta)
                _writeRecvDelta();
            if (this.recvDelta != null)
                return this.recvDelta;
            if (!_enabledRecvDelta)
                return null;
            this.recvDelta = this._io.readBytes(0);
            return this.recvDelta;
        }
        public void setRecvDelta(byte[] _v) { _dirty = true; recvDelta = _v; }
        public void setRecvDelta_Enabled(boolean _v) { _dirty = true; _enabledRecvDelta = _v; }

        private void _writeRecvDelta() {
            _shouldWriteRecvDelta = false;
            this._io.writeBytes(this.recvDelta);
        }
        private Integer referenceTime;
        public Integer referenceTime() {
            if (this.referenceTime != null)
                return this.referenceTime;
            this.referenceTime = ((Number) (b4() >> 8)).intValue();
            return this.referenceTime;
        }
        public void _invalidateReferenceTime() { this.referenceTime = null; }
        private int baseSequenceNumber;
        private int packetStatusCount;
        private long b4;
        private byte[] remaining;
        private RtcpPayload _root;
        private RtcpPayload.RtpfbPacket _parent;
        public int baseSequenceNumber() { return baseSequenceNumber; }
        public void setBaseSequenceNumber(int _v) { _dirty = true; baseSequenceNumber = _v; }
        public int packetStatusCount() { return packetStatusCount; }
        public void setPacketStatusCount(int _v) { _dirty = true; packetStatusCount = _v; }
        public long b4() { return b4; }
        public void setB4(long _v) { _dirty = true; b4 = _v; }
        public byte[] remaining() { return remaining; }
        public void setRemaining(byte[] _v) { _dirty = true; remaining = _v; }
        public RtcpPayload _root() { return _root; }
        public void set_root(RtcpPayload _v) { _dirty = true; _root = _v; }
        public RtcpPayload.RtpfbPacket _parent() { return _parent; }
        public void set_parent(RtcpPayload.RtpfbPacket _v) { _dirty = true; _parent = _v; }
    }
    public static class SdesPacket extends KaitaiStruct.ReadWrite {
        public static SdesPacket fromFile(String fileName) throws IOException {
            return new SdesPacket(new ByteBufferKaitaiStream(fileName));
        }
        public SdesPacket() {
            this(null, null, null);
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
        }
        public void _read() {
            this.sourceChunk = new ArrayList<SourceChunk>();
            for (int i = 0; i < sourceCount(); i++) {
                SourceChunk _t_sourceChunk = new SourceChunk(this._io, this, _root);
                try {
                    _t_sourceChunk._read();
                } finally {
                    this.sourceChunk.add(_t_sourceChunk);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.sourceChunk.size(); i++) {
                this.sourceChunk.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.sourceChunk.size(); i++) {
                this.sourceChunk.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.sourceChunk.size() != sourceCount())
                throw new ConsistencyError("source_chunk", sourceCount(), this.sourceChunk.size());
            for (int i = 0; i < this.sourceChunk.size(); i++) {
                if (!Objects.equals(this.sourceChunk.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("source_chunk", _root(), this.sourceChunk.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.sourceChunk.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("source_chunk", this, this.sourceChunk.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private Long sourceCount;
        public Long sourceCount() {
            if (this.sourceCount != null)
                return this.sourceCount;
            this.sourceCount = ((Number) (_parent().subtype())).longValue();
            return this.sourceCount;
        }
        public void _invalidateSourceCount() { this.sourceCount = null; }
        private List<SourceChunk> sourceChunk;
        private RtcpPayload _root;
        private RtcpPayload.RtcpPacket _parent;
        public List<SourceChunk> sourceChunk() { return sourceChunk; }
        public void setSourceChunk(List<SourceChunk> _v) { _dirty = true; sourceChunk = _v; }
        public RtcpPayload _root() { return _root; }
        public void set_root(RtcpPayload _v) { _dirty = true; _root = _v; }
        public RtcpPayload.RtcpPacket _parent() { return _parent; }
        public void set_parent(RtcpPayload.RtcpPacket _v) { _dirty = true; _parent = _v; }
    }
    public static class SdesTlv extends KaitaiStruct.ReadWrite {
        public static SdesTlv fromFile(String fileName) throws IOException {
            return new SdesTlv(new ByteBufferKaitaiStream(fileName));
        }
        public SdesTlv() {
            this(null, null, null);
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
        }
        public void _read() {
            this.type = RtcpPayload.SdesSubtype.byId(this._io.readU1());
            if (type() != RtcpPayload.SdesSubtype.PAD) {
                this.length = this._io.readU1();
            }
            if (type() != RtcpPayload.SdesSubtype.PAD) {
                this.value = this._io.readBytes(length());
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (type() != RtcpPayload.SdesSubtype.PAD) {
            }
            if (type() != RtcpPayload.SdesSubtype.PAD) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(((Number) (this.type.id())).intValue());
            if (type() != RtcpPayload.SdesSubtype.PAD) {
                this._io.writeU1(this.length);
            }
            if (type() != RtcpPayload.SdesSubtype.PAD) {
                this._io.writeBytes(this.value);
            }
        }

        public void _check() {
            if (type() != RtcpPayload.SdesSubtype.PAD) {
            }
            if (type() != RtcpPayload.SdesSubtype.PAD) {
                if (this.value.length != length())
                    throw new ConsistencyError("value", length(), this.value.length);
            }
            _dirty = false;
        }
        private SdesSubtype type;
        private Integer length;
        private byte[] value;
        private RtcpPayload _root;
        private RtcpPayload.SourceChunk _parent;
        public SdesSubtype type() { return type; }
        public void setType(SdesSubtype _v) { _dirty = true; type = _v; }
        public Integer length() { return length; }
        public void setLength(Integer _v) { _dirty = true; length = _v; }
        public byte[] value() { return value; }
        public void setValue(byte[] _v) { _dirty = true; value = _v; }
        public RtcpPayload _root() { return _root; }
        public void set_root(RtcpPayload _v) { _dirty = true; _root = _v; }
        public RtcpPayload.SourceChunk _parent() { return _parent; }
        public void set_parent(RtcpPayload.SourceChunk _v) { _dirty = true; _parent = _v; }
    }
    public static class SourceChunk extends KaitaiStruct.ReadWrite {
        public static SourceChunk fromFile(String fileName) throws IOException {
            return new SourceChunk(new ByteBufferKaitaiStream(fileName));
        }
        public SourceChunk() {
            this(null, null, null);
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
        }
        public void _read() {
            this.ssrc = this._io.readU4be();
            this.sdesTlv = new ArrayList<SdesTlv>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    SdesTlv _t_sdesTlv = new SdesTlv(this._io, this, _root);
                    try {
                        _t_sdesTlv._read();
                    } finally {
                        this.sdesTlv.add(_t_sdesTlv);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.sdesTlv.size(); i++) {
                this.sdesTlv.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.ssrc);
            for (int i = 0; i < this.sdesTlv.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("sdes_tlv", 0, this._io.size() - this._io.pos());
                this.sdesTlv.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("sdes_tlv", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.sdesTlv.size(); i++) {
                if (!Objects.equals(this.sdesTlv.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("sdes_tlv", _root(), this.sdesTlv.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.sdesTlv.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("sdes_tlv", this, this.sdesTlv.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private long ssrc;
        private List<SdesTlv> sdesTlv;
        private RtcpPayload _root;
        private RtcpPayload.SdesPacket _parent;
        public long ssrc() { return ssrc; }
        public void setSsrc(long _v) { _dirty = true; ssrc = _v; }
        public List<SdesTlv> sdesTlv() { return sdesTlv; }
        public void setSdesTlv(List<SdesTlv> _v) { _dirty = true; sdesTlv = _v; }
        public RtcpPayload _root() { return _root; }
        public void set_root(RtcpPayload _v) { _dirty = true; _root = _v; }
        public RtcpPayload.SdesPacket _parent() { return _parent; }
        public void set_parent(RtcpPayload.SdesPacket _v) { _dirty = true; _parent = _v; }
    }
    public static class SrPacket extends KaitaiStruct.ReadWrite {
        public static SrPacket fromFile(String fileName) throws IOException {
            return new SrPacket(new ByteBufferKaitaiStream(fileName));
        }
        public SrPacket() {
            this(null, null, null);
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
        }
        public void _read() {
            this.ssrc = this._io.readU4be();
            this.ntpMsw = this._io.readU4be();
            this.ntpLsw = this._io.readU4be();
            this.rtpTimestamp = this._io.readU4be();
            this.senderPacketCount = this._io.readU4be();
            this.senderOctetCount = this._io.readU4be();
            this.reportBlock = new ArrayList<ReportBlock>();
            for (int i = 0; i < _parent().subtype(); i++) {
                ReportBlock _t_reportBlock = new ReportBlock(this._io, this, _root);
                try {
                    _t_reportBlock._read();
                } finally {
                    this.reportBlock.add(_t_reportBlock);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.reportBlock.size(); i++) {
                this.reportBlock.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.ssrc);
            this._io.writeU4be(this.ntpMsw);
            this._io.writeU4be(this.ntpLsw);
            this._io.writeU4be(this.rtpTimestamp);
            this._io.writeU4be(this.senderPacketCount);
            this._io.writeU4be(this.senderOctetCount);
            for (int i = 0; i < this.reportBlock.size(); i++) {
                this.reportBlock.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.reportBlock.size() != _parent().subtype())
                throw new ConsistencyError("report_block", _parent().subtype(), this.reportBlock.size());
            for (int i = 0; i < this.reportBlock.size(); i++) {
                if (!Objects.equals(this.reportBlock.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("report_block", _root(), this.reportBlock.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.reportBlock.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("report_block", this, this.reportBlock.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private Integer ntp;
        public Integer ntp() {
            if (this.ntp != null)
                return this.ntp;
            this.ntp = ((Number) (ntpMsw() << 32 & ntpLsw())).intValue();
            return this.ntp;
        }
        public void _invalidateNtp() { this.ntp = null; }
        private long ssrc;
        private long ntpMsw;
        private long ntpLsw;
        private long rtpTimestamp;
        private long senderPacketCount;
        private long senderOctetCount;
        private List<ReportBlock> reportBlock;
        private RtcpPayload _root;
        private RtcpPayload.RtcpPacket _parent;
        public long ssrc() { return ssrc; }
        public void setSsrc(long _v) { _dirty = true; ssrc = _v; }
        public long ntpMsw() { return ntpMsw; }
        public void setNtpMsw(long _v) { _dirty = true; ntpMsw = _v; }
        public long ntpLsw() { return ntpLsw; }
        public void setNtpLsw(long _v) { _dirty = true; ntpLsw = _v; }
        public long rtpTimestamp() { return rtpTimestamp; }
        public void setRtpTimestamp(long _v) { _dirty = true; rtpTimestamp = _v; }
        public long senderPacketCount() { return senderPacketCount; }
        public void setSenderPacketCount(long _v) { _dirty = true; senderPacketCount = _v; }
        public long senderOctetCount() { return senderOctetCount; }
        public void setSenderOctetCount(long _v) { _dirty = true; senderOctetCount = _v; }
        public List<ReportBlock> reportBlock() { return reportBlock; }
        public void setReportBlock(List<ReportBlock> _v) { _dirty = true; reportBlock = _v; }
        public RtcpPayload _root() { return _root; }
        public void set_root(RtcpPayload _v) { _dirty = true; _root = _v; }
        public RtcpPayload.RtcpPacket _parent() { return _parent; }
        public void set_parent(RtcpPayload.RtcpPacket _v) { _dirty = true; _parent = _v; }
    }
    private List<RtcpPacket> rtcpPackets;
    private RtcpPayload _root;
    private KaitaiStruct.ReadWrite _parent;
    public List<RtcpPacket> rtcpPackets() { return rtcpPackets; }
    public void setRtcpPackets(List<RtcpPacket> _v) { _dirty = true; rtcpPackets = _v; }
    public RtcpPayload _root() { return _root; }
    public void set_root(RtcpPayload _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;


/**
 * The Real-time Transport Protocol (RTP) is a widely used network
 * protocol for transmitting audio or video. It usually works with the
 * RTP Control Protocol (RTCP). The transmission can be based on
 * Transmission Control Protocol (TCP) or User Datagram Protocol (UDP).
 */
public class RtpPacket extends KaitaiStruct.ReadWrite {
    public static RtpPacket fromFile(String fileName) throws IOException {
        return new RtpPacket(new ByteBufferKaitaiStream(fileName));
    }

    public enum PayloadTypeEnum {
        PCMU(0),
        RESERVED1(1),
        RESERVED2(2),
        GSM(3),
        G723(4),
        DVI4_1(5),
        DVI4_2(6),
        LPC(7),
        PCMA(8),
        G722(9),
        L16_1(10),
        L16_2(11),
        QCELP(12),
        CN(13),
        MPA(14),
        G728(15),
        DVI4_3(16),
        DVI4_4(17),
        G729(18),
        RESERVED19(19),
        UNASSIGNED20(20),
        UNASSIGNED21(21),
        UNASSIGNED22(22),
        UNASSIGNED23(23),
        UNASSIGNED24(24),
        CELB(25),
        JPEG(26),
        UNASSIGNED27(27),
        NV(28),
        UNASSIGNED29(29),
        UNASSIGNED30(30),
        H261(31),
        MPV(32),
        MP2T(33),
        H263(34),
        MPEG_PS(96);

        private final long id;
        PayloadTypeEnum(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, PayloadTypeEnum> byId = new HashMap<Long, PayloadTypeEnum>(36);
        static {
            for (PayloadTypeEnum e : PayloadTypeEnum.values())
                byId.put(e.id(), e);
        }
        public static PayloadTypeEnum byId(long id) { return byId.get(id); }
    }
    public RtpPacket() {
        this(null, null, null);
    }

    public RtpPacket(KaitaiStream _io) {
        this(_io, null, null);
    }

    public RtpPacket(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public RtpPacket(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, RtpPacket _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.version = this._io.readBitsIntBe(2);
        this.hasPadding = this._io.readBitsIntBe(1) != 0;
        this.hasExtension = this._io.readBitsIntBe(1) != 0;
        this.csrcCount = this._io.readBitsIntBe(4);
        this.marker = this._io.readBitsIntBe(1) != 0;
        this.payloadType = PayloadTypeEnum.byId(this._io.readBitsIntBe(7));
        this.sequenceNumber = this._io.readU2be();
        this.timestamp = this._io.readU4be();
        this.ssrc = this._io.readU4be();
        if (hasExtension()) {
            this.headerExtension = new HeaderExtention(this._io, this, _root);
            this.headerExtension._read();
        }
        this.data = this._io.readBytes((_io().size() - _io().pos()) - lenPadding());
        this.padding = this._io.readBytes(lenPadding());
        _dirty = false;
    }

    public void _fetchInstances() {
        if (hasExtension()) {
            this.headerExtension._fetchInstances();
        }
        lenPaddingIfExists();
        if (this.lenPaddingIfExists != null) {
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteLenPaddingIfExists = _enabledLenPaddingIfExists;
        this._io.writeBitsIntBe(2, this.version);
        this._io.writeBitsIntBe(1, (this.hasPadding ? 1 : 0));
        this._io.writeBitsIntBe(1, (this.hasExtension ? 1 : 0));
        this._io.writeBitsIntBe(4, this.csrcCount);
        this._io.writeBitsIntBe(1, (this.marker ? 1 : 0));
        this._io.writeBitsIntBe(7, ((Number) (this.payloadType.id())).longValue());
        this._io.writeU2be(this.sequenceNumber);
        this._io.writeU4be(this.timestamp);
        this._io.writeU4be(this.ssrc);
        if (hasExtension()) {
            this.headerExtension._write_Seq(this._io);
        }
        if (this.data.length != (_io().size() - _io().pos()) - lenPadding())
            throw new ConsistencyError("data", (_io().size() - _io().pos()) - lenPadding(), this.data.length);
        this._io.writeBytes(this.data);
        if (this.padding.length != lenPadding())
            throw new ConsistencyError("padding", lenPadding(), this.padding.length);
        this._io.writeBytes(this.padding);
    }

    public void _check() {
        if (hasExtension()) {
            if (!Objects.equals(this.headerExtension._root(), _root()))
                throw new ConsistencyError("header_extension", _root(), this.headerExtension._root());
            if (!Objects.equals(this.headerExtension._parent(), this))
                throw new ConsistencyError("header_extension", this, this.headerExtension._parent());
        }
        if (_enabledLenPaddingIfExists) {
            if (hasPadding()) {
            }
        }
        _dirty = false;
    }
    public static class HeaderExtention extends KaitaiStruct.ReadWrite {
        public static HeaderExtention fromFile(String fileName) throws IOException {
            return new HeaderExtention(new ByteBufferKaitaiStream(fileName));
        }
        public HeaderExtention() {
            this(null, null, null);
        }

        public HeaderExtention(KaitaiStream _io) {
            this(_io, null, null);
        }

        public HeaderExtention(KaitaiStream _io, RtpPacket _parent) {
            this(_io, _parent, null);
        }

        public HeaderExtention(KaitaiStream _io, RtpPacket _parent, RtpPacket _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.id = this._io.readU2be();
            this.length = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.id);
            this._io.writeU2be(this.length);
        }

        public void _check() {
            _dirty = false;
        }
        private int id;
        private int length;
        private RtpPacket _root;
        private RtpPacket _parent;
        public int id() { return id; }
        public void setId(int _v) { _dirty = true; id = _v; }
        public int length() { return length; }
        public void setLength(int _v) { _dirty = true; length = _v; }
        public RtpPacket _root() { return _root; }
        public void set_root(RtpPacket _v) { _dirty = true; _root = _v; }
        public RtpPacket _parent() { return _parent; }
        public void set_parent(RtpPacket _v) { _dirty = true; _parent = _v; }
    }
    private Integer lenPadding;

    /**
     * Always returns number of padding bytes to in the payload.
     */
    public Integer lenPadding() {
        if (this.lenPadding != null)
            return this.lenPadding;
        this.lenPadding = ((Number) ((hasPadding() ? lenPaddingIfExists() : 0))).intValue();
        return this.lenPadding;
    }
    public void _invalidateLenPadding() { this.lenPadding = null; }
    private Integer lenPaddingIfExists;
    private boolean _shouldWriteLenPaddingIfExists = false;
    private boolean _enabledLenPaddingIfExists = true;

    /**
     * If padding bit is enabled, last byte of data contains number of
     * bytes appended to the payload as padding.
     */
    public Integer lenPaddingIfExists() {
        if (_shouldWriteLenPaddingIfExists)
            _writeLenPaddingIfExists();
        if (this.lenPaddingIfExists != null)
            return this.lenPaddingIfExists;
        if (!_enabledLenPaddingIfExists)
            return null;
        if (hasPadding()) {
            long _pos = this._io.pos();
            this._io.seek(_io().size() - 1);
            this.lenPaddingIfExists = this._io.readU1();
            this._io.seek(_pos);
        }
        return this.lenPaddingIfExists;
    }
    public void setLenPaddingIfExists(Integer _v) { _dirty = true; lenPaddingIfExists = _v; }
    public void setLenPaddingIfExists_Enabled(boolean _v) { _dirty = true; _enabledLenPaddingIfExists = _v; }

    private void _writeLenPaddingIfExists() {
        _shouldWriteLenPaddingIfExists = false;
        if (hasPadding()) {
            long _pos = this._io.pos();
            this._io.seek(_io().size() - 1);
            this._io.writeU1(this.lenPaddingIfExists);
            this._io.seek(_pos);
        }
    }
    private long version;
    private boolean hasPadding;
    private boolean hasExtension;
    private long csrcCount;
    private boolean marker;
    private PayloadTypeEnum payloadType;
    private int sequenceNumber;
    private long timestamp;
    private long ssrc;
    private HeaderExtention headerExtension;
    private byte[] data;
    private byte[] padding;
    private RtpPacket _root;
    private KaitaiStruct.ReadWrite _parent;
    public long version() { return version; }
    public void setVersion(long _v) { _dirty = true; version = _v; }
    public boolean hasPadding() { return hasPadding; }
    public void setHasPadding(boolean _v) { _dirty = true; hasPadding = _v; }
    public boolean hasExtension() { return hasExtension; }
    public void setHasExtension(boolean _v) { _dirty = true; hasExtension = _v; }
    public long csrcCount() { return csrcCount; }
    public void setCsrcCount(long _v) { _dirty = true; csrcCount = _v; }
    public boolean marker() { return marker; }
    public void setMarker(boolean _v) { _dirty = true; marker = _v; }
    public PayloadTypeEnum payloadType() { return payloadType; }
    public void setPayloadType(PayloadTypeEnum _v) { _dirty = true; payloadType = _v; }
    public int sequenceNumber() { return sequenceNumber; }
    public void setSequenceNumber(int _v) { _dirty = true; sequenceNumber = _v; }
    public long timestamp() { return timestamp; }
    public void setTimestamp(long _v) { _dirty = true; timestamp = _v; }
    public long ssrc() { return ssrc; }
    public void setSsrc(long _v) { _dirty = true; ssrc = _v; }
    public HeaderExtention headerExtension() { return headerExtension; }
    public void setHeaderExtension(HeaderExtention _v) { _dirty = true; headerExtension = _v; }

    /**
     * Payload without padding.
     */
    public byte[] data() { return data; }
    public void setData(byte[] _v) { _dirty = true; data = _v; }
    public byte[] padding() { return padding; }
    public void setPadding(byte[] _v) { _dirty = true; padding = _v; }
    public RtpPacket _root() { return _root; }
    public void set_root(RtpPacket _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

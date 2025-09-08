// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;


/**
 * TCP is one of the core Internet protocols on transport layer (AKA
 * OSI layer 4), providing stateful connections with error checking,
 * guarantees of delivery, order of segments and avoidance of duplicate
 * delivery.
 */
public class TcpSegment extends KaitaiStruct.ReadWrite {
    public static TcpSegment fromFile(String fileName) throws IOException {
        return new TcpSegment(new ByteBufferKaitaiStream(fileName));
    }
    public TcpSegment() {
        this(null, null, null);
    }

    public TcpSegment(KaitaiStream _io) {
        this(_io, null, null);
    }

    public TcpSegment(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public TcpSegment(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, TcpSegment _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.srcPort = this._io.readU2be();
        this.dstPort = this._io.readU2be();
        this.seqNum = this._io.readU4be();
        this.ackNum = this._io.readU4be();
        this.dataOffset = this._io.readBitsIntBe(4);
        this.reserved = this._io.readBitsIntBe(4);
        this.flags = new Flags(this._io, this, _root);
        this.flags._read();
        this.windowSize = this._io.readU2be();
        this.checksum = this._io.readU2be();
        this.urgentPointer = this._io.readU2be();
        if (dataOffset() * 4 - 20 != 0) {
            this.options = this._io.readBytes(dataOffset() * 4 - 20);
        }
        this.body = this._io.readBytesFull();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.flags._fetchInstances();
        if (dataOffset() * 4 - 20 != 0) {
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeU2be(this.srcPort);
        this._io.writeU2be(this.dstPort);
        this._io.writeU4be(this.seqNum);
        this._io.writeU4be(this.ackNum);
        this._io.writeBitsIntBe(4, this.dataOffset);
        this._io.writeBitsIntBe(4, this.reserved);
        this.flags._write_Seq(this._io);
        this._io.writeU2be(this.windowSize);
        this._io.writeU2be(this.checksum);
        this._io.writeU2be(this.urgentPointer);
        if (dataOffset() * 4 - 20 != 0) {
            this._io.writeBytes(this.options);
        }
        this._io.writeBytes(this.body);
        if (!(this._io.isEof()))
            throw new ConsistencyError("body", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        if (!Objects.equals(this.flags._root(), _root()))
            throw new ConsistencyError("flags", _root(), this.flags._root());
        if (!Objects.equals(this.flags._parent(), this))
            throw new ConsistencyError("flags", this, this.flags._parent());
        if (dataOffset() * 4 - 20 != 0) {
            if (this.options.length != dataOffset() * 4 - 20)
                throw new ConsistencyError("options", dataOffset() * 4 - 20, this.options.length);
        }
        _dirty = false;
    }

    /**
     * TCP header flags as defined "TCP Header Flags" registry.
     */
    public static class Flags extends KaitaiStruct.ReadWrite {
        public static Flags fromFile(String fileName) throws IOException {
            return new Flags(new ByteBufferKaitaiStream(fileName));
        }
        public Flags() {
            this(null, null, null);
        }

        public Flags(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Flags(KaitaiStream _io, TcpSegment _parent) {
            this(_io, _parent, null);
        }

        public Flags(KaitaiStream _io, TcpSegment _parent, TcpSegment _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.cwr = this._io.readBitsIntBe(1) != 0;
            this.ece = this._io.readBitsIntBe(1) != 0;
            this.urg = this._io.readBitsIntBe(1) != 0;
            this.ack = this._io.readBitsIntBe(1) != 0;
            this.psh = this._io.readBitsIntBe(1) != 0;
            this.rst = this._io.readBitsIntBe(1) != 0;
            this.syn = this._io.readBitsIntBe(1) != 0;
            this.fin = this._io.readBitsIntBe(1) != 0;
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(1, (this.cwr ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.ece ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.urg ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.ack ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.psh ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.rst ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.syn ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.fin ? 1 : 0));
        }

        public void _check() {
            _dirty = false;
        }
        private boolean cwr;
        private boolean ece;
        private boolean urg;
        private boolean ack;
        private boolean psh;
        private boolean rst;
        private boolean syn;
        private boolean fin;
        private TcpSegment _root;
        private TcpSegment _parent;

        /**
         * Congestion Window Reduced
         */
        public boolean cwr() { return cwr; }
        public void setCwr(boolean _v) { _dirty = true; cwr = _v; }

        /**
         * ECN-Echo
         */
        public boolean ece() { return ece; }
        public void setEce(boolean _v) { _dirty = true; ece = _v; }

        /**
         * Urgent pointer field is significant
         */
        public boolean urg() { return urg; }
        public void setUrg(boolean _v) { _dirty = true; urg = _v; }

        /**
         * Acknowledgment field is significant
         */
        public boolean ack() { return ack; }
        public void setAck(boolean _v) { _dirty = true; ack = _v; }

        /**
         * Push function
         */
        public boolean psh() { return psh; }
        public void setPsh(boolean _v) { _dirty = true; psh = _v; }

        /**
         * Reset the connection
         */
        public boolean rst() { return rst; }
        public void setRst(boolean _v) { _dirty = true; rst = _v; }

        /**
         * Synchronize sequence numbers
         */
        public boolean syn() { return syn; }
        public void setSyn(boolean _v) { _dirty = true; syn = _v; }

        /**
         * No more data from sender
         */
        public boolean fin() { return fin; }
        public void setFin(boolean _v) { _dirty = true; fin = _v; }
        public TcpSegment _root() { return _root; }
        public void set_root(TcpSegment _v) { _dirty = true; _root = _v; }
        public TcpSegment _parent() { return _parent; }
        public void set_parent(TcpSegment _v) { _dirty = true; _parent = _v; }

        @Override
        public String toString() {
            return (((((((cwr() ? "|CWR" : "") + (ece() ? "|ECE" : "")) + (urg() ? "|URG" : "")) + (ack() ? "|ACK" : "")) + (psh() ? "|PSH" : "")) + (rst() ? "|RST" : "")) + (syn() ? "|SYN" : "")) + (fin() ? "|FIN" : "");
        }
    }
    private int srcPort;
    private int dstPort;
    private long seqNum;
    private long ackNum;
    private long dataOffset;
    private long reserved;
    private Flags flags;
    private int windowSize;
    private int checksum;
    private int urgentPointer;
    private byte[] options;
    private byte[] body;
    private TcpSegment _root;
    private KaitaiStruct.ReadWrite _parent;

    /**
     * Source port
     */
    public int srcPort() { return srcPort; }
    public void setSrcPort(int _v) { _dirty = true; srcPort = _v; }

    /**
     * Destination port
     */
    public int dstPort() { return dstPort; }
    public void setDstPort(int _v) { _dirty = true; dstPort = _v; }

    /**
     * Sequence number
     */
    public long seqNum() { return seqNum; }
    public void setSeqNum(long _v) { _dirty = true; seqNum = _v; }

    /**
     * Acknowledgment number
     */
    public long ackNum() { return ackNum; }
    public void setAckNum(long _v) { _dirty = true; ackNum = _v; }

    /**
     * Data offset (in 32-bit words from the beginning of this type, normally 32 or can be extended if there are any TCP options or padding is present)
     */
    public long dataOffset() { return dataOffset; }
    public void setDataOffset(long _v) { _dirty = true; dataOffset = _v; }
    public long reserved() { return reserved; }
    public void setReserved(long _v) { _dirty = true; reserved = _v; }
    public Flags flags() { return flags; }
    public void setFlags(Flags _v) { _dirty = true; flags = _v; }
    public int windowSize() { return windowSize; }
    public void setWindowSize(int _v) { _dirty = true; windowSize = _v; }
    public int checksum() { return checksum; }
    public void setChecksum(int _v) { _dirty = true; checksum = _v; }
    public int urgentPointer() { return urgentPointer; }
    public void setUrgentPointer(int _v) { _dirty = true; urgentPointer = _v; }
    public byte[] options() { return options; }
    public void setOptions(byte[] _v) { _dirty = true; options = _v; }
    public byte[] body() { return body; }
    public void setBody(byte[] _v) { _dirty = true; body = _v; }
    public TcpSegment _root() { return _root; }
    public void set_root(TcpSegment _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

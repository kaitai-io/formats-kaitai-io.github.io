// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import io.kaitai.struct.ConsistencyError;

public class Ipv6Packet extends KaitaiStruct.ReadWrite {
    public static Ipv6Packet fromFile(String fileName) throws IOException {
        return new Ipv6Packet(new ByteBufferKaitaiStream(fileName));
    }
    public Ipv6Packet() {
        this(null, null, null);
    }

    public Ipv6Packet(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Ipv6Packet(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Ipv6Packet(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Ipv6Packet _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.version = this._io.readBitsIntBe(4);
        this.trafficClass = this._io.readBitsIntBe(8);
        this.flowLabel = this._io.readBitsIntBe(20);
        this.payloadLength = this._io.readU2be();
        this.nextHeaderType = this._io.readU1();
        this.hopLimit = this._io.readU1();
        this.srcIpv6Addr = this._io.readBytes(16);
        this.dstIpv6Addr = this._io.readBytes(16);
        this.nextHeader = new ProtocolBody(this._io, nextHeaderType());
        this.nextHeader._read();
        this.rest = this._io.readBytesFull();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.nextHeader._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBitsIntBe(4, this.version);
        this._io.writeBitsIntBe(8, this.trafficClass);
        this._io.writeBitsIntBe(20, this.flowLabel);
        this._io.writeU2be(this.payloadLength);
        this._io.writeU1(this.nextHeaderType);
        this._io.writeU1(this.hopLimit);
        this._io.writeBytes(this.srcIpv6Addr);
        this._io.writeBytes(this.dstIpv6Addr);
        this.nextHeader._write_Seq(this._io);
        this._io.writeBytes(this.rest);
        if (!(this._io.isEof()))
            throw new ConsistencyError("rest", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        if (this.srcIpv6Addr.length != 16)
            throw new ConsistencyError("src_ipv6_addr", 16, this.srcIpv6Addr.length);
        if (this.dstIpv6Addr.length != 16)
            throw new ConsistencyError("dst_ipv6_addr", 16, this.dstIpv6Addr.length);
        if (this.nextHeader.protocolNum() != nextHeaderType())
            throw new ConsistencyError("next_header", nextHeaderType(), this.nextHeader.protocolNum());
        _dirty = false;
    }
    private long version;
    private long trafficClass;
    private long flowLabel;
    private int payloadLength;
    private int nextHeaderType;
    private int hopLimit;
    private byte[] srcIpv6Addr;
    private byte[] dstIpv6Addr;
    private ProtocolBody nextHeader;
    private byte[] rest;
    private Ipv6Packet _root;
    private KaitaiStruct.ReadWrite _parent;
    public long version() { return version; }
    public void setVersion(long _v) { _dirty = true; version = _v; }
    public long trafficClass() { return trafficClass; }
    public void setTrafficClass(long _v) { _dirty = true; trafficClass = _v; }
    public long flowLabel() { return flowLabel; }
    public void setFlowLabel(long _v) { _dirty = true; flowLabel = _v; }
    public int payloadLength() { return payloadLength; }
    public void setPayloadLength(int _v) { _dirty = true; payloadLength = _v; }
    public int nextHeaderType() { return nextHeaderType; }
    public void setNextHeaderType(int _v) { _dirty = true; nextHeaderType = _v; }
    public int hopLimit() { return hopLimit; }
    public void setHopLimit(int _v) { _dirty = true; hopLimit = _v; }
    public byte[] srcIpv6Addr() { return srcIpv6Addr; }
    public void setSrcIpv6Addr(byte[] _v) { _dirty = true; srcIpv6Addr = _v; }
    public byte[] dstIpv6Addr() { return dstIpv6Addr; }
    public void setDstIpv6Addr(byte[] _v) { _dirty = true; dstIpv6Addr = _v; }
    public ProtocolBody nextHeader() { return nextHeader; }
    public void setNextHeader(ProtocolBody _v) { _dirty = true; nextHeader = _v; }
    public byte[] rest() { return rest; }
    public void setRest(byte[] _v) { _dirty = true; rest = _v; }
    public Ipv6Packet _root() { return _root; }
    public void set_root(Ipv6Packet _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

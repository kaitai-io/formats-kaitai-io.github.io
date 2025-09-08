// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import io.kaitai.struct.ConsistencyError;


/**
 * UDP is a simple stateless transport layer (AKA OSI layer 4)
 * protocol, one of the core Internet protocols. It provides source and
 * destination ports, basic checksumming, but provides not guarantees
 * of delivery, order of packets, or duplicate delivery.
 */
public class UdpDatagram extends KaitaiStruct.ReadWrite {
    public static UdpDatagram fromFile(String fileName) throws IOException {
        return new UdpDatagram(new ByteBufferKaitaiStream(fileName));
    }
    public UdpDatagram() {
        this(null, null, null);
    }

    public UdpDatagram(KaitaiStream _io) {
        this(_io, null, null);
    }

    public UdpDatagram(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public UdpDatagram(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, UdpDatagram _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.srcPort = this._io.readU2be();
        this.dstPort = this._io.readU2be();
        this.length = this._io.readU2be();
        this.checksum = this._io.readU2be();
        this.body = this._io.readBytes(length() - 8);
        _dirty = false;
    }

    public void _fetchInstances() {
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeU2be(this.srcPort);
        this._io.writeU2be(this.dstPort);
        this._io.writeU2be(this.length);
        this._io.writeU2be(this.checksum);
        this._io.writeBytes(this.body);
    }

    public void _check() {
        if (this.body.length != length() - 8)
            throw new ConsistencyError("body", length() - 8, this.body.length);
        _dirty = false;
    }
    private int srcPort;
    private int dstPort;
    private int length;
    private int checksum;
    private byte[] body;
    private UdpDatagram _root;
    private KaitaiStruct.ReadWrite _parent;
    public int srcPort() { return srcPort; }
    public void setSrcPort(int _v) { _dirty = true; srcPort = _v; }
    public int dstPort() { return dstPort; }
    public void setDstPort(int _v) { _dirty = true; dstPort = _v; }
    public int length() { return length; }
    public void setLength(int _v) { _dirty = true; length = _v; }
    public int checksum() { return checksum; }
    public void setChecksum(int _v) { _dirty = true; checksum = _v; }
    public byte[] body() { return body; }
    public void setBody(byte[] _v) { _dirty = true; body = _v; }
    public UdpDatagram _root() { return _root; }
    public void set_root(UdpDatagram _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

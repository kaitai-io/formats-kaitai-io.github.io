// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;

public class UdpDatagram extends KaitaiStruct {
    public static UdpDatagram fromFile(String fileName) throws IOException {
        return new UdpDatagram(new KaitaiStream(fileName));
    }

    public UdpDatagram(KaitaiStream _io) {
        super(_io);
        this._root = this;
        _init();
    }

    public UdpDatagram(KaitaiStream _io, KaitaiStruct _parent) {
        super(_io);
        this._parent = _parent;
        this._root = this;
        _init();
    }

    public UdpDatagram(KaitaiStream _io, KaitaiStruct _parent, UdpDatagram _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root;
        _init();
    }

    private void _init() {
        _read();
    }
    private void _read() {
        this.srcPort = this._io.readU2be();
        this.dstPort = this._io.readU2be();
        this.length = this._io.readU2be();
        this.checksum = this._io.readU2be();
        this.body = this._io.readBytesFull();
    }
    private int srcPort;
    private int dstPort;
    private int length;
    private int checksum;
    private byte[] body;
    private UdpDatagram _root;
    private KaitaiStruct _parent;
    public int srcPort() { return srcPort; }
    public int dstPort() { return dstPort; }
    public int length() { return length; }
    public int checksum() { return checksum; }
    public byte[] body() { return body; }
    public UdpDatagram _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

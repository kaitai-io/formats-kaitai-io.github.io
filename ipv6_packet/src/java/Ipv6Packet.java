// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;

public class Ipv6Packet extends KaitaiStruct {
    public static Ipv6Packet fromFile(String fileName) throws IOException {
        return new Ipv6Packet(new KaitaiStream(fileName));
    }

    public Ipv6Packet(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Ipv6Packet(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Ipv6Packet(KaitaiStream _io, KaitaiStruct _parent, Ipv6Packet _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.version = this._io.readBitsInt(4);
        this.trafficClass = this._io.readBitsInt(8);
        this.flowLabel = this._io.readBitsInt(20);
        this._io.alignToByte();
        this.payloadLength = this._io.readU2be();
        this.nextHeaderType = this._io.readU1();
        this.hopLimit = this._io.readU1();
        this.srcIpv6Addr = this._io.readBytes(16);
        this.dstIpv6Addr = this._io.readBytes(16);
        switch (nextHeaderType()) {
        case 17: {
            this.nextHeader = new UdpDatagram(this._io);
            break;
        }
        case 0: {
            this.nextHeader = new OptionHopByHop(this._io, this, _root);
            break;
        }
        case 4: {
            this.nextHeader = new Ipv4Packet(this._io);
            break;
        }
        case 6: {
            this.nextHeader = new TcpSegment(this._io);
            break;
        }
        case 59: {
            this.nextHeader = new NoNextHeader(this._io, this, _root);
            break;
        }
        }
        this.rest = this._io.readBytesFull();
    }
    public static class NoNextHeader extends KaitaiStruct {
        public static NoNextHeader fromFile(String fileName) throws IOException {
            return new NoNextHeader(new KaitaiStream(fileName));
        }

        public NoNextHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public NoNextHeader(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public NoNextHeader(KaitaiStream _io, KaitaiStruct _parent, Ipv6Packet _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
        }
        private Ipv6Packet _root;
        private KaitaiStruct _parent;
        public Ipv6Packet _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class OptionHopByHop extends KaitaiStruct {
        public static OptionHopByHop fromFile(String fileName) throws IOException {
            return new OptionHopByHop(new KaitaiStream(fileName));
        }

        public OptionHopByHop(KaitaiStream _io) {
            this(_io, null, null);
        }

        public OptionHopByHop(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public OptionHopByHop(KaitaiStream _io, KaitaiStruct _parent, Ipv6Packet _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.nextHeaderType = this._io.readU1();
            this.hdrExtLen = this._io.readU1();
            this.body = this._io.readBytes((hdrExtLen() - 1));
            switch (nextHeaderType()) {
            case 0: {
                this.nextHeader = new OptionHopByHop(this._io, this, _root);
                break;
            }
            case 6: {
                this.nextHeader = new TcpSegment(this._io);
                break;
            }
            case 59: {
                this.nextHeader = new NoNextHeader(this._io, this, _root);
                break;
            }
            }
        }
        private int nextHeaderType;
        private int hdrExtLen;
        private byte[] body;
        private KaitaiStruct nextHeader;
        private Ipv6Packet _root;
        private KaitaiStruct _parent;
        public int nextHeaderType() { return nextHeaderType; }
        public int hdrExtLen() { return hdrExtLen; }
        public byte[] body() { return body; }
        public KaitaiStruct nextHeader() { return nextHeader; }
        public Ipv6Packet _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    private long version;
    private long trafficClass;
    private long flowLabel;
    private int payloadLength;
    private int nextHeaderType;
    private int hopLimit;
    private byte[] srcIpv6Addr;
    private byte[] dstIpv6Addr;
    private KaitaiStruct nextHeader;
    private byte[] rest;
    private Ipv6Packet _root;
    private KaitaiStruct _parent;
    public long version() { return version; }
    public long trafficClass() { return trafficClass; }
    public long flowLabel() { return flowLabel; }
    public int payloadLength() { return payloadLength; }
    public int nextHeaderType() { return nextHeaderType; }
    public int hopLimit() { return hopLimit; }
    public byte[] srcIpv6Addr() { return srcIpv6Addr; }
    public byte[] dstIpv6Addr() { return dstIpv6Addr; }
    public KaitaiStruct nextHeader() { return nextHeader; }
    public byte[] rest() { return rest; }
    public Ipv6Packet _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

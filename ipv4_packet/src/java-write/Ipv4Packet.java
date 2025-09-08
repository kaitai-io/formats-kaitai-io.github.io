// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.ArrayList;
import java.util.List;

public class Ipv4Packet extends KaitaiStruct.ReadWrite {
    public static Ipv4Packet fromFile(String fileName) throws IOException {
        return new Ipv4Packet(new ByteBufferKaitaiStream(fileName));
    }
    public Ipv4Packet() {
        this(null, null, null);
    }

    public Ipv4Packet(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Ipv4Packet(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Ipv4Packet(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Ipv4Packet _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.b1 = this._io.readU1();
        this.b2 = this._io.readU1();
        this.totalLength = this._io.readU2be();
        this.identification = this._io.readU2be();
        this.b67 = this._io.readU2be();
        this.ttl = this._io.readU1();
        this.protocol = this._io.readU1();
        this.headerChecksum = this._io.readU2be();
        this.srcIpAddr = this._io.readBytes(4);
        this.dstIpAddr = this._io.readBytes(4);
        this._raw_options = this._io.readBytes(ihlBytes() - 20);
        KaitaiStream _io__raw_options = new ByteBufferKaitaiStream(this._raw_options);
        this.options = new Ipv4Options(_io__raw_options, this, _root);
        this.options._read();
        this._raw_body = this._io.readBytes(totalLength() - ihlBytes());
        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
        this.body = new ProtocolBody(_io__raw_body, protocol());
        this.body._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.options._fetchInstances();
        this.body._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeU1(this.b1);
        this._io.writeU1(this.b2);
        this._io.writeU2be(this.totalLength);
        this._io.writeU2be(this.identification);
        this._io.writeU2be(this.b67);
        this._io.writeU1(this.ttl);
        this._io.writeU1(this.protocol);
        this._io.writeU2be(this.headerChecksum);
        this._io.writeBytes(this.srcIpAddr);
        this._io.writeBytes(this.dstIpAddr);
        final KaitaiStream _io__raw_options = new ByteBufferKaitaiStream(ihlBytes() - 20);
        this._io.addChildStream(_io__raw_options);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (ihlBytes() - 20));
            final Ipv4Packet _this = this;
            _io__raw_options.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_options = _io__raw_options.toByteArray();
                    if (_this._raw_options.length != ihlBytes() - 20)
                        throw new ConsistencyError("raw(options)", ihlBytes() - 20, _this._raw_options.length);
                    parent.writeBytes(_this._raw_options);
                }
            });
        }
        this.options._write_Seq(_io__raw_options);
        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(totalLength() - ihlBytes());
        this._io.addChildStream(_io__raw_body);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (totalLength() - ihlBytes()));
            final Ipv4Packet _this = this;
            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_body = _io__raw_body.toByteArray();
                    if (_this._raw_body.length != totalLength() - ihlBytes())
                        throw new ConsistencyError("raw(body)", totalLength() - ihlBytes(), _this._raw_body.length);
                    parent.writeBytes(_this._raw_body);
                }
            });
        }
        this.body._write_Seq(_io__raw_body);
    }

    public void _check() {
        if (this.srcIpAddr.length != 4)
            throw new ConsistencyError("src_ip_addr", 4, this.srcIpAddr.length);
        if (this.dstIpAddr.length != 4)
            throw new ConsistencyError("dst_ip_addr", 4, this.dstIpAddr.length);
        if (!Objects.equals(this.options._root(), _root()))
            throw new ConsistencyError("options", _root(), this.options._root());
        if (!Objects.equals(this.options._parent(), this))
            throw new ConsistencyError("options", this, this.options._parent());
        if (this.body.protocolNum() != protocol())
            throw new ConsistencyError("body", protocol(), this.body.protocolNum());
        _dirty = false;
    }
    public static class Ipv4Option extends KaitaiStruct.ReadWrite {
        public static Ipv4Option fromFile(String fileName) throws IOException {
            return new Ipv4Option(new ByteBufferKaitaiStream(fileName));
        }
        public Ipv4Option() {
            this(null, null, null);
        }

        public Ipv4Option(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Ipv4Option(KaitaiStream _io, Ipv4Packet.Ipv4Options _parent) {
            this(_io, _parent, null);
        }

        public Ipv4Option(KaitaiStream _io, Ipv4Packet.Ipv4Options _parent, Ipv4Packet _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.b1 = this._io.readU1();
            this.len = this._io.readU1();
            this.body = this._io.readBytes((len() > 2 ? len() - 2 : 0));
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.b1);
            this._io.writeU1(this.len);
            this._io.writeBytes(this.body);
        }

        public void _check() {
            if (this.body.length != (len() > 2 ? len() - 2 : 0))
                throw new ConsistencyError("body", (len() > 2 ? len() - 2 : 0), this.body.length);
            _dirty = false;
        }
        private Integer copy;
        public Integer copy() {
            if (this.copy != null)
                return this.copy;
            this.copy = ((Number) ((b1() & 128) >> 7)).intValue();
            return this.copy;
        }
        public void _invalidateCopy() { this.copy = null; }
        private Integer number;
        public Integer number() {
            if (this.number != null)
                return this.number;
            this.number = ((Number) (b1() & 31)).intValue();
            return this.number;
        }
        public void _invalidateNumber() { this.number = null; }
        private Integer optClass;
        public Integer optClass() {
            if (this.optClass != null)
                return this.optClass;
            this.optClass = ((Number) ((b1() & 96) >> 5)).intValue();
            return this.optClass;
        }
        public void _invalidateOptClass() { this.optClass = null; }
        private int b1;
        private int len;
        private byte[] body;
        private Ipv4Packet _root;
        private Ipv4Packet.Ipv4Options _parent;
        public int b1() { return b1; }
        public void setB1(int _v) { _dirty = true; b1 = _v; }
        public int len() { return len; }
        public void setLen(int _v) { _dirty = true; len = _v; }
        public byte[] body() { return body; }
        public void setBody(byte[] _v) { _dirty = true; body = _v; }
        public Ipv4Packet _root() { return _root; }
        public void set_root(Ipv4Packet _v) { _dirty = true; _root = _v; }
        public Ipv4Packet.Ipv4Options _parent() { return _parent; }
        public void set_parent(Ipv4Packet.Ipv4Options _v) { _dirty = true; _parent = _v; }
    }
    public static class Ipv4Options extends KaitaiStruct.ReadWrite {
        public static Ipv4Options fromFile(String fileName) throws IOException {
            return new Ipv4Options(new ByteBufferKaitaiStream(fileName));
        }
        public Ipv4Options() {
            this(null, null, null);
        }

        public Ipv4Options(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Ipv4Options(KaitaiStream _io, Ipv4Packet _parent) {
            this(_io, _parent, null);
        }

        public Ipv4Options(KaitaiStream _io, Ipv4Packet _parent, Ipv4Packet _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.entries = new ArrayList<Ipv4Option>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    Ipv4Option _t_entries = new Ipv4Option(this._io, this, _root);
                    try {
                        _t_entries._read();
                    } finally {
                        this.entries.add(_t_entries);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.entries.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.entries.size(); i++) {
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<Ipv4Option> entries;
        private Ipv4Packet _root;
        private Ipv4Packet _parent;
        public List<Ipv4Option> entries() { return entries; }
        public void setEntries(List<Ipv4Option> _v) { _dirty = true; entries = _v; }
        public Ipv4Packet _root() { return _root; }
        public void set_root(Ipv4Packet _v) { _dirty = true; _root = _v; }
        public Ipv4Packet _parent() { return _parent; }
        public void set_parent(Ipv4Packet _v) { _dirty = true; _parent = _v; }
    }
    private Integer ihl;
    public Integer ihl() {
        if (this.ihl != null)
            return this.ihl;
        this.ihl = ((Number) (b1() & 15)).intValue();
        return this.ihl;
    }
    public void _invalidateIhl() { this.ihl = null; }
    private Integer ihlBytes;
    public Integer ihlBytes() {
        if (this.ihlBytes != null)
            return this.ihlBytes;
        this.ihlBytes = ((Number) (ihl() * 4)).intValue();
        return this.ihlBytes;
    }
    public void _invalidateIhlBytes() { this.ihlBytes = null; }
    private Integer version;
    public Integer version() {
        if (this.version != null)
            return this.version;
        this.version = ((Number) ((b1() & 240) >> 4)).intValue();
        return this.version;
    }
    public void _invalidateVersion() { this.version = null; }
    private int b1;
    private int b2;
    private int totalLength;
    private int identification;
    private int b67;
    private int ttl;
    private int protocol;
    private int headerChecksum;
    private byte[] srcIpAddr;
    private byte[] dstIpAddr;
    private Ipv4Options options;
    private ProtocolBody body;
    private Ipv4Packet _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_options;
    private byte[] _raw_body;
    public int b1() { return b1; }
    public void setB1(int _v) { _dirty = true; b1 = _v; }
    public int b2() { return b2; }
    public void setB2(int _v) { _dirty = true; b2 = _v; }
    public int totalLength() { return totalLength; }
    public void setTotalLength(int _v) { _dirty = true; totalLength = _v; }
    public int identification() { return identification; }
    public void setIdentification(int _v) { _dirty = true; identification = _v; }
    public int b67() { return b67; }
    public void setB67(int _v) { _dirty = true; b67 = _v; }
    public int ttl() { return ttl; }
    public void setTtl(int _v) { _dirty = true; ttl = _v; }
    public int protocol() { return protocol; }
    public void setProtocol(int _v) { _dirty = true; protocol = _v; }
    public int headerChecksum() { return headerChecksum; }
    public void setHeaderChecksum(int _v) { _dirty = true; headerChecksum = _v; }
    public byte[] srcIpAddr() { return srcIpAddr; }
    public void setSrcIpAddr(byte[] _v) { _dirty = true; srcIpAddr = _v; }
    public byte[] dstIpAddr() { return dstIpAddr; }
    public void setDstIpAddr(byte[] _v) { _dirty = true; dstIpAddr = _v; }
    public Ipv4Options options() { return options; }
    public void setOptions(Ipv4Options _v) { _dirty = true; options = _v; }
    public ProtocolBody body() { return body; }
    public void setBody(ProtocolBody _v) { _dirty = true; body = _v; }
    public Ipv4Packet _root() { return _root; }
    public void set_root(Ipv4Packet _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_options() { return _raw_options; }
    public void set_raw_Options(byte[] _v) { _dirty = true; _raw_options = _v; }
    public byte[] _raw_body() { return _raw_body; }
    public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
}

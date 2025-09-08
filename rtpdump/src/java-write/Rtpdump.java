// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.Arrays;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.List;


/**
 * rtpdump is a format used by rtptools to record and replay
 * rtp data from network capture.
 * @see <a href="https://chromium.googlesource.com/external/webrtc/stable/talk/+/master/media/base/rtpdump.h">Source</a>
 */
public class Rtpdump extends KaitaiStruct.ReadWrite {
    public static Rtpdump fromFile(String fileName) throws IOException {
        return new Rtpdump(new ByteBufferKaitaiStream(fileName));
    }
    public Rtpdump() {
        this(null, null, null);
    }

    public Rtpdump(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Rtpdump(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Rtpdump(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Rtpdump _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.fileHeader = new HeaderT(this._io, this, _root);
        this.fileHeader._read();
        this.packets = new ArrayList<PacketT>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                PacketT _t_packets = new PacketT(this._io, this, _root);
                try {
                    _t_packets._read();
                } finally {
                    this.packets.add(_t_packets);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.fileHeader._fetchInstances();
        for (int i = 0; i < this.packets.size(); i++) {
            this.packets.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.fileHeader._write_Seq(this._io);
        for (int i = 0; i < this.packets.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("packets", 0, this._io.size() - this._io.pos());
            this.packets.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("packets", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        if (!Objects.equals(this.fileHeader._root(), _root()))
            throw new ConsistencyError("file_header", _root(), this.fileHeader._root());
        if (!Objects.equals(this.fileHeader._parent(), this))
            throw new ConsistencyError("file_header", this, this.fileHeader._parent());
        for (int i = 0; i < this.packets.size(); i++) {
            if (!Objects.equals(this.packets.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("packets", _root(), this.packets.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.packets.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("packets", this, this.packets.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class HeaderT extends KaitaiStruct.ReadWrite {
        public static HeaderT fromFile(String fileName) throws IOException {
            return new HeaderT(new ByteBufferKaitaiStream(fileName));
        }
        public HeaderT() {
            this(null, null, null);
        }

        public HeaderT(KaitaiStream _io) {
            this(_io, null, null);
        }

        public HeaderT(KaitaiStream _io, Rtpdump _parent) {
            this(_io, _parent, null);
        }

        public HeaderT(KaitaiStream _io, Rtpdump _parent, Rtpdump _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.shebang = this._io.readBytes(12);
            if (!(Arrays.equals(this.shebang, new byte[] { 35, 33, 114, 116, 112, 112, 108, 97, 121, 49, 46, 48 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 35, 33, 114, 116, 112, 112, 108, 97, 121, 49, 46, 48 }, this.shebang, this._io, "/types/header_t/seq/0");
            }
            this.space = this._io.readBytes(1);
            if (!(Arrays.equals(this.space, new byte[] { 32 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 32 }, this.space, this._io, "/types/header_t/seq/1");
            }
            this.ip = new String(this._io.readBytesTerm((byte) 47, false, true, true), StandardCharsets.US_ASCII);
            this.port = new String(this._io.readBytesTerm((byte) 10, false, true, true), StandardCharsets.US_ASCII);
            this.startSec = this._io.readU4be();
            this.startUsec = this._io.readU4be();
            this.ip2 = this._io.readU4be();
            this.port2 = this._io.readU2be();
            this.padding = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.shebang);
            this._io.writeBytes(this.space);
            this._io.writeBytes((this.ip).getBytes(Charset.forName("ASCII")));
            this._io.writeU1(47);
            this._io.writeBytes((this.port).getBytes(Charset.forName("ASCII")));
            this._io.writeU1(10);
            this._io.writeU4be(this.startSec);
            this._io.writeU4be(this.startUsec);
            this._io.writeU4be(this.ip2);
            this._io.writeU2be(this.port2);
            this._io.writeU2be(this.padding);
        }

        public void _check() {
            if (this.shebang.length != 12)
                throw new ConsistencyError("shebang", 12, this.shebang.length);
            if (!(Arrays.equals(this.shebang, new byte[] { 35, 33, 114, 116, 112, 112, 108, 97, 121, 49, 46, 48 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 35, 33, 114, 116, 112, 112, 108, 97, 121, 49, 46, 48 }, this.shebang, null, "/types/header_t/seq/0");
            }
            if (this.space.length != 1)
                throw new ConsistencyError("space", 1, this.space.length);
            if (!(Arrays.equals(this.space, new byte[] { 32 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 32 }, this.space, null, "/types/header_t/seq/1");
            }
            if (KaitaiStream.byteArrayIndexOf((this.ip).getBytes(Charset.forName("ASCII")), ((byte) 47)) != -1)
                throw new ConsistencyError("ip", -1, KaitaiStream.byteArrayIndexOf((this.ip).getBytes(Charset.forName("ASCII")), ((byte) 47)));
            if (KaitaiStream.byteArrayIndexOf((this.port).getBytes(Charset.forName("ASCII")), ((byte) 10)) != -1)
                throw new ConsistencyError("port", -1, KaitaiStream.byteArrayIndexOf((this.port).getBytes(Charset.forName("ASCII")), ((byte) 10)));
            _dirty = false;
        }
        private byte[] shebang;
        private byte[] space;
        private String ip;
        private String port;
        private long startSec;
        private long startUsec;
        private long ip2;
        private int port2;
        private int padding;
        private Rtpdump _root;
        private Rtpdump _parent;
        public byte[] shebang() { return shebang; }
        public void setShebang(byte[] _v) { _dirty = true; shebang = _v; }
        public byte[] space() { return space; }
        public void setSpace(byte[] _v) { _dirty = true; space = _v; }
        public String ip() { return ip; }
        public void setIp(String _v) { _dirty = true; ip = _v; }
        public String port() { return port; }
        public void setPort(String _v) { _dirty = true; port = _v; }

        /**
         * start of recording, the seconds part.
         */
        public long startSec() { return startSec; }
        public void setStartSec(long _v) { _dirty = true; startSec = _v; }

        /**
         * start of recording, the microseconds part.
         */
        public long startUsec() { return startUsec; }
        public void setStartUsec(long _v) { _dirty = true; startUsec = _v; }

        /**
         * network source.
         */
        public long ip2() { return ip2; }
        public void setIp2(long _v) { _dirty = true; ip2 = _v; }

        /**
         * port.
         */
        public int port2() { return port2; }
        public void setPort2(int _v) { _dirty = true; port2 = _v; }

        /**
         * 2 bytes padding.
         */
        public int padding() { return padding; }
        public void setPadding(int _v) { _dirty = true; padding = _v; }
        public Rtpdump _root() { return _root; }
        public void set_root(Rtpdump _v) { _dirty = true; _root = _v; }
        public Rtpdump _parent() { return _parent; }
        public void set_parent(Rtpdump _v) { _dirty = true; _parent = _v; }
    }
    public static class PacketT extends KaitaiStruct.ReadWrite {
        public static PacketT fromFile(String fileName) throws IOException {
            return new PacketT(new ByteBufferKaitaiStream(fileName));
        }
        public PacketT() {
            this(null, null, null);
        }

        public PacketT(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PacketT(KaitaiStream _io, Rtpdump _parent) {
            this(_io, _parent, null);
        }

        public PacketT(KaitaiStream _io, Rtpdump _parent, Rtpdump _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.length = this._io.readU2be();
            this.lenBody = this._io.readU2be();
            this.packetUsec = this._io.readU4be();
            this._raw_body = this._io.readBytes(lenBody());
            KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
            this.body = new RtpPacket(_io__raw_body);
            this.body._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.body._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.length);
            this._io.writeU2be(this.lenBody);
            this._io.writeU4be(this.packetUsec);
            final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
            this._io.addChildStream(_io__raw_body);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenBody()));
                final PacketT _this = this;
                _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_body = _io__raw_body.toByteArray();
                        if (_this._raw_body.length != lenBody())
                            throw new ConsistencyError("raw(body)", lenBody(), _this._raw_body.length);
                        parent.writeBytes(_this._raw_body);
                    }
                });
            }
            this.body._write_Seq(_io__raw_body);
        }

        public void _check() {
            _dirty = false;
        }
        private int length;
        private int lenBody;
        private long packetUsec;
        private RtpPacket body;
        private Rtpdump _root;
        private Rtpdump _parent;
        private byte[] _raw_body;

        /**
         * packet length (including this header).
         */
        public int length() { return length; }
        public void setLength(int _v) { _dirty = true; length = _v; }

        /**
         * payload length.
         */
        public int lenBody() { return lenBody; }
        public void setLenBody(int _v) { _dirty = true; lenBody = _v; }

        /**
         * timestamp of packet since the start.
         */
        public long packetUsec() { return packetUsec; }
        public void setPacketUsec(long _v) { _dirty = true; packetUsec = _v; }
        public RtpPacket body() { return body; }
        public void setBody(RtpPacket _v) { _dirty = true; body = _v; }
        public Rtpdump _root() { return _root; }
        public void set_root(Rtpdump _v) { _dirty = true; _root = _v; }
        public Rtpdump _parent() { return _parent; }
        public void set_parent(Rtpdump _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_body() { return _raw_body; }
        public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
    }
    private HeaderT fileHeader;
    private List<PacketT> packets;
    private Rtpdump _root;
    private KaitaiStruct.ReadWrite _parent;
    public HeaderT fileHeader() { return fileHeader; }
    public void setFileHeader(HeaderT _v) { _dirty = true; fileHeader = _v; }
    public List<PacketT> packets() { return packets; }
    public void setPackets(List<PacketT> _v) { _dirty = true; packets = _v; }
    public Rtpdump _root() { return _root; }
    public void set_root(Rtpdump _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

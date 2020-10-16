// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.nio.charset.Charset;


/**
 * rtpdump is a format used by rtptools to record and replay
 * rtp data from network capture.
 * @see <a href="https://chromium.googlesource.com/external/webrtc/stable/talk/+/master/media/base/rtpdump.h">Source</a>
 */
public class Rtpdump extends KaitaiStruct {
    public static Rtpdump fromFile(String fileName) throws IOException {
        return new Rtpdump(new ByteBufferKaitaiStream(fileName));
    }

    public Rtpdump(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Rtpdump(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Rtpdump(KaitaiStream _io, KaitaiStruct _parent, Rtpdump _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.fileHeader = new HeaderT(this._io, this, _root);
        this.packets = new ArrayList<PacketT>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.packets.add(new PacketT(this._io, this, _root));
                i++;
            }
        }
    }
    public static class HeaderT extends KaitaiStruct {
        public static HeaderT fromFile(String fileName) throws IOException {
            return new HeaderT(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.shebang = this._io.readBytes(12);
            if (!(Arrays.equals(shebang(), new byte[] { 35, 33, 114, 116, 112, 112, 108, 97, 121, 49, 46, 48 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 35, 33, 114, 116, 112, 112, 108, 97, 121, 49, 46, 48 }, shebang(), _io(), "/types/header_t/seq/0");
            }
            this.space = this._io.readBytes(1);
            if (!(Arrays.equals(space(), new byte[] { 32 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 32 }, space(), _io(), "/types/header_t/seq/1");
            }
            this.ip = new String(this._io.readBytesTerm(47, false, true, true), Charset.forName("ascii"));
            this.port = new String(this._io.readBytesTerm(10, false, true, true), Charset.forName("ascii"));
            this.startSec = this._io.readU4be();
            this.startUsec = this._io.readU4be();
            this.ip2 = this._io.readU4be();
            this.port2 = this._io.readU2be();
            this.padding = this._io.readU2be();
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
        public byte[] space() { return space; }
        public String ip() { return ip; }
        public String port() { return port; }

        /**
         * start of recording, the seconds part.
         */
        public long startSec() { return startSec; }

        /**
         * start of recording, the microseconds part.
         */
        public long startUsec() { return startUsec; }

        /**
         * network source.
         */
        public long ip2() { return ip2; }

        /**
         * port.
         */
        public int port2() { return port2; }

        /**
         * 2 bytes padding.
         */
        public int padding() { return padding; }
        public Rtpdump _root() { return _root; }
        public Rtpdump _parent() { return _parent; }
    }
    public static class PacketT extends KaitaiStruct {
        public static PacketT fromFile(String fileName) throws IOException {
            return new PacketT(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.length = this._io.readU2be();
            this.lenBody = this._io.readU2be();
            this.packetUsec = this._io.readU4be();
            this._raw_body = this._io.readBytes(lenBody());
            KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
            this.body = new RtpPacket(_io__raw_body);
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

        /**
         * payload length.
         */
        public int lenBody() { return lenBody; }

        /**
         * timestamp of packet since the start.
         */
        public long packetUsec() { return packetUsec; }
        public RtpPacket body() { return body; }
        public Rtpdump _root() { return _root; }
        public Rtpdump _parent() { return _parent; }
        public byte[] _raw_body() { return _raw_body; }
    }
    private HeaderT fileHeader;
    private ArrayList<PacketT> packets;
    private Rtpdump _root;
    private KaitaiStruct _parent;
    public HeaderT fileHeader() { return fileHeader; }
    public ArrayList<PacketT> packets() { return packets; }
    public Rtpdump _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

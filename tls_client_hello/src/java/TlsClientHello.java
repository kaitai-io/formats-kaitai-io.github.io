// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class TlsClientHello extends KaitaiStruct {
    public static TlsClientHello fromFile(String fileName) throws IOException {
        return new TlsClientHello(new ByteBufferKaitaiStream(fileName));
    }

    public TlsClientHello(KaitaiStream _io) {
        this(_io, null, null);
    }

    public TlsClientHello(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public TlsClientHello(KaitaiStream _io, KaitaiStruct _parent, TlsClientHello _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.version = new Version(this._io, this, _root);
        this.random = new Random(this._io, this, _root);
        this.sessionId = new SessionId(this._io, this, _root);
        this.cipherSuites = new CipherSuites(this._io, this, _root);
        this.compressionMethods = new CompressionMethods(this._io, this, _root);
        if (_io().isEof() == false) {
            this.extensions = new Extensions(this._io, this, _root);
        }
    }

    public void _fetchInstances() {
        this.version._fetchInstances();
        this.random._fetchInstances();
        this.sessionId._fetchInstances();
        this.cipherSuites._fetchInstances();
        this.compressionMethods._fetchInstances();
        if (_io().isEof() == false) {
            this.extensions._fetchInstances();
        }
    }
    public static class Alpn extends KaitaiStruct {
        public static Alpn fromFile(String fileName) throws IOException {
            return new Alpn(new ByteBufferKaitaiStream(fileName));
        }

        public Alpn(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Alpn(KaitaiStream _io, TlsClientHello.Extension _parent) {
            this(_io, _parent, null);
        }

        public Alpn(KaitaiStream _io, TlsClientHello.Extension _parent, TlsClientHello _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.extLen = this._io.readU2be();
            this.alpnProtocols = new ArrayList<Protocol>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.alpnProtocols.add(new Protocol(this._io, this, _root));
                    i++;
                }
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.alpnProtocols.size(); i++) {
                this.alpnProtocols.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private int extLen;
        private List<Protocol> alpnProtocols;
        private TlsClientHello _root;
        private TlsClientHello.Extension _parent;
        public int extLen() { return extLen; }
        public List<Protocol> alpnProtocols() { return alpnProtocols; }
        public TlsClientHello _root() { return _root; }
        public TlsClientHello.Extension _parent() { return _parent; }
    }
    public static class CipherSuites extends KaitaiStruct {
        public static CipherSuites fromFile(String fileName) throws IOException {
            return new CipherSuites(new ByteBufferKaitaiStream(fileName));
        }

        public CipherSuites(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CipherSuites(KaitaiStream _io, TlsClientHello _parent) {
            this(_io, _parent, null);
        }

        public CipherSuites(KaitaiStream _io, TlsClientHello _parent, TlsClientHello _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.len = this._io.readU2be();
            this.cipherSuites = new ArrayList<Integer>();
            for (int i = 0; i < len() / 2; i++) {
                this.cipherSuites.add(this._io.readU2be());
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.cipherSuites.size(); i++) {
            }
        }
        private int len;
        private List<Integer> cipherSuites;
        private TlsClientHello _root;
        private TlsClientHello _parent;
        public int len() { return len; }
        public List<Integer> cipherSuites() { return cipherSuites; }
        public TlsClientHello _root() { return _root; }
        public TlsClientHello _parent() { return _parent; }
    }
    public static class CompressionMethods extends KaitaiStruct {
        public static CompressionMethods fromFile(String fileName) throws IOException {
            return new CompressionMethods(new ByteBufferKaitaiStream(fileName));
        }

        public CompressionMethods(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CompressionMethods(KaitaiStream _io, TlsClientHello _parent) {
            this(_io, _parent, null);
        }

        public CompressionMethods(KaitaiStream _io, TlsClientHello _parent, TlsClientHello _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.len = this._io.readU1();
            this.compressionMethods = this._io.readBytes(len());
        }

        public void _fetchInstances() {
        }
        private int len;
        private byte[] compressionMethods;
        private TlsClientHello _root;
        private TlsClientHello _parent;
        public int len() { return len; }
        public byte[] compressionMethods() { return compressionMethods; }
        public TlsClientHello _root() { return _root; }
        public TlsClientHello _parent() { return _parent; }
    }
    public static class Extension extends KaitaiStruct {
        public static Extension fromFile(String fileName) throws IOException {
            return new Extension(new ByteBufferKaitaiStream(fileName));
        }

        public Extension(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Extension(KaitaiStream _io, TlsClientHello.Extensions _parent) {
            this(_io, _parent, null);
        }

        public Extension(KaitaiStream _io, TlsClientHello.Extensions _parent, TlsClientHello _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.type = this._io.readU2be();
            this.len = this._io.readU2be();
            switch (type()) {
            case 0: {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new Sni(_io_body, this, _root);
                break;
            }
            case 16: {
                KaitaiStream _io_body = this._io.substream(len());
                this.body = new Alpn(_io_body, this, _root);
                break;
            }
            default: {
                this.body = this._io.readBytes(len());
                break;
            }
            }
        }

        public void _fetchInstances() {
            switch (type()) {
            case 0: {
                ((Sni) (this.body))._fetchInstances();
                break;
            }
            case 16: {
                ((Alpn) (this.body))._fetchInstances();
                break;
            }
            default: {
                break;
            }
            }
        }
        private int type;
        private int len;
        private Object body;
        private TlsClientHello _root;
        private TlsClientHello.Extensions _parent;
        public int type() { return type; }
        public int len() { return len; }
        public Object body() { return body; }
        public TlsClientHello _root() { return _root; }
        public TlsClientHello.Extensions _parent() { return _parent; }
    }
    public static class Extensions extends KaitaiStruct {
        public static Extensions fromFile(String fileName) throws IOException {
            return new Extensions(new ByteBufferKaitaiStream(fileName));
        }

        public Extensions(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Extensions(KaitaiStream _io, TlsClientHello _parent) {
            this(_io, _parent, null);
        }

        public Extensions(KaitaiStream _io, TlsClientHello _parent, TlsClientHello _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.len = this._io.readU2be();
            this.extensions = new ArrayList<Extension>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.extensions.add(new Extension(this._io, this, _root));
                    i++;
                }
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.extensions.size(); i++) {
                this.extensions.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private int len;
        private List<Extension> extensions;
        private TlsClientHello _root;
        private TlsClientHello _parent;
        public int len() { return len; }
        public List<Extension> extensions() { return extensions; }
        public TlsClientHello _root() { return _root; }
        public TlsClientHello _parent() { return _parent; }
    }
    public static class Protocol extends KaitaiStruct {
        public static Protocol fromFile(String fileName) throws IOException {
            return new Protocol(new ByteBufferKaitaiStream(fileName));
        }

        public Protocol(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Protocol(KaitaiStream _io, TlsClientHello.Alpn _parent) {
            this(_io, _parent, null);
        }

        public Protocol(KaitaiStream _io, TlsClientHello.Alpn _parent, TlsClientHello _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.strlen = this._io.readU1();
            this.name = this._io.readBytes(strlen());
        }

        public void _fetchInstances() {
        }
        private int strlen;
        private byte[] name;
        private TlsClientHello _root;
        private TlsClientHello.Alpn _parent;
        public int strlen() { return strlen; }
        public byte[] name() { return name; }
        public TlsClientHello _root() { return _root; }
        public TlsClientHello.Alpn _parent() { return _parent; }
    }
    public static class Random extends KaitaiStruct {
        public static Random fromFile(String fileName) throws IOException {
            return new Random(new ByteBufferKaitaiStream(fileName));
        }

        public Random(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Random(KaitaiStream _io, TlsClientHello _parent) {
            this(_io, _parent, null);
        }

        public Random(KaitaiStream _io, TlsClientHello _parent, TlsClientHello _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.gmtUnixTime = this._io.readU4be();
            this.random = this._io.readBytes(28);
        }

        public void _fetchInstances() {
        }
        private long gmtUnixTime;
        private byte[] random;
        private TlsClientHello _root;
        private TlsClientHello _parent;
        public long gmtUnixTime() { return gmtUnixTime; }
        public byte[] random() { return random; }
        public TlsClientHello _root() { return _root; }
        public TlsClientHello _parent() { return _parent; }
    }
    public static class ServerName extends KaitaiStruct {
        public static ServerName fromFile(String fileName) throws IOException {
            return new ServerName(new ByteBufferKaitaiStream(fileName));
        }

        public ServerName(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ServerName(KaitaiStream _io, TlsClientHello.Sni _parent) {
            this(_io, _parent, null);
        }

        public ServerName(KaitaiStream _io, TlsClientHello.Sni _parent, TlsClientHello _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.nameType = this._io.readU1();
            this.length = this._io.readU2be();
            this.hostName = this._io.readBytes(length());
        }

        public void _fetchInstances() {
        }
        private int nameType;
        private int length;
        private byte[] hostName;
        private TlsClientHello _root;
        private TlsClientHello.Sni _parent;
        public int nameType() { return nameType; }
        public int length() { return length; }
        public byte[] hostName() { return hostName; }
        public TlsClientHello _root() { return _root; }
        public TlsClientHello.Sni _parent() { return _parent; }
    }
    public static class SessionId extends KaitaiStruct {
        public static SessionId fromFile(String fileName) throws IOException {
            return new SessionId(new ByteBufferKaitaiStream(fileName));
        }

        public SessionId(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SessionId(KaitaiStream _io, TlsClientHello _parent) {
            this(_io, _parent, null);
        }

        public SessionId(KaitaiStream _io, TlsClientHello _parent, TlsClientHello _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.len = this._io.readU1();
            this.sid = this._io.readBytes(len());
        }

        public void _fetchInstances() {
        }
        private int len;
        private byte[] sid;
        private TlsClientHello _root;
        private TlsClientHello _parent;
        public int len() { return len; }
        public byte[] sid() { return sid; }
        public TlsClientHello _root() { return _root; }
        public TlsClientHello _parent() { return _parent; }
    }
    public static class Sni extends KaitaiStruct {
        public static Sni fromFile(String fileName) throws IOException {
            return new Sni(new ByteBufferKaitaiStream(fileName));
        }

        public Sni(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Sni(KaitaiStream _io, TlsClientHello.Extension _parent) {
            this(_io, _parent, null);
        }

        public Sni(KaitaiStream _io, TlsClientHello.Extension _parent, TlsClientHello _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.listLength = this._io.readU2be();
            this.serverNames = new ArrayList<ServerName>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.serverNames.add(new ServerName(this._io, this, _root));
                    i++;
                }
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.serverNames.size(); i++) {
                this.serverNames.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private int listLength;
        private List<ServerName> serverNames;
        private TlsClientHello _root;
        private TlsClientHello.Extension _parent;
        public int listLength() { return listLength; }
        public List<ServerName> serverNames() { return serverNames; }
        public TlsClientHello _root() { return _root; }
        public TlsClientHello.Extension _parent() { return _parent; }
    }
    public static class Version extends KaitaiStruct {
        public static Version fromFile(String fileName) throws IOException {
            return new Version(new ByteBufferKaitaiStream(fileName));
        }

        public Version(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Version(KaitaiStream _io, TlsClientHello _parent) {
            this(_io, _parent, null);
        }

        public Version(KaitaiStream _io, TlsClientHello _parent, TlsClientHello _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.major = this._io.readU1();
            this.minor = this._io.readU1();
        }

        public void _fetchInstances() {
        }
        private int major;
        private int minor;
        private TlsClientHello _root;
        private TlsClientHello _parent;
        public int major() { return major; }
        public int minor() { return minor; }
        public TlsClientHello _root() { return _root; }
        public TlsClientHello _parent() { return _parent; }
    }
    private Version version;
    private Random random;
    private SessionId sessionId;
    private CipherSuites cipherSuites;
    private CompressionMethods compressionMethods;
    private Extensions extensions;
    private TlsClientHello _root;
    private KaitaiStruct _parent;
    public Version version() { return version; }
    public Random random() { return random; }
    public SessionId sessionId() { return sessionId; }
    public CipherSuites cipherSuites() { return cipherSuites; }
    public CompressionMethods compressionMethods() { return compressionMethods; }
    public Extensions extensions() { return extensions; }
    public TlsClientHello _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

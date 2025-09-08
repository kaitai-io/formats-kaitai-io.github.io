// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.ArrayList;
import java.util.List;

public class TlsClientHello extends KaitaiStruct.ReadWrite {
    public static TlsClientHello fromFile(String fileName) throws IOException {
        return new TlsClientHello(new ByteBufferKaitaiStream(fileName));
    }
    public TlsClientHello() {
        this(null, null, null);
    }

    public TlsClientHello(KaitaiStream _io) {
        this(_io, null, null);
    }

    public TlsClientHello(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public TlsClientHello(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, TlsClientHello _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.version = new Version(this._io, this, _root);
        this.version._read();
        this.random = new Random(this._io, this, _root);
        this.random._read();
        this.sessionId = new SessionId(this._io, this, _root);
        this.sessionId._read();
        this.cipherSuites = new CipherSuites(this._io, this, _root);
        this.cipherSuites._read();
        this.compressionMethods = new CompressionMethods(this._io, this, _root);
        this.compressionMethods._read();
        if (_io().isEof() == false) {
            this.extensions = new Extensions(this._io, this, _root);
            this.extensions._read();
        }
        _dirty = false;
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

    public void _write_Seq() {
        _assertNotDirty();
        this.version._write_Seq(this._io);
        this.random._write_Seq(this._io);
        this.sessionId._write_Seq(this._io);
        this.cipherSuites._write_Seq(this._io);
        this.compressionMethods._write_Seq(this._io);
        if (_io().isEof() == false) {
            if (!Objects.equals(this.extensions._root(), _root()))
                throw new ConsistencyError("extensions", _root(), this.extensions._root());
            if (!Objects.equals(this.extensions._parent(), this))
                throw new ConsistencyError("extensions", this, this.extensions._parent());
            this.extensions._write_Seq(this._io);
        }
    }

    public void _check() {
        if (!Objects.equals(this.version._root(), _root()))
            throw new ConsistencyError("version", _root(), this.version._root());
        if (!Objects.equals(this.version._parent(), this))
            throw new ConsistencyError("version", this, this.version._parent());
        if (!Objects.equals(this.random._root(), _root()))
            throw new ConsistencyError("random", _root(), this.random._root());
        if (!Objects.equals(this.random._parent(), this))
            throw new ConsistencyError("random", this, this.random._parent());
        if (!Objects.equals(this.sessionId._root(), _root()))
            throw new ConsistencyError("session_id", _root(), this.sessionId._root());
        if (!Objects.equals(this.sessionId._parent(), this))
            throw new ConsistencyError("session_id", this, this.sessionId._parent());
        if (!Objects.equals(this.cipherSuites._root(), _root()))
            throw new ConsistencyError("cipher_suites", _root(), this.cipherSuites._root());
        if (!Objects.equals(this.cipherSuites._parent(), this))
            throw new ConsistencyError("cipher_suites", this, this.cipherSuites._parent());
        if (!Objects.equals(this.compressionMethods._root(), _root()))
            throw new ConsistencyError("compression_methods", _root(), this.compressionMethods._root());
        if (!Objects.equals(this.compressionMethods._parent(), this))
            throw new ConsistencyError("compression_methods", this, this.compressionMethods._parent());
        _dirty = false;
    }
    public static class Alpn extends KaitaiStruct.ReadWrite {
        public static Alpn fromFile(String fileName) throws IOException {
            return new Alpn(new ByteBufferKaitaiStream(fileName));
        }
        public Alpn() {
            this(null, null, null);
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
        }
        public void _read() {
            this.extLen = this._io.readU2be();
            this.alpnProtocols = new ArrayList<Protocol>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    Protocol _t_alpnProtocols = new Protocol(this._io, this, _root);
                    try {
                        _t_alpnProtocols._read();
                    } finally {
                        this.alpnProtocols.add(_t_alpnProtocols);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.alpnProtocols.size(); i++) {
                this.alpnProtocols.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.extLen);
            for (int i = 0; i < this.alpnProtocols.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("alpn_protocols", 0, this._io.size() - this._io.pos());
                this.alpnProtocols.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("alpn_protocols", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.alpnProtocols.size(); i++) {
                if (!Objects.equals(this.alpnProtocols.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("alpn_protocols", _root(), this.alpnProtocols.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.alpnProtocols.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("alpn_protocols", this, this.alpnProtocols.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private int extLen;
        private List<Protocol> alpnProtocols;
        private TlsClientHello _root;
        private TlsClientHello.Extension _parent;
        public int extLen() { return extLen; }
        public void setExtLen(int _v) { _dirty = true; extLen = _v; }
        public List<Protocol> alpnProtocols() { return alpnProtocols; }
        public void setAlpnProtocols(List<Protocol> _v) { _dirty = true; alpnProtocols = _v; }
        public TlsClientHello _root() { return _root; }
        public void set_root(TlsClientHello _v) { _dirty = true; _root = _v; }
        public TlsClientHello.Extension _parent() { return _parent; }
        public void set_parent(TlsClientHello.Extension _v) { _dirty = true; _parent = _v; }
    }
    public static class CipherSuites extends KaitaiStruct.ReadWrite {
        public static CipherSuites fromFile(String fileName) throws IOException {
            return new CipherSuites(new ByteBufferKaitaiStream(fileName));
        }
        public CipherSuites() {
            this(null, null, null);
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
        }
        public void _read() {
            this.len = this._io.readU2be();
            this.cipherSuites = new ArrayList<Integer>();
            for (int i = 0; i < len() / 2; i++) {
                this.cipherSuites.add(this._io.readU2be());
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.cipherSuites.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.len);
            for (int i = 0; i < this.cipherSuites.size(); i++) {
                this._io.writeU2be(this.cipherSuites.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (this.cipherSuites.size() != len() / 2)
                throw new ConsistencyError("cipher_suites", len() / 2, this.cipherSuites.size());
            for (int i = 0; i < this.cipherSuites.size(); i++) {
            }
            _dirty = false;
        }
        private int len;
        private List<Integer> cipherSuites;
        private TlsClientHello _root;
        private TlsClientHello _parent;
        public int len() { return len; }
        public void setLen(int _v) { _dirty = true; len = _v; }
        public List<Integer> cipherSuites() { return cipherSuites; }
        public void setCipherSuites(List<Integer> _v) { _dirty = true; cipherSuites = _v; }
        public TlsClientHello _root() { return _root; }
        public void set_root(TlsClientHello _v) { _dirty = true; _root = _v; }
        public TlsClientHello _parent() { return _parent; }
        public void set_parent(TlsClientHello _v) { _dirty = true; _parent = _v; }
    }
    public static class CompressionMethods extends KaitaiStruct.ReadWrite {
        public static CompressionMethods fromFile(String fileName) throws IOException {
            return new CompressionMethods(new ByteBufferKaitaiStream(fileName));
        }
        public CompressionMethods() {
            this(null, null, null);
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
        }
        public void _read() {
            this.len = this._io.readU1();
            this.compressionMethods = this._io.readBytes(len());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.len);
            this._io.writeBytes(this.compressionMethods);
        }

        public void _check() {
            if (this.compressionMethods.length != len())
                throw new ConsistencyError("compression_methods", len(), this.compressionMethods.length);
            _dirty = false;
        }
        private int len;
        private byte[] compressionMethods;
        private TlsClientHello _root;
        private TlsClientHello _parent;
        public int len() { return len; }
        public void setLen(int _v) { _dirty = true; len = _v; }
        public byte[] compressionMethods() { return compressionMethods; }
        public void setCompressionMethods(byte[] _v) { _dirty = true; compressionMethods = _v; }
        public TlsClientHello _root() { return _root; }
        public void set_root(TlsClientHello _v) { _dirty = true; _root = _v; }
        public TlsClientHello _parent() { return _parent; }
        public void set_parent(TlsClientHello _v) { _dirty = true; _parent = _v; }
    }
    public static class Extension extends KaitaiStruct.ReadWrite {
        public static Extension fromFile(String fileName) throws IOException {
            return new Extension(new ByteBufferKaitaiStream(fileName));
        }
        public Extension() {
            this(null, null, null);
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
        }
        public void _read() {
            this.type = this._io.readU2be();
            this.len = this._io.readU2be();
            switch (type()) {
            case 0: {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new Sni(_io__raw_body, this, _root);
                ((Sni) (this.body))._read();
                break;
            }
            case 16: {
                this._raw_body = this._io.readBytes(len());
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new Alpn(_io__raw_body, this, _root);
                ((Alpn) (this.body))._read();
                break;
            }
            default: {
                this.body = this._io.readBytes(len());
                break;
            }
            }
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.type);
            this._io.writeU2be(this.len);
            switch (type()) {
            case 0: {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (len()));
                    final Extension _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != len())
                                throw new ConsistencyError("raw(body)", len(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((Sni) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            case 16: {
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(len());
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (len()));
                    final Extension _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (((byte[]) (_this._raw_body)).length != len())
                                throw new ConsistencyError("raw(body)", len(), ((byte[]) (_this._raw_body)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                        }
                    });
                }
                ((Alpn) (this.body))._write_Seq(_io__raw_body);
                break;
            }
            default: {
                this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                break;
            }
            }
        }

        public void _check() {
            switch (type()) {
            case 0: {
                if (!Objects.equals(((TlsClientHello.Sni) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((TlsClientHello.Sni) (this.body))._root());
                if (!Objects.equals(((TlsClientHello.Sni) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((TlsClientHello.Sni) (this.body))._parent());
                break;
            }
            case 16: {
                if (!Objects.equals(((TlsClientHello.Alpn) (this.body))._root(), _root()))
                    throw new ConsistencyError("body", _root(), ((TlsClientHello.Alpn) (this.body))._root());
                if (!Objects.equals(((TlsClientHello.Alpn) (this.body))._parent(), this))
                    throw new ConsistencyError("body", this, ((TlsClientHello.Alpn) (this.body))._parent());
                break;
            }
            default: {
                if (((byte[]) (this.body)).length != len())
                    throw new ConsistencyError("body", len(), ((byte[]) (this.body)).length);
                break;
            }
            }
            _dirty = false;
        }
        private int type;
        private int len;
        private Object body;
        private TlsClientHello _root;
        private TlsClientHello.Extensions _parent;
        private byte[] _raw_body;
        public int type() { return type; }
        public void setType(int _v) { _dirty = true; type = _v; }
        public int len() { return len; }
        public void setLen(int _v) { _dirty = true; len = _v; }
        public Object body() { return body; }
        public void setBody(Object _v) { _dirty = true; body = _v; }
        public TlsClientHello _root() { return _root; }
        public void set_root(TlsClientHello _v) { _dirty = true; _root = _v; }
        public TlsClientHello.Extensions _parent() { return _parent; }
        public void set_parent(TlsClientHello.Extensions _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_body() { return _raw_body; }
        public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
    }
    public static class Extensions extends KaitaiStruct.ReadWrite {
        public static Extensions fromFile(String fileName) throws IOException {
            return new Extensions(new ByteBufferKaitaiStream(fileName));
        }
        public Extensions() {
            this(null, null, null);
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
        }
        public void _read() {
            this.len = this._io.readU2be();
            this.extensions = new ArrayList<Extension>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    Extension _t_extensions = new Extension(this._io, this, _root);
                    try {
                        _t_extensions._read();
                    } finally {
                        this.extensions.add(_t_extensions);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.extensions.size(); i++) {
                this.extensions.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.len);
            for (int i = 0; i < this.extensions.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("extensions", 0, this._io.size() - this._io.pos());
                this.extensions.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("extensions", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.extensions.size(); i++) {
                if (!Objects.equals(this.extensions.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("extensions", _root(), this.extensions.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.extensions.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("extensions", this, this.extensions.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private int len;
        private List<Extension> extensions;
        private TlsClientHello _root;
        private TlsClientHello _parent;
        public int len() { return len; }
        public void setLen(int _v) { _dirty = true; len = _v; }
        public List<Extension> extensions() { return extensions; }
        public void setExtensions(List<Extension> _v) { _dirty = true; extensions = _v; }
        public TlsClientHello _root() { return _root; }
        public void set_root(TlsClientHello _v) { _dirty = true; _root = _v; }
        public TlsClientHello _parent() { return _parent; }
        public void set_parent(TlsClientHello _v) { _dirty = true; _parent = _v; }
    }
    public static class Protocol extends KaitaiStruct.ReadWrite {
        public static Protocol fromFile(String fileName) throws IOException {
            return new Protocol(new ByteBufferKaitaiStream(fileName));
        }
        public Protocol() {
            this(null, null, null);
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
        }
        public void _read() {
            this.strlen = this._io.readU1();
            this.name = this._io.readBytes(strlen());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.strlen);
            this._io.writeBytes(this.name);
        }

        public void _check() {
            if (this.name.length != strlen())
                throw new ConsistencyError("name", strlen(), this.name.length);
            _dirty = false;
        }
        private int strlen;
        private byte[] name;
        private TlsClientHello _root;
        private TlsClientHello.Alpn _parent;
        public int strlen() { return strlen; }
        public void setStrlen(int _v) { _dirty = true; strlen = _v; }
        public byte[] name() { return name; }
        public void setName(byte[] _v) { _dirty = true; name = _v; }
        public TlsClientHello _root() { return _root; }
        public void set_root(TlsClientHello _v) { _dirty = true; _root = _v; }
        public TlsClientHello.Alpn _parent() { return _parent; }
        public void set_parent(TlsClientHello.Alpn _v) { _dirty = true; _parent = _v; }
    }
    public static class Random extends KaitaiStruct.ReadWrite {
        public static Random fromFile(String fileName) throws IOException {
            return new Random(new ByteBufferKaitaiStream(fileName));
        }
        public Random() {
            this(null, null, null);
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
        }
        public void _read() {
            this.gmtUnixTime = this._io.readU4be();
            this.random = this._io.readBytes(28);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.gmtUnixTime);
            this._io.writeBytes(this.random);
        }

        public void _check() {
            if (this.random.length != 28)
                throw new ConsistencyError("random", 28, this.random.length);
            _dirty = false;
        }
        private long gmtUnixTime;
        private byte[] random;
        private TlsClientHello _root;
        private TlsClientHello _parent;
        public long gmtUnixTime() { return gmtUnixTime; }
        public void setGmtUnixTime(long _v) { _dirty = true; gmtUnixTime = _v; }
        public byte[] random() { return random; }
        public void setRandom(byte[] _v) { _dirty = true; random = _v; }
        public TlsClientHello _root() { return _root; }
        public void set_root(TlsClientHello _v) { _dirty = true; _root = _v; }
        public TlsClientHello _parent() { return _parent; }
        public void set_parent(TlsClientHello _v) { _dirty = true; _parent = _v; }
    }
    public static class ServerName extends KaitaiStruct.ReadWrite {
        public static ServerName fromFile(String fileName) throws IOException {
            return new ServerName(new ByteBufferKaitaiStream(fileName));
        }
        public ServerName() {
            this(null, null, null);
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
        }
        public void _read() {
            this.nameType = this._io.readU1();
            this.length = this._io.readU2be();
            this.hostName = this._io.readBytes(length());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.nameType);
            this._io.writeU2be(this.length);
            this._io.writeBytes(this.hostName);
        }

        public void _check() {
            if (this.hostName.length != length())
                throw new ConsistencyError("host_name", length(), this.hostName.length);
            _dirty = false;
        }
        private int nameType;
        private int length;
        private byte[] hostName;
        private TlsClientHello _root;
        private TlsClientHello.Sni _parent;
        public int nameType() { return nameType; }
        public void setNameType(int _v) { _dirty = true; nameType = _v; }
        public int length() { return length; }
        public void setLength(int _v) { _dirty = true; length = _v; }
        public byte[] hostName() { return hostName; }
        public void setHostName(byte[] _v) { _dirty = true; hostName = _v; }
        public TlsClientHello _root() { return _root; }
        public void set_root(TlsClientHello _v) { _dirty = true; _root = _v; }
        public TlsClientHello.Sni _parent() { return _parent; }
        public void set_parent(TlsClientHello.Sni _v) { _dirty = true; _parent = _v; }
    }
    public static class SessionId extends KaitaiStruct.ReadWrite {
        public static SessionId fromFile(String fileName) throws IOException {
            return new SessionId(new ByteBufferKaitaiStream(fileName));
        }
        public SessionId() {
            this(null, null, null);
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
        }
        public void _read() {
            this.len = this._io.readU1();
            this.sid = this._io.readBytes(len());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.len);
            this._io.writeBytes(this.sid);
        }

        public void _check() {
            if (this.sid.length != len())
                throw new ConsistencyError("sid", len(), this.sid.length);
            _dirty = false;
        }
        private int len;
        private byte[] sid;
        private TlsClientHello _root;
        private TlsClientHello _parent;
        public int len() { return len; }
        public void setLen(int _v) { _dirty = true; len = _v; }
        public byte[] sid() { return sid; }
        public void setSid(byte[] _v) { _dirty = true; sid = _v; }
        public TlsClientHello _root() { return _root; }
        public void set_root(TlsClientHello _v) { _dirty = true; _root = _v; }
        public TlsClientHello _parent() { return _parent; }
        public void set_parent(TlsClientHello _v) { _dirty = true; _parent = _v; }
    }
    public static class Sni extends KaitaiStruct.ReadWrite {
        public static Sni fromFile(String fileName) throws IOException {
            return new Sni(new ByteBufferKaitaiStream(fileName));
        }
        public Sni() {
            this(null, null, null);
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
        }
        public void _read() {
            this.listLength = this._io.readU2be();
            this.serverNames = new ArrayList<ServerName>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    ServerName _t_serverNames = new ServerName(this._io, this, _root);
                    try {
                        _t_serverNames._read();
                    } finally {
                        this.serverNames.add(_t_serverNames);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.serverNames.size(); i++) {
                this.serverNames.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.listLength);
            for (int i = 0; i < this.serverNames.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("server_names", 0, this._io.size() - this._io.pos());
                this.serverNames.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("server_names", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.serverNames.size(); i++) {
                if (!Objects.equals(this.serverNames.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("server_names", _root(), this.serverNames.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.serverNames.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("server_names", this, this.serverNames.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private int listLength;
        private List<ServerName> serverNames;
        private TlsClientHello _root;
        private TlsClientHello.Extension _parent;
        public int listLength() { return listLength; }
        public void setListLength(int _v) { _dirty = true; listLength = _v; }
        public List<ServerName> serverNames() { return serverNames; }
        public void setServerNames(List<ServerName> _v) { _dirty = true; serverNames = _v; }
        public TlsClientHello _root() { return _root; }
        public void set_root(TlsClientHello _v) { _dirty = true; _root = _v; }
        public TlsClientHello.Extension _parent() { return _parent; }
        public void set_parent(TlsClientHello.Extension _v) { _dirty = true; _parent = _v; }
    }
    public static class Version extends KaitaiStruct.ReadWrite {
        public static Version fromFile(String fileName) throws IOException {
            return new Version(new ByteBufferKaitaiStream(fileName));
        }
        public Version() {
            this(null, null, null);
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
        }
        public void _read() {
            this.major = this._io.readU1();
            this.minor = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.major);
            this._io.writeU1(this.minor);
        }

        public void _check() {
            _dirty = false;
        }
        private int major;
        private int minor;
        private TlsClientHello _root;
        private TlsClientHello _parent;
        public int major() { return major; }
        public void setMajor(int _v) { _dirty = true; major = _v; }
        public int minor() { return minor; }
        public void setMinor(int _v) { _dirty = true; minor = _v; }
        public TlsClientHello _root() { return _root; }
        public void set_root(TlsClientHello _v) { _dirty = true; _root = _v; }
        public TlsClientHello _parent() { return _parent; }
        public void set_parent(TlsClientHello _v) { _dirty = true; _parent = _v; }
    }
    private Version version;
    private Random random;
    private SessionId sessionId;
    private CipherSuites cipherSuites;
    private CompressionMethods compressionMethods;
    private Extensions extensions;
    private TlsClientHello _root;
    private KaitaiStruct.ReadWrite _parent;
    public Version version() { return version; }
    public void setVersion(Version _v) { _dirty = true; version = _v; }
    public Random random() { return random; }
    public void setRandom(Random _v) { _dirty = true; random = _v; }
    public SessionId sessionId() { return sessionId; }
    public void setSessionId(SessionId _v) { _dirty = true; sessionId = _v; }
    public CipherSuites cipherSuites() { return cipherSuites; }
    public void setCipherSuites(CipherSuites _v) { _dirty = true; cipherSuites = _v; }
    public CompressionMethods compressionMethods() { return compressionMethods; }
    public void setCompressionMethods(CompressionMethods _v) { _dirty = true; compressionMethods = _v; }
    public Extensions extensions() { return extensions; }
    public void setExtensions(Extensions _v) { _dirty = true; extensions = _v; }
    public TlsClientHello _root() { return _root; }
    public void set_root(TlsClientHello _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

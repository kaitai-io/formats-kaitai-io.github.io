// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.Arrays;


/**
 * Resource file found in CPB firmware archives, mostly used on older CoolPad
 * phones and/or tablets. The only observed files are called "ResPack.cfg".
 */
public class Respack extends KaitaiStruct.ReadWrite {
    public static Respack fromFile(String fileName) throws IOException {
        return new Respack(new ByteBufferKaitaiStream(fileName));
    }
    public Respack() {
        this(null, null, null);
    }

    public Respack(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Respack(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Respack(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Respack _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.header = new Header(this._io, this, _root);
        this.header._read();
        this.json = new String(this._io.readBytes(header().lenJson()), StandardCharsets.UTF_8);
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.header._write_Seq(this._io);
        this._io.writeBytes((this.json).getBytes(Charset.forName("UTF-8")));
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        if ((this.json).getBytes(Charset.forName("UTF-8")).length != header().lenJson())
            throw new ConsistencyError("json", header().lenJson(), (this.json).getBytes(Charset.forName("UTF-8")).length);
        _dirty = false;
    }
    public static class Header extends KaitaiStruct.ReadWrite {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }
        public Header() {
            this(null, null, null);
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, Respack _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, Respack _parent, Respack _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(2);
            if (!(Arrays.equals(this.magic, new byte[] { 82, 83 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 82, 83 }, this.magic, this._io, "/types/header/seq/0");
            }
            this.unknown = this._io.readBytes(8);
            this.lenJson = this._io.readU4le();
            this.md5 = new String(this._io.readBytes(32), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeBytes(this.unknown);
            this._io.writeU4le(this.lenJson);
            this._io.writeBytes((this.md5).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if (this.magic.length != 2)
                throw new ConsistencyError("magic", 2, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 82, 83 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 82, 83 }, this.magic, null, "/types/header/seq/0");
            }
            if (this.unknown.length != 8)
                throw new ConsistencyError("unknown", 8, this.unknown.length);
            if ((this.md5).getBytes(Charset.forName("UTF-8")).length != 32)
                throw new ConsistencyError("md5", 32, (this.md5).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private byte[] magic;
        private byte[] unknown;
        private long lenJson;
        private String md5;
        private Respack _root;
        private Respack _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public byte[] unknown() { return unknown; }
        public void setUnknown(byte[] _v) { _dirty = true; unknown = _v; }
        public long lenJson() { return lenJson; }
        public void setLenJson(long _v) { _dirty = true; lenJson = _v; }

        /**
         * MD5 of data that follows the header
         */
        public String md5() { return md5; }
        public void setMd5(String _v) { _dirty = true; md5 = _v; }
        public Respack _root() { return _root; }
        public void set_root(Respack _v) { _dirty = true; _root = _v; }
        public Respack _parent() { return _parent; }
        public void set_parent(Respack _v) { _dirty = true; _parent = _v; }
    }
    private Header header;
    private String json;
    private Respack _root;
    private KaitaiStruct.ReadWrite _parent;
    public Header header() { return header; }
    public void setHeader(Header _v) { _dirty = true; header = _v; }
    public String json() { return json; }
    public void setJson(String _v) { _dirty = true; json = _v; }
    public Respack _root() { return _root; }
    public void set_root(Respack _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

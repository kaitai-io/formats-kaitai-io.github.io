// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;


/**
 * Android apps using directly or indirectly OpenGL cache compiled shaders
 * into com.android.opengl.shaders_cache file.
 * @see <a href="https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/FileBlobCache.cpp">Source</a>
 */
public class AndroidOpenglShadersCache extends KaitaiStruct.ReadWrite {
    public static AndroidOpenglShadersCache fromFile(String fileName) throws IOException {
        return new AndroidOpenglShadersCache(new ByteBufferKaitaiStream(fileName));
    }
    public AndroidOpenglShadersCache() {
        this(null, null, null);
    }

    public AndroidOpenglShadersCache(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AndroidOpenglShadersCache(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public AndroidOpenglShadersCache(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, AndroidOpenglShadersCache _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { 69, 71, 76, 36 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 69, 71, 76, 36 }, this.magic, this._io, "/seq/0");
        }
        this.crc32 = this._io.readU4le();
        this._raw_contents = this._io.readBytesFull();
        KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(this._raw_contents);
        this.contents = new Cache(_io__raw_contents, this, _root);
        this.contents._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.contents._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.magic);
        this._io.writeU4le(this.crc32);
        final KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(this._io.size() - this._io.pos());
        this._io.addChildStream(_io__raw_contents);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (this._io.size() - this._io.pos()));
            final AndroidOpenglShadersCache _this = this;
            _io__raw_contents.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_contents = _io__raw_contents.toByteArray();
                    parent.writeBytes(_this._raw_contents);
                    if (!(parent.isEof()))
                        throw new ConsistencyError("raw(contents)", 0, parent.size() - parent.pos());
                }
            });
        }
        this.contents._write_Seq(_io__raw_contents);
    }

    public void _check() {
        if (this.magic.length != 4)
            throw new ConsistencyError("magic", 4, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 69, 71, 76, 36 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 69, 71, 76, 36 }, this.magic, null, "/seq/0");
        }
        if (!Objects.equals(this.contents._root(), _root()))
            throw new ConsistencyError("contents", _root(), this.contents._root());
        if (!Objects.equals(this.contents._parent(), this))
            throw new ConsistencyError("contents", this, this.contents._parent());
        _dirty = false;
    }
    public static class Alignment extends KaitaiStruct.ReadWrite {
        public static Alignment fromFile(String fileName) throws IOException {
            return new Alignment(new ByteBufferKaitaiStream(fileName));
        }
        public Alignment() {
            this(null, null, null);
        }

        public Alignment(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Alignment(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Alignment(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, AndroidOpenglShadersCache _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.alignment = this._io.readBytes(_io().pos() + 3 & ~3 - _io().pos());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            if (this.alignment.length != (_io().pos() + 3 & ~3 - _io().pos()))
                throw new ConsistencyError("alignment", _io().pos() + 3 & ~3 - _io().pos(), this.alignment.length);
            this._io.writeBytes(this.alignment);
        }

        public void _check() {
            _dirty = false;
        }
        private byte[] alignment;
        private AndroidOpenglShadersCache _root;
        private KaitaiStruct.ReadWrite _parent;

        /**
         * garbage from memory
         */
        public byte[] alignment() { return alignment; }
        public void setAlignment(byte[] _v) { _dirty = true; alignment = _v; }
        public AndroidOpenglShadersCache _root() { return _root; }
        public void set_root(AndroidOpenglShadersCache _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/BlobCache.cpp">Source</a>
     */
    public static class Cache extends KaitaiStruct.ReadWrite {
        public static Cache fromFile(String fileName) throws IOException {
            return new Cache(new ByteBufferKaitaiStream(fileName));
        }
        public Cache() {
            this(null, null, null);
        }

        public Cache(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Cache(KaitaiStream _io, AndroidOpenglShadersCache _parent) {
            this(_io, _parent, null);
        }

        public Cache(KaitaiStream _io, AndroidOpenglShadersCache _parent, AndroidOpenglShadersCache _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 36, 98, 66, 95 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 36, 98, 66, 95 }, this.magic, this._io, "/types/cache/seq/0");
            }
            this.version = this._io.readU4le();
            this.deviceVersion = this._io.readU4le();
            this.numEntries = this._io.readU4le();
            if (version() >= 3) {
                this.buildId = new PrefixedString(this._io, this, _root);
                this.buildId._read();
            }
            this.entries = new ArrayList<Entry>();
            for (int i = 0; i < numEntries(); i++) {
                Entry _t_entries = new Entry(this._io, this, _root);
                try {
                    _t_entries._read();
                } finally {
                    this.entries.add(_t_entries);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (version() >= 3) {
                this.buildId._fetchInstances();
            }
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU4le(this.version);
            this._io.writeU4le(this.deviceVersion);
            this._io.writeU4le(this.numEntries);
            if (version() >= 3) {
                this.buildId._write_Seq(this._io);
            }
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 36, 98, 66, 95 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 36, 98, 66, 95 }, this.magic, null, "/types/cache/seq/0");
            }
            if (version() >= 3) {
                if (!Objects.equals(this.buildId._root(), _root()))
                    throw new ConsistencyError("build_id", _root(), this.buildId._root());
                if (!Objects.equals(this.buildId._parent(), this))
                    throw new ConsistencyError("build_id", this, this.buildId._parent());
            }
            if (this.entries.size() != numEntries())
                throw new ConsistencyError("entries", numEntries(), this.entries.size());
            for (int i = 0; i < this.entries.size(); i++) {
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        public static class Entry extends KaitaiStruct.ReadWrite {
            public static Entry fromFile(String fileName) throws IOException {
                return new Entry(new ByteBufferKaitaiStream(fileName));
            }
            public Entry() {
                this(null, null, null);
            }

            public Entry(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Entry(KaitaiStream _io, AndroidOpenglShadersCache.Cache _parent) {
                this(_io, _parent, null);
            }

            public Entry(KaitaiStream _io, AndroidOpenglShadersCache.Cache _parent, AndroidOpenglShadersCache _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.lenKey = this._io.readU4le();
                this.lenValue = this._io.readU4le();
                this.key = this._io.readBytes(lenKey());
                this.value = this._io.readBytes(lenValue());
                this.alignment = new Alignment(this._io, this, _root);
                this.alignment._read();
                _dirty = false;
            }

            public void _fetchInstances() {
                this.alignment._fetchInstances();
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4le(this.lenKey);
                this._io.writeU4le(this.lenValue);
                this._io.writeBytes(this.key);
                this._io.writeBytes(this.value);
                this.alignment._write_Seq(this._io);
            }

            public void _check() {
                if (this.key.length != lenKey())
                    throw new ConsistencyError("key", lenKey(), this.key.length);
                if (this.value.length != lenValue())
                    throw new ConsistencyError("value", lenValue(), this.value.length);
                if (!Objects.equals(this.alignment._root(), _root()))
                    throw new ConsistencyError("alignment", _root(), this.alignment._root());
                if (!Objects.equals(this.alignment._parent(), this))
                    throw new ConsistencyError("alignment", this, this.alignment._parent());
                _dirty = false;
            }
            private long lenKey;
            private long lenValue;
            private byte[] key;
            private byte[] value;
            private Alignment alignment;
            private AndroidOpenglShadersCache _root;
            private AndroidOpenglShadersCache.Cache _parent;
            public long lenKey() { return lenKey; }
            public void setLenKey(long _v) { _dirty = true; lenKey = _v; }
            public long lenValue() { return lenValue; }
            public void setLenValue(long _v) { _dirty = true; lenValue = _v; }
            public byte[] key() { return key; }
            public void setKey(byte[] _v) { _dirty = true; key = _v; }
            public byte[] value() { return value; }
            public void setValue(byte[] _v) { _dirty = true; value = _v; }
            public Alignment alignment() { return alignment; }
            public void setAlignment(Alignment _v) { _dirty = true; alignment = _v; }
            public AndroidOpenglShadersCache _root() { return _root; }
            public void set_root(AndroidOpenglShadersCache _v) { _dirty = true; _root = _v; }
            public AndroidOpenglShadersCache.Cache _parent() { return _parent; }
            public void set_parent(AndroidOpenglShadersCache.Cache _v) { _dirty = true; _parent = _v; }
        }
        private byte[] magic;
        private long version;
        private long deviceVersion;
        private long numEntries;
        private PrefixedString buildId;
        private List<Entry> entries;
        private AndroidOpenglShadersCache _root;
        private AndroidOpenglShadersCache _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public long version() { return version; }
        public void setVersion(long _v) { _dirty = true; version = _v; }
        public long deviceVersion() { return deviceVersion; }
        public void setDeviceVersion(long _v) { _dirty = true; deviceVersion = _v; }
        public long numEntries() { return numEntries; }
        public void setNumEntries(long _v) { _dirty = true; numEntries = _v; }
        public PrefixedString buildId() { return buildId; }
        public void setBuildId(PrefixedString _v) { _dirty = true; buildId = _v; }
        public List<Entry> entries() { return entries; }
        public void setEntries(List<Entry> _v) { _dirty = true; entries = _v; }
        public AndroidOpenglShadersCache _root() { return _root; }
        public void set_root(AndroidOpenglShadersCache _v) { _dirty = true; _root = _v; }
        public AndroidOpenglShadersCache _parent() { return _parent; }
        public void set_parent(AndroidOpenglShadersCache _v) { _dirty = true; _parent = _v; }
    }
    public static class PrefixedString extends KaitaiStruct.ReadWrite {
        public static PrefixedString fromFile(String fileName) throws IOException {
            return new PrefixedString(new ByteBufferKaitaiStream(fileName));
        }
        public PrefixedString() {
            this(null, null, null);
        }

        public PrefixedString(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PrefixedString(KaitaiStream _io, AndroidOpenglShadersCache.Cache _parent) {
            this(_io, _parent, null);
        }

        public PrefixedString(KaitaiStream _io, AndroidOpenglShadersCache.Cache _parent, AndroidOpenglShadersCache _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lenStr = this._io.readU4le();
            this.str = new String(KaitaiStream.bytesTerminate(this._io.readBytes(lenStr()), (byte) 0, false), StandardCharsets.US_ASCII);
            this.alignment = new Alignment(this._io, this, _root);
            this.alignment._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.alignment._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.lenStr);
            this._io.writeBytesLimit((this.str).getBytes(Charset.forName("ASCII")), lenStr(), (byte) 0, (byte) 0);
            this.alignment._write_Seq(this._io);
        }

        public void _check() {
            if ((this.str).getBytes(Charset.forName("ASCII")).length > lenStr())
                throw new ConsistencyError("str", lenStr(), (this.str).getBytes(Charset.forName("ASCII")).length);
            if (KaitaiStream.byteArrayIndexOf((this.str).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("str", -1, KaitaiStream.byteArrayIndexOf((this.str).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            if (!Objects.equals(this.alignment._root(), _root()))
                throw new ConsistencyError("alignment", _root(), this.alignment._root());
            if (!Objects.equals(this.alignment._parent(), this))
                throw new ConsistencyError("alignment", this, this.alignment._parent());
            _dirty = false;
        }
        private long lenStr;
        private String str;
        private Alignment alignment;
        private AndroidOpenglShadersCache _root;
        private AndroidOpenglShadersCache.Cache _parent;
        public long lenStr() { return lenStr; }
        public void setLenStr(long _v) { _dirty = true; lenStr = _v; }
        public String str() { return str; }
        public void setStr(String _v) { _dirty = true; str = _v; }
        public Alignment alignment() { return alignment; }
        public void setAlignment(Alignment _v) { _dirty = true; alignment = _v; }
        public AndroidOpenglShadersCache _root() { return _root; }
        public void set_root(AndroidOpenglShadersCache _v) { _dirty = true; _root = _v; }
        public AndroidOpenglShadersCache.Cache _parent() { return _parent; }
        public void set_parent(AndroidOpenglShadersCache.Cache _v) { _dirty = true; _parent = _v; }
    }
    private byte[] magic;
    private long crc32;
    private Cache contents;
    private AndroidOpenglShadersCache _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_contents;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }

    /**
     * crc32 of `contents`
     */
    public long crc32() { return crc32; }
    public void setCrc32(long _v) { _dirty = true; crc32 = _v; }
    public Cache contents() { return contents; }
    public void setContents(Cache _v) { _dirty = true; contents = _v; }
    public AndroidOpenglShadersCache _root() { return _root; }
    public void set_root(AndroidOpenglShadersCache _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_contents() { return _raw_contents; }
    public void set_raw_Contents(byte[] _v) { _dirty = true; _raw_contents = _v; }
}

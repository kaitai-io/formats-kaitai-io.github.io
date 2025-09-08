// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.StandardCharsets;


/**
 * Android apps using directly or indirectly OpenGL cache compiled shaders
 * into com.android.opengl.shaders_cache file.
 * @see <a href="https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/FileBlobCache.cpp">Source</a>
 */
public class AndroidOpenglShadersCache extends KaitaiStruct {
    public static AndroidOpenglShadersCache fromFile(String fileName) throws IOException {
        return new AndroidOpenglShadersCache(new ByteBufferKaitaiStream(fileName));
    }

    public AndroidOpenglShadersCache(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AndroidOpenglShadersCache(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public AndroidOpenglShadersCache(KaitaiStream _io, KaitaiStruct _parent, AndroidOpenglShadersCache _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { 69, 71, 76, 36 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 69, 71, 76, 36 }, this.magic, this._io, "/seq/0");
        }
        this.crc32 = this._io.readU4le();
        this._raw_contents = this._io.readBytesFull();
        KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(this._raw_contents);
        this.contents = new Cache(_io__raw_contents, this, _root);
    }

    public void _fetchInstances() {
        this.contents._fetchInstances();
    }
    public static class Alignment extends KaitaiStruct {
        public static Alignment fromFile(String fileName) throws IOException {
            return new Alignment(new ByteBufferKaitaiStream(fileName));
        }

        public Alignment(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Alignment(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Alignment(KaitaiStream _io, KaitaiStruct _parent, AndroidOpenglShadersCache _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.alignment = this._io.readBytes(_io().pos() + 3 & ~3 - _io().pos());
        }

        public void _fetchInstances() {
        }
        private byte[] alignment;
        private AndroidOpenglShadersCache _root;
        private KaitaiStruct _parent;

        /**
         * garbage from memory
         */
        public byte[] alignment() { return alignment; }
        public AndroidOpenglShadersCache _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * @see <a href="https://android.googlesource.com/platform/frameworks/native/+/master/opengl/libs/EGL/BlobCache.cpp">Source</a>
     */
    public static class Cache extends KaitaiStruct {
        public static Cache fromFile(String fileName) throws IOException {
            return new Cache(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 36, 98, 66, 95 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 36, 98, 66, 95 }, this.magic, this._io, "/types/cache/seq/0");
            }
            this.version = this._io.readU4le();
            this.deviceVersion = this._io.readU4le();
            this.numEntries = this._io.readU4le();
            if (version() >= 3) {
                this.buildId = new PrefixedString(this._io, this, _root);
            }
            this.entries = new ArrayList<Entry>();
            for (int i = 0; i < numEntries(); i++) {
                this.entries.add(new Entry(this._io, this, _root));
            }
        }

        public void _fetchInstances() {
            if (version() >= 3) {
                this.buildId._fetchInstances();
            }
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        public static class Entry extends KaitaiStruct {
            public static Entry fromFile(String fileName) throws IOException {
                return new Entry(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.lenKey = this._io.readU4le();
                this.lenValue = this._io.readU4le();
                this.key = this._io.readBytes(lenKey());
                this.value = this._io.readBytes(lenValue());
                this.alignment = new Alignment(this._io, this, _root);
            }

            public void _fetchInstances() {
                this.alignment._fetchInstances();
            }
            private long lenKey;
            private long lenValue;
            private byte[] key;
            private byte[] value;
            private Alignment alignment;
            private AndroidOpenglShadersCache _root;
            private AndroidOpenglShadersCache.Cache _parent;
            public long lenKey() { return lenKey; }
            public long lenValue() { return lenValue; }
            public byte[] key() { return key; }
            public byte[] value() { return value; }
            public Alignment alignment() { return alignment; }
            public AndroidOpenglShadersCache _root() { return _root; }
            public AndroidOpenglShadersCache.Cache _parent() { return _parent; }
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
        public long version() { return version; }
        public long deviceVersion() { return deviceVersion; }
        public long numEntries() { return numEntries; }
        public PrefixedString buildId() { return buildId; }
        public List<Entry> entries() { return entries; }
        public AndroidOpenglShadersCache _root() { return _root; }
        public AndroidOpenglShadersCache _parent() { return _parent; }
    }
    public static class PrefixedString extends KaitaiStruct {
        public static PrefixedString fromFile(String fileName) throws IOException {
            return new PrefixedString(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.lenStr = this._io.readU4le();
            this.str = new String(KaitaiStream.bytesTerminate(this._io.readBytes(lenStr()), (byte) 0, false), StandardCharsets.US_ASCII);
            this.alignment = new Alignment(this._io, this, _root);
        }

        public void _fetchInstances() {
            this.alignment._fetchInstances();
        }
        private long lenStr;
        private String str;
        private Alignment alignment;
        private AndroidOpenglShadersCache _root;
        private AndroidOpenglShadersCache.Cache _parent;
        public long lenStr() { return lenStr; }
        public String str() { return str; }
        public Alignment alignment() { return alignment; }
        public AndroidOpenglShadersCache _root() { return _root; }
        public AndroidOpenglShadersCache.Cache _parent() { return _parent; }
    }
    private byte[] magic;
    private long crc32;
    private Cache contents;
    private AndroidOpenglShadersCache _root;
    private KaitaiStruct _parent;
    private byte[] _raw_contents;
    public byte[] magic() { return magic; }

    /**
     * crc32 of `contents`
     */
    public long crc32() { return crc32; }
    public Cache contents() { return contents; }
    public AndroidOpenglShadersCache _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_contents() { return _raw_contents; }
}

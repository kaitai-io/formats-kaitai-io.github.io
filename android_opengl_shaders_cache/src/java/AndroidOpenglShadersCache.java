// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;


/**
 * Android apps using directly or indirectly OpenGL cache compiled shaders into com.android.opengl.shaders_cache file.
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
        this.signature = this._io.ensureFixedContents(new byte[] { 69, 71, 76, 36 });
        this.crc32 = this._io.readU4le();
        this._raw_contents = this._io.readBytesFull();
        KaitaiStream _io__raw_contents = new ByteBufferKaitaiStream(_raw_contents);
        this.contents = new Cache(_io__raw_contents, this, _root);
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
            this.alignment = this._io.readBytes(((_io().pos() + 3) & (~3 - _io().pos())));
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
    public static class String extends KaitaiStruct {
        public static String fromFile(String fileName) throws IOException {
            return new String(new ByteBufferKaitaiStream(fileName));
        }

        public String(KaitaiStream _io) {
            this(_io, null, null);
        }

        public String(KaitaiStream _io, AndroidOpenglShadersCache.Cache _parent) {
            this(_io, _parent, null);
        }

        public String(KaitaiStream _io, AndroidOpenglShadersCache.Cache _parent, AndroidOpenglShadersCache _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.length = this._io.readU4le();
            this.str = new String(KaitaiStream.bytesTerminate(this._io.readBytes(length()), (byte) 0, false), Charset.forName("ascii"));
            this.alignment = new Alignment(this._io, this, _root);
        }
        private long length;
        private String str;
        private Alignment alignment;
        private AndroidOpenglShadersCache _root;
        private AndroidOpenglShadersCache.Cache _parent;
        public long length() { return length; }
        public String str() { return str; }
        public Alignment alignment() { return alignment; }
        public AndroidOpenglShadersCache _root() { return _root; }
        public AndroidOpenglShadersCache.Cache _parent() { return _parent; }
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
            this.signature = this._io.ensureFixedContents(new byte[] { 36, 98, 66, 95 });
            this.version = this._io.readU4le();
            this.deviceVersion = this._io.readU4le();
            this.countOfEntries = this._io.readU4le();
            if (version() >= 3) {
                this.buildId = new String(this._io, this, _root);
            }
            entries = new ArrayList<Entry>((int) (countOfEntries()));
            for (int i = 0; i < countOfEntries(); i++) {
                this.entries.add(new Entry(this._io, this, _root));
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
                this.keySize = this._io.readU4le();
                this.valueSize = this._io.readU4le();
                this.key = this._io.readBytes(keySize());
                this.value = this._io.readBytes(valueSize());
                this.alignment = new Alignment(this._io, this, _root);
            }
            private long keySize;
            private long valueSize;
            private byte[] key;
            private byte[] value;
            private Alignment alignment;
            private AndroidOpenglShadersCache _root;
            private AndroidOpenglShadersCache.Cache _parent;
            public long keySize() { return keySize; }
            public long valueSize() { return valueSize; }
            public byte[] key() { return key; }
            public byte[] value() { return value; }
            public Alignment alignment() { return alignment; }
            public AndroidOpenglShadersCache _root() { return _root; }
            public AndroidOpenglShadersCache.Cache _parent() { return _parent; }
        }
        private byte[] signature;
        private long version;
        private long deviceVersion;
        private long countOfEntries;
        private String buildId;
        private ArrayList<Entry> entries;
        private AndroidOpenglShadersCache _root;
        private AndroidOpenglShadersCache _parent;
        public byte[] signature() { return signature; }
        public long version() { return version; }
        public long deviceVersion() { return deviceVersion; }
        public long countOfEntries() { return countOfEntries; }
        public String buildId() { return buildId; }
        public ArrayList<Entry> entries() { return entries; }
        public AndroidOpenglShadersCache _root() { return _root; }
        public AndroidOpenglShadersCache _parent() { return _parent; }
    }
    private byte[] signature;
    private long crc32;
    private Cache contents;
    private AndroidOpenglShadersCache _root;
    private KaitaiStruct _parent;
    private byte[] _raw_contents;
    public byte[] signature() { return signature; }

    /**
     * crc32 of `contents`
     */
    public long crc32() { return crc32; }
    public Cache contents() { return contents; }
    public AndroidOpenglShadersCache _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_contents() { return _raw_contents; }
}

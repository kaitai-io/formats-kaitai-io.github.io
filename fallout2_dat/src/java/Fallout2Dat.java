// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.StandardCharsets;

public class Fallout2Dat extends KaitaiStruct {
    public static Fallout2Dat fromFile(String fileName) throws IOException {
        return new Fallout2Dat(new ByteBufferKaitaiStream(fileName));
    }

    public enum Compression {
        NONE(0),
        ZLIB(1);

        private final long id;
        Compression(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Compression> byId = new HashMap<Long, Compression>(2);
        static {
            for (Compression e : Compression.values())
                byId.put(e.id(), e);
        }
        public static Compression byId(long id) { return byId.get(id); }
    }

    public Fallout2Dat(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Fallout2Dat(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Fallout2Dat(KaitaiStream _io, KaitaiStruct _parent, Fallout2Dat _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
    }

    public void _fetchInstances() {
        footer();
        if (this.footer != null) {
            this.footer._fetchInstances();
        }
        index();
        if (this.index != null) {
            this.index._fetchInstances();
        }
    }
    public static class File extends KaitaiStruct {
        public static File fromFile(String fileName) throws IOException {
            return new File(new ByteBufferKaitaiStream(fileName));
        }

        public File(KaitaiStream _io) {
            this(_io, null, null);
        }

        public File(KaitaiStream _io, Fallout2Dat.Index _parent) {
            this(_io, _parent, null);
        }

        public File(KaitaiStream _io, Fallout2Dat.Index _parent, Fallout2Dat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.name = new Pstr(this._io, this, _root);
            this.flags = Fallout2Dat.Compression.byId(this._io.readU1());
            this.sizeUnpacked = this._io.readU4le();
            this.sizePacked = this._io.readU4le();
            this.offset = this._io.readU4le();
        }

        public void _fetchInstances() {
            this.name._fetchInstances();
            contentsRaw();
            if (this.contentsRaw != null) {
            }
            contentsZlib();
            if (this.contentsZlib != null) {
            }
        }
        private byte[] contents;
        public byte[] contents() {
            if (this.contents != null)
                return this.contents;
            if ( ((flags() == Fallout2Dat.Compression.ZLIB) || (flags() == Fallout2Dat.Compression.NONE)) ) {
                this.contents = (flags() == Fallout2Dat.Compression.ZLIB ? contentsZlib() : contentsRaw());
            }
            return this.contents;
        }
        private byte[] contentsRaw;
        public byte[] contentsRaw() {
            if (this.contentsRaw != null)
                return this.contentsRaw;
            if (flags() == Fallout2Dat.Compression.NONE) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(offset());
                this.contentsRaw = io.readBytes(sizeUnpacked());
                io.seek(_pos);
            }
            return this.contentsRaw;
        }
        private byte[] contentsZlib;
        public byte[] contentsZlib() {
            if (this.contentsZlib != null)
                return this.contentsZlib;
            if (flags() == Fallout2Dat.Compression.ZLIB) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(offset());
                this._raw_contentsZlib = io.readBytes(sizePacked());
                this.contentsZlib = KaitaiStream.processZlib(this._raw_contentsZlib);
                io.seek(_pos);
            }
            return this.contentsZlib;
        }
        private Pstr name;
        private Compression flags;
        private long sizeUnpacked;
        private long sizePacked;
        private long offset;
        private Fallout2Dat _root;
        private Fallout2Dat.Index _parent;
        private byte[] _raw_contentsZlib;
        public Pstr name() { return name; }
        public Compression flags() { return flags; }
        public long sizeUnpacked() { return sizeUnpacked; }
        public long sizePacked() { return sizePacked; }
        public long offset() { return offset; }
        public Fallout2Dat _root() { return _root; }
        public Fallout2Dat.Index _parent() { return _parent; }
        public byte[] _raw_contentsZlib() { return _raw_contentsZlib; }
    }
    public static class Footer extends KaitaiStruct {
        public static Footer fromFile(String fileName) throws IOException {
            return new Footer(new ByteBufferKaitaiStream(fileName));
        }

        public Footer(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Footer(KaitaiStream _io, Fallout2Dat _parent) {
            this(_io, _parent, null);
        }

        public Footer(KaitaiStream _io, Fallout2Dat _parent, Fallout2Dat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.indexSize = this._io.readU4le();
            this.fileSize = this._io.readU4le();
        }

        public void _fetchInstances() {
        }
        private long indexSize;
        private long fileSize;
        private Fallout2Dat _root;
        private Fallout2Dat _parent;
        public long indexSize() { return indexSize; }
        public long fileSize() { return fileSize; }
        public Fallout2Dat _root() { return _root; }
        public Fallout2Dat _parent() { return _parent; }
    }
    public static class Index extends KaitaiStruct {
        public static Index fromFile(String fileName) throws IOException {
            return new Index(new ByteBufferKaitaiStream(fileName));
        }

        public Index(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Index(KaitaiStream _io, Fallout2Dat _parent) {
            this(_io, _parent, null);
        }

        public Index(KaitaiStream _io, Fallout2Dat _parent, Fallout2Dat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.fileCount = this._io.readU4le();
            this.files = new ArrayList<File>();
            for (int i = 0; i < fileCount(); i++) {
                this.files.add(new File(this._io, this, _root));
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.files.size(); i++) {
                this.files.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private long fileCount;
        private List<File> files;
        private Fallout2Dat _root;
        private Fallout2Dat _parent;
        public long fileCount() { return fileCount; }
        public List<File> files() { return files; }
        public Fallout2Dat _root() { return _root; }
        public Fallout2Dat _parent() { return _parent; }
    }
    public static class Pstr extends KaitaiStruct {
        public static Pstr fromFile(String fileName) throws IOException {
            return new Pstr(new ByteBufferKaitaiStream(fileName));
        }

        public Pstr(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Pstr(KaitaiStream _io, Fallout2Dat.File _parent) {
            this(_io, _parent, null);
        }

        public Pstr(KaitaiStream _io, Fallout2Dat.File _parent, Fallout2Dat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.size = this._io.readU4le();
            this.str = new String(this._io.readBytes(size()), StandardCharsets.US_ASCII);
        }

        public void _fetchInstances() {
        }
        private long size;
        private String str;
        private Fallout2Dat _root;
        private Fallout2Dat.File _parent;
        public long size() { return size; }
        public String str() { return str; }
        public Fallout2Dat _root() { return _root; }
        public Fallout2Dat.File _parent() { return _parent; }
    }
    private Footer footer;
    public Footer footer() {
        if (this.footer != null)
            return this.footer;
        long _pos = this._io.pos();
        this._io.seek(_io().size() - 8);
        this.footer = new Footer(this._io, this, _root);
        this._io.seek(_pos);
        return this.footer;
    }
    private Index index;
    public Index index() {
        if (this.index != null)
            return this.index;
        long _pos = this._io.pos();
        this._io.seek((_io().size() - 8) - footer().indexSize());
        this.index = new Index(this._io, this, _root);
        this._io.seek(_pos);
        return this.index;
    }
    private Fallout2Dat _root;
    private KaitaiStruct _parent;
    public Fallout2Dat _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

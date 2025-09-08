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

public class FalloutDat extends KaitaiStruct {
    public static FalloutDat fromFile(String fileName) throws IOException {
        return new FalloutDat(new ByteBufferKaitaiStream(fileName));
    }

    public enum Compression {
        NONE(32),
        LZSS(64);

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

    public FalloutDat(KaitaiStream _io) {
        this(_io, null, null);
    }

    public FalloutDat(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public FalloutDat(KaitaiStream _io, KaitaiStruct _parent, FalloutDat _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.folderCount = this._io.readU4be();
        this.unknown1 = this._io.readU4be();
        this.unknown2 = this._io.readU4be();
        this.timestamp = this._io.readU4be();
        this.folderNames = new ArrayList<Pstr>();
        for (int i = 0; i < folderCount(); i++) {
            this.folderNames.add(new Pstr(this._io, this, _root));
        }
        this.folders = new ArrayList<Folder>();
        for (int i = 0; i < folderCount(); i++) {
            this.folders.add(new Folder(this._io, this, _root));
        }
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.folderNames.size(); i++) {
            this.folderNames.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.folders.size(); i++) {
            this.folders.get(((Number) (i)).intValue())._fetchInstances();
        }
    }
    public static class File extends KaitaiStruct {
        public static File fromFile(String fileName) throws IOException {
            return new File(new ByteBufferKaitaiStream(fileName));
        }

        public File(KaitaiStream _io) {
            this(_io, null, null);
        }

        public File(KaitaiStream _io, FalloutDat.Folder _parent) {
            this(_io, _parent, null);
        }

        public File(KaitaiStream _io, FalloutDat.Folder _parent, FalloutDat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.name = new Pstr(this._io, this, _root);
            this.flags = FalloutDat.Compression.byId(this._io.readU4be());
            this.offset = this._io.readU4be();
            this.sizeUnpacked = this._io.readU4be();
            this.sizePacked = this._io.readU4be();
        }

        public void _fetchInstances() {
            this.name._fetchInstances();
            contents();
            if (this.contents != null) {
            }
        }
        private byte[] contents;
        public byte[] contents() {
            if (this.contents != null)
                return this.contents;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(offset());
            this.contents = io.readBytes((flags() == FalloutDat.Compression.NONE ? sizeUnpacked() : sizePacked()));
            io.seek(_pos);
            return this.contents;
        }
        private Pstr name;
        private Compression flags;
        private long offset;
        private long sizeUnpacked;
        private long sizePacked;
        private FalloutDat _root;
        private FalloutDat.Folder _parent;
        public Pstr name() { return name; }
        public Compression flags() { return flags; }
        public long offset() { return offset; }
        public long sizeUnpacked() { return sizeUnpacked; }
        public long sizePacked() { return sizePacked; }
        public FalloutDat _root() { return _root; }
        public FalloutDat.Folder _parent() { return _parent; }
    }
    public static class Folder extends KaitaiStruct {
        public static Folder fromFile(String fileName) throws IOException {
            return new Folder(new ByteBufferKaitaiStream(fileName));
        }

        public Folder(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Folder(KaitaiStream _io, FalloutDat _parent) {
            this(_io, _parent, null);
        }

        public Folder(KaitaiStream _io, FalloutDat _parent, FalloutDat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.fileCount = this._io.readU4be();
            this.unknown = this._io.readU4be();
            this.flags = this._io.readU4be();
            this.timestamp = this._io.readU4be();
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
        private long unknown;
        private long flags;
        private long timestamp;
        private List<File> files;
        private FalloutDat _root;
        private FalloutDat _parent;
        public long fileCount() { return fileCount; }
        public long unknown() { return unknown; }
        public long flags() { return flags; }
        public long timestamp() { return timestamp; }
        public List<File> files() { return files; }
        public FalloutDat _root() { return _root; }
        public FalloutDat _parent() { return _parent; }
    }
    public static class Pstr extends KaitaiStruct {
        public static Pstr fromFile(String fileName) throws IOException {
            return new Pstr(new ByteBufferKaitaiStream(fileName));
        }

        public Pstr(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Pstr(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Pstr(KaitaiStream _io, KaitaiStruct _parent, FalloutDat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.size = this._io.readU1();
            this.str = new String(this._io.readBytes(size()), StandardCharsets.US_ASCII);
        }

        public void _fetchInstances() {
        }
        private int size;
        private String str;
        private FalloutDat _root;
        private KaitaiStruct _parent;
        public int size() { return size; }
        public String str() { return str; }
        public FalloutDat _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    private long folderCount;
    private long unknown1;
    private long unknown2;
    private long timestamp;
    private List<Pstr> folderNames;
    private List<Folder> folders;
    private FalloutDat _root;
    private KaitaiStruct _parent;
    public long folderCount() { return folderCount; }
    public long unknown1() { return unknown1; }
    public long unknown2() { return unknown2; }
    public long timestamp() { return timestamp; }
    public List<Pstr> folderNames() { return folderNames; }
    public List<Folder> folders() { return folders; }
    public FalloutDat _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;

public class FalloutDat extends KaitaiStruct.ReadWrite {
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
    public FalloutDat() {
        this(null, null, null);
    }

    public FalloutDat(KaitaiStream _io) {
        this(_io, null, null);
    }

    public FalloutDat(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public FalloutDat(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, FalloutDat _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.folderCount = this._io.readU4be();
        this.unknown1 = this._io.readU4be();
        this.unknown2 = this._io.readU4be();
        this.timestamp = this._io.readU4be();
        this.folderNames = new ArrayList<Pstr>();
        for (int i = 0; i < folderCount(); i++) {
            Pstr _t_folderNames = new Pstr(this._io, this, _root);
            try {
                _t_folderNames._read();
            } finally {
                this.folderNames.add(_t_folderNames);
            }
        }
        this.folders = new ArrayList<Folder>();
        for (int i = 0; i < folderCount(); i++) {
            Folder _t_folders = new Folder(this._io, this, _root);
            try {
                _t_folders._read();
            } finally {
                this.folders.add(_t_folders);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.folderNames.size(); i++) {
            this.folderNames.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.folders.size(); i++) {
            this.folders.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeU4be(this.folderCount);
        this._io.writeU4be(this.unknown1);
        this._io.writeU4be(this.unknown2);
        this._io.writeU4be(this.timestamp);
        for (int i = 0; i < this.folderNames.size(); i++) {
            this.folderNames.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        for (int i = 0; i < this.folders.size(); i++) {
            this.folders.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (this.folderNames.size() != folderCount())
            throw new ConsistencyError("folder_names", folderCount(), this.folderNames.size());
        for (int i = 0; i < this.folderNames.size(); i++) {
            if (!Objects.equals(this.folderNames.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("folder_names", _root(), this.folderNames.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.folderNames.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("folder_names", this, this.folderNames.get(((Number) (i)).intValue())._parent());
        }
        if (this.folders.size() != folderCount())
            throw new ConsistencyError("folders", folderCount(), this.folders.size());
        for (int i = 0; i < this.folders.size(); i++) {
            if (!Objects.equals(this.folders.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("folders", _root(), this.folders.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.folders.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("folders", this, this.folders.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class File extends KaitaiStruct.ReadWrite {
        public static File fromFile(String fileName) throws IOException {
            return new File(new ByteBufferKaitaiStream(fileName));
        }
        public File() {
            this(null, null, null);
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
        }
        public void _read() {
            this.name = new Pstr(this._io, this, _root);
            this.name._read();
            this.flags = FalloutDat.Compression.byId(this._io.readU4be());
            this.offset = this._io.readU4be();
            this.sizeUnpacked = this._io.readU4be();
            this.sizePacked = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.name._fetchInstances();
            contents();
            if (this.contents != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteContents = _enabledContents;
            this.name._write_Seq(this._io);
            this._io.writeU4be(((Number) (this.flags.id())).longValue());
            this._io.writeU4be(this.offset);
            this._io.writeU4be(this.sizeUnpacked);
            this._io.writeU4be(this.sizePacked);
        }

        public void _check() {
            if (!Objects.equals(this.name._root(), _root()))
                throw new ConsistencyError("name", _root(), this.name._root());
            if (!Objects.equals(this.name._parent(), this))
                throw new ConsistencyError("name", this, this.name._parent());
            if (_enabledContents) {
                if (this.contents.length != (flags() == FalloutDat.Compression.NONE ? sizeUnpacked() : sizePacked()))
                    throw new ConsistencyError("contents", (flags() == FalloutDat.Compression.NONE ? sizeUnpacked() : sizePacked()), this.contents.length);
            }
            _dirty = false;
        }
        private byte[] contents;
        private boolean _shouldWriteContents = false;
        private boolean _enabledContents = true;
        public byte[] contents() {
            if (_shouldWriteContents)
                _writeContents();
            if (this.contents != null)
                return this.contents;
            if (!_enabledContents)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(offset());
            this.contents = io.readBytes((flags() == FalloutDat.Compression.NONE ? sizeUnpacked() : sizePacked()));
            io.seek(_pos);
            return this.contents;
        }
        public void setContents(byte[] _v) { _dirty = true; contents = _v; }
        public void setContents_Enabled(boolean _v) { _dirty = true; _enabledContents = _v; }

        private void _writeContents() {
            _shouldWriteContents = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(offset());
            io.writeBytes(this.contents);
            io.seek(_pos);
        }
        private Pstr name;
        private Compression flags;
        private long offset;
        private long sizeUnpacked;
        private long sizePacked;
        private FalloutDat _root;
        private FalloutDat.Folder _parent;
        public Pstr name() { return name; }
        public void setName(Pstr _v) { _dirty = true; name = _v; }
        public Compression flags() { return flags; }
        public void setFlags(Compression _v) { _dirty = true; flags = _v; }
        public long offset() { return offset; }
        public void setOffset(long _v) { _dirty = true; offset = _v; }
        public long sizeUnpacked() { return sizeUnpacked; }
        public void setSizeUnpacked(long _v) { _dirty = true; sizeUnpacked = _v; }
        public long sizePacked() { return sizePacked; }
        public void setSizePacked(long _v) { _dirty = true; sizePacked = _v; }
        public FalloutDat _root() { return _root; }
        public void set_root(FalloutDat _v) { _dirty = true; _root = _v; }
        public FalloutDat.Folder _parent() { return _parent; }
        public void set_parent(FalloutDat.Folder _v) { _dirty = true; _parent = _v; }
    }
    public static class Folder extends KaitaiStruct.ReadWrite {
        public static Folder fromFile(String fileName) throws IOException {
            return new Folder(new ByteBufferKaitaiStream(fileName));
        }
        public Folder() {
            this(null, null, null);
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
        }
        public void _read() {
            this.fileCount = this._io.readU4be();
            this.unknown = this._io.readU4be();
            this.flags = this._io.readU4be();
            this.timestamp = this._io.readU4be();
            this.files = new ArrayList<File>();
            for (int i = 0; i < fileCount(); i++) {
                File _t_files = new File(this._io, this, _root);
                try {
                    _t_files._read();
                } finally {
                    this.files.add(_t_files);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.files.size(); i++) {
                this.files.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.fileCount);
            this._io.writeU4be(this.unknown);
            this._io.writeU4be(this.flags);
            this._io.writeU4be(this.timestamp);
            for (int i = 0; i < this.files.size(); i++) {
                this.files.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.files.size() != fileCount())
                throw new ConsistencyError("files", fileCount(), this.files.size());
            for (int i = 0; i < this.files.size(); i++) {
                if (!Objects.equals(this.files.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("files", _root(), this.files.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.files.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("files", this, this.files.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private long fileCount;
        private long unknown;
        private long flags;
        private long timestamp;
        private List<File> files;
        private FalloutDat _root;
        private FalloutDat _parent;
        public long fileCount() { return fileCount; }
        public void setFileCount(long _v) { _dirty = true; fileCount = _v; }
        public long unknown() { return unknown; }
        public void setUnknown(long _v) { _dirty = true; unknown = _v; }
        public long flags() { return flags; }
        public void setFlags(long _v) { _dirty = true; flags = _v; }
        public long timestamp() { return timestamp; }
        public void setTimestamp(long _v) { _dirty = true; timestamp = _v; }
        public List<File> files() { return files; }
        public void setFiles(List<File> _v) { _dirty = true; files = _v; }
        public FalloutDat _root() { return _root; }
        public void set_root(FalloutDat _v) { _dirty = true; _root = _v; }
        public FalloutDat _parent() { return _parent; }
        public void set_parent(FalloutDat _v) { _dirty = true; _parent = _v; }
    }
    public static class Pstr extends KaitaiStruct.ReadWrite {
        public static Pstr fromFile(String fileName) throws IOException {
            return new Pstr(new ByteBufferKaitaiStream(fileName));
        }
        public Pstr() {
            this(null, null, null);
        }

        public Pstr(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Pstr(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Pstr(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, FalloutDat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.size = this._io.readU1();
            this.str = new String(this._io.readBytes(size()), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.size);
            this._io.writeBytes((this.str).getBytes(Charset.forName("ASCII")));
        }

        public void _check() {
            if ((this.str).getBytes(Charset.forName("ASCII")).length != size())
                throw new ConsistencyError("str", size(), (this.str).getBytes(Charset.forName("ASCII")).length);
            _dirty = false;
        }
        private int size;
        private String str;
        private FalloutDat _root;
        private KaitaiStruct.ReadWrite _parent;
        public int size() { return size; }
        public void setSize(int _v) { _dirty = true; size = _v; }
        public String str() { return str; }
        public void setStr(String _v) { _dirty = true; str = _v; }
        public FalloutDat _root() { return _root; }
        public void set_root(FalloutDat _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    private long folderCount;
    private long unknown1;
    private long unknown2;
    private long timestamp;
    private List<Pstr> folderNames;
    private List<Folder> folders;
    private FalloutDat _root;
    private KaitaiStruct.ReadWrite _parent;
    public long folderCount() { return folderCount; }
    public void setFolderCount(long _v) { _dirty = true; folderCount = _v; }
    public long unknown1() { return unknown1; }
    public void setUnknown1(long _v) { _dirty = true; unknown1 = _v; }
    public long unknown2() { return unknown2; }
    public void setUnknown2(long _v) { _dirty = true; unknown2 = _v; }
    public long timestamp() { return timestamp; }
    public void setTimestamp(long _v) { _dirty = true; timestamp = _v; }
    public List<Pstr> folderNames() { return folderNames; }
    public void setFolderNames(List<Pstr> _v) { _dirty = true; folderNames = _v; }
    public List<Folder> folders() { return folders; }
    public void setFolders(List<Folder> _v) { _dirty = true; folders = _v; }
    public FalloutDat _root() { return _root; }
    public void set_root(FalloutDat _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

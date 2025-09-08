// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;

public class Fallout2Dat extends KaitaiStruct.ReadWrite {
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
    public Fallout2Dat() {
        this(null, null, null);
    }

    public Fallout2Dat(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Fallout2Dat(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Fallout2Dat(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Fallout2Dat _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        _dirty = false;
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

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteFooter = _enabledFooter;
        _shouldWriteIndex = _enabledIndex;
    }

    public void _check() {
        if (_enabledFooter) {
            if (!Objects.equals(this.footer._root(), _root()))
                throw new ConsistencyError("footer", _root(), this.footer._root());
            if (!Objects.equals(this.footer._parent(), this))
                throw new ConsistencyError("footer", this, this.footer._parent());
        }
        if (_enabledIndex) {
            if (!Objects.equals(this.index._root(), _root()))
                throw new ConsistencyError("index", _root(), this.index._root());
            if (!Objects.equals(this.index._parent(), this))
                throw new ConsistencyError("index", this, this.index._parent());
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

        public File(KaitaiStream _io, Fallout2Dat.Index _parent) {
            this(_io, _parent, null);
        }

        public File(KaitaiStream _io, Fallout2Dat.Index _parent, Fallout2Dat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.name = new Pstr(this._io, this, _root);
            this.name._read();
            this.flags = Fallout2Dat.Compression.byId(this._io.readU1());
            this.sizeUnpacked = this._io.readU4le();
            this.sizePacked = this._io.readU4le();
            this.offset = this._io.readU4le();
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteContentsRaw = _enabledContentsRaw;
            _shouldWriteContentsZlib = _enabledContentsZlib;
            this.name._write_Seq(this._io);
            this._io.writeU1(((Number) (this.flags.id())).intValue());
            this._io.writeU4le(this.sizeUnpacked);
            this._io.writeU4le(this.sizePacked);
            this._io.writeU4le(this.offset);
        }

        public void _check() {
            if (!Objects.equals(this.name._root(), _root()))
                throw new ConsistencyError("name", _root(), this.name._root());
            if (!Objects.equals(this.name._parent(), this))
                throw new ConsistencyError("name", this, this.name._parent());
            if (_enabledContentsRaw) {
                if (flags() == Fallout2Dat.Compression.NONE) {
                    if (this.contentsRaw.length != sizeUnpacked())
                        throw new ConsistencyError("contents_raw", sizeUnpacked(), this.contentsRaw.length);
                }
            }
            if (_enabledContentsZlib) {
                if (flags() == Fallout2Dat.Compression.ZLIB) {
                }
            }
            _dirty = false;
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
        public void _invalidateContents() { this.contents = null; }
        private byte[] contentsRaw;
        private boolean _shouldWriteContentsRaw = false;
        private boolean _enabledContentsRaw = true;
        public byte[] contentsRaw() {
            if (_shouldWriteContentsRaw)
                _writeContentsRaw();
            if (this.contentsRaw != null)
                return this.contentsRaw;
            if (!_enabledContentsRaw)
                return null;
            if (flags() == Fallout2Dat.Compression.NONE) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(offset());
                this.contentsRaw = io.readBytes(sizeUnpacked());
                io.seek(_pos);
            }
            return this.contentsRaw;
        }
        public void setContentsRaw(byte[] _v) { _dirty = true; contentsRaw = _v; }
        public void setContentsRaw_Enabled(boolean _v) { _dirty = true; _enabledContentsRaw = _v; }

        private void _writeContentsRaw() {
            _shouldWriteContentsRaw = false;
            if (flags() == Fallout2Dat.Compression.NONE) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(offset());
                io.writeBytes(this.contentsRaw);
                io.seek(_pos);
            }
        }
        private byte[] contentsZlib;
        private boolean _shouldWriteContentsZlib = false;
        private boolean _enabledContentsZlib = true;
        public byte[] contentsZlib() {
            if (_shouldWriteContentsZlib)
                _writeContentsZlib();
            if (this.contentsZlib != null)
                return this.contentsZlib;
            if (!_enabledContentsZlib)
                return null;
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
        public void setContentsZlib(byte[] _v) { _dirty = true; contentsZlib = _v; }
        public void setContentsZlib_Enabled(boolean _v) { _dirty = true; _enabledContentsZlib = _v; }

        private void _writeContentsZlib() {
            _shouldWriteContentsZlib = false;
            if (flags() == Fallout2Dat.Compression.ZLIB) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(offset());
                this._raw_contentsZlib = KaitaiStream.unprocessZlib(this.contentsZlib);
                if (this._raw_contentsZlib.length != sizePacked())
                    throw new ConsistencyError("contents_zlib", sizePacked(), this._raw_contentsZlib.length);
                io.writeBytes(this._raw_contentsZlib);
                io.seek(_pos);
            }
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
        public void setName(Pstr _v) { _dirty = true; name = _v; }
        public Compression flags() { return flags; }
        public void setFlags(Compression _v) { _dirty = true; flags = _v; }
        public long sizeUnpacked() { return sizeUnpacked; }
        public void setSizeUnpacked(long _v) { _dirty = true; sizeUnpacked = _v; }
        public long sizePacked() { return sizePacked; }
        public void setSizePacked(long _v) { _dirty = true; sizePacked = _v; }
        public long offset() { return offset; }
        public void setOffset(long _v) { _dirty = true; offset = _v; }
        public Fallout2Dat _root() { return _root; }
        public void set_root(Fallout2Dat _v) { _dirty = true; _root = _v; }
        public Fallout2Dat.Index _parent() { return _parent; }
        public void set_parent(Fallout2Dat.Index _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_contentsZlib() { return _raw_contentsZlib; }
        public void set_raw_ContentsZlib(byte[] _v) { _dirty = true; _raw_contentsZlib = _v; }
    }
    public static class Footer extends KaitaiStruct.ReadWrite {
        public static Footer fromFile(String fileName) throws IOException {
            return new Footer(new ByteBufferKaitaiStream(fileName));
        }
        public Footer() {
            this(null, null, null);
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
        }
        public void _read() {
            this.indexSize = this._io.readU4le();
            this.fileSize = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.indexSize);
            this._io.writeU4le(this.fileSize);
        }

        public void _check() {
            _dirty = false;
        }
        private long indexSize;
        private long fileSize;
        private Fallout2Dat _root;
        private Fallout2Dat _parent;
        public long indexSize() { return indexSize; }
        public void setIndexSize(long _v) { _dirty = true; indexSize = _v; }
        public long fileSize() { return fileSize; }
        public void setFileSize(long _v) { _dirty = true; fileSize = _v; }
        public Fallout2Dat _root() { return _root; }
        public void set_root(Fallout2Dat _v) { _dirty = true; _root = _v; }
        public Fallout2Dat _parent() { return _parent; }
        public void set_parent(Fallout2Dat _v) { _dirty = true; _parent = _v; }
    }
    public static class Index extends KaitaiStruct.ReadWrite {
        public static Index fromFile(String fileName) throws IOException {
            return new Index(new ByteBufferKaitaiStream(fileName));
        }
        public Index() {
            this(null, null, null);
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
        }
        public void _read() {
            this.fileCount = this._io.readU4le();
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
            this._io.writeU4le(this.fileCount);
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
        private List<File> files;
        private Fallout2Dat _root;
        private Fallout2Dat _parent;
        public long fileCount() { return fileCount; }
        public void setFileCount(long _v) { _dirty = true; fileCount = _v; }
        public List<File> files() { return files; }
        public void setFiles(List<File> _v) { _dirty = true; files = _v; }
        public Fallout2Dat _root() { return _root; }
        public void set_root(Fallout2Dat _v) { _dirty = true; _root = _v; }
        public Fallout2Dat _parent() { return _parent; }
        public void set_parent(Fallout2Dat _v) { _dirty = true; _parent = _v; }
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

        public Pstr(KaitaiStream _io, Fallout2Dat.File _parent) {
            this(_io, _parent, null);
        }

        public Pstr(KaitaiStream _io, Fallout2Dat.File _parent, Fallout2Dat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.size = this._io.readU4le();
            this.str = new String(this._io.readBytes(size()), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.size);
            this._io.writeBytes((this.str).getBytes(Charset.forName("ASCII")));
        }

        public void _check() {
            if ((this.str).getBytes(Charset.forName("ASCII")).length != size())
                throw new ConsistencyError("str", size(), (this.str).getBytes(Charset.forName("ASCII")).length);
            _dirty = false;
        }
        private long size;
        private String str;
        private Fallout2Dat _root;
        private Fallout2Dat.File _parent;
        public long size() { return size; }
        public void setSize(long _v) { _dirty = true; size = _v; }
        public String str() { return str; }
        public void setStr(String _v) { _dirty = true; str = _v; }
        public Fallout2Dat _root() { return _root; }
        public void set_root(Fallout2Dat _v) { _dirty = true; _root = _v; }
        public Fallout2Dat.File _parent() { return _parent; }
        public void set_parent(Fallout2Dat.File _v) { _dirty = true; _parent = _v; }
    }
    private Footer footer;
    private boolean _shouldWriteFooter = false;
    private boolean _enabledFooter = true;
    public Footer footer() {
        if (_shouldWriteFooter)
            _writeFooter();
        if (this.footer != null)
            return this.footer;
        if (!_enabledFooter)
            return null;
        long _pos = this._io.pos();
        this._io.seek(_io().size() - 8);
        this.footer = new Footer(this._io, this, _root);
        this.footer._read();
        this._io.seek(_pos);
        return this.footer;
    }
    public void setFooter(Footer _v) { _dirty = true; footer = _v; }
    public void setFooter_Enabled(boolean _v) { _dirty = true; _enabledFooter = _v; }

    private void _writeFooter() {
        _shouldWriteFooter = false;
        long _pos = this._io.pos();
        this._io.seek(_io().size() - 8);
        this.footer._write_Seq(this._io);
        this._io.seek(_pos);
    }
    private Index index;
    private boolean _shouldWriteIndex = false;
    private boolean _enabledIndex = true;
    public Index index() {
        if (_shouldWriteIndex)
            _writeIndex();
        if (this.index != null)
            return this.index;
        if (!_enabledIndex)
            return null;
        long _pos = this._io.pos();
        this._io.seek((_io().size() - 8) - footer().indexSize());
        this.index = new Index(this._io, this, _root);
        this.index._read();
        this._io.seek(_pos);
        return this.index;
    }
    public void setIndex(Index _v) { _dirty = true; index = _v; }
    public void setIndex_Enabled(boolean _v) { _dirty = true; _enabledIndex = _v; }

    private void _writeIndex() {
        _shouldWriteIndex = false;
        long _pos = this._io.pos();
        this._io.seek((_io().size() - 8) - footer().indexSize());
        this.index._write_Seq(this._io);
        this._io.seek(_pos);
    }
    private Fallout2Dat _root;
    private KaitaiStruct.ReadWrite _parent;
    public Fallout2Dat _root() { return _root; }
    public void set_root(Fallout2Dat _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

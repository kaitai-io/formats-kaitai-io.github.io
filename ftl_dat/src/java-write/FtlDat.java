// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.List;

public class FtlDat extends KaitaiStruct.ReadWrite {
    public static FtlDat fromFile(String fileName) throws IOException {
        return new FtlDat(new ByteBufferKaitaiStream(fileName));
    }
    public FtlDat() {
        this(null, null, null);
    }

    public FtlDat(KaitaiStream _io) {
        this(_io, null, null);
    }

    public FtlDat(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public FtlDat(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, FtlDat _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.numFiles = this._io.readU4le();
        this.files = new ArrayList<File>();
        for (int i = 0; i < numFiles(); i++) {
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
        this._io.writeU4le(this.numFiles);
        for (int i = 0; i < this.files.size(); i++) {
            this.files.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (this.files.size() != numFiles())
            throw new ConsistencyError("files", numFiles(), this.files.size());
        for (int i = 0; i < this.files.size(); i++) {
            if (!Objects.equals(this.files.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("files", _root(), this.files.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.files.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("files", this, this.files.get(((Number) (i)).intValue())._parent());
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

        public File(KaitaiStream _io, FtlDat _parent) {
            this(_io, _parent, null);
        }

        public File(KaitaiStream _io, FtlDat _parent, FtlDat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.ofsMeta = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            meta();
            if (this.meta != null) {
                this.meta._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteMeta = _enabledMeta;
            this._io.writeU4le(this.ofsMeta);
        }

        public void _check() {
            if (_enabledMeta) {
                if (ofsMeta() != 0) {
                    if (!Objects.equals(this.meta._root(), _root()))
                        throw new ConsistencyError("meta", _root(), this.meta._root());
                    if (!Objects.equals(this.meta._parent(), this))
                        throw new ConsistencyError("meta", this, this.meta._parent());
                }
            }
            _dirty = false;
        }
        private Meta meta;
        private boolean _shouldWriteMeta = false;
        private boolean _enabledMeta = true;
        public Meta meta() {
            if (_shouldWriteMeta)
                _writeMeta();
            if (this.meta != null)
                return this.meta;
            if (!_enabledMeta)
                return null;
            if (ofsMeta() != 0) {
                long _pos = this._io.pos();
                this._io.seek(ofsMeta());
                this.meta = new Meta(this._io, this, _root);
                this.meta._read();
                this._io.seek(_pos);
            }
            return this.meta;
        }
        public void setMeta(Meta _v) { _dirty = true; meta = _v; }
        public void setMeta_Enabled(boolean _v) { _dirty = true; _enabledMeta = _v; }

        private void _writeMeta() {
            _shouldWriteMeta = false;
            if (ofsMeta() != 0) {
                long _pos = this._io.pos();
                this._io.seek(ofsMeta());
                this.meta._write_Seq(this._io);
                this._io.seek(_pos);
            }
        }
        private long ofsMeta;
        private FtlDat _root;
        private FtlDat _parent;
        public long ofsMeta() { return ofsMeta; }
        public void setOfsMeta(long _v) { _dirty = true; ofsMeta = _v; }
        public FtlDat _root() { return _root; }
        public void set_root(FtlDat _v) { _dirty = true; _root = _v; }
        public FtlDat _parent() { return _parent; }
        public void set_parent(FtlDat _v) { _dirty = true; _parent = _v; }
    }
    public static class Meta extends KaitaiStruct.ReadWrite {
        public static Meta fromFile(String fileName) throws IOException {
            return new Meta(new ByteBufferKaitaiStream(fileName));
        }
        public Meta() {
            this(null, null, null);
        }

        public Meta(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Meta(KaitaiStream _io, FtlDat.File _parent) {
            this(_io, _parent, null);
        }

        public Meta(KaitaiStream _io, FtlDat.File _parent, FtlDat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lenFile = this._io.readU4le();
            this.lenFilename = this._io.readU4le();
            this.filename = new String(this._io.readBytes(lenFilename()), StandardCharsets.UTF_8);
            this.body = this._io.readBytes(lenFile());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.lenFile);
            this._io.writeU4le(this.lenFilename);
            this._io.writeBytes((this.filename).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes(this.body);
        }

        public void _check() {
            if ((this.filename).getBytes(Charset.forName("UTF-8")).length != lenFilename())
                throw new ConsistencyError("filename", lenFilename(), (this.filename).getBytes(Charset.forName("UTF-8")).length);
            if (this.body.length != lenFile())
                throw new ConsistencyError("body", lenFile(), this.body.length);
            _dirty = false;
        }
        private long lenFile;
        private long lenFilename;
        private String filename;
        private byte[] body;
        private FtlDat _root;
        private FtlDat.File _parent;
        public long lenFile() { return lenFile; }
        public void setLenFile(long _v) { _dirty = true; lenFile = _v; }
        public long lenFilename() { return lenFilename; }
        public void setLenFilename(long _v) { _dirty = true; lenFilename = _v; }
        public String filename() { return filename; }
        public void setFilename(String _v) { _dirty = true; filename = _v; }
        public byte[] body() { return body; }
        public void setBody(byte[] _v) { _dirty = true; body = _v; }
        public FtlDat _root() { return _root; }
        public void set_root(FtlDat _v) { _dirty = true; _root = _v; }
        public FtlDat.File _parent() { return _parent; }
        public void set_parent(FtlDat.File _v) { _dirty = true; _parent = _v; }
    }
    private long numFiles;
    private List<File> files;
    private FtlDat _root;
    private KaitaiStruct.ReadWrite _parent;

    /**
     * Number of files in the archive
     */
    public long numFiles() { return numFiles; }
    public void setNumFiles(long _v) { _dirty = true; numFiles = _v; }
    public List<File> files() { return files; }
    public void setFiles(List<File> _v) { _dirty = true; files = _v; }
    public FtlDat _root() { return _root; }
    public void set_root(FtlDat _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;


/**
 * @see <a href="https://moddingwiki.shikadi.net/wiki/PAK_Format_(Westwood)">Source</a>
 */
public class Dune2Pak extends KaitaiStruct.ReadWrite {
    public static Dune2Pak fromFile(String fileName) throws IOException {
        return new Dune2Pak(new ByteBufferKaitaiStream(fileName));
    }
    public Dune2Pak() {
        this(null, null, null);
    }

    public Dune2Pak(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Dune2Pak(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Dune2Pak(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Dune2Pak _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this._raw_dir = this._io.readBytes(dirSize());
        KaitaiStream _io__raw_dir = new ByteBufferKaitaiStream(this._raw_dir);
        this.dir = new Files(_io__raw_dir, this, _root);
        this.dir._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.dir._fetchInstances();
        dirSize();
        if (this.dirSize != null) {
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteDirSize = _enabledDirSize;
        final KaitaiStream _io__raw_dir = new ByteBufferKaitaiStream(dirSize());
        this._io.addChildStream(_io__raw_dir);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (dirSize()));
            final Dune2Pak _this = this;
            _io__raw_dir.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_dir = _io__raw_dir.toByteArray();
                    if (_this._raw_dir.length != dirSize())
                        throw new ConsistencyError("raw(dir)", dirSize(), _this._raw_dir.length);
                    parent.writeBytes(_this._raw_dir);
                }
            });
        }
        this.dir._write_Seq(_io__raw_dir);
    }

    public void _check() {
        if (!Objects.equals(this.dir._root(), _root()))
            throw new ConsistencyError("dir", _root(), this.dir._root());
        if (!Objects.equals(this.dir._parent(), this))
            throw new ConsistencyError("dir", this, this.dir._parent());
        if (_enabledDirSize) {
        }
        _dirty = false;
    }
    public static class File extends KaitaiStruct.ReadWrite {
        public File(long idx) {
            this(null, null, null, idx);
        }

        public File(KaitaiStream _io, long idx) {
            this(_io, null, null, idx);
        }

        public File(KaitaiStream _io, Dune2Pak.Files _parent, long idx) {
            this(_io, _parent, null, idx);
        }

        public File(KaitaiStream _io, Dune2Pak.Files _parent, Dune2Pak _root, long idx) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.idx = idx;
        }
        public void _read() {
            this.ofs = this._io.readU4le();
            if (ofs() != 0) {
                this.fileName = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (ofs() != 0) {
            }
            body();
            if (this.body != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteBody = _enabledBody;
            this._io.writeU4le(this.ofs);
            if (ofs() != 0) {
                this._io.writeBytes((this.fileName).getBytes(Charset.forName("ASCII")));
                this._io.writeU1(0);
            }
        }

        public void _check() {
            if (ofs() != 0) {
                if (KaitaiStream.byteArrayIndexOf((this.fileName).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                    throw new ConsistencyError("file_name", -1, KaitaiStream.byteArrayIndexOf((this.fileName).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            }
            if (_enabledBody) {
                if (ofs() != 0) {
                }
            }
            _dirty = false;
        }
        private byte[] body;
        private boolean _shouldWriteBody = false;
        private boolean _enabledBody = true;
        public byte[] body() {
            if (_shouldWriteBody)
                _writeBody();
            if (this.body != null)
                return this.body;
            if (!_enabledBody)
                return null;
            if (ofs() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofs());
                this.body = io.readBytes(nextOfs() - ofs());
                io.seek(_pos);
            }
            return this.body;
        }
        public void setBody(byte[] _v) { _dirty = true; body = _v; }
        public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

        private void _writeBody() {
            _shouldWriteBody = false;
            if (ofs() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofs());
                if (this.body.length != nextOfs() - ofs())
                    throw new ConsistencyError("body", nextOfs() - ofs(), this.body.length);
                io.writeBytes(this.body);
                io.seek(_pos);
            }
        }
        private Integer nextOfs;
        public Integer nextOfs() {
            if (this.nextOfs != null)
                return this.nextOfs;
            if (ofs() != 0) {
                this.nextOfs = ((Number) ((nextOfs0() == 0 ? _root()._io().size() : nextOfs0()))).intValue();
            }
            return this.nextOfs;
        }
        public void _invalidateNextOfs() { this.nextOfs = null; }
        private Long nextOfs0;
        public Long nextOfs0() {
            if (this.nextOfs0 != null)
                return this.nextOfs0;
            if (ofs() != 0) {
                this.nextOfs0 = ((Number) (_root().dir().files().get(((Number) (idx() + 1)).intValue()).ofs())).longValue();
            }
            return this.nextOfs0;
        }
        public void _invalidateNextOfs0() { this.nextOfs0 = null; }
        private long ofs;
        private String fileName;
        private long idx;
        private Dune2Pak _root;
        private Dune2Pak.Files _parent;
        public long ofs() { return ofs; }
        public void setOfs(long _v) { _dirty = true; ofs = _v; }
        public String fileName() { return fileName; }
        public void setFileName(String _v) { _dirty = true; fileName = _v; }
        public long idx() { return idx; }
        public void setIdx(long _v) { _dirty = true; idx = _v; }
        public Dune2Pak _root() { return _root; }
        public void set_root(Dune2Pak _v) { _dirty = true; _root = _v; }
        public Dune2Pak.Files _parent() { return _parent; }
        public void set_parent(Dune2Pak.Files _v) { _dirty = true; _parent = _v; }
    }
    public static class Files extends KaitaiStruct.ReadWrite {
        public static Files fromFile(String fileName) throws IOException {
            return new Files(new ByteBufferKaitaiStream(fileName));
        }
        public Files() {
            this(null, null, null);
        }

        public Files(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Files(KaitaiStream _io, Dune2Pak _parent) {
            this(_io, _parent, null);
        }

        public Files(KaitaiStream _io, Dune2Pak _parent, Dune2Pak _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.files = new ArrayList<File>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    File _t_files = new File(this._io, this, _root, i);
                    try {
                        _t_files._read();
                    } finally {
                        this.files.add(_t_files);
                    }
                    i++;
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
            for (int i = 0; i < this.files.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("files", 0, this._io.size() - this._io.pos());
                this.files.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("files", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.files.size(); i++) {
                if (!Objects.equals(this.files.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("files", _root(), this.files.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.files.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("files", this, this.files.get(((Number) (i)).intValue())._parent());
                if (this.files.get(((Number) (i)).intValue()).idx() != i)
                    throw new ConsistencyError("files", i, this.files.get(((Number) (i)).intValue()).idx());
            }
            _dirty = false;
        }
        private List<File> files;
        private Dune2Pak _root;
        private Dune2Pak _parent;
        public List<File> files() { return files; }
        public void setFiles(List<File> _v) { _dirty = true; files = _v; }
        public Dune2Pak _root() { return _root; }
        public void set_root(Dune2Pak _v) { _dirty = true; _root = _v; }
        public Dune2Pak _parent() { return _parent; }
        public void set_parent(Dune2Pak _v) { _dirty = true; _parent = _v; }
    }
    private Long dirSize;
    private boolean _shouldWriteDirSize = false;
    private boolean _enabledDirSize = true;
    public Long dirSize() {
        if (_shouldWriteDirSize)
            _writeDirSize();
        if (this.dirSize != null)
            return this.dirSize;
        if (!_enabledDirSize)
            return null;
        long _pos = this._io.pos();
        this._io.seek(0);
        this.dirSize = this._io.readU4le();
        this._io.seek(_pos);
        return this.dirSize;
    }
    public void setDirSize(long _v) { _dirty = true; dirSize = _v; }
    public void setDirSize_Enabled(boolean _v) { _dirty = true; _enabledDirSize = _v; }

    private void _writeDirSize() {
        _shouldWriteDirSize = false;
        long _pos = this._io.pos();
        this._io.seek(0);
        this._io.writeU4le(this.dirSize);
        this._io.seek(_pos);
    }
    private Files dir;
    private Dune2Pak _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_dir;
    public Files dir() { return dir; }
    public void setDir(Files _v) { _dirty = true; dir = _v; }
    public Dune2Pak _root() { return _root; }
    public void set_root(Dune2Pak _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_dir() { return _raw_dir; }
    public void set_raw_Dir(byte[] _v) { _dirty = true; _raw_dir = _v; }
}

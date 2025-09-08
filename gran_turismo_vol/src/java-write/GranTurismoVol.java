// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.List;

public class GranTurismoVol extends KaitaiStruct.ReadWrite {
    public static GranTurismoVol fromFile(String fileName) throws IOException {
        return new GranTurismoVol(new ByteBufferKaitaiStream(fileName));
    }
    public GranTurismoVol() {
        this(null, null, null);
    }

    public GranTurismoVol(KaitaiStream _io) {
        this(_io, null, null);
    }

    public GranTurismoVol(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public GranTurismoVol(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, GranTurismoVol _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(8);
        if (!(Arrays.equals(this.magic, new byte[] { 71, 84, 70, 83, 0, 0, 0, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 71, 84, 70, 83, 0, 0, 0, 0 }, this.magic, this._io, "/seq/0");
        }
        this.numFiles = this._io.readU2le();
        this.numEntries = this._io.readU2le();
        this.reserved = this._io.readBytes(4);
        if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/seq/3");
        }
        this.offsets = new ArrayList<Long>();
        for (int i = 0; i < numFiles(); i++) {
            this.offsets.add(this._io.readU4le());
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.offsets.size(); i++) {
        }
        files();
        if (this.files != null) {
            for (int i = 0; i < this.files.size(); i++) {
                this.files.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteFiles = _enabledFiles;
        this._io.writeBytes(this.magic);
        this._io.writeU2le(this.numFiles);
        this._io.writeU2le(this.numEntries);
        this._io.writeBytes(this.reserved);
        for (int i = 0; i < this.offsets.size(); i++) {
            this._io.writeU4le(this.offsets.get(((Number) (i)).intValue()));
        }
    }

    public void _check() {
        if (this.magic.length != 8)
            throw new ConsistencyError("magic", 8, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 71, 84, 70, 83, 0, 0, 0, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 71, 84, 70, 83, 0, 0, 0, 0 }, this.magic, null, "/seq/0");
        }
        if (this.reserved.length != 4)
            throw new ConsistencyError("reserved", 4, this.reserved.length);
        if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/seq/3");
        }
        if (this.offsets.size() != numFiles())
            throw new ConsistencyError("offsets", numFiles(), this.offsets.size());
        for (int i = 0; i < this.offsets.size(); i++) {
        }
        if (_enabledFiles) {
            if (this.files.size() != _root().numEntries())
                throw new ConsistencyError("files", _root().numEntries(), this.files.size());
            for (int i = 0; i < this.files.size(); i++) {
                if (!Objects.equals(this.files.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("files", _root(), this.files.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.files.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("files", this, this.files.get(((Number) (i)).intValue())._parent());
            }
        }
        _dirty = false;
    }
    public static class FileInfo extends KaitaiStruct.ReadWrite {
        public static FileInfo fromFile(String fileName) throws IOException {
            return new FileInfo(new ByteBufferKaitaiStream(fileName));
        }
        public FileInfo() {
            this(null, null, null);
        }

        public FileInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FileInfo(KaitaiStream _io, GranTurismoVol _parent) {
            this(_io, _parent, null);
        }

        public FileInfo(KaitaiStream _io, GranTurismoVol _parent, GranTurismoVol _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.timestamp = this._io.readU4le();
            this.offsetIdx = this._io.readU2le();
            this.flags = this._io.readU1();
            this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(25), (byte) 0, false), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
            body();
            if (this.body != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteBody = _enabledBody;
            this._io.writeU4le(this.timestamp);
            this._io.writeU2le(this.offsetIdx);
            this._io.writeU1(this.flags);
            this._io.writeBytesLimit((this.name).getBytes(Charset.forName("ASCII")), 25, (byte) 0, (byte) 0);
        }

        public void _check() {
            if ((this.name).getBytes(Charset.forName("ASCII")).length > 25)
                throw new ConsistencyError("name", 25, (this.name).getBytes(Charset.forName("ASCII")).length);
            if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            if (_enabledBody) {
                if (!(isDir())) {
                    if (this.body.length != size())
                        throw new ConsistencyError("body", size(), this.body.length);
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
            if (!(isDir())) {
                long _pos = this._io.pos();
                this._io.seek(_root().offsets().get(((Number) (offsetIdx())).intValue()) & 4294965248L);
                this.body = this._io.readBytes(size());
                this._io.seek(_pos);
            }
            return this.body;
        }
        public void setBody(byte[] _v) { _dirty = true; body = _v; }
        public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

        private void _writeBody() {
            _shouldWriteBody = false;
            if (!(isDir())) {
                long _pos = this._io.pos();
                this._io.seek(_root().offsets().get(((Number) (offsetIdx())).intValue()) & 4294965248L);
                this._io.writeBytes(this.body);
                this._io.seek(_pos);
            }
        }
        private Boolean isDir;
        public Boolean isDir() {
            if (this.isDir != null)
                return this.isDir;
            this.isDir = (flags() & 1) != 0;
            return this.isDir;
        }
        public void _invalidateIsDir() { this.isDir = null; }
        private Boolean isLastEntry;
        public Boolean isLastEntry() {
            if (this.isLastEntry != null)
                return this.isLastEntry;
            this.isLastEntry = (flags() & 128) != 0;
            return this.isLastEntry;
        }
        public void _invalidateIsLastEntry() { this.isLastEntry = null; }
        private Integer size;
        public Integer size() {
            if (this.size != null)
                return this.size;
            this.size = ((Number) ((_root().offsets().get(((Number) (offsetIdx() + 1)).intValue()) & 4294965248L) - _root().offsets().get(((Number) (offsetIdx())).intValue()))).intValue();
            return this.size;
        }
        public void _invalidateSize() { this.size = null; }
        private long timestamp;
        private int offsetIdx;
        private int flags;
        private String name;
        private GranTurismoVol _root;
        private GranTurismoVol _parent;
        public long timestamp() { return timestamp; }
        public void setTimestamp(long _v) { _dirty = true; timestamp = _v; }
        public int offsetIdx() { return offsetIdx; }
        public void setOffsetIdx(int _v) { _dirty = true; offsetIdx = _v; }
        public int flags() { return flags; }
        public void setFlags(int _v) { _dirty = true; flags = _v; }
        public String name() { return name; }
        public void setName(String _v) { _dirty = true; name = _v; }
        public GranTurismoVol _root() { return _root; }
        public void set_root(GranTurismoVol _v) { _dirty = true; _root = _v; }
        public GranTurismoVol _parent() { return _parent; }
        public void set_parent(GranTurismoVol _v) { _dirty = true; _parent = _v; }
    }
    private List<FileInfo> files;
    private boolean _shouldWriteFiles = false;
    private boolean _enabledFiles = true;
    public List<FileInfo> files() {
        if (_shouldWriteFiles)
            _writeFiles();
        if (this.files != null)
            return this.files;
        if (!_enabledFiles)
            return null;
        long _pos = this._io.pos();
        this._io.seek(ofsDir() & 4294965248L);
        this.files = new ArrayList<FileInfo>();
        for (int i = 0; i < _root().numEntries(); i++) {
            FileInfo _t_files = new FileInfo(this._io, this, _root);
            try {
                _t_files._read();
            } finally {
                this.files.add(_t_files);
            }
        }
        this._io.seek(_pos);
        return this.files;
    }
    public void setFiles(List<FileInfo> _v) { _dirty = true; files = _v; }
    public void setFiles_Enabled(boolean _v) { _dirty = true; _enabledFiles = _v; }

    private void _writeFiles() {
        _shouldWriteFiles = false;
        long _pos = this._io.pos();
        this._io.seek(ofsDir() & 4294965248L);
        for (int i = 0; i < this.files.size(); i++) {
            this.files.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        this._io.seek(_pos);
    }
    private Long ofsDir;
    public Long ofsDir() {
        if (this.ofsDir != null)
            return this.ofsDir;
        this.ofsDir = ((Number) (offsets().get(((int) 1)))).longValue();
        return this.ofsDir;
    }
    public void _invalidateOfsDir() { this.ofsDir = null; }
    private byte[] magic;
    private int numFiles;
    private int numEntries;
    private byte[] reserved;
    private List<Long> offsets;
    private GranTurismoVol _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
    public int numFiles() { return numFiles; }
    public void setNumFiles(int _v) { _dirty = true; numFiles = _v; }
    public int numEntries() { return numEntries; }
    public void setNumEntries(int _v) { _dirty = true; numEntries = _v; }
    public byte[] reserved() { return reserved; }
    public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
    public List<Long> offsets() { return offsets; }
    public void setOffsets(List<Long> _v) { _dirty = true; offsets = _v; }
    public GranTurismoVol _root() { return _root; }
    public void set_root(GranTurismoVol _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

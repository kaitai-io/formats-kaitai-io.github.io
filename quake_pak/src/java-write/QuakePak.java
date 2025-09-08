// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;


/**
 * @see <a href="https://quakewiki.org/wiki/.pak#Format_specification">Source</a>
 */
public class QuakePak extends KaitaiStruct.ReadWrite {
    public static QuakePak fromFile(String fileName) throws IOException {
        return new QuakePak(new ByteBufferKaitaiStream(fileName));
    }
    public QuakePak() {
        this(null, null, null);
    }

    public QuakePak(KaitaiStream _io) {
        this(_io, null, null);
    }

    public QuakePak(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public QuakePak(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, QuakePak _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { 80, 65, 67, 75 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 80, 65, 67, 75 }, this.magic, this._io, "/seq/0");
        }
        this.ofsIndex = this._io.readU4le();
        this.lenIndex = this._io.readU4le();
        _dirty = false;
    }

    public void _fetchInstances() {
        index();
        if (this.index != null) {
            this.index._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteIndex = _enabledIndex;
        this._io.writeBytes(this.magic);
        this._io.writeU4le(this.ofsIndex);
        this._io.writeU4le(this.lenIndex);
    }

    public void _check() {
        if (this.magic.length != 4)
            throw new ConsistencyError("magic", 4, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 80, 65, 67, 75 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 80, 65, 67, 75 }, this.magic, null, "/seq/0");
        }
        if (_enabledIndex) {
            if (!Objects.equals(this.index._root(), _root()))
                throw new ConsistencyError("index", _root(), this.index._root());
            if (!Objects.equals(this.index._parent(), this))
                throw new ConsistencyError("index", this, this.index._parent());
        }
        _dirty = false;
    }
    public static class IndexEntry extends KaitaiStruct.ReadWrite {
        public static IndexEntry fromFile(String fileName) throws IOException {
            return new IndexEntry(new ByteBufferKaitaiStream(fileName));
        }
        public IndexEntry() {
            this(null, null, null);
        }

        public IndexEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public IndexEntry(KaitaiStream _io, QuakePak.IndexStruct _parent) {
            this(_io, _parent, null);
        }

        public IndexEntry(KaitaiStream _io, QuakePak.IndexStruct _parent, QuakePak _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(56), (byte) 0, false), StandardCharsets.UTF_8);
            this.ofs = this._io.readU4le();
            this.size = this._io.readU4le();
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
            this._io.writeBytesLimit((this.name).getBytes(Charset.forName("UTF-8")), 56, (byte) 0, (byte) 0);
            this._io.writeU4le(this.ofs);
            this._io.writeU4le(this.size);
        }

        public void _check() {
            if ((this.name).getBytes(Charset.forName("UTF-8")).length > 56)
                throw new ConsistencyError("name", 56, (this.name).getBytes(Charset.forName("UTF-8")).length);
            if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
            if (_enabledBody) {
                if (this.body.length != size())
                    throw new ConsistencyError("body", size(), this.body.length);
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
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofs());
            this.body = io.readBytes(size());
            io.seek(_pos);
            return this.body;
        }
        public void setBody(byte[] _v) { _dirty = true; body = _v; }
        public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

        private void _writeBody() {
            _shouldWriteBody = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofs());
            io.writeBytes(this.body);
            io.seek(_pos);
        }
        private String name;
        private long ofs;
        private long size;
        private QuakePak _root;
        private QuakePak.IndexStruct _parent;
        public String name() { return name; }
        public void setName(String _v) { _dirty = true; name = _v; }
        public long ofs() { return ofs; }
        public void setOfs(long _v) { _dirty = true; ofs = _v; }
        public long size() { return size; }
        public void setSize(long _v) { _dirty = true; size = _v; }
        public QuakePak _root() { return _root; }
        public void set_root(QuakePak _v) { _dirty = true; _root = _v; }
        public QuakePak.IndexStruct _parent() { return _parent; }
        public void set_parent(QuakePak.IndexStruct _v) { _dirty = true; _parent = _v; }
    }
    public static class IndexStruct extends KaitaiStruct.ReadWrite {
        public static IndexStruct fromFile(String fileName) throws IOException {
            return new IndexStruct(new ByteBufferKaitaiStream(fileName));
        }
        public IndexStruct() {
            this(null, null, null);
        }

        public IndexStruct(KaitaiStream _io) {
            this(_io, null, null);
        }

        public IndexStruct(KaitaiStream _io, QuakePak _parent) {
            this(_io, _parent, null);
        }

        public IndexStruct(KaitaiStream _io, QuakePak _parent, QuakePak _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.entries = new ArrayList<IndexEntry>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    IndexEntry _t_entries = new IndexEntry(this._io, this, _root);
                    try {
                        _t_entries._read();
                    } finally {
                        this.entries.add(_t_entries);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.entries.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.entries.size(); i++) {
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<IndexEntry> entries;
        private QuakePak _root;
        private QuakePak _parent;
        public List<IndexEntry> entries() { return entries; }
        public void setEntries(List<IndexEntry> _v) { _dirty = true; entries = _v; }
        public QuakePak _root() { return _root; }
        public void set_root(QuakePak _v) { _dirty = true; _root = _v; }
        public QuakePak _parent() { return _parent; }
        public void set_parent(QuakePak _v) { _dirty = true; _parent = _v; }
    }
    private IndexStruct index;
    private boolean _shouldWriteIndex = false;
    private boolean _enabledIndex = true;
    public IndexStruct index() {
        if (_shouldWriteIndex)
            _writeIndex();
        if (this.index != null)
            return this.index;
        if (!_enabledIndex)
            return null;
        long _pos = this._io.pos();
        this._io.seek(ofsIndex());
        this._raw_index = this._io.readBytes(lenIndex());
        KaitaiStream _io__raw_index = new ByteBufferKaitaiStream(this._raw_index);
        this.index = new IndexStruct(_io__raw_index, this, _root);
        this.index._read();
        this._io.seek(_pos);
        return this.index;
    }
    public void setIndex(IndexStruct _v) { _dirty = true; index = _v; }
    public void setIndex_Enabled(boolean _v) { _dirty = true; _enabledIndex = _v; }

    private void _writeIndex() {
        _shouldWriteIndex = false;
        long _pos = this._io.pos();
        this._io.seek(ofsIndex());
        final KaitaiStream _io__raw_index = new ByteBufferKaitaiStream(lenIndex());
        this._io.addChildStream(_io__raw_index);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (lenIndex()));
            final QuakePak _this = this;
            _io__raw_index.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_index = _io__raw_index.toByteArray();
                    if (_this._raw_index.length != lenIndex())
                        throw new ConsistencyError("raw(index)", lenIndex(), _this._raw_index.length);
                    parent.writeBytes(_this._raw_index);
                }
            });
        }
        this.index._write_Seq(_io__raw_index);
        this._io.seek(_pos);
    }
    private byte[] magic;
    private long ofsIndex;
    private long lenIndex;
    private QuakePak _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_index;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
    public long ofsIndex() { return ofsIndex; }
    public void setOfsIndex(long _v) { _dirty = true; ofsIndex = _v; }
    public long lenIndex() { return lenIndex; }
    public void setLenIndex(long _v) { _dirty = true; lenIndex = _v; }
    public QuakePak _root() { return _root; }
    public void set_root(QuakePak _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_index() { return _raw_index; }
    public void set_raw_Index(byte[] _v) { _dirty = true; _raw_index = _v; }
}

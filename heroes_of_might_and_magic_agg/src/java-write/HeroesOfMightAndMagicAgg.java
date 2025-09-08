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


/**
 * @see <a href="https://web.archive.org/web/20170215190034/http://rewiki.regengedanken.de/wiki/.AGG_(Heroes_of_Might_and_Magic)">Source</a>
 */
public class HeroesOfMightAndMagicAgg extends KaitaiStruct.ReadWrite {
    public static HeroesOfMightAndMagicAgg fromFile(String fileName) throws IOException {
        return new HeroesOfMightAndMagicAgg(new ByteBufferKaitaiStream(fileName));
    }
    public HeroesOfMightAndMagicAgg() {
        this(null, null, null);
    }

    public HeroesOfMightAndMagicAgg(KaitaiStream _io) {
        this(_io, null, null);
    }

    public HeroesOfMightAndMagicAgg(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public HeroesOfMightAndMagicAgg(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, HeroesOfMightAndMagicAgg _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.numFiles = this._io.readU2le();
        this.entries = new ArrayList<Entry>();
        for (int i = 0; i < numFiles(); i++) {
            Entry _t_entries = new Entry(this._io, this, _root);
            try {
                _t_entries._read();
            } finally {
                this.entries.add(_t_entries);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.entries.size(); i++) {
            this.entries.get(((Number) (i)).intValue())._fetchInstances();
        }
        filenames();
        if (this.filenames != null) {
            for (int i = 0; i < this.filenames.size(); i++) {
                this.filenames.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteFilenames = _enabledFilenames;
        this._io.writeU2le(this.numFiles);
        for (int i = 0; i < this.entries.size(); i++) {
            this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (this.entries.size() != numFiles())
            throw new ConsistencyError("entries", numFiles(), this.entries.size());
        for (int i = 0; i < this.entries.size(); i++) {
            if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
        }
        if (_enabledFilenames) {
            if (this.filenames.size() != numFiles())
                throw new ConsistencyError("filenames", numFiles(), this.filenames.size());
            for (int i = 0; i < this.filenames.size(); i++) {
                if (!Objects.equals(this.filenames.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("filenames", _root(), this.filenames.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.filenames.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("filenames", this, this.filenames.get(((Number) (i)).intValue())._parent());
            }
        }
        _dirty = false;
    }
    public static class Entry extends KaitaiStruct.ReadWrite {
        public static Entry fromFile(String fileName) throws IOException {
            return new Entry(new ByteBufferKaitaiStream(fileName));
        }
        public Entry() {
            this(null, null, null);
        }

        public Entry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Entry(KaitaiStream _io, HeroesOfMightAndMagicAgg _parent) {
            this(_io, _parent, null);
        }

        public Entry(KaitaiStream _io, HeroesOfMightAndMagicAgg _parent, HeroesOfMightAndMagicAgg _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.hash = this._io.readU2le();
            this.offset = this._io.readU4le();
            this.size = this._io.readU4le();
            this.size2 = this._io.readU4le();
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
            this._io.writeU2le(this.hash);
            this._io.writeU4le(this.offset);
            this._io.writeU4le(this.size);
            this._io.writeU4le(this.size2);
        }

        public void _check() {
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
            long _pos = this._io.pos();
            this._io.seek(offset());
            this.body = this._io.readBytes(size());
            this._io.seek(_pos);
            return this.body;
        }
        public void setBody(byte[] _v) { _dirty = true; body = _v; }
        public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

        private void _writeBody() {
            _shouldWriteBody = false;
            long _pos = this._io.pos();
            this._io.seek(offset());
            this._io.writeBytes(this.body);
            this._io.seek(_pos);
        }
        private int hash;
        private long offset;
        private long size;
        private long size2;
        private HeroesOfMightAndMagicAgg _root;
        private HeroesOfMightAndMagicAgg _parent;
        public int hash() { return hash; }
        public void setHash(int _v) { _dirty = true; hash = _v; }
        public long offset() { return offset; }
        public void setOffset(long _v) { _dirty = true; offset = _v; }
        public long size() { return size; }
        public void setSize(long _v) { _dirty = true; size = _v; }
        public long size2() { return size2; }
        public void setSize2(long _v) { _dirty = true; size2 = _v; }
        public HeroesOfMightAndMagicAgg _root() { return _root; }
        public void set_root(HeroesOfMightAndMagicAgg _v) { _dirty = true; _root = _v; }
        public HeroesOfMightAndMagicAgg _parent() { return _parent; }
        public void set_parent(HeroesOfMightAndMagicAgg _v) { _dirty = true; _parent = _v; }
    }
    public static class Filename extends KaitaiStruct.ReadWrite {
        public static Filename fromFile(String fileName) throws IOException {
            return new Filename(new ByteBufferKaitaiStream(fileName));
        }
        public Filename() {
            this(null, null, null);
        }

        public Filename(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Filename(KaitaiStream _io, HeroesOfMightAndMagicAgg _parent) {
            this(_io, _parent, null);
        }

        public Filename(KaitaiStream _io, HeroesOfMightAndMagicAgg _parent, HeroesOfMightAndMagicAgg _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.str = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.str).getBytes(Charset.forName("ASCII")));
            this._io.writeU1(0);
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.str).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("str", -1, KaitaiStream.byteArrayIndexOf((this.str).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            _dirty = false;
        }
        private String str;
        private HeroesOfMightAndMagicAgg _root;
        private HeroesOfMightAndMagicAgg _parent;
        public String str() { return str; }
        public void setStr(String _v) { _dirty = true; str = _v; }
        public HeroesOfMightAndMagicAgg _root() { return _root; }
        public void set_root(HeroesOfMightAndMagicAgg _v) { _dirty = true; _root = _v; }
        public HeroesOfMightAndMagicAgg _parent() { return _parent; }
        public void set_parent(HeroesOfMightAndMagicAgg _v) { _dirty = true; _parent = _v; }
    }
    private List<Filename> filenames;
    private boolean _shouldWriteFilenames = false;
    private boolean _enabledFilenames = true;
    public List<Filename> filenames() {
        if (_shouldWriteFilenames)
            _writeFilenames();
        if (this.filenames != null)
            return this.filenames;
        if (!_enabledFilenames)
            return null;
        long _pos = this._io.pos();
        this._io.seek(entries().get(entries().size() - 1).offset() + entries().get(entries().size() - 1).size());
        this._raw_filenames = new ArrayList<byte[]>();
        this.filenames = new ArrayList<Filename>();
        for (int i = 0; i < numFiles(); i++) {
            this._raw_filenames.add(this._io.readBytes(15));
            KaitaiStream _io__raw_filenames = new ByteBufferKaitaiStream(this._raw_filenames.get(i));
            Filename _t_filenames = new Filename(_io__raw_filenames, this, _root);
            try {
                _t_filenames._read();
            } finally {
                this.filenames.add(_t_filenames);
            }
        }
        this._io.seek(_pos);
        return this.filenames;
    }
    public void setFilenames(List<Filename> _v) { _dirty = true; filenames = _v; }
    public void setFilenames_Enabled(boolean _v) { _dirty = true; _enabledFilenames = _v; }

    private void _writeFilenames() {
        _shouldWriteFilenames = false;
        long _pos = this._io.pos();
        this._io.seek(entries().get(entries().size() - 1).offset() + entries().get(entries().size() - 1).size());
        this._raw_filenames = new ArrayList<byte[]>();
        for (int i = 0; i < this.filenames.size(); i++) {
            final KaitaiStream _io__raw_filenames = new ByteBufferKaitaiStream(15);
            this._io.addChildStream(_io__raw_filenames);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (15));
                final HeroesOfMightAndMagicAgg _this = this;
                final int _i = i;
                _io__raw_filenames.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_filenames.add(_io__raw_filenames.toByteArray());
                        if (_this._raw_filenames.get(((Number) (_i)).intValue()).length != 15)
                            throw new ConsistencyError("raw(filenames)", 15, _this._raw_filenames.get(((Number) (_i)).intValue()).length);
                        parent.writeBytes(_this._raw_filenames.get(((Number) (_i)).intValue()));
                    }
                });
            }
            this.filenames.get(((Number) (i)).intValue())._write_Seq(_io__raw_filenames);
        }
        this._io.seek(_pos);
    }
    private int numFiles;
    private List<Entry> entries;
    private HeroesOfMightAndMagicAgg _root;
    private KaitaiStruct.ReadWrite _parent;
    private List<byte[]> _raw_filenames;
    public int numFiles() { return numFiles; }
    public void setNumFiles(int _v) { _dirty = true; numFiles = _v; }
    public List<Entry> entries() { return entries; }
    public void setEntries(List<Entry> _v) { _dirty = true; entries = _v; }
    public HeroesOfMightAndMagicAgg _root() { return _root; }
    public void set_root(HeroesOfMightAndMagicAgg _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public List<byte[]> _raw_filenames() { return _raw_filenames; }
    public void set_raw_Filenames(List<byte[]> _v) { _dirty = true; _raw_filenames = _v; }
}

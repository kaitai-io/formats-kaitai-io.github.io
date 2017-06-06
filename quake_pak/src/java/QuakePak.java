// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.nio.charset.Charset;

public class QuakePak extends KaitaiStruct {
    public static QuakePak fromFile(String fileName) throws IOException {
        return new QuakePak(new KaitaiStream(fileName));
    }

    public QuakePak(KaitaiStream _io) {
        super(_io);
        this._root = this;
        _init();
    }

    public QuakePak(KaitaiStream _io, KaitaiStruct _parent) {
        super(_io);
        this._parent = _parent;
        this._root = this;
        _init();
    }

    public QuakePak(KaitaiStream _io, KaitaiStruct _parent, QuakePak _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root;
        _init();
    }

    private void _init() {
        _read();
    }
    private void _read() {
        this.magic = this._io.ensureFixedContents(new byte[] { 80, 65, 67, 75 });
        this.indexOfs = this._io.readU4le();
        this.indexSize = this._io.readU4le();
    }
    public static class IndexStruct extends KaitaiStruct {
        public static IndexStruct fromFile(String fileName) throws IOException {
            return new IndexStruct(new KaitaiStream(fileName));
        }

        public IndexStruct(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public IndexStruct(KaitaiStream _io, QuakePak _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public IndexStruct(KaitaiStream _io, QuakePak _parent, QuakePak _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<IndexEntry>();
            while (!this._io.isEof()) {
                this.entries.add(new IndexEntry(this._io, this, _root));
            }
        }
        private ArrayList<IndexEntry> entries;
        private QuakePak _root;
        private QuakePak _parent;
        public ArrayList<IndexEntry> entries() { return entries; }
        public QuakePak _root() { return _root; }
        public QuakePak _parent() { return _parent; }
    }
    public static class IndexEntry extends KaitaiStruct {
        public static IndexEntry fromFile(String fileName) throws IOException {
            return new IndexEntry(new KaitaiStream(fileName));
        }

        public IndexEntry(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public IndexEntry(KaitaiStream _io, QuakePak.IndexStruct _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public IndexEntry(KaitaiStream _io, QuakePak.IndexStruct _parent, QuakePak _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.name = new String(KaitaiStream.bytesTerminate(KaitaiStream.bytesStripRight(this._io.readBytes(56), (byte) 0), (byte) 0, false), Charset.forName("UTF-8"));
            this.ofs = this._io.readU4le();
            this.size = this._io.readU4le();
        }
        private byte[] body;
        public byte[] body() {
            if (this.body != null)
                return this.body;
            KaitaiStream io = _root._io();
            long _pos = io.pos();
            io.seek(ofs());
            this.body = io.readBytes(size());
            io.seek(_pos);
            return this.body;
        }
        private String name;
        private long ofs;
        private long size;
        private QuakePak _root;
        private QuakePak.IndexStruct _parent;
        public String name() { return name; }
        public long ofs() { return ofs; }
        public long size() { return size; }
        public QuakePak _root() { return _root; }
        public QuakePak.IndexStruct _parent() { return _parent; }
    }
    private IndexStruct index;
    public IndexStruct index() {
        if (this.index != null)
            return this.index;
        long _pos = this._io.pos();
        this._io.seek(indexOfs());
        this._raw_index = this._io.readBytes(indexSize());
        KaitaiStream _io__raw_index = new KaitaiStream(_raw_index);
        this.index = new IndexStruct(_io__raw_index, this, _root);
        this._io.seek(_pos);
        return this.index;
    }
    private byte[] magic;
    private long indexOfs;
    private long indexSize;
    private QuakePak _root;
    private KaitaiStruct _parent;
    private byte[] _raw_index;
    public byte[] magic() { return magic; }
    public long indexOfs() { return indexOfs; }
    public long indexSize() { return indexSize; }
    public QuakePak _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_index() { return _raw_index; }
}

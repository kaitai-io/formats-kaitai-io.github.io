// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.nio.charset.Charset;

public class HeroesOfMightAndMagicAgg extends KaitaiStruct {
    public static HeroesOfMightAndMagicAgg fromFile(String fileName) throws IOException {
        return new HeroesOfMightAndMagicAgg(new ByteBufferKaitaiStream(fileName));
    }

    public HeroesOfMightAndMagicAgg(KaitaiStream _io) {
        this(_io, null, null);
    }

    public HeroesOfMightAndMagicAgg(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public HeroesOfMightAndMagicAgg(KaitaiStream _io, KaitaiStruct _parent, HeroesOfMightAndMagicAgg _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.numFiles = this._io.readU2le();
        entries = new ArrayList<Entry>((int) (numFiles()));
        for (int i = 0; i < numFiles(); i++) {
            this.entries.add(new Entry(this._io, this, _root));
        }
    }
    public static class Entry extends KaitaiStruct {
        public static Entry fromFile(String fileName) throws IOException {
            return new Entry(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.hash = this._io.readU2le();
            this.offset = this._io.readU4le();
            this.size = this._io.readU4le();
            this.size2 = this._io.readU4le();
        }
        private byte[] body;
        public byte[] body() {
            if (this.body != null)
                return this.body;
            long _pos = this._io.pos();
            this._io.seek(offset());
            this.body = this._io.readBytes(size());
            this._io.seek(_pos);
            return this.body;
        }
        private int hash;
        private long offset;
        private long size;
        private long size2;
        private HeroesOfMightAndMagicAgg _root;
        private HeroesOfMightAndMagicAgg _parent;
        public int hash() { return hash; }
        public long offset() { return offset; }
        public long size() { return size; }
        public long size2() { return size2; }
        public HeroesOfMightAndMagicAgg _root() { return _root; }
        public HeroesOfMightAndMagicAgg _parent() { return _parent; }
    }
    public static class Filename extends KaitaiStruct {
        public static Filename fromFile(String fileName) throws IOException {
            return new Filename(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.str = new String(this._io.readBytesTerm(0, false, true, true), Charset.forName("ASCII"));
        }
        private String str;
        private HeroesOfMightAndMagicAgg _root;
        private HeroesOfMightAndMagicAgg _parent;
        public String str() { return str; }
        public HeroesOfMightAndMagicAgg _root() { return _root; }
        public HeroesOfMightAndMagicAgg _parent() { return _parent; }
    }
    private ArrayList<Filename> filenames;
    public ArrayList<Filename> filenames() {
        if (this.filenames != null)
            return this.filenames;
        long _pos = this._io.pos();
        this._io.seek((entries().get(entries().size() - 1).offset() + entries().get(entries().size() - 1).size()));
        this._raw_filenames = new ArrayList<byte[]>((int) (numFiles()));
        filenames = new ArrayList<Filename>((int) (numFiles()));
        for (int i = 0; i < numFiles(); i++) {
            this._raw_filenames.add(this._io.readBytes(15));
            KaitaiStream _io__raw_filenames = new ByteBufferKaitaiStream(_raw_filenames.get(_raw_filenames.size() - 1));
            this.filenames.add(new Filename(_io__raw_filenames, this, _root));
        }
        this._io.seek(_pos);
        return this.filenames;
    }
    private int numFiles;
    private ArrayList<Entry> entries;
    private HeroesOfMightAndMagicAgg _root;
    private KaitaiStruct _parent;
    private ArrayList<byte[]> _raw_filenames;
    public int numFiles() { return numFiles; }
    public ArrayList<Entry> entries() { return entries; }
    public HeroesOfMightAndMagicAgg _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public ArrayList<byte[]> _raw_filenames() { return _raw_filenames; }
}

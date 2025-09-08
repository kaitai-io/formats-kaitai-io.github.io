// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.nio.charset.StandardCharsets;
import java.util.List;


/**
 * @see <a href="https://web.archive.org/web/20170215190034/http://rewiki.regengedanken.de/wiki/.AGG_(Heroes_of_Might_and_Magic)">Source</a>
 */
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
        this.entries = new ArrayList<Entry>();
        for (int i = 0; i < numFiles(); i++) {
            this.entries.add(new Entry(this._io, this, _root));
        }
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

        public void _fetchInstances() {
            body();
            if (this.body != null) {
            }
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
            this.str = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
        }

        public void _fetchInstances() {
        }
        private String str;
        private HeroesOfMightAndMagicAgg _root;
        private HeroesOfMightAndMagicAgg _parent;
        public String str() { return str; }
        public HeroesOfMightAndMagicAgg _root() { return _root; }
        public HeroesOfMightAndMagicAgg _parent() { return _parent; }
    }
    private List<Filename> filenames;
    public List<Filename> filenames() {
        if (this.filenames != null)
            return this.filenames;
        long _pos = this._io.pos();
        this._io.seek(entries().get(entries().size() - 1).offset() + entries().get(entries().size() - 1).size());
        this.filenames = new ArrayList<Filename>();
        for (int i = 0; i < numFiles(); i++) {
            KaitaiStream _io_filenames = this._io.substream(15);
            this.filenames.add(new Filename(_io_filenames, this, _root));
        }
        this._io.seek(_pos);
        return this.filenames;
    }
    private int numFiles;
    private List<Entry> entries;
    private HeroesOfMightAndMagicAgg _root;
    private KaitaiStruct _parent;
    public int numFiles() { return numFiles; }
    public List<Entry> entries() { return entries; }
    public HeroesOfMightAndMagicAgg _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

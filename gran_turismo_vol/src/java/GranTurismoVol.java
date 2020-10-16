// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import java.nio.charset.Charset;

public class GranTurismoVol extends KaitaiStruct {
    public static GranTurismoVol fromFile(String fileName) throws IOException {
        return new GranTurismoVol(new ByteBufferKaitaiStream(fileName));
    }

    public GranTurismoVol(KaitaiStream _io) {
        this(_io, null, null);
    }

    public GranTurismoVol(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public GranTurismoVol(KaitaiStream _io, KaitaiStruct _parent, GranTurismoVol _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readBytes(8);
        if (!(Arrays.equals(magic(), new byte[] { 71, 84, 70, 83, 0, 0, 0, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 71, 84, 70, 83, 0, 0, 0, 0 }, magic(), _io(), "/seq/0");
        }
        this.numFiles = this._io.readU2le();
        this.numEntries = this._io.readU2le();
        this.reserved = this._io.readBytes(4);
        if (!(Arrays.equals(reserved(), new byte[] { 0, 0, 0, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, reserved(), _io(), "/seq/3");
        }
        offsets = new ArrayList<Long>(((Number) (numFiles())).intValue());
        for (int i = 0; i < numFiles(); i++) {
            this.offsets.add(this._io.readU4le());
        }
    }
    public static class FileInfo extends KaitaiStruct {
        public static FileInfo fromFile(String fileName) throws IOException {
            return new FileInfo(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.timestamp = this._io.readU4le();
            this.offsetIdx = this._io.readU2le();
            this.flags = this._io.readU1();
            this.name = new String(KaitaiStream.bytesTerminate(KaitaiStream.bytesStripRight(this._io.readBytes(25), (byte) 0), (byte) 0, false), Charset.forName("ASCII"));
        }
        private Integer size;
        public Integer size() {
            if (this.size != null)
                return this.size;
            int _tmp = (int) (((_root.offsets().get((int) (offsetIdx() + 1)) & 4294965248L) - _root.offsets().get((int) offsetIdx())));
            this.size = _tmp;
            return this.size;
        }
        private byte[] body;
        public byte[] body() {
            if (this.body != null)
                return this.body;
            if (!(isDir())) {
                long _pos = this._io.pos();
                this._io.seek((_root.offsets().get((int) offsetIdx()) & 4294965248L));
                this.body = this._io.readBytes(size());
                this._io.seek(_pos);
            }
            return this.body;
        }
        private Boolean isDir;
        public Boolean isDir() {
            if (this.isDir != null)
                return this.isDir;
            boolean _tmp = (boolean) ((flags() & 1) != 0);
            this.isDir = _tmp;
            return this.isDir;
        }
        private Boolean isLastEntry;
        public Boolean isLastEntry() {
            if (this.isLastEntry != null)
                return this.isLastEntry;
            boolean _tmp = (boolean) ((flags() & 128) != 0);
            this.isLastEntry = _tmp;
            return this.isLastEntry;
        }
        private long timestamp;
        private int offsetIdx;
        private int flags;
        private String name;
        private GranTurismoVol _root;
        private GranTurismoVol _parent;
        public long timestamp() { return timestamp; }
        public int offsetIdx() { return offsetIdx; }
        public int flags() { return flags; }
        public String name() { return name; }
        public GranTurismoVol _root() { return _root; }
        public GranTurismoVol _parent() { return _parent; }
    }
    private Long ofsDir;
    public Long ofsDir() {
        if (this.ofsDir != null)
            return this.ofsDir;
        long _tmp = (long) (offsets().get((int) 1));
        this.ofsDir = _tmp;
        return this.ofsDir;
    }
    private ArrayList<FileInfo> files;
    public ArrayList<FileInfo> files() {
        if (this.files != null)
            return this.files;
        long _pos = this._io.pos();
        this._io.seek((ofsDir() & 4294965248L));
        files = new ArrayList<FileInfo>(((Number) (_root.numEntries())).intValue());
        for (int i = 0; i < _root.numEntries(); i++) {
            this.files.add(new FileInfo(this._io, this, _root));
        }
        this._io.seek(_pos);
        return this.files;
    }
    private byte[] magic;
    private int numFiles;
    private int numEntries;
    private byte[] reserved;
    private ArrayList<Long> offsets;
    private GranTurismoVol _root;
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }
    public int numFiles() { return numFiles; }
    public int numEntries() { return numEntries; }
    public byte[] reserved() { return reserved; }
    public ArrayList<Long> offsets() { return offsets; }
    public GranTurismoVol _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

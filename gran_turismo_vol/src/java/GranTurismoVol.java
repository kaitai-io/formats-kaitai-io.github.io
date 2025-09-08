// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import java.nio.charset.StandardCharsets;
import java.util.List;

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
            this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(25), (byte) 0, false), StandardCharsets.US_ASCII);
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
            if (!(isDir())) {
                long _pos = this._io.pos();
                this._io.seek(_root().offsets().get(((Number) (offsetIdx())).intValue()) & 4294965248L);
                this.body = this._io.readBytes(size());
                this._io.seek(_pos);
            }
            return this.body;
        }
        private Boolean isDir;
        public Boolean isDir() {
            if (this.isDir != null)
                return this.isDir;
            this.isDir = (flags() & 1) != 0;
            return this.isDir;
        }
        private Boolean isLastEntry;
        public Boolean isLastEntry() {
            if (this.isLastEntry != null)
                return this.isLastEntry;
            this.isLastEntry = (flags() & 128) != 0;
            return this.isLastEntry;
        }
        private Integer size;
        public Integer size() {
            if (this.size != null)
                return this.size;
            this.size = ((Number) ((_root().offsets().get(((Number) (offsetIdx() + 1)).intValue()) & 4294965248L) - _root().offsets().get(((Number) (offsetIdx())).intValue()))).intValue();
            return this.size;
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
    private List<FileInfo> files;
    public List<FileInfo> files() {
        if (this.files != null)
            return this.files;
        long _pos = this._io.pos();
        this._io.seek(ofsDir() & 4294965248L);
        this.files = new ArrayList<FileInfo>();
        for (int i = 0; i < _root().numEntries(); i++) {
            this.files.add(new FileInfo(this._io, this, _root));
        }
        this._io.seek(_pos);
        return this.files;
    }
    private Long ofsDir;
    public Long ofsDir() {
        if (this.ofsDir != null)
            return this.ofsDir;
        this.ofsDir = ((Number) (offsets().get(((int) 1)))).longValue();
        return this.ofsDir;
    }
    private byte[] magic;
    private int numFiles;
    private int numEntries;
    private byte[] reserved;
    private List<Long> offsets;
    private GranTurismoVol _root;
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }
    public int numFiles() { return numFiles; }
    public int numEntries() { return numEntries; }
    public byte[] reserved() { return reserved; }
    public List<Long> offsets() { return offsets; }
    public GranTurismoVol _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

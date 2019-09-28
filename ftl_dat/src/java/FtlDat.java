// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.nio.charset.Charset;

public class FtlDat extends KaitaiStruct {
    public static FtlDat fromFile(String fileName) throws IOException {
        return new FtlDat(new ByteBufferKaitaiStream(fileName));
    }

    public FtlDat(KaitaiStream _io) {
        this(_io, null, null);
    }

    public FtlDat(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public FtlDat(KaitaiStream _io, KaitaiStruct _parent, FtlDat _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.numFiles = this._io.readU4le();
        files = new ArrayList<File>(((Number) (numFiles())).intValue());
        for (int i = 0; i < numFiles(); i++) {
            this.files.add(new File(this._io, this, _root));
        }
    }
    public static class File extends KaitaiStruct {
        public static File fromFile(String fileName) throws IOException {
            return new File(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.ofsMeta = this._io.readU4le();
        }
        private Meta meta;
        public Meta meta() {
            if (this.meta != null)
                return this.meta;
            if (ofsMeta() != 0) {
                long _pos = this._io.pos();
                this._io.seek(ofsMeta());
                this.meta = new Meta(this._io, this, _root);
                this._io.seek(_pos);
            }
            return this.meta;
        }
        private long ofsMeta;
        private FtlDat _root;
        private FtlDat _parent;
        public long ofsMeta() { return ofsMeta; }
        public FtlDat _root() { return _root; }
        public FtlDat _parent() { return _parent; }
    }
    public static class Meta extends KaitaiStruct {
        public static Meta fromFile(String fileName) throws IOException {
            return new Meta(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.lenFile = this._io.readU4le();
            this.lenFilename = this._io.readU4le();
            this.filename = new String(this._io.readBytes(lenFilename()), Charset.forName("UTF-8"));
            this.body = this._io.readBytes(lenFile());
        }
        private long lenFile;
        private long lenFilename;
        private String filename;
        private byte[] body;
        private FtlDat _root;
        private FtlDat.File _parent;
        public long lenFile() { return lenFile; }
        public long lenFilename() { return lenFilename; }
        public String filename() { return filename; }
        public byte[] body() { return body; }
        public FtlDat _root() { return _root; }
        public FtlDat.File _parent() { return _parent; }
    }
    private long numFiles;
    private ArrayList<File> files;
    private FtlDat _root;
    private KaitaiStruct _parent;

    /**
     * Number of files in the archive
     */
    public long numFiles() { return numFiles; }
    public ArrayList<File> files() { return files; }
    public FtlDat _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

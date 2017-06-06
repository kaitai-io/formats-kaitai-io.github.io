// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.nio.charset.Charset;

public class FtlDat extends KaitaiStruct {
    public static FtlDat fromFile(String fileName) throws IOException {
        return new FtlDat(new KaitaiStream(fileName));
    }

    public FtlDat(KaitaiStream _io) {
        super(_io);
        this._root = this;
        _init();
    }

    public FtlDat(KaitaiStream _io, KaitaiStruct _parent) {
        super(_io);
        this._parent = _parent;
        this._root = this;
        _init();
    }

    public FtlDat(KaitaiStream _io, KaitaiStruct _parent, FtlDat _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root;
        _init();
    }

    private void _init() {
        _read();
    }
    private void _read() {
        this.numFiles = this._io.readU4le();
        files = new ArrayList<File>((int) (numFiles()));
        for (int i = 0; i < numFiles(); i++) {
            this.files.add(new File(this._io, this, _root));
        }
    }
    public static class File extends KaitaiStruct {
        public static File fromFile(String fileName) throws IOException {
            return new File(new KaitaiStream(fileName));
        }

        public File(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public File(KaitaiStream _io, FtlDat _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public File(KaitaiStream _io, FtlDat _parent, FtlDat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.metaOfs = this._io.readU4le();
        }
        private Meta meta;
        public Meta meta() {
            if (this.meta != null)
                return this.meta;
            if (metaOfs() != 0) {
                long _pos = this._io.pos();
                this._io.seek(metaOfs());
                this.meta = new Meta(this._io, this, _root);
                this._io.seek(_pos);
            }
            return this.meta;
        }
        private long metaOfs;
        private FtlDat _root;
        private FtlDat _parent;
        public long metaOfs() { return metaOfs; }
        public FtlDat _root() { return _root; }
        public FtlDat _parent() { return _parent; }
    }
    public static class Meta extends KaitaiStruct {
        public static Meta fromFile(String fileName) throws IOException {
            return new Meta(new KaitaiStream(fileName));
        }

        public Meta(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public Meta(KaitaiStream _io, FtlDat.File _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public Meta(KaitaiStream _io, FtlDat.File _parent, FtlDat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.fileSize = this._io.readU4le();
            this.filenameSize = this._io.readU4le();
            this.filename = new String(this._io.readBytes(filenameSize()), Charset.forName("UTF-8"));
            this.body = this._io.readBytes(fileSize());
        }
        private long fileSize;
        private long filenameSize;
        private String filename;
        private byte[] body;
        private FtlDat _root;
        private FtlDat.File _parent;
        public long fileSize() { return fileSize; }
        public long filenameSize() { return filenameSize; }
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

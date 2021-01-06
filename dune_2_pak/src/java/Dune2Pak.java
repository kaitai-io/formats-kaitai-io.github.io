// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.nio.charset.Charset;


/**
 * @see <a href="http://www.shikadi.net/moddingwiki/PAK_Format_(Westwood)">Source</a>
 */
public class Dune2Pak extends KaitaiStruct {
    public static Dune2Pak fromFile(String fileName) throws IOException {
        return new Dune2Pak(new ByteBufferKaitaiStream(fileName));
    }

    public Dune2Pak(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Dune2Pak(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Dune2Pak(KaitaiStream _io, KaitaiStruct _parent, Dune2Pak _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this._raw_dir = this._io.readBytes(dirSize());
        KaitaiStream _io__raw_dir = new ByteBufferKaitaiStream(_raw_dir);
        this.dir = new Files(_io__raw_dir, this, _root);
    }
    public static class Files extends KaitaiStruct {
        public static Files fromFile(String fileName) throws IOException {
            return new Files(new ByteBufferKaitaiStream(fileName));
        }

        public Files(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Files(KaitaiStream _io, Dune2Pak _parent) {
            this(_io, _parent, null);
        }

        public Files(KaitaiStream _io, Dune2Pak _parent, Dune2Pak _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.files = new ArrayList<File>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.files.add(new File(this._io, this, _root, i));
                    i++;
                }
            }
        }
        private ArrayList<File> files;
        private Dune2Pak _root;
        private Dune2Pak _parent;
        public ArrayList<File> files() { return files; }
        public Dune2Pak _root() { return _root; }
        public Dune2Pak _parent() { return _parent; }
    }
    public static class File extends KaitaiStruct {

        public File(KaitaiStream _io, long idx) {
            this(_io, null, null, idx);
        }

        public File(KaitaiStream _io, Dune2Pak.Files _parent, long idx) {
            this(_io, _parent, null, idx);
        }

        public File(KaitaiStream _io, Dune2Pak.Files _parent, Dune2Pak _root, long idx) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.idx = idx;
            _read();
        }
        private void _read() {
            this.ofs = this._io.readU4le();
            if (ofs() != 0) {
                this.fileName = new String(this._io.readBytesTerm(0, false, true, true), Charset.forName("ASCII"));
            }
        }
        private Long nextOfs0;
        public Long nextOfs0() {
            if (this.nextOfs0 != null)
                return this.nextOfs0;
            if (ofs() != 0) {
                long _tmp = (long) (_root.dir().files().get((int) (idx() + 1)).ofs());
                this.nextOfs0 = _tmp;
            }
            return this.nextOfs0;
        }
        private Integer nextOfs;
        public Integer nextOfs() {
            if (this.nextOfs != null)
                return this.nextOfs;
            if (ofs() != 0) {
                int _tmp = (int) ((nextOfs0() == 0 ? _root._io().size() : nextOfs0()));
                this.nextOfs = _tmp;
            }
            return this.nextOfs;
        }
        private byte[] body;
        public byte[] body() {
            if (this.body != null)
                return this.body;
            if (ofs() != 0) {
                KaitaiStream io = _root._io();
                long _pos = io.pos();
                io.seek(ofs());
                this.body = io.readBytes((nextOfs() - ofs()));
                io.seek(_pos);
            }
            return this.body;
        }
        private long ofs;
        private String fileName;
        private long idx;
        private Dune2Pak _root;
        private Dune2Pak.Files _parent;
        public long ofs() { return ofs; }
        public String fileName() { return fileName; }
        public long idx() { return idx; }
        public Dune2Pak _root() { return _root; }
        public Dune2Pak.Files _parent() { return _parent; }
    }
    private Long dirSize;
    public Long dirSize() {
        if (this.dirSize != null)
            return this.dirSize;
        long _pos = this._io.pos();
        this._io.seek(0);
        this.dirSize = this._io.readU4le();
        this._io.seek(_pos);
        return this.dirSize;
    }
    private Files dir;
    private Dune2Pak _root;
    private KaitaiStruct _parent;
    private byte[] _raw_dir;
    public Files dir() { return dir; }
    public Dune2Pak _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_dir() { return _raw_dir; }
}

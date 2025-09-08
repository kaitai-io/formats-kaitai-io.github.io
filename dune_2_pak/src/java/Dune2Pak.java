// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;


/**
 * @see <a href="https://moddingwiki.shikadi.net/wiki/PAK_Format_(Westwood)">Source</a>
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
        KaitaiStream _io_dir = this._io.substream(dirSize());
        this.dir = new Files(_io_dir, this, _root);
    }

    public void _fetchInstances() {
        this.dir._fetchInstances();
        dirSize();
        if (this.dirSize != null) {
        }
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
                this.fileName = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
            }
        }

        public void _fetchInstances() {
            if (ofs() != 0) {
            }
            body();
            if (this.body != null) {
            }
        }
        private byte[] body;
        public byte[] body() {
            if (this.body != null)
                return this.body;
            if (ofs() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofs());
                this.body = io.readBytes(nextOfs() - ofs());
                io.seek(_pos);
            }
            return this.body;
        }
        private Integer nextOfs;
        public Integer nextOfs() {
            if (this.nextOfs != null)
                return this.nextOfs;
            if (ofs() != 0) {
                this.nextOfs = ((Number) ((nextOfs0() == 0 ? _root()._io().size() : nextOfs0()))).intValue();
            }
            return this.nextOfs;
        }
        private Long nextOfs0;
        public Long nextOfs0() {
            if (this.nextOfs0 != null)
                return this.nextOfs0;
            if (ofs() != 0) {
                this.nextOfs0 = ((Number) (_root().dir().files().get(((Number) (idx() + 1)).intValue()).ofs())).longValue();
            }
            return this.nextOfs0;
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

        public void _fetchInstances() {
            for (int i = 0; i < this.files.size(); i++) {
                this.files.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private List<File> files;
        private Dune2Pak _root;
        private Dune2Pak _parent;
        public List<File> files() { return files; }
        public Dune2Pak _root() { return _root; }
        public Dune2Pak _parent() { return _parent; }
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
    public Files dir() { return dir; }
    public Dune2Pak _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

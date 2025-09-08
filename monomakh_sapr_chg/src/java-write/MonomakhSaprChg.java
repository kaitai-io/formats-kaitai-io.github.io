// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.nio.charset.Charset;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;


/**
 * CHG is a container format file used by
 * [MONOMAKH-SAPR](https://www.liraland.com/mono/), a software
 * package for analysis & design of reinforced concrete multi-storey
 * buildings with arbitrary configuration in plan.
 * 
 * CHG is a simple container, which bundles several project files
 * together.
 * 
 * Written and tested by Vladimir Shulzhitskiy, 2017
 */
public class MonomakhSaprChg extends KaitaiStruct.ReadWrite {
    public static MonomakhSaprChg fromFile(String fileName) throws IOException {
        return new MonomakhSaprChg(new ByteBufferKaitaiStream(fileName));
    }
    public MonomakhSaprChg() {
        this(null, null, null);
    }

    public MonomakhSaprChg(KaitaiStream _io) {
        this(_io, null, null);
    }

    public MonomakhSaprChg(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public MonomakhSaprChg(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, MonomakhSaprChg _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.title = new String(this._io.readBytes(10), StandardCharsets.US_ASCII);
        this.ent = new ArrayList<Block>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                Block _t_ent = new Block(this._io, this, _root);
                try {
                    _t_ent._read();
                } finally {
                    this.ent.add(_t_ent);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.ent.size(); i++) {
            this.ent.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes((this.title).getBytes(Charset.forName("ASCII")));
        for (int i = 0; i < this.ent.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("ent", 0, this._io.size() - this._io.pos());
            this.ent.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("ent", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        if ((this.title).getBytes(Charset.forName("ASCII")).length != 10)
            throw new ConsistencyError("title", 10, (this.title).getBytes(Charset.forName("ASCII")).length);
        for (int i = 0; i < this.ent.size(); i++) {
            if (!Objects.equals(this.ent.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("ent", _root(), this.ent.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.ent.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("ent", this, this.ent.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class Block extends KaitaiStruct.ReadWrite {
        public static Block fromFile(String fileName) throws IOException {
            return new Block(new ByteBufferKaitaiStream(fileName));
        }
        public Block() {
            this(null, null, null);
        }

        public Block(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Block(KaitaiStream _io, MonomakhSaprChg _parent) {
            this(_io, _parent, null);
        }

        public Block(KaitaiStream _io, MonomakhSaprChg _parent, MonomakhSaprChg _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.header = new String(this._io.readBytes(13), StandardCharsets.US_ASCII);
            this.fileSize = this._io.readU8le();
            this.file = this._io.readBytes(fileSize());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.header).getBytes(Charset.forName("ASCII")));
            this._io.writeU8le(this.fileSize);
            this._io.writeBytes(this.file);
        }

        public void _check() {
            if ((this.header).getBytes(Charset.forName("ASCII")).length != 13)
                throw new ConsistencyError("header", 13, (this.header).getBytes(Charset.forName("ASCII")).length);
            if (this.file.length != fileSize())
                throw new ConsistencyError("file", fileSize(), this.file.length);
            _dirty = false;
        }
        private String header;
        private long fileSize;
        private byte[] file;
        private MonomakhSaprChg _root;
        private MonomakhSaprChg _parent;
        public String header() { return header; }
        public void setHeader(String _v) { _dirty = true; header = _v; }
        public long fileSize() { return fileSize; }
        public void setFileSize(long _v) { _dirty = true; fileSize = _v; }
        public byte[] file() { return file; }
        public void setFile(byte[] _v) { _dirty = true; file = _v; }
        public MonomakhSaprChg _root() { return _root; }
        public void set_root(MonomakhSaprChg _v) { _dirty = true; _root = _v; }
        public MonomakhSaprChg _parent() { return _parent; }
        public void set_parent(MonomakhSaprChg _v) { _dirty = true; _parent = _v; }
    }
    private String title;
    private List<Block> ent;
    private MonomakhSaprChg _root;
    private KaitaiStruct.ReadWrite _parent;
    public String title() { return title; }
    public void setTitle(String _v) { _dirty = true; title = _v; }
    public List<Block> ent() { return ent; }
    public void setEnt(List<Block> _v) { _dirty = true; ent = _v; }
    public MonomakhSaprChg _root() { return _root; }
    public void set_root(MonomakhSaprChg _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
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
public class MonomakhSaprChg extends KaitaiStruct {
    public static MonomakhSaprChg fromFile(String fileName) throws IOException {
        return new MonomakhSaprChg(new ByteBufferKaitaiStream(fileName));
    }

    public MonomakhSaprChg(KaitaiStream _io) {
        this(_io, null, null);
    }

    public MonomakhSaprChg(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public MonomakhSaprChg(KaitaiStream _io, KaitaiStruct _parent, MonomakhSaprChg _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.title = new String(this._io.readBytes(10), StandardCharsets.US_ASCII);
        this.ent = new ArrayList<Block>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.ent.add(new Block(this._io, this, _root));
                i++;
            }
        }
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.ent.size(); i++) {
            this.ent.get(((Number) (i)).intValue())._fetchInstances();
        }
    }
    public static class Block extends KaitaiStruct {
        public static Block fromFile(String fileName) throws IOException {
            return new Block(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.header = new String(this._io.readBytes(13), StandardCharsets.US_ASCII);
            this.fileSize = this._io.readU8le();
            this.file = this._io.readBytes(fileSize());
        }

        public void _fetchInstances() {
        }
        private String header;
        private long fileSize;
        private byte[] file;
        private MonomakhSaprChg _root;
        private MonomakhSaprChg _parent;
        public String header() { return header; }
        public long fileSize() { return fileSize; }
        public byte[] file() { return file; }
        public MonomakhSaprChg _root() { return _root; }
        public MonomakhSaprChg _parent() { return _parent; }
    }
    private String title;
    private List<Block> ent;
    private MonomakhSaprChg _root;
    private KaitaiStruct _parent;
    public String title() { return title; }
    public List<Block> ent() { return ent; }
    public MonomakhSaprChg _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

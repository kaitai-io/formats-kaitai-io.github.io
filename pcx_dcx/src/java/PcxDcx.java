// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;


/**
 * DCX is a simple extension of PCX image format allowing to bundle
 * many PCX images (typically, pages of a document) in one file. It saw
 * some limited use in DOS-era fax software, but was largely
 * superseded with multi-page TIFFs and PDFs since then.
 */
public class PcxDcx extends KaitaiStruct {
    public static PcxDcx fromFile(String fileName) throws IOException {
        return new PcxDcx(new ByteBufferKaitaiStream(fileName));
    }

    public PcxDcx(KaitaiStream _io) {
        this(_io, null, null);
    }

    public PcxDcx(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public PcxDcx(KaitaiStream _io, KaitaiStruct _parent, PcxDcx _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { -79, 104, -34, 58 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { -79, 104, -34, 58 }, this.magic, this._io, "/seq/0");
        }
        this.files = new ArrayList<PcxOffset>();
        {
            PcxOffset _it;
            int i = 0;
            do {
                _it = new PcxOffset(this._io, this, _root);
                this.files.add(_it);
                i++;
            } while (!(_it.ofsBody() == 0));
        }
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.files.size(); i++) {
            this.files.get(((Number) (i)).intValue())._fetchInstances();
        }
    }
    public static class PcxOffset extends KaitaiStruct {
        public static PcxOffset fromFile(String fileName) throws IOException {
            return new PcxOffset(new ByteBufferKaitaiStream(fileName));
        }

        public PcxOffset(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PcxOffset(KaitaiStream _io, PcxDcx _parent) {
            this(_io, _parent, null);
        }

        public PcxOffset(KaitaiStream _io, PcxDcx _parent, PcxDcx _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.ofsBody = this._io.readU4le();
        }

        public void _fetchInstances() {
            body();
            if (this.body != null) {
                this.body._fetchInstances();
            }
        }
        private Pcx body;
        public Pcx body() {
            if (this.body != null)
                return this.body;
            if (ofsBody() != 0) {
                long _pos = this._io.pos();
                this._io.seek(ofsBody());
                this.body = new Pcx(this._io);
                this._io.seek(_pos);
            }
            return this.body;
        }
        private long ofsBody;
        private PcxDcx _root;
        private PcxDcx _parent;
        public long ofsBody() { return ofsBody; }
        public PcxDcx _root() { return _root; }
        public PcxDcx _parent() { return _parent; }
    }
    private byte[] magic;
    private List<PcxOffset> files;
    private PcxDcx _root;
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }
    public List<PcxOffset> files() { return files; }
    public PcxDcx _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

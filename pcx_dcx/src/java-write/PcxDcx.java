// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;


/**
 * DCX is a simple extension of PCX image format allowing to bundle
 * many PCX images (typically, pages of a document) in one file. It saw
 * some limited use in DOS-era fax software, but was largely
 * superseded with multi-page TIFFs and PDFs since then.
 */
public class PcxDcx extends KaitaiStruct.ReadWrite {
    public static PcxDcx fromFile(String fileName) throws IOException {
        return new PcxDcx(new ByteBufferKaitaiStream(fileName));
    }
    public PcxDcx() {
        this(null, null, null);
    }

    public PcxDcx(KaitaiStream _io) {
        this(_io, null, null);
    }

    public PcxDcx(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public PcxDcx(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, PcxDcx _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { -79, 104, -34, 58 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { -79, 104, -34, 58 }, this.magic, this._io, "/seq/0");
        }
        this.files = new ArrayList<PcxOffset>();
        {
            PcxOffset _it;
            int i = 0;
            do {
                PcxOffset _t_files = new PcxOffset(this._io, this, _root);
                try {
                    _t_files._read();
                } finally {
                    _it = _t_files;
                    this.files.add(_it);
                }
                i++;
            } while (!(_it.ofsBody() == 0));
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.files.size(); i++) {
            this.files.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.magic);
        for (int i = 0; i < this.files.size(); i++) {
            this.files.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (this.magic.length != 4)
            throw new ConsistencyError("magic", 4, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { -79, 104, -34, 58 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { -79, 104, -34, 58 }, this.magic, null, "/seq/0");
        }
        if (this.files.size() == 0)
            throw new ConsistencyError("files", 0, this.files.size());
        for (int i = 0; i < this.files.size(); i++) {
            if (!Objects.equals(this.files.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("files", _root(), this.files.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.files.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("files", this, this.files.get(((Number) (i)).intValue())._parent());
            {
                PcxOffset _it = this.files.get(((Number) (i)).intValue());
                if ((_it.ofsBody() == 0) != (i == this.files.size() - 1))
                    throw new ConsistencyError("files", i == this.files.size() - 1, _it.ofsBody() == 0);
            }
        }
        _dirty = false;
    }
    public static class PcxOffset extends KaitaiStruct.ReadWrite {
        public static PcxOffset fromFile(String fileName) throws IOException {
            return new PcxOffset(new ByteBufferKaitaiStream(fileName));
        }
        public PcxOffset() {
            this(null, null, null);
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
        }
        public void _read() {
            this.ofsBody = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            body();
            if (this.body != null) {
                this.body._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteBody = _enabledBody;
            this._io.writeU4le(this.ofsBody);
        }

        public void _check() {
            if (_enabledBody) {
                if (ofsBody() != 0) {
                }
            }
            _dirty = false;
        }
        private Pcx body;
        private boolean _shouldWriteBody = false;
        private boolean _enabledBody = true;
        public Pcx body() {
            if (_shouldWriteBody)
                _writeBody();
            if (this.body != null)
                return this.body;
            if (!_enabledBody)
                return null;
            if (ofsBody() != 0) {
                long _pos = this._io.pos();
                this._io.seek(ofsBody());
                this.body = new Pcx(this._io);
                this.body._read();
                this._io.seek(_pos);
            }
            return this.body;
        }
        public void setBody(Pcx _v) { _dirty = true; body = _v; }
        public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

        private void _writeBody() {
            _shouldWriteBody = false;
            if (ofsBody() != 0) {
                long _pos = this._io.pos();
                this._io.seek(ofsBody());
                this.body._write_Seq(this._io);
                this._io.seek(_pos);
            }
        }
        private long ofsBody;
        private PcxDcx _root;
        private PcxDcx _parent;
        public long ofsBody() { return ofsBody; }
        public void setOfsBody(long _v) { _dirty = true; ofsBody = _v; }
        public PcxDcx _root() { return _root; }
        public void set_root(PcxDcx _v) { _dirty = true; _root = _v; }
        public PcxDcx _parent() { return _parent; }
        public void set_parent(PcxDcx _v) { _dirty = true; _parent = _v; }
    }
    private byte[] magic;
    private List<PcxOffset> files;
    private PcxDcx _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
    public List<PcxOffset> files() { return files; }
    public void setFiles(List<PcxOffset> _v) { _dirty = true; files = _v; }
    public PcxDcx _root() { return _root; }
    public void set_root(PcxDcx _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

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
 * This is a simple container format that encapsulates multiple Mach-O files,
 * each generally for a different architecture. XNU can execute these files just
 * like single-arch Mach-Os and will pick the appropriate entry.
 * @see <a href="https://opensource.apple.com/source/xnu/xnu-7195.121.3/EXTERNAL_HEADERS/mach-o/fat.h.auto.html">Source</a>
 */
public class MachOFat extends KaitaiStruct.ReadWrite {
    public static MachOFat fromFile(String fileName) throws IOException {
        return new MachOFat(new ByteBufferKaitaiStream(fileName));
    }
    public MachOFat() {
        this(null, null, null);
    }

    public MachOFat(KaitaiStream _io) {
        this(_io, null, null);
    }

    public MachOFat(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public MachOFat(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, MachOFat _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { -54, -2, -70, -66 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { -54, -2, -70, -66 }, this.magic, this._io, "/seq/0");
        }
        this.numFatArch = this._io.readU4be();
        this.fatArchs = new ArrayList<FatArch>();
        for (int i = 0; i < numFatArch(); i++) {
            FatArch _t_fatArchs = new FatArch(this._io, this, _root);
            try {
                _t_fatArchs._read();
            } finally {
                this.fatArchs.add(_t_fatArchs);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.fatArchs.size(); i++) {
            this.fatArchs.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.magic);
        this._io.writeU4be(this.numFatArch);
        for (int i = 0; i < this.fatArchs.size(); i++) {
            this.fatArchs.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (this.magic.length != 4)
            throw new ConsistencyError("magic", 4, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { -54, -2, -70, -66 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { -54, -2, -70, -66 }, this.magic, null, "/seq/0");
        }
        if (this.fatArchs.size() != numFatArch())
            throw new ConsistencyError("fat_archs", numFatArch(), this.fatArchs.size());
        for (int i = 0; i < this.fatArchs.size(); i++) {
            if (!Objects.equals(this.fatArchs.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("fat_archs", _root(), this.fatArchs.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.fatArchs.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("fat_archs", this, this.fatArchs.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class FatArch extends KaitaiStruct.ReadWrite {
        public static FatArch fromFile(String fileName) throws IOException {
            return new FatArch(new ByteBufferKaitaiStream(fileName));
        }
        public FatArch() {
            this(null, null, null);
        }

        public FatArch(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FatArch(KaitaiStream _io, MachOFat _parent) {
            this(_io, _parent, null);
        }

        public FatArch(KaitaiStream _io, MachOFat _parent, MachOFat _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.cpuType = MachO.CpuType.byId(this._io.readU4be());
            this.cpuSubtype = this._io.readU4be();
            this.ofsObject = this._io.readU4be();
            this.lenObject = this._io.readU4be();
            this.align = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
            object();
            if (this.object != null) {
                this.object._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteObject = _enabledObject;
            this._io.writeU4be(((Number) (this.cpuType.id())).longValue());
            this._io.writeU4be(this.cpuSubtype);
            this._io.writeU4be(this.ofsObject);
            this._io.writeU4be(this.lenObject);
            this._io.writeU4be(this.align);
        }

        public void _check() {
            if (_enabledObject) {
            }
            _dirty = false;
        }
        private MachO object;
        private boolean _shouldWriteObject = false;
        private boolean _enabledObject = true;
        public MachO object() {
            if (_shouldWriteObject)
                _writeObject();
            if (this.object != null)
                return this.object;
            if (!_enabledObject)
                return null;
            long _pos = this._io.pos();
            this._io.seek(ofsObject());
            this._raw_object = this._io.readBytes(lenObject());
            KaitaiStream _io__raw_object = new ByteBufferKaitaiStream(this._raw_object);
            this.object = new MachO(_io__raw_object);
            this.object._read();
            this._io.seek(_pos);
            return this.object;
        }
        public void setObject(MachO _v) { _dirty = true; object = _v; }
        public void setObject_Enabled(boolean _v) { _dirty = true; _enabledObject = _v; }

        private void _writeObject() {
            _shouldWriteObject = false;
            long _pos = this._io.pos();
            this._io.seek(ofsObject());
            final KaitaiStream _io__raw_object = new ByteBufferKaitaiStream(lenObject());
            this._io.addChildStream(_io__raw_object);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenObject()));
                final FatArch _this = this;
                _io__raw_object.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_object = _io__raw_object.toByteArray();
                        if (_this._raw_object.length != lenObject())
                            throw new ConsistencyError("raw(object)", lenObject(), _this._raw_object.length);
                        parent.writeBytes(_this._raw_object);
                    }
                });
            }
            this.object._write_Seq(_io__raw_object);
            this._io.seek(_pos);
        }
        private MachO.CpuType cpuType;
        private long cpuSubtype;
        private long ofsObject;
        private long lenObject;
        private long align;
        private MachOFat _root;
        private MachOFat _parent;
        private byte[] _raw_object;
        public MachO.CpuType cpuType() { return cpuType; }
        public void setCpuType(MachO.CpuType _v) { _dirty = true; cpuType = _v; }
        public long cpuSubtype() { return cpuSubtype; }
        public void setCpuSubtype(long _v) { _dirty = true; cpuSubtype = _v; }
        public long ofsObject() { return ofsObject; }
        public void setOfsObject(long _v) { _dirty = true; ofsObject = _v; }
        public long lenObject() { return lenObject; }
        public void setLenObject(long _v) { _dirty = true; lenObject = _v; }
        public long align() { return align; }
        public void setAlign(long _v) { _dirty = true; align = _v; }
        public MachOFat _root() { return _root; }
        public void set_root(MachOFat _v) { _dirty = true; _root = _v; }
        public MachOFat _parent() { return _parent; }
        public void set_parent(MachOFat _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_object() { return _raw_object; }
        public void set_raw_Object(byte[] _v) { _dirty = true; _raw_object = _v; }
    }
    private byte[] magic;
    private long numFatArch;
    private List<FatArch> fatArchs;
    private MachOFat _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
    public long numFatArch() { return numFatArch; }
    public void setNumFatArch(long _v) { _dirty = true; numFatArch = _v; }
    public List<FatArch> fatArchs() { return fatArchs; }
    public void setFatArchs(List<FatArch> _v) { _dirty = true; fatArchs = _v; }
    public MachOFat _root() { return _root; }
    public void set_root(MachOFat _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

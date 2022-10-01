// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;


/**
 * This is a simple container format that encapsulates multiple Mach-O files,
 * each generally for a different architecture. XNU can execute these files just
 * like single-arch Mach-Os and will pick the appropriate entry.
 * @see <a href="https://opensource.apple.com/source/xnu/xnu-7195.121.3/EXTERNAL_HEADERS/mach-o/fat.h.auto.html">Source</a>
 */
public class MachOFat extends KaitaiStruct {
    public static MachOFat fromFile(String fileName) throws IOException {
        return new MachOFat(new ByteBufferKaitaiStream(fileName));
    }

    public MachOFat(KaitaiStream _io) {
        this(_io, null, null);
    }

    public MachOFat(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public MachOFat(KaitaiStream _io, KaitaiStruct _parent, MachOFat _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(magic(), new byte[] { -54, -2, -70, -66 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { -54, -2, -70, -66 }, magic(), _io(), "/seq/0");
        }
        this.numFatArch = this._io.readU4be();
        this.fatArchs = new ArrayList<FatArch>();
        for (int i = 0; i < numFatArch(); i++) {
            this.fatArchs.add(new FatArch(this._io, this, _root));
        }
    }
    public static class FatArch extends KaitaiStruct {
        public static FatArch fromFile(String fileName) throws IOException {
            return new FatArch(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.cpuType = MachO.CpuType.byId(this._io.readU4be());
            this.cpuSubtype = this._io.readU4be();
            this.ofsObject = this._io.readU4be();
            this.lenObject = this._io.readU4be();
            this.align = this._io.readU4be();
        }
        private MachO object;
        public MachO object() {
            if (this.object != null)
                return this.object;
            long _pos = this._io.pos();
            this._io.seek(ofsObject());
            this._raw_object = this._io.readBytes(lenObject());
            KaitaiStream _io__raw_object = new ByteBufferKaitaiStream(_raw_object);
            this.object = new MachO(_io__raw_object);
            this._io.seek(_pos);
            return this.object;
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
        public long cpuSubtype() { return cpuSubtype; }
        public long ofsObject() { return ofsObject; }
        public long lenObject() { return lenObject; }
        public long align() { return align; }
        public MachOFat _root() { return _root; }
        public MachOFat _parent() { return _parent; }
        public byte[] _raw_object() { return _raw_object; }
    }
    private byte[] magic;
    private long numFatArch;
    private ArrayList<FatArch> fatArchs;
    private MachOFat _root;
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }
    public long numFatArch() { return numFatArch; }
    public ArrayList<FatArch> fatArchs() { return fatArchs; }
    public MachOFat _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

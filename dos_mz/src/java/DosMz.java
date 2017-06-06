// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;


/**
 * DOS MZ file format is a traditional format for executables in MS-DOS
 * environment. Many modern formats (i.e. Windows PE) still maintain
 * compatibility stub with this format.
 * 
 * As opposed to .com file format (which basically sports one 64K code
 * segment of raw CPU instructions), DOS MZ .exe file format allowed
 * more flexible memory management, loading of larger programs and
 * added support for relocations.
 */
public class DosMz extends KaitaiStruct {
    public static DosMz fromFile(String fileName) throws IOException {
        return new DosMz(new KaitaiStream(fileName));
    }

    public DosMz(KaitaiStream _io) {
        super(_io);
        this._root = this;
        _init();
    }

    public DosMz(KaitaiStream _io, KaitaiStruct _parent) {
        super(_io);
        this._parent = _parent;
        this._root = this;
        _init();
    }

    public DosMz(KaitaiStream _io, KaitaiStruct _parent, DosMz _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root;
        _init();
    }

    private void _init() {
        _read();
    }
    private void _read() {
        this.hdr = new MzHeader(this._io, this, _root);
        this.mzHeader2 = this._io.readBytes((hdr().relocationsOfs() - 28));
        relocations = new ArrayList<Relocation>((int) (hdr().qtyRelocations()));
        for (int i = 0; i < hdr().qtyRelocations(); i++) {
            this.relocations.add(new Relocation(this._io, this, _root));
        }
        this.body = this._io.readBytesFull();
    }
    public static class MzHeader extends KaitaiStruct {
        public static MzHeader fromFile(String fileName) throws IOException {
            return new MzHeader(new KaitaiStream(fileName));
        }

        public MzHeader(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public MzHeader(KaitaiStream _io, DosMz _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public MzHeader(KaitaiStream _io, DosMz _parent, DosMz _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(2);
            this.lastPageExtraBytes = this._io.readU2le();
            this.qtyPages = this._io.readU2le();
            this.qtyRelocations = this._io.readU2le();
            this.headerSize = this._io.readU2le();
            this.minAllocation = this._io.readU2le();
            this.maxAllocation = this._io.readU2le();
            this.initialSs = this._io.readU2le();
            this.initialSp = this._io.readU2le();
            this.checksum = this._io.readU2le();
            this.initialIp = this._io.readU2le();
            this.initialCs = this._io.readU2le();
            this.relocationsOfs = this._io.readU2le();
            this.overlayId = this._io.readU2le();
        }
        private byte[] magic;
        private int lastPageExtraBytes;
        private int qtyPages;
        private int qtyRelocations;
        private int headerSize;
        private int minAllocation;
        private int maxAllocation;
        private int initialSs;
        private int initialSp;
        private int checksum;
        private int initialIp;
        private int initialCs;
        private int relocationsOfs;
        private int overlayId;
        private DosMz _root;
        private DosMz _parent;
        public byte[] magic() { return magic; }
        public int lastPageExtraBytes() { return lastPageExtraBytes; }
        public int qtyPages() { return qtyPages; }
        public int qtyRelocations() { return qtyRelocations; }
        public int headerSize() { return headerSize; }
        public int minAllocation() { return minAllocation; }
        public int maxAllocation() { return maxAllocation; }
        public int initialSs() { return initialSs; }
        public int initialSp() { return initialSp; }
        public int checksum() { return checksum; }
        public int initialIp() { return initialIp; }
        public int initialCs() { return initialCs; }
        public int relocationsOfs() { return relocationsOfs; }
        public int overlayId() { return overlayId; }
        public DosMz _root() { return _root; }
        public DosMz _parent() { return _parent; }
    }
    public static class Relocation extends KaitaiStruct {
        public static Relocation fromFile(String fileName) throws IOException {
            return new Relocation(new KaitaiStream(fileName));
        }

        public Relocation(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public Relocation(KaitaiStream _io, DosMz _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public Relocation(KaitaiStream _io, DosMz _parent, DosMz _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.ofs = this._io.readU2le();
            this.seg = this._io.readU2le();
        }
        private int ofs;
        private int seg;
        private DosMz _root;
        private DosMz _parent;
        public int ofs() { return ofs; }
        public int seg() { return seg; }
        public DosMz _root() { return _root; }
        public DosMz _parent() { return _parent; }
    }
    private MzHeader hdr;
    private byte[] mzHeader2;
    private ArrayList<Relocation> relocations;
    private byte[] body;
    private DosMz _root;
    private KaitaiStruct _parent;
    public MzHeader hdr() { return hdr; }
    public byte[] mzHeader2() { return mzHeader2; }
    public ArrayList<Relocation> relocations() { return relocations; }
    public byte[] body() { return body; }
    public DosMz _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

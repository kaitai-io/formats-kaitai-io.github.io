// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.Charset;
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
 * @see <a href="http://www.delorie.com/djgpp/doc/exe/">Source</a>
 */
public class DosMz extends KaitaiStruct {
    public static DosMz fromFile(String fileName) throws IOException {
        return new DosMz(new ByteBufferKaitaiStream(fileName));
    }

    public DosMz(KaitaiStream _io) {
        this(_io, null, null);
    }

    public DosMz(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public DosMz(KaitaiStream _io, KaitaiStruct _parent, DosMz _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header = new ExeHeader(this._io, this, _root);
        this.body = this._io.readBytes(header().lenBody());
    }
    public static class ExeHeader extends KaitaiStruct {
        public static ExeHeader fromFile(String fileName) throws IOException {
            return new ExeHeader(new ByteBufferKaitaiStream(fileName));
        }

        public ExeHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ExeHeader(KaitaiStream _io, DosMz _parent) {
            this(_io, _parent, null);
        }

        public ExeHeader(KaitaiStream _io, DosMz _parent, DosMz _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.mz = new MzHeader(this._io, this, _root);
            this.restOfHeader = this._io.readBytes((mz().lenHeader() - 28));
        }
        private Integer lenBody;
        public Integer lenBody() {
            if (this.lenBody != null)
                return this.lenBody;
            int _tmp = (int) (((mz().lastPageExtraBytes() == 0 ? (mz().numPages() * 512) : (((mz().numPages() - 1) * 512) + mz().lastPageExtraBytes())) - mz().lenHeader()));
            this.lenBody = _tmp;
            return this.lenBody;
        }
        private MzHeader mz;
        private byte[] restOfHeader;
        private DosMz _root;
        private DosMz _parent;
        public MzHeader mz() { return mz; }
        public byte[] restOfHeader() { return restOfHeader; }
        public DosMz _root() { return _root; }
        public DosMz _parent() { return _parent; }
    }
    public static class MzHeader extends KaitaiStruct {
        public static MzHeader fromFile(String fileName) throws IOException {
            return new MzHeader(new ByteBufferKaitaiStream(fileName));
        }

        public MzHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MzHeader(KaitaiStream _io, DosMz.ExeHeader _parent) {
            this(_io, _parent, null);
        }

        public MzHeader(KaitaiStream _io, DosMz.ExeHeader _parent, DosMz _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = new String(this._io.readBytes(2), Charset.forName("ASCII"));
            if (!( ((magic().equals("MZ")) || (magic().equals("ZM"))) )) {
                throw new KaitaiStream.ValidationNotAnyOfError(magic(), _io(), "/types/mz_header/seq/0");
            }
            this.lastPageExtraBytes = this._io.readU2le();
            this.numPages = this._io.readU2le();
            this.numRelocations = this._io.readU2le();
            this.headerSize = this._io.readU2le();
            this.minAllocation = this._io.readU2le();
            this.maxAllocation = this._io.readU2le();
            this.initialSs = this._io.readU2le();
            this.initialSp = this._io.readU2le();
            this.checksum = this._io.readU2le();
            this.initialIp = this._io.readU2le();
            this.initialCs = this._io.readU2le();
            this.ofsRelocations = this._io.readU2le();
            this.overlayId = this._io.readU2le();
        }
        private Integer lenHeader;
        public Integer lenHeader() {
            if (this.lenHeader != null)
                return this.lenHeader;
            int _tmp = (int) ((headerSize() * 16));
            this.lenHeader = _tmp;
            return this.lenHeader;
        }
        private String magic;
        private int lastPageExtraBytes;
        private int numPages;
        private int numRelocations;
        private int headerSize;
        private int minAllocation;
        private int maxAllocation;
        private int initialSs;
        private int initialSp;
        private int checksum;
        private int initialIp;
        private int initialCs;
        private int ofsRelocations;
        private int overlayId;
        private DosMz _root;
        private DosMz.ExeHeader _parent;
        public String magic() { return magic; }
        public int lastPageExtraBytes() { return lastPageExtraBytes; }
        public int numPages() { return numPages; }
        public int numRelocations() { return numRelocations; }
        public int headerSize() { return headerSize; }
        public int minAllocation() { return minAllocation; }
        public int maxAllocation() { return maxAllocation; }
        public int initialSs() { return initialSs; }
        public int initialSp() { return initialSp; }
        public int checksum() { return checksum; }
        public int initialIp() { return initialIp; }
        public int initialCs() { return initialCs; }
        public int ofsRelocations() { return ofsRelocations; }
        public int overlayId() { return overlayId; }
        public DosMz _root() { return _root; }
        public DosMz.ExeHeader _parent() { return _parent; }
    }
    public static class Relocation extends KaitaiStruct {
        public static Relocation fromFile(String fileName) throws IOException {
            return new Relocation(new ByteBufferKaitaiStream(fileName));
        }

        public Relocation(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Relocation(KaitaiStream _io, DosMz _parent) {
            this(_io, _parent, null);
        }

        public Relocation(KaitaiStream _io, DosMz _parent, DosMz _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
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
    private ArrayList<Relocation> relocations;
    public ArrayList<Relocation> relocations() {
        if (this.relocations != null)
            return this.relocations;
        if (header().mz().ofsRelocations() != 0) {
            KaitaiStream io = header()._io();
            long _pos = io.pos();
            io.seek(header().mz().ofsRelocations());
            this.relocations = new ArrayList<Relocation>();
            for (int i = 0; i < header().mz().numRelocations(); i++) {
                this.relocations.add(new Relocation(io, this, _root));
            }
            io.seek(_pos);
        }
        return this.relocations;
    }
    private ExeHeader header;
    private byte[] body;
    private DosMz _root;
    private KaitaiStruct _parent;
    public ExeHeader header() { return header; }
    public byte[] body() { return body; }
    public DosMz _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

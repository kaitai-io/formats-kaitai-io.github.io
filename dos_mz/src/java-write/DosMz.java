// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.List;
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
public class DosMz extends KaitaiStruct.ReadWrite {
    public static DosMz fromFile(String fileName) throws IOException {
        return new DosMz(new ByteBufferKaitaiStream(fileName));
    }
    public DosMz() {
        this(null, null, null);
    }

    public DosMz(KaitaiStream _io) {
        this(_io, null, null);
    }

    public DosMz(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public DosMz(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, DosMz _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.header = new ExeHeader(this._io, this, _root);
        this.header._read();
        this.body = this._io.readBytes(header().lenBody());
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        relocations();
        if (this.relocations != null) {
            for (int i = 0; i < this.relocations.size(); i++) {
                this.relocations.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteRelocations = _enabledRelocations;
        this.header._write_Seq(this._io);
        this._io.writeBytes(this.body);
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        if (this.body.length != header().lenBody())
            throw new ConsistencyError("body", header().lenBody(), this.body.length);
        if (_enabledRelocations) {
            if (header().mz().ofsRelocations() != 0) {
                if (this.relocations.size() != header().mz().numRelocations())
                    throw new ConsistencyError("relocations", header().mz().numRelocations(), this.relocations.size());
                for (int i = 0; i < this.relocations.size(); i++) {
                    if (!Objects.equals(this.relocations.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("relocations", _root(), this.relocations.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.relocations.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("relocations", this, this.relocations.get(((Number) (i)).intValue())._parent());
                }
            }
        }
        _dirty = false;
    }
    public static class ExeHeader extends KaitaiStruct.ReadWrite {
        public static ExeHeader fromFile(String fileName) throws IOException {
            return new ExeHeader(new ByteBufferKaitaiStream(fileName));
        }
        public ExeHeader() {
            this(null, null, null);
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
        }
        public void _read() {
            this.mz = new MzHeader(this._io, this, _root);
            this.mz._read();
            this.restOfHeader = this._io.readBytes(mz().lenHeader() - 28);
            _dirty = false;
        }

        public void _fetchInstances() {
            this.mz._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.mz._write_Seq(this._io);
            this._io.writeBytes(this.restOfHeader);
        }

        public void _check() {
            if (!Objects.equals(this.mz._root(), _root()))
                throw new ConsistencyError("mz", _root(), this.mz._root());
            if (!Objects.equals(this.mz._parent(), this))
                throw new ConsistencyError("mz", this, this.mz._parent());
            if (this.restOfHeader.length != mz().lenHeader() - 28)
                throw new ConsistencyError("rest_of_header", mz().lenHeader() - 28, this.restOfHeader.length);
            _dirty = false;
        }
        private Integer lenBody;
        public Integer lenBody() {
            if (this.lenBody != null)
                return this.lenBody;
            this.lenBody = ((Number) ((mz().lastPageExtraBytes() == 0 ? mz().numPages() * 512 : (mz().numPages() - 1) * 512 + mz().lastPageExtraBytes()) - mz().lenHeader())).intValue();
            return this.lenBody;
        }
        public void _invalidateLenBody() { this.lenBody = null; }
        private MzHeader mz;
        private byte[] restOfHeader;
        private DosMz _root;
        private DosMz _parent;
        public MzHeader mz() { return mz; }
        public void setMz(MzHeader _v) { _dirty = true; mz = _v; }
        public byte[] restOfHeader() { return restOfHeader; }
        public void setRestOfHeader(byte[] _v) { _dirty = true; restOfHeader = _v; }
        public DosMz _root() { return _root; }
        public void set_root(DosMz _v) { _dirty = true; _root = _v; }
        public DosMz _parent() { return _parent; }
        public void set_parent(DosMz _v) { _dirty = true; _parent = _v; }
    }
    public static class MzHeader extends KaitaiStruct.ReadWrite {
        public static MzHeader fromFile(String fileName) throws IOException {
            return new MzHeader(new ByteBufferKaitaiStream(fileName));
        }
        public MzHeader() {
            this(null, null, null);
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
        }
        public void _read() {
            this.magic = new String(this._io.readBytes(2), StandardCharsets.US_ASCII);
            if (!( ((this.magic.equals("MZ")) || (this.magic.equals("ZM"))) )) {
                throw new KaitaiStream.ValidationNotAnyOfError(this.magic, this._io, "/types/mz_header/seq/0");
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
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.magic).getBytes(Charset.forName("ASCII")));
            this._io.writeU2le(this.lastPageExtraBytes);
            this._io.writeU2le(this.numPages);
            this._io.writeU2le(this.numRelocations);
            this._io.writeU2le(this.headerSize);
            this._io.writeU2le(this.minAllocation);
            this._io.writeU2le(this.maxAllocation);
            this._io.writeU2le(this.initialSs);
            this._io.writeU2le(this.initialSp);
            this._io.writeU2le(this.checksum);
            this._io.writeU2le(this.initialIp);
            this._io.writeU2le(this.initialCs);
            this._io.writeU2le(this.ofsRelocations);
            this._io.writeU2le(this.overlayId);
        }

        public void _check() {
            if ((this.magic).getBytes(Charset.forName("ASCII")).length != 2)
                throw new ConsistencyError("magic", 2, (this.magic).getBytes(Charset.forName("ASCII")).length);
            if (!( ((this.magic.equals("MZ")) || (this.magic.equals("ZM"))) )) {
                throw new KaitaiStream.ValidationNotAnyOfError(this.magic, null, "/types/mz_header/seq/0");
            }
            _dirty = false;
        }
        private Integer lenHeader;
        public Integer lenHeader() {
            if (this.lenHeader != null)
                return this.lenHeader;
            this.lenHeader = ((Number) (headerSize() * 16)).intValue();
            return this.lenHeader;
        }
        public void _invalidateLenHeader() { this.lenHeader = null; }
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
        public void setMagic(String _v) { _dirty = true; magic = _v; }
        public int lastPageExtraBytes() { return lastPageExtraBytes; }
        public void setLastPageExtraBytes(int _v) { _dirty = true; lastPageExtraBytes = _v; }
        public int numPages() { return numPages; }
        public void setNumPages(int _v) { _dirty = true; numPages = _v; }
        public int numRelocations() { return numRelocations; }
        public void setNumRelocations(int _v) { _dirty = true; numRelocations = _v; }
        public int headerSize() { return headerSize; }
        public void setHeaderSize(int _v) { _dirty = true; headerSize = _v; }
        public int minAllocation() { return minAllocation; }
        public void setMinAllocation(int _v) { _dirty = true; minAllocation = _v; }
        public int maxAllocation() { return maxAllocation; }
        public void setMaxAllocation(int _v) { _dirty = true; maxAllocation = _v; }
        public int initialSs() { return initialSs; }
        public void setInitialSs(int _v) { _dirty = true; initialSs = _v; }
        public int initialSp() { return initialSp; }
        public void setInitialSp(int _v) { _dirty = true; initialSp = _v; }
        public int checksum() { return checksum; }
        public void setChecksum(int _v) { _dirty = true; checksum = _v; }
        public int initialIp() { return initialIp; }
        public void setInitialIp(int _v) { _dirty = true; initialIp = _v; }
        public int initialCs() { return initialCs; }
        public void setInitialCs(int _v) { _dirty = true; initialCs = _v; }
        public int ofsRelocations() { return ofsRelocations; }
        public void setOfsRelocations(int _v) { _dirty = true; ofsRelocations = _v; }
        public int overlayId() { return overlayId; }
        public void setOverlayId(int _v) { _dirty = true; overlayId = _v; }
        public DosMz _root() { return _root; }
        public void set_root(DosMz _v) { _dirty = true; _root = _v; }
        public DosMz.ExeHeader _parent() { return _parent; }
        public void set_parent(DosMz.ExeHeader _v) { _dirty = true; _parent = _v; }
    }
    public static class Relocation extends KaitaiStruct.ReadWrite {
        public static Relocation fromFile(String fileName) throws IOException {
            return new Relocation(new ByteBufferKaitaiStream(fileName));
        }
        public Relocation() {
            this(null, null, null);
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
        }
        public void _read() {
            this.ofs = this._io.readU2le();
            this.seg = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.ofs);
            this._io.writeU2le(this.seg);
        }

        public void _check() {
            _dirty = false;
        }
        private int ofs;
        private int seg;
        private DosMz _root;
        private DosMz _parent;
        public int ofs() { return ofs; }
        public void setOfs(int _v) { _dirty = true; ofs = _v; }
        public int seg() { return seg; }
        public void setSeg(int _v) { _dirty = true; seg = _v; }
        public DosMz _root() { return _root; }
        public void set_root(DosMz _v) { _dirty = true; _root = _v; }
        public DosMz _parent() { return _parent; }
        public void set_parent(DosMz _v) { _dirty = true; _parent = _v; }
    }
    private List<Relocation> relocations;
    private boolean _shouldWriteRelocations = false;
    private boolean _enabledRelocations = true;
    public List<Relocation> relocations() {
        if (_shouldWriteRelocations)
            _writeRelocations();
        if (this.relocations != null)
            return this.relocations;
        if (!_enabledRelocations)
            return null;
        if (header().mz().ofsRelocations() != 0) {
            KaitaiStream io = header()._io();
            long _pos = io.pos();
            io.seek(header().mz().ofsRelocations());
            this.relocations = new ArrayList<Relocation>();
            for (int i = 0; i < header().mz().numRelocations(); i++) {
                Relocation _t_relocations = new Relocation(io, this, _root);
                try {
                    _t_relocations._read();
                } finally {
                    this.relocations.add(_t_relocations);
                }
            }
            io.seek(_pos);
        }
        return this.relocations;
    }
    public void setRelocations(List<Relocation> _v) { _dirty = true; relocations = _v; }
    public void setRelocations_Enabled(boolean _v) { _dirty = true; _enabledRelocations = _v; }

    private void _writeRelocations() {
        _shouldWriteRelocations = false;
        if (header().mz().ofsRelocations() != 0) {
            KaitaiStream io = header()._io();
            long _pos = io.pos();
            io.seek(header().mz().ofsRelocations());
            for (int i = 0; i < this.relocations.size(); i++) {
                this.relocations.get(((Number) (i)).intValue())._write_Seq(io);
            }
            io.seek(_pos);
        }
    }
    private ExeHeader header;
    private byte[] body;
    private DosMz _root;
    private KaitaiStruct.ReadWrite _parent;
    public ExeHeader header() { return header; }
    public void setHeader(ExeHeader _v) { _dirty = true; header = _v; }
    public byte[] body() { return body; }
    public void setBody(byte[] _v) { _dirty = true; body = _v; }
    public DosMz _root() { return _root; }
    public void set_root(DosMz _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.Arrays;
import java.util.List;


/**
 * TAP files are used by emulators of ZX Spectrum computer (released in
 * 1982 by Sinclair Research). TAP file stores blocks of data as if
 * they are written to magnetic tape, which was used as primary media
 * for ZX Spectrum. Contents of this file can be viewed as a very
 * simple linear filesystem, storing named files with some basic
 * metainformation prepended as a header.
 * @see <a href="https://sinclair.wiki.zxnet.co.uk/wiki/TAP_format">Source</a>
 */
public class ZxSpectrumTap extends KaitaiStruct.ReadWrite {
    public static ZxSpectrumTap fromFile(String fileName) throws IOException {
        return new ZxSpectrumTap(new ByteBufferKaitaiStream(fileName));
    }

    public enum FlagEnum {
        HEADER(0),
        DATA(255);

        private final long id;
        FlagEnum(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, FlagEnum> byId = new HashMap<Long, FlagEnum>(2);
        static {
            for (FlagEnum e : FlagEnum.values())
                byId.put(e.id(), e);
        }
        public static FlagEnum byId(long id) { return byId.get(id); }
    }

    public enum HeaderTypeEnum {
        PROGRAM(0),
        NUM_ARRAY(1),
        CHAR_ARRAY(2),
        BYTES(3);

        private final long id;
        HeaderTypeEnum(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, HeaderTypeEnum> byId = new HashMap<Long, HeaderTypeEnum>(4);
        static {
            for (HeaderTypeEnum e : HeaderTypeEnum.values())
                byId.put(e.id(), e);
        }
        public static HeaderTypeEnum byId(long id) { return byId.get(id); }
    }
    public ZxSpectrumTap() {
        this(null, null, null);
    }

    public ZxSpectrumTap(KaitaiStream _io) {
        this(_io, null, null);
    }

    public ZxSpectrumTap(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public ZxSpectrumTap(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, ZxSpectrumTap _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.blocks = new ArrayList<Block>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                Block _t_blocks = new Block(this._io, this, _root);
                try {
                    _t_blocks._read();
                } finally {
                    this.blocks.add(_t_blocks);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.blocks.size(); i++) {
            this.blocks.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        for (int i = 0; i < this.blocks.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("blocks", 0, this._io.size() - this._io.pos());
            this.blocks.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("blocks", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        for (int i = 0; i < this.blocks.size(); i++) {
            if (!Objects.equals(this.blocks.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("blocks", _root(), this.blocks.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.blocks.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("blocks", this, this.blocks.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class ArrayParams extends KaitaiStruct.ReadWrite {
        public static ArrayParams fromFile(String fileName) throws IOException {
            return new ArrayParams(new ByteBufferKaitaiStream(fileName));
        }
        public ArrayParams() {
            this(null, null, null);
        }

        public ArrayParams(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ArrayParams(KaitaiStream _io, ZxSpectrumTap.Header _parent) {
            this(_io, _parent, null);
        }

        public ArrayParams(KaitaiStream _io, ZxSpectrumTap.Header _parent, ZxSpectrumTap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.reserved = this._io.readU1();
            this.varName = this._io.readU1();
            this.reserved1 = this._io.readBytes(2);
            if (!(Arrays.equals(this.reserved1, new byte[] { 0, -128 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, -128 }, this.reserved1, this._io, "/types/array_params/seq/2");
            }
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.reserved);
            this._io.writeU1(this.varName);
            this._io.writeBytes(this.reserved1);
        }

        public void _check() {
            if (this.reserved1.length != 2)
                throw new ConsistencyError("reserved1", 2, this.reserved1.length);
            if (!(Arrays.equals(this.reserved1, new byte[] { 0, -128 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, -128 }, this.reserved1, null, "/types/array_params/seq/2");
            }
            _dirty = false;
        }
        private int reserved;
        private int varName;
        private byte[] reserved1;
        private ZxSpectrumTap _root;
        private ZxSpectrumTap.Header _parent;
        public int reserved() { return reserved; }
        public void setReserved(int _v) { _dirty = true; reserved = _v; }

        /**
         * Variable name (1..26 meaning A$..Z$ +192)
         */
        public int varName() { return varName; }
        public void setVarName(int _v) { _dirty = true; varName = _v; }
        public byte[] reserved1() { return reserved1; }
        public void setReserved1(byte[] _v) { _dirty = true; reserved1 = _v; }
        public ZxSpectrumTap _root() { return _root; }
        public void set_root(ZxSpectrumTap _v) { _dirty = true; _root = _v; }
        public ZxSpectrumTap.Header _parent() { return _parent; }
        public void set_parent(ZxSpectrumTap.Header _v) { _dirty = true; _parent = _v; }
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

        public Block(KaitaiStream _io, ZxSpectrumTap _parent) {
            this(_io, _parent, null);
        }

        public Block(KaitaiStream _io, ZxSpectrumTap _parent, ZxSpectrumTap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lenBlock = this._io.readU2le();
            this.flag = ZxSpectrumTap.FlagEnum.byId(this._io.readU1());
            if ( ((lenBlock() == 19) && (flag() == ZxSpectrumTap.FlagEnum.HEADER)) ) {
                this.header = new Header(this._io, this, _root);
                this.header._read();
            }
            if (lenBlock() == 19) {
                this.data = this._io.readBytes(header().lenData() + 4);
            }
            if (flag() == ZxSpectrumTap.FlagEnum.DATA) {
                this.headerlessData = this._io.readBytes(lenBlock() - 1);
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if ( ((lenBlock() == 19) && (flag() == ZxSpectrumTap.FlagEnum.HEADER)) ) {
                this.header._fetchInstances();
            }
            if (lenBlock() == 19) {
            }
            if (flag() == ZxSpectrumTap.FlagEnum.DATA) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.lenBlock);
            this._io.writeU1(((Number) (this.flag.id())).intValue());
            if ( ((lenBlock() == 19) && (flag() == ZxSpectrumTap.FlagEnum.HEADER)) ) {
                this.header._write_Seq(this._io);
            }
            if (lenBlock() == 19) {
                this._io.writeBytes(this.data);
            }
            if (flag() == ZxSpectrumTap.FlagEnum.DATA) {
                this._io.writeBytes(this.headerlessData);
            }
        }

        public void _check() {
            if ( ((lenBlock() == 19) && (flag() == ZxSpectrumTap.FlagEnum.HEADER)) ) {
                if (!Objects.equals(this.header._root(), _root()))
                    throw new ConsistencyError("header", _root(), this.header._root());
                if (!Objects.equals(this.header._parent(), this))
                    throw new ConsistencyError("header", this, this.header._parent());
            }
            if (lenBlock() == 19) {
                if (this.data.length != header().lenData() + 4)
                    throw new ConsistencyError("data", header().lenData() + 4, this.data.length);
            }
            if (flag() == ZxSpectrumTap.FlagEnum.DATA) {
                if (this.headerlessData.length != lenBlock() - 1)
                    throw new ConsistencyError("headerless_data", lenBlock() - 1, this.headerlessData.length);
            }
            _dirty = false;
        }
        private int lenBlock;
        private FlagEnum flag;
        private Header header;
        private byte[] data;
        private byte[] headerlessData;
        private ZxSpectrumTap _root;
        private ZxSpectrumTap _parent;
        public int lenBlock() { return lenBlock; }
        public void setLenBlock(int _v) { _dirty = true; lenBlock = _v; }
        public FlagEnum flag() { return flag; }
        public void setFlag(FlagEnum _v) { _dirty = true; flag = _v; }
        public Header header() { return header; }
        public void setHeader(Header _v) { _dirty = true; header = _v; }
        public byte[] data() { return data; }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public byte[] headerlessData() { return headerlessData; }
        public void setHeaderlessData(byte[] _v) { _dirty = true; headerlessData = _v; }
        public ZxSpectrumTap _root() { return _root; }
        public void set_root(ZxSpectrumTap _v) { _dirty = true; _root = _v; }
        public ZxSpectrumTap _parent() { return _parent; }
        public void set_parent(ZxSpectrumTap _v) { _dirty = true; _parent = _v; }
    }
    public static class BytesParams extends KaitaiStruct.ReadWrite {
        public static BytesParams fromFile(String fileName) throws IOException {
            return new BytesParams(new ByteBufferKaitaiStream(fileName));
        }
        public BytesParams() {
            this(null, null, null);
        }

        public BytesParams(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BytesParams(KaitaiStream _io, ZxSpectrumTap.Header _parent) {
            this(_io, _parent, null);
        }

        public BytesParams(KaitaiStream _io, ZxSpectrumTap.Header _parent, ZxSpectrumTap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.startAddress = this._io.readU2le();
            this.reserved = this._io.readBytes(2);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.startAddress);
            this._io.writeBytes(this.reserved);
        }

        public void _check() {
            if (this.reserved.length != 2)
                throw new ConsistencyError("reserved", 2, this.reserved.length);
            _dirty = false;
        }
        private int startAddress;
        private byte[] reserved;
        private ZxSpectrumTap _root;
        private ZxSpectrumTap.Header _parent;
        public int startAddress() { return startAddress; }
        public void setStartAddress(int _v) { _dirty = true; startAddress = _v; }
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
        public ZxSpectrumTap _root() { return _root; }
        public void set_root(ZxSpectrumTap _v) { _dirty = true; _root = _v; }
        public ZxSpectrumTap.Header _parent() { return _parent; }
        public void set_parent(ZxSpectrumTap.Header _v) { _dirty = true; _parent = _v; }
    }
    public static class Header extends KaitaiStruct.ReadWrite {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }
        public Header() {
            this(null, null, null);
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, ZxSpectrumTap.Block _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, ZxSpectrumTap.Block _parent, ZxSpectrumTap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.headerType = ZxSpectrumTap.HeaderTypeEnum.byId(this._io.readU1());
            this.filename = KaitaiStream.bytesStripRight(this._io.readBytes(10), (byte) 32);
            this.lenData = this._io.readU2le();
            {
                HeaderTypeEnum on = headerType();
                if (on != null) {
                    switch (headerType()) {
                    case BYTES: {
                        this.params = new BytesParams(this._io, this, _root);
                        ((BytesParams) (this.params))._read();
                        break;
                    }
                    case CHAR_ARRAY: {
                        this.params = new ArrayParams(this._io, this, _root);
                        ((ArrayParams) (this.params))._read();
                        break;
                    }
                    case NUM_ARRAY: {
                        this.params = new ArrayParams(this._io, this, _root);
                        ((ArrayParams) (this.params))._read();
                        break;
                    }
                    case PROGRAM: {
                        this.params = new ProgramParams(this._io, this, _root);
                        ((ProgramParams) (this.params))._read();
                        break;
                    }
                    }
                }
            }
            this.checksum = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                HeaderTypeEnum on = headerType();
                if (on != null) {
                    switch (headerType()) {
                    case BYTES: {
                        ((BytesParams) (this.params))._fetchInstances();
                        break;
                    }
                    case CHAR_ARRAY: {
                        ((ArrayParams) (this.params))._fetchInstances();
                        break;
                    }
                    case NUM_ARRAY: {
                        ((ArrayParams) (this.params))._fetchInstances();
                        break;
                    }
                    case PROGRAM: {
                        ((ProgramParams) (this.params))._fetchInstances();
                        break;
                    }
                    }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(((Number) (this.headerType.id())).intValue());
            this._io.writeBytesLimit(this.filename, 10, (byte) 32, (byte) 32);
            this._io.writeU2le(this.lenData);
            {
                HeaderTypeEnum on = headerType();
                if (on != null) {
                    switch (headerType()) {
                    case BYTES: {
                        ((BytesParams) (this.params))._write_Seq(this._io);
                        break;
                    }
                    case CHAR_ARRAY: {
                        ((ArrayParams) (this.params))._write_Seq(this._io);
                        break;
                    }
                    case NUM_ARRAY: {
                        ((ArrayParams) (this.params))._write_Seq(this._io);
                        break;
                    }
                    case PROGRAM: {
                        ((ProgramParams) (this.params))._write_Seq(this._io);
                        break;
                    }
                    }
                }
            }
            this._io.writeU1(this.checksum);
        }

        public void _check() {
            if (this.filename.length > 10)
                throw new ConsistencyError("filename", 10, this.filename.length);
            if ( ((this.filename.length != 0) && ((this.filename[((Number) (this.filename.length - 1)).intValue()] & 0xff) == 32)) )
                throw new ConsistencyError("filename", 32, (this.filename[((Number) (this.filename.length - 1)).intValue()] & 0xff));
            {
                HeaderTypeEnum on = headerType();
                if (on != null) {
                    switch (headerType()) {
                    case BYTES: {
                        if (!Objects.equals(((ZxSpectrumTap.BytesParams) (this.params))._root(), _root()))
                            throw new ConsistencyError("params", _root(), ((ZxSpectrumTap.BytesParams) (this.params))._root());
                        if (!Objects.equals(((ZxSpectrumTap.BytesParams) (this.params))._parent(), this))
                            throw new ConsistencyError("params", this, ((ZxSpectrumTap.BytesParams) (this.params))._parent());
                        break;
                    }
                    case CHAR_ARRAY: {
                        if (!Objects.equals(((ZxSpectrumTap.ArrayParams) (this.params))._root(), _root()))
                            throw new ConsistencyError("params", _root(), ((ZxSpectrumTap.ArrayParams) (this.params))._root());
                        if (!Objects.equals(((ZxSpectrumTap.ArrayParams) (this.params))._parent(), this))
                            throw new ConsistencyError("params", this, ((ZxSpectrumTap.ArrayParams) (this.params))._parent());
                        break;
                    }
                    case NUM_ARRAY: {
                        if (!Objects.equals(((ZxSpectrumTap.ArrayParams) (this.params))._root(), _root()))
                            throw new ConsistencyError("params", _root(), ((ZxSpectrumTap.ArrayParams) (this.params))._root());
                        if (!Objects.equals(((ZxSpectrumTap.ArrayParams) (this.params))._parent(), this))
                            throw new ConsistencyError("params", this, ((ZxSpectrumTap.ArrayParams) (this.params))._parent());
                        break;
                    }
                    case PROGRAM: {
                        if (!Objects.equals(((ZxSpectrumTap.ProgramParams) (this.params))._root(), _root()))
                            throw new ConsistencyError("params", _root(), ((ZxSpectrumTap.ProgramParams) (this.params))._root());
                        if (!Objects.equals(((ZxSpectrumTap.ProgramParams) (this.params))._parent(), this))
                            throw new ConsistencyError("params", this, ((ZxSpectrumTap.ProgramParams) (this.params))._parent());
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }
        private HeaderTypeEnum headerType;
        private byte[] filename;
        private int lenData;
        private KaitaiStruct.ReadWrite params;
        private int checksum;
        private ZxSpectrumTap _root;
        private ZxSpectrumTap.Block _parent;
        public HeaderTypeEnum headerType() { return headerType; }
        public void setHeaderType(HeaderTypeEnum _v) { _dirty = true; headerType = _v; }
        public byte[] filename() { return filename; }
        public void setFilename(byte[] _v) { _dirty = true; filename = _v; }
        public int lenData() { return lenData; }
        public void setLenData(int _v) { _dirty = true; lenData = _v; }
        public KaitaiStruct.ReadWrite params() { return params; }
        public void setParams(KaitaiStruct.ReadWrite _v) { _dirty = true; params = _v; }

        /**
         * Bitwise XOR of all bytes including the flag byte
         */
        public int checksum() { return checksum; }
        public void setChecksum(int _v) { _dirty = true; checksum = _v; }
        public ZxSpectrumTap _root() { return _root; }
        public void set_root(ZxSpectrumTap _v) { _dirty = true; _root = _v; }
        public ZxSpectrumTap.Block _parent() { return _parent; }
        public void set_parent(ZxSpectrumTap.Block _v) { _dirty = true; _parent = _v; }
    }
    public static class ProgramParams extends KaitaiStruct.ReadWrite {
        public static ProgramParams fromFile(String fileName) throws IOException {
            return new ProgramParams(new ByteBufferKaitaiStream(fileName));
        }
        public ProgramParams() {
            this(null, null, null);
        }

        public ProgramParams(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ProgramParams(KaitaiStream _io, ZxSpectrumTap.Header _parent) {
            this(_io, _parent, null);
        }

        public ProgramParams(KaitaiStream _io, ZxSpectrumTap.Header _parent, ZxSpectrumTap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.autostartLine = this._io.readU2le();
            this.lenProgram = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.autostartLine);
            this._io.writeU2le(this.lenProgram);
        }

        public void _check() {
            _dirty = false;
        }
        private int autostartLine;
        private int lenProgram;
        private ZxSpectrumTap _root;
        private ZxSpectrumTap.Header _parent;
        public int autostartLine() { return autostartLine; }
        public void setAutostartLine(int _v) { _dirty = true; autostartLine = _v; }
        public int lenProgram() { return lenProgram; }
        public void setLenProgram(int _v) { _dirty = true; lenProgram = _v; }
        public ZxSpectrumTap _root() { return _root; }
        public void set_root(ZxSpectrumTap _v) { _dirty = true; _root = _v; }
        public ZxSpectrumTap.Header _parent() { return _parent; }
        public void set_parent(ZxSpectrumTap.Header _v) { _dirty = true; _parent = _v; }
    }
    private List<Block> blocks;
    private ZxSpectrumTap _root;
    private KaitaiStruct.ReadWrite _parent;
    public List<Block> blocks() { return blocks; }
    public void setBlocks(List<Block> _v) { _dirty = true; blocks = _v; }
    public ZxSpectrumTap _root() { return _root; }
    public void set_root(ZxSpectrumTap _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

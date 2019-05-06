// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;


/**
 * @see <a href="https://faqwiki.zxnet.co.uk/wiki/TAP_format">Source</a>
 */
public class ZxSpectrumTap extends KaitaiStruct {
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

    public ZxSpectrumTap(KaitaiStream _io) {
        this(_io, null, null);
    }

    public ZxSpectrumTap(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public ZxSpectrumTap(KaitaiStream _io, KaitaiStruct _parent, ZxSpectrumTap _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.block = new ArrayList<Block>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.block.add(new Block(this._io, this, _root));
                i++;
            }
        }
    }
    public static class Block extends KaitaiStruct {
        public static Block fromFile(String fileName) throws IOException {
            return new Block(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.lenBlock = this._io.readU2le();
            this.flag = ZxSpectrumTap.FlagEnum.byId(this._io.readU1());
            if ( ((lenBlock() == 19) && (flag() == ZxSpectrumTap.FlagEnum.HEADER)) ) {
                this.header = new Header(this._io, this, _root);
            }
            if (lenBlock() == 19) {
                this.data = this._io.readBytes((header().lenData() + 4));
            }
            if (flag() == ZxSpectrumTap.FlagEnum.DATA) {
                this.headerlessData = this._io.readBytes((lenBlock() - 1));
            }
        }
        private int lenBlock;
        private FlagEnum flag;
        private Header header;
        private byte[] data;
        private byte[] headerlessData;
        private ZxSpectrumTap _root;
        private ZxSpectrumTap _parent;
        public int lenBlock() { return lenBlock; }
        public FlagEnum flag() { return flag; }
        public Header header() { return header; }
        public byte[] data() { return data; }
        public byte[] headerlessData() { return headerlessData; }
        public ZxSpectrumTap _root() { return _root; }
        public ZxSpectrumTap _parent() { return _parent; }
    }
    public static class ProgramParams extends KaitaiStruct {
        public static ProgramParams fromFile(String fileName) throws IOException {
            return new ProgramParams(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.autostartLine = this._io.readU2le();
            this.lenProgram = this._io.readU2le();
        }
        private int autostartLine;
        private int lenProgram;
        private ZxSpectrumTap _root;
        private ZxSpectrumTap.Header _parent;
        public int autostartLine() { return autostartLine; }
        public int lenProgram() { return lenProgram; }
        public ZxSpectrumTap _root() { return _root; }
        public ZxSpectrumTap.Header _parent() { return _parent; }
    }
    public static class BytesParams extends KaitaiStruct {
        public static BytesParams fromFile(String fileName) throws IOException {
            return new BytesParams(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.startAddress = this._io.readU2le();
            this.reserved = this._io.readBytes(2);
        }
        private int startAddress;
        private byte[] reserved;
        private ZxSpectrumTap _root;
        private ZxSpectrumTap.Header _parent;
        public int startAddress() { return startAddress; }
        public byte[] reserved() { return reserved; }
        public ZxSpectrumTap _root() { return _root; }
        public ZxSpectrumTap.Header _parent() { return _parent; }
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.headerType = ZxSpectrumTap.HeaderTypeEnum.byId(this._io.readU1());
            this.filename = KaitaiStream.bytesStripRight(this._io.readBytes(10), (byte) 32);
            this.lenData = this._io.readU2le();
            switch (headerType()) {
            case PROGRAM: {
                this.params = new ProgramParams(this._io, this, _root);
                break;
            }
            case NUM_ARRY: {
                this.params = new ArrayParams(this._io, this, _root);
                break;
            }
            case CHAR_ARRY: {
                this.params = new ArrayParams(this._io, this, _root);
                break;
            }
            case BYTES: {
                this.params = new BytesParams(this._io, this, _root);
                break;
            }
            }
            this.checksum = this._io.readU1();
        }
        private HeaderTypeEnum headerType;
        private byte[] filename;
        private int lenData;
        private KaitaiStruct params;
        private int checksum;
        private ZxSpectrumTap _root;
        private ZxSpectrumTap.Block _parent;
        public HeaderTypeEnum headerType() { return headerType; }
        public byte[] filename() { return filename; }
        public int lenData() { return lenData; }
        public KaitaiStruct params() { return params; }

        /**
         * Bitwise XOR of all bytes including the flag byte
         */
        public int checksum() { return checksum; }
        public ZxSpectrumTap _root() { return _root; }
        public ZxSpectrumTap.Block _parent() { return _parent; }
    }
    public static class ArrayParams extends KaitaiStruct {
        public static ArrayParams fromFile(String fileName) throws IOException {
            return new ArrayParams(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.reserved = this._io.readU1();
            this.varName = this._io.readU1();
            this.reserved1 = this._io.ensureFixedContents(new byte[] { 0, -128 });
        }
        private int reserved;
        private int varName;
        private byte[] reserved1;
        private ZxSpectrumTap _root;
        private ZxSpectrumTap.Header _parent;
        public int reserved() { return reserved; }

        /**
         * Variable name (1..26 meaning A$..Z$ +192)
         */
        public int varName() { return varName; }
        public byte[] reserved1() { return reserved1; }
        public ZxSpectrumTap _root() { return _root; }
        public ZxSpectrumTap.Header _parent() { return _parent; }
    }
    private ArrayList<Block> block;
    private ZxSpectrumTap _root;
    private KaitaiStruct _parent;
    public ArrayList<Block> block() { return block; }
    public ZxSpectrumTap _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

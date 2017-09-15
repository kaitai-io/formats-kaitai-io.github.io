// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.Charset;

public class BlenderBlend extends KaitaiStruct {
    public static BlenderBlend fromFile(String fileName) throws IOException {
        return new BlenderBlend(new ByteBufferKaitaiStream(fileName));
    }

    public enum PtrSize {
        BITS_64(45),
        BITS_32(95);

        private final long id;
        PtrSize(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, PtrSize> byId = new HashMap<Long, PtrSize>(2);
        static {
            for (PtrSize e : PtrSize.values())
                byId.put(e.id(), e);
        }
        public static PtrSize byId(long id) { return byId.get(id); }
    }

    public enum Endian {
        BE(86),
        LE(118);

        private final long id;
        Endian(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Endian> byId = new HashMap<Long, Endian>(2);
        static {
            for (Endian e : Endian.values())
                byId.put(e.id(), e);
        }
        public static Endian byId(long id) { return byId.get(id); }
    }

    public BlenderBlend(KaitaiStream _io) {
        this(_io, null, null);
    }

    public BlenderBlend(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public BlenderBlend(KaitaiStream _io, KaitaiStruct _parent, BlenderBlend _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.hdr = new Header(this._io, this, _root);
        this.blocks = new ArrayList<FileBlock>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.blocks.add(new FileBlock(this._io, this, _root));
                i++;
            }
        }
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, BlenderBlend _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, BlenderBlend _parent, BlenderBlend _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.ensureFixedContents(new byte[] { 66, 76, 69, 78, 68, 69, 82 });
            this.ptrSizeId = BlenderBlend.PtrSize.byId(this._io.readU1());
            this.endian = BlenderBlend.Endian.byId(this._io.readU1());
            this.version = new String(this._io.readBytes(3), Charset.forName("ASCII"));
        }
        private Byte psize;

        /**
         * Number of bytes that a pointer occupies
         */
        public Byte psize() {
            if (this.psize != null)
                return this.psize;
            byte _tmp = (byte) ((ptrSizeId() == BlenderBlend.PtrSize.BITS_64 ? 8 : 4));
            this.psize = _tmp;
            return this.psize;
        }
        private byte[] magic;
        private PtrSize ptrSizeId;
        private Endian endian;
        private String version;
        private BlenderBlend _root;
        private BlenderBlend _parent;
        public byte[] magic() { return magic; }

        /**
         * Size of a pointer; all pointers in the file are stored in this format
         */
        public PtrSize ptrSizeId() { return ptrSizeId; }

        /**
         * Type of byte ordering used
         */
        public Endian endian() { return endian; }

        /**
         * Blender version used to save this file
         */
        public String version() { return version; }
        public BlenderBlend _root() { return _root; }
        public BlenderBlend _parent() { return _parent; }
    }
    public static class FileBlock extends KaitaiStruct {
        public static FileBlock fromFile(String fileName) throws IOException {
            return new FileBlock(new ByteBufferKaitaiStream(fileName));
        }

        public FileBlock(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FileBlock(KaitaiStream _io, BlenderBlend _parent) {
            this(_io, _parent, null);
        }

        public FileBlock(KaitaiStream _io, BlenderBlend _parent, BlenderBlend _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.code = new String(this._io.readBytes(4), Charset.forName("ASCII"));
            this.size = this._io.readU4le();
            this.memAddr = this._io.readBytes(_root.hdr().psize());
            this.sdnaIndex = this._io.readU4le();
            this.count = this._io.readU4le();
            this.body = this._io.readBytes(size());
        }
        private String code;
        private long size;
        private byte[] memAddr;
        private long sdnaIndex;
        private long count;
        private byte[] body;
        private BlenderBlend _root;
        private BlenderBlend _parent;

        /**
         * Identifier of the file block
         */
        public String code() { return code; }

        /**
         * Total length of the data after the header of file block
         */
        public long size() { return size; }

        /**
         * Memory address the structure was located when written to disk
         */
        public byte[] memAddr() { return memAddr; }

        /**
         * Index of the SDNA structure
         */
        public long sdnaIndex() { return sdnaIndex; }

        /**
         * Number of structure located in this file-block
         */
        public long count() { return count; }
        public byte[] body() { return body; }
        public BlenderBlend _root() { return _root; }
        public BlenderBlend _parent() { return _parent; }
    }
    private Header hdr;
    private ArrayList<FileBlock> blocks;
    private BlenderBlend _root;
    private KaitaiStruct _parent;
    public Header hdr() { return hdr; }
    public ArrayList<FileBlock> blocks() { return blocks; }
    public BlenderBlend _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

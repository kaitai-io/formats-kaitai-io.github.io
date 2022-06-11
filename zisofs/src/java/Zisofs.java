// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;


/**
 * zisofs is a compression format for files on ISO9660 file system. It has
 * limited support across operating systems, mainly Linux kernel. Typically a
 * directory tree is first preprocessed by mkzftree (from the zisofs-tools
 * package before being turned into an ISO9660 image by mkisofs, genisoimage
 * or similar tool. The data is zlib compressed.
 * 
 * The specification here describes the structure of a file that has been
 * preprocessed by mkzftree, not of a full ISO9660 ziso. Data is not
 * decompressed, as blocks with length 0 have a special meaning. Decompression
 * and deconstruction of this data should be done outside of Kaitai Struct.
 * @see <a href="https://web.archive.org/web/20200612093441/https://dev.lovelyhq.com/libburnia/web/-/wikis/zisofs">Source</a>
 */
public class Zisofs extends KaitaiStruct {
    public static Zisofs fromFile(String fileName) throws IOException {
        return new Zisofs(new ByteBufferKaitaiStream(fileName));
    }

    public Zisofs(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Zisofs(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Zisofs(KaitaiStream _io, KaitaiStruct _parent, Zisofs _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this._raw_header = this._io.readBytes(16);
        KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(_raw_header);
        this.header = new Header(_io__raw_header, this, _root);
        blockPointers = new ArrayList<Long>(((Number) ((header().numBlocks() + 1))).intValue());
        for (int i = 0; i < (header().numBlocks() + 1); i++) {
            this.blockPointers.add(this._io.readU4le());
        }
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, Zisofs _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, Zisofs _parent, Zisofs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(8);
            if (!(Arrays.equals(magic(), new byte[] { 55, -28, 83, -106, -55, -37, -42, 7 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 55, -28, 83, -106, -55, -37, -42, 7 }, magic(), _io(), "/types/header/seq/0");
            }
            this.uncompressedSize = this._io.readU4le();
            this.lenHeader = this._io.readU1();
            if (!(lenHeader() == 4)) {
                throw new KaitaiStream.ValidationNotEqualError(4, lenHeader(), _io(), "/types/header/seq/2");
            }
            this.blockSizeLog2 = this._io.readU1();
            if (!( ((blockSizeLog2() == 15) || (blockSizeLog2() == 16) || (blockSizeLog2() == 17)) )) {
                throw new KaitaiStream.ValidationNotAnyOfError(blockSizeLog2(), _io(), "/types/header/seq/3");
            }
            this.reserved = this._io.readBytes(2);
            if (!(Arrays.equals(reserved(), new byte[] { 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, reserved(), _io(), "/types/header/seq/4");
            }
        }
        private Integer blockSize;
        public Integer blockSize() {
            if (this.blockSize != null)
                return this.blockSize;
            int _tmp = (int) ((1 << blockSizeLog2()));
            this.blockSize = _tmp;
            return this.blockSize;
        }
        private Integer numBlocks;

        /**
         * ceil(uncompressed_size / block_size)
         */
        public Integer numBlocks() {
            if (this.numBlocks != null)
                return this.numBlocks;
            int _tmp = (int) (((uncompressedSize() / blockSize()) + (KaitaiStream.mod(uncompressedSize(), blockSize()) != 0 ? 1 : 0)));
            this.numBlocks = _tmp;
            return this.numBlocks;
        }
        private byte[] magic;
        private long uncompressedSize;
        private int lenHeader;
        private int blockSizeLog2;
        private byte[] reserved;
        private Zisofs _root;
        private Zisofs _parent;
        public byte[] magic() { return magic; }

        /**
         * Size of the original uncompressed file
         */
        public long uncompressedSize() { return uncompressedSize; }

        /**
         * header_size >> 2 (currently 4)
         */
        public int lenHeader() { return lenHeader; }
        public int blockSizeLog2() { return blockSizeLog2; }
        public byte[] reserved() { return reserved; }
        public Zisofs _root() { return _root; }
        public Zisofs _parent() { return _parent; }
    }
    public static class Block extends KaitaiStruct {

        public Block(KaitaiStream _io, long ofsStart, long ofsEnd) {
            this(_io, null, null, ofsStart, ofsEnd);
        }

        public Block(KaitaiStream _io, Zisofs _parent, long ofsStart, long ofsEnd) {
            this(_io, _parent, null, ofsStart, ofsEnd);
        }

        public Block(KaitaiStream _io, Zisofs _parent, Zisofs _root, long ofsStart, long ofsEnd) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.ofsStart = ofsStart;
            this.ofsEnd = ofsEnd;
            _read();
        }
        private void _read() {
        }
        private Integer lenData;
        public Integer lenData() {
            if (this.lenData != null)
                return this.lenData;
            int _tmp = (int) ((ofsEnd() - ofsStart()));
            this.lenData = _tmp;
            return this.lenData;
        }
        private byte[] data;
        public byte[] data() {
            if (this.data != null)
                return this.data;
            KaitaiStream io = _root._io();
            long _pos = io.pos();
            io.seek(ofsStart());
            this.data = io.readBytes(lenData());
            io.seek(_pos);
            return this.data;
        }
        private long ofsStart;
        private long ofsEnd;
        private Zisofs _root;
        private Zisofs _parent;
        public long ofsStart() { return ofsStart; }
        public long ofsEnd() { return ofsEnd; }
        public Zisofs _root() { return _root; }
        public Zisofs _parent() { return _parent; }
    }
    private ArrayList<Block> blocks;
    public ArrayList<Block> blocks() {
        if (this.blocks != null)
            return this.blocks;
        blocks = new ArrayList<Block>(((Number) (header().numBlocks())).intValue());
        for (int i = 0; i < header().numBlocks(); i++) {
            this.blocks.add(new Block(this._io, this, _root, blockPointers().get((int) i), blockPointers().get((int) (i + 1))));
        }
        return this.blocks;
    }
    private Header header;
    private ArrayList<Long> blockPointers;
    private Zisofs _root;
    private KaitaiStruct _parent;
    private byte[] _raw_header;
    public Header header() { return header; }

    /**
     * The final pointer (`block_pointers[header.num_blocks]`) indicates the end
     * of the last block. Typically this is also the end of the file data.
     */
    public ArrayList<Long> blockPointers() { return blockPointers; }
    public Zisofs _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_header() { return _raw_header; }
}

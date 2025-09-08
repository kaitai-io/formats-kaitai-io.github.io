// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.Arrays;
import java.util.List;


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
public class Zisofs extends KaitaiStruct.ReadWrite {
    public static Zisofs fromFile(String fileName) throws IOException {
        return new Zisofs(new ByteBufferKaitaiStream(fileName));
    }
    public Zisofs() {
        this(null, null, null);
    }

    public Zisofs(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Zisofs(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Zisofs(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Zisofs _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this._raw_header = this._io.readBytes(16);
        KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(this._raw_header);
        this.header = new Header(_io__raw_header, this, _root);
        this.header._read();
        this.blockPointers = new ArrayList<Long>();
        for (int i = 0; i < header().numBlocks() + 1; i++) {
            this.blockPointers.add(this._io.readU4le());
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        for (int i = 0; i < this.blockPointers.size(); i++) {
        }
        blocks();
        if (this.blocks != null) {
            for (int i = 0; i < this.blocks.size(); i++) {
                this.blocks.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteBlocks = _enabledBlocks;
        final KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(16);
        this._io.addChildStream(_io__raw_header);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (16));
            final Zisofs _this = this;
            _io__raw_header.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_header = _io__raw_header.toByteArray();
                    if (_this._raw_header.length != 16)
                        throw new ConsistencyError("raw(header)", 16, _this._raw_header.length);
                    parent.writeBytes(_this._raw_header);
                }
            });
        }
        this.header._write_Seq(_io__raw_header);
        for (int i = 0; i < this.blockPointers.size(); i++) {
            this._io.writeU4le(this.blockPointers.get(((Number) (i)).intValue()));
        }
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        if (this.blockPointers.size() != header().numBlocks() + 1)
            throw new ConsistencyError("block_pointers", header().numBlocks() + 1, this.blockPointers.size());
        for (int i = 0; i < this.blockPointers.size(); i++) {
        }
        if (_enabledBlocks) {
            if (this.blocks.size() != header().numBlocks())
                throw new ConsistencyError("blocks", header().numBlocks(), this.blocks.size());
            for (int i = 0; i < this.blocks.size(); i++) {
                if (!Objects.equals(this.blocks.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("blocks", _root(), this.blocks.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.blocks.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("blocks", this, this.blocks.get(((Number) (i)).intValue())._parent());
                if (this.blocks.get(((Number) (i)).intValue()).ofsStart() != blockPointers().get(((Number) (i)).intValue()))
                    throw new ConsistencyError("blocks", blockPointers().get(((Number) (i)).intValue()), this.blocks.get(((Number) (i)).intValue()).ofsStart());
                if (this.blocks.get(((Number) (i)).intValue()).ofsEnd() != blockPointers().get(((Number) (i + 1)).intValue()))
                    throw new ConsistencyError("blocks", blockPointers().get(((Number) (i + 1)).intValue()), this.blocks.get(((Number) (i)).intValue()).ofsEnd());
            }
        }
        _dirty = false;
    }
    public static class Block extends KaitaiStruct.ReadWrite {
        public Block(long ofsStart, long ofsEnd) {
            this(null, null, null, ofsStart, ofsEnd);
        }

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
        }
        public void _read() {
            _dirty = false;
        }

        public void _fetchInstances() {
            data();
            if (this.data != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteData = _enabledData;
        }

        public void _check() {
            if (_enabledData) {
                if (this.data.length != lenData())
                    throw new ConsistencyError("data", lenData(), this.data.length);
            }
            _dirty = false;
        }
        private byte[] data;
        private boolean _shouldWriteData = false;
        private boolean _enabledData = true;
        public byte[] data() {
            if (_shouldWriteData)
                _writeData();
            if (this.data != null)
                return this.data;
            if (!_enabledData)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofsStart());
            this.data = io.readBytes(lenData());
            io.seek(_pos);
            return this.data;
        }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public void setData_Enabled(boolean _v) { _dirty = true; _enabledData = _v; }

        private void _writeData() {
            _shouldWriteData = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofsStart());
            io.writeBytes(this.data);
            io.seek(_pos);
        }
        private Integer lenData;
        public Integer lenData() {
            if (this.lenData != null)
                return this.lenData;
            this.lenData = ((Number) (ofsEnd() - ofsStart())).intValue();
            return this.lenData;
        }
        public void _invalidateLenData() { this.lenData = null; }
        private long ofsStart;
        private long ofsEnd;
        private Zisofs _root;
        private Zisofs _parent;
        public long ofsStart() { return ofsStart; }
        public void setOfsStart(long _v) { _dirty = true; ofsStart = _v; }
        public long ofsEnd() { return ofsEnd; }
        public void setOfsEnd(long _v) { _dirty = true; ofsEnd = _v; }
        public Zisofs _root() { return _root; }
        public void set_root(Zisofs _v) { _dirty = true; _root = _v; }
        public Zisofs _parent() { return _parent; }
        public void set_parent(Zisofs _v) { _dirty = true; _parent = _v; }
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

        public Header(KaitaiStream _io, Zisofs _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, Zisofs _parent, Zisofs _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(8);
            if (!(Arrays.equals(this.magic, new byte[] { 55, -28, 83, -106, -55, -37, -42, 7 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 55, -28, 83, -106, -55, -37, -42, 7 }, this.magic, this._io, "/types/header/seq/0");
            }
            this.uncompressedSize = this._io.readU4le();
            this.lenHeader = this._io.readU1();
            if (!(this.lenHeader == 4)) {
                throw new KaitaiStream.ValidationNotEqualError(4, this.lenHeader, this._io, "/types/header/seq/2");
            }
            this.blockSizeLog2 = this._io.readU1();
            if (!( ((this.blockSizeLog2 == 15) || (this.blockSizeLog2 == 16) || (this.blockSizeLog2 == 17)) )) {
                throw new KaitaiStream.ValidationNotAnyOfError(this.blockSizeLog2, this._io, "/types/header/seq/3");
            }
            this.reserved = this._io.readBytes(2);
            if (!(Arrays.equals(this.reserved, new byte[] { 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, this.reserved, this._io, "/types/header/seq/4");
            }
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU4le(this.uncompressedSize);
            this._io.writeU1(this.lenHeader);
            this._io.writeU1(this.blockSizeLog2);
            this._io.writeBytes(this.reserved);
        }

        public void _check() {
            if (this.magic.length != 8)
                throw new ConsistencyError("magic", 8, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 55, -28, 83, -106, -55, -37, -42, 7 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 55, -28, 83, -106, -55, -37, -42, 7 }, this.magic, null, "/types/header/seq/0");
            }
            if (!(this.lenHeader == 4)) {
                throw new KaitaiStream.ValidationNotEqualError(4, this.lenHeader, null, "/types/header/seq/2");
            }
            if (!( ((this.blockSizeLog2 == 15) || (this.blockSizeLog2 == 16) || (this.blockSizeLog2 == 17)) )) {
                throw new KaitaiStream.ValidationNotAnyOfError(this.blockSizeLog2, null, "/types/header/seq/3");
            }
            if (this.reserved.length != 2)
                throw new ConsistencyError("reserved", 2, this.reserved.length);
            if (!(Arrays.equals(this.reserved, new byte[] { 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, this.reserved, null, "/types/header/seq/4");
            }
            _dirty = false;
        }
        private Integer blockSize;
        public Integer blockSize() {
            if (this.blockSize != null)
                return this.blockSize;
            this.blockSize = ((Number) (1 << blockSizeLog2())).intValue();
            return this.blockSize;
        }
        public void _invalidateBlockSize() { this.blockSize = null; }
        private Integer numBlocks;

        /**
         * ceil(uncompressed_size / block_size)
         */
        public Integer numBlocks() {
            if (this.numBlocks != null)
                return this.numBlocks;
            this.numBlocks = ((Number) (uncompressedSize() / blockSize() + (KaitaiStream.mod(uncompressedSize(), blockSize()) != 0 ? 1 : 0))).intValue();
            return this.numBlocks;
        }
        public void _invalidateNumBlocks() { this.numBlocks = null; }
        private byte[] magic;
        private long uncompressedSize;
        private int lenHeader;
        private int blockSizeLog2;
        private byte[] reserved;
        private Zisofs _root;
        private Zisofs _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }

        /**
         * Size of the original uncompressed file
         */
        public long uncompressedSize() { return uncompressedSize; }
        public void setUncompressedSize(long _v) { _dirty = true; uncompressedSize = _v; }

        /**
         * header_size >> 2 (currently 4)
         */
        public int lenHeader() { return lenHeader; }
        public void setLenHeader(int _v) { _dirty = true; lenHeader = _v; }
        public int blockSizeLog2() { return blockSizeLog2; }
        public void setBlockSizeLog2(int _v) { _dirty = true; blockSizeLog2 = _v; }
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
        public Zisofs _root() { return _root; }
        public void set_root(Zisofs _v) { _dirty = true; _root = _v; }
        public Zisofs _parent() { return _parent; }
        public void set_parent(Zisofs _v) { _dirty = true; _parent = _v; }
    }
    private List<Block> blocks;
    private boolean _shouldWriteBlocks = false;
    private boolean _enabledBlocks = true;
    public List<Block> blocks() {
        if (_shouldWriteBlocks)
            _writeBlocks();
        if (this.blocks != null)
            return this.blocks;
        if (!_enabledBlocks)
            return null;
        this.blocks = new ArrayList<Block>();
        for (int i = 0; i < header().numBlocks(); i++) {
            Block _t_blocks = new Block(this._io, this, _root, blockPointers().get(((Number) (i)).intValue()), blockPointers().get(((Number) (i + 1)).intValue()));
            try {
                _t_blocks._read();
            } finally {
                this.blocks.add(_t_blocks);
            }
        }
        return this.blocks;
    }
    public void setBlocks(List<Block> _v) { _dirty = true; blocks = _v; }
    public void setBlocks_Enabled(boolean _v) { _dirty = true; _enabledBlocks = _v; }

    private void _writeBlocks() {
        _shouldWriteBlocks = false;
        for (int i = 0; i < this.blocks.size(); i++) {
            this.blocks.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }
    private Header header;
    private List<Long> blockPointers;
    private Zisofs _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_header;
    public Header header() { return header; }
    public void setHeader(Header _v) { _dirty = true; header = _v; }

    /**
     * The final pointer (`block_pointers[header.num_blocks]`) indicates the end
     * of the last block. Typically this is also the end of the file data.
     */
    public List<Long> blockPointers() { return blockPointers; }
    public void setBlockPointers(List<Long> _v) { _dirty = true; blockPointers = _v; }
    public Zisofs _root() { return _root; }
    public void set_root(Zisofs _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_header() { return _raw_header; }
    public void set_raw_Header(byte[] _v) { _dirty = true; _raw_header = _v; }
}

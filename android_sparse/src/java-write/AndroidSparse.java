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
 * The Android sparse format is a format to more efficiently store files
 * for for example firmware updates to save on bandwidth. Files in sparse
 * format first have to be converted back to their original format.
 * 
 * A tool to create images for testing can be found in the Android source code tree:
 * 
 * <https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse> - `img2simg.c`
 * 
 * Note: this is not the same as the Android sparse data image format.
 * @see <a href="https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_format.h">Source</a>
 * @see <a href="https://web.archive.org/web/20220322054458/https://source.android.com/devices/bootloader/images#sparse-image-format">Source</a>
 */
public class AndroidSparse extends KaitaiStruct.ReadWrite {
    public static AndroidSparse fromFile(String fileName) throws IOException {
        return new AndroidSparse(new ByteBufferKaitaiStream(fileName));
    }

    public enum ChunkTypes {
        RAW(51905),
        FILL(51906),
        DONT_CARE(51907),
        CRC32(51908);

        private final long id;
        ChunkTypes(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ChunkTypes> byId = new HashMap<Long, ChunkTypes>(4);
        static {
            for (ChunkTypes e : ChunkTypes.values())
                byId.put(e.id(), e);
        }
        public static ChunkTypes byId(long id) { return byId.get(id); }
    }
    public AndroidSparse() {
        this(null, null, null);
    }

    public AndroidSparse(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AndroidSparse(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public AndroidSparse(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, AndroidSparse _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.headerPrefix = new FileHeaderPrefix(this._io, this, _root);
        this.headerPrefix._read();
        this._raw_header = this._io.readBytes(headerPrefix().lenHeader() - 10);
        KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(this._raw_header);
        this.header = new FileHeader(_io__raw_header, this, _root);
        this.header._read();
        this.chunks = new ArrayList<Chunk>();
        for (int i = 0; i < header().numChunks(); i++) {
            Chunk _t_chunks = new Chunk(this._io, this, _root);
            try {
                _t_chunks._read();
            } finally {
                this.chunks.add(_t_chunks);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.headerPrefix._fetchInstances();
        this.header._fetchInstances();
        for (int i = 0; i < this.chunks.size(); i++) {
            this.chunks.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.headerPrefix._write_Seq(this._io);
        final KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(headerPrefix().lenHeader() - 10);
        this._io.addChildStream(_io__raw_header);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (headerPrefix().lenHeader() - 10));
            final AndroidSparse _this = this;
            _io__raw_header.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_header = _io__raw_header.toByteArray();
                    if (_this._raw_header.length != headerPrefix().lenHeader() - 10)
                        throw new ConsistencyError("raw(header)", headerPrefix().lenHeader() - 10, _this._raw_header.length);
                    parent.writeBytes(_this._raw_header);
                }
            });
        }
        this.header._write_Seq(_io__raw_header);
        for (int i = 0; i < this.chunks.size(); i++) {
            this.chunks.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (!Objects.equals(this.headerPrefix._root(), _root()))
            throw new ConsistencyError("header_prefix", _root(), this.headerPrefix._root());
        if (!Objects.equals(this.headerPrefix._parent(), this))
            throw new ConsistencyError("header_prefix", this, this.headerPrefix._parent());
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        if (this.chunks.size() != header().numChunks())
            throw new ConsistencyError("chunks", header().numChunks(), this.chunks.size());
        for (int i = 0; i < this.chunks.size(); i++) {
            if (!Objects.equals(this.chunks.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("chunks", _root(), this.chunks.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.chunks.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("chunks", this, this.chunks.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class Chunk extends KaitaiStruct.ReadWrite {
        public static Chunk fromFile(String fileName) throws IOException {
            return new Chunk(new ByteBufferKaitaiStream(fileName));
        }
        public Chunk() {
            this(null, null, null);
        }

        public Chunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Chunk(KaitaiStream _io, AndroidSparse _parent) {
            this(_io, _parent, null);
        }

        public Chunk(KaitaiStream _io, AndroidSparse _parent, AndroidSparse _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this._raw_header = this._io.readBytes(_root().header().lenChunkHeader());
            KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(this._raw_header);
            this.header = new ChunkHeader(_io__raw_header, this, _root);
            this.header._read();
            {
                ChunkTypes on = header().chunkType();
                if (on != null) {
                    switch (header().chunkType()) {
                    case CRC32: {
                        this.body = ((Object) (this._io.readU4le()));
                        break;
                    }
                    default: {
                        this.body = this._io.readBytes(header().lenBody());
                        break;
                    }
                    }
                } else {
                    this.body = this._io.readBytes(header().lenBody());
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
            {
                ChunkTypes on = header().chunkType();
                if (on != null) {
                    switch (header().chunkType()) {
                    case CRC32: {
                        break;
                    }
                    default: {
                        break;
                    }
                    }
                } else {
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            final KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(_root().header().lenChunkHeader());
            this._io.addChildStream(_io__raw_header);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (_root().header().lenChunkHeader()));
                final Chunk _this = this;
                _io__raw_header.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_header = _io__raw_header.toByteArray();
                        if (_this._raw_header.length != _root().header().lenChunkHeader())
                            throw new ConsistencyError("raw(header)", _root().header().lenChunkHeader(), _this._raw_header.length);
                        parent.writeBytes(_this._raw_header);
                    }
                });
            }
            this.header._write_Seq(_io__raw_header);
            {
                ChunkTypes on = header().chunkType();
                if (on != null) {
                    switch (header().chunkType()) {
                    case CRC32: {
                        this._io.writeU4le(((Number) (this.body)).longValue());
                        break;
                    }
                    default: {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                        break;
                    }
                    }
                } else {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                }
            }
        }

        public void _check() {
            if (!Objects.equals(this.header._root(), _root()))
                throw new ConsistencyError("header", _root(), this.header._root());
            if (!Objects.equals(this.header._parent(), this))
                throw new ConsistencyError("header", this, this.header._parent());
            {
                ChunkTypes on = header().chunkType();
                if (on != null) {
                    switch (header().chunkType()) {
                    case CRC32: {
                        break;
                    }
                    default: {
                        if (((byte[]) (this.body)).length != header().lenBody())
                            throw new ConsistencyError("body", header().lenBody(), ((byte[]) (this.body)).length);
                        break;
                    }
                    }
                } else {
                    if (((byte[]) (this.body)).length != header().lenBody())
                        throw new ConsistencyError("body", header().lenBody(), ((byte[]) (this.body)).length);
                }
            }
            _dirty = false;
        }
        public static class ChunkHeader extends KaitaiStruct.ReadWrite {
            public static ChunkHeader fromFile(String fileName) throws IOException {
                return new ChunkHeader(new ByteBufferKaitaiStream(fileName));
            }
            public ChunkHeader() {
                this(null, null, null);
            }

            public ChunkHeader(KaitaiStream _io) {
                this(_io, null, null);
            }

            public ChunkHeader(KaitaiStream _io, AndroidSparse.Chunk _parent) {
                this(_io, _parent, null);
            }

            public ChunkHeader(KaitaiStream _io, AndroidSparse.Chunk _parent, AndroidSparse _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.chunkType = AndroidSparse.ChunkTypes.byId(this._io.readU2le());
                this.reserved1 = this._io.readU2le();
                this.numBodyBlocks = this._io.readU4le();
                this.lenChunk = this._io.readU4le();
                if (!(this.lenChunk == (lenBodyExpected() != -1 ? _root().header().lenChunkHeader() + lenBodyExpected() : lenChunk()))) {
                    throw new KaitaiStream.ValidationNotEqualError((lenBodyExpected() != -1 ? _root().header().lenChunkHeader() + lenBodyExpected() : lenChunk()), this.lenChunk, this._io, "/types/chunk/types/chunk_header/seq/3");
                }
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU2le(((Number) (this.chunkType.id())).intValue());
                this._io.writeU2le(this.reserved1);
                this._io.writeU4le(this.numBodyBlocks);
                this._io.writeU4le(this.lenChunk);
            }

            public void _check() {
                if (!(this.lenChunk == (lenBodyExpected() != -1 ? _root().header().lenChunkHeader() + lenBodyExpected() : lenChunk()))) {
                    throw new KaitaiStream.ValidationNotEqualError((lenBodyExpected() != -1 ? _root().header().lenChunkHeader() + lenBodyExpected() : lenChunk()), this.lenChunk, null, "/types/chunk/types/chunk_header/seq/3");
                }
                _dirty = false;
            }
            private Integer lenBody;
            public Integer lenBody() {
                if (this.lenBody != null)
                    return this.lenBody;
                this.lenBody = ((Number) (lenChunk() - _root().header().lenChunkHeader())).intValue();
                return this.lenBody;
            }
            public void _invalidateLenBody() { this.lenBody = null; }
            private Integer lenBodyExpected;

            /**
             * @see <a href="https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#184">Source</a>
             * @see <a href="https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#215">Source</a>
             * @see <a href="https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#249">Source</a>
             * @see <a href="https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#270">Source</a>
             */
            public Integer lenBodyExpected() {
                if (this.lenBodyExpected != null)
                    return this.lenBodyExpected;
                this.lenBodyExpected = ((Number) ((chunkType() == AndroidSparse.ChunkTypes.RAW ? _root().header().blockSize() * numBodyBlocks() : (chunkType() == AndroidSparse.ChunkTypes.FILL ? 4 : (chunkType() == AndroidSparse.ChunkTypes.DONT_CARE ? 0 : (chunkType() == AndroidSparse.ChunkTypes.CRC32 ? 4 : -1)))))).intValue();
                return this.lenBodyExpected;
            }
            public void _invalidateLenBodyExpected() { this.lenBodyExpected = null; }
            private ChunkTypes chunkType;
            private int reserved1;
            private long numBodyBlocks;
            private long lenChunk;
            private AndroidSparse _root;
            private AndroidSparse.Chunk _parent;
            public ChunkTypes chunkType() { return chunkType; }
            public void setChunkType(ChunkTypes _v) { _dirty = true; chunkType = _v; }
            public int reserved1() { return reserved1; }
            public void setReserved1(int _v) { _dirty = true; reserved1 = _v; }

            /**
             * size of the chunk body in blocks in output image
             */
            public long numBodyBlocks() { return numBodyBlocks; }
            public void setNumBodyBlocks(long _v) { _dirty = true; numBodyBlocks = _v; }

            /**
             * in bytes of chunk input file including chunk header and data
             */
            public long lenChunk() { return lenChunk; }
            public void setLenChunk(long _v) { _dirty = true; lenChunk = _v; }
            public AndroidSparse _root() { return _root; }
            public void set_root(AndroidSparse _v) { _dirty = true; _root = _v; }
            public AndroidSparse.Chunk _parent() { return _parent; }
            public void set_parent(AndroidSparse.Chunk _v) { _dirty = true; _parent = _v; }
        }
        private ChunkHeader header;
        private Object body;
        private AndroidSparse _root;
        private AndroidSparse _parent;
        private byte[] _raw_header;
        public ChunkHeader header() { return header; }
        public void setHeader(ChunkHeader _v) { _dirty = true; header = _v; }
        public Object body() { return body; }
        public void setBody(Object _v) { _dirty = true; body = _v; }
        public AndroidSparse _root() { return _root; }
        public void set_root(AndroidSparse _v) { _dirty = true; _root = _v; }
        public AndroidSparse _parent() { return _parent; }
        public void set_parent(AndroidSparse _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_header() { return _raw_header; }
        public void set_raw_Header(byte[] _v) { _dirty = true; _raw_header = _v; }
    }
    public static class FileHeader extends KaitaiStruct.ReadWrite {
        public static FileHeader fromFile(String fileName) throws IOException {
            return new FileHeader(new ByteBufferKaitaiStream(fileName));
        }
        public FileHeader() {
            this(null, null, null);
        }

        public FileHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FileHeader(KaitaiStream _io, AndroidSparse _parent) {
            this(_io, _parent, null);
        }

        public FileHeader(KaitaiStream _io, AndroidSparse _parent, AndroidSparse _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lenChunkHeader = this._io.readU2le();
            this.blockSize = this._io.readU4le();
            {
                long _it = this.blockSize;
                if (!(KaitaiStream.mod(_it, 4) == 0)) {
                    throw new KaitaiStream.ValidationExprError(this.blockSize, this._io, "/types/file_header/seq/1");
                }
            }
            this.numBlocks = this._io.readU4le();
            this.numChunks = this._io.readU4le();
            this.checksum = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.lenChunkHeader);
            this._io.writeU4le(this.blockSize);
            this._io.writeU4le(this.numBlocks);
            this._io.writeU4le(this.numChunks);
            this._io.writeU4le(this.checksum);
        }

        public void _check() {
            {
                long _it = this.blockSize;
                if (!(KaitaiStream.mod(_it, 4) == 0)) {
                    throw new KaitaiStream.ValidationExprError(this.blockSize, null, "/types/file_header/seq/1");
                }
            }
            _dirty = false;
        }
        private Integer lenHeader;

        /**
         * size of file header, should be 28
         */
        public Integer lenHeader() {
            if (this.lenHeader != null)
                return this.lenHeader;
            this.lenHeader = ((Number) (_root().headerPrefix().lenHeader())).intValue();
            return this.lenHeader;
        }
        public void _invalidateLenHeader() { this.lenHeader = null; }
        private Version version;
        public Version version() {
            if (this.version != null)
                return this.version;
            this.version = _root().headerPrefix().version();
            return this.version;
        }
        public void _invalidateVersion() { this.version = null; }
        private int lenChunkHeader;
        private long blockSize;
        private long numBlocks;
        private long numChunks;
        private long checksum;
        private AndroidSparse _root;
        private AndroidSparse _parent;

        /**
         * size of chunk header, should be 12
         */
        public int lenChunkHeader() { return lenChunkHeader; }
        public void setLenChunkHeader(int _v) { _dirty = true; lenChunkHeader = _v; }

        /**
         * block size in bytes, must be a multiple of 4
         */
        public long blockSize() { return blockSize; }
        public void setBlockSize(long _v) { _dirty = true; blockSize = _v; }

        /**
         * blocks in the original data
         */
        public long numBlocks() { return numBlocks; }
        public void setNumBlocks(long _v) { _dirty = true; numBlocks = _v; }
        public long numChunks() { return numChunks; }
        public void setNumChunks(long _v) { _dirty = true; numChunks = _v; }

        /**
         * CRC32 checksum of the original data
         * 
         * In practice always 0; if checksum writing is requested, a CRC32 chunk is written
         * at the end of the file instead. The canonical `libsparse` implementation does this
         * and other implementations tend to follow it, see
         * <https://gitlab.com/teskje/android-sparse-rs/-/blob/57c2577/src/write.rs#L112-114>
         */
        public long checksum() { return checksum; }
        public void setChecksum(long _v) { _dirty = true; checksum = _v; }
        public AndroidSparse _root() { return _root; }
        public void set_root(AndroidSparse _v) { _dirty = true; _root = _v; }
        public AndroidSparse _parent() { return _parent; }
        public void set_parent(AndroidSparse _v) { _dirty = true; _parent = _v; }
    }
    public static class FileHeaderPrefix extends KaitaiStruct.ReadWrite {
        public static FileHeaderPrefix fromFile(String fileName) throws IOException {
            return new FileHeaderPrefix(new ByteBufferKaitaiStream(fileName));
        }
        public FileHeaderPrefix() {
            this(null, null, null);
        }

        public FileHeaderPrefix(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FileHeaderPrefix(KaitaiStream _io, AndroidSparse _parent) {
            this(_io, _parent, null);
        }

        public FileHeaderPrefix(KaitaiStream _io, AndroidSparse _parent, AndroidSparse _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 58, -1, 38, -19 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 58, -1, 38, -19 }, this.magic, this._io, "/types/file_header_prefix/seq/0");
            }
            this.version = new Version(this._io, this, _root);
            this.version._read();
            this.lenHeader = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.version._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this.version._write_Seq(this._io);
            this._io.writeU2le(this.lenHeader);
        }

        public void _check() {
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 58, -1, 38, -19 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 58, -1, 38, -19 }, this.magic, null, "/types/file_header_prefix/seq/0");
            }
            if (!Objects.equals(this.version._root(), _root()))
                throw new ConsistencyError("version", _root(), this.version._root());
            if (!Objects.equals(this.version._parent(), this))
                throw new ConsistencyError("version", this, this.version._parent());
            _dirty = false;
        }
        private byte[] magic;
        private Version version;
        private int lenHeader;
        private AndroidSparse _root;
        private AndroidSparse _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }

        /**
         * internal; access `_root.header.version` instead
         */
        public Version version() { return version; }
        public void setVersion(Version _v) { _dirty = true; version = _v; }

        /**
         * internal; access `_root.header.len_header` instead
         */
        public int lenHeader() { return lenHeader; }
        public void setLenHeader(int _v) { _dirty = true; lenHeader = _v; }
        public AndroidSparse _root() { return _root; }
        public void set_root(AndroidSparse _v) { _dirty = true; _root = _v; }
        public AndroidSparse _parent() { return _parent; }
        public void set_parent(AndroidSparse _v) { _dirty = true; _parent = _v; }
    }
    public static class Version extends KaitaiStruct.ReadWrite {
        public static Version fromFile(String fileName) throws IOException {
            return new Version(new ByteBufferKaitaiStream(fileName));
        }
        public Version() {
            this(null, null, null);
        }

        public Version(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Version(KaitaiStream _io, AndroidSparse.FileHeaderPrefix _parent) {
            this(_io, _parent, null);
        }

        public Version(KaitaiStream _io, AndroidSparse.FileHeaderPrefix _parent, AndroidSparse _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.major = this._io.readU2le();
            if (!(this.major == 1)) {
                throw new KaitaiStream.ValidationNotEqualError(1, this.major, this._io, "/types/version/seq/0");
            }
            this.minor = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.major);
            this._io.writeU2le(this.minor);
        }

        public void _check() {
            if (!(this.major == 1)) {
                throw new KaitaiStream.ValidationNotEqualError(1, this.major, null, "/types/version/seq/0");
            }
            _dirty = false;
        }
        private int major;
        private int minor;
        private AndroidSparse _root;
        private AndroidSparse.FileHeaderPrefix _parent;
        public int major() { return major; }
        public void setMajor(int _v) { _dirty = true; major = _v; }
        public int minor() { return minor; }
        public void setMinor(int _v) { _dirty = true; minor = _v; }
        public AndroidSparse _root() { return _root; }
        public void set_root(AndroidSparse _v) { _dirty = true; _root = _v; }
        public AndroidSparse.FileHeaderPrefix _parent() { return _parent; }
        public void set_parent(AndroidSparse.FileHeaderPrefix _v) { _dirty = true; _parent = _v; }
    }
    private FileHeaderPrefix headerPrefix;
    private FileHeader header;
    private List<Chunk> chunks;
    private AndroidSparse _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_header;

    /**
     * internal; access `_root.header` instead
     */
    public FileHeaderPrefix headerPrefix() { return headerPrefix; }
    public void setHeaderPrefix(FileHeaderPrefix _v) { _dirty = true; headerPrefix = _v; }
    public FileHeader header() { return header; }
    public void setHeader(FileHeader _v) { _dirty = true; header = _v; }
    public List<Chunk> chunks() { return chunks; }
    public void setChunks(List<Chunk> _v) { _dirty = true; chunks = _v; }
    public AndroidSparse _root() { return _root; }
    public void set_root(AndroidSparse _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_header() { return _raw_header; }
    public void set_raw_Header(byte[] _v) { _dirty = true; _raw_header = _v; }
}

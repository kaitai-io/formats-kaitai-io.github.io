// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
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
public class AndroidSparse extends KaitaiStruct {
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

    public AndroidSparse(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AndroidSparse(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public AndroidSparse(KaitaiStream _io, KaitaiStruct _parent, AndroidSparse _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.headerPrefix = new FileHeaderPrefix(this._io, this, _root);
        KaitaiStream _io_header = this._io.substream(headerPrefix().lenHeader() - 10);
        this.header = new FileHeader(_io_header, this, _root);
        this.chunks = new ArrayList<Chunk>();
        for (int i = 0; i < header().numChunks(); i++) {
            this.chunks.add(new Chunk(this._io, this, _root));
        }
    }

    public void _fetchInstances() {
        this.headerPrefix._fetchInstances();
        this.header._fetchInstances();
        for (int i = 0; i < this.chunks.size(); i++) {
            this.chunks.get(((Number) (i)).intValue())._fetchInstances();
        }
    }
    public static class Chunk extends KaitaiStruct {
        public static Chunk fromFile(String fileName) throws IOException {
            return new Chunk(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            KaitaiStream _io_header = this._io.substream(_root().header().lenChunkHeader());
            this.header = new ChunkHeader(_io_header, this, _root);
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
        public static class ChunkHeader extends KaitaiStruct {
            public static ChunkHeader fromFile(String fileName) throws IOException {
                return new ChunkHeader(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.chunkType = AndroidSparse.ChunkTypes.byId(this._io.readU2le());
                this.reserved1 = this._io.readU2le();
                this.numBodyBlocks = this._io.readU4le();
                this.lenChunk = this._io.readU4le();
                if (!(this.lenChunk == (lenBodyExpected() != -1 ? _root().header().lenChunkHeader() + lenBodyExpected() : lenChunk()))) {
                    throw new KaitaiStream.ValidationNotEqualError((lenBodyExpected() != -1 ? _root().header().lenChunkHeader() + lenBodyExpected() : lenChunk()), this.lenChunk, this._io, "/types/chunk/types/chunk_header/seq/3");
                }
            }

            public void _fetchInstances() {
            }
            private Integer lenBody;
            public Integer lenBody() {
                if (this.lenBody != null)
                    return this.lenBody;
                this.lenBody = ((Number) (lenChunk() - _root().header().lenChunkHeader())).intValue();
                return this.lenBody;
            }
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
            private ChunkTypes chunkType;
            private int reserved1;
            private long numBodyBlocks;
            private long lenChunk;
            private AndroidSparse _root;
            private AndroidSparse.Chunk _parent;
            public ChunkTypes chunkType() { return chunkType; }
            public int reserved1() { return reserved1; }

            /**
             * size of the chunk body in blocks in output image
             */
            public long numBodyBlocks() { return numBodyBlocks; }

            /**
             * in bytes of chunk input file including chunk header and data
             */
            public long lenChunk() { return lenChunk; }
            public AndroidSparse _root() { return _root; }
            public AndroidSparse.Chunk _parent() { return _parent; }
        }
        private ChunkHeader header;
        private Object body;
        private AndroidSparse _root;
        private AndroidSparse _parent;
        public ChunkHeader header() { return header; }
        public Object body() { return body; }
        public AndroidSparse _root() { return _root; }
        public AndroidSparse _parent() { return _parent; }
    }
    public static class FileHeader extends KaitaiStruct {
        public static FileHeader fromFile(String fileName) throws IOException {
            return new FileHeader(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
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
        }

        public void _fetchInstances() {
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
        private Version version;
        public Version version() {
            if (this.version != null)
                return this.version;
            this.version = _root().headerPrefix().version();
            return this.version;
        }
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

        /**
         * block size in bytes, must be a multiple of 4
         */
        public long blockSize() { return blockSize; }

        /**
         * blocks in the original data
         */
        public long numBlocks() { return numBlocks; }
        public long numChunks() { return numChunks; }

        /**
         * CRC32 checksum of the original data
         * 
         * In practice always 0; if checksum writing is requested, a CRC32 chunk is written
         * at the end of the file instead. The canonical `libsparse` implementation does this
         * and other implementations tend to follow it, see
         * <https://gitlab.com/teskje/android-sparse-rs/-/blob/57c2577/src/write.rs#L112-114>
         */
        public long checksum() { return checksum; }
        public AndroidSparse _root() { return _root; }
        public AndroidSparse _parent() { return _parent; }
    }
    public static class FileHeaderPrefix extends KaitaiStruct {
        public static FileHeaderPrefix fromFile(String fileName) throws IOException {
            return new FileHeaderPrefix(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 58, -1, 38, -19 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 58, -1, 38, -19 }, this.magic, this._io, "/types/file_header_prefix/seq/0");
            }
            this.version = new Version(this._io, this, _root);
            this.lenHeader = this._io.readU2le();
        }

        public void _fetchInstances() {
            this.version._fetchInstances();
        }
        private byte[] magic;
        private Version version;
        private int lenHeader;
        private AndroidSparse _root;
        private AndroidSparse _parent;
        public byte[] magic() { return magic; }

        /**
         * internal; access `_root.header.version` instead
         */
        public Version version() { return version; }

        /**
         * internal; access `_root.header.len_header` instead
         */
        public int lenHeader() { return lenHeader; }
        public AndroidSparse _root() { return _root; }
        public AndroidSparse _parent() { return _parent; }
    }
    public static class Version extends KaitaiStruct {
        public static Version fromFile(String fileName) throws IOException {
            return new Version(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.major = this._io.readU2le();
            if (!(this.major == 1)) {
                throw new KaitaiStream.ValidationNotEqualError(1, this.major, this._io, "/types/version/seq/0");
            }
            this.minor = this._io.readU2le();
        }

        public void _fetchInstances() {
        }
        private int major;
        private int minor;
        private AndroidSparse _root;
        private AndroidSparse.FileHeaderPrefix _parent;
        public int major() { return major; }
        public int minor() { return minor; }
        public AndroidSparse _root() { return _root; }
        public AndroidSparse.FileHeaderPrefix _parent() { return _parent; }
    }
    private FileHeaderPrefix headerPrefix;
    private FileHeader header;
    private List<Chunk> chunks;
    private AndroidSparse _root;
    private KaitaiStruct _parent;

    /**
     * internal; access `_root.header` instead
     */
    public FileHeaderPrefix headerPrefix() { return headerPrefix; }
    public FileHeader header() { return header; }
    public List<Chunk> chunks() { return chunks; }
    public AndroidSparse _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

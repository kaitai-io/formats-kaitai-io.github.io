// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;


/**
 * @see <a href="https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt">Source</a>
 */
public class Zchunk extends KaitaiStruct {
    public static Zchunk fromFile(String fileName) throws IOException {
        return new Zchunk(new ByteBufferKaitaiStream(fileName));
    }

    public enum ChecksumTypes {
        SHA1(0),
        SHA256(1),
        SHA512(2),
        SHA512_128(3);

        private final long id;
        ChecksumTypes(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ChecksumTypes> byId = new HashMap<Long, ChecksumTypes>(4);
        static {
            for (ChecksumTypes e : ChecksumTypes.values())
                byId.put(e.id(), e);
        }
        public static ChecksumTypes byId(long id) { return byId.get(id); }
    }

    public enum CompressionTypes {
        NONE(0),
        ZSTD(2);

        private final long id;
        CompressionTypes(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, CompressionTypes> byId = new HashMap<Long, CompressionTypes>(2);
        static {
            for (CompressionTypes e : CompressionTypes.values())
                byId.put(e.id(), e);
        }
        public static CompressionTypes byId(long id) { return byId.get(id); }
    }

    public Zchunk(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Zchunk(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Zchunk(KaitaiStream _io, KaitaiStruct _parent, Zchunk _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.lead = new HeaderLead(this._io, this, _root);
        KaitaiStream _io_headerRest = this._io.substream(lead().lenHeaderRest().value());
        this.headerRest = new HeaderWithoutLead(_io_headerRest, this, _root);
        this.dict = this._io.readBytes(headerRest().index().lenDict().value());
        if (!(lead().isDetachedHeader())) {
            this.chunks = new ArrayList<byte[]>();
            for (int i = 0; i < headerRest().index().chunksMetadata().size(); i++) {
                this.chunks.add(this._io.readBytes(headerRest().index().chunksMetadata().get(((Number) (i)).intValue()).lenChunk().value()));
            }
        }
    }

    public void _fetchInstances() {
        this.lead._fetchInstances();
        this.headerRest._fetchInstances();
        if (!(lead().isDetachedHeader())) {
            for (int i = 0; i < this.chunks.size(); i++) {
            }
        }
    }
    public static class ChecksumType extends KaitaiStruct {
        public static ChecksumType fromFile(String fileName) throws IOException {
            return new ChecksumType(new ByteBufferKaitaiStream(fileName));
        }

        public ChecksumType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ChecksumType(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public ChecksumType(KaitaiStream _io, KaitaiStruct _parent, Zchunk _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.raw = new CompressedInteger(this._io, this, _root);
            {
                CompressedInteger _it = this.raw;
                if (!(lenChecksum() != 0)) {
                    throw new KaitaiStream.ValidationExprError(this.raw, this._io, "/types/checksum_type/seq/0");
                }
            }
        }

        public void _fetchInstances() {
            this.raw._fetchInstances();
        }
        private Byte lenChecksum;
        public Byte lenChecksum() {
            if (this.lenChecksum != null)
                return this.lenChecksum;
            this.lenChecksum = ((Number) ((value() == Zchunk.ChecksumTypes.SHA1 ? 20 : (value() == Zchunk.ChecksumTypes.SHA256 ? 32 : (value() == Zchunk.ChecksumTypes.SHA512 ? 64 : (value() == Zchunk.ChecksumTypes.SHA512_128 ? 16 : 0)))))).byteValue();
            return this.lenChecksum;
        }
        private ChecksumTypes value;
        public ChecksumTypes value() {
            if (this.value != null)
                return this.value;
            this.value = Zchunk.ChecksumTypes.byId(raw().value());
            return this.value;
        }
        private CompressedInteger raw;
        private Zchunk _root;
        private KaitaiStruct _parent;

        /**
         * Raw integer, don't read this field - access `value` instead.
         */
        public CompressedInteger raw() { return raw; }
        public Zchunk _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class Chunk extends KaitaiStruct {

        public Chunk(KaitaiStream _io, long lenChecksum, boolean hasDataStreams, boolean hasUncompressedSource) {
            this(_io, null, null, lenChecksum, hasDataStreams, hasUncompressedSource);
        }

        public Chunk(KaitaiStream _io, Zchunk.Index _parent, long lenChecksum, boolean hasDataStreams, boolean hasUncompressedSource) {
            this(_io, _parent, null, lenChecksum, hasDataStreams, hasUncompressedSource);
        }

        public Chunk(KaitaiStream _io, Zchunk.Index _parent, Zchunk _root, long lenChecksum, boolean hasDataStreams, boolean hasUncompressedSource) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.lenChecksum = lenChecksum;
            this.hasDataStreams = hasDataStreams;
            this.hasUncompressedSource = hasUncompressedSource;
            _read();
        }
        private void _read() {
            if (hasDataStreams()) {
                this.chunkStream = new CompressedInteger(this._io, this, _root);
            }
            this.chunkChecksum = this._io.readBytes(lenChecksum());
            if (hasUncompressedSource()) {
                this.uncompressedChunkChecksum = this._io.readBytes(lenChecksum());
            }
            this.lenChunk = new CompressedInteger(this._io, this, _root);
            this.lenUncompressedChunk = new CompressedInteger(this._io, this, _root);
        }

        public void _fetchInstances() {
            if (hasDataStreams()) {
                this.chunkStream._fetchInstances();
            }
            if (hasUncompressedSource()) {
            }
            this.lenChunk._fetchInstances();
            this.lenUncompressedChunk._fetchInstances();
        }
        private CompressedInteger chunkStream;
        private byte[] chunkChecksum;
        private byte[] uncompressedChunkChecksum;
        private CompressedInteger lenChunk;
        private CompressedInteger lenUncompressedChunk;
        private long lenChecksum;
        private boolean hasDataStreams;
        private boolean hasUncompressedSource;
        private Zchunk _root;
        private Zchunk.Index _parent;
        public CompressedInteger chunkStream() { return chunkStream; }
        public byte[] chunkChecksum() { return chunkChecksum; }

        /**
         * Checksum of the uncompressed chunk. Used to detect whether a chunk
         * from an uncompressed source is identical to the compressed chunk.
         */
        public byte[] uncompressedChunkChecksum() { return uncompressedChunkChecksum; }
        public CompressedInteger lenChunk() { return lenChunk; }
        public CompressedInteger lenUncompressedChunk() { return lenUncompressedChunk; }
        public long lenChecksum() { return lenChecksum; }
        public boolean hasDataStreams() { return hasDataStreams; }
        public boolean hasUncompressedSource() { return hasUncompressedSource; }
        public Zchunk _root() { return _root; }
        public Zchunk.Index _parent() { return _parent; }
    }

    /**
     * Like `/common/vlq_base128_le` (LEB128), but the logic of the
     * "continuation" flag in the most significant bit is inverted, so instead of
     * `has_next`, it is called `is_last` (if the highest bit is set to zero, it
     * means "continue", whereas in standard LEB128, the highest bit set to
     * **one** means "continue"). Therefore, we cannot simply import
     * `/common/vlq_base128_le` and use it, because it is incompatible.
     */
    public static class CompressedInteger extends KaitaiStruct {
        public static CompressedInteger fromFile(String fileName) throws IOException {
            return new CompressedInteger(new ByteBufferKaitaiStream(fileName));
        }

        public CompressedInteger(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CompressedInteger(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public CompressedInteger(KaitaiStream _io, KaitaiStruct _parent, Zchunk _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.groups = new ArrayList<Group>();
            {
                Group _it;
                int i = 0;
                do {
                    _it = new Group(this._io, this, _root, i);
                    this.groups.add(_it);
                    i++;
                } while (!(_it.isLast()));
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.groups.size(); i++) {
                this.groups.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        /**
         * One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.
         */
        public static class Group extends KaitaiStruct {

            public Group(KaitaiStream _io, int idx) {
                this(_io, null, null, idx);
            }

            public Group(KaitaiStream _io, Zchunk.CompressedInteger _parent, int idx) {
                this(_io, _parent, null, idx);
            }

            public Group(KaitaiStream _io, Zchunk.CompressedInteger _parent, Zchunk _root, int idx) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this.idx = idx;
                _read();
            }
            private void _read() {
                this.isLast = this._io.readBitsIntBe(1) != 0;
                if (!(this.isLast == (idx() == 9 ? true : isLast()))) {
                    throw new KaitaiStream.ValidationNotEqualError((idx() == 9 ? true : isLast()), this.isLast, this._io, "/types/compressed_integer/types/group/seq/0");
                }
                this.value = this._io.readBitsIntBe(7);
                if (!(this.value <= ((Number) ((idx() == 9 ? 1 : 127))).longValue())) {
                    throw new KaitaiStream.ValidationGreaterThanError(((Number) ((idx() == 9 ? 1 : 127))).longValue(), this.value, this._io, "/types/compressed_integer/types/group/seq/1");
                }
            }

            public void _fetchInstances() {
            }
            private boolean isLast;
            private long value;
            private int idx;
            private Zchunk _root;
            private Zchunk.CompressedInteger _parent;

            /**
             * If `true`, then this is the last byte of the compressed integer.
             * 
             * Since this implementation only supports serialized values up to 10
             * bytes, this must be `true` in the 10th group (`groups[9]`).
             */
            public boolean isLast() { return isLast; }

            /**
             * The 7-bit (base128) numeric value chunk of this group
             * 
             * Since this implementation only supports integer values up to 64 bits,
             * the `value` in the 10th group (`groups[9]`) can only be `0` or `1`
             * (otherwise the width of the represented value would be 65 bits or
             * more, which is not supported).
             */
            public long value() { return value; }
            public int idx() { return idx; }
            public Zchunk _root() { return _root; }
            public Zchunk.CompressedInteger _parent() { return _parent; }
        }
        private Integer len;
        public Integer len() {
            if (this.len != null)
                return this.len;
            this.len = ((Number) (groups().size())).intValue();
            return this.len;
        }
        private Long value;

        /**
         * Resulting unsigned value as normal integer
         */
        public Long value() {
            if (this.value != null)
                return this.value;
            this.value = ((Number) (((Number) (((((((((groups().get(((int) 0)).value() | (len() >= 2 ? groups().get(((int) 1)).value() << 7 : 0)) | (len() >= 3 ? groups().get(((int) 2)).value() << 14 : 0)) | (len() >= 4 ? groups().get(((int) 3)).value() << 21 : 0)) | (len() >= 5 ? groups().get(((int) 4)).value() << 28 : 0)) | (len() >= 6 ? groups().get(((int) 5)).value() << 35 : 0)) | (len() >= 7 ? groups().get(((int) 6)).value() << 42 : 0)) | (len() >= 8 ? groups().get(((int) 7)).value() << 49 : 0)) | (len() >= 9 ? groups().get(((int) 8)).value() << 56 : 0)) | (len() >= 10 ? groups().get(((int) 9)).value() << 63 : 0))).longValue())).longValue();
            return this.value;
        }
        private List<Group> groups;
        private Zchunk _root;
        private KaitaiStruct _parent;
        public List<Group> groups() { return groups; }
        public Zchunk _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class HeaderLead extends KaitaiStruct {
        public static HeaderLead fromFile(String fileName) throws IOException {
            return new HeaderLead(new ByteBufferKaitaiStream(fileName));
        }

        public HeaderLead(KaitaiStream _io) {
            this(_io, null, null);
        }

        public HeaderLead(KaitaiStream _io, Zchunk _parent) {
            this(_io, _parent, null);
        }

        public HeaderLead(KaitaiStream _io, Zchunk _parent, Zchunk _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(5);
            if (!( ((Arrays.equals(this.magic, new byte[] { 0, 90, 67, 75, 49 })) || (Arrays.equals(this.magic, new byte[] { 0, 90, 72, 82, 49 }))) )) {
                throw new KaitaiStream.ValidationNotAnyOfError(this.magic, this._io, "/types/header_lead/seq/0");
            }
            this.overallChecksumType = new ChecksumType(this._io, this, _root);
            this.lenHeaderRest = new CompressedInteger(this._io, this, _root);
            this.headerChecksum = this._io.readBytes(overallChecksumType().lenChecksum());
        }

        public void _fetchInstances() {
            this.overallChecksumType._fetchInstances();
            this.lenHeaderRest._fetchInstances();
        }
        private Boolean isDetachedHeader;

        /**
         * Determines whether this file is a zchunk detached header (`.zhr`). If
         * not, it is a complete zchunk file (`.zck`).
         */
        public Boolean isDetachedHeader() {
            if (this.isDetachedHeader != null)
                return this.isDetachedHeader;
            this.isDetachedHeader = (magic()[((int) 2)] & 0xff) == 72;
            return this.isDetachedHeader;
        }
        private byte[] magic;
        private ChecksumType overallChecksumType;
        private CompressedInteger lenHeaderRest;
        private byte[] headerChecksum;
        private Zchunk _root;
        private Zchunk _parent;

        /**
         * There are two valid magic numbers for zchunk files:
         * 
         * * `'\0ZCK1'` identifies a zchunk version 1 file (`.zck`)
         * * `'\0ZHR1'` identifies a zchunk version 1 detached header file (`.zhr`)
         */
        public byte[] magic() { return magic; }

        /**
         * Type of the checksum used for `header_checksum` and
         * `_root.header_rest.preface.data_checksum`.
         */
        public ChecksumType overallChecksumType() { return overallChecksumType; }

        /**
         * Size of the header, not including the lead
         */
        public CompressedInteger lenHeaderRest() { return lenHeaderRest; }

        /**
         * Checksum of the entire header, which consists of `_root.lead` and
         * `_root.header_rest` (i.e. everything from the beginning of the file to
         * the end of `_root.header_rest`), not including the `header_checksum`
         * field itself (i.e. the input for the checksum algorithm is a
         * concatenation of the bytes preceding the `header_checksum` field with
         * the bytes following it).
         * 
         * For detached headers, the checksum is calculated as if the `magic`
         * field were set to `'\0ZCK1'`, so that it matches the checksum in the
         * full zchunk file.
         */
        public byte[] headerChecksum() { return headerChecksum; }
        public Zchunk _root() { return _root; }
        public Zchunk _parent() { return _parent; }
    }
    public static class HeaderWithoutLead extends KaitaiStruct {
        public static HeaderWithoutLead fromFile(String fileName) throws IOException {
            return new HeaderWithoutLead(new ByteBufferKaitaiStream(fileName));
        }

        public HeaderWithoutLead(KaitaiStream _io) {
            this(_io, null, null);
        }

        public HeaderWithoutLead(KaitaiStream _io, Zchunk _parent) {
            this(_io, _parent, null);
        }

        public HeaderWithoutLead(KaitaiStream _io, Zchunk _parent, Zchunk _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.preface = new Preface(this._io, this, _root);
            this.lenIndex = new CompressedInteger(this._io, this, _root);
            KaitaiStream _io_index = this._io.substream(lenIndex().value());
            this.index = new Index(_io_index, this, _root);
            this.numSignatures = new CompressedInteger(this._io, this, _root);
            {
                CompressedInteger _it = this.numSignatures;
                if (!(_it.value() == 0)) {
                    throw new KaitaiStream.ValidationExprError(this.numSignatures, this._io, "/types/header_without_lead/seq/3");
                }
            }
        }

        public void _fetchInstances() {
            this.preface._fetchInstances();
            this.lenIndex._fetchInstances();
            this.index._fetchInstances();
            this.numSignatures._fetchInstances();
        }
        private Preface preface;
        private CompressedInteger lenIndex;
        private Index index;
        private CompressedInteger numSignatures;
        private Zchunk _root;
        private Zchunk _parent;
        public Preface preface() { return preface; }
        public CompressedInteger lenIndex() { return lenIndex; }
        public Index index() { return index; }

        /**
         * Must be 0. The reference implementation also rejects any file with a
         * non-zero "Signature count", throwing a fatal error stating "Signatures
         * aren't supported yet" - see
         * [`src/lib/header.c:259-264`](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/src/lib/header.c#L259-L264).
         * 
         * Although the structure of signatures is defined [in the official
         * textual
         * specification](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L219-L252),
         * no signature types are defined, and as of this writing no publicly
         * known implementation generates or interprets these signatures.
         * Therefore, we've decided not to implement them here either.
         * 
         * For more details, see
         * <https://github.com/kaitai-io/kaitai_struct_formats/pull/539#discussion_r3713109887>.
         */
        public CompressedInteger numSignatures() { return numSignatures; }
        public Zchunk _root() { return _root; }
        public Zchunk _parent() { return _parent; }
    }
    public static class Index extends KaitaiStruct {
        public static Index fromFile(String fileName) throws IOException {
            return new Index(new ByteBufferKaitaiStream(fileName));
        }

        public Index(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Index(KaitaiStream _io, Zchunk.HeaderWithoutLead _parent) {
            this(_io, _parent, null);
        }

        public Index(KaitaiStream _io, Zchunk.HeaderWithoutLead _parent, Zchunk _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.chunkChecksumType = new ChecksumType(this._io, this, _root);
            this.numChunks = new CompressedInteger(this._io, this, _root);
            {
                CompressedInteger _it = this.numChunks;
                if (!(_it.value() >= 1)) {
                    throw new KaitaiStream.ValidationExprError(this.numChunks, this._io, "/types/index/seq/1");
                }
            }
            if (_parent().preface().hasDataStreams()) {
                this.dictStream = new CompressedInteger(this._io, this, _root);
                {
                    CompressedInteger _it = this.dictStream;
                    if (!(_it.value() == 0)) {
                        throw new KaitaiStream.ValidationExprError(this.dictStream, this._io, "/types/index/seq/2");
                    }
                }
            }
            this.dictChecksum = this._io.readBytes(chunkChecksumType().lenChecksum());
            if (_parent().preface().hasUncompressedSource()) {
                this.uncompressedDictChecksum = this._io.readBytes(chunkChecksumType().lenChecksum());
            }
            this.lenDict = new CompressedInteger(this._io, this, _root);
            this.lenUncompressedDict = new CompressedInteger(this._io, this, _root);
            this.chunksMetadata = new ArrayList<Chunk>();
            for (int i = 0; i < numDataChunks(); i++) {
                this.chunksMetadata.add(new Chunk(this._io, this, _root, chunkChecksumType().lenChecksum(), _parent().preface().hasDataStreams(), _parent().preface().hasUncompressedSource()));
            }
        }

        public void _fetchInstances() {
            this.chunkChecksumType._fetchInstances();
            this.numChunks._fetchInstances();
            if (_parent().preface().hasDataStreams()) {
                this.dictStream._fetchInstances();
            }
            if (_parent().preface().hasUncompressedSource()) {
            }
            this.lenDict._fetchInstances();
            this.lenUncompressedDict._fetchInstances();
            for (int i = 0; i < this.chunksMetadata.size(); i++) {
                this.chunksMetadata.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private Integer numDataChunks;

        /**
         * Number of data chunks. `num_chunks` counts the dictionary as chunk 0,
         * so it is one greater than this number.
         */
        public Integer numDataChunks() {
            if (this.numDataChunks != null)
                return this.numDataChunks;
            this.numDataChunks = ((Number) (numChunks().value() - 1)).intValue();
            return this.numDataChunks;
        }
        private ChecksumType chunkChecksumType;
        private CompressedInteger numChunks;
        private CompressedInteger dictStream;
        private byte[] dictChecksum;
        private byte[] uncompressedDictChecksum;
        private CompressedInteger lenDict;
        private CompressedInteger lenUncompressedDict;
        private List<Chunk> chunksMetadata;
        private Zchunk _root;
        private Zchunk.HeaderWithoutLead _parent;

        /**
         * Type of the checksum used for `dict_checksum` and for all
         * `chunks_metadata[...].chunk_checksum` and
         * `chunks_metadata[...].uncompressed_chunk_checksum`.
         */
        public ChecksumType chunkChecksumType() { return chunkChecksumType; }

        /**
         * Number of chunks, **including** the dictionary chunk.
         * 
         * Must be at least 1, because the dictionary chunk is always present,
         * even if it is empty. The reference implementation also fails when the
         * number of chunks is 0, see
         * [`src/lib/index/index_read.c:181-184`](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/src/lib/index/index_read.c#L181-L184).
         */
        public CompressedInteger numChunks() { return numChunks; }

        /**
         * If present, it must always be 0.
         * @see <a href="https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L159-L162">Source</a>
         */
        public CompressedInteger dictStream() { return dictStream; }
        public byte[] dictChecksum() { return dictChecksum; }

        /**
         * Checksum of the uncompressed dictionary. It has no real use, as the
         * uncompressed source won't have a dictionary.
         */
        public byte[] uncompressedDictChecksum() { return uncompressedDictChecksum; }
        public CompressedInteger lenDict() { return lenDict; }
        public CompressedInteger lenUncompressedDict() { return lenUncompressedDict; }

        /**
         * Metadata of the data chunks. The dictionary is chunk 0 and its
         * metadata is stored in the `*dict*` fields above, so there is one fewer
         * entry here than indicated by `num_chunks`.
         */
        public List<Chunk> chunksMetadata() { return chunksMetadata; }
        public Zchunk _root() { return _root; }
        public Zchunk.HeaderWithoutLead _parent() { return _parent; }
    }
    public static class OptionalElement extends KaitaiStruct {
        public static OptionalElement fromFile(String fileName) throws IOException {
            return new OptionalElement(new ByteBufferKaitaiStream(fileName));
        }

        public OptionalElement(KaitaiStream _io) {
            this(_io, null, null);
        }

        public OptionalElement(KaitaiStream _io, Zchunk.Preface _parent) {
            this(_io, _parent, null);
        }

        public OptionalElement(KaitaiStream _io, Zchunk.Preface _parent, Zchunk _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.elementId = new CompressedInteger(this._io, this, _root);
            this.lenData = new CompressedInteger(this._io, this, _root);
            this.data = this._io.readBytes(lenData().value());
        }

        public void _fetchInstances() {
            this.elementId._fetchInstances();
            this.lenData._fetchInstances();
        }
        private CompressedInteger elementId;
        private CompressedInteger lenData;
        private byte[] data;
        private Zchunk _root;
        private Zchunk.Preface _parent;
        public CompressedInteger elementId() { return elementId; }
        public CompressedInteger lenData() { return lenData; }
        public byte[] data() { return data; }
        public Zchunk _root() { return _root; }
        public Zchunk.Preface _parent() { return _parent; }
    }
    public static class Preface extends KaitaiStruct {
        public static Preface fromFile(String fileName) throws IOException {
            return new Preface(new ByteBufferKaitaiStream(fileName));
        }

        public Preface(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Preface(KaitaiStream _io, Zchunk.HeaderWithoutLead _parent) {
            this(_io, _parent, null);
        }

        public Preface(KaitaiStream _io, Zchunk.HeaderWithoutLead _parent, Zchunk _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.dataChecksum = this._io.readBytes(_root().lead().overallChecksumType().lenChecksum());
            this.flags = new CompressedInteger(this._io, this, _root);
            {
                CompressedInteger _it = this.flags;
                if (!(_it.value() <= 7)) {
                    throw new KaitaiStream.ValidationExprError(this.flags, this._io, "/types/preface/seq/1");
                }
            }
            this.compressionTypeInt = new CompressedInteger(this._io, this, _root);
            {
                CompressedInteger _it = this.compressionTypeInt;
                if (!( ((_it.value() == Zchunk.CompressionTypes.NONE.id()) || (_it.value() == Zchunk.CompressionTypes.ZSTD.id())) )) {
                    throw new KaitaiStream.ValidationExprError(this.compressionTypeInt, this._io, "/types/preface/seq/2");
                }
            }
            if (hasOptionalElements()) {
                this.numOptionalElements = new CompressedInteger(this._io, this, _root);
                {
                    CompressedInteger _it = this.numOptionalElements;
                    if (!(_it.value() >= 1)) {
                        throw new KaitaiStream.ValidationExprError(this.numOptionalElements, this._io, "/types/preface/seq/3");
                    }
                }
            }
            if (hasOptionalElements()) {
                this.optionalElements = new ArrayList<OptionalElement>();
                for (int i = 0; i < numOptionalElements().value(); i++) {
                    this.optionalElements.add(new OptionalElement(this._io, this, _root));
                }
            }
        }

        public void _fetchInstances() {
            this.flags._fetchInstances();
            this.compressionTypeInt._fetchInstances();
            if (hasOptionalElements()) {
                this.numOptionalElements._fetchInstances();
            }
            if (hasOptionalElements()) {
                for (int i = 0; i < this.optionalElements.size(); i++) {
                    this.optionalElements.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
        }
        private CompressionTypes compressionType;
        public CompressionTypes compressionType() {
            if (this.compressionType != null)
                return this.compressionType;
            this.compressionType = Zchunk.CompressionTypes.byId(compressionTypeInt().value());
            return this.compressionType;
        }
        private Boolean hasDataStreams;
        public Boolean hasDataStreams() {
            if (this.hasDataStreams != null)
                return this.hasDataStreams;
            this.hasDataStreams = (flags().value() & 1) != 0;
            return this.hasDataStreams;
        }
        private Boolean hasOptionalElements;
        public Boolean hasOptionalElements() {
            if (this.hasOptionalElements != null)
                return this.hasOptionalElements;
            this.hasOptionalElements = (flags().value() & 2) != 0;
            return this.hasOptionalElements;
        }
        private Boolean hasUncompressedSource;

        /**
         * The file may be applied against an uncompressed source. This adds an
         * uncompressed checksum to every index entry, including the dictionary.
         */
        public Boolean hasUncompressedSource() {
            if (this.hasUncompressedSource != null)
                return this.hasUncompressedSource;
            this.hasUncompressedSource = (flags().value() & 4) != 0;
            return this.hasUncompressedSource;
        }
        private byte[] dataChecksum;
        private CompressedInteger flags;
        private CompressedInteger compressionTypeInt;
        private CompressedInteger numOptionalElements;
        private List<OptionalElement> optionalElements;
        private Zchunk _root;
        private Zchunk.HeaderWithoutLead _parent;

        /**
         * Total data checksum. Checksum of everything after the header,
         * including the compressed dictionary (`_root.dict`) and all compressed
         * chunks (`_root.chunks`). The type of this checksum is
         * `_root.lead.overall_checksum_type.value`.
         * 
         * If `has_uncompressed_source` is true, this checksum must not be
         * checked and should not be generated. In that case, the reference
         * implementation writes it as all zeros - see the sample file
         * [`mini-uncomp-cksums.zck`](https://github.com/kaitai-io/kaitai_struct_samples/blob/1d2fe11c971fb7e86f343b77a1ed341a0217e86a/archive/zchunk/README.md#mini-uncomp-cksumszck).
         */
        public byte[] dataChecksum() { return dataChecksum; }

        /**
         * Compressed integer containing a bitmask of the flags. All unused flags
         * MUST be set to 0. If a decoder sees a flag set that it doesn't
         * recognize, it MUST exit with an error.
         * @see <a href="https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L78-L81">Source</a>
         */
        public CompressedInteger flags() { return flags; }

        /**
         * Raw integer, don't read this field - access `compression_type`
         * instead.
         */
        public CompressedInteger compressionTypeInt() { return compressionTypeInt; }

        /**
         * If present, it must be at least 1. This is because if there are no
         * optional elements, `has_optional_elements` must be false, and then
         * neither this field nor `optional_elements` is present.
         * @see <a href="https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L99-L102">Source</a>
         */
        public CompressedInteger numOptionalElements() { return numOptionalElements; }
        public List<OptionalElement> optionalElements() { return optionalElements; }
        public Zchunk _root() { return _root; }
        public Zchunk.HeaderWithoutLead _parent() { return _parent; }
    }
    private HeaderLead lead;
    private HeaderWithoutLead headerRest;
    private byte[] dict;
    private List<byte[]> chunks;
    private Zchunk _root;
    private KaitaiStruct _parent;
    public HeaderLead lead() { return lead; }
    public HeaderWithoutLead headerRest() { return headerRest; }

    /**
     * Custom dictionary used when compressing each chunk. It's compressed itself
     * without a dictionary.
     * 
     * The official zchunk specification calls this section "Compressed Dict".
     * It's also called a "dictionary chunk". `zck_read_header -c` presents it as
     * "chunk 0" (which is always shown in the chunk table, but can have size 0
     * if the dictionary is not in use).
     */
    public byte[] dict() { return dict; }

    /**
     * Chunks of data, each compressed with the custom dictionary `dict` (if
     * applicable).
     * 
     * They are not included in a detached header (`.zhr`) file. Detached headers
     * contain the dictionary, but none of the data chunks.
     */
    public List<byte[]> chunks() { return chunks; }
    public Zchunk _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

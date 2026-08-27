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
import java.util.List;
import java.util.Arrays;


/**
 * @see <a href="https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt">Source</a>
 */
public class Zchunk extends KaitaiStruct.ReadWrite {
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
    public Zchunk() {
        this(null, null, null);
    }

    public Zchunk(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Zchunk(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Zchunk(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Zchunk _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.lead = new HeaderLead(this._io, this, _root);
        this.lead._read();
        this._raw_headerRest = this._io.readBytes(lead().lenHeaderRest().value());
        KaitaiStream _io__raw_headerRest = new ByteBufferKaitaiStream(this._raw_headerRest);
        this.headerRest = new HeaderWithoutLead(_io__raw_headerRest, this, _root);
        this.headerRest._read();
        this.dict = this._io.readBytes(headerRest().index().lenDict().value());
        if (!(lead().isDetachedHeader())) {
            this.chunks = new ArrayList<byte[]>();
            for (int i = 0; i < headerRest().index().chunksMetadata().size(); i++) {
                this.chunks.add(this._io.readBytes(headerRest().index().chunksMetadata().get(((Number) (i)).intValue()).lenChunk().value()));
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.lead._fetchInstances();
        this.headerRest._fetchInstances();
        if (!(lead().isDetachedHeader())) {
            for (int i = 0; i < this.chunks.size(); i++) {
            }
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.lead._write_Seq(this._io);
        final KaitaiStream _io__raw_headerRest = new ByteBufferKaitaiStream(lead().lenHeaderRest().value());
        this._io.addChildStream(_io__raw_headerRest);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (lead().lenHeaderRest().value()));
            final Zchunk _this = this;
            _io__raw_headerRest.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_headerRest = _io__raw_headerRest.toByteArray();
                    if (_this._raw_headerRest.length != lead().lenHeaderRest().value())
                        throw new ConsistencyError("raw(header_rest)", lead().lenHeaderRest().value(), _this._raw_headerRest.length);
                    parent.writeBytes(_this._raw_headerRest);
                }
            });
        }
        this.headerRest._write_Seq(_io__raw_headerRest);
        this._io.writeBytes(this.dict);
        if (!(lead().isDetachedHeader())) {
            for (int i = 0; i < this.chunks.size(); i++) {
                this._io.writeBytes(this.chunks.get(((Number) (i)).intValue()));
            }
        }
    }

    public void _check() {
        if (!Objects.equals(this.lead._root(), _root()))
            throw new ConsistencyError("lead", _root(), this.lead._root());
        if (!Objects.equals(this.lead._parent(), this))
            throw new ConsistencyError("lead", this, this.lead._parent());
        if (!Objects.equals(this.headerRest._root(), _root()))
            throw new ConsistencyError("header_rest", _root(), this.headerRest._root());
        if (!Objects.equals(this.headerRest._parent(), this))
            throw new ConsistencyError("header_rest", this, this.headerRest._parent());
        if (this.dict.length != headerRest().index().lenDict().value())
            throw new ConsistencyError("dict", headerRest().index().lenDict().value(), this.dict.length);
        if (!(lead().isDetachedHeader())) {
            if (this.chunks.size() != headerRest().index().chunksMetadata().size())
                throw new ConsistencyError("chunks", headerRest().index().chunksMetadata().size(), this.chunks.size());
            for (int i = 0; i < this.chunks.size(); i++) {
                if (this.chunks.get(((Number) (i)).intValue()).length != headerRest().index().chunksMetadata().get(((Number) (i)).intValue()).lenChunk().value())
                    throw new ConsistencyError("chunks", headerRest().index().chunksMetadata().get(((Number) (i)).intValue()).lenChunk().value(), this.chunks.get(((Number) (i)).intValue()).length);
            }
        }
        _dirty = false;
    }
    public static class ChecksumType extends KaitaiStruct.ReadWrite {
        public static ChecksumType fromFile(String fileName) throws IOException {
            return new ChecksumType(new ByteBufferKaitaiStream(fileName));
        }
        public ChecksumType() {
            this(null, null, null);
        }

        public ChecksumType(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ChecksumType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public ChecksumType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Zchunk _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.raw = new CompressedInteger(this._io, this, _root);
            this.raw._read();
            {
                CompressedInteger _it = this.raw;
                if (!(lenChecksum() != 0)) {
                    throw new KaitaiStream.ValidationExprError(this.raw, this._io, "/types/checksum_type/seq/0");
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.raw._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.raw._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.raw._root(), _root()))
                throw new ConsistencyError("raw", _root(), this.raw._root());
            if (!Objects.equals(this.raw._parent(), this))
                throw new ConsistencyError("raw", this, this.raw._parent());
            {
                CompressedInteger _it = this.raw;
                if (!(lenChecksum() != 0)) {
                    throw new KaitaiStream.ValidationExprError(this.raw, null, "/types/checksum_type/seq/0");
                }
            }
            _dirty = false;
        }
        private Byte lenChecksum;
        public Byte lenChecksum() {
            if (this.lenChecksum != null)
                return this.lenChecksum;
            this.lenChecksum = ((Number) ((value() == Zchunk.ChecksumTypes.SHA1 ? 20 : (value() == Zchunk.ChecksumTypes.SHA256 ? 32 : (value() == Zchunk.ChecksumTypes.SHA512 ? 64 : (value() == Zchunk.ChecksumTypes.SHA512_128 ? 16 : 0)))))).byteValue();
            return this.lenChecksum;
        }
        public void _invalidateLenChecksum() { this.lenChecksum = null; }
        private ChecksumTypes value;
        public ChecksumTypes value() {
            if (this.value != null)
                return this.value;
            this.value = Zchunk.ChecksumTypes.byId(raw().value());
            return this.value;
        }
        public void _invalidateValue() { this.value = null; }
        private CompressedInteger raw;
        private Zchunk _root;
        private KaitaiStruct.ReadWrite _parent;

        /**
         * Raw integer, don't read this field - access `value` instead.
         */
        public CompressedInteger raw() { return raw; }
        public void setRaw(CompressedInteger _v) { _dirty = true; raw = _v; }
        public Zchunk _root() { return _root; }
        public void set_root(Zchunk _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class Chunk extends KaitaiStruct.ReadWrite {
        public Chunk(long lenChecksum, boolean hasDataStreams, boolean hasUncompressedSource) {
            this(null, null, null, lenChecksum, hasDataStreams, hasUncompressedSource);
        }

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
        }
        public void _read() {
            if (hasDataStreams()) {
                this.chunkStream = new CompressedInteger(this._io, this, _root);
                this.chunkStream._read();
            }
            this.chunkChecksum = this._io.readBytes(lenChecksum());
            if (hasUncompressedSource()) {
                this.uncompressedChunkChecksum = this._io.readBytes(lenChecksum());
            }
            this.lenChunk = new CompressedInteger(this._io, this, _root);
            this.lenChunk._read();
            this.lenUncompressedChunk = new CompressedInteger(this._io, this, _root);
            this.lenUncompressedChunk._read();
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();
            if (hasDataStreams()) {
                this.chunkStream._write_Seq(this._io);
            }
            this._io.writeBytes(this.chunkChecksum);
            if (hasUncompressedSource()) {
                this._io.writeBytes(this.uncompressedChunkChecksum);
            }
            this.lenChunk._write_Seq(this._io);
            this.lenUncompressedChunk._write_Seq(this._io);
        }

        public void _check() {
            if (hasDataStreams()) {
                if (!Objects.equals(this.chunkStream._root(), _root()))
                    throw new ConsistencyError("chunk_stream", _root(), this.chunkStream._root());
                if (!Objects.equals(this.chunkStream._parent(), this))
                    throw new ConsistencyError("chunk_stream", this, this.chunkStream._parent());
            }
            if (this.chunkChecksum.length != lenChecksum())
                throw new ConsistencyError("chunk_checksum", lenChecksum(), this.chunkChecksum.length);
            if (hasUncompressedSource()) {
                if (this.uncompressedChunkChecksum.length != lenChecksum())
                    throw new ConsistencyError("uncompressed_chunk_checksum", lenChecksum(), this.uncompressedChunkChecksum.length);
            }
            if (!Objects.equals(this.lenChunk._root(), _root()))
                throw new ConsistencyError("len_chunk", _root(), this.lenChunk._root());
            if (!Objects.equals(this.lenChunk._parent(), this))
                throw new ConsistencyError("len_chunk", this, this.lenChunk._parent());
            if (!Objects.equals(this.lenUncompressedChunk._root(), _root()))
                throw new ConsistencyError("len_uncompressed_chunk", _root(), this.lenUncompressedChunk._root());
            if (!Objects.equals(this.lenUncompressedChunk._parent(), this))
                throw new ConsistencyError("len_uncompressed_chunk", this, this.lenUncompressedChunk._parent());
            _dirty = false;
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
        public void setChunkStream(CompressedInteger _v) { _dirty = true; chunkStream = _v; }
        public byte[] chunkChecksum() { return chunkChecksum; }
        public void setChunkChecksum(byte[] _v) { _dirty = true; chunkChecksum = _v; }

        /**
         * Checksum of the uncompressed chunk. Used to detect whether a chunk
         * from an uncompressed source is identical to the compressed chunk.
         */
        public byte[] uncompressedChunkChecksum() { return uncompressedChunkChecksum; }
        public void setUncompressedChunkChecksum(byte[] _v) { _dirty = true; uncompressedChunkChecksum = _v; }
        public CompressedInteger lenChunk() { return lenChunk; }
        public void setLenChunk(CompressedInteger _v) { _dirty = true; lenChunk = _v; }
        public CompressedInteger lenUncompressedChunk() { return lenUncompressedChunk; }
        public void setLenUncompressedChunk(CompressedInteger _v) { _dirty = true; lenUncompressedChunk = _v; }
        public long lenChecksum() { return lenChecksum; }
        public void setLenChecksum(long _v) { _dirty = true; lenChecksum = _v; }
        public boolean hasDataStreams() { return hasDataStreams; }
        public void setHasDataStreams(boolean _v) { _dirty = true; hasDataStreams = _v; }
        public boolean hasUncompressedSource() { return hasUncompressedSource; }
        public void setHasUncompressedSource(boolean _v) { _dirty = true; hasUncompressedSource = _v; }
        public Zchunk _root() { return _root; }
        public void set_root(Zchunk _v) { _dirty = true; _root = _v; }
        public Zchunk.Index _parent() { return _parent; }
        public void set_parent(Zchunk.Index _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Like `/common/vlq_base128_le` (LEB128), but the logic of the
     * "continuation" flag in the most significant bit is inverted, so instead of
     * `has_next`, it is called `is_last` (if the highest bit is set to zero, it
     * means "continue", whereas in standard LEB128, the highest bit set to
     * **one** means "continue"). Therefore, we cannot simply import
     * `/common/vlq_base128_le` and use it, because it is incompatible.
     */
    public static class CompressedInteger extends KaitaiStruct.ReadWrite {
        public static CompressedInteger fromFile(String fileName) throws IOException {
            return new CompressedInteger(new ByteBufferKaitaiStream(fileName));
        }
        public CompressedInteger() {
            this(null, null, null);
        }

        public CompressedInteger(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CompressedInteger(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public CompressedInteger(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Zchunk _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.groups = new ArrayList<Group>();
            {
                Group _it;
                int i = 0;
                do {
                    Group _t_groups = new Group(this._io, this, _root, i);
                    try {
                        _t_groups._read();
                    } finally {
                        _it = _t_groups;
                        this.groups.add(_it);
                    }
                    i++;
                } while (!(_it.isLast()));
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.groups.size(); i++) {
                this.groups.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.groups.size(); i++) {
                this.groups.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.groups.size() == 0)
                throw new ConsistencyError("groups", 0, this.groups.size());
            for (int i = 0; i < this.groups.size(); i++) {
                if (!Objects.equals(this.groups.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("groups", _root(), this.groups.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.groups.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("groups", this, this.groups.get(((Number) (i)).intValue())._parent());
                if (this.groups.get(((Number) (i)).intValue()).idx() != i)
                    throw new ConsistencyError("groups", i, this.groups.get(((Number) (i)).intValue()).idx());
                {
                    Group _it = this.groups.get(((Number) (i)).intValue());
                    if (_it.isLast() != (i == this.groups.size() - 1))
                        throw new ConsistencyError("groups", i == this.groups.size() - 1, _it.isLast());
                }
            }
            _dirty = false;
        }

        /**
         * One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.
         */
        public static class Group extends KaitaiStruct.ReadWrite {
            public Group(int idx) {
                this(null, null, null, idx);
            }

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
            }
            public void _read() {
                this.isLast = this._io.readBitsIntBe(1) != 0;
                if (!(this.isLast == (idx() == 9 ? true : isLast()))) {
                    throw new KaitaiStream.ValidationNotEqualError((idx() == 9 ? true : isLast()), this.isLast, this._io, "/types/compressed_integer/types/group/seq/0");
                }
                this.value = this._io.readBitsIntBe(7);
                if (!(this.value <= ((Number) ((idx() == 9 ? 1 : 127))).longValue())) {
                    throw new KaitaiStream.ValidationGreaterThanError(((Number) ((idx() == 9 ? 1 : 127))).longValue(), this.value, this._io, "/types/compressed_integer/types/group/seq/1");
                }
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBitsIntBe(1, (this.isLast ? 1 : 0));
                this._io.writeBitsIntBe(7, this.value);
            }

            public void _check() {
                if (!(this.isLast == (idx() == 9 ? true : isLast()))) {
                    throw new KaitaiStream.ValidationNotEqualError((idx() == 9 ? true : isLast()), this.isLast, null, "/types/compressed_integer/types/group/seq/0");
                }
                if (!(this.value <= ((Number) ((idx() == 9 ? 1 : 127))).longValue())) {
                    throw new KaitaiStream.ValidationGreaterThanError(((Number) ((idx() == 9 ? 1 : 127))).longValue(), this.value, null, "/types/compressed_integer/types/group/seq/1");
                }
                _dirty = false;
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
            public void setIsLast(boolean _v) { _dirty = true; isLast = _v; }

            /**
             * The 7-bit (base128) numeric value chunk of this group
             * 
             * Since this implementation only supports integer values up to 64 bits,
             * the `value` in the 10th group (`groups[9]`) can only be `0` or `1`
             * (otherwise the width of the represented value would be 65 bits or
             * more, which is not supported).
             */
            public long value() { return value; }
            public void setValue(long _v) { _dirty = true; value = _v; }
            public int idx() { return idx; }
            public void setIdx(int _v) { _dirty = true; idx = _v; }
            public Zchunk _root() { return _root; }
            public void set_root(Zchunk _v) { _dirty = true; _root = _v; }
            public Zchunk.CompressedInteger _parent() { return _parent; }
            public void set_parent(Zchunk.CompressedInteger _v) { _dirty = true; _parent = _v; }
        }
        private Integer len;
        public Integer len() {
            if (this.len != null)
                return this.len;
            this.len = ((Number) (groups().size())).intValue();
            return this.len;
        }
        public void _invalidateLen() { this.len = null; }
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
        public void _invalidateValue() { this.value = null; }
        private List<Group> groups;
        private Zchunk _root;
        private KaitaiStruct.ReadWrite _parent;
        public List<Group> groups() { return groups; }
        public void setGroups(List<Group> _v) { _dirty = true; groups = _v; }
        public Zchunk _root() { return _root; }
        public void set_root(Zchunk _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class HeaderLead extends KaitaiStruct.ReadWrite {
        public static HeaderLead fromFile(String fileName) throws IOException {
            return new HeaderLead(new ByteBufferKaitaiStream(fileName));
        }
        public HeaderLead() {
            this(null, null, null);
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
        }
        public void _read() {
            this.magic = this._io.readBytes(5);
            if (!( ((Arrays.equals(this.magic, new byte[] { 0, 90, 67, 75, 49 })) || (Arrays.equals(this.magic, new byte[] { 0, 90, 72, 82, 49 }))) )) {
                throw new KaitaiStream.ValidationNotAnyOfError(this.magic, this._io, "/types/header_lead/seq/0");
            }
            this.overallChecksumType = new ChecksumType(this._io, this, _root);
            this.overallChecksumType._read();
            this.lenHeaderRest = new CompressedInteger(this._io, this, _root);
            this.lenHeaderRest._read();
            this.headerChecksum = this._io.readBytes(overallChecksumType().lenChecksum());
            _dirty = false;
        }

        public void _fetchInstances() {
            this.overallChecksumType._fetchInstances();
            this.lenHeaderRest._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this.overallChecksumType._write_Seq(this._io);
            this.lenHeaderRest._write_Seq(this._io);
            this._io.writeBytes(this.headerChecksum);
        }

        public void _check() {
            if (this.magic.length != 5)
                throw new ConsistencyError("magic", 5, this.magic.length);
            if (!( ((Arrays.equals(this.magic, new byte[] { 0, 90, 67, 75, 49 })) || (Arrays.equals(this.magic, new byte[] { 0, 90, 72, 82, 49 }))) )) {
                throw new KaitaiStream.ValidationNotAnyOfError(this.magic, null, "/types/header_lead/seq/0");
            }
            if (!Objects.equals(this.overallChecksumType._root(), _root()))
                throw new ConsistencyError("overall_checksum_type", _root(), this.overallChecksumType._root());
            if (!Objects.equals(this.overallChecksumType._parent(), this))
                throw new ConsistencyError("overall_checksum_type", this, this.overallChecksumType._parent());
            if (!Objects.equals(this.lenHeaderRest._root(), _root()))
                throw new ConsistencyError("len_header_rest", _root(), this.lenHeaderRest._root());
            if (!Objects.equals(this.lenHeaderRest._parent(), this))
                throw new ConsistencyError("len_header_rest", this, this.lenHeaderRest._parent());
            if (this.headerChecksum.length != overallChecksumType().lenChecksum())
                throw new ConsistencyError("header_checksum", overallChecksumType().lenChecksum(), this.headerChecksum.length);
            _dirty = false;
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
        public void _invalidateIsDetachedHeader() { this.isDetachedHeader = null; }
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
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }

        /**
         * Type of the checksum used for `header_checksum` and
         * `_root.header_rest.preface.data_checksum`.
         */
        public ChecksumType overallChecksumType() { return overallChecksumType; }
        public void setOverallChecksumType(ChecksumType _v) { _dirty = true; overallChecksumType = _v; }

        /**
         * Size of the header, not including the lead
         */
        public CompressedInteger lenHeaderRest() { return lenHeaderRest; }
        public void setLenHeaderRest(CompressedInteger _v) { _dirty = true; lenHeaderRest = _v; }

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
        public void setHeaderChecksum(byte[] _v) { _dirty = true; headerChecksum = _v; }
        public Zchunk _root() { return _root; }
        public void set_root(Zchunk _v) { _dirty = true; _root = _v; }
        public Zchunk _parent() { return _parent; }
        public void set_parent(Zchunk _v) { _dirty = true; _parent = _v; }
    }
    public static class HeaderWithoutLead extends KaitaiStruct.ReadWrite {
        public static HeaderWithoutLead fromFile(String fileName) throws IOException {
            return new HeaderWithoutLead(new ByteBufferKaitaiStream(fileName));
        }
        public HeaderWithoutLead() {
            this(null, null, null);
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
        }
        public void _read() {
            this.preface = new Preface(this._io, this, _root);
            this.preface._read();
            this.lenIndex = new CompressedInteger(this._io, this, _root);
            this.lenIndex._read();
            this._raw_index = this._io.readBytes(lenIndex().value());
            KaitaiStream _io__raw_index = new ByteBufferKaitaiStream(this._raw_index);
            this.index = new Index(_io__raw_index, this, _root);
            this.index._read();
            this.numSignatures = new CompressedInteger(this._io, this, _root);
            this.numSignatures._read();
            {
                CompressedInteger _it = this.numSignatures;
                if (!(_it.value() == 0)) {
                    throw new KaitaiStream.ValidationExprError(this.numSignatures, this._io, "/types/header_without_lead/seq/3");
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.preface._fetchInstances();
            this.lenIndex._fetchInstances();
            this.index._fetchInstances();
            this.numSignatures._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.preface._write_Seq(this._io);
            this.lenIndex._write_Seq(this._io);
            final KaitaiStream _io__raw_index = new ByteBufferKaitaiStream(lenIndex().value());
            this._io.addChildStream(_io__raw_index);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenIndex().value()));
                final HeaderWithoutLead _this = this;
                _io__raw_index.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_index = _io__raw_index.toByteArray();
                        if (_this._raw_index.length != lenIndex().value())
                            throw new ConsistencyError("raw(index)", lenIndex().value(), _this._raw_index.length);
                        parent.writeBytes(_this._raw_index);
                    }
                });
            }
            this.index._write_Seq(_io__raw_index);
            this.numSignatures._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.preface._root(), _root()))
                throw new ConsistencyError("preface", _root(), this.preface._root());
            if (!Objects.equals(this.preface._parent(), this))
                throw new ConsistencyError("preface", this, this.preface._parent());
            if (!Objects.equals(this.lenIndex._root(), _root()))
                throw new ConsistencyError("len_index", _root(), this.lenIndex._root());
            if (!Objects.equals(this.lenIndex._parent(), this))
                throw new ConsistencyError("len_index", this, this.lenIndex._parent());
            if (!Objects.equals(this.index._root(), _root()))
                throw new ConsistencyError("index", _root(), this.index._root());
            if (!Objects.equals(this.index._parent(), this))
                throw new ConsistencyError("index", this, this.index._parent());
            if (!Objects.equals(this.numSignatures._root(), _root()))
                throw new ConsistencyError("num_signatures", _root(), this.numSignatures._root());
            if (!Objects.equals(this.numSignatures._parent(), this))
                throw new ConsistencyError("num_signatures", this, this.numSignatures._parent());
            {
                CompressedInteger _it = this.numSignatures;
                if (!(_it.value() == 0)) {
                    throw new KaitaiStream.ValidationExprError(this.numSignatures, null, "/types/header_without_lead/seq/3");
                }
            }
            _dirty = false;
        }
        private Preface preface;
        private CompressedInteger lenIndex;
        private Index index;
        private CompressedInteger numSignatures;
        private Zchunk _root;
        private Zchunk _parent;
        private byte[] _raw_index;
        public Preface preface() { return preface; }
        public void setPreface(Preface _v) { _dirty = true; preface = _v; }
        public CompressedInteger lenIndex() { return lenIndex; }
        public void setLenIndex(CompressedInteger _v) { _dirty = true; lenIndex = _v; }
        public Index index() { return index; }
        public void setIndex(Index _v) { _dirty = true; index = _v; }

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
        public void setNumSignatures(CompressedInteger _v) { _dirty = true; numSignatures = _v; }
        public Zchunk _root() { return _root; }
        public void set_root(Zchunk _v) { _dirty = true; _root = _v; }
        public Zchunk _parent() { return _parent; }
        public void set_parent(Zchunk _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_index() { return _raw_index; }
        public void set_raw_Index(byte[] _v) { _dirty = true; _raw_index = _v; }
    }
    public static class Index extends KaitaiStruct.ReadWrite {
        public static Index fromFile(String fileName) throws IOException {
            return new Index(new ByteBufferKaitaiStream(fileName));
        }
        public Index() {
            this(null, null, null);
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
        }
        public void _read() {
            this.chunkChecksumType = new ChecksumType(this._io, this, _root);
            this.chunkChecksumType._read();
            this.numChunks = new CompressedInteger(this._io, this, _root);
            this.numChunks._read();
            {
                CompressedInteger _it = this.numChunks;
                if (!(_it.value() >= 1)) {
                    throw new KaitaiStream.ValidationExprError(this.numChunks, this._io, "/types/index/seq/1");
                }
            }
            if (_parent().preface().hasDataStreams()) {
                this.dictStream = new CompressedInteger(this._io, this, _root);
                this.dictStream._read();
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
            this.lenDict._read();
            this.lenUncompressedDict = new CompressedInteger(this._io, this, _root);
            this.lenUncompressedDict._read();
            this.chunksMetadata = new ArrayList<Chunk>();
            for (int i = 0; i < numDataChunks(); i++) {
                Chunk _t_chunksMetadata = new Chunk(this._io, this, _root, chunkChecksumType().lenChecksum(), _parent().preface().hasDataStreams(), _parent().preface().hasUncompressedSource());
                try {
                    _t_chunksMetadata._read();
                } finally {
                    this.chunksMetadata.add(_t_chunksMetadata);
                }
            }
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();
            this.chunkChecksumType._write_Seq(this._io);
            this.numChunks._write_Seq(this._io);
            if (_parent().preface().hasDataStreams()) {
                this.dictStream._write_Seq(this._io);
            }
            this._io.writeBytes(this.dictChecksum);
            if (_parent().preface().hasUncompressedSource()) {
                this._io.writeBytes(this.uncompressedDictChecksum);
            }
            this.lenDict._write_Seq(this._io);
            this.lenUncompressedDict._write_Seq(this._io);
            for (int i = 0; i < this.chunksMetadata.size(); i++) {
                this.chunksMetadata.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (!Objects.equals(this.chunkChecksumType._root(), _root()))
                throw new ConsistencyError("chunk_checksum_type", _root(), this.chunkChecksumType._root());
            if (!Objects.equals(this.chunkChecksumType._parent(), this))
                throw new ConsistencyError("chunk_checksum_type", this, this.chunkChecksumType._parent());
            if (!Objects.equals(this.numChunks._root(), _root()))
                throw new ConsistencyError("num_chunks", _root(), this.numChunks._root());
            if (!Objects.equals(this.numChunks._parent(), this))
                throw new ConsistencyError("num_chunks", this, this.numChunks._parent());
            {
                CompressedInteger _it = this.numChunks;
                if (!(_it.value() >= 1)) {
                    throw new KaitaiStream.ValidationExprError(this.numChunks, null, "/types/index/seq/1");
                }
            }
            if (_parent().preface().hasDataStreams()) {
                if (!Objects.equals(this.dictStream._root(), _root()))
                    throw new ConsistencyError("dict_stream", _root(), this.dictStream._root());
                if (!Objects.equals(this.dictStream._parent(), this))
                    throw new ConsistencyError("dict_stream", this, this.dictStream._parent());
                {
                    CompressedInteger _it = this.dictStream;
                    if (!(_it.value() == 0)) {
                        throw new KaitaiStream.ValidationExprError(this.dictStream, null, "/types/index/seq/2");
                    }
                }
            }
            if (this.dictChecksum.length != chunkChecksumType().lenChecksum())
                throw new ConsistencyError("dict_checksum", chunkChecksumType().lenChecksum(), this.dictChecksum.length);
            if (_parent().preface().hasUncompressedSource()) {
                if (this.uncompressedDictChecksum.length != chunkChecksumType().lenChecksum())
                    throw new ConsistencyError("uncompressed_dict_checksum", chunkChecksumType().lenChecksum(), this.uncompressedDictChecksum.length);
            }
            if (!Objects.equals(this.lenDict._root(), _root()))
                throw new ConsistencyError("len_dict", _root(), this.lenDict._root());
            if (!Objects.equals(this.lenDict._parent(), this))
                throw new ConsistencyError("len_dict", this, this.lenDict._parent());
            if (!Objects.equals(this.lenUncompressedDict._root(), _root()))
                throw new ConsistencyError("len_uncompressed_dict", _root(), this.lenUncompressedDict._root());
            if (!Objects.equals(this.lenUncompressedDict._parent(), this))
                throw new ConsistencyError("len_uncompressed_dict", this, this.lenUncompressedDict._parent());
            if (this.chunksMetadata.size() != numDataChunks())
                throw new ConsistencyError("chunks_metadata", numDataChunks(), this.chunksMetadata.size());
            for (int i = 0; i < this.chunksMetadata.size(); i++) {
                if (!Objects.equals(this.chunksMetadata.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("chunks_metadata", _root(), this.chunksMetadata.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.chunksMetadata.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("chunks_metadata", this, this.chunksMetadata.get(((Number) (i)).intValue())._parent());
                if (this.chunksMetadata.get(((Number) (i)).intValue()).lenChecksum() != chunkChecksumType().lenChecksum())
                    throw new ConsistencyError("chunks_metadata", chunkChecksumType().lenChecksum(), this.chunksMetadata.get(((Number) (i)).intValue()).lenChecksum());
                if (this.chunksMetadata.get(((Number) (i)).intValue()).hasDataStreams() != _parent().preface().hasDataStreams())
                    throw new ConsistencyError("chunks_metadata", _parent().preface().hasDataStreams(), this.chunksMetadata.get(((Number) (i)).intValue()).hasDataStreams());
                if (this.chunksMetadata.get(((Number) (i)).intValue()).hasUncompressedSource() != _parent().preface().hasUncompressedSource())
                    throw new ConsistencyError("chunks_metadata", _parent().preface().hasUncompressedSource(), this.chunksMetadata.get(((Number) (i)).intValue()).hasUncompressedSource());
            }
            _dirty = false;
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
        public void _invalidateNumDataChunks() { this.numDataChunks = null; }
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
        public void setChunkChecksumType(ChecksumType _v) { _dirty = true; chunkChecksumType = _v; }

        /**
         * Number of chunks, **including** the dictionary chunk.
         * 
         * Must be at least 1, because the dictionary chunk is always present,
         * even if it is empty. The reference implementation also fails when the
         * number of chunks is 0, see
         * [`src/lib/index/index_read.c:181-184`](https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/src/lib/index/index_read.c#L181-L184).
         */
        public CompressedInteger numChunks() { return numChunks; }
        public void setNumChunks(CompressedInteger _v) { _dirty = true; numChunks = _v; }

        /**
         * If present, it must always be 0.
         * @see <a href="https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L159-L162">Source</a>
         */
        public CompressedInteger dictStream() { return dictStream; }
        public void setDictStream(CompressedInteger _v) { _dirty = true; dictStream = _v; }
        public byte[] dictChecksum() { return dictChecksum; }
        public void setDictChecksum(byte[] _v) { _dirty = true; dictChecksum = _v; }

        /**
         * Checksum of the uncompressed dictionary. It has no real use, as the
         * uncompressed source won't have a dictionary.
         */
        public byte[] uncompressedDictChecksum() { return uncompressedDictChecksum; }
        public void setUncompressedDictChecksum(byte[] _v) { _dirty = true; uncompressedDictChecksum = _v; }
        public CompressedInteger lenDict() { return lenDict; }
        public void setLenDict(CompressedInteger _v) { _dirty = true; lenDict = _v; }
        public CompressedInteger lenUncompressedDict() { return lenUncompressedDict; }
        public void setLenUncompressedDict(CompressedInteger _v) { _dirty = true; lenUncompressedDict = _v; }

        /**
         * Metadata of the data chunks. The dictionary is chunk 0 and its
         * metadata is stored in the `*dict*` fields above, so there is one fewer
         * entry here than indicated by `num_chunks`.
         */
        public List<Chunk> chunksMetadata() { return chunksMetadata; }
        public void setChunksMetadata(List<Chunk> _v) { _dirty = true; chunksMetadata = _v; }
        public Zchunk _root() { return _root; }
        public void set_root(Zchunk _v) { _dirty = true; _root = _v; }
        public Zchunk.HeaderWithoutLead _parent() { return _parent; }
        public void set_parent(Zchunk.HeaderWithoutLead _v) { _dirty = true; _parent = _v; }
    }
    public static class OptionalElement extends KaitaiStruct.ReadWrite {
        public static OptionalElement fromFile(String fileName) throws IOException {
            return new OptionalElement(new ByteBufferKaitaiStream(fileName));
        }
        public OptionalElement() {
            this(null, null, null);
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
        }
        public void _read() {
            this.elementId = new CompressedInteger(this._io, this, _root);
            this.elementId._read();
            this.lenData = new CompressedInteger(this._io, this, _root);
            this.lenData._read();
            this.data = this._io.readBytes(lenData().value());
            _dirty = false;
        }

        public void _fetchInstances() {
            this.elementId._fetchInstances();
            this.lenData._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.elementId._write_Seq(this._io);
            this.lenData._write_Seq(this._io);
            this._io.writeBytes(this.data);
        }

        public void _check() {
            if (!Objects.equals(this.elementId._root(), _root()))
                throw new ConsistencyError("element_id", _root(), this.elementId._root());
            if (!Objects.equals(this.elementId._parent(), this))
                throw new ConsistencyError("element_id", this, this.elementId._parent());
            if (!Objects.equals(this.lenData._root(), _root()))
                throw new ConsistencyError("len_data", _root(), this.lenData._root());
            if (!Objects.equals(this.lenData._parent(), this))
                throw new ConsistencyError("len_data", this, this.lenData._parent());
            if (this.data.length != lenData().value())
                throw new ConsistencyError("data", lenData().value(), this.data.length);
            _dirty = false;
        }
        private CompressedInteger elementId;
        private CompressedInteger lenData;
        private byte[] data;
        private Zchunk _root;
        private Zchunk.Preface _parent;
        public CompressedInteger elementId() { return elementId; }
        public void setElementId(CompressedInteger _v) { _dirty = true; elementId = _v; }
        public CompressedInteger lenData() { return lenData; }
        public void setLenData(CompressedInteger _v) { _dirty = true; lenData = _v; }
        public byte[] data() { return data; }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public Zchunk _root() { return _root; }
        public void set_root(Zchunk _v) { _dirty = true; _root = _v; }
        public Zchunk.Preface _parent() { return _parent; }
        public void set_parent(Zchunk.Preface _v) { _dirty = true; _parent = _v; }
    }
    public static class Preface extends KaitaiStruct.ReadWrite {
        public static Preface fromFile(String fileName) throws IOException {
            return new Preface(new ByteBufferKaitaiStream(fileName));
        }
        public Preface() {
            this(null, null, null);
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
        }
        public void _read() {
            this.dataChecksum = this._io.readBytes(_root().lead().overallChecksumType().lenChecksum());
            this.flags = new CompressedInteger(this._io, this, _root);
            this.flags._read();
            {
                CompressedInteger _it = this.flags;
                if (!(_it.value() <= 7)) {
                    throw new KaitaiStream.ValidationExprError(this.flags, this._io, "/types/preface/seq/1");
                }
            }
            this.compressionTypeInt = new CompressedInteger(this._io, this, _root);
            this.compressionTypeInt._read();
            {
                CompressedInteger _it = this.compressionTypeInt;
                if (!( ((_it.value() == Zchunk.CompressionTypes.NONE.id()) || (_it.value() == Zchunk.CompressionTypes.ZSTD.id())) )) {
                    throw new KaitaiStream.ValidationExprError(this.compressionTypeInt, this._io, "/types/preface/seq/2");
                }
            }
            if (hasOptionalElements()) {
                this.numOptionalElements = new CompressedInteger(this._io, this, _root);
                this.numOptionalElements._read();
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
                    OptionalElement _t_optionalElements = new OptionalElement(this._io, this, _root);
                    try {
                        _t_optionalElements._read();
                    } finally {
                        this.optionalElements.add(_t_optionalElements);
                    }
                }
            }
            _dirty = false;
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

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.dataChecksum);
            this.flags._write_Seq(this._io);
            this.compressionTypeInt._write_Seq(this._io);
            if (hasOptionalElements()) {
                this.numOptionalElements._write_Seq(this._io);
            }
            if (hasOptionalElements()) {
                for (int i = 0; i < this.optionalElements.size(); i++) {
                    this.optionalElements.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }
        }

        public void _check() {
            if (this.dataChecksum.length != _root().lead().overallChecksumType().lenChecksum())
                throw new ConsistencyError("data_checksum", _root().lead().overallChecksumType().lenChecksum(), this.dataChecksum.length);
            if (!Objects.equals(this.flags._root(), _root()))
                throw new ConsistencyError("flags", _root(), this.flags._root());
            if (!Objects.equals(this.flags._parent(), this))
                throw new ConsistencyError("flags", this, this.flags._parent());
            {
                CompressedInteger _it = this.flags;
                if (!(_it.value() <= 7)) {
                    throw new KaitaiStream.ValidationExprError(this.flags, null, "/types/preface/seq/1");
                }
            }
            if (!Objects.equals(this.compressionTypeInt._root(), _root()))
                throw new ConsistencyError("compression_type_int", _root(), this.compressionTypeInt._root());
            if (!Objects.equals(this.compressionTypeInt._parent(), this))
                throw new ConsistencyError("compression_type_int", this, this.compressionTypeInt._parent());
            {
                CompressedInteger _it = this.compressionTypeInt;
                if (!( ((_it.value() == Zchunk.CompressionTypes.NONE.id()) || (_it.value() == Zchunk.CompressionTypes.ZSTD.id())) )) {
                    throw new KaitaiStream.ValidationExprError(this.compressionTypeInt, null, "/types/preface/seq/2");
                }
            }
            if (hasOptionalElements()) {
                if (!Objects.equals(this.numOptionalElements._root(), _root()))
                    throw new ConsistencyError("num_optional_elements", _root(), this.numOptionalElements._root());
                if (!Objects.equals(this.numOptionalElements._parent(), this))
                    throw new ConsistencyError("num_optional_elements", this, this.numOptionalElements._parent());
                {
                    CompressedInteger _it = this.numOptionalElements;
                    if (!(_it.value() >= 1)) {
                        throw new KaitaiStream.ValidationExprError(this.numOptionalElements, null, "/types/preface/seq/3");
                    }
                }
            }
            if (hasOptionalElements()) {
                if (this.optionalElements.size() != numOptionalElements().value())
                    throw new ConsistencyError("optional_elements", numOptionalElements().value(), this.optionalElements.size());
                for (int i = 0; i < this.optionalElements.size(); i++) {
                    if (!Objects.equals(this.optionalElements.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("optional_elements", _root(), this.optionalElements.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.optionalElements.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("optional_elements", this, this.optionalElements.get(((Number) (i)).intValue())._parent());
                }
            }
            _dirty = false;
        }
        private CompressionTypes compressionType;
        public CompressionTypes compressionType() {
            if (this.compressionType != null)
                return this.compressionType;
            this.compressionType = Zchunk.CompressionTypes.byId(compressionTypeInt().value());
            return this.compressionType;
        }
        public void _invalidateCompressionType() { this.compressionType = null; }
        private Boolean hasDataStreams;
        public Boolean hasDataStreams() {
            if (this.hasDataStreams != null)
                return this.hasDataStreams;
            this.hasDataStreams = (flags().value() & 1) != 0;
            return this.hasDataStreams;
        }
        public void _invalidateHasDataStreams() { this.hasDataStreams = null; }
        private Boolean hasOptionalElements;
        public Boolean hasOptionalElements() {
            if (this.hasOptionalElements != null)
                return this.hasOptionalElements;
            this.hasOptionalElements = (flags().value() & 2) != 0;
            return this.hasOptionalElements;
        }
        public void _invalidateHasOptionalElements() { this.hasOptionalElements = null; }
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
        public void _invalidateHasUncompressedSource() { this.hasUncompressedSource = null; }
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
        public void setDataChecksum(byte[] _v) { _dirty = true; dataChecksum = _v; }

        /**
         * Compressed integer containing a bitmask of the flags. All unused flags
         * MUST be set to 0. If a decoder sees a flag set that it doesn't
         * recognize, it MUST exit with an error.
         * @see <a href="https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L78-L81">Source</a>
         */
        public CompressedInteger flags() { return flags; }
        public void setFlags(CompressedInteger _v) { _dirty = true; flags = _v; }

        /**
         * Raw integer, don't read this field - access `compression_type`
         * instead.
         */
        public CompressedInteger compressionTypeInt() { return compressionTypeInt; }
        public void setCompressionTypeInt(CompressedInteger _v) { _dirty = true; compressionTypeInt = _v; }

        /**
         * If present, it must be at least 1. This is because if there are no
         * optional elements, `has_optional_elements` must be false, and then
         * neither this field nor `optional_elements` is present.
         * @see <a href="https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt#L99-L102">Source</a>
         */
        public CompressedInteger numOptionalElements() { return numOptionalElements; }
        public void setNumOptionalElements(CompressedInteger _v) { _dirty = true; numOptionalElements = _v; }
        public List<OptionalElement> optionalElements() { return optionalElements; }
        public void setOptionalElements(List<OptionalElement> _v) { _dirty = true; optionalElements = _v; }
        public Zchunk _root() { return _root; }
        public void set_root(Zchunk _v) { _dirty = true; _root = _v; }
        public Zchunk.HeaderWithoutLead _parent() { return _parent; }
        public void set_parent(Zchunk.HeaderWithoutLead _v) { _dirty = true; _parent = _v; }
    }
    private HeaderLead lead;
    private HeaderWithoutLead headerRest;
    private byte[] dict;
    private List<byte[]> chunks;
    private Zchunk _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_headerRest;
    public HeaderLead lead() { return lead; }
    public void setLead(HeaderLead _v) { _dirty = true; lead = _v; }
    public HeaderWithoutLead headerRest() { return headerRest; }
    public void setHeaderRest(HeaderWithoutLead _v) { _dirty = true; headerRest = _v; }

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
    public void setDict(byte[] _v) { _dirty = true; dict = _v; }

    /**
     * Chunks of data, each compressed with the custom dictionary `dict` (if
     * applicable).
     * 
     * They are not included in a detached header (`.zhr`) file. Detached headers
     * contain the dictionary, but none of the data chunks.
     */
    public List<byte[]> chunks() { return chunks; }
    public void setChunks(List<byte[]> _v) { _dirty = true; chunks = _v; }
    public Zchunk _root() { return _root; }
    public void set_root(Zchunk _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_headerRest() { return _raw_headerRest; }
    public void set_raw_HeaderRest(byte[] _v) { _dirty = true; _raw_headerRest = _v; }
}

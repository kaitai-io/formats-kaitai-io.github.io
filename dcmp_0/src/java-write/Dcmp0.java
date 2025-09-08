// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.Arrays;


/**
 * Compressed resource data in `'dcmp' (0)` format,
 * as stored in compressed resources with header type `8` and decompressor ID `0`.
 * 
 * The `'dcmp' (0)` decompressor resource is included in the System file of System 7.0 and later.
 * This compression format is used for most compressed resources in System 7.0's files.
 * This decompressor is also included with and used by some other Apple applications,
 * such as ResEdit.
 * 
 * This compression format supports some basic general-purpose compression schemes,
 * including backreferences to previous data,
 * run-length encoding,
 * and delta encoding.
 * It also includes some types of compression tailored specifically to Mac OS resources,
 * including a set of single-byte codes that correspond to entries in a hard-coded lookup table,
 * and a specialized kind of delta encoding for segment loader jump tables.
 * 
 * Almost all parts of this compression format operate on units of 2 or 4 bytes.
 * As a result,
 * it is nearly impossible to store data with an odd length in this format.
 * To work around this limitation,
 * odd-length resources are padded with an extra byte before compressing them with this format.
 * This extra byte is ignored after decompression,
 * as the real (odd) length of the resource is stored in the compressed resource header.
 * 
 * The `'dcmp' (1)` compression format (see dcmp_1.ksy) is very similar to this format,
 * with the main difference that it operates mostly on single bytes rather than two-byte units.
 * @see <a href="https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/dcmp0.py">Source</a>
 */
public class Dcmp0 extends KaitaiStruct.ReadWrite {
    public static Dcmp0 fromFile(String fileName) throws IOException {
        return new Dcmp0(new ByteBufferKaitaiStream(fileName));
    }
    public Dcmp0() {
        this(null, null, null);
    }

    public Dcmp0(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Dcmp0(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Dcmp0(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Dcmp0 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.chunks = new ArrayList<Chunk>();
        {
            Chunk _it;
            int i = 0;
            do {
                Chunk _t_chunks = new Chunk(this._io, this, _root);
                try {
                    _t_chunks._read();
                } finally {
                    _it = _t_chunks;
                    this.chunks.add(_it);
                }
                i++;
            } while (!(_it.tag() == 255));
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.chunks.size(); i++) {
            this.chunks.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        for (int i = 0; i < this.chunks.size(); i++) {
            this.chunks.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (this.chunks.size() == 0)
            throw new ConsistencyError("chunks", 0, this.chunks.size());
        for (int i = 0; i < this.chunks.size(); i++) {
            if (!Objects.equals(this.chunks.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("chunks", _root(), this.chunks.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.chunks.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("chunks", this, this.chunks.get(((Number) (i)).intValue())._parent());
            {
                Chunk _it = this.chunks.get(((Number) (i)).intValue());
                if ((_it.tag() == 255) != (i == this.chunks.size() - 1))
                    throw new ConsistencyError("chunks", i == this.chunks.size() - 1, _it.tag() == 255);
            }
        }
        _dirty = false;
    }

    /**
     * A single chunk of compressed data.
     * Each chunk in the compressed data expands to a sequence of bytes in the uncompressed data,
     * except when `tag == 0xff`,
     * which marks the end of the data and does not correspond to any bytes in the uncompressed data.
     * 
     * Most chunks are stateless and always expand to the same data,
     * regardless of where the chunk appears in the sequence.
     * However,
     * some chunks affect the behavior of future chunks,
     * or expand to different data depending on which chunks came before them.
     */
    public static class Chunk extends KaitaiStruct.ReadWrite {
        public static Chunk fromFile(String fileName) throws IOException {
            return new Chunk(new ByteBufferKaitaiStream(fileName));
        }

        public enum TagKind {
            INVALID(-1),
            LITERAL(0),
            BACKREFERENCE(1),
            TABLE_LOOKUP(2),
            EXTENDED(3),
            END(4);

            private final long id;
            TagKind(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, TagKind> byId = new HashMap<Long, TagKind>(6);
            static {
                for (TagKind e : TagKind.values())
                    byId.put(e.id(), e);
            }
            public static TagKind byId(long id) { return byId.get(id); }
        }
        public Chunk() {
            this(null, null, null);
        }

        public Chunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Chunk(KaitaiStream _io, Dcmp0 _parent) {
            this(_io, _parent, null);
        }

        public Chunk(KaitaiStream _io, Dcmp0 _parent, Dcmp0 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.tag = this._io.readU1();
            {
                TagKind on = ( ((tag() >= 0) && (tag() <= 31))  ? TagKind.LITERAL : ( ((tag() >= 32) && (tag() <= 74))  ? TagKind.BACKREFERENCE : ( ((tag() >= 75) && (tag() <= 253))  ? TagKind.TABLE_LOOKUP : (tag() == 254 ? TagKind.EXTENDED : (tag() == 255 ? TagKind.END : TagKind.INVALID)))));
                if (on != null) {
                    switch (( ((tag() >= 0) && (tag() <= 31))  ? TagKind.LITERAL : ( ((tag() >= 32) && (tag() <= 74))  ? TagKind.BACKREFERENCE : ( ((tag() >= 75) && (tag() <= 253))  ? TagKind.TABLE_LOOKUP : (tag() == 254 ? TagKind.EXTENDED : (tag() == 255 ? TagKind.END : TagKind.INVALID)))))) {
                    case BACKREFERENCE: {
                        this.body = new BackreferenceBody(this._io, this, _root, tag());
                        ((BackreferenceBody) (this.body))._read();
                        break;
                    }
                    case END: {
                        this.body = new EndBody(this._io, this, _root);
                        ((EndBody) (this.body))._read();
                        break;
                    }
                    case EXTENDED: {
                        this.body = new ExtendedBody(this._io, this, _root);
                        ((ExtendedBody) (this.body))._read();
                        break;
                    }
                    case LITERAL: {
                        this.body = new LiteralBody(this._io, this, _root, tag());
                        ((LiteralBody) (this.body))._read();
                        break;
                    }
                    case TABLE_LOOKUP: {
                        this.body = new TableLookupBody(this._io, this, _root, tag());
                        ((TableLookupBody) (this.body))._read();
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                TagKind on = ( ((tag() >= 0) && (tag() <= 31))  ? TagKind.LITERAL : ( ((tag() >= 32) && (tag() <= 74))  ? TagKind.BACKREFERENCE : ( ((tag() >= 75) && (tag() <= 253))  ? TagKind.TABLE_LOOKUP : (tag() == 254 ? TagKind.EXTENDED : (tag() == 255 ? TagKind.END : TagKind.INVALID)))));
                if (on != null) {
                    switch (( ((tag() >= 0) && (tag() <= 31))  ? TagKind.LITERAL : ( ((tag() >= 32) && (tag() <= 74))  ? TagKind.BACKREFERENCE : ( ((tag() >= 75) && (tag() <= 253))  ? TagKind.TABLE_LOOKUP : (tag() == 254 ? TagKind.EXTENDED : (tag() == 255 ? TagKind.END : TagKind.INVALID)))))) {
                    case BACKREFERENCE: {
                        ((BackreferenceBody) (this.body))._fetchInstances();
                        break;
                    }
                    case END: {
                        ((EndBody) (this.body))._fetchInstances();
                        break;
                    }
                    case EXTENDED: {
                        ((ExtendedBody) (this.body))._fetchInstances();
                        break;
                    }
                    case LITERAL: {
                        ((LiteralBody) (this.body))._fetchInstances();
                        break;
                    }
                    case TABLE_LOOKUP: {
                        ((TableLookupBody) (this.body))._fetchInstances();
                        break;
                    }
                    }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.tag);
            {
                TagKind on = ( ((tag() >= 0) && (tag() <= 31))  ? TagKind.LITERAL : ( ((tag() >= 32) && (tag() <= 74))  ? TagKind.BACKREFERENCE : ( ((tag() >= 75) && (tag() <= 253))  ? TagKind.TABLE_LOOKUP : (tag() == 254 ? TagKind.EXTENDED : (tag() == 255 ? TagKind.END : TagKind.INVALID)))));
                if (on != null) {
                    switch (( ((tag() >= 0) && (tag() <= 31))  ? TagKind.LITERAL : ( ((tag() >= 32) && (tag() <= 74))  ? TagKind.BACKREFERENCE : ( ((tag() >= 75) && (tag() <= 253))  ? TagKind.TABLE_LOOKUP : (tag() == 254 ? TagKind.EXTENDED : (tag() == 255 ? TagKind.END : TagKind.INVALID)))))) {
                    case BACKREFERENCE: {
                        ((BackreferenceBody) (this.body))._write_Seq(this._io);
                        break;
                    }
                    case END: {
                        ((EndBody) (this.body))._write_Seq(this._io);
                        break;
                    }
                    case EXTENDED: {
                        ((ExtendedBody) (this.body))._write_Seq(this._io);
                        break;
                    }
                    case LITERAL: {
                        ((LiteralBody) (this.body))._write_Seq(this._io);
                        break;
                    }
                    case TABLE_LOOKUP: {
                        ((TableLookupBody) (this.body))._write_Seq(this._io);
                        break;
                    }
                    }
                }
            }
        }

        public void _check() {
            {
                TagKind on = ( ((tag() >= 0) && (tag() <= 31))  ? TagKind.LITERAL : ( ((tag() >= 32) && (tag() <= 74))  ? TagKind.BACKREFERENCE : ( ((tag() >= 75) && (tag() <= 253))  ? TagKind.TABLE_LOOKUP : (tag() == 254 ? TagKind.EXTENDED : (tag() == 255 ? TagKind.END : TagKind.INVALID)))));
                if (on != null) {
                    switch (( ((tag() >= 0) && (tag() <= 31))  ? TagKind.LITERAL : ( ((tag() >= 32) && (tag() <= 74))  ? TagKind.BACKREFERENCE : ( ((tag() >= 75) && (tag() <= 253))  ? TagKind.TABLE_LOOKUP : (tag() == 254 ? TagKind.EXTENDED : (tag() == 255 ? TagKind.END : TagKind.INVALID)))))) {
                    case BACKREFERENCE: {
                        if (!Objects.equals(((Dcmp0.Chunk.BackreferenceBody) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Dcmp0.Chunk.BackreferenceBody) (this.body))._root());
                        if (!Objects.equals(((Dcmp0.Chunk.BackreferenceBody) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Dcmp0.Chunk.BackreferenceBody) (this.body))._parent());
                        if (((Dcmp0.Chunk.BackreferenceBody) (this.body)).tag() != tag())
                            throw new ConsistencyError("body", tag(), ((Dcmp0.Chunk.BackreferenceBody) (this.body)).tag());
                        break;
                    }
                    case END: {
                        if (!Objects.equals(((Dcmp0.Chunk.EndBody) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Dcmp0.Chunk.EndBody) (this.body))._root());
                        if (!Objects.equals(((Dcmp0.Chunk.EndBody) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Dcmp0.Chunk.EndBody) (this.body))._parent());
                        break;
                    }
                    case EXTENDED: {
                        if (!Objects.equals(((Dcmp0.Chunk.ExtendedBody) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Dcmp0.Chunk.ExtendedBody) (this.body))._root());
                        if (!Objects.equals(((Dcmp0.Chunk.ExtendedBody) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Dcmp0.Chunk.ExtendedBody) (this.body))._parent());
                        break;
                    }
                    case LITERAL: {
                        if (!Objects.equals(((Dcmp0.Chunk.LiteralBody) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Dcmp0.Chunk.LiteralBody) (this.body))._root());
                        if (!Objects.equals(((Dcmp0.Chunk.LiteralBody) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Dcmp0.Chunk.LiteralBody) (this.body))._parent());
                        if (((Dcmp0.Chunk.LiteralBody) (this.body)).tag() != tag())
                            throw new ConsistencyError("body", tag(), ((Dcmp0.Chunk.LiteralBody) (this.body)).tag());
                        break;
                    }
                    case TABLE_LOOKUP: {
                        if (!Objects.equals(((Dcmp0.Chunk.TableLookupBody) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Dcmp0.Chunk.TableLookupBody) (this.body))._root());
                        if (!Objects.equals(((Dcmp0.Chunk.TableLookupBody) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Dcmp0.Chunk.TableLookupBody) (this.body))._parent());
                        if (((Dcmp0.Chunk.TableLookupBody) (this.body)).tag() != tag())
                            throw new ConsistencyError("body", tag(), ((Dcmp0.Chunk.TableLookupBody) (this.body)).tag());
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }

        /**
         * The body of a backreference chunk.
         * 
         * This chunk expands to the data stored in a preceding literal chunk,
         * indicated by an index number (`index`).
         */
        public static class BackreferenceBody extends KaitaiStruct.ReadWrite {
            public BackreferenceBody(int tag) {
                this(null, null, null, tag);
            }

            public BackreferenceBody(KaitaiStream _io, int tag) {
                this(_io, null, null, tag);
            }

            public BackreferenceBody(KaitaiStream _io, Dcmp0.Chunk _parent, int tag) {
                this(_io, _parent, null, tag);
            }

            public BackreferenceBody(KaitaiStream _io, Dcmp0.Chunk _parent, Dcmp0 _root, int tag) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this.tag = tag;
            }
            public void _read() {
                if (isIndexSeparate()) {
                    switch (tag()) {
                    case 32: {
                        this.indexSeparateMinus = ((Number) (this._io.readU1())).intValue();
                        break;
                    }
                    case 33: {
                        this.indexSeparateMinus = ((Number) (this._io.readU1())).intValue();
                        break;
                    }
                    case 34: {
                        this.indexSeparateMinus = this._io.readU2be();
                        break;
                    }
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                if (isIndexSeparate()) {
                    switch (tag()) {
                    case 32: {
                        break;
                    }
                    case 33: {
                        break;
                    }
                    case 34: {
                        break;
                    }
                    }
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                if (isIndexSeparate()) {
                    switch (tag()) {
                    case 32: {
                        this._io.writeU1(((Number) (this.indexSeparateMinus)).intValue());
                        break;
                    }
                    case 33: {
                        this._io.writeU1(((Number) (this.indexSeparateMinus)).intValue());
                        break;
                    }
                    case 34: {
                        this._io.writeU2be(this.indexSeparateMinus);
                        break;
                    }
                    }
                }
            }

            public void _check() {
                if (isIndexSeparate()) {
                    switch (tag()) {
                    case 32: {
                        break;
                    }
                    case 33: {
                        break;
                    }
                    case 34: {
                        break;
                    }
                    }
                }
                _dirty = false;
            }
            private Integer index;

            /**
             * The index of the referenced literal chunk.
             * 
             * Stored literals are assigned index numbers in the order in which they appear in the compressed data,
             * starting at 0.
             * Non-stored literals are not counted in the numbering and cannot be referenced using backreferences.
             * Once an index is assigned to a stored literal,
             * it is never changed or unassigned for the entire length of the compressed data.
             * 
             * As the name indicates,
             * a backreference can only reference stored literal chunks found *before* the backreference,
             * not ones that come after it.
             */
            public Integer index() {
                if (this.index != null)
                    return this.index;
                this.index = ((Number) ((isIndexSeparate() ? indexSeparate() : indexInTag()))).intValue();
                return this.index;
            }
            public void _invalidateIndex() { this.index = null; }
            private Integer indexInTag;

            /**
             * The index of the referenced literal chunk,
             * as stored in the tag byte.
             */
            public Integer indexInTag() {
                if (this.indexInTag != null)
                    return this.indexInTag;
                this.indexInTag = ((Number) (tag() - 35)).intValue();
                return this.indexInTag;
            }
            public void _invalidateIndexInTag() { this.indexInTag = null; }
            private Integer indexSeparate;

            /**
             * The index of the referenced literal chunk,
             * as stored separately from the tag byte,
             * with the implicit offset corrected for.
             */
            public Integer indexSeparate() {
                if (this.indexSeparate != null)
                    return this.indexSeparate;
                if (isIndexSeparate()) {
                    this.indexSeparate = ((Number) ((indexSeparateMinus() + 40) + (tag() == 33 ? 256 : 0))).intValue();
                }
                return this.indexSeparate;
            }
            public void _invalidateIndexSeparate() { this.indexSeparate = null; }
            private Boolean isIndexSeparate;

            /**
             * Whether the index is stored separately from the tag.
             */
            public Boolean isIndexSeparate() {
                if (this.isIndexSeparate != null)
                    return this.isIndexSeparate;
                this.isIndexSeparate =  ((tag() >= 32) && (tag() <= 34)) ;
                return this.isIndexSeparate;
            }
            public void _invalidateIsIndexSeparate() { this.isIndexSeparate = null; }
            private Integer indexSeparateMinus;
            private int tag;
            private Dcmp0 _root;
            private Dcmp0.Chunk _parent;

            /**
             * The index of the referenced literal chunk,
             * stored separately from the tag.
             * The value in this field is stored minus 0x28.
             * If the tag byte is 0x21,
             * the value is also stored minus 0x100,
             * *on top of* the regular offset
             * (i. e. minus 0x128 in total).
             * 
             * In other words,
             * for tag bytes 0x20 and 0x21,
             * the index is actually 9 bits large,
             * with the low 8 bits stored separately and the highest bit stored in the lowest bit of the tag byte.
             * 
             * This field is only present if the tag byte is 0x20 through 0x22.
             * For higher tag bytes,
             * the index is encoded in the tag byte.
             * Values smaller than 0x28 cannot be stored in this field,
             * they must always be encoded in the tag byte.
             */
            public Integer indexSeparateMinus() { return indexSeparateMinus; }
            public void setIndexSeparateMinus(Integer _v) { _dirty = true; indexSeparateMinus = _v; }

            /**
             * The tag byte preceding this chunk body.
             */
            public int tag() { return tag; }
            public void setTag(int _v) { _dirty = true; tag = _v; }
            public Dcmp0 _root() { return _root; }
            public void set_root(Dcmp0 _v) { _dirty = true; _root = _v; }
            public Dcmp0.Chunk _parent() { return _parent; }
            public void set_parent(Dcmp0.Chunk _v) { _dirty = true; _parent = _v; }
        }

        /**
         * The body of an end chunk.
         * This body is always empty.
         * 
         * The last chunk in the compressed data must always be an end chunk.
         * An end chunk cannot appear elsewhere in the compressed data.
         */
        public static class EndBody extends KaitaiStruct.ReadWrite {
            public static EndBody fromFile(String fileName) throws IOException {
                return new EndBody(new ByteBufferKaitaiStream(fileName));
            }
            public EndBody() {
                this(null, null, null);
            }

            public EndBody(KaitaiStream _io) {
                this(_io, null, null);
            }

            public EndBody(KaitaiStream _io, Dcmp0.Chunk _parent) {
                this(_io, _parent, null);
            }

            public EndBody(KaitaiStream _io, Dcmp0.Chunk _parent, Dcmp0 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
            }

            public void _check() {
                _dirty = false;
            }
            private Dcmp0 _root;
            private Dcmp0.Chunk _parent;
            public Dcmp0 _root() { return _root; }
            public void set_root(Dcmp0 _v) { _dirty = true; _root = _v; }
            public Dcmp0.Chunk _parent() { return _parent; }
            public void set_parent(Dcmp0.Chunk _v) { _dirty = true; _parent = _v; }
        }

        /**
         * The body of an extended chunk.
         * The meaning of this chunk depends on the extended tag byte stored in the chunk data.
         */
        public static class ExtendedBody extends KaitaiStruct.ReadWrite {
            public static ExtendedBody fromFile(String fileName) throws IOException {
                return new ExtendedBody(new ByteBufferKaitaiStream(fileName));
            }
            public ExtendedBody() {
                this(null, null, null);
            }

            public ExtendedBody(KaitaiStream _io) {
                this(_io, null, null);
            }

            public ExtendedBody(KaitaiStream _io, Dcmp0.Chunk _parent) {
                this(_io, _parent, null);
            }

            public ExtendedBody(KaitaiStream _io, Dcmp0.Chunk _parent, Dcmp0 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.tag = this._io.readU1();
                switch (tag()) {
                case 0: {
                    this.body = new JumpTableBody(this._io, this, _root);
                    ((JumpTableBody) (this.body))._read();
                    break;
                }
                case 2: {
                    this.body = new RepeatBody(this._io, this, _root, tag());
                    ((RepeatBody) (this.body))._read();
                    break;
                }
                case 3: {
                    this.body = new RepeatBody(this._io, this, _root, tag());
                    ((RepeatBody) (this.body))._read();
                    break;
                }
                case 4: {
                    this.body = new DeltaEncoding16BitBody(this._io, this, _root);
                    ((DeltaEncoding16BitBody) (this.body))._read();
                    break;
                }
                case 6: {
                    this.body = new DeltaEncoding32BitBody(this._io, this, _root);
                    ((DeltaEncoding32BitBody) (this.body))._read();
                    break;
                }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                switch (tag()) {
                case 0: {
                    ((JumpTableBody) (this.body))._fetchInstances();
                    break;
                }
                case 2: {
                    ((RepeatBody) (this.body))._fetchInstances();
                    break;
                }
                case 3: {
                    ((RepeatBody) (this.body))._fetchInstances();
                    break;
                }
                case 4: {
                    ((DeltaEncoding16BitBody) (this.body))._fetchInstances();
                    break;
                }
                case 6: {
                    ((DeltaEncoding32BitBody) (this.body))._fetchInstances();
                    break;
                }
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(this.tag);
                switch (tag()) {
                case 0: {
                    ((JumpTableBody) (this.body))._write_Seq(this._io);
                    break;
                }
                case 2: {
                    ((RepeatBody) (this.body))._write_Seq(this._io);
                    break;
                }
                case 3: {
                    ((RepeatBody) (this.body))._write_Seq(this._io);
                    break;
                }
                case 4: {
                    ((DeltaEncoding16BitBody) (this.body))._write_Seq(this._io);
                    break;
                }
                case 6: {
                    ((DeltaEncoding32BitBody) (this.body))._write_Seq(this._io);
                    break;
                }
                }
            }

            public void _check() {
                switch (tag()) {
                case 0: {
                    if (!Objects.equals(((Dcmp0.Chunk.ExtendedBody.JumpTableBody) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Dcmp0.Chunk.ExtendedBody.JumpTableBody) (this.body))._root());
                    if (!Objects.equals(((Dcmp0.Chunk.ExtendedBody.JumpTableBody) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Dcmp0.Chunk.ExtendedBody.JumpTableBody) (this.body))._parent());
                    break;
                }
                case 2: {
                    if (!Objects.equals(((Dcmp0.Chunk.ExtendedBody.RepeatBody) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Dcmp0.Chunk.ExtendedBody.RepeatBody) (this.body))._root());
                    if (!Objects.equals(((Dcmp0.Chunk.ExtendedBody.RepeatBody) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Dcmp0.Chunk.ExtendedBody.RepeatBody) (this.body))._parent());
                    if (((Dcmp0.Chunk.ExtendedBody.RepeatBody) (this.body)).tag() != tag())
                        throw new ConsistencyError("body", tag(), ((Dcmp0.Chunk.ExtendedBody.RepeatBody) (this.body)).tag());
                    break;
                }
                case 3: {
                    if (!Objects.equals(((Dcmp0.Chunk.ExtendedBody.RepeatBody) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Dcmp0.Chunk.ExtendedBody.RepeatBody) (this.body))._root());
                    if (!Objects.equals(((Dcmp0.Chunk.ExtendedBody.RepeatBody) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Dcmp0.Chunk.ExtendedBody.RepeatBody) (this.body))._parent());
                    if (((Dcmp0.Chunk.ExtendedBody.RepeatBody) (this.body)).tag() != tag())
                        throw new ConsistencyError("body", tag(), ((Dcmp0.Chunk.ExtendedBody.RepeatBody) (this.body)).tag());
                    break;
                }
                case 4: {
                    if (!Objects.equals(((Dcmp0.Chunk.ExtendedBody.DeltaEncoding16BitBody) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Dcmp0.Chunk.ExtendedBody.DeltaEncoding16BitBody) (this.body))._root());
                    if (!Objects.equals(((Dcmp0.Chunk.ExtendedBody.DeltaEncoding16BitBody) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Dcmp0.Chunk.ExtendedBody.DeltaEncoding16BitBody) (this.body))._parent());
                    break;
                }
                case 6: {
                    if (!Objects.equals(((Dcmp0.Chunk.ExtendedBody.DeltaEncoding32BitBody) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Dcmp0.Chunk.ExtendedBody.DeltaEncoding32BitBody) (this.body))._root());
                    if (!Objects.equals(((Dcmp0.Chunk.ExtendedBody.DeltaEncoding32BitBody) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Dcmp0.Chunk.ExtendedBody.DeltaEncoding32BitBody) (this.body))._parent());
                    break;
                }
                }
                _dirty = false;
            }

            /**
             * The body of a 16-bit delta encoding chunk.
             * 
             * This chunk expands to a sequence of 16-bit big-endian integer values.
             * The first value is stored literally.
             * All following values are stored as deltas relative to the previous value.
             */
            public static class DeltaEncoding16BitBody extends KaitaiStruct.ReadWrite {
                public static DeltaEncoding16BitBody fromFile(String fileName) throws IOException {
                    return new DeltaEncoding16BitBody(new ByteBufferKaitaiStream(fileName));
                }
                public DeltaEncoding16BitBody() {
                    this(null, null, null);
                }

                public DeltaEncoding16BitBody(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public DeltaEncoding16BitBody(KaitaiStream _io, Dcmp0.Chunk.ExtendedBody _parent) {
                    this(_io, _parent, null);
                }

                public DeltaEncoding16BitBody(KaitaiStream _io, Dcmp0.Chunk.ExtendedBody _parent, Dcmp0 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.firstValueRaw = new DcmpVariableLengthInteger(this._io);
                    this.firstValueRaw._read();
                    this.numDeltasRaw = new DcmpVariableLengthInteger(this._io);
                    this.numDeltasRaw._read();
                    this.deltas = new ArrayList<Byte>();
                    for (int i = 0; i < numDeltas(); i++) {
                        this.deltas.add(this._io.readS1());
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    this.firstValueRaw._fetchInstances();
                    this.numDeltasRaw._fetchInstances();
                    for (int i = 0; i < this.deltas.size(); i++) {
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this.firstValueRaw._write_Seq(this._io);
                    this.numDeltasRaw._write_Seq(this._io);
                    for (int i = 0; i < this.deltas.size(); i++) {
                        this._io.writeS1(this.deltas.get(((Number) (i)).intValue()));
                    }
                }

                public void _check() {
                    if (this.deltas.size() != numDeltas())
                        throw new ConsistencyError("deltas", numDeltas(), this.deltas.size());
                    for (int i = 0; i < this.deltas.size(); i++) {
                    }
                    _dirty = false;
                }
                private Integer firstValue;

                /**
                 * The first value in the sequence.
                 * 
                 * Although it is stored as a variable-length integer,
                 * this value must be in the range `-0x8000 <= x <= 0x7fff`,
                 * i. e. a signed 16-bit integer.
                 */
                public Integer firstValue() {
                    if (this.firstValue != null)
                        return this.firstValue;
                    this.firstValue = ((Number) (firstValueRaw().value())).intValue();
                    return this.firstValue;
                }
                public void _invalidateFirstValue() { this.firstValue = null; }
                private Integer numDeltas;

                /**
                 * The number of deltas stored in this chunk.
                 * 
                 * This number must not be negative.
                 */
                public Integer numDeltas() {
                    if (this.numDeltas != null)
                        return this.numDeltas;
                    this.numDeltas = ((Number) (numDeltasRaw().value())).intValue();
                    return this.numDeltas;
                }
                public void _invalidateNumDeltas() { this.numDeltas = null; }
                private DcmpVariableLengthInteger firstValueRaw;
                private DcmpVariableLengthInteger numDeltasRaw;
                private List<Byte> deltas;
                private Dcmp0 _root;
                private Dcmp0.Chunk.ExtendedBody _parent;

                /**
                 * Raw variable-length integer representation of `first_value`.
                 */
                public DcmpVariableLengthInteger firstValueRaw() { return firstValueRaw; }
                public void setFirstValueRaw(DcmpVariableLengthInteger _v) { _dirty = true; firstValueRaw = _v; }

                /**
                 * Raw variable-length integer representation of `num_deltas`.
                 */
                public DcmpVariableLengthInteger numDeltasRaw() { return numDeltasRaw; }
                public void setNumDeltasRaw(DcmpVariableLengthInteger _v) { _dirty = true; numDeltasRaw = _v; }

                /**
                 * The deltas for each value relative to the previous value.
                 * 
                 * Each of these deltas is a signed 8-bit value.
                 * When adding the delta to the previous value,
                 * 16-bit integer wraparound is performed if necessary,
                 * so that the resulting value always fits into a 16-bit signed integer.
                 */
                public List<Byte> deltas() { return deltas; }
                public void setDeltas(List<Byte> _v) { _dirty = true; deltas = _v; }
                public Dcmp0 _root() { return _root; }
                public void set_root(Dcmp0 _v) { _dirty = true; _root = _v; }
                public Dcmp0.Chunk.ExtendedBody _parent() { return _parent; }
                public void set_parent(Dcmp0.Chunk.ExtendedBody _v) { _dirty = true; _parent = _v; }
            }

            /**
             * The body of a 32-bit delta encoding chunk.
             * 
             * This chunk expands to a sequence of 32-bit big-endian integer values.
             * The first value is stored literally.
             * All following values are stored as deltas relative to the previous value.
             */
            public static class DeltaEncoding32BitBody extends KaitaiStruct.ReadWrite {
                public static DeltaEncoding32BitBody fromFile(String fileName) throws IOException {
                    return new DeltaEncoding32BitBody(new ByteBufferKaitaiStream(fileName));
                }
                public DeltaEncoding32BitBody() {
                    this(null, null, null);
                }

                public DeltaEncoding32BitBody(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public DeltaEncoding32BitBody(KaitaiStream _io, Dcmp0.Chunk.ExtendedBody _parent) {
                    this(_io, _parent, null);
                }

                public DeltaEncoding32BitBody(KaitaiStream _io, Dcmp0.Chunk.ExtendedBody _parent, Dcmp0 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.firstValueRaw = new DcmpVariableLengthInteger(this._io);
                    this.firstValueRaw._read();
                    this.numDeltasRaw = new DcmpVariableLengthInteger(this._io);
                    this.numDeltasRaw._read();
                    this.deltasRaw = new ArrayList<DcmpVariableLengthInteger>();
                    for (int i = 0; i < numDeltas(); i++) {
                        DcmpVariableLengthInteger _t_deltasRaw = new DcmpVariableLengthInteger(this._io);
                        try {
                            _t_deltasRaw._read();
                        } finally {
                            this.deltasRaw.add(_t_deltasRaw);
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    this.firstValueRaw._fetchInstances();
                    this.numDeltasRaw._fetchInstances();
                    for (int i = 0; i < this.deltasRaw.size(); i++) {
                        this.deltasRaw.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this.firstValueRaw._write_Seq(this._io);
                    this.numDeltasRaw._write_Seq(this._io);
                    for (int i = 0; i < this.deltasRaw.size(); i++) {
                        this.deltasRaw.get(((Number) (i)).intValue())._write_Seq(this._io);
                    }
                }

                public void _check() {
                    if (this.deltasRaw.size() != numDeltas())
                        throw new ConsistencyError("deltas_raw", numDeltas(), this.deltasRaw.size());
                    for (int i = 0; i < this.deltasRaw.size(); i++) {
                    }
                    _dirty = false;
                }
                private Integer firstValue;

                /**
                 * The first value in the sequence.
                 */
                public Integer firstValue() {
                    if (this.firstValue != null)
                        return this.firstValue;
                    this.firstValue = ((Number) (firstValueRaw().value())).intValue();
                    return this.firstValue;
                }
                public void _invalidateFirstValue() { this.firstValue = null; }
                private Integer numDeltas;

                /**
                 * The number of deltas stored in this chunk.
                 * 
                 * This number must not be negative.
                 */
                public Integer numDeltas() {
                    if (this.numDeltas != null)
                        return this.numDeltas;
                    this.numDeltas = ((Number) (numDeltasRaw().value())).intValue();
                    return this.numDeltas;
                }
                public void _invalidateNumDeltas() { this.numDeltas = null; }
                private DcmpVariableLengthInteger firstValueRaw;
                private DcmpVariableLengthInteger numDeltasRaw;
                private List<DcmpVariableLengthInteger> deltasRaw;
                private Dcmp0 _root;
                private Dcmp0.Chunk.ExtendedBody _parent;

                /**
                 * Raw variable-length integer representation of `first_value`.
                 */
                public DcmpVariableLengthInteger firstValueRaw() { return firstValueRaw; }
                public void setFirstValueRaw(DcmpVariableLengthInteger _v) { _dirty = true; firstValueRaw = _v; }

                /**
                 * Raw variable-length integer representation of `num_deltas`.
                 */
                public DcmpVariableLengthInteger numDeltasRaw() { return numDeltasRaw; }
                public void setNumDeltasRaw(DcmpVariableLengthInteger _v) { _dirty = true; numDeltasRaw = _v; }

                /**
                 * The deltas for each value relative to the previous value,
                 * stored as variable-length integers.
                 * 
                 * Each of these deltas is a signed value.
                 * When adding the delta to the previous value,
                 * 32-bit integer wraparound is performed if necessary,
                 * so that the resulting value always fits into a 32-bit signed integer.
                 */
                public List<DcmpVariableLengthInteger> deltasRaw() { return deltasRaw; }
                public void setDeltasRaw(List<DcmpVariableLengthInteger> _v) { _dirty = true; deltasRaw = _v; }
                public Dcmp0 _root() { return _root; }
                public void set_root(Dcmp0 _v) { _dirty = true; _root = _v; }
                public Dcmp0.Chunk.ExtendedBody _parent() { return _parent; }
                public void set_parent(Dcmp0.Chunk.ExtendedBody _v) { _dirty = true; _parent = _v; }
            }

            /**
             * The body of a jump table chunk.
             * 
             * This chunk generates parts of a segment loader jump table,
             * in the format found in `'CODE' (0)` resources.
             * It expands to the following data,
             * with all non-constant numbers encoded as unsigned 16-bit big-endian integers:
             * 
             * * `0x3f 0x3c` (push following segment number onto stack)
             * * The segment number
             * * `0xa9 0xf0` (`_LoadSeg` trap)
             * * For each address:
             *   * The address
             *   * `0x3f 0x3c` (push following segment number onto stack)
             *   * The segment number
             *   * `0xa9 0xf0` (`_LoadSeg` trap)
             * 
             * Note that this generates one jump table entry without an address before it,
             * meaning that this address needs to be generated by the preceding chunk.
             * All following jump table entries are generated with the addresses encoded in this chunk.
             */
            public static class JumpTableBody extends KaitaiStruct.ReadWrite {
                public static JumpTableBody fromFile(String fileName) throws IOException {
                    return new JumpTableBody(new ByteBufferKaitaiStream(fileName));
                }
                public JumpTableBody() {
                    this(null, null, null);
                }

                public JumpTableBody(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public JumpTableBody(KaitaiStream _io, Dcmp0.Chunk.ExtendedBody _parent) {
                    this(_io, _parent, null);
                }

                public JumpTableBody(KaitaiStream _io, Dcmp0.Chunk.ExtendedBody _parent, Dcmp0 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.segmentNumberRaw = new DcmpVariableLengthInteger(this._io);
                    this.segmentNumberRaw._read();
                    this.numAddressesRaw = new DcmpVariableLengthInteger(this._io);
                    this.numAddressesRaw._read();
                    this.addressesRaw = new ArrayList<DcmpVariableLengthInteger>();
                    for (int i = 0; i < numAddresses(); i++) {
                        DcmpVariableLengthInteger _t_addressesRaw = new DcmpVariableLengthInteger(this._io);
                        try {
                            _t_addressesRaw._read();
                        } finally {
                            this.addressesRaw.add(_t_addressesRaw);
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    this.segmentNumberRaw._fetchInstances();
                    this.numAddressesRaw._fetchInstances();
                    for (int i = 0; i < this.addressesRaw.size(); i++) {
                        this.addressesRaw.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this.segmentNumberRaw._write_Seq(this._io);
                    this.numAddressesRaw._write_Seq(this._io);
                    for (int i = 0; i < this.addressesRaw.size(); i++) {
                        this.addressesRaw.get(((Number) (i)).intValue())._write_Seq(this._io);
                    }
                }

                public void _check() {
                    if (this.addressesRaw.size() != numAddresses())
                        throw new ConsistencyError("addresses_raw", numAddresses(), this.addressesRaw.size());
                    for (int i = 0; i < this.addressesRaw.size(); i++) {
                    }
                    _dirty = false;
                }
                private Integer numAddresses;

                /**
                 * The number of addresses stored in this chunk.
                 * 
                 * This number must be greater than 0.
                 */
                public Integer numAddresses() {
                    if (this.numAddresses != null)
                        return this.numAddresses;
                    this.numAddresses = ((Number) (numAddressesRaw().value())).intValue();
                    return this.numAddresses;
                }
                public void _invalidateNumAddresses() { this.numAddresses = null; }
                private Integer segmentNumber;

                /**
                 * The segment number for all of the generated jump table entries.
                 * 
                 * Although it is stored as a variable-length integer,
                 * the segment number must be in the range `0x0 <= x <= 0xffff`,
                 * i. e. an unsigned 16-bit integer.
                 */
                public Integer segmentNumber() {
                    if (this.segmentNumber != null)
                        return this.segmentNumber;
                    this.segmentNumber = ((Number) (segmentNumberRaw().value())).intValue();
                    return this.segmentNumber;
                }
                public void _invalidateSegmentNumber() { this.segmentNumber = null; }
                private DcmpVariableLengthInteger segmentNumberRaw;
                private DcmpVariableLengthInteger numAddressesRaw;
                private List<DcmpVariableLengthInteger> addressesRaw;
                private Dcmp0 _root;
                private Dcmp0.Chunk.ExtendedBody _parent;

                /**
                 * Raw variable-length integer representation of `segment_number`.
                 */
                public DcmpVariableLengthInteger segmentNumberRaw() { return segmentNumberRaw; }
                public void setSegmentNumberRaw(DcmpVariableLengthInteger _v) { _dirty = true; segmentNumberRaw = _v; }

                /**
                 * Raw variable-length integer representation of `num_addresses`.
                 */
                public DcmpVariableLengthInteger numAddressesRaw() { return numAddressesRaw; }
                public void setNumAddressesRaw(DcmpVariableLengthInteger _v) { _dirty = true; numAddressesRaw = _v; }

                /**
                 * The addresses for each generated jump table entry,
                 * stored as variable-length integers.
                 * 
                 * The first address is stored literally and must be in the range `0x0 <= x <= 0xffff`,
                 * i. e. an unsigned 16-bit integer.
                 * 
                 * All following addresses are stored as deltas relative to the previous address.
                 * Each of these deltas is stored plus 6;
                 * this value needs to be subtracted before (or after) adding it to the previous address.
                 * 
                 * Each delta (after subtracting 6) should be positive,
                 * and adding it to the previous address should not result in a value larger than `0xffff`,
                 * i. e. there should be no 16-bit unsigned integer wraparound.
                 * These conditions are always met in all known jump table chunks,
                 * so it is not known how the original decompressor behaves otherwise.
                 */
                public List<DcmpVariableLengthInteger> addressesRaw() { return addressesRaw; }
                public void setAddressesRaw(List<DcmpVariableLengthInteger> _v) { _dirty = true; addressesRaw = _v; }
                public Dcmp0 _root() { return _root; }
                public void set_root(Dcmp0 _v) { _dirty = true; _root = _v; }
                public Dcmp0.Chunk.ExtendedBody _parent() { return _parent; }
                public void set_parent(Dcmp0.Chunk.ExtendedBody _v) { _dirty = true; _parent = _v; }
            }

            /**
             * The body of a repeat chunk.
             * 
             * This chunk expands to a 1-byte or 2-byte value repeated a number of times,
             * i. e. it implements a form of run-length encoding.
             */
            public static class RepeatBody extends KaitaiStruct.ReadWrite {
                public RepeatBody(int tag) {
                    this(null, null, null, tag);
                }

                public RepeatBody(KaitaiStream _io, int tag) {
                    this(_io, null, null, tag);
                }

                public RepeatBody(KaitaiStream _io, Dcmp0.Chunk.ExtendedBody _parent, int tag) {
                    this(_io, _parent, null, tag);
                }

                public RepeatBody(KaitaiStream _io, Dcmp0.Chunk.ExtendedBody _parent, Dcmp0 _root, int tag) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    this.tag = tag;
                }
                public void _read() {
                    this.toRepeatRaw = new DcmpVariableLengthInteger(this._io);
                    this.toRepeatRaw._read();
                    this.repeatCountM1Raw = new DcmpVariableLengthInteger(this._io);
                    this.repeatCountM1Raw._read();
                    _dirty = false;
                }

                public void _fetchInstances() {
                    this.toRepeatRaw._fetchInstances();
                    this.repeatCountM1Raw._fetchInstances();
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this.toRepeatRaw._write_Seq(this._io);
                    this.repeatCountM1Raw._write_Seq(this._io);
                }

                public void _check() {
                    _dirty = false;
                }
                private Integer byteCount;

                /**
                 * The length in bytes of the value to be repeated.
                 * Regardless of the byte count,
                 * the value to be repeated is stored as a variable-length integer.
                 */
                public Integer byteCount() {
                    if (this.byteCount != null)
                        return this.byteCount;
                    this.byteCount = ((Number) ((tag() == 2 ? 1 : (tag() == 3 ? 2 : -1)))).intValue();
                    return this.byteCount;
                }
                public void _invalidateByteCount() { this.byteCount = null; }
                private Integer repeatCount;

                /**
                 * The number of times to repeat the value.
                 * 
                 * This value must be positive.
                 */
                public Integer repeatCount() {
                    if (this.repeatCount != null)
                        return this.repeatCount;
                    this.repeatCount = ((Number) (repeatCountM1() + 1)).intValue();
                    return this.repeatCount;
                }
                public void _invalidateRepeatCount() { this.repeatCount = null; }
                private Integer repeatCountM1;

                /**
                 * The number of times to repeat the value,
                 * minus one.
                 * 
                 * This value must not be negative.
                 */
                public Integer repeatCountM1() {
                    if (this.repeatCountM1 != null)
                        return this.repeatCountM1;
                    this.repeatCountM1 = ((Number) (repeatCountM1Raw().value())).intValue();
                    return this.repeatCountM1;
                }
                public void _invalidateRepeatCountM1() { this.repeatCountM1 = null; }
                private Integer toRepeat;

                /**
                 * The value to repeat.
                 * 
                 * Although it is stored as a variable-length integer,
                 * this value must fit into an unsigned big-endian integer that is as long as `byte_count`,
                 * i. e. either 8 or 16 bits.
                 */
                public Integer toRepeat() {
                    if (this.toRepeat != null)
                        return this.toRepeat;
                    this.toRepeat = ((Number) (toRepeatRaw().value())).intValue();
                    return this.toRepeat;
                }
                public void _invalidateToRepeat() { this.toRepeat = null; }
                private DcmpVariableLengthInteger toRepeatRaw;
                private DcmpVariableLengthInteger repeatCountM1Raw;
                private int tag;
                private Dcmp0 _root;
                private Dcmp0.Chunk.ExtendedBody _parent;

                /**
                 * Raw variable-length integer representation of `to_repeat`.
                 */
                public DcmpVariableLengthInteger toRepeatRaw() { return toRepeatRaw; }
                public void setToRepeatRaw(DcmpVariableLengthInteger _v) { _dirty = true; toRepeatRaw = _v; }

                /**
                 * Raw variable-length integer representation of `repeat_count_m1`.
                 */
                public DcmpVariableLengthInteger repeatCountM1Raw() { return repeatCountM1Raw; }
                public void setRepeatCountM1Raw(DcmpVariableLengthInteger _v) { _dirty = true; repeatCountM1Raw = _v; }

                /**
                 * The extended tag byte preceding this chunk body.
                 */
                public int tag() { return tag; }
                public void setTag(int _v) { _dirty = true; tag = _v; }
                public Dcmp0 _root() { return _root; }
                public void set_root(Dcmp0 _v) { _dirty = true; _root = _v; }
                public Dcmp0.Chunk.ExtendedBody _parent() { return _parent; }
                public void set_parent(Dcmp0.Chunk.ExtendedBody _v) { _dirty = true; _parent = _v; }
            }
            private int tag;
            private KaitaiStruct.ReadWrite body;
            private Dcmp0 _root;
            private Dcmp0.Chunk _parent;

            /**
             * The chunk's extended tag byte.
             * This controls the structure of the body and the meaning of the chunk.
             */
            public int tag() { return tag; }
            public void setTag(int _v) { _dirty = true; tag = _v; }

            /**
             * The chunk's body.
             */
            public KaitaiStruct.ReadWrite body() { return body; }
            public void setBody(KaitaiStruct.ReadWrite _v) { _dirty = true; body = _v; }
            public Dcmp0 _root() { return _root; }
            public void set_root(Dcmp0 _v) { _dirty = true; _root = _v; }
            public Dcmp0.Chunk _parent() { return _parent; }
            public void set_parent(Dcmp0.Chunk _v) { _dirty = true; _parent = _v; }
        }

        /**
         * The body of a literal data chunk.
         * 
         * The data that this chunk expands to is stored literally in the body (`literal`).
         * Optionally,
         * the literal data may also be stored for use by future backreference chunks (`do_store`).
         * 
         * The length of the literal data is stored as a number of two-byte units.
         * This means that the literal data always has an even length in bytes.
         */
        public static class LiteralBody extends KaitaiStruct.ReadWrite {
            public LiteralBody(int tag) {
                this(null, null, null, tag);
            }

            public LiteralBody(KaitaiStream _io, int tag) {
                this(_io, null, null, tag);
            }

            public LiteralBody(KaitaiStream _io, Dcmp0.Chunk _parent, int tag) {
                this(_io, _parent, null, tag);
            }

            public LiteralBody(KaitaiStream _io, Dcmp0.Chunk _parent, Dcmp0 _root, int tag) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this.tag = tag;
            }
            public void _read() {
                if (isLenLiteralDiv2Separate()) {
                    this.lenLiteralDiv2Separate = this._io.readU1();
                }
                this.literal = this._io.readBytes(lenLiteral());
                _dirty = false;
            }

            public void _fetchInstances() {
                if (isLenLiteralDiv2Separate()) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                if (isLenLiteralDiv2Separate()) {
                    this._io.writeU1(this.lenLiteralDiv2Separate);
                }
                this._io.writeBytes(this.literal);
            }

            public void _check() {
                if (isLenLiteralDiv2Separate()) {
                }
                if (this.literal.length != lenLiteral())
                    throw new ConsistencyError("literal", lenLiteral(), this.literal.length);
                _dirty = false;
            }
            private Boolean doStore;

            /**
             * Whether this literal should be stored for use by future backreference chunks.
             * 
             * See the documentation of the `backreference_body` type for details about backreference chunks.
             */
            public Boolean doStore() {
                if (this.doStore != null)
                    return this.doStore;
                this.doStore = (tag() & 16) != 0;
                return this.doStore;
            }
            public void _invalidateDoStore() { this.doStore = null; }
            private Boolean isLenLiteralDiv2Separate;

            /**
             * Whether the length of the literal is stored separately from the tag.
             */
            public Boolean isLenLiteralDiv2Separate() {
                if (this.isLenLiteralDiv2Separate != null)
                    return this.isLenLiteralDiv2Separate;
                this.isLenLiteralDiv2Separate = lenLiteralDiv2InTag() == 0;
                return this.isLenLiteralDiv2Separate;
            }
            public void _invalidateIsLenLiteralDiv2Separate() { this.isLenLiteralDiv2Separate = null; }
            private Integer lenLiteral;

            /**
             * The length of the literal data,
             * in bytes.
             */
            public Integer lenLiteral() {
                if (this.lenLiteral != null)
                    return this.lenLiteral;
                this.lenLiteral = ((Number) (lenLiteralDiv2() * 2)).intValue();
                return this.lenLiteral;
            }
            public void _invalidateLenLiteral() { this.lenLiteral = null; }
            private Integer lenLiteralDiv2;

            /**
             * The length of the literal data,
             * in two-byte units.
             * 
             * In practice,
             * this value is always greater than zero,
             * as there is no use in storing a zero-length literal.
             */
            public Integer lenLiteralDiv2() {
                if (this.lenLiteralDiv2 != null)
                    return this.lenLiteralDiv2;
                this.lenLiteralDiv2 = ((Number) ((isLenLiteralDiv2Separate() ? lenLiteralDiv2Separate() : lenLiteralDiv2InTag()))).intValue();
                return this.lenLiteralDiv2;
            }
            public void _invalidateLenLiteralDiv2() { this.lenLiteralDiv2 = null; }
            private Integer lenLiteralDiv2InTag;

            /**
             * The part of the tag byte that indicates the length of the literal data,
             * in two-byte units.
             * If this value is 0,
             * the length is stored in a separate byte after the tag byte and before the literal data.
             */
            public Integer lenLiteralDiv2InTag() {
                if (this.lenLiteralDiv2InTag != null)
                    return this.lenLiteralDiv2InTag;
                this.lenLiteralDiv2InTag = ((Number) (tag() & 15)).intValue();
                return this.lenLiteralDiv2InTag;
            }
            public void _invalidateLenLiteralDiv2InTag() { this.lenLiteralDiv2InTag = null; }
            private Integer lenLiteralDiv2Separate;
            private byte[] literal;
            private int tag;
            private Dcmp0 _root;
            private Dcmp0.Chunk _parent;

            /**
             * The length of the literal data,
             * in two-byte units.
             * 
             * This field is only present if the tag byte's low nibble is zero.
             * In practice,
             * this only happens if the length is 0x10 or greater,
             * because smaller lengths can be encoded into the tag byte.
             */
            public Integer lenLiteralDiv2Separate() { return lenLiteralDiv2Separate; }
            public void setLenLiteralDiv2Separate(Integer _v) { _dirty = true; lenLiteralDiv2Separate = _v; }

            /**
             * The literal data.
             */
            public byte[] literal() { return literal; }
            public void setLiteral(byte[] _v) { _dirty = true; literal = _v; }

            /**
             * The tag byte preceding this chunk body.
             */
            public int tag() { return tag; }
            public void setTag(int _v) { _dirty = true; tag = _v; }
            public Dcmp0 _root() { return _root; }
            public void set_root(Dcmp0 _v) { _dirty = true; _root = _v; }
            public Dcmp0.Chunk _parent() { return _parent; }
            public void set_parent(Dcmp0.Chunk _v) { _dirty = true; _parent = _v; }
        }

        /**
         * The body of a table lookup chunk.
         * This body is always empty.
         * 
         * This chunk always expands to two bytes (`value`),
         * determined from the tag byte using a fixed lookup table (`lookup_table`).
         * This lookup table is hardcoded in the decompressor and always the same for all compressed data.
         */
        public static class TableLookupBody extends KaitaiStruct.ReadWrite {
            public TableLookupBody(int tag) {
                this(null, null, null, tag);
            }

            public TableLookupBody(KaitaiStream _io, int tag) {
                this(_io, null, null, tag);
            }

            public TableLookupBody(KaitaiStream _io, Dcmp0.Chunk _parent, int tag) {
                this(_io, _parent, null, tag);
            }

            public TableLookupBody(KaitaiStream _io, Dcmp0.Chunk _parent, Dcmp0 _root, int tag) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this.tag = tag;
            }
            public void _read() {
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
            }

            public void _check() {
                _dirty = false;
            }
            private List<byte[]> lookupTable;

            /**
             * Fixed lookup table that maps tag byte numbers to two bytes each.
             * 
             * The entries in the lookup table are offset -
             * index 0 stands for tag 0x4b, 1 for 0x4c, etc.
             */
            public List<byte[]> lookupTable() {
                if (this.lookupTable != null)
                    return this.lookupTable;
                this.lookupTable = new ArrayList<byte[]>(Arrays.asList(new byte[] { 0, 0 }, new byte[] { 78, -70 }, new byte[] { 0, 8 }, new byte[] { 78, 117 }, new byte[] { 0, 12 }, new byte[] { 78, -83 }, new byte[] { 32, 83 }, new byte[] { 47, 11 }, new byte[] { 97, 0 }, new byte[] { 0, 16 }, new byte[] { 112, 0 }, new byte[] { 47, 0 }, new byte[] { 72, 110 }, new byte[] { 32, 80 }, new byte[] { 32, 110 }, new byte[] { 47, 46 }, new byte[] { -1, -4 }, new byte[] { 72, -25 }, new byte[] { 63, 60 }, new byte[] { 0, 4 }, new byte[] { -1, -8 }, new byte[] { 47, 12 }, new byte[] { 32, 6 }, new byte[] { 78, -19 }, new byte[] { 78, 86 }, new byte[] { 32, 104 }, new byte[] { 78, 94 }, new byte[] { 0, 1 }, new byte[] { 88, -113 }, new byte[] { 79, -17 }, new byte[] { 0, 2 }, new byte[] { 0, 24 }, new byte[] { 96, 0 }, new byte[] { -1, -1 }, new byte[] { 80, -113 }, new byte[] { 78, -112 }, new byte[] { 0, 6 }, new byte[] { 38, 110 }, new byte[] { 0, 20 }, new byte[] { -1, -12 }, new byte[] { 76, -18 }, new byte[] { 0, 10 }, new byte[] { 0, 14 }, new byte[] { 65, -18 }, new byte[] { 76, -33 }, new byte[] { 72, -64 }, new byte[] { -1, -16 }, new byte[] { 45, 64 }, new byte[] { 0, 18 }, new byte[] { 48, 46 }, new byte[] { 112, 1 }, new byte[] { 47, 40 }, new byte[] { 32, 84 }, new byte[] { 103, 0 }, new byte[] { 0, 32 }, new byte[] { 0, 28 }, new byte[] { 32, 95 }, new byte[] { 24, 0 }, new byte[] { 38, 111 }, new byte[] { 72, 120 }, new byte[] { 0, 22 }, new byte[] { 65, -6 }, new byte[] { 48, 60 }, new byte[] { 40, 64 }, new byte[] { 114, 0 }, new byte[] { 40, 110 }, new byte[] { 32, 12 }, new byte[] { 102, 0 }, new byte[] { 32, 107 }, new byte[] { 47, 7 }, new byte[] { 85, -113 }, new byte[] { 0, 40 }, new byte[] { -1, -2 }, new byte[] { -1, -20 }, new byte[] { 34, -40 }, new byte[] { 32, 11 }, new byte[] { 0, 15 }, new byte[] { 89, -113 }, new byte[] { 47, 60 }, new byte[] { -1, 0 }, new byte[] { 1, 24 }, new byte[] { -127, -31 }, new byte[] { 74, 0 }, new byte[] { 78, -80 }, new byte[] { -1, -24 }, new byte[] { 72, -57 }, new byte[] { 0, 3 }, new byte[] { 0, 34 }, new byte[] { 0, 7 }, new byte[] { 0, 26 }, new byte[] { 103, 6 }, new byte[] { 103, 8 }, new byte[] { 78, -7 }, new byte[] { 0, 36 }, new byte[] { 32, 120 }, new byte[] { 8, 0 }, new byte[] { 102, 4 }, new byte[] { 0, 42 }, new byte[] { 78, -48 }, new byte[] { 48, 40 }, new byte[] { 38, 95 }, new byte[] { 103, 4 }, new byte[] { 0, 48 }, new byte[] { 67, -18 }, new byte[] { 63, 0 }, new byte[] { 32, 31 }, new byte[] { 0, 30 }, new byte[] { -1, -10 }, new byte[] { 32, 46 }, new byte[] { 66, -89 }, new byte[] { 32, 7 }, new byte[] { -1, -6 }, new byte[] { 96, 2 }, new byte[] { 61, 64 }, new byte[] { 12, 64 }, new byte[] { 102, 6 }, new byte[] { 0, 38 }, new byte[] { 45, 72 }, new byte[] { 47, 1 }, new byte[] { 112, -1 }, new byte[] { 96, 4 }, new byte[] { 24, -128 }, new byte[] { 74, 64 }, new byte[] { 0, 64 }, new byte[] { 0, 44 }, new byte[] { 47, 8 }, new byte[] { 0, 17 }, new byte[] { -1, -28 }, new byte[] { 33, 64 }, new byte[] { 38, 64 }, new byte[] { -1, -14 }, new byte[] { 66, 110 }, new byte[] { 78, -71 }, new byte[] { 61, 124 }, new byte[] { 0, 56 }, new byte[] { 0, 13 }, new byte[] { 96, 6 }, new byte[] { 66, 46 }, new byte[] { 32, 60 }, new byte[] { 103, 12 }, new byte[] { 45, 104 }, new byte[] { 102, 8 }, new byte[] { 74, 46 }, new byte[] { 74, -82 }, new byte[] { 0, 46 }, new byte[] { 72, 64 }, new byte[] { 34, 95 }, new byte[] { 34, 0 }, new byte[] { 103, 10 }, new byte[] { 48, 7 }, new byte[] { 66, 103 }, new byte[] { 0, 50 }, new byte[] { 32, 40 }, new byte[] { 0, 9 }, new byte[] { 72, 122 }, new byte[] { 2, 0 }, new byte[] { 47, 43 }, new byte[] { 0, 5 }, new byte[] { 34, 110 }, new byte[] { 102, 2 }, new byte[] { -27, -128 }, new byte[] { 103, 14 }, new byte[] { 102, 10 }, new byte[] { 0, 80 }, new byte[] { 62, 0 }, new byte[] { 102, 12 }, new byte[] { 46, 0 }, new byte[] { -1, -18 }, new byte[] { 32, 109 }, new byte[] { 32, 64 }, new byte[] { -1, -32 }, new byte[] { 83, 64 }, new byte[] { 96, 8 }, new byte[] { 4, -128 }, new byte[] { 0, 104 }, new byte[] { 11, 124 }, new byte[] { 68, 0 }, new byte[] { 65, -24 }, new byte[] { 72, 65 }));
                return this.lookupTable;
            }
            public void _invalidateLookupTable() { this.lookupTable = null; }
            private byte[] value;

            /**
             * The two bytes that the tag byte expands to,
             * based on the fixed lookup table.
             */
            public byte[] value() {
                if (this.value != null)
                    return this.value;
                this.value = lookupTable().get(((Number) (tag() - 75)).intValue());
                return this.value;
            }
            public void _invalidateValue() { this.value = null; }
            private int tag;
            private Dcmp0 _root;
            private Dcmp0.Chunk _parent;

            /**
             * The tag byte preceding this chunk body.
             */
            public int tag() { return tag; }
            public void setTag(int _v) { _dirty = true; tag = _v; }
            public Dcmp0 _root() { return _root; }
            public void set_root(Dcmp0 _v) { _dirty = true; _root = _v; }
            public Dcmp0.Chunk _parent() { return _parent; }
            public void set_parent(Dcmp0.Chunk _v) { _dirty = true; _parent = _v; }
        }
        private int tag;
        private KaitaiStruct.ReadWrite body;
        private Dcmp0 _root;
        private Dcmp0 _parent;

        /**
         * The chunk's tag byte.
         * This controls the structure of the body and the meaning of the chunk.
         */
        public int tag() { return tag; }
        public void setTag(int _v) { _dirty = true; tag = _v; }

        /**
         * The chunk's body.
         * 
         * Certain chunks do not have any data following the tag byte.
         * In this case,
         * the body is a zero-length structure.
         */
        public KaitaiStruct.ReadWrite body() { return body; }
        public void setBody(KaitaiStruct.ReadWrite _v) { _dirty = true; body = _v; }
        public Dcmp0 _root() { return _root; }
        public void set_root(Dcmp0 _v) { _dirty = true; _root = _v; }
        public Dcmp0 _parent() { return _parent; }
        public void set_parent(Dcmp0 _v) { _dirty = true; _parent = _v; }
    }
    private List<Chunk> chunks;
    private Dcmp0 _root;
    private KaitaiStruct.ReadWrite _parent;

    /**
     * The sequence of chunks that make up the compressed data.
     */
    public List<Chunk> chunks() { return chunks; }
    public void setChunks(List<Chunk> _v) { _dirty = true; chunks = _v; }
    public Dcmp0 _root() { return _root; }
    public void set_root(Dcmp0 _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

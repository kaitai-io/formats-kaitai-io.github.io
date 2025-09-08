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
 * Compressed resource data in `'dcmp' (1)` format,
 * as stored in compressed resources with header type `8` and decompressor ID `1`.
 * 
 * The `'dcmp' (1)` decompressor resource is included in the System file of System 7.0 and later.
 * This compression format is used for a few compressed resources in System 7.0's files
 * (such as the Finder Help file).
 * This decompressor is also included with and used by some other Apple applications,
 * such as ResEdit.
 * (Note: ResEdit includes the `'dcmp' (1)` resource,
 * but none of its resources actually use this decompressor.)
 * 
 * This compression format supports some basic general-purpose compression schemes,
 * including backreferences to previous data and run-length encoding.
 * It also includes some types of compression tailored specifically to Mac OS resources,
 * including a set of single-byte codes that correspond to entries in a hard-coded lookup table.
 * 
 * The `'dcmp' (0)` compression format (see dcmp_0.ksy) is very similar to this format,
 * with the main difference that it operates mostly on units of 2 or 4 bytes.
 * This makes the ``dcmp' (0)` format more suitable for word-aligned data,
 * such as executable code, bitmaps, sounds, etc.
 * The `'dcmp' (0)` format also appears to be generally preferred over `'dcmp' (1)`,
 * with the latter only being used in resource files that contain mostly unaligned data,
 * such as text.
 * @see <a href="https://github.com/dgelessus/python-rsrcfork/blob/f891a6e/src/rsrcfork/compress/dcmp1.py">Source</a>
 */
public class Dcmp1 extends KaitaiStruct.ReadWrite {
    public static Dcmp1 fromFile(String fileName) throws IOException {
        return new Dcmp1(new ByteBufferKaitaiStream(fileName));
    }
    public Dcmp1() {
        this(null, null, null);
    }

    public Dcmp1(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Dcmp1(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Dcmp1(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Dcmp1 _root) {
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

        public Chunk(KaitaiStream _io, Dcmp1 _parent) {
            this(_io, _parent, null);
        }

        public Chunk(KaitaiStream _io, Dcmp1 _parent, Dcmp1 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.tag = this._io.readU1();
            {
                TagKind on = ( ((tag() >= 0) && (tag() <= 31))  ? TagKind.LITERAL : ( ((tag() >= 32) && (tag() <= 207))  ? TagKind.BACKREFERENCE : ( ((tag() >= 208) && (tag() <= 209))  ? TagKind.LITERAL : (tag() == 210 ? TagKind.BACKREFERENCE : ( ((tag() >= 213) && (tag() <= 253))  ? TagKind.TABLE_LOOKUP : (tag() == 254 ? TagKind.EXTENDED : (tag() == 255 ? TagKind.END : TagKind.INVALID)))))));
                if (on != null) {
                    switch (( ((tag() >= 0) && (tag() <= 31))  ? TagKind.LITERAL : ( ((tag() >= 32) && (tag() <= 207))  ? TagKind.BACKREFERENCE : ( ((tag() >= 208) && (tag() <= 209))  ? TagKind.LITERAL : (tag() == 210 ? TagKind.BACKREFERENCE : ( ((tag() >= 213) && (tag() <= 253))  ? TagKind.TABLE_LOOKUP : (tag() == 254 ? TagKind.EXTENDED : (tag() == 255 ? TagKind.END : TagKind.INVALID)))))))) {
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
                TagKind on = ( ((tag() >= 0) && (tag() <= 31))  ? TagKind.LITERAL : ( ((tag() >= 32) && (tag() <= 207))  ? TagKind.BACKREFERENCE : ( ((tag() >= 208) && (tag() <= 209))  ? TagKind.LITERAL : (tag() == 210 ? TagKind.BACKREFERENCE : ( ((tag() >= 213) && (tag() <= 253))  ? TagKind.TABLE_LOOKUP : (tag() == 254 ? TagKind.EXTENDED : (tag() == 255 ? TagKind.END : TagKind.INVALID)))))));
                if (on != null) {
                    switch (( ((tag() >= 0) && (tag() <= 31))  ? TagKind.LITERAL : ( ((tag() >= 32) && (tag() <= 207))  ? TagKind.BACKREFERENCE : ( ((tag() >= 208) && (tag() <= 209))  ? TagKind.LITERAL : (tag() == 210 ? TagKind.BACKREFERENCE : ( ((tag() >= 213) && (tag() <= 253))  ? TagKind.TABLE_LOOKUP : (tag() == 254 ? TagKind.EXTENDED : (tag() == 255 ? TagKind.END : TagKind.INVALID)))))))) {
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
                TagKind on = ( ((tag() >= 0) && (tag() <= 31))  ? TagKind.LITERAL : ( ((tag() >= 32) && (tag() <= 207))  ? TagKind.BACKREFERENCE : ( ((tag() >= 208) && (tag() <= 209))  ? TagKind.LITERAL : (tag() == 210 ? TagKind.BACKREFERENCE : ( ((tag() >= 213) && (tag() <= 253))  ? TagKind.TABLE_LOOKUP : (tag() == 254 ? TagKind.EXTENDED : (tag() == 255 ? TagKind.END : TagKind.INVALID)))))));
                if (on != null) {
                    switch (( ((tag() >= 0) && (tag() <= 31))  ? TagKind.LITERAL : ( ((tag() >= 32) && (tag() <= 207))  ? TagKind.BACKREFERENCE : ( ((tag() >= 208) && (tag() <= 209))  ? TagKind.LITERAL : (tag() == 210 ? TagKind.BACKREFERENCE : ( ((tag() >= 213) && (tag() <= 253))  ? TagKind.TABLE_LOOKUP : (tag() == 254 ? TagKind.EXTENDED : (tag() == 255 ? TagKind.END : TagKind.INVALID)))))))) {
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
                TagKind on = ( ((tag() >= 0) && (tag() <= 31))  ? TagKind.LITERAL : ( ((tag() >= 32) && (tag() <= 207))  ? TagKind.BACKREFERENCE : ( ((tag() >= 208) && (tag() <= 209))  ? TagKind.LITERAL : (tag() == 210 ? TagKind.BACKREFERENCE : ( ((tag() >= 213) && (tag() <= 253))  ? TagKind.TABLE_LOOKUP : (tag() == 254 ? TagKind.EXTENDED : (tag() == 255 ? TagKind.END : TagKind.INVALID)))))));
                if (on != null) {
                    switch (( ((tag() >= 0) && (tag() <= 31))  ? TagKind.LITERAL : ( ((tag() >= 32) && (tag() <= 207))  ? TagKind.BACKREFERENCE : ( ((tag() >= 208) && (tag() <= 209))  ? TagKind.LITERAL : (tag() == 210 ? TagKind.BACKREFERENCE : ( ((tag() >= 213) && (tag() <= 253))  ? TagKind.TABLE_LOOKUP : (tag() == 254 ? TagKind.EXTENDED : (tag() == 255 ? TagKind.END : TagKind.INVALID)))))))) {
                    case BACKREFERENCE: {
                        if (!Objects.equals(((Dcmp1.Chunk.BackreferenceBody) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Dcmp1.Chunk.BackreferenceBody) (this.body))._root());
                        if (!Objects.equals(((Dcmp1.Chunk.BackreferenceBody) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Dcmp1.Chunk.BackreferenceBody) (this.body))._parent());
                        if (((Dcmp1.Chunk.BackreferenceBody) (this.body)).tag() != tag())
                            throw new ConsistencyError("body", tag(), ((Dcmp1.Chunk.BackreferenceBody) (this.body)).tag());
                        break;
                    }
                    case END: {
                        if (!Objects.equals(((Dcmp1.Chunk.EndBody) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Dcmp1.Chunk.EndBody) (this.body))._root());
                        if (!Objects.equals(((Dcmp1.Chunk.EndBody) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Dcmp1.Chunk.EndBody) (this.body))._parent());
                        break;
                    }
                    case EXTENDED: {
                        if (!Objects.equals(((Dcmp1.Chunk.ExtendedBody) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Dcmp1.Chunk.ExtendedBody) (this.body))._root());
                        if (!Objects.equals(((Dcmp1.Chunk.ExtendedBody) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Dcmp1.Chunk.ExtendedBody) (this.body))._parent());
                        break;
                    }
                    case LITERAL: {
                        if (!Objects.equals(((Dcmp1.Chunk.LiteralBody) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Dcmp1.Chunk.LiteralBody) (this.body))._root());
                        if (!Objects.equals(((Dcmp1.Chunk.LiteralBody) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Dcmp1.Chunk.LiteralBody) (this.body))._parent());
                        if (((Dcmp1.Chunk.LiteralBody) (this.body)).tag() != tag())
                            throw new ConsistencyError("body", tag(), ((Dcmp1.Chunk.LiteralBody) (this.body)).tag());
                        break;
                    }
                    case TABLE_LOOKUP: {
                        if (!Objects.equals(((Dcmp1.Chunk.TableLookupBody) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Dcmp1.Chunk.TableLookupBody) (this.body))._root());
                        if (!Objects.equals(((Dcmp1.Chunk.TableLookupBody) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Dcmp1.Chunk.TableLookupBody) (this.body))._parent());
                        if (((Dcmp1.Chunk.TableLookupBody) (this.body)).tag() != tag())
                            throw new ConsistencyError("body", tag(), ((Dcmp1.Chunk.TableLookupBody) (this.body)).tag());
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

            public BackreferenceBody(KaitaiStream _io, Dcmp1.Chunk _parent, int tag) {
                this(_io, _parent, null, tag);
            }

            public BackreferenceBody(KaitaiStream _io, Dcmp1.Chunk _parent, Dcmp1 _root, int tag) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this.tag = tag;
            }
            public void _read() {
                if (isIndexSeparate()) {
                    this.indexSeparateMinus = this._io.readU1();
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                if (isIndexSeparate()) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                if (isIndexSeparate()) {
                    this._io.writeU1(this.indexSeparateMinus);
                }
            }

            public void _check() {
                if (isIndexSeparate()) {
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
                this.indexInTag = ((Number) (tag() - 32)).intValue();
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
                    this.indexSeparate = ((Number) (indexSeparateMinus() + 176)).intValue();
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
                this.isIndexSeparate = tag() == 210;
                return this.isIndexSeparate;
            }
            public void _invalidateIsIndexSeparate() { this.isIndexSeparate = null; }
            private Integer indexSeparateMinus;
            private int tag;
            private Dcmp1 _root;
            private Dcmp1.Chunk _parent;

            /**
             * The index of the referenced literal chunk,
             * stored separately from the tag.
             * The value in this field is stored minus 0xb0.
             * 
             * This field is only present if the tag byte is 0xd2.
             * For other tag bytes,
             * the index is encoded in the tag byte.
             * Values smaller than 0xb0 cannot be stored in this field,
             * they must always be encoded in the tag byte.
             */
            public Integer indexSeparateMinus() { return indexSeparateMinus; }
            public void setIndexSeparateMinus(Integer _v) { _dirty = true; indexSeparateMinus = _v; }

            /**
             * The tag byte preceding this chunk body.
             */
            public int tag() { return tag; }
            public void setTag(int _v) { _dirty = true; tag = _v; }
            public Dcmp1 _root() { return _root; }
            public void set_root(Dcmp1 _v) { _dirty = true; _root = _v; }
            public Dcmp1.Chunk _parent() { return _parent; }
            public void set_parent(Dcmp1.Chunk _v) { _dirty = true; _parent = _v; }
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

            public EndBody(KaitaiStream _io, Dcmp1.Chunk _parent) {
                this(_io, _parent, null);
            }

            public EndBody(KaitaiStream _io, Dcmp1.Chunk _parent, Dcmp1 _root) {
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
            private Dcmp1 _root;
            private Dcmp1.Chunk _parent;
            public Dcmp1 _root() { return _root; }
            public void set_root(Dcmp1 _v) { _dirty = true; _root = _v; }
            public Dcmp1.Chunk _parent() { return _parent; }
            public void set_parent(Dcmp1.Chunk _v) { _dirty = true; _parent = _v; }
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

            public ExtendedBody(KaitaiStream _io, Dcmp1.Chunk _parent) {
                this(_io, _parent, null);
            }

            public ExtendedBody(KaitaiStream _io, Dcmp1.Chunk _parent, Dcmp1 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.tag = this._io.readU1();
                switch (tag()) {
                case 2: {
                    this.body = new RepeatBody(this._io, this, _root);
                    this.body._read();
                    break;
                }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                switch (tag()) {
                case 2: {
                    this.body._fetchInstances();
                    break;
                }
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(this.tag);
                switch (tag()) {
                case 2: {
                    this.body._write_Seq(this._io);
                    break;
                }
                }
            }

            public void _check() {
                switch (tag()) {
                case 2: {
                    if (!Objects.equals(this.body._root(), _root()))
                        throw new ConsistencyError("body", _root(), this.body._root());
                    if (!Objects.equals(this.body._parent(), this))
                        throw new ConsistencyError("body", this, this.body._parent());
                    break;
                }
                }
                _dirty = false;
            }

            /**
             * The body of a repeat chunk.
             * 
             * This chunk expands to the same byte repeated a number of times,
             * i. e. it implements a form of run-length encoding.
             */
            public static class RepeatBody extends KaitaiStruct.ReadWrite {
                public static RepeatBody fromFile(String fileName) throws IOException {
                    return new RepeatBody(new ByteBufferKaitaiStream(fileName));
                }
                public RepeatBody() {
                    this(null, null, null);
                }

                public RepeatBody(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public RepeatBody(KaitaiStream _io, Dcmp1.Chunk.ExtendedBody _parent) {
                    this(_io, _parent, null);
                }

                public RepeatBody(KaitaiStream _io, Dcmp1.Chunk.ExtendedBody _parent, Dcmp1 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
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
                 * this value must fit into an unsigned 8-bit integer.
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
                private Dcmp1 _root;
                private Dcmp1.Chunk.ExtendedBody _parent;

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
                public Dcmp1 _root() { return _root; }
                public void set_root(Dcmp1 _v) { _dirty = true; _root = _v; }
                public Dcmp1.Chunk.ExtendedBody _parent() { return _parent; }
                public void set_parent(Dcmp1.Chunk.ExtendedBody _v) { _dirty = true; _parent = _v; }
            }
            private int tag;
            private RepeatBody body;
            private Dcmp1 _root;
            private Dcmp1.Chunk _parent;

            /**
             * The chunk's extended tag byte.
             * This controls the structure of the body and the meaning of the chunk.
             */
            public int tag() { return tag; }
            public void setTag(int _v) { _dirty = true; tag = _v; }

            /**
             * The chunk's body.
             */
            public RepeatBody body() { return body; }
            public void setBody(RepeatBody _v) { _dirty = true; body = _v; }
            public Dcmp1 _root() { return _root; }
            public void set_root(Dcmp1 _v) { _dirty = true; _root = _v; }
            public Dcmp1.Chunk _parent() { return _parent; }
            public void set_parent(Dcmp1.Chunk _v) { _dirty = true; _parent = _v; }
        }

        /**
         * The body of a literal data chunk.
         * 
         * The data that this chunk expands to is stored literally in the body (`literal`).
         * Optionally,
         * the literal data may also be stored for use by future backreference chunks (`do_store`).
         */
        public static class LiteralBody extends KaitaiStruct.ReadWrite {
            public LiteralBody(int tag) {
                this(null, null, null, tag);
            }

            public LiteralBody(KaitaiStream _io, int tag) {
                this(_io, null, null, tag);
            }

            public LiteralBody(KaitaiStream _io, Dcmp1.Chunk _parent, int tag) {
                this(_io, _parent, null, tag);
            }

            public LiteralBody(KaitaiStream _io, Dcmp1.Chunk _parent, Dcmp1 _root, int tag) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this.tag = tag;
            }
            public void _read() {
                if (isLenLiteralSeparate()) {
                    this.lenLiteralSeparate = this._io.readU1();
                }
                this.literal = this._io.readBytes(lenLiteral());
                _dirty = false;
            }

            public void _fetchInstances() {
                if (isLenLiteralSeparate()) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                if (isLenLiteralSeparate()) {
                    this._io.writeU1(this.lenLiteralSeparate);
                }
                this._io.writeBytes(this.literal);
            }

            public void _check() {
                if (isLenLiteralSeparate()) {
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
                this.doStore = (isLenLiteralSeparate() ? tag() == 209 : (tag() & 16) != 0);
                return this.doStore;
            }
            public void _invalidateDoStore() { this.doStore = null; }
            private Boolean isLenLiteralSeparate;

            /**
             * Whether the length of the literal is stored separately from the tag.
             */
            public Boolean isLenLiteralSeparate() {
                if (this.isLenLiteralSeparate != null)
                    return this.isLenLiteralSeparate;
                this.isLenLiteralSeparate = tag() >= 208;
                return this.isLenLiteralSeparate;
            }
            public void _invalidateIsLenLiteralSeparate() { this.isLenLiteralSeparate = null; }
            private Integer lenLiteral;

            /**
             * The length of the literal data,
             * in bytes.
             * 
             * In practice,
             * this value is always greater than zero,
             * as there is no use in storing a zero-length literal.
             */
            public Integer lenLiteral() {
                if (this.lenLiteral != null)
                    return this.lenLiteral;
                this.lenLiteral = ((Number) ((isLenLiteralSeparate() ? lenLiteralSeparate() : lenLiteralM1InTag() + 1))).intValue();
                return this.lenLiteral;
            }
            public void _invalidateLenLiteral() { this.lenLiteral = null; }
            private Integer lenLiteralM1InTag;

            /**
             * The part of the tag byte that indicates the length of the literal data,
             * in bytes,
             * minus one.
             * 
             * If the tag byte is 0xd0 or 0xd1,
             * the length is stored in a separate byte after the tag byte and before the literal data.
             */
            public Integer lenLiteralM1InTag() {
                if (this.lenLiteralM1InTag != null)
                    return this.lenLiteralM1InTag;
                if (!(isLenLiteralSeparate())) {
                    this.lenLiteralM1InTag = ((Number) (tag() & 15)).intValue();
                }
                return this.lenLiteralM1InTag;
            }
            public void _invalidateLenLiteralM1InTag() { this.lenLiteralM1InTag = null; }
            private Integer lenLiteralSeparate;
            private byte[] literal;
            private int tag;
            private Dcmp1 _root;
            private Dcmp1.Chunk _parent;

            /**
             * The length of the literal data,
             * in bytes.
             * 
             * This field is only present if the tag byte is 0xd0 or 0xd1.
             * In practice,
             * this only happens if the length is 0x11 or greater,
             * because smaller lengths can be encoded into the tag byte.
             */
            public Integer lenLiteralSeparate() { return lenLiteralSeparate; }
            public void setLenLiteralSeparate(Integer _v) { _dirty = true; lenLiteralSeparate = _v; }

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
            public Dcmp1 _root() { return _root; }
            public void set_root(Dcmp1 _v) { _dirty = true; _root = _v; }
            public Dcmp1.Chunk _parent() { return _parent; }
            public void set_parent(Dcmp1.Chunk _v) { _dirty = true; _parent = _v; }
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

            public TableLookupBody(KaitaiStream _io, Dcmp1.Chunk _parent, int tag) {
                this(_io, _parent, null, tag);
            }

            public TableLookupBody(KaitaiStream _io, Dcmp1.Chunk _parent, Dcmp1 _root, int tag) {
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
             * index 0 stands for tag 0xd5, 1 for 0xd6, etc.
             */
            public List<byte[]> lookupTable() {
                if (this.lookupTable != null)
                    return this.lookupTable;
                this.lookupTable = new ArrayList<byte[]>(Arrays.asList(new byte[] { 0, 0 }, new byte[] { 0, 1 }, new byte[] { 0, 2 }, new byte[] { 0, 3 }, new byte[] { 46, 1 }, new byte[] { 62, 1 }, new byte[] { 1, 1 }, new byte[] { 30, 1 }, new byte[] { -1, -1 }, new byte[] { 14, 1 }, new byte[] { 49, 0 }, new byte[] { 17, 18 }, new byte[] { 1, 7 }, new byte[] { 51, 50 }, new byte[] { 18, 57 }, new byte[] { -19, 16 }, new byte[] { 1, 39 }, new byte[] { 35, 34 }, new byte[] { 1, 55 }, new byte[] { 7, 6 }, new byte[] { 1, 23 }, new byte[] { 1, 35 }, new byte[] { 0, -1 }, new byte[] { 0, 47 }, new byte[] { 7, 14 }, new byte[] { -3, 60 }, new byte[] { 1, 53 }, new byte[] { 1, 21 }, new byte[] { 1, 2 }, new byte[] { 0, 7 }, new byte[] { 0, 62 }, new byte[] { 5, -43 }, new byte[] { 2, 1 }, new byte[] { 6, 7 }, new byte[] { 7, 8 }, new byte[] { 48, 1 }, new byte[] { 1, 51 }, new byte[] { 0, 16 }, new byte[] { 23, 22 }, new byte[] { 55, 62 }, new byte[] { 54, 55 }));
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
                this.value = lookupTable().get(((Number) (tag() - 213)).intValue());
                return this.value;
            }
            public void _invalidateValue() { this.value = null; }
            private int tag;
            private Dcmp1 _root;
            private Dcmp1.Chunk _parent;

            /**
             * The tag byte preceding this chunk body.
             */
            public int tag() { return tag; }
            public void setTag(int _v) { _dirty = true; tag = _v; }
            public Dcmp1 _root() { return _root; }
            public void set_root(Dcmp1 _v) { _dirty = true; _root = _v; }
            public Dcmp1.Chunk _parent() { return _parent; }
            public void set_parent(Dcmp1.Chunk _v) { _dirty = true; _parent = _v; }
        }
        private int tag;
        private KaitaiStruct.ReadWrite body;
        private Dcmp1 _root;
        private Dcmp1 _parent;

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
        public Dcmp1 _root() { return _root; }
        public void set_root(Dcmp1 _v) { _dirty = true; _root = _v; }
        public Dcmp1 _parent() { return _parent; }
        public void set_parent(Dcmp1 _v) { _dirty = true; _parent = _v; }
    }
    private List<Chunk> chunks;
    private Dcmp1 _root;
    private KaitaiStruct.ReadWrite _parent;

    /**
     * The sequence of chunks that make up the compressed data.
     */
    public List<Chunk> chunks() { return chunks; }
    public void setChunks(List<Chunk> _v) { _dirty = true; chunks = _v; }
    public Dcmp1 _root() { return _root; }
    public void set_root(Dcmp1 _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

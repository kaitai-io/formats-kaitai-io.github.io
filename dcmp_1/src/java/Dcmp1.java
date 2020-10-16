// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
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
 * @see <a href="https://github.com/dgelessus/python-rsrcfork/tree/master/rsrcfork/compress/dcmp1.py">Source</a>
 */
public class Dcmp1 extends KaitaiStruct {
    public static Dcmp1 fromFile(String fileName) throws IOException {
        return new Dcmp1(new ByteBufferKaitaiStream(fileName));
    }

    public Dcmp1(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Dcmp1(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Dcmp1(KaitaiStream _io, KaitaiStruct _parent, Dcmp1 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.chunks = new ArrayList<Chunk>();
        {
            Chunk _it;
            int i = 0;
            do {
                _it = new Chunk(this._io, this, _root);
                this.chunks.add(_it);
                i++;
            } while (!(_it.tag() == 255));
        }
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
    public static class Chunk extends KaitaiStruct {
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
            _read();
        }
        private void _read() {
            this.tag = this._io.readU1();
            {
                TagKind on = ( ((tag() >= 0) && (tag() <= 31))  ? TagKind.LITERAL : ( ((tag() >= 32) && (tag() <= 207))  ? TagKind.BACKREFERENCE : ( ((tag() >= 208) && (tag() <= 209))  ? TagKind.LITERAL : (tag() == 210 ? TagKind.BACKREFERENCE : ( ((tag() >= 213) && (tag() <= 253))  ? TagKind.TABLE_LOOKUP : (tag() == 254 ? TagKind.EXTENDED : (tag() == 255 ? TagKind.END : TagKind.INVALID)))))));
                if (on != null) {
                    switch (( ((tag() >= 0) && (tag() <= 31))  ? TagKind.LITERAL : ( ((tag() >= 32) && (tag() <= 207))  ? TagKind.BACKREFERENCE : ( ((tag() >= 208) && (tag() <= 209))  ? TagKind.LITERAL : (tag() == 210 ? TagKind.BACKREFERENCE : ( ((tag() >= 213) && (tag() <= 253))  ? TagKind.TABLE_LOOKUP : (tag() == 254 ? TagKind.EXTENDED : (tag() == 255 ? TagKind.END : TagKind.INVALID)))))))) {
                    case EXTENDED: {
                        this.body = new ExtendedBody(this._io, this, _root);
                        break;
                    }
                    case LITERAL: {
                        this.body = new LiteralBody(this._io, this, _root, tag());
                        break;
                    }
                    case END: {
                        this.body = new EndBody(this._io, this, _root);
                        break;
                    }
                    case TABLE_LOOKUP: {
                        this.body = new TableLookupBody(this._io, this, _root, tag());
                        break;
                    }
                    case BACKREFERENCE: {
                        this.body = new BackreferenceBody(this._io, this, _root, tag());
                        break;
                    }
                    }
                }
            }
        }

        /**
         * The body of a literal data chunk.
         * 
         * The data that this chunk expands to is stored literally in the body (`literal`).
         * Optionally,
         * the literal data may also be stored for use by future backreference chunks (`do_store`).
         */
        public static class LiteralBody extends KaitaiStruct {

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
                _read();
            }
            private void _read() {
                if (isLenLiteralSeparate()) {
                    this.lenLiteralSeparate = this._io.readU1();
                }
                this.literal = this._io.readBytes(lenLiteral());
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
                boolean _tmp = (boolean) ((isLenLiteralSeparate() ? tag() == 209 : (tag() & 16) != 0));
                this.doStore = _tmp;
                return this.doStore;
            }
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
                    int _tmp = (int) ((tag() & 15));
                    this.lenLiteralM1InTag = _tmp;
                }
                return this.lenLiteralM1InTag;
            }
            private Boolean isLenLiteralSeparate;

            /**
             * Whether the length of the literal is stored separately from the tag.
             */
            public Boolean isLenLiteralSeparate() {
                if (this.isLenLiteralSeparate != null)
                    return this.isLenLiteralSeparate;
                boolean _tmp = (boolean) (tag() >= 208);
                this.isLenLiteralSeparate = _tmp;
                return this.isLenLiteralSeparate;
            }
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
                int _tmp = (int) ((isLenLiteralSeparate() ? lenLiteralSeparate() : (lenLiteralM1InTag() + 1)));
                this.lenLiteral = _tmp;
                return this.lenLiteral;
            }
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

            /**
             * The literal data.
             */
            public byte[] literal() { return literal; }

            /**
             * The tag byte preceding this chunk body.
             */
            public int tag() { return tag; }
            public Dcmp1 _root() { return _root; }
            public Dcmp1.Chunk _parent() { return _parent; }
        }

        /**
         * The body of a backreference chunk.
         * 
         * This chunk expands to the data stored in a preceding literal chunk,
         * indicated by an index number (`index`).
         */
        public static class BackreferenceBody extends KaitaiStruct {

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
                _read();
            }
            private void _read() {
                if (isIndexSeparate()) {
                    this.indexSeparateMinus = this._io.readU1();
                }
            }
            private Boolean isIndexSeparate;

            /**
             * Whether the index is stored separately from the tag.
             */
            public Boolean isIndexSeparate() {
                if (this.isIndexSeparate != null)
                    return this.isIndexSeparate;
                boolean _tmp = (boolean) (tag() == 210);
                this.isIndexSeparate = _tmp;
                return this.isIndexSeparate;
            }
            private Integer indexInTag;

            /**
             * The index of the referenced literal chunk,
             * as stored in the tag byte.
             */
            public Integer indexInTag() {
                if (this.indexInTag != null)
                    return this.indexInTag;
                int _tmp = (int) ((tag() - 32));
                this.indexInTag = _tmp;
                return this.indexInTag;
            }
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
                    int _tmp = (int) ((indexSeparateMinus() + 176));
                    this.indexSeparate = _tmp;
                }
                return this.indexSeparate;
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
                int _tmp = (int) ((isIndexSeparate() ? indexSeparate() : indexInTag()));
                this.index = _tmp;
                return this.index;
            }
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

            /**
             * The tag byte preceding this chunk body.
             */
            public int tag() { return tag; }
            public Dcmp1 _root() { return _root; }
            public Dcmp1.Chunk _parent() { return _parent; }
        }

        /**
         * The body of a table lookup chunk.
         * This body is always empty.
         * 
         * This chunk always expands to two bytes (`value`),
         * determined from the tag byte using a fixed lookup table (`lookup_table`).
         * This lookup table is hardcoded in the decompressor and always the same for all compressed data.
         */
        public static class TableLookupBody extends KaitaiStruct {

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
                _read();
            }
            private void _read() {
            }
            private ArrayList<byte[]> lookupTable;

            /**
             * Fixed lookup table that maps tag byte numbers to two bytes each.
             * 
             * The entries in the lookup table are offset -
             * index 0 stands for tag 0xd5, 1 for 0xd6, etc.
             */
            public ArrayList<byte[]> lookupTable() {
                if (this.lookupTable != null)
                    return this.lookupTable;
                this.lookupTable = new ArrayList<byte[]>(Arrays.asList(new byte[] { 0, 0 }, new byte[] { 0, 1 }, new byte[] { 0, 2 }, new byte[] { 0, 3 }, new byte[] { 46, 1 }, new byte[] { 62, 1 }, new byte[] { 1, 1 }, new byte[] { 30, 1 }, new byte[] { -1, -1 }, new byte[] { 14, 1 }, new byte[] { 49, 0 }, new byte[] { 17, 18 }, new byte[] { 1, 7 }, new byte[] { 51, 50 }, new byte[] { 18, 57 }, new byte[] { -19, 16 }, new byte[] { 1, 39 }, new byte[] { 35, 34 }, new byte[] { 1, 55 }, new byte[] { 7, 6 }, new byte[] { 1, 23 }, new byte[] { 1, 35 }, new byte[] { 0, -1 }, new byte[] { 0, 47 }, new byte[] { 7, 14 }, new byte[] { -3, 60 }, new byte[] { 1, 53 }, new byte[] { 1, 21 }, new byte[] { 1, 2 }, new byte[] { 0, 7 }, new byte[] { 0, 62 }, new byte[] { 5, -43 }, new byte[] { 2, 1 }, new byte[] { 6, 7 }, new byte[] { 7, 8 }, new byte[] { 48, 1 }, new byte[] { 1, 51 }, new byte[] { 0, 16 }, new byte[] { 23, 22 }, new byte[] { 55, 62 }, new byte[] { 54, 55 }));
                return this.lookupTable;
            }
            private byte[] value;

            /**
             * The two bytes that the tag byte expands to,
             * based on the fixed lookup table.
             */
            public byte[] value() {
                if (this.value != null)
                    return this.value;
                this.value = lookupTable().get((int) (tag() - 213));
                return this.value;
            }
            private int tag;
            private Dcmp1 _root;
            private Dcmp1.Chunk _parent;

            /**
             * The tag byte preceding this chunk body.
             */
            public int tag() { return tag; }
            public Dcmp1 _root() { return _root; }
            public Dcmp1.Chunk _parent() { return _parent; }
        }

        /**
         * The body of an end chunk.
         * This body is always empty.
         * 
         * The last chunk in the compressed data must always be an end chunk.
         * An end chunk cannot appear elsewhere in the compressed data.
         */
        public static class EndBody extends KaitaiStruct {
            public static EndBody fromFile(String fileName) throws IOException {
                return new EndBody(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
            }
            private Dcmp1 _root;
            private Dcmp1.Chunk _parent;
            public Dcmp1 _root() { return _root; }
            public Dcmp1.Chunk _parent() { return _parent; }
        }

        /**
         * The body of an extended chunk.
         * The meaning of this chunk depends on the extended tag byte stored in the chunk data.
         */
        public static class ExtendedBody extends KaitaiStruct {
            public static ExtendedBody fromFile(String fileName) throws IOException {
                return new ExtendedBody(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.tag = this._io.readU1();
                switch (tag()) {
                case 2: {
                    this.body = new RepeatBody(this._io, this, _root);
                    break;
                }
                }
            }

            /**
             * The body of a repeat chunk.
             * 
             * This chunk expands to the same byte repeated a number of times,
             * i. e. it implements a form of run-length encoding.
             */
            public static class RepeatBody extends KaitaiStruct {
                public static RepeatBody fromFile(String fileName) throws IOException {
                    return new RepeatBody(new ByteBufferKaitaiStream(fileName));
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
                    _read();
                }
                private void _read() {
                    this.toRepeatRaw = new DcmpVariableLengthInteger(this._io);
                    this.repeatCountM1Raw = new DcmpVariableLengthInteger(this._io);
                }
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
                    int _tmp = (int) (toRepeatRaw().value());
                    this.toRepeat = _tmp;
                    return this.toRepeat;
                }
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
                    int _tmp = (int) (repeatCountM1Raw().value());
                    this.repeatCountM1 = _tmp;
                    return this.repeatCountM1;
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
                    int _tmp = (int) ((repeatCountM1() + 1));
                    this.repeatCount = _tmp;
                    return this.repeatCount;
                }
                private DcmpVariableLengthInteger toRepeatRaw;
                private DcmpVariableLengthInteger repeatCountM1Raw;
                private Dcmp1 _root;
                private Dcmp1.Chunk.ExtendedBody _parent;

                /**
                 * Raw variable-length integer representation of `to_repeat`.
                 */
                public DcmpVariableLengthInteger toRepeatRaw() { return toRepeatRaw; }

                /**
                 * Raw variable-length integer representation of `repeat_count_m1`.
                 */
                public DcmpVariableLengthInteger repeatCountM1Raw() { return repeatCountM1Raw; }
                public Dcmp1 _root() { return _root; }
                public Dcmp1.Chunk.ExtendedBody _parent() { return _parent; }
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

            /**
             * The chunk's body.
             */
            public RepeatBody body() { return body; }
            public Dcmp1 _root() { return _root; }
            public Dcmp1.Chunk _parent() { return _parent; }
        }
        private int tag;
        private KaitaiStruct body;
        private Dcmp1 _root;
        private Dcmp1 _parent;

        /**
         * The chunk's tag byte.
         * This controls the structure of the body and the meaning of the chunk.
         */
        public int tag() { return tag; }

        /**
         * The chunk's body.
         * 
         * Certain chunks do not have any data following the tag byte.
         * In this case,
         * the body is a zero-length structure.
         */
        public KaitaiStruct body() { return body; }
        public Dcmp1 _root() { return _root; }
        public Dcmp1 _parent() { return _parent; }
    }
    private ArrayList<Chunk> chunks;
    private Dcmp1 _root;
    private KaitaiStruct _parent;

    /**
     * The sequence of chunks that make up the compressed data.
     */
    public ArrayList<Chunk> chunks() { return chunks; }
    public Dcmp1 _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;


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
 * @see <a href="https://github.com/dgelessus/python-rsrcfork/tree/master/rsrcfork/compress/dcmp0.py">Source</a>
 */
public class Dcmp0 extends KaitaiStruct {
    public static Dcmp0 fromFile(String fileName) throws IOException {
        return new Dcmp0(new ByteBufferKaitaiStream(fileName));
    }

    public Dcmp0(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Dcmp0(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Dcmp0(KaitaiStream _io, KaitaiStruct _parent, Dcmp0 _root) {
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

        public Chunk(KaitaiStream _io, Dcmp0 _parent) {
            this(_io, _parent, null);
        }

        public Chunk(KaitaiStream _io, Dcmp0 _parent, Dcmp0 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.tag = this._io.readU1();
            switch (( ((tag() >= 0) && (tag() <= 31))  ? TagKind.LITERAL : ( ((tag() >= 32) && (tag() <= 74))  ? TagKind.BACKREFERENCE : ( ((tag() >= 75) && (tag() <= 253))  ? TagKind.TABLE_LOOKUP : (tag() == 254 ? TagKind.EXTENDED : (tag() == 255 ? TagKind.END : TagKind.INVALID)))))) {
            case END: {
                this.body = new EndBody(this._io, this, _root);
                break;
            }
            case LITERAL: {
                this.body = new LiteralBody(this._io, this, _root, tag());
                break;
            }
            case BACKREFERENCE: {
                this.body = new BackreferenceBody(this._io, this, _root, tag());
                break;
            }
            case TABLE_LOOKUP: {
                this.body = new TableLookupBody(this._io, this, _root, tag());
                break;
            }
            case EXTENDED: {
                this.body = new ExtendedBody(this._io, this, _root);
                break;
            }
            }
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
        public static class LiteralBody extends KaitaiStruct {

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
                _read();
            }
            private void _read() {
                if (isLenLiteralDiv2Separate()) {
                    this.lenLiteralDiv2Separate = this._io.readU1();
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
                boolean _tmp = (boolean) ((tag() & 16) != 0);
                this.doStore = _tmp;
                return this.doStore;
            }
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
                int _tmp = (int) ((isLenLiteralDiv2Separate() ? lenLiteralDiv2Separate() : lenLiteralDiv2InTag()));
                this.lenLiteralDiv2 = _tmp;
                return this.lenLiteralDiv2;
            }
            private Integer lenLiteral;

            /**
             * The length of the literal data,
             * in bytes.
             */
            public Integer lenLiteral() {
                if (this.lenLiteral != null)
                    return this.lenLiteral;
                int _tmp = (int) ((lenLiteralDiv2() * 2));
                this.lenLiteral = _tmp;
                return this.lenLiteral;
            }
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
                int _tmp = (int) ((tag() & 15));
                this.lenLiteralDiv2InTag = _tmp;
                return this.lenLiteralDiv2InTag;
            }
            private Boolean isLenLiteralDiv2Separate;

            /**
             * Whether the length of the literal is stored separately from the tag.
             */
            public Boolean isLenLiteralDiv2Separate() {
                if (this.isLenLiteralDiv2Separate != null)
                    return this.isLenLiteralDiv2Separate;
                boolean _tmp = (boolean) (lenLiteralDiv2InTag() == 0);
                this.isLenLiteralDiv2Separate = _tmp;
                return this.isLenLiteralDiv2Separate;
            }
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

            /**
             * The literal data.
             */
            public byte[] literal() { return literal; }

            /**
             * The tag byte preceding this chunk body.
             */
            public int tag() { return tag; }
            public Dcmp0 _root() { return _root; }
            public Dcmp0.Chunk _parent() { return _parent; }
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

            public BackreferenceBody(KaitaiStream _io, Dcmp0.Chunk _parent, int tag) {
                this(_io, _parent, null, tag);
            }

            public BackreferenceBody(KaitaiStream _io, Dcmp0.Chunk _parent, Dcmp0 _root, int tag) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this.tag = tag;
                _read();
            }
            private void _read() {
                if (isIndexSeparate()) {
                    switch (tag()) {
                    case 32: {
                        this.indexSeparateMinus = (int) (this._io.readU1());
                        break;
                    }
                    case 33: {
                        this.indexSeparateMinus = (int) (this._io.readU1());
                        break;
                    }
                    case 34: {
                        this.indexSeparateMinus = this._io.readU2be();
                        break;
                    }
                    }
                }
            }
            private Boolean isIndexSeparate;

            /**
             * Whether the index is stored separately from the tag.
             */
            public Boolean isIndexSeparate() {
                if (this.isIndexSeparate != null)
                    return this.isIndexSeparate;
                boolean _tmp = (boolean) ( ((tag() >= 32) && (tag() <= 34)) );
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
                int _tmp = (int) ((tag() - 35));
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
                    int _tmp = (int) (((indexSeparateMinus() + 40) + (tag() == 33 ? 256 : 0)));
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

            /**
             * The tag byte preceding this chunk body.
             */
            public int tag() { return tag; }
            public Dcmp0 _root() { return _root; }
            public Dcmp0.Chunk _parent() { return _parent; }
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

            public TableLookupBody(KaitaiStream _io, Dcmp0.Chunk _parent, int tag) {
                this(_io, _parent, null, tag);
            }

            public TableLookupBody(KaitaiStream _io, Dcmp0.Chunk _parent, Dcmp0 _root, int tag) {
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
             * index 0 stands for tag 0x4b, 1 for 0x4c, etc.
             */
            public ArrayList<byte[]> lookupTable() {
                if (this.lookupTable != null)
                    return this.lookupTable;
                this.lookupTable = new ArrayList<byte[]>(Arrays.asList(new byte[] { 0, 0 }, new byte[] { 78, -70 }, new byte[] { 0, 8 }, new byte[] { 78, 117 }, new byte[] { 0, 12 }, new byte[] { 78, -83 }, new byte[] { 32, 83 }, new byte[] { 47, 11 }, new byte[] { 97, 0 }, new byte[] { 0, 16 }, new byte[] { 112, 0 }, new byte[] { 47, 0 }, new byte[] { 72, 110 }, new byte[] { 32, 80 }, new byte[] { 32, 110 }, new byte[] { 47, 46 }, new byte[] { -1, -4 }, new byte[] { 72, -25 }, new byte[] { 63, 60 }, new byte[] { 0, 4 }, new byte[] { -1, -8 }, new byte[] { 47, 12 }, new byte[] { 32, 6 }, new byte[] { 78, -19 }, new byte[] { 78, 86 }, new byte[] { 32, 104 }, new byte[] { 78, 94 }, new byte[] { 0, 1 }, new byte[] { 88, -113 }, new byte[] { 79, -17 }, new byte[] { 0, 2 }, new byte[] { 0, 24 }, new byte[] { 96, 0 }, new byte[] { -1, -1 }, new byte[] { 80, -113 }, new byte[] { 78, -112 }, new byte[] { 0, 6 }, new byte[] { 38, 110 }, new byte[] { 0, 20 }, new byte[] { -1, -12 }, new byte[] { 76, -18 }, new byte[] { 0, 10 }, new byte[] { 0, 14 }, new byte[] { 65, -18 }, new byte[] { 76, -33 }, new byte[] { 72, -64 }, new byte[] { -1, -16 }, new byte[] { 45, 64 }, new byte[] { 0, 18 }, new byte[] { 48, 46 }, new byte[] { 112, 1 }, new byte[] { 47, 40 }, new byte[] { 32, 84 }, new byte[] { 103, 0 }, new byte[] { 0, 32 }, new byte[] { 0, 28 }, new byte[] { 32, 95 }, new byte[] { 24, 0 }, new byte[] { 38, 111 }, new byte[] { 72, 120 }, new byte[] { 0, 22 }, new byte[] { 65, -6 }, new byte[] { 48, 60 }, new byte[] { 40, 64 }, new byte[] { 114, 0 }, new byte[] { 40, 110 }, new byte[] { 32, 12 }, new byte[] { 102, 0 }, new byte[] { 32, 107 }, new byte[] { 47, 7 }, new byte[] { 85, -113 }, new byte[] { 0, 40 }, new byte[] { -1, -2 }, new byte[] { -1, -20 }, new byte[] { 34, -40 }, new byte[] { 32, 11 }, new byte[] { 0, 15 }, new byte[] { 89, -113 }, new byte[] { 47, 60 }, new byte[] { -1, 0 }, new byte[] { 1, 24 }, new byte[] { -127, -31 }, new byte[] { 74, 0 }, new byte[] { 78, -80 }, new byte[] { -1, -24 }, new byte[] { 72, -57 }, new byte[] { 0, 3 }, new byte[] { 0, 34 }, new byte[] { 0, 7 }, new byte[] { 0, 26 }, new byte[] { 103, 6 }, new byte[] { 103, 8 }, new byte[] { 78, -7 }, new byte[] { 0, 36 }, new byte[] { 32, 120 }, new byte[] { 8, 0 }, new byte[] { 102, 4 }, new byte[] { 0, 42 }, new byte[] { 78, -48 }, new byte[] { 48, 40 }, new byte[] { 38, 95 }, new byte[] { 103, 4 }, new byte[] { 0, 48 }, new byte[] { 67, -18 }, new byte[] { 63, 0 }, new byte[] { 32, 31 }, new byte[] { 0, 30 }, new byte[] { -1, -10 }, new byte[] { 32, 46 }, new byte[] { 66, -89 }, new byte[] { 32, 7 }, new byte[] { -1, -6 }, new byte[] { 96, 2 }, new byte[] { 61, 64 }, new byte[] { 12, 64 }, new byte[] { 102, 6 }, new byte[] { 0, 38 }, new byte[] { 45, 72 }, new byte[] { 47, 1 }, new byte[] { 112, -1 }, new byte[] { 96, 4 }, new byte[] { 24, -128 }, new byte[] { 74, 64 }, new byte[] { 0, 64 }, new byte[] { 0, 44 }, new byte[] { 47, 8 }, new byte[] { 0, 17 }, new byte[] { -1, -28 }, new byte[] { 33, 64 }, new byte[] { 38, 64 }, new byte[] { -1, -14 }, new byte[] { 66, 110 }, new byte[] { 78, -71 }, new byte[] { 61, 124 }, new byte[] { 0, 56 }, new byte[] { 0, 13 }, new byte[] { 96, 6 }, new byte[] { 66, 46 }, new byte[] { 32, 60 }, new byte[] { 103, 12 }, new byte[] { 45, 104 }, new byte[] { 102, 8 }, new byte[] { 74, 46 }, new byte[] { 74, -82 }, new byte[] { 0, 46 }, new byte[] { 72, 64 }, new byte[] { 34, 95 }, new byte[] { 34, 0 }, new byte[] { 103, 10 }, new byte[] { 48, 7 }, new byte[] { 66, 103 }, new byte[] { 0, 50 }, new byte[] { 32, 40 }, new byte[] { 0, 9 }, new byte[] { 72, 122 }, new byte[] { 2, 0 }, new byte[] { 47, 43 }, new byte[] { 0, 5 }, new byte[] { 34, 110 }, new byte[] { 102, 2 }, new byte[] { -27, -128 }, new byte[] { 103, 14 }, new byte[] { 102, 10 }, new byte[] { 0, 80 }, new byte[] { 62, 0 }, new byte[] { 102, 12 }, new byte[] { 46, 0 }, new byte[] { -1, -18 }, new byte[] { 32, 109 }, new byte[] { 32, 64 }, new byte[] { -1, -32 }, new byte[] { 83, 64 }, new byte[] { 96, 8 }, new byte[] { 4, -128 }, new byte[] { 0, 104 }, new byte[] { 11, 124 }, new byte[] { 68, 0 }, new byte[] { 65, -24 }, new byte[] { 72, 65 }));
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
                this.value = lookupTable().get((int) (tag() - 75));
                return this.value;
            }
            private int tag;
            private Dcmp0 _root;
            private Dcmp0.Chunk _parent;

            /**
             * The tag byte preceding this chunk body.
             */
            public int tag() { return tag; }
            public Dcmp0 _root() { return _root; }
            public Dcmp0.Chunk _parent() { return _parent; }
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

            public EndBody(KaitaiStream _io, Dcmp0.Chunk _parent) {
                this(_io, _parent, null);
            }

            public EndBody(KaitaiStream _io, Dcmp0.Chunk _parent, Dcmp0 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
            }
            private Dcmp0 _root;
            private Dcmp0.Chunk _parent;
            public Dcmp0 _root() { return _root; }
            public Dcmp0.Chunk _parent() { return _parent; }
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

            public ExtendedBody(KaitaiStream _io, Dcmp0.Chunk _parent) {
                this(_io, _parent, null);
            }

            public ExtendedBody(KaitaiStream _io, Dcmp0.Chunk _parent, Dcmp0 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.tag = this._io.readU1();
                switch (tag()) {
                case 0: {
                    this.body = new JumpTableBody(this._io, this, _root);
                    break;
                }
                case 4: {
                    this.body = new DeltaEncoding16BitBody(this._io, this, _root);
                    break;
                }
                case 6: {
                    this.body = new DeltaEncoding32BitBody(this._io, this, _root);
                    break;
                }
                case 3: {
                    this.body = new RepeatBody(this._io, this, _root, tag());
                    break;
                }
                case 2: {
                    this.body = new RepeatBody(this._io, this, _root, tag());
                    break;
                }
                }
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
            public static class JumpTableBody extends KaitaiStruct {
                public static JumpTableBody fromFile(String fileName) throws IOException {
                    return new JumpTableBody(new ByteBufferKaitaiStream(fileName));
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
                    _read();
                }
                private void _read() {
                    this.segmentNumberRaw = new DcmpVariableLengthInteger(this._io);
                    this.numAddressesRaw = new DcmpVariableLengthInteger(this._io);
                    addressesRaw = new ArrayList<DcmpVariableLengthInteger>((int) (numAddresses()));
                    for (int i = 0; i < numAddresses(); i++) {
                        this.addressesRaw.add(new DcmpVariableLengthInteger(this._io));
                    }
                }
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
                    int _tmp = (int) (segmentNumberRaw().value());
                    this.segmentNumber = _tmp;
                    return this.segmentNumber;
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
                    int _tmp = (int) (numAddressesRaw().value());
                    this.numAddresses = _tmp;
                    return this.numAddresses;
                }
                private DcmpVariableLengthInteger segmentNumberRaw;
                private DcmpVariableLengthInteger numAddressesRaw;
                private ArrayList<DcmpVariableLengthInteger> addressesRaw;
                private Dcmp0 _root;
                private Dcmp0.Chunk.ExtendedBody _parent;

                /**
                 * Raw variable-length integer representation of `segment_number`.
                 */
                public DcmpVariableLengthInteger segmentNumberRaw() { return segmentNumberRaw; }

                /**
                 * Raw variable-length integer representation of `num_addresses`.
                 */
                public DcmpVariableLengthInteger numAddressesRaw() { return numAddressesRaw; }

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
                public ArrayList<DcmpVariableLengthInteger> addressesRaw() { return addressesRaw; }
                public Dcmp0 _root() { return _root; }
                public Dcmp0.Chunk.ExtendedBody _parent() { return _parent; }
            }

            /**
             * The body of a repeat chunk.
             * 
             * This chunk expands to a 1-byte or 2-byte value repeated a number of times,
             * i. e. it implements a form of run-length encoding.
             */
            public static class RepeatBody extends KaitaiStruct {

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
                    _read();
                }
                private void _read() {
                    this.toRepeatRaw = new DcmpVariableLengthInteger(this._io);
                    this.repeatCountM1Raw = new DcmpVariableLengthInteger(this._io);
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
                    int _tmp = (int) ((tag() == 2 ? 1 : (tag() == 3 ? 2 : -1)));
                    this.byteCount = _tmp;
                    return this.byteCount;
                }
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
                private int tag;
                private Dcmp0 _root;
                private Dcmp0.Chunk.ExtendedBody _parent;

                /**
                 * Raw variable-length integer representation of `to_repeat`.
                 */
                public DcmpVariableLengthInteger toRepeatRaw() { return toRepeatRaw; }

                /**
                 * Raw variable-length integer representation of `repeat_count_m1`.
                 */
                public DcmpVariableLengthInteger repeatCountM1Raw() { return repeatCountM1Raw; }

                /**
                 * The extended tag byte preceding this chunk body.
                 */
                public int tag() { return tag; }
                public Dcmp0 _root() { return _root; }
                public Dcmp0.Chunk.ExtendedBody _parent() { return _parent; }
            }

            /**
             * The body of a 16-bit delta encoding chunk.
             * 
             * This chunk expands to a sequence of 16-bit big-endian integer values.
             * The first value is stored literally.
             * All following values are stored as deltas relative to the previous value.
             */
            public static class DeltaEncoding16BitBody extends KaitaiStruct {
                public static DeltaEncoding16BitBody fromFile(String fileName) throws IOException {
                    return new DeltaEncoding16BitBody(new ByteBufferKaitaiStream(fileName));
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
                    _read();
                }
                private void _read() {
                    this.firstValueRaw = new DcmpVariableLengthInteger(this._io);
                    this.numDeltasRaw = new DcmpVariableLengthInteger(this._io);
                    deltas = new ArrayList<Byte>((int) (numDeltas()));
                    for (int i = 0; i < numDeltas(); i++) {
                        this.deltas.add(this._io.readS1());
                    }
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
                    int _tmp = (int) (firstValueRaw().value());
                    this.firstValue = _tmp;
                    return this.firstValue;
                }
                private Integer numDeltas;

                /**
                 * The number of deltas stored in this chunk.
                 * 
                 * This number must not be negative.
                 */
                public Integer numDeltas() {
                    if (this.numDeltas != null)
                        return this.numDeltas;
                    int _tmp = (int) (numDeltasRaw().value());
                    this.numDeltas = _tmp;
                    return this.numDeltas;
                }
                private DcmpVariableLengthInteger firstValueRaw;
                private DcmpVariableLengthInteger numDeltasRaw;
                private ArrayList<Byte> deltas;
                private Dcmp0 _root;
                private Dcmp0.Chunk.ExtendedBody _parent;

                /**
                 * Raw variable-length integer representation of `first_value`.
                 */
                public DcmpVariableLengthInteger firstValueRaw() { return firstValueRaw; }

                /**
                 * Raw variable-length integer representation of `num_deltas`.
                 */
                public DcmpVariableLengthInteger numDeltasRaw() { return numDeltasRaw; }

                /**
                 * The deltas for each value relative to the previous value.
                 * 
                 * Each of these deltas is a signed 8-bit value.
                 * When adding the delta to the previous value,
                 * 16-bit integer wraparound is performed if necessary,
                 * so that the resulting value always fits into a 16-bit signed integer.
                 */
                public ArrayList<Byte> deltas() { return deltas; }
                public Dcmp0 _root() { return _root; }
                public Dcmp0.Chunk.ExtendedBody _parent() { return _parent; }
            }

            /**
             * The body of a 32-bit delta encoding chunk.
             * 
             * This chunk expands to a sequence of 32-bit big-endian integer values.
             * The first value is stored literally.
             * All following values are stored as deltas relative to the previous value.
             */
            public static class DeltaEncoding32BitBody extends KaitaiStruct {
                public static DeltaEncoding32BitBody fromFile(String fileName) throws IOException {
                    return new DeltaEncoding32BitBody(new ByteBufferKaitaiStream(fileName));
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
                    _read();
                }
                private void _read() {
                    this.firstValueRaw = new DcmpVariableLengthInteger(this._io);
                    this.numDeltasRaw = new DcmpVariableLengthInteger(this._io);
                    deltasRaw = new ArrayList<DcmpVariableLengthInteger>((int) (numDeltas()));
                    for (int i = 0; i < numDeltas(); i++) {
                        this.deltasRaw.add(new DcmpVariableLengthInteger(this._io));
                    }
                }
                private Integer firstValue;

                /**
                 * The first value in the sequence.
                 */
                public Integer firstValue() {
                    if (this.firstValue != null)
                        return this.firstValue;
                    int _tmp = (int) (firstValueRaw().value());
                    this.firstValue = _tmp;
                    return this.firstValue;
                }
                private Integer numDeltas;

                /**
                 * The number of deltas stored in this chunk.
                 * 
                 * This number must not be negative.
                 */
                public Integer numDeltas() {
                    if (this.numDeltas != null)
                        return this.numDeltas;
                    int _tmp = (int) (numDeltasRaw().value());
                    this.numDeltas = _tmp;
                    return this.numDeltas;
                }
                private DcmpVariableLengthInteger firstValueRaw;
                private DcmpVariableLengthInteger numDeltasRaw;
                private ArrayList<DcmpVariableLengthInteger> deltasRaw;
                private Dcmp0 _root;
                private Dcmp0.Chunk.ExtendedBody _parent;

                /**
                 * Raw variable-length integer representation of `first_value`.
                 */
                public DcmpVariableLengthInteger firstValueRaw() { return firstValueRaw; }

                /**
                 * Raw variable-length integer representation of `num_deltas`.
                 */
                public DcmpVariableLengthInteger numDeltasRaw() { return numDeltasRaw; }

                /**
                 * The deltas for each value relative to the previous value,
                 * stored as variable-length integers.
                 * 
                 * Each of these deltas is a signed value.
                 * When adding the delta to the previous value,
                 * 32-bit integer wraparound is performed if necessary,
                 * so that the resulting value always fits into a 32-bit signed integer.
                 */
                public ArrayList<DcmpVariableLengthInteger> deltasRaw() { return deltasRaw; }
                public Dcmp0 _root() { return _root; }
                public Dcmp0.Chunk.ExtendedBody _parent() { return _parent; }
            }
            private int tag;
            private KaitaiStruct body;
            private Dcmp0 _root;
            private Dcmp0.Chunk _parent;

            /**
             * The chunk's extended tag byte.
             * This controls the structure of the body and the meaning of the chunk.
             */
            public int tag() { return tag; }

            /**
             * The chunk's body.
             */
            public KaitaiStruct body() { return body; }
            public Dcmp0 _root() { return _root; }
            public Dcmp0.Chunk _parent() { return _parent; }
        }
        private int tag;
        private KaitaiStruct body;
        private Dcmp0 _root;
        private Dcmp0 _parent;

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
        public Dcmp0 _root() { return _root; }
        public Dcmp0 _parent() { return _parent; }
    }
    private ArrayList<Chunk> chunks;
    private Dcmp0 _root;
    private KaitaiStruct _parent;

    /**
     * The sequence of chunks that make up the compressed data.
     */
    public ArrayList<Chunk> chunks() { return chunks; }
    public Dcmp0 _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.Charset;


/**
 * BSON, short for Binary JSON, is a binary-encoded serialization of JSON-like documents. Like JSON, BSON supports the embedding of documents and arrays within other documents and arrays. BSON also contains extensions that allow representation of data types that are not part of the JSON spec. For example, BSON has a Date type and a BinData type. BSON can be compared to binary interchange formats, like Protocol Buffers. BSON is more "schemaless" than Protocol Buffers, which can give it an advantage in flexibility but also a slight disadvantage in space efficiency (BSON has overhead for field names within the serialized data). BSON was designed to have the following three characteristics:
 *   * Lightweight. Keeping spatial overhead to a minimum is important for any data representation format, especially when used over the network.
 *   * Traversable. BSON is designed to be traversed easily. This is a vital property in its role as the primary data representation for MongoDB.
 *   * Efficient. Encoding data to BSON and decoding from BSON can be performed very quickly in most languages due to the use of C data types.
 */
public class Bson extends KaitaiStruct {
    public static Bson fromFile(String fileName) throws IOException {
        return new Bson(new ByteBufferKaitaiStream(fileName));
    }

    public Bson(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Bson(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Bson(KaitaiStream _io, KaitaiStruct _parent, Bson _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.len = this._io.readS4le();
        this._raw_fields = this._io.readBytes((len() - 5));
        KaitaiStream _io__raw_fields = new ByteBufferKaitaiStream(_raw_fields);
        this.fields = new ElementsList(_io__raw_fields, this, _root);
        this.terminator = this._io.readBytes(1);
        if (!(Arrays.equals(terminator(), new byte[] { 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, terminator(), _io(), "/seq/2");
        }
    }

    /**
     * Special internal type used by MongoDB replication and sharding. First 4 bytes are an increment, second 4 are a timestamp.
     */
    public static class Timestamp extends KaitaiStruct {
        public static Timestamp fromFile(String fileName) throws IOException {
            return new Timestamp(new ByteBufferKaitaiStream(fileName));
        }

        public Timestamp(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Timestamp(KaitaiStream _io, Bson.Element _parent) {
            this(_io, _parent, null);
        }

        public Timestamp(KaitaiStream _io, Bson.Element _parent, Bson _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.increment = this._io.readU4le();
            this.timestamp = this._io.readU4le();
        }
        private long increment;
        private long timestamp;
        private Bson _root;
        private Bson.Element _parent;
        public long increment() { return increment; }
        public long timestamp() { return timestamp; }
        public Bson _root() { return _root; }
        public Bson.Element _parent() { return _parent; }
    }

    /**
     * The BSON "binary" or "BinData" datatype is used to represent arrays of bytes. It is somewhat analogous to the Java notion of a ByteArray. BSON binary values have a subtype. This is used to indicate what kind of data is in the byte array. Subtypes from zero to 127 are predefined or reserved. Subtypes from 128-255 are user-defined.
     */
    public static class BinData extends KaitaiStruct {
        public static BinData fromFile(String fileName) throws IOException {
            return new BinData(new ByteBufferKaitaiStream(fileName));
        }

        public enum Subtype {
            GENERIC(0),
            FUNCTION(1),
            BYTE_ARRAY_DEPRECATED(2),
            UUID_DEPRECATED(3),
            UUID(4),
            MD5(5),
            CUSTOM(128);

            private final long id;
            Subtype(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, Subtype> byId = new HashMap<Long, Subtype>(7);
            static {
                for (Subtype e : Subtype.values())
                    byId.put(e.id(), e);
            }
            public static Subtype byId(long id) { return byId.get(id); }
        }

        public BinData(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BinData(KaitaiStream _io, Bson.Element _parent) {
            this(_io, _parent, null);
        }

        public BinData(KaitaiStream _io, Bson.Element _parent, Bson _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.len = this._io.readS4le();
            this.subtype = Subtype.byId(this._io.readU1());
            {
                Subtype on = subtype();
                if (on != null) {
                    switch (subtype()) {
                    case BYTE_ARRAY_DEPRECATED: {
                        this._raw_content = this._io.readBytes(len());
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(_raw_content);
                        this.content = new ByteArrayDeprecated(_io__raw_content, this, _root);
                        break;
                    }
                    default: {
                        this.content = this._io.readBytes(len());
                        break;
                    }
                    }
                } else {
                    this.content = this._io.readBytes(len());
                }
            }
        }

        /**
         * The BSON "binary" or "BinData" datatype is used to represent arrays of bytes. It is somewhat analogous to the Java notion of a ByteArray. BSON binary values have a subtype. This is used to indicate what kind of data is in the byte array. Subtypes from zero to 127 are predefined or reserved. Subtypes from 128-255 are user-defined.
         */
        public static class ByteArrayDeprecated extends KaitaiStruct {
            public static ByteArrayDeprecated fromFile(String fileName) throws IOException {
                return new ByteArrayDeprecated(new ByteBufferKaitaiStream(fileName));
            }

            public ByteArrayDeprecated(KaitaiStream _io) {
                this(_io, null, null);
            }

            public ByteArrayDeprecated(KaitaiStream _io, Bson.BinData _parent) {
                this(_io, _parent, null);
            }

            public ByteArrayDeprecated(KaitaiStream _io, Bson.BinData _parent, Bson _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.len = this._io.readS4le();
                this.content = this._io.readBytes(len());
            }
            private int len;
            private byte[] content;
            private Bson _root;
            private Bson.BinData _parent;
            public int len() { return len; }
            public byte[] content() { return content; }
            public Bson _root() { return _root; }
            public Bson.BinData _parent() { return _parent; }
        }
        private int len;
        private Subtype subtype;
        private Object content;
        private Bson _root;
        private Bson.Element _parent;
        private byte[] _raw_content;
        public int len() { return len; }
        public Subtype subtype() { return subtype; }
        public Object content() { return content; }
        public Bson _root() { return _root; }
        public Bson.Element _parent() { return _parent; }
        public byte[] _raw_content() { return _raw_content; }
    }
    public static class ElementsList extends KaitaiStruct {
        public static ElementsList fromFile(String fileName) throws IOException {
            return new ElementsList(new ByteBufferKaitaiStream(fileName));
        }

        public ElementsList(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ElementsList(KaitaiStream _io, Bson _parent) {
            this(_io, _parent, null);
        }

        public ElementsList(KaitaiStream _io, Bson _parent, Bson _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.elements = new ArrayList<Element>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.elements.add(new Element(this._io, this, _root));
                    i++;
                }
            }
        }
        private ArrayList<Element> elements;
        private Bson _root;
        private Bson _parent;
        public ArrayList<Element> elements() { return elements; }
        public Bson _root() { return _root; }
        public Bson _parent() { return _parent; }
    }
    public static class Cstring extends KaitaiStruct {
        public static Cstring fromFile(String fileName) throws IOException {
            return new Cstring(new ByteBufferKaitaiStream(fileName));
        }

        public Cstring(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Cstring(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Cstring(KaitaiStream _io, KaitaiStruct _parent, Bson _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.str = new String(this._io.readBytesTerm(0, false, true, true), Charset.forName("UTF-8"));
        }
        private String str;
        private Bson _root;
        private KaitaiStruct _parent;

        /**
         * MUST NOT contain '\x00', hence it is not full UTF-8.
         */
        public String str() { return str; }
        public Bson _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class String extends KaitaiStruct {
        public static String fromFile(String fileName) throws IOException {
            return new String(new ByteBufferKaitaiStream(fileName));
        }

        public String(KaitaiStream _io) {
            this(_io, null, null);
        }

        public String(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public String(KaitaiStream _io, KaitaiStruct _parent, Bson _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.len = this._io.readS4le();
            this.str = new String(this._io.readBytes((len() - 1)), Charset.forName("UTF-8"));
            this.terminator = this._io.readBytes(1);
            if (!(Arrays.equals(terminator(), new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, terminator(), _io(), "/types/string/seq/2");
            }
        }
        private int len;
        private String str;
        private byte[] terminator;
        private Bson _root;
        private KaitaiStruct _parent;
        public int len() { return len; }
        public String str() { return str; }
        public byte[] terminator() { return terminator; }
        public Bson _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class Element extends KaitaiStruct {
        public static Element fromFile(String fileName) throws IOException {
            return new Element(new ByteBufferKaitaiStream(fileName));
        }

        public enum BsonType {
            MIN_KEY(-1),
            END_OF_OBJECT(0),
            NUMBER_DOUBLE(1),
            STRING(2),
            DOCUMENT(3),
            ARRAY(4),
            BIN_DATA(5),
            UNDEFINED(6),
            OBJECT_ID(7),
            BOOLEAN(8),
            UTC_DATETIME(9),
            JST_NULL(10),
            REG_EX(11),
            DB_POINTER(12),
            JAVASCRIPT(13),
            SYMBOL(14),
            CODE_WITH_SCOPE(15),
            NUMBER_INT(16),
            TIMESTAMP(17),
            NUMBER_LONG(18),
            NUMBER_DECIMAL(19),
            MAX_KEY(127);

            private final long id;
            BsonType(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, BsonType> byId = new HashMap<Long, BsonType>(22);
            static {
                for (BsonType e : BsonType.values())
                    byId.put(e.id(), e);
            }
            public static BsonType byId(long id) { return byId.get(id); }
        }

        public Element(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Element(KaitaiStream _io, Bson.ElementsList _parent) {
            this(_io, _parent, null);
        }

        public Element(KaitaiStream _io, Bson.ElementsList _parent, Bson _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.typeByte = BsonType.byId(this._io.readU1());
            this.name = new Cstring(this._io, this, _root);
            {
                BsonType on = typeByte();
                if (on != null) {
                    switch (typeByte()) {
                    case CODE_WITH_SCOPE: {
                        this.content = new CodeWithScope(this._io, this, _root);
                        break;
                    }
                    case REG_EX: {
                        this.content = new RegEx(this._io, this, _root);
                        break;
                    }
                    case NUMBER_DOUBLE: {
                        this.content = (Object) (this._io.readF8le());
                        break;
                    }
                    case SYMBOL: {
                        this.content = new String(this._io, this, _root);
                        break;
                    }
                    case TIMESTAMP: {
                        this.content = new Timestamp(this._io, this, _root);
                        break;
                    }
                    case NUMBER_INT: {
                        this.content = (Object) (this._io.readS4le());
                        break;
                    }
                    case DOCUMENT: {
                        this.content = new Bson(this._io);
                        break;
                    }
                    case OBJECT_ID: {
                        this.content = new ObjectId(this._io, this, _root);
                        break;
                    }
                    case JAVASCRIPT: {
                        this.content = new String(this._io, this, _root);
                        break;
                    }
                    case UTC_DATETIME: {
                        this.content = (Object) (this._io.readS8le());
                        break;
                    }
                    case BOOLEAN: {
                        this.content = (Object) (this._io.readU1());
                        break;
                    }
                    case NUMBER_LONG: {
                        this.content = (Object) (this._io.readS8le());
                        break;
                    }
                    case BIN_DATA: {
                        this.content = new BinData(this._io, this, _root);
                        break;
                    }
                    case STRING: {
                        this.content = new String(this._io, this, _root);
                        break;
                    }
                    case DB_POINTER: {
                        this.content = new DbPointer(this._io, this, _root);
                        break;
                    }
                    case ARRAY: {
                        this.content = new Bson(this._io);
                        break;
                    }
                    case NUMBER_DECIMAL: {
                        this.content = new F16(this._io, this, _root);
                        break;
                    }
                    }
                }
            }
        }
        private BsonType typeByte;
        private Cstring name;
        private Object content;
        private Bson _root;
        private Bson.ElementsList _parent;
        public BsonType typeByte() { return typeByte; }
        public Cstring name() { return name; }
        public Object content() { return content; }
        public Bson _root() { return _root; }
        public Bson.ElementsList _parent() { return _parent; }
    }
    public static class DbPointer extends KaitaiStruct {
        public static DbPointer fromFile(String fileName) throws IOException {
            return new DbPointer(new ByteBufferKaitaiStream(fileName));
        }

        public DbPointer(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DbPointer(KaitaiStream _io, Bson.Element _parent) {
            this(_io, _parent, null);
        }

        public DbPointer(KaitaiStream _io, Bson.Element _parent, Bson _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.namespace = new String(this._io, this, _root);
            this.id = new ObjectId(this._io, this, _root);
        }
        private String namespace;
        private ObjectId id;
        private Bson _root;
        private Bson.Element _parent;
        public String namespace() { return namespace; }
        public ObjectId id() { return id; }
        public Bson _root() { return _root; }
        public Bson.Element _parent() { return _parent; }
    }

    /**
     * Implements unsigned 24-bit (3 byte) integer.
     */
    public static class U3 extends KaitaiStruct {
        public static U3 fromFile(String fileName) throws IOException {
            return new U3(new ByteBufferKaitaiStream(fileName));
        }

        public U3(KaitaiStream _io) {
            this(_io, null, null);
        }

        public U3(KaitaiStream _io, Bson.ObjectId _parent) {
            this(_io, _parent, null);
        }

        public U3(KaitaiStream _io, Bson.ObjectId _parent, Bson _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.b1 = this._io.readU1();
            this.b2 = this._io.readU1();
            this.b3 = this._io.readU1();
        }
        private Integer value;
        public Integer value() {
            if (this.value != null)
                return this.value;
            int _tmp = (int) (((b1() | (b2() << 8)) | (b3() << 16)));
            this.value = _tmp;
            return this.value;
        }
        private int b1;
        private int b2;
        private int b3;
        private Bson _root;
        private Bson.ObjectId _parent;
        public int b1() { return b1; }
        public int b2() { return b2; }
        public int b3() { return b3; }
        public Bson _root() { return _root; }
        public Bson.ObjectId _parent() { return _parent; }
    }
    public static class CodeWithScope extends KaitaiStruct {
        public static CodeWithScope fromFile(String fileName) throws IOException {
            return new CodeWithScope(new ByteBufferKaitaiStream(fileName));
        }

        public CodeWithScope(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CodeWithScope(KaitaiStream _io, Bson.Element _parent) {
            this(_io, _parent, null);
        }

        public CodeWithScope(KaitaiStream _io, Bson.Element _parent, Bson _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.id = this._io.readS4le();
            this.source = new String(this._io, this, _root);
            this.scope = new Bson(this._io);
        }
        private int id;
        private String source;
        private Bson scope;
        private Bson _root;
        private Bson.Element _parent;
        public int id() { return id; }
        public String source() { return source; }

        /**
         * mapping from identifiers to values, representing the scope in which the string should be evaluated.
         */
        public Bson scope() { return scope; }
        public Bson _root() { return _root; }
        public Bson.Element _parent() { return _parent; }
    }

    /**
     * 128-bit IEEE 754-2008 decimal floating point
     */
    public static class F16 extends KaitaiStruct {
        public static F16 fromFile(String fileName) throws IOException {
            return new F16(new ByteBufferKaitaiStream(fileName));
        }

        public F16(KaitaiStream _io) {
            this(_io, null, null);
        }

        public F16(KaitaiStream _io, Bson.Element _parent) {
            this(_io, _parent, null);
        }

        public F16(KaitaiStream _io, Bson.Element _parent, Bson _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.str = this._io.readBitsIntBe(1) != 0;
            this.exponent = this._io.readBitsIntBe(15);
            this.significandHi = this._io.readBitsIntBe(49);
            this._io.alignToByte();
            this.significandLo = this._io.readU8le();
        }
        private boolean str;
        private long exponent;
        private long significandHi;
        private long significandLo;
        private Bson _root;
        private Bson.Element _parent;
        public boolean str() { return str; }
        public long exponent() { return exponent; }
        public long significandHi() { return significandHi; }
        public long significandLo() { return significandLo; }
        public Bson _root() { return _root; }
        public Bson.Element _parent() { return _parent; }
    }

    /**
     * https://docs.mongodb.com/manual/reference/method/ObjectId/
     */
    public static class ObjectId extends KaitaiStruct {
        public static ObjectId fromFile(String fileName) throws IOException {
            return new ObjectId(new ByteBufferKaitaiStream(fileName));
        }

        public ObjectId(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ObjectId(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public ObjectId(KaitaiStream _io, KaitaiStruct _parent, Bson _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.epochTime = this._io.readU4le();
            this.machineId = new U3(this._io, this, _root);
            this.processId = this._io.readU2le();
            this.counter = new U3(this._io, this, _root);
        }
        private long epochTime;
        private U3 machineId;
        private int processId;
        private U3 counter;
        private Bson _root;
        private KaitaiStruct _parent;

        /**
         * seconds since the Unix epoch
         */
        public long epochTime() { return epochTime; }
        public U3 machineId() { return machineId; }
        public int processId() { return processId; }

        /**
         * counter, starting with a random value.
         */
        public U3 counter() { return counter; }
        public Bson _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class RegEx extends KaitaiStruct {
        public static RegEx fromFile(String fileName) throws IOException {
            return new RegEx(new ByteBufferKaitaiStream(fileName));
        }

        public RegEx(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RegEx(KaitaiStream _io, Bson.Element _parent) {
            this(_io, _parent, null);
        }

        public RegEx(KaitaiStream _io, Bson.Element _parent, Bson _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.pattern = new Cstring(this._io, this, _root);
            this.options = new Cstring(this._io, this, _root);
        }
        private Cstring pattern;
        private Cstring options;
        private Bson _root;
        private Bson.Element _parent;
        public Cstring pattern() { return pattern; }
        public Cstring options() { return options; }
        public Bson _root() { return _root; }
        public Bson.Element _parent() { return _parent; }
    }
    private int len;
    private ElementsList fields;
    private byte[] terminator;
    private Bson _root;
    private KaitaiStruct _parent;
    private byte[] _raw_fields;

    /**
     * Total number of bytes comprising the document.
     */
    public int len() { return len; }
    public ElementsList fields() { return fields; }
    public byte[] terminator() { return terminator; }
    public Bson _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_fields() { return _raw_fields; }
}

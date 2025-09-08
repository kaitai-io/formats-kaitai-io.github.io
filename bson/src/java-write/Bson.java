// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;


/**
 * BSON, short for Binary JSON, is a binary-encoded serialization of JSON-like documents. Like JSON, BSON supports the embedding of documents and arrays within other documents and arrays. BSON also contains extensions that allow representation of data types that are not part of the JSON spec. For example, BSON has a Date type and a BinData type. BSON can be compared to binary interchange formats, like Protocol Buffers. BSON is more "schemaless" than Protocol Buffers, which can give it an advantage in flexibility but also a slight disadvantage in space efficiency (BSON has overhead for field names within the serialized data). BSON was designed to have the following three characteristics:
 *   * Lightweight. Keeping spatial overhead to a minimum is important for any data representation format, especially when used over the network.
 *   * Traversable. BSON is designed to be traversed easily. This is a vital property in its role as the primary data representation for MongoDB.
 *   * Efficient. Encoding data to BSON and decoding from BSON can be performed very quickly in most languages due to the use of C data types.
 */
public class Bson extends KaitaiStruct.ReadWrite {
    public static Bson fromFile(String fileName) throws IOException {
        return new Bson(new ByteBufferKaitaiStream(fileName));
    }
    public Bson() {
        this(null, null, null);
    }

    public Bson(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Bson(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Bson(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Bson _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.len = this._io.readS4le();
        this._raw_fields = this._io.readBytes(len() - 5);
        KaitaiStream _io__raw_fields = new ByteBufferKaitaiStream(this._raw_fields);
        this.fields = new ElementsList(_io__raw_fields, this, _root);
        this.fields._read();
        this.terminator = this._io.readBytes(1);
        if (!(Arrays.equals(this.terminator, new byte[] { 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.terminator, this._io, "/seq/2");
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.fields._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeS4le(this.len);
        final KaitaiStream _io__raw_fields = new ByteBufferKaitaiStream(len() - 5);
        this._io.addChildStream(_io__raw_fields);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (len() - 5));
            final Bson _this = this;
            _io__raw_fields.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_fields = _io__raw_fields.toByteArray();
                    if (_this._raw_fields.length != len() - 5)
                        throw new ConsistencyError("raw(fields)", len() - 5, _this._raw_fields.length);
                    parent.writeBytes(_this._raw_fields);
                }
            });
        }
        this.fields._write_Seq(_io__raw_fields);
        this._io.writeBytes(this.terminator);
    }

    public void _check() {
        if (!Objects.equals(this.fields._root(), _root()))
            throw new ConsistencyError("fields", _root(), this.fields._root());
        if (!Objects.equals(this.fields._parent(), this))
            throw new ConsistencyError("fields", this, this.fields._parent());
        if (this.terminator.length != 1)
            throw new ConsistencyError("terminator", 1, this.terminator.length);
        if (!(Arrays.equals(this.terminator, new byte[] { 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.terminator, null, "/seq/2");
        }
        _dirty = false;
    }

    /**
     * The BSON "binary" or "BinData" datatype is used to represent arrays of bytes. It is somewhat analogous to the Java notion of a ByteArray. BSON binary values have a subtype. This is used to indicate what kind of data is in the byte array. Subtypes from zero to 127 are predefined or reserved. Subtypes from 128-255 are user-defined.
     */
    public static class BinData extends KaitaiStruct.ReadWrite {
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
        public BinData() {
            this(null, null, null);
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
        }
        public void _read() {
            this.len = this._io.readS4le();
            this.subtype = Subtype.byId(this._io.readU1());
            {
                Subtype on = subtype();
                if (on != null) {
                    switch (subtype()) {
                    case BYTE_ARRAY_DEPRECATED: {
                        this._raw_content = this._io.readBytes(len());
                        KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(this._raw_content);
                        this.content = new ByteArrayDeprecated(_io__raw_content, this, _root);
                        ((ByteArrayDeprecated) (this.content))._read();
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
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                Subtype on = subtype();
                if (on != null) {
                    switch (subtype()) {
                    case BYTE_ARRAY_DEPRECATED: {
                        ((ByteArrayDeprecated) (this.content))._fetchInstances();
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
            this._io.writeS4le(this.len);
            this._io.writeU1(((Number) (this.subtype.id())).intValue());
            {
                Subtype on = subtype();
                if (on != null) {
                    switch (subtype()) {
                    case BYTE_ARRAY_DEPRECATED: {
                        final KaitaiStream _io__raw_content = new ByteBufferKaitaiStream(len());
                        this._io.addChildStream(_io__raw_content);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (len()));
                            final BinData _this = this;
                            _io__raw_content.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_content = _io__raw_content.toByteArray();
                                    if (((byte[]) (_this._raw_content)).length != len())
                                        throw new ConsistencyError("raw(content)", len(), ((byte[]) (_this._raw_content)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_content)))));
                                }
                            });
                        }
                        ((ByteArrayDeprecated) (this.content))._write_Seq(_io__raw_content);
                        break;
                    }
                    default: {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.content)))));
                        break;
                    }
                    }
                } else {
                    this._io.writeBytes(((byte[]) (((byte[]) (this.content)))));
                }
            }
        }

        public void _check() {
            {
                Subtype on = subtype();
                if (on != null) {
                    switch (subtype()) {
                    case BYTE_ARRAY_DEPRECATED: {
                        if (!Objects.equals(((Bson.BinData.ByteArrayDeprecated) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((Bson.BinData.ByteArrayDeprecated) (this.content))._root());
                        if (!Objects.equals(((Bson.BinData.ByteArrayDeprecated) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((Bson.BinData.ByteArrayDeprecated) (this.content))._parent());
                        break;
                    }
                    default: {
                        if (((byte[]) (this.content)).length != len())
                            throw new ConsistencyError("content", len(), ((byte[]) (this.content)).length);
                        break;
                    }
                    }
                } else {
                    if (((byte[]) (this.content)).length != len())
                        throw new ConsistencyError("content", len(), ((byte[]) (this.content)).length);
                }
            }
            _dirty = false;
        }

        /**
         * The BSON "binary" or "BinData" datatype is used to represent arrays of bytes. It is somewhat analogous to the Java notion of a ByteArray. BSON binary values have a subtype. This is used to indicate what kind of data is in the byte array. Subtypes from zero to 127 are predefined or reserved. Subtypes from 128-255 are user-defined.
         */
        public static class ByteArrayDeprecated extends KaitaiStruct.ReadWrite {
            public static ByteArrayDeprecated fromFile(String fileName) throws IOException {
                return new ByteArrayDeprecated(new ByteBufferKaitaiStream(fileName));
            }
            public ByteArrayDeprecated() {
                this(null, null, null);
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
            }
            public void _read() {
                this.len = this._io.readS4le();
                this.content = this._io.readBytes(len());
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeS4le(this.len);
                this._io.writeBytes(this.content);
            }

            public void _check() {
                if (this.content.length != len())
                    throw new ConsistencyError("content", len(), this.content.length);
                _dirty = false;
            }
            private int len;
            private byte[] content;
            private Bson _root;
            private Bson.BinData _parent;
            public int len() { return len; }
            public void setLen(int _v) { _dirty = true; len = _v; }
            public byte[] content() { return content; }
            public void setContent(byte[] _v) { _dirty = true; content = _v; }
            public Bson _root() { return _root; }
            public void set_root(Bson _v) { _dirty = true; _root = _v; }
            public Bson.BinData _parent() { return _parent; }
            public void set_parent(Bson.BinData _v) { _dirty = true; _parent = _v; }
        }
        private int len;
        private Subtype subtype;
        private Object content;
        private Bson _root;
        private Bson.Element _parent;
        private byte[] _raw_content;
        public int len() { return len; }
        public void setLen(int _v) { _dirty = true; len = _v; }
        public Subtype subtype() { return subtype; }
        public void setSubtype(Subtype _v) { _dirty = true; subtype = _v; }
        public Object content() { return content; }
        public void setContent(Object _v) { _dirty = true; content = _v; }
        public Bson _root() { return _root; }
        public void set_root(Bson _v) { _dirty = true; _root = _v; }
        public Bson.Element _parent() { return _parent; }
        public void set_parent(Bson.Element _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_content() { return _raw_content; }
        public void set_raw_Content(byte[] _v) { _dirty = true; _raw_content = _v; }
    }
    public static class CodeWithScope extends KaitaiStruct.ReadWrite {
        public static CodeWithScope fromFile(String fileName) throws IOException {
            return new CodeWithScope(new ByteBufferKaitaiStream(fileName));
        }
        public CodeWithScope() {
            this(null, null, null);
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
        }
        public void _read() {
            this.id = this._io.readS4le();
            this.source = new String(this._io, this, _root);
            this.source._read();
            this.scope = new Bson(this._io, this, _root);
            this.scope._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.source._fetchInstances();
            this.scope._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS4le(this.id);
            this.source._write_Seq(this._io);
            this.scope._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.source._root(), _root()))
                throw new ConsistencyError("source", _root(), this.source._root());
            if (!Objects.equals(this.source._parent(), this))
                throw new ConsistencyError("source", this, this.source._parent());
            if (!Objects.equals(this.scope._root(), _root()))
                throw new ConsistencyError("scope", _root(), this.scope._root());
            if (!Objects.equals(this.scope._parent(), this))
                throw new ConsistencyError("scope", this, this.scope._parent());
            _dirty = false;
        }
        private int id;
        private String source;
        private Bson scope;
        private Bson _root;
        private Bson.Element _parent;
        public int id() { return id; }
        public void setId(int _v) { _dirty = true; id = _v; }
        public String source() { return source; }
        public void setSource(String _v) { _dirty = true; source = _v; }

        /**
         * mapping from identifiers to values, representing the scope in which the string should be evaluated.
         */
        public Bson scope() { return scope; }
        public void setScope(Bson _v) { _dirty = true; scope = _v; }
        public Bson _root() { return _root; }
        public void set_root(Bson _v) { _dirty = true; _root = _v; }
        public Bson.Element _parent() { return _parent; }
        public void set_parent(Bson.Element _v) { _dirty = true; _parent = _v; }
    }
    public static class Cstring extends KaitaiStruct.ReadWrite {
        public static Cstring fromFile(String fileName) throws IOException {
            return new Cstring(new ByteBufferKaitaiStream(fileName));
        }
        public Cstring() {
            this(null, null, null);
        }

        public Cstring(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Cstring(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Cstring(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Bson _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.str = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.str).getBytes(Charset.forName("UTF-8")));
            this._io.writeU1(0);
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.str).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                throw new ConsistencyError("str", -1, KaitaiStream.byteArrayIndexOf((this.str).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
            _dirty = false;
        }
        private String str;
        private Bson _root;
        private KaitaiStruct.ReadWrite _parent;

        /**
         * MUST NOT contain '\x00', hence it is not full UTF-8.
         */
        public String str() { return str; }
        public void setStr(String _v) { _dirty = true; str = _v; }
        public Bson _root() { return _root; }
        public void set_root(Bson _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class DbPointer extends KaitaiStruct.ReadWrite {
        public static DbPointer fromFile(String fileName) throws IOException {
            return new DbPointer(new ByteBufferKaitaiStream(fileName));
        }
        public DbPointer() {
            this(null, null, null);
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
        }
        public void _read() {
            this.namespace = new String(this._io, this, _root);
            this.namespace._read();
            this.id = new ObjectId(this._io, this, _root);
            this.id._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.namespace._fetchInstances();
            this.id._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.namespace._write_Seq(this._io);
            this.id._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.namespace._root(), _root()))
                throw new ConsistencyError("namespace", _root(), this.namespace._root());
            if (!Objects.equals(this.namespace._parent(), this))
                throw new ConsistencyError("namespace", this, this.namespace._parent());
            if (!Objects.equals(this.id._root(), _root()))
                throw new ConsistencyError("id", _root(), this.id._root());
            if (!Objects.equals(this.id._parent(), this))
                throw new ConsistencyError("id", this, this.id._parent());
            _dirty = false;
        }
        private String namespace;
        private ObjectId id;
        private Bson _root;
        private Bson.Element _parent;
        public String namespace() { return namespace; }
        public void setNamespace(String _v) { _dirty = true; namespace = _v; }
        public ObjectId id() { return id; }
        public void setId(ObjectId _v) { _dirty = true; id = _v; }
        public Bson _root() { return _root; }
        public void set_root(Bson _v) { _dirty = true; _root = _v; }
        public Bson.Element _parent() { return _parent; }
        public void set_parent(Bson.Element _v) { _dirty = true; _parent = _v; }
    }
    public static class Element extends KaitaiStruct.ReadWrite {
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
        public Element() {
            this(null, null, null);
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
        }
        public void _read() {
            this.typeByte = BsonType.byId(this._io.readU1());
            this.name = new Cstring(this._io, this, _root);
            this.name._read();
            {
                BsonType on = typeByte();
                if (on != null) {
                    switch (typeByte()) {
                    case ARRAY: {
                        this.content = new Bson(this._io, this, _root);
                        ((Bson) (this.content))._read();
                        break;
                    }
                    case BIN_DATA: {
                        this.content = new BinData(this._io, this, _root);
                        ((BinData) (this.content))._read();
                        break;
                    }
                    case BOOLEAN: {
                        this.content = ((Object) (this._io.readU1()));
                        break;
                    }
                    case CODE_WITH_SCOPE: {
                        this.content = new CodeWithScope(this._io, this, _root);
                        ((CodeWithScope) (this.content))._read();
                        break;
                    }
                    case DB_POINTER: {
                        this.content = new DbPointer(this._io, this, _root);
                        ((DbPointer) (this.content))._read();
                        break;
                    }
                    case DOCUMENT: {
                        this.content = new Bson(this._io, this, _root);
                        ((Bson) (this.content))._read();
                        break;
                    }
                    case JAVASCRIPT: {
                        this.content = new String(this._io, this, _root);
                        ((String) (this.content))._read();
                        break;
                    }
                    case NUMBER_DECIMAL: {
                        this.content = new F16(this._io, this, _root);
                        ((F16) (this.content))._read();
                        break;
                    }
                    case NUMBER_DOUBLE: {
                        this.content = ((Object) (this._io.readF8le()));
                        break;
                    }
                    case NUMBER_INT: {
                        this.content = ((Object) (this._io.readS4le()));
                        break;
                    }
                    case NUMBER_LONG: {
                        this.content = ((Object) (this._io.readS8le()));
                        break;
                    }
                    case OBJECT_ID: {
                        this.content = new ObjectId(this._io, this, _root);
                        ((ObjectId) (this.content))._read();
                        break;
                    }
                    case REG_EX: {
                        this.content = new RegEx(this._io, this, _root);
                        ((RegEx) (this.content))._read();
                        break;
                    }
                    case STRING: {
                        this.content = new String(this._io, this, _root);
                        ((String) (this.content))._read();
                        break;
                    }
                    case SYMBOL: {
                        this.content = new String(this._io, this, _root);
                        ((String) (this.content))._read();
                        break;
                    }
                    case TIMESTAMP: {
                        this.content = new Timestamp(this._io, this, _root);
                        ((Timestamp) (this.content))._read();
                        break;
                    }
                    case UTC_DATETIME: {
                        this.content = ((Object) (this._io.readS8le()));
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.name._fetchInstances();
            {
                BsonType on = typeByte();
                if (on != null) {
                    switch (typeByte()) {
                    case ARRAY: {
                        ((Bson) (this.content))._fetchInstances();
                        break;
                    }
                    case BIN_DATA: {
                        ((BinData) (this.content))._fetchInstances();
                        break;
                    }
                    case BOOLEAN: {
                        break;
                    }
                    case CODE_WITH_SCOPE: {
                        ((CodeWithScope) (this.content))._fetchInstances();
                        break;
                    }
                    case DB_POINTER: {
                        ((DbPointer) (this.content))._fetchInstances();
                        break;
                    }
                    case DOCUMENT: {
                        ((Bson) (this.content))._fetchInstances();
                        break;
                    }
                    case JAVASCRIPT: {
                        ((String) (this.content))._fetchInstances();
                        break;
                    }
                    case NUMBER_DECIMAL: {
                        ((F16) (this.content))._fetchInstances();
                        break;
                    }
                    case NUMBER_DOUBLE: {
                        break;
                    }
                    case NUMBER_INT: {
                        break;
                    }
                    case NUMBER_LONG: {
                        break;
                    }
                    case OBJECT_ID: {
                        ((ObjectId) (this.content))._fetchInstances();
                        break;
                    }
                    case REG_EX: {
                        ((RegEx) (this.content))._fetchInstances();
                        break;
                    }
                    case STRING: {
                        ((String) (this.content))._fetchInstances();
                        break;
                    }
                    case SYMBOL: {
                        ((String) (this.content))._fetchInstances();
                        break;
                    }
                    case TIMESTAMP: {
                        ((Timestamp) (this.content))._fetchInstances();
                        break;
                    }
                    case UTC_DATETIME: {
                        break;
                    }
                    }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(((Number) (this.typeByte.id())).intValue());
            this.name._write_Seq(this._io);
            {
                BsonType on = typeByte();
                if (on != null) {
                    switch (typeByte()) {
                    case ARRAY: {
                        ((Bson) (this.content))._write_Seq(this._io);
                        break;
                    }
                    case BIN_DATA: {
                        ((BinData) (this.content))._write_Seq(this._io);
                        break;
                    }
                    case BOOLEAN: {
                        this._io.writeU1(((Number) (this.content)).intValue());
                        break;
                    }
                    case CODE_WITH_SCOPE: {
                        ((CodeWithScope) (this.content))._write_Seq(this._io);
                        break;
                    }
                    case DB_POINTER: {
                        ((DbPointer) (this.content))._write_Seq(this._io);
                        break;
                    }
                    case DOCUMENT: {
                        ((Bson) (this.content))._write_Seq(this._io);
                        break;
                    }
                    case JAVASCRIPT: {
                        ((String) (this.content))._write_Seq(this._io);
                        break;
                    }
                    case NUMBER_DECIMAL: {
                        ((F16) (this.content))._write_Seq(this._io);
                        break;
                    }
                    case NUMBER_DOUBLE: {
                        this._io.writeF8le(((Number) (this.content)).doubleValue());
                        break;
                    }
                    case NUMBER_INT: {
                        this._io.writeS4le(((Number) (this.content)).intValue());
                        break;
                    }
                    case NUMBER_LONG: {
                        this._io.writeS8le(((Number) (this.content)).longValue());
                        break;
                    }
                    case OBJECT_ID: {
                        ((ObjectId) (this.content))._write_Seq(this._io);
                        break;
                    }
                    case REG_EX: {
                        ((RegEx) (this.content))._write_Seq(this._io);
                        break;
                    }
                    case STRING: {
                        ((String) (this.content))._write_Seq(this._io);
                        break;
                    }
                    case SYMBOL: {
                        ((String) (this.content))._write_Seq(this._io);
                        break;
                    }
                    case TIMESTAMP: {
                        ((Timestamp) (this.content))._write_Seq(this._io);
                        break;
                    }
                    case UTC_DATETIME: {
                        this._io.writeS8le(((Number) (this.content)).longValue());
                        break;
                    }
                    }
                }
            }
        }

        public void _check() {
            if (!Objects.equals(this.name._root(), _root()))
                throw new ConsistencyError("name", _root(), this.name._root());
            if (!Objects.equals(this.name._parent(), this))
                throw new ConsistencyError("name", this, this.name._parent());
            {
                BsonType on = typeByte();
                if (on != null) {
                    switch (typeByte()) {
                    case ARRAY: {
                        if (!Objects.equals(((Bson) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((Bson) (this.content))._root());
                        if (!Objects.equals(((Bson) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((Bson) (this.content))._parent());
                        break;
                    }
                    case BIN_DATA: {
                        if (!Objects.equals(((Bson.BinData) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((Bson.BinData) (this.content))._root());
                        if (!Objects.equals(((Bson.BinData) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((Bson.BinData) (this.content))._parent());
                        break;
                    }
                    case BOOLEAN: {
                        break;
                    }
                    case CODE_WITH_SCOPE: {
                        if (!Objects.equals(((Bson.CodeWithScope) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((Bson.CodeWithScope) (this.content))._root());
                        if (!Objects.equals(((Bson.CodeWithScope) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((Bson.CodeWithScope) (this.content))._parent());
                        break;
                    }
                    case DB_POINTER: {
                        if (!Objects.equals(((Bson.DbPointer) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((Bson.DbPointer) (this.content))._root());
                        if (!Objects.equals(((Bson.DbPointer) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((Bson.DbPointer) (this.content))._parent());
                        break;
                    }
                    case DOCUMENT: {
                        if (!Objects.equals(((Bson) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((Bson) (this.content))._root());
                        if (!Objects.equals(((Bson) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((Bson) (this.content))._parent());
                        break;
                    }
                    case JAVASCRIPT: {
                        if (!Objects.equals(((Bson.String) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((Bson.String) (this.content))._root());
                        if (!Objects.equals(((Bson.String) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((Bson.String) (this.content))._parent());
                        break;
                    }
                    case NUMBER_DECIMAL: {
                        if (!Objects.equals(((Bson.F16) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((Bson.F16) (this.content))._root());
                        if (!Objects.equals(((Bson.F16) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((Bson.F16) (this.content))._parent());
                        break;
                    }
                    case NUMBER_DOUBLE: {
                        break;
                    }
                    case NUMBER_INT: {
                        break;
                    }
                    case NUMBER_LONG: {
                        break;
                    }
                    case OBJECT_ID: {
                        if (!Objects.equals(((Bson.ObjectId) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((Bson.ObjectId) (this.content))._root());
                        if (!Objects.equals(((Bson.ObjectId) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((Bson.ObjectId) (this.content))._parent());
                        break;
                    }
                    case REG_EX: {
                        if (!Objects.equals(((Bson.RegEx) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((Bson.RegEx) (this.content))._root());
                        if (!Objects.equals(((Bson.RegEx) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((Bson.RegEx) (this.content))._parent());
                        break;
                    }
                    case STRING: {
                        if (!Objects.equals(((Bson.String) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((Bson.String) (this.content))._root());
                        if (!Objects.equals(((Bson.String) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((Bson.String) (this.content))._parent());
                        break;
                    }
                    case SYMBOL: {
                        if (!Objects.equals(((Bson.String) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((Bson.String) (this.content))._root());
                        if (!Objects.equals(((Bson.String) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((Bson.String) (this.content))._parent());
                        break;
                    }
                    case TIMESTAMP: {
                        if (!Objects.equals(((Bson.Timestamp) (this.content))._root(), _root()))
                            throw new ConsistencyError("content", _root(), ((Bson.Timestamp) (this.content))._root());
                        if (!Objects.equals(((Bson.Timestamp) (this.content))._parent(), this))
                            throw new ConsistencyError("content", this, ((Bson.Timestamp) (this.content))._parent());
                        break;
                    }
                    case UTC_DATETIME: {
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }
        private BsonType typeByte;
        private Cstring name;
        private Object content;
        private Bson _root;
        private Bson.ElementsList _parent;
        public BsonType typeByte() { return typeByte; }
        public void setTypeByte(BsonType _v) { _dirty = true; typeByte = _v; }
        public Cstring name() { return name; }
        public void setName(Cstring _v) { _dirty = true; name = _v; }
        public Object content() { return content; }
        public void setContent(Object _v) { _dirty = true; content = _v; }
        public Bson _root() { return _root; }
        public void set_root(Bson _v) { _dirty = true; _root = _v; }
        public Bson.ElementsList _parent() { return _parent; }
        public void set_parent(Bson.ElementsList _v) { _dirty = true; _parent = _v; }
    }
    public static class ElementsList extends KaitaiStruct.ReadWrite {
        public static ElementsList fromFile(String fileName) throws IOException {
            return new ElementsList(new ByteBufferKaitaiStream(fileName));
        }
        public ElementsList() {
            this(null, null, null);
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
        }
        public void _read() {
            this.elements = new ArrayList<Element>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    Element _t_elements = new Element(this._io, this, _root);
                    try {
                        _t_elements._read();
                    } finally {
                        this.elements.add(_t_elements);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.elements.size(); i++) {
                this.elements.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.elements.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("elements", 0, this._io.size() - this._io.pos());
                this.elements.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("elements", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.elements.size(); i++) {
                if (!Objects.equals(this.elements.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("elements", _root(), this.elements.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.elements.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("elements", this, this.elements.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<Element> elements;
        private Bson _root;
        private Bson _parent;
        public List<Element> elements() { return elements; }
        public void setElements(List<Element> _v) { _dirty = true; elements = _v; }
        public Bson _root() { return _root; }
        public void set_root(Bson _v) { _dirty = true; _root = _v; }
        public Bson _parent() { return _parent; }
        public void set_parent(Bson _v) { _dirty = true; _parent = _v; }
    }

    /**
     * 128-bit IEEE 754-2008 decimal floating point
     */
    public static class F16 extends KaitaiStruct.ReadWrite {
        public static F16 fromFile(String fileName) throws IOException {
            return new F16(new ByteBufferKaitaiStream(fileName));
        }
        public F16() {
            this(null, null, null);
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
        }
        public void _read() {
            this.str = this._io.readBitsIntBe(1) != 0;
            this.exponent = this._io.readBitsIntBe(15);
            this.significandHi = this._io.readBitsIntBe(49);
            this.significandLo = this._io.readU8le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(1, (this.str ? 1 : 0));
            this._io.writeBitsIntBe(15, this.exponent);
            this._io.writeBitsIntBe(49, this.significandHi);
            this._io.writeU8le(this.significandLo);
        }

        public void _check() {
            _dirty = false;
        }
        private boolean str;
        private long exponent;
        private long significandHi;
        private long significandLo;
        private Bson _root;
        private Bson.Element _parent;
        public boolean str() { return str; }
        public void setStr(boolean _v) { _dirty = true; str = _v; }
        public long exponent() { return exponent; }
        public void setExponent(long _v) { _dirty = true; exponent = _v; }
        public long significandHi() { return significandHi; }
        public void setSignificandHi(long _v) { _dirty = true; significandHi = _v; }
        public long significandLo() { return significandLo; }
        public void setSignificandLo(long _v) { _dirty = true; significandLo = _v; }
        public Bson _root() { return _root; }
        public void set_root(Bson _v) { _dirty = true; _root = _v; }
        public Bson.Element _parent() { return _parent; }
        public void set_parent(Bson.Element _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://www.mongodb.com/docs/manual/reference/method/ObjectId/">Source</a>
     */
    public static class ObjectId extends KaitaiStruct.ReadWrite {
        public static ObjectId fromFile(String fileName) throws IOException {
            return new ObjectId(new ByteBufferKaitaiStream(fileName));
        }
        public ObjectId() {
            this(null, null, null);
        }

        public ObjectId(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ObjectId(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public ObjectId(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Bson _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.epochTime = this._io.readU4le();
            this.machineId = new U3(this._io, this, _root);
            this.machineId._read();
            this.processId = this._io.readU2le();
            this.counter = new U3(this._io, this, _root);
            this.counter._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.machineId._fetchInstances();
            this.counter._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.epochTime);
            this.machineId._write_Seq(this._io);
            this._io.writeU2le(this.processId);
            this.counter._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.machineId._root(), _root()))
                throw new ConsistencyError("machine_id", _root(), this.machineId._root());
            if (!Objects.equals(this.machineId._parent(), this))
                throw new ConsistencyError("machine_id", this, this.machineId._parent());
            if (!Objects.equals(this.counter._root(), _root()))
                throw new ConsistencyError("counter", _root(), this.counter._root());
            if (!Objects.equals(this.counter._parent(), this))
                throw new ConsistencyError("counter", this, this.counter._parent());
            _dirty = false;
        }
        private long epochTime;
        private U3 machineId;
        private int processId;
        private U3 counter;
        private Bson _root;
        private KaitaiStruct.ReadWrite _parent;

        /**
         * seconds since the Unix epoch
         */
        public long epochTime() { return epochTime; }
        public void setEpochTime(long _v) { _dirty = true; epochTime = _v; }
        public U3 machineId() { return machineId; }
        public void setMachineId(U3 _v) { _dirty = true; machineId = _v; }
        public int processId() { return processId; }
        public void setProcessId(int _v) { _dirty = true; processId = _v; }

        /**
         * counter, starting with a random value.
         */
        public U3 counter() { return counter; }
        public void setCounter(U3 _v) { _dirty = true; counter = _v; }
        public Bson _root() { return _root; }
        public void set_root(Bson _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class RegEx extends KaitaiStruct.ReadWrite {
        public static RegEx fromFile(String fileName) throws IOException {
            return new RegEx(new ByteBufferKaitaiStream(fileName));
        }
        public RegEx() {
            this(null, null, null);
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
        }
        public void _read() {
            this.pattern = new Cstring(this._io, this, _root);
            this.pattern._read();
            this.options = new Cstring(this._io, this, _root);
            this.options._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.pattern._fetchInstances();
            this.options._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.pattern._write_Seq(this._io);
            this.options._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.pattern._root(), _root()))
                throw new ConsistencyError("pattern", _root(), this.pattern._root());
            if (!Objects.equals(this.pattern._parent(), this))
                throw new ConsistencyError("pattern", this, this.pattern._parent());
            if (!Objects.equals(this.options._root(), _root()))
                throw new ConsistencyError("options", _root(), this.options._root());
            if (!Objects.equals(this.options._parent(), this))
                throw new ConsistencyError("options", this, this.options._parent());
            _dirty = false;
        }
        private Cstring pattern;
        private Cstring options;
        private Bson _root;
        private Bson.Element _parent;
        public Cstring pattern() { return pattern; }
        public void setPattern(Cstring _v) { _dirty = true; pattern = _v; }
        public Cstring options() { return options; }
        public void setOptions(Cstring _v) { _dirty = true; options = _v; }
        public Bson _root() { return _root; }
        public void set_root(Bson _v) { _dirty = true; _root = _v; }
        public Bson.Element _parent() { return _parent; }
        public void set_parent(Bson.Element _v) { _dirty = true; _parent = _v; }
    }
    public static class String extends KaitaiStruct.ReadWrite {
        public static String fromFile(String fileName) throws IOException {
            return new String(new ByteBufferKaitaiStream(fileName));
        }
        public String() {
            this(null, null, null);
        }

        public String(KaitaiStream _io) {
            this(_io, null, null);
        }

        public String(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public String(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Bson _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.len = this._io.readS4le();
            this.str = new String(this._io.readBytes(len() - 1), StandardCharsets.UTF_8);
            this.terminator = this._io.readBytes(1);
            if (!(Arrays.equals(this.terminator, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.terminator, this._io, "/types/string/seq/2");
            }
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS4le(this.len);
            this._io.writeBytes((this.str).getBytes(Charset.forName("UTF-8")));
            this._io.writeBytes(this.terminator);
        }

        public void _check() {
            if ((this.str).getBytes(Charset.forName("UTF-8")).length != len() - 1)
                throw new ConsistencyError("str", len() - 1, (this.str).getBytes(Charset.forName("UTF-8")).length);
            if (this.terminator.length != 1)
                throw new ConsistencyError("terminator", 1, this.terminator.length);
            if (!(Arrays.equals(this.terminator, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.terminator, null, "/types/string/seq/2");
            }
            _dirty = false;
        }
        private int len;
        private String str;
        private byte[] terminator;
        private Bson _root;
        private KaitaiStruct.ReadWrite _parent;
        public int len() { return len; }
        public void setLen(int _v) { _dirty = true; len = _v; }
        public String str() { return str; }
        public void setStr(String _v) { _dirty = true; str = _v; }
        public byte[] terminator() { return terminator; }
        public void setTerminator(byte[] _v) { _dirty = true; terminator = _v; }
        public Bson _root() { return _root; }
        public void set_root(Bson _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Special internal type used by MongoDB replication and sharding. First 4 bytes are an increment, second 4 are a timestamp.
     */
    public static class Timestamp extends KaitaiStruct.ReadWrite {
        public static Timestamp fromFile(String fileName) throws IOException {
            return new Timestamp(new ByteBufferKaitaiStream(fileName));
        }
        public Timestamp() {
            this(null, null, null);
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
        }
        public void _read() {
            this.increment = this._io.readU4le();
            this.timestamp = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.increment);
            this._io.writeU4le(this.timestamp);
        }

        public void _check() {
            _dirty = false;
        }
        private long increment;
        private long timestamp;
        private Bson _root;
        private Bson.Element _parent;
        public long increment() { return increment; }
        public void setIncrement(long _v) { _dirty = true; increment = _v; }
        public long timestamp() { return timestamp; }
        public void setTimestamp(long _v) { _dirty = true; timestamp = _v; }
        public Bson _root() { return _root; }
        public void set_root(Bson _v) { _dirty = true; _root = _v; }
        public Bson.Element _parent() { return _parent; }
        public void set_parent(Bson.Element _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Implements unsigned 24-bit (3 byte) integer.
     */
    public static class U3 extends KaitaiStruct.ReadWrite {
        public static U3 fromFile(String fileName) throws IOException {
            return new U3(new ByteBufferKaitaiStream(fileName));
        }
        public U3() {
            this(null, null, null);
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
        }
        public void _read() {
            this.b1 = this._io.readU1();
            this.b2 = this._io.readU1();
            this.b3 = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.b1);
            this._io.writeU1(this.b2);
            this._io.writeU1(this.b3);
        }

        public void _check() {
            _dirty = false;
        }
        private Integer value;
        public Integer value() {
            if (this.value != null)
                return this.value;
            this.value = ((Number) ((b1() | b2() << 8) | b3() << 16)).intValue();
            return this.value;
        }
        public void _invalidateValue() { this.value = null; }
        private int b1;
        private int b2;
        private int b3;
        private Bson _root;
        private Bson.ObjectId _parent;
        public int b1() { return b1; }
        public void setB1(int _v) { _dirty = true; b1 = _v; }
        public int b2() { return b2; }
        public void setB2(int _v) { _dirty = true; b2 = _v; }
        public int b3() { return b3; }
        public void setB3(int _v) { _dirty = true; b3 = _v; }
        public Bson _root() { return _root; }
        public void set_root(Bson _v) { _dirty = true; _root = _v; }
        public Bson.ObjectId _parent() { return _parent; }
        public void set_parent(Bson.ObjectId _v) { _dirty = true; _parent = _v; }
    }
    private int len;
    private ElementsList fields;
    private byte[] terminator;
    private Bson _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_fields;

    /**
     * Total number of bytes comprising the document.
     */
    public int len() { return len; }
    public void setLen(int _v) { _dirty = true; len = _v; }
    public ElementsList fields() { return fields; }
    public void setFields(ElementsList _v) { _dirty = true; fields = _v; }
    public byte[] terminator() { return terminator; }
    public void setTerminator(byte[] _v) { _dirty = true; terminator = _v; }
    public Bson _root() { return _root; }
    public void set_root(Bson _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_fields() { return _raw_fields; }
    public void set_raw_Fields(byte[] _v) { _dirty = true; _raw_fields = _v; }
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.Arrays;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.nio.charset.Charset;
import java.util.List;


/**
 * A serialized PHP value, in the format used by PHP's built-in `serialize` and
 * `unserialize` functions. This format closely mirrors PHP's data model:
 * it supports all of PHP's scalar types (`NULL`, booleans, numbers, strings),
 * associative arrays, objects, and recursive data structures using references.
 * The only PHP values not supported by this format are *resources*,
 * which usually correspond to native file or connection handles and cannot be
 * meaningfully serialized.
 * 
 * There is no official documentation for this data format;
 * this spec was created based on the PHP source code and the behavior of
 * `serialize`/`unserialize`. PHP makes no guarantees about compatibility of
 * serialized data between PHP versions, but in practice, the format has
 * remained fully backwards-compatible - values serialized by an older
 * PHP version can be unserialized on any newer PHP version.
 * This spec supports serialized values from PHP 7.3 or any earlier version.
 * @see <a href="https://www.php.net/manual/en/function.serialize.php">Source</a>
 * @see <a href="https://www.php.net/manual/en/function.serialize.php#66147">Source</a>
 * @see <a href="https://www.php.net/manual/en/function.unserialize.php">Source</a>
 * @see <a href="https://github.com/php/php-src/blob/php-7.3.5/ext/standard/var_unserializer.re">Source</a>
 * @see <a href="https://github.com/php/php-src/blob/php-7.3.5/ext/standard/var.c#L822">Source</a>
 */
public class PhpSerializedValue extends KaitaiStruct.ReadWrite {
    public static PhpSerializedValue fromFile(String fileName) throws IOException {
        return new PhpSerializedValue(new ByteBufferKaitaiStream(fileName));
    }

    public enum BoolValue {
        FALSE(48),
        TRUE(49);

        private final long id;
        BoolValue(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, BoolValue> byId = new HashMap<Long, BoolValue>(2);
        static {
            for (BoolValue e : BoolValue.values())
                byId.put(e.id(), e);
        }
        public static BoolValue byId(long id) { return byId.get(id); }
    }

    public enum ValueType {
        CUSTOM_SERIALIZED_OBJECT(67),
        NULL(78),
        OBJECT(79),
        VARIABLE_REFERENCE(82),
        PHP_6_STRING(83),
        ARRAY(97),
        BOOL(98),
        FLOAT(100),
        INT(105),
        PHP_3_OBJECT(111),
        OBJECT_REFERENCE(114),
        STRING(115);

        private final long id;
        ValueType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ValueType> byId = new HashMap<Long, ValueType>(12);
        static {
            for (ValueType e : ValueType.values())
                byId.put(e.id(), e);
        }
        public static ValueType byId(long id) { return byId.get(id); }
    }
    public PhpSerializedValue() {
        this(null, null, null);
    }

    public PhpSerializedValue(KaitaiStream _io) {
        this(_io, null, null);
    }

    public PhpSerializedValue(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public PhpSerializedValue(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, PhpSerializedValue _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.type = ValueType.byId(this._io.readU1());
        {
            ValueType on = type();
            if (on != null) {
                switch (type()) {
                case ARRAY: {
                    this.contents = new ArrayContents(this._io, this, _root);
                    ((ArrayContents) (this.contents))._read();
                    break;
                }
                case BOOL: {
                    this.contents = new BoolContents(this._io, this, _root);
                    ((BoolContents) (this.contents))._read();
                    break;
                }
                case CUSTOM_SERIALIZED_OBJECT: {
                    this.contents = new CustomSerializedObjectContents(this._io, this, _root);
                    ((CustomSerializedObjectContents) (this.contents))._read();
                    break;
                }
                case FLOAT: {
                    this.contents = new FloatContents(this._io, this, _root);
                    ((FloatContents) (this.contents))._read();
                    break;
                }
                case INT: {
                    this.contents = new IntContents(this._io, this, _root);
                    ((IntContents) (this.contents))._read();
                    break;
                }
                case NULL: {
                    this.contents = new NullContents(this._io, this, _root);
                    ((NullContents) (this.contents))._read();
                    break;
                }
                case OBJECT: {
                    this.contents = new ObjectContents(this._io, this, _root);
                    ((ObjectContents) (this.contents))._read();
                    break;
                }
                case OBJECT_REFERENCE: {
                    this.contents = new IntContents(this._io, this, _root);
                    ((IntContents) (this.contents))._read();
                    break;
                }
                case PHP_3_OBJECT: {
                    this.contents = new Php3ObjectContents(this._io, this, _root);
                    ((Php3ObjectContents) (this.contents))._read();
                    break;
                }
                case PHP_6_STRING: {
                    this.contents = new StringContents(this._io, this, _root);
                    ((StringContents) (this.contents))._read();
                    break;
                }
                case STRING: {
                    this.contents = new StringContents(this._io, this, _root);
                    ((StringContents) (this.contents))._read();
                    break;
                }
                case VARIABLE_REFERENCE: {
                    this.contents = new IntContents(this._io, this, _root);
                    ((IntContents) (this.contents))._read();
                    break;
                }
                }
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        {
            ValueType on = type();
            if (on != null) {
                switch (type()) {
                case ARRAY: {
                    ((ArrayContents) (this.contents))._fetchInstances();
                    break;
                }
                case BOOL: {
                    ((BoolContents) (this.contents))._fetchInstances();
                    break;
                }
                case CUSTOM_SERIALIZED_OBJECT: {
                    ((CustomSerializedObjectContents) (this.contents))._fetchInstances();
                    break;
                }
                case FLOAT: {
                    ((FloatContents) (this.contents))._fetchInstances();
                    break;
                }
                case INT: {
                    ((IntContents) (this.contents))._fetchInstances();
                    break;
                }
                case NULL: {
                    ((NullContents) (this.contents))._fetchInstances();
                    break;
                }
                case OBJECT: {
                    ((ObjectContents) (this.contents))._fetchInstances();
                    break;
                }
                case OBJECT_REFERENCE: {
                    ((IntContents) (this.contents))._fetchInstances();
                    break;
                }
                case PHP_3_OBJECT: {
                    ((Php3ObjectContents) (this.contents))._fetchInstances();
                    break;
                }
                case PHP_6_STRING: {
                    ((StringContents) (this.contents))._fetchInstances();
                    break;
                }
                case STRING: {
                    ((StringContents) (this.contents))._fetchInstances();
                    break;
                }
                case VARIABLE_REFERENCE: {
                    ((IntContents) (this.contents))._fetchInstances();
                    break;
                }
                }
            }
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeU1(((Number) (this.type.id())).intValue());
        {
            ValueType on = type();
            if (on != null) {
                switch (type()) {
                case ARRAY: {
                    ((ArrayContents) (this.contents))._write_Seq(this._io);
                    break;
                }
                case BOOL: {
                    ((BoolContents) (this.contents))._write_Seq(this._io);
                    break;
                }
                case CUSTOM_SERIALIZED_OBJECT: {
                    ((CustomSerializedObjectContents) (this.contents))._write_Seq(this._io);
                    break;
                }
                case FLOAT: {
                    ((FloatContents) (this.contents))._write_Seq(this._io);
                    break;
                }
                case INT: {
                    ((IntContents) (this.contents))._write_Seq(this._io);
                    break;
                }
                case NULL: {
                    ((NullContents) (this.contents))._write_Seq(this._io);
                    break;
                }
                case OBJECT: {
                    ((ObjectContents) (this.contents))._write_Seq(this._io);
                    break;
                }
                case OBJECT_REFERENCE: {
                    ((IntContents) (this.contents))._write_Seq(this._io);
                    break;
                }
                case PHP_3_OBJECT: {
                    ((Php3ObjectContents) (this.contents))._write_Seq(this._io);
                    break;
                }
                case PHP_6_STRING: {
                    ((StringContents) (this.contents))._write_Seq(this._io);
                    break;
                }
                case STRING: {
                    ((StringContents) (this.contents))._write_Seq(this._io);
                    break;
                }
                case VARIABLE_REFERENCE: {
                    ((IntContents) (this.contents))._write_Seq(this._io);
                    break;
                }
                }
            }
        }
    }

    public void _check() {
        {
            ValueType on = type();
            if (on != null) {
                switch (type()) {
                case ARRAY: {
                    if (!Objects.equals(((PhpSerializedValue.ArrayContents) (this.contents))._root(), _root()))
                        throw new ConsistencyError("contents", _root(), ((PhpSerializedValue.ArrayContents) (this.contents))._root());
                    if (!Objects.equals(((PhpSerializedValue.ArrayContents) (this.contents))._parent(), this))
                        throw new ConsistencyError("contents", this, ((PhpSerializedValue.ArrayContents) (this.contents))._parent());
                    break;
                }
                case BOOL: {
                    if (!Objects.equals(((PhpSerializedValue.BoolContents) (this.contents))._root(), _root()))
                        throw new ConsistencyError("contents", _root(), ((PhpSerializedValue.BoolContents) (this.contents))._root());
                    if (!Objects.equals(((PhpSerializedValue.BoolContents) (this.contents))._parent(), this))
                        throw new ConsistencyError("contents", this, ((PhpSerializedValue.BoolContents) (this.contents))._parent());
                    break;
                }
                case CUSTOM_SERIALIZED_OBJECT: {
                    if (!Objects.equals(((PhpSerializedValue.CustomSerializedObjectContents) (this.contents))._root(), _root()))
                        throw new ConsistencyError("contents", _root(), ((PhpSerializedValue.CustomSerializedObjectContents) (this.contents))._root());
                    if (!Objects.equals(((PhpSerializedValue.CustomSerializedObjectContents) (this.contents))._parent(), this))
                        throw new ConsistencyError("contents", this, ((PhpSerializedValue.CustomSerializedObjectContents) (this.contents))._parent());
                    break;
                }
                case FLOAT: {
                    if (!Objects.equals(((PhpSerializedValue.FloatContents) (this.contents))._root(), _root()))
                        throw new ConsistencyError("contents", _root(), ((PhpSerializedValue.FloatContents) (this.contents))._root());
                    if (!Objects.equals(((PhpSerializedValue.FloatContents) (this.contents))._parent(), this))
                        throw new ConsistencyError("contents", this, ((PhpSerializedValue.FloatContents) (this.contents))._parent());
                    break;
                }
                case INT: {
                    if (!Objects.equals(((PhpSerializedValue.IntContents) (this.contents))._root(), _root()))
                        throw new ConsistencyError("contents", _root(), ((PhpSerializedValue.IntContents) (this.contents))._root());
                    if (!Objects.equals(((PhpSerializedValue.IntContents) (this.contents))._parent(), this))
                        throw new ConsistencyError("contents", this, ((PhpSerializedValue.IntContents) (this.contents))._parent());
                    break;
                }
                case NULL: {
                    if (!Objects.equals(((PhpSerializedValue.NullContents) (this.contents))._root(), _root()))
                        throw new ConsistencyError("contents", _root(), ((PhpSerializedValue.NullContents) (this.contents))._root());
                    if (!Objects.equals(((PhpSerializedValue.NullContents) (this.contents))._parent(), this))
                        throw new ConsistencyError("contents", this, ((PhpSerializedValue.NullContents) (this.contents))._parent());
                    break;
                }
                case OBJECT: {
                    if (!Objects.equals(((PhpSerializedValue.ObjectContents) (this.contents))._root(), _root()))
                        throw new ConsistencyError("contents", _root(), ((PhpSerializedValue.ObjectContents) (this.contents))._root());
                    if (!Objects.equals(((PhpSerializedValue.ObjectContents) (this.contents))._parent(), this))
                        throw new ConsistencyError("contents", this, ((PhpSerializedValue.ObjectContents) (this.contents))._parent());
                    break;
                }
                case OBJECT_REFERENCE: {
                    if (!Objects.equals(((PhpSerializedValue.IntContents) (this.contents))._root(), _root()))
                        throw new ConsistencyError("contents", _root(), ((PhpSerializedValue.IntContents) (this.contents))._root());
                    if (!Objects.equals(((PhpSerializedValue.IntContents) (this.contents))._parent(), this))
                        throw new ConsistencyError("contents", this, ((PhpSerializedValue.IntContents) (this.contents))._parent());
                    break;
                }
                case PHP_3_OBJECT: {
                    if (!Objects.equals(((PhpSerializedValue.Php3ObjectContents) (this.contents))._root(), _root()))
                        throw new ConsistencyError("contents", _root(), ((PhpSerializedValue.Php3ObjectContents) (this.contents))._root());
                    if (!Objects.equals(((PhpSerializedValue.Php3ObjectContents) (this.contents))._parent(), this))
                        throw new ConsistencyError("contents", this, ((PhpSerializedValue.Php3ObjectContents) (this.contents))._parent());
                    break;
                }
                case PHP_6_STRING: {
                    if (!Objects.equals(((PhpSerializedValue.StringContents) (this.contents))._root(), _root()))
                        throw new ConsistencyError("contents", _root(), ((PhpSerializedValue.StringContents) (this.contents))._root());
                    if (!Objects.equals(((PhpSerializedValue.StringContents) (this.contents))._parent(), this))
                        throw new ConsistencyError("contents", this, ((PhpSerializedValue.StringContents) (this.contents))._parent());
                    break;
                }
                case STRING: {
                    if (!Objects.equals(((PhpSerializedValue.StringContents) (this.contents))._root(), _root()))
                        throw new ConsistencyError("contents", _root(), ((PhpSerializedValue.StringContents) (this.contents))._root());
                    if (!Objects.equals(((PhpSerializedValue.StringContents) (this.contents))._parent(), this))
                        throw new ConsistencyError("contents", this, ((PhpSerializedValue.StringContents) (this.contents))._parent());
                    break;
                }
                case VARIABLE_REFERENCE: {
                    if (!Objects.equals(((PhpSerializedValue.IntContents) (this.contents))._root(), _root()))
                        throw new ConsistencyError("contents", _root(), ((PhpSerializedValue.IntContents) (this.contents))._root());
                    if (!Objects.equals(((PhpSerializedValue.IntContents) (this.contents))._parent(), this))
                        throw new ConsistencyError("contents", this, ((PhpSerializedValue.IntContents) (this.contents))._parent());
                    break;
                }
                }
            }
        }
        _dirty = false;
    }

    /**
     * The contents of an array value.
     */
    public static class ArrayContents extends KaitaiStruct.ReadWrite {
        public static ArrayContents fromFile(String fileName) throws IOException {
            return new ArrayContents(new ByteBufferKaitaiStream(fileName));
        }
        public ArrayContents() {
            this(null, null, null);
        }

        public ArrayContents(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ArrayContents(KaitaiStream _io, PhpSerializedValue _parent) {
            this(_io, _parent, null);
        }

        public ArrayContents(KaitaiStream _io, PhpSerializedValue _parent, PhpSerializedValue _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.colon = this._io.readBytes(1);
            if (!(Arrays.equals(this.colon, new byte[] { 58 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 58 }, this.colon, this._io, "/types/array_contents/seq/0");
            }
            this.elements = new CountPrefixedMapping(this._io, this, _root);
            this.elements._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.elements._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.colon);
            this.elements._write_Seq(this._io);
        }

        public void _check() {
            if (this.colon.length != 1)
                throw new ConsistencyError("colon", 1, this.colon.length);
            if (!(Arrays.equals(this.colon, new byte[] { 58 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 58 }, this.colon, null, "/types/array_contents/seq/0");
            }
            if (!Objects.equals(this.elements._root(), _root()))
                throw new ConsistencyError("elements", _root(), this.elements._root());
            if (!Objects.equals(this.elements._parent(), this))
                throw new ConsistencyError("elements", this, this.elements._parent());
            _dirty = false;
        }
        private byte[] colon;
        private CountPrefixedMapping elements;
        private PhpSerializedValue _root;
        private PhpSerializedValue _parent;
        public byte[] colon() { return colon; }
        public void setColon(byte[] _v) { _dirty = true; colon = _v; }

        /**
         * The array's elements. Keys must be of type `int` or `string`,
         * values may have any type.
         */
        public CountPrefixedMapping elements() { return elements; }
        public void setElements(CountPrefixedMapping _v) { _dirty = true; elements = _v; }
        public PhpSerializedValue _root() { return _root; }
        public void set_root(PhpSerializedValue _v) { _dirty = true; _root = _v; }
        public PhpSerializedValue _parent() { return _parent; }
        public void set_parent(PhpSerializedValue _v) { _dirty = true; _parent = _v; }
    }

    /**
     * The contents of a boolean value (`value_type::bool`).
     */
    public static class BoolContents extends KaitaiStruct.ReadWrite {
        public static BoolContents fromFile(String fileName) throws IOException {
            return new BoolContents(new ByteBufferKaitaiStream(fileName));
        }
        public BoolContents() {
            this(null, null, null);
        }

        public BoolContents(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BoolContents(KaitaiStream _io, PhpSerializedValue _parent) {
            this(_io, _parent, null);
        }

        public BoolContents(KaitaiStream _io, PhpSerializedValue _parent, PhpSerializedValue _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.colon = this._io.readBytes(1);
            if (!(Arrays.equals(this.colon, new byte[] { 58 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 58 }, this.colon, this._io, "/types/bool_contents/seq/0");
            }
            this.valueDec = PhpSerializedValue.BoolValue.byId(this._io.readU1());
            this.semicolon = this._io.readBytes(1);
            if (!(Arrays.equals(this.semicolon, new byte[] { 59 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 59 }, this.semicolon, this._io, "/types/bool_contents/seq/2");
            }
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.colon);
            this._io.writeU1(((Number) (this.valueDec.id())).intValue());
            this._io.writeBytes(this.semicolon);
        }

        public void _check() {
            if (this.colon.length != 1)
                throw new ConsistencyError("colon", 1, this.colon.length);
            if (!(Arrays.equals(this.colon, new byte[] { 58 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 58 }, this.colon, null, "/types/bool_contents/seq/0");
            }
            if (this.semicolon.length != 1)
                throw new ConsistencyError("semicolon", 1, this.semicolon.length);
            if (!(Arrays.equals(this.semicolon, new byte[] { 59 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 59 }, this.semicolon, null, "/types/bool_contents/seq/2");
            }
            _dirty = false;
        }
        private Boolean value;

        /**
         * The value of the `bool`, parsed as a boolean.
         */
        public Boolean value() {
            if (this.value != null)
                return this.value;
            this.value = valueDec() == PhpSerializedValue.BoolValue.TRUE;
            return this.value;
        }
        public void _invalidateValue() { this.value = null; }
        private byte[] colon;
        private BoolValue valueDec;
        private byte[] semicolon;
        private PhpSerializedValue _root;
        private PhpSerializedValue _parent;
        public byte[] colon() { return colon; }
        public void setColon(byte[] _v) { _dirty = true; colon = _v; }

        /**
         * The value of the `bool`: `0` for `false` or `1` for `true`.
         */
        public BoolValue valueDec() { return valueDec; }
        public void setValueDec(BoolValue _v) { _dirty = true; valueDec = _v; }
        public byte[] semicolon() { return semicolon; }
        public void setSemicolon(byte[] _v) { _dirty = true; semicolon = _v; }
        public PhpSerializedValue _root() { return _root; }
        public void set_root(PhpSerializedValue _v) { _dirty = true; _root = _v; }
        public PhpSerializedValue _parent() { return _parent; }
        public void set_parent(PhpSerializedValue _v) { _dirty = true; _parent = _v; }
    }

    /**
     * A mapping (a sequence of key-value pairs) prefixed with its size.
     */
    public static class CountPrefixedMapping extends KaitaiStruct.ReadWrite {
        public static CountPrefixedMapping fromFile(String fileName) throws IOException {
            return new CountPrefixedMapping(new ByteBufferKaitaiStream(fileName));
        }
        public CountPrefixedMapping() {
            this(null, null, null);
        }

        public CountPrefixedMapping(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CountPrefixedMapping(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public CountPrefixedMapping(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, PhpSerializedValue _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.numEntriesDec = new String(this._io.readBytesTerm((byte) 58, false, true, true), StandardCharsets.US_ASCII);
            this.openingBrace = this._io.readBytes(1);
            if (!(Arrays.equals(this.openingBrace, new byte[] { 123 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 123 }, this.openingBrace, this._io, "/types/count_prefixed_mapping/seq/1");
            }
            this.entries = new ArrayList<MappingEntry>();
            for (int i = 0; i < numEntries(); i++) {
                MappingEntry _t_entries = new MappingEntry(this._io, this, _root);
                try {
                    _t_entries._read();
                } finally {
                    this.entries.add(_t_entries);
                }
            }
            this.closingBrace = this._io.readBytes(1);
            if (!(Arrays.equals(this.closingBrace, new byte[] { 125 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 125 }, this.closingBrace, this._io, "/types/count_prefixed_mapping/seq/3");
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.numEntriesDec).getBytes(Charset.forName("ASCII")));
            this._io.writeU1(58);
            this._io.writeBytes(this.openingBrace);
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            this._io.writeBytes(this.closingBrace);
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.numEntriesDec).getBytes(Charset.forName("ASCII")), ((byte) 58)) != -1)
                throw new ConsistencyError("num_entries_dec", -1, KaitaiStream.byteArrayIndexOf((this.numEntriesDec).getBytes(Charset.forName("ASCII")), ((byte) 58)));
            if (this.openingBrace.length != 1)
                throw new ConsistencyError("opening_brace", 1, this.openingBrace.length);
            if (!(Arrays.equals(this.openingBrace, new byte[] { 123 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 123 }, this.openingBrace, null, "/types/count_prefixed_mapping/seq/1");
            }
            if (this.entries.size() != numEntries())
                throw new ConsistencyError("entries", numEntries(), this.entries.size());
            for (int i = 0; i < this.entries.size(); i++) {
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
            }
            if (this.closingBrace.length != 1)
                throw new ConsistencyError("closing_brace", 1, this.closingBrace.length);
            if (!(Arrays.equals(this.closingBrace, new byte[] { 125 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 125 }, this.closingBrace, null, "/types/count_prefixed_mapping/seq/3");
            }
            _dirty = false;
        }
        private Integer numEntries;

        /**
         * The number of key-value pairs in the mapping, parsed as an integer.
         */
        public Integer numEntries() {
            if (this.numEntries != null)
                return this.numEntries;
            this.numEntries = ((Number) (Long.parseLong(numEntriesDec(), 10))).intValue();
            return this.numEntries;
        }
        public void _invalidateNumEntries() { this.numEntries = null; }
        private String numEntriesDec;
        private byte[] openingBrace;
        private List<MappingEntry> entries;
        private byte[] closingBrace;
        private PhpSerializedValue _root;
        private KaitaiStruct.ReadWrite _parent;

        /**
         * The number of key-value pairs in the mapping, in ASCII decimal.
         */
        public String numEntriesDec() { return numEntriesDec; }
        public void setNumEntriesDec(String _v) { _dirty = true; numEntriesDec = _v; }
        public byte[] openingBrace() { return openingBrace; }
        public void setOpeningBrace(byte[] _v) { _dirty = true; openingBrace = _v; }

        /**
         * The key-value pairs contained in the mapping.
         */
        public List<MappingEntry> entries() { return entries; }
        public void setEntries(List<MappingEntry> _v) { _dirty = true; entries = _v; }
        public byte[] closingBrace() { return closingBrace; }
        public void setClosingBrace(byte[] _v) { _dirty = true; closingBrace = _v; }
        public PhpSerializedValue _root() { return _root; }
        public void set_root(PhpSerializedValue _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }

    /**
     * The contents of an object value that implements a custom
     * serialized format using `Serializable`.
     */
    public static class CustomSerializedObjectContents extends KaitaiStruct.ReadWrite {
        public static CustomSerializedObjectContents fromFile(String fileName) throws IOException {
            return new CustomSerializedObjectContents(new ByteBufferKaitaiStream(fileName));
        }
        public CustomSerializedObjectContents() {
            this(null, null, null);
        }

        public CustomSerializedObjectContents(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CustomSerializedObjectContents(KaitaiStream _io, PhpSerializedValue _parent) {
            this(_io, _parent, null);
        }

        public CustomSerializedObjectContents(KaitaiStream _io, PhpSerializedValue _parent, PhpSerializedValue _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.colon1 = this._io.readBytes(1);
            if (!(Arrays.equals(this.colon1, new byte[] { 58 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 58 }, this.colon1, this._io, "/types/custom_serialized_object_contents/seq/0");
            }
            this.className = new LengthPrefixedQuotedString(this._io, this, _root);
            this.className._read();
            this.colon2 = this._io.readBytes(1);
            if (!(Arrays.equals(this.colon2, new byte[] { 58 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 58 }, this.colon2, this._io, "/types/custom_serialized_object_contents/seq/2");
            }
            this.lenDataDec = new String(this._io.readBytesTerm((byte) 58, false, true, true), StandardCharsets.US_ASCII);
            this.openingBrace = this._io.readBytes(1);
            if (!(Arrays.equals(this.openingBrace, new byte[] { 123 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 123 }, this.openingBrace, this._io, "/types/custom_serialized_object_contents/seq/4");
            }
            this.data = this._io.readBytes(lenData());
            this.closingQuote = this._io.readBytes(1);
            if (!(Arrays.equals(this.closingQuote, new byte[] { 125 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 125 }, this.closingQuote, this._io, "/types/custom_serialized_object_contents/seq/6");
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.className._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.colon1);
            this.className._write_Seq(this._io);
            this._io.writeBytes(this.colon2);
            this._io.writeBytes((this.lenDataDec).getBytes(Charset.forName("ASCII")));
            this._io.writeU1(58);
            this._io.writeBytes(this.openingBrace);
            this._io.writeBytes(this.data);
            this._io.writeBytes(this.closingQuote);
        }

        public void _check() {
            if (this.colon1.length != 1)
                throw new ConsistencyError("colon1", 1, this.colon1.length);
            if (!(Arrays.equals(this.colon1, new byte[] { 58 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 58 }, this.colon1, null, "/types/custom_serialized_object_contents/seq/0");
            }
            if (!Objects.equals(this.className._root(), _root()))
                throw new ConsistencyError("class_name", _root(), this.className._root());
            if (!Objects.equals(this.className._parent(), this))
                throw new ConsistencyError("class_name", this, this.className._parent());
            if (this.colon2.length != 1)
                throw new ConsistencyError("colon2", 1, this.colon2.length);
            if (!(Arrays.equals(this.colon2, new byte[] { 58 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 58 }, this.colon2, null, "/types/custom_serialized_object_contents/seq/2");
            }
            if (KaitaiStream.byteArrayIndexOf((this.lenDataDec).getBytes(Charset.forName("ASCII")), ((byte) 58)) != -1)
                throw new ConsistencyError("len_data_dec", -1, KaitaiStream.byteArrayIndexOf((this.lenDataDec).getBytes(Charset.forName("ASCII")), ((byte) 58)));
            if (this.openingBrace.length != 1)
                throw new ConsistencyError("opening_brace", 1, this.openingBrace.length);
            if (!(Arrays.equals(this.openingBrace, new byte[] { 123 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 123 }, this.openingBrace, null, "/types/custom_serialized_object_contents/seq/4");
            }
            if (this.data.length != lenData())
                throw new ConsistencyError("data", lenData(), this.data.length);
            if (this.closingQuote.length != 1)
                throw new ConsistencyError("closing_quote", 1, this.closingQuote.length);
            if (!(Arrays.equals(this.closingQuote, new byte[] { 125 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 125 }, this.closingQuote, null, "/types/custom_serialized_object_contents/seq/6");
            }
            _dirty = false;
        }
        private Integer lenData;

        /**
         * The length of the serialized data in bytes, parsed as an integer.
         * The braces are not counted in this length number.
         */
        public Integer lenData() {
            if (this.lenData != null)
                return this.lenData;
            this.lenData = ((Number) (Long.parseLong(lenDataDec(), 10))).intValue();
            return this.lenData;
        }
        public void _invalidateLenData() { this.lenData = null; }
        private byte[] colon1;
        private LengthPrefixedQuotedString className;
        private byte[] colon2;
        private String lenDataDec;
        private byte[] openingBrace;
        private byte[] data;
        private byte[] closingQuote;
        private PhpSerializedValue _root;
        private PhpSerializedValue _parent;
        public byte[] colon1() { return colon1; }
        public void setColon1(byte[] _v) { _dirty = true; colon1 = _v; }

        /**
         * The name of the object's class.
         */
        public LengthPrefixedQuotedString className() { return className; }
        public void setClassName(LengthPrefixedQuotedString _v) { _dirty = true; className = _v; }
        public byte[] colon2() { return colon2; }
        public void setColon2(byte[] _v) { _dirty = true; colon2 = _v; }

        /**
         * The length of the serialized data in bytes, in ASCII decimal.
         * The braces are not counted in this size number.
         */
        public String lenDataDec() { return lenDataDec; }
        public void setLenDataDec(String _v) { _dirty = true; lenDataDec = _v; }
        public byte[] openingBrace() { return openingBrace; }
        public void setOpeningBrace(byte[] _v) { _dirty = true; openingBrace = _v; }

        /**
         * The custom serialized data. The braces are not included.
         * 
         * Although the surrounding braces make it look like a regular
         * serialized object, this field is actually more similar to a string:
         * it can contain arbitrary data that is not required to follow
         * any common structure.
         */
        public byte[] data() { return data; }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public byte[] closingQuote() { return closingQuote; }
        public void setClosingQuote(byte[] _v) { _dirty = true; closingQuote = _v; }
        public PhpSerializedValue _root() { return _root; }
        public void set_root(PhpSerializedValue _v) { _dirty = true; _root = _v; }
        public PhpSerializedValue _parent() { return _parent; }
        public void set_parent(PhpSerializedValue _v) { _dirty = true; _parent = _v; }
    }

    /**
     * The contents of a floating-point value.
     */
    public static class FloatContents extends KaitaiStruct.ReadWrite {
        public static FloatContents fromFile(String fileName) throws IOException {
            return new FloatContents(new ByteBufferKaitaiStream(fileName));
        }
        public FloatContents() {
            this(null, null, null);
        }

        public FloatContents(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FloatContents(KaitaiStream _io, PhpSerializedValue _parent) {
            this(_io, _parent, null);
        }

        public FloatContents(KaitaiStream _io, PhpSerializedValue _parent, PhpSerializedValue _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.colon = this._io.readBytes(1);
            if (!(Arrays.equals(this.colon, new byte[] { 58 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 58 }, this.colon, this._io, "/types/float_contents/seq/0");
            }
            this.valueDec = new String(this._io.readBytesTerm((byte) 59, false, true, true), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.colon);
            this._io.writeBytes((this.valueDec).getBytes(Charset.forName("ASCII")));
            this._io.writeU1(59);
        }

        public void _check() {
            if (this.colon.length != 1)
                throw new ConsistencyError("colon", 1, this.colon.length);
            if (!(Arrays.equals(this.colon, new byte[] { 58 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 58 }, this.colon, null, "/types/float_contents/seq/0");
            }
            if (KaitaiStream.byteArrayIndexOf((this.valueDec).getBytes(Charset.forName("ASCII")), ((byte) 59)) != -1)
                throw new ConsistencyError("value_dec", -1, KaitaiStream.byteArrayIndexOf((this.valueDec).getBytes(Charset.forName("ASCII")), ((byte) 59)));
            _dirty = false;
        }
        private byte[] colon;
        private String valueDec;
        private PhpSerializedValue _root;
        private PhpSerializedValue _parent;
        public byte[] colon() { return colon; }
        public void setColon(byte[] _v) { _dirty = true; colon = _v; }

        /**
         * The value of the `float`, in ASCII decimal, as generated by PHP's
         * usual double-to-string conversion. In particular, this means that:
         * 
         * * A decimal point may not be included (for integral numbers)
         * * The number may use exponent notation (e. g. `1.0E+16`)
         * * Positive and negative infinity are represented as `INF`
         *   and `-INF`, respectively
         * * Not-a-number is represented as `NAN`
         */
        public String valueDec() { return valueDec; }
        public void setValueDec(String _v) { _dirty = true; valueDec = _v; }
        public PhpSerializedValue _root() { return _root; }
        public void set_root(PhpSerializedValue _v) { _dirty = true; _root = _v; }
        public PhpSerializedValue _parent() { return _parent; }
        public void set_parent(PhpSerializedValue _v) { _dirty = true; _parent = _v; }
    }

    /**
     * The contents of an integer-like value:
     * either an actual integer (`value_type::int`) or a reference
     * (`value_type::variable_reference`, `value_type::object_reference`).
     */
    public static class IntContents extends KaitaiStruct.ReadWrite {
        public static IntContents fromFile(String fileName) throws IOException {
            return new IntContents(new ByteBufferKaitaiStream(fileName));
        }
        public IntContents() {
            this(null, null, null);
        }

        public IntContents(KaitaiStream _io) {
            this(_io, null, null);
        }

        public IntContents(KaitaiStream _io, PhpSerializedValue _parent) {
            this(_io, _parent, null);
        }

        public IntContents(KaitaiStream _io, PhpSerializedValue _parent, PhpSerializedValue _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.colon = this._io.readBytes(1);
            if (!(Arrays.equals(this.colon, new byte[] { 58 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 58 }, this.colon, this._io, "/types/int_contents/seq/0");
            }
            this.valueDec = new String(this._io.readBytesTerm((byte) 59, false, true, true), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.colon);
            this._io.writeBytes((this.valueDec).getBytes(Charset.forName("ASCII")));
            this._io.writeU1(59);
        }

        public void _check() {
            if (this.colon.length != 1)
                throw new ConsistencyError("colon", 1, this.colon.length);
            if (!(Arrays.equals(this.colon, new byte[] { 58 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 58 }, this.colon, null, "/types/int_contents/seq/0");
            }
            if (KaitaiStream.byteArrayIndexOf((this.valueDec).getBytes(Charset.forName("ASCII")), ((byte) 59)) != -1)
                throw new ConsistencyError("value_dec", -1, KaitaiStream.byteArrayIndexOf((this.valueDec).getBytes(Charset.forName("ASCII")), ((byte) 59)));
            _dirty = false;
        }
        private Integer value;

        /**
         * The value of the `int`, parsed as an integer.
         */
        public Integer value() {
            if (this.value != null)
                return this.value;
            this.value = ((Number) (Long.parseLong(valueDec(), 10))).intValue();
            return this.value;
        }
        public void _invalidateValue() { this.value = null; }
        private byte[] colon;
        private String valueDec;
        private PhpSerializedValue _root;
        private PhpSerializedValue _parent;
        public byte[] colon() { return colon; }
        public void setColon(byte[] _v) { _dirty = true; colon = _v; }

        /**
         * The value of the `int`, in ASCII decimal.
         */
        public String valueDec() { return valueDec; }
        public void setValueDec(String _v) { _dirty = true; valueDec = _v; }
        public PhpSerializedValue _root() { return _root; }
        public void set_root(PhpSerializedValue _v) { _dirty = true; _root = _v; }
        public PhpSerializedValue _parent() { return _parent; }
        public void set_parent(PhpSerializedValue _v) { _dirty = true; _parent = _v; }
    }

    /**
     * A quoted string prefixed with its length.
     * 
     * Despite the quotes surrounding the string data, it can contain
     * arbitrary bytes, which are never escaped in any way.
     * This does not cause any ambiguities when parsing - the bounds of
     * the string are determined only by the length field, not by the quotes.
     */
    public static class LengthPrefixedQuotedString extends KaitaiStruct.ReadWrite {
        public static LengthPrefixedQuotedString fromFile(String fileName) throws IOException {
            return new LengthPrefixedQuotedString(new ByteBufferKaitaiStream(fileName));
        }
        public LengthPrefixedQuotedString() {
            this(null, null, null);
        }

        public LengthPrefixedQuotedString(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LengthPrefixedQuotedString(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public LengthPrefixedQuotedString(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, PhpSerializedValue _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lenDataDec = new String(this._io.readBytesTerm((byte) 58, false, true, true), StandardCharsets.US_ASCII);
            this.openingQuote = this._io.readBytes(1);
            if (!(Arrays.equals(this.openingQuote, new byte[] { 34 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 34 }, this.openingQuote, this._io, "/types/length_prefixed_quoted_string/seq/1");
            }
            this.data = this._io.readBytes(lenData());
            this.closingQuote = this._io.readBytes(1);
            if (!(Arrays.equals(this.closingQuote, new byte[] { 34 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 34 }, this.closingQuote, this._io, "/types/length_prefixed_quoted_string/seq/3");
            }
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.lenDataDec).getBytes(Charset.forName("ASCII")));
            this._io.writeU1(58);
            this._io.writeBytes(this.openingQuote);
            this._io.writeBytes(this.data);
            this._io.writeBytes(this.closingQuote);
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.lenDataDec).getBytes(Charset.forName("ASCII")), ((byte) 58)) != -1)
                throw new ConsistencyError("len_data_dec", -1, KaitaiStream.byteArrayIndexOf((this.lenDataDec).getBytes(Charset.forName("ASCII")), ((byte) 58)));
            if (this.openingQuote.length != 1)
                throw new ConsistencyError("opening_quote", 1, this.openingQuote.length);
            if (!(Arrays.equals(this.openingQuote, new byte[] { 34 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 34 }, this.openingQuote, null, "/types/length_prefixed_quoted_string/seq/1");
            }
            if (this.data.length != lenData())
                throw new ConsistencyError("data", lenData(), this.data.length);
            if (this.closingQuote.length != 1)
                throw new ConsistencyError("closing_quote", 1, this.closingQuote.length);
            if (!(Arrays.equals(this.closingQuote, new byte[] { 34 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 34 }, this.closingQuote, null, "/types/length_prefixed_quoted_string/seq/3");
            }
            _dirty = false;
        }
        private Integer lenData;

        /**
         * The length of the string's contents in bytes, parsed as an integer.
         * The quotes are not counted in this size number.
         */
        public Integer lenData() {
            if (this.lenData != null)
                return this.lenData;
            this.lenData = ((Number) (Long.parseLong(lenDataDec(), 10))).intValue();
            return this.lenData;
        }
        public void _invalidateLenData() { this.lenData = null; }
        private String lenDataDec;
        private byte[] openingQuote;
        private byte[] data;
        private byte[] closingQuote;
        private PhpSerializedValue _root;
        private KaitaiStruct.ReadWrite _parent;

        /**
         * The length of the string's data in bytes, in ASCII decimal.
         * The quotes are not counted in this length number.
         */
        public String lenDataDec() { return lenDataDec; }
        public void setLenDataDec(String _v) { _dirty = true; lenDataDec = _v; }
        public byte[] openingQuote() { return openingQuote; }
        public void setOpeningQuote(byte[] _v) { _dirty = true; openingQuote = _v; }

        /**
         * The data contained in the string. The quotes are not included.
         */
        public byte[] data() { return data; }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public byte[] closingQuote() { return closingQuote; }
        public void setClosingQuote(byte[] _v) { _dirty = true; closingQuote = _v; }
        public PhpSerializedValue _root() { return _root; }
        public void set_root(PhpSerializedValue _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }

    /**
     * A mapping entry consisting of a key and a value.
     */
    public static class MappingEntry extends KaitaiStruct.ReadWrite {
        public static MappingEntry fromFile(String fileName) throws IOException {
            return new MappingEntry(new ByteBufferKaitaiStream(fileName));
        }
        public MappingEntry() {
            this(null, null, null);
        }

        public MappingEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MappingEntry(KaitaiStream _io, PhpSerializedValue.CountPrefixedMapping _parent) {
            this(_io, _parent, null);
        }

        public MappingEntry(KaitaiStream _io, PhpSerializedValue.CountPrefixedMapping _parent, PhpSerializedValue _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.key = new PhpSerializedValue(this._io, this, _root);
            this.key._read();
            this.value = new PhpSerializedValue(this._io, this, _root);
            this.value._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.key._fetchInstances();
            this.value._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.key._write_Seq(this._io);
            this.value._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.key._root(), _root()))
                throw new ConsistencyError("key", _root(), this.key._root());
            if (!Objects.equals(this.key._parent(), this))
                throw new ConsistencyError("key", this, this.key._parent());
            if (!Objects.equals(this.value._root(), _root()))
                throw new ConsistencyError("value", _root(), this.value._root());
            if (!Objects.equals(this.value._parent(), this))
                throw new ConsistencyError("value", this, this.value._parent());
            _dirty = false;
        }
        private PhpSerializedValue key;
        private PhpSerializedValue value;
        private PhpSerializedValue _root;
        private PhpSerializedValue.CountPrefixedMapping _parent;

        /**
         * The key of the entry.
         */
        public PhpSerializedValue key() { return key; }
        public void setKey(PhpSerializedValue _v) { _dirty = true; key = _v; }

        /**
         * The value of the entry.
         */
        public PhpSerializedValue value() { return value; }
        public void setValue(PhpSerializedValue _v) { _dirty = true; value = _v; }
        public PhpSerializedValue _root() { return _root; }
        public void set_root(PhpSerializedValue _v) { _dirty = true; _root = _v; }
        public PhpSerializedValue.CountPrefixedMapping _parent() { return _parent; }
        public void set_parent(PhpSerializedValue.CountPrefixedMapping _v) { _dirty = true; _parent = _v; }
    }

    /**
     * The contents of a null value (`value_type::null`). This structure
     * contains no actual data, since there is only a single `NULL` value.
     */
    public static class NullContents extends KaitaiStruct.ReadWrite {
        public static NullContents fromFile(String fileName) throws IOException {
            return new NullContents(new ByteBufferKaitaiStream(fileName));
        }
        public NullContents() {
            this(null, null, null);
        }

        public NullContents(KaitaiStream _io) {
            this(_io, null, null);
        }

        public NullContents(KaitaiStream _io, PhpSerializedValue _parent) {
            this(_io, _parent, null);
        }

        public NullContents(KaitaiStream _io, PhpSerializedValue _parent, PhpSerializedValue _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.semicolon = this._io.readBytes(1);
            if (!(Arrays.equals(this.semicolon, new byte[] { 59 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 59 }, this.semicolon, this._io, "/types/null_contents/seq/0");
            }
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.semicolon);
        }

        public void _check() {
            if (this.semicolon.length != 1)
                throw new ConsistencyError("semicolon", 1, this.semicolon.length);
            if (!(Arrays.equals(this.semicolon, new byte[] { 59 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 59 }, this.semicolon, null, "/types/null_contents/seq/0");
            }
            _dirty = false;
        }
        private byte[] semicolon;
        private PhpSerializedValue _root;
        private PhpSerializedValue _parent;
        public byte[] semicolon() { return semicolon; }
        public void setSemicolon(byte[] _v) { _dirty = true; semicolon = _v; }
        public PhpSerializedValue _root() { return _root; }
        public void set_root(PhpSerializedValue _v) { _dirty = true; _root = _v; }
        public PhpSerializedValue _parent() { return _parent; }
        public void set_parent(PhpSerializedValue _v) { _dirty = true; _parent = _v; }
    }

    /**
     * The contents of an object value serialized in the default format.
     * Unlike its PHP 3 counterpart, it contains a class name.
     */
    public static class ObjectContents extends KaitaiStruct.ReadWrite {
        public static ObjectContents fromFile(String fileName) throws IOException {
            return new ObjectContents(new ByteBufferKaitaiStream(fileName));
        }
        public ObjectContents() {
            this(null, null, null);
        }

        public ObjectContents(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ObjectContents(KaitaiStream _io, PhpSerializedValue _parent) {
            this(_io, _parent, null);
        }

        public ObjectContents(KaitaiStream _io, PhpSerializedValue _parent, PhpSerializedValue _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.colon1 = this._io.readBytes(1);
            if (!(Arrays.equals(this.colon1, new byte[] { 58 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 58 }, this.colon1, this._io, "/types/object_contents/seq/0");
            }
            this.className = new LengthPrefixedQuotedString(this._io, this, _root);
            this.className._read();
            this.colon2 = this._io.readBytes(1);
            if (!(Arrays.equals(this.colon2, new byte[] { 58 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 58 }, this.colon2, this._io, "/types/object_contents/seq/2");
            }
            this.properties = new CountPrefixedMapping(this._io, this, _root);
            this.properties._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.className._fetchInstances();
            this.properties._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.colon1);
            this.className._write_Seq(this._io);
            this._io.writeBytes(this.colon2);
            this.properties._write_Seq(this._io);
        }

        public void _check() {
            if (this.colon1.length != 1)
                throw new ConsistencyError("colon1", 1, this.colon1.length);
            if (!(Arrays.equals(this.colon1, new byte[] { 58 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 58 }, this.colon1, null, "/types/object_contents/seq/0");
            }
            if (!Objects.equals(this.className._root(), _root()))
                throw new ConsistencyError("class_name", _root(), this.className._root());
            if (!Objects.equals(this.className._parent(), this))
                throw new ConsistencyError("class_name", this, this.className._parent());
            if (this.colon2.length != 1)
                throw new ConsistencyError("colon2", 1, this.colon2.length);
            if (!(Arrays.equals(this.colon2, new byte[] { 58 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 58 }, this.colon2, null, "/types/object_contents/seq/2");
            }
            if (!Objects.equals(this.properties._root(), _root()))
                throw new ConsistencyError("properties", _root(), this.properties._root());
            if (!Objects.equals(this.properties._parent(), this))
                throw new ConsistencyError("properties", this, this.properties._parent());
            _dirty = false;
        }
        private byte[] colon1;
        private LengthPrefixedQuotedString className;
        private byte[] colon2;
        private CountPrefixedMapping properties;
        private PhpSerializedValue _root;
        private PhpSerializedValue _parent;
        public byte[] colon1() { return colon1; }
        public void setColon1(byte[] _v) { _dirty = true; colon1 = _v; }

        /**
         * The name of the object's class.
         */
        public LengthPrefixedQuotedString className() { return className; }
        public void setClassName(LengthPrefixedQuotedString _v) { _dirty = true; className = _v; }
        public byte[] colon2() { return colon2; }
        public void setColon2(byte[] _v) { _dirty = true; colon2 = _v; }

        /**
         * The object's properties. Keys ust be of type `string`,
         * values may have any type.
         */
        public CountPrefixedMapping properties() { return properties; }
        public void setProperties(CountPrefixedMapping _v) { _dirty = true; properties = _v; }
        public PhpSerializedValue _root() { return _root; }
        public void set_root(PhpSerializedValue _v) { _dirty = true; _root = _v; }
        public PhpSerializedValue _parent() { return _parent; }
        public void set_parent(PhpSerializedValue _v) { _dirty = true; _parent = _v; }
    }

    /**
     * The contents of a PHP 3 object value. Unlike its counterpart in PHP 4
     * and above, it does not contain a class name.
     */
    public static class Php3ObjectContents extends KaitaiStruct.ReadWrite {
        public static Php3ObjectContents fromFile(String fileName) throws IOException {
            return new Php3ObjectContents(new ByteBufferKaitaiStream(fileName));
        }
        public Php3ObjectContents() {
            this(null, null, null);
        }

        public Php3ObjectContents(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Php3ObjectContents(KaitaiStream _io, PhpSerializedValue _parent) {
            this(_io, _parent, null);
        }

        public Php3ObjectContents(KaitaiStream _io, PhpSerializedValue _parent, PhpSerializedValue _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.colon = this._io.readBytes(1);
            if (!(Arrays.equals(this.colon, new byte[] { 58 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 58 }, this.colon, this._io, "/types/php_3_object_contents/seq/0");
            }
            this.properties = new CountPrefixedMapping(this._io, this, _root);
            this.properties._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.properties._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.colon);
            this.properties._write_Seq(this._io);
        }

        public void _check() {
            if (this.colon.length != 1)
                throw new ConsistencyError("colon", 1, this.colon.length);
            if (!(Arrays.equals(this.colon, new byte[] { 58 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 58 }, this.colon, null, "/types/php_3_object_contents/seq/0");
            }
            if (!Objects.equals(this.properties._root(), _root()))
                throw new ConsistencyError("properties", _root(), this.properties._root());
            if (!Objects.equals(this.properties._parent(), this))
                throw new ConsistencyError("properties", this, this.properties._parent());
            _dirty = false;
        }
        private byte[] colon;
        private CountPrefixedMapping properties;
        private PhpSerializedValue _root;
        private PhpSerializedValue _parent;
        public byte[] colon() { return colon; }
        public void setColon(byte[] _v) { _dirty = true; colon = _v; }

        /**
         * The object's properties. Keys must be of type `string`,
         * values may have any type.
         */
        public CountPrefixedMapping properties() { return properties; }
        public void setProperties(CountPrefixedMapping _v) { _dirty = true; properties = _v; }
        public PhpSerializedValue _root() { return _root; }
        public void set_root(PhpSerializedValue _v) { _dirty = true; _root = _v; }
        public PhpSerializedValue _parent() { return _parent; }
        public void set_parent(PhpSerializedValue _v) { _dirty = true; _parent = _v; }
    }

    /**
     * The contents of a string value.
     * 
     * Note: PHP strings can contain arbitrary byte sequences.
     * They are not necessarily valid text in any specific encoding.
     */
    public static class StringContents extends KaitaiStruct.ReadWrite {
        public static StringContents fromFile(String fileName) throws IOException {
            return new StringContents(new ByteBufferKaitaiStream(fileName));
        }
        public StringContents() {
            this(null, null, null);
        }

        public StringContents(KaitaiStream _io) {
            this(_io, null, null);
        }

        public StringContents(KaitaiStream _io, PhpSerializedValue _parent) {
            this(_io, _parent, null);
        }

        public StringContents(KaitaiStream _io, PhpSerializedValue _parent, PhpSerializedValue _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.colon = this._io.readBytes(1);
            if (!(Arrays.equals(this.colon, new byte[] { 58 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 58 }, this.colon, this._io, "/types/string_contents/seq/0");
            }
            this.string = new LengthPrefixedQuotedString(this._io, this, _root);
            this.string._read();
            this.semicolon = this._io.readBytes(1);
            if (!(Arrays.equals(this.semicolon, new byte[] { 59 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 59 }, this.semicolon, this._io, "/types/string_contents/seq/2");
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.string._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.colon);
            this.string._write_Seq(this._io);
            this._io.writeBytes(this.semicolon);
        }

        public void _check() {
            if (this.colon.length != 1)
                throw new ConsistencyError("colon", 1, this.colon.length);
            if (!(Arrays.equals(this.colon, new byte[] { 58 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 58 }, this.colon, null, "/types/string_contents/seq/0");
            }
            if (!Objects.equals(this.string._root(), _root()))
                throw new ConsistencyError("string", _root(), this.string._root());
            if (!Objects.equals(this.string._parent(), this))
                throw new ConsistencyError("string", this, this.string._parent());
            if (this.semicolon.length != 1)
                throw new ConsistencyError("semicolon", 1, this.semicolon.length);
            if (!(Arrays.equals(this.semicolon, new byte[] { 59 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 59 }, this.semicolon, null, "/types/string_contents/seq/2");
            }
            _dirty = false;
        }
        private byte[] value;

        /**
         * The value of the string, as a byte array.
         */
        public byte[] value() {
            if (this.value != null)
                return this.value;
            this.value = string().data();
            return this.value;
        }
        public void _invalidateValue() { this.value = null; }
        private byte[] colon;
        private LengthPrefixedQuotedString string;
        private byte[] semicolon;
        private PhpSerializedValue _root;
        private PhpSerializedValue _parent;
        public byte[] colon() { return colon; }
        public void setColon(byte[] _v) { _dirty = true; colon = _v; }
        public LengthPrefixedQuotedString string() { return string; }
        public void setString(LengthPrefixedQuotedString _v) { _dirty = true; string = _v; }
        public byte[] semicolon() { return semicolon; }
        public void setSemicolon(byte[] _v) { _dirty = true; semicolon = _v; }
        public PhpSerializedValue _root() { return _root; }
        public void set_root(PhpSerializedValue _v) { _dirty = true; _root = _v; }
        public PhpSerializedValue _parent() { return _parent; }
        public void set_parent(PhpSerializedValue _v) { _dirty = true; _parent = _v; }
    }
    private ValueType type;
    private KaitaiStruct.ReadWrite contents;
    private PhpSerializedValue _root;
    private KaitaiStruct.ReadWrite _parent;

    /**
     * A single-character code indicating the type of the serialized value.
     */
    public ValueType type() { return type; }
    public void setType(ValueType _v) { _dirty = true; type = _v; }

    /**
     * The contents of the serialized value, which vary depending on the type.
     */
    public KaitaiStruct.ReadWrite contents() { return contents; }
    public void setContents(KaitaiStruct.ReadWrite _v) { _dirty = true; contents = _v; }
    public PhpSerializedValue _root() { return _root; }
    public void set_root(PhpSerializedValue _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

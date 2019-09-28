// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.Charset;
import java.util.ArrayList;


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
public class PhpSerializedValue extends KaitaiStruct {
    public static PhpSerializedValue fromFile(String fileName) throws IOException {
        return new PhpSerializedValue(new ByteBufferKaitaiStream(fileName));
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

    public PhpSerializedValue(KaitaiStream _io) {
        this(_io, null, null);
    }

    public PhpSerializedValue(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public PhpSerializedValue(KaitaiStream _io, KaitaiStruct _parent, PhpSerializedValue _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.type = ValueType.byId(this._io.readU1());
        {
            ValueType on = type();
            if (on != null) {
                switch (type()) {
                case CUSTOM_SERIALIZED_OBJECT: {
                    this.contents = new CustomSerializedObjectContents(this._io, this, _root);
                    break;
                }
                case PHP_3_OBJECT: {
                    this.contents = new Php3ObjectContents(this._io, this, _root);
                    break;
                }
                case OBJECT: {
                    this.contents = new ObjectContents(this._io, this, _root);
                    break;
                }
                case VARIABLE_REFERENCE: {
                    this.contents = new IntContents(this._io, this, _root);
                    break;
                }
                case PHP_6_STRING: {
                    this.contents = new StringContents(this._io, this, _root);
                    break;
                }
                case FLOAT: {
                    this.contents = new FloatContents(this._io, this, _root);
                    break;
                }
                case OBJECT_REFERENCE: {
                    this.contents = new IntContents(this._io, this, _root);
                    break;
                }
                case NULL: {
                    this.contents = new NullContents(this._io, this, _root);
                    break;
                }
                case BOOL: {
                    this.contents = new BoolContents(this._io, this, _root);
                    break;
                }
                case INT: {
                    this.contents = new IntContents(this._io, this, _root);
                    break;
                }
                case ARRAY: {
                    this.contents = new ArrayContents(this._io, this, _root);
                    break;
                }
                case STRING: {
                    this.contents = new StringContents(this._io, this, _root);
                    break;
                }
                }
            }
        }
    }

    /**
     * A mapping (a sequence of key-value pairs) prefixed with its size.
     */
    public static class CountPrefixedMapping extends KaitaiStruct {
        public static CountPrefixedMapping fromFile(String fileName) throws IOException {
            return new CountPrefixedMapping(new ByteBufferKaitaiStream(fileName));
        }

        public CountPrefixedMapping(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CountPrefixedMapping(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public CountPrefixedMapping(KaitaiStream _io, KaitaiStruct _parent, PhpSerializedValue _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.numEntriesDec = new String(this._io.readBytesTerm(58, false, true, true), Charset.forName("ASCII"));
            this.openingBrace = this._io.ensureFixedContents(new byte[] { 123 });
            entries = new ArrayList<MappingEntry>(((Number) (numEntries())).intValue());
            for (int i = 0; i < numEntries(); i++) {
                this.entries.add(new MappingEntry(this._io, this, _root));
            }
            this.closingBrace = this._io.ensureFixedContents(new byte[] { 125 });
        }
        private Integer numEntries;

        /**
         * The number of key-value pairs in the mapping, parsed as an integer.
         */
        public Integer numEntries() {
            if (this.numEntries != null)
                return this.numEntries;
            int _tmp = (int) (Long.parseLong(numEntriesDec(), 10));
            this.numEntries = _tmp;
            return this.numEntries;
        }
        private String numEntriesDec;
        private byte[] openingBrace;
        private ArrayList<MappingEntry> entries;
        private byte[] closingBrace;
        private PhpSerializedValue _root;
        private KaitaiStruct _parent;

        /**
         * The number of key-value pairs in the mapping, in ASCII decimal.
         */
        public String numEntriesDec() { return numEntriesDec; }
        public byte[] openingBrace() { return openingBrace; }

        /**
         * The key-value pairs contained in the mapping.
         */
        public ArrayList<MappingEntry> entries() { return entries; }
        public byte[] closingBrace() { return closingBrace; }
        public PhpSerializedValue _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * The contents of a floating-point value.
     */
    public static class FloatContents extends KaitaiStruct {
        public static FloatContents fromFile(String fileName) throws IOException {
            return new FloatContents(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.colon = this._io.ensureFixedContents(new byte[] { 58 });
            this.valueDec = new String(this._io.readBytesTerm(59, false, true, true), Charset.forName("ASCII"));
        }
        private byte[] colon;
        private String valueDec;
        private PhpSerializedValue _root;
        private PhpSerializedValue _parent;
        public byte[] colon() { return colon; }

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
        public PhpSerializedValue _root() { return _root; }
        public PhpSerializedValue _parent() { return _parent; }
    }

    /**
     * A quoted string prefixed with its length.
     * 
     * Despite the quotes surrounding the string data, it can contain
     * arbitrary bytes, which are never escaped in any way.
     * This does not cause any ambiguities when parsing - the bounds of
     * the string are determined only by the length field, not by the quotes.
     */
    public static class LengthPrefixedQuotedString extends KaitaiStruct {
        public static LengthPrefixedQuotedString fromFile(String fileName) throws IOException {
            return new LengthPrefixedQuotedString(new ByteBufferKaitaiStream(fileName));
        }

        public LengthPrefixedQuotedString(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LengthPrefixedQuotedString(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public LengthPrefixedQuotedString(KaitaiStream _io, KaitaiStruct _parent, PhpSerializedValue _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lenDataDec = new String(this._io.readBytesTerm(58, false, true, true), Charset.forName("ASCII"));
            this.openingQuote = this._io.ensureFixedContents(new byte[] { 34 });
            this.data = this._io.readBytes(lenData());
            this.closingQuote = this._io.ensureFixedContents(new byte[] { 34 });
        }
        private Integer lenData;

        /**
         * The length of the string's contents in bytes, parsed as an integer.
         * The quotes are not counted in this size number.
         */
        public Integer lenData() {
            if (this.lenData != null)
                return this.lenData;
            int _tmp = (int) (Long.parseLong(lenDataDec(), 10));
            this.lenData = _tmp;
            return this.lenData;
        }
        private String lenDataDec;
        private byte[] openingQuote;
        private byte[] data;
        private byte[] closingQuote;
        private PhpSerializedValue _root;
        private KaitaiStruct _parent;

        /**
         * The length of the string's data in bytes, in ASCII decimal.
         * The quotes are not counted in this length number.
         */
        public String lenDataDec() { return lenDataDec; }
        public byte[] openingQuote() { return openingQuote; }

        /**
         * The data contained in the string. The quotes are not included.
         */
        public byte[] data() { return data; }
        public byte[] closingQuote() { return closingQuote; }
        public PhpSerializedValue _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * The contents of an object value serialized in the default format.
     * Unlike its PHP 3 counterpart, it contains a class name.
     */
    public static class ObjectContents extends KaitaiStruct {
        public static ObjectContents fromFile(String fileName) throws IOException {
            return new ObjectContents(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.colon1 = this._io.ensureFixedContents(new byte[] { 58 });
            this.className = new LengthPrefixedQuotedString(this._io, this, _root);
            this.colon2 = this._io.ensureFixedContents(new byte[] { 58 });
            this.properties = new CountPrefixedMapping(this._io, this, _root);
        }
        private byte[] colon1;
        private LengthPrefixedQuotedString className;
        private byte[] colon2;
        private CountPrefixedMapping properties;
        private PhpSerializedValue _root;
        private PhpSerializedValue _parent;
        public byte[] colon1() { return colon1; }

        /**
         * The name of the object's class.
         */
        public LengthPrefixedQuotedString className() { return className; }
        public byte[] colon2() { return colon2; }

        /**
         * The object's properties. Keys ust be of type `string`,
         * values may have any type.
         */
        public CountPrefixedMapping properties() { return properties; }
        public PhpSerializedValue _root() { return _root; }
        public PhpSerializedValue _parent() { return _parent; }
    }

    /**
     * The contents of an array value.
     */
    public static class ArrayContents extends KaitaiStruct {
        public static ArrayContents fromFile(String fileName) throws IOException {
            return new ArrayContents(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.colon = this._io.ensureFixedContents(new byte[] { 58 });
            this.elements = new CountPrefixedMapping(this._io, this, _root);
        }
        private byte[] colon;
        private CountPrefixedMapping elements;
        private PhpSerializedValue _root;
        private PhpSerializedValue _parent;
        public byte[] colon() { return colon; }

        /**
         * The array's elements. Keys must be of type `int` or `string`,
         * values may have any type.
         */
        public CountPrefixedMapping elements() { return elements; }
        public PhpSerializedValue _root() { return _root; }
        public PhpSerializedValue _parent() { return _parent; }
    }

    /**
     * The contents of an object value that implements a custom
     * serialized format using `Serializable`.
     */
    public static class CustomSerializedObjectContents extends KaitaiStruct {
        public static CustomSerializedObjectContents fromFile(String fileName) throws IOException {
            return new CustomSerializedObjectContents(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.colon1 = this._io.ensureFixedContents(new byte[] { 58 });
            this.className = new LengthPrefixedQuotedString(this._io, this, _root);
            this.colon2 = this._io.ensureFixedContents(new byte[] { 58 });
            this.lenDataDec = new String(this._io.readBytesTerm(58, false, true, true), Charset.forName("ASCII"));
            this.openingBrace = this._io.ensureFixedContents(new byte[] { 123 });
            this.data = this._io.readBytes(lenData());
            this.closingQuote = this._io.ensureFixedContents(new byte[] { 125 });
        }
        private Integer lenData;

        /**
         * The length of the serialized data in bytes, parsed as an integer.
         * The braces are not counted in this length number.
         */
        public Integer lenData() {
            if (this.lenData != null)
                return this.lenData;
            int _tmp = (int) (Long.parseLong(lenDataDec(), 10));
            this.lenData = _tmp;
            return this.lenData;
        }
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

        /**
         * The name of the object's class.
         */
        public LengthPrefixedQuotedString className() { return className; }
        public byte[] colon2() { return colon2; }

        /**
         * The length of the serialized data in bytes, in ASCII decimal.
         * The braces are not counted in this size number.
         */
        public String lenDataDec() { return lenDataDec; }
        public byte[] openingBrace() { return openingBrace; }

        /**
         * The custom serialized data. The braces are not included.
         * 
         * Although the surrounding braces make it look like a regular
         * serialized object, this field is actually more similar to a string:
         * it can contain arbitrary data that is not required to follow
         * any common structure.
         */
        public byte[] data() { return data; }
        public byte[] closingQuote() { return closingQuote; }
        public PhpSerializedValue _root() { return _root; }
        public PhpSerializedValue _parent() { return _parent; }
    }

    /**
     * The contents of a null value (`value_type::null`). This structure
     * contains no actual data, since there is only a single `NULL` value.
     */
    public static class NullContents extends KaitaiStruct {
        public static NullContents fromFile(String fileName) throws IOException {
            return new NullContents(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.semicolon = this._io.ensureFixedContents(new byte[] { 59 });
        }
        private byte[] semicolon;
        private PhpSerializedValue _root;
        private PhpSerializedValue _parent;
        public byte[] semicolon() { return semicolon; }
        public PhpSerializedValue _root() { return _root; }
        public PhpSerializedValue _parent() { return _parent; }
    }

    /**
     * The contents of a PHP 3 object value. Unlike its counterpart in PHP 4
     * and above, it does not contain a class name.
     */
    public static class Php3ObjectContents extends KaitaiStruct {
        public static Php3ObjectContents fromFile(String fileName) throws IOException {
            return new Php3ObjectContents(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.colon = this._io.ensureFixedContents(new byte[] { 58 });
            this.properties = new CountPrefixedMapping(this._io, this, _root);
        }
        private byte[] colon;
        private CountPrefixedMapping properties;
        private PhpSerializedValue _root;
        private PhpSerializedValue _parent;
        public byte[] colon() { return colon; }

        /**
         * The object's properties. Keys must be of type `string`,
         * values may have any type.
         */
        public CountPrefixedMapping properties() { return properties; }
        public PhpSerializedValue _root() { return _root; }
        public PhpSerializedValue _parent() { return _parent; }
    }

    /**
     * The contents of a boolean value (`value_type::bool`).
     */
    public static class BoolContents extends KaitaiStruct {
        public static BoolContents fromFile(String fileName) throws IOException {
            return new BoolContents(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.colon = this._io.ensureFixedContents(new byte[] { 58 });
            this.valueDec = PhpSerializedValue.BoolValue.byId(this._io.readU1());
            this.semicolon = this._io.ensureFixedContents(new byte[] { 59 });
        }
        private Boolean value;

        /**
         * The value of the `bool`, parsed as a boolean.
         */
        public Boolean value() {
            if (this.value != null)
                return this.value;
            boolean _tmp = (boolean) (valueDec() == PhpSerializedValue.BoolValue.TRUE);
            this.value = _tmp;
            return this.value;
        }
        private byte[] colon;
        private BoolValue valueDec;
        private byte[] semicolon;
        private PhpSerializedValue _root;
        private PhpSerializedValue _parent;
        public byte[] colon() { return colon; }

        /**
         * The value of the `bool`: `0` for `false` or `1` for `true`.
         */
        public BoolValue valueDec() { return valueDec; }
        public byte[] semicolon() { return semicolon; }
        public PhpSerializedValue _root() { return _root; }
        public PhpSerializedValue _parent() { return _parent; }
    }

    /**
     * The contents of a string value.
     * 
     * Note: PHP strings can contain arbitrary byte sequences.
     * They are not necessarily valid text in any specific encoding.
     */
    public static class StringContents extends KaitaiStruct {
        public static StringContents fromFile(String fileName) throws IOException {
            return new StringContents(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.colon = this._io.ensureFixedContents(new byte[] { 58 });
            this.string = new LengthPrefixedQuotedString(this._io, this, _root);
            this.semicolon = this._io.ensureFixedContents(new byte[] { 59 });
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
        private byte[] colon;
        private LengthPrefixedQuotedString string;
        private byte[] semicolon;
        private PhpSerializedValue _root;
        private PhpSerializedValue _parent;
        public byte[] colon() { return colon; }
        public LengthPrefixedQuotedString string() { return string; }
        public byte[] semicolon() { return semicolon; }
        public PhpSerializedValue _root() { return _root; }
        public PhpSerializedValue _parent() { return _parent; }
    }

    /**
     * The contents of an integer-like value:
     * either an actual integer (`value_type::int`) or a reference
     * (`value_type::variable_reference`, `value_type::object_reference`).
     */
    public static class IntContents extends KaitaiStruct {
        public static IntContents fromFile(String fileName) throws IOException {
            return new IntContents(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.colon = this._io.ensureFixedContents(new byte[] { 58 });
            this.valueDec = new String(this._io.readBytesTerm(59, false, true, true), Charset.forName("ASCII"));
        }
        private Integer value;

        /**
         * The value of the `int`, parsed as an integer.
         */
        public Integer value() {
            if (this.value != null)
                return this.value;
            int _tmp = (int) (Long.parseLong(valueDec(), 10));
            this.value = _tmp;
            return this.value;
        }
        private byte[] colon;
        private String valueDec;
        private PhpSerializedValue _root;
        private PhpSerializedValue _parent;
        public byte[] colon() { return colon; }

        /**
         * The value of the `int`, in ASCII decimal.
         */
        public String valueDec() { return valueDec; }
        public PhpSerializedValue _root() { return _root; }
        public PhpSerializedValue _parent() { return _parent; }
    }

    /**
     * A mapping entry consisting of a key and a value.
     */
    public static class MappingEntry extends KaitaiStruct {
        public static MappingEntry fromFile(String fileName) throws IOException {
            return new MappingEntry(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.key = new PhpSerializedValue(this._io);
            this.value = new PhpSerializedValue(this._io);
        }
        private PhpSerializedValue key;
        private PhpSerializedValue value;
        private PhpSerializedValue _root;
        private PhpSerializedValue.CountPrefixedMapping _parent;

        /**
         * The key of the entry.
         */
        public PhpSerializedValue key() { return key; }

        /**
         * The value of the entry.
         */
        public PhpSerializedValue value() { return value; }
        public PhpSerializedValue _root() { return _root; }
        public PhpSerializedValue.CountPrefixedMapping _parent() { return _parent; }
    }
    private ValueType type;
    private KaitaiStruct contents;
    private PhpSerializedValue _root;
    private KaitaiStruct _parent;

    /**
     * A single-character code indicating the type of the serialized value.
     */
    public ValueType type() { return type; }

    /**
     * The contents of the serialized value, which vary depending on the type.
     */
    public KaitaiStruct contents() { return contents; }
    public PhpSerializedValue _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

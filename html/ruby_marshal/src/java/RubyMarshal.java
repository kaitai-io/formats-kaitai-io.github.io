// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.Charset;


/**
 * Ruby's Marshal module allows serialization and deserialization of
 * many standard and arbitrary Ruby objects in a compact binary
 * format. It is relatively fast, available in stdlibs standard and
 * allows conservation of language-specific properties (such as symbols
 * or encoding-aware strings).
 * 
 * Feature-wise, it is comparable to other language-specific
 * implementations, such as:
 * 
 * * Java's
 *   [Serializable](https://docs.oracle.com/javase/8/docs/api/java/io/Serializable.html)
 * * .NET
 *   [BinaryFormatter](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.serialization.formatters.binary.binaryformatter)
 * * Python's
 *   [marshal](https://docs.python.org/3/library/marshal.html),
 *   [pickle](https://docs.python.org/3/library/pickle.html) and
 *   [shelve](https://docs.python.org/3/library/shelve.html)
 * 
 * From internal perspective, serialized stream consists of a simple
 * magic header and a record.
 * @see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Stream+Format">Source</a>
 */
public class RubyMarshal extends KaitaiStruct {
    public static RubyMarshal fromFile(String fileName) throws IOException {
        return new RubyMarshal(new ByteBufferKaitaiStream(fileName));
    }

    public enum Codes {
        RUBY_STRING(34),
        CONST_NIL(48),
        RUBY_SYMBOL(58),
        RUBY_SYMBOL_LINK(59),
        CONST_FALSE(70),
        INSTANCE_VAR(73),
        RUBY_STRUCT(83),
        CONST_TRUE(84),
        RUBY_ARRAY(91),
        PACKED_INT(105),
        BIGNUM(108),
        RUBY_HASH(123);

        private final long id;
        Codes(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Codes> byId = new HashMap<Long, Codes>(12);
        static {
            for (Codes e : Codes.values())
                byId.put(e.id(), e);
        }
        public static Codes byId(long id) { return byId.get(id); }
    }

    public RubyMarshal(KaitaiStream _io) {
        this(_io, null, null);
    }

    public RubyMarshal(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public RubyMarshal(KaitaiStream _io, KaitaiStruct _parent, RubyMarshal _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.version = this._io.ensureFixedContents(new byte[] { 4, 8 });
        this.records = new Record(this._io, this, _root);
    }
    public static class RubyArray extends KaitaiStruct {
        public static RubyArray fromFile(String fileName) throws IOException {
            return new RubyArray(new ByteBufferKaitaiStream(fileName));
        }

        public RubyArray(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RubyArray(KaitaiStream _io, RubyMarshal.Record _parent) {
            this(_io, _parent, null);
        }

        public RubyArray(KaitaiStream _io, RubyMarshal.Record _parent, RubyMarshal _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.numElements = new PackedInt(this._io, this, _root);
            elements = new ArrayList<Record>((int) (numElements().value()));
            for (int i = 0; i < numElements().value(); i++) {
                this.elements.add(new Record(this._io, this, _root));
            }
        }
        private PackedInt numElements;
        private ArrayList<Record> elements;
        private RubyMarshal _root;
        private RubyMarshal.Record _parent;
        public PackedInt numElements() { return numElements; }
        public ArrayList<Record> elements() { return elements; }
        public RubyMarshal _root() { return _root; }
        public RubyMarshal.Record _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Bignum">Source</a>
     */
    public static class Bignum extends KaitaiStruct {
        public static Bignum fromFile(String fileName) throws IOException {
            return new Bignum(new ByteBufferKaitaiStream(fileName));
        }

        public Bignum(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Bignum(KaitaiStream _io, RubyMarshal.Record _parent) {
            this(_io, _parent, null);
        }

        public Bignum(KaitaiStream _io, RubyMarshal.Record _parent, RubyMarshal _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.sign = this._io.readU1();
            this.lenDiv2 = new PackedInt(this._io, this, _root);
            this.body = this._io.readBytes((lenDiv2().value() * 2));
        }
        private int sign;
        private PackedInt lenDiv2;
        private byte[] body;
        private RubyMarshal _root;
        private RubyMarshal.Record _parent;

        /**
         * A single byte containing `+` for a positive value or `-` for a negative value.
         */
        public int sign() { return sign; }

        /**
         * Length of bignum body, divided by 2.
         */
        public PackedInt lenDiv2() { return lenDiv2; }

        /**
         * Bytes that represent the number, see ruby-lang.org docs for reconstruction algorithm.
         */
        public byte[] body() { return body; }
        public RubyMarshal _root() { return _root; }
        public RubyMarshal.Record _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Struct">Source</a>
     */
    public static class RubyStruct extends KaitaiStruct {
        public static RubyStruct fromFile(String fileName) throws IOException {
            return new RubyStruct(new ByteBufferKaitaiStream(fileName));
        }

        public RubyStruct(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RubyStruct(KaitaiStream _io, RubyMarshal.Record _parent) {
            this(_io, _parent, null);
        }

        public RubyStruct(KaitaiStream _io, RubyMarshal.Record _parent, RubyMarshal _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.name = new Record(this._io, this, _root);
            this.numMembers = new PackedInt(this._io, this, _root);
            members = new ArrayList<Pair>((int) (numMembers().value()));
            for (int i = 0; i < numMembers().value(); i++) {
                this.members.add(new Pair(this._io, this, _root));
            }
        }
        private Record name;
        private PackedInt numMembers;
        private ArrayList<Pair> members;
        private RubyMarshal _root;
        private RubyMarshal.Record _parent;

        /**
         * Symbol containing the name of the struct.
         */
        public Record name() { return name; }

        /**
         * Number of members in a struct
         */
        public PackedInt numMembers() { return numMembers; }
        public ArrayList<Pair> members() { return members; }
        public RubyMarshal _root() { return _root; }
        public RubyMarshal.Record _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Symbols+and+Byte+Sequence">Source</a>
     */
    public static class RubySymbol extends KaitaiStruct {
        public static RubySymbol fromFile(String fileName) throws IOException {
            return new RubySymbol(new ByteBufferKaitaiStream(fileName));
        }

        public RubySymbol(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RubySymbol(KaitaiStream _io, RubyMarshal.Record _parent) {
            this(_io, _parent, null);
        }

        public RubySymbol(KaitaiStream _io, RubyMarshal.Record _parent, RubyMarshal _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.len = new PackedInt(this._io, this, _root);
            this.name = new String(this._io.readBytes(len().value()), Charset.forName("UTF-8"));
        }
        private PackedInt len;
        private String name;
        private RubyMarshal _root;
        private RubyMarshal.Record _parent;
        public PackedInt len() { return len; }
        public String name() { return name; }
        public RubyMarshal _root() { return _root; }
        public RubyMarshal.Record _parent() { return _parent; }
    }

    /**
     * Ruby uses sophisticated system to pack integers: first `code`
     * byte either determines packing scheme or carries encoded
     * immediate value (thus allowing smaller values from -123 to 122
     * (inclusive) to take only one byte. There are 11 encoding schemes
     * in total:
     * 
     * * 0 is encoded specially (as 0)
     * * 1..122 are encoded as immediate value with a shift
     * * 123..255 are encoded with code of 0x01 and 1 extra byte
     * * 0x100..0xffff are encoded with code of 0x02 and 2 extra bytes
     * * 0x10000..0xffffff are encoded with code of 0x03 and 3 extra
     *   bytes
     * * 0x1000000..0xffffffff are encoded with code of 0x04 and 4
     *   extra bytes
     * * -123..-1 are encoded as immediate value with another shift
     * * -256..-124 are encoded with code of 0xff and 1 extra byte
     * * -0x10000..-257 are encoded with code of 0xfe and 2 extra bytes
     * * -0x1000000..0x10001 are encoded with code of 0xfd and 3 extra
     *    bytes
     * * -0x40000000..-0x1000001 are encoded with code of 0xfc and 4
     *    extra bytes
     * 
     * Values beyond that are serialized as bignum (even if they
     * technically might be not Bignum class in Ruby implementation,
     * i.e. if they fit into 64 bits on a 64-bit platform).
     * @see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Fixnum+and+long">Source</a>
     */
    public static class PackedInt extends KaitaiStruct {
        public static PackedInt fromFile(String fileName) throws IOException {
            return new PackedInt(new ByteBufferKaitaiStream(fileName));
        }

        public PackedInt(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PackedInt(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public PackedInt(KaitaiStream _io, KaitaiStruct _parent, RubyMarshal _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.code = this._io.readU1();
            switch (code()) {
            case 4: {
                this.encoded = this._io.readU4le();
                break;
            }
            case 1: {
                this.encoded = (long) (this._io.readU1());
                break;
            }
            case 252: {
                this.encoded = this._io.readU4le();
                break;
            }
            case 253: {
                this.encoded = (long) (this._io.readU2le());
                break;
            }
            case 3: {
                this.encoded = (long) (this._io.readU2le());
                break;
            }
            case 2: {
                this.encoded = (long) (this._io.readU2le());
                break;
            }
            case 255: {
                this.encoded = (long) (this._io.readU1());
                break;
            }
            case 254: {
                this.encoded = (long) (this._io.readU2le());
                break;
            }
            }
            switch (code()) {
            case 3: {
                this.encoded2 = this._io.readU1();
                break;
            }
            case 253: {
                this.encoded2 = this._io.readU1();
                break;
            }
            }
        }
        private Boolean isImmediate;
        public Boolean isImmediate() {
            if (this.isImmediate != null)
                return this.isImmediate;
            boolean _tmp = (boolean) ( ((code() > 4) && (code() < 252)) );
            this.isImmediate = _tmp;
            return this.isImmediate;
        }
        private Integer value;
        public Integer value() {
            if (this.value != null)
                return this.value;
            int _tmp = (int) ((isImmediate() ? (code() < 128 ? (code() - 5) : (4 - (~(code()) & 127))) : (code() == 0 ? 0 : (code() == 255 ? (encoded() - 256) : (code() == 254 ? (encoded() - 65536) : (code() == 253 ? (((encoded2() << 16) | encoded()) - 16777216) : (code() == 3 ? ((encoded2() << 16) | encoded()) : encoded())))))));
            this.value = _tmp;
            return this.value;
        }
        private int code;
        private Long encoded;
        private Integer encoded2;
        private RubyMarshal _root;
        private KaitaiStruct _parent;
        public int code() { return code; }
        public Long encoded() { return encoded; }

        /**
         * One extra byte for 3-byte integers (0x03 and 0xfd), as
         * there is no standard `u3` type in KS.
         */
        public Integer encoded2() { return encoded2; }
        public RubyMarshal _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class Pair extends KaitaiStruct {
        public static Pair fromFile(String fileName) throws IOException {
            return new Pair(new ByteBufferKaitaiStream(fileName));
        }

        public Pair(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Pair(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Pair(KaitaiStream _io, KaitaiStruct _parent, RubyMarshal _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.key = new Record(this._io, this, _root);
            this.value = new Record(this._io, this, _root);
        }
        private Record key;
        private Record value;
        private RubyMarshal _root;
        private KaitaiStruct _parent;
        public Record key() { return key; }
        public Record value() { return value; }
        public RubyMarshal _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Instance+Variables">Source</a>
     */
    public static class InstanceVar extends KaitaiStruct {
        public static InstanceVar fromFile(String fileName) throws IOException {
            return new InstanceVar(new ByteBufferKaitaiStream(fileName));
        }

        public InstanceVar(KaitaiStream _io) {
            this(_io, null, null);
        }

        public InstanceVar(KaitaiStream _io, RubyMarshal.Record _parent) {
            this(_io, _parent, null);
        }

        public InstanceVar(KaitaiStream _io, RubyMarshal.Record _parent, RubyMarshal _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.obj = new Record(this._io, this, _root);
            this.numVars = new PackedInt(this._io, this, _root);
            vars = new ArrayList<Pair>((int) (numVars().value()));
            for (int i = 0; i < numVars().value(); i++) {
                this.vars.add(new Pair(this._io, this, _root));
            }
        }
        private Record obj;
        private PackedInt numVars;
        private ArrayList<Pair> vars;
        private RubyMarshal _root;
        private RubyMarshal.Record _parent;
        public Record obj() { return obj; }
        public PackedInt numVars() { return numVars; }
        public ArrayList<Pair> vars() { return vars; }
        public RubyMarshal _root() { return _root; }
        public RubyMarshal.Record _parent() { return _parent; }
    }

    /**
     * Each record starts with a single byte that determines its type
     * (`code`) and contents. If necessary, additional info as parsed
     * as `body`, to be determined by `code`.
     */
    public static class Record extends KaitaiStruct {
        public static Record fromFile(String fileName) throws IOException {
            return new Record(new ByteBufferKaitaiStream(fileName));
        }

        public Record(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Record(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Record(KaitaiStream _io, KaitaiStruct _parent, RubyMarshal _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.code = RubyMarshal.Codes.byId(this._io.readU1());
            switch (code()) {
            case BIGNUM: {
                this.body = new Bignum(this._io, this, _root);
                break;
            }
            case RUBY_HASH: {
                this.body = new RubyHash(this._io, this, _root);
                break;
            }
            case RUBY_ARRAY: {
                this.body = new RubyArray(this._io, this, _root);
                break;
            }
            case RUBY_SYMBOL: {
                this.body = new RubySymbol(this._io, this, _root);
                break;
            }
            case INSTANCE_VAR: {
                this.body = new InstanceVar(this._io, this, _root);
                break;
            }
            case RUBY_STRING: {
                this.body = new RubyString(this._io, this, _root);
                break;
            }
            case PACKED_INT: {
                this.body = new PackedInt(this._io, this, _root);
                break;
            }
            case RUBY_STRUCT: {
                this.body = new RubyStruct(this._io, this, _root);
                break;
            }
            case RUBY_SYMBOL_LINK: {
                this.body = new PackedInt(this._io, this, _root);
                break;
            }
            }
        }
        private Codes code;
        private KaitaiStruct body;
        private RubyMarshal _root;
        private KaitaiStruct _parent;
        public Codes code() { return code; }
        public KaitaiStruct body() { return body; }
        public RubyMarshal _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Hash+and+Hash+with+Default+Value">Source</a>
     */
    public static class RubyHash extends KaitaiStruct {
        public static RubyHash fromFile(String fileName) throws IOException {
            return new RubyHash(new ByteBufferKaitaiStream(fileName));
        }

        public RubyHash(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RubyHash(KaitaiStream _io, RubyMarshal.Record _parent) {
            this(_io, _parent, null);
        }

        public RubyHash(KaitaiStream _io, RubyMarshal.Record _parent, RubyMarshal _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.numPairs = new PackedInt(this._io, this, _root);
            pairs = new ArrayList<Pair>((int) (numPairs().value()));
            for (int i = 0; i < numPairs().value(); i++) {
                this.pairs.add(new Pair(this._io, this, _root));
            }
        }
        private PackedInt numPairs;
        private ArrayList<Pair> pairs;
        private RubyMarshal _root;
        private RubyMarshal.Record _parent;
        public PackedInt numPairs() { return numPairs; }
        public ArrayList<Pair> pairs() { return pairs; }
        public RubyMarshal _root() { return _root; }
        public RubyMarshal.Record _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-String">Source</a>
     */
    public static class RubyString extends KaitaiStruct {
        public static RubyString fromFile(String fileName) throws IOException {
            return new RubyString(new ByteBufferKaitaiStream(fileName));
        }

        public RubyString(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RubyString(KaitaiStream _io, RubyMarshal.Record _parent) {
            this(_io, _parent, null);
        }

        public RubyString(KaitaiStream _io, RubyMarshal.Record _parent, RubyMarshal _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.len = new PackedInt(this._io, this, _root);
            this.body = this._io.readBytes(len().value());
        }
        private PackedInt len;
        private byte[] body;
        private RubyMarshal _root;
        private RubyMarshal.Record _parent;
        public PackedInt len() { return len; }
        public byte[] body() { return body; }
        public RubyMarshal _root() { return _root; }
        public RubyMarshal.Record _parent() { return _parent; }
    }
    private byte[] version;
    private Record records;
    private RubyMarshal _root;
    private KaitaiStruct _parent;
    public byte[] version() { return version; }
    public Record records() { return records; }
    public RubyMarshal _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

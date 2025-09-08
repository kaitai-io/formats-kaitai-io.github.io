// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.StandardCharsets;
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
 *   [BinaryFormatter](https://learn.microsoft.com/en-us/dotnet/api/system.runtime.serialization.formatters.binary.binaryformatter?view=net-7.0)
 * * Python's
 *   [marshal](https://docs.python.org/3/library/marshal.html),
 *   [pickle](https://docs.python.org/3/library/pickle.html) and
 *   [shelve](https://docs.python.org/3/library/shelve.html)
 * 
 * From internal perspective, serialized stream consists of a simple
 * magic header and a record.
 * @see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Stream+Format">Source</a>
 */
public class RubyMarshal extends KaitaiStruct.ReadWrite {
    public static RubyMarshal fromFile(String fileName) throws IOException {
        return new RubyMarshal(new ByteBufferKaitaiStream(fileName));
    }

    public enum Codes {
        RUBY_STRING(34),
        CONST_NIL(48),
        RUBY_SYMBOL(58),
        RUBY_SYMBOL_LINK(59),
        RUBY_OBJECT_LINK(64),
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
        private static final Map<Long, Codes> byId = new HashMap<Long, Codes>(13);
        static {
            for (Codes e : Codes.values())
                byId.put(e.id(), e);
        }
        public static Codes byId(long id) { return byId.get(id); }
    }
    public RubyMarshal() {
        this(null, null, null);
    }

    public RubyMarshal(KaitaiStream _io) {
        this(_io, null, null);
    }

    public RubyMarshal(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public RubyMarshal(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, RubyMarshal _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.version = this._io.readBytes(2);
        if (!(Arrays.equals(this.version, new byte[] { 4, 8 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 4, 8 }, this.version, this._io, "/seq/0");
        }
        this.records = new Record(this._io, this, _root);
        this.records._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.records._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.version);
        this.records._write_Seq(this._io);
    }

    public void _check() {
        if (this.version.length != 2)
            throw new ConsistencyError("version", 2, this.version.length);
        if (!(Arrays.equals(this.version, new byte[] { 4, 8 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 4, 8 }, this.version, null, "/seq/0");
        }
        if (!Objects.equals(this.records._root(), _root()))
            throw new ConsistencyError("records", _root(), this.records._root());
        if (!Objects.equals(this.records._parent(), this))
            throw new ConsistencyError("records", this, this.records._parent());
        _dirty = false;
    }

    /**
     * @see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Bignum">Source</a>
     */
    public static class Bignum extends KaitaiStruct.ReadWrite {
        public static Bignum fromFile(String fileName) throws IOException {
            return new Bignum(new ByteBufferKaitaiStream(fileName));
        }
        public Bignum() {
            this(null, null, null);
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
        }
        public void _read() {
            this.sign = this._io.readU1();
            this.lenDiv2 = new PackedInt(this._io, this, _root);
            this.lenDiv2._read();
            this.body = this._io.readBytes(lenDiv2().value() * 2);
            _dirty = false;
        }

        public void _fetchInstances() {
            this.lenDiv2._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.sign);
            this.lenDiv2._write_Seq(this._io);
            this._io.writeBytes(this.body);
        }

        public void _check() {
            if (!Objects.equals(this.lenDiv2._root(), _root()))
                throw new ConsistencyError("len_div_2", _root(), this.lenDiv2._root());
            if (!Objects.equals(this.lenDiv2._parent(), this))
                throw new ConsistencyError("len_div_2", this, this.lenDiv2._parent());
            if (this.body.length != lenDiv2().value() * 2)
                throw new ConsistencyError("body", lenDiv2().value() * 2, this.body.length);
            _dirty = false;
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
        public void setSign(int _v) { _dirty = true; sign = _v; }

        /**
         * Length of bignum body, divided by 2.
         */
        public PackedInt lenDiv2() { return lenDiv2; }
        public void setLenDiv2(PackedInt _v) { _dirty = true; lenDiv2 = _v; }

        /**
         * Bytes that represent the number, see ruby-lang.org docs for reconstruction algorithm.
         */
        public byte[] body() { return body; }
        public void setBody(byte[] _v) { _dirty = true; body = _v; }
        public RubyMarshal _root() { return _root; }
        public void set_root(RubyMarshal _v) { _dirty = true; _root = _v; }
        public RubyMarshal.Record _parent() { return _parent; }
        public void set_parent(RubyMarshal.Record _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Instance+Variables">Source</a>
     */
    public static class InstanceVar extends KaitaiStruct.ReadWrite {
        public static InstanceVar fromFile(String fileName) throws IOException {
            return new InstanceVar(new ByteBufferKaitaiStream(fileName));
        }
        public InstanceVar() {
            this(null, null, null);
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
        }
        public void _read() {
            this.obj = new Record(this._io, this, _root);
            this.obj._read();
            this.numVars = new PackedInt(this._io, this, _root);
            this.numVars._read();
            this.vars = new ArrayList<Pair>();
            for (int i = 0; i < numVars().value(); i++) {
                Pair _t_vars = new Pair(this._io, this, _root);
                try {
                    _t_vars._read();
                } finally {
                    this.vars.add(_t_vars);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.obj._fetchInstances();
            this.numVars._fetchInstances();
            for (int i = 0; i < this.vars.size(); i++) {
                this.vars.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.obj._write_Seq(this._io);
            this.numVars._write_Seq(this._io);
            for (int i = 0; i < this.vars.size(); i++) {
                this.vars.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (!Objects.equals(this.obj._root(), _root()))
                throw new ConsistencyError("obj", _root(), this.obj._root());
            if (!Objects.equals(this.obj._parent(), this))
                throw new ConsistencyError("obj", this, this.obj._parent());
            if (!Objects.equals(this.numVars._root(), _root()))
                throw new ConsistencyError("num_vars", _root(), this.numVars._root());
            if (!Objects.equals(this.numVars._parent(), this))
                throw new ConsistencyError("num_vars", this, this.numVars._parent());
            if (this.vars.size() != numVars().value())
                throw new ConsistencyError("vars", numVars().value(), this.vars.size());
            for (int i = 0; i < this.vars.size(); i++) {
                if (!Objects.equals(this.vars.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("vars", _root(), this.vars.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.vars.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("vars", this, this.vars.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private Record obj;
        private PackedInt numVars;
        private List<Pair> vars;
        private RubyMarshal _root;
        private RubyMarshal.Record _parent;
        public Record obj() { return obj; }
        public void setObj(Record _v) { _dirty = true; obj = _v; }
        public PackedInt numVars() { return numVars; }
        public void setNumVars(PackedInt _v) { _dirty = true; numVars = _v; }
        public List<Pair> vars() { return vars; }
        public void setVars(List<Pair> _v) { _dirty = true; vars = _v; }
        public RubyMarshal _root() { return _root; }
        public void set_root(RubyMarshal _v) { _dirty = true; _root = _v; }
        public RubyMarshal.Record _parent() { return _parent; }
        public void set_parent(RubyMarshal.Record _v) { _dirty = true; _parent = _v; }
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
    public static class PackedInt extends KaitaiStruct.ReadWrite {
        public static PackedInt fromFile(String fileName) throws IOException {
            return new PackedInt(new ByteBufferKaitaiStream(fileName));
        }
        public PackedInt() {
            this(null, null, null);
        }

        public PackedInt(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PackedInt(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public PackedInt(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, RubyMarshal _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.code = this._io.readU1();
            switch (code()) {
            case 1: {
                this.encoded = ((Number) (this._io.readU1())).longValue();
                break;
            }
            case 2: {
                this.encoded = ((Number) (this._io.readU2le())).longValue();
                break;
            }
            case 252: {
                this.encoded = this._io.readU4le();
                break;
            }
            case 253: {
                this.encoded = ((Number) (this._io.readU2le())).longValue();
                break;
            }
            case 254: {
                this.encoded = ((Number) (this._io.readU2le())).longValue();
                break;
            }
            case 255: {
                this.encoded = ((Number) (this._io.readU1())).longValue();
                break;
            }
            case 3: {
                this.encoded = ((Number) (this._io.readU2le())).longValue();
                break;
            }
            case 4: {
                this.encoded = this._io.readU4le();
                break;
            }
            }
            switch (code()) {
            case 253: {
                this.encoded2 = this._io.readU1();
                break;
            }
            case 3: {
                this.encoded2 = this._io.readU1();
                break;
            }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            switch (code()) {
            case 1: {
                break;
            }
            case 2: {
                break;
            }
            case 252: {
                break;
            }
            case 253: {
                break;
            }
            case 254: {
                break;
            }
            case 255: {
                break;
            }
            case 3: {
                break;
            }
            case 4: {
                break;
            }
            }
            switch (code()) {
            case 253: {
                break;
            }
            case 3: {
                break;
            }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.code);
            switch (code()) {
            case 1: {
                this._io.writeU1(((Number) (this.encoded)).intValue());
                break;
            }
            case 2: {
                this._io.writeU2le(((Number) (this.encoded)).intValue());
                break;
            }
            case 252: {
                this._io.writeU4le(this.encoded);
                break;
            }
            case 253: {
                this._io.writeU2le(((Number) (this.encoded)).intValue());
                break;
            }
            case 254: {
                this._io.writeU2le(((Number) (this.encoded)).intValue());
                break;
            }
            case 255: {
                this._io.writeU1(((Number) (this.encoded)).intValue());
                break;
            }
            case 3: {
                this._io.writeU2le(((Number) (this.encoded)).intValue());
                break;
            }
            case 4: {
                this._io.writeU4le(this.encoded);
                break;
            }
            }
            switch (code()) {
            case 253: {
                this._io.writeU1(this.encoded2);
                break;
            }
            case 3: {
                this._io.writeU1(this.encoded2);
                break;
            }
            }
        }

        public void _check() {
            switch (code()) {
            case 1: {
                break;
            }
            case 2: {
                break;
            }
            case 252: {
                break;
            }
            case 253: {
                break;
            }
            case 254: {
                break;
            }
            case 255: {
                break;
            }
            case 3: {
                break;
            }
            case 4: {
                break;
            }
            }
            switch (code()) {
            case 253: {
                break;
            }
            case 3: {
                break;
            }
            }
            _dirty = false;
        }
        private Boolean isImmediate;
        public Boolean isImmediate() {
            if (this.isImmediate != null)
                return this.isImmediate;
            this.isImmediate =  ((code() > 4) && (code() < 252)) ;
            return this.isImmediate;
        }
        public void _invalidateIsImmediate() { this.isImmediate = null; }
        private Integer value;
        public Integer value() {
            if (this.value != null)
                return this.value;
            this.value = ((Number) ((isImmediate() ? (code() < 128 ? code() - 5 : 4 - (~(code()) & 127)) : (code() == 0 ? 0 : (code() == 255 ? encoded() - 256 : (code() == 254 ? encoded() - 65536 : (code() == 253 ? (encoded2() << 16 | encoded()) - 16777216 : (code() == 3 ? encoded2() << 16 | encoded() : encoded())))))))).intValue();
            return this.value;
        }
        public void _invalidateValue() { this.value = null; }
        private int code;
        private Long encoded;
        private Integer encoded2;
        private RubyMarshal _root;
        private KaitaiStruct.ReadWrite _parent;
        public int code() { return code; }
        public void setCode(int _v) { _dirty = true; code = _v; }
        public Long encoded() { return encoded; }
        public void setEncoded(Long _v) { _dirty = true; encoded = _v; }

        /**
         * One extra byte for 3-byte integers (0x03 and 0xfd), as
         * there is no standard `u3` type in KS.
         */
        public Integer encoded2() { return encoded2; }
        public void setEncoded2(Integer _v) { _dirty = true; encoded2 = _v; }
        public RubyMarshal _root() { return _root; }
        public void set_root(RubyMarshal _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class Pair extends KaitaiStruct.ReadWrite {
        public static Pair fromFile(String fileName) throws IOException {
            return new Pair(new ByteBufferKaitaiStream(fileName));
        }
        public Pair() {
            this(null, null, null);
        }

        public Pair(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Pair(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Pair(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, RubyMarshal _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.key = new Record(this._io, this, _root);
            this.key._read();
            this.value = new Record(this._io, this, _root);
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
        private Record key;
        private Record value;
        private RubyMarshal _root;
        private KaitaiStruct.ReadWrite _parent;
        public Record key() { return key; }
        public void setKey(Record _v) { _dirty = true; key = _v; }
        public Record value() { return value; }
        public void setValue(Record _v) { _dirty = true; value = _v; }
        public RubyMarshal _root() { return _root; }
        public void set_root(RubyMarshal _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Each record starts with a single byte that determines its type
     * (`code`) and contents. If necessary, additional info as parsed
     * as `body`, to be determined by `code`.
     */
    public static class Record extends KaitaiStruct.ReadWrite {
        public static Record fromFile(String fileName) throws IOException {
            return new Record(new ByteBufferKaitaiStream(fileName));
        }
        public Record() {
            this(null, null, null);
        }

        public Record(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Record(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Record(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, RubyMarshal _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.code = RubyMarshal.Codes.byId(this._io.readU1());
            {
                Codes on = code();
                if (on != null) {
                    switch (code()) {
                    case BIGNUM: {
                        this.body = new Bignum(this._io, this, _root);
                        ((Bignum) (this.body))._read();
                        break;
                    }
                    case INSTANCE_VAR: {
                        this.body = new InstanceVar(this._io, this, _root);
                        ((InstanceVar) (this.body))._read();
                        break;
                    }
                    case PACKED_INT: {
                        this.body = new PackedInt(this._io, this, _root);
                        ((PackedInt) (this.body))._read();
                        break;
                    }
                    case RUBY_ARRAY: {
                        this.body = new RubyArray(this._io, this, _root);
                        ((RubyArray) (this.body))._read();
                        break;
                    }
                    case RUBY_HASH: {
                        this.body = new RubyHash(this._io, this, _root);
                        ((RubyHash) (this.body))._read();
                        break;
                    }
                    case RUBY_OBJECT_LINK: {
                        this.body = new PackedInt(this._io, this, _root);
                        ((PackedInt) (this.body))._read();
                        break;
                    }
                    case RUBY_STRING: {
                        this.body = new RubyString(this._io, this, _root);
                        ((RubyString) (this.body))._read();
                        break;
                    }
                    case RUBY_STRUCT: {
                        this.body = new RubyStruct(this._io, this, _root);
                        ((RubyStruct) (this.body))._read();
                        break;
                    }
                    case RUBY_SYMBOL: {
                        this.body = new RubySymbol(this._io, this, _root);
                        ((RubySymbol) (this.body))._read();
                        break;
                    }
                    case RUBY_SYMBOL_LINK: {
                        this.body = new PackedInt(this._io, this, _root);
                        ((PackedInt) (this.body))._read();
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                Codes on = code();
                if (on != null) {
                    switch (code()) {
                    case BIGNUM: {
                        ((Bignum) (this.body))._fetchInstances();
                        break;
                    }
                    case INSTANCE_VAR: {
                        ((InstanceVar) (this.body))._fetchInstances();
                        break;
                    }
                    case PACKED_INT: {
                        ((PackedInt) (this.body))._fetchInstances();
                        break;
                    }
                    case RUBY_ARRAY: {
                        ((RubyArray) (this.body))._fetchInstances();
                        break;
                    }
                    case RUBY_HASH: {
                        ((RubyHash) (this.body))._fetchInstances();
                        break;
                    }
                    case RUBY_OBJECT_LINK: {
                        ((PackedInt) (this.body))._fetchInstances();
                        break;
                    }
                    case RUBY_STRING: {
                        ((RubyString) (this.body))._fetchInstances();
                        break;
                    }
                    case RUBY_STRUCT: {
                        ((RubyStruct) (this.body))._fetchInstances();
                        break;
                    }
                    case RUBY_SYMBOL: {
                        ((RubySymbol) (this.body))._fetchInstances();
                        break;
                    }
                    case RUBY_SYMBOL_LINK: {
                        ((PackedInt) (this.body))._fetchInstances();
                        break;
                    }
                    }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(((Number) (this.code.id())).intValue());
            {
                Codes on = code();
                if (on != null) {
                    switch (code()) {
                    case BIGNUM: {
                        ((Bignum) (this.body))._write_Seq(this._io);
                        break;
                    }
                    case INSTANCE_VAR: {
                        ((InstanceVar) (this.body))._write_Seq(this._io);
                        break;
                    }
                    case PACKED_INT: {
                        ((PackedInt) (this.body))._write_Seq(this._io);
                        break;
                    }
                    case RUBY_ARRAY: {
                        ((RubyArray) (this.body))._write_Seq(this._io);
                        break;
                    }
                    case RUBY_HASH: {
                        ((RubyHash) (this.body))._write_Seq(this._io);
                        break;
                    }
                    case RUBY_OBJECT_LINK: {
                        ((PackedInt) (this.body))._write_Seq(this._io);
                        break;
                    }
                    case RUBY_STRING: {
                        ((RubyString) (this.body))._write_Seq(this._io);
                        break;
                    }
                    case RUBY_STRUCT: {
                        ((RubyStruct) (this.body))._write_Seq(this._io);
                        break;
                    }
                    case RUBY_SYMBOL: {
                        ((RubySymbol) (this.body))._write_Seq(this._io);
                        break;
                    }
                    case RUBY_SYMBOL_LINK: {
                        ((PackedInt) (this.body))._write_Seq(this._io);
                        break;
                    }
                    }
                }
            }
        }

        public void _check() {
            {
                Codes on = code();
                if (on != null) {
                    switch (code()) {
                    case BIGNUM: {
                        if (!Objects.equals(((RubyMarshal.Bignum) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((RubyMarshal.Bignum) (this.body))._root());
                        if (!Objects.equals(((RubyMarshal.Bignum) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((RubyMarshal.Bignum) (this.body))._parent());
                        break;
                    }
                    case INSTANCE_VAR: {
                        if (!Objects.equals(((RubyMarshal.InstanceVar) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((RubyMarshal.InstanceVar) (this.body))._root());
                        if (!Objects.equals(((RubyMarshal.InstanceVar) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((RubyMarshal.InstanceVar) (this.body))._parent());
                        break;
                    }
                    case PACKED_INT: {
                        if (!Objects.equals(((RubyMarshal.PackedInt) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((RubyMarshal.PackedInt) (this.body))._root());
                        if (!Objects.equals(((RubyMarshal.PackedInt) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((RubyMarshal.PackedInt) (this.body))._parent());
                        break;
                    }
                    case RUBY_ARRAY: {
                        if (!Objects.equals(((RubyMarshal.RubyArray) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((RubyMarshal.RubyArray) (this.body))._root());
                        if (!Objects.equals(((RubyMarshal.RubyArray) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((RubyMarshal.RubyArray) (this.body))._parent());
                        break;
                    }
                    case RUBY_HASH: {
                        if (!Objects.equals(((RubyMarshal.RubyHash) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((RubyMarshal.RubyHash) (this.body))._root());
                        if (!Objects.equals(((RubyMarshal.RubyHash) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((RubyMarshal.RubyHash) (this.body))._parent());
                        break;
                    }
                    case RUBY_OBJECT_LINK: {
                        if (!Objects.equals(((RubyMarshal.PackedInt) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((RubyMarshal.PackedInt) (this.body))._root());
                        if (!Objects.equals(((RubyMarshal.PackedInt) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((RubyMarshal.PackedInt) (this.body))._parent());
                        break;
                    }
                    case RUBY_STRING: {
                        if (!Objects.equals(((RubyMarshal.RubyString) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((RubyMarshal.RubyString) (this.body))._root());
                        if (!Objects.equals(((RubyMarshal.RubyString) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((RubyMarshal.RubyString) (this.body))._parent());
                        break;
                    }
                    case RUBY_STRUCT: {
                        if (!Objects.equals(((RubyMarshal.RubyStruct) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((RubyMarshal.RubyStruct) (this.body))._root());
                        if (!Objects.equals(((RubyMarshal.RubyStruct) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((RubyMarshal.RubyStruct) (this.body))._parent());
                        break;
                    }
                    case RUBY_SYMBOL: {
                        if (!Objects.equals(((RubyMarshal.RubySymbol) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((RubyMarshal.RubySymbol) (this.body))._root());
                        if (!Objects.equals(((RubyMarshal.RubySymbol) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((RubyMarshal.RubySymbol) (this.body))._parent());
                        break;
                    }
                    case RUBY_SYMBOL_LINK: {
                        if (!Objects.equals(((RubyMarshal.PackedInt) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((RubyMarshal.PackedInt) (this.body))._root());
                        if (!Objects.equals(((RubyMarshal.PackedInt) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((RubyMarshal.PackedInt) (this.body))._parent());
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }
        private Codes code;
        private KaitaiStruct.ReadWrite body;
        private RubyMarshal _root;
        private KaitaiStruct.ReadWrite _parent;
        public Codes code() { return code; }
        public void setCode(Codes _v) { _dirty = true; code = _v; }
        public KaitaiStruct.ReadWrite body() { return body; }
        public void setBody(KaitaiStruct.ReadWrite _v) { _dirty = true; body = _v; }
        public RubyMarshal _root() { return _root; }
        public void set_root(RubyMarshal _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class RubyArray extends KaitaiStruct.ReadWrite {
        public static RubyArray fromFile(String fileName) throws IOException {
            return new RubyArray(new ByteBufferKaitaiStream(fileName));
        }
        public RubyArray() {
            this(null, null, null);
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
        }
        public void _read() {
            this.numElements = new PackedInt(this._io, this, _root);
            this.numElements._read();
            this.elements = new ArrayList<Record>();
            for (int i = 0; i < numElements().value(); i++) {
                Record _t_elements = new Record(this._io, this, _root);
                try {
                    _t_elements._read();
                } finally {
                    this.elements.add(_t_elements);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.numElements._fetchInstances();
            for (int i = 0; i < this.elements.size(); i++) {
                this.elements.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.numElements._write_Seq(this._io);
            for (int i = 0; i < this.elements.size(); i++) {
                this.elements.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (!Objects.equals(this.numElements._root(), _root()))
                throw new ConsistencyError("num_elements", _root(), this.numElements._root());
            if (!Objects.equals(this.numElements._parent(), this))
                throw new ConsistencyError("num_elements", this, this.numElements._parent());
            if (this.elements.size() != numElements().value())
                throw new ConsistencyError("elements", numElements().value(), this.elements.size());
            for (int i = 0; i < this.elements.size(); i++) {
                if (!Objects.equals(this.elements.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("elements", _root(), this.elements.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.elements.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("elements", this, this.elements.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private PackedInt numElements;
        private List<Record> elements;
        private RubyMarshal _root;
        private RubyMarshal.Record _parent;
        public PackedInt numElements() { return numElements; }
        public void setNumElements(PackedInt _v) { _dirty = true; numElements = _v; }
        public List<Record> elements() { return elements; }
        public void setElements(List<Record> _v) { _dirty = true; elements = _v; }
        public RubyMarshal _root() { return _root; }
        public void set_root(RubyMarshal _v) { _dirty = true; _root = _v; }
        public RubyMarshal.Record _parent() { return _parent; }
        public void set_parent(RubyMarshal.Record _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Hash+and+Hash+with+Default+Value">Source</a>
     */
    public static class RubyHash extends KaitaiStruct.ReadWrite {
        public static RubyHash fromFile(String fileName) throws IOException {
            return new RubyHash(new ByteBufferKaitaiStream(fileName));
        }
        public RubyHash() {
            this(null, null, null);
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
        }
        public void _read() {
            this.numPairs = new PackedInt(this._io, this, _root);
            this.numPairs._read();
            this.pairs = new ArrayList<Pair>();
            for (int i = 0; i < numPairs().value(); i++) {
                Pair _t_pairs = new Pair(this._io, this, _root);
                try {
                    _t_pairs._read();
                } finally {
                    this.pairs.add(_t_pairs);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.numPairs._fetchInstances();
            for (int i = 0; i < this.pairs.size(); i++) {
                this.pairs.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.numPairs._write_Seq(this._io);
            for (int i = 0; i < this.pairs.size(); i++) {
                this.pairs.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (!Objects.equals(this.numPairs._root(), _root()))
                throw new ConsistencyError("num_pairs", _root(), this.numPairs._root());
            if (!Objects.equals(this.numPairs._parent(), this))
                throw new ConsistencyError("num_pairs", this, this.numPairs._parent());
            if (this.pairs.size() != numPairs().value())
                throw new ConsistencyError("pairs", numPairs().value(), this.pairs.size());
            for (int i = 0; i < this.pairs.size(); i++) {
                if (!Objects.equals(this.pairs.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("pairs", _root(), this.pairs.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.pairs.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("pairs", this, this.pairs.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private PackedInt numPairs;
        private List<Pair> pairs;
        private RubyMarshal _root;
        private RubyMarshal.Record _parent;
        public PackedInt numPairs() { return numPairs; }
        public void setNumPairs(PackedInt _v) { _dirty = true; numPairs = _v; }
        public List<Pair> pairs() { return pairs; }
        public void setPairs(List<Pair> _v) { _dirty = true; pairs = _v; }
        public RubyMarshal _root() { return _root; }
        public void set_root(RubyMarshal _v) { _dirty = true; _root = _v; }
        public RubyMarshal.Record _parent() { return _parent; }
        public void set_parent(RubyMarshal.Record _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-String">Source</a>
     */
    public static class RubyString extends KaitaiStruct.ReadWrite {
        public static RubyString fromFile(String fileName) throws IOException {
            return new RubyString(new ByteBufferKaitaiStream(fileName));
        }
        public RubyString() {
            this(null, null, null);
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
        }
        public void _read() {
            this.len = new PackedInt(this._io, this, _root);
            this.len._read();
            this.body = this._io.readBytes(len().value());
            _dirty = false;
        }

        public void _fetchInstances() {
            this.len._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.len._write_Seq(this._io);
            this._io.writeBytes(this.body);
        }

        public void _check() {
            if (!Objects.equals(this.len._root(), _root()))
                throw new ConsistencyError("len", _root(), this.len._root());
            if (!Objects.equals(this.len._parent(), this))
                throw new ConsistencyError("len", this, this.len._parent());
            if (this.body.length != len().value())
                throw new ConsistencyError("body", len().value(), this.body.length);
            _dirty = false;
        }
        private PackedInt len;
        private byte[] body;
        private RubyMarshal _root;
        private RubyMarshal.Record _parent;
        public PackedInt len() { return len; }
        public void setLen(PackedInt _v) { _dirty = true; len = _v; }
        public byte[] body() { return body; }
        public void setBody(byte[] _v) { _dirty = true; body = _v; }
        public RubyMarshal _root() { return _root; }
        public void set_root(RubyMarshal _v) { _dirty = true; _root = _v; }
        public RubyMarshal.Record _parent() { return _parent; }
        public void set_parent(RubyMarshal.Record _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Struct">Source</a>
     */
    public static class RubyStruct extends KaitaiStruct.ReadWrite {
        public static RubyStruct fromFile(String fileName) throws IOException {
            return new RubyStruct(new ByteBufferKaitaiStream(fileName));
        }
        public RubyStruct() {
            this(null, null, null);
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
        }
        public void _read() {
            this.name = new Record(this._io, this, _root);
            this.name._read();
            this.numMembers = new PackedInt(this._io, this, _root);
            this.numMembers._read();
            this.members = new ArrayList<Pair>();
            for (int i = 0; i < numMembers().value(); i++) {
                Pair _t_members = new Pair(this._io, this, _root);
                try {
                    _t_members._read();
                } finally {
                    this.members.add(_t_members);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.name._fetchInstances();
            this.numMembers._fetchInstances();
            for (int i = 0; i < this.members.size(); i++) {
                this.members.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.name._write_Seq(this._io);
            this.numMembers._write_Seq(this._io);
            for (int i = 0; i < this.members.size(); i++) {
                this.members.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (!Objects.equals(this.name._root(), _root()))
                throw new ConsistencyError("name", _root(), this.name._root());
            if (!Objects.equals(this.name._parent(), this))
                throw new ConsistencyError("name", this, this.name._parent());
            if (!Objects.equals(this.numMembers._root(), _root()))
                throw new ConsistencyError("num_members", _root(), this.numMembers._root());
            if (!Objects.equals(this.numMembers._parent(), this))
                throw new ConsistencyError("num_members", this, this.numMembers._parent());
            if (this.members.size() != numMembers().value())
                throw new ConsistencyError("members", numMembers().value(), this.members.size());
            for (int i = 0; i < this.members.size(); i++) {
                if (!Objects.equals(this.members.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("members", _root(), this.members.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.members.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("members", this, this.members.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private Record name;
        private PackedInt numMembers;
        private List<Pair> members;
        private RubyMarshal _root;
        private RubyMarshal.Record _parent;

        /**
         * Symbol containing the name of the struct.
         */
        public Record name() { return name; }
        public void setName(Record _v) { _dirty = true; name = _v; }

        /**
         * Number of members in a struct
         */
        public PackedInt numMembers() { return numMembers; }
        public void setNumMembers(PackedInt _v) { _dirty = true; numMembers = _v; }
        public List<Pair> members() { return members; }
        public void setMembers(List<Pair> _v) { _dirty = true; members = _v; }
        public RubyMarshal _root() { return _root; }
        public void set_root(RubyMarshal _v) { _dirty = true; _root = _v; }
        public RubyMarshal.Record _parent() { return _parent; }
        public void set_parent(RubyMarshal.Record _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Symbols+and+Byte+Sequence">Source</a>
     */
    public static class RubySymbol extends KaitaiStruct.ReadWrite {
        public static RubySymbol fromFile(String fileName) throws IOException {
            return new RubySymbol(new ByteBufferKaitaiStream(fileName));
        }
        public RubySymbol() {
            this(null, null, null);
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
        }
        public void _read() {
            this.len = new PackedInt(this._io, this, _root);
            this.len._read();
            this.name = new String(this._io.readBytes(len().value()), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
            this.len._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.len._write_Seq(this._io);
            this._io.writeBytes((this.name).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if (!Objects.equals(this.len._root(), _root()))
                throw new ConsistencyError("len", _root(), this.len._root());
            if (!Objects.equals(this.len._parent(), this))
                throw new ConsistencyError("len", this, this.len._parent());
            if ((this.name).getBytes(Charset.forName("UTF-8")).length != len().value())
                throw new ConsistencyError("name", len().value(), (this.name).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private PackedInt len;
        private String name;
        private RubyMarshal _root;
        private RubyMarshal.Record _parent;
        public PackedInt len() { return len; }
        public void setLen(PackedInt _v) { _dirty = true; len = _v; }
        public String name() { return name; }
        public void setName(String _v) { _dirty = true; name = _v; }
        public RubyMarshal _root() { return _root; }
        public void set_root(RubyMarshal _v) { _dirty = true; _root = _v; }
        public RubyMarshal.Record _parent() { return _parent; }
        public void set_parent(RubyMarshal.Record _v) { _dirty = true; _parent = _v; }
    }
    private byte[] version;
    private Record records;
    private RubyMarshal _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] version() { return version; }
    public void setVersion(byte[] _v) { _dirty = true; version = _v; }
    public Record records() { return records; }
    public void setRecords(Record _v) { _dirty = true; records = _v; }
    public RubyMarshal _root() { return _root; }
    public void set_root(RubyMarshal _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

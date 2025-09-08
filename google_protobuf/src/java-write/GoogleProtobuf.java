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


/**
 * Google Protocol Buffers (AKA protobuf) is a popular data
 * serialization scheme used for communication protocols, data storage,
 * etc. There are implementations are available for almost every
 * popular language. The focus points of this scheme are brevity (data
 * is encoded in a very size-efficient manner) and extensibility (one
 * can add keys to the structure, while keeping it readable in previous
 * version of software).
 * 
 * Protobuf uses semi-self-describing encoding scheme for its
 * messages. It means that it is possible to parse overall structure of
 * the message (skipping over fields one can't understand), but to
 * fully understand the message, one needs a protocol definition file
 * (`.proto`). To be specific:
 * 
 * * "Keys" in key-value pairs provided in the message are identified
 *   only with an integer "field tag". `.proto` file provides info on
 *   which symbolic field names these field tags map to.
 * * "Keys" also provide something called "wire type". It's not a data
 *   type in its common sense (i.e. you can't, for example, distinguish
 *   `sint32` vs `uint32` vs some enum, or `string` from `bytes`), but
 *   it's enough information to determine how many bytes to
 *   parse. Interpretation of the value should be done according to the
 *   type specified in `.proto` file.
 * * There's no direct information on which fields are optional /
 *   required, which fields may be repeated or constitute a map, what
 *   restrictions are placed on fields usage in a single message, what
 *   are the fields' default values, etc, etc.
 * @see <a href="https://protobuf.dev/programming-guides/encoding/">Source</a>
 */
public class GoogleProtobuf extends KaitaiStruct.ReadWrite {
    public static GoogleProtobuf fromFile(String fileName) throws IOException {
        return new GoogleProtobuf(new ByteBufferKaitaiStream(fileName));
    }
    public GoogleProtobuf() {
        this(null, null, null);
    }

    public GoogleProtobuf(KaitaiStream _io) {
        this(_io, null, null);
    }

    public GoogleProtobuf(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public GoogleProtobuf(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, GoogleProtobuf _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.pairs = new ArrayList<Pair>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                Pair _t_pairs = new Pair(this._io, this, _root);
                try {
                    _t_pairs._read();
                } finally {
                    this.pairs.add(_t_pairs);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.pairs.size(); i++) {
            this.pairs.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        for (int i = 0; i < this.pairs.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("pairs", 0, this._io.size() - this._io.pos());
            this.pairs.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("pairs", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        for (int i = 0; i < this.pairs.size(); i++) {
            if (!Objects.equals(this.pairs.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("pairs", _root(), this.pairs.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.pairs.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("pairs", this, this.pairs.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class DelimitedBytes extends KaitaiStruct.ReadWrite {
        public static DelimitedBytes fromFile(String fileName) throws IOException {
            return new DelimitedBytes(new ByteBufferKaitaiStream(fileName));
        }
        public DelimitedBytes() {
            this(null, null, null);
        }

        public DelimitedBytes(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DelimitedBytes(KaitaiStream _io, GoogleProtobuf.Pair _parent) {
            this(_io, _parent, null);
        }

        public DelimitedBytes(KaitaiStream _io, GoogleProtobuf.Pair _parent, GoogleProtobuf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.len = new VlqBase128Le(this._io);
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
            if (this.body.length != len().value())
                throw new ConsistencyError("body", len().value(), this.body.length);
            _dirty = false;
        }
        private VlqBase128Le len;
        private byte[] body;
        private GoogleProtobuf _root;
        private GoogleProtobuf.Pair _parent;
        public VlqBase128Le len() { return len; }
        public void setLen(VlqBase128Le _v) { _dirty = true; len = _v; }
        public byte[] body() { return body; }
        public void setBody(byte[] _v) { _dirty = true; body = _v; }
        public GoogleProtobuf _root() { return _root; }
        public void set_root(GoogleProtobuf _v) { _dirty = true; _root = _v; }
        public GoogleProtobuf.Pair _parent() { return _parent; }
        public void set_parent(GoogleProtobuf.Pair _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Key-value pair
     */
    public static class Pair extends KaitaiStruct.ReadWrite {
        public static Pair fromFile(String fileName) throws IOException {
            return new Pair(new ByteBufferKaitaiStream(fileName));
        }

        public enum WireTypes {
            VARINT(0),
            BIT_64(1),
            LEN_DELIMITED(2),
            GROUP_START(3),
            GROUP_END(4),
            BIT_32(5);

            private final long id;
            WireTypes(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, WireTypes> byId = new HashMap<Long, WireTypes>(6);
            static {
                for (WireTypes e : WireTypes.values())
                    byId.put(e.id(), e);
            }
            public static WireTypes byId(long id) { return byId.get(id); }
        }
        public Pair() {
            this(null, null, null);
        }

        public Pair(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Pair(KaitaiStream _io, GoogleProtobuf _parent) {
            this(_io, _parent, null);
        }

        public Pair(KaitaiStream _io, GoogleProtobuf _parent, GoogleProtobuf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.key = new VlqBase128Le(this._io);
            this.key._read();
            {
                WireTypes on = wireType();
                if (on != null) {
                    switch (wireType()) {
                    case BIT_32: {
                        this.value = ((Object) (this._io.readU4le()));
                        break;
                    }
                    case BIT_64: {
                        this.value = ((Object) (this._io.readU8le()));
                        break;
                    }
                    case LEN_DELIMITED: {
                        this.value = new DelimitedBytes(this._io, this, _root);
                        ((DelimitedBytes) (this.value))._read();
                        break;
                    }
                    case VARINT: {
                        this.value = new VlqBase128Le(this._io);
                        ((VlqBase128Le) (this.value))._read();
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.key._fetchInstances();
            {
                WireTypes on = wireType();
                if (on != null) {
                    switch (wireType()) {
                    case BIT_32: {
                        break;
                    }
                    case BIT_64: {
                        break;
                    }
                    case LEN_DELIMITED: {
                        ((DelimitedBytes) (this.value))._fetchInstances();
                        break;
                    }
                    case VARINT: {
                        ((VlqBase128Le) (this.value))._fetchInstances();
                        break;
                    }
                    }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.key._write_Seq(this._io);
            {
                WireTypes on = wireType();
                if (on != null) {
                    switch (wireType()) {
                    case BIT_32: {
                        this._io.writeU4le(((Number) (this.value)).longValue());
                        break;
                    }
                    case BIT_64: {
                        this._io.writeU8le(((Number) (this.value)).longValue());
                        break;
                    }
                    case LEN_DELIMITED: {
                        ((DelimitedBytes) (this.value))._write_Seq(this._io);
                        break;
                    }
                    case VARINT: {
                        ((VlqBase128Le) (this.value))._write_Seq(this._io);
                        break;
                    }
                    }
                }
            }
        }

        public void _check() {
            {
                WireTypes on = wireType();
                if (on != null) {
                    switch (wireType()) {
                    case BIT_32: {
                        break;
                    }
                    case BIT_64: {
                        break;
                    }
                    case LEN_DELIMITED: {
                        if (!Objects.equals(((GoogleProtobuf.DelimitedBytes) (this.value))._root(), _root()))
                            throw new ConsistencyError("value", _root(), ((GoogleProtobuf.DelimitedBytes) (this.value))._root());
                        if (!Objects.equals(((GoogleProtobuf.DelimitedBytes) (this.value))._parent(), this))
                            throw new ConsistencyError("value", this, ((GoogleProtobuf.DelimitedBytes) (this.value))._parent());
                        break;
                    }
                    case VARINT: {
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }
        private Integer fieldTag;

        /**
         * Identifies a field of protocol. One can look up symbolic
         * field name in a `.proto` file by this field tag.
         */
        public Integer fieldTag() {
            if (this.fieldTag != null)
                return this.fieldTag;
            this.fieldTag = ((Number) (key().value() >> 3)).intValue();
            return this.fieldTag;
        }
        public void _invalidateFieldTag() { this.fieldTag = null; }
        private WireTypes wireType;

        /**
         * "Wire type" is a part of the "key" that carries enough
         * information to parse value from the wire, i.e. read correct
         * amount of bytes, but there's not enough informaton to
         * interprete in unambiguously. For example, one can't clearly
         * distinguish 64-bit fixed-sized integers from 64-bit floats,
         * signed zigzag-encoded varints from regular unsigned varints,
         * arbitrary bytes from UTF-8 encoded strings, etc.
         */
        public WireTypes wireType() {
            if (this.wireType != null)
                return this.wireType;
            this.wireType = WireTypes.byId(key().value() & 7);
            return this.wireType;
        }
        public void _invalidateWireType() { this.wireType = null; }
        private VlqBase128Le key;
        private Object value;
        private GoogleProtobuf _root;
        private GoogleProtobuf _parent;

        /**
         * Key is a bit-mapped variable-length integer: lower 3 bits
         * are used for "wire type", and everything higher designates
         * an integer "field tag".
         */
        public VlqBase128Le key() { return key; }
        public void setKey(VlqBase128Le _v) { _dirty = true; key = _v; }

        /**
         * Value that corresponds to field identified by
         * `field_tag`. Type is determined approximately: there is
         * enough information to parse it unambiguously from a stream,
         * but further infromation from `.proto` file is required to
         * interprete it properly.
         */
        public Object value() { return value; }
        public void setValue(Object _v) { _dirty = true; value = _v; }
        public GoogleProtobuf _root() { return _root; }
        public void set_root(GoogleProtobuf _v) { _dirty = true; _root = _v; }
        public GoogleProtobuf _parent() { return _parent; }
        public void set_parent(GoogleProtobuf _v) { _dirty = true; _parent = _v; }
    }
    private List<Pair> pairs;
    private GoogleProtobuf _root;
    private KaitaiStruct.ReadWrite _parent;

    /**
     * Key-value pairs which constitute a message
     */
    public List<Pair> pairs() { return pairs; }
    public void setPairs(List<Pair> _v) { _dirty = true; pairs = _v; }
    public GoogleProtobuf _root() { return _root; }
    public void set_root(GoogleProtobuf _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

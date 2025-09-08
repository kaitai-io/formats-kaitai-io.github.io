// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.List;


/**
 * Python Pickle format serializes Python objects to a byte stream, as a sequence
 * of operations to run on the Pickle Virtual Machine.
 * 
 * The format is mostly implementation defined, there is no formal specification.
 * Pickle data types are closely coupled to the Python object model.
 * Python singletons, and most builtin types (e.g. `None`, `int`,`dict`, `list`)
 * are serialised using dedicated Pickle opcodes.
 * Other builtin types, and all classes  (e.g. `set`, `datetime.datetime`) are
 * serialised by encoding the name of a constructor callable.
 * They are deserialised by importing that constructor, and calling it.
 * So, unpickling an arbitrary pickle, using the Python's stdlib pickle module
 * can cause arbitrary code execution.
 * 
 * Pickle format has evolved with Python, later protocols add opcodes & types.
 * Later Python releases can pickle to or unpickle from any earlier protocol.
 * 
 * * Protocol 0: ASCII clean, no explicit version, fields are '\n' terminated.
 * * Protocol 1: Binary, no explicit version, first length prefixed types.
 * * Protocol 2 ([PEP 307](https://peps.python.org/pep-0307/)): Python 2.3+.
 *   Explicit versioning, more length prefixed types.
 * * Protocol 3: Python 3.0+. Dedicated opcodes for `bytes` objects.
 * * Protocol 4 ([PEP 3154](https://peps.python.org/pep-3154/)): Python 3.4+.
 *   Opcodes for 64 bit strings, framing, `set`.
 * * Protocol 5 ([PEP 574](https://peps.python.org/pep-0574/)): Python 3.8+:
 * Opcodes for `bytearray` and out of band data
 * @see <a href="https://github.com/python/cpython/blob/v3.8.1/Lib/pickletools.py">Source</a>
 */
public class PythonPickle extends KaitaiStruct.ReadWrite {
    public static PythonPickle fromFile(String fileName) throws IOException {
        return new PythonPickle(new ByteBufferKaitaiStream(fileName));
    }

    public enum Opcode {
        MARK(40),
        EMPTY_TUPLE(41),
        STOP(46),
        POP(48),
        POP_MARK(49),
        DUP(50),
        BINBYTES(66),
        SHORT_BINBYTES(67),
        FLOAT(70),
        BINFLOAT(71),
        INT(73),
        BININT(74),
        BININT1(75),
        LONG(76),
        BININT2(77),
        NONE(78),
        PERSID(80),
        BINPERSID(81),
        REDUCE(82),
        STRING(83),
        BINSTRING(84),
        SHORT_BINSTRING(85),
        UNICODE(86),
        BINUNICODE(88),
        EMPTY_LIST(93),
        APPEND(97),
        BUILD(98),
        GLOBAL_OPCODE(99),
        DICT(100),
        APPENDS(101),
        GET(103),
        BINGET(104),
        INST(105),
        LONG_BINGET(106),
        LIST(108),
        OBJ(111),
        PUT(112),
        BINPUT(113),
        LONG_BINPUT(114),
        SETITEM(115),
        TUPLE(116),
        SETITEMS(117),
        EMPTY_DICT(125),
        PROTO(128),
        NEWOBJ(129),
        EXT1(130),
        EXT2(131),
        EXT4(132),
        TUPLE1(133),
        TUPLE2(134),
        TUPLE3(135),
        NEWTRUE(136),
        NEWFALSE(137),
        LONG1(138),
        LONG4(139),
        SHORT_BINUNICODE(140),
        BINUNICODE8(141),
        BINBYTES8(142),
        EMPTY_SET(143),
        ADDITEMS(144),
        FROZENSET(145),
        NEWOBJ_EX(146),
        STACK_GLOBAL(147),
        MEMOIZE(148),
        FRAME(149),
        BYTEARRAY8(150),
        NEXT_BUFFER(151),
        READONLY_BUFFER(152);

        private final long id;
        Opcode(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Opcode> byId = new HashMap<Long, Opcode>(68);
        static {
            for (Opcode e : Opcode.values())
                byId.put(e.id(), e);
        }
        public static Opcode byId(long id) { return byId.get(id); }
    }
    public PythonPickle() {
        this(null, null, null);
    }

    public PythonPickle(KaitaiStream _io) {
        this(_io, null, null);
    }

    public PythonPickle(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public PythonPickle(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, PythonPickle _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.ops = new ArrayList<Op>();
        {
            Op _it;
            int i = 0;
            do {
                Op _t_ops = new Op(this._io, this, _root);
                try {
                    _t_ops._read();
                } finally {
                    _it = _t_ops;
                    this.ops.add(_it);
                }
                i++;
            } while (!(_it.code() == Opcode.STOP));
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.ops.size(); i++) {
            this.ops.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        for (int i = 0; i < this.ops.size(); i++) {
            this.ops.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (this.ops.size() == 0)
            throw new ConsistencyError("ops", 0, this.ops.size());
        for (int i = 0; i < this.ops.size(); i++) {
            if (!Objects.equals(this.ops.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("ops", _root(), this.ops.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.ops.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("ops", this, this.ops.get(((Number) (i)).intValue())._parent());
            {
                Op _it = this.ops.get(((Number) (i)).intValue());
                if ((_it.code() == Opcode.STOP) != (i == this.ops.size() - 1))
                    throw new ConsistencyError("ops", i == this.ops.size() - 1, _it.code() == Opcode.STOP);
            }
        }
        _dirty = false;
    }

    /**
     * Length prefixed string, between 0 and 2**64-1 bytes long.
     * 
     * The contents are deserilised into a `bytearray` object.
     */
    public static class Bytearray8 extends KaitaiStruct.ReadWrite {
        public static Bytearray8 fromFile(String fileName) throws IOException {
            return new Bytearray8(new ByteBufferKaitaiStream(fileName));
        }
        public Bytearray8() {
            this(null, null, null);
        }

        public Bytearray8(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Bytearray8(KaitaiStream _io, PythonPickle.Op _parent) {
            this(_io, _parent, null);
        }

        public Bytearray8(KaitaiStream _io, PythonPickle.Op _parent, PythonPickle _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.len = this._io.readU8le();
            this.val = this._io.readBytes(len());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU8le(this.len);
            this._io.writeBytes(this.val);
        }

        public void _check() {
            if (this.val.length != len())
                throw new ConsistencyError("val", len(), this.val.length);
            _dirty = false;
        }
        private long len;
        private byte[] val;
        private PythonPickle _root;
        private PythonPickle.Op _parent;
        public long len() { return len; }
        public void setLen(long _v) { _dirty = true; len = _v; }
        public byte[] val() { return val; }
        public void setVal(byte[] _v) { _dirty = true; val = _v; }
        public PythonPickle _root() { return _root; }
        public void set_root(PythonPickle _v) { _dirty = true; _root = _v; }
        public PythonPickle.Op _parent() { return _parent; }
        public void set_parent(PythonPickle.Op _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Length prefixed byte string, between 0 and 255 bytes long.
     */
    public static class Bytes1 extends KaitaiStruct.ReadWrite {
        public static Bytes1 fromFile(String fileName) throws IOException {
            return new Bytes1(new ByteBufferKaitaiStream(fileName));
        }
        public Bytes1() {
            this(null, null, null);
        }

        public Bytes1(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Bytes1(KaitaiStream _io, PythonPickle.Op _parent) {
            this(_io, _parent, null);
        }

        public Bytes1(KaitaiStream _io, PythonPickle.Op _parent, PythonPickle _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.len = this._io.readU1();
            this.val = this._io.readBytes(len());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.len);
            this._io.writeBytes(this.val);
        }

        public void _check() {
            if (this.val.length != len())
                throw new ConsistencyError("val", len(), this.val.length);
            _dirty = false;
        }
        private int len;
        private byte[] val;
        private PythonPickle _root;
        private PythonPickle.Op _parent;
        public int len() { return len; }
        public void setLen(int _v) { _dirty = true; len = _v; }
        public byte[] val() { return val; }
        public void setVal(byte[] _v) { _dirty = true; val = _v; }
        public PythonPickle _root() { return _root; }
        public void set_root(PythonPickle _v) { _dirty = true; _root = _v; }
        public PythonPickle.Op _parent() { return _parent; }
        public void set_parent(PythonPickle.Op _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Length prefixed string, between 0 and 2**32-1 bytes long
     */
    public static class Bytes4 extends KaitaiStruct.ReadWrite {
        public static Bytes4 fromFile(String fileName) throws IOException {
            return new Bytes4(new ByteBufferKaitaiStream(fileName));
        }
        public Bytes4() {
            this(null, null, null);
        }

        public Bytes4(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Bytes4(KaitaiStream _io, PythonPickle.Op _parent) {
            this(_io, _parent, null);
        }

        public Bytes4(KaitaiStream _io, PythonPickle.Op _parent, PythonPickle _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.len = this._io.readU4le();
            this.val = this._io.readBytes(len());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.len);
            this._io.writeBytes(this.val);
        }

        public void _check() {
            if (this.val.length != len())
                throw new ConsistencyError("val", len(), this.val.length);
            _dirty = false;
        }
        private long len;
        private byte[] val;
        private PythonPickle _root;
        private PythonPickle.Op _parent;
        public long len() { return len; }
        public void setLen(long _v) { _dirty = true; len = _v; }
        public byte[] val() { return val; }
        public void setVal(byte[] _v) { _dirty = true; val = _v; }
        public PythonPickle _root() { return _root; }
        public void set_root(PythonPickle _v) { _dirty = true; _root = _v; }
        public PythonPickle.Op _parent() { return _parent; }
        public void set_parent(PythonPickle.Op _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Length prefixed string, between 0 and 2**64-1 bytes long.
     * 
     * Only a 64-bit build of Python would produce a pickle containing strings
     * large enough to need this type. Such a pickle could not be unpickled on
     * a 32-bit build of Python, because the string would be larger than
     * `sys.maxsize`.
     */
    public static class Bytes8 extends KaitaiStruct.ReadWrite {
        public static Bytes8 fromFile(String fileName) throws IOException {
            return new Bytes8(new ByteBufferKaitaiStream(fileName));
        }
        public Bytes8() {
            this(null, null, null);
        }

        public Bytes8(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Bytes8(KaitaiStream _io, PythonPickle.Op _parent) {
            this(_io, _parent, null);
        }

        public Bytes8(KaitaiStream _io, PythonPickle.Op _parent, PythonPickle _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.len = this._io.readU8le();
            this.val = this._io.readBytes(len());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU8le(this.len);
            this._io.writeBytes(this.val);
        }

        public void _check() {
            if (this.val.length != len())
                throw new ConsistencyError("val", len(), this.val.length);
            _dirty = false;
        }
        private long len;
        private byte[] val;
        private PythonPickle _root;
        private PythonPickle.Op _parent;
        public long len() { return len; }
        public void setLen(long _v) { _dirty = true; len = _v; }
        public byte[] val() { return val; }
        public void setVal(byte[] _v) { _dirty = true; val = _v; }
        public PythonPickle _root() { return _root; }
        public void set_root(PythonPickle _v) { _dirty = true; _root = _v; }
        public PythonPickle.Op _parent() { return _parent; }
        public void set_parent(PythonPickle.Op _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Integer, encoded with the ASCII chracters [0-9-], followed by 'L'.
     */
    public static class DecimalnlLong extends KaitaiStruct.ReadWrite {
        public static DecimalnlLong fromFile(String fileName) throws IOException {
            return new DecimalnlLong(new ByteBufferKaitaiStream(fileName));
        }
        public DecimalnlLong() {
            this(null, null, null);
        }

        public DecimalnlLong(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DecimalnlLong(KaitaiStream _io, PythonPickle.Op _parent) {
            this(_io, _parent, null);
        }

        public DecimalnlLong(KaitaiStream _io, PythonPickle.Op _parent, PythonPickle _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.val = new String(this._io.readBytesTerm((byte) 10, false, true, true), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.val).getBytes(Charset.forName("ASCII")));
            this._io.writeU1(10);
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.val).getBytes(Charset.forName("ASCII")), ((byte) 10)) != -1)
                throw new ConsistencyError("val", -1, KaitaiStream.byteArrayIndexOf((this.val).getBytes(Charset.forName("ASCII")), ((byte) 10)));
            _dirty = false;
        }
        private String val;
        private PythonPickle _root;
        private PythonPickle.Op _parent;
        public String val() { return val; }
        public void setVal(String _v) { _dirty = true; val = _v; }
        public PythonPickle _root() { return _root; }
        public void set_root(PythonPickle _v) { _dirty = true; _root = _v; }
        public PythonPickle.Op _parent() { return _parent; }
        public void set_parent(PythonPickle.Op _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Integer or boolean, encoded with the ASCII characters [0-9-].
     * 
     * The values '00' and '01' encode the Python values `False` and `True`.
     * Normally a value would not contain leading '0' characters.
     */
    public static class DecimalnlShort extends KaitaiStruct.ReadWrite {
        public static DecimalnlShort fromFile(String fileName) throws IOException {
            return new DecimalnlShort(new ByteBufferKaitaiStream(fileName));
        }
        public DecimalnlShort() {
            this(null, null, null);
        }

        public DecimalnlShort(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DecimalnlShort(KaitaiStream _io, PythonPickle.Op _parent) {
            this(_io, _parent, null);
        }

        public DecimalnlShort(KaitaiStream _io, PythonPickle.Op _parent, PythonPickle _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.val = new String(this._io.readBytesTerm((byte) 10, false, true, true), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.val).getBytes(Charset.forName("ASCII")));
            this._io.writeU1(10);
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.val).getBytes(Charset.forName("ASCII")), ((byte) 10)) != -1)
                throw new ConsistencyError("val", -1, KaitaiStream.byteArrayIndexOf((this.val).getBytes(Charset.forName("ASCII")), ((byte) 10)));
            _dirty = false;
        }
        private String val;
        private PythonPickle _root;
        private PythonPickle.Op _parent;
        public String val() { return val; }
        public void setVal(String _v) { _dirty = true; val = _v; }
        public PythonPickle _root() { return _root; }
        public void set_root(PythonPickle _v) { _dirty = true; _root = _v; }
        public PythonPickle.Op _parent() { return _parent; }
        public void set_parent(PythonPickle.Op _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Double float, encoded with the ASCII characters [0-9.e+-], '-inf', 'inf',
     * or 'nan'.
     */
    public static class Floatnl extends KaitaiStruct.ReadWrite {
        public static Floatnl fromFile(String fileName) throws IOException {
            return new Floatnl(new ByteBufferKaitaiStream(fileName));
        }
        public Floatnl() {
            this(null, null, null);
        }

        public Floatnl(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Floatnl(KaitaiStream _io, PythonPickle.Op _parent) {
            this(_io, _parent, null);
        }

        public Floatnl(KaitaiStream _io, PythonPickle.Op _parent, PythonPickle _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.val = new String(this._io.readBytesTerm((byte) 10, false, true, true), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.val).getBytes(Charset.forName("ASCII")));
            this._io.writeU1(10);
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.val).getBytes(Charset.forName("ASCII")), ((byte) 10)) != -1)
                throw new ConsistencyError("val", -1, KaitaiStream.byteArrayIndexOf((this.val).getBytes(Charset.forName("ASCII")), ((byte) 10)));
            _dirty = false;
        }
        private String val;
        private PythonPickle _root;
        private PythonPickle.Op _parent;
        public String val() { return val; }
        public void setVal(String _v) { _dirty = true; val = _v; }
        public PythonPickle _root() { return _root; }
        public void set_root(PythonPickle _v) { _dirty = true; _root = _v; }
        public PythonPickle.Op _parent() { return _parent; }
        public void set_parent(PythonPickle.Op _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Large signed integer, in the range -2**(8*255-1) to 2**(8*255-1)-1,
     * encoded as two's complement.
     */
    public static class Long1 extends KaitaiStruct.ReadWrite {
        public static Long1 fromFile(String fileName) throws IOException {
            return new Long1(new ByteBufferKaitaiStream(fileName));
        }
        public Long1() {
            this(null, null, null);
        }

        public Long1(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Long1(KaitaiStream _io, PythonPickle.Op _parent) {
            this(_io, _parent, null);
        }

        public Long1(KaitaiStream _io, PythonPickle.Op _parent, PythonPickle _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.len = this._io.readU1();
            this.val = this._io.readBytes(len());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.len);
            this._io.writeBytes(this.val);
        }

        public void _check() {
            if (this.val.length != len())
                throw new ConsistencyError("val", len(), this.val.length);
            _dirty = false;
        }
        private int len;
        private byte[] val;
        private PythonPickle _root;
        private PythonPickle.Op _parent;
        public int len() { return len; }
        public void setLen(int _v) { _dirty = true; len = _v; }
        public byte[] val() { return val; }
        public void setVal(byte[] _v) { _dirty = true; val = _v; }
        public PythonPickle _root() { return _root; }
        public void set_root(PythonPickle _v) { _dirty = true; _root = _v; }
        public PythonPickle.Op _parent() { return _parent; }
        public void set_parent(PythonPickle.Op _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Large signed integer, in the range -2**(8*2**32-1) to 2**(8*2**32-1)-1,
     * encoded as two's complement.
     */
    public static class Long4 extends KaitaiStruct.ReadWrite {
        public static Long4 fromFile(String fileName) throws IOException {
            return new Long4(new ByteBufferKaitaiStream(fileName));
        }
        public Long4() {
            this(null, null, null);
        }

        public Long4(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Long4(KaitaiStream _io, PythonPickle.Op _parent) {
            this(_io, _parent, null);
        }

        public Long4(KaitaiStream _io, PythonPickle.Op _parent, PythonPickle _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.len = this._io.readU4le();
            this.val = this._io.readBytes(len());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.len);
            this._io.writeBytes(this.val);
        }

        public void _check() {
            if (this.val.length != len())
                throw new ConsistencyError("val", len(), this.val.length);
            _dirty = false;
        }
        private long len;
        private byte[] val;
        private PythonPickle _root;
        private PythonPickle.Op _parent;
        public long len() { return len; }
        public void setLen(long _v) { _dirty = true; len = _v; }
        public byte[] val() { return val; }
        public void setVal(byte[] _v) { _dirty = true; val = _v; }
        public PythonPickle _root() { return _root; }
        public void set_root(PythonPickle _v) { _dirty = true; _root = _v; }
        public PythonPickle.Op _parent() { return _parent; }
        public void set_parent(PythonPickle.Op _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Some opcodes take no argument, this empty type is used for them.
     */
    public static class NoArg extends KaitaiStruct.ReadWrite {
        public static NoArg fromFile(String fileName) throws IOException {
            return new NoArg(new ByteBufferKaitaiStream(fileName));
        }
        public NoArg() {
            this(null, null, null);
        }

        public NoArg(KaitaiStream _io) {
            this(_io, null, null);
        }

        public NoArg(KaitaiStream _io, PythonPickle.Op _parent) {
            this(_io, _parent, null);
        }

        public NoArg(KaitaiStream _io, PythonPickle.Op _parent, PythonPickle _root) {
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
        private PythonPickle _root;
        private PythonPickle.Op _parent;
        public PythonPickle _root() { return _root; }
        public void set_root(PythonPickle _v) { _dirty = true; _root = _v; }
        public PythonPickle.Op _parent() { return _parent; }
        public void set_parent(PythonPickle.Op _v) { _dirty = true; _parent = _v; }
    }
    public static class Op extends KaitaiStruct.ReadWrite {
        public static Op fromFile(String fileName) throws IOException {
            return new Op(new ByteBufferKaitaiStream(fileName));
        }
        public Op() {
            this(null, null, null);
        }

        public Op(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Op(KaitaiStream _io, PythonPickle _parent) {
            this(_io, _parent, null);
        }

        public Op(KaitaiStream _io, PythonPickle _parent, PythonPickle _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.code = PythonPickle.Opcode.byId(this._io.readU1());
            {
                Opcode on = code();
                if (on != null) {
                    switch (code()) {
                    case ADDITEMS: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case APPEND: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case APPENDS: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case BINBYTES: {
                        this.arg = new Bytes4(this._io, this, _root);
                        ((Bytes4) (this.arg))._read();
                        break;
                    }
                    case BINBYTES8: {
                        this.arg = new Bytes8(this._io, this, _root);
                        ((Bytes8) (this.arg))._read();
                        break;
                    }
                    case BINFLOAT: {
                        this.arg = ((Object) (this._io.readF8be()));
                        break;
                    }
                    case BINGET: {
                        this.arg = ((Object) (this._io.readU1()));
                        break;
                    }
                    case BININT: {
                        this.arg = ((Object) (this._io.readS4le()));
                        break;
                    }
                    case BININT1: {
                        this.arg = ((Object) (this._io.readU1()));
                        break;
                    }
                    case BININT2: {
                        this.arg = ((Object) (this._io.readU2le()));
                        break;
                    }
                    case BINPERSID: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case BINPUT: {
                        this.arg = ((Object) (this._io.readU1()));
                        break;
                    }
                    case BINSTRING: {
                        this.arg = new String4(this._io, this, _root);
                        ((String4) (this.arg))._read();
                        break;
                    }
                    case BINUNICODE: {
                        this.arg = new Unicodestring4(this._io, this, _root);
                        ((Unicodestring4) (this.arg))._read();
                        break;
                    }
                    case BINUNICODE8: {
                        this.arg = new Unicodestring8(this._io, this, _root);
                        ((Unicodestring8) (this.arg))._read();
                        break;
                    }
                    case BUILD: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case BYTEARRAY8: {
                        this.arg = new Bytearray8(this._io, this, _root);
                        ((Bytearray8) (this.arg))._read();
                        break;
                    }
                    case DICT: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case DUP: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case EMPTY_DICT: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case EMPTY_LIST: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case EMPTY_SET: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case EMPTY_TUPLE: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case EXT1: {
                        this.arg = ((Object) (this._io.readU1()));
                        break;
                    }
                    case EXT2: {
                        this.arg = ((Object) (this._io.readU2le()));
                        break;
                    }
                    case EXT4: {
                        this.arg = ((Object) (this._io.readU4le()));
                        break;
                    }
                    case FLOAT: {
                        this.arg = new Floatnl(this._io, this, _root);
                        ((Floatnl) (this.arg))._read();
                        break;
                    }
                    case FRAME: {
                        this.arg = ((Object) (this._io.readU8le()));
                        break;
                    }
                    case FROZENSET: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case GET: {
                        this.arg = new DecimalnlShort(this._io, this, _root);
                        ((DecimalnlShort) (this.arg))._read();
                        break;
                    }
                    case GLOBAL_OPCODE: {
                        this.arg = new StringnlNoescapePair(this._io, this, _root);
                        ((StringnlNoescapePair) (this.arg))._read();
                        break;
                    }
                    case INST: {
                        this.arg = new StringnlNoescapePair(this._io, this, _root);
                        ((StringnlNoescapePair) (this.arg))._read();
                        break;
                    }
                    case INT: {
                        this.arg = new DecimalnlShort(this._io, this, _root);
                        ((DecimalnlShort) (this.arg))._read();
                        break;
                    }
                    case LIST: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case LONG: {
                        this.arg = new DecimalnlLong(this._io, this, _root);
                        ((DecimalnlLong) (this.arg))._read();
                        break;
                    }
                    case LONG1: {
                        this.arg = new Long1(this._io, this, _root);
                        ((Long1) (this.arg))._read();
                        break;
                    }
                    case LONG4: {
                        this.arg = new Long4(this._io, this, _root);
                        ((Long4) (this.arg))._read();
                        break;
                    }
                    case LONG_BINGET: {
                        this.arg = ((Object) (this._io.readU4le()));
                        break;
                    }
                    case LONG_BINPUT: {
                        this.arg = ((Object) (this._io.readU4le()));
                        break;
                    }
                    case MARK: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case MEMOIZE: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case NEWFALSE: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case NEWOBJ: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case NEWOBJ_EX: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case NEWTRUE: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case NEXT_BUFFER: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case NONE: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case OBJ: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case PERSID: {
                        this.arg = new StringnlNoescape(this._io, this, _root);
                        ((StringnlNoescape) (this.arg))._read();
                        break;
                    }
                    case POP: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case POP_MARK: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case PROTO: {
                        this.arg = ((Object) (this._io.readU1()));
                        break;
                    }
                    case PUT: {
                        this.arg = new DecimalnlShort(this._io, this, _root);
                        ((DecimalnlShort) (this.arg))._read();
                        break;
                    }
                    case READONLY_BUFFER: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case REDUCE: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case SETITEM: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case SETITEMS: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case SHORT_BINBYTES: {
                        this.arg = new Bytes1(this._io, this, _root);
                        ((Bytes1) (this.arg))._read();
                        break;
                    }
                    case SHORT_BINSTRING: {
                        this.arg = new String1(this._io, this, _root);
                        ((String1) (this.arg))._read();
                        break;
                    }
                    case SHORT_BINUNICODE: {
                        this.arg = new Unicodestring1(this._io, this, _root);
                        ((Unicodestring1) (this.arg))._read();
                        break;
                    }
                    case STACK_GLOBAL: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case STOP: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case STRING: {
                        this.arg = new Stringnl(this._io, this, _root);
                        ((Stringnl) (this.arg))._read();
                        break;
                    }
                    case TUPLE: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case TUPLE1: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case TUPLE2: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case TUPLE3: {
                        this.arg = new NoArg(this._io, this, _root);
                        ((NoArg) (this.arg))._read();
                        break;
                    }
                    case UNICODE: {
                        this.arg = new Unicodestringnl(this._io, this, _root);
                        ((Unicodestringnl) (this.arg))._read();
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                Opcode on = code();
                if (on != null) {
                    switch (code()) {
                    case ADDITEMS: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case APPEND: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case APPENDS: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case BINBYTES: {
                        ((Bytes4) (this.arg))._fetchInstances();
                        break;
                    }
                    case BINBYTES8: {
                        ((Bytes8) (this.arg))._fetchInstances();
                        break;
                    }
                    case BINFLOAT: {
                        break;
                    }
                    case BINGET: {
                        break;
                    }
                    case BININT: {
                        break;
                    }
                    case BININT1: {
                        break;
                    }
                    case BININT2: {
                        break;
                    }
                    case BINPERSID: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case BINPUT: {
                        break;
                    }
                    case BINSTRING: {
                        ((String4) (this.arg))._fetchInstances();
                        break;
                    }
                    case BINUNICODE: {
                        ((Unicodestring4) (this.arg))._fetchInstances();
                        break;
                    }
                    case BINUNICODE8: {
                        ((Unicodestring8) (this.arg))._fetchInstances();
                        break;
                    }
                    case BUILD: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case BYTEARRAY8: {
                        ((Bytearray8) (this.arg))._fetchInstances();
                        break;
                    }
                    case DICT: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case DUP: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case EMPTY_DICT: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case EMPTY_LIST: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case EMPTY_SET: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case EMPTY_TUPLE: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case EXT1: {
                        break;
                    }
                    case EXT2: {
                        break;
                    }
                    case EXT4: {
                        break;
                    }
                    case FLOAT: {
                        ((Floatnl) (this.arg))._fetchInstances();
                        break;
                    }
                    case FRAME: {
                        break;
                    }
                    case FROZENSET: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case GET: {
                        ((DecimalnlShort) (this.arg))._fetchInstances();
                        break;
                    }
                    case GLOBAL_OPCODE: {
                        ((StringnlNoescapePair) (this.arg))._fetchInstances();
                        break;
                    }
                    case INST: {
                        ((StringnlNoescapePair) (this.arg))._fetchInstances();
                        break;
                    }
                    case INT: {
                        ((DecimalnlShort) (this.arg))._fetchInstances();
                        break;
                    }
                    case LIST: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case LONG: {
                        ((DecimalnlLong) (this.arg))._fetchInstances();
                        break;
                    }
                    case LONG1: {
                        ((Long1) (this.arg))._fetchInstances();
                        break;
                    }
                    case LONG4: {
                        ((Long4) (this.arg))._fetchInstances();
                        break;
                    }
                    case LONG_BINGET: {
                        break;
                    }
                    case LONG_BINPUT: {
                        break;
                    }
                    case MARK: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case MEMOIZE: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case NEWFALSE: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case NEWOBJ: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case NEWOBJ_EX: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case NEWTRUE: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case NEXT_BUFFER: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case NONE: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case OBJ: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case PERSID: {
                        ((StringnlNoescape) (this.arg))._fetchInstances();
                        break;
                    }
                    case POP: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case POP_MARK: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case PROTO: {
                        break;
                    }
                    case PUT: {
                        ((DecimalnlShort) (this.arg))._fetchInstances();
                        break;
                    }
                    case READONLY_BUFFER: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case REDUCE: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case SETITEM: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case SETITEMS: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case SHORT_BINBYTES: {
                        ((Bytes1) (this.arg))._fetchInstances();
                        break;
                    }
                    case SHORT_BINSTRING: {
                        ((String1) (this.arg))._fetchInstances();
                        break;
                    }
                    case SHORT_BINUNICODE: {
                        ((Unicodestring1) (this.arg))._fetchInstances();
                        break;
                    }
                    case STACK_GLOBAL: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case STOP: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case STRING: {
                        ((Stringnl) (this.arg))._fetchInstances();
                        break;
                    }
                    case TUPLE: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case TUPLE1: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case TUPLE2: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case TUPLE3: {
                        ((NoArg) (this.arg))._fetchInstances();
                        break;
                    }
                    case UNICODE: {
                        ((Unicodestringnl) (this.arg))._fetchInstances();
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
                Opcode on = code();
                if (on != null) {
                    switch (code()) {
                    case ADDITEMS: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case APPEND: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case APPENDS: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case BINBYTES: {
                        ((Bytes4) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case BINBYTES8: {
                        ((Bytes8) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case BINFLOAT: {
                        this._io.writeF8be(((Number) (this.arg)).doubleValue());
                        break;
                    }
                    case BINGET: {
                        this._io.writeU1(((Number) (this.arg)).intValue());
                        break;
                    }
                    case BININT: {
                        this._io.writeS4le(((Number) (this.arg)).intValue());
                        break;
                    }
                    case BININT1: {
                        this._io.writeU1(((Number) (this.arg)).intValue());
                        break;
                    }
                    case BININT2: {
                        this._io.writeU2le(((Number) (this.arg)).intValue());
                        break;
                    }
                    case BINPERSID: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case BINPUT: {
                        this._io.writeU1(((Number) (this.arg)).intValue());
                        break;
                    }
                    case BINSTRING: {
                        ((String4) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case BINUNICODE: {
                        ((Unicodestring4) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case BINUNICODE8: {
                        ((Unicodestring8) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case BUILD: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case BYTEARRAY8: {
                        ((Bytearray8) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case DICT: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case DUP: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case EMPTY_DICT: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case EMPTY_LIST: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case EMPTY_SET: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case EMPTY_TUPLE: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case EXT1: {
                        this._io.writeU1(((Number) (this.arg)).intValue());
                        break;
                    }
                    case EXT2: {
                        this._io.writeU2le(((Number) (this.arg)).intValue());
                        break;
                    }
                    case EXT4: {
                        this._io.writeU4le(((Number) (this.arg)).longValue());
                        break;
                    }
                    case FLOAT: {
                        ((Floatnl) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case FRAME: {
                        this._io.writeU8le(((Number) (this.arg)).longValue());
                        break;
                    }
                    case FROZENSET: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case GET: {
                        ((DecimalnlShort) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case GLOBAL_OPCODE: {
                        ((StringnlNoescapePair) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case INST: {
                        ((StringnlNoescapePair) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case INT: {
                        ((DecimalnlShort) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case LIST: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case LONG: {
                        ((DecimalnlLong) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case LONG1: {
                        ((Long1) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case LONG4: {
                        ((Long4) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case LONG_BINGET: {
                        this._io.writeU4le(((Number) (this.arg)).longValue());
                        break;
                    }
                    case LONG_BINPUT: {
                        this._io.writeU4le(((Number) (this.arg)).longValue());
                        break;
                    }
                    case MARK: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case MEMOIZE: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case NEWFALSE: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case NEWOBJ: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case NEWOBJ_EX: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case NEWTRUE: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case NEXT_BUFFER: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case NONE: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case OBJ: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case PERSID: {
                        ((StringnlNoescape) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case POP: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case POP_MARK: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case PROTO: {
                        this._io.writeU1(((Number) (this.arg)).intValue());
                        break;
                    }
                    case PUT: {
                        ((DecimalnlShort) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case READONLY_BUFFER: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case REDUCE: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case SETITEM: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case SETITEMS: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case SHORT_BINBYTES: {
                        ((Bytes1) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case SHORT_BINSTRING: {
                        ((String1) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case SHORT_BINUNICODE: {
                        ((Unicodestring1) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case STACK_GLOBAL: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case STOP: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case STRING: {
                        ((Stringnl) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case TUPLE: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case TUPLE1: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case TUPLE2: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case TUPLE3: {
                        ((NoArg) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    case UNICODE: {
                        ((Unicodestringnl) (this.arg))._write_Seq(this._io);
                        break;
                    }
                    }
                }
            }
        }

        public void _check() {
            {
                Opcode on = code();
                if (on != null) {
                    switch (code()) {
                    case ADDITEMS: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case APPEND: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case APPENDS: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case BINBYTES: {
                        if (!Objects.equals(((PythonPickle.Bytes4) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.Bytes4) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.Bytes4) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.Bytes4) (this.arg))._parent());
                        break;
                    }
                    case BINBYTES8: {
                        if (!Objects.equals(((PythonPickle.Bytes8) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.Bytes8) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.Bytes8) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.Bytes8) (this.arg))._parent());
                        break;
                    }
                    case BINFLOAT: {
                        break;
                    }
                    case BINGET: {
                        break;
                    }
                    case BININT: {
                        break;
                    }
                    case BININT1: {
                        break;
                    }
                    case BININT2: {
                        break;
                    }
                    case BINPERSID: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case BINPUT: {
                        break;
                    }
                    case BINSTRING: {
                        if (!Objects.equals(((PythonPickle.String4) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.String4) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.String4) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.String4) (this.arg))._parent());
                        break;
                    }
                    case BINUNICODE: {
                        if (!Objects.equals(((PythonPickle.Unicodestring4) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.Unicodestring4) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.Unicodestring4) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.Unicodestring4) (this.arg))._parent());
                        break;
                    }
                    case BINUNICODE8: {
                        if (!Objects.equals(((PythonPickle.Unicodestring8) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.Unicodestring8) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.Unicodestring8) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.Unicodestring8) (this.arg))._parent());
                        break;
                    }
                    case BUILD: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case BYTEARRAY8: {
                        if (!Objects.equals(((PythonPickle.Bytearray8) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.Bytearray8) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.Bytearray8) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.Bytearray8) (this.arg))._parent());
                        break;
                    }
                    case DICT: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case DUP: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case EMPTY_DICT: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case EMPTY_LIST: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case EMPTY_SET: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case EMPTY_TUPLE: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case EXT1: {
                        break;
                    }
                    case EXT2: {
                        break;
                    }
                    case EXT4: {
                        break;
                    }
                    case FLOAT: {
                        if (!Objects.equals(((PythonPickle.Floatnl) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.Floatnl) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.Floatnl) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.Floatnl) (this.arg))._parent());
                        break;
                    }
                    case FRAME: {
                        break;
                    }
                    case FROZENSET: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case GET: {
                        if (!Objects.equals(((PythonPickle.DecimalnlShort) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.DecimalnlShort) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.DecimalnlShort) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.DecimalnlShort) (this.arg))._parent());
                        break;
                    }
                    case GLOBAL_OPCODE: {
                        if (!Objects.equals(((PythonPickle.StringnlNoescapePair) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.StringnlNoescapePair) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.StringnlNoescapePair) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.StringnlNoescapePair) (this.arg))._parent());
                        break;
                    }
                    case INST: {
                        if (!Objects.equals(((PythonPickle.StringnlNoescapePair) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.StringnlNoescapePair) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.StringnlNoescapePair) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.StringnlNoescapePair) (this.arg))._parent());
                        break;
                    }
                    case INT: {
                        if (!Objects.equals(((PythonPickle.DecimalnlShort) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.DecimalnlShort) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.DecimalnlShort) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.DecimalnlShort) (this.arg))._parent());
                        break;
                    }
                    case LIST: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case LONG: {
                        if (!Objects.equals(((PythonPickle.DecimalnlLong) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.DecimalnlLong) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.DecimalnlLong) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.DecimalnlLong) (this.arg))._parent());
                        break;
                    }
                    case LONG1: {
                        if (!Objects.equals(((PythonPickle.Long1) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.Long1) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.Long1) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.Long1) (this.arg))._parent());
                        break;
                    }
                    case LONG4: {
                        if (!Objects.equals(((PythonPickle.Long4) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.Long4) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.Long4) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.Long4) (this.arg))._parent());
                        break;
                    }
                    case LONG_BINGET: {
                        break;
                    }
                    case LONG_BINPUT: {
                        break;
                    }
                    case MARK: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case MEMOIZE: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case NEWFALSE: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case NEWOBJ: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case NEWOBJ_EX: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case NEWTRUE: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case NEXT_BUFFER: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case NONE: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case OBJ: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case PERSID: {
                        if (!Objects.equals(((PythonPickle.StringnlNoescape) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.StringnlNoescape) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.StringnlNoescape) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.StringnlNoescape) (this.arg))._parent());
                        break;
                    }
                    case POP: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case POP_MARK: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case PROTO: {
                        break;
                    }
                    case PUT: {
                        if (!Objects.equals(((PythonPickle.DecimalnlShort) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.DecimalnlShort) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.DecimalnlShort) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.DecimalnlShort) (this.arg))._parent());
                        break;
                    }
                    case READONLY_BUFFER: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case REDUCE: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case SETITEM: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case SETITEMS: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case SHORT_BINBYTES: {
                        if (!Objects.equals(((PythonPickle.Bytes1) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.Bytes1) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.Bytes1) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.Bytes1) (this.arg))._parent());
                        break;
                    }
                    case SHORT_BINSTRING: {
                        if (!Objects.equals(((PythonPickle.String1) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.String1) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.String1) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.String1) (this.arg))._parent());
                        break;
                    }
                    case SHORT_BINUNICODE: {
                        if (!Objects.equals(((PythonPickle.Unicodestring1) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.Unicodestring1) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.Unicodestring1) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.Unicodestring1) (this.arg))._parent());
                        break;
                    }
                    case STACK_GLOBAL: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case STOP: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case STRING: {
                        if (!Objects.equals(((PythonPickle.Stringnl) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.Stringnl) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.Stringnl) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.Stringnl) (this.arg))._parent());
                        break;
                    }
                    case TUPLE: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case TUPLE1: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case TUPLE2: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case TUPLE3: {
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.NoArg) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.NoArg) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.NoArg) (this.arg))._parent());
                        break;
                    }
                    case UNICODE: {
                        if (!Objects.equals(((PythonPickle.Unicodestringnl) (this.arg))._root(), _root()))
                            throw new ConsistencyError("arg", _root(), ((PythonPickle.Unicodestringnl) (this.arg))._root());
                        if (!Objects.equals(((PythonPickle.Unicodestringnl) (this.arg))._parent(), this))
                            throw new ConsistencyError("arg", this, ((PythonPickle.Unicodestringnl) (this.arg))._parent());
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }
        private Opcode code;
        private Object arg;
        private PythonPickle _root;
        private PythonPickle _parent;

        /**
         * Operation code that determines which action should be
         * performed next by the Pickle Virtual Machine. Some opcodes
         * are only available in later versions of the Pickle protocol.
         */
        public Opcode code() { return code; }
        public void setCode(Opcode _v) { _dirty = true; code = _v; }

        /**
         * Optional argument for the operation. Data type and length
         * are determined by the value of the opcode.
         */
        public Object arg() { return arg; }
        public void setArg(Object _v) { _dirty = true; arg = _v; }
        public PythonPickle _root() { return _root; }
        public void set_root(PythonPickle _v) { _dirty = true; _root = _v; }
        public PythonPickle _parent() { return _parent; }
        public void set_parent(PythonPickle _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Length prefixed string, between 0 and 255 bytes long. Encoding is
     * unspecified.
     * 
     * The default Python 2.x string type (`str`) is a sequence of bytes.
     * These are pickled as `string1` or `string4`, when protocol == 2.
     * The bytes are written directly, no explicit encoding is performed.
     * 
     * Python 3.x will not pickle an object as `string1` or `string4`.
     * Instead, opcodes and types with a known encoding are used.
     * When unpickling
     * 
     * - `pickle.Unpickler` objects default to ASCII, which can be overriden
     * - `pickletools.dis` uses latin1, and cannot be overriden
     * @see <a href="https://github.com/python/cpython/blob/bb8071a4cae/Lib/pickle.py#L486-L495">Source</a>
     */
    public static class String1 extends KaitaiStruct.ReadWrite {
        public static String1 fromFile(String fileName) throws IOException {
            return new String1(new ByteBufferKaitaiStream(fileName));
        }
        public String1() {
            this(null, null, null);
        }

        public String1(KaitaiStream _io) {
            this(_io, null, null);
        }

        public String1(KaitaiStream _io, PythonPickle.Op _parent) {
            this(_io, _parent, null);
        }

        public String1(KaitaiStream _io, PythonPickle.Op _parent, PythonPickle _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.len = this._io.readU1();
            this.val = this._io.readBytes(len());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.len);
            this._io.writeBytes(this.val);
        }

        public void _check() {
            if (this.val.length != len())
                throw new ConsistencyError("val", len(), this.val.length);
            _dirty = false;
        }
        private int len;
        private byte[] val;
        private PythonPickle _root;
        private PythonPickle.Op _parent;
        public int len() { return len; }
        public void setLen(int _v) { _dirty = true; len = _v; }
        public byte[] val() { return val; }
        public void setVal(byte[] _v) { _dirty = true; val = _v; }
        public PythonPickle _root() { return _root; }
        public void set_root(PythonPickle _v) { _dirty = true; _root = _v; }
        public PythonPickle.Op _parent() { return _parent; }
        public void set_parent(PythonPickle.Op _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Length prefixed string, between 0 and 2**31-1 bytes long. Encoding is
     * unspecified.
     * 
     * Although the len field is signed, any length < 0 will raise an exception
     * during unpickling.
     * 
     * See the documentation for `string1` for further detail about encodings.
     * @see <a href="https://github.com/python/cpython/blob/bb8071a4cae/Lib/pickle.py#L486-L495">Source</a>
     */
    public static class String4 extends KaitaiStruct.ReadWrite {
        public static String4 fromFile(String fileName) throws IOException {
            return new String4(new ByteBufferKaitaiStream(fileName));
        }
        public String4() {
            this(null, null, null);
        }

        public String4(KaitaiStream _io) {
            this(_io, null, null);
        }

        public String4(KaitaiStream _io, PythonPickle.Op _parent) {
            this(_io, _parent, null);
        }

        public String4(KaitaiStream _io, PythonPickle.Op _parent, PythonPickle _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.len = this._io.readS4le();
            this.val = this._io.readBytes(len());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS4le(this.len);
            this._io.writeBytes(this.val);
        }

        public void _check() {
            if (this.val.length != len())
                throw new ConsistencyError("val", len(), this.val.length);
            _dirty = false;
        }
        private int len;
        private byte[] val;
        private PythonPickle _root;
        private PythonPickle.Op _parent;
        public int len() { return len; }
        public void setLen(int _v) { _dirty = true; len = _v; }
        public byte[] val() { return val; }
        public void setVal(byte[] _v) { _dirty = true; val = _v; }
        public PythonPickle _root() { return _root; }
        public void set_root(PythonPickle _v) { _dirty = true; _root = _v; }
        public PythonPickle.Op _parent() { return _parent; }
        public void set_parent(PythonPickle.Op _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Quoted string, possibly containing Python string escapes.
     */
    public static class Stringnl extends KaitaiStruct.ReadWrite {
        public static Stringnl fromFile(String fileName) throws IOException {
            return new Stringnl(new ByteBufferKaitaiStream(fileName));
        }
        public Stringnl() {
            this(null, null, null);
        }

        public Stringnl(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Stringnl(KaitaiStream _io, PythonPickle.Op _parent) {
            this(_io, _parent, null);
        }

        public Stringnl(KaitaiStream _io, PythonPickle.Op _parent, PythonPickle _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.val = new String(this._io.readBytesTerm((byte) 10, false, true, true), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.val).getBytes(Charset.forName("ASCII")));
            this._io.writeU1(10);
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.val).getBytes(Charset.forName("ASCII")), ((byte) 10)) != -1)
                throw new ConsistencyError("val", -1, KaitaiStream.byteArrayIndexOf((this.val).getBytes(Charset.forName("ASCII")), ((byte) 10)));
            _dirty = false;
        }
        private String val;
        private PythonPickle _root;
        private PythonPickle.Op _parent;
        public String val() { return val; }
        public void setVal(String _v) { _dirty = true; val = _v; }
        public PythonPickle _root() { return _root; }
        public void set_root(PythonPickle _v) { _dirty = true; _root = _v; }
        public PythonPickle.Op _parent() { return _parent; }
        public void set_parent(PythonPickle.Op _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Unquoted string, does not contain string escapes.
     */
    public static class StringnlNoescape extends KaitaiStruct.ReadWrite {
        public static StringnlNoescape fromFile(String fileName) throws IOException {
            return new StringnlNoescape(new ByteBufferKaitaiStream(fileName));
        }
        public StringnlNoescape() {
            this(null, null, null);
        }

        public StringnlNoescape(KaitaiStream _io) {
            this(_io, null, null);
        }

        public StringnlNoescape(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public StringnlNoescape(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, PythonPickle _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.val = new String(this._io.readBytesTerm((byte) 10, false, true, true), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.val).getBytes(Charset.forName("ASCII")));
            this._io.writeU1(10);
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.val).getBytes(Charset.forName("ASCII")), ((byte) 10)) != -1)
                throw new ConsistencyError("val", -1, KaitaiStream.byteArrayIndexOf((this.val).getBytes(Charset.forName("ASCII")), ((byte) 10)));
            _dirty = false;
        }
        private String val;
        private PythonPickle _root;
        private KaitaiStruct.ReadWrite _parent;
        public String val() { return val; }
        public void setVal(String _v) { _dirty = true; val = _v; }
        public PythonPickle _root() { return _root; }
        public void set_root(PythonPickle _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Pair of unquoted, unescaped strings.
     */
    public static class StringnlNoescapePair extends KaitaiStruct.ReadWrite {
        public static StringnlNoescapePair fromFile(String fileName) throws IOException {
            return new StringnlNoescapePair(new ByteBufferKaitaiStream(fileName));
        }
        public StringnlNoescapePair() {
            this(null, null, null);
        }

        public StringnlNoescapePair(KaitaiStream _io) {
            this(_io, null, null);
        }

        public StringnlNoescapePair(KaitaiStream _io, PythonPickle.Op _parent) {
            this(_io, _parent, null);
        }

        public StringnlNoescapePair(KaitaiStream _io, PythonPickle.Op _parent, PythonPickle _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.val1 = new StringnlNoescape(this._io, this, _root);
            this.val1._read();
            this.val2 = new StringnlNoescape(this._io, this, _root);
            this.val2._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.val1._fetchInstances();
            this.val2._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.val1._write_Seq(this._io);
            this.val2._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.val1._root(), _root()))
                throw new ConsistencyError("val1", _root(), this.val1._root());
            if (!Objects.equals(this.val1._parent(), this))
                throw new ConsistencyError("val1", this, this.val1._parent());
            if (!Objects.equals(this.val2._root(), _root()))
                throw new ConsistencyError("val2", _root(), this.val2._root());
            if (!Objects.equals(this.val2._parent(), this))
                throw new ConsistencyError("val2", this, this.val2._parent());
            _dirty = false;
        }
        private StringnlNoescape val1;
        private StringnlNoescape val2;
        private PythonPickle _root;
        private PythonPickle.Op _parent;
        public StringnlNoescape val1() { return val1; }
        public void setVal1(StringnlNoescape _v) { _dirty = true; val1 = _v; }
        public StringnlNoescape val2() { return val2; }
        public void setVal2(StringnlNoescape _v) { _dirty = true; val2 = _v; }
        public PythonPickle _root() { return _root; }
        public void set_root(PythonPickle _v) { _dirty = true; _root = _v; }
        public PythonPickle.Op _parent() { return _parent; }
        public void set_parent(PythonPickle.Op _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Length prefixed string, between 0 and 255 bytes long
     */
    public static class Unicodestring1 extends KaitaiStruct.ReadWrite {
        public static Unicodestring1 fromFile(String fileName) throws IOException {
            return new Unicodestring1(new ByteBufferKaitaiStream(fileName));
        }
        public Unicodestring1() {
            this(null, null, null);
        }

        public Unicodestring1(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Unicodestring1(KaitaiStream _io, PythonPickle.Op _parent) {
            this(_io, _parent, null);
        }

        public Unicodestring1(KaitaiStream _io, PythonPickle.Op _parent, PythonPickle _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.len = this._io.readU1();
            this.val = new String(this._io.readBytes(len()), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.len);
            this._io.writeBytes((this.val).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if ((this.val).getBytes(Charset.forName("UTF-8")).length != len())
                throw new ConsistencyError("val", len(), (this.val).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private int len;
        private String val;
        private PythonPickle _root;
        private PythonPickle.Op _parent;
        public int len() { return len; }
        public void setLen(int _v) { _dirty = true; len = _v; }
        public String val() { return val; }
        public void setVal(String _v) { _dirty = true; val = _v; }
        public PythonPickle _root() { return _root; }
        public void set_root(PythonPickle _v) { _dirty = true; _root = _v; }
        public PythonPickle.Op _parent() { return _parent; }
        public void set_parent(PythonPickle.Op _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Length prefixed string, between 0 and 2**32-1 bytes long
     */
    public static class Unicodestring4 extends KaitaiStruct.ReadWrite {
        public static Unicodestring4 fromFile(String fileName) throws IOException {
            return new Unicodestring4(new ByteBufferKaitaiStream(fileName));
        }
        public Unicodestring4() {
            this(null, null, null);
        }

        public Unicodestring4(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Unicodestring4(KaitaiStream _io, PythonPickle.Op _parent) {
            this(_io, _parent, null);
        }

        public Unicodestring4(KaitaiStream _io, PythonPickle.Op _parent, PythonPickle _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.len = this._io.readU4le();
            this.val = new String(this._io.readBytes(len()), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.len);
            this._io.writeBytes((this.val).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if ((this.val).getBytes(Charset.forName("UTF-8")).length != len())
                throw new ConsistencyError("val", len(), (this.val).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private long len;
        private String val;
        private PythonPickle _root;
        private PythonPickle.Op _parent;
        public long len() { return len; }
        public void setLen(long _v) { _dirty = true; len = _v; }
        public String val() { return val; }
        public void setVal(String _v) { _dirty = true; val = _v; }
        public PythonPickle _root() { return _root; }
        public void set_root(PythonPickle _v) { _dirty = true; _root = _v; }
        public PythonPickle.Op _parent() { return _parent; }
        public void set_parent(PythonPickle.Op _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Length prefixed string, between 0 and 2**64-1 bytes long.
     * 
     * Only a 64-bit build of Python would produce a pickle containing strings
     * large enough to need this type. Such a pickle could not be unpickled on
     * a 32-bit build of Python, because the string would be larger than
     * `sys.maxsize`.
     */
    public static class Unicodestring8 extends KaitaiStruct.ReadWrite {
        public static Unicodestring8 fromFile(String fileName) throws IOException {
            return new Unicodestring8(new ByteBufferKaitaiStream(fileName));
        }
        public Unicodestring8() {
            this(null, null, null);
        }

        public Unicodestring8(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Unicodestring8(KaitaiStream _io, PythonPickle.Op _parent) {
            this(_io, _parent, null);
        }

        public Unicodestring8(KaitaiStream _io, PythonPickle.Op _parent, PythonPickle _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.len = this._io.readU8le();
            this.val = new String(this._io.readBytes(len()), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU8le(this.len);
            this._io.writeBytes((this.val).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if ((this.val).getBytes(Charset.forName("UTF-8")).length != len())
                throw new ConsistencyError("val", len(), (this.val).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private long len;
        private String val;
        private PythonPickle _root;
        private PythonPickle.Op _parent;
        public long len() { return len; }
        public void setLen(long _v) { _dirty = true; len = _v; }
        public String val() { return val; }
        public void setVal(String _v) { _dirty = true; val = _v; }
        public PythonPickle _root() { return _root; }
        public void set_root(PythonPickle _v) { _dirty = true; _root = _v; }
        public PythonPickle.Op _parent() { return _parent; }
        public void set_parent(PythonPickle.Op _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Unquoted string, containing Python Unicode escapes.
     */
    public static class Unicodestringnl extends KaitaiStruct.ReadWrite {
        public static Unicodestringnl fromFile(String fileName) throws IOException {
            return new Unicodestringnl(new ByteBufferKaitaiStream(fileName));
        }
        public Unicodestringnl() {
            this(null, null, null);
        }

        public Unicodestringnl(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Unicodestringnl(KaitaiStream _io, PythonPickle.Op _parent) {
            this(_io, _parent, null);
        }

        public Unicodestringnl(KaitaiStream _io, PythonPickle.Op _parent, PythonPickle _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.val = new String(this._io.readBytesTerm((byte) 10, false, true, true), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.val).getBytes(Charset.forName("ASCII")));
            this._io.writeU1(10);
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.val).getBytes(Charset.forName("ASCII")), ((byte) 10)) != -1)
                throw new ConsistencyError("val", -1, KaitaiStream.byteArrayIndexOf((this.val).getBytes(Charset.forName("ASCII")), ((byte) 10)));
            _dirty = false;
        }
        private String val;
        private PythonPickle _root;
        private PythonPickle.Op _parent;
        public String val() { return val; }
        public void setVal(String _v) { _dirty = true; val = _v; }
        public PythonPickle _root() { return _root; }
        public void set_root(PythonPickle _v) { _dirty = true; _root = _v; }
        public PythonPickle.Op _parent() { return _parent; }
        public void set_parent(PythonPickle.Op _v) { _dirty = true; _parent = _v; }
    }
    private List<Op> ops;
    private PythonPickle _root;
    private KaitaiStruct.ReadWrite _parent;
    public List<Op> ops() { return ops; }
    public void setOps(List<Op> _v) { _dirty = true; ops = _v; }
    public PythonPickle _root() { return _root; }
    public void set_root(PythonPickle _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

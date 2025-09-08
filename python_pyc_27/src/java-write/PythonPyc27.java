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
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;


/**
 * Python interpreter runs .py files in 2 step process: first, it
 * produces bytecode, which it then executes. Translation of .py source
 * into bytecode is time-consuming, so Python dumps compiled bytecode
 * into .pyc files, to be reused from cache at later time if possible.
 * 
 * .pyc file is essentially a raw dump of `py_object` (see `body`) with
 * a simple header prepended.
 */
public class PythonPyc27 extends KaitaiStruct.ReadWrite {
    public static PythonPyc27 fromFile(String fileName) throws IOException {
        return new PythonPyc27(new ByteBufferKaitaiStream(fileName));
    }

    public enum Version {
        V15(20121),
        V16(50428),
        V20(50823),
        V21(60202),
        V22(60717),
        V23_A0(62011),
        V23_A0B(62021),
        V24_A0(62041),
        V24_A3(62051),
        V24_B1(62061),
        V25_A0(62071),
        V25_A0B(62081),
        V25_A0C(62091),
        V25_A0D(62092),
        V25_B3(62101),
        V25_B3B(62111),
        V25_C1(62121),
        V25_C2(62131),
        V26_A0(62151),
        V26_A1(62161),
        V27_A0(62171),
        V27_A0B(62181),
        V27_A0C(62191),
        V27_A0D(62201),
        V27_A0E(62211);

        private final long id;
        Version(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Version> byId = new HashMap<Long, Version>(25);
        static {
            for (Version e : Version.values())
                byId.put(e.id(), e);
        }
        public static Version byId(long id) { return byId.get(id); }
    }
    public PythonPyc27() {
        this(null, null, null);
    }

    public PythonPyc27(KaitaiStream _io) {
        this(_io, null, null);
    }

    public PythonPyc27(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public PythonPyc27(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, PythonPyc27 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.versionMagic = Version.byId(this._io.readU2le());
        this.crlf = this._io.readU2le();
        this.modificationTimestamp = this._io.readU4le();
        this.body = new PyObject(this._io, this, _root);
        this.body._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.body._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeU2le(((Number) (this.versionMagic.id())).intValue());
        this._io.writeU2le(this.crlf);
        this._io.writeU4le(this.modificationTimestamp);
        this.body._write_Seq(this._io);
    }

    public void _check() {
        if (!Objects.equals(this.body._root(), _root()))
            throw new ConsistencyError("body", _root(), this.body._root());
        if (!Objects.equals(this.body._parent(), this))
            throw new ConsistencyError("body", this, this.body._parent());
        _dirty = false;
    }
    public static class Assembly extends KaitaiStruct.ReadWrite {
        public static Assembly fromFile(String fileName) throws IOException {
            return new Assembly(new ByteBufferKaitaiStream(fileName));
        }
        public Assembly() {
            this(null, null, null);
        }

        public Assembly(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Assembly(KaitaiStream _io, PythonPyc27.CodeObject _parent) {
            this(_io, _parent, null);
        }

        public Assembly(KaitaiStream _io, PythonPyc27.CodeObject _parent, PythonPyc27 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.stringMagic = this._io.readBytes(1);
            if (!(Arrays.equals(this.stringMagic, new byte[] { 115 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 115 }, this.stringMagic, this._io, "/types/assembly/seq/0");
            }
            this.length = this._io.readU4le();
            this._raw_items = this._io.readBytes(length());
            KaitaiStream _io__raw_items = new ByteBufferKaitaiStream(this._raw_items);
            this.items = new OpArgs(_io__raw_items, this, _root);
            this.items._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.items._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.stringMagic);
            this._io.writeU4le(this.length);
            final KaitaiStream _io__raw_items = new ByteBufferKaitaiStream(length());
            this._io.addChildStream(_io__raw_items);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (length()));
                final Assembly _this = this;
                _io__raw_items.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_items = _io__raw_items.toByteArray();
                        if (_this._raw_items.length != length())
                            throw new ConsistencyError("raw(items)", length(), _this._raw_items.length);
                        parent.writeBytes(_this._raw_items);
                    }
                });
            }
            this.items._write_Seq(_io__raw_items);
        }

        public void _check() {
            if (this.stringMagic.length != 1)
                throw new ConsistencyError("string_magic", 1, this.stringMagic.length);
            if (!(Arrays.equals(this.stringMagic, new byte[] { 115 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 115 }, this.stringMagic, null, "/types/assembly/seq/0");
            }
            if (!Objects.equals(this.items._root(), _root()))
                throw new ConsistencyError("items", _root(), this.items._root());
            if (!Objects.equals(this.items._parent(), this))
                throw new ConsistencyError("items", this, this.items._parent());
            _dirty = false;
        }
        private byte[] stringMagic;
        private long length;
        private OpArgs items;
        private PythonPyc27 _root;
        private PythonPyc27.CodeObject _parent;
        private byte[] _raw_items;
        public byte[] stringMagic() { return stringMagic; }
        public void setStringMagic(byte[] _v) { _dirty = true; stringMagic = _v; }
        public long length() { return length; }
        public void setLength(long _v) { _dirty = true; length = _v; }
        public OpArgs items() { return items; }
        public void setItems(OpArgs _v) { _dirty = true; items = _v; }
        public PythonPyc27 _root() { return _root; }
        public void set_root(PythonPyc27 _v) { _dirty = true; _root = _v; }
        public PythonPyc27.CodeObject _parent() { return _parent; }
        public void set_parent(PythonPyc27.CodeObject _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_items() { return _raw_items; }
        public void set_raw_Items(byte[] _v) { _dirty = true; _raw_items = _v; }
    }
    public static class CodeObject extends KaitaiStruct.ReadWrite {
        public static CodeObject fromFile(String fileName) throws IOException {
            return new CodeObject(new ByteBufferKaitaiStream(fileName));
        }

        public enum FlagsEnum {
            HAS_ARGS(4),
            HAS_KWARGS(8),
            GENERATOR(32);

            private final long id;
            FlagsEnum(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, FlagsEnum> byId = new HashMap<Long, FlagsEnum>(3);
            static {
                for (FlagsEnum e : FlagsEnum.values())
                    byId.put(e.id(), e);
            }
            public static FlagsEnum byId(long id) { return byId.get(id); }
        }
        public CodeObject() {
            this(null, null, null);
        }

        public CodeObject(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CodeObject(KaitaiStream _io, PythonPyc27.PyObject _parent) {
            this(_io, _parent, null);
        }

        public CodeObject(KaitaiStream _io, PythonPyc27.PyObject _parent, PythonPyc27 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.argCount = this._io.readU4le();
            this.localCount = this._io.readU4le();
            this.stackSize = this._io.readU4le();
            this.flags = FlagsEnum.byId(this._io.readU4le());
            this.code = new Assembly(this._io, this, _root);
            this.code._read();
            this.consts = new PyObject(this._io, this, _root);
            this.consts._read();
            this.names = new PyObject(this._io, this, _root);
            this.names._read();
            this.varNames = new PyObject(this._io, this, _root);
            this.varNames._read();
            this.freeVars = new PyObject(this._io, this, _root);
            this.freeVars._read();
            this.cellVars = new PyObject(this._io, this, _root);
            this.cellVars._read();
            this.filename = new PyObject(this._io, this, _root);
            this.filename._read();
            this.name = new PyObject(this._io, this, _root);
            this.name._read();
            this.firstLineNo = this._io.readU4le();
            this.lnotab = new PyObject(this._io, this, _root);
            this.lnotab._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.code._fetchInstances();
            this.consts._fetchInstances();
            this.names._fetchInstances();
            this.varNames._fetchInstances();
            this.freeVars._fetchInstances();
            this.cellVars._fetchInstances();
            this.filename._fetchInstances();
            this.name._fetchInstances();
            this.lnotab._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.argCount);
            this._io.writeU4le(this.localCount);
            this._io.writeU4le(this.stackSize);
            this._io.writeU4le(((Number) (this.flags.id())).longValue());
            this.code._write_Seq(this._io);
            this.consts._write_Seq(this._io);
            this.names._write_Seq(this._io);
            this.varNames._write_Seq(this._io);
            this.freeVars._write_Seq(this._io);
            this.cellVars._write_Seq(this._io);
            this.filename._write_Seq(this._io);
            this.name._write_Seq(this._io);
            this._io.writeU4le(this.firstLineNo);
            this.lnotab._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.code._root(), _root()))
                throw new ConsistencyError("code", _root(), this.code._root());
            if (!Objects.equals(this.code._parent(), this))
                throw new ConsistencyError("code", this, this.code._parent());
            if (!Objects.equals(this.consts._root(), _root()))
                throw new ConsistencyError("consts", _root(), this.consts._root());
            if (!Objects.equals(this.consts._parent(), this))
                throw new ConsistencyError("consts", this, this.consts._parent());
            if (!Objects.equals(this.names._root(), _root()))
                throw new ConsistencyError("names", _root(), this.names._root());
            if (!Objects.equals(this.names._parent(), this))
                throw new ConsistencyError("names", this, this.names._parent());
            if (!Objects.equals(this.varNames._root(), _root()))
                throw new ConsistencyError("var_names", _root(), this.varNames._root());
            if (!Objects.equals(this.varNames._parent(), this))
                throw new ConsistencyError("var_names", this, this.varNames._parent());
            if (!Objects.equals(this.freeVars._root(), _root()))
                throw new ConsistencyError("free_vars", _root(), this.freeVars._root());
            if (!Objects.equals(this.freeVars._parent(), this))
                throw new ConsistencyError("free_vars", this, this.freeVars._parent());
            if (!Objects.equals(this.cellVars._root(), _root()))
                throw new ConsistencyError("cell_vars", _root(), this.cellVars._root());
            if (!Objects.equals(this.cellVars._parent(), this))
                throw new ConsistencyError("cell_vars", this, this.cellVars._parent());
            if (!Objects.equals(this.filename._root(), _root()))
                throw new ConsistencyError("filename", _root(), this.filename._root());
            if (!Objects.equals(this.filename._parent(), this))
                throw new ConsistencyError("filename", this, this.filename._parent());
            if (!Objects.equals(this.name._root(), _root()))
                throw new ConsistencyError("name", _root(), this.name._root());
            if (!Objects.equals(this.name._parent(), this))
                throw new ConsistencyError("name", this, this.name._parent());
            if (!Objects.equals(this.lnotab._root(), _root()))
                throw new ConsistencyError("lnotab", _root(), this.lnotab._root());
            if (!Objects.equals(this.lnotab._parent(), this))
                throw new ConsistencyError("lnotab", this, this.lnotab._parent());
            _dirty = false;
        }
        private long argCount;
        private long localCount;
        private long stackSize;
        private FlagsEnum flags;
        private Assembly code;
        private PyObject consts;
        private PyObject names;
        private PyObject varNames;
        private PyObject freeVars;
        private PyObject cellVars;
        private PyObject filename;
        private PyObject name;
        private long firstLineNo;
        private PyObject lnotab;
        private PythonPyc27 _root;
        private PythonPyc27.PyObject _parent;
        public long argCount() { return argCount; }
        public void setArgCount(long _v) { _dirty = true; argCount = _v; }
        public long localCount() { return localCount; }
        public void setLocalCount(long _v) { _dirty = true; localCount = _v; }
        public long stackSize() { return stackSize; }
        public void setStackSize(long _v) { _dirty = true; stackSize = _v; }
        public FlagsEnum flags() { return flags; }
        public void setFlags(FlagsEnum _v) { _dirty = true; flags = _v; }
        public Assembly code() { return code; }
        public void setCode(Assembly _v) { _dirty = true; code = _v; }
        public PyObject consts() { return consts; }
        public void setConsts(PyObject _v) { _dirty = true; consts = _v; }
        public PyObject names() { return names; }
        public void setNames(PyObject _v) { _dirty = true; names = _v; }
        public PyObject varNames() { return varNames; }
        public void setVarNames(PyObject _v) { _dirty = true; varNames = _v; }
        public PyObject freeVars() { return freeVars; }
        public void setFreeVars(PyObject _v) { _dirty = true; freeVars = _v; }
        public PyObject cellVars() { return cellVars; }
        public void setCellVars(PyObject _v) { _dirty = true; cellVars = _v; }
        public PyObject filename() { return filename; }
        public void setFilename(PyObject _v) { _dirty = true; filename = _v; }
        public PyObject name() { return name; }
        public void setName(PyObject _v) { _dirty = true; name = _v; }
        public long firstLineNo() { return firstLineNo; }
        public void setFirstLineNo(long _v) { _dirty = true; firstLineNo = _v; }
        public PyObject lnotab() { return lnotab; }
        public void setLnotab(PyObject _v) { _dirty = true; lnotab = _v; }
        public PythonPyc27 _root() { return _root; }
        public void set_root(PythonPyc27 _v) { _dirty = true; _root = _v; }
        public PythonPyc27.PyObject _parent() { return _parent; }
        public void set_parent(PythonPyc27.PyObject _v) { _dirty = true; _parent = _v; }
    }
    public static class OpArg extends KaitaiStruct.ReadWrite {
        public static OpArg fromFile(String fileName) throws IOException {
            return new OpArg(new ByteBufferKaitaiStream(fileName));
        }

        public enum OpCodeEnum {
            STOP_CODE(0),
            POP_TOP(1),
            ROT_TWO(2),
            ROT_THREE(3),
            DUP_TOP(4),
            ROT_FOUR(5),
            NOP(9),
            UNARY_POSITIVE(10),
            UNARY_NEGATIVE(11),
            UNARY_NOT(12),
            UNARY_CONVERT(13),
            UNARY_INVERT(15),
            BINARY_POWER(19),
            BINARY_MULTIPLY(20),
            BINARY_DIVIDE(21),
            BINARY_MODULO(22),
            BINARY_ADD(23),
            BINARY_SUBTRACT(24),
            BINARY_SUBSCR(25),
            BINARY_FLOOR_DIVIDE(26),
            BINARY_TRUE_DIVIDE(27),
            INPLACE_FLOOR_DIVIDE(28),
            INPLACE_TRUE_DIVIDE(29),
            SLICE_0(30),
            SLICE_1(31),
            SLICE_2(32),
            SLICE_3(33),
            STORE_SLICE_0(40),
            STORE_SLICE_1(41),
            STORE_SLICE_2(42),
            STORE_SLICE_3(43),
            DELETE_SLICE_0(50),
            DELETE_SLICE_1(51),
            DELETE_SLICE_2(52),
            DELETE_SLICE_3(53),
            STORE_MAP(54),
            INPLACE_ADD(55),
            INPLACE_SUBTRACT(56),
            INPLACE_MULTIPLY(57),
            INPLACE_DIVIDE(58),
            INPLACE_MODULO(59),
            STORE_SUBSCR(60),
            DELETE_SUBSCR(61),
            BINARY_LSHIFT(62),
            BINARY_RSHIFT(63),
            BINARY_AND(64),
            BINARY_XOR(65),
            BINARY_OR(66),
            INPLACE_POWER(67),
            GET_ITER(68),
            PRINT_EXPR(70),
            PRINT_ITEM(71),
            PRINT_NEWLINE(72),
            PRINT_ITEM_TO(73),
            PRINT_NEWLINE_TO(74),
            INPLACE_LSHIFT(75),
            INPLACE_RSHIFT(76),
            INPLACE_AND(77),
            INPLACE_XOR(78),
            INPLACE_OR(79),
            BREAK_LOOP(80),
            WITH_CLEANUP(81),
            LOAD_LOCALS(82),
            RETURN_VALUE(83),
            IMPORT_STAR(84),
            EXEC_STMT(85),
            YIELD_VALUE(86),
            POP_BLOCK(87),
            END_FINALLY(88),
            BUILD_CLASS(89),
            STORE_NAME(90),
            DELETE_NAME(91),
            UNPACK_SEQUENCE(92),
            FOR_ITER(93),
            LIST_APPEND(94),
            STORE_ATTR(95),
            DELETE_ATTR(96),
            STORE_GLOBAL(97),
            DELETE_GLOBAL(98),
            DUP_TOPX(99),
            LOAD_CONST(100),
            LOAD_NAME(101),
            BUILD_TUPLE(102),
            BUILD_LIST(103),
            BUILD_SET(104),
            BUILD_MAP(105),
            LOAD_ATTR(106),
            COMPARE_OP(107),
            IMPORT_NAME(108),
            IMPORT_FROM(109),
            JUMP_FORWARD(110),
            JUMP_IF_FALSE_OR_POP(111),
            JUMP_IF_TRUE_OR_POP(112),
            JUMP_ABSOLUTE(113),
            POP_JUMP_IF_FALSE(114),
            POP_JUMP_IF_TRUE(115),
            LOAD_GLOBAL(116),
            CONTINUE_LOOP(119),
            SETUP_LOOP(120),
            SETUP_EXCEPT(121),
            SETUP_FINALLY(122),
            LOAD_FAST(124),
            STORE_FAST(125),
            DELETE_FAST(126),
            RAISE_VARARGS(130),
            CALL_FUNCTION(131),
            MAKE_FUNCTION(132),
            BUILD_SLICE(133),
            MAKE_CLOSURE(134),
            LOAD_CLOSURE(135),
            LOAD_DEREF(136),
            STORE_DEREF(137),
            CALL_FUNCTION_VAR(140),
            CALL_FUNCTION_KW(141),
            CALL_FUNCTION_VAR_KW(142),
            SETUP_WITH(143),
            EXTENDED_ARG(145),
            SET_ADD(146),
            MAP_ADD(147);

            private final long id;
            OpCodeEnum(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, OpCodeEnum> byId = new HashMap<Long, OpCodeEnum>(119);
            static {
                for (OpCodeEnum e : OpCodeEnum.values())
                    byId.put(e.id(), e);
            }
            public static OpCodeEnum byId(long id) { return byId.get(id); }
        }
        public OpArg() {
            this(null, null, null);
        }

        public OpArg(KaitaiStream _io) {
            this(_io, null, null);
        }

        public OpArg(KaitaiStream _io, PythonPyc27.OpArgs _parent) {
            this(_io, _parent, null);
        }

        public OpArg(KaitaiStream _io, PythonPyc27.OpArgs _parent, PythonPyc27 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.opCode = OpCodeEnum.byId(this._io.readU1());
            if (opCode().id() >= OpCodeEnum.STORE_NAME.id()) {
                this.arg = this._io.readU2le();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (opCode().id() >= OpCodeEnum.STORE_NAME.id()) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(((Number) (this.opCode.id())).intValue());
            if (opCode().id() >= OpCodeEnum.STORE_NAME.id()) {
                this._io.writeU2le(this.arg);
            }
        }

        public void _check() {
            if (opCode().id() >= OpCodeEnum.STORE_NAME.id()) {
            }
            _dirty = false;
        }
        private OpCodeEnum opCode;
        private Integer arg;
        private PythonPyc27 _root;
        private PythonPyc27.OpArgs _parent;
        public OpCodeEnum opCode() { return opCode; }
        public void setOpCode(OpCodeEnum _v) { _dirty = true; opCode = _v; }
        public Integer arg() { return arg; }
        public void setArg(Integer _v) { _dirty = true; arg = _v; }
        public PythonPyc27 _root() { return _root; }
        public void set_root(PythonPyc27 _v) { _dirty = true; _root = _v; }
        public PythonPyc27.OpArgs _parent() { return _parent; }
        public void set_parent(PythonPyc27.OpArgs _v) { _dirty = true; _parent = _v; }
    }
    public static class OpArgs extends KaitaiStruct.ReadWrite {
        public static OpArgs fromFile(String fileName) throws IOException {
            return new OpArgs(new ByteBufferKaitaiStream(fileName));
        }
        public OpArgs() {
            this(null, null, null);
        }

        public OpArgs(KaitaiStream _io) {
            this(_io, null, null);
        }

        public OpArgs(KaitaiStream _io, PythonPyc27.Assembly _parent) {
            this(_io, _parent, null);
        }

        public OpArgs(KaitaiStream _io, PythonPyc27.Assembly _parent, PythonPyc27 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.items = new ArrayList<OpArg>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    OpArg _t_items = new OpArg(this._io, this, _root);
                    try {
                        _t_items._read();
                    } finally {
                        this.items.add(_t_items);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.items.size(); i++) {
                this.items.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.items.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("items", 0, this._io.size() - this._io.pos());
                this.items.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("items", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.items.size(); i++) {
                if (!Objects.equals(this.items.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("items", _root(), this.items.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.items.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("items", this, this.items.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<OpArg> items;
        private PythonPyc27 _root;
        private PythonPyc27.Assembly _parent;
        public List<OpArg> items() { return items; }
        public void setItems(List<OpArg> _v) { _dirty = true; items = _v; }
        public PythonPyc27 _root() { return _root; }
        public void set_root(PythonPyc27 _v) { _dirty = true; _root = _v; }
        public PythonPyc27.Assembly _parent() { return _parent; }
        public void set_parent(PythonPyc27.Assembly _v) { _dirty = true; _parent = _v; }
    }
    public static class PyObject extends KaitaiStruct.ReadWrite {
        public static PyObject fromFile(String fileName) throws IOException {
            return new PyObject(new ByteBufferKaitaiStream(fileName));
        }

        public enum ObjectType {
            TUPLE(40),
            PY_FALSE(70),
            NONE(78),
            STRING_REF(82),
            PY_TRUE(84),
            CODE_OBJECT(99),
            INT(105),
            STRING(115),
            INTERNED(116),
            UNICODE_STRING(117);

            private final long id;
            ObjectType(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, ObjectType> byId = new HashMap<Long, ObjectType>(10);
            static {
                for (ObjectType e : ObjectType.values())
                    byId.put(e.id(), e);
            }
            public static ObjectType byId(long id) { return byId.get(id); }
        }
        public PyObject() {
            this(null, null, null);
        }

        public PyObject(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PyObject(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public PyObject(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, PythonPyc27 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.type = ObjectType.byId(this._io.readU1());
            {
                ObjectType on = type();
                if (on != null) {
                    switch (type()) {
                    case CODE_OBJECT: {
                        this.value = new CodeObject(this._io, this, _root);
                        ((CodeObject) (this.value))._read();
                        break;
                    }
                    case INT: {
                        this.value = ((Object) (this._io.readU4le()));
                        break;
                    }
                    case INTERNED: {
                        this.value = new InternedString(this._io, this, _root);
                        ((InternedString) (this.value))._read();
                        break;
                    }
                    case NONE: {
                        this.value = new PyNone(this._io, this, _root);
                        ((PyNone) (this.value))._read();
                        break;
                    }
                    case PY_FALSE: {
                        this.value = new PyFalse(this._io, this, _root);
                        ((PyFalse) (this.value))._read();
                        break;
                    }
                    case PY_TRUE: {
                        this.value = new PyTrue(this._io, this, _root);
                        ((PyTrue) (this.value))._read();
                        break;
                    }
                    case STRING: {
                        this.value = new PyString(this._io, this, _root);
                        ((PyString) (this.value))._read();
                        break;
                    }
                    case STRING_REF: {
                        this.value = new StringRef(this._io, this, _root);
                        ((StringRef) (this.value))._read();
                        break;
                    }
                    case TUPLE: {
                        this.value = new Tuple(this._io, this, _root);
                        ((Tuple) (this.value))._read();
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                ObjectType on = type();
                if (on != null) {
                    switch (type()) {
                    case CODE_OBJECT: {
                        ((CodeObject) (this.value))._fetchInstances();
                        break;
                    }
                    case INT: {
                        break;
                    }
                    case INTERNED: {
                        ((InternedString) (this.value))._fetchInstances();
                        break;
                    }
                    case NONE: {
                        ((PyNone) (this.value))._fetchInstances();
                        break;
                    }
                    case PY_FALSE: {
                        ((PyFalse) (this.value))._fetchInstances();
                        break;
                    }
                    case PY_TRUE: {
                        ((PyTrue) (this.value))._fetchInstances();
                        break;
                    }
                    case STRING: {
                        ((PyString) (this.value))._fetchInstances();
                        break;
                    }
                    case STRING_REF: {
                        ((StringRef) (this.value))._fetchInstances();
                        break;
                    }
                    case TUPLE: {
                        ((Tuple) (this.value))._fetchInstances();
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
                ObjectType on = type();
                if (on != null) {
                    switch (type()) {
                    case CODE_OBJECT: {
                        ((CodeObject) (this.value))._write_Seq(this._io);
                        break;
                    }
                    case INT: {
                        this._io.writeU4le(((Number) (this.value)).longValue());
                        break;
                    }
                    case INTERNED: {
                        ((InternedString) (this.value))._write_Seq(this._io);
                        break;
                    }
                    case NONE: {
                        ((PyNone) (this.value))._write_Seq(this._io);
                        break;
                    }
                    case PY_FALSE: {
                        ((PyFalse) (this.value))._write_Seq(this._io);
                        break;
                    }
                    case PY_TRUE: {
                        ((PyTrue) (this.value))._write_Seq(this._io);
                        break;
                    }
                    case STRING: {
                        ((PyString) (this.value))._write_Seq(this._io);
                        break;
                    }
                    case STRING_REF: {
                        ((StringRef) (this.value))._write_Seq(this._io);
                        break;
                    }
                    case TUPLE: {
                        ((Tuple) (this.value))._write_Seq(this._io);
                        break;
                    }
                    }
                }
            }
        }

        public void _check() {
            {
                ObjectType on = type();
                if (on != null) {
                    switch (type()) {
                    case CODE_OBJECT: {
                        if (!Objects.equals(((PythonPyc27.CodeObject) (this.value))._root(), _root()))
                            throw new ConsistencyError("value", _root(), ((PythonPyc27.CodeObject) (this.value))._root());
                        if (!Objects.equals(((PythonPyc27.CodeObject) (this.value))._parent(), this))
                            throw new ConsistencyError("value", this, ((PythonPyc27.CodeObject) (this.value))._parent());
                        break;
                    }
                    case INT: {
                        break;
                    }
                    case INTERNED: {
                        if (!Objects.equals(((PythonPyc27.PyObject.InternedString) (this.value))._root(), _root()))
                            throw new ConsistencyError("value", _root(), ((PythonPyc27.PyObject.InternedString) (this.value))._root());
                        if (!Objects.equals(((PythonPyc27.PyObject.InternedString) (this.value))._parent(), this))
                            throw new ConsistencyError("value", this, ((PythonPyc27.PyObject.InternedString) (this.value))._parent());
                        break;
                    }
                    case NONE: {
                        if (!Objects.equals(((PythonPyc27.PyObject.PyNone) (this.value))._root(), _root()))
                            throw new ConsistencyError("value", _root(), ((PythonPyc27.PyObject.PyNone) (this.value))._root());
                        if (!Objects.equals(((PythonPyc27.PyObject.PyNone) (this.value))._parent(), this))
                            throw new ConsistencyError("value", this, ((PythonPyc27.PyObject.PyNone) (this.value))._parent());
                        break;
                    }
                    case PY_FALSE: {
                        if (!Objects.equals(((PythonPyc27.PyObject.PyFalse) (this.value))._root(), _root()))
                            throw new ConsistencyError("value", _root(), ((PythonPyc27.PyObject.PyFalse) (this.value))._root());
                        if (!Objects.equals(((PythonPyc27.PyObject.PyFalse) (this.value))._parent(), this))
                            throw new ConsistencyError("value", this, ((PythonPyc27.PyObject.PyFalse) (this.value))._parent());
                        break;
                    }
                    case PY_TRUE: {
                        if (!Objects.equals(((PythonPyc27.PyObject.PyTrue) (this.value))._root(), _root()))
                            throw new ConsistencyError("value", _root(), ((PythonPyc27.PyObject.PyTrue) (this.value))._root());
                        if (!Objects.equals(((PythonPyc27.PyObject.PyTrue) (this.value))._parent(), this))
                            throw new ConsistencyError("value", this, ((PythonPyc27.PyObject.PyTrue) (this.value))._parent());
                        break;
                    }
                    case STRING: {
                        if (!Objects.equals(((PythonPyc27.PyObject.PyString) (this.value))._root(), _root()))
                            throw new ConsistencyError("value", _root(), ((PythonPyc27.PyObject.PyString) (this.value))._root());
                        if (!Objects.equals(((PythonPyc27.PyObject.PyString) (this.value))._parent(), this))
                            throw new ConsistencyError("value", this, ((PythonPyc27.PyObject.PyString) (this.value))._parent());
                        break;
                    }
                    case STRING_REF: {
                        if (!Objects.equals(((PythonPyc27.PyObject.StringRef) (this.value))._root(), _root()))
                            throw new ConsistencyError("value", _root(), ((PythonPyc27.PyObject.StringRef) (this.value))._root());
                        if (!Objects.equals(((PythonPyc27.PyObject.StringRef) (this.value))._parent(), this))
                            throw new ConsistencyError("value", this, ((PythonPyc27.PyObject.StringRef) (this.value))._parent());
                        break;
                    }
                    case TUPLE: {
                        if (!Objects.equals(((PythonPyc27.PyObject.Tuple) (this.value))._root(), _root()))
                            throw new ConsistencyError("value", _root(), ((PythonPyc27.PyObject.Tuple) (this.value))._root());
                        if (!Objects.equals(((PythonPyc27.PyObject.Tuple) (this.value))._parent(), this))
                            throw new ConsistencyError("value", this, ((PythonPyc27.PyObject.Tuple) (this.value))._parent());
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }
        public static class InternedString extends KaitaiStruct.ReadWrite {
            public static InternedString fromFile(String fileName) throws IOException {
                return new InternedString(new ByteBufferKaitaiStream(fileName));
            }
            public InternedString() {
                this(null, null, null);
            }

            public InternedString(KaitaiStream _io) {
                this(_io, null, null);
            }

            public InternedString(KaitaiStream _io, PythonPyc27.PyObject _parent) {
                this(_io, _parent, null);
            }

            public InternedString(KaitaiStream _io, PythonPyc27.PyObject _parent, PythonPyc27 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.length = this._io.readU4le();
                this.data = new String(this._io.readBytes(length()), StandardCharsets.UTF_8);
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4le(this.length);
                this._io.writeBytes((this.data).getBytes(Charset.forName("UTF-8")));
            }

            public void _check() {
                if ((this.data).getBytes(Charset.forName("UTF-8")).length != length())
                    throw new ConsistencyError("data", length(), (this.data).getBytes(Charset.forName("UTF-8")).length);
                _dirty = false;
            }
            private long length;
            private String data;
            private PythonPyc27 _root;
            private PythonPyc27.PyObject _parent;
            public long length() { return length; }
            public void setLength(long _v) { _dirty = true; length = _v; }
            public String data() { return data; }
            public void setData(String _v) { _dirty = true; data = _v; }
            public PythonPyc27 _root() { return _root; }
            public void set_root(PythonPyc27 _v) { _dirty = true; _root = _v; }
            public PythonPyc27.PyObject _parent() { return _parent; }
            public void set_parent(PythonPyc27.PyObject _v) { _dirty = true; _parent = _v; }
        }
        public static class PyFalse extends KaitaiStruct.ReadWrite {
            public static PyFalse fromFile(String fileName) throws IOException {
                return new PyFalse(new ByteBufferKaitaiStream(fileName));
            }
            public PyFalse() {
                this(null, null, null);
            }

            public PyFalse(KaitaiStream _io) {
                this(_io, null, null);
            }

            public PyFalse(KaitaiStream _io, PythonPyc27.PyObject _parent) {
                this(_io, _parent, null);
            }

            public PyFalse(KaitaiStream _io, PythonPyc27.PyObject _parent, PythonPyc27 _root) {
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
            private PythonPyc27 _root;
            private PythonPyc27.PyObject _parent;
            public PythonPyc27 _root() { return _root; }
            public void set_root(PythonPyc27 _v) { _dirty = true; _root = _v; }
            public PythonPyc27.PyObject _parent() { return _parent; }
            public void set_parent(PythonPyc27.PyObject _v) { _dirty = true; _parent = _v; }
        }
        public static class PyNone extends KaitaiStruct.ReadWrite {
            public static PyNone fromFile(String fileName) throws IOException {
                return new PyNone(new ByteBufferKaitaiStream(fileName));
            }
            public PyNone() {
                this(null, null, null);
            }

            public PyNone(KaitaiStream _io) {
                this(_io, null, null);
            }

            public PyNone(KaitaiStream _io, PythonPyc27.PyObject _parent) {
                this(_io, _parent, null);
            }

            public PyNone(KaitaiStream _io, PythonPyc27.PyObject _parent, PythonPyc27 _root) {
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
            private PythonPyc27 _root;
            private PythonPyc27.PyObject _parent;
            public PythonPyc27 _root() { return _root; }
            public void set_root(PythonPyc27 _v) { _dirty = true; _root = _v; }
            public PythonPyc27.PyObject _parent() { return _parent; }
            public void set_parent(PythonPyc27.PyObject _v) { _dirty = true; _parent = _v; }
        }
        public static class PyString extends KaitaiStruct.ReadWrite {
            public static PyString fromFile(String fileName) throws IOException {
                return new PyString(new ByteBufferKaitaiStream(fileName));
            }
            public PyString() {
                this(null, null, null);
            }

            public PyString(KaitaiStream _io) {
                this(_io, null, null);
            }

            public PyString(KaitaiStream _io, PythonPyc27.PyObject _parent) {
                this(_io, _parent, null);
            }

            public PyString(KaitaiStream _io, PythonPyc27.PyObject _parent, PythonPyc27 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.length = this._io.readU4le();
                this.data = this._io.readBytes(length());
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4le(this.length);
                this._io.writeBytes(this.data);
            }

            public void _check() {
                if (this.data.length != length())
                    throw new ConsistencyError("data", length(), this.data.length);
                _dirty = false;
            }
            private long length;
            private byte[] data;
            private PythonPyc27 _root;
            private PythonPyc27.PyObject _parent;
            public long length() { return length; }
            public void setLength(long _v) { _dirty = true; length = _v; }
            public byte[] data() { return data; }
            public void setData(byte[] _v) { _dirty = true; data = _v; }
            public PythonPyc27 _root() { return _root; }
            public void set_root(PythonPyc27 _v) { _dirty = true; _root = _v; }
            public PythonPyc27.PyObject _parent() { return _parent; }
            public void set_parent(PythonPyc27.PyObject _v) { _dirty = true; _parent = _v; }
        }
        public static class PyTrue extends KaitaiStruct.ReadWrite {
            public static PyTrue fromFile(String fileName) throws IOException {
                return new PyTrue(new ByteBufferKaitaiStream(fileName));
            }
            public PyTrue() {
                this(null, null, null);
            }

            public PyTrue(KaitaiStream _io) {
                this(_io, null, null);
            }

            public PyTrue(KaitaiStream _io, PythonPyc27.PyObject _parent) {
                this(_io, _parent, null);
            }

            public PyTrue(KaitaiStream _io, PythonPyc27.PyObject _parent, PythonPyc27 _root) {
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
            private PythonPyc27 _root;
            private PythonPyc27.PyObject _parent;
            public PythonPyc27 _root() { return _root; }
            public void set_root(PythonPyc27 _v) { _dirty = true; _root = _v; }
            public PythonPyc27.PyObject _parent() { return _parent; }
            public void set_parent(PythonPyc27.PyObject _v) { _dirty = true; _parent = _v; }
        }
        public static class StringRef extends KaitaiStruct.ReadWrite {
            public static StringRef fromFile(String fileName) throws IOException {
                return new StringRef(new ByteBufferKaitaiStream(fileName));
            }
            public StringRef() {
                this(null, null, null);
            }

            public StringRef(KaitaiStream _io) {
                this(_io, null, null);
            }

            public StringRef(KaitaiStream _io, PythonPyc27.PyObject _parent) {
                this(_io, _parent, null);
            }

            public StringRef(KaitaiStream _io, PythonPyc27.PyObject _parent, PythonPyc27 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.internedListIndex = this._io.readU4le();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4le(this.internedListIndex);
            }

            public void _check() {
                _dirty = false;
            }
            private long internedListIndex;
            private PythonPyc27 _root;
            private PythonPyc27.PyObject _parent;
            public long internedListIndex() { return internedListIndex; }
            public void setInternedListIndex(long _v) { _dirty = true; internedListIndex = _v; }
            public PythonPyc27 _root() { return _root; }
            public void set_root(PythonPyc27 _v) { _dirty = true; _root = _v; }
            public PythonPyc27.PyObject _parent() { return _parent; }
            public void set_parent(PythonPyc27.PyObject _v) { _dirty = true; _parent = _v; }
        }
        public static class Tuple extends KaitaiStruct.ReadWrite {
            public static Tuple fromFile(String fileName) throws IOException {
                return new Tuple(new ByteBufferKaitaiStream(fileName));
            }
            public Tuple() {
                this(null, null, null);
            }

            public Tuple(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Tuple(KaitaiStream _io, PythonPyc27.PyObject _parent) {
                this(_io, _parent, null);
            }

            public Tuple(KaitaiStream _io, PythonPyc27.PyObject _parent, PythonPyc27 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.count = this._io.readU4le();
                this.items = new ArrayList<PyObject>();
                for (int i = 0; i < count(); i++) {
                    PyObject _t_items = new PyObject(this._io, this, _root);
                    try {
                        _t_items._read();
                    } finally {
                        this.items.add(_t_items);
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.items.size(); i++) {
                    this.items.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4le(this.count);
                for (int i = 0; i < this.items.size(); i++) {
                    this.items.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }

            public void _check() {
                if (this.items.size() != count())
                    throw new ConsistencyError("items", count(), this.items.size());
                for (int i = 0; i < this.items.size(); i++) {
                    if (!Objects.equals(this.items.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("items", _root(), this.items.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.items.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("items", this, this.items.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }
            private long count;
            private List<PyObject> items;
            private PythonPyc27 _root;
            private PythonPyc27.PyObject _parent;
            public long count() { return count; }
            public void setCount(long _v) { _dirty = true; count = _v; }
            public List<PyObject> items() { return items; }
            public void setItems(List<PyObject> _v) { _dirty = true; items = _v; }
            public PythonPyc27 _root() { return _root; }
            public void set_root(PythonPyc27 _v) { _dirty = true; _root = _v; }
            public PythonPyc27.PyObject _parent() { return _parent; }
            public void set_parent(PythonPyc27.PyObject _v) { _dirty = true; _parent = _v; }
        }
        public static class UnicodeString extends KaitaiStruct.ReadWrite {
            public static UnicodeString fromFile(String fileName) throws IOException {
                return new UnicodeString(new ByteBufferKaitaiStream(fileName));
            }
            public UnicodeString() {
                this(null, null, null);
            }

            public UnicodeString(KaitaiStream _io) {
                this(_io, null, null);
            }

            public UnicodeString(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                this(_io, _parent, null);
            }

            public UnicodeString(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, PythonPyc27 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.length = this._io.readU4le();
                this.data = new String(this._io.readBytes(length()), StandardCharsets.UTF_8);
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4le(this.length);
                this._io.writeBytes((this.data).getBytes(Charset.forName("UTF-8")));
            }

            public void _check() {
                if ((this.data).getBytes(Charset.forName("UTF-8")).length != length())
                    throw new ConsistencyError("data", length(), (this.data).getBytes(Charset.forName("UTF-8")).length);
                _dirty = false;
            }
            private long length;
            private String data;
            private PythonPyc27 _root;
            private KaitaiStruct.ReadWrite _parent;
            public long length() { return length; }
            public void setLength(long _v) { _dirty = true; length = _v; }
            public String data() { return data; }
            public void setData(String _v) { _dirty = true; data = _v; }
            public PythonPyc27 _root() { return _root; }
            public void set_root(PythonPyc27 _v) { _dirty = true; _root = _v; }
            public KaitaiStruct.ReadWrite _parent() { return _parent; }
            public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
        }
        private ObjectType type;
        private Object value;
        private PythonPyc27 _root;
        private KaitaiStruct.ReadWrite _parent;
        public ObjectType type() { return type; }
        public void setType(ObjectType _v) { _dirty = true; type = _v; }
        public Object value() { return value; }
        public void setValue(Object _v) { _dirty = true; value = _v; }
        public PythonPyc27 _root() { return _root; }
        public void set_root(PythonPyc27 _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    private Version versionMagic;
    private int crlf;
    private long modificationTimestamp;
    private PyObject body;
    private PythonPyc27 _root;
    private KaitaiStruct.ReadWrite _parent;
    public Version versionMagic() { return versionMagic; }
    public void setVersionMagic(Version _v) { _dirty = true; versionMagic = _v; }
    public int crlf() { return crlf; }
    public void setCrlf(int _v) { _dirty = true; crlf = _v; }
    public long modificationTimestamp() { return modificationTimestamp; }
    public void setModificationTimestamp(long _v) { _dirty = true; modificationTimestamp = _v; }
    public PyObject body() { return body; }
    public void setBody(PyObject _v) { _dirty = true; body = _v; }
    public PythonPyc27 _root() { return _root; }
    public void set_root(PythonPyc27 _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}

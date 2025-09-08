// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.StandardCharsets;


/**
 * Python interpreter runs .py files in 2 step process: first, it
 * produces bytecode, which it then executes. Translation of .py source
 * into bytecode is time-consuming, so Python dumps compiled bytecode
 * into .pyc files, to be reused from cache at later time if possible.
 * 
 * .pyc file is essentially a raw dump of `py_object` (see `body`) with
 * a simple header prepended.
 */
public class PythonPyc27 extends KaitaiStruct {
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

    public PythonPyc27(KaitaiStream _io) {
        this(_io, null, null);
    }

    public PythonPyc27(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public PythonPyc27(KaitaiStream _io, KaitaiStruct _parent, PythonPyc27 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.versionMagic = Version.byId(this._io.readU2le());
        this.crlf = this._io.readU2le();
        this.modificationTimestamp = this._io.readU4le();
        this.body = new PyObject(this._io, this, _root);
    }

    public void _fetchInstances() {
        this.body._fetchInstances();
    }
    public static class Assembly extends KaitaiStruct {
        public static Assembly fromFile(String fileName) throws IOException {
            return new Assembly(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.stringMagic = this._io.readBytes(1);
            if (!(Arrays.equals(this.stringMagic, new byte[] { 115 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 115 }, this.stringMagic, this._io, "/types/assembly/seq/0");
            }
            this.length = this._io.readU4le();
            KaitaiStream _io_items = this._io.substream(length());
            this.items = new OpArgs(_io_items, this, _root);
        }

        public void _fetchInstances() {
            this.items._fetchInstances();
        }
        private byte[] stringMagic;
        private long length;
        private OpArgs items;
        private PythonPyc27 _root;
        private PythonPyc27.CodeObject _parent;
        public byte[] stringMagic() { return stringMagic; }
        public long length() { return length; }
        public OpArgs items() { return items; }
        public PythonPyc27 _root() { return _root; }
        public PythonPyc27.CodeObject _parent() { return _parent; }
    }
    public static class CodeObject extends KaitaiStruct {
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
            _read();
        }
        private void _read() {
            this.argCount = this._io.readU4le();
            this.localCount = this._io.readU4le();
            this.stackSize = this._io.readU4le();
            this.flags = FlagsEnum.byId(this._io.readU4le());
            this.code = new Assembly(this._io, this, _root);
            this.consts = new PyObject(this._io, this, _root);
            this.names = new PyObject(this._io, this, _root);
            this.varNames = new PyObject(this._io, this, _root);
            this.freeVars = new PyObject(this._io, this, _root);
            this.cellVars = new PyObject(this._io, this, _root);
            this.filename = new PyObject(this._io, this, _root);
            this.name = new PyObject(this._io, this, _root);
            this.firstLineNo = this._io.readU4le();
            this.lnotab = new PyObject(this._io, this, _root);
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
        public long localCount() { return localCount; }
        public long stackSize() { return stackSize; }
        public FlagsEnum flags() { return flags; }
        public Assembly code() { return code; }
        public PyObject consts() { return consts; }
        public PyObject names() { return names; }
        public PyObject varNames() { return varNames; }
        public PyObject freeVars() { return freeVars; }
        public PyObject cellVars() { return cellVars; }
        public PyObject filename() { return filename; }
        public PyObject name() { return name; }
        public long firstLineNo() { return firstLineNo; }
        public PyObject lnotab() { return lnotab; }
        public PythonPyc27 _root() { return _root; }
        public PythonPyc27.PyObject _parent() { return _parent; }
    }
    public static class OpArg extends KaitaiStruct {
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
            _read();
        }
        private void _read() {
            this.opCode = OpCodeEnum.byId(this._io.readU1());
            if (opCode().id() >= OpCodeEnum.STORE_NAME.id()) {
                this.arg = this._io.readU2le();
            }
        }

        public void _fetchInstances() {
            if (opCode().id() >= OpCodeEnum.STORE_NAME.id()) {
            }
        }
        private OpCodeEnum opCode;
        private Integer arg;
        private PythonPyc27 _root;
        private PythonPyc27.OpArgs _parent;
        public OpCodeEnum opCode() { return opCode; }
        public Integer arg() { return arg; }
        public PythonPyc27 _root() { return _root; }
        public PythonPyc27.OpArgs _parent() { return _parent; }
    }
    public static class OpArgs extends KaitaiStruct {
        public static OpArgs fromFile(String fileName) throws IOException {
            return new OpArgs(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.items = new ArrayList<OpArg>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.items.add(new OpArg(this._io, this, _root));
                    i++;
                }
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.items.size(); i++) {
                this.items.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private List<OpArg> items;
        private PythonPyc27 _root;
        private PythonPyc27.Assembly _parent;
        public List<OpArg> items() { return items; }
        public PythonPyc27 _root() { return _root; }
        public PythonPyc27.Assembly _parent() { return _parent; }
    }
    public static class PyObject extends KaitaiStruct {
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

        public PyObject(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PyObject(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public PyObject(KaitaiStream _io, KaitaiStruct _parent, PythonPyc27 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.type = ObjectType.byId(this._io.readU1());
            {
                ObjectType on = type();
                if (on != null) {
                    switch (type()) {
                    case CODE_OBJECT: {
                        this.value = new CodeObject(this._io, this, _root);
                        break;
                    }
                    case INT: {
                        this.value = ((Object) (this._io.readU4le()));
                        break;
                    }
                    case INTERNED: {
                        this.value = new InternedString(this._io, this, _root);
                        break;
                    }
                    case NONE: {
                        this.value = new PyNone(this._io, this, _root);
                        break;
                    }
                    case PY_FALSE: {
                        this.value = new PyFalse(this._io, this, _root);
                        break;
                    }
                    case PY_TRUE: {
                        this.value = new PyTrue(this._io, this, _root);
                        break;
                    }
                    case STRING: {
                        this.value = new PyString(this._io, this, _root);
                        break;
                    }
                    case STRING_REF: {
                        this.value = new StringRef(this._io, this, _root);
                        break;
                    }
                    case TUPLE: {
                        this.value = new Tuple(this._io, this, _root);
                        break;
                    }
                    }
                }
            }
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
        public static class InternedString extends KaitaiStruct {
            public static InternedString fromFile(String fileName) throws IOException {
                return new InternedString(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.length = this._io.readU4le();
                this.data = new String(this._io.readBytes(length()), StandardCharsets.UTF_8);
            }

            public void _fetchInstances() {
            }
            private long length;
            private String data;
            private PythonPyc27 _root;
            private PythonPyc27.PyObject _parent;
            public long length() { return length; }
            public String data() { return data; }
            public PythonPyc27 _root() { return _root; }
            public PythonPyc27.PyObject _parent() { return _parent; }
        }
        public static class PyFalse extends KaitaiStruct {
            public static PyFalse fromFile(String fileName) throws IOException {
                return new PyFalse(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
            }

            public void _fetchInstances() {
            }
            private PythonPyc27 _root;
            private PythonPyc27.PyObject _parent;
            public PythonPyc27 _root() { return _root; }
            public PythonPyc27.PyObject _parent() { return _parent; }
        }
        public static class PyNone extends KaitaiStruct {
            public static PyNone fromFile(String fileName) throws IOException {
                return new PyNone(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
            }

            public void _fetchInstances() {
            }
            private PythonPyc27 _root;
            private PythonPyc27.PyObject _parent;
            public PythonPyc27 _root() { return _root; }
            public PythonPyc27.PyObject _parent() { return _parent; }
        }
        public static class PyString extends KaitaiStruct {
            public static PyString fromFile(String fileName) throws IOException {
                return new PyString(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.length = this._io.readU4le();
                this.data = this._io.readBytes(length());
            }

            public void _fetchInstances() {
            }
            private long length;
            private byte[] data;
            private PythonPyc27 _root;
            private PythonPyc27.PyObject _parent;
            public long length() { return length; }
            public byte[] data() { return data; }
            public PythonPyc27 _root() { return _root; }
            public PythonPyc27.PyObject _parent() { return _parent; }
        }
        public static class PyTrue extends KaitaiStruct {
            public static PyTrue fromFile(String fileName) throws IOException {
                return new PyTrue(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
            }

            public void _fetchInstances() {
            }
            private PythonPyc27 _root;
            private PythonPyc27.PyObject _parent;
            public PythonPyc27 _root() { return _root; }
            public PythonPyc27.PyObject _parent() { return _parent; }
        }
        public static class StringRef extends KaitaiStruct {
            public static StringRef fromFile(String fileName) throws IOException {
                return new StringRef(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.internedListIndex = this._io.readU4le();
            }

            public void _fetchInstances() {
            }
            private long internedListIndex;
            private PythonPyc27 _root;
            private PythonPyc27.PyObject _parent;
            public long internedListIndex() { return internedListIndex; }
            public PythonPyc27 _root() { return _root; }
            public PythonPyc27.PyObject _parent() { return _parent; }
        }
        public static class Tuple extends KaitaiStruct {
            public static Tuple fromFile(String fileName) throws IOException {
                return new Tuple(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.count = this._io.readU4le();
                this.items = new ArrayList<PyObject>();
                for (int i = 0; i < count(); i++) {
                    this.items.add(new PyObject(this._io, this, _root));
                }
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.items.size(); i++) {
                    this.items.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
            private long count;
            private List<PyObject> items;
            private PythonPyc27 _root;
            private PythonPyc27.PyObject _parent;
            public long count() { return count; }
            public List<PyObject> items() { return items; }
            public PythonPyc27 _root() { return _root; }
            public PythonPyc27.PyObject _parent() { return _parent; }
        }
        public static class UnicodeString extends KaitaiStruct {
            public static UnicodeString fromFile(String fileName) throws IOException {
                return new UnicodeString(new ByteBufferKaitaiStream(fileName));
            }

            public UnicodeString(KaitaiStream _io) {
                this(_io, null, null);
            }

            public UnicodeString(KaitaiStream _io, KaitaiStruct _parent) {
                this(_io, _parent, null);
            }

            public UnicodeString(KaitaiStream _io, KaitaiStruct _parent, PythonPyc27 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.length = this._io.readU4le();
                this.data = new String(this._io.readBytes(length()), StandardCharsets.UTF_8);
            }

            public void _fetchInstances() {
            }
            private long length;
            private String data;
            private PythonPyc27 _root;
            private KaitaiStruct _parent;
            public long length() { return length; }
            public String data() { return data; }
            public PythonPyc27 _root() { return _root; }
            public KaitaiStruct _parent() { return _parent; }
        }
        private ObjectType type;
        private Object value;
        private PythonPyc27 _root;
        private KaitaiStruct _parent;
        public ObjectType type() { return type; }
        public Object value() { return value; }
        public PythonPyc27 _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    private Version versionMagic;
    private int crlf;
    private long modificationTimestamp;
    private PyObject body;
    private PythonPyc27 _root;
    private KaitaiStruct _parent;
    public Version versionMagic() { return versionMagic; }
    public int crlf() { return crlf; }
    public long modificationTimestamp() { return modificationTimestamp; }
    public PyObject body() { return body; }
    public PythonPyc27 _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;


/**
 * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-6.html">Source</a>
 */
public class JavaBytecode extends KaitaiStruct {
    public static JavaBytecode fromFile(String fileName) throws IOException {
        return new JavaBytecode(new ByteBufferKaitaiStream(fileName));
    }

    public enum Opcodes {
        NOP(0),
        ACONST_NULL(1),
        ICONST_M1(2),
        ICONST_0(3),
        ICONST_1(4),
        ICONST_2(5),
        ICONST_3(6),
        ICONST_4(7),
        ICONST_5(8),
        LCONST_0(9),
        LCONST_1(10),
        FCONST_0(11),
        FCONST_1(12),
        FCONST_2(13),
        DCONST_0(14),
        DCONST_1(15),
        BIPUSH(16),
        SIPUSH(17),
        LDC(18),
        LDC_W(19),
        LDC2_W(20),
        ILOAD(21),
        LLOAD(22),
        FLOAD(23),
        DLOAD(24),
        ALOAD(25),
        ILOAD_0(26),
        ILOAD_1(27),
        ILOAD_2(28),
        ILOAD_3(29),
        LLOAD_0(30),
        LLOAD_1(31),
        LLOAD_2(32),
        LLOAD_3(33),
        FLOAD_0(34),
        FLOAD_1(35),
        FLOAD_2(36),
        FLOAD_3(37),
        DLOAD_0(38),
        DLOAD_1(39),
        DLOAD_2(40),
        DLOAD_3(41),
        ALOAD_0(42),
        ALOAD_1(43),
        ALOAD_2(44),
        ALOAD_3(45),
        IALOAD(46),
        LALOAD(47),
        FALOAD(48),
        DALOAD(49),
        AALOAD(50),
        BALOAD(51),
        CALOAD(52),
        SALOAD(53),
        ISTORE(54),
        LSTORE(55),
        FSTORE(56),
        DSTORE(57),
        ASTORE(58),
        ISTORE_0(59),
        ISTORE_1(60),
        ISTORE_2(61),
        ISTORE_3(62),
        LSTORE_0(63),
        LSTORE_1(64),
        LSTORE_2(65),
        LSTORE_3(66),
        FSTORE_0(67),
        FSTORE_1(68),
        FSTORE_2(69),
        FSTORE_3(70),
        DSTORE_0(71),
        DSTORE_1(72),
        DSTORE_2(73),
        DSTORE_3(74),
        ASTORE_0(75),
        ASTORE_1(76),
        ASTORE_2(77),
        ASTORE_3(78),
        IASTORE(79),
        LASTORE(80),
        FASTORE(81),
        DASTORE(82),
        AASTORE(83),
        BASTORE(84),
        CASTORE(85),
        SASTORE(86),
        POP(87),
        POP2(88),
        DUP(89),
        DUP_X1(90),
        DUP_X2(91),
        DUP2(92),
        DUP2_X1(93),
        DUP2_X2(94),
        SWAP(95),
        IADD(96),
        LADD(97),
        FADD(98),
        DADD(99),
        ISUB(100),
        LSUB(101),
        FSUB(102),
        DSUB(103),
        IMUL(104),
        LMUL(105),
        FMUL(106),
        DMUL(107),
        IDIV(108),
        LDIV(109),
        FDIV(110),
        DDIV(111),
        IREM(112),
        LREM(113),
        FREM(114),
        DREM(115),
        INEG(116),
        LNEG(117),
        FNEG(118),
        DNEG(119),
        ISHL(120),
        LSHL(121),
        ISHR(122),
        LSHR(123),
        IUSHR(124),
        LUSHR(125),
        IAND(126),
        LAND(127),
        IOR(128),
        LOR(129),
        IXOR(130),
        LXOR(131),
        IINC(132),
        I2L(133),
        I2F(134),
        I2D(135),
        L2I(136),
        L2F(137),
        L2D(138),
        F2I(139),
        F2L(140),
        F2D(141),
        D2I(142),
        D2L(143),
        D2F(144),
        I2B(145),
        I2C(146),
        I2S(147),
        LCMP(148),
        FCMPL(149),
        FCMPG(150),
        DCMPL(151),
        DCMPG(152),
        IFEQ(153),
        IFNE(154),
        IFLT(155),
        IFGE(156),
        IFGT(157),
        IFLE(158),
        IF_ICMPEQ(159),
        IF_ICMPNE(160),
        IF_ICMPLT(161),
        IF_ICMPGE(162),
        IF_ICMPGT(163),
        IF_ICMPLE(164),
        IF_ACMPEQ(165),
        IF_ACMPNE(166),
        GOTO(167),
        JSR(168),
        RET(169),
        TABLESWITCH(170),
        LOOKUPSWITCH(171),
        IRETURN(172),
        LRETURN(173),
        FRETURN(174),
        DRETURN(175),
        ARETURN(176),
        RETURN(177),
        GETSTATIC(178),
        PUTSTATIC(179),
        GETFIELD(180),
        PUTFIELD(181),
        INVOKEVIRTUAL(182),
        INVOKESPECIAL(183),
        INVOKESTATIC(184),
        INVOKEINTERFACE(185),
        INVOKEDYNAMIC(186),
        NEW(187),
        NEWARRAY(188),
        ANEWARRAY(189),
        ARRAYLENGTH(190),
        ATHROW(191),
        CHECKCAST(192),
        INSTANCEOF(193),
        MONITORENTER(194),
        MONITOREXIT(195),
        WIDE(196),
        MULTIANEWARRAY(197),
        IFNULL(198),
        IFNONNULL(199),
        GOTO_W(200),
        JSR_W(201),
        BREAKPOINT(202),
        IMPDEP1(254),
        IMPDEP2(255);

        private final long id;
        Opcodes(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Opcodes> byId = new HashMap<Long, Opcodes>(205);
        static {
            for (Opcodes e : Opcodes.values())
                byId.put(e.id(), e);
        }
        public static Opcodes byId(long id) { return byId.get(id); }
    }

    public JavaBytecode(KaitaiStream _io) {
        this(_io, null, null);
    }

    public JavaBytecode(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public JavaBytecode(KaitaiStream _io, KaitaiStruct _parent, JavaBytecode _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.instructions = new ArrayList<Inst>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.instructions.add(new Inst(this._io, this, _root));
                i++;
            }
        }
    }
    public static class Inst extends KaitaiStruct {
        public static Inst fromFile(String fileName) throws IOException {
            return new Inst(new ByteBufferKaitaiStream(fileName));
        }

        public Inst(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Inst(KaitaiStream _io, JavaBytecode _parent) {
            this(_io, _parent, null);
        }

        public Inst(KaitaiStream _io, JavaBytecode _parent, JavaBytecode _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.opcode = JavaBytecode.Opcodes.byId(this._io.readU1());
            {
                Opcodes on = opcode();
                if (on != null) {
                    switch (opcode()) {
                    case FLOAD: {
                        this.arg = (Object) (this._io.readU1());
                        break;
                    }
                    case LDC: {
                        this.arg = (Object) (this._io.readU1());
                        break;
                    }
                    case LLOAD: {
                        this.arg = (Object) (this._io.readU1());
                        break;
                    }
                    case NEW: {
                        this.arg = (Object) (this._io.readU2be());
                        break;
                    }
                    case JSR: {
                        this.arg = (Object) (this._io.readS2be());
                        break;
                    }
                    case GETSTATIC: {
                        this.arg = (Object) (this._io.readU2be());
                        break;
                    }
                    case ILOAD: {
                        this.arg = (Object) (this._io.readU1());
                        break;
                    }
                    case LDC2_W: {
                        this.arg = (Object) (this._io.readU2be());
                        break;
                    }
                    case DLOAD: {
                        this.arg = (Object) (this._io.readU1());
                        break;
                    }
                    case GOTO: {
                        this.arg = (Object) (this._io.readS2be());
                        break;
                    }
                    case LDC_W: {
                        this.arg = (Object) (this._io.readU2be());
                        break;
                    }
                    case INVOKEVIRTUAL: {
                        this.arg = (Object) (this._io.readU2be());
                        break;
                    }
                    case SIPUSH: {
                        this.arg = (Object) (this._io.readS2be());
                        break;
                    }
                    case NEWARRAY: {
                        this.arg = new ArgNewarray(this._io, this, _root);
                        break;
                    }
                    case INVOKESTATIC: {
                        this.arg = (Object) (this._io.readU2be());
                        break;
                    }
                    case INVOKEINTERFACE: {
                        this.arg = new ArgInvokeinterface(this._io, this, _root);
                        break;
                    }
                    case BIPUSH: {
                        this.arg = (Object) (this._io.readS1());
                        break;
                    }
                    case INVOKESPECIAL: {
                        this.arg = (Object) (this._io.readU2be());
                        break;
                    }
                    case JSR_W: {
                        this.arg = (Object) (this._io.readS4be());
                        break;
                    }
                    case GOTO_W: {
                        this.arg = (Object) (this._io.readS4be());
                        break;
                    }
                    }
                }
            }
        }
        private Opcodes opcode;
        private Object arg;
        private JavaBytecode _root;
        private JavaBytecode _parent;
        public Opcodes opcode() { return opcode; }
        public Object arg() { return arg; }
        public JavaBytecode _root() { return _root; }
        public JavaBytecode _parent() { return _parent; }
    }
    public static class ArgInvokeinterface extends KaitaiStruct {
        public static ArgInvokeinterface fromFile(String fileName) throws IOException {
            return new ArgInvokeinterface(new ByteBufferKaitaiStream(fileName));
        }

        public ArgInvokeinterface(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ArgInvokeinterface(KaitaiStream _io, JavaBytecode.Inst _parent) {
            this(_io, _parent, null);
        }

        public ArgInvokeinterface(KaitaiStream _io, JavaBytecode.Inst _parent, JavaBytecode _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.methodIndex = this._io.readU2be();
            this.count = this._io.readU1();
            this.reserved = this._io.ensureFixedContents(new byte[] { 0 });
        }
        private int methodIndex;
        private int count;
        private byte[] reserved;
        private JavaBytecode _root;
        private JavaBytecode.Inst _parent;
        public int methodIndex() { return methodIndex; }
        public int count() { return count; }
        public byte[] reserved() { return reserved; }
        public JavaBytecode _root() { return _root; }
        public JavaBytecode.Inst _parent() { return _parent; }
    }

    /**
     * @see <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-6.html#jvms-6.5.newarray">Source</a>
     */
    public static class ArgNewarray extends KaitaiStruct {
        public static ArgNewarray fromFile(String fileName) throws IOException {
            return new ArgNewarray(new ByteBufferKaitaiStream(fileName));
        }

        public enum PrimTypes {
            T_BOOLEAN(4),
            T_CHAR(5),
            T_FLOAT(6),
            T_DOUBLE(7),
            T_BYTE(8),
            T_SHORT(9),
            T_INT(10),
            T_LONG(11);

            private final long id;
            PrimTypes(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, PrimTypes> byId = new HashMap<Long, PrimTypes>(8);
            static {
                for (PrimTypes e : PrimTypes.values())
                    byId.put(e.id(), e);
            }
            public static PrimTypes byId(long id) { return byId.get(id); }
        }

        public ArgNewarray(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ArgNewarray(KaitaiStream _io, JavaBytecode.Inst _parent) {
            this(_io, _parent, null);
        }

        public ArgNewarray(KaitaiStream _io, JavaBytecode.Inst _parent, JavaBytecode _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.atype = PrimTypes.byId(this._io.readU1());
        }
        private PrimTypes atype;
        private JavaBytecode _root;
        private JavaBytecode.Inst _parent;
        public PrimTypes atype() { return atype; }
        public JavaBytecode _root() { return _root; }
        public JavaBytecode.Inst _parent() { return _parent; }
    }
    private ArrayList<Inst> instructions;
    private JavaBytecode _root;
    private KaitaiStruct _parent;
    public ArrayList<Inst> instructions() { return instructions; }
    public JavaBytecode _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

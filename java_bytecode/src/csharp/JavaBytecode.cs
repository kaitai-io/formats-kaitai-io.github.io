// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <remarks>
    /// Reference: <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-6.html">Source</a>
    /// </remarks>
    public partial class JavaBytecode : KaitaiStruct
    {
        public static JavaBytecode FromFile(string fileName)
        {
            return new JavaBytecode(new KaitaiStream(fileName));
        }


        public enum Opcodes
        {
            Nop = 0,
            AconstNull = 1,
            IconstM1 = 2,
            Iconst0 = 3,
            Iconst1 = 4,
            Iconst2 = 5,
            Iconst3 = 6,
            Iconst4 = 7,
            Iconst5 = 8,
            Lconst0 = 9,
            Lconst1 = 10,
            Fconst0 = 11,
            Fconst1 = 12,
            Fconst2 = 13,
            Dconst0 = 14,
            Dconst1 = 15,
            Bipush = 16,
            Sipush = 17,
            Ldc = 18,
            LdcW = 19,
            Ldc2W = 20,
            Iload = 21,
            Lload = 22,
            Fload = 23,
            Dload = 24,
            Aload = 25,
            Iload0 = 26,
            Iload1 = 27,
            Iload2 = 28,
            Iload3 = 29,
            Lload0 = 30,
            Lload1 = 31,
            Lload2 = 32,
            Lload3 = 33,
            Fload0 = 34,
            Fload1 = 35,
            Fload2 = 36,
            Fload3 = 37,
            Dload0 = 38,
            Dload1 = 39,
            Dload2 = 40,
            Dload3 = 41,
            Aload0 = 42,
            Aload1 = 43,
            Aload2 = 44,
            Aload3 = 45,
            Iaload = 46,
            Laload = 47,
            Faload = 48,
            Daload = 49,
            Aaload = 50,
            Baload = 51,
            Caload = 52,
            Saload = 53,
            Istore = 54,
            Lstore = 55,
            Fstore = 56,
            Dstore = 57,
            Astore = 58,
            Istore0 = 59,
            Istore1 = 60,
            Istore2 = 61,
            Istore3 = 62,
            Lstore0 = 63,
            Lstore1 = 64,
            Lstore2 = 65,
            Lstore3 = 66,
            Fstore0 = 67,
            Fstore1 = 68,
            Fstore2 = 69,
            Fstore3 = 70,
            Dstore0 = 71,
            Dstore1 = 72,
            Dstore2 = 73,
            Dstore3 = 74,
            Astore0 = 75,
            Astore1 = 76,
            Astore2 = 77,
            Astore3 = 78,
            Iastore = 79,
            Lastore = 80,
            Fastore = 81,
            Dastore = 82,
            Aastore = 83,
            Bastore = 84,
            Castore = 85,
            Sastore = 86,
            Pop = 87,
            Pop2 = 88,
            Dup = 89,
            DupX1 = 90,
            DupX2 = 91,
            Dup2 = 92,
            Dup2X1 = 93,
            Dup2X2 = 94,
            Swap = 95,
            Iadd = 96,
            Ladd = 97,
            Fadd = 98,
            Dadd = 99,
            Isub = 100,
            Lsub = 101,
            Fsub = 102,
            Dsub = 103,
            Imul = 104,
            Lmul = 105,
            Fmul = 106,
            Dmul = 107,
            Idiv = 108,
            Ldiv = 109,
            Fdiv = 110,
            Ddiv = 111,
            Irem = 112,
            Lrem = 113,
            Frem = 114,
            Drem = 115,
            Ineg = 116,
            Lneg = 117,
            Fneg = 118,
            Dneg = 119,
            Ishl = 120,
            Lshl = 121,
            Ishr = 122,
            Lshr = 123,
            Iushr = 124,
            Lushr = 125,
            Iand = 126,
            Land = 127,
            Ior = 128,
            Lor = 129,
            Ixor = 130,
            Lxor = 131,
            Iinc = 132,
            I2l = 133,
            I2f = 134,
            I2d = 135,
            L2i = 136,
            L2f = 137,
            L2d = 138,
            F2i = 139,
            F2l = 140,
            F2d = 141,
            D2i = 142,
            D2l = 143,
            D2f = 144,
            I2b = 145,
            I2c = 146,
            I2s = 147,
            Lcmp = 148,
            Fcmpl = 149,
            Fcmpg = 150,
            Dcmpl = 151,
            Dcmpg = 152,
            Ifeq = 153,
            Ifne = 154,
            Iflt = 155,
            Ifge = 156,
            Ifgt = 157,
            Ifle = 158,
            IfIcmpeq = 159,
            IfIcmpne = 160,
            IfIcmplt = 161,
            IfIcmpge = 162,
            IfIcmpgt = 163,
            IfIcmple = 164,
            IfAcmpeq = 165,
            IfAcmpne = 166,
            Goto = 167,
            Jsr = 168,
            Ret = 169,
            Tableswitch = 170,
            Lookupswitch = 171,
            Ireturn = 172,
            Lreturn = 173,
            Freturn = 174,
            Dreturn = 175,
            Areturn = 176,
            Return = 177,
            Getstatic = 178,
            Putstatic = 179,
            Getfield = 180,
            Putfield = 181,
            Invokevirtual = 182,
            Invokespecial = 183,
            Invokestatic = 184,
            Invokeinterface = 185,
            Invokedynamic = 186,
            New = 187,
            Newarray = 188,
            Anewarray = 189,
            Arraylength = 190,
            Athrow = 191,
            Checkcast = 192,
            Instanceof = 193,
            Monitorenter = 194,
            Monitorexit = 195,
            Wide = 196,
            Multianewarray = 197,
            Ifnull = 198,
            Ifnonnull = 199,
            GotoW = 200,
            JsrW = 201,
            Breakpoint = 202,
            Impdep1 = 254,
            Impdep2 = 255,
        }
        public JavaBytecode(KaitaiStream p__io, KaitaiStruct p__parent = null, JavaBytecode p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _instructions = new List<Inst>();
            {
                var i = 0;
                while (!m_io.IsEof) {
                    _instructions.Add(new Inst(m_io, this, m_root));
                    i++;
                }
            }
        }
        public partial class Inst : KaitaiStruct
        {
            public static Inst FromFile(string fileName)
            {
                return new Inst(new KaitaiStream(fileName));
            }

            public Inst(KaitaiStream p__io, JavaBytecode p__parent = null, JavaBytecode p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _opcode = ((JavaBytecode.Opcodes) m_io.ReadU1());
                switch (Opcode) {
                case JavaBytecode.Opcodes.Fload: {
                    _arg = m_io.ReadU1();
                    break;
                }
                case JavaBytecode.Opcodes.Ldc: {
                    _arg = m_io.ReadU1();
                    break;
                }
                case JavaBytecode.Opcodes.Lload: {
                    _arg = m_io.ReadU1();
                    break;
                }
                case JavaBytecode.Opcodes.New: {
                    _arg = m_io.ReadU2be();
                    break;
                }
                case JavaBytecode.Opcodes.Jsr: {
                    _arg = m_io.ReadS2be();
                    break;
                }
                case JavaBytecode.Opcodes.Getstatic: {
                    _arg = m_io.ReadU2be();
                    break;
                }
                case JavaBytecode.Opcodes.Iload: {
                    _arg = m_io.ReadU1();
                    break;
                }
                case JavaBytecode.Opcodes.Ldc2W: {
                    _arg = m_io.ReadU2be();
                    break;
                }
                case JavaBytecode.Opcodes.Dload: {
                    _arg = m_io.ReadU1();
                    break;
                }
                case JavaBytecode.Opcodes.Goto: {
                    _arg = m_io.ReadS2be();
                    break;
                }
                case JavaBytecode.Opcodes.LdcW: {
                    _arg = m_io.ReadU2be();
                    break;
                }
                case JavaBytecode.Opcodes.Invokevirtual: {
                    _arg = m_io.ReadU2be();
                    break;
                }
                case JavaBytecode.Opcodes.Sipush: {
                    _arg = m_io.ReadS2be();
                    break;
                }
                case JavaBytecode.Opcodes.Newarray: {
                    _arg = new ArgNewarray(m_io, this, m_root);
                    break;
                }
                case JavaBytecode.Opcodes.Invokestatic: {
                    _arg = m_io.ReadU2be();
                    break;
                }
                case JavaBytecode.Opcodes.Invokeinterface: {
                    _arg = new ArgInvokeinterface(m_io, this, m_root);
                    break;
                }
                case JavaBytecode.Opcodes.Bipush: {
                    _arg = m_io.ReadS1();
                    break;
                }
                case JavaBytecode.Opcodes.Invokespecial: {
                    _arg = m_io.ReadU2be();
                    break;
                }
                case JavaBytecode.Opcodes.JsrW: {
                    _arg = m_io.ReadS4be();
                    break;
                }
                case JavaBytecode.Opcodes.GotoW: {
                    _arg = m_io.ReadS4be();
                    break;
                }
                }
            }
            private Opcodes _opcode;
            private object _arg;
            private JavaBytecode m_root;
            private JavaBytecode m_parent;
            public Opcodes Opcode { get { return _opcode; } }
            public object Arg { get { return _arg; } }
            public JavaBytecode M_Root { get { return m_root; } }
            public JavaBytecode M_Parent { get { return m_parent; } }
        }
        public partial class ArgInvokeinterface : KaitaiStruct
        {
            public static ArgInvokeinterface FromFile(string fileName)
            {
                return new ArgInvokeinterface(new KaitaiStream(fileName));
            }

            public ArgInvokeinterface(KaitaiStream p__io, JavaBytecode.Inst p__parent = null, JavaBytecode p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _methodIndex = m_io.ReadU2be();
                _count = m_io.ReadU1();
                _reserved = m_io.EnsureFixedContents(new byte[] { 0 });
            }
            private ushort _methodIndex;
            private byte _count;
            private byte[] _reserved;
            private JavaBytecode m_root;
            private JavaBytecode.Inst m_parent;
            public ushort MethodIndex { get { return _methodIndex; } }
            public byte Count { get { return _count; } }
            public byte[] Reserved { get { return _reserved; } }
            public JavaBytecode M_Root { get { return m_root; } }
            public JavaBytecode.Inst M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-6.html#jvms-6.5.newarray">Source</a>
        /// </remarks>
        public partial class ArgNewarray : KaitaiStruct
        {
            public static ArgNewarray FromFile(string fileName)
            {
                return new ArgNewarray(new KaitaiStream(fileName));
            }


            public enum PrimTypes
            {
                TBoolean = 4,
                TChar = 5,
                TFloat = 6,
                TDouble = 7,
                TByte = 8,
                TShort = 9,
                TInt = 10,
                TLong = 11,
            }
            public ArgNewarray(KaitaiStream p__io, JavaBytecode.Inst p__parent = null, JavaBytecode p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _atype = ((PrimTypes) m_io.ReadU1());
            }
            private PrimTypes _atype;
            private JavaBytecode m_root;
            private JavaBytecode.Inst m_parent;
            public PrimTypes Atype { get { return _atype; } }
            public JavaBytecode M_Root { get { return m_root; } }
            public JavaBytecode.Inst M_Parent { get { return m_parent; } }
        }
        private List<Inst> _instructions;
        private JavaBytecode m_root;
        private KaitaiStruct m_parent;
        public List<Inst> Instructions { get { return _instructions; } }
        public JavaBytecode M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}

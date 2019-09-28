<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class JavaBytecode extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \JavaBytecode $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_instructions = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_instructions[] = new \JavaBytecode\Inst($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_instructions;
    public function instructions() { return $this->_m_instructions; }
}

namespace \JavaBytecode;

class Inst extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \JavaBytecode $_parent = null, \JavaBytecode $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_opcode = $this->_io->readU1();
        switch ($this->opcode()) {
            case \JavaBytecode\Opcodes::FLOAD:
                $this->_m_arg = $this->_io->readU1();
                break;
            case \JavaBytecode\Opcodes::LDC:
                $this->_m_arg = $this->_io->readU1();
                break;
            case \JavaBytecode\Opcodes::LLOAD:
                $this->_m_arg = $this->_io->readU1();
                break;
            case \JavaBytecode\Opcodes::NEW:
                $this->_m_arg = $this->_io->readU2be();
                break;
            case \JavaBytecode\Opcodes::JSR:
                $this->_m_arg = $this->_io->readS2be();
                break;
            case \JavaBytecode\Opcodes::GETSTATIC:
                $this->_m_arg = $this->_io->readU2be();
                break;
            case \JavaBytecode\Opcodes::ILOAD:
                $this->_m_arg = $this->_io->readU1();
                break;
            case \JavaBytecode\Opcodes::LDC2_W:
                $this->_m_arg = $this->_io->readU2be();
                break;
            case \JavaBytecode\Opcodes::DLOAD:
                $this->_m_arg = $this->_io->readU1();
                break;
            case \JavaBytecode\Opcodes::GOTO:
                $this->_m_arg = $this->_io->readS2be();
                break;
            case \JavaBytecode\Opcodes::LDC_W:
                $this->_m_arg = $this->_io->readU2be();
                break;
            case \JavaBytecode\Opcodes::INVOKEVIRTUAL:
                $this->_m_arg = $this->_io->readU2be();
                break;
            case \JavaBytecode\Opcodes::SIPUSH:
                $this->_m_arg = $this->_io->readS2be();
                break;
            case \JavaBytecode\Opcodes::NEWARRAY:
                $this->_m_arg = new \JavaBytecode\ArgNewarray($this->_io, $this, $this->_root);
                break;
            case \JavaBytecode\Opcodes::INVOKESTATIC:
                $this->_m_arg = $this->_io->readU2be();
                break;
            case \JavaBytecode\Opcodes::INVOKEINTERFACE:
                $this->_m_arg = new \JavaBytecode\ArgInvokeinterface($this->_io, $this, $this->_root);
                break;
            case \JavaBytecode\Opcodes::BIPUSH:
                $this->_m_arg = $this->_io->readS1();
                break;
            case \JavaBytecode\Opcodes::INVOKESPECIAL:
                $this->_m_arg = $this->_io->readU2be();
                break;
            case \JavaBytecode\Opcodes::JSR_W:
                $this->_m_arg = $this->_io->readS4be();
                break;
            case \JavaBytecode\Opcodes::GOTO_W:
                $this->_m_arg = $this->_io->readS4be();
                break;
        }
    }
    protected $_m_opcode;
    protected $_m_arg;
    public function opcode() { return $this->_m_opcode; }
    public function arg() { return $this->_m_arg; }
}

namespace \JavaBytecode;

class ArgInvokeinterface extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \JavaBytecode\Inst $_parent = null, \JavaBytecode $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_methodIndex = $this->_io->readU2be();
        $this->_m_count = $this->_io->readU1();
        $this->_m_reserved = $this->_io->ensureFixedContents("\x00");
    }
    protected $_m_methodIndex;
    protected $_m_count;
    protected $_m_reserved;
    public function methodIndex() { return $this->_m_methodIndex; }
    public function count() { return $this->_m_count; }
    public function reserved() { return $this->_m_reserved; }
}

namespace \JavaBytecode;

class ArgNewarray extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \JavaBytecode\Inst $_parent = null, \JavaBytecode $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_atype = $this->_io->readU1();
    }
    protected $_m_atype;
    public function atype() { return $this->_m_atype; }
}

namespace \JavaBytecode\ArgNewarray;

class PrimTypes {
    const T_BOOLEAN = 4;
    const T_CHAR = 5;
    const T_FLOAT = 6;
    const T_DOUBLE = 7;
    const T_BYTE = 8;
    const T_SHORT = 9;
    const T_INT = 10;
    const T_LONG = 11;
}

namespace \JavaBytecode;

class Opcodes {
    const NOP = 0;
    const ACONST_NULL = 1;
    const ICONST_M1 = 2;
    const ICONST_0 = 3;
    const ICONST_1 = 4;
    const ICONST_2 = 5;
    const ICONST_3 = 6;
    const ICONST_4 = 7;
    const ICONST_5 = 8;
    const LCONST_0 = 9;
    const LCONST_1 = 10;
    const FCONST_0 = 11;
    const FCONST_1 = 12;
    const FCONST_2 = 13;
    const DCONST_0 = 14;
    const DCONST_1 = 15;
    const BIPUSH = 16;
    const SIPUSH = 17;
    const LDC = 18;
    const LDC_W = 19;
    const LDC2_W = 20;
    const ILOAD = 21;
    const LLOAD = 22;
    const FLOAD = 23;
    const DLOAD = 24;
    const ALOAD = 25;
    const ILOAD_0 = 26;
    const ILOAD_1 = 27;
    const ILOAD_2 = 28;
    const ILOAD_3 = 29;
    const LLOAD_0 = 30;
    const LLOAD_1 = 31;
    const LLOAD_2 = 32;
    const LLOAD_3 = 33;
    const FLOAD_0 = 34;
    const FLOAD_1 = 35;
    const FLOAD_2 = 36;
    const FLOAD_3 = 37;
    const DLOAD_0 = 38;
    const DLOAD_1 = 39;
    const DLOAD_2 = 40;
    const DLOAD_3 = 41;
    const ALOAD_0 = 42;
    const ALOAD_1 = 43;
    const ALOAD_2 = 44;
    const ALOAD_3 = 45;
    const IALOAD = 46;
    const LALOAD = 47;
    const FALOAD = 48;
    const DALOAD = 49;
    const AALOAD = 50;
    const BALOAD = 51;
    const CALOAD = 52;
    const SALOAD = 53;
    const ISTORE = 54;
    const LSTORE = 55;
    const FSTORE = 56;
    const DSTORE = 57;
    const ASTORE = 58;
    const ISTORE_0 = 59;
    const ISTORE_1 = 60;
    const ISTORE_2 = 61;
    const ISTORE_3 = 62;
    const LSTORE_0 = 63;
    const LSTORE_1 = 64;
    const LSTORE_2 = 65;
    const LSTORE_3 = 66;
    const FSTORE_0 = 67;
    const FSTORE_1 = 68;
    const FSTORE_2 = 69;
    const FSTORE_3 = 70;
    const DSTORE_0 = 71;
    const DSTORE_1 = 72;
    const DSTORE_2 = 73;
    const DSTORE_3 = 74;
    const ASTORE_0 = 75;
    const ASTORE_1 = 76;
    const ASTORE_2 = 77;
    const ASTORE_3 = 78;
    const IASTORE = 79;
    const LASTORE = 80;
    const FASTORE = 81;
    const DASTORE = 82;
    const AASTORE = 83;
    const BASTORE = 84;
    const CASTORE = 85;
    const SASTORE = 86;
    const POP = 87;
    const POP2 = 88;
    const DUP = 89;
    const DUP_X1 = 90;
    const DUP_X2 = 91;
    const DUP2 = 92;
    const DUP2_X1 = 93;
    const DUP2_X2 = 94;
    const SWAP = 95;
    const IADD = 96;
    const LADD = 97;
    const FADD = 98;
    const DADD = 99;
    const ISUB = 100;
    const LSUB = 101;
    const FSUB = 102;
    const DSUB = 103;
    const IMUL = 104;
    const LMUL = 105;
    const FMUL = 106;
    const DMUL = 107;
    const IDIV = 108;
    const LDIV = 109;
    const FDIV = 110;
    const DDIV = 111;
    const IREM = 112;
    const LREM = 113;
    const FREM = 114;
    const DREM = 115;
    const INEG = 116;
    const LNEG = 117;
    const FNEG = 118;
    const DNEG = 119;
    const ISHL = 120;
    const LSHL = 121;
    const ISHR = 122;
    const LSHR = 123;
    const IUSHR = 124;
    const LUSHR = 125;
    const IAND = 126;
    const LAND = 127;
    const IOR = 128;
    const LOR = 129;
    const IXOR = 130;
    const LXOR = 131;
    const IINC = 132;
    const I2L = 133;
    const I2F = 134;
    const I2D = 135;
    const L2I = 136;
    const L2F = 137;
    const L2D = 138;
    const F2I = 139;
    const F2L = 140;
    const F2D = 141;
    const D2I = 142;
    const D2L = 143;
    const D2F = 144;
    const I2B = 145;
    const I2C = 146;
    const I2S = 147;
    const LCMP = 148;
    const FCMPL = 149;
    const FCMPG = 150;
    const DCMPL = 151;
    const DCMPG = 152;
    const IFEQ = 153;
    const IFNE = 154;
    const IFLT = 155;
    const IFGE = 156;
    const IFGT = 157;
    const IFLE = 158;
    const IF_ICMPEQ = 159;
    const IF_ICMPNE = 160;
    const IF_ICMPLT = 161;
    const IF_ICMPGE = 162;
    const IF_ICMPGT = 163;
    const IF_ICMPLE = 164;
    const IF_ACMPEQ = 165;
    const IF_ACMPNE = 166;
    const GOTO = 167;
    const JSR = 168;
    const RET = 169;
    const TABLESWITCH = 170;
    const LOOKUPSWITCH = 171;
    const IRETURN = 172;
    const LRETURN = 173;
    const FRETURN = 174;
    const DRETURN = 175;
    const ARETURN = 176;
    const RETURN = 177;
    const GETSTATIC = 178;
    const PUTSTATIC = 179;
    const GETFIELD = 180;
    const PUTFIELD = 181;
    const INVOKEVIRTUAL = 182;
    const INVOKESPECIAL = 183;
    const INVOKESTATIC = 184;
    const INVOKEINTERFACE = 185;
    const INVOKEDYNAMIC = 186;
    const NEW = 187;
    const NEWARRAY = 188;
    const ANEWARRAY = 189;
    const ARRAYLENGTH = 190;
    const ATHROW = 191;
    const CHECKCAST = 192;
    const INSTANCEOF = 193;
    const MONITORENTER = 194;
    const MONITOREXIT = 195;
    const WIDE = 196;
    const MULTIANEWARRAY = 197;
    const IFNULL = 198;
    const IFNONNULL = 199;
    const GOTO_W = 200;
    const JSR_W = 201;
    const BREAKPOINT = 202;
    const IMPDEP1 = 254;
    const IMPDEP2 = 255;
}

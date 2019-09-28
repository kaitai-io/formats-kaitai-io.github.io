// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.JavaBytecode = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-6.html|Source}
 */

var JavaBytecode = (function() {
  JavaBytecode.Opcodes = Object.freeze({
    NOP: 0,
    ACONST_NULL: 1,
    ICONST_M1: 2,
    ICONST_0: 3,
    ICONST_1: 4,
    ICONST_2: 5,
    ICONST_3: 6,
    ICONST_4: 7,
    ICONST_5: 8,
    LCONST_0: 9,
    LCONST_1: 10,
    FCONST_0: 11,
    FCONST_1: 12,
    FCONST_2: 13,
    DCONST_0: 14,
    DCONST_1: 15,
    BIPUSH: 16,
    SIPUSH: 17,
    LDC: 18,
    LDC_W: 19,
    LDC2_W: 20,
    ILOAD: 21,
    LLOAD: 22,
    FLOAD: 23,
    DLOAD: 24,
    ALOAD: 25,
    ILOAD_0: 26,
    ILOAD_1: 27,
    ILOAD_2: 28,
    ILOAD_3: 29,
    LLOAD_0: 30,
    LLOAD_1: 31,
    LLOAD_2: 32,
    LLOAD_3: 33,
    FLOAD_0: 34,
    FLOAD_1: 35,
    FLOAD_2: 36,
    FLOAD_3: 37,
    DLOAD_0: 38,
    DLOAD_1: 39,
    DLOAD_2: 40,
    DLOAD_3: 41,
    ALOAD_0: 42,
    ALOAD_1: 43,
    ALOAD_2: 44,
    ALOAD_3: 45,
    IALOAD: 46,
    LALOAD: 47,
    FALOAD: 48,
    DALOAD: 49,
    AALOAD: 50,
    BALOAD: 51,
    CALOAD: 52,
    SALOAD: 53,
    ISTORE: 54,
    LSTORE: 55,
    FSTORE: 56,
    DSTORE: 57,
    ASTORE: 58,
    ISTORE_0: 59,
    ISTORE_1: 60,
    ISTORE_2: 61,
    ISTORE_3: 62,
    LSTORE_0: 63,
    LSTORE_1: 64,
    LSTORE_2: 65,
    LSTORE_3: 66,
    FSTORE_0: 67,
    FSTORE_1: 68,
    FSTORE_2: 69,
    FSTORE_3: 70,
    DSTORE_0: 71,
    DSTORE_1: 72,
    DSTORE_2: 73,
    DSTORE_3: 74,
    ASTORE_0: 75,
    ASTORE_1: 76,
    ASTORE_2: 77,
    ASTORE_3: 78,
    IASTORE: 79,
    LASTORE: 80,
    FASTORE: 81,
    DASTORE: 82,
    AASTORE: 83,
    BASTORE: 84,
    CASTORE: 85,
    SASTORE: 86,
    POP: 87,
    POP2: 88,
    DUP: 89,
    DUP_X1: 90,
    DUP_X2: 91,
    DUP2: 92,
    DUP2_X1: 93,
    DUP2_X2: 94,
    SWAP: 95,
    IADD: 96,
    LADD: 97,
    FADD: 98,
    DADD: 99,
    ISUB: 100,
    LSUB: 101,
    FSUB: 102,
    DSUB: 103,
    IMUL: 104,
    LMUL: 105,
    FMUL: 106,
    DMUL: 107,
    IDIV: 108,
    LDIV: 109,
    FDIV: 110,
    DDIV: 111,
    IREM: 112,
    LREM: 113,
    FREM: 114,
    DREM: 115,
    INEG: 116,
    LNEG: 117,
    FNEG: 118,
    DNEG: 119,
    ISHL: 120,
    LSHL: 121,
    ISHR: 122,
    LSHR: 123,
    IUSHR: 124,
    LUSHR: 125,
    IAND: 126,
    LAND: 127,
    IOR: 128,
    LOR: 129,
    IXOR: 130,
    LXOR: 131,
    IINC: 132,
    I2L: 133,
    I2F: 134,
    I2D: 135,
    L2I: 136,
    L2F: 137,
    L2D: 138,
    F2I: 139,
    F2L: 140,
    F2D: 141,
    D2I: 142,
    D2L: 143,
    D2F: 144,
    I2B: 145,
    I2C: 146,
    I2S: 147,
    LCMP: 148,
    FCMPL: 149,
    FCMPG: 150,
    DCMPL: 151,
    DCMPG: 152,
    IFEQ: 153,
    IFNE: 154,
    IFLT: 155,
    IFGE: 156,
    IFGT: 157,
    IFLE: 158,
    IF_ICMPEQ: 159,
    IF_ICMPNE: 160,
    IF_ICMPLT: 161,
    IF_ICMPGE: 162,
    IF_ICMPGT: 163,
    IF_ICMPLE: 164,
    IF_ACMPEQ: 165,
    IF_ACMPNE: 166,
    GOTO: 167,
    JSR: 168,
    RET: 169,
    TABLESWITCH: 170,
    LOOKUPSWITCH: 171,
    IRETURN: 172,
    LRETURN: 173,
    FRETURN: 174,
    DRETURN: 175,
    ARETURN: 176,
    RETURN: 177,
    GETSTATIC: 178,
    PUTSTATIC: 179,
    GETFIELD: 180,
    PUTFIELD: 181,
    INVOKEVIRTUAL: 182,
    INVOKESPECIAL: 183,
    INVOKESTATIC: 184,
    INVOKEINTERFACE: 185,
    INVOKEDYNAMIC: 186,
    NEW: 187,
    NEWARRAY: 188,
    ANEWARRAY: 189,
    ARRAYLENGTH: 190,
    ATHROW: 191,
    CHECKCAST: 192,
    INSTANCEOF: 193,
    MONITORENTER: 194,
    MONITOREXIT: 195,
    WIDE: 196,
    MULTIANEWARRAY: 197,
    IFNULL: 198,
    IFNONNULL: 199,
    GOTO_W: 200,
    JSR_W: 201,
    BREAKPOINT: 202,
    IMPDEP1: 254,
    IMPDEP2: 255,

    0: "NOP",
    1: "ACONST_NULL",
    2: "ICONST_M1",
    3: "ICONST_0",
    4: "ICONST_1",
    5: "ICONST_2",
    6: "ICONST_3",
    7: "ICONST_4",
    8: "ICONST_5",
    9: "LCONST_0",
    10: "LCONST_1",
    11: "FCONST_0",
    12: "FCONST_1",
    13: "FCONST_2",
    14: "DCONST_0",
    15: "DCONST_1",
    16: "BIPUSH",
    17: "SIPUSH",
    18: "LDC",
    19: "LDC_W",
    20: "LDC2_W",
    21: "ILOAD",
    22: "LLOAD",
    23: "FLOAD",
    24: "DLOAD",
    25: "ALOAD",
    26: "ILOAD_0",
    27: "ILOAD_1",
    28: "ILOAD_2",
    29: "ILOAD_3",
    30: "LLOAD_0",
    31: "LLOAD_1",
    32: "LLOAD_2",
    33: "LLOAD_3",
    34: "FLOAD_0",
    35: "FLOAD_1",
    36: "FLOAD_2",
    37: "FLOAD_3",
    38: "DLOAD_0",
    39: "DLOAD_1",
    40: "DLOAD_2",
    41: "DLOAD_3",
    42: "ALOAD_0",
    43: "ALOAD_1",
    44: "ALOAD_2",
    45: "ALOAD_3",
    46: "IALOAD",
    47: "LALOAD",
    48: "FALOAD",
    49: "DALOAD",
    50: "AALOAD",
    51: "BALOAD",
    52: "CALOAD",
    53: "SALOAD",
    54: "ISTORE",
    55: "LSTORE",
    56: "FSTORE",
    57: "DSTORE",
    58: "ASTORE",
    59: "ISTORE_0",
    60: "ISTORE_1",
    61: "ISTORE_2",
    62: "ISTORE_3",
    63: "LSTORE_0",
    64: "LSTORE_1",
    65: "LSTORE_2",
    66: "LSTORE_3",
    67: "FSTORE_0",
    68: "FSTORE_1",
    69: "FSTORE_2",
    70: "FSTORE_3",
    71: "DSTORE_0",
    72: "DSTORE_1",
    73: "DSTORE_2",
    74: "DSTORE_3",
    75: "ASTORE_0",
    76: "ASTORE_1",
    77: "ASTORE_2",
    78: "ASTORE_3",
    79: "IASTORE",
    80: "LASTORE",
    81: "FASTORE",
    82: "DASTORE",
    83: "AASTORE",
    84: "BASTORE",
    85: "CASTORE",
    86: "SASTORE",
    87: "POP",
    88: "POP2",
    89: "DUP",
    90: "DUP_X1",
    91: "DUP_X2",
    92: "DUP2",
    93: "DUP2_X1",
    94: "DUP2_X2",
    95: "SWAP",
    96: "IADD",
    97: "LADD",
    98: "FADD",
    99: "DADD",
    100: "ISUB",
    101: "LSUB",
    102: "FSUB",
    103: "DSUB",
    104: "IMUL",
    105: "LMUL",
    106: "FMUL",
    107: "DMUL",
    108: "IDIV",
    109: "LDIV",
    110: "FDIV",
    111: "DDIV",
    112: "IREM",
    113: "LREM",
    114: "FREM",
    115: "DREM",
    116: "INEG",
    117: "LNEG",
    118: "FNEG",
    119: "DNEG",
    120: "ISHL",
    121: "LSHL",
    122: "ISHR",
    123: "LSHR",
    124: "IUSHR",
    125: "LUSHR",
    126: "IAND",
    127: "LAND",
    128: "IOR",
    129: "LOR",
    130: "IXOR",
    131: "LXOR",
    132: "IINC",
    133: "I2L",
    134: "I2F",
    135: "I2D",
    136: "L2I",
    137: "L2F",
    138: "L2D",
    139: "F2I",
    140: "F2L",
    141: "F2D",
    142: "D2I",
    143: "D2L",
    144: "D2F",
    145: "I2B",
    146: "I2C",
    147: "I2S",
    148: "LCMP",
    149: "FCMPL",
    150: "FCMPG",
    151: "DCMPL",
    152: "DCMPG",
    153: "IFEQ",
    154: "IFNE",
    155: "IFLT",
    156: "IFGE",
    157: "IFGT",
    158: "IFLE",
    159: "IF_ICMPEQ",
    160: "IF_ICMPNE",
    161: "IF_ICMPLT",
    162: "IF_ICMPGE",
    163: "IF_ICMPGT",
    164: "IF_ICMPLE",
    165: "IF_ACMPEQ",
    166: "IF_ACMPNE",
    167: "GOTO",
    168: "JSR",
    169: "RET",
    170: "TABLESWITCH",
    171: "LOOKUPSWITCH",
    172: "IRETURN",
    173: "LRETURN",
    174: "FRETURN",
    175: "DRETURN",
    176: "ARETURN",
    177: "RETURN",
    178: "GETSTATIC",
    179: "PUTSTATIC",
    180: "GETFIELD",
    181: "PUTFIELD",
    182: "INVOKEVIRTUAL",
    183: "INVOKESPECIAL",
    184: "INVOKESTATIC",
    185: "INVOKEINTERFACE",
    186: "INVOKEDYNAMIC",
    187: "NEW",
    188: "NEWARRAY",
    189: "ANEWARRAY",
    190: "ARRAYLENGTH",
    191: "ATHROW",
    192: "CHECKCAST",
    193: "INSTANCEOF",
    194: "MONITORENTER",
    195: "MONITOREXIT",
    196: "WIDE",
    197: "MULTIANEWARRAY",
    198: "IFNULL",
    199: "IFNONNULL",
    200: "GOTO_W",
    201: "JSR_W",
    202: "BREAKPOINT",
    254: "IMPDEP1",
    255: "IMPDEP2",
  });

  function JavaBytecode(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  JavaBytecode.prototype._read = function() {
    this.instructions = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.instructions.push(new Inst(this._io, this, this._root));
      i++;
    }
  }

  var Inst = JavaBytecode.Inst = (function() {
    function Inst(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Inst.prototype._read = function() {
      this.opcode = this._io.readU1();
      switch (this.opcode) {
      case JavaBytecode.Opcodes.FLOAD:
        this.arg = this._io.readU1();
        break;
      case JavaBytecode.Opcodes.LDC:
        this.arg = this._io.readU1();
        break;
      case JavaBytecode.Opcodes.LLOAD:
        this.arg = this._io.readU1();
        break;
      case JavaBytecode.Opcodes.NEW:
        this.arg = this._io.readU2be();
        break;
      case JavaBytecode.Opcodes.JSR:
        this.arg = this._io.readS2be();
        break;
      case JavaBytecode.Opcodes.GETSTATIC:
        this.arg = this._io.readU2be();
        break;
      case JavaBytecode.Opcodes.ILOAD:
        this.arg = this._io.readU1();
        break;
      case JavaBytecode.Opcodes.LDC2_W:
        this.arg = this._io.readU2be();
        break;
      case JavaBytecode.Opcodes.DLOAD:
        this.arg = this._io.readU1();
        break;
      case JavaBytecode.Opcodes.GOTO:
        this.arg = this._io.readS2be();
        break;
      case JavaBytecode.Opcodes.LDC_W:
        this.arg = this._io.readU2be();
        break;
      case JavaBytecode.Opcodes.INVOKEVIRTUAL:
        this.arg = this._io.readU2be();
        break;
      case JavaBytecode.Opcodes.SIPUSH:
        this.arg = this._io.readS2be();
        break;
      case JavaBytecode.Opcodes.NEWARRAY:
        this.arg = new ArgNewarray(this._io, this, this._root);
        break;
      case JavaBytecode.Opcodes.INVOKESTATIC:
        this.arg = this._io.readU2be();
        break;
      case JavaBytecode.Opcodes.INVOKEINTERFACE:
        this.arg = new ArgInvokeinterface(this._io, this, this._root);
        break;
      case JavaBytecode.Opcodes.BIPUSH:
        this.arg = this._io.readS1();
        break;
      case JavaBytecode.Opcodes.INVOKESPECIAL:
        this.arg = this._io.readU2be();
        break;
      case JavaBytecode.Opcodes.JSR_W:
        this.arg = this._io.readS4be();
        break;
      case JavaBytecode.Opcodes.GOTO_W:
        this.arg = this._io.readS4be();
        break;
      }
    }

    return Inst;
  })();

  var ArgInvokeinterface = JavaBytecode.ArgInvokeinterface = (function() {
    function ArgInvokeinterface(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ArgInvokeinterface.prototype._read = function() {
      this.methodIndex = this._io.readU2be();
      this.count = this._io.readU1();
      this.reserved = this._io.ensureFixedContents([0]);
    }

    return ArgInvokeinterface;
  })();

  /**
   * @see {@link https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-6.html#jvms-6.5.newarray|Source}
   */

  var ArgNewarray = JavaBytecode.ArgNewarray = (function() {
    ArgNewarray.PrimTypes = Object.freeze({
      T_BOOLEAN: 4,
      T_CHAR: 5,
      T_FLOAT: 6,
      T_DOUBLE: 7,
      T_BYTE: 8,
      T_SHORT: 9,
      T_INT: 10,
      T_LONG: 11,

      4: "T_BOOLEAN",
      5: "T_CHAR",
      6: "T_FLOAT",
      7: "T_DOUBLE",
      8: "T_BYTE",
      9: "T_SHORT",
      10: "T_INT",
      11: "T_LONG",
    });

    function ArgNewarray(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ArgNewarray.prototype._read = function() {
      this.atype = this._io.readU1();
    }

    return ArgNewarray;
  })();

  return JavaBytecode;
})();
return JavaBytecode;
}));

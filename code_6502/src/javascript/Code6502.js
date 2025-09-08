// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Code6502 || (root.Code6502 = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Code6502_, KaitaiStream) {
/**
 * This spec can be used to disassemble raw stream of 6502 CPU machine
 * code into individual operations. Each operation includes an opcode
 * and, optionally, an argument. Register arguments are part of the
 * `opcode` enum.
 */

var Code6502 = (function() {
  Code6502.Opcode = Object.freeze({
    BRK_IMPL: 0,
    ORA_X_IND: 1,
    ORA_ZPG: 5,
    ASL_ZPG: 6,
    PHP_IMPL: 8,
    ORA_IMM: 9,
    ASL_A: 10,
    ORA_ABS: 13,
    ASL_ABS: 14,
    BPL_REL: 16,
    ORA_IND_Y: 17,
    ORA_ZPG_X: 21,
    ASL_ZPG_X: 22,
    CLC_IMPL: 24,
    ORA_ABS_Y: 25,
    ORA_ABS_X: 29,
    ASL_ABS_X: 30,
    JSR_ABS: 32,
    AND_X_IND: 33,
    BIT_ZPG: 36,
    AND_ZPG: 37,
    ROL_ZPG: 38,
    PLP_IMPL: 40,
    AND_IMM: 41,
    ROL_A: 42,
    BIT_ABS: 44,
    AND_ABS: 45,
    ROL_ABS: 46,
    BMI_REL: 48,
    AND_IND_Y: 49,
    AND_ZPG_X: 53,
    ROL_ZPG_X: 54,
    SEC_IMPL: 56,
    AND_ABS_Y: 57,
    AND_ABS_X: 61,
    ROL_ABS_X: 62,
    RTI_IMPL: 64,
    EOR_X_IND: 65,
    EOR_ZPG: 69,
    LSR_ZPG: 70,
    PHA_IMPL: 72,
    EOR_IMM: 73,
    LSR_A: 74,
    JMP_ABS: 76,
    EOR_ABS: 77,
    LSR_ABS: 78,
    BVC_REL: 80,
    EOR_IND_Y: 81,
    EOR_ZPG_X: 85,
    LSR_ZPG_X: 86,
    CLI_IMPL: 88,
    EOR_ABS_Y: 89,
    EOR_ABS_X: 93,
    LSR_ABS_X: 94,
    RTS_IMPL: 96,
    ADC_X_IND: 97,
    ADC_ZPG: 101,
    ROR_ZPG: 102,
    PLA_IMPL: 104,
    ADC_IMM: 105,
    ROR_A: 106,
    JMP_IND: 108,
    ADC_ABS: 109,
    ROR_ABS: 110,
    BVS_REL: 112,
    ADC_IND_Y: 113,
    ADC_ZPG_X: 117,
    ROR_ZPG_X: 118,
    SEI_IMPL: 120,
    ADC_ABS_Y: 121,
    ADC_ABS_X: 125,
    ROR_ABS_X: 126,
    STA_X_IND: 129,
    STY_ZPG: 132,
    STA_ZPG: 133,
    STX_ZPG: 134,
    DEY_IMPL: 136,
    TXA_IMPL: 138,
    STY_ABS: 140,
    STA_ABS: 141,
    STX_ABS: 142,
    BCC_REL: 144,
    STA_IND_Y: 145,
    STY_ZPG_X: 148,
    STA_ZPG_X: 149,
    STX_ZPG_Y: 150,
    TYA_IMPL: 152,
    STA_ABS_Y: 153,
    TXS_IMPL: 154,
    STA_ABS_X: 157,
    LDY_IMM: 160,
    LDA_X_IND: 161,
    LDX_IMM: 162,
    LDY_ZPG: 164,
    LDA_ZPG: 165,
    LDX_ZPG: 166,
    TAY_IMPL: 168,
    LDA_IMM: 169,
    TAX_IMPL: 170,
    LDY_ABS: 172,
    LDA_ABS: 173,
    LDX_ABS: 174,
    BCS_REL: 176,
    LDA_IND_Y: 177,
    LDY_ZPG_X: 180,
    LDA_ZPG_X: 181,
    LDX_ZPG_Y: 182,
    CLV_IMPL: 184,
    LDA_ABS_Y: 185,
    TSX_IMPL: 186,
    LDY_ABS_X: 188,
    LDA_ABS_X: 189,
    LDX_ABS_Y: 190,
    CPY_IMM: 192,
    CMP_X_IND: 193,
    CPY_ZPG: 196,
    CMP_ZPG: 197,
    DEC_ZPG: 198,
    INY_IMPL: 200,
    CMP_IMM: 201,
    DEX_IMPL: 202,
    CPY_ABS: 204,
    CMP_ABS: 205,
    DEC_ABS: 206,
    BNE_REL: 208,
    CMP_IND_Y: 209,
    CMP_ZPG_X: 213,
    DEC_ZPG_X: 214,
    CLD_IMPL: 216,
    CMP_ABS_Y: 217,
    CMP_ABS_X: 221,
    DEC_ABS_X: 222,
    CPX_IMM: 224,
    SBC_X_IND: 225,
    CPX_ZPG: 228,
    SBC_ZPG: 229,
    INC_ZPG: 230,
    INX_IMPL: 232,
    SBC_IMM: 233,
    NOP_IMPL: 234,
    CPX_ABS: 236,
    SBC_ABS: 237,
    INC_ABS: 238,
    BEQ_REL: 240,
    SBC_IND_Y: 241,
    SBC_ZPG_X: 245,
    INC_ZPG_X: 246,
    SED_IMPL: 248,
    SBC_ABS_Y: 249,
    SBC_ABS_X: 253,
    INC_ABS_X: 254,

    0: "BRK_IMPL",
    1: "ORA_X_IND",
    5: "ORA_ZPG",
    6: "ASL_ZPG",
    8: "PHP_IMPL",
    9: "ORA_IMM",
    10: "ASL_A",
    13: "ORA_ABS",
    14: "ASL_ABS",
    16: "BPL_REL",
    17: "ORA_IND_Y",
    21: "ORA_ZPG_X",
    22: "ASL_ZPG_X",
    24: "CLC_IMPL",
    25: "ORA_ABS_Y",
    29: "ORA_ABS_X",
    30: "ASL_ABS_X",
    32: "JSR_ABS",
    33: "AND_X_IND",
    36: "BIT_ZPG",
    37: "AND_ZPG",
    38: "ROL_ZPG",
    40: "PLP_IMPL",
    41: "AND_IMM",
    42: "ROL_A",
    44: "BIT_ABS",
    45: "AND_ABS",
    46: "ROL_ABS",
    48: "BMI_REL",
    49: "AND_IND_Y",
    53: "AND_ZPG_X",
    54: "ROL_ZPG_X",
    56: "SEC_IMPL",
    57: "AND_ABS_Y",
    61: "AND_ABS_X",
    62: "ROL_ABS_X",
    64: "RTI_IMPL",
    65: "EOR_X_IND",
    69: "EOR_ZPG",
    70: "LSR_ZPG",
    72: "PHA_IMPL",
    73: "EOR_IMM",
    74: "LSR_A",
    76: "JMP_ABS",
    77: "EOR_ABS",
    78: "LSR_ABS",
    80: "BVC_REL",
    81: "EOR_IND_Y",
    85: "EOR_ZPG_X",
    86: "LSR_ZPG_X",
    88: "CLI_IMPL",
    89: "EOR_ABS_Y",
    93: "EOR_ABS_X",
    94: "LSR_ABS_X",
    96: "RTS_IMPL",
    97: "ADC_X_IND",
    101: "ADC_ZPG",
    102: "ROR_ZPG",
    104: "PLA_IMPL",
    105: "ADC_IMM",
    106: "ROR_A",
    108: "JMP_IND",
    109: "ADC_ABS",
    110: "ROR_ABS",
    112: "BVS_REL",
    113: "ADC_IND_Y",
    117: "ADC_ZPG_X",
    118: "ROR_ZPG_X",
    120: "SEI_IMPL",
    121: "ADC_ABS_Y",
    125: "ADC_ABS_X",
    126: "ROR_ABS_X",
    129: "STA_X_IND",
    132: "STY_ZPG",
    133: "STA_ZPG",
    134: "STX_ZPG",
    136: "DEY_IMPL",
    138: "TXA_IMPL",
    140: "STY_ABS",
    141: "STA_ABS",
    142: "STX_ABS",
    144: "BCC_REL",
    145: "STA_IND_Y",
    148: "STY_ZPG_X",
    149: "STA_ZPG_X",
    150: "STX_ZPG_Y",
    152: "TYA_IMPL",
    153: "STA_ABS_Y",
    154: "TXS_IMPL",
    157: "STA_ABS_X",
    160: "LDY_IMM",
    161: "LDA_X_IND",
    162: "LDX_IMM",
    164: "LDY_ZPG",
    165: "LDA_ZPG",
    166: "LDX_ZPG",
    168: "TAY_IMPL",
    169: "LDA_IMM",
    170: "TAX_IMPL",
    172: "LDY_ABS",
    173: "LDA_ABS",
    174: "LDX_ABS",
    176: "BCS_REL",
    177: "LDA_IND_Y",
    180: "LDY_ZPG_X",
    181: "LDA_ZPG_X",
    182: "LDX_ZPG_Y",
    184: "CLV_IMPL",
    185: "LDA_ABS_Y",
    186: "TSX_IMPL",
    188: "LDY_ABS_X",
    189: "LDA_ABS_X",
    190: "LDX_ABS_Y",
    192: "CPY_IMM",
    193: "CMP_X_IND",
    196: "CPY_ZPG",
    197: "CMP_ZPG",
    198: "DEC_ZPG",
    200: "INY_IMPL",
    201: "CMP_IMM",
    202: "DEX_IMPL",
    204: "CPY_ABS",
    205: "CMP_ABS",
    206: "DEC_ABS",
    208: "BNE_REL",
    209: "CMP_IND_Y",
    213: "CMP_ZPG_X",
    214: "DEC_ZPG_X",
    216: "CLD_IMPL",
    217: "CMP_ABS_Y",
    221: "CMP_ABS_X",
    222: "DEC_ABS_X",
    224: "CPX_IMM",
    225: "SBC_X_IND",
    228: "CPX_ZPG",
    229: "SBC_ZPG",
    230: "INC_ZPG",
    232: "INX_IMPL",
    233: "SBC_IMM",
    234: "NOP_IMPL",
    236: "CPX_ABS",
    237: "SBC_ABS",
    238: "INC_ABS",
    240: "BEQ_REL",
    241: "SBC_IND_Y",
    245: "SBC_ZPG_X",
    246: "INC_ZPG_X",
    248: "SED_IMPL",
    249: "SBC_ABS_Y",
    253: "SBC_ABS_X",
    254: "INC_ABS_X",
  });

  function Code6502(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Code6502.prototype._read = function() {
    this.operations = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.operations.push(new Operation(this._io, this, this._root));
      i++;
    }
  }

  var Operation = Code6502.Operation = (function() {
    function Operation(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Operation.prototype._read = function() {
      this.code = this._io.readU1();
      switch (this.code) {
      case Code6502.Opcode.ADC_ABS:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.ADC_ABS_X:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.ADC_ABS_Y:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.ADC_IMM:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.ADC_IND_Y:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.ADC_X_IND:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.ADC_ZPG:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.ADC_ZPG_X:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.AND_ABS:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.AND_ABS_X:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.AND_ABS_Y:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.AND_IMM:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.AND_IND_Y:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.AND_X_IND:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.AND_ZPG:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.AND_ZPG_X:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.ASL_ABS:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.ASL_ABS_X:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.ASL_ZPG:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.ASL_ZPG_X:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.BCC_REL:
        this.args = this._io.readS1();
        break;
      case Code6502.Opcode.BCS_REL:
        this.args = this._io.readS1();
        break;
      case Code6502.Opcode.BEQ_REL:
        this.args = this._io.readS1();
        break;
      case Code6502.Opcode.BIT_ABS:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.BIT_ZPG:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.BMI_REL:
        this.args = this._io.readS1();
        break;
      case Code6502.Opcode.BNE_REL:
        this.args = this._io.readS1();
        break;
      case Code6502.Opcode.BPL_REL:
        this.args = this._io.readS1();
        break;
      case Code6502.Opcode.BVC_REL:
        this.args = this._io.readS1();
        break;
      case Code6502.Opcode.BVS_REL:
        this.args = this._io.readS1();
        break;
      case Code6502.Opcode.CMP_ABS:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.CMP_ABS_X:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.CMP_ABS_Y:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.CMP_IMM:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.CMP_IND_Y:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.CMP_X_IND:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.CMP_ZPG:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.CMP_ZPG_X:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.CPX_ABS:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.CPX_IMM:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.CPX_ZPG:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.CPY_ABS:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.CPY_IMM:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.CPY_ZPG:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.DEC_ABS:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.DEC_ABS_X:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.DEC_ZPG:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.DEC_ZPG_X:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.EOR_ABS:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.EOR_ABS_X:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.EOR_ABS_Y:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.EOR_IMM:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.EOR_IND_Y:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.EOR_X_IND:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.EOR_ZPG:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.EOR_ZPG_X:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.INC_ABS:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.INC_ABS_X:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.INC_ZPG:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.INC_ZPG_X:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.JMP_ABS:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.JMP_IND:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.JSR_ABS:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.LDA_ABS:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.LDA_ABS_X:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.LDA_ABS_Y:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.LDA_IMM:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.LDA_IND_Y:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.LDA_X_IND:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.LDA_ZPG:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.LDA_ZPG_X:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.LDX_ABS:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.LDX_ABS_Y:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.LDX_IMM:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.LDX_ZPG:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.LDX_ZPG_Y:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.LDY_ABS:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.LDY_ABS_X:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.LDY_IMM:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.LDY_ZPG:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.LDY_ZPG_X:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.LSR_ABS:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.LSR_ABS_X:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.LSR_ZPG:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.LSR_ZPG_X:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.ORA_ABS:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.ORA_ABS_X:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.ORA_ABS_Y:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.ORA_IMM:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.ORA_IND_Y:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.ORA_X_IND:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.ORA_ZPG:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.ORA_ZPG_X:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.ROL_ABS:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.ROL_ABS_X:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.ROL_ZPG:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.ROL_ZPG_X:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.ROR_ABS:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.ROR_ABS_X:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.ROR_ZPG:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.ROR_ZPG_X:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.SBC_ABS:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.SBC_ABS_X:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.SBC_ABS_Y:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.SBC_IMM:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.SBC_IND_Y:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.SBC_X_IND:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.SBC_ZPG:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.SBC_ZPG_X:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.STA_ABS:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.STA_ABS_X:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.STA_ABS_Y:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.STA_IND_Y:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.STA_X_IND:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.STA_ZPG:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.STA_ZPG_X:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.STX_ABS:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.STX_ZPG:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.STX_ZPG_Y:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.STY_ABS:
        this.args = this._io.readU2le();
        break;
      case Code6502.Opcode.STY_ZPG:
        this.args = this._io.readU1();
        break;
      case Code6502.Opcode.STY_ZPG_X:
        this.args = this._io.readU1();
        break;
      }
    }

    return Operation;
  })();

  return Code6502;
})();
Code6502_.Code6502 = Code6502;
});

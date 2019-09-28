// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;


/**
 * This spec can be used to disassemble raw stream of 6502 CPU machine
 * code into individual operations. Each operation includes an opcode
 * and, optionally, an argument. Register arguments are part of the
 * `opcode` enum.
 */
public class Code6502 extends KaitaiStruct {
    public static Code6502 fromFile(String fileName) throws IOException {
        return new Code6502(new ByteBufferKaitaiStream(fileName));
    }

    public enum Opcode {
        BRK_IMPL(0),
        ORA_X_IND(1),
        ORA_ZPG(5),
        ASL_ZPG(6),
        PHP_IMPL(8),
        ORA_IMM(9),
        ASL_A(10),
        ORA_ABS(13),
        ASL_ABS(14),
        BPL_REL(16),
        ORA_IND_Y(17),
        ORA_ZPG_X(21),
        ASL_ZPG_X(22),
        CLC_IMPL(24),
        ORA_ABS_Y(25),
        ORA_ABS_X(29),
        ASL_ABS_X(30),
        JSR_ABS(32),
        AND_X_IND(33),
        BIT_ZPG(36),
        AND_ZPG(37),
        ROL_ZPG(38),
        PLP_IMPL(40),
        AND_IMM(41),
        ROL_A(42),
        BIT_ABS(44),
        AND_ABS(45),
        ROL_ABS(46),
        BMI_REL(48),
        AND_IND_Y(49),
        AND_ZPG_X(53),
        ROL_ZPG_X(54),
        SEC_IMPL(56),
        AND_ABS_Y(57),
        AND_ABS_X(61),
        ROL_ABS_X(62),
        RTI_IMPL(64),
        EOR_X_IND(65),
        EOR_ZPG(69),
        LSR_ZPG(70),
        PHA_IMPL(72),
        EOR_IMM(73),
        LSR_A(74),
        JMP_ABS(76),
        EOR_ABS(77),
        LSR_ABS(78),
        BVC_REL(80),
        EOR_IND_Y(81),
        EOR_ZPG_X(85),
        LSR_ZPG_X(86),
        CLI_IMPL(88),
        EOR_ABS_Y(89),
        EOR_ABS_X(93),
        LSR_ABS_X(94),
        RTS_IMPL(96),
        ADC_X_IND(97),
        ADC_ZPG(101),
        ROR_ZPG(102),
        PLA_IMPL(104),
        ADC_IMM(105),
        ROR_A(106),
        JMP_IND(108),
        ADC_ABS(109),
        ROR_ABS(110),
        BVS_REL(112),
        ADC_IND_Y(113),
        ADC_ZPG_X(117),
        ROR_ZPG_X(118),
        SEI_IMPL(120),
        ADC_ABS_Y(121),
        ADC_ABS_X(125),
        ROR_ABS_X(126),
        STA_X_IND(129),
        STY_ZPG(132),
        STA_ZPG(133),
        STX_ZPG(134),
        DEY_IMPL(136),
        TXA_IMPL(138),
        STY_ABS(140),
        STA_ABS(141),
        STX_ABS(142),
        BCC_REL(144),
        STA_IND_Y(145),
        STY_ZPG_X(148),
        STA_ZPG_X(149),
        STX_ZPG_Y(150),
        TYA_IMPL(152),
        STA_ABS_Y(153),
        TXS_IMPL(154),
        STA_ABS_X(157),
        LDY_IMM(160),
        LDA_X_IND(161),
        LDX_IMM(162),
        LDY_ZPG(164),
        LDA_ZPG(165),
        LDX_ZPG(166),
        TAY_IMPL(168),
        LDA_IMM(169),
        TAX_IMPL(170),
        LDY_ABS(172),
        LDA_ABS(173),
        LDX_ABS(174),
        BCS_REL(176),
        LDA_IND_Y(177),
        LDY_ZPG_X(180),
        LDA_ZPG_X(181),
        LDX_ZPG_Y(182),
        CLV_IMPL(184),
        LDA_ABS_Y(185),
        TSX_IMPL(186),
        LDY_ABS_X(188),
        LDA_ABS_X(189),
        LDX_ABS_Y(190),
        CPY_IMM(192),
        CMP_X_IND(193),
        CPY_ZPG(196),
        CMP_ZPG(197),
        DEC_ZPG(198),
        INY_IMPL(200),
        CMP_IMM(201),
        DEX_IMPL(202),
        CPY_ABS(204),
        CMP_ABS(205),
        DEC_ABS(206),
        BNE_REL(208),
        CMP_IND_Y(209),
        CMP_ZPG_X(213),
        DEC_ZPG_X(214),
        CLD_IMPL(216),
        CMP_ABS_Y(217),
        CMP_ABS_X(221),
        DEC_ABS_X(222),
        CPX_IMM(224),
        SBC_X_IND(225),
        CPX_ZPG(228),
        SBC_ZPG(229),
        INC_ZPG(230),
        INX_IMPL(232),
        SBC_IMM(233),
        NOP_IMPL(234),
        CPX_ABS(236),
        SBC_ABS(237),
        INC_ABS(238),
        BEQ_REL(240),
        SBC_IND_Y(241),
        SBC_ZPG_X(245),
        INC_ZPG_X(246),
        SED_IMPL(248),
        SBC_ABS_Y(249),
        SBC_ABS_X(253),
        INC_ABS_X(254);

        private final long id;
        Opcode(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Opcode> byId = new HashMap<Long, Opcode>(151);
        static {
            for (Opcode e : Opcode.values())
                byId.put(e.id(), e);
        }
        public static Opcode byId(long id) { return byId.get(id); }
    }

    public Code6502(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Code6502(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Code6502(KaitaiStream _io, KaitaiStruct _parent, Code6502 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.operations = new ArrayList<Operation>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.operations.add(new Operation(this._io, this, _root));
                i++;
            }
        }
    }
    public static class Operation extends KaitaiStruct {
        public static Operation fromFile(String fileName) throws IOException {
            return new Operation(new ByteBufferKaitaiStream(fileName));
        }

        public Operation(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Operation(KaitaiStream _io, Code6502 _parent) {
            this(_io, _parent, null);
        }

        public Operation(KaitaiStream _io, Code6502 _parent, Code6502 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.code = Code6502.Opcode.byId(this._io.readU1());
            {
                Opcode on = code();
                if (on != null) {
                    switch (code()) {
                    case BCC_REL: {
                        this.args = (int) (this._io.readS1());
                        break;
                    }
                    case ORA_IND_Y: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case LDA_IND_Y: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case CPX_ZPG: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case STA_ZPG_X: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case STA_ZPG: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case BCS_REL: {
                        this.args = (int) (this._io.readS1());
                        break;
                    }
                    case LDY_ZPG_X: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case LSR_ABS_X: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case AND_ABS_X: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case ADC_ABS: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case STA_ABS: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case BNE_REL: {
                        this.args = (int) (this._io.readS1());
                        break;
                    }
                    case LDA_IMM: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case ADC_IMM: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case LSR_ABS: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case ADC_ABS_X: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case STA_ABS_X: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case CPX_IMM: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case JMP_IND: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case ADC_ZPG: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case EOR_IMM: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case EOR_ABS_X: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case STA_X_IND: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case SBC_IMM: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case CPY_ABS: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case LDX_ABS_Y: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case ADC_ZPG_X: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case BPL_REL: {
                        this.args = (int) (this._io.readS1());
                        break;
                    }
                    case ORA_IMM: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case ROR_ABS_X: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case ADC_IND_Y: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case EOR_IND_Y: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case LDA_ABS: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case BIT_ZPG: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case ROL_ZPG: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case STY_ZPG: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case JSR_ABS: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case EOR_ZPG: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case EOR_ABS: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case LDA_ABS_Y: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case LDA_ZPG_X: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case BMI_REL: {
                        this.args = (int) (this._io.readS1());
                        break;
                    }
                    case STY_ZPG_X: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case ADC_X_IND: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case ROL_ABS_X: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case STX_ZPG: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case ASL_ABS_X: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case LSR_ZPG_X: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case ORA_ZPG_X: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case ADC_ABS_Y: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case LDY_ABS: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case CMP_ABS_X: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case LDA_ABS_X: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case BVS_REL: {
                        this.args = (int) (this._io.readS1());
                        break;
                    }
                    case LDA_X_IND: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case CMP_IMM: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case INC_ZPG_X: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case ASL_ZPG: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case AND_ABS_Y: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case LDX_IMM: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case AND_ZPG: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case CPX_ABS: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case DEC_ZPG: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case ROR_ZPG_X: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case LDX_ZPG: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case DEC_ZPG_X: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case SBC_ZPG: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case CMP_ABS: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case ROR_ZPG: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case INC_ABS: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case AND_X_IND: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case SBC_ABS_X: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case ASL_ABS: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case EOR_X_IND: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case ORA_ABS_X: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case LDY_ABS_X: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case SBC_X_IND: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case ASL_ZPG_X: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case SBC_ABS_Y: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case ROL_ABS: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case LSR_ZPG: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case STX_ZPG_Y: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case ORA_ABS_Y: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case EOR_ABS_Y: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case BIT_ABS: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case LDX_ABS: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case LDY_IMM: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case JMP_ABS: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case BEQ_REL: {
                        this.args = (int) (this._io.readS1());
                        break;
                    }
                    case DEC_ABS_X: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case AND_IND_Y: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case AND_ZPG_X: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case CMP_ZPG_X: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case EOR_ZPG_X: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case SBC_ABS: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case CMP_ABS_Y: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case SBC_IND_Y: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case CMP_ZPG: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case STX_ABS: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case STY_ABS: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case CPY_ZPG: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case DEC_ABS: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case ROR_ABS: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case STA_ABS_Y: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case INC_ABS_X: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case LDA_ZPG: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case CMP_IND_Y: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case CPY_IMM: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case LDX_ZPG_Y: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case SBC_ZPG_X: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case ORA_X_IND: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case ROL_ZPG_X: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case ORA_ABS: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case STA_IND_Y: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case AND_ABS: {
                        this.args = this._io.readU2le();
                        break;
                    }
                    case AND_IMM: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case CMP_X_IND: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case LDY_ZPG: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case INC_ZPG: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    case BVC_REL: {
                        this.args = (int) (this._io.readS1());
                        break;
                    }
                    case ORA_ZPG: {
                        this.args = (int) (this._io.readU1());
                        break;
                    }
                    }
                }
            }
        }
        private Opcode code;
        private Integer args;
        private Code6502 _root;
        private Code6502 _parent;
        public Opcode code() { return code; }
        public Integer args() { return args; }
        public Code6502 _root() { return _root; }
        public Code6502 _parent() { return _parent; }
    }
    private ArrayList<Operation> operations;
    private Code6502 _root;
    private KaitaiStruct _parent;
    public ArrayList<Operation> operations() { return operations; }
    public Code6502 _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}

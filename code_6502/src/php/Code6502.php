<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * This spec can be used to disassemble raw stream of 6502 CPU machine
 * code into individual operations. Each operation includes an opcode
 * and, optionally, an argument. Register arguments are part of the
 * `opcode` enum.
 */

class Code6502 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Code6502 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_operations = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_operations[] = new \Code6502\Operation($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_operations;
    public function operations() { return $this->_m_operations; }
}

namespace \Code6502;

class Operation extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Code6502 $_parent = null, \Code6502 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_code = $this->_io->readU1();
        switch ($this->code()) {
            case \Code6502\Opcode::BCC_REL:
                $this->_m_args = $this->_io->readS1();
                break;
            case \Code6502\Opcode::ORA_IND_Y:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::LDA_IND_Y:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::CPX_ZPG:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::STA_ZPG_X:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::STA_ZPG:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::BCS_REL:
                $this->_m_args = $this->_io->readS1();
                break;
            case \Code6502\Opcode::LDY_ZPG_X:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::LSR_ABS_X:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::AND_ABS_X:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::ADC_ABS:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::STA_ABS:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::BNE_REL:
                $this->_m_args = $this->_io->readS1();
                break;
            case \Code6502\Opcode::LDA_IMM:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::ADC_IMM:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::LSR_ABS:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::ADC_ABS_X:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::STA_ABS_X:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::CPX_IMM:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::JMP_IND:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::ADC_ZPG:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::EOR_IMM:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::EOR_ABS_X:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::STA_X_IND:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::SBC_IMM:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::CPY_ABS:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::LDX_ABS_Y:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::ADC_ZPG_X:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::BPL_REL:
                $this->_m_args = $this->_io->readS1();
                break;
            case \Code6502\Opcode::ORA_IMM:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::ROR_ABS_X:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::ADC_IND_Y:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::EOR_IND_Y:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::LDA_ABS:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::BIT_ZPG:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::ROL_ZPG:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::STY_ZPG:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::JSR_ABS:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::EOR_ZPG:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::EOR_ABS:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::LDA_ABS_Y:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::LDA_ZPG_X:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::BMI_REL:
                $this->_m_args = $this->_io->readS1();
                break;
            case \Code6502\Opcode::STY_ZPG_X:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::ADC_X_IND:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::ROL_ABS_X:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::STX_ZPG:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::ASL_ABS_X:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::LSR_ZPG_X:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::ORA_ZPG_X:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::ADC_ABS_Y:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::LDY_ABS:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::CMP_ABS_X:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::LDA_ABS_X:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::BVS_REL:
                $this->_m_args = $this->_io->readS1();
                break;
            case \Code6502\Opcode::LDA_X_IND:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::CMP_IMM:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::INC_ZPG_X:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::ASL_ZPG:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::AND_ABS_Y:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::LDX_IMM:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::AND_ZPG:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::CPX_ABS:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::DEC_ZPG:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::ROR_ZPG_X:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::LDX_ZPG:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::DEC_ZPG_X:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::SBC_ZPG:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::CMP_ABS:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::ROR_ZPG:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::INC_ABS:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::AND_X_IND:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::SBC_ABS_X:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::ASL_ABS:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::EOR_X_IND:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::ORA_ABS_X:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::LDY_ABS_X:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::SBC_X_IND:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::ASL_ZPG_X:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::SBC_ABS_Y:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::ROL_ABS:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::LSR_ZPG:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::STX_ZPG_Y:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::ORA_ABS_Y:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::EOR_ABS_Y:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::BIT_ABS:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::LDX_ABS:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::LDY_IMM:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::JMP_ABS:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::BEQ_REL:
                $this->_m_args = $this->_io->readS1();
                break;
            case \Code6502\Opcode::DEC_ABS_X:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::AND_IND_Y:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::AND_ZPG_X:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::CMP_ZPG_X:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::EOR_ZPG_X:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::SBC_ABS:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::CMP_ABS_Y:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::SBC_IND_Y:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::CMP_ZPG:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::STX_ABS:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::STY_ABS:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::CPY_ZPG:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::DEC_ABS:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::ROR_ABS:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::STA_ABS_Y:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::INC_ABS_X:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::LDA_ZPG:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::CMP_IND_Y:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::CPY_IMM:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::LDX_ZPG_Y:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::SBC_ZPG_X:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::ORA_X_IND:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::ROL_ZPG_X:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::ORA_ABS:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::STA_IND_Y:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::AND_ABS:
                $this->_m_args = $this->_io->readU2le();
                break;
            case \Code6502\Opcode::AND_IMM:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::CMP_X_IND:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::LDY_ZPG:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::INC_ZPG:
                $this->_m_args = $this->_io->readU1();
                break;
            case \Code6502\Opcode::BVC_REL:
                $this->_m_args = $this->_io->readS1();
                break;
            case \Code6502\Opcode::ORA_ZPG:
                $this->_m_args = $this->_io->readU1();
                break;
        }
    }
    protected $_m_code;
    protected $_m_args;
    public function code() { return $this->_m_code; }
    public function args() { return $this->_m_args; }
}

namespace \Code6502;

class Opcode {
    const BRK_IMPL = 0;
    const ORA_X_IND = 1;
    const ORA_ZPG = 5;
    const ASL_ZPG = 6;
    const PHP_IMPL = 8;
    const ORA_IMM = 9;
    const ASL_A = 10;
    const ORA_ABS = 13;
    const ASL_ABS = 14;
    const BPL_REL = 16;
    const ORA_IND_Y = 17;
    const ORA_ZPG_X = 21;
    const ASL_ZPG_X = 22;
    const CLC_IMPL = 24;
    const ORA_ABS_Y = 25;
    const ORA_ABS_X = 29;
    const ASL_ABS_X = 30;
    const JSR_ABS = 32;
    const AND_X_IND = 33;
    const BIT_ZPG = 36;
    const AND_ZPG = 37;
    const ROL_ZPG = 38;
    const PLP_IMPL = 40;
    const AND_IMM = 41;
    const ROL_A = 42;
    const BIT_ABS = 44;
    const AND_ABS = 45;
    const ROL_ABS = 46;
    const BMI_REL = 48;
    const AND_IND_Y = 49;
    const AND_ZPG_X = 53;
    const ROL_ZPG_X = 54;
    const SEC_IMPL = 56;
    const AND_ABS_Y = 57;
    const AND_ABS_X = 61;
    const ROL_ABS_X = 62;
    const RTI_IMPL = 64;
    const EOR_X_IND = 65;
    const EOR_ZPG = 69;
    const LSR_ZPG = 70;
    const PHA_IMPL = 72;
    const EOR_IMM = 73;
    const LSR_A = 74;
    const JMP_ABS = 76;
    const EOR_ABS = 77;
    const LSR_ABS = 78;
    const BVC_REL = 80;
    const EOR_IND_Y = 81;
    const EOR_ZPG_X = 85;
    const LSR_ZPG_X = 86;
    const CLI_IMPL = 88;
    const EOR_ABS_Y = 89;
    const EOR_ABS_X = 93;
    const LSR_ABS_X = 94;
    const RTS_IMPL = 96;
    const ADC_X_IND = 97;
    const ADC_ZPG = 101;
    const ROR_ZPG = 102;
    const PLA_IMPL = 104;
    const ADC_IMM = 105;
    const ROR_A = 106;
    const JMP_IND = 108;
    const ADC_ABS = 109;
    const ROR_ABS = 110;
    const BVS_REL = 112;
    const ADC_IND_Y = 113;
    const ADC_ZPG_X = 117;
    const ROR_ZPG_X = 118;
    const SEI_IMPL = 120;
    const ADC_ABS_Y = 121;
    const ADC_ABS_X = 125;
    const ROR_ABS_X = 126;
    const STA_X_IND = 129;
    const STY_ZPG = 132;
    const STA_ZPG = 133;
    const STX_ZPG = 134;
    const DEY_IMPL = 136;
    const TXA_IMPL = 138;
    const STY_ABS = 140;
    const STA_ABS = 141;
    const STX_ABS = 142;
    const BCC_REL = 144;
    const STA_IND_Y = 145;
    const STY_ZPG_X = 148;
    const STA_ZPG_X = 149;
    const STX_ZPG_Y = 150;
    const TYA_IMPL = 152;
    const STA_ABS_Y = 153;
    const TXS_IMPL = 154;
    const STA_ABS_X = 157;
    const LDY_IMM = 160;
    const LDA_X_IND = 161;
    const LDX_IMM = 162;
    const LDY_ZPG = 164;
    const LDA_ZPG = 165;
    const LDX_ZPG = 166;
    const TAY_IMPL = 168;
    const LDA_IMM = 169;
    const TAX_IMPL = 170;
    const LDY_ABS = 172;
    const LDA_ABS = 173;
    const LDX_ABS = 174;
    const BCS_REL = 176;
    const LDA_IND_Y = 177;
    const LDY_ZPG_X = 180;
    const LDA_ZPG_X = 181;
    const LDX_ZPG_Y = 182;
    const CLV_IMPL = 184;
    const LDA_ABS_Y = 185;
    const TSX_IMPL = 186;
    const LDY_ABS_X = 188;
    const LDA_ABS_X = 189;
    const LDX_ABS_Y = 190;
    const CPY_IMM = 192;
    const CMP_X_IND = 193;
    const CPY_ZPG = 196;
    const CMP_ZPG = 197;
    const DEC_ZPG = 198;
    const INY_IMPL = 200;
    const CMP_IMM = 201;
    const DEX_IMPL = 202;
    const CPY_ABS = 204;
    const CMP_ABS = 205;
    const DEC_ABS = 206;
    const BNE_REL = 208;
    const CMP_IND_Y = 209;
    const CMP_ZPG_X = 213;
    const DEC_ZPG_X = 214;
    const CLD_IMPL = 216;
    const CMP_ABS_Y = 217;
    const CMP_ABS_X = 221;
    const DEC_ABS_X = 222;
    const CPX_IMM = 224;
    const SBC_X_IND = 225;
    const CPX_ZPG = 228;
    const SBC_ZPG = 229;
    const INC_ZPG = 230;
    const INX_IMPL = 232;
    const SBC_IMM = 233;
    const NOP_IMPL = 234;
    const CPX_ABS = 236;
    const SBC_ABS = 237;
    const INC_ABS = 238;
    const BEQ_REL = 240;
    const SBC_IND_Y = 241;
    const SBC_ZPG_X = 245;
    const INC_ZPG_X = 246;
    const SED_IMPL = 248;
    const SBC_ABS_Y = 249;
    const SBC_ABS_X = 253;
    const INC_ABS_X = 254;
}

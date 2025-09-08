// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "code_6502.h"
const std::set<code_6502_t::opcode_t> code_6502_t::_values_opcode_t{
    code_6502_t::OPCODE_BRK_IMPL,
    code_6502_t::OPCODE_ORA_X_IND,
    code_6502_t::OPCODE_ORA_ZPG,
    code_6502_t::OPCODE_ASL_ZPG,
    code_6502_t::OPCODE_PHP_IMPL,
    code_6502_t::OPCODE_ORA_IMM,
    code_6502_t::OPCODE_ASL_A,
    code_6502_t::OPCODE_ORA_ABS,
    code_6502_t::OPCODE_ASL_ABS,
    code_6502_t::OPCODE_BPL_REL,
    code_6502_t::OPCODE_ORA_IND_Y,
    code_6502_t::OPCODE_ORA_ZPG_X,
    code_6502_t::OPCODE_ASL_ZPG_X,
    code_6502_t::OPCODE_CLC_IMPL,
    code_6502_t::OPCODE_ORA_ABS_Y,
    code_6502_t::OPCODE_ORA_ABS_X,
    code_6502_t::OPCODE_ASL_ABS_X,
    code_6502_t::OPCODE_JSR_ABS,
    code_6502_t::OPCODE_AND_X_IND,
    code_6502_t::OPCODE_BIT_ZPG,
    code_6502_t::OPCODE_AND_ZPG,
    code_6502_t::OPCODE_ROL_ZPG,
    code_6502_t::OPCODE_PLP_IMPL,
    code_6502_t::OPCODE_AND_IMM,
    code_6502_t::OPCODE_ROL_A,
    code_6502_t::OPCODE_BIT_ABS,
    code_6502_t::OPCODE_AND_ABS,
    code_6502_t::OPCODE_ROL_ABS,
    code_6502_t::OPCODE_BMI_REL,
    code_6502_t::OPCODE_AND_IND_Y,
    code_6502_t::OPCODE_AND_ZPG_X,
    code_6502_t::OPCODE_ROL_ZPG_X,
    code_6502_t::OPCODE_SEC_IMPL,
    code_6502_t::OPCODE_AND_ABS_Y,
    code_6502_t::OPCODE_AND_ABS_X,
    code_6502_t::OPCODE_ROL_ABS_X,
    code_6502_t::OPCODE_RTI_IMPL,
    code_6502_t::OPCODE_EOR_X_IND,
    code_6502_t::OPCODE_EOR_ZPG,
    code_6502_t::OPCODE_LSR_ZPG,
    code_6502_t::OPCODE_PHA_IMPL,
    code_6502_t::OPCODE_EOR_IMM,
    code_6502_t::OPCODE_LSR_A,
    code_6502_t::OPCODE_JMP_ABS,
    code_6502_t::OPCODE_EOR_ABS,
    code_6502_t::OPCODE_LSR_ABS,
    code_6502_t::OPCODE_BVC_REL,
    code_6502_t::OPCODE_EOR_IND_Y,
    code_6502_t::OPCODE_EOR_ZPG_X,
    code_6502_t::OPCODE_LSR_ZPG_X,
    code_6502_t::OPCODE_CLI_IMPL,
    code_6502_t::OPCODE_EOR_ABS_Y,
    code_6502_t::OPCODE_EOR_ABS_X,
    code_6502_t::OPCODE_LSR_ABS_X,
    code_6502_t::OPCODE_RTS_IMPL,
    code_6502_t::OPCODE_ADC_X_IND,
    code_6502_t::OPCODE_ADC_ZPG,
    code_6502_t::OPCODE_ROR_ZPG,
    code_6502_t::OPCODE_PLA_IMPL,
    code_6502_t::OPCODE_ADC_IMM,
    code_6502_t::OPCODE_ROR_A,
    code_6502_t::OPCODE_JMP_IND,
    code_6502_t::OPCODE_ADC_ABS,
    code_6502_t::OPCODE_ROR_ABS,
    code_6502_t::OPCODE_BVS_REL,
    code_6502_t::OPCODE_ADC_IND_Y,
    code_6502_t::OPCODE_ADC_ZPG_X,
    code_6502_t::OPCODE_ROR_ZPG_X,
    code_6502_t::OPCODE_SEI_IMPL,
    code_6502_t::OPCODE_ADC_ABS_Y,
    code_6502_t::OPCODE_ADC_ABS_X,
    code_6502_t::OPCODE_ROR_ABS_X,
    code_6502_t::OPCODE_STA_X_IND,
    code_6502_t::OPCODE_STY_ZPG,
    code_6502_t::OPCODE_STA_ZPG,
    code_6502_t::OPCODE_STX_ZPG,
    code_6502_t::OPCODE_DEY_IMPL,
    code_6502_t::OPCODE_TXA_IMPL,
    code_6502_t::OPCODE_STY_ABS,
    code_6502_t::OPCODE_STA_ABS,
    code_6502_t::OPCODE_STX_ABS,
    code_6502_t::OPCODE_BCC_REL,
    code_6502_t::OPCODE_STA_IND_Y,
    code_6502_t::OPCODE_STY_ZPG_X,
    code_6502_t::OPCODE_STA_ZPG_X,
    code_6502_t::OPCODE_STX_ZPG_Y,
    code_6502_t::OPCODE_TYA_IMPL,
    code_6502_t::OPCODE_STA_ABS_Y,
    code_6502_t::OPCODE_TXS_IMPL,
    code_6502_t::OPCODE_STA_ABS_X,
    code_6502_t::OPCODE_LDY_IMM,
    code_6502_t::OPCODE_LDA_X_IND,
    code_6502_t::OPCODE_LDX_IMM,
    code_6502_t::OPCODE_LDY_ZPG,
    code_6502_t::OPCODE_LDA_ZPG,
    code_6502_t::OPCODE_LDX_ZPG,
    code_6502_t::OPCODE_TAY_IMPL,
    code_6502_t::OPCODE_LDA_IMM,
    code_6502_t::OPCODE_TAX_IMPL,
    code_6502_t::OPCODE_LDY_ABS,
    code_6502_t::OPCODE_LDA_ABS,
    code_6502_t::OPCODE_LDX_ABS,
    code_6502_t::OPCODE_BCS_REL,
    code_6502_t::OPCODE_LDA_IND_Y,
    code_6502_t::OPCODE_LDY_ZPG_X,
    code_6502_t::OPCODE_LDA_ZPG_X,
    code_6502_t::OPCODE_LDX_ZPG_Y,
    code_6502_t::OPCODE_CLV_IMPL,
    code_6502_t::OPCODE_LDA_ABS_Y,
    code_6502_t::OPCODE_TSX_IMPL,
    code_6502_t::OPCODE_LDY_ABS_X,
    code_6502_t::OPCODE_LDA_ABS_X,
    code_6502_t::OPCODE_LDX_ABS_Y,
    code_6502_t::OPCODE_CPY_IMM,
    code_6502_t::OPCODE_CMP_X_IND,
    code_6502_t::OPCODE_CPY_ZPG,
    code_6502_t::OPCODE_CMP_ZPG,
    code_6502_t::OPCODE_DEC_ZPG,
    code_6502_t::OPCODE_INY_IMPL,
    code_6502_t::OPCODE_CMP_IMM,
    code_6502_t::OPCODE_DEX_IMPL,
    code_6502_t::OPCODE_CPY_ABS,
    code_6502_t::OPCODE_CMP_ABS,
    code_6502_t::OPCODE_DEC_ABS,
    code_6502_t::OPCODE_BNE_REL,
    code_6502_t::OPCODE_CMP_IND_Y,
    code_6502_t::OPCODE_CMP_ZPG_X,
    code_6502_t::OPCODE_DEC_ZPG_X,
    code_6502_t::OPCODE_CLD_IMPL,
    code_6502_t::OPCODE_CMP_ABS_Y,
    code_6502_t::OPCODE_CMP_ABS_X,
    code_6502_t::OPCODE_DEC_ABS_X,
    code_6502_t::OPCODE_CPX_IMM,
    code_6502_t::OPCODE_SBC_X_IND,
    code_6502_t::OPCODE_CPX_ZPG,
    code_6502_t::OPCODE_SBC_ZPG,
    code_6502_t::OPCODE_INC_ZPG,
    code_6502_t::OPCODE_INX_IMPL,
    code_6502_t::OPCODE_SBC_IMM,
    code_6502_t::OPCODE_NOP_IMPL,
    code_6502_t::OPCODE_CPX_ABS,
    code_6502_t::OPCODE_SBC_ABS,
    code_6502_t::OPCODE_INC_ABS,
    code_6502_t::OPCODE_BEQ_REL,
    code_6502_t::OPCODE_SBC_IND_Y,
    code_6502_t::OPCODE_SBC_ZPG_X,
    code_6502_t::OPCODE_INC_ZPG_X,
    code_6502_t::OPCODE_SED_IMPL,
    code_6502_t::OPCODE_SBC_ABS_Y,
    code_6502_t::OPCODE_SBC_ABS_X,
    code_6502_t::OPCODE_INC_ABS_X,
};
bool code_6502_t::_is_defined_opcode_t(code_6502_t::opcode_t v) {
    return code_6502_t::_values_opcode_t.find(v) != code_6502_t::_values_opcode_t.end();
}

code_6502_t::code_6502_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, code_6502_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_operations = nullptr;
    _read();
}

void code_6502_t::_read() {
    m_operations = std::unique_ptr<std::vector<std::unique_ptr<operation_t>>>(new std::vector<std::unique_ptr<operation_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_operations->push_back(std::move(std::unique_ptr<operation_t>(new operation_t(m__io, this, m__root))));
            i++;
        }
    }
}

code_6502_t::~code_6502_t() {
    _clean_up();
}

void code_6502_t::_clean_up() {
}

code_6502_t::operation_t::operation_t(kaitai::kstream* p__io, code_6502_t* p__parent, code_6502_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void code_6502_t::operation_t::_read() {
    m_code = static_cast<code_6502_t::opcode_t>(m__io->read_u1());
    n_args = true;
    switch (code()) {
    case code_6502_t::OPCODE_ADC_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_ADC_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_ADC_ABS_Y: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_ADC_IMM: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_ADC_IND_Y: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_ADC_X_IND: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_ADC_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_ADC_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_AND_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_AND_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_AND_ABS_Y: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_AND_IMM: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_AND_IND_Y: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_AND_X_IND: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_AND_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_AND_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_ASL_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_ASL_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_ASL_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_ASL_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_BCC_REL: {
        n_args = false;
        m_args = m__io->read_s1();
        break;
    }
    case code_6502_t::OPCODE_BCS_REL: {
        n_args = false;
        m_args = m__io->read_s1();
        break;
    }
    case code_6502_t::OPCODE_BEQ_REL: {
        n_args = false;
        m_args = m__io->read_s1();
        break;
    }
    case code_6502_t::OPCODE_BIT_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_BIT_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_BMI_REL: {
        n_args = false;
        m_args = m__io->read_s1();
        break;
    }
    case code_6502_t::OPCODE_BNE_REL: {
        n_args = false;
        m_args = m__io->read_s1();
        break;
    }
    case code_6502_t::OPCODE_BPL_REL: {
        n_args = false;
        m_args = m__io->read_s1();
        break;
    }
    case code_6502_t::OPCODE_BVC_REL: {
        n_args = false;
        m_args = m__io->read_s1();
        break;
    }
    case code_6502_t::OPCODE_BVS_REL: {
        n_args = false;
        m_args = m__io->read_s1();
        break;
    }
    case code_6502_t::OPCODE_CMP_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_CMP_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_CMP_ABS_Y: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_CMP_IMM: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_CMP_IND_Y: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_CMP_X_IND: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_CMP_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_CMP_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_CPX_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_CPX_IMM: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_CPX_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_CPY_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_CPY_IMM: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_CPY_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_DEC_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_DEC_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_DEC_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_DEC_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_EOR_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_EOR_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_EOR_ABS_Y: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_EOR_IMM: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_EOR_IND_Y: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_EOR_X_IND: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_EOR_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_EOR_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_INC_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_INC_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_INC_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_INC_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_JMP_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_JMP_IND: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_JSR_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_LDA_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_LDA_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_LDA_ABS_Y: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_LDA_IMM: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_LDA_IND_Y: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_LDA_X_IND: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_LDA_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_LDA_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_LDX_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_LDX_ABS_Y: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_LDX_IMM: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_LDX_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_LDX_ZPG_Y: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_LDY_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_LDY_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_LDY_IMM: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_LDY_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_LDY_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_LSR_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_LSR_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_LSR_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_LSR_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_ORA_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_ORA_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_ORA_ABS_Y: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_ORA_IMM: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_ORA_IND_Y: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_ORA_X_IND: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_ORA_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_ORA_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_ROL_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_ROL_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_ROL_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_ROL_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_ROR_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_ROR_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_ROR_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_ROR_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_SBC_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_SBC_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_SBC_ABS_Y: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_SBC_IMM: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_SBC_IND_Y: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_SBC_X_IND: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_SBC_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_SBC_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_STA_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_STA_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_STA_ABS_Y: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_STA_IND_Y: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_STA_X_IND: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_STA_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_STA_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_STX_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_STX_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_STX_ZPG_Y: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_STY_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case code_6502_t::OPCODE_STY_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case code_6502_t::OPCODE_STY_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    }
}

code_6502_t::operation_t::~operation_t() {
    _clean_up();
}

void code_6502_t::operation_t::_clean_up() {
    if (!n_args) {
    }
}

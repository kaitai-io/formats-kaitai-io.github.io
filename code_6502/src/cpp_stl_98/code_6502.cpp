// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "code_6502.h"
std::set<code_6502_t::opcode_t> code_6502_t::_build_values_opcode_t() {
    std::set<code_6502_t::opcode_t> _t;
    _t.insert(code_6502_t::OPCODE_BRK_IMPL);
    _t.insert(code_6502_t::OPCODE_ORA_X_IND);
    _t.insert(code_6502_t::OPCODE_ORA_ZPG);
    _t.insert(code_6502_t::OPCODE_ASL_ZPG);
    _t.insert(code_6502_t::OPCODE_PHP_IMPL);
    _t.insert(code_6502_t::OPCODE_ORA_IMM);
    _t.insert(code_6502_t::OPCODE_ASL_A);
    _t.insert(code_6502_t::OPCODE_ORA_ABS);
    _t.insert(code_6502_t::OPCODE_ASL_ABS);
    _t.insert(code_6502_t::OPCODE_BPL_REL);
    _t.insert(code_6502_t::OPCODE_ORA_IND_Y);
    _t.insert(code_6502_t::OPCODE_ORA_ZPG_X);
    _t.insert(code_6502_t::OPCODE_ASL_ZPG_X);
    _t.insert(code_6502_t::OPCODE_CLC_IMPL);
    _t.insert(code_6502_t::OPCODE_ORA_ABS_Y);
    _t.insert(code_6502_t::OPCODE_ORA_ABS_X);
    _t.insert(code_6502_t::OPCODE_ASL_ABS_X);
    _t.insert(code_6502_t::OPCODE_JSR_ABS);
    _t.insert(code_6502_t::OPCODE_AND_X_IND);
    _t.insert(code_6502_t::OPCODE_BIT_ZPG);
    _t.insert(code_6502_t::OPCODE_AND_ZPG);
    _t.insert(code_6502_t::OPCODE_ROL_ZPG);
    _t.insert(code_6502_t::OPCODE_PLP_IMPL);
    _t.insert(code_6502_t::OPCODE_AND_IMM);
    _t.insert(code_6502_t::OPCODE_ROL_A);
    _t.insert(code_6502_t::OPCODE_BIT_ABS);
    _t.insert(code_6502_t::OPCODE_AND_ABS);
    _t.insert(code_6502_t::OPCODE_ROL_ABS);
    _t.insert(code_6502_t::OPCODE_BMI_REL);
    _t.insert(code_6502_t::OPCODE_AND_IND_Y);
    _t.insert(code_6502_t::OPCODE_AND_ZPG_X);
    _t.insert(code_6502_t::OPCODE_ROL_ZPG_X);
    _t.insert(code_6502_t::OPCODE_SEC_IMPL);
    _t.insert(code_6502_t::OPCODE_AND_ABS_Y);
    _t.insert(code_6502_t::OPCODE_AND_ABS_X);
    _t.insert(code_6502_t::OPCODE_ROL_ABS_X);
    _t.insert(code_6502_t::OPCODE_RTI_IMPL);
    _t.insert(code_6502_t::OPCODE_EOR_X_IND);
    _t.insert(code_6502_t::OPCODE_EOR_ZPG);
    _t.insert(code_6502_t::OPCODE_LSR_ZPG);
    _t.insert(code_6502_t::OPCODE_PHA_IMPL);
    _t.insert(code_6502_t::OPCODE_EOR_IMM);
    _t.insert(code_6502_t::OPCODE_LSR_A);
    _t.insert(code_6502_t::OPCODE_JMP_ABS);
    _t.insert(code_6502_t::OPCODE_EOR_ABS);
    _t.insert(code_6502_t::OPCODE_LSR_ABS);
    _t.insert(code_6502_t::OPCODE_BVC_REL);
    _t.insert(code_6502_t::OPCODE_EOR_IND_Y);
    _t.insert(code_6502_t::OPCODE_EOR_ZPG_X);
    _t.insert(code_6502_t::OPCODE_LSR_ZPG_X);
    _t.insert(code_6502_t::OPCODE_CLI_IMPL);
    _t.insert(code_6502_t::OPCODE_EOR_ABS_Y);
    _t.insert(code_6502_t::OPCODE_EOR_ABS_X);
    _t.insert(code_6502_t::OPCODE_LSR_ABS_X);
    _t.insert(code_6502_t::OPCODE_RTS_IMPL);
    _t.insert(code_6502_t::OPCODE_ADC_X_IND);
    _t.insert(code_6502_t::OPCODE_ADC_ZPG);
    _t.insert(code_6502_t::OPCODE_ROR_ZPG);
    _t.insert(code_6502_t::OPCODE_PLA_IMPL);
    _t.insert(code_6502_t::OPCODE_ADC_IMM);
    _t.insert(code_6502_t::OPCODE_ROR_A);
    _t.insert(code_6502_t::OPCODE_JMP_IND);
    _t.insert(code_6502_t::OPCODE_ADC_ABS);
    _t.insert(code_6502_t::OPCODE_ROR_ABS);
    _t.insert(code_6502_t::OPCODE_BVS_REL);
    _t.insert(code_6502_t::OPCODE_ADC_IND_Y);
    _t.insert(code_6502_t::OPCODE_ADC_ZPG_X);
    _t.insert(code_6502_t::OPCODE_ROR_ZPG_X);
    _t.insert(code_6502_t::OPCODE_SEI_IMPL);
    _t.insert(code_6502_t::OPCODE_ADC_ABS_Y);
    _t.insert(code_6502_t::OPCODE_ADC_ABS_X);
    _t.insert(code_6502_t::OPCODE_ROR_ABS_X);
    _t.insert(code_6502_t::OPCODE_STA_X_IND);
    _t.insert(code_6502_t::OPCODE_STY_ZPG);
    _t.insert(code_6502_t::OPCODE_STA_ZPG);
    _t.insert(code_6502_t::OPCODE_STX_ZPG);
    _t.insert(code_6502_t::OPCODE_DEY_IMPL);
    _t.insert(code_6502_t::OPCODE_TXA_IMPL);
    _t.insert(code_6502_t::OPCODE_STY_ABS);
    _t.insert(code_6502_t::OPCODE_STA_ABS);
    _t.insert(code_6502_t::OPCODE_STX_ABS);
    _t.insert(code_6502_t::OPCODE_BCC_REL);
    _t.insert(code_6502_t::OPCODE_STA_IND_Y);
    _t.insert(code_6502_t::OPCODE_STY_ZPG_X);
    _t.insert(code_6502_t::OPCODE_STA_ZPG_X);
    _t.insert(code_6502_t::OPCODE_STX_ZPG_Y);
    _t.insert(code_6502_t::OPCODE_TYA_IMPL);
    _t.insert(code_6502_t::OPCODE_STA_ABS_Y);
    _t.insert(code_6502_t::OPCODE_TXS_IMPL);
    _t.insert(code_6502_t::OPCODE_STA_ABS_X);
    _t.insert(code_6502_t::OPCODE_LDY_IMM);
    _t.insert(code_6502_t::OPCODE_LDA_X_IND);
    _t.insert(code_6502_t::OPCODE_LDX_IMM);
    _t.insert(code_6502_t::OPCODE_LDY_ZPG);
    _t.insert(code_6502_t::OPCODE_LDA_ZPG);
    _t.insert(code_6502_t::OPCODE_LDX_ZPG);
    _t.insert(code_6502_t::OPCODE_TAY_IMPL);
    _t.insert(code_6502_t::OPCODE_LDA_IMM);
    _t.insert(code_6502_t::OPCODE_TAX_IMPL);
    _t.insert(code_6502_t::OPCODE_LDY_ABS);
    _t.insert(code_6502_t::OPCODE_LDA_ABS);
    _t.insert(code_6502_t::OPCODE_LDX_ABS);
    _t.insert(code_6502_t::OPCODE_BCS_REL);
    _t.insert(code_6502_t::OPCODE_LDA_IND_Y);
    _t.insert(code_6502_t::OPCODE_LDY_ZPG_X);
    _t.insert(code_6502_t::OPCODE_LDA_ZPG_X);
    _t.insert(code_6502_t::OPCODE_LDX_ZPG_Y);
    _t.insert(code_6502_t::OPCODE_CLV_IMPL);
    _t.insert(code_6502_t::OPCODE_LDA_ABS_Y);
    _t.insert(code_6502_t::OPCODE_TSX_IMPL);
    _t.insert(code_6502_t::OPCODE_LDY_ABS_X);
    _t.insert(code_6502_t::OPCODE_LDA_ABS_X);
    _t.insert(code_6502_t::OPCODE_LDX_ABS_Y);
    _t.insert(code_6502_t::OPCODE_CPY_IMM);
    _t.insert(code_6502_t::OPCODE_CMP_X_IND);
    _t.insert(code_6502_t::OPCODE_CPY_ZPG);
    _t.insert(code_6502_t::OPCODE_CMP_ZPG);
    _t.insert(code_6502_t::OPCODE_DEC_ZPG);
    _t.insert(code_6502_t::OPCODE_INY_IMPL);
    _t.insert(code_6502_t::OPCODE_CMP_IMM);
    _t.insert(code_6502_t::OPCODE_DEX_IMPL);
    _t.insert(code_6502_t::OPCODE_CPY_ABS);
    _t.insert(code_6502_t::OPCODE_CMP_ABS);
    _t.insert(code_6502_t::OPCODE_DEC_ABS);
    _t.insert(code_6502_t::OPCODE_BNE_REL);
    _t.insert(code_6502_t::OPCODE_CMP_IND_Y);
    _t.insert(code_6502_t::OPCODE_CMP_ZPG_X);
    _t.insert(code_6502_t::OPCODE_DEC_ZPG_X);
    _t.insert(code_6502_t::OPCODE_CLD_IMPL);
    _t.insert(code_6502_t::OPCODE_CMP_ABS_Y);
    _t.insert(code_6502_t::OPCODE_CMP_ABS_X);
    _t.insert(code_6502_t::OPCODE_DEC_ABS_X);
    _t.insert(code_6502_t::OPCODE_CPX_IMM);
    _t.insert(code_6502_t::OPCODE_SBC_X_IND);
    _t.insert(code_6502_t::OPCODE_CPX_ZPG);
    _t.insert(code_6502_t::OPCODE_SBC_ZPG);
    _t.insert(code_6502_t::OPCODE_INC_ZPG);
    _t.insert(code_6502_t::OPCODE_INX_IMPL);
    _t.insert(code_6502_t::OPCODE_SBC_IMM);
    _t.insert(code_6502_t::OPCODE_NOP_IMPL);
    _t.insert(code_6502_t::OPCODE_CPX_ABS);
    _t.insert(code_6502_t::OPCODE_SBC_ABS);
    _t.insert(code_6502_t::OPCODE_INC_ABS);
    _t.insert(code_6502_t::OPCODE_BEQ_REL);
    _t.insert(code_6502_t::OPCODE_SBC_IND_Y);
    _t.insert(code_6502_t::OPCODE_SBC_ZPG_X);
    _t.insert(code_6502_t::OPCODE_INC_ZPG_X);
    _t.insert(code_6502_t::OPCODE_SED_IMPL);
    _t.insert(code_6502_t::OPCODE_SBC_ABS_Y);
    _t.insert(code_6502_t::OPCODE_SBC_ABS_X);
    _t.insert(code_6502_t::OPCODE_INC_ABS_X);
    return _t;
}
const std::set<code_6502_t::opcode_t> code_6502_t::_values_opcode_t = code_6502_t::_build_values_opcode_t();
bool code_6502_t::_is_defined_opcode_t(code_6502_t::opcode_t v) {
    return code_6502_t::_values_opcode_t.find(v) != code_6502_t::_values_opcode_t.end();
}

code_6502_t::code_6502_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, code_6502_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_operations = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void code_6502_t::_read() {
    m_operations = new std::vector<operation_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_operations->push_back(new operation_t(m__io, this, m__root));
            i++;
        }
    }
}

code_6502_t::~code_6502_t() {
    _clean_up();
}

void code_6502_t::_clean_up() {
    if (m_operations) {
        for (std::vector<operation_t*>::iterator it = m_operations->begin(); it != m_operations->end(); ++it) {
            delete *it;
        }
        delete m_operations; m_operations = 0;
    }
}

code_6502_t::operation_t::operation_t(kaitai::kstream* p__io, code_6502_t* p__parent, code_6502_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "code_6502.h"



code_6502_t::code_6502_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, code_6502_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
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
    for (std::vector<operation_t*>::iterator it = m_operations->begin(); it != m_operations->end(); ++it) {
        delete *it;
    }
    delete m_operations;
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
    case OPCODE_LSR_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_AND_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_BIT_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_ASL_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_ROR_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_STY_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_ORA_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_EOR_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_EOR_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_EOR_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_ORA_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_ADC_ABS_Y: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_STY_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_EOR_IND_Y: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_ROL_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_EOR_IMM: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_BMI_REL: {
        n_args = false;
        m_args = m__io->read_s1();
        break;
    }
    case OPCODE_INC_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_CPY_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_JSR_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_AND_ABS_Y: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_CMP_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_SBC_IND_Y: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_AND_X_IND: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_BVC_REL: {
        n_args = false;
        m_args = m__io->read_s1();
        break;
    }
    case OPCODE_ORA_X_IND: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_ORA_ABS_Y: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_LSR_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_LDX_ZPG_Y: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_ROL_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_ADC_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_STY_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_ORA_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_LDY_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_ADC_IMM: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_SBC_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_LDX_IMM: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_BEQ_REL: {
        n_args = false;
        m_args = m__io->read_s1();
        break;
    }
    case OPCODE_SBC_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_LDX_ABS_Y: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_ORA_IMM: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_BCS_REL: {
        n_args = false;
        m_args = m__io->read_s1();
        break;
    }
    case OPCODE_SBC_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_STA_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_BCC_REL: {
        n_args = false;
        m_args = m__io->read_s1();
        break;
    }
    case OPCODE_AND_IMM: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_LDY_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_ADC_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_BNE_REL: {
        n_args = false;
        m_args = m__io->read_s1();
        break;
    }
    case OPCODE_EOR_ABS_Y: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_CPY_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_STX_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_LDY_IMM: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_LDA_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_CMP_ABS_Y: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_LSR_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_EOR_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_CMP_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_INC_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_STA_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_STA_X_IND: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_CMP_IMM: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_EOR_X_IND: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_CMP_IND_Y: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_CMP_X_IND: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_ASL_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_DEC_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_SBC_ABS_Y: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_STX_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_LDA_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_AND_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_SBC_X_IND: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_LDA_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_JMP_IND: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_STA_ABS_Y: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_ASL_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_CMP_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_LDX_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_ADC_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_ROR_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_AND_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_STA_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_ADC_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_BIT_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_DEC_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_STX_ZPG_Y: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_LDA_ABS_Y: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_LDA_X_IND: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_CPY_IMM: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_ORA_IND_Y: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_ASL_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_AND_IND_Y: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_STA_IND_Y: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_ROR_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_LDX_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_AND_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_CPX_IMM: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_BVS_REL: {
        n_args = false;
        m_args = m__io->read_s1();
        break;
    }
    case OPCODE_LDY_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_INC_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_SBC_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_ROL_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_SBC_IMM: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_ADC_X_IND: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_STA_ABS_X: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_CPX_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_CMP_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_LDA_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_ROL_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_INC_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_LDA_IMM: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_DEC_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_ADC_IND_Y: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_LDA_IND_Y: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_BPL_REL: {
        n_args = false;
        m_args = m__io->read_s1();
        break;
    }
    case OPCODE_LSR_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_JMP_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_DEC_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_ORA_ABS: {
        n_args = false;
        m_args = m__io->read_u2le();
        break;
    }
    case OPCODE_ROR_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_LDY_ZPG_X: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    case OPCODE_CPX_ZPG: {
        n_args = false;
        m_args = m__io->read_u1();
        break;
    }
    }
}

code_6502_t::operation_t::~operation_t() {
    if (!n_args) {
    }
}

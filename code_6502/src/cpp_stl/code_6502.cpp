// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "code_6502.h"



code_6502_t::code_6502_t(kaitai::kstream *p_io, kaitai::kstruct* p_parent, code_6502_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = this;
    _read();
}

void code_6502_t::_read() {
    m_operations = new std::vector<operation_t*>();
    while (!m__io->is_eof()) {
        m_operations->push_back(new operation_t(m__io, this, m__root));
    }
}

code_6502_t::~code_6502_t() {
    for (std::vector<operation_t*>::iterator it = m_operations->begin(); it != m_operations->end(); ++it) {
        delete *it;
    }
    delete m_operations;
}

code_6502_t::operation_t::operation_t(kaitai::kstream *p_io, code_6502_t* p_parent, code_6502_t *p_root) : kaitai::kstruct(p_io) {
    m__parent = p_parent;
    m__root = p_root;
    _read();
}

void code_6502_t::operation_t::_read() {
    m_code = static_cast<code_6502_t::opcode_t>(m__io->read_u1());
    switch (code()) {
    case OPCODE_LSR_ABS_X:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_AND_ABS:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_BIT_ZPG:
        m_args = m__io->read_u1();
        break;
    case OPCODE_ASL_ZPG:
        m_args = m__io->read_u1();
        break;
    case OPCODE_ROR_ABS_X:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_STY_ABS:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_ORA_ZPG:
        m_args = m__io->read_u1();
        break;
    case OPCODE_EOR_ZPG_X:
        m_args = m__io->read_u1();
        break;
    case OPCODE_EOR_ABS:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_EOR_ZPG:
        m_args = m__io->read_u1();
        break;
    case OPCODE_ORA_ABS_X:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_ADC_ABS_Y:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_STY_ZPG:
        m_args = m__io->read_u1();
        break;
    case OPCODE_EOR_IND_Y:
        m_args = m__io->read_u1();
        break;
    case OPCODE_ROL_ABS:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_EOR_IMM:
        m_args = m__io->read_u1();
        break;
    case OPCODE_BMI_REL:
        m_args = m__io->read_s1();
        break;
    case OPCODE_INC_ABS_X:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_CPY_ZPG:
        m_args = m__io->read_u1();
        break;
    case OPCODE_JSR_ABS:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_AND_ABS_Y:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_CMP_ZPG:
        m_args = m__io->read_u1();
        break;
    case OPCODE_SBC_IND_Y:
        m_args = m__io->read_u1();
        break;
    case OPCODE_AND_X_IND:
        m_args = m__io->read_u1();
        break;
    case OPCODE_BVC_REL:
        m_args = m__io->read_s1();
        break;
    case OPCODE_ORA_X_IND:
        m_args = m__io->read_u1();
        break;
    case OPCODE_ORA_ABS_Y:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_LSR_ABS:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_LDX_ZPG_Y:
        m_args = m__io->read_u1();
        break;
    case OPCODE_ROL_ABS_X:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_ADC_ABS:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_STY_ZPG_X:
        m_args = m__io->read_u1();
        break;
    case OPCODE_ORA_ZPG_X:
        m_args = m__io->read_u1();
        break;
    case OPCODE_LDY_ABS_X:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_ADC_IMM:
        m_args = m__io->read_u1();
        break;
    case OPCODE_SBC_ZPG:
        m_args = m__io->read_u1();
        break;
    case OPCODE_LDX_IMM:
        m_args = m__io->read_u1();
        break;
    case OPCODE_BEQ_REL:
        m_args = m__io->read_s1();
        break;
    case OPCODE_SBC_ABS_X:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_LDX_ABS_Y:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_ORA_IMM:
        m_args = m__io->read_u1();
        break;
    case OPCODE_BCS_REL:
        m_args = m__io->read_s1();
        break;
    case OPCODE_SBC_ZPG_X:
        m_args = m__io->read_u1();
        break;
    case OPCODE_STA_ZPG:
        m_args = m__io->read_u1();
        break;
    case OPCODE_BCC_REL:
        m_args = m__io->read_s1();
        break;
    case OPCODE_AND_IMM:
        m_args = m__io->read_u1();
        break;
    case OPCODE_LDY_ZPG:
        m_args = m__io->read_u1();
        break;
    case OPCODE_ADC_ZPG:
        m_args = m__io->read_u1();
        break;
    case OPCODE_BNE_REL:
        m_args = m__io->read_s1();
        break;
    case OPCODE_EOR_ABS_Y:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_CPY_ABS:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_STX_ABS:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_LDY_IMM:
        m_args = m__io->read_u1();
        break;
    case OPCODE_LDA_ZPG_X:
        m_args = m__io->read_u1();
        break;
    case OPCODE_CMP_ABS_Y:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_LSR_ZPG_X:
        m_args = m__io->read_u1();
        break;
    case OPCODE_EOR_ABS_X:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_CMP_ABS_X:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_INC_ABS:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_STA_ZPG_X:
        m_args = m__io->read_u1();
        break;
    case OPCODE_STA_X_IND:
        m_args = m__io->read_u1();
        break;
    case OPCODE_CMP_IMM:
        m_args = m__io->read_u1();
        break;
    case OPCODE_EOR_X_IND:
        m_args = m__io->read_u1();
        break;
    case OPCODE_CMP_IND_Y:
        m_args = m__io->read_u1();
        break;
    case OPCODE_CMP_X_IND:
        m_args = m__io->read_u1();
        break;
    case OPCODE_ASL_ABS_X:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_DEC_ZPG_X:
        m_args = m__io->read_u1();
        break;
    case OPCODE_SBC_ABS_Y:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_STX_ZPG:
        m_args = m__io->read_u1();
        break;
    case OPCODE_LDA_ABS_X:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_AND_ZPG:
        m_args = m__io->read_u1();
        break;
    case OPCODE_SBC_X_IND:
        m_args = m__io->read_u1();
        break;
    case OPCODE_LDA_ZPG:
        m_args = m__io->read_u1();
        break;
    case OPCODE_JMP_IND:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_STA_ABS_Y:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_ASL_ABS:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_CMP_ZPG_X:
        m_args = m__io->read_u1();
        break;
    case OPCODE_LDX_ABS:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_ADC_ZPG_X:
        m_args = m__io->read_u1();
        break;
    case OPCODE_ROR_ZPG_X:
        m_args = m__io->read_u1();
        break;
    case OPCODE_AND_ABS_X:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_STA_ABS:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_ADC_ABS_X:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_BIT_ABS:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_DEC_ABS_X:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_STX_ZPG_Y:
        m_args = m__io->read_u1();
        break;
    case OPCODE_LDA_ABS_Y:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_LDA_X_IND:
        m_args = m__io->read_u1();
        break;
    case OPCODE_CPY_IMM:
        m_args = m__io->read_u1();
        break;
    case OPCODE_ORA_IND_Y:
        m_args = m__io->read_u1();
        break;
    case OPCODE_ASL_ZPG_X:
        m_args = m__io->read_u1();
        break;
    case OPCODE_AND_IND_Y:
        m_args = m__io->read_u1();
        break;
    case OPCODE_STA_IND_Y:
        m_args = m__io->read_u1();
        break;
    case OPCODE_ROR_ABS:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_LDX_ZPG:
        m_args = m__io->read_u1();
        break;
    case OPCODE_AND_ZPG_X:
        m_args = m__io->read_u1();
        break;
    case OPCODE_CPX_IMM:
        m_args = m__io->read_u1();
        break;
    case OPCODE_BVS_REL:
        m_args = m__io->read_s1();
        break;
    case OPCODE_LDY_ABS:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_INC_ZPG:
        m_args = m__io->read_u1();
        break;
    case OPCODE_SBC_ABS:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_ROL_ZPG_X:
        m_args = m__io->read_u1();
        break;
    case OPCODE_SBC_IMM:
        m_args = m__io->read_u1();
        break;
    case OPCODE_ADC_X_IND:
        m_args = m__io->read_u1();
        break;
    case OPCODE_STA_ABS_X:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_CPX_ABS:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_CMP_ABS:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_LDA_ABS:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_ROL_ZPG:
        m_args = m__io->read_u1();
        break;
    case OPCODE_INC_ZPG_X:
        m_args = m__io->read_u1();
        break;
    case OPCODE_LDA_IMM:
        m_args = m__io->read_u1();
        break;
    case OPCODE_DEC_ZPG:
        m_args = m__io->read_u1();
        break;
    case OPCODE_ADC_IND_Y:
        m_args = m__io->read_u1();
        break;
    case OPCODE_LDA_IND_Y:
        m_args = m__io->read_u1();
        break;
    case OPCODE_BPL_REL:
        m_args = m__io->read_s1();
        break;
    case OPCODE_LSR_ZPG:
        m_args = m__io->read_u1();
        break;
    case OPCODE_JMP_ABS:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_DEC_ABS:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_ORA_ABS:
        m_args = m__io->read_u2le();
        break;
    case OPCODE_ROR_ZPG:
        m_args = m__io->read_u1();
        break;
    case OPCODE_LDY_ZPG_X:
        m_args = m__io->read_u1();
        break;
    case OPCODE_CPX_ZPG:
        m_args = m__io->read_u1();
        break;
    }
}

code_6502_t::operation_t::~operation_t() {
}

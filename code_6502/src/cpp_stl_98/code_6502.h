#ifndef CODE_6502_H_
#define CODE_6502_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"
#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 9000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.9 or later is required"
#endif

/**
 * This spec can be used to disassemble raw stream of 6502 CPU machine
 * code into individual operations. Each operation includes an opcode
 * and, optionally, an argument. Register arguments are part of the
 * `opcode` enum.
 */

class code_6502_t : public kaitai::kstruct {

public:
    class operation_t;

    enum opcode_t {
        OPCODE_BRK_IMPL = 0,
        OPCODE_ORA_X_IND = 1,
        OPCODE_ORA_ZPG = 5,
        OPCODE_ASL_ZPG = 6,
        OPCODE_PHP_IMPL = 8,
        OPCODE_ORA_IMM = 9,
        OPCODE_ASL_A = 10,
        OPCODE_ORA_ABS = 13,
        OPCODE_ASL_ABS = 14,
        OPCODE_BPL_REL = 16,
        OPCODE_ORA_IND_Y = 17,
        OPCODE_ORA_ZPG_X = 21,
        OPCODE_ASL_ZPG_X = 22,
        OPCODE_CLC_IMPL = 24,
        OPCODE_ORA_ABS_Y = 25,
        OPCODE_ORA_ABS_X = 29,
        OPCODE_ASL_ABS_X = 30,
        OPCODE_JSR_ABS = 32,
        OPCODE_AND_X_IND = 33,
        OPCODE_BIT_ZPG = 36,
        OPCODE_AND_ZPG = 37,
        OPCODE_ROL_ZPG = 38,
        OPCODE_PLP_IMPL = 40,
        OPCODE_AND_IMM = 41,
        OPCODE_ROL_A = 42,
        OPCODE_BIT_ABS = 44,
        OPCODE_AND_ABS = 45,
        OPCODE_ROL_ABS = 46,
        OPCODE_BMI_REL = 48,
        OPCODE_AND_IND_Y = 49,
        OPCODE_AND_ZPG_X = 53,
        OPCODE_ROL_ZPG_X = 54,
        OPCODE_SEC_IMPL = 56,
        OPCODE_AND_ABS_Y = 57,
        OPCODE_AND_ABS_X = 61,
        OPCODE_ROL_ABS_X = 62,
        OPCODE_RTI_IMPL = 64,
        OPCODE_EOR_X_IND = 65,
        OPCODE_EOR_ZPG = 69,
        OPCODE_LSR_ZPG = 70,
        OPCODE_PHA_IMPL = 72,
        OPCODE_EOR_IMM = 73,
        OPCODE_LSR_A = 74,
        OPCODE_JMP_ABS = 76,
        OPCODE_EOR_ABS = 77,
        OPCODE_LSR_ABS = 78,
        OPCODE_BVC_REL = 80,
        OPCODE_EOR_IND_Y = 81,
        OPCODE_EOR_ZPG_X = 85,
        OPCODE_LSR_ZPG_X = 86,
        OPCODE_CLI_IMPL = 88,
        OPCODE_EOR_ABS_Y = 89,
        OPCODE_EOR_ABS_X = 93,
        OPCODE_LSR_ABS_X = 94,
        OPCODE_RTS_IMPL = 96,
        OPCODE_ADC_X_IND = 97,
        OPCODE_ADC_ZPG = 101,
        OPCODE_ROR_ZPG = 102,
        OPCODE_PLA_IMPL = 104,
        OPCODE_ADC_IMM = 105,
        OPCODE_ROR_A = 106,
        OPCODE_JMP_IND = 108,
        OPCODE_ADC_ABS = 109,
        OPCODE_ROR_ABS = 110,
        OPCODE_BVS_REL = 112,
        OPCODE_ADC_IND_Y = 113,
        OPCODE_ADC_ZPG_X = 117,
        OPCODE_ROR_ZPG_X = 118,
        OPCODE_SEI_IMPL = 120,
        OPCODE_ADC_ABS_Y = 121,
        OPCODE_ADC_ABS_X = 125,
        OPCODE_ROR_ABS_X = 126,
        OPCODE_STA_X_IND = 129,
        OPCODE_STY_ZPG = 132,
        OPCODE_STA_ZPG = 133,
        OPCODE_STX_ZPG = 134,
        OPCODE_DEY_IMPL = 136,
        OPCODE_TXA_IMPL = 138,
        OPCODE_STY_ABS = 140,
        OPCODE_STA_ABS = 141,
        OPCODE_STX_ABS = 142,
        OPCODE_BCC_REL = 144,
        OPCODE_STA_IND_Y = 145,
        OPCODE_STY_ZPG_X = 148,
        OPCODE_STA_ZPG_X = 149,
        OPCODE_STX_ZPG_Y = 150,
        OPCODE_TYA_IMPL = 152,
        OPCODE_STA_ABS_Y = 153,
        OPCODE_TXS_IMPL = 154,
        OPCODE_STA_ABS_X = 157,
        OPCODE_LDY_IMM = 160,
        OPCODE_LDA_X_IND = 161,
        OPCODE_LDX_IMM = 162,
        OPCODE_LDY_ZPG = 164,
        OPCODE_LDA_ZPG = 165,
        OPCODE_LDX_ZPG = 166,
        OPCODE_TAY_IMPL = 168,
        OPCODE_LDA_IMM = 169,
        OPCODE_TAX_IMPL = 170,
        OPCODE_LDY_ABS = 172,
        OPCODE_LDA_ABS = 173,
        OPCODE_LDX_ABS = 174,
        OPCODE_BCS_REL = 176,
        OPCODE_LDA_IND_Y = 177,
        OPCODE_LDY_ZPG_X = 180,
        OPCODE_LDA_ZPG_X = 181,
        OPCODE_LDX_ZPG_Y = 182,
        OPCODE_CLV_IMPL = 184,
        OPCODE_LDA_ABS_Y = 185,
        OPCODE_TSX_IMPL = 186,
        OPCODE_LDY_ABS_X = 188,
        OPCODE_LDA_ABS_X = 189,
        OPCODE_LDX_ABS_Y = 190,
        OPCODE_CPY_IMM = 192,
        OPCODE_CMP_X_IND = 193,
        OPCODE_CPY_ZPG = 196,
        OPCODE_CMP_ZPG = 197,
        OPCODE_DEC_ZPG = 198,
        OPCODE_INY_IMPL = 200,
        OPCODE_CMP_IMM = 201,
        OPCODE_DEX_IMPL = 202,
        OPCODE_CPY_ABS = 204,
        OPCODE_CMP_ABS = 205,
        OPCODE_DEC_ABS = 206,
        OPCODE_BNE_REL = 208,
        OPCODE_CMP_IND_Y = 209,
        OPCODE_CMP_ZPG_X = 213,
        OPCODE_DEC_ZPG_X = 214,
        OPCODE_CLD_IMPL = 216,
        OPCODE_CMP_ABS_Y = 217,
        OPCODE_CMP_ABS_X = 221,
        OPCODE_DEC_ABS_X = 222,
        OPCODE_CPX_IMM = 224,
        OPCODE_SBC_X_IND = 225,
        OPCODE_CPX_ZPG = 228,
        OPCODE_SBC_ZPG = 229,
        OPCODE_INC_ZPG = 230,
        OPCODE_INX_IMPL = 232,
        OPCODE_SBC_IMM = 233,
        OPCODE_NOP_IMPL = 234,
        OPCODE_CPX_ABS = 236,
        OPCODE_SBC_ABS = 237,
        OPCODE_INC_ABS = 238,
        OPCODE_BEQ_REL = 240,
        OPCODE_SBC_IND_Y = 241,
        OPCODE_SBC_ZPG_X = 245,
        OPCODE_INC_ZPG_X = 246,
        OPCODE_SED_IMPL = 248,
        OPCODE_SBC_ABS_Y = 249,
        OPCODE_SBC_ABS_X = 253,
        OPCODE_INC_ABS_X = 254
    };

    code_6502_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, code_6502_t* p__root = 0);

private:
    void _read();
    void _clean_up();

public:
    ~code_6502_t();

    class operation_t : public kaitai::kstruct {

    public:

        operation_t(kaitai::kstream* p__io, code_6502_t* p__parent = 0, code_6502_t* p__root = 0);

    private:
        void _read();
        void _clean_up();

    public:
        ~operation_t();

    private:
        opcode_t m_code;
        uint16_t m_args;
        bool n_args;

    public:
        bool _is_null_args() { args(); return n_args; };

    private:
        code_6502_t* m__root;
        code_6502_t* m__parent;

    public:
        opcode_t code() const { return m_code; }
        uint16_t args() const { return m_args; }
        code_6502_t* _root() const { return m__root; }
        code_6502_t* _parent() const { return m__parent; }
    };

private:
    std::vector<operation_t*>* m_operations;
    code_6502_t* m__root;
    kaitai::kstruct* m__parent;

public:
    std::vector<operation_t*>* operations() const { return m_operations; }
    code_6502_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // CODE_6502_H_

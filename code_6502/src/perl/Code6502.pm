# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package Code6502;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $OPCODE_BRK_IMPL = 0;
our $OPCODE_ORA_X_IND = 1;
our $OPCODE_ORA_ZPG = 5;
our $OPCODE_ASL_ZPG = 6;
our $OPCODE_PHP_IMPL = 8;
our $OPCODE_ORA_IMM = 9;
our $OPCODE_ASL_A = 10;
our $OPCODE_ORA_ABS = 13;
our $OPCODE_ASL_ABS = 14;
our $OPCODE_BPL_REL = 16;
our $OPCODE_ORA_IND_Y = 17;
our $OPCODE_ORA_ZPG_X = 21;
our $OPCODE_ASL_ZPG_X = 22;
our $OPCODE_CLC_IMPL = 24;
our $OPCODE_ORA_ABS_Y = 25;
our $OPCODE_ORA_ABS_X = 29;
our $OPCODE_ASL_ABS_X = 30;
our $OPCODE_JSR_ABS = 32;
our $OPCODE_AND_X_IND = 33;
our $OPCODE_BIT_ZPG = 36;
our $OPCODE_AND_ZPG = 37;
our $OPCODE_ROL_ZPG = 38;
our $OPCODE_PLP_IMPL = 40;
our $OPCODE_AND_IMM = 41;
our $OPCODE_ROL_A = 42;
our $OPCODE_BIT_ABS = 44;
our $OPCODE_AND_ABS = 45;
our $OPCODE_ROL_ABS = 46;
our $OPCODE_BMI_REL = 48;
our $OPCODE_AND_IND_Y = 49;
our $OPCODE_AND_ZPG_X = 53;
our $OPCODE_ROL_ZPG_X = 54;
our $OPCODE_SEC_IMPL = 56;
our $OPCODE_AND_ABS_Y = 57;
our $OPCODE_AND_ABS_X = 61;
our $OPCODE_ROL_ABS_X = 62;
our $OPCODE_RTI_IMPL = 64;
our $OPCODE_EOR_X_IND = 65;
our $OPCODE_EOR_ZPG = 69;
our $OPCODE_LSR_ZPG = 70;
our $OPCODE_PHA_IMPL = 72;
our $OPCODE_EOR_IMM = 73;
our $OPCODE_LSR_A = 74;
our $OPCODE_JMP_ABS = 76;
our $OPCODE_EOR_ABS = 77;
our $OPCODE_LSR_ABS = 78;
our $OPCODE_BVC_REL = 80;
our $OPCODE_EOR_IND_Y = 81;
our $OPCODE_EOR_ZPG_X = 85;
our $OPCODE_LSR_ZPG_X = 86;
our $OPCODE_CLI_IMPL = 88;
our $OPCODE_EOR_ABS_Y = 89;
our $OPCODE_EOR_ABS_X = 93;
our $OPCODE_LSR_ABS_X = 94;
our $OPCODE_RTS_IMPL = 96;
our $OPCODE_ADC_X_IND = 97;
our $OPCODE_ADC_ZPG = 101;
our $OPCODE_ROR_ZPG = 102;
our $OPCODE_PLA_IMPL = 104;
our $OPCODE_ADC_IMM = 105;
our $OPCODE_ROR_A = 106;
our $OPCODE_JMP_IND = 108;
our $OPCODE_ADC_ABS = 109;
our $OPCODE_ROR_ABS = 110;
our $OPCODE_BVS_REL = 112;
our $OPCODE_ADC_IND_Y = 113;
our $OPCODE_ADC_ZPG_X = 117;
our $OPCODE_ROR_ZPG_X = 118;
our $OPCODE_SEI_IMPL = 120;
our $OPCODE_ADC_ABS_Y = 121;
our $OPCODE_ADC_ABS_X = 125;
our $OPCODE_ROR_ABS_X = 126;
our $OPCODE_STA_X_IND = 129;
our $OPCODE_STY_ZPG = 132;
our $OPCODE_STA_ZPG = 133;
our $OPCODE_STX_ZPG = 134;
our $OPCODE_DEY_IMPL = 136;
our $OPCODE_TXA_IMPL = 138;
our $OPCODE_STY_ABS = 140;
our $OPCODE_STA_ABS = 141;
our $OPCODE_STX_ABS = 142;
our $OPCODE_BCC_REL = 144;
our $OPCODE_STA_IND_Y = 145;
our $OPCODE_STY_ZPG_X = 148;
our $OPCODE_STA_ZPG_X = 149;
our $OPCODE_STX_ZPG_Y = 150;
our $OPCODE_TYA_IMPL = 152;
our $OPCODE_STA_ABS_Y = 153;
our $OPCODE_TXS_IMPL = 154;
our $OPCODE_STA_ABS_X = 157;
our $OPCODE_LDY_IMM = 160;
our $OPCODE_LDA_X_IND = 161;
our $OPCODE_LDX_IMM = 162;
our $OPCODE_LDY_ZPG = 164;
our $OPCODE_LDA_ZPG = 165;
our $OPCODE_LDX_ZPG = 166;
our $OPCODE_TAY_IMPL = 168;
our $OPCODE_LDA_IMM = 169;
our $OPCODE_TAX_IMPL = 170;
our $OPCODE_LDY_ABS = 172;
our $OPCODE_LDA_ABS = 173;
our $OPCODE_LDX_ABS = 174;
our $OPCODE_BCS_REL = 176;
our $OPCODE_LDA_IND_Y = 177;
our $OPCODE_LDY_ZPG_X = 180;
our $OPCODE_LDA_ZPG_X = 181;
our $OPCODE_LDX_ZPG_Y = 182;
our $OPCODE_CLV_IMPL = 184;
our $OPCODE_LDA_ABS_Y = 185;
our $OPCODE_TSX_IMPL = 186;
our $OPCODE_LDY_ABS_X = 188;
our $OPCODE_LDA_ABS_X = 189;
our $OPCODE_LDX_ABS_Y = 190;
our $OPCODE_CPY_IMM = 192;
our $OPCODE_CMP_X_IND = 193;
our $OPCODE_CPY_ZPG = 196;
our $OPCODE_CMP_ZPG = 197;
our $OPCODE_DEC_ZPG = 198;
our $OPCODE_INY_IMPL = 200;
our $OPCODE_CMP_IMM = 201;
our $OPCODE_DEX_IMPL = 202;
our $OPCODE_CPY_ABS = 204;
our $OPCODE_CMP_ABS = 205;
our $OPCODE_DEC_ABS = 206;
our $OPCODE_BNE_REL = 208;
our $OPCODE_CMP_IND_Y = 209;
our $OPCODE_CMP_ZPG_X = 213;
our $OPCODE_DEC_ZPG_X = 214;
our $OPCODE_CLD_IMPL = 216;
our $OPCODE_CMP_ABS_Y = 217;
our $OPCODE_CMP_ABS_X = 221;
our $OPCODE_DEC_ABS_X = 222;
our $OPCODE_CPX_IMM = 224;
our $OPCODE_SBC_X_IND = 225;
our $OPCODE_CPX_ZPG = 228;
our $OPCODE_SBC_ZPG = 229;
our $OPCODE_INC_ZPG = 230;
our $OPCODE_INX_IMPL = 232;
our $OPCODE_SBC_IMM = 233;
our $OPCODE_NOP_IMPL = 234;
our $OPCODE_CPX_ABS = 236;
our $OPCODE_SBC_ABS = 237;
our $OPCODE_INC_ABS = 238;
our $OPCODE_BEQ_REL = 240;
our $OPCODE_SBC_IND_Y = 241;
our $OPCODE_SBC_ZPG_X = 245;
our $OPCODE_INC_ZPG_X = 246;
our $OPCODE_SED_IMPL = 248;
our $OPCODE_SBC_ABS_Y = 249;
our $OPCODE_SBC_ABS_X = 253;
our $OPCODE_INC_ABS_X = 254;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{operations} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{operations}}, Code6502::Operation->new($self->{_io}, $self, $self->{_root});
    }
}

sub operations {
    my ($self) = @_;
    return $self->{operations};
}

########################################################################
package Code6502::Operation;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{code} = $self->{_io}->read_u1();
    my $_on = $self->code();
    if ($_on == $Code6502::OPCODE_BCC_REL) {
        $self->{args} = $self->{_io}->read_s1();
    }
    elsif ($_on == $Code6502::OPCODE_ORA_IND_Y) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_LDA_IND_Y) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_CPX_ZPG) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_STA_ZPG_X) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_STA_ZPG) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_BCS_REL) {
        $self->{args} = $self->{_io}->read_s1();
    }
    elsif ($_on == $Code6502::OPCODE_LDY_ZPG_X) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_LSR_ABS_X) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_AND_ABS_X) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_ADC_ABS) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_STA_ABS) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_BNE_REL) {
        $self->{args} = $self->{_io}->read_s1();
    }
    elsif ($_on == $Code6502::OPCODE_LDA_IMM) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_ADC_IMM) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_LSR_ABS) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_ADC_ABS_X) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_STA_ABS_X) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_CPX_IMM) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_JMP_IND) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_ADC_ZPG) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_EOR_IMM) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_EOR_ABS_X) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_STA_X_IND) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_SBC_IMM) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_CPY_ABS) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_LDX_ABS_Y) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_ADC_ZPG_X) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_BPL_REL) {
        $self->{args} = $self->{_io}->read_s1();
    }
    elsif ($_on == $Code6502::OPCODE_ORA_IMM) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_ROR_ABS_X) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_ADC_IND_Y) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_EOR_IND_Y) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_LDA_ABS) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_BIT_ZPG) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_ROL_ZPG) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_STY_ZPG) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_JSR_ABS) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_EOR_ZPG) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_EOR_ABS) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_LDA_ABS_Y) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_LDA_ZPG_X) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_BMI_REL) {
        $self->{args} = $self->{_io}->read_s1();
    }
    elsif ($_on == $Code6502::OPCODE_STY_ZPG_X) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_ADC_X_IND) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_ROL_ABS_X) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_STX_ZPG) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_ASL_ABS_X) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_LSR_ZPG_X) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_ORA_ZPG_X) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_ADC_ABS_Y) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_LDY_ABS) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_CMP_ABS_X) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_LDA_ABS_X) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_BVS_REL) {
        $self->{args} = $self->{_io}->read_s1();
    }
    elsif ($_on == $Code6502::OPCODE_LDA_X_IND) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_CMP_IMM) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_INC_ZPG_X) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_ASL_ZPG) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_AND_ABS_Y) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_LDX_IMM) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_AND_ZPG) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_CPX_ABS) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_DEC_ZPG) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_ROR_ZPG_X) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_LDX_ZPG) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_DEC_ZPG_X) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_SBC_ZPG) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_CMP_ABS) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_ROR_ZPG) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_INC_ABS) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_AND_X_IND) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_SBC_ABS_X) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_ASL_ABS) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_EOR_X_IND) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_ORA_ABS_X) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_LDY_ABS_X) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_SBC_X_IND) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_ASL_ZPG_X) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_SBC_ABS_Y) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_ROL_ABS) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_LSR_ZPG) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_STX_ZPG_Y) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_ORA_ABS_Y) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_EOR_ABS_Y) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_BIT_ABS) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_LDX_ABS) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_LDY_IMM) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_JMP_ABS) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_BEQ_REL) {
        $self->{args} = $self->{_io}->read_s1();
    }
    elsif ($_on == $Code6502::OPCODE_DEC_ABS_X) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_AND_IND_Y) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_AND_ZPG_X) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_CMP_ZPG_X) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_EOR_ZPG_X) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_SBC_ABS) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_CMP_ABS_Y) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_SBC_IND_Y) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_CMP_ZPG) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_STX_ABS) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_STY_ABS) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_CPY_ZPG) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_DEC_ABS) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_ROR_ABS) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_STA_ABS_Y) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_INC_ABS_X) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_LDA_ZPG) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_CMP_IND_Y) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_CPY_IMM) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_LDX_ZPG_Y) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_SBC_ZPG_X) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_ORA_X_IND) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_ROL_ZPG_X) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_ORA_ABS) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_STA_IND_Y) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_AND_ABS) {
        $self->{args} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $Code6502::OPCODE_AND_IMM) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_CMP_X_IND) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_LDY_ZPG) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_INC_ZPG) {
        $self->{args} = $self->{_io}->read_u1();
    }
    elsif ($_on == $Code6502::OPCODE_BVC_REL) {
        $self->{args} = $self->{_io}->read_s1();
    }
    elsif ($_on == $Code6502::OPCODE_ORA_ZPG) {
        $self->{args} = $self->{_io}->read_u1();
    }
}

sub code {
    my ($self) = @_;
    return $self->{code};
}

sub args {
    my ($self) = @_;
    return $self->{args};
}

1;

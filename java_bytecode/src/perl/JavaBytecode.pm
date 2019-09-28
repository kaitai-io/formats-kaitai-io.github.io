# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;

########################################################################
package JavaBytecode;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $OPCODES_NOP = 0;
our $OPCODES_ACONST_NULL = 1;
our $OPCODES_ICONST_M1 = 2;
our $OPCODES_ICONST_0 = 3;
our $OPCODES_ICONST_1 = 4;
our $OPCODES_ICONST_2 = 5;
our $OPCODES_ICONST_3 = 6;
our $OPCODES_ICONST_4 = 7;
our $OPCODES_ICONST_5 = 8;
our $OPCODES_LCONST_0 = 9;
our $OPCODES_LCONST_1 = 10;
our $OPCODES_FCONST_0 = 11;
our $OPCODES_FCONST_1 = 12;
our $OPCODES_FCONST_2 = 13;
our $OPCODES_DCONST_0 = 14;
our $OPCODES_DCONST_1 = 15;
our $OPCODES_BIPUSH = 16;
our $OPCODES_SIPUSH = 17;
our $OPCODES_LDC = 18;
our $OPCODES_LDC_W = 19;
our $OPCODES_LDC2_W = 20;
our $OPCODES_ILOAD = 21;
our $OPCODES_LLOAD = 22;
our $OPCODES_FLOAD = 23;
our $OPCODES_DLOAD = 24;
our $OPCODES_ALOAD = 25;
our $OPCODES_ILOAD_0 = 26;
our $OPCODES_ILOAD_1 = 27;
our $OPCODES_ILOAD_2 = 28;
our $OPCODES_ILOAD_3 = 29;
our $OPCODES_LLOAD_0 = 30;
our $OPCODES_LLOAD_1 = 31;
our $OPCODES_LLOAD_2 = 32;
our $OPCODES_LLOAD_3 = 33;
our $OPCODES_FLOAD_0 = 34;
our $OPCODES_FLOAD_1 = 35;
our $OPCODES_FLOAD_2 = 36;
our $OPCODES_FLOAD_3 = 37;
our $OPCODES_DLOAD_0 = 38;
our $OPCODES_DLOAD_1 = 39;
our $OPCODES_DLOAD_2 = 40;
our $OPCODES_DLOAD_3 = 41;
our $OPCODES_ALOAD_0 = 42;
our $OPCODES_ALOAD_1 = 43;
our $OPCODES_ALOAD_2 = 44;
our $OPCODES_ALOAD_3 = 45;
our $OPCODES_IALOAD = 46;
our $OPCODES_LALOAD = 47;
our $OPCODES_FALOAD = 48;
our $OPCODES_DALOAD = 49;
our $OPCODES_AALOAD = 50;
our $OPCODES_BALOAD = 51;
our $OPCODES_CALOAD = 52;
our $OPCODES_SALOAD = 53;
our $OPCODES_ISTORE = 54;
our $OPCODES_LSTORE = 55;
our $OPCODES_FSTORE = 56;
our $OPCODES_DSTORE = 57;
our $OPCODES_ASTORE = 58;
our $OPCODES_ISTORE_0 = 59;
our $OPCODES_ISTORE_1 = 60;
our $OPCODES_ISTORE_2 = 61;
our $OPCODES_ISTORE_3 = 62;
our $OPCODES_LSTORE_0 = 63;
our $OPCODES_LSTORE_1 = 64;
our $OPCODES_LSTORE_2 = 65;
our $OPCODES_LSTORE_3 = 66;
our $OPCODES_FSTORE_0 = 67;
our $OPCODES_FSTORE_1 = 68;
our $OPCODES_FSTORE_2 = 69;
our $OPCODES_FSTORE_3 = 70;
our $OPCODES_DSTORE_0 = 71;
our $OPCODES_DSTORE_1 = 72;
our $OPCODES_DSTORE_2 = 73;
our $OPCODES_DSTORE_3 = 74;
our $OPCODES_ASTORE_0 = 75;
our $OPCODES_ASTORE_1 = 76;
our $OPCODES_ASTORE_2 = 77;
our $OPCODES_ASTORE_3 = 78;
our $OPCODES_IASTORE = 79;
our $OPCODES_LASTORE = 80;
our $OPCODES_FASTORE = 81;
our $OPCODES_DASTORE = 82;
our $OPCODES_AASTORE = 83;
our $OPCODES_BASTORE = 84;
our $OPCODES_CASTORE = 85;
our $OPCODES_SASTORE = 86;
our $OPCODES_POP = 87;
our $OPCODES_POP2 = 88;
our $OPCODES_DUP = 89;
our $OPCODES_DUP_X1 = 90;
our $OPCODES_DUP_X2 = 91;
our $OPCODES_DUP2 = 92;
our $OPCODES_DUP2_X1 = 93;
our $OPCODES_DUP2_X2 = 94;
our $OPCODES_SWAP = 95;
our $OPCODES_IADD = 96;
our $OPCODES_LADD = 97;
our $OPCODES_FADD = 98;
our $OPCODES_DADD = 99;
our $OPCODES_ISUB = 100;
our $OPCODES_LSUB = 101;
our $OPCODES_FSUB = 102;
our $OPCODES_DSUB = 103;
our $OPCODES_IMUL = 104;
our $OPCODES_LMUL = 105;
our $OPCODES_FMUL = 106;
our $OPCODES_DMUL = 107;
our $OPCODES_IDIV = 108;
our $OPCODES_LDIV = 109;
our $OPCODES_FDIV = 110;
our $OPCODES_DDIV = 111;
our $OPCODES_IREM = 112;
our $OPCODES_LREM = 113;
our $OPCODES_FREM = 114;
our $OPCODES_DREM = 115;
our $OPCODES_INEG = 116;
our $OPCODES_LNEG = 117;
our $OPCODES_FNEG = 118;
our $OPCODES_DNEG = 119;
our $OPCODES_ISHL = 120;
our $OPCODES_LSHL = 121;
our $OPCODES_ISHR = 122;
our $OPCODES_LSHR = 123;
our $OPCODES_IUSHR = 124;
our $OPCODES_LUSHR = 125;
our $OPCODES_IAND = 126;
our $OPCODES_LAND = 127;
our $OPCODES_IOR = 128;
our $OPCODES_LOR = 129;
our $OPCODES_IXOR = 130;
our $OPCODES_LXOR = 131;
our $OPCODES_IINC = 132;
our $OPCODES_I2L = 133;
our $OPCODES_I2F = 134;
our $OPCODES_I2D = 135;
our $OPCODES_L2I = 136;
our $OPCODES_L2F = 137;
our $OPCODES_L2D = 138;
our $OPCODES_F2I = 139;
our $OPCODES_F2L = 140;
our $OPCODES_F2D = 141;
our $OPCODES_D2I = 142;
our $OPCODES_D2L = 143;
our $OPCODES_D2F = 144;
our $OPCODES_I2B = 145;
our $OPCODES_I2C = 146;
our $OPCODES_I2S = 147;
our $OPCODES_LCMP = 148;
our $OPCODES_FCMPL = 149;
our $OPCODES_FCMPG = 150;
our $OPCODES_DCMPL = 151;
our $OPCODES_DCMPG = 152;
our $OPCODES_IFEQ = 153;
our $OPCODES_IFNE = 154;
our $OPCODES_IFLT = 155;
our $OPCODES_IFGE = 156;
our $OPCODES_IFGT = 157;
our $OPCODES_IFLE = 158;
our $OPCODES_IF_ICMPEQ = 159;
our $OPCODES_IF_ICMPNE = 160;
our $OPCODES_IF_ICMPLT = 161;
our $OPCODES_IF_ICMPGE = 162;
our $OPCODES_IF_ICMPGT = 163;
our $OPCODES_IF_ICMPLE = 164;
our $OPCODES_IF_ACMPEQ = 165;
our $OPCODES_IF_ACMPNE = 166;
our $OPCODES_GOTO = 167;
our $OPCODES_JSR = 168;
our $OPCODES_RET = 169;
our $OPCODES_TABLESWITCH = 170;
our $OPCODES_LOOKUPSWITCH = 171;
our $OPCODES_IRETURN = 172;
our $OPCODES_LRETURN = 173;
our $OPCODES_FRETURN = 174;
our $OPCODES_DRETURN = 175;
our $OPCODES_ARETURN = 176;
our $OPCODES_RETURN = 177;
our $OPCODES_GETSTATIC = 178;
our $OPCODES_PUTSTATIC = 179;
our $OPCODES_GETFIELD = 180;
our $OPCODES_PUTFIELD = 181;
our $OPCODES_INVOKEVIRTUAL = 182;
our $OPCODES_INVOKESPECIAL = 183;
our $OPCODES_INVOKESTATIC = 184;
our $OPCODES_INVOKEINTERFACE = 185;
our $OPCODES_INVOKEDYNAMIC = 186;
our $OPCODES_NEW = 187;
our $OPCODES_NEWARRAY = 188;
our $OPCODES_ANEWARRAY = 189;
our $OPCODES_ARRAYLENGTH = 190;
our $OPCODES_ATHROW = 191;
our $OPCODES_CHECKCAST = 192;
our $OPCODES_INSTANCEOF = 193;
our $OPCODES_MONITORENTER = 194;
our $OPCODES_MONITOREXIT = 195;
our $OPCODES_WIDE = 196;
our $OPCODES_MULTIANEWARRAY = 197;
our $OPCODES_IFNULL = 198;
our $OPCODES_IFNONNULL = 199;
our $OPCODES_GOTO_W = 200;
our $OPCODES_JSR_W = 201;
our $OPCODES_BREAKPOINT = 202;
our $OPCODES_IMPDEP1 = 254;
our $OPCODES_IMPDEP2 = 255;

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

    $self->{instructions} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{instructions}}, JavaBytecode::Inst->new($self->{_io}, $self, $self->{_root});
    }
}

sub instructions {
    my ($self) = @_;
    return $self->{instructions};
}

########################################################################
package JavaBytecode::Inst;

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

    $self->{opcode} = $self->{_io}->read_u1();
    my $_on = $self->opcode();
    if ($_on == $JavaBytecode::OPCODES_FLOAD) {
        $self->{arg} = $self->{_io}->read_u1();
    }
    elsif ($_on == $JavaBytecode::OPCODES_LDC) {
        $self->{arg} = $self->{_io}->read_u1();
    }
    elsif ($_on == $JavaBytecode::OPCODES_LLOAD) {
        $self->{arg} = $self->{_io}->read_u1();
    }
    elsif ($_on == $JavaBytecode::OPCODES_NEW) {
        $self->{arg} = $self->{_io}->read_u2be();
    }
    elsif ($_on == $JavaBytecode::OPCODES_JSR) {
        $self->{arg} = $self->{_io}->read_s2be();
    }
    elsif ($_on == $JavaBytecode::OPCODES_GETSTATIC) {
        $self->{arg} = $self->{_io}->read_u2be();
    }
    elsif ($_on == $JavaBytecode::OPCODES_ILOAD) {
        $self->{arg} = $self->{_io}->read_u1();
    }
    elsif ($_on == $JavaBytecode::OPCODES_LDC2_W) {
        $self->{arg} = $self->{_io}->read_u2be();
    }
    elsif ($_on == $JavaBytecode::OPCODES_DLOAD) {
        $self->{arg} = $self->{_io}->read_u1();
    }
    elsif ($_on == $JavaBytecode::OPCODES_GOTO) {
        $self->{arg} = $self->{_io}->read_s2be();
    }
    elsif ($_on == $JavaBytecode::OPCODES_LDC_W) {
        $self->{arg} = $self->{_io}->read_u2be();
    }
    elsif ($_on == $JavaBytecode::OPCODES_INVOKEVIRTUAL) {
        $self->{arg} = $self->{_io}->read_u2be();
    }
    elsif ($_on == $JavaBytecode::OPCODES_SIPUSH) {
        $self->{arg} = $self->{_io}->read_s2be();
    }
    elsif ($_on == $JavaBytecode::OPCODES_NEWARRAY) {
        $self->{arg} = JavaBytecode::ArgNewarray->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $JavaBytecode::OPCODES_INVOKESTATIC) {
        $self->{arg} = $self->{_io}->read_u2be();
    }
    elsif ($_on == $JavaBytecode::OPCODES_INVOKEINTERFACE) {
        $self->{arg} = JavaBytecode::ArgInvokeinterface->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $JavaBytecode::OPCODES_BIPUSH) {
        $self->{arg} = $self->{_io}->read_s1();
    }
    elsif ($_on == $JavaBytecode::OPCODES_INVOKESPECIAL) {
        $self->{arg} = $self->{_io}->read_u2be();
    }
    elsif ($_on == $JavaBytecode::OPCODES_JSR_W) {
        $self->{arg} = $self->{_io}->read_s4be();
    }
    elsif ($_on == $JavaBytecode::OPCODES_GOTO_W) {
        $self->{arg} = $self->{_io}->read_s4be();
    }
}

sub opcode {
    my ($self) = @_;
    return $self->{opcode};
}

sub arg {
    my ($self) = @_;
    return $self->{arg};
}

########################################################################
package JavaBytecode::ArgInvokeinterface;

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

    $self->{method_index} = $self->{_io}->read_u2be();
    $self->{count} = $self->{_io}->read_u1();
    $self->{reserved} = $self->{_io}->ensure_fixed_contents(pack('C*', (0)));
}

sub method_index {
    my ($self) = @_;
    return $self->{method_index};
}

sub count {
    my ($self) = @_;
    return $self->{count};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

########################################################################
package JavaBytecode::ArgNewarray;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $PRIM_TYPES_T_BOOLEAN = 4;
our $PRIM_TYPES_T_CHAR = 5;
our $PRIM_TYPES_T_FLOAT = 6;
our $PRIM_TYPES_T_DOUBLE = 7;
our $PRIM_TYPES_T_BYTE = 8;
our $PRIM_TYPES_T_SHORT = 9;
our $PRIM_TYPES_T_INT = 10;
our $PRIM_TYPES_T_LONG = 11;

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

    $self->{atype} = $self->{_io}->read_u1();
}

sub atype {
    my ($self) = @_;
    return $self->{atype};
}

1;

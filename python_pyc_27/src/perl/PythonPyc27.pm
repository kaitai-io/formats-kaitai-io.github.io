# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package PythonPyc27;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $VERSION_V15 = 20121;
our $VERSION_V16 = 50428;
our $VERSION_V20 = 50823;
our $VERSION_V21 = 60202;
our $VERSION_V22 = 60717;
our $VERSION_V23_A0 = 62011;
our $VERSION_V23_A0B = 62021;
our $VERSION_V24_A0 = 62041;
our $VERSION_V24_A3 = 62051;
our $VERSION_V24_B1 = 62061;
our $VERSION_V25_A0 = 62071;
our $VERSION_V25_A0B = 62081;
our $VERSION_V25_A0C = 62091;
our $VERSION_V25_A0D = 62092;
our $VERSION_V25_B3 = 62101;
our $VERSION_V25_B3B = 62111;
our $VERSION_V25_C1 = 62121;
our $VERSION_V25_C2 = 62131;
our $VERSION_V26_A0 = 62151;
our $VERSION_V26_A1 = 62161;
our $VERSION_V27_A0 = 62171;
our $VERSION_V27_A0B = 62181;
our $VERSION_V27_A0C = 62191;
our $VERSION_V27_A0D = 62201;
our $VERSION_V27_A0E = 62211;

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

    $self->{version_magic} = $self->{_io}->read_u2le();
    $self->{crlf} = $self->{_io}->read_u2le();
    $self->{modification_timestamp} = $self->{_io}->read_u4le();
    $self->{body} = PythonPyc27::PyObject->new($self->{_io}, $self, $self->{_root});
}

sub version_magic {
    my ($self) = @_;
    return $self->{version_magic};
}

sub crlf {
    my ($self) = @_;
    return $self->{crlf};
}

sub modification_timestamp {
    my ($self) = @_;
    return $self->{modification_timestamp};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

########################################################################
package PythonPyc27::CodeObject;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $FLAGS_ENUM_HAS_ARGS = 4;
our $FLAGS_ENUM_HAS_KWARGS = 8;
our $FLAGS_ENUM_GENERATOR = 32;

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

    $self->{arg_count} = $self->{_io}->read_u4le();
    $self->{local_count} = $self->{_io}->read_u4le();
    $self->{stack_size} = $self->{_io}->read_u4le();
    $self->{flags} = $self->{_io}->read_u4le();
    $self->{code} = PythonPyc27::Assembly->new($self->{_io}, $self, $self->{_root});
    $self->{consts} = PythonPyc27::PyObject->new($self->{_io}, $self, $self->{_root});
    $self->{names} = PythonPyc27::PyObject->new($self->{_io}, $self, $self->{_root});
    $self->{var_names} = PythonPyc27::PyObject->new($self->{_io}, $self, $self->{_root});
    $self->{free_vars} = PythonPyc27::PyObject->new($self->{_io}, $self, $self->{_root});
    $self->{cell_vars} = PythonPyc27::PyObject->new($self->{_io}, $self, $self->{_root});
    $self->{filename} = PythonPyc27::PyObject->new($self->{_io}, $self, $self->{_root});
    $self->{name} = PythonPyc27::PyObject->new($self->{_io}, $self, $self->{_root});
    $self->{first_line_no} = $self->{_io}->read_u4le();
    $self->{lnotab} = PythonPyc27::PyObject->new($self->{_io}, $self, $self->{_root});
}

sub arg_count {
    my ($self) = @_;
    return $self->{arg_count};
}

sub local_count {
    my ($self) = @_;
    return $self->{local_count};
}

sub stack_size {
    my ($self) = @_;
    return $self->{stack_size};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub code {
    my ($self) = @_;
    return $self->{code};
}

sub consts {
    my ($self) = @_;
    return $self->{consts};
}

sub names {
    my ($self) = @_;
    return $self->{names};
}

sub var_names {
    my ($self) = @_;
    return $self->{var_names};
}

sub free_vars {
    my ($self) = @_;
    return $self->{free_vars};
}

sub cell_vars {
    my ($self) = @_;
    return $self->{cell_vars};
}

sub filename {
    my ($self) = @_;
    return $self->{filename};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub first_line_no {
    my ($self) = @_;
    return $self->{first_line_no};
}

sub lnotab {
    my ($self) = @_;
    return $self->{lnotab};
}

########################################################################
package PythonPyc27::Assembly;

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

    $self->{string_magic} = $self->{_io}->read_bytes(1);
    $self->{length} = $self->{_io}->read_u4le();
    $self->{_raw_items} = $self->{_io}->read_bytes($self->length());
    my $io__raw_items = IO::KaitaiStruct::Stream->new($self->{_raw_items});
    $self->{items} = PythonPyc27::OpArgs->new($io__raw_items, $self, $self->{_root});
}

sub string_magic {
    my ($self) = @_;
    return $self->{string_magic};
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub items {
    my ($self) = @_;
    return $self->{items};
}

sub _raw_items {
    my ($self) = @_;
    return $self->{_raw_items};
}

########################################################################
package PythonPyc27::OpArg;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $OP_CODE_ENUM_STOP_CODE = 0;
our $OP_CODE_ENUM_POP_TOP = 1;
our $OP_CODE_ENUM_ROT_TWO = 2;
our $OP_CODE_ENUM_ROT_THREE = 3;
our $OP_CODE_ENUM_DUP_TOP = 4;
our $OP_CODE_ENUM_ROT_FOUR = 5;
our $OP_CODE_ENUM_NOP = 9;
our $OP_CODE_ENUM_UNARY_POSITIVE = 10;
our $OP_CODE_ENUM_UNARY_NEGATIVE = 11;
our $OP_CODE_ENUM_UNARY_NOT = 12;
our $OP_CODE_ENUM_UNARY_CONVERT = 13;
our $OP_CODE_ENUM_UNARY_INVERT = 15;
our $OP_CODE_ENUM_BINARY_POWER = 19;
our $OP_CODE_ENUM_BINARY_MULTIPLY = 20;
our $OP_CODE_ENUM_BINARY_DIVIDE = 21;
our $OP_CODE_ENUM_BINARY_MODULO = 22;
our $OP_CODE_ENUM_BINARY_ADD = 23;
our $OP_CODE_ENUM_BINARY_SUBTRACT = 24;
our $OP_CODE_ENUM_BINARY_SUBSCR = 25;
our $OP_CODE_ENUM_BINARY_FLOOR_DIVIDE = 26;
our $OP_CODE_ENUM_BINARY_TRUE_DIVIDE = 27;
our $OP_CODE_ENUM_INPLACE_FLOOR_DIVIDE = 28;
our $OP_CODE_ENUM_INPLACE_TRUE_DIVIDE = 29;
our $OP_CODE_ENUM_SLICE_0 = 30;
our $OP_CODE_ENUM_SLICE_1 = 31;
our $OP_CODE_ENUM_SLICE_2 = 32;
our $OP_CODE_ENUM_SLICE_3 = 33;
our $OP_CODE_ENUM_STORE_SLICE_0 = 40;
our $OP_CODE_ENUM_STORE_SLICE_1 = 41;
our $OP_CODE_ENUM_STORE_SLICE_2 = 42;
our $OP_CODE_ENUM_STORE_SLICE_3 = 43;
our $OP_CODE_ENUM_DELETE_SLICE_0 = 50;
our $OP_CODE_ENUM_DELETE_SLICE_1 = 51;
our $OP_CODE_ENUM_DELETE_SLICE_2 = 52;
our $OP_CODE_ENUM_DELETE_SLICE_3 = 53;
our $OP_CODE_ENUM_STORE_MAP = 54;
our $OP_CODE_ENUM_INPLACE_ADD = 55;
our $OP_CODE_ENUM_INPLACE_SUBTRACT = 56;
our $OP_CODE_ENUM_INPLACE_MULTIPLY = 57;
our $OP_CODE_ENUM_INPLACE_DIVIDE = 58;
our $OP_CODE_ENUM_INPLACE_MODULO = 59;
our $OP_CODE_ENUM_STORE_SUBSCR = 60;
our $OP_CODE_ENUM_DELETE_SUBSCR = 61;
our $OP_CODE_ENUM_BINARY_LSHIFT = 62;
our $OP_CODE_ENUM_BINARY_RSHIFT = 63;
our $OP_CODE_ENUM_BINARY_AND = 64;
our $OP_CODE_ENUM_BINARY_XOR = 65;
our $OP_CODE_ENUM_BINARY_OR = 66;
our $OP_CODE_ENUM_INPLACE_POWER = 67;
our $OP_CODE_ENUM_GET_ITER = 68;
our $OP_CODE_ENUM_PRINT_EXPR = 70;
our $OP_CODE_ENUM_PRINT_ITEM = 71;
our $OP_CODE_ENUM_PRINT_NEWLINE = 72;
our $OP_CODE_ENUM_PRINT_ITEM_TO = 73;
our $OP_CODE_ENUM_PRINT_NEWLINE_TO = 74;
our $OP_CODE_ENUM_INPLACE_LSHIFT = 75;
our $OP_CODE_ENUM_INPLACE_RSHIFT = 76;
our $OP_CODE_ENUM_INPLACE_AND = 77;
our $OP_CODE_ENUM_INPLACE_XOR = 78;
our $OP_CODE_ENUM_INPLACE_OR = 79;
our $OP_CODE_ENUM_BREAK_LOOP = 80;
our $OP_CODE_ENUM_WITH_CLEANUP = 81;
our $OP_CODE_ENUM_LOAD_LOCALS = 82;
our $OP_CODE_ENUM_RETURN_VALUE = 83;
our $OP_CODE_ENUM_IMPORT_STAR = 84;
our $OP_CODE_ENUM_EXEC_STMT = 85;
our $OP_CODE_ENUM_YIELD_VALUE = 86;
our $OP_CODE_ENUM_POP_BLOCK = 87;
our $OP_CODE_ENUM_END_FINALLY = 88;
our $OP_CODE_ENUM_BUILD_CLASS = 89;
our $OP_CODE_ENUM_STORE_NAME = 90;
our $OP_CODE_ENUM_DELETE_NAME = 91;
our $OP_CODE_ENUM_UNPACK_SEQUENCE = 92;
our $OP_CODE_ENUM_FOR_ITER = 93;
our $OP_CODE_ENUM_LIST_APPEND = 94;
our $OP_CODE_ENUM_STORE_ATTR = 95;
our $OP_CODE_ENUM_DELETE_ATTR = 96;
our $OP_CODE_ENUM_STORE_GLOBAL = 97;
our $OP_CODE_ENUM_DELETE_GLOBAL = 98;
our $OP_CODE_ENUM_DUP_TOPX = 99;
our $OP_CODE_ENUM_LOAD_CONST = 100;
our $OP_CODE_ENUM_LOAD_NAME = 101;
our $OP_CODE_ENUM_BUILD_TUPLE = 102;
our $OP_CODE_ENUM_BUILD_LIST = 103;
our $OP_CODE_ENUM_BUILD_SET = 104;
our $OP_CODE_ENUM_BUILD_MAP = 105;
our $OP_CODE_ENUM_LOAD_ATTR = 106;
our $OP_CODE_ENUM_COMPARE_OP = 107;
our $OP_CODE_ENUM_IMPORT_NAME = 108;
our $OP_CODE_ENUM_IMPORT_FROM = 109;
our $OP_CODE_ENUM_JUMP_FORWARD = 110;
our $OP_CODE_ENUM_JUMP_IF_FALSE_OR_POP = 111;
our $OP_CODE_ENUM_JUMP_IF_TRUE_OR_POP = 112;
our $OP_CODE_ENUM_JUMP_ABSOLUTE = 113;
our $OP_CODE_ENUM_POP_JUMP_IF_FALSE = 114;
our $OP_CODE_ENUM_POP_JUMP_IF_TRUE = 115;
our $OP_CODE_ENUM_LOAD_GLOBAL = 116;
our $OP_CODE_ENUM_CONTINUE_LOOP = 119;
our $OP_CODE_ENUM_SETUP_LOOP = 120;
our $OP_CODE_ENUM_SETUP_EXCEPT = 121;
our $OP_CODE_ENUM_SETUP_FINALLY = 122;
our $OP_CODE_ENUM_LOAD_FAST = 124;
our $OP_CODE_ENUM_STORE_FAST = 125;
our $OP_CODE_ENUM_DELETE_FAST = 126;
our $OP_CODE_ENUM_RAISE_VARARGS = 130;
our $OP_CODE_ENUM_CALL_FUNCTION = 131;
our $OP_CODE_ENUM_MAKE_FUNCTION = 132;
our $OP_CODE_ENUM_BUILD_SLICE = 133;
our $OP_CODE_ENUM_MAKE_CLOSURE = 134;
our $OP_CODE_ENUM_LOAD_CLOSURE = 135;
our $OP_CODE_ENUM_LOAD_DEREF = 136;
our $OP_CODE_ENUM_STORE_DEREF = 137;
our $OP_CODE_ENUM_CALL_FUNCTION_VAR = 140;
our $OP_CODE_ENUM_CALL_FUNCTION_KW = 141;
our $OP_CODE_ENUM_CALL_FUNCTION_VAR_KW = 142;
our $OP_CODE_ENUM_SETUP_WITH = 143;
our $OP_CODE_ENUM_EXTENDED_ARG = 145;
our $OP_CODE_ENUM_SET_ADD = 146;
our $OP_CODE_ENUM_MAP_ADD = 147;

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

    $self->{op_code} = $self->{_io}->read_u1();
    if ($self->op_code() >= $PythonPyc27::OpArg::OP_CODE_ENUM_STORE_NAME) {
        $self->{arg} = $self->{_io}->read_u2le();
    }
}

sub op_code {
    my ($self) = @_;
    return $self->{op_code};
}

sub arg {
    my ($self) = @_;
    return $self->{arg};
}

########################################################################
package PythonPyc27::PyObject;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $OBJECT_TYPE_TUPLE = 40;
our $OBJECT_TYPE_PY_FALSE = 70;
our $OBJECT_TYPE_NONE = 78;
our $OBJECT_TYPE_STRING_REF = 82;
our $OBJECT_TYPE_PY_TRUE = 84;
our $OBJECT_TYPE_CODE_OBJECT = 99;
our $OBJECT_TYPE_INT = 105;
our $OBJECT_TYPE_STRING = 115;
our $OBJECT_TYPE_INTERNED = 116;
our $OBJECT_TYPE_UNICODE_STRING = 117;

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

    $self->{type} = $self->{_io}->read_u1();
    my $_on = $self->type();
    if ($_on == $PythonPyc27::PyObject::OBJECT_TYPE_STRING) {
        $self->{value} = PythonPyc27::PyObject::PyString->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPyc27::PyObject::OBJECT_TYPE_TUPLE) {
        $self->{value} = PythonPyc27::PyObject::Tuple->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPyc27::PyObject::OBJECT_TYPE_INT) {
        $self->{value} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $PythonPyc27::PyObject::OBJECT_TYPE_PY_TRUE) {
        $self->{value} = PythonPyc27::PyObject::PyTrue->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPyc27::PyObject::OBJECT_TYPE_PY_FALSE) {
        $self->{value} = PythonPyc27::PyObject::PyFalse->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPyc27::PyObject::OBJECT_TYPE_NONE) {
        $self->{value} = PythonPyc27::PyObject::PyNone->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPyc27::PyObject::OBJECT_TYPE_STRING_REF) {
        $self->{value} = PythonPyc27::PyObject::StringRef->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPyc27::PyObject::OBJECT_TYPE_CODE_OBJECT) {
        $self->{value} = PythonPyc27::CodeObject->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPyc27::PyObject::OBJECT_TYPE_INTERNED) {
        $self->{value} = PythonPyc27::PyObject::InternedString->new($self->{_io}, $self, $self->{_root});
    }
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package PythonPyc27::PyObject::PyNone;

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

}

########################################################################
package PythonPyc27::PyObject::PyFalse;

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

}

########################################################################
package PythonPyc27::PyObject::StringRef;

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

    $self->{interned_list_index} = $self->{_io}->read_u4le();
}

sub interned_list_index {
    my ($self) = @_;
    return $self->{interned_list_index};
}

########################################################################
package PythonPyc27::PyObject::PyTrue;

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

}

########################################################################
package PythonPyc27::PyObject::Tuple;

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

    $self->{count} = $self->{_io}->read_u4le();
    $self->{items} = ();
    my $n_items = $self->count();
    for (my $i = 0; $i < $n_items; $i++) {
        push @{$self->{items}}, PythonPyc27::PyObject->new($self->{_io}, $self, $self->{_root});
    }
}

sub count {
    my ($self) = @_;
    return $self->{count};
}

sub items {
    my ($self) = @_;
    return $self->{items};
}

########################################################################
package PythonPyc27::PyObject::UnicodeString;

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

    $self->{length} = $self->{_io}->read_u4le();
    $self->{data} = Encode::decode("utf-8", $self->{_io}->read_bytes($self->length()));
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package PythonPyc27::PyObject::InternedString;

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

    $self->{length} = $self->{_io}->read_u4le();
    $self->{data} = Encode::decode("utf-8", $self->{_io}->read_bytes($self->length()));
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package PythonPyc27::PyObject::PyString;

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

    $self->{length} = $self->{_io}->read_u4le();
    $self->{data} = $self->{_io}->read_bytes($self->length());
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package PythonPyc27::OpArgs;

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

    $self->{items} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{items}}, PythonPyc27::OpArg->new($self->{_io}, $self, $self->{_root});
    }
}

sub items {
    my ($self) = @_;
    return $self->{items};
}

1;

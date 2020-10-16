# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package PythonPickle;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $OPCODE_MARK = 40;
our $OPCODE_EMPTY_TUPLE = 41;
our $OPCODE_STOP = 46;
our $OPCODE_POP = 48;
our $OPCODE_POP_MARK = 49;
our $OPCODE_DUP = 50;
our $OPCODE_BINBYTES = 66;
our $OPCODE_SHORT_BINBYTES = 67;
our $OPCODE_FLOAT = 70;
our $OPCODE_BINFLOAT = 71;
our $OPCODE_INT = 73;
our $OPCODE_BININT = 74;
our $OPCODE_BININT1 = 75;
our $OPCODE_LONG = 76;
our $OPCODE_BININT2 = 77;
our $OPCODE_NONE = 78;
our $OPCODE_PERSID = 80;
our $OPCODE_BINPERSID = 81;
our $OPCODE_REDUCE = 82;
our $OPCODE_STRING = 83;
our $OPCODE_BINSTRING = 84;
our $OPCODE_SHORT_BINSTRING = 85;
our $OPCODE_UNICODE = 86;
our $OPCODE_BINUNICODE = 88;
our $OPCODE_EMPTY_LIST = 93;
our $OPCODE_APPEND = 97;
our $OPCODE_BUILD = 98;
our $OPCODE_GLOBAL = 99;
our $OPCODE_DICT = 100;
our $OPCODE_APPENDS = 101;
our $OPCODE_GET = 103;
our $OPCODE_BINGET = 104;
our $OPCODE_INST = 105;
our $OPCODE_LONG_BINGET = 106;
our $OPCODE_LIST = 108;
our $OPCODE_OBJ = 111;
our $OPCODE_PUT = 112;
our $OPCODE_BINPUT = 113;
our $OPCODE_LONG_BINPUT = 114;
our $OPCODE_SETITEM = 115;
our $OPCODE_TUPLE = 116;
our $OPCODE_SETITEMS = 117;
our $OPCODE_EMPTY_DICT = 125;
our $OPCODE_PROTO = 128;
our $OPCODE_NEWOBJ = 129;
our $OPCODE_EXT1 = 130;
our $OPCODE_EXT2 = 131;
our $OPCODE_EXT4 = 132;
our $OPCODE_TUPLE1 = 133;
our $OPCODE_TUPLE2 = 134;
our $OPCODE_TUPLE3 = 135;
our $OPCODE_NEWTRUE = 136;
our $OPCODE_NEWFALSE = 137;
our $OPCODE_LONG1 = 138;
our $OPCODE_LONG4 = 139;
our $OPCODE_SHORT_BINUNICODE = 140;
our $OPCODE_BINUNICODE8 = 141;
our $OPCODE_BINBYTES8 = 142;
our $OPCODE_EMPTY_SET = 143;
our $OPCODE_ADDITEMS = 144;
our $OPCODE_FROZENSET = 145;
our $OPCODE_NEWOBJ_EX = 146;
our $OPCODE_STACK_GLOBAL = 147;
our $OPCODE_MEMOIZE = 148;
our $OPCODE_FRAME = 149;
our $OPCODE_BYTEARRAY8 = 150;
our $OPCODE_NEXT_BUFFER = 151;
our $OPCODE_READONLY_BUFFER = 152;

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

    $self->{ops} = ();
    do {
        $_ = PythonPickle::Op->new($self->{_io}, $self, $self->{_root});
        push @{$self->{ops}}, $_;
    } until ($_->code() == $PythonPickle::OPCODE_STOP);
}

sub ops {
    my ($self) = @_;
    return $self->{ops};
}

########################################################################
package PythonPickle::Unicodestring8;

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

    $self->{len} = $self->{_io}->read_u8le();
    $self->{val} = Encode::decode("utf8", $self->{_io}->read_bytes($self->len()));
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub val {
    my ($self) = @_;
    return $self->{val};
}

########################################################################
package PythonPickle::Long1;

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

    $self->{len} = $self->{_io}->read_u1();
    $self->{val} = $self->{_io}->read_bytes($self->len());
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub val {
    my ($self) = @_;
    return $self->{val};
}

########################################################################
package PythonPickle::Bytes8;

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

    $self->{len} = $self->{_io}->read_u8le();
    $self->{val} = $self->{_io}->read_bytes($self->len());
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub val {
    my ($self) = @_;
    return $self->{val};
}

########################################################################
package PythonPickle::Bytes1;

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

    $self->{len} = $self->{_io}->read_u1();
    $self->{val} = $self->{_io}->read_bytes($self->len());
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub val {
    my ($self) = @_;
    return $self->{val};
}

########################################################################
package PythonPickle::Bytes4;

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

    $self->{len} = $self->{_io}->read_u4le();
    $self->{val} = $self->{_io}->read_bytes($self->len());
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub val {
    my ($self) = @_;
    return $self->{val};
}

########################################################################
package PythonPickle::NoArg;

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
package PythonPickle::StringnlNoescape;

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

    $self->{val} = Encode::decode("ascii", $self->{_io}->read_bytes_term(10, 0, 1, 1));
}

sub val {
    my ($self) = @_;
    return $self->{val};
}

########################################################################
package PythonPickle::DecimalnlLong;

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

    $self->{val} = Encode::decode("ascii", $self->{_io}->read_bytes_term(10, 0, 1, 1));
}

sub val {
    my ($self) = @_;
    return $self->{val};
}

########################################################################
package PythonPickle::Unicodestring4;

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

    $self->{len} = $self->{_io}->read_u4le();
    $self->{val} = Encode::decode("utf8", $self->{_io}->read_bytes($self->len()));
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub val {
    my ($self) = @_;
    return $self->{val};
}

########################################################################
package PythonPickle::Unicodestringnl;

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

    $self->{val} = Encode::decode("ascii", $self->{_io}->read_bytes_term(10, 0, 1, 1));
}

sub val {
    my ($self) = @_;
    return $self->{val};
}

########################################################################
package PythonPickle::Long4;

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

    $self->{len} = $self->{_io}->read_u4le();
    $self->{val} = $self->{_io}->read_bytes($self->len());
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub val {
    my ($self) = @_;
    return $self->{val};
}

########################################################################
package PythonPickle::String1;

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

    $self->{len} = $self->{_io}->read_u1();
    $self->{val} = $self->{_io}->read_bytes($self->len());
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub val {
    my ($self) = @_;
    return $self->{val};
}

########################################################################
package PythonPickle::Bytearray8;

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

    $self->{len} = $self->{_io}->read_u8le();
    $self->{val} = $self->{_io}->read_bytes($self->len());
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub val {
    my ($self) = @_;
    return $self->{val};
}

########################################################################
package PythonPickle::DecimalnlShort;

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

    $self->{val} = Encode::decode("ascii", $self->{_io}->read_bytes_term(10, 0, 1, 1));
}

sub val {
    my ($self) = @_;
    return $self->{val};
}

########################################################################
package PythonPickle::Unicodestring1;

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

    $self->{len} = $self->{_io}->read_u1();
    $self->{val} = Encode::decode("utf8", $self->{_io}->read_bytes($self->len()));
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub val {
    my ($self) = @_;
    return $self->{val};
}

########################################################################
package PythonPickle::Stringnl;

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

    $self->{val} = Encode::decode("ascii", $self->{_io}->read_bytes_term(10, 0, 1, 1));
}

sub val {
    my ($self) = @_;
    return $self->{val};
}

########################################################################
package PythonPickle::StringnlNoescapePair;

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

    $self->{val1} = PythonPickle::StringnlNoescape->new($self->{_io}, $self, $self->{_root});
    $self->{val2} = PythonPickle::StringnlNoescape->new($self->{_io}, $self, $self->{_root});
}

sub val1 {
    my ($self) = @_;
    return $self->{val1};
}

sub val2 {
    my ($self) = @_;
    return $self->{val2};
}

########################################################################
package PythonPickle::String4;

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

    $self->{len} = $self->{_io}->read_s4le();
    $self->{val} = $self->{_io}->read_bytes($self->len());
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub val {
    my ($self) = @_;
    return $self->{val};
}

########################################################################
package PythonPickle::Op;

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
    if ($_on == $PythonPickle::OPCODE_EXT4) {
        $self->{arg} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $PythonPickle::OPCODE_TUPLE1) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_SETITEM) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_READONLY_BUFFER) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_STOP) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_EXT2) {
        $self->{arg} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $PythonPickle::OPCODE_EMPTY_TUPLE) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_NEWTRUE) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_LONG) {
        $self->{arg} = PythonPickle::DecimalnlLong->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_NEWOBJ) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_BYTEARRAY8) {
        $self->{arg} = PythonPickle::Bytearray8->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_PUT) {
        $self->{arg} = PythonPickle::DecimalnlShort->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_STACK_GLOBAL) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_POP_MARK) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_APPEND) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_NEWFALSE) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_BINPERSID) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_BUILD) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_EMPTY_DICT) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_TUPLE2) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_LONG4) {
        $self->{arg} = PythonPickle::Long4->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_NEXT_BUFFER) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_APPENDS) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_BINBYTES) {
        $self->{arg} = PythonPickle::Bytes4->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_DUP) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_LIST) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_PROTO) {
        $self->{arg} = $self->{_io}->read_u1();
    }
    elsif ($_on == $PythonPickle::OPCODE_POP) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_FRAME) {
        $self->{arg} = $self->{_io}->read_u8le();
    }
    elsif ($_on == $PythonPickle::OPCODE_STRING) {
        $self->{arg} = PythonPickle::Stringnl->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_BINUNICODE) {
        $self->{arg} = PythonPickle::Unicodestring4->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_FLOAT) {
        $self->{arg} = PythonPickle::Floatnl->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_REDUCE) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_BINPUT) {
        $self->{arg} = $self->{_io}->read_u1();
    }
    elsif ($_on == $PythonPickle::OPCODE_MEMOIZE) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_PERSID) {
        $self->{arg} = PythonPickle::StringnlNoescape->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_EXT1) {
        $self->{arg} = $self->{_io}->read_u1();
    }
    elsif ($_on == $PythonPickle::OPCODE_NONE) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_SHORT_BINUNICODE) {
        $self->{arg} = PythonPickle::Unicodestring1->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_OBJ) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_BINFLOAT) {
        $self->{arg} = $self->{_io}->read_f8be();
    }
    elsif ($_on == $PythonPickle::OPCODE_NEWOBJ_EX) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_EMPTY_LIST) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_TUPLE) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_BINUNICODE8) {
        $self->{arg} = PythonPickle::Unicodestring8->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_BINGET) {
        $self->{arg} = $self->{_io}->read_u1();
    }
    elsif ($_on == $PythonPickle::OPCODE_GLOBAL) {
        $self->{arg} = PythonPickle::StringnlNoescapePair->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_DICT) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_BINSTRING) {
        $self->{arg} = PythonPickle::String4->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_SETITEMS) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_BININT2) {
        $self->{arg} = $self->{_io}->read_u2le();
    }
    elsif ($_on == $PythonPickle::OPCODE_BINBYTES8) {
        $self->{arg} = PythonPickle::Bytes8->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_BININT1) {
        $self->{arg} = $self->{_io}->read_u1();
    }
    elsif ($_on == $PythonPickle::OPCODE_INST) {
        $self->{arg} = PythonPickle::StringnlNoescapePair->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_LONG_BINGET) {
        $self->{arg} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $PythonPickle::OPCODE_LONG_BINPUT) {
        $self->{arg} = $self->{_io}->read_u4le();
    }
    elsif ($_on == $PythonPickle::OPCODE_INT) {
        $self->{arg} = PythonPickle::DecimalnlShort->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_BININT) {
        $self->{arg} = $self->{_io}->read_s4le();
    }
    elsif ($_on == $PythonPickle::OPCODE_UNICODE) {
        $self->{arg} = PythonPickle::Unicodestringnl->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_LONG1) {
        $self->{arg} = PythonPickle::Long1->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_SHORT_BINSTRING) {
        $self->{arg} = PythonPickle::String1->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_MARK) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_FROZENSET) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_TUPLE3) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_ADDITEMS) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_GET) {
        $self->{arg} = PythonPickle::DecimalnlShort->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_EMPTY_SET) {
        $self->{arg} = PythonPickle::NoArg->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $PythonPickle::OPCODE_SHORT_BINBYTES) {
        $self->{arg} = PythonPickle::Bytes1->new($self->{_io}, $self, $self->{_root});
    }
}

sub code {
    my ($self) = @_;
    return $self->{code};
}

sub arg {
    my ($self) = @_;
    return $self->{arg};
}

########################################################################
package PythonPickle::Floatnl;

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

    $self->{val} = Encode::decode("ascii", $self->{_io}->read_bytes_term(10, 0, 1, 1));
}

sub val {
    my ($self) = @_;
    return $self->{val};
}

1;

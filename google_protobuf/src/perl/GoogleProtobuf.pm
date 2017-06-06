# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use VlqBase128Le;

########################################################################
package GoogleProtobuf;

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

    $self->{pairs} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{pairs}}, GoogleProtobuf::Pair->new($self->{_io}, $self, $self->{_root});
    }
}

sub pairs {
    my ($self) = @_;
    return $self->{pairs};
}

########################################################################
package GoogleProtobuf::Pair;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $WIRE_TYPES_VARINT = 0;
our $WIRE_TYPES_BIT_64 = 1;
our $WIRE_TYPES_LEN_DELIMITED = 2;
our $WIRE_TYPES_GROUP_START = 3;
our $WIRE_TYPES_GROUP_END = 4;
our $WIRE_TYPES_BIT_32 = 5;

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

    $self->{key} = VlqBase128Le->new($self->{_io});
    my $_on = $self->wire_type();
    if ($_on == $WIRE_TYPES_VARINT) {
        $self->{value} = VlqBase128Le->new($self->{_io});
    }
    elsif ($_on == $WIRE_TYPES_LEN_DELIMITED) {
        $self->{value} = GoogleProtobuf::DelimitedBytes->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $WIRE_TYPES_BIT_64) {
        $self->{value} = $self->{_io}->read_u8le();
    }
    elsif ($_on == $WIRE_TYPES_BIT_32) {
        $self->{value} = $self->{_io}->read_u4le();
    }
}

sub wire_type {
    my ($self) = @_;
    return $self->{wire_type} if ($self->{wire_type});
    $self->{wire_type} = ($self->key()->value() & 7);
    return $self->{wire_type};
}

sub field_tag {
    my ($self) = @_;
    return $self->{field_tag} if ($self->{field_tag});
    $self->{field_tag} = ($self->key()->value() >> 3);
    return $self->{field_tag};
}

sub key {
    my ($self) = @_;
    return $self->{key};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package GoogleProtobuf::DelimitedBytes;

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

    $self->{len} = VlqBase128Le->new($self->{_io});
    $self->{body} = $self->{_io}->read_bytes($self->len()->value());
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

1;

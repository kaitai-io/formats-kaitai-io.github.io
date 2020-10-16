# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package AixUtmp;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $ENTRY_TYPE_EMPTY = 0;
our $ENTRY_TYPE_RUN_LVL = 1;
our $ENTRY_TYPE_BOOT_TIME = 2;
our $ENTRY_TYPE_OLD_TIME = 3;
our $ENTRY_TYPE_NEW_TIME = 4;
our $ENTRY_TYPE_INIT_PROCESS = 5;
our $ENTRY_TYPE_LOGIN_PROCESS = 6;
our $ENTRY_TYPE_USER_PROCESS = 7;
our $ENTRY_TYPE_DEAD_PROCESS = 8;
our $ENTRY_TYPE_ACCOUNTING = 9;

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

    $self->{records} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{records}}, AixUtmp::Record->new($self->{_io}, $self, $self->{_root});
    }
}

sub records {
    my ($self) = @_;
    return $self->{records};
}

########################################################################
package AixUtmp::Record;

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

    $self->{user} = Encode::decode("ascii", $self->{_io}->read_bytes(256));
    $self->{inittab_id} = Encode::decode("ascii", $self->{_io}->read_bytes(14));
    $self->{device} = Encode::decode("ascii", $self->{_io}->read_bytes(64));
    $self->{pid} = $self->{_io}->read_u8be();
    $self->{type} = $self->{_io}->read_s2be();
    $self->{timestamp} = $self->{_io}->read_s8be();
    $self->{exit_status} = AixUtmp::ExitStatus->new($self->{_io}, $self, $self->{_root});
    $self->{hostname} = Encode::decode("ascii", $self->{_io}->read_bytes(256));
    $self->{dbl_word_pad} = $self->{_io}->read_s4be();
    $self->{reserved_a} = $self->{_io}->read_bytes(8);
    $self->{reserved_v} = $self->{_io}->read_bytes(24);
}

sub user {
    my ($self) = @_;
    return $self->{user};
}

sub inittab_id {
    my ($self) = @_;
    return $self->{inittab_id};
}

sub device {
    my ($self) = @_;
    return $self->{device};
}

sub pid {
    my ($self) = @_;
    return $self->{pid};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub timestamp {
    my ($self) = @_;
    return $self->{timestamp};
}

sub exit_status {
    my ($self) = @_;
    return $self->{exit_status};
}

sub hostname {
    my ($self) = @_;
    return $self->{hostname};
}

sub dbl_word_pad {
    my ($self) = @_;
    return $self->{dbl_word_pad};
}

sub reserved_a {
    my ($self) = @_;
    return $self->{reserved_a};
}

sub reserved_v {
    my ($self) = @_;
    return $self->{reserved_v};
}

########################################################################
package AixUtmp::ExitStatus;

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

    $self->{termination_code} = $self->{_io}->read_s2be();
    $self->{exit_code} = $self->{_io}->read_s2be();
}

sub termination_code {
    my ($self) = @_;
    return $self->{termination_code};
}

sub exit_code {
    my ($self) = @_;
    return $self->{exit_code};
}

1;

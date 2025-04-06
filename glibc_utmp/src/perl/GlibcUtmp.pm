# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package GlibcUtmp;

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
our $ENTRY_TYPE_NEW_TIME = 3;
our $ENTRY_TYPE_OLD_TIME = 4;
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

    $self->{_raw_records} = ();
    $self->{records} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{_raw_records}}, $self->{_io}->read_bytes(384);
        my $io__raw_records = IO::KaitaiStruct::Stream->new($self->{_raw_records}[-1]);
        push @{$self->{records}}, GlibcUtmp::Record->new($io__raw_records, $self, $self->{_root});
    }
}

sub records {
    my ($self) = @_;
    return $self->{records};
}

sub _raw_records {
    my ($self) = @_;
    return $self->{_raw_records};
}

########################################################################
package GlibcUtmp::Record;

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

    $self->{ut_type} = $self->{_io}->read_s4le();
    $self->{pid} = $self->{_io}->read_s4le();
    $self->{line} = Encode::decode("UTF-8", $self->{_io}->read_bytes(32));
    $self->{id} = Encode::decode("UTF-8", $self->{_io}->read_bytes(4));
    $self->{user} = Encode::decode("UTF-8", $self->{_io}->read_bytes(32));
    $self->{host} = Encode::decode("UTF-8", $self->{_io}->read_bytes(256));
    $self->{exit} = $self->{_io}->read_u4le();
    $self->{session} = $self->{_io}->read_s4le();
    $self->{tv} = GlibcUtmp::Timeval->new($self->{_io}, $self, $self->{_root});
    $self->{addr_v6} = $self->{_io}->read_bytes(16);
    $self->{reserved} = $self->{_io}->read_bytes(20);
}

sub ut_type {
    my ($self) = @_;
    return $self->{ut_type};
}

sub pid {
    my ($self) = @_;
    return $self->{pid};
}

sub line {
    my ($self) = @_;
    return $self->{line};
}

sub id {
    my ($self) = @_;
    return $self->{id};
}

sub user {
    my ($self) = @_;
    return $self->{user};
}

sub host {
    my ($self) = @_;
    return $self->{host};
}

sub exit {
    my ($self) = @_;
    return $self->{exit};
}

sub session {
    my ($self) = @_;
    return $self->{session};
}

sub tv {
    my ($self) = @_;
    return $self->{tv};
}

sub addr_v6 {
    my ($self) = @_;
    return $self->{addr_v6};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

########################################################################
package GlibcUtmp::Timeval;

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

    $self->{sec} = $self->{_io}->read_u4le();
    $self->{usec} = $self->{_io}->read_s4le();
}

sub sec {
    my ($self) = @_;
    return $self->{sec};
}

sub usec {
    my ($self) = @_;
    return $self->{usec};
}

1;

# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package SudoersTs;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $TS_TYPE_GLOBAL = 1;
our $TS_TYPE_TTY = 2;
our $TS_TYPE_PPID = 3;
our $TS_TYPE_LOCKEXCL = 4;

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
        push @{$self->{records}}, SudoersTs::Record->new($self->{_io}, $self, $self->{_root});
    }
}

sub records {
    my ($self) = @_;
    return $self->{records};
}

########################################################################
package SudoersTs::RecordV2;

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

    $self->{type} = $self->{_io}->read_u2le();
    $self->{flags} = SudoersTs::TsFlag->new($self->{_io}, $self, $self->{_root});
    $self->{auth_uid} = $self->{_io}->read_u4le();
    $self->{sid} = $self->{_io}->read_u4le();
    $self->{start_time} = SudoersTs::Timespec->new($self->{_io}, $self, $self->{_root});
    $self->{ts} = SudoersTs::Timespec->new($self->{_io}, $self, $self->{_root});
    if ($self->type() == $SudoersTs::TS_TYPE_TTY) {
        $self->{ttydev} = $self->{_io}->read_u4le();
    }
    if ($self->type() == $SudoersTs::TS_TYPE_PPID) {
        $self->{ppid} = $self->{_io}->read_u4le();
    }
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub auth_uid {
    my ($self) = @_;
    return $self->{auth_uid};
}

sub sid {
    my ($self) = @_;
    return $self->{sid};
}

sub start_time {
    my ($self) = @_;
    return $self->{start_time};
}

sub ts {
    my ($self) = @_;
    return $self->{ts};
}

sub ttydev {
    my ($self) = @_;
    return $self->{ttydev};
}

sub ppid {
    my ($self) = @_;
    return $self->{ppid};
}

########################################################################
package SudoersTs::TsFlag;

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

    $self->{reserved0} = $self->{_io}->read_bits_int_be(6);
    $self->{anyuid} = $self->{_io}->read_bits_int_be(1);
    $self->{disabled} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved1} = $self->{_io}->read_bits_int_be(8);
}

sub reserved0 {
    my ($self) = @_;
    return $self->{reserved0};
}

sub anyuid {
    my ($self) = @_;
    return $self->{anyuid};
}

sub disabled {
    my ($self) = @_;
    return $self->{disabled};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

########################################################################
package SudoersTs::RecordV1;

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

    $self->{type} = $self->{_io}->read_u2le();
    $self->{flags} = SudoersTs::TsFlag->new($self->{_io}, $self, $self->{_root});
    $self->{auth_uid} = $self->{_io}->read_u4le();
    $self->{sid} = $self->{_io}->read_u4le();
    $self->{ts} = SudoersTs::Timespec->new($self->{_io}, $self, $self->{_root});
    if ($self->type() == $SudoersTs::TS_TYPE_TTY) {
        $self->{ttydev} = $self->{_io}->read_u4le();
    }
    if ($self->type() == $SudoersTs::TS_TYPE_PPID) {
        $self->{ppid} = $self->{_io}->read_u4le();
    }
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub auth_uid {
    my ($self) = @_;
    return $self->{auth_uid};
}

sub sid {
    my ($self) = @_;
    return $self->{sid};
}

sub ts {
    my ($self) = @_;
    return $self->{ts};
}

sub ttydev {
    my ($self) = @_;
    return $self->{ttydev};
}

sub ppid {
    my ($self) = @_;
    return $self->{ppid};
}

########################################################################
package SudoersTs::Timespec;

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

    $self->{sec} = $self->{_io}->read_s8le();
    $self->{nsec} = $self->{_io}->read_s8le();
}

sub sec {
    my ($self) = @_;
    return $self->{sec};
}

sub nsec {
    my ($self) = @_;
    return $self->{nsec};
}

########################################################################
package SudoersTs::Record;

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

    $self->{version} = $self->{_io}->read_u2le();
    $self->{len_record} = $self->{_io}->read_u2le();
    my $_on = $self->version();
    if ($_on == 1) {
        $self->{_raw_payload} = $self->{_io}->read_bytes(($self->len_record() - 4));
        my $io__raw_payload = IO::KaitaiStruct::Stream->new($self->{_raw_payload});
        $self->{payload} = SudoersTs::RecordV1->new($io__raw_payload, $self, $self->{_root});
    }
    elsif ($_on == 2) {
        $self->{_raw_payload} = $self->{_io}->read_bytes(($self->len_record() - 4));
        my $io__raw_payload = IO::KaitaiStruct::Stream->new($self->{_raw_payload});
        $self->{payload} = SudoersTs::RecordV2->new($io__raw_payload, $self, $self->{_root});
    }
    else {
        $self->{payload} = $self->{_io}->read_bytes(($self->len_record() - 4));
    }
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub len_record {
    my ($self) = @_;
    return $self->{len_record};
}

sub payload {
    my ($self) = @_;
    return $self->{payload};
}

sub _raw_payload {
    my ($self) = @_;
    return $self->{_raw_payload};
}

1;

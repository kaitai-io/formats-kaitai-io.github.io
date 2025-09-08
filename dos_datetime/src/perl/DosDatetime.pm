# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;

########################################################################
package DosDatetime;

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
    $self->{_root} = $_root || $self;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{time} = DosDatetime::Time->new($self->{_io}, $self, $self->{_root});
    $self->{date} = DosDatetime::Date->new($self->{_io}, $self, $self->{_root});
}

sub time {
    my ($self) = @_;
    return $self->{time};
}

sub date {
    my ($self) = @_;
    return $self->{date};
}

########################################################################
package DosDatetime::Date;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{day} = $self->{_io}->read_bits_int_le(5);
    $self->{month} = $self->{_io}->read_bits_int_le(4);
    $self->{year_minus_1980} = $self->{_io}->read_bits_int_le(7);
}

sub padded_day {
    my ($self) = @_;
    return $self->{padded_day} if ($self->{padded_day});
    $self->{padded_day} = ($self->day() <= 9 ? "0" : "") . sprintf('%d', $self->day());
    return $self->{padded_day};
}

sub padded_month {
    my ($self) = @_;
    return $self->{padded_month} if ($self->{padded_month});
    $self->{padded_month} = ($self->month() <= 9 ? "0" : "") . sprintf('%d', $self->month());
    return $self->{padded_month};
}

sub padded_year {
    my ($self) = @_;
    return $self->{padded_year} if ($self->{padded_year});
    $self->{padded_year} = ($self->year() <= 999 ? "0" . ($self->year() <= 99 ? "0" . ($self->year() <= 9 ? "0" : "") : "") : "") . sprintf('%d', $self->year());
    return $self->{padded_year};
}

sub year {
    my ($self) = @_;
    return $self->{year} if ($self->{year});
    $self->{year} = 1980 + $self->year_minus_1980();
    return $self->{year};
}

sub day {
    my ($self) = @_;
    return $self->{day};
}

sub month {
    my ($self) = @_;
    return $self->{month};
}

sub year_minus_1980 {
    my ($self) = @_;
    return $self->{year_minus_1980};
}

########################################################################
package DosDatetime::Time;

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
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{second_div_2} = $self->{_io}->read_bits_int_le(5);
    $self->{minute} = $self->{_io}->read_bits_int_le(6);
    $self->{hour} = $self->{_io}->read_bits_int_le(5);
}

sub padded_hour {
    my ($self) = @_;
    return $self->{padded_hour} if ($self->{padded_hour});
    $self->{padded_hour} = ($self->hour() <= 9 ? "0" : "") . sprintf('%d', $self->hour());
    return $self->{padded_hour};
}

sub padded_minute {
    my ($self) = @_;
    return $self->{padded_minute} if ($self->{padded_minute});
    $self->{padded_minute} = ($self->minute() <= 9 ? "0" : "") . sprintf('%d', $self->minute());
    return $self->{padded_minute};
}

sub padded_second {
    my ($self) = @_;
    return $self->{padded_second} if ($self->{padded_second});
    $self->{padded_second} = ($self->second() <= 9 ? "0" : "") . sprintf('%d', $self->second());
    return $self->{padded_second};
}

sub second {
    my ($self) = @_;
    return $self->{second} if ($self->{second});
    $self->{second} = 2 * $self->second_div_2();
    return $self->{second};
}

sub second_div_2 {
    my ($self) = @_;
    return $self->{second_div_2};
}

sub minute {
    my ($self) = @_;
    return $self->{minute};
}

sub hour {
    my ($self) = @_;
    return $self->{hour};
}

1;

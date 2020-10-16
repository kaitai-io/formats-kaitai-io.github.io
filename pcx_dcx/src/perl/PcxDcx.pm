# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Pcx;

########################################################################
package PcxDcx;

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

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{files} = ();
    do {
        $_ = PcxDcx::PcxOffset->new($self->{_io}, $self, $self->{_root});
        push @{$self->{files}}, $_;
    } until ($_->ofs_body() == 0);
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub files {
    my ($self) = @_;
    return $self->{files};
}

########################################################################
package PcxDcx::PcxOffset;

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

    $self->{ofs_body} = $self->{_io}->read_u4le();
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    if ($self->ofs_body() != 0) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->ofs_body());
        $self->{body} = Pcx->new($self->{_io});
        $self->{_io}->seek($_pos);
    }
    return $self->{body};
}

sub ofs_body {
    my ($self) = @_;
    return $self->{ofs_body};
}

1;

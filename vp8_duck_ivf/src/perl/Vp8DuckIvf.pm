# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package Vp8DuckIvf;

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

    $self->{magic1} = $self->{_io}->read_bytes(4);
    $self->{version} = $self->{_io}->read_u2le();
    $self->{len_header} = $self->{_io}->read_u2le();
    $self->{codec} = $self->{_io}->read_bytes(4);
    $self->{width} = $self->{_io}->read_u2le();
    $self->{height} = $self->{_io}->read_u2le();
    $self->{framerate} = $self->{_io}->read_u4le();
    $self->{timescale} = $self->{_io}->read_u4le();
    $self->{num_frames} = $self->{_io}->read_u4le();
    $self->{unused} = $self->{_io}->read_u4le();
    $self->{image_data} = ();
    my $n_image_data = $self->num_frames();
    for (my $i = 0; $i < $n_image_data; $i++) {
        push @{$self->{image_data}}, Vp8DuckIvf::Blocks->new($self->{_io}, $self, $self->{_root});
    }
}

sub magic1 {
    my ($self) = @_;
    return $self->{magic1};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub len_header {
    my ($self) = @_;
    return $self->{len_header};
}

sub codec {
    my ($self) = @_;
    return $self->{codec};
}

sub width {
    my ($self) = @_;
    return $self->{width};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub framerate {
    my ($self) = @_;
    return $self->{framerate};
}

sub timescale {
    my ($self) = @_;
    return $self->{timescale};
}

sub num_frames {
    my ($self) = @_;
    return $self->{num_frames};
}

sub unused {
    my ($self) = @_;
    return $self->{unused};
}

sub image_data {
    my ($self) = @_;
    return $self->{image_data};
}

########################################################################
package Vp8DuckIvf::Blocks;

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

    $self->{entries} = Vp8DuckIvf::Block->new($self->{_io}, $self, $self->{_root});
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Vp8DuckIvf::Block;

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

    $self->{len_frame} = $self->{_io}->read_u4le();
    $self->{timestamp} = $self->{_io}->read_u8le();
    $self->{framedata} = $self->{_io}->read_bytes($self->len_frame());
}

sub len_frame {
    my ($self) = @_;
    return $self->{len_frame};
}

sub timestamp {
    my ($self) = @_;
    return $self->{timestamp};
}

sub framedata {
    my ($self) = @_;
    return $self->{framedata};
}

1;

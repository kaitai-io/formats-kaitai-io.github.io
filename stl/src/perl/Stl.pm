# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;

########################################################################
package Stl;

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

    $self->{header} = $self->{_io}->read_bytes(80);
    $self->{num_triangles} = $self->{_io}->read_u4le();
    $self->{triangles} = ();
    my $n_triangles = $self->num_triangles();
    for (my $i = 0; $i < $n_triangles; $i++) {
        $self->{triangles}[$i] = Stl::Triangle->new($self->{_io}, $self, $self->{_root});
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub num_triangles {
    my ($self) = @_;
    return $self->{num_triangles};
}

sub triangles {
    my ($self) = @_;
    return $self->{triangles};
}

########################################################################
package Stl::Triangle;

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

    $self->{normal} = Stl::Vec3d->new($self->{_io}, $self, $self->{_root});
    $self->{vertices} = ();
    my $n_vertices = 3;
    for (my $i = 0; $i < $n_vertices; $i++) {
        $self->{vertices}[$i] = Stl::Vec3d->new($self->{_io}, $self, $self->{_root});
    }
    $self->{abr} = $self->{_io}->read_u2le();
}

sub normal {
    my ($self) = @_;
    return $self->{normal};
}

sub vertices {
    my ($self) = @_;
    return $self->{vertices};
}

sub abr {
    my ($self) = @_;
    return $self->{abr};
}

########################################################################
package Stl::Vec3d;

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

    $self->{x} = $self->{_io}->read_f4le();
    $self->{y} = $self->{_io}->read_f4le();
    $self->{z} = $self->{_io}->read_f4le();
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub z {
    my ($self) = @_;
    return $self->{z};
}

1;

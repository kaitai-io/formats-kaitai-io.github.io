# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;

########################################################################
package Pcx;

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

    $self->{_raw_hdr} = $self->{_io}->read_bytes(128);
    my $io__raw_hdr = IO::KaitaiStruct::Stream->new($self->{_raw_hdr});
    $self->{hdr} = Pcx::Header->new($io__raw_hdr, $self, $self->{_root});
}

sub hdr {
    my ($self) = @_;
    return $self->{hdr};
}

sub _raw_hdr {
    my ($self) = @_;
    return $self->{_raw_hdr};
}

########################################################################
package Pcx::Header;

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

    $self->{manufacturer} = $self->{_io}->read_u1();
    $self->{version} = $self->{_io}->read_u1();
    $self->{encoding} = $self->{_io}->read_u1();
    $self->{bits_per_pixel} = $self->{_io}->read_u1();
    $self->{img_x_min} = $self->{_io}->read_u2le();
    $self->{img_y_min} = $self->{_io}->read_u2le();
    $self->{img_x_max} = $self->{_io}->read_u2le();
    $self->{img_y_max} = $self->{_io}->read_u2le();
    $self->{hdpi} = $self->{_io}->read_u2le();
    $self->{vdpi} = $self->{_io}->read_u2le();
    $self->{colormap} = $self->{_io}->read_bytes(48);
    $self->{reserved} = $self->{_io}->read_bytes(1);
    $self->{num_planes} = $self->{_io}->read_u1();
    $self->{bytes_per_line} = $self->{_io}->read_u2le();
    $self->{palette_info} = $self->{_io}->read_u2le();
    $self->{h_screen_size} = $self->{_io}->read_u2le();
    $self->{v_screen_size} = $self->{_io}->read_u2le();
}

sub manufacturer {
    my ($self) = @_;
    return $self->{manufacturer};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub encoding {
    my ($self) = @_;
    return $self->{encoding};
}

sub bits_per_pixel {
    my ($self) = @_;
    return $self->{bits_per_pixel};
}

sub img_x_min {
    my ($self) = @_;
    return $self->{img_x_min};
}

sub img_y_min {
    my ($self) = @_;
    return $self->{img_y_min};
}

sub img_x_max {
    my ($self) = @_;
    return $self->{img_x_max};
}

sub img_y_max {
    my ($self) = @_;
    return $self->{img_y_max};
}

sub hdpi {
    my ($self) = @_;
    return $self->{hdpi};
}

sub vdpi {
    my ($self) = @_;
    return $self->{vdpi};
}

sub colormap {
    my ($self) = @_;
    return $self->{colormap};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub num_planes {
    my ($self) = @_;
    return $self->{num_planes};
}

sub bytes_per_line {
    my ($self) = @_;
    return $self->{bytes_per_line};
}

sub palette_info {
    my ($self) = @_;
    return $self->{palette_info};
}

sub h_screen_size {
    my ($self) = @_;
    return $self->{h_screen_size};
}

sub v_screen_size {
    my ($self) = @_;
    return $self->{v_screen_size};
}

1;

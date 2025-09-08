# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package AndroidBootldrAsus;

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

    $self->{magic} = $self->{_io}->read_bytes(8);
    $self->{revision} = $self->{_io}->read_u2le();
    $self->{reserved1} = $self->{_io}->read_u2le();
    $self->{reserved2} = $self->{_io}->read_u4le();
    $self->{images} = [];
    my $n_images = 3;
    for (my $i = 0; $i < $n_images; $i++) {
        push @{$self->{images}}, AndroidBootldrAsus::Image->new($self->{_io}, $self, $self->{_root});
    }
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub revision {
    my ($self) = @_;
    return $self->{revision};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub images {
    my ($self) = @_;
    return $self->{images};
}

########################################################################
package AndroidBootldrAsus::Image;

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

    $self->{chunk_id} = Encode::decode("ASCII", $self->{_io}->read_bytes(8));
    $self->{len_body} = $self->{_io}->read_u4le();
    $self->{flags} = $self->{_io}->read_u1();
    {
        my $_it = $self->{flags};
    }
    $self->{reserved1} = $self->{_io}->read_u1();
    $self->{reserved2} = $self->{_io}->read_u1();
    $self->{reserved3} = $self->{_io}->read_u1();
    $self->{body} = $self->{_io}->read_bytes($self->len_body());
}

sub file_name {
    my ($self) = @_;
    return $self->{file_name} if ($self->{file_name});
    $self->{file_name} = ($self->chunk_id() eq "IFWI!!!!" ? "ifwi.bin" : ($self->chunk_id() eq "DROIDBT!" ? "droidboot.img" : ($self->chunk_id() eq "SPLASHS!" ? "splashscreen.img" : "")));
    return $self->{file_name};
}

sub chunk_id {
    my ($self) = @_;
    return $self->{chunk_id};
}

sub len_body {
    my ($self) = @_;
    return $self->{len_body};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub reserved3 {
    my ($self) = @_;
    return $self->{reserved3};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

1;

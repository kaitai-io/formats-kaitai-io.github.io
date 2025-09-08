# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package AndroidBootldrQcom;

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
    $self->{num_images} = $self->{_io}->read_u4le();
    $self->{ofs_img_bodies} = $self->{_io}->read_u4le();
    $self->{bootloader_size} = $self->{_io}->read_u4le();
    $self->{img_headers} = [];
    my $n_img_headers = $self->num_images();
    for (my $i = 0; $i < $n_img_headers; $i++) {
        push @{$self->{img_headers}}, AndroidBootldrQcom::ImgHeader->new($self->{_io}, $self, $self->{_root});
    }
}

sub img_bodies {
    my ($self) = @_;
    return $self->{img_bodies} if ($self->{img_bodies});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_img_bodies());
    $self->{img_bodies} = [];
    my $n_img_bodies = $self->num_images();
    for (my $i = 0; $i < $n_img_bodies; $i++) {
        push @{$self->{img_bodies}}, AndroidBootldrQcom::ImgBody->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_io}->seek($_pos);
    return $self->{img_bodies};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub num_images {
    my ($self) = @_;
    return $self->{num_images};
}

sub ofs_img_bodies {
    my ($self) = @_;
    return $self->{ofs_img_bodies};
}

sub bootloader_size {
    my ($self) = @_;
    return $self->{bootloader_size};
}

sub img_headers {
    my ($self) = @_;
    return $self->{img_headers};
}

########################################################################
package AndroidBootldrQcom::ImgBody;

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

    $self->{body} = $self->{_io}->read_bytes($self->img_header()->len_body());
}

sub img_header {
    my ($self) = @_;
    return $self->{img_header} if ($self->{img_header});
    $self->{img_header} = @{$self->_root()->img_headers()}[$self->idx()];
    return $self->{img_header};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub idx {
    my ($self) = @_;
    return $self->{idx};
}

########################################################################
package AndroidBootldrQcom::ImgHeader;

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

    $self->{name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(64), 0, 0));
    $self->{len_body} = $self->{_io}->read_u4le();
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub len_body {
    my ($self) = @_;
    return $self->{len_body};
}

1;

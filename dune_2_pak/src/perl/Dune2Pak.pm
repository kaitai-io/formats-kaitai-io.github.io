# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package Dune2Pak;

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

    $self->{_raw_dir} = $self->{_io}->read_bytes($self->dir_size());
    my $io__raw_dir = IO::KaitaiStruct::Stream->new($self->{_raw_dir});
    $self->{dir} = Dune2Pak::Files->new($io__raw_dir, $self, $self->{_root});
}

sub dir_size {
    my ($self) = @_;
    return $self->{dir_size} if ($self->{dir_size});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{dir_size} = $self->{_io}->read_u4le();
    $self->{_io}->seek($_pos);
    return $self->{dir_size};
}

sub dir {
    my ($self) = @_;
    return $self->{dir};
}

sub _raw_dir {
    my ($self) = @_;
    return $self->{_raw_dir};
}

########################################################################
package Dune2Pak::File;

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

    $self->{ofs} = $self->{_io}->read_u4le();
    if ($self->ofs() != 0) {
        $self->{file_name} = Encode::decode("ASCII", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    }
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    if ($self->ofs() != 0) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek($self->ofs());
        $self->{body} = $io->read_bytes($self->next_ofs() - $self->ofs());
        $io->seek($_pos);
    }
    return $self->{body};
}

sub next_ofs {
    my ($self) = @_;
    return $self->{next_ofs} if ($self->{next_ofs});
    if ($self->ofs() != 0) {
        $self->{next_ofs} = ($self->next_ofs0() == 0 ? $self->_root()->_io()->size() : $self->next_ofs0());
    }
    return $self->{next_ofs};
}

sub next_ofs0 {
    my ($self) = @_;
    return $self->{next_ofs0} if ($self->{next_ofs0});
    if ($self->ofs() != 0) {
        $self->{next_ofs0} = @{$self->_root()->dir()->files()}[$self->idx() + 1]->ofs();
    }
    return $self->{next_ofs0};
}

sub ofs {
    my ($self) = @_;
    return $self->{ofs};
}

sub file_name {
    my ($self) = @_;
    return $self->{file_name};
}

sub idx {
    my ($self) = @_;
    return $self->{idx};
}

########################################################################
package Dune2Pak::Files;

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

    $self->{files} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{files}}, Dune2Pak::File->new($self->{_io}, $self, $self->{_root});
    }
}

sub files {
    my ($self) = @_;
    return $self->{files};
}

1;

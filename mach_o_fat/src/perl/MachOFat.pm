# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use MachO;

########################################################################
package MachOFat;

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

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{num_fat_arch} = $self->{_io}->read_u4be();
    $self->{fat_archs} = [];
    my $n_fat_archs = $self->num_fat_arch();
    for (my $i = 0; $i < $n_fat_archs; $i++) {
        push @{$self->{fat_archs}}, MachOFat::FatArch->new($self->{_io}, $self, $self->{_root});
    }
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub num_fat_arch {
    my ($self) = @_;
    return $self->{num_fat_arch};
}

sub fat_archs {
    my ($self) = @_;
    return $self->{fat_archs};
}

########################################################################
package MachOFat::FatArch;

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

    $self->{cpu_type} = $self->{_io}->read_u4be();
    $self->{cpu_subtype} = $self->{_io}->read_u4be();
    $self->{ofs_object} = $self->{_io}->read_u4be();
    $self->{len_object} = $self->{_io}->read_u4be();
    $self->{align} = $self->{_io}->read_u4be();
}

sub object {
    my ($self) = @_;
    return $self->{object} if ($self->{object});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_object());
    $self->{_raw_object} = $self->{_io}->read_bytes($self->len_object());
    my $io__raw_object = IO::KaitaiStruct::Stream->new($self->{_raw_object});
    $self->{object} = MachO->new($io__raw_object);
    $self->{_io}->seek($_pos);
    return $self->{object};
}

sub cpu_type {
    my ($self) = @_;
    return $self->{cpu_type};
}

sub cpu_subtype {
    my ($self) = @_;
    return $self->{cpu_subtype};
}

sub ofs_object {
    my ($self) = @_;
    return $self->{ofs_object};
}

sub len_object {
    my ($self) = @_;
    return $self->{len_object};
}

sub align {
    my ($self) = @_;
    return $self->{align};
}

sub _raw_object {
    my ($self) = @_;
    return $self->{_raw_object};
}

1;

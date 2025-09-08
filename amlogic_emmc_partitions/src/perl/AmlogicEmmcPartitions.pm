# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package AmlogicEmmcPartitions;

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
    $self->{version} = Encode::decode("UTF-8", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(12), 0, 0));
    $self->{num_partitions} = $self->{_io}->read_s4le();
    $self->{checksum} = $self->{_io}->read_u4le();
    $self->{partitions} = [];
    my $n_partitions = $self->num_partitions();
    for (my $i = 0; $i < $n_partitions; $i++) {
        push @{$self->{partitions}}, AmlogicEmmcPartitions::Partition->new($self->{_io}, $self, $self->{_root});
    }
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub num_partitions {
    my ($self) = @_;
    return $self->{num_partitions};
}

sub checksum {
    my ($self) = @_;
    return $self->{checksum};
}

sub partitions {
    my ($self) = @_;
    return $self->{partitions};
}

########################################################################
package AmlogicEmmcPartitions::Partition;

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

    $self->{name} = Encode::decode("UTF-8", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(16), 0, 0));
    $self->{size} = $self->{_io}->read_u8le();
    $self->{offset} = $self->{_io}->read_u8le();
    $self->{_raw_flags} = $self->{_io}->read_bytes(4);
    my $io__raw_flags = IO::KaitaiStruct::Stream->new($self->{_raw_flags});
    $self->{flags} = AmlogicEmmcPartitions::Partition::PartFlags->new($io__raw_flags, $self, $self->{_root});
    $self->{padding} = $self->{_io}->read_bytes(4);
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

sub _raw_flags {
    my ($self) = @_;
    return $self->{_raw_flags};
}

########################################################################
package AmlogicEmmcPartitions::Partition::PartFlags;

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

    $self->{is_code} = $self->{_io}->read_bits_int_le(1);
    $self->{is_cache} = $self->{_io}->read_bits_int_le(1);
    $self->{is_data} = $self->{_io}->read_bits_int_le(1);
}

sub is_code {
    my ($self) = @_;
    return $self->{is_code};
}

sub is_cache {
    my ($self) = @_;
    return $self->{is_cache};
}

sub is_data {
    my ($self) = @_;
    return $self->{is_data};
}

1;

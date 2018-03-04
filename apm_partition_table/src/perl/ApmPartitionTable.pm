# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package ApmPartitionTable;

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

}

sub sector_size {
    my ($self) = @_;
    return $self->{sector_size} if ($self->{sector_size});
    $self->{sector_size} = 512;
    return $self->{sector_size};
}

sub partition_lookup {
    my ($self) = @_;
    return $self->{partition_lookup} if ($self->{partition_lookup});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->_root()->sector_size());
    $self->{_raw_partition_lookup} = $io->read_bytes($self->sector_size());
    my $io__raw_partition_lookup = IO::KaitaiStruct::Stream->new($self->{_raw_partition_lookup});
    $self->{partition_lookup} = ApmPartitionTable::PartitionEntry->new($io__raw_partition_lookup, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{partition_lookup};
}

sub partition_entries {
    my ($self) = @_;
    return $self->{partition_entries} if ($self->{partition_entries});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->_root()->sector_size());
    $self->{_raw_partition_entries} = ();
    $self->{partition_entries} = ();
    my $n_partition_entries = $self->_root()->partition_lookup()->number_of_partitions();
    for (my $i = 0; $i < $n_partition_entries; $i++) {
        $self->{_raw_partition_entries}[$i] = $io->read_bytes($self->sector_size());
        my $io__raw_partition_entries = IO::KaitaiStruct::Stream->new($self->{_raw_partition_entries}[$i]);
        $self->{partition_entries}[$i] = ApmPartitionTable::PartitionEntry->new($io__raw_partition_entries, $self, $self->{_root});
    }
    $io->seek($_pos);
    return $self->{partition_entries};
}

sub _raw_partition_lookup {
    my ($self) = @_;
    return $self->{_raw_partition_lookup};
}

sub _raw_partition_entries {
    my ($self) = @_;
    return $self->{_raw_partition_entries};
}

########################################################################
package ApmPartitionTable::PartitionEntry;

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

    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (80, 77)));
    $self->{reserved_1} = $self->{_io}->read_bytes(2);
    $self->{number_of_partitions} = $self->{_io}->read_u4be();
    $self->{partition_start} = $self->{_io}->read_u4be();
    $self->{partition_size} = $self->{_io}->read_u4be();
    $self->{partition_name} = Encode::decode("ascii", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(32), 0, 0));
    $self->{partition_type} = Encode::decode("ascii", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(32), 0, 0));
    $self->{data_start} = $self->{_io}->read_u4be();
    $self->{data_size} = $self->{_io}->read_u4be();
    $self->{partition_status} = $self->{_io}->read_u4be();
    $self->{boot_code_start} = $self->{_io}->read_u4be();
    $self->{boot_code_size} = $self->{_io}->read_u4be();
    $self->{boot_loader_address} = $self->{_io}->read_u4be();
    $self->{reserved_2} = $self->{_io}->read_bytes(4);
    $self->{boot_code_entry} = $self->{_io}->read_u4be();
    $self->{reserved_3} = $self->{_io}->read_bytes(4);
    $self->{boot_code_cksum} = $self->{_io}->read_u4be();
    $self->{processor_type} = Encode::decode("ascii", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(16), 0, 0));
}

sub partition {
    my ($self) = @_;
    return $self->{partition} if ($self->{partition});
    if (($self->partition_status() & 1) != 0) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek(($self->partition_start() * $self->_root()->sector_size()));
        $self->{partition} = $io->read_bytes(($self->partition_size() * $self->_root()->sector_size()));
        $io->seek($_pos);
    }
    return $self->{partition};
}

sub data {
    my ($self) = @_;
    return $self->{data} if ($self->{data});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek(($self->data_start() * $self->_root()->sector_size()));
    $self->{data} = $io->read_bytes(($self->data_size() * $self->_root()->sector_size()));
    $io->seek($_pos);
    return $self->{data};
}

sub boot_code {
    my ($self) = @_;
    return $self->{boot_code} if ($self->{boot_code});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek(($self->boot_code_start() * $self->_root()->sector_size()));
    $self->{boot_code} = $io->read_bytes($self->boot_code_size());
    $io->seek($_pos);
    return $self->{boot_code};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub reserved_1 {
    my ($self) = @_;
    return $self->{reserved_1};
}

sub number_of_partitions {
    my ($self) = @_;
    return $self->{number_of_partitions};
}

sub partition_start {
    my ($self) = @_;
    return $self->{partition_start};
}

sub partition_size {
    my ($self) = @_;
    return $self->{partition_size};
}

sub partition_name {
    my ($self) = @_;
    return $self->{partition_name};
}

sub partition_type {
    my ($self) = @_;
    return $self->{partition_type};
}

sub data_start {
    my ($self) = @_;
    return $self->{data_start};
}

sub data_size {
    my ($self) = @_;
    return $self->{data_size};
}

sub partition_status {
    my ($self) = @_;
    return $self->{partition_status};
}

sub boot_code_start {
    my ($self) = @_;
    return $self->{boot_code_start};
}

sub boot_code_size {
    my ($self) = @_;
    return $self->{boot_code_size};
}

sub boot_loader_address {
    my ($self) = @_;
    return $self->{boot_loader_address};
}

sub reserved_2 {
    my ($self) = @_;
    return $self->{reserved_2};
}

sub boot_code_entry {
    my ($self) = @_;
    return $self->{boot_code_entry};
}

sub reserved_3 {
    my ($self) = @_;
    return $self->{reserved_3};
}

sub boot_code_cksum {
    my ($self) = @_;
    return $self->{boot_code_cksum};
}

sub processor_type {
    my ($self) = @_;
    return $self->{processor_type};
}

1;

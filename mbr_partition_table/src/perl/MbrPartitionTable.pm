# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;

########################################################################
package MbrPartitionTable;

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

    $self->{bootstrap_code} = $self->{_io}->read_bytes(446);
    $self->{partitions} = ();
    my $n_partitions = 4;
    for (my $i = 0; $i < $n_partitions; $i++) {
        $self->{partitions}[$i] = MbrPartitionTable::PartitionEntry->new($self->{_io}, $self, $self->{_root});
    }
    $self->{boot_signature} = $self->{_io}->ensure_fixed_contents(pack('C*', (85, 170)));
}

sub bootstrap_code {
    my ($self) = @_;
    return $self->{bootstrap_code};
}

sub partitions {
    my ($self) = @_;
    return $self->{partitions};
}

sub boot_signature {
    my ($self) = @_;
    return $self->{boot_signature};
}

########################################################################
package MbrPartitionTable::PartitionEntry;

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

    $self->{status} = $self->{_io}->read_u1();
    $self->{chs_start} = MbrPartitionTable::Chs->new($self->{_io}, $self, $self->{_root});
    $self->{partition_type} = $self->{_io}->read_u1();
    $self->{chs_end} = MbrPartitionTable::Chs->new($self->{_io}, $self, $self->{_root});
    $self->{lba_start} = $self->{_io}->read_u4le();
    $self->{num_sectors} = $self->{_io}->read_u4le();
}

sub status {
    my ($self) = @_;
    return $self->{status};
}

sub chs_start {
    my ($self) = @_;
    return $self->{chs_start};
}

sub partition_type {
    my ($self) = @_;
    return $self->{partition_type};
}

sub chs_end {
    my ($self) = @_;
    return $self->{chs_end};
}

sub lba_start {
    my ($self) = @_;
    return $self->{lba_start};
}

sub num_sectors {
    my ($self) = @_;
    return $self->{num_sectors};
}

########################################################################
package MbrPartitionTable::Chs;

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

    $self->{head} = $self->{_io}->read_u1();
    $self->{b2} = $self->{_io}->read_u1();
    $self->{b3} = $self->{_io}->read_u1();
}

sub sector {
    my ($self) = @_;
    return $self->{sector} if ($self->{sector});
    $self->{sector} = ($self->b2() & 63);
    return $self->{sector};
}

sub cylinder {
    my ($self) = @_;
    return $self->{cylinder} if ($self->{cylinder});
    $self->{cylinder} = ($self->b3() + (($self->b2() & 192) << 2));
    return $self->{cylinder};
}

sub head {
    my ($self) = @_;
    return $self->{head};
}

sub b2 {
    my ($self) = @_;
    return $self->{b2};
}

sub b3 {
    my ($self) = @_;
    return $self->{b3};
}

1;

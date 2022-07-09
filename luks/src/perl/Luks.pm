# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package Luks;

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

    $self->{partition_header} = Luks::PartitionHeader->new($self->{_io}, $self, $self->{_root});
}

sub payload {
    my ($self) = @_;
    return $self->{payload} if ($self->{payload});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(($self->partition_header()->payload_offset() * 512));
    $self->{payload} = $self->{_io}->read_bytes_full();
    $self->{_io}->seek($_pos);
    return $self->{payload};
}

sub partition_header {
    my ($self) = @_;
    return $self->{partition_header};
}

########################################################################
package Luks::PartitionHeader;

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

    $self->{magic} = $self->{_io}->read_bytes(6);
    $self->{version} = $self->{_io}->read_bytes(2);
    $self->{cipher_name_specification} = Encode::decode("ASCII", $self->{_io}->read_bytes(32));
    $self->{cipher_mode_specification} = Encode::decode("ASCII", $self->{_io}->read_bytes(32));
    $self->{hash_specification} = Encode::decode("ASCII", $self->{_io}->read_bytes(32));
    $self->{payload_offset} = $self->{_io}->read_u4be();
    $self->{number_of_key_bytes} = $self->{_io}->read_u4be();
    $self->{master_key_checksum} = $self->{_io}->read_bytes(20);
    $self->{master_key_salt_parameter} = $self->{_io}->read_bytes(32);
    $self->{master_key_iterations_parameter} = $self->{_io}->read_u4be();
    $self->{uuid} = Encode::decode("ASCII", $self->{_io}->read_bytes(40));
    $self->{key_slots} = ();
    my $n_key_slots = 8;
    for (my $i = 0; $i < $n_key_slots; $i++) {
        push @{$self->{key_slots}}, Luks::PartitionHeader::KeySlot->new($self->{_io}, $self, $self->{_root});
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

sub cipher_name_specification {
    my ($self) = @_;
    return $self->{cipher_name_specification};
}

sub cipher_mode_specification {
    my ($self) = @_;
    return $self->{cipher_mode_specification};
}

sub hash_specification {
    my ($self) = @_;
    return $self->{hash_specification};
}

sub payload_offset {
    my ($self) = @_;
    return $self->{payload_offset};
}

sub number_of_key_bytes {
    my ($self) = @_;
    return $self->{number_of_key_bytes};
}

sub master_key_checksum {
    my ($self) = @_;
    return $self->{master_key_checksum};
}

sub master_key_salt_parameter {
    my ($self) = @_;
    return $self->{master_key_salt_parameter};
}

sub master_key_iterations_parameter {
    my ($self) = @_;
    return $self->{master_key_iterations_parameter};
}

sub uuid {
    my ($self) = @_;
    return $self->{uuid};
}

sub key_slots {
    my ($self) = @_;
    return $self->{key_slots};
}

########################################################################
package Luks::PartitionHeader::KeySlot;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $KEY_SLOT_STATES_DISABLED_KEY_SLOT = 57005;
our $KEY_SLOT_STATES_ENABLED_KEY_SLOT = 11301363;

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

    $self->{state_of_key_slot} = $self->{_io}->read_u4be();
    $self->{iteration_parameter} = $self->{_io}->read_u4be();
    $self->{salt_parameter} = $self->{_io}->read_bytes(32);
    $self->{start_sector_of_key_material} = $self->{_io}->read_u4be();
    $self->{number_of_anti_forensic_stripes} = $self->{_io}->read_u4be();
}

sub key_material {
    my ($self) = @_;
    return $self->{key_material} if ($self->{key_material});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(($self->start_sector_of_key_material() * 512));
    $self->{key_material} = $self->{_io}->read_bytes(($self->_parent()->number_of_key_bytes() * $self->number_of_anti_forensic_stripes()));
    $self->{_io}->seek($_pos);
    return $self->{key_material};
}

sub state_of_key_slot {
    my ($self) = @_;
    return $self->{state_of_key_slot};
}

sub iteration_parameter {
    my ($self) = @_;
    return $self->{iteration_parameter};
}

sub salt_parameter {
    my ($self) = @_;
    return $self->{salt_parameter};
}

sub start_sector_of_key_material {
    my ($self) = @_;
    return $self->{start_sector_of_key_material};
}

sub number_of_anti_forensic_stripes {
    my ($self) = @_;
    return $self->{number_of_anti_forensic_stripes};
}

1;

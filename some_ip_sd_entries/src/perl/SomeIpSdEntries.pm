# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package SomeIpSdEntries;

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

    $self->{entries} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, SomeIpSdEntries::SdEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package SomeIpSdEntries::SdEntry;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $ENTRY_TYPES_FIND = 0;
our $ENTRY_TYPES_OFFER = 1;
our $ENTRY_TYPES_SUBSCRIBE = 6;
our $ENTRY_TYPES_SUBSCRIBE_ACK = 7;

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

    $self->{header} = SomeIpSdEntries::SdEntry::SdEntryHeader->new($self->{_io}, $self, $self->{_root});
    my $_on = $self->header()->type();
    if ($_on == $SomeIpSdEntries::SdEntry::ENTRY_TYPES_FIND) {
        $self->{content} = SomeIpSdEntries::SdEntry::SdServiceEntry->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $SomeIpSdEntries::SdEntry::ENTRY_TYPES_OFFER) {
        $self->{content} = SomeIpSdEntries::SdEntry::SdServiceEntry->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $SomeIpSdEntries::SdEntry::ENTRY_TYPES_SUBSCRIBE) {
        $self->{content} = SomeIpSdEntries::SdEntry::SdEventgroupEntry->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $SomeIpSdEntries::SdEntry::ENTRY_TYPES_SUBSCRIBE_ACK) {
        $self->{content} = SomeIpSdEntries::SdEntry::SdEventgroupEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub content {
    my ($self) = @_;
    return $self->{content};
}

########################################################################
package SomeIpSdEntries::SdEntry::SdEntryHeader;

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

    $self->{type} = $self->{_io}->read_u1();
    $self->{index_first_options} = $self->{_io}->read_u1();
    $self->{index_second_options} = $self->{_io}->read_u1();
    $self->{number_first_options} = $self->{_io}->read_bits_int_be(4);
    $self->{number_second_options} = $self->{_io}->read_bits_int_be(4);
    $self->{_io}->align_to_byte();
    $self->{service_id} = $self->{_io}->read_u2be();
    $self->{instance_id} = $self->{_io}->read_u2be();
    $self->{major_version} = $self->{_io}->read_u1();
    $self->{ttl} = $self->{_io}->read_bits_int_be(24);
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub index_first_options {
    my ($self) = @_;
    return $self->{index_first_options};
}

sub index_second_options {
    my ($self) = @_;
    return $self->{index_second_options};
}

sub number_first_options {
    my ($self) = @_;
    return $self->{number_first_options};
}

sub number_second_options {
    my ($self) = @_;
    return $self->{number_second_options};
}

sub service_id {
    my ($self) = @_;
    return $self->{service_id};
}

sub instance_id {
    my ($self) = @_;
    return $self->{instance_id};
}

sub major_version {
    my ($self) = @_;
    return $self->{major_version};
}

sub ttl {
    my ($self) = @_;
    return $self->{ttl};
}

########################################################################
package SomeIpSdEntries::SdEntry::SdServiceEntry;

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

    $self->{minor_version} = $self->{_io}->read_u4be();
}

sub minor_version {
    my ($self) = @_;
    return $self->{minor_version};
}

########################################################################
package SomeIpSdEntries::SdEntry::SdEventgroupEntry;

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

    $self->{reserved} = $self->{_io}->read_u1();
    $self->{initial_data_requested} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved2} = $self->{_io}->read_bits_int_be(3);
    $self->{counter} = $self->{_io}->read_bits_int_be(4);
    $self->{_io}->align_to_byte();
    $self->{event_group_id} = $self->{_io}->read_u2be();
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub initial_data_requested {
    my ($self) = @_;
    return $self->{initial_data_requested};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub counter {
    my ($self) = @_;
    return $self->{counter};
}

sub event_group_id {
    my ($self) = @_;
    return $self->{event_group_id};
}

1;

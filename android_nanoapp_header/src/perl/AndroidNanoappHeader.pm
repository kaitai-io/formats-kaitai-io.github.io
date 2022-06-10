# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package AndroidNanoappHeader;

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

    $self->{header_version} = $self->{_io}->read_u4le();
    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{app_id} = $self->{_io}->read_u8le();
    $self->{app_version} = $self->{_io}->read_u4le();
    $self->{flags} = $self->{_io}->read_u4le();
    $self->{hub_type} = $self->{_io}->read_u8le();
    $self->{chre_api_major_version} = $self->{_io}->read_u1();
    $self->{chre_api_minor_version} = $self->{_io}->read_u1();
    $self->{reserved} = $self->{_io}->read_bytes(6);
}

sub is_signed {
    my ($self) = @_;
    return $self->{is_signed} if ($self->{is_signed});
    $self->{is_signed} = ($self->flags() & 1) != 0;
    return $self->{is_signed};
}

sub is_encrypted {
    my ($self) = @_;
    return $self->{is_encrypted} if ($self->{is_encrypted});
    $self->{is_encrypted} = ($self->flags() & 2) != 0;
    return $self->{is_encrypted};
}

sub is_tcm_capable {
    my ($self) = @_;
    return $self->{is_tcm_capable} if ($self->{is_tcm_capable});
    $self->{is_tcm_capable} = ($self->flags() & 4) != 0;
    return $self->{is_tcm_capable};
}

sub header_version {
    my ($self) = @_;
    return $self->{header_version};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub app_id {
    my ($self) = @_;
    return $self->{app_id};
}

sub app_version {
    my ($self) = @_;
    return $self->{app_version};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub hub_type {
    my ($self) = @_;
    return $self->{hub_type};
}

sub chre_api_major_version {
    my ($self) = @_;
    return $self->{chre_api_major_version};
}

sub chre_api_minor_version {
    my ($self) = @_;
    return $self->{chre_api_minor_version};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

1;

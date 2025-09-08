# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use SomeIpSd;

########################################################################
package SomeIp;

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

    $self->{header} = SomeIp::Header->new($self->{_io}, $self, $self->{_root});
    my $_on = $self->header()->message_id()->value();
    if ($_on == 4294934784) {
        $self->{_raw_payload} = $self->{_io}->read_bytes($self->header()->length() - 8);
        my $io__raw_payload = IO::KaitaiStruct::Stream->new($self->{_raw_payload});
        $self->{payload} = SomeIpSd->new($io__raw_payload);
    }
    else {
        $self->{payload} = $self->{_io}->read_bytes($self->header()->length() - 8);
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub payload {
    my ($self) = @_;
    return $self->{payload};
}

sub _raw_payload {
    my ($self) = @_;
    return $self->{_raw_payload};
}

########################################################################
package SomeIp::Header;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $MESSAGE_TYPE_ENUM_REQUEST = 0;
our $MESSAGE_TYPE_ENUM_REQUEST_NO_RETURN = 1;
our $MESSAGE_TYPE_ENUM_NOTIFICATION = 2;
our $MESSAGE_TYPE_ENUM_REQUEST_ACK = 64;
our $MESSAGE_TYPE_ENUM_REQUEST_NO_RETURN_ACK = 65;
our $MESSAGE_TYPE_ENUM_NOTIFICATION_ACK = 66;
our $MESSAGE_TYPE_ENUM_RESPONSE = 128;
our $MESSAGE_TYPE_ENUM_ERROR = 129;
our $MESSAGE_TYPE_ENUM_RESPONSE_ACK = 192;
our $MESSAGE_TYPE_ENUM_ERROR_ACK = 193;

our $RETURN_CODE_ENUM_OK = 0;
our $RETURN_CODE_ENUM_NOT_OK = 1;
our $RETURN_CODE_ENUM_UNKNOWN_SERVICE = 2;
our $RETURN_CODE_ENUM_UNKNOWN_METHOD = 3;
our $RETURN_CODE_ENUM_NOT_READY = 4;
our $RETURN_CODE_ENUM_NOT_REACHABLE = 5;
our $RETURN_CODE_ENUM_TIME_OUT = 6;
our $RETURN_CODE_ENUM_WRONG_PROTOCOL_VERSION = 7;
our $RETURN_CODE_ENUM_WRONG_INTERFACE_VERSION = 8;
our $RETURN_CODE_ENUM_MALFORMED_MESSAGE = 9;
our $RETURN_CODE_ENUM_WRONG_MESSAGE_TYPE = 10;

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

    $self->{_raw_message_id} = $self->{_io}->read_bytes(4);
    my $io__raw_message_id = IO::KaitaiStruct::Stream->new($self->{_raw_message_id});
    $self->{message_id} = SomeIp::Header::MessageId->new($io__raw_message_id, $self, $self->{_root});
    $self->{length} = $self->{_io}->read_u4be();
    $self->{_raw_request_id} = $self->{_io}->read_bytes(4);
    my $io__raw_request_id = IO::KaitaiStruct::Stream->new($self->{_raw_request_id});
    $self->{request_id} = SomeIp::Header::RequestId->new($io__raw_request_id, $self, $self->{_root});
    $self->{protocol_version} = $self->{_io}->read_u1();
    $self->{interface_version} = $self->{_io}->read_u1();
    $self->{message_type} = $self->{_io}->read_u1();
    $self->{return_code} = $self->{_io}->read_u1();
}

sub is_valid_service_discovery {
    my ($self) = @_;
    return $self->{is_valid_service_discovery} if ($self->{is_valid_service_discovery});
    $self->{is_valid_service_discovery} =  (($self->message_id()->value() == 4294934784) && ($self->protocol_version() == 1) && ($self->interface_version() == 1) && ($self->message_type() == $SomeIp::Header::MESSAGE_TYPE_ENUM_NOTIFICATION) && ($self->return_code() == $SomeIp::Header::RETURN_CODE_ENUM_OK)) ;
    return $self->{is_valid_service_discovery};
}

sub message_id {
    my ($self) = @_;
    return $self->{message_id};
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub request_id {
    my ($self) = @_;
    return $self->{request_id};
}

sub protocol_version {
    my ($self) = @_;
    return $self->{protocol_version};
}

sub interface_version {
    my ($self) = @_;
    return $self->{interface_version};
}

sub message_type {
    my ($self) = @_;
    return $self->{message_type};
}

sub return_code {
    my ($self) = @_;
    return $self->{return_code};
}

sub _raw_message_id {
    my ($self) = @_;
    return $self->{_raw_message_id};
}

sub _raw_request_id {
    my ($self) = @_;
    return $self->{_raw_request_id};
}

########################################################################
package SomeIp::Header::MessageId;

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

    $self->{service_id} = $self->{_io}->read_u2be();
    $self->{sub_id} = $self->{_io}->read_bits_int_be(1);
    if ($self->sub_id() == 0) {
        $self->{method_id} = $self->{_io}->read_bits_int_be(15);
    }
    if ($self->sub_id() == 1) {
        $self->{event_id} = $self->{_io}->read_bits_int_be(15);
    }
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{value} = $self->{_io}->read_u4be();
    $self->{_io}->seek($_pos);
    return $self->{value};
}

sub service_id {
    my ($self) = @_;
    return $self->{service_id};
}

sub sub_id {
    my ($self) = @_;
    return $self->{sub_id};
}

sub method_id {
    my ($self) = @_;
    return $self->{method_id};
}

sub event_id {
    my ($self) = @_;
    return $self->{event_id};
}

########################################################################
package SomeIp::Header::RequestId;

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

    $self->{client_id} = $self->{_io}->read_u2be();
    $self->{session_id} = $self->{_io}->read_u2be();
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{value} = $self->{_io}->read_u4be();
    $self->{_io}->seek($_pos);
    return $self->{value};
}

sub client_id {
    my ($self) = @_;
    return $self->{client_id};
}

sub session_id {
    my ($self) = @_;
    return $self->{session_id};
}

1;

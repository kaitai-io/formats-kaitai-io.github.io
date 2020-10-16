# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package Websocket;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $OPCODE_CONTINUATION = 0;
our $OPCODE_TEXT = 1;
our $OPCODE_BINARY = 2;
our $OPCODE_RESERVED_3 = 3;
our $OPCODE_RESERVED_4 = 4;
our $OPCODE_RESERVED_5 = 5;
our $OPCODE_RESERVED_6 = 6;
our $OPCODE_RESERVED_7 = 7;
our $OPCODE_CLOSE = 8;
our $OPCODE_PING = 9;
our $OPCODE_PONG = 10;
our $OPCODE_RESERVED_CONTROL_B = 11;
our $OPCODE_RESERVED_CONTROL_C = 12;
our $OPCODE_RESERVED_CONTROL_D = 13;
our $OPCODE_RESERVED_CONTROL_E = 14;
our $OPCODE_RESERVED_CONTROL_F = 15;

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

    $self->{initial_frame} = Websocket::InitialFrame->new($self->{_io}, $self, $self->{_root});
    if ($self->initial_frame()->header()->finished() != 1) {
        $self->{trailing_frames} = ();
        do {
            $_ = Websocket::Dataframe->new($self->{_io}, $self, $self->{_root});
            push @{$self->{trailing_frames}}, $_;
        } until ($_->header()->finished());
    }
}

sub initial_frame {
    my ($self) = @_;
    return $self->{initial_frame};
}

sub trailing_frames {
    my ($self) = @_;
    return $self->{trailing_frames};
}

########################################################################
package Websocket::FrameHeader;

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

    $self->{finished} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved} = $self->{_io}->read_bits_int_be(3);
    $self->{opcode} = $self->{_io}->read_bits_int_be(4);
    $self->{is_masked} = $self->{_io}->read_bits_int_be(1);
    $self->{len_payload_primary} = $self->{_io}->read_bits_int_be(7);
    $self->{_io}->align_to_byte();
    if ($self->len_payload_primary() == 126) {
        $self->{len_payload_extended_1} = $self->{_io}->read_u2be();
    }
    if ($self->len_payload_primary() == 127) {
        $self->{len_payload_extended_2} = $self->{_io}->read_u4be();
    }
    if ($self->is_masked()) {
        $self->{mask_key} = $self->{_io}->read_u4be();
    }
}

sub len_payload {
    my ($self) = @_;
    return $self->{len_payload} if ($self->{len_payload});
    $self->{len_payload} = ($self->len_payload_primary() <= 125 ? $self->len_payload_primary() : ($self->len_payload_primary() == 126 ? $self->len_payload_extended_1() : $self->len_payload_extended_2()));
    return $self->{len_payload};
}

sub finished {
    my ($self) = @_;
    return $self->{finished};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub opcode {
    my ($self) = @_;
    return $self->{opcode};
}

sub is_masked {
    my ($self) = @_;
    return $self->{is_masked};
}

sub len_payload_primary {
    my ($self) = @_;
    return $self->{len_payload_primary};
}

sub len_payload_extended_1 {
    my ($self) = @_;
    return $self->{len_payload_extended_1};
}

sub len_payload_extended_2 {
    my ($self) = @_;
    return $self->{len_payload_extended_2};
}

sub mask_key {
    my ($self) = @_;
    return $self->{mask_key};
}

########################################################################
package Websocket::InitialFrame;

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

    $self->{header} = Websocket::FrameHeader->new($self->{_io}, $self, $self->{_root});
    if ($self->header()->opcode() != $Websocket::OPCODE_TEXT) {
        $self->{payload_bytes} = $self->{_io}->read_bytes($self->header()->len_payload());
    }
    if ($self->header()->opcode() == $Websocket::OPCODE_TEXT) {
        $self->{payload_text} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->header()->len_payload()));
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub payload_bytes {
    my ($self) = @_;
    return $self->{payload_bytes};
}

sub payload_text {
    my ($self) = @_;
    return $self->{payload_text};
}

########################################################################
package Websocket::Dataframe;

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

    $self->{header} = Websocket::FrameHeader->new($self->{_io}, $self, $self->{_root});
    if ($self->_root()->initial_frame()->header()->opcode() != $Websocket::OPCODE_TEXT) {
        $self->{payload_bytes} = $self->{_io}->read_bytes($self->header()->len_payload());
    }
    if ($self->_root()->initial_frame()->header()->opcode() == $Websocket::OPCODE_TEXT) {
        $self->{payload_text} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->header()->len_payload()));
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub payload_bytes {
    my ($self) = @_;
    return $self->{payload_bytes};
}

sub payload_text {
    my ($self) = @_;
    return $self->{payload_text};
}

1;

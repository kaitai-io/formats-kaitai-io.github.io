# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;
use RtpPacket;

########################################################################
package Rtpdump;

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

    $self->{file_header} = Rtpdump::HeaderT->new($self->{_io}, $self, $self->{_root});
    $self->{packets} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{packets}}, Rtpdump::PacketT->new($self->{_io}, $self, $self->{_root});
    }
}

sub file_header {
    my ($self) = @_;
    return $self->{file_header};
}

sub packets {
    my ($self) = @_;
    return $self->{packets};
}

########################################################################
package Rtpdump::HeaderT;

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

    $self->{shebang} = $self->{_io}->read_bytes(12);
    $self->{space} = $self->{_io}->read_bytes(1);
    $self->{ip} = Encode::decode("ascii", $self->{_io}->read_bytes_term(47, 0, 1, 1));
    $self->{port} = Encode::decode("ascii", $self->{_io}->read_bytes_term(10, 0, 1, 1));
    $self->{start_sec} = $self->{_io}->read_u4be();
    $self->{start_usec} = $self->{_io}->read_u4be();
    $self->{ip2} = $self->{_io}->read_u4be();
    $self->{port2} = $self->{_io}->read_u2be();
    $self->{padding} = $self->{_io}->read_u2be();
}

sub shebang {
    my ($self) = @_;
    return $self->{shebang};
}

sub space {
    my ($self) = @_;
    return $self->{space};
}

sub ip {
    my ($self) = @_;
    return $self->{ip};
}

sub port {
    my ($self) = @_;
    return $self->{port};
}

sub start_sec {
    my ($self) = @_;
    return $self->{start_sec};
}

sub start_usec {
    my ($self) = @_;
    return $self->{start_usec};
}

sub ip2 {
    my ($self) = @_;
    return $self->{ip2};
}

sub port2 {
    my ($self) = @_;
    return $self->{port2};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

########################################################################
package Rtpdump::PacketT;

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

    $self->{length} = $self->{_io}->read_u2be();
    $self->{len_body} = $self->{_io}->read_u2be();
    $self->{packet_usec} = $self->{_io}->read_u4be();
    $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
    my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
    $self->{body} = RtpPacket->new($io__raw_body);
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub len_body {
    my ($self) = @_;
    return $self->{len_body};
}

sub packet_usec {
    my ($self) = @_;
    return $self->{packet_usec};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

1;

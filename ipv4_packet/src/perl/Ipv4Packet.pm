# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use ProtocolBody;

########################################################################
package Ipv4Packet;

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

    $self->{b1} = $self->{_io}->read_u1();
    $self->{b2} = $self->{_io}->read_u1();
    $self->{total_length} = $self->{_io}->read_u2be();
    $self->{identification} = $self->{_io}->read_u2be();
    $self->{b67} = $self->{_io}->read_u2be();
    $self->{ttl} = $self->{_io}->read_u1();
    $self->{protocol} = $self->{_io}->read_u1();
    $self->{header_checksum} = $self->{_io}->read_u2be();
    $self->{src_ip_addr} = $self->{_io}->read_bytes(4);
    $self->{dst_ip_addr} = $self->{_io}->read_bytes(4);
    $self->{_raw_options} = $self->{_io}->read_bytes(($self->ihl_bytes() - 20));
    my $io__raw_options = IO::KaitaiStruct::Stream->new($self->{_raw_options});
    $self->{options} = Ipv4Packet::Ipv4Options->new($io__raw_options, $self, $self->{_root});
    $self->{_raw_body} = $self->{_io}->read_bytes(($self->total_length() - $self->ihl_bytes()));
    my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
    $self->{body} = ProtocolBody->new($io__raw_body);
}

sub version {
    my ($self) = @_;
    return $self->{version} if ($self->{version});
    $self->{version} = (($self->b1() & 240) >> 4);
    return $self->{version};
}

sub ihl {
    my ($self) = @_;
    return $self->{ihl} if ($self->{ihl});
    $self->{ihl} = ($self->b1() & 15);
    return $self->{ihl};
}

sub ihl_bytes {
    my ($self) = @_;
    return $self->{ihl_bytes} if ($self->{ihl_bytes});
    $self->{ihl_bytes} = ($self->ihl() * 4);
    return $self->{ihl_bytes};
}

sub b1 {
    my ($self) = @_;
    return $self->{b1};
}

sub b2 {
    my ($self) = @_;
    return $self->{b2};
}

sub total_length {
    my ($self) = @_;
    return $self->{total_length};
}

sub identification {
    my ($self) = @_;
    return $self->{identification};
}

sub b67 {
    my ($self) = @_;
    return $self->{b67};
}

sub ttl {
    my ($self) = @_;
    return $self->{ttl};
}

sub protocol {
    my ($self) = @_;
    return $self->{protocol};
}

sub header_checksum {
    my ($self) = @_;
    return $self->{header_checksum};
}

sub src_ip_addr {
    my ($self) = @_;
    return $self->{src_ip_addr};
}

sub dst_ip_addr {
    my ($self) = @_;
    return $self->{dst_ip_addr};
}

sub options {
    my ($self) = @_;
    return $self->{options};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub _raw_options {
    my ($self) = @_;
    return $self->{_raw_options};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package Ipv4Packet::Ipv4Options;

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
        push @{$self->{entries}}, Ipv4Packet::Ipv4Option->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Ipv4Packet::Ipv4Option;

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

    $self->{b1} = $self->{_io}->read_u1();
    $self->{len} = $self->{_io}->read_u1();
    $self->{body} = $self->{_io}->read_bytes(($self->len() > 2 ? ($self->len() - 2) : 0));
}

sub copy {
    my ($self) = @_;
    return $self->{copy} if ($self->{copy});
    $self->{copy} = (($self->b1() & 128) >> 7);
    return $self->{copy};
}

sub opt_class {
    my ($self) = @_;
    return $self->{opt_class} if ($self->{opt_class});
    $self->{opt_class} = (($self->b1() & 96) >> 5);
    return $self->{opt_class};
}

sub number {
    my ($self) = @_;
    return $self->{number} if ($self->{number});
    $self->{number} = ($self->b1() & 31);
    return $self->{number};
}

sub b1 {
    my ($self) = @_;
    return $self->{b1};
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

1;

# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package DnsPacket;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $CLASS_TYPE_IN_CLASS = 1;
our $CLASS_TYPE_CS = 2;
our $CLASS_TYPE_CH = 3;
our $CLASS_TYPE_HS = 4;

our $TYPE_TYPE_A = 1;
our $TYPE_TYPE_NS = 2;
our $TYPE_TYPE_MD = 3;
our $TYPE_TYPE_MF = 4;
our $TYPE_TYPE_CNAME = 5;
our $TYPE_TYPE_SOE = 6;
our $TYPE_TYPE_MB = 7;
our $TYPE_TYPE_MG = 8;
our $TYPE_TYPE_MR = 9;
our $TYPE_TYPE_NULL = 10;
our $TYPE_TYPE_WKS = 11;
our $TYPE_TYPE_PTR = 12;
our $TYPE_TYPE_HINFO = 13;
our $TYPE_TYPE_MINFO = 14;
our $TYPE_TYPE_MX = 15;
our $TYPE_TYPE_TXT = 16;

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

    $self->{transaction_id} = $self->{_io}->read_u2be();
    $self->{flags} = DnsPacket::PacketFlags->new($self->{_io}, $self, $self->{_root});
    $self->{qdcount} = $self->{_io}->read_u2be();
    $self->{ancount} = $self->{_io}->read_u2be();
    $self->{nscount} = $self->{_io}->read_u2be();
    $self->{arcount} = $self->{_io}->read_u2be();
    $self->{queries} = ();
    my $n_queries = $self->qdcount();
    for (my $i = 0; $i < $n_queries; $i++) {
        $self->{queries}[$i] = DnsPacket::Query->new($self->{_io}, $self, $self->{_root});
    }
    $self->{answers} = ();
    my $n_answers = $self->ancount();
    for (my $i = 0; $i < $n_answers; $i++) {
        $self->{answers}[$i] = DnsPacket::Answer->new($self->{_io}, $self, $self->{_root});
    }
}

sub transaction_id {
    my ($self) = @_;
    return $self->{transaction_id};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub qdcount {
    my ($self) = @_;
    return $self->{qdcount};
}

sub ancount {
    my ($self) = @_;
    return $self->{ancount};
}

sub nscount {
    my ($self) = @_;
    return $self->{nscount};
}

sub arcount {
    my ($self) = @_;
    return $self->{arcount};
}

sub queries {
    my ($self) = @_;
    return $self->{queries};
}

sub answers {
    my ($self) = @_;
    return $self->{answers};
}

########################################################################
package DnsPacket::PointerStruct;

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

    $self->{value} = $self->{_io}->read_u1();
}

sub contents {
    my ($self) = @_;
    return $self->{contents} if ($self->{contents});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->value());
    $self->{contents} = DnsPacket::DomainName->new($io, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{contents};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package DnsPacket::Label;

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

    $self->{length} = $self->{_io}->read_u1();
    if ($self->is_pointer()) {
        $self->{pointer} = DnsPacket::PointerStruct->new($self->{_io}, $self, $self->{_root});
    }
    if (!($self->is_pointer())) {
        $self->{name} = Encode::decode("ASCII", $self->{_io}->read_bytes($self->length()));
    }
}

sub is_pointer {
    my ($self) = @_;
    return $self->{is_pointer} if ($self->{is_pointer});
    $self->{is_pointer} = $self->length() == 192;
    return $self->{is_pointer};
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub pointer {
    my ($self) = @_;
    return $self->{pointer};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

########################################################################
package DnsPacket::Query;

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

    $self->{name} = DnsPacket::DomainName->new($self->{_io}, $self, $self->{_root});
    $self->{type} = $self->{_io}->read_u2be();
    $self->{query_class} = $self->{_io}->read_u2be();
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub query_class {
    my ($self) = @_;
    return $self->{query_class};
}

########################################################################
package DnsPacket::DomainName;

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

    $self->{name} = ();
    do {
        $_ = DnsPacket::Label->new($self->{_io}, $self, $self->{_root});
        push @{$self->{name}}, $_;
    } until ( (($_->length() == 0) || ($_->length() == 192)) );
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

########################################################################
package DnsPacket::Address;

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

    $self->{ip} = ();
    my $n_ip = 4;
    for (my $i = 0; $i < $n_ip; $i++) {
        $self->{ip}[$i] = $self->{_io}->read_u1();
    }
}

sub ip {
    my ($self) = @_;
    return $self->{ip};
}

########################################################################
package DnsPacket::Answer;

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

    $self->{name} = DnsPacket::DomainName->new($self->{_io}, $self, $self->{_root});
    $self->{type} = $self->{_io}->read_u2be();
    $self->{answer_class} = $self->{_io}->read_u2be();
    $self->{ttl} = $self->{_io}->read_s4be();
    $self->{rdlength} = $self->{_io}->read_u2be();
    if ($self->type() == $TYPE_TYPE_PTR) {
        $self->{ptrdname} = DnsPacket::DomainName->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->type() == $TYPE_TYPE_A) {
        $self->{address} = DnsPacket::Address->new($self->{_io}, $self, $self->{_root});
    }
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub answer_class {
    my ($self) = @_;
    return $self->{answer_class};
}

sub ttl {
    my ($self) = @_;
    return $self->{ttl};
}

sub rdlength {
    my ($self) = @_;
    return $self->{rdlength};
}

sub ptrdname {
    my ($self) = @_;
    return $self->{ptrdname};
}

sub address {
    my ($self) = @_;
    return $self->{address};
}

########################################################################
package DnsPacket::PacketFlags;

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

    $self->{flag} = $self->{_io}->read_u2be();
}

sub qr {
    my ($self) = @_;
    return $self->{qr} if ($self->{qr});
    $self->{qr} = (($self->flag() & 32768) >> 15);
    return $self->{qr};
}

sub ra {
    my ($self) = @_;
    return $self->{ra} if ($self->{ra});
    $self->{ra} = (($self->flag() & 128) >> 7);
    return $self->{ra};
}

sub tc {
    my ($self) = @_;
    return $self->{tc} if ($self->{tc});
    $self->{tc} = (($self->flag() & 512) >> 9);
    return $self->{tc};
}

sub rcode {
    my ($self) = @_;
    return $self->{rcode} if ($self->{rcode});
    $self->{rcode} = (($self->flag() & 15) >> 0);
    return $self->{rcode};
}

sub opcode {
    my ($self) = @_;
    return $self->{opcode} if ($self->{opcode});
    $self->{opcode} = (($self->flag() & 30720) >> 11);
    return $self->{opcode};
}

sub aa {
    my ($self) = @_;
    return $self->{aa} if ($self->{aa});
    $self->{aa} = (($self->flag() & 1024) >> 10);
    return $self->{aa};
}

sub z {
    my ($self) = @_;
    return $self->{z} if ($self->{z});
    $self->{z} = (($self->flag() & 64) >> 6);
    return $self->{z};
}

sub rd {
    my ($self) = @_;
    return $self->{rd} if ($self->{rd});
    $self->{rd} = (($self->flag() & 256) >> 8);
    return $self->{rd};
}

sub cd {
    my ($self) = @_;
    return $self->{cd} if ($self->{cd});
    $self->{cd} = (($self->flag() & 16) >> 4);
    return $self->{cd};
}

sub ad {
    my ($self) = @_;
    return $self->{ad} if ($self->{ad});
    $self->{ad} = (($self->flag() & 32) >> 5);
    return $self->{ad};
}

sub flag {
    my ($self) = @_;
    return $self->{flag};
}

1;

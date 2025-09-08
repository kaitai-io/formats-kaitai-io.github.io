# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package Asn1Der;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $TYPE_TAG_END_OF_CONTENT = 0;
our $TYPE_TAG_BOOLEAN = 1;
our $TYPE_TAG_INTEGER = 2;
our $TYPE_TAG_BIT_STRING = 3;
our $TYPE_TAG_OCTET_STRING = 4;
our $TYPE_TAG_NULL_VALUE = 5;
our $TYPE_TAG_OBJECT_ID = 6;
our $TYPE_TAG_OBJECT_DESCRIPTOR = 7;
our $TYPE_TAG_EXTERNAL = 8;
our $TYPE_TAG_REAL = 9;
our $TYPE_TAG_ENUMERATED = 10;
our $TYPE_TAG_EMBEDDED_PDV = 11;
our $TYPE_TAG_UTF8STRING = 12;
our $TYPE_TAG_RELATIVE_OID = 13;
our $TYPE_TAG_SEQUENCE_10 = 16;
our $TYPE_TAG_PRINTABLE_STRING = 19;
our $TYPE_TAG_IA5STRING = 22;
our $TYPE_TAG_SEQUENCE_30 = 48;
our $TYPE_TAG_SET = 49;

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

    $self->{type_tag} = $self->{_io}->read_u1();
    $self->{len} = Asn1Der::LenEncoded->new($self->{_io}, $self, $self->{_root});
    my $_on = $self->type_tag();
    if ($_on == $Asn1Der::TYPE_TAG_OBJECT_ID) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len()->result());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Asn1Der::BodyObjectId->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $Asn1Der::TYPE_TAG_PRINTABLE_STRING) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len()->result());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Asn1Der::BodyPrintableString->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $Asn1Der::TYPE_TAG_SEQUENCE_10) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len()->result());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Asn1Der::BodySequence->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $Asn1Der::TYPE_TAG_SEQUENCE_30) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len()->result());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Asn1Der::BodySequence->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $Asn1Der::TYPE_TAG_SET) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len()->result());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Asn1Der::BodySequence->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $Asn1Der::TYPE_TAG_UTF8STRING) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len()->result());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Asn1Der::BodyUtf8string->new($io__raw_body, $self, $self->{_root});
    }
    else {
        $self->{body} = $self->{_io}->read_bytes($self->len()->result());
    }
}

sub type_tag {
    my ($self) = @_;
    return $self->{type_tag};
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package Asn1Der::BodyObjectId;

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

    $self->{first_and_second} = $self->{_io}->read_u1();
    $self->{rest} = $self->{_io}->read_bytes_full();
}

sub first {
    my ($self) = @_;
    return $self->{first} if ($self->{first});
    $self->{first} = int($self->first_and_second() / 40);
    return $self->{first};
}

sub second {
    my ($self) = @_;
    return $self->{second} if ($self->{second});
    $self->{second} = $self->first_and_second() % 40;
    return $self->{second};
}

sub first_and_second {
    my ($self) = @_;
    return $self->{first_and_second};
}

sub rest {
    my ($self) = @_;
    return $self->{rest};
}

########################################################################
package Asn1Der::BodyPrintableString;

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

    $self->{str} = Encode::decode("ASCII", $self->{_io}->read_bytes_full());
}

sub str {
    my ($self) = @_;
    return $self->{str};
}

########################################################################
package Asn1Der::BodySequence;

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

    $self->{entries} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Asn1Der->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Asn1Der::BodyUtf8string;

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

    $self->{str} = Encode::decode("UTF-8", $self->{_io}->read_bytes_full());
}

sub str {
    my ($self) = @_;
    return $self->{str};
}

########################################################################
package Asn1Der::LenEncoded;

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

    $self->{b1} = $self->{_io}->read_u1();
    if ($self->b1() == 130) {
        $self->{int2} = $self->{_io}->read_u2be();
    }
    if ($self->b1() == 129) {
        $self->{int1} = $self->{_io}->read_u1();
    }
}

sub result {
    my ($self) = @_;
    return $self->{result} if ($self->{result});
    $self->{result} = ($self->b1() == 129 ? $self->int1() : ($self->b1() == 130 ? $self->int2() : $self->b1()));
    return $self->{result};
}

sub b1 {
    my ($self) = @_;
    return $self->{b1};
}

sub int2 {
    my ($self) = @_;
    return $self->{int2};
}

sub int1 {
    my ($self) = @_;
    return $self->{int1};
}

1;

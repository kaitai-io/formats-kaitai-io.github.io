# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package Utf8String;

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

    $self->{codepoints} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{codepoints}}, Utf8String::Utf8Codepoint->new($self->{_io}, $self, $self->{_root});
    }
}

sub codepoints {
    my ($self) = @_;
    return $self->{codepoints};
}

########################################################################
package Utf8String::Utf8Codepoint;

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

    $self->{byte1} = $self->{_io}->read_u1();
    if ($self->len() >= 2) {
        $self->{byte2} = $self->{_io}->read_u1();
    }
    if ($self->len() >= 3) {
        $self->{byte3} = $self->{_io}->read_u1();
    }
    if ($self->len() >= 4) {
        $self->{byte4} = $self->{_io}->read_u1();
    }
}

sub raw1 {
    my ($self) = @_;
    return $self->{raw1} if ($self->{raw1});
    $self->{raw1} = ($self->byte1() & ($self->len() == 1 ? 127 : ($self->len() == 2 ? 31 : ($self->len() == 3 ? 15 : ($self->len() == 4 ? 7 : 0)))));
    return $self->{raw1};
}

sub raw4 {
    my ($self) = @_;
    return $self->{raw4} if ($self->{raw4});
    if ($self->len() >= 4) {
        $self->{raw4} = ($self->byte4() & 63);
    }
    return $self->{raw4};
}

sub raw3 {
    my ($self) = @_;
    return $self->{raw3} if ($self->{raw3});
    if ($self->len() >= 3) {
        $self->{raw3} = ($self->byte3() & 63);
    }
    return $self->{raw3};
}

sub value_as_int {
    my ($self) = @_;
    return $self->{value_as_int} if ($self->{value_as_int});
    $self->{value_as_int} = ($self->len() == 1 ? $self->raw1() : ($self->len() == 2 ? (($self->raw1() << 6) | $self->raw2()) : ($self->len() == 3 ? ((($self->raw1() << 12) | ($self->raw2() << 6)) | $self->raw3()) : ($self->len() == 4 ? (((($self->raw1() << 18) | ($self->raw2() << 12)) | ($self->raw3() << 6)) | $self->raw4()) : -1))));
    return $self->{value_as_int};
}

sub raw2 {
    my ($self) = @_;
    return $self->{raw2} if ($self->{raw2});
    if ($self->len() >= 2) {
        $self->{raw2} = ($self->byte2() & 63);
    }
    return $self->{raw2};
}

sub len {
    my ($self) = @_;
    return $self->{len} if ($self->{len});
    $self->{len} = (($self->byte1() & 128) == 0 ? 1 : (($self->byte1() & 224) == 192 ? 2 : (($self->byte1() & 240) == 224 ? 3 : (($self->byte1() & 248) == 240 ? 4 : -1))));
    return $self->{len};
}

sub byte1 {
    my ($self) = @_;
    return $self->{byte1};
}

sub byte2 {
    my ($self) = @_;
    return $self->{byte2};
}

sub byte3 {
    my ($self) = @_;
    return $self->{byte3};
}

sub byte4 {
    my ($self) = @_;
    return $self->{byte4};
}

1;

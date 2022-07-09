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

    $self->{bytes} = $self->{_io}->read_bytes($self->len_bytes());
}

sub raw1 {
    my ($self) = @_;
    return $self->{raw1} if ($self->{raw1});
    if ($self->len_bytes() >= 2) {
        $self->{raw1} = (unpack('C', substr($self->bytes(), 1, 1)) & 63);
    }
    return $self->{raw1};
}

sub len_bytes {
    my ($self) = @_;
    return $self->{len_bytes} if ($self->{len_bytes});
    $self->{len_bytes} = (($self->byte0() & 128) == 0 ? 1 : (($self->byte0() & 224) == 192 ? 2 : (($self->byte0() & 240) == 224 ? 3 : (($self->byte0() & 248) == 240 ? 4 : -1))));
    return $self->{len_bytes};
}

sub raw3 {
    my ($self) = @_;
    return $self->{raw3} if ($self->{raw3});
    if ($self->len_bytes() >= 4) {
        $self->{raw3} = (unpack('C', substr($self->bytes(), 3, 1)) & 63);
    }
    return $self->{raw3};
}

sub value_as_int {
    my ($self) = @_;
    return $self->{value_as_int} if ($self->{value_as_int});
    $self->{value_as_int} = ($self->len_bytes() == 1 ? $self->raw0() : ($self->len_bytes() == 2 ? (($self->raw0() << 6) | $self->raw1()) : ($self->len_bytes() == 3 ? ((($self->raw0() << 12) | ($self->raw1() << 6)) | $self->raw2()) : ($self->len_bytes() == 4 ? (((($self->raw0() << 18) | ($self->raw1() << 12)) | ($self->raw2() << 6)) | $self->raw3()) : -1))));
    return $self->{value_as_int};
}

sub raw0 {
    my ($self) = @_;
    return $self->{raw0} if ($self->{raw0});
    $self->{raw0} = (unpack('C', substr($self->bytes(), 0, 1)) & ($self->len_bytes() == 1 ? 127 : ($self->len_bytes() == 2 ? 31 : ($self->len_bytes() == 3 ? 15 : ($self->len_bytes() == 4 ? 7 : 0)))));
    return $self->{raw0};
}

sub byte0 {
    my ($self) = @_;
    return $self->{byte0} if ($self->{byte0});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs());
    $self->{byte0} = $self->{_io}->read_u1();
    $self->{_io}->seek($_pos);
    return $self->{byte0};
}

sub raw2 {
    my ($self) = @_;
    return $self->{raw2} if ($self->{raw2});
    if ($self->len_bytes() >= 3) {
        $self->{raw2} = (unpack('C', substr($self->bytes(), 2, 1)) & 63);
    }
    return $self->{raw2};
}

sub bytes {
    my ($self) = @_;
    return $self->{bytes};
}

sub ofs {
    my ($self) = @_;
    return $self->{ofs};
}

1;
